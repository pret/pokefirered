	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_800FD9C
sub_800FD9C: @ 800FD9C
	push {r4,lr}
	bl MoveSaveBlocks_ResetHeap
	bl AllocateBattleResources
	bl AllocateBattleSpritesData
	bl AllocateMonSpritesGfx
	ldr r4, _0800FDCC @ =gBattleTypeFlags
	ldr r0, [r4]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800FDD8
	bl HandleLinkBattleSetup
	ldr r0, _0800FDD0 @ =sub_80109C8
	bl SetMainCallback2
	ldr r1, _0800FDD4 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1]
	b _0800FE1C
	.align 2, 0
_0800FDCC: .4byte gBattleTypeFlags
_0800FDD0: .4byte sub_80109C8
_0800FDD4: .4byte gBattleCommunication
_0800FDD8:
	bl sub_800FE24
	ldr r1, [r4]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0800FE1C
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800FE06
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0800FDFE
	movs r0, 0x19
	bl HelpSystem_SetSomeVariable2
	b _0800FE1C
_0800FDFE:
	movs r0, 0x18
	bl HelpSystem_SetSomeVariable2
	b _0800FE1C
_0800FE06:
	movs r0, 0x80
	ands r1, r0
	cmp r1, 0
	beq _0800FE16
	movs r0, 0x1A
	bl HelpSystem_SetSomeVariable2
	b _0800FE1C
_0800FE16:
	movs r0, 0x17
	bl HelpSystem_SetSomeVariable2
_0800FE1C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_800FD9C

	thumb_func_start sub_800FE24
sub_800FE24: @ 800FE24
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	str r0, [sp]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _0800FF28 @ =0x05006000
	mov r0, sp
	bl CpuSet
	movs r0, 0x4C
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	ldr r4, _0800FF2C @ =0x00005051
	movs r0, 0x44
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	ldr r1, _0800FF30 @ =gBattle_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	ldr r0, _0800FF34 @ =gBattle_WIN0V
	strh r4, [r0]
	bl ScanlineEffect_Clear
	ldr r0, _0800FF38 @ =gScanlineEffectRegBuffers
	movs r3, 0xF0
	movs r1, 0xF0
	lsls r1, 3
	adds r2, r0, r1
	movs r1, 0x4F
_0800FE88:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0800FE88
	movs r1, 0x50
	ldr r4, _0800FF3C @ =gUnknown_824EFE4
	ldr r0, _0800FF38 @ =gScanlineEffectRegBuffers
	ldr r3, _0800FF40 @ =0x0000ff10
	movs r5, 0x82
	lsls r5, 4
	adds r2, r0, r5
	adds r0, 0xA0
_0800FEA6:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	adds r1, 0x1
	cmp r1, 0x9F
	ble _0800FEA6
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	ldr r2, [r4, 0x8]
	bl ScanlineEffect_SetParams
	bl ResetPaletteFade
	ldr r0, _0800FF44 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0800FF48 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r0, _0800FF4C @ =gBattle_BG1_X
	strh r1, [r0]
	ldr r0, _0800FF50 @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _0800FF54 @ =gBattle_BG2_X
	strh r1, [r0]
	ldr r0, _0800FF58 @ =gBattle_BG2_Y
	strh r1, [r0]
	ldr r0, _0800FF5C @ =gBattle_BG3_X
	strh r1, [r0]
	ldr r0, _0800FF60 @ =gBattle_BG3_Y
	strh r1, [r0]
	bl sub_807FC5C
	ldr r1, _0800FF64 @ =gBattleTerrain
	strb r0, [r1]
	bl sub_800F34C
	bl LoadBattleTextboxAndBackground
	bl ResetSpriteData
	bl ResetTasks
	bl sub_800FAE0
	bl FreeAllSpritePalettes
	ldr r1, _0800FF68 @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _0800FF6C @ =VBlankCB_Battle
	bl SetVBlankCallback
	bl SetUpBattleVars
	ldr r0, _0800FF70 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800FF78
	ldr r0, _0800FF74 @ =sub_8010BA0
	bl SetMainCallback2
	b _0800FF7E
	.align 2, 0
_0800FF28: .4byte 0x05006000
_0800FF2C: .4byte 0x00005051
_0800FF30: .4byte gBattle_WIN0H
_0800FF34: .4byte gBattle_WIN0V
_0800FF38: .4byte gScanlineEffectRegBuffers
_0800FF3C: .4byte gUnknown_824EFE4
_0800FF40: .4byte 0x0000ff10
_0800FF44: .4byte gBattle_BG0_X
_0800FF48: .4byte gBattle_BG0_Y
_0800FF4C: .4byte gBattle_BG1_X
_0800FF50: .4byte gBattle_BG1_Y
_0800FF54: .4byte gBattle_BG2_X
_0800FF58: .4byte gBattle_BG2_Y
_0800FF5C: .4byte gBattle_BG3_X
_0800FF60: .4byte gBattle_BG3_Y
_0800FF64: .4byte gBattleTerrain
_0800FF68: .4byte gReservedSpritePaletteCount
_0800FF6C: .4byte VBlankCB_Battle
_0800FF70: .4byte gBattleTypeFlags
_0800FF74: .4byte sub_8010BA0
_0800FF78:
	ldr r0, _0800FFCC @ =sub_8010508
	bl SetMainCallback2
_0800FF7E:
	ldr r0, _0800FFD0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0800FF98
	ldr r0, _0800FFD4 @ =gEnemyParty
	ldr r1, _0800FFD8 @ =gTrainerBattleOpponent_A
	ldrh r1, [r1]
	bl sub_80112E0
	bl SetWildMonHeldItem
_0800FF98:
	ldr r0, _0800FFDC @ =gMain
	ldr r1, _0800FFE0 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldr r4, _0800FFE4 @ =gPlayerParty
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r4, r0
_0800FFAE:
	adds r0, r4, 0
	movs r1, 0x3
	bl AdjustFriendship
	adds r4, 0x64
	cmp r4, r5
	ble _0800FFAE
	movs r1, 0
	ldr r0, _0800FFE8 @ =gBattleCommunication
	strb r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800FFCC: .4byte sub_8010508
_0800FFD0: .4byte gBattleTypeFlags
_0800FFD4: .4byte gEnemyParty
_0800FFD8: .4byte gTrainerBattleOpponent_A
_0800FFDC: .4byte gMain
_0800FFE0: .4byte 0x00000439
_0800FFE4: .4byte gPlayerParty
_0800FFE8: .4byte gBattleCommunication
	thumb_func_end sub_800FE24

	thumb_func_start sub_800FFEC
sub_800FFEC: @ 800FFEC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	mov r9, r6
	movs r0, 0xCE
	lsls r0, 1
	mov r10, r0
	mov r8, r6
_08010002:
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _080100B0 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	adds r1, r0, 0
	cmp r5, 0
	beq _0801007E
	cmp r5, r10
	beq _0801004A
	cmp r7, 0
	beq _0801004A
	cmp r1, 0
	bne _0801004A
	movs r0, 0x1
	mov r2, r8
	lsls r0, r2
	orrs r6, r0
	lsls r0, r6, 16
	lsrs r6, r0, 16
_0801004A:
	cmp r5, 0
	beq _0801007E
	cmp r7, 0
	beq _08010066
	cmp r5, r10
	beq _0801005A
	cmp r1, 0
	beq _08010066
_0801005A:
	movs r0, 0x2
	mov r1, r8
	lsls r0, r1
	orrs r6, r0
	lsls r0, r6, 16
	lsrs r6, r0, 16
_08010066:
	cmp r5, 0
	beq _0801007E
	cmp r5, r10
	beq _0801007E
	cmp r7, 0
	bne _0801007E
	movs r0, 0x3
	mov r2, r8
	lsls r0, r2
	orrs r6, r0
	lsls r0, r6, 16
	lsrs r6, r0, 16
_0801007E:
	movs r0, 0x2
	add r8, r0
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	cmp r2, 0x5
	ble _08010002
	ldr r1, _080100B4 @ =gBattleStruct
	ldr r0, [r1]
	movs r2, 0xC3
	lsls r2, 1
	adds r0, r2
	strb r6, [r0]
	ldr r0, [r1]
	adds r2, 0x1
	adds r1, r0, r2
	lsrs r0, r6, 8
	strb r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080100B0: .4byte gPlayerParty
_080100B4: .4byte gBattleStruct
	thumb_func_end sub_800FFEC

	thumb_func_start sub_80100B8
sub_80100B8: @ 80100B8
	push {r4-r7,lr}
	ldr r0, _08010120 @ =gBattleStruct
	ldr r5, [r0]
	movs r0, 0xC4
	lsls r0, 1
	adds r4, r5, r0
	bl IsEnigmaBerryValid
	cmp r0, 0x1
	bne _08010134
	movs r2, 0
	ldr r7, _08010124 @ =gSaveBlock1Ptr
	movs r1, 0xC8
	lsls r1, 1
	adds r5, r1
	adds r6, r7, 0
	ldr r3, _08010128 @ =0x000030ec
_080100DA:
	adds r0, r4, r2
	ldr r1, [r6]
	adds r1, r3
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x5
	ble _080100DA
	adds r1, r4, r2
	movs r0, 0xFF
	strb r0, [r1]
	movs r2, 0
	adds r3, r5, 0
	ldr r6, _08010124 @ =gSaveBlock1Ptr
	ldr r5, _0801012C @ =0x00003108
_080100FA:
	adds r0, r3, r2
	ldr r1, [r6]
	adds r1, r5
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x11
	ble _080100FA
	ldr r0, [r7]
	ldr r1, _08010130 @ =0x0000311a
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4, 0x7]
	ldr r0, [r7]
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	b _08010174
	.align 2, 0
_08010120: .4byte gBattleStruct
_08010124: .4byte gSaveBlock1Ptr
_08010128: .4byte 0x000030ec
_0801012C: .4byte 0x00003108
_08010130: .4byte 0x0000311a
_08010134:
	movs r0, 0xAF
	bl ItemIdToBerryType
	lsls r0, 24
	lsrs r0, 24
	bl sub_809C8A0
	adds r3, r0, 0
	movs r2, 0
	movs r0, 0xC8
	lsls r0, 1
	adds r5, r0
_0801014C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x5
	ble _0801014C
	adds r1, r4, r2
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r5, 0
	movs r2, 0
	adds r1, r0, 0
	adds r1, 0x11
_08010168:
	strb r2, [r1]
	subs r1, 0x1
	cmp r1, r0
	bge _08010168
	movs r0, 0
	strb r0, [r4, 0x7]
_08010174:
	strb r0, [r4, 0x1A]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80100B8

	thumb_func_start sub_801017C
sub_801017C: @ 801017C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08010234 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08010194
	b _080102C0
_08010194:
	bl IsEnigmaBerryValid
	cmp r0, 0x1
	bne _08010250
	movs r5, 0
	ldr r3, _08010238 @ =gEnigmaBerries
	ldr r0, _0801023C @ =gSaveBlock1Ptr
	mov r8, r0
	adds r6, r3, 0
	mov r4, r8
	ldr r2, _08010240 @ =0x000030ec
	adds r7, r3, 0
	adds r7, 0x38
_080101AE:
	adds r1, r5, r6
	ldr r0, [r4]
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r5, r7
	ldr r0, [r4]
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r5, 0x1
	cmp r5, 0x5
	ble _080101AE
	adds r1, r5, r3
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r3, 0
	adds r0, 0x38
	adds r0, r5, r0
	movs r1, 0x1
	negs r1, r1
	strb r1, [r0]
	movs r5, 0
	adds r7, r3, 0
	adds r7, 0x8
	ldr r4, _0801023C @ =gSaveBlock1Ptr
	ldr r2, _08010244 @ =0x00003108
	adds r6, r3, 0
	adds r6, 0x40
_080101EC:
	adds r1, r5, r7
	ldr r0, [r4]
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r5, r6
	ldr r0, [r4]
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r5, 0x1
	cmp r5, 0x11
	ble _080101EC
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _08010248 @ =0x0000311a
	adds r0, r2
	ldrb r1, [r0]
	strb r1, [r3, 0x7]
	ldrb r0, [r0]
	adds r1, r3, 0
	adds r1, 0x3F
	strb r0, [r1]
	mov r4, r8
	ldr r0, [r4]
	ldr r1, _0801024C @ =0x0000311b
	adds r0, r1
	ldrb r1, [r0]
	strb r1, [r3, 0x1A]
	ldrb r1, [r0]
	adds r0, r3, 0
	adds r0, 0x52
	strb r1, [r0]
	b _080103FC
	.align 2, 0
_08010234: .4byte gBattleTypeFlags
_08010238: .4byte gEnigmaBerries
_0801023C: .4byte gSaveBlock1Ptr
_08010240: .4byte 0x000030ec
_08010244: .4byte 0x00003108
_08010248: .4byte 0x0000311a
_0801024C: .4byte 0x0000311b
_08010250:
	movs r0, 0xAF
	bl ItemIdToBerryType
	lsls r0, 24
	lsrs r0, 24
	bl sub_809C8A0
	adds r6, r0, 0
	movs r5, 0
	ldr r4, _080102BC @ =gEnigmaBerries
	adds r7, r4, 0
	adds r7, 0x38
	adds r3, r4, 0
_0801026A:
	adds r1, r5, r4
	adds r2, r6, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r1, r5, r7
	ldrb r0, [r2]
	strb r0, [r1]
	adds r5, 0x1
	cmp r5, 0x5
	ble _0801026A
	adds r1, r5, r3
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r3, 0
	adds r0, 0x38
	adds r0, r5, r0
	movs r1, 0x1
	negs r1, r1
	strb r1, [r0]
	movs r5, 0
	adds r4, r3, 0
	adds r4, 0x8
	movs r1, 0
	adds r2, r3, 0
	adds r2, 0x40
_0801029C:
	adds r0, r5, r4
	strb r1, [r0]
	adds r0, r5, r2
	strb r1, [r0]
	adds r5, 0x1
	cmp r5, 0x11
	ble _0801029C
	movs r1, 0
	strb r1, [r3, 0x7]
	adds r0, r3, 0
	adds r0, 0x3F
	strb r1, [r0]
	strb r1, [r3, 0x1A]
	adds r0, 0x13
	strb r1, [r0]
	b _080103FC
	.align 2, 0
_080102BC: .4byte gEnigmaBerries
_080102C0:
	movs r0, 0x40
	ands r1, r0
	cmp r1, 0
	beq _0801034C
	movs r5, 0
	ldr r3, _08010340 @ =gEnigmaBerries
	ldr r2, _08010344 @ =gLinkPlayers
	mov r9, r2
	adds r6, r3, 0
	movs r4, 0x8
	adds r4, r6
	mov r8, r4
_080102D8:
	lsls r0, r5, 8
	ldr r1, _08010348 @ =gBlockRecvBuffer + 4
	adds r7, r0, r1
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r9
	ldrb r3, [r0, 0x18]
	movs r4, 0
	adds r5, 0x1
	mov r10, r5
	lsls r1, r3, 3
	subs r0, r1, r3
	adds r5, r1, 0
	lsls r0, 2
	adds r1, r0, r6
_080102F8:
	adds r0, r7, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, 0x1
	adds r4, 0x1
	cmp r4, 0x5
	ble _080102F8
	subs r0, r5, r3
	lsls r0, 2
	adds r1, r4, r0
	adds r1, r6
	movs r2, 0xFF
	strb r2, [r1]
	movs r4, 0
	mov r2, r8
	adds r1, r0, r2
	adds r2, r7, 0
	adds r2, 0x8
_0801031C:
	adds r0, r2, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, 0x1
	adds r4, 0x1
	cmp r4, 0x11
	ble _0801031C
	subs r0, r5, r3
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r7, 0x7]
	strb r1, [r0, 0x7]
	ldrb r1, [r7, 0x1A]
	strb r1, [r0, 0x1A]
	mov r5, r10
	cmp r5, 0x3
	ble _080102D8
	b _080103FC
	.align 2, 0
_08010340: .4byte gEnigmaBerries
_08010344: .4byte gLinkPlayers
_08010348: .4byte gBlockRecvBuffer + 4
_0801034C:
	movs r5, 0
	ldr r4, _0801040C @ =gEnigmaBerries
	mov r9, r4
_08010352:
	lsls r0, r5, 8
	ldr r1, _08010410 @ =gBlockRecvBuffer + 4
	adds r7, r0, r1
	movs r4, 0
	adds r2, r5, 0x1
	mov r10, r2
	lsls r0, r5, 3
	mov r8, r0
	adds r1, r5, 0x2
	mov r12, r1
	subs r1, r0, r5
	mov r2, r12
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r2, r9
	adds r3, r0, r2
	lsls r1, 2
	adds r2, r1, r2
_08010378:
	adds r0, r7, r4
	ldrb r1, [r0]
	strb r1, [r2]
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	adds r4, 0x1
	cmp r4, 0x5
	ble _08010378
	mov r0, r8
	subs r3, r0, r5
	lsls r3, 2
	adds r1, r4, r3
	add r1, r9
	ldrb r0, [r1]
	movs r2, 0xFF
	orrs r0, r2
	strb r0, [r1]
	mov r0, r12
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	adds r1, r4, r2
	add r1, r9
	ldrb r0, [r1]
	movs r4, 0xFF
	orrs r0, r4
	strb r0, [r1]
	movs r4, 0
	ldr r0, _0801040C @ =gEnigmaBerries
	adds r0, 0x8
	adds r2, r0
	adds r3, r0
	adds r6, r7, 0
	adds r6, 0x8
_080103C0:
	adds r0, r6, r4
	ldrb r1, [r0]
	strb r1, [r3]
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, 0x1
	adds r3, 0x1
	adds r4, 0x1
	cmp r4, 0x11
	ble _080103C0
	mov r0, r8
	subs r2, r0, r5
	lsls r2, 2
	add r2, r9
	ldrb r0, [r7, 0x7]
	strb r0, [r2, 0x7]
	mov r1, r12
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r7, 0x7]
	strb r1, [r0, 0x7]
	ldrb r1, [r7, 0x1A]
	strb r1, [r2, 0x1A]
	ldrb r1, [r7, 0x1A]
	strb r1, [r0, 0x1A]
	mov r5, r10
	cmp r5, 0x1
	ble _08010352
_080103FC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801040C: .4byte gEnigmaBerries
_08010410: .4byte gBlockRecvBuffer + 4
	thumb_func_end sub_801017C

	thumb_func_start sub_8010414
sub_8010414: @ 8010414
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	movs r6, 0
	ldr r0, _08010440 @ =gBlockRecvBuffer
	ldrh r2, [r0]
	movs r1, 0x80
	lsls r1, 1
	mov r12, r0
	cmp r2, r1
	bne _08010458
	cmp r3, 0
	bne _08010448
	ldr r0, _08010444 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r2, 0xC
	b _0801044E
	.align 2, 0
_08010440: .4byte gBlockRecvBuffer
_08010444: .4byte gBattleTypeFlags
_08010448:
	ldr r0, _0801048C @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r2, 0x8
_0801044E:
	orrs r1, r2
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08010458:
	cmp r6, 0
	bne _080104FC
	movs r2, 0
	cmp r2, r4
	bge _0801047C
	ldr r1, _08010490 @ =gBlockRecvBuffer
	mov r8, r1
	movs r5, 0x80
	lsls r5, 1
_0801046A:
	adds r1, r5
	adds r2, 0x1
	cmp r2, r4
	bge _0801047C
	mov r7, r8
	ldrh r0, [r7]
	ldrh r7, [r1]
	cmp r0, r7
	beq _0801046A
_0801047C:
	cmp r2, r4
	bne _080104A4
	cmp r3, 0
	bne _08010494
	ldr r0, _0801048C @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r2, 0xC
	b _0801049A
	.align 2, 0
_0801048C: .4byte gBattleTypeFlags
_08010490: .4byte gBlockRecvBuffer
_08010494:
	ldr r0, _080104EC @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r2, 0x8
_0801049A:
	orrs r1, r2
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080104A4:
	cmp r6, 0
	bne _080104FC
	movs r2, 0
	ldr r5, _080104EC @ =gBattleTypeFlags
	cmp r2, r4
	bge _080104E2
	mov r0, r12
	ldrh r1, [r0]
	ldr r0, _080104F0 @ =0x00000201
	cmp r1, r0
	beq _080104DA
_080104BA:
	lsls r0, r2, 8
	add r0, r12
	ldrh r0, [r0]
	ldr r1, _080104F0 @ =0x00000201
	cmp r0, r1
	bls _080104CA
	cmp r2, r3
	bne _080104E2
_080104CA:
	adds r2, 0x1
	cmp r2, r4
	bge _080104E2
	lsls r0, r2, 8
	add r0, r12
	ldrh r0, [r0]
	cmp r0, r1
	bne _080104BA
_080104DA:
	cmp r2, r3
	beq _080104BA
	cmp r2, r3
	bge _080104BA
_080104E2:
	cmp r2, r4
	bne _080104F4
	ldr r0, [r5]
	movs r1, 0xC
	b _080104F8
	.align 2, 0
_080104EC: .4byte gBattleTypeFlags
_080104F0: .4byte 0x00000201
_080104F4:
	ldr r0, [r5]
	movs r1, 0x8
_080104F8:
	orrs r0, r1
	str r0, [r5]
_080104FC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8010414

	thumb_func_start sub_8010508
sub_8010508: @ 8010508
	push {r4-r6,lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08010540 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	strb r4, [r0]
	movs r0, 0x1
	adds r5, r4, 0
	eors r5, r0
	ldr r0, _08010544 @ =gBattleCommunication
	ldrb r0, [r0]
	cmp r0, 0x10
	bls _08010536
	b _080108B8
_08010536:
	lsls r0, 2
	ldr r1, _08010548 @ =_0801054C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010540: .4byte gBattleStruct
_08010544: .4byte gBattleCommunication
_08010548: .4byte _0801054C
	.align 2, 0
_0801054C:
	.4byte _08010590
	.4byte _080105D4
	.4byte _08010670
	.4byte _080106F4
	.4byte _0801071C
	.4byte _08010898
	.4byte _080108A4
	.4byte _0801074C
	.4byte _08010774
	.4byte _08010898
	.4byte _080108A4
	.4byte _080107A4
	.4byte _080107CC
	.4byte _08010898
	.4byte _080108A4
	.4byte _08010834
	.4byte _0801084C
_08010590:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _080105BC
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	bl sub_80357C8
	ldr r1, _080105CC @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1]
_080105BC:
	ldr r0, _080105D0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _080105C6
	b _080108B8
_080105C6:
	bl LoadWirelessStatusIndicatorSpriteGfx
	b _080108B8
	.align 2, 0
_080105CC: .4byte gBattleCommunication
_080105D0: .4byte gWirelessCommType
_080105D4:
	ldr r2, _08010640 @ =gBattleTypeFlags
	ldr r1, [r2]
	movs r6, 0x2
	adds r0, r1, 0
	ands r0, r6
	cmp r0, 0
	beq _08010658
	ldr r0, _08010644 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080105EC
	b _080108B8
_080105EC:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _0801062A
	ldr r4, _08010648 @ =gBattleStruct
	ldr r0, [r4]
	movs r5, 0xC2
	lsls r5, 1
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _0801064C @ =0x00000185
	adds r0, r1
	strb r6, [r0]
	bl sub_800FFEC
	bl sub_80100B8
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, r5
	movs r2, 0x20
	bl SendBlock
	ldr r0, _08010650 @ =gBattleCommunication
	strb r6, [r0]
_0801062A:
	ldr r0, _08010654 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _08010634
	b _080108B8
_08010634:
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
	b _080108B8
	.align 2, 0
_08010640: .4byte gBattleTypeFlags
_08010644: .4byte gReceivedRemoteLinkPlayers
_08010648: .4byte gBattleStruct
_0801064C: .4byte 0x00000185
_08010650: .4byte gBattleCommunication
_08010654: .4byte gWirelessCommType
_08010658:
	movs r0, 0x4
	orrs r1, r0
	str r1, [r2]
	ldr r1, _0801066C @ =gBattleCommunication
	movs r0, 0xF
	strb r0, [r1]
	bl sub_801017C
	b _080108B8
	.align 2, 0
_0801066C: .4byte gBattleCommunication
_08010670:
	bl GetBlockReceivedStatus
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x3
	beq _0801067E
	b _080108B8
_0801067E:
	bl ResetBlockReceivedFlags
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_8010414
	bl sub_801017C
	ldr r0, _080106E0 @ =sub_800F6FC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080106E4 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	movs r1, 0
	movs r0, 0x87
	lsls r0, 1
	strh r0, [r2, 0xA]
	movs r0, 0x5A
	strh r0, [r2, 0xC]
	strh r1, [r2, 0x12]
	ldr r0, _080106E8 @ =gBattleStruct
	ldr r3, [r0]
	movs r4, 0xC3
	lsls r4, 1
	adds r0, r3, r4
	ldrb r1, [r0]
	adds r4, 0x1
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2, 0xE]
	ldr r0, _080106EC @ =gBlockRecvBuffer
	lsls r1, r5, 8
	adds r0, 0x2
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2, 0x10]
	bl SetDeoxysStats
	ldr r1, _080106F0 @ =gBattleCommunication
	b _080108B2
	.align 2, 0
_080106E0: .4byte sub_800F6FC
_080106E4: .4byte gTasks
_080106E8: .4byte gBattleStruct
_080106EC: .4byte gBlockRecvBuffer
_080106F0: .4byte gBattleCommunication
_080106F4:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _08010700
	b _080108B8
_08010700:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08010714 @ =gPlayerParty
	movs r2, 0xC8
	bl SendBlock
	ldr r1, _08010718 @ =gBattleCommunication
	b _080108B2
	.align 2, 0
_08010714: .4byte gPlayerParty
_08010718: .4byte gBattleCommunication
_0801071C:
	bl GetBlockReceivedStatus
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x3
	beq _0801072A
	b _080108B8
_0801072A:
	bl ResetBlockReceivedFlags
	ldr r0, _08010740 @ =gEnemyParty
	lsls r1, r5, 8
	ldr r2, _08010744 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0xC8
	bl memcpy
	ldr r1, _08010748 @ =gBattleCommunication
	b _080108B2
	.align 2, 0
_08010740: .4byte gEnemyParty
_08010744: .4byte gBlockRecvBuffer
_08010748: .4byte gBattleCommunication
_0801074C:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _08010758
	b _080108B8
_08010758:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0801076C @ =gUnknown_202434C
	movs r2, 0xC8
	bl SendBlock
	ldr r1, _08010770 @ =gBattleCommunication
	b _080108B2
	.align 2, 0
_0801076C: .4byte gUnknown_202434C
_08010770: .4byte gBattleCommunication
_08010774:
	bl GetBlockReceivedStatus
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x3
	beq _08010782
	b _080108B8
_08010782:
	bl ResetBlockReceivedFlags
	ldr r0, _08010798 @ =gUnknown_20240F4
	lsls r1, r5, 8
	ldr r2, _0801079C @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0xC8
	bl memcpy
	ldr r1, _080107A0 @ =gBattleCommunication
	b _080108B2
	.align 2, 0
_08010798: .4byte gUnknown_20240F4
_0801079C: .4byte gBlockRecvBuffer
_080107A0: .4byte gBattleCommunication
_080107A4:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _080107B0
	b _080108B8
_080107B0:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080107C4 @ =gUnknown_2024414
	movs r2, 0xC8
	bl SendBlock
	ldr r1, _080107C8 @ =gBattleCommunication
	b _080108B2
	.align 2, 0
_080107C4: .4byte gUnknown_2024414
_080107C8: .4byte gBattleCommunication
_080107CC:
	bl GetBlockReceivedStatus
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x3
	bne _080108B8
	bl ResetBlockReceivedFlags
	ldr r4, _08010820 @ =gUnknown_20241BC
	lsls r1, r5, 8
	ldr r0, _08010824 @ =gBlockRecvBuffer
	adds r1, r0
	adds r0, r4, 0
	movs r2, 0xC8
	bl memcpy
	ldr r1, _08010828 @ =0xfffffe70
	adds r0, r4, r1
	bl sub_8011D0C
	ldr r1, _0801082C @ =0xfffffed4
	adds r0, r4, r1
	bl sub_8011D0C
	adds r0, r4, 0
	subs r0, 0xC8
	bl sub_8011D0C
	adds r0, r4, 0
	subs r0, 0x64
	bl sub_8011D0C
	adds r0, r4, 0
	bl sub_8011D0C
	adds r0, r4, 0
	adds r0, 0x64
	bl sub_8011D0C
	ldr r1, _08010830 @ =gBattleCommunication
	b _080108B2
	.align 2, 0
_08010820: .4byte gUnknown_20241BC
_08010824: .4byte gBlockRecvBuffer
_08010828: .4byte 0xfffffe70
_0801082C: .4byte 0xfffffed4
_08010830: .4byte gBattleCommunication
_08010834:
	bl sub_800D30C
	ldr r0, _08010848 @ =gBattleCommunication
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	strb r2, [r0, 0x1]
	strb r2, [r0, 0x2]
	b _080108B8
	.align 2, 0
_08010848: .4byte gBattleCommunication
_0801084C:
	ldr r0, _08010880 @ =gUnknown_2023E83
	adds r1, r0, 0x1
	bl BattleInitAllSprites
	lsls r0, 24
	cmp r0, 0
	beq _080108B8
	ldr r2, _08010884 @ =gPreBattleCallback1
	ldr r1, _08010888 @ =gMain
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0801088C @ =sub_80123E4
	str r0, [r1]
	ldr r0, _08010890 @ =BattleMainCB2
	bl SetMainCallback2
	ldr r2, _08010894 @ =gBattleTypeFlags
	ldr r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080108B8
	movs r0, 0x20
	orrs r1, r0
	str r1, [r2]
	b _080108B8
	.align 2, 0
_08010880: .4byte gUnknown_2023E83
_08010884: .4byte gPreBattleCallback1
_08010888: .4byte gMain
_0801088C: .4byte sub_80123E4
_08010890: .4byte BattleMainCB2
_08010894: .4byte gBattleTypeFlags
_08010898:
	ldr r0, _080108C0 @ =gBattleCommunication
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r1, 0x1
	strb r1, [r0, 0x1]
_080108A4:
	ldr r1, _080108C0 @ =gBattleCommunication
	ldrb r0, [r1, 0x1]
	subs r0, 0x1
	strb r0, [r1, 0x1]
	lsls r0, 24
	cmp r0, 0
	bne _080108B8
_080108B2:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080108B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080108C0: .4byte gBattleCommunication
	thumb_func_end sub_8010508

	thumb_func_start sub_80108C4
sub_80108C4: @ 80108C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r8, r0
	ldr r1, _080109BC @ =gUnknown_2022B58
	mov r9, r1
	movs r0, 0x18
	add r0, r9
	mov r10, r0
_080108DC:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	ldr r0, _080109C0 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, r8
	lsls r5, r1, 5
	mov r1, r9
	adds r6, r5, r1
	strh r0, [r6]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	strh r0, [r6, 0x2]
	mov r0, r9
	adds r0, 0x4
	adds r7, r5, r0
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r7, 0
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	strb r0, [r6, 0xF]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r6, 0x10]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r6, 0x12]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	mov r1, r9
	adds r1, 0x14
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	add r5, r10
	str r0, [r5]
	adds r0, r4, 0
	bl GetMonGender
	strb r0, [r6, 0x1C]
	adds r0, r7, 0
	bl StripExtCtrlCodes
	adds r0, r4, 0
	movs r1, 0x3
	bl GetMonData
	mov r4, r8
	adds r4, 0x1
	cmp r0, 0x1
	beq _08010994
	adds r2, r7, 0
	movs r1, 0
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _0801097E
_08010974:
	adds r1, 0x1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08010974
_0801097E:
	cmp r1, 0x5
	bgt _0801098E
	movs r3, 0
_08010984:
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0x5
	ble _08010984
_0801098E:
	adds r1, r2, r1
	movs r0, 0xFF
	strb r0, [r1]
_08010994:
	mov r8, r4
	cmp r4, 0x2
	ble _080108DC
	ldr r0, _080109C4 @ =gBattleStruct
	ldr r0, [r0]
	movs r1, 0xC2
	lsls r1, 1
	adds r0, r1
	ldr r1, _080109BC @ =gUnknown_2022B58
	movs r2, 0x60
	bl memcpy
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080109BC: .4byte gUnknown_2022B58
_080109C0: .4byte gPlayerParty
_080109C4: .4byte gBattleStruct
	thumb_func_end sub_80108C4

	thumb_func_start sub_80109C8
sub_80109C8: @ 80109C8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _08010A0C @ =gBattleStruct
	ldr r0, [r4]
	adds r0, 0xB5
	strb r6, [r0]
	ldr r0, [r4]
	movs r1, 0xB0
	adds r1, r0
	mov r9, r1
	adds r0, 0xAE
	mov r8, r0
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r5, _08010A10 @ =gBattleCommunication
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _08010A5C
	cmp r0, 0x1
	bgt _08010A14
	cmp r0, 0
	beq _08010A20
	b _08010B82
	.align 2, 0
_08010A0C: .4byte gBattleStruct
_08010A10: .4byte gBattleCommunication
_08010A14:
	cmp r0, 0x2
	beq _08010AFC
	cmp r0, 0x3
	bne _08010A1E
	b _08010B2A
_08010A1E:
	b _08010B82
_08010A20:
	ldr r0, _08010A58 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08010A2A
	b _08010B82
_08010A2A:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _08010A36
	b _08010B82
_08010A36:
	bl sub_80108C4
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	movs r2, 0xC2
	lsls r2, 1
	adds r1, r2
	movs r2, 0x60
	bl SendBlock
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08010B82
	.align 2, 0
_08010A58: .4byte gReceivedRemoteLinkPlayers
_08010A5C:
	bl GetBlockReceivedStatus
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0xF
	beq _08010A6A
	b _08010B82
_08010A6A:
	bl ResetBlockReceivedFlags
	movs r4, 0
	lsls r0, r6, 3
	subs r0, r6
	lsls r5, r0, 2
	movs r7, 0
_08010A78:
	cmp r4, r6
	beq _08010ABA
	ldr r2, _08010A9C @ =gLinkPlayers
	adds r0, r7, r2
	ldrh r1, [r0, 0x18]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08010AA0
	adds r0, r5, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08010AAC
	b _08010ABA
	.align 2, 0
_08010A9C: .4byte gLinkPlayers
_08010AA0:
	adds r0, r5, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08010ABA
_08010AAC:
	lsls r1, r4, 8
	ldr r0, _08010AE4 @ =gBlockRecvBuffer
	adds r1, r0
	ldr r0, _08010AE8 @ =gUnknown_2022B58
	movs r2, 0x60
	bl memcpy
_08010ABA:
	adds r7, 0x1C
	adds r4, 0x1
	cmp r4, 0x3
	ble _08010A78
	ldr r1, _08010AEC @ =gBattleCommunication
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _08010AF0 @ =gMain
	ldr r0, [r1, 0x8]
	mov r2, r9
	str r0, [r2]
	ldr r0, _08010AF4 @ =gBattleTypeFlags
	ldr r0, [r0]
	mov r2, r8
	strh r0, [r2]
	ldr r0, _08010AF8 @ =sub_80109C8
	str r0, [r1, 0x8]
	bl sub_8128198
	b _08010B82
	.align 2, 0
_08010AE4: .4byte gBlockRecvBuffer
_08010AE8: .4byte gUnknown_2022B58
_08010AEC: .4byte gBattleCommunication
_08010AF0: .4byte gMain
_08010AF4: .4byte gBattleTypeFlags
_08010AF8: .4byte sub_80109C8
_08010AFC:
	ldr r0, _08010B1C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08010B82
	movs r0, 0x3
	strb r0, [r5]
	ldr r0, _08010B20 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08010B24
	bl sub_800AB9C
	b _08010B82
	.align 2, 0
_08010B1C: .4byte gPaletteFade
_08010B20: .4byte gWirelessCommType
_08010B24:
	bl sub_800AAC0
	b _08010B82
_08010B2A:
	ldr r0, _08010B54 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08010B64
	bl IsRfuTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08010B82
	ldr r1, _08010B58 @ =gBattleTypeFlags
	mov r2, r8
	ldrh r0, [r2]
	str r0, [r1]
	ldr r1, _08010B5C @ =gMain
	mov r2, r9
	ldr r0, [r2]
	str r0, [r1, 0x8]
	ldr r0, _08010B60 @ =sub_800FE24
	bl SetMainCallback2
	b _08010B82
	.align 2, 0
_08010B54: .4byte gWirelessCommType
_08010B58: .4byte gBattleTypeFlags
_08010B5C: .4byte gMain
_08010B60: .4byte sub_800FE24
_08010B64:
	ldr r0, _08010B90 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08010B82
	ldr r1, _08010B94 @ =gBattleTypeFlags
	mov r2, r8
	ldrh r0, [r2]
	str r0, [r1]
	ldr r1, _08010B98 @ =gMain
	mov r2, r9
	ldr r0, [r2]
	str r0, [r1, 0x8]
	ldr r0, _08010B9C @ =sub_800FE24
	bl SetMainCallback2
_08010B82:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010B90: .4byte gReceivedRemoteLinkPlayers
_08010B94: .4byte gBattleTypeFlags
_08010B98: .4byte gMain
_08010B9C: .4byte sub_800FE24
	thumb_func_end sub_80109C8

	thumb_func_start sub_8010BA0
sub_8010BA0: @ 8010BA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08010BD8 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	strb r7, [r0]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08010BDC @ =gBattleCommunication
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _08010BCC
	b _080110F0
_08010BCC:
	lsls r0, 2
	ldr r1, _08010BE0 @ =_08010BE4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010BD8: .4byte gBattleStruct
_08010BDC: .4byte gBattleCommunication
_08010BE0: .4byte _08010BE4
	.align 2, 0
_08010BE4:
	.4byte _08010C18
	.4byte _08010C5C
	.4byte _08010CD4
	.4byte _08010DB6
	.4byte _08010DE0
	.4byte _080110D0
	.4byte _080110DC
	.4byte _08010ED8
	.4byte _08010F00
	.4byte _080110D0
	.4byte _080110DC
	.4byte _0801106C
	.4byte _08011084
_08010C18:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08010C44
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	bl sub_80357C8
	ldr r1, _08010C54 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1]
_08010C44:
	ldr r0, _08010C58 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _08010C4E
	b _080110F0
_08010C4E:
	bl LoadWirelessStatusIndicatorSpriteGfx
	b _080110F0
	.align 2, 0
_08010C54: .4byte gBattleCommunication
_08010C58: .4byte gWirelessCommType
_08010C5C:
	ldr r0, _08010CC0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08010C66
	b _080110F0
_08010C66:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08010CAA
	ldr r4, _08010CC4 @ =gBattleStruct
	ldr r0, [r4]
	movs r5, 0xC2
	lsls r5, 1
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r4]
	ldr r2, _08010CC8 @ =0x00000185
	adds r1, r0, r2
	movs r0, 0x2
	strb r0, [r1]
	bl sub_800FFEC
	bl sub_80100B8
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, r5
	movs r2, 0x20
	bl SendBlock
	ldr r1, _08010CCC @ =gBattleCommunication
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08010CAA:
	ldr r0, _08010CD0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _08010CB4
	b _080110F0
_08010CB4:
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
	b _080110F0
	.align 2, 0
_08010CC0: .4byte gReceivedRemoteLinkPlayers
_08010CC4: .4byte gBattleStruct
_08010CC8: .4byte 0x00000185
_08010CCC: .4byte gBattleCommunication
_08010CD0: .4byte gWirelessCommType
_08010CD4:
	bl GetBlockReceivedStatus
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0xF
	beq _08010CE2
	b _080110F0
_08010CE2:
	bl ResetBlockReceivedFlags
	movs r0, 0x4
	adds r1, r7, 0
	bl sub_8010414
	bl sub_801017C
	bl SetDeoxysStats
	ldr r0, _08010D4C @ =gDecompressionBuffer
	ldr r1, _08010D50 @ =gPlayerParty
	movs r2, 0x96
	lsls r2, 1
	bl memcpy
	ldr r0, _08010D54 @ =sub_800F6FC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08010D58 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x87
	lsls r0, 1
	strh r0, [r1, 0xA]
	movs r0, 0x5A
	strh r0, [r1, 0xC]
	strh r2, [r1, 0x12]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
	adds r2, r1, 0
	ldr r0, _08010D5C @ =gBlockRecvBuffer
	adds r3, r0, 0x2
	ldr r5, _08010D60 @ =gLinkPlayers
	movs r4, 0x3F
	movs r7, 0x80
	lsls r7, 1
	movs r6, 0x3
_08010D3A:
	ldrh r0, [r5, 0x18]
	cmp r0, 0x1
	beq _08010D76
	cmp r0, 0x1
	bgt _08010D64
	cmp r0, 0
	beq _08010D6E
	b _08010D9C
	.align 2, 0
_08010D4C: .4byte gDecompressionBuffer
_08010D50: .4byte gPlayerParty
_08010D54: .4byte sub_800F6FC
_08010D58: .4byte gTasks
_08010D5C: .4byte gBlockRecvBuffer
_08010D60: .4byte gLinkPlayers
_08010D64:
	cmp r0, 0x2
	beq _08010D7E
	cmp r0, 0x3
	beq _08010D8E
	b _08010D9C
_08010D6E:
	ldrh r0, [r3]
	adds r1, r4, 0
	ands r1, r0
	b _08010D86
_08010D76:
	ldrh r0, [r3]
	adds r1, r4, 0
	ands r1, r0
	b _08010D96
_08010D7E:
	ldrh r0, [r3]
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 6
_08010D86:
	ldrh r0, [r2, 0xE]
	orrs r1, r0
	strh r1, [r2, 0xE]
	b _08010D9C
_08010D8E:
	ldrh r0, [r3]
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 6
_08010D96:
	ldrh r0, [r2, 0x10]
	orrs r1, r0
	strh r1, [r2, 0x10]
_08010D9C:
	adds r3, r7
	adds r5, 0x1C
	subs r6, 0x1
	cmp r6, 0
	bge _08010D3A
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	ldr r1, _08010DD8 @ =gBattleCommunication
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08010DB6:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _08010DC2
	b _080110F0
_08010DC2:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08010DDC @ =gDecompressionBuffer
	movs r2, 0xC8
	bl SendBlock
	ldr r1, _08010DD8 @ =gBattleCommunication
	b _080110EA
	.align 2, 0
_08010DD8: .4byte gBattleCommunication
_08010DDC: .4byte gDecompressionBuffer
_08010DE0:
	bl GetBlockReceivedStatus
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0xF
	beq _08010DEE
	b _080110F0
_08010DEE:
	bl ResetBlockReceivedFlags
	movs r6, 0
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	mov r8, r0
	ldr r4, _08010E18 @ =gBlockRecvBuffer
	movs r5, 0
_08010E00:
	cmp r6, r7
	bne _08010E34
	ldr r0, _08010E1C @ =gLinkPlayers
	adds r0, r5, r0
	ldrh r0, [r0, 0x18]
	cmp r0, 0x2
	bgt _08010E20
	cmp r0, 0x1
	bge _08010E2C
	cmp r0, 0
	beq _08010E24
	b _08010EBE
	.align 2, 0
_08010E18: .4byte gBlockRecvBuffer
_08010E1C: .4byte gLinkPlayers
_08010E20:
	cmp r0, 0x3
	bne _08010EBE
_08010E24:
	ldr r0, _08010E28 @ =gPlayerParty
	b _08010EA4
	.align 2, 0
_08010E28: .4byte gPlayerParty
_08010E2C:
	ldr r0, _08010E30 @ =gUnknown_20243B0
	b _08010EA4
	.align 2, 0
_08010E30: .4byte gUnknown_20243B0
_08010E34:
	ldr r2, _08010E54 @ =gLinkPlayers
	adds r0, r5, r2
	ldrh r1, [r0, 0x18]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08010E58
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08010E66
	b _08010E8C
	.align 2, 0
_08010E54: .4byte gLinkPlayers
_08010E58:
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08010E8C
_08010E66:
	adds r0, r5, r2
	ldrh r2, [r0, 0x18]
	cmp r2, 0x2
	bgt _08010E78
	cmp r2, 0x1
	bge _08010E84
	cmp r2, 0
	beq _08010E7C
	b _08010EBE
_08010E78:
	cmp r2, 0x3
	bne _08010EBE
_08010E7C:
	ldr r0, _08010E80 @ =gPlayerParty
	b _08010EA4
	.align 2, 0
_08010E80: .4byte gPlayerParty
_08010E84:
	ldr r0, _08010E88 @ =gUnknown_20243B0
	b _08010EA4
	.align 2, 0
_08010E88: .4byte gUnknown_20243B0
_08010E8C:
	adds r0, r5, r2
	ldrh r2, [r0, 0x18]
	cmp r2, 0x2
	bgt _08010E9E
	cmp r2, 0x1
	bge _08010EB4
	cmp r2, 0
	beq _08010EA2
	b _08010EBE
_08010E9E:
	cmp r2, 0x3
	bne _08010EBE
_08010EA2:
	ldr r0, _08010EB0 @ =gEnemyParty
_08010EA4:
	adds r1, r4, 0
	movs r2, 0xC8
	bl memcpy
	b _08010EBE
	.align 2, 0
_08010EB0: .4byte gEnemyParty
_08010EB4:
	ldr r0, _08010ED0 @ =gUnknown_2024158
	adds r1, r4, 0
	movs r2, 0xC8
	bl memcpy
_08010EBE:
	movs r2, 0x80
	lsls r2, 1
	adds r4, r2
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _08010E00
	ldr r1, _08010ED4 @ =gBattleCommunication
	b _080110EA
	.align 2, 0
_08010ED0: .4byte gUnknown_2024158
_08010ED4: .4byte gBattleCommunication
_08010ED8:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _08010EE4
	b _080110F0
_08010EE4:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08010EF8 @ =gDecompressionBuffer + 0x0C8
	movs r2, 0x64
	bl SendBlock
	ldr r1, _08010EFC @ =gBattleCommunication
	b _080110EA
	.align 2, 0
_08010EF8: .4byte gDecompressionBuffer + 0x0C8
_08010EFC: .4byte gBattleCommunication
_08010F00:
	bl GetBlockReceivedStatus
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0xF
	beq _08010F0E
	b _080110F0
_08010F0E:
	bl ResetBlockReceivedFlags
	movs r6, 0
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	mov r8, r0
	ldr r4, _08010F38 @ =gBlockRecvBuffer
	movs r5, 0
_08010F20:
	cmp r6, r7
	bne _08010F54
	ldr r0, _08010F3C @ =gLinkPlayers
	adds r0, r5, r0
	ldrh r0, [r0, 0x18]
	cmp r0, 0x2
	bgt _08010F40
	cmp r0, 0x1
	bge _08010F4C
	cmp r0, 0
	beq _08010F44
	b _08010FDE
	.align 2, 0
_08010F38: .4byte gBlockRecvBuffer
_08010F3C: .4byte gLinkPlayers
_08010F40:
	cmp r0, 0x3
	bne _08010FDE
_08010F44:
	ldr r0, _08010F48 @ =gUnknown_202434C
	b _08010FC4
	.align 2, 0
_08010F48: .4byte gUnknown_202434C
_08010F4C:
	ldr r0, _08010F50 @ =gUnknown_2024478
	b _08010FC4
	.align 2, 0
_08010F50: .4byte gUnknown_2024478
_08010F54:
	ldr r2, _08010F74 @ =gLinkPlayers
	adds r0, r5, r2
	ldrh r1, [r0, 0x18]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08010F78
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08010F86
	b _08010FAC
	.align 2, 0
_08010F74: .4byte gLinkPlayers
_08010F78:
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08010FAC
_08010F86:
	adds r0, r5, r2
	ldrh r2, [r0, 0x18]
	cmp r2, 0x2
	bgt _08010F98
	cmp r2, 0x1
	bge _08010FA4
	cmp r2, 0
	beq _08010F9C
	b _08010FDE
_08010F98:
	cmp r2, 0x3
	bne _08010FDE
_08010F9C:
	ldr r0, _08010FA0 @ =gUnknown_202434C
	b _08010FC4
	.align 2, 0
_08010FA0: .4byte gUnknown_202434C
_08010FA4:
	ldr r0, _08010FA8 @ =gUnknown_2024478
	b _08010FC4
	.align 2, 0
_08010FA8: .4byte gUnknown_2024478
_08010FAC:
	adds r0, r5, r2
	ldrh r2, [r0, 0x18]
	cmp r2, 0x2
	bgt _08010FBE
	cmp r2, 0x1
	bge _08010FD4
	cmp r2, 0
	beq _08010FC2
	b _08010FDE
_08010FBE:
	cmp r2, 0x3
	bne _08010FDE
_08010FC2:
	ldr r0, _08010FD0 @ =gUnknown_20240F4
_08010FC4:
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
	b _08010FDE
	.align 2, 0
_08010FD0: .4byte gUnknown_20240F4
_08010FD4:
	ldr r0, _0801105C @ =gUnknown_2024220
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
_08010FDE:
	movs r2, 0x80
	lsls r2, 1
	adds r4, r2
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _08010F20
	ldr r4, _08011060 @ =gPlayerParty
	adds r0, r4, 0
	bl sub_8011D0C
	adds r0, r4, 0
	adds r0, 0x64
	bl sub_8011D0C
	adds r0, r4, 0
	adds r0, 0xC8
	bl sub_8011D0C
	movs r1, 0x96
	lsls r1, 1
	adds r0, r4, r1
	bl sub_8011D0C
	movs r2, 0xC8
	lsls r2, 1
	adds r0, r4, r2
	bl sub_8011D0C
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r4, r1
	bl sub_8011D0C
	ldr r4, _08011064 @ =gEnemyParty
	adds r0, r4, 0
	bl sub_8011D0C
	adds r0, r4, 0
	adds r0, 0x64
	bl sub_8011D0C
	adds r0, r4, 0
	adds r0, 0xC8
	bl sub_8011D0C
	movs r2, 0x96
	lsls r2, 1
	adds r0, r4, r2
	bl sub_8011D0C
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r4, r1
	bl sub_8011D0C
	movs r2, 0xFA
	lsls r2, 1
	adds r0, r4, r2
	bl sub_8011D0C
	ldr r1, _08011068 @ =gBattleCommunication
	b _080110EA
	.align 2, 0
_0801105C: .4byte gUnknown_2024220
_08011060: .4byte gPlayerParty
_08011064: .4byte gEnemyParty
_08011068: .4byte gBattleCommunication
_0801106C:
	bl sub_800D30C
	ldr r0, _08011080 @ =gBattleCommunication
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	strb r2, [r0, 0x1]
	strb r2, [r0, 0x2]
	b _080110F0
	.align 2, 0
_08011080: .4byte gBattleCommunication
_08011084:
	ldr r0, _080110B8 @ =gUnknown_2023E83
	adds r1, r0, 0x1
	bl BattleInitAllSprites
	lsls r0, 24
	cmp r0, 0
	beq _080110F0
	ldr r2, _080110BC @ =gPreBattleCallback1
	ldr r1, _080110C0 @ =gMain
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _080110C4 @ =sub_80123E4
	str r0, [r1]
	ldr r0, _080110C8 @ =BattleMainCB2
	bl SetMainCallback2
	ldr r2, _080110CC @ =gBattleTypeFlags
	ldr r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080110F0
	movs r0, 0x20
	orrs r1, r0
	str r1, [r2]
	b _080110F0
	.align 2, 0
_080110B8: .4byte gUnknown_2023E83
_080110BC: .4byte gPreBattleCallback1
_080110C0: .4byte gMain
_080110C4: .4byte sub_80123E4
_080110C8: .4byte BattleMainCB2
_080110CC: .4byte gBattleTypeFlags
_080110D0:
	ldr r0, _080110FC @ =gBattleCommunication
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r1, 0x1
	strb r1, [r0, 0x1]
_080110DC:
	ldr r1, _080110FC @ =gBattleCommunication
	ldrb r0, [r1, 0x1]
	subs r0, 0x1
	strb r0, [r1, 0x1]
	lsls r0, 24
	cmp r0, 0
	bne _080110F0
_080110EA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080110F0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080110FC: .4byte gBattleCommunication
	thumb_func_end sub_8010BA0

	thumb_func_start BattleMainCB2
BattleMainCB2: @ 8011100
	push {lr}
	sub sp, 0x4
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	ldr r0, _08011160 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08011158
	ldr r0, _08011164 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 9
	ands r0, r1
	cmp r0, 0
	beq _08011158
	ldr r2, _08011168 @ =gSpecialVar_Result
	ldr r1, _0801116C @ =gBattleOutcome
	movs r0, 0x3
	strb r0, [r1]
	movs r0, 0x3
	strh r0, [r2]
	bl ResetPaletteFadeControl
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08011170 @ =CB2_QuitRecordedBattle
	bl SetMainCallback2
_08011158:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08011160: .4byte gMain
_08011164: .4byte gBattleTypeFlags
_08011168: .4byte gSpecialVar_Result
_0801116C: .4byte gBattleOutcome
_08011170: .4byte CB2_QuitRecordedBattle
	thumb_func_end BattleMainCB2

	thumb_func_start FreeRestoreBattleData
FreeRestoreBattleData: @ 8011174
	push {lr}
	ldr r1, _080111AC @ =gMain
	ldr r0, _080111B0 @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _080111B4 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r2, 0x15]
	ldr r0, _080111B8 @ =0x00000439
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	bl ZeroEnemyPartyMons
	movs r0, 0x53
	bl m4aSongNumStop
	bl FreeMonSpritesGfx
	bl FreeBattleSpritesData
	bl FreeBattleResources
	pop {r0}
	bx r0
	.align 2, 0
_080111AC: .4byte gMain
_080111B0: .4byte gPreBattleCallback1
_080111B4: .4byte gScanlineEffect
_080111B8: .4byte 0x00000439
	thumb_func_end FreeRestoreBattleData

	thumb_func_start CB2_QuitRecordedBattle
CB2_QuitRecordedBattle: @ 80111BC
	push {lr}
	bl UpdatePaletteFade
	ldr r0, _080111E4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080111DE
	bl FreeRestoreBattleData
	bl FreeAllWindowBuffers
	ldr r0, _080111E8 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_080111DE:
	pop {r0}
	bx r0
	.align 2, 0
_080111E4: .4byte gPaletteFade
_080111E8: .4byte gMain
	thumb_func_end CB2_QuitRecordedBattle

	thumb_func_start sub_80111EC
sub_80111EC: @ 80111EC
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r1, _080111F8 @ =sub_80111FC
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080111F8: .4byte sub_80111FC
	thumb_func_end sub_80111EC

	thumb_func_start sub_80111FC
sub_80111FC: @ 80111FC
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r6, [r5, r0]
	cmp r6, 0x1
	beq _08011236
	cmp r6, 0x1
	bgt _08011212
	cmp r6, 0
	beq _08011218
	b _080112D0
_08011212:
	cmp r6, 0x2
	beq _080112A0
	b _080112D0
_08011218:
	ldr r4, _08011298 @ =gUnknown_2022BC0
	movs r0, 0x80
	lsls r0, 5
	bl AllocZeroed
	str r0, [r4]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	strh r6, [r5, 0x30]
	ldr r0, _0801129C @ =0x00000281
	strh r0, [r5, 0x32]
	strh r6, [r5, 0x34]
	movs r0, 0x1
	strh r0, [r5, 0x36]
_08011236:
	ldrh r0, [r5, 0x36]
	subs r0, 0x1
	strh r0, [r5, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _080112D0
	movs r0, 0x2
	strh r0, [r5, 0x36]
	movs r1, 0x30
	ldrsh r2, [r5, r1]
	movs r3, 0x34
	ldrsh r0, [r5, r3]
	lsls r0, 5
	adds r2, r0
	movs r3, 0x32
	ldrsh r1, [r5, r3]
	subs r1, r0
	movs r3, 0
	ldr r0, _08011298 @ =gUnknown_2022BC0
	mov r12, r0
	lsls r7, r2, 1
	movs r4, 0x3D
	lsls r6, r1, 1
_08011264:
	mov r1, r12
	ldr r0, [r1]
	lsls r2, r3, 1
	adds r1, r7, r0
	adds r1, r2, r1
	strh r4, [r1]
	adds r0, r6, r0
	adds r2, r0
	strh r4, [r2]
	adds r3, 0x2
	cmp r3, 0x1D
	ble _08011264
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080112D0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r0, 0x20
	strh r0, [r5, 0x30]
	b _080112D0
	.align 2, 0
_08011298: .4byte gUnknown_2022BC0
_0801129C: .4byte 0x00000281
_080112A0:
	ldrh r0, [r5, 0x30]
	subs r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080112D0
	ldr r4, _080112D8 @ =gUnknown_2022BC0
	ldr r0, [r4]
	cmp r0, 0
	beq _080112CA
	movs r2, 0x80
	lsls r2, 5
	movs r1, 0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_080112CA:
	ldr r0, _080112DC @ =sub_800FD9C
	bl SetMainCallback2
_080112D0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080112D8: .4byte gUnknown_2022BC0
_080112DC: .4byte sub_800FD9C
	thumb_func_end sub_80111FC

	thumb_func_start sub_80112E0
sub_80112E0: @ 80112E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r0, [sp, 0x10]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x14]
	movs r0, 0
	mov r9, r0
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08011304
	movs r0, 0
	b _080116AC
_08011304:
	ldr r0, _08011334 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _08011338 @ =0x00080908
	ands r0, r1
	ldr r1, [sp, 0x14]
	lsls r1, 2
	str r1, [sp, 0x20]
	cmp r0, 0x8
	beq _08011318
	b _0801169C
_08011318:
	bl ZeroEnemyPartyMons
	movs r2, 0
	str r2, [sp, 0x18]
	ldr r2, _0801133C @ =gTrainers
	ldr r1, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r0, r1, r3
	lsls r0, 3
	adds r0, r2
	adds r0, 0x20
	ldr r4, [sp, 0x18]
	b _0801167E
	.align 2, 0
_08011334: .4byte gBattleTypeFlags
_08011338: .4byte 0x00080908
_0801133C: .4byte gTrainers
_08011340:
	ldr r3, [sp, 0x14]
	adds r0, r1, r3
	lsls r0, 3
	adds r1, r0, r2
	ldrb r0, [r1, 0x18]
	cmp r0, 0x1
	bne _08011354
	movs r4, 0x80
	mov r10, r4
	b _08011366
_08011354:
	ldrb r1, [r1, 0x2]
	movs r0, 0x80
	ands r0, r1
	movs r1, 0x88
	mov r10, r1
	cmp r0, 0
	beq _08011366
	movs r2, 0x78
	mov r10, r2
_08011366:
	movs r6, 0
	ldr r0, _080113BC @ =gTrainers
	ldr r2, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r1, r2, r3
	lsls r1, 3
	adds r3, r0, 0x4
	adds r1, r3
	ldrb r1, [r1]
	adds r4, r0, 0
	ldr r0, [sp, 0x18]
	adds r0, 0x1
	str r0, [sp, 0x1C]
	cmp r1, 0xFF
	beq _0801139E
_08011384:
	ldr r0, [sp, 0x14]
	adds r1, r2, r0
	lsls r1, 3
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08011384
_0801139E:
	adds r2, r4, 0
	ldr r1, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r0, r1, r3
	lsls r1, r0, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08011454
	cmp r0, 0x1
	bgt _080113C0
	cmp r0, 0
	beq _080113CE
	b _0801166C
	.align 2, 0
_080113BC: .4byte gTrainers
_080113C0:
	cmp r0, 0x2
	bne _080113C6
	b _08011514
_080113C6:
	cmp r0, 0x3
	bne _080113CC
	b _080115A8
_080113CC:
	b _0801166C
_080113CE:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r4, [r0]
	movs r6, 0
	ldr r0, [sp, 0x18]
	lsls r2, r0, 3
	adds r0, r2, r4
	ldrh r1, [r0, 0x4]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _08011450 @ =gSpeciesNames
	adds r0, r1
	ldrb r0, [r0]
	adds r5, r2, 0
	cmp r0, 0xFF
	beq _08011410
	adds r3, r1, 0
	movs r7, 0xB
_080113F4:
	adds r0, r2, r4
	ldrh r0, [r0, 0x4]
	adds r1, r0, 0
	muls r1, r7
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080113F4
_08011410:
	mov r2, r9
	lsls r0, r2, 8
	add r10, r0
	adds r4, r5, r4
	ldrh r1, [r4]
	lsls r0, r1, 5
	subs r0, r1
	movs r1, 0xFF
	bl __divsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, [sp, 0x18]
	movs r1, 0x64
	adds r0, r3, 0
	muls r0, r1
	ldr r2, [sp, 0x10]
	adds r0, r2, r0
	ldrh r1, [r4, 0x4]
	ldrb r2, [r4, 0x2]
	movs r3, 0x1
	str r3, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	movs r3, 0x2
	str r3, [sp, 0x8]
	movs r3, 0
	str r3, [sp, 0xC]
	adds r3, r6, 0
	bl CreateMon
	b _0801166C
	.align 2, 0
_08011450: .4byte gSpeciesNames
_08011454:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r7, [r0]
	movs r6, 0
	ldr r4, [sp, 0x18]
	lsls r2, r4, 4
	adds r0, r2, r7
	ldrh r1, [r0, 0x4]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _0801150C @ =gSpeciesNames
	adds r0, r1
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, 0xFF
	beq _08011496
	adds r3, r1, 0
	movs r4, 0xB
_0801147A:
	adds r0, r2, r7
	ldrh r0, [r0, 0x4]
	adds r1, r0, 0
	muls r1, r4
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0801147A
_08011496:
	mov r2, r9
	lsls r0, r2, 8
	add r10, r0
	mov r3, r8
	adds r4, r3, r7
	ldrh r1, [r4]
	lsls r0, r1, 5
	subs r0, r1
	movs r1, 0xFF
	bl __divsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [sp, 0x18]
	movs r1, 0x64
	adds r5, r0, 0
	muls r5, r1
	ldr r2, [sp, 0x10]
	adds r5, r2, r5
	ldrh r1, [r4, 0x4]
	ldrb r2, [r4, 0x2]
	movs r0, 0x1
	str r0, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	movs r0, 0x2
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	adds r0, r5, 0
	adds r3, r6, 0
	bl CreateMon
	movs r6, 0
	mov r0, r8
	adds r0, 0x6
	adds r4, r7, r0
_080114E0:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r5, 0
	adds r2, r4, 0
	bl SetMonData
	adds r1, r6, 0
	adds r1, 0x11
	ldrh r0, [r4]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _08011510 @ =gBattleMoves+0x4
	adds r2, r0
	adds r0, r5, 0
	bl SetMonData
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080114E0
	b _0801166C
	.align 2, 0
_0801150C: .4byte gSpeciesNames
_08011510: .4byte gBattleMoves+0x4
_08011514:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r4, [r0]
	movs r6, 0
	ldr r0, [sp, 0x18]
	lsls r2, r0, 3
	adds r0, r2, r4
	ldrh r1, [r0, 0x4]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _080115A4 @ =gSpeciesNames
	adds r0, r1
	ldrb r0, [r0]
	adds r5, r2, 0
	cmp r0, 0xFF
	beq _08011556
	adds r3, r1, 0
	movs r7, 0xB
_0801153A:
	adds r0, r2, r4
	ldrh r0, [r0, 0x4]
	adds r1, r0, 0
	muls r1, r7
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0801153A
_08011556:
	mov r2, r9
	lsls r0, r2, 8
	add r10, r0
	adds r5, r4
	ldrh r1, [r5]
	lsls r0, r1, 5
	subs r0, r1
	movs r1, 0xFF
	bl __divsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, [sp, 0x18]
	movs r0, 0x64
	adds r4, r3, 0
	muls r4, r0
	ldr r1, [sp, 0x10]
	adds r4, r1, r4
	ldrh r1, [r5, 0x4]
	ldrb r2, [r5, 0x2]
	movs r0, 0x1
	str r0, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	movs r0, 0x2
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	adds r0, r4, 0
	adds r3, r6, 0
	bl CreateMon
	adds r5, 0x6
	adds r0, r4, 0
	movs r1, 0xC
	adds r2, r5, 0
	bl SetMonData
	b _0801166C
	.align 2, 0
_080115A4: .4byte gSpeciesNames
_080115A8:
	adds r0, r4, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r7, [r0]
	movs r6, 0
	ldr r4, [sp, 0x18]
	lsls r2, r4, 4
	adds r0, r2, r7
	ldrh r1, [r0, 0x4]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _080116BC @ =gSpeciesNames
	adds r0, r1
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, 0xFF
	beq _080115EA
	adds r3, r1, 0
	movs r4, 0xB
_080115CE:
	adds r0, r2, r7
	ldrh r0, [r0, 0x4]
	adds r1, r0, 0
	muls r1, r4
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080115CE
_080115EA:
	mov r2, r9
	lsls r0, r2, 8
	add r10, r0
	mov r3, r8
	adds r5, r3, r7
	ldrh r1, [r5]
	lsls r0, r1, 5
	subs r0, r1
	movs r1, 0xFF
	bl __divsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [sp, 0x18]
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r2, [sp, 0x10]
	adds r4, r2, r4
	ldrh r1, [r5, 0x4]
	ldrb r2, [r5, 0x2]
	movs r0, 0x1
	str r0, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	movs r0, 0x2
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	adds r0, r4, 0
	adds r3, r6, 0
	bl CreateMon
	adds r5, 0x6
	adds r0, r4, 0
	movs r1, 0xC
	adds r2, r5, 0
	bl SetMonData
	movs r6, 0
	adds r5, r4, 0
	mov r0, r8
	adds r0, 0x8
	adds r4, r7, r0
_08011642:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r5, 0
	adds r2, r4, 0
	bl SetMonData
	adds r1, r6, 0
	adds r1, 0x11
	ldrh r0, [r4]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _080116C0 @ =gBattleMoves+0x4
	adds r2, r0
	adds r0, r5, 0
	bl SetMonData
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _08011642
_0801166C:
	ldr r4, [sp, 0x1C]
	str r4, [sp, 0x18]
	ldr r2, _080116C4 @ =gTrainers
	ldr r1, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r0, r1, r3
	lsls r0, 3
	adds r0, r2
	adds r0, 0x20
_0801167E:
	ldrb r0, [r0]
	cmp r4, r0
	bge _08011686
	b _08011340
_08011686:
	ldr r2, _080116C8 @ =gBattleTypeFlags
	ldr r1, _080116C4 @ =gTrainers
	ldr r4, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r0, r4, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x18]
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
_0801169C:
	ldr r0, _080116C4 @ =gTrainers
	ldr r4, [sp, 0x20]
	ldr r2, [sp, 0x14]
	adds r1, r4, r2
	lsls r1, 3
	adds r1, r0
	adds r1, 0x20
	ldrb r0, [r1]
_080116AC:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080116BC: .4byte gSpeciesNames
_080116C0: .4byte gBattleMoves+0x4
_080116C4: .4byte gTrainers
_080116C8: .4byte gBattleTypeFlags
	thumb_func_end sub_80112E0

	thumb_func_start sub_80116CC
sub_80116CC: @ 80116CC
	push {lr}
	ldr r0, _080116EC @ =0x04000006
	ldrh r0, [r0]
	subs r0, 0x6F
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x30
	bhi _080116E6
	ldr r1, _080116F0 @ =0x04000008
	movs r2, 0x98
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
_080116E6:
	pop {r0}
	bx r0
	.align 2, 0
_080116EC: .4byte 0x04000006
_080116F0: .4byte 0x04000008
	thumb_func_end sub_80116CC

	thumb_func_start VBlankCB_Battle
VBlankCB_Battle: @ 80116F4
	push {lr}
	bl Random
	ldr r0, _08011788 @ =gBattle_BG0_X
	ldrh r1, [r0]
	movs r0, 0x10
	bl SetGpuReg
	ldr r0, _0801178C @ =gBattle_BG0_Y
	ldrh r1, [r0]
	movs r0, 0x12
	bl SetGpuReg
	ldr r0, _08011790 @ =gBattle_BG1_X
	ldrh r1, [r0]
	movs r0, 0x14
	bl SetGpuReg
	ldr r0, _08011794 @ =gBattle_BG1_Y
	ldrh r1, [r0]
	movs r0, 0x16
	bl SetGpuReg
	ldr r0, _08011798 @ =gBattle_BG2_X
	ldrh r1, [r0]
	movs r0, 0x18
	bl SetGpuReg
	ldr r0, _0801179C @ =gBattle_BG2_Y
	ldrh r1, [r0]
	movs r0, 0x1A
	bl SetGpuReg
	ldr r0, _080117A0 @ =gBattle_BG3_X
	ldrh r1, [r0]
	movs r0, 0x1C
	bl SetGpuReg
	ldr r0, _080117A4 @ =gBattle_BG3_Y
	ldrh r1, [r0]
	movs r0, 0x1E
	bl SetGpuReg
	ldr r0, _080117A8 @ =gBattle_WIN0H
	ldrh r1, [r0]
	movs r0, 0x40
	bl SetGpuReg
	ldr r0, _080117AC @ =gBattle_WIN0V
	ldrh r1, [r0]
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, _080117B0 @ =gUnknown_2022988
	ldrh r1, [r0]
	movs r0, 0x42
	bl SetGpuReg
	ldr r0, _080117B4 @ =gUnknown_202298A
	ldrh r1, [r0]
	movs r0, 0x46
	bl SetGpuReg
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08011788: .4byte gBattle_BG0_X
_0801178C: .4byte gBattle_BG0_Y
_08011790: .4byte gBattle_BG1_X
_08011794: .4byte gBattle_BG1_Y
_08011798: .4byte gBattle_BG2_X
_0801179C: .4byte gBattle_BG2_Y
_080117A0: .4byte gBattle_BG3_X
_080117A4: .4byte gBattle_BG3_Y
_080117A8: .4byte gBattle_WIN0H
_080117AC: .4byte gBattle_WIN0V
_080117B0: .4byte gUnknown_2022988
_080117B4: .4byte gUnknown_202298A
	thumb_func_end VBlankCB_Battle

	thumb_func_start nullsub_9
nullsub_9: @ 80117B8
	bx lr
	thumb_func_end nullsub_9

	thumb_func_start sub_80117BC
sub_80117BC: @ 80117BC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080117DC
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	lsrs r0, 8
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x20]
	b _080117EE
_080117DC:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	asrs r0, 8
	ldrh r1, [r5, 0x30]
	subs r1, r0
	strh r1, [r5, 0x20]
_080117EE:
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08011822
	ldr r4, _08011828 @ =0x00002710
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	adds r0, r5, 0
	bl FreeSpriteOamMatrix
	adds r0, r5, 0
	bl DestroySprite
_08011822:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011828: .4byte 0x00002710
	thumb_func_end sub_80117BC

	thumb_func_start sub_801182C
sub_801182C: @ 801182C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _08011848 @ =sub_80117BC
	str r0, [r4, 0x1C]
	movs r0, 0x61
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011848: .4byte sub_80117BC
	thumb_func_end sub_801182C

	thumb_func_start sub_801184C
sub_801184C: @ 801184C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	ldr r0, _08011894 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r2, [r0]
	ldr r0, _08011898 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080118BC
	ldr r1, _0801189C @ =gLinkPlayers
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x18]
	cmp r0, 0x1
	beq _080118A8
	cmp r0, 0x1
	bgt _080118A0
	cmp r0, 0
	beq _080118BC
	b _080118C4
	.align 2, 0
_08011894: .4byte gBattleStruct
_08011898: .4byte gBattleTypeFlags
_0801189C: .4byte gLinkPlayers
_080118A0:
	cmp r0, 0x2
	beq _080118BC
	cmp r0, 0x3
	bne _080118C4
_080118A8:
	ldr r0, _080118B4 @ =gEnemyParty
	str r0, [sp, 0x4]
	ldr r1, _080118B8 @ =gPlayerParty
	str r1, [sp, 0x8]
	b _080118C4
	.align 2, 0
_080118B4: .4byte gEnemyParty
_080118B8: .4byte gPlayerParty
_080118BC:
	ldr r2, _08011A10 @ =gPlayerParty
	str r2, [sp, 0x4]
	ldr r3, _08011A14 @ =gEnemyParty
	str r3, [sp, 0x8]
_080118C4:
	movs r7, 0
	movs r0, 0
	mov r8, r0
	ldr r1, [sp]
	lsls r1, 2
	str r1, [sp, 0xC]
	movs r2, 0xCE
	lsls r2, 1
	mov r10, r2
	mov r9, r0
_080118D8:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	ldr r3, [sp, 0x4]
	adds r4, r3, r4
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	adds r1, r0, 0
	cmp r5, 0
	beq _08011948
	cmp r5, r10
	beq _0801191C
	cmp r6, 0
	beq _0801191C
	cmp r1, 0
	bne _0801191C
	movs r0, 0x1
	mov r2, r9
	lsls r0, r2
	orrs r7, r0
_0801191C:
	cmp r5, 0
	beq _08011948
	cmp r6, 0
	beq _08011934
	cmp r5, r10
	beq _0801192C
	cmp r1, 0
	beq _08011934
_0801192C:
	movs r0, 0x2
	mov r3, r9
	lsls r0, r3
	orrs r7, r0
_08011934:
	cmp r5, 0
	beq _08011948
	cmp r5, r10
	beq _08011948
	cmp r6, 0
	bne _08011948
	movs r0, 0x3
	mov r1, r9
	lsls r0, r1
	orrs r7, r0
_08011948:
	movs r2, 0x2
	add r9, r2
	movs r3, 0x1
	add r8, r3
	mov r0, r8
	cmp r0, 0x5
	ble _080118D8
	ldr r1, _08011A18 @ =gTasks
	ldr r2, [sp, 0xC]
	ldr r3, [sp]
	adds r0, r2, r3
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0xE]
	movs r7, 0
	movs r0, 0
	mov r8, r0
	movs r1, 0xCE
	lsls r1, 1
	mov r10, r1
	mov r9, r0
_08011972:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	ldr r2, [sp, 0x8]
	adds r4, r2, r4
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	adds r1, r0, 0
	cmp r5, 0
	beq _080119E2
	cmp r5, r10
	beq _080119B6
	cmp r6, 0
	beq _080119B6
	cmp r1, 0
	bne _080119B6
	movs r0, 0x1
	mov r3, r9
	lsls r0, r3
	orrs r7, r0
_080119B6:
	cmp r5, 0
	beq _080119E2
	cmp r6, 0
	beq _080119CE
	cmp r5, r10
	beq _080119C6
	cmp r1, 0
	beq _080119CE
_080119C6:
	movs r0, 0x2
	mov r1, r9
	lsls r0, r1
	orrs r7, r0
_080119CE:
	cmp r5, 0
	beq _080119E2
	cmp r5, r10
	beq _080119E2
	cmp r6, 0
	bne _080119E2
	movs r0, 0x3
	mov r2, r9
	lsls r0, r2
	orrs r7, r0
_080119E2:
	movs r3, 0x2
	add r9, r3
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x5
	ble _08011972
	ldr r1, _08011A18 @ =gTasks
	ldr r2, [sp, 0xC]
	ldr r3, [sp]
	adds r0, r2, r3
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0x10]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011A10: .4byte gPlayerParty
_08011A14: .4byte gEnemyParty
_08011A18: .4byte gTasks
	thumb_func_end sub_801184C

	thumb_func_start sub_8011A1C
sub_8011A1C: @ 8011A1C
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	str r0, [sp]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _08011B40 @ =0x05006000
	mov r0, sp
	bl CpuSet
	movs r0, 0x4C
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	ldr r4, _08011B44 @ =0x00005051
	movs r0, 0x44
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	ldr r1, _08011B48 @ =gBattle_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	ldr r0, _08011B4C @ =gBattle_WIN0V
	strh r4, [r0]
	bl ScanlineEffect_Clear
	ldr r0, _08011B50 @ =gScanlineEffectRegBuffers
	movs r3, 0xF0
	movs r1, 0xF0
	lsls r1, 3
	adds r2, r0, r1
	movs r1, 0x4F
_08011A80:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _08011A80
	movs r1, 0x50
	ldr r0, _08011B50 @ =gScanlineEffectRegBuffers
	ldr r3, _08011B54 @ =0x0000ff10
	movs r4, 0x82
	lsls r4, 4
	adds r2, r0, r4
	adds r0, 0xA0
_08011A9C:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	adds r1, 0x1
	cmp r1, 0x9F
	ble _08011A9C
	bl ResetPaletteFade
	ldr r0, _08011B58 @ =gBattle_BG0_X
	movs r4, 0
	strh r4, [r0]
	ldr r0, _08011B5C @ =gBattle_BG0_Y
	strh r4, [r0]
	ldr r0, _08011B60 @ =gBattle_BG1_X
	strh r4, [r0]
	ldr r0, _08011B64 @ =gBattle_BG1_Y
	strh r4, [r0]
	ldr r0, _08011B68 @ =gBattle_BG2_X
	strh r4, [r0]
	ldr r0, _08011B6C @ =gBattle_BG2_Y
	strh r4, [r0]
	ldr r0, _08011B70 @ =gBattle_BG3_X
	strh r4, [r0]
	ldr r0, _08011B74 @ =gBattle_BG3_Y
	strh r4, [r0]
	bl sub_800F34C
	ldr r0, _08011B78 @ =gBattleTextboxPalette
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	bl sub_800F380
	bl ResetSpriteData
	bl ResetTasks
	bl sub_800FAE0
	movs r0, 0x4A
	movs r1, 0x37
	bl SetGpuReg
	bl FreeAllSpritePalettes
	ldr r1, _08011B7C @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _08011B80 @ =VBlankCB_Battle
	bl SetVBlankCallback
	ldr r0, _08011B84 @ =sub_800F6FC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08011B88 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x87
	lsls r2, 1
	strh r2, [r1, 0xA]
	movs r2, 0x5A
	strh r2, [r1, 0xC]
	movs r2, 0x1
	strh r2, [r1, 0x12]
	bl sub_801184C
	ldr r0, _08011B8C @ =sub_8011B94
	bl SetMainCallback2
	ldr r0, _08011B90 @ =gBattleCommunication
	strb r4, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011B40: .4byte 0x05006000
_08011B44: .4byte 0x00005051
_08011B48: .4byte gBattle_WIN0H
_08011B4C: .4byte gBattle_WIN0V
_08011B50: .4byte gScanlineEffectRegBuffers
_08011B54: .4byte 0x0000ff10
_08011B58: .4byte gBattle_BG0_X
_08011B5C: .4byte gBattle_BG0_Y
_08011B60: .4byte gBattle_BG1_X
_08011B64: .4byte gBattle_BG1_Y
_08011B68: .4byte gBattle_BG2_X
_08011B6C: .4byte gBattle_BG2_Y
_08011B70: .4byte gBattle_BG3_X
_08011B74: .4byte gBattle_BG3_Y
_08011B78: .4byte gBattleTextboxPalette
_08011B7C: .4byte gReservedSpritePaletteCount
_08011B80: .4byte VBlankCB_Battle
_08011B84: .4byte sub_800F6FC
_08011B88: .4byte gTasks
_08011B8C: .4byte sub_8011B94
_08011B90: .4byte gBattleCommunication
	thumb_func_end sub_8011A1C

	thumb_func_start sub_8011B94
sub_8011B94: @ 8011B94
	push {lr}
	bl sub_8011BB0
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_8011B94

	thumb_func_start sub_8011BB0
sub_8011BB0: @ 8011BB0
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08011BC8 @ =gBattleCommunication
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08011BEA
	cmp r0, 0x1
	bgt _08011BCC
	cmp r0, 0
	beq _08011BD2
	b _08011C34
	.align 2, 0
_08011BC8: .4byte gBattleCommunication
_08011BCC:
	cmp r0, 0x2
	beq _08011C10
	b _08011C34
_08011BD2:
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0xFF
	strb r0, [r4, 0x1]
	b _08011C08
_08011BEA:
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	strb r0, [r4, 0x1]
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08011C34
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08011C08:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08011C34
_08011C10:
	ldr r0, _08011C3C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08011C34
	ldr r0, _08011C40 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	bl sub_812C224
	bl FreeMonSpritesGfx
	bl FreeBattleSpritesData
	bl FreeBattleResources
_08011C34:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011C3C: .4byte gPaletteFade
_08011C40: .4byte gMain
	thumb_func_end sub_8011BB0

	thumb_func_start sub_8011C44
sub_8011C44: @ 8011C44
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	cmp r1, 0x6
	bhi _08011D04
	lsls r0, r1, 2
	ldr r1, _08011C60 @ =_08011C64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08011C60: .4byte _08011C64
	.align 2, 0
_08011C64:
	.4byte _08011C80
	.4byte _08011C94
	.4byte _08011CA8
	.4byte _08011CBC
	.4byte _08011CD0
	.4byte _08011CE4
	.4byte _08011CF8
_08011C80:
	ldr r0, _08011C90 @ =gUnknown_8248320
	lsls r1, r2, 2
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 30
	lsrs r0, 30
	b _08011D04
	.align 2, 0
_08011C90: .4byte gUnknown_8248320
_08011C94:
	ldr r0, _08011CA4 @ =gUnknown_8248320
	lsls r1, r2, 2
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 28
	lsrs r0, 30
	b _08011D04
	.align 2, 0
_08011CA4: .4byte gUnknown_8248320
_08011CA8:
	ldr r0, _08011CB8 @ =gUnknown_8248320
	lsls r1, r2, 2
	adds r1, r0
	ldrh r0, [r1]
	lsls r0, 23
	lsrs r0, 27
	b _08011D04
	.align 2, 0
_08011CB8: .4byte gUnknown_8248320
_08011CBC:
	ldr r0, _08011CCC @ =gUnknown_8248320
	lsls r1, r2, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 29
	lsrs r0, 30
	b _08011D04
	.align 2, 0
_08011CCC: .4byte gUnknown_8248320
_08011CD0:
	ldr r0, _08011CE0 @ =gUnknown_8248320
	lsls r1, r2, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 28
	lsrs r0, 31
	b _08011D04
	.align 2, 0
_08011CE0: .4byte gUnknown_8248320
_08011CE4:
	ldr r0, _08011CF4 @ =gUnknown_8248320
	lsls r1, r2, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 26
	lsrs r0, 30
	b _08011D04
	.align 2, 0
_08011CF4: .4byte gUnknown_8248320
_08011CF8:
	ldr r0, _08011D08 @ =gUnknown_8248320
	lsls r1, r2, 2
	adds r1, r0
	ldr r0, [r1]
	lsls r0, 8
	lsrs r0, 22
_08011D04:
	pop {r1}
	bx r1
	.align 2, 0
_08011D08: .4byte gUnknown_8248320
	thumb_func_end sub_8011C44

	thumb_func_start sub_8011D0C
sub_8011D0C: @ 8011D0C
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	add r5, sp, 0xC
	movs r0, 0x1
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _08011D5C @ =0x0000012f
	cmp r0, r1
	bne _08011D54
	adds r0, r4, 0
	movs r1, 0x3
	bl GetMonData
	ldrb r1, [r5]
	cmp r0, r1
	beq _08011D54
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r1, _08011D60 @ =gUnknown_824F008
	mov r0, sp
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _08011D54
	adds r0, r4, 0
	movs r1, 0x3
	adds r2, r5, 0
	bl SetMonData
_08011D54:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011D5C: .4byte 0x0000012f
_08011D60: .4byte gUnknown_824F008
	thumb_func_end sub_8011D0C

	thumb_func_start oac_poke_opponent
oac_poke_opponent: @ 8011D64
	push {lr}
	sub sp, 0x4
	ldr r1, _08011D8C @ =sub_8011D94
	str r1, [r0, 0x1C]
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	movs r0, 0x80
	lsls r0, 10
	ldr r1, _08011D90 @ =0x00002108
	str r1, [sp]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xA
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08011D8C: .4byte sub_8011D94
_08011D90: .4byte 0x00002108
	thumb_func_end oac_poke_opponent

	thumb_func_start sub_8011D94
sub_8011D94: @ 8011D94
	push {lr}
	adds r2, r0, 0
	ldr r0, _08011DC0 @ =gIntroSlideFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08011DBC
	ldrh r0, [r2, 0x24]
	adds r0, 0x2
	strh r0, [r2, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _08011DBC
	ldr r0, _08011DC4 @ =sub_8011DC8
	str r0, [r2, 0x1C]
	ldrh r0, [r2, 0x32]
	movs r1, 0x19
	bl PlayCry1
_08011DBC:
	pop {r0}
	bx r0
	.align 2, 0
_08011DC0: .4byte gIntroSlideFlags
_08011DC4: .4byte sub_8011DC8
	thumb_func_end sub_8011D94

	thumb_func_start sub_8011DC8
sub_8011DC8: @ 8011DC8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08011E10
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_804BD94
	ldr r1, _08011E18 @ =gHealthboxSpriteIds
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r0, _08011E1C @ =nullsub_10
	str r0, [r4, 0x1C]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	movs r0, 0x80
	lsls r0, 10
	ldr r1, _08011E20 @ =0x00002108
	str r1, [sp]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl BeginNormalPaletteFade
_08011E10:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011E18: .4byte gHealthboxSpriteIds
_08011E1C: .4byte nullsub_10
_08011E20: .4byte 0x00002108
	thumb_func_end sub_8011DC8

	thumb_func_start nullsub_10
nullsub_10: @ 8011E24
	bx lr
	thumb_func_end nullsub_10

	thumb_func_start sub_8011E28
sub_8011E28: @ 8011E28
	movs r1, 0x6
	strh r1, [r0, 0x34]
	movs r1, 0x1
	strh r1, [r0, 0x36]
	ldr r1, _08011E38 @ =sub_8011E3C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_08011E38: .4byte sub_8011E3C
	thumb_func_end sub_8011E28

	thumb_func_start sub_8011E3C
sub_8011E3C: @ 8011E3C
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x36]
	subs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _08011E90
	movs r0, 0x8
	strh r0, [r3, 0x36]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r4, 0x5
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _08011E90
	ldrb r1, [r1]
	adds r0, r4, 0
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	ldr r0, _08011E98 @ =nullsub_10
	str r0, [r3, 0x1C]
	ldr r0, _08011E9C @ =gUnknown_2022AE8
	str r2, [r0]
_08011E90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011E98: .4byte nullsub_10
_08011E9C: .4byte gUnknown_2022AE8
	thumb_func_end sub_8011E3C

	thumb_func_start SpriteCB_FaintOpponentMon
SpriteCB_FaintOpponentMon: @ 8011EA0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08011EC4 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _08011EC8
	adds r4, r0, 0
	b _08011ECC
	.align 2, 0
_08011EC4: .4byte gBattleSpritesDataPtr
_08011EC8:
	mov r0, r9
	ldrh r4, [r0, 0x32]
_08011ECC:
	ldr r1, _08011F34 @ =gBattlerPartyIndexes
	lsls r0, r6, 1
	adds r5, r0, r1
	ldrh r0, [r5]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r7, _08011F38 @ =gEnemyParty
	adds r0, r7
	movs r1, 0
	bl GetMonData
	cmp r4, 0xC9
	bne _08011F50
	ldrh r0, [r5]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08011F3C
	movs r0, 0xC9
	b _08011F46
	.align 2, 0
_08011F34: .4byte gBattlerPartyIndexes
_08011F38: .4byte gEnemyParty
_08011F3C:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08011F46:
	ldr r1, _08011F4C @ =gUnknown_82349CC
	lsls r0, 2
	b _08011F88
	.align 2, 0
_08011F4C: .4byte gUnknown_82349CC
_08011F50:
	ldr r0, _08011F68 @ =0x00000181
	cmp r4, r0
	bne _08011F74
	ldr r0, _08011F6C @ =gUnknown_83AE03C
	ldr r1, _08011F70 @ =gBattleMonForms
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _08011F8C
	.align 2, 0
_08011F68: .4byte 0x00000181
_08011F6C: .4byte gUnknown_83AE03C
_08011F70: .4byte gBattleMonForms
_08011F74:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08011F84
	ldr r0, _08011F80 @ =gUnknown_82349CC
	b _08011F8A
	.align 2, 0
_08011F80: .4byte gUnknown_82349CC
_08011F84:
	ldr r1, _08011FAC @ =gUnknown_82349CC
	lsls r0, r4, 2
_08011F88:
	adds r0, r1
_08011F8A:
	ldrb r0, [r0, 0x1]
_08011F8C:
	lsrs r1, r0, 3
	movs r0, 0x8
	subs r0, r1
	mov r1, r9
	strh r0, [r1, 0x34]
	movs r0, 0x1
	strh r0, [r1, 0x36]
	ldr r0, _08011FB0 @ =sub_8011FB4
	str r0, [r1, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011FAC: .4byte gUnknown_82349CC
_08011FB0: .4byte sub_8011FB4
	thumb_func_end SpriteCB_FaintOpponentMon

	thumb_func_start sub_8011FB4
sub_8011FB4: @ 8011FB4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	subs r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _08012034
	movs r0, 0x2
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x26]
	adds r0, 0x8
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	cmp r0, 0
	bge _08011FE8
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	b _08012034
_08011FE8:
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerPosition
	ldr r1, _0801203C @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	lsls r0, 24
	lsrs r0, 22
	adds r1, 0x4
	adds r1, r0
	ldr r2, _08012040 @ =gBattleMonForms
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 11
	ldr r1, [r1]
	adds r1, r0
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	lsls r0, 8
	adds r1, r0
	movs r2, 0
	movs r0, 0xFF
_0801201A:
	strb r2, [r1]
	adds r1, 0x1
	subs r0, 0x1
	cmp r0, 0
	bge _0801201A
	ldr r0, _08012040 @ =gBattleMonForms
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r4, 0
	bl StartSpriteAnim
_08012034:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801203C: .4byte gMonSpritesGfxPtr
_08012040: .4byte gBattleMonForms
	thumb_func_end sub_8011FB4

	thumb_func_start sub_8012044
sub_8012044: @ 8012044
	movs r1, 0x8
	strh r1, [r0, 0x34]
	adds r1, r0, 0
	adds r1, 0x3E
	ldrb r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r0, 0x36]
	ldr r1, _0801205C @ =sub_8012060
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0801205C: .4byte sub_8012060
	thumb_func_end sub_8012044

	thumb_func_start sub_8012060
sub_8012060: @ 8012060
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _08012092
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r0, 0x8
	strh r0, [r3, 0x34]
_08012092:
	pop {r0}
	bx r0
	thumb_func_end sub_8012060

	thumb_func_start sub_8012098
sub_8012098: @ 8012098
	movs r1, 0x3E
	adds r1, r0
	mov r12, r1
	movs r1, 0x1
	ldrh r2, [r0, 0x36]
	ands r2, r1
	lsls r2, 2
	mov r1, r12
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	movs r1, 0
	strh r1, [r0, 0x36]
	ldr r1, _080120C0 @ =nullsub_10
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080120C0: .4byte nullsub_10
	thumb_func_end sub_8012098

	thumb_func_start sub_80120C4
sub_80120C4: @ 80120C4
	ldr r1, _080120CC @ =oac_poke_ally_
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080120CC: .4byte oac_poke_ally_
	thumb_func_end sub_80120C4

	thumb_func_start oac_poke_ally_
oac_poke_ally_: @ 80120D0
	push {lr}
	adds r2, r0, 0
	ldr r0, _080120F8 @ =gIntroSlideFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080120F4
	ldrh r0, [r2, 0x24]
	subs r0, 0x2
	strh r0, [r2, 0x24]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _080120F4
	ldr r0, _080120FC @ =nullsub_11
	str r0, [r2, 0x1C]
	strh r1, [r2, 0x30]
_080120F4:
	pop {r0}
	bx r0
	.align 2, 0
_080120F8: .4byte gIntroSlideFlags
_080120FC: .4byte nullsub_11
	thumb_func_end oac_poke_ally_

	thumb_func_start sub_8012100
sub_8012100: @ 8012100
	ldr r1, _08012108 @ =nullsub_11
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_08012108: .4byte nullsub_11
	thumb_func_end sub_8012100

	thumb_func_start nullsub_11
nullsub_11: @ 801210C
	bx lr
	thumb_func_end nullsub_11

	thumb_func_start sub_8012110
sub_8012110: @ 8012110
	push {lr}
	adds r2, r0, 0
	ldr r0, _08012134 @ =gIntroSlideFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08012130
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
_08012130:
	pop {r0}
	bx r0
	.align 2, 0
_08012134: .4byte gIntroSlideFlags
	thumb_func_end sub_8012110

	thumb_func_start DoBounceEffect
DoBounceEffect: @ 8012138
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	cmp r1, 0
	beq _08012174
	ldr r0, _08012170 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r2, r4, 1
	adds r0, r2, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	b _08012186
	.align 2, 0
_08012170: .4byte gBattleSpritesDataPtr
_08012174:
	ldr r0, _080121D0 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r2, r4, 1
	adds r0, r2, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
_08012186:
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	bne _0801223C
	ldr r0, _080121D4 @ =SpriteCB_HealthBoxBounce
	bl CreateInvisibleSpriteWithCallback
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	cmp r0, 0x1
	bne _080121E0
	ldr r0, _080121D8 @ =gHealthboxSpriteIds
	adds r0, r4, r0
	ldrb r7, [r0]
	ldr r2, _080121D0 @ =gBattleSpritesDataPtr
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	adds r1, r6, r4
	lsls r1, 2
	adds r0, r1, r0
	strb r5, [r0, 0x2]
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _080121DC @ =gSprites
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x80
	b _0801220E
	.align 2, 0
_080121D0: .4byte gBattleSpritesDataPtr
_080121D4: .4byte SpriteCB_HealthBoxBounce
_080121D8: .4byte gHealthboxSpriteIds
_080121DC: .4byte gSprites
_080121E0:
	ldr r0, _0801224C @ =gBattlerSpriteIds
	adds r0, r4, r0
	ldrb r7, [r0]
	ldr r2, _08012250 @ =gBattleSpritesDataPtr
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	adds r1, r6, r4
	lsls r1, 2
	adds r0, r1, r0
	strb r5, [r0, 0x3]
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _08012254 @ =gSprites
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0xC0
_0801220E:
	strh r1, [r0, 0x2E]
	adds r4, r2, 0
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r4
	mov r2, r9
	lsls r0, r2, 24
	asrs r0, 24
	movs r2, 0
	strh r0, [r1, 0x30]
	mov r3, r10
	lsls r0, r3, 24
	asrs r0, 24
	strh r0, [r1, 0x32]
	strh r7, [r1, 0x34]
	mov r0, r8
	strh r0, [r1, 0x36]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x24]
	strh r2, [r0, 0x26]
_0801223C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801224C: .4byte gBattlerSpriteIds
_08012250: .4byte gBattleSpritesDataPtr
_08012254: .4byte gSprites
	thumb_func_end DoBounceEffect

	thumb_func_start EndBounceEffect
EndBounceEffect: @ 8012258
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	bne _080122AC
	ldr r6, _080122A4 @ =gBattleSpritesDataPtr
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r5, r0, 2
	adds r3, r5, r1
	ldrb r1, [r3]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080122FA
	ldr r2, _080122A8 @ =gSprites
	ldrb r1, [r3, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x34]
	lsls r1, 24
	lsrs r4, r1, 24
	bl DestroySprite
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	adds r1, r5, r1
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	b _080122E6
	.align 2, 0
_080122A4: .4byte gBattleSpritesDataPtr
_080122A8: .4byte gSprites
_080122AC:
	ldr r6, _08012300 @ =gBattleSpritesDataPtr
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r5, r0, 2
	adds r3, r5, r1
	ldrb r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080122FA
	ldr r2, _08012304 @ =gSprites
	ldrb r1, [r3, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x34]
	lsls r1, 24
	lsrs r4, r1, 24
	bl DestroySprite
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	adds r1, r5, r1
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
_080122E6:
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08012304 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x24]
	strh r0, [r1, 0x26]
_080122FA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012300: .4byte gBattleSpritesDataPtr
_08012304: .4byte gSprites
	thumb_func_end EndBounceEffect

	thumb_func_start SpriteCB_HealthBoxBounce
SpriteCB_HealthBoxBounce: @ 8012308
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _08012320
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	b _08012324
_08012320:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
_08012324:
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	ldr r2, _08012350 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r4, 0x32]
	adds r0, r2
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012350: .4byte gSprites
	thumb_func_end SpriteCB_HealthBoxBounce

	thumb_func_start sub_8012354
sub_8012354: @ 8012354
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08012368 @ =sub_8012398
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012368: .4byte sub_8012398
	thumb_func_end sub_8012354

	thumb_func_start sub_801236C
sub_801236C: @ 801236C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _0801238E
	ldr r1, _08012394 @ =gUnknown_824F048
	adds r0, r2, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	adds r0, 0x28
	strb r1, [r0]
_0801238E:
	pop {r0}
	bx r0
	.align 2, 0
_08012394: .4byte gUnknown_824F048
	thumb_func_end sub_801236C

	thumb_func_start sub_8012398
sub_8012398: @ 8012398
	push {r4,lr}
	adds r4, r0, 0
	bl sub_801236C
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080123B2
	ldr r0, _080123B8 @ =nullsub_11
	str r0, [r4, 0x1C]
_080123B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080123B8: .4byte nullsub_11
	thumb_func_end sub_8012398

	thumb_func_start nullsub_12
nullsub_12: @ 80123BC
	bx lr
	thumb_func_end nullsub_12

	thumb_func_start BeginBattleIntro
BeginBattleIntro: @ 80123C0
	push {lr}
	bl sub_8012434
	ldr r1, _080123D8 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x1]
	ldr r1, _080123DC @ =gBattleMainFunc
	ldr r0, _080123E0 @ =BattleIntroGetMonsData
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080123D8: .4byte gBattleCommunication
_080123DC: .4byte gBattleMainFunc
_080123E0: .4byte BattleIntroGetMonsData
	thumb_func_end BeginBattleIntro

	thumb_func_start sub_80123E4
sub_80123E4: @ 80123E4
	push {r4,r5,lr}
	ldr r0, _08012424 @ =gBattleMainFunc
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _08012428 @ =gActiveBattler
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0801242C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801241E
	ldr r5, _08012430 @ =gBattlerControllerFuncs
	adds r4, r1, 0
_08012400:
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0801242C @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08012400
_0801241E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012424: .4byte gBattleMainFunc
_08012428: .4byte gActiveBattler
_0801242C: .4byte gBattlersCount
_08012430: .4byte gBattlerControllerFuncs
	thumb_func_end sub_80123E4

	thumb_func_start sub_8012434
sub_8012434: @ 8012434
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	bl TurnValuesCleanUp
	bl SpecialStatusesClear
	movs r2, 0
	movs r3, 0
	ldr r0, _080126CC @ =gLastResultingMoves
	mov r10, r0
	ldr r1, _080126D0 @ =gLastHitByType
	mov r12, r1
	ldr r0, _080126D4 @ =gLastLandedMoves
	mov r9, r0
	ldr r1, _080126D8 @ =gLastMoves
	mov r8, r1
	ldr r4, _080126DC @ =gDisableStructs
	movs r5, 0
	ldr r7, _080126E0 @ =gLastPrintedMoves
	ldr r6, _080126E4 @ =gLockedMoves
_08012464:
	ldr r0, _080126E8 @ =gStatuses3
	adds r0, r5, r0
	str r3, [r0]
	movs r1, 0
_0801246C:
	adds r0, r4, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0x1B
	bls _0801246C
	movs r0, 0x2
	strb r0, [r4, 0x16]
	ldr r1, _080126EC @ =gUnknown_2023DD4
	adds r0, r2, r1
	strb r3, [r0]
	mov r0, r8
	strh r3, [r0]
	mov r1, r9
	strh r3, [r1]
	mov r0, r12
	strh r3, [r0]
	mov r1, r10
	strh r3, [r1]
	ldr r0, _080126F0 @ =gLastHitBy
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	strh r3, [r6]
	strh r3, [r7]
	ldr r1, _080126F4 @ =gBattleResources
	ldr r0, [r1]
	ldr r0, [r0, 0x4]
	adds r0, r5
	str r3, [r0]
	movs r0, 0x2
	add r10, r0
	add r12, r0
	add r9, r0
	add r8, r0
	adds r4, 0x1C
	adds r5, 0x4
	adds r7, 0x2
	adds r6, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	ble _08012464
	movs r5, 0
	ldr r3, _080126F8 @ =gSideTimers
	ldr r4, _080126FC @ =gSideStatuses
	movs r2, 0x1
_080124C6:
	strh r5, [r4]
	movs r1, 0
_080124CA:
	adds r0, r3, r1
	strb r5, [r0]
	adds r1, 0x1
	cmp r1, 0xB
	bls _080124CA
	adds r3, 0xC
	adds r4, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _080124C6
	movs r1, 0
	ldr r2, _08012700 @ =gBattlerAttacker
	strb r1, [r2]
	ldr r0, _08012704 @ =gBattlerTarget
	strb r1, [r0]
	ldr r2, _08012708 @ =gBattleWeather
	strh r1, [r2]
	ldr r1, _0801270C @ =gWishFutureKnock
	movs r2, 0
	movs r3, 0
_080124F2:
	adds r0, r1, r2
	strb r3, [r0]
	adds r2, 0x1
	cmp r2, 0x2B
	bls _080124F2
	movs r0, 0
	ldr r1, _08012710 @ =gHitMarker
	str r0, [r1]
	ldr r2, _08012714 @ =gBattleTypeFlags
	ldr r0, [r2]
	ldr r1, _08012718 @ =0x00010002
	ands r0, r1
	cmp r0, 0
	bne _08012522
	ldr r1, _0801271C @ =gSaveBlock2Ptr
	ldr r0, [r1]
	ldrb r1, [r0, 0x15]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08012522
	movs r0, 0x80
	ldr r2, _08012710 @ =gHitMarker
	str r0, [r2]
_08012522:
	ldr r1, _0801271C @ =gSaveBlock2Ptr
	ldr r0, [r1]
	ldrb r0, [r0, 0x15]
	lsls r0, 30
	lsrs r0, 31
	movs r1, 0
	ldr r2, _08012720 @ =gBattleScripting
	strb r0, [r2, 0x1D]
	ldr r0, _08012724 @ =gMultiHitCounter
	strb r1, [r0]
	ldr r2, _08012728 @ =gBattleOutcome
	strb r1, [r2]
	ldr r0, _0801272C @ =gBattleControllerExecFlags
	str r1, [r0]
	movs r2, 0
	ldr r0, _08012730 @ =gPaydayMoney
	strh r1, [r0]
	ldr r1, _080126F4 @ =gBattleResources
	ldr r0, [r1]
	ldr r0, [r0, 0x8]
	adds r0, 0x20
	strb r2, [r0]
	ldr r0, [r1]
	ldr r0, [r0, 0xC]
	adds r0, 0x20
	strb r2, [r0]
	ldr r1, _08012734 @ =gBattleCommunication
	movs r2, 0
	adds r0, r1, 0x7
_0801255C:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _0801255C
	movs r2, 0
	mov r9, r2
	ldr r0, _08012738 @ =gPauseCounterBattle
	strh r2, [r0]
	movs r0, 0
	ldr r1, _0801273C @ =gBattleMoveDamage
	str r0, [r1]
	ldr r2, _08012740 @ =gIntroSlideFlags
	strh r0, [r2]
	mov r1, r9
	ldr r0, _08012720 @ =gBattleScripting
	strb r1, [r0, 0x18]
	strb r1, [r0, 0x19]
	ldr r2, _08012744 @ =gLeveledUpInBattle
	strb r1, [r2]
	ldr r0, _08012748 @ =gAbsentBattlerFlags
	strb r1, [r0]
	ldr r7, _0801274C @ =gBattleStruct
	ldr r0, [r7]
	adds r0, 0x6C
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, 0x79
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, 0x7A
	strb r1, [r0]
	ldr r0, _08012750 @ =gEnemyParty
	movs r1, 0xB
	bl GetMonData
	ldr r4, [r7]
	adds r4, 0x7C
	ldr r1, _08012754 @ =gBaseStats
	mov r8, r1
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x8]
	movs r5, 0x64
	muls r0, r5
	ldr r6, _08012758 @ =0x000004fb
	adds r1, r6, 0
	bl __divsi3
	strb r0, [r4]
	ldr r0, _08012750 @ =gEnemyParty
	movs r1, 0xB
	bl GetMonData
	ldr r4, [r7]
	adds r4, 0x7B
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x18]
	muls r0, r5
	adds r1, r6, 0
	bl __divsi3
	strb r0, [r4]
	ldr r0, [r7]
	adds r1, r0, 0
	adds r1, 0x7B
	ldrb r0, [r1]
	cmp r0, 0x1
	bhi _080125F2
	movs r0, 0x2
	strb r0, [r1]
_080125F2:
	ldr r0, [r7]
	mov r2, r9
	strb r2, [r0, 0x12]
	ldr r0, [r7]
	adds r0, 0x4A
	movs r1, 0x1
	strb r1, [r0]
	movs r2, 0
	adds r4, r7, 0
	ldr r5, _0801275C @ =gBattleResults
	adds r3, r4, 0
	movs r1, 0
_0801260A:
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, 0x98
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, 0xB8
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, 0xC8
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, 0xD0
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, 0xE0
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, 0xE8
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, 0xF0
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, 0xF8
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x7
	ble _0801260A
	ldr r0, [r4]
	adds r0, 0x92
	movs r1, 0x6
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x93
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xDF
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0801275C @ =gBattleResults
	movs r1, 0
	movs r2, 0xA
	adds r0, 0x40
_0801266E:
	strb r1, [r0]
	subs r0, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _0801266E
	movs r1, 0
	strb r1, [r5, 0x13]
	strb r1, [r5]
	strb r1, [r5, 0x1]
	strb r1, [r5, 0x2]
	strb r1, [r5, 0x3]
	strb r1, [r5, 0x4]
	ldrb r2, [r5, 0x5]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	movs r2, 0x3
	negs r2, r2
	ands r0, r2
	strb r0, [r5, 0x5]
	strh r1, [r5, 0x20]
	strh r1, [r5, 0x22]
	strh r1, [r5, 0x24]
	strh r1, [r5, 0x6]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x28]
	movs r2, 0
	adds r4, r5, 0
	adds r4, 0x8
	movs r3, 0
	adds r1, r5, 0
	adds r1, 0x14
_080126AE:
	adds r0, r2, r4
	strb r3, [r0]
	strb r3, [r1]
	strb r3, [r1, 0x16]
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x9
	ble _080126AE
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080126CC: .4byte gLastResultingMoves
_080126D0: .4byte gLastHitByType
_080126D4: .4byte gLastLandedMoves
_080126D8: .4byte gLastMoves
_080126DC: .4byte gDisableStructs
_080126E0: .4byte gLastPrintedMoves
_080126E4: .4byte gLockedMoves
_080126E8: .4byte gStatuses3
_080126EC: .4byte gUnknown_2023DD4
_080126F0: .4byte gLastHitBy
_080126F4: .4byte gBattleResources
_080126F8: .4byte gSideTimers
_080126FC: .4byte gSideStatuses
_08012700: .4byte gBattlerAttacker
_08012704: .4byte gBattlerTarget
_08012708: .4byte gBattleWeather
_0801270C: .4byte gWishFutureKnock
_08012710: .4byte gHitMarker
_08012714: .4byte gBattleTypeFlags
_08012718: .4byte 0x00010002
_0801271C: .4byte gSaveBlock2Ptr
_08012720: .4byte gBattleScripting
_08012724: .4byte gMultiHitCounter
_08012728: .4byte gBattleOutcome
_0801272C: .4byte gBattleControllerExecFlags
_08012730: .4byte gPaydayMoney
_08012734: .4byte gBattleCommunication
_08012738: .4byte gPauseCounterBattle
_0801273C: .4byte gBattleMoveDamage
_08012740: .4byte gIntroSlideFlags
_08012744: .4byte gLeveledUpInBattle
_08012748: .4byte gAbsentBattlerFlags
_0801274C: .4byte gBattleStruct
_08012750: .4byte gEnemyParty
_08012754: .4byte gBaseStats
_08012758: .4byte 0x000004fb
_0801275C: .4byte gBattleResults
	thumb_func_end sub_8012434

	thumb_func_start SwitchInClearSetData
SwitchInClearSetData: @ 8012760
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, _080128C4 @ =gDisableStructs
	ldr r5, _080128C8 @ =gActiveBattler
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r1, sp
	adds r0, r4
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _080128CC @ =gBattleMoves
	ldr r3, _080128D0 @ =gCurrentMove
	ldrh r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	mov r9, r4
	mov r12, r5
	ldr r6, _080128D4 @ =gStatuses3
	mov r10, r6
	cmp r0, 0x7F
	beq _08012838
	movs r5, 0
	mov r4, r12
	movs r3, 0x58
	ldr r2, _080128D8 @ =gBattleMons
	adds r2, 0x18
	movs r1, 0x6
_080127B0:
	ldrb r0, [r4]
	muls r0, r3
	adds r0, r5, r0
	adds r0, r2
	strb r1, [r0]
	adds r5, 0x1
	cmp r5, 0x7
	ble _080127B0
	movs r5, 0
	ldr r7, _080128DC @ =gBattlersCount
	ldrb r7, [r7]
	cmp r5, r7
	bge _08012824
	ldr r0, _080128E0 @ =gUnknown_2023C34
	mov r8, r0
	ldr r3, _080128C4 @ =gDisableStructs
	ldr r4, _080128D4 @ =gStatuses3
_080127D2:
	movs r0, 0x58
	muls r0, r5
	mov r1, r8
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 19
	ands r0, r1
	cmp r0, 0
	beq _080127F6
	ldrb r0, [r3, 0x14]
	ldr r6, _080128C8 @ =gActiveBattler
	ldrb r6, [r6]
	cmp r0, r6
	bne _080127F6
	ldr r0, _080128E4 @ =0xfbffffff
	ands r1, r0
	str r1, [r2]
_080127F6:
	ldr r1, [r4]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _08012816
	ldrb r0, [r3, 0x15]
	ldr r7, _080128C8 @ =gActiveBattler
	ldrb r7, [r7]
	cmp r0, r7
	bne _08012816
	movs r0, 0x19
	negs r0, r0
	ands r1, r0
	str r1, [r4]
	movs r0, 0
	strb r0, [r3, 0x15]
_08012816:
	adds r3, 0x1C
	adds r4, 0x4
	adds r5, 0x1
	ldr r0, _080128DC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _080127D2
_08012824:
	ldr r1, _080128D0 @ =gCurrentMove
	ldrh r0, [r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _080128CC @ =gBattleMoves
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0x7F
	bne _080128F0
_08012838:
	mov r3, r12
	ldrb r1, [r3]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	ldr r0, _080128D8 @ =gBattleMons
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _080128E8 @ =0x15100007
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r3]
	lsls r1, 2
	add r1, r10
	ldr r0, [r1]
	ldr r2, _080128EC @ =0x0003043f
	ands r0, r2
	str r0, [r1]
	movs r5, 0
	ldr r6, _080128DC @ =gBattlersCount
	ldrb r6, [r6]
	cmp r5, r6
	bge _0801290C
	mov r7, r12
	movs r6, 0
_0801286C:
	ldrb r0, [r7]
	bl GetBattlerSide
	adds r4, r0, 0
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _080128AC
	ldr r1, _080128D4 @ =gStatuses3
	lsls r0, r5, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _080128AC
	ldr r0, _080128C4 @ =gDisableStructs
	adds r0, r6, r0
	ldrb r0, [r0, 0x15]
	ldrb r3, [r7]
	cmp r0, r3
	bne _080128AC
	movs r0, 0x19
	negs r0, r0
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	str r1, [r2]
_080128AC:
	adds r6, 0x1C
	adds r5, 0x1
	ldr r0, _080128DC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801286C
	ldr r6, _080128C4 @ =gDisableStructs
	mov r9, r6
	ldr r7, _080128C8 @ =gActiveBattler
	mov r12, r7
	b _0801290C
	.align 2, 0
_080128C4: .4byte gDisableStructs
_080128C8: .4byte gActiveBattler
_080128CC: .4byte gBattleMoves
_080128D0: .4byte gCurrentMove
_080128D4: .4byte gStatuses3
_080128D8: .4byte gBattleMons
_080128DC: .4byte gBattlersCount
_080128E0: .4byte gUnknown_2023C34
_080128E4: .4byte 0xfbffffff
_080128E8: .4byte 0x15100007
_080128EC: .4byte 0x0003043f
_080128F0:
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _08012B7C @ =gBattleMons
	adds r1, 0x50
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	mov r2, r12
	ldrb r0, [r2]
	lsls r0, 2
	add r0, r10
	str r1, [r0]
_0801290C:
	movs r5, 0
	ldr r7, _08012B80 @ =gBattleStruct
	ldr r3, _08012B84 @ =gActionSelectionCursor
	mov r10, r3
	ldr r6, _08012B88 @ =gBattlersCount
	ldrb r6, [r6]
	cmp r5, r6
	bge _0801296C
	ldr r0, _08012B8C @ =gUnknown_2023C34
	mov r8, r0
	ldr r6, _08012B90 @ =gBitTable
	ldr r4, _08012B94 @ =gActiveBattler
_08012924:
	movs r0, 0x58
	muls r0, r5
	mov r1, r8
	adds r3, r0, r1
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r2, r0, 16
	ldr r1, [r3]
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _08012944
	bics r1, r2
	str r1, [r3]
_08012944:
	ldr r1, [r3]
	movs r0, 0xE0
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08012962
	ldr r0, [r7]
	adds r0, r5, r0
	ldrb r0, [r0, 0x14]
	ldrb r2, [r4]
	cmp r0, r2
	bne _08012962
	ldr r0, _08012B98 @ =0xffff1fff
	ands r1, r0
	str r1, [r3]
_08012962:
	adds r5, 0x1
	ldr r3, _08012B88 @ =gBattlersCount
	ldrb r3, [r3]
	cmp r5, r3
	blt _08012924
_0801296C:
	mov r6, r12
	ldrb r0, [r6]
	add r0, r10
	movs r1, 0
	strb r1, [r0]
	ldrb r0, [r6]
	ldr r2, _08012B9C @ =gMoveSelectionCursor
	adds r0, r2
	strb r1, [r0]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r3, r9
	adds r1, r0, r3
	movs r5, 0
	movs r2, 0
_0801298E:
	adds r0, r1, r5
	strb r2, [r0]
	adds r5, 0x1
	cmp r5, 0x1B
	bls _0801298E
	ldr r6, _08012BA0 @ =gCurrentMove
	ldrh r0, [r6]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _08012BA4 @ =gBattleMoves
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x7F
	bne _08012A1A
	mov r2, r12
	ldrb r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	mov r1, sp
	ldrb r1, [r1, 0xA]
	strb r1, [r0, 0xA]
	ldrb r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	mov r1, sp
	ldrb r1, [r1, 0x15]
	strb r1, [r0, 0x15]
	ldrb r0, [r2]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r9
	mov r0, sp
	ldrb r2, [r0, 0xF]
	lsls r2, 28
	movs r4, 0xF
	lsrs r2, 28
	ldrb r3, [r1, 0xF]
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xF]
	mov r3, r12
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	mov r1, sp
	ldrb r1, [r1, 0xF]
	lsrs r1, 4
	lsls r1, 4
	ldrb r2, [r0, 0xF]
	ands r4, r2
	orrs r4, r1
	strb r4, [r0, 0xF]
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	mov r1, sp
	ldrb r1, [r1, 0x14]
	strb r1, [r0, 0x14]
_08012A1A:
	movs r0, 0
	ldr r6, _08012BA8 @ =gMoveResultFlags
	strb r0, [r6]
	mov r0, r12
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	movs r2, 0
	movs r1, 0x2
	strb r1, [r0, 0x16]
	mov r1, r12
	ldrb r0, [r1]
	lsls r0, 1
	ldr r3, _08012BAC @ =gLastMoves
	adds r0, r3
	movs r3, 0
	strh r2, [r0]
	ldrb r0, [r1]
	lsls r0, 1
	ldr r6, _08012BB0 @ =gLastLandedMoves
	adds r0, r6
	strh r2, [r0]
	ldrb r0, [r1]
	lsls r0, 1
	ldr r1, _08012BB4 @ =gLastHitByType
	adds r0, r1
	strh r2, [r0]
	mov r6, r12
	ldrb r0, [r6]
	lsls r0, 1
	ldr r1, _08012BB8 @ =gLastResultingMoves
	adds r0, r1
	strh r2, [r0]
	ldrb r0, [r6]
	lsls r0, 1
	ldr r6, _08012BBC @ =gLastPrintedMoves
	adds r0, r6
	strh r2, [r0]
	mov r1, r12
	ldrb r0, [r1]
	ldr r2, _08012BC0 @ =gLastHitBy
	adds r0, r2
	movs r1, 0xFF
	strb r1, [r0]
	mov r6, r12
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 1
	adds r0, r1
	adds r0, 0x98
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 1
	adds r0, r1
	adds r0, 0x99
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE0
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE1
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE2
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE3
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE4
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE5
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE6
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r7]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE7
	strb r3, [r0]
	movs r5, 0
	ldr r0, _08012B88 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	bge _08012B3C
	adds r4, r7, 0
_08012AFC:
	ldrb r1, [r6]
	cmp r5, r1
	beq _08012B14
	ldr r0, [r4]
	lsls r1, r5, 1
	adds r0, r1, r0
	adds r0, 0x98
	strb r3, [r0]
	ldr r0, [r4]
	adds r1, r0
	adds r1, 0x99
	strb r3, [r1]
_08012B14:
	ldrb r0, [r6]
	ldr r1, [r4]
	lsls r0, 1
	lsls r2, r5, 3
	adds r0, r2
	adds r0, r1
	adds r0, 0xE0
	strb r3, [r0]
	ldrb r0, [r6]
	ldr r1, [r4]
	lsls r0, 1
	adds r0, r2
	adds r0, r1
	adds r0, 0xE1
	strb r3, [r0]
	adds r5, 0x1
	ldr r2, _08012B88 @ =gBattlersCount
	ldrb r2, [r2]
	cmp r5, r2
	blt _08012AFC
_08012B3C:
	mov r3, r12
	ldrb r0, [r3]
	ldr r1, [r7]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC8
	movs r2, 0
	strb r2, [r0]
	ldrb r0, [r3]
	ldr r1, [r7]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC9
	strb r2, [r0]
	ldr r6, _08012BC4 @ =gBattleResources
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	ldrb r0, [r3]
	lsls r0, 2
	adds r1, r0
	movs r0, 0
	str r0, [r1]
	ldr r7, _08012BA0 @ =gCurrentMove
	strh r0, [r7]
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012B7C: .4byte gBattleMons
_08012B80: .4byte gBattleStruct
_08012B84: .4byte gActionSelectionCursor
_08012B88: .4byte gBattlersCount
_08012B8C: .4byte gUnknown_2023C34
_08012B90: .4byte gBitTable
_08012B94: .4byte gActiveBattler
_08012B98: .4byte 0xffff1fff
_08012B9C: .4byte gMoveSelectionCursor
_08012BA0: .4byte gCurrentMove
_08012BA4: .4byte gBattleMoves
_08012BA8: .4byte gMoveResultFlags
_08012BAC: .4byte gLastMoves
_08012BB0: .4byte gLastLandedMoves
_08012BB4: .4byte gLastHitByType
_08012BB8: .4byte gLastResultingMoves
_08012BBC: .4byte gLastPrintedMoves
_08012BC0: .4byte gLastHitBy
_08012BC4: .4byte gBattleResources
	thumb_func_end SwitchInClearSetData

	thumb_func_start FaintClearSetData
FaintClearSetData: @ 8012BC8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r3, 0
	ldr r7, _08012F5C @ =gActiveBattler
	ldr r6, _08012F60 @ =gStatuses3
	ldr r0, _08012F64 @ =gActionSelectionCursor
	mov r8, r0
	ldr r1, _08012F68 @ =gMoveSelectionCursor
	mov r9, r1
	ldr r2, _08012F6C @ =gProtectStructs
	mov r12, r2
	adds r5, r7, 0
	movs r4, 0x58
	ldr r2, _08012F70 @ =gBattleMons
	adds r2, 0x18
	movs r1, 0x6
_08012BEE:
	ldrb r0, [r5]
	muls r0, r4
	adds r0, r3, r0
	adds r0, r2
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x7
	ble _08012BEE
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	ldr r2, _08012F70 @ =gBattleMons
	adds r2, 0x50
	adds r0, r2
	movs r1, 0
	str r1, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r6
	str r1, [r0]
	movs r3, 0
	ldr r0, _08012F74 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r3, r0
	bge _08012C8A
	adds r4, r2, 0
	movs r5, 0
	ldr r6, _08012F78 @ =gBitTable
_08012C26:
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 19
	ands r0, r1
	cmp r0, 0
	beq _08012C44
	ldr r2, _08012F7C @ =gDisableStructs
	adds r0, r5, r2
	ldrb r0, [r0, 0x14]
	ldrb r2, [r7]
	cmp r0, r2
	bne _08012C44
	ldr r0, _08012F80 @ =0xfbffffff
	ands r1, r0
	str r1, [r4]
_08012C44:
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r2, r0, 16
	ldr r1, [r4]
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _08012C5C
	bics r1, r2
	str r1, [r4]
_08012C5C:
	ldr r1, [r4]
	movs r0, 0xE0
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08012C7C
	ldr r2, _08012F84 @ =gBattleStruct
	ldr r0, [r2]
	adds r0, r3, r0
	ldrb r0, [r0, 0x14]
	ldrb r2, [r7]
	cmp r0, r2
	bne _08012C7C
	ldr r0, _08012F88 @ =0xffff1fff
	ands r1, r0
	str r1, [r4]
_08012C7C:
	adds r4, 0x58
	adds r5, 0x1C
	adds r3, 0x1
	ldr r0, _08012F74 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r3, r0
	blt _08012C26
_08012C8A:
	ldrb r0, [r7]
	add r0, r8
	movs r1, 0
	strb r1, [r0]
	ldrb r0, [r7]
	add r0, r9
	strb r1, [r0]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r2, _08012F7C @ =gDisableStructs
	adds r1, r0, r2
	movs r3, 0
	movs r2, 0
_08012CA8:
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, 0x1
	cmp r3, 0x1B
	bls _08012CA8
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	mov r9, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	mov r8, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1]
	movs r6, 0x5
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	mov r10, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1]
	movs r5, 0x21
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1]
	movs r4, 0x41
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1, 0x1]
	mov r0, r9
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1, 0x1]
	mov r0, r8
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1, 0x1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r1, [r7]
	lsls r1, 4
	add r1, r12
	ldrb r2, [r1, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r12
	ldrb r1, [r0, 0x1]
	ands r5, r1
	strb r5, [r0, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r12
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r12
	ldrb r1, [r0, 0x1]
	ands r3, r1
	strb r3, [r0, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r12
	ldrb r1, [r0, 0x2]
	mov r2, r9
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r12
	ldrb r1, [r0, 0x2]
	mov r2, r8
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r12
	ldrb r1, [r0, 0x2]
	ands r6, r1
	strb r6, [r0, 0x2]
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r12
	ldrb r1, [r0, 0x2]
	mov r2, r10
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _08012F7C @ =gDisableStructs
	adds r0, r1
	movs r2, 0
	movs r1, 0x2
	strb r1, [r0, 0x16]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08012F8C @ =gLastMoves
	adds r0, r1
	movs r3, 0
	strh r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08012F90 @ =gLastLandedMoves
	adds r0, r1
	strh r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08012F94 @ =gLastHitByType
	adds r0, r1
	strh r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08012F98 @ =gLastResultingMoves
	adds r0, r1
	strh r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08012F9C @ =gLastPrintedMoves
	adds r0, r1
	strh r2, [r0]
	ldrb r0, [r7]
	ldr r2, _08012FA0 @ =gLastHitBy
	adds r0, r2
	movs r1, 0xFF
	strb r1, [r0]
	ldrb r0, [r7]
	ldr r2, _08012F84 @ =gBattleStruct
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC8
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0xC9
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0x98
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 1
	adds r0, r1
	adds r0, 0x99
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE0
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE1
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE2
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE3
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE4
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE5
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE6
	strb r3, [r0]
	ldrb r0, [r7]
	ldr r1, [r2]
	lsls r0, 3
	adds r0, r1
	adds r0, 0xE7
	strb r3, [r0]
	movs r3, 0
	ldr r0, _08012F74 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r3, r0
	bge _08012F04
	adds r6, r7, 0
	adds r5, r2, 0
	movs r4, 0
_08012EC4:
	ldrb r1, [r6]
	cmp r3, r1
	beq _08012EDC
	ldr r0, [r5]
	lsls r1, r3, 1
	adds r0, r1, r0
	adds r0, 0x98
	strb r4, [r0]
	ldr r0, [r5]
	adds r1, r0
	adds r1, 0x99
	strb r4, [r1]
_08012EDC:
	ldrb r0, [r6]
	ldr r1, [r5]
	lsls r0, 1
	lsls r2, r3, 3
	adds r0, r2
	adds r0, r1
	adds r0, 0xE0
	strb r4, [r0]
	ldrb r0, [r6]
	ldr r1, [r5]
	lsls r0, 1
	adds r0, r2
	adds r0, r1
	adds r0, 0xE1
	strb r4, [r0]
	adds r3, 0x1
	ldr r2, _08012F74 @ =gBattlersCount
	ldrb r2, [r2]
	cmp r3, r2
	blt _08012EC4
_08012F04:
	ldr r1, _08012FA4 @ =gBattleResources
	ldr r0, [r1]
	ldr r1, [r0, 0x4]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, r0
	movs r0, 0
	str r0, [r1]
	ldrb r0, [r7]
	movs r3, 0x58
	adds r1, r0, 0
	muls r1, r3
	ldr r2, _08012F70 @ =gBattleMons
	adds r1, r2
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	ldr r2, _08012FA8 @ =gBaseStats
	adds r0, r2
	ldrb r0, [r0, 0x6]
	adds r1, 0x21
	strb r0, [r1]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r3
	ldr r0, _08012F70 @ =gBattleMons
	adds r1, r0
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	ldr r2, _08012FA8 @ =gBaseStats
	adds r0, r2
	ldrb r0, [r0, 0x7]
	adds r1, 0x22
	strb r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012F5C: .4byte gActiveBattler
_08012F60: .4byte gStatuses3
_08012F64: .4byte gActionSelectionCursor
_08012F68: .4byte gMoveSelectionCursor
_08012F6C: .4byte gProtectStructs
_08012F70: .4byte gBattleMons
_08012F74: .4byte gBattlersCount
_08012F78: .4byte gBitTable
_08012F7C: .4byte gDisableStructs
_08012F80: .4byte 0xfbffffff
_08012F84: .4byte gBattleStruct
_08012F88: .4byte 0xffff1fff
_08012F8C: .4byte gLastMoves
_08012F90: .4byte gLastLandedMoves
_08012F94: .4byte gLastHitByType
_08012F98: .4byte gLastResultingMoves
_08012F9C: .4byte gLastPrintedMoves
_08012FA0: .4byte gLastHitBy
_08012FA4: .4byte gBattleResources
_08012FA8: .4byte gBaseStats
	thumb_func_end FaintClearSetData

	thumb_func_start BattleIntroGetMonsData
BattleIntroGetMonsData: @ 8012FAC
	push {r4,r5,lr}
	ldr r5, _08012FBC @ =gBattleCommunication
	ldrb r0, [r5]
	cmp r0, 0
	beq _08012FC0
	cmp r0, 0x1
	beq _08012FE4
	b _0801301A
	.align 2, 0
_08012FBC: .4byte gBattleCommunication
_08012FC0:
	ldr r4, _08012FE0 @ =gActiveBattler
	ldrb r0, [r5, 0x1]
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl BtlController_EmitGetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0801301A
	.align 2, 0
_08012FE0: .4byte gActiveBattler
_08012FE4:
	ldr r0, _08013008 @ =gBattleControllerExecFlags
	ldr r2, [r0]
	cmp r2, 0
	bne _0801301A
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
	ldr r1, _0801300C @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08013018
	ldr r1, _08013010 @ =gBattleMainFunc
	ldr r0, _08013014 @ =BattleIntroPrepareBackgroundSlide
	str r0, [r1]
	b _0801301A
	.align 2, 0
_08013008: .4byte gBattleControllerExecFlags
_0801300C: .4byte gBattlersCount
_08013010: .4byte gBattleMainFunc
_08013014: .4byte BattleIntroPrepareBackgroundSlide
_08013018:
	strb r2, [r5]
_0801301A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleIntroGetMonsData

	thumb_func_start BattleIntroPrepareBackgroundSlide
BattleIntroPrepareBackgroundSlide: @ 8013020
	push {r4,r5,lr}
	ldr r0, _08013058 @ =gBattleControllerExecFlags
	ldr r5, [r0]
	cmp r5, 0
	bne _08013050
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r4, _0801305C @ =gActiveBattler
	strb r0, [r4]
	ldr r0, _08013060 @ =gBattleTerrain
	ldrb r1, [r0]
	movs r0, 0
	bl BtlController_EmitIntroSlide
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _08013064 @ =gBattleMainFunc
	ldr r0, _08013068 @ =sub_8013070
	str r0, [r1]
	ldr r0, _0801306C @ =gBattleCommunication
	strb r5, [r0]
	strb r5, [r0, 0x1]
_08013050:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013058: .4byte gBattleControllerExecFlags
_0801305C: .4byte gActiveBattler
_08013060: .4byte gBattleTerrain
_08013064: .4byte gBattleMainFunc
_08013068: .4byte sub_8013070
_0801306C: .4byte gBattleCommunication
	thumb_func_end BattleIntroPrepareBackgroundSlide

	thumb_func_start sub_8013070
sub_8013070: @ 8013070
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080130D4 @ =gBattleControllerExecFlags
	ldr r1, [r0]
	cmp r1, 0
	beq _08013084
	b _08013314
_08013084:
	ldr r2, _080130D8 @ =gActiveBattler
	strb r1, [r2]
	ldr r0, _080130DC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08013092
	b _0801330E
_08013092:
	movs r7, 0x58
	ldr r0, _080130E0 @ =gBattleMons
	mov r8, r0
	mov r9, r2
	movs r1, 0x48
	add r1, r8
	mov r10, r1
_080130A0:
	ldr r0, _080130E4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080130E8
	ldr r4, _080130D8 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080130E8
	ldrb r0, [r4]
	muls r0, r7
	mov r2, r8
	adds r3, r0, r2
	movs r2, 0
	movs r1, 0
_080130C6:
	adds r0, r3, r2
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x57
	bls _080130C6
	b _080131B6
	.align 2, 0
_080130D4: .4byte gBattleControllerExecFlags
_080130D8: .4byte gActiveBattler
_080130DC: .4byte gBattlersCount
_080130E0: .4byte gBattleMons
_080130E4: .4byte gBattleTypeFlags
_080130E8:
	mov r1, r9
	ldrb r0, [r1]
	muls r0, r7
	mov r2, r8
	adds r3, r0, r2
	movs r2, 0
	ldr r6, _08013230 @ =gBaseStats
	ldr r5, _08013234 @ =gBattleBufferB
	ldr r4, _08013238 @ =gActiveBattler
_080130FA:
	adds r0, r3, r2
	ldrb r1, [r4]
	lsls r1, 9
	adds r1, 0x4
	adds r1, r2, r1
	adds r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x57
	bls _080130FA
	mov r1, r9
	ldrb r0, [r1]
	adds r2, r0, 0
	muls r2, r7
	add r2, r8
	ldrh r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x6]
	adds r2, 0x21
	strb r0, [r2]
	mov r2, r9
	ldrb r0, [r2]
	adds r2, r0, 0
	muls r2, r7
	add r2, r8
	ldrh r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x7]
	adds r2, 0x22
	strb r0, [r2]
	mov r1, r9
	ldrb r0, [r1]
	adds r1, r0, 0
	muls r1, r7
	add r1, r8
	ldrh r0, [r1]
	ldrb r1, [r1, 0x17]
	lsrs r1, 7
	bl GetAbilityBySpecies
	mov r2, r9
	ldrb r1, [r2]
	muls r1, r7
	add r1, r8
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r2]
	bl GetBattlerSide
	ldr r1, _0801323C @ =gBattleStruct
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0xA8
	ldr r1, [r1]
	adds r1, r0
	mov r2, r9
	ldrb r0, [r2]
	muls r0, r7
	add r0, r8
	ldrh r0, [r0, 0x28]
	strh r0, [r1]
	movs r2, 0
	ldr r4, _08013238 @ =gActiveBattler
	movs r5, 0x58
	ldr r1, _08013240 @ =gUnknown_2023BFC
	adds r6, r4, 0
	movs r0, 0x18
	negs r0, r0
	adds r0, r1
	mov r12, r0
	movs r3, 0x6
_08013196:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r2, r0
	adds r0, r1
	strb r3, [r0]
	adds r2, 0x1
	cmp r2, 0x7
	ble _08013196
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r7
	mov r0, r12
	adds r0, 0x50
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_080131B6:
	ldr r4, _08013238 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	bne _080131D0
	movs r0, 0
	bl BtlController_EmitDrawTrainerPic
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_080131D0:
	ldr r5, _08013244 @ =gBattleTypeFlags
	ldr r0, [r5]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0801324C
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080131F6
	movs r0, 0
	bl BtlController_EmitDrawTrainerPic
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_080131F6:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080132C2
	ldr r0, [r5]
	ldr r1, _08013248 @ =0x0001aa02
	ands r0, r1
	cmp r0, 0
	bne _080132C2
	ldrb r0, [r4]
	muls r0, r7
	add r0, r8
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4]
	muls r1, r7
	add r1, r10
	ldr r2, [r1]
	movs r1, 0x2
	bl HandleSetPokedexFlag
	b _080132C2
	.align 2, 0
_08013230: .4byte gBaseStats
_08013234: .4byte gBattleBufferB
_08013238: .4byte gActiveBattler
_0801323C: .4byte gBattleStruct
_08013240: .4byte gUnknown_2023BFC
_08013244: .4byte gBattleTypeFlags
_08013248: .4byte 0x0001aa02
_0801324C:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080132C2
	ldr r1, [r5]
	movs r2, 0xA0
	lsls r2, 8
	ands r2, r1
	cmp r2, 0
	beq _0801328E
	movs r0, 0x80
	lsls r0, 8
	cmp r2, r0
	beq _080132B4
	ldrb r0, [r4]
	muls r0, r7
	add r0, r8
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4]
	muls r1, r7
	add r1, r10
	ldr r2, [r1]
	movs r1, 0x2
	bl HandleSetPokedexFlag
	b _080132B4
_0801328E:
	ldr r0, _08013324 @ =0x0001aa02
	ands r1, r0
	cmp r1, 0
	bne _080132B4
	ldrb r0, [r4]
	muls r0, r7
	add r0, r8
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4]
	muls r1, r7
	add r1, r10
	ldr r2, [r1]
	movs r1, 0x2
	bl HandleSetPokedexFlag
_080132B4:
	movs r0, 0
	bl BtlController_EmitLoadMonSprite
	mov r1, r9
	ldrb r0, [r1]
	bl MarkBattlerForControllerExec
_080132C2:
	ldr r0, _08013328 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080132F8
	ldr r4, _0801332C @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080132EC
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080132F8
_080132EC:
	movs r0, 0
	bl BtlController_EmitDrawTrainerPic
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_080132F8:
	mov r2, r9
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r1, _08013330 @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0801330E
	b _080130A0
_0801330E:
	ldr r1, _08013334 @ =gBattleMainFunc
	ldr r0, _08013338 @ =BattleIntroDrawPartySummaryScreens
	str r0, [r1]
_08013314:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013324: .4byte 0x0001aa02
_08013328: .4byte gBattleTypeFlags
_0801332C: .4byte gActiveBattler
_08013330: .4byte gBattlersCount
_08013334: .4byte gBattleMainFunc
_08013338: .4byte BattleIntroDrawPartySummaryScreens
	thumb_func_end sub_8013070

	thumb_func_start BattleIntroDrawPartySummaryScreens
BattleIntroDrawPartySummaryScreens: @ 801333C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x30
	ldr r0, _08013394 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	beq _0801334E
	b _080134C8
_0801334E:
	ldr r0, _08013398 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0801335C
	b _08013468
_0801335C:
	movs r7, 0
	add r0, sp, 0x4
	mov r8, r0
	mov r6, r8
	mov r5, sp
_08013366:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0801339C @ =gEnemyParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0801338C
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _080133A4
_0801338C:
	ldr r0, _080133A0 @ =0x0000ffff
	strh r0, [r5]
	movs r0, 0
	b _080133B6
	.align 2, 0
_08013394: .4byte gBattleControllerExecFlags
_08013398: .4byte gBattleTypeFlags
_0801339C: .4byte gEnemyParty
_080133A0: .4byte 0x0000ffff
_080133A4:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_080133B6:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _08013366
	movs r0, 0x1
	bl GetBattlerAtPosition
	ldr r4, _08013410 @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	mov r1, sp
	movs r2, 0x80
	bl BtlController_EmitDrawPartyStatusSummary
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	movs r7, 0
	mov r6, r8
	mov r5, sp
_080133E2:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08013414 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08013408
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _0801341C
_08013408:
	ldr r0, _08013418 @ =0x0000ffff
	strh r0, [r5]
	movs r0, 0
	b _0801342E
	.align 2, 0
_08013410: .4byte gActiveBattler
_08013414: .4byte gPlayerParty
_08013418: .4byte 0x0000ffff
_0801341C:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_0801342E:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _080133E2
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r4, _0801345C @ =gActiveBattler
	strb r0, [r4]
	movs r0, 0
	mov r1, sp
	movs r2, 0x80
	bl BtlController_EmitDrawPartyStatusSummary
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r1, _08013460 @ =gBattleMainFunc
	ldr r0, _08013464 @ =BattleIntroPrintTrainerWantsToBattle
	b _080134C6
	.align 2, 0
_0801345C: .4byte gActiveBattler
_08013460: .4byte gBattleMainFunc
_08013464: .4byte BattleIntroPrintTrainerWantsToBattle
_08013468:
	movs r7, 0
	add r6, sp, 0x4
	mov r5, sp
_0801346E:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0801349C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08013494
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _080134A4
_08013494:
	ldr r0, _080134A0 @ =0x0000ffff
	strh r0, [r5]
	movs r0, 0
	b _080134B6
	.align 2, 0
_0801349C: .4byte gPlayerParty
_080134A0: .4byte 0x0000ffff
_080134A4:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_080134B6:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _0801346E
	ldr r1, _080134D4 @ =gBattleMainFunc
	ldr r0, _080134D8 @ =sub_8013514
_080134C6:
	str r0, [r1]
_080134C8:
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080134D4: .4byte gBattleMainFunc
_080134D8: .4byte sub_8013514
	thumb_func_end BattleIntroDrawPartySummaryScreens

	thumb_func_start BattleIntroPrintTrainerWantsToBattle
BattleIntroPrintTrainerWantsToBattle: @ 80134DC
	push {lr}
	ldr r0, _08013504 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _080134FE
	movs r0, 0x1
	bl GetBattlerAtPosition
	ldr r1, _08013508 @ =gActiveBattler
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0
	bl PrepareStringBattle
	ldr r1, _0801350C @ =gBattleMainFunc
	ldr r0, _08013510 @ =sub_8013568
	str r0, [r1]
_080134FE:
	pop {r0}
	bx r0
	.align 2, 0
_08013504: .4byte gBattleControllerExecFlags
_08013508: .4byte gActiveBattler
_0801350C: .4byte gBattleMainFunc
_08013510: .4byte sub_8013568
	thumb_func_end BattleIntroPrintTrainerWantsToBattle

	thumb_func_start sub_8013514
sub_8013514: @ 8013514
	push {lr}
	ldr r0, _08013550 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _0801354A
	ldr r1, _08013554 @ =gBattleMainFunc
	ldr r0, _08013558 @ =sub_80136E4
	str r0, [r1]
	movs r0, 0
	movs r1, 0
	bl PrepareStringBattle
	ldr r0, _0801355C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0xA0
	lsls r1, 8
	ands r0, r1
	cmp r0, r1
	bne _0801354A
	movs r0, 0x1
	bl GetBattlerAtPosition
	ldr r1, _08013560 @ =gBattleScripting
	strb r0, [r1, 0x17]
	ldr r0, _08013564 @ =gUnknown_81D91A1
	bl BattleScriptExecute
_0801354A:
	pop {r0}
	bx r0
	.align 2, 0
_08013550: .4byte gBattleControllerExecFlags
_08013554: .4byte gBattleMainFunc
_08013558: .4byte sub_80136E4
_0801355C: .4byte gBattleTypeFlags
_08013560: .4byte gBattleScripting
_08013564: .4byte gUnknown_81D91A1
	thumb_func_end sub_8013514

	thumb_func_start sub_8013568
sub_8013568: @ 8013568
	push {lr}
	ldr r0, _08013590 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _0801358A
	movs r0, 0x1
	bl GetBattlerAtPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl PrepareStringBattle
	ldr r1, _08013594 @ =gBattleMainFunc
	ldr r0, _08013598 @ =sub_801359C
	str r0, [r1]
_0801358A:
	pop {r0}
	bx r0
	.align 2, 0
_08013590: .4byte gBattleControllerExecFlags
_08013594: .4byte gBattleMainFunc
_08013598: .4byte sub_801359C
	thumb_func_end sub_8013568

	thumb_func_start sub_801359C
sub_801359C: @ 801359C
	push {r4,lr}
	ldr r0, _08013614 @ =gBattleControllerExecFlags
	ldr r1, [r0]
	cmp r1, 0
	bne _0801360C
	ldr r2, _08013618 @ =gActiveBattler
	strb r1, [r2]
	ldr r0, _0801361C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08013606
	adds r4, r2, 0
_080135B4:
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080135CE
	movs r0, 0
	bl BtlController_EmitIntroTrainerBallThrow
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_080135CE:
	ldr r0, _08013620 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080135F4
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080135F4
	movs r0, 0
	bl BtlController_EmitIntroTrainerBallThrow
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_080135F4:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0801361C @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080135B4
_08013606:
	ldr r1, _08013624 @ =gBattleMainFunc
	ldr r0, _08013628 @ =sub_801362C
	str r0, [r1]
_0801360C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013614: .4byte gBattleControllerExecFlags
_08013618: .4byte gActiveBattler
_0801361C: .4byte gBattlersCount
_08013620: .4byte gBattleTypeFlags
_08013624: .4byte gBattleMainFunc
_08013628: .4byte sub_801362C
	thumb_func_end sub_801359C

	thumb_func_start sub_801362C
sub_801362C: @ 801362C
	push {r4-r7,lr}
	ldr r0, _080136A4 @ =gBattleControllerExecFlags
	ldr r1, [r0]
	cmp r1, 0
	bne _0801369C
	ldr r2, _080136A8 @ =gActiveBattler
	strb r1, [r2]
	ldr r0, _080136AC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08013696
	adds r4, r2, 0
	ldr r6, _080136B0 @ =gBattleMons
	movs r5, 0x58
	adds r7, r6, 0
	adds r7, 0x48
_0801364C:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08013684
	ldr r0, _080136B4 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _080136B8 @ =0x0001aa02
	ands r0, r1
	cmp r0, 0
	bne _08013684
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4]
	muls r1, r5
	adds r1, r7
	ldr r2, [r1]
	movs r1, 0x2
	bl HandleSetPokedexFlag
_08013684:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _080136AC @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801364C
_08013696:
	ldr r1, _080136BC @ =gBattleMainFunc
	ldr r0, _080136C0 @ =sub_80136E4
	str r0, [r1]
_0801369C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080136A4: .4byte gBattleControllerExecFlags
_080136A8: .4byte gActiveBattler
_080136AC: .4byte gBattlersCount
_080136B0: .4byte gBattleMons
_080136B4: .4byte gBattleTypeFlags
_080136B8: .4byte 0x0001aa02
_080136BC: .4byte gBattleMainFunc
_080136C0: .4byte sub_80136E4
	thumb_func_end sub_801362C

	thumb_func_start sub_80136C4
sub_80136C4: @ 80136C4
	push {lr}
	ldr r0, _080136D8 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _080136D4
	ldr r1, _080136DC @ =gBattleMainFunc
	ldr r0, _080136E0 @ =sub_80136E4
	str r0, [r1]
_080136D4:
	pop {r0}
	bx r0
	.align 2, 0
_080136D8: .4byte gBattleControllerExecFlags
_080136DC: .4byte gBattleMainFunc
_080136E0: .4byte sub_80136E4
	thumb_func_end sub_80136C4

	thumb_func_start sub_80136E4
sub_80136E4: @ 80136E4
	push {lr}
	ldr r0, _08013718 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08013712
	ldr r0, _0801371C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0801370C
	movs r0, 0
	bl GetBattlerAtPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl PrepareStringBattle
_0801370C:
	ldr r1, _08013720 @ =gBattleMainFunc
	ldr r0, _08013724 @ =sub_8013728
	str r0, [r1]
_08013712:
	pop {r0}
	bx r0
	.align 2, 0
_08013718: .4byte gBattleControllerExecFlags
_0801371C: .4byte gBattleTypeFlags
_08013720: .4byte gBattleMainFunc
_08013724: .4byte sub_8013728
	thumb_func_end sub_80136E4

	thumb_func_start sub_8013728
sub_8013728: @ 8013728
	push {r4,lr}
	ldr r0, _080137B4 @ =gBattleControllerExecFlags
	ldr r1, [r0]
	cmp r1, 0
	bne _080137AC
	ldr r2, _080137B8 @ =gActiveBattler
	strb r1, [r2]
	ldr r0, _080137BC @ =gBattlersCount
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08013790
	adds r4, r2, 0
_08013740:
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	cmp r0, 0
	bne _08013758
	movs r0, 0
	bl BtlController_EmitIntroTrainerBallThrow
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_08013758:
	ldr r0, _080137C0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801377E
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0801377E
	movs r0, 0
	bl BtlController_EmitIntroTrainerBallThrow
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0801377E:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _080137BC @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08013740
_08013790:
	ldr r2, _080137C4 @ =gBattleStruct
	ldr r0, [r2]
	adds r0, 0x4C
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xD9
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xB6
	strb r1, [r0]
	ldr r1, _080137C8 @ =gBattleMainFunc
	ldr r0, _080137CC @ =sub_801385C
	str r0, [r1]
_080137AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080137B4: .4byte gBattleControllerExecFlags
_080137B8: .4byte gActiveBattler
_080137BC: .4byte gBattlersCount
_080137C0: .4byte gBattleTypeFlags
_080137C4: .4byte gBattleStruct
_080137C8: .4byte gBattleMainFunc
_080137CC: .4byte sub_801385C
	thumb_func_end sub_8013728

	thumb_func_start sub_80137D0
sub_80137D0: @ 80137D0
	push {r4,r5,lr}
	ldr r0, _08013840 @ =gBattleControllerExecFlags
	ldr r1, [r0]
	cmp r1, 0
	bne _0801383A
	ldr r2, _08013844 @ =gActiveBattler
	strb r1, [r2]
	ldr r0, _08013848 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0801381E
	adds r4, r2, 0
	ldr r5, _0801384C @ =gBattlerPartyIndexes
_080137EA:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0801380C
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0
	bl BtlController_EmitSwitchInAnim
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
_0801380C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08013848 @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080137EA
_0801381E:
	ldr r2, _08013850 @ =gBattleStruct
	ldr r0, [r2]
	adds r0, 0x4C
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xD9
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xB6
	strb r1, [r0]
	ldr r1, _08013854 @ =gBattleMainFunc
	ldr r0, _08013858 @ =sub_801385C
	str r0, [r1]
_0801383A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013840: .4byte gBattleControllerExecFlags
_08013844: .4byte gActiveBattler
_08013848: .4byte gBattlersCount
_0801384C: .4byte gBattlerPartyIndexes
_08013850: .4byte gBattleStruct
_08013854: .4byte gBattleMainFunc
_08013858: .4byte sub_801385C
	thumb_func_end sub_80137D0

	thumb_func_start sub_801385C
sub_801385C: @ 801385C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r0, 0
	mov r9, r0
	ldr r0, _080138A0 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	beq _08013874
	b _08013ADA
_08013874:
	ldr r0, _080138A4 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x4C
	ldrb r0, [r0]
	cmp r0, 0
	bne _080138FA
	movs r5, 0
	ldr r1, _080138A8 @ =gBattlersCount
	adds r3, r1, 0
	ldrb r0, [r1]
	cmp r5, r0
	bge _0801389A
	ldr r2, _080138AC @ =gBattlerByTurnOrder
_0801388E:
	adds r0, r5, r2
	strb r5, [r0]
	adds r5, 0x1
	ldrb r0, [r1]
	cmp r5, r0
	blt _0801388E
_0801389A:
	movs r5, 0
	b _080138F0
	.align 2, 0
_080138A0: .4byte gBattleControllerExecFlags
_080138A4: .4byte gBattleStruct
_080138A8: .4byte gBattlersCount
_080138AC: .4byte gBattlerByTurnOrder
_080138B0:
	adds r4, r5, 0x1
	mov r8, r4
	ldrb r1, [r1]
	cmp r8, r1
	bge _080138EE
	ldr r6, _08013924 @ =gBattlerByTurnOrder
	ldr r3, _08013928 @ =gBattlersCount
	lsls r7, r5, 24
_080138C0:
	adds r0, r5, r6
	ldrb r0, [r0]
	adds r1, r4, r6
	ldrb r1, [r1]
	movs r2, 0x1
	str r3, [sp, 0x4]
	bl GetWhoStrikesFirst
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _080138E4
	lsls r1, r4, 24
	lsrs r1, 24
	lsrs r0, r7, 24
	bl SwapTurnOrder
	ldr r3, [sp, 0x4]
_080138E4:
	adds r4, 0x1
	ldr r0, _08013928 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	blt _080138C0
_080138EE:
	mov r5, r8
_080138F0:
	adds r1, r3, 0
	ldrb r0, [r3]
	subs r0, 0x1
	cmp r5, r0
	blt _080138B0
_080138FA:
	ldr r4, _0801392C @ =gBattleStruct
	ldr r0, [r4]
	adds r0, 0xB6
	ldrb r0, [r0]
	cmp r0, 0
	bne _08013930
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08013930
	ldr r0, [r4]
	adds r0, 0xB6
	movs r1, 0x1
	strb r1, [r0]
	b _08013ADA
	.align 2, 0
_08013924: .4byte gBattlerByTurnOrder
_08013928: .4byte gBattlersCount
_0801392C: .4byte gBattleStruct
_08013930:
	ldr r2, _08013AE8 @ =gBattleStruct
	ldr r0, [r2]
	adds r0, 0x4C
	ldr r1, _08013AEC @ =gBattlersCount
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0801398A
	ldr r5, _08013AF0 @ =gBattlerByTurnOrder
	adds r4, r2, 0
_08013944:
	ldr r0, [r4]
	adds r0, 0x4C
	ldrb r0, [r0]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _0801396A
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801396A:
	ldr r1, [r4]
	adds r1, 0x4C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	cmp r1, 0
	beq _0801397C
	b _08013ADA
_0801397C:
	ldr r0, [r4]
	adds r0, 0x4C
	ldr r1, _08013AEC @ =gBattlersCount
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08013944
_0801398A:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080139A4
	b _08013ADA
_080139A4:
	str r0, [sp]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _080139BA
	b _08013ADA
_080139BA:
	ldr r2, _08013AE8 @ =gBattleStruct
	ldr r0, [r2]
	adds r0, 0xD9
	ldr r1, _08013AEC @ =gBattlersCount
	ldrb r0, [r0]
	adds r3, r1, 0
	ldrb r1, [r3]
	cmp r0, r1
	bcs _08013A14
	ldr r5, _08013AF0 @ =gBattlerByTurnOrder
	adds r4, r2, 0
_080139D0:
	ldr r0, [r4]
	adds r0, 0xD9
	ldrb r0, [r0]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0
	str r3, [sp, 0x4]
	bl ItemBattleEffects
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _080139F6
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080139F6:
	ldr r1, [r4]
	adds r1, 0xD9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r0, r9
	cmp r0, 0
	bne _08013ADA
	ldr r0, [r4]
	adds r0, 0xD9
	ldr r1, _08013AEC @ =gBattlersCount
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080139D0
_08013A14:
	ldrb r0, [r3]
	cmp r0, 0
	beq _08013A22
	adds r5, r0, 0
_08013A1C:
	subs r5, 0x1
	cmp r5, 0
	bne _08013A1C
_08013A22:
	movs r5, 0
	ldr r1, _08013AE8 @ =gBattleStruct
	mov r8, r1
	movs r7, 0x6
	ldr r6, _08013AF4 @ =gChosenActionByBattler
	ldr r2, _08013AF8 @ =gChosenMoveByBattler
	movs r4, 0xFF
	movs r3, 0
_08013A32:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	adds r0, 0x5C
	strb r7, [r0]
	adds r1, r5, r6
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	strh r3, [r2]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08013A32
	movs r0, 0
	bl TurnValuesCleanUp
	bl SpecialStatusesClear
	ldr r0, _08013AE8 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x91
	ldr r1, _08013AFC @ =gAbsentBattlerFlags
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r1, _08013B00 @ =gBattleMainFunc
	ldr r0, _08013B04 @ =sub_8014040
	str r0, [r1]
	bl ResetSentPokesToOpponentValue
	ldr r1, _08013B08 @ =gBattleCommunication
	movs r2, 0
	adds r0, r1, 0x7
_08013A74:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08013A74
	movs r5, 0
	ldr r3, _08013AEC @ =gBattlersCount
	ldr r2, _08013AE8 @ =gBattleStruct
	ldr r6, _08013B0C @ =gBattleScripting
	ldr r7, _08013B10 @ =gMoveResultFlags
	ldrb r0, [r3]
	cmp r5, r0
	bge _08013AA6
	ldr r0, _08013B14 @ =gBattleMons
	movs r4, 0x9
	negs r4, r4
	adds r1, r0, 0
	adds r1, 0x50
_08013A96:
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
	adds r1, 0x58
	adds r5, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	blt _08013A96
_08013AA6:
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x1]
	ldr r0, [r2]
	movs r3, 0xC0
	lsls r3, 1
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, 0x1
	adds r0, r3
	strb r1, [r0]
	movs r1, 0
	strb r1, [r6, 0x14]
	ldr r0, [r2]
	adds r0, 0x4D
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x3]
	strb r1, [r7]
	bl Random
	ldr r1, _08013B18 @ =gUnknown_2023E80
	strh r0, [r1]
_08013ADA:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013AE8: .4byte gBattleStruct
_08013AEC: .4byte gBattlersCount
_08013AF0: .4byte gBattlerByTurnOrder
_08013AF4: .4byte gChosenActionByBattler
_08013AF8: .4byte gChosenMoveByBattler
_08013AFC: .4byte gAbsentBattlerFlags
_08013B00: .4byte gBattleMainFunc
_08013B04: .4byte sub_8014040
_08013B08: .4byte gBattleCommunication
_08013B0C: .4byte gBattleScripting
_08013B10: .4byte gMoveResultFlags
_08013B14: .4byte gBattleMons
_08013B18: .4byte gUnknown_2023E80
	thumb_func_end sub_801385C

	thumb_func_start sub_8013B1C
sub_8013B1C: @ 8013B1C
	push {r4-r6,lr}
	ldr r0, _08013BB4 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08013BAC
	ldr r1, _08013BB8 @ =gBattleMainFunc
	ldr r0, _08013BBC @ =BattleTurnPassed
	str r0, [r1]
	ldr r3, _08013BC0 @ =gBattlersCount
	ldr r1, _08013BC4 @ =gBattleCommunication
	movs r2, 0
	adds r0, r1, 0x7
_08013B34:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08013B34
	movs r4, 0
	ldrb r3, [r3]
	cmp r4, r3
	bge _08013B86
	ldr r5, _08013BC8 @ =gBattleMons
	adds r6, r5, 0
	adds r6, 0x4C
_08013B4A:
	movs r0, 0x58
	adds r2, r4, 0
	muls r2, r0
	adds r1, r5, 0
	adds r1, 0x50
	adds r1, r2, r1
	ldr r3, [r1]
	subs r0, 0x61
	ands r3, r0
	str r3, [r1]
	adds r2, r6
	ldr r0, [r2]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08013B7C
	movs r0, 0x80
	lsls r0, 5
	ands r3, r0
	cmp r3, 0
	beq _08013B7C
	lsls r0, r4, 24
	lsrs r0, 24
	bl CancelMultiTurnMoves
_08013B7C:
	adds r4, 0x1
	ldr r0, _08013BC0 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	blt _08013B4A
_08013B86:
	ldr r2, _08013BCC @ =gBattleStruct
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x1]
	ldr r0, [r2]
	movs r3, 0xC0
	lsls r3, 1
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, 0x1
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x3]
	ldr r0, _08013BD0 @ =gMoveResultFlags
	strb r1, [r0]
_08013BAC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013BB4: .4byte gBattleControllerExecFlags
_08013BB8: .4byte gBattleMainFunc
_08013BBC: .4byte BattleTurnPassed
_08013BC0: .4byte gBattlersCount
_08013BC4: .4byte gBattleCommunication
_08013BC8: .4byte gBattleMons
_08013BCC: .4byte gBattleStruct
_08013BD0: .4byte gMoveResultFlags
	thumb_func_end sub_8013B1C

	thumb_func_start BattleTurnPassed
BattleTurnPassed: @ 8013BD4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0x1
	bl TurnValuesCleanUp
	ldr r0, _08013C78 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0
	bne _08013C04
	bl DoFieldEndTurnEffects
	lsls r0, 24
	cmp r0, 0
	beq _08013BF8
	b _08013D20
_08013BF8:
	bl DoBattlerEndTurnEffects
	lsls r0, 24
	cmp r0, 0
	beq _08013C04
	b _08013D20
_08013C04:
	bl HandleFaintedMonActions
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08013C12
	b _08013D20
_08013C12:
	ldr r0, _08013C7C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x4D
	strb r1, [r0]
	bl HandleWishPerishSongOnTurnEnd
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08013D20
	movs r0, 0
	bl TurnValuesCleanUp
	ldr r2, _08013C80 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08013C84 @ =0xfffffdff
	ands r0, r1
	ldr r1, _08013C88 @ =0xfff7ffff
	ands r0, r1
	ldr r1, _08013C8C @ =0xffbfffff
	ands r0, r1
	ldr r1, _08013C90 @ =0xffefffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _08013C94 @ =gBattleScripting
	strb r4, [r0, 0x18]
	strb r4, [r0, 0x19]
	strb r4, [r0, 0x14]
	ldr r0, _08013C98 @ =gBattleMoveDamage
	str r4, [r0]
	ldr r0, _08013C9C @ =gMoveResultFlags
	strb r4, [r0]
	ldr r1, _08013CA0 @ =gBattleCommunication
	movs r2, 0
	adds r0, r1, 0x4
_08013C58:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08013C58
	ldr r0, _08013C78 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0
	beq _08013CB0
	ldr r1, _08013CA4 @ =gCurrentActionFuncId
	movs r0, 0xC
	strb r0, [r1]
	ldr r1, _08013CA8 @ =gBattleMainFunc
	ldr r0, _08013CAC @ =RunTurnActionsFunctions
	str r0, [r1]
	b _08013D20
	.align 2, 0
_08013C78: .4byte gBattleOutcome
_08013C7C: .4byte gBattleStruct
_08013C80: .4byte gHitMarker
_08013C84: .4byte 0xfffffdff
_08013C88: .4byte 0xfff7ffff
_08013C8C: .4byte 0xffbfffff
_08013C90: .4byte 0xffefffff
_08013C94: .4byte gBattleScripting
_08013C98: .4byte gBattleMoveDamage
_08013C9C: .4byte gMoveResultFlags
_08013CA0: .4byte gBattleCommunication
_08013CA4: .4byte gCurrentActionFuncId
_08013CA8: .4byte gBattleMainFunc
_08013CAC: .4byte RunTurnActionsFunctions
_08013CB0:
	ldr r1, _08013D30 @ =gBattleResults
	ldrb r0, [r1, 0x13]
	cmp r0, 0xFE
	bhi _08013CBC
	adds r0, 0x1
	strb r0, [r1, 0x13]
_08013CBC:
	movs r2, 0
	ldr r4, _08013D34 @ =gBattlersCount
	ldr r0, _08013D38 @ =gBattleStruct
	mov r8, r0
	ldr r1, _08013D3C @ =gBattleMainFunc
	mov r10, r1
	ldr r0, _08013D40 @ =gAbsentBattlerFlags
	mov r12, r0
	ldr r1, _08013D44 @ =sub_8014040
	mov r9, r1
	ldrb r0, [r4]
	cmp r2, r0
	bge _08013CF2
	ldr r7, _08013D48 @ =gChosenActionByBattler
	movs r6, 0xFF
	movs r5, 0
	ldr r3, _08013D4C @ =gChosenMoveByBattler
_08013CDE:
	adds r1, r2, r7
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	strh r5, [r3]
	adds r3, 0x2
	adds r2, 0x1
	ldrb r1, [r4]
	cmp r2, r1
	blt _08013CDE
_08013CF2:
	movs r2, 0
	ldr r3, _08013D38 @ =gBattleStruct
	movs r1, 0x6
_08013CF8:
	ldr r0, [r3]
	adds r0, r2, r0
	adds r0, 0x5C
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _08013CF8
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0x91
	mov r2, r12
	ldrb r1, [r2]
	strb r1, [r0]
	mov r0, r9
	mov r1, r10
	str r0, [r1]
	bl Random
	ldr r1, _08013D50 @ =gUnknown_2023E80
	strh r0, [r1]
_08013D20:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013D30: .4byte gBattleResults
_08013D34: .4byte gBattlersCount
_08013D38: .4byte gBattleStruct
_08013D3C: .4byte gBattleMainFunc
_08013D40: .4byte gAbsentBattlerFlags
_08013D44: .4byte sub_8014040
_08013D48: .4byte gChosenActionByBattler
_08013D4C: .4byte gChosenMoveByBattler
_08013D50: .4byte gUnknown_2023E80
	thumb_func_end BattleTurnPassed

	thumb_func_start IsRunningFromBattleImpossible
IsRunningFromBattleImpossible: @ 8013D54
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _08013D78 @ =gBattleMons
	ldr r0, _08013D7C @ =gActiveBattler
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08013D84
	ldr r1, _08013D80 @ =gEnigmaBerries
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x7]
	b _08013D8E
	.align 2, 0
_08013D78: .4byte gBattleMons
_08013D7C: .4byte gActiveBattler
_08013D80: .4byte gEnigmaBerries
_08013D84:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r2, r0, 24
_08013D8E:
	ldr r1, _08013EA4 @ =gPotentialItemEffectBattler
	ldr r3, _08013EA8 @ =gActiveBattler
	ldrb r0, [r3]
	strb r0, [r1]
	cmp r2, 0x25
	bne _08013D9C
	b _08013F18
_08013D9C:
	ldr r0, _08013EAC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08013DAA
	b _08013F18
_08013DAA:
	ldr r1, _08013EB0 @ =gBattleMons
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x32
	bne _08013DBE
	b _08013F18
_08013DBE:
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r0, _08013EB4 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	bge _08013E52
	movs r7, 0
_08013DD4:
	lsrs r4, r7, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _08013DF8
	ldr r1, _08013EB0 @ =gBattleMons
	movs r0, 0x58
	muls r0, r5
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r0, [r2]
	cmp r0, 0x17
	bne _08013DF8
	b _08013F20
_08013DF8:
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _08013E42
	ldr r3, _08013EB0 @ =gBattleMons
	ldr r0, _08013EA8 @ =gActiveBattler
	ldrb r0, [r0]
	movs r2, 0x58
	muls r0, r2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	beq _08013E42
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08013E42
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08013E42
	adds r0, r5, 0
	muls r0, r2
	adds r0, r3
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r0, [r2]
	cmp r0, 0x47
	bne _08013E42
	b _08013F3C
_08013E42:
	movs r0, 0x80
	lsls r0, 17
	adds r7, r0
	adds r5, 0x1
	ldr r0, _08013EB4 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _08013DD4
_08013E52:
	ldr r4, _08013EA8 @ =gActiveBattler
	ldrb r1, [r4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	movs r2, 0x2A
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _08013EC4
	ldr r6, _08013EB0 @ =gBattleMons
	ldrb r0, [r4]
	movs r3, 0x58
	muls r0, r3
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x8
	beq _08013E8A
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08013EC4
_08013E8A:
	ldr r0, _08013EB8 @ =gBattleScripting
	subs r1, r5, 0x1
	strb r1, [r0, 0x17]
	ldr r2, _08013EBC @ =gLastUsedAbility
	adds r0, r1, 0
	muls r0, r3
	adds r0, r6
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r1, _08013EC0 @ =gBattleCommunication
	movs r0, 0x2
	b _08013F5C
	.align 2, 0
_08013EA4: .4byte gPotentialItemEffectBattler
_08013EA8: .4byte gActiveBattler
_08013EAC: .4byte gBattleTypeFlags
_08013EB0: .4byte gBattleMons
_08013EB4: .4byte gBattlersCount
_08013EB8: .4byte gBattleScripting
_08013EBC: .4byte gLastUsedAbility
_08013EC0: .4byte gBattleCommunication
_08013EC4:
	ldr r1, _08013EF8 @ =gBattleMons
	ldr r0, _08013EFC @ =gActiveBattler
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08013F00 @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	bne _08013EEE
	ldr r1, _08013F04 @ =gStatuses3
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	beq _08013F0C
_08013EEE:
	ldr r1, _08013F08 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r0, 0x1
	b _08013F5E
	.align 2, 0
_08013EF8: .4byte gBattleMons
_08013EFC: .4byte gActiveBattler
_08013F00: .4byte 0x0400e000
_08013F04: .4byte gStatuses3
_08013F08: .4byte gBattleCommunication
_08013F0C:
	ldr r0, _08013F1C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08013F58
_08013F18:
	movs r0, 0
	b _08013F5E
	.align 2, 0
_08013F1C: .4byte gBattleTypeFlags
_08013F20:
	ldr r0, _08013F30 @ =gBattleScripting
	strb r5, [r0, 0x17]
	ldr r1, _08013F34 @ =gLastUsedAbility
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, _08013F38 @ =gBattleCommunication
	movs r0, 0x2
	b _08013F5C
	.align 2, 0
_08013F30: .4byte gBattleScripting
_08013F34: .4byte gLastUsedAbility
_08013F38: .4byte gBattleCommunication
_08013F3C:
	ldr r0, _08013F4C @ =gBattleScripting
	strb r5, [r0, 0x17]
	ldr r1, _08013F50 @ =gLastUsedAbility
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, _08013F54 @ =gBattleCommunication
	movs r0, 0x2
	b _08013F5C
	.align 2, 0
_08013F4C: .4byte gBattleScripting
_08013F50: .4byte gLastUsedAbility
_08013F54: .4byte gBattleCommunication
_08013F58:
	ldr r1, _08013F68 @ =gBattleCommunication
	movs r0, 0x1
_08013F5C:
	strb r0, [r1, 0x5]
_08013F5E:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08013F68: .4byte gBattleCommunication
	thumb_func_end IsRunningFromBattleImpossible

	thumb_func_start sub_8013F6C
sub_8013F6C: @ 8013F6C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r0, _08014008 @ =gBattlerPartyIndexes
	mov r8, r0
	ldr r1, _0801400C @ =gUnknown_203B0DC
	mov r12, r1
	ldr r7, _08014010 @ =gBattleStruct
	lsls r0, r5, 1
	adds r4, r0, r5
	adds r6, r0, 0
_08013F88:
	mov r0, r12
	adds r2, r3, r0
	ldr r1, [r7]
	adds r0, r4, r3
	adds r0, r1
	adds r0, 0x60
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, 0x1
	cmp r3, 0x2
	ble _08013F88
	mov r1, r8
	adds r0, r6, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r7, _08014010 @ =gBattleStruct
	ldr r0, [r7]
	adds r0, r5, r0
	adds r0, 0x5C
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8127FF4
	ldr r0, _08014014 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08014018
	movs r3, 0
	adds r4, r7, 0
	adds r6, r5
	movs r0, 0x2
	adds r1, r5, 0
	eors r1, r0
	ldr r7, _0801400C @ =gUnknown_203B0DC
	lsls r0, r1, 1
	adds r5, r0, r1
_08013FE6:
	ldr r0, [r4]
	adds r1, r6, r3
	adds r1, r0
	adds r1, 0x60
	adds r2, r3, r7
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r5, r3
	adds r0, r1
	adds r0, 0x60
	ldrb r1, [r2]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x2
	ble _08013FE6
	b _08014032
	.align 2, 0
_08014008: .4byte gBattlerPartyIndexes
_0801400C: .4byte gUnknown_203B0DC
_08014010: .4byte gBattleStruct
_08014014: .4byte gBattleTypeFlags
_08014018:
	movs r3, 0
	adds r2, r6, r5
	ldr r4, _0801403C @ =gUnknown_203B0DC
_0801401E:
	ldr r0, [r7]
	adds r1, r2, r3
	adds r1, r0
	adds r1, 0x60
	adds r0, r3, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0x2
	ble _0801401E
_08014032:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801403C: .4byte gUnknown_203B0DC
	thumb_func_end sub_8013F6C

	thumb_func_start sub_8014040
sub_8014040: @ 8014040
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r0, _0801408C @ =gBattleCommunication
	movs r1, 0
	strb r1, [r0, 0x4]
	ldr r0, _08014090 @ =gActiveBattler
	strb r1, [r0]
	ldr r0, _08014094 @ =gBattlersCount
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r1, r0
	bcc _08014064
	bl _08014C68
_08014064:
	ldr r4, _08014090 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0801408C @ =gBattleCommunication
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _08014080
	bl _08014C4E
_08014080:
	lsls r0, 2
	ldr r1, _08014098 @ =_0801409C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801408C: .4byte gBattleCommunication
_08014090: .4byte gActiveBattler
_08014094: .4byte gBattlersCount
_08014098: .4byte _0801409C
	.align 2, 0
_0801409C:
	.4byte _080140B8
	.4byte _080141DC
	.4byte _08014764
	.4byte _08014AA0
	.4byte _08014B44
	.4byte _08014B88
	.4byte _08014C20
_080140B8:
	ldr r0, _08014150 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r4, _08014154 @ =gBattleStruct
	ldr r0, [r4]
	adds r1, r0
	adds r1, 0x5C
	movs r0, 0x6
	strb r0, [r1]
	ldr r0, _08014158 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08014114
	movs r1, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _08014114
	eors r5, r1
	adds r0, r5, 0
	bl GetBattlerAtPosition
	ldr r1, [r4]
	adds r1, 0x91
	ldrb r1, [r1]
	ldr r2, _0801415C @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08014114
	ldr r4, _08014160 @ =gBattleCommunication
	adds r0, r5, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x4
	beq _08014114
	bl _08014C4E
_08014114:
	ldr r0, _08014154 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x91
	ldrb r3, [r0]
	ldr r1, _0801415C @ =gBitTable
	ldr r4, _08014150 @ =gActiveBattler
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ands r3, r0
	cmp r3, 0
	beq _0801417C
	ldr r0, _08014164 @ =gChosenActionByBattler
	adds r0, r2, r0
	movs r1, 0xD
	strb r1, [r0]
	ldr r0, _08014158 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08014168
	ldr r0, _08014160 @ =gBattleCommunication
	ldrb r1, [r4]
	adds r1, r0
	movs r0, 0x4
	strb r0, [r1]
	bl _08014C4E
	.align 2, 0
_08014150: .4byte gActiveBattler
_08014154: .4byte gBattleStruct
_08014158: .4byte gBattleTypeFlags
_0801415C: .4byte gBitTable
_08014160: .4byte gBattleCommunication
_08014164: .4byte gChosenActionByBattler
_08014168:
	ldr r0, _08014178 @ =gBattleCommunication
	ldrb r1, [r4]
	adds r1, r0
	movs r0, 0x3
	strb r0, [r1]
	bl _08014C4E
	.align 2, 0
_08014178: .4byte gBattleCommunication
_0801417C:
	ldr r1, _080141B0 @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	bne _0801419C
	movs r0, 0x80
	lsls r0, 15
	ands r1, r0
	cmp r1, 0
	beq _080141BC
_0801419C:
	ldr r0, _080141B4 @ =gChosenActionByBattler
	adds r0, r2, r0
	strb r3, [r0]
	ldr r1, _080141B8 @ =gBattleCommunication
	ldrb r0, [r4]
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bl _08014C4E
	.align 2, 0
_080141B0: .4byte gBattleMons
_080141B4: .4byte gChosenActionByBattler
_080141B8: .4byte gBattleCommunication
_080141BC:
	ldr r0, _080141D4 @ =gChosenActionByBattler
	ldrb r1, [r0]
	ldr r0, _080141D8 @ =gBattleBufferB
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	movs r0, 0
	bl BtlController_EmitChooseAction
	bl _08014B26
	.align 2, 0
_080141D4: .4byte gChosenActionByBattler
_080141D8: .4byte gBattleBufferB
_080141DC:
	ldr r4, _08014234 @ =gBattleControllerExecFlags
	ldr r1, _08014238 @ =gBitTable
	ldr r3, _0801423C @ =gActiveBattler
	ldrb r5, [r3]
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r1, [r4]
	ands r1, r0
	mov r8, r3
	cmp r1, 0
	beq _0801420A
	bl _08014C4E
_0801420A:
	ldr r2, _08014240 @ =gChosenActionByBattler
	adds r2, r5, r2
	ldr r1, _08014244 @ =gBattleBufferB
	lsls r0, r5, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r3]
	lsls r0, 9
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _08014228
	b _080146AC
_08014228:
	lsls r0, 2
	ldr r1, _08014248 @ =_0801424C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08014234: .4byte gBattleControllerExecFlags
_08014238: .4byte gBitTable
_0801423C: .4byte gActiveBattler
_08014240: .4byte gChosenActionByBattler
_08014244: .4byte gBattleBufferB
_08014248: .4byte _0801424C
	.align 2, 0
_0801424C:
	.4byte _08014280
	.4byte _080143D4
	.4byte _08014450
	.4byte _080146AC
	.4byte _080146AC
	.4byte _08014620
	.4byte _080146AC
	.4byte _080146AC
	.4byte _080146AC
	.4byte _080146AC
	.4byte _080146AC
	.4byte _080146AC
	.4byte _08014670
_08014280:
	bl AreAllMovesUnusable
	lsls r0, 24
	cmp r0, 0
	beq _080142D8
	ldr r0, _080142C8 @ =gBattleCommunication
	ldr r3, _080142CC @ =gActiveBattler
	ldrb r1, [r3]
	adds r1, r0
	movs r4, 0
	movs r0, 0x5
	strb r0, [r1]
	ldrb r1, [r3]
	ldr r2, _080142D0 @ =gBattleStruct
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0x54
	strb r4, [r1]
	ldrb r1, [r3]
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0x84
	movs r0, 0x3
	strb r0, [r1]
	ldrb r1, [r3]
	ldr r2, [r2]
	adds r2, r1, r2
	ldr r0, _080142D4 @ =gBattleBufferB
	lsls r1, 9
	adds r0, 0x3
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2, 0xC]
	bl _08014C78
	.align 2, 0
_080142C8: .4byte gBattleCommunication
_080142CC: .4byte gActiveBattler
_080142D0: .4byte gBattleStruct
_080142D4: .4byte gBattleBufferB
_080142D8:
	ldr r3, _08014318 @ =gDisableStructs
	ldr r5, _0801431C @ =gActiveBattler
	ldrb r4, [r5]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r3
	ldrh r2, [r0, 0x6]
	cmp r2, 0
	beq _0801432C
	ldr r1, _08014320 @ =gChosenMoveByBattler
	lsls r0, r4, 1
	adds r0, r1
	strh r2, [r0]
	ldrb r2, [r5]
	ldr r0, _08014324 @ =gBattleStruct
	ldr r1, [r0]
	adds r1, r2, r1
	adds r1, 0x80
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0xC]
	strb r0, [r1]
	ldr r1, _08014328 @ =gBattleCommunication
	ldrb r0, [r5]
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bl _08014C78
	.align 2, 0
_08014318: .4byte gDisableStructs
_0801431C: .4byte gActiveBattler
_08014320: .4byte gChosenMoveByBattler
_08014324: .4byte gBattleStruct
_08014328: .4byte gBattleCommunication
_0801432C:
	add r2, sp, 0x4
	ldr r3, _080143CC @ =gBattleMons
	movs r1, 0x58
	adds r0, r4, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldrb r0, [r5]
	muls r0, r1
	adds r0, r3
	adds r0, 0x21
	ldrb r0, [r0]
	strb r0, [r2, 0x12]
	ldrb r0, [r5]
	muls r0, r1
	adds r0, r3
	adds r0, 0x22
	ldrb r0, [r0]
	strb r0, [r2, 0x13]
	movs r4, 0
	mov r1, sp
	adds r1, 0xC
	str r1, [sp, 0x18]
	add r2, sp, 0x10
	mov r10, r2
	mov r8, r3
	adds r7, r5, 0
	movs r6, 0x58
	movs r3, 0xC
	add r3, r8
	mov r9, r3
	add r5, sp, 0x4
_0801436E:
	lsls r2, r4, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r2, r0
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r5]
	ldr r0, [sp, 0x18]
	adds r3, r0, r4
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	adds r2, r1
	add r2, r9
	ldrh r0, [r2]
	add r1, r8
	adds r1, 0x3B
	ldrb r1, [r1]
	lsls r2, r4, 24
	lsrs r2, 24
	bl CalculatePPWithBonus
	mov r2, r10
	adds r1, r2, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0801436E
	ldr r0, _080143D0 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x1
	ands r1, r0
	movs r0, 0
	movs r2, 0
	add r3, sp, 0x4
	bl BtlController_EmitChooseMove
	b _0801460E
	.align 2, 0
_080143CC: .4byte gBattleMons
_080143D0: .4byte gBattleTypeFlags
_080143D4:
	ldr r0, _08014410 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _08014414 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	beq _08014428
	ldr r1, _08014418 @ =gSelectionBattleScripts
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0801441C @ =gUnknown_81D96A4
	str r1, [r0]
	ldr r0, _08014420 @ =gBattleCommunication
	ldrb r1, [r3]
	adds r1, r0
	movs r3, 0
	movs r0, 0x5
	strb r0, [r1]
	mov r0, r8
	ldrb r1, [r0]
	ldr r2, _08014424 @ =gBattleStruct
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0x54
	strb r3, [r1]
	mov r1, r8
	ldrb r0, [r1]
	b _0801472C
	.align 2, 0
_08014410: .4byte gBattleTypeFlags
_08014414: .4byte 0x00000902
_08014418: .4byte gSelectionBattleScripts
_0801441C: .4byte gUnknown_81D96A4
_08014420: .4byte gBattleCommunication
_08014424: .4byte gBattleStruct
_08014428:
	ldr r2, _08014448 @ =gBattleStruct
	ldr r4, _0801444C @ =gActiveBattler
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x60
	ldr r1, [r2]
	adds r1, r0
	movs r0, 0
	bl BtlController_EmitChooseItem
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	b _080146AC
	.align 2, 0
_08014448: .4byte gBattleStruct
_0801444C: .4byte gActiveBattler
_08014450:
	ldr r5, _080144A8 @ =gActiveBattler
	ldrb r0, [r5]
	ldr r3, _080144AC @ =gBattleStruct
	ldr r1, [r3]
	adds r1, r0, r1
	adds r1, 0x58
	ldr r2, _080144B0 @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r7, _080144B4 @ =gBattleMons
	ldrb r2, [r5]
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080144B8 @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	bne _08014492
	ldr r0, _080144BC @ =gStatuses3
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x80
	lsls r0, 3
	ands r1, r0
	cmp r1, 0
	beq _080144C0
_08014492:
	lsls r1, r2, 1
	adds r1, r2
	adds r1, 0x60
	ldr r0, [r3]
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x6
	b _080145DE
	.align 2, 0
_080144A8: .4byte gActiveBattler
_080144AC: .4byte gBattleStruct
_080144B0: .4byte gBattlerPartyIndexes
_080144B4: .4byte gBattleMons
_080144B8: .4byte 0x0400e000
_080144BC: .4byte gStatuses3
_080144C0:
	str r1, [sp]
	movs r0, 0xC
	adds r1, r2, 0
	movs r2, 0x17
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08014548
	ldrb r1, [r5]
	str r4, [sp]
	movs r0, 0xC
	movs r2, 0x47
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08014510
	ldrb r0, [r5]
	muls r0, r6
	adds r1, r0, r7
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08014510
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08014510
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	bne _08014548
_08014510:
	ldr r5, _08014574 @ =gActiveBattler
	ldrb r1, [r5]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	movs r2, 0x2A
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08014584
	ldr r2, _08014578 @ =gBattleMons
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x8
	beq _08014548
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08014584
_08014548:
	subs r1, r4, 0x1
	lsls r1, 4
	movs r0, 0x4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0801457C @ =gLastUsedAbility
	ldrb r3, [r0]
	ldr r4, _08014580 @ =gBattleStruct
	ldr r0, _08014574 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r2, r0, 1
	adds r2, r0
	adds r2, 0x60
	ldr r0, [r4]
	adds r0, r2
	str r0, [sp]
	movs r0, 0
	movs r2, 0x6
	bl BtlController_EmitChoosePokemon
	b _0801460E
	.align 2, 0
_08014574: .4byte gActiveBattler
_08014578: .4byte gBattleMons
_0801457C: .4byte gLastUsedAbility
_08014580: .4byte gBattleStruct
_08014584:
	ldr r0, _080145A8 @ =gActiveBattler
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, 0x2
	bne _080145B4
	ldr r0, _080145AC @ =gChosenActionByBattler
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080145B4
	ldr r0, _080145B0 @ =gBattleStruct
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x5C
	ldrb r2, [r0]
	mov r0, r8
	ldrb r1, [r0]
	b _080145D0
	.align 2, 0
_080145A8: .4byte gActiveBattler
_080145AC: .4byte gChosenActionByBattler
_080145B0: .4byte gBattleStruct
_080145B4:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _080145F0
	ldr r0, _080145E8 @ =gChosenActionByBattler
	ldrb r0, [r0, 0x1]
	cmp r0, 0x2
	bne _080145F0
	ldr r0, _080145EC @ =gBattleStruct
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x5D
	ldrb r2, [r0]
	ldrb r1, [r1]
_080145D0:
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x60
	adds r3, r0
	str r3, [sp]
	movs r0, 0
	movs r1, 0
_080145DE:
	movs r3, 0
	bl BtlController_EmitChoosePokemon
	b _0801460E
	.align 2, 0
_080145E8: .4byte gChosenActionByBattler
_080145EC: .4byte gBattleStruct
_080145F0:
	ldr r2, _08014618 @ =gBattleStruct
	ldr r0, _0801461C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0x60
	ldr r0, [r2]
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x6
	movs r3, 0
	bl BtlController_EmitChoosePokemon
_0801460E:
	ldr r0, _0801461C @ =gActiveBattler
	ldrb r0, [r0]
	bl MarkBattlerForControllerExec
	b _080146AC
	.align 2, 0
_08014618: .4byte gBattleStruct
_0801461C: .4byte gActiveBattler
_08014620:
	bl IsPlayerPartyAndPokemonStorageFull
	lsls r0, 24
	cmp r0, 0
	beq _080146AC
	ldr r1, _0801465C @ =gSelectionBattleScripts
	ldr r3, _08014660 @ =gActiveBattler
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08014664 @ =gUnknown_81D8949
	str r1, [r0]
	ldr r0, _08014668 @ =gBattleCommunication
	ldrb r1, [r3]
	adds r1, r0
	movs r4, 0
	movs r0, 0x5
	strb r0, [r1]
	ldrb r1, [r3]
	ldr r2, _0801466C @ =gBattleStruct
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0x54
	strb r4, [r1]
	ldrb r0, [r3]
	ldr r1, [r2]
	adds r0, r1
	adds r0, 0x84
	strb r4, [r0]
	b _08014C78
	.align 2, 0
_0801465C: .4byte gSelectionBattleScripts
_08014660: .4byte gActiveBattler
_08014664: .4byte gUnknown_81D8949
_08014668: .4byte gBattleCommunication
_0801466C: .4byte gBattleStruct
_08014670:
	ldr r4, _080146A8 @ =gBattleCommunication
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r4
	movs r5, 0
	movs r0, 0x6
	strb r0, [r1]
	ldrb r0, [r2]
	bl GetBattlerPosition
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	strb r5, [r0]
	movs r0, 0
	bl BtlController_EmitEndBounceEffect
	mov r3, r8
	ldrb r0, [r3]
	bl MarkBattlerForControllerExec
	b _08014C78
	.align 2, 0
_080146A8: .4byte gBattleCommunication
_080146AC:
	ldr r0, _080146D8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0xA
	ands r0, r1
	cmp r0, 0x8
	bne _080146EC
	ldr r0, _080146DC @ =gBattleBufferB
	ldr r4, _080146E0 @ =gActiveBattler
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _080146EC
	ldr r0, _080146E4 @ =gUnknown_81D8924
	bl BattleScriptExecute
	ldr r1, _080146E8 @ =gBattleCommunication
	ldrb r0, [r4]
	adds r0, r1
	b _08014926
	.align 2, 0
_080146D8: .4byte gBattleTypeFlags
_080146DC: .4byte gBattleBufferB
_080146E0: .4byte gActiveBattler
_080146E4: .4byte gUnknown_81D8924
_080146E8: .4byte gBattleCommunication
_080146EC:
	bl IsRunningFromBattleImpossible
	lsls r0, 24
	cmp r0, 0
	beq _08014750
	ldr r0, _08014738 @ =gBattleBufferB
	ldr r4, _0801473C @ =gActiveBattler
	ldrb r2, [r4]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _08014750
	ldr r1, _08014740 @ =gSelectionBattleScripts
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, _08014744 @ =gUnknown_81D8943
	str r1, [r0]
	ldr r0, _08014748 @ =gBattleCommunication
	ldrb r1, [r4]
	adds r1, r0
	movs r3, 0
	movs r0, 0x5
	strb r0, [r1]
	ldrb r1, [r4]
	ldr r2, _0801474C @ =gBattleStruct
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0x54
	strb r3, [r1]
	ldrb r0, [r4]
_0801472C:
	ldr r1, [r2]
	adds r0, r1
	adds r0, 0x84
	strb r3, [r0]
	b _08014C78
	.align 2, 0
_08014738: .4byte gBattleBufferB
_0801473C: .4byte gActiveBattler
_08014740: .4byte gSelectionBattleScripts
_08014744: .4byte gUnknown_81D8943
_08014748: .4byte gBattleCommunication
_0801474C: .4byte gBattleStruct
_08014750:
	ldr r2, _0801475C @ =gBattleCommunication
	ldr r0, _08014760 @ =gActiveBattler
	ldrb r1, [r0]
	adds r1, r2
	b _08014B32
	.align 2, 0
_0801475C: .4byte gBattleCommunication
_08014760: .4byte gActiveBattler
_08014764:
	ldr r4, _080147A8 @ =gBattleControllerExecFlags
	ldr r1, _080147AC @ =gBitTable
	ldr r3, _080147B0 @ =gActiveBattler
	ldrb r5, [r3]
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r1, [r4]
	ands r1, r0
	mov r8, r3
	cmp r1, 0
	beq _08014790
	b _08014C4E
_08014790:
	ldr r1, _080147B4 @ =gChosenActionByBattler
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x9
	bls _0801479E
	b _08014C4E
_0801479E:
	lsls r0, 2
	ldr r1, _080147B8 @ =_080147BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080147A8: .4byte gBattleControllerExecFlags
_080147AC: .4byte gBitTable
_080147B0: .4byte gActiveBattler
_080147B4: .4byte gChosenActionByBattler
_080147B8: .4byte _080147BC
	.align 2, 0
_080147BC:
	.4byte _080147E4
	.4byte _080148D8
	.4byte _08014910
	.4byte _08014A08
	.4byte _08014A2C
	.4byte _08014A40
	.4byte _08014A54
	.4byte _08014A54
	.4byte _08014A68
	.4byte _08014A8C
_080147E4:
	ldr r0, _08014804 @ =gBattleBufferB
	mov r1, r8
	ldrb r4, [r1]
	lsls r1, r4, 9
	adds r2, r0, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r7, r0, 0
	cmp r1, 0x9
	bgt _08014808
	cmp r1, 0x3
	blt _08014808
	adds r0, r4, r3
	strb r1, [r0]
	b _08014C78
	.align 2, 0
_08014804: .4byte gBattleBufferB
_08014808:
	adds r3, r7, 0
	mov r5, r8
	ldrb r4, [r5]
	lsls r1, r4, 9
	adds r6, r3, 0x2
	adds r0, r1, r6
	ldrb r2, [r0]
	adds r3, 0x3
	mov r9, r3
	add r1, r9
	ldrb r0, [r1]
	lsls r0, 8
	orrs r2, r0
	ldr r0, _08014830 @ =0x0000ffff
	cmp r2, r0
	bne _08014838
	ldr r0, _08014834 @ =gBattleCommunication
	adds r0, r4, r0
	b _08014926
	.align 2, 0
_08014830: .4byte 0x0000ffff
_08014834: .4byte gBattleCommunication
_08014838:
	bl TrySetCantSelectMoveBattleScript
	lsls r0, 24
	cmp r0, 0
	beq _0801487C
	ldr r0, _08014874 @ =gBattleCommunication
	ldrb r1, [r5]
	adds r1, r0
	movs r3, 0
	movs r0, 0x5
	strb r0, [r1]
	ldrb r1, [r5]
	ldr r2, _08014878 @ =gBattleStruct
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0x54
	strb r3, [r1]
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, r7, 0x1
	adds r0, r1
	strb r3, [r0]
	ldrb r1, [r5]
	ldr r0, [r2]
	adds r1, r0
	adds r1, 0x84
	movs r0, 0x1
	strb r0, [r1]
	b _08014C78
	.align 2, 0
_08014874: .4byte gBattleCommunication
_08014878: .4byte gBattleStruct
_0801487C:
	mov r2, r8
	ldrb r0, [r2]
	ldr r4, _080148C8 @ =gBattleStruct
	ldr r1, [r4]
	adds r1, r0, r1
	adds r1, 0x80
	lsls r0, 9
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080148CC @ =gChosenMoveByBattler
	ldrb r2, [r2]
	lsls r5, r2, 1
	adds r5, r0
	ldr r3, _080148D0 @ =gBattleMons
	ldr r4, [r4]
	adds r0, r2, r4
	adds r0, 0x80
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	adds r3, 0xC
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r5]
	mov r3, r8
	ldrb r0, [r3]
	adds r4, r0, r4
	lsls r0, 9
	add r0, r9
	ldrb r0, [r0]
	strb r0, [r4, 0xC]
	ldr r0, _080148D4 @ =gBattleCommunication
	ldrb r1, [r3]
	b _08014B30
	.align 2, 0
_080148C8: .4byte gBattleStruct
_080148CC: .4byte gChosenMoveByBattler
_080148D0: .4byte gBattleMons
_080148D4: .4byte gBattleCommunication
_080148D8:
	ldr r2, _08014900 @ =gBattleBufferB
	ldr r5, _08014904 @ =gActiveBattler
	ldrb r4, [r5]
	lsls r1, r4, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	cmp r3, 0
	bne _080148F6
	b _08014C48
_080148F6:
	ldr r0, _08014908 @ =gLastUsedItem
	strh r3, [r0]
	ldr r0, _0801490C @ =gBattleCommunication
	ldrb r1, [r5]
	b _08014B30
	.align 2, 0
_08014900: .4byte gBattleBufferB
_08014904: .4byte gActiveBattler
_08014908: .4byte gLastUsedItem
_0801490C: .4byte gBattleCommunication
_08014910:
	ldr r6, _0801492C @ =gBattleBufferB
	ldr r7, _08014930 @ =gActiveBattler
	ldrb r2, [r7]
	lsls r0, r2, 9
	adds r1, r6, 0x1
	adds r0, r1
	ldrb r1, [r0]
	cmp r1, 0x6
	bne _08014938
	ldr r0, _08014934 @ =gBattleCommunication
	adds r0, r2, r0
_08014926:
	movs r1, 0
	strb r1, [r0]
	b _08014C4E
	.align 2, 0
_0801492C: .4byte gBattleBufferB
_08014930: .4byte gActiveBattler
_08014934: .4byte gBattleCommunication
_08014938:
	ldr r0, _080149FC @ =gBattleStruct
	mov r12, r0
	ldr r0, [r0]
	adds r0, r2, r0
	adds r0, 0x5C
	strb r1, [r0]
	ldr r0, _08014A00 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080149F6
	ldrb r0, [r7]
	mov r1, r12
	ldr r2, [r1]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r2
	adds r1, 0x60
	ldrb r2, [r1]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	mov r2, r12
	ldr r1, [r2]
	lsls r2, r0, 1
	adds r2, r0
	adds r2, r1
	adds r2, 0x60
	lsls r0, 9
	adds r5, r6, 0x2
	adds r0, r5
	ldrb r1, [r0]
	movs r3, 0xF0
	adds r0, r3, 0
	ands r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r7]
	mov r0, r12
	ldr r2, [r0]
	lsls r0, r1, 1
	adds r0, r1
	adds r0, r2
	adds r0, 0x61
	lsls r1, 9
	adds r6, 0x3
	adds r1, r6
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r0, [r7]
	movs r4, 0x2
	eors r0, r4
	mov r1, r12
	ldr r2, [r1]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r2
	adds r1, 0x60
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	eors r0, r4
	mov r1, r12
	ldr r2, [r1]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r2
	adds r1, 0x60
	ldrb r0, [r7]
	lsls r0, 9
	adds r0, r5
	ldrb r0, [r0]
	ands r3, r0
	lsrs r3, 4
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
	ldrb r0, [r7]
	eors r4, r0
	mov r2, r12
	ldr r0, [r2]
	lsls r1, r4, 1
	adds r1, r4
	adds r1, r0
	adds r1, 0x62
	ldrb r0, [r7]
	lsls r0, 9
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
_080149F6:
	ldr r0, _08014A04 @ =gBattleCommunication
	ldrb r1, [r7]
	b _08014B30
	.align 2, 0
_080149FC: .4byte gBattleStruct
_08014A00: .4byte gBattleTypeFlags
_08014A04: .4byte gBattleCommunication
_08014A08:
	ldr r2, _08014A20 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08014A24 @ =gBattleCommunication
	ldr r0, _08014A28 @ =gActiveBattler
	ldrb r1, [r0]
	adds r1, r2
	b _08014B32
	.align 2, 0
_08014A20: .4byte gHitMarker
_08014A24: .4byte gBattleCommunication
_08014A28: .4byte gActiveBattler
_08014A2C:
	ldr r2, _08014A38 @ =gBattleCommunication
	ldr r0, _08014A3C @ =gActiveBattler
	ldrb r1, [r0]
	adds r1, r2
	b _08014B32
	.align 2, 0
_08014A38: .4byte gBattleCommunication
_08014A3C: .4byte gActiveBattler
_08014A40:
	ldr r2, _08014A4C @ =gBattleCommunication
	ldr r0, _08014A50 @ =gActiveBattler
	ldrb r1, [r0]
	adds r1, r2
	b _08014B32
	.align 2, 0
_08014A4C: .4byte gBattleCommunication
_08014A50: .4byte gActiveBattler
_08014A54:
	ldr r2, _08014A60 @ =gBattleCommunication
	ldr r0, _08014A64 @ =gActiveBattler
	ldrb r1, [r0]
	adds r1, r2
	b _08014B32
	.align 2, 0
_08014A60: .4byte gBattleCommunication
_08014A64: .4byte gActiveBattler
_08014A68:
	ldr r2, _08014A80 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08014A84 @ =gBattleCommunication
	ldr r0, _08014A88 @ =gActiveBattler
	ldrb r1, [r0]
	adds r1, r2
	b _08014B32
	.align 2, 0
_08014A80: .4byte gHitMarker
_08014A84: .4byte gBattleCommunication
_08014A88: .4byte gActiveBattler
_08014A8C:
	ldr r2, _08014A98 @ =gBattleCommunication
	ldr r0, _08014A9C @ =gActiveBattler
	ldrb r1, [r0]
	adds r1, r2
	b _08014B32
	.align 2, 0
_08014A98: .4byte gBattleCommunication
_08014A9C: .4byte gActiveBattler
_08014AA0:
	ldr r3, _08014B08 @ =gBattleControllerExecFlags
	ldr r4, _08014B0C @ =gBitTable
	ldr r0, _08014B10 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	beq _08014ACA
	b _08014C4E
_08014ACA:
	ldr r0, _08014B14 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x41
	ands r0, r1
	cmp r0, 0x1
	bne _08014AFE
	movs r1, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	bne _08014AFE
	adds r0, r5, 0
	eors r0, r1
	bl GetBattlerAtPosition
	ldr r1, _08014B18 @ =gBattleStruct
	ldr r1, [r1]
	adds r1, 0x91
	ldrb r1, [r1]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08014B1C
_08014AFE:
	movs r0, 0
	movs r1, 0
	bl BtlController_EmitLinkStandbyMsg
	b _08014B24
	.align 2, 0
_08014B08: .4byte gBattleControllerExecFlags
_08014B0C: .4byte gBitTable
_08014B10: .4byte gActiveBattler
_08014B14: .4byte gBattleTypeFlags
_08014B18: .4byte gBattleStruct
_08014B1C:
	movs r0, 0
	movs r1, 0x1
	bl BtlController_EmitLinkStandbyMsg
_08014B24:
	ldr r4, _08014B3C @ =gActiveBattler
_08014B26:
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	ldr r0, _08014B40 @ =gBattleCommunication
	ldrb r1, [r4]
_08014B30:
	adds r1, r0
_08014B32:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08014C4E
	.align 2, 0
_08014B3C: .4byte gActiveBattler
_08014B40: .4byte gBattleCommunication
_08014B44:
	ldr r3, _08014B78 @ =gBattleControllerExecFlags
	ldr r1, _08014B7C @ =gBitTable
	ldr r0, _08014B80 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	bne _08014C4E
	ldr r1, _08014B84 @ =gBattleCommunication
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _08014C4E
	.align 2, 0
_08014B78: .4byte gBattleControllerExecFlags
_08014B7C: .4byte gBitTable
_08014B80: .4byte gActiveBattler
_08014B84: .4byte gBattleCommunication
_08014B88:
	ldr r5, _08014BA8 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r0, _08014BAC @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, 0
	adds r0, 0x54
	ldrb r0, [r0]
	cmp r0, 0
	beq _08014BB4
	ldr r0, _08014BB0 @ =gBattleCommunication
	adds r0, r2, r0
	adds r1, 0x84
	ldrb r1, [r1]
	strb r1, [r0]
	b _08014C4E
	.align 2, 0
_08014BA8: .4byte gActiveBattler
_08014BAC: .4byte gBattleStruct
_08014BB0: .4byte gBattleCommunication
_08014BB4:
	ldr r0, _08014C08 @ =gBattlerAttacker
	strb r2, [r0]
	ldr r7, _08014C0C @ =gBattlescriptCurrInstr
	ldr r6, _08014C10 @ =gSelectionBattleScripts
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r4, [r0]
	str r4, [r7]
	ldr r3, _08014C14 @ =gBattleControllerExecFlags
	ldr r1, _08014C18 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	bne _08014BFA
	ldr r0, _08014C1C @ =gBattleScriptingCommandsTable
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_08014BFA:
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r7]
	str r1, [r0]
	b _08014C4E
	.align 2, 0
_08014C08: .4byte gBattlerAttacker
_08014C0C: .4byte gBattlescriptCurrInstr
_08014C10: .4byte gSelectionBattleScripts
_08014C14: .4byte gBattleControllerExecFlags
_08014C18: .4byte gBitTable
_08014C1C: .4byte gBattleScriptingCommandsTable
_08014C20:
	ldr r3, _08014C88 @ =gBattleControllerExecFlags
	ldr r1, _08014C8C @ =gBitTable
	ldr r0, _08014C90 @ =gActiveBattler
	ldrb r4, [r0]
	lsls r0, r4, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r3, [r3]
	ands r3, r0
	cmp r3, 0
	bne _08014C4E
_08014C48:
	ldr r0, _08014C94 @ =gBattleCommunication
	adds r0, r4, r0
	strb r3, [r0]
_08014C4E:
	ldr r0, _08014C90 @ =gActiveBattler
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _08014C98 @ =gBattlersCount
	lsls r1, 24
	lsrs r1, 24
	adds r2, r0, 0
	ldrb r3, [r2]
	cmp r1, r3
	bcs _08014C68
	bl _08014064
_08014C68:
	ldr r0, _08014C94 @ =gBattleCommunication
	ldrb r0, [r0, 0x4]
	ldrb r2, [r2]
	cmp r0, r2
	bne _08014C78
	ldr r1, _08014C9C @ =gBattleMainFunc
	ldr r0, _08014CA0 @ =sub_80150A8
	str r0, [r1]
_08014C78:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014C88: .4byte gBattleControllerExecFlags
_08014C8C: .4byte gBitTable
_08014C90: .4byte gActiveBattler
_08014C94: .4byte gBattleCommunication
_08014C98: .4byte gBattlersCount
_08014C9C: .4byte gBattleMainFunc
_08014CA0: .4byte sub_80150A8
	thumb_func_end sub_8014040

	thumb_func_start SwapTurnOrder
SwapTurnOrder: @ 8014CA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08014CD0 @ =gActionsByTurnOrder
	adds r4, r0, r2
	ldrb r5, [r4]
	adds r2, r1, r2
	ldrb r3, [r2]
	strb r3, [r4]
	strb r5, [r2]
	ldr r2, _08014CD4 @ =gBattlerByTurnOrder
	adds r0, r2
	ldrb r5, [r0]
	adds r1, r2
	ldrb r2, [r1]
	strb r2, [r0]
	strb r5, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014CD0: .4byte gActionsByTurnOrder
_08014CD4: .4byte gBattlerByTurnOrder
	thumb_func_end SwapTurnOrder

	thumb_func_start GetWhoStrikesFirst
GetWhoStrikesFirst: @ 8014CD8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _08014DA0
	ldr r1, [sp, 0x8]
	str r1, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _08014DA0
	ldr r1, _08014D58 @ =gBattleMons
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r3, [r0]
	cmp r3, 0x21
	bne _08014D44
	ldr r0, _08014D5C @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08014D54
_08014D44:
	cmp r3, 0x22
	bne _08014D60
	ldr r0, _08014D5C @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _08014D60
_08014D54:
	movs r3, 0x2
	b _08014D62
	.align 2, 0
_08014D58: .4byte gBattleMons
_08014D5C: .4byte gBattleWeather
_08014D60:
	movs r3, 0x1
_08014D62:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _08014D98 @ =gBattleMons
	adds r0, r2
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0x21
	bne _08014D82
	ldr r0, _08014D9C @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08014D92
_08014D82:
	cmp r2, 0x22
	bne _08014DA2
	ldr r0, _08014D9C @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _08014DA2
_08014D92:
	movs r7, 0x2
	b _08014DA4
	.align 2, 0
_08014D98: .4byte gBattleMons
_08014D9C: .4byte gBattleWeather
_08014DA0:
	movs r3, 0x1
_08014DA2:
	movs r7, 0x1
_08014DA4:
	ldr r1, _08014DE8 @ =gBattleMons
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r4, r0, r1
	ldrh r0, [r4, 0x6]
	muls r3, r0
	ldr r2, _08014DEC @ =gStatStageRatios
	movs r1, 0x1B
	ldrsb r1, [r4, r1]
	lsls r1, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl __divsi3
	mov r8, r0
	ldrh r0, [r4, 0x2E]
	cmp r0, 0xAF
	bne _08014DF4
	ldr r1, _08014DF0 @ =gEnigmaBerries
	mov r3, r9
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	ldrb r5, [r0, 0x1A]
	b _08014E08
	.align 2, 0
_08014DE8: .4byte gBattleMons
_08014DEC: .4byte gStatStageRatios
_08014DF0: .4byte gEnigmaBerries
_08014DF4:
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r5, r0, 24
_08014E08:
	ldr r0, _08014EC4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08014E3C
	ldr r0, _08014EC8 @ =0x00000822
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08014E3C
	mov r0, r9
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08014E3C
	movs r0, 0x6E
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x64
	bl __udivsi3
	mov r8, r0
_08014E3C:
	cmp r6, 0x18
	bne _08014E46
	mov r2, r8
	lsrs r2, 1
	mov r8, r2
_08014E46:
	ldr r1, _08014ECC @ =gBattleMons
	movs r0, 0x58
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08014E64
	mov r0, r8
	lsrs r0, 2
	mov r8, r0
_08014E64:
	cmp r6, 0x1A
	bne _08014E80
	ldr r0, _08014ED0 @ =gUnknown_2023E80
	ldrh r4, [r0]
	lsls r0, r5, 16
	subs r0, r5
	movs r1, 0x64
	bl __divsi3
	cmp r4, r0
	bge _08014E80
	movs r1, 0x1
	negs r1, r1
	mov r8, r1
_08014E80:
	ldr r1, _08014ECC @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r4, r0, r1
	ldrh r0, [r4, 0x6]
	adds r3, r0, 0
	muls r3, r7
	ldr r2, _08014ED4 @ =gStatStageRatios
	movs r1, 0x1B
	ldrsb r1, [r4, r1]
	lsls r1, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl __divsi3
	adds r7, r0, 0
	ldrh r0, [r4, 0x2E]
	cmp r0, 0xAF
	bne _08014EDC
	ldr r1, _08014ED8 @ =gEnigmaBerries
	mov r3, r10
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	ldrb r5, [r0, 0x1A]
	b _08014EF0
	.align 2, 0
_08014EC4: .4byte gBattleTypeFlags
_08014EC8: .4byte 0x00000822
_08014ECC: .4byte gBattleMons
_08014ED0: .4byte gUnknown_2023E80
_08014ED4: .4byte gStatStageRatios
_08014ED8: .4byte gEnigmaBerries
_08014EDC:
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r5, r0, 24
_08014EF0:
	ldr r0, _08014F68 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08014F20
	ldr r0, _08014F6C @ =0x00000822
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08014F20
	mov r0, r10
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08014F20
	movs r0, 0x6E
	muls r0, r7
	movs r1, 0x64
	bl __udivsi3
	adds r7, r0, 0
_08014F20:
	cmp r6, 0x18
	bne _08014F26
	lsrs r7, 1
_08014F26:
	ldr r2, _08014F70 @ =gBattleMons
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08014F42
	lsrs r7, 2
_08014F42:
	cmp r6, 0x1A
	bne _08014F5C
	ldr r0, _08014F74 @ =gUnknown_2023E80
	ldrh r4, [r0]
	lsls r0, r5, 16
	subs r0, r5
	movs r1, 0x64
	bl __divsi3
	cmp r4, r0
	bge _08014F5C
	movs r7, 0x1
	negs r7, r7
_08014F5C:
	ldr r2, [sp, 0x4]
	cmp r2, 0
	beq _08014F78
	movs r3, 0
	b _08015014
	.align 2, 0
_08014F68: .4byte gBattleTypeFlags
_08014F6C: .4byte 0x00000822
_08014F70: .4byte gBattleMons
_08014F74: .4byte gUnknown_2023E80
_08014F78:
	ldr r0, _08014F98 @ =gChosenActionByBattler
	mov r3, r9
	adds r1, r3, r0
	ldrb r1, [r1]
	adds r2, r0, 0
	cmp r1, 0
	bne _08014FC8
	ldr r0, _08014F9C @ =gProtectStructs
	lsls r1, r3, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	bge _08014FA0
	movs r3, 0xA5
	b _08014FCA
	.align 2, 0
_08014F98: .4byte gChosenActionByBattler
_08014F9C: .4byte gProtectStructs
_08014FA0:
	ldr r0, _08014FC0 @ =gBattleStruct
	ldr r0, [r0]
	add r0, r9
	adds r0, 0x80
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	mov r3, r9
	muls r3, r1
	adds r1, r3, 0
	adds r0, r1
	ldr r1, _08014FC4 @ =gBattleMons
	adds r1, 0xC
	adds r0, r1
	ldrh r3, [r0]
	b _08014FCA
	.align 2, 0
_08014FC0: .4byte gBattleStruct
_08014FC4: .4byte gBattleMons
_08014FC8:
	movs r3, 0
_08014FCA:
	mov r1, r10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015014
	ldr r0, _08014FE8 @ =gProtectStructs
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	bge _08014FEC
	movs r2, 0xA5
	b _08015016
	.align 2, 0
_08014FE8: .4byte gProtectStructs
_08014FEC:
	ldr r0, _0801500C @ =gBattleStruct
	ldr r0, [r0]
	add r0, r10
	adds r0, 0x80
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	mov r2, r10
	muls r2, r1
	adds r1, r2, 0
	adds r0, r1
	ldr r1, _08015010 @ =gBattleMons
	adds r1, 0xC
	adds r0, r1
	ldrh r2, [r0]
	b _08015016
	.align 2, 0
_0801500C: .4byte gBattleStruct
_08015010: .4byte gBattleMons
_08015014:
	movs r2, 0
_08015016:
	ldr r4, _08015060 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r4
	movs r1, 0x7
	ldrsb r1, [r0, r1]
	lsls r3, r2, 1
	cmp r1, 0
	bne _0801503A
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08015078
_0801503A:
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _0801506E
	cmp r8, r7
	bne _08015064
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08015064
	movs r3, 0x2
	b _08015094
	.align 2, 0
_08015060: .4byte gBattleMoves
_08015064:
	cmp r8, r7
	bcs _08015096
	movs r0, 0x1
	str r0, [sp, 0x8]
	b _08015096
_0801506E:
	cmp r1, r0
	bge _08015096
	movs r1, 0x1
	str r1, [sp, 0x8]
	b _08015096
_08015078:
	cmp r8, r7
	bne _0801508E
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0801508E
	movs r2, 0x2
	str r2, [sp, 0x8]
	b _08015096
_0801508E:
	cmp r8, r7
	bcs _08015096
	movs r3, 0x1
_08015094:
	str r3, [sp, 0x8]
_08015096:
	ldr r0, [sp, 0x8]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetWhoStrikesFirst

	thumb_func_start sub_80150A8
sub_80150A8: @ 80150A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r3, 0
	ldr r0, _080150FC @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08015114
	ldr r0, _08015100 @ =gActiveBattler
	strb r3, [r0]
	ldr r4, _08015104 @ =gBattlersCount
	mov r8, r0
	ldrb r0, [r4]
	cmp r3, r0
	bcc _080150D0
	b _080152FA
_080150D0:
	ldr r7, _08015108 @ =gActionsByTurnOrder
	ldr r6, _0801510C @ =gChosenActionByBattler
	mov r2, r8
	ldr r5, _08015110 @ =gBattlerByTurnOrder
_080150D8:
	adds r1, r3, r7
	ldrb r0, [r2]
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r3, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r3, 0x1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	cmp r0, r1
	bcc _080150D8
	b _080152FA
	.align 2, 0
_080150FC: .4byte gBattleTypeFlags
_08015100: .4byte gActiveBattler
_08015104: .4byte gBattlersCount
_08015108: .4byte gActionsByTurnOrder
_0801510C: .4byte gChosenActionByBattler
_08015110: .4byte gBattlerByTurnOrder
_08015114:
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _08015164
	ldr r0, _08015158 @ =gActiveBattler
	strb r3, [r0]
	ldr r1, _0801515C @ =gBattlersCount
	mov r8, r0
	adds r2, r1, 0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _08015174
	ldr r0, _08015160 @ =gChosenActionByBattler
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x3
	beq _08015172
_08015136:
	mov r7, r8
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0801515C @ =gBattlersCount
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08015174
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08015136
	b _08015172
	.align 2, 0
_08015158: .4byte gActiveBattler
_0801515C: .4byte gBattlersCount
_08015160: .4byte gChosenActionByBattler
_08015164:
	ldr r0, _080151D8 @ =gChosenActionByBattler
	ldrb r0, [r0]
	ldr r2, _080151DC @ =gActiveBattler
	mov r8, r2
	cmp r0, 0x3
	bne _08015174
	strb r3, [r2]
_08015172:
	movs r3, 0x5
_08015174:
	cmp r3, 0x5
	bne _080151F8
	ldr r6, _080151E0 @ =gActionsByTurnOrder
	ldr r1, _080151D8 @ =gChosenActionByBattler
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r6]
	ldr r2, _080151E4 @ =gBattlerByTurnOrder
	ldrb r0, [r3]
	strb r0, [r2]
	movs r3, 0x1
	movs r5, 0
	adds r4, r1, 0
	ldr r7, _080151E8 @ =gBattleMainFunc
	mov r10, r7
	ldr r0, _080151EC @ =CheckFocusPunch_ClearVarsBeforeTurnStarts
	mov r12, r0
	ldr r1, _080151F0 @ =gBattleStruct
	mov r9, r1
	ldr r7, _080151F4 @ =gBattlersCount
	ldrb r7, [r7]
	cmp r5, r7
	bge _080151CC
	adds r7, r6, 0
	adds r6, r4, 0
	adds r4, r2, 0
	ldr r2, _080151F4 @ =gBattlersCount
_080151AE:
	mov r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	beq _080151C4
	adds r1, r3, r7
	adds r0, r5, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, r4
	strb r5, [r0]
	adds r3, 0x1
_080151C4:
	adds r5, 0x1
	ldrb r1, [r2]
	cmp r5, r1
	blt _080151AE
_080151CC:
	mov r2, r12
	mov r3, r10
	str r2, [r3]
	mov r7, r9
	ldr r0, [r7]
	b _08015304
	.align 2, 0
_080151D8: .4byte gChosenActionByBattler
_080151DC: .4byte gActiveBattler
_080151E0: .4byte gActionsByTurnOrder
_080151E4: .4byte gBattlerByTurnOrder
_080151E8: .4byte gBattleMainFunc
_080151EC: .4byte CheckFocusPunch_ClearVarsBeforeTurnStarts
_080151F0: .4byte gBattleStruct
_080151F4: .4byte gBattlersCount
_080151F8:
	movs r0, 0
	mov r1, r8
	strb r0, [r1]
	ldr r2, _08015288 @ =gBattlersCount
	ldrb r0, [r2]
	cmp r0, 0
	beq _0801523E
	ldr r6, _0801528C @ =gChosenActionByBattler
	mov r2, r8
	ldr r5, _08015290 @ =gActionsByTurnOrder
	ldr r4, _08015294 @ =gBattlerByTurnOrder
_0801520E:
	ldrb r0, [r2]
	adds r0, r6
	ldrb r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0801522C
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, 0x1
_0801522C:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08015288 @ =gBattlersCount
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801520E
_0801523E:
	movs r0, 0
	mov r2, r8
	strb r0, [r2]
	ldr r7, _08015288 @ =gBattlersCount
	ldrb r0, [r7]
	cmp r0, 0
	beq _08015282
	ldr r6, _0801528C @ =gChosenActionByBattler
	ldr r5, _08015290 @ =gActionsByTurnOrder
	ldr r4, _08015294 @ =gBattlerByTurnOrder
_08015252:
	ldrb r0, [r2]
	adds r0, r6
	ldrb r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08015270
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, 0x1
_08015270:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08015288 @ =gBattlersCount
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08015252
_08015282:
	movs r5, 0
	b _080152F0
	.align 2, 0
_08015288: .4byte gBattlersCount
_0801528C: .4byte gChosenActionByBattler
_08015290: .4byte gActionsByTurnOrder
_08015294: .4byte gBattlerByTurnOrder
_08015298:
	adds r4, r5, 0x1
	adds r7, r4, 0
	ldrb r1, [r1]
	cmp r7, r1
	bge _080152EE
	ldr r6, _08015318 @ =gActionsByTurnOrder
	lsls r2, r5, 24
	mov r8, r2
_080152A8:
	ldr r0, _0801531C @ =gBattlerByTurnOrder
	adds r1, r5, r0
	ldrb r3, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	adds r0, r5, r6
	ldrb r2, [r0]
	cmp r2, 0x1
	beq _080152E4
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080152E4
	cmp r2, 0x2
	beq _080152E4
	cmp r0, 0x2
	beq _080152E4
	adds r0, r3, 0
	movs r2, 0
	bl GetWhoStrikesFirst
	lsls r0, 24
	cmp r0, 0
	beq _080152E4
	lsls r1, r4, 24
	lsrs r1, 24
	mov r3, r8
	lsrs r0, r3, 24
	bl SwapTurnOrder
_080152E4:
	adds r4, 0x1
	ldr r0, _08015320 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	blt _080152A8
_080152EE:
	adds r5, r7, 0
_080152F0:
	ldr r1, _08015320 @ =gBattlersCount
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _08015298
_080152FA:
	ldr r1, _08015324 @ =gBattleMainFunc
	ldr r0, _08015328 @ =CheckFocusPunch_ClearVarsBeforeTurnStarts
	str r0, [r1]
	ldr r0, _0801532C @ =gBattleStruct
	ldr r0, [r0]
_08015304:
	adds r0, 0x48
	movs r1, 0
	strb r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015318: .4byte gActionsByTurnOrder
_0801531C: .4byte gBattlerByTurnOrder
_08015320: .4byte gBattlersCount
_08015324: .4byte gBattleMainFunc
_08015328: .4byte CheckFocusPunch_ClearVarsBeforeTurnStarts
_0801532C: .4byte gBattleStruct
	thumb_func_end sub_80150A8

	thumb_func_start TurnValuesCleanUp
TurnValuesCleanUp: @ 8015330
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _08015388 @ =gActiveBattler
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0801538C @ =gBattlersCount
	ldrb r2, [r0]
	adds r5, r1, 0
	cmp r2, 0
	beq _08015428
	ldr r7, _08015390 @ =gProtectStructs
	adds r6, r5, 0
	ldr r0, _08015394 @ =gUnknown_2023C34
	mov r12, r0
	ldr r1, _08015398 @ =gDisableStructs
	mov r8, r1
	mov r10, r8
_0801535E:
	mov r2, r9
	cmp r2, 0
	beq _0801539C
	ldrb r1, [r6]
	lsls r1, 4
	adds r1, r7
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, 4
	adds r1, r7
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _080153F8
	.align 2, 0
_08015388: .4byte gActiveBattler
_0801538C: .4byte gBattlersCount
_08015390: .4byte gProtectStructs
_08015394: .4byte gUnknown_2023C34
_08015398: .4byte gDisableStructs
_0801539C:
	ldrb r0, [r6]
	lsls r0, 4
	adds r2, r0, r7
	movs r1, 0
	mov r4, r10
	movs r3, 0
_080153A8:
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0xF
	bls _080153A8
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x16]
	cmp r0, 0
	beq _080153C6
	subs r0, 0x1
	strb r0, [r1, 0x16]
_080153C6:
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x19]
	cmp r0, 0
	beq _080153F8
	subs r0, 0x1
	strb r0, [r1, 0x19]
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x19]
	cmp r0, 0
	bne _080153F8
	movs r0, 0x58
	muls r2, r0
	add r2, r12
	ldr r0, [r2]
	ldr r1, _08015440 @ =0xffbfffff
	ands r0, r1
	str r0, [r2]
_080153F8:
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	bne _08015416
	movs r0, 0x58
	muls r2, r0
	add r2, r12
	ldr r0, [r2]
	ldr r1, _08015444 @ =0xfeffffff
	ands r0, r1
	str r0, [r2]
_08015416:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08015448 @ =gBattlersCount
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801535E
_08015428:
	movs r0, 0
	ldr r2, _0801544C @ =gSideTimers
	strb r0, [r2, 0x8]
	strb r0, [r2, 0x14]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015440: .4byte 0xffbfffff
_08015444: .4byte 0xfeffffff
_08015448: .4byte gBattlersCount
_0801544C: .4byte gSideTimers
	thumb_func_end TurnValuesCleanUp

	thumb_func_start SpecialStatusesClear
SpecialStatusesClear: @ 8015450
	push {r4-r6,lr}
	ldr r2, _08015494 @ =gActiveBattler
	movs r0, 0
	strb r0, [r2]
	ldr r0, _08015498 @ =gBattlersCount
	ldrb r1, [r0]
	adds r6, r0, 0
	cmp r1, 0
	beq _0801548E
	adds r3, r2, 0
	movs r4, 0
	ldr r5, _0801549C @ =gSpecialStatuses
_08015468:
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r5
	movs r1, 0
_08015474:
	adds r0, r2, r1
	strb r4, [r0]
	adds r1, 0x1
	cmp r1, 0x13
	bls _08015474
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	cmp r0, r1
	bcc _08015468
_0801548E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015494: .4byte gActiveBattler
_08015498: .4byte gBattlersCount
_0801549C: .4byte gSpecialStatuses
	thumb_func_end SpecialStatusesClear

	thumb_func_start CheckFocusPunch_ClearVarsBeforeTurnStarts
CheckFocusPunch_ClearVarsBeforeTurnStarts: @ 80154A0
	push {r4-r7,lr}
	ldr r0, _08015528 @ =gHitMarker
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _0801555E
	ldr r2, _0801552C @ =gBattleStruct
	ldr r0, [r2]
	adds r0, 0x48
	ldr r1, _08015530 @ =gBattlersCount
	ldrb r0, [r0]
	mov r12, r2
	adds r6, r1, 0
	ldrb r1, [r6]
	cmp r0, r1
	bcs _0801555E
	ldr r5, _08015534 @ =gActiveBattler
	ldr r4, _08015538 @ =gBattlerAttacker
	movs r7, 0x84
	lsls r7, 1
_080154CC:
	ldr r1, [r2]
	adds r1, 0x48
	ldrb r0, [r1]
	strb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _0801553C @ =gChosenMoveByBattler
	ldrb r3, [r5]
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	bne _08015550
	ldr r1, _08015540 @ =gBattleMons
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08015550
	ldr r2, _08015544 @ =gDisableStructs
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 31
	cmp r0, 0
	bne _08015550
	ldr r0, _08015548 @ =gProtectStructs
	lsls r1, r3, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	blt _08015550
	ldr r0, _0801554C @ =gUnknown_81D9015
	bl BattleScriptExecute
	b _08015598
	.align 2, 0
_08015528: .4byte gHitMarker
_0801552C: .4byte gBattleStruct
_08015530: .4byte gBattlersCount
_08015534: .4byte gActiveBattler
_08015538: .4byte gBattlerAttacker
_0801553C: .4byte gChosenMoveByBattler
_08015540: .4byte gBattleMons
_08015544: .4byte gDisableStructs
_08015548: .4byte gProtectStructs
_0801554C: .4byte gUnknown_81D9015
_08015550:
	mov r2, r12
	ldr r0, [r2]
	adds r0, 0x48
	ldrb r0, [r0]
	ldrb r1, [r6]
	cmp r0, r1
	bcc _080154CC
_0801555E:
	bl TryClearRageStatuses
	ldr r1, _080155A0 @ =gCurrentTurnActionNumber
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080155A4 @ =gCurrentActionFuncId
	ldr r0, _080155A8 @ =gActionsByTurnOrder
	movs r3, 0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080155AC @ =gDynamicBasePower
	movs r2, 0
	strh r3, [r0]
	ldr r0, _080155B0 @ =gBattleStruct
	ldr r0, [r0]
	strb r2, [r0, 0x13]
	ldr r1, _080155B4 @ =gBattleMainFunc
	ldr r0, _080155B8 @ =RunTurnActionsFunctions
	str r0, [r1]
	ldr r0, _080155BC @ =gBattleCommunication
	strb r2, [r0, 0x3]
	strb r2, [r0, 0x4]
	ldr r0, _080155C0 @ =gBattleScripting
	strb r2, [r0, 0x16]
	ldr r0, _080155C4 @ =gBattleResources
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	adds r0, 0x20
	strb r2, [r0]
_08015598:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080155A0: .4byte gCurrentTurnActionNumber
_080155A4: .4byte gCurrentActionFuncId
_080155A8: .4byte gActionsByTurnOrder
_080155AC: .4byte gDynamicBasePower
_080155B0: .4byte gBattleStruct
_080155B4: .4byte gBattleMainFunc
_080155B8: .4byte RunTurnActionsFunctions
_080155BC: .4byte gBattleCommunication
_080155C0: .4byte gBattleScripting
_080155C4: .4byte gBattleResources
	thumb_func_end CheckFocusPunch_ClearVarsBeforeTurnStarts

	thumb_func_start RunTurnActionsFunctions
RunTurnActionsFunctions: @ 80155C8
	push {r4-r6,lr}
	ldr r6, _0801561C @ =gBattleOutcome
	ldrb r0, [r6]
	ldr r2, _08015620 @ =gCurrentActionFuncId
	cmp r0, 0
	beq _080155D8
	movs r0, 0xC
	strb r0, [r2]
_080155D8:
	ldr r5, _08015624 @ =gBattleStruct
	ldr r0, [r5]
	adds r0, 0x4B
	ldr r4, _08015628 @ =gCurrentTurnActionNumber
	ldrb r1, [r4]
	strb r1, [r0]
	ldr r1, _0801562C @ =gUnknown_8250038
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08015630 @ =gBattlersCount
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08015644
	ldr r2, _08015634 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08015638 @ =0xffefffff
	ands r0, r1
	str r0, [r2]
	ldr r3, _0801563C @ =gBattleMainFunc
	ldr r2, _08015640 @ =gUnknown_8250070
	ldrb r1, [r6]
	movs r0, 0x7F
	ands r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	b _0801565C
	.align 2, 0
_0801561C: .4byte gBattleOutcome
_08015620: .4byte gCurrentActionFuncId
_08015624: .4byte gBattleStruct
_08015628: .4byte gCurrentTurnActionNumber
_0801562C: .4byte gUnknown_8250038
_08015630: .4byte gBattlersCount
_08015634: .4byte gHitMarker
_08015638: .4byte 0xffefffff
_0801563C: .4byte gBattleMainFunc
_08015640: .4byte gUnknown_8250070
_08015644:
	ldr r0, [r5]
	adds r0, 0x4B
	ldrb r0, [r0]
	cmp r0, r1
	beq _0801565C
	ldr r2, _08015664 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08015668 @ =0xfffffdff
	ands r0, r1
	ldr r1, _0801566C @ =0xfff7ffff
	ands r0, r1
	str r0, [r2]
_0801565C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015664: .4byte gHitMarker
_08015668: .4byte 0xfffffdff
_0801566C: .4byte 0xfff7ffff
	thumb_func_end RunTurnActionsFunctions

	thumb_func_start sub_8015670
sub_8015670: @ 8015670
	push {r4,lr}
	ldr r1, _080156A8 @ =gCurrentActionFuncId
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080156AC @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080156C4
	ldr r1, _080156B0 @ =gBattleTextBuff1
	ldr r4, _080156B4 @ =gBattleOutcome
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _080156B8 @ =gBattlerAttacker
	strb r0, [r1]
	ldr r1, _080156BC @ =gBattlescriptCurrInstr
	ldr r0, _080156C0 @ =gUnknown_81D88CC
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4]
	b _0801576E
	.align 2, 0
_080156A8: .4byte gCurrentActionFuncId
_080156AC: .4byte gBattleTypeFlags
_080156B0: .4byte gBattleTextBuff1
_080156B4: .4byte gBattleOutcome
_080156B8: .4byte gBattlerAttacker
_080156BC: .4byte gBattlescriptCurrInstr
_080156C0: .4byte gUnknown_81D88CC
_080156C4:
	ldr r0, _080156E0 @ =0x00080900
	ands r0, r1
	cmp r0, 0
	beq _080156EC
	bl BattleStopLowHpSound
	movs r0, 0x9B
	lsls r0, 1
	bl PlayBGM
	ldr r1, _080156E4 @ =gBattlescriptCurrInstr
	ldr r0, _080156E8 @ =gUnknown_81D88D7
	b _0801576C
	.align 2, 0
_080156E0: .4byte 0x00080900
_080156E4: .4byte gBattlescriptCurrInstr
_080156E8: .4byte gUnknown_81D88D7
_080156EC:
	movs r0, 0xA
	ands r1, r0
	cmp r1, 0x8
	bne _08015768
	bl BattleStopLowHpSound
	ldr r1, _08015720 @ =gBattlescriptCurrInstr
	ldr r0, _08015724 @ =gUnknown_81D87EF
	str r0, [r1]
	ldr r2, _08015728 @ =gTrainers
	ldr r0, _0801572C @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	subs r0, 0x53
	cmp r0, 0x7
	bhi _0801575E
	lsls r0, 2
	ldr r1, _08015730 @ =_08015734
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015720: .4byte gBattlescriptCurrInstr
_08015724: .4byte gUnknown_81D87EF
_08015728: .4byte gTrainers
_0801572C: .4byte gTrainerBattleOpponent_A
_08015730: .4byte _08015734
	.align 2, 0
_08015734:
	.4byte _0801575E
	.4byte _08015754
	.4byte _0801575E
	.4byte _0801575E
	.4byte _0801575E
	.4byte _0801575E
	.4byte _0801575E
	.4byte _08015754
_08015754:
	movs r0, 0x9C
	lsls r0, 1
	bl PlayBGM
	b _0801576E
_0801575E:
	movs r0, 0x9B
	lsls r0, 1
	bl PlayBGM
	b _0801576E
_08015768:
	ldr r1, _0801577C @ =gBattlescriptCurrInstr
	ldr r0, _08015780 @ =gUnknown_81D8803
_0801576C:
	str r0, [r1]
_0801576E:
	ldr r1, _08015784 @ =gBattleMainFunc
	ldr r0, _08015788 @ =sub_8015910
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801577C: .4byte gBattlescriptCurrInstr
_08015780: .4byte gUnknown_81D8803
_08015784: .4byte gBattleMainFunc
_08015788: .4byte sub_8015910
	thumb_func_end sub_8015670

	thumb_func_start sub_801578C
sub_801578C: @ 801578C
	push {r4,lr}
	ldr r1, _080157C4 @ =gCurrentActionFuncId
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080157C8 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r4, 0x2
	adds r0, r1, 0
	ands r0, r4
	cmp r0, 0
	beq _080157E0
	ldr r1, _080157CC @ =gBattleTextBuff1
	ldr r4, _080157D0 @ =gBattleOutcome
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _080157D4 @ =gBattlerAttacker
	strb r0, [r1]
	ldr r1, _080157D8 @ =gBattlescriptCurrInstr
	ldr r0, _080157DC @ =gUnknown_81D88CC
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4]
	b _08015830
	.align 2, 0
_080157C4: .4byte gCurrentActionFuncId
_080157C8: .4byte gBattleTypeFlags
_080157CC: .4byte gBattleTextBuff1
_080157D0: .4byte gBattleOutcome
_080157D4: .4byte gBattlerAttacker
_080157D8: .4byte gBattlescriptCurrInstr
_080157DC: .4byte gUnknown_81D88CC
_080157E0:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _08015824
	bl sub_80803CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bne _08015824
	bl sub_80803D8
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0801580C
	ldr r1, _08015808 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08015810
	.align 2, 0
_08015808: .4byte gBattleCommunication
_0801580C:
	ldr r0, _0801581C @ =gBattleCommunication
	strb r4, [r0, 0x5]
_08015810:
	movs r0, 0x1
	bl GetBattlerAtPosition
	ldr r1, _08015820 @ =gBattlerAttacker
	strb r0, [r1]
	b _0801582A
	.align 2, 0
_0801581C: .4byte gBattleCommunication
_08015820: .4byte gBattlerAttacker
_08015824:
	ldr r1, _0801583C @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
_0801582A:
	ldr r1, _08015840 @ =gBattlescriptCurrInstr
	ldr r0, _08015844 @ =gUnknown_81D8806
	str r0, [r1]
_08015830:
	ldr r1, _08015848 @ =gBattleMainFunc
	ldr r0, _0801584C @ =sub_8015910
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801583C: .4byte gBattleCommunication
_08015840: .4byte gBattlescriptCurrInstr
_08015844: .4byte gUnknown_81D8806
_08015848: .4byte gBattleMainFunc
_0801584C: .4byte sub_8015910
	thumb_func_end sub_801578C

	thumb_func_start sub_8015850
sub_8015850: @ 8015850
	push {lr}
	ldr r1, _08015878 @ =gCurrentActionFuncId
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0801587C @ =gProtectStructs
	ldr r0, _08015880 @ =gBattlerAttacker
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	lsrs r0, 30
	cmp r0, 0x1
	beq _0801588C
	cmp r0, 0x2
	beq _0801589C
	ldr r1, _08015884 @ =gBattlescriptCurrInstr
	ldr r0, _08015888 @ =gUnknown_81D8916
	b _080158A0
	.align 2, 0
_08015878: .4byte gCurrentActionFuncId
_0801587C: .4byte gProtectStructs
_08015880: .4byte gBattlerAttacker
_08015884: .4byte gBattlescriptCurrInstr
_08015888: .4byte gUnknown_81D8916
_0801588C:
	ldr r1, _08015894 @ =gBattlescriptCurrInstr
	ldr r0, _08015898 @ =gUnknown_81D8901
	b _080158A0
	.align 2, 0
_08015894: .4byte gBattlescriptCurrInstr
_08015898: .4byte gUnknown_81D8901
_0801589C:
	ldr r1, _080158AC @ =gBattlescriptCurrInstr
	ldr r0, _080158B0 @ =gUnknown_81D890F
_080158A0:
	str r0, [r1]
	ldr r1, _080158B4 @ =gBattleMainFunc
	ldr r0, _080158B8 @ =sub_8015910
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080158AC: .4byte gBattlescriptCurrInstr
_080158B0: .4byte gUnknown_81D890F
_080158B4: .4byte gBattleMainFunc
_080158B8: .4byte sub_8015910
	thumb_func_end sub_8015850

	thumb_func_start sub_80158BC
sub_80158BC: @ 80158BC
	ldr r1, _080158F0 @ =gCurrentActionFuncId
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080158F4 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	ldr r2, _080158F8 @ =gBattlerAttacker
	ldrb r0, [r2]
	strb r0, [r1, 0x2]
	ldr r3, _080158FC @ =gBattlerPartyIndexes
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08015900 @ =gBattlescriptCurrInstr
	ldr r0, _08015904 @ =gUnknown_81D891D
	str r0, [r1]
	ldr r1, _08015908 @ =gBattleMainFunc
	ldr r0, _0801590C @ =sub_8015910
	str r0, [r1]
	bx lr
	.align 2, 0
_080158F0: .4byte gCurrentActionFuncId
_080158F4: .4byte gBattleTextBuff1
_080158F8: .4byte gBattlerAttacker
_080158FC: .4byte gBattlerPartyIndexes
_08015900: .4byte gBattlescriptCurrInstr
_08015904: .4byte gUnknown_81D891D
_08015908: .4byte gBattleMainFunc
_0801590C: .4byte sub_8015910
	thumb_func_end sub_80158BC

	thumb_func_start sub_8015910
sub_8015910: @ 8015910
	push {r4-r7,lr}
	ldr r0, _08015974 @ =gCurrentActionFuncId
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08015A04
	ldr r0, _08015978 @ =gBattleTypeFlags
	ldr r1, [r0]
	ldr r0, _0801597C @ =0x00080b92
	ands r1, r0
	cmp r1, 0
	bne _080159BC
	ldr r2, _08015980 @ =gActiveBattler
	strb r1, [r2]
	ldr r0, _08015984 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080159BC
	adds r4, r2, 0
	ldr r6, _08015988 @ =gBattleMons
	movs r5, 0x58
	adds r7, r6, 0
	adds r7, 0x30
_08015942:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080159AA
	ldr r2, _0801598C @ =gBattleResults
	ldrh r0, [r2, 0x6]
	cmp r0, 0
	bne _08015990
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x8
	bl StringCopy
	b _080159AA
	.align 2, 0
_08015974: .4byte gCurrentActionFuncId
_08015978: .4byte gBattleTypeFlags
_0801597C: .4byte 0x00080b92
_08015980: .4byte gActiveBattler
_08015984: .4byte gBattlersCount
_08015988: .4byte gBattleMons
_0801598C: .4byte gBattleResults
_08015990:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x26]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x14
	bl StringCopy
_080159AA:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _080159EC @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08015942
_080159BC:
	bl sub_812BFDC
	ldr r0, _080159F0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080159D0
	bl sub_810CB90
_080159D0:
	movs r0, 0x3
	bl BeginFastPaletteFade
	movs r0, 0x5
	bl FadeOutMapMusic
	ldr r1, _080159F4 @ =gBattleMainFunc
	ldr r0, _080159F8 @ =sub_8015A30
	str r0, [r1]
	ldr r1, _080159FC @ =gUnknown_300537C
	ldr r0, _08015A00 @ =BattleMainCB2
	str r0, [r1]
	b _08015A1E
	.align 2, 0
_080159EC: .4byte gBattlersCount
_080159F0: .4byte gBattleTypeFlags
_080159F4: .4byte gBattleMainFunc
_080159F8: .4byte sub_8015A30
_080159FC: .4byte gUnknown_300537C
_08015A00: .4byte BattleMainCB2
_08015A04:
	ldr r0, _08015A24 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08015A1E
	ldr r1, _08015A28 @ =gBattleScriptingCommandsTable
	ldr r0, _08015A2C @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08015A1E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015A24: .4byte gBattleControllerExecFlags
_08015A28: .4byte gBattleScriptingCommandsTable
_08015A2C: .4byte gBattlescriptCurrInstr
	thumb_func_end sub_8015910

	thumb_func_start sub_8015A30
sub_8015A30: @ 8015A30
	push {lr}
	ldr r0, _08015A58 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08015A8E
	bl ResetSpriteData
	ldr r0, _08015A5C @ =gLeveledUpInBattle
	ldrb r0, [r0]
	cmp r0, 0
	beq _08015A52
	ldr r0, _08015A60 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08015A6C
_08015A52:
	ldr r1, _08015A64 @ =gBattleMainFunc
	ldr r0, _08015A68 @ =ReturnFromBattleToOverworld
	b _08015A70
	.align 2, 0
_08015A58: .4byte gPaletteFade
_08015A5C: .4byte gLeveledUpInBattle
_08015A60: .4byte gBattleOutcome
_08015A64: .4byte gBattleMainFunc
_08015A68: .4byte ReturnFromBattleToOverworld
_08015A6C:
	ldr r1, _08015A94 @ =gBattleMainFunc
	ldr r0, _08015A98 @ =sub_8015AA0
_08015A70:
	str r0, [r1]
	bl FreeAllWindowBuffers
	ldr r0, _08015A9C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08015A8E
	bl FreeMonSpritesGfx
	bl FreeBattleSpritesData
	bl FreeBattleResources
_08015A8E:
	pop {r0}
	bx r0
	.align 2, 0
_08015A94: .4byte gBattleMainFunc
_08015A98: .4byte sub_8015AA0
_08015A9C: .4byte gBattleTypeFlags
	thumb_func_end sub_8015A30

	thumb_func_start sub_8015AA0
sub_8015AA0: @ 8015AA0
	push {r4,r5,lr}
	ldr r0, _08015AF4 @ =gLeveledUpInBattle
	ldrb r1, [r0]
	adds r3, r0, 0
	cmp r1, 0
	beq _08015B16
_08015AAC:
	movs r5, 0
_08015AAE:
	ldrb r2, [r3]
	ldr r0, _08015AF8 @ =gBitTable
	lsls r1, r5, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08015B08
	bics r2, r1
	strb r2, [r3]
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08015AFC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08015B08
	ldr r0, _08015B00 @ =gBattleMainFunc
	ldr r1, _08015B04 @ =sub_8015B30
	str r1, [r0]
	lsls r3, r5, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r2, 0
	movs r2, 0x81
	bl EvolutionScene
	b _08015B1C
	.align 2, 0
_08015AF4: .4byte gLeveledUpInBattle
_08015AF8: .4byte gBitTable
_08015AFC: .4byte gPlayerParty
_08015B00: .4byte gBattleMainFunc
_08015B04: .4byte sub_8015B30
_08015B08:
	adds r5, 0x1
	ldr r3, _08015B24 @ =gLeveledUpInBattle
	cmp r5, 0x5
	ble _08015AAE
	ldrb r0, [r3]
	cmp r0, 0
	bne _08015AAC
_08015B16:
	ldr r1, _08015B28 @ =gBattleMainFunc
	ldr r0, _08015B2C @ =ReturnFromBattleToOverworld
	str r0, [r1]
_08015B1C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015B24: .4byte gLeveledUpInBattle
_08015B28: .4byte gBattleMainFunc
_08015B2C: .4byte ReturnFromBattleToOverworld
	thumb_func_end sub_8015AA0

	thumb_func_start sub_8015B30
sub_8015B30: @ 8015B30
	push {lr}
	ldr r0, _08015B48 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _08015B4C @ =BattleMainCB2
	cmp r1, r0
	bne _08015B42
	ldr r1, _08015B50 @ =gBattleMainFunc
	ldr r0, _08015B54 @ =sub_8015AA0
	str r0, [r1]
_08015B42:
	pop {r0}
	bx r0
	.align 2, 0
_08015B48: .4byte gMain
_08015B4C: .4byte BattleMainCB2
_08015B50: .4byte gBattleMainFunc
_08015B54: .4byte sub_8015AA0
	thumb_func_end sub_8015B30

	thumb_func_start ReturnFromBattleToOverworld
ReturnFromBattleToOverworld: @ 8015B58
	push {r4-r6,lr}
	ldr r6, _08015BDC @ =gBattleTypeFlags
	ldr r0, [r6]
	movs r5, 0x2
	ands r0, r5
	cmp r0, 0
	bne _08015B74
	ldr r4, _08015BE0 @ =gPlayerParty
	adds r0, r4, 0
	bl sub_8043A68
	adds r0, r4, 0
	bl sub_8043B40
_08015B74:
	ldr r4, [r6]
	adds r0, r4, 0
	ands r0, r5
	cmp r0, 0
	beq _08015B86
	ldr r0, _08015BE4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015BD4
_08015B86:
	ldr r1, _08015BE8 @ =gSpecialVar_Result
	ldr r5, _08015BEC @ =gBattleOutcome
	ldrb r0, [r5]
	strh r0, [r1]
	ldr r3, _08015BF0 @ =gMain
	ldr r0, _08015BF4 @ =0x00000439
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08015BF8 @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r3]
	movs r0, 0x80
	lsls r0, 3
	ands r4, r0
	cmp r4, 0
	beq _08015BC6
	ldr r0, _08015BFC @ =gEnemyParty
	bl UpdateRoamerHPStatus
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08015BC2
	cmp r1, 0x7
	bne _08015BC6
_08015BC2:
	bl SetRoamerInactive
_08015BC6:
	movs r0, 0x53
	bl m4aSongNumStop
	ldr r0, _08015BF0 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_08015BD4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015BDC: .4byte gBattleTypeFlags
_08015BE0: .4byte gPlayerParty
_08015BE4: .4byte gReceivedRemoteLinkPlayers
_08015BE8: .4byte gSpecialVar_Result
_08015BEC: .4byte gBattleOutcome
_08015BF0: .4byte gMain
_08015BF4: .4byte 0x00000439
_08015BF8: .4byte gPreBattleCallback1
_08015BFC: .4byte gEnemyParty
	thumb_func_end ReturnFromBattleToOverworld

	thumb_func_start RunBattleScriptCommands_PopCallbacksStack
RunBattleScriptCommands_PopCallbacksStack: @ 8015C00
	push {lr}
	ldr r0, _08015C3C @ =gCurrentActionFuncId
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08015C48
	ldr r3, _08015C40 @ =gBattleResources
	ldr r0, [r3]
	ldr r0, [r0, 0xC]
	adds r1, r0, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0
	beq _08015C24
	subs r0, 0x1
	strb r0, [r1]
_08015C24:
	ldr r2, _08015C44 @ =gBattleMainFunc
	ldr r0, [r3]
	ldr r1, [r0, 0xC]
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	b _08015C62
	.align 2, 0
_08015C3C: .4byte gCurrentActionFuncId
_08015C40: .4byte gBattleResources
_08015C44: .4byte gBattleMainFunc
_08015C48:
	ldr r0, _08015C68 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08015C62
	ldr r1, _08015C6C @ =gBattleScriptingCommandsTable
	ldr r0, _08015C70 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08015C62:
	pop {r0}
	bx r0
	.align 2, 0
_08015C68: .4byte gBattleControllerExecFlags
_08015C6C: .4byte gBattleScriptingCommandsTable
_08015C70: .4byte gBattlescriptCurrInstr
	thumb_func_end RunBattleScriptCommands_PopCallbacksStack

	thumb_func_start RunBattleScriptCommands
RunBattleScriptCommands: @ 8015C74
	push {lr}
	ldr r0, _08015C94 @ =gBattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, 0
	bne _08015C90
	ldr r1, _08015C98 @ =gBattleScriptingCommandsTable
	ldr r0, _08015C9C @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08015C90:
	pop {r0}
	bx r0
	.align 2, 0
_08015C94: .4byte gBattleControllerExecFlags
_08015C98: .4byte gBattleScriptingCommandsTable
_08015C9C: .4byte gBattlescriptCurrInstr
	thumb_func_end RunBattleScriptCommands

	thumb_func_start sub_8015CA0
sub_8015CA0: @ 8015CA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0x4
	str r0, [sp]
	ldr r6, _08015CE0 @ =gBattlerAttacker
	ldr r1, _08015CE4 @ =gBattlerByTurnOrder
	ldr r0, _08015CE8 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r6]
	ldr r1, _08015CEC @ =gBattleStruct
	ldr r3, [r1]
	adds r0, r3, 0
	adds r0, 0x91
	ldrb r2, [r0]
	ldr r1, _08015CF0 @ =gBitTable
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _08015CF8
	ldr r1, _08015CF4 @ =gCurrentActionFuncId
	movs r0, 0xC
	b _0801634C
	.align 2, 0
_08015CE0: .4byte gBattlerAttacker
_08015CE4: .4byte gBattlerByTurnOrder
_08015CE8: .4byte gCurrentTurnActionNumber
_08015CEC: .4byte gBattleStruct
_08015CF0: .4byte gBitTable
_08015CF4: .4byte gCurrentActionFuncId
_08015CF8:
	ldr r1, _08015D6C @ =gCritMultiplier
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08015D70 @ =gBattleScripting
	movs r0, 0x1
	strb r0, [r1, 0xE]
	adds r0, r3, 0
	adds r0, 0xB7
	strb r2, [r0]
	ldr r0, _08015D74 @ =gMoveResultFlags
	strb r2, [r0]
	ldr r0, _08015D78 @ =gMultiHitCounter
	strb r2, [r0]
	ldr r0, _08015D7C @ =gBattleCommunication
	strb r2, [r0, 0x6]
	ldr r2, _08015D80 @ =gCurrMovePos
	ldr r3, _08015D84 @ =gChosenMovePos
	mov r9, r3
	ldrb r0, [r6]
	ldr r4, _08015D88 @ =gBattleStruct
	ldr r1, [r4]
	adds r0, r1
	adds r0, 0x80
	ldrb r0, [r0]
	strb r0, [r3]
	strb r0, [r2]
	ldr r1, _08015D8C @ =gProtectStructs
	ldrb r4, [r6]
	lsls r0, r4, 4
	adds r3, r0, r1
	ldrb r1, [r3]
	lsls r0, r1, 29
	mov r8, r2
	cmp r0, 0
	bge _08015D9C
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r2, _08015D90 @ =gCurrentMove
	ldr r1, _08015D94 @ =gChosenMove
	movs r0, 0xA5
	strh r0, [r1]
	strh r0, [r2]
	ldr r2, _08015D98 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 4
	orrs r0, r1
	str r0, [r2]
	movs r0, 0xA5
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r6]
	ldr r3, _08015D88 @ =gBattleStruct
	ldr r2, [r3]
	b _08015EF6
	.align 2, 0
_08015D6C: .4byte gCritMultiplier
_08015D70: .4byte gBattleScripting
_08015D74: .4byte gMoveResultFlags
_08015D78: .4byte gMultiHitCounter
_08015D7C: .4byte gBattleCommunication
_08015D80: .4byte gCurrMovePos
_08015D84: .4byte gChosenMovePos
_08015D88: .4byte gBattleStruct
_08015D8C: .4byte gProtectStructs
_08015D90: .4byte gCurrentMove
_08015D94: .4byte gChosenMove
_08015D98: .4byte gHitMarker
_08015D9C:
	ldr r0, _08015DD4 @ =gBattleMons
	movs r1, 0x58
	adds r5, r4, 0
	muls r5, r1
	adds r1, r0, 0
	adds r1, 0x50
	adds r1, r5, r1
	ldr r2, [r1]
	movs r1, 0x80
	lsls r1, 5
	ands r1, r2
	mov r10, r0
	cmp r1, 0
	bne _08015DC2
	movs r7, 0x80
	lsls r7, 15
	ands r7, r2
	cmp r7, 0
	beq _08015DE4
_08015DC2:
	ldr r3, _08015DD8 @ =gCurrentMove
	ldr r2, _08015DDC @ =gChosenMove
	ldr r1, _08015DE0 @ =gLockedMoves
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	strh r0, [r3]
	b _08015F18
	.align 2, 0
_08015DD4: .4byte gBattleMons
_08015DD8: .4byte gCurrentMove
_08015DDC: .4byte gChosenMove
_08015DE0: .4byte gLockedMoves
_08015DE4:
	ldr r3, _08015E38 @ =gDisableStructs
	mov r12, r3
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	add r0, r12
	ldrh r4, [r0, 0x6]
	adds r2, r4, 0
	cmp r2, 0
	beq _08015EBC
	ldrb r3, [r0, 0xC]
	lsls r0, r3, 1
	adds r0, r5
	mov r5, r10
	adds r5, 0xC
	adds r0, r5
	ldrh r1, [r0]
	cmp r2, r1
	bne _08015E48
	ldr r2, _08015E3C @ =gCurrentMove
	ldr r0, _08015E40 @ =gChosenMove
	strh r4, [r0]
	strh r4, [r2]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r0, [r0, 0xC]
	mov r4, r9
	strb r0, [r4]
	mov r1, r8
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r6]
	ldr r3, _08015E44 @ =gBattleStruct
	ldr r2, [r3]
	b _08015EF6
	.align 2, 0
_08015E38: .4byte gDisableStructs
_08015E3C: .4byte gCurrentMove
_08015E40: .4byte gChosenMove
_08015E44: .4byte gBattleStruct
_08015E48:
	cmp r2, 0
	beq _08015EBC
	cmp r2, r1
	beq _08015EBC
	mov r4, r9
	strb r3, [r4]
	mov r0, r8
	strb r3, [r0]
	ldr r3, _08015EB0 @ =gCurrentMove
	ldr r2, _08015EB4 @ =gChosenMove
	ldrb r0, [r0]
	lsls r0, 1
	ldrb r1, [r6]
	movs r4, 0x58
	muls r1, r4
	adds r0, r1
	adds r0, r5
	ldrh r0, [r0]
	strh r0, [r2]
	strh r0, [r3]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	movs r2, 0
	strh r7, [r0, 0x6]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	strb r2, [r0, 0xC]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xE]
	ldrh r0, [r3]
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r6]
	ldr r3, _08015EB8 @ =gBattleStruct
	ldr r2, [r3]
	b _08015EF6
	.align 2, 0
_08015EB0: .4byte gCurrentMove
_08015EB4: .4byte gChosenMove
_08015EB8: .4byte gBattleStruct
_08015EBC:
	mov r4, r8
	ldrb r0, [r4]
	lsls r0, 1
	ldr r4, _08015EFC @ =gBattlerAttacker
	ldrb r2, [r4]
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	mov r1, r10
	adds r1, 0xC
	adds r0, r1
	ldr r1, _08015F00 @ =gChosenMoveByBattler
	lsls r2, 1
	adds r2, r1
	ldrh r3, [r0]
	ldrh r2, [r2]
	cmp r3, r2
	beq _08015F10
	ldr r1, _08015F04 @ =gCurrentMove
	ldr r0, _08015F08 @ =gChosenMove
	strh r3, [r0]
	strh r3, [r1]
	ldrh r0, [r1]
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r4]
	ldr r2, _08015F0C @ =gBattleStruct
	ldr r2, [r2]
_08015EF6:
	adds r1, r2
	strb r0, [r1, 0xC]
	b _08015F18
	.align 2, 0
_08015EFC: .4byte gBattlerAttacker
_08015F00: .4byte gChosenMoveByBattler
_08015F04: .4byte gCurrentMove
_08015F08: .4byte gChosenMove
_08015F0C: .4byte gBattleStruct
_08015F10:
	ldr r1, _08015F30 @ =gCurrentMove
	ldr r0, _08015F34 @ =gChosenMove
	strh r3, [r0]
	strh r3, [r1]
_08015F18:
	ldr r0, _08015F38 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08015F40
	ldr r0, _08015F3C @ =gBattleResults
	ldr r1, _08015F30 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0, 0x22]
	b _08015F48
	.align 2, 0
_08015F30: .4byte gCurrentMove
_08015F34: .4byte gChosenMove
_08015F38: .4byte gBattlerAttacker
_08015F3C: .4byte gBattleResults
_08015F40:
	ldr r0, _08015FAC @ =gBattleResults
	ldr r1, _08015FB0 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0, 0x24]
_08015F48:
	ldr r4, _08015FB4 @ =gBattlerAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08015FB8 @ =gSideTimers
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r1
	ldrb r0, [r5, 0x8]
	adds r3, r4, 0
	cmp r0, 0
	beq _08015FC8
	ldr r2, _08015FBC @ =gBattleMoves
	ldr r0, _08015FB0 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _08015FC8
	ldrb r0, [r3]
	bl GetBattlerSide
	adds r4, r0, 0
	ldrb r0, [r5, 0x9]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08015FC8
	ldr r1, _08015FC0 @ =gBattleMons
	ldrb r2, [r5, 0x9]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08015FC8
	ldr r0, _08015FC4 @ =gBattlerTarget
	strb r2, [r0]
	b _0801632C
	.align 2, 0
_08015FAC: .4byte gBattleResults
_08015FB0: .4byte gCurrentMove
_08015FB4: .4byte gBattlerAttacker
_08015FB8: .4byte gSideTimers
_08015FBC: .4byte gBattleMoves
_08015FC0: .4byte gBattleMons
_08015FC4: .4byte gBattlerTarget
_08015FC8:
	ldr r2, _080160E4 @ =gBattleTypeFlags
	ldr r1, [r2]
	movs r0, 0x1
	ands r1, r0
	ldr r3, _080160E8 @ =gBattlerAttacker
	adds r7, r2, 0
	cmp r1, 0
	bne _08015FDA
	b _080162A0
_08015FDA:
	ldr r1, _080160EC @ =gSideTimers
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x8]
	cmp r5, 0
	beq _08015FEC
	b _080161F8
_08015FEC:
	ldr r2, _080160F0 @ =gBattleMoves
	ldr r0, _080160F4 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08016008
	ldrb r0, [r4, 0x6]
	cmp r0, 0x10
	bne _08016008
	b _080161F8
_08016008:
	ldr r3, _080160F8 @ =gBattleMons
	ldr r2, _080160E8 @ =gBattlerAttacker
	ldrb r6, [r2]
	ldr r0, _080160FC @ =gBattleStruct
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r1, [r0, 0xC]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r2, 0
	cmp r0, 0x1F
	bne _08016028
	b _080161F8
_08016028:
	ldrb r0, [r4, 0x2]
	cmp r0, 0xD
	beq _08016030
	b _080161F8
_08016030:
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08016100 @ =gActiveBattler
	strb r5, [r1]
	ldr r0, _08016104 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080160A8
	adds r4, r1, 0
_08016048:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _08016096
	ldr r0, _080160E8 @ =gBattlerAttacker
	ldrb r1, [r0]
	ldr r0, _080160FC @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r0
	ldrb r0, [r1, 0xC]
	ldrb r1, [r4]
	cmp r0, r1
	beq _08016096
	ldr r1, _080160F8 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1F
	bne _08016096
	adds r0, r2, 0
	bl GetBattlerTurnOrderNum
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp]
	cmp r0, r3
	bcs _08016096
	ldrb r0, [r4]
	bl GetBattlerTurnOrderNum
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_08016096:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08016104 @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08016048
_080160A8:
	ldr r4, [sp]
	cmp r4, 0x4
	beq _080160B0
	b _080161AA
_080160B0:
	ldr r2, _080160F0 @ =gBattleMoves
	ldr r0, _08016108 @ =gChosenMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	ands r4, r0
	cmp r4, 0
	beq _08016130
	ldr r0, _080160E8 @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08016110
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0801610C
	movs r0, 0x1
	b _08016122
	.align 2, 0
_080160E4: .4byte gBattleTypeFlags
_080160E8: .4byte gBattlerAttacker
_080160EC: .4byte gSideTimers
_080160F0: .4byte gBattleMoves
_080160F4: .4byte gCurrentMove
_080160F8: .4byte gBattleMons
_080160FC: .4byte gBattleStruct
_08016100: .4byte gActiveBattler
_08016104: .4byte gBattlersCount
_08016108: .4byte gChosenMove
_0801610C:
	movs r0, 0x3
	b _08016122
_08016110:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08016120
	movs r0, 0
	b _08016122
_08016120:
	movs r0, 0x2
_08016122:
	bl GetBattlerAtPosition
	ldr r1, _0801612C @ =gBattlerTarget
	strb r0, [r1]
	b _08016140
	.align 2, 0
_0801612C: .4byte gBattlerTarget
_08016130:
	ldr r2, _08016178 @ =gBattlerTarget
	ldr r0, _0801617C @ =gBattlerAttacker
	ldrb r0, [r0]
	ldr r1, _08016180 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	ldrb r0, [r0, 0xC]
	strb r0, [r2]
_08016140:
	ldr r7, _08016184 @ =gAbsentBattlerFlags
	ldrb r0, [r7]
	ldr r1, _08016188 @ =gBitTable
	mov r8, r1
	ldr r5, _08016178 @ =gBattlerTarget
	ldrb r1, [r5]
	lsls r1, 2
	add r1, r8
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _0801615A
	b _0801632C
_0801615A:
	ldr r6, _0801617C @ =gBattlerAttacker
	ldrb r0, [r6]
	bl GetBattlerSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0801618C
	ldrb r0, [r5]
	b _0801631A
	.align 2, 0
_08016178: .4byte gBattlerTarget
_0801617C: .4byte gBattlerAttacker
_08016180: .4byte gBattleStruct
_08016184: .4byte gAbsentBattlerFlags
_08016188: .4byte gBitTable
_0801618C:
	ldrb r0, [r6]
	bl GetBattlerPosition
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	strb r0, [r5]
	ldrb r1, [r7]
	ldrb r2, [r5]
	lsls r0, r2, 2
	add r0, r8
	b _08016310
_080161AA:
	ldr r4, _080161E4 @ =gActiveBattler
	ldr r0, _080161E8 @ =gBattlerByTurnOrder
	ldr r3, [sp]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r2, _080161EC @ =gBattleMons
	movs r1, 0x58
	muls r1, r0
	adds r1, r2
	adds r1, 0x20
	ldrb r1, [r1]
	bl RecordAbilityBattle
	ldr r2, _080161F0 @ =gSpecialStatuses
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _080161F4 @ =gBattlerTarget
	ldrb r0, [r4]
	strb r0, [r1]
	b _0801632C
	.align 2, 0
_080161E4: .4byte gActiveBattler
_080161E8: .4byte gBattlerByTurnOrder
_080161EC: .4byte gBattleMons
_080161F0: .4byte gSpecialStatuses
_080161F4: .4byte gBattlerTarget
_080161F8:
	ldr r0, [r7]
	movs r4, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080162A0
	ldr r2, _08016238 @ =gBattleMoves
	ldr r0, _0801623C @ =gChosenMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080162A0
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08016244
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _08016240
	movs r0, 0x1
	b _08016256
	.align 2, 0
_08016238: .4byte gBattleMoves
_0801623C: .4byte gChosenMove
_08016240:
	movs r0, 0x3
	b _08016256
_08016244:
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _08016254
	movs r0, 0
	b _08016256
_08016254:
	movs r0, 0x2
_08016256:
	bl GetBattlerAtPosition
	ldr r1, _08016290 @ =gBattlerTarget
	strb r0, [r1]
	ldr r0, _08016294 @ =gAbsentBattlerFlags
	ldrb r1, [r0]
	ldr r2, _08016298 @ =gBitTable
	ldr r5, _08016290 @ =gBattlerTarget
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801632C
	ldr r0, _0801629C @ =gBattlerAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0801632C
	ldrb r0, [r5]
	b _0801631A
	.align 2, 0
_08016290: .4byte gBattlerTarget
_08016294: .4byte gAbsentBattlerFlags
_08016298: .4byte gBitTable
_0801629C: .4byte gBattlerAttacker
_080162A0:
	ldr r5, _080162E4 @ =gBattlerTarget
	adds r2, r3, 0
	ldrb r0, [r2]
	ldr r1, _080162E8 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	ldrb r0, [r0, 0xC]
	strb r0, [r5]
	ldr r6, _080162EC @ =gAbsentBattlerFlags
	ldrb r1, [r6]
	ldr r7, _080162F0 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801632C
	ldrb r0, [r2]
	str r3, [sp, 0x4]
	bl GetBattlerSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r4, r0
	beq _080162F4
	ldrb r0, [r5]
	b _0801631A
	.align 2, 0
_080162E4: .4byte gBattlerTarget
_080162E8: .4byte gBattleStruct
_080162EC: .4byte gAbsentBattlerFlags
_080162F0: .4byte gBitTable
_080162F4:
	ldrb r0, [r3]
	bl GetBattlerPosition
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	strb r0, [r5]
	ldrb r1, [r6]
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r7
_08016310:
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801632C
	adds r0, r2, 0
_0801631A:
	bl GetBattlerPosition
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerAtPosition
	strb r0, [r5]
_0801632C:
	ldr r4, _08016360 @ =gBattlescriptCurrInstr
	ldr r3, _08016364 @ =gBattleScriptsForMoveEffects
	ldr r2, _08016368 @ =gBattleMoves
	ldr r0, _0801636C @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r4]
	ldr r1, _08016370 @ =gCurrentActionFuncId
	movs r0, 0xA
_0801634C:
	strb r0, [r1]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016360: .4byte gBattlescriptCurrInstr
_08016364: .4byte gBattleScriptsForMoveEffects
_08016368: .4byte gBattleMoves
_0801636C: .4byte gCurrentMove
_08016370: .4byte gCurrentActionFuncId
	thumb_func_end sub_8015CA0

	thumb_func_start sub_8016374
sub_8016374: @ 8016374
	push {r4,lr}
	ldr r3, _080163E0 @ =gBattlerAttacker
	ldr r1, _080163E4 @ =gBattlerByTurnOrder
	ldr r0, _080163E8 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _080163EC @ =gBattle_BG0_X
	movs r2, 0
	strh r2, [r0]
	ldr r0, _080163F0 @ =gBattle_BG0_Y
	strh r2, [r0]
	ldr r1, _080163F4 @ =gActionSelectionCursor
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r1, _080163F8 @ =gMoveSelectionCursor
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r2, _080163FC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x7
	strb r0, [r2, 0x1]
	ldrb r4, [r3]
	strb r4, [r2, 0x2]
	ldrb r0, [r3]
	ldr r1, _08016400 @ =gBattleStruct
	ldr r1, [r1]
	adds r0, r1
	adds r0, 0x58
	ldrb r0, [r0]
	strb r0, [r2, 0x3]
	movs r0, 0xFF
	strb r0, [r2, 0x4]
	ldr r0, _08016404 @ =gBattleScripting
	strb r4, [r0, 0x17]
	ldr r1, _08016408 @ =gBattlescriptCurrInstr
	ldr r0, _0801640C @ =gUnknown_81D894D
	str r0, [r1]
	ldr r1, _08016410 @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _08016414 @ =gBattleResults
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFE
	bhi _080163DA
	adds r0, 0x1
	strb r0, [r1, 0x2]
_080163DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080163E0: .4byte gBattlerAttacker
_080163E4: .4byte gBattlerByTurnOrder
_080163E8: .4byte gCurrentTurnActionNumber
_080163EC: .4byte gBattle_BG0_X
_080163F0: .4byte gBattle_BG0_Y
_080163F4: .4byte gActionSelectionCursor
_080163F8: .4byte gMoveSelectionCursor
_080163FC: .4byte gBattleTextBuff1
_08016400: .4byte gBattleStruct
_08016404: .4byte gBattleScripting
_08016408: .4byte gBattlescriptCurrInstr
_0801640C: .4byte gUnknown_81D894D
_08016410: .4byte gCurrentActionFuncId
_08016414: .4byte gBattleResults
	thumb_func_end sub_8016374

	thumb_func_start sub_8016418
sub_8016418: @ 8016418
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _08016474 @ =gBattlerAttacker
	ldr r2, _08016478 @ =gBattlerTarget
	ldr r1, _0801647C @ =gBattlerByTurnOrder
	ldr r0, _08016480 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r4]
	ldr r0, _08016484 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08016488 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldrb r0, [r4]
	bl ClearFuryCutterDestinyBondGrudge
	ldr r5, _0801648C @ =gLastUsedItem
	ldr r2, _08016490 @ =gBattleBufferB
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	strh r3, [r5]
	adds r1, r3, 0
	cmp r1, 0xC
	bhi _0801649C
	ldr r2, _08016494 @ =gBattlescriptCurrInstr
	ldr r1, _08016498 @ =gUnknown_81D99B0
	ldrh r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	b _080164FC
	.align 2, 0
_08016474: .4byte gBattlerAttacker
_08016478: .4byte gBattlerTarget
_0801647C: .4byte gBattlerByTurnOrder
_08016480: .4byte gCurrentTurnActionNumber
_08016484: .4byte gBattle_BG0_X
_08016488: .4byte gBattle_BG0_Y
_0801648C: .4byte gLastUsedItem
_08016490: .4byte gBattleBufferB
_08016494: .4byte gBattlescriptCurrInstr
_08016498: .4byte gUnknown_81D99B0
_0801649C:
	adds r0, r3, 0
	subs r0, 0x50
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080164C4
	ldr r0, _080164B8 @ =gBattlescriptCurrInstr
	ldr r1, _080164BC @ =gUnknown_81D99FC
	ldr r1, [r1]
	str r1, [r0]
	ldr r1, _080164C0 @ =gCurrentActionFuncId
	mov r10, r1
	b _0801671E
	.align 2, 0
_080164B8: .4byte gBattlescriptCurrInstr
_080164BC: .4byte gUnknown_81D99FC
_080164C0: .4byte gCurrentActionFuncId
_080164C4:
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _080164E8
	ldr r0, _080164DC @ =gBattlescriptCurrInstr
	ldr r1, _080164E0 @ =gUnknown_81D99FC
	ldr r1, [r1, 0x4]
	str r1, [r0]
	ldr r2, _080164E4 @ =gCurrentActionFuncId
	mov r10, r2
	b _0801671E
	.align 2, 0
_080164DC: .4byte gBattlescriptCurrInstr
_080164E0: .4byte gUnknown_81D99FC
_080164E4: .4byte gCurrentActionFuncId
_080164E8:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08016510
	ldr r0, _08016504 @ =gBattlescriptCurrInstr
	ldr r1, _08016508 @ =gUnknown_81D99E4
	ldr r1, [r1]
	str r1, [r0]
_080164FC:
	ldr r0, _0801650C @ =gCurrentActionFuncId
	mov r10, r0
	b _0801671E
	.align 2, 0
_08016504: .4byte gBattlescriptCurrInstr
_08016508: .4byte gUnknown_81D99E4
_0801650C: .4byte gCurrentActionFuncId
_08016510:
	ldr r3, _08016548 @ =gBattleScripting
	ldrb r0, [r4]
	strb r0, [r3, 0x17]
	lsls r0, 24
	lsrs r0, 25
	ldr r2, _0801654C @ =gBattleStruct
	ldr r1, [r2]
	adds r0, r1
	adds r0, 0xC4
	ldrb r0, [r0]
	subs r0, 0x1
	mov r8, r4
	ldr r1, _08016550 @ =gBattlescriptCurrInstr
	mov r9, r1
	ldr r6, _08016554 @ =gUnknown_81D99E4
	mov r12, r3
	adds r7, r2, 0
	ldr r2, _08016558 @ =gCurrentActionFuncId
	mov r10, r2
	cmp r0, 0x4
	bls _0801653C
	b _08016706
_0801653C:
	lsls r0, 2
	ldr r1, _0801655C @ =_08016560
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016548: .4byte gBattleScripting
_0801654C: .4byte gBattleStruct
_08016550: .4byte gBattlescriptCurrInstr
_08016554: .4byte gUnknown_81D99E4
_08016558: .4byte gCurrentActionFuncId
_0801655C: .4byte _08016560
	.align 2, 0
_08016560:
	.4byte _08016706
	.4byte _08016706
	.4byte _08016574
	.4byte _08016608
	.4byte _080166D8
_08016574:
	ldr r5, _080165AC @ =gBattleCommunication
	movs r0, 0
	strb r0, [r5, 0x5]
	ldr r2, _080165B0 @ =gBattlerAttacker
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r1, [r7]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _080165C0
	movs r0, 0x3E
	ands r0, r1
	ldr r1, _080165B4 @ =gBattlescriptCurrInstr
	mov r9, r1
	ldr r6, _080165B8 @ =gUnknown_81D99E4
	ldr r2, _080165BC @ =gCurrentActionFuncId
	mov r10, r2
	cmp r0, 0
	bne _080165A6
	b _08016706
_080165A6:
	movs r0, 0x5
	strb r0, [r5, 0x5]
	b _08016706
	.align 2, 0
_080165AC: .4byte gBattleCommunication
_080165B0: .4byte gBattlerAttacker
_080165B4: .4byte gBattlescriptCurrInstr
_080165B8: .4byte gUnknown_81D99E4
_080165BC: .4byte gCurrentActionFuncId
_080165C0:
	ldr r0, _080165FC @ =gBattlescriptCurrInstr
	mov r9, r0
	ldr r6, _08016600 @ =gUnknown_81D99E4
	ldr r1, _08016604 @ =gCurrentActionFuncId
	mov r10, r1
	mov r4, r8
	adds r3, r7, 0
	adds r2, r5, 0
_080165D0:
	ldrb r1, [r4]
	lsrs r1, 1
	ldr r0, [r3]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	lsrs r0, 1
	strb r0, [r1]
	ldrb r0, [r2, 0x5]
	adds r0, 0x1
	strb r0, [r2, 0x5]
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r1, [r3]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080165D0
	b _08016706
	.align 2, 0
_080165FC: .4byte gBattlescriptCurrInstr
_08016600: .4byte gUnknown_81D99E4
_08016604: .4byte gCurrentActionFuncId
_08016608:
	ldr r3, _0801663C @ =gBattleCommunication
	movs r0, 0x4
	strb r0, [r3, 0x5]
	ldr r2, _08016640 @ =gBattlerAttacker
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r1, [r7]
	adds r0, r1
	adds r6, r0, 0
	adds r6, 0xC6
	ldrb r1, [r6]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r8, r2
	cmp r5, 0
	beq _08016650
	movs r0, 0x5
	strb r0, [r3, 0x5]
	ldr r2, _08016644 @ =gBattlescriptCurrInstr
	mov r9, r2
	ldr r6, _08016648 @ =gUnknown_81D99E4
	ldr r0, _0801664C @ =gCurrentActionFuncId
	mov r10, r0
	b _08016706
	.align 2, 0
_0801663C: .4byte gBattleCommunication
_08016640: .4byte gBattlerAttacker
_08016644: .4byte gBattlescriptCurrInstr
_08016648: .4byte gUnknown_81D99E4
_0801664C: .4byte gCurrentActionFuncId
_08016650:
	ldr r3, _080166C4 @ =gBattleTextBuff1
	movs r4, 0xFD
	strb r4, [r3]
	movs r0, 0x5
	strb r0, [r3, 0x1]
	movs r2, 0x1
	strb r2, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	ldr r1, _080166C8 @ =gBattleTextBuff2
	strb r4, [r1]
	strb r5, [r1, 0x1]
	movs r0, 0xD2
	strb r0, [r1, 0x2]
	strb r5, [r1, 0x3]
	subs r0, 0xD3
	strb r0, [r1, 0x4]
	ldrb r0, [r6]
	ands r2, r0
	ldr r1, _080166CC @ =gBattlescriptCurrInstr
	mov r9, r1
	ldr r6, _080166D0 @ =gUnknown_81D99E4
	ldr r0, _080166D4 @ =gCurrentActionFuncId
	mov r10, r0
	cmp r2, 0
	bne _080166B4
	mov r5, r8
	adds r4, r7, 0
	adds r2, r3, 0
_0801668A:
	ldrb r1, [r5]
	lsrs r1, 1
	ldr r0, [r4]
	adds r1, r0
	adds r1, 0xC6
	ldrb r0, [r1]
	lsrs r0, 1
	strb r0, [r1]
	ldrb r0, [r2, 0x2]
	adds r0, 0x1
	strb r0, [r2, 0x2]
	ldrb r0, [r5]
	lsrs r0, 1
	ldr r1, [r4]
	adds r0, r1
	adds r0, 0xC6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801668A
_080166B4:
	ldrb r0, [r3, 0x2]
	adds r0, 0xE
	movs r1, 0
	mov r2, r12
	strb r0, [r2, 0x10]
	strb r1, [r2, 0x11]
	b _08016706
	.align 2, 0
_080166C4: .4byte gBattleTextBuff1
_080166C8: .4byte gBattleTextBuff2
_080166CC: .4byte gBattlescriptCurrInstr
_080166D0: .4byte gUnknown_81D99E4
_080166D4: .4byte gCurrentActionFuncId
_080166D8:
	ldr r0, _080166EC @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080166F4
	ldr r1, _080166F0 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _080166F8
	.align 2, 0
_080166EC: .4byte gBattleTypeFlags
_080166F0: .4byte gBattleCommunication
_080166F4:
	ldr r0, _08016734 @ =gBattleCommunication
	strb r1, [r0, 0x5]
_080166F8:
	ldr r0, _08016738 @ =gBattlerAttacker
	mov r8, r0
	ldr r1, _0801673C @ =gBattlescriptCurrInstr
	mov r9, r1
	ldr r6, _08016740 @ =gUnknown_81D99E4
	ldr r2, _08016744 @ =gCurrentActionFuncId
	mov r10, r2
_08016706:
	mov r1, r8
	ldrb r0, [r1]
	lsrs r0, 1
	ldr r1, [r7]
	adds r0, r1
	adds r0, 0xC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	mov r2, r9
	str r0, [r2]
_0801671E:
	movs r0, 0xA
	mov r1, r10
	strb r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016734: .4byte gBattleCommunication
_08016738: .4byte gBattlerAttacker
_0801673C: .4byte gBattlescriptCurrInstr
_08016740: .4byte gUnknown_81D99E4
_08016744: .4byte gCurrentActionFuncId
	thumb_func_end sub_8016418

	thumb_func_start TryRunFromBattle
TryRunFromBattle: @ 8016748
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r6, 0
	ldr r1, _0801676C @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08016774
	ldr r1, _08016770 @ =gEnigmaBerries
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x7]
	b _0801677E
	.align 2, 0
_0801676C: .4byte gBattleMons
_08016770: .4byte gEnigmaBerries
_08016774:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r1, r0, 24
_0801677E:
	ldr r0, _080167AC @ =gPotentialItemEffectBattler
	strb r4, [r0]
	cmp r1, 0x25
	bne _080167BC
	ldr r2, _080167B0 @ =gLastUsedItem
	ldr r1, _080167B4 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r2]
	ldr r0, _080167B8 @ =gProtectStructs
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x1]
	b _08016816
	.align 2, 0
_080167AC: .4byte gPotentialItemEffectBattler
_080167B0: .4byte gLastUsedItem
_080167B4: .4byte gBattleMons
_080167B8: .4byte gProtectStructs
_080167BC:
	ldr r7, _080167EC @ =gBattleMons
	movs r2, 0x58
	adds r0, r4, 0
	muls r0, r2
	adds r5, r0, r7
	adds r0, r5, 0
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x32
	bne _080167F8
	ldr r0, _080167F0 @ =gLastUsedAbility
	strb r1, [r0]
	ldr r0, _080167F4 @ =gProtectStructs
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0x1]
	b _08016816
	.align 2, 0
_080167EC: .4byte gBattleMons
_080167F0: .4byte gLastUsedAbility
_080167F4: .4byte gProtectStructs
_080167F8:
	ldr r0, _08016820 @ =gBattleTypeFlags
	ldr r3, [r0]
	movs r0, 0xA0
	lsls r0, 8
	ands r0, r3
	movs r1, 0x80
	lsls r1, 8
	cmp r0, r1
	bne _08016824
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0801687A
_08016816:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _0801687A
	.align 2, 0
_08016820: .4byte gBattleTypeFlags
_08016824:
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	bne _0801686E
	movs r1, 0x1
	adds r0, r4, 0
	eors r0, r1
	muls r0, r2
	adds r2, r0, r7
	ldrh r0, [r5, 0x6]
	ldrh r1, [r2, 0x6]
	cmp r0, r1
	bcs _08016868
	lsls r0, 7
	ldrh r1, [r2, 0x6]
	bl __divsi3
	adds r4, r0, 0
	ldr r0, _08016894 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x6C
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 1
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	movs r1, 0xFF
	ands r1, r0
	cmp r4, r1
	bls _0801686E
_08016868:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0801686E:
	ldr r0, _08016894 @ =gBattleStruct
	ldr r1, [r0]
	adds r1, 0x6C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0801687A:
	cmp r6, 0
	beq _0801688C
	ldr r1, _08016898 @ =gCurrentTurnActionNumber
	ldr r0, _0801689C @ =gBattlersCount
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080168A0 @ =gBattleOutcome
	movs r0, 0x4
	strb r0, [r1]
_0801688C:
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08016894: .4byte gBattleStruct
_08016898: .4byte gCurrentTurnActionNumber
_0801689C: .4byte gBattlersCount
_080168A0: .4byte gBattleOutcome
	thumb_func_end TryRunFromBattle

	thumb_func_start sub_80168A4
sub_80168A4: @ 80168A4
	push {r4-r6,lr}
	ldr r4, _080168F4 @ =gBattlerAttacker
	ldr r1, _080168F8 @ =gBattlerByTurnOrder
	ldr r5, _080168FC @ =gCurrentTurnActionNumber
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _08016900 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801694C
	ldr r0, _08016904 @ =gBattlersCount
	ldrb r1, [r0]
	strb r1, [r5]
	ldr r2, _08016908 @ =gActiveBattler
	movs r0, 0
	strb r0, [r2]
	lsls r1, 24
	cmp r1, 0
	beq _08016938
	adds r4, r2, 0
	ldr r6, _0801690C @ =gChosenActionByBattler
	ldr r5, _08016910 @ =gBattleOutcome
_080168D8:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08016914
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08016926
	ldrb r0, [r5]
	movs r1, 0x2
	b _08016922
	.align 2, 0
_080168F4: .4byte gBattlerAttacker
_080168F8: .4byte gBattlerByTurnOrder
_080168FC: .4byte gCurrentTurnActionNumber
_08016900: .4byte gBattleTypeFlags
_08016904: .4byte gBattlersCount
_08016908: .4byte gActiveBattler
_0801690C: .4byte gChosenActionByBattler
_08016910: .4byte gBattleOutcome
_08016914:
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08016926
	ldrb r0, [r5]
	movs r1, 0x1
_08016922:
	orrs r0, r1
	strb r0, [r5]
_08016926:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08016944 @ =gBattlersCount
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080168D8
_08016938:
	ldr r0, _08016948 @ =gBattleOutcome
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _080169D8
	.align 2, 0
_08016944: .4byte gBattlersCount
_08016948: .4byte gBattleOutcome
_0801694C:
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0801698C
	ldrb r0, [r4]
	bl TryRunFromBattle
	lsls r0, 24
	cmp r0, 0
	bne _080169D8
	ldrb r0, [r4]
	bl ClearFuryCutterDestinyBondGrudge
	ldr r1, _0801697C @ =gBattleCommunication
	movs r0, 0x3
	strb r0, [r1, 0x5]
	ldr r1, _08016980 @ =gBattlescriptCurrInstr
	ldr r0, _08016984 @ =gUnknown_81D893A
	str r0, [r1]
	ldr r1, _08016988 @ =gCurrentActionFuncId
	movs r0, 0xA
	b _080169D6
	.align 2, 0
_0801697C: .4byte gBattleCommunication
_08016980: .4byte gBattlescriptCurrInstr
_08016984: .4byte gUnknown_81D893A
_08016988: .4byte gCurrentActionFuncId
_0801698C:
	ldr r1, _080169B4 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080169B8 @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	beq _080169CC
	ldr r1, _080169BC @ =gBattleCommunication
	movs r0, 0x4
	strb r0, [r1, 0x5]
	ldr r1, _080169C0 @ =gBattlescriptCurrInstr
	ldr r0, _080169C4 @ =gUnknown_81D893A
	str r0, [r1]
	ldr r1, _080169C8 @ =gCurrentActionFuncId
	movs r0, 0xA
	b _080169D6
	.align 2, 0
_080169B4: .4byte gBattleMons
_080169B8: .4byte 0x0400e000
_080169BC: .4byte gBattleCommunication
_080169C0: .4byte gBattlescriptCurrInstr
_080169C4: .4byte gUnknown_81D893A
_080169C8: .4byte gCurrentActionFuncId
_080169CC:
	ldr r0, _080169E0 @ =gBattlersCount
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r1, _080169E4 @ =gBattleOutcome
	movs r0, 0x6
_080169D6:
	strb r0, [r1]
_080169D8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080169E0: .4byte gBattlersCount
_080169E4: .4byte gBattleOutcome
	thumb_func_end sub_80168A4

	thumb_func_start sub_80169E8
sub_80169E8: @ 80169E8
	push {r4,r5,lr}
	ldr r2, _08016A44 @ =gBattlerAttacker
	ldr r1, _08016A48 @ =gBattlerByTurnOrder
	ldr r0, _08016A4C @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08016A50 @ =gBattle_BG0_X
	movs r5, 0
	strh r5, [r0]
	ldr r0, _08016A54 @ =gBattle_BG0_Y
	strh r5, [r0]
	ldr r4, _08016A58 @ =gBattleStruct
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0x79
	ldrb r0, [r2]
	cmp r0, 0
	beq _08016A74
	subs r0, 0x1
	strb r0, [r2]
	ldr r0, [r4]
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0
	bne _08016A68
	ldr r0, _08016A5C @ =gEnemyParty
	movs r1, 0xB
	bl GetMonData
	ldr r4, [r4]
	adds r4, 0x7C
	ldr r2, _08016A60 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x8]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08016A64 @ =0x000004fb
	bl __divsi3
	strb r0, [r4]
	b _08016A98
	.align 2, 0
_08016A44: .4byte gBattlerAttacker
_08016A48: .4byte gBattlerByTurnOrder
_08016A4C: .4byte gCurrentTurnActionNumber
_08016A50: .4byte gBattle_BG0_X
_08016A54: .4byte gBattle_BG0_Y
_08016A58: .4byte gBattleStruct
_08016A5C: .4byte gEnemyParty
_08016A60: .4byte gBaseStats
_08016A64: .4byte 0x000004fb
_08016A68:
	ldr r1, _08016A70 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08016A9C
	.align 2, 0
_08016A70: .4byte gBattleCommunication
_08016A74:
	adds r1, 0x7A
	ldrb r0, [r1]
	cmp r0, 0
	beq _08016A98
	subs r0, 0x1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x7A
	ldrb r0, [r0]
	cmp r0, 0
	beq _08016A98
	ldr r1, _08016A94 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _08016A9C
	.align 2, 0
_08016A94: .4byte gBattleCommunication
_08016A98:
	ldr r0, _08016AB0 @ =gBattleCommunication
	strb r5, [r0, 0x5]
_08016A9C:
	ldr r1, _08016AB4 @ =gBattlescriptCurrInstr
	ldr r0, _08016AB8 @ =gUnknown_81D9A04
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08016ABC @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016AB0: .4byte gBattleCommunication
_08016AB4: .4byte gBattlescriptCurrInstr
_08016AB8: .4byte gUnknown_81D9A04
_08016ABC: .4byte gCurrentActionFuncId
	thumb_func_end sub_80169E8

	thumb_func_start sub_8016AC0
sub_8016AC0: @ 8016AC0
	ldr r2, _08016AF8 @ =gBattlerAttacker
	ldr r1, _08016AFC @ =gBattlerByTurnOrder
	ldr r0, _08016B00 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08016B04 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08016B08 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r1, _08016B0C @ =gNumSafariBalls
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	ldr r1, _08016B10 @ =gLastUsedItem
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _08016B14 @ =gBattlescriptCurrInstr
	ldr r0, _08016B18 @ =gUnknown_81D99B0
	ldr r0, [r0, 0x14]
	str r0, [r1]
	ldr r1, _08016B1C @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	bx lr
	.align 2, 0
_08016AF8: .4byte gBattlerAttacker
_08016AFC: .4byte gBattlerByTurnOrder
_08016B00: .4byte gCurrentTurnActionNumber
_08016B04: .4byte gBattle_BG0_X
_08016B08: .4byte gBattle_BG0_Y
_08016B0C: .4byte gNumSafariBalls
_08016B10: .4byte gLastUsedItem
_08016B14: .4byte gBattlescriptCurrInstr
_08016B18: .4byte gUnknown_81D99B0
_08016B1C: .4byte gCurrentActionFuncId
	thumb_func_end sub_8016AC0

	thumb_func_start sub_8016B20
sub_8016B20: @ 8016B20
	push {r4-r7,lr}
	ldr r2, _08016B9C @ =gBattlerAttacker
	ldr r1, _08016BA0 @ =gBattlerByTurnOrder
	ldr r0, _08016BA4 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08016BA8 @ =gBattle_BG0_X
	movs r7, 0
	strh r7, [r0]
	ldr r0, _08016BAC @ =gBattle_BG0_Y
	strh r7, [r0]
	bl Random
	ldr r6, _08016BB0 @ =gBattleStruct
	ldr r5, [r6]
	adds r5, 0x7A
	ldrb r4, [r5]
	adds r4, 0x2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	adds r0, r4
	strb r0, [r5]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x7A
	ldrb r0, [r1]
	cmp r0, 0x6
	bls _08016B66
	movs r0, 0x6
	strb r0, [r1]
_08016B66:
	ldr r0, [r6]
	adds r0, 0x79
	strb r7, [r0]
	ldr r1, [r6]
	adds r1, 0x7C
	ldrb r0, [r1]
	lsrs r0, 1
	strb r0, [r1]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x7C
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08016B86
	movs r0, 0x3
	strb r0, [r1]
_08016B86:
	ldr r1, _08016BB4 @ =gBattlescriptCurrInstr
	ldr r0, _08016BB8 @ =gUnknown_81D9A04
	ldr r0, [r0, 0x8]
	str r0, [r1]
	ldr r1, _08016BBC @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016B9C: .4byte gBattlerAttacker
_08016BA0: .4byte gBattlerByTurnOrder
_08016BA4: .4byte gCurrentTurnActionNumber
_08016BA8: .4byte gBattle_BG0_X
_08016BAC: .4byte gBattle_BG0_Y
_08016BB0: .4byte gBattleStruct
_08016BB4: .4byte gBattlescriptCurrInstr
_08016BB8: .4byte gUnknown_81D9A04
_08016BBC: .4byte gCurrentActionFuncId
	thumb_func_end sub_8016B20

	thumb_func_start sub_8016BC0
sub_8016BC0: @ 8016BC0
	push {r4-r7,lr}
	ldr r2, _08016C3C @ =gBattlerAttacker
	ldr r1, _08016C40 @ =gBattlerByTurnOrder
	ldr r0, _08016C44 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08016C48 @ =gBattle_BG0_X
	movs r7, 0
	strh r7, [r0]
	ldr r0, _08016C4C @ =gBattle_BG0_Y
	strh r7, [r0]
	bl Random
	ldr r6, _08016C50 @ =gBattleStruct
	ldr r5, [r6]
	adds r5, 0x79
	ldrb r4, [r5]
	adds r4, 0x2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	adds r0, r4
	strb r0, [r5]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x79
	ldrb r0, [r1]
	cmp r0, 0x6
	bls _08016C06
	movs r0, 0x6
	strb r0, [r1]
_08016C06:
	ldr r0, [r6]
	adds r0, 0x7A
	strb r7, [r0]
	ldr r1, [r6]
	adds r1, 0x7C
	ldrb r0, [r1]
	lsls r0, 1
	strb r0, [r1]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x7C
	ldrb r0, [r1]
	cmp r0, 0x14
	bls _08016C26
	movs r0, 0x14
	strb r0, [r1]
_08016C26:
	ldr r1, _08016C54 @ =gBattlescriptCurrInstr
	ldr r0, _08016C58 @ =gUnknown_81D9A04
	ldr r0, [r0, 0x4]
	str r0, [r1]
	ldr r1, _08016C5C @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016C3C: .4byte gBattlerAttacker
_08016C40: .4byte gBattlerByTurnOrder
_08016C44: .4byte gCurrentTurnActionNumber
_08016C48: .4byte gBattle_BG0_X
_08016C4C: .4byte gBattle_BG0_Y
_08016C50: .4byte gBattleStruct
_08016C54: .4byte gBattlescriptCurrInstr
_08016C58: .4byte gUnknown_81D9A04
_08016C5C: .4byte gCurrentActionFuncId
	thumb_func_end sub_8016BC0

	thumb_func_start HandleAction_SafriZoneRun
HandleAction_SafriZoneRun: @ 8016C60
	push {r4,lr}
	ldr r2, _08016C88 @ =gBattlerAttacker
	ldr r1, _08016C8C @ =gBattlerByTurnOrder
	ldr r4, _08016C90 @ =gCurrentTurnActionNumber
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x11
	bl PlaySE
	ldr r0, _08016C94 @ =gBattlersCount
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _08016C98 @ =gBattleOutcome
	movs r0, 0x4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016C88: .4byte gBattlerAttacker
_08016C8C: .4byte gBattlerByTurnOrder
_08016C90: .4byte gCurrentTurnActionNumber
_08016C94: .4byte gBattlersCount
_08016C98: .4byte gBattleOutcome
	thumb_func_end HandleAction_SafriZoneRun

	thumb_func_start HandleAction_Action9
HandleAction_Action9: @ 8016C9C
	ldr r3, _08016CE8 @ =gBattlerAttacker
	ldr r1, _08016CEC @ =gBattlerByTurnOrder
	ldr r0, _08016CF0 @ =gCurrentTurnActionNumber
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	strb r2, [r3]
	ldr r0, _08016CF4 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08016CF8 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r1, _08016CFC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	ldr r2, _08016D00 @ =gBattlerPartyIndexes
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08016D04 @ =gBattlescriptCurrInstr
	ldr r0, _08016D08 @ =gUnknown_81D9A04
	ldr r0, [r0, 0xC]
	str r0, [r1]
	ldr r1, _08016D0C @ =gCurrentActionFuncId
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _08016D10 @ =gActionsByTurnOrder
	movs r0, 0xC
	strb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_08016CE8: .4byte gBattlerAttacker
_08016CEC: .4byte gBattlerByTurnOrder
_08016CF0: .4byte gCurrentTurnActionNumber
_08016CF4: .4byte gBattle_BG0_X
_08016CF8: .4byte gBattle_BG0_Y
_08016CFC: .4byte gBattleTextBuff1
_08016D00: .4byte gBattlerPartyIndexes
_08016D04: .4byte gBattlescriptCurrInstr
_08016D08: .4byte gUnknown_81D9A04
_08016D0C: .4byte gCurrentActionFuncId
_08016D10: .4byte gActionsByTurnOrder
	thumb_func_end HandleAction_Action9

	thumb_func_start HandleAction_Action11
HandleAction_Action11: @ 8016D14
	push {lr}
	bl HandleFaintedMonActions
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08016D30
	ldr r0, _08016D34 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x4D
	strb r1, [r0]
	ldr r1, _08016D38 @ =gCurrentActionFuncId
	movs r0, 0xC
	strb r0, [r1]
_08016D30:
	pop {r0}
	bx r0
	.align 2, 0
_08016D34: .4byte gBattleStruct
_08016D38: .4byte gCurrentActionFuncId
	thumb_func_end HandleAction_Action11

	thumb_func_start HandleAction_NothingIsFainted
HandleAction_NothingIsFainted: @ 8016D3C
	ldr r1, _08016D5C @ =gCurrentTurnActionNumber
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _08016D60 @ =gCurrentActionFuncId
	ldr r2, _08016D64 @ =gActionsByTurnOrder
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r2, _08016D68 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08016D6C @ =0xf1e892af
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_08016D5C: .4byte gCurrentTurnActionNumber
_08016D60: .4byte gCurrentActionFuncId
_08016D64: .4byte gActionsByTurnOrder
_08016D68: .4byte gHitMarker
_08016D6C: .4byte 0xf1e892af
	thumb_func_end HandleAction_NothingIsFainted

	thumb_func_start HandleAction_ActionFinished
HandleAction_ActionFinished: @ 8016D70
	push {r4,r5,lr}
	ldr r1, _08016DE4 @ =gCurrentTurnActionNumber
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _08016DE8 @ =gCurrentActionFuncId
	ldr r2, _08016DEC @ =gActionsByTurnOrder
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	bl SpecialStatusesClear
	ldr r2, _08016DF0 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08016DF4 @ =0xf1e892af
	ands r0, r1
	str r0, [r2]
	ldr r0, _08016DF8 @ =gCurrentMove
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08016DFC @ =gBattleMoveDamage
	movs r4, 0
	str r4, [r0]
	ldr r0, _08016E00 @ =gMoveResultFlags
	strb r1, [r0]
	ldr r5, _08016E04 @ =gBattleScripting
	strb r1, [r5, 0x18]
	strb r1, [r5, 0x19]
	ldr r2, _08016E08 @ =gLastLandedMoves
	ldr r3, _08016E0C @ =gBattlerAttacker
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	strh r4, [r0]
	ldr r2, _08016E10 @ =gLastHitByType
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	strh r4, [r0]
	ldr r0, _08016E14 @ =gBattleStruct
	ldr r0, [r0]
	strb r1, [r0, 0x13]
	ldr r0, _08016E18 @ =gDynamicBasePower
	strh r4, [r0]
	strb r1, [r5, 0x14]
	ldr r0, _08016E1C @ =gBattleCommunication
	strb r1, [r0, 0x3]
	strb r1, [r0, 0x4]
	strb r1, [r5, 0x16]
	ldr r0, _08016E20 @ =gBattleResources
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	adds r0, 0x20
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016DE4: .4byte gCurrentTurnActionNumber
_08016DE8: .4byte gCurrentActionFuncId
_08016DEC: .4byte gActionsByTurnOrder
_08016DF0: .4byte gHitMarker
_08016DF4: .4byte 0xf1e892af
_08016DF8: .4byte gCurrentMove
_08016DFC: .4byte gBattleMoveDamage
_08016E00: .4byte gMoveResultFlags
_08016E04: .4byte gBattleScripting
_08016E08: .4byte gLastLandedMoves
_08016E0C: .4byte gBattlerAttacker
_08016E10: .4byte gLastHitByType
_08016E14: .4byte gBattleStruct
_08016E18: .4byte gDynamicBasePower
_08016E1C: .4byte gBattleCommunication
_08016E20: .4byte gBattleResources
	thumb_func_end HandleAction_ActionFinished

	.align 2, 0 @ Don't pad with nop.
