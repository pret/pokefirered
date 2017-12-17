	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start npc_before_player_of_type
npc_before_player_of_type: @ 80C97A8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080C97E8 @ =gUnknown_2039A04
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	bl PlayerGetZCoord
	strb r0, [r4, 0x4]
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C97EC @ =gUnknown_2036E38
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x5]
	cmp r0, r5
	bne _080C97F4
	ldr r1, _080C97F0 @ =gUnknown_20370D2
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	movs r0, 0x1
	b _080C97F6
	.align 2, 0
_080C97E8: .4byte gUnknown_2039A04
_080C97EC: .4byte gUnknown_2036E38
_080C97F0: .4byte gUnknown_20370D2
_080C97F4:
	movs r0, 0
_080C97F6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end npc_before_player_of_type

	thumb_func_start oei_task_add
oei_task_add: @ 80C97FC
	push {lr}
	ldr r0, _080C9818 @ =gUnknown_2039A04
	adds r1, r0, 0x2
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _080C981C @ =task08_080C9820
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080C9818: .4byte gUnknown_2039A04
_080C981C: .4byte task08_080C9820
	thumb_func_end oei_task_add

	thumb_func_start task08_080C9820
task08_080C9820: @ 80C9820
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl ScriptContext2_Enable
	ldr r1, _080C9874 @ =gUnknown_2037078
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r1, [r1, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C9878 @ =gUnknown_2036E38
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080C9856
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C98A2
_080C9856:
	ldr r0, _080C987C @ =gUnknown_2036DFC
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _080C9888
	movs r0, 0x3B
	bl FieldEffectStart
	ldr r0, _080C9880 @ =gUnknown_3005090
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C9884 @ =sub_80C98FC
	b _080C98A0
	.align 2, 0
_080C9874: .4byte gUnknown_2037078
_080C9878: .4byte gUnknown_2036E38
_080C987C: .4byte gUnknown_2036DFC
_080C9880: .4byte gUnknown_3005090
_080C9884: .4byte sub_80C98FC
_080C9888:
	bl sub_805CB70
	adds r0, r4, 0
	movs r1, 0x45
	bl sub_8063CA4
	ldr r0, _080C98A8 @ =gUnknown_3005090
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C98AC @ =sub_80C98B0
_080C98A0:
	str r0, [r1]
_080C98A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C98A8: .4byte gUnknown_3005090
_080C98AC: .4byte sub_80C98B0
	thumb_func_end task08_080C9820

	thumb_func_start sub_80C98B0
sub_80C98B0: @ 80C98B0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C98EC @ =gUnknown_2037078
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C98F0 @ =gUnknown_2036E38
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C98E4
	movs r0, 0x3B
	bl FieldEffectStart
	ldr r0, _080C98F4 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C98F8 @ =sub_80C98FC
	str r0, [r1]
_080C98E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C98EC: .4byte gUnknown_2037078
_080C98F0: .4byte gUnknown_2036E38
_080C98F4: .4byte gUnknown_3005090
_080C98F8: .4byte sub_80C98FC
	thumb_func_end sub_80C98B0

	thumb_func_start sub_80C98FC
sub_80C98FC: @ 80C98FC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080C9980
	bl player_get_direction_lower_nybble
	ldr r6, _080C9988 @ =gUnknown_20386E0
	lsls r0, 24
	lsrs r0, 24
	str r0, [r6, 0x4]
	cmp r0, 0x1
	bne _080C9922
	str r4, [r6, 0x8]
_080C9922:
	ldr r1, [r6, 0x4]
	cmp r1, 0x2
	bne _080C992C
	movs r0, 0x1
	str r0, [r6, 0x8]
_080C992C:
	cmp r1, 0x3
	bne _080C9934
	movs r0, 0x2
	str r0, [r6, 0x8]
_080C9934:
	cmp r1, 0x4
	bne _080C993C
	movs r0, 0x3
	str r0, [r6, 0x8]
_080C993C:
	ldr r5, _080C998C @ =gUnknown_2037078
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080C9990 @ =gUnknown_2036E38
	adds r4, r0
	bl GetPlayerAvatarGraphicsIdByCurrentState
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805F060
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C9994 @ =gUnknown_202063C
	adds r0, r1
	ldrb r1, [r6, 0x8]
	bl StartSpriteAnim
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r1, _080C9998 @ =gUnknown_3005090
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C999C @ =sub_80C99A0
	str r1, [r0]
_080C9980:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C9988: .4byte gUnknown_20386E0
_080C998C: .4byte gUnknown_2037078
_080C9990: .4byte gUnknown_2036E38
_080C9994: .4byte gUnknown_202063C
_080C9998: .4byte gUnknown_3005090
_080C999C: .4byte sub_80C99A0
	thumb_func_end sub_80C98FC

	thumb_func_start sub_80C99A0
sub_80C99A0: @ 80C99A0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080C99D0 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x18]
	lsls r1, 16
	ldrh r0, [r0, 0x1A]
	orrs r1, r0
	bl _call_via_r1
	ldr r1, _080C99D4 @ =gUnknown_2037078
	movs r0, 0
	strb r0, [r1, 0x6]
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C99D0: .4byte gUnknown_3005090
_080C99D4: .4byte gUnknown_2037078
	thumb_func_end sub_80C99A0

	thumb_func_start sub_80C99D8
sub_80C99D8: @ 80C99D8
	push {lr}
	movs r0, 0x60
	bl npc_before_player_of_type
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C99EC
	movs r0, 0
	b _080C99FA
_080C99EC:
	ldr r1, _080C9A00 @ =gUnknown_3005024
	ldr r0, _080C9A04 @ =hm_add_c3_launch_phase_2
	str r0, [r1]
	ldr r1, _080C9A08 @ =gUnknown_203B0C4
	ldr r0, _080C9A0C @ =sub_80C9A10
	str r0, [r1]
	movs r0, 0x1
_080C99FA:
	pop {r1}
	bx r1
	.align 2, 0
_080C9A00: .4byte gUnknown_3005024
_080C9A04: .4byte hm_add_c3_launch_phase_2
_080C9A08: .4byte gUnknown_203B0C4
_080C9A0C: .4byte sub_80C9A10
	thumb_func_end sub_80C99D8

	thumb_func_start sub_80C9A10
sub_80C9A10: @ 80C9A10
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _080C9A28 @ =gUnknown_20386E0
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	ldr r0, _080C9A2C @ =gUnknown_81BE064
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C9A28: .4byte gUnknown_20386E0
_080C9A2C: .4byte gUnknown_81BE064
	thumb_func_end sub_80C9A10

	thumb_func_start oei_rocksmash
oei_rocksmash: @ 80C9A30
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9A58 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C9A5C @ =sub_80C9A60
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x13
	bl sub_8054E90
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C9A58: .4byte gUnknown_3005090
_080C9A5C: .4byte sub_80C9A60
	thumb_func_end oei_rocksmash

	thumb_func_start sub_80C9A60
sub_80C9A60: @ 80C9A60
	push {lr}
	movs r0, 0x7C
	bl sub_80722CC
	movs r0, 0x25
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C9A60

	thumb_func_start sub_80C9A78
sub_80C9A78: @ 80C9A78
	push {lr}
	bl sub_80A1B8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9A8A
	movs r0, 0
	b _080C9A98
_080C9A8A:
	ldr r1, _080C9A9C @ =gUnknown_3005024
	ldr r0, _080C9AA0 @ =hm_add_c3_launch_phase_2
	str r0, [r1]
	ldr r1, _080C9AA4 @ =gUnknown_203B0C4
	ldr r0, _080C9AA8 @ =hm2_dig
	str r0, [r1]
	movs r0, 0x1
_080C9A98:
	pop {r1}
	bx r1
	.align 2, 0
_080C9A9C: .4byte gUnknown_3005024
_080C9AA0: .4byte hm_add_c3_launch_phase_2
_080C9AA4: .4byte gUnknown_203B0C4
_080C9AA8: .4byte hm2_dig
	thumb_func_end sub_80C9A78

	thumb_func_start hm2_dig
hm2_dig: @ 80C9AAC
	push {lr}
	bl sub_8054D70
	movs r0, 0x26
	bl FieldEffectStart
	bl GetCursorSelectionMonId
	ldr r1, _080C9AC8 @ =gUnknown_20386E0
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C9AC8: .4byte gUnknown_20386E0
	thumb_func_end hm2_dig

	thumb_func_start sub_80C9ACC
sub_80C9ACC: @ 80C9ACC
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9AF4 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C9AF8 @ =sub_80C9AFC
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x1
	bl sub_805BDEC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C9AF4: .4byte gUnknown_3005090
_080C9AF8: .4byte sub_80C9AFC
	thumb_func_end sub_80C9ACC

	thumb_func_start sub_80C9AFC
sub_80C9AFC: @ 80C9AFC
	push {lr}
	movs r0, 0x26
	bl FieldEffectActiveListRemove
	ldr r0, _080C9B24 @ =sub_80A1C44
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9B28 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080C9B24: .4byte sub_80A1C44
_080C9B28: .4byte gUnknown_3005090
	thumb_func_end sub_80C9AFC

	.align 2, 0 @ Don't pad with nop.
