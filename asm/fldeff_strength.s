	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D07EC
sub_80D07EC: @ 80D07EC
	push {r4,lr}
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080D0808
	movs r0, 0x61
	bl npc_before_player_of_type
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080D080C
_080D0808:
	movs r0, 0
	b _080D0826
_080D080C:
	ldr r4, _080D082C @ =gUnknown_20370D0
	bl sub_811FB0C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r1, _080D0830 @ =gUnknown_3005024
	ldr r0, _080D0834 @ =hm_add_c3_launch_phase_2
	str r0, [r1]
	ldr r1, _080D0838 @ =gUnknown_203B0C4
	ldr r0, _080D083C @ =sub_80D0840
	str r0, [r1]
	movs r0, 0x1
_080D0826:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D082C: .4byte gUnknown_20370D0
_080D0830: .4byte gUnknown_3005024
_080D0834: .4byte hm_add_c3_launch_phase_2
_080D0838: .4byte gUnknown_203B0C4
_080D083C: .4byte sub_80D0840
	thumb_func_end sub_80D07EC

	thumb_func_start sub_80D0840
sub_80D0840: @ 80D0840
	push {lr}
	bl sub_811FB0C
	ldr r1, _080D0858 @ =gUnknown_20386E0
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	ldr r0, _080D085C @ =gUnknown_81BE16E
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080D0858: .4byte gUnknown_20386E0
_080D085C: .4byte gUnknown_81BE16E
	thumb_func_end sub_80D0840

	thumb_func_start sub_80D0860
sub_80D0860: @ 80D0860
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D0894 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080D0898 @ =sub_80D08A8
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080D089C @ =gUnknown_20386E0
	ldr r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D08A0 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _080D08A4 @ =gUnknown_2021CD0
	bl GetMonNickname
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080D0894: .4byte gUnknown_3005090
_080D0898: .4byte sub_80D08A8
_080D089C: .4byte gUnknown_20386E0
_080D08A0: .4byte gUnknown_2024284
_080D08A4: .4byte gUnknown_2021CD0
	thumb_func_end sub_80D0860

	thumb_func_start sub_80D08A8
sub_80D08A8: @ 80D08A8
	push {lr}
	movs r0, 0x28
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80D08A8

	.align 2, 0 @ Don't pad with nop.
