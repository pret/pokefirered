	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start CheckForFlashMemory
CheckForFlashMemory: @ 804BFE4
	push {lr}
	bl IdentifyFlash
	lsls r0, 16
	cmp r0, 0
	bne _0804C000
	ldr r1, _0804BFFC @ =gUnknown_3005004
	movs r0, 0x1
	str r0, [r1]
	bl InitFlashTimer
	b _0804C006
	.align 2, 0
_0804BFFC: .4byte gUnknown_3005004
_0804C000:
	ldr r1, _0804C00C @ =gUnknown_3005004
	movs r0, 0
	str r0, [r1]
_0804C006:
	pop {r0}
	bx r0
	.align 2, 0
_0804C00C: .4byte gUnknown_3005004
	thumb_func_end CheckForFlashMemory

	thumb_func_start ClearSav2
ClearSav2: @ 804C010
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0804C02C @ =gSaveBlock2
	ldr r2, _0804C030 @ =0x010007d2
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0804C02C: .4byte gSaveBlock2
_0804C030: .4byte 0x010007d2
	thumb_func_end ClearSav2

	thumb_func_start ClearSav1
ClearSav1: @ 804C034
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0804C050 @ =gSaveBlock1
	ldr r2, _0804C054 @ =0x01001ef4
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0804C050: .4byte gSaveBlock1
_0804C054: .4byte 0x01001ef4
	thumb_func_end ClearSav1

	thumb_func_start SetSaveBlocksPointers
SetSaveBlocksPointers: @ 804C058
	push {r4,r5,lr}
	ldr r4, _0804C08C @ =gSaveBlock1Ptr
	ldr r5, [r4]
	bl Random
	movs r1, 0x7C
	ands r1, r0
	ldr r2, _0804C090 @ =gSaveBlock2Ptr
	ldr r0, _0804C094 @ =gSaveBlock2
	adds r0, r1, r0
	str r0, [r2]
	ldr r0, _0804C098 @ =gSaveBlock1
	adds r0, r1, r0
	str r0, [r4]
	ldr r2, _0804C09C @ =gUnknown_3005010
	ldr r0, _0804C0A0 @ =gPokemonStorage
	adds r1, r0
	str r1, [r2]
	bl sub_8099E44
	adds r0, r5, 0
	bl sub_8110840
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C08C: .4byte gSaveBlock1Ptr
_0804C090: .4byte gSaveBlock2Ptr
_0804C094: .4byte gSaveBlock2
_0804C098: .4byte gSaveBlock1
_0804C09C: .4byte gUnknown_3005010
_0804C0A0: .4byte gPokemonStorage
	thumb_func_end SetSaveBlocksPointers

	thumb_func_start sub_804C0A4
sub_804C0A4: @ 804C0A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, _0804C160 @ =gMain
	ldr r0, [r4, 0xC]
	str r0, [sp]
	ldr r1, [r4, 0x10]
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [r4, 0xC]
	str r0, [r4, 0x10]
	str r0, [r4, 0x20]
	ldr r5, _0804C164 @ =gHeap
	ldr r0, _0804C168 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldr r0, _0804C16C @ =0x00000f24
	mov r9, r0
	adds r0, r5, 0
	mov r2, r9
	bl memcpy
	ldr r1, _0804C170 @ =gSaveBlock1Ptr
	mov r10, r1
	ldr r1, [r1]
	ldr r7, _0804C174 @ =0x00003d68
	ldr r0, _0804C178 @ =gHeap + 0xf24
	adds r2, r7, 0
	bl memcpy
	ldr r6, _0804C17C @ =gUnknown_3005010
	ldr r1, [r6]
	ldr r0, _0804C180 @ =0x000083d0
	mov r8, r0
	ldr r0, _0804C184 @ =gHeap + 0x4c8c
	mov r2, r8
	bl memcpy
	bl SetSaveBlocksPointers
	ldr r1, _0804C168 @ =gSaveBlock2Ptr
	ldr r0, [r1]
	adds r1, r5, 0
	mov r2, r9
	bl memcpy
	mov r1, r10
	ldr r0, [r1]
	ldr r1, _0804C178 @ =gHeap + 0xf24
	adds r2, r7, 0
	bl memcpy
	ldr r0, [r6]
	ldr r1, _0804C184 @ =gHeap + 0x4c8c
	mov r2, r8
	bl memcpy
	movs r1, 0xE0
	lsls r1, 9
	adds r0, r5, 0
	bl InitHeap
	ldr r0, [sp, 0x4]
	str r0, [r4, 0x10]
	ldr r1, [sp]
	str r1, [r4, 0xC]
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0
	adds r0, r4, 0
	bl sub_804C5A4
	ldr r1, _0804C168 @ =gSaveBlock2Ptr
	ldr r0, [r1]
	movs r1, 0xF2
	lsls r1, 4
	adds r0, r1
	str r4, [r0]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C160: .4byte gMain
_0804C164: .4byte gHeap
_0804C168: .4byte gSaveBlock2Ptr
_0804C16C: .4byte 0x00000f24
_0804C170: .4byte gSaveBlock1Ptr
_0804C174: .4byte 0x00003d68
_0804C178: .4byte gHeap + 0xf24
_0804C17C: .4byte gUnknown_3005010
_0804C180: .4byte 0x000083d0
_0804C184: .4byte gHeap + 0x4c8c
	thumb_func_end sub_804C0A4

	thumb_func_start sav2_x1_query_bit1
sav2_x1_query_bit1: @ 804C188
	ldr r0, _0804C194 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0804C194: .4byte gSaveBlock2Ptr
	thumb_func_end sav2_x1_query_bit1

	thumb_func_start sav2_x9_clear_bit1
sav2_x9_clear_bit1: @ 804C198
	ldr r0, _0804C1A8 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0xFE
	ands r0, r1
	strb r0, [r2, 0x9]
	bx lr
	.align 2, 0
_0804C1A8: .4byte gSaveBlock2Ptr
	thumb_func_end sav2_x9_clear_bit1

	thumb_func_start sub_804C1AC
sub_804C1AC: @ 804C1AC
	ldr r0, _0804C1BC @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	bx lr
	.align 2, 0
_0804C1BC: .4byte gSaveBlock2Ptr
	thumb_func_end sub_804C1AC

	thumb_func_start sub_804C1C0
sub_804C1C0: @ 804C1C0
	push {lr}
	movs r0, 0
	bl sub_8055778
	ldr r0, _0804C1D8 @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	pop {r0}
	bx r0
	.align 2, 0
_0804C1D8: .4byte gSaveBlock2Ptr
	thumb_func_end sub_804C1C0

	thumb_func_start sav2_gender2_inplace_and_xFE
sav2_gender2_inplace_and_xFE: @ 804C1DC
	ldr r0, _0804C1EC @ =gSaveBlock2Ptr
	ldr r2, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0xFE
	ands r0, r1
	strb r0, [r2, 0x9]
	bx lr
	.align 2, 0
_0804C1EC: .4byte gSaveBlock2Ptr
	thumb_func_end sav2_gender2_inplace_and_xFE

	thumb_func_start copy_player_party_to_sav1
copy_player_party_to_sav1: @ 804C1F0
	push {r4,lr}
	ldr r0, _0804C224 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _0804C228 @ =gPlayerPartyCount
	ldrb r1, [r1]
	adds r0, 0x34
	strb r1, [r0]
	movs r4, 0
_0804C200:
	ldr r0, _0804C224 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0x64
	muls r1, r4
	adds r0, r1
	ldr r2, _0804C22C @ =gPlayerParty
	adds r1, r2
	adds r0, 0x38
	movs r2, 0x64
	bl memcpy
	adds r4, 0x1
	cmp r4, 0x5
	ble _0804C200
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C224: .4byte gSaveBlock1Ptr
_0804C228: .4byte gPlayerPartyCount
_0804C22C: .4byte gPlayerParty
	thumb_func_end copy_player_party_to_sav1

	thumb_func_start sub_804C230
sub_804C230: @ 804C230
	push {r4,r5,lr}
	ldr r1, _0804C264 @ =gPlayerPartyCount
	ldr r0, _0804C268 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r4, 0
	ldr r5, _0804C26C @ =gPlayerParty
_0804C242:
	movs r0, 0x64
	adds r2, r4, 0
	muls r2, r0
	adds r0, r2, r5
	ldr r1, _0804C268 @ =gSaveBlock1Ptr
	ldr r1, [r1]
	adds r1, r2
	adds r1, 0x38
	movs r2, 0x64
	bl memcpy
	adds r4, 0x1
	cmp r4, 0x5
	ble _0804C242
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C264: .4byte gPlayerPartyCount
_0804C268: .4byte gSaveBlock1Ptr
_0804C26C: .4byte gPlayerParty
	thumb_func_end sub_804C230

	thumb_func_start save_serialize_npcs
save_serialize_npcs: @ 804C270
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0804C2B0 @ =gSaveBlock1Ptr
	mov r12, r0
	movs r5, 0xD4
	lsls r5, 3
	mov r8, r5
	ldr r4, _0804C2B4 @ =gUnknown_2036E38
	movs r3, 0
	movs r2, 0xF
_0804C286:
	mov r6, r12
	ldr r1, [r6]
	adds r1, r3
	add r1, r8
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _0804C286
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C2B0: .4byte gSaveBlock1Ptr
_0804C2B4: .4byte gUnknown_2036E38
	thumb_func_end save_serialize_npcs

	thumb_func_start sub_804C2B8
sub_804C2B8: @ 804C2B8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0804C2F8 @ =gSaveBlock1Ptr
	mov r12, r0
	movs r5, 0xD4
	lsls r5, 3
	mov r8, r5
	ldr r4, _0804C2FC @ =gUnknown_2036E38
	movs r3, 0
	movs r2, 0xF
_0804C2CE:
	mov r6, r12
	ldr r1, [r6]
	adds r1, r3
	adds r0, r4, 0
	add r1, r8
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _0804C2CE
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C2F8: .4byte gSaveBlock1Ptr
_0804C2FC: .4byte gUnknown_2036E38
	thumb_func_end sub_804C2B8

	thumb_func_start SaveSerializedGame
SaveSerializedGame: @ 804C300
	push {lr}
	bl copy_player_party_to_sav1
	bl save_serialize_npcs
	pop {r0}
	bx r0
	thumb_func_end SaveSerializedGame

	thumb_func_start LoadSerializedGame
LoadSerializedGame: @ 804C310
	push {lr}
	bl sub_804C230
	bl sub_804C2B8
	pop {r0}
	bx r0
	thumb_func_end LoadSerializedGame

	thumb_func_start copy_bags_and_unk_data_from_save_blocks
copy_bags_and_unk_data_from_save_blocks: @ 804C320
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r2, 0
	ldr r0, _0804C424 @ =gUnknown_2031C8C
	mov r12, r0
	ldr r1, _0804C428 @ =gSaveBlock2Ptr
	mov r10, r1
	ldr r5, _0804C42C @ =gSaveBlock1Ptr
	movs r3, 0xC4
	lsls r3, 2
	ldr r4, _0804C430 @ =gUnknown_2031764
_0804C33C:
	lsls r0, r2, 2
	ldr r1, [r5]
	adds r1, r3
	adds r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, 0x1
	cmp r2, 0x29
	ble _0804C33C
	movs r2, 0
	ldr r0, _0804C430 @ =gUnknown_2031764
	ldr r5, _0804C42C @ =gSaveBlock1Ptr
	movs r3, 0xEE
	lsls r3, 2
	adds r4, r0, 0
	adds r4, 0xA8
_0804C35C:
	lsls r0, r2, 2
	ldr r1, [r5]
	adds r1, r3
	adds r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, 0x1
	cmp r2, 0x1D
	ble _0804C35C
	movs r2, 0
	ldr r0, _0804C430 @ =gUnknown_2031764
	ldr r5, _0804C42C @ =gSaveBlock1Ptr
	movs r6, 0x90
	lsls r6, 1
	adds r4, r0, r6
	movs r3, 0x86
	lsls r3, 3
_0804C37E:
	lsls r0, r2, 2
	ldr r1, [r5]
	adds r1, r3
	adds r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, 0x1
	cmp r2, 0xC
	ble _0804C37E
	movs r2, 0
	ldr r0, _0804C430 @ =gUnknown_2031764
	ldr r5, _0804C42C @ =gSaveBlock1Ptr
	movs r7, 0xAA
	lsls r7, 1
	adds r4, r0, r7
	ldr r3, _0804C434 @ =0x00000464
_0804C39E:
	lsls r0, r2, 2
	ldr r1, [r5]
	adds r1, r3
	adds r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, 0x1
	cmp r2, 0x39
	ble _0804C39E
	movs r2, 0
	ldr r0, _0804C430 @ =gUnknown_2031764
	ldr r5, _0804C42C @ =gSaveBlock1Ptr
	movs r1, 0x8F
	lsls r1, 2
	adds r4, r0, r1
	ldr r3, _0804C438 @ =0x0000054c
_0804C3BE:
	lsls r0, r2, 2
	ldr r1, [r5]
	adds r1, r3
	adds r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, 0x1
	cmp r2, 0x2A
	ble _0804C3BE
	ldr r0, _0804C430 @ =gUnknown_2031764
	ldr r5, _0804C42C @ =gSaveBlock1Ptr
	mov r8, r5
	movs r6, 0xBA
	lsls r6, 2
	adds r4, r0, r6
	movs r3, 0
	ldr r7, _0804C43C @ =0x00002cd0
	mov r9, r7
	movs r2, 0xF
_0804C3E4:
	mov r0, r8
	ldr r1, [r0]
	adds r1, r3
	adds r0, r4, 0
	add r1, r9
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _0804C3E4
	mov r1, r10
	ldr r0, [r1]
	movs r5, 0xF2
	lsls r5, 4
	adds r0, r5
	ldr r0, [r0]
	mov r6, r12
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C424: .4byte gUnknown_2031C8C
_0804C428: .4byte gSaveBlock2Ptr
_0804C42C: .4byte gSaveBlock1Ptr
_0804C430: .4byte gUnknown_2031764
_0804C434: .4byte 0x00000464
_0804C438: .4byte 0x0000054c
_0804C43C: .4byte 0x00002cd0
	thumb_func_end copy_bags_and_unk_data_from_save_blocks

	thumb_func_start sub_804C440
sub_804C440: @ 804C440
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r2, 0
	ldr r0, _0804C550 @ =gSaveBlock2Ptr
	mov r8, r0
	ldr r1, _0804C554 @ =gUnknown_2031C8C
	mov r12, r1
	ldr r5, _0804C558 @ =gSaveBlock1Ptr
	movs r3, 0xC4
	lsls r3, 2
	ldr r4, _0804C55C @ =gUnknown_2031764
_0804C45C:
	ldr r0, [r5]
	lsls r1, r2, 2
	adds r0, r3
	adds r0, r1
	ldm r4!, {r1}
	str r1, [r0]
	adds r2, 0x1
	cmp r2, 0x29
	ble _0804C45C
	movs r2, 0
	ldr r5, _0804C558 @ =gSaveBlock1Ptr
	movs r4, 0xEE
	lsls r4, 2
	ldr r0, _0804C55C @ =gUnknown_2031764
	adds r3, r0, 0
	adds r3, 0xA8
_0804C47C:
	ldr r0, [r5]
	lsls r1, r2, 2
	adds r0, r4
	adds r0, r1
	ldm r3!, {r1}
	str r1, [r0]
	adds r2, 0x1
	cmp r2, 0x1D
	ble _0804C47C
	movs r2, 0
	ldr r5, _0804C558 @ =gSaveBlock1Ptr
	movs r4, 0x86
	lsls r4, 3
	ldr r0, _0804C55C @ =gUnknown_2031764
	movs r6, 0x90
	lsls r6, 1
	adds r3, r0, r6
_0804C49E:
	ldr r0, [r5]
	lsls r1, r2, 2
	adds r0, r4
	adds r0, r1
	ldm r3!, {r1}
	str r1, [r0]
	adds r2, 0x1
	cmp r2, 0xC
	ble _0804C49E
	movs r2, 0
	ldr r5, _0804C558 @ =gSaveBlock1Ptr
	ldr r4, _0804C560 @ =0x00000464
	ldr r0, _0804C55C @ =gUnknown_2031764
	movs r7, 0xAA
	lsls r7, 1
	adds r3, r0, r7
_0804C4BE:
	ldr r0, [r5]
	lsls r1, r2, 2
	adds r0, r4
	adds r0, r1
	ldm r3!, {r1}
	str r1, [r0]
	adds r2, 0x1
	cmp r2, 0x39
	ble _0804C4BE
	movs r2, 0
	ldr r5, _0804C558 @ =gSaveBlock1Ptr
	ldr r4, _0804C564 @ =0x0000054c
	ldr r0, _0804C55C @ =gUnknown_2031764
	movs r1, 0x8F
	lsls r1, 2
	adds r3, r0, r1
_0804C4DE:
	ldr r0, [r5]
	lsls r1, r2, 2
	adds r0, r4
	adds r0, r1
	ldm r3!, {r1}
	str r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2A
	ble _0804C4DE
	ldr r2, _0804C558 @ =gSaveBlock1Ptr
	mov r9, r2
	ldr r5, _0804C568 @ =0x00002cd0
	mov r10, r5
	ldr r4, _0804C55C @ =gUnknown_2031764
	movs r3, 0
	movs r2, 0xF
_0804C4FE:
	mov r6, r9
	ldr r1, [r6]
	adds r1, r3
	add r1, r10
	movs r7, 0xBA
	lsls r7, 2
	adds r0, r4, r7
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _0804C4FE
	mov r1, r8
	ldr r0, [r1]
	movs r5, 0xF2
	lsls r5, 4
	adds r0, r5
	ldr r4, [r0]
	mov r2, r12
	ldr r1, [r2]
	str r1, [r0]
	adds r0, r4, 0
	bl ApplyNewEncryptionKeyToBagItems
	mov r6, r8
	ldr r0, [r6]
	adds r0, r5
	str r4, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C550: .4byte gSaveBlock2Ptr
_0804C554: .4byte gUnknown_2031C8C
_0804C558: .4byte gSaveBlock1Ptr
_0804C55C: .4byte gUnknown_2031764
_0804C560: .4byte 0x00000464
_0804C564: .4byte 0x0000054c
_0804C568: .4byte 0x00002cd0
	thumb_func_end sub_804C440

	thumb_func_start sub_804C56C
sub_804C56C: @ 804C56C
	ldr r2, _0804C584 @ =gSaveBlock2Ptr
	ldr r2, [r2]
	movs r3, 0xF2
	lsls r3, 4
	adds r2, r3
	ldr r2, [r2]
	ldrh r3, [r0]
	eors r2, r3
	eors r2, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_0804C584: .4byte gSaveBlock2Ptr
	thumb_func_end sub_804C56C

	thumb_func_start sub_804C588
sub_804C588: @ 804C588
	ldr r2, _0804C5A0 @ =gSaveBlock2Ptr
	ldr r3, [r2]
	movs r2, 0xF2
	lsls r2, 4
	adds r3, r2
	ldr r2, [r0]
	ldr r3, [r3]
	eors r2, r3
	eors r2, r1
	str r2, [r0]
	bx lr
	.align 2, 0
_0804C5A0: .4byte gSaveBlock2Ptr
	thumb_func_end sub_804C588

	thumb_func_start sub_804C5A4
sub_804C5A4: @ 804C5A4
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r7, _0804C5F8 @ =gSaveBlock1Ptr
	ldr r6, _0804C5FC @ =0x00003d38
	movs r4, 0x3
_0804C5AE:
	ldr r0, [r7]
	adds r0, r6
	adds r0, 0x4
	adds r1, r5, 0
	bl sub_804C588
	adds r6, 0xC
	subs r4, 0x1
	cmp r4, 0
	bge _0804C5AE
	adds r0, r5, 0
	bl sub_8054F38
	adds r0, r5, 0
	bl ApplyNewEncryptionKeyToBagItems_
	adds r0, r5, 0
	bl sub_815EE6C
	ldr r4, _0804C5F8 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	adds r1, r5, 0
	bl sub_804C588
	ldr r0, [r4]
	movs r1, 0xA5
	lsls r1, 2
	adds r0, r1
	adds r1, r5, 0
	bl sub_804C56C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C5F8: .4byte gSaveBlock1Ptr
_0804C5FC: .4byte 0x00003d38
	thumb_func_end sub_804C5A4

	.align 2, 0 @ Don't pad with nop.
