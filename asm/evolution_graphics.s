	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start SetEvoSparklesMatrices
SetEvoSparklesMatrices: @ 80F5950
	push {r4,r5,lr}
	sub sp, 0x4
	movs r4, 0
	ldr r5, _080F5984 @ =gUnknown_841EF10
_080F5958:
	adds r0, r4, 0
	adds r0, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xB
	bls _080F5958
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F5984: .4byte gUnknown_841EF10
	thumb_func_end SetEvoSparklesMatrices

	thumb_func_start SpriteCB_PreEvoSparkleSet1
SpriteCB_PreEvoSparkleSet1: @ 80F5988
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _080F5A36
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x50
	bl __divsi3
	movs r1, 0x58
	subs r1, r0
	strh r1, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080F59C2
	adds r0, 0x3
_080F59C2:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F59EC
	ldrh r0, [r4, 0x38]
	subs r0, 0x1
	strh r0, [r4, 0x38]
_080F59EC:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _080F5A02
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	b _080F5A08
_080F5A02:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
_080F5A08:
	strb r0, [r1]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080F5A14
	adds r0, 0x3
_080F5A14:
	asrs r0, 2
	adds r0, 0x14
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _080F5A22
	movs r2, 0x1F
_080F5A22:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	b _080F5A3C
_080F5A36:
	adds r0, r4, 0
	bl DestroySprite
_080F5A3C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PreEvoSparkleSet1

	thumb_func_start CreatePreEvoSparkleSet1
CreatePreEvoSparkleSet1: @ 80F5A44
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080F5A94 @ =gUnknown_841EEF8
	movs r1, 0x78
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080F5A8E
	ldr r4, _080F5A98 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x30
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x34
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _080F5A9C @ =SpriteCB_PreEvoSparkleSet1
	str r0, [r3]
_080F5A8E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F5A94: .4byte gUnknown_841EEF8
_080F5A98: .4byte gSprites
_080F5A9C: .4byte SpriteCB_PreEvoSparkleSet1
	thumb_func_end CreatePreEvoSparkleSet1

	thumb_func_start SpriteCB_PreEvoSparkleSet2
SpriteCB_PreEvoSparkleSet2: @ 80F5AA0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x57
	bgt _080F5B06
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x8
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080F5AD8
	adds r0, 0x3
_080F5AD8:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r0, 26
	lsrs r0, 24
	movs r1, 0x28
	bl Sin
	adds r0, 0x8
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _080F5B0C
_080F5B06:
	adds r0, r4, 0
	bl DestroySprite
_080F5B0C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PreEvoSparkleSet2

	thumb_func_start CreatePreEvoSparkleSet2
CreatePreEvoSparkleSet2: @ 80F5B14
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080F5B70 @ =gUnknown_841EEF8
	movs r1, 0x78
	movs r2, 0x8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080F5B6A
	ldr r4, _080F5B74 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x8
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0xC
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x32
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _080F5B78 @ =SpriteCB_PreEvoSparkleSet2
	str r0, [r3]
_080F5B6A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F5B70: .4byte gUnknown_841EEF8
_080F5B74: .4byte gSprites
_080F5B78: .4byte SpriteCB_PreEvoSparkleSet2
	thumb_func_end CreatePreEvoSparkleSet2

	thumb_func_start SpriteCB_PostEvoSparkleSet1
SpriteCB_PostEvoSparkleSet1: @ 80F5B7C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _080F5BB8
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	subs r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	b _080F5BBE
_080F5BB8:
	adds r0, r4, 0
	bl DestroySprite
_080F5BBE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PostEvoSparkleSet1

	thumb_func_start CreatePostEvoSparkleSet1
CreatePostEvoSparkleSet1: @ 80F5BC4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080F5C20 @ =gUnknown_841EEF8
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080F5C1A
	ldr r4, _080F5C24 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	strh r5, [r2, 0x34]
	movs r0, 0x78
	strh r0, [r2, 0x38]
	strh r6, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x7C
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _080F5C28 @ =SpriteCB_PostEvoSparkleSet1
	str r0, [r3]
_080F5C1A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F5C20: .4byte gUnknown_841EEF8
_080F5C24: .4byte gSprites
_080F5C28: .4byte SpriteCB_PostEvoSparkleSet1
	thumb_func_end CreatePostEvoSparkleSet1

	thumb_func_start SpriteCB_PostEvoSparkleSet2
SpriteCB_PostEvoSparkleSet2: @ 80F5C2C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080F5C40
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_080F5C40:
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x7F
	bgt _080F5CF0
	lsls r0, r1, 24
	lsrs r0, 24
	movs r5, 0x38
	ldrsh r1, [r4, r5]
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	muls r0, r1
	movs r1, 0x3
	bl __divsi3
	adds r0, 0x78
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x3A]
	adds r3, r0, 0x1
	strh r3, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r1, [r4, r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	cmp r0, 0
	bge _080F5C84
	adds r0, 0x7F
_080F5C84:
	asrs r0, 7
	movs r1, 0x1F
	subs r1, r0
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x40
	ble _080F5CA0
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
	b _080F5CD0
_080F5CA0:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
	strb r0, [r1]
	ldrh r1, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r0, [r4, r5]
	cmp r0, 0x70
	ble _080F5CD0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F5CD0
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_080F5CD0:
	cmp r2, 0x13
	bhi _080F5CD6
	movs r2, 0x14
_080F5CD6:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _080F5CF6
_080F5CF0:
	adds r0, r4, 0
	bl DestroySprite
_080F5CF6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PostEvoSparkleSet2

	thumb_func_start CreatePostEvoSparkleSet2
CreatePostEvoSparkleSet2: @ 80F5CFC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _080F5D78 @ =gUnknown_841EEF8
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _080F5D6C
	bl Random
	ldr r6, _080F5D7C @ =gSprites
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r4, r5, r6
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	bl __umodsi3
	movs r1, 0x3
	subs r1, r0
	movs r0, 0
	mov r8, r0
	strh r1, [r4, 0x34]
	bl Random
	movs r1, 0x3F
	ands r1, r0
	adds r1, 0x30
	strh r1, [r4, 0x38]
	mov r0, r8
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r4, 0x43
	movs r0, 0x14
	strb r0, [r4]
	adds r6, 0x1C
	adds r5, r6
	ldr r0, _080F5D80 @ =SpriteCB_PostEvoSparkleSet2
	str r0, [r5]
_080F5D6C:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F5D78: .4byte gUnknown_841EEF8
_080F5D7C: .4byte gSprites
_080F5D80: .4byte SpriteCB_PostEvoSparkleSet2
	thumb_func_end CreatePostEvoSparkleSet2

	thumb_func_start LoadEvoSparkleSpriteAndPal
LoadEvoSparkleSpriteAndPal: @ 80F5D84
	push {lr}
	ldr r0, _080F5D98 @ =gUnknown_841EEC4
	bl sub_800F034
	ldr r0, _080F5D9C @ =gUnknown_841EED4
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_080F5D98: .4byte gUnknown_841EEC4
_080F5D9C: .4byte gUnknown_841EED4
	thumb_func_end LoadEvoSparkleSpriteAndPal

	thumb_func_start LaunchTask_PreEvoSparklesSet1
LaunchTask_PreEvoSparklesSet1: @ 80F5DA0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080F5DC8 @ =sub_80F5DD0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F5DCC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F5DC8: .4byte sub_80F5DD0
_080F5DCC: .4byte gTasks
	thumb_func_end LaunchTask_PreEvoSparklesSet1

	thumb_func_start sub_80F5DD0
sub_80F5DD0: @ 80F5DD0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl SetEvoSparklesMatrices
	ldr r0, _080F5E14 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x3
	lsls r0, r1
	ldr r1, _080F5E18 @ =0x00007fff
	str r1, [sp]
	movs r1, 0xA
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080F5E1C @ =EvoTask_CreatePreEvoSparkleSet1
	str r0, [r5]
	movs r0, 0x85
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F5E14: .4byte gTasks
_080F5E18: .4byte 0x00007fff
_080F5E1C: .4byte EvoTask_CreatePreEvoSparkleSet1
	thumb_func_end sub_80F5DD0

	thumb_func_start EvoTask_CreatePreEvoSparkleSet1
EvoTask_CreatePreEvoSparkleSet1: @ 80F5E20
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080F5E78 @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0x3F
	bgt _080F5E7C
	movs r0, 0x7
	ands r0, r2
	adds r7, r3, 0
	cmp r0, 0
	bne _080F5E66
	movs r4, 0
	adds r6, r1, 0
_080F5E48:
	ldrh r1, [r6, 0x26]
	movs r0, 0x78
	ands r0, r1
	lsls r0, 1
	lsls r1, r4, 6
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl CreatePreEvoSparkleSet1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080F5E48
_080F5E66:
	ldr r0, _080F5E78 @ =gTasks
	adds r1, r7, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _080F5E84
	.align 2, 0
_080F5E78: .4byte gTasks
_080F5E7C:
	movs r0, 0x60
	strh r0, [r1, 0x26]
	ldr r0, _080F5E8C @ =EvoTask_WaitForPre1SparklesToGoUp
	str r0, [r1]
_080F5E84:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5E8C: .4byte EvoTask_WaitForPre1SparklesToGoUp
	thumb_func_end EvoTask_CreatePreEvoSparkleSet1

	thumb_func_start EvoTask_WaitForPre1SparklesToGoUp
EvoTask_WaitForPre1SparklesToGoUp: @ 80F5E90
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080F5EB0 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r3, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _080F5EB4
	subs r0, r3, 0x1
	strh r0, [r1, 0x26]
	b _080F5EBA
	.align 2, 0
_080F5EB0: .4byte gTasks
_080F5EB4:
	adds r0, r2, 0
	bl DestroyTask
_080F5EBA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end EvoTask_WaitForPre1SparklesToGoUp

	thumb_func_start sub_80F5EC0
sub_80F5EC0: @ 80F5EC0
	push {lr}
	ldr r0, _080F5ED4 @ =sub_80F5ED8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080F5ED4: .4byte sub_80F5ED8
	thumb_func_end sub_80F5EC0

	thumb_func_start sub_80F5ED8
sub_80F5ED8: @ 80F5ED8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl SetEvoSparklesMatrices
	ldr r1, _080F5F04 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _080F5F08 @ =EvoTask_CreatePreEvoSparklesSet2
	str r1, [r0]
	movs r0, 0xB0
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F5F04: .4byte gTasks
_080F5F08: .4byte EvoTask_CreatePreEvoSparklesSet2
	thumb_func_end sub_80F5ED8

	thumb_func_start EvoTask_CreatePreEvoSparklesSet2
EvoTask_CreatePreEvoSparklesSet2: @ 80F5F0C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080F5F50 @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x5F
	bgt _080F5F54
	adds r6, r2, 0
	cmp r0, 0x5
	bgt _080F5F3E
	movs r4, 0
_080F5F2C:
	lsls r0, r4, 28
	lsrs r0, 24
	bl CreatePreEvoSparkleSet2
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _080F5F2C
_080F5F3E:
	ldr r0, _080F5F50 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _080F5F58
	.align 2, 0
_080F5F50: .4byte gTasks
_080F5F54:
	ldr r0, _080F5F60 @ =sub_80F5F64
	str r0, [r1]
_080F5F58:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F5F60: .4byte sub_80F5F64
	thumb_func_end EvoTask_CreatePreEvoSparklesSet2

	thumb_func_start sub_80F5F64
sub_80F5F64: @ 80F5F64
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_80F5F64

	thumb_func_start sub_80F5F74
sub_80F5F74: @ 80F5F74
	push {lr}
	ldr r0, _080F5F88 @ =sub_80F5F8C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080F5F88: .4byte sub_80F5F8C
	thumb_func_end sub_80F5F74

	thumb_func_start sub_80F5F8C
sub_80F5F8C: @ 80F5F8C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl SetEvoSparklesMatrices
	ldr r1, _080F5FB8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _080F5FBC @ =EvoTask_CreatePostEvoSparklesSet1
	str r1, [r0]
	movs r0, 0x5F
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F5FB8: .4byte gTasks
_080F5FBC: .4byte EvoTask_CreatePostEvoSparklesSet1
	thumb_func_end sub_80F5F8C

	thumb_func_start EvoTask_CreatePostEvoSparklesSet1
EvoTask_CreatePostEvoSparklesSet1: @ 80F5FC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080F602C @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x2F
	bgt _080F6030
	adds r6, r2, 0
	cmp r0, 0
	bne _080F5FF4
	movs r4, 0
_080F5FE0:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x4
	bl CreatePostEvoSparkleSet1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080F5FE0
_080F5FF4:
	ldr r0, _080F602C @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	bne _080F601A
	movs r4, 0
_080F6006:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x8
	bl CreatePostEvoSparkleSet1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080F6006
_080F601A:
	ldr r0, _080F602C @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _080F6034
	.align 2, 0
_080F602C: .4byte gTasks
_080F6030:
	ldr r0, _080F603C @ =sub_80F6040
	str r0, [r1]
_080F6034:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F603C: .4byte sub_80F6040
	thumb_func_end EvoTask_CreatePostEvoSparklesSet1

	thumb_func_start sub_80F6040
sub_80F6040: @ 80F6040
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_80F6040

	thumb_func_start LaunchTask_PostEvoSparklesSet2AndFlash
LaunchTask_PostEvoSparklesSet2AndFlash: @ 80F6050
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080F6078 @ =sub_80F6080
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F607C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F6078: .4byte sub_80F6080
_080F607C: .4byte gTasks
	thumb_func_end LaunchTask_PostEvoSparklesSet2AndFlash

	thumb_func_start sub_80F6080
sub_80F6080: @ 80F6080
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl SetEvoSparklesMatrices
	ldr r0, _080F60CC @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	bl sub_80D0474
	ldr r0, _080F60D0 @ =gPlttBufferFaded + 0x40
	ldr r1, _080F60D4 @ =gPlttBufferUnfaded + 0x40
	movs r2, 0x30
	bl CpuSet
	ldr r0, _080F60D8 @ =0xfff90f1c
	ldr r1, _080F60DC @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080F60E0 @ =sub_80F60E4
	str r0, [r5]
	movs r0, 0xC3
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F60CC: .4byte gTasks
_080F60D0: .4byte gPlttBufferFaded + 0x40
_080F60D4: .4byte gPlttBufferUnfaded + 0x40
_080F60D8: .4byte 0xfff90f1c
_080F60DC: .4byte 0x00007fff
_080F60E0: .4byte sub_80F60E4
	thumb_func_end sub_80F6080

	thumb_func_start sub_80F60E4
sub_80F60E4: @ 80F60E4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080F611C @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _080F6160
	adds r0, r2, 0
	cmp r0, 0
	beq _080F6120
	cmp r0, 0x20
	beq _080F6134
	cmp r2, 0x31
	bgt _080F6144
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl CreatePostEvoSparkleSet2
	b _080F6144
	.align 2, 0
_080F611C: .4byte gTasks
_080F6120:
	movs r4, 0
_080F6122:
	adds r0, r4, 0
	bl CreatePostEvoSparkleSet2
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080F6122
	b _080F6144
_080F6134:
	ldr r0, _080F6154 @ =0xffff0f1c
	ldr r1, _080F6158 @ =0x00007fff
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080F6144:
	ldr r0, _080F615C @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _080F6164
	.align 2, 0
_080F6154: .4byte 0xffff0f1c
_080F6158: .4byte 0x00007fff
_080F615C: .4byte gTasks
_080F6160:
	ldr r0, _080F616C @ =sub_80F6170
	str r0, [r1]
_080F6164:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F616C: .4byte sub_80F6170
	thumb_func_end sub_80F60E4

	thumb_func_start sub_80F6170
sub_80F6170: @ 80F6170
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080F618C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F6188
	adds r0, r2, 0
	bl DestroyTask
_080F6188:
	pop {r0}
	bx r0
	.align 2, 0
_080F618C: .4byte gPaletteFade
	thumb_func_end sub_80F6170

	thumb_func_start sub_80F6190
sub_80F6190: @ 80F6190
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080F61B8 @ =sub_80F61C0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F61BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F61B8: .4byte sub_80F61C0
_080F61BC: .4byte gTasks
	thumb_func_end sub_80F6190

	thumb_func_start sub_80F61C0
sub_80F61C0: @ 80F61C0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl SetEvoSparklesMatrices
	ldr r0, _080F620C @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	bl sub_80D0474
	ldr r0, _080F6210 @ =gPlttBufferFaded + 0x40
	ldr r1, _080F6214 @ =gPlttBufferUnfaded + 0x40
	movs r2, 0x30
	bl CpuSet
	ldr r0, _080F6218 @ =0xfff90f00
	ldr r1, _080F621C @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080F6220 @ =sub_80F6224
	str r0, [r5]
	movs r0, 0xC3
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F620C: .4byte gTasks
_080F6210: .4byte gPlttBufferFaded + 0x40
_080F6214: .4byte gPlttBufferUnfaded + 0x40
_080F6218: .4byte 0xfff90f00
_080F621C: .4byte 0x00007fff
_080F6220: .4byte sub_80F6224
	thumb_func_end sub_80F61C0

	thumb_func_start sub_80F6224
sub_80F6224: @ 80F6224
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080F625C @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _080F62A0
	adds r0, r2, 0
	cmp r0, 0
	beq _080F6260
	cmp r0, 0x20
	beq _080F6274
	cmp r2, 0x31
	bgt _080F6284
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl CreatePostEvoSparkleSet2
	b _080F6284
	.align 2, 0
_080F625C: .4byte gTasks
_080F6260:
	movs r4, 0
_080F6262:
	adds r0, r4, 0
	bl CreatePostEvoSparkleSet2
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080F6262
	b _080F6284
_080F6274:
	ldr r0, _080F6294 @ =0xffff0f00
	ldr r1, _080F6298 @ =0x00007fff
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080F6284:
	ldr r0, _080F629C @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _080F62A4
	.align 2, 0
_080F6294: .4byte 0xffff0f00
_080F6298: .4byte 0x00007fff
_080F629C: .4byte gTasks
_080F62A0:
	ldr r0, _080F62AC @ =sub_80F6170
	str r0, [r1]
_080F62A4:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F62AC: .4byte sub_80F6170
	thumb_func_end sub_80F6224

	thumb_func_start nullsub_86
nullsub_86: @ 80F62B0
	bx lr
	thumb_func_end nullsub_86

	thumb_func_start sub_80F62B4
sub_80F62B4: @ 80F62B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	movs r1, 0
	ldr r3, _080F63E8 @ =sub_80F6400
	ldr r2, _080F63EC @ =0x00007fff
_080F62CE:
	lsls r0, r1, 1
	add r0, sp
	adds r0, 0x4
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _080F62CE
	adds r0, r3, 0
	movs r1, 0
	bl CreateTask
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080F63F0 @ =gTasks
	mov r1, r8
	lsls r6, r1, 2
	add r6, r8
	lsls r6, 3
	adds r6, r0
	strh r5, [r6, 0xA]
	strh r7, [r6, 0xC]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r6, 0xE]
	movs r0, 0x10
	strh r0, [r6, 0x10]
	movs r4, 0x80
	lsls r4, 9
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r0, 0x10
	ldrsh r1, [r6, r0]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r1, _080F63F4 @ =gSprites
	mov r9, r1
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	mov r3, r9
	adds r3, 0x1C
	adds r0, r2, r3
	ldr r1, _080F63F8 @ =nullsub_86
	str r1, [r0]
	add r2, r9
	ldrb r1, [r2, 0x1]
	movs r4, 0x4
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x3C
	orrs r0, r1
	strb r0, [r2, 0x3]
	movs r0, 0x3E
	adds r0, r2
	mov r10, r0
	ldrb r1, [r0]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	mov r1, r10
	strb r0, [r1]
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	lsls r1, 5
	ldr r0, _080F63FC @ =gPlttBufferFaded + 0x200
	mov r10, r0
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	str r3, [sp, 0x24]
	bl CpuSet
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	ldr r3, [sp, 0x24]
	adds r3, r1, r3
	ldr r0, _080F63F8 @ =nullsub_86
	str r0, [r3]
	add r1, r9
	ldrb r0, [r1, 0x1]
	ands r4, r0
	movs r0, 0x1
	orrs r4, r0
	strb r4, [r1, 0x1]
	ldrb r0, [r1, 0x3]
	movs r2, 0x3E
	orrs r0, r2
	strb r0, [r1, 0x3]
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	ands r5, r0
	strb r5, [r2]
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	lsls r1, 5
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	bl CpuSet
	movs r1, 0
	strh r1, [r6, 0x18]
	mov r0, r8
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F63E8: .4byte sub_80F6400
_080F63EC: .4byte 0x00007fff
_080F63F0: .4byte gTasks
_080F63F4: .4byte gSprites
_080F63F8: .4byte nullsub_86
_080F63FC: .4byte gPlttBufferFaded + 0x200
	thumb_func_end sub_80F62B4

	thumb_func_start sub_80F6400
sub_80F6400: @ 80F6400
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F641C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x12]
	movs r0, 0x8
	strh r0, [r1, 0x14]
	ldr r0, _080F6420 @ =sub_80F6424
	str r0, [r1]
	bx lr
	.align 2, 0
_080F641C: .4byte gTasks
_080F6420: .4byte sub_80F6424
	thumb_func_end sub_80F6400

	thumb_func_start sub_80F6424
sub_80F6424: @ 80F6424
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _080F6444 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x18
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080F6448
	adds r0, r3, 0
	bl PreEvoVisible_PostEvoInvisible_KillTask
	b _080F646A
	.align 2, 0
_080F6444: .4byte gTasks
_080F6448:
	ldrh r1, [r2, 0x14]
	movs r4, 0x14
	ldrsh r0, [r2, r4]
	cmp r0, 0x80
	bne _080F645A
	adds r0, r3, 0
	bl PreEvoInvisible_PostEvoVisible_KillTask
	b _080F646A
_080F645A:
	adds r0, r1, 0x2
	strh r0, [r2, 0x14]
	ldrh r0, [r2, 0x12]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r2, 0x12]
	ldr r0, _080F6470 @ =sub_80F6474
	str r0, [r2]
_080F646A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6470: .4byte sub_80F6474
	thumb_func_end sub_80F6424

	thumb_func_start sub_80F6474
sub_80F6474: @ 80F6474
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080F6498 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x18
	ldrsh r0, [r2, r3]
	adds r5, r1, 0
	cmp r0, 0
	beq _080F64A0
	ldr r0, _080F649C @ =PreEvoVisible_PostEvoInvisible_KillTask
	str r0, [r2]
	b _080F6584
	.align 2, 0
_080F6498: .4byte gTasks
_080F649C: .4byte PreEvoVisible_PostEvoInvisible_KillTask
_080F64A0:
	movs r6, 0
	movs r7, 0x12
	ldrsh r0, [r2, r7]
	cmp r0, 0
	bne _080F64F0
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _080F64C6
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0xE]
	adds r0, r7
	strh r0, [r2, 0xE]
	b _080F64CA
_080F64C6:
	strh r3, [r2, 0xE]
	movs r6, 0x1
_080F64CA:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0x10
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _080F64EA
	ldrh r0, [r3, 0x10]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0x10]
	b _080F653A
_080F64EA:
	movs r0, 0x10
	strh r0, [r3, 0x10]
	b _080F6534
_080F64F0:
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _080F650C
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0x10]
	adds r0, r7
	strh r0, [r2, 0x10]
	b _080F6510
_080F650C:
	strh r3, [r2, 0x10]
	movs r6, 0x1
_080F6510:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _080F6530
	ldrh r0, [r3, 0xE]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0xE]
	b _080F653A
_080F6530:
	movs r0, 0x10
	strh r0, [r3, 0xE]
_080F6534:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080F653A:
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r5
	movs r0, 0xE
	ldrsh r1, [r5, r0]
	movs r4, 0x80
	lsls r4, 9
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r3, 0x10
	ldrsh r1, [r5, r3]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	cmp r6, 0x2
	bne _080F6584
	ldr r0, _080F658C @ =sub_80F6424
	str r0, [r5]
_080F6584:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F658C: .4byte sub_80F6424
	thumb_func_end sub_80F6474

	thumb_func_start PreEvoInvisible_PostEvoVisible_KillTask
PreEvoInvisible_PostEvoVisible_KillTask: @ 80F6590
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080F6638 @ =gSprites
	mov r8, r1
	ldr r1, _080F663C @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F6638: .4byte gSprites
_080F663C: .4byte gTasks
	thumb_func_end PreEvoInvisible_PostEvoVisible_KillTask

	thumb_func_start PreEvoVisible_PostEvoInvisible_KillTask
PreEvoVisible_PostEvoInvisible_KillTask: @ 80F6640
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080F66E8 @ =gSprites
	mov r8, r1
	ldr r1, _080F66EC @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F66E8: .4byte gSprites
_080F66EC: .4byte gTasks
	thumb_func_end PreEvoVisible_PostEvoInvisible_KillTask

	.align 2, 0 @ Don't pad with nop.
