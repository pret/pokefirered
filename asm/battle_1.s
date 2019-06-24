	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_800F1E8
sub_800F1E8: @ 800F1E8
	push {lr}
	bl ResetSpriteData
	ldr r0, _0800F21C @ =gUnknown_824EFF0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800F220 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0800F224 @ =sub_800F228
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0800F21C: .4byte gUnknown_824EFF0
_0800F220: .4byte gSprites
_0800F224: .4byte sub_800F228
	thumb_func_end sub_800F1E8

	thumb_func_start sub_800F228
sub_800F228: @ 800F228
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_800F228

	thumb_func_start sub_800F238
sub_800F238: @ 800F238
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	ldr r1, _0800F24C @ =gUnknown_824EFC4
_0800F242:
	ldrb r3, [r1]
	cmp r0, r3
	bne _0800F250
	ldrb r0, [r1, 0x1]
	b _0800F25A
	.align 2, 0
_0800F24C: .4byte gUnknown_824EFC4
_0800F250:
	adds r1, 0x4
	adds r2, 0x1
	cmp r2, 0x7
	bls _0800F242
	movs r0, 0x9
_0800F25A:
	pop {r1}
	bx r1
	thumb_func_end sub_800F238

	thumb_func_start sub_800F260
sub_800F260: @ 800F260
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x13
	bls _0800F26C
	movs r0, 0x9
_0800F26C:
	ldr r5, _0800F2A0 @ =gUnknown_824EE34
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r1, _0800F2A4 @ =0x06008000
	bl LZDecompressVram
	adds r0, r5, 0x4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _0800F2A8 @ =0x0600d000
	bl LZDecompressVram
	adds r5, 0x10
	adds r4, r5
	ldr r0, [r4]
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F2A0: .4byte gUnknown_824EE34
_0800F2A4: .4byte 0x06008000
_0800F2A8: .4byte 0x0600d000
	thumb_func_end sub_800F260

	thumb_func_start sub_800F2AC
sub_800F2AC: @ 800F2AC
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x13
	bls _0800F2B8
	movs r0, 0x9
_0800F2B8:
	ldr r5, _0800F2E0 @ =gUnknown_824EE34
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 2
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _0800F2E4 @ =0x06004000
	bl LZDecompressVram
	adds r5, 0xC
	adds r4, r5
	ldr r0, [r4]
	ldr r1, _0800F2E8 @ =0x0600e000
	bl LZDecompressVram
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F2E0: .4byte gUnknown_824EE34
_0800F2E4: .4byte 0x06004000
_0800F2E8: .4byte 0x0600e000
	thumb_func_end sub_800F2AC

	thumb_func_start sub_800F2EC
sub_800F2EC: @ 800F2EC
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _0800F2FC
	movs r0, 0x9
_0800F2FC:
	ldr r2, _0800F320 @ =gUnknown_824EE34
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r0, r1, r2
	ldr r0, [r0]
	str r0, [r4]
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r5]
	adds r2, 0x10
	adds r1, r2
	ldr r0, [r1]
	str r0, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F320: .4byte gUnknown_824EE34
	thumb_func_end sub_800F2EC

	thumb_func_start sub_800F324
sub_800F324: @ 800F324
	push {lr}
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0800F344 @ =gUnknown_8248320
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	ldr r0, _0800F348 @ =gUnknown_8248330
	bl InitWindows
	bl DeactivateAllTextPrinters
	pop {r0}
	bx r0
	.align 2, 0
_0800F344: .4byte gUnknown_8248320
_0800F348: .4byte gUnknown_8248330
	thumb_func_end sub_800F324

	thumb_func_start sub_800F34C
sub_800F34C: @ 800F34C
	push {lr}
	movs r0, 0xC5
	bl EnableInterrupts
	bl sub_800F324
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r1, _0800F37C @ =0x0000b040
	movs r0, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0800F37C: .4byte 0x0000b040
	thumb_func_end sub_800F34C

	thumb_func_start sub_800F380
sub_800F380: @ 800F380
	push {r4,r5,lr}
	movs r0, 0x2
	movs r1, 0x12
	movs r2, 0x10
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0x2
	movs r1, 0x22
	movs r2, 0x10
	bl TextWindow_SetUserSelectedFrame
	ldr r4, _0800F3F0 @ =gPlttBufferUnfaded
	adds r0, r4, 0
	adds r0, 0xB8
	ldr r1, _0800F3F4 @ =0x00002529
	strh r1, [r0]
	adds r2, r4, 0
	adds r2, 0xBA
	strh r1, [r2]
	adds r2, 0x2
	ldr r1, _0800F3F8 @ =0x00007fff
	strh r1, [r2]
	adds r2, 0x2
	ldr r1, _0800F3FC @ =0x0000675a
	strh r1, [r2]
	ldr r5, _0800F400 @ =gPlttBufferFaded + 0xB8
	adds r1, r5, 0
	movs r2, 0x4
	bl CpuSet
	ldr r0, _0800F404 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _0800F408 @ =0x00010010
	ands r0, r1
	cmp r0, 0
	beq _0800F3EA
	movs r0, 0x70
	bl Menu_LoadStdPalAt
	movs r0, 0
	movs r1, 0x30
	movs r2, 0x70
	bl TextWindow_LoadResourcesStdFrame0
	adds r0, r4, 0
	adds r0, 0xEC
	movs r1, 0
	strh r1, [r0]
	adds r1, r5, 0
	adds r1, 0x34
	movs r2, 0x1
	bl CpuSet
_0800F3EA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F3F0: .4byte gPlttBufferUnfaded
_0800F3F4: .4byte 0x00002529
_0800F3F8: .4byte 0x00007fff
_0800F3FC: .4byte 0x0000675a
_0800F400: .4byte gPlttBufferFaded + 0xB8
_0800F404: .4byte gBattleTypeFlags
_0800F408: .4byte 0x00010010
	thumb_func_end sub_800F380

	thumb_func_start sub_800F40C
sub_800F40C: @ 800F40C
	push {lr}
	bl sub_800FC2C
	lsls r0, 24
	lsrs r0, 24
	bl sub_800F260
	pop {r0}
	bx r0
	thumb_func_end sub_800F40C

	thumb_func_start LoadBattleTextboxAndBackground
LoadBattleTextboxAndBackground: @ 800F420
	push {lr}
	ldr r0, _0800F454 @ =gBattleTextboxTiles
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r1, _0800F458 @ =gFile_graphics_interface_menu_map_tilemap
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _0800F45C @ =gBattleTextboxPalette
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	bl sub_800F380
	bl sub_800F40C
	pop {r0}
	bx r0
	.align 2, 0
_0800F454: .4byte gBattleTextboxTiles
_0800F458: .4byte gFile_graphics_interface_menu_map_tilemap
_0800F45C: .4byte gBattleTextboxPalette
	thumb_func_end LoadBattleTextboxAndBackground

	thumb_func_start sub_800F460
sub_800F460: @ 800F460
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	ldr r4, [sp, 0x34]
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, r6, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	movs r4, 0
	ldr r0, _0800F4B8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800F548
	ldr r0, _0800F4BC @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0800F4D2
	cmp r5, 0x1
	beq _0800F4FA
	cmp r5, 0x1
	bgt _0800F4C0
	cmp r5, 0
	beq _0800F4CA
	b _0800F504
	.align 2, 0
_0800F4B8: .4byte gBattleTypeFlags
_0800F4BC: .4byte gTasks
_0800F4C0:
	cmp r5, 0x2
	beq _0800F4CE
	cmp r5, 0x3
	beq _0800F4EE
	b _0800F504
_0800F4CA:
	ldrh r0, [r1, 0xE]
	b _0800F4F0
_0800F4CE:
	ldrh r1, [r1, 0xE]
	b _0800F4FC
_0800F4D2:
	cmp r5, 0x1
	beq _0800F4EE
	cmp r5, 0x1
	bgt _0800F4E0
	cmp r5, 0
	beq _0800F4EA
	b _0800F504
_0800F4E0:
	cmp r5, 0x2
	beq _0800F4F6
	cmp r5, 0x3
	beq _0800F4FA
	b _0800F504
_0800F4EA:
	ldrh r0, [r1, 0xE]
	b _0800F4F0
_0800F4EE:
	ldrh r0, [r1, 0x10]
_0800F4F0:
	movs r4, 0x3F
	ands r4, r0
	b _0800F504
_0800F4F6:
	ldrh r1, [r1, 0xE]
	b _0800F4FC
_0800F4FA:
	ldrh r1, [r1, 0x10]
_0800F4FC:
	movs r0, 0xFC
	lsls r0, 4
	ands r0, r1
	lsrs r4, r0, 6
_0800F504:
	movs r2, 0
	movs r6, 0x3
	ldr r0, _0800F544 @ =0x00006001
	adds r5, r0, 0
	add r3, sp, 0xC
_0800F50E:
	lsls r1, r2, 1
	adds r0, r6, 0
	lsls r0, r1
	ands r0, r4
	asrs r0, r1
	adds r0, r5
	strh r0, [r3]
	adds r3, 0x2
	adds r2, 0x1
	cmp r2, 0x2
	ble _0800F50E
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	mov r0, r8
	add r1, sp, 0xC
	mov r2, r12
	mov r3, r9
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r0, r8
	bl CopyBgTilemapBufferToVram
	b _0800F5B6
	.align 2, 0
_0800F544: .4byte 0x00006001
_0800F548:
	ldr r0, _0800F564 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r0, [r0]
	cmp r5, r0
	bne _0800F56C
	ldr r1, _0800F568 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldrh r4, [r0, 0xE]
	b _0800F578
	.align 2, 0
_0800F564: .4byte gBattleStruct
_0800F568: .4byte gTasks
_0800F56C:
	ldr r1, _0800F5C4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r4, [r0, 0x10]
_0800F578:
	movs r2, 0
	movs r6, 0x3
	ldr r0, _0800F5C8 @ =0x00006001
	adds r5, r0, 0
	add r3, sp, 0xC
_0800F582:
	lsls r1, r2, 1
	adds r0, r6, 0
	lsls r0, r1
	ands r0, r4
	asrs r0, r1
	adds r0, r5
	strh r0, [r3]
	adds r3, 0x2
	adds r2, 0x1
	cmp r2, 0x5
	ble _0800F582
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	mov r0, r8
	add r1, sp, 0xC
	mov r2, r12
	mov r3, r9
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r0, r8
	bl CopyBgTilemapBufferToVram
_0800F5B6:
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F5C4: .4byte gTasks
_0800F5C8: .4byte 0x00006001
	thumb_func_end sub_800F460

	thumb_func_start sub_800F5CC
sub_800F5CC: @ 800F5CC
	push {lr}
	ldr r0, _0800F5E0 @ =gBattleOutcome
	ldrb r2, [r0]
	cmp r2, 0x3
	bne _0800F5E8
	ldr r0, _0800F5E4 @ =gUnknown_83FE883
	movs r1, 0x15
	bl sub_80D87BC
	b _0800F6F0
	.align 2, 0
_0800F5E0: .4byte gBattleOutcome
_0800F5E4: .4byte gUnknown_83FE883
_0800F5E8:
	ldr r0, _0800F61C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800F666
	cmp r2, 0x1
	bne _0800F632
	ldr r2, _0800F620 @ =gLinkPlayers
	ldr r0, _0800F624 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x18]
	cmp r0, 0x1
	beq _0800F682
	cmp r0, 0x1
	bgt _0800F628
	cmp r0, 0
	beq _0800F6BC
	b _0800F6F0
	.align 2, 0
_0800F61C: .4byte gBattleTypeFlags
_0800F620: .4byte gLinkPlayers
_0800F624: .4byte gBattleStruct
_0800F628:
	cmp r0, 0x2
	beq _0800F6BC
	cmp r0, 0x3
	bne _0800F6F0
	b _0800F682
_0800F632:
	ldr r2, _0800F654 @ =gLinkPlayers
	ldr r0, _0800F658 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x18]
	cmp r0, 0x1
	beq _0800F6BC
	cmp r0, 0x1
	bgt _0800F65C
	cmp r0, 0
	beq _0800F682
	b _0800F6F0
	.align 2, 0
_0800F654: .4byte gLinkPlayers
_0800F658: .4byte gBattleStruct
_0800F65C:
	cmp r0, 0x2
	beq _0800F682
	cmp r0, 0x3
	bne _0800F6F0
	b _0800F6BC
_0800F666:
	cmp r2, 0x1
	bne _0800F6A4
	ldr r2, _0800F694 @ =gLinkPlayers
	ldr r0, _0800F698 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x18]
	cmp r0, 0
	beq _0800F6BC
_0800F682:
	ldr r0, _0800F69C @ =gUnknown_83FE874
	movs r1, 0x17
	bl sub_80D87BC
	ldr r0, _0800F6A0 @ =gUnknown_83FE87B
	movs r1, 0x16
	bl sub_80D87BC
	b _0800F6F0
	.align 2, 0
_0800F694: .4byte gLinkPlayers
_0800F698: .4byte gBattleStruct
_0800F69C: .4byte gUnknown_83FE874
_0800F6A0: .4byte gUnknown_83FE87B
_0800F6A4:
	ldr r2, _0800F6D0 @ =gLinkPlayers
	ldr r0, _0800F6D4 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x18]
	cmp r0, 0
	beq _0800F6E0
_0800F6BC:
	ldr r0, _0800F6D8 @ =gUnknown_83FE874
	movs r1, 0x16
	bl sub_80D87BC
	ldr r0, _0800F6DC @ =gUnknown_83FE87B
	movs r1, 0x17
	bl sub_80D87BC
	b _0800F6F0
	.align 2, 0
_0800F6D0: .4byte gLinkPlayers
_0800F6D4: .4byte gBattleStruct
_0800F6D8: .4byte gUnknown_83FE874
_0800F6DC: .4byte gUnknown_83FE87B
_0800F6E0:
	ldr r0, _0800F6F4 @ =gUnknown_83FE874
	movs r1, 0x17
	bl sub_80D87BC
	ldr r0, _0800F6F8 @ =gUnknown_83FE87B
	movs r1, 0x16
	bl sub_80D87BC
_0800F6F0:
	pop {r0}
	bx r0
	.align 2, 0
_0800F6F4: .4byte gUnknown_83FE874
_0800F6F8: .4byte gUnknown_83FE87B
	thumb_func_end sub_800F5CC

	thumb_func_start sub_800F6FC
sub_800F6FC: @ 800F6FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _0800F728 @ =gTasks
	lsls r0, r7, 2
	mov r8, r0
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _0800F71E
	b _0800F850
_0800F71E:
	cmp r0, 0x1
	bgt _0800F72C
	cmp r0, 0
	beq _0800F734
	b _0800FAC4
	.align 2, 0
_0800F728: .4byte gTasks
_0800F72C:
	cmp r0, 0x2
	bne _0800F732
	b _0800F8F0
_0800F732:
	b _0800FAC4
_0800F734:
	ldr r0, _0800F75C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800F7CC
	movs r5, 0
	movs r6, 0x3
_0800F744:
	ldr r0, _0800F760 @ =gLinkPlayers + 8
	adds r1, r5, r0
	subs r0, 0x8
	adds r4, r5, r0
	ldrh r0, [r4, 0x18]
	cmp r0, 0x1
	beq _0800F77C
	cmp r0, 0x1
	bgt _0800F764
	cmp r0, 0
	beq _0800F76E
	b _0800F7C2
	.align 2, 0
_0800F75C: .4byte gBattleTypeFlags
_0800F760: .4byte gLinkPlayers + 8
_0800F764:
	cmp r0, 0x2
	beq _0800F790
	cmp r0, 0x3
	beq _0800F7AA
	b _0800F7C2
_0800F76E:
	adds r0, r1, 0
	movs r1, 0x11
	bl sub_80D87BC
	ldrb r1, [r4, 0x18]
	movs r0, 0x4
	b _0800F79C
_0800F77C:
	adds r0, r1, 0
	movs r1, 0x12
	bl sub_80D87BC
	ldrb r1, [r4, 0x18]
	movs r0, 0x4
	str r0, [sp]
	adds r0, r7, 0
	movs r2, 0x2
	b _0800F7A2
_0800F790:
	adds r0, r1, 0
	movs r1, 0x13
	bl sub_80D87BC
	ldrb r1, [r4, 0x18]
	movs r0, 0x8
_0800F79C:
	str r0, [sp]
	adds r0, r7, 0
	movs r2, 0x1
_0800F7A2:
	movs r3, 0x2
	bl sub_800F460
	b _0800F7C2
_0800F7AA:
	adds r0, r1, 0
	movs r1, 0x14
	bl sub_80D87BC
	ldrb r1, [r4, 0x18]
	movs r0, 0x8
	str r0, [sp]
	adds r0, r7, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_800F460
_0800F7C2:
	adds r5, 0x1C
	subs r6, 0x1
	cmp r6, 0
	bge _0800F744
	b _0800F830
_0800F7CC:
	ldr r0, _0800F844 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0xB5
	ldrb r5, [r0]
	movs r0, 0x1
	adds r6, r5, 0
	eors r6, r0
	adds r1, r6, 0
	ldr r4, _0800F848 @ =gLinkPlayers
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x18]
	cmp r0, 0
	beq _0800F7F0
	adds r6, r5, 0
	adds r5, r1, 0
_0800F7F0:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r4, 0x8
	adds r1, r0, r4
	adds r0, r1, 0
	movs r1, 0xF
	bl sub_80D87BC
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	adds r1, r0, r4
	adds r0, r1, 0
	movs r1, 0x10
	bl sub_80D87BC
	movs r4, 0x7
	str r4, [sp]
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl sub_800F460
	str r4, [sp]
	adds r0, r7, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_800F460
_0800F830:
	ldr r0, _0800F84C @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0800FAC4
	.align 2, 0
_0800F844: .4byte gBattleStruct
_0800F848: .4byte gLinkPlayers
_0800F84C: .4byte gTasks
_0800F850:
	ldr r0, _0800F8CC @ =0x00002710
	bl AllocSpritePalette
	lsls r0, 24
	ldr r2, _0800F8D0 @ =gPlttBufferUnfaded
	lsrs r0, 19
	ldr r3, _0800F8D4 @ =0x0000021e
	adds r0, r3
	adds r2, r0, r2
	ldr r1, _0800F8D8 @ =gPlttBufferFaded
	adds r0, r1
	ldr r1, _0800F8DC @ =0x00007fff
	strh r1, [r0]
	strh r1, [r2]
	ldr r0, _0800F8E0 @ =gUnknown_82482E8
	movs r1, 0x6C
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r4, _0800F8E4 @ =gBattleStruct
	ldr r1, [r4]
	adds r1, 0x7D
	strb r0, [r1]
	ldr r0, _0800F8E8 @ =gUnknown_8248300
	movs r1, 0x84
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0x7E
	strb r0, [r1]
	ldr r3, _0800F8EC @ =gSprites
	ldr r0, [r4]
	adds r0, 0x7D
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x7E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _0800FAC4
	.align 2, 0
_0800F8CC: .4byte 0x00002710
_0800F8D0: .4byte gPlttBufferUnfaded
_0800F8D4: .4byte 0x0000021e
_0800F8D8: .4byte gPlttBufferFaded
_0800F8DC: .4byte 0x00007fff
_0800F8E0: .4byte gUnknown_82482E8
_0800F8E4: .4byte gBattleStruct
_0800F8E8: .4byte gUnknown_8248300
_0800F8EC: .4byte gSprites
_0800F8F0:
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0800F958
	ldr r4, _0800F944 @ =gBattle_BG1_X
	ldrh r0, [r5, 0xA]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800F90A
	adds r0, 0x1F
_0800F90A:
	asrs r1, r0, 5
	movs r2, 0x14
	negs r2, r2
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4]
	ldr r4, _0800F948 @ =gBattle_BG2_X
	ldrh r0, [r5, 0xC]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800F928
	adds r0, 0x1F
_0800F928:
	asrs r1, r0, 5
	movs r3, 0x8C
	negs r3, r3
	adds r0, r3, 0
	subs r0, r1
	strh r0, [r4]
	ldr r0, _0800F94C @ =gBattle_BG1_Y
	ldr r2, _0800F950 @ =0x0000ffdc
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _0800F954 @ =gBattle_BG2_Y
	strh r1, [r0]
	b _0800F9C4
	.align 2, 0
_0800F944: .4byte gBattle_BG1_X
_0800F948: .4byte gBattle_BG2_X
_0800F94C: .4byte gBattle_BG1_Y
_0800F950: .4byte 0x0000ffdc
_0800F954: .4byte gBattle_BG2_Y
_0800F958:
	ldr r4, _0800F9E8 @ =gBattle_BG1_X
	ldrh r0, [r5, 0xA]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800F96A
	adds r0, 0x1F
_0800F96A:
	asrs r1, r0, 5
	movs r3, 0x14
	negs r3, r3
	adds r0, r3, 0
	subs r0, r1
	strh r0, [r4]
	ldr r4, _0800F9EC @ =gBattle_BG1_Y
	ldrh r0, [r5, 0xA]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800F988
	adds r0, 0x1F
_0800F988:
	asrs r0, 5
	subs r0, 0xA4
	strh r0, [r4]
	ldr r4, _0800F9F0 @ =gBattle_BG2_X
	ldrh r0, [r5, 0xC]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800F9A0
	adds r0, 0x1F
_0800F9A0:
	asrs r1, r0, 5
	movs r2, 0x8C
	negs r2, r2
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4]
	ldr r4, _0800F9F4 @ =gBattle_BG2_Y
	ldrh r0, [r5, 0xC]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800F9BE
	adds r0, 0x1F
_0800F9BE:
	asrs r0, 5
	subs r0, 0xA4
	strh r0, [r4]
_0800F9C4:
	ldr r1, _0800F9F8 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xC]
	movs r2, 0xC
	ldrsh r3, [r1, r2]
	mov r8, r3
	cmp r3, 0
	beq _0800F9FC
	subs r0, 0x2
	strh r0, [r1, 0xC]
	ldrh r0, [r1, 0xA]
	adds r0, 0x2
	strh r0, [r1, 0xA]
	b _0800FAC4
	.align 2, 0
_0800F9E8: .4byte gBattle_BG1_X
_0800F9EC: .4byte gBattle_BG1_Y
_0800F9F0: .4byte gBattle_BG2_X
_0800F9F4: .4byte gBattle_BG2_Y
_0800F9F8: .4byte gTasks
_0800F9FC:
	movs r3, 0x12
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0800FA08
	bl sub_800F5CC
_0800FA08:
	movs r0, 0x71
	bl PlaySE
	adds r0, r7, 0
	bl DestroyTask
	ldr r4, _0800FAD0 @ =gSprites
	ldr r5, _0800FAD4 @ =gBattleStruct
	ldr r0, [r5]
	adds r0, 0x7D
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x7E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r5, [r5]
	adds r6, r5, 0
	adds r6, 0x7E
	ldrb r0, [r6]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x40
	ldr r7, _0800FAD8 @ =0x000003ff
	adds r0, r7, 0
	ands r1, r0
	ldr r0, _0800FADC @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	adds r5, 0x7D
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r8
	strh r1, [r0, 0x2E]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x30]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x30]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r2, r8
	strh r2, [r0, 0x32]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x32]
_0800FAC4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800FAD0: .4byte gSprites
_0800FAD4: .4byte gBattleStruct
_0800FAD8: .4byte 0x000003ff
_0800FADC: .4byte 0xfffffc00
	thumb_func_end sub_800F6FC

	thumb_func_start sub_800FAE0
sub_800FAE0: @ 800FAE0
	push {r4,lr}
	ldr r0, _0800FB64 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800FB94
	ldr r0, _0800FB68 @ =gFile_graphics_battle_transitions_vs_frame_sheet
	ldr r1, _0800FB6C @ =0x06004000
	bl LZDecompressVram
	ldr r0, _0800FB70 @ =gFile_graphics_battle_transitions_vs_sheet
	ldr r1, _0800FB74 @ =0x06010000
	bl LZDecompressVram
	ldr r0, _0800FB78 @ =gFile_graphics_battle_transitions_vs_frame_palette
	movs r1, 0x60
	movs r2, 0x20
	bl LoadCompressedPalette
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetBgAttribute
	ldr r1, _0800FB7C @ =0x00005c04
	movs r0, 0xA
	bl SetGpuReg
	ldr r4, _0800FB80 @ =gFile_graphics_battle_transitions_vs_frame_tilemap
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x48
	movs r1, 0x36
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x36
	bl SetGpuReg
	ldr r0, _0800FB84 @ =gBattle_BG1_Y
	ldr r2, _0800FB88 @ =0x0000ff5c
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _0800FB8C @ =gBattle_BG2_Y
	strh r1, [r0]
	ldr r0, _0800FB90 @ =gUnknown_8248318
	bl sub_800F034
	b _0800FC26
	.align 2, 0
_0800FB64: .4byte gBattleTypeFlags
_0800FB68: .4byte gFile_graphics_battle_transitions_vs_frame_sheet
_0800FB6C: .4byte 0x06004000
_0800FB70: .4byte gFile_graphics_battle_transitions_vs_sheet
_0800FB74: .4byte 0x06010000
_0800FB78: .4byte gFile_graphics_battle_transitions_vs_frame_palette
_0800FB7C: .4byte 0x00005c04
_0800FB80: .4byte gFile_graphics_battle_transitions_vs_frame_tilemap
_0800FB84: .4byte gBattle_BG1_Y
_0800FB88: .4byte 0x0000ff5c
_0800FB8C: .4byte gBattle_BG2_Y
_0800FB90: .4byte gUnknown_8248318
_0800FB94:
	movs r0, 0x80
	lsls r0, 9
	ands r0, r1
	cmp r0, 0
	beq _0800FBA6
	movs r0, 0
	bl sub_800F2AC
	b _0800FC26
_0800FBA6:
	ldr r0, _0800FBC8 @ =0x00080902
	ands r0, r1
	cmp r0, 0
	bne _0800FBF8
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _0800FBD8
	ldr r0, _0800FBCC @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0800FBD0
	movs r0, 0x7
	bl sub_800F2AC
	b _0800FC26
	.align 2, 0
_0800FBC8: .4byte 0x00080902
_0800FBCC: .4byte gGameVersion
_0800FBD0:
	movs r0, 0x4
	bl sub_800F2AC
	b _0800FC26
_0800FBD8:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _0800FC08
	ldr r2, _0800FC00 @ =gTrainers
	ldr r0, _0800FC04 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x54
	beq _0800FBF8
	cmp r0, 0x5A
	bne _0800FC08
_0800FBF8:
	movs r0, 0x8
	bl sub_800F2AC
	b _0800FC26
	.align 2, 0
_0800FC00: .4byte gTrainers
_0800FC04: .4byte gTrainerBattleOpponent_A
_0800FC08:
	bl sav1_map_get_battletype
	lsls r0, 24
	cmp r0, 0
	bne _0800FC20
	ldr r0, _0800FC1C @ =gUnknown_2022B50
	ldrb r0, [r0]
	bl sub_800F2AC
	b _0800FC26
	.align 2, 0
_0800FC1C: .4byte gUnknown_2022B50
_0800FC20:
	movs r0, 0x8
	bl sub_800F2AC
_0800FC26:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_800FAE0

	thumb_func_start sub_800FC2C
sub_800FC2C: @ 800FC2C
	push {lr}
	ldr r0, _0800FC40 @ =gBattleTypeFlags
	ldr r1, [r0]
	ldr r2, _0800FC44 @ =0x00080902
	ands r2, r1
	cmp r2, 0
	beq _0800FC48
	movs r0, 0xA
	b _0800FCAA
	.align 2, 0
_0800FC40: .4byte gBattleTypeFlags
_0800FC44: .4byte 0x00080902
_0800FC48:
	movs r0, 0x80
	lsls r0, 9
	ands r0, r1
	cmp r0, 0
	beq _0800FC60
	ldr r0, _0800FC5C @ =gUnknown_2022B50
	strb r2, [r0]
	movs r0, 0
	b _0800FCAA
	.align 2, 0
_0800FC5C: .4byte gUnknown_2022B50
_0800FC60:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _0800FC90
	ldr r2, _0800FC80 @ =gTrainers
	ldr r0, _0800FC84 @ =gTrainerBattleOpponent_A
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x54
	bne _0800FC88
	movs r0, 0xC
	b _0800FCAA
	.align 2, 0
_0800FC80: .4byte gTrainers
_0800FC84: .4byte gTrainerBattleOpponent_A
_0800FC88:
	cmp r0, 0x5A
	bne _0800FC90
	movs r0, 0x13
	b _0800FCAA
_0800FC90:
	bl sav1_map_get_battletype
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0800FCA6
	bl sub_800F238
	lsls r0, 24
	lsrs r0, 24
	b _0800FCAA
_0800FCA6:
	ldr r0, _0800FCB0 @ =gUnknown_2022B50
	ldrb r0, [r0]
_0800FCAA:
	pop {r1}
	bx r1
	.align 2, 0
_0800FCB0: .4byte gUnknown_2022B50
	thumb_func_end sub_800FC2C

	thumb_func_start sub_800FCB4
sub_800FCB4: @ 800FCB4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	cmp r0, 0x6
	bhi _0800FD92
	lsls r0, 2
	ldr r1, _0800FCCC @ =_0800FCD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800FCCC: .4byte _0800FCD0
	.align 2, 0
_0800FCD0:
	.4byte _0800FCEC
	.4byte _0800FCFC
	.4byte _0800FD14
	.4byte _0800FD24
	.4byte _0800FD3E
	.4byte _0800FD68
	.4byte _0800FD8C
_0800FCEC:
	ldr r0, _0800FCF8 @ =gBattleTextboxTiles
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	b _0800FD94
	.align 2, 0
_0800FCF8: .4byte gBattleTextboxTiles
_0800FCFC:
	ldr r1, _0800FD10 @ =gFile_graphics_interface_menu_map_tilemap
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	b _0800FD94
	.align 2, 0
_0800FD10: .4byte gFile_graphics_interface_menu_map_tilemap
_0800FD14:
	ldr r0, _0800FD20 @ =gBattleTextboxPalette
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	b _0800FD94
	.align 2, 0
_0800FD20: .4byte gBattleTextboxPalette
_0800FD24:
	bl sub_800FC2C
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0800FD5C @ =gUnknown_824EE34
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0800FD60 @ =0x06008000
	bl LZDecompressVram
_0800FD3E:
	bl sub_800FC2C
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0800FD5C @ =gUnknown_824EE34
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0800FD64 @ =0x0600d000
	bl LZDecompressVram
	b _0800FD94
	.align 2, 0
_0800FD5C: .4byte gUnknown_824EE34
_0800FD60: .4byte 0x06008000
_0800FD64: .4byte 0x0600d000
_0800FD68:
	bl sub_800FC2C
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0800FD88 @ =gUnknown_824EE34
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0x10
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
	b _0800FD94
	.align 2, 0
_0800FD88: .4byte gUnknown_824EE34
_0800FD8C:
	bl sub_800F380
	b _0800FD94
_0800FD92:
	movs r4, 0x1
_0800FD94:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_800FCB4

	.align 2, 0 @ Don't pad with nop.
