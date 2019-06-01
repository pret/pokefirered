	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_81
nullsub_81: @ 80E75AC
	bx lr
	thumb_func_end nullsub_81

	thumb_func_start sub_80E75B0
sub_80E75B0: @ 80E75B0
	ldr r1, _080E75DC @ =gUnknown_3004FE0
	ldr r0, _080E75E0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E75E4 @ =sub_80E75EC
	str r1, [r0]
	ldr r2, _080E75E8 @ =gBattleStruct
	ldr r0, [r2]
	adds r0, 0x94
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x95
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x96
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x97
	strb r1, [r0]
	bx lr
	.align 2, 0
_080E75DC: .4byte gUnknown_3004FE0
_080E75E0: .4byte gActiveBattler
_080E75E4: .4byte sub_80E75EC
_080E75E8: .4byte gBattleStruct
	thumb_func_end sub_80E75B0

	thumb_func_start sub_80E75EC
sub_80E75EC: @ 80E75EC
	push {lr}
	ldr r2, _080E7620 @ =gUnknown_2023BC8
	ldr r1, _080E7624 @ =gBitTable
	ldr r0, _080E7628 @ =gActiveBattler
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080E7638
	ldr r0, _080E762C @ =gUnknown_2022BC4
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _080E7634
	ldr r0, _080E7630 @ =gUnknown_84020F8
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _080E7638
	.align 2, 0
_080E7620: .4byte gUnknown_2023BC8
_080E7624: .4byte gBitTable
_080E7628: .4byte gActiveBattler
_080E762C: .4byte gUnknown_2022BC4
_080E7630: .4byte gUnknown_84020F8
_080E7634:
	bl WallyBufferExecCompleted
_080E7638:
	pop {r0}
	bx r0
	thumb_func_end sub_80E75EC

	thumb_func_start sub_80E763C
sub_80E763C: @ 80E763C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _080E769C @ =gUnknown_2022BC4
	ldr r4, _080E76A0 @ =gActiveBattler
	ldrb r0, [r4]
	lsls r2, r0, 9
	adds r1, r7, 0x2
	adds r1, r2, r1
	ldrb r5, [r1]
	adds r1, r7, 0x3
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r5, r1
	movs r1, 0x1
	movs r2, 0x7
	movs r3, 0x1
	bl dp11b_obj_instanciate
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0x7
	movs r3, 0x1
	bl dp11b_obj_instanciate
	ldr r0, _080E76A4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080E76D4
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080E76A8 @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080E76BC
	cmp r0, 0x1
	bgt _080E76AC
	cmp r0, 0
	beq _080E76B6
	b _080E781A
	.align 2, 0
_080E769C: .4byte gUnknown_2022BC4
_080E76A0: .4byte gActiveBattler
_080E76A4: .4byte gMain
_080E76A8: .4byte gUnknown_2023FF8
_080E76AC:
	cmp r0, 0x2
	beq _080E76C2
	cmp r0, 0x3
	beq _080E76C8
	b _080E781A
_080E76B6:
	movs r0, 0x1
	movs r1, 0
	b _080E7814
_080E76BC:
	movs r0, 0x1
	movs r1, 0x1
	b _080E7814
_080E76C2:
	movs r0, 0x1
	movs r1, 0x2
	b _080E7814
_080E76C8:
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl EmitTwoReturnValues
	b _080E781A
_080E76D4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080E770C
	ldr r5, _080E7708 @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080E76EE
	b _080E7838
_080E76EE:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _080E7794
	.align 2, 0
_080E7708: .4byte gUnknown_2023FF8
_080E770C:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E7744
	ldr r5, _080E7740 @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080E7726
	b _080E7838
_080E7726:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _080E7794
	.align 2, 0
_080E7740: .4byte gUnknown_2023FF8
_080E7744:
	movs r0, 0x40
	mov r8, r0
	ands r0, r1
	cmp r0, 0
	beq _080E7764
	ldr r5, _080E7760 @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E7838
	b _080E777C
	.align 2, 0
_080E7760: .4byte gUnknown_2023FF8
_080E7764:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E77AC
	ldr r5, _080E77A8 @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080E7838
_080E777C:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
_080E7794:
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
	b _080E7838
	.align 2, 0
_080E77A8: .4byte gUnknown_2023FF8
_080E77AC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E782C
	ldr r6, _080E7820 @ =gBattleTypeFlags
	ldr r0, [r6]
	ands r0, r2
	cmp r0, 0
	beq _080E7838
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080E7838
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _080E7824 @ =gAbsentBattlerFlags
	ldrb r1, [r1]
	ldr r2, _080E7828 @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080E7838
	ldr r0, [r6]
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _080E7838
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, r7, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080E780A
	cmp r5, 0xC
	bhi _080E7838
	adds r0, r5, 0
	movs r1, 0x1
	bl AddBagItem
_080E780A:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0xC
_080E7814:
	movs r2, 0
	bl EmitTwoReturnValues
_080E781A:
	bl WallyBufferExecCompleted
	b _080E7838
	.align 2, 0
_080E7820: .4byte gBattleTypeFlags
_080E7824: .4byte gAbsentBattlerFlags
_080E7828: .4byte gBitTable
_080E782C:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080E7838
	bl sub_8048A4C
_080E7838:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E763C

	thumb_func_start sub_80E7844
sub_80E7844: @ 80E7844
	push {r4,lr}
	ldr r1, _080E7860 @ =gBattleStruct
	ldr r2, [r1]
	adds r0, r2, 0
	adds r0, 0x94
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _080E787C
	cmp r0, 0x1
	bgt _080E7864
	cmp r0, 0
	beq _080E786A
	b _080E78D8
	.align 2, 0
_080E7860: .4byte gBattleStruct
_080E7864:
	cmp r0, 0x2
	beq _080E78B4
	b _080E78D8
_080E786A:
	adds r1, r2, 0
	adds r1, 0x96
	movs r0, 0x40
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, 0x94
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080E787C:
	ldr r1, [r4]
	adds r1, 0x96
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080E78D8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl ActionSelectionDestroyCursorAt
	movs r0, 0x1
	movs r1, 0
	bl ActionSelectionCreateCursorAt
	ldr r0, [r4]
	adds r0, 0x96
	movs r1, 0x40
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, 0x94
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080E78D8
_080E78B4:
	adds r1, r2, 0
	adds r1, 0x96
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080E78D8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl EmitTwoReturnValues
	bl WallyBufferExecCompleted
_080E78D8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E7844

	thumb_func_start sub_80E78E0
sub_80E78E0: @ 80E78E0
	push {lr}
	ldr r2, _080E7908 @ =gSprites
	ldr r1, _080E790C @ =gBattlerSpriteIds
	ldr r0, _080E7910 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080E7914 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080E7904
	bl WallyBufferExecCompleted
_080E7904:
	pop {r0}
	bx r0
	.align 2, 0
_080E7908: .4byte gSprites
_080E790C: .4byte gBattlerSpriteIds
_080E7910: .4byte gActiveBattler
_080E7914: .4byte SpriteCallbackDummy
	thumb_func_end sub_80E78E0

	thumb_func_start sub_80E7918
sub_80E7918: @ 80E7918
	push {lr}
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080E792A
	bl WallyBufferExecCompleted
_080E792A:
	pop {r0}
	bx r0
	thumb_func_end sub_80E7918

	thumb_func_start sub_80E7930
sub_80E7930: @ 80E7930
	push {lr}
	ldr r0, _080E7960 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E795A
	ldr r2, _080E7964 @ =gMain
	ldr r0, _080E7968 @ =0x00000439
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _080E796C @ =gUnknown_3004F80
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_080E795A:
	pop {r0}
	bx r0
	.align 2, 0
_080E7960: .4byte gPaletteFade
_080E7964: .4byte gMain
_080E7968: .4byte 0x00000439
_080E796C: .4byte gUnknown_3004F80
	thumb_func_end sub_80E7930

	thumb_func_start sub_80E7970
sub_80E7970: @ 80E7970
	push {lr}
	ldr r0, _080E7984 @ =gUnknown_2024005
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E797E
	bl WallyBufferExecCompleted
_080E797E:
	pop {r0}
	bx r0
	.align 2, 0
_080E7984: .4byte gUnknown_2024005
	thumb_func_end sub_80E7970

	thumb_func_start sub_80E7988
sub_80E7988: @ 80E7988
	push {lr}
	bl sub_802EA10
	ldr r2, _080E79AC @ =gUnknown_2023BC8
	ldr r1, _080E79B0 @ =gBitTable
	ldr r0, _080E79B4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080E79A8
	bl WallyBufferExecCompleted
_080E79A8:
	pop {r0}
	bx r0
	.align 2, 0
_080E79AC: .4byte gUnknown_2023BC8
_080E79B0: .4byte gBitTable
_080E79B4: .4byte gActiveBattler
	thumb_func_end sub_80E7988

	thumb_func_start sub_80E79B8
sub_80E79B8: @ 80E79B8
	push {r4,lr}
	ldr r0, _080E79FC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E79F6
	ldr r1, _080E7A00 @ =gUnknown_3004FE0
	ldr r2, _080E7A04 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E7A08 @ =sub_80E7A14
	str r1, [r0]
	ldr r3, _080E7A0C @ =gTasks
	ldr r1, _080E7A10 @ =gUnknown_3004FFC
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldrb r4, [r1, 0x8]
	bl DestroyTask
	bl FreeAllWindowBuffers
	adds r0, r4, 0
	bl sub_81278DC
_080E79F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E79FC: .4byte gPaletteFade
_080E7A00: .4byte gUnknown_3004FE0
_080E7A04: .4byte gActiveBattler
_080E7A08: .4byte sub_80E7A14
_080E7A0C: .4byte gTasks
_080E7A10: .4byte gUnknown_3004FFC
	thumb_func_end sub_80E79B8

	thumb_func_start sub_80E7A14
sub_80E7A14: @ 80E7A14
	push {lr}
	ldr r0, _080E7A44 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _080E7A48 @ =sub_8011100
	cmp r1, r0
	bne _080E7A6A
	ldr r0, _080E7A4C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E7A6A
	ldr r0, _080E7A50 @ =gUnknown_203B0C0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080E7A5C
	ldr r0, _080E7A54 @ =gUnknown_203B0C1
	ldrb r1, [r0]
	ldr r2, _080E7A58 @ =gUnknown_203B0DC
	movs r0, 0x1
	bl EmitChosenMonReturnValue
	b _080E7A66
	.align 2, 0
_080E7A44: .4byte gMain
_080E7A48: .4byte sub_8011100
_080E7A4C: .4byte gPaletteFade
_080E7A50: .4byte gUnknown_203B0C0
_080E7A54: .4byte gUnknown_203B0C1
_080E7A58: .4byte gUnknown_203B0DC
_080E7A5C:
	movs r0, 0x1
	movs r1, 0x6
	movs r2, 0
	bl EmitChosenMonReturnValue
_080E7A66:
	bl WallyBufferExecCompleted
_080E7A6A:
	pop {r0}
	bx r0
	thumb_func_end sub_80E7A14

	thumb_func_start sub_80E7A70
sub_80E7A70: @ 80E7A70
	push {lr}
	ldr r0, _080E7AA8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E7AC0
	ldr r1, _080E7AAC @ =gUnknown_3004FE0
	ldr r0, _080E7AB0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E7AB4 @ =sub_80E7AC4
	str r1, [r0]
	bl nullsub_44
	bl FreeAllWindowBuffers
	ldr r0, _080E7AB8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E7ABC
	bl sub_8107ECC
	b _080E7AC0
	.align 2, 0
_080E7AA8: .4byte gPaletteFade
_080E7AAC: .4byte gUnknown_3004FE0
_080E7AB0: .4byte gActiveBattler
_080E7AB4: .4byte sub_80E7AC4
_080E7AB8: .4byte gBattleTypeFlags
_080E7ABC:
	bl sub_810AF74
_080E7AC0:
	pop {r0}
	bx r0
	thumb_func_end sub_80E7A70

	thumb_func_start sub_80E7AC4
sub_80E7AC4: @ 80E7AC4
	push {lr}
	ldr r0, _080E7B14 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _080E7B18 @ =sub_8011100
	cmp r1, r0
	bne _080E7B42
	ldr r0, _080E7B1C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E7B42
	movs r0, 0x4
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _080E7B34
	ldr r0, _080E7B20 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	cmp r0, 0xD
	bne _080E7B34
	ldr r0, _080E7B24 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E7B34
	movs r0, 0x4
	bl sub_80EB2F4
	ldr r1, _080E7B28 @ =gUnknown_3004FE0
	ldr r0, _080E7B2C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E7B30 @ =sub_80E8704
	str r1, [r0]
	b _080E7B42
	.align 2, 0
_080E7B14: .4byte gMain
_080E7B18: .4byte sub_8011100
_080E7B1C: .4byte gPaletteFade
_080E7B20: .4byte gSpecialVar_ItemId
_080E7B24: .4byte gBattleTypeFlags
_080E7B28: .4byte gUnknown_3004FE0
_080E7B2C: .4byte gActiveBattler
_080E7B30: .4byte sub_80E8704
_080E7B34:
	ldr r0, _080E7B48 @ =gSpecialVar_ItemId
	ldrh r1, [r0]
	movs r0, 0x1
	bl EmitOneReturnValue
	bl WallyBufferExecCompleted
_080E7B42:
	pop {r0}
	bx r0
	.align 2, 0
_080E7B48: .4byte gSpecialVar_ItemId
	thumb_func_end sub_80E7AC4

	thumb_func_start sub_80E7B4C
sub_80E7B4C: @ 80E7B4C
	push {r4-r7,lr}
	ldr r4, _080E7CB0 @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r5, _080E7CB4 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r1, [r0, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r7, 0x88
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _080E7B80
	ldr r0, _080E7CB8 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080E7CBC @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_080E7B80:
	ldr r1, [r4]
	ldrb r0, [r5]
	movs r6, 0x2
	adds r2, r6, 0
	eors r2, r0
	ldr r1, [r1, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _080E7BB2
	ldr r0, _080E7CB8 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080E7CBC @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_080E7BB2:
	ldr r0, [r4]
	ldrb r2, [r5]
	ldr r3, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0]
	movs r4, 0x8
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080E7CA8
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080E7CA8
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080E7C46
	ldr r0, _080E7CC0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080E7C46
	ldr r1, _080E7CC4 @ =gUnknown_3004FFC
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E7CC8 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _080E7CCC @ =gUnknown_3004FF0
	ldrb r0, [r5]
	adds r1, r6, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _080E7CB8 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080E7CBC @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	eors r0, r6
	bl sub_804BD94
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_080E7C46:
	ldr r1, _080E7CC4 @ =gUnknown_3004FFC
	ldr r4, _080E7CB4 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E7CC8 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _080E7CCC @ =gUnknown_3004FF0
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _080E7CB8 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080E7CBC @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_804BD94
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r0, _080E7CB0 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r2, [r0, 0x8]
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _080E7CD0 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E7CD4 @ =sub_80E7CD8
	str r1, [r0]
_080E7CA8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7CB0: .4byte gUnknown_2024018
_080E7CB4: .4byte gActiveBattler
_080E7CB8: .4byte gBattlerPartyIndexes
_080E7CBC: .4byte gPlayerParty
_080E7CC0: .4byte gBattleTypeFlags
_080E7CC4: .4byte gUnknown_3004FFC
_080E7CC8: .4byte gSprites
_080E7CCC: .4byte gUnknown_3004FF0
_080E7CD0: .4byte gUnknown_3004FE0
_080E7CD4: .4byte sub_80E7CD8
	thumb_func_end sub_80E7B4C

	thumb_func_start sub_80E7CD8
sub_80E7CD8: @ 80E7CD8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r2, _080E7DD8 @ =gSprites
	ldr r0, _080E7DDC @ =gUnknown_3004FF0
	ldr r1, _080E7DE0 @ =gActiveBattler
	mov r8, r1
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080E7DE4 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080E7D02
	movs r4, 0x1
_080E7D02:
	cmp r4, 0
	beq _080E7DCE
	ldr r7, _080E7DE8 @ =gUnknown_2024018
	ldr r0, [r7]
	ldr r4, [r0, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r4
	ldrb r1, [r2, 0x1]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E7DCE
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E7DCE
	ldrb r1, [r2]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r7]
	mov r1, r8
	ldrb r2, [r1]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r2, [r7]
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r6, 0
	eors r1, r0
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	ldr r2, [r7]
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r6, 0
	eors r1, r0
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldr r4, _080E7DEC @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _080E7DF0 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	ldr r2, _080E7DF4 @ =gBattlerPartyIndexes
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080E7DF8 @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	ldr r1, _080E7DFC @ =gUnknown_3004FE0
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E7E00 @ =sub_80E835C
	str r1, [r0]
_080E7DCE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7DD8: .4byte gSprites
_080E7DDC: .4byte gUnknown_3004FF0
_080E7DE0: .4byte gActiveBattler
_080E7DE4: .4byte SpriteCallbackDummy
_080E7DE8: .4byte gUnknown_2024018
_080E7DEC: .4byte 0x000027f9
_080E7DF0: .4byte c3_0802FDF4
_080E7DF4: .4byte gBattlerPartyIndexes
_080E7DF8: .4byte gPlayerParty
_080E7DFC: .4byte gUnknown_3004FE0
_080E7E00: .4byte sub_80E835C
	thumb_func_end sub_80E7CD8

	thumb_func_start sub_80E7E04
sub_80E7E04: @ 80E7E04
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080E7F04 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	mov r8, r0
	ldrb r0, [r0, 0x8]
	mov r10, r0
	mov r1, r8
	ldrb r7, [r1, 0xC]
	str r7, [sp, 0x8]
	ldrh r2, [r1, 0xA]
	str r2, [sp, 0xC]
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080E7E4A
	ldr r1, _080E7F08 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r10, r0
	bne _080E7E4A
	b _080E7F60
_080E7E4A:
	movs r0, 0x64
	mov r1, r10
	muls r1, r0
	ldr r0, _080E7F0C @ =gPlayerParty
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x4]
	ldr r3, _080E7F10 @ =gExperienceTables
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _080E7F14 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x13]
	movs r1, 0xCA
	lsls r1, 1
	muls r1, r2
	adds r4, r1
	adds r4, r3
	ldr r2, [r4]
	str r2, [sp]
	ldr r3, [sp, 0xC]
	lsls r1, r3, 16
	asrs r1, 16
	adds r0, r1
	cmp r0, r2
	bcc _080E7F38
	adds r0, r6, 0
	movs r1, 0x19
	mov r2, sp
	bl SetMonData
	adds r0, r6, 0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r2, r0
	ldr r0, [sp, 0xC]
	subs r2, r0, r2
	ldr r4, _080E7F18 @ =gActiveBattler
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r1, 0xB
	bl EmitTwoReturnValues
	strb r5, [r4]
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E7F20
	ldr r2, _080E7F08 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r2
	mov r1, r10
	ldrh r0, [r0]
	cmp r1, r0
	beq _080E7EFE
	movs r0, 0x2
	eors r7, r0
	lsls r0, r7, 1
	adds r0, r2
	ldrh r0, [r0]
	cmp r1, r0
	bne _080E7F20
_080E7EFE:
	ldr r0, _080E7F1C @ =sub_80E8190
	b _080E7F62
	.align 2, 0
_080E7F04: .4byte gTasks
_080E7F08: .4byte gBattlerPartyIndexes
_080E7F0C: .4byte gPlayerParty
_080E7F10: .4byte gExperienceTables
_080E7F14: .4byte gBaseStats
_080E7F18: .4byte gActiveBattler
_080E7F1C: .4byte sub_80E8190
_080E7F20:
	ldr r0, _080E7F30 @ =gTasks
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldr r0, _080E7F34 @ =sub_80E82A8
	b _080E7F64
	.align 2, 0
_080E7F30: .4byte gTasks
_080E7F34: .4byte sub_80E82A8
_080E7F38:
	str r0, [sp, 0x4]
	add r2, sp, 0x4
	adds r0, r6, 0
	movs r1, 0x19
	bl SetMonData
	ldr r1, _080E7F58 @ =gUnknown_3004FE0
	ldr r3, [sp, 0x8]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, _080E7F5C @ =sub_80E8930
	str r1, [r0]
	mov r0, r9
	bl DestroyTask
	b _080E7F66
	.align 2, 0
_080E7F58: .4byte gUnknown_3004FE0
_080E7F5C: .4byte sub_80E8930
_080E7F60:
	ldr r0, _080E7F78 @ =sub_80E7F7C
_080E7F62:
	mov r1, r8
_080E7F64:
	str r0, [r1]
_080E7F66:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E7F78: .4byte sub_80E7F7C
	thumb_func_end sub_80E7E04

	thumb_func_start sub_80E7F7C
sub_80E7F7C: @ 80E7F7C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E8034 @ =gTasks
	lsls r2, r0, 2
	mov r8, r2
	add r8, r0
	mov r0, r8
	lsls r0, 3
	mov r8, r0
	add r8, r1
	mov r2, r8
	ldrb r1, [r2, 0x8]
	movs r0, 0xA
	ldrsh r2, [r2, r0]
	mov r9, r2
	mov r2, r8
	ldrb r2, [r2, 0xC]
	mov r10, r2
	movs r0, 0x64
	adds r6, r1, 0
	muls r6, r0
	ldr r0, _080E8038 @ =gPlayerParty
	adds r6, r0
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x19
	bl GetMonData
	adds r3, r0, 0
	ldr r6, _080E803C @ =gExperienceTables
	lsls r1, r4, 2
	ldr r2, _080E8040 @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r6
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	adds r4, r6
	ldr r2, [r4]
	subs r2, r1
	ldr r0, _080E8044 @ =gUnknown_3004FF0
	add r0, r10
	ldrb r1, [r0]
	mov r0, r9
	negs r0, r0
	str r0, [sp]
	mov r0, r10
	bl SetBattleBarStruct
	movs r0, 0x1B
	bl PlaySE
	ldr r0, _080E8048 @ =sub_80E804C
	mov r1, r8
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E8034: .4byte gTasks
_080E8038: .4byte gPlayerParty
_080E803C: .4byte gExperienceTables
_080E8040: .4byte gBaseStats
_080E8044: .4byte gUnknown_3004FF0
_080E8048: .4byte sub_80E804C
	thumb_func_end sub_80E7F7C

	thumb_func_start sub_80E804C
sub_80E804C: @ 80E804C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _080E8078 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r6, r0, r1
	ldrh r1, [r6, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r6, r2]
	cmp r0, 0xC
	bgt _080E807C
	adds r0, r1, 0x1
	strh r0, [r6, 0x1C]
	b _080E8178
	.align 2, 0
_080E8078: .4byte gTasks
_080E807C:
	ldrb r0, [r6, 0x8]
	mov r9, r0
	ldrh r2, [r6, 0xA]
	mov r10, r2
	ldrb r7, [r6, 0xC]
	ldr r5, _080E8144 @ =gUnknown_3004FF0
	adds r5, r7, r5
	ldrb r1, [r5]
	adds r0, r7, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8049FD8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	bl SetHealthboxSpriteVisible
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _080E8178
	movs r0, 0x1B
	bl m4aSongNumStop
	movs r0, 0x64
	mov r1, r9
	muls r1, r0
	ldr r0, _080E8148 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _080E814C @ =gExperienceTables
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _080E8150 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	adds r4, r0
	adds r4, r3
	ldr r1, [r4]
	str r1, [sp]
	mov r2, r10
	lsls r0, r2, 16
	asrs r4, r0, 16
	ldr r0, [sp, 0x4]
	adds r0, r4
	cmp r0, r1
	blt _080E815C
	adds r0, r5, 0
	movs r1, 0x19
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r2, r0
	subs r2, r4, r2
	ldr r4, _080E8154 @ =gActiveBattler
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r1, 0xB
	bl EmitTwoReturnValues
	strb r5, [r4]
	ldr r0, _080E8158 @ =sub_80E8190
	str r0, [r6]
	b _080E8178
	.align 2, 0
_080E8144: .4byte gUnknown_3004FF0
_080E8148: .4byte gPlayerParty
_080E814C: .4byte gExperienceTables
_080E8150: .4byte gBaseStats
_080E8154: .4byte gActiveBattler
_080E8158: .4byte sub_80E8190
_080E815C:
	str r0, [sp, 0x4]
	add r2, sp, 0x4
	adds r0, r5, 0
	movs r1, 0x19
	bl SetMonData
	ldr r1, _080E8188 @ =gUnknown_3004FE0
	lsls r0, r7, 2
	adds r0, r1
	ldr r1, _080E818C @ =sub_80E8930
	str r1, [r0]
	mov r0, r8
	bl DestroyTask
_080E8178:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8188: .4byte gUnknown_3004FE0
_080E818C: .4byte sub_80E8930
	thumb_func_end sub_80E804C

	thumb_func_start sub_80E8190
sub_80E8190: @ 80E8190
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E81E4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0xC]
	ldrb r6, [r0, 0x8]
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E81C4
	ldr r1, _080E81E8 @ =gBattlerPartyIndexes
	movs r0, 0x2
	adds r2, r4, 0
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bne _080E81C4
	adds r4, r2, 0
_080E81C4:
	adds r0, r4, 0
	adds r1, r4, 0
	adds r2, r4, 0
	movs r3, 0
	bl InitAndLaunchSpecialAnimation
	ldr r0, _080E81E4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080E81EC @ =sub_80E81F0
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E81E4: .4byte gTasks
_080E81E8: .4byte gBattlerPartyIndexes
_080E81EC: .4byte sub_80E81F0
	thumb_func_end sub_80E8190

	thumb_func_start sub_80E81F0
sub_80E81F0: @ 80E81F0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080E825C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r2, r0, r1
	ldrb r5, [r2, 0xC]
	ldr r0, _080E8260 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080E8292
	ldrb r4, [r2, 0x8]
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _080E8264 @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x38
	bl GetMonData
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E8270
	ldr r1, _080E8268 @ =gBattlerPartyIndexes
	movs r0, 0x2
	adds r2, r5, 0
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _080E8270
	ldr r0, _080E826C @ =gUnknown_3004FF0
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, r7, 0
	movs r2, 0
	bl UpdateHealthboxAttribute
	b _080E8284
	.align 2, 0
_080E825C: .4byte gTasks
_080E8260: .4byte gUnknown_2024018
_080E8264: .4byte gPlayerParty
_080E8268: .4byte gBattlerPartyIndexes
_080E826C: .4byte gUnknown_3004FF0
_080E8270:
	ldr r0, _080E8298 @ =gUnknown_3004FF0
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0x64
	muls r1, r4
	ldr r2, _080E829C @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
_080E8284:
	ldr r0, _080E82A0 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080E82A4 @ =sub_80E82A8
	str r0, [r1]
_080E8292:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8298: .4byte gUnknown_3004FF0
_080E829C: .4byte gPlayerParty
_080E82A0: .4byte gTasks
_080E82A4: .4byte sub_80E82A8
	thumb_func_end sub_80E81F0

	thumb_func_start sub_80E82A8
sub_80E82A8: @ 80E82A8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080E82E4 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r1, [r4, 0x8]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E82E8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	ldrb r0, [r4, 0xC]
	ldr r1, _080E82EC @ =gUnknown_3004FE0
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E82F0 @ =sub_80E8930
	str r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E82E4: .4byte gTasks
_080E82E8: .4byte gPlayerParty
_080E82EC: .4byte gUnknown_3004FE0
_080E82F0: .4byte sub_80E8930
	thumb_func_end sub_80E82A8

	thumb_func_start sub_80E82F4
sub_80E82F4: @ 80E82F4
	push {r4-r6,lr}
	ldr r6, _080E834C @ =gSprites
	ldr r5, _080E8350 @ =gBattlerSpriteIds
	ldr r4, _080E8354 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r6
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	cmp r0, 0xA0
	ble _080E8344
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	ldr r1, _080E8358 @ =gUnknown_3004FF0
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl WallyBufferExecCompleted
_080E8344:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E834C: .4byte gSprites
_080E8350: .4byte gBattlerSpriteIds
_080E8354: .4byte gActiveBattler
_080E8358: .4byte gUnknown_3004FF0
	thumb_func_end sub_80E82F4

	thumb_func_start sub_80E835C
sub_80E835C: @ 80E835C
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _080E837C @ =gBattleStruct
	ldr r0, [r1]
	adds r0, 0x94
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0x8
	bls _080E8370
	b _080E855E
_080E8370:
	lsls r0, 2
	ldr r1, _080E8380 @ =_080E8384
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E837C: .4byte gBattleStruct
_080E8380: .4byte _080E8384
	.align 2, 0
_080E8384:
	.4byte _080E83A8
	.4byte _080E83F0
	.4byte _080E8408
	.4byte _080E8420
	.4byte _080E8468
	.4byte _080E8490
	.4byte _080E84D8
	.4byte _080E8500
	.4byte _080E8530
_080E83A8:
	ldr r0, _080E83EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _080E83BA
	b _080E855E
_080E83BA:
	ldr r4, [r7]
	adds r5, r4, 0
	adds r5, 0x95
	adds r4, 0x97
	movs r0, 0x1
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80EEFC8
	movs r0, 0x82
	negs r0, r0
	str r6, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	bl BeginNormalPaletteFade
	ldr r1, [r7]
	b _080E8522
	.align 2, 0
_080E83EC: .4byte gPaletteFade
_080E83F0:
	ldr r0, _080E8404 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E83FE
	b _080E855E
_080E83FE:
	bl sub_80EB30C
	b _080E851E
	.align 2, 0
_080E8404: .4byte gPaletteFade
_080E8408:
	ldr r0, _080E8418 @ =gUnknown_83FDAE2
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080E841C @ =gDisplayedStringBattle
	movs r1, 0x18
	bl sub_80D87BC
	b _080E851E
	.align 2, 0
_080E8418: .4byte gUnknown_83FDAE2
_080E841C: .4byte gDisplayedStringBattle
_080E8420:
	movs r0, 0x18
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080E8430
	b _080E855E
_080E8430:
	ldr r2, _080E8460 @ =gBitTable
	ldr r4, _080E8464 @ =gBattleStruct
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x95
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x97
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	lsls r0, r1, 16
	str r3, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	b _080E8522
	.align 2, 0
_080E8460: .4byte gBitTable
_080E8464: .4byte gBattleStruct
_080E8468:
	ldr r0, _080E8484 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E855E
	ldr r0, _080E8488 @ =gUnknown_83FDB92
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080E848C @ =gDisplayedStringBattle
	movs r1, 0x18
	bl sub_80D87BC
	b _080E851E
	.align 2, 0
_080E8484: .4byte gPaletteFade
_080E8488: .4byte gUnknown_83FDB92
_080E848C: .4byte gDisplayedStringBattle
_080E8490:
	movs r0, 0x18
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _080E855E
	ldr r2, _080E84D0 @ =gBitTable
	ldr r4, _080E84D4 @ =gBattleStruct
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x95
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x97
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	lsls r0, r1, 16
	str r3, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	b _080E8522
	.align 2, 0
_080E84D0: .4byte gBitTable
_080E84D4: .4byte gBattleStruct
_080E84D8:
	ldr r0, _080E84F4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E855E
	ldr r0, _080E84F8 @ =gUnknown_83FDBEF
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080E84FC @ =gDisplayedStringBattle
	movs r1, 0x18
	bl sub_80D87BC
	b _080E851E
	.align 2, 0
_080E84F4: .4byte gPaletteFade
_080E84F8: .4byte gUnknown_83FDBEF
_080E84FC: .4byte gDisplayedStringBattle
_080E8500:
	movs r0, 0x18
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080E855E
	movs r0, 0x82
	negs r0, r0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
	bl BeginNormalPaletteFade
_080E851E:
	ldr r0, _080E852C @ =gBattleStruct
	ldr r1, [r0]
_080E8522:
	adds r1, 0x94
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080E855E
	.align 2, 0
_080E852C: .4byte gBattleStruct
_080E8530:
	ldr r0, _080E8568 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080E855E
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	bl sub_80EF0E0
	bl sub_80EB524
	ldr r0, _080E856C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x94
	strb r4, [r0]
	bl WallyBufferExecCompleted
_080E855E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8568: .4byte gPaletteFade
_080E856C: .4byte gBattleStruct
	thumb_func_end sub_80E835C

	thumb_func_start sub_80E8570
sub_80E8570: @ 80E8570
	push {lr}
	ldr r0, _080E8580 @ =gUnknown_83FDC58
	movs r1, 0x1
	bl sub_80E85D4
	pop {r0}
	bx r0
	.align 2, 0
_080E8580: .4byte gUnknown_83FDC58
	thumb_func_end sub_80E8570

	thumb_func_start sub_80E8584
sub_80E8584: @ 80E8584
	push {lr}
	ldr r0, _080E8594 @ =gUnknown_83FDC95
	movs r1, 0x40
	bl sub_80E85D4
	pop {r0}
	bx r0
	.align 2, 0
_080E8594: .4byte gUnknown_83FDC95
	thumb_func_end sub_80E8584

	thumb_func_start sub_80E8598
sub_80E8598: @ 80E8598
	push {lr}
	ldr r0, _080E85A8 @ =gUnknown_83FDD23
	movs r1, 0x1
	bl sub_80E85D4
	pop {r0}
	bx r0
	.align 2, 0
_080E85A8: .4byte gUnknown_83FDD23
	thumb_func_end sub_80E8598

	thumb_func_start sub_80E85AC
sub_80E85AC: @ 80E85AC
	push {lr}
	ldr r0, _080E85BC @ =gUnknown_83FDD64
	movs r1, 0x40
	bl sub_80E85D4
	pop {r0}
	bx r0
	.align 2, 0
_080E85BC: .4byte gUnknown_83FDD64
	thumb_func_end sub_80E85AC

	thumb_func_start sub_80E85C0
sub_80E85C0: @ 80E85C0
	push {lr}
	ldr r0, _080E85D0 @ =gUnknown_83FDDEB
	movs r1, 0x40
	bl sub_80E85D4
	pop {r0}
	bx r0
	.align 2, 0
_080E85D0: .4byte gUnknown_83FDDEB
	thumb_func_end sub_80E85C0

	thumb_func_start sub_80E85D4
sub_80E85D4: @ 80E85D4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r2, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r1, _080E85F8 @ =gBattleStruct
	ldr r0, [r1]
	adds r0, 0x94
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x5
	bls _080E85EE
	b _080E86F2
_080E85EE:
	lsls r0, 2
	ldr r1, _080E85FC @ =_080E8600
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E85F8: .4byte gBattleStruct
_080E85FC: .4byte _080E8600
	.align 2, 0
_080E8600:
	.4byte _080E8618
	.4byte _080E8634
	.4byte _080E865A
	.4byte _080E8670
	.4byte _080E8684
	.4byte _080E86B4
_080E8618:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080E86F2
	ldr r1, _080E8630 @ =gBattleStruct
	ldr r0, [r1]
	adds r0, 0x97
	strb r4, [r0]
	ldr r1, [r1]
	b _080E86A6
	.align 2, 0
_080E8630: .4byte gBattleStruct
_080E8634:
	ldr r1, [r5]
	adds r1, 0x97
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080E86F2
	movs r0, 0x82
	negs r0, r0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	b _080E86A6
_080E865A:
	ldr r0, _080E866C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E86F2
	bl sub_80EB30C
	b _080E86A2
	.align 2, 0
_080E866C: .4byte gPaletteFade
_080E8670:
	adds r0, r2, 0
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080E8680 @ =gDisplayedStringBattle
	movs r1, 0x18
	bl sub_80D87BC
	b _080E86A2
	.align 2, 0
_080E8680: .4byte gDisplayedStringBattle
_080E8684:
	movs r0, 0x18
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080E86F2
	movs r0, 0x82
	negs r0, r0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
	bl BeginNormalPaletteFade
_080E86A2:
	ldr r0, _080E86B0 @ =gBattleStruct
	ldr r1, [r0]
_080E86A6:
	adds r1, 0x94
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080E86F2
	.align 2, 0
_080E86B0: .4byte gBattleStruct
_080E86B4:
	ldr r0, _080E86D8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E86F2
	bl sub_80EB524
	ldr r0, _080E86DC @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E86E0
	bl WallyBufferExecCompleted
	b _080E86E4
	.align 2, 0
_080E86D8: .4byte gPaletteFade
_080E86DC: .4byte gActiveBattler
_080E86E0:
	bl OpponentBufferExecCompleted
_080E86E4:
	ldr r0, _080E86FC @ =gUnknown_2023E82
	movs r1, 0
	strb r1, [r0, 0x7]
	ldr r0, _080E8700 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x94
	strb r1, [r0]
_080E86F2:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E86FC: .4byte gUnknown_2023E82
_080E8700: .4byte gBattleStruct
	thumb_func_end sub_80E85D4

	thumb_func_start sub_80E8704
sub_80E8704: @ 80E8704
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _080E8724 @ =gBattleStruct
	ldr r0, [r1]
	adds r0, 0x94
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x6
	bls _080E8718
	b _080E88AA
_080E8718:
	lsls r0, 2
	ldr r1, _080E8728 @ =_080E872C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E8724: .4byte gBattleStruct
_080E8728: .4byte _080E872C
	.align 2, 0
_080E872C:
	.4byte _080E8748
	.4byte _080E8788
	.4byte _080E87D0
	.4byte _080E87E8
	.4byte _080E8800
	.4byte _080E8848
	.4byte _080E8880
_080E8748:
	ldr r0, _080E8780 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080E875A
	b _080E88AA
_080E875A:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x95
	adds r1, 0x97
	ldr r2, _080E8784 @ =gActiveBattler
	ldrb r2, [r2]
	bl sub_80EEFC8
	movs r0, 0x82
	negs r0, r0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	b _080E886C
	.align 2, 0
_080E8780: .4byte gPaletteFade
_080E8784: .4byte gActiveBattler
_080E8788:
	ldr r0, _080E87C8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080E879A
	b _080E88AA
_080E879A:
	ldr r2, _080E87CC @ =gBitTable
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0x95
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x97
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	lsls r0, r1, 16
	str r3, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	b _080E886C
	.align 2, 0
_080E87C8: .4byte gPaletteFade
_080E87CC: .4byte gBitTable
_080E87D0:
	ldr r0, _080E87E4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E88AA
	bl sub_80EB30C
	b _080E8868
	.align 2, 0
_080E87E4: .4byte gPaletteFade
_080E87E8:
	ldr r0, _080E87F8 @ =gUnknown_83FDCD2
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _080E87FC @ =gDisplayedStringBattle
	movs r1, 0x18
	bl sub_80D87BC
	b _080E8868
	.align 2, 0
_080E87F8: .4byte gUnknown_83FDCD2
_080E87FC: .4byte gDisplayedStringBattle
_080E8800:
	movs r0, 0x18
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _080E88AA
	ldr r2, _080E8840 @ =gBitTable
	ldr r4, _080E8844 @ =gBattleStruct
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x95
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x97
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	lsls r0, r1, 16
	str r3, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	b _080E886C
	.align 2, 0
_080E8840: .4byte gBitTable
_080E8844: .4byte gBattleStruct
_080E8848:
	ldr r0, _080E8878 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080E88AA
	movs r0, 0x82
	negs r0, r0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
	bl BeginNormalPaletteFade
_080E8868:
	ldr r0, _080E887C @ =gBattleStruct
	ldr r1, [r0]
_080E886C:
	adds r1, 0x94
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080E88AA
	.align 2, 0
_080E8878: .4byte gPaletteFade
_080E887C: .4byte gBattleStruct
_080E8880:
	ldr r0, _080E88B4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080E88AA
	bl sub_80EB524
	ldr r0, _080E88B8 @ =gSpecialVar_ItemId
	ldrh r1, [r0]
	movs r0, 0x1
	bl EmitOneReturnValue
	bl WallyBufferExecCompleted
	ldr r0, _080E88BC @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x94
	strb r4, [r0]
_080E88AA:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E88B4: .4byte gPaletteFade
_080E88B8: .4byte gSpecialVar_ItemId
_080E88BC: .4byte gBattleStruct
	thumb_func_end sub_80E8704

	thumb_func_start sub_80E88C0
sub_80E88C0: @ 80E88C0
	push {r4-r6,lr}
	ldr r5, _080E8900 @ =gActiveBattler
	ldrb r0, [r5]
	ldr r6, _080E8904 @ =gUnknown_3004FF0
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8049FD8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080E8908
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl sub_8048440
	b _080E8922
	.align 2, 0
_080E8900: .4byte gActiveBattler
_080E8904: .4byte gUnknown_3004FF0
_080E8908:
	ldr r2, _080E8928 @ =gBattlerPartyIndexes
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080E892C @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	bl WallyBufferExecCompleted
_080E8922:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E8928: .4byte gBattlerPartyIndexes
_080E892C: .4byte gPlayerParty
	thumb_func_end sub_80E88C0

	thumb_func_start sub_80E8930
sub_80E8930: @ 80E8930
	push {lr}
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080E8942
	bl WallyBufferExecCompleted
_080E8942:
	pop {r0}
	bx r0
	thumb_func_end sub_80E8930

	thumb_func_start DoHitAnimBlinkSpriteEffect_3
DoHitAnimBlinkSpriteEffect_3: @ 80E8948
	push {r4,lr}
	ldr r1, _080E8984 @ =gBattlerSpriteIds
	ldr r0, _080E8988 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _080E898C @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _080E8994
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080E8990 @ =gUnknown_2024005
	strb r3, [r0]
	bl WallyBufferExecCompleted
	b _080E89BE
	.align 2, 0
_080E8984: .4byte gBattlerSpriteIds
_080E8988: .4byte gActiveBattler
_080E898C: .4byte gSprites
_080E8990: .4byte gUnknown_2024005
_080E8994:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080E89B8
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
_080E89B8:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_080E89BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DoHitAnimBlinkSpriteEffect_3

	thumb_func_start sub_80E89C4
sub_80E89C4: @ 80E89C4
	push {r4-r6,lr}
	ldr r0, _080E8A20 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r6, _080E8A24 @ =gActiveBattler
	ldrb r2, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080E8A18
	ldr r5, _080E8A28 @ =gBattlerSpriteIds
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080E8A2C @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _080E8A30 @ =gUnknown_3004FF0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl WallyBufferExecCompleted
_080E8A18:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E8A20: .4byte gUnknown_2024018
_080E8A24: .4byte gActiveBattler
_080E8A28: .4byte gBattlerSpriteIds
_080E8A2C: .4byte gSprites
_080E8A30: .4byte gUnknown_3004FF0
	thumb_func_end sub_80E89C4

	thumb_func_start sub_80E8A34
sub_80E8A34: @ 80E8A34
	push {lr}
	ldr r2, _080E8A5C @ =gSprites
	ldr r1, _080E8A60 @ =gBattlerSpriteIds
	ldr r0, _080E8A64 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080E8A68 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080E8A58
	bl WallyBufferExecCompleted
_080E8A58:
	pop {r0}
	bx r0
	.align 2, 0
_080E8A5C: .4byte gSprites
_080E8A60: .4byte gBattlerSpriteIds
_080E8A64: .4byte gActiveBattler
_080E8A68: .4byte SpriteCallbackDummy
	thumb_func_end sub_80E8A34

	thumb_func_start CompleteOnFinishedBattleAnimation_4
CompleteOnFinishedBattleAnimation_4: @ 80E8A6C
	push {lr}
	ldr r0, _080E8A94 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _080E8A98 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _080E8A8E
	bl WallyBufferExecCompleted
_080E8A8E:
	pop {r0}
	bx r0
	.align 2, 0
_080E8A94: .4byte gUnknown_2024018
_080E8A98: .4byte gActiveBattler
	thumb_func_end CompleteOnFinishedBattleAnimation_4

	thumb_func_start WallyBufferExecCompleted
WallyBufferExecCompleted: @ 80E8A9C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080E8ADC @ =gUnknown_3004FE0
	ldr r4, _080E8AE0 @ =gActiveBattler
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E8AE4 @ =sub_80E75EC
	str r1, [r0]
	ldr r0, _080E8AE8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E8AF0
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _080E8AEC @ =gUnknown_2022BC4
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _080E8B02
	.align 2, 0
_080E8ADC: .4byte gUnknown_3004FE0
_080E8AE0: .4byte gActiveBattler
_080E8AE4: .4byte sub_80E75EC
_080E8AE8: .4byte gBattleTypeFlags
_080E8AEC: .4byte gUnknown_2022BC4
_080E8AF0:
	ldr r2, _080E8B0C @ =gUnknown_2023BC8
	ldr r1, _080E8B10 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_080E8B02:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E8B0C: .4byte gUnknown_2023BC8
_080E8B10: .4byte gBitTable
	thumb_func_end WallyBufferExecCompleted

	thumb_func_start CompleteOnFinishedStatusAnimation_4
CompleteOnFinishedStatusAnimation_4: @ 80E8B14
	push {lr}
	ldr r0, _080E8B3C @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _080E8B40 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080E8B36
	bl WallyBufferExecCompleted
_080E8B36:
	pop {r0}
	bx r0
	.align 2, 0
_080E8B3C: .4byte gUnknown_2024018
_080E8B40: .4byte gActiveBattler
	thumb_func_end CompleteOnFinishedStatusAnimation_4

	thumb_func_start WallyHandleGetMonData
WallyHandleGetMonData: @ 80E8B44
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _080E8B70 @ =gUnknown_2022BC4
	ldr r0, _080E8B74 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _080E8B7C
	ldr r0, _080E8B78 @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl CopyWallyMonData
	adds r6, r0, 0
	b _080E8B9E
	.align 2, 0
_080E8B70: .4byte gUnknown_2022BC4
_080E8B74: .4byte gActiveBattler
_080E8B78: .4byte gBattlerPartyIndexes
_080E8B7C:
	ldrb r4, [r1]
	movs r5, 0
_080E8B80:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080E8B96
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl CopyWallyMonData
	adds r6, r0
_080E8B96:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _080E8B80
_080E8B9E:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl EmitDataTransfer
	bl WallyBufferExecCompleted
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end WallyHandleGetMonData

	thumb_func_start CopyWallyMonData
CopyWallyMonData: @ 80E8BB8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _080E8BEC @ =gUnknown_2022BC4
	ldr r3, _080E8BF0 @ =gActiveBattler
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _080E8BE2
	bl _080E934E
_080E8BE2:
	lsls r0, 2
	ldr r1, _080E8BF4 @ =_080E8BF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E8BEC: .4byte gUnknown_2022BC4
_080E8BF0: .4byte gActiveBattler
_080E8BF4: .4byte _080E8BF8
	.align 2, 0
_080E8BF8:
	.4byte _080E8CE8
	.4byte _080E8F0C
	.4byte _080E8F1C
	.4byte _080E8F2C
	.4byte _080E8F94
	.4byte _080E8F94
	.4byte _080E8F94
	.4byte _080E8F94
	.4byte _080E8FB0
	.4byte _080E8FEC
	.4byte _080E8FEC
	.4byte _080E8FEC
	.4byte _080E8FEC
	.4byte _080E934E
	.4byte _080E934E
	.4byte _080E934E
	.4byte _080E934E
	.4byte _080E9008
	.4byte _080E9018
	.4byte _080E9048
	.4byte _080E9058
	.4byte _080E9068
	.4byte _080E9078
	.4byte _080E9088
	.4byte _080E9098
	.4byte _080E90A8
	.4byte _080E90B8
	.4byte _080E90C8
	.4byte _080E90D8
	.4byte _080E90E8
	.4byte _080E90F8
	.4byte _080E9108
	.4byte _080E9158
	.4byte _080E9168
	.4byte _080E9178
	.4byte _080E9188
	.4byte _080E9198
	.4byte _080E91A8
	.4byte _080E91B8
	.4byte _080E91C8
	.4byte _080E91D8
	.4byte _080E920C
	.4byte _080E921C
	.4byte _080E922C
	.4byte _080E923C
	.4byte _080E924C
	.4byte _080E925C
	.4byte _080E926C
	.4byte _080E927C
	.4byte _080E929C
	.4byte _080E92AC
	.4byte _080E92BC
	.4byte _080E92CC
	.4byte _080E92DC
	.4byte _080E92EC
	.4byte _080E92FC
	.4byte _080E930C
	.4byte _080E931C
	.4byte _080E932C
	.4byte _080E933C
_080E8CE8:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080E8EFC @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_080E8D34:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080E8D34
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080E8EFC @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _080E8F00 @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _080E8F04 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _080E8F08 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_080E8EEC:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _080E8EEC
	b _080E934E
	.align 2, 0
_080E8EFC: .4byte gPlayerParty
_080E8F00: .4byte 0xfffffc1f
_080E8F04: .4byte 0xfff07fff
_080E8F08: .4byte 0xfffffe0f
_080E8F0C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E8F18 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	b _080E9286
	.align 2, 0
_080E8F18: .4byte gPlayerParty
_080E8F1C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E8F28 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	b _080E9286
	.align 2, 0
_080E8F28: .4byte gPlayerParty
_080E8F2C:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080E8F90 @ =gPlayerParty
	adds r4, r1, r0
	mov r8, r9
_080E8F42:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _080E8F42
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E8F90 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_080E8F80:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _080E8F80
	b _080E934E
	.align 2, 0
_080E8F90: .4byte gPlayerParty
_080E8F94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E8FAC @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _080E9286
	.align 2, 0
_080E8FAC: .4byte gPlayerParty
_080E8FB0:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _080E8FE8 @ =gPlayerParty
	mov r8, r2
_080E8FBC:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _080E8FBC
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E8FE8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _080E934E
	.align 2, 0
_080E8FE8: .4byte gPlayerParty
_080E8FEC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9004 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _080E9346
	.align 2, 0
_080E9004: .4byte gPlayerParty
_080E9008:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9014 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	b _080E9022
	.align 2, 0
_080E9014: .4byte gPlayerParty
_080E9018:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9044 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x19
_080E9022:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _080E934E
	.align 2, 0
_080E9044: .4byte gPlayerParty
_080E9048:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9054 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1A
	b _080E9346
	.align 2, 0
_080E9054: .4byte gPlayerParty
_080E9058:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9064 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1B
	b _080E9346
	.align 2, 0
_080E9064: .4byte gPlayerParty
_080E9068:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9074 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1C
	b _080E9346
	.align 2, 0
_080E9074: .4byte gPlayerParty
_080E9078:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9084 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1D
	b _080E9346
	.align 2, 0
_080E9084: .4byte gPlayerParty
_080E9088:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9094 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1E
	b _080E9346
	.align 2, 0
_080E9094: .4byte gPlayerParty
_080E9098:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E90A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1F
	b _080E9346
	.align 2, 0
_080E90A4: .4byte gPlayerParty
_080E90A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E90B4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x20
	b _080E9346
	.align 2, 0
_080E90B4: .4byte gPlayerParty
_080E90B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E90C4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x22
	b _080E9346
	.align 2, 0
_080E90C4: .4byte gPlayerParty
_080E90C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E90D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	b _080E9346
	.align 2, 0
_080E90D4: .4byte gPlayerParty
_080E90D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E90E4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x24
	b _080E9346
	.align 2, 0
_080E90E4: .4byte gPlayerParty
_080E90E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E90F4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x25
	b _080E9346
	.align 2, 0
_080E90F4: .4byte gPlayerParty
_080E90F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9104 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x26
	b _080E9346
	.align 2, 0
_080E9104: .4byte gPlayerParty
_080E9108:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080E9154 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _080E934E
	.align 2, 0
_080E9154: .4byte gPlayerParty
_080E9158:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9164 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x27
	b _080E9346
	.align 2, 0
_080E9164: .4byte gPlayerParty
_080E9168:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9174 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x28
	b _080E9346
	.align 2, 0
_080E9174: .4byte gPlayerParty
_080E9178:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9184 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x29
	b _080E9346
	.align 2, 0
_080E9184: .4byte gPlayerParty
_080E9188:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9194 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2A
	b _080E9346
	.align 2, 0
_080E9194: .4byte gPlayerParty
_080E9198:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E91A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2B
	b _080E9346
	.align 2, 0
_080E91A4: .4byte gPlayerParty
_080E91A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E91B4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	b _080E9346
	.align 2, 0
_080E91B4: .4byte gPlayerParty
_080E91B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E91C4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	b _080E91E2
	.align 2, 0
_080E91C4: .4byte gPlayerParty
_080E91C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E91D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x9
	b _080E9286
	.align 2, 0
_080E91D4: .4byte gPlayerParty
_080E91D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9208 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
_080E91E2:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _080E934E
	.align 2, 0
_080E9208: .4byte gPlayerParty
_080E920C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9218 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	b _080E9346
	.align 2, 0
_080E9218: .4byte gPlayerParty
_080E921C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9228 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	b _080E9286
	.align 2, 0
_080E9228: .4byte gPlayerParty
_080E922C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9238 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	b _080E9286
	.align 2, 0
_080E9238: .4byte gPlayerParty
_080E923C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9248 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3B
	b _080E9286
	.align 2, 0
_080E9248: .4byte gPlayerParty
_080E924C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9258 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3C
	b _080E9286
	.align 2, 0
_080E9258: .4byte gPlayerParty
_080E925C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9268 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3D
	b _080E9286
	.align 2, 0
_080E9268: .4byte gPlayerParty
_080E926C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9278 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3E
	b _080E9286
	.align 2, 0
_080E9278: .4byte gPlayerParty
_080E927C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9298 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3F
_080E9286:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _080E934E
	.align 2, 0
_080E9298: .4byte gPlayerParty
_080E929C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E92A8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x16
	b _080E9346
	.align 2, 0
_080E92A8: .4byte gPlayerParty
_080E92AC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E92B8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x17
	b _080E9346
	.align 2, 0
_080E92B8: .4byte gPlayerParty
_080E92BC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E92C8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x18
	b _080E9346
	.align 2, 0
_080E92C8: .4byte gPlayerParty
_080E92CC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E92D8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x21
	b _080E9346
	.align 2, 0
_080E92D8: .4byte gPlayerParty
_080E92DC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E92E8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2F
	b _080E9346
	.align 2, 0
_080E92E8: .4byte gPlayerParty
_080E92EC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E92F8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x30
	b _080E9346
	.align 2, 0
_080E92F8: .4byte gPlayerParty
_080E92FC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9308 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x32
	b _080E9346
	.align 2, 0
_080E9308: .4byte gPlayerParty
_080E930C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9318 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x33
	b _080E9346
	.align 2, 0
_080E9318: .4byte gPlayerParty
_080E931C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9328 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x34
	b _080E9346
	.align 2, 0
_080E9328: .4byte gPlayerParty
_080E932C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9338 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x35
	b _080E9346
	.align 2, 0
_080E9338: .4byte gPlayerParty
_080E933C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9360 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x36
_080E9346:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_080E934E:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E9360: .4byte gPlayerParty
	thumb_func_end CopyWallyMonData

	thumb_func_start WallyHandleGetRawMonData
WallyHandleGetRawMonData: @ 80E9364
	push {lr}
	bl PlayerHandleGetRawMonData
	pop {r0}
	bx r0
	thumb_func_end WallyHandleGetRawMonData

	thumb_func_start WallyHandleSetMonData
WallyHandleSetMonData: @ 80E9370
	push {r4,r5,lr}
	ldr r1, _080E9394 @ =gUnknown_2022BC4
	ldr r0, _080E9398 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _080E93A0
	ldr r0, _080E939C @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl SetWallyMonData
	b _080E93BE
	.align 2, 0
_080E9394: .4byte gUnknown_2022BC4
_080E9398: .4byte gActiveBattler
_080E939C: .4byte gBattlerPartyIndexes
_080E93A0:
	ldrb r4, [r1]
	movs r5, 0
_080E93A4:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080E93B2
	adds r0, r5, 0
	bl SetWallyMonData
_080E93B2:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080E93A4
_080E93BE:
	bl WallyBufferExecCompleted
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end WallyHandleSetMonData

	thumb_func_start SetWallyMonData
SetWallyMonData: @ 80E93C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E9400 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _080E9404 @ =gUnknown_2022BC7
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _080E93F4
	bl _080E9D8E
_080E93F4:
	lsls r0, 2
	ldr r1, _080E9408 @ =_080E940C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9400: .4byte gActiveBattler
_080E9404: .4byte gUnknown_2022BC7
_080E9408: .4byte _080E940C
	.align 2, 0
_080E940C:
	.4byte _080E94FC
	.4byte _080E9694
	.4byte _080E96B4
	.4byte _080E96D4
	.4byte _080E972C
	.4byte _080E972C
	.4byte _080E972C
	.4byte _080E972C
	.4byte _080E9754
	.4byte _080E97B8
	.4byte _080E97B8
	.4byte _080E97B8
	.4byte _080E97B8
	.4byte _080E9D8E
	.4byte _080E9D8E
	.4byte _080E9D8E
	.4byte _080E9D8E
	.4byte _080E97E8
	.4byte _080E9808
	.4byte _080E9828
	.4byte _080E9848
	.4byte _080E9868
	.4byte _080E9888
	.4byte _080E98A8
	.4byte _080E98C8
	.4byte _080E98E8
	.4byte _080E9908
	.4byte _080E9928
	.4byte _080E9948
	.4byte _080E9968
	.4byte _080E9988
	.4byte _080E99A8
	.4byte _080E9A18
	.4byte _080E9A38
	.4byte _080E9A58
	.4byte _080E9A78
	.4byte _080E9A98
	.4byte _080E9AB8
	.4byte _080E9AD8
	.4byte _080E9AF8
	.4byte _080E9B18
	.4byte _080E9B38
	.4byte _080E9B58
	.4byte _080E9B78
	.4byte _080E9B98
	.4byte _080E9BB8
	.4byte _080E9BD8
	.4byte _080E9BF8
	.4byte _080E9C18
	.4byte _080E9C38
	.4byte _080E9C58
	.4byte _080E9C78
	.4byte _080E9C98
	.4byte _080E9CB8
	.4byte _080E9CD8
	.4byte _080E9CF8
	.4byte _080E9D18
	.4byte _080E9D38
	.4byte _080E9D58
	.4byte _080E9D78
_080E94FC:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080E9690 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_080E9562:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _080E9562
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080E9690 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9690: .4byte gPlayerParty
_080E9694:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E96AC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E96B0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E96AC: .4byte gPlayerParty
_080E96B0: .4byte gActiveBattler
_080E96B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E96CC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E96D0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E96CC: .4byte gPlayerParty
_080E96D0: .4byte gActiveBattler
_080E96D4:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080E9728 @ =gPlayerParty
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_080E96EE:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _080E96EE
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9728 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9728: .4byte gPlayerParty
_080E972C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9748 @ =gPlayerParty
	adds r0, r1
	ldr r3, _080E974C @ =gUnknown_2022BC4
	ldr r1, _080E9750 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _080E97D0
	.align 2, 0
_080E9748: .4byte gPlayerParty
_080E974C: .4byte gUnknown_2022BC4
_080E9750: .4byte gActiveBattler
_080E9754:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080E97B0 @ =gPlayerParty
	adds r4, r0
	ldr r5, _080E97B4 @ =gActiveBattler
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E97B0: .4byte gPlayerParty
_080E97B4: .4byte gActiveBattler
_080E97B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E97DC @ =gPlayerParty
	adds r0, r1
	ldr r3, _080E97E0 @ =gUnknown_2022BC4
	ldr r1, _080E97E4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_080E97D0:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E97DC: .4byte gPlayerParty
_080E97E0: .4byte gUnknown_2022BC4
_080E97E4: .4byte gActiveBattler
_080E97E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9800 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9804 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9800: .4byte gPlayerParty
_080E9804: .4byte gActiveBattler
_080E9808:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9820 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9824 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9820: .4byte gPlayerParty
_080E9824: .4byte gActiveBattler
_080E9828:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9840 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9844 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9840: .4byte gPlayerParty
_080E9844: .4byte gActiveBattler
_080E9848:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9860 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9864 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9860: .4byte gPlayerParty
_080E9864: .4byte gActiveBattler
_080E9868:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9880 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9884 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9880: .4byte gPlayerParty
_080E9884: .4byte gActiveBattler
_080E9888:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E98A0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E98A4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E98A0: .4byte gPlayerParty
_080E98A4: .4byte gActiveBattler
_080E98A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E98C0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E98C4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E98C0: .4byte gPlayerParty
_080E98C4: .4byte gActiveBattler
_080E98C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E98E0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E98E4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E98E0: .4byte gPlayerParty
_080E98E4: .4byte gActiveBattler
_080E98E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9900 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9904 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9900: .4byte gPlayerParty
_080E9904: .4byte gActiveBattler
_080E9908:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9920 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9924 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9920: .4byte gPlayerParty
_080E9924: .4byte gActiveBattler
_080E9928:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9940 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9944 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9940: .4byte gPlayerParty
_080E9944: .4byte gActiveBattler
_080E9948:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9960 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9964 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9960: .4byte gPlayerParty
_080E9964: .4byte gActiveBattler
_080E9968:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9980 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9984 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9980: .4byte gPlayerParty
_080E9984: .4byte gActiveBattler
_080E9988:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E99A0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E99A4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E99A0: .4byte gPlayerParty
_080E99A4: .4byte gActiveBattler
_080E99A8:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080E9A10 @ =gPlayerParty
	adds r4, r0
	ldr r5, _080E9A14 @ =gActiveBattler
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _080E9AC8
	.align 2, 0
_080E9A10: .4byte gPlayerParty
_080E9A14: .4byte gActiveBattler
_080E9A18:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9A30 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9A34 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9A30: .4byte gPlayerParty
_080E9A34: .4byte gActiveBattler
_080E9A38:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9A50 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9A54 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9A50: .4byte gPlayerParty
_080E9A54: .4byte gActiveBattler
_080E9A58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9A70 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9A74 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9A70: .4byte gPlayerParty
_080E9A74: .4byte gActiveBattler
_080E9A78:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9A90 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9A94 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9A90: .4byte gPlayerParty
_080E9A94: .4byte gActiveBattler
_080E9A98:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9AB0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9AB4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9AB0: .4byte gPlayerParty
_080E9AB4: .4byte gActiveBattler
_080E9AB8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9AD0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9AD4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_080E9AC8:
	movs r1, 0x2C
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9AD0: .4byte gPlayerParty
_080E9AD4: .4byte gActiveBattler
_080E9AD8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9AF0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9AF4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9AF0: .4byte gPlayerParty
_080E9AF4: .4byte gActiveBattler
_080E9AF8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9B10 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9B14 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9B10: .4byte gPlayerParty
_080E9B14: .4byte gActiveBattler
_080E9B18:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9B30 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9B34 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9B30: .4byte gPlayerParty
_080E9B34: .4byte gActiveBattler
_080E9B38:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9B50 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9B54 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9B50: .4byte gPlayerParty
_080E9B54: .4byte gActiveBattler
_080E9B58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9B70 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9B74 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9B70: .4byte gPlayerParty
_080E9B74: .4byte gActiveBattler
_080E9B78:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9B90 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9B94 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9B90: .4byte gPlayerParty
_080E9B94: .4byte gActiveBattler
_080E9B98:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9BB0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9BB4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9BB0: .4byte gPlayerParty
_080E9BB4: .4byte gActiveBattler
_080E9BB8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9BD0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9BD4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9BD0: .4byte gPlayerParty
_080E9BD4: .4byte gActiveBattler
_080E9BD8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9BF0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9BF4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9BF0: .4byte gPlayerParty
_080E9BF4: .4byte gActiveBattler
_080E9BF8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9C10 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9C14 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9C10: .4byte gPlayerParty
_080E9C14: .4byte gActiveBattler
_080E9C18:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9C30 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9C34 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9C30: .4byte gPlayerParty
_080E9C34: .4byte gActiveBattler
_080E9C38:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9C50 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9C54 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9C50: .4byte gPlayerParty
_080E9C54: .4byte gActiveBattler
_080E9C58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9C70 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9C74 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9C70: .4byte gPlayerParty
_080E9C74: .4byte gActiveBattler
_080E9C78:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9C90 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9C94 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9C90: .4byte gPlayerParty
_080E9C94: .4byte gActiveBattler
_080E9C98:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9CB0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9CB4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9CB0: .4byte gPlayerParty
_080E9CB4: .4byte gActiveBattler
_080E9CB8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9CD0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9CD4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9CD0: .4byte gPlayerParty
_080E9CD4: .4byte gActiveBattler
_080E9CD8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9CF0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9CF4 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9CF0: .4byte gPlayerParty
_080E9CF4: .4byte gActiveBattler
_080E9CF8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9D10 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9D14 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9D10: .4byte gPlayerParty
_080E9D14: .4byte gActiveBattler
_080E9D18:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9D30 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9D34 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9D30: .4byte gPlayerParty
_080E9D34: .4byte gActiveBattler
_080E9D38:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9D50 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9D54 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9D50: .4byte gPlayerParty
_080E9D54: .4byte gActiveBattler
_080E9D58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9D70 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9D74 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _080E9D8E
	.align 2, 0
_080E9D70: .4byte gPlayerParty
_080E9D74: .4byte gActiveBattler
_080E9D78:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080E9DB8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080E9DBC @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_080E9D8E:
	ldr r2, _080E9DC0 @ =gBattlerPartyIndexes
	ldr r0, _080E9DBC @ =gActiveBattler
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080E9DB8 @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9DB8: .4byte gPlayerParty
_080E9DBC: .4byte gActiveBattler
_080E9DC0: .4byte gBattlerPartyIndexes
	thumb_func_end SetWallyMonData

	thumb_func_start sub_80E9DC4
sub_80E9DC4: @ 80E9DC4
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80E9DC4

	thumb_func_start sub_80E9DD0
sub_80E9DD0: @ 80E9DD0
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80E9DD0

	thumb_func_start sub_80E9DDC
sub_80E9DDC: @ 80E9DDC
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80E9DDC

	thumb_func_start WallyHandleReturnMonToBall
WallyHandleReturnMonToBall: @ 80E9DE8
	push {r4-r6,lr}
	ldr r0, _080E9E14 @ =gUnknown_2022BC4
	ldr r6, _080E9E18 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080E9E24
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl InitAndLaunchSpecialAnimation
	ldr r0, _080E9E1C @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080E9E20 @ =sub_80E89C4
	str r0, [r1]
	b _080E9E5A
	.align 2, 0
_080E9E14: .4byte gUnknown_2022BC4
_080E9E18: .4byte gActiveBattler
_080E9E1C: .4byte gUnknown_3004FE0
_080E9E20: .4byte sub_80E89C4
_080E9E24:
	ldr r5, _080E9E60 @ =gBattlerSpriteIds
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080E9E64 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _080E9E68 @ =gUnknown_3004FF0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl WallyBufferExecCompleted
_080E9E5A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9E60: .4byte gBattlerSpriteIds
_080E9E64: .4byte gSprites
_080E9E68: .4byte gUnknown_3004FF0
	thumb_func_end WallyHandleReturnMonToBall

	thumb_func_start sub_80E9E6C
sub_80E9E6C: @ 80E9E6C
	push {r4-r6,lr}
	ldr r0, _080E9EC8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E9EE0
	ldr r4, _080E9ECC @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldrb r0, [r0, 0x8]
	ldr r6, _080E9ED0 @ =gActiveBattler
	ldrb r1, [r6]
	bl sub_8034750
	ldr r0, [r4]
	ldrb r5, [r0, 0x8]
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _080E9ED4 @ =gMultiuseSpriteTemplate
	ldr r2, _080E9ED8 @ =gUnknown_8239F8C
	ldr r1, [r4]
	ldrb r1, [r1, 0x8]
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r2, _080E9EDC @ =gBattlerSpriteIds
	ldrb r1, [r6]
	b _080E9F1C
	.align 2, 0
_080E9EC8: .4byte gBattleTypeFlags
_080E9ECC: .4byte gSaveBlock2Ptr
_080E9ED0: .4byte gActiveBattler
_080E9ED4: .4byte gMultiuseSpriteTemplate
_080E9ED8: .4byte gUnknown_8239F8C
_080E9EDC: .4byte gBattlerSpriteIds
_080E9EE0:
	ldr r4, _080E9F8C @ =gActiveBattler
	ldrb r1, [r4]
	movs r0, 0x5
	bl sub_8034750
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _080E9F90 @ =gMultiuseSpriteTemplate
	ldr r1, _080E9F94 @ =gUnknown_8239F8C
	ldrb r1, [r1, 0x14]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r2, _080E9F98 @ =gBattlerSpriteIds
	ldrb r1, [r4]
_080E9F1C:
	adds r1, r2
	strb r0, [r1]
	ldr r4, _080E9F9C @ =gSprites
	ldr r5, _080E9F98 @ =gBattlerSpriteIds
	ldr r6, _080E9F8C @ =gActiveBattler
	ldrb r3, [r6]
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080E9FA0 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080E9FA4 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _080E9FA8 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E9FAC @ =sub_80E78E0
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9F8C: .4byte gActiveBattler
_080E9F90: .4byte gMultiuseSpriteTemplate
_080E9F94: .4byte gUnknown_8239F8C
_080E9F98: .4byte gBattlerSpriteIds
_080E9F9C: .4byte gSprites
_080E9FA0: .4byte 0x0000fffe
_080E9FA4: .4byte sub_8033EEC
_080E9FA8: .4byte gUnknown_3004FE0
_080E9FAC: .4byte sub_80E78E0
	thumb_func_end sub_80E9E6C

	thumb_func_start sub_80E9FB0
sub_80E9FB0: @ 80E9FB0
	push {r4-r6,lr}
	ldr r0, _080EA00C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA024
	ldr r4, _080EA010 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldrb r0, [r0, 0x8]
	ldr r6, _080EA014 @ =gActiveBattler
	ldrb r1, [r6]
	bl sub_8034750
	ldr r0, [r4]
	ldrb r5, [r0, 0x8]
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _080EA018 @ =gMultiuseSpriteTemplate
	ldr r2, _080EA01C @ =gUnknown_8239F8C
	ldr r1, [r4]
	ldrb r1, [r1, 0x8]
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r2, _080EA020 @ =gBattlerSpriteIds
	ldrb r1, [r6]
	b _080EA060
	.align 2, 0
_080EA00C: .4byte gBattleTypeFlags
_080EA010: .4byte gSaveBlock2Ptr
_080EA014: .4byte gActiveBattler
_080EA018: .4byte gMultiuseSpriteTemplate
_080EA01C: .4byte gUnknown_8239F8C
_080EA020: .4byte gBattlerSpriteIds
_080EA024:
	ldr r4, _080EA0D0 @ =gActiveBattler
	ldrb r1, [r4]
	movs r0, 0x5
	bl sub_8034750
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _080EA0D4 @ =gMultiuseSpriteTemplate
	ldr r1, _080EA0D8 @ =gUnknown_8239F8C
	ldrb r1, [r1, 0x14]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r2, _080EA0DC @ =gBattlerSpriteIds
	ldrb r1, [r4]
_080EA060:
	adds r1, r2
	strb r0, [r1]
	ldr r4, _080EA0E0 @ =gSprites
	ldr r5, _080EA0DC @ =gBattlerSpriteIds
	ldr r6, _080EA0D0 @ =gActiveBattler
	ldrb r3, [r6]
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080EA0E4 @ =0x0000ffa0
	strh r1, [r0, 0x24]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080EA0E8 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _080EA0EC @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA0F0 @ =sub_80E8A34
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA0D0: .4byte gActiveBattler
_080EA0D4: .4byte gMultiuseSpriteTemplate
_080EA0D8: .4byte gUnknown_8239F8C
_080EA0DC: .4byte gBattlerSpriteIds
_080EA0E0: .4byte gSprites
_080EA0E4: .4byte 0x0000ffa0
_080EA0E8: .4byte sub_8033EEC
_080EA0EC: .4byte gUnknown_3004FE0
_080EA0F0: .4byte sub_80E8A34
	thumb_func_end sub_80E9FB0

	thumb_func_start sub_80EA0F4
sub_80EA0F4: @ 80EA0F4
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EA0F4

	thumb_func_start sub_80EA100
sub_80EA100: @ 80EA100
	push {r4-r6,lr}
	ldr r6, _080EA14C @ =gUnknown_2024018
	ldr r4, [r6]
	ldr r5, _080EA150 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r0, [r4, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _080EA154
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080EA134
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_080EA134:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	adds r1, 0x1
	strb r1, [r0, 0x4]
	b _080EA1CA
	.align 2, 0
_080EA14C: .4byte gUnknown_2024018
_080EA150: .4byte gActiveBattler
_080EA154:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080EA1CA
	strb r4, [r3, 0x4]
	ldr r2, _080EA1D0 @ =gBattlerPartyIndexes
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080EA1D4 @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	movs r1, 0x40
	negs r1, r1
	movs r0, 0x10
	bl PlaySE12WithPanning
	ldr r2, _080EA1D8 @ =gSprites
	ldr r3, _080EA1DC @ =gBattlerSpriteIds
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x30]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x32]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080EA1E0 @ =sub_8012110
	str r1, [r0]
	ldr r1, _080EA1E4 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA1E8 @ =sub_80E82F4
	str r1, [r0]
_080EA1CA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA1D0: .4byte gBattlerPartyIndexes
_080EA1D4: .4byte gPlayerParty
_080EA1D8: .4byte gSprites
_080EA1DC: .4byte gBattlerSpriteIds
_080EA1E0: .4byte sub_8012110
_080EA1E4: .4byte gUnknown_3004FE0
_080EA1E8: .4byte sub_80E82F4
	thumb_func_end sub_80EA100

	thumb_func_start sub_80EA1EC
sub_80EA1EC: @ 80EA1EC
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EA1EC

	thumb_func_start sub_80EA1F8
sub_80EA1F8: @ 80EA1F8
	push {r4,r5,lr}
	ldr r0, _080EA238 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x8]
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _080EA23C @ =gUnknown_2024005
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _080EA240 @ =gActiveBattler
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl InitAndLaunchSpecialAnimation
	ldr r1, _080EA244 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA248 @ =sub_80E7970
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA238: .4byte gUnknown_2024018
_080EA23C: .4byte gUnknown_2024005
_080EA240: .4byte gActiveBattler
_080EA244: .4byte gUnknown_3004FE0
_080EA248: .4byte sub_80E7970
	thumb_func_end sub_80EA1F8

	thumb_func_start sub_80EA24C
sub_80EA24C: @ 80EA24C
	push {r4,r5,lr}
	ldr r1, _080EA294 @ =gUnknown_2022BC4
	ldr r5, _080EA298 @ =gActiveBattler
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _080EA29C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	strb r1, [r0, 0x8]
	ldr r1, _080EA2A0 @ =gUnknown_2024005
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl InitAndLaunchSpecialAnimation
	ldr r1, _080EA2A4 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA2A8 @ =sub_80E7970
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA294: .4byte gUnknown_2022BC4
_080EA298: .4byte gActiveBattler
_080EA29C: .4byte gUnknown_2024018
_080EA2A0: .4byte gUnknown_2024005
_080EA2A4: .4byte gUnknown_3004FE0
_080EA2A8: .4byte sub_80E7970
	thumb_func_end sub_80EA24C

	thumb_func_start sub_80EA2AC
sub_80EA2AC: @ 80EA2AC
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EA2AC

	thumb_func_start sub_80EA2B8
sub_80EA2B8: @ 80EA2B8
	push {r4-r6,lr}
	ldr r0, _080EA38C @ =gUnknown_2022BC4
	mov r12, r0
	ldr r6, _080EA390 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _080EA394 @ =gAnimMoveTurn
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _080EA398 @ =gUnknown_2037EEC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _080EA39C @ =gUnknown_2037EE8
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _080EA3A0 @ =gUnknown_2037EFE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _080EA3A4 @ =gUnknown_2037F00
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _080EA3A8 @ =gAnimDisableStructPtr
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _080EA3AC @ =gUnknown_2024008
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl IsMoveWithoutAnimation
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080EA3B0
	bl WallyBufferExecCompleted
	b _080EA3CE
	.align 2, 0
_080EA38C: .4byte gUnknown_2022BC4
_080EA390: .4byte gActiveBattler
_080EA394: .4byte gAnimMoveTurn
_080EA398: .4byte gUnknown_2037EEC
_080EA39C: .4byte gUnknown_2037EE8
_080EA3A0: .4byte gUnknown_2037EFE
_080EA3A4: .4byte gUnknown_2037F00
_080EA3A8: .4byte gAnimDisableStructPtr
_080EA3AC: .4byte gUnknown_2024008
_080EA3B0:
	ldr r0, _080EA3D4 @ =gUnknown_2024018
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x4]
	ldr r1, _080EA3D8 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA3DC @ =sub_80EA3E0
	str r1, [r0]
_080EA3CE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA3D4: .4byte gUnknown_2024018
_080EA3D8: .4byte gUnknown_3004FE0
_080EA3DC: .4byte sub_80EA3E0
	thumb_func_end sub_80EA2B8

	thumb_func_start sub_80EA3E0
sub_80EA3E0: @ 80EA3E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _080EA424 @ =gUnknown_2022BC4
	ldr r6, _080EA428 @ =gActiveBattler
	ldrb r3, [r6]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r9, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r2, 0x2
	mov r8, r2
	add r1, r8
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	ldr r7, _080EA42C @ =gUnknown_2024018
	ldr r5, [r7]
	ldr r1, [r5, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _080EA46A
	cmp r2, 0x1
	bgt _080EA430
	cmp r2, 0
	beq _080EA43A
	b _080EA520
	.align 2, 0
_080EA424: .4byte gUnknown_2022BC4
_080EA428: .4byte gActiveBattler
_080EA42C: .4byte gUnknown_2024018
_080EA430:
	cmp r2, 0x2
	beq _080EA494
	cmp r2, 0x3
	beq _080EA4E4
	b _080EA520
_080EA43A:
	ldr r1, [r5]
	lsls r0, r3, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080EA456
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_080EA456:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _080EA520
_080EA46A:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080EA520
	movs r0, 0
	bl sub_8035450
	adds r0, r4, 0
	bl DoMoveAnim
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0, 0x4]
	b _080EA520
_080EA494:
	ldr r0, _080EA4DC @ =gUnknown_2037EDC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _080EA4E0 @ =gUnknown_2037EE1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EA520
	movs r0, 0x1
	bl sub_8035450
	ldr r0, [r7]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080EA4C8
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl InitAndLaunchSpecialAnimation
_080EA4C8:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _080EA520
	.align 2, 0
_080EA4DC: .4byte gUnknown_2037EDC
_080EA4E0: .4byte gUnknown_2037EE1
_080EA4E4:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080EA520
	bl CopyAllBattleSpritesInvisibilities
	ldrb r0, [r6]
	lsls r2, r0, 9
	mov r3, r9
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r8
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl TrySetBehindSubstituteSpriteBit
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r4, [r0, 0x4]
	bl WallyBufferExecCompleted
_080EA520:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EA3E0

	thumb_func_start sub_80EA52C
sub_80EA52C: @ 80EA52C
	push {r4,lr}
	ldr r0, _080EA55C @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080EA560 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r0, _080EA564 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	ldr r1, _080EA568 @ =gUnknown_2022BC6
	adds r4, r0, r1
	ldr r0, _080EA56C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _080EA570
	ldrh r0, [r4]
	cmp r0, 0x1
	bne _080EA570
	bl WallyBufferExecCompleted
	b _080EA65A
	.align 2, 0
_080EA55C: .4byte gBattle_BG0_X
_080EA560: .4byte gBattle_BG0_Y
_080EA564: .4byte gActiveBattler
_080EA568: .4byte gUnknown_2022BC6
_080EA56C: .4byte gBattleTypeFlags
_080EA570:
	ldrh r0, [r4]
	bl sub_80D7274
	ldrh r0, [r4]
	bl sub_80D89B0
	lsls r0, 24
	cmp r0, 0
	beq _080EA590
	ldr r0, _080EA58C @ =gDisplayedStringBattle
	movs r1, 0x40
	bl sub_80D87BC
	b _080EA598
	.align 2, 0
_080EA58C: .4byte gDisplayedStringBattle
_080EA590:
	ldr r0, _080EA5B4 @ =gDisplayedStringBattle
	movs r1, 0
	bl sub_80D87BC
_080EA598:
	ldr r0, _080EA5B8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA64C
	ldrh r1, [r4]
	cmp r1, 0xD8
	beq _080EA5CC
	cmp r1, 0xD8
	bgt _080EA5BC
	cmp r1, 0x1E
	beq _080EA5F8
	b _080EA64C
	.align 2, 0
_080EA5B4: .4byte gDisplayedStringBattle
_080EA5B8: .4byte gBattleTypeFlags
_080EA5BC:
	cmp r1, 0xE3
	beq _080EA630
	ldr r0, _080EA5C8 @ =0x0000017f
	cmp r1, r0
	beq _080EA614
	b _080EA64C
	.align 2, 0
_080EA5C8: .4byte 0x0000017f
_080EA5CC:
	movs r0, 0x2
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _080EA64C
	movs r0, 0x2
	bl sub_80EB2F4
	ldr r1, _080EA5EC @ =gUnknown_3004FE0
	ldr r0, _080EA5F0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA5F4 @ =sub_80E8584
	b _080EA658
	.align 2, 0
_080EA5EC: .4byte gUnknown_3004FE0
_080EA5F0: .4byte gActiveBattler
_080EA5F4: .4byte sub_80E8584
_080EA5F8:
	ldr r1, _080EA608 @ =gUnknown_3004FE0
	ldr r0, _080EA60C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA610 @ =sub_80E85AC
	b _080EA658
	.align 2, 0
_080EA608: .4byte gUnknown_3004FE0
_080EA60C: .4byte gActiveBattler
_080EA610: .4byte sub_80E85AC
_080EA614:
	ldr r1, _080EA624 @ =gUnknown_3004FE0
	ldr r0, _080EA628 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA62C @ =sub_80E85C0
	b _080EA658
	.align 2, 0
_080EA624: .4byte gUnknown_3004FE0
_080EA628: .4byte gActiveBattler
_080EA62C: .4byte sub_80E85C0
_080EA630:
	ldr r1, _080EA640 @ =gUnknown_3004FE0
	ldr r0, _080EA644 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA648 @ =sub_80E8598
	b _080EA658
	.align 2, 0
_080EA640: .4byte gUnknown_3004FE0
_080EA644: .4byte gActiveBattler
_080EA648: .4byte sub_80E8598
_080EA64C:
	ldr r1, _080EA660 @ =gUnknown_3004FE0
	ldr r0, _080EA664 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA668 @ =sub_80E7918
_080EA658:
	str r1, [r0]
_080EA65A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EA660: .4byte gUnknown_3004FE0
_080EA664: .4byte gActiveBattler
_080EA668: .4byte sub_80E7918
	thumb_func_end sub_80EA52C

	thumb_func_start sub_80EA66C
sub_80EA66C: @ 80EA66C
	push {lr}
	ldr r0, _080EA684 @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080EA688
	bl sub_80EA52C
	b _080EA68C
	.align 2, 0
_080EA684: .4byte gActiveBattler
_080EA688:
	bl WallyBufferExecCompleted
_080EA68C:
	pop {r0}
	bx r0
	thumb_func_end sub_80EA66C

	thumb_func_start sub_80EA690
sub_80EA690: @ 80EA690
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080EA6EA
	ldr r0, _080EA6C4 @ =gBattle_BG0_X
	strh r1, [r0]
	ldr r1, _080EA6C8 @ =gBattle_BG0_Y
	movs r0, 0xA0
	strh r0, [r1]
	ldr r0, _080EA6CC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA6DC
	ldr r1, _080EA6D0 @ =gUnknown_3004FE0
	ldr r0, _080EA6D4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA6D8 @ =sub_80E763C
	b _080EA6E8
	.align 2, 0
_080EA6C4: .4byte gBattle_BG0_X
_080EA6C8: .4byte gBattle_BG0_Y
_080EA6CC: .4byte gBattleTypeFlags
_080EA6D0: .4byte gUnknown_3004FE0
_080EA6D4: .4byte gActiveBattler
_080EA6D8: .4byte sub_80E763C
_080EA6DC:
	ldr r1, _080EA6F0 @ =gUnknown_3004FE0
	ldr r0, _080EA6F4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA6F8 @ =sub_80E7844
_080EA6E8:
	str r1, [r0]
_080EA6EA:
	pop {r0}
	bx r0
	.align 2, 0
_080EA6F0: .4byte gUnknown_3004FE0
_080EA6F4: .4byte gActiveBattler
_080EA6F8: .4byte sub_80E7844
	thumb_func_end sub_80EA690

	thumb_func_start sub_80EA6FC
sub_80EA6FC: @ 80EA6FC
	push {r4,lr}
	ldr r1, _080EA750 @ =gUnknown_3004FE0
	ldr r0, _080EA754 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA758 @ =sub_80EA690
	str r1, [r0]
	ldr r0, _080EA75C @ =gUnknown_83FDA4C
	movs r1, 0
	bl sub_80D87BC
	ldr r0, _080EA760 @ =gUnknown_83FE725
	movs r1, 0x2
	bl sub_80D87BC
	movs r4, 0
_080EA71E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl ActionSelectionDestroyCursorAt
	adds r4, 0x1
	cmp r4, 0x3
	ble _080EA71E
	ldr r1, _080EA764 @ =gUnknown_2023FF8
	ldr r0, _080EA754 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
	ldr r0, _080EA768 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA770
	ldr r0, _080EA76C @ =gUnknown_83FE6D5
	bl BattleStringExpandPlaceholdersToDisplayedString
	b _080EA776
	.align 2, 0
_080EA750: .4byte gUnknown_3004FE0
_080EA754: .4byte gActiveBattler
_080EA758: .4byte sub_80EA690
_080EA75C: .4byte gUnknown_83FDA4C
_080EA760: .4byte gUnknown_83FE725
_080EA764: .4byte gUnknown_2023FF8
_080EA768: .4byte gBattleTypeFlags
_080EA76C: .4byte gUnknown_83FE6D5
_080EA770:
	ldr r0, _080EA784 @ =gUnknown_83FE6FA
	bl BattleStringExpandPlaceholdersToDisplayedString
_080EA776:
	ldr r0, _080EA788 @ =gDisplayedStringBattle
	movs r1, 0x1
	bl sub_80D87BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EA784: .4byte gUnknown_83FE6FA
_080EA788: .4byte gDisplayedStringBattle
	thumb_func_end sub_80EA6FC

	thumb_func_start sub_80EA78C
sub_80EA78C: @ 80EA78C
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EA78C

	thumb_func_start sub_80EA798
sub_80EA798: @ 80EA798
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080EA7C2
	ldr r0, _080EA7C8 @ =gBattle_BG0_X
	strh r1, [r0]
	ldr r1, _080EA7CC @ =gBattle_BG0_Y
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080EA7D0 @ =gUnknown_3004FE0
	ldr r0, _080EA7D4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA7D8 @ =sub_80E7988
	str r1, [r0]
_080EA7C2:
	pop {r0}
	bx r0
	.align 2, 0
_080EA7C8: .4byte gBattle_BG0_X
_080EA7CC: .4byte gBattle_BG0_Y
_080EA7D0: .4byte gUnknown_3004FE0
_080EA7D4: .4byte gActiveBattler
_080EA7D8: .4byte sub_80E7988
	thumb_func_end sub_80EA798

	thumb_func_start sub_80EA7DC
sub_80EA7DC: @ 80EA7DC
	push {r4,lr}
	ldr r0, _080EA800 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA810
	bl sub_8032CB4
	ldr r1, _080EA804 @ =gUnknown_3004FE0
	ldr r0, _080EA808 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA80C @ =sub_80EA798
	str r1, [r0]
	b _080EA866
	.align 2, 0
_080EA800: .4byte gBattleTypeFlags
_080EA804: .4byte gUnknown_3004FE0
_080EA808: .4byte gActiveBattler
_080EA80C: .4byte sub_80EA798
_080EA810:
	ldr r4, _080EA824 @ =gBattleStruct
	ldr r0, [r4]
	adds r0, 0x95
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EA828
	cmp r0, 0x1
	beq _080EA83E
	b _080EA866
	.align 2, 0
_080EA824: .4byte gBattleStruct
_080EA828:
	bl sub_8032CB4
	ldr r1, [r4]
	adds r1, 0x95
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x97
	movs r1, 0x50
	strb r1, [r0]
_080EA83E:
	ldr r0, _080EA86C @ =gBattleStruct
	ldr r1, [r0]
	adds r1, 0x97
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080EA866
	movs r0, 0x5
	bl PlaySE
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x1
	movs r1, 0xA
	bl EmitTwoReturnValues
	bl WallyBufferExecCompleted
_080EA866:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EA86C: .4byte gBattleStruct
	thumb_func_end sub_80EA7DC

	thumb_func_start sub_80EA870
sub_80EA870: @ 80EA870
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080EA8BC @ =gUnknown_3004FE0
	ldr r2, _080EA8C0 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA8C4 @ =sub_80E7A70
	str r1, [r0]
	ldr r1, _080EA8C8 @ =gBattlerInMenuId
	ldrb r0, [r2]
	strb r0, [r1]
	movs r3, 0
	ldr r5, _080EA8CC @ =gUnknown_203B0DC
	ldr r4, _080EA8D0 @ =gUnknown_2022BC4
_080EA89E:
	adds r0, r3, r5
	ldrb r1, [r2]
	lsls r1, 9
	adds r1, 0x1
	adds r1, r3, r1
	adds r1, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x2
	ble _080EA89E
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA8BC: .4byte gUnknown_3004FE0
_080EA8C0: .4byte gActiveBattler
_080EA8C4: .4byte sub_80E7A70
_080EA8C8: .4byte gBattlerInMenuId
_080EA8CC: .4byte gUnknown_203B0DC
_080EA8D0: .4byte gUnknown_2022BC4
	thumb_func_end sub_80EA870

	thumb_func_start sub_80EA8D4
sub_80EA8D4: @ 80EA8D4
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080EA984 @ =TaskDummy
	movs r1, 0xFF
	bl CreateTask
	ldr r3, _080EA988 @ =gUnknown_3004FFC
	ldr r4, _080EA98C @ =gActiveBattler
	ldrb r1, [r4]
	adds r1, r3
	strb r0, [r1]
	ldr r5, _080EA990 @ =gTasks
	ldrb r2, [r4]
	adds r3, r2, r3
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldr r5, _080EA994 @ =gUnknown_2022BC4
	lsls r2, 9
	adds r6, r5, 0x1
	adds r2, r6
	ldrb r2, [r2]
	movs r0, 0xF
	ands r0, r2
	strh r0, [r1, 0x8]
	ldr r3, _080EA998 @ =gBattleStruct
	ldr r1, [r3]
	adds r1, 0x49
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r6
	ldrb r0, [r0]
	lsrs r0, 4
	strb r0, [r1]
	ldr r2, [r3]
	adds r2, 0x8B
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, r5, 0x2
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0xAC
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, r5, 0x3
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r2, 0
	ldr r3, _080EA99C @ =gUnknown_203B0DC
_080EA940:
	adds r0, r2, r3
	ldrb r1, [r4]
	lsls r1, 9
	adds r1, 0x4
	adds r1, r2, r1
	adds r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _080EA940
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080EA9A0 @ =gUnknown_3004FE0
	ldr r2, _080EA98C @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA9A4 @ =sub_80E79B8
	str r1, [r0]
	ldr r1, _080EA9A8 @ =gBattlerInMenuId
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA984: .4byte TaskDummy
_080EA988: .4byte gUnknown_3004FFC
_080EA98C: .4byte gActiveBattler
_080EA990: .4byte gTasks
_080EA994: .4byte gUnknown_2022BC4
_080EA998: .4byte gBattleStruct
_080EA99C: .4byte gUnknown_203B0DC
_080EA9A0: .4byte gUnknown_3004FE0
_080EA9A4: .4byte sub_80E79B8
_080EA9A8: .4byte gBattlerInMenuId
	thumb_func_end sub_80EA8D4

	thumb_func_start sub_80EA9AC
sub_80EA9AC: @ 80EA9AC
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EA9AC

	thumb_func_start sub_80EA9B8
sub_80EA9B8: @ 80EA9B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl LoadBattleBarGfx
	ldr r3, _080EAA30 @ =gUnknown_2022BC4
	ldr r0, _080EAA34 @ =gActiveBattler
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _080EAA38 @ =0x00007fff
	cmp r7, r0
	beq _080EAA48
	ldr r6, _080EAA3C @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080EAA40 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _080EAA44 @ =gUnknown_3004FF0
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _080EAA82
	.align 2, 0
_080EAA30: .4byte gUnknown_2022BC4
_080EAA34: .4byte gActiveBattler
_080EAA38: .4byte 0x00007fff
_080EAA3C: .4byte gBattlerPartyIndexes
_080EAA40: .4byte gPlayerParty
_080EAA44: .4byte gUnknown_3004FF0
_080EAA48:
	ldr r1, _080EAAA0 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080EAAA4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r4, _080EAAA8 @ =gUnknown_3004FF0
	adds r1, r0, r4
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl SetBattleBarStruct
	mov r1, r9
	ldrb r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_8048440
_080EAA82:
	ldr r1, _080EAAAC @ =gUnknown_3004FE0
	ldr r0, _080EAAB0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EAAB4 @ =sub_80E88C0
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAAA0: .4byte gBattlerPartyIndexes
_080EAAA4: .4byte gPlayerParty
_080EAAA8: .4byte gUnknown_3004FF0
_080EAAAC: .4byte gUnknown_3004FE0
_080EAAB0: .4byte gActiveBattler
_080EAAB4: .4byte sub_80E88C0
	thumb_func_end sub_80EA9B8

	thumb_func_start sub_80EAAB8
sub_80EAAB8: @ 80EAAB8
	push {r4-r7,lr}
	ldr r5, _080EAAE4 @ =gUnknown_2022BC4
	ldr r6, _080EAAE8 @ =gActiveBattler
	ldrb r0, [r6]
	lsls r0, 9
	adds r1, r5, 0x1
	adds r0, r1
	ldrb r7, [r0]
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080EAAEC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x63
	bls _080EAAF0
	bl WallyBufferExecCompleted
	b _080EAB3C
	.align 2, 0
_080EAAE4: .4byte gUnknown_2022BC4
_080EAAE8: .4byte gActiveBattler
_080EAAEC: .4byte gPlayerParty
_080EAAF0:
	movs r0, 0x1
	bl LoadBattleBarGfx
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldrb r1, [r6]
	lsls r1, 9
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r5, 0x3
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	ldr r0, _080EAB44 @ =sub_80E7E04
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EAB48 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r7, [r1, 0x8]
	strh r4, [r1, 0xA]
	ldrb r0, [r6]
	strh r0, [r1, 0xC]
	ldr r1, _080EAB4C @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EAB50 @ =nullsub_81
	str r1, [r0]
_080EAB3C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAB44: .4byte sub_80E7E04
_080EAB48: .4byte gTasks
_080EAB4C: .4byte gUnknown_3004FE0
_080EAB50: .4byte nullsub_81
	thumb_func_end sub_80EAAB8

	thumb_func_start sub_80EAB54
sub_80EAB54: @ 80EAB54
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EAB54

	thumb_func_start sub_80EAB60
sub_80EAB60: @ 80EAB60
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EAB60

	thumb_func_start sub_80EAB6C
sub_80EAB6C: @ 80EAB6C
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EAB6C

	thumb_func_start sub_80EAB78
sub_80EAB78: @ 80EAB78
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EAB78

	thumb_func_start sub_80EAB84
sub_80EAB84: @ 80EAB84
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EAB84

	thumb_func_start sub_80EAB90
sub_80EAB90: @ 80EAB90
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EAB90

	thumb_func_start sub_80EAB9C
sub_80EAB9C: @ 80EAB9C
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EAB9C

	thumb_func_start sub_80EABA8
sub_80EABA8: @ 80EABA8
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EABA8

	thumb_func_start sub_80EABB4
sub_80EABB4: @ 80EABB4
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EABB4

	thumb_func_start sub_80EABC0
sub_80EABC0: @ 80EABC0
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EABC0

	thumb_func_start sub_80EABCC
sub_80EABCC: @ 80EABCC
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EABCC

	thumb_func_start sub_80EABD8
sub_80EABD8: @ 80EABD8
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EABD8

	thumb_func_start sub_80EABE4
sub_80EABE4: @ 80EABE4
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EABE4

	thumb_func_start sub_80EABF0
sub_80EABF0: @ 80EABF0
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EABF0

	thumb_func_start sub_80EABFC
sub_80EABFC: @ 80EABFC
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EABFC

	thumb_func_start sub_80EAC08
sub_80EAC08: @ 80EAC08
	push {r4,lr}
	ldr r3, _080EAC30 @ =gSprites
	ldr r2, _080EAC34 @ =gBattlerSpriteIds
	ldr r4, _080EAC38 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _080EAC3C
	bl WallyBufferExecCompleted
	b _080EAC66
	.align 2, 0
_080EAC30: .4byte gSprites
_080EAC34: .4byte gBattlerSpriteIds
_080EAC38: .4byte gActiveBattler
_080EAC3C:
	ldr r1, _080EAC6C @ =gUnknown_2024005
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl DoHitAnimHealthboxEffect
	ldr r1, _080EAC70 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EAC74 @ =DoHitAnimBlinkSpriteEffect_3
	str r1, [r0]
_080EAC66:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EAC6C: .4byte gUnknown_2024005
_080EAC70: .4byte gUnknown_3004FE0
_080EAC74: .4byte DoHitAnimBlinkSpriteEffect_3
	thumb_func_end sub_80EAC08

	thumb_func_start sub_80EAC78
sub_80EAC78: @ 80EAC78
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EAC78

	thumb_func_start sub_80EAC84
sub_80EAC84: @ 80EAC84
	push {lr}
	ldr r2, _080EACAC @ =gUnknown_2022BC4
	ldr r0, _080EACB0 @ =gActiveBattler
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlaySE
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080EACAC: .4byte gUnknown_2022BC4
_080EACB0: .4byte gActiveBattler
	thumb_func_end sub_80EAC84

	thumb_func_start sub_80EACB4
sub_80EACB4: @ 80EACB4
	push {lr}
	ldr r2, _080EACDC @ =gUnknown_2022BC4
	ldr r0, _080EACE0 @ =gActiveBattler
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080EACDC: .4byte gUnknown_2022BC4
_080EACE0: .4byte gActiveBattler
	thumb_func_end sub_80EACB4

	thumb_func_start sub_80EACE4
sub_80EACE4: @ 80EACE4
	push {lr}
	ldr r1, _080EAD14 @ =gBattlerPartyIndexes
	ldr r0, _080EAD18 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080EAD1C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080EAD14: .4byte gBattlerPartyIndexes
_080EAD18: .4byte gActiveBattler
_080EAD1C: .4byte gPlayerParty
	thumb_func_end sub_80EACE4

	thumb_func_start sub_80EAD20
sub_80EAD20: @ 80EAD20
	push {lr}
	ldr r1, _080EAD48 @ =gUnknown_2022BC4
	ldr r0, _080EAD4C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80BC3A0
	ldr r2, _080EAD50 @ =gUnknown_2023F4C
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080EAD48: .4byte gUnknown_2022BC4
_080EAD4C: .4byte gActiveBattler
_080EAD50: .4byte gUnknown_2023F4C
	thumb_func_end sub_80EAD20

	thumb_func_start sub_80EAD54
sub_80EAD54: @ 80EAD54
	push {r4-r7,lr}
	ldr r0, _080EAEA0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080EAD64
	b _080EAEE4
_080EAD64:
	ldr r6, _080EAEA4 @ =gBattlerSpriteIds
	ldr r7, _080EAEA8 @ =gActiveBattler
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080EAEAC @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080EAEB0 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080EAEB4 @ =sub_8075590
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080EAEB8 @ =sub_80335F8
	bl StoreSpriteCallbackInData6
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080EAEBC @ =0x0000d6f8
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	ldr r1, _080EAEC0 @ =gUnknown_8239FD4
	ldr r0, _080EAEC4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	lsrs r4, 20
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _080EAEC8 @ =sub_80EB0A8
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080EAECC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldr r3, _080EAED0 @ =gUnknown_2024018
	ldr r0, [r3]
	ldrb r2, [r7]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EAE84
	ldr r0, _080EAED4 @ =gUnknown_2024000
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _080EAED8 @ =sub_80491B0
	str r1, [r0]
_080EAE84:
	ldr r0, [r3]
	ldr r2, [r0, 0x8]
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _080EAEDC @ =gUnknown_3004FE0
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EAEE0 @ =nullsub_13
	str r1, [r0]
	b _080EAF18
	.align 2, 0
_080EAEA0: .4byte gBattleTypeFlags
_080EAEA4: .4byte gBattlerSpriteIds
_080EAEA8: .4byte gActiveBattler
_080EAEAC: .4byte gSprites
_080EAEB0: .4byte 0x0000ffd8
_080EAEB4: .4byte sub_8075590
_080EAEB8: .4byte sub_80335F8
_080EAEBC: .4byte 0x0000d6f8
_080EAEC0: .4byte gUnknown_8239FD4
_080EAEC4: .4byte gSaveBlock2Ptr
_080EAEC8: .4byte sub_80EB0A8
_080EAECC: .4byte gTasks
_080EAED0: .4byte gUnknown_2024018
_080EAED4: .4byte gUnknown_2024000
_080EAED8: .4byte sub_80491B0
_080EAEDC: .4byte gUnknown_3004FE0
_080EAEE0: .4byte nullsub_13
_080EAEE4:
	ldr r0, _080EAF20 @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _080EAF24 @ =gActiveBattler
	ldrb r3, [r0]
	ldr r1, [r1, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EAF14
	ldr r2, _080EAF28 @ =gTasks
	ldr r0, _080EAF2C @ =gUnknown_2024000
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080EAF30 @ =sub_80491B0
	str r1, [r0]
_080EAF14:
	bl WallyBufferExecCompleted
_080EAF18:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAF20: .4byte gUnknown_2024018
_080EAF24: .4byte gActiveBattler
_080EAF28: .4byte gTasks
_080EAF2C: .4byte gUnknown_2024000
_080EAF30: .4byte sub_80491B0
	thumb_func_end sub_80EAD54

	thumb_func_start sub_80EAF34
sub_80EAF34: @ 80EAF34
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080EB07C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	ldr r0, _080EB080 @ =gBattlerPartyIndexes
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _080EB084 @ =gUnknown_2022BC4
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080EB088 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080EB08C @ =sub_8033E3C
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _080EB090 @ =gUnknown_3004FFC
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080EB094 @ =gMultiuseSpriteTemplate
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8074480
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl GetBankSpriteDefault_Y
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _080EB098 @ =gBattlerSpriteIds
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _080EB09C @ =gSprites
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080EB0A0 @ =gBattleMonForms
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080EB0A4 @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl DoPokeballSendOutAnimation
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB07C: .4byte gUnknown_2024018
_080EB080: .4byte gBattlerPartyIndexes
_080EB084: .4byte gUnknown_2022BC4
_080EB088: .4byte gPlayerParty
_080EB08C: .4byte sub_8033E3C
_080EB090: .4byte gUnknown_3004FFC
_080EB094: .4byte gMultiuseSpriteTemplate
_080EB098: .4byte gBattlerSpriteIds
_080EB09C: .4byte gSprites
_080EB0A0: .4byte gBattleMonForms
_080EB0A4: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EAF34

	thumb_func_start sub_80EB0A8
sub_80EB0A8: @ 80EB0A8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080EB0C8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x1E
	bgt _080EB0CC
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _080EB102
	.align 2, 0
_080EB0C8: .4byte gTasks
_080EB0CC:
	ldr r4, _080EB108 @ =gActiveBattler
	ldrb r5, [r4]
	ldrh r0, [r1, 0x8]
	strb r0, [r4]
	ldr r0, _080EB10C @ =gUnknown_2022BC4
	ldrb r1, [r4]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _080EB110 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_80EAF34
	ldr r1, _080EB114 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EB118 @ =sub_80E7B4C
	str r1, [r0]
	strb r5, [r4]
	adds r0, r6, 0
	bl DestroyTask
_080EB102:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB108: .4byte gActiveBattler
_080EB10C: .4byte gUnknown_2022BC4
_080EB110: .4byte gBattlerPartyIndexes
_080EB114: .4byte gUnknown_3004FE0
_080EB118: .4byte sub_80E7B4C
	thumb_func_end sub_80EB0A8

	thumb_func_start sub_80EB11C
sub_80EB11C: @ 80EB11C
	push {r4,r5,lr}
	ldr r1, _080EB144 @ =gUnknown_2022BC4
	ldr r0, _080EB148 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EB14C
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080EB14C
	bl WallyBufferExecCompleted
	b _080EB18A
	.align 2, 0
_080EB144: .4byte gUnknown_2022BC4
_080EB148: .4byte gActiveBattler
_080EB14C:
	ldr r0, _080EB190 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r5, _080EB194 @ =gActiveBattler
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r4, r0, 9
	ldr r3, _080EB198 @ =gUnknown_2022BC8
	adds r1, r4, r3
	subs r2, r3, 0x3
	adds r2, r4, r2
	ldrb r2, [r2]
	subs r3, 0x2
	adds r4, r3
	ldrb r3, [r4]
	bl sub_8048D14
	ldr r2, _080EB19C @ =gUnknown_2024000
	ldrb r1, [r5]
	adds r1, r2
	strb r0, [r1]
	bl WallyBufferExecCompleted
_080EB18A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EB190: .4byte gUnknown_2024018
_080EB194: .4byte gActiveBattler
_080EB198: .4byte gUnknown_2022BC8
_080EB19C: .4byte gUnknown_2024000
	thumb_func_end sub_80EB11C

	thumb_func_start sub_80EB1A0
sub_80EB1A0: @ 80EB1A0
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EB1A0

	thumb_func_start sub_80EB1AC
sub_80EB1AC: @ 80EB1AC
	push {r4,lr}
	ldr r4, _080EB1CC @ =gActiveBattler
	ldrb r0, [r4]
	movs r1, 0x1
	bl dp11b_obj_free
	ldrb r0, [r4]
	movs r1, 0
	bl dp11b_obj_free
	bl WallyBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB1CC: .4byte gActiveBattler
	thumb_func_end sub_80EB1AC

	thumb_func_start sub_80EB1D0
sub_80EB1D0: @ 80EB1D0
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EB1D0

	thumb_func_start sub_80EB1DC
sub_80EB1DC: @ 80EB1DC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _080EB214 @ =gUnknown_2022BC4
	ldr r6, _080EB218 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, 24
	cmp r0, 0
	beq _080EB21C
	bl WallyBufferExecCompleted
	b _080EB228
	.align 2, 0
_080EB214: .4byte gUnknown_2022BC4
_080EB218: .4byte gActiveBattler
_080EB21C:
	ldr r0, _080EB230 @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080EB234 @ =CompleteOnFinishedBattleAnimation_4
	str r0, [r1]
_080EB228:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB230: .4byte gUnknown_3004FE0
_080EB234: .4byte CompleteOnFinishedBattleAnimation_4
	thumb_func_end sub_80EB1DC

	thumb_func_start sub_80EB238
sub_80EB238: @ 80EB238
	push {r4,lr}
	ldr r1, _080EB26C @ =gUnknown_2022BC4
	ldr r4, _080EB270 @ =gActiveBattler
	ldrb r2, [r4]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	blt _080EB260
	cmp r0, 0x1
	bgt _080EB260
	adds r0, r2, 0
	movs r1, 0x1
	bl dp11b_obj_free
	ldrb r0, [r4]
	movs r1, 0
	bl dp11b_obj_free
_080EB260:
	bl WallyBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB26C: .4byte gUnknown_2022BC4
_080EB270: .4byte gActiveBattler
	thumb_func_end sub_80EB238

	thumb_func_start sub_80EB274
sub_80EB274: @ 80EB274
	push {lr}
	bl WallyBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80EB274

	thumb_func_start sub_80EB280
sub_80EB280: @ 80EB280
	push {r4,lr}
	ldr r2, _080EB2C4 @ =gUnknown_2023E8A
	ldr r1, _080EB2C8 @ =gUnknown_2022BC4
	ldr r4, _080EB2CC @ =gActiveBattler
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl WallyBufferExecCompleted
	ldr r0, _080EB2D0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _080EB2BC
	ldr r0, _080EB2D4 @ =gUnknown_3004FE0
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080EB2D8 @ =sub_80E7930
	str r0, [r1]
_080EB2BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB2C4: .4byte gUnknown_2023E8A
_080EB2C8: .4byte gUnknown_2022BC4
_080EB2CC: .4byte gActiveBattler
_080EB2D0: .4byte gBattleTypeFlags
_080EB2D4: .4byte gUnknown_3004FE0
_080EB2D8: .4byte sub_80E7930
	thumb_func_end sub_80EB280

	thumb_func_start nullsub_82
nullsub_82: @ 80EB2DC
	bx lr
	thumb_func_end nullsub_82

	thumb_func_start sub_80EB2E0
sub_80EB2E0: @ 80EB2E0
	adds r1, r0, 0
	ldr r0, _080EB2F0 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x96
	ldrb r0, [r0]
	ands r0, r1
	bx lr
	.align 2, 0
_080EB2F0: .4byte gBattleStruct
	thumb_func_end sub_80EB2E0

	thumb_func_start sub_80EB2F4
sub_80EB2F4: @ 80EB2F4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080EB308 @ =gBattleStruct
	ldr r1, [r1]
	adds r1, 0x96
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080EB308: .4byte gBattleStruct
	thumb_func_end sub_80EB2F4

	thumb_func_start sub_80EB30C
sub_80EB30C: @ 80EB30C
	push {r4-r6,lr}
	sub sp, 0xC
	movs r6, 0x1A
	movs r5, 0x7
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x30
	movs r2, 0
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x31
	movs r2, 0x1
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r6, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x32
	movs r2, 0x2
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x33
	movs r2, 0x1C
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x34
	movs r2, 0x1D
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x35
	movs r2, 0
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x36
	movs r2, 0x1
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x38
	movs r2, 0x1C
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x39
	movs r2, 0x1D
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3A
	movs r2, 0
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3B
	movs r2, 0x1
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3C
	movs r2, 0x1C
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3D
	movs r2, 0x1D
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	ldr r1, _080EB4F4 @ =0x0000083a
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	ldr r1, _080EB4F8 @ =0x0000083b
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	ldr r1, _080EB4FC @ =0x0000083c
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1C
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	ldr r1, _080EB500 @ =0x0000083d
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1D
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	ldr r1, _080EB504 @ =0x00000835
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0x12
	bl FillBgTilemapBufferRect
	ldr r1, _080EB508 @ =0x00000836
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1
	movs r3, 0x12
	bl FillBgTilemapBufferRect
	ldr r1, _080EB50C @ =0x00000838
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1C
	movs r3, 0x12
	bl FillBgTilemapBufferRect
	ldr r1, _080EB510 @ =0x00000839
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1D
	movs r3, 0x12
	bl FillBgTilemapBufferRect
	movs r1, 0x83
	lsls r1, 4
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	ldr r1, _080EB514 @ =0x00000831
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	ldr r1, _080EB518 @ =0x00000832
	str r6, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x2
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	ldr r1, _080EB51C @ =0x00000833
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1C
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	ldr r1, _080EB520 @ =0x00000834
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB4F4: .4byte 0x0000083a
_080EB4F8: .4byte 0x0000083b
_080EB4FC: .4byte 0x0000083c
_080EB500: .4byte 0x0000083d
_080EB504: .4byte 0x00000835
_080EB508: .4byte 0x00000836
_080EB50C: .4byte 0x00000838
_080EB510: .4byte 0x00000839
_080EB514: .4byte 0x00000831
_080EB518: .4byte 0x00000832
_080EB51C: .4byte 0x00000833
_080EB520: .4byte 0x00000834
	thumb_func_end sub_80EB30C

	thumb_func_start sub_80EB524
sub_80EB524: @ 80EB524
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	movs r5, 0
	movs r0, 0x1A
	mov r8, r0
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	movs r6, 0x4
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x4
	movs r2, 0x1
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x5
	movs r2, 0x2
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x6
	movs r2, 0x1C
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x7
	movs r2, 0x1D
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x8
	movs r2, 0
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x9
	movs r2, 0x1
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xB
	movs r2, 0x1C
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xC
	movs r2, 0x1D
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xD
	movs r2, 0
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xF
	movs r2, 0x2
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1C
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x11
	movs r2, 0x1D
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80EB524

	.align 2, 0 @ Don't pad with nop.
