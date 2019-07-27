	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8078178
sub_8078178: @ 8078178
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0807821C @ =gBattlerSpriteIds
	adds r0, r4, r0
	ldrb r6, [r0]
	ldr r0, _08078220 @ =sub_80782BC
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08078224 @ =gUnknown_83AD048
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _08078228 @ =gUnknown_83AD950
	bl LoadCompressedSpritePaletteUsingHeap
	ldr r1, _0807822C @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	strh r4, [r1, 0x8]
	cmp r5, 0
	beq _08078238
	movs r0, 0x1F
	strh r0, [r1, 0xA]
	movs r5, 0
	lsls r0, r6, 4
	ldr r7, _08078230 @ =gSprites
	adds r0, r6
	lsls r0, 2
	adds r6, r0, r7
_080781CC:
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	ldrh r2, [r6, 0x22]
	adds r2, 0x20
	lsls r2, 16
	asrs r2, 16
	ldr r0, _08078234 @ =gUnknown_83BF574
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r3, r0, r7
	lsls r0, r5, 1
	adds r0, r5
	lsls r1, r0, 4
	adds r0, r1
	strh r0, [r3, 0x2E]
	movs r0, 0xFF
	lsls r0, 8
	strh r0, [r3, 0x30]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	cmp r5, 0x4
	bls _08078210
	movs r0, 0x15
	strh r0, [r3, 0x3A]
_08078210:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _080781CC
	b _08078298
	.align 2, 0
_0807821C: .4byte gBattlerSpriteIds
_08078220: .4byte sub_80782BC
_08078224: .4byte gUnknown_83AD048
_08078228: .4byte gUnknown_83AD950
_0807822C: .4byte gTasks
_08078230: .4byte gSprites
_08078234: .4byte gUnknown_83BF574
_08078238:
	movs r0, 0xF8
	lsls r0, 7
	strh r0, [r1, 0xA]
	movs r5, 0
	lsls r0, r6, 4
	ldr r7, _080782B4 @ =gSprites
	adds r0, r6
	lsls r0, 2
	adds r6, r0, r7
_0807824A:
	movs r2, 0x20
	ldrsh r1, [r6, r2]
	ldrh r2, [r6, 0x22]
	subs r2, 0x20
	lsls r2, 16
	asrs r2, 16
	ldr r0, _080782B8 @ =gUnknown_83BF574
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r3, r0, r7
	lsls r0, r5, 1
	adds r0, r5
	lsls r1, r0, 4
	adds r0, r1
	strh r0, [r3, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r3, 0x30]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	cmp r5, 0x4
	bls _0807828E
	movs r0, 0x15
	strh r0, [r3, 0x3A]
_0807828E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _0807824A
_08078298:
	ldr r0, _080782B4 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080782B4: .4byte gSprites
_080782B8: .4byte gUnknown_83BF574
	thumb_func_end sub_8078178

	thumb_func_start sub_80782BC
sub_80782BC: @ 80782BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08078314 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x2
	bne _08078342
	movs r0, 0
	strh r0, [r4, 0xC]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldrb r2, [r4, 0x10]
	ldrh r3, [r4, 0xA]
	movs r1, 0x10
	bl BlendPalette
	ldrh r2, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08078318
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08078346
	movs r0, 0x1
	eors r0, r2
	strh r0, [r4, 0x12]
	b _08078346
	.align 2, 0
_08078314: .4byte gTasks
_08078318:
	ldrh r1, [r4, 0x10]
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _08078346
	strh r1, [r4, 0x10]
	movs r0, 0x1
	eors r0, r2
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _08078346
	adds r0, r5, 0
	bl DestroyTask
	b _08078346
_08078342:
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
_08078346:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80782BC

	thumb_func_start sub_807834C
sub_807834C: @ 807834C
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _08078378
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldr r1, _08078374 @ =sub_8078380
	str r1, [r2, 0x1C]
	adds r0, r2, 0
	bl _call_via_r1
	b _0807837C
	.align 2, 0
_08078374: .4byte sub_8078380
_08078378:
	subs r0, r1, 0x1
	strh r0, [r2, 0x3A]
_0807837C:
	pop {r0}
	bx r0
	thumb_func_end sub_807834C

	thumb_func_start sub_8078380
sub_8078380: @ 8078380
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	bgt _080783AC
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
	b _080783B2
_080783AC:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
_080783B2:
	strb r0, [r1]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x38]
	adds r0, r1
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
	cmp r0, 0x34
	bne _080783F4
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080783EE
	adds r0, r4, 0
	bl DestroySpriteAndFreeResources
	b _080783F4
_080783EE:
	adds r0, r4, 0
	bl DestroySprite
_080783F4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078380

	thumb_func_start sub_80783FC
sub_80783FC: @ 80783FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _080784AC @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _080784B0 @ =0xffe00000
	adds r0, r1
	lsrs r5, r0, 16
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _080784B4 @ =0xffdc0000
	adds r0, r1
	lsrs r4, r0, 16
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _0807843A
	lsls r0, r5, 16
	ldr r1, _080784B8 @ =0xfffa0000
	adds r0, r1
	lsrs r5, r0, 16
_0807843A:
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, _080784BC @ =gUnknown_83BF55C
	lsls r1, r5, 16
	asrs r1, 16
	lsls r2, r4, 16
	asrs r2, 16
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080784C0 @ =0x0000271a
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _080784C4 @ =0xffff0000
	cmp r0, r1
	bne _08078484
	ldr r1, _080784C8 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_08078484:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _080784C8 @ =gSprites
	adds r0, r1
	ldr r1, _080784CC @ =gUnknown_83BF554
	bl SetSubspriteTables
	ldr r1, _080784D0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x26]
	ldr r1, _080784D4 @ =sub_80784D8
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080784AC: .4byte gBattleAnimTarget
_080784B0: .4byte 0xffe00000
_080784B4: .4byte 0xffdc0000
_080784B8: .4byte 0xfffa0000
_080784BC: .4byte gUnknown_83BF55C
_080784C0: .4byte 0x0000271a
_080784C4: .4byte 0xffff0000
_080784C8: .4byte gSprites
_080784CC: .4byte gUnknown_83BF554
_080784D0: .4byte gTasks
_080784D4: .4byte sub_80784D8
	thumb_func_end sub_80783FC

	thumb_func_start sub_80784D8
sub_80784D8: @ 80784D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08078504 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	adds r2, r0, 0
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0807850C
	ldr r0, _08078508 @ =sub_8078528
	str r0, [r1]
	movs r0, 0
	strh r0, [r1, 0xA]
	b _08078522
	.align 2, 0
_08078504: .4byte gTasks
_08078508: .4byte sub_8078528
_0807850C:
	lsls r0, r2, 24
	lsrs r0, 24
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
_08078522:
	pop {r0}
	bx r0
	thumb_func_end sub_80784D8

	thumb_func_start sub_8078528
sub_8078528: @ 8078528
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080785C0 @ =0x0000271a
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080785C4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	adds r1, r0, 0x1
	strh r1, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	ble _080785B8
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080785B8
	ldr r3, _080785C8 @ =gPlttBufferFaded
	lsls r2, 4
	mov r12, r2
	ldr r1, _080785CC @ =0x0000010d
	add r1, r12
	lsls r1, 1
	adds r1, r3
	ldrh r4, [r1]
	movs r2, 0x87
	lsls r2, 1
	add r2, r12
	lsls r2, 1
	adds r2, r3
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r0, _080785D0 @ =0x0000010f
	add r0, r12
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	strh r1, [r2]
	strh r4, [r0]
	strh r6, [r5, 0xC]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080785B8
	strh r6, [r5, 0xE]
	strh r6, [r5, 0xA]
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080785B8
	movs r0, 0x9
	strh r0, [r5, 0xA]
	ldr r0, _080785D4 @ =sub_80785D8
	str r0, [r5]
_080785B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080785C0: .4byte 0x0000271a
_080785C4: .4byte gTasks
_080785C8: .4byte gPlttBufferFaded
_080785CC: .4byte 0x0000010d
_080785D0: .4byte 0x0000010f
_080785D4: .4byte sub_80785D8
	thumb_func_end sub_8078528

	thumb_func_start sub_80785D8
sub_80785D8: @ 80785D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08078608 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
	adds r3, r0, 0
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08078610
	ldr r0, _0807860C @ =sub_807862C
	str r0, [r2]
	movs r0, 0
	strh r0, [r2, 0xA]
	b _08078626
	.align 2, 0
_08078608: .4byte gTasks
_0807860C: .4byte sub_807862C
_08078610:
	lsls r0, r3, 24
	lsrs r0, 24
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
_08078626:
	pop {r0}
	bx r0
	thumb_func_end sub_80785D8

	thumb_func_start sub_807862C
sub_807862C: @ 807862C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _0807866C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x25
	bne _08078674
	ldrh r0, [r1, 0x26]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08078670 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	b _0807868E
	.align 2, 0
_0807866C: .4byte gTasks
_08078670: .4byte gSprites
_08078674:
	cmp r0, 0x27
	bne _0807868E
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_0807868E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807862C

	thumb_func_start sub_8078694
sub_8078694: @ 8078694
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	ldr r0, _080786B8 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrh r0, [r0]
	subs r0, 0xF
	cmp r0, 0x2B
	bls _080786AC
	b _08078830
_080786AC:
	lsls r0, 2
	ldr r1, _080786BC @ =_080786C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080786B8: .4byte gUnknown_2024018
_080786BC: .4byte _080786C0
	.align 2, 0
_080786C0:
	.4byte _08078770
	.4byte _08078776
	.4byte _0807877C
	.4byte _08078782
	.4byte _08078788
	.4byte _0807878E
	.4byte _08078794
	.4byte _0807879A
	.4byte _080787A0
	.4byte _080787A6
	.4byte _080787AC
	.4byte _080787B2
	.4byte _080787B8
	.4byte _080787BE
	.4byte _08078830
	.4byte _08078830
	.4byte _08078830
	.4byte _08078830
	.4byte _08078830
	.4byte _08078830
	.4byte _08078830
	.4byte _08078830
	.4byte _08078830
	.4byte _08078830
	.4byte _080787C4
	.4byte _080787C8
	.4byte _080787CC
	.4byte _080787D0
	.4byte _080787D4
	.4byte _080787D8
	.4byte _080787DC
	.4byte _080787E0
	.4byte _080787E8
	.4byte _080787F0
	.4byte _080787F8
	.4byte _08078800
	.4byte _08078808
	.4byte _08078810
	.4byte _08078830
	.4byte _08078830
	.4byte _08078818
	.4byte _0807881C
	.4byte _08078820
	.4byte _08078828
_08078770:
	movs r5, 0
	movs r2, 0
	b _08078838
_08078776:
	movs r5, 0
	movs r2, 0x1
	b _08078838
_0807877C:
	movs r5, 0
	movs r2, 0x3
	b _08078838
_08078782:
	movs r5, 0
	movs r2, 0x5
	b _08078838
_08078788:
	movs r5, 0
	movs r2, 0x6
	b _08078838
_0807878E:
	movs r5, 0
	movs r2, 0x2
	b _08078838
_08078794:
	movs r5, 0
	movs r2, 0x4
	b _08078838
_0807879A:
	movs r5, 0x1
	movs r2, 0
	b _08078838
_080787A0:
	movs r5, 0x1
	movs r2, 0x1
	b _08078838
_080787A6:
	movs r5, 0x1
	movs r2, 0x3
	b _08078838
_080787AC:
	movs r5, 0x1
	movs r2, 0x5
	b _08078838
_080787B2:
	movs r5, 0x1
	movs r2, 0x6
	b _08078838
_080787B8:
	movs r5, 0x1
	movs r2, 0x2
	b _08078838
_080787BE:
	movs r5, 0x1
	movs r2, 0x4
	b _08078838
_080787C4:
	movs r5, 0
	b _080787E2
_080787C8:
	movs r5, 0
	b _080787EA
_080787CC:
	movs r5, 0
	b _080787F2
_080787D0:
	movs r5, 0
	b _080787FA
_080787D4:
	movs r5, 0
	b _08078802
_080787D8:
	movs r5, 0
	b _0807880A
_080787DC:
	movs r5, 0
	b _08078812
_080787E0:
	movs r5, 0x1
_080787E2:
	movs r2, 0
	movs r3, 0x1
	b _08078838
_080787E8:
	movs r5, 0x1
_080787EA:
	movs r2, 0x1
	movs r3, 0x1
	b _08078838
_080787F0:
	movs r5, 0x1
_080787F2:
	movs r2, 0x3
	movs r3, 0x1
	b _08078838
_080787F8:
	movs r5, 0x1
_080787FA:
	movs r2, 0x5
	movs r3, 0x1
	b _08078838
_08078800:
	movs r5, 0x1
_08078802:
	movs r2, 0x6
	movs r3, 0x1
	b _08078838
_08078808:
	movs r5, 0x1
_0807880A:
	movs r2, 0x2
	movs r3, 0x1
	b _08078838
_08078810:
	movs r5, 0x1
_08078812:
	movs r2, 0x4
	movs r3, 0x1
	b _08078838
_08078818:
	movs r5, 0
	b _08078822
_0807881C:
	movs r5, 0
	b _0807882A
_08078820:
	movs r5, 0x1
_08078822:
	movs r2, 0xFF
	movs r3, 0
	b _08078838
_08078828:
	movs r5, 0x1
_0807882A:
	movs r2, 0xFF
	movs r3, 0x1
	b _08078838
_08078830:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _0807885A
_08078838:
	ldr r0, _08078860 @ =gBattleAnimArgs
	movs r1, 0
	strh r5, [r0]
	strh r2, [r0, 0x2]
	strh r1, [r0, 0x4]
	strh r1, [r0, 0x6]
	strh r3, [r0, 0x8]
	ldr r1, _08078864 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08078868 @ =sub_80BB088
	str r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_0807885A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078860: .4byte gBattleAnimArgs
_08078864: .4byte gTasks
_08078868: .4byte sub_80BB088
	thumb_func_end sub_8078694

	thumb_func_start LaunchStatusAnimation
LaunchStatusAnimation: @ 807886C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080788A8 @ =gBattleAnimAttacker
	strb r4, [r0]
	ldr r0, _080788AC @ =gBattleAnimTarget
	strb r4, [r0]
	ldr r0, _080788B0 @ =gUnknown_81C6E84
	movs r2, 0
	bl sub_80725D4
	ldr r0, _080788B4 @ =task0A_80788BC
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080788B8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080788A8: .4byte gBattleAnimAttacker
_080788AC: .4byte gBattleAnimTarget
_080788B0: .4byte gUnknown_81C6E84
_080788B4: .4byte task0A_80788BC
_080788B8: .4byte gTasks
	thumb_func_end LaunchStatusAnimation

	thumb_func_start task0A_80788BC
task0A_80788BC: @ 80788BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08078904 @ =gUnknown_2037EDC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08078908 @ =gUnknown_2037EE1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080788FE
	ldr r0, _0807890C @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r1, _08078910 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	ldr r2, [r2, 0x4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_080788FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078904: .4byte gUnknown_2037EDC
_08078908: .4byte gUnknown_2037EE1
_0807890C: .4byte gUnknown_2024018
_08078910: .4byte gTasks
	thumb_func_end task0A_80788BC

	.align 2, 0 @ Don't pad with nop.
