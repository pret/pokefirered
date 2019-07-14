	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8128420
sub_8128420: @ 8128420
	push {r4,lr}
	ldr r4, _08128450 @ =gUnknown_203B0E0
	movs r0, 0xDC
	lsls r0, 1
	bl Alloc
	str r0, [r4]
	bl sub_812845C
	ldr r1, _08128454 @ =gKeyRepeatStartDelay
	movs r0, 0x14
	strh r0, [r1]
	bl sub_812B4AC
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _08128458 @ =c2_081284E0
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128450: .4byte gUnknown_203B0E0
_08128454: .4byte gKeyRepeatStartDelay
_08128458: .4byte c2_081284E0
	thumb_func_end sub_8128420

	thumb_func_start sub_812845C
sub_812845C: @ 812845C
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
	movs r0, 0
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x6]
	strb r5, [r4, 0x10]
	strb r5, [r4, 0x11]
	strb r5, [r4, 0x12]
	strb r5, [r4, 0x14]
	strb r5, [r4, 0x15]
	strb r5, [r4, 0x16]
	movs r0, 0xFF
	strb r0, [r4, 0x1A]
	bl GetLinkPlayerCount
	strb r0, [r4, 0xD]
	bl GetMultiplayerId
	strb r0, [r4, 0x13]
	strb r5, [r4, 0x17]
	strb r5, [r4, 0x18]
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r4, r1
	bl sub_8129560
	ldr r7, _081284B4 @ =gSaveBlock1Ptr
	ldr r6, _081284B8 @ =0x00003ad4
	adds r4, 0xB9
	movs r5, 0x9
_0812849A:
	ldr r1, [r7]
	adds r1, r6
	adds r0, r4, 0
	bl StringCopy
	adds r6, 0x15
	adds r4, 0x15
	subs r5, 0x1
	cmp r5, 0
	bge _0812849A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081284B4: .4byte gSaveBlock1Ptr
_081284B8: .4byte 0x00003ad4
	thumb_func_end sub_812845C

	thumb_func_start sub_81284BC
sub_81284BC: @ 81284BC
	push {r4,lr}
	ldr r4, _081284DC @ =gUnknown_203B0E0
	ldr r0, [r4]
	ldrb r0, [r0, 0xE]
	bl DestroyTask
	ldr r0, [r4]
	ldrb r0, [r0, 0xF]
	bl DestroyTask
	ldr r0, [r4]
	bl Free
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081284DC: .4byte gUnknown_203B0E0
	thumb_func_end sub_81284BC

	thumb_func_start c2_081284E0
c2_081284E0: @ 81284E0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _081284FC @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08128518
	cmp r0, 0x1
	bgt _08128500
	cmp r0, 0
	beq _08128506
	b _08128598
	.align 2, 0
_081284FC: .4byte gMain
_08128500:
	cmp r0, 0x2
	beq _08128554
	b _08128598
_08128506:
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl sub_8129B14
	b _08128548
_08128518:
	bl sub_8129BFC
	bl sub_8129B78
	adds r5, r0, 0
	cmp r5, 0
	bne _08128598
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	adds r1, r4, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08128550 @ =sub_81285B4
	bl SetVBlankCallback
_08128548:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _08128598
	.align 2, 0
_08128550: .4byte sub_81285B4
_08128554:
	bl UpdatePaletteFade
	ldr r0, _081285A0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08128598
	ldr r0, _081285A4 @ =sub_81285CC
	bl SetMainCallback2
	movs r0, 0x11
	movs r1, 0
	bl sub_8113550
	ldr r0, _081285A8 @ =sub_81285E8
	movs r1, 0x8
	bl CreateTask
	ldr r4, _081285AC @ =gUnknown_203B0E0
	ldr r1, [r4]
	strb r0, [r1, 0xE]
	ldr r0, _081285B0 @ =sub_81298F8
	movs r1, 0x7
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, 0xF]
	bl sub_80FCEA8
	movs r0, 0xE8
	movs r1, 0x96
	bl sub_80FCD74
_08128598:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081285A0: .4byte gPaletteFade
_081285A4: .4byte sub_81285CC
_081285A8: .4byte sub_81285E8
_081285AC: .4byte gUnknown_203B0E0
_081285B0: .4byte sub_81298F8
	thumb_func_end c2_081284E0

	thumb_func_start sub_81285B4
sub_81285B4: @ 81285B4
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	thumb_func_end sub_81285B4

	thumb_func_start sub_81285CC
sub_81285CC: @ 81285CC
	push {lr}
	bl RunTasks
	bl sub_8129BFC
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_81285CC

	thumb_func_start sub_81285E8
sub_81285E8: @ 81285E8
	push {r4,lr}
	ldr r4, _08128600 @ =gUnknown_203B0E0
	ldr r0, [r4]
	ldrb r0, [r0, 0x17]
	cmp r0, 0x2
	beq _0812860E
	cmp r0, 0x2
	bgt _08128604
	cmp r0, 0x1
	beq _0812860A
	b _0812861E
	.align 2, 0
_08128600: .4byte gUnknown_203B0E0
_08128604:
	cmp r0, 0x3
	beq _08128612
	b _0812861E
_0812860A:
	movs r0, 0x6
	b _08128614
_0812860E:
	movs r0, 0x7
	b _08128614
_08128612:
	movs r0, 0x8
_08128614:
	bl sub_8129218
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x17]
_0812861E:
	ldr r1, _08128638 @ =gUnknown_845A880
	ldr r0, _0812863C @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrh r0, [r0, 0x4]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128638: .4byte gUnknown_845A880
_0812863C: .4byte gUnknown_203B0E0
	thumb_func_end sub_81285E8

	thumb_func_start sub_8128640
sub_8128640: @ 8128640
	push {r4,lr}
	ldr r4, _08128658 @ =gUnknown_203B0E0
	ldr r0, [r4]
	ldrh r1, [r0, 0x6]
	cmp r1, 0x1
	beq _08128674
	cmp r1, 0x1
	bgt _0812865C
	cmp r1, 0
	beq _08128662
	b _081286BC
	.align 2, 0
_08128658: .4byte gUnknown_203B0E0
_0812865C:
	cmp r1, 0x2
	beq _081286AC
	b _081286BC
_08128662:
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r1
	bl sub_8129568
	ldr r1, [r4]
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
_08128674:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _081286BC
	bl sub_80FBA1C
	cmp r0, 0
	bne _081286BC
	ldr r4, _081286A8 @ =gUnknown_203B0E0
	ldr r1, [r4]
	movs r0, 0xC8
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	movs r2, 0x28
	bl SendBlock
	lsls r0, 24
	cmp r0, 0
	beq _081286BC
	ldr r1, [r4]
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _081286BC
	.align 2, 0
_081286A8: .4byte gUnknown_203B0E0
_081286AC:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _081286BC
	movs r0, 0x1
	bl sub_8129218
_081286BC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8128640

	thumb_func_start sub_81286C4
sub_81286C4: @ 81286C4
	push {r4,r5,lr}
	ldr r5, _081286D8 @ =gUnknown_203B0E0
	ldr r3, [r5]
	ldrh r0, [r3, 0x6]
	cmp r0, 0
	beq _081286DC
	cmp r0, 0x1
	beq _0812878A
	b _081287AC
	.align 2, 0
_081286D8: .4byte gUnknown_203B0E0
_081286DC:
	ldr r1, _081286F8 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _081286FC
	ldrb r0, [r3, 0x15]
	cmp r0, 0
	beq _081287AC
	movs r0, 0x4
	bl sub_8129218
	b _081287AC
	.align 2, 0
_081286F8: .4byte gMain
_081286FC:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _0812870C
	movs r0, 0x2
	bl sub_8129218
	b _081287AC
_0812870C:
	ldrh r1, [r1, 0x30]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08128738
	ldrb r0, [r3, 0x15]
	cmp r0, 0
	beq _08128730
	bl sub_81293AC
	movs r0, 0x8
	movs r1, 0
	bl sub_8129C34
	ldr r1, [r5]
	movs r0, 0x1
	strh r0, [r1, 0x6]
	b _081287AC
_08128730:
	movs r0, 0x3
	bl sub_8129218
	b _081287AC
_08128738:
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r2
	cmp r0, 0
	beq _08128754
	bl sub_81292D8
	movs r0, 0x8
	movs r1, 0
	bl sub_8129C34
	movs r0, 0x2
	movs r1, 0x1
	b _08128780
_08128754:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _08128774
	ldrb r0, [r3, 0x10]
	cmp r0, 0x3
	beq _0812876C
	bl sub_81293D8
	movs r0, 0x8
	b _0812877E
_0812876C:
	movs r0, 0x5
	bl sub_8129218
	b _081287AC
_08128774:
	bl sub_8129228
	cmp r0, 0
	beq _081287AC
	movs r0, 0x1
_0812877E:
	movs r1, 0
_08128780:
	bl sub_8129C34
	ldr r0, [r5]
	strh r4, [r0, 0x6]
	b _081287AC
_0812878A:
	movs r0, 0
	bl sub_8129C8C
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_8129C8C
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0
	bne _081287AC
	cmp r1, 0
	bne _081287AC
	ldr r0, [r5]
	strh r1, [r0, 0x6]
_081287AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81286C4

	thumb_func_start sub_81287B4
sub_81287B4: @ 81287B4
	push {r4-r6,lr}
	ldr r0, _081287CC @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrh r0, [r0, 0x6]
	cmp r0, 0x4
	bls _081287C2
	b _081288CE
_081287C2:
	lsls r0, 2
	ldr r1, _081287D0 @ =_081287D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081287CC: .4byte gUnknown_203B0E0
_081287D0: .4byte _081287D4
	.align 2, 0
_081287D4:
	.4byte _081287E8
	.4byte _081287F2
	.4byte _08128810
	.4byte _0812889C
	.4byte _081288B0
_081287E8:
	movs r0, 0x3
	movs r1, 0
	bl sub_8129C34
	b _081287FE
_081287F2:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _081288CE
_081287FE:
	ldr r0, _0812880C @ =gUnknown_203B0E0
	ldr r1, [r0]
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _081288CE
	.align 2, 0
_0812880C: .4byte gUnknown_203B0E0
_08128810:
	bl Menu_ProcessInput
	lsls r0, 24
	asrs r0, 8
	lsrs r6, r0, 16
	asrs r4, r0, 16
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _08128848
	adds r0, 0x1
	cmp r4, r0
	beq _08128868
	movs r0, 0x4
	movs r1, 0
	bl sub_8129C34
	ldr r5, _08128844 @ =gUnknown_203B0E0
	ldr r2, [r5]
	ldrb r0, [r2, 0x10]
	cmp r0, r4
	beq _08128870
	cmp r4, 0x3
	ble _08128880
	b _08128870
	.align 2, 0
_08128844: .4byte gUnknown_203B0E0
_08128848:
	ldr r0, _08128864 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _081288CE
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl Menu_MoveCursor
	b _081288CE
	.align 2, 0
_08128864: .4byte gMain
_08128868:
	movs r0, 0x4
	movs r1, 0
	bl sub_8129C34
_08128870:
	ldr r0, _0812887C @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x3
	strh r0, [r1, 0x6]
	b _081288CE
	.align 2, 0
_0812887C: .4byte gUnknown_203B0E0
_08128880:
	movs r1, 0
	strb r1, [r2, 0x11]
	ldr r0, [r5]
	strb r1, [r0, 0x12]
	movs r0, 0x5
	movs r1, 0x1
	bl sub_8129C34
	ldr r0, [r5]
	strb r6, [r0, 0x10]
	ldr r1, [r5]
	movs r0, 0x4
	strh r0, [r1, 0x6]
	b _081288CE
_0812889C:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _081288CE
	movs r0, 0x1
	bl sub_8129218
	b _081288CE
_081288B0:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _081288CE
	movs r0, 0x1
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _081288CE
	movs r0, 0x1
	bl sub_8129218
_081288CE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81287B4

	thumb_func_start sub_81288D4
sub_81288D4: @ 81288D4
	push {r4,lr}
	ldr r0, _081288EC @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrh r0, [r0, 0x6]
	cmp r0, 0xA
	bls _081288E2
	b _08128A94
_081288E2:
	lsls r0, 2
	ldr r1, _081288F0 @ =_081288F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081288EC: .4byte gUnknown_203B0E0
_081288F0: .4byte _081288F4
	.align 2, 0
_081288F4:
	.4byte _08128920
	.4byte _08128938
	.4byte _08128954
	.4byte _0812899C
	.4byte _08128A44
	.4byte _08128A86
	.4byte _08128A94
	.4byte _08128A94
	.4byte _081289F0
	.4byte _081289B0
	.4byte _081289D4
_08128920:
	movs r0, 0x6
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08128934 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x6]
	b _08128A94
	.align 2, 0
_08128934: .4byte gUnknown_203B0E0
_08128938:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	beq _08128946
	b _08128A94
_08128946:
	ldr r0, _08128950 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x2
	strh r0, [r1, 0x6]
	b _08128A94
	.align 2, 0
_08128950: .4byte gUnknown_203B0E0
_08128954:
	bl sub_812A568
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08128966
	cmp r1, 0
	ble _08128A00
	b _08128A0A
_08128966:
	ldr r4, _0812898C @ =gUnknown_203B0E0
	ldr r1, [r4]
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	bne _08128990
	movs r2, 0xC8
	lsls r2, 1
	adds r0, r1, r2
	bl sub_8129614
	movs r0, 0x7
	movs r1, 0
	bl sub_8129C34
	ldr r1, [r4]
	movs r0, 0x9
	strh r0, [r1, 0x6]
	b _08128A94
	.align 2, 0
_0812898C: .4byte gUnknown_203B0E0
_08128990:
	movs r2, 0xC8
	lsls r2, 1
	adds r0, r1, r2
	bl sub_81295C0
	b _08128A36
_0812899C:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128A94
	movs r0, 0x1
	bl sub_8129218
	b _08128A94
_081289B0:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128A94
	movs r0, 0x14
	movs r1, 0
	bl sub_8129C34
	ldr r0, _081289D0 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0xA
	strh r0, [r1, 0x6]
	b _08128A94
	.align 2, 0
_081289D0: .4byte gUnknown_203B0E0
_081289D4:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128A94
	ldr r0, _081289EC @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x8
	strh r0, [r1, 0x6]
	b _08128A94
	.align 2, 0
_081289EC: .4byte gUnknown_203B0E0
_081289F0:
	bl sub_812A568
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08128A24
	cmp r1, 0
	bgt _08128A0A
_08128A00:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08128A0E
	b _08128A94
_08128A0A:
	cmp r1, 0x1
	bne _08128A94
_08128A0E:
	movs r0, 0x7
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08128A20 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x3
	strh r0, [r1, 0x6]
	b _08128A94
	.align 2, 0
_08128A20: .4byte gUnknown_203B0E0
_08128A24:
	bl sub_80FA4A8
	ldr r4, _08128A40 @ =gUnknown_203B0E0
	ldr r0, [r4]
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r1
	bl sub_8129614
_08128A36:
	ldr r1, [r4]
	movs r0, 0x4
	strh r0, [r1, 0x6]
	b _08128A94
	.align 2, 0
_08128A40: .4byte gUnknown_203B0E0
_08128A44:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _08128A94
	bl sub_80FBA1C
	cmp r0, 0
	bne _08128A94
	ldr r4, _08128A7C @ =gUnknown_203B0E0
	ldr r1, [r4]
	movs r2, 0xC8
	lsls r2, 1
	adds r1, r2
	movs r0, 0
	movs r2, 0x28
	bl SendBlock
	lsls r0, 24
	cmp r0, 0
	beq _08128A94
	ldr r1, [r4]
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	bne _08128A80
	movs r0, 0x6
	strh r0, [r1, 0x6]
	b _08128A94
	.align 2, 0
_08128A7C: .4byte gUnknown_203B0E0
_08128A80:
	movs r0, 0x5
	strh r0, [r1, 0x6]
	b _08128A94
_08128A86:
	ldr r0, _08128A9C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08128A94
	movs r0, 0x9
	bl sub_8129218
_08128A94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128A9C: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_81288D4

	thumb_func_start sub_8128AA0
sub_8128AA0: @ 8128AA0
	push {r4,lr}
	ldr r1, _08128ABC @ =gUnknown_203B0E0
	ldr r0, [r1]
	ldrh r0, [r0, 0x6]
	adds r2, r1, 0
	cmp r0, 0x7
	bls _08128AB0
	b _08128BFC
_08128AB0:
	lsls r0, 2
	ldr r1, _08128AC0 @ =_08128AC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08128ABC: .4byte gUnknown_203B0E0
_08128AC0: .4byte _08128AC4
	.align 2, 0
_08128AC4:
	.4byte _08128AE4
	.4byte _08128B08
	.4byte _08128B28
	.4byte _08128B4C
	.4byte _08128B80
	.4byte _08128BA0
	.4byte _08128BC4
	.4byte _08128BE8
_08128AE4:
	ldr r0, _08128B00 @ =sub_81298F8
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08128AF2
	b _08128BFC
_08128AF2:
	movs r0, 0x7
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08128B04 @ =gUnknown_203B0E0
	ldr r1, [r0]
	b _08128BDA
	.align 2, 0
_08128B00: .4byte sub_81298F8
_08128B04: .4byte gUnknown_203B0E0
_08128B08:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128BFC
	movs r0, 0x12
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08128B24 @ =gUnknown_203B0E0
	ldr r1, [r0]
	b _08128BDA
	.align 2, 0
_08128B24: .4byte gUnknown_203B0E0
_08128B28:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128BFC
	ldr r4, _08128B48 @ =gUnknown_203B0E0
	ldr r0, [r4]
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r1
	bl sub_81295EC
	ldr r1, [r4]
	b _08128BDA
	.align 2, 0
_08128B48: .4byte gUnknown_203B0E0
_08128B4C:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _08128BFC
	bl sub_80FBA1C
	cmp r0, 0
	bne _08128BFC
	ldr r4, _08128B7C @ =gUnknown_203B0E0
	ldr r1, [r4]
	movs r0, 0xC8
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	movs r2, 0x28
	bl SendBlock
	lsls r0, 24
	cmp r0, 0
	beq _08128BFC
	ldr r1, [r4]
	b _08128BDA
	.align 2, 0
_08128B7C: .4byte gUnknown_203B0E0
_08128B80:
	bl GetBlockReceivedStatus
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08128BFC
	bl sub_80FBA1C
	cmp r0, 0
	bne _08128BFC
	ldr r0, _08128B9C @ =gUnknown_203B0E0
	ldr r1, [r0]
	b _08128BDA
	.align 2, 0
_08128B9C: .4byte gUnknown_203B0E0
_08128BA0:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _08128BFC
	bl sub_80FBA1C
	adds r4, r0, 0
	cmp r4, 0
	bne _08128BFC
	bl sub_800AAC0
	ldr r0, _08128BC0 @ =gUnknown_203B0E0
	ldr r1, [r0]
	strh r4, [r1, 0xA]
	b _08128BDA
	.align 2, 0
_08128BC0: .4byte gUnknown_203B0E0
_08128BC4:
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bhi _08128BD0
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08128BD0:
	ldr r0, _08128BE4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08128BFC
	ldr r1, [r2]
_08128BDA:
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _08128BFC
	.align 2, 0
_08128BE4: .4byte gReceivedRemoteLinkPlayers
_08128BE8:
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bls _08128BF8
	movs r0, 0x9
	bl sub_8129218
	b _08128BFC
_08128BF8:
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08128BFC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8128AA0

	thumb_func_start sub_8128C04
sub_8128C04: @ 8128C04
	push {r4,r5,lr}
	ldr r5, _08128C1C @ =gUnknown_203B0E0
	ldr r1, [r5]
	ldrh r0, [r1, 0x6]
	cmp r0, 0x1
	beq _08128C44
	cmp r0, 0x1
	bgt _08128C20
	cmp r0, 0
	beq _08128C2A
	b _08128CA2
	.align 2, 0
_08128C1C: .4byte gUnknown_203B0E0
_08128C20:
	cmp r0, 0x2
	beq _08128C6E
	cmp r0, 0x3
	beq _08128C90
	b _08128CA2
_08128C2A:
	ldr r0, _08128C40 @ =sub_81298F8
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08128CA2
	movs r0, 0x7
	movs r1, 0
	bl sub_8129C34
	b _08128C80
	.align 2, 0
_08128C40: .4byte sub_81298F8
_08128C44:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128CA2
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _08128CA2
	bl sub_80FBA1C
	adds r4, r0, 0
	cmp r4, 0
	bne _08128CA2
	bl sub_800AAC0
	ldr r1, [r5]
	strh r4, [r1, 0xA]
	b _08128C82
_08128C6E:
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bhi _08128C78
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08128C78:
	ldr r0, _08128C8C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08128CA2
_08128C80:
	ldr r1, [r5]
_08128C82:
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _08128CA2
	.align 2, 0
_08128C8C: .4byte gReceivedRemoteLinkPlayers
_08128C90:
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bls _08128C9E
	movs r0, 0x9
	bl sub_8129218
	b _08128CA2
_08128C9E:
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08128CA2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8128C04

	thumb_func_start sub_8128CA8
sub_8128CA8: @ 8128CA8
	push {r4,lr}
	ldr r1, _08128CC0 @ =gUnknown_203B0E0
	ldr r0, [r1]
	ldrh r0, [r0, 0x6]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _08128D9C
	lsls r0, 2
	ldr r1, _08128CC4 @ =_08128CC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08128CC0: .4byte gUnknown_203B0E0
_08128CC4: .4byte _08128CC8
	.align 2, 0
_08128CC8:
	.4byte _08128CDC
	.4byte _08128D08
	.4byte _08128D30
	.4byte _08128D64
	.4byte _08128D88
_08128CDC:
	ldr r0, _08128D00 @ =sub_81298F8
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08128D9C
	ldr r4, _08128D04 @ =gUnknown_203B0E0
	ldr r0, [r4]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _08128CFA
	movs r0, 0x7
	movs r1, 0
	bl sub_8129C34
_08128CFA:
	ldr r1, [r4]
	b _08128D7A
	.align 2, 0
_08128D00: .4byte sub_81298F8
_08128D04: .4byte gUnknown_203B0E0
_08128D08:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128D9C
	ldr r4, _08128D2C @ =gUnknown_203B0E0
	ldr r0, [r4]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _08128D26
	movs r0, 0x13
	movs r1, 0
	bl sub_8129C34
_08128D26:
	ldr r1, [r4]
	b _08128D7A
	.align 2, 0
_08128D2C: .4byte gUnknown_203B0E0
_08128D30:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08128D9C
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _08128D9C
	bl sub_80FBA1C
	adds r4, r0, 0
	cmp r4, 0
	bne _08128D9C
	bl sub_800AAC0
	ldr r0, _08128D60 @ =gUnknown_203B0E0
	ldr r1, [r0]
	strh r4, [r1, 0xA]
	b _08128D7A
	.align 2, 0
_08128D60: .4byte gUnknown_203B0E0
_08128D64:
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bhi _08128D70
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08128D70:
	ldr r0, _08128D84 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08128D9C
	ldr r1, [r2]
_08128D7A:
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _08128D9C
	.align 2, 0
_08128D84: .4byte gReceivedRemoteLinkPlayers
_08128D88:
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x95
	bls _08128D98
	movs r0, 0x9
	bl sub_8129218
	b _08128D9C
_08128D98:
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08128D9C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8128CA8

	thumb_func_start sub_8128DA4
sub_8128DA4: @ 8128DA4
	push {r4,lr}
	ldr r1, _08128DBC @ =gUnknown_203B0E0
	ldr r0, [r1]
	ldrh r0, [r0, 0x6]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _08128E70
	lsls r0, 2
	ldr r1, _08128DC0 @ =_08128DC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08128DBC: .4byte gUnknown_203B0E0
_08128DC0: .4byte _08128DC4
	.align 2, 0
_08128DC4:
	.4byte _08128DD8
	.4byte _08128E00
	.4byte _08128E34
	.4byte _08128E42
	.4byte _08128E60
_08128DD8:
	ldr r0, _08128DE8 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08128DEC
	movs r0, 0x1
	bl sub_8129218
	b _08128E70
	.align 2, 0
_08128DE8: .4byte gReceivedRemoteLinkPlayers
_08128DEC:
	ldr r0, [r4]
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r1
	bl sub_8129590
	ldr r1, [r4]
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
_08128E00:
	bl sub_800A4BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08128E70
	bl sub_80FBA1C
	cmp r0, 0
	bne _08128E70
	ldr r4, _08128E30 @ =gUnknown_203B0E0
	ldr r1, [r4]
	movs r0, 0xC8
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	movs r2, 0x28
	bl SendBlock
	lsls r0, 24
	cmp r0, 0
	beq _08128E70
	ldr r1, [r4]
	b _08128E52
	.align 2, 0
_08128E30: .4byte gUnknown_203B0E0
_08128E34:
	bl sub_8129454
	movs r0, 0x8
	movs r1, 0
	bl sub_8129C34
	b _08128E4E
_08128E42:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128E70
_08128E4E:
	ldr r0, _08128E5C @ =gUnknown_203B0E0
	ldr r1, [r0]
_08128E52:
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	b _08128E70
	.align 2, 0
_08128E5C: .4byte gUnknown_203B0E0
_08128E60:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _08128E70
	movs r0, 0x1
	bl sub_8129218
_08128E70:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8128DA4

	thumb_func_start sub_8128E78
sub_8128E78: @ 8128E78
	push {r4,lr}
	ldr r0, _08128E90 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrh r0, [r0, 0x6]
	cmp r0, 0x6
	bls _08128E86
	b _08128FA8
_08128E86:
	lsls r0, 2
	ldr r1, _08128E94 @ =_08128E98
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08128E90: .4byte gUnknown_203B0E0
_08128E94: .4byte _08128E98
	.align 2, 0
_08128E98:
	.4byte _08128EB4
	.4byte _08128EE4
	.4byte _08128F38
	.4byte _08128F50
	.4byte _08128F60
	.4byte _08128F74
	.4byte _08128F8C
_08128EB4:
	bl sub_8129408
	cmp r0, 0
	beq _08128ED0
	movs r0, 0x9
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08128ECC @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x2
	b _08128FA6
	.align 2, 0
_08128ECC: .4byte gUnknown_203B0E0
_08128ED0:
	movs r0, 0xD
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08128EE0 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x5
	b _08128FA6
	.align 2, 0
_08128EE0: .4byte gUnknown_203B0E0
_08128EE4:
	ldr r0, _08128F04 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08128F0C
	bl sub_8129424
	movs r0, 0xB
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08128F08 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x3
	b _08128FA6
	.align 2, 0
_08128F04: .4byte gMain
_08128F08: .4byte gUnknown_203B0E0
_08128F0C:
	movs r4, 0x2
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08128F1A
	movs r0, 0xA
	b _08128F9A
_08128F1A:
	bl sub_8129228
	cmp r0, 0
	beq _08128FA8
	movs r0, 0x1
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08128F34 @ =gUnknown_203B0E0
	ldr r0, [r0]
	strh r4, [r0, 0x6]
	b _08128FA8
	.align 2, 0
_08128F34: .4byte gUnknown_203B0E0
_08128F38:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128FA8
	ldr r0, _08128F4C @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x1
	b _08128FA6
	.align 2, 0
_08128F4C: .4byte gUnknown_203B0E0
_08128F50:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128FA8
	movs r0, 0xA
	b _08128F9A
_08128F60:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128FA8
	movs r0, 0x1
	bl sub_8129218
	b _08128FA8
_08128F74:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08128FA8
	ldr r0, _08128F88 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x6
	b _08128FA6
	.align 2, 0
_08128F88: .4byte gUnknown_203B0E0
_08128F8C:
	ldr r0, _08128FB0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08128FA8
	movs r0, 0x7
_08128F9A:
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08128FB4 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x4
_08128FA6:
	strh r0, [r1, 0x6]
_08128FA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128FB0: .4byte gMain
_08128FB4: .4byte gUnknown_203B0E0
	thumb_func_end sub_8128E78

	thumb_func_start sub_8128FB8
sub_8128FB8: @ 8128FB8
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _08128FD4 @ =gUnknown_203B0E0
	ldr r0, [r1]
	ldrh r0, [r0, 0x6]
	adds r4, r1, 0
	cmp r0, 0xD
	bls _08128FCA
	b _08129206
_08128FCA:
	lsls r0, 2
	ldr r1, _08128FD8 @ =_08128FDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08128FD4: .4byte gUnknown_203B0E0
_08128FD8: .4byte _08128FDC
	.align 2, 0
_08128FDC:
	.4byte _08129014
	.4byte _0812902E
	.4byte _08129054
	.4byte _08129098
	.4byte _081290BC
	.4byte _081290D8
	.4byte _0812911C
	.4byte _08129144
	.4byte _08129168
	.4byte _08129180
	.4byte _081291A4
	.4byte _081291B2
	.4byte _081291C8
	.4byte _081291E8
_08129014:
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	bne _0812901E
	b _081291C2
_0812901E:
	movs r0, 0x7
	movs r1, 0
	bl sub_8129C34
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0x6]
	b _08129206
_0812902E:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	beq _0812903C
	b _08129206
_0812903C:
	movs r0, 0xE
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08129050 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x2
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_08129050: .4byte gUnknown_203B0E0
_08129054:
	bl sub_812A568
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08129080
	cmp r1, 0
	bgt _0812906E
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08129074
	b _08129206
_0812906E:
	cmp r1, 0x1
	beq _08129074
	b _08129206
_08129074:
	ldr r0, _0812907C @ =gUnknown_203B0E0
	ldr r1, [r0]
	b _081291C2
	.align 2, 0
_0812907C: .4byte gUnknown_203B0E0
_08129080:
	movs r0, 0x7
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08129094 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x3
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_08129094: .4byte gUnknown_203B0E0
_08129098:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	beq _081290A6
	b _08129206
_081290A6:
	movs r0, 0xF
	movs r1, 0
	bl sub_8129C34
	ldr r0, _081290B8 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x4
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_081290B8: .4byte gUnknown_203B0E0
_081290BC:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	beq _081290CA
	b _08129206
_081290CA:
	ldr r0, _081290D4 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x5
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_081290D4: .4byte gUnknown_203B0E0
_081290D8:
	bl sub_812A568
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08129104
	cmp r1, 0
	bgt _081290F2
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _081290F8
	b _08129206
_081290F2:
	cmp r1, 0x1
	beq _081290F8
	b _08129206
_081290F8:
	ldr r0, _08129100 @ =gUnknown_203B0E0
	ldr r1, [r0]
	b _081291C2
	.align 2, 0
_08129100: .4byte gUnknown_203B0E0
_08129104:
	movs r0, 0x7
	movs r1, 0
	bl sub_8129C34
	ldr r0, _08129118 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x6
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_08129118: .4byte gUnknown_203B0E0
_0812911C:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08129206
	movs r0, 0x10
	movs r1, 0
	bl sub_8129C34
	bl sub_8129470
	ldr r0, _08129140 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x7
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_08129140: .4byte gUnknown_203B0E0
_08129144:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08129206
	bl sub_804C1C0
	movs r0, 0
	bl TrySavingData
	ldr r0, _08129164 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x8
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_08129164: .4byte gUnknown_203B0E0
_08129168:
	movs r0, 0x11
	movs r1, 0
	bl sub_8129C34
	ldr r0, _0812917C @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x9
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_0812917C: .4byte gUnknown_203B0E0
_08129180:
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08129206
	movs r0, 0x30
	bl PlaySE
	bl sav2_gender2_inplace_and_xFE
	ldr r0, _081291A0 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0xA
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_081291A0: .4byte gUnknown_203B0E0
_081291A4:
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x19]
	ldr r1, [r4]
	movs r0, 0xB
	strh r0, [r1, 0x6]
	b _08129206
_081291B2:
	ldr r0, [r4]
	ldrb r1, [r0, 0x19]
	adds r1, 0x1
	strb r1, [r0, 0x19]
	ldr r1, [r4]
	ldrb r0, [r1, 0x19]
	cmp r0, 0x78
	bls _08129206
_081291C2:
	movs r0, 0xC
	strh r0, [r1, 0x6]
	b _08129206
_081291C8:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081291E4 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0xD
	strh r0, [r1, 0x6]
	b _08129206
	.align 2, 0
_081291E4: .4byte gUnknown_203B0E0
_081291E8:
	ldr r0, _08129210 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08129206
	bl sub_812B4B8
	bl sub_8129B88
	bl sub_81284BC
	ldr r0, _08129214 @ =CB2_ReturnToField
	bl SetMainCallback2
_08129206:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129210: .4byte gPaletteFade
_08129214: .4byte CB2_ReturnToField
	thumb_func_end sub_8128FB8

	thumb_func_start sub_8129218
sub_8129218: @ 8129218
	ldr r1, _08129224 @ =gUnknown_203B0E0
	ldr r1, [r1]
	movs r2, 0
	strh r0, [r1, 0x4]
	strh r2, [r1, 0x6]
	bx lr
	.align 2, 0
_08129224: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129218

	thumb_func_start sub_8129228
sub_8129228: @ 8129228
	push {lr}
	ldr r0, _08129258 @ =gMain
	ldrh r2, [r0, 0x30]
	movs r0, 0x40
	ands r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _081292B2
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08129268
	ldr r0, _0812925C @ =gUnknown_203B0E0
	ldr r2, [r0]
	ldr r1, _08129260 @ =gUnknown_845A8A8
	ldrb r0, [r2, 0x10]
	adds r0, r1
	ldrb r1, [r2, 0x12]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08129264
	adds r0, r1, 0x1
	b _081292CC
	.align 2, 0
_08129258: .4byte gMain
_0812925C: .4byte gUnknown_203B0E0
_08129260: .4byte gUnknown_845A8A8
_08129264:
	strb r3, [r2, 0x12]
	b _081292CE
_08129268:
	ldr r0, _0812928C @ =gUnknown_203B0E0
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	cmp r0, 0x3
	beq _081292AE
	movs r0, 0x20
	ands r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _08129296
	ldrb r0, [r1, 0x11]
	cmp r0, 0
	beq _08129290
	subs r0, 0x1
	strb r0, [r1, 0x11]
	b _081292CE
	.align 2, 0
_0812928C: .4byte gUnknown_203B0E0
_08129290:
	movs r0, 0x4
	strb r0, [r1, 0x11]
	b _081292CE
_08129296:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _081292AE
	ldrb r0, [r1, 0x11]
	cmp r0, 0x3
	bhi _081292AA
	adds r0, 0x1
	strb r0, [r1, 0x11]
	b _081292CE
_081292AA:
	strb r3, [r1, 0x11]
	b _081292CE
_081292AE:
	movs r0, 0
	b _081292D0
_081292B2:
	ldr r0, _081292C0 @ =gUnknown_203B0E0
	ldr r2, [r0]
	ldrb r0, [r2, 0x12]
	cmp r0, 0
	beq _081292C4
	subs r0, 0x1
	b _081292CC
	.align 2, 0
_081292C0: .4byte gUnknown_203B0E0
_081292C4:
	ldr r0, _081292D4 @ =gUnknown_845A8A8
	ldrb r1, [r2, 0x10]
	adds r1, r0
	ldrb r0, [r1]
_081292CC:
	strb r0, [r2, 0x12]
_081292CE:
	movs r0, 0x1
_081292D0:
	pop {r1}
	bx r1
	.align 2, 0
_081292D4: .4byte gUnknown_845A8A8
	thumb_func_end sub_8129228

	thumb_func_start sub_81292D8
sub_81292D8: @ 81292D8
	push {r4-r6,lr}
	sub sp, 0x18
	ldr r0, _08129318 @ =gUnknown_203B0E0
	ldr r5, [r0]
	ldrb r0, [r5, 0x10]
	cmp r0, 0x3
	beq _08129320
	ldr r3, _0812931C @ =gUnknown_845A9AC
	ldrb r1, [r5, 0x12]
	lsls r1, 2
	adds r2, r0, 0
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldr r4, [r1]
	ldrb r0, [r5, 0x11]
	cmp r0, 0
	beq _08129312
	adds r1, r0, 0
_08129302:
	ldrb r0, [r4]
	cmp r0, 0xF9
	bne _0812930A
	adds r4, 0x1
_0812930A:
	adds r4, 0x1
	subs r1, 0x1
	cmp r1, 0
	bne _08129302
_08129312:
	movs r5, 0x1
	b _08129346
	.align 2, 0
_08129318: .4byte gUnknown_203B0E0
_0812931C: .4byte gUnknown_845A9AC
_08129320:
	ldrb r0, [r5, 0x12]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r0
	adds r1, 0xB9
	adds r1, r5, r1
	mov r0, sp
	bl StringCopy
	movs r1, 0
	strb r1, [r0]
	movs r1, 0xFF
	strb r1, [r0, 0x1]
	mov r4, sp
	mov r0, sp
	bl StringLength_Multibyte
	adds r5, r0, 0
_08129346:
	ldr r6, _081293A8 @ =gUnknown_203B0E0
	ldr r1, [r6]
	ldrb r0, [r1, 0x15]
	strb r0, [r1, 0x14]
	cmp r4, 0
	beq _0812939E
	bl sub_81294C8
	adds r2, r0, 0
	subs r5, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _0812939A
	ldr r0, [r6]
	ldrb r0, [r0, 0x15]
	cmp r0, 0xE
	bhi _0812939A
	adds r3, r6, 0
_0812936C:
	ldrb r0, [r4]
	cmp r0, 0xF9
	bne _08129378
	strb r0, [r2]
	adds r4, 0x1
	adds r2, 0x1
_08129378:
	ldrb r0, [r4]
	strb r0, [r2]
	adds r4, 0x1
	adds r2, 0x1
	ldr r1, [r3]
	ldrb r0, [r1, 0x15]
	adds r0, 0x1
	strb r0, [r1, 0x15]
	subs r5, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _0812939A
	ldr r0, [r3]
	ldrb r0, [r0, 0x15]
	cmp r0, 0xE
	bls _0812936C
_0812939A:
	movs r0, 0xFF
	strb r0, [r2]
_0812939E:
	add sp, 0x18
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081293A8: .4byte gUnknown_203B0E0
	thumb_func_end sub_81292D8

	thumb_func_start sub_81293AC
sub_81293AC: @ 81293AC
	push {r4,lr}
	ldr r4, _081293D4 @ =gUnknown_203B0E0
	ldr r1, [r4]
	ldrb r0, [r1, 0x15]
	strb r0, [r1, 0x14]
	ldr r0, [r4]
	ldrb r0, [r0, 0x15]
	cmp r0, 0
	beq _081293CE
	bl sub_81294EC
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r0, [r1, 0x15]
	subs r0, 0x1
	strb r0, [r1, 0x15]
_081293CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081293D4: .4byte gUnknown_203B0E0
	thumb_func_end sub_81293AC

	thumb_func_start sub_81293D8
sub_81293D8: @ 81293D8
	push {lr}
	ldr r0, _08129400 @ =gUnknown_203B0E0
	ldr r1, [r0]
	ldrb r0, [r1, 0x15]
	subs r0, 0x1
	strb r0, [r1, 0x14]
	bl sub_81294EC
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r0, 0xF9
	beq _081293FC
	ldr r1, _08129404 @ =gUnknown_845A8AC
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _081293FC
	strb r0, [r2]
_081293FC:
	pop {r0}
	bx r0
	.align 2, 0
_08129400: .4byte gUnknown_203B0E0
_08129404: .4byte gUnknown_845A8AC
	thumb_func_end sub_81293D8

	thumb_func_start sub_8129408
sub_8129408: @ 8129408
	push {lr}
	ldr r0, _08129418 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x15]
	cmp r0, 0
	bne _0812941C
	movs r0, 0
	b _0812941E
	.align 2, 0
_08129418: .4byte gUnknown_203B0E0
_0812941C:
	movs r0, 0x1
_0812941E:
	pop {r1}
	bx r1
	thumb_func_end sub_8129408

	thumb_func_start sub_8129424
sub_8129424: @ 8129424
	push {r4,lr}
	bl sub_8129758
	adds r1, r0, 0
	ldr r4, _08129450 @ =gUnknown_203B0E0
	ldr r0, [r4]
	ldrb r3, [r0, 0x12]
	lsls r2, r3, 2
	adds r2, r3
	lsls r2, 2
	adds r2, r3
	adds r2, 0xB9
	adds r0, r2
	bl StringCopy
	ldr r1, [r4]
	movs r0, 0x1
	strb r0, [r1, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129450: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129424

	thumb_func_start sub_8129454
sub_8129454: @ 8129454
	ldr r1, _0812946C @ =gUnknown_203B0E0
	ldr r2, [r1]
	movs r0, 0xFF
	strb r0, [r2, 0x1A]
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0xF
	strb r0, [r2, 0x14]
	ldr r0, [r1]
	strb r3, [r0, 0x15]
	bx lr
	.align 2, 0
_0812946C: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129454

	thumb_func_start sub_8129470
sub_8129470: @ 8129470
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _081294A4 @ =gSaveBlock1Ptr
	mov r8, r0
	ldr r7, _081294A8 @ =gUnknown_203B0E0
	movs r6, 0xB9
	ldr r5, _081294AC @ =0x00003ad4
	movs r4, 0x9
_08129482:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5
	ldr r1, [r7]
	adds r1, r6
	bl StringCopy
	adds r6, 0x15
	adds r5, 0x15
	subs r4, 0x1
	cmp r4, 0
	bge _08129482
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081294A4: .4byte gSaveBlock1Ptr
_081294A8: .4byte gUnknown_203B0E0
_081294AC: .4byte 0x00003ad4
	thumb_func_end sub_8129470

	thumb_func_start sub_81294B0
sub_81294B0: @ 81294B0
	ldr r2, _081294C4 @ =gUnknown_203B0E0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r0
	adds r1, 0xB9
	ldr r0, [r2]
	adds r0, r1
	bx lr
	.align 2, 0
_081294C4: .4byte gUnknown_203B0E0
	thumb_func_end sub_81294B0

	thumb_func_start sub_81294C8
sub_81294C8: @ 81294C8
	push {lr}
	ldr r0, _081294E8 @ =gUnknown_203B0E0
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x1A
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xFF
	beq _081294E0
_081294D8:
	adds r1, 0x1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _081294D8
_081294E0:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_081294E8: .4byte gUnknown_203B0E0
	thumb_func_end sub_81294C8

	thumb_func_start sub_81294EC
sub_81294EC: @ 81294EC
	push {lr}
	ldr r0, _08129518 @ =gUnknown_203B0E0
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0x1A
	adds r1, r2, 0
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xFF
	beq _08129510
_081294FE:
	adds r2, r1, 0
	ldrb r0, [r2]
	cmp r0, 0xF9
	bne _08129508
	adds r1, r2, 0x1
_08129508:
	adds r1, 0x1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _081294FE
_08129510:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_08129518: .4byte gUnknown_203B0E0
	thumb_func_end sub_81294EC

	thumb_func_start sub_812951C
sub_812951C: @ 812951C
	push {r4,lr}
	ldr r4, _0812955C @ =gUnknown_203B0E0
	ldr r0, [r4]
	adds r0, 0x1A
	bl StringLength_Multibyte
	adds r2, r0, 0
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x1A
	movs r4, 0
	cmp r2, 0xA
	bls _08129550
	subs r2, 0xA
	movs r3, 0
	cmp r4, r2
	bcs _08129550
_0812953E:
	ldrb r0, [r1]
	cmp r0, 0xF9
	bne _08129546
	adds r1, 0x1
_08129546:
	adds r1, 0x1
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, r2
	bcc _0812953E
_08129550:
	lsls r0, r4, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812955C: .4byte gUnknown_203B0E0
	thumb_func_end sub_812951C

	thumb_func_start sub_8129560
sub_8129560: @ 8129560
	movs r1, 0
	strb r1, [r0]
	bx lr
	thumb_func_end sub_8129560

	thumb_func_start sub_8129568
sub_8129568: @ 8129568
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, _08129588 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _0812958C @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	strb r0, [r4, 0x9]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129588: .4byte gSaveBlock2Ptr
_0812958C: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129568

	thumb_func_start sub_8129590
sub_8129590: @ 8129590
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, _081295B8 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	adds r4, 0x9
	ldr r0, _081295BC @ =gUnknown_203B0E0
	ldr r1, [r0]
	adds r1, 0x1A
	adds r0, r4, 0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081295B8: .4byte gSaveBlock2Ptr
_081295BC: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129590

	thumb_func_start sub_81295C0
sub_81295C0: @ 81295C0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, _081295E4 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _081295E8 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	strb r0, [r4, 0x9]
	bl sub_80FB9D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081295E4: .4byte gSaveBlock2Ptr
_081295E8: .4byte gUnknown_203B0E0
	thumb_func_end sub_81295C0

	thumb_func_start sub_81295EC
sub_81295EC: @ 81295EC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x4
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, _0812960C @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08129610 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	strb r0, [r4, 0x9]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812960C: .4byte gSaveBlock2Ptr
_08129610: .4byte gUnknown_203B0E0
	thumb_func_end sub_81295EC

	thumb_func_start sub_8129614
sub_8129614: @ 8129614
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5
	strb r0, [r4]
	adds r0, r4, 0x1
	ldr r1, _08129634 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08129638 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	strb r0, [r4, 0x9]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129634: .4byte gSaveBlock2Ptr
_08129638: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129614

	thumb_func_start sub_812963C
sub_812963C: @ 812963C
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	ldrb r0, [r5]
	adds r1, r0, 0
	adds r4, r5, 0x1
	adds r5, r4, 0
	adds r5, 0x8
	cmp r0, 0x2
	beq _08129664
	cmp r0, 0x2
	bgt _0812965A
	cmp r0, 0x1
	beq _08129688
	b _081296EC
_0812965A:
	cmp r1, 0x3
	beq _081296BE
	cmp r1, 0x5
	beq _081296B2
	b _081296EC
_08129664:
	ldr r0, _08129680 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	beq _081296EC
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, 0
	adds r1, r4, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, _08129684 @ =gUnknown_841B3AA
	b _081296D8
	.align 2, 0
_08129680: .4byte gUnknown_203B0E0
_08129684: .4byte gUnknown_841B3AA
_08129688:
	adds r0, r6, 0
	adds r1, r4, 0
	bl StringCopy
	movs r1, 0xFC
	strb r1, [r0]
	adds r0, 0x1
	movs r1, 0x13
	strb r1, [r0]
	adds r0, 0x1
	movs r1, 0x2A
	strb r1, [r0]
	adds r0, 0x1
	movs r1, 0xF0
	strb r1, [r0]
	adds r0, 0x1
	adds r1, r5, 0
	bl StringCopy
	movs r0, 0x1
	b _081296EE
_081296B2:
	ldr r0, _081296E4 @ =gUnknown_203B0E0
	ldr r0, [r0]
	adds r0, 0x79
	adds r1, r4, 0
	bl StringCopy
_081296BE:
	ldr r0, _081296E4 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	ldrb r5, [r5]
	cmp r0, r5
	beq _081296EC
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, 0
	adds r1, r4, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, _081296E8 @ =gUnknown_841B3BE
_081296D8:
	adds r0, r6, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	movs r0, 0x1
	b _081296EE
	.align 2, 0
_081296E4: .4byte gUnknown_203B0E0
_081296E8: .4byte gUnknown_841B3BE
_081296EC:
	movs r0, 0
_081296EE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_812963C

	thumb_func_start sub_81296F4
sub_81296F4: @ 81296F4
	ldr r0, _081296FC @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x10]
	bx lr
	.align 2, 0
_081296FC: .4byte gUnknown_203B0E0
	thumb_func_end sub_81296F4

	thumb_func_start sub_8129700
sub_8129700: @ 8129700
	ldr r2, _08129710 @ =gUnknown_203B0E0
	ldr r3, [r2]
	ldrb r2, [r3, 0x11]
	strb r2, [r0]
	ldrb r0, [r3, 0x12]
	strb r0, [r1]
	bx lr
	.align 2, 0
_08129710: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129700

	thumb_func_start sub_8129714
sub_8129714: @ 8129714
	ldr r0, _0812971C @ =gUnknown_203B0E0
	ldr r0, [r0]
	adds r0, 0x1A
	bx lr
	.align 2, 0
_0812971C: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129714

	thumb_func_start sub_8129720
sub_8129720: @ 8129720
	push {lr}
	bl sub_8129714
	bl StringLength_Multibyte
	pop {r1}
	bx r1
	thumb_func_end sub_8129720

	thumb_func_start sub_8129730
sub_8129730: @ 8129730
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08129748 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r3, [r0, 0x15]
	ldrb r2, [r0, 0x14]
	subs r0, r3, r2
	cmp r0, 0
	bge _0812974C
	negs r0, r0
	str r3, [r4]
	b _0812974E
	.align 2, 0
_08129748: .4byte gUnknown_203B0E0
_0812974C:
	str r2, [r4]
_0812974E:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8129730

	thumb_func_start sub_8129758
sub_8129758: @ 8129758
	push {lr}
	bl sub_812951C
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08129784 @ =gUnknown_203B0E0
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x1A
	cmp r2, 0
	beq _0812977E
_0812976E:
	ldrb r0, [r1]
	cmp r0, 0xF9
	bne _08129776
	adds r1, 0x1
_08129776:
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0812976E
_0812977E:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08129784: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129758

	thumb_func_start sub_8129788
sub_8129788: @ 8129788
	push {r4,lr}
	bl sub_812951C
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _081297C0 @ =gUnknown_203B0E0
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x1A
	movs r2, 0
	movs r3, 0
	cmp r2, r4
	bcs _081297B8
_081297A2:
	ldrb r0, [r1]
	cmp r0, 0xF9
	bne _081297AA
	adds r1, 0x1
_081297AA:
	adds r1, 0x1
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	adds r3, 0x1
	cmp r3, r4
	bcc _081297A2
_081297B8:
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081297C0: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129788

	thumb_func_start sub_81297C4
sub_81297C4: @ 81297C4
	ldr r0, _081297CC @ =gUnknown_203B0E0
	ldr r0, [r0]
	adds r0, 0x39
	bx lr
	.align 2, 0
_081297CC: .4byte gUnknown_203B0E0
	thumb_func_end sub_81297C4

	thumb_func_start sub_81297D0
sub_81297D0: @ 81297D0
	ldr r0, _081297D8 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x16]
	bx lr
	.align 2, 0
_081297D8: .4byte gUnknown_203B0E0
	thumb_func_end sub_81297D0

	thumb_func_start sub_81297DC
sub_81297DC: @ 81297DC
	ldr r0, _081297E4 @ =gUnknown_203B0E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x15]
	bx lr
	.align 2, 0
_081297E4: .4byte gUnknown_203B0E0
	thumb_func_end sub_81297DC

	thumb_func_start sub_81297E8
sub_81297E8: @ 81297E8
	push {lr}
	bl sub_81294EC
	ldrb r1, [r0]
	cmp r1, 0xFF
	bhi _08129802
	ldr r0, _08129808 @ =gUnknown_845A8AC
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r1
	beq _08129802
	cmp r0, 0
	bne _0812980C
_08129802:
	movs r0, 0x3
	b _0812980E
	.align 2, 0
_08129808: .4byte gUnknown_845A8AC
_0812980C:
	movs r0, 0
_0812980E:
	pop {r1}
	bx r1
	thumb_func_end sub_81297E8

	thumb_func_start sub_8129814
sub_8129814: @ 8129814
	ldr r0, _0812981C @ =gUnknown_203B0E0
	ldr r0, [r0]
	adds r0, 0x79
	bx lr
	.align 2, 0
_0812981C: .4byte gUnknown_203B0E0
	thumb_func_end sub_8129814

	thumb_func_start copy_strings_to_sav1
copy_strings_to_sav1: @ 8129820
	push {r4,lr}
	ldr r4, _081298A4 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	ldr r1, _081298A8 @ =0x00003ad4
	adds r0, r1
	ldr r1, _081298AC @ =gUnknown_841B510
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _081298B0 @ =0x00003ae9
	adds r0, r1
	ldr r1, _081298B4 @ =gUnknown_841B516
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _081298B8 @ =0x00003afe
	adds r0, r1
	ldr r1, _081298BC @ =gUnknown_841B51E
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _081298C0 @ =0x00003b13
	adds r0, r1
	ldr r1, _081298C4 @ =gUnknown_841B524
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _081298C8 @ =0x00003b28
	adds r0, r1
	ldr r1, _081298CC @ =gUnknown_841B52B
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _081298D0 @ =0x00003b3d
	adds r0, r1
	ldr r1, _081298D4 @ =gUnknown_841B531
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _081298D8 @ =0x00003b52
	adds r0, r1
	ldr r1, _081298DC @ =gUnknown_841B535
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _081298E0 @ =0x00003b67
	adds r0, r1
	ldr r1, _081298E4 @ =gUnknown_841B53B
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _081298E8 @ =0x00003b7c
	adds r0, r1
	ldr r1, _081298EC @ =gUnknown_841B541
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _081298F0 @ =0x00003b91
	adds r0, r1
	ldr r1, _081298F4 @ =gUnknown_841B54B
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081298A4: .4byte gSaveBlock1Ptr
_081298A8: .4byte 0x00003ad4
_081298AC: .4byte gUnknown_841B510
_081298B0: .4byte 0x00003ae9
_081298B4: .4byte gUnknown_841B516
_081298B8: .4byte 0x00003afe
_081298BC: .4byte gUnknown_841B51E
_081298C0: .4byte 0x00003b13
_081298C4: .4byte gUnknown_841B524
_081298C8: .4byte 0x00003b28
_081298CC: .4byte gUnknown_841B52B
_081298D0: .4byte 0x00003b3d
_081298D4: .4byte gUnknown_841B531
_081298D8: .4byte 0x00003b52
_081298DC: .4byte gUnknown_841B535
_081298E0: .4byte 0x00003b67
_081298E4: .4byte gUnknown_841B53B
_081298E8: .4byte 0x00003b7c
_081298EC: .4byte gUnknown_841B541
_081298F0: .4byte 0x00003b91
_081298F4: .4byte gUnknown_841B54B
	thumb_func_end copy_strings_to_sav1

	thumb_func_start sub_81298F8
sub_81298F8: @ 81298F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0812991C @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bls _08129912
	b _08129B08
_08129912:
	lsls r0, 2
	ldr r1, _08129920 @ =_08129924
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812991C: .4byte gTasks+0x8
_08129920: .4byte _08129924
	.align 2, 0
_08129924:
	.4byte _08129944
	.4byte _08129952
	.4byte _08129AEC
	.4byte _081299A0
	.4byte _08129A8C
	.4byte _08129AC4
	.4byte _08129AD8
	.4byte _08129A7C
_08129944:
	ldr r0, _08129978 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0812994E
	b _08129AE0
_0812994E:
	movs r0, 0x1
	strh r0, [r4]
_08129952:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	strh r0, [r4, 0x8]
	ldr r3, _0812997C @ =gUnknown_203B0E0
	ldr r0, [r3]
	ldrb r1, [r0, 0xD]
	movs r5, 0x8
	ldrsh r0, [r4, r5]
	cmp r1, r0
	beq _08129980
	movs r0, 0x2
	strh r0, [r4]
	ldr r0, [r3]
	strb r2, [r0, 0xD]
	b _08129B08
	.align 2, 0
_08129978: .4byte gReceivedRemoteLinkPlayers
_0812997C: .4byte gUnknown_203B0E0
_08129980:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x6]
	cmp r0, 0
	bne _08129998
	bl sub_80FBA1C
	cmp r0, 0
	beq _08129998
	b _08129B08
_08129998:
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x3
	strh r0, [r4]
_081299A0:
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bgt _081299DA
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	movs r3, 0x2
	ldrsh r1, [r4, r3]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081299DA
	movs r2, 0x1
_081299BC:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _081299DA
	movs r5, 0x6
	ldrsh r0, [r4, r5]
	movs r3, 0x2
	ldrsh r1, [r4, r3]
	asrs r0, r1
	ands r0, r2
	cmp r0, 0
	beq _081299BC
_081299DA:
	ldrh r1, [r4, 0x2]
	movs r5, 0x2
	ldrsh r0, [r4, r5]
	cmp r0, 0x5
	bne _081299E6
	b _08129B04
_081299E6:
	strh r1, [r4, 0x4]
	lsls r0, r1, 24
	lsrs r0, 24
	bl ResetBlockReceivedFlag
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	lsls r0, 8
	ldr r1, _08129A0C @ =gBlockRecvBuffer
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x4
	bhi _08129A28
	lsls r0, 2
	ldr r1, _08129A10 @ =_08129A14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08129A0C: .4byte gBlockRecvBuffer
_08129A10: .4byte _08129A14
	.align 2, 0
_08129A14:
	.4byte _08129A28
	.4byte _08129A2C
	.4byte _08129A30
	.4byte _08129A34
	.4byte _08129A38
_08129A28:
	movs r0, 0x3
	b _08129A3A
_08129A2C:
	movs r0, 0x3
	b _08129A3A
_08129A30:
	movs r0, 0x4
	b _08129A3A
_08129A34:
	movs r0, 0x5
	b _08129A3A
_08129A38:
	movs r0, 0x6
_08129A3A:
	strh r0, [r4, 0xA]
	ldr r5, _08129A68 @ =gUnknown_203B0E0
	ldr r0, [r5]
	adds r0, 0x39
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	lsls r1, 8
	ldr r2, _08129A6C @ =gBlockRecvBuffer
	adds r1, r2
	bl sub_812963C
	cmp r0, 0
	beq _08129A70
	ldr r0, [r5]
	ldrh r1, [r4, 0x2]
	strb r1, [r0, 0x16]
	movs r0, 0xC
	movs r1, 0x2
	bl sub_8129C34
	movs r0, 0x7
	b _08129A72
	.align 2, 0
_08129A68: .4byte gUnknown_203B0E0
_08129A6C: .4byte gBlockRecvBuffer
_08129A70:
	ldrh r0, [r4, 0xA]
_08129A72:
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	b _08129B08
_08129A7C:
	movs r0, 0x2
	bl sub_8129C8C
	lsls r0, 24
	cmp r0, 0
	bne _08129B08
	ldrh r0, [r4, 0xA]
	b _08129B06
_08129A8C:
	ldr r6, _08129AB4 @ =gUnknown_203B0E0
	ldr r0, [r6]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	bne _08129AC0
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08129AC0
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08129AB8
	bl sub_80FA4A8
	ldr r1, [r6]
	movs r0, 0x1
	b _08129ADE
	.align 2, 0
_08129AB4: .4byte gUnknown_203B0E0
_08129AB8:
	movs r5, 0x4
	ldrsh r0, [r4, r5]
	bl sub_80FBD6C
_08129AC0:
	movs r0, 0x3
	b _08129B06
_08129AC4:
	ldr r0, _08129AD4 @ =gUnknown_203B0E0
	ldr r1, [r0]
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	beq _08129AE0
	movs r0, 0x2
	b _08129ADE
	.align 2, 0
_08129AD4: .4byte gUnknown_203B0E0
_08129AD8:
	ldr r0, _08129AE8 @ =gUnknown_203B0E0
	ldr r1, [r0]
	movs r0, 0x3
_08129ADE:
	strb r0, [r1, 0x17]
_08129AE0:
	adds r0, r5, 0
	bl DestroyTask
	b _08129B08
	.align 2, 0
_08129AE8: .4byte gUnknown_203B0E0
_08129AEC:
	bl sub_80FBA1C
	cmp r0, 0
	bne _08129B08
	ldr r0, _08129B10 @ =gUnknown_203B0E0
	ldr r1, [r0]
	ldrb r0, [r1, 0x13]
	cmp r0, 0
	bne _08129B04
	ldrb r0, [r1, 0xD]
	bl sub_80FB030
_08129B04:
	movs r0, 0x1
_08129B06:
	strh r0, [r4]
_08129B08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08129B10: .4byte gUnknown_203B0E0
	thumb_func_end sub_81298F8

	thumb_func_start sub_8129B14
sub_8129B14: @ 8129B14
	push {r4,lr}
	ldr r4, _08129B60 @ =gUnknown_203B0E4
	ldr r0, _08129B64 @ =0x00002168
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _08129B70
	bl sub_812AE70
	cmp r0, 0
	beq _08129B70
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08129B68 @ =gUnknown_845AA84
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	ldr r0, _08129B6C @ =gUnknown_845AA94
	bl InitWindows
	bl ResetTempTileDataBuffers
	bl sub_812AD50
	ldr r0, [r4]
	bl sub_8129BB8
	bl sub_8129BC4
	movs r0, 0
	movs r1, 0
	bl sub_8129C34
	movs r0, 0x1
	b _08129B72
	.align 2, 0
_08129B60: .4byte gUnknown_203B0E4
_08129B64: .4byte 0x00002168
_08129B68: .4byte gUnknown_845AA84
_08129B6C: .4byte gUnknown_845AA94
_08129B70:
	movs r0, 0
_08129B72:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8129B14

	thumb_func_start sub_8129B78
sub_8129B78: @ 8129B78
	push {lr}
	movs r0, 0
	bl sub_8129C8C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8129B78

	thumb_func_start sub_8129B88
sub_8129B88: @ 8129B88
	push {r4,lr}
	bl sub_812AEB0
	ldr r4, _08129BB0 @ =gUnknown_203B0E4
	ldr r0, [r4]
	cmp r0, 0
	beq _08129B9E
	bl Free
	movs r0, 0
	str r0, [r4]
_08129B9E:
	bl FreeAllWindowBuffers
	ldr r1, _08129BB4 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129BB0: .4byte gUnknown_203B0E4
_08129BB4: .4byte gScanlineEffect
	thumb_func_end sub_8129B88

	thumb_func_start sub_8129BB8
sub_8129BB8: @ 8129BB8
	movs r2, 0
	movs r1, 0xFF
	strh r1, [r0, 0x18]
	strh r1, [r0, 0x1E]
	strh r2, [r0, 0x1A]
	bx lr
	thumb_func_end sub_8129BB8

	thumb_func_start sub_8129BC4
sub_8129BC4: @ 8129BC4
	push {r4,r5,lr}
	ldr r1, _08129BF4 @ =gUnknown_203B0E4
	ldr r0, [r1]
	cmp r0, 0
	beq _08129BEC
	movs r2, 0
	adds r4, r1, 0
	ldr r5, _08129BF8 @ =sub_812A420
	movs r3, 0
_08129BD6:
	ldr r0, [r4]
	lsls r1, r2, 3
	adds r0, r1
	str r5, [r0]
	strb r3, [r0, 0x4]
	ldr r0, [r4]
	adds r0, r1
	strb r3, [r0, 0x5]
	adds r2, 0x1
	cmp r2, 0x2
	ble _08129BD6
_08129BEC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08129BF4: .4byte gUnknown_203B0E4
_08129BF8: .4byte sub_812A420
	thumb_func_end sub_8129BC4

	thumb_func_start sub_8129BFC
sub_8129BFC: @ 8129BFC
	push {r4-r6,lr}
	ldr r1, _08129C30 @ =gUnknown_203B0E4
	ldr r0, [r1]
	cmp r0, 0
	beq _08129C2A
	movs r5, 0
	adds r6, r1, 0
_08129C0A:
	ldr r0, [r6]
	lsls r4, r5, 3
	adds r1, r0, r4
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08129C24
	adds r0, r1, 0x5
	ldr r1, [r1]
	bl _call_via_r1
	ldr r1, [r6]
	adds r1, r4
	strb r0, [r1, 0x4]
_08129C24:
	adds r5, 0x1
	cmp r5, 0x2
	ble _08129C0A
_08129C2A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08129C30: .4byte gUnknown_203B0E4
	thumb_func_end sub_8129BFC

	thumb_func_start sub_8129C34
sub_8129C34: @ 8129C34
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	ldr r3, _08129C70 @ =gUnknown_203B0E4
	ldr r0, [r3]
	lsrs r1, 21
	adds r0, r1
	ldr r2, _08129C74 @ =sub_812A420
	str r2, [r0]
	movs r4, 0
	adds r5, r3, 0
	adds r3, r1, 0
	mov r12, r4
	ldr r1, _08129C78 @ =gUnknown_845AABC
	movs r7, 0x1
	adds r2, r1, 0x4
_08129C56:
	ldrh r0, [r1]
	cmp r0, r6
	bne _08129C7C
	ldr r1, [r5]
	adds r1, r3
	ldr r0, [r2]
	str r0, [r1]
	strb r7, [r1, 0x4]
	ldr r0, [r5]
	adds r0, r3
	mov r1, r12
	strb r1, [r0, 0x5]
	b _08129C86
	.align 2, 0
_08129C70: .4byte gUnknown_203B0E4
_08129C74: .4byte sub_812A420
_08129C78: .4byte gUnknown_845AABC
_08129C7C:
	adds r1, 0x8
	adds r2, 0x8
	adds r4, 0x1
	cmp r4, 0x14
	bls _08129C56
_08129C86:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8129C34

	thumb_func_start sub_8129C8C
sub_8129C8C: @ 8129C8C
	lsls r0, 24
	ldr r1, _08129C9C @ =gUnknown_203B0E4
	ldr r1, [r1]
	lsrs r0, 21
	adds r1, r0
	ldrb r0, [r1, 0x4]
	bx lr
	.align 2, 0
_08129C9C: .4byte gUnknown_203B0E4
	thumb_func_end sub_8129C8C

	thumb_func_start sub_8129CA0
sub_8129CA0: @ 8129CA0
	push {r4,lr}
	adds r4, r0, 0
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08129D36
	ldrb r0, [r4]
	cmp r0, 0x6
	bhi _08129D2C
	lsls r0, 2
	ldr r1, _08129CC0 @ =_08129CC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08129CC0: .4byte _08129CC4
	.align 2, 0
_08129CC4:
	.4byte _08129CE0
	.4byte _08129CEA
	.4byte _08129CF0
	.4byte _08129CF6
	.4byte _08129CFC
	.4byte _08129D02
	.4byte _08129D14
_08129CE0:
	bl sub_812AAD4
	bl sub_812AB8C
	b _08129D30
_08129CEA:
	bl sub_812ABD8
	b _08129D30
_08129CF0:
	bl sub_812AC08
	b _08129D30
_08129CF6:
	bl sub_812AC58
	b _08129D30
_08129CFC:
	bl sub_812AC9C
	b _08129D30
_08129D02:
	bl sub_812ACC0
	bl sub_812ACEC
	bl sub_812AD20
	bl sub_812AD04
	b _08129D30
_08129D14:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08129D30
	bl sub_812AEC8
	bl sub_812B048
	bl sub_812B100
	b _08129D30
_08129D2C:
	movs r0, 0
	b _08129D38
_08129D30:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08129D36:
	movs r0, 0x1
_08129D38:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8129CA0

	thumb_func_start sub_8129D40
sub_8129D40: @ 8129D40
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08129D50
	cmp r0, 0x1
	beq _08129D5E
	b _08129D68
_08129D50:
	bl sub_812AA10
	movs r0, 0x3
	movs r1, 0x3
	bl CopyWindowToVram
	b _08129D68
_08129D5E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _08129D70
_08129D68:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
_08129D70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8129D40

	thumb_func_start sub_8129D78
sub_8129D78: @ 8129D78
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08129D88
	cmp r0, 0x1
	beq _08129D96
	b _08129DA0
_08129D88:
	bl sub_812AA64
	movs r0, 0x3
	movs r1, 0x3
	bl CopyWindowToVram
	b _08129DA0
_08129D96:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _08129DA8
_08129DA0:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
_08129DA8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8129D78

	thumb_func_start sub_8129DB0
sub_8129DB0: @ 8129DB0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08129DE6
	cmp r0, 0x1
	bgt _08129DC4
	cmp r0, 0
	beq _08129DCA
	b _08129E0C
_08129DC4:
	cmp r0, 0x2
	beq _08129DF2
	b _08129E0C
_08129DCA:
	movs r0, 0x1
	bl sub_812AEFC
	bl sub_812A980
	cmp r0, 0
	bne _08129E12
	bl sub_812A804
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	b _08129E0C
_08129DE6:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	beq _08129E0C
	b _08129E12
_08129DF2:
	bl sub_812A9C8
	cmp r0, 0
	bne _08129E12
	bl sub_812AF1C
	movs r0, 0
	bl sub_812AEFC
	bl sub_812B160
	movs r0, 0
	b _08129E14
_08129E0C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08129E12:
	movs r0, 0x1
_08129E14:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8129DB0

	thumb_func_start sub_8129E1C
sub_8129E1C: @ 8129E1C
	push {lr}
	bl sub_812AF1C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8129E1C

	thumb_func_start sub_8129E28
sub_8129E28: @ 8129E28
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08129E38
	cmp r0, 0x1
	beq _08129E5C
	b _08129E66
_08129E38:
	movs r0, 0
	movs r1, 0
	bl sub_812A578
	movs r0, 0x17
	movs r1, 0xB
	movs r2, 0x1
	bl sub_812A424
	ldr r0, _08129E58 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	b _08129E66
	.align 2, 0
_08129E58: .4byte gUnknown_203B0E4
_08129E5C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _08129E6E
_08129E66:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
_08129E6E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8129E28

	thumb_func_start sub_8129E74
sub_8129E74: @ 8129E74
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08129E84
	cmp r0, 0x1
	beq _08129E94
	b _08129EAA
_08129E84:
	bl sub_812A6F4
	bl sub_812A51C
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	b _08129EAA
_08129E94:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08129EB0
	bl sub_812A728
	bl sub_812A544
	movs r0, 0
	b _08129EB2
_08129EAA:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08129EB0:
	movs r0, 0x1
_08129EB2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8129E74

	thumb_func_start sub_8129EB8
sub_8129EB8: @ 8129EB8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08129ECA
	cmp r0, 0x1
	beq _08129F02
	b _08129F14
_08129ECA:
	add r1, sp, 0x8
	add r0, sp, 0x4
	bl sub_8129730
	ldr r0, [sp, 0x4]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp, 0x8]
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0
	bl sub_812A74C
	bl sub_8129714
	adds r1, r0, 0
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_812A778
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	b _08129F14
_08129F02:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08129F1A
	bl sub_812B160
	movs r0, 0
	b _08129F1C
_08129F14:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08129F1A:
	movs r0, 0x1
_08129F1C:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8129EB8

	thumb_func_start sub_8129F24
sub_8129F24: @ 8129F24
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08129F80
	cmp r0, 0x1
	bgt _08129F3A
	cmp r0, 0
	beq _08129F44
	b _08129FBA
_08129F3A:
	cmp r0, 0x2
	beq _08129FA4
	cmp r0, 0x3
	beq _08129FB6
	b _08129FBA
_08129F44:
	bl sub_8129788
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_8129758
	adds r5, r0, 0
	bl StringLength_Multibyte
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x66
	bl sub_812A74C
	movs r0, 0x5
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x4
	bl sub_812A778
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	b _08129FBA
_08129F80:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08129FC0
	movs r0, 0x1
	movs r1, 0x10
	bl sub_812A578
	ldr r0, _08129FA0 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	b _08129FBA
	.align 2, 0
_08129FA0: .4byte gUnknown_203B0E4
_08129FA4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08129FC0
	movs r0, 0x1
	bl sub_812AF8C
	b _08129FBA
_08129FB6:
	movs r0, 0
	b _08129FC2
_08129FBA:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_08129FC0:
	movs r0, 0x1
_08129FC2:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8129F24

	thumb_func_start sub_8129FCC
sub_8129FCC: @ 8129FCC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _0812A028
	cmp r0, 0x1
	bgt _08129FE2
	cmp r0, 0
	beq _08129FEC
	b _0812A062
_08129FE2:
	cmp r0, 0x2
	beq _0812A048
	cmp r0, 0x3
	beq _0812A05E
	b _0812A062
_08129FEC:
	bl sub_8129788
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_8129758
	adds r5, r0, 0
	bl StringLength_Multibyte
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_812A74C
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_812A778
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	b _0812A062
_0812A028:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0812A068
	bl sub_812A6F4
	ldr r0, _0812A044 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	b _0812A062
	.align 2, 0
_0812A044: .4byte gUnknown_203B0E4
_0812A048:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0812A068
	movs r0, 0
	bl sub_812AF8C
	bl sub_812A728
	b _0812A062
_0812A05E:
	movs r0, 0
	b _0812A06A
_0812A062:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_0812A068:
	movs r0, 0x1
_0812A06A:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8129FCC

	thumb_func_start sub_812A074
sub_812A074: @ 812A074
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A084
	cmp r0, 0x1
	beq _0812A098
	b _0812A0A6
_0812A084:
	bl sub_812A804
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A0A6
_0812A098:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0812A0A6
	movs r0, 0
	b _0812A0A8
_0812A0A6:
	movs r0, 0x1
_0812A0A8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A074

	thumb_func_start sub_812A0B0
sub_812A0B0: @ 812A0B0
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6]
	cmp r0, 0x4
	bhi _0812A182
	lsls r0, 2
	ldr r1, _0812A0C4 @ =_0812A0C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812A0C4: .4byte _0812A0C8
	.align 2, 0
_0812A0C8:
	.4byte _0812A0DC
	.4byte _0812A108
	.4byte _0812A138
	.4byte _0812A15C
	.4byte _0812A126
_0812A0DC:
	ldr r0, _0812A104 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrh r5, [r0, 0x1A]
	bl sub_81297C4
	adds r4, r0, 0
	bl sub_81297D0
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_812AA78
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	b _0812A17C
	.align 2, 0
_0812A104: .4byte gUnknown_203B0E4
_0812A108:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0812A182
	ldr r0, _0812A12C @ =gUnknown_203B0E4
	ldr r1, [r0]
	ldrh r0, [r1, 0x1A]
	cmp r0, 0x8
	bhi _0812A130
	adds r0, 0x1
	strh r0, [r1, 0x1A]
	movs r0, 0x4
	strb r0, [r6]
_0812A126:
	movs r0, 0
	b _0812A184
	.align 2, 0
_0812A12C: .4byte gUnknown_203B0E4
_0812A130:
	strh r2, [r1, 0x1C]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_0812A138:
	movs r0, 0
	movs r1, 0
	movs r2, 0x5
	movs r3, 0x11
	bl ScrollWindow
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, _0812A178 @ =gUnknown_203B0E4
	ldr r1, [r0]
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_0812A15C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0812A182
	ldr r0, _0812A178 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrh r0, [r0, 0x1C]
	cmp r0, 0x2
	bhi _0812A17C
	ldrb r0, [r6]
	subs r0, 0x1
	b _0812A180
	.align 2, 0
_0812A178: .4byte gUnknown_203B0E4
_0812A17C:
	ldrb r0, [r6]
	adds r0, 0x1
_0812A180:
	strb r0, [r6]
_0812A182:
	movs r0, 0x1
_0812A184:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_812A0B0

	thumb_func_start sub_812A18C
sub_812A18C: @ 812A18C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A19C
	cmp r0, 0x1
	beq _0812A1A8
	b _0812A1AE
_0812A19C:
	bl sub_812AFC0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A1AE
_0812A1A8:
	bl sub_812AFFC
	b _0812A1B0
_0812A1AE:
	movs r0, 0x1
_0812A1B0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A18C

	thumb_func_start sub_812A1B8
sub_812A1B8: @ 812A1B8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A1C8
	cmp r0, 0x1
	beq _0812A1E8
	b _0812A1F2
_0812A1C8:
	movs r0, 0x3
	movs r1, 0x10
	bl sub_812A578
	ldr r0, _0812A1E4 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A1F2
	.align 2, 0
_0812A1E4: .4byte gUnknown_203B0E4
_0812A1E8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A1F4
_0812A1F2:
	movs r0, 0x1
_0812A1F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A1B8

	thumb_func_start sub_812A1FC
sub_812A1FC: @ 812A1FC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A20C
	cmp r0, 0x1
	beq _0812A22C
	b _0812A236
_0812A20C:
	movs r0, 0x4
	movs r1, 0
	bl sub_812A578
	ldr r0, _0812A228 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A236
	.align 2, 0
_0812A228: .4byte gUnknown_203B0E4
_0812A22C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A238
_0812A236:
	movs r0, 0x1
_0812A238:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A1FC

	thumb_func_start sub_812A240
sub_812A240: @ 812A240
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A250
	cmp r0, 0x1
	beq _0812A280
	b _0812A28A
_0812A250:
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_8129814
	adds r1, r0, 0
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, 0x5
	movs r1, 0
	bl sub_812A578
	ldr r0, _0812A27C @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A28A
	.align 2, 0
_0812A27C: .4byte gUnknown_203B0E4
_0812A280:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A28C
_0812A28A:
	movs r0, 0x1
_0812A28C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A240

	thumb_func_start sub_812A294
sub_812A294: @ 812A294
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A2A4
	cmp r0, 0x1
	beq _0812A2D0
	b _0812A2DA
_0812A2A4:
	movs r0, 0x6
	movs r1, 0
	bl sub_812A578
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl sub_812A424
	ldr r0, _0812A2CC @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A2DA
	.align 2, 0
_0812A2CC: .4byte gUnknown_203B0E4
_0812A2D0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A2DC
_0812A2DA:
	movs r0, 0x1
_0812A2DC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A294

	thumb_func_start sub_812A2E4
sub_812A2E4: @ 812A2E4
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A2F4
	cmp r0, 0x1
	beq _0812A320
	b _0812A32A
_0812A2F4:
	movs r0, 0x7
	movs r1, 0
	bl sub_812A578
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl sub_812A424
	ldr r0, _0812A31C @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A32A
	.align 2, 0
_0812A31C: .4byte gUnknown_203B0E4
_0812A320:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A32C
_0812A32A:
	movs r0, 0x1
_0812A32C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A2E4

	thumb_func_start sub_812A334
sub_812A334: @ 812A334
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A344
	cmp r0, 0x1
	beq _0812A364
	b _0812A36E
_0812A344:
	movs r0, 0x8
	movs r1, 0
	bl sub_812A578
	ldr r0, _0812A360 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A36E
	.align 2, 0
_0812A360: .4byte gUnknown_203B0E4
_0812A364:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A370
_0812A36E:
	movs r0, 0x1
_0812A370:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A334

	thumb_func_start sub_812A378
sub_812A378: @ 812A378
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A388
	cmp r0, 0x1
	beq _0812A3BC
	b _0812A3C6
_0812A388:
	bl DynamicPlaceholderTextUtil_Reset
	ldr r0, _0812A3B4 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, 0x9
	movs r1, 0
	bl sub_812A578
	ldr r0, _0812A3B8 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A3C6
	.align 2, 0
_0812A3B4: .4byte gSaveBlock2Ptr
_0812A3B8: .4byte gUnknown_203B0E4
_0812A3BC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A3C8
_0812A3C6:
	movs r0, 0x1
_0812A3C8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A378

	thumb_func_start sub_812A3D0
sub_812A3D0: @ 812A3D0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812A3E0
	cmp r0, 0x1
	beq _0812A40C
	b _0812A416
_0812A3E0:
	movs r0, 0xA
	movs r1, 0
	bl sub_812A578
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl sub_812A424
	ldr r0, _0812A408 @ =gUnknown_203B0E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1E]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0812A416
	.align 2, 0
_0812A408: .4byte gUnknown_203B0E4
_0812A40C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0812A418
_0812A416:
	movs r0, 0x1
_0812A418:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A3D0

	thumb_func_start sub_812A420
sub_812A420: @ 812A420
	movs r0, 0
	bx lr
	thumb_func_end sub_812A420

	thumb_func_start sub_812A424
sub_812A424: @ 812A424
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r4, _0812A4FC @ =0xffffff00
	ldr r2, [sp, 0xC]
	ands r2, r4
	lsrs r0, 16
	ldr r3, _0812A500 @ =0xffff00ff
	ands r2, r3
	orrs r2, r0
	lsrs r1, 8
	ldr r0, _0812A504 @ =0xff00ffff
	ands r2, r0
	orrs r2, r1
	ldr r0, _0812A508 @ =0x00ffffff
	ands r2, r0
	movs r0, 0xC0
	lsls r0, 19
	orrs r2, r0
	str r2, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r4
	movs r1, 0x4
	orrs r0, r1
	ands r0, r3
	movs r1, 0xE0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _0812A50C @ =0x0000ffff
	ands r0, r1
	movs r1, 0xA4
	lsls r1, 15
	orrs r0, r1
	str r0, [sp, 0x10]
	add r0, sp, 0xC
	bl AddWindow
	adds r1, r0, 0
	ldr r6, _0812A510 @ =gUnknown_203B0E4
	ldr r0, [r6]
	movs r7, 0
	strh r1, [r0, 0x18]
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0xFF
	beq _0812A4F0
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	bl PutWindowTilemap
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	ldr r2, _0812A514 @ =gUnknown_8417938
	movs r5, 0x2
	str r5, [sp]
	movs r4, 0xFF
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	ldr r2, _0812A518 @ =gUnknown_841793C
	movs r1, 0x10
	str r1, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	movs r1, 0x1
	movs r2, 0xD
	bl DrawTextBorderOuter
	ldr r0, [r6]
	ldrb r0, [r0, 0x18]
	movs r1, 0xE
	str r1, [sp]
	str r5, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl Menu_InitCursor
_0812A4F0:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A4FC: .4byte 0xffffff00
_0812A500: .4byte 0xffff00ff
_0812A504: .4byte 0xff00ffff
_0812A508: .4byte 0x00ffffff
_0812A50C: .4byte 0x0000ffff
_0812A510: .4byte gUnknown_203B0E4
_0812A514: .4byte gUnknown_8417938
_0812A518: .4byte gUnknown_841793C
	thumb_func_end sub_812A424

	thumb_func_start sub_812A51C
sub_812A51C: @ 812A51C
	push {r4,lr}
	ldr r4, _0812A540 @ =gUnknown_203B0E4
	ldr r0, [r4]
	ldrh r0, [r0, 0x18]
	cmp r0, 0xFF
	beq _0812A53A
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl ClearStdWindowAndFrameToTransparent
	ldr r0, [r4]
	ldrb r0, [r0, 0x18]
	bl ClearWindowTilemap
_0812A53A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A540: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A51C

	thumb_func_start sub_812A544
sub_812A544: @ 812A544
	push {r4,lr}
	ldr r4, _0812A564 @ =gUnknown_203B0E4
	ldr r0, [r4]
	ldrh r0, [r0, 0x18]
	cmp r0, 0xFF
	beq _0812A55E
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	ldr r1, [r4]
	movs r0, 0xFF
	strh r0, [r1, 0x18]
_0812A55E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A564: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A544

	thumb_func_start sub_812A568
sub_812A568: @ 812A568
	push {lr}
	bl Menu_ProcessInput
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_812A568

	thumb_func_start sub_812A578
sub_812A578: @ 812A578
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x1C
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldr r1, _0812A624 @ =0xffffff00
	ldr r3, [sp, 0x14]
	ands r3, r1
	ldr r2, _0812A628 @ =0xffff00ff
	ands r3, r2
	movs r0, 0x80
	lsls r0, 4
	orrs r3, r0
	ldr r0, _0812A62C @ =0xff00ffff
	ands r3, r0
	movs r0, 0x80
	lsls r0, 13
	orrs r3, r0
	ldr r5, _0812A630 @ =0x00ffffff
	ands r3, r5
	movs r0, 0xA8
	lsls r0, 21
	orrs r3, r0
	str r3, [sp, 0x14]
	ldr r0, [sp, 0x18]
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	ands r0, r2
	movs r1, 0xE0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _0812A634 @ =0x0000ffff
	ands r0, r1
	movs r1, 0xD4
	lsls r1, 15
	orrs r0, r1
	str r0, [sp, 0x18]
	ldr r1, _0812A638 @ =gUnknown_845AB64
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r4, r0, r1
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _0812A5F8
	lsls r0, r3, 16
	movs r1, 0xF9
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	ands r2, r3
	orrs r2, r0
	lsrs r1, r2, 24
	adds r1, 0x7
	lsls r1, 24
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
_0812A5F8:
	add r0, sp, 0x14
	bl AddWindow
	ldr r5, _0812A63C @ =gUnknown_203B0E4
	ldr r1, [r5]
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x1E]
	mov r8, r0
	cmp r0, 0xFF
	beq _0812A6E2
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _0812A640
	adds r0, r1, 0
	adds r0, 0x22
	ldr r1, [r4]
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r0, [r5]
	adds r6, r0, 0
	adds r6, 0x22
	b _0812A642
	.align 2, 0
_0812A624: .4byte 0xffffff00
_0812A628: .4byte 0xffff00ff
_0812A62C: .4byte 0xff00ffff
_0812A630: .4byte 0x00ffffff
_0812A634: .4byte 0x0000ffff
_0812A638: .4byte gUnknown_845AB64
_0812A63C: .4byte gUnknown_203B0E4
_0812A640:
	ldr r6, [r4]
_0812A642:
	mov r0, r9
	lsls r1, r0, 8
	movs r0, 0
	movs r2, 0
	bl ChangeBgY
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl PutWindowTilemap
	ldr r1, _0812A6AC @ =gUnknown_845AB64
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0x1
	bne _0812A6B0
	adds r0, r5, 0
	movs r1, 0xA
	movs r2, 0x2
	bl DrawTextBorderInner
	ldrb r3, [r4, 0x5]
	adds r3, 0x8
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x6]
	adds r0, 0x8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldrb r0, [r4, 0x7]
	str r0, [sp, 0xC]
	ldrb r0, [r4, 0x8]
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r6, 0
	bl AddTextPrinterParameterized5
	b _0812A6DA
	.align 2, 0
_0812A6AC: .4byte gUnknown_845AB64
_0812A6B0:
	adds r0, r5, 0
	movs r1, 0xA
	movs r2, 0x2
	bl DrawTextBorderOuter
	ldrb r3, [r4, 0x5]
	ldrb r0, [r4, 0x6]
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldrb r0, [r4, 0x7]
	str r0, [sp, 0xC]
	ldrb r0, [r4, 0x8]
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r6, 0
	bl AddTextPrinterParameterized5
_0812A6DA:
	ldr r0, _0812A6F0 @ =gUnknown_203B0E4
	ldr r0, [r0]
	mov r1, r8
	strh r1, [r0, 0x1E]
_0812A6E2:
	add sp, 0x1C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A6F0: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A578

	thumb_func_start sub_812A6F4
sub_812A6F4: @ 812A6F4
	push {r4,lr}
	ldr r4, _0812A724 @ =gUnknown_203B0E4
	ldr r0, [r4]
	ldrh r0, [r0, 0x1E]
	cmp r0, 0xFF
	beq _0812A712
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl ClearStdWindowAndFrameToTransparent
	ldr r0, [r4]
	ldrb r0, [r0, 0x1E]
	bl ClearWindowTilemap
_0812A712:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A724: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A6F4

	thumb_func_start sub_812A728
sub_812A728: @ 812A728
	push {r4,lr}
	ldr r4, _0812A748 @ =gUnknown_203B0E4
	ldr r0, [r4]
	ldrh r0, [r0, 0x1E]
	cmp r0, 0xFF
	beq _0812A742
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	ldr r1, [r4]
	movs r0, 0xFF
	strh r0, [r1, 0x1E]
_0812A742:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A748: .4byte gUnknown_203B0E4
	thumb_func_end sub_812A728

	thumb_func_start sub_812A74C
sub_812A74C: @ 812A74C
	push {lr}
	sub sp, 0x8
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 19
	lsrs r3, 16
	lsls r1, 19
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0xE
	str r0, [sp, 0x4]
	movs r0, 0x1
	adds r1, r2, 0
	adds r2, r3, 0
	movs r3, 0x1
	bl FillWindowPixelRect
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_812A74C

	thumb_func_start sub_812A778
sub_812A778: @ 812A778
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	mov r10, r1
	ldr r1, [sp, 0x54]
	lsls r0, 16
	lsrs r5, r0, 16
	mov r9, r5
	lsls r2, 24
	lsrs r4, r2, 24
	mov r8, r4
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r4, 0
	beq _0812A7B4
	bl sub_81297DC
	adds r1, r0, 0
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_812A74C
_0812A7B4:
	add r0, sp, 0xC
	mov r1, r8
	strb r1, [r0]
	strb r7, [r0, 0x1]
	strb r6, [r0, 0x2]
	add r4, sp, 0x10
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x14
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0x2]
	mov r0, sp
	adds r0, 0x13
	mov r1, r10
	bl StringCopy
	mov r0, r9
	lsls r2, r0, 27
	lsrs r2, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812A778

	thumb_func_start sub_812A804
sub_812A804: @ 812A804
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4C
	movs r0, 0x2
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	bl sub_81296F4
	lsls r0, 24
	lsrs r2, r0, 24
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xE
	strb r0, [r1, 0x1]
	movs r0, 0xD
	strb r0, [r1, 0x2]
	cmp r2, 0x3
	beq _0812A8A0
	add r1, sp, 0x10
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x8
	strb r0, [r1, 0x2]
	str r0, [sp, 0x40]
	str r1, [sp, 0x44]
	cmp r2, 0x2
	bne _0812A84C
	movs r1, 0x6
	str r1, [sp, 0x40]
_0812A84C:
	movs r7, 0
	movs r6, 0
	lsls r0, r2, 2
	ldr r1, _0812A89C @ =gUnknown_845A9AC
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldr r0, [sp, 0x40]
	lsls r5, r0, 24
_0812A85E:
	ldr r1, [r4]
	cmp r1, 0
	bne _0812A866
	b _0812A96C
_0812A866:
	mov r0, sp
	adds r0, 0x13
	bl StringCopy
	lsls r3, r6, 24
	lsrs r3, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x44]
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	lsrs r2, r5, 24
	bl AddTextPrinterParameterized3
	adds r4, 0x4
	adds r7, 0x1
	adds r0, r6, 0
	adds r0, 0xC
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r7, 0x9
	ble _0812A85E
	b _0812A96C
	.align 2, 0
_0812A89C: .4byte gUnknown_845A9AC
_0812A8A0:
	movs r1, 0x4
	str r1, [sp, 0x40]
	movs r7, 0
	movs r6, 0
_0812A8A8:
	adds r0, r7, 0
	bl sub_81294B0
	adds r5, r0, 0
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	cmp r0, 0x28
	bgt _0812A8E6
	lsls r3, r6, 24
	lsrs r3, 24
	add r4, sp, 0xC
	str r4, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	movs r4, 0x80
	lsls r4, 19
	lsrs r2, r4, 24
	bl AddTextPrinterParameterized3
	adds r0, r7, 0x1
	str r0, [sp, 0x48]
	adds r6, 0xC
	mov r10, r6
	b _0812A960
_0812A8E6:
	adds r0, r5, 0
	bl StringLength_Multibyte
	adds r4, r0, 0
	mov r1, sp
	adds r1, 0x10
	str r1, [sp, 0x44]
	ldr r0, [sp, 0x40]
	lsls r0, 24
	mov r8, r0
	lsls r1, r6, 24
	mov r9, r1
	adds r0, r7, 0x1
	str r0, [sp, 0x48]
	adds r6, 0xC
	mov r10, r6
	ldr r7, [sp, 0x40]
	adds r7, 0x23
	ldr r6, [sp, 0x44]
_0812A90C:
	subs r4, 0x1
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl StringCopyN_Multibyte
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0
	bl GetStringWidth
	cmp r0, 0x23
	bgt _0812A90C
	mov r1, r8
	lsrs r2, r1, 24
	mov r0, r9
	lsrs r4, r0, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r1, [sp, 0x44]
	str r1, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	adds r3, r4, 0
	bl AddTextPrinterParameterized3
	adds r2, r7, 0
	add r0, sp, 0xC
	str r0, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	ldr r0, _0812A97C @ =gUnknown_845ABE8
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	adds r3, r4, 0
	bl AddTextPrinterParameterized3
_0812A960:
	ldr r7, [sp, 0x48]
	mov r4, r10
	lsls r0, r4, 16
	lsrs r6, r0, 16
	cmp r7, 0x9
	ble _0812A8A8
_0812A96C:
	add sp, 0x4C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A97C: .4byte gUnknown_845ABE8
	thumb_func_end sub_812A804

	thumb_func_start sub_812A980
sub_812A980: @ 812A980
	push {r4,lr}
	ldr r1, _0812A9A4 @ =gUnknown_203B0E4
	ldr r2, [r1]
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, 0x37
	bgt _0812A9B4
	adds r0, r3, 0
	adds r0, 0xC
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x37
	ble _0812A9A8
	movs r0, 0x38
	strh r0, [r2, 0x20]
	b _0812A9B4
	.align 2, 0
_0812A9A4: .4byte gUnknown_203B0E4
_0812A9A8:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	bl sub_812ADA0
	movs r0, 0x1
	b _0812A9C0
_0812A9B4:
	ldr r0, [r1]
	movs r4, 0x20
	ldrsh r0, [r0, r4]
	bl sub_812ADF8
	movs r0, 0
_0812A9C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A980

	thumb_func_start sub_812A9C8
sub_812A9C8: @ 812A9C8
	push {r4,lr}
	ldr r1, _0812A9EC @ =gUnknown_203B0E4
	ldr r2, [r1]
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, 0
	ble _0812A9FC
	adds r0, r3, 0
	subs r0, 0xC
	strh r0, [r2, 0x20]
	lsls r0, 16
	cmp r0, 0
	bgt _0812A9F0
	movs r0, 0
	strh r0, [r2, 0x20]
	b _0812A9FC
	.align 2, 0
_0812A9EC: .4byte gUnknown_203B0E4
_0812A9F0:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	bl sub_812ADA0
	movs r0, 0x1
	b _0812AA08
_0812A9FC:
	ldr r0, [r1]
	movs r4, 0x20
	ldrsh r0, [r0, r4]
	bl sub_812ADF8
	movs r0, 0
_0812AA08:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812A9C8

	thumb_func_start sub_812AA10
sub_812AA10: @ 812AA10
	push {lr}
	sub sp, 0xC
	movs r0, 0x3
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0xD
	bl DrawTextBorderOuter
	ldr r0, _0812AA60 @ =gUnknown_845ABEC
	str r0, [sp]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0xE
	movs r3, 0x5
	bl UnionRoomAndTradeMenuPrintOptions
	bl sub_81296F4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xE
	str r1, [sp]
	movs r1, 0x5
	str r1, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0
	movs r3, 0
	bl Menu_InitCursor
	movs r0, 0x3
	bl PutWindowTilemap
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0812AA60: .4byte gUnknown_845ABEC
	thumb_func_end sub_812AA10

	thumb_func_start sub_812AA64
sub_812AA64: @ 812AA64
	push {lr}
	movs r0, 0x3
	movs r1, 0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, 0x3
	bl ClearWindowTilemap
	pop {r0}
	bx r0
	thumb_func_end sub_812AA64

	thumb_func_start sub_812AA78
sub_812AA78: @ 812AA78
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 24
	add r3, sp, 0xC
	movs r1, 0x1
	strb r1, [r3]
	lsrs r2, 23
	adds r1, r2, 0x2
	strb r1, [r3, 0x1]
	adds r1, r3, 0
	adds r2, 0x3
	strb r2, [r1, 0x2]
	lsls r4, r0, 4
	subs r4, r0
	lsls r3, r4, 16
	lsrs r3, 16
	movs r0, 0xA8
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x11
	movs r2, 0
	bl FillWindowPixelRect
	lsls r4, 24
	lsrs r4, 24
	add r0, sp, 0xC
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	adds r3, r4, 0
	bl AddTextPrinterParameterized3
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812AA78

	thumb_func_start sub_812AAD4
sub_812AAD4: @ 812AAD4
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
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r1, 0xE0
	lsls r1, 8
	movs r0, 0
	bl ClearGpuRegBits
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _0812AB88 @ =0x000040f0
	movs r0, 0x40
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0x90
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x3D
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x3F
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0812AB88: .4byte 0x000040f0
	thumb_func_end sub_812AAD4

	thumb_func_start sub_812AB8C
sub_812AB8C: @ 812AB8C
	push {r4,lr}
	ldr r4, _0812ABC8 @ =gUnknown_203B0E4
	ldr r1, [r4]
	movs r0, 0x94
	lsls r0, 1
	adds r1, r0
	movs r0, 0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0812ABCC @ =0x00000928
	adds r1, r0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0812ABD0 @ =0x00001128
	adds r1, r0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0812ABD4 @ =0x00001928
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812ABC8: .4byte gUnknown_203B0E4
_0812ABCC: .4byte 0x00000928
_0812ABD0: .4byte 0x00001128
_0812ABD4: .4byte 0x00001928
	thumb_func_end sub_812AB8C

	thumb_func_start sub_812ABD8
sub_812ABD8: @ 812ABD8
	push {lr}
	sub sp, 0x8
	movs r1, 0xC0
	lsls r1, 19
	movs r0, 0
	movs r2, 0x20
	movs r3, 0x1
	bl RequestDma3Fill
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_812ABD8

	thumb_func_start sub_812AC08
sub_812AC08: @ 812AC08
	push {lr}
	sub sp, 0x4
	ldr r0, _0812AC48 @ =gUnknown_8EAA9F0
	movs r1, 0x70
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0812AC4C @ =gUnknown_845AA24
	movs r1, 0xC0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0812AC50 @ =gUnknown_8EAAA10
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _0812AC54 @ =gUnknown_8EAAA6C
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812AC48: .4byte gUnknown_8EAA9F0
_0812AC4C: .4byte gUnknown_845AA24
_0812AC50: .4byte gUnknown_8EAAA10
_0812AC54: .4byte gUnknown_8EAAA6C
	thumb_func_end sub_812AC08

	thumb_func_start sub_812AC58
sub_812AC58: @ 812AC58
	push {lr}
	sub sp, 0x4
	ldr r0, _0812AC90 @ =gUnknown_8EA1700
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0812AC94 @ =gUnknown_8EA1720
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	ldr r1, _0812AC98 @ =gUnknown_8EA1958
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812AC90: .4byte gUnknown_8EA1700
_0812AC94: .4byte gUnknown_8EA1720
_0812AC98: .4byte gUnknown_8EA1958
	thumb_func_end sub_812AC58

	thumb_func_start sub_812AC9C
sub_812AC9C: @ 812AC9C
	push {lr}
	ldr r0, _0812ACB8 @ =gUnknown_845AA44
	movs r1, 0x80
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0812ACBC @ =0x06004020
	movs r0, 0
	movs r2, 0x20
	movs r3, 0x1
	bl RequestDma3Fill
	pop {r0}
	bx r0
	.align 2, 0
_0812ACB8: .4byte gUnknown_845AA44
_0812ACBC: .4byte 0x06004020
	thumb_func_end sub_812AC9C

	thumb_func_start sub_812ACC0
sub_812ACC0: @ 812ACC0
	push {lr}
	ldr r0, _0812ACE8 @ =gUnknown_845AA64
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	.align 2, 0
_0812ACE8: .4byte gUnknown_845AA64
	thumb_func_end sub_812ACC0

	thumb_func_start sub_812ACEC
sub_812ACEC: @ 812ACEC
	push {lr}
	movs r0, 0x2
	bl PutWindowTilemap
	bl sub_812A804
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_812ACEC

	thumb_func_start sub_812AD04
sub_812AD04: @ 812AD04
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_812AD04

	thumb_func_start sub_812AD20
sub_812AD20: @ 812AD20
	push {lr}
	movs r0, 0x3
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0xD0
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0x3
	movs r1, 0xA
	movs r2, 0x20
	bl TextWindow_SetStdFrame0_WithPal
	ldr r0, _0812AD4C @ =gTMCaseMainWindowPalette
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_0812AD4C: .4byte gTMCaseMainWindowPalette
	thumb_func_end sub_812AD20

	thumb_func_start sub_812AD50
sub_812AD50: @ 812AD50
	push {lr}
	sub sp, 0x10
	ldr r0, _0812AD8C @ =0xa2600001
	str r0, [sp, 0x4]
	ldr r0, _0812AD90 @ =0x04000014
	str r0, [sp]
	mov r2, sp
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x8]
	mov r0, sp
	strb r1, [r0, 0x9]
	ldr r0, _0812AD94 @ =gUnknown_203B0E4
	ldr r0, [r0]
	strh r1, [r0, 0x20]
	str r1, [sp, 0xC]
	add r0, sp, 0xC
	ldr r1, _0812AD98 @ =gScanlineEffectRegBuffers
	ldr r2, _0812AD9C @ =0x010003c0
	bl CpuFastSet
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl ScanlineEffect_SetParams
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0812AD8C: .4byte 0xa2600001
_0812AD90: .4byte 0x04000014
_0812AD94: .4byte gUnknown_203B0E4
_0812AD98: .4byte gScanlineEffectRegBuffers
_0812AD9C: .4byte 0x010003c0
	thumb_func_end sub_812AD50

	thumb_func_start sub_812ADA0
sub_812ADA0: @ 812ADA0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	strh r0, [r1]
	ldr r5, _0812ADE8 @ =gScanlineEffect
	ldrb r0, [r5, 0x14]
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 7
	ldr r4, _0812ADEC @ =gScanlineEffectRegBuffers
	adds r1, r4
	ldr r2, _0812ADF0 @ =0x01000090
	mov r0, sp
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	movs r1, 0
	strh r1, [r0]
	ldrb r2, [r5, 0x14]
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 7
	movs r2, 0x90
	lsls r2, 1
	adds r4, r2
	adds r1, r4
	ldr r2, _0812ADF4 @ =0x01000010
	bl CpuSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812ADE8: .4byte gScanlineEffect
_0812ADEC: .4byte gScanlineEffectRegBuffers
_0812ADF0: .4byte 0x01000090
_0812ADF4: .4byte 0x01000010
	thumb_func_end sub_812ADA0

	thumb_func_start sub_812ADF8
sub_812ADF8: @ 812ADF8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	strh r4, [r0]
	ldr r5, _0812AE64 @ =gScanlineEffectRegBuffers
	ldr r0, _0812AE68 @ =0x01000090
	mov r9, r0
	mov r0, sp
	adds r1, r5, 0
	mov r2, r9
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	movs r6, 0
	strh r6, [r0]
	movs r2, 0x90
	lsls r2, 1
	adds r1, r5, r2
	ldr r2, _0812AE6C @ =0x01000010
	mov r8, r2
	bl CpuSet
	add r0, sp, 0x4
	strh r4, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r5, r2
	mov r2, r9
	bl CpuSet
	mov r0, sp
	adds r0, 0x6
	strh r6, [r0]
	movs r1, 0x8A
	lsls r1, 4
	adds r5, r1
	adds r1, r5, 0
	mov r2, r8
	bl CpuSet
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812AE64: .4byte gScanlineEffectRegBuffers
_0812AE68: .4byte 0x01000090
_0812AE6C: .4byte 0x01000010
	thumb_func_end sub_812ADF8

	thumb_func_start sub_812AE70
sub_812AE70: @ 812AE70
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _0812AE9C @ =gUnknown_845AF58
_0812AE76:
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x4
	bls _0812AE76
	ldr r0, _0812AEA0 @ =gUnknown_845AF80
	bl LoadSpritePalette
	ldr r4, _0812AEA4 @ =gUnknown_203B0E8
	movs r0, 0x18
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0812AEA8
	movs r0, 0x1
	b _0812AEAA
	.align 2, 0
_0812AE9C: .4byte gUnknown_845AF58
_0812AEA0: .4byte gUnknown_845AF80
_0812AEA4: .4byte gUnknown_203B0E8
_0812AEA8:
	movs r0, 0
_0812AEAA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_812AE70

	thumb_func_start sub_812AEB0
sub_812AEB0: @ 812AEB0
	push {lr}
	ldr r0, _0812AEC4 @ =gUnknown_203B0E8
	ldr r0, [r0]
	cmp r0, 0
	beq _0812AEBE
	bl Free
_0812AEBE:
	pop {r0}
	bx r0
	.align 2, 0
_0812AEC4: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AEB0

	thumb_func_start sub_812AEC8
sub_812AEC8: @ 812AEC8
	push {lr}
	ldr r0, _0812AEF0 @ =gUnknown_845AFC0
	movs r1, 0xA
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0812AEF4 @ =gUnknown_203B0E8
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0812AEF8 @ =gSprites
	adds r1, r0
	str r1, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0812AEF0: .4byte gUnknown_845AFC0
_0812AEF4: .4byte gUnknown_203B0E8
_0812AEF8: .4byte gSprites
	thumb_func_end sub_812AEC8

	thumb_func_start sub_812AEFC
sub_812AEFC: @ 812AEFC
	ldr r1, _0812AF18 @ =gUnknown_203B0E8
	ldr r1, [r1]
	ldr r2, [r1]
	adds r2, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r3, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_0812AF18: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AEFC

	thumb_func_start sub_812AF1C
sub_812AF1C: @ 812AF1C
	push {r4,r5,lr}
	sub sp, 0x4
	bl sub_81296F4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	adds r5, 0x1
	mov r0, sp
	adds r1, r5, 0
	bl sub_8129700
	cmp r4, 0x3
	beq _0812AF5C
	ldr r4, _0812AF58 @ =gUnknown_203B0E8
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	ldr r1, [r4]
	ldr r2, [r1]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, 0xA
	strh r0, [r2, 0x20]
	ldr r2, [r1]
	b _0812AF72
	.align 2, 0
_0812AF58: .4byte gUnknown_203B0E8
_0812AF5C:
	ldr r4, _0812AF88 @ =gUnknown_203B0E8
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r2, [r4]
	ldr r1, [r2]
	movs r0, 0x18
	strh r0, [r1, 0x20]
	ldr r2, [r2]
_0812AF72:
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, 0x18
	strh r0, [r2, 0x22]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812AF88: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AF1C

	thumb_func_start sub_812AF8C
sub_812AF8C: @ 812AF8C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 2
	ldr r0, _0812AFB8 @ =gUnknown_845AC16
	adds r4, r0
	movs r0, 0
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	ldr r0, _0812AFBC @ =0x01010000
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x4
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AFB8: .4byte gUnknown_845AC16
_0812AFBC: .4byte 0x01010000
	thumb_func_end sub_812AF8C

	thumb_func_start sub_812AFC0
sub_812AFC0: @ 812AFC0
	push {lr}
	bl sub_81296F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0812AFE0
	ldr r0, _0812AFDC @ =gUnknown_203B0E8
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _0812AFEC
	.align 2, 0
_0812AFDC: .4byte gUnknown_203B0E8
_0812AFE0:
	ldr r0, _0812AFF8 @ =gUnknown_203B0E8
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
_0812AFEC:
	ldr r0, _0812AFF8 @ =gUnknown_203B0E8
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0x14]
	pop {r0}
	bx r0
	.align 2, 0
_0812AFF8: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AFC0

	thumb_func_start sub_812AFFC
sub_812AFFC: @ 812AFFC
	push {r4,lr}
	ldr r4, _0812B00C @ =gUnknown_203B0E8
	ldr r1, [r4]
	ldrh r0, [r1, 0x14]
	cmp r0, 0x3
	bls _0812B010
_0812B008:
	movs r0, 0
	b _0812B042
	.align 2, 0
_0812B00C: .4byte gUnknown_203B0E8
_0812B010:
	adds r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0812B040
	bl sub_81296F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0812B034
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	b _0812B008
_0812B034:
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	b _0812B008
_0812B040:
	movs r0, 0x1
_0812B042:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812AFFC

	thumb_func_start sub_812B048
sub_812B048: @ 812B048
	push {r4,r5,lr}
	ldr r0, _0812B08C @ =gUnknown_845AFE0
	movs r1, 0x4C
	movs r2, 0x98
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0812B090 @ =gUnknown_203B0E8
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _0812B094 @ =gSprites
	adds r1, r4
	str r1, [r2, 0x8]
	ldr r0, _0812B098 @ =gUnknown_845AFF8
	movs r1, 0x40
	movs r2, 0x98
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2, 0x4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B08C: .4byte gUnknown_845AFE0
_0812B090: .4byte gUnknown_203B0E8
_0812B094: .4byte gSprites
_0812B098: .4byte gUnknown_845AFF8
	thumb_func_end sub_812B048

	thumb_func_start sub_812B09C
sub_812B09C: @ 812B09C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_81297DC
	adds r3, r0, 0
	cmp r3, 0xF
	bne _0812B0B8
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0812B0CC
_0812B0B8:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	lsls r0, r3, 3
	adds r0, 0x4C
	strh r0, [r4, 0x20]
_0812B0CC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812B09C

	thumb_func_start sub_812B0D4
sub_812B0D4: @ 812B0D4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0812B0FA
	strh r2, [r1, 0x2E]
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0812B0FA
	strh r2, [r1, 0x24]
_0812B0FA:
	pop {r0}
	bx r0
	thumb_func_end sub_812B0D4

	thumb_func_start sub_812B100
sub_812B100: @ 812B100
	push {r4,r5,lr}
	ldr r0, _0812B150 @ =gUnknown_845B050
	movs r1, 0x8
	movs r2, 0x98
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0812B154 @ =gUnknown_203B0E8
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _0812B158 @ =gSprites
	adds r1, r4
	str r1, [r2, 0xC]
	ldr r0, _0812B15C @ =gUnknown_845B068
	movs r1, 0x20
	movs r2, 0x98
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2, 0x10]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B150: .4byte gUnknown_845B050
_0812B154: .4byte gUnknown_203B0E8
_0812B158: .4byte gSprites
_0812B15C: .4byte gUnknown_845B068
	thumb_func_end sub_812B100

	thumb_func_start sub_812B160
sub_812B160: @ 812B160
	push {r4,lr}
	bl sub_81296F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0812B198
	bl sub_8129720
	cmp r0, 0
	beq _0812B1A2
	ldr r3, _0812B194 @ =gUnknown_203B0E8
	ldr r0, [r3]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x10]
	movs r1, 0x3
	bl StartSpriteAnim
	b _0812B1D6
	.align 2, 0
_0812B194: .4byte gUnknown_203B0E8
_0812B198:
	bl sub_81297E8
	adds r4, r0, 0
	cmp r4, 0x3
	bne _0812B1B8
_0812B1A2:
	ldr r0, _0812B1B4 @ =gUnknown_203B0E8
	ldr r0, [r0]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _0812B1D6
	.align 2, 0
_0812B1B4: .4byte gUnknown_203B0E8
_0812B1B8:
	ldr r3, _0812B1DC @ =gUnknown_203B0E8
	ldr r0, [r3]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x10]
	lsls r1, r4, 24
	lsrs r1, 24
	bl StartSpriteAnim
_0812B1D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812B1DC: .4byte gUnknown_203B0E8
	thumb_func_end sub_812B160

	.align 2, 0 @ Don't pad with nop.
