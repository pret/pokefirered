	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80EEC0C
sub_80EEC0C: @ 80EEC0C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
	ldr r0, _080EEDB4 @ =gBattleAnimAttacker
	ldrb r4, [r0]
	ldr r0, _080EEDB8 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080EEDBC @ =gUnknown_2022986
	strh r1, [r0]
	ldr r1, _080EEDC0 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080EEDC4 @ =0x00003f3d
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080EEDC8 @ =0x00003f42
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
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
	ldr r0, _080EEDCC @ =gHealthboxSpriteIds
	adds r4, r0
	ldrb r0, [r4]
	ldr r1, _080EEDD0 @ =gSprites
	mov r9, r1
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r9
	ldrb r7, [r4, 0x6]
	ldrh r6, [r4, 0x38]
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080EEDD4 @ =SpriteCallbackDummy
	bl CreateInvisibleSpriteWithCallback
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	ldr r0, _080EEDD4 @ =SpriteCallbackDummy
	bl CreateInvisibleSpriteWithCallback
	mov r10, r0
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldrb r1, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x4
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r5, r7, 4
	adds r5, r7
	lsls r5, 2
	add r5, r9
	ldrb r1, [r5, 0x5]
	adds r0, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	add r1, r9
	ldrb r2, [r1, 0x5]
	adds r0, r3, 0
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [sp, 0x14]
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	mov r1, r9
	adds r7, r6, r1
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x44
	str r3, [sp, 0x18]
	bl memcpy
	mov r2, r10
	lsls r4, r2, 4
	add r4, r10
	lsls r4, 2
	adds r0, r4, 0
	add r0, r9
	mov r8, r0
	adds r1, r5, 0
	movs r2, 0x44
	bl memcpy
	ldrb r1, [r7, 0x1]
	ldr r3, [sp, 0x18]
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r7, 0x1]
	mov r2, r8
	ldrb r0, [r2, 0x1]
	ands r3, r0
	orrs r3, r1
	strb r3, [r2, 0x1]
	movs r0, 0x1C
	add r9, r0
	add r6, r9
	ldr r1, _080EEDD4 @ =SpriteCallbackDummy
	str r1, [r6]
	add r4, r9
	str r1, [r4]
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080EEDD8 @ =gFile_graphics_battle_anims_masks_unknown_D2EC24_tilemap
	bl sub_807543C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080EEDDC @ =gFile_graphics_battle_anims_masks_unknown_D2EC24_sheet
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080EEDE0 @ =gFile_graphics_battle_anims_masks_cure_bubbles_palette
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _080EEDE4 @ =gBattle_BG1_X
	ldrh r0, [r7, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r1]
	ldr r1, _080EEDE8 @ =gBattle_BG1_Y
	ldrh r0, [r7, 0x22]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r1]
	ldr r1, _080EEDEC @ =gTasks
	ldr r2, [sp, 0x10]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xA0
	lsls r1, 2
	strh r1, [r0, 0xA]
	mov r1, sp
	ldrh r1, [r1, 0x14]
	strh r1, [r0, 0x8]
	mov r2, r10
	strh r2, [r0, 0xC]
	ldr r1, _080EEDF0 @ =sub_80EEDF4
	str r1, [r0]
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EEDB4: .4byte gBattleAnimAttacker
_080EEDB8: .4byte gUnknown_2022984
_080EEDBC: .4byte gUnknown_2022986
_080EEDC0: .4byte 0x00003f3f
_080EEDC4: .4byte 0x00003f3d
_080EEDC8: .4byte 0x00003f42
_080EEDCC: .4byte gHealthboxSpriteIds
_080EEDD0: .4byte gSprites
_080EEDD4: .4byte SpriteCallbackDummy
_080EEDD8: .4byte gFile_graphics_battle_anims_masks_unknown_D2EC24_tilemap
_080EEDDC: .4byte gFile_graphics_battle_anims_masks_unknown_D2EC24_sheet
_080EEDE0: .4byte gFile_graphics_battle_anims_masks_cure_bubbles_palette
_080EEDE4: .4byte gBattle_BG1_X
_080EEDE8: .4byte gBattle_BG1_Y
_080EEDEC: .4byte gTasks
_080EEDF0: .4byte sub_80EEDF4
	thumb_func_end sub_80EEC0C

	thumb_func_start sub_80EEDF4
sub_80EEDF4: @ 80EEDF4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080EEE3C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, _080EEE40 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrh r1, [r5, 0xA]
	ldrh r0, [r5, 0x22]
	adds r1, r0
	movs r3, 0
	strh r1, [r5, 0x22]
	ldr r2, _080EEE44 @ =gBattle_BG1_Y
	lsls r0, r1, 16
	lsrs r0, 24
	ldrh r4, [r2]
	adds r0, r4
	strh r0, [r2]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r5, 0x22]
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080EEE84
	cmp r0, 0x1
	bgt _080EEE48
	cmp r0, 0
	beq _080EEE4E
	b _080EEFA8
	.align 2, 0
_080EEE3C: .4byte gBattleAnimAttacker
_080EEE40: .4byte gTasks
_080EEE44: .4byte gBattle_BG1_Y
_080EEE48:
	cmp r0, 0x2
	beq _080EEE9C
	b _080EEFA8
_080EEE4E:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _080EEE5E
	b _080EEFA8
_080EEE5E:
	strh r3, [r5, 0x1E]
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
	ldrsh r0, [r5, r2]
	cmp r0, 0x8
	beq _080EEE82
	b _080EEFA8
_080EEE82:
	b _080EEE94
_080EEE84:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	beq _080EEE94
	b _080EEFA8
_080EEE94:
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
	b _080EEFA8
_080EEE9C:
	ldrh r0, [r5, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080EEFA8
	strh r3, [r5, 0x1E]
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
	bne _080EEFA8
	movs r0, 0
	bl sub_8073128
	ldr r0, _080EEFB4 @ =gUnknown_2022984
	strh r4, [r0]
	ldr r0, _080EEFB8 @ =gUnknown_2022986
	strh r4, [r0]
	ldr r4, _080EEFBC @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080EEF00
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080EEF00:
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
	movs r4, 0x8
	ldrsh r1, [r5, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _080EEFC0 @ =gSprites
	adds r0, r6
	bl DestroySprite
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetAnimBgAttribute
	ldr r0, _080EEFC4 @ =gHealthboxSpriteIds
	add r0, r8
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x6]
	mov r8, r2
	ldrh r4, [r1, 0x38]
	lsls r4, 24
	lsrs r4, 24
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r5, 0x4
	orrs r0, r5
	strb r0, [r1, 0x5]
	mov r0, r8
	lsls r1, r0, 4
	add r1, r8
	lsls r1, 2
	adds r1, r6
	ldrb r3, [r1, 0x5]
	adds r0, r2, 0
	ands r0, r3
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x5]
	ands r2, r1
	orrs r2, r5
	strb r2, [r0, 0x5]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080EEFA8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EEFB4: .4byte gUnknown_2022984
_080EEFB8: .4byte gUnknown_2022986
_080EEFBC: .4byte 0x00003f3f
_080EEFC0: .4byte gSprites
_080EEFC4: .4byte gHealthboxSpriteIds
	thumb_func_end sub_80EEDF4

	thumb_func_start sub_80EEFC8
sub_80EEFC8: @ 80EEFC8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080EF0A0 @ =gHealthboxSpriteIds
	adds r2, r0
	ldrb r0, [r2]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r0, _080EF0A4 @ =gSprites
	adds r5, r0
	ldrb r1, [r5, 0x6]
	mov r10, r1
	ldrh r4, [r5, 0x38]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080EF0A8 @ =0x0000d709
	bl AllocSpritePalette
	mov r2, r9
	strb r0, [r2]
	ldr r0, _080EF0AC @ =0x0000d70a
	bl AllocSpritePalette
	strb r0, [r7]
	ldrb r0, [r5, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r1, 0x80
	lsls r1, 1
	adds r3, r1, 0
	orrs r0, r3
	lsls r6, r4, 4
	adds r6, r4
	lsls r6, 2
	ldr r2, _080EF0A4 @ =gSprites
	adds r6, r2
	ldrb r4, [r6, 0x5]
	lsrs r4, 4
	lsls r4, 4
	orrs r4, r3
	lsls r0, 1
	ldr r1, _080EF0B0 @ =gPlttBufferUnfaded
	mov r8, r1
	add r0, r8
	mov r2, r9
	ldrb r1, [r2]
	lsls r1, 4
	adds r1, r3, r1
	movs r2, 0x20
	str r3, [sp]
	bl LoadPalette
	lsls r4, 1
	add r4, r8
	ldrb r0, [r7]
	lsls r0, 4
	ldr r3, [sp]
	adds r3, r0
	adds r0, r4, 0
	adds r1, r3, 0
	movs r2, 0x20
	bl LoadPalette
	mov r0, r9
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r5, 0x5]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r2, r10
	lsls r1, r2, 4
	add r1, r10
	lsls r1, 2
	ldr r0, _080EF0A4 @ =gSprites
	adds r1, r0
	mov r0, r9
	ldrb r2, [r0]
	lsls r2, 4
	ldrb r4, [r1, 0x5]
	adds r0, r3, 0
	ands r0, r4
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldrb r0, [r7]
	lsls r0, 4
	ldrb r1, [r6, 0x5]
	ands r3, r1
	orrs r3, r0
	strb r3, [r6, 0x5]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF0A0: .4byte gHealthboxSpriteIds
_080EF0A4: .4byte gSprites
_080EF0A8: .4byte 0x0000d709
_080EF0AC: .4byte 0x0000d70a
_080EF0B0: .4byte gPlttBufferUnfaded
	thumb_func_end sub_80EEFC8

	thumb_func_start sub_80EF0B4
sub_80EF0B4: @ 80EF0B4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, sp
	adds r1, 0x1
	ldr r0, _080EF0DC @ =gBattleAnimAttacker
	ldrb r2, [r0]
	mov r0, sp
	bl sub_80EEFC8
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF0DC: .4byte gBattleAnimAttacker
	thumb_func_end sub_80EF0B4

	thumb_func_start sub_80EF0E0
sub_80EF0E0: @ 80EF0E0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080EF168 @ =gHealthboxSpriteIds
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _080EF16C @ =gSprites
	mov r8, r1
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	add r5, r8
	ldrb r0, [r5, 0x6]
	mov r9, r0
	ldrh r6, [r5, 0x38]
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080EF170 @ =0x0000d709
	bl FreeSpritePaletteByTag
	ldr r0, _080EF174 @ =0x0000d70a
	bl FreeSpritePaletteByTag
	ldr r0, _080EF178 @ =0x0000d6ff
	bl IndexOfSpritePaletteTag
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080EF17C @ =0x0000d704
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsls r4, 4
	ldrb r2, [r5, 0x5]
	movs r3, 0xF
	adds r1, r3, 0
	ands r1, r2
	orrs r1, r4
	strb r1, [r5, 0x5]
	mov r1, r9
	lsls r2, r1, 4
	add r2, r9
	lsls r2, 2
	add r2, r8
	ldrb r5, [r2, 0x5]
	adds r1, r3, 0
	ands r1, r5
	orrs r1, r4
	strb r1, [r2, 0x5]
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	add r1, r8
	lsrs r0, 20
	ldrb r2, [r1, 0x5]
	ands r3, r2
	orrs r3, r0
	strb r3, [r1, 0x5]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EF168: .4byte gHealthboxSpriteIds
_080EF16C: .4byte gSprites
_080EF170: .4byte 0x0000d709
_080EF174: .4byte 0x0000d70a
_080EF178: .4byte 0x0000d6ff
_080EF17C: .4byte 0x0000d704
	thumb_func_end sub_80EF0E0

	thumb_func_start sub_80EF180
sub_80EF180: @ 80EF180
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080EF19C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80EF0E0
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF19C: .4byte gBattleAnimAttacker
	thumb_func_end sub_80EF180

	thumb_func_start sub_80EF1A0
sub_80EF1A0: @ 80EF1A0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EF1C0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080EF1C4 @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r1, 0x1C]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0x1E]
	ldr r0, _080EF1C8 @ =sub_80EF1CC
	str r0, [r1]
	bx lr
	.align 2, 0
_080EF1C0: .4byte gTasks
_080EF1C4: .4byte gBattleAnimArgs
_080EF1C8: .4byte sub_80EF1CC
	thumb_func_end sub_80EF1A0

	thumb_func_start sub_80EF1CC
sub_80EF1CC: @ 80EF1CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080EF218 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r6, 0
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1E
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080EF28C
	strh r6, [r4, 0x8]
	ldr r0, _080EF21C @ =0x0000d709
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0x1C
	ldrsh r0, [r4, r3]
	movs r1, 0x2
	cmp r0, 0
	bne _080EF20A
	movs r1, 0x6
_080EF20A:
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080EF220
	cmp r0, 0x1
	beq _080EF25C
	b _080EF28C
	.align 2, 0
_080EF218: .4byte gTasks
_080EF21C: .4byte 0x0000d709
_080EF220:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080EF232
	movs r0, 0x10
	strh r0, [r4, 0xC]
_080EF232:
	lsls r0, r2, 4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2
	orrs r0, r1
	ldrb r2, [r4, 0xC]
	ldr r3, _080EF258 @ =0x00007f74
	movs r1, 0x1
	bl BlendPalette
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bne _080EF28C
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080EF28C
	.align 2, 0
_080EF258: .4byte 0x00007f74
_080EF25C:
	ldrh r0, [r4, 0xC]
	subs r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bge _080EF26A
	strh r6, [r4, 0xC]
_080EF26A:
	lsls r0, r2, 4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2
	orrs r0, r1
	ldrb r2, [r4, 0xC]
	ldr r3, _080EF294 @ =0x00007f74
	movs r1, 0x1
	bl BlendPalette
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080EF28C
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080EF28C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EF294: .4byte 0x00007f74
	thumb_func_end sub_80EF1CC

	thumb_func_start sub_80EF298
sub_80EF298: @ 80EF298
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080EF2C4 @ =gBattlerSpriteIds
	ldr r0, _080EF2C8 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r5, [r0]
	ldr r1, _080EF2CC @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080EF2E6
	cmp r0, 0x1
	bgt _080EF2D0
	cmp r0, 0
	beq _080EF2D6
	b _080EF338
	.align 2, 0
_080EF2C4: .4byte gBattlerSpriteIds
_080EF2C8: .4byte gBattleAnimAttacker
_080EF2CC: .4byte gTasks
_080EF2D0:
	cmp r0, 0x2
	beq _080EF318
	b _080EF338
_080EF2D6:
	adds r0, r5, 0
	movs r1, 0
	bl PrepareBattlerSpriteForRotScale
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x1C]
	b _080EF30A
_080EF2E6:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x30
	strh r0, [r4, 0x1C]
	movs r0, 0x1C
	ldrsh r2, [r4, r0]
	adds r0, r5, 0
	adds r1, r2, 0
	movs r3, 0
	bl SetSpriteRotScale
	adds r0, r5, 0
	bl sub_8076440
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	ldr r0, _080EF314 @ =0x000002cf
	cmp r1, r0
	ble _080EF338
_080EF30A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080EF338
	.align 2, 0
_080EF314: .4byte 0x000002cf
_080EF318:
	adds r0, r5, 0
	bl ResetSpriteRotScale
	ldr r1, _080EF340 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080EF338:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EF340: .4byte gSprites
	thumb_func_end sub_80EF298

	thumb_func_start sub_80EF344
sub_80EF344: @ 80EF344
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080EF37C @ =gBattlerSpriteIds
	ldr r4, _080EF380 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	adds r1, r0, r1
	ldrb r1, [r1]
	mov r9, r1
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080EF38C
	ldr r1, _080EF384 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080EF388 @ =gPlayerParty
	b _080EF39C
	.align 2, 0
_080EF37C: .4byte gBattlerSpriteIds
_080EF380: .4byte gBattleAnimAttacker
_080EF384: .4byte gBattlerPartyIndexes
_080EF388: .4byte gPlayerParty
_080EF38C:
	ldr r1, _080EF3CC @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080EF3D0 @ =gEnemyParty
_080EF39C:
	adds r0, r1
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl ItemIdToBallId
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _080EF3D4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r6, r0, r2
	movs r0, 0x8
	ldrsh r7, [r6, r0]
	cmp r7, 0
	beq _080EF3D8
	cmp r7, 0x1
	beq _080EF458
	b _080EF482
	.align 2, 0
_080EF3CC: .4byte gBattlerPartyIndexes
_080EF3D0: .4byte gEnemyParty
_080EF3D4: .4byte gTasks
_080EF3D8:
	ldr r5, _080EF450 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0
	bl GetBattlerSpriteCoord
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	adds r1, r0, 0
	lsls r1, 24
	ldr r2, _080EF454 @ =gSprites
	mov r3, r9
	lsls r0, r3, 4
	add r0, r9
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r0, 0x43
	ldrb r3, [r0]
	movs r0, 0x80
	lsls r0, 22
	adds r1, r0
	lsrs r1, 24
	mov r0, r8
	str r0, [sp]
	adds r0, r4, 0
	bl LaunchBallStarsTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x1C]
	str r7, [sp]
	str r7, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8075BE8
	adds r2, r0, 0
	ldrb r1, [r5]
	movs r0, 0
	mov r3, r8
	bl LaunchBallFadeMonTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x1E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _080EF482
	.align 2, 0
_080EF450: .4byte gBattleAnimAttacker
_080EF454: .4byte gSprites
_080EF458:
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _080EF482
	movs r3, 0x1E
	ldrsh r0, [r6, r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _080EF482
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080EF482:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EF344

	thumb_func_start sub_80EF490
sub_80EF490: @ 80EF490
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080EF4B4 @ =gUnknown_2023D68
	ldrh r0, [r0]
	bl ItemIdToBallId
	lsls r0, 24
	lsrs r0, 24
	bl LoadBallGfx
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF4B4: .4byte gUnknown_2023D68
	thumb_func_end sub_80EF490

	thumb_func_start sub_80EF4B8
sub_80EF4B8: @ 80EF4B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080EF4DC @ =gUnknown_2023D68
	ldrh r0, [r0]
	bl ItemIdToBallId
	lsls r0, 24
	lsrs r0, 24
	bl FreeBallGfx
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF4DC: .4byte gUnknown_2023D68
	thumb_func_end sub_80EF4B8

	thumb_func_start sub_80EF4E0
sub_80EF4E0: @ 80EF4E0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080EF4FC @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	beq _080EF504
	cmp r0, 0x6
	beq _080EF514
	ldr r1, _080EF500 @ =gBattleAnimArgs
	movs r0, 0
	b _080EF518
	.align 2, 0
_080EF4FC: .4byte gBattleSpritesDataPtr
_080EF500: .4byte gBattleAnimArgs
_080EF504:
	ldr r1, _080EF50C @ =gBattleAnimArgs
	ldr r0, _080EF510 @ =0x0000ffff
	b _080EF518
	.align 2, 0
_080EF50C: .4byte gBattleAnimArgs
_080EF510: .4byte 0x0000ffff
_080EF514:
	ldr r1, _080EF524 @ =gBattleAnimArgs
	ldr r0, _080EF528 @ =0x0000fffe
_080EF518:
	strh r0, [r1, 0xE]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080EF524: .4byte gBattleAnimArgs
_080EF528: .4byte 0x0000fffe
	thumb_func_end sub_80EF4E0

	thumb_func_start ItemIdToBallId
ItemIdToBallId: @ 80EF52C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	subs r0, 0x1
	cmp r0, 0xB
	bhi _080EF5A4
	lsls r0, 2
	ldr r1, _080EF544 @ =_080EF548
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EF544: .4byte _080EF548
	.align 2, 0
_080EF548:
	.4byte _080EF578
	.4byte _080EF57C
	.4byte _080EF580
	.4byte _080EF5A4
	.4byte _080EF584
	.4byte _080EF588
	.4byte _080EF58C
	.4byte _080EF590
	.4byte _080EF594
	.4byte _080EF598
	.4byte _080EF59C
	.4byte _080EF5A0
_080EF578:
	movs r0, 0x4
	b _080EF5A6
_080EF57C:
	movs r0, 0x3
	b _080EF5A6
_080EF580:
	movs r0, 0x1
	b _080EF5A6
_080EF584:
	movs r0, 0x2
	b _080EF5A6
_080EF588:
	movs r0, 0x5
	b _080EF5A6
_080EF58C:
	movs r0, 0x6
	b _080EF5A6
_080EF590:
	movs r0, 0x7
	b _080EF5A6
_080EF594:
	movs r0, 0x8
	b _080EF5A6
_080EF598:
	movs r0, 0x9
	b _080EF5A6
_080EF59C:
	movs r0, 0xA
	b _080EF5A6
_080EF5A0:
	movs r0, 0xB
	b _080EF5A6
_080EF5A4:
	movs r0, 0
_080EF5A6:
	pop {r1}
	bx r1
	thumb_func_end ItemIdToBallId

	thumb_func_start sub_80EF5AC
sub_80EF5AC: @ 80EF5AC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	mov r10, r0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _080EF674 @ =gUnknown_2023D68
	ldrh r0, [r0]
	bl ItemIdToBallId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _080EF678 @ =gUnknown_82606F4
	adds r0, r1
	movs r1, 0x20
	movs r2, 0x50
	movs r3, 0x1D
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080EF67C @ =gSprites
	mov r9, r1
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r6, r4, r1
	movs r0, 0x22
	strh r0, [r6, 0x2E]
	ldr r2, _080EF680 @ =gBattleAnimTarget
	mov r8, r2
	ldrb r0, [r2]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x30]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r6, 0x32]
	mov r0, r9
	adds r0, 0x1C
	adds r4, r0
	ldr r0, _080EF684 @ =sub_80EF8C0
	str r0, [r4]
	ldr r0, _080EF688 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r3, [r0, 0x8]
	ldr r1, _080EF68C @ =gBattlerSpriteIds
	mov r2, r8
	ldrb r0, [r2]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	lsls r1, 1
	ldrb r2, [r3, 0x9]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x9]
	ldr r1, _080EF690 @ =gTasks
	mov r2, r10
	lsls r0, r2, 2
	add r0, r10
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r1, _080EF694 @ =sub_80EF698
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EF674: .4byte gUnknown_2023D68
_080EF678: .4byte gUnknown_82606F4
_080EF67C: .4byte gSprites
_080EF680: .4byte gBattleAnimTarget
_080EF684: .4byte sub_80EF8C0
_080EF688: .4byte gBattleSpritesDataPtr
_080EF68C: .4byte gBattlerSpriteIds
_080EF690: .4byte gTasks
_080EF694: .4byte sub_80EF698
	thumb_func_end sub_80EF5AC

	thumb_func_start sub_80EF698
sub_80EF698: @ 80EF698
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _080EF6C8 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	ldr r2, _080EF6CC @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	ldr r0, _080EF6D0 @ =0x0000ffff
	cmp r1, r0
	bne _080EF6C2
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080EF6C2:
	pop {r0}
	bx r0
	.align 2, 0
_080EF6C8: .4byte gTasks
_080EF6CC: .4byte gSprites
_080EF6D0: .4byte 0x0000ffff
	thumb_func_end sub_80EF698

	thumb_func_start sub_80EF6D4
sub_80EF6D4: @ 80EF6D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080EF6F4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _080EF6F8
	movs r5, 0x1C
	movs r6, 0xB
	b _080EF708
	.align 2, 0
_080EF6F4: .4byte gBattleTypeFlags
_080EF6F8:
	movs r5, 0x17
	movs r6, 0xB
	ldr r0, _080EF7C4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1
	bne _080EF708
	movs r6, 0xD
_080EF708:
	ldr r0, _080EF7C8 @ =gUnknown_2023D68
	ldrh r0, [r0]
	bl ItemIdToBallId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	bl sub_807685C
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _080EF7CC @ =gUnknown_82606F4
	adds r0, r1
	movs r1, 0x20
	orrs r5, r1
	movs r1, 0x50
	orrs r6, r1
	adds r1, r5, 0
	adds r2, r6, 0
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080EF7D0 @ =gSprites
	mov r9, r0
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r6, r4, r0
	movs r0, 0x22
	strh r0, [r6, 0x2E]
	ldr r1, _080EF7D4 @ =gBattleAnimTarget
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x30]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r6, 0x32]
	movs r0, 0x1C
	add r9, r0
	add r4, r9
	ldr r0, _080EF7D8 @ =SpriteCallbackDummy
	str r0, [r4]
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _080EF7DC @ =gBattlerSpriteIds
	lsls r0, 24
	lsrs r0, 24
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldr r1, _080EF7E0 @ =sub_8012354
	str r1, [r0]
	ldr r1, _080EF7E4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r1, _080EF7E8 @ =sub_80EF7EC
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF7C4: .4byte gSaveBlock2Ptr
_080EF7C8: .4byte gUnknown_2023D68
_080EF7CC: .4byte gUnknown_82606F4
_080EF7D0: .4byte gSprites
_080EF7D4: .4byte gBattleAnimTarget
_080EF7D8: .4byte SpriteCallbackDummy
_080EF7DC: .4byte gBattlerSpriteIds
_080EF7E0: .4byte sub_8012354
_080EF7E4: .4byte gTasks
_080EF7E8: .4byte sub_80EF7EC
	thumb_func_end sub_80EF6D4

	thumb_func_start sub_80EF7EC
sub_80EF7EC: @ 80EF7EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _080EF84C @ =gSprites
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _080EF850 @ =gBattlerSpriteIds
	lsls r0, 24
	lsrs r0, 24
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080EF846
	movs r0, 0x36
	movs r1, 0
	bl PlaySE12WithPanning
	ldr r0, _080EF854 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080EF858 @ =sub_80EF8C0
	str r1, [r0]
	ldr r0, _080EF85C @ =sub_80EF864
	movs r1, 0xA
	bl CreateTask
	ldr r0, _080EF860 @ =sub_80EF698
	str r0, [r4]
_080EF846:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EF84C: .4byte gSprites
_080EF850: .4byte gBattlerSpriteIds
_080EF854: .4byte gTasks
_080EF858: .4byte sub_80EF8C0
_080EF85C: .4byte sub_80EF864
_080EF860: .4byte sub_80EF698
	thumb_func_end sub_80EF7EC

	thumb_func_start sub_80EF864
sub_80EF864: @ 80EF864
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _080EF8B8 @ =gSprites
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r4, _080EF8BC @ =gBattlerSpriteIds
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _080EF8B0
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl DestroyTask
_080EF8B0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EF8B8: .4byte gSprites
_080EF8BC: .4byte gBattlerSpriteIds
	thumb_func_end sub_80EF864

	thumb_func_start sub_80EF8C0
sub_80EF8C0: @ 80EF8C0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x32]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r0, _080EF8E8 @ =0x0000ffd8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	ldr r0, _080EF8EC @ =sub_80EF8F0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF8E8: .4byte 0x0000ffd8
_080EF8EC: .4byte sub_80EF8F0
	thumb_func_end sub_80EF8C0

	thumb_func_start sub_80EF8F0
sub_80EF8F0: @ 80EF8F0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080EF99E
	ldr r0, _080EF914 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bne _080EF91C
	ldr r0, _080EF918 @ =sub_80F0478
	str r0, [r4, 0x1C]
	b _080EF99E
	.align 2, 0
_080EF914: .4byte gBattleSpritesDataPtr
_080EF918: .4byte sub_80F0478
_080EF91C:
	cmp r0, 0x6
	bne _080EF92C
	ldr r0, _080EF928 @ =sub_80F052C
	str r0, [r4, 0x1C]
	b _080EF99E
	.align 2, 0
_080EF928: .4byte sub_80F052C
_080EF92C:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r1, r4, 0
	adds r1, 0x2E
	movs r2, 0
	adds r0, r4, 0
	adds r0, 0x3C
_080EF954:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _080EF954
	movs r0, 0
	strh r0, [r4, 0x38]
	ldr r0, _080EF9A8 @ =sub_80EF9B4
	str r0, [r4, 0x1C]
	ldr r0, _080EF9AC @ =gUnknown_2023D68
	ldrh r0, [r0]
	bl ItemIdToBallId
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xB
	bgt _080EF99E
	cmp r5, 0
	blt _080EF99E
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	str r5, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl LaunchBallStarsTask
	ldr r0, _080EF9B0 @ =gBattleAnimTarget
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0xE
	adds r3, r5, 0
	bl LaunchBallFadeMonTask
_080EF99E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EF9A8: .4byte sub_80EF9B4
_080EF9AC: .4byte gUnknown_2023D68
_080EF9B0: .4byte gBattleAnimTarget
	thumb_func_end sub_80EF8F0

	thumb_func_start sub_80EF9B4
sub_80EF9B4: @ 80EF9B4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080EF9F0
	ldr r0, _080EF9F8 @ =TaskDummy
	movs r1, 0x32
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x38]
	ldr r0, _080EF9FC @ =sub_80EFA0C
	str r0, [r4, 0x1C]
	ldr r2, _080EFA00 @ =gSprites
	ldr r1, _080EFA04 @ =gBattlerSpriteIds
	ldr r0, _080EFA08 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
_080EF9F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF9F8: .4byte TaskDummy
_080EF9FC: .4byte sub_80EFA0C
_080EFA00: .4byte gSprites
_080EFA04: .4byte gBattlerSpriteIds
_080EFA08: .4byte gBattleAnimTarget
	thumb_func_end sub_80EF9B4

	thumb_func_start sub_80EFA0C
sub_80EFA0C: @ 80EFA0C
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r1, _080EFA50 @ =gBattlerSpriteIds
	ldr r0, _080EFA54 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r4, [r0]
	ldrh r0, [r7, 0x38]
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080EFA58 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _080EFA3E
	movs r0, 0x35
	bl PlaySE
_080EFA3E:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080EFAB4
	cmp r0, 0x1
	bgt _080EFA5C
	cmp r0, 0
	beq _080EFA62
	b _080EFB20
	.align 2, 0
_080EFA50: .4byte gBattlerSpriteIds
_080EFA54: .4byte gBattleAnimTarget
_080EFA58: .4byte gTasks
_080EFA5C:
	cmp r0, 0x2
	beq _080EFAF8
	b _080EFB20
_080EFA62:
	adds r0, r4, 0
	movs r1, 0
	bl PrepareBattlerSpriteForRotScale
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x1C]
	ldr r1, _080EFAA4 @ =gUnknown_3005424
	movs r0, 0x1C
	str r0, [r1]
	ldr r2, _080EFAA8 @ =gUnknown_300542C
	ldr r1, _080EFAAC @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	ldrh r0, [r7, 0x26]
	ldrh r7, [r7, 0x22]
	adds r0, r7
	subs r1, r0
	strh r1, [r2]
	ldr r4, _080EFAB0 @ =gUnknown_3005428
	ldrh r0, [r2]
	lsls r0, 8
	movs r1, 0x1C
	bl __udivsi3
	strh r0, [r4]
	strh r0, [r5, 0xC]
	b _080EFB12
	.align 2, 0
_080EFAA4: .4byte gUnknown_3005424
_080EFAA8: .4byte gUnknown_300542C
_080EFAAC: .4byte gSprites
_080EFAB0: .4byte gUnknown_3005428
_080EFAB4:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x20
	strh r0, [r5, 0x1C]
	movs r0, 0x1C
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r1, r2, 0
	movs r3, 0
	bl SetSpriteRotScale
	ldrh r0, [r5, 0xC]
	ldrh r1, [r5, 0xE]
	adds r0, r1
	strh r0, [r5, 0xE]
	ldr r0, _080EFAF0 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	negs r0, r0
	asrs r0, 8
	strh r0, [r1, 0x26]
	movs r0, 0x1C
	ldrsh r1, [r5, r0]
	ldr r0, _080EFAF4 @ =0x0000047f
	cmp r1, r0
	ble _080EFB48
	b _080EFB12
	.align 2, 0
_080EFAF0: .4byte gSprites
_080EFAF4: .4byte 0x0000047f
_080EFAF8:
	adds r0, r4, 0
	bl ResetSpriteRotScale
	ldr r1, _080EFB1C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080EFB12:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080EFB48
	.align 2, 0
_080EFB1C: .4byte gSprites
_080EFB20:
	ldr r0, _080EFB50 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0xA
	ble _080EFB48
	adds r0, r6, 0
	bl DestroyTask
	adds r0, r7, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r7, 0x38]
	ldr r0, _080EFB54 @ =sub_80EFB58
	str r0, [r7, 0x1C]
_080EFB48:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EFB50: .4byte gTasks
_080EFB54: .4byte sub_80EFB58
	thumb_func_end sub_80EFA0C

	thumb_func_start sub_80EFB58
sub_80EFB58: @ 80EFB58
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EFB92
	movs r1, 0
	strh r1, [r4, 0x34]
	movs r0, 0x28
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	movs r0, 0
	movs r1, 0x28
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldr r0, _080EFB98 @ =sub_80EFB9C
	str r0, [r4, 0x1C]
_080EFB92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EFB98: .4byte sub_80EFB9C
	thumb_func_end sub_80EFB58

	thumb_func_start sub_80EFB9C
sub_80EFB9C: @ 80EFB9C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0
	beq _080EFBB2
	cmp r1, 0x1
	beq _080EFC26
	b _080EFC52
_080EFBB2:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	adds r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	adds r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3F
	ble _080EFC52
	ldrh r0, [r4, 0x36]
	subs r0, 0xA
	strh r0, [r4, 0x36]
	ldr r1, _080EFBFC @ =0x00000101
	adds r0, r2, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _080EFBEE
	movs r5, 0x1
_080EFBEE:
	cmp r0, 0x2
	beq _080EFC0E
	cmp r0, 0x2
	bgt _080EFC00
	cmp r0, 0x1
	beq _080EFC06
	b _080EFC1E
	.align 2, 0
_080EFBFC: .4byte 0x00000101
_080EFC00:
	cmp r0, 0x3
	beq _080EFC16
	b _080EFC1E
_080EFC06:
	movs r0, 0x31
	bl PlaySE
	b _080EFC52
_080EFC0E:
	movs r0, 0x32
	bl PlaySE
	b _080EFC52
_080EFC16:
	movs r0, 0x33
	bl PlaySE
	b _080EFC52
_080EFC1E:
	movs r0, 0x34
	bl PlaySE
	b _080EFC52
_080EFC26:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	subs r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	subs r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	cmp r1, 0
	bgt _080EFC52
	strh r5, [r4, 0x38]
	ldr r0, _080EFC80 @ =0xffffff00
	ands r0, r2
	strh r0, [r4, 0x34]
_080EFC52:
	cmp r5, 0
	beq _080EFC96
	movs r5, 0
	strh r5, [r4, 0x34]
	movs r0, 0x40
	movs r1, 0x28
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	ldr r0, _080EFC84 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080EFC8C
	strh r5, [r4, 0x38]
	ldr r0, _080EFC88 @ =sub_80EFF80
	str r0, [r4, 0x1C]
	b _080EFC96
	.align 2, 0
_080EFC80: .4byte 0xffffff00
_080EFC84: .4byte gBattleSpritesDataPtr
_080EFC88: .4byte sub_80EFF80
_080EFC8C:
	ldr r0, _080EFC9C @ =sub_80EFCA0
	str r0, [r4, 0x1C]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
_080EFC96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EFC9C: .4byte sub_80EFCA0
	thumb_func_end sub_80EFB9C

	thumb_func_start sub_80EFCA0
sub_80EFCA0: @ 80EFCA0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080EFCDC
	strh r5, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _080EFCE4 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	strh r5, [r0, 0xC]
	ldr r0, _080EFCE8 @ =sub_80EFCEC
	str r0, [r4, 0x1C]
	movs r0, 0x17
	bl PlaySE
_080EFCDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EFCE4: .4byte gBattleSpritesDataPtr
_080EFCE8: .4byte sub_80EFCEC
	thumb_func_end sub_80EFCA0

	thumb_func_start sub_80EFCEC
sub_80EFCEC: @ 80EFCEC
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x6
	bls _080EFCFC
	b _080EFF34
_080EFCFC:
	lsls r0, r1, 2
	ldr r1, _080EFD08 @ =_080EFD0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EFD08: .4byte _080EFD0C
	.align 2, 0
_080EFD0C:
	.4byte _080EFD28
	.4byte _080EFD7A
	.4byte _080EFDC0
	.4byte _080EFE20
	.4byte _080EFE70
	.4byte _080EFED4
	.4byte _080EFF34
_080EFD28:
	ldr r1, _080EFD4C @ =gBattleSpritesDataPtr
	ldr r5, [r1]
	ldr r2, [r5, 0x8]
	ldrh r3, [r2, 0xC]
	movs r6, 0xC
	ldrsh r0, [r2, r6]
	adds r6, r1, 0
	cmp r0, 0xFF
	ble _080EFD50
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldr r1, [r5, 0x8]
	ldrb r0, [r1, 0xC]
	strh r0, [r1, 0xC]
	b _080EFD56
	.align 2, 0
_080EFD4C: .4byte gBattleSpritesDataPtr
_080EFD50:
	adds r0, r3, 0
	adds r0, 0xB0
	strh r0, [r2, 0xC]
_080EFD56:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xE
	bhi _080EFD78
	b _080EFF7A
_080EFD78:
	b _080EFE10
_080EFD7A:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080EFE2C
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r6, 0x36
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bge _080EFDB6
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _080EFF7A
_080EFDB6:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _080EFF7A
_080EFDC0:
	ldr r1, _080EFDE4 @ =gBattleSpritesDataPtr
	ldr r5, [r1]
	ldr r2, [r5, 0x8]
	ldrh r3, [r2, 0xC]
	movs r6, 0xC
	ldrsh r0, [r2, r6]
	adds r6, r1, 0
	cmp r0, 0xFF
	ble _080EFDE8
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldr r1, [r5, 0x8]
	ldrb r0, [r1, 0xC]
	strh r0, [r1, 0xC]
	b _080EFDEE
	.align 2, 0
_080EFDE4: .4byte gBattleSpritesDataPtr
_080EFDE8:
	adds r0, r3, 0
	adds r0, 0xB0
	strh r0, [r2, 0xC]
_080EFDEE:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0xC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x18
	bhi _080EFE10
	b _080EFF7A
_080EFE10:
	ldr r0, [r6]
	ldr r0, [r0, 0x8]
	strh r3, [r0, 0xC]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	strh r3, [r4, 0x38]
	b _080EFF7A
_080EFE20:
	ldrh r0, [r4, 0x38]
	adds r1, r0, 0x1
	strh r1, [r4, 0x38]
	lsls r0, 16
	cmp r0, 0
	bge _080EFE3A
_080EFE2C:
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _080EFF7A
_080EFE3A:
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r6, 0x36
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bge _080EFE68
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _080EFE70
_080EFE68:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_080EFE70:
	ldr r1, _080EFE94 @ =gBattleSpritesDataPtr
	ldr r5, [r1]
	ldr r2, [r5, 0x8]
	ldrh r3, [r2, 0xC]
	movs r6, 0xC
	ldrsh r0, [r2, r6]
	adds r6, r1, 0
	cmp r0, 0xFF
	ble _080EFE98
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldr r1, [r5, 0x8]
	ldrb r0, [r1, 0xC]
	strh r0, [r1, 0xC]
	b _080EFE9E
	.align 2, 0
_080EFE94: .4byte gBattleSpritesDataPtr
_080EFE98:
	adds r0, r3, 0
	adds r0, 0xB0
	strh r0, [r2, 0xC]
_080EFE9E:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _080EFF7A
	ldr r0, [r6]
	ldr r0, [r0, 0x8]
	strh r3, [r0, 0xC]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	strh r3, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	b _080EFF7A
_080EFED4:
	movs r6, 0x80
	lsls r6, 1
	adds r0, r6, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r1, r0, 24
	ldr r0, _080EFF04 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r0, [r0, 0x8]
	cmp r1, r0
	bne _080EFF0C
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080EFF08 @ =sub_80EFF80
	str r0, [r4, 0x1C]
	b _080EFF7A
	.align 2, 0
_080EFF04: .4byte gBattleSpritesDataPtr
_080EFF08: .4byte sub_80EFF80
_080EFF0C:
	cmp r0, 0x4
	bne _080EFF20
	cmp r1, 0x3
	bne _080EFF20
	ldr r0, _080EFF1C @ =sub_80EFFA4
	str r0, [r4, 0x1C]
	b _080EFF26
	.align 2, 0
_080EFF1C: .4byte sub_80EFFA4
_080EFF20:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
_080EFF26:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	b _080EFF7A
_080EFF34:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080EFF7A
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	ldr r0, _080EFF68 @ =0xffffff00
	ands r0, r1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r6, 0x36
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bge _080EFF6C
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _080EFF74
	.align 2, 0
_080EFF68: .4byte 0xffffff00
_080EFF6C:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080EFF74:
	movs r0, 0x17
	bl PlaySE
_080EFF7A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80EFCEC

	thumb_func_start sub_80EFF80
sub_80EFF80: @ 80EFF80
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x38]
	adds r0, 0x1
	strh r0, [r1, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080EFF9A
	movs r0, 0
	strh r0, [r1, 0x38]
	ldr r0, _080EFFA0 @ =sub_80F02B0
	str r0, [r1, 0x1C]
_080EFF9A:
	pop {r0}
	bx r0
	.align 2, 0
_080EFFA0: .4byte sub_80F02B0
	thumb_func_end sub_80EFF80

	thumb_func_start sub_80EFFA4
sub_80EFFA4: @ 80EFFA4
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _080EFFC0 @ =sub_80EFFC4
	str r1, [r0, 0x1C]
	movs r1, 0
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	strh r1, [r0, 0x38]
	bx lr
	.align 2, 0
_080EFFC0: .4byte sub_80EFFC4
	thumb_func_end sub_80EFFA4

	thumb_func_start sub_80EFFC4
sub_80EFFC4: @ 80EFFC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r7, _080F0004 @ =gBattleAnimTarget
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	movs r1, 0
	mov r8, r1
	strh r0, [r6, 0x36]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x28
	bne _080F0008
	movs r0, 0xF7
	bl PlaySE
	ldrb r1, [r6, 0x5]
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r1
	movs r1, 0x6
	movs r2, 0
	bl BlendPalettes
	adds r0, r6, 0
	bl sub_80F01B8
	b _080F0088
	.align 2, 0
_080F0004: .4byte gBattleAnimTarget
_080F0008:
	cmp r1, 0x3C
	bne _080F0026
	ldrb r1, [r6, 0x5]
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r1
	mov r1, r8
	str r1, [sp]
	movs r1, 0x2
	movs r2, 0x6
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080F0088
_080F0026:
	cmp r1, 0x5F
	bne _080F004C
	ldr r0, _080F0044 @ =gDoingBattleAnim
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	bl UpdateOamPriorityInAllHealthboxes
	bl m4aMPlayAllStop
	ldr r0, _080F0048 @ =0x0000013f
	bl PlaySE
	b _080F0088
	.align 2, 0
_080F0044: .4byte gDoingBattleAnim
_080F0048: .4byte 0x0000013f
_080F004C:
	ldr r0, _080F0094 @ =0x0000013b
	cmp r1, r0
	bne _080F0088
	ldr r5, _080F0098 @ =gSprites
	ldr r4, _080F009C @ =gBattlerSpriteIds
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	mov r0, r8
	strh r0, [r6, 0x2E]
	ldr r0, _080F00A0 @ =sub_80F00A4
	str r0, [r6, 0x1C]
_080F0088:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0094: .4byte 0x0000013b
_080F0098: .4byte gSprites
_080F009C: .4byte gBattlerSpriteIds
_080F00A0: .4byte sub_80F00A4
	thumb_func_end sub_80EFFC4

	thumb_func_start sub_80F00A4
sub_80F00A4: @ 80F00A4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080F0110
	cmp r0, 0x1
	bgt _080F00BC
	cmp r0, 0
	beq _080F00C2
	b _080F0156
_080F00BC:
	cmp r0, 0x2
	beq _080F0142
	b _080F0156
_080F00C2:
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	ldr r0, [r4, 0x14]
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	ldr r0, _080F010C @ =0x00007fff
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080F014E
	.align 2, 0
_080F010C: .4byte 0x00007fff
_080F0110:
	ldrh r0, [r4, 0x30]
	adds r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	ble _080F017C
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r2, [r4, 0x32]
	adds r2, 0x1
	strh r2, [r4, 0x32]
	lsls r1, r2, 8
	movs r0, 0x10
	subs r0, r2
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080F017C
	b _080F014E
_080F0142:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080F014E:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080F017C
_080F0156:
	ldr r0, _080F0184 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080F017C
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	strh r5, [r4, 0x2E]
	ldr r0, _080F0188 @ =sub_80F018C
	str r0, [r4, 0x1C]
_080F017C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0184: .4byte gPaletteFade
_080F0188: .4byte sub_80F018C
	thumb_func_end sub_80F00A4

	thumb_func_start sub_80F018C
sub_80F018C: @ 80F018C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080F01A4
	ldr r0, _080F01A0 @ =0x0000ffff
	strh r0, [r4, 0x2E]
	b _080F01B0
	.align 2, 0
_080F01A0: .4byte 0x0000ffff
_080F01A4:
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080F01B0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F018C

	thumb_func_start sub_80F01B8
sub_80F01B8: @ 80F01B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	adds r1, r6, 0
	adds r1, 0x43
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F01D8
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	b _080F01E0
_080F01D8:
	movs r0, 0
	mov r8, r0
	movs r0, 0x1
	strb r0, [r1]
_080F01E0:
	movs r0, 0x4
	bl sub_80F05B4
	movs r7, 0
	ldr r2, _080F0264 @ =gSprites
	mov r9, r2
	movs r0, 0x1C
	add r0, r9
	mov r10, r0
_080F01F2:
	movs r2, 0x20
	ldrsh r1, [r6, r2]
	movs r0, 0x22
	ldrsh r2, [r6, r0]
	ldr r0, _080F0268 @ =gUnknown_840C104
	mov r3, r8
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080F024E
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r2, r9
	adds r5, r4, r2
	movs r0, 0x18
	strh r0, [r5, 0x2E]
	ldr r0, _080F026C @ =gUnknown_840BF3C
	lsls r1, r7, 2
	adds r1, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	ldrh r2, [r6, 0x20]
	adds r0, r2
	strh r0, [r5, 0x32]
	movs r0, 0x1
	ldrsb r0, [r1, r0]
	ldrh r2, [r6, 0x22]
	adds r0, r2
	strh r0, [r5, 0x36]
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_8075068
	add r4, r10
	ldr r0, _080F0270 @ =sub_80F0278
	str r0, [r4]
	ldr r0, _080F0274 @ =gUnknown_840C068
	ldrb r1, [r0, 0x4]
	adds r0, r5, 0
	bl StartSpriteAnim
_080F024E:
	adds r7, 0x1
	cmp r7, 0x2
	bls _080F01F2
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0264: .4byte gSprites
_080F0268: .4byte gUnknown_840C104
_080F026C: .4byte gUnknown_840BF3C
_080F0270: .4byte sub_80F0278
_080F0274: .4byte gUnknown_840C068
	thumb_func_end sub_80F01B8

	thumb_func_start sub_80F0278
sub_80F0278: @ 80F0278
	push {r4,lr}
	adds r4, r0, 0
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
	adds r0, r4, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080F02A8
	adds r0, r4, 0
	bl DestroySprite
_080F02A8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F0278

	thumb_func_start sub_80F02B0
sub_80F02B0: @ 80F02B0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _080F0364 @ =sub_80F0378
	str r0, [r4, 0x1C]
	ldr r0, _080F0368 @ =gUnknown_2023D68
	ldrh r0, [r0]
	bl ItemIdToBallId
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xB
	bgt _080F0302
	cmp r5, 0
	blt _080F0302
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	str r5, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl LaunchBallStarsTask
	ldr r0, _080F036C @ =gBattleAnimTarget
	ldrb r1, [r0]
	movs r0, 0x1
	movs r2, 0xE
	adds r3, r5, 0
	bl LaunchBallFadeMonTask
_080F0302:
	ldr r6, _080F0370 @ =gSprites
	ldr r5, _080F0374 @ =gBattlerSpriteIds
	ldr r4, _080F036C @ =gBattleAnimTarget
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl AnimateSprite
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x80
	lsls r1, 5
	strh r1, [r0, 0x30]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F0364: .4byte sub_80F0378
_080F0368: .4byte gUnknown_2023D68
_080F036C: .4byte gBattleAnimTarget
_080F0370: .4byte gSprites
_080F0374: .4byte gBattlerSpriteIds
	thumb_func_end sub_80F02B0

	thumb_func_start sub_80F0378
sub_80F0378: @ 80F0378
	push {r4-r7,lr}
	adds r7, r0, 0
	movs r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080F0396
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080F0396:
	ldr r4, _080F03C4 @ =gSprites
	ldr r3, _080F03C8 @ =gBattlerSpriteIds
	ldr r2, _080F03CC @ =gBattleAnimTarget
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080F03D0
	adds r0, r1, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r5, 0x1
	b _080F03F0
	.align 2, 0
_080F03C4: .4byte gSprites
_080F03C8: .4byte gBattlerSpriteIds
_080F03CC: .4byte gBattleAnimTarget
_080F03D0:
	ldr r6, _080F045C @ =0xfffffee0
	adds r0, r6, 0
	ldrh r6, [r1, 0x30]
	adds r0, r6
	strh r0, [r1, 0x30]
	ldrb r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
_080F03F0:
	adds r0, r7, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080F0456
	cmp r5, 0
	beq _080F0456
	ldr r4, _080F0460 @ =gSprites
	ldr r3, _080F0464 @ =gBattlerSpriteIds
	ldr r2, _080F0468 @ =gBattleAnimTarget
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r6, 0
	movs r5, 0
	strh r5, [r0, 0x26]
	ldrb r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldr r0, _080F046C @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r1, [r0, 0x9]
	lsls r1, 30
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	strh r5, [r7, 0x2E]
	ldr r0, _080F0470 @ =sub_80F018C
	str r0, [r7, 0x1C]
	ldr r0, _080F0474 @ =gDoingBattleAnim
	strb r6, [r0]
	movs r0, 0x1
	bl UpdateOamPriorityInAllHealthboxes
_080F0456:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F045C: .4byte 0xfffffee0
_080F0460: .4byte gSprites
_080F0464: .4byte gBattlerSpriteIds
_080F0468: .4byte gBattleAnimTarget
_080F046C: .4byte gBattleSpritesDataPtr
_080F0470: .4byte sub_80F018C
_080F0474: .4byte gDoingBattleAnim
	thumb_func_end sub_80F0378

	thumb_func_start sub_80F0478
sub_80F0478: @ 80F0478
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x26]
	ldrh r3, [r2, 0x22]
	adds r0, r3
	strh r0, [r2, 0x22]
	strh r1, [r2, 0x26]
	strh r1, [r2, 0x24]
	ldr r4, _080F04B0 @ =sub_80F04B4
	movs r3, 0
	movs r1, 0x5
	adds r0, r2, 0
	adds r0, 0x38
_080F049C:
	strh r3, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080F049C
	str r4, [r2, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F04B0: .4byte sub_80F04B4
	thumb_func_end sub_80F0478

	thumb_func_start sub_80F04B4
sub_80F04B4: @ 80F04B4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x80
	lsls r0, 4
	adds r2, r0, 0
	ldrh r1, [r4, 0x2E]
	adds r2, r1
	movs r0, 0xD0
	lsls r0, 3
	adds r3, r0, 0
	ldrh r1, [r4, 0x30]
	adds r3, r1
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x2E]
	ands r3, r0
	strh r3, [r4, 0x30]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	bgt _080F050A
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	bge _080F051E
_080F050A:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080F0524 @ =sub_80F018C
	str r0, [r4, 0x1C]
	ldr r1, _080F0528 @ =gDoingBattleAnim
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	bl UpdateOamPriorityInAllHealthboxes
_080F051E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F0524: .4byte sub_80F018C
_080F0528: .4byte gDoingBattleAnim
	thumb_func_end sub_80F04B4

	thumb_func_start sub_80F052C
sub_80F052C: @ 80F052C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x24]
	movs r0, 0x22
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	subs r1, 0x8
	strh r1, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r0, 0x90
	strh r0, [r4, 0x36]
	movs r0, 0x20
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	adds r0, r4, 0
	bl sub_80750C8
	ldr r0, _080F0570 @ =sub_80F0574
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F0570: .4byte sub_80F0574
	thumb_func_end sub_80F052C

	thumb_func_start sub_80F0574
sub_80F0574: @ 80F0574
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80750C8
	lsls r0, 24
	cmp r0, 0
	bne _080F0590
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0x40
	ble _080F05A4
_080F0590:
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080F05AC @ =sub_80F018C
	str r0, [r4, 0x1C]
	ldr r0, _080F05B0 @ =gDoingBattleAnim
	strb r1, [r0]
	movs r0, 0x1
	bl UpdateOamPriorityInAllHealthboxes
_080F05A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F05AC: .4byte sub_80F018C
_080F05B0: .4byte gDoingBattleAnim
	thumb_func_end sub_80F0574

	thumb_func_start sub_80F05B4
sub_80F05B4: @ 80F05B4
	push {r4,r5,lr}
	lsls r0, 24
	ldr r1, _080F05E0 @ =gUnknown_840BF48
	lsrs r5, r0, 21
	adds r4, r5, r1
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _080F05E4 @ =0xffff0000
	cmp r0, r1
	bne _080F05DA
	adds r0, r4, 0
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _080F05E8 @ =gUnknown_840BFA8
	adds r0, r5, r0
	bl LoadCompressedSpritePaletteUsingHeap
_080F05DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F05E0: .4byte gUnknown_840BF48
_080F05E4: .4byte 0xffff0000
_080F05E8: .4byte gUnknown_840BFA8
	thumb_func_end sub_80F05B4

	thumb_func_start LaunchBallStarsTask
LaunchBallStarsTask: @ 80F05EC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	mov r8, r1
	mov r9, r2
	mov r10, r3
	ldr r5, [sp, 0x1C]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	bl sub_80F05B4
	ldr r1, _080F066C @ =gUnknown_840C074
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x5
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F0670 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0xA]
	mov r1, r8
	strh r1, [r0, 0xC]
	mov r1, r9
	strh r1, [r0, 0xE]
	mov r1, r10
	strh r1, [r0, 0x10]
	strh r5, [r0, 0x26]
	movs r0, 0xF
	bl PlaySE
	adds r0, r4, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F066C: .4byte gUnknown_840C074
_080F0670: .4byte gTasks
	thumb_func_end LaunchBallStarsTask

	thumb_func_start sub_80F0674
sub_80F0674: @ 80F0674
	push {lr}
	ldr r0, _080F0698 @ =gMain
	ldr r1, _080F069C @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080F0692
	ldr r0, _080F06A0 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0x8]
	ldrb r0, [r1, 0xA]
	adds r0, 0x1
	strb r0, [r1, 0xA]
_080F0692:
	pop {r0}
	bx r0
	.align 2, 0
_080F0698: .4byte gMain
_080F069C: .4byte 0x00000439
_080F06A0: .4byte gBattleSpritesDataPtr
	thumb_func_end sub_80F0674

	thumb_func_start sub_80F06A4
sub_80F06A4: @ 80F06A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _080F0780 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r6, r0, r1
	ldrh r0, [r6, 0x26]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r2, 0x8
	ldrsh r0, [r6, r2]
	adds r2, r1, 0
	cmp r0, 0xF
	bgt _080F079C
	ldrb r1, [r6, 0xA]
	ldrb r2, [r6, 0xC]
	ldrb r4, [r6, 0xE]
	mov r9, r4
	ldrb r3, [r6, 0x10]
	ldr r4, [sp]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r4, _080F0784 @ =gUnknown_840C0A4
	adds r0, r4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0x40
	beq _080F0740
	bl sub_80F0674
	mov r0, r10
	lsls r4, r0, 4
	add r4, r10
	lsls r4, 2
	ldr r5, _080F0788 @ =gSprites
	adds r7, r4, r5
	ldr r0, _080F078C @ =gUnknown_840C068
	ldr r1, [sp]
	adds r0, r1, r0
	ldrb r1, [r0]
	adds r0, r7, 0
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080F0790 @ =sub_80F07BC
	str r0, [r4]
	movs r0, 0x3
	mov r2, r9
	ands r2, r0
	lsls r2, 2
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, 0x5]
	ldrb r0, [r6, 0x8]
	cmp r0, 0x7
	bls _080F073C
	subs r0, 0x8
	lsls r0, 24
	lsrs r0, 24
_080F073C:
	lsls r0, 5
	strh r0, [r7, 0x2E]
_080F0740:
	ldr r0, _080F0780 @ =gTasks
	mov r4, r8
	lsls r1, r4, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r1, [r1, r2]
	adds r2, r0, 0
	cmp r1, 0xF
	bne _080F079C
	ldr r0, _080F0794 @ =gMain
	ldr r4, _080F0798 @ =0x00000439
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080F0776
	ldr r0, _080F0788 @ =gSprites
	mov r2, r10
	lsls r1, r2, 4
	add r1, r10
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
_080F0776:
	mov r0, r8
	bl DestroyTask
	b _080F07AC
	.align 2, 0
_080F0780: .4byte gTasks
_080F0784: .4byte gUnknown_840C0A4
_080F0788: .4byte gSprites
_080F078C: .4byte gUnknown_840C068
_080F0790: .4byte sub_80F07BC
_080F0794: .4byte gMain
_080F0798: .4byte 0x00000439
_080F079C:
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
_080F07AC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F06A4

	thumb_func_start sub_80F07BC
sub_80F07BC: @ 80F07BC
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x30]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080F07D4
	ldr r0, _080F07D0 @ =sub_80F07DC
	str r0, [r1, 0x1C]
	b _080F07D8
	.align 2, 0
_080F07D0: .4byte sub_80F07DC
_080F07D4:
	subs r0, r2, 0x1
	strh r0, [r1, 0x30]
_080F07D8:
	pop {r0}
	bx r0
	thumb_func_end sub_80F07BC

	thumb_func_start sub_80F07DC
sub_80F07DC: @ 80F07DC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x2
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	bne _080F0810
	adds r0, r4, 0
	bl sub_80F1198
_080F0810:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F07DC

	thumb_func_start sub_80F0818
sub_80F0818: @ 80F0818
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080F08FC @ =gTasks
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r3, [r1, 0xA]
	str r3, [sp]
	ldrb r0, [r1, 0xC]
	str r0, [sp, 0x4]
	ldrb r2, [r1, 0xE]
	str r2, [sp, 0x8]
	ldrb r1, [r1, 0x10]
	str r1, [sp, 0xC]
	movs r7, 0
	ldr r3, _080F0900 @ =gSprites
	mov r10, r3
	mov r1, r8
	lsls r0, r1, 1
	add r0, r8
	lsls r0, 3
	str r0, [sp, 0x10]
_080F085E:
	ldr r0, _080F0904 @ =gUnknown_840C0A4
	ldr r2, [sp, 0x10]
	adds r0, r2, r0
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _080F08BE
	bl sub_80F0674
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	mov r3, r10
	adds r5, r4, r3
	ldr r0, _080F0908 @ =gUnknown_840C068
	add r0, r8
	ldrb r1, [r0]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080F090C @ =gSprites + 0x1C
	adds r4, r0
	ldr r0, _080F0910 @ =sub_80F0D5C
	str r0, [r4]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r0, r7, 5
	strh r0, [r5, 0x2E]
	movs r0, 0xA
	strh r0, [r5, 0x36]
	movs r0, 0x2
	strh r0, [r5, 0x38]
	movs r0, 0x1
	strh r0, [r5, 0x3A]
_080F08BE:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _080F085E
	ldr r0, _080F0914 @ =gMain
	ldr r1, _080F0918 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080F08E6
	ldr r0, _080F0900 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
_080F08E6:
	mov r0, r9
	bl DestroyTask
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F08FC: .4byte gTasks
_080F0900: .4byte gSprites
_080F0904: .4byte gUnknown_840C0A4
_080F0908: .4byte gUnknown_840C068
_080F090C: .4byte gSprites + 0x1C
_080F0910: .4byte sub_80F0D5C
_080F0914: .4byte gMain
_080F0918: .4byte 0x00000439
	thumb_func_end sub_80F0818

	thumb_func_start sub_80F091C
sub_80F091C: @ 80F091C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080F0A00 @ =gTasks
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r3, [r1, 0xA]
	str r3, [sp]
	ldrb r0, [r1, 0xC]
	str r0, [sp, 0x4]
	ldrb r2, [r1, 0xE]
	str r2, [sp, 0x8]
	ldrb r1, [r1, 0x10]
	str r1, [sp, 0xC]
	movs r7, 0
	ldr r3, _080F0A04 @ =gSprites
	mov r10, r3
	mov r1, r8
	lsls r0, r1, 1
	add r0, r8
	lsls r0, 3
	str r0, [sp, 0x10]
_080F0962:
	ldr r0, _080F0A08 @ =gUnknown_840C0A4
	ldr r2, [sp, 0x10]
	adds r0, r2, r0
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _080F09C2
	bl sub_80F0674
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	mov r3, r10
	adds r5, r4, r3
	ldr r0, _080F0A0C @ =gUnknown_840C068
	add r0, r8
	ldrb r1, [r0]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080F0A10 @ =gSprites + 0x1C
	adds r4, r0
	ldr r0, _080F0A14 @ =sub_80F0D5C
	str r0, [r4]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r0, r7, 5
	strh r0, [r5, 0x2E]
	movs r0, 0xA
	strh r0, [r5, 0x36]
	movs r0, 0x1
	strh r0, [r5, 0x38]
	movs r0, 0x2
	strh r0, [r5, 0x3A]
_080F09C2:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _080F0962
	ldr r0, _080F0A18 @ =gMain
	ldr r1, _080F0A1C @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080F09EA
	ldr r0, _080F0A04 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
_080F09EA:
	mov r0, r9
	bl DestroyTask
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0A00: .4byte gTasks
_080F0A04: .4byte gSprites
_080F0A08: .4byte gUnknown_840C0A4
_080F0A0C: .4byte gUnknown_840C068
_080F0A10: .4byte gSprites + 0x1C
_080F0A14: .4byte sub_80F0D5C
_080F0A18: .4byte gMain
_080F0A1C: .4byte 0x00000439
	thumb_func_end sub_80F091C

	thumb_func_start sub_80F0A20
sub_80F0A20: @ 80F0A20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080F0B00 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r7, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	str r0, [sp, 0x10]
	ldr r3, _080F0B04 @ =gSprites
	mov r8, r3
	ldr r0, _080F0B08 @ =gUnknown_840C068
	adds r1, r0
	mov r10, r1
_080F0A66:
	ldr r0, _080F0B0C @ =gUnknown_840C0A4
	ldr r1, [sp, 0x10]
	adds r0, r1, r0
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _080F0AC2
	bl sub_80F0674
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	mov r2, r8
	adds r5, r4, r2
	mov r3, r10
	ldrb r1, [r3]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080F0B10 @ =gSprites + 0x1C
	adds r4, r0
	ldr r0, _080F0B14 @ =sub_80F0D5C
	str r0, [r4]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r0, r7, 5
	strh r0, [r5, 0x2E]
	movs r0, 0x4
	strh r0, [r5, 0x36]
	movs r0, 0x1
	strh r0, [r5, 0x38]
	strh r0, [r5, 0x3A]
_080F0AC2:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _080F0A66
	ldr r0, _080F0B18 @ =gMain
	ldr r1, _080F0B1C @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080F0AEA
	ldr r0, _080F0B04 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
_080F0AEA:
	mov r0, r9
	bl DestroyTask
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0B00: .4byte gTasks
_080F0B04: .4byte gSprites
_080F0B08: .4byte gUnknown_840C068
_080F0B0C: .4byte gUnknown_840C0A4
_080F0B10: .4byte gSprites + 0x1C
_080F0B14: .4byte sub_80F0D5C
_080F0B18: .4byte gMain
_080F0B1C: .4byte 0x00000439
	thumb_func_end sub_80F0A20

	thumb_func_start sub_80F0B20
sub_80F0B20: @ 80F0B20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080F0C08 @ =gTasks
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r3, [r1, 0xA]
	str r3, [sp]
	ldrb r0, [r1, 0xC]
	str r0, [sp, 0x4]
	ldrb r2, [r1, 0xE]
	str r2, [sp, 0x8]
	ldrb r1, [r1, 0x10]
	str r1, [sp, 0xC]
	movs r7, 0
	ldr r3, _080F0C0C @ =gSprites
	mov r10, r3
	mov r1, r8
	lsls r0, r1, 1
	add r0, r8
	lsls r0, 3
	str r0, [sp, 0x10]
_080F0B66:
	ldr r0, _080F0C10 @ =gUnknown_840C0A4
	ldr r2, [sp, 0x10]
	adds r0, r2, r0
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _080F0BCA
	bl sub_80F0674
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	mov r3, r10
	adds r5, r4, r3
	ldr r0, _080F0C14 @ =gUnknown_840C068
	add r0, r8
	ldrb r1, [r0]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080F0C18 @ =gSprites + 0x1C
	adds r4, r0
	ldr r0, _080F0C1C @ =sub_80F0D5C
	str r0, [r4]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	adds r0, r7
	strh r0, [r5, 0x2E]
	movs r0, 0x5
	strh r0, [r5, 0x36]
	movs r0, 0x1
	strh r0, [r5, 0x38]
	strh r0, [r5, 0x3A]
_080F0BCA:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x9
	bls _080F0B66
	ldr r0, _080F0C20 @ =gMain
	ldr r1, _080F0C24 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080F0BF2
	ldr r0, _080F0C0C @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
_080F0BF2:
	mov r0, r9
	bl DestroyTask
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0C08: .4byte gTasks
_080F0C0C: .4byte gSprites
_080F0C10: .4byte gUnknown_840C0A4
_080F0C14: .4byte gUnknown_840C068
_080F0C18: .4byte gSprites + 0x1C
_080F0C1C: .4byte sub_80F0D5C
_080F0C20: .4byte gMain
_080F0C24: .4byte 0x00000439
	thumb_func_end sub_80F0B20

	thumb_func_start sub_80F0C28
sub_80F0C28: @ 80F0C28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _080F0C54 @ =gTasks
	lsls r2, r0, 2
	adds r0, r2, r0
	lsls r0, 3
	adds r3, r0, r1
	ldrh r1, [r3, 0x16]
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _080F0C58
	subs r0, r1, 0x1
	strh r0, [r3, 0x16]
	b _080F0D2A
	.align 2, 0
_080F0C54: .4byte gTasks
_080F0C58:
	ldrh r0, [r3, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r3, 0xA]
	str r1, [sp]
	ldrb r4, [r3, 0xC]
	str r4, [sp, 0x4]
	ldrb r1, [r3, 0xE]
	str r1, [sp, 0x8]
	ldrb r3, [r3, 0x10]
	str r3, [sp, 0xC]
	movs r7, 0
	str r2, [sp, 0x14]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	str r1, [sp, 0x10]
	ldr r3, _080F0D3C @ =gSprites
	mov r9, r3
	ldr r1, _080F0D40 @ =gUnknown_840C068
	adds r0, r1
	mov r10, r0
_080F0C84:
	ldr r0, _080F0D44 @ =gUnknown_840C0A4
	ldr r4, [sp, 0x10]
	adds r0, r4, r0
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _080F0CE0
	bl sub_80F0674
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	mov r0, r9
	adds r5, r4, r0
	mov r3, r10
	ldrb r1, [r3]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080F0D48 @ =gSprites + 0x1C
	adds r4, r0
	ldr r0, _080F0D4C @ =sub_80F0D5C
	str r0, [r4]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r0, r7, 5
	strh r0, [r5, 0x2E]
	movs r0, 0x8
	strh r0, [r5, 0x36]
	movs r0, 0x2
	strh r0, [r5, 0x38]
	strh r0, [r5, 0x3A]
_080F0CE0:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _080F0C84
	ldr r0, _080F0D50 @ =gTasks
	ldr r1, [sp, 0x14]
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x8
	strh r0, [r1, 0x16]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0x2
	bne _080F0D2A
	ldr r0, _080F0D54 @ =gMain
	ldr r4, _080F0D58 @ =0x00000439
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080F0D24
	ldr r0, _080F0D3C @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
_080F0D24:
	mov r0, r8
	bl DestroyTask
_080F0D2A:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0D3C: .4byte gSprites
_080F0D40: .4byte gUnknown_840C068
_080F0D44: .4byte gUnknown_840C0A4
_080F0D48: .4byte gSprites + 0x1C
_080F0D4C: .4byte sub_80F0D5C
_080F0D50: .4byte gTasks
_080F0D54: .4byte gMain
_080F0D58: .4byte 0x00000439
	thumb_func_end sub_80F0C28

	thumb_func_start sub_80F0D5C
sub_80F0D5C: @ 80F0D5C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x30]
	adds r0, r2
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080F0DAC
	adds r0, r4, 0
	bl sub_80F1198
_080F0DAC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F0D5C

	thumb_func_start sub_80F0DB4
sub_80F0DB4: @ 80F0DB4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080F0E90 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r7, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	str r0, [sp, 0x10]
	ldr r3, _080F0E94 @ =gSprites
	mov r8, r3
	ldr r0, _080F0E98 @ =gUnknown_840C068
	adds r1, r0
	mov r10, r1
_080F0DFA:
	ldr r0, _080F0E9C @ =gUnknown_840C0A4
	ldr r1, [sp, 0x10]
	adds r0, r1, r0
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _080F0E52
	bl sub_80F0674
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	mov r2, r8
	adds r5, r4, r2
	mov r3, r10
	ldrb r1, [r3]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080F0EA0 @ =gSprites + 0x1C
	adds r4, r0
	ldr r0, _080F0EA4 @ =sub_80F0EB0
	str r0, [r4]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 2
	adds r0, r7
	strh r0, [r5, 0x2E]
_080F0E52:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xB
	bls _080F0DFA
	ldr r0, _080F0EA8 @ =gMain
	ldr r1, _080F0EAC @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080F0E7A
	ldr r0, _080F0E94 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
_080F0E7A:
	mov r0, r9
	bl DestroyTask
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0E90: .4byte gTasks
_080F0E94: .4byte gSprites
_080F0E98: .4byte gUnknown_840C068
_080F0E9C: .4byte gUnknown_840C0A4
_080F0EA0: .4byte gSprites + 0x1C
_080F0EA4: .4byte sub_80F0EB0
_080F0EA8: .4byte gMain
_080F0EAC: .4byte 0x00000439
	thumb_func_end sub_80F0DB4

	thumb_func_start sub_80F0EB0
sub_80F0EB0: @ 80F0EB0
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	adds r0, r4, 0
	bl Sin
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl Cos
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080F0F08
	adds r0, r5, 0
	bl sub_80F1198
_080F0F08:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F0EB0

	thumb_func_start sub_80F0F10
sub_80F0F10: @ 80F0F10
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldr r0, _080F0FC4 @ =gTasks
	ldr r2, [sp]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r3, [r1, 0xA]
	str r3, [sp, 0x4]
	ldrb r0, [r1, 0xC]
	str r0, [sp, 0x8]
	ldrb r2, [r1, 0xE]
	str r2, [sp, 0xC]
	ldrb r1, [r1, 0x10]
	str r1, [sp, 0x10]
	movs r3, 0
	mov r8, r3
	mov r1, r9
	lsls r0, r1, 1
	add r0, r9
	lsls r0, 3
	str r0, [sp, 0x14]
_080F0F54:
	movs r7, 0
	movs r2, 0x1
	add r2, r8
	mov r10, r2
_080F0F5C:
	ldr r0, _080F0FC8 @ =gUnknown_840C0A4
	ldr r3, [sp, 0x14]
	adds r0, r3, r0
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	ldr r3, [sp, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _080F0FE4
	bl sub_80F0674
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	ldr r0, _080F0FCC @ =gSprites
	adds r5, r4, r0
	ldr r0, _080F0FD0 @ =gUnknown_840C068
	add r0, r9
	ldrb r1, [r0]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r1, _080F0FD4 @ =gSprites + 0x1C
	adds r4, r1
	ldr r0, _080F0FD8 @ =sub_80F0D5C
	str r0, [r4]
	movs r0, 0x3
	ldr r1, [sp, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r2, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	lsls r0, r7, 5
	strh r0, [r5, 0x2E]
	movs r0, 0x8
	strh r0, [r5, 0x36]
	mov r0, r8
	cmp r0, 0
	bne _080F0FDC
	movs r0, 0x2
	strh r0, [r5, 0x38]
	movs r0, 0x1
	b _080F0FE2
	.align 2, 0
_080F0FC4: .4byte gTasks
_080F0FC8: .4byte gUnknown_840C0A4
_080F0FCC: .4byte gSprites
_080F0FD0: .4byte gUnknown_840C068
_080F0FD4: .4byte gSprites + 0x1C
_080F0FD8: .4byte sub_80F0D5C
_080F0FDC:
	movs r0, 0x1
	strh r0, [r5, 0x38]
	movs r0, 0x2
_080F0FE2:
	strh r0, [r5, 0x3A]
_080F0FE4:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _080F0F5C
	mov r1, r10
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bls _080F0F54
	ldr r0, _080F1030 @ =gMain
	ldr r2, _080F1034 @ =0x00000439
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080F1018
	ldr r0, _080F1038 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
_080F1018:
	ldr r0, [sp]
	bl DestroyTask
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1030: .4byte gMain
_080F1034: .4byte 0x00000439
_080F1038: .4byte gSprites
	thumb_func_end sub_80F0F10

	thumb_func_start sub_80F103C
sub_80F103C: @ 80F103C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080F1114 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r7, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	str r0, [sp, 0x10]
	ldr r3, _080F1118 @ =gSprites
	mov r8, r3
	ldr r0, _080F111C @ =gUnknown_840C068
	adds r1, r0
	mov r10, r1
_080F1082:
	ldr r0, _080F1120 @ =gUnknown_840C0A4
	ldr r1, [sp, 0x10]
	adds r0, r1, r0
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _080F10D4
	bl sub_80F0674
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	mov r2, r8
	adds r5, r4, r2
	mov r3, r10
	ldrb r1, [r3]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080F1124 @ =gSprites + 0x1C
	adds r4, r0
	ldr r0, _080F1128 @ =sub_80F1134
	str r0, [r4]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r0, r7, 5
	strh r0, [r5, 0x2E]
_080F10D4:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _080F1082
	ldr r0, _080F112C @ =gMain
	ldr r1, _080F1130 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080F10FC
	ldr r0, _080F1118 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
_080F10FC:
	mov r0, r9
	bl DestroyTask
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1114: .4byte gTasks
_080F1118: .4byte gSprites
_080F111C: .4byte gUnknown_840C068
_080F1120: .4byte gUnknown_840C0A4
_080F1124: .4byte gSprites + 0x1C
_080F1128: .4byte sub_80F1134
_080F112C: .4byte gMain
_080F1130: .4byte 0x00000439
	thumb_func_end sub_80F103C

	thumb_func_start sub_80F1134
sub_80F1134: @ 80F1134
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	ldrh r1, [r5, 0x2E]
	movs r0, 0x3F
	ands r0, r1
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl Sin
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl Cos
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x2E]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080F1190
	adds r0, r5, 0
	bl sub_80F1198
_080F1190:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F1134

	thumb_func_start sub_80F1198
sub_80F1198: @ 80F1198
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r0, _080F11BC @ =gMain
	ldr r1, _080F11C0 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080F11C4
	movs r1, 0x3C
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	bne _080F11F6
	adds r0, r7, 0
	bl DestroySpriteAndFreeResources
	b _080F1212
	.align 2, 0
_080F11BC: .4byte gMain
_080F11C0: .4byte 0x00000439
_080F11C4:
	ldr r2, _080F1200 @ =gBattleSpritesDataPtr
	ldr r0, [r2]
	ldr r1, [r0, 0x8]
	ldrb r0, [r1, 0xA]
	subs r0, 0x1
	strb r0, [r1, 0xA]
	ldr r0, [r2]
	ldr r0, [r0, 0x8]
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	bne _080F120C
	movs r6, 0
	ldr r5, _080F1204 @ =gUnknown_840BF48
	ldr r4, _080F1208 @ =gUnknown_840BFA8
_080F11E0:
	ldrh r0, [r5, 0x6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4, 0x4]
	bl FreeSpritePaletteByTag
	adds r5, 0x8
	adds r4, 0x8
	adds r6, 0x1
	cmp r6, 0xB
	ble _080F11E0
_080F11F6:
	adds r0, r7, 0
	bl DestroySprite
	b _080F1212
	.align 2, 0
_080F1200: .4byte gBattleSpritesDataPtr
_080F1204: .4byte gUnknown_840BF48
_080F1208: .4byte gUnknown_840BFA8
_080F120C:
	adds r0, r7, 0
	bl DestroySprite
_080F1212:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F1198

	thumb_func_start LaunchBallFadeMonTask
LaunchBallFadeMonTask: @ 80F1218
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r0, 0
	mov r9, r2
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r3, 24
	lsrs r7, r3, 24
	ldr r0, _080F127C @ =sub_80F12E0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _080F1280 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r5, r0, r1
	strh r7, [r5, 0x26]
	strh r6, [r5, 0xE]
	mov r0, r9
	strh r0, [r5, 0x1C]
	mov r1, r9
	lsrs r0, r1, 16
	strh r0, [r5, 0x1E]
	cmp r4, 0
	bne _080F1288
	lsls r0, r6, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldr r2, _080F1284 @ =gUnknown_840C1C4
	lsls r1, r7, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0
	bl BlendPalette
	movs r0, 0x1
	strh r0, [r5, 0xA]
	b _080F12AE
	.align 2, 0
_080F127C: .4byte sub_80F12E0
_080F1280: .4byte gTasks
_080F1284: .4byte gUnknown_840C1C4
_080F1288:
	lsls r0, r6, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r2, _080F12D0 @ =gUnknown_840C1C4
	lsls r1, r7, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0x10
	bl BlendPalette
	movs r0, 0x10
	strh r0, [r5, 0x8]
	ldr r0, _080F12D4 @ =0x0000ffff
	strh r0, [r5, 0xA]
	ldr r0, _080F12D8 @ =sub_80F1370
	str r0, [r5]
_080F12AE:
	ldr r0, _080F12DC @ =0x00007fff
	str r0, [sp]
	mov r0, r9
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	mov r0, r8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F12D0: .4byte gUnknown_840C1C4
_080F12D4: .4byte 0x0000ffff
_080F12D8: .4byte sub_80F1370
_080F12DC: .4byte 0x00007fff
	thumb_func_end LaunchBallFadeMonTask

	thumb_func_start sub_80F12E0
sub_80F12E0: @ 80F12E0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080F1330 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bgt _080F1338
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldrb r2, [r4, 0x8]
	ldr r3, _080F1334 @ =gUnknown_840C1C4
	lsls r1, 1
	adds r1, r3
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _080F1360
	.align 2, 0
_080F1330: .4byte gTasks
_080F1334: .4byte gUnknown_840C1C4
_080F1338:
	ldr r0, _080F1368 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F1360
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _080F136C @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r5, 0
	bl DestroyTask
_080F1360:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1368: .4byte gPaletteFade
_080F136C: .4byte 0x00007fff
	thumb_func_end sub_80F12E0

	thumb_func_start sub_80F1370
sub_80F1370: @ 80F1370
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080F13B0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F13A8
	ldr r0, _080F13B4 @ =gTasks
	lsls r4, r2, 2
	adds r4, r2
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _080F13B8 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080F13BC @ =sub_80F13C0
	str r0, [r4]
_080F13A8:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F13B0: .4byte gPaletteFade
_080F13B4: .4byte gTasks
_080F13B8: .4byte 0x00007fff
_080F13BC: .4byte sub_80F13C0
	thumb_func_end sub_80F1370

	thumb_func_start sub_80F13C0
sub_80F13C0: @ 80F13C0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080F140C @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r1, r0, 24
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bgt _080F1414
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 20
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r0, 16
	ldrb r2, [r4, 0x8]
	ldr r3, _080F1410 @ =gUnknown_840C1C4
	lsls r1, 1
	adds r1, r3
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _080F141A
	.align 2, 0
_080F140C: .4byte gTasks
_080F1410: .4byte gUnknown_840C1C4
_080F1414:
	adds r0, r2, 0
	bl DestroyTask
_080F141A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F13C0

	thumb_func_start sub_80F1420
sub_80F1420: @ 80F1420
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	ldr r0, _080F1454 @ =gBattlerSpriteIds
	ldr r3, _080F1458 @ =gBattleAnimAttacker
	ldrb r2, [r3]
	adds r0, r2, r0
	ldrb r6, [r0]
	ldr r1, _080F145C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080F14F8
	cmp r0, 0x1
	bgt _080F1460
	cmp r0, 0
	beq _080F1466
	b _080F15BA
	.align 2, 0
_080F1454: .4byte gBattlerSpriteIds
_080F1458: .4byte gBattleAnimAttacker
_080F145C: .4byte gTasks
_080F1460:
	cmp r0, 0x2
	beq _080F150A
	b _080F15BA
_080F1466:
	ldr r0, _080F14A0 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r5, 0x1E]
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r4, [r5, 0x8]
	adds r0, r4
	strh r0, [r5, 0x8]
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080F14A8
	ldr r2, _080F14A4 @ =gSprites
	lsls r3, r6, 4
	adds r1, r3, r6
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
	adds r4, r3, 0
	b _080F14C0
	.align 2, 0
_080F14A0: .4byte gBattleAnimArgs
_080F14A4: .4byte gSprites
_080F14A8:
	ldr r3, _080F14F0 @ =gSprites
	lsls r4, r6, 4
	adds r2, r4, r6
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r5, 0x8]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
_080F14C0:
	ldr r1, _080F14F4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrb r0, [r3, 0x8]
	strh r0, [r3, 0x8]
	adds r0, r4, r6
	lsls r0, 2
	adds r0, r2
	movs r2, 0x20
	ldrsh r1, [r0, r2]
	movs r4, 0x24
	ldrsh r0, [r0, r4]
	adds r1, r0
	adds r1, 0x20
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bls _080F15BA
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	b _080F15BA
	.align 2, 0
_080F14F0: .4byte gSprites
_080F14F4: .4byte gTasks
_080F14F8:
	ldrb r1, [r5, 0x1E]
	adds r0, r2, 0
	adds r2, r6, 0
	bl LoadBattleMonGfxAndAnimate
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	b _080F15BA
_080F150A:
	movs r1, 0xA0
	lsls r1, 3
	adds r0, r1, 0
	ldrh r2, [r5, 0x8]
	adds r0, r2
	strh r0, [r5, 0x8]
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080F1540
	ldr r0, _080F153C @ =gSprites
	lsls r3, r6, 4
	adds r2, r3, r6
	lsls r2, 2
	adds r2, r0
	ldrh r1, [r5, 0x8]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r4, r3, 0
	b _080F1558
	.align 2, 0
_080F153C: .4byte gSprites
_080F1540:
	ldr r0, _080F158C @ =gSprites
	lsls r2, r6, 4
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 24
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	adds r4, r2, 0
_080F1558:
	ldr r1, _080F1590 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	strh r1, [r0, 0x8]
	ldr r0, _080F1594 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080F1598
	ldr r0, _080F158C @ =gSprites
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bgt _080F15AE
	movs r0, 0
	strh r0, [r1, 0x24]
	b _080F15B4
	.align 2, 0
_080F158C: .4byte gSprites
_080F1590: .4byte gTasks
_080F1594: .4byte gBattleAnimAttacker
_080F1598:
	ldr r0, _080F15C4 @ =gSprites
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	blt _080F15AE
	strh r2, [r1, 0x24]
	movs r4, 0x1
	mov r8, r4
_080F15AE:
	mov r0, r8
	cmp r0, 0
	beq _080F15BA
_080F15B4:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080F15BA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F15C4: .4byte gSprites
	thumb_func_end sub_80F1420

	thumb_func_start sub_80F15C8
sub_80F15C8: @ 80F15C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080F15EC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080F1644
	cmp r0, 0x1
	bgt _080F15F0
	cmp r0, 0
	beq _080F15F6
	b _080F16B4
	.align 2, 0
_080F15EC: .4byte gTasks
_080F15F0:
	cmp r0, 0x2
	beq _080F167E
	b _080F16B4
_080F15F6:
	ldr r0, _080F1610 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F1618
	ldr r1, _080F1614 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	b _080F1620
	.align 2, 0
_080F1610: .4byte gBattleAnimAttacker
_080F1614: .4byte 0x00003f42
_080F1618:
	ldr r1, _080F163C @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
_080F1620:
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	ldr r0, _080F1640 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _080F16B4
	.align 2, 0
_080F163C: .4byte 0x00003f44
_080F1640: .4byte gTasks
_080F1644:
	ldrh r0, [r4, 0xA]
	adds r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080F16B4
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r2, [r4, 0x8]
	adds r2, 0x1
	strh r2, [r4, 0x8]
	lsls r1, r2, 8
	movs r0, 0x10
	subs r0, r2
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080F16B4
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _080F16B4
_080F167E:
	ldr r1, _080F16BC @ =gBattlerSpriteIds
	ldr r4, _080F16C0 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _080F16C4 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r0, _080F16C8 @ =0x06010000
	adds r1, r0
	movs r2, 0x80
	lsls r2, 4
	movs r0, 0
	movs r3, 0x1
	bl RequestDma3Fill
	ldrb r0, [r4]
	bl ClearBehindSubstituteBit
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080F16B4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F16BC: .4byte gBattlerSpriteIds
_080F16C0: .4byte gBattleAnimAttacker
_080F16C4: .4byte gSprites
_080F16C8: .4byte 0x06010000
	thumb_func_end sub_80F15C8

	thumb_func_start sub_80F16CC
sub_80F16CC: @ 80F16CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080F16F4 @ =gBattleAnimArgs
	ldr r1, _080F16F8 @ =gBattleSpritesDataPtr
	ldr r2, [r1]
	ldr r1, _080F16FC @ =gBattleAnimAttacker
	ldrb r1, [r1]
	ldr r2, [r2]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r3, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080F16F4: .4byte gBattleAnimArgs
_080F16F8: .4byte gBattleSpritesDataPtr
_080F16FC: .4byte gBattleAnimAttacker
	thumb_func_end sub_80F16CC

	thumb_func_start sub_80F1700
sub_80F1700: @ 80F1700
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F1718 @ =gBattleAnimTarget
	ldr r1, _080F171C @ =gUnknown_2023D6E
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080F1718: .4byte gBattleAnimTarget
_080F171C: .4byte gUnknown_2023D6E
	thumb_func_end sub_80F1700

	thumb_func_start sub_80F1720
sub_80F1720: @ 80F1720
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	mov r8, r0
	ldr r0, _080F17DC @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r4, r0, 0
	adds r0, r6, 0
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080F17F8
	lsrs r0, r5, 16
	ldr r7, _080F17E0 @ =0x0000ffff
	ands r5, r7
	eors r0, r5
	lsrs r1, r4, 16
	eors r0, r1
	ands r4, r7
	eors r0, r4
	cmp r0, 0x7
	bhi _080F177E
	movs r0, 0x1
	mov r8, r0
_080F177E:
	mov r0, r8
	cmp r0, 0
	beq _080F17F8
	ldr r0, _080F17E4 @ =0x000027f9
	bl GetSpriteTileStartByTag
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	bne _080F179E
	ldr r0, _080F17E8 @ =gUnknown_83AD350
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _080F17EC @ =gUnknown_83ADC58
	bl LoadCompressedSpritePaletteUsingHeap
_080F179E:
	ldr r5, _080F17F0 @ =sub_80F181C
	adds r0, r5, 0
	movs r1, 0xA
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080F17F4 @ =gTasks
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	adds r2, r3
	movs r4, 0
	strh r6, [r2, 0x8]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	strh r6, [r1, 0x8]
	strh r4, [r2, 0xA]
	movs r0, 0x1
	strh r0, [r1, 0xA]
	b _080F180E
	.align 2, 0
_080F17DC: .4byte gBattleSpritesDataPtr
_080F17E0: .4byte 0x0000ffff
_080F17E4: .4byte 0x000027f9
_080F17E8: .4byte gUnknown_83AD350
_080F17EC: .4byte gUnknown_83ADC58
_080F17F0: .4byte sub_80F181C
_080F17F4: .4byte gTasks
_080F17F8:
	ldr r0, _080F1818 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
_080F180E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1818: .4byte gBattleSpritesDataPtr
	thumb_func_end sub_80F1720

	thumb_func_start sub_80F181C
sub_80F181C: @ 80F181C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080F1844 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	bgt _080F1848
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	b _080F19C0
	.align 2, 0
_080F1844: .4byte gTasks
_080F1848:
	ldr r0, _080F189C @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	beq _080F1856
	b _080F19C0
_080F1856:
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	beq _080F186A
	b _080F19C0
_080F186A:
	ldrb r0, [r4, 0x8]
	mov r8, r0
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080F18A4
	ldr r0, _080F18A0 @ =gUnknown_83FF168
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	b _080F1906
	.align 2, 0
_080F189C: .4byte gBattleSpritesDataPtr
_080F18A0: .4byte gUnknown_83FF168
_080F18A4:
	cmp r0, 0
	blt _080F18D8
	cmp r0, 0x3
	bgt _080F18D8
	ldr r0, _080F18D0 @ =gUnknown_83FF180
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080F18D4 @ =gSprites
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x4
	b _080F18F8
	.align 2, 0
_080F18D0: .4byte gUnknown_83FF180
_080F18D4: .4byte gSprites
_080F18D8:
	ldr r0, _080F1930 @ =gUnknown_83FF180
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080F1934 @ =gSprites
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x5
_080F18F8:
	ldr r4, _080F1938 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080F193C @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_080F1906:
	ldr r2, _080F1940 @ =gTasks
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r6, r0, r2
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	mov r9, r1
	cmp r0, 0
	bne _080F1948
	ldr r1, _080F1934 @ =gSprites
	lsls r2, r5, 4
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080F1944 @ =sub_80F1A2C
	str r1, [r0]
	adds r4, r2, 0
	b _080F1990
	.align 2, 0
_080F1930: .4byte gUnknown_83FF180
_080F1934: .4byte gSprites
_080F1938: .4byte 0x000003ff
_080F193C: .4byte 0xfffffc00
_080F1940: .4byte gTasks
_080F1944: .4byte sub_80F1A2C
_080F1948:
	ldr r3, _080F19CC @ =gSprites
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080F19D0 @ =sub_80F1A80
	str r2, [r0]
	adds r1, r3
	ldr r0, _080F19D4 @ =0x0000ffe0
	strh r0, [r1, 0x24]
	movs r0, 0x20
	strh r0, [r1, 0x26]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080F1990
	mov r0, r8
	bl GetBattlerSide
	lsls r0, 24
	movs r1, 0x3F
	cmp r0, 0
	bne _080F1986
	movs r1, 0xC0
_080F1986:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x5F
	bl PlaySE12WithPanning
_080F1990:
	ldr r1, _080F19CC @ =gSprites
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	strh r7, [r0, 0x2E]
	ldr r1, _080F19D8 @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	cmp r5, 0x40
	beq _080F19B4
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
_080F19B4:
	movs r4, 0x1E
	ldrsh r0, [r1, r4]
	cmp r0, 0x5
	bne _080F19C0
	ldr r0, _080F19DC @ =sub_80F19E0
	str r0, [r1]
_080F19C0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F19CC: .4byte gSprites
_080F19D0: .4byte sub_80F1A80
_080F19D4: .4byte 0x0000ffe0
_080F19D8: .4byte gTasks
_080F19DC: .4byte sub_80F19E0
	thumb_func_end sub_80F181C

	thumb_func_start sub_80F19E0
sub_80F19E0: @ 80F19E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	ldr r1, _080F1A24 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0x20
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080F1A20
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080F1A1A
	ldrb r1, [r1, 0x8]
	ldr r0, _080F1A28 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
_080F1A1A:
	adds r0, r3, 0
	bl DestroyTask
_080F1A20:
	pop {r0}
	bx r0
	.align 2, 0
_080F1A24: .4byte gTasks
_080F1A28: .4byte gBattleSpritesDataPtr
	thumb_func_end sub_80F19E0

	thumb_func_start sub_80F1A2C
sub_80F1A2C: @ 80F1A2C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0xC
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080F1A76
	ldr r2, _080F1A7C @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080F1A76:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1A7C: .4byte gTasks
	thumb_func_end sub_80F1A2C

	thumb_func_start sub_80F1A80
sub_80F1A80: @ 80F1A80
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bgt _080F1A94
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080F1AD6
_080F1A94:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r4, 0x24]
	adds r1, 0x5
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	subs r0, 0x5
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x20
	ble _080F1AD6
	ldr r2, _080F1ADC @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080F1AD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1ADC: .4byte gTasks
	thumb_func_end sub_80F1A80

	thumb_func_start sub_80F1AE0
sub_80F1AE0: @ 80F1AE0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F1B08 @ =gUnknown_83AD470
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _080F1B0C @ =gUnknown_83ADD78
	bl LoadCompressedSpritePaletteUsingHeap
	ldr r0, _080F1B10 @ =0x0000281d
	bl IndexOfSpritePaletteTag
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1B08: .4byte gUnknown_83AD470
_080F1B0C: .4byte gUnknown_83ADD78
_080F1B10: .4byte 0x0000281d
	thumb_func_end sub_80F1AE0

	thumb_func_start sub_80F1B14
sub_80F1B14: @ 80F1B14
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080F1B38 @ =0x0000281d
	adds r0, r5, 0
	bl FreeSpriteTilesByTag
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1B38: .4byte 0x0000281d
	thumb_func_end sub_80F1B14

	thumb_func_start sub_80F1B3C
sub_80F1B3C: @ 80F1B3C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8075160
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r5, _080F1BB0 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r4, 0x32]
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x36]
	ldr r0, _080F1BB4 @ =0x0000ffe0
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	ldr r2, _080F1BB8 @ =gSprites
	ldr r1, _080F1BBC @ =gBattlerSpriteIds
	ldr r0, _080F1BC0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080F1BC4 @ =sub_8012354
	str r1, [r0]
	ldr r0, _080F1BC8 @ =sub_80F1BCC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1BB0: .4byte gBattleAnimArgs
_080F1BB4: .4byte 0x0000ffe0
_080F1BB8: .4byte gSprites
_080F1BBC: .4byte gBattlerSpriteIds
_080F1BC0: .4byte gBattleAnimAttacker
_080F1BC4: .4byte sub_8012354
_080F1BC8: .4byte sub_80F1BCC
	thumb_func_end sub_80F1B3C

	thumb_func_start sub_80F1BCC
sub_80F1BCC: @ 80F1BCC
	push {lr}
	adds r3, r0, 0
	ldr r2, _080F1BF4 @ =gSprites
	ldr r1, _080F1BF8 @ =gBattlerSpriteIds
	ldr r0, _080F1BFC @ =gBattleAnimAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F1BF0
	ldr r0, _080F1C00 @ =sub_80F1C04
	str r0, [r3, 0x1C]
_080F1BF0:
	pop {r0}
	bx r0
	.align 2, 0
_080F1BF4: .4byte gSprites
_080F1BF8: .4byte gBattlerSpriteIds
_080F1BFC: .4byte gBattleAnimAttacker
_080F1C00: .4byte sub_80F1C04
	thumb_func_end sub_80F1BCC

	thumb_func_start sub_80F1C04
sub_80F1C04: @ 80F1C04
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080F1C26
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080F1C2C @ =sub_80F1C30
	str r0, [r4, 0x1C]
_080F1C26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1C2C: .4byte sub_80F1C30
	thumb_func_end sub_80F1C04

	thumb_func_start sub_80F1C30
sub_80F1C30: @ 80F1C30
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080F1C80 @ =gSprites
	ldr r3, _080F1C84 @ =gBattlerSpriteIds
	ldr r2, _080F1C88 @ =gBattleAnimAttacker
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _080F1C78
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	ble _080F1C78
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl DestroyAnimSprite
_080F1C78:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1C80: .4byte gSprites
_080F1C84: .4byte gBattlerSpriteIds
_080F1C88: .4byte gBattleAnimAttacker
	thumb_func_end sub_80F1C30

	thumb_func_start sub_80F1C8C
sub_80F1C8C: @ 80F1C8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F1CA4 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080F1CA8
	cmp r0, 0x1
	beq _080F1CBC
	b _080F1CD0
	.align 2, 0
_080F1CA4: .4byte gBattleAnimArgs
_080F1CA8:
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _080F1CB8 @ =gBattleAnimAttacker
	strb r0, [r1]
	movs r0, 0x1
	b _080F1CC8
	.align 2, 0
_080F1CB8: .4byte gBattleAnimAttacker
_080F1CBC:
	movs r0, 0x1
	bl GetBattlerAtPosition
	ldr r1, _080F1CDC @ =gBattleAnimAttacker
	strb r0, [r1]
	movs r0, 0
_080F1CC8:
	bl GetBattlerAtPosition
	ldr r1, _080F1CE0 @ =gBattleAnimTarget
	strb r0, [r1]
_080F1CD0:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1CDC: .4byte gBattleAnimAttacker
_080F1CE0: .4byte gBattleAnimTarget
	thumb_func_end sub_80F1C8C

	thumb_func_start sub_80F1CE4
sub_80F1CE4: @ 80F1CE4
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080F1CF8 @ =gUnknown_2023E82
	ldrb r0, [r2, 0x5]
	cmp r0, 0x2
	bls _080F1D00
	ldr r1, _080F1CFC @ =gBattleAnimArgs
	movs r0, 0
	b _080F1D04
	.align 2, 0
_080F1CF8: .4byte gUnknown_2023E82
_080F1CFC: .4byte gBattleAnimArgs
_080F1D00:
	ldr r1, _080F1D10 @ =gBattleAnimArgs
	ldrb r0, [r2, 0x5]
_080F1D04:
	strh r0, [r1, 0xE]
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080F1D10: .4byte gBattleAnimArgs
	thumb_func_end sub_80F1CE4

	thumb_func_start sub_80F1D14
sub_80F1D14: @ 80F1D14
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080F1D2C @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	ldrh r1, [r0]
	cmp r1, 0x53
	bne _080F1D34
	ldr r1, _080F1D30 @ =gBattleAnimArgs
	movs r0, 0x1
	b _080F1D6C
	.align 2, 0
_080F1D2C: .4byte gBattleSpritesDataPtr
_080F1D30: .4byte gBattleAnimArgs
_080F1D34:
	cmp r1, 0xFA
	bne _080F1D44
	ldr r1, _080F1D40 @ =gBattleAnimArgs
	movs r0, 0x2
	b _080F1D6C
	.align 2, 0
_080F1D40: .4byte gBattleAnimArgs
_080F1D44:
	cmp r1, 0x80
	bne _080F1D54
	ldr r1, _080F1D50 @ =gBattleAnimArgs
	movs r0, 0x3
	b _080F1D6C
	.align 2, 0
_080F1D50: .4byte gBattleAnimArgs
_080F1D54:
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	bne _080F1D68
	ldr r1, _080F1D64 @ =gBattleAnimArgs
	movs r0, 0x4
	b _080F1D6C
	.align 2, 0
_080F1D64: .4byte gBattleAnimArgs
_080F1D68:
	ldr r1, _080F1D78 @ =gBattleAnimArgs
	movs r0, 0
_080F1D6C:
	strh r0, [r1]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080F1D78: .4byte gBattleAnimArgs
	thumb_func_end sub_80F1D14

	thumb_func_start sub_80F1D7C
sub_80F1D7C: @ 80F1D7C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080F1DA0 @ =gBattleAnimAttacker
	ldr r1, _080F1DA4 @ =gBattleSpritesDataPtr
	ldr r2, [r1]
	ldr r1, [r2, 0x8]
	ldrh r1, [r1]
	strb r1, [r3]
	ldr r3, _080F1DA8 @ =gBattleAnimTarget
	ldr r1, [r2, 0x8]
	ldrh r1, [r1]
	lsrs r1, 8
	strb r1, [r3]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080F1DA0: .4byte gBattleAnimAttacker
_080F1DA4: .4byte gBattleSpritesDataPtr
_080F1DA8: .4byte gBattleAnimTarget
	thumb_func_end sub_80F1D7C

	.align 2, 0 @ Don't pad with nop.
