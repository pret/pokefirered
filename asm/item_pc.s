	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_810D3F4
sub_810D3F4: @ 810D3F4
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r5, 0x1
	bhi _0810D410
	ldr r6, _0810D418 @ =gUnknown_203ADBC
	movs r0, 0x14
	bl Alloc
	str r0, [r6]
	cmp r0, 0
	bne _0810D41C
_0810D410:
	adds r0, r4, 0
	bl SetMainCallback2
	b _0810D462
	.align 2, 0
_0810D418: .4byte gUnknown_203ADBC
_0810D41C:
	cmp r5, 0x1
	beq _0810D42A
	ldr r0, _0810D468 @ =gUnknown_203ADCC
	str r4, [r0]
	movs r1, 0
	strh r1, [r0, 0x6]
	strh r1, [r0, 0x4]
_0810D42A:
	ldr r1, [r6]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r0, [r6]
	movs r2, 0
	strb r2, [r0, 0x5]
	ldr r1, [r6]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x8]
	ldr r0, [r6]
	str r2, [r0]
	ldr r5, _0810D46C @ =sub_810D4A0
	adds r4, r6, 0
	movs r3, 0
_0810D448:
	ldr r0, [r4]
	lsls r1, r2, 1
	adds r0, 0xC
	adds r0, r1
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _0810D448
	adds r0, r5, 0
	bl SetMainCallback2
_0810D462:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810D468: .4byte gUnknown_203ADCC
_0810D46C: .4byte sub_810D4A0
	thumb_func_end sub_810D3F4

	thumb_func_start sub_810D470
sub_810D470: @ 810D470
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_810D470

	thumb_func_start sub_810D48C
sub_810D48C: @ 810D48C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_810D48C

	thumb_func_start sub_810D4A0
sub_810D4A0: @ 810D4A0
	push {lr}
_0810D4A2:
	bl sub_810D4C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810D4BA
	bl sub_80BF708
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D4A2
_0810D4BA:
	pop {r0}
	bx r0
	thumb_func_end sub_810D4A0

	thumb_func_start sub_810D4C0
sub_810D4C0: @ 810D4C0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0810D4E0 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x14
	bls _0810D4D4
	b _0810D688
_0810D4D4:
	lsls r0, 2
	ldr r1, _0810D4E4 @ =_0810D4E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810D4E0: .4byte gMain
_0810D4E4: .4byte _0810D4E8
	.align 2, 0
_0810D4E8:
	.4byte _0810D53C
	.4byte _0810D546
	.4byte _0810D54C
	.4byte _0810D552
	.4byte _0810D558
	.4byte _0810D55E
	.4byte _0810D564
	.4byte _0810D56A
	.4byte _0810D584
	.4byte _0810D594
	.4byte _0810D59A
	.4byte _0810D5A8
	.4byte _0810D5BA
	.4byte _0810D5C0
	.4byte _0810D5C6
	.4byte _0810D5CC
	.4byte _0810D608
	.4byte _0810D60E
	.4byte _0810D616
	.4byte _0810D630
	.4byte _0810D668
_0810D53C:
	bl sub_80BF768
	bl clear_scheduled_bg_copies_to_vram
	b _0810D674
_0810D546:
	bl remove_some_task
	b _0810D674
_0810D54C:
	bl FreeAllSpritePalettes
	b _0810D674
_0810D552:
	bl ResetPaletteFade
	b _0810D674
_0810D558:
	bl ResetSpriteData
	b _0810D674
_0810D55E:
	bl sub_80984D8
	b _0810D674
_0810D564:
	bl ResetTasks
	b _0810D674
_0810D56A:
	bl sub_810D71C
	lsls r0, 24
	cmp r0, 0
	beq _0810D5B2
	ldr r0, _0810D580 @ =gUnknown_203ADBC
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0xC]
	b _0810D674
	.align 2, 0
_0810D580: .4byte gUnknown_203ADBC
_0810D584:
	bl sub_810D78C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810D592
	b _0810D6A0
_0810D592:
	b _0810D674
_0810D594:
	bl sub_810E8F0
	b _0810D674
_0810D59A:
	bl sub_810DDA4
	bl sub_810DBF0
	bl sub_810DE08
	b _0810D674
_0810D5A8:
	bl sub_810D83C
	lsls r0, 24
	cmp r0, 0
	bne _0810D674
_0810D5B2:
	bl sub_810D6AC
	movs r0, 0x1
	b _0810D6A2
_0810D5BA:
	bl sub_810D878
	b _0810D674
_0810D5C0:
	bl sub_810DB34
	b _0810D674
_0810D5C6:
	bl sub_80985E4
	b _0810D674
_0810D5CC:
	ldr r0, _0810D5F8 @ =sub_810DEA0
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810D5FC @ =gUnknown_3005E70
	ldr r2, _0810D600 @ =gUnknown_203ADCC
	ldrh r1, [r2, 0x4]
	ldrh r2, [r2, 0x6]
	bl ListMenuInit
	ldr r2, _0810D604 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x8]
	b _0810D674
	.align 2, 0
_0810D5F8: .4byte sub_810DEA0
_0810D5FC: .4byte gUnknown_3005E70
_0810D600: .4byte gUnknown_203ADCC
_0810D604: .4byte gUnknown_3005090
_0810D608:
	bl sub_810DB5C
	b _0810D674
_0810D60E:
	movs r0, 0x1D
	bl sub_812B1F0
	b _0810D674
_0810D616:
	ldr r0, _0810D62C @ =gUnknown_203ADCC
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1
	bne _0810D674
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	b _0810D674
	.align 2, 0
_0810D62C: .4byte gUnknown_203ADCC
_0810D630:
	ldr r0, _0810D64C @ =gUnknown_203ADCC
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1
	bne _0810D650
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0810D674
	.align 2, 0
_0810D64C: .4byte gUnknown_203ADCC
_0810D650:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80A0A48
	movs r0, 0x1
	bl sub_810DE94
	movs r0, 0x2
	bl sub_80722CC
	b _0810D674
_0810D668:
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810D6A0
_0810D674:
	ldr r1, _0810D684 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0810D6A0
	.align 2, 0
_0810D684: .4byte gMain
_0810D688:
	ldr r0, _0810D698 @ =sub_810D48C
	bl SetVBlankCallback
	ldr r0, _0810D69C @ =sub_810D470
	bl SetMainCallback2
	movs r0, 0x1
	b _0810D6A2
	.align 2, 0
_0810D698: .4byte sub_810D48C
_0810D69C: .4byte sub_810D470
_0810D6A0:
	movs r0, 0
_0810D6A2:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810D4C0

	thumb_func_start sub_810D6AC
sub_810D6AC: @ 810D6AC
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0810D6DC @ =sub_810D6E8
	movs r1, 0
	bl CreateTask
	ldr r0, _0810D6E0 @ =sub_810D48C
	bl SetVBlankCallback
	ldr r0, _0810D6E4 @ =sub_810D470
	bl SetMainCallback2
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810D6DC: .4byte sub_810D6E8
_0810D6E0: .4byte sub_810D48C
_0810D6E4: .4byte sub_810D470
	thumb_func_end sub_810D6AC

	thumb_func_start sub_810D6E8
sub_810D6E8: @ 810D6E8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810D714 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810D70C
	ldr r0, _0810D718 @ =gUnknown_203ADCC
	ldr r0, [r0]
	bl SetMainCallback2
	bl sub_810DC40
	adds r0, r4, 0
	bl DestroyTask
_0810D70C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D714: .4byte gUnknown_2037AB8
_0810D718: .4byte gUnknown_203ADCC
	thumb_func_end sub_810D6E8

	thumb_func_start sub_810D71C
sub_810D71C: @ 810D71C
	push {r4,r5,lr}
	bl sub_80BF7C8
	ldr r5, _0810D77C @ =gUnknown_203ADC0
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	bl Alloc
	str r0, [r5]
	cmp r0, 0
	beq _0810D784
	movs r1, 0
	adds r2, r4, 0
	bl memset
	movs r0, 0
	bl sub_8001618
	ldr r1, _0810D780 @ =gUnknown_8453F6C
	movs r0, 0
	movs r2, 0x2
	bl sub_8001658
	ldr r1, [r5]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x1
	b _0810D786
	.align 2, 0
_0810D77C: .4byte gUnknown_203ADC0
_0810D780: .4byte gUnknown_8453F6C
_0810D784:
	movs r0, 0
_0810D786:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_810D71C

	thumb_func_start sub_810D78C
sub_810D78C: @ 810D78C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _0810D7A8 @ =gUnknown_203ADBC
	ldr r0, [r5]
	movs r1, 0xC
	ldrsh r4, [r0, r1]
	cmp r4, 0x1
	beq _0810D7D0
	cmp r4, 0x1
	bgt _0810D7AC
	cmp r4, 0
	beq _0810D7B6
	b _0810D814
	.align 2, 0
_0810D7A8: .4byte gUnknown_203ADBC
_0810D7AC:
	cmp r4, 0x2
	beq _0810D7F0
	cmp r4, 0x3
	beq _0810D800
	b _0810D814
_0810D7B6:
	bl reset_temp_tile_data_buffers
	ldr r1, _0810D7CC @ =gUnknown_8E85090
	str r4, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	b _0810D806
	.align 2, 0
_0810D7CC: .4byte gUnknown_8E85090
_0810D7D0:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810D830
	ldr r0, _0810D7E8 @ =gUnknown_8E85458
	ldr r1, _0810D7EC @ =gUnknown_203ADC0
	ldr r1, [r1]
	bl LZDecompressWram
	b _0810D806
	.align 2, 0
_0810D7E8: .4byte gUnknown_8E85458
_0810D7EC: .4byte gUnknown_203ADC0
_0810D7F0:
	ldr r0, _0810D7FC @ =gUnknown_8E85408
	movs r1, 0
	movs r2, 0x60
	bl LoadCompressedPalette
	b _0810D806
	.align 2, 0
_0810D7FC: .4byte gUnknown_8E85408
_0810D800:
	ldr r0, _0810D810 @ =gUnknown_83D4240
	bl LoadCompressedObjectPic
_0810D806:
	ldr r1, [r5]
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	b _0810D830
	.align 2, 0
_0810D810: .4byte gUnknown_83D4240
_0810D814:
	ldr r0, _0810D828 @ =gUnknown_83D4248
	bl LoadCompressedObjectPalette
	ldr r0, _0810D82C @ =gUnknown_203ADBC
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0xC]
	movs r0, 0x1
	b _0810D832
	.align 2, 0
_0810D828: .4byte gUnknown_83D4248
_0810D82C: .4byte gUnknown_203ADBC
_0810D830:
	movs r0, 0
_0810D832:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_810D78C

	thumb_func_start sub_810D83C
sub_810D83C: @ 810D83C
	push {r4,lr}
	ldr r4, _0810D860 @ =gUnknown_203ADC4
	movs r0, 0xF8
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0810D868
	ldr r4, _0810D864 @ =gUnknown_203ADC8
	movs r0, 0xD9
	lsls r0, 1
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0810D868
	movs r0, 0x1
	b _0810D872
	.align 2, 0
_0810D860: .4byte gUnknown_203ADC4
_0810D864: .4byte gUnknown_203ADC8
_0810D868:
	bl sub_810DC40
	bl sub_810D6AC
	movs r0, 0
_0810D872:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810D83C

	thumb_func_start sub_810D878
sub_810D878: @ 810D878
	push {r4,r5,lr}
	movs r4, 0
	b _0810D8A4
_0810D87E:
	ldr r0, _0810D938 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	lsls r1, r4, 2
	adds r0, r1
	movs r1, 0xA6
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetItem
	ldr r1, _0810D93C @ =gUnknown_203ADC4
	ldr r2, [r1]
	lsls r1, r4, 3
	adds r1, r2
	str r0, [r1]
	str r4, [r1, 0x4]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_0810D8A4:
	ldr r0, _0810D940 @ =gUnknown_203ADBC
	ldr r0, [r0]
	ldrb r0, [r0, 0x7]
	cmp r4, r0
	bcc _0810D87E
	ldr r0, _0810D93C @ =gUnknown_203ADC4
	ldr r3, [r0]
	lsls r0, r4, 3
	adds r0, r3
	ldr r1, _0810D944 @ =gUnknown_84161C1
	str r1, [r0]
	movs r1, 0x2
	negs r1, r1
	str r1, [r0, 0x4]
	ldr r2, _0810D948 @ =gUnknown_3005E70
	str r3, [r2]
	ldr r0, _0810D940 @ =gUnknown_203ADBC
	ldr r3, [r0]
	ldrb r0, [r3, 0x7]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r2, 0xC]
	strb r1, [r2, 0x10]
	strb r1, [r2, 0x11]
	movs r0, 0x9
	strb r0, [r2, 0x12]
	movs r1, 0x1
	movs r0, 0x1
	strb r0, [r2, 0x13]
	ldrb r0, [r2, 0x16]
	movs r4, 0x8
	negs r4, r4
	ands r4, r0
	orrs r4, r1
	movs r0, 0x39
	negs r0, r0
	ands r4, r0
	movs r0, 0x10
	orrs r4, r0
	strb r4, [r2, 0x16]
	ldrb r1, [r2, 0x14]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r5, 0x2
	orrs r0, r5
	strb r0, [r2, 0x14]
	ldrb r1, [r3, 0x6]
	strh r1, [r2, 0xE]
	ldrb r1, [r2, 0x17]
	movs r3, 0x40
	negs r3, r3
	ands r3, r1
	orrs r3, r5
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0x14]
	movs r0, 0x30
	strb r0, [r2, 0x15]
	ldr r0, _0810D94C @ =sub_810D954
	str r0, [r2, 0x4]
	ldr r0, _0810D950 @ =sub_810DA20
	str r0, [r2, 0x8]
	movs r0, 0x3F
	ands r4, r0
	strb r4, [r2, 0x16]
	ands r3, r0
	strb r3, [r2, 0x17]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D938: .4byte gSaveBlock1Ptr
_0810D93C: .4byte gUnknown_203ADC4
_0810D940: .4byte gUnknown_203ADBC
_0810D944: .4byte gUnknown_84161C1
_0810D948: .4byte gUnknown_3005E70
_0810D94C: .4byte sub_810D954
_0810D950: .4byte sub_810DA20
	thumb_func_end sub_810D878

	thumb_func_start sub_810D954
sub_810D954: @ 810D954
	push {r4,r5,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	beq _0810D968
	movs r0, 0x5
	bl sub_80722CC
_0810D968:
	ldr r5, _0810D9BC @ =gUnknown_203ADBC
	ldr r1, [r5]
	ldrb r0, [r1, 0x4]
	cmp r0, 0xFF
	bne _0810DA0A
	ldrb r1, [r1, 0x5]
	movs r0, 0x1
	eors r0, r1
	bl sub_8098940
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _0810D9CE
	lsls r0, r4, 16
	lsrs r0, 16
	bl sub_810DD68
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r5]
	ldrb r1, [r0, 0x5]
	adds r0, r4, 0
	bl sub_80988E8
	adds r0, r4, 0
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0810D9C4
	adds r0, r4, 0
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _0810D9C0 @ =gUnknown_8247094
	adds r5, r1, r0
	b _0810D9DA
	.align 2, 0
_0810D9BC: .4byte gUnknown_203ADBC
_0810D9C0: .4byte gUnknown_8247094
_0810D9C4:
	adds r0, r4, 0
	bl ItemId_GetDescription
	adds r5, r0, 0
	b _0810D9DA
_0810D9CE:
	ldr r0, _0810DA14 @ =0x00000177
	ldr r1, [r5]
	ldrb r1, [r1, 0x5]
	bl sub_80988E8
	ldr r5, _0810DA18 @ =gUnknown_84178BE
_0810D9DA:
	ldr r0, _0810DA1C @ =gUnknown_203ADBC
	ldr r2, [r0]
	ldrb r0, [r2, 0x5]
	movs r1, 0x1
	eors r0, r1
	movs r4, 0
	strb r0, [r2, 0x5]
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r1, 0x3
	str r1, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0
	bl sub_810EA34
_0810DA0A:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DA14: .4byte 0x00000177
_0810DA18: .4byte gUnknown_84178BE
_0810DA1C: .4byte gUnknown_203ADBC
	thumb_func_end sub_810D954

	thumb_func_start sub_810DA20
sub_810DA20: @ 810DA20
	push {r4-r6,lr}
	sub sp, 0x14
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r0, _0810DA4C @ =gUnknown_203ADBC
	ldr r0, [r0]
	ldrb r1, [r0, 0x4]
	cmp r1, 0xFF
	beq _0810DA58
	lsls r0, r4, 24
	lsrs r0, 24
	cmp r1, r0
	bne _0810DA50
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_810DAD4
	b _0810DA58
	.align 2, 0
_0810DA4C: .4byte gUnknown_203ADBC
_0810DA50:
	adds r0, r5, 0
	movs r1, 0xFF
	bl sub_810DAD4
_0810DA58:
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _0810DA9E
	lsls r0, r4, 16
	lsrs r0, 16
	bl sub_810DD80
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _0810DAA8 @ =gUnknown_2021CD0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _0810DAAC @ =gUnknown_2021D18
	ldr r1, _0810DAB0 @ =gUnknown_84162B9
	adds r0, r4, 0
	bl StringExpandPlaceholders
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r0, 0x1
	str r0, [sp, 0x10]
	adds r0, r6, 0
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x6E
	bl sub_810EA34
_0810DA9E:
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810DAA8: .4byte gUnknown_2021CD0
_0810DAAC: .4byte gUnknown_2021D18
_0810DAB0: .4byte gUnknown_84162B9
	thumb_func_end sub_810DA20

	thumb_func_start sub_810DAB4
sub_810DAB4: @ 810DAB4
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl ListMenuGetYCoordForPrintingArrowCursor
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_810DAD4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810DAB4

	thumb_func_start sub_810DAD4
sub_810DAD4: @ 810DAD4
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0xFF
	bne _0810DB10
	movs r0, 0x2
	movs r1, 0
	bl GetFontAttribute
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	adds r3, r5, 0
	bl FillWindowPixelRect
	b _0810DB26
_0810DB10:
	ldr r2, _0810DB30 @ =gUnknown_841623B
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0
	bl sub_810EA34
_0810DB26:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DB30: .4byte gUnknown_841623B
	thumb_func_end sub_810DAD4

	thumb_func_start sub_810DB34
sub_810DB34: @ 810DB34
	push {lr}
	sub sp, 0x14
	ldr r2, _0810DB58 @ =gUnknown_84178A7
	movs r1, 0x1
	str r1, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x2
	movs r1, 0
	movs r3, 0
	bl sub_810EA34
	add sp, 0x14
	pop {r0}
	bx r0
	.align 2, 0
_0810DB58: .4byte gUnknown_84178A7
	thumb_func_end sub_810DB34

	thumb_func_start sub_810DB5C
sub_810DB5C: @ 810DB5C
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _0810DB90 @ =gUnknown_203ADBC
	ldr r1, [r4]
	ldrb r0, [r1, 0x7]
	ldrb r1, [r1, 0x6]
	subs r0, r1
	adds r0, 0x1
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	ldr r0, _0810DB94 @ =gUnknown_203ADD0
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0x80
	movs r2, 0x8
	movs r3, 0x68
	bl AddScrollIndicatorArrowPairParametrized
	ldr r1, [r4]
	strb r0, [r1, 0x8]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810DB90: .4byte gUnknown_203ADBC
_0810DB94: .4byte gUnknown_203ADD0
	thumb_func_end sub_810DB5C

	thumb_func_start sub_810DB98
sub_810DB98: @ 810DB98
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _0810DBCC @ =gUnknown_203ADBC
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0xA]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r1, 0xA
	str r1, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0xD4
	movs r2, 0x78
	movs r3, 0x98
	bl AddScrollIndicatorArrowPairParametrized
	ldr r1, [r4]
	strb r0, [r1, 0x8]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810DBCC: .4byte gUnknown_203ADBC
	thumb_func_end sub_810DB98

	thumb_func_start sub_810DBD0
sub_810DBD0: @ 810DBD0
	push {r4,lr}
	ldr r4, _0810DBEC @ =gUnknown_203ADBC
	ldr r1, [r4]
	ldrb r0, [r1, 0x8]
	cmp r0, 0xFF
	beq _0810DBE6
	bl RemoveScrollIndicatorArrowPair
	ldr r1, [r4]
	movs r0, 0xFF
	strb r0, [r1, 0x8]
_0810DBE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810DBEC: .4byte gUnknown_203ADBC
	thumb_func_end sub_810DBD0

	thumb_func_start sub_810DBF0
sub_810DBF0: @ 810DBF0
	push {r4,r5,lr}
	ldr r0, _0810DC30 @ =gUnknown_203ADCC
	ldrh r1, [r0, 0x4]
	adds r4, r0, 0
	ldr r5, _0810DC34 @ =gUnknown_203ADBC
	cmp r1, 0
	beq _0810DC14
	ldrh r0, [r4, 0x4]
	ldr r1, [r5]
	ldrb r3, [r1, 0x6]
	adds r0, r3
	ldrb r2, [r1, 0x7]
	adds r1, r2, 0x1
	cmp r0, r1
	ble _0810DC14
	subs r0, r3, 0x1
	subs r0, r2, r0
	strh r0, [r4, 0x4]
_0810DC14:
	adds r3, r4, 0
	ldrh r0, [r3, 0x4]
	ldrh r1, [r3, 0x6]
	adds r0, r1
	ldr r1, [r5]
	ldrb r1, [r1, 0x7]
	adds r2, r1, 0x1
	cmp r0, r2
	blt _0810DC3A
	cmp r2, 0x1
	bgt _0810DC38
	movs r0, 0
	strh r0, [r3, 0x6]
	b _0810DC3A
	.align 2, 0
_0810DC30: .4byte gUnknown_203ADCC
_0810DC34: .4byte gUnknown_203ADBC
_0810DC38:
	strh r1, [r4, 0x6]
_0810DC3A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810DBF0

	thumb_func_start sub_810DC40
sub_810DC40: @ 810DC40
	push {lr}
	ldr r0, _0810DC7C @ =gUnknown_203ADBC
	ldr r0, [r0]
	cmp r0, 0
	beq _0810DC4E
	bl Free
_0810DC4E:
	ldr r0, _0810DC80 @ =gUnknown_203ADC0
	ldr r0, [r0]
	cmp r0, 0
	beq _0810DC5A
	bl Free
_0810DC5A:
	ldr r0, _0810DC84 @ =gUnknown_203ADC4
	ldr r0, [r0]
	cmp r0, 0
	beq _0810DC66
	bl Free
_0810DC66:
	ldr r0, _0810DC88 @ =gUnknown_203ADC8
	ldr r0, [r0]
	cmp r0, 0
	beq _0810DC72
	bl Free
_0810DC72:
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
_0810DC7C: .4byte gUnknown_203ADBC
_0810DC80: .4byte gUnknown_203ADC0
_0810DC84: .4byte gUnknown_203ADC4
_0810DC88: .4byte gUnknown_203ADC8
	thumb_func_end sub_810DC40

	thumb_func_start sub_810DC8C
sub_810DC8C: @ 810DC8C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810DCB0 @ =gUnknown_203ADCC
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1
	bne _0810DCB4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0810DCC4
	.align 2, 0
_0810DCB0: .4byte gUnknown_203ADCC
_0810DCB4:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80A0A70
	movs r0, 0x3
	bl sub_80722CC
_0810DCC4:
	ldr r0, _0810DCDC @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810DCE0 @ =sub_810DCE4
	str r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810DCDC: .4byte gUnknown_3005090
_0810DCE0: .4byte sub_810DCE4
	thumb_func_end sub_810DC8C

	thumb_func_start sub_810DCE4
sub_810DCE4: @ 810DCE4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810DD28 @ =gUnknown_3005098
	adds r4, r0, r1
	ldr r0, _0810DD2C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810DD4E
	bl sub_80A0AAC
	lsls r0, 24
	cmp r0, 0
	bne _0810DD4E
	ldrb r0, [r4]
	ldr r4, _0810DD30 @ =gUnknown_203ADD0
	adds r2, r4, 0x2
	adds r1, r4, 0
	bl sub_810713C
	ldr r0, _0810DD34 @ =gUnknown_203ADBC
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _0810DD38
	bl SetMainCallback2
	b _0810DD40
	.align 2, 0
_0810DD28: .4byte gUnknown_3005098
_0810DD2C: .4byte gUnknown_2037AB8
_0810DD30: .4byte gUnknown_203ADD0
_0810DD34: .4byte gUnknown_203ADBC
_0810DD38:
	subs r0, r4, 0x4
	ldr r0, [r0]
	bl SetMainCallback2
_0810DD40:
	bl sub_810DBD0
	bl sub_810DC40
	adds r0, r5, 0
	bl DestroyTask
_0810DD4E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810DCE4

	thumb_func_start sub_810DD54
sub_810DD54: @ 810DD54
	ldr r1, _0810DD64 @ =gUnknown_203ADCC
	ldrb r0, [r1, 0x6]
	ldrb r1, [r1, 0x4]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_0810DD64: .4byte gUnknown_203ADCC
	thumb_func_end sub_810DD54

	thumb_func_start sub_810DD68
sub_810DD68: @ 810DD68
	lsls r0, 16
	ldr r1, _0810DD7C @ =gSaveBlock1Ptr
	ldr r1, [r1]
	lsrs r0, 14
	adds r1, r0
	movs r0, 0xA6
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_0810DD7C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_810DD68

	thumb_func_start sub_810DD80
sub_810DD80: @ 810DD80
	push {lr}
	lsls r0, 16
	ldr r1, _0810DD9C @ =gSaveBlock1Ptr
	lsrs r0, 14
	ldr r1, [r1]
	adds r0, r1
	ldr r1, _0810DDA0 @ =0x0000029a
	adds r0, r1
	bl GetBagItemId
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0810DD9C: .4byte gSaveBlock1Ptr
_0810DDA0: .4byte 0x0000029a
	thumb_func_end sub_810DD80

	thumb_func_start sub_810DDA4
sub_810DDA4: @ 810DDA4
	push {r4,r5,lr}
	bl sub_809A4E8
	ldr r4, _0810DE00 @ =gUnknown_203ADBC
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x7]
	movs r2, 0
	ldr r3, _0810DE04 @ =gSaveBlock1Ptr
	ldr r0, [r3]
	movs r1, 0xA6
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0810DDEA
	adds r5, r4, 0
	adds r4, r3, 0
	adds r3, r1, 0
_0810DDCA:
	ldr r0, [r5]
	ldrb r1, [r0, 0x7]
	adds r1, 0x1
	strb r1, [r0, 0x7]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1D
	bhi _0810DDEA
	ldr r0, [r4]
	lsls r1, r2, 2
	adds r0, r1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810DDCA
_0810DDEA:
	ldr r0, _0810DE00 @ =gUnknown_203ADBC
	ldr r1, [r0]
	ldrb r0, [r1, 0x7]
	adds r0, 0x1
	cmp r0, 0x6
	ble _0810DDF8
	movs r0, 0x6
_0810DDF8:
	strb r0, [r1, 0x6]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DE00: .4byte gUnknown_203ADBC
_0810DE04: .4byte gSaveBlock1Ptr
	thumb_func_end sub_810DDA4

	thumb_func_start sub_810DE08
sub_810DE08: @ 810DE08
	push {r4-r6,lr}
	ldr r0, _0810DE64 @ =gUnknown_203ADCC
	ldrh r1, [r0, 0x6]
	adds r6, r0, 0
	cmp r1, 0x3
	bls _0810DE5C
	movs r4, 0
	ldrh r0, [r6, 0x6]
	subs r0, 0x3
	cmp r4, r0
	bgt _0810DE5C
	ldrh r1, [r6, 0x4]
	ldr r5, _0810DE68 @ =gUnknown_203ADBC
	ldr r2, [r5]
	ldrb r0, [r2, 0x6]
	adds r1, r0
	ldrb r0, [r2, 0x7]
	adds r0, 0x1
	cmp r1, r0
	beq _0810DE5C
	adds r3, r6, 0
_0810DE32:
	ldrh r0, [r3, 0x6]
	subs r0, 0x1
	strh r0, [r3, 0x6]
	ldrh r0, [r3, 0x4]
	adds r0, 0x1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrh r0, [r3, 0x6]
	subs r0, 0x3
	cmp r4, r0
	bgt _0810DE5C
	ldrh r1, [r6, 0x4]
	ldr r2, [r5]
	ldrb r0, [r2, 0x6]
	adds r1, r0
	ldrb r0, [r2, 0x7]
	adds r0, 0x1
	cmp r1, r0
	bne _0810DE32
_0810DE5C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810DE64: .4byte gUnknown_203ADCC
_0810DE68: .4byte gUnknown_203ADBC
	thumb_func_end sub_810DE08

	thumb_func_start sub_810DE6C
sub_810DE6C: @ 810DE6C
	push {lr}
	sub sp, 0x8
	movs r1, 0x6
	str r1, [sp]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x1E
	bl sub_80F6B08
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_810DE6C

	thumb_func_start sub_810DE94
sub_810DE94: @ 810DE94
	ldr r1, _0810DE9C @ =gUnknown_203ADCC
	strb r0, [r1, 0x8]
	bx lr
	.align 2, 0
_0810DE9C: .4byte gUnknown_203ADCC
	thumb_func_end sub_810DE94

	thumb_func_start sub_810DEA0
sub_810DEA0: @ 810DEA0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810DF10 @ =gUnknown_3005098
	adds r6, r0, r1
	ldr r0, _0810DF14 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810DF9E
	bl sub_80A0A98
	lsls r0, 24
	cmp r0, 0
	bne _0810DF9E
	ldr r0, _0810DF18 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0810DF20
	ldrb r0, [r6]
	mov r4, sp
	adds r4, 0x2
	mov r1, sp
	adds r2, r4, 0
	bl get_coro_args_x18_x1A
	mov r0, sp
	ldrh r1, [r0]
	ldrh r0, [r4]
	adds r1, r0
	ldr r0, _0810DF1C @ =gUnknown_203ADBC
	ldr r0, [r0]
	ldrb r0, [r0, 0x7]
	cmp r1, r0
	beq _0810DF20
	movs r0, 0x5
	bl sub_80722CC
	mov r0, sp
	ldrh r1, [r4]
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl sub_810DFE0
	b _0810DF9E
	.align 2, 0
_0810DF10: .4byte gUnknown_3005098
_0810DF14: .4byte gUnknown_2037AB8
_0810DF18: .4byte gMain
_0810DF1C: .4byte gUnknown_203ADBC
_0810DF20:
	ldrb r0, [r6]
	bl ListMenuHandleInput
	adds r4, r0, 0
	ldrb r0, [r6]
	ldr r1, _0810DF44 @ =gUnknown_203ADD0
	adds r2, r1, 0x2
	bl get_coro_args_x18_x1A
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _0810DF48
	adds r0, 0x1
	cmp r4, r0
	bne _0810DF6C
	b _0810DF9E
	.align 2, 0
_0810DF44: .4byte gUnknown_203ADD0
_0810DF48:
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0
	bl sub_810DE94
	ldr r0, _0810DF64 @ =gUnknown_3005090
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810DF68 @ =sub_810DC8C
	str r0, [r1]
	b _0810DF9E
	.align 2, 0
_0810DF64: .4byte gUnknown_3005090
_0810DF68: .4byte sub_810DC8C
_0810DF6C:
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x1
	bl sub_810DE6C
	bl sub_810DBD0
	strh r4, [r6, 0x2]
	lsls r0, r4, 16
	lsrs r0, 16
	bl sub_810DD80
	strh r0, [r6, 0x4]
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_810DAB4
	ldr r1, _0810DFA8 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810DFAC @ =sub_810E274
	str r1, [r0]
_0810DF9E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810DFA8: .4byte gUnknown_3005090
_0810DFAC: .4byte sub_810E274
	thumb_func_end sub_810DEA0

	thumb_func_start sub_810DFB0
sub_810DFB0: @ 810DFB0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_810DE6C
	bl sub_810DB5C
	ldr r1, _0810DFD8 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810DFDC @ =sub_810DEA0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810DFD8: .4byte gUnknown_3005090
_0810DFDC: .4byte sub_810DEA0
	thumb_func_end sub_810DFB0

	thumb_func_start sub_810DFE0
sub_810DFE0: @ 810DFE0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, r0, 2
	adds r5, r0
	lsls r5, 3
	ldr r0, _0810E09C @ =gUnknown_3005098
	mov r8, r0
	adds r6, r5, r0
	ldrb r0, [r6]
	movs r1, 0x10
	movs r2, 0x1
	bl sub_8107BD0
	strh r4, [r6, 0x2]
	ldr r0, _0810E0A0 @ =gUnknown_203ADBC
	ldr r0, [r0]
	movs r1, 0
	mov r9, r1
	strb r4, [r0, 0x4]
	ldr r4, _0810E0A4 @ =gUnknown_2021CD0
	ldrh r0, [r6, 0x2]
	bl sub_810DD68
	lsls r0, 16
	lsrs r0, 16
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r4, _0810E0A8 @ =gUnknown_2021D18
	ldr r1, _0810E0AC @ =gUnknown_841633F
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r1, 0x3
	str r1, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl sub_810EA34
	movs r4, 0x20
	negs r4, r4
	ldrb r0, [r6]
	bl ListMenuGetYCoordForPrintingArrowCursor
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80986A8
	movs r0, 0
	bl sub_8098660
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_810DAB4
	movs r1, 0x8
	negs r1, r1
	add r8, r1
	add r5, r8
	ldr r0, _0810E0B0 @ =sub_810E0B4
	str r0, [r5]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E09C: .4byte gUnknown_3005098
_0810E0A0: .4byte gUnknown_203ADBC
_0810E0A4: .4byte gUnknown_2021CD0
_0810E0A8: .4byte gUnknown_2021D18
_0810E0AC: .4byte gUnknown_841633F
_0810E0B0: .4byte sub_810E0B4
	thumb_func_end sub_810DFE0

	thumb_func_start sub_810E0B4
sub_810E0B4: @ 810E0B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	mov r8, r6
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	ldr r0, _0810E11C @ =gUnknown_3005098
	adds r4, r0
	ldrb r0, [r4]
	bl ListMenuHandleInput
	ldrb r0, [r4]
	ldr r7, _0810E120 @ =gUnknown_203ADD0
	adds r2, r7, 0x2
	adds r1, r7, 0
	bl get_coro_args_x18_x1A
	movs r5, 0x20
	negs r5, r5
	ldrb r0, [r4]
	bl ListMenuGetYCoordForPrintingArrowCursor
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_80986A8
	ldr r0, _0810E124 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x5
	ands r0, r1
	cmp r0, 0
	beq _0810E12C
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _0810E128 @ =gUnknown_203ADBC
	ldr r1, [r0]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	subs r0, r7, 0x4
	ldrh r1, [r0, 0x4]
	ldrh r0, [r0, 0x6]
	adds r1, r0
	adds r0, r6, 0
	bl sub_810E160
	b _0810E150
	.align 2, 0
_0810E11C: .4byte gUnknown_3005098
_0810E120: .4byte gUnknown_203ADD0
_0810E124: .4byte gMain
_0810E128: .4byte gUnknown_203ADBC
_0810E12C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810E150
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _0810E15C @ =gUnknown_203ADBC
	ldr r1, [r0]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	subs r0, r7, 0x4
	ldrh r1, [r0, 0x4]
	ldrh r0, [r0, 0x6]
	adds r1, r0
	mov r0, r8
	bl sub_810E200
_0810E150:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E15C: .4byte gUnknown_203ADBC
	thumb_func_end sub_810E0B4

	thumb_func_start sub_810E160
sub_810E160: @ 810E160
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r7, r0, 3
	ldr r0, _0810E190 @ =gUnknown_3005098
	mov r8, r0
	adds r6, r7, r0
	movs r0, 0x2
	ldrsh r1, [r6, r0]
	cmp r1, r4
	beq _0810E186
	subs r0, r4, 0x1
	cmp r1, r0
	bne _0810E194
_0810E186:
	adds r0, r2, 0
	adds r1, r4, 0
	bl sub_810E200
	b _0810E1E6
	.align 2, 0
_0810E190: .4byte gUnknown_3005098
_0810E194:
	ldr r0, _0810E1F0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r2, 0xA6
	lsls r2, 2
	adds r0, r2
	adds r2, r4, 0
	bl sub_8108D60
	ldrb r0, [r6]
	ldr r5, _0810E1F4 @ =gUnknown_203ADD0
	adds r2, r5, 0x2
	adds r1, r5, 0
	bl sub_810713C
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, r4
	bcs _0810E1C0
	subs r1, r5, 0x4
	ldrh r0, [r1, 0x6]
	subs r0, 0x1
	strh r0, [r1, 0x6]
_0810E1C0:
	bl sub_810D878
	ldr r0, _0810E1F8 @ =gUnknown_3005E70
	subs r2, r5, 0x4
	ldrh r1, [r2, 0x4]
	ldrh r2, [r2, 0x6]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6]
	movs r0, 0x1
	bl sub_8098660
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0810E1FC @ =sub_810DEA0
	str r1, [r0]
_0810E1E6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E1F0: .4byte gSaveBlock1Ptr
_0810E1F4: .4byte gUnknown_203ADD0
_0810E1F8: .4byte gUnknown_3005E70
_0810E1FC: .4byte sub_810DEA0
	thumb_func_end sub_810E160

	thumb_func_start sub_810E200
sub_810E200: @ 810E200
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r7, r1, 3
	ldr r0, _0810E264 @ =gUnknown_3005098
	mov r8, r0
	adds r6, r7, r0
	ldrb r0, [r6]
	ldr r5, _0810E268 @ =gUnknown_203ADD0
	adds r2, r5, 0x2
	adds r1, r5, 0
	bl sub_810713C
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, r4
	bcs _0810E234
	subs r1, r5, 0x4
	ldrh r0, [r1, 0x6]
	subs r0, 0x1
	strh r0, [r1, 0x6]
_0810E234:
	bl sub_810D878
	ldr r0, _0810E26C @ =gUnknown_3005E70
	subs r2, r5, 0x4
	ldrh r1, [r2, 0x4]
	ldrh r2, [r2, 0x6]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6]
	movs r0, 0x1
	bl sub_8098660
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0810E270 @ =sub_810DEA0
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E264: .4byte gUnknown_3005098
_0810E268: .4byte gUnknown_203ADD0
_0810E26C: .4byte gUnknown_3005E70
_0810E270: .4byte sub_810DEA0
	thumb_func_end sub_810E200

	thumb_func_start sub_810E274
sub_810E274: @ 810E274
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0810E340 @ =gUnknown_3005098
	mov r9, r0
	adds r6, r4, r0
	movs r0, 0x4
	bl sub_810EA9C
	movs r0, 0
	bl sub_810EAB4
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r5, 0x3
	str r5, [sp, 0x4]
	ldr r0, _0810E344 @ =gUnknown_8453F74
	str r0, [sp, 0x8]
	movs r0, 0x4
	movs r1, 0x2
	movs r2, 0x8
	movs r3, 0x2
	bl PrintTextArray
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	str r5, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r0, 0x4
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F7D8
	ldrh r0, [r6, 0x2]
	bl sub_810DD68
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0810E348 @ =gUnknown_2021CD0
	bl sub_8099E90
	ldr r6, _0810E34C @ =gUnknown_2021D18
	ldr r1, _0810E350 @ =gUnknown_84162FF
	adds r0, r6, 0
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	str r5, [sp, 0xC]
	str r0, [sp, 0x10]
	mov r0, r8
	movs r1, 0x2
	adds r2, r6, 0
	movs r3, 0
	bl sub_810EA34
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x8
	negs r0, r0
	add r9, r0
	add r4, r9
	ldr r0, _0810E354 @ =sub_810E358
	str r0, [r4]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E340: .4byte gUnknown_3005098
_0810E344: .4byte gUnknown_8453F74
_0810E348: .4byte gUnknown_2021CD0
_0810E34C: .4byte gUnknown_2021D18
_0810E350: .4byte gUnknown_84162FF
_0810E354: .4byte sub_810E358
	thumb_func_end sub_810E274

	thumb_func_start sub_810E358
sub_810E358: @ 810E358
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl ProcessMenuInputNoWrapAround
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _0810E39A
	adds r0, 0x1
	cmp r4, r0
	bne _0810E384
	movs r0, 0x5
	bl sub_80722CC
	adds r0, r5, 0
	bl sub_810E8A0
	b _0810E39A
_0810E384:
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _0810E3A0 @ =gUnknown_8453F74
	lsls r1, r4, 3
	adds r0, 0x4
	adds r1, r0
	ldr r1, [r1]
	adds r0, r6, 0
	bl _call_via_r1
_0810E39A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E3A0: .4byte gUnknown_8453F74
	thumb_func_end sub_810E358

	thumb_func_start sub_810E3A4
sub_810E3A4: @ 810E3A4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0810E3F0 @ =gUnknown_3005098
	adds r4, r6, r7
	movs r0, 0x4
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0
	bl sub_810EAF0
	movs r0, 0x4
	bl ClearWindowTilemap
	movs r0, 0x1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x2]
	bl sub_810DD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _0810E3F4
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r5, 0
	bl sub_810E418
	b _0810E40E
	.align 2, 0
_0810E3F0: .4byte gUnknown_3005098
_0810E3F4:
	movs r0, 0
	bl PutWindowTilemap
	ldrh r0, [r4, 0x2]
	bl sub_810E5E0
	bl sub_810DB98
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0810E414 @ =sub_810E6D8
	str r1, [r0]
_0810E40E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E414: .4byte sub_810E6D8
	thumb_func_end sub_810E3A4

	thumb_func_start sub_810E418
sub_810E418: @ 810E418
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 3
	ldr r7, _0810E49C @ =gUnknown_3005098
	adds r5, r6, r7
	ldrh r0, [r5, 0x2]
	bl sub_810DD68
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r1, [r5, 0x10]
	adds r0, r4, 0
	bl sub_809A084
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810E4B8
	ldr r3, _0810E4A0 @ =0x0000ffff
	movs r0, 0x1D
	movs r1, 0
	adds r2, r4, 0
	bl sub_80A2294
	ldr r1, _0810E4A4 @ =gUnknown_2021CD0
	adds r0, r4, 0
	bl sub_8099E90
	ldr r0, _0810E4A8 @ =gUnknown_2021CF0
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _0810E4AC @ =gUnknown_2021D18
	ldr r1, _0810E4B0 @ =gUnknown_84177C5
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0x2
	bl sub_810EAB4
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl PrintTextOnWindow
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0810E4B4 @ =sub_810E4F4
	b _0810E4E0
	.align 2, 0
_0810E49C: .4byte gUnknown_3005098
_0810E4A0: .4byte 0x0000ffff
_0810E4A4: .4byte gUnknown_2021CD0
_0810E4A8: .4byte gUnknown_2021CF0
_0810E4AC: .4byte gUnknown_2021D18
_0810E4B0: .4byte gUnknown_84177C5
_0810E4B4: .4byte sub_810E4F4
_0810E4B8:
	movs r0, 0x2
	bl sub_810EAB4
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, _0810E4EC @ =gUnknown_841778A
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0x2
	movs r3, 0
	bl PrintTextOnWindow
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0810E4F0 @ =sub_810E548
_0810E4E0:
	str r1, [r0]
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E4EC: .4byte gUnknown_841778A
_0810E4F0: .4byte sub_810E548
	thumb_func_end sub_810E418

	thumb_func_start sub_810E4F4
sub_810E4F4: @ 810E4F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0810E540 @ =gUnknown_3005098
	adds r5, r0, r1
	ldr r0, _0810E544 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810E51A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810E53A
_0810E51A:
	movs r0, 0x5
	bl sub_80722CC
	ldrh r0, [r5, 0x2]
	bl sub_810DD68
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r5, 0x10]
	bl sub_809A460
	bl sub_809A4E8
	adds r0, r4, 0
	bl sub_810E578
_0810E53A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E540: .4byte gUnknown_3005098
_0810E544: .4byte gMain
	thumb_func_end sub_810E4F4

	thumb_func_start sub_810E548
sub_810E548: @ 810E548
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810E574 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810E562
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810E56E
_0810E562:
	movs r0, 0x5
	bl sub_80722CC
	adds r0, r4, 0
	bl sub_810E578
_0810E56E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E574: .4byte gMain
	thumb_func_end sub_810E548

	thumb_func_start sub_810E578
sub_810E578: @ 810E578
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	ldr r0, _0810E5D4 @ =gUnknown_3005098
	adds r5, r0
	movs r0, 0x2
	bl sub_810EAF0
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r5]
	ldr r4, _0810E5D8 @ =gUnknown_203ADD0
	adds r2, r4, 0x2
	adds r1, r4, 0
	bl sub_810713C
	bl sub_810DDA4
	bl sub_810DBF0
	bl sub_810D878
	ldr r0, _0810E5DC @ =gUnknown_3005E70
	subs r4, 0x4
	ldrh r1, [r4, 0x4]
	ldrh r2, [r4, 0x6]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, 0
	bl sub_810DFB0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E5D4: .4byte gUnknown_3005098
_0810E5D8: .4byte gUnknown_203ADD0
_0810E5DC: .4byte gUnknown_3005E70
	thumb_func_end sub_810E578

	thumb_func_start sub_810E5E0
sub_810E5E0: @ 810E5E0
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 16
	lsrs r0, 16
	bl sub_810DD68
	lsls r0, 16
	lsrs r0, 16
	ldr r6, _0810E660 @ =gUnknown_2021CD0
	adds r1, r6, 0
	bl sub_8099E90
	ldr r5, _0810E664 @ =gUnknown_2021D18
	ldr r1, _0810E668 @ =gUnknown_84177AC
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x1
	bl sub_810EAB4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r2, r5, 0
	movs r3, 0
	bl PrintTextOnWindow
	adds r0, r6, 0
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r1, _0810E66C @ =gUnknown_84162B9
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x3
	bl sub_810EA9C
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x3
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0x8
	bl sub_810EA34
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E660: .4byte gUnknown_2021CD0
_0810E664: .4byte gUnknown_2021D18
_0810E668: .4byte gUnknown_84177AC
_0810E66C: .4byte gUnknown_84162B9
	thumb_func_end sub_810E5E0

	thumb_func_start sub_810E670
sub_810E670: @ 810E670
	push {r4,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x1C
	str r0, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x11
	movs r2, 0xA
	movs r3, 0xA
	bl FillWindowPixelRect
	ldr r0, _0810E6CC @ =gUnknown_2021CD0
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _0810E6D0 @ =gUnknown_2021D18
	ldr r1, _0810E6D4 @ =gUnknown_84162B9
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r0, 0x3
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x8
	bl sub_810EA34
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E6CC: .4byte gUnknown_2021CD0
_0810E6D0: .4byte gUnknown_2021D18
_0810E6D4: .4byte gUnknown_84162B9
	thumb_func_end sub_810E670

	thumb_func_start sub_810E6D8
sub_810E6D8: @ 810E6D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810E708 @ =gUnknown_3005098
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x10
	ldrh r1, [r4, 0x4]
	bl sub_80BF848
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810E70C
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	bl sub_810E670
	b _0810E796
	.align 2, 0
_0810E708: .4byte gUnknown_3005098
_0810E70C:
	ldr r0, _0810E74C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810E750
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x1
	bl sub_810EAF0
	movs r0, 0x3
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810DAB4
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_810DBD0
	adds r0, r5, 0
	bl sub_810E418
	b _0810E796
	.align 2, 0
_0810E74C: .4byte gMain
_0810E750:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810E796
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x3
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x1
	bl sub_810EAF0
	movs r0, 0x3
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810DAB4
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_810DBD0
	adds r0, r6, 0
	bl sub_810DFB0
_0810E796:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810E6D8

	thumb_func_start sub_810E79C
sub_810E79C: @ 810E79C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _0810E7DC
	movs r0, 0x4
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0
	bl sub_810EAF0
	movs r0, 0x4
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	ldr r1, _0810E7D4 @ =gUnknown_841632A
	ldr r2, _0810E7D8 @ =sub_810E848
	adds r0, r4, 0
	bl sub_810EB30
	b _0810E7EA
	.align 2, 0
_0810E7D4: .4byte gUnknown_841632A
_0810E7D8: .4byte sub_810E848
_0810E7DC:
	ldr r0, _0810E7F0 @ =gUnknown_203ADBC
	ldr r1, [r0]
	ldr r0, _0810E7F4 @ =sub_810E7F8
	str r0, [r1]
	adds r0, r4, 0
	bl sub_810DC8C
_0810E7EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E7F0: .4byte gUnknown_203ADBC
_0810E7F4: .4byte sub_810E7F8
	thumb_func_end sub_810E79C

	thumb_func_start sub_810E7F8
sub_810E7F8: @ 810E7F8
	push {lr}
	sub sp, 0xC
	movs r0, 0x6
	str r0, [sp]
	ldr r0, _0810E82C @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _0810E830 @ =sub_810E838
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x6
	movs r3, 0
	bl sub_811EA44
	bl sub_810DD54
	lsls r0, 24
	lsrs r0, 24
	bl sub_810DD68
	ldr r1, _0810E834 @ =gUnknown_203B0A0
	strh r0, [r1, 0xC]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0810E82C: .4byte sub_811FB28
_0810E830: .4byte sub_810E838
_0810E834: .4byte gUnknown_203B0A0
	thumb_func_end sub_810E7F8

	thumb_func_start sub_810E838
sub_810E838: @ 810E838
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl sub_810D3F4
	pop {r0}
	bx r0
	thumb_func_end sub_810E838

	thumb_func_start sub_810E848
sub_810E848: @ 810E848
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0810E898 @ =gUnknown_3005098
	adds r5, r0, r1
	ldr r0, _0810E89C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810E892
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x5
	movs r1, 0
	bl sub_810F260
	movs r0, 0x5
	bl ClearWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_810DAB4
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r4, 0
	bl sub_810DFB0
_0810E892:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E898: .4byte gUnknown_3005098
_0810E89C: .4byte gMain
	thumb_func_end sub_810E848

	thumb_func_start sub_810E8A0
sub_810E8A0: @ 810E8A0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0810E8EC @ =gUnknown_3005098
	adds r4, r0
	movs r0, 0x4
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0
	bl sub_810EAF0
	movs r0, 0x4
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810DAB4
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r5, 0
	bl sub_810DFB0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E8EC: .4byte gUnknown_3005098
	thumb_func_end sub_810E8A0

	thumb_func_start sub_810E8F0
sub_810E8F0: @ 810E8F0
	push {r4,lr}
	ldr r0, _0810E974 @ =gUnknown_8453F98
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r1, 0xF0
	lsls r1, 2
	movs r0, 0
	movs r2, 0xE0
	bl sub_815001C
	ldr r1, _0810E978 @ =0x000003a3
	movs r0, 0
	movs r2, 0xC0
	bl sub_814FF2C
	movs r1, 0xEB
	lsls r1, 2
	movs r0, 0
	movs r2, 0xB0
	bl sub_814FEAC
	movs r0, 0x2
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810E97C @ =gUnknown_841F408
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r4, 0
_0810E938:
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0810E938
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r4, 0
	ldr r3, _0810E980 @ =gUnknown_203ADD8
	movs r2, 0xFF
_0810E95C:
	adds r0, r4, r3
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0810E95C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E974: .4byte gUnknown_8453F98
_0810E978: .4byte 0x000003a3
_0810E97C: .4byte gUnknown_841F408
_0810E980: .4byte gUnknown_203ADD8
	thumb_func_end sub_810E8F0

	thumb_func_start sub_810E984
sub_810E984: @ 810E984
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x10
	ldr r6, [sp, 0x28]
	ldr r4, [sp, 0x2C]
	mov r8, r4
	ldr r4, [sp, 0x30]
	mov r9, r4
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r6, 24
	lsrs r6, 24
	mov r4, r8
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	mov r4, r9
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	str r1, [sp]
	mov r1, sp
	strb r0, [r1, 0x4]
	movs r0, 0x3
	strb r0, [r1, 0x5]
	mov r0, sp
	strb r2, [r0, 0x6]
	strb r3, [r0, 0x7]
	strb r2, [r0, 0x8]
	strb r3, [r0, 0x9]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r5, 0xF
	adds r0, r5, 0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r4, 0x10
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	strb r0, [r2, 0xD]
	mov r1, sp
	movs r0, 0x30
	strb r0, [r1, 0xD]
	movs r0, 0x3
	movs r1, 0x4
	bl GetFontAttribute
	mov r1, sp
	ands r5, r0
	ldrb r0, [r1, 0xC]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, 0xC]
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	mov r1, sp
	adds r6, r0
	strb r6, [r1, 0xA]
	movs r0, 0x3
	movs r1, 0x3
	bl GetFontAttribute
	mov r1, sp
	add r8, r0
	mov r0, r8
	strb r0, [r1, 0xB]
	mov r0, sp
	mov r1, r9
	movs r2, 0
	bl AddTextPrinter
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810E984

	thumb_func_start sub_810EA34
sub_810EA34: @ 810EA34
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r3
	ldr r3, [sp, 0x30]
	ldr r4, [sp, 0x34]
	ldr r6, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	mov r8, r5
	ldr r5, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	lsls r7, 24
	lsrs r7, 24
	mov r9, r7
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r6, [sp, 0x4]
	lsls r4, r5, 1
	adds r4, r5
	ldr r5, _0810EA98 @ =gUnknown_8453F8C
	adds r4, r5
	str r4, [sp, 0x8]
	mov r4, r8
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	str r2, [sp, 0x10]
	mov r2, r9
	bl AddTextPrinterParametrized2
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810EA98: .4byte gUnknown_8453F8C
	thumb_func_end sub_810EA34

	thumb_func_start sub_810EA9C
sub_810EA9C: @ 810EA9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xF0
	lsls r2, 2
	movs r1, 0
	movs r3, 0xE
	bl SetWindowBorderStyle
	pop {r0}
	bx r0
	thumb_func_end sub_810EA9C

	thumb_func_start sub_810EAB4
sub_810EAB4: @ 810EAB4
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0810EAE4 @ =gUnknown_203ADD8
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _0810EADC
	lsls r0, r1, 3
	ldr r1, _0810EAE8 @ =gUnknown_8453FD0
	adds r0, r1
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r2, _0810EAEC @ =0x000003a3
	movs r1, 0x1
	movs r3, 0xC
	bl SetWindowBorderStyle
_0810EADC:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810EAE4: .4byte gUnknown_203ADD8
_0810EAE8: .4byte gUnknown_8453FD0
_0810EAEC: .4byte 0x000003a3
	thumb_func_end sub_810EAB4

	thumb_func_start sub_810EAF0
sub_810EAF0: @ 810EAF0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810EB1C @ =gUnknown_203ADD8
	adds r4, r0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810EB1C: .4byte gUnknown_203ADD8
	thumb_func_end sub_810EAF0

	thumb_func_start sub_810EB20
sub_810EB20: @ 810EB20
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810EB2C @ =gUnknown_203ADD8
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0810EB2C: .4byte gUnknown_203ADD8
	thumb_func_end sub_810EB20

	thumb_func_start sub_810EB30
sub_810EB30: @ 810EB30
	push {r4-r6,lr}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F78A8
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xEB
	lsls r2, 2
	movs r1, 0x2
	str r1, [sp]
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	str r6, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0x5
	movs r3, 0xB
	bl DisplayMessageAndContinueTask
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810EB30

	.align 2, 0 @ Don't pad with nop.
