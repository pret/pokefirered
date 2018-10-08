	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A22E8
sub_80A22E8: @ 80A22E8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080A231C @ =gUnknown_2037F02
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
	ldr r0, _080A2320 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A2324
	ldrh r0, [r5, 0x8]
	negs r0, r0
	b _080A2326
	.align 2, 0
_080A231C: .4byte gUnknown_2037F02
_080A2320: .4byte gUnknown_2037F1A
_080A2324:
	ldrh r0, [r5, 0x8]
_080A2326:
	strh r0, [r4, 0x34]
	ldr r0, _080A2338 @ =gUnknown_2037F02
	ldrh r0, [r0, 0xA]
	strh r0, [r4, 0x36]
	ldr r0, _080A233C @ =sub_80A2340
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2338: .4byte gUnknown_2037F02
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
	ldr r0, _080A23C8 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r5, _080A23CC @ =gUnknown_2037F1A
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
_080A23C8: .4byte gUnknown_2037F02
_080A23CC: .4byte gUnknown_2037F1A
_080A23D0: .4byte sub_8075590
_080A23D4: .4byte move_anim_8074EE0
	thumb_func_end sub_80A2388

	thumb_func_start sub_80A23D8
sub_80A23D8: @ 80A23D8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r5, _080A2420 @ =gUnknown_2037F02
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldr r5, _080A2424 @ =gUnknown_2037F1B
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
_080A2420: .4byte gUnknown_2037F02
_080A2424: .4byte gUnknown_2037F1B
_080A2428: .4byte sub_8075590
_080A242C: .4byte DestroyAnimSprite
	thumb_func_end sub_80A23D8

	thumb_func_start sub_80A2430
sub_80A2430: @ 80A2430
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r6, _080A2480 @ =gUnknown_2037F02
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080A2484 @ =gUnknown_2037F1B
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
_080A2480: .4byte gUnknown_2037F02
_080A2484: .4byte gUnknown_2037F1B
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
	ldr r0, _080A24B8 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl sub_807685C
	adds r0, 0x1
	b _080A24C6
	.align 2, 0
_080A24B8: .4byte gUnknown_2037F1B
_080A24BC:
	ldr r0, _080A24FC @ =gUnknown_2037F1B
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
_080A24FC: .4byte gUnknown_2037F1B
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
	ldr r1, _080A2574 @ =gUnknown_2037F02
	movs r0, 0xF
	strh r0, [r1]
	strh r2, [r1, 0x2]
	movs r0, 0x50
	strh r0, [r1, 0x4]
	strh r2, [r1, 0x6]
	ldr r4, _080A2578 @ =gUnknown_83E2A88
	ldr r0, _080A257C @ =gUnknown_2037F1B
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
_080A2574: .4byte gUnknown_2037F02
_080A2578: .4byte gUnknown_83E2A88
_080A257C: .4byte gUnknown_2037F1B
	thumb_func_end sub_80A2500

	thumb_func_start sub_80A2580
sub_80A2580: @ 80A2580
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r6, _080A25C4 @ =gUnknown_2037F02
	ldrh r0, [r6, 0x6]
	strh r0, [r4, 0x2E]
	ldr r5, _080A25C8 @ =gUnknown_2037F1A
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
_080A25C4: .4byte gUnknown_2037F02
_080A25C8: .4byte gUnknown_2037F1A
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
	ldr r4, _080A2634 @ =gUnknown_2037F1A
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
_080A2634: .4byte gUnknown_2037F1A
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
	ldr r4, _080A269C @ =gUnknown_2037F1B
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
_080A269C: .4byte gUnknown_2037F1B
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
	ldr r0, _080A2750 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A2710
	ldr r1, _080A2754 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A2710:
	ldr r4, _080A2754 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080A2758 @ =gUnknown_2037F1B
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
_080A2750: .4byte gUnknown_2037F1A
_080A2754: .4byte gUnknown_2037F02
_080A2758: .4byte gUnknown_2037F1B
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
	ldr r5, _080A2814 @ =gUnknown_2037F02
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
_080A2814: .4byte gUnknown_2037F02
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
	ldr r0, _080A286C @ =gUnknown_2037F1B
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
_080A286C: .4byte gUnknown_2037F1B
_080A2870:
	ldr r0, _080A28C0 @ =gUnknown_2037F1B
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
_080A28C0: .4byte gUnknown_2037F1B
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
	ldr r0, _080A2904 @ =gUnknown_2037F1B
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
_080A2904: .4byte gUnknown_2037F1B
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
	ldr r5, _080A2968 @ =gUnknown_2037F02
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldr r0, _080A296C @ =gUnknown_2037F1A
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
_080A2968: .4byte gUnknown_2037F02
_080A296C: .4byte gUnknown_2037F1A
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
	ldr r0, _080A29BC @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_807685C
	subs r0, 0x1
	b _080A29CA
	.align 2, 0
_080A29BC: .4byte gUnknown_2037F1A
_080A29C0:
	ldr r0, _080A29DC @ =gUnknown_2037F1A
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
_080A29DC: .4byte gUnknown_2037F1A
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
	ldr r5, _080A2A34 @ =gUnknown_2037F02
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldr r0, _080A2A38 @ =gUnknown_2037F1A
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
_080A2A34: .4byte gUnknown_2037F02
_080A2A38: .4byte gUnknown_2037F1A
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
	ldr r5, _080A2AE0 @ =gUnknown_2037F1A
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
	ldr r1, _080A2AE4 @ =gUnknown_2037F02
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
_080A2AE0: .4byte gUnknown_2037F1A
_080A2AE4: .4byte gUnknown_2037F02
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
	ldr r0, _080A2B58 @ =gUnknown_2037F1A
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
_080A2B58: .4byte gUnknown_2037F1A
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
	ldr r0, _080A2BF0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A2BBC
	ldr r1, _080A2BF4 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A2BBC:
	ldr r6, _080A2BF4 @ =gUnknown_2037F02
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A2BFC
	ldr r4, _080A2BF8 @ =gUnknown_2037F1B
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
_080A2BF0: .4byte gUnknown_2037F1A
_080A2BF4: .4byte gUnknown_2037F02
_080A2BF8: .4byte gUnknown_2037F1B
_080A2BFC:
	ldr r0, _080A2C48 @ =gUnknown_2037F1B
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
	ldr r0, _080A2C4C @ =gUnknown_2037F02
	ldrh r0, [r0, 0xA]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_8075068
	ldr r0, _080A2C50 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080A2C48 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080A2C54
	movs r0, 0x1
	b _080A2C56
	.align 2, 0
_080A2C48: .4byte gUnknown_2037F1B
_080A2C4C: .4byte gUnknown_2037F02
_080A2C50: .4byte gUnknown_2037F1A
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
	ldr r0, _080A2D64 @ =gUnknown_2037F1B
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
	ldr r1, _080A2D68 @ =gUnknown_2037F02
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
_080A2D64: .4byte gUnknown_2037F1B
_080A2D68: .4byte gUnknown_2037F02
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
	ldr r0, _080A2DE8 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl sub_8076884
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	b _080A2DFA
	.align 2, 0
_080A2DE8: .4byte gUnknown_2037F1B
_080A2DEC:
	ldr r0, _080A2E24 @ =gUnknown_2037F1B
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
_080A2E24: .4byte gUnknown_2037F1B
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
	ldr r4, _080A2E5C @ =gUnknown_2037F02
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
_080A2E5C: .4byte gUnknown_2037F02
_080A2E60: .4byte sub_80A2E64
	thumb_func_end sub_80A2E28

	thumb_func_start sub_80A2E64
sub_80A2E64: @ 80A2E64
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A2E94 @ =gUnknown_2037F02
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
_080A2E94: .4byte gUnknown_2037F02
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
	ldr r2, _080A2F6C @ =gUnknown_2037F02
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
_080A2F6C: .4byte gUnknown_2037F02
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
	ldr r0, _080A2FFC @ =gUnknown_2037F1B
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
_080A2FFC: .4byte gUnknown_2037F1B
_080A3000: .4byte sub_80A3004
	thumb_func_end sub_80A2F74

	thumb_func_start sub_80A3004
sub_80A3004: @ 80A3004
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080A3050 @ =gUnknown_2037F02
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
_080A3050: .4byte gUnknown_2037F02
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
	ldr r6, _080A30FC @ =gUnknown_2037F1B
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A30C2
	ldr r1, _080A3100 @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
_080A30C2:
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080A3100 @ =gUnknown_2037F02
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
_080A30FC: .4byte gUnknown_2037F1B
_080A3100: .4byte gUnknown_2037F02
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
	ldr r4, _080A315C @ =gUnknown_2037F1A
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
_080A315C: .4byte gUnknown_2037F1A
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
	ldr r4, _080A31E0 @ =gUnknown_2037F1A
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
	ldr r4, _080A31E4 @ =gUnknown_2037F02
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
_080A31E0: .4byte gUnknown_2037F1A
_080A31E4: .4byte gUnknown_2037F02
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
	ldr r4, _080A32C8 @ =gUnknown_2037F1A
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
	ldr r6, _080A32CC @ =gUnknown_2037F1B
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
	ldr r6, _080A32D0 @ =gUnknown_2037F02
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
_080A32C8: .4byte gUnknown_2037F1A
_080A32CC: .4byte gUnknown_2037F1B
_080A32D0: .4byte gUnknown_2037F02
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
	ldr r5, _080A33B0 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080A33B4 @ =gUnknown_2037F02
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
_080A33B0: .4byte gUnknown_2037F1A
_080A33B4: .4byte gUnknown_2037F02
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
	ldr r4, _080A3560 @ =gUnknown_2037F1B
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
	ldr r0, _080A3564 @ =gUnknown_2037F1A
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
_080A3560: .4byte gUnknown_2037F1B
_080A3564: .4byte gUnknown_2037F1A
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
	ldr r4, _080A3630 @ =gUnknown_2037F1B
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
_080A3630: .4byte gUnknown_2037F1B
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
	ldr r0, _080A36B0 @ =gUnknown_2037F02
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
_080A36B0: .4byte gUnknown_2037F02
	thumb_func_end sub_80A3670

	thumb_func_start sub_80A36B4
sub_80A36B4: @ 80A36B4
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_8075114
	ldr r4, _080A36FC @ =gUnknown_2037F1A
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
	ldr r0, _080A3700 @ =gUnknown_2037F1B
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
_080A36FC: .4byte gUnknown_2037F1A
_080A3700: .4byte gUnknown_2037F1B
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
	ldr r0, _080A37E0 @ =gUnknown_2037F02
	ldrh r1, [r0, 0x2]
	strh r1, [r4, 0x30]
	movs r1, 0x78
	strh r1, [r4, 0x20]
	adds r5, r0, 0
	b _080A3806
	.align 2, 0
_080A37E0: .4byte gUnknown_2037F02
_080A37E4:
	ldr r0, _080A3840 @ =gUnknown_2037F02
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
_080A3840: .4byte gUnknown_2037F02
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
	ldr r4, _080A3B18 @ =gUnknown_2037F1B
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
_080A3B18: .4byte gUnknown_2037F1B
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
	ldr r0, _080A4054 @ =gUnknown_2037F02
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A405C
	ldr r0, _080A4058 @ =gUnknown_2037F1A
	b _080A405E
	.align 2, 0
_080A4054: .4byte gUnknown_2037F02
_080A4058: .4byte gUnknown_2037F1A
_080A405C:
	ldr r0, _080A407C @ =gUnknown_2037F1B
_080A405E:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A4088
	movs r0, 0
	strh r0, [r4, 0x36]
	ldr r1, _080A4080 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x32]
	ldr r0, _080A4084 @ =0x0000fff0
	b _080A4098
	.align 2, 0
_080A407C: .4byte gUnknown_2037F1B
_080A4080: .4byte gUnknown_2037F02
_080A4084: .4byte 0x0000fff0
_080A4088:
	movs r0, 0x1
	strh r0, [r4, 0x36]
	ldr r1, _080A40BC @ =gUnknown_2037F02
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
_080A40BC: .4byte gUnknown_2037F02
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
	ldr r0, _080A4144 @ =gUnknown_2037F1B
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
_080A4144: .4byte gUnknown_2037F1B
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
	ldr r1, _080A41A0 @ =gUnknown_825E074
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
_080A41A0: .4byte gUnknown_825E074
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
	ldr r0, _080A4294 @ =gUnknown_2037F02
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
_080A4294: .4byte gUnknown_2037F02
	thumb_func_end sub_80A41C4

	thumb_func_start sub_80A4298
sub_80A4298: @ 80A4298
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r1, _080A42B0 @ =gUnknown_2037F02
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080A42B4
	adds r0, r6, 0
	bl DestroyAnimSprite
	b _080A438E
	.align 2, 0
_080A42B0: .4byte gUnknown_2037F02
_080A42B4:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080A42C4
	ldr r4, _080A42C0 @ =gUnknown_2037F1A
	b _080A42C6
	.align 2, 0
_080A42C0: .4byte gUnknown_2037F1A
_080A42C4:
	ldr r4, _080A4300 @ =gUnknown_2037F1B
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
	ldr r0, _080A4304 @ =gUnknown_2037F02
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
_080A4300: .4byte gUnknown_2037F1B
_080A4304: .4byte gUnknown_2037F02
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
	ldr r0, _080A4418 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A4420
	ldr r2, _080A441C @ =gUnknown_2037F02
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	b _080A442C
	.align 2, 0
_080A4418: .4byte gUnknown_2037F1A
_080A441C: .4byte gUnknown_2037F02
_080A4420:
	ldr r0, _080A4444 @ =gUnknown_2037F02
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
_080A4444: .4byte gUnknown_2037F02
_080A4448: .4byte sub_8074F6C
_080A444C: .4byte DestroyAnimSprite
	thumb_func_end sub_80A43F8

	thumb_func_start sub_80A4450
sub_80A4450: @ 80A4450
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080A4488 @ =gUnknown_2037F1A
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
	ldr r4, _080A4490 @ =gUnknown_2037F02
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
_080A4488: .4byte gUnknown_2037F1A
_080A448C: .4byte sub_80A43DC
_080A4490: .4byte gUnknown_2037F02
	thumb_func_end sub_80A4450

	thumb_func_start sub_80A4494
sub_80A4494: @ 80A4494
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080A44D4 @ =gUnknown_2037F02
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
_080A44D4: .4byte gUnknown_2037F02
_080A44D8: .4byte move_anim_8074EE0
_080A44DC: .4byte sub_8074E70
	thumb_func_end sub_80A4494

	thumb_func_start sub_80A44E0
sub_80A44E0: @ 80A44E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080A4530 @ =gUnknown_2037F1B
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
	ldr r0, _080A4538 @ =gUnknown_2037F02
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
_080A4530: .4byte gUnknown_2037F1B
_080A4534: .4byte sub_80A46CC
_080A4538: .4byte gUnknown_2037F02
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
	ldr r0, _080A45A4 @ =gUnknown_2037F02
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
_080A45A4: .4byte gUnknown_2037F02
_080A45A8:
	ldr r5, _080A45C4 @ =gUnknown_2037F1B
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
_080A45C4: .4byte gUnknown_2037F1B
_080A45C8:
	ldr r5, _080A4620 @ =gUnknown_2037F1B
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
_080A4620: .4byte gUnknown_2037F1B
_080A4624:
	ldr r4, _080A4670 @ =gUnknown_2037F1B
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
	ldr r0, _080A4670 @ =gUnknown_2037F1B
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
	ldr r0, _080A4678 @ =gUnknown_2037F02
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
_080A4670: .4byte gUnknown_2037F1B
_080A4674: .4byte sub_80A46CC
_080A4678: .4byte gUnknown_2037F02
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
	ldr r4, _080A483C @ =gUnknown_2037F02
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080A4840 @ =gUnknown_2037F1A
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
_080A483C: .4byte gUnknown_2037F02
_080A4840: .4byte gUnknown_2037F1A
_080A4844:
	ldrh r0, [r4]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080A484A:
	strh r0, [r5, 0x20]
	ldr r4, _080A4878 @ =gUnknown_2037F02
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
_080A4878: .4byte gUnknown_2037F02
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
	ldr r1, _080A4964 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	adds r0, 0x8
	strh r0, [r1, 0x2]
_080A4906:
	ldr r6, _080A4968 @ =gUnknown_2037F1A
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8074844
	lsls r0, 24
	ldr r4, _080A4964 @ =gUnknown_2037F02
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
_080A4964: .4byte gUnknown_2037F02
_080A4968: .4byte gUnknown_2037F1A
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
	ldr r0, _080A49C8 @ =gUnknown_2037F02
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
_080A49C8: .4byte gUnknown_2037F02
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
	ldr r1, _080A4A7C @ =gUnknown_20375F8
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
_080A4A7C: .4byte gUnknown_20375F8
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
	ldr r6, _080A4B2C @ =gUnknown_2037F1B
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
_080A4B2C: .4byte gUnknown_2037F1B
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
	ldr r5, _080A4D50 @ =gUnknown_2037F02
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
_080A4D50: .4byte gUnknown_2037F02
_080A4D54: .4byte DestroyAnimSprite
_080A4D58: .4byte sub_8074D00
	thumb_func_end sub_80A4D0C

	thumb_func_start sub_80A4D5C
sub_80A4D5C: @ 80A4D5C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080A4D70 @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A4D78
	ldr r0, _080A4D74 @ =gUnknown_2037F1A
	b _080A4D7A
	.align 2, 0
_080A4D70: .4byte gUnknown_2037F02
_080A4D74: .4byte gUnknown_2037F1A
_080A4D78:
	ldr r0, _080A4DBC @ =gUnknown_2037F1B
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
	ldr r4, _080A4DC0 @ =gUnknown_2037F02
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
_080A4DBC: .4byte gUnknown_2037F1B
_080A4DC0: .4byte gUnknown_2037F02
_080A4DC4:
	ldr r4, _080A4DE4 @ =gUnknown_2037F02
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
_080A4DE4: .4byte gUnknown_2037F02
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
	ldr r0, _080A4E34 @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r0, r5, 0
	bl sub_8074FF8
_080A4E14:
	ldr r1, _080A4E34 @ =gUnknown_2037F02
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
_080A4E34: .4byte gUnknown_2037F02
_080A4E38: .4byte DestroyAnimSprite
_080A4E3C: .4byte sub_8074D00
	thumb_func_end sub_80A4D5C

	thumb_func_start sub_80A4E40
sub_80A4E40: @ 80A4E40
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _080A4E6C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A4E74
	ldr r0, _080A4E70 @ =gUnknown_2037F02
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
_080A4E6C: .4byte gUnknown_2037F1A
_080A4E70: .4byte gUnknown_2037F02
_080A4E74:
	ldr r2, _080A4E98 @ =gUnknown_2037F02
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
_080A4E98: .4byte gUnknown_2037F02
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
	ldr r0, _080A4F24 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A4F2C
	ldr r1, _080A4F28 @ =gUnknown_2037F02
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
_080A4F24: .4byte gUnknown_2037F1A
_080A4F28: .4byte gUnknown_2037F02
_080A4F2C:
	ldr r2, _080A4F54 @ =gUnknown_2037F02
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
_080A4F54: .4byte gUnknown_2037F02
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
	ldr r4, _080A5168 @ =gUnknown_2037F1B
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
_080A5168: .4byte gUnknown_2037F1B
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
	ldr r2, _080A5204 @ =gUnknown_2037408
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
_080A5204: .4byte gUnknown_2037408
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
	ldr r0, _080A523C @ =gUnknown_2037F02
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
_080A523C: .4byte gUnknown_2037F02
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
	ldr r0, _080A52B8 @ =gUnknown_2037F02
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
_080A52B8: .4byte gUnknown_2037F02
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
	ldr r0, _080A5368 @ =gUnknown_2037F02
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
_080A5368: .4byte gUnknown_2037F02
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
	ldr r5, _080A53D8 @ =gUnknown_2037F1A
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
_080A53D8: .4byte gUnknown_2037F1A
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
	ldr r4, _080A5468 @ =gUnknown_2037F1A
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
_080A5468: .4byte gUnknown_2037F1A
_080A546C: .4byte 0xfffffd00
_080A5470: .4byte sub_80A5584
	thumb_func_end sub_80A53E8

	thumb_func_start sub_80A5474
sub_80A5474: @ 80A5474
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	ldr r5, _080A54B4 @ =gUnknown_2037F1A
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
_080A54B4: .4byte gUnknown_2037F1A
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
	ldr r4, _080A5528 @ =gUnknown_2037F1A
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
_080A5528: .4byte gUnknown_2037F1A
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
	ldr r2, _080A5644 @ =gUnknown_2037F1A
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
_080A5644: .4byte gUnknown_2037F1A
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
	ldr r2, _080A56E0 @ =gUnknown_2037F1A
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
	ldr r0, _080A56E4 @ =gUnknown_2037F02
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
_080A56E0: .4byte gUnknown_2037F1A
_080A56E4: .4byte gUnknown_2037F02
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
	ldr r6, _080A5954 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A595C
	ldr r4, _080A5958 @ =gUnknown_2037F1A
	b _080A595E
	.align 2, 0
_080A5954: .4byte gUnknown_2037F02
_080A5958: .4byte gUnknown_2037F1A
_080A595C:
	ldr r4, _080A599C @ =gUnknown_2037F1B
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
_080A599C: .4byte gUnknown_2037F1B
_080A59A0: .4byte sub_80A5A8C
_080A59A4: .4byte sub_8074F6C
	thumb_func_end sub_80A5940

	thumb_func_start sub_80A59A8
sub_80A59A8: @ 80A59A8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080A59E0 @ =gUnknown_2037F1B
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
_080A59E0: .4byte gUnknown_2037F1B
_080A59E4: .4byte 0x0000ffd0
_080A59E8: .4byte sub_80A5A44
_080A59EC: .4byte sub_8074F6C
	thumb_func_end sub_80A59A8

	thumb_func_start sub_80A59F0
sub_80A59F0: @ 80A59F0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080A5A34 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A5A38 @ =gUnknown_2037F02
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
_080A5A34: .4byte gUnknown_2037F1B
_080A5A38: .4byte gUnknown_2037F02
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
	ldr r6, _080A5AEC @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A5AF4
	ldr r4, _080A5AF0 @ =gUnknown_2037F1A
	b _080A5AF6
	.align 2, 0
_080A5AEC: .4byte gUnknown_2037F02
_080A5AF0: .4byte gUnknown_2037F1A
_080A5AF4:
	ldr r4, _080A5B30 @ =gUnknown_2037F1B
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
	ldr r0, _080A5B34 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x6]
	strh r0, [r5, 0x30]
	ldr r0, _080A5B38 @ =sub_80A5B3C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5B30: .4byte gUnknown_2037F1B
_080A5B34: .4byte gUnknown_2037F02
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
	ldr r6, _080A5BC4 @ =gUnknown_2037F1A
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
_080A5BC4: .4byte gUnknown_2037F1A
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
	ldr r4, _080A5CC8 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	ldr r5, _080A5CCC @ =gUnknown_2037F02
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
	ldr r0, _080A5CCC @ =gUnknown_2037F02
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
_080A5CC8: .4byte gUnknown_2037F1A
_080A5CCC: .4byte gUnknown_2037F02
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
	ldr r1, _080A5CF8 @ =gUnknown_2037F02
	ldr r0, _080A5CFC @ =0x0000ffff
	strh r0, [r1, 0xE]
	b _080A5D3E
	.align 2, 0
_080A5CF4: .4byte gTasks
_080A5CF8: .4byte gUnknown_2037F02
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
	ldr r0, _080A5D74 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080A5D78 @ =sub_80A5D7C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5D74: .4byte gUnknown_2037F02
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
	ldr r4, _080A5DD4 @ =gUnknown_2037F1A
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
_080A5DD4: .4byte gUnknown_2037F1A
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
	ldr r6, _080A5EA0 @ =gUnknown_2037F02
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
_080A5EA0: .4byte gUnknown_2037F02
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
	ldr r0, _080A5F20 @ =gUnknown_2037F02
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
_080A5F20: .4byte gUnknown_2037F02
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
	ldr r0, _080A5F78 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r2, _080A5F7C @ =gUnknown_2037F02
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
_080A5F78: .4byte gUnknown_2037F1A
_080A5F7C: .4byte gUnknown_2037F02
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
	ldr r2, _080A6190 @ =gUnknown_20375F8
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
_080A6190: .4byte gUnknown_20375F8
_080A6194:
	ldr r0, _080A61DC @ =gUnknown_2037AB8
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
_080A61DC: .4byte gUnknown_2037AB8
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
	ldr r0, _080A6240 @ =gUnknown_2037AB8
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
_080A6240: .4byte gUnknown_2037AB8
	thumb_func_end sub_80A60A8

	thumb_func_start sub_80A6244
sub_80A6244: @ 80A6244
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080A62C8 @ =gUnknown_2037F02
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
	ldr r4, _080A62CC @ =gUnknown_2037F1B
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
_080A62C8: .4byte gUnknown_2037F02
_080A62CC: .4byte gUnknown_2037F1B
_080A62D0: .4byte 0xffffec00
_080A62D4:
	ldr r0, _080A6314 @ =gUnknown_2037F1A
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
_080A6314: .4byte gUnknown_2037F1A
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
	ldr r2, _080A6450 @ =gUnknown_20371F8
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
_080A6450: .4byte gUnknown_20371F8
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
	ldr r0, _080A64C4 @ =gUnknown_2037F1A
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
_080A64C4: .4byte gUnknown_2037F1A
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
	ldr r0, _080A6518 @ =gUnknown_2037F1A
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
_080A6518: .4byte gUnknown_2037F1A
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
	ldr r4, _080A65C8 @ =gUnknown_825E074
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
_080A65C8: .4byte gUnknown_825E074
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
	ldr r5, _080A669C @ =gUnknown_20375F8
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
	ldr r7, _080A669C @ =gUnknown_20375F8
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
_080A669C: .4byte gUnknown_20375F8
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
	ldr r4, _080A672C @ =gUnknown_2037F02
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
_080A672C: .4byte gUnknown_2037F02
_080A6730: .4byte gUnknown_83E3898
_080A6734:
	ldr r4, _080A6784 @ =gUnknown_2037F1B
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
_080A6784: .4byte gUnknown_2037F1B
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
	ldr r7, _080A6934 @ =gUnknown_2037F1A
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A68CE
	ldr r1, _080A6938 @ =gUnknown_2037F02
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080A68CE:
	ldrb r0, [r7]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080A6938 @ =gUnknown_2037F02
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
_080A6934: .4byte gUnknown_2037F1A
_080A6938: .4byte gUnknown_2037F02
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
	ldr r0, _080A69D8 @ =gUnknown_2037F02
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
_080A69D8: .4byte gUnknown_2037F02
_080A69DC:
	ldr r6, _080A6A18 @ =0x0000fff0
_080A69DE:
	ldr r4, _080A6A1C @ =gUnknown_2037F1A
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
_080A6A1C: .4byte gUnknown_2037F1A
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
	ldr r5, _080A6AA0 @ =gUnknown_2037F02
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
_080A6AA0: .4byte gUnknown_2037F02
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
	ldr r0, _080A6B78 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6B80
	ldr r0, _080A6B7C @ =gUnknown_2037F1A
	b _080A6B82
	.align 2, 0
_080A6B78: .4byte gUnknown_2037F02
_080A6B7C: .4byte gUnknown_2037F1A
_080A6B80:
	ldr r0, _080A6BC0 @ =gUnknown_2037F1B
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
	ldr r0, _080A6BC4 @ =gUnknown_2037F02
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
_080A6BC0: .4byte gUnknown_2037F1B
_080A6BC4: .4byte gUnknown_2037F02
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
	ldr r0, _080A6C1C @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6C24
	ldr r0, _080A6C20 @ =gUnknown_2037F1A
	b _080A6C26
	.align 2, 0
_080A6C1C: .4byte gUnknown_2037F02
_080A6C20: .4byte gUnknown_2037F1A
_080A6C24:
	ldr r0, _080A6C44 @ =gUnknown_2037F1B
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
_080A6C44: .4byte gUnknown_2037F1B
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
	ldr r0, _080A6C98 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6CA0
	ldr r0, _080A6C9C @ =gUnknown_2037F1A
	b _080A6CA2
	.align 2, 0
_080A6C98: .4byte gUnknown_2037F02
_080A6C9C: .4byte gUnknown_2037F1A
_080A6CA0:
	ldr r0, _080A6CF4 @ =gUnknown_2037F1B
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
_080A6CF4: .4byte gUnknown_2037F1B
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
	ldr r1, _080A6D8C @ =gUnknown_825E074
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
_080A6D8C: .4byte gUnknown_825E074
	thumb_func_end sub_80A6D20

	thumb_func_start sub_80A6D90
sub_80A6D90: @ 80A6D90
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080A6DA4 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6DAC
	ldr r0, _080A6DA8 @ =gUnknown_2037F1A
	b _080A6DAE
	.align 2, 0
_080A6DA4: .4byte gUnknown_2037F02
_080A6DA8: .4byte gUnknown_2037F1A
_080A6DAC:
	ldr r0, _080A6DD0 @ =gUnknown_2037F1B
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
_080A6DD0: .4byte gUnknown_2037F1B
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

	thumb_func_start sub_80A6E48
sub_80A6E48: @ 80A6E48
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r5, _080A6E8C @ =gUnknown_2037F02
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
_080A6E8C: .4byte gUnknown_2037F02
_080A6E90: .4byte move_anim_8074EE0
_080A6E94: .4byte sub_8074BE4
	thumb_func_end sub_80A6E48

	thumb_func_start sub_80A6E98
sub_80A6E98: @ 80A6E98
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A6EAC @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A6EB4
	ldr r0, _080A6EB0 @ =gUnknown_2037F1A
	b _080A6EB6
	.align 2, 0
_080A6EAC: .4byte gUnknown_2037F02
_080A6EB0: .4byte gUnknown_2037F1A
_080A6EB4:
	ldr r0, _080A6ED0 @ =gUnknown_2037F1B
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
_080A6ED0: .4byte gUnknown_2037F1B
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
	ldr r4, _080A6FD4 @ =gUnknown_2037F1A
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
	ldr r1, _080A6FD8 @ =gUnknown_2023D44
	ldr r0, _080A6FDC @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r0, r1
	ldrb r6, [r0]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A6FE4
	ldr r0, _080A6FE0 @ =gUnknown_2037F02
	ldrh r1, [r5, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r5, 0x20]
	adds r1, r0, 0
	b _080A6FEE
	.align 2, 0
_080A6FD4: .4byte gUnknown_2037F1A
_080A6FD8: .4byte gUnknown_2023D44
_080A6FDC: .4byte gUnknown_2037F1B
_080A6FE0: .4byte gUnknown_2037F02
_080A6FE4:
	ldr r1, _080A7018 @ =gUnknown_2037F02
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
_080A7018: .4byte gUnknown_2037F02
_080A701C: .4byte sub_80A6F3C
	thumb_func_end sub_80A6F8C

	thumb_func_start sub_80A7020
sub_80A7020: @ 80A7020
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r1, _080A704C @ =gUnknown_2037F02
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
_080A704C: .4byte gUnknown_2037F02
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
	ldr r1, _080A7078 @ =sub_8075590
	str r1, [r0, 0x1C]
	ldr r1, _080A707C @ =sub_80A7080
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080A7078: .4byte sub_8075590
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
	ldr r1, _080A70CC @ =gUnknown_2023D44
	ldr r0, _080A70D0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_80758E0
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
_080A70CC: .4byte gUnknown_2023D44
_080A70D0: .4byte gUnknown_2037F1A
_080A70D4: .4byte gTasks
_080A70D8: .4byte sub_80A70DC
	thumb_func_end sub_80A70A0

	thumb_func_start sub_80A70DC
sub_80A70DC: @ 80A70DC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A710C @ =gUnknown_2023D44
	ldr r0, _080A7110 @ =gUnknown_2037F1A
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
_080A710C: .4byte gUnknown_2023D44
_080A7110: .4byte gUnknown_2037F1A
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
	bl obj_id_set_rotscale
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
	bl sub_8075980
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
	ldr r0, _080A71FC @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A7204
	ldr r0, _080A7200 @ =gUnknown_2037F02
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	adds r5, r0, 0
	b _080A7210
	.align 2, 0
_080A71FC: .4byte gUnknown_2037F1A
_080A7200: .4byte gUnknown_2037F02
_080A7204:
	ldr r1, _080A7244 @ =gUnknown_2037F02
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
	ldr r0, _080A7248 @ =gUnknown_2037F1A
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
_080A7244: .4byte gUnknown_2037F02
_080A7248: .4byte gUnknown_2037F1A
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
	ldr r1, _080A72C0 @ =sub_8075590
	str r1, [r0, 0x1C]
	ldr r1, _080A72C4 @ =DestroyAnimSprite
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080A72C0: .4byte sub_8075590
_080A72C4: .4byte DestroyAnimSprite
	thumb_func_end sub_80A72A0

	thumb_func_start sub_80A72C8
sub_80A72C8: @ 80A72C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A72EC
	ldr r1, _080A72E8 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	b _080A730E
	.align 2, 0
_080A72E8: .4byte gUnknown_2037F02
_080A72EC:
	ldr r0, _080A73B4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A730E
	ldr r1, _080A73B8 @ =gUnknown_2037F02
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
	ldr r4, _080A73BC @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r6, _080A73B8 @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
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
	bl sub_8073788
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
	ldr r0, _080A73C4 @ =sub_8075590
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
_080A73B4: .4byte gUnknown_2037F1A
_080A73B8: .4byte gUnknown_2037F02
_080A73BC: .4byte gUnknown_2037F1B
_080A73C0: .4byte 0xffffa000
_080A73C4: .4byte sub_8075590
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
	bl sub_8073A44
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
	bl sub_8073788
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
	ldr r3, _080A7750 @ =gUnknown_2037F02
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
_080A7750: .4byte gUnknown_2037F02
_080A7754:
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r3, 0x4]
	b _080A77B6
_080A775C:
	ldr r1, _080A77A0 @ =gUnknown_2023BD6
	ldr r0, _080A77A4 @ =gUnknown_2037F1B
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
	ldr r2, _080A77AC @ =gUnknown_2037F02
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
_080A77A0: .4byte gUnknown_2023BD6
_080A77A4: .4byte gUnknown_2037F1B
_080A77A8: .4byte gTasks
_080A77AC: .4byte gUnknown_2037F02
_080A77B0:
	movs r0, 0x1
	orrs r0, r1
_080A77B4:
	strh r0, [r2, 0x4]
_080A77B6:
	ldr r5, _080A7810 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
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
	bl sub_8074480
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
	ldr r4, _080A781C @ =gUnknown_2037F1B
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl sub_8072DF0
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
_080A7810: .4byte gUnknown_2037F1A
_080A7814: .4byte gTasks
_080A7818: .4byte gBattleTypeFlags
_080A781C: .4byte gUnknown_2037F1B
_080A7820:
	mov r5, sp
	ldr r4, _080A787C @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
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
	ldr r3, _080A7884 @ =gUnknown_2037F02
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
_080A787C: .4byte gUnknown_2037F1B
_080A7880: .4byte gTasks
_080A7884: .4byte gUnknown_2037F02
_080A7888:
	subs r0, r1, r2
_080A788A:
	lsls r0, 16
	lsrs r0, 16
	lsls r4, r0, 16
	asrs r4, 16
	ldr r5, _080A7900 @ =gUnknown_2037F02
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
_080A7900: .4byte gUnknown_2037F02
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
	ldr r4, _080A796C @ =gUnknown_2037F02
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
	ldr r0, _080A7970 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl sub_807685C
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
_080A796C: .4byte gUnknown_2037F02
_080A7970: .4byte gUnknown_2037F1B
_080A7974: .4byte 0x0000ffc0
_080A7978:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _080A79A0
	ldr r0, _080A7998 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl sub_807685C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080A799C @ =0x0000ffc0
	adds r1, r3, 0
	ldrh r4, [r4, 0x8]
	adds r1, r4
	adds r0, r1
	b _080A79B0
	.align 2, 0
_080A7998: .4byte gUnknown_2037F1B
_080A799C: .4byte 0x0000ffc0
_080A79A0:
	ldr r0, _080A79DC @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl sub_807685C
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
_080A79DC: .4byte gUnknown_2037F1B
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
	ldr r1, _080A7A84 @ =gUnknown_20375F8
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
_080A7A84: .4byte gUnknown_20375F8
	thumb_func_end sub_80A7A18

	thumb_func_start sub_80A7A88
sub_80A7A88: @ 80A7A88
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r4, _080A7B28 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080A7B2C @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _080A7B30 @ =gUnknown_2037F1A
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
_080A7B28: .4byte gUnknown_2037F1B
_080A7B2C: .4byte gUnknown_2037F02
_080A7B30: .4byte gUnknown_2037F1A
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
	ldr r0, _080A7BC0 @ =gUnknown_2037F1A
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
_080A7BC0: .4byte gUnknown_2037F1A
	thumb_func_end sub_80A7B54

	thumb_func_start sub_80A7BC4
sub_80A7BC4: @ 80A7BC4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r5, _080A7C10 @ =gUnknown_2037F1B
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
	ldr r0, _080A7C14 @ =sub_8075590
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
_080A7C10: .4byte gUnknown_2037F1B
_080A7C14: .4byte sub_8075590
_080A7C18: .4byte sub_80A7C1C
	thumb_func_end sub_80A7BC4

	thumb_func_start sub_80A7C1C
sub_80A7C1C: @ 80A7C1C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3F
	bl sub_8073A44
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
	ldr r0, _080A7D54 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080A7D22
	ldrh r0, [r4, 0x22]
	adds r0, 0x10
	strh r0, [r4, 0x22]
_080A7D22:
	ldr r1, _080A7D58 @ =gUnknown_2037F02
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
_080A7D54: .4byte gUnknown_2037F1A
_080A7D58: .4byte gUnknown_2037F02
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
	ldr r0, _080A7DE8 @ =gUnknown_2037F02
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
	ldr r4, _080A7DEC @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	add r0, r8
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _080A7DF0 @ =sub_8075590
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
_080A7DE8: .4byte gUnknown_2037F02
_080A7DEC: .4byte gUnknown_2037F1B
_080A7DF0: .4byte sub_8075590
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
	ldr r7, _080A7EB0 @ =gUnknown_2037F02
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
	ldr r4, _080A7EB4 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	add r0, r9
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
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
_080A7EB0: .4byte gUnknown_2037F02
_080A7EB4: .4byte gUnknown_2037F1B
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
	bl GetAnimBankSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80758E0
	adds r0, r4, 0
	movs r1, 0xD0
	movs r2, 0xD0
	movs r3, 0
	bl obj_id_set_rotscale
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
	bl GetAnimBankSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8075980
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
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x8]
	movs r1, 0
	bl sub_80758E0
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x10]
	strh r5, [r4, 0x12]
	strh r5, [r4, 0x14]
	ldr r0, _080A80C4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_807685C
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
_080A80C4: .4byte gUnknown_2037F1A
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
	bl obj_id_set_rotscale
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
	bl obj_id_set_rotscale
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
	bl obj_id_set_rotscale
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
	bl sub_8075980
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
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
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
	bl obj_id_set_rotscale
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
	ldr r5, _080A8360 @ =gUnknown_2037F02
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A8364
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	b _080A838A
	.align 2, 0
_080A835C: .4byte gTasks
_080A8360: .4byte gUnknown_2037F02
_080A8364:
	ldrb r0, [r5]
	bl GetAnimBankSpriteId
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
	bl GetAnimBankSpriteId
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
	ldr r5, _080A854C @ =gUnknown_2037F1A
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
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r4, 0x20]
	movs r0, 0x40
	b _080A856A
	.align 2, 0
_080A854C: .4byte gUnknown_2037F1A
_080A8550:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x20
	strh r0, [r4, 0x20]
	ldr r0, _080A859C @ =0x0000ffc0
_080A856A:
	strh r0, [r4, 0x30]
	ldr r0, _080A85A0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8074480
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
_080A85A0: .4byte gUnknown_2037F1A
_080A85A4: .4byte DestroyAnimSprite
_080A85A8: .4byte sub_8074D00
	thumb_func_end sub_80A851C

	thumb_func_start sub_80A85AC
sub_80A85AC: @ 80A85AC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080A85C0 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A85C8
	ldr r0, _080A85C4 @ =gUnknown_2037F1A
	b _080A85CA
	.align 2, 0
_080A85C0: .4byte gUnknown_2037F02
_080A85C4: .4byte gUnknown_2037F1A
_080A85C8:
	ldr r0, _080A8628 @ =gUnknown_2037F1B
_080A85CA:
	ldrb r5, [r0]
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A85E4
	ldr r1, _080A862C @ =gUnknown_2037F02
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080A85E4:
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080A862C @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8074480
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
_080A8628: .4byte gUnknown_2037F1B
_080A862C: .4byte gUnknown_2037F02
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
	bl GetAnimBankSpriteId
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
	bl GetAnimBankSpriteId
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
	ldr r0, _080A8720 @ =gUnknown_2037F1A
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
_080A8720: .4byte gUnknown_2037F1A
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
	ldr r4, _080A88C8 @ =gUnknown_2037F1B
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
	ldr r0, _080A88CC @ =gUnknown_2022978
	ldrh r0, [r0]
	strh r0, [r5, 0x14]
	ldr r0, _080A88D0 @ =0x04000014
	b _080A88DC
	.align 2, 0
_080A88C4: .4byte gTasks
_080A88C8: .4byte gUnknown_2037F1B
_080A88CC: .4byte gUnknown_2022978
_080A88D0: .4byte 0x04000014
_080A88D4:
	ldr r0, _080A8940 @ =gUnknown_202297C
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
	ldr r4, _080A8948 @ =gUnknown_2038700
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
	bl sub_8087EE4
	ldr r0, _080A8950 @ =sub_80A8954
	str r0, [r5]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8940: .4byte gUnknown_202297C
_080A8944: .4byte 0x04000018
_080A8948: .4byte gUnknown_2038700
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
	ldr r2, _080A8A14 @ =gUnknown_2038700
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
	ldr r1, _080A8A18 @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080A8A0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A14: .4byte gUnknown_2038700
_080A8A18: .4byte gUnknown_2039600
	thumb_func_end sub_80A8954

	thumb_func_start sub_80A8A1C
sub_80A8A1C: @ 80A8A1C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080A8A70 @ =gUnknown_2037F1B
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8074480
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
	bl sub_8073A44
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x3A]
	ldr r0, _080A8A74 @ =sub_80A8A78
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A70: .4byte gUnknown_2037F1B
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
	ldr r0, _080A8BE8 @ =gUnknown_2037F02
	movs r3, 0x4
	ldrsh r2, [r0, r3]
	adds r7, r1, 0
	adds r1, r0, 0
	cmp r2, 0
	bne _080A8BF0
	ldr r0, _080A8BEC @ =gUnknown_2037F1A
	b _080A8BF2
	.align 2, 0
_080A8BE8: .4byte gUnknown_2037F02
_080A8BEC: .4byte gUnknown_2037F1A
_080A8BF0:
	ldr r0, _080A8C2C @ =gUnknown_2037F1B
_080A8BF2:
	ldrb r5, [r0]
	ldrb r1, [r1, 0x6]
	movs r0, 0x1
	adds r4, r0, 0
	eors r4, r1
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080A8C6A
	movs r1, 0x2
	adds r0, r5, 0
	eors r0, r1
	bl sub_8072DF0
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
_080A8C2C: .4byte gUnknown_2037F1B
_080A8C30:
	adds r0, r5, 0
	movs r1, 0x2
_080A8C34:
	bl sub_8074480
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A8C60
	ldr r2, _080A8C5C @ =gUnknown_2037F02
	mov r0, sp
	ldrh r1, [r0]
	subs r1, r4
	ldrh r0, [r2]
	subs r1, r0
	subs r0, r1
	strh r0, [r2]
	b _080A8C6A
	.align 2, 0
_080A8C5C: .4byte gUnknown_2037F02
_080A8C60:
	ldr r1, _080A8C7C @ =gUnknown_2037F02
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
_080A8C7C: .4byte gUnknown_2037F02
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
	ldr r0, _080A8CD0 @ =gUnknown_2037F02
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080A8CDC
	ldr r0, _080A8CD4 @ =gUnknown_2037F1A
	ldrb r7, [r0]
	ldr r0, _080A8CD8 @ =gUnknown_2037F1B
	b _080A8CE2
	.align 2, 0
_080A8CD0: .4byte gUnknown_2037F02
_080A8CD4: .4byte gUnknown_2037F1A
_080A8CD8: .4byte gUnknown_2037F1B
_080A8CDC:
	ldr r0, _080A8CFC @ =gUnknown_2037F1B
	ldrb r7, [r0]
	ldr r0, _080A8D00 @ =gUnknown_2037F1A
_080A8CE2:
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _080A8D04 @ =gUnknown_2037F02
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
_080A8CFC: .4byte gUnknown_2037F1B
_080A8D00: .4byte gUnknown_2037F1A
_080A8D04: .4byte gUnknown_2037F02
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
	bl sub_8074480
	lsls r0, 24
	ldr r1, _080A8D50 @ =gUnknown_2037F02
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
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080A8D5C
	ldr r2, _080A8D54 @ =gSprites
	ldr r0, _080A8D58 @ =gUnknown_2023D44
	adds r0, r4, r0
	b _080A8DEA
	.align 2, 0
_080A8D50: .4byte gUnknown_2037F02
_080A8D54: .4byte gSprites
_080A8D58: .4byte gUnknown_2023D44
_080A8D5C:
	ldr r2, _080A8D64 @ =gSprites
	ldr r0, _080A8D68 @ =gUnknown_2023D44
	add r0, r8
	b _080A8DEA
	.align 2, 0
_080A8D64: .4byte gSprites
_080A8D68: .4byte gUnknown_2023D44
_080A8D6C:
	adds r0, r7, 0
	mov r1, r10
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A8DD4 @ =gUnknown_2037F02
	ldrh r1, [r1]
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080A8DE4
	movs r0, 0x2
	adds r4, r7, 0
	eors r4, r0
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080A8DE4
	ldr r3, _080A8DD8 @ =gSprites
	ldr r2, _080A8DDC @ =gUnknown_2023D44
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
_080A8DD4: .4byte gUnknown_2037F02
_080A8DD8: .4byte gSprites
_080A8DDC: .4byte gUnknown_2023D44
_080A8DE0:
	adds r0, r6, 0
	b _080A8DF4
_080A8DE4:
	ldr r2, _080A8E40 @ =gSprites
	ldr r0, _080A8E44 @ =gUnknown_2023D44
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
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080A8E48 @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080A8E4C
	movs r1, 0x2
	mov r0, r8
	eors r0, r1
	bl sub_8072DF0
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
_080A8E44: .4byte gUnknown_2023D44
_080A8E48: .4byte gUnknown_2037F02
_080A8E4C:
	mov r4, sp
	mov r0, r8
	mov r1, r10
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	mov r0, r8
	ldr r1, [sp, 0x4]
	bl sub_8074480
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
	ldr r1, _080A8E8C @ =gUnknown_2037F02
	ldrh r0, [r1, 0x6]
	ldrh r2, [r2]
	adds r0, r2
	strh r0, [r3]
	adds r2, r1, 0
	b _080A8E9E
	.align 2, 0
_080A8E8C: .4byte gUnknown_2037F02
_080A8E90:
	mov r3, sp
	mov r0, sp
	ldr r2, _080A8EE0 @ =gUnknown_2037F02
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
_080A8EE0: .4byte gUnknown_2037F02
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
	ldr r1, _080A8F30 @ =gUnknown_2037F02
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
_080A8F30: .4byte gUnknown_2037F02
_080A8F34: .4byte sub_8075D9C
	thumb_func_end sub_80A8EE8

	thumb_func_start sub_80A8F38
sub_80A8F38: @ 80A8F38
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075160
	ldr r0, _080A8F6C @ =gUnknown_2037F1A
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
	ldr r0, _080A8F74 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x3C]
	ldr r0, _080A8F78 @ =sub_80A8F7C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8F6C: .4byte gUnknown_2037F1A
_080A8F70: .4byte 0x0000ff60
_080A8F74: .4byte gUnknown_2037F02
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
	ldr r0, _080A8FE8 @ =gUnknown_2037F1A
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
_080A8FE8: .4byte gUnknown_2037F1A
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
	ldr r0, _080A9144 @ =gUnknown_2037F02
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
_080A9144: .4byte gUnknown_2037F02
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
	bl GetAnimBankSpriteId
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
	ldr r0, _080A9248 @ =gUnknown_2037F1B
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
_080A9248: .4byte gUnknown_2037F1B
_080A924C: .4byte 0x0000ffff
_080A9250:
	movs r0, 0x1
	strh r0, [r4, 0x22]
	ldr r0, _080A9270 @ =0x0000fff8
_080A9256:
	strh r0, [r4, 0x24]
	movs r0, 0x1
	bl GetAnimBankSpriteId
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
	bl GetAnimBankSpriteId
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
	ldr r5, _080A9500 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8074480
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
_080A9500: .4byte gUnknown_2037F1A
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
	ldr r0, _080A975C @ =gUnknown_8D227E4
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
_080A975C: .4byte gUnknown_8D227E4
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
	ldr r6, _080A9850 @ =gUnknown_2037F1A
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080A9808
	ldr r1, _080A9854 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A9808:
	ldr r4, _080A9854 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldr r0, _080A9858 @ =sub_8075590
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
_080A9850: .4byte gUnknown_2037F1A
_080A9854: .4byte gUnknown_2037F02
_080A9858: .4byte sub_8075590
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
	bl sub_8073788
	lsls r0, 24
	movs r6, 0xF0
	cmp r0, 0
	beq _080A98C4
	movs r6, 0x98
_080A98C4:
	movs r5, 0
	ldr r1, _080A9918 @ =gUnknown_2022984
	strh r6, [r1]
	ldr r4, _080A991C @ =gUnknown_2022986
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
_080A9918: .4byte gUnknown_2022984
_080A991C: .4byte gUnknown_2022986
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
	ldr r0, _080A9968 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080A996C @ =sub_80A9984
	str r0, [r3]
	b _080A9978
	.align 2, 0
_080A9964: .4byte gTasks
_080A9968: .4byte gUnknown_2022984
_080A996C: .4byte sub_80A9984
_080A9970:
	ldr r1, _080A9980 @ =gUnknown_2022984
	lsls r0, r4, 8
	orrs r2, r0
	strh r2, [r1]
_080A9978:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9980: .4byte gUnknown_2022984
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
	ldr r0, _080A9A14 @ =gUnknown_2022984
	strh r4, [r0]
	ldr r0, _080A9A18 @ =gUnknown_2022986
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
_080A9A14: .4byte gUnknown_2022984
_080A9A18: .4byte gUnknown_2022986
_080A9A1C: .4byte 0x00003f3f
	thumb_func_end sub_80A9984

	thumb_func_start sub_80A9A20
sub_80A9A20: @ 80A9A20
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	movs r0, 0x1
	bl GetAnimBankSpriteId
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
	bl GetAnimBankSpriteId
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
	bl GetAnimBankSpriteId
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
	bl GetAnimBankSpriteId
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
	ldr r5, _080A9B84 @ =gUnknown_2037F1B
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
	ldr r0, _080A9B88 @ =sub_80A9B8C
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9B84: .4byte gUnknown_2037F1B
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
	ldr r1, _080A9BE4 @ =gUnknown_2037F02
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	adds r0, r2, 0x1
	strh r0, [r4, 0x2E]
	b _080A9C44
	.align 2, 0
_080A9BE4: .4byte gUnknown_2037F02
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
	ldr r2, _080A9C70 @ =gUnknown_2037F02
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
_080A9C70: .4byte gUnknown_2037F02
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
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080A9D2A
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080A9D2A:
	ldr r0, _080A9DA4 @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080A9DA8 @ =gUnknown_202297A
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
	ldr r1, _080A9DAC @ =gUnknown_8D23F4C
	bl sub_807543C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080A9DB0 @ =gUnknown_8D234B4
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080A9DB4 @ =gUnknown_8D23F24
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8073788
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
_080A9DA4: .4byte gUnknown_2022978
_080A9DA8: .4byte gUnknown_202297A
_080A9DAC: .4byte gUnknown_8D23F4C
_080A9DB0: .4byte gUnknown_8D234B4
_080A9DB4: .4byte gUnknown_8D23F24
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
	bl sub_8073788
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
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080A9F52
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080A9F52:
	ldr r0, _080A9F8C @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080A9F90 @ =gUnknown_202297A
	strh r1, [r4]
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x16
	bl SetGpuReg
	mov r0, sp
	bl sub_80752A0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080A9F98
	ldr r0, _080A9F94 @ =gUnknown_8E7F874
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	b _080A9FC6
	.align 2, 0
_080A9F88: .4byte 0x00003f42
_080A9F8C: .4byte gUnknown_2022978
_080A9F90: .4byte gUnknown_202297A
_080A9F94: .4byte gUnknown_8E7F874
_080A9F98:
	ldr r0, _080A9FB4 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A9FBC
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080A9FB8 @ =gUnknown_8E7F4AC
	bl sub_807543C
	b _080A9FC6
	.align 2, 0
_080A9FB4: .4byte gUnknown_2037F1B
_080A9FB8: .4byte gUnknown_8E7F4AC
_080A9FBC:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AA010 @ =gUnknown_8E7F690
	bl sub_807543C
_080A9FC6:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AA014 @ =gUnknown_8D24BCC
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080AA018 @ =gUnknown_8D24BA4
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8073788
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
_080AA010: .4byte gUnknown_8E7F690
_080AA014: .4byte gUnknown_8D24BCC
_080AA018: .4byte gUnknown_8D24BA4
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
	bl sub_8073788
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
	ldr r5, _080AA1C8 @ =gUnknown_2037F1A
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
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080AA1CC @ =gUnknown_2037F02
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldrb r0, [r5]
	bl sub_807685C
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
_080AA1C8: .4byte gUnknown_2037F1A
_080AA1CC: .4byte gUnknown_2037F02
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
	ldr r0, _080AA2A8 @ =gUnknown_2037F02
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
_080AA2A8: .4byte gUnknown_2037F02
_080AA2AC: .4byte 0x0000ffff
	thumb_func_end sub_80AA1D4

	thumb_func_start sub_80AA2B0
sub_80AA2B0: @ 80AA2B0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080AA2F8 @ =gUnknown_2037F1A
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
	ldr r4, _080AA2FC @ =gUnknown_2037F02
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
_080AA2F8: .4byte gUnknown_2037F1A
_080AA2FC: .4byte gUnknown_2037F02
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
	ldr r4, _080AA3C8 @ =gUnknown_2037F1A
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
	ldr r4, _080AA3CC @ =gUnknown_2037F02
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
_080AA3C8: .4byte gUnknown_2037F1A
_080AA3CC: .4byte gUnknown_2037F02
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
	ldr r0, _080AA498 @ =gUnknown_2037F02
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
_080AA498: .4byte gUnknown_2037F02
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
	ldr r1, _080AA528 @ =gUnknown_2037F02
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	adds r0, r2, 0x1
	strh r0, [r4, 0x2E]
	b _080AA580
	.align 2, 0
_080AA528: .4byte gUnknown_2037F02
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
	ldr r1, _080AA688 @ =gUnknown_2037F02
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
	ldr r0, _080AA68C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl sub_807685C
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
_080AA688: .4byte gUnknown_2037F02
_080AA68C: .4byte gUnknown_2037F1B
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
	ldr r1, _080AA6E8 @ =gUnknown_2037F02
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
_080AA6E8: .4byte gUnknown_2037F02
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
	ldr r1, _080AA720 @ =gUnknown_2037F02
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080AA724
	adds r0, r5, 0
	bl DestroyAnimSprite
	b _080AA788
	.align 2, 0
_080AA720: .4byte gUnknown_2037F02
_080AA724:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080AA734
	ldr r4, _080AA730 @ =gUnknown_2037F1A
	b _080AA736
	.align 2, 0
_080AA730: .4byte gUnknown_2037F1A
_080AA734:
	ldr r4, _080AA764 @ =gUnknown_2037F1B
_080AA736:
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
	ldr r0, _080AA768 @ =gUnknown_2037F02
	movs r2, 0x2
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _080AA76C
	ldrh r0, [r5, 0x20]
	adds r0, 0x20
	b _080AA770
	.align 2, 0
_080AA764: .4byte gUnknown_2037F1B
_080AA768: .4byte gUnknown_2037F02
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
	ldr r0, _080AA7FC @ =gUnknown_2037F02
	ldrb r0, [r0]
	bl GetAnimBankSpriteId
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
_080AA7FC: .4byte gUnknown_2037F02
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
	ldr r0, _080AA84C @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AA854
	ldr r0, _080AA850 @ =gUnknown_2037F1A
	b _080AA856
	.align 2, 0
_080AA84C: .4byte gUnknown_2037F02
_080AA850: .4byte gUnknown_2037F1A
_080AA854:
	ldr r0, _080AA8EC @ =gUnknown_2037F1B
_080AA856:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080AA870
	ldr r1, _080AA8F0 @ =gUnknown_2037F02
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080AA870:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r7, _080AA8F0 @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r3, [r7, 0x2]
	adds r0, r3
	movs r4, 0
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8074480
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
_080AA8EC: .4byte gUnknown_2037F1B
_080AA8F0: .4byte gUnknown_2037F02
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
	ldr r0, _080AA994 @ =gUnknown_2037F02
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
_080AA994: .4byte gUnknown_2037F02
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
	ldr r4, _080AAA48 @ =gUnknown_2037F02
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
	bl oamt_add_pos2_onto_pos1
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
_080AAA48: .4byte gUnknown_2037F02
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
	ldr r4, _080AAB2C @ =gUnknown_2037F1A
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl sub_8072DF0
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
_080AAB2C: .4byte gUnknown_2037F1A
_080AAB30:
	ldr r4, _080AAB70 @ =gUnknown_2037F1A
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
	ldr r0, _080AAB74 @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _080AAB78 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAB70: .4byte gUnknown_2037F1A
_080AAB74: .4byte sub_8075590
_080AAB78: .4byte DestroyAnimSprite
	thumb_func_end sub_80AAAE4

	thumb_func_start sub_80AAB7C
sub_80AAB7C: @ 80AAB7C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080AAB98 @ =gUnknown_2037F02
	ldr r1, _080AAB9C @ =gUnknown_2037EE4
	ldr r1, [r1]
	ldrb r2, [r1, 0x10]
	movs r1, 0x1
	ands r1, r2
	strh r1, [r3, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080AAB98: .4byte gUnknown_2037F02
_080AAB9C: .4byte gUnknown_2037EE4
	thumb_func_end sub_80AAB7C

	thumb_func_start update_fury_cutter_counter_copy
update_fury_cutter_counter_copy: @ 80AABA0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AABB8 @ =gUnknown_2037F02
	ldr r1, _080AABBC @ =gUnknown_2037EE4
	ldr r1, [r1]
	ldrb r1, [r1, 0x10]
	strh r1, [r2, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080AABB8: .4byte gUnknown_2037F02
_080AABBC: .4byte gUnknown_2037EE4
	thumb_func_end update_fury_cutter_counter_copy

	thumb_func_start sub_80AABC0
sub_80AABC0: @ 80AABC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080AAC48 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AABE8
	ldr r1, _080AAC4C @ =gUnknown_2037F02
	ldrh r0, [r1]
	strh r0, [r5, 0xA]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0xC]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0xE]
_080AABE8:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl __modsi3
	cmp r0, 0x1
	bne _080AAC30
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x50
	bl __umodsi3
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080AAC50 @ =gUnknown_83E5898
	adds r1, r4, 0
	movs r3, 0x4
	bl CreateSprite
_080AAC30:
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _080AAC42
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080AAC42:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AAC48: .4byte gTasks
_080AAC4C: .4byte gUnknown_2037F02
_080AAC50: .4byte gUnknown_83E5898
	thumb_func_end sub_80AABC0

	thumb_func_start sub_80AAC54
sub_80AAC54: @ 80AAC54
	ldr r1, _080AAC5C @ =sub_80AAC60
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080AAC5C: .4byte sub_80AAC60
	thumb_func_end sub_80AAC54

	thumb_func_start sub_80AAC60
sub_80AAC60: @ 80AAC60
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	bgt _080AAC7E
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x26]
	adds r0, 0x4
	strh r0, [r2, 0x26]
_080AAC7E:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080AAC92
	adds r0, r2, 0
	bl DestroySprite
_080AAC92:
	pop {r0}
	bx r0
	thumb_func_end sub_80AAC60

	thumb_func_start sub_80AAC98
sub_80AAC98: @ 80AAC98
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _080AACC0 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AACC8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080AACC4 @ =gUnknown_2037F02
	ldrh r1, [r4]
	subs r0, r1
	b _080AACDA
	.align 2, 0
_080AACC0: .4byte gUnknown_2037F1A
_080AACC4: .4byte gUnknown_2037F02
_080AACC8:
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080AADA0 @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
_080AACDA:
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r6, 0x22]
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080AADA4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AAD10
	ldr r1, _080AADA0 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080AAD10:
	ldr r5, _080AADA0 @ =gUnknown_2037F02
	ldrh r0, [r5, 0xC]
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldr r4, _080AADA8 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080AADAC @ =SpriteCallbackDummy
	bl CreateInvisibleSpriteWithCallback
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	strh r4, [r6, 0x38]
	ldrb r0, [r5, 0x8]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl Sin
	ldrh r1, [r6, 0x20]
	subs r1, r0
	strh r1, [r6, 0x20]
	ldrb r0, [r5, 0x8]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl Cos
	ldrh r1, [r6, 0x22]
	subs r1, r0
	strh r1, [r6, 0x22]
	ldr r0, _080AADB0 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r5, 0x4]
	strh r0, [r1, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r1, 0x30]
	ldrh r0, [r5, 0xA]
	strh r0, [r1, 0x32]
	ldrb r0, [r5, 0x8]
	lsls r0, 8
	strh r0, [r1, 0x34]
	ldrh r0, [r5, 0xC]
	strh r0, [r1, 0x36]
	ldr r1, _080AADB4 @ =sub_80AADB8
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AADA0: .4byte gUnknown_2037F02
_080AADA4: .4byte gUnknown_2037F1A
_080AADA8: .4byte gUnknown_2037F1B
_080AADAC: .4byte SpriteCallbackDummy
_080AADB0: .4byte gSprites
_080AADB4: .4byte sub_80AADB8
	thumb_func_end sub_80AAC98

	thumb_func_start sub_80AADB8
sub_80AADB8: @ 80AADB8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r1, [r5, 0x38]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080AAE20 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r7, r0, r2
	ldrh r4, [r7, 0x36]
	lsls r4, 24
	lsrs r4, 24
	ldrh r0, [r7, 0x34]
	mov r8, r0
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_80755E0
	mov r1, r8
	lsrs r6, r1, 8
	movs r0, 0x2E
	ldrsh r1, [r7, r0]
	adds r0, r6, 0
	bl Sin
	ldrh r1, [r5, 0x24]
	adds r0, r1
	strh r0, [r5, 0x24]
	movs r0, 0x30
	ldrsh r1, [r7, r0]
	adds r0, r6, 0
	bl Cos
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r0, [r7, 0x32]
	mov r1, r8
	adds r1, r0
	strh r1, [r7, 0x34]
	subs r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	cmp r4, 0
	beq _080AAE24
	strh r4, [r7, 0x36]
	b _080AAE2E
	.align 2, 0
_080AAE20: .4byte gSprites
_080AAE24:
	ldr r0, _080AAE3C @ =sub_80AAE40
	str r0, [r5, 0x1C]
	adds r0, r7, 0
	bl DestroySprite
_080AAE2E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAE3C: .4byte sub_80AAE40
	thumb_func_end sub_80AADB8

	thumb_func_start sub_80AAE40
sub_80AAE40: @ 80AAE40
	push {lr}
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	strb r1, [r3]
	ldr r1, _080AAE60 @ =sub_8074F6C
	str r1, [r0, 0x1C]
	ldr r1, _080AAE64 @ =sub_80AAE68
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080AAE60: .4byte sub_8074F6C
_080AAE64: .4byte sub_80AAE68
	thumb_func_end sub_80AAE40

	thumb_func_start sub_80AAE68
sub_80AAE68: @ 80AAE68
	push {lr}
	movs r1, 0xA
	strh r1, [r0, 0x2E]
	ldr r1, _080AAE7C @ =sub_8074C44
	str r1, [r0, 0x1C]
	ldr r1, _080AAE80 @ =move_anim_8074EE0
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080AAE7C: .4byte sub_8074C44
_080AAE80: .4byte move_anim_8074EE0
	thumb_func_end sub_80AAE68

	thumb_func_start sub_80AAE84
sub_80AAE84: @ 80AAE84
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080AAEAC @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AAEB4
	ldr r1, _080AAEB0 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r7, r1, 0
	b _080AAEBA
	.align 2, 0
_080AAEAC: .4byte gUnknown_2037F1A
_080AAEB0: .4byte gUnknown_2037F02
_080AAEB4:
	ldr r0, _080AAF10 @ =gUnknown_2037F02
	ldrh r6, [r0, 0x4]
	adds r7, r0, 0
_080AAEBA:
	ldrh r0, [r7, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080AAF14 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r7, [r7, 0x6]
	adds r0, r7
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080AAF18 @ =sub_80AAF1C
	str r0, [r5, 0x1C]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAF10: .4byte gUnknown_2037F02
_080AAF14: .4byte gUnknown_2037F1B
_080AAF18: .4byte sub_80AAF1C
	thumb_func_end sub_80AAE84

	thumb_func_start sub_80AAF1C
sub_80AAF1C: @ 80AAF1C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AAF58 @ =gUnknown_2037F02
	ldrh r1, [r0, 0xE]
	ldr r0, _080AAF5C @ =0x0000ffff
	cmp r1, r0
	bne _080AAF3E
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
_080AAF3E:
	adds r0, r4, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080AAF50
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AAF50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AAF58: .4byte gUnknown_2037F02
_080AAF5C: .4byte 0x0000ffff
	thumb_func_end sub_80AAF1C

	thumb_func_start sub_80AAF60
sub_80AAF60: @ 80AAF60
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080AAF94 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r0, _080AAF98 @ =gUnknown_2037F02
	ldrh r0, [r0]
	strh r0, [r4, 0x8]
	ldr r0, _080AAF9C @ =0x0000279c
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r4, 0xC]
	ldr r0, _080AAFA0 @ =sub_80AAFA4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AAF94: .4byte gTasks
_080AAF98: .4byte gUnknown_2037F02
_080AAF9C: .4byte 0x0000279c
_080AAFA0: .4byte sub_80AAFA4
	thumb_func_end sub_80AAF60

	thumb_func_start sub_80AAFA4
sub_80AAFA4: @ 80AAFA4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080AB01C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x1C]
	adds r0, 0x1
	strh r0, [r2, 0x1C]
	lsls r0, 16
	asrs r0, 16
	mov r12, r1
	cmp r0, 0x3
	bne _080AAFF6
	movs r0, 0
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080AB020 @ =gUnknown_20375F8
	lsls r0, r5, 1
	adds r0, r1
	ldrh r6, [r0]
	adds r7, r1, 0
	adds r3, r0, 0x2
	movs r1, 0x6
	adds r2, r0, 0
_080AAFE0:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080AAFE0
	adds r0, r5, 0x7
	lsls r0, 1
	adds r0, r7
	strh r6, [r0]
_080AAFF6:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r12
	ldrh r1, [r0, 0x1E]
	adds r1, 0x1
	strh r1, [r0, 0x1E]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _080AB016
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080AB016:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB01C: .4byte gTasks
_080AB020: .4byte gUnknown_20375F8
	thumb_func_end sub_80AAFA4

	thumb_func_start sub_80AB024
sub_80AB024: @ 80AB024
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_8075160
	movs r0, 0x1E
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080AB08C @ =gUnknown_2037F1B
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
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	movs r0, 0xD2
	lsls r0, 8
	bl __divsi3
	strh r0, [r5, 0x38]
	ldr r0, _080AB090 @ =gUnknown_2037F02
	ldrh r2, [r0, 0x6]
	strh r2, [r5, 0x3C]
	ldrh r1, [r0, 0xE]
	movs r3, 0xE
	ldrsh r0, [r0, r3]
	cmp r0, 0x7F
	ble _080AB094
	adds r0, r1, 0
	subs r0, 0x7F
	lsls r0, 8
	strh r0, [r5, 0x3A]
	negs r0, r2
	strh r0, [r5, 0x3C]
	b _080AB098
	.align 2, 0
_080AB08C: .4byte gUnknown_2037F1B
_080AB090: .4byte gUnknown_2037F02
_080AB094:
	lsls r0, r1, 8
	strh r0, [r5, 0x3A]
_080AB098:
	ldr r1, _080AB0A8 @ =sub_80AB0AC
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB0A8: .4byte sub_80AB0AC
	thumb_func_end sub_80AB024

	thumb_func_start sub_80AB0AC
sub_80AB0AC: @ 80AB0AC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080AB0C0
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AB0C0:
	ldrh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	adds r0, r1
	asrs r0, 8
	cmp r0, 0x7F
	ble _080AB0F0
	movs r0, 0
	strh r0, [r4, 0x3A]
	ldrh r0, [r4, 0x3C]
	negs r0, r0
	strh r0, [r4, 0x3C]
	b _080AB0F8
_080AB0F0:
	ldrh r0, [r4, 0x38]
	ldrh r1, [r4, 0x3A]
	adds r0, r1
	strh r0, [r4, 0x3A]
_080AB0F8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AB0AC

	thumb_func_start sub_80AB100
sub_80AB100: @ 80AB100
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AB120 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080AB124 @ =gUnknown_2037F02
	ldrh r0, [r3]
	movs r2, 0
	strh r0, [r1, 0x8]
	strh r2, [r3, 0xE]
	ldr r0, _080AB128 @ =sub_80AB12C
	str r0, [r1]
	bx lr
	.align 2, 0
_080AB120: .4byte gTasks
_080AB124: .4byte gUnknown_2037F02
_080AB128: .4byte sub_80AB12C
	thumb_func_end sub_80AB100

	thumb_func_start sub_80AB12C
sub_80AB12C: @ 80AB12C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080AB160 @ =gUnknown_2037F02
	ldrh r0, [r2, 0xE]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r2, 0xE]
	ldr r1, _080AB164 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	cmp r1, 0
	bne _080AB15A
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080AB15A:
	pop {r0}
	bx r0
	.align 2, 0
_080AB160: .4byte gUnknown_2037F02
_080AB164: .4byte gTasks
	thumb_func_end sub_80AB12C

	thumb_func_start sub_80AB168
sub_80AB168: @ 80AB168
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r7, _080AB1B4 @ =gUnknown_2037F1A
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r7]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r6, _080AB1B8 @ =0x0000fff6
	strh r6, [r4, 0x26]
	ldrb r0, [r7]
	bl sub_807685C
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AB1C2
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AB1BC
	movs r0, 0xA
	strh r0, [r4, 0x24]
	b _080AB1C4
	.align 2, 0
_080AB1B4: .4byte gUnknown_2037F1A
_080AB1B8: .4byte 0x0000fff6
_080AB1BC:
	strh r6, [r4, 0x24]
	subs r0, r5, 0x2
	b _080AB1C6
_080AB1C2:
	strh r6, [r4, 0x24]
_080AB1C4:
	adds r0, r5, 0x2
_080AB1C6:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r0, _080AB1D8 @ =sub_80AB1DC
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB1D8: .4byte sub_80AB1DC
	thumb_func_end sub_80AB168

	thumb_func_start sub_80AB1DC
sub_80AB1DC: @ 80AB1DC
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080AB1F2
	adds r0, r2, 0
	bl DestroyAnimSprite
_080AB1F2:
	pop {r0}
	bx r0
	thumb_func_end sub_80AB1DC

	thumb_func_start sub_80AB1F8
sub_80AB1F8: @ 80AB1F8
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r5, _080AB2B8 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080AB2BC @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080AB242
	ldr r4, _080AB2C0 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4]
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	beq _080AB23A
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080AB242
_080AB23A:
	movs r1, 0
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4]
_080AB242:
	ldr r5, _080AB2C0 @ =gUnknown_2037F02
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0
	cmp r0, 0
	bne _080AB256
	movs r1, 0x1
_080AB256:
	ldrb r0, [r5, 0xA]
	movs r7, 0x1
	cmp r0, 0
	bne _080AB260
	movs r7, 0x3
_080AB260:
	adds r0, r6, 0
	bl sub_8075160
	ldr r0, _080AB2B8 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AB27A
	ldrh r0, [r5, 0x4]
	negs r0, r0
	strh r0, [r5, 0x4]
_080AB27A:
	ldrh r0, [r5, 0x8]
	strh r0, [r6, 0x2E]
	ldr r4, _080AB2BC @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r6, 0x36]
	ldr r0, _080AB2C4 @ =sub_8075590
	str r0, [r6, 0x1C]
	ldr r1, _080AB2C8 @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB2B8: .4byte gUnknown_2037F1A
_080AB2BC: .4byte gUnknown_2037F1B
_080AB2C0: .4byte gUnknown_2037F02
_080AB2C4: .4byte sub_8075590
_080AB2C8: .4byte DestroyAnimSprite
	thumb_func_end sub_80AB1F8

	thumb_func_start sub_80AB2CC
sub_80AB2CC: @ 80AB2CC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r0, _080AB2FC @ =gUnknown_2037F02
	ldrh r1, [r0, 0x8]
	strh r1, [r4, 0x2E]
	ldrh r0, [r0, 0x4]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	strh r1, [r4, 0x36]
	ldr r0, _080AB300 @ =sub_8075590
	str r0, [r4, 0x1C]
	ldr r1, _080AB304 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB2FC: .4byte gUnknown_2037F02
_080AB300: .4byte sub_8075590
_080AB304: .4byte DestroyAnimSprite
	thumb_func_end sub_80AB2CC

	thumb_func_start sub_80AB308
sub_80AB308: @ 80AB308
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AB320 @ =gUnknown_2037F02
	movs r1, 0x6
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080AB324
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
	b _080AB32C
	.align 2, 0
_080AB320: .4byte gUnknown_2037F02
_080AB324:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075160
_080AB32C:
	ldr r0, _080AB33C @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x3C]
	ldr r0, _080AB340 @ =sub_80AB344
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB33C: .4byte gUnknown_2037F02
_080AB340: .4byte sub_80AB344
	thumb_func_end sub_80AB308

	thumb_func_start sub_80AB344
sub_80AB344: @ 80AB344
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
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080AB384
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AB384:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AB344

	thumb_func_start sub_80AB38C
sub_80AB38C: @ 80AB38C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r1, _080AB3FC @ =0x00003f42
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
	movs r2, 0x1
	bl SetAnimBgAttribute
	mov r0, sp
	bl sub_80752A0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AB418
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
	ldr r0, _080AB400 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080AB408
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AB404 @ =gUnknown_8E81D14
	bl sub_807543C
	b _080AB42E
	.align 2, 0
_080AB3FC: .4byte 0x00003f42
_080AB400: .4byte gUnknown_2037F1A
_080AB404: .4byte gUnknown_8E81D14
_080AB408:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AB414 @ =gUnknown_8E81FE4
	bl sub_807543C
	b _080AB42E
	.align 2, 0
_080AB414: .4byte gUnknown_8E81FE4
_080AB418:
	ldr r0, _080AB458 @ =gUnknown_8E822B8
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0x1
	bl sub_80730C0
_080AB42E:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AB45C @ =gUnknown_8E809CC
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080AB460 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AB468
	ldr r0, _080AB464 @ =gUnknown_8E81CEC
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080AB476
	.align 2, 0
_080AB458: .4byte gUnknown_8E822B8
_080AB45C: .4byte gUnknown_8E809CC
_080AB460: .4byte gUnknown_2037F02
_080AB464: .4byte gUnknown_8E81CEC
_080AB468:
	ldr r0, _080AB4E0 @ =gUnknown_8E7BAB0
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
_080AB476:
	ldr r0, _080AB4E4 @ =sub_80AB79C
	ldr r4, _080AB4E8 @ =gTasks
	mov r2, r10
	lsls r5, r2, 2
	adds r1, r5, r2
	lsls r1, 3
	adds r6, r1, r4
	ldrb r1, [r6, 0x7]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0
	mov r9, r0
	mov r1, r8
	strh r1, [r6, 0x26]
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r7, r0, r4
	mov r0, r9
	strh r0, [r7, 0x8]
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r7, 0xA]
	strh r0, [r7, 0xC]
	bl sub_8073788
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080AB4F8
	ldr r1, _080AB4EC @ =0x0000ffb0
	adds r0, r1, 0
	ldr r2, _080AB4F0 @ =gUnknown_2022978
	strh r0, [r2]
	adds r1, 0x20
	adds r0, r1, 0
	ldr r2, _080AB4F4 @ =gUnknown_202297A
	strh r0, [r2]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	movs r0, 0x1
	strh r0, [r6, 0xA]
	mov r0, r9
	strh r0, [r7, 0xE]
	b _080AB552
	.align 2, 0
_080AB4E0: .4byte gUnknown_8E7BAB0
_080AB4E4: .4byte sub_80AB79C
_080AB4E8: .4byte gTasks
_080AB4EC: .4byte 0x0000ffb0
_080AB4F0: .4byte gUnknown_2022978
_080AB4F4: .4byte gUnknown_202297A
_080AB4F8:
	ldr r0, _080AB528 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080AB53C
	ldr r2, _080AB52C @ =0x0000ff20
	adds r0, r2, 0
	ldr r2, _080AB530 @ =gUnknown_2022978
	strh r0, [r2]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldr r2, _080AB534 @ =gUnknown_202297A
	strh r0, [r2]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	ldr r0, _080AB538 @ =0x0000ffff
	strh r0, [r6, 0xA]
	strh r1, [r7, 0xE]
	b _080AB552
	.align 2, 0
_080AB528: .4byte gUnknown_2037F1A
_080AB52C: .4byte 0x0000ff20
_080AB530: .4byte gUnknown_2022978
_080AB534: .4byte gUnknown_202297A
_080AB538: .4byte 0x0000ffff
_080AB53C:
	ldr r0, _080AB584 @ =gUnknown_2022978
	strh r4, [r0]
	ldr r1, _080AB588 @ =0x0000ffd0
	adds r0, r1, 0
	ldr r2, _080AB58C @ =gUnknown_202297A
	strh r0, [r2]
	ldr r0, _080AB590 @ =0x0000fffe
	strh r0, [r6, 0x8]
	movs r0, 0x1
	strh r0, [r6, 0xA]
	strh r4, [r7, 0xE]
_080AB552:
	ldr r0, _080AB584 @ =gUnknown_2022978
	ldrh r1, [r0]
	movs r0, 0x14
	bl SetGpuReg
	ldr r2, _080AB58C @ =gUnknown_202297A
	ldrh r1, [r2]
	movs r0, 0x16
	bl SetGpuReg
	ldr r1, _080AB594 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080AB598
	movs r0, 0x30
	strh r0, [r1, 0x10]
	movs r0, 0x70
	b _080AB59C
	.align 2, 0
_080AB584: .4byte gUnknown_2022978
_080AB588: .4byte 0x0000ffd0
_080AB58C: .4byte gUnknown_202297A
_080AB590: .4byte 0x0000fffe
_080AB594: .4byte gTasks
_080AB598:
	movs r0, 0
	strh r0, [r1, 0x10]
_080AB59C:
	strh r0, [r1, 0x12]
	ldr r1, _080AB5C0 @ =gTasks
	mov r2, r10
	adds r0, r5, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x14]
	ldr r1, _080AB5C4 @ =sub_80AB5C8
	str r1, [r0]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB5C0: .4byte gTasks
_080AB5C4: .4byte sub_80AB5C8
	thumb_func_end sub_80AB38C

	thumb_func_start sub_80AB5C8
sub_80AB5C8: @ 80AB5C8
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080AB6F4 @ =gUnknown_2022978
	ldr r2, _080AB6F8 @ =gUnknown_202297A
	ldr r0, _080AB6FC @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x8]
	ldrh r3, [r1]
	adds r0, r3
	strh r0, [r1]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	mov r0, sp
	bl sub_80752A0
	ldrh r0, [r4, 0xA]
	ldrh r3, [r4, 0xC]
	adds r0, r3
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080AB65C
	ldr r1, _080AB700 @ =gUnknown_20375F8
	mov r0, sp
	ldrb r0, [r0, 0x8]
	lsls r0, 4
	adds r0, 0x7
	lsls r0, 1
	adds r0, r1
	ldrh r6, [r0]
	movs r2, 0x6
	adds r7, r1, 0
	adds r3, r7, 0
	mov r4, sp
_080AB622:
	ldrb r0, [r4, 0x8]
	lsls r0, 4
	adds r1, r2, 0x1
	adds r0, r1
	lsls r1, r0, 1
	adds r1, r3
	subs r0, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080AB622
	mov r0, sp
	ldrb r0, [r0, 0x8]
	lsls r0, 4
	adds r0, 0x1
	lsls r0, 1
	adds r0, r7
	strh r6, [r0]
	ldr r1, _080AB6FC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x12]
_080AB65C:
	ldr r1, _080AB6FC @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0x14]
	adds r0, 0x1
	strh r0, [r3, 0x14]
	lsls r0, 16
	asrs r0, 16
	adds r4, r1, 0
	adds r6, r2, 0
	cmp r0, 0x1
	ble _080AB6CA
	movs r0, 0
	strh r0, [r3, 0x14]
	ldrh r0, [r3, 0xE]
	adds r2, r0, 0x1
	strh r2, [r3, 0xE]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xD
	bgt _080AB6A6
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1, 0xA]
	ldrh r0, [r3, 0x10]
	adds r0, 0x1
	strh r0, [r3, 0x10]
_080AB6A6:
	movs r1, 0xE
	ldrsh r0, [r3, r1]
	cmp r0, 0x36
	ble _080AB6CA
	ldrh r2, [r3, 0x10]
	subs r2, 0x1
	strh r2, [r3, 0x10]
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1, 0xA]
_080AB6CA:
	adds r0, r6, r5
	lsls r0, 3
	adds r2, r0, r4
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldrh r0, [r0, 0xA]
	movs r3, 0x1F
	ands r3, r0
	cmp r3, 0
	bne _080AB6EC
	strh r3, [r2, 0x8]
	ldr r0, _080AB704 @ =sub_80AB708
	str r0, [r2]
_080AB6EC:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB6F4: .4byte gUnknown_2022978
_080AB6F8: .4byte gUnknown_202297A
_080AB6FC: .4byte gTasks
_080AB700: .4byte gUnknown_20375F8
_080AB704: .4byte sub_80AB708
	thumb_func_end sub_80AB5C8

	thumb_func_start sub_80AB708
sub_80AB708: @ 80AB708
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r7, _080AB740 @ =gUnknown_2022978
	ldr r0, _080AB744 @ =gUnknown_202297A
	mov r8, r0
	ldr r6, _080AB748 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r6
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AB74C
	movs r0, 0x1
	bl sub_8075358
	movs r0, 0x2
	bl sub_8075358
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080AB78E
	.align 2, 0
_080AB740: .4byte gUnknown_2022978
_080AB744: .4byte gUnknown_202297A
_080AB748: .4byte gTasks
_080AB74C:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AB760
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080AB760:
	movs r0, 0
	strh r0, [r7]
	mov r1, r8
	strh r0, [r1]
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldr r1, _080AB798 @ =0x0000ffff
	strh r1, [r0, 0x26]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080AB78E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB798: .4byte 0x0000ffff
	thumb_func_end sub_80AB708

	thumb_func_start sub_80AB79C
sub_80AB79C: @ 80AB79C
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080AB7C4 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080AB7B8
	b _080AB8F0
_080AB7B8:
	cmp r0, 0x1
	bgt _080AB7C8
	cmp r0, 0
	beq _080AB7D0
	b _080ABA66
	.align 2, 0
_080AB7C4: .4byte gTasks
_080AB7C8:
	cmp r0, 0x2
	bne _080AB7CE
	b _080AB9BC
_080AB7CE:
	b _080ABA66
_080AB7D0:
	movs r3, 0
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	ldr r1, _080AB8A0 @ =gUnknown_2038700
	mov r12, r1
	cmp r3, r0
	bge _080AB80E
	mov r7, r12
	movs r5, 0xF0
	lsls r5, 3
	add r5, r12
	ldr r6, _080AB8A4 @ =0x0000ffff
_080AB7E8:
	lsls r2, r3, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r7
	adds r1, r5
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r1, [r4, 0xC]
	adds r0, r6, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	asrs r2, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _080AB7E8
_080AB80E:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080AB848
	ldr r5, _080AB8A0 @ =gUnknown_2038700
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
	ldr r7, _080AB8A4 @ =0x0000ffff
_080AB826:
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r5
	adds r1, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldrh r1, [r4, 0xA]
	adds r0, r7, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080AB826
_080AB848:
	ldrh r3, [r4, 0x12]
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, 0x9F
	bgt _080AB87E
	ldr r5, _080AB8A0 @ =gUnknown_2038700
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
	ldr r7, _080AB8A4 @ =0x0000ffff
_080AB85C:
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r5
	adds r1, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r1, [r4, 0xC]
	adds r0, r7, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, 0x9F
	ble _080AB85C
_080AB87E:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AB8A8
	lsls r0, r3, 16
	asrs r0, 15
	mov r3, r12
	adds r2, r0, r3
	movs r1, 0xF0
	lsls r1, 3
	add r1, r12
	adds r0, r1
	ldrh r1, [r4, 0xA]
	strh r1, [r0]
	ldrh r0, [r4, 0xA]
	b _080AB8BE
	.align 2, 0
_080AB8A0: .4byte gUnknown_2038700
_080AB8A4: .4byte 0x0000ffff
_080AB8A8:
	lsls r0, r3, 16
	asrs r0, 15
	mov r1, r12
	adds r2, r0, r1
	movs r1, 0xF0
	lsls r1, 3
	add r1, r12
	adds r0, r1
	ldrh r1, [r4, 0xC]
	strh r1, [r0]
	ldrh r0, [r4, 0xC]
_080AB8BE:
	strh r0, [r2]
	ldr r0, _080AB8E8 @ =0x04000052
	str r0, [sp]
	ldr r0, _080AB8EC @ =0xa2600001
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
	bl sub_8087EE4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080ABA66
	.align 2, 0
_080AB8E8: .4byte 0x04000052
_080AB8EC: .4byte 0xa2600001
_080AB8F0:
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _080AB908
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bgt _080AB91C
	strh r1, [r4, 0x10]
	b _080AB916
_080AB908:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	ble _080AB91C
_080AB916:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080AB91C:
	movs r3, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080AB950
	ldr r6, _080AB9B4 @ =gUnknown_2038700
	ldr r5, _080AB9B8 @ =gUnknown_2039600
_080AB92A:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldrb r2, [r5, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	adds r3, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080AB92A
_080AB950:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080AB984
	ldr r6, _080AB9B4 @ =gUnknown_2038700
	ldr r5, _080AB9B8 @ =gUnknown_2039600
_080AB962:
	asrs r3, r2, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	adds r3, 0x1
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080AB962
_080AB984:
	ldrh r3, [r4, 0x12]
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080ABA66
	ldr r6, _080AB9B4 @ =gUnknown_2038700
	ldr r5, _080AB9B8 @ =gUnknown_2039600
_080AB992:
	asrs r3, r1, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080AB992
	b _080ABA66
	.align 2, 0
_080AB9B4: .4byte gUnknown_2038700
_080AB9B8: .4byte gUnknown_2039600
_080AB9BC:
	movs r3, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080AB9F0
	ldr r6, _080ABA70 @ =gUnknown_2038700
	ldr r5, _080ABA74 @ =gUnknown_2039600
_080AB9CA:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldrb r2, [r5, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	adds r3, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080AB9CA
_080AB9F0:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080ABA24
	ldr r6, _080ABA70 @ =gUnknown_2038700
	ldr r5, _080ABA74 @ =gUnknown_2039600
_080ABA02:
	asrs r3, r2, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	adds r3, 0x1
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080ABA02
_080ABA24:
	ldrh r3, [r4, 0x12]
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080ABA50
	ldr r6, _080ABA70 @ =gUnknown_2038700
	ldr r5, _080ABA74 @ =gUnknown_2039600
_080ABA32:
	asrs r3, r1, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080ABA32
_080ABA50:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080ABA66
	bl remove_some_task
	adds r0, r7, 0
	bl DestroyTask
_080ABA66:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABA70: .4byte gUnknown_2038700
_080ABA74: .4byte gUnknown_2039600
	thumb_func_end sub_80AB79C

	thumb_func_start sub_80ABA78
sub_80ABA78: @ 80ABA78
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r3, _080ABACC @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080ABAD0 @ =0xfffffc00
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
	ldr r1, _080ABAD4 @ =0x000001ff
	ands r1, r0
	adds r0, r1, 0
	cmp r0, 0xFF
	ble _080ABABE
	subs r0, r6, r0
	lsls r0, 16
	lsrs r1, r0, 16
_080ABABE:
	strh r5, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldr r0, _080ABAD8 @ =sub_80ABADC
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ABACC: .4byte 0x000003ff
_080ABAD0: .4byte 0xfffffc00
_080ABAD4: .4byte 0x000001ff
_080ABAD8: .4byte sub_80ABADC
	thumb_func_end sub_80ABA78

	thumb_func_start sub_80ABADC
sub_80ABADC: @ 80ABADC
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
	beq _080ABB00
	lsls r0, r3, 16
	asrs r0, 24
	negs r0, r0
	b _080ABB04
_080ABB00:
	lsls r0, r3, 16
	asrs r0, 24
_080ABB04:
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
	bne _080ABB22
	adds r0, r2, 0
	bl DestroyAnimSprite
_080ABB22:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ABADC

	thumb_func_start sub_80ABB28
sub_80ABB28: @ 80ABB28
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080ABB78 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r2, _080ABB7C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x12]
	bl sub_80ABDC8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80758E0
	ldr r0, _080ABB80 @ =sub_80ABB84
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ABB78: .4byte gTasks
_080ABB7C: .4byte gSprites
_080ABB80: .4byte sub_80ABB84
	thumb_func_end sub_80ABB28

	thumb_func_start sub_80ABB84
sub_80ABB84: @ 80ABB84
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080ABBAC @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bls _080ABBA0
	b _080ABDBE
_080ABBA0:
	lsls r0, 2
	ldr r1, _080ABBB0 @ =_080ABBB4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ABBAC: .4byte gTasks
_080ABBB0: .4byte _080ABBB4
	.align 2, 0
_080ABBB4:
	.4byte _080ABBD4
	.4byte _080ABBFA
	.4byte _080ABC8C
	.4byte _080ABCC2
	.4byte _080ABCD6
	.4byte _080ABCE4
	.4byte _080ABD64
	.4byte _080ABDB0
_080ABBD4:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0xE0
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 2
	str r0, [sp, 0x4]
	movs r0, 0x20
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r2, r3, 0
	bl sub_80765D4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080ABBFA:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080ABC56
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080ABC44
	ldr r2, _080ABC40 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strh r1, [r0, 0x24]
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x1
	strh r1, [r0, 0x22]
	b _080ABC56
	.align 2, 0
_080ABC40: .4byte gSprites
_080ABC44:
	ldr r2, _080ABC84 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080ABC88 @ =0x0000fffd
	strh r1, [r0, 0x24]
_080ABC56:
	adds r0, r4, 0
	bl sub_8076640
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080ABC66
	b _080ABDBE
_080ABC66:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8076440
	ldr r2, _080ABC84 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	strh r5, [r4, 0xE]
	b _080ABDA0
	.align 2, 0
_080ABC84: .4byte gSprites
_080ABC88: .4byte 0x0000fffd
_080ABC8C:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080ABC9C
	b _080ABDBE
_080ABC9C:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xE0
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_80765D4
	movs r0, 0
	strh r0, [r4, 0xE]
	b _080ABDA2
_080ABCC2:
	adds r0, r4, 0
	bl sub_8076640
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080ABDBE
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	b _080ABDA2
_080ABCD6:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80ABE4C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080ABCE4:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080ABDBE
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080ABD1C
	ldr r2, _080ABD18 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x2
	b _080ABD2E
	.align 2, 0
_080ABD18: .4byte gSprites
_080ABD1C:
	ldr r2, _080ABD60 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x2
_080ABD2E:
	strh r1, [r0, 0x26]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080ABDBE
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xE0
	bl sub_80765D4
	movs r0, 0
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	b _080ABDA2
	.align 2, 0
_080ABD60: .4byte gSprites
_080ABD64:
	ldr r6, _080ABDAC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
	adds r0, r4, 0
	bl sub_8076640
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080ABDBE
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8075980
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0x12]
	strh r1, [r0, 0x22]
_080ABDA0:
	strh r5, [r4, 0x10]
_080ABDA2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080ABDBE
	.align 2, 0
_080ABDAC: .4byte gSprites
_080ABDB0:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080ABDBE
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080ABDBE:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80ABB84

	thumb_func_start sub_80ABDC8
sub_80ABDC8: @ 80ABDC8
	push {r4,r5,lr}
	ldr r4, _080ABDEC @ =gUnknown_2037F1A
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080ABDFC
	ldr r1, _080ABDF0 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080ABDF4 @ =gPlayerParty
	b _080ABE0C
	.align 2, 0
_080ABDEC: .4byte gUnknown_2037F1A
_080ABDF0: .4byte gBattlerPartyIndexes
_080ABDF4: .4byte gPlayerParty
_080ABDF8:
	adds r0, r2, 0
	b _080ABE3E
_080ABDFC:
	ldr r1, _080ABE44 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080ABE48 @ =gEnemyParty
_080ABE0C:
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	lsrs r4, 18
	movs r2, 0
_080ABE2A:
	adds r1, r2, 0x1
	adds r0, r4, 0
	muls r0, r1
	cmp r3, r0
	blt _080ABDF8
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080ABE2A
	movs r0, 0x3
_080ABE3E:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080ABE44: .4byte gBattlerPartyIndexes
_080ABE48: .4byte gEnemyParty
	thumb_func_end sub_80ABDC8

	thumb_func_start sub_80ABE4C
sub_80ABE4C: @ 80ABE4C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	ldr r4, _080ABF54 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0xAC
	ldrb r0, [r4]
	bl sub_807685C
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldrh r1, [r7, 0xA]
	movs r0, 0x4
	subs r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bgt _080ABE9C
	movs r1, 0x1
_080ABE9C:
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r1, 16
	mov r10, r8
	mov r9, r6
	mov r1, r10
	lsls r1, 4
	str r1, [sp, 0xC]
	mov r1, r9
	lsls r1, 4
	str r1, [sp, 0x10]
	asrs r0, 16
	mov r8, r0
_080ABEB6:
	ldr r0, _080ABF58 @ =gUnknown_83E5AE0
	mov r1, r10
	mov r2, r9
	ldr r3, [sp, 0x8]
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r6, r5, 16
	cmp r2, 0x40
	beq _080ABF1E
	ldr r1, _080ABF5C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x30]
	mov r1, sp
	ldrh r1, [r1, 0xC]
	strh r1, [r5, 0x32]
	mov r0, sp
	ldrh r0, [r0, 0x10]
	strh r0, [r5, 0x34]
	asrs r4, r6, 16
	adds r0, r4, 0
	movs r1, 0x40
	bl Cos
	strh r0, [r5, 0x36]
	adds r0, r4, 0
	movs r1, 0x40
	bl Sin
	strh r0, [r5, 0x38]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r5, 0x3A]
	movs r0, 0x2
	strh r0, [r5, 0x3C]
	ldrh r1, [r7, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080ABF18
	adds r0, r5, 0
	bl sub_80ABF60
_080ABF18:
	ldrh r0, [r7, 0xC]
	adds r0, 0x1
	strh r0, [r7, 0xC]
_080ABF1E:
	mov r1, r8
	lsls r0, r1, 1
	asrs r1, r6, 16
	adds r1, r0
	lsls r1, 16
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r5, r0, 16
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r0, 16
	add r0, r8
	lsls r0, 16
	lsrs r1, r0, 16
	str r1, [sp, 0x4]
	asrs r0, 16
	cmp r0, 0x13
	ble _080ABEB6
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABF54: .4byte gUnknown_2037F1A
_080ABF58: .4byte gUnknown_83E5AE0
_080ABF5C: .4byte gSprites
	thumb_func_end sub_80ABE4C

	thumb_func_start sub_80ABF60
sub_80ABF60: @ 80ABF60
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080ABF72
	cmp r0, 0x1
	beq _080ABFA8
	b _080AC002
_080ABF72:
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x36]
	adds r1, r0
	strh r1, [r4, 0x36]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080ABFA8:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x38]
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r2, r1, 20
	strh r2, [r4, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080ABFDE
	adds r1, r2, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080ABFDE
	cmp r1, 0x78
	ble _080AC002
_080ABFDE:
	ldr r3, _080AC008 @ =gTasks
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
_080AC002:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC008: .4byte gTasks
	thumb_func_end sub_80ABF60

	thumb_func_start sub_80AC00C
sub_80AC00C: @ 80AC00C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080AC03C @ =gTasks
	adds r4, r1, r0
	bl sub_80ABDC8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldr r0, _080AC040 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AC044
	movs r0, 0x88
	strh r0, [r4, 0x10]
	movs r0, 0x28
	b _080AC04A
	.align 2, 0
_080AC03C: .4byte gTasks
_080AC040: .4byte gUnknown_2037F1A
_080AC044:
	movs r0, 0x10
	strh r0, [r4, 0x10]
	movs r0, 0x50
_080AC04A:
	strh r0, [r4, 0x14]
	movs r0, 0x62
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x10]
	adds r0, 0x31
	strh r0, [r4, 0x16]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x5
	strh r0, [r4, 0x20]
	ldr r0, _080AC06C @ =sub_80AC070
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC06C: .4byte sub_80AC070
	thumb_func_end sub_80AC00C

	thumb_func_start sub_80AC070
sub_80AC070: @ 80AC070
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r7, _080AC094 @ =gTasks
	adds r4, r0, r7
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _080AC098
	cmp r2, 0x1
	beq _080AC148
	b _080AC156
	.align 2, 0
_080AC094: .4byte gTasks
_080AC098:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080AC0AE
	strh r2, [r4, 0xC]
	adds r0, r4, 0
	bl sub_80AC160
_080AC0AE:
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AC128
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080AC128
	ldr r5, _080AC13C @ =gUnknown_2037F02
	movs r1, 0x1
	mov r8, r1
	mov r2, r8
	strh r2, [r5]
	strh r0, [r5, 0x2]
	movs r0, 0xC
	strh r0, [r5, 0x4]
	ldr r6, _080AC140 @ =sub_80B94B4
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080AC0F8
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r7
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldr r1, _080AC144 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080AC0F8:
	movs r0, 0x3
	strh r0, [r5]
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080AC124
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r7
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldr r1, _080AC144 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080AC124:
	mov r0, r8
	strh r0, [r4, 0x22]
_080AC128:
	movs r2, 0x1E
	ldrsh r1, [r4, r2]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080AC156
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080AC156
	.align 2, 0
_080AC13C: .4byte gUnknown_2037F02
_080AC140: .4byte sub_80B94B4
_080AC144: .4byte gUnknown_2037EE2
_080AC148:
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080AC156
	adds r0, r1, 0
	bl DestroyAnimVisualTask
_080AC156:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80AC070

	thumb_func_start sub_80AC160
sub_80AC160: @ 80AC160
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _080AC1EC @ =gUnknown_825E074
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x3
	asrs r0, 4
	ldrh r2, [r4, 0x14]
	adds r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080AC1F0 @ =gUnknown_83E5AE0
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080AC1BA
	ldr r3, _080AC1F4 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _080AC1F8 @ =sub_80AC204
	str r2, [r1]
	adds r0, r3
	strh r5, [r0, 0x38]
	strh r6, [r0, 0x3A]
	movs r1, 0x9
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
_080AC1BA:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x18]
	adds r0, 0x27
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x18]
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	ldr r0, _080AC1FC @ =0x41c64e6d
	muls r0, r1
	ldr r1, _080AC200 @ =0x00003039
	adds r0, r1
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r4, 0x10]
	adds r1, r0
	strh r1, [r4, 0x16]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC1EC: .4byte gUnknown_825E074
_080AC1F0: .4byte gUnknown_83E5AE0
_080AC1F4: .4byte gSprites
_080AC1F8: .4byte sub_80AC204
_080AC1FC: .4byte 0x41c64e6d
_080AC200: .4byte 0x00003039
	thumb_func_end sub_80AC160

	thumb_func_start sub_80AC204
sub_80AC204: @ 80AC204
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AC29A
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x38
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _080AC29A
	ldr r2, _080AC2A0 @ =gTasks
	movs r3, 0x3A
	ldrsh r1, [r5, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x1C]
	ldr r0, _080AC2A4 @ =gUnknown_83E7C38
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x30]
	cmp r0, 0x40
	beq _080AC294
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080AC2A8 @ =gSprites
	adds r0, r4
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x3A]
	strh r1, [r0, 0x3A]
	movs r3, 0x30
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x3C]
	strh r1, [r0, 0x3C]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080AC2AC @ =sub_80AC2B0
	str r1, [r0]
_080AC294:
	adds r0, r5, 0
	bl DestroySprite
_080AC29A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC2A0: .4byte gTasks
_080AC2A4: .4byte gUnknown_83E7C38
_080AC2A8: .4byte gSprites
_080AC2AC: .4byte sub_80AC2B0
	thumb_func_end sub_80AC204

	thumb_func_start sub_80AC2B0
sub_80AC2B0: @ 80AC2B0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AC31C
	movs r0, 0
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
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080AC31C
	ldr r3, _080AC324 @ =gTasks
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
_080AC31C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC324: .4byte gTasks
	thumb_func_end sub_80AC2B0

	thumb_func_start sub_80AC328
sub_80AC328: @ 80AC328
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080AC3AC @ =gTasks
	adds r5, r1, r0
	ldr r4, _080AC3B0 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080AC36C
	movs r1, 0x1
_080AC36C:
	strh r1, [r5, 0x16]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080AC380
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r5, 0x16]
_080AC380:
	movs r2, 0x16
	ldrsh r0, [r5, r2]
	lsls r0, 3
	ldrh r1, [r5, 0xE]
	adds r0, r1
	strh r0, [r5, 0x12]
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	lsls r1, 3
	ldrh r0, [r5, 0x10]
	subs r0, r1
	strh r0, [r5, 0x14]
	ldr r0, _080AC3B4 @ =0x0000ffe0
	strh r0, [r5, 0x1A]
	strh r6, [r5, 0xA]
	strh r6, [r5, 0x8]
	ldr r0, _080AC3B8 @ =sub_80AC3BC
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC3AC: .4byte gTasks
_080AC3B0: .4byte gUnknown_2037F1A
_080AC3B4: .4byte 0x0000ffe0
_080AC3B8: .4byte sub_80AC3BC
	thumb_func_end sub_80AC328

	thumb_func_start sub_80AC3BC
sub_80AC3BC: @ 80AC3BC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080AC3E0 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bls _080AC3D6
	b _080AC4F6
_080AC3D6:
	lsls r0, 2
	ldr r1, _080AC3E4 @ =_080AC3E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AC3E0: .4byte gTasks
_080AC3E4: .4byte _080AC3E8
	.align 2, 0
_080AC3E8:
	.4byte _080AC404
	.4byte _080AC414
	.4byte _080AC42E
	.4byte _080AC470
	.4byte _080AC492
	.4byte _080AC4C0
	.4byte _080AC4E6
_080AC404:
	adds r0, r4, 0
	bl sub_80AC504
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AC4FC
	b _080AC4EE
_080AC414:
	adds r0, r4, 0
	bl sub_80AC504
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080AC4FC
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080AC4EE
_080AC42E:
	adds r0, r4, 0
	bl sub_80AC504
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x12]
	adds r1, r0
	movs r2, 0
	strh r1, [r4, 0x12]
	adds r1, 0x10
	lsls r1, 16
	movs r0, 0x88
	lsls r0, 17
	cmp r1, r0
	bls _080AC4FC
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080AC46C
	movs r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x6
	strh r0, [r4, 0x8]
	strh r2, [r4, 0xA]
	b _080AC4FC
_080AC46C:
	strh r2, [r4, 0xA]
	b _080AC4EE
_080AC470:
	adds r0, r4, 0
	bl sub_80AC504
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x14]
	subs r0, r1
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080AC4FC
	b _080AC4EE
_080AC492:
	adds r0, r4, 0
	bl sub_80AC504
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x12]
	adds r0, 0x10
	lsls r0, 16
	movs r1, 0x88
	lsls r1, 17
	cmp r0, r1
	bls _080AC4FC
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080AC4EE
_080AC4C0:
	adds r0, r4, 0
	bl sub_80AC504
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x14]
	subs r0, r1
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080AC4FC
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080AC4FC
_080AC4E6:
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AC4FC
_080AC4EE:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080AC4FC
_080AC4F6:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080AC4FC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AC3BC

	thumb_func_start sub_80AC504
sub_80AC504: @ 80AC504
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AC55E
	movs r0, 0
	strh r0, [r6, 0xC]
	ldr r0, _080AC564 @ =gUnknown_83E5AE0
	movs r2, 0xE
	ldrsh r1, [r6, r2]
	movs r3, 0x10
	ldrsh r2, [r6, r3]
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080AC55E
	ldr r5, _080AC568 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	movs r1, 0x10
	strh r1, [r0, 0x2E]
	ldrh r1, [r6, 0x12]
	strh r1, [r0, 0x32]
	ldrh r1, [r6, 0x14]
	strh r1, [r0, 0x36]
	ldrh r1, [r6, 0x1A]
	strh r1, [r0, 0x38]
	bl sub_8075068
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080AC56C @ =sub_80AC570
	str r0, [r4]
	ldrh r0, [r6, 0x18]
	adds r0, 0x1
	strh r0, [r6, 0x18]
_080AC55E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC564: .4byte gUnknown_83E5AE0
_080AC568: .4byte gSprites
_080AC56C: .4byte sub_80AC570
	thumb_func_end sub_80AC504

	thumb_func_start sub_80AC570
sub_80AC570: @ 80AC570
	push {r4-r6,lr}
	adds r6, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080AC5CA
	ldrh r0, [r6, 0x24]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrh r0, [r6, 0x26]
	ldrh r1, [r6, 0x22]
	adds r0, r1
	strh r0, [r6, 0x22]
	movs r0, 0x6
	strh r0, [r6, 0x2E]
	bl Random
	movs r4, 0x1F
	adds r1, r4, 0
	ands r1, r0
	ldr r5, _080AC5D0 @ =0x0000fff0
	adds r1, r5
	ldrh r0, [r6, 0x20]
	adds r1, r0
	strh r1, [r6, 0x32]
	bl Random
	ands r4, r0
	adds r4, r5
	ldrh r1, [r6, 0x22]
	adds r4, r1
	strh r4, [r6, 0x36]
	bl Random
	movs r1, 0x7
	ands r1, r0
	mvns r1, r1
	strh r1, [r6, 0x38]
	adds r0, r6, 0
	bl sub_8075068
	ldr r0, _080AC5D4 @ =sub_80AC5D8
	str r0, [r6, 0x1C]
_080AC5CA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC5D0: .4byte 0x0000fff0
_080AC5D4: .4byte sub_80AC5D8
	thumb_func_end sub_80AC570

	thumb_func_start sub_80AC5D8
sub_80AC5D8: @ 80AC5D8
	push {r4-r6,lr}
	adds r5, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080AC614
	movs r4, 0
	ldr r6, _080AC61C @ =gTasks
_080AC5EA:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r6
	ldr r1, [r2]
	ldr r0, _080AC620 @ =sub_80AC3BC
	cmp r1, r0
	bne _080AC60A
	movs r0, 0x1
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0x18]
	subs r0, 0x1
	strh r0, [r2, 0x18]
	adds r0, r5, 0
	bl DestroySprite
_080AC60A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080AC5EA
_080AC614:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC61C: .4byte gTasks
_080AC620: .4byte sub_80AC3BC
	thumb_func_end sub_80AC5D8

	thumb_func_start sub_80AC624
sub_80AC624: @ 80AC624
	ldr r2, _080AC644 @ =gUnknown_2037F02
	ldrh r1, [r2]
	strh r1, [r0, 0x20]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x2E]
	ldrh r1, [r2, 0x6]
	strh r1, [r0, 0x30]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0x32]
	ldrh r1, [r2, 0xA]
	strh r1, [r0, 0x34]
	ldr r1, _080AC648 @ =sub_80AC64C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080AC644: .4byte gUnknown_2037F02
_080AC648: .4byte sub_80AC64C
	thumb_func_end sub_80AC624

	thumb_func_start sub_80AC64C
sub_80AC64C: @ 80AC64C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x2E]
	subs r0, r1
	strh r0, [r4, 0x36]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _080AC690
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AC690:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AC64C

	thumb_func_start sub_80AC698
sub_80AC698: @ 80AC698
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 23
	strh r1, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080AC6D0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080AC6D0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AC698

	thumb_func_start sub_80AC6D8
sub_80AC6D8: @ 80AC6D8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r5, _080AC714 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldr r1, _080AC718 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldr r0, _080AC71C @ =sub_80AC720
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC714: .4byte gUnknown_2037F1B
_080AC718: .4byte gUnknown_2037F02
_080AC71C: .4byte sub_80AC720
	thumb_func_end sub_80AC6D8

	thumb_func_start sub_80AC720
sub_80AC720: @ 80AC720
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	subs r6, r1, r0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	subs r5, r1, r0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	muls r0, r6
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	muls r0, r5
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080AC778
	movs r0, 0
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80AC798
_080AC778:
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080AC78A
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AC78A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80AC720

	thumb_func_start sub_80AC798
sub_80AC798: @ 80AC798
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r4, r1, 0
	adds r5, r2, 0
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	lsls r1, 15
	lsrs r1, 16
	str r1, [sp]
	ldrh r1, [r0, 0x24]
	ldrh r3, [r0, 0x20]
	adds r1, r3
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r0, r5, r0
	subs r0, 0x5
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	bl Random
	negs r4, r4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r4, r0
	subs r4, 0x5
	lsls r4, 16
	lsrs r7, r4, 16
	movs r6, 0
	mov r0, r8
	lsls r0, 16
	mov r8, r0
	mov r1, r10
	lsls r1, 16
	str r1, [sp, 0xC]
	ldr r2, [sp]
	lsls r2, 16
	str r2, [sp, 0x10]
	asrs r1, 16
	lsls r0, r7, 16
	asrs r5, r0, 16
	str r0, [sp, 0x14]
	negs r3, r5
	str r3, [sp, 0x4]
	asrs r0, r2, 16
	adds r1, r0
	lsls r1, 16
	mov r10, r1
_080AC826:
	ldr r0, _080AC868 @ =gUnknown_83E5B88
	mov r2, r8
	asrs r1, r2, 16
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0x82
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080AC86C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	ldr r0, _080AC870 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_807685C
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	cmp r5, 0
	bge _080AC874
	mov r1, sp
	ldrh r1, [r1, 0x4]
	strh r1, [r4, 0x32]
	b _080AC876
	.align 2, 0
_080AC868: .4byte gUnknown_83E5B88
_080AC86C: .4byte gSprites
_080AC870: .4byte gUnknown_2037F1A
_080AC874:
	strh r7, [r4, 0x32]
_080AC876:
	lsls r0, r6, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r6, r0, 16
	cmp r0, 0
	ble _080AC826
	movs r6, 0
	ldr r3, [sp, 0xC]
	asrs r1, r3, 16
	ldr r0, [sp, 0x14]
	asrs r5, r0, 16
	negs r2, r5
	str r2, [sp, 0x8]
	ldr r3, [sp, 0x10]
	asrs r0, r3, 16
	subs r1, r0
	lsls r1, 16
	mov r10, r1
_080AC89C:
	ldr r0, _080AC8E0 @ =gUnknown_83E5B88
	mov r2, r8
	asrs r1, r2, 16
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0x82
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080AC8E4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	ldr r0, _080AC8E8 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_807685C
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	cmp r5, 0
	ble _080AC8EC
	mov r1, sp
	ldrh r1, [r1, 0x8]
	strh r1, [r4, 0x32]
	b _080AC8EE
	.align 2, 0
_080AC8E0: .4byte gUnknown_83E5B88
_080AC8E4: .4byte gSprites
_080AC8E8: .4byte gUnknown_2037F1A
_080AC8EC:
	strh r7, [r4, 0x32]
_080AC8EE:
	lsls r0, r6, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r6, r0, 16
	cmp r0, 0
	ble _080AC89C
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80AC798

	thumb_func_start sub_80AC90C
sub_80AC90C: @ 80AC90C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AC940 @ =gUnknown_2037F02
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
	ldr r1, _080AC944 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r1, _080AC948 @ =sub_8074AE0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC940: .4byte gUnknown_2037F02
_080AC944: .4byte DestroyAnimSprite
_080AC948: .4byte sub_8074AE0
	thumb_func_end sub_80AC90C

	thumb_func_start sub_80AC94C
sub_80AC94C: @ 80AC94C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080AC984 @ =gUnknown_2037F02
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_8074FF8
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x32]
	ldr r0, _080AC988 @ =sub_8074D00
	str r0, [r4, 0x1C]
	ldr r1, _080AC98C @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC984: .4byte gUnknown_2037F02
_080AC988: .4byte sub_8074D00
_080AC98C: .4byte DestroyAnimSprite
	thumb_func_end sub_80AC94C

	thumb_func_start sub_80AC990
sub_80AC990: @ 80AC990
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _080AC9C4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AC9CC
	ldr r2, _080AC9C8 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x8]
	negs r0, r0
	strh r0, [r4, 0x32]
	adds r1, r2, 0
	b _080AC9E2
	.align 2, 0
_080AC9C4: .4byte gUnknown_2037F1A
_080AC9C8: .4byte gUnknown_2037F02
_080AC9CC:
	ldr r1, _080AC9F8 @ =gUnknown_2037F02
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
_080AC9E2:
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080AC9FC @ =sub_80ACA6C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC9F8: .4byte gUnknown_2037F02
_080AC9FC: .4byte sub_80ACA6C
	thumb_func_end sub_80AC990

	thumb_func_start sub_80ACA00
sub_80ACA00: @ 80ACA00
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080ACA2C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ACA34
	ldr r2, _080ACA30 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x8]
	strh r0, [r4, 0x32]
	adds r1, r2, 0
	b _080ACA4C
	.align 2, 0
_080ACA2C: .4byte gUnknown_2037F1A
_080ACA30: .4byte gUnknown_2037F02
_080ACA34:
	ldr r1, _080ACA64 @ =gUnknown_2037F02
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x8]
	negs r0, r0
	strh r0, [r4, 0x32]
_080ACA4C:
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080ACA68 @ =sub_80ACA6C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACA64: .4byte gUnknown_2037F02
_080ACA68: .4byte sub_80ACA6C
	thumb_func_end sub_80ACA00

	thumb_func_start sub_80ACA6C
sub_80ACA6C: @ 80ACA6C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _080ACA92
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x26]
	adds r0, r3
	strh r0, [r2, 0x26]
_080ACA92:
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080ACAA4
	adds r0, r2, 0
	bl move_anim_8074EE0
_080ACAA4:
	pop {r0}
	bx r0
	thumb_func_end sub_80ACA6C

	thumb_func_start sub_80ACAA8
sub_80ACAA8: @ 80ACAA8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r0, _080ACACC @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ACAD4
	ldr r0, _080ACAD0 @ =gUnknown_2037F02
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080ACAE6
	.align 2, 0
_080ACACC: .4byte gUnknown_2037F1A
_080ACAD0: .4byte gUnknown_2037F02
_080ACAD4:
	ldr r0, _080ACB14 @ =gUnknown_2037F02
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	adds r2, r4, 0
	adds r2, 0x43
	movs r1, 0x8
	strb r1, [r2]
_080ACAE6:
	adds r2, r0, 0
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r2, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r2, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r2, 0xA]
	strh r0, [r4, 0x34]
	ldrh r0, [r2, 0xC]
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldr r0, _080ACB18 @ =sub_80ACB1C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACB14: .4byte gUnknown_2037F02
_080ACB18: .4byte sub_80ACB1C
	thumb_func_end sub_80ACAA8

	thumb_func_start sub_80ACB1C
sub_80ACB1C: @ 80ACB1C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080ACBA4
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	ldr r0, _080ACB88 @ =0x00002710
	cmp r1, r0
	ble _080ACB3A
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
_080ACB3A:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080ACB90
	ldr r2, _080ACB8C @ =0xffffff00
	b _080ACB98
	.align 2, 0
_080ACB88: .4byte 0x00002710
_080ACB8C: .4byte 0xffffff00
_080ACB90:
	cmp r0, 0
	bge _080ACB9C
	movs r2, 0x80
	lsls r2, 1
_080ACB98:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_080ACB9C:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _080ACBAA
_080ACBA4:
	adds r0, r4, 0
	bl move_anim_8074EE0
_080ACBAA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACB1C

	thumb_func_start sub_80ACBB0
sub_80ACBB0: @ 80ACBB0
	push {lr}
	movs r1, 0
	strh r1, [r0, 0x20]
	strh r1, [r0, 0x22]
	movs r1, 0x3C
	strh r1, [r0, 0x2E]
	movs r1, 0x8C
	strh r1, [r0, 0x32]
	movs r1, 0x50
	strh r1, [r0, 0x36]
	ldr r1, _080ACBD4 @ =sub_8075590
	str r1, [r0, 0x1C]
	ldr r1, _080ACBD8 @ =DestroyAnimSprite
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080ACBD4: .4byte sub_8075590
_080ACBD8: .4byte DestroyAnimSprite
	thumb_func_end sub_80ACBB0

	thumb_func_start sub_80ACBDC
sub_80ACBDC: @ 80ACBDC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _080ACC34 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080ACC38 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080ACC22
	movs r0, 0x2
	bl GetBattlerAtPosition
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	beq _080ACC1A
	movs r0, 0x3
	bl GetBattlerAtPosition
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _080ACC22
_080ACC1A:
	ldr r1, _080ACC3C @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080ACC22:
	ldr r1, _080ACC40 @ =sub_8075F0C
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ACC34: .4byte gUnknown_2037F1A
_080ACC38: .4byte gUnknown_2037F1B
_080ACC3C: .4byte gUnknown_2037F02
_080ACC40: .4byte sub_8075F0C
	thumb_func_end sub_80ACBDC

	thumb_func_start sub_80ACC44
sub_80ACC44: @ 80ACC44
	ldr r2, _080ACC58 @ =gUnknown_2037F02
	ldrh r1, [r2]
	negs r1, r1
	strh r1, [r2]
	ldrh r1, [r2, 0x4]
	negs r1, r1
	strh r1, [r2, 0x4]
	ldr r1, _080ACC5C @ =sub_8075F0C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080ACC58: .4byte gUnknown_2037F02
_080ACC5C: .4byte sub_8075F0C
	thumb_func_end sub_80ACC44

	thumb_func_start sub_80ACC60
sub_80ACC60: @ 80ACC60
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080ACC80 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	movs r1, 0
	strh r0, [r4, 0x3C]
	strh r1, [r4, 0x2E]
	ldr r0, _080ACC84 @ =sub_80ACC88
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACC80: .4byte gUnknown_2037F02
_080ACC84: .4byte sub_80ACC88
	thumb_func_end sub_80ACC60

	thumb_func_start sub_80ACC88
sub_80ACC88: @ 80ACC88
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80ACD7C
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x12
	bne _080ACCD2
	movs r0, 0x19
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080ACCD8 @ =gUnknown_2037F1B
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
	ldr r0, _080ACCDC @ =sub_80ACCE0
	str r0, [r5, 0x1C]
_080ACCD2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACCD8: .4byte gUnknown_2037F1B
_080ACCDC: .4byte sub_80ACCE0
	thumb_func_end sub_80ACC88

	thumb_func_start sub_80ACCE0
sub_80ACCE0: @ 80ACCE0
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080ACD28
	movs r4, 0
	strh r4, [r6, 0x2E]
	ldr r5, _080ACD20 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	strh r4, [r6, 0x26]
	strh r4, [r6, 0x24]
	ldr r1, _080ACD24 @ =sub_80ACD58
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	b _080ACD52
	.align 2, 0
_080ACD20: .4byte gUnknown_2037F1B
_080ACD24: .4byte sub_80ACD58
_080ACD28:
	movs r1, 0x3C
	ldrsh r0, [r6, r1]
	movs r1, 0x1C
	bl Sin
	ldrh r1, [r6, 0x24]
	adds r0, r1
	strh r0, [r6, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r6, r1]
	movs r1, 0x1C
	bl Cos
	ldrh r1, [r6, 0x26]
	adds r0, r1
	strh r0, [r6, 0x26]
	ldrh r0, [r6, 0x3C]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0x3C]
_080ACD52:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACCE0

	thumb_func_start sub_80ACD58
sub_80ACD58: @ 80ACD58
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80ACD7C
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080ACD74
	adds r0, r4, 0
	bl DestroyAnimSprite
_080ACD74:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACD58

	thumb_func_start sub_80ACD7C
sub_80ACD7C: @ 80ACD7C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x1C
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x1C
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACD7C

	thumb_func_start sub_80ACDA8
sub_80ACDA8: @ 80ACDA8
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080ACDDC @ =gUnknown_2037F02
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
	strh r0, [r4, 0x32]
	ldr r1, _080ACDE0 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080ACDE4 @ =sub_8074CD0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACDDC: .4byte gUnknown_2037F02
_080ACDE0: .4byte DestroyAnimSprite
_080ACDE4: .4byte sub_8074CD0
	thumb_func_end sub_80ACDA8

	thumb_func_start sub_80ACDE8
sub_80ACDE8: @ 80ACDE8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r1, _080ACE1C @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080ACE20 @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080ACE24 @ =sub_80ACE28
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACE1C: .4byte gUnknown_2037F02
_080ACE20: .4byte sub_8074C44
_080ACE24: .4byte sub_80ACE28
	thumb_func_end sub_80ACDE8

	thumb_func_start sub_80ACE28
sub_80ACE28: @ 80ACE28
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r3]
	ldrh r1, [r0, 0x30]
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	ldr r1, _080ACE4C @ =sub_80ACE50
	str r1, [r0, 0x1C]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080ACE4C: .4byte sub_80ACE50
	thumb_func_end sub_80ACE28

	thumb_func_start sub_80ACE50
sub_80ACE50: @ 80ACE50
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	adds r0, 0xD0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080ACE9C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080ACE9C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACE50

	thumb_func_start sub_80ACEA4
sub_80ACEA4: @ 80ACEA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080ACF04 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x26]
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	ldr r2, _080ACF08 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x10]
	ldr r0, _080ACF0C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80758E0
	ldr r0, _080ACF10 @ =sub_80ACF14
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACF04: .4byte gTasks
_080ACF08: .4byte gSprites
_080ACF0C: .4byte gUnknown_2037F1A
_080ACF10: .4byte sub_80ACF14
	thumb_func_end sub_80ACEA4

	thumb_func_start sub_80ACF14
sub_80ACF14: @ 80ACF14
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080ACF3C @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bls _080ACF30
	b _080AD1EE
_080ACF30:
	lsls r0, 2
	ldr r1, _080ACF40 @ =_080ACF44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ACF3C: .4byte gTasks
_080ACF40: .4byte _080ACF44
	.align 2, 0
_080ACF44:
	.4byte _080ACF60
	.4byte _080ACF86
	.4byte _080AD038
	.4byte _080AD098
	.4byte _080AD0B6
	.4byte _080AD18C
	.4byte _080AD1E0
_080ACF60:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0xE0
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 2
	str r0, [sp, 0x4]
	movs r0, 0x20
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r2, r3, 0
	bl sub_80765D4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080ACF86:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080ACFCE
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080ACFBC
	ldr r2, _080ACFB8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	b _080ACFCC
	.align 2, 0
_080ACFB8: .4byte gSprites
_080ACFBC:
	ldr r2, _080AD030 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080AD034 @ =0x0000fffd
_080ACFCC:
	strh r1, [r0, 0x24]
_080ACFCE:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080ACFFC
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080ACFFC
	movs r0, 0
	strh r0, [r4, 0xE]
	ldr r2, _080AD030 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x1
	strh r1, [r0, 0x22]
_080ACFFC:
	adds r0, r4, 0
	bl sub_8076640
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080AD00C
	b _080AD1EE
_080AD00C:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8076440
	ldr r2, _080AD030 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	b _080AD1D4
	.align 2, 0
_080AD030: .4byte gSprites
_080AD034: .4byte 0x0000fffd
_080AD038:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080AD048
	b _080AD1EE
_080AD048:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AD072
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xF0
	str r0, [sp, 0x4]
	movs r0, 0x6
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_80765D4
	b _080AD092
_080AD072:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xC0
	str r0, [sp, 0x4]
	movs r0, 0x6
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_80765D4
_080AD092:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080AD1D4
_080AD098:
	adds r0, r4, 0
	bl sub_8076640
	lsls r0, 24
	cmp r0, 0
	beq _080AD0A6
	b _080AD1EE
_080AD0A6:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	movs r2, 0x6
	bl sub_80AD1F8
	b _080AD1D4
_080AD0B6:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AD104
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD0F0
	ldr r2, _080AD0EC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	b _080AD102
	.align 2, 0
_080AD0EC: .4byte gSprites
_080AD0F0:
	ldr r2, _080AD13C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
_080AD102:
	strh r1, [r0, 0x26]
_080AD104:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _080AD1EE
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AD140
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xF0
	bl sub_80765D4
	b _080AD15E
	.align 2, 0
_080AD13C: .4byte gSprites
_080AD140:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xC0
	bl sub_80765D4
_080AD15E:
	ldrh r1, [r4, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD17C
	ldr r2, _080AD188 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
_080AD17C:
	movs r0, 0
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	b _080AD1D4
	.align 2, 0
_080AD188: .4byte gSprites
_080AD18C:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AD1A8
	ldr r2, _080AD1DC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
_080AD1A8:
	adds r0, r4, 0
	bl sub_8076640
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080AD1EE
	ldr r2, _080AD1DC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	strh r1, [r0, 0x22]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8075980
	strh r5, [r4, 0xC]
_080AD1D4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080AD1EE
	.align 2, 0
_080AD1DC: .4byte gSprites
_080AD1E0:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AD1EE
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080AD1EE:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80ACF14

	thumb_func_start sub_80AD1F8
sub_80AD1F8: @ 80AD1F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	adds r0, r4, 0
	bl sub_80AD374
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r1, _080AD248 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r4, [r0, 0x20]
	ldr r0, _080AD24C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AD250
	adds r0, r4, 0
	subs r0, 0xC
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x1
	b _080AD25A
	.align 2, 0
_080AD248: .4byte gSprites
_080AD24C: .4byte gUnknown_2037F1A
_080AD250:
	adds r0, r4, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xFF
_080AD25A:
	movs r6, 0
	movs r5, 0
	lsls r4, 16
	str r4, [sp, 0x8]
	mov r1, r9
	lsls r1, 16
	str r1, [sp, 0x4]
	ldr r2, _080AD314 @ =gUnknown_83E5E44
	mov r9, r2
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r3, r8
	lsls r3, 1
	mov r10, r3
_080AD278:
	ldr r0, _080AD318 @ =gUnknown_83E5E2C
	ldr r2, [sp, 0x8]
	asrs r1, r2, 16
	ldr r3, [sp, 0x4]
	asrs r2, r3, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080AD2FA
	ldr r1, _080AD31C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	lsls r0, r5, 2
	adds r0, 0x40
	adds r1, r0
	ldr r3, _080AD320 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r3, _080AD324 @ =0xfffffc00
	adds r0, r3, 0
	ands r2, r0
	orrs r2, r1
	strh r2, [r4, 0x4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _080AD2C2
	movs r5, 0
_080AD2C2:
	lsls r2, r6, 2
	mov r1, r9
	adds r0, r2, r1
	ldrh r0, [r0]
	ldr r3, [sp]
	adds r1, r0, 0
	muls r1, r3
	lsls r1, 16
	asrs r1, 16
	ldr r0, _080AD328 @ =gUnknown_83E5E46
	adds r2, r0
	movs r3, 0
	ldrsh r2, [r2, r3]
	adds r0, r4, 0
	bl sub_80AD3C8
	strh r7, [r4, 0x3A]
	mov r0, r8
	strh r0, [r4, 0x3C]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	add r0, r10
	ldr r1, _080AD32C @ =gTasks+0x8
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
_080AD2FA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x6
	bls _080AD278
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD314: .4byte gUnknown_83E5E44
_080AD318: .4byte gUnknown_83E5E2C
_080AD31C: .4byte gSprites
_080AD320: .4byte 0x000003ff
_080AD324: .4byte 0xfffffc00
_080AD328: .4byte gUnknown_83E5E46
_080AD32C: .4byte gTasks+0x8
	thumb_func_end sub_80AD1F8

	thumb_func_start sub_80AD330
sub_80AD330: @ 80AD330
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80AD3E4
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080AD36A
	ldr r3, _080AD370 @ =gTasks
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
_080AD36A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD370: .4byte gTasks
	thumb_func_end sub_80AD330

	thumb_func_start sub_80AD374
sub_80AD374: @ 80AD374
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AD3AC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1, 0x26]
	ldrh r0, [r1, 0x22]
	adds r2, r0
	adds r1, 0x29
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080AD3B0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AD3B4
	lsls r0, r4, 16
	movs r1, 0x94
	lsls r1, 15
	b _080AD3BA
	.align 2, 0
_080AD3AC: .4byte gSprites
_080AD3B0: .4byte gUnknown_2037F1A
_080AD3B4:
	lsls r0, r4, 16
	movs r1, 0xB0
	lsls r1, 14
_080AD3BA:
	adds r0, r1
	lsrs r4, r0, 16
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80AD374

	thumb_func_start sub_80AD3C8
sub_80AD3C8: @ 80AD3C8
	movs r3, 0
	strh r3, [r0, 0x2E]
	strh r3, [r0, 0x30]
	ldrh r3, [r0, 0x20]
	lsls r3, 3
	strh r3, [r0, 0x32]
	ldrh r3, [r0, 0x22]
	lsls r3, 3
	strh r3, [r0, 0x34]
	lsls r1, 3
	strh r1, [r0, 0x36]
	lsls r2, 3
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_80AD3C8

	thumb_func_start sub_80AD3E4
sub_80AD3E4: @ 80AD3E4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080AD40E
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	ldrh r3, [r2, 0x34]
	adds r0, r3
	strh r0, [r2, 0x34]
_080AD40E:
	ldrh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x34]
	adds r1, r3
	strh r1, [r2, 0x34]
	lsls r1, 16
	asrs r3, r1, 19
	strh r3, [r2, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080AD444
	adds r1, r3, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080AD444
	cmp r1, 0x78
	ble _080AD450
_080AD444:
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080AD450:
	pop {r0}
	bx r0
	thumb_func_end sub_80AD3E4

	thumb_func_start sub_80AD454
sub_80AD454: @ 80AD454
	push {r4,r5,lr}
	ldr r3, _080AD498 @ =gUnknown_2037F02
	ldrh r1, [r3]
	movs r2, 0
	strh r1, [r0, 0x20]
	ldrh r1, [r3, 0x2]
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0x3A]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0x3C]
	ldrh r4, [r0, 0x4]
	lsls r2, r4, 22
	lsrs r2, 22
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r1, 4
	adds r2, r1
	ldr r3, _080AD49C @ =0x000003ff
	adds r1, r3, 0
	ands r2, r1
	ldr r1, _080AD4A0 @ =0xfffffc00
	ands r1, r4
	orrs r1, r2
	strh r1, [r0, 0x4]
	ldr r1, _080AD4A4 @ =sub_80AD4A8
	str r1, [r0, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD498: .4byte gUnknown_2037F02
_080AD49C: .4byte 0x000003ff
_080AD4A0: .4byte 0xfffffc00
_080AD4A4: .4byte sub_80AD4A8
	thumb_func_end sub_80AD454

	thumb_func_start sub_80AD4A8
sub_80AD4A8: @ 80AD4A8
	push {r4,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _080AD4DA
	cmp r0, 0x1
	bgt _080AD4BE
	cmp r0, 0
	beq _080AD4C4
	b _080AD538
_080AD4BE:
	cmp r0, 0x2
	beq _080AD4F8
	b _080AD538
_080AD4C4:
	ldrh r1, [r2, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080AD4D4
	subs r0, r1, 0x1
	strh r0, [r2, 0x3A]
	b _080AD538
_080AD4D4:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_080AD4DA:
	ldrh r0, [r2, 0x22]
	adds r0, 0x8
	strh r0, [r2, 0x22]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r2, 0x3C]
	movs r4, 0x3C
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _080AD538
	strh r3, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _080AD538
_080AD4F8:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AD524
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD520
	ldr r0, _080AD51C @ =0x0000fffd
	b _080AD522
	.align 2, 0
_080AD51C: .4byte 0x0000fffd
_080AD520:
	movs r0, 0x3
_080AD522:
	strh r0, [r2, 0x26]
_080AD524:
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080AD538
	adds r0, r2, 0
	bl DestroyAnimSprite
_080AD538:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AD4A8

	thumb_func_start sub_80AD540
sub_80AD540: @ 80AD540
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080AD5B4
	cmp r0, 0x1
	bgt _080AD556
	cmp r0, 0
	beq _080AD55C
	b _080AD682
_080AD556:
	cmp r0, 0x2
	beq _080AD612
	b _080AD682
_080AD55C:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075160
	ldr r4, _080AD584 @ =gUnknown_2037F02
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x3C]
	ldr r0, _080AD588 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AD58C
	movs r0, 0x4
	b _080AD58E
	.align 2, 0
_080AD584: .4byte gUnknown_2037F02
_080AD588: .4byte gUnknown_2037F1A
_080AD58C:
	ldr r0, _080AD5AC @ =0x0000fffc
_080AD58E:
	strh r0, [r5, 0x36]
	ldr r0, _080AD5B0 @ =gUnknown_2037F1B
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
	b _080AD60A
	.align 2, 0
_080AD5AC: .4byte 0x0000fffc
_080AD5B0: .4byte gUnknown_2037F1B
_080AD5B4:
	ldrh r0, [r5, 0x30]
	adds r0, 0xC0
	strh r0, [r5, 0x30]
	ldr r0, _080AD5D4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AD5D8
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	b _080AD5DE
	.align 2, 0
_080AD5D4: .4byte gUnknown_2037F1A
_080AD5D8:
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
_080AD5DE:
	strh r0, [r5, 0x26]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080AD682
	movs r0, 0
	strh r0, [r5, 0x34]
_080AD60A:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080AD682
_080AD612:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	adds r2, r0, 0
	movs r3, 0
	strh r2, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080AD682
	ldrh r0, [r5, 0x20]
	adds r1, r2, r0
	strh r1, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r3, [r5, 0x26]
	strh r3, [r5, 0x24]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	ldr r4, _080AD688 @ =gUnknown_2037F1B
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
	bl sub_8075678
	ldr r0, _080AD68C @ =sub_80AD690
	str r0, [r5, 0x1C]
_080AD682:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD688: .4byte gUnknown_2037F1B
_080AD68C: .4byte sub_80AD690
	thumb_func_end sub_80AD540

	thumb_func_start sub_80AD690
sub_80AD690: @ 80AD690
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080AD6E8
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080AD6C6
	cmp r2, 0xC4
	ble _080AD6EE
_080AD6C6:
	lsls r0, 16
	cmp r0, 0
	ble _080AD6EE
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080AD6EE
	ldr r0, _080AD6E4 @ =gUnknown_2037F24
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x89
	bl PlaySE12WithPanning
	b _080AD6EE
	.align 2, 0
_080AD6E4: .4byte gUnknown_2037F24
_080AD6E8:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AD6EE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AD690

	thumb_func_start sub_80AD6F4
sub_80AD6F4: @ 80AD6F4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080AD70C
	ldr r0, _080AD778 @ =gUnknown_2037F02
	ldrh r0, [r0]
	strh r0, [r4, 0x30]
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
_080AD70C:
	movs r0, 0xC0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0xA0
	strh r0, [r4, 0x36]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x36]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x7
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AD7A8
	ldrh r0, [r4, 0x30]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x83
	bls _080AD780
	ldr r0, _080AD77C @ =gUnknown_2037F1B
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
	b _080AD7C4
	.align 2, 0
_080AD778: .4byte gUnknown_2037F02
_080AD77C: .4byte gUnknown_2037F1B
_080AD780:
	ldr r0, _080AD7A4 @ =gUnknown_2037F1B
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
	b _080AD7C4
	.align 2, 0
_080AD7A4: .4byte gUnknown_2037F1B
_080AD7A8:
	ldrh r0, [r4, 0x30]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x83
	bls _080AD7BC
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
	b _080AD7C2
_080AD7BC:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
_080AD7C2:
	strb r0, [r1]
_080AD7C4:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080AD7EC
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
_080AD7EC:
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0x1E
	bne _080AD7FA
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AD7FA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AD6F4

	thumb_func_start sub_80AD800
sub_80AD800: @ 80AD800
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080AD860 @ =gTasks
	adds r4, r1, r0
	ldr r0, _080AD864 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080AD826
	movs r1, 0x1
_080AD826:
	strh r1, [r4, 0x20]
	ldr r0, _080AD868 @ =gUnknown_2037F1B
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	bl sub_8072DF0
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	movs r0, 0x3
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080AD86C @ =sub_80AD870
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD860: .4byte gTasks
_080AD864: .4byte gUnknown_2037F1A
_080AD868: .4byte gUnknown_2037F1B
_080AD86C: .4byte sub_80AD870
	thumb_func_end sub_80AD800

	thumb_func_start sub_80AD870
sub_80AD870: @ 80AD870
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080AD894 @ =gTasks
	adds r2, r0, r1
	movs r0, 0x8
	ldrsh r3, [r2, r0]
	cmp r3, 0x1
	beq _080AD938
	cmp r3, 0x1
	bgt _080AD898
	cmp r3, 0
	beq _080AD8A6
	b _080ADA98
	.align 2, 0
_080AD894: .4byte gTasks
_080AD898:
	cmp r3, 0x2
	bne _080AD89E
	b _080AD9C0
_080AD89E:
	cmp r3, 0x3
	bne _080AD8A4
	b _080ADA54
_080AD8A4:
	b _080ADA98
_080AD8A6:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	lsls r0, 1
	ldrh r5, [r2, 0x1C]
	adds r0, r5
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AD8D8
	strh r3, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD8D4
	movs r0, 0x2
	b _080AD8D6
_080AD8D4:
	ldr r0, _080AD930 @ =0x0000fffe
_080AD8D6:
	strh r0, [r2, 0x1E]
_080AD8D8:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r7, 0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080AD91A
	ldr r4, _080AD934 @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
_080AD8EA:
	movs r1, 0xE
	ldrsh r0, [r2, r1]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r7, [r2, 0x1C]
	adds r0, r7
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r5, 0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _080AD8EA
_080AD91A:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080AD92A
	b _080ADA98
_080AD92A:
	movs r0, 0
	strh r0, [r2, 0x1A]
	b _080ADA44
	.align 2, 0
_080AD930: .4byte 0x0000fffe
_080AD934: .4byte gSprites
_080AD938:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080AD960
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	ands r0, r3
	lsls r0, 16
	cmp r0, 0
	beq _080AD95C
	movs r0, 0x2
	b _080AD95E
_080AD95C:
	ldr r0, _080AD9B8 @ =0x0000fffe
_080AD95E:
	strh r0, [r2, 0x1E]
_080AD960:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r7, 0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080AD9A2
	ldr r4, _080AD9BC @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
_080AD972:
	movs r1, 0xE
	ldrsh r0, [r2, r1]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r7, [r2, 0x1C]
	adds r0, r7
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r5, 0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _080AD972
_080AD9A2:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x60
	bne _080ADA98
	movs r0, 0
	strh r0, [r2, 0x1A]
	b _080ADA44
	.align 2, 0
_080AD9B8: .4byte 0x0000fffe
_080AD9BC: .4byte gSprites
_080AD9C0:
	movs r7, 0x20
	ldrsh r1, [r2, r7]
	lsls r1, 1
	ldrh r0, [r2, 0x1C]
	subs r0, r1
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AD9F4
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD9F0
	strh r3, [r2, 0x1E]
	b _080AD9F4
_080AD9F0:
	ldr r0, _080ADA4C @ =0x0000fffe
	strh r0, [r2, 0x1E]
_080AD9F4:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080ADA36
	ldr r4, _080ADA50 @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
_080ADA06:
	movs r5, 0xE
	ldrsh r0, [r2, r5]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r7, 0
	ldrsh r0, [r0, r7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r5, [r2, 0x1C]
	adds r0, r5
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r7, 0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _080ADA06
_080ADA36:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080ADA98
_080ADA44:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080ADA98
	.align 2, 0
_080ADA4C: .4byte 0x0000fffe
_080ADA50: .4byte gSprites
_080ADA54:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080ADA92
	ldr r6, _080ADAA0 @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
	movs r5, 0
_080ADA68:
	movs r7, 0xE
	ldrsh r0, [r2, r7]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r5, [r0, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r7, 0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _080ADA68
_080ADA92:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080ADA98:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADAA0: .4byte gSprites
	thumb_func_end sub_80AD870

	thumb_func_start sub_80ADAA4
sub_80ADAA4: @ 80ADAA4
	push {r4,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x8]
	lsls r0, 4
	ldr r1, _080ADAD4 @ =gUnknown_2037F02
	ldrb r2, [r1]
	ldrh r3, [r1, 0x2]
	movs r1, 0x10
	bl BlendPalette
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADAD4: .4byte gUnknown_2037F02
	thumb_func_end sub_80ADAA4

	thumb_func_start sub_80ADAD8
sub_80ADAD8: @ 80ADAD8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080ADB30 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	mov r9, r1
	ldr r4, _080ADB34 @ =gUnknown_2037F02
	mov r8, r4
	cmp r0, 0
	bne _080ADB0E
	ldrh r0, [r4]
	strh r0, [r2, 0xA]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0xC]
	ldrh r0, [r4, 0x4]
	strh r0, [r2, 0xE]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x10]
_080ADB0E:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldr r1, _080ADB38 @ =gUnknown_2023D44
	ldr r0, _080ADB3C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r0, r1
	ldrb r6, [r0]
	movs r5, 0x10
	ldrsh r0, [r2, r5]
	cmp r0, 0
	bne _080ADB44
	ldr r4, _080ADB40 @ =gUnknown_83E5EFC
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	b _080ADB4A
	.align 2, 0
_080ADB30: .4byte gTasks
_080ADB34: .4byte gUnknown_2037F02
_080ADB38: .4byte gUnknown_2023D44
_080ADB3C: .4byte gUnknown_2037F1B
_080ADB40: .4byte gUnknown_83E5EFC
_080ADB44:
	ldr r4, _080ADB90 @ =gUnknown_83E5F0C
	movs r3, 0x8
	ldrsh r0, [r2, r3]
_080ADB4A:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	adds r0, r4
	ldrb r5, [r0]
	lsls r0, r7, 2
	adds r1, r0, r7
	lsls r1, 3
	add r1, r9
	movs r4, 0xE
	ldrsh r1, [r1, r4]
	mov r12, r0
	cmp r1, 0x1
	bne _080ADB98
	ldr r2, _080ADB94 @ =gSprites
	lsls r3, r6, 4
	adds r0, r3, r6
	lsls r0, 2
	adds r0, r2
	mov r10, r0
	mov r0, r8
	movs r4, 0x2
	ldrsh r1, [r0, r4]
	lsls r0, r5, 24
	asrs r0, 24
	muls r0, r1
	cmp r0, 0
	bge _080ADB88
	negs r0, r0
_080ADB88:
	mov r5, r10
	strh r0, [r5, 0x26]
	b _080ADBB2
	.align 2, 0
_080ADB90: .4byte gUnknown_83E5F0C
_080ADB94: .4byte gSprites
_080ADB98:
	ldr r3, _080ADBE8 @ =gSprites
	lsls r4, r6, 4
	adds r2, r4, r6
	lsls r2, 2
	adds r2, r3
	lsls r0, r5, 24
	asrs r0, 24
	mov r5, r8
	ldrh r1, [r5, 0x2]
	muls r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
_080ADBB2:
	mov r1, r12
	adds r0, r1, r7
	lsls r0, 3
	add r0, r9
	movs r4, 0x8
	ldrsh r1, [r0, r4]
	movs r5, 0xA
	ldrsh r0, [r0, r5]
	cmp r1, r0
	bne _080ADBD8
	adds r0, r3, r6
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	strh r1, [r0, 0x26]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080ADBD8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADBE8: .4byte gSprites
	thumb_func_end sub_80ADAD8

	thumb_func_start sub_80ADBEC
sub_80ADBEC: @ 80ADBEC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080ADC0C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ADC14
	ldr r0, _080ADC10 @ =gUnknown_2037F02
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080ADC20
	.align 2, 0
_080ADC0C: .4byte gUnknown_2037F1A
_080ADC10: .4byte gUnknown_2037F02
_080ADC14:
	ldr r1, _080ADC34 @ =gUnknown_2037F02
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_080ADC20:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080ADC38 @ =sub_80ADC3C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC34: .4byte gUnknown_2037F02
_080ADC38: .4byte sub_80ADC3C
	thumb_func_end sub_80ADBEC

	thumb_func_start sub_80ADC3C
sub_80ADC3C: @ 80ADC3C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080ADC52
	adds r0, r2, 0
	bl DestroyAnimSprite
_080ADC52:
	pop {r0}
	bx r0
	thumb_func_end sub_80ADC3C

	thumb_func_start sub_80ADC58
sub_80ADC58: @ 80ADC58
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080ADC78 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ADC80
	ldr r0, _080ADC7C @ =gUnknown_2037F02
	ldrh r1, [r4, 0x20]
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r4, 0x20]
	b _080ADC8A
	.align 2, 0
_080ADC78: .4byte gUnknown_2037F1A
_080ADC7C: .4byte gUnknown_2037F02
_080ADC80:
	ldr r0, _080ADC94 @ =gUnknown_2037F02
	ldrh r0, [r0]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
_080ADC8A:
	ldr r0, _080ADC98 @ =sub_80ADC9C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC94: .4byte gUnknown_2037F02
_080ADC98: .4byte sub_80ADC9C
	thumb_func_end sub_80ADC58

	thumb_func_start sub_80ADC9C
sub_80ADC9C: @ 80ADC9C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080ADCB2
	adds r0, r2, 0
	bl move_anim_8074EE0
_080ADCB2:
	pop {r0}
	bx r0
	thumb_func_end sub_80ADC9C

	thumb_func_start sub_80ADCB8
sub_80ADCB8: @ 80ADCB8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080ADCFC @ =gUnknown_2037F1B
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
	ldr r0, _080ADD00 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080ADD08
	ldr r2, _080ADD04 @ =gUnknown_2037F02
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r5, 0x22]
	b _080ADD1C
	.align 2, 0
_080ADCFC: .4byte gUnknown_2037F1B
_080ADD00: .4byte gUnknown_2037F1A
_080ADD04: .4byte gUnknown_2037F02
_080ADD08:
	ldr r0, _080ADD40 @ =gUnknown_2037F02
	ldrh r1, [r0]
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r2, [r5, 0x22]
	adds r1, r2
	strh r1, [r5, 0x22]
	adds r2, r0, 0
_080ADD1C:
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x34]
	ldr r1, _080ADD44 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080ADD48 @ =sub_8074A80
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADD40: .4byte gUnknown_2037F02
_080ADD44: .4byte move_anim_8074EE0
_080ADD48: .4byte sub_8074A80
	thumb_func_end sub_80ADCB8

	thumb_func_start sub_80ADD4C
sub_80ADD4C: @ 80ADD4C
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080ADD64 @ =gUnknown_2037F02
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080ADDC4
	cmp r0, 0x1
	bgt _080ADD68
	cmp r0, 0
	beq _080ADD72
	b _080ADDC4
	.align 2, 0
_080ADD64: .4byte gUnknown_2037F02
_080ADD68:
	cmp r0, 0x2
	beq _080ADD7C
	cmp r0, 0x3
	beq _080ADDA0
	b _080ADDC4
_080ADD72:
	ldr r0, _080ADD78 @ =gUnknown_2037F1A
	b _080ADDC6
	.align 2, 0
_080ADD78: .4byte gUnknown_2037F1A
_080ADD7C:
	ldr r4, _080ADD94 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r6, 0x2
	eors r0, r6
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	bne _080ADD98
	ldrb r4, [r4]
	b _080ADDC8
	.align 2, 0
_080ADD94: .4byte gUnknown_2037F1A
_080ADD98:
	ldrb r0, [r4]
	adds r4, r6, 0
	eors r4, r0
	b _080ADDC8
_080ADDA0:
	ldr r0, _080ADDBC @ =gUnknown_2037F1A
	ldrb r0, [r0]
	movs r4, 0x2
	eors r0, r4
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080ADDC4
	ldr r0, _080ADDC0 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	eors r4, r0
	b _080ADDC8
	.align 2, 0
_080ADDBC: .4byte gUnknown_2037F1A
_080ADDC0: .4byte gUnknown_2037F1B
_080ADDC4:
	ldr r0, _080ADDE8 @ =gUnknown_2037F1B
_080ADDC6:
	ldrb r4, [r0]
_080ADDC8:
	ldr r0, _080ADDEC @ =gUnknown_2037F02
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080ADDF0
	adds r0, r4, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x1
	b _080ADE02
	.align 2, 0
_080ADDE8: .4byte gUnknown_2037F1B
_080ADDEC: .4byte gUnknown_2037F02
_080ADDF0:
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x3
_080ADE02:
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r7, _080ADEA0 @ =gUnknown_825E074
	ldr r6, _080ADEA4 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	movs r1, 0
	ldrsh r0, [r6, r1]
	adds r0, 0x40
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r1, [r6, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080ADE66
	adds r0, r4, 0
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
_080ADE66:
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r0, 0x4
	ldrsh r1, [r6, r0]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	ldr r3, _080ADEA8 @ =gOamMatrices
	lsls r2, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r7
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x2E]
	ldr r0, _080ADEAC @ =sub_80B1D3C
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADEA0: .4byte gUnknown_825E074
_080ADEA4: .4byte gUnknown_2037F02
_080ADEA8: .4byte gOamMatrices
_080ADEAC: .4byte sub_80B1D3C
	thumb_func_end sub_80ADD4C

	thumb_func_start sub_80ADEB0
sub_80ADEB0: @ 80ADEB0
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r5, _080ADF24 @ =gUnknown_2037F02
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r6, _080ADF28 @ =gUnknown_2037F1B
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x38]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x3A]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x3C]
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080ADF2C @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080ADF30 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r1, _080ADF34 @ =sub_80ADF38
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADF24: .4byte gUnknown_2037F02
_080ADF28: .4byte gUnknown_2037F1B
_080ADF2C: .4byte 0x000003ff
_080ADF30: .4byte 0xfffffc00
_080ADF34: .4byte sub_80ADF38
	thumb_func_end sub_80ADEB0

	thumb_func_start sub_80ADF38
sub_80ADF38: @ 80ADF38
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	bne _080ADFA2
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080ADFA8
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
	b _080ADFA8
_080ADFA2:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080ADFA8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ADF38

	thumb_func_start sub_80ADFB0
sub_80ADFB0: @ 80ADFB0
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x38]
	subs r0, 0x1
	strh r0, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080ADFE8
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
	ldrh r0, [r3, 0x36]
	strh r0, [r3, 0x38]
_080ADFE8:
	ldrh r0, [r3, 0x34]
	subs r1, r0, 0x1
	strh r1, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bgt _080ADFFA
	adds r0, r3, 0
	bl DestroyAnimSprite
_080ADFFA:
	pop {r0}
	bx r0
	thumb_func_end sub_80ADFB0

	thumb_func_start sub_80AE000
sub_80AE000: @ 80AE000
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AE01C
	ldr r0, _080AE060 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AE024
_080AE01C:
	ldr r1, _080AE064 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080AE024:
	ldr r5, _080AE060 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080AE064 @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4]
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x36]
	strh r0, [r6, 0x38]
	ldr r0, _080AE068 @ =sub_80ADFB0
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE060: .4byte gUnknown_2037F1B
_080AE064: .4byte gUnknown_2037F02
_080AE068: .4byte sub_80ADFB0
	thumb_func_end sub_80AE000

	thumb_func_start sub_80AE06C
sub_80AE06C: @ 80AE06C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r1, _080AE088 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x2E]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080AE090
	ldr r0, _080AE08C @ =gUnknown_2037F1B
	b _080AE092
	.align 2, 0
_080AE088: .4byte gUnknown_2037F02
_080AE08C: .4byte gUnknown_2037F1B
_080AE090:
	ldr r0, _080AE118 @ =gUnknown_2037F1A
_080AE092:
	ldrb r6, [r0]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080AE0AA
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AE0B2
_080AE0AA:
	ldr r1, _080AE11C @ =gUnknown_2037F02
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080AE0B2:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080AE11C @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r3, [r4]
	adds r0, r3
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldr r0, _080AE120 @ =0x00007fff
	ands r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x3C]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080AE124 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080AE128 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r1, _080AE12C @ =sub_80AE130
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE118: .4byte gUnknown_2037F1A
_080AE11C: .4byte gUnknown_2037F02
_080AE120: .4byte 0x00007fff
_080AE124: .4byte 0x000003ff
_080AE128: .4byte 0xfffffc00
_080AE12C: .4byte sub_80AE130
	thumb_func_end sub_80AE06C

	thumb_func_start sub_80AE130
sub_80AE130: @ 80AE130
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _080AE186
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
_080AE186:
	ldrh r0, [r4, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080AE198
	adds r0, r4, 0
	bl DestroyAnimSprite
_080AE198:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AE130

	thumb_func_start sub_80AE1A0
sub_80AE1A0: @ 80AE1A0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075114
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldr r3, _080AE1DC @ =gUnknown_2037F02
	movs r5, 0x6
	ldrsh r0, [r3, r5]
	lsls r0, 2
	adds r1, r0
	ldr r5, _080AE1E0 @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _080AE1E4 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	movs r1, 0x6
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _080AE1E8
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	b _080AE1F6
	.align 2, 0
_080AE1DC: .4byte gUnknown_2037F02
_080AE1E0: .4byte 0x000003ff
_080AE1E4: .4byte 0xfffffc00
_080AE1E8:
	cmp r0, 0x2
	bne _080AE1FA
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x20
_080AE1F6:
	orrs r1, r0
	strb r1, [r4, 0x3]
_080AE1FA:
	ldr r0, _080AE214 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080AE218 @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080AE21C @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE214: .4byte gUnknown_2037F02
_080AE218: .4byte sub_8074C44
_080AE21C: .4byte DestroyAnimSprite
	thumb_func_end sub_80AE1A0

	thumb_func_start sub_80AE220
sub_80AE220: @ 80AE220
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _080AE268 @ =gUnknown_2037F1B
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8074480
	ldr r1, _080AE26C @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	ldr r5, _080AE270 @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldr r0, _080AE274 @ =sub_80AE278
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE268: .4byte gUnknown_2037F1B
_080AE26C: .4byte gTasks
_080AE270: .4byte gUnknown_2037F02
_080AE274: .4byte sub_80AE278
	thumb_func_end sub_80AE220

	thumb_func_start sub_80AE278
sub_80AE278: @ 80AE278
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r5, 0
	movs r7, 0
	ldr r1, _080AE2B8 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrb r2, [r0, 0xC]
	str r2, [sp]
	ldrh r4, [r0, 0x8]
	ldrh r6, [r0, 0xA]
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0
	bne _080AE2BC
	movs r0, 0
	mov r8, r0
	movs r2, 0x1
	movs r1, 0x10
	mov r12, r1
	b _080AE2C6
	.align 2, 0
_080AE2B8: .4byte gTasks
_080AE2BC:
	movs r2, 0x10
	mov r12, r2
	movs r3, 0x8
	mov r8, r3
	movs r2, 0x4
_080AE2C6:
	mov r0, r9
	lsls r1, r0, 2
	adds r0, r1, r0
	lsls r0, 3
	add r0, r10
	movs r3, 0x1C
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0xA
	bhi _080AE3BC
	lsls r0, 2
	ldr r1, _080AE2E4 @ =_080AE2E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE2E4: .4byte _080AE2E8
	.align 2, 0
_080AE2E8:
	.4byte _080AE314
	.4byte _080AE3BC
	.4byte _080AE328
	.4byte _080AE3BC
	.4byte _080AE348
	.4byte _080AE3BC
	.4byte _080AE35E
	.4byte _080AE3BC
	.4byte _080AE380
	.4byte _080AE3BC
	.4byte _080AE3B4
_080AE314:
	ldr r0, _080AE324 @ =gUnknown_83E60A0
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	mov r4, r12
	lsls r3, r4, 16
	b _080AE396
	.align 2, 0
_080AE324: .4byte gUnknown_83E60A0
_080AE328:
	mov r0, r12
	lsls r3, r0, 17
	mov r1, r8
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080AE344 @ =gUnknown_83E60A0
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080AE396
	.align 2, 0
_080AE344: .4byte gUnknown_83E60A0
_080AE348:
	mov r3, r12
	lsls r0, r3, 16
	asrs r0, 16
	lsls r3, r0, 1
	adds r3, r0
	lsls r0, r2, 1
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	b _080AE38A
_080AE35E:
	mov r0, r12
	lsls r3, r0, 18
	lsls r0, r2, 1
	adds r0, r2
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080AE37C @ =gUnknown_83E60A0
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080AE396
	.align 2, 0
_080AE37C: .4byte gUnknown_83E60A0
_080AE380:
	mov r1, r12
	lsls r0, r1, 16
	asrs r0, 16
	lsls r3, r0, 2
	adds r3, r0
_080AE38A:
	ldr r0, _080AE3B0 @ =gUnknown_83E60A0
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	lsls r3, 16
_080AE396:
	asrs r3, 16
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _080AE3BC
	.align 2, 0
_080AE3B0: .4byte gUnknown_83E60A0
_080AE3B4:
	mov r0, r9
	bl DestroyAnimVisualTask
	b _080AE400
_080AE3BC:
	cmp r7, 0
	beq _080AE3F0
	ldr r4, _080AE410 @ =gSprites
	lsls r3, r5, 4
	adds r3, r5
	lsls r3, 2
	adds r0, r3, r4
	ldrh r5, [r0, 0x4]
	lsls r2, r5, 22
	lsrs r2, 22
	add r2, r8
	ldr r6, _080AE414 @ =0x000003ff
	adds r1, r6, 0
	ands r2, r1
	ldr r1, _080AE418 @ =0xfffffc00
	ands r1, r5
	orrs r1, r2
	strh r1, [r0, 0x4]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, 0x2E]
	adds r4, 0x1C
	adds r3, r4
	ldr r1, [r3]
	bl _call_via_r1
_080AE3F0:
	ldr r0, _080AE41C @ =gTasks
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
_080AE400:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE410: .4byte gSprites
_080AE414: .4byte 0x000003ff
_080AE418: .4byte 0xfffffc00
_080AE41C: .4byte gTasks
	thumb_func_end sub_80AE278

	thumb_func_start sub_80AE420
sub_80AE420: @ 80AE420
	push {lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080AE442
	ldrb r1, [r3, 0x1]
	movs r2, 0x3F
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r2, r0
	strb r2, [r3, 0x3]
	b _080AE456
_080AE442:
	ldrb r2, [r3, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r1, r0
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r3, 0x3]
_080AE456:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _080AE46A
	adds r0, r3, 0
	bl DestroySprite
_080AE46A:
	pop {r0}
	bx r0
	thumb_func_end sub_80AE420

	thumb_func_start sub_80AE470
sub_80AE470: @ 80AE470
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080AE4D8 @ =gUnknown_2037F02
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	ldr r0, _080AE4DC @ =gUnknown_83E60B8
	adds r1, 0x20
	lsls r1, 16
	asrs r1, 16
	movs r7, 0x22
	ldrsh r2, [r4, r7]
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080AE4E0 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r6, r2, r3
	ldrh r5, [r6, 0x4]
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r7, _080AE4E4 @ =0x000003ff
	adds r0, r7, 0
	ands r1, r0
	ldr r0, _080AE4E8 @ =0xfffffc00
	ands r0, r5
	orrs r0, r1
	strh r0, [r6, 0x4]
	ldr r1, _080AE4EC @ =gUnknown_2037EE2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080AE4F0 @ =sub_80AE4F4
	str r0, [r2]
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE4D8: .4byte gUnknown_2037F02
_080AE4DC: .4byte gUnknown_83E60B8
_080AE4E0: .4byte gSprites
_080AE4E4: .4byte 0x000003ff
_080AE4E8: .4byte 0xfffffc00
_080AE4EC: .4byte gUnknown_2037EE2
_080AE4F0: .4byte sub_80AE4F4
	thumb_func_end sub_80AE470

	thumb_func_start sub_80AE4F4
sub_80AE4F4: @ 80AE4F4
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080AE528
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
_080AE528:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080AE53C
	adds r0, r3, 0
	bl DestroyAnimSprite
_080AE53C:
	pop {r0}
	bx r0
	thumb_func_end sub_80AE4F4

	thumb_func_start sub_80AE540
sub_80AE540: @ 80AE540
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080AE560 @ =gTasks
	adds r5, r1, r0
	ldr r0, _080AE564 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AE56C
	ldr r4, _080AE568 @ =gUnknown_2037F1A
	b _080AE56E
	.align 2, 0
_080AE560: .4byte gTasks
_080AE564: .4byte gUnknown_2037F02
_080AE568: .4byte gUnknown_2037F1A
_080AE56C:
	ldr r4, _080AE5B0 @ =gUnknown_2037F1B
_080AE56E:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x26]
	ldr r2, _080AE5B4 @ =gUnknown_2037F02
	ldrh r0, [r2, 0x2]
	movs r1, 0
	strh r0, [r5, 0x14]
	strh r1, [r5, 0x16]
	strh r1, [r5, 0x18]
	strh r1, [r5, 0x1A]
	strh r1, [r5, 0x1C]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x1E]
	strh r1, [r5, 0x20]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x22]
	ldr r0, _080AE5B8 @ =sub_80AE5BC
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE5B0: .4byte gUnknown_2037F1B
_080AE5B4: .4byte gUnknown_2037F02
_080AE5B8: .4byte sub_80AE5BC
	thumb_func_end sub_80AE540

	thumb_func_start sub_80AE5BC
sub_80AE5BC: @ 80AE5BC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r2, r6, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080AE6A4 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080AE6BC
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080AE6CA
	strh r7, [r5, 0x20]
	ldr r0, _080AE6A8 @ =gUnknown_83E6120
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	movs r3, 0x26
	ldrsh r2, [r5, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080AE6CA
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080AE6AC @ =gSprites
	adds r4, r0
	ldr r1, _080AE6B0 @ =gUnknown_83E60D0
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, 0x20]
	adds r3, r0
	strh r3, [r4, 0x20]
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrh r0, [r4, 0x22]
	adds r2, r0
	strh r2, [r4, 0x22]
	movs r1, 0x18
	ldrsh r0, [r5, r1]
	lsls r1, r0, 2
	adds r1, r0
	movs r0, 0x28
	subs r0, r1
	strh r0, [r4, 0x2E]
	strh r3, [r4, 0x30]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	ldrh r0, [r5, 0x26]
	strh r0, [r4, 0x36]
	strh r6, [r4, 0x38]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080AE6B4 @ =sub_80AE704
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080AE6B8 @ =sub_8074F6C
	str r0, [r4, 0x1C]
	ldrh r0, [r5, 0x1A]
	adds r0, 0x1
	strh r0, [r5, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080AE674
	strh r7, [r5, 0x1A]
_080AE674:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1E
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _080AE696
	strh r7, [r5, 0x1C]
	ldrh r1, [r5, 0x18]
	movs r3, 0x18
	ldrsh r0, [r5, r3]
	cmp r0, 0x5
	bgt _080AE696
	adds r0, r1, 0x1
	strh r0, [r5, 0x18]
_080AE696:
	ldrh r0, [r5, 0x16]
	adds r0, 0x1
	strh r0, [r5, 0x16]
	ldrh r0, [r5, 0x14]
	subs r0, 0x1
	strh r0, [r5, 0x14]
	b _080AE6CA
	.align 2, 0
_080AE6A4: .4byte gTasks
_080AE6A8: .4byte gUnknown_83E6120
_080AE6AC: .4byte gSprites
_080AE6B0: .4byte gUnknown_83E60D0
_080AE6B4: .4byte sub_80AE704
_080AE6B8: .4byte sub_8074F6C
_080AE6BC:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AE6CA
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080AE6CA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80AE5BC

	thumb_func_start sub_80AE6D0
sub_80AE6D0: @ 80AE6D0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080AE6F8
	ldr r2, _080AE700 @ =gTasks
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x16]
	subs r1, 0x1
	strh r1, [r0, 0x16]
	adds r0, r4, 0
	bl DestroySprite
_080AE6F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE700: .4byte gTasks
	thumb_func_end sub_80AE6D0

	thumb_func_start sub_80AE704
sub_80AE704: @ 80AE704
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080AE718 @ =sub_80AE6D0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE718: .4byte sub_80AE6D0
	thumb_func_end sub_80AE704

	thumb_func_start sub_80AE71C
sub_80AE71C: @ 80AE71C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080AE730 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AE738
	ldr r4, _080AE734 @ =gUnknown_2037F1A
	b _080AE73A
	.align 2, 0
_080AE730: .4byte gUnknown_2037F02
_080AE734: .4byte gUnknown_2037F1A
_080AE738:
	ldr r4, _080AE768 @ =gUnknown_2037F1B
_080AE73A:
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
	ldr r1, _080AE76C @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080AE770 @ =sub_8074F50
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE768: .4byte gUnknown_2037F1B
_080AE76C: .4byte move_anim_8074EE0
_080AE770: .4byte sub_8074F50
	thumb_func_end sub_80AE71C

	thumb_func_start sub_80AE774
sub_80AE774: @ 80AE774
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080AE788 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AE790
	ldr r4, _080AE78C @ =gUnknown_2037F1A
	b _080AE792
	.align 2, 0
_080AE788: .4byte gUnknown_2037F02
_080AE78C: .4byte gUnknown_2037F1A
_080AE790:
	ldr r4, _080AE7CC @ =gUnknown_2037F1B
_080AE792:
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
	ldr r1, _080AE7D0 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x24]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x26]
	ldr r1, _080AE7D4 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080AE7D8 @ =sub_8074F6C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE7CC: .4byte gUnknown_2037F1B
_080AE7D0: .4byte gUnknown_2037F02
_080AE7D4: .4byte DestroyAnimSprite
_080AE7D8: .4byte sub_8074F6C
	thumb_func_end sub_80AE774

	thumb_func_start sub_80AE7DC
sub_80AE7DC: @ 80AE7DC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r4, _080AE834 @ =gUnknown_2037F1A
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
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	movs r0, 0x10
	strh r0, [r5, 0x3C]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080AE82A
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r5, 0x3C]
_080AE82A:
	ldr r0, _080AE838 @ =sub_80AE83C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE834: .4byte gUnknown_2037F1A
_080AE838: .4byte sub_80AE83C
	thumb_func_end sub_80AE7DC

	thumb_func_start sub_80AE83C
sub_80AE83C: @ 80AE83C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080AE84E
	cmp r0, 0x1
	beq _080AE864
	b _080AE894
_080AE84E:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080AE894
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080AE894
_080AE864:
	ldrh r2, [r4, 0x3C]
	ldrh r1, [r4, 0x20]
	adds r0, r2, r1
	strh r0, [r4, 0x20]
	ldr r3, _080AE89C @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	adds r2, r1
	strh r2, [r0, 0x24]
	ldrh r0, [r4, 0x20]
	adds r0, 0x50
	lsls r0, 16
	movs r1, 0xC8
	lsls r1, 17
	cmp r0, r1
	bls _080AE894
	adds r0, r4, 0
	bl move_anim_8074EE0
_080AE894:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE89C: .4byte gSprites
	thumb_func_end sub_80AE83C

	thumb_func_start sub_80AE8A0
sub_80AE8A0: @ 80AE8A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080AE8C4 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080AE934
	cmp r0, 0x1
	bgt _080AE8C8
	cmp r0, 0
	beq _080AE8D4
	b _080AEA04
	.align 2, 0
_080AE8C4: .4byte gTasks
_080AE8C8:
	cmp r0, 0x2
	beq _080AE990
	cmp r0, 0x3
	bne _080AE8D2
	b _080AE9E4
_080AE8D2:
	b _080AEA04
_080AE8D4:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0x26]
	ldr r4, _080AE908 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AE910
	ldr r0, _080AE90C @ =0x0000ffe0
	strh r0, [r5, 0x24]
	movs r0, 0x2
	b _080AE916
	.align 2, 0
_080AE908: .4byte gUnknown_2037F1A
_080AE90C: .4byte 0x0000ffe0
_080AE910:
	movs r0, 0x20
	strh r0, [r5, 0x24]
	ldr r0, _080AE92C @ =0x0000fffe
_080AE916:
	strh r0, [r5, 0x22]
	ldr r2, _080AE930 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r5, 0x24]
	strh r1, [r0, 0x24]
	b _080AE9D6
	.align 2, 0
_080AE92C: .4byte 0x0000fffe
_080AE930: .4byte gSprites
_080AE934:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AEA04
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r4, _080AE98C @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r5, 0x24]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080AE9D6
	ldrh r2, [r5, 0x22]
	adds r2, r1, r2
	strh r2, [r5, 0x24]
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x24]
	b _080AEA04
	.align 2, 0
_080AE98C: .4byte gSprites
_080AE990:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AEA04
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r1, _080AE9E0 @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080AEA04
_080AE9D6:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080AEA04
	.align 2, 0
_080AE9E0: .4byte gSprites
_080AE9E4:
	ldr r2, _080AEA0C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r5, r0]
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
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080AEA04:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AEA0C: .4byte gSprites
	thumb_func_end sub_80AE8A0

	thumb_func_start sub_80AEA10
sub_80AEA10: @ 80AEA10
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080AEA34 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080AEA2A
	b _080AEB50
_080AEA2A:
	cmp r0, 0x1
	bgt _080AEA38
	cmp r0, 0
	beq _080AEA40
	b _080AEB92
	.align 2, 0
_080AEA34: .4byte gTasks
_080AEA38:
	cmp r0, 0x2
	bne _080AEA3E
	b _080AEB84
_080AEA3E:
	b _080AEB92
_080AEA40:
	ldr r4, _080AEA80 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080AEA56
	movs r1, 0x1
_080AEA56:
	movs r6, 0
	strh r1, [r5, 0xA]
	ldr r0, _080AEA84 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r2, [r0, r1]
	adds r3, r0, 0
	cmp r2, 0
	beq _080AEA8C
	cmp r2, 0x4
	beq _080AEAB4
	ldrh r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AEAEC
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0xE]
	ldr r0, _080AEA88 @ =0x0000fff0
	b _080AEAF4
	.align 2, 0
_080AEA80: .4byte gUnknown_2037F1A
_080AEA84: .4byte gUnknown_2037F02
_080AEA88: .4byte 0x0000fff0
_080AEA8C:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r0, 7
	adds r0, 0x78
	strh r0, [r5, 0x10]
	b _080AEB2A
_080AEAB4:
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r1, 7
	movs r0, 0x78
	subs r0, r1
	strh r0, [r5, 0xE]
	ldr r4, _080AEAE8 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	lsls r1, 5
	subs r0, r1
	strh r0, [r5, 0x10]
	b _080AEB2A
	.align 2, 0
_080AEAE8: .4byte gUnknown_2037F1B
_080AEAEC:
	ldr r0, _080AEB10 @ =0x0000fff0
	strh r0, [r5, 0xE]
	movs r0, 0x80
	lsls r0, 1
_080AEAF4:
	strh r0, [r5, 0x10]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080AEB14
	movs r2, 0
	ldrsh r0, [r3, r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	movs r0, 0x50
	subs r0, r1
	strh r0, [r5, 0x12]
	b _080AEB2A
	.align 2, 0
_080AEB10: .4byte 0x0000fff0
_080AEB14:
	movs r0, 0
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, 0x28
	strh r0, [r5, 0x12]
	ldrh r1, [r5, 0xE]
	ldrh r0, [r5, 0x10]
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
_080AEB2A:
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _080AEB40
	movs r1, 0
	movs r0, 0x1
	strh r0, [r5, 0xA]
	strh r1, [r5, 0x14]
	b _080AEB7C
_080AEB40:
	ldr r0, _080AEB4C @ =0x0000ffff
	strh r0, [r5, 0xA]
	movs r0, 0x3
	strh r0, [r5, 0x14]
	b _080AEB7C
	.align 2, 0
_080AEB4C: .4byte 0x0000ffff
_080AEB50:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	ble _080AEB92
	movs r0, 0
	strh r0, [r5, 0xC]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80AEB98
	lsls r0, 24
	cmp r0, 0
	bne _080AEB7C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80AEB98
	lsls r0, 24
	cmp r0, 0
	beq _080AEB92
_080AEB7C:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080AEB92
_080AEB84:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AEB92
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080AEB92:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80AEA10

	thumb_func_start sub_80AEB98
sub_80AEB98: @ 80AEB98
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080AEC24 @ =gUnknown_83E6278
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	movs r3, 0x12
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080AEBCE
	ldr r1, _080AEC28 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strh r5, [r0, 0x3A]
	movs r1, 0x7
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_080AEBCE:
	ldrh r1, [r4, 0xA]
	ldrh r5, [r4, 0x14]
	adds r0, r1, r5
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bge _080AEBE0
	movs r0, 0x3
	strh r0, [r4, 0x14]
_080AEBE0:
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	ble _080AEBEC
	movs r0, 0
	strh r0, [r4, 0x14]
_080AEBEC:
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	lsls r0, 4
	ldrh r5, [r4, 0xE]
	adds r2, r0, r5
	strh r2, [r4, 0xE]
	lsls r0, r1, 16
	asrs r3, r0, 16
	cmp r3, 0x1
	bne _080AEC0C
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x10
	ldrsh r1, [r4, r5]
	cmp r0, r1
	bge _080AEC20
_080AEC0C:
	movs r0, 0x1
	negs r0, r0
	cmp r3, r0
	bne _080AEC2C
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080AEC2C
_080AEC20:
	movs r0, 0x1
	b _080AEC2E
	.align 2, 0
_080AEC24: .4byte gUnknown_83E6278
_080AEC28: .4byte gSprites
_080AEC2C:
	movs r0, 0
_080AEC2E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80AEB98

	thumb_func_start sub_80AEC34
sub_80AEC34: @ 80AEC34
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080AEC74
	ldr r3, _080AEC7C @ =gTasks
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
_080AEC74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEC7C: .4byte gTasks
	thumb_func_end sub_80AEC34

	thumb_func_start sub_80AEC80
sub_80AEC80: @ 80AEC80
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080AEC92
	cmp r0, 0x1
	beq _080AECC4
	b _080AECD8
_080AEC92:
	ldr r4, _080AECC0 @ =gUnknown_2037F1A
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
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080AECD8
	.align 2, 0
_080AECC0: .4byte gUnknown_2037F1A
_080AECC4:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080AECD8
	adds r0, r5, 0
	bl move_anim_8074EE0
_080AECD8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80AEC80

	thumb_func_start sub_80AECE0
sub_80AECE0: @ 80AECE0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080AED04 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080AECFA
	b _080AEE6C
_080AECFA:
	lsls r0, 2
	ldr r1, _080AED08 @ =_080AED0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AED04: .4byte gTasks
_080AED08: .4byte _080AED0C
	.align 2, 0
_080AED0C:
	.4byte _080AED20
	.4byte _080AEDB0
	.4byte _080AEDEC
	.4byte _080AEE48
	.4byte _080AEE58
_080AED20:
	ldr r4, _080AEDA4 @ =gUnknown_2037F1A
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
	movs r0, 0x4
	strh r0, [r5, 0x18]
	ldr r0, _080AEDA8 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r5, r2]
	movs r2, 0x14
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x5
	bl __divsi3
	strh r0, [r5, 0x1A]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080AEDAC @ =0x0000ffff
	strh r0, [r5, 0x12]
	movs r0, 0xC
	strh r0, [r5, 0x1E]
	subs r0, 0x4C
	bl sub_8073A44
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x20]
	movs r0, 0x3F
	bl sub_8073A44
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x22]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x24]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x3
	bl __divsi3
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	b _080AEE6A
	.align 2, 0
_080AEDA4: .4byte gUnknown_2037F1A
_080AEDA8: .4byte gUnknown_2037F1B
_080AEDAC: .4byte 0x0000ffff
_080AEDB0:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _080AEDE0
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80AEE74
	lsls r0, 24
	cmp r0, 0
	beq _080AEDE0
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x5
	bne _080AEDDA
	movs r0, 0x3
	b _080AEDDE
_080AEDDA:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
_080AEDDE:
	strh r0, [r5, 0x8]
_080AEDE0:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080AEE6C
	b _080AEE62
_080AEDEC:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080AEDFA
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
_080AEDFA:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080AEE6C
	strh r3, [r5, 0xA]
	ldrh r1, [r5, 0xC]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080AEE26
	movs r0, 0x4
	strh r0, [r5, 0x16]
	movs r0, 0x44
	strh r0, [r5, 0x18]
	strh r3, [r5, 0x10]
	strh r2, [r5, 0x12]
	b _080AEE36
_080AEE26:
	movs r0, 0x44
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080AEE44 @ =0x0000ffff
	strh r0, [r5, 0x12]
_080AEE36:
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080AEE68
	movs r0, 0x4
	b _080AEE6A
	.align 2, 0
_080AEE44: .4byte 0x0000ffff
_080AEE48:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AEE6C
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	b _080AEE6C
_080AEE58:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080AEE68
_080AEE62:
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
	b _080AEE6C
_080AEE68:
	movs r0, 0x1
_080AEE6A:
	strh r0, [r5, 0x8]
_080AEE6C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80AECE0

	thumb_func_start sub_80AEE74
sub_80AEE74: @ 80AEE74
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080AEF3C @ =gUnknown_83E62A8
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	movs r3, 0x16
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080AEEE0
	ldr r1, _080AEF40 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldrh r6, [r4, 0x10]
	adds r1, r6
	ldr r6, _080AEF44 @ =0x000003ff
	adds r0, r6, 0
	ands r1, r0
	ldr r0, _080AEF48 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _080AEEC8
	movs r0, 0x7
	strh r0, [r4, 0x10]
_080AEEC8:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0x7
	ble _080AEED4
	movs r0, 0
	strh r0, [r4, 0x10]
_080AEED4:
	strh r5, [r3, 0x3A]
	movs r0, 0x3
	strh r0, [r3, 0x3C]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
_080AEEE0:
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080AEF02
	movs r5, 0x12
	ldrsh r0, [r4, r5]
	cmp r0, 0
	ble _080AEF02
	ldrh r1, [r4, 0x26]
	ldrh r6, [r4, 0x24]
	adds r1, r6
	strh r1, [r4, 0x24]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x6F
	bl PlaySE12WithPanning
_080AEF02:
	movs r0, 0x12
	ldrsh r3, [r4, r0]
	ldrh r2, [r4, 0x16]
	cmp r3, 0
	bge _080AEF18
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x18
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080AEF28
_080AEF18:
	cmp r3, 0
	ble _080AEF4C
	lsls r0, r2, 16
	asrs r0, 16
	movs r6, 0x18
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080AEF4C
_080AEF28:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1A]
	ldrh r1, [r4, 0x14]
	adds r0, r1
	strh r0, [r4, 0x14]
	movs r0, 0x1
	b _080AEF58
	.align 2, 0
_080AEF3C: .4byte gUnknown_83E62A8
_080AEF40: .4byte gSprites
_080AEF44: .4byte 0x000003ff
_080AEF48: .4byte 0xfffffc00
_080AEF4C:
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r0, r2, r0
	strh r0, [r4, 0x16]
	movs r0, 0
_080AEF58:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80AEE74

	thumb_func_start sub_80AEF60
sub_80AEF60: @ 80AEF60
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080AEF96
	ldr r3, _080AEF9C @ =gTasks
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
_080AEF96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEF9C: .4byte gTasks
	thumb_func_end sub_80AEF60

	thumb_func_start sub_80AEFA0
sub_80AEFA0: @ 80AEFA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080AEFC4 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080AF01C
	cmp r0, 0x1
	bgt _080AEFC8
	cmp r0, 0
	beq _080AEFCE
	b _080AF052
	.align 2, 0
_080AEFC4: .4byte gTasks
_080AEFC8:
	cmp r0, 0x2
	beq _080AF044
	b _080AF052
_080AEFCE:
	ldr r0, _080AF018 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r5, 0x26]
	strh r0, [r5, 0x24]
	cmp r0, 0x10
	ble _080AEFF8
	adds r2, r0, 0
_080AEFE8:
	adds r1, r2, 0
	subs r1, 0x20
	adds r2, r1, 0
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x10
	bgt _080AEFE8
	strh r1, [r5, 0x24]
_080AEFF8:
	ldr r4, _080AF018 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl sub_807685C
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x2
	strh r0, [r5, 0x20]
	b _080AF03C
	.align 2, 0
_080AF018: .4byte gUnknown_2037F1B
_080AF01C:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080AF052
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80AF058
	lsls r0, 24
	cmp r0, 0
	beq _080AF052
_080AF03C:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080AF052
_080AF044:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AF052
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080AF052:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80AEFA0

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
	ldr r4, _080AF218 @ =gUnknown_2037F1B
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
	ldr r4, _080AF21C @ =gUnknown_2037F1A
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
	ldr r1, _080AF220 @ =gUnknown_2037F02
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
	ldr r1, _080AF220 @ =gUnknown_2037F02
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
_080AF218: .4byte gUnknown_2037F1B
_080AF21C: .4byte gUnknown_2037F1A
_080AF220: .4byte gUnknown_2037F02
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
	ldr r0, _080AF324 @ =gUnknown_2037F02
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
_080AF324: .4byte gUnknown_2037F02
_080AF328: .4byte DestroyAnimSprite
_080AF32C: .4byte sub_8074AE0
	thumb_func_end sub_80AF2F0

	thumb_func_start sub_80AF330
sub_80AF330: @ 80AF330
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080AF364 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldr r0, _080AF368 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF370
	ldr r0, _080AF36C @ =gUnknown_2037F02
	ldrh r1, [r4, 0x32]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r4, 0x32]
	b _080AF37A
	.align 2, 0
_080AF364: .4byte gUnknown_2037F1B
_080AF368: .4byte gUnknown_2037F1A
_080AF36C: .4byte gUnknown_2037F02
_080AF370:
	ldr r0, _080AF3A8 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
_080AF37A:
	ldr r0, _080AF3AC @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	ldr r1, _080AF3A8 @ =gUnknown_2037F02
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
_080AF3A8: .4byte gUnknown_2037F02
_080AF3AC: .4byte gUnknown_2037F1B
_080AF3B0: .4byte DestroyAnimSprite
_080AF3B4: .4byte sub_8075590
	thumb_func_end sub_80AF330

	thumb_func_start sub_80AF3B8
sub_80AF3B8: @ 80AF3B8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080AF3D0 @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AF3D4
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
	b _080AF40A
	.align 2, 0
_080AF3D0: .4byte gUnknown_2037F02
_080AF3D4:
	ldr r0, _080AF41C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_8076D9C
	ldr r0, _080AF420 @ =gUnknown_2037F1A
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
_080AF41C: .4byte gUnknown_2037F1B
_080AF420: .4byte gUnknown_2037F1A
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
	ldr r6, _080AF4B0 @ =gUnknown_2037F02
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
	ldr r4, _080AF4B4 @ =gUnknown_2037F1B
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
_080AF4B0: .4byte gUnknown_2037F02
_080AF4B4: .4byte gUnknown_2037F1B
_080AF4B8:
	ldr r0, _080AF4E4 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_8076D9C
_080AF4CA:
	ldr r0, _080AF4E8 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF4F0
	ldr r0, _080AF4EC @ =gUnknown_2037F02
	ldrh r1, [r5, 0x32]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r5, 0x32]
	b _080AF4FA
	.align 2, 0
_080AF4E4: .4byte gUnknown_2037F1B
_080AF4E8: .4byte gUnknown_2037F1A
_080AF4EC: .4byte gUnknown_2037F02
_080AF4F0:
	ldr r0, _080AF598 @ =gUnknown_2037F02
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
_080AF598: .4byte gUnknown_2037F02
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
	ldr r0, _080AF600 @ =gUnknown_2037F1A
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
_080AF600: .4byte gUnknown_2037F1A
_080AF604: .4byte 0x0000ffec
_080AF608: .4byte sub_80AF60C
	thumb_func_end sub_80AF5A4

	thumb_func_start sub_80AF60C
sub_80AF60C: @ 80AF60C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AF660 @ =gUnknown_2037F1A
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
_080AF660: .4byte gUnknown_2037F1A
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
	ldr r1, _080AF71C @ =gUnknown_2037F02
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
	ldr r4, _080AF720 @ =gUnknown_2037F1B
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
_080AF71C: .4byte gUnknown_2037F02
_080AF720: .4byte gUnknown_2037F1B
_080AF724:
	ldr r0, _080AF754 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_8076D9C
_080AF736:
	ldr r0, _080AF758 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AF760
	ldr r0, _080AF75C @ =gUnknown_2037F02
	ldrh r1, [r5, 0x32]
	ldrh r2, [r0, 0x4]
	subs r1, r2
	strh r1, [r5, 0x32]
	adds r1, r0, 0
	b _080AF76A
	.align 2, 0
_080AF754: .4byte gUnknown_2037F1B
_080AF758: .4byte gUnknown_2037F1A
_080AF75C: .4byte gUnknown_2037F02
_080AF760:
	ldr r1, _080AF814 @ =gUnknown_2037F02
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
	ldr r1, _080AF814 @ =gUnknown_2037F02
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
_080AF814: .4byte gUnknown_2037F02
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
	ldr r5, _080AF8AC @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080AF8B0
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075114
	b _080AF8E6
	.align 2, 0
_080AF8AC: .4byte gUnknown_2037F02
_080AF8B0:
	ldr r0, _080AF8F0 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_8076D9C
	ldr r0, _080AF8F4 @ =gUnknown_2037F1A
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
_080AF8F0: .4byte gUnknown_2037F1B
_080AF8F4: .4byte gUnknown_2037F1A
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
	ldr r6, _080AF934 @ =gUnknown_2037F02
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
_080AF934: .4byte gUnknown_2037F02
_080AF938:
	ldr r4, _080AF960 @ =gUnknown_2037F1A
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
_080AF960: .4byte gUnknown_2037F1A
_080AF964:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080AF96A:
	strh r0, [r5, 0x20]
	ldr r0, _080AF97C @ =gUnknown_2037F02
	ldrh r0, [r0, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
_080AF976:
	ldr r0, _080AF980 @ =gUnknown_2037F1A
	b _080AF9D4
	.align 2, 0
_080AF97C: .4byte gUnknown_2037F02
_080AF980: .4byte gUnknown_2037F1A
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
	ldr r4, _080AF9BC @ =gUnknown_2037F1B
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
_080AF9BC: .4byte gUnknown_2037F1B
_080AF9C0:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080AF9C6:
	strh r0, [r5, 0x20]
	ldr r0, _080AF9F0 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
_080AF9D2:
	ldr r0, _080AF9F4 @ =gUnknown_2037F1B
_080AF9D4:
	ldrb r0, [r0]
	strh r0, [r5, 0x3C]
	ldr r0, _080AF9F0 @ =gUnknown_2037F02
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
_080AF9F0: .4byte gUnknown_2037F02
_080AF9F4: .4byte gUnknown_2037F1B
_080AF9F8:
	movs r0, 0x40
_080AF9FA:
	strh r0, [r5, 0x3A]
	ldr r0, _080AFA40 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080AFA10
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
_080AFA10:
	ldr r1, _080AFA44 @ =gUnknown_2037F02
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
_080AFA40: .4byte gUnknown_2037F1B
_080AFA44: .4byte gUnknown_2037F02
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
	ldr r0, _080AFBA4 @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080AFBA8 @ =gUnknown_202297A
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
	ldr r1, _080AFBB0 @ =gUnknown_8E7F1F4
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
_080AFBA4: .4byte gUnknown_2022978
_080AFBA8: .4byte gUnknown_202297A
_080AFBAC: .4byte gUnknown_83C3540
_080AFBB0: .4byte gUnknown_8E7F1F4
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
	ldr r1, _080AFBF4 @ =gUnknown_2022978
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
_080AFBF4: .4byte gUnknown_2022978
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
	ldr r0, _080AFD44 @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080AFD48 @ =gUnknown_202297A
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
_080AFD44: .4byte gUnknown_2022978
_080AFD48: .4byte gUnknown_202297A
	thumb_func_end sub_80AFBC0

	thumb_func_start sub_80AFD4C
sub_80AFD4C: @ 80AFD4C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080AFD78 @ =gUnknown_2037F1A
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
_080AFD78: .4byte gUnknown_2037F1A
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
	ldr r0, _080AFE44 @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080AFE48 @ =gUnknown_202297A
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
	ldr r1, _080AFE50 @ =gUnknown_8E7F1F4
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
_080AFE44: .4byte gUnknown_2022978
_080AFE48: .4byte gUnknown_202297A
_080AFE4C: .4byte gUnknown_83C3540
_080AFE50: .4byte gUnknown_8E7F1F4
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
	ldr r2, _080AFE94 @ =gUnknown_2022978
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
_080AFE94: .4byte gUnknown_2022978
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
	ldr r0, _080AFFCC @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080AFFD0 @ =gUnknown_202297A
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
_080AFFCC: .4byte gUnknown_2022978
_080AFFD0: .4byte gUnknown_202297A
	thumb_func_end sub_80AFE64

	thumb_func_start sub_80AFFD4
sub_80AFFD4: @ 80AFFD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldr r6, _080B00BC @ =gUnknown_2037F02
	ldrh r0, [r6]
	strh r0, [r5, 0x2E]
	ldr r0, _080B00C0 @ =gUnknown_2037F1A
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	ldr r7, _080B00C4 @ =gUnknown_2037F1B
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
	ldr r4, _080B00C0 @ =gUnknown_2037F1A
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
	ldr r6, _080B00BC @ =gUnknown_2037F02
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080B00D0
	ldrh r0, [r6, 0x2]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x30]
	ldr r4, _080B00C4 @ =gUnknown_2037F1B
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
_080B00BC: .4byte gUnknown_2037F02
_080B00C0: .4byte gUnknown_2037F1A
_080B00C4: .4byte gUnknown_2037F1B
_080B00C8: .4byte gUnknown_2023BD6
_080B00CC: .4byte gSprites
_080B00D0:
	ldrh r0, [r6, 0x2]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x30]
	ldr r4, _080B0140 @ =gUnknown_2037F1B
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
_080B0140: .4byte gUnknown_2037F1B
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
	ldr r1, _080B0194 @ =gUnknown_825E074
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
_080B0194: .4byte gUnknown_825E074
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
	ldr r6, _080B01F8 @ =gUnknown_2037F1B
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
_080B01F8: .4byte gUnknown_2037F1B
_080B01FC: .4byte gUnknown_2023BD6
_080B0200:
	strh r5, [r4, 0x38]
_080B0202:
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080B022C @ =gUnknown_825E074
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
_080B022C: .4byte gUnknown_825E074
_080B0230:
	adds r0, r4, 0
	bl sub_80755E0
	ldr r1, _080B028C @ =gUnknown_825E074
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
_080B028C: .4byte gUnknown_825E074
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
	ldr r0, _080B0324 @ =gUnknown_2037F1B
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
_080B0324: .4byte gUnknown_2037F1B
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
	ldr r6, _080B0780 @ =gUnknown_2037F02
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080B0784 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B0742
	ldrh r0, [r6, 0x4]
	negs r0, r0
	strh r0, [r6, 0x4]
_080B0742:
	ldr r4, _080B0788 @ =gUnknown_2037F1B
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
_080B0780: .4byte gUnknown_2037F02
_080B0784: .4byte gUnknown_2037F1A
_080B0788: .4byte gUnknown_2037F1B
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
	ldr r1, _080B0898 @ =gUnknown_2037F02
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
_080B0898: .4byte gUnknown_2037F02
_080B089C: .4byte gUnknown_2037EE4
	thumb_func_end sub_80B0870

	thumb_func_start unc_080B08A0
unc_080B08A0: @ 80B08A0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B08D0 @ =gUnknown_2037F02
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
_080B08D0: .4byte gUnknown_2037F02
_080B08D4: .4byte sub_8074C44
_080B08D8: .4byte DestroyAnimSprite
	thumb_func_end unc_080B08A0

	thumb_func_start sub_80B08DC
sub_80B08DC: @ 80B08DC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B0920 @ =gUnknown_2037F02
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B0904
	ldr r0, _080B0924 @ =gUnknown_2037F1A
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
	ldr r4, _080B0920 @ =gUnknown_2037F02
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
_080B0920: .4byte gUnknown_2037F02
_080B0924: .4byte gUnknown_2037F1A
	thumb_func_end sub_80B08DC

	thumb_func_start sub_80B0928
sub_80B0928: @ 80B0928
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B0944
	ldr r0, _080B0950 @ =gUnknown_2037F02
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
_080B0950: .4byte gUnknown_2037F02
	thumb_func_end sub_80B0928

	thumb_func_start sub_80B0954
sub_80B0954: @ 80B0954
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B0974 @ =gUnknown_2037F02
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
_080B0974: .4byte gUnknown_2037F02
_080B0978:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075114
_080B0980:
	ldr r0, _080B0998 @ =gUnknown_2037F02
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
_080B0998: .4byte gUnknown_2037F02
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
	ldr r0, _080B09C0 @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r9, r0
	cmp r1, 0
	bne _080B09C8
	ldr r0, _080B09C4 @ =gUnknown_2037F1A
	b _080B09CA
	.align 2, 0
_080B09C0: .4byte gUnknown_2037F02
_080B09C4: .4byte gUnknown_2037F1A
_080B09C8:
	ldr r0, _080B0B10 @ =gUnknown_2037F1B
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
_080B0B10: .4byte gUnknown_2037F1B
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
	ldr r0, _080B0BA0 @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B0BA4
	ldrh r0, [r4, 0x20]
	subs r0, 0x14
	strh r0, [r4, 0x32]
	b _080B0BB6
	.align 2, 0
_080B0BA0: .4byte gUnknown_2037F02
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
	ldr r0, _080B0CA4 @ =gUnknown_2037F1A
	ldrb r1, [r0]
	movs r0, 0x2
	ldr r2, _080B0CA8 @ =gUnknown_2037F1B
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
	ldr r1, _080B0CAC @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
_080B0C54:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r0, _080B0CA4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B0C72
	ldr r1, _080B0CAC @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B0C72:
	ldr r4, _080B0CAC @ =gUnknown_2037F02
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
_080B0CA4: .4byte gUnknown_2037F1A
_080B0CA8: .4byte gUnknown_2037F1B
_080B0CAC: .4byte gUnknown_2037F02
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
	ldr r5, _080B0D18 @ =gUnknown_2037F02
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
_080B0D18: .4byte gUnknown_2037F02
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
	ldr r0, _080B0D74 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080B0D78 @ =sub_80B0D7C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0D74: .4byte gUnknown_2037F02
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
	ldr r4, _080B0DC8 @ =gUnknown_2037F1B
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
_080B0DC8: .4byte gUnknown_2037F1B
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
	ldr r1, _080B0E18 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080B0E78
	.align 2, 0
_080B0E18: .4byte gUnknown_2037F02
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
	ldr r0, _080B0E94 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B0E9C
	ldr r4, _080B0E98 @ =gUnknown_2037F1A
	b _080B0E9E
	.align 2, 0
_080B0E94: .4byte gUnknown_2037F02
_080B0E98: .4byte gUnknown_2037F1A
_080B0E9C:
	ldr r4, _080B0EE4 @ =gUnknown_2037F1B
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
	ldr r1, _080B0EE8 @ =gUnknown_2037F02
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
_080B0EE4: .4byte gUnknown_2037F1B
_080B0EE8: .4byte gUnknown_2037F02
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
	ldr r6, _080B0F8C @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080B0F94
	ldr r4, _080B0F90 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x4]
	adds r0, r2
	b _080B0FA6
	.align 2, 0
_080B0F8C: .4byte gUnknown_2037F02
_080B0F90: .4byte gUnknown_2037F1A
_080B0F94:
	ldr r4, _080B0FF0 @ =gUnknown_2037F1B
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
	ldr r3, _080B0FF4 @ =gUnknown_2037F02
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
_080B0FF0: .4byte gUnknown_2037F1B
_080B0FF4: .4byte gUnknown_2037F02
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
	ldr r0, _080B10C8 @ =gUnknown_2037F02
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
	ldr r0, _080B10D0 @ =gUnknown_2037F1A
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
	ldr r0, _080B10D4 @ =gUnknown_2037F1B
	b _080B10F4
	.align 2, 0
_080B10C8: .4byte gUnknown_2037F02
_080B10CC: .4byte sBattler_AI
_080B10D0: .4byte gUnknown_2037F1A
_080B10D4: .4byte gUnknown_2037F1B
_080B10D8:
	ldr r0, _080B1110 @ =gUnknown_2037F1B
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
	ldr r0, _080B1114 @ =gUnknown_2037F1A
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
_080B1110: .4byte gUnknown_2037F1B
_080B1114: .4byte gUnknown_2037F1A
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
	ldr r4, _080B11D4 @ =gUnknown_2037F02
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
_080B11D4: .4byte gUnknown_2037F02
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
	ldr r4, _080B1298 @ =gUnknown_2037F1A
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
	ldr r2, _080B129C @ =gUnknown_2037F1B
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
_080B1298: .4byte gUnknown_2037F1A
_080B129C: .4byte gUnknown_2037F1B
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
	ldr r0, _080B131C @ =gUnknown_2037F02
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
	ldr r0, _080B1324 @ =gUnknown_2037F1B
	ldrb r4, [r0]
	ldr r0, _080B1328 @ =gUnknown_2037F1A
	b _080B1332
	.align 2, 0
_080B131C: .4byte gUnknown_2037F02
_080B1320: .4byte sBattler_AI
_080B1324: .4byte gUnknown_2037F1B
_080B1328: .4byte gUnknown_2037F1A
_080B132C:
	ldr r0, _080B1364 @ =gUnknown_2037F1A
	ldrb r4, [r0]
	ldr r0, _080B1368 @ =gUnknown_2037F1B
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
_080B1364: .4byte gUnknown_2037F1A
_080B1368: .4byte gUnknown_2037F1B
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
	ldr r4, _080B1474 @ =gUnknown_2037F1B
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
	ldr r1, _080B1478 @ =gUnknown_2037F02
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
_080B1474: .4byte gUnknown_2037F1B
_080B1478: .4byte gUnknown_2037F02
_080B147C: .4byte gUnknown_2037F16
_080B1480: .4byte sub_80B13D4
	thumb_func_end sub_80B13F8

	thumb_func_start sub_80B1484
sub_80B1484: @ 80B1484
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B149C @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B14A0
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075160
	b _080B14A8
	.align 2, 0
_080B149C: .4byte gUnknown_2037F02
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
	ldr r0, _080B14E4 @ =gUnknown_2037F1A
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
_080B14E4: .4byte gUnknown_2037F1A
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
	ldr r0, _080B1564 @ =gUnknown_2037F02
	ldrh r0, [r0]
	strh r0, [r4, 0x18]
	b _080B157A
	.align 2, 0
_080B1560: .4byte gTasks
_080B1564: .4byte gUnknown_2037F02
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
	ldr r0, _080B15BC @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B15C4
	ldr r1, _080B15C0 @ =gUnknown_2022980
	ldrh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r7, r1, 0
	b _080B15D4
	.align 2, 0
_080B15BC: .4byte gUnknown_2037F1B
_080B15C0: .4byte gUnknown_2022980
_080B15C4:
	ldr r2, _080B1614 @ =gUnknown_2022980
	ldrh r1, [r4, 0x1A]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	adds r7, r2, 0
_080B15D4:
	ldr r3, _080B1618 @ =gUnknown_2022982
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
	ldr r0, _080B161C @ =gUnknown_2037F02
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
_080B1614: .4byte gUnknown_2022980
_080B1618: .4byte gUnknown_2022982
_080B161C: .4byte gUnknown_2037F02
	thumb_func_end sub_80B1530

	thumb_func_start sub_80B1620
sub_80B1620: @ 80B1620
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B1674 @ =gUnknown_2037F02
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
	ldr r4, _080B1678 @ =gUnknown_2037F1B
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
_080B1674: .4byte gUnknown_2037F02
_080B1678: .4byte gUnknown_2037F1B
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
	ldr r5, _080B1714 @ =gUnknown_2037F02
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
	ldr r0, _080B1718 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	mov r6, sp
	adds r6, 0x2
	movs r1, 0x1
	mov r2, sp
	adds r3, r6, 0
	bl sub_8076D9C
	ldr r0, _080B171C @ =gUnknown_2037F1A
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
_080B1714: .4byte gUnknown_2037F02
_080B1718: .4byte gUnknown_2037F1B
_080B171C: .4byte gUnknown_2037F1A
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
	ldr r5, _080B1790 @ =gUnknown_2037F02
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
_080B1790: .4byte gUnknown_2037F02
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
	ldr r0, _080B1824 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_8076D9C
	ldr r0, _080B1828 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B17F0
	ldr r1, _080B182C @ =gUnknown_2037F02
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080B17F0:
	ldr r0, _080B182C @ =gUnknown_2037F02
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
_080B1824: .4byte gUnknown_2037F1B
_080B1828: .4byte gUnknown_2037F1A
_080B182C: .4byte gUnknown_2037F02
_080B1830: .4byte sub_8075590
_080B1834: .4byte DestroyAnimSprite
	thumb_func_end sub_80B17C4

	thumb_func_start sub_80B1838
sub_80B1838: @ 80B1838
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B1850 @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B1854
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
	b _080B188A
	.align 2, 0
_080B1850: .4byte gUnknown_2037F02
_080B1854:
	ldr r0, _080B1894 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_8076D9C
	ldr r0, _080B1898 @ =gUnknown_2037F1A
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
_080B1894: .4byte gUnknown_2037F1B
_080B1898: .4byte gUnknown_2037F1A
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
	ldr r1, _080B1980 @ =gUnknown_2037F02
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
_080B1980: .4byte gUnknown_2037F02
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
	ldr r2, _080B1A10 @ =gUnknown_20375F8
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
_080B1A10: .4byte gUnknown_20375F8
_080B1A14: .4byte 0x00000107
_080B1A18: .4byte 0x00000101
	thumb_func_end sub_80B198C

	thumb_func_start sub_80B1A1C
sub_80B1A1C: @ 80B1A1C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B1A88 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B1A3C
	ldr r1, _080B1A8C @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B1A3C:
	ldr r4, _080B1A8C @ =gUnknown_2037F02
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldr r5, _080B1A90 @ =gUnknown_2037F1B
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
_080B1A88: .4byte gUnknown_2037F1A
_080B1A8C: .4byte gUnknown_2037F02
_080B1A90: .4byte gUnknown_2037F1B
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
	ldr r4, _080B1B54 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B1AE4
	ldr r1, _080B1B58 @ =gUnknown_2037F02
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
	ldr r0, _080B1B58 @ =gUnknown_2037F02
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
	ldr r2, _080B1B58 @ =gUnknown_2037F02
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
	ldr r4, _080B1B5C @ =gUnknown_2037F1B
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
_080B1B54: .4byte gUnknown_2037F1A
_080B1B58: .4byte gUnknown_2037F02
_080B1B5C: .4byte gUnknown_2037F1B
_080B1B60:
	ldr r0, _080B1BA0 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_8076D9C
_080B1B72:
	ldr r4, _080B1BA4 @ =gUnknown_2037F02
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
_080B1BA0: .4byte gUnknown_2037F1B
_080B1BA4: .4byte gUnknown_2037F02
_080B1BA8: .4byte sub_8075590
_080B1BAC: .4byte DestroyAnimSprite
	thumb_func_end sub_80B1AB8

	thumb_func_start sub_80B1BB0
sub_80B1BB0: @ 80B1BB0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r1, _080B1BEC @ =gUnknown_2037F02
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
_080B1BEC: .4byte gUnknown_2037F02
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
	ldr r0, _080B1C64 @ =gUnknown_2037F1A
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
_080B1C64: .4byte gUnknown_2037F1A
_080B1C68: .4byte 0x0000ffe0
_080B1C6C:
	ldr r0, _080B1CB0 @ =0x0000ffe0
	strh r0, [r5, 0x20]
	strh r0, [r5, 0x22]
_080B1C72:
	ldr r0, _080B1CB4 @ =gUnknown_2037F02
	ldrh r0, [r0]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080B1CB8 @ =gUnknown_2037F1B
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
_080B1CB4: .4byte gUnknown_2037F02
_080B1CB8: .4byte gUnknown_2037F1B
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
	ldr r0, _080B1DA8 @ =gUnknown_2037F02
	ldrh r1, [r0, 0xE]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080B1DB0
	ldr r0, _080B1DAC @ =gUnknown_2037F1A
	b _080B1DB2
	.align 2, 0
_080B1DA8: .4byte gUnknown_2037F02
_080B1DAC: .4byte gUnknown_2037F1A
_080B1DB0:
	ldr r0, _080B1E5C @ =gUnknown_2037F1B
_080B1DB2:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B1DC8
	ldr r1, _080B1E60 @ =gUnknown_2037F02
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080B1DC8:
	adds r0, r6, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080B1E60 @ =gUnknown_2037F02
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
_080B1E5C: .4byte gUnknown_2037F1B
_080B1E60: .4byte gUnknown_2037F02
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
	ldr r3, _080B1F88 @ =gUnknown_825E074
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
_080B1F88: .4byte gUnknown_825E074
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
	ldr r3, _080B2478 @ =gUnknown_825E074
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
_080B2478: .4byte gUnknown_825E074
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
	ldr r0, _080B2508 @ =gUnknown_2037F1B
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
	ldr r5, _080B250C @ =gUnknown_2037F1A
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
_080B2508: .4byte gUnknown_2037F1B
_080B250C: .4byte gUnknown_2037F1A
_080B2510: .4byte sub_8075DF4
	thumb_func_end sub_80B24C0

	thumb_func_start sub_80B2514
sub_80B2514: @ 80B2514
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _080B2554 @ =gUnknown_2037F02
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
	ldr r1, _080B255C @ =gUnknown_2037F1B
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
_080B2554: .4byte gUnknown_2037F02
_080B2558: .4byte gUnknown_2023BD6
_080B255C: .4byte gUnknown_2037F1B
_080B2560:
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x28
_080B256E:
	strh r0, [r4, 0x3C]
	ldr r0, _080B259C @ =gUnknown_2037F02
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080B25A4
	ldr r0, _080B25A0 @ =gUnknown_2037F1B
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
_080B259C: .4byte gUnknown_2037F02
_080B25A0: .4byte gUnknown_2037F1B
_080B25A4:
	ldr r0, _080B25C0 @ =gUnknown_2037F1B
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
_080B25C0: .4byte gUnknown_2037F1B
_080B25C4:
	ldr r0, _080B267C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x3C]
_080B25D8:
	ldr r5, _080B2680 @ =gUnknown_825E074
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
_080B267C: .4byte gUnknown_2037F1B
_080B2680: .4byte gUnknown_825E074
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
	ldr r0, _080B2798 @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B279C
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075160
	b _080B27A4
	.align 2, 0
_080B2798: .4byte gUnknown_2037F02
_080B279C:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075114
_080B27A4:
	ldr r4, _080B280C @ =gUnknown_2037F02
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B27BC
	ldr r0, _080B2810 @ =gUnknown_2037F1A
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
	ldr r0, _080B2814 @ =gUnknown_2037F1B
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
	ldr r4, _080B280C @ =gUnknown_2037F02
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
_080B280C: .4byte gUnknown_2037F02
_080B2810: .4byte gUnknown_2037F1A
_080B2814: .4byte gUnknown_2037F1B
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
	ldr r4, _080B2908 @ =gUnknown_2037F02
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
	ldr r5, _080B2910 @ =gUnknown_2037F1B
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
_080B2908: .4byte gUnknown_2037F02
_080B290C: .4byte gUnknown_83E7C98
_080B2910: .4byte gUnknown_2037F1B
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
	ldr r0, _080B29A8 @ =gUnknown_2037F1B
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
_080B29A8: .4byte gUnknown_2037F1B
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
	ldr r1, _080B2A44 @ =gUnknown_2037F02
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
_080B2A44: .4byte gUnknown_2037F02
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
	ldr r0, _080B2B18 @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080B2B20
	ldr r4, _080B2B1C @ =gUnknown_2037F1A
	b _080B2B22
	.align 2, 0
_080B2B18: .4byte gUnknown_2037F02
_080B2B1C: .4byte gUnknown_2037F1A
_080B2B20:
	ldr r4, _080B2B5C @ =gUnknown_2037F1B
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
_080B2B5C: .4byte gUnknown_2037F1B
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
	ldr r2, _080B2C4C @ =gUnknown_2037F02
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
	ldr r4, _080B2C50 @ =gUnknown_2037F1A
	b _080B2C56
	.align 2, 0
_080B2C4C: .4byte gUnknown_2037F02
_080B2C50: .4byte gUnknown_2037F1A
_080B2C54:
	ldr r4, _080B2C80 @ =gUnknown_2037F1B
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
_080B2C80: .4byte gUnknown_2037F1B
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
	ldr r6, _080B2E18 @ =gUnknown_2037F1A
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
_080B2E18: .4byte gUnknown_2037F1A
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
	ldr r0, _080B2E94 @ =gUnknown_2037F02
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
_080B2E94: .4byte gUnknown_2037F02
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
	ldr r0, _080B2F84 @ =gUnknown_2037F1A
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
	ldr r0, _080B2F84 @ =gUnknown_2037F1A
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
_080B2F84: .4byte gUnknown_2037F1A
_080B2F88:
	movs r0, 0xB0
	strh r0, [r6, 0x20]
	movs r0, 0x28
	b _080B2FCA
_080B2F90:
	ldr r5, _080B3000 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B2FA6
	ldr r1, _080B3004 @ =gUnknown_2037F02
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080B2FA6:
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080B3004 @ =gUnknown_2037F02
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
	ldr r0, _080B3004 @ =gUnknown_2037F02
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
_080B3000: .4byte gUnknown_2037F1A
_080B3004: .4byte gUnknown_2037F02
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
	ldr r1, _080B30A8 @ =gUnknown_20375F8
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
_080B30A8: .4byte gUnknown_20375F8
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
	ldr r5, _080B321C @ =gUnknown_2037F02
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
	ldr r0, _080B3220 @ =gUnknown_2037F1A
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
_080B321C: .4byte gUnknown_2037F02
_080B3220: .4byte gUnknown_2037F1A
_080B3224:
	ldrh r0, [r5]
	adds r0, 0xB0
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	adds r0, 0x28
	strh r0, [r4, 0x22]
	b _080B3254
_080B3232:
	ldr r0, _080B3248 @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B324C
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8075160
	b _080B3254
	.align 2, 0
_080B3248: .4byte gUnknown_2037F02
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
	ldr r4, _080B32C0 @ =gUnknown_2037F1A
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
_080B32C0: .4byte gUnknown_2037F1A
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
	ldr r6, _080B3378 @ =gUnknown_2037F1A
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
_080B3378: .4byte gUnknown_2037F1A
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
	ldr r0, _080B34D0 @ =gUnknown_2037F1A
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
_080B34D0: .4byte gUnknown_2037F1A
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
	ldr r4, _080B3610 @ =gUnknown_2037F1A
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
_080B3610: .4byte gUnknown_2037F1A
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
	ldr r6, _080B3828 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080B3818
	ldr r4, _080B382C @ =gUnknown_2037F1A
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
_080B3828: .4byte gUnknown_2037F02
_080B382C: .4byte gUnknown_2037F1A
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
	ldr r0, _080B3894 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080B38A4
	ldr r0, _080B3898 @ =0x0000fff6
	strh r0, [r5, 0x1C]
	ldr r4, _080B389C @ =gUnknown_2037F1B
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
	ldr r4, _080B38A0 @ =gUnknown_2037F1A
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
_080B3894: .4byte gUnknown_2037F02
_080B3898: .4byte 0x0000fff6
_080B389C: .4byte gUnknown_2037F1B
_080B38A0: .4byte gUnknown_2037F1A
_080B38A4:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080B38D0 @ =gUnknown_2037F1A
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
	ldr r4, _080B38D4 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_8076B2C
	adds r0, 0x8
	b _080B3956
	.align 2, 0
_080B38D0: .4byte gUnknown_2037F1A
_080B38D4: .4byte gUnknown_2037F1B
_080B38D8:
	ldr r0, _080B391C @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080B392C
	ldr r0, _080B3920 @ =0x0000fff6
	strh r0, [r5, 0x1C]
	ldr r4, _080B3924 @ =gUnknown_2037F1B
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
	ldr r4, _080B3928 @ =gUnknown_2037F1A
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
_080B391C: .4byte gUnknown_2037F02
_080B3920: .4byte 0x0000fff6
_080B3924: .4byte gUnknown_2037F1B
_080B3928: .4byte gUnknown_2037F1A
_080B392C:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080B3974 @ =gUnknown_2037F1A
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
	ldr r4, _080B3978 @ =gUnknown_2037F1B
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
_080B3974: .4byte gUnknown_2037F1A
_080B3978: .4byte gUnknown_2037F1B
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
	ldr r0, _080B3A94 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl sub_807492C
	lsls r0, 24
	lsrs r1, r0, 24
	adds r0, r1, 0
	subs r0, 0x20
	strh r0, [r4, 0x24]
	ldr r0, _080B3A98 @ =gUnknown_2037F02
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
_080B3A94: .4byte gUnknown_2037F1B
_080B3A98: .4byte gUnknown_2037F02
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
	ldr r0, _080B3AF0 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B3AFC
	ldr r0, _080B3AF4 @ =gUnknown_2022978
	ldrh r0, [r0]
	strh r0, [r4, 0x1C]
	ldr r0, _080B3AF8 @ =0x04000014
	b _080B3B04
	.align 2, 0
_080B3AF0: .4byte gUnknown_2037F1B
_080B3AF4: .4byte gUnknown_2022978
_080B3AF8: .4byte 0x04000014
_080B3AFC:
	ldr r0, _080B3B64 @ =gUnknown_202297C
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
	ldr r5, _080B3B6C @ =gUnknown_2038700
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
	bl sub_8087EE4
	ldr r0, _080B3B74 @ =sub_80B3B78
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3B64: .4byte gUnknown_202297C
_080B3B68: .4byte 0x04000018
_080B3B6C: .4byte gUnknown_2038700
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
	ldr r0, _080B3BF4 @ =gUnknown_825E074
	mov r9, r0
	movs r7, 0x3
	ldr r1, _080B3BF8 @ =gUnknown_2038700
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
_080B3BF4: .4byte gUnknown_825E074
_080B3BF8: .4byte gUnknown_2038700
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
	ldr r1, _080B3C60 @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B3C58:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080B3C6A
	.align 2, 0
_080B3C60: .4byte gUnknown_2039600
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
	ldr r1, _080B3CD4 @ =gUnknown_2037F02
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
_080B3CD4: .4byte gUnknown_2037F02
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
	ldr r1, _080B3D70 @ =gUnknown_2037F02
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
_080B3D70: .4byte gUnknown_2037F02
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
	ldr r1, _080B3DF8 @ =gUnknown_825E074
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
_080B3DF8: .4byte gUnknown_825E074
_080B3DFC:
	ldrh r0, [r4, 0xA]
	subs r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080B3E48 @ =gUnknown_825E074
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
_080B3E48: .4byte gUnknown_825E074
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
	ldr r4, _080B3EF8 @ =gUnknown_2037F1A
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
_080B3EF8: .4byte gUnknown_2037F1A
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
	ldr r0, _080B3FD4 @ =gUnknown_2037F02
	ldrh r1, [r0, 0x4]
	negs r1, r1
	strh r1, [r0, 0x4]
	ldrh r1, [r0]
	negs r1, r1
	strh r1, [r0]
	b _080B4008
	.align 2, 0
_080B3FD4: .4byte gUnknown_2037F02
_080B3FD8:
	ldr r0, _080B406C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B4008
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r1, _080B4070 @ =gUnknown_2037F02
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
	ldr r5, _080B406C @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074844
	lsls r0, 24
	ldr r4, _080B4070 @ =gUnknown_2037F02
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
_080B406C: .4byte gUnknown_2037F1B
_080B4070: .4byte gUnknown_2037F02
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
	ldr r1, _080B409C @ =gUnknown_2037F02
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _080B40BC
	.align 2, 0
_080B409C: .4byte gUnknown_2037F02
_080B40A0:
	ldr r0, _080B4118 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B40BC
	ldr r0, _080B411C @ =gUnknown_2037F02
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0]
	negs r1, r1
	strh r1, [r0]
_080B40BC:
	ldr r5, _080B4118 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074844
	lsls r0, 24
	ldr r4, _080B411C @ =gUnknown_2037F02
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
_080B4118: .4byte gUnknown_2037F1B
_080B411C: .4byte gUnknown_2037F02
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
	ldr r0, _080B4184 @ =gUnknown_2037F02
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
	ldr r1, _080B4184 @ =gUnknown_2037F02
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
	ldr r4, _080B4188 @ =gUnknown_2037F1B
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
_080B4184: .4byte gUnknown_2037F02
_080B4188: .4byte gUnknown_2037F1B
_080B418C:
	ldr r0, _080B41B4 @ =gUnknown_2037F1B
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
	ldr r0, _080B41B8 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x6]
	strh r0, [r5, 0x38]
	ldr r0, _080B41BC @ =sub_80B41C0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B41B4: .4byte gUnknown_2037F1B
_080B41B8: .4byte gUnknown_2037F02
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
	ldr r0, _080B4228 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_8076D9C
	ldr r0, _080B422C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B4234
	ldr r0, _080B4230 @ =gUnknown_2037F02
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080B4240
	.align 2, 0
_080B4228: .4byte gUnknown_2037F1B
_080B422C: .4byte gUnknown_2037F1A
_080B4230: .4byte gUnknown_2037F02
_080B4234:
	ldr r1, _080B4268 @ =gUnknown_2037F02
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
	ldr r0, _080B426C @ =gUnknown_2037F1B
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
_080B4268: .4byte gUnknown_2037F02
_080B426C: .4byte gUnknown_2037F1B
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
	ldr r1, _080B4380 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	b _080B43A6
	.align 2, 0
_080B4380: .4byte gUnknown_2037F02
_080B4384:
	ldr r0, _080B4480 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B43A6
	ldr r1, _080B4484 @ =gUnknown_2037F02
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
	ldr r0, _080B4480 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r5, _080B4488 @ =gUnknown_2037F1B
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
	ldr r0, _080B4484 @ =gUnknown_2037F02
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
	ldr r5, _080B4488 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	ldr r6, _080B4484 @ =gUnknown_2037F02
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
_080B4480: .4byte gUnknown_2037F1A
_080B4484: .4byte gUnknown_2037F02
_080B4488: .4byte gUnknown_2037F1B
_080B448C: .4byte sub_8075590
_080B4490: .4byte DestroyAnimSprite
	thumb_func_end sub_80B4364

	thumb_func_start sub_80B4494
sub_80B4494: @ 80B4494
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B4500 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B44B4
	ldr r1, _080B4504 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B44B4:
	ldr r4, _080B4504 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080B4508 @ =gUnknown_2037F1B
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
_080B4500: .4byte gUnknown_2037F1A
_080B4504: .4byte gUnknown_2037F02
_080B4508: .4byte gUnknown_2037F1B
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
	ldr r0, _080B45EC @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B45F4
	ldr r4, _080B45F0 @ =gUnknown_2037F1A
	b _080B45F6
	.align 2, 0
_080B45EC: .4byte gUnknown_2037F02
_080B45F0: .4byte gUnknown_2037F1A
_080B45F4:
	ldr r4, _080B4628 @ =gUnknown_2037F1B
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
_080B4628: .4byte gUnknown_2037F1B
_080B462C: .4byte move_anim_8074EE0
_080B4630: .4byte sub_8074F50
	thumb_func_end sub_80B45D8

	thumb_func_start sub_80B4634
sub_80B4634: @ 80B4634
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080B46A0 @ =gUnknown_2037F02
	movs r1, 0x6
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080B4654
	ldr r0, _080B46A4 @ =gUnknown_2037F1B
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
_080B46A0: .4byte gUnknown_2037F02
_080B46A4: .4byte gUnknown_2037F1B
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
	ldr r4, _080B4720 @ =gUnknown_2037F02
	ldrb r1, [r4, 0xA]
	bl StartSpriteAnim
	adds r0, r5, 0
	bl AnimateSprite
	ldr r0, _080B4724 @ =gUnknown_2037F1A
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
_080B4720: .4byte gUnknown_2037F02
_080B4724: .4byte gUnknown_2037F1A
_080B4728:
	ldrh r0, [r4]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080B472E:
	strh r0, [r5, 0x20]
	ldr r3, _080B4770 @ =gUnknown_2037F02
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
_080B4770: .4byte gUnknown_2037F02
_080B4774: .4byte sub_8074D00
_080B4778: .4byte move_anim_8074EE0
	thumb_func_end sub_80B46F8

	thumb_func_start sub_80B477C
sub_80B477C: @ 80B477C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B4794 @ =gUnknown_2037F02
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B4798
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075160
	b _080B47A0
	.align 2, 0
_080B4794: .4byte gUnknown_2037F02
_080B4798:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075114
_080B47A0:
	ldr r1, _080B47BC @ =gUnknown_2037F02
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
_080B47BC: .4byte gUnknown_2037F02
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
	ldr r0, _080B48E8 @ =gUnknown_2022978
	strh r5, [r0]
	ldr r4, _080B48EC @ =gUnknown_202297A
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
	ldr r1, _080B48F0 @ =gUnknown_8E79354
	bl sub_807543C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080B48F4 @ =gUnknown_8E794D0
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080B48F8 @ =gUnknown_8E799FC
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
	ldr r0, _080B48FC @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080B48CA
	ldr r0, _080B4900 @ =gUnknown_2037F1A
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
_080B48E8: .4byte gUnknown_2022978
_080B48EC: .4byte gUnknown_202297A
_080B48F0: .4byte gUnknown_8E79354
_080B48F4: .4byte gUnknown_8E794D0
_080B48F8: .4byte gUnknown_8E799FC
_080B48FC: .4byte gUnknown_2037F02
_080B4900: .4byte gUnknown_2037F1A
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
	ldr r1, _080B4938 @ =gUnknown_2022978
	ldr r3, _080B493C @ =0x0000fffa
	adds r0, r3, 0
	ldrh r3, [r1]
	adds r0, r3
	b _080B4946
	.align 2, 0
_080B4934: .4byte gTasks
_080B4938: .4byte gUnknown_2022978
_080B493C: .4byte 0x0000fffa
_080B4940:
	ldr r1, _080B4974 @ =gUnknown_2022978
	ldrh r0, [r1]
	adds r0, 0x6
_080B4946:
	strh r0, [r1]
	ldr r1, _080B4978 @ =gUnknown_202297A
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
_080B4974: .4byte gUnknown_2022978
_080B4978: .4byte gUnknown_202297A
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
	ldr r0, _080B4AA0 @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B4AA4 @ =gUnknown_202297A
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
_080B4AA0: .4byte gUnknown_2022978
_080B4AA4: .4byte gUnknown_202297A
	thumb_func_end sub_80B490C

	thumb_func_start sub_80B4AA8
sub_80B4AA8: @ 80B4AA8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B4B24
	ldr r4, _080B4AEC @ =gUnknown_2037F02
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B4AF4
	ldr r0, _080B4AF0 @ =gUnknown_2037F1A
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
_080B4AEC: .4byte gUnknown_2037F02
_080B4AF0: .4byte gUnknown_2037F1A
_080B4AF4:
	ldr r0, _080B4B18 @ =0x0000ffc0
	strh r0, [r5, 0x20]
_080B4AF8:
	ldr r4, _080B4B1C @ =gUnknown_2037F02
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
_080B4B1C: .4byte gUnknown_2037F02
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
	ldr r5, _080B4BC4 @ =gUnknown_2037F02
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
_080B4BC4: .4byte gUnknown_2037F02
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
	ldr r5, _080B4C54 @ =gUnknown_2037F1A
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
	ldr r4, _080B4C58 @ =gUnknown_2037F1B
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
_080B4C54: .4byte gUnknown_2037F1A
_080B4C58: .4byte gUnknown_2037F1B
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
	ldr r5, _080B501C @ =gUnknown_2037F02
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
_080B501C: .4byte gUnknown_2037F02
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
	ldr r0, _080B509C @ =gUnknown_2037F1A
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
_080B509C: .4byte gUnknown_2037F1A
	thumb_func_end sub_80B5074

	thumb_func_start sub_80B50A0
sub_80B50A0: @ 80B50A0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B50EC @ =gUnknown_2037F1B
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
	ldr r2, _080B50F0 @ =gUnknown_2037F02
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
_080B50EC: .4byte gUnknown_2037F1B
_080B50F0: .4byte gUnknown_2037F02
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
	ldr r1, _080B5184 @ =gUnknown_2037F02
	movs r0, 0
	strh r0, [r1, 0xE]
_080B515C:
	ldr r2, [r2]
	adds r0, r2, 0
	subs r0, 0x21
	cmp r0, 0x20
	bhi _080B516C
	ldr r1, _080B5184 @ =gUnknown_2037F02
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080B516C:
	cmp r2, 0x41
	ble _080B5176
	ldr r1, _080B5184 @ =gUnknown_2037F02
	movs r0, 0x2
	strh r0, [r1, 0xE]
_080B5176:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080B5180: .4byte gUnknown_2037EE8
_080B5184: .4byte gUnknown_2037F02
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
	ldr r4, _080B51E8 @ =gUnknown_2022982
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
_080B51E8: .4byte gUnknown_2022982
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
	ldr r0, _080B525C @ =gUnknown_2022982
	ldrh r0, [r0]
	strh r0, [r4, 0xC]
_080B5218:
	ldrh r0, [r4, 0xA]
	adds r0, 0x50
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0xA]
	ldr r6, _080B525C @ =gUnknown_2022982
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r0, 0x4
	bl Cos
	ldrh r4, [r4, 0xC]
	adds r0, r4
	strh r0, [r6]
	ldr r0, _080B5260 @ =gUnknown_2037F02
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
_080B525C: .4byte gUnknown_2022982
_080B5260: .4byte gUnknown_2037F02
_080B5264: .4byte 0x00000fff
	thumb_func_end sub_80B51EC

	thumb_func_start sub_80B5268
sub_80B5268: @ 80B5268
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B52C4 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080B52C8 @ =gUnknown_2037F1B
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
_080B52C4: .4byte gUnknown_2037F02
_080B52C8: .4byte gUnknown_2037F1B
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
	ldr r1, _080B5568 @ =gUnknown_2037F02
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
_080B5568: .4byte gUnknown_2037F02
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
	ldr r0, _080B56D8 @ =gUnknown_2037F1A
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
	ldr r2, _080B56DC @ =gUnknown_2037F02
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
_080B56D8: .4byte gUnknown_2037F1A
_080B56DC: .4byte gUnknown_2037F02
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
	ldr r4, _080B5794 @ =gUnknown_2037F1B
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
_080B5794: .4byte gUnknown_2037F1B
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
	ldr r4, _080B57E8 @ =gUnknown_2037F1B
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
_080B57E8: .4byte gUnknown_2037F1B
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
	ldr r0, _080B5948 @ =gUnknown_2037F1B
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
_080B5948: .4byte gUnknown_2037F1B
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
	ldr r0, _080B5B10 @ =gUnknown_2037F1B
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
_080B5B10: .4byte gUnknown_2037F1B
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
	ldr r0, _080B5C1C @ =gUnknown_2037F1B
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
_080B5C1C: .4byte gUnknown_2037F1B
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
	ldr r1, _080B5C60 @ =gUnknown_20371F8
	adds r0, r1
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	lsls r1, 1
	ldr r2, _080B5C64 @ =gUnknown_20375F8
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
_080B5C60: .4byte gUnknown_20371F8
_080B5C64: .4byte gUnknown_20375F8
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
	bl sub_8088230
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
	ldr r1, _080B5DC4 @ =gUnknown_825E074
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
	ldr r1, _080B5DC4 @ =gUnknown_825E074
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
_080B5DC4: .4byte gUnknown_825E074
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
	ldr r0, _080B5E00 @ =gUnknown_2037F1B
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
_080B5E00: .4byte gUnknown_2037F1B
_080B5E04:
	cmp r0, 0x2
	beq _080B5E4C
	b _080B5EB4
_080B5E0A:
	ldr r1, _080B5E28 @ =gUnknown_2039600
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
_080B5E28: .4byte gUnknown_2039600
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
	ldr r0, _080B5EFC @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B5F08
	ldr r4, _080B5F00 @ =gUnknown_2037F1A
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
	ldr r4, _080B5F04 @ =gUnknown_2037F1B
	b _080B5F2C
	.align 2, 0
_080B5EFC: .4byte gUnknown_2037F02
_080B5F00: .4byte gUnknown_2037F1A
_080B5F04: .4byte gUnknown_2037F1B
_080B5F08:
	ldr r4, _080B5FD0 @ =gUnknown_2037F1B
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
	ldr r4, _080B5FD4 @ =gUnknown_2037F1A
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
	ldr r5, _080B5FD8 @ =gUnknown_2037F02
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
_080B5FD0: .4byte gUnknown_2037F1B
_080B5FD4: .4byte gUnknown_2037F1A
_080B5FD8: .4byte gUnknown_2037F02
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
	ldr r2, _080B6174 @ =gUnknown_2037F02
	ldrh r0, [r2]
	strh r0, [r1, 0x1C]
	ldr r4, _080B6178 @ =gUnknown_2037F1A
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
	ldr r0, _080B6178 @ =gUnknown_2037F1A
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
	ldr r3, _080B6174 @ =gUnknown_2037F02
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	lsls r0, r3, 16
	asrs r0, 16
	subs r0, r7
	lsls r0, 4
	ldr r2, _080B6174 @ =gUnknown_2037F02
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080B6174 @ =gUnknown_2037F02
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
_080B6174: .4byte gUnknown_2037F02
_080B6178: .4byte gUnknown_2037F1A
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
	ldr r3, _080B6230 @ =gUnknown_2037F02
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	ldr r1, [sp, 0xC]
	subs r0, r3, r1
	lsls r0, 4
	ldr r2, _080B6230 @ =gUnknown_2037F02
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080B6230 @ =gUnknown_2037F02
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
_080B6230: .4byte gUnknown_2037F02
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
	ldr r0, _080B6410 @ =gUnknown_2037F1A
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
_080B6410: .4byte gUnknown_2037F1A
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
	ldr r0, _080B663C @ =gUnknown_2037AB8
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
_080B663C: .4byte gUnknown_2037AB8
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
	ldr r0, _080B6678 @ =gUnknown_2037F1A
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
_080B6678: .4byte gUnknown_2037F1A
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
	ldr r0, _080B683C @ =gUnknown_2037F1A
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
_080B683C: .4byte gUnknown_2037F1A
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
	ldr r5, _080B6964 @ =gUnknown_2037F1A
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
_080B6964: .4byte gUnknown_2037F1A
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
	ldr r0, _080B6A1C @ =gUnknown_2037F1A
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
_080B6A1C: .4byte gUnknown_2037F1A
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
	ldr r0, _080B6C1C @ =gUnknown_2037F1A
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
_080B6C1C: .4byte gUnknown_2037F1A
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
	ldr r0, _080B6D7C @ =gUnknown_202297C
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080B6D80 @ =gUnknown_202297E
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
	ldr r1, _080B6D84 @ =gUnknown_8D24BCC
	add r2, sp, 0xC
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080B6D88 @ =gUnknown_8D24BA4
	add r1, sp, 0xC
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080B6F1E
	.align 2, 0
_080B6D7C: .4byte gUnknown_202297C
_080B6D80: .4byte gUnknown_202297E
_080B6D84: .4byte gUnknown_8D24BCC
_080B6D88: .4byte gUnknown_8D24BA4
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
	ldr r0, _080B6E00 @ =gUnknown_8E7F4AC
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
_080B6E00: .4byte gUnknown_8E7F4AC
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
	bl sub_8088230
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
	ldr r1, _080B6FBC @ =gUnknown_825E074
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
	ldr r1, _080B6FBC @ =gUnknown_825E074
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
_080B6FBC: .4byte gUnknown_825E074
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
	ldr r1, _080B701C @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
	ldrh r0, [r6, 0x16]
	ldr r3, _080B7020 @ =0x000066e0
	movs r1, 0x10
	movs r2, 0xC
	bl BlendPalette
	b _080B7148
	.align 2, 0
_080B701C: .4byte gUnknown_2039600
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
	ldr r1, _080B71A0 @ =gUnknown_2037F1A
	ldrb r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	strh r1, [r0, 0x38]
	movs r1, 0x80
	strh r1, [r0, 0x2E]
	movs r1, 0xA
	strh r1, [r0, 0x30]
	ldr r2, _080B71A4 @ =gUnknown_2037F02
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
_080B71A0: .4byte gUnknown_2037F1A
_080B71A4: .4byte gUnknown_2037F02
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
	ldr r4, _080B72A4 @ =gUnknown_2037F1A
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
	ldr r2, _080B72A8 @ =gUnknown_2037F02
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
_080B72A4: .4byte gUnknown_2037F1A
_080B72A8: .4byte gUnknown_2037F02
_080B72AC:
	ldr r1, _080B72EC @ =gUnknown_2037F02
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
_080B72EC: .4byte gUnknown_2037F02
_080B72F0: .4byte move_anim_8074EE0
_080B72F4: .4byte sub_8074E70
	thumb_func_end sub_80B725C

	thumb_func_start sub_80B72F8
sub_80B72F8: @ 80B72F8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8074FCC
	ldr r4, _080B7350 @ =gUnknown_2037F1B
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
	ldr r0, _080B7354 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B735C
	ldr r2, _080B7358 @ =gUnknown_2037F02
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
_080B7350: .4byte gUnknown_2037F1B
_080B7354: .4byte gUnknown_2037F1A
_080B7358: .4byte gUnknown_2037F02
_080B735C:
	ldr r1, _080B73A0 @ =gUnknown_2037F02
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
	ldr r0, _080B73A0 @ =gUnknown_2037F02
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
_080B73A0: .4byte gUnknown_2037F02
_080B73A4: .4byte sub_8075590
_080B73A8: .4byte move_anim_8074EE0
	thumb_func_end sub_80B72F8

	thumb_func_start sub_80B73AC
sub_80B73AC: @ 80B73AC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080B73C0 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B73C8
	ldr r4, _080B73C4 @ =gUnknown_2037F1A
	b _080B73CA
	.align 2, 0
_080B73C0: .4byte gUnknown_2037F02
_080B73C4: .4byte gUnknown_2037F1A
_080B73C8:
	ldr r4, _080B740C @ =gUnknown_2037F1B
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
	ldr r4, _080B7410 @ =gUnknown_2037F02
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
_080B740C: .4byte gUnknown_2037F1B
_080B7410: .4byte gUnknown_2037F02
_080B7414: .4byte sub_8074F6C
_080B7418: .4byte move_anim_8074EE0
	thumb_func_end sub_80B73AC

	thumb_func_start sub_80B741C
sub_80B741C: @ 80B741C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B7444 @ =gUnknown_2037F1A
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
_080B7444: .4byte gUnknown_2037F1A
	thumb_func_end sub_80B741C

	thumb_func_start sub_80B7448
sub_80B7448: @ 80B7448
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r4, _080B749C @ =gUnknown_2037F1A
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
	ldr r0, _080B74A0 @ =gUnknown_2037F02
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
_080B749C: .4byte gUnknown_2037F1A
_080B74A0: .4byte gUnknown_2037F02
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
	ldr r0, _080B7610 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B761C
	ldr r0, _080B7614 @ =0x04000014
	str r0, [sp]
	ldr r0, _080B7618 @ =gUnknown_2022978
	b _080B7622
	.align 2, 0
_080B760C: .4byte gTasks
_080B7610: .4byte gUnknown_2037F1A
_080B7614: .4byte 0x04000014
_080B7618: .4byte gUnknown_2022978
_080B761C:
	ldr r0, _080B7698 @ =0x04000018
	str r0, [sp]
	ldr r0, _080B769C @ =gUnknown_202297C
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
	ldr r0, _080B76A4 @ =gUnknown_2037F1A
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
	ldr r5, _080B76A8 @ =gUnknown_2038700
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
	bl sub_8087EE4
	ldr r0, _080B76AC @ =sub_80B76B0
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7698: .4byte 0x04000018
_080B769C: .4byte gUnknown_202297C
_080B76A0: .4byte 0xa2600001
_080B76A4: .4byte gUnknown_2037F1A
_080B76A8: .4byte gUnknown_2038700
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
	ldr r1, _080B775C @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080B7766
	.align 2, 0
_080B775C: .4byte gUnknown_2039600
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
	ldr r7, _080B77D8 @ =gUnknown_2038700
	mov r12, r7
	ldr r0, _080B77DC @ =gUnknown_825E074
	mov r8, r0
	ldr r6, _080B77E0 @ =gUnknown_2039600
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
_080B77D8: .4byte gUnknown_2038700
_080B77DC: .4byte gUnknown_825E074
_080B77E0: .4byte gUnknown_2039600
	thumb_func_end sub_80B776C

	thumb_func_start sub_80B77E4
sub_80B77E4: @ 80B77E4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	ldr r5, _080B7884 @ =gUnknown_2037F02
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	movs r1, 0x5
	bl __divsi3
	adds r6, r0, 0
	ldr r1, _080B7888 @ =gUnknown_2037F1A
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
_080B7884: .4byte gUnknown_2037F02
_080B7888: .4byte gUnknown_2037F1A
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
	ldr r1, _080B7920 @ =gUnknown_2037F02
	ldrh r1, [r1]
	strh r1, [r0, 0x8]
	ldr r1, _080B7924 @ =gUnknown_2037F1A
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
_080B7920: .4byte gUnknown_2037F02
_080B7924: .4byte gUnknown_2037F1A
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
	ldr r0, _080B79CC @ =gUnknown_2037F1A
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
_080B79CC: .4byte gUnknown_2037F1A
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
	ldr r0, _080B7A0C @ =gUnknown_2037F02
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
_080B7A0C: .4byte gUnknown_2037F02
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
	ldr r0, _080B7AAC @ =gUnknown_2037F1A
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
_080B7AAC: .4byte gUnknown_2037F1A
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
	ldr r6, _080B7B38 @ =gUnknown_2037F1B
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldr r5, _080B7B3C @ =gUnknown_2037F1A
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
_080B7B38: .4byte gUnknown_2037F1B
_080B7B3C: .4byte gUnknown_2037F1A
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
	ldr r5, _080B7C08 @ =gUnknown_2037F02
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
_080B7C08: .4byte gUnknown_2037F02
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
	ldr r0, _080B7C9C @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080B7CA4
	ldr r0, _080B7CA0 @ =gUnknown_2037F1A
	b _080B7CA6
	.align 2, 0
_080B7C9C: .4byte gUnknown_2037F02
_080B7CA0: .4byte gUnknown_2037F1A
_080B7CA4:
	ldr r0, _080B7CD4 @ =gUnknown_2037F1B
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
_080B7CD4: .4byte gUnknown_2037F1B
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
	ldr r4, _080B7E0C @ =gUnknown_2037F1A
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
_080B7E0C: .4byte gUnknown_2037F1A
_080B7E10: .4byte 0x0000fff4
_080B7E14:
	ldr r0, _080B7E60 @ =0x0000ffc0
_080B7E16:
	strh r0, [r5, 0x18]
	ldr r0, _080B7E64 @ =gUnknown_2037F1A
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
	ldr r0, _080B7E68 @ =gUnknown_202297A
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
	ldr r1, _080B7E74 @ =gUnknown_202297C
	b _080B7EA2
	.align 2, 0
_080B7E60: .4byte 0x0000ffc0
_080B7E64: .4byte gUnknown_2037F1A
_080B7E68: .4byte gUnknown_202297A
_080B7E6C: .4byte 0x00003f42
_080B7E70: .4byte 0x04000016
_080B7E74: .4byte gUnknown_202297C
_080B7E78:
	ldr r0, _080B7F30 @ =gUnknown_202297E
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
	ldr r1, _080B7F3C @ =gUnknown_2022978
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
	ldr r4, _080B7F44 @ =gUnknown_2038700
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
	bl sub_8087EE4
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
_080B7F30: .4byte gUnknown_202297E
_080B7F34: .4byte 0x00003f44
_080B7F38: .4byte 0x0400001a
_080B7F3C: .4byte gUnknown_2022978
_080B7F40: .4byte 0xa2600001
_080B7F44: .4byte gUnknown_2038700
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
	ldr r1, _080B8060 @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B8056:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B806A
	.align 2, 0
_080B8060: .4byte gUnknown_2039600
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
	ldr r0, _080B8110 @ =gUnknown_2037F1B
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
	ldr r1, _080B8118 @ =gUnknown_202297C
	b _080B8126
	.align 2, 0
_080B8110: .4byte gUnknown_2037F1B
_080B8114: .4byte 0x00003f42
_080B8118: .4byte gUnknown_202297C
_080B811C:
	ldr r1, _080B8130 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080B8134 @ =gUnknown_2022978
_080B8126:
	ldrh r0, [r1]
	adds r0, 0xF0
	strh r0, [r1]
	b _080B823C
	.align 2, 0
_080B8130: .4byte 0x00003f44
_080B8134: .4byte gUnknown_2022978
_080B8138:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080B8160
	mov r0, sp
	bl sub_80752A0
	ldr r0, _080B815C @ =gUnknown_202297A
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
_080B815C: .4byte gUnknown_202297A
_080B8160:
	ldr r0, _080B8178 @ =gUnknown_202297E
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
_080B8178: .4byte gUnknown_202297E
_080B817C:
	ldr r4, _080B81C8 @ =gUnknown_2037F1B
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
_080B81C8: .4byte gUnknown_2037F1B
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
	ldr r6, _080B8248 @ =gUnknown_2038700
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
	bl sub_8087EE4
_080B823C:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080B829E
	.align 2, 0
_080B8244: .4byte 0x0400001a
_080B8248: .4byte gUnknown_2038700
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
	ldr r1, _080B8404 @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B83FC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B842A
	.align 2, 0
_080B8404: .4byte gUnknown_2039600
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
	ldr r0, _080B8528 @ =gUnknown_2038700
	mov r12, r0
	ldr r7, _080B852C @ =gUnknown_2039600
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
	ldr r0, _080B8528 @ =gUnknown_2038700
	mov r12, r0
	ldr r7, _080B852C @ =gUnknown_2039600
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
	ldr r7, _080B8528 @ =gUnknown_2038700
	ldr r4, _080B852C @ =gUnknown_2039600
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
_080B8528: .4byte gUnknown_2038700
_080B852C: .4byte gUnknown_2039600
_080B8530:
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	adds r5, r0, 0
	adds r5, 0x9F
	movs r4, 0
	ldr r3, _080B8568 @ =gUnknown_2038700
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
_080B8568: .4byte gUnknown_2038700
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
	ldr r6, _080B8658 @ =gUnknown_2037F1A
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
_080B8658: .4byte gUnknown_2037F1A
_080B865C: .4byte gSprites
_080B8660: .4byte gUnknown_2023D44
	thumb_func_end sub_80B85B8

	thumb_func_start sub_80B8664
sub_80B8664: @ 80B8664
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _080B86AC @ =gUnknown_2037F1A
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
_080B86AC: .4byte gUnknown_2037F1A
	thumb_func_end sub_80B8664

	thumb_func_start sub_80B86B0
sub_80B86B0: @ 80B86B0
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080B86E0 @ =gUnknown_2037F02
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
_080B86E0: .4byte gUnknown_2037F02
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
	ldr r4, _080B8804 @ =gUnknown_2037F1A
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
	ldr r4, _080B8804 @ =gUnknown_2037F1A
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
_080B8804: .4byte gUnknown_2037F1A
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
	ldr r0, _080B88C0 @ =gUnknown_2037F1A
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
	ldr r1, _080B88C4 @ =gUnknown_8D1D388
	bl sub_807543C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080B88C8 @ =gUnknown_8D1D224
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080B88CC @ =gUnknown_8D1D360
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r2, _080B88D0 @ =gUnknown_2022978
	ldr r0, _080B88D4 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x60
	strh r0, [r2]
	ldr r2, _080B88D8 @ =gUnknown_202297A
	ldrh r0, [r1, 0x22]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	adds r1, r0, 0
	ldr r2, _080B88DC @ =gUnknown_2037F02
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
_080B88C0: .4byte gUnknown_2037F1A
_080B88C4: .4byte gUnknown_8D1D388
_080B88C8: .4byte gUnknown_8D1D224
_080B88CC: .4byte gUnknown_8D1D360
_080B88D0: .4byte gUnknown_2022978
_080B88D4: .4byte gSprites
_080B88D8: .4byte gUnknown_202297A
_080B88DC: .4byte gUnknown_2037F02
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
	ldr r2, _080B8918 @ =gUnknown_2037F02
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
_080B8918: .4byte gUnknown_2037F02
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
	ldr r2, _080B89EC @ =gUnknown_2022978
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
	ldr r0, _080B89F8 @ =gUnknown_2037F1A
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
_080B89EC: .4byte gUnknown_2022978
_080B89F0: .4byte gSprites
_080B89F4: .4byte gUnknown_2023D44
_080B89F8: .4byte gUnknown_2037F1A
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
	ldr r0, _080B8A94 @ =gUnknown_2037F02
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
_080B8A94: .4byte gUnknown_2037F02
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
	ldr r1, _080B8B34 @ =gUnknown_2037F02
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
_080B8B34: .4byte gUnknown_2037F02
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
	ldr r1, _080B8B68 @ =gUnknown_2037F02
	movs r0, 0
	strh r0, [r1, 0xE]
_080B8B4C:
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _080B8B58
	ldr r1, _080B8B68 @ =gUnknown_2037F02
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080B8B58:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080B8B64: .4byte gUnknown_2037F16
_080B8B68: .4byte gUnknown_2037F02
	thumb_func_end sub_80B8B38

	thumb_func_start sub_80B8B6C
sub_80B8B6C: @ 80B8B6C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B8BC4 @ =gUnknown_2037F1A
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
	ldr r5, _080B8BC8 @ =gUnknown_2037F1B
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
_080B8BC4: .4byte gUnknown_2037F1A
_080B8BC8: .4byte gUnknown_2037F1B
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
	ldr r4, _080B8C30 @ =gUnknown_2037F1A
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
_080B8C30: .4byte gUnknown_2037F1A
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
	ldr r0, _080B8CB4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B8C74
	ldr r1, _080B8CB8 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B8C74:
	ldr r4, _080B8CB8 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080B8CBC @ =gUnknown_2037F1B
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
_080B8CB4: .4byte gUnknown_2037F1A
_080B8CB8: .4byte gUnknown_2037F02
_080B8CBC: .4byte gUnknown_2037F1B
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
	ldr r4, _080B8D48 @ =gUnknown_2037F1B
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
	ldr r0, _080B8D4C @ =gUnknown_2037F02
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
_080B8D48: .4byte gUnknown_2037F1B
_080B8D4C: .4byte gUnknown_2037F02
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
	ldr r6, _080B8DC0 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080B8DCC
	ldr r4, _080B8DC4 @ =gUnknown_2037F1A
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
_080B8DC0: .4byte gUnknown_2037F02
_080B8DC4: .4byte gUnknown_2037F1A
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
	ldr r0, _080B8EB8 @ =gUnknown_2037F02
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080B8EC0
	ldr r0, _080B8EBC @ =sub_80B8ED4
	b _080B8EC2
	.align 2, 0
_080B8EB4: .4byte gTasks
_080B8EB8: .4byte gUnknown_2037F02
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
	ldr r0, _080B8F3C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080B8F48
	ldr r0, _080B8F40 @ =gUnknown_2022978
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080B8F44 @ =gUnknown_202297A
	b _080B8F50
	.align 2, 0
_080B8F3C: .4byte gUnknown_2037F1A
_080B8F40: .4byte gUnknown_2022978
_080B8F44: .4byte gUnknown_202297A
_080B8F48:
	ldr r0, _080B8F8C @ =gUnknown_202297C
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080B8F90 @ =gUnknown_202297E
_080B8F50:
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080B8F94 @ =gUnknown_2037F1A
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
_080B8F8C: .4byte gUnknown_202297C
_080B8F90: .4byte gUnknown_202297E
_080B8F94: .4byte gUnknown_2037F1A
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
	ldr r1, _080B8FF0 @ =gUnknown_825E074
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
	ldr r1, _080B8FF4 @ =gUnknown_202297A
	b _080B8FFA
	.align 2, 0
_080B8FF0: .4byte gUnknown_825E074
_080B8FF4: .4byte gUnknown_202297A
_080B8FF8:
	ldr r1, _080B901C @ =gUnknown_202297E
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
	ldr r1, _080B9020 @ =gUnknown_202297A
	b _080B9026
	.align 2, 0
_080B901C: .4byte gUnknown_202297E
_080B9020: .4byte gUnknown_202297A
_080B9024:
	ldr r1, _080B9048 @ =gUnknown_202297E
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
_080B9048: .4byte gUnknown_202297E
_080B904C: .4byte gSprites
_080B9050:
	ldr r1, _080B9060 @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B9056:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B9082
	.align 2, 0
_080B9060: .4byte gUnknown_2039600
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
	ldr r0, _080B90D0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B90D8
	ldr r0, _080B90D4 @ =gUnknown_202297A
	b _080B90DA
	.align 2, 0
_080B90CC: .4byte gSprites
_080B90D0: .4byte gUnknown_2037F1A
_080B90D4: .4byte gUnknown_202297A
_080B90D8:
	ldr r0, _080B90E8 @ =gUnknown_202297E
_080B90DA:
	strh r4, [r0]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B90E8: .4byte gUnknown_202297E
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
	ldr r0, _080B9110 @ =gUnknown_2037F02
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080B9118
	ldr r0, _080B9114 @ =sub_80B912C
	b _080B911A
	.align 2, 0
_080B910C: .4byte gTasks
_080B9110: .4byte gUnknown_2037F02
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
	ldr r0, _080B9214 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080B921C
	ldr r0, _080B9218 @ =gUnknown_2022978
	b _080B921E
	.align 2, 0
_080B9214: .4byte gUnknown_2037F1A
_080B9218: .4byte gUnknown_2022978
_080B921C:
	ldr r0, _080B923C @ =gUnknown_202297C
_080B921E:
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080B9240 @ =gUnknown_2037F1A
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
_080B923C: .4byte gUnknown_202297C
_080B9240: .4byte gUnknown_2037F1A
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
	ldr r1, _080B92A8 @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B929A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B92B2
	.align 2, 0
_080B92A4: .4byte gSprites
_080B92A8: .4byte gUnknown_2039600
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
	ldr r0, _080B92D4 @ =gUnknown_2022978
	ldrh r3, [r0]
	ldr r0, _080B92D8 @ =0x04000014
	b _080B92E2
	.align 2, 0
_080B92D4: .4byte gUnknown_2022978
_080B92D8: .4byte 0x04000014
_080B92DC:
	ldr r0, _080B9368 @ =gUnknown_202297C
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
	ldr r5, _080B9370 @ =gUnknown_2038700
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
	ldr r4, _080B9370 @ =gUnknown_2038700
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
	bl sub_8087EE4
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9368: .4byte gUnknown_202297C
_080B936C: .4byte 0x04000018
_080B9370: .4byte gUnknown_2038700
_080B9374: .4byte 0xa2600001
	thumb_func_end sub_80B92B8

	thumb_func_start sub_80B9378
sub_80B9378: @ 80B9378
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080B938C @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r7, r0, 0
	cmp r1, 0
	bne _080B9394
	ldr r0, _080B9390 @ =gUnknown_2037F1A
	b _080B9396
	.align 2, 0
_080B938C: .4byte gUnknown_2037F02
_080B9390: .4byte gUnknown_2037F1A
_080B9394:
	ldr r0, _080B93F8 @ =gUnknown_2037F1B
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
_080B93F8: .4byte gUnknown_2037F1B
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
	ldr r0, _080B9430 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B9438
	ldr r0, _080B9434 @ =gUnknown_2037F1A
	b _080B943A
	.align 2, 0
_080B9430: .4byte gUnknown_2037F02
_080B9434: .4byte gUnknown_2037F1A
_080B9438:
	ldr r0, _080B9498 @ =gUnknown_2037F1B
_080B943A:
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B949C @ =0x0000fff0
	adds r0, r2
	ldr r4, _080B94A0 @ =gUnknown_2037F02
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
_080B9498: .4byte gUnknown_2037F1B
_080B949C: .4byte 0x0000fff0
_080B94A0: .4byte gUnknown_2037F02
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
	ldr r0, _080B94DC @ =gUnknown_2037F02
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
_080B94DC: .4byte gUnknown_2037F02
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
	ldr r0, _080B9510 @ =gUnknown_2022980
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080B9514 @ =sub_80B9584
	b _080B9576
	.align 2, 0
_080B950C: .4byte gUnknown_2037EEC
_080B9510: .4byte gUnknown_2022980
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
	ldr r1, _080B95D8 @ =gUnknown_2022980
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080B95E6
	.align 2, 0
_080B95D8: .4byte gUnknown_2022980
_080B95DC:
	ldr r0, _080B9604 @ =gUnknown_2022980
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
_080B9604: .4byte gUnknown_2022980
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
	ldr r1, _080B9630 @ =gUnknown_2022980
	ldrh r0, [r3, 0x24]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080B963E
	.align 2, 0
_080B9630: .4byte gUnknown_2022980
_080B9634:
	ldr r0, _080B9664 @ =gUnknown_2022980
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
_080B9664: .4byte gUnknown_2022980
_080B9668:
	ldr r1, _080B9678 @ =gUnknown_2022980
	ldrh r0, [r3, 0x22]
	strh r0, [r1]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B9674:
	pop {r0}
	bx r0
	.align 2, 0
_080B9678: .4byte gUnknown_2022980
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
	ldr r3, _080B97F8 @ =gUnknown_2037F02
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
_080B97F8: .4byte gUnknown_2037F02
_080B97FC: .4byte gUnknown_2037EEC
	thumb_func_end sub_80B97D8

	thumb_func_start sub_80B9800
sub_80B9800: @ 80B9800
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _080B9818 @ =gUnknown_2037F02
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _080B9820
	ldr r0, _080B981C @ =gUnknown_2037F1B
	b _080B9822
	.align 2, 0
_080B9818: .4byte gUnknown_2037F02
_080B981C: .4byte gUnknown_2037F1B
_080B9820:
	ldr r0, _080B9890 @ =gUnknown_2037F1A
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
	ldr r2, _080B98A0 @ =gUnknown_2022980
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	ldr r0, _080B98A4 @ =gUnknown_2022982
	strh r1, [r0]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0xE]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9890: .4byte gUnknown_2037F1A
_080B9894: .4byte sub_80B98A8
_080B9898: .4byte gTasks
_080B989C: .4byte 0x000001ff
_080B98A0: .4byte gUnknown_2022980
_080B98A4: .4byte gUnknown_2022982
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
	ldr r0, _080B98DC @ =gUnknown_2037F02
	movs r4, 0xE
	ldrsh r1, [r0, r4]
	movs r4, 0xE
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _080B98E8
	ldr r0, _080B98E0 @ =gUnknown_2022980
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B98E4 @ =gUnknown_2022982
	strh r1, [r0]
	adds r0, r3, 0
	bl DestroyTask
	b _080B98F4
	.align 2, 0
_080B98D8: .4byte gTasks
_080B98DC: .4byte gUnknown_2037F02
_080B98E0: .4byte gUnknown_2022980
_080B98E4: .4byte gUnknown_2022982
_080B98E8:
	ldr r1, _080B98FC @ =gUnknown_2022980
	ldrh r0, [r2, 0xA]
	strh r0, [r1]
	ldr r1, _080B9900 @ =gUnknown_2022982
	ldrh r0, [r2, 0xC]
	strh r0, [r1]
_080B98F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B98FC: .4byte gUnknown_2022980
_080B9900: .4byte gUnknown_2022982
	thumb_func_end sub_80B98A8

	thumb_func_start sub_80B9904
sub_80B9904: @ 80B9904
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B993C @ =gUnknown_2037F02
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
	ldr r0, _080B9940 @ =gUnknown_2037F1A
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
_080B993C: .4byte gUnknown_2037F02
_080B9940: .4byte gUnknown_2037F1A
_080B9944:
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x36]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080B9952:
	ldr r0, _080B9968 @ =gUnknown_2037F02
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
_080B9968: .4byte gUnknown_2037F02
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
	ldr r4, _080B9A0C @ =gUnknown_2037F02
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
_080B9A0C: .4byte gUnknown_2037F02
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
	ldr r0, _080B9A78 @ =gUnknown_2037AB8
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
_080B9A78: .4byte gUnknown_2037AB8
	thumb_func_end sub_80B9A5C

	thumb_func_start sub_80B9A7C
sub_80B9A7C: @ 80B9A7C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B9AC8 @ =gUnknown_2037F02
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
_080B9AC8: .4byte gUnknown_2037F02
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
	ldr r0, _080B9B00 @ =gUnknown_2037AB8
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
_080B9B00: .4byte gUnknown_2037AB8
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
	ldr r0, _080B9B88 @ =gUnknown_2037AB8
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
_080B9B88: .4byte gUnknown_2037AB8
	thumb_func_end sub_80B9B5C

	thumb_func_start sub_80B9B8C
sub_80B9B8C: @ 80B9B8C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080B9BD0 @ =gUnknown_2037F02
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
_080B9BD0: .4byte gUnknown_2037F02
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
	ldr r3, _080B9C24 @ =gUnknown_2037F02
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
_080B9C24: .4byte gUnknown_2037F02
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
	ldr r0, _080B9CB4 @ =gUnknown_2037AB8
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
_080B9CB4: .4byte gUnknown_2037AB8
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
	ldr r2, _080B9D8C @ =gUnknown_2037F02
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
	ldr r0, _080B9D94 @ =gUnknown_2037F1A
	ldrb r3, [r0]
	ldr r7, _080B9D98 @ =gUnknown_2037F1B
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
_080B9D8C: .4byte gUnknown_2037F02
_080B9D90: .4byte gBattlersCount
_080B9D94: .4byte gUnknown_2037F1A
_080B9D98: .4byte gUnknown_2037F1B
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
	ldr r0, _080B9E28 @ =gUnknown_2037AB8
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
_080B9E28: .4byte gUnknown_2037AB8
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
	ldr r3, _080B9EA0 @ =gUnknown_2037F02
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
_080B9EA0: .4byte gUnknown_2037F02
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
	ldr r0, _080B9F3C @ =gUnknown_2037AB8
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
_080B9F3C: .4byte gUnknown_2037AB8
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
	ldr r5, _080B9FD0 @ =gUnknown_2037F02
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
_080B9FD0: .4byte gUnknown_2037F02
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
	ldr r0, _080BA01C @ =gUnknown_2037AB8
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
_080BA01C: .4byte gUnknown_2037AB8
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
	ldr r0, _080BA0E0 @ =gUnknown_2037AB8
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
_080BA0E0: .4byte gUnknown_2037AB8
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
	ldr r0, _080BA160 @ =gUnknown_2037F1A
	ldrb r6, [r0]
	ldr r0, _080BA164 @ =gUnknown_2037F1B
	ldrb r7, [r0]
	ldr r4, _080BA168 @ =gUnknown_2037F02
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
_080BA160: .4byte gUnknown_2037F1A
_080BA164: .4byte gUnknown_2037F1B
_080BA168: .4byte gUnknown_2037F02
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
	ldr r1, _080BA264 @ =gUnknown_2037F02
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
	ldr r0, _080BA268 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	mov r9, r0
	ldr r0, _080BA26C @ =gUnknown_2037F1B
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
_080BA264: .4byte gUnknown_2037F02
_080BA268: .4byte gUnknown_2037F1A
_080BA26C: .4byte gUnknown_2037F1B
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
	ldr r1, _080BA2B0 @ =gUnknown_2037F02
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
_080BA2B0: .4byte gUnknown_2037F02
_080BA2B4:
	cmp r0, 0x2
	beq _080BA2CC
	b _080BA2DC
_080BA2BA:
	ldr r1, _080BA2C0 @ =gUnknown_2022980
	b _080BA2CE
	.align 2, 0
_080BA2C0: .4byte gUnknown_2022980
_080BA2C4:
	ldr r1, _080BA2C8 @ =gUnknown_2022982
	b _080BA2CE
	.align 2, 0
_080BA2C8: .4byte gUnknown_2022982
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
	ldr r0, _080BA318 @ =gUnknown_2037F02
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
_080BA318: .4byte gUnknown_2037F02
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
	ldr r5, _080BA448 @ =gUnknown_2037F1A
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
	ldr r3, _080BA44C @ =gUnknown_2037F1B
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
	ldr r0, _080BA450 @ =gUnknown_2037F02
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
_080BA448: .4byte gUnknown_2037F1A
_080BA44C: .4byte gUnknown_2037F1B
_080BA450: .4byte gUnknown_2037F02
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
	ldr r3, _080BA4C0 @ =gUnknown_2037F02
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
	ldr r4, _080BA4C4 @ =gUnknown_2022980
	ldrh r1, [r3]
	strh r1, [r4]
	ldr r4, _080BA4C8 @ =gUnknown_2022982
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
_080BA4C0: .4byte gUnknown_2037F02
_080BA4C4: .4byte gUnknown_2022980
_080BA4C8: .4byte gUnknown_2022982
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
	ldr r0, _080BA504 @ =gUnknown_2022980
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
_080BA504: .4byte gUnknown_2022980
_080BA508:
	ldrh r0, [r3, 0x8]
_080BA50A:
	strh r0, [r6]
	ldr r2, _080BA528 @ =gUnknown_2022982
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
_080BA528: .4byte gUnknown_2022982
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
	ldr r4, _080BA580 @ =gUnknown_2037F02
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
_080BA580: .4byte gUnknown_2037F02
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
	ldr r4, _080BA5C8 @ =gUnknown_2037F02
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
_080BA5C8: .4byte gUnknown_2037F02
_080BA5CC:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075114
_080BA5D4:
	ldr r0, _080BA5EC @ =gUnknown_2037F02
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
_080BA5EC: .4byte gUnknown_2037F02
_080BA5F0: .4byte sub_8074F50
_080BA5F4: .4byte sub_80B1D3C
	thumb_func_end sub_80BA5A8

	thumb_func_start sub_80BA5F8
sub_80BA5F8: @ 80BA5F8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080BA628 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080BA61C
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080BA61C
	ldr r1, _080BA62C @ =gUnknown_2037F02
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
_080BA628: .4byte gUnknown_2037F1A
_080BA62C: .4byte gUnknown_2037F02
	thumb_func_end sub_80BA5F8

	thumb_func_start sub_80BA630
sub_80BA630: @ 80BA630
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080BA668 @ =gUnknown_2037F02
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
_080BA668: .4byte gUnknown_2037F02
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
	ldr r5, _080BA728 @ =gUnknown_2037F02
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
_080BA728: .4byte gUnknown_2037F02
_080BA72C: .4byte gSprites
_080BA730: .4byte move_anim_8074EE0
_080BA734: .4byte sub_8074F50
	thumb_func_end sub_80BA6C8

	thumb_func_start sub_80BA738
sub_80BA738: @ 80BA738
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080BA750 @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080BA754
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075160
	b _080BA75C
	.align 2, 0
_080BA750: .4byte gUnknown_2037F02
_080BA754:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
_080BA75C:
	ldr r0, _080BA774 @ =gUnknown_2037F02
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
_080BA774: .4byte gUnknown_2037F02
_080BA778: .4byte DestroyAnimSprite
_080BA77C: .4byte sub_8074C44
	thumb_func_end sub_80BA738

	thumb_func_start sub_80BA780
sub_80BA780: @ 80BA780
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080BA7A0 @ =gUnknown_2037F02
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
_080BA7A0: .4byte gUnknown_2037F02
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
	ldr r4, _080BA838 @ =gUnknown_2037F02
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
_080BA838: .4byte gUnknown_2037F02
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
	ldr r0, _080BA868 @ =gUnknown_2037F02
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
_080BA868: .4byte gUnknown_2037F02
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
	ldr r1, _080BA898 @ =gUnknown_2037F1A
	b _080BA8A2
	.align 2, 0
_080BA898: .4byte gUnknown_2037F1A
_080BA89C:
	movs r5, 0
_080BA89E:
	mov r0, sp
	ldr r1, _080BA8A8 @ =gUnknown_2037F1B
_080BA8A2:
	ldrb r1, [r1]
	strb r1, [r0]
	b _080BA8E6
	.align 2, 0
_080BA8A8: .4byte gUnknown_2037F1B
_080BA8AC:
	mov r1, sp
	ldr r0, _080BA8BC @ =gUnknown_2037F1A
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080BA8C0 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	strb r0, [r1, 0x1]
	b _080BA8E6
	.align 2, 0
_080BA8BC: .4byte gUnknown_2037F1A
_080BA8C0: .4byte gUnknown_2037F1B
_080BA8C4:
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	b _080BA8E6
_080BA8CC:
	movs r5, 0
	mov r2, sp
	ldr r0, _080BA8D4 @ =gUnknown_2037F1A
	b _080BA8DE
	.align 2, 0
_080BA8D4: .4byte gUnknown_2037F1A
_080BA8D8:
	movs r5, 0
	mov r2, sp
	ldr r0, _080BA930 @ =gUnknown_2037F1B
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
_080BA930: .4byte gUnknown_2037F1B
	thumb_func_end sub_80BA83C

	thumb_func_start sub_80BA934
sub_80BA934: @ 80BA934
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BA958 @ =gUnknown_2037F02
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
_080BA958: .4byte gUnknown_2037F02
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
	ldr r1, _080BA994 @ =gUnknown_2037F02
	ldr r0, _080BA998 @ =0x00000b0c
	b _080BAA08
	.align 2, 0
_080BA994: .4byte gUnknown_2037F02
_080BA998: .4byte 0x00000b0c
_080BA99C:
	ldr r1, _080BA9A4 @ =gUnknown_2037F02
	movs r0, 0x9E
	lsls r0, 4
	b _080BAA08
	.align 2, 0
_080BA9A4: .4byte gUnknown_2037F02
_080BA9A8:
	ldr r1, _080BA9B0 @ =gUnknown_2037F02
	ldr r0, _080BA9B4 @ =0x00002f1e
	b _080BAA08
	.align 2, 0
_080BA9B0: .4byte gUnknown_2037F02
_080BA9B4: .4byte 0x00002f1e
_080BA9B8:
	ldr r1, _080BA9C0 @ =gUnknown_2037F02
	movs r0, 0x90
	lsls r0, 7
	b _080BAA08
	.align 2, 0
_080BA9C0: .4byte gUnknown_2037F02
_080BA9C4:
	ldr r1, _080BA9CC @ =gUnknown_2037F02
	ldr r0, _080BA9D0 @ =0x00007ecb
	b _080BAA08
	.align 2, 0
_080BA9CC: .4byte gUnknown_2037F02
_080BA9D0: .4byte 0x00007ecb
_080BA9D4:
	ldr r1, _080BA9DC @ =gUnknown_2037F02
	ldr r0, _080BA9E0 @ =0x00007ecb
	b _080BAA08
	.align 2, 0
_080BA9DC: .4byte gUnknown_2037F02
_080BA9E0: .4byte 0x00007ecb
_080BA9E4:
	ldr r1, _080BA9EC @ =gUnknown_2037F02
	ldr r0, _080BA9F0 @ =0x00002a16
	b _080BAA08
	.align 2, 0
_080BA9EC: .4byte gUnknown_2037F02
_080BA9F0: .4byte 0x00002a16
_080BA9F4:
	ldr r1, _080BA9FC @ =gUnknown_2037F02
	ldr r0, _080BAA00 @ =0x00000d2e
	b _080BAA08
	.align 2, 0
_080BA9FC: .4byte gUnknown_2037F02
_080BAA00: .4byte 0x00000d2e
_080BAA04:
	ldr r1, _080BAA18 @ =gUnknown_2037F02
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
_080BAA18: .4byte gUnknown_2037F02
_080BAA1C: .4byte 0x00007fff
	thumb_func_end sub_80BA934

	thumb_func_start sub_80BAA20
sub_80BAA20: @ 80BAA20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080BAA48 @ =gUnknown_2037F02
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
_080BAA48: .4byte gUnknown_2037F02
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
	ldr r3, _080BAA88 @ =gUnknown_2037F02
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
_080BAA88: .4byte gUnknown_2037F02
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
	ldr r4, _080BAB6C @ =gUnknown_2037F02
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
_080BAB6C: .4byte gUnknown_2037F02
_080BAB70: .4byte gTasks
_080BAB74: .4byte sub_80BAB78
	thumb_func_end sub_80BAB38

	thumb_func_start sub_80BAB78
sub_80BAB78: @ 80BAB78
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BAB94 @ =gUnknown_2037AB8
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
_080BAB94: .4byte gUnknown_2037AB8
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
	ldr r2, _080BABC8 @ =gUnknown_2037F02
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
_080BABC8: .4byte gUnknown_2037F02
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
	ldr r5, _080BAE38 @ =gUnknown_2037F1A
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
	ldr r4, _080BAE38 @ =gUnknown_2037F1A
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
_080BAE38: .4byte gUnknown_2037F1A
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
	ldr r0, _080BAF14 @ =gUnknown_2037F1A
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
	ldr r1, _080BAF18 @ =gUnknown_8D20858
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
	ldr r1, _080BAF1C @ =gUnknown_8D2083C
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
	ldr r2, _080BAF24 @ =gUnknown_2022978
	ldr r0, _080BAF28 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r2, _080BAF2C @ =gUnknown_202297A
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
_080BAF14: .4byte gUnknown_2037F1A
_080BAF18: .4byte gUnknown_8D20858
_080BAF1C: .4byte gUnknown_8D2083C
_080BAF20: .4byte gUnknown_83E7CC8
_080BAF24: .4byte gUnknown_2022978
_080BAF28: .4byte gSprites
_080BAF2C: .4byte gUnknown_202297A
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
	ldr r7, _080BB06C @ =gUnknown_202297A
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
	ldr r0, _080BB084 @ =gUnknown_2037F1A
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
_080BB06C: .4byte gUnknown_202297A
_080BB070: .4byte gUnknown_2022984
_080BB074: .4byte gUnknown_2022986
_080BB078: .4byte 0x00003f3f
_080BB07C: .4byte gSprites
_080BB080: .4byte gUnknown_2023D44
_080BB084: .4byte gUnknown_2037F1A
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
	ldr r3, _080BB0CC @ =gUnknown_2037F02
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
_080BB0CC: .4byte gUnknown_2037F02
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
	ldr r0, _080BB0F4 @ =gUnknown_2037F1A
	b _080BB0FA
	.align 2, 0
_080BB0F0: .4byte gUnknown_20399B4
_080BB0F4: .4byte gUnknown_2037F1A
_080BB0F8:
	ldr r0, _080BB230 @ =gUnknown_2037F1B
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
_080BB230: .4byte gUnknown_2037F1B
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
	ldr r1, _080BB308 @ =gUnknown_8D2DB04
	bl sub_807543C
	b _080BB316
	.align 2, 0
_080BB300: .4byte gUnknown_2023D44
_080BB304: .4byte gUnknown_20399B4
_080BB308: .4byte gUnknown_8D2DB04
_080BB30C:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080BB354 @ =gUnknown_8D2DC20
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
	ldr r1, _080BB358 @ =gUnknown_8D2D8F4
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
_080BB354: .4byte gUnknown_8D2DC20
_080BB358: .4byte gUnknown_8D2D8F4
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
	ldr r0, _080BB384 @ =gUnknown_8D2DD5C
	b _080BB3B2
	.align 2, 0
_080BB384: .4byte gUnknown_8D2DD5C
_080BB388:
	ldr r0, _080BB38C @ =gUnknown_8D2DD3C
	b _080BB3B2
	.align 2, 0
_080BB38C: .4byte gUnknown_8D2DD3C
_080BB390:
	ldr r0, _080BB394 @ =gUnknown_8D2DD7C
	b _080BB3B2
	.align 2, 0
_080BB394: .4byte gUnknown_8D2DD7C
_080BB398:
	ldr r0, _080BB39C @ =gUnknown_8D2DD9C
	b _080BB3B2
	.align 2, 0
_080BB39C: .4byte gUnknown_8D2DD9C
_080BB3A0:
	ldr r0, _080BB3A4 @ =gUnknown_8D2DDDC
	b _080BB3B2
	.align 2, 0
_080BB3A4: .4byte gUnknown_8D2DDDC
_080BB3A8:
	ldr r0, _080BB3AC @ =gUnknown_8D2DDFC
	b _080BB3B2
	.align 2, 0
_080BB3AC: .4byte gUnknown_8D2DDFC
_080BB3B0:
	ldr r0, _080BB3C0 @ =gUnknown_8D2DE1C
_080BB3B2:
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080BB3D2
	.align 2, 0
_080BB3C0: .4byte gUnknown_8D2DE1C
_080BB3C4:
	ldr r0, _080BB3FC @ =gUnknown_8D2DDBC
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
_080BB3D2:
	ldr r3, _080BB400 @ =gUnknown_2022978
	movs r2, 0
	strh r2, [r3]
	ldr r0, _080BB404 @ =gUnknown_202297A
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
_080BB3FC: .4byte gUnknown_8D2DDBC
_080BB400: .4byte gUnknown_2022978
_080BB404: .4byte gUnknown_202297A
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
	ldr r2, _080BB4E4 @ =gUnknown_202297A
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
_080BB4E4: .4byte gUnknown_202297A
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
	ldr r1, _080BB7D8 @ =gUnknown_20375F8
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
_080BB7D8: .4byte gUnknown_20375F8
	thumb_func_end sub_80BB790

	thumb_func_start sub_80BB7DC
sub_80BB7DC: @ 80BB7DC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	movs r2, 0
	ldr r0, _080BB824 @ =gUnknown_2037F1A
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
	ldr r0, _080BB828 @ =gUnknown_2037F02
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
_080BB824: .4byte gUnknown_2037F1A
_080BB828: .4byte gUnknown_2037F02
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
	ldr r4, _080BB898 @ =gUnknown_2037F02
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080BB868
	ldr r0, _080BB89C @ =gUnknown_2037F1A
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
	ldr r2, _080BB898 @ =gUnknown_2037F02
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
_080BB898: .4byte gUnknown_2037F02
_080BB89C: .4byte gUnknown_2037F1A
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
	ldr r6, _080BB914 @ =gUnknown_2022980
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r4, [r6]
	adds r0, r4
	strh r0, [r6]
	ldr r4, _080BB918 @ =gUnknown_2022982
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
	ldr r0, _080BB91C @ =gUnknown_2037F02
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
_080BB914: .4byte gUnknown_2022980
_080BB918: .4byte gUnknown_2022982
_080BB91C: .4byte gUnknown_2037F02
	thumb_func_end sub_80BB8A4

	thumb_func_start sub_80BB920
sub_80BB920: @ 80BB920
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080BB944 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	ldr r1, _080BB948 @ =gUnknown_2037F02
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB944: .4byte gUnknown_2037F1A
_080BB948: .4byte gUnknown_2037F02
	thumb_func_end sub_80BB920

	thumb_func_start sub_80BB94C
sub_80BB94C: @ 80BB94C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080BB970 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	ldr r1, _080BB974 @ =gUnknown_2037F02
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB970: .4byte gUnknown_2037F1B
_080BB974: .4byte gUnknown_2037F02
	thumb_func_end sub_80BB94C

	thumb_func_start sub_80BB978
sub_80BB978: @ 80BB978
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r5, _080BB9A4 @ =gUnknown_2037F02
	movs r4, 0
	ldr r0, _080BB9A8 @ =gUnknown_2037F1A
	ldrb r2, [r0]
	movs r0, 0x2
	ldr r1, _080BB9AC @ =gUnknown_2037F1B
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
_080BB9A4: .4byte gUnknown_2037F02
_080BB9A8: .4byte gUnknown_2037F1A
_080BB9AC: .4byte gUnknown_2037F1B
	thumb_func_end sub_80BB978

	thumb_func_start sub_80BB9B0
sub_80BB9B0: @ 80BB9B0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080BBA10 @ =gSprites
_080BB9BA:
	ldr r0, _080BBA14 @ =gUnknown_2037F1A
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
	ldr r1, _080BBA1C @ =gUnknown_2037F02
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
_080BBA14: .4byte gUnknown_2037F1A
_080BBA18: .4byte gUnknown_2023D44
_080BBA1C: .4byte gUnknown_2037F02
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
	ldr r0, _080BBC1C @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BBC20 @ =gUnknown_202297A
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
_080BBC1C: .4byte gUnknown_2022978
_080BBC20: .4byte gUnknown_202297A
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
	ldr r2, _080BBC6C @ =gUnknown_202297A
	lsls r1, r4, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	b _080BBC7C
	.align 2, 0
_080BBC68: .4byte gTasks
_080BBC6C: .4byte gUnknown_202297A
_080BBC70:
	ldr r1, _080BBCA0 @ =gUnknown_202297A
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
_080BBCA0: .4byte gUnknown_202297A
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
	ldr r2, _080BBE08 @ =gUnknown_2037F02
	ldr r1, _080BBE0C @ =gUnknown_2022B50
	ldrb r1, [r1]
	strh r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BBE08: .4byte gUnknown_2037F02
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
	ldr r0, _080BBEAC @ =gUnknown_2037F02
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
_080BBEAC: .4byte gUnknown_2037F02
_080BBEB0:
	cmp r0, 0x1
	bne _080BBEBC
	ldr r0, _080BBEB8 @ =gUnknown_2037F1A
	b _080BBEC2
	.align 2, 0
_080BBEB8: .4byte gUnknown_2037F1A
_080BBEBC:
	cmp r0, 0x2
	bne _080BBEC8
	ldr r0, _080BBEF8 @ =gUnknown_2037F1B
_080BBEC2:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080BBEC8:
	ldr r0, _080BBEFC @ =gMonSpritesGfxPtr
	ldr r1, [r0]
	ldr r0, _080BBF00 @ =gUnknown_2037F02
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	movs r2, 0xBE
	lsls r2, 1
	adds r1, r2
	ldr r1, [r1]
	lsls r0, 5
	adds r0, r1
	lsls r1, r4, 5
	ldr r2, _080BBF04 @ =gUnknown_20371F8
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
_080BBEF8: .4byte gUnknown_2037F1B
_080BBEFC: .4byte gMonSpritesGfxPtr
_080BBF00: .4byte gUnknown_2037F02
_080BBF04: .4byte gUnknown_20371F8
	thumb_func_end sub_80BBE6C

	thumb_func_start sub_80BBF08
sub_80BBF08: @ 80BBF08
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080BBF48 @ =gUnknown_2037F02
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
_080BBF48: .4byte gUnknown_2037F02
_080BBF4C:
	cmp r0, 0x1
	bne _080BBF58
	ldr r0, _080BBF54 @ =gUnknown_2037F1A
	b _080BBF5E
	.align 2, 0
_080BBF54: .4byte gUnknown_2037F1A
_080BBF58:
	cmp r0, 0x2
	bne _080BBF64
	ldr r0, _080BBF94 @ =gUnknown_2037F1B
_080BBF5E:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080BBF64:
	lsls r0, r4, 5
	ldr r1, _080BBF98 @ =gUnknown_20371F8
	adds r0, r1
	ldr r1, _080BBF9C @ =gMonSpritesGfxPtr
	ldr r2, [r1]
	ldr r1, _080BBFA0 @ =gUnknown_2037F02
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
_080BBF94: .4byte gUnknown_2037F1B
_080BBF98: .4byte gUnknown_20371F8
_080BBF9C: .4byte gMonSpritesGfxPtr
_080BBFA0: .4byte gUnknown_2037F02
	thumb_func_end sub_80BBF08

	thumb_func_start sub_80BBFA4
sub_80BBFA4: @ 80BBFA4
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080BBFE4 @ =gUnknown_2037F02
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
_080BBFE4: .4byte gUnknown_2037F02
_080BBFE8:
	cmp r0, 0x1
	bne _080BBFF4
	ldr r0, _080BBFF0 @ =gUnknown_2037F1A
	b _080BBFFA
	.align 2, 0
_080BBFF0: .4byte gUnknown_2037F1A
_080BBFF4:
	cmp r0, 0x2
	bne _080BC000
	ldr r0, _080BC020 @ =gUnknown_2037F1B
_080BBFFA:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080BC000:
	lsls r1, r4, 5
	ldr r0, _080BC024 @ =gUnknown_20371F8
	adds r0, r1, r0
	ldr r2, _080BC028 @ =gUnknown_20375F8
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
_080BC020: .4byte gUnknown_2037F1B
_080BC024: .4byte gUnknown_20371F8
_080BC028: .4byte gUnknown_20375F8
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
	ldr r1, _080BC048 @ =gUnknown_2037F02
	movs r0, 0x1
	strh r0, [r1, 0xE]
	b _080BC050
	.align 2, 0
_080BC048: .4byte gUnknown_2037F02
_080BC04C:
	ldr r0, _080BC05C @ =gUnknown_2037F02
	strh r1, [r0, 0xE]
_080BC050:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC05C: .4byte gUnknown_2037F02
	thumb_func_end sub_80BC02C

	thumb_func_start sub_80BC060
sub_80BC060: @ 80BC060
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC080 @ =gUnknown_2037F1A
	ldr r1, _080BC084 @ =gBattlerTarget
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080BC088 @ =gUnknown_2037F1B
	ldr r1, _080BC08C @ =gUnknown_2023D6E
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC080: .4byte gUnknown_2037F1A
_080BC084: .4byte gBattlerTarget
_080BC088: .4byte gUnknown_2037F1B
_080BC08C: .4byte gUnknown_2023D6E
	thumb_func_end sub_80BC060

	thumb_func_start sub_80BC090
sub_80BC090: @ 80BC090
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080BC0B8 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080BC0BC @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080BC0C4
	ldr r1, _080BC0C0 @ =gUnknown_2037F02
	movs r0, 0x1
	b _080BC0C8
	.align 2, 0
_080BC0B8: .4byte gUnknown_2037F1A
_080BC0BC: .4byte gUnknown_2037F1B
_080BC0C0: .4byte gUnknown_2037F02
_080BC0C4:
	ldr r1, _080BC0D8 @ =gUnknown_2037F02
	movs r0, 0
_080BC0C8:
	strh r0, [r1, 0xE]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC0D8: .4byte gUnknown_2037F02
	thumb_func_end sub_80BC090

	thumb_func_start sub_80BC0DC
sub_80BC0DC: @ 80BC0DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC0F4 @ =gUnknown_2037F1B
	ldr r1, _080BC0F8 @ =gBattlerTarget
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC0F4: .4byte gUnknown_2037F1B
_080BC0F8: .4byte gBattlerTarget
	thumb_func_end sub_80BC0DC

	thumb_func_start sub_80BC0FC
sub_80BC0FC: @ 80BC0FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC11C @ =gUnknown_2037F1A
	ldr r1, _080BC120 @ =sBattler_AI
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080BC124 @ =gUnknown_2037F1B
	ldr r1, _080BC128 @ =gUnknown_2023D6E
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC11C: .4byte gUnknown_2037F1A
_080BC120: .4byte sBattler_AI
_080BC124: .4byte gUnknown_2037F1B
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
	ldr r2, _080BC190 @ =gUnknown_2037F1A
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
_080BC190: .4byte gUnknown_2037F1A
_080BC194: .4byte sub_80BC19C
_080BC198: .4byte gUnknown_2037EE2
	thumb_func_end sub_80BC12C

	thumb_func_start sub_80BC19C
sub_80BC19C: @ 80BC19C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BC1E8 @ =gUnknown_2037F02
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bne _080BC1E0
	ldr r0, _080BC1EC @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _080BC1F0 @ =gUnknown_2037F1A
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
_080BC1E8: .4byte gUnknown_2037F02
_080BC1EC: .4byte gUnknown_2024018
_080BC1F0: .4byte gUnknown_2037F1A
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
	ldr r0, _080BC468 @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BC46C @ =gUnknown_202297A
	strh r1, [r0]
	ldr r0, _080BC470 @ =gUnknown_202297C
	strh r1, [r0]
	ldr r0, _080BC474 @ =gUnknown_202297E
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
_080BC468: .4byte gUnknown_2022978
_080BC46C: .4byte gUnknown_202297A
_080BC470: .4byte gUnknown_202297C
_080BC474: .4byte gUnknown_202297E
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
	ldr r1, _080BC4B4 @ =gUnknown_2022978
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
_080BC4B4: .4byte gUnknown_2022978
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
	ldr r2, _080BC5A8 @ =gUnknown_202297A
	ldrh r1, [r2]
	ldr r0, _080BC5AC @ =0x0000ffb0
	cmp r1, r0
	beq _080BC5BE
	subs r0, r1, 0x2
	b _080BC5BC
	.align 2, 0
_080BC5A8: .4byte gUnknown_202297A
_080BC5AC: .4byte 0x0000ffb0
_080BC5B0:
	ldr r2, _080BC690 @ =gUnknown_202297A
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
	ldr r5, _080BC6A0 @ =gUnknown_2039600
	mov r9, r5
	ldr r7, _080BC6A4 @ =gUnknown_2038700
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
	ldr r7, _080BC6A4 @ =gUnknown_2038700
	ldr r6, _080BC6A0 @ =gUnknown_2039600
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
_080BC690: .4byte gUnknown_202297A
_080BC694: .4byte 0x0000ffc8
_080BC698: .4byte gUnknown_2022986
_080BC69C: .4byte 0xfffffc04
_080BC6A0: .4byte gUnknown_2039600
_080BC6A4: .4byte gUnknown_2038700
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
	ldr r1, _080BC704 @ =gUnknown_2022978
	ldrh r0, [r1]
	adds r0, 0x8
	b _080BC70E
	.align 2, 0
_080BC704: .4byte gUnknown_2022978
_080BC708:
	ldr r1, _080BC74C @ =gUnknown_2022978
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
	ldr r7, _080BC750 @ =gUnknown_202297A
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
_080BC74C: .4byte gUnknown_2022978
_080BC750: .4byte gUnknown_202297A
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
	ldr r0, _080BC994 @ =gUnknown_2039600
	mov r8, r0
	ldr r2, _080BC998 @ =gUnknown_2038700
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
	ldr r0, _080BC998 @ =gUnknown_2038700
	mov r12, r0
	ldr r7, _080BC994 @ =gUnknown_2039600
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
_080BC994: .4byte gUnknown_2039600
_080BC998: .4byte gUnknown_2038700
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
	ldr r1, _080BCA08 @ =gUnknown_2022978
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
_080BCA08: .4byte gUnknown_2022978
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
	ldr r6, _080BCC08 @ =gUnknown_2039600
	mov r8, r6
	ldr r7, _080BCC0C @ =gUnknown_2038700
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
	ldr r7, _080BCC0C @ =gUnknown_2038700
	ldr r6, _080BCC08 @ =gUnknown_2039600
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
_080BCC08: .4byte gUnknown_2039600
_080BCC0C: .4byte gUnknown_2038700
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
	ldr r2, _080BCC9C @ =gUnknown_2022978
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
	ldr r1, _080BCCA0 @ =gUnknown_202297C
	ldrh r0, [r1]
	subs r0, 0x3
	strh r0, [r1]
	b _080BCCC2
	.align 2, 0
_080BCC98: .4byte gTasks
_080BCC9C: .4byte gUnknown_2022978
_080BCCA0: .4byte gUnknown_202297C
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
	ldr r0, _080BCED4 @ =gUnknown_2039600
	mov r12, r0
	ldr r2, _080BCED8 @ =gUnknown_2038700
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
	ldr r0, _080BCED8 @ =gUnknown_2038700
	mov r8, r0
	ldr r7, _080BCED4 @ =gUnknown_2039600
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
_080BCED4: .4byte gUnknown_2039600
_080BCED8: .4byte gUnknown_2038700
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
	ldr r1, _080BCFC8 @ =gUnknown_2024024
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
_080BCFC8: .4byte gUnknown_2024024
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
