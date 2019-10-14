	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F1DAC
sub_80F1DAC: @ 80F1DAC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80F1DAC

	thumb_func_start sub_80F1DC0
sub_80F1DC0: @ 80F1DC0
	push {lr}
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80F1DC0

	thumb_func_start InitHallOfFameScreen
InitHallOfFameScreen: @ 80F1DDC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080F1DFC @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080F1DF0
	b _080F1EF0
_080F1DF0:
	lsls r0, 2
	ldr r1, _080F1E00 @ =_080F1E04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1DFC: .4byte gMain
_080F1E00: .4byte _080F1E04
	.align 2, 0
_080F1E04:
	.4byte _080F1E18
	.4byte _080F1E50
	.4byte _080F1E56
	.4byte _080F1E88
	.4byte _080F1EC4
_080F1E18:
	ldr r1, _080F1E40 @ =gHelpSystemEnabled
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	bl ClearVramOamPltt_LoadHofPal
	ldr r4, _080F1E44 @ =gUnknown_203AB3C
	ldr r0, _080F1E48 @ =0x00002008
	bl AllocZeroed
	str r0, [r4]
	ldr r0, _080F1E4C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _080F1EF0
	.align 2, 0
_080F1E40: .4byte gHelpSystemEnabled
_080F1E44: .4byte gUnknown_203AB3C
_080F1E48: .4byte 0x00002008
_080F1E4C: .4byte gMain
_080F1E50:
	bl sub_80F36BC
	b _080F1EAA
_080F1E56:
	ldr r1, _080F1E80 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0xE2
	lsls r1, 3
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	bl sub_80F36F8
	ldr r0, _080F1E84 @ =gUnknown_203AB3C
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1]
	b _080F1EAA
	.align 2, 0
_080F1E80: .4byte 0x00003f42
_080F1E84: .4byte gUnknown_203AB3C
_080F1E88:
	bl sub_80F3770
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080F1EF0
	ldr r0, _080F1EBC @ =sub_80F1DAC
	bl SetVBlankCallback
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080F1EAA:
	ldr r1, _080F1EC0 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F1EF0
	.align 2, 0
_080F1EBC: .4byte sub_80F1DAC
_080F1EC0: .4byte gMain
_080F1EC4:
	bl UpdatePaletteFade
	ldr r0, _080F1EE8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F1EF0
	ldr r0, _080F1EEC @ =sub_80F1DC0
	bl SetMainCallback2
	movs r0, 0x8F @ MUS_DENDOU >> 1
	lsls r0, 1
	bl PlayBGM
	movs r0, 0
	b _080F1EF2
	.align 2, 0
_080F1EE8: .4byte gPaletteFade
_080F1EEC: .4byte sub_80F1DC0
_080F1EF0:
	movs r0, 0x1
_080F1EF2:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end InitHallOfFameScreen

	thumb_func_start CB2_DoHallOfFameScreen
CB2_DoHallOfFameScreen: @ 80F1EFC
	push {r4,lr}
	bl InitHallOfFameScreen
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080F1F2C
	ldr r0, _080F1F34 @ =Task_Hof_InitMonData
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F1F38 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	ldr r4, _080F1F3C @ =gUnknown_203AB38
	movs r0, 0x78
	bl AllocZeroed
	str r0, [r4]
_080F1F2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1F34: .4byte Task_Hof_InitMonData
_080F1F38: .4byte gTasks
_080F1F3C: .4byte gUnknown_203AB38
	thumb_func_end CB2_DoHallOfFameScreen

	thumb_func_start CB2_DoHallOfFameScreenDontSaveData
CB2_DoHallOfFameScreenDontSaveData: @ 80F1F40
	push {lr}
	bl InitHallOfFameScreen
	lsls r0, 24
	cmp r0, 0
	bne _080F1F66
	ldr r0, _080F1F6C @ =Task_Hof_InitMonData
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F1F70 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
_080F1F66:
	pop {r0}
	bx r0
	.align 2, 0
_080F1F6C: .4byte Task_Hof_InitMonData
_080F1F70: .4byte gTasks
	thumb_func_end CB2_DoHallOfFameScreenDontSaveData

	thumb_func_start Task_Hof_InitMonData
Task_Hof_InitMonData: @ 80F1F74
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _080F2050 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	movs r7, 0
	ldr r0, _080F2054 @ =gUnknown_203AB38
	mov r9, r0
_080F1F98:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080F2058 @ =gPlayerParty
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	cmp r5, 0
	beq _080F2064
	adds r0, r6, 0
	movs r1, 0x41
	bl GetMonData
	mov r1, r9
	ldr r3, [r1]
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 2
	adds r3, r4
	ldr r2, _080F205C @ =0x000001ff
	adds r1, r2, 0
	ands r0, r1
	ldrh r1, [r3, 0x8]
	ldr r5, _080F2060 @ =0xfffffe00
	adds r2, r5, 0
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x8]
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	mov r2, r9
	ldr r1, [r2]
	adds r1, r4
	str r0, [r1]
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	mov r5, r9
	ldr r1, [r5]
	adds r1, 0x4
	adds r1, r4
	str r0, [r1]
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	ldr r2, [r5]
	adds r2, r4
	lsls r0, 1
	ldrb r3, [r2, 0x9]
	movs r1, 0x1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, 0x9]
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	movs r2, 0
	mov r6, r8
	lsls r5, r6, 2
	ldr r3, _080F2054 @ =gUnknown_203AB38
_080F2022:
	ldr r0, [r3]
	adds r1, r2, r4
	adds r0, 0xA
	adds r0, r1
	mov r6, sp
	adds r1, r6, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9
	bls _080F2022
	ldr r0, _080F2050 @ =gTasks
	mov r2, r8
	adds r1, r5, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	b _080F2098
	.align 2, 0
_080F2050: .4byte gTasks
_080F2054: .4byte gUnknown_203AB38
_080F2058: .4byte gPlayerParty
_080F205C: .4byte 0x000001ff
_080F2060: .4byte 0xfffffe00
_080F2064:
	mov r6, r9
	ldr r3, [r6]
	lsls r2, r7, 2
	adds r2, r7
	lsls r2, 2
	adds r4, r3, r2
	ldrh r0, [r4, 0x8]
	ldr r6, _080F20EC @ =0xfffffe00
	adds r1, r6, 0
	ands r0, r1
	strh r0, [r4, 0x8]
	str r5, [r4]
	adds r3, 0x4
	adds r3, r2
	str r5, [r3]
	ldrb r1, [r4, 0x9]
	movs r0, 0x1
	ands r0, r1
	strb r0, [r4, 0x9]
	mov r1, r9
	ldr r0, [r1]
	adds r0, r2
	movs r1, 0xFF
	strb r1, [r0, 0xA]
	mov r2, r8
	lsls r5, r2, 2
_080F2098:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x5
	bhi _080F20A4
	b _080F1F98
_080F20A4:
	ldr r0, _080F20F0 @ =gUnknown_203AB34
	movs r3, 0
	str r3, [r0]
	ldr r4, _080F20F4 @ =gTasks
	mov r6, r8
	adds r1, r5, r6
	lsls r1, 3
	adds r2, r1, r4
	strh r3, [r2, 0xA]
	movs r0, 0xFF
	strh r0, [r2, 0x10]
	movs r7, 0
	adds r3, r4, 0
	adds r3, 0x8
	movs r2, 0xFF
_080F20C2:
	adds r0, r7, 0x5
	lsls r0, 1
	adds r0, r1
	adds r0, r3
	strh r2, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x5
	bls _080F20C2
	mov r1, r8
	adds r0, r5, r1
	lsls r0, 3
	adds r1, r0, r4
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080F20FC
	ldr r0, _080F20F8 @ =sub_80F2294
	b _080F20FE
	.align 2, 0
_080F20EC: .4byte 0xfffffe00
_080F20F0: .4byte gUnknown_203AB34
_080F20F4: .4byte gTasks
_080F20F8: .4byte sub_80F2294
_080F20FC:
	ldr r0, _080F2110 @ =Task_Hof_InitTeamSaveData
_080F20FE:
	str r0, [r1]
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2110: .4byte Task_Hof_InitTeamSaveData
	thumb_func_end Task_Hof_InitMonData

	thumb_func_start Task_Hof_InitTeamSaveData
Task_Hof_InitTeamSaveData: @ 80F2114
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r7, _080F2140 @ =gDecompressionBuffer
	bl sub_8112450
	ldr r0, _080F2144 @ =gUnknown_203AB44
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F2148
	movs r2, 0x80
	lsls r2, 6
	adds r0, r7, 0
	movs r1, 0
	bl memset
	b _080F2162
	.align 2, 0
_080F2140: .4byte gDecompressionBuffer
_080F2144: .4byte gUnknown_203AB44
_080F2148:
	movs r0, 0x3
	bl Save_LoadGameData
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080F2162
	movs r2, 0x80
	lsls r2, 6
	adds r0, r7, 0
	movs r1, 0
	bl memset
_080F2162:
	movs r5, 0
	ldrh r1, [r7, 0x8]
	ldr r2, _080F2208 @ =0x000001ff
	adds r0, r2, 0
	ands r0, r1
	mov r1, r9
	lsls r1, 2
	mov r8, r1
	cmp r0, 0
	beq _080F218C
_080F2176:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r7, 0x78
	cmp r5, 0x31
	bhi _080F2190
	ldrh r1, [r7, 0x8]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080F2176
_080F218C:
	cmp r5, 0x31
	bls _080F21B2
_080F2190:
	ldr r4, _080F220C @ =gDecompressionBuffer
	adds r6, r4, 0
	adds r4, 0x78
	movs r5, 0
	subs r7, 0x78
_080F219A:
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x78
	bl memcpy
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r6, 0x78
	adds r4, 0x78
	cmp r5, 0x30
	bls _080F219A
_080F21B2:
	ldr r0, _080F2210 @ =gUnknown_203AB38
	ldr r1, [r0]
	adds r0, r7, 0
	movs r2, 0x78
	bl memcpy
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	ldr r2, _080F2214 @ =gText_SavingDontTurnOffThePower2
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized2
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r1, _080F2218 @ =gTasks
	mov r0, r8
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldr r1, _080F221C @ =sub_80F2220
	str r1, [r0]
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2208: .4byte 0x000001ff
_080F220C: .4byte gDecompressionBuffer
_080F2210: .4byte gUnknown_203AB38
_080F2214: .4byte gText_SavingDontTurnOffThePower2
_080F2218: .4byte gTasks
_080F221C: .4byte sub_80F2220
	thumb_func_end Task_Hof_InitTeamSaveData

	thumb_func_start sub_80F2220
sub_80F2220: @ 80F2220
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F2254 @ =gGameContinueCallback
	ldr r0, _080F2258 @ =CB2_DoHallOfFameScreenDontSaveData
	str r0, [r1]
	movs r0, 0x3
	bl TrySavingData
	movs r0, 0x30
	bl PlaySE
	ldr r1, _080F225C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080F2260 @ =sub_80F2264
	str r1, [r0]
	movs r1, 0x20
	strh r1, [r0, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2254: .4byte gGameContinueCallback
_080F2258: .4byte CB2_DoHallOfFameScreenDontSaveData
_080F225C: .4byte gTasks
_080F2260: .4byte sub_80F2264
	thumb_func_end sub_80F2220

	thumb_func_start sub_80F2264
sub_80F2264: @ 80F2264
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F2284 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080F2288
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	b _080F228C
	.align 2, 0
_080F2284: .4byte gTasks
_080F2288:
	ldr r0, _080F2290 @ =sub_80F2294
	str r0, [r1]
_080F228C:
	pop {r0}
	bx r0
	.align 2, 0
_080F2290: .4byte sub_80F2294
	thumb_func_end sub_80F2264

	thumb_func_start sub_80F2294
sub_80F2294: @ 80F2294
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F22A8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080F22AC @ =sub_80F22B0
	str r0, [r1]
	bx lr
	.align 2, 0
_080F22A8: .4byte gTasks
_080F22AC: .4byte sub_80F22B0
	thumb_func_end sub_80F2294

	thumb_func_start sub_80F22B0
sub_80F22B0: @ 80F22B0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080F22E4 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r6, [r1, 0xA]
	ldr r2, _080F22E8 @ =gUnknown_203AB38
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	ldr r2, [r2]
	adds r4, r2, r0
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0x3
	ble _080F22F0
	ldr r1, _080F22EC @ =gUnknown_840C268
	b _080F22F2
	.align 2, 0
_080F22E4: .4byte gTasks
_080F22E8: .4byte gUnknown_203AB38
_080F22EC: .4byte gUnknown_840C268
_080F22F0:
	ldr r1, _080F2388 @ =gUnknown_840C298
_080F22F2:
	lsls r2, r6, 3
	adds r0, r2, r1
	ldrh r3, [r0]
	adds r0, r1, 0x2
	adds r0, r2, r0
	ldrh r5, [r0]
	adds r0, r1, 0x4
	adds r0, r2, r0
	ldrh r0, [r0]
	mov r9, r0
	adds r1, 0x6
	adds r2, r1
	ldrh r2, [r2]
	mov r8, r2
	ldrh r0, [r4, 0x8]
	lsls r0, 23
	lsrs r0, 23
	ldr r1, [r4]
	ldr r2, [r4, 0x4]
	lsls r3, 16
	asrs r3, 16
	str r3, [sp]
	lsls r3, r5, 16
	asrs r3, 16
	str r3, [sp, 0x4]
	lsls r3, r6, 24
	lsrs r3, 24
	str r3, [sp, 0x8]
	ldr r3, _080F238C @ =0x0000ffff
	str r3, [sp, 0xC]
	movs r3, 0x1
	bl CreateMonPicSprite_HandleDeoxys
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080F2390 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r3
	movs r4, 0
	mov r5, r9
	strh r5, [r2, 0x30]
	mov r5, r8
	strh r5, [r2, 0x32]
	strh r4, [r2, 0x2E]
	adds r3, 0x1C
	adds r1, r3
	ldr r2, _080F2394 @ =sub_80F3870
	str r2, [r1]
	ldr r5, _080F2398 @ =gTasks
	adds r1, r6, 0x5
	lsls r1, 1
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r1, r4
	adds r2, r5, 0
	adds r2, 0x8
	adds r1, r2
	strh r0, [r1]
	movs r0, 0
	movs r1, 0x1
	bl ClearDialogWindowAndFrame
	adds r4, r5
	ldr r0, _080F239C @ =sub_80F23A0
	str r0, [r4]
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2388: .4byte gUnknown_840C298
_080F238C: .4byte 0x0000ffff
_080F2390: .4byte gSprites
_080F2394: .4byte sub_80F3870
_080F2398: .4byte gTasks
_080F239C: .4byte sub_80F23A0
	thumb_func_end sub_80F22B0

	thumb_func_start sub_80F23A0
sub_80F23A0: @ 80F23A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080F2410 @ =gTasks
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	adds r5, r3, r4
	ldrh r1, [r5, 0xA]
	ldr r2, _080F2414 @ =gUnknown_203AB38
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r2, [r2]
	adds r6, r2, r0
	ldr r2, _080F2418 @ =gSprites
	adds r1, 0x5
	lsls r1, 1
	adds r1, r3
	adds r4, 0x8
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080F2408
	ldrh r2, [r6, 0x8]
	ldr r0, _080F241C @ =0x000001ff
	ands r0, r2
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _080F23F6
	lsls r0, r2, 23
	lsrs r0, 23
	movs r1, 0
	bl PlayCry1
_080F23F6:
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0xE
	bl sub_80F3194
	movs r0, 0x78
	strh r0, [r5, 0xE]
	ldr r0, _080F2420 @ =Task_Hof_TryDisplayAnotherMon
	str r0, [r5]
_080F2408:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F2410: .4byte gTasks
_080F2414: .4byte gUnknown_203AB38
_080F2418: .4byte gSprites
_080F241C: .4byte 0x000001ff
_080F2420: .4byte Task_Hof_TryDisplayAnotherMon
	thumb_func_end sub_80F23A0

	thumb_func_start Task_Hof_TryDisplayAnotherMon
Task_Hof_TryDisplayAnotherMon: @ 80F2424
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080F2460 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	adds r4, r6, r2
	ldrh r3, [r4, 0xA]
	ldr r1, _080F2464 @ =gUnknown_203AB38
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	ldr r1, [r1]
	adds r1, r0
	mov r9, r1
	ldrh r1, [r4, 0xE]
	movs r7, 0xE
	ldrsh r0, [r4, r7]
	mov r12, r2
	cmp r0, 0
	beq _080F2468
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080F2500
	.align 2, 0
_080F2460: .4byte gTasks
_080F2464: .4byte gUnknown_203AB38
_080F2468:
	ldr r2, _080F24E0 @ =gUnknown_203AB34
	ldr r0, _080F24E4 @ =gSprites
	mov r8, r0
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r6
	mov r1, r12
	adds r1, 0x8
	adds r6, r0, r1
	movs r7, 0
	ldrsh r1, [r6, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	ldr r3, [r2]
	orrs r3, r1
	str r3, [r2]
	ldrh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bgt _080F24F4
	mov r7, r9
	ldrh r1, [r7, 0x1C]
	ldr r0, _080F24E8 @ =0x000001ff
	ands r0, r1
	cmp r0, 0
	beq _080F24F4
	adds r0, r2, 0x1
	strh r0, [r4, 0xA]
	ldr r0, _080F24EC @ =0x00007716
	str r0, [sp]
	adds r0, r3, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0xC
	bl BeginNormalPaletteFade
	movs r0, 0
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r0, _080F24F0 @ =sub_80F22B0
	str r0, [r4]
	b _080F2500
	.align 2, 0
_080F24E0: .4byte gUnknown_203AB34
_080F24E4: .4byte gSprites
_080F24E8: .4byte 0x000001ff
_080F24EC: .4byte 0x00007716
_080F24F0: .4byte sub_80F22B0
_080F24F4:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	add r0, r12
	ldr r1, _080F2510 @ =Task_Hof_PaletteFadeAndPrintWelcomeText
	str r1, [r0]
_080F2500:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2510: .4byte Task_Hof_PaletteFadeAndPrintWelcomeText
	thumb_func_end Task_Hof_TryDisplayAnotherMon

	thumb_func_start Task_Hof_PaletteFadeAndPrintWelcomeText
Task_Hof_PaletteFadeAndPrintWelcomeText: @ 80F2514
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F259C @ =0xffff0000
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r3, 0
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r5, r0, 3
	ldr r0, _080F25A0 @ =gTasks+0x8
	mov r12, r0
	mov r8, r1
	ldr r6, _080F25A4 @ =gSprites
	movs r7, 0xD
	negs r7, r7
_080F2542:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r5
	mov r2, r12
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	beq _080F2564
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1, 0x5]
_080F2564:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _080F2542
	movs r0, 0
	movs r1, 0xF
	bl HallOfFame_PrintWelcomeText
	movs r0, 0x62
	bl PlaySE
	ldr r1, _080F25A8 @ =gTasks
	mov r2, r8
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC8
	lsls r1, 1
	strh r1, [r0, 0xE]
	ldr r1, _080F25AC @ =sub_80F25B0
	str r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F259C: .4byte 0xffff0000
_080F25A0: .4byte gTasks+0x8
_080F25A4: .4byte gSprites
_080F25A8: .4byte gTasks
_080F25AC: .4byte sub_80F25B0
	thumb_func_end Task_Hof_PaletteFadeAndPrintWelcomeText

	thumb_func_start sub_80F25B0
sub_80F25B0: @ 80F25B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _080F25F0 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r5, r0, 3
	adds r1, r5, r7
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080F25F4
	subs r2, 0x1
	strh r2, [r1, 0xE]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _080F266E
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x6E
	ble _080F266E
	bl sub_80F3930
	b _080F266E
	.align 2, 0
_080F25F0: .4byte gTasks
_080F25F4:
	movs r3, 0
	mov r9, r4
	ldr r0, _080F2680 @ =gUnknown_203AB34
	mov r10, r0
	adds r4, r5, 0
	adds r7, 0x8
	mov r8, r7
	ldr r7, _080F2684 @ =gSprites
	movs r1, 0xD
	negs r1, r1
	mov r12, r1
	movs r5, 0x4
_080F260C:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r4
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	beq _080F2630
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0x5]
	mov r0, r12
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
_080F2630:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _080F260C
	mov r3, r10
	ldr r0, [r3]
	ldr r1, _080F2688 @ =0x00007716
	str r1, [sp]
	movs r1, 0
	movs r2, 0xC
	movs r3, 0xC
	bl BeginNormalPaletteFade
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r1, _080F268C @ =gTasks
	mov r2, r9
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0x7
	strh r1, [r0, 0xE]
	ldr r1, _080F2690 @ =sub_80F2694
	str r1, [r0]
_080F266E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2680: .4byte gUnknown_203AB34
_080F2684: .4byte gSprites
_080F2688: .4byte 0x00007716
_080F268C: .4byte gTasks
_080F2690: .4byte sub_80F2694
	thumb_func_end sub_80F25B0

	thumb_func_start sub_80F2694
sub_80F2694: @ 80F2694
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F26B4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0xF
	ble _080F26BC
	ldr r0, _080F26B8 @ =sub_80F26D4
	str r0, [r1]
	b _080F26CE
	.align 2, 0
_080F26B4: .4byte gTasks
_080F26B8: .4byte sub_80F26D4
_080F26BC:
	adds r0, r2, 0x1
	strh r0, [r1, 0xE]
	movs r0, 0xE
	ldrsh r1, [r1, r0]
	lsls r1, 24
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
_080F26CE:
	pop {r0}
	bx r0
	thumb_func_end sub_80F2694

	thumb_func_start sub_80F26D4
sub_80F26D4: @ 80F26D4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	ldr r0, _080F2748 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	bl PlayerGenderToFrontTrainerPicId_Debug
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	str r1, [sp]
	ldr r1, _080F274C @ =0x0000ffff
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x78
	movs r3, 0x48
	bl CreateTrainerPicSprite
	ldr r1, _080F2750 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	strh r0, [r4, 0x10]
	ldr r0, _080F2754 @ =gUnknown_840C234
	bl AddWindow
	ldr r1, _080F2758 @ =0x0000021d
	movs r0, 0x1
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	movs r0, 0x78
	strh r0, [r4, 0xE]
	ldr r0, _080F275C @ =Task_Hof_WaitAndPrintPlayerInfo
	str r0, [r4]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F2748: .4byte gSaveBlock2Ptr
_080F274C: .4byte 0x0000ffff
_080F2750: .4byte gTasks
_080F2754: .4byte gUnknown_840C234
_080F2758: .4byte 0x0000021d
_080F275C: .4byte Task_Hof_WaitAndPrintPlayerInfo
	thumb_func_end sub_80F26D4

	thumb_func_start Task_Hof_WaitAndPrintPlayerInfo
Task_Hof_WaitAndPrintPlayerInfo: @ 80F2760
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F2784 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0xE]
	movs r1, 0xE
	ldrsh r5, [r4, r1]
	cmp r5, 0
	beq _080F2788
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080F27F4
	.align 2, 0
_080F2784: .4byte gTasks
_080F2788:
	ldr r2, _080F27A8 @ =gSprites
	movs r3, 0x10
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0xC0
	beq _080F27AC
	adds r0, r2, 0x1
	strh r0, [r1, 0x20]
	b _080F27F4
	.align 2, 0
_080F27A8: .4byte gSprites
_080F27AC:
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	movs r1, 0x2
	bl sub_80F33DC
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	ldr r2, _080F27FC @ =gUnknown_84160C8
	str r5, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized2
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _080F2800 @ =Task_Hof_ExitOnKeyPressed
	str r0, [r4]
_080F27F4:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F27FC: .4byte gUnknown_84160C8
_080F2800: .4byte Task_Hof_ExitOnKeyPressed
	thumb_func_end Task_Hof_WaitAndPrintPlayerInfo

	thumb_func_start Task_Hof_ExitOnKeyPressed
Task_Hof_ExitOnKeyPressed: @ 80F2804
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F2830 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F282A
	movs r0, 0x4
	bl FadeOutBGM
	ldr r0, _080F2834 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080F2838 @ =Task_Hof_HandlePaletteOnExit
	str r0, [r1]
_080F282A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2830: .4byte gMain
_080F2834: .4byte gTasks
_080F2838: .4byte Task_Hof_HandlePaletteOnExit
	thumb_func_end Task_Hof_ExitOnKeyPressed

	thumb_func_start Task_Hof_HandlePaletteOnExit
Task_Hof_HandlePaletteOnExit: @ 80F283C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F287C @ =gPlttBufferFaded
	ldr r1, _080F2880 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080F2884 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080F2888 @ =Task_Hof_HandleExit
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F287C: .4byte gPlttBufferFaded
_080F2880: .4byte gPlttBufferUnfaded
_080F2884: .4byte gTasks
_080F2888: .4byte Task_Hof_HandleExit
	thumb_func_end Task_Hof_HandlePaletteOnExit

	thumb_func_start Task_Hof_HandleExit
Task_Hof_HandleExit: @ 80F288C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080F2924 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F291E
	lsls r7, r6, 2
	ldr r1, _080F2928 @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r1, 0x12
	adds r4, r0, r1
	movs r5, 0x5
_080F28AC:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080F28B6
	bl FreeAndDestroyMonPicSprite
_080F28B6:
	adds r4, 0x2
	subs r5, 0x1
	cmp r5, 0
	bge _080F28AC
	ldr r0, _080F2928 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x10]
	bl FreeAndDestroyTrainerPicSprite
	movs r0, 0
	bl HideBg
	movs r0, 0x1
	bl HideBg
	movs r0, 0x3
	bl HideBg
	bl FreeAllWindowBuffers
	movs r0, 0x1
	bl UnsetBgTilemapBuffer
	movs r0, 0x3
	bl UnsetBgTilemapBuffer
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	adds r0, r6, 0
	bl DestroyTask
	ldr r4, _080F292C @ =gUnknown_203AB3C
	ldr r0, [r4]
	cmp r0, 0
	beq _080F290A
	bl Free
	movs r0, 0
	str r0, [r4]
_080F290A:
	ldr r4, _080F2930 @ =gUnknown_203AB38
	ldr r0, [r4]
	cmp r0, 0
	beq _080F291A
	bl Free
	movs r0, 0
	str r0, [r4]
_080F291A:
	bl sub_80F2934
_080F291E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2924: .4byte gPaletteFade
_080F2928: .4byte gTasks
_080F292C: .4byte gUnknown_203AB3C
_080F2930: .4byte gUnknown_203AB38
	thumb_func_end Task_Hof_HandleExit

	thumb_func_start sub_80F2934
sub_80F2934: @ 80F2934
	push {lr}
	sub sp, 0x4
	ldr r0, _080F2970 @ =0x00004085
	movs r1, 0x1
	bl VarSet
	movs r0, 0x80
	lsls r0, 7
	bl FlagSet
	ldr r1, _080F2974 @ =gDisableMapMusicChangeOnMapLoad
	movs r0, 0x2
	strb r0, [r1]
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x3 @ MAP_GROUP(INDIGO_PLATEAU_EXTERIOR)
	movs r1, 0x9 @ MAP_NUM(INDIGO_PLATEAU_EXTERIOR)
	movs r3, 0xB
	bl SetWarpDestination
	bl DoWarp
	bl ResetInitialPlayerAvatarState
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F2970: .4byte 0x00004085
_080F2974: .4byte gDisableMapMusicChangeOnMapLoad
	thumb_func_end sub_80F2934

	thumb_func_start sub_80F2978
sub_80F2978: @ 80F2978
	push {r4,lr}
	ldr r0, _080F2994 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _080F29B4
	lsls r0, 2
	ldr r1, _080F2998 @ =_080F299C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2994: .4byte gMain
_080F2998: .4byte _080F299C
	.align 2, 0
_080F299C:
	.4byte _080F29B4
	.4byte _080F29E4
	.4byte _080F29EA
	.4byte _080F2A08
	.4byte _080F2A28
	.4byte _080F2A58
_080F29B4:
	movs r0, 0
	bl SetVBlankCallback
	bl ClearVramOamPltt_LoadHofPal
	ldr r4, _080F29D8 @ =gUnknown_203AB3C
	ldr r0, _080F29DC @ =0x00002008
	bl AllocZeroed
	str r0, [r4]
	ldr r0, _080F29E0 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _080F2A8C
	.align 2, 0
_080F29D8: .4byte gUnknown_203AB3C
_080F29DC: .4byte 0x00002008
_080F29E0: .4byte gMain
_080F29E4:
	bl sub_80F36BC
	b _080F2A42
_080F29EA:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	bl sub_80F36F8
	b _080F2A42
_080F2A08:
	bl sub_80F3770
	lsls r0, 24
	cmp r0, 0
	bne _080F2A8C
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80A0A48
	ldr r0, _080F2A24 @ =sub_80F1DAC
	bl SetVBlankCallback
	b _080F2A42
	.align 2, 0
_080F2A24: .4byte sub_80F1DAC
_080F2A28:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_80A0A98
	lsls r0, 24
	cmp r0, 0
	bne _080F2A8C
_080F2A42:
	ldr r1, _080F2A54 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F2A8C
	.align 2, 0
_080F2A54: .4byte gMain
_080F2A58:
	ldr r1, _080F2A94 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0xE2
	lsls r1, 3
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080F2A98 @ =sub_80F2AA4
	movs r1, 0
	bl CreateTask
	ldr r4, _080F2A9C @ =gUnknown_203AB38
	movs r0, 0x80
	lsls r0, 6
	bl AllocZeroed
	str r0, [r4]
	ldr r0, _080F2AA0 @ =sub_80F1DC0
	bl SetMainCallback2
_080F2A8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2A94: .4byte 0x00003f42
_080F2A98: .4byte sub_80F2AA4
_080F2A9C: .4byte gUnknown_203AB38
_080F2AA0: .4byte sub_80F1DC0
	thumb_func_end sub_80F2978

	thumb_func_start sub_80F2AA4
sub_80F2AA4: @ 80F2AA4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080F2AD8 @ =0x00000226
	str r0, [sp]
	movs r0, 0
	movs r1, 0x1E
	movs r2, 0
	movs r3, 0xC
	bl CreateTopBarWindowLoadPalette
	movs r0, 0x3
	bl Save_LoadGameData
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080F2AE4
	ldr r0, _080F2ADC @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080F2AE0 @ =sub_80F30A4
	b _080F2B5A
	.align 2, 0
_080F2AD8: .4byte 0x00000226
_080F2ADC: .4byte gTasks
_080F2AE0: .4byte sub_80F30A4
_080F2AE4:
	ldr r0, _080F2B2C @ =gDecompressionBuffer
	ldr r4, _080F2B30 @ =gUnknown_203AB38
	ldr r1, [r4]
	movs r2, 0x80
	lsls r2, 5
	bl CpuSet
	ldr r4, [r4]
	movs r2, 0
	ldrh r1, [r4, 0x8]
	ldr r3, _080F2B34 @ =0x000001ff
	adds r0, r3, 0
	ands r0, r1
	lsls r5, r6, 2
	cmp r0, 0
	beq _080F2B1A
_080F2B04:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	adds r4, 0x78
	cmp r2, 0x31
	bhi _080F2B3C
	ldrh r1, [r4, 0x8]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _080F2B04
_080F2B1A:
	cmp r2, 0x31
	bhi _080F2B3C
	ldr r0, _080F2B38 @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	subs r0, r2, 0x1
	b _080F2B46
	.align 2, 0
_080F2B2C: .4byte gDecompressionBuffer
_080F2B30: .4byte gUnknown_203AB38
_080F2B34: .4byte 0x000001ff
_080F2B38: .4byte gTasks
_080F2B3C:
	ldr r0, _080F2B64 @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x31
_080F2B46:
	strh r0, [r1, 0x8]
	movs r0, 0xA
	bl GetGameStat
	ldr r2, _080F2B64 @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0xA]
	ldr r0, _080F2B68 @ =sub_80F2B6C
_080F2B5A:
	str r0, [r1]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F2B64: .4byte gTasks
_080F2B68: .4byte sub_80F2B6C
	thumb_func_end sub_80F2AA4

	thumb_func_start sub_80F2B6C
sub_80F2B6C: @ 80F2B6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080F2C24 @ =gUnknown_203AB38
	ldr r3, [r0]
	movs r5, 0
	ldr r1, _080F2C28 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	movs r4, 0x8
	ldrsh r0, [r0, r4]
	adds r4, r1, 0
	ldr r2, _080F2C2C @ =gUnknown_203AB34
	cmp r5, r0
	bge _080F2BAA
	adds r1, r0, 0
_080F2B9E:
	adds r3, 0x78
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r1
	blt _080F2B9E
_080F2BAA:
	adds r6, r3, 0
	movs r0, 0
	str r0, [r2]
	mov r5, r9
	lsls r2, r5, 2
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r4
	strh r0, [r1, 0xC]
	strh r0, [r1, 0x10]
	movs r5, 0
	str r2, [sp, 0x14]
	ldr r4, _080F2C30 @ =0x000001ff
	adds r2, r1, 0
_080F2BC6:
	ldrh r1, [r6, 0x8]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080F2BD6
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
_080F2BD6:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r6, 0x14
	cmp r5, 0x5
	bls _080F2BC6
	adds r6, r3, 0
	movs r5, 0
	ldr r1, _080F2C28 @ =gTasks
	ldr r0, [sp, 0x14]
	add r0, r9
	lsls r0, 3
	mov r8, r0
	adds r0, r1
	str r0, [sp, 0x10]
	adds r1, 0x8
	mov r10, r1
_080F2BF8:
	ldrh r1, [r6, 0x8]
	ldr r2, _080F2C30 @ =0x000001ff
	adds r0, r2, 0
	ands r0, r1
	adds r7, r1, 0
	cmp r0, 0
	beq _080F2CA8
	ldr r4, [sp, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _080F2C3C
	lsls r1, r5, 3
	ldr r0, _080F2C34 @ =gUnknown_840C268
	adds r0, 0x4
	adds r0, r1, r0
	ldrh r3, [r0]
	ldr r2, _080F2C38 @ =gUnknown_840C26E
	adds r1, r2
	ldrh r4, [r1]
	b _080F2C4C
	.align 2, 0
_080F2C24: .4byte gUnknown_203AB38
_080F2C28: .4byte gTasks
_080F2C2C: .4byte gUnknown_203AB34
_080F2C30: .4byte 0x000001ff
_080F2C34: .4byte gUnknown_840C268
_080F2C38: .4byte gUnknown_840C26E
_080F2C3C:
	ldr r0, _080F2C9C @ =gUnknown_840C298
	lsls r2, r5, 3
	adds r1, r0, 0x4
	adds r1, r2, r1
	ldrh r3, [r1]
	adds r0, 0x6
	adds r2, r0
	ldrh r4, [r2]
_080F2C4C:
	lsls r0, r7, 23
	lsrs r0, 23
	ldr r1, [r6]
	ldr r2, [r6, 0x4]
	lsls r3, 16
	asrs r3, 16
	str r3, [sp]
	lsls r3, r4, 16
	asrs r3, 16
	str r3, [sp, 0x4]
	lsls r3, r5, 24
	lsrs r3, 24
	str r3, [sp, 0x8]
	ldr r3, _080F2CA0 @ =0x0000ffff
	str r3, [sp, 0xC]
	movs r3, 0x1
	bl CreateMonPicSprite_HandleDeoxys
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080F2CA4 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r2, r4, 0
	ands r3, r2
	movs r2, 0x4
	orrs r3, r2
	strb r3, [r1, 0x5]
	adds r1, r5, 0x5
	lsls r1, 1
	add r1, r8
	add r1, r10
	strh r0, [r1]
	b _080F2CB4
	.align 2, 0
_080F2C9C: .4byte gUnknown_840C298
_080F2CA0: .4byte 0x0000ffff
_080F2CA4: .4byte gSprites
_080F2CA8:
	adds r0, r5, 0x5
	lsls r0, 1
	add r0, r8
	add r0, r10
	movs r1, 0xFF
	strh r1, [r0]
_080F2CB4:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r6, 0x14
	cmp r5, 0x5
	bls _080F2BF8
	ldr r0, _080F2D08 @ =0xffff0000
	ldr r2, _080F2D0C @ =0x00007716
	movs r1, 0xC
	bl BlendPalettes
	ldr r0, _080F2D10 @ =gStringVar1
	ldr r1, _080F2D14 @ =gTasks
	ldr r4, [sp, 0x14]
	add r4, r9
	lsls r4, 3
	adds r4, r1
	movs r5, 0xA
	ldrsh r1, [r4, r5]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r5, _080F2D18 @ =gStringVar4
	ldr r1, _080F2D1C @ =gUnknown_84160B4
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bgt _080F2D24
	ldr r1, _080F2D20 @ =gText_UPDOWNPick_ABUTTONBBUTTONCancel
	movs r0, 0x1
	str r0, [sp]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0
	bl TopBarWindowPrintTwoStrings
	b _080F2D34
	.align 2, 0
_080F2D08: .4byte 0xffff0000
_080F2D0C: .4byte 0x00007716
_080F2D10: .4byte gStringVar1
_080F2D14: .4byte gTasks
_080F2D18: .4byte gStringVar4
_080F2D1C: .4byte gUnknown_84160B4
_080F2D20: .4byte gText_UPDOWNPick_ABUTTONBBUTTONCancel
_080F2D24:
	ldr r1, _080F2D54 @ =gText_UPDOWNPick_ABUTTONNext_BBUTTONBack
	movs r0, 0x1
	str r0, [sp]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0
	bl TopBarWindowPrintTwoStrings
_080F2D34:
	ldr r0, _080F2D58 @ =gTasks
	ldr r1, [sp, 0x14]
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldr r0, _080F2D5C @ =Task_HofPC_PrintMonInfo
	str r0, [r1]
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2D54: .4byte gText_UPDOWNPick_ABUTTONNext_BBUTTONBack
_080F2D58: .4byte gTasks
_080F2D5C: .4byte Task_HofPC_PrintMonInfo
	thumb_func_end sub_80F2B6C

	thumb_func_start Task_HofPC_PrintMonInfo
Task_HofPC_PrintMonInfo: @ 80F2D60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F2E68 @ =gUnknown_203AB38
	ldr r5, [r0]
	movs r3, 0
	ldr r1, _080F2E6C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r3, r0
	bge _080F2D94
	adds r1, r0, 0
_080F2D88:
	adds r5, 0x78
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	blt _080F2D88
_080F2D94:
	movs r3, 0
	lsls r7, r4, 2
	adds r0, r7, r4
	lsls r6, r0, 3
	ldr r0, _080F2E70 @ =gTasks+0x8
	mov r10, r0
	ldr r1, _080F2E74 @ =gSprites
	mov r8, r1
	movs r2, 0xD
	negs r2, r2
	mov r9, r2
	movs r0, 0x4
	mov r12, r0
_080F2DAE:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r6
	add r0, r10
	ldrh r1, [r0]
	cmp r1, 0xFF
	beq _080F2DD0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r2, [r0, 0x5]
	mov r1, r9
	ands r1, r2
	mov r2, r12
	orrs r1, r2
	strb r1, [r0, 0x5]
_080F2DD0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _080F2DAE
	adds r1, r7, r4
	lsls r1, 3
	ldr r0, _080F2E6C @ =gTasks
	adds r6, r1, r0
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	adds r0, 0x5
	lsls r0, 1
	adds r0, r1
	ldr r1, _080F2E6C @ =gTasks
	adds r1, 0x8
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F2E74 @ =gSprites
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r1
	ldr r1, _080F2E78 @ =0xffff0000
	eors r0, r1
	ldr r2, _080F2E7C @ =gUnknown_203AB34
	str r0, [r2]
	ldr r2, _080F2E80 @ =0x00007716
	movs r1, 0xC
	bl BlendPalettesUnfaded
	movs r0, 0xC
	ldrsh r1, [r6, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r4, r5, r0
	ldrh r1, [r4, 0x8]
	ldr r0, _080F2E84 @ =0x000001ff
	ands r0, r1
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _080F2E4A
	bl StopCryAndClearCrySongs
	ldrh r0, [r4, 0x8]
	lsls r0, 23
	lsrs r0, 23
	movs r1, 0
	bl PlayCry1
_080F2E4A:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xE
	bl sub_80F3194
	ldr r0, _080F2E88 @ =Task_HofPC_HandleInput
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2E68: .4byte gUnknown_203AB38
_080F2E6C: .4byte gTasks
_080F2E70: .4byte gTasks+0x8
_080F2E74: .4byte gSprites
_080F2E78: .4byte 0xffff0000
_080F2E7C: .4byte gUnknown_203AB34
_080F2E80: .4byte 0x00007716
_080F2E84: .4byte 0x000001ff
_080F2E88: .4byte Task_HofPC_HandleInput
	thumb_func_end Task_HofPC_PrintMonInfo

	thumb_func_start Task_HofPC_HandleInput
Task_HofPC_HandleInput: @ 80F2E8C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080F2F00 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r2
	adds r3, r1, 0
	cmp r0, 0
	beq _080F2F38
	ldr r7, _080F2F04 @ =gTasks
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r3, r1, 3
	adds r4, r3, r7
	ldrh r2, [r4, 0x8]
	movs r6, 0x8
	ldrsh r1, [r4, r6]
	mov r8, r0
	cmp r1, 0
	beq _080F2F0C
	subs r0, r2, 0x1
	strh r0, [r4, 0x8]
	movs r4, 0
	adds r6, r3, 0
	adds r7, 0x8
_080F2EC4:
	adds r0, r4, 0x5
	lsls r0, 1
	adds r0, r6
	adds r0, r7
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080F2ED6
	bl FreeAndDestroyMonPicSprite
_080F2ED6:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x5
	bls _080F2EC4
	ldr r0, _080F2F04 @ =gTasks
	mov r2, r8
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080F2EF8
	subs r0, r2, 0x1
	strh r0, [r1, 0xA]
_080F2EF8:
	ldr r0, _080F2F08 @ =sub_80F2B6C
	str r0, [r1]
	b _080F2FD8
	.align 2, 0
_080F2F00: .4byte gMain
_080F2F04: .4byte gTasks
_080F2F08: .4byte sub_80F2B6C
_080F2F0C:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _080F2F26
	bl StopCryAndClearCrySongs
	ldr r0, _080F2F2C @ =gMPlayInfo_BGM
	ldr r1, _080F2F30 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_080F2F26:
	ldr r0, _080F2F34 @ =sub_80F2FEC
	str r0, [r4]
	b _080F2FD8
	.align 2, 0
_080F2F2C: .4byte gMPlayInfo_BGM
_080F2F30: .4byte 0x0000ffff
_080F2F34: .4byte sub_80F2FEC
_080F2F38:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _080F2F7C
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _080F2F5A
	bl StopCryAndClearCrySongs
	ldr r0, _080F2F6C @ =gMPlayInfo_BGM
	ldr r1, _080F2F70 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_080F2F5A:
	ldr r0, _080F2F74 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080F2F78 @ =sub_80F2FEC
	str r0, [r1]
	b _080F2FD8
	.align 2, 0
_080F2F6C: .4byte gMPlayInfo_BGM
_080F2F70: .4byte 0x0000ffff
_080F2F74: .4byte gTasks
_080F2F78: .4byte sub_80F2FEC
_080F2F7C:
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _080F2FAC
	ldr r0, _080F2FA4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	movs r4, 0xC
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _080F2FAC
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	ldr r0, _080F2FA8 @ =Task_HofPC_PrintMonInfo
	str r0, [r1]
	b _080F2FD8
	.align 2, 0
_080F2FA4: .4byte gTasks
_080F2FA8: .4byte Task_HofPC_PrintMonInfo
_080F2FAC:
	ldrh r1, [r3, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F2FD8
	ldr r1, _080F2FE4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r6, 0xC
	ldrsh r1, [r2, r6]
	movs r3, 0x10
	ldrsh r0, [r2, r3]
	subs r0, 0x1
	cmp r1, r0
	bge _080F2FD8
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	ldr r0, _080F2FE8 @ =Task_HofPC_PrintMonInfo
	str r0, [r2]
_080F2FD8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2FE4: .4byte gTasks
_080F2FE8: .4byte Task_HofPC_PrintMonInfo
	thumb_func_end Task_HofPC_HandleInput

	thumb_func_start sub_80F2FEC
sub_80F2FEC: @ 80F2FEC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F3020 @ =gPlttBufferFaded
	ldr r1, _080F3024 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80A0A70
	ldr r1, _080F3028 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080F302C @ =sub_80F3030
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3020: .4byte gPlttBufferFaded
_080F3024: .4byte gPlttBufferUnfaded
_080F3028: .4byte gTasks
_080F302C: .4byte sub_80F3030
	thumb_func_end sub_80F2FEC

	thumb_func_start sub_80F3030
sub_80F3030: @ 80F3030
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80A0AAC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080F3094
	movs r0, 0
	bl HideBg
	movs r0, 0x1
	bl HideBg
	movs r0, 0x3
	bl HideBg
	bl DestroyTopBarWindow
	bl FreeAllWindowBuffers
	movs r0, 0x1
	bl UnsetBgTilemapBuffer
	movs r0, 0x3
	bl UnsetBgTilemapBuffer
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	adds r0, r5, 0
	bl DestroyTask
	ldr r5, _080F309C @ =gUnknown_203AB3C
	ldr r0, [r5]
	cmp r0, 0
	beq _080F3082
	bl Free
	str r4, [r5]
_080F3082:
	ldr r5, _080F30A0 @ =gUnknown_203AB38
	ldr r0, [r5]
	cmp r0, 0
	beq _080F3090
	bl Free
	str r4, [r5]
_080F3090:
	bl ReturnFromHallOfFamePC
_080F3094:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F309C: .4byte gUnknown_203AB3C
_080F30A0: .4byte gUnknown_203AB38
	thumb_func_end sub_80F3030

	thumb_func_start sub_80F30A4
sub_80F30A4: @ 80F30A4
	push {r4,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F30FC @ =gText_ABUTTONExit
	movs r1, 0x8
	movs r2, 0x1
	bl TopBarWindowPrintString
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	ldr r2, _080F3100 @ =gUnknown_8416090
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized2
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r1, _080F3104 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080F3108 @ =Task_HofPC_ExitOnButtonPress
	str r1, [r0]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F30FC: .4byte gText_ABUTTONExit
_080F3100: .4byte gUnknown_8416090
_080F3104: .4byte gTasks
_080F3108: .4byte Task_HofPC_ExitOnButtonPress
	thumb_func_end sub_80F30A4

	thumb_func_start Task_HofPC_ExitOnButtonPress
Task_HofPC_ExitOnButtonPress: @ 80F310C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080F3130 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F312C
	ldr r0, _080F3134 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080F3138 @ =sub_80F2FEC
	str r0, [r1]
_080F312C:
	pop {r0}
	bx r0
	.align 2, 0
_080F3130: .4byte gMain
_080F3134: .4byte gTasks
_080F3138: .4byte sub_80F2FEC
	thumb_func_end Task_HofPC_ExitOnButtonPress

	thumb_func_start HallOfFame_PrintWelcomeText
HallOfFame_PrintWelcomeText: @ 80F313C
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r5, _080F318C @ =gUnknown_8416008
	movs r0, 0x2
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	movs r4, 0xD0
	subs r4, r0
	lsrs r0, r4, 31
	adds r4, r0
	asrs r4, 1
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0
	bl PutWindowTilemap
	ldr r0, _080F3190 @ =gUnknown_840C23C
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F318C: .4byte gUnknown_8416008
_080F3190: .4byte gUnknown_840C23C
	thumb_func_end HallOfFame_PrintWelcomeText

	thumb_func_start sub_80F3194
sub_80F3194: @ 80F3194
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x34
	adds r7, r0, 0
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0
	bl PutWindowTilemap
	ldrh r0, [r7, 0x8]
	ldr r1, _080F3214 @ =0x000001ff
	ands r1, r0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _080F3252
	add r4, sp, 0x1C
	ldr r1, _080F3218 @ =gUnknown_84160EC
	adds r0, r4, 0
	bl StringCopy
	ldrh r0, [r7, 0x8]
	lsls r0, 23
	lsrs r0, 23
	bl sub_8043F90
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080F321C @ =0x0000ffff
	mov r8, r4
	cmp r6, r0
	beq _080F3220
	add r4, sp, 0xC
	adds r0, r6, 0
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	add r5, sp, 0xC
	adds r0, r6, 0
	movs r1, 0x64
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5, 0x1]
	add r5, sp, 0xC
	adds r0, r4, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r5, 0x2]
	b _080F322E
	.align 2, 0
_080F3214: .4byte 0x000001ff
_080F3218: .4byte gUnknown_84160EC
_080F321C: .4byte 0x0000ffff
_080F3220:
	add r3, sp, 0xC
	adds r2, r3, 0
	adds r1, r2, 0
	movs r0, 0xAC
	strb r0, [r1, 0x2]
	strb r0, [r2, 0x1]
	strb r0, [r3]
_080F322E:
	add r1, sp, 0xC
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	mov r0, r8
	bl StringAppend
	ldr r0, _080F32B8 @ =gUnknown_840C23C
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	mov r0, r8
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x10
	movs r3, 0x1
	bl AddTextPrinterParameterized3
_080F3252:
	movs r2, 0
	ldrb r0, [r7, 0xA]
	cmp r0, 0xFF
	beq _080F327C
	adds r3, r7, 0
	adds r3, 0xA
_080F325E:
	mov r1, sp
	adds r1, r2
	adds r1, 0xC
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9
	bhi _080F327C
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080F325E
_080F327C:
	mov r1, sp
	adds r1, r2
	adds r1, 0xC
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x2
	bl GetFontAttribute
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x2
	add r1, sp, 0xC
	bl GetStringWidth
	adds r2, r0, 0
	ldrh r1, [r7, 0x8]
	ldr r0, _080F32BC @ =0x000001ff
	ands r0, r1
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _080F32C0
	lsrs r0, r2, 31
	adds r0, r2, r0
	asrs r0, 1
	movs r1, 0x80
	subs r0, r1, r0
	b _080F32C4
	.align 2, 0
_080F32B8: .4byte gUnknown_840C23C
_080F32BC: .4byte 0x000001ff
_080F32C0:
	movs r0, 0x80
	subs r0, r2
_080F32C4:
	lsls r2, r0, 24
	lsrs r2, 24
	ldr r0, _080F331C @ =gUnknown_840C23C
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	ldrh r2, [r7, 0x8]
	ldr r4, _080F3320 @ =0x000001ff
	adds r0, r4, 0
	ands r0, r2
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _080F33BA
	add r1, sp, 0xC
	movs r0, 0xBA
	strb r0, [r1]
	mov r0, sp
	adds r0, 0xD
	lsls r1, r2, 23
	lsrs r1, 23
	movs r2, 0xB
	muls r1, r2
	ldr r2, _080F3324 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	adds r6, r0, 0
	ldrh r1, [r7, 0x8]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0x20
	beq _080F3318
	cmp r0, 0x1D
	bne _080F3328
_080F3318:
	movs r0, 0xFF
	b _080F333A
	.align 2, 0
_080F331C: .4byte gUnknown_840C23C
_080F3320: .4byte 0x000001ff
_080F3324: .4byte gSpeciesNames
_080F3328:
	lsls r0, r1, 23
	lsrs r0, 23
	ldr r1, [r7, 0x4]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080F3342
_080F333A:
	cmp r0, 0xFE
	beq _080F3346
	movs r0, 0
	b _080F3348
_080F3342:
	movs r0, 0xB5
	b _080F3348
_080F3346:
	movs r0, 0xB6
_080F3348:
	strb r0, [r6]
	adds r6, 0x1
	movs r0, 0xFF
	strb r0, [r6]
	ldr r5, _080F33D0 @ =gUnknown_840C23C
	str r5, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x80
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	ldr r1, _080F33D4 @ =gUnknown_84160F4
	add r0, sp, 0xC
	bl StringCopy
	adds r6, r0, 0
	ldrb r1, [r7, 0x9]
	lsrs r1, 1
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	str r5, [sp]
	str r4, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x20
	movs r3, 0x11
	bl AddTextPrinterParameterized3
	ldr r1, _080F33D8 @ =gUnknown_8416104
	add r0, sp, 0xC
	bl StringCopy
	adds r6, r0, 0
	ldrh r1, [r7]
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	str r5, [sp]
	str r4, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x60
	movs r3, 0x11
	bl AddTextPrinterParameterized3
_080F33BA:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x34
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F33D0: .4byte gUnknown_840C23C
_080F33D4: .4byte gUnknown_84160F4
_080F33D8: .4byte gUnknown_8416104
	thumb_func_end sub_80F3194

	thumb_func_start sub_80F33DC
sub_80F33DC: @ 80F33DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	ldr r0, _080F35EC @ =gUnknown_840C234
	ldrb r6, [r0, 0x3]
	lsls r6, 3
	subs r0, r6, 0x6
	str r0, [sp, 0x28]
	movs r0, 0x1
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x1
	bl PutWindowTilemap
	ldr r2, _080F35F0 @ =0x0000021d
	movs r0, 0x1
	movs r1, 0
	movs r3, 0xD
	bl DrawStdFrameWithCustomTileAndPalette
	movs r7, 0
	str r7, [sp]
	str r7, [sp, 0x4]
	ldr r1, _080F35F4 @ =gUnknown_840C240
	mov r9, r1
	str r1, [sp, 0x8]
	str r7, [sp, 0xC]
	ldr r0, _080F35F8 @ =gUnknown_84160FC
	str r0, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0x3
	bl AddTextPrinterParameterized4
	ldr r0, _080F35FC @ =gSaveBlock2Ptr
	mov r10, r0
	ldr r1, [r0]
	movs r0, 0x2
	movs r2, 0
	bl GetStringWidth
	adds r2, r0, 0
	ldr r1, [sp, 0x28]
	subs r2, r1, r2
	lsls r2, 24
	lsrs r2, 24
	mov r0, r9
	str r0, [sp]
	str r7, [sp, 0x4]
	mov r1, r10
	ldr r0, [r1]
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r3, 0x3
	bl AddTextPrinterParameterized3
	mov r1, r10
	ldr r0, [r1]
	ldrb r4, [r0, 0xA]
	ldrb r0, [r0, 0xB]
	lsls r0, 8
	orrs r4, r0
	mov r0, r9
	str r0, [sp]
	str r7, [sp, 0x4]
	ldr r0, _080F3600 @ =gUnknown_8416104
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0x12
	bl AddTextPrinterParameterized3
	add r1, sp, 0x14
	mov r8, r1
	ldr r1, _080F3604 @ =0x000186a0
	adds r0, r4, 0
	bl __modsi3
	ldr r5, _080F3608 @ =0x00002710
	adds r1, r5, 0
	bl __divsi3
	subs r0, 0x5F
	mov r1, r8
	strb r0, [r1]
	add r0, sp, 0x14
	mov r8, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r5, 0xFA
	lsls r5, 2
	adds r1, r5, 0
	bl __udivsi3
	adds r0, 0xA1
	mov r1, r8
	strb r0, [r1, 0x1]
	add r0, sp, 0x14
	mov r8, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	mov r1, r8
	strb r0, [r1, 0x2]
	add r5, sp, 0x14
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5, 0x3]
	add r5, sp, 0x14
	adds r0, r4, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r5, 0x4]
	add r1, sp, 0x14
	movs r0, 0xFF
	strb r0, [r1, 0x5]
	subs r6, 0x24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	str r0, [sp]
	str r7, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	adds r2, r6, 0
	movs r3, 0x12
	bl AddTextPrinterParameterized3
	mov r1, r9
	str r1, [sp]
	str r7, [sp, 0x4]
	ldr r0, _080F360C @ =gUnknown_8415CE8
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0x20
	bl AddTextPrinterParameterized3
	add r5, sp, 0x14
	mov r0, r10
	ldr r4, [r0]
	ldrh r0, [r4, 0xE]
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5]
	add r5, sp, 0x14
	ldrh r0, [r4, 0xE]
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5, 0x1]
	add r5, sp, 0x14
	ldrh r0, [r4, 0xE]
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r5, 0x2]
	add r0, sp, 0x14
	ldrb r0, [r0]
	cmp r0, 0xA1
	bne _080F3570
	add r0, sp, 0x14
	strb r7, [r0]
_080F3570:
	add r0, sp, 0x14
	ldrb r1, [r0]
	cmp r1, 0
	bne _080F3582
	ldrb r0, [r0, 0x1]
	cmp r0, 0xA1
	bne _080F3582
	add r0, sp, 0x14
	strb r1, [r0, 0x1]
_080F3582:
	add r1, sp, 0x14
	movs r6, 0
	movs r0, 0xF0
	strb r0, [r1, 0x3]
	adds r4, r1, 0
	ldr r0, _080F35FC @ =gSaveBlock2Ptr
	ldr r5, [r0]
	ldrb r0, [r5, 0x10]
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4, 0x4]
	add r4, sp, 0x14
	ldrb r0, [r5, 0x10]
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4, 0x5]
	add r1, sp, 0x14
	movs r0, 0xFF
	strb r0, [r1, 0x6]
	ldr r2, [sp, 0x28]
	subs r2, 0x24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080F35F4 @ =gUnknown_840C240
	str r0, [sp]
	str r6, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r3, 0x20
	bl AddTextPrinterParameterized3
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F35EC: .4byte gUnknown_840C234
_080F35F0: .4byte 0x0000021d
_080F35F4: .4byte gUnknown_840C240
_080F35F8: .4byte gUnknown_84160FC
_080F35FC: .4byte gSaveBlock2Ptr
_080F3600: .4byte gUnknown_8416104
_080F3604: .4byte 0x000186a0
_080F3608: .4byte 0x00002710
_080F360C: .4byte gUnknown_8415CE8
	thumb_func_end sub_80F33DC

	thumb_func_start ClearVramOamPltt_LoadHofPal
ClearVramOamPltt_LoadHofPal: @ 80F3610
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _080F36B0 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080F36B4 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080F3636:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _080F3636
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _080F36B0 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bl ResetPaletteFade
	ldr r0, _080F36B8 @ =gUnknown_840C39C
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F36B0: .4byte 0x040000d4
_080F36B4: .4byte 0x81000800
_080F36B8: .4byte gUnknown_840C39C
	thumb_func_end ClearVramOamPltt_LoadHofPal

	thumb_func_start sub_80F36BC
sub_80F36BC: @ 80F36BC
	push {lr}
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl ResetTempTileDataBuffers
	bl ResetAllPicSprites
	bl FreeAllSpritePalettes
	ldr r1, _080F36EC @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _080F36F0 @ =gUnknown_840C248
	bl LoadCompressedSpriteSheet
	ldr r0, _080F36F4 @ =gUnknown_840C258
	bl LoadCompressedSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_080F36EC: .4byte gReservedSpritePaletteCount
_080F36F0: .4byte gUnknown_840C248
_080F36F4: .4byte gUnknown_840C258
	thumb_func_end sub_80F36BC

	thumb_func_start sub_80F36F8
sub_80F36F8: @ 80F36F8
	push {r4,lr}
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080F3764 @ =gUnknown_840C228
	movs r0, 0
	movs r2, 0x3
	bl InitBgsFromTemplates
	ldr r4, _080F3768 @ =gUnknown_203AB3C
	ldr r1, [r4]
	adds r1, 0x6
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _080F376C @ =0x00001006
	adds r1, r0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3764: .4byte gUnknown_840C228
_080F3768: .4byte gUnknown_203AB3C
_080F376C: .4byte 0x00001006
	thumb_func_end sub_80F36F8

	thumb_func_start sub_80F3770
sub_80F3770: @ 80F3770
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _080F3788 @ =gUnknown_203AB3C
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080F3854
	lsls r0, 2
	ldr r1, _080F378C @ =_080F3790
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F3788: .4byte gUnknown_203AB3C
_080F378C: .4byte _080F3790
	.align 2, 0
_080F3790:
	.4byte _080F37A4
	.4byte _080F37BC
	.4byte _080F37C8
	.4byte _080F381E
	.4byte _080F3828
_080F37A4:
	ldr r1, _080F37B8 @ =gUnknown_840C3BC
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	b _080F3854
	.align 2, 0
_080F37B8: .4byte gUnknown_840C3BC
_080F37BC:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	cmp r0, 0
	beq _080F3854
	b _080F385E
_080F37C8:
	movs r4, 0x20
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x3
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	movs r3, 0xE
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _080F3854
_080F381E:
	bl InitStandardTextBoxWindows
	bl ResetBg0
	b _080F3854
_080F3828:
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	ldr r0, _080F3850 @ =gUnknown_203AB3C
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1]
	b _080F3860
	.align 2, 0
_080F3850: .4byte gUnknown_203AB3C
_080F3854:
	ldr r0, _080F3868 @ =gUnknown_203AB3C
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F385E:
	movs r0, 0x1
_080F3860:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F3868: .4byte gUnknown_203AB3C
	thumb_func_end sub_80F3770

	thumb_func_start nullsub_84
nullsub_84: @ 80F386C
	bx lr
	thumb_func_end nullsub_84

	thumb_func_start sub_80F3870
sub_80F3870: @ 80F3870
	push {r4,lr}
	adds r2, r0, 0
	ldr r1, [r2, 0x20]
	ldr r0, [r2, 0x30]
	cmp r1, r0
	beq _080F38C6
	ldrh r3, [r2, 0x20]
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	movs r4, 0x30
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _080F3890
	adds r0, r3, 0
	adds r0, 0xF
	strh r0, [r2, 0x20]
_080F3890:
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _080F38A0
	adds r0, r3, 0
	subs r0, 0xF
	strh r0, [r2, 0x20]
_080F38A0:
	ldrh r3, [r2, 0x22]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r4, 0x32
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _080F38B4
	adds r0, r3, 0
	adds r0, 0xA
	strh r0, [r2, 0x22]
_080F38B4:
	ldrh r3, [r2, 0x22]
	movs r4, 0x22
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _080F38CE
	adds r0, r3, 0
	subs r0, 0xA
	strh r0, [r2, 0x22]
	b _080F38CE
_080F38C6:
	movs r0, 0x1
	strh r0, [r2, 0x2E]
	ldr r0, _080F38D4 @ =nullsub_84
	str r0, [r2, 0x1C]
_080F38CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F38D4: .4byte nullsub_84
	thumb_func_end sub_80F3870

	thumb_func_start sub_80F38D8
sub_80F38D8: @ 80F38D8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x26]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r0, 0x78
	ble _080F38EE
	adds r0, r5, 0
	bl DestroySprite
	b _080F3926
_080F38EE:
	adds r0, r1, 0x1
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r4, [r5, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, 0x8
	ldr r1, _080F392C @ =gSineTable
	lsls r4, 1
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	muls r0, r1
	cmp r0, 0
	bge _080F391C
	adds r0, 0xFF
_080F391C:
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x4
	strh r0, [r5, 0x2E]
_080F3926:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F392C: .4byte gSineTable
	thumb_func_end sub_80F38D8

	thumb_func_start sub_80F3930
sub_80F3930: @ 80F3930
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x7
	ands r2, r0
	negs r2, r2
	ldr r0, _080F39A0 @ =gUnknown_840C384
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r4, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080F39A4 @ =gSprites
	adds r4, r1, r0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x11
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	bl Random
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	beq _080F39A8
	movs r0, 0
	b _080F39AA
	.align 2, 0
_080F39A0: .4byte gUnknown_840C384
_080F39A4: .4byte gSprites
_080F39A8:
	movs r0, 0x1
_080F39AA:
	strh r0, [r4, 0x30]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F3930

	.align 2, 0 @ Don't pad with nop.
