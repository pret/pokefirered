	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_807F620
sub_807F620: @ 807F620
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807F640 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807F644
	cmp r0, 0x1
	beq _0807F65E
	b _0807F686
	.align 2, 0
_0807F640: .4byte gTasks+0x8
_0807F644:
	bl c3_80A0DD8_is_running
	cmp r0, 0
	bne _0807F686
	bl sub_812B478
	ldrb r0, [r4, 0x2]
	bl sub_80D08B8
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F686
_0807F65E:
	bl sub_80D08F8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807F686
	bl sub_812B484
	bl sub_80563F0
	ldr r0, _0807F68C @ =sub_800FD9C
	bl SetMainCallback2
	bl sub_806D7E8
	bl overworld_poison_timer_set
	adds r0, r5, 0
	bl DestroyTask
_0807F686:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F68C: .4byte sub_800FD9C
	thumb_func_end sub_807F620

	thumb_func_start sub_807F690
sub_807F690: @ 807F690
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _0807F6C4 @ =sub_807F620
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807F6C8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	adds r0, r5, 0
	bl PlayMapChosenOrBattleBGM
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F6C4: .4byte sub_807F620
_0807F6C8: .4byte gTasks
	thumb_func_end sub_807F690

	thumb_func_start sub_807F6CC
sub_807F6CC: @ 807F6CC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r0, 0x1
	bne _0807F6FC
	adds r0, r1, 0
	subs r0, 0x58
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bhi _0807F6FC
	ldr r0, _0807F6F8 @ =0x00000167
	movs r1, 0x1
	bl sub_8099F40
	lsls r0, 24
	cmp r0, 0
	bne _0807F6FC
	movs r0, 0x1
	b _0807F6FE
	.align 2, 0
_0807F6F8: .4byte 0x00000167
_0807F6FC:
	movs r0, 0
_0807F6FE:
	pop {r1}
	bx r1
	thumb_func_end sub_807F6CC

	thumb_func_start sub_807F704
sub_807F704: @ 807F704
	push {lr}
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _0807F714
	bl sub_807F7D8
	b _0807F744
_0807F714:
	ldr r0, _0807F73C @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_807F6CC
	lsls r0, 24
	cmp r0, 0
	beq _0807F740
	bl sub_807F810
	b _0807F744
	.align 2, 0
_0807F73C: .4byte gSaveBlock1Ptr
_0807F740:
	bl sub_807F748
_0807F744:
	pop {r0}
	bx r0
	thumb_func_end sub_807F704

	thumb_func_start sub_807F748
sub_807F748: @ 807F748
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_805C780
	ldr r1, _0807F780 @ =gMain
	ldr r0, _0807F784 @ =sub_807FB40
	str r0, [r1, 0x8]
	ldr r1, _0807F788 @ =gBattleTypeFlags
	movs r0, 0
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_807F690
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x8
	bl IncrementGameStat
	pop {r0}
	bx r0
	.align 2, 0
_0807F780: .4byte gMain
_0807F784: .4byte sub_807FB40
_0807F788: .4byte gBattleTypeFlags
	thumb_func_end sub_807F748

	thumb_func_start sub_807F78C
sub_807F78C: @ 807F78C
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_805C780
	ldr r1, _0807F7C8 @ =gMain
	ldr r0, _0807F7CC @ =sub_807FB40
	str r0, [r1, 0x8]
	ldr r1, _0807F7D0 @ =gBattleTypeFlags
	movs r0, 0x80
	lsls r0, 3
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0807F7D4 @ =0x00000155
	bl sub_807F690
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x8
	bl IncrementGameStat
	pop {r0}
	bx r0
	.align 2, 0
_0807F7C8: .4byte gMain
_0807F7CC: .4byte sub_807FB40
_0807F7D0: .4byte gBattleTypeFlags
_0807F7D4: .4byte 0x00000155
	thumb_func_end sub_807F78C

	thumb_func_start sub_807F7D8
sub_807F7D8: @ 807F7D8
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_805C780
	ldr r1, _0807F804 @ =gMain
	ldr r0, _0807F808 @ =sub_80A0F4C
	str r0, [r1, 0x8]
	ldr r1, _0807F80C @ =gBattleTypeFlags
	movs r0, 0x80
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_807F690
	pop {r0}
	bx r0
	.align 2, 0
_0807F804: .4byte gMain
_0807F808: .4byte sub_80A0F4C
_0807F80C: .4byte gBattleTypeFlags
	thumb_func_end sub_807F7D8

	thumb_func_start sub_807F810
sub_807F810: @ 807F810
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_805C780
	ldr r1, _0807F854 @ =gMain
	ldr r0, _0807F858 @ =sub_807FB40
	str r0, [r1, 0x8]
	ldr r1, _0807F85C @ =gBattleTypeFlags
	movs r0, 0x80
	lsls r0, 8
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_807F690
	ldr r0, _0807F860 @ =gEnemyParty
	ldr r2, _0807F864 @ =gUnknown_841D148
	movs r1, 0x2
	bl SetMonData
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x8
	bl IncrementGameStat
	pop {r0}
	bx r0
	.align 2, 0
_0807F854: .4byte gMain
_0807F858: .4byte sub_807FB40
_0807F85C: .4byte gBattleTypeFlags
_0807F860: .4byte gEnemyParty
_0807F864: .4byte gUnknown_841D148
	thumb_func_end sub_807F810

	thumb_func_start sub_807F868
sub_807F868: @ 807F868
	push {lr}
	bl sub_807FF80
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_807F690
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x9
	bl IncrementGameStat
	pop {r0}
	bx r0
	thumb_func_end sub_807F868

	thumb_func_start sub_807F888
sub_807F888: @ 807F888
	push {lr}
	ldr r0, _0807F8B4 @ =gEnemyParty
	movs r1, 0xD
	movs r2, 0x5
	bl CreateMaleMon
	bl ScriptContext2_Enable
	ldr r1, _0807F8B8 @ =gMain
	ldr r0, _0807F8BC @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	str r0, [r1, 0x8]
	ldr r1, _0807F8C0 @ =gBattleTypeFlags
	movs r0, 0x80
	lsls r0, 2
	str r0, [r1]
	movs r0, 0x8
	movs r1, 0
	bl sub_807F690
	pop {r0}
	bx r0
	.align 2, 0
_0807F8B4: .4byte gEnemyParty
_0807F8B8: .4byte gMain
_0807F8BC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_0807F8C0: .4byte gBattleTypeFlags
	thumb_func_end sub_807F888

	thumb_func_start sub_807F8C4
sub_807F8C4: @ 807F8C4
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _0807F8F8 @ =gMain
	ldr r0, _0807F8FC @ =sub_807FBA0
	str r0, [r1, 0x8]
	ldr r1, _0807F900 @ =gBattleTypeFlags
	movs r0, 0x80
	lsls r0, 10
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_807F690
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x8
	bl IncrementGameStat
	pop {r0}
	bx r0
	.align 2, 0
_0807F8F8: .4byte gMain
_0807F8FC: .4byte sub_807FBA0
_0807F900: .4byte gBattleTypeFlags
	thumb_func_end sub_807F8C4

	thumb_func_start sub_807F904
sub_807F904: @ 807F904
	push {lr}
	sub sp, 0xC
	bl ScriptContext2_Enable
	ldr r1, _0807F944 @ =gMain
	ldr r0, _0807F948 @ =sub_807FBF0
	str r0, [r1, 0x8]
	ldr r0, _0807F94C @ =0x00000167
	movs r1, 0x1
	bl sub_8099F40
	lsls r0, 24
	cmp r0, 0
	beq _0807F958
	ldr r1, _0807F950 @ =gBattleTypeFlags
	movs r0, 0xA0
	lsls r0, 8
	str r0, [r1]
	ldr r0, _0807F954 @ =gEnemyParty
	movs r1, 0xFE
	str r1, [sp]
	movs r1, 0xC
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x69
	movs r2, 0x1E
	movs r3, 0x1F
	bl CreateMonWithGenderNatureLetter
	b _0807F960
	.align 2, 0
_0807F944: .4byte gMain
_0807F948: .4byte sub_807FBF0
_0807F94C: .4byte 0x00000167
_0807F950: .4byte gBattleTypeFlags
_0807F954: .4byte gEnemyParty
_0807F958:
	ldr r1, _0807F98C @ =gBattleTypeFlags
	movs r0, 0x80
	lsls r0, 8
	str r0, [r1]
_0807F960:
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_807F690
	ldr r0, _0807F990 @ =gEnemyParty
	ldr r2, _0807F994 @ =gUnknown_841D148
	movs r1, 0x2
	bl SetMonData
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x8
	bl IncrementGameStat
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0807F98C: .4byte gBattleTypeFlags
_0807F990: .4byte gEnemyParty
_0807F994: .4byte gUnknown_841D148
	thumb_func_end sub_807F904

	thumb_func_start sub_807F998
sub_807F998: @ 807F998
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _0807F9CC @ =gMain
	ldr r0, _0807F9D0 @ =sub_807FBA0
	str r0, [r1, 0x8]
	ldr r1, _0807F9D4 @ =gBattleTypeFlags
	movs r0, 0x80
	lsls r0, 6
	str r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_807F690
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x8
	bl IncrementGameStat
	pop {r0}
	bx r0
	.align 2, 0
_0807F9CC: .4byte gMain
_0807F9D0: .4byte sub_807FBA0
_0807F9D4: .4byte gBattleTypeFlags
	thumb_func_end sub_807F998

	thumb_func_start sub_807F9D8
sub_807F9D8: @ 807F9D8
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _0807FA0C @ =gMain
	ldr r0, _0807FA10 @ =sub_807FBA0
	str r0, [r1, 0x8]
	ldr r1, _0807FA14 @ =gBattleTypeFlags
	movs r0, 0x84
	lsls r0, 11
	str r0, [r1]
	ldr r0, _0807FA18 @ =gEnemyParty
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x96
	beq _0807FA2E
	cmp r0, 0x96
	bgt _0807FA1C
	cmp r0, 0x92
	bgt _0807FA4C
	cmp r0, 0x90
	blt _0807FA4C
	b _0807FA3C
	.align 2, 0
_0807FA0C: .4byte gMain
_0807FA10: .4byte sub_807FBA0
_0807FA14: .4byte gBattleTypeFlags
_0807FA18: .4byte gEnemyParty
_0807FA1C:
	cmp r1, 0xF9
	blt _0807FA4C
	cmp r1, 0xFA
	ble _0807FA3C
	movs r0, 0xCD
	lsls r0, 1
	cmp r1, r0
	beq _0807FA34
	b _0807FA4C
_0807FA2E:
	movs r1, 0xAA
	lsls r1, 1
	b _0807FA3E
_0807FA34:
	ldr r1, _0807FA38 @ =0x00000153
	b _0807FA3E
	.align 2, 0
_0807FA38: .4byte 0x00000153
_0807FA3C:
	ldr r1, _0807FA48 @ =0x00000155
_0807FA3E:
	movs r0, 0
	bl sub_807F690
	b _0807FA56
	.align 2, 0
_0807FA48: .4byte 0x00000155
_0807FA4C:
	movs r1, 0x85
	lsls r1, 1
	movs r0, 0
	bl sub_807F690
_0807FA56:
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x8
	bl IncrementGameStat
	pop {r0}
	bx r0
	thumb_func_end sub_807F9D8

	thumb_func_start sub_807FA68
sub_807FA68: @ 807FA68
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _0807FA90 @ =gMain
	ldr r0, _0807FA94 @ =sub_807FBA0
	str r0, [r1, 0x8]
	ldr r1, _0807FA98 @ =gBattleTypeFlags
	movs r0, 0xC0
	lsls r0, 6
	str r0, [r1]
	ldr r0, _0807FA9C @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0807FAA0
	movs r1, 0x85
	lsls r1, 1
	movs r0, 0xB
	bl sub_807F690
	b _0807FAAA
	.align 2, 0
_0807FA90: .4byte gMain
_0807FA94: .4byte sub_807FBA0
_0807FA98: .4byte gBattleTypeFlags
_0807FA9C: .4byte gGameVersion
_0807FAA0:
	movs r1, 0x85
	lsls r1, 1
	movs r0, 0xB
	bl sub_807F690
_0807FAAA:
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x8
	bl IncrementGameStat
	pop {r0}
	bx r0
	thumb_func_end sub_807FA68

	thumb_func_start sub_807FABC
sub_807FABC: @ 807FABC
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _0807FAEC @ =gMain
	ldr r0, _0807FAF0 @ =sub_807FBA0
	str r0, [r1, 0x8]
	ldr r1, _0807FAF4 @ =gBattleTypeFlags
	movs r0, 0xC0
	lsls r0, 7
	str r0, [r1]
	movs r1, 0x85
	lsls r1, 1
	movs r0, 0
	bl sub_807F690
	movs r0, 0x7
	bl IncrementGameStat
	movs r0, 0x8
	bl IncrementGameStat
	pop {r0}
	bx r0
	.align 2, 0
_0807FAEC: .4byte gMain
_0807FAF0: .4byte sub_807FBA0
_0807FAF4: .4byte gBattleTypeFlags
	thumb_func_end sub_807FABC

	thumb_func_start sub_807FAF8
sub_807FAF8: @ 807FAF8
	push {lr}
	bl LoadPlayerParty
	bl sub_807FB40
	pop {r0}
	bx r0
	thumb_func_end sub_807FAF8

	thumb_func_start sub_807FB08
sub_807FB08: @ 807FB08
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_805C780
	ldr r1, _0807FB38 @ =gMain
	ldr r0, _0807FB3C @ =sub_807FAF8
	str r0, [r1, 0x8]
	bl SavePlayerParty
	bl sub_8159F40
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_807F690
	pop {r0}
	bx r0
	.align 2, 0
_0807FB38: .4byte gMain
_0807FB3C: .4byte sub_807FAF8
	thumb_func_end sub_807FB08

	thumb_func_start sub_807FB40
sub_807FB40: @ 807FB40
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _0807FB74 @ =0x01000100
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _0807FB78 @ =gUnknown_2023E8A
	ldrb r0, [r0]
	bl IsPlayerDefeated
	cmp r0, 0x1
	bne _0807FB80
	ldr r0, _0807FB7C @ =c2_whiteout
	bl SetMainCallback2
	b _0807FB8C
	.align 2, 0
_0807FB74: .4byte 0x01000100
_0807FB78: .4byte gUnknown_2023E8A
_0807FB7C: .4byte c2_whiteout
_0807FB80:
	ldr r0, _0807FB94 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	ldr r1, _0807FB98 @ =gUnknown_3005020
	ldr r0, _0807FB9C @ =sub_807E3EC
	str r0, [r1]
_0807FB8C:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0807FB94: .4byte c2_exit_to_overworld_2_switch
_0807FB98: .4byte gUnknown_3005020
_0807FB9C: .4byte sub_807E3EC
	thumb_func_end sub_807FB40

	thumb_func_start sub_807FBA0
sub_807FBA0: @ 807FBA0
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _0807FBD4 @ =0x01000100
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _0807FBD8 @ =gUnknown_2023E8A
	ldrb r0, [r0]
	bl IsPlayerDefeated
	cmp r0, 0x1
	bne _0807FBE0
	ldr r0, _0807FBDC @ =c2_whiteout
	bl SetMainCallback2
	b _0807FBE6
	.align 2, 0
_0807FBD4: .4byte 0x01000100
_0807FBD8: .4byte gUnknown_2023E8A
_0807FBDC: .4byte c2_whiteout
_0807FBE0:
	ldr r0, _0807FBEC @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_0807FBE6:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0807FBEC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_807FBA0

	thumb_func_start sub_807FBF0
sub_807FBF0: @ 807FBF0
	push {r4,lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _0807FC24 @ =0x01000100
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r4, _0807FC28 @ =gUnknown_2023E8A
	ldrb r0, [r4]
	bl IsPlayerDefeated
	adds r1, r0, 0
	cmp r1, 0
	beq _0807FC30
	ldr r0, _0807FC2C @ =c2_whiteout
	bl SetMainCallback2
	b _0807FC4C
	.align 2, 0
_0807FC24: .4byte 0x01000100
_0807FC28: .4byte gUnknown_2023E8A
_0807FC2C: .4byte c2_whiteout
_0807FC30:
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _0807FC40
	ldr r0, _0807FC3C @ =gSpecialVar_Result
	strh r1, [r0]
	b _0807FC46
	.align 2, 0
_0807FC3C: .4byte gSpecialVar_Result
_0807FC40:
	ldr r1, _0807FC54 @ =gSpecialVar_Result
	movs r0, 0x1
	strh r0, [r1]
_0807FC46:
	ldr r0, _0807FC58 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_0807FC4C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC54: .4byte gSpecialVar_Result
_0807FC58: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_807FBF0

	thumb_func_start sub_807FC5C
sub_807FC5C: @ 807FC5C
	push {r4,r5,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsTallGrass_2
	lsls r0, 24
	cmp r0, 0
	beq _0807FC92
	movs r0, 0
	b _0807FD88
_0807FC92:
	adds r0, r4, 0
	bl MetatileBehavior_ReturnFalse_3
	lsls r0, 24
	cmp r0, 0
	beq _0807FCA2
	movs r0, 0x1
	b _0807FD88
_0807FCA2:
	adds r0, r4, 0
	bl MetatileBehavior_IsMB21OrWaterfallBottom
	lsls r0, 24
	cmp r0, 0
	beq _0807FCB2
	movs r0, 0x2
	b _0807FD88
_0807FCB2:
	ldr r0, _0807FCC8 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	subs r0, 0x1
	cmp r0, 0x8
	bhi _0807FD2C
	lsls r0, 2
	ldr r1, _0807FCCC @ =_0807FCD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807FCC8: .4byte gMapHeader
_0807FCCC: .4byte _0807FCD0
	.align 2, 0
_0807FCD0:
	.4byte _0807FD2C
	.4byte _0807FD2C
	.4byte _0807FD2C
	.4byte _0807FCF4
	.4byte _0807FD18
	.4byte _0807FD1C
	.4byte _0807FD2C
	.4byte _0807FD04
	.4byte _0807FD04
_0807FCF4:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsMB0B
	lsls r0, 24
	cmp r0, 0
	beq _0807FD08
_0807FD04:
	movs r0, 0x8
	b _0807FD88
_0807FD08:
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	cmp r0, 0
	bne _0807FD70
	movs r0, 0x7
	b _0807FD88
_0807FD18:
	movs r0, 0x3
	b _0807FD88
_0807FD1C:
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	cmp r0, 0
	bne _0807FD82
	b _0807FD86
_0807FD2C:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsDeepSemiDeepOrSplashingWater
	lsls r0, 24
	cmp r0, 0
	bne _0807FD82
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	cmp r0, 0
	bne _0807FD70
	adds r0, r4, 0
	bl MetatileBehavior_IsMB0C
	lsls r0, 24
	cmp r0, 0
	beq _0807FD58
	movs r0, 0x6
	b _0807FD88
_0807FD58:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0807FD86
	adds r0, r4, 0
	bl MetatileBehavior_ReturnFalse_7
	lsls r0, 24
	cmp r0, 0
	beq _0807FD74
_0807FD70:
	movs r0, 0x5
	b _0807FD88
_0807FD74:
	adds r0, r4, 0
	bl MetatileBehavior_ReturnFalse_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807FD86
_0807FD82:
	movs r0, 0x4
	b _0807FD88
_0807FD86:
	movs r0, 0x9
_0807FD88:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807FC5C

	thumb_func_start GetBattleTransitionTypeByMap
GetBattleTransitionTypeByMap: @ 807FD90
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	cmp r0, 0
	beq _0807FDC0
	movs r0, 0x2
	b _0807FDEA
_0807FDC0:
	lsls r0, r4, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	cmp r0, 0
	bne _0807FDE8
	ldr r0, _0807FDE0 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x4
	beq _0807FDE4
	cmp r0, 0x5
	beq _0807FDE8
	movs r0, 0
	b _0807FDEA
	.align 2, 0
_0807FDE0: .4byte gMapHeader
_0807FDE4:
	movs r0, 0x1
	b _0807FDEA
_0807FDE8:
	movs r0, 0x3
_0807FDEA:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBattleTransitionTypeByMap

	thumb_func_start GetSumOfPlayerPartyLevel
GetSumOfPlayerPartyLevel: @ 807FDF4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	movs r6, 0
_0807FDFE:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _0807FE50 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _0807FE42
	cmp r1, 0
	beq _0807FE42
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0807FE42
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	adds r0, r7, r0
	lsls r0, 24
	lsrs r7, r0, 24
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _0807FE48
_0807FE42:
	adds r6, 0x1
	cmp r6, 0x5
	ble _0807FDFE
_0807FE48:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807FE50: .4byte gPlayerParty
	thumb_func_end GetSumOfPlayerPartyLevel

	thumb_func_start reads_trainer_data_byte0
reads_trainer_data_byte0: @ 807FE54
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r5, _0807FE88 @ =gTrainers
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r5
	adds r0, r2, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r4
	bcs _0807FE74
	adds r4, r0, 0
_0807FE74:
	movs r3, 0
	ldrb r0, [r2]
	cmp r0, 0x1
	beq _0807FEBC
	cmp r0, 0x1
	bgt _0807FE8C
	cmp r0, 0
	beq _0807FE96
	b _0807FF2C
	.align 2, 0
_0807FE88: .4byte gTrainers
_0807FE8C:
	cmp r0, 0x2
	beq _0807FEE2
	cmp r0, 0x3
	beq _0807FF08
	b _0807FF2C
_0807FE96:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0807FF2C
_0807FEA4:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _0807FEA4
	b _0807FF2C
_0807FEBC:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0807FF2C
_0807FECA:
	lsls r0, r2, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _0807FECA
	b _0807FF2C
_0807FEE2:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0807FF2C
_0807FEF0:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _0807FEF0
	b _0807FF2C
_0807FF08:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0807FF2C
_0807FF16:
	lsls r0, r2, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _0807FF16
_0807FF2C:
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end reads_trainer_data_byte0

	thumb_func_start GetWildBattleTransition
GetWildBattleTransition: @ 807FF34
	push {r4,r5,lr}
	bl GetBattleTransitionTypeByMap
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0807FF64 @ =gEnemyParty
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetSumOfPlayerPartyLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0807FF6C
	ldr r0, _0807FF68 @ =gUnknown_83C68F0
	lsls r1, r5, 1
	adds r0, 0x1
	b _0807FF70
	.align 2, 0
_0807FF64: .4byte gEnemyParty
_0807FF68: .4byte gUnknown_83C68F0
_0807FF6C:
	ldr r0, _0807FF7C @ =gUnknown_83C68F0
	lsls r1, r5, 1
_0807FF70:
	adds r1, r0
	ldrb r0, [r1]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807FF7C: .4byte gUnknown_83C68F0
	thumb_func_end GetWildBattleTransition

	thumb_func_start sub_807FF80
sub_807FF80: @ 807FF80
	push {r4-r6,lr}
	ldr r4, _0807FFB4 @ =gTrainerBattleOpponent_A
	ldrh r1, [r4]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0808000C
	ldr r1, _0807FFB8 @ =gTrainers
	ldrh r2, [r4]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x1]
	cmp r1, 0x57
	bne _08080008
	adds r1, r2, 0
	movs r0, 0xCD
	lsls r0, 1
	cmp r1, r0
	beq _0807FFB0
	ldr r0, _0807FFBC @ =0x000002df
	cmp r1, r0
	bne _0807FFC0
_0807FFB0:
	movs r0, 0xC
	b _08080054
	.align 2, 0
_0807FFB4: .4byte gTrainerBattleOpponent_A
_0807FFB8: .4byte gTrainers
_0807FFBC: .4byte 0x000002df
_0807FFC0:
	ldr r0, _0807FFD4 @ =0x0000019b
	cmp r1, r0
	beq _0807FFCE
	movs r0, 0xB8
	lsls r0, 2
	cmp r1, r0
	bne _0807FFD8
_0807FFCE:
	movs r0, 0xD
	b _08080054
	.align 2, 0
_0807FFD4: .4byte 0x0000019b
_0807FFD8:
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _0807FFE6
	ldr r0, _0807FFEC @ =0x000002e1
	cmp r1, r0
	bne _0807FFF0
_0807FFE6:
	movs r0, 0xE
	b _08080054
	.align 2, 0
_0807FFEC: .4byte 0x000002e1
_0807FFF0:
	ldr r0, _08080000 @ =0x0000019d
	cmp r1, r0
	beq _0807FFFC
	ldr r0, _08080004 @ =0x000002e2
	cmp r1, r0
	bne _0808000C
_0807FFFC:
	movs r0, 0xF
	b _08080054
	.align 2, 0
_08080000: .4byte 0x0000019d
_08080004: .4byte 0x000002e2
_08080008:
	cmp r1, 0x5A
	bne _08080010
_0808000C:
	movs r0, 0x10
	b _08080054
_08080010:
	ldrb r0, [r0, 0x18]
	movs r5, 0x1
	cmp r0, 0x1
	bne _0808001A
	movs r5, 0x2
_0808001A:
	bl GetBattleTransitionTypeByMap
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4]
	adds r1, r5, 0
	bl reads_trainer_data_byte0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl GetSumOfPlayerPartyLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0808004C
	ldr r0, _08080048 @ =gUnknown_83C68F8
	lsls r1, r6, 1
	adds r0, 0x1
	b _08080050
	.align 2, 0
_08080048: .4byte gUnknown_83C68F8
_0808004C:
	ldr r0, _0808005C @ =gUnknown_83C68F8
	lsls r1, r6, 1
_08080050:
	adds r1, r0
	ldrb r0, [r1]
_08080054:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808005C: .4byte gUnknown_83C68F8
	thumb_func_end sub_807FF80

	thumb_func_start sub_8080060
sub_8080060: @ 8080060
	push {r4,lr}
	ldr r0, _08080084 @ =gEnemyParty
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetSumOfPlayerPartyLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08080088
	movs r0, 0x3
	b _0808008A
	.align 2, 0
_08080084: .4byte gEnemyParty
_08080088:
	movs r0, 0x4
_0808008A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8080060

	thumb_func_start TrainerBattleLoadArg32
TrainerBattleLoadArg32: @ 8080090
	adds r2, r0, 0
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	orrs r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	orrs r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg32

	thumb_func_start TrainerBattleLoadArg16
TrainerBattleLoadArg16: @ 80800A8
	adds r1, r0, 0
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg16

	thumb_func_start TrainerBattleLoadArg8
TrainerBattleLoadArg8: @ 80800B4
	ldrb r0, [r0]
	bx lr
	thumb_func_end TrainerBattleLoadArg8

	thumb_func_start trainerflag_opponent
trainerflag_opponent: @ 80800B8
	ldr r1, _080800CC @ =gTrainerBattleOpponent_A
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_080800CC: .4byte gTrainerBattleOpponent_A
	thumb_func_end trainerflag_opponent

	thumb_func_start IsPlayerDefeated
IsPlayerDefeated: @ 80800D0
	push {lr}
	subs r0, 0x1
	cmp r0, 0x6
	bhi _08080108
	lsls r0, 2
	ldr r1, _080800E4 @ =_080800E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080800E4: .4byte _080800E8
	.align 2, 0
_080800E8:
	.4byte _08080108
	.4byte _08080104
	.4byte _08080104
	.4byte _08080108
	.4byte _08080108
	.4byte _08080108
	.4byte _08080108
_08080104:
	movs r0, 0x1
	b _0808010A
_08080108:
	movs r0, 0
_0808010A:
	pop {r1}
	bx r1
	thumb_func_end IsPlayerDefeated

	thumb_func_start sub_8080110
sub_8080110: @ 8080110
	ldr r0, _08080140 @ =gUnknown_20386AC
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08080144 @ =gTrainerBattleOpponent_A
	strh r1, [r0]
	ldr r0, _08080148 @ =gUnknown_20386B0
	strh r1, [r0]
	ldr r0, _0808014C @ =gUnknown_20386B4
	movs r1, 0
	str r1, [r0]
	ldr r0, _08080150 @ =gUnknown_20386B8
	str r1, [r0]
	ldr r0, _08080154 @ =gUnknown_20386BC
	str r1, [r0]
	ldr r0, _08080158 @ =gUnknown_20386C0
	str r1, [r0]
	ldr r0, _0808015C @ =gUnknown_20386C4
	str r1, [r0]
	ldr r0, _08080160 @ =gUnknown_20386C8
	str r1, [r0]
	ldr r0, _08080164 @ =gUnknown_20386CC
	strh r1, [r0]
	bx lr
	.align 2, 0
_08080140: .4byte gUnknown_20386AC
_08080144: .4byte gTrainerBattleOpponent_A
_08080148: .4byte gUnknown_20386B0
_0808014C: .4byte gUnknown_20386B4
_08080150: .4byte gUnknown_20386B8
_08080154: .4byte gUnknown_20386BC
_08080158: .4byte gUnknown_20386C0
_0808015C: .4byte gUnknown_20386C4
_08080160: .4byte gUnknown_20386C8
_08080164: .4byte gUnknown_20386CC
	thumb_func_end sub_8080110

	thumb_func_start TrainerBattleLoadArgs
TrainerBattleLoadArgs: @ 8080168
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
_0808016E:
	ldrb r0, [r4, 0x4]
	cmp r0, 0x6
	bhi _080801E0
	lsls r0, 2
	ldr r1, _08080180 @ =_08080184
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080180: .4byte _08080184
	.align 2, 0
_08080184:
	.4byte _080801A0
	.4byte _080801AE
	.4byte _080801BC
	.4byte _080801CA
	.4byte _080801D2
	.4byte _080801DA
	.4byte _080801E4
_080801A0:
	adds r0, r5, 0
	bl TrainerBattleLoadArg8
	ldr r1, [r4]
	strb r0, [r1]
	adds r5, 0x1
	b _080801E0
_080801AE:
	adds r0, r5, 0
	bl TrainerBattleLoadArg16
	ldr r1, [r4]
	strh r0, [r1]
	adds r5, 0x2
	b _080801E0
_080801BC:
	adds r0, r5, 0
	bl TrainerBattleLoadArg32
	ldr r1, [r4]
	str r0, [r1]
	adds r5, 0x4
	b _080801E0
_080801CA:
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1]
	b _080801E0
_080801D2:
	ldr r1, [r4]
	movs r0, 0
	strh r0, [r1]
	b _080801E0
_080801DA:
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1]
_080801E0:
	adds r4, 0x8
	b _0808016E
_080801E4:
	ldr r0, [r4]
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end TrainerBattleLoadArgs

	thumb_func_start battle_80801F0
battle_80801F0: @ 80801F0
	push {lr}
	ldr r0, _08080218 @ =gUnknown_20386B0
	ldrh r1, [r0]
	cmp r1, 0
	beq _08080212
	ldr r0, _0808021C @ =gSpecialVar_LastTalked
	strh r1, [r0]
	lsls r0, r1, 24
	lsrs r0, 24
	ldr r1, _08080220 @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl GetFieldObjectIdByLocalIdAndMap
	ldr r1, _08080224 @ =gUnknown_3005074
	strb r0, [r1]
_08080212:
	pop {r0}
	bx r0
	.align 2, 0
_08080218: .4byte gUnknown_20386B0
_0808021C: .4byte gSpecialVar_LastTalked
_08080220: .4byte gSaveBlock1Ptr
_08080224: .4byte gUnknown_3005074
	thumb_func_end battle_80801F0

	thumb_func_start sub_8080228
sub_8080228: @ 8080228
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8080110
	ldr r4, _08080250 @ =gUnknown_20386AC
	adds r0, r5, 0
	bl TrainerBattleLoadArg8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldrh r0, [r4]
	subs r0, 0x1
	cmp r0, 0x8
	bhi _08080318
	lsls r0, 2
	ldr r1, _08080254 @ =_08080258
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080250: .4byte gUnknown_20386AC
_08080254: .4byte _08080258
	.align 2, 0
_08080258:
	.4byte _0808028C
	.4byte _0808028C
	.4byte _0808027C
	.4byte _08080284
	.4byte _080802D8
	.4byte _08080294
	.4byte _080802AC
	.4byte _08080294
	.4byte _08080304
_0808027C:
	ldr r0, _08080280 @ =gUnknown_83C69D8
	b _08080306
	.align 2, 0
_08080280: .4byte gUnknown_83C69D8
_08080284:
	ldr r0, _08080288 @ =gUnknown_83C6990
	b _08080296
	.align 2, 0
_08080288: .4byte gUnknown_83C6990
_0808028C:
	ldr r0, _08080290 @ =gUnknown_83C6948
	b _0808031A
	.align 2, 0
_08080290: .4byte gUnknown_83C6948
_08080294:
	ldr r0, _080802A4 @ =gUnknown_83C6A68
_08080296:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _080802A8 @ =gUnknown_81A4EE9
	b _08080326
	.align 2, 0
_080802A4: .4byte gUnknown_83C6A68
_080802A8: .4byte gUnknown_81A4EE9
_080802AC:
	bl sub_811231C
	ldr r0, _080802CC @ =gUnknown_83C6990
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _080802D0 @ =gTrainerBattleOpponent_A
	ldrh r0, [r4]
	bl sub_810CE64
	strh r0, [r4]
	ldr r0, _080802D4 @ =gUnknown_81A4F73
	b _08080326
	.align 2, 0
_080802CC: .4byte gUnknown_83C6990
_080802D0: .4byte gTrainerBattleOpponent_A
_080802D4: .4byte gUnknown_81A4F73
_080802D8:
	bl sub_811231C
	ldr r0, _080802F8 @ =gUnknown_83C6900
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _080802FC @ =gTrainerBattleOpponent_A
	ldrh r0, [r4]
	bl sub_810CE64
	strh r0, [r4]
	ldr r0, _08080300 @ =gUnknown_81A4F3E
	b _08080326
	.align 2, 0
_080802F8: .4byte gUnknown_83C6900
_080802FC: .4byte gTrainerBattleOpponent_A
_08080300: .4byte gUnknown_81A4F3E
_08080304:
	ldr r0, _08080310 @ =gUnknown_83C6A20
_08080306:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	ldr r0, _08080314 @ =gUnknown_81A4F21
	b _08080326
	.align 2, 0
_08080310: .4byte gUnknown_83C6A20
_08080314: .4byte gUnknown_81A4F21
_08080318:
	ldr r0, _0808032C @ =gUnknown_83C6900
_0808031A:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _08080330 @ =gUnknown_81A4EC1
_08080326:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808032C: .4byte gUnknown_83C6900
_08080330: .4byte gUnknown_81A4EC1
	thumb_func_end sub_8080228

	thumb_func_start TrainerWantsBattle
TrainerWantsBattle: @ 8080334
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08080368 @ =gUnknown_3005074
	strb r0, [r2]
	ldr r4, _0808036C @ =gSpecialVar_LastTalked
	ldr r3, _08080370 @ =gMapObjects
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r0, [r2, 0x8]
	strh r0, [r4]
	adds r1, 0x1
	adds r0, r1, 0
	bl sub_8080228
	ldr r0, _08080374 @ =gUnknown_81A4EB4
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080368: .4byte gUnknown_3005074
_0808036C: .4byte gSpecialVar_LastTalked
_08080370: .4byte gMapObjects
_08080374: .4byte gUnknown_81A4EB4
	thumb_func_end TrainerWantsBattle

	thumb_func_start GetTrainerFlagFromScriptPointer
GetTrainerFlagFromScriptPointer: @ 8080378
	push {lr}
	adds r0, 0x2
	bl TrainerBattleLoadArg16
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetTrainerFlagFromScriptPointer

	thumb_func_start sub_8080398
sub_8080398: @ 8080398
	push {r4,lr}
	ldr r0, _080803C4 @ =gUnknown_3005074
	ldrb r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080803C8 @ =gMapObjects
	adds r4, r0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080803C4: .4byte gUnknown_3005074
_080803C8: .4byte gMapObjects
	thumb_func_end sub_8080398

	thumb_func_start sub_80803CC
sub_80803CC: @ 80803CC
	ldr r0, _080803D4 @ =gUnknown_20386AC
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080803D4: .4byte gUnknown_20386AC
	thumb_func_end sub_80803CC

	thumb_func_start sub_80803D8
sub_80803D8: @ 80803D8
	ldr r0, _080803E0 @ =gUnknown_20386CC
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080803E0: .4byte gUnknown_20386CC
	thumb_func_end sub_80803D8

	thumb_func_start ScrSpecial_HasTrainerBeenFought
ScrSpecial_HasTrainerBeenFought: @ 80803E4
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end ScrSpecial_HasTrainerBeenFought

	thumb_func_start sub_80803FC
sub_80803FC: @ 80803FC
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end sub_80803FC

	thumb_func_start sub_8080410
sub_8080410: @ 8080410
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end sub_8080410

	thumb_func_start HasTrainerAlreadyBeenFought
HasTrainerAlreadyBeenFought: @ 8080424
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end HasTrainerAlreadyBeenFought

	thumb_func_start trainer_flag_set
trainer_flag_set: @ 808043C
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end trainer_flag_set

	thumb_func_start trainer_flag_clear
trainer_flag_clear: @ 8080450
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagClear
	pop {r0}
	bx r0
	thumb_func_end trainer_flag_clear

	thumb_func_start sub_8080464
sub_8080464: @ 8080464
	push {r4,lr}
	ldr r4, _080804A0 @ =gBattleTypeFlags
	movs r0, 0x8
	str r0, [r4]
	bl sub_80803CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bne _0808048C
	bl sub_80803D8
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	beq _0808048C
	ldr r0, [r4]
	movs r1, 0x10
	orrs r0, r1
	str r0, [r4]
_0808048C:
	ldr r1, _080804A4 @ =gMain
	ldr r0, _080804A8 @ =sub_80804AC
	str r0, [r1, 0x8]
	bl sub_807F868
	bl ScriptContext1_Stop
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080804A0: .4byte gBattleTypeFlags
_080804A4: .4byte gMain
_080804A8: .4byte sub_80804AC
	thumb_func_end sub_8080464

	thumb_func_start sub_80804AC
sub_80804AC: @ 80804AC
	push {lr}
	ldr r0, _080804D8 @ =gUnknown_20386AC
	ldrh r0, [r0]
	cmp r0, 0x9
	bne _08080508
	ldr r0, _080804DC @ =gUnknown_2023E8A
	ldrb r0, [r0]
	bl IsPlayerDefeated
	adds r1, r0, 0
	cmp r1, 0x1
	bne _080804E8
	ldr r0, _080804E0 @ =gSpecialVar_Result
	strh r1, [r0]
	ldr r0, _080804E4 @ =gUnknown_20386CC
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08080530
	bl sp000_heal_pokemon
	b _080804EE
	.align 2, 0
_080804D8: .4byte gUnknown_20386AC
_080804DC: .4byte gUnknown_2023E8A
_080804E0: .4byte gSpecialVar_Result
_080804E4: .4byte gUnknown_20386CC
_080804E8:
	ldr r0, _08080500 @ =gSpecialVar_Result
	movs r1, 0
	strh r1, [r0]
_080804EE:
	ldr r0, _08080504 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	bl sub_80803FC
	bl sub_81139BC
	b _0808054E
	.align 2, 0
_08080500: .4byte gSpecialVar_Result
_08080504: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08080508:
	ldr r0, _0808051C @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08080524
	ldr r0, _08080520 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	b _0808054E
	.align 2, 0
_0808051C: .4byte gTrainerBattleOpponent_A
_08080520: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08080524:
	ldr r0, _08080538 @ =gUnknown_2023E8A
	ldrb r0, [r0]
	bl IsPlayerDefeated
	cmp r0, 0x1
	bne _08080540
_08080530:
	ldr r0, _0808053C @ =c2_whiteout
	bl SetMainCallback2
	b _0808054E
	.align 2, 0
_08080538: .4byte gUnknown_2023E8A
_0808053C: .4byte c2_whiteout
_08080540:
	ldr r0, _08080554 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	bl sub_80803FC
	bl sub_81139BC
_0808054E:
	pop {r0}
	bx r0
	.align 2, 0
_08080554: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80804AC

	thumb_func_start sub_8080558
sub_8080558: @ 8080558
	push {lr}
	ldr r0, _08080570 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08080578
	ldr r0, _08080574 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	b _080805A6
	.align 2, 0
_08080570: .4byte gTrainerBattleOpponent_A
_08080574: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08080578:
	ldr r0, _0808058C @ =gUnknown_2023E8A
	ldrb r0, [r0]
	bl IsPlayerDefeated
	cmp r0, 0x1
	bne _08080594
	ldr r0, _08080590 @ =c2_whiteout
	bl SetMainCallback2
	b _080805A6
	.align 2, 0
_0808058C: .4byte gUnknown_2023E8A
_08080590: .4byte c2_whiteout
_08080594:
	ldr r0, _080805AC @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	bl sub_80803FC
	bl sub_810CDE8
	bl sub_81138F8
_080805A6:
	pop {r0}
	bx r0
	.align 2, 0
_080805AC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8080558

	thumb_func_start sub_80805B0
sub_80805B0: @ 80805B0
	push {lr}
	ldr r1, _080805CC @ =gBattleTypeFlags
	movs r0, 0x8
	str r0, [r1]
	ldr r1, _080805D0 @ =gMain
	ldr r0, _080805D4 @ =sub_8080558
	str r0, [r1, 0x8]
	bl sub_807F868
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080805CC: .4byte gBattleTypeFlags
_080805D0: .4byte gMain
_080805D4: .4byte sub_8080558
	thumb_func_end sub_80805B0

	thumb_func_start sub_80805D8
sub_80805D8: @ 80805D8
	push {lr}
	bl sub_80806D8
	bl ShowFieldMessage
	pop {r0}
	bx r0
	thumb_func_end sub_80805D8

	thumb_func_start sub_80805E8
sub_80805E8: @ 80805E8
	push {lr}
	ldr r0, _080805F8 @ =gUnknown_20386C4
	ldr r0, [r0]
	cmp r0, 0
	bne _080805F4
	ldr r0, _080805FC @ =gUnknown_81C555B
_080805F4:
	pop {r1}
	bx r1
	.align 2, 0
_080805F8: .4byte gUnknown_20386C4
_080805FC: .4byte gUnknown_81C555B
	thumb_func_end sub_80805E8

	thumb_func_start sub_8080600
sub_8080600: @ 8080600
	push {lr}
	ldr r0, _08080610 @ =gUnknown_20386C8
	ldr r0, [r0]
	cmp r0, 0
	bne _0808060C
	ldr r0, _08080614 @ =gUnknown_81C555B
_0808060C:
	pop {r1}
	bx r1
	.align 2, 0
_08080610: .4byte gUnknown_20386C8
_08080614: .4byte gUnknown_81C555B
	thumb_func_end sub_8080600

	thumb_func_start sub_8080618
sub_8080618: @ 8080618
	push {lr}
	bl sub_8080734
	bl ShowFieldMessage
	pop {r0}
	bx r0
	thumb_func_end sub_8080618

	thumb_func_start sub_8080628
sub_8080628: @ 8080628
	push {lr}
	ldr r0, _08080660 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080806BE
	ldr r0, _08080664 @ =gUnknown_20386AC
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080806BE
	cmp r0, 0x8
	beq _080806BE
	ldr r0, _08080668 @ =gTrainerBattleOpponent_A
	ldrh r0, [r0]
	bl sub_804367C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bhi _080806B8
	lsls r0, 2
	ldr r1, _0808066C @ =_08080670
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080660: .4byte gUnknown_203ADFA
_08080664: .4byte gUnknown_20386AC
_08080668: .4byte gTrainerBattleOpponent_A
_0808066C: .4byte _08080670
	.align 2, 0
_08080670:
	.4byte _080806AE
	.4byte _080806A8
	.4byte _080806A8
	.4byte _080806B8
	.4byte _080806AE
	.4byte _080806AE
	.4byte _080806B8
	.4byte _080806B8
	.4byte _080806AE
	.4byte _080806A8
	.4byte _080806AE
	.4byte _080806AE
	.4byte _080806AE
	.4byte _080806AE
_080806A8:
	movs r0, 0x8E
	lsls r0, 1
	b _080806BA
_080806AE:
	ldr r0, _080806B4 @ =0x0000011d
	b _080806BA
	.align 2, 0
_080806B4: .4byte 0x0000011d
_080806B8:
	ldr r0, _080806C4 @ =0x0000011b
_080806BA:
	bl PlayNewMapMusic
_080806BE:
	pop {r0}
	bx r0
	.align 2, 0
_080806C4: .4byte 0x0000011b
	thumb_func_end sub_8080628

	thumb_func_start sub_80806C8
sub_80806C8: @ 80806C8
	push {lr}
	cmp r0, 0
	bne _080806D0
	ldr r0, _080806D4 @ =gUnknown_84161CD
_080806D0:
	pop {r1}
	bx r1
	.align 2, 0
_080806D4: .4byte gUnknown_84161CD
	thumb_func_end sub_80806C8

	thumb_func_start sub_80806D8
sub_80806D8: @ 80806D8
	push {lr}
	ldr r0, _080806E8 @ =gUnknown_20386B4
	ldr r0, [r0]
	bl sub_80806C8
	pop {r1}
	bx r1
	.align 2, 0
_080806E8: .4byte gUnknown_20386B4
	thumb_func_end sub_80806D8

	thumb_func_start sub_80806EC
sub_80806EC: @ 80806EC
	push {r4,lr}
	ldr r0, _08080708 @ =gUnknown_20386B8
	ldr r0, [r0]
	ldr r4, _0808070C @ =gStringVar4
	bl sub_80806C8
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08080708: .4byte gUnknown_20386B8
_0808070C: .4byte gStringVar4
	thumb_func_end sub_80806EC

	thumb_func_start sub_8080710
sub_8080710: @ 8080710
	push {r4,lr}
	ldr r4, _0808072C @ =gStringVar4
	ldr r0, _08080730 @ =gUnknown_20386BC
	ldr r0, [r0]
	bl sub_80806C8
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808072C: .4byte gStringVar4
_08080730: .4byte gUnknown_20386BC
	thumb_func_end sub_8080710

	thumb_func_start sub_8080734
sub_8080734: @ 8080734
	push {lr}
	ldr r0, _08080744 @ =gUnknown_20386C0
	ldr r0, [r0]
	bl sub_80806C8
	pop {r1}
	bx r1
	.align 2, 0
_08080744: .4byte gUnknown_20386C0
	thumb_func_end sub_8080734

	.align 2, 0 @ Don't pad with nop.
