	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sp000_heal_pokemon
sp000_heal_pokemon: @ 80A0058
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	ldr r0, _080A0114 @ =gUnknown_2024029
	ldrb r0, [r0]
	cmp r8, r0
	bcs _080A0104
	ldr r1, _080A0118 @ =gUnknown_2024284
	mov r10, r1
	mov r6, sp
_080A0076:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r10
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	lsls r1, r0, 16
	strb r0, [r6]
	lsrs r1, 24
	strb r1, [r6, 0x1]
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
	movs r1, 0x1
	add r1, r8
	mov r9, r1
_080A00AC:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r7, 0
	adds r2, r5, 0
	bl CalculatePPWithBonus
	strb r0, [r6]
	adds r1, r5, 0
	adds r1, 0x11
	adds r0, r4, 0
	mov r2, sp
	bl sub_804037C
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080A00AC
	movs r0, 0
	strb r0, [r6]
	strb r0, [r6, 0x1]
	strb r0, [r6, 0x2]
	strb r0, [r6, 0x3]
	movs r1, 0x64
	mov r0, r8
	muls r0, r1
	add r0, r10
	movs r1, 0x37
	mov r2, sp
	bl sub_804037C
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080A0114 @ =gUnknown_2024029
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080A0076
_080A0104:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0114: .4byte gUnknown_2024029
_080A0118: .4byte gUnknown_2024284
	thumb_func_end sp000_heal_pokemon

	thumb_func_start ScriptGiveMon
ScriptGiveMon: @ 80A011C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r6, 16
	lsrs r6, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r0, r5, 16
	mov r8, r0
	movs r0, 0x64
	bl AllocZeroed
	adds r7, r0, 0
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r4, 0
	movs r3, 0x20
	bl CreateMon
	add r0, sp, 0x10
	mov r1, r8
	strb r1, [r0]
	lsrs r5, 24
	strb r5, [r0, 0x1]
	adds r0, r7, 0
	movs r1, 0xC
	add r2, sp, 0x10
	bl sub_804037C
	adds r0, r7, 0
	bl GiveMonToPlayer
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0x1
	bgt _080A0196
	cmp r4, 0
	blt _080A0196
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8088E74
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8088E74
_080A0196:
	adds r0, r7, 0
	bl Free
	adds r0, r4, 0
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ScriptGiveMon

	thumb_func_start sub_80A01AC
sub_80A01AC: @ 80A01AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x64
	bl AllocZeroed
	adds r5, r0, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl CreateEgg
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	adds r0, r5, 0
	movs r1, 0x2D
	mov r2, sp
	bl sub_804037C
	adds r0, r5, 0
	bl GiveMonToPlayer
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl Free
	adds r0, r4, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80A01AC

	thumb_func_start sub_80A01F4
sub_80A01F4: @ 80A01F4
	push {lr}
	bl GetMonsStateToDoubles
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	beq _080A0210
	cmp r1, 0x1
	bgt _080A020C
	cmp r1, 0
	beq _080A0210
	b _080A0214
_080A020C:
	cmp r1, 0x2
	bne _080A0214
_080A0210:
	ldr r0, _080A0218 @ =gUnknown_20370D0
	strh r1, [r0]
_080A0214:
	pop {r0}
	bx r0
	.align 2, 0
_080A0218: .4byte gUnknown_20370D0
	thumb_func_end sub_80A01F4

	thumb_func_start sub_80A021C
sub_80A021C: @ 80A021C
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r5, 0
	movs r7, 0xCE
	lsls r7, 1
_080A0228:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080A0258 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080A025C
	cmp r0, r7
	beq _080A025C
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, r6
	bne _080A025C
	movs r0, 0x1
	b _080A0264
	.align 2, 0
_080A0258: .4byte gUnknown_2024284
_080A025C:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080A0228
	movs r0, 0
_080A0264:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A021C

	thumb_func_start sub_80A026C
sub_80A026C: @ 80A026C
	push {r4,lr}
	movs r0, 0xAF
	bl sub_80A021C
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0x1
	bne _080A028E
	movs r0, 0xAF
	bl ItemIdToBerryType
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A0298 @ =gUnknown_2021CD0
	bl GetBerryNameByBerryType
_080A028E:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A0298: .4byte gUnknown_2021CD0
	thumb_func_end sub_80A026C

	thumb_func_start CreateScriptedWildMon
CreateScriptedWildMon: @ 80A029C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r7, r2, 16
	lsrs r6, r7, 16
	bl ZeroEnemyPartyMons
	ldr r0, _080A02F8 @ =gUnknown_202402C
	mov r8, r0
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x20
	bl CreateMon
	cmp r6, 0
	beq _080A02EA
	add r0, sp, 0x10
	strb r6, [r0]
	adds r1, r0, 0
	lsrs r0, r7, 24
	strb r0, [r1, 0x1]
	mov r0, r8
	movs r1, 0xC
	add r2, sp, 0x10
	bl sub_804037C
_080A02EA:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A02F8: .4byte gUnknown_202402C
	thumb_func_end CreateScriptedWildMon

	thumb_func_start ScriptSetMonMoveSlot
ScriptSetMonMoveSlot: @ 80A02FC
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r3, 0x6
	bls _080A0318
	ldr r0, _080A032C @ =gUnknown_2024029
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080A0318:
	movs r0, 0x64
	muls r0, r3
	ldr r1, _080A0330 @ =gUnknown_2024284
	adds r0, r1
	adds r1, r4, 0
	bl SetMonMoveSlot
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A032C: .4byte gUnknown_2024029
_080A0330: .4byte gUnknown_2024284
	thumb_func_end ScriptSetMonMoveSlot

	thumb_func_start sub_80A0334
sub_80A0334: @ 80A0334
	push {lr}
	ldr r1, _080A0348 @ =gUnknown_30030F0
	ldr r0, _080A034C @ =sub_80A0350
	str r0, [r1, 0x8]
	movs r0, 0
	bl sub_81274A8
	pop {r0}
	bx r0
	.align 2, 0
_080A0348: .4byte gUnknown_30030F0
_080A034C: .4byte sub_80A0350
	thumb_func_end sub_80A0334

	thumb_func_start sub_80A0350
sub_80A0350: @ 80A0350
	push {lr}
	ldr r0, _080A0360 @ =gUnknown_203B0D4
	ldrb r1, [r0]
	cmp r1, 0
	bne _080A0368
	ldr r0, _080A0364 @ =gUnknown_20370D0
	strh r1, [r0]
	b _080A036E
	.align 2, 0
_080A0360: .4byte gUnknown_203B0D4
_080A0364: .4byte gUnknown_20370D0
_080A0368:
	ldr r1, _080A0378 @ =gUnknown_20370D0
	movs r0, 0x1
	strh r0, [r1]
_080A036E:
	ldr r0, _080A037C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A0378: .4byte gUnknown_20370D0
_080A037C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80A0350

	thumb_func_start sub_80A0380
sub_80A0380: @ 80A0380
	push {lr}
	ldr r1, _080A0394 @ =gUnknown_30030F0
	ldr r0, _080A0398 @ =sub_80A039C
	str r0, [r1, 0x8]
	movs r0, 0x1
	bl sub_81274A8
	pop {r0}
	bx r0
	.align 2, 0
_080A0394: .4byte gUnknown_30030F0
_080A0398: .4byte sub_80A039C
	thumb_func_end sub_80A0380

	thumb_func_start sub_80A039C
sub_80A039C: @ 80A039C
	push {r4,lr}
	ldr r0, _080A03B0 @ =gUnknown_203B0D4
	ldrb r4, [r0]
	cmp r4, 0
	bne _080A03B8
	bl sub_804C230
	ldr r0, _080A03B4 @ =gUnknown_20370D0
	strh r4, [r0]
	b _080A03C2
	.align 2, 0
_080A03B0: .4byte gUnknown_203B0D4
_080A03B4: .4byte gUnknown_20370D0
_080A03B8:
	bl sub_80A03D8
	ldr r1, _080A03D0 @ =gUnknown_20370D0
	movs r0, 0x1
	strh r0, [r1]
_080A03C2:
	ldr r0, _080A03D4 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A03D0: .4byte gUnknown_20370D0
_080A03D4: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80A039C

	thumb_func_start sub_80A03D8
sub_80A03D8: @ 80A03D8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r0, 0x96
	lsls r0, 1
	bl AllocZeroed
	adds r7, r0, 0
	movs r5, 0
	movs r0, 0x64
	mov r8, r0
	ldr r6, _080A0454 @ =gUnknown_2024284
	adds r4, r7, 0
_080A03F4:
	ldr r0, _080A0458 @ =gUnknown_203B0D4
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080A040E
	subs r0, 0x1
	mov r1, r8
	muls r1, r0
	adds r1, r6
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
_080A040E:
	adds r4, 0x64
	adds r5, 0x1
	cmp r5, 0x2
	ble _080A03F4
	movs r0, 0
	str r0, [sp]
	ldr r4, _080A0454 @ =gUnknown_2024284
	ldr r2, _080A045C @ =0x05000096
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	adds r5, r7, 0
	adds r6, r7, 0
	adds r6, 0xC8
_080A042C:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x64
	cmp r5, r6
	ble _080A042C
	bl CalculatePlayerPartyCount
	adds r0, r7, 0
	bl Free
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0454: .4byte gUnknown_2024284
_080A0458: .4byte gUnknown_203B0D4
_080A045C: .4byte 0x05000096
	thumb_func_end sub_80A03D8

	.align 2, 0 @ Don't pad with nop.
