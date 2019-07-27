	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
	ldr r1, _080AAC4C @ =gBattleAnimArgs
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
_080AAC4C: .4byte gBattleAnimArgs
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
	ldr r5, _080AACC0 @ =gBattleAnimAttacker
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
	ldr r4, _080AACC4 @ =gBattleAnimArgs
	ldrh r1, [r4]
	subs r0, r1
	b _080AACDA
	.align 2, 0
_080AACC0: .4byte gBattleAnimAttacker
_080AACC4: .4byte gBattleAnimArgs
_080AACC8:
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080AADA0 @ =gBattleAnimArgs
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
	ldr r0, _080AADA4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AAD10
	ldr r1, _080AADA0 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080AAD10:
	ldr r5, _080AADA0 @ =gBattleAnimArgs
	ldrh r0, [r5, 0xC]
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldr r4, _080AADA8 @ =gBattleAnimTarget
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
_080AADA0: .4byte gBattleAnimArgs
_080AADA4: .4byte gBattleAnimAttacker
_080AADA8: .4byte gBattleAnimTarget
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
	ldr r0, _080AAEAC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080AAEB4
	ldr r1, _080AAEB0 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r7, r1, 0
	b _080AAEBA
	.align 2, 0
_080AAEAC: .4byte gBattleAnimAttacker
_080AAEB0: .4byte gBattleAnimArgs
_080AAEB4:
	ldr r0, _080AAF10 @ =gBattleAnimArgs
	ldrh r6, [r0, 0x4]
	adds r7, r0, 0
_080AAEBA:
	ldrh r0, [r7, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080AAF14 @ =gBattleAnimTarget
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
_080AAF10: .4byte gBattleAnimArgs
_080AAF14: .4byte gBattleAnimTarget
_080AAF18: .4byte sub_80AAF1C
	thumb_func_end sub_80AAE84

	thumb_func_start sub_80AAF1C
sub_80AAF1C: @ 80AAF1C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AAF58 @ =gBattleAnimArgs
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
_080AAF58: .4byte gBattleAnimArgs
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
	ldr r0, _080AAF98 @ =gBattleAnimArgs
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
_080AAF98: .4byte gBattleAnimArgs
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
	ldr r1, _080AB020 @ =gPlttBufferFaded
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
_080AB020: .4byte gPlttBufferFaded
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
	ldr r4, _080AB08C @ =gBattleAnimTarget
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
	ldr r0, _080AB090 @ =gBattleAnimArgs
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
_080AB08C: .4byte gBattleAnimTarget
_080AB090: .4byte gBattleAnimArgs
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
	ldr r3, _080AB124 @ =gBattleAnimArgs
	ldrh r0, [r3]
	movs r2, 0
	strh r0, [r1, 0x8]
	strh r2, [r3, 0xE]
	ldr r0, _080AB128 @ =sub_80AB12C
	str r0, [r1]
	bx lr
	.align 2, 0
_080AB120: .4byte gTasks
_080AB124: .4byte gBattleAnimArgs
_080AB128: .4byte sub_80AB12C
	thumb_func_end sub_80AB100

	thumb_func_start sub_80AB12C
sub_80AB12C: @ 80AB12C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080AB160 @ =gBattleAnimArgs
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
_080AB160: .4byte gBattleAnimArgs
_080AB164: .4byte gTasks
	thumb_func_end sub_80AB12C

	thumb_func_start sub_80AB168
sub_80AB168: @ 80AB168
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r7, _080AB1B4 @ =gBattleAnimAttacker
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
	bl IsContest
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
_080AB1B4: .4byte gBattleAnimAttacker
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
	ldr r5, _080AB2B8 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080AB2BC @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080AB242
	ldr r4, _080AB2C0 @ =gBattleAnimArgs
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
	ldr r5, _080AB2C0 @ =gBattleAnimArgs
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
	ldr r0, _080AB2B8 @ =gBattleAnimAttacker
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
	ldr r4, _080AB2BC @ =gBattleAnimTarget
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
_080AB2B8: .4byte gBattleAnimAttacker
_080AB2BC: .4byte gBattleAnimTarget
_080AB2C0: .4byte gBattleAnimArgs
_080AB2C4: .4byte sub_8075590
_080AB2C8: .4byte DestroyAnimSprite
	thumb_func_end sub_80AB1F8

	thumb_func_start sub_80AB2CC
sub_80AB2CC: @ 80AB2CC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r0, _080AB2FC @ =gBattleAnimArgs
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
_080AB2FC: .4byte gBattleAnimArgs
_080AB300: .4byte sub_8075590
_080AB304: .4byte DestroyAnimSprite
	thumb_func_end sub_80AB2CC

	thumb_func_start sub_80AB308
sub_80AB308: @ 80AB308
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AB320 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080AB324
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075114
	b _080AB32C
	.align 2, 0
_080AB320: .4byte gBattleAnimArgs
_080AB324:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075160
_080AB32C:
	ldr r0, _080AB33C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x3C]
	ldr r0, _080AB340 @ =sub_80AB344
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB33C: .4byte gBattleAnimArgs
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080AB418
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
	ldr r0, _080AB400 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080AB408
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AB404 @ =gFile_graphics_unknown_unknown_E81D14_tilemap
	bl sub_807543C
	b _080AB42E
	.align 2, 0
_080AB3FC: .4byte 0x00003f42
_080AB400: .4byte gBattleAnimAttacker
_080AB404: .4byte gFile_graphics_unknown_unknown_E81D14_tilemap
_080AB408:
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080AB414 @ =gFile_graphics_unknown_unknown_E81FE4_tilemap
	bl sub_807543C
	b _080AB42E
	.align 2, 0
_080AB414: .4byte gFile_graphics_unknown_unknown_E81FE4_tilemap
_080AB418:
	ldr r0, _080AB458 @ =gFile_graphics_unknown_unknown_E822B8_tilemap
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
	ldr r1, _080AB45C @ =gFile_graphics_battle_anims_backgrounds_water_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080AB460 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080AB468
	ldr r0, _080AB464 @ =gFile_graphics_battle_anims_backgrounds_water_palette
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080AB476
	.align 2, 0
_080AB458: .4byte gFile_graphics_unknown_unknown_E822B8_tilemap
_080AB45C: .4byte gFile_graphics_battle_anims_backgrounds_water_sheet
_080AB460: .4byte gBattleAnimArgs
_080AB464: .4byte gFile_graphics_battle_anims_backgrounds_water_palette
_080AB468:
	ldr r0, _080AB4E0 @ =gFile_graphics_battle_anims_backgrounds_water_muddy_palette
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
	bl IsContest
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080AB4F8
	ldr r1, _080AB4EC @ =0x0000ffb0
	adds r0, r1, 0
	ldr r2, _080AB4F0 @ =gBattle_BG1_X
	strh r0, [r2]
	adds r1, 0x20
	adds r0, r1, 0
	ldr r2, _080AB4F4 @ =gBattle_BG1_Y
	strh r0, [r2]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	movs r0, 0x1
	strh r0, [r6, 0xA]
	mov r0, r9
	strh r0, [r7, 0xE]
	b _080AB552
	.align 2, 0
_080AB4E0: .4byte gFile_graphics_battle_anims_backgrounds_water_muddy_palette
_080AB4E4: .4byte sub_80AB79C
_080AB4E8: .4byte gTasks
_080AB4EC: .4byte 0x0000ffb0
_080AB4F0: .4byte gBattle_BG1_X
_080AB4F4: .4byte gBattle_BG1_Y
_080AB4F8:
	ldr r0, _080AB528 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080AB53C
	ldr r2, _080AB52C @ =0x0000ff20
	adds r0, r2, 0
	ldr r2, _080AB530 @ =gBattle_BG1_X
	strh r0, [r2]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldr r2, _080AB534 @ =gBattle_BG1_Y
	strh r0, [r2]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	ldr r0, _080AB538 @ =0x0000ffff
	strh r0, [r6, 0xA]
	strh r1, [r7, 0xE]
	b _080AB552
	.align 2, 0
_080AB528: .4byte gBattleAnimAttacker
_080AB52C: .4byte 0x0000ff20
_080AB530: .4byte gBattle_BG1_X
_080AB534: .4byte gBattle_BG1_Y
_080AB538: .4byte 0x0000ffff
_080AB53C:
	ldr r0, _080AB584 @ =gBattle_BG1_X
	strh r4, [r0]
	ldr r1, _080AB588 @ =0x0000ffd0
	adds r0, r1, 0
	ldr r2, _080AB58C @ =gBattle_BG1_Y
	strh r0, [r2]
	ldr r0, _080AB590 @ =0x0000fffe
	strh r0, [r6, 0x8]
	movs r0, 0x1
	strh r0, [r6, 0xA]
	strh r4, [r7, 0xE]
_080AB552:
	ldr r0, _080AB584 @ =gBattle_BG1_X
	ldrh r1, [r0]
	movs r0, 0x14
	bl SetGpuReg
	ldr r2, _080AB58C @ =gBattle_BG1_Y
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
_080AB584: .4byte gBattle_BG1_X
_080AB588: .4byte 0x0000ffd0
_080AB58C: .4byte gBattle_BG1_Y
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
	ldr r1, _080AB6F4 @ =gBattle_BG1_X
	ldr r2, _080AB6F8 @ =gBattle_BG1_Y
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
	ldr r1, _080AB700 @ =gPlttBufferFaded
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
_080AB6F4: .4byte gBattle_BG1_X
_080AB6F8: .4byte gBattle_BG1_Y
_080AB6FC: .4byte gTasks
_080AB700: .4byte gPlttBufferFaded
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
	ldr r7, _080AB740 @ =gBattle_BG1_X
	ldr r0, _080AB744 @ =gBattle_BG1_Y
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
_080AB740: .4byte gBattle_BG1_X
_080AB744: .4byte gBattle_BG1_Y
_080AB748: .4byte gTasks
_080AB74C:
	bl IsContest
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
	ldr r1, _080AB8A0 @ =gScanlineEffectRegBuffers
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
	ldr r5, _080AB8A0 @ =gScanlineEffectRegBuffers
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
	ldr r5, _080AB8A0 @ =gScanlineEffectRegBuffers
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
_080AB8A0: .4byte gScanlineEffectRegBuffers
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
	bl ScanlineEffect_SetParams
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
	ldr r6, _080AB9B4 @ =gScanlineEffectRegBuffers
	ldr r5, _080AB9B8 @ =gScanlineEffect
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
	ldr r6, _080AB9B4 @ =gScanlineEffectRegBuffers
	ldr r5, _080AB9B8 @ =gScanlineEffect
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
	ldr r6, _080AB9B4 @ =gScanlineEffectRegBuffers
	ldr r5, _080AB9B8 @ =gScanlineEffect
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
_080AB9B4: .4byte gScanlineEffectRegBuffers
_080AB9B8: .4byte gScanlineEffect
_080AB9BC:
	movs r3, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080AB9F0
	ldr r6, _080ABA70 @ =gScanlineEffectRegBuffers
	ldr r5, _080ABA74 @ =gScanlineEffect
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
	ldr r6, _080ABA70 @ =gScanlineEffectRegBuffers
	ldr r5, _080ABA74 @ =gScanlineEffect
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
	ldr r6, _080ABA70 @ =gScanlineEffectRegBuffers
	ldr r5, _080ABA74 @ =gScanlineEffect
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
	bl ScanlineEffect_Stop
	adds r0, r7, 0
	bl DestroyTask
_080ABA66:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABA70: .4byte gScanlineEffectRegBuffers
_080ABA74: .4byte gScanlineEffect
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
	bl PrepareBattlerSpriteForRotScale
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
	bl ResetSpriteRotScale
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
	ldr r4, _080ABDEC @ =gBattleAnimAttacker
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
_080ABDEC: .4byte gBattleAnimAttacker
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
	ldr r4, _080ABF54 @ =gBattleAnimAttacker
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
_080ABF54: .4byte gBattleAnimAttacker
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
	ldr r0, _080AC040 @ =gBattleAnimAttacker
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
_080AC040: .4byte gBattleAnimAttacker
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
	ldr r5, _080AC13C @ =gBattleAnimArgs
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
_080AC13C: .4byte gBattleAnimArgs
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
	ldr r1, _080AC1EC @ =gSineTable
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
_080AC1EC: .4byte gSineTable
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
	ldr r4, _080AC3B0 @ =gBattleAnimAttacker
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
	bl IsContest
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
_080AC3B0: .4byte gBattleAnimAttacker
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
	ldr r2, _080AC644 @ =gBattleAnimArgs
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
_080AC644: .4byte gBattleAnimArgs
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
	ldr r5, _080AC714 @ =gBattleAnimTarget
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
	ldr r1, _080AC718 @ =gBattleAnimArgs
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
_080AC714: .4byte gBattleAnimTarget
_080AC718: .4byte gBattleAnimArgs
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
	ldr r0, _080AC870 @ =gBattleAnimAttacker
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
_080AC870: .4byte gBattleAnimAttacker
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
	ldr r0, _080AC8E8 @ =gBattleAnimAttacker
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
_080AC8E8: .4byte gBattleAnimAttacker
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

	.align 2, 0 @ Don't pad with nop.
