	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
	bl InitSpriteDataForLinearTranslation
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
	bl IsContest
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
	bl IsContest
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
	bl IsContest
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
	ldr r0, _080B4FE0 @ =gAnimDisableStructPtr
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
_080B4FE0: .4byte gAnimDisableStructPtr
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
	ldr r2, _080B5180 @ =gAnimMoveDmg
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
_080B5180: .4byte gAnimMoveDmg
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

	.align 2, 0 @ Don't pad with nop.
