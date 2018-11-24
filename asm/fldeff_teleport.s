	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start SetUpFieldMove_Teleport
SetUpFieldMove_Teleport: @ 80F66F0
	push {lr}
	ldr r0, _080F6708 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080F670C
	movs r0, 0
	b _080F671A
	.align 2, 0
_080F6708: .4byte gMapHeader
_080F670C:
	ldr r1, _080F6720 @ =gUnknown_3005024
	ldr r0, _080F6724 @ =hm_add_c3_launch_phase_2
	str r0, [r1]
	ldr r1, _080F6728 @ =gUnknown_203B0C4
	ldr r0, _080F672C @ =hm_teleport_run_dp02scr
	str r0, [r1]
	movs r0, 0x1
_080F671A:
	pop {r1}
	bx r1
	.align 2, 0
_080F6720: .4byte gUnknown_3005024
_080F6724: .4byte hm_add_c3_launch_phase_2
_080F6728: .4byte gUnknown_203B0C4
_080F672C: .4byte hm_teleport_run_dp02scr
	thumb_func_end SetUpFieldMove_Teleport

	thumb_func_start hm_teleport_run_dp02scr
hm_teleport_run_dp02scr: @ 80F6730
	push {lr}
	bl sub_8054D08
	movs r0, 0x3F
	bl FieldEffectStart
	bl GetCursorSelectionMonId
	ldr r1, _080F674C @ =gFieldEffectArguments
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F674C: .4byte gFieldEffectArguments
	thumb_func_end hm_teleport_run_dp02scr

	thumb_func_start FldEff_UseTeleport
FldEff_UseTeleport: @ 80F6750
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F6778 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080F677C @ =sub_80F6780
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080F6778: .4byte gTasks
_080F677C: .4byte sub_80F6780
	thumb_func_end FldEff_UseTeleport

	thumb_func_start sub_80F6780
sub_80F6780: @ 80F6780
	push {lr}
	movs r0, 0x3F
	bl FieldEffectActiveListRemove
	bl sub_8085B64
	pop {r0}
	bx r0
	thumb_func_end sub_80F6780

	.align 2, 0 @ Don't pad with nop.
