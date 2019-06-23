	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start GetSafariZoneFlag
GetSafariZoneFlag: @ 80A0E90
	push {lr}
	movs r0, 0x80
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetSafariZoneFlag

	thumb_func_start sub_80A0EA4
sub_80A0EA4: @ 80A0EA4
	push {lr}
	movs r0, 0x80
	lsls r0, 4
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end sub_80A0EA4

	thumb_func_start ResetSafariZoneFlag
ResetSafariZoneFlag: @ 80A0EB4
	push {lr}
	movs r0, 0x80
	lsls r0, 4
	bl FlagClear
	pop {r0}
	bx r0
	thumb_func_end ResetSafariZoneFlag

	thumb_func_start sub_80A0EC4
sub_80A0EC4: @ 80A0EC4
	push {lr}
	movs r0, 0x11
	bl IncrementGameStat
	bl sub_80A0EA4
	ldr r1, _080A0EE4 @ =gUnknown_2039994
	movs r0, 0x1E
	strb r0, [r1]
	ldr r1, _080A0EE8 @ =gUnknown_2039996
	movs r2, 0x96
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A0EE4: .4byte gUnknown_2039994
_080A0EE8: .4byte gUnknown_2039996
	thumb_func_end sub_80A0EC4

	thumb_func_start sub_80A0EEC
sub_80A0EEC: @ 80A0EEC
	push {lr}
	bl ResetSafariZoneFlag
	ldr r1, _080A0F04 @ =gUnknown_2039994
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080A0F08 @ =gUnknown_2039996
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A0F04: .4byte gUnknown_2039994
_080A0F08: .4byte gUnknown_2039996
	thumb_func_end sub_80A0EEC

	thumb_func_start sub_80A0F0C
sub_80A0F0C: @ 80A0F0C
	push {lr}
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _080A0F24
	ldr r1, _080A0F28 @ =gUnknown_2039996
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080A0F2C
_080A0F24:
	movs r0, 0
	b _080A0F34
	.align 2, 0
_080A0F28: .4byte gUnknown_2039996
_080A0F2C:
	ldr r0, _080A0F38 @ =gUnknown_81BFBC5
	bl ScriptContext1_SetupScript
	movs r0, 0x1
_080A0F34:
	pop {r1}
	bx r1
	.align 2, 0
_080A0F38: .4byte gUnknown_81BFBC5
	thumb_func_end sub_80A0F0C

	thumb_func_start sub_80A0F3C
sub_80A0F3C: @ 80A0F3C
	push {lr}
	ldr r0, _080A0F48 @ =gUnknown_81BFBAA
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080A0F48: .4byte gUnknown_81BFBAA
	thumb_func_end sub_80A0F3C

	thumb_func_start sub_80A0F4C
sub_80A0F4C: @ 80A0F4C
	push {lr}
	ldr r0, _080A0F60 @ =gUnknown_2039994
	ldrb r0, [r0]
	cmp r0, 0
	beq _080A0F68
	ldr r0, _080A0F64 @ =CB2_ReturnToField
	bl SetMainCallback2
	b _080A0FB0
	.align 2, 0
_080A0F60: .4byte gUnknown_2039994
_080A0F64: .4byte CB2_ReturnToField
_080A0F68:
	ldr r0, _080A0F88 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _080A0F9C
	ldr r0, _080A0F8C @ =gUnknown_81BFB87
	bl ScriptContext2_RunNewScript
	bl warp_in
	ldr r1, _080A0F90 @ =gFieldCallback
	ldr r0, _080A0F94 @ =sub_807E3EC
	str r0, [r1]
	ldr r0, _080A0F98 @ =sub_805671C
	bl SetMainCallback2
	b _080A0FB0
	.align 2, 0
_080A0F88: .4byte gBattleOutcome
_080A0F8C: .4byte gUnknown_81BFB87
_080A0F90: .4byte gFieldCallback
_080A0F94: .4byte sub_807E3EC
_080A0F98: .4byte sub_805671C
_080A0F9C:
	cmp r0, 0x7
	bne _080A0FB0
	ldr r0, _080A0FB4 @ =gUnknown_81BFBD7
	bl ScriptContext1_SetupScript
	bl ScriptContext1_Stop
	ldr r0, _080A0FB8 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_080A0FB0:
	pop {r0}
	bx r0
	.align 2, 0
_080A0FB4: .4byte gUnknown_81BFBD7
_080A0FB8: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80A0F4C

	.align 2, 0 @ Don't pad with nop.
