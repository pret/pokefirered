	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80DE0B4
sub_80DE0B4: @ 80DE0B4
	push {lr}
	ldr r1, _080DE0C4 @ =gUnknown_203B0A0
	movs r0, 0
	strb r0, [r1, 0x9]
	bl hm2_sweet_scent
	pop {r0}
	bx r0
	.align 2, 0
_080DE0C4: .4byte gUnknown_203B0A0
	thumb_func_end sub_80DE0B4

	thumb_func_start sub_80DE0C8
sub_80DE0C8: @ 80DE0C8
	ldr r1, _080DE0D8 @ =gUnknown_3005024
	ldr r0, _080DE0DC @ =hm_add_c3_launch_phase_2
	str r0, [r1]
	ldr r1, _080DE0E0 @ =gUnknown_203B0C4
	ldr r0, _080DE0E4 @ =hm2_sweet_scent
	str r0, [r1]
	movs r0, 0x1
	bx lr
	.align 2, 0
_080DE0D8: .4byte gUnknown_3005024
_080DE0DC: .4byte hm_add_c3_launch_phase_2
_080DE0E0: .4byte gUnknown_203B0C4
_080DE0E4: .4byte hm2_sweet_scent
	thumb_func_end sub_80DE0C8

	thumb_func_start hm2_sweet_scent
hm2_sweet_scent: @ 80DE0E8
	push {lr}
	movs r0, 0x33
	bl FieldEffectStart
	bl GetCursorSelectionMonId
	ldr r1, _080DE100 @ =gFieldEffectArguments
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080DE100: .4byte gFieldEffectArguments
	thumb_func_end hm2_sweet_scent

	thumb_func_start FldEff_SweetScent
FldEff_SweetScent: @ 80DE104
	push {lr}
	bl sub_807B05C
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DE12C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080DE130 @ =sub_80DE134
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080DE12C: .4byte gTasks
_080DE130: .4byte sub_80DE134
	thumb_func_end FldEff_SweetScent

	thumb_func_start sub_80DE134
sub_80DE134: @ 80DE134
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0xE5
	bl PlaySE
	ldr r4, _080DE1B8 @ =gUnknown_203AAB0
	movs r0, 0x80
	lsls r0, 3
	bl Alloc
	adds r1, r0, 0
	str r1, [r4]
	ldr r4, _080DE1BC @ =gPlttBufferUnfaded
	movs r5, 0x80
	lsls r5, 1
	adds r0, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	ldr r0, _080DE1C0 @ =gPlttBufferFaded
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	bl GetPlayerAvatarObjectId
	ldr r2, _080DE1C4 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	mvns r0, r0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	bl BeginNormalPaletteFade
	ldr r0, _080DE1C8 @ =sub_80DE1D0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DE1CC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x33
	bl FieldEffectActiveListRemove
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DE1B8: .4byte gUnknown_203AAB0
_080DE1BC: .4byte gPlttBufferUnfaded
_080DE1C0: .4byte gPlttBufferFaded
_080DE1C4: .4byte gSprites
_080DE1C8: .4byte sub_80DE1D0
_080DE1CC: .4byte gTasks
	thumb_func_end sub_80DE134

	thumb_func_start sub_80DE1D0
sub_80DE1D0: @ 80DE1D0
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r5, r0, 3
	ldr r6, _080DE21C @ =gTasks+0x8
	adds r2, r5, r6
	ldr r0, _080DE220 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080DE26C
	ldrh r3, [r2]
	movs r7, 0
	ldrsh r0, [r2, r7]
	cmp r0, 0x40
	bne _080DE268
	strh r1, [r2]
	bl sub_8082EC0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DE228
	ldr r0, _080DE224 @ =gUnknown_203AAB0
	ldr r0, [r0]
	bl Free
	adds r0, r4, 0
	bl DestroyTask
	b _080DE26C
	.align 2, 0
_080DE21C: .4byte gTasks+0x8
_080DE220: .4byte gPaletteFade
_080DE224: .4byte gUnknown_203AAB0
_080DE228:
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _080DE260 @ =sub_80DE274
	str r1, [r0]
	bl GetPlayerAvatarObjectId
	ldr r2, _080DE264 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	mvns r0, r0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080DE26C
	.align 2, 0
_080DE260: .4byte sub_80DE274
_080DE264: .4byte gSprites
_080DE268:
	adds r0, r3, 0x1
	strh r0, [r2]
_080DE26C:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE1D0

	thumb_func_start sub_80DE274
sub_80DE274: @ 80DE274
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080DE2B0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080DE2AA
	ldr r4, _080DE2B4 @ =gUnknown_203AAB0
	ldr r0, [r4]
	ldr r1, _080DE2B8 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 1
	bl CpuFastSet
	bl sub_807B070
	ldr r0, [r4]
	bl Free
	ldr r0, _080DE2BC @ =gUnknown_81BE564
	bl ScriptContext1_SetupScript
	adds r0, r5, 0
	bl DestroyTask
_080DE2AA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DE2B0: .4byte gPaletteFade
_080DE2B4: .4byte gUnknown_203AAB0
_080DE2B8: .4byte gPlttBufferUnfaded
_080DE2BC: .4byte gUnknown_81BE564
	thumb_func_end sub_80DE274

	.align 2, 0 @ Don't pad with nop.
