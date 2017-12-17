	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start WriteUnalignedWord
WriteUnalignedWord: @ 80548FC
	strb r0, [r1]
	lsrs r2, r0, 8
	strb r2, [r1, 0x1]
	lsrs r2, r0, 16
	strb r2, [r1, 0x2]
	lsrs r0, 24
	strb r0, [r1, 0x3]
	bx lr
	thumb_func_end WriteUnalignedWord

	thumb_func_start CopyUnalignedWord
CopyUnalignedWord: @ 805490C
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	movs r2, 0
_08054914:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _08054914
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CopyUnalignedWord

	thumb_func_start InitPlayerTrainerId
InitPlayerTrainerId: @ 8054928
	push {r4,lr}
	bl Random
	adds r4, r0, 0
	bl GetGeneratedTrainerIdLower
	lsls r4, 16
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r0
	ldr r0, _08054950 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	adds r1, 0xA
	adds r0, r4, 0
	bl WriteUnalignedWord
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054950: .4byte gSaveBlock2Ptr
	thumb_func_end InitPlayerTrainerId

	thumb_func_start SetDefaultOptions
SetDefaultOptions: @ 8054954
	ldr r3, _080549A8 @ =gSaveBlock2Ptr
	ldr r2, [r3]
	ldrb r1, [r2, 0x14]
	movs r0, 0x8
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x14]
	ldr r2, [r3]
	ldrb r1, [r2, 0x14]
	movs r0, 0x7
	ands r0, r1
	strb r0, [r2, 0x14]
	ldr r2, [r3]
	ldrb r1, [r2, 0x15]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x15]
	ldr r2, [r3]
	ldrb r1, [r2, 0x15]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x15]
	ldr r2, [r3]
	ldrb r1, [r2, 0x15]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x15]
	ldr r2, [r3]
	ldrb r1, [r2, 0x15]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x15]
	ldr r1, [r3]
	movs r0, 0
	strb r0, [r1, 0x13]
	bx lr
	.align 2, 0
_080549A8: .4byte gSaveBlock2Ptr
	thumb_func_end SetDefaultOptions

	thumb_func_start sub_80549AC
sub_80549AC: @ 80549AC
	push {r4,lr}
	ldr r4, _080549D0 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	adds r0, 0x28
	movs r1, 0
	movs r2, 0x34
	bl memset
	ldr r0, [r4]
	adds r0, 0x5C
	movs r1, 0
	movs r2, 0x34
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080549D0: .4byte gSaveBlock2Ptr
	thumb_func_end sub_80549AC

	thumb_func_start sub_80549D4
sub_80549D4: @ 80549D4
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r0, _080549F0 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	adds r1, 0xB0
	ldr r2, _080549F4 @ =0x050001fa
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080549F0: .4byte gSaveBlock2Ptr
_080549F4: .4byte 0x050001fa
	thumb_func_end sub_80549D4

	thumb_func_start sub_80549F8
sub_80549F8: @ 80549F8
	push {lr}
	sub sp, 0x4
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x4
	movs r1, 0x1
	movs r3, 0x6
	bl Overworld_SetWarpDestination
	bl warp_in
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_80549F8

	thumb_func_start Sav2_ClearSetDefault
Sav2_ClearSetDefault: @ 8054A18
	push {lr}
	bl ClearSav2
	bl SetDefaultOptions
	pop {r0}
	bx r0
	thumb_func_end Sav2_ClearSetDefault

	thumb_func_start sub_8054A28
sub_8054A28: @ 8054A28
	push {lr}
	ldr r1, _08054A5C @ =gUnknown_2031DB0
	movs r0, 0
	strb r0, [r1]
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	bl sub_81089BC
	bl sub_81320AC
	bl sub_813D6E4
	bl sub_811089C
	bl Random
	lsls r0, 16
	lsrs r0, 16
	bl sub_8083214
	bl sub_806E6FC
	pop {r0}
	bx r0
	.align 2, 0
_08054A5C: .4byte gUnknown_2031DB0
	thumb_func_end sub_8054A28

	thumb_func_start sub_8054A60
sub_8054A60: @ 8054A60
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	ldr r6, _08054B50 @ =gSaveBlock1Ptr
	ldr r1, [r6]
	ldr r0, _08054B54 @ =0x00003a4c
	mov r8, r0
	add r1, r8
	mov r0, sp
	bl StringCopy
	ldr r1, _08054B58 @ =gUnknown_2031DB0
	movs r0, 0x1
	strb r0, [r1]
	ldr r4, _08054B5C @ =gSaveBlock2Ptr
	ldr r0, [r4]
	movs r1, 0xF2
	lsls r1, 4
	adds r0, r1
	movs r5, 0
	str r5, [r0]
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	bl sub_80549D4
	bl ClearSav1
	bl ClearMailData
	ldr r0, [r4]
	strb r5, [r0, 0x9]
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0xA8
	str r5, [r1]
	adds r0, 0xAC
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xAD
	strb r5, [r0]
	bl InitPlayerTrainerId
	bl PlayTimeCounter_Reset
	bl sub_80549AC
	bl sub_806E0D0
	bl sub_812D304
	ldr r0, [r6]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	ldr r1, _08054B60 @ =0x00000bb8
	bl sub_809FD70
	bl sub_8054E68
	bl InitLinkBattleRecords
	bl sub_80A0904
	bl sub_80A0958
	bl sub_806E190
	ldr r0, _08054B64 @ =gUnknown_2024029
	strb r5, [r0]
	bl ZeroPlayerPartyMons
	bl sub_808C7E0
	bl sub_8141C54
	ldr r0, [r6]
	ldr r1, _08054B68 @ =0x00000296
	adds r0, r1
	strh r5, [r0]
	bl sub_809A2DC
	bl sub_80EB658
	bl sub_809C794
	bl sub_80BDD34
	bl sub_8113044
	bl copy_strings_to_sav1
	bl sub_8054B70
	bl sub_8143D24
	bl sub_815D838
	bl sub_80549F8
	ldr r0, _08054B6C @ =gUnknown_81A6481
	bl ScriptContext2_RunNewScript
	ldr r0, [r6]
	add r0, r8
	mov r1, sp
	bl StringCopy
	bl sub_815EE0C
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054B50: .4byte gSaveBlock1Ptr
_08054B54: .4byte 0x00003a4c
_08054B58: .4byte gUnknown_2031DB0
_08054B5C: .4byte gSaveBlock2Ptr
_08054B60: .4byte 0x00000bb8
_08054B64: .4byte gUnknown_2024029
_08054B68: .4byte 0x00000296
_08054B6C: .4byte gUnknown_81A6481
	thumb_func_end sub_8054A60

	thumb_func_start sub_8054B70
sub_8054B70: @ 8054B70
	push {r4-r6,lr}
	sub sp, 0x4
	mov r0, sp
	movs r5, 0
	strh r5, [r0]
	ldr r4, _08054BBC @ =gSaveBlock2Ptr
	ldr r1, [r4]
	movs r0, 0xAF
	lsls r0, 4
	adds r1, r0
	ldr r6, _08054BC0 @ =0x01000008
	mov r0, sp
	adds r2, r6, 0
	bl CpuSet
	ldr r0, [r4]
	ldr r1, _08054BC4 @ =0x00000af8
	adds r0, r1
	movs r1, 0
	bl sub_815EE54
	bl ResetPokeJumpResults
	mov r0, sp
	adds r0, 0x2
	strh r5, [r0]
	ldr r1, [r4]
	movs r2, 0xB1
	lsls r2, 4
	adds r1, r2
	adds r2, r6, 0
	bl CpuSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054BBC: .4byte gSaveBlock2Ptr
_08054BC0: .4byte 0x01000008
_08054BC4: .4byte 0x00000af8
	thumb_func_end sub_8054B70

	.align 2, 0 @ Don't pad with nop.
