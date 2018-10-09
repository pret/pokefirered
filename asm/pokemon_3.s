	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8043B48
sub_8043B48: @ 8043B48
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	str r3, [sp]
	ldr r2, _08043B88 @ =gExperienceTables
	ldr r3, _08043B8C @ =gBaseStats
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	movs r1, 0xC8
	lsls r1, 1
	adds r2, r1
	adds r0, r2
	ldr r1, [r0]
	ldr r0, [sp]
	cmp r0, r1
	bls _08043B80
	str r1, [sp]
	adds r0, r4, 0
	movs r1, 0x19
	mov r2, sp
	bl SetMonData
_08043B80:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043B88: .4byte gExperienceTables
_08043B8C: .4byte gBaseStats
	thumb_func_end sub_8043B48

	thumb_func_start sub_8043B90
sub_8043B90: @ 8043B90
	push {r4-r7,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r7, r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x19
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	cmp r7, 0x63
	bhi _08043C14
	ldr r3, _08043C0C @ =gExperienceTables
	mov r0, sp
	ldrb r1, [r0]
	lsls r1, 2
	ldr r2, _08043C10 @ =gBaseStats
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r3
	ldr r0, [r1]
	cmp r5, r0
	bls _08043C20
	adds r0, r4, 0
	movs r1, 0x38
	mov r2, sp
	bl SetMonData
	mov r0, sp
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r3, r5, 0
	bl sub_8043B48
	movs r0, 0x1
	b _08043C22
	.align 2, 0
_08043C0C: .4byte gExperienceTables
_08043C10: .4byte gBaseStats
_08043C14:
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r7, 0
	adds r3, r5, 0
	bl sub_8043B48
_08043C20:
	movs r0, 0
_08043C22:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8043B90

	thumb_func_start CanMonLearnTMHM
CanMonLearnTMHM: @ 8043C2C
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	adds r3, r1, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _08043C4E
	movs r0, 0
	b _08043C7A
_08043C4E:
	cmp r4, 0x1F
	bls _08043C6C
	adds r0, r4, 0
	subs r0, 0x20
	movs r2, 0x1
	lsls r2, r0
	ldr r0, _08043C68 @ =gUnknown_8252BC8
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	ands r0, r2
	b _08043C7A
	.align 2, 0
_08043C68: .4byte gUnknown_8252BC8
_08043C6C:
	movs r1, 0x1
	lsls r1, r5
	ldr r2, _08043C80 @ =gUnknown_8252BC8
	lsls r0, r3, 3
	adds r0, r2
	ldr r0, [r0]
	ands r0, r1
_08043C7A:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08043C80: .4byte gUnknown_8252BC8
	thumb_func_end CanMonLearnTMHM

	thumb_func_start GetMoveRelearnerMoves
GetMoveRelearnerMoves: @ 8043C84
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r6, r0, 0
	str r1, [sp, 0x8]
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	movs r5, 0
	mov r4, sp
_08043CBA:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08043CBA
	movs r5, 0
	ldr r6, _08043DC8 @ =gLevelUpLearnsets
	lsls r1, r7, 2
	adds r2, r1, r6
	ldr r3, [r2]
	ldrh r0, [r3]
	ldr r4, _08043DCC @ =0x0000ffff
	str r1, [sp, 0x14]
	cmp r0, r4
	beq _08043DB4
	mov r9, r2
	str r3, [sp, 0x10]
_08043CE8:
	lsls r2, r5, 1
	ldr r1, [sp, 0x10]
	adds r0, r2, r1
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0xC]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _08043D9E
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _08043DD0 @ =0x000001ff
	ands r0, r3
	cmp r1, r0
	beq _08043D38
	ldr r0, [sp, 0x14]
	ldr r1, _08043DC8 @ =gLevelUpLearnsets
	adds r6, r0, r1
	ldr r2, _08043DD0 @ =0x000001ff
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_08043D20:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08043D38
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08043D20
_08043D38:
	cmp r4, 0x4
	bne _08043D9E
	movs r4, 0
	cmp r4, r10
	bge _08043D7C
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x8]
	ldrh r2, [r0]
	ldr r0, _08043DD0 @ =0x000001ff
	ands r0, r1
	cmp r2, r0
	beq _08043D7C
	ldr r1, [sp, 0x14]
	ldr r2, _08043DC8 @ =gLevelUpLearnsets
	adds r6, r1, r2
	ldr r0, _08043DD0 @ =0x000001ff
	mov r8, r0
	ldr r3, [sp, 0x8]
	adds r5, r7, 0
_08043D64:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _08043D7C
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08043D64
_08043D7C:
	cmp r4, r10
	bne _08043D9E
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r1, [sp, 0x8]
	adds r2, r1
	mov r4, r9
	ldr r0, [r4]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _08043DD0 @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
_08043D9E:
	mov r5, r12
	cmp r5, 0x13
	bgt _08043DB4
	mov r1, r9
	ldr r0, [r1]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r2, _08043DCC @ =0x0000ffff
	cmp r0, r2
	bne _08043CE8
_08043DB4:
	mov r0, r10
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043DC8: .4byte gLevelUpLearnsets
_08043DCC: .4byte 0x0000ffff
_08043DD0: .4byte 0x000001ff
	thumb_func_end GetMoveRelearnerMoves

	thumb_func_start GetLevelUpMovesBySpecies
GetLevelUpMovesBySpecies: @ 8043DD4
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 16
	movs r5, 0
	movs r4, 0
	ldr r1, _08043E20 @ =gLevelUpLearnsets
	lsrs r0, 14
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2]
	ldr r1, _08043E24 @ =0x0000ffff
	cmp r0, r1
	beq _08043E18
	ldr r0, _08043E28 @ =0x000001ff
	mov r12, r0
	adds r7, r1, 0
	adds r3, r2, 0
_08043DF6:
	adds r1, r5, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 1
	adds r1, r6
	ldrh r2, [r3]
	mov r0, r12
	ands r0, r2
	strh r0, [r1]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x13
	bgt _08043E18
	ldrh r0, [r3]
	cmp r0, r7
	bne _08043DF6
_08043E18:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043E20: .4byte gLevelUpLearnsets
_08043E24: .4byte 0x0000ffff
_08043E28: .4byte 0x000001ff
	thumb_func_end GetLevelUpMovesBySpecies

	thumb_func_start GetNumberOfRelearnableMoves
GetNumberOfRelearnableMoves: @ 8043E2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	adds r6, r0, 0
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x30]
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bne _08043E68
	movs r0, 0
	b _08043F72
_08043E68:
	movs r5, 0
	lsls r4, 2
	str r4, [sp, 0x38]
	mov r4, sp
_08043E70:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08043E70
	movs r5, 0
	ldr r3, _08043F84 @ =gLevelUpLearnsets
	ldr r2, [sp, 0x38]
	adds r1, r2, r3
	ldr r0, [r1]
	ldrh r0, [r0]
	ldr r2, _08043F88 @ =0x0000ffff
	cmp r0, r2
	beq _08043F70
	mov r9, r1
	mov r4, sp
	adds r4, 0x8
	str r4, [sp, 0x34]
_08043EA0:
	mov r1, r9
	ldr r0, [r1]
	lsls r2, r5, 1
	adds r0, r2, r0
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0x30]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _08043F5A
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _08043F8C @ =0x000001ff
	ands r0, r3
	cmp r1, r0
	beq _08043EF2
	ldr r0, [sp, 0x38]
	ldr r1, _08043F84 @ =gLevelUpLearnsets
	adds r6, r0, r1
	ldr r2, _08043F8C @ =0x000001ff
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_08043EDA:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08043EF2
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08043EDA
_08043EF2:
	cmp r4, 0x4
	bne _08043F5A
	movs r4, 0
	cmp r4, r10
	bge _08043F38
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x34]
	ldrh r2, [r0]
	ldr r0, _08043F8C @ =0x000001ff
	ands r0, r1
	add r1, sp, 0x8
	cmp r2, r0
	beq _08043F38
	ldr r2, [sp, 0x38]
	ldr r0, _08043F84 @ =gLevelUpLearnsets
	adds r6, r2, r0
	ldr r2, _08043F8C @ =0x000001ff
	mov r8, r2
	adds r3, r1, 0
	adds r5, r7, 0
_08043F20:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _08043F38
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08043F20
_08043F38:
	cmp r4, r10
	bne _08043F5A
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r4, [sp, 0x34]
	adds r2, r4, r2
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _08043F8C @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
_08043F5A:
	mov r5, r12
	cmp r5, 0x13
	bgt _08043F70
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r4, _08043F88 @ =0x0000ffff
	cmp r0, r4
	bne _08043EA0
_08043F70:
	mov r0, r10
_08043F72:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043F84: .4byte gLevelUpLearnsets
_08043F88: .4byte 0x0000ffff
_08043F8C: .4byte 0x000001ff
	thumb_func_end GetNumberOfRelearnableMoves

	thumb_func_start sub_8043F90
sub_8043F90: @ 8043F90
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	bl sub_806E25C
	cmp r0, 0
	bne _08043FB4
	cmp r4, 0x97
	bls _08043FB4
	ldr r0, _08043FB0 @ =0x0000ffff
	b _08043FB6
	.align 2, 0
_08043FB0: .4byte 0x0000ffff
_08043FB4:
	adds r0, r4, 0
_08043FB6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8043F90

	thumb_func_start sub_8043FBC
sub_8043FBC: @ 8043FBC
	push {lr}
	ldr r1, _08043FD0 @ =gUnknown_2024024
	movs r2, 0
	adds r0, r1, 0x3
_08043FC4:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08043FC4
	pop {r0}
	bx r0
	.align 2, 0
_08043FD0: .4byte gUnknown_2024024
	thumb_func_end sub_8043FBC

	thumb_func_start sub_8043FD4
sub_8043FD4: @ 8043FD4
	push {lr}
	ldr r0, _08043FFC @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	bne _0804406C
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _08043FF6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08044000
_08043FF6:
	movs r0, 0x85
	lsls r0, 1
	b _08044070
	.align 2, 0
_08043FFC: .4byte gBattleTypeFlags
_08044000:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _0804406C
	ldr r2, _08044028 @ =gTrainers
	ldr r0, _0804402C @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	subs r0, 0x53
	cmp r0, 0x7
	bhi _08044062
	lsls r0, 2
	ldr r1, _08044030 @ =_08044034
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044028: .4byte gTrainers
_0804402C: .4byte gTrainerBattleOpponent_A
_08044030: .4byte _08044034
	.align 2, 0
_08044034:
	.4byte _08044062
	.4byte _0804405C
	.4byte _08044062
	.4byte _08044062
	.4byte _0804405C
	.4byte _08044062
	.4byte _08044062
	.4byte _08044054
_08044054:
	ldr r0, _08044058 @ =0x0000012b
	b _08044070
	.align 2, 0
_08044058: .4byte 0x0000012b
_0804405C:
	movs r0, 0x94
	lsls r0, 1
	b _08044070
_08044062:
	ldr r0, _08044068 @ =0x00000129
	b _08044070
	.align 2, 0
_08044068: .4byte 0x00000129
_0804406C:
	movs r0, 0x95
	lsls r0, 1
_08044070:
	pop {r1}
	bx r1
	thumb_func_end sub_8043FD4

	thumb_func_start PlayBattleBGM
PlayBattleBGM: @ 8044074
	push {lr}
	bl ResetMapMusic
	bl m4aMPlayAllStop
	bl sub_8043FD4
	lsls r0, 16
	lsrs r0, 16
	bl PlayBGM
	pop {r0}
	bx r0
	thumb_func_end PlayBattleBGM

	thumb_func_start PlayMapChosenOrBattleBGM
PlayMapChosenOrBattleBGM: @ 8044090
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl ResetMapMusic
	bl m4aMPlayAllStop
	cmp r4, 0
	beq _080440AA
	adds r0, r4, 0
	bl PlayNewMapMusic
	b _080440B6
_080440AA:
	bl sub_8043FD4
	lsls r0, 16
	lsrs r0, 16
	bl PlayNewMapMusic
_080440B6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayMapChosenOrBattleBGM

	thumb_func_start GetMonFrontSpritePal
GetMonFrontSpritePal: @ 80440BC
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl GetFrontSpritePalFromSpeciesAndPersonality
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonFrontSpritePal

	thumb_func_start GetFrontSpritePalFromSpeciesAndPersonality
GetFrontSpritePalFromSpeciesAndPersonality: @ 80440F4
	push {r4,r5,lr}
	adds r3, r2, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08044110
	ldr r0, _0804410C @ =gUnknown_823730C
	ldr r0, [r0]
	b _0804413C
	.align 2, 0
_0804410C: .4byte gUnknown_823730C
_08044110:
	lsrs r0, r1, 16
	ldr r2, _0804412C @ =0x0000ffff
	ands r1, r2
	eors r0, r1
	lsrs r1, r3, 16
	eors r0, r1
	ands r3, r2
	eors r0, r3
	cmp r0, 0x7
	bls _08044134
	ldr r0, _08044130 @ =gUnknown_823730C
	lsls r1, r4, 3
	b _08044138
	.align 2, 0
_0804412C: .4byte 0x0000ffff
_08044130: .4byte gUnknown_823730C
_08044134:
	ldr r0, _08044144 @ =gUnknown_82380CC
	lsls r1, r5, 3
_08044138:
	adds r1, r0
	ldr r0, [r1]
_0804413C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08044144: .4byte gUnknown_82380CC
	thumb_func_end GetFrontSpritePalFromSpeciesAndPersonality

	thumb_func_start GetMonSpritePalStruct
GetMonSpritePalStruct: @ 8044148
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl GetMonSpritePalStructFromOtIdPersonality
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonSpritePalStruct

	thumb_func_start GetMonSpritePalStructFromOtIdPersonality
GetMonSpritePalStructFromOtIdPersonality: @ 8044180
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsrs r0, r1, 16
	ldr r3, _080441A0 @ =0x0000ffff
	ands r1, r3
	eors r0, r1
	lsrs r1, r2, 16
	eors r0, r1
	ands r2, r3
	eors r0, r2
	cmp r0, 0x7
	bls _080441A8
	lsls r0, r4, 3
	ldr r1, _080441A4 @ =gUnknown_823730C
	b _080441AC
	.align 2, 0
_080441A0: .4byte 0x0000ffff
_080441A4: .4byte gUnknown_823730C
_080441A8:
	lsls r0, r4, 3
	ldr r1, _080441B4 @ =gUnknown_82380CC
_080441AC:
	adds r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080441B4: .4byte gUnknown_82380CC
	thumb_func_end GetMonSpritePalStructFromOtIdPersonality

	thumb_func_start IsHMMove2
IsHMMove2: @ 80441B8
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, _080441DC @ =gUnknown_825E014
	ldrh r0, [r2]
	ldr r1, _080441E0 @ =0x0000ffff
	cmp r0, r1
	beq _080441EA
	adds r4, r1, 0
	adds r1, r2, 0
_080441CC:
	ldrh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	cmp r0, r3
	bne _080441E4
	movs r0, 0x1
	b _080441EC
	.align 2, 0
_080441DC: .4byte gUnknown_825E014
_080441E0: .4byte 0x0000ffff
_080441E4:
	ldrh r0, [r1]
	cmp r0, r4
	bne _080441CC
_080441EA:
	movs r0, 0
_080441EC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsHMMove2

	thumb_func_start IsPokeSpriteNotFlipped
IsPokeSpriteNotFlipped: @ 80441F4
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08044208 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x19]
	lsrs r0, 7
	bx lr
	.align 2, 0
_08044208: .4byte gBaseStats
	thumb_func_end IsPokeSpriteNotFlipped

	thumb_func_start GetMonFlavorRelation
GetMonFlavorRelation: @ 804420C
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08044230 @ =gUnknown_825DE24
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08044230: .4byte gUnknown_825DE24
	thumb_func_end GetMonFlavorRelation

	thumb_func_start GetFlavorRelationByPersonality
GetFlavorRelationByPersonality: @ 8044234
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNatureFromPersonality
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08044258 @ =gUnknown_825DE24
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08044258: .4byte gUnknown_825DE24
	thumb_func_end GetFlavorRelationByPersonality

	thumb_func_start IsTradedMon
IsTradedMon: @ 804425C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r1, 0x7
	mov r2, sp
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	mov r1, sp
	bl IsOtherTrainer
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsTradedMon

	thumb_func_start IsOtherTrainer
IsOtherTrainer: @ 8044288
	push {r4,r5,lr}
	adds r5, r1, 0
	ldr r1, _080442CC @ =gSaveBlock2Ptr
	ldr r3, [r1]
	ldrb r2, [r3, 0xA]
	ldrb r1, [r3, 0xB]
	lsls r1, 8
	orrs r2, r1
	ldrb r1, [r3, 0xC]
	lsls r1, 16
	orrs r2, r1
	ldrb r1, [r3, 0xD]
	lsls r1, 24
	orrs r2, r1
	cmp r0, r2
	bne _080442D0
	movs r4, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _080442C6
	adds r2, r5, 0
_080442B2:
	adds r1, r3, r4
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080442D0
	adds r2, 0x1
	adds r4, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080442B2
_080442C6:
	movs r0, 0
	b _080442D2
	.align 2, 0
_080442CC: .4byte gSaveBlock2Ptr
_080442D0:
	movs r0, 0x1
_080442D2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsOtherTrainer

	thumb_func_start MonRestorePP
MonRestorePP: @ 80442D8
	push {lr}
	bl BoxMonRestorePP
	pop {r0}
	bx r0
	thumb_func_end MonRestorePP

	thumb_func_start BoxMonRestorePP
BoxMonRestorePP: @ 80442E4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r6, 0
_080442EC:
	adds r4, r6, 0
	adds r4, 0xD
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	beq _08044338
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x15
	movs r2, 0
	bl GetBoxMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r6, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl CalculatePPWithBonus
	mov r1, sp
	strb r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r5, 0
	mov r2, sp
	bl SetBoxMonData
_08044338:
	adds r6, 0x1
	cmp r6, 0x3
	ble _080442EC
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end BoxMonRestorePP

	thumb_func_start sub_8044348
sub_8044348: @ 8044348
	push {r4,r5,lr}
	ldr r2, _0804438C @ =gLastUsedAbility
	ldr r5, _08044390 @ =gBattleStruct
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0xAC
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r4, _08044394 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x4
	strb r0, [r4, 0x1]
	adds r1, 0x49
	ldrb r0, [r1]
	strb r0, [r4, 0x2]
	movs r0, 0xFF
	strb r0, [r4, 0x4]
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0804439C
	ldr r1, _08044398 @ =gBattlerPartyIndexes
	ldr r0, [r5]
	adds r0, 0x49
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	b _080443AA
	.align 2, 0
_0804438C: .4byte gLastUsedAbility
_08044390: .4byte gBattleStruct
_08044394: .4byte gBattleTextBuff1
_08044398: .4byte gBattlerPartyIndexes
_0804439C:
	ldr r1, _080443E0 @ =gBattlerPartyIndexes
	ldr r0, [r5]
	adds r0, 0x49
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
_080443AA:
	strb r0, [r4, 0x3]
	ldr r4, _080443E4 @ =gBattleTextBuff2
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x4
	strb r0, [r4, 0x1]
	ldr r1, _080443E8 @ =gBattlerInMenuId
	ldrb r0, [r1]
	strb r0, [r4, 0x2]
	ldr r2, _080443E0 @ =gBattlerPartyIndexes
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0]
	bl pokemon_order_func
	strb r0, [r4, 0x3]
	movs r0, 0xFF
	strb r0, [r4, 0x4]
	ldr r0, _080443EC @ =gUnknown_83FCA2C
	ldr r1, _080443F0 @ =gStringVar4
	bl sub_80D7868
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080443E0: .4byte gBattlerPartyIndexes
_080443E4: .4byte gBattleTextBuff2
_080443E8: .4byte gBattlerInMenuId
_080443EC: .4byte gUnknown_83FCA2C
_080443F0: .4byte gStringVar4
	thumb_func_end sub_8044348

	thumb_func_start SetWildMonHeldItem
SetWildMonHeldItem: @ 80443F4
	push {r4,r5,lr}
	ldr r0, _0804444C @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _08044450 @ =0x00012008
	ands r0, r1
	cmp r0, 0
	bne _08044468
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r4, _08044454 @ =gEnemyParty
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08044458 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r3, r1, 2
	adds r1, r3, r2
	ldrh r0, [r1, 0xC]
	ldrh r1, [r1, 0xE]
	cmp r0, r1
	beq _0804443E
	cmp r5, 0x2C
	bls _08044468
	cmp r5, 0x5E
	bhi _0804445C
_0804443E:
	adds r2, 0xC
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	b _08044468
	.align 2, 0
_0804444C: .4byte gBattleTypeFlags
_08044450: .4byte 0x00012008
_08044454: .4byte gEnemyParty
_08044458: .4byte gBaseStats
_0804445C:
	adds r2, 0xE
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
_08044468:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end SetWildMonHeldItem

	thumb_func_start IsMonShiny
IsMonShiny: @ 8044470
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	bl IsShinyOtIdPersonality
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsMonShiny

	thumb_func_start IsShinyOtIdPersonality
IsShinyOtIdPersonality: @ 804449C
	push {r4,lr}
	movs r4, 0
	lsrs r2, r0, 16
	ldr r3, _080444C0 @ =0x0000ffff
	ands r0, r3
	eors r2, r0
	lsrs r0, r1, 16
	eors r2, r0
	ands r1, r3
	eors r2, r1
	cmp r2, 0x7
	bhi _080444B6
	movs r4, 0x1
_080444B6:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080444C0: .4byte 0x0000ffff
	thumb_func_end IsShinyOtIdPersonality

	thumb_func_start sub_80444C4
sub_80444C4: @ 80444C4
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080444F4 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x18]
	movs r0, 0x2
	eors r0, r1
	bl GetBankMultiplayerId
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, 0x8
	adds r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080444F4: .4byte gLinkPlayers
	thumb_func_end sub_80444C4

	thumb_func_start sub_80444F8
sub_80444F8: @ 80444F8
	push {r4-r6,lr}
	movs r6, 0x1
	movs r5, 0
_080444FE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08044548 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	movs r2, 0
	bl GetMonData
	cmp r0, 0x1
	bne _08044538
	adds r0, r4, 0
	movs r1, 0x6
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08044538
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r6
	bls _08044538
	adds r6, r0, 0
_08044538:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080444FE
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08044548: .4byte gPlayerParty
	thumb_func_end sub_80444F8

	thumb_func_start sub_804454C
sub_804454C: @ 804454C
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08044558 @ =gFacilityClassToPicIndex
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08044558: .4byte gFacilityClassToPicIndex
	thumb_func_end sub_804454C

	thumb_func_start sub_804455C
sub_804455C: @ 804455C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x5
	bhi _08044632
	lsls r0, 2
	ldr r1, _08044574 @ =_08044578
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044574: .4byte _08044578
	.align 2, 0
_08044578:
	.4byte _08044632
	.4byte _08044590
	.4byte _08044664
	.4byte _080445BC
	.4byte _08044664
	.4byte _080445F4
_08044590:
	ldr r0, _080445B0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044632
	ldr r0, _080445B4 @ =gMain
	ldr r1, _080445B8 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08044632
	b _0804461A
	.align 2, 0
_080445B0: .4byte gBattleTypeFlags
_080445B4: .4byte gMain
_080445B8: .4byte 0x00000439
_080445BC:
	ldr r0, _080445E8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044632
	ldr r0, _080445EC @ =gMain
	ldr r1, _080445F0 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08044632
	cmp r5, 0x1
	beq _08044664
	cmp r5, 0x4
	beq _08044664
	cmp r5, 0x5
	beq _08044664
	b _08044632
	.align 2, 0
_080445E8: .4byte gBattleTypeFlags
_080445EC: .4byte gMain
_080445F0: .4byte 0x00000439
_080445F4:
	ldr r0, _08044638 @ =gBattleTypeFlags
	ldr r2, [r0]
	movs r3, 0x2
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08044648
	ldr r0, _0804463C @ =gMain
	ldr r1, _08044640 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08044632
	movs r0, 0x40
	ands r2, r0
	cmp r2, 0
	beq _08044658
_0804461A:
	ldr r4, _08044644 @ =gLinkPlayers
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x18]
	cmp r0, r5
	bne _08044664
_08044632:
	movs r0, 0
	b _08044666
	.align 2, 0
_08044638: .4byte gBattleTypeFlags
_0804463C: .4byte gMain
_08044640: .4byte 0x00000439
_08044644: .4byte gLinkPlayers
_08044648:
	ldr r0, _0804466C @ =gMain
	ldr r1, _08044670 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08044632
_08044658:
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08044632
_08044664:
	movs r0, 0x1
_08044666:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804466C: .4byte gMain
_08044670: .4byte 0x00000439
	thumb_func_end sub_804455C

	thumb_func_start GetDeoxysStat
GetDeoxysStat: @ 8044674
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r0, _0804469C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08044698
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xCD
	lsls r1, 1
	cmp r0, r1
	beq _080446A0
_08044698:
	movs r0, 0
	b _080446FE
	.align 2, 0
_0804469C: .4byte gBattleTypeFlags
_080446A0:
	adds r1, r6, 0
	adds r1, 0x27
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	adds r1, r6, 0
	adds r1, 0x1A
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	ldr r2, _08044704 @ =gUnknown_825E026
	lsls r1, r6, 1
	adds r1, r2
	ldrh r1, [r1]
	lsls r1, 1
	adds r1, r4
	cmp r0, 0
	bge _080446CC
	adds r0, 0x3
_080446CC:
	asrs r0, 2
	adds r0, r1, r0
	adds r1, r5, 0
	adds r1, 0x54
	ldrb r1, [r1]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r6, 24
	lsrs r2, 24
	adds r1, r4, 0
	bl nature_stat_mod
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
_080446FE:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08044704: .4byte gUnknown_825E026
	thumb_func_end GetDeoxysStat

	thumb_func_start sub_8044708
sub_8044708: @ 8044708
	push {r4,r5,lr}
	sub sp, 0x4
	movs r5, 0
_0804470E:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080447A8 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xCD
	lsls r1, 1
	cmp r0, r1
	bne _08044798
	adds r0, r4, 0
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3B
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3D
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3E
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3F
	mov r2, sp
	bl SetMonData
_08044798:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804470E
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080447A8: .4byte gPlayerParty
	thumb_func_end sub_8044708

	thumb_func_start sub_80447AC
sub_80447AC: @ 80447AC
	push {lr}
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080447E8 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r2, [r0]
	movs r0, 0x7
	ands r2, r0
	adds r1, r3
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	orrs r2, r0
	ldr r0, _080447EC @ =gUnknown_825E032
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	bl sub_804454C
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080447E8: .4byte gLinkPlayers
_080447EC: .4byte gUnknown_825E032
	thumb_func_end sub_80447AC

	thumb_func_start sub_80447F0
sub_80447F0: @ 80447F0
	push {lr}
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0804482C @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r2, [r0]
	movs r0, 0x7
	ands r2, r0
	adds r1, r3
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	orrs r2, r0
	ldr r1, _08044830 @ =gFacilityClassToTrainerClass
	ldr r0, _08044834 @ =gUnknown_825E032
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0804482C: .4byte gLinkPlayers
_08044830: .4byte gFacilityClassToTrainerClass
_08044834: .4byte gUnknown_825E032
	thumb_func_end sub_80447F0

	thumb_func_start sub_8044838
sub_8044838: @ 8044838
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r0, _08044888 @ =gUnknown_20370C0
	ldrh r5, [r0]
	ldr r0, _0804488C @ =gUnknown_20370C2
	ldrh r4, [r0]
	ldr r0, _08044890 @ =gUnknown_20370C4
	ldrh r6, [r0]
	bl ZeroEnemyPartyMons
	ldr r7, _08044894 @ =gEnemyParty
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x20
	bl CreateObedientMon
	cmp r6, 0
	beq _08044880
	add r0, sp, 0x10
	strb r6, [r0]
	adds r1, r0, 0
	asrs r0, r6, 8
	strb r0, [r1, 0x1]
	adds r0, r7, 0
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
_08044880:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044888: .4byte gUnknown_20370C0
_0804488C: .4byte gUnknown_20370C2
_08044890: .4byte gUnknown_20370C4
_08044894: .4byte gEnemyParty
	thumb_func_end sub_8044838

	thumb_func_start sub_8044898
sub_8044898: @ 8044898
	push {r4-r7,lr}
	adds r7, r2, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0x2
	eors r0, r5
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	adds r0, r4, 0
	bl sub_8088E74
	lsls r0, 24
	cmp r0, 0
	bne _080448EE
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8088E74
	adds r0, r4, 0
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bne _080448D8
	ldr r0, _080448F4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	str r7, [r0, 0x1C]
_080448D8:
	adds r0, r6, 0
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	movs r1, 0x9A
	lsls r1, 17
	cmp r0, r1
	bne _080448EE
	ldr r0, _080448F4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	str r7, [r0, 0x20]
_080448EE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080448F4: .4byte gSaveBlock2Ptr
	thumb_func_end sub_8044898

	thumb_func_start sub_80448F8
sub_80448F8: @ 80448F8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r0, _0804493C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _08044944
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08044944
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	ldr r1, _08044940 @ =gUnknown_841D148
	mov r0, sp
	bl StringCompare
	cmp r0, 0
	bne _08044944
	movs r0, 0x1
	b _08044946
	.align 2, 0
_0804493C: .4byte gBattleTypeFlags
_08044940: .4byte gUnknown_841D148
_08044944:
	movs r0, 0
_08044946:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80448F8

	thumb_func_start sub_8044950
sub_8044950: @ 8044950
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r6, 0
	cmp r1, 0x3
	bls _080449EC
	adds r5, r6, 0
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r5, r0
	bge _08044A2C
_08044972:
	ldr r1, [r4, 0x10]
	lsls r3, r5, 1
	adds r0, r3, r5
	lsls r0, 3
	ldr r2, _080449E8 @ =gUnknown_825DEF0
	adds r1, r0, r1
	adds r0, r2
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	movs r6, 0
	ldrb r2, [r4, 0x1]
	ldr r0, [r4, 0x10]
	mov r10, r0
	mov r8, r3
	ldr r7, [r4, 0x14]
	adds r1, r5, 0x1
	mov r9, r1
	cmp r6, r2
	bcs _080449C2
	mov r12, r7
	ldr r1, [r4, 0xC]
	lsls r0, r5, 2
	adds r0, r1
	ldr r3, [r0]
_080449A6:
	adds r0, r5, 0
	muls r0, r2
	adds r0, r6
	lsls r0, 3
	add r0, r12
	lsls r1, r6, 11
	adds r1, r3, r1
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r2, [r4, 0x1]
	cmp r6, r2
	bcc _080449A6
_080449C2:
	mov r2, r8
	adds r1, r2, r5
	lsls r1, 3
	add r1, r10
	ldrb r0, [r4, 0x1]
	muls r0, r5
	lsls r0, 3
	adds r0, r7, r0
	str r0, [r1, 0xC]
	mov r3, r9
	lsls r0, r3, 16
	lsrs r5, r0, 16
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r5, r0
	blt _08044972
	b _08044A2C
	.align 2, 0
_080449E8: .4byte gUnknown_825DEF0
_080449EC:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r2, _08044A3C @ =gUnknown_825DEF0
	ldr r1, [r4, 0x10]
	adds r0, r2
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
	ldm r0!, {r3,r5,r7}
	stm r1!, {r3,r5,r7}
	ldr r0, [r4, 0x10]
	mov r10, r0
	ldr r7, [r4, 0x14]
	ldrb r1, [r4, 0x1]
	cmp r6, r1
	bcs _08044A28
	adds r3, r7, 0
	ldr r0, [r4, 0xC]
	ldr r2, [r0]
_08044A12:
	lsls r0, r6, 3
	adds r0, r3
	lsls r1, r6, 11
	adds r1, r2, r1
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r5, [r4, 0x1]
	cmp r6, r5
	bcc _08044A12
_08044A28:
	mov r6, r10
	str r7, [r6, 0xC]
_08044A2C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044A3C: .4byte gUnknown_825DEF0
	thumb_func_end sub_8044950

	thumb_func_start sub_8044A40
sub_8044A40: @ 8044A40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	ldrb r0, [r4]
	lsls r0, 28
	movs r3, 0
	cmp r0, 0
	beq _08044ADA
	ldr r0, _08044AE8 @ =gUnknown_825E05C
	mov r10, r0
_08044A5A:
	ldr r0, [r4, 0x10]
	lsls r2, r3, 1
	adds r1, r2, r3
	lsls r1, 3
	adds r1, r0
	mov r0, r10
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	movs r5, 0
	ldr r0, [r4, 0x10]
	mov r8, r0
	mov r12, r2
	ldr r7, [r4, 0x14]
	adds r1, r3, 0x1
	mov r9, r1
	ldrb r6, [r4, 0x1]
	cmp r5, r6
	bcs _08044AAE
	adds r6, r7, 0
	ldr r1, [r4, 0xC]
	lsls r0, r3, 2
	adds r0, r1
	ldr r2, [r0]
_08044A8C:
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	adds r1, r3, 0
	muls r1, r0
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	lsls r0, r5, 11
	adds r0, r2, r0
	str r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r4, 0x1]
	cmp r5, r0
	bcc _08044A8C
_08044AAE:
	mov r5, r12
	adds r1, r5, r3
	lsls r1, 3
	add r1, r8
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	muls r0, r3
	lsls r0, 3
	adds r0, r7, r0
	str r0, [r1, 0xC]
	ldr r6, _08044AEC @ =gUnknown_82349BC
	str r6, [r1, 0x8]
	strh r3, [r1, 0x2]
	mov r7, r9
	lsls r0, r7, 16
	lsrs r3, r0, 16
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r3, r0
	blt _08044A5A
_08044ADA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044AE8: .4byte gUnknown_825E05C
_08044AEC: .4byte gUnknown_82349BC
	thumb_func_end sub_8044A40

	thumb_func_start sub_8044AF0
sub_8044AF0: @ 8044AF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0
	mov r8, r0
	ldr r4, _08044B34 @ =gUnknown_20244F4
	ldr r1, [r4]
	cmp r1, 0
	beq _08044B1E
	ldrb r0, [r1, 0x2]
	cmp r0, 0xA3
	beq _08044B2E
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	mov r1, r8
	str r1, [r4]
_08044B1E:
	ldr r4, _08044B34 @ =gUnknown_20244F4
	movs r0, 0x18
	bl AllocZeroed
	adds r2, r0, 0
	str r2, [r4]
	cmp r2, 0
	bne _08044B38
_08044B2E:
	movs r0, 0
	b _08044D70
	.align 2, 0
_08044B34: .4byte gUnknown_20244F4
_08044B38:
	cmp r5, 0
	beq _08044B94
	cmp r5, 0x1
	bne _08044B94
	cmp r6, 0x4
	bne _08044B5E
	ldrb r1, [r2]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x40
	b _08044B7C
_08044B5E:
	cmp r6, 0x4
	bls _08044B64
	movs r6, 0
_08044B64:
	ldrb r1, [r2]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x10
_08044B7C:
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _08044B90 @ =gUnknown_20244F4
	ldr r1, [r2]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1, 0x3]
	b _08044BD0
	.align 2, 0
_08044B90: .4byte gUnknown_20244F4
_08044B94:
	cmp r6, 0
	bne _08044B9A
	movs r6, 0x1
_08044B9A:
	cmp r6, 0x8
	bls _08044BA0
	movs r6, 0x8
_08044BA0:
	ldr r4, _08044C10 @ =gUnknown_20244F4
	ldr r3, [r4]
	movs r0, 0xF
	adds r1, r6, 0
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldr r2, [r4]
	lsls r3, r6, 4
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldr r1, [r4]
	movs r2, 0
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r0, [r4]
	strb r2, [r0, 0x3]
_08044BD0:
	ldr r5, _08044C10 @ =gUnknown_20244F4
	ldr r0, [r5]
	ldrb r1, [r0, 0x1]
	lsls r1, 11
	str r1, [r0, 0x4]
	ldrb r0, [r0]
	lsls r0, 28
	lsrs r0, 28
	muls r0, r1
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, 0x8]
	ldrb r0, [r1]
	lsls r0, 28
	lsrs r0, 23
	bl AllocZeroed
	adds r2, r0, 0
	ldr r1, [r5]
	str r2, [r1, 0xC]
	ldr r0, [r1, 0x8]
	cmp r0, 0
	beq _08044C04
	cmp r2, 0
	bne _08044C14
_08044C04:
	movs r0, 0x1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
	b _08044C44
	.align 2, 0
_08044C10: .4byte gUnknown_20244F4
_08044C14:
	ldrb r0, [r1]
	lsls r0, 28
	movs r4, 0
	adds r3, r5, 0
	cmp r0, 0
	beq _08044C44
_08044C20:
	ldr r3, [r5]
	ldr r0, [r3, 0xC]
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r3, 0x4]
	adds r2, r0, 0
	muls r2, r4
	ldr r0, [r3, 0x8]
	adds r0, r2
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r3]
	lsls r0, 28
	lsrs r0, 28
	cmp r4, r0
	blt _08044C20
_08044C44:
	ldr r5, _08044C8C @ =gUnknown_20244F4
	ldr r0, [r5]
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	bl AllocZeroed
	ldr r2, [r5]
	str r0, [r2, 0x10]
	ldrb r1, [r2]
	lsls r1, 28
	lsrs r1, 28
	ldrb r0, [r2, 0x1]
	lsls r0, 3
	muls r0, r1
	bl AllocZeroed
	adds r2, r0, 0
	ldr r1, [r5]
	str r2, [r1, 0x14]
	ldr r0, [r1, 0x10]
	cmp r0, 0
	beq _08044C7C
	cmp r2, 0
	bne _08044C90
_08044C7C:
	movs r0, 0x2
	mov r1, r8
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	b _08044CE2
	.align 2, 0
_08044C8C: .4byte gUnknown_20244F4
_08044C90:
	movs r4, 0
	ldrb r0, [r1, 0x1]
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	muls r0, r1
	adds r3, r5, 0
	cmp r4, r0
	bge _08044CC6
	adds r7, r3, 0
	movs r5, 0x80
	lsls r5, 4
_08044CA8:
	ldr r2, [r7]
	ldr r1, [r2, 0x14]
	lsls r0, r4, 3
	adds r0, r1
	strh r5, [r0, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r0, 28
	muls r0, r1
	cmp r4, r0
	blt _08044CA8
_08044CC6:
	ldr r0, [r3]
	ldrb r4, [r0, 0x3]
	cmp r4, 0
	beq _08044CDA
	cmp r4, 0x1
	bne _08044CDA
	adds r1, r6, 0
	bl sub_8044950
	b _08044CE2
_08044CDA:
	ldr r0, _08044D60 @ =gUnknown_20244F4
	ldr r0, [r0]
	bl sub_8044A40
_08044CE2:
	movs r0, 0x2
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08044D12
	ldr r4, _08044D60 @ =gUnknown_20244F4
	ldr r0, [r4]
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _08044D00
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x14]
_08044D00:
	ldr r0, [r4]
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08044D12
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x10]
_08044D12:
	movs r0, 0x1
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08044D42
	ldr r4, _08044D60 @ =gUnknown_20244F4
	ldr r0, [r4]
	ldr r0, [r0, 0xC]
	cmp r0, 0
	beq _08044D30
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0xC]
_08044D30:
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	cmp r0, 0
	beq _08044D42
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x8]
_08044D42:
	mov r0, r8
	cmp r0, 0
	beq _08044D64
	ldr r4, _08044D60 @ =gUnknown_20244F4
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x18
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	b _08044D6C
	.align 2, 0
_08044D60: .4byte gUnknown_20244F4
_08044D64:
	ldr r0, _08044D7C @ =gUnknown_20244F4
	ldr r1, [r0]
	movs r0, 0xA3
	strb r0, [r1, 0x2]
_08044D6C:
	ldr r0, _08044D7C @ =gUnknown_20244F4
	ldr r0, [r0]
_08044D70:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08044D7C: .4byte gUnknown_20244F4
	thumb_func_end sub_8044AF0

	thumb_func_start sub_8044D80
sub_8044D80: @ 8044D80
	push {r4,lr}
	ldr r4, _08044D9C @ =gUnknown_20244F4
	ldr r1, [r4]
	cmp r1, 0
	beq _08044DFA
	ldrb r0, [r1, 0x2]
	cmp r0, 0xA3
	beq _08044DA0
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	b _08044DF6
	.align 2, 0
_08044D9C: .4byte gUnknown_20244F4
_08044DA0:
	ldr r0, [r1, 0x14]
	cmp r0, 0
	beq _08044DB0
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x14]
_08044DB0:
	ldr r0, [r4]
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08044DC2
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x10]
_08044DC2:
	ldr r0, [r4]
	ldr r0, [r0, 0xC]
	cmp r0, 0
	beq _08044DD4
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0xC]
_08044DD4:
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	cmp r0, 0
	beq _08044DE6
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x8]
_08044DE6:
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x18
	bl memset
	ldr r0, [r4]
	bl Free
_08044DF6:
	movs r0, 0
	str r0, [r4]
_08044DFA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8044D80

	thumb_func_start sub_8044E00
sub_8044E00: @ 8044E00
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08044E14 @ =gUnknown_20244F4
	ldr r2, [r0]
	ldrb r0, [r2, 0x2]
	cmp r0, 0xA3
	beq _08044E18
	movs r0, 0
	b _08044E2C
	.align 2, 0
_08044E14: .4byte gUnknown_20244F4
_08044E18:
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	blt _08044E24
	movs r1, 0
_08044E24:
	ldr r0, [r2, 0xC]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_08044E2C:
	pop {r1}
	bx r1
	thumb_func_end sub_8044E00

	.align 2, 0 @ Don't pad with nop.
