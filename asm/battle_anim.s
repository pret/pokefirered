	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ClearBattleAnimationVars
ClearBattleAnimationVars: @ 80724C0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08072554 @ =gUnknown_2037EE0
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08072558 @ =gUnknown_2037EE1
	strb r1, [r0]
	ldr r0, _0807255C @ =gUnknown_2037EE2
	strb r1, [r0]
	ldr r0, _08072560 @ =gUnknown_2037EE3
	strb r1, [r0]
	ldr r0, _08072564 @ =gUnknown_2037EE4
	movs r1, 0
	str r1, [r0]
	ldr r0, _08072568 @ =gUnknown_2037EE8
	str r1, [r0]
	ldr r0, _0807256C @ =gUnknown_2037EEC
	movs r2, 0
	strh r1, [r0]
	ldr r0, _08072570 @ =gUnknown_2037EFE
	strb r2, [r0]
	ldr r4, _08072574 @ =gUnknown_2037F14
	ldr r5, _08072578 @ =gUnknown_2037F16
	ldr r6, _0807257C @ =gUnknown_2037F17
	ldr r7, _08072580 @ =gUnknown_2037F18
	ldr r0, _08072584 @ =gUnknown_2037F1A
	mov r12, r0
	ldr r1, _08072588 @ =gUnknown_2037F1B
	mov r8, r1
	ldr r0, _0807258C @ =gUnknown_2037F24
	mov r9, r0
	ldr r1, _08072590 @ =0x0000ffff
	adds r3, r1, 0
	ldr r1, _08072594 @ =gUnknown_2037EEE
	movs r2, 0x7
_0807250A:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0807250A
	ldr r1, _08072598 @ =gUnknown_2037F02
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xE
_08072520:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _08072520
	movs r1, 0
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4, 0x1]
	strb r1, [r5]
	strb r1, [r6]
	movs r0, 0
	strh r1, [r7]
	mov r1, r12
	strb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	mov r1, r9
	strb r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072554: .4byte gUnknown_2037EE0
_08072558: .4byte gUnknown_2037EE1
_0807255C: .4byte gUnknown_2037EE2
_08072560: .4byte gUnknown_2037EE3
_08072564: .4byte gUnknown_2037EE4
_08072568: .4byte gUnknown_2037EE8
_0807256C: .4byte gUnknown_2037EEC
_08072570: .4byte gUnknown_2037EFE
_08072574: .4byte gUnknown_2037F14
_08072578: .4byte gUnknown_2037F16
_0807257C: .4byte gUnknown_2037F17
_08072580: .4byte gUnknown_2037F18
_08072584: .4byte gUnknown_2037F1A
_08072588: .4byte gUnknown_2037F1B
_0807258C: .4byte gUnknown_2037F24
_08072590: .4byte 0x0000ffff
_08072594: .4byte gUnknown_2037EEE
_08072598: .4byte gUnknown_2037F02
	thumb_func_end ClearBattleAnimationVars

	thumb_func_start DoMoveAnim
DoMoveAnim: @ 807259C
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080725C0 @ =gUnknown_2037F1A
	ldr r0, _080725C4 @ =gUnknown_2023D6B
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, _080725C8 @ =gUnknown_2037F1B
	ldr r0, _080725CC @ =gUnknown_2023D6C
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _080725D0 @ =gUnknown_81C68F4
	movs r2, 0x1
	bl sub_80725D4
	pop {r0}
	bx r0
	.align 2, 0
_080725C0: .4byte gUnknown_2037F1A
_080725C4: .4byte gUnknown_2023D6B
_080725C8: .4byte gUnknown_2037F1B
_080725CC: .4byte gUnknown_2023D6C
_080725D0: .4byte gUnknown_81C68F4
	thumb_func_end DoMoveAnim

	thumb_func_start sub_80725D4
sub_80725D4: @ 80725D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	bl sub_80767F0
	movs r0, 0
	bl UpdateOamPriorityInAllHealthboxes
	movs r4, 0
	ldr r6, _08072618 @ =gUnknown_2023BCE
	movs r7, 0x64
	ldr r5, _0807261C @ =gUnknown_2037F1C
_08072600:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08072624
	ldrh r0, [r6]
	muls r0, r7
	ldr r1, _08072620 @ =gUnknown_202402C
	b _0807262A
	.align 2, 0
_08072618: .4byte gUnknown_2023BCE
_0807261C: .4byte gUnknown_2037F1C
_08072620: .4byte gUnknown_202402C
_08072624:
	ldrh r0, [r6]
	muls r0, r7
	ldr r1, _0807264C @ =gUnknown_2024284
_0807262A:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	strh r0, [r5]
	adds r6, 0x2
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _08072600
	mov r0, r9
	cmp r0, 0
	bne _08072654
	ldr r0, _08072650 @ =gUnknown_2037F18
	mov r1, r9
	b _08072658
	.align 2, 0
_0807264C: .4byte gUnknown_2024284
_08072650: .4byte gUnknown_2037F18
_08072654:
	ldr r0, _080726C0 @ =gUnknown_2037F18
	mov r1, r8
_08072658:
	strh r1, [r0]
	ldr r4, _080726C4 @ =gUnknown_2037F14
	ldr r5, _080726C8 @ =gUnknown_2037ED4
	mov r0, r8
	lsls r3, r0, 2
	ldr r6, _080726CC @ =gUnknown_2037EE1
	ldr r1, _080726D0 @ =gUnknown_2037EE0
	mov r12, r1
	ldr r0, _080726D4 @ =gUnknown_2037EDC
	mov r10, r0
	ldr r7, _080726D8 @ =RunAnimScriptCommand
	ldr r1, _080726DC @ =gUnknown_2037F02
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xE
_08072676:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _08072676
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4, 0x1]
	ldr r1, [sp]
	adds r0, r3, r1
	ldr r0, [r0]
	str r0, [r5]
	movs r0, 0x1
	strb r0, [r6]
	movs r0, 0
	mov r1, r12
	strb r0, [r1]
	mov r0, r10
	str r7, [r0]
	ldr r1, _080726E0 @ =0x0000ffff
	adds r2, r1, 0
	ldr r1, _080726E4 @ =gUnknown_2037EEE
	movs r4, 0x7
_080726A6:
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080726A6
	mov r0, r9
	cmp r0, 0
	beq _08072706
	movs r4, 0
	ldr r2, _080726E8 @ =gUnknown_81C68EC
	b _080726EE
	.align 2, 0
_080726C0: .4byte gUnknown_2037F18
_080726C4: .4byte gUnknown_2037F14
_080726C8: .4byte gUnknown_2037ED4
_080726CC: .4byte gUnknown_2037EE1
_080726D0: .4byte gUnknown_2037EE0
_080726D4: .4byte gUnknown_2037EDC
_080726D8: .4byte RunAnimScriptCommand
_080726DC: .4byte gUnknown_2037F02
_080726E0: .4byte 0x0000ffff
_080726E4: .4byte gUnknown_2037EEE
_080726E8: .4byte gUnknown_81C68EC
_080726EC:
	adds r4, 0x1
_080726EE:
	lsls r0, r4, 1
	adds r0, r2
	ldrh r0, [r0]
	ldr r1, _08072728 @ =0x0000ffff
	cmp r0, r1
	beq _08072706
	cmp r8, r0
	bne _080726EC
	ldr r0, _0807272C @ =gMPlay_BGM
	movs r2, 0x80
	bl m4aMPlayVolumeControl
_08072706:
	ldr r0, _08072730 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08072734 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r0, _08072738 @ =gUnknown_2022988
	strh r1, [r0]
	ldr r0, _0807273C @ =gUnknown_202298A
	strh r1, [r0]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072728: .4byte 0x0000ffff
_0807272C: .4byte gMPlay_BGM
_08072730: .4byte gUnknown_2022984
_08072734: .4byte gUnknown_2022986
_08072738: .4byte gUnknown_2022988
_0807273C: .4byte gUnknown_202298A
	thumb_func_end sub_80725D4

	thumb_func_start DestroyAnimSprite
DestroyAnimSprite: @ 8072740
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _0807275C @ =gUnknown_2037EE2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807275C: .4byte gUnknown_2037EE2
	thumb_func_end DestroyAnimSprite

	thumb_func_start DestroyAnimVisualTask
DestroyAnimVisualTask: @ 8072760
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r1, _08072778 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08072778: .4byte gUnknown_2037EE2
	thumb_func_end DestroyAnimVisualTask

	thumb_func_start DestroyAnimSoundTask
DestroyAnimSoundTask: @ 807277C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r1, _08072794 @ =gUnknown_2037EE3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08072794: .4byte gUnknown_2037EE3
	thumb_func_end DestroyAnimSoundTask

	thumb_func_start AddSpriteIndex
AddSpriteIndex: @ 8072798
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r4, _080727B0 @ =0x0000ffff
	ldr r1, _080727B4 @ =gUnknown_2037EEE
_080727A4:
	ldrh r0, [r1]
	cmp r0, r4
	bne _080727B8
	strh r3, [r1]
	b _080727C0
	.align 2, 0
_080727B0: .4byte 0x0000ffff
_080727B4: .4byte gUnknown_2037EEE
_080727B8:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x7
	ble _080727A4
_080727C0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AddSpriteIndex

	thumb_func_start ClearSpriteIndex
ClearSpriteIndex: @ 80727C8
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r0, _080727E4 @ =0x0000ffff
	adds r4, r0, 0
	ldr r1, _080727E8 @ =gUnknown_2037EEE
_080727D6:
	ldrh r0, [r1]
	cmp r0, r3
	bne _080727EC
	orrs r0, r4
	strh r0, [r1]
	b _080727F4
	.align 2, 0
_080727E4: .4byte 0x0000ffff
_080727E8: .4byte gUnknown_2037EEE
_080727EC:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x7
	ble _080727D6
_080727F4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ClearSpriteIndex

	thumb_func_start WaitAnimFrameCount
WaitAnimFrameCount: @ 80727FC
	push {lr}
	ldr r2, _08072814 @ =gUnknown_2037EE0
	ldrb r1, [r2]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0
	bgt _08072820
	ldr r0, _08072818 @ =gUnknown_2037EDC
	ldr r1, _0807281C @ =RunAnimScriptCommand
	str r1, [r0]
	movs r0, 0
	b _08072822
	.align 2, 0
_08072814: .4byte gUnknown_2037EE0
_08072818: .4byte gUnknown_2037EDC
_0807281C: .4byte RunAnimScriptCommand
_08072820:
	subs r0, r1, 0x1
_08072822:
	strb r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end WaitAnimFrameCount

	thumb_func_start RunAnimScriptCommand
RunAnimScriptCommand: @ 8072828
	push {r4,lr}
	ldr r4, _08072858 @ =gUnknown_83ADF5C
_0807282C:
	ldr r0, _0807285C @ =gUnknown_2037ED4
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08072860 @ =gUnknown_2037EE0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08072850
	ldr r0, _08072864 @ =gUnknown_2037EE1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807282C
_08072850:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072858: .4byte gUnknown_83ADF5C
_0807285C: .4byte gUnknown_2037ED4
_08072860: .4byte gUnknown_2037EE0
_08072864: .4byte gUnknown_2037EE1
	thumb_func_end RunAnimScriptCommand

	thumb_func_start ScriptCmd_loadspritegfx
ScriptCmd_loadspritegfx: @ 8072868
	push {r4-r6,lr}
	ldr r6, _080728B4 @ =gUnknown_2037ED4
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	lsls r5, r4, 3
	ldr r0, _080728B8 @ =gUnknown_8399388
	adds r0, r5, r0
	bl sub_800F034
	ldr r0, _080728BC @ =gUnknown_8399C90
	adds r5, r0
	adds r0, r5, 0
	bl sub_800F078
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	ldr r0, _080728C0 @ =0xffffd8f0
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl AddSpriteIndex
	ldr r1, _080728C4 @ =gUnknown_2037EE0
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _080728C8 @ =gUnknown_2037EDC
	ldr r0, _080728CC @ =WaitAnimFrameCount
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080728B4: .4byte gUnknown_2037ED4
_080728B8: .4byte gUnknown_8399388
_080728BC: .4byte gUnknown_8399C90
_080728C0: .4byte 0xffffd8f0
_080728C4: .4byte gUnknown_2037EE0
_080728C8: .4byte gUnknown_2037EDC
_080728CC: .4byte WaitAnimFrameCount
	thumb_func_end ScriptCmd_loadspritegfx

	thumb_func_start ScriptCmd_unloadspritegfx
ScriptCmd_unloadspritegfx: @ 80728D0
	push {r4-r6,lr}
	ldr r6, _08072910 @ =gUnknown_2037ED4
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	ldr r1, _08072914 @ =gUnknown_83ACC08
	ldr r0, _08072918 @ =0xffffd8f0
	adds r4, r0
	lsls r0, r4, 3
	adds r0, r1
	ldrh r5, [r0, 0x6]
	adds r0, r5, 0
	bl FreeSpriteTilesByTag
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl ClearSpriteIndex
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072910: .4byte gUnknown_2037ED4
_08072914: .4byte gUnknown_83ACC08
_08072918: .4byte 0xffffd8f0
	thumb_func_end ScriptCmd_unloadspritegfx

	thumb_func_start ScriptCmd_createsprite
ScriptCmd_createsprite: @ 807291C
	push {r4-r7,lr}
	ldr r5, _08072984 @ =gUnknown_2037ED4
	ldr r1, [r5]
	adds r3, r1, 0x1
	str r3, [r5]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r7, r2, r0
	adds r0, r1, 0x5
	str r0, [r5]
	ldrb r4, [r1, 0x5]
	adds r0, r1, 0x6
	str r0, [r5]
	ldrb r0, [r1, 0x6]
	adds r1, 0x7
	str r1, [r5]
	cmp r0, 0
	beq _0807296C
	adds r6, r5, 0
	ldr r5, _08072988 @ =gUnknown_2037F02
	adds r3, r0, 0
_08072954:
	ldr r2, [r6]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r5]
	adds r2, 0x2
	str r2, [r6]
	adds r5, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08072954
_0807296C:
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	beq _0807299C
	movs r0, 0x80
	eors r4, r0
	cmp r4, 0x3F
	bls _0807298C
	adds r0, r4, 0
	subs r0, 0x40
	b _0807298E
	.align 2, 0
_08072984: .4byte gUnknown_2037ED4
_08072988: .4byte gUnknown_2037F02
_0807298C:
	negs r0, r4
_0807298E:
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08072998 @ =gUnknown_2037F1B
	b _080729AE
	.align 2, 0
_08072998: .4byte gUnknown_2037F1B
_0807299C:
	cmp r4, 0x3F
	bls _080729A6
	adds r0, r4, 0
	subs r0, 0x40
	b _080729A8
_080729A6:
	negs r0, r4
_080729A8:
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08072A04 @ =gUnknown_2037F1A
_080729AE:
	ldrb r0, [r0]
	bl sub_807685C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 24
	asrs r1, 24
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0x2
	bgt _080729CC
	movs r6, 0x3
_080729CC:
	ldr r5, _08072A08 @ =gUnknown_2037F1B
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
	lsls r3, r6, 24
	lsrs r3, 24
	adds r0, r7, 0
	adds r1, r4, 0
	bl CreateSpriteAndAnimate
	ldr r1, _08072A0C @ =gUnknown_2037EE2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072A04: .4byte gUnknown_2037F1A
_08072A08: .4byte gUnknown_2037F1B
_08072A0C: .4byte gUnknown_2037EE2
	thumb_func_end ScriptCmd_createsprite

	thumb_func_start ScriptCmd_createvisualtask
ScriptCmd_createvisualtask: @ 8072A10
	push {r4-r7,lr}
	ldr r4, _08072A80 @ =gUnknown_2037ED4
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r6, r2, r0
	adds r0, r1, 0x5
	str r0, [r4]
	ldrb r7, [r1, 0x5]
	adds r0, r1, 0x6
	str r0, [r4]
	ldrb r0, [r1, 0x6]
	adds r1, 0x7
	str r1, [r4]
	cmp r0, 0
	beq _08072A60
	adds r5, r4, 0
	ldr r4, _08072A84 @ =gUnknown_2037F02
	adds r3, r0, 0
_08072A48:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r4]
	adds r2, 0x2
	str r2, [r5]
	adds r4, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08072A48
_08072A60:
	adds r0, r6, 0
	adds r1, r7, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r6
	ldr r1, _08072A88 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072A80: .4byte gUnknown_2037ED4
_08072A84: .4byte gUnknown_2037F02
_08072A88: .4byte gUnknown_2037EE2
	thumb_func_end ScriptCmd_createvisualtask

	thumb_func_start ScriptCmd_delay
ScriptCmd_delay: @ 8072A8C
	push {r4,lr}
	ldr r1, _08072ABC @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r2, r0, 0x1
	str r2, [r1]
	ldr r3, _08072AC0 @ =gUnknown_2037EE0
	ldrb r0, [r0, 0x1]
	strb r0, [r3]
	lsls r0, 24
	cmp r0, 0
	bne _08072AAA
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	strb r0, [r3]
_08072AAA:
	adds r0, r2, 0x1
	str r0, [r1]
	ldr r1, _08072AC4 @ =gUnknown_2037EDC
	ldr r0, _08072AC8 @ =WaitAnimFrameCount
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072ABC: .4byte gUnknown_2037ED4
_08072AC0: .4byte gUnknown_2037EE0
_08072AC4: .4byte gUnknown_2037EDC
_08072AC8: .4byte WaitAnimFrameCount
	thumb_func_end ScriptCmd_delay

	thumb_func_start sub_8072ACC
sub_8072ACC: @ 8072ACC
	push {lr}
	ldr r0, _08072AE4 @ =gUnknown_2037EE2
	ldrb r2, [r0]
	cmp r2, 0
	bne _08072AF0
	ldr r0, _08072AE8 @ =gUnknown_2037ED4
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _08072AEC @ =gUnknown_2037EE0
	strb r2, [r0]
	b _08072AF6
	.align 2, 0
_08072AE4: .4byte gUnknown_2037EE2
_08072AE8: .4byte gUnknown_2037ED4
_08072AEC: .4byte gUnknown_2037EE0
_08072AF0:
	ldr r1, _08072AFC @ =gUnknown_2037EE0
	movs r0, 0x1
	strb r0, [r1]
_08072AF6:
	pop {r0}
	bx r0
	.align 2, 0
_08072AFC: .4byte gUnknown_2037EE0
	thumb_func_end sub_8072ACC

	thumb_func_start nullsub_41
nullsub_41: @ 8072B00
	bx lr
	thumb_func_end nullsub_41

	thumb_func_start nullsub_42
nullsub_42: @ 8072B04
	bx lr
	thumb_func_end nullsub_42

	thumb_func_start sub_8072B08
sub_8072B08: @ 8072B08
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0
	mov r8, r0
	ldr r0, _08072B38 @ =gUnknown_2037EE2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08072B30
	ldr r0, _08072B3C @ =gUnknown_2037EE3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08072B30
	ldr r1, _08072B40 @ =gUnknown_2037F14
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08072B30
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _08072B48
_08072B30:
	ldr r1, _08072B44 @ =gUnknown_2037F12
	movs r0, 0
	strh r0, [r1]
	b _08072B62
	.align 2, 0
_08072B38: .4byte gUnknown_2037EE2
_08072B3C: .4byte gUnknown_2037EE3
_08072B40: .4byte gUnknown_2037F14
_08072B44: .4byte gUnknown_2037F12
_08072B48:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08072B80
	ldr r1, _08072B6C @ =gUnknown_2037F12
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5A
	bhi _08072B74
_08072B62:
	ldr r1, _08072B70 @ =gUnknown_2037EE0
	movs r0, 0x1
	strb r0, [r1]
	b _08072BDC
	.align 2, 0
_08072B6C: .4byte gUnknown_2037F12
_08072B70: .4byte gUnknown_2037EE0
_08072B74:
	ldr r0, _08072BE8 @ =gMPlay_SE1
	bl m4aMPlayStop
	ldr r0, _08072BEC @ =gMPlay_SE2
	bl m4aMPlayStop
_08072B80:
	ldr r1, _08072BF0 @ =gUnknown_2037F12
	movs r0, 0
	strh r0, [r1]
	movs r5, 0
	ldr r7, _08072BF4 @ =0x0000ffff
	ldr r6, _08072BF8 @ =gUnknown_83ACC08
	ldr r4, _08072BFC @ =gUnknown_2037EEE
_08072B8E:
	ldrh r0, [r4]
	cmp r0, r7
	beq _08072BB2
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4]
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x6]
	bl FreeSpritePaletteByTag
	ldrh r1, [r4]
	adds r0, r7, 0
	orrs r0, r1
	strh r0, [r4]
_08072BB2:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x7
	ble _08072B8E
	mov r1, r8
	cmp r1, 0
	bne _08072BDC
	ldr r0, _08072C00 @ =gMPlay_BGM
	ldr r1, _08072BF4 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	bl sub_80767F0
	movs r0, 0x1
	bl UpdateOamPriorityInAllHealthboxes
	ldr r0, _08072C04 @ =gUnknown_2037EE1
	mov r1, r8
	strb r1, [r0]
_08072BDC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072BE8: .4byte gMPlay_SE1
_08072BEC: .4byte gMPlay_SE2
_08072BF0: .4byte gUnknown_2037F12
_08072BF4: .4byte 0x0000ffff
_08072BF8: .4byte gUnknown_83ACC08
_08072BFC: .4byte gUnknown_2037EEE
_08072C00: .4byte gMPlay_BGM
_08072C04: .4byte gUnknown_2037EE1
	thumb_func_end sub_8072B08

	thumb_func_start sub_8072C08
sub_8072C08: @ 8072C08
	push {r4,lr}
	ldr r4, _08072C2C @ =gUnknown_2037ED4
	ldr r0, [r4]
	adds r1, r0, 0x1
	str r1, [r4]
	ldrb r0, [r0, 0x1]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	orrs r0, r1
	bl PlaySE
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072C2C: .4byte gUnknown_2037ED4
	thumb_func_end sub_8072C08

	thumb_func_start sub_8072C30
sub_8072C30: @ 8072C30
	push {r4-r7,lr}
	ldr r0, _08072C44 @ =gUnknown_2037ED4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r6, [r2, 0x1]
	cmp r6, 0
	bne _08072C48
	movs r6, 0x2
	b _08072C52
	.align 2, 0
_08072C44: .4byte gUnknown_2037ED4
_08072C48:
	cmp r6, 0x1
	bne _08072C4E
	movs r6, 0x3
_08072C4E:
	cmp r6, 0
	beq _08072C56
_08072C52:
	cmp r6, 0x2
	bne _08072C60
_08072C56:
	ldr r0, _08072C5C @ =gUnknown_2037F1A
	b _08072C62
	.align 2, 0
_08072C5C: .4byte gUnknown_2037F1A
_08072C60:
	ldr r0, _08072CD8 @ =gUnknown_2037F1B
_08072C62:
	ldrb r5, [r0]
	adds r0, r5, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08072D12
	adds r0, r5, 0
	bl GetBankIdentity
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	movs r7, 0x1
	cmp r0, 0x1
	bhi _08072C88
	movs r7, 0
_08072C88:
	adds r0, r5, 0
	adds r1, r7, 0
	bl sub_8072E48
	ldr r0, _08072CDC @ =gUnknown_2023D44
	adds r0, r5, r0
	ldrb r4, [r0]
	ldr r0, _08072CE0 @ =task_pA_ma0A_obj_to_bg_pal
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08072CE4 @ =gUnknown_3005090
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x8]
	ldr r1, _08072CE8 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x24]
	ldrh r4, [r0, 0x20]
	adds r1, r4
	strh r1, [r2, 0xA]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r2, 0xC]
	cmp r7, 0
	bne _08072CF4
	ldr r0, _08072CEC @ =gUnknown_2022978
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08072CF0 @ =gUnknown_202297A
	b _08072CFC
	.align 2, 0
_08072CD8: .4byte gUnknown_2037F1B
_08072CDC: .4byte gUnknown_2023D44
_08072CE0: .4byte task_pA_ma0A_obj_to_bg_pal
_08072CE4: .4byte gUnknown_3005090
_08072CE8: .4byte gSprites
_08072CEC: .4byte gUnknown_2022978
_08072CF0: .4byte gUnknown_202297A
_08072CF4:
	ldr r0, _08072D8C @ =gUnknown_202297C
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08072D90 @ =gUnknown_202297E
_08072CFC:
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldr r0, _08072D94 @ =gUnknown_3005090
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r7, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldr r0, _08072D98 @ =gUnknown_2037F14
	strb r3, [r0]
_08072D12:
	movs r0, 0x2
	eors r5, r0
	cmp r6, 0x1
	bls _08072DCE
	adds r0, r5, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08072DCE
	adds r0, r5, 0
	bl GetBankIdentity
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	movs r7, 0x1
	cmp r0, 0x1
	bhi _08072D3E
	movs r7, 0
_08072D3E:
	adds r0, r5, 0
	adds r1, r7, 0
	bl sub_8072E48
	ldr r0, _08072D9C @ =gUnknown_2023D44
	adds r0, r5, r0
	ldrb r4, [r0]
	ldr r0, _08072DA0 @ =task_pA_ma0A_obj_to_bg_pal
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08072D94 @ =gUnknown_3005090
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x8]
	ldr r1, _08072DA4 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x24]
	ldrh r4, [r0, 0x20]
	adds r1, r4
	strh r1, [r2, 0xA]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r2, 0xC]
	cmp r7, 0
	bne _08072DB0
	ldr r0, _08072DA8 @ =gUnknown_2022978
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08072DAC @ =gUnknown_202297A
	b _08072DB8
	.align 2, 0
_08072D8C: .4byte gUnknown_202297C
_08072D90: .4byte gUnknown_202297E
_08072D94: .4byte gUnknown_3005090
_08072D98: .4byte gUnknown_2037F14
_08072D9C: .4byte gUnknown_2023D44
_08072DA0: .4byte task_pA_ma0A_obj_to_bg_pal
_08072DA4: .4byte gSprites
_08072DA8: .4byte gUnknown_2022978
_08072DAC: .4byte gUnknown_202297A
_08072DB0:
	ldr r0, _08072DDC @ =gUnknown_202297C
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08072DE0 @ =gUnknown_202297E
_08072DB8:
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldr r0, _08072DE4 @ =gUnknown_3005090
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r7, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldr r0, _08072DE8 @ =gUnknown_2037F14
	strb r3, [r0, 0x1]
_08072DCE:
	ldr r1, _08072DEC @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072DDC: .4byte gUnknown_202297C
_08072DE0: .4byte gUnknown_202297E
_08072DE4: .4byte gUnknown_3005090
_08072DE8: .4byte gUnknown_2037F14
_08072DEC: .4byte gUnknown_2037ED4
	thumb_func_end sub_8072C30

	thumb_func_start sub_8072DF0
sub_8072DF0: @ 8072DF0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8075224
	lsls r0, 24
	cmp r0, 0
	beq _08072E40
	ldr r0, _08072E34 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r4, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08072E30
	ldr r2, _08072E38 @ =gSprites
	ldr r0, _08072E3C @ =gUnknown_2023D44
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	blt _08072E40
_08072E30:
	movs r0, 0x1
	b _08072E42
	.align 2, 0
_08072E34: .4byte gUnknown_2024018
_08072E38: .4byte gSprites
_08072E3C: .4byte gUnknown_2023D44
_08072E40:
	movs r0, 0
_08072E42:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8072DF0

	thumb_func_start sub_8072E48
sub_8072E48: @ 8072E48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r4, 0
	beq _08072E5E
	b _08072F84
_08072E5E:
	ldr r1, _08072F5C @ =0x06004000
	movs r2, 0x80
	lsls r2, 6
	movs r0, 0
	movs r3, 0x1
	bl RequestDma3Fill
	ldr r1, _08072F60 @ =0x0600e000
	movs r2, 0x80
	lsls r2, 5
	movs r0, 0
	movs r3, 0x1
	bl RequestDma3Fill
	add r0, sp, 0x10
	bl sub_80752A0
	add r0, sp, 0x20
	strh r4, [r0]
	ldr r1, [sp, 0x10]
	ldr r2, _08072F64 @ =0x01000800
	bl CpuSet
	mov r0, sp
	adds r0, 0x22
	strh r4, [r0]
	ldr r1, [sp, 0x14]
	ldr r2, _08072F68 @ =0x01000400
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetAnimBgAttribute
	ldr r2, _08072F6C @ =gUnknown_2023D44
	adds r2, r7, r2
	ldrb r0, [r2]
	ldr r5, _08072F70 @ =gUnknown_2022978
	ldr r3, _08072F74 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r1, 0x24]
	ldrh r4, [r1, 0x20]
	adds r0, r4
	negs r0, r0
	adds r0, 0x20
	strh r0, [r5]
	ldr r4, _08072F78 @ =gUnknown_202297A
	ldrh r0, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	strh r0, [r4]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrh r1, [r5]
	movs r0, 0x14
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x16
	bl SetGpuReg
	lsls r4, r7, 5
	ldr r0, _08072F7C @ =gUnknown_20373F8
	adds r4, r0
	add r0, sp, 0x10
	ldrb r1, [r0, 0x8]
	lsls r1, 4
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	add r0, sp, 0x10
	ldrb r1, [r0, 0x8]
	lsls r1, 5
	movs r0, 0xA0
	lsls r0, 19
	adds r1, r0
	ldr r2, _08072F80 @ =0x04000008
	adds r0, r4, 0
	bl CpuSet
	adds r0, r7, 0
	bl GetBankIdentity
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	add r0, sp, 0x10
	ldrb r0, [r0, 0x8]
	str r0, [sp]
	ldr r0, [sp, 0x10]
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x14]
	str r0, [sp, 0x8]
	add r0, sp, 0x10
	ldrh r0, [r0, 0xA]
	str r0, [sp, 0xC]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_80BCEF4
	b _08073086
	.align 2, 0
_08072F5C: .4byte 0x06004000
_08072F60: .4byte 0x0600e000
_08072F64: .4byte 0x01000800
_08072F68: .4byte 0x01000400
_08072F6C: .4byte gUnknown_2023D44
_08072F70: .4byte gUnknown_2022978
_08072F74: .4byte gSprites
_08072F78: .4byte gUnknown_202297A
_08072F7C: .4byte gUnknown_20373F8
_08072F80: .4byte 0x04000008
_08072F84:
	ldr r1, _08073094 @ =0x06006000
	movs r2, 0x80
	lsls r2, 6
	movs r0, 0
	movs r3, 0x1
	bl RequestDma3Fill
	ldr r1, _08073098 @ =0x0600f000
	movs r6, 0x80
	lsls r6, 5
	movs r0, 0
	adds r2, r6, 0
	movs r3, 0x1
	bl RequestDma3Fill
	add r0, sp, 0x10
	movs r1, 0x2
	bl sub_80752C8
	add r0, sp, 0x24
	movs r4, 0
	strh r4, [r0]
	ldr r1, [sp, 0x10]
	adds r1, r6
	ldr r2, _0807309C @ =0x01000800
	bl CpuSet
	mov r0, sp
	adds r0, 0x26
	strh r4, [r0]
	ldr r1, [sp, 0x14]
	movs r2, 0x80
	lsls r2, 4
	mov r8, r2
	add r1, r8
	ldr r2, _080730A0 @ =0x01000400
	bl CpuSet
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetAnimBgAttribute
	ldr r2, _080730A4 @ =gUnknown_2023D44
	adds r2, r7, r2
	ldrb r0, [r2]
	ldr r5, _080730A8 @ =gUnknown_202297C
	ldr r3, _080730AC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r1, 0x24]
	ldrh r4, [r1, 0x20]
	adds r0, r4
	negs r0, r0
	adds r0, 0x20
	strh r0, [r5]
	ldr r4, _080730B0 @ =gUnknown_202297E
	ldrh r0, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	strh r0, [r4]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrh r1, [r5]
	movs r0, 0x18
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x1A
	bl SetGpuReg
	lsls r4, r7, 5
	ldr r0, _080730B4 @ =gUnknown_20373F8
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x90
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080730B8 @ =0x05000120
	ldr r2, _080730BC @ =0x04000008
	adds r0, r4, 0
	bl CpuSet
	adds r0, r7, 0
	bl GetBankIdentity
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	add r0, sp, 0x10
	ldrb r0, [r0, 0x8]
	str r0, [sp]
	ldr r0, [sp, 0x10]
	adds r0, r6
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x14]
	add r0, r8
	str r0, [sp, 0x8]
	add r0, sp, 0x10
	ldrh r0, [r0, 0xA]
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl sub_80BCEF4
_08073086:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073094: .4byte 0x06006000
_08073098: .4byte 0x0600f000
_0807309C: .4byte 0x01000800
_080730A0: .4byte 0x01000400
_080730A4: .4byte gUnknown_2023D44
_080730A8: .4byte gUnknown_202297C
_080730AC: .4byte gSprites
_080730B0: .4byte gUnknown_202297E
_080730B4: .4byte gUnknown_20373F8
_080730B8: .4byte 0x05000120
_080730BC: .4byte 0x04000008
	thumb_func_end sub_8072E48

	thumb_func_start sub_80730C0
sub_80730C0: @ 80730C0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r12, r1
	adds r7, r2, 0
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r3, 24
	movs r0, 0x40
	mov r9, r0
	cmp r3, 0
	bne _080730DE
	movs r1, 0x20
	mov r9, r1
_080730DE:
	lsls r0, r6, 28
	lsrs r6, r0, 16
	movs r0, 0
	cmp r0, r9
	bcs _08073116
	ldr r1, _08073124 @ =0x00000fff
	mov r8, r1
_080730EC:
	movs r3, 0
	adds r5, r0, 0x1
	lsls r4, r0, 5
_080730F2:
	adds r1, r4, r3
	lsls r1, 1
	add r1, r12
	ldrh r2, [r1]
	mov r0, r8
	ands r0, r2
	orrs r0, r6
	adds r0, r7
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _080730F2
	lsls r0, r5, 24
	lsrs r0, 24
	cmp r0, r9
	bcc _080730EC
_08073116:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073124: .4byte 0x00000fff
	thumb_func_end sub_80730C0

	thumb_func_start sub_8073128
sub_8073128: @ 8073128
	push {r4,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	bl sub_80752A0
	cmp r4, 0
	bne _08073154
	movs r0, 0x1
	bl sub_8075358
	ldr r0, _0807314C @ =gUnknown_2022978
	strh r4, [r0]
	ldr r0, _08073150 @ =gUnknown_202297A
	strh r4, [r0]
	b _08073164
	.align 2, 0
_0807314C: .4byte gUnknown_2022978
_08073150: .4byte gUnknown_202297A
_08073154:
	movs r0, 0x2
	bl sub_8075358
	ldr r0, _0807316C @ =gUnknown_202297C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08073170 @ =gUnknown_202297E
	strh r1, [r0]
_08073164:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807316C: .4byte gUnknown_202297C
_08073170: .4byte gUnknown_202297E
	thumb_func_end sub_8073128

	thumb_func_start task_pA_ma0A_obj_to_bg_pal
task_pA_ma0A_obj_to_bg_pal: @ 8073174
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080731F0 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r4, [r5, 0x8]
	ldrb r6, [r5, 0x14]
	mov r0, sp
	bl sub_80752A0
	ldr r0, _080731F4 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x24]
	ldrh r0, [r1, 0x20]
	adds r2, r0
	ldrh r0, [r5, 0xA]
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r2, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r2, r1
	ldrh r0, [r5, 0xC]
	subs r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0807320C
	ldr r1, _080731F8 @ =gUnknown_2022978
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r5, 0xE]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _080731FC @ =gUnknown_202297A
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r5, 0x10]
	adds r0, r5
	strh r0, [r1]
	lsls r0, r6, 5
	ldr r2, _08073200 @ =gUnknown_20377F8
	adds r0, r2
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 5
	ldr r3, _08073204 @ =0xfffffe00
	adds r2, r3
	adds r1, r2
	ldr r2, _08073208 @ =0x04000008
	bl CpuSet
	b _08073232
	.align 2, 0
_080731F0: .4byte gUnknown_3005090
_080731F4: .4byte gSprites
_080731F8: .4byte gUnknown_2022978
_080731FC: .4byte gUnknown_202297A
_08073200: .4byte gUnknown_20377F8
_08073204: .4byte 0xfffffe00
_08073208: .4byte 0x04000008
_0807320C:
	ldr r1, _0807323C @ =gUnknown_202297C
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r5, 0xE]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _08073240 @ =gUnknown_202297E
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r5, 0x10]
	adds r0, r5
	strh r0, [r1]
	lsls r0, r6, 5
	ldr r1, _08073244 @ =gUnknown_20377F8
	adds r0, r1
	subs r1, 0xE0
	ldr r2, _08073248 @ =0x04000008
	bl CpuSet
_08073232:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807323C: .4byte gUnknown_202297C
_08073240: .4byte gUnknown_202297E
_08073244: .4byte gUnknown_20377F8
_08073248: .4byte 0x04000008
	thumb_func_end task_pA_ma0A_obj_to_bg_pal

	thumb_func_start ScriptCmd_clearmonbg
ScriptCmd_clearmonbg: @ 807324C
	push {r4,r5,lr}
	ldr r0, _08073260 @ =gUnknown_2037ED4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r4, [r2, 0x1]
	cmp r4, 0
	bne _08073264
	movs r4, 0x2
	b _0807326E
	.align 2, 0
_08073260: .4byte gUnknown_2037ED4
_08073264:
	cmp r4, 0x1
	bne _0807326A
	movs r4, 0x3
_0807326A:
	cmp r4, 0
	beq _08073272
_0807326E:
	cmp r4, 0x2
	bne _0807327C
_08073272:
	ldr r0, _08073278 @ =gUnknown_2037F1A
	b _0807327E
	.align 2, 0
_08073278: .4byte gUnknown_2037F1A
_0807327C:
	ldr r0, _080732D4 @ =gUnknown_2037F1B
_0807327E:
	ldrb r5, [r0]
	ldr r3, _080732D8 @ =gUnknown_2037F14
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _080732A4
	ldr r2, _080732DC @ =gSprites
	ldr r0, _080732E0 @ =gUnknown_2023D44
	adds r0, r5, r0
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
_080732A4:
	cmp r4, 0x1
	bls _080732E4
	ldrb r0, [r3, 0x1]
	cmp r0, 0xFF
	beq _080732E4
	ldr r3, _080732DC @ =gSprites
	ldr r2, _080732E0 @ =gUnknown_2023D44
	movs r1, 0x2
	adds r0, r5, 0
	eors r0, r1
	adds r0, r2
	ldrb r1, [r0]
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
	b _080732E6
	.align 2, 0
_080732D4: .4byte gUnknown_2037F1B
_080732D8: .4byte gUnknown_2037F14
_080732DC: .4byte gSprites
_080732E0: .4byte gUnknown_2023D44
_080732E4:
	movs r4, 0
_080732E6:
	ldr r0, _08073310 @ =sub_807331C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08073314 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xC]
	ldr r1, _08073318 @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073310: .4byte sub_807331C
_08073314: .4byte gUnknown_3005090
_08073318: .4byte gUnknown_2037ED4
	thumb_func_end ScriptCmd_clearmonbg

	thumb_func_start sub_807331C
sub_807331C: @ 807331C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldr r1, _08073394 @ =gUnknown_3005090
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _0807338E
	ldrb r0, [r4, 0xC]
	bl GetBankIdentity
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	movs r5, 0x1
	cmp r0, 0x1
	bhi _08073354
	movs r5, 0
_08073354:
	ldr r6, _08073398 @ =gUnknown_2037F14
	ldrb r0, [r6]
	cmp r0, 0xFF
	beq _0807336C
	adds r0, r5, 0
	bl sub_8073128
	ldrb r0, [r6]
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r6]
_0807336C:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	ble _08073388
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8073128
	ldrb r0, [r6, 0x1]
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r6, 0x1]
_08073388:
	adds r0, r7, 0
	bl DestroyTask
_0807338E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073394: .4byte gUnknown_3005090
_08073398: .4byte gUnknown_2037F14
	thumb_func_end sub_807331C

	thumb_func_start sub_807339C
sub_807339C: @ 807339C
	push {r4,r5,lr}
	ldr r0, _080733B0 @ =gUnknown_2037ED4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r5, [r2, 0x1]
	cmp r5, 0
	bne _080733B4
	movs r5, 0x2
	b _080733BE
	.align 2, 0
_080733B0: .4byte gUnknown_2037ED4
_080733B4:
	cmp r5, 0x1
	bne _080733BA
	movs r5, 0x3
_080733BA:
	cmp r5, 0
	beq _080733C2
_080733BE:
	cmp r5, 0x2
	bne _080733CC
_080733C2:
	ldr r0, _080733C8 @ =gUnknown_2037F1A
	b _080733CE
	.align 2, 0
_080733C8: .4byte gUnknown_2037F1A
_080733CC:
	ldr r0, _08073474 @ =gUnknown_2037F1B
_080733CE:
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08073416
	adds r0, r4, 0
	bl GetBankIdentity
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	movs r1, 0x1
	cmp r0, 0x1
	bhi _080733F4
	movs r1, 0
_080733F4:
	adds r0, r4, 0
	bl sub_8072E48
	ldr r2, _08073478 @ =gSprites
	ldr r0, _0807347C @ =gUnknown_2023D44
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
_08073416:
	movs r0, 0x2
	eors r4, r0
	cmp r5, 0x1
	bls _08073464
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08073464
	adds r0, r4, 0
	bl GetBankIdentity
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	movs r1, 0x1
	cmp r0, 0x1
	bhi _08073442
	movs r1, 0
_08073442:
	adds r0, r4, 0
	bl sub_8072E48
	ldr r2, _08073478 @ =gSprites
	ldr r0, _0807347C @ =gUnknown_2023D44
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
_08073464:
	ldr r1, _08073480 @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073474: .4byte gUnknown_2037F1B
_08073478: .4byte gSprites
_0807347C: .4byte gUnknown_2023D44
_08073480: .4byte gUnknown_2037ED4
	thumb_func_end sub_807339C

	thumb_func_start sub_8073484
sub_8073484: @ 8073484
	push {r4-r6,lr}
	ldr r0, _08073498 @ =gUnknown_2037ED4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r5, [r2, 0x1]
	cmp r5, 0
	bne _0807349C
	movs r5, 0x2
	b _080734A6
	.align 2, 0
_08073498: .4byte gUnknown_2037ED4
_0807349C:
	cmp r5, 0x1
	bne _080734A2
	movs r5, 0x3
_080734A2:
	cmp r5, 0
	beq _080734AA
_080734A6:
	cmp r5, 0x2
	bne _080734B4
_080734AA:
	ldr r0, _080734B0 @ =gUnknown_2037F1A
	b _080734B6
	.align 2, 0
_080734B0: .4byte gUnknown_2037F1A
_080734B4:
	ldr r0, _08073514 @ =gUnknown_2037F1B
_080734B6:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080734E0
	ldr r2, _08073518 @ =gSprites
	ldr r0, _0807351C @ =gUnknown_2023D44
	adds r0, r6, r0
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
_080734E0:
	cmp r5, 0x1
	bls _08073520
	movs r0, 0x2
	adds r4, r6, 0
	eors r4, r0
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _08073520
	ldr r2, _08073518 @ =gSprites
	ldr r0, _0807351C @ =gUnknown_2023D44
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
	b _08073522
	.align 2, 0
_08073514: .4byte gUnknown_2037F1B
_08073518: .4byte gSprites
_0807351C: .4byte gUnknown_2023D44
_08073520:
	movs r5, 0
_08073522:
	ldr r0, _0807354C @ =sub_8073558
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08073550 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	strh r6, [r1, 0xC]
	ldr r1, _08073554 @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807354C: .4byte sub_8073558
_08073550: .4byte gUnknown_3005090
_08073554: .4byte gUnknown_2037ED4
	thumb_func_end sub_8073484

	thumb_func_start sub_8073558
sub_8073558: @ 8073558
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _080735DC @ =gUnknown_3005090
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _080735D2
	ldrb r4, [r5, 0xC]
	adds r6, r4, 0
	adds r0, r4, 0
	bl GetBankIdentity
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	movs r7, 0x1
	cmp r0, 0x1
	bhi _08073598
	movs r7, 0
_08073598:
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080735AA
	adds r0, r7, 0
	bl sub_8073128
_080735AA:
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	ble _080735CC
	movs r0, 0x2
	eors r6, r0
	adds r0, r6, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080735CC
	movs r0, 0x1
	eors r7, r0
	adds r0, r7, 0
	bl sub_8073128
_080735CC:
	mov r0, r8
	bl DestroyTask
_080735D2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080735DC: .4byte gUnknown_3005090
	thumb_func_end sub_8073558

	thumb_func_start ScriptCmd_setalpha
ScriptCmd_setalpha: @ 80735E0
	push {r4,r5,lr}
	ldr r2, _08073614 @ =gUnknown_2037ED4
	ldr r0, [r2]
	adds r1, r0, 0x1
	str r1, [r2]
	ldrb r5, [r0, 0x1]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r4, [r1, 0x1]
	lsls r4, 8
	adds r0, 0x1
	str r0, [r2]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	orrs r5, r4
	movs r0, 0x52
	adds r1, r5, 0
	bl SetGpuReg
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073614: .4byte gUnknown_2037ED4
	thumb_func_end ScriptCmd_setalpha

	thumb_func_start ScriptCmd_setbldcnt
ScriptCmd_setbldcnt: @ 8073618
	push {lr}
	ldr r3, _0807363C @ =gUnknown_2037ED4
	ldr r0, [r3]
	adds r2, r0, 0x1
	str r2, [r3]
	ldrb r1, [r0, 0x1]
	adds r0, r2, 0x1
	str r0, [r3]
	ldrb r2, [r2, 0x1]
	lsls r2, 8
	adds r0, 0x1
	str r0, [r3]
	orrs r1, r2
	movs r0, 0x50
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0807363C: .4byte gUnknown_2037ED4
	thumb_func_end ScriptCmd_setbldcnt

	thumb_func_start ScriptCmd_blendoff
ScriptCmd_blendoff: @ 8073640
	push {lr}
	ldr r1, _08073660 @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_08073660: .4byte gUnknown_2037ED4
	thumb_func_end ScriptCmd_blendoff

	thumb_func_start ScriptCmd_call
ScriptCmd_call: @ 8073664
	push {r4,lr}
	ldr r4, _08073690 @ =gUnknown_2037ED4
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldr r2, _08073694 @ =gUnknown_2037ED8
	adds r0, r1, 0x5
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073690: .4byte gUnknown_2037ED4
_08073694: .4byte gUnknown_2037ED8
	thumb_func_end ScriptCmd_call

	thumb_func_start sub_8073698
sub_8073698: @ 8073698
	ldr r0, _080736A4 @ =gUnknown_2037ED4
	ldr r1, _080736A8 @ =gUnknown_2037ED8
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_080736A4: .4byte gUnknown_2037ED4
_080736A8: .4byte gUnknown_2037ED8
	thumb_func_end sub_8073698

	thumb_func_start ScriptCmd_setarg
ScriptCmd_setarg: @ 80736AC
	push {r4,r5,lr}
	ldr r5, _080736D8 @ =gUnknown_2037ED4
	ldr r1, [r5]
	adds r0, r1, 0x1
	str r0, [r5]
	ldrb r2, [r1, 0x1]
	adds r3, r0, 0x1
	str r3, [r5]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r4, r0
	adds r1, 0x4
	str r1, [r5]
	ldr r0, _080736DC @ =gUnknown_2037F02
	lsls r2, 1
	adds r2, r0
	strh r4, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080736D8: .4byte gUnknown_2037ED4
_080736DC: .4byte gUnknown_2037F02
	thumb_func_end ScriptCmd_setarg

	thumb_func_start ScriptCmd_choosetwoturnanim
ScriptCmd_choosetwoturnanim: @ 80736E0
	push {lr}
	ldr r3, _08073718 @ =gUnknown_2037ED4
	ldr r2, [r3]
	adds r0, r2, 0x1
	str r0, [r3]
	ldr r0, _0807371C @ =gUnknown_2037F16
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080736FA
	adds r0, r2, 0x5
	str r0, [r3]
_080736FA:
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08073718: .4byte gUnknown_2037ED4
_0807371C: .4byte gUnknown_2037F16
	thumb_func_end ScriptCmd_choosetwoturnanim

	thumb_func_start ScriptCmd_jumpifmoveturn
ScriptCmd_jumpifmoveturn: @ 8073720
	push {r4,r5,lr}
	ldr r5, _08073750 @ =gUnknown_2037ED4
	ldr r4, [r5]
	adds r2, r4, 0x1
	str r2, [r5]
	ldrb r1, [r4, 0x1]
	adds r3, r2, 0x1
	str r3, [r5]
	ldr r0, _08073754 @ =gUnknown_2037F16
	ldrb r0, [r0]
	cmp r1, r0
	bne _08073758
	ldrb r1, [r2, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r5]
	b _0807375C
	.align 2, 0
_08073750: .4byte gUnknown_2037ED4
_08073754: .4byte gUnknown_2037F16
_08073758:
	adds r0, r4, 0x6
	str r0, [r5]
_0807375C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ScriptCmd_jumpifmoveturn

	thumb_func_start ScriptCmd_jump
ScriptCmd_jump: @ 8073764
	ldr r3, _08073784 @ =gUnknown_2037ED4
	ldr r0, [r3]
	adds r2, r0, 0x1
	str r2, [r3]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_08073784: .4byte gUnknown_2037ED4
	thumb_func_end ScriptCmd_jump

	thumb_func_start sub_8073788
sub_8073788: @ 8073788
	movs r0, 0
	bx lr
	thumb_func_end sub_8073788

	thumb_func_start sub_807378C
sub_807378C: @ 807378C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	beq _0807379A
	movs r0, 0x1
	b _0807379C
_0807379A:
	movs r0, 0
_0807379C:
	pop {r1}
	bx r1
	thumb_func_end sub_807378C

	thumb_func_start sub_80737A0
sub_80737A0: @ 80737A0
	push {r4,lr}
	ldr r1, _080737D4 @ =gUnknown_2037ED4
	ldr r2, [r1]
	adds r0, r2, 0x1
	str r0, [r1]
	ldrb r4, [r2, 0x1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _080737D8 @ =sub_8073850
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080737DC @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	ldr r1, _080737E0 @ =gUnknown_2037F17
	movs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080737D4: .4byte gUnknown_2037ED4
_080737D8: .4byte sub_8073850
_080737DC: .4byte gUnknown_3005090
_080737E0: .4byte gUnknown_2037F17
	thumb_func_end sub_80737A0

	thumb_func_start sub_80737E4
sub_80737E4: @ 80737E4
	push {r4-r6,lr}
	ldr r1, _08073820 @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r2, r0, 0x1
	str r2, [r1]
	ldrb r6, [r0, 0x1]
	ldrb r5, [r2, 0x1]
	adds r0, 0x4
	str r0, [r1]
	ldr r0, _08073824 @ =sub_8073850
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08073828 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08073830
	ldr r1, _0807382C @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	b _0807383C
	.align 2, 0
_08073820: .4byte gUnknown_2037ED4
_08073824: .4byte sub_8073850
_08073828: .4byte gUnknown_2037F1B
_0807382C: .4byte gUnknown_3005090
_08073830:
	ldr r1, _08073848 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0x8]
_0807383C:
	ldr r1, _0807384C @ =gUnknown_2037F17
	movs r0, 0x1
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073848: .4byte gUnknown_3005090
_0807384C: .4byte gUnknown_2037F17
	thumb_func_end sub_80737E4

	thumb_func_start sub_8073850
sub_8073850: @ 8073850
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08073884 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r6, [r4, 0x1C]
	movs r0, 0x1C
	ldrsh r3, [r4, r0]
	adds r7, r1, 0
	cmp r3, 0
	bne _08073888
	str r3, [sp]
	movs r0, 0xE8
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	b _08073918
	.align 2, 0
_08073884: .4byte gUnknown_3005090
_08073888:
	ldr r2, _080738A4 @ =gUnknown_2037AB8
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08073918
	cmp r3, 0x1
	bne _080738AC
	adds r0, r6, 0x1
	strh r0, [r4, 0x1C]
	ldr r1, _080738A8 @ =gUnknown_2037F17
	movs r0, 0x2
	strb r0, [r1]
	b _080738F0
	.align 2, 0
_080738A4: .4byte gUnknown_2037AB8
_080738A8: .4byte gUnknown_2037F17
_080738AC:
	cmp r3, 0x2
	bne _080738F0
	ldrh r0, [r4, 0x8]
	lsls r2, r0, 16
	asrs r1, r2, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080738C4
	bl sub_807396C
	b _080738CA
_080738C4:
	lsrs r0, r2, 16
	bl sub_8073924
_080738CA:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xE8
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r1, _080738EC @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	adds r1, 0x1
	strh r1, [r0, 0x1C]
	b _08073918
	.align 2, 0
_080738EC: .4byte gUnknown_3005090
_080738F0:
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08073918
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	movs r1, 0x1C
	ldrsh r0, [r0, r1]
	cmp r0, 0x3
	bne _08073918
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, _08073920 @ =gUnknown_2037F17
	strb r4, [r0]
_08073918:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073920: .4byte gUnknown_2037F17
	thumb_func_end sub_8073850

	thumb_func_start sub_8073924
sub_8073924: @ 8073924
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r5, _08073960 @ =gUnknown_83ADE18
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 2
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08073964 @ =0x0600d000
	bl LZDecompressVram
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r1, _08073968 @ =0x06008000
	bl LZDecompressVram
	adds r5, 0x4
	adds r4, r5
	ldr r0, [r4]
	movs r1, 0x20
	movs r2, 0x20
	bl LoadCompressedPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073960: .4byte gUnknown_83ADE18
_08073964: .4byte 0x0600d000
_08073968: .4byte 0x06008000
	thumb_func_end sub_8073924

	thumb_func_start sub_807396C
sub_807396C: @ 807396C
	push {lr}
	bl sub_800F40C
	pop {r0}
	bx r0
	thumb_func_end sub_807396C

	thumb_func_start ScriptCmd_restorebg
ScriptCmd_restorebg: @ 8073978
	push {lr}
	ldr r1, _080739A8 @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _080739AC @ =sub_8073850
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080739B0 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080739B4 @ =0x0000ffff
	strh r0, [r1, 0x8]
	ldr r1, _080739B8 @ =gUnknown_2037F17
	movs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080739A8: .4byte gUnknown_2037ED4
_080739AC: .4byte sub_8073850
_080739B0: .4byte gUnknown_3005090
_080739B4: .4byte 0x0000ffff
_080739B8: .4byte gUnknown_2037F17
	thumb_func_end ScriptCmd_restorebg

	thumb_func_start ScriptCmd_waitbgfadeout
ScriptCmd_waitbgfadeout: @ 80739BC
	push {lr}
	ldr r0, _080739D4 @ =gUnknown_2037F17
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080739E0
	ldr r1, _080739D8 @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r1, _080739DC @ =gUnknown_2037EE0
	movs r0, 0
	b _080739E4
	.align 2, 0
_080739D4: .4byte gUnknown_2037F17
_080739D8: .4byte gUnknown_2037ED4
_080739DC: .4byte gUnknown_2037EE0
_080739E0:
	ldr r1, _080739EC @ =gUnknown_2037EE0
	movs r0, 0x1
_080739E4:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080739EC: .4byte gUnknown_2037EE0
	thumb_func_end ScriptCmd_waitbgfadeout

	thumb_func_start sub_80739F0
sub_80739F0: @ 80739F0
	push {lr}
	ldr r0, _08073A08 @ =gUnknown_2037F17
	ldrb r2, [r0]
	cmp r2, 0
	bne _08073A14
	ldr r0, _08073A0C @ =gUnknown_2037ED4
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _08073A10 @ =gUnknown_2037EE0
	strb r2, [r0]
	b _08073A1A
	.align 2, 0
_08073A08: .4byte gUnknown_2037F17
_08073A0C: .4byte gUnknown_2037ED4
_08073A10: .4byte gUnknown_2037EE0
_08073A14:
	ldr r1, _08073A20 @ =gUnknown_2037EE0
	movs r0, 0x1
	strb r0, [r1]
_08073A1A:
	pop {r0}
	bx r0
	.align 2, 0
_08073A20: .4byte gUnknown_2037EE0
	thumb_func_end sub_80739F0

	thumb_func_start ScriptCmd_changebg
ScriptCmd_changebg: @ 8073A24
	push {r4,lr}
	ldr r4, _08073A40 @ =gUnknown_2037ED4
	ldr r1, [r4]
	adds r0, r1, 0x1
	str r0, [r4]
	ldrb r0, [r1, 0x1]
	bl sub_8073924
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073A40: .4byte gUnknown_2037ED4
	thumb_func_end ScriptCmd_changebg

	thumb_func_start sub_8073A44
sub_8073A44: @ 8073A44
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08073A78 @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _08073A7C @ =gUnknown_2037F1A
	ldrb r2, [r0]
	ldr r1, [r1, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08073A80
	adds r0, r2, 0
	bl GetBankSide
	lsls r0, 24
	movs r4, 0xC0
	cmp r0, 0
	beq _08073AE6
	movs r4, 0x3F
	b _08073AE6
	.align 2, 0
_08073A78: .4byte gUnknown_2024018
_08073A7C: .4byte gUnknown_2037F1A
_08073A80:
	adds r0, r2, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08073ABA
	ldr r0, _08073AA8 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08073AE6
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0x3F
	bne _08073AAC
	movs r4, 0xC0
	b _08073AE6
	.align 2, 0
_08073AA8: .4byte gUnknown_2037F1B
_08073AAC:
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	beq _08073AE6
	negs r0, r1
	lsls r0, 24
	b _08073AE4
_08073ABA:
	ldr r0, _08073ADC @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08073AE0
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	bne _08073AE6
	movs r4, 0x3F
	b _08073AE6
	.align 2, 0
_08073ADC: .4byte gUnknown_2037F1B
_08073AE0:
	lsls r0, r4, 24
	negs r0, r0
_08073AE4:
	lsrs r4, r0, 24
_08073AE6:
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0x3F
	ble _08073AF2
	movs r4, 0x3F
	b _08073AFC
_08073AF2:
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bge _08073AFC
	movs r4, 0xC0
_08073AFC:
	lsls r0, r4, 24
	asrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8073A44

	thumb_func_start sub_8073B08
sub_8073B08: @ 8073B08
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08073B3C @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _08073B40 @ =gUnknown_2037F1A
	ldrb r2, [r0]
	ldr r1, [r1, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08073B44
	adds r0, r2, 0
	bl GetBankSide
	lsls r0, 24
	movs r4, 0xC0
	cmp r0, 0
	beq _08073B56
	movs r4, 0x3F
	b _08073B56
	.align 2, 0
_08073B3C: .4byte gUnknown_2024018
_08073B40: .4byte gUnknown_2037F1A
_08073B44:
	adds r0, r2, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08073B56
	lsls r0, r4, 24
	negs r0, r0
	lsrs r4, r0, 24
_08073B56:
	lsls r0, r4, 24
	asrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8073B08

	thumb_func_start sub_8073B60
sub_8073B60: @ 8073B60
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r2, r0, 16
	cmp r2, 0x3F
	ble _08073B70
	movs r1, 0x3F
	b _08073B7A
_08073B70:
	movs r0, 0x40
	negs r0, r0
	cmp r2, r0
	bge _08073B7A
	ldr r1, _08073B84 @ =0x0000ffc0
_08073B7A:
	lsls r0, r1, 16
	asrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08073B84: .4byte 0x0000ffc0
	thumb_func_end sub_8073B60

	thumb_func_start CalculatePanIncrement
CalculatePanIncrement: @ 8073B88
	push {lr}
	lsls r2, 16
	lsrs r2, 16
	adds r3, r2, 0
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _08073BA6
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0
	bge _08073BB6
	b _08073BB4
_08073BA6:
	cmp r0, r1
	ble _08073BBC
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0
	bge _08073BB4
	negs r0, r0
_08073BB4:
	negs r0, r0
_08073BB6:
	lsls r0, 16
	lsrs r0, 16
	b _08073BBE
_08073BBC:
	movs r0, 0
_08073BBE:
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end CalculatePanIncrement

	thumb_func_start ScriptCmd_playsewithpan
ScriptCmd_playsewithpan: @ 8073BC8
	push {r4,r5,lr}
	ldr r5, _08073BFC @ =gUnknown_2037ED4
	ldr r0, [r5]
	adds r1, r0, 0x1
	str r1, [r5]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	bl PlaySE12WithPanning
	ldr r0, [r5]
	adds r0, 0x3
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073BFC: .4byte gUnknown_2037ED4
	thumb_func_end ScriptCmd_playsewithpan

	thumb_func_start ScriptCmd_setpan
ScriptCmd_setpan: @ 8073C00
	push {r4,lr}
	ldr r4, _08073C28 @ =gUnknown_2037ED4
	ldr r1, [r4]
	adds r0, r1, 0x1
	str r0, [r4]
	movs r0, 0x1
	ldrsb r0, [r1, r0]
	bl sub_8073A44
	lsls r0, 24
	asrs r0, 24
	bl SE12PanpotControl
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073C28: .4byte gUnknown_2037ED4
	thumb_func_end ScriptCmd_setpan

	thumb_func_start ScriptCmd_panse_1B
ScriptCmd_panse_1B: @ 8073C2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08073CDC @ =gUnknown_2037ED4
	mov r10, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r10
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r9, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r9
	orrs r2, r0
	mov r9, r2
	ldrb r4, [r1, 0x3]
	ldrb r6, [r1, 0x4]
	ldrb r7, [r1, 0x5]
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8073A44
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl sub_8073A44
	mov r8, r0
	lsls r5, 24
	asrs r5, 24
	mov r0, r8
	lsls r0, 24
	asrs r0, 24
	mov r8, r0
	lsls r6, 24
	asrs r6, 24
	adds r0, r5, 0
	mov r1, r8
	adds r2, r6, 0
	bl CalculatePanIncrement
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08073CE0 @ =Task_PanFromInitialToTarget
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08073CE4 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	mov r2, r8
	strh r2, [r1, 0xA]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xC]
	strh r7, [r1, 0xE]
	strh r5, [r1, 0x10]
	mov r0, r9
	adds r1, r5, 0
	bl PlaySE12WithPanning
	ldr r1, _08073CE8 @ =gUnknown_2037EE3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r10
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073CDC: .4byte gUnknown_2037ED4
_08073CE0: .4byte Task_PanFromInitialToTarget
_08073CE4: .4byte gUnknown_3005090
_08073CE8: .4byte gUnknown_2037EE3
	thumb_func_end ScriptCmd_panse_1B

	thumb_func_start Task_PanFromInitialToTarget
Task_PanFromInitialToTarget: @ 8073CEC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	ldr r1, _08073D30 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x18]
	adds r1, r0, 0x1
	strh r1, [r2, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xE
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08073D70
	strh r7, [r2, 0x18]
	ldrh r6, [r2, 0x8]
	ldrh r3, [r2, 0xA]
	movs r4, 0x10
	ldrsh r0, [r2, r4]
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	adds r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	strh r4, [r2, 0x10]
	cmp r1, 0
	bne _08073D34
	lsls r2, r3, 16
	b _08073D58
	.align 2, 0
_08073D30: .4byte gUnknown_3005090
_08073D34:
	lsls r1, r6, 16
	lsls r0, r3, 16
	asrs r3, r0, 16
	adds r2, r0, 0
	cmp r1, r2
	bge _08073D4A
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	blt _08073D54
	b _08073D58
_08073D4A:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	bgt _08073D54
	movs r7, 0x1
_08073D54:
	cmp r7, 0
	beq _08073D68
_08073D58:
	lsrs r4, r2, 16
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _08073D78 @ =gUnknown_2037EE3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_08073D68:
	lsls r0, r4, 24
	asrs r0, 24
	bl SE12PanpotControl
_08073D70:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073D78: .4byte gUnknown_2037EE3
	thumb_func_end Task_PanFromInitialToTarget

	thumb_func_start ScriptCmd_panse_26
ScriptCmd_panse_26: @ 8073D7C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldr r0, _08073E00 @ =gUnknown_2037ED4
	mov r9, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r9
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r8, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r8
	orrs r2, r0
	mov r8, r2
	ldrb r4, [r1, 0x2]
	ldrb r5, [r1, 0x3]
	ldrb r6, [r1, 0x4]
	ldrb r1, [r1, 0x5]
	mov r10, r1
	ldr r0, _08073E04 @ =Task_PanFromInitialToTarget
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08073E08 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0x8]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r1, 0xA]
	lsls r6, 24
	asrs r6, 24
	strh r6, [r1, 0xC]
	mov r0, r10
	strh r0, [r1, 0xE]
	strh r4, [r1, 0x10]
	mov r0, r8
	adds r1, r4, 0
	bl PlaySE12WithPanning
	ldr r1, _08073E0C @ =gUnknown_2037EE3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073E00: .4byte gUnknown_2037ED4
_08073E04: .4byte Task_PanFromInitialToTarget
_08073E08: .4byte gUnknown_3005090
_08073E0C: .4byte gUnknown_2037EE3
	thumb_func_end ScriptCmd_panse_26

	thumb_func_start ScriptCmd_panse_27
ScriptCmd_panse_27: @ 8073E10
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08073EC0 @ =gUnknown_2037ED4
	mov r10, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r10
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r9, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r9
	orrs r2, r0
	mov r9, r2
	ldrb r4, [r1, 0x3]
	ldrb r0, [r1, 0x4]
	mov r8, r0
	ldrb r7, [r1, 0x5]
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8073B08
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl sub_8073B08
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	mov r0, r8
	bl sub_8073B08
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08073EC4 @ =Task_PanFromInitialToTarget
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08073EC8 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r6, 24
	asrs r6, 24
	strh r6, [r1, 0x8]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r1, 0xA]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xC]
	strh r7, [r1, 0xE]
	strh r6, [r1, 0x10]
	mov r0, r9
	adds r1, r6, 0
	bl PlaySE12WithPanning
	ldr r1, _08073ECC @ =gUnknown_2037EE3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r2, r10
	ldr r0, [r2]
	adds r0, 0x6
	str r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073EC0: .4byte gUnknown_2037ED4
_08073EC4: .4byte Task_PanFromInitialToTarget
_08073EC8: .4byte gUnknown_3005090
_08073ECC: .4byte gUnknown_2037EE3
	thumb_func_end ScriptCmd_panse_27

	thumb_func_start ScriptCmd_loopsewithpan
ScriptCmd_loopsewithpan: @ 8073ED0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r6, _08073F48 @ =gUnknown_2037ED4
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r5, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r5, r0
	ldrb r0, [r1, 0x3]
	mov r8, r0
	ldrb r2, [r1, 0x4]
	mov r9, r2
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8073A44
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08073F4C @ =Task_LoopAndPlaySE
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08073F50 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xA]
	mov r2, r8
	strh r2, [r1, 0xC]
	mov r2, r9
	strh r2, [r1, 0xE]
	mov r2, r8
	strh r2, [r1, 0x18]
	ldr r1, [r1]
	bl _call_via_r1
	ldr r1, _08073F54 @ =gUnknown_2037EE3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x5
	str r0, [r6]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073F48: .4byte gUnknown_2037ED4
_08073F4C: .4byte Task_LoopAndPlaySE
_08073F50: .4byte gUnknown_3005090
_08073F54: .4byte gUnknown_2037EE3
	thumb_func_end ScriptCmd_loopsewithpan

	thumb_func_start Task_LoopAndPlaySE
Task_LoopAndPlaySE: @ 8073F58
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08073FAC @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x18]
	adds r1, r0, 0x1
	strh r1, [r2, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08073FA6
	movs r0, 0
	strh r0, [r2, 0x18]
	ldrh r0, [r2, 0x8]
	ldrb r1, [r2, 0xA]
	ldrh r4, [r2, 0xE]
	subs r4, 0x1
	strh r4, [r2, 0xE]
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	cmp r4, 0
	bne _08073FA6
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _08073FB0 @ =gUnknown_2037EE3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_08073FA6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073FAC: .4byte gUnknown_3005090
_08073FB0: .4byte gUnknown_2037EE3
	thumb_func_end Task_LoopAndPlaySE

	thumb_func_start ScriptCmd_waitplaysewithpan
ScriptCmd_waitplaysewithpan: @ 8073FB4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r6, _08074018 @ =gUnknown_2037ED4
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r5, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r5, r0
	ldrb r0, [r1, 0x3]
	mov r8, r0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8073A44
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807401C @ =Task_WaitAndPlaySE
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08074020 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xA]
	mov r0, r8
	strh r0, [r1, 0xC]
	ldr r1, _08074024 @ =gUnknown_2037EE3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074018: .4byte gUnknown_2037ED4
_0807401C: .4byte Task_WaitAndPlaySE
_08074020: .4byte gUnknown_3005090
_08074024: .4byte gUnknown_2037EE3
	thumb_func_end ScriptCmd_waitplaysewithpan

	thumb_func_start Task_WaitAndPlaySE
Task_WaitAndPlaySE: @ 8074028
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08074064 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xC]
	subs r1, r0, 0x1
	strh r1, [r2, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _0807405C
	ldrh r0, [r2, 0x8]
	movs r1, 0xA
	ldrsb r1, [r2, r1]
	bl PlaySE12WithPanning
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, _08074068 @ =gUnknown_2037EE3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_0807405C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074064: .4byte gUnknown_3005090
_08074068: .4byte gUnknown_2037EE3
	thumb_func_end Task_WaitAndPlaySE

	thumb_func_start ScriptCmd_createsoundtask
ScriptCmd_createsoundtask: @ 807406C
	push {r4-r6,lr}
	ldr r4, _080740D4 @ =gUnknown_2037ED4
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r6, r2, r0
	adds r0, r1, 0x5
	str r0, [r4]
	ldrb r0, [r1, 0x5]
	adds r1, 0x6
	str r1, [r4]
	cmp r0, 0
	beq _080740B6
	adds r5, r4, 0
	ldr r4, _080740D8 @ =gUnknown_2037F02
	adds r3, r0, 0
_0807409E:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r4]
	adds r2, 0x2
	str r2, [r5]
	adds r4, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _0807409E
_080740B6:
	adds r0, r6, 0
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r6
	ldr r1, _080740DC @ =gUnknown_2037EE3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080740D4: .4byte gUnknown_2037ED4
_080740D8: .4byte gUnknown_2037F02
_080740DC: .4byte gUnknown_2037EE3
	thumb_func_end ScriptCmd_createsoundtask

	thumb_func_start ScriptCmd_waitsound
ScriptCmd_waitsound: @ 80740E0
	push {r4,r5,lr}
	ldr r0, _08074118 @ =gUnknown_2037EE3
	ldrb r5, [r0]
	cmp r5, 0
	bne _08074128
	bl IsSEPlaying
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08074140
	ldr r4, _0807411C @ =gUnknown_2037F12
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5A
	bls _0807412E
	ldr r0, _08074120 @ =gMPlay_SE1
	bl m4aMPlayStop
	ldr r0, _08074124 @ =gMPlay_SE2
	bl m4aMPlayStop
	strh r5, [r4]
	b _08074152
	.align 2, 0
_08074118: .4byte gUnknown_2037EE3
_0807411C: .4byte gUnknown_2037F12
_08074120: .4byte gMPlay_SE1
_08074124: .4byte gMPlay_SE2
_08074128:
	ldr r1, _08074138 @ =gUnknown_2037F12
	movs r0, 0
	strh r0, [r1]
_0807412E:
	ldr r1, _0807413C @ =gUnknown_2037EE0
	movs r0, 0x1
	strb r0, [r1]
	b _08074152
	.align 2, 0
_08074138: .4byte gUnknown_2037F12
_0807413C: .4byte gUnknown_2037EE0
_08074140:
	ldr r0, _08074158 @ =gUnknown_2037F12
	movs r2, 0
	strh r1, [r0]
	ldr r1, _0807415C @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08074160 @ =gUnknown_2037EE0
	strb r2, [r0]
_08074152:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074158: .4byte gUnknown_2037F12
_0807415C: .4byte gUnknown_2037ED4
_08074160: .4byte gUnknown_2037EE0
	thumb_func_end ScriptCmd_waitsound

	thumb_func_start ScriptCmd_jumpargeq
ScriptCmd_jumpargeq: @ 8074164
	push {r4-r6,lr}
	ldr r5, _080741A4 @ =gUnknown_2037ED4
	ldr r4, [r5]
	adds r3, r4, 0x1
	str r3, [r5]
	ldrb r2, [r4, 0x1]
	ldrb r1, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _080741A8 @ =gUnknown_2037F02
	lsls r2, 1
	adds r2, r0
	lsls r1, 16
	asrs r1, 16
	movs r6, 0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	bne _080741AC
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	adds r1, r0
	str r1, [r5]
	b _080741B2
	.align 2, 0
_080741A4: .4byte gUnknown_2037ED4
_080741A8: .4byte gUnknown_2037F02
_080741AC:
	adds r0, r4, 0
	adds r0, 0x8
	str r0, [r5]
_080741B2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ScriptCmd_jumpargeq

	thumb_func_start sub_80741B8
sub_80741B8: @ 80741B8
	ldr r1, _080741C4 @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	bx lr
	.align 2, 0
_080741C4: .4byte gUnknown_2037ED4
	thumb_func_end sub_80741B8

	thumb_func_start sub_80741C8
sub_80741C8: @ 80741C8
	push {lr}
	ldr r0, _080741DC @ =gUnknown_2037ED4
	ldr r1, [r0]
	ldrb r2, [r1, 0x1]
	adds r1, 0x2
	str r1, [r0]
	cmp r2, 0
	beq _080741E4
	ldr r0, _080741E0 @ =gUnknown_2037F1B
	b _080741E6
	.align 2, 0
_080741DC: .4byte gUnknown_2037ED4
_080741E0: .4byte gUnknown_2037F1B
_080741E4:
	ldr r0, _08074210 @ =gUnknown_2037F1A
_080741E6:
	ldrb r0, [r0]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080741F8
	cmp r0, 0x3
	bne _0807420C
_080741F8:
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
_0807420C:
	pop {r0}
	bx r0
	.align 2, 0
_08074210: .4byte gUnknown_2037F1A
	thumb_func_end sub_80741C8

	thumb_func_start sub_8074214
sub_8074214: @ 8074214
	push {lr}
	ldr r1, _08074238 @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	pop {r0}
	bx r0
	.align 2, 0
_08074238: .4byte gUnknown_2037ED4
	thumb_func_end sub_8074214

	thumb_func_start sub_807423C
sub_807423C: @ 807423C
	push {r4-r7,lr}
	ldr r1, _0807426C @ =gUnknown_2037ED4
	ldr r0, [r1]
	ldrb r6, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	ldr r7, _08074270 @ =gUnknown_2037F1A
	ldrb r0, [r7]
	bl GetBankSide
	adds r4, r0, 0
	ldr r5, _08074274 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0807429E
	cmp r6, 0
	beq _08074278
	ldrb r0, [r5]
	b _0807427A
	.align 2, 0
_0807426C: .4byte gUnknown_2037ED4
_08074270: .4byte gUnknown_2037F1A
_08074274: .4byte gUnknown_2037F1B
_08074278:
	ldrb r0, [r7]
_0807427A:
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807428A
	cmp r0, 0x3
	bne _0807429E
_0807428A:
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
_0807429E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807423C

	thumb_func_start ScriptCmd_invisible
ScriptCmd_invisible: @ 80742A4
	push {r4,lr}
	ldr r4, _080742D8 @ =gUnknown_2037ED4
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080742CC
	ldr r1, _080742DC @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080742CC:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080742D8: .4byte gUnknown_2037ED4
_080742DC: .4byte gSprites
	thumb_func_end ScriptCmd_invisible

	thumb_func_start ScriptCmd_visible
ScriptCmd_visible: @ 80742E0
	push {r4,lr}
	ldr r4, _08074318 @ =gUnknown_2037ED4
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _0807430A
	ldr r1, _0807431C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_0807430A:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074318: .4byte gUnknown_2037ED4
_0807431C: .4byte gSprites
	thumb_func_end ScriptCmd_visible

	thumb_func_start sub_8074320
sub_8074320: @ 8074320
	push {r4-r7,lr}
	ldr r1, _08074364 @ =gUnknown_2037ED4
	ldr r0, [r1]
	ldrb r7, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080743C2
	ldr r6, _08074368 @ =gUnknown_2037F1A
	ldrb r0, [r6]
	bl GetBankSide
	adds r4, r0, 0
	ldr r5, _0807436C @ =gUnknown_2037F1B
	ldrb r0, [r5]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080743C2
	cmp r7, 0
	bne _08074370
	ldrb r0, [r6]
	bl sub_80768B0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	b _0807437C
	.align 2, 0
_08074364: .4byte gUnknown_2037ED4
_08074368: .4byte gUnknown_2037F1A
_0807436C: .4byte gUnknown_2037F1B
_08074370:
	ldrb r0, [r5]
	bl sub_80768B0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
_0807437C:
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080743C2
	ldr r1, _080743B8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	cmp r4, 0x2
	bne _080743AC
	ldrb r0, [r2, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r2, 0x5]
_080743AC:
	cmp r4, 0x1
	bne _080743BC
	movs r0, 0
	bl sub_8073128
	b _080743C2
	.align 2, 0
_080743B8: .4byte gSprites
_080743BC:
	movs r0, 0x1
	bl sub_8073128
_080743C2:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8074320

	thumb_func_start sub_80743C8
sub_80743C8: @ 80743C8
	push {r4-r7,lr}
	ldr r1, _0807440C @ =gUnknown_2037ED4
	ldr r0, [r1]
	ldrb r7, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0807444C
	ldr r6, _08074410 @ =gUnknown_2037F1A
	ldrb r0, [r6]
	bl GetBankSide
	adds r4, r0, 0
	ldr r5, _08074414 @ =gUnknown_2037F1B
	ldrb r0, [r5]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0807444C
	cmp r7, 0
	bne _08074418
	ldrb r0, [r6]
	bl sub_80768B0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	b _08074424
	.align 2, 0
_0807440C: .4byte gUnknown_2037ED4
_08074410: .4byte gUnknown_2037F1A
_08074414: .4byte gUnknown_2037F1B
_08074418:
	ldrb r0, [r5]
	bl sub_80768B0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
_08074424:
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _0807444C
	cmp r4, 0x2
	bne _0807444C
	ldr r1, _08074454 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
_0807444C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074454: .4byte gSprites
	thumb_func_end sub_80743C8

	thumb_func_start sub_8074458
sub_8074458: @ 8074458
	push {lr}
	ldr r0, _08074474 @ =gMPlay_SE1
	bl m4aMPlayStop
	ldr r0, _08074478 @ =gMPlay_SE2
	bl m4aMPlayStop
	ldr r1, _0807447C @ =gUnknown_2037ED4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08074474: .4byte gMPlay_SE1
_08074478: .4byte gMPlay_SE2
_0807447C: .4byte gUnknown_2037ED4
	thumb_func_end sub_8074458

	.align 2, 0 @ Don't pad with nop.
