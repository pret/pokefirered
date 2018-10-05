	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8133904
sub_8133904: @ 8133904
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08133916
	cmp r0, 0x1
	beq _0813392A
	b _08133984
_08133916:
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08133984
_0813392A:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813393A
	cmp r0, 0x1
	beq _08133960
	ldrh r2, [r4, 0x38]
	b _0813397E
_0813393A:
	movs r0, 0x34
	ldrsh r3, [r4, r0]
	ldr r1, _0813395C @ =gUnknown_825E074
	ldrh r2, [r4, 0x38]
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	muls r0, r3
	cmp r0, 0
	bge _08133954
	adds r0, 0xFF
_08133954:
	asrs r0, 8
	strh r0, [r4, 0x24]
	b _0813397E
	.align 2, 0
_0813395C: .4byte gUnknown_825E074
_08133960:
	movs r0, 0x34
	ldrsh r3, [r4, r0]
	ldr r1, _0813398C @ =gUnknown_825E074
	ldrh r2, [r4, 0x38]
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	muls r0, r3
	cmp r0, 0
	bge _0813397A
	adds r0, 0xFF
_0813397A:
	asrs r0, 8
	strh r0, [r4, 0x26]
_0813397E:
	ldrh r0, [r4, 0x36]
	adds r0, r2, r0
	strh r0, [r4, 0x38]
_08133984:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813398C: .4byte gUnknown_825E074
	thumb_func_end sub_8133904

	thumb_func_start AddScrollIndicatorArrowObject
AddScrollIndicatorArrowObject: @ 8133990
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	adds r6, r0, 0
	ldr r5, [sp, 0x30]
	lsls r6, 24
	lsrs r6, 24
	mov r8, r6
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r5, 16
	lsrs r5, 16
	mov r12, r5
	mov r4, sp
	ldr r0, _08133A14 @ =gUnknown_84632A4
	ldm r0!, {r5-r7}
	stm r4!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r4!, {r5-r7}
	mov r0, sp
	movs r4, 0
	strh r3, [r0]
	mov r3, r12
	strh r3, [r0, 0x2]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08133A18 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r1
	adds r5, r3, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r5]
	strh r4, [r3, 0x2E]
	ldr r1, _08133A1C @ =gUnknown_846325C
	mov r5, r8
	lsls r6, r5, 2
	adds r6, r1
	ldrb r2, [r6]
	lsls r1, r2, 28
	lsrs r1, 28
	strh r1, [r3, 0x30]
	lsrs r2, 4
	strh r2, [r3, 0x32]
	ldrb r1, [r6, 0x1]
	strh r1, [r3, 0x34]
	ldrh r1, [r6, 0x2]
	strh r1, [r3, 0x36]
	strh r4, [r3, 0x38]
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08133A14: .4byte gUnknown_84632A4
_08133A18: .4byte gSprites
_08133A1C: .4byte gUnknown_846325C
	thumb_func_end AddScrollIndicatorArrowObject

	thumb_func_start AddScrollIndicatorArrowPair
AddScrollIndicatorArrowPair: @ 8133A20
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	adds r6, r0, 0
	mov r9, r1
	ldr r0, _08133A6C @ =gUnknown_8463328
	str r0, [sp, 0x4]
	ldr r5, _08133A70 @ =0xffff0000
	ldr r0, [sp, 0x8]
	ands r0, r5
	movs r1, 0x80
	lsls r1, 1
	orrs r0, r1
	ldrh r1, [r6, 0xA]
	lsls r1, 16
	ldr r4, _08133A74 @ =0x0000ffff
	ands r0, r4
	orrs r0, r1
	str r0, [sp, 0x8]
	add r0, sp, 0x4
	bl LoadCompressedObjectPic
	ldrh r2, [r6, 0xC]
	cmp r2, r4
	bne _08133A7C
	ldr r0, _08133A78 @ =gUnknown_8463308
	ldrb r1, [r6, 0xE]
	lsls r1, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	b _08133A8E
	.align 2, 0
_08133A6C: .4byte gUnknown_8463328
_08133A70: .4byte 0xffff0000
_08133A74: .4byte 0x0000ffff
_08133A78: .4byte gUnknown_8463308
_08133A7C:
	ldr r0, _08133B2C @ =gUnknown_8463308
	str r0, [sp, 0xC]
	add r0, sp, 0xC
	ldr r1, [r0, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpritePalette
_08133A8E:
	ldr r0, _08133B30 @ =sub_8133BA4
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _08133B34 @ =gTasks+0x8
	adds r7, r0, r1
	movs r0, 0
	strb r0, [r7]
	mov r0, r9
	str r0, [r7, 0x4]
	ldrh r0, [r6, 0x6]
	strh r0, [r7, 0x8]
	ldrh r0, [r6, 0x8]
	strh r0, [r7, 0xA]
	ldrh r0, [r6, 0xA]
	strh r0, [r7, 0xE]
	ldrh r0, [r6, 0xC]
	strh r0, [r7, 0x10]
	ldrb r0, [r6]
	ldrb r1, [r6, 0x1]
	ldrb r2, [r6, 0x2]
	ldrh r3, [r6, 0xA]
	ldrh r4, [r6, 0xC]
	str r4, [sp]
	bl AddScrollIndicatorArrowObject
	strb r0, [r7, 0xC]
	ldrb r0, [r6, 0x3]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x5]
	ldrh r3, [r6, 0xA]
	ldrh r4, [r6, 0xC]
	str r4, [sp]
	bl AddScrollIndicatorArrowObject
	strb r0, [r7, 0xD]
	ldrh r1, [r6, 0xC]
	ldr r0, _08133B38 @ =0x0000ffff
	cmp r1, r0
	bne _08133B1C
	ldr r5, _08133B3C @ =gSprites
	ldrb r0, [r7, 0xC]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r6, 0xE]
	lsls r3, 4
	ldrb r4, [r1, 0x5]
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r4
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r7, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r6, 0xE]
	lsls r1, 4
	ldrb r3, [r0, 0x5]
	ands r2, r3
	orrs r2, r1
	strb r2, [r0, 0x5]
_08133B1C:
	mov r0, r8
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08133B2C: .4byte gUnknown_8463308
_08133B30: .4byte sub_8133BA4
_08133B34: .4byte gTasks+0x8
_08133B38: .4byte 0x0000ffff
_08133B3C: .4byte gSprites
	thumb_func_end AddScrollIndicatorArrowPair

	thumb_func_start AddScrollIndicatorArrowPairParametrized
AddScrollIndicatorArrowPairParametrized: @ 8133B40
	push {r4,lr}
	adds r4, r1, 0
	subs r0, 0x2
	cmp r0, 0x1
	bhi _08133B64
	ldr r0, _08133B60 @ =gUnknown_203B130
	movs r1, 0x2
	strb r1, [r0]
	strb r4, [r0, 0x1]
	strb r2, [r0, 0x2]
	movs r1, 0x3
	strb r1, [r0, 0x3]
	strb r4, [r0, 0x4]
	strb r3, [r0, 0x5]
	b _08133B76
	.align 2, 0
_08133B60: .4byte gUnknown_203B130
_08133B64:
	ldr r0, _08133BA0 @ =gUnknown_203B130
	movs r1, 0
	strb r1, [r0]
	strb r2, [r0, 0x1]
	strb r4, [r0, 0x2]
	movs r1, 0x1
	strb r1, [r0, 0x3]
	strb r3, [r0, 0x4]
	strb r4, [r0, 0x5]
_08133B76:
	adds r2, r0, 0
	movs r1, 0
	movs r0, 0
	strh r0, [r2, 0x6]
	ldr r0, [sp, 0x8]
	strh r0, [r2, 0x8]
	ldr r0, [sp, 0xC]
	strh r0, [r2, 0xA]
	ldr r0, [sp, 0x10]
	strh r0, [r2, 0xC]
	strb r1, [r2, 0xE]
	adds r0, r2, 0
	ldr r1, [sp, 0x14]
	bl AddScrollIndicatorArrowPair
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08133BA0: .4byte gUnknown_203B130
	thumb_func_end AddScrollIndicatorArrowPairParametrized

	thumb_func_start sub_8133BA4
sub_8133BA4: @ 8133BA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08133BD4 @ =gTasks+0x8
	adds r4, r1, r0
	ldr r0, [r4, 0x4]
	ldrh r5, [r0]
	ldrh r0, [r4, 0x8]
	cmp r5, r0
	bne _08133BDC
	ldr r3, _08133BD8 @ =gSprites
	ldrb r1, [r4, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	b _08133BF2
	.align 2, 0
_08133BD4: .4byte gTasks+0x8
_08133BD8: .4byte gSprites
_08133BDC:
	ldr r3, _08133C10 @ =gSprites
	ldrb r1, [r4, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
_08133BF2:
	strb r1, [r0]
	ldrh r0, [r4, 0xA]
	cmp r5, r0
	bne _08133C14
	ldrb r1, [r4, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	b _08133C28
	.align 2, 0
_08133C10: .4byte gSprites
_08133C14:
	ldrb r1, [r4, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
_08133C28:
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8133BA4

	thumb_func_start RemoveScrollIndicatorArrowPair
RemoveScrollIndicatorArrowPair: @ 8133C30
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08133C84 @ =gTasks+0x8
	adds r5, r0, r1
	ldrh r0, [r5, 0xE]
	ldr r4, _08133C88 @ =0x0000ffff
	cmp r0, r4
	beq _08133C4E
	bl FreeSpriteTilesByTag
_08133C4E:
	ldrh r0, [r5, 0x10]
	cmp r0, r4
	beq _08133C58
	bl FreeSpritePaletteByTag
_08133C58:
	ldrb r1, [r5, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08133C8C @ =gSprites
	adds r0, r4
	bl DestroySprite
	ldrb r1, [r5, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r0, r6, 0
	bl DestroyTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08133C84: .4byte gTasks+0x8
_08133C88: .4byte 0x0000ffff
_08133C8C: .4byte gSprites
	thumb_func_end RemoveScrollIndicatorArrowPair

	thumb_func_start ListMenuAddCursorObjectInternal
ListMenuAddCursorObjectInternal: @ 8133C90
	push {lr}
	cmp r1, 0
	beq _08133C9A
	cmp r1, 0x1
	beq _08133CA0
_08133C9A:
	bl ListMenuAddRedOutlineCursorObject
	b _08133CA4
_08133CA0:
	bl ListMenuAddRedArrowCursorObject
_08133CA4:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end ListMenuAddCursorObjectInternal

	thumb_func_start ListMenuUpdateCursorObject
ListMenuUpdateCursorObject: @ 8133CAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r3, 0
	beq _08133CC4
	cmp r3, 0x1
	beq _08133CCA
	b _08133CCE
_08133CC4:
	bl ListMenuUpdateRedOutlineCursorObject
	b _08133CCE
_08133CCA:
	bl ListMenuUpdateRedArrowCursorObject
_08133CCE:
	pop {r0}
	bx r0
	thumb_func_end ListMenuUpdateCursorObject

	thumb_func_start ListMenuRemoveCursorObject
ListMenuRemoveCursorObject: @ 8133CD4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r1, 0
	beq _08133CE4
	cmp r1, 0x1
	beq _08133CEA
	b _08133CEE
_08133CE4:
	bl ListMenuRemoveRedOutlineCursorObject
	b _08133CEE
_08133CEA:
	bl ListMenuRemoveRedArrowCursorObject
_08133CEE:
	pop {r0}
	bx r0
	thumb_func_end ListMenuRemoveCursorObject

	thumb_func_start nullsub_94
nullsub_94: @ 8133CF4
	bx lr
	thumb_func_end nullsub_94

	thumb_func_start ListMenuGetRedOutlineCursorSpriteCount
ListMenuGetRedOutlineCursorSpriteCount: @ 8133CF8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0x4
	cmp r0, 0x10
	bls _08133D18
	movs r2, 0x8
	subs r0, 0x8
	cmp r2, r0
	bge _08133D18
_08133D10:
	adds r3, 0x2
	adds r2, 0x8
	cmp r2, r0
	blt _08133D10
_08133D18:
	cmp r1, 0x10
	bls _08133D2C
	movs r2, 0x8
	subs r1, 0x8
	cmp r2, r1
	bge _08133D2C
_08133D24:
	adds r3, 0x2
	adds r2, 0x8
	cmp r2, r1
	blt _08133D24
_08133D2C:
	lsls r0, r3, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end ListMenuGetRedOutlineCursorSpriteCount

	thumb_func_start ListMenuSetUpRedOutlineCursorSpriteOamTable
ListMenuSetUpRedOutlineCursorSpriteOamTable: @ 8133D34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r3, r2, 0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldr r0, _08133E18 @ =gUnknown_84632BC
	ldr r0, [r0]
	str r0, [r3]
	movs r1, 0x88
	strb r1, [r3]
	strb r1, [r3, 0x1]
	ldr r0, _08133E1C @ =gUnknown_84632C0
	ldr r0, [r0]
	str r0, [r3, 0x4]
	mov r2, r8
	adds r2, 0x80
	strb r2, [r3, 0x4]
	strb r1, [r3, 0x5]
	ldr r0, _08133E20 @ =gUnknown_84632D4
	ldr r0, [r0]
	str r0, [r3, 0x8]
	strb r1, [r3, 0x8]
	mov r4, r9
	adds r4, 0x80
	strb r4, [r3, 0x9]
	ldr r0, _08133E24 @ =gUnknown_84632D8
	ldr r0, [r0]
	str r0, [r3, 0xC]
	strb r2, [r3, 0xC]
	strb r4, [r3, 0xD]
	movs r0, 0x4
	mov r12, r0
	mov r2, r8
	cmp r2, 0x10
	bls _08133DC8
	movs r2, 0x8
	mov r5, r8
	subs r5, 0x8
	cmp r2, r5
	bge _08133DC8
	ldr r0, _08133E28 @ =gUnknown_84632C4
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _08133E2C @ =gUnknown_84632D0
	ldr r6, [r0]
	adds r1, r3, 0
	adds r1, 0x10
	movs r7, 0x88
	mov r10, r7
_08133DA6:
	ldr r0, [sp]
	str r0, [r1]
	adds r0, r2, 0
	subs r0, 0x78
	strb r0, [r1]
	mov r7, r10
	strb r7, [r1, 0x1]
	adds r1, 0x4
	str r6, [r1]
	strb r0, [r1]
	strb r4, [r1, 0x1]
	adds r1, 0x4
	movs r0, 0x2
	add r12, r0
	adds r2, 0x8
	cmp r2, r5
	blt _08133DA6
_08133DC8:
	mov r2, r9
	cmp r2, 0x10
	bls _08133E06
	movs r1, 0x8
	mov r4, r9
	subs r4, 0x8
	cmp r1, r4
	bge _08133E06
	ldr r0, _08133E30 @ =gUnknown_84632C8
	ldr r6, [r0]
	ldr r0, _08133E34 @ =gUnknown_84632CC
	ldr r5, [r0]
	mov r7, r12
	lsls r0, r7, 2
	adds r2, r0, r3
	movs r7, 0x88
	mov r3, r8
	adds r3, 0x80
_08133DEC:
	str r6, [r2]
	strb r7, [r2]
	adds r0, r1, 0
	subs r0, 0x78
	strb r0, [r2, 0x1]
	adds r2, 0x4
	str r5, [r2]
	strb r3, [r2]
	strb r0, [r2, 0x1]
	adds r2, 0x4
	adds r1, 0x8
	cmp r1, r4
	blt _08133DEC
_08133E06:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133E18: .4byte gUnknown_84632BC
_08133E1C: .4byte gUnknown_84632C0
_08133E20: .4byte gUnknown_84632D4
_08133E24: .4byte gUnknown_84632D8
_08133E28: .4byte gUnknown_84632C4
_08133E2C: .4byte gUnknown_84632D0
_08133E30: .4byte gUnknown_84632C8
_08133E34: .4byte gUnknown_84632CC
	thumb_func_end ListMenuSetUpRedOutlineCursorSpriteOamTable

	thumb_func_start ListMenuAddRedOutlineCursorObject
ListMenuAddRedOutlineCursorObject: @ 8133E38
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	adds r6, r0, 0
	ldr r0, _08133E84 @ =gUnknown_8463398
	str r0, [sp, 0x18]
	ldr r5, _08133E88 @ =0xffff0000
	add r0, sp, 0x18
	ldr r1, [r0, 0x4]
	ands r1, r5
	movs r2, 0x80
	lsls r2, 1
	orrs r1, r2
	ldrh r2, [r6, 0x6]
	lsls r2, 16
	ldr r3, _08133E8C @ =0x0000ffff
	ands r1, r3
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadCompressedObjectPic
	ldrh r2, [r6, 0x8]
	ldr r7, _08133E8C @ =0x0000ffff
	cmp r2, r7
	bne _08133E94
	ldr r0, _08133E90 @ =gUnknown_8463308
	ldrb r1, [r6, 0xA]
	lsls r1, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	b _08133EA6
	.align 2, 0
_08133E84: .4byte gUnknown_8463398
_08133E88: .4byte 0xffff0000
_08133E8C: .4byte 0x0000ffff
_08133E90: .4byte gUnknown_8463308
_08133E94:
	ldr r0, _08133F8C @ =gUnknown_8463308
	str r0, [sp, 0x20]
	add r0, sp, 0x20
	ldr r1, [r0, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpritePalette
_08133EA6:
	ldr r0, _08133F90 @ =nullsub_94
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08133F94 @ =gTasks+0x8
	adds r5, r0, r1
	ldrh r0, [r6, 0x6]
	movs r3, 0
	mov r8, r3
	strh r0, [r5, 0xE]
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x10]
	ldrh r0, [r6, 0x2]
	ldrh r1, [r6, 0x4]
	bl ListMenuGetRedOutlineCursorSpriteCount
	strb r0, [r5]
	ldrb r0, [r5]
	lsls r0, 2
	bl Alloc
	adds r2, r0, 0
	str r2, [r5, 0x8]
	str r2, [r5, 0x4]
	ldrh r0, [r6, 0x2]
	ldrh r1, [r6, 0x4]
	bl ListMenuSetUpRedOutlineCursorSpriteOamTable
	mov r1, sp
	ldr r0, _08133F98 @ =gDummySpriteTemplate
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	mov r1, sp
	ldrh r0, [r6, 0x6]
	strh r0, [r1]
	ldrh r0, [r6, 0x8]
	strh r0, [r1, 0x2]
	ldrb r1, [r6]
	adds r1, 0x78
	ldrb r2, [r6, 0x1]
	adds r2, 0x78
	mov r0, sp
	movs r3, 0
	bl CreateSprite
	strb r0, [r5, 0xC]
	ldrb r1, [r5, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r7, _08133F9C @ =gSprites
	adds r0, r7
	adds r1, r5, 0
	bl SetSubspriteTables
	ldrb r0, [r5, 0xC]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	ldrb r1, [r5, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x43
	mov r1, r8
	strb r1, [r0]
	ldrb r1, [r5, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x42
	ldrb r2, [r0]
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrh r1, [r6, 0x8]
	ldr r0, _08133FA0 @ =0x0000ffff
	cmp r1, r0
	bne _08133F7E
	ldrb r0, [r5, 0xC]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r6, 0xA]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_08133F7E:
	adds r0, r4, 0
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08133F8C: .4byte gUnknown_8463308
_08133F90: .4byte nullsub_94
_08133F94: .4byte gTasks+0x8
_08133F98: .4byte gDummySpriteTemplate
_08133F9C: .4byte gSprites
_08133FA0: .4byte 0x0000ffff
	thumb_func_end ListMenuAddRedOutlineCursorObject

	thumb_func_start ListMenuUpdateRedOutlineCursorObject
ListMenuUpdateRedOutlineCursorObject: @ 8133FA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	ldr r0, _08133FE0 @ =gTasks+0x8
	adds r3, r0
	ldr r5, _08133FE4 @ =gSprites
	ldrb r4, [r3, 0xC]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	adds r1, 0x78
	strh r1, [r0, 0x20]
	ldrb r1, [r3, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r2, 0x78
	strh r2, [r0, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08133FE0: .4byte gTasks+0x8
_08133FE4: .4byte gSprites
	thumb_func_end ListMenuUpdateRedOutlineCursorObject

	thumb_func_start ListMenuRemoveRedOutlineCursorObject
ListMenuRemoveRedOutlineCursorObject: @ 8133FE8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08134034 @ =gTasks+0x8
	adds r4, r0, r1
	ldr r0, [r4, 0x8]
	bl Free
	ldrh r0, [r4, 0xE]
	ldr r6, _08134038 @ =0x0000ffff
	cmp r0, r6
	beq _0813400C
	bl FreeSpriteTilesByTag
_0813400C:
	ldrh r0, [r4, 0x10]
	cmp r0, r6
	beq _08134016
	bl FreeSpritePaletteByTag
_08134016:
	ldrb r1, [r4, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813403C @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0
	bl DestroyTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08134034: .4byte gTasks+0x8
_08134038: .4byte 0x0000ffff
_0813403C: .4byte gSprites
	thumb_func_end ListMenuRemoveRedOutlineCursorObject

	thumb_func_start ObjectCB_RedArrowCursor
ObjectCB_RedArrowCursor: @ 8134040
	push {lr}
	adds r2, r0, 0
	ldr r1, _08134068 @ =gUnknown_825E074
	ldrh r3, [r2, 0x2E]
	lsls r0, r3, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _08134058
	adds r0, 0x3F
_08134058:
	asrs r0, 6
	strh r0, [r2, 0x24]
	adds r0, r3, 0
	adds r0, 0x8
	strh r0, [r2, 0x2E]
	pop {r0}
	bx r0
	.align 2, 0
_08134068: .4byte gUnknown_825E074
	thumb_func_end ObjectCB_RedArrowCursor

	thumb_func_start nullsub_95
nullsub_95: @ 813406C
	bx lr
	thumb_func_end nullsub_95

	thumb_func_start ListMenuAddRedArrowCursorObject
ListMenuAddRedArrowCursorObject: @ 8134070
	push {r4-r7,lr}
	sub sp, 0x28
	adds r5, r0, 0
	ldr r0, _081340B4 @ =gUnknown_84633D8
	str r0, [sp, 0x18]
	ldr r6, _081340B8 @ =0xffff0000
	add r0, sp, 0x18
	ldr r1, [r0, 0x4]
	ands r1, r6
	movs r2, 0x80
	orrs r1, r2
	ldrh r2, [r5, 0x6]
	lsls r2, 16
	ldr r4, _081340BC @ =0x0000ffff
	ands r1, r4
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadCompressedObjectPic
	ldrh r2, [r5, 0x8]
	cmp r2, r4
	bne _081340C4
	ldr r0, _081340C0 @ =gUnknown_8463308
	ldrb r1, [r5, 0xA]
	lsls r1, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	b _081340D6
	.align 2, 0
_081340B4: .4byte gUnknown_84633D8
_081340B8: .4byte 0xffff0000
_081340BC: .4byte 0x0000ffff
_081340C0: .4byte gUnknown_8463308
_081340C4:
	ldr r0, _08134160 @ =gUnknown_8463308
	str r0, [sp, 0x20]
	add r0, sp, 0x20
	ldr r1, [r0, 0x4]
	ands r1, r6
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpritePalette
_081340D6:
	ldr r0, _08134164 @ =nullsub_95
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08134168 @ =gTasks+0x8
	adds r4, r0, r1
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x4]
	mov r1, sp
	ldr r0, _0813416C @ =gUnknown_84632F0
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	mov r1, sp
	ldrh r0, [r5, 0x6]
	strh r0, [r1]
	ldrh r0, [r5, 0x8]
	strh r0, [r1, 0x2]
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	mov r0, sp
	movs r3, 0
	bl CreateSprite
	strb r0, [r4]
	ldr r3, _08134170 @ =gSprites
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r2, 0x8
	strh r2, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x26]
	ldrh r1, [r5, 0x8]
	ldr r0, _08134174 @ =0x0000ffff
	cmp r1, r0
	bne _08134156
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0xA]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_08134156:
	adds r0, r6, 0
	add sp, 0x28
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08134160: .4byte gUnknown_8463308
_08134164: .4byte nullsub_95
_08134168: .4byte gTasks+0x8
_0813416C: .4byte gUnknown_84632F0
_08134170: .4byte gSprites
_08134174: .4byte 0x0000ffff
	thumb_func_end ListMenuAddRedArrowCursorObject

	thumb_func_start ListMenuUpdateRedArrowCursorObject
ListMenuUpdateRedArrowCursorObject: @ 8134178
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	ldr r0, _081341A8 @ =gTasks+0x8
	adds r3, r0
	ldr r5, _081341AC @ =gSprites
	ldrb r4, [r3]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	strh r1, [r0, 0x20]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081341A8: .4byte gTasks+0x8
_081341AC: .4byte gSprites
	thumb_func_end ListMenuUpdateRedArrowCursorObject

	thumb_func_start ListMenuRemoveRedArrowCursorObject
ListMenuRemoveRedArrowCursorObject: @ 81341B0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081341F4 @ =gTasks+0x8
	adds r4, r0, r1
	ldrh r0, [r4, 0x2]
	ldr r6, _081341F8 @ =0x0000ffff
	cmp r0, r6
	beq _081341CE
	bl FreeSpriteTilesByTag
_081341CE:
	ldrh r0, [r4, 0x4]
	cmp r0, r6
	beq _081341D8
	bl FreeSpritePaletteByTag
_081341D8:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081341FC @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0
	bl DestroyTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081341F4: .4byte gTasks+0x8
_081341F8: .4byte 0x0000ffff
_081341FC: .4byte gSprites
	thumb_func_end ListMenuRemoveRedArrowCursorObject

	.align 2, 0 @ Don't pad with nop.
