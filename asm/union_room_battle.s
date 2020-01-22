	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_811C04C
sub_811C04C: @ 811C04C
	push {r4-r7,lr}
	movs r0, 0xA
	bl sub_81173C0
	movs r4, 0
	movs r7, 0x64
	ldr r6, _0811C0CC @ =gPlayerParty
	ldr r5, _0811C0D0 @ =gEnemyParty
_0811C05C:
	ldr r0, _0811C0D4 @ =gSelectedOrderFromParty
	adds r0, r4, r0
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r0, 0
	muls r1, r7
	adds r1, r6
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x1
	cmp r4, 0x1
	ble _0811C05C
	ldr r4, _0811C0CC @ =gPlayerParty
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r4, r0
_0811C082:
	adds r0, r4, 0
	bl ZeroMonData
	adds r4, 0x64
	cmp r4, r5
	ble _0811C082
	ldr r4, _0811C0CC @ =gPlayerParty
	movs r5, 0
	adds r6, r4, 0
	adds r6, 0x64
_0811C096:
	ldr r1, _0811C0D0 @ =gEnemyParty
	adds r1, r5, r1
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r4, 0x64
	adds r5, 0x64
	cmp r4, r6
	ble _0811C096
	movs r0, 0x32
	bl IncrementGameStat
	bl CalculatePlayerPartyCount
	ldr r0, _0811C0D8 @ =gTrainerBattleOpponent_A
	movs r2, 0xC0
	lsls r2, 4
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _0811C0DC @ =CB2_InitBattle
	bl SetMainCallback2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811C0CC: .4byte gPlayerParty
_0811C0D0: .4byte gEnemyParty
_0811C0D4: .4byte gSelectedOrderFromParty
_0811C0D8: .4byte gTrainerBattleOpponent_A
_0811C0DC: .4byte CB2_InitBattle
	thumb_func_end sub_811C04C

	thumb_func_start sub_811C0E0
sub_811C0E0: @ 811C0E0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x18
	adds r5, r0, 0
	mov r10, r1
	adds r6, r2, 0
	ldr r4, [sp, 0x34]
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x1
	mov r8, r0
	ldr r1, _0811C14C @ =gUnknown_84571A8
	mov r9, r1
	ldrb r0, [r1]
	lsls r1, r0, 4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	str r3, [sp, 0x14]
	bl FillWindowPixelBuffer
	mov r0, r8
	str r0, [sp]
	str r0, [sp, 0x4]
	mov r1, r9
	str r1, [sp, 0x8]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	mov r0, r10
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r6, 0
	ldr r3, [sp, 0x14]
	bl AddTextPrinterParameterized4
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811C14C: .4byte gUnknown_84571A8
	thumb_func_end sub_811C0E0

	thumb_func_start sub_811C150
sub_811C150: @ 811C150
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0811C168
	cmp r0, 0x1
	beq _0811C196
	b _0811C1AA
_0811C168:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xD
	bl DrawTextBorderOuter
	str r5, [sp]
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
	bl sub_811C0E0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811C1AA
_0811C196:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0811C1AA
	strh r0, [r4]
	movs r0, 0x1
	b _0811C1AC
_0811C1AA:
	movs r0, 0
_0811C1AC:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_811C150

	thumb_func_start sub_811C1B4
sub_811C1B4: @ 811C1B4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_811C1B4

	thumb_func_start sub_811C1C8
sub_811C1C8: @ 811C1C8
	push {r4,lr}
	sub sp, 0xC
	ldr r1, _0811C1E8 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x33
	bls _0811C1DE
	b _0811C516
_0811C1DE:
	lsls r0, 2
	ldr r1, _0811C1EC @ =_0811C1F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811C1E8: .4byte gMain
_0811C1EC: .4byte _0811C1F0
	.align 2, 0
_0811C1F0:
	.4byte _0811C2C0
	.4byte _0811C364
	.4byte _0811C38C
	.4byte _0811C3B0
	.4byte _0811C400
	.4byte _0811C516
	.4byte _0811C4E4
	.4byte _0811C4C0
	.4byte _0811C4E4
	.4byte _0811C500
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C48C
	.4byte _0811C4A8
_0811C2C0:
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r4, _0811C350 @ =gUnknown_203B08C
	movs r0, 0x4
	bl AllocZeroed
	str r0, [r4]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0811C354 @ =gUnknown_8457194
	movs r0, 0
	movs r2, 0x1
	bl InitBgsFromTemplates
	bl ResetTempTileDataBuffers
	ldr r0, _0811C358 @ =gUnknown_8457198
	bl InitWindows
	lsls r0, 16
	cmp r0, 0
	bne _0811C300
	b _0811C52A
_0811C300:
	bl DeactivateAllTextPrinters
	movs r0, 0
	bl ClearWindowTilemap
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	bl Menu_LoadStdPal
	ldr r0, _0811C35C @ =sub_811C1B4
	bl SetVBlankCallback
	ldr r1, _0811C360 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _0811C4F2
	.align 2, 0
_0811C350: .4byte gUnknown_203B08C
_0811C354: .4byte gUnknown_8457194
_0811C358: .4byte gUnknown_8457198
_0811C35C: .4byte sub_811C1B4
_0811C360: .4byte gMain
_0811C364:
	ldr r0, _0811C380 @ =gUnknown_203B08C
	ldr r0, [r0]
	ldr r1, _0811C384 @ =gUnknown_841E538
	movs r2, 0
	bl sub_811C150
	cmp r0, 0
	bne _0811C376
	b _0811C516
_0811C376:
	ldr r1, _0811C388 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _0811C4F2
	.align 2, 0
_0811C380: .4byte gUnknown_203B08C
_0811C384: .4byte gUnknown_841E538
_0811C388: .4byte gMain
_0811C38C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	ldr r1, _0811C3AC @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _0811C4F2
	.align 2, 0
_0811C3AC: .4byte gMain
_0811C3B0:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _0811C3BC
	b _0811C516
_0811C3BC:
	ldr r4, _0811C3D8 @ =gBlockSendBuffer
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl memset
	ldr r0, _0811C3DC @ =gSelectedOrderFromParty
	ldrb r1, [r0]
	ldrb r0, [r0, 0x1]
	cmn r1, r0
	bne _0811C3E0
	movs r0, 0x52
	b _0811C3E2
	.align 2, 0
_0811C3D8: .4byte gBlockSendBuffer
_0811C3DC: .4byte gSelectedOrderFromParty
_0811C3E0:
	movs r0, 0x51
_0811C3E2:
	strb r0, [r4]
	ldr r1, _0811C3F8 @ =gBlockSendBuffer
	movs r0, 0
	movs r2, 0x20
	bl SendBlock
	ldr r1, _0811C3FC @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _0811C4F2
	.align 2, 0
_0811C3F8: .4byte gBlockSendBuffer
_0811C3FC: .4byte gMain
_0811C400:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0811C40E
	b _0811C516
_0811C40E:
	ldr r1, _0811C440 @ =gBlockRecvBuffer
	ldrh r0, [r1]
	cmp r0, 0x51
	bne _0811C448
	movs r2, 0x80
	lsls r2, 1
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0x51
	bne _0811C448
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0811C444 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x32
	b _0811C47E
	.align 2, 0
_0811C440: .4byte gBlockRecvBuffer
_0811C444: .4byte gMain
_0811C448:
	bl sub_800AAC0
	ldr r4, _0811C46C @ =gBlockRecvBuffer
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 16
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0x52
	bne _0811C474
	ldr r0, _0811C470 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r2
	movs r1, 0x6
	b _0811C47E
	.align 2, 0
_0811C46C: .4byte gBlockRecvBuffer
_0811C470: .4byte gMain
_0811C474:
	ldr r0, _0811C488 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x8
_0811C47E:
	strb r1, [r0]
	bl ResetBlockReceivedFlags
	b _0811C516
	.align 2, 0
_0811C488: .4byte gMain
_0811C48C:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0811C516
	bl sub_800AB9C
	ldr r1, _0811C4A4 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _0811C4F2
	.align 2, 0
_0811C4A4: .4byte gMain
_0811C4A8:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _0811C516
	ldr r0, _0811C4BC @ =sub_811C04C
	bl SetMainCallback2
	b _0811C516
	.align 2, 0
_0811C4BC: .4byte sub_811C04C
_0811C4C0:
	ldr r0, _0811C4D8 @ =gUnknown_203B08C
	ldr r0, [r0]
	ldr r1, _0811C4DC @ =gUnknown_841E58D
	movs r2, 0x1
	bl sub_811C150
	cmp r0, 0
	beq _0811C516
	ldr r0, _0811C4E0 @ =CB2_ReturnToField
	bl SetMainCallback2
	b _0811C516
	.align 2, 0
_0811C4D8: .4byte gUnknown_203B08C
_0811C4DC: .4byte gUnknown_841E58D
_0811C4E0: .4byte CB2_ReturnToField
_0811C4E4:
	ldr r0, _0811C4FC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811C516
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
_0811C4F2:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0811C516
	.align 2, 0
_0811C4FC: .4byte gReceivedRemoteLinkPlayers
_0811C500:
	ldr r0, _0811C534 @ =gUnknown_203B08C
	ldr r0, [r0]
	ldr r1, _0811C538 @ =gUnknown_841E572
	movs r2, 0x1
	bl sub_811C150
	cmp r0, 0
	beq _0811C516
	ldr r0, _0811C53C @ =CB2_ReturnToField
	bl SetMainCallback2
_0811C516:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
_0811C52A:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C534: .4byte gUnknown_203B08C
_0811C538: .4byte gUnknown_841E572
_0811C53C: .4byte CB2_ReturnToField
	thumb_func_end sub_811C1C8

	.align 2, 0 @ Don't pad with nop.
