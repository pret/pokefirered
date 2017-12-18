	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80CD228
sub_80CD228: @ 80CD228
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _080CD23C @ =sub_80CD240
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080CD23C: .4byte sub_80CD240
	thumb_func_end sub_80CD228

	thumb_func_start sub_80CD240
sub_80CD240: @ 80CD240
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080CD260 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _080CD254
	b _080CD376
_080CD254:
	lsls r0, 2
	ldr r1, _080CD264 @ =_080CD268
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CD260: .4byte gMain
_080CD264: .4byte _080CD268
	.align 2, 0
_080CD268:
	.4byte _080CD288
	.4byte _080CD294
	.4byte _080CD29A
	.4byte _080CD2CC
	.4byte _080CD2E2
	.4byte _080CD302
	.4byte _080CD314
	.4byte _080CD338
_080CD288:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80CD4D0
	b _080CD324
_080CD294:
	bl sub_80CD608
	b _080CD324
_080CD29A:
	ldr r4, _080CD2C4 @ =gUnknown_2039A1C
	movs r0, 0x80
	lsls r0, 4
	bl AllocZeroed
	str r0, [r4]
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080CD2C8 @ =gUnknown_83F6C7C
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	ldr r1, [r4]
	movs r0, 0x3
	bl SetBgTilemapBuffer
	bl sub_80CD638
	b _080CD324
	.align 2, 0
_080CD2C4: .4byte gUnknown_2039A1C
_080CD2C8: .4byte gUnknown_83F6C7C
_080CD2CC:
	movs r0, 0x3
	bl sub_80CDCD0
	movs r0, 0
	bl stdpal_get
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	b _080CD324
_080CD2E2:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CD376
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _080CD324
_080CD302:
	ldr r0, _080CD310 @ =gUnknown_83F6C68
	bl InitWindows
	bl DeactivateAllTextPrinters
	b _080CD324
	.align 2, 0
_080CD310: .4byte gUnknown_83F6C68
_080CD314:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080CD324:
	ldr r1, _080CD334 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080CD376
	.align 2, 0
_080CD334: .4byte gMain
_080CD338:
	bl sub_80CD628
	ldr r0, _080CD350 @ =sub_80CD38C
	bl SetVBlankCallback
	ldr r0, _080CD354 @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0
	beq _080CD358
	bl sub_815EC8C
	b _080CD35C
	.align 2, 0
_080CD350: .4byte sub_80CD38C
_080CD354: .4byte gUnknown_20370C0
_080CD358:
	bl sub_80CDBE4
_080CD35C:
	ldr r0, _080CD380 @ =sub_80CD3B8
	movs r1, 0x8
	bl CreateTask
	ldr r0, _080CD384 @ =sub_80CD3A0
	bl SetMainCallback2
	ldr r0, _080CD388 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_080CD376:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD380: .4byte sub_80CD3B8
_080CD384: .4byte sub_80CD3A0
_080CD388: .4byte gMain
	thumb_func_end sub_80CD240

	thumb_func_start sub_80CD38C
sub_80CD38C: @ 80CD38C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80CD38C

	thumb_func_start sub_80CD3A0
sub_80CD3A0: @ 80CD3A0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80CD3A0

	thumb_func_start sub_80CD3B8
sub_80CD3B8: @ 80CD3B8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CD3DC @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CD3D8
	ldr r0, _080CD3E0 @ =gUnknown_3005090
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080CD3E4 @ =sub_80CD3E8
	str r0, [r1]
_080CD3D8:
	pop {r0}
	bx r0
	.align 2, 0
_080CD3DC: .4byte gUnknown_2037AB8
_080CD3E0: .4byte gUnknown_3005090
_080CD3E4: .4byte sub_80CD3E8
	thumb_func_end sub_80CD3B8

	thumb_func_start sub_80CD3E8
sub_80CD3E8: @ 80CD3E8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080CD41C @ =gUnknown_3005090
	adds r4, r1, r0
	ldr r0, _080CD420 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CD40C
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080CD416
_080CD40C:
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _080CD424 @ =sub_80CD428
	str r0, [r4]
_080CD416:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD41C: .4byte gUnknown_3005090
_080CD420: .4byte gMain
_080CD424: .4byte sub_80CD428
	thumb_func_end sub_80CD3E8

	thumb_func_start sub_80CD428
sub_80CD428: @ 80CD428
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080CD458 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CD45C @ =sub_80CD460
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD458: .4byte gUnknown_3005090
_080CD45C: .4byte sub_80CD460
	thumb_func_end sub_80CD428

	thumb_func_start sub_80CD460
sub_80CD460: @ 80CD460
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CD498 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CD490
	ldr r0, _080CD49C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	ldr r0, _080CD4A0 @ =gUnknown_2039A1C
	ldr r0, [r0]
	bl Free
	movs r0, 0
	bl sub_80CD4A4
	bl FreeAllWindowBuffers
	adds r0, r4, 0
	bl DestroyTask
_080CD490:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD498: .4byte gUnknown_2037AB8
_080CD49C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_080CD4A0: .4byte gUnknown_2039A1C
	thumb_func_end sub_80CD460

	thumb_func_start sub_80CD4A4
sub_80CD4A4: @ 80CD4A4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0
	bl ClearWindowTilemap
	adds r0, r4, 0
	movs r1, 0x2
	bl CopyWindowToVram
	adds r0, r4, 0
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD4A4

	thumb_func_start sub_80CD4D0
sub_80CD4D0: @ 80CD4D0
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
	ldr r1, _080CD600 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080CD604 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080CD4F6:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _080CD4F6
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
	ldr r2, _080CD600 @ =0x040000d4
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
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x8
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xA
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x16
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xC
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xE
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1C
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CD600: .4byte 0x040000d4
_080CD604: .4byte 0x81000800
	thumb_func_end sub_80CD4D0

	thumb_func_start sub_80CD608
sub_80CD608: @ 80CD608
	push {lr}
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl dp13_810BB8C
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	pop {r0}
	bx r0
	thumb_func_end sub_80CD608

	thumb_func_start sub_80CD628
sub_80CD628: @ 80CD628
	push {lr}
	movs r1, 0x94
	lsls r1, 4
	movs r0, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_80CD628

	thumb_func_start sub_80CD638
sub_80CD638: @ 80CD638
	push {lr}
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
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
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
	pop {r0}
	bx r0
	thumb_func_end sub_80CD638

	thumb_func_start InitLinkBattleRecord
InitLinkBattleRecord: @ 80CD690
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r2, _080CD6BC @ =0x01000008
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD6BC: .4byte 0x01000008
	thumb_func_end InitLinkBattleRecord

	thumb_func_start InitLinkBattleRecords_
InitLinkBattleRecords_: @ 80CD6C0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x4
_080CD6C6:
	adds r0, r4, 0
	bl InitLinkBattleRecord
	adds r4, 0x10
	subs r5, 0x1
	cmp r5, 0
	bge _080CD6C6
	movs r0, 0x17
	movs r1, 0
	bl sub_8054F00
	movs r0, 0x18
	movs r1, 0
	bl sub_8054F00
	movs r0, 0x19
	movs r1, 0
	bl sub_8054F00
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end InitLinkBattleRecords_

	thumb_func_start GetLinkBattleRecordTotalBattles
GetLinkBattleRecordTotalBattles: @ 80CD6F4
	adds r1, r0, 0
	ldrh r0, [r1, 0xA]
	ldrh r2, [r1, 0xC]
	adds r0, r2
	ldrh r1, [r1, 0xE]
	adds r0, r1
	bx lr
	thumb_func_end GetLinkBattleRecordTotalBattles

	thumb_func_start sub_80CD704
sub_80CD704: @ 80CD704
	push {r4-r7,lr}
	adds r7, r1, 0
	lsls r2, 16
	lsrs r6, r2, 16
	movs r5, 0
	adds r4, r0, 0
_080CD710:
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x7
	bl StringCompareN
	cmp r0, 0
	bne _080CD728
	ldrh r0, [r4, 0x8]
	cmp r0, r6
	bne _080CD728
	adds r0, r5, 0
	b _080CD732
_080CD728:
	adds r4, 0x10
	adds r5, 0x1
	cmp r5, 0x4
	ble _080CD710
	movs r0, 0x5
_080CD732:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80CD704

	thumb_func_start SortLinkBattleRecords
SortLinkBattleRecords: @ 80CD738
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r8, r0
	movs r0, 0x4
_080CD746:
	subs r2, r0, 0x1
	mov r9, r2
	cmp r2, 0
	blt _080CD7A0
	lsls r0, 4
	mov r1, r8
	adds r6, r1, r0
	lsls r0, r2, 4
	adds r5, r0, r1
_080CD758:
	adds r0, r6, 0
	str r2, [sp, 0x10]
	bl GetLinkBattleRecordTotalBattles
	adds r4, r0, 0
	adds r0, r5, 0
	bl GetLinkBattleRecordTotalBattles
	ldr r2, [sp, 0x10]
	cmp r4, r0
	ble _080CD792
	mov r1, sp
	adds r0, r6, 0
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r6, 0
	adds r0, r5, 0
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r5, 0
	mov r0, sp
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
_080CD792:
	subs r5, 0x10
	movs r0, 0x1
	negs r0, r0
	add r9, r0
	mov r1, r9
	cmp r1, 0
	bge _080CD758
_080CD7A0:
	adds r0, r2, 0
	cmp r0, 0
	bgt _080CD746
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SortLinkBattleRecords

	thumb_func_start UpdateLinkBattleRecord
UpdateLinkBattleRecord: @ 80CD7B4
	push {lr}
	adds r2, r0, 0
	cmp r1, 0x2
	beq _080CD7E4
	cmp r1, 0x2
	bgt _080CD7C6
	cmp r1, 0x1
	beq _080CD7CC
	b _080CD80E
_080CD7C6:
	cmp r1, 0x3
	beq _080CD7FC
	b _080CD80E
_080CD7CC:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080CD7E0 @ =0x0000270f
	cmp r0, r1
	bls _080CD80E
	strh r1, [r2, 0xA]
	b _080CD80E
	.align 2, 0
_080CD7E0: .4byte 0x0000270f
_080CD7E4:
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080CD7F8 @ =0x0000270f
	cmp r0, r1
	bls _080CD80E
	strh r1, [r2, 0xC]
	b _080CD80E
	.align 2, 0
_080CD7F8: .4byte 0x0000270f
_080CD7FC:
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080CD814 @ =0x0000270f
	cmp r0, r1
	bls _080CD80E
	strh r1, [r2, 0xE]
_080CD80E:
	pop {r0}
	bx r0
	.align 2, 0
_080CD814: .4byte 0x0000270f
	thumb_func_end UpdateLinkBattleRecord

	thumb_func_start UpdateLinkBattleGameStats
UpdateLinkBattleGameStats: @ 80CD818
	push {r4,lr}
	cmp r0, 0x2
	beq _080CD832
	cmp r0, 0x2
	bgt _080CD828
	cmp r0, 0x1
	beq _080CD82E
	b _080CD84A
_080CD828:
	cmp r0, 0x3
	beq _080CD836
	b _080CD84A
_080CD82E:
	movs r4, 0x17
	b _080CD838
_080CD832:
	movs r4, 0x18
	b _080CD838
_080CD836:
	movs r4, 0x19
_080CD838:
	adds r0, r4, 0
	bl GetGameStat
	ldr r1, _080CD850 @ =0x0000270e
	cmp r0, r1
	bhi _080CD84A
	adds r0, r4, 0
	bl IncrementGameStat
_080CD84A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD850: .4byte 0x0000270e
	thumb_func_end UpdateLinkBattleGameStats

	thumb_func_start sub_80CD854
sub_80CD854: @ 80CD854
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r6, r0, 0
	adds r4, r1, 0
	mov r8, r3
	ldr r0, [sp, 0x20]
	lsls r2, 16
	lsrs r7, r2, 16
	cmp r0, 0x1
	bne _080CD882
	mov r1, sp
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x15
	strb r0, [r1, 0x1]
	mov r0, sp
	adds r0, 0x2
	adds r1, r4, 0
	bl StringCopy
	b _080CD88A
_080CD882:
	mov r0, sp
	adds r1, r4, 0
	bl StringCopy
_080CD88A:
	mov r0, r8
	bl UpdateLinkBattleGameStats
	adds r0, r6, 0
	bl SortLinkBattleRecords
	adds r0, r6, 0
	mov r1, sp
	adds r2, r7, 0
	bl sub_80CD704
	adds r5, r0, 0
	cmp r5, 0x5
	bne _080CD8BE
	movs r5, 0x4
	adds r4, r6, 0
	adds r4, 0x40
	adds r0, r4, 0
	bl InitLinkBattleRecord
	adds r0, r4, 0
	mov r1, sp
	movs r2, 0x7
	bl StringCopyN
	strh r7, [r4, 0x8]
_080CD8BE:
	lsls r0, r5, 4
	adds r0, r6, r0
	mov r1, r8
	bl UpdateLinkBattleRecord
	adds r0, r6, 0
	bl SortLinkBattleRecords
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD854

	thumb_func_start InitLinkBattleRecords
InitLinkBattleRecords: @ 80CD8DC
	push {lr}
	ldr r0, _080CD8F0 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _080CD8F4 @ =0x00000a98
	adds r0, r1
	bl InitLinkBattleRecords_
	pop {r0}
	bx r0
	.align 2, 0
_080CD8F0: .4byte gSaveBlock2Ptr
_080CD8F4: .4byte 0x00000a98
	thumb_func_end InitLinkBattleRecords

	thumb_func_start sub_80CD8F8
sub_80CD8F8: @ 80CD8F8
	push {lr}
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 5
	ldr r0, _080CD91C @ =gUnknown_2039638
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080CD920 @ =0x0000270f
	cmp r0, r2
	bls _080CD916
	strh r2, [r1]
_080CD916:
	pop {r0}
	bx r0
	.align 2, 0
_080CD91C: .4byte gUnknown_2039638
_080CD920: .4byte 0x0000270f
	thumb_func_end sub_80CD8F8

	thumb_func_start sub_80CD924
sub_80CD924: @ 80CD924
	push {lr}
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 5
	ldr r0, _080CD948 @ =gUnknown_203963A
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080CD94C @ =0x0000270f
	cmp r0, r2
	bls _080CD942
	strh r2, [r1]
_080CD942:
	pop {r0}
	bx r0
	.align 2, 0
_080CD948: .4byte gUnknown_203963A
_080CD94C: .4byte 0x0000270f
	thumb_func_end sub_80CD924

	thumb_func_start sub_80CD950
sub_80CD950: @ 80CD950
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CD964 @ =gUnknown_2023E8A
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080CD968
	cmp r0, 0x2
	beq _080CD976
	b _080CD984
	.align 2, 0
_080CD964: .4byte gUnknown_2023E8A
_080CD968:
	eors r0, r4
	bl sub_80CD8F8
	adds r0, r4, 0
	bl sub_80CD924
	b _080CD984
_080CD976:
	movs r0, 0x1
	eors r0, r4
	bl sub_80CD924
	adds r0, r4, 0
	bl sub_80CD8F8
_080CD984:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD950

	thumb_func_start sub_80CD98C
sub_80CD98C: @ 80CD98C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _080CD9DC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _080CD9D4
	adds r0, r6, 0
	bl sub_80CD950
	ldr r0, _080CD9E0 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _080CD9E4 @ =0x00000a98
	adds r0, r1
	lsls r2, r6, 1
	adds r2, r6
	lsls r2, 5
	ldr r3, _080CD9E8 @ =gUnknown_2039654
	adds r1, r2, r3
	subs r3, 0x30
	adds r2, r3
	ldrh r2, [r2, 0xE]
	ldr r3, _080CD9EC @ =gUnknown_2023E8A
	ldrb r3, [r3]
	ldr r5, _080CD9F0 @ =gUnknown_202273C
	lsls r4, r6, 3
	subs r4, r6
	lsls r4, 2
	adds r4, r5
	ldrh r4, [r4, 0x1A]
	str r4, [sp]
	bl sub_80CD854
_080CD9D4:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD9DC: .4byte gSaveBlock1Ptr
_080CD9E0: .4byte gSaveBlock2Ptr
_080CD9E4: .4byte 0x00000a98
_080CD9E8: .4byte gUnknown_2039654
_080CD9EC: .4byte gUnknown_2023E8A
_080CD9F0: .4byte gUnknown_202273C
	thumb_func_end sub_80CD98C

	thumb_func_start sub_80CD9F4
sub_80CD9F4: @ 80CD9F4
	push {r4-r7,lr}
	sub sp, 0x14
	movs r0, 0x17
	bl GetGameStat
	adds r4, r0, 0
	movs r0, 0x18
	bl GetGameStat
	adds r5, r0, 0
	movs r0, 0x19
	bl GetGameStat
	adds r6, r0, 0
	ldr r0, _080CDAB0 @ =0x0000270f
	cmp r4, r0
	bls _080CDA18
	adds r4, r0, 0
_080CDA18:
	cmp r5, r0
	bls _080CDA1E
	adds r5, r0, 0
_080CDA1E:
	cmp r6, r0
	bls _080CDA24
	adds r6, r0, 0
_080CDA24:
	ldr r0, _080CDAB4 @ =gUnknown_2021CD0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, _080CDAB8 @ =gUnknown_2021CF0
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, _080CDABC @ =gUnknown_2021D04
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r3, 0
	ldr r6, _080CDAC0 @ =gUnknown_83F6C84
	ldr r7, _080CDAC4 @ =gUnknown_2021D18
	ldr r0, _080CDAC8 @ =gUnknown_8418188
	mov r12, r0
	movs r5, 0
_080CDA54:
	lsls r0, r3, 2
	adds r0, r6
	ldr r2, [r0]
	movs r1, 0
	adds r4, r3, 0x1
	movs r3, 0x3
_080CDA60:
	cmp r1, 0
	bne _080CDA70
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080CDA6C
	movs r1, 0x1
_080CDA6C:
	cmp r1, 0
	beq _080CDA72
_080CDA70:
	strb r5, [r2]
_080CDA72:
	adds r2, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _080CDA60
	movs r0, 0xFF
	strb r0, [r2]
	adds r3, r4, 0
	cmp r3, 0x2
	bls _080CDA54
	adds r0, r7, 0
	mov r1, r12
	bl StringExpandPlaceholders
	movs r0, 0
	str r0, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	ldr r1, _080CDACC @ =gUnknown_83F6C78
	str r1, [sp, 0x8]
	str r0, [sp, 0xC]
	str r7, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0xC
	movs r3, 0x18
	bl AddTextPrinterParametrized2
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDAB0: .4byte 0x0000270f
_080CDAB4: .4byte gUnknown_2021CD0
_080CDAB8: .4byte gUnknown_2021CF0
_080CDABC: .4byte gUnknown_2021D04
_080CDAC0: .4byte gUnknown_83F6C84
_080CDAC4: .4byte gUnknown_2021D18
_080CDAC8: .4byte gUnknown_8418188
_080CDACC: .4byte gUnknown_83F6C78
	thumb_func_end sub_80CD9F4

	thumb_func_start sub_80CDAD0
sub_80CDAD0: @ 80CDAD0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r5, 0
	ldrh r0, [r6, 0xA]
	cmp r0, 0
	bne _080CDB50
	ldr r0, [r6, 0xC]
	cmp r0, 0
	bne _080CDB50
	str r5, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	ldr r0, _080CDB44 @ =gUnknown_83F6C78
	str r0, [sp, 0x8]
	str r5, [sp, 0xC]
	ldr r0, _080CDB48 @ =gUnknown_84181B6
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	mov r3, r8
	bl AddTextPrinterParametrized2
	movs r6, 0
_080CDB0E:
	movs r4, 0x54
	cmp r5, 0
	beq _080CDB1C
	movs r4, 0xB4
	cmp r5, 0x1
	bne _080CDB1C
	movs r4, 0x84
_080CDB1C:
	adds r2, r4, 0
	str r6, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	ldr r0, _080CDB44 @ =gUnknown_83F6C78
	str r0, [sp, 0x8]
	str r6, [sp, 0xC]
	ldr r0, _080CDB4C @ =gUnknown_84181BE
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	mov r3, r8
	bl AddTextPrinterParametrized2
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080CDB0E
	b _080CDBCE
	.align 2, 0
_080CDB44: .4byte gUnknown_83F6C78
_080CDB48: .4byte gUnknown_84181B6
_080CDB4C: .4byte gUnknown_84181BE
_080CDB50:
	movs r5, 0
	ldr r7, _080CDB70 @ =gUnknown_2021CD0
	mov r9, r5
_080CDB56:
	cmp r5, 0
	bne _080CDB74
	movs r4, 0
	adds r0, r7, 0
	movs r1, 0x8
	bl StringFillWithTerminator
	adds r0, r7, 0
	adds r1, r6, 0
	movs r2, 0x7
	bl StringCopyN
	b _080CDBA6
	.align 2, 0
_080CDB70: .4byte gUnknown_2021CD0
_080CDB74:
	cmp r5, 0x1
	bne _080CDB7E
	movs r4, 0x54
	ldrh r1, [r6, 0xA]
	b _080CDB86
_080CDB7E:
	cmp r5, 0x2
	bne _080CDB98
	movs r4, 0x84
	ldrh r1, [r6, 0xC]
_080CDB86:
	ldr r0, _080CDB94 @ =gUnknown_2021CD0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	b _080CDBA6
	.align 2, 0
_080CDB94: .4byte gUnknown_2021CD0
_080CDB98:
	movs r4, 0xB4
	ldrh r1, [r6, 0xE]
	ldr r0, _080CDBDC @ =gUnknown_2021CD0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
_080CDBA6:
	adds r2, r4, 0
	mov r0, r9
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	ldr r0, _080CDBE0 @ =gUnknown_83F6C78
	str r0, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	str r7, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	mov r3, r8
	bl AddTextPrinterParametrized2
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080CDB56
_080CDBCE:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDBDC: .4byte gUnknown_2021CD0
_080CDBE0: .4byte gUnknown_83F6C78
	thumb_func_end sub_80CDAD0

	thumb_func_start sub_80CDBE4
sub_80CDBE4: @ 80CDBE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	movs r0, 0xD8
	str r0, [sp]
	movs r0, 0x90
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	ldr r5, _080CDC9C @ =gUnknown_2021D18
	ldr r1, _080CDCA0 @ =gUnknown_8418174
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	adds r1, r5, 0
	bl sub_8005ED4
	movs r2, 0xD0
	subs r2, r0
	lsrs r2, 1
	lsls r2, 24
	lsrs r2, 24
	movs r4, 0
	str r4, [sp]
	movs r0, 0x2
	mov r9, r0
	str r0, [sp, 0x4]
	ldr r6, _080CDCA4 @ =gUnknown_83F6C78
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	str r5, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x4
	bl AddTextPrinterParametrized2
	ldr r5, _080CDCA8 @ =gSaveBlock2Ptr
	ldr r0, [r5]
	ldr r1, _080CDCAC @ =0x00000a98
	mov r8, r1
	add r0, r8
	bl sub_80CD9F4
	str r4, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r0, _080CDCB0 @ =gUnknown_84181A4
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x54
	movs r3, 0x30
	bl AddTextPrinterParametrized2
	adds r7, r5, 0
	movs r5, 0xF4
	lsls r5, 22
	mov r6, r8
	movs r4, 0x4
_080CDC70:
	ldr r0, [r7]
	adds r0, r6
	lsrs r1, r5, 24
	bl sub_80CDAD0
	movs r1, 0xE0
	lsls r1, 20
	adds r5, r1
	adds r6, 0x10
	subs r4, 0x1
	cmp r4, 0
	bge _080CDC70
	movs r0, 0
	bl sub_80CDCB4
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDC9C: .4byte gUnknown_2021D18
_080CDCA0: .4byte gUnknown_8418174
_080CDCA4: .4byte gUnknown_83F6C78
_080CDCA8: .4byte gSaveBlock2Ptr
_080CDCAC: .4byte 0x00000a98
_080CDCB0: .4byte gUnknown_84181A4
	thumb_func_end sub_80CDBE4

	thumb_func_start sub_80CDCB4
sub_80CDCB4: @ 80CDCB4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CDCB4

	thumb_func_start sub_80CDCD0
sub_80CDCD0: @ 80CDCD0
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080CDD0C @ =gUnknown_83F6388
	adds r0, r4, 0
	movs r2, 0xC0
	movs r3, 0
	bl LoadBgTiles
	ldr r1, _080CDD10 @ =gUnknown_83F6468
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBufferRect
	ldr r0, _080CDD14 @ =gUnknown_83F6448
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CDD0C: .4byte gUnknown_83F6388
_080CDD10: .4byte gUnknown_83F6468
_080CDD14: .4byte gUnknown_83F6448
	thumb_func_end sub_80CDCD0

	.align 2, 0 @ Don't pad with nop.
