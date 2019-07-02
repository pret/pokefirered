	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_814D5C8
sub_814D5C8: @ 814D5C8
	push {r4,r5,lr}
	sub sp, 0xC
	bl sub_814B6F0
	adds r5, r0, 0
	cmp r5, 0
	bne _0814D5DC
	movs r0, 0x1
	negs r0, r0
	b _0814D880
_0814D5DC:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x9
	bls _0814D5E4
	b _0814D878
_0814D5E4:
	lsls r0, 2
	ldr r1, _0814D5F0 @ =_0814D5F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814D5F0: .4byte _0814D5F4
	.align 2, 0
_0814D5F4:
	.4byte _0814D61C
	.4byte _0814D63A
	.4byte _0814D660
	.4byte _0814D66E
	.4byte _0814D6F4
	.4byte _0814D73A
	.4byte _0814D768
	.4byte _0814D798
	.4byte _0814D7F4
	.4byte _0814D830
_0814D61C:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	bl ScanlineEffect_Stop
	bl ResetTempTileDataBuffers
	b _0814D878
_0814D63A:
	add r0, sp, 0x8
	movs r4, 0
	strh r4, [r0]
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _0814D658 @ =0x01000200
	bl CpuSet
	ldr r0, _0814D65C @ =gReservedSpritePaletteCount
	strb r4, [r0]
	movs r0, 0x3
	bl sub_815C980
	b _0814D878
	.align 2, 0
_0814D658: .4byte 0x01000200
_0814D65C: .4byte gReservedSpritePaletteCount
_0814D660:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _0814D878
_0814D66E:
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0814D6F0 @ =gUnknown_846E3CC
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r0, 0xE0
	lsls r0, 1
	adds r1, r5, r0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0x87
	lsls r0, 6
	adds r1, r5, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	movs r0, 0xC7
	lsls r0, 6
	adds r1, r5, r0
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
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	b _0814D878
	.align 2, 0
_0814D6F0: .4byte gUnknown_846E3CC
_0814D6F4:
	movs r4, 0x20
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r0, 0x40
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	b _0814D878
_0814D73A:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r1, _0814D764 @ =gUnknown_8EAFFC0
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	b _0814D878
	.align 2, 0
_0814D764: .4byte gUnknown_8EAFFC0
_0814D768:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	cmp r0, 0
	beq _0814D774
	b _0814D87E
_0814D774:
	bl InitStandardTextBoxWindows
	bl ResetBg0
	adds r0, r5, 0
	bl sub_814EB38
	adds r0, r5, 0
	bl sub_814EBB0
	ldr r0, _0814D794 @ =gPaletteFade
	ldrb r1, [r0, 0x8]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x8]
	b _0814D878
	.align 2, 0
_0814D794: .4byte gPaletteFade
_0814D798:
	ldr r0, _0814D7E4 @ =gUnknown_8EAFEA0
	movs r2, 0xC0
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	ldr r1, _0814D7E8 @ =gUnknown_846ED90
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, _0814D7EC @ =gUnknown_846EEC0
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, _0814D7F0 @ =gUnknown_846F058
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	adds r0, r5, 0
	bl sub_814EC80
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _0814D878
	.align 2, 0
_0814D7E4: .4byte gUnknown_8EAFEA0
_0814D7E8: .4byte gUnknown_846ED90
_0814D7EC: .4byte gUnknown_846EEC0
_0814D7F0: .4byte gUnknown_846F058
_0814D7F4:
	bl sub_80FCEA8
	movs r0, 0
	movs r1, 0
	bl sub_80FCD74
	adds r0, r5, 0
	bl sub_814ECE0
	ldr r0, _0814D82C @ =gSpriteCoordOffsetY
	ldrh r1, [r0]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x16
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	b _0814D878
	.align 2, 0
_0814D82C: .4byte gSpriteCoordOffsetY
_0814D830:
	ldr r2, _0814D874 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
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
	bl sub_814B914
	movs r0, 0
	strb r0, [r5, 0xC]
	movs r0, 0x1
	b _0814D880
	.align 2, 0
_0814D874: .4byte gPaletteFade
_0814D878:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0814D87E:
	movs r0, 0
_0814D880:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814D5C8

	thumb_func_start sub_814D888
sub_814D888: @ 814D888
	push {r4,r5,lr}
	sub sp, 0x8
	bl sub_814B6F0
	adds r5, r0, 0
	cmp r5, 0
	bne _0814D89C
	movs r0, 0x1
	negs r0, r0
	b _0814D9C2
_0814D89C:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x7
	bls _0814D8A4
	b _0814D9BA
_0814D8A4:
	lsls r0, 2
	ldr r1, _0814D8B0 @ =_0814D8B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814D8B0: .4byte _0814D8B4
	.align 2, 0
_0814D8B4:
	.4byte _0814D8D4
	.4byte _0814D8DA
	.4byte _0814D8E4
	.4byte _0814D8FA
	.4byte _0814D906
	.4byte _0814D962
	.4byte _0814D9A2
	.4byte _0814D9B2
_0814D8D4:
	bl sub_80FA42C
	b _0814D9BA
_0814D8DA:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814D9C0
_0814D8E4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _0814D9BA
_0814D8FA:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _0814D9BA
	b _0814D9C0
_0814D906:
	movs r4, 0x20
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _0814D9BA
_0814D962:
	bl FreeAllWindowBuffers
	movs r0, 0
	bl HideBg
	movs r0, 0
	bl UnsetBgTilemapBuffer
	movs r0, 0x1
	bl HideBg
	movs r0, 0x1
	bl UnsetBgTilemapBuffer
	movs r0, 0x2
	bl HideBg
	movs r0, 0x2
	bl UnsetBgTilemapBuffer
	movs r0, 0x3
	bl HideBg
	movs r0, 0x3
	bl UnsetBgTilemapBuffer
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl ClearGpuRegBits
	b _0814D9BA
_0814D9A2:
	bl DestroyWirelessStatusIndicatorSprite
	adds r0, r5, 0
	bl sub_814EF10
	bl sub_815C9F4
	b _0814D9BA
_0814D9B2:
	movs r0, 0
	strb r0, [r5, 0xC]
	movs r0, 0x1
	b _0814D9C2
_0814D9BA:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0814D9C0:
	movs r0, 0
_0814D9C2:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814D888

	thumb_func_start sub_814D9CC
sub_814D9CC: @ 814D9CC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0814DA00 @ =gSpriteCoordOffsetY
	ldrh r1, [r4, 0x2C]
	ldrh r2, [r4, 0x2A]
	adds r1, r2
	strh r1, [r0]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x16
	bl SetGpuReg
	ldrh r0, [r4, 0x12]
	cmp r0, 0x7
	bne _0814D9F8
	movs r1, 0x9C
	lsls r1, 1
	adds r0, r4, r1
	ldrh r1, [r4, 0x28]
	bl sub_814EAD4
_0814D9F8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814DA00: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_814D9CC

	thumb_func_start sub_814DA04
sub_814DA04: @ 814DA04
	movs r1, 0
	ldr r2, _0814DA18 @ =0x0000ff98
	strh r2, [r0, 0x2A]
	strh r1, [r0, 0x2C]
	ldr r0, _0814DA1C @ =gSpriteCoordOffsetX
	strh r1, [r0]
	ldr r0, _0814DA20 @ =gSpriteCoordOffsetY
	strh r2, [r0]
	bx lr
	.align 2, 0
_0814DA18: .4byte 0x0000ff98
_0814DA1C: .4byte gSpriteCoordOffsetX
_0814DA20: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_814DA04

	thumb_func_start sub_814DA24
sub_814DA24: @ 814DA24
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r10, r0
	str r1, [sp]
	movs r0, 0
	mov r9, r0
	mov r1, r10
	ldrb r1, [r1, 0x9]
	cmp r9, r1
	bcc _0814DA42
	b _0814DB60
_0814DA42:
	ldr r1, _0814DB70 @ =gUnknown_846F2EC
	mov r2, r9
	lsls r0, r2, 1
	adds r0, r1
	ldrh r2, [r0]
	mov r1, r9
	lsls r0, r1, 5
	add r0, r10
	adds r0, 0xA4
	ldrh r3, [r0]
	adds r3, 0x85
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _0814DB74 @ =gUnknown_846F470
	adds r1, r2, 0
	bl AddItemIconObjectWithCustomObjectTemplate
	lsls r0, 24
	lsrs r0, 24
	mov r2, r9
	lsls r3, r2, 2
	ldr r1, [sp]
	adds r1, 0x38
	adds r6, r1, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814DB78 @ =gSprites
	adds r1, r0
	str r1, [r6]
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r2, [r6]
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r6]
	ldr r0, [sp]
	adds r0, 0xC
	adds r0, r3
	mov r8, r0
	ldr r0, [r0]
	ldrh r0, [r0, 0x8]
	adds r0, 0x78
	strh r0, [r1, 0x20]
	ldr r1, [r6]
	ldr r0, _0814DB7C @ =0x0000fff0
	strh r0, [r1, 0x22]
	ldr r3, [r6]
	adds r5, r3, 0
	adds r5, 0x2E
	movs r0, 0x80
	lsls r0, 2
	strh r0, [r5, 0x2]
	movs r0, 0x20
	strh r0, [r5, 0x4]
	movs r0, 0x70
	strh r0, [r5, 0xE]
	mov r2, r8
	ldr r1, [r2]
	ldrh r0, [r1, 0xA]
	ldrh r1, [r1, 0x8]
	subs r0, r1
	lsls r0, 16
	asrs r1, r0, 16
	adds r0, r1, 0
	cmp r1, 0
	bge _0814DAD4
	adds r0, r1, 0x3
_0814DAD4:
	asrs r0, 2
	strh r0, [r5, 0xC]
	lsls r0, r1, 23
	lsrs r7, r0, 16
	movs r2, 0x80
	lsls r2, 2
	adds r2, 0x20
	lsrs r2, 1
	movs r0, 0x7
	movs r1, 0xFE
	lsls r1, 6
	str r3, [sp, 0x4]
	bl sub_80D8B40
	adds r4, r0, 0
	ldr r0, [r6]
	ldrh r0, [r0, 0x20]
	lsls r0, 7
	ldr r3, [sp, 0x4]
	strh r0, [r3, 0x2E]
	lsls r1, r7, 16
	asrs r1, 16
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x7
	adds r2, r4, 0
	bl sub_80D8B40
	strh r0, [r5, 0x6]
	movs r0, 0x7
	adds r1, r4, 0
	movs r2, 0x55
	bl sub_80D8ABC
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r5, 0x8]
	lsls r2, 16
	asrs r2, 16
	movs r0, 0x7
	movs r1, 0xFE
	lsls r1, 6
	bl sub_80D8B40
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0xE]
	ldr r2, _0814DB80 @ =0xffff8000
	adds r1, r2, 0
	orrs r0, r1
	strh r0, [r5, 0xE]
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _0814DB4C
	ldr r0, [r6]
	movs r1, 0x1
	bl StartSpriteAffineAnim
_0814DB4C:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r10
	ldrb r0, [r0, 0x9]
	cmp r9, r0
	bcs _0814DB60
	b _0814DA42
_0814DB60:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814DB70: .4byte gUnknown_846F2EC
_0814DB74: .4byte gUnknown_846F470
_0814DB78: .4byte gSprites
_0814DB7C: .4byte 0x0000fff0
_0814DB80: .4byte 0xffff8000
	thumb_func_end sub_814DA24

	thumb_func_start sub_814DB84
sub_814DB84: @ 814DB84
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x2E
	ldrh r0, [r4, 0x4]
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r5, 0x26]
	adds r0, r2
	strh r0, [r5, 0x26]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r6, 0x80
	lsls r6, 8
	ands r0, r6
	cmp r0, 0
	beq _0814DBEA
	ldrh r0, [r4, 0x6]
	ldrh r2, [r5, 0x2E]
	adds r0, r2
	strh r0, [r5, 0x2E]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 23
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ands r0, r6
	cmp r0, 0
	beq _0814DBEA
	ldrh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 23
	cmp r0, 0x7E
	ble _0814DBEA
	movs r0, 0
	strh r0, [r5, 0x24]
	ldrh r1, [r4, 0xE]
	ldr r0, _0814DC1C @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xE]
_0814DBEA:
	ldrh r0, [r4]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r5, 0x20]
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	ldrh r2, [r4, 0xE]
	ldr r0, _0814DC1C @ =0x00007fff
	ands r0, r2
	cmp r1, r0
	blt _0814DC16
	ldr r0, _0814DC20 @ =SpriteCallbackDummy
	str r0, [r5, 0x1C]
	adds r0, r5, 0
	bl FreeSpriteOamMatrix
	adds r0, r5, 0
	bl DestroySprite
_0814DC16:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814DC1C: .4byte 0x00007fff
_0814DC20: .4byte SpriteCallbackDummy
	thumb_func_end sub_814DB84

	thumb_func_start sub_814DC24
sub_814DC24: @ 814DC24
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r5, 0
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcs _0814DC50
	ldr r7, _0814DC58 @ =gUnknown_846F2EC
_0814DC32:
	lsls r0, r5, 1
	adds r0, r7
	ldrh r4, [r0]
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcc _0814DC32
_0814DC50:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814DC58: .4byte gUnknown_846F2EC
	thumb_func_end sub_814DC24

	thumb_func_start sub_814DC5C
sub_814DC5C: @ 814DC5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r6, r0, 0
	str r1, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0x4E
	adds r1, r6
	mov r10, r1
	mov r9, r0
	ldrb r2, [r6, 0x9]
	cmp r0, r2
	bcs _0814DD2A
	ldr r7, _0814DCC0 @ =gUnknown_846F2D0
_0814DC80:
	mov r3, r10
	ldrh r0, [r3, 0xA]
	mov r4, r9
	lsls r1, r4, 1
	add r1, r9
	asrs r0, r1
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	mov r8, r1
	cmp r1, 0
	beq _0814DD1A
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0814DCC4
	lsls r4, 2
	ldr r5, [sp]
	adds r5, 0x24
	adds r0, r5, r4
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _0814DCD6
	.align 2, 0
_0814DCC0: .4byte gUnknown_846F2D0
_0814DCC4:
	mov r0, r9
	lsls r4, r0, 2
	ldr r5, [sp]
	adds r5, 0x24
	adds r0, r5, r4
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
_0814DCD6:
	adds r3, r5, r4
	ldr r2, [r3]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r4, 0x5
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0x2C
	ldrb r0, [r2]
	subs r4, 0x3C
	adds r1, r4, 0
	ands r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	movs r0, 0x3
	mov r1, r8
	ands r1, r0
	mov r8, r1
	subs r1, 0x1
	lsls r1, 1
	adds r0, r1, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r2, 0x24]
	ldr r2, [r3]
	ldr r3, _0814DD38 @ =gUnknown_846F2D1
	adds r1, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	strh r0, [r2, 0x26]
_0814DD1A:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r4, [r6, 0x9]
	cmp r9, r4
	bcc _0814DC80
_0814DD2A:
	ldr r0, [sp, 0x4]
	cmp r0, 0
	bne _0814DD3C
	adds r2, r6, 0
	adds r2, 0x25
	ldrb r1, [r2]
	b _0814DE18
	.align 2, 0
_0814DD38: .4byte gUnknown_846F2D1
_0814DD3C:
	ldrh r0, [r6, 0x28]
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r1, r8
	str r1, [sp, 0x8]
	movs r2, 0
	mov r9, r2
	mov r3, r10
	ldrh r1, [r3, 0xC]
	lsls r0, r1, 1
	adds r0, 0x3
	adds r6, 0x25
	str r6, [sp, 0xC]
	adds r3, r1, 0
	cmp r9, r0
	bge _0814DE0C
_0814DD64:
	mov r4, r9
	lsls r1, r4, 2
	ldr r0, [sp]
	adds r0, 0x4C
	adds r7, r0, r1
	ldr r2, [r7]
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0814DDFA
	ldr r0, _0814DDD0 @ =sub_814F0D8
	str r0, [r2, 0x1C]
	lsls r1, r4, 1
	ldr r3, _0814DDD4 @ =gUnknown_846F2D6
	adds r0, r1, r3
	movs r4, 0
	ldrsb r4, [r0, r4]
	adds r0, r4, 0
	adds r0, 0x78
	strh r0, [r2, 0x20]
	ldr r2, [r7]
	ldr r0, _0814DDD8 @ =gUnknown_846F2D7
	adds r1, r0
	movs r6, 0
	ldrsb r6, [r1, r6]
	mov r1, r8
	lsls r0, r1, 2
	subs r0, 0x88
	subs r0, r6, r0
	strh r0, [r2, 0x22]
	ldr r5, [r7]
	ldr r2, [sp, 0x8]
	lsls r1, r2, 2
	adds r0, r4, 0
	bl __divsi3
	adds r4, r0
	strh r4, [r5, 0x24]
	ldr r0, [r7]
	strh r6, [r0, 0x26]
	mov r3, r10
	ldrb r1, [r3, 0x4]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0814DDDC
	ldr r0, [r7]
	movs r1, 0x1
	bl StartSpriteAnim
	b _0814DDE4
	.align 2, 0
_0814DDD0: .4byte sub_814F0D8
_0814DDD4: .4byte gUnknown_846F2D6
_0814DDD8: .4byte gUnknown_846F2D7
_0814DDDC:
	ldr r0, [r7]
	movs r1, 0
	bl StartSpriteAnim
_0814DDE4:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r4, r10
	ldrh r3, [r4, 0xC]
	cmp r0, 0x3
	bls _0814DDFA
	movs r0, 0
	mov r8, r0
_0814DDFA:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r0, r3, 1
	adds r0, 0x3
	cmp r9, r0
	blt _0814DD64
_0814DE0C:
	ldr r2, [sp, 0xC]
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0814DE22
_0814DE18:
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _0814DE40
_0814DE22:
	ldr r3, [sp, 0x4]
	cmp r3, 0x1
	bne _0814DE30
	movs r0, 0x47
	bl PlaySE
	b _0814DE36
_0814DE30:
	movs r0, 0x46
	bl PlaySE
_0814DE36:
	ldr r4, [sp, 0xC]
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_0814DE40:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_814DC5C

	thumb_func_start sub_814DE50
sub_814DE50: @ 814DE50
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r2, 0
	ldrb r0, [r5, 0x9]
	cmp r2, r0
	bcs _0814DE82
	adds r4, r6, 0
	adds r4, 0x24
	movs r7, 0x4
	adds r3, r0, 0
_0814DE66:
	lsls r0, r2, 2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, 0x3E
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _0814DE9C
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _0814DE66
_0814DE82:
	movs r2, 0
	adds r3, r6, 0
	adds r3, 0x4C
	movs r4, 0x4
_0814DE8A:
	lsls r0, r2, 2
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, 0x3E
	ldrb r1, [r0]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _0814DEA0
_0814DE9C:
	movs r0, 0
	b _0814DEB8
_0814DEA0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _0814DE8A
	movs r1, 0x2C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0814DEB6
	movs r0, 0
	strh r0, [r5, 0x2C]
_0814DEB6:
	movs r0, 0x1
_0814DEB8:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_814DE50

	thumb_func_start sub_814DEC0
sub_814DEC0: @ 814DEC0
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r4, r1, 16
	lsrs r4, 16
	movs r7, 0
	movs r5, 0xE1
	lsls r5, 4
	adds r0, r4, 0
	adds r1, r5, 0
	bl __udivsi3
	strh r0, [r6, 0x4]
	adds r0, r4, 0
	adds r1, r5, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3C
	bl __udivsi3
	strh r0, [r6, 0x6]
	adds r0, r4, 0
	movs r1, 0x3C
	bl __umodsi3
	lsls r0, 24
	asrs r0, 16
	movs r1, 0x4
	bl sub_80D8AA0
	adds r2, r7, 0
	lsls r0, 16
	asrs r3, r0, 16
	movs r0, 0x7
	mov r12, r0
	ldr r5, _0814DF3C @ =gUnknown_846E450
	movs r4, 0x1
_0814DF0C:
	mov r0, r12
	subs r1, r0, r2
	adds r0, r3, 0
	asrs r0, r1
	ands r0, r4
	cmp r0, 0
	beq _0814DF22
	lsls r0, r2, 2
	adds r0, r5
	ldr r0, [r0]
	adds r7, r0
_0814DF22:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0814DF0C
	ldr r1, _0814DF40 @ =0x000f4240
	adds r0, r7, 0
	bl __udivsi3
	strh r0, [r6, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814DF3C: .4byte gUnknown_846E450
_0814DF40: .4byte 0x000f4240
	thumb_func_end sub_814DEC0

	thumb_func_start sub_814DF44
sub_814DF44: @ 814DF44
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	mov r1, r8
	bl GetStringWidth
	lsls r4, 2
	lsrs r0, 1
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r5, 1
	adds r0, r5
	ldr r1, _0814DFA0 @ =gUnknown_846E3DC
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	mov r0, r8
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl AddTextPrinterParameterized3
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814DFA0: .4byte gUnknown_846E3DC
	thumb_func_end sub_814DF44

	thumb_func_start sub_814DFA4
sub_814DFA4: @ 814DFA4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	str r0, [sp, 0xC]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x14]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x18]
	movs r0, 0
	mov r8, r0
	movs r1, 0
	str r1, [sp, 0x1C]
	movs r2, 0
	str r2, [sp, 0x20]
	ldr r4, [sp, 0xC]
	adds r4, 0x68
	str r4, [sp, 0x24]
	ldr r0, [sp, 0xC]
	ldrb r0, [r0, 0x9]
	cmp r8, r0
	bcc _0814DFE0
	b _0814E30C
_0814DFE0:
	ldr r1, [sp, 0x10]
	lsls r1, 2
	str r1, [sp, 0x28]
	movs r4, 0xDD
	lsls r4, 1
	ldr r2, [sp, 0xC]
	adds r4, r2, r4
	str r4, [sp, 0x2C]
_0814DFF0:
	bl UnkTextUtil_Reset
	ldr r0, [sp, 0x10]
	cmp r0, 0x1
	beq _0814E0E4
	cmp r0, 0x1
	bgt _0814E00A
	cmp r0, 0
	beq _0814E01A
	mov r1, r8
	lsls r1, 3
	mov r9, r1
	b _0814E0C8
_0814E00A:
	ldr r0, [sp, 0x10]
	cmp r0, 0x2
	bne _0814E012
	b _0814E200
_0814E012:
	mov r1, r8
	lsls r1, 3
	mov r9, r1
	b _0814E0C8
_0814E01A:
	ldr r0, [sp, 0x24]
	adds r0, 0x20
	add r0, r8
	ldrb r0, [r0]
	str r0, [sp, 0x1C]
	mov r0, r8
	lsls r3, r0, 1
	ldr r2, [sp, 0x24]
	adds r2, 0xC
	cmp r0, 0
	beq _0814E048
	adds r0, r2, r3
	mov r1, r8
	subs r1, 0x1
	lsls r1, 1
	adds r1, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0814E048
	mov r4, r8
	adds r1, r4, 0
	str r1, [sp, 0x20]
_0814E048:
	ldr r1, [sp, 0x28]
	ldr r4, [sp, 0x10]
	adds r0, r1, r4
	lsls r0, 1
	adds r0, r3, r0
	adds r0, r2, r0
	ldrh r1, [r0]
	ldr r0, _0814E0D8 @ =gStringVar1
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, _0814E0DC @ =gUnknown_846F4B8
	ldr r1, [sp, 0x28]
	adds r0, r1, r0
	ldr r5, [r0]
	movs r0, 0x2
	adds r1, r5, 0
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	ldr r2, [sp, 0x14]
	subs r0, r2, r0
	subs r0, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, [sp, 0x2C]
	ldrb r0, [r4]
	mov r1, r8
	lsls r6, r1, 3
	subs r4, r6, r1
	lsls r4, 1
	ldr r2, [sp, 0x18]
	adds r4, r2, r4
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0814E0E0 @ =gUnknown_846E3DC
	str r1, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	adds r2, r7, 0
	adds r3, r4, 0
	bl AddTextPrinterParameterized3
	ldr r1, [sp, 0x2C]
	ldrb r0, [r1]
	adds r2, r7, 0
	subs r2, 0x18
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0814E0E0 @ =gUnknown_846E3DC
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r1, _0814E0D8 @ =gStringVar1
	str r1, [sp, 0x8]
	movs r1, 0x2
	adds r3, r4, 0
	bl AddTextPrinterParameterized3
	mov r9, r6
_0814E0C8:
	ldr r6, [sp, 0x20]
	adds r6, 0xA2
	ldr r2, [sp, 0x1C]
	lsls r5, r2, 5
	movs r4, 0x1
	add r4, r8
	mov r10, r4
	b _0814E27E
	.align 2, 0
_0814E0D8: .4byte gStringVar1
_0814E0DC: .4byte gUnknown_846F4B8
_0814E0E0: .4byte gUnknown_846E3DC
_0814E0E4:
	ldr r0, [sp, 0x24]
	add r0, r8
	adds r0, 0x28
	ldrb r0, [r0]
	str r0, [sp, 0x1C]
	mov r0, r8
	lsls r3, r0, 1
	ldr r2, [sp, 0x24]
	adds r2, 0xC
	cmp r0, 0
	beq _0814E116
	adds r0, r3, 0
	adds r0, 0xA
	adds r0, r2, r0
	mov r4, r8
	lsls r1, r4, 1
	adds r1, 0x8
	adds r1, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0814E116
	mov r1, r8
	adds r0, r1, 0
	str r0, [sp, 0x20]
_0814E116:
	ldr r0, [sp, 0x28]
	ldr r1, [sp, 0x10]
	adds r4, r0, r1
	lsls r4, 1
	adds r4, r3, r4
	adds r4, r2, r4
	ldrh r1, [r4]
	lsrs r1, 4
	ldr r0, _0814E1E4 @ =gStringVar1
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r3, 0
	ldrb r0, [r4]
	movs r7, 0xF
	ands r7, r0
	movs r2, 0
	ldr r4, [sp, 0x10]
	lsls r4, 2
	str r4, [sp, 0x34]
	mov r0, r8
	lsls r0, 3
	mov r9, r0
	ldr r1, [sp, 0x14]
	subs r1, 0x4
	str r1, [sp, 0x30]
	ldr r6, [sp, 0x20]
	adds r6, 0xA2
	ldr r4, [sp, 0x1C]
	lsls r5, r4, 5
	movs r0, 0x1
	add r0, r8
	mov r10, r0
	movs r1, 0x1
	mov r12, r1
	ldr r4, _0814E1E8 @ =gUnknown_846E450
_0814E160:
	movs r0, 0x3
	subs r1, r0, r2
	adds r0, r7, 0
	asrs r0, r1
	mov r1, r12
	ands r0, r1
	cmp r0, 0
	beq _0814E178
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	adds r3, r0
_0814E178:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0814E160
	adds r0, r3, 0
	ldr r1, _0814E1EC @ =0x000f4240
	bl __udivsi3
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0814E1F0 @ =gStringVar2
	adds r1, r7, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0814E1F4 @ =gUnknown_846F4B8
	ldr r2, [sp, 0x34]
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0814E1F8 @ =gStringVar4
	bl StringExpandPlaceholders
	movs r0, 0x2
	ldr r1, _0814E1F8 @ =gStringVar4
	movs r2, 0
	bl GetStringWidth
	adds r2, r0, 0
	ldr r4, [sp, 0x30]
	subs r2, r4, r2
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [sp, 0x2C]
	ldrb r0, [r1]
	mov r4, r9
	mov r1, r8
	subs r3, r4, r1
	lsls r3, 1
	ldr r4, [sp, 0x18]
	adds r3, r4, r3
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _0814E1FC @ =gUnknown_846E3DC
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r1, _0814E1F8 @ =gStringVar4
	str r1, [sp, 0x8]
	movs r1, 0x2
	bl AddTextPrinterParameterized3
	b _0814E27E
	.align 2, 0
_0814E1E4: .4byte gStringVar1
_0814E1E8: .4byte gUnknown_846E450
_0814E1EC: .4byte 0x000f4240
_0814E1F0: .4byte gStringVar2
_0814E1F4: .4byte gUnknown_846F4B8
_0814E1F8: .4byte gStringVar4
_0814E1FC: .4byte gUnknown_846E3DC
_0814E200:
	mov r2, r8
	str r2, [sp, 0x1C]
	mov r0, r8
	adds r4, r0, 0
	str r4, [sp, 0x20]
	lsls r5, r0, 5
	ldr r1, [sp, 0xC]
	adds r0, r1, r5
	adds r0, 0xA4
	ldrb r2, [r0]
	cmp r2, 0x2B
	bls _0814E21A
	movs r2, 0
_0814E21A:
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _0814E294 @ =sBerries
	adds r1, r0
	ldr r0, _0814E298 @ =gStringVar1
	bl StringCopy
	ldr r0, _0814E29C @ =gUnknown_846F4B8
	ldr r1, [r0, 0x8]
	ldr r0, _0814E2A0 @ =gStringVar4
	bl StringExpandPlaceholders
	movs r0, 0x2
	ldr r1, _0814E2A0 @ =gStringVar4
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	adds r2, r0, 0
	ldr r4, [sp, 0x14]
	subs r2, r4, r2
	subs r2, 0x4
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [sp, 0x2C]
	ldrb r0, [r1]
	mov r1, r8
	lsls r4, r1, 3
	subs r3, r4, r1
	lsls r3, 1
	ldr r1, [sp, 0x18]
	adds r3, r1, r3
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _0814E2A4 @ =gUnknown_846E3DC
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r1, _0814E2A0 @ =gStringVar4
	str r1, [sp, 0x8]
	movs r1, 0x2
	bl AddTextPrinterParameterized3
	mov r9, r4
	mov r6, r8
	adds r6, 0xA2
	movs r2, 0x1
	add r2, r8
	mov r10, r2
_0814E27E:
	ldr r0, [sp, 0x1C]
	ldr r4, [sp, 0xC]
	ldrb r4, [r4, 0x8]
	cmp r0, r4
	bne _0814E2B0
	ldr r0, _0814E2A8 @ =gStringVar3
	ldr r1, _0814E2AC @ =gUnknown_841D020
	bl StringCopy
	b _0814E2B8
	.align 2, 0
_0814E294: .4byte sBerries
_0814E298: .4byte gStringVar1
_0814E29C: .4byte gUnknown_846F4B8
_0814E2A0: .4byte gStringVar4
_0814E2A4: .4byte gUnknown_846E3DC
_0814E2A8: .4byte gStringVar3
_0814E2AC: .4byte gUnknown_841D020
_0814E2B0:
	ldr r0, _0814E31C @ =gStringVar3
	ldr r1, _0814E320 @ =gUnknown_841D02C
	bl StringCopy
_0814E2B8:
	ldr r4, _0814E31C @ =gStringVar3
	strb r6, [r4]
	adds r1, r5, 0
	adds r1, 0x98
	ldr r0, [sp, 0xC]
	adds r1, r0, r1
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _0814E324 @ =gStringVar4
	adds r1, r4, 0
	bl UnkTextUtil_StringExpandPlaceholders
	ldr r1, [sp, 0x2C]
	ldrb r0, [r1]
	mov r2, r9
	mov r4, r8
	subs r3, r2, r4
	lsls r3, 1
	ldr r1, [sp, 0x18]
	adds r3, r1, r3
	lsls r3, 24
	lsrs r3, 24
	ldr r2, _0814E328 @ =gUnknown_846E3DC
	str r2, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r1, _0814E324 @ =gStringVar4
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x4
	bl AddTextPrinterParameterized3
	mov r2, r10
	lsls r0, r2, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, [sp, 0xC]
	ldrb r4, [r4, 0x9]
	cmp r8, r4
	bcs _0814E30C
	b _0814DFF0
_0814E30C:
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814E31C: .4byte gStringVar3
_0814E320: .4byte gUnknown_841D02C
_0814E324: .4byte gStringVar4
_0814E328: .4byte gUnknown_846E3DC
	thumb_func_end sub_814DFA4

	thumb_func_start sub_814E32C
sub_814E32C: @ 814E32C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	mov r8, r0
	movs r0, 0
	mov r10, r0
	movs r6, 0
	movs r1, 0
	str r1, [sp, 0xC]
	mov r2, r8
	adds r2, 0x68
	str r2, [sp, 0x10]
	movs r4, 0xDD
	lsls r4, 1
	add r4, r8
	mov r9, r4
	ldrb r0, [r4]
	movs r1, 0x4
	bl GetWindowAttribute
	lsls r0, 27
	movs r1, 0xD6
	lsls r1, 24
	adds r0, r1
	lsrs r7, r0, 24
	movs r0, 0x9C
	lsls r0, 1
	add r0, r8
	ldr r2, [sp, 0x10]
	ldrh r1, [r2, 0x4]
	bl sub_814DEC0
	ldrb r0, [r4]
	ldr r4, _0814E560 @ =gUnknown_846E3DC
	str r4, [sp]
	str r6, [sp, 0x4]
	ldr r1, _0814E564 @ =gUnknown_841D050
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	ldr r4, _0814E568 @ =gUnknown_841D088
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xBE
	subs r0, r1, r0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r2, r9
	ldrb r0, [r2]
	ldr r1, _0814E560 @ =gUnknown_846E3DC
	str r1, [sp]
	mov r2, r10
	str r2, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	adds r0, r6, 0
	subs r0, 0x20
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x9F
	lsls r0, 1
	add r0, r8
	movs r4, 0
	ldrsh r1, [r0, r4]
	ldr r0, _0814E56C @ =gStringVar1
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0814E570 @ =gStringVar2
	movs r1, 0xA0
	lsls r1, 1
	add r1, r8
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r5, _0814E574 @ =gStringVar4
	ldr r1, _0814E578 @ =gUnknown_841D080
	adds r0, r5, 0
	bl StringExpandPlaceholders
	mov r4, r9
	ldrb r0, [r4]
	ldr r1, _0814E560 @ =gUnknown_846E3DC
	str r1, [sp]
	mov r2, r10
	str r2, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	ldr r4, _0814E57C @ =gUnknown_841D078
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	subs r1, r6, 0x3
	subs r1, r0
	lsls r1, 24
	lsrs r6, r1, 24
	mov r1, r9
	ldrb r0, [r1]
	ldr r2, _0814E560 @ =gUnknown_846E3DC
	str r2, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	adds r0, r6, 0
	subs r0, 0x9
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x9E
	lsls r0, 1
	add r0, r8
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _0814E56C @ =gStringVar1
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r1, _0814E580 @ =gUnknown_841D074
	adds r0, r5, 0
	bl StringExpandPlaceholders
	mov r4, r9
	ldrb r0, [r4]
	ldr r1, _0814E560 @ =gUnknown_846E3DC
	str r1, [sp]
	mov r2, r10
	str r2, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	adds r0, r7, 0
	adds r0, 0xE
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
	ldr r4, _0814E560 @ =gUnknown_846E3DC
	str r4, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	ldr r1, _0814E584 @ =gUnknown_841D058
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	ldr r4, _0814E588 @ =gUnknown_841D098
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r2, 0xBE
	subs r0, r2, r0
	lsls r0, 24
	str r0, [sp, 0x18]
	lsrs r6, r0, 24
	mov r1, r9
	ldrb r0, [r1]
	ldr r2, _0814E560 @ =gUnknown_846E3DC
	str r2, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x3
	adds r2, r6, 0
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	mov r4, r8
	ldrb r2, [r4, 0x16]
	ldrh r0, [r4, 0x16]
	mov r12, r0
	movs r1, 0x7
	mov r9, r1
	movs r5, 0x1
	ldr r3, _0814E58C @ =gUnknown_846E450
_0814E4CC:
	mov r4, r9
	mov r0, r10
	subs r1, r4, r0
	adds r0, r2, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _0814E4EA
	mov r1, r10
	lsls r0, r1, 2
	adds r0, r3
	ldr r0, [r0]
	ldr r4, [sp, 0xC]
	adds r4, r0
	str r4, [sp, 0xC]
_0814E4EA:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0x7
	bls _0814E4CC
	ldr r0, _0814E56C @ =gStringVar1
	mov r2, r12
	lsrs r1, r2, 8
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _0814E570 @ =gStringVar2
	ldr r1, _0814E590 @ =0x000f4240
	ldr r0, [sp, 0xC]
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r4, _0814E574 @ =gStringVar4
	ldr r1, _0814E594 @ =gUnknown_841D090
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r6, 0
	subs r0, 0x26
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r0, 0x25
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0814E59C
	movs r0, 0xDD
	lsls r0, 1
	add r0, r8
	ldrb r0, [r0]
	ldr r1, _0814E598 @ =gUnknown_846E3EB
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	b _0814E5B6
	.align 2, 0
_0814E560: .4byte gUnknown_846E3DC
_0814E564: .4byte gUnknown_841D050
_0814E568: .4byte gUnknown_841D088
_0814E56C: .4byte gStringVar1
_0814E570: .4byte gStringVar2
_0814E574: .4byte gStringVar4
_0814E578: .4byte gUnknown_841D080
_0814E57C: .4byte gUnknown_841D078
_0814E580: .4byte gUnknown_841D074
_0814E584: .4byte gUnknown_841D058
_0814E588: .4byte gUnknown_841D098
_0814E58C: .4byte gUnknown_846E450
_0814E590: .4byte 0x000f4240
_0814E594: .4byte gUnknown_841D090
_0814E598: .4byte gUnknown_846E3EB
_0814E59C:
	movs r0, 0xDD
	lsls r0, 1
	add r0, r8
	ldrb r0, [r0]
	ldr r1, _0814E630 @ =gUnknown_846E3DC
	str r1, [sp]
	str r2, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
_0814E5B6:
	adds r0, r7, 0
	adds r0, 0xE
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0xDD
	lsls r4, 1
	add r8, r4
	mov r1, r8
	ldrb r0, [r1]
	ldr r2, _0814E630 @ =gUnknown_846E3DC
	mov r9, r2
	str r2, [sp]
	movs r5, 0
	str r5, [sp, 0x4]
	ldr r1, _0814E634 @ =gUnknown_841D068
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x2
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	ldr r0, _0814E638 @ =gStringVar1
	ldr r4, [sp, 0x10]
	ldrh r1, [r4, 0x8]
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _0814E63C @ =gStringVar4
	ldr r1, _0814E640 @ =gUnknown_841D0A4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xBE
	subs r1, r0
	lsls r1, 24
	lsrs r6, r1, 24
	mov r1, r8
	ldrb r0, [r1]
	mov r2, r9
	str r2, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	adds r2, r6, 0
	adds r3, r7, 0
	bl AddTextPrinterParameterized3
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814E630: .4byte gUnknown_846E3DC
_0814E634: .4byte gUnknown_841D068
_0814E638: .4byte gStringVar1
_0814E63C: .4byte gStringVar4
_0814E640: .4byte gUnknown_841D0A4
	thumb_func_end sub_814E32C

	thumb_func_start sub_814E644
sub_814E644: @ 814E644
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r6, r1, 0
	adds r0, r6, 0
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0814E658
	b _0814E7F8
_0814E658:
	lsls r0, 2
	ldr r1, _0814E664 @ =_0814E668
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814E664: .4byte _0814E668
	.align 2, 0
_0814E668:
	.4byte _0814E680
	.4byte _0814E6CC
	.4byte _0814E6E0
	.4byte _0814E704
	.4byte _0814E7D8
	.4byte _0814E7E0
_0814E680:
	ldrb r0, [r4, 0x9]
	subs r0, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0
	bl sub_814EB04
	ldrh r0, [r4, 0x12]
	lsls r0, 3
	ldr r2, _0814E6A8 @ =gUnknown_846E3D0
	mov r1, sp
	adds r0, r2
	ldm r0!, {r2,r3}
	stm r1!, {r2,r3}
	ldrh r0, [r4, 0x12]
	cmp r0, 0xD
	bne _0814E6B0
	ldr r0, _0814E6AC @ =gUnknown_846E448
	adds r0, 0x4
	b _0814E6B2
	.align 2, 0
_0814E6A8: .4byte gUnknown_846E3D0
_0814E6AC: .4byte gUnknown_846E448
_0814E6B0:
	ldr r0, _0814E6C8 @ =gUnknown_846E448
_0814E6B2:
	adds r0, r5, r0
	ldrb r1, [r0]
	mov r0, sp
	strb r1, [r0, 0x4]
	mov r0, sp
	bl AddWindow
	adds r1, r6, 0
	adds r1, 0x82
	strb r0, [r1]
	b _0814E7F8
	.align 2, 0
_0814E6C8: .4byte gUnknown_846E448
_0814E6CC:
	adds r4, r6, 0
	adds r4, 0x82
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0
	bl FillWindowPixelBuffer
	b _0814E7F8
_0814E6E0:
	adds r5, r6, 0
	adds r5, 0x82
	ldrb r0, [r5]
	ldr r4, _0814E700 @ =0x0000021d
	adds r1, r4, 0
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	ldrb r0, [r5]
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0xD
	bl SetWindowBorderStyle
	b _0814E7F8
	.align 2, 0
_0814E700: .4byte 0x0000021d
_0814E704:
	ldrb r0, [r4, 0x9]
	subs r0, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4, 0x12]
	cmp r0, 0xC
	beq _0814E764
	cmp r0, 0xC
	bgt _0814E71C
	cmp r0, 0xB
	beq _0814E722
	b _0814E7F8
_0814E71C:
	cmp r0, 0xD
	beq _0814E7B4
	b _0814E7F8
_0814E722:
	adds r0, r6, 0
	adds r0, 0x82
	ldrb r0, [r0]
	ldr r3, _0814E75C @ =gUnknown_841D0A8
	movs r1, 0x16
	movs r2, 0x3
	bl sub_814DF44
	ldr r0, _0814E760 @ =gUnknown_846E448
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r3, 3
	ldrb r1, [r4, 0x9]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xB0
	bl sub_814DFA4
	adds r1, r6, 0
	adds r1, 0x80
	movs r0, 0x5
	b _0814E800
	.align 2, 0
_0814E75C: .4byte gUnknown_841D0A8
_0814E760: .4byte gUnknown_846E448
_0814E764:
	adds r0, r6, 0
	adds r0, 0x82
	ldrb r0, [r0]
	ldr r2, _0814E7AC @ =gUnknown_846F4B8
	adds r1, r4, 0
	adds r1, 0x8F
	ldrb r1, [r1]
	adds r1, 0x3
	lsls r1, 2
	adds r1, r2
	ldr r3, [r1]
	movs r1, 0x16
	movs r2, 0x4
	bl sub_814DF44
	ldr r0, _0814E7B0 @ =gUnknown_846E448
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r3, 3
	ldrb r1, [r4, 0x9]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xB0
	bl sub_814DFA4
	adds r1, r6, 0
	adds r1, 0x80
	movs r0, 0x5
	b _0814E800
	.align 2, 0
_0814E7AC: .4byte gUnknown_846F4B8
_0814E7B0: .4byte gUnknown_846E448
_0814E7B4:
	adds r0, r6, 0
	adds r0, 0x82
	ldrb r0, [r0]
	ldr r3, _0814E7D4 @ =gUnknown_841D0C0
	movs r1, 0x18
	movs r2, 0x3
	bl sub_814DF44
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xC0
	movs r3, 0x10
	bl sub_814DFA4
	b _0814E7F8
	.align 2, 0
_0814E7D4: .4byte gUnknown_841D0C0
_0814E7D8:
	adds r0, r4, 0
	bl sub_814E32C
	b _0814E7F8
_0814E7E0:
	adds r0, r6, 0
	adds r0, 0x82
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	adds r1, r6, 0
	adds r1, 0x80
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _0814E804
_0814E7F8:
	adds r1, r6, 0
	adds r1, 0x80
	ldrb r0, [r1]
	adds r0, 0x1
_0814E800:
	strb r0, [r1]
	movs r0, 0
_0814E804:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_814E644

	thumb_func_start sub_814E80C
sub_814E80C: @ 814E80C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0xDD
	lsls r0, 1
	adds r5, r4, r0
	ldrb r0, [r5]
	movs r1, 0x1
	bl ClearMenuWindow
	ldrb r0, [r5]
	bl RemoveWindow
	adds r0, r4, 0
	bl sub_814EBB0
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814E80C

	thumb_func_start sub_814E830
sub_814E830: @ 814E830
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	mov r9, r0
	mov r10, r0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0814E864 @ =gTasks+0x8
	adds r7, r0, r1
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	beq _0814E8B0
	cmp r0, 0x1
	bgt _0814E868
	cmp r0, 0
	beq _0814E876
	b _0814EA66
	.align 2, 0
_0814E864: .4byte gTasks+0x8
_0814E868:
	cmp r0, 0x2
	bne _0814E86E
	b _0814EA2C
_0814E86E:
	cmp r0, 0x3
	bne _0814E874
	b _0814EA40
_0814E874:
	b _0814EA66
_0814E876:
	ldr r0, _0814E8A8 @ =gUnknown_846E3F0
	bl AddWindow
	strh r0, [r7, 0x2]
	lsls r0, 24
	lsrs r0, 24
	bl PutWindowTilemap
	ldrb r0, [r7, 0x2]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldrb r0, [r7, 0x2]
	ldr r4, _0814E8AC @ =0x0000021d
	adds r1, r4, 0
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	ldrb r0, [r7, 0x2]
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0xD
	bl SetWindowBorderStyle
	b _0814EA66
	.align 2, 0
_0814E8A8: .4byte gUnknown_846E3F0
_0814E8AC: .4byte 0x0000021d
_0814E8B0:
	ldr r5, _0814E9FC @ =gUnknown_841D118
	movs r0, 0x1
	negs r0, r0
	mov r8, r0
	movs r0, 0x2
	adds r1, r5, 0
	mov r2, r8
	bl GetStringWidth
	lsrs r0, 1
	movs r4, 0x60
	subs r0, r4, r0
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r7, 0x2]
	ldr r6, _0814EA00 @ =gUnknown_846E3E5
	str r6, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x2
	bl AddTextPrinterParameterized3
	ldr r5, _0814EA04 @ =gUnknown_841D124
	movs r0, 0x2
	adds r1, r5, 0
	mov r2, r8
	bl GetStringWidth
	lsrs r0, 1
	subs r4, r0
	lsls r4, 24
	lsrs r2, r4, 24
	ldrb r0, [r7, 0x2]
	str r6, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x12
	bl AddTextPrinterParameterized3
	movs r0, 0x2A
	str r0, [sp, 0xC]
	ldr r1, _0814EA08 @ =gStringVar4
	mov r8, r1
_0814E90E:
	mov r1, r9
	adds r1, 0x2
	ldr r0, _0814EA0C @ =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	mov r0, r8
	ldr r1, _0814EA10 @ =gUnknown_841D13C
	bl StringExpandPlaceholders
	ldrb r0, [r7, 0x2]
	ldr r1, _0814EA14 @ =gUnknown_846E3DC
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x4
	ldr r3, [sp, 0xC]
	bl AddTextPrinterParameterized3
	movs r3, 0
	mov r0, r9
	lsls r4, r0, 1
	ldr r1, [sp, 0xC]
	adds r1, 0xE
	str r1, [sp, 0x10]
	movs r0, 0x1
	add r9, r0
	adds r0, r4, r7
	ldrh r0, [r0, 0x4]
	movs r2, 0xFF
	ands r2, r0
	movs r6, 0x1
	ldr r5, _0814EA18 @ =gUnknown_846E450
_0814E958:
	movs r0, 0x7
	subs r1, r0, r3
	adds r0, r2, 0
	asrs r0, r1
	ands r0, r6
	cmp r0, 0
	beq _0814E96E
	lsls r0, r3, 2
	adds r0, r5
	ldr r0, [r0]
	add r10, r0
_0814E96E:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _0814E958
	adds r0, r4, r7
	ldrh r1, [r0, 0x4]
	lsrs r1, 8
	ldr r0, _0814EA0C @ =gStringVar1
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, r10
	ldr r1, _0814EA1C @ =0x000f4240
	bl __udivsi3
	adds r1, r0, 0
	ldr r0, _0814EA20 @ =gStringVar2
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, r8
	ldr r1, _0814EA24 @ =gUnknown_841D090
	bl StringExpandPlaceholders
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	ldr r1, _0814EA28 @ =gUnknown_841D098
	bl StringCopy
	movs r0, 0x3
	mov r1, r8
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xC0
	subs r1, r0
	lsls r1, 24
	lsrs r2, r1, 24
	ldrb r0, [r7, 0x2]
	ldr r1, _0814EA14 @ =gUnknown_846E3DC
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	movs r1, 0x3
	ldr r3, [sp, 0xC]
	bl AddTextPrinterParameterized3
	ldr r1, [sp, 0x10]
	lsls r0, r1, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	movs r0, 0
	mov r10, r0
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0x3
	bls _0814E90E
	ldrb r0, [r7, 0x2]
	movs r1, 0x3
	bl CopyWindowToVram
	b _0814EA66
	.align 2, 0
_0814E9FC: .4byte gUnknown_841D118
_0814EA00: .4byte gUnknown_846E3E5
_0814EA04: .4byte gUnknown_841D124
_0814EA08: .4byte gStringVar4
_0814EA0C: .4byte gStringVar1
_0814EA10: .4byte gUnknown_841D13C
_0814EA14: .4byte gUnknown_846E3DC
_0814EA18: .4byte gUnknown_846E450
_0814EA1C: .4byte 0x000f4240
_0814EA20: .4byte gStringVar2
_0814EA24: .4byte gUnknown_841D090
_0814EA28: .4byte gUnknown_841D098
_0814EA2C:
	ldr r0, _0814EA3C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0814EA66
	b _0814EA6C
	.align 2, 0
_0814EA3C: .4byte gMain
_0814EA40:
	ldrb r0, [r7, 0x2]
	movs r1, 0x1
	bl ClearMenuWindow
	ldrb r0, [r7, 0x2]
	bl ClearWindowTilemap
	ldrb r0, [r7, 0x2]
	bl RemoveWindow
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	bl ScriptContext2_Disable
	mov r0, r9
	b _0814EA6A
_0814EA66:
	ldrh r0, [r7]
	adds r0, 0x1
_0814EA6A:
	strh r0, [r7]
_0814EA6C:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_814E830

	thumb_func_start sub_814EA7C
sub_814EA7C: @ 814EA7C
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _0814EAC4 @ =sub_814E830
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814EAC8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0814EACC @ =gSaveBlock2Ptr
	ldr r2, [r0]
	movs r3, 0xAF
	lsls r3, 4
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, 0xC]
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, 0xE]
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, 0x10]
	ldr r0, _0814EAD0 @ =0x00000af6
	adds r2, r0
	ldrh r0, [r2]
	strh r0, [r1, 0x12]
	pop {r0}
	bx r0
	.align 2, 0
_0814EAC4: .4byte sub_814E830
_0814EAC8: .4byte gTasks
_0814EACC: .4byte gSaveBlock2Ptr
_0814EAD0: .4byte 0x00000af6
	thumb_func_end sub_814EA7C

	thumb_func_start sub_814EAD4
sub_814EAD4: @ 814EAD4
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_814DEC0
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl sub_815CD70
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r0, 0x1
	bl sub_815CD70
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	movs r0, 0x2
	bl sub_815CD70
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814EAD4

	thumb_func_start sub_814EB04
sub_814EB04: @ 814EB04
	push {lr}
	ldr r2, [r0, 0x78]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2]
	ldr r1, [r0, 0x7C]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x1
	bl sub_815D1A8
	movs r0, 0x1
	movs r1, 0x1
	bl sub_815D1A8
	movs r0, 0
	movs r1, 0x1
	bl sub_815D1A8
	pop {r0}
	bx r0
	thumb_func_end sub_814EB04

	thumb_func_start sub_814EB38
sub_814EB38: @ 814EB38
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r6, 0
	ldrb r0, [r5, 0x9]
	cmp r6, r0
	bcs _0814EB98
	ldr r7, _0814EBA0 @ =gUnknown_846F280
_0814EB46:
	lsls r0, r6, 2
	movs r1, 0xA2
	lsls r1, 1
	adds r2, r5, r1
	adds r2, r0
	ldrb r1, [r5, 0x9]
	subs r1, 0x2
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r6, r0
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814EBA4 @ =gUnknown_846F294
	adds r0, r1
	str r0, [r2]
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _0814EBA8 @ =gUnknown_846E3F8
	adds r0, r1
	bl AddWindow
	ldr r1, _0814EBAC @ =0x000001bb
	adds r4, r5, r1
	adds r4, r6
	strb r0, [r4]
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r5, 0x9]
	cmp r6, r0
	bcc _0814EB46
_0814EB98:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814EBA0: .4byte gUnknown_846F280
_0814EBA4: .4byte gUnknown_846F294
_0814EBA8: .4byte gUnknown_846E3F8
_0814EBAC: .4byte 0x000001bb
	thumb_func_end sub_814EB38

	thumb_func_start sub_814EBB0
sub_814EBB0: @ 814EBB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r6, r0, 0
	movs r7, 0
	ldrb r0, [r6, 0x9]
	cmp r7, r0
	bcs _0814EC66
	movs r1, 0
	mov r8, r1
_0814EBC6:
	ldr r1, _0814EC10 @ =0x000001bb
	adds r0, r6, r1
	adds r5, r0, r7
	ldrb r0, [r5]
	bl PutWindowTilemap
	ldrb r0, [r6, 0x8]
	cmp r7, r0
	bne _0814EC18
	lsls r4, r7, 5
	adds r4, 0x98
	adds r4, r6, r4
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	lsrs r0, 1
	movs r2, 0x24
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r5]
	mov r1, r8
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, _0814EC14 @ =gUnknown_846E3DF
	str r1, [sp, 0x8]
	mov r1, r8
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized4
	b _0814EC4C
	.align 2, 0
_0814EC10: .4byte 0x000001bb
_0814EC14: .4byte gUnknown_846E3DF
_0814EC18:
	lsls r4, r7, 5
	adds r4, 0x98
	adds r4, r6, r4
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	lsrs r0, 1
	movs r2, 0x24
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r5]
	mov r1, r8
	str r1, [sp]
	str r1, [sp, 0x4]
	ldr r1, _0814EC78 @ =gUnknown_846E3E2
	str r1, [sp, 0x8]
	mov r1, r8
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized4
_0814EC4C:
	ldr r1, _0814EC7C @ =0x000001bb
	adds r0, r6, r1
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r6, 0x9]
	cmp r7, r0
	bcc _0814EBC6
_0814EC66:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814EC78: .4byte gUnknown_846E3E2
_0814EC7C: .4byte 0x000001bb
	thumb_func_end sub_814EBB0

	thumb_func_start sub_814EC80
sub_814EC80: @ 814EC80
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	movs r5, 0
	ldr r0, _0814EC94 @ =gUnknown_8EB0ADC
	ldr r4, _0814EC98 @ =gDecompressionBuffer
	adds r1, r4, 0
	bl LZ77UnCompWram
	b _0814ECCA
	.align 2, 0
_0814EC94: .4byte gUnknown_8EB0ADC
_0814EC98: .4byte gDecompressionBuffer
_0814EC9C:
	lsls r1, r5, 2
	movs r2, 0xA2
	lsls r2, 1
	adds r0, r6, r2
	adds r0, r1
	ldr r3, [r0]
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	ldrb r2, [r3, 0x1]
	ldrb r3, [r3, 0x2]
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x3
	bl CopyToBgTilemapBufferRect
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0814ECCA:
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcc _0814EC9C
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_814EC80

	thumb_func_start sub_814ECE0
sub_814ECE0: @ 814ECE0
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r5, 0
	ldr r0, _0814EEE0 @ =0x0000ff98
	strh r0, [r6, 0x2A]
	strh r5, [r6, 0x2C]
	ldr r1, _0814EEE4 @ =gSpriteCoordOffsetX
	strh r5, [r1]
	ldr r1, _0814EEE8 @ =gSpriteCoordOffsetY
	strh r0, [r1]
	ldr r4, _0814EEEC @ =gUnknown_846F2F8
_0814ECF6:
	lsls r0, r5, 3
	adds r0, r4
	bl LoadCompressedSpriteSheet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _0814ECF6
	ldr r0, _0814EEF0 @ =gUnknown_846F320
	bl LoadSpritePalettes
	ldr r0, _0814EEF4 @ =gUnknown_846F410
	movs r1, 0x78
	movs r2, 0x58
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xAC
	lsls r0, 1
	adds r3, r6, r0
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r1, _0814EEF8 @ =gSprites
	adds r0, r1
	str r0, [r3]
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1]
	movs r5, 0
	ldrb r1, [r6, 0x9]
	cmp r5, r1
	bcs _0814EDD2
	movs r7, 0x4
_0814ED5A:
	lsls r4, r5, 2
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r6, r3
	adds r0, r4
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	adds r1, 0x78
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r0, 0x6]
	adds r2, 0x20
	lsls r2, 16
	asrs r2, 16
	ldr r0, _0814EEFC @ =gUnknown_846F428
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xAE
	lsls r0, 1
	adds r3, r6, r0
	adds r3, r4
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r0, _0814EEF8 @ =gSprites
	adds r1, r0
	str r1, [r3]
	ldrb r0, [r1, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r2, r4, 0
	ands r0, r2
	orrs r0, r7
	strb r0, [r1, 0x5]
	ldr r1, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	ldr r2, [r3]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6, 0x9]
	cmp r5, r0
	bcc _0814ED5A
_0814EDD2:
	movs r5, 0
	ldr r4, _0814EF00 @ =gUnknown_846F2D6
	adds r7, r4, 0x1
_0814EDD8:
	lsls r2, r5, 1
	adds r0, r2, r4
	movs r1, 0
	ldrsb r1, [r0, r1]
	adds r1, 0x78
	adds r2, r7
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	adds r2, 0x88
	ldr r0, _0814EF04 @ =gUnknown_846F440
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r5, 2
	movs r1, 0xC2
	lsls r1, 1
	adds r3, r6, r1
	adds r3, r0
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r1, _0814EEF8 @ =gSprites
	adds r0, r1
	str r0, [r3]
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r2, [r3]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	strh r5, [r0, 0x2E]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _0814EDD8
	movs r5, 0
_0814EE3E:
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 19
	movs r3, 0xB0
	lsls r3, 16
	adds r1, r3
	asrs r1, 16
	ldr r0, _0814EF08 @ =gUnknown_846F458
	movs r2, 0x8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r5, 2
	movs r4, 0xD8
	lsls r4, 1
	adds r3, r6, r4
	adds r3, r0
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r1, _0814EEF8 @ =gSprites
	adds r0, r1
	str r0, [r3]
	ldrb r1, [r0, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r2, r4, 0
	ands r1, r2
	strb r1, [r0, 0x5]
	ldr r2, [r3]
	adds r2, 0x3E
	ldrb r0, [r2]
	adds r4, 0x8
	adds r1, r4, 0
	ands r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r3, 0x41
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _0814EE3E
	ldr r4, _0814EF0C @ =gUnknown_846F488
	movs r0, 0
	movs r1, 0
	adds r2, r4, 0
	bl sub_815CA40
	adds r2, r4, 0
	adds r2, 0x10
	movs r0, 0x1
	movs r1, 0
	bl sub_815CA40
	adds r4, 0x20
	movs r0, 0x2
	movs r1, 0
	adds r2, r4, 0
	bl sub_815CA40
	ldrh r0, [r6, 0x12]
	cmp r0, 0x1
	bne _0814EED8
	movs r4, 0x9C
	lsls r4, 1
	adds r0, r6, r4
	bl sub_814EB04
_0814EED8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814EEE0: .4byte 0x0000ff98
_0814EEE4: .4byte gSpriteCoordOffsetX
_0814EEE8: .4byte gSpriteCoordOffsetY
_0814EEEC: .4byte gUnknown_846F2F8
_0814EEF0: .4byte gUnknown_846F320
_0814EEF4: .4byte gUnknown_846F410
_0814EEF8: .4byte gSprites
_0814EEFC: .4byte gUnknown_846F428
_0814EF00: .4byte gUnknown_846F2D6
_0814EF04: .4byte gUnknown_846F440
_0814EF08: .4byte gUnknown_846F458
_0814EF0C: .4byte gUnknown_846F488
	thumb_func_end sub_814ECE0

	thumb_func_start sub_814EF10
sub_814EF10: @ 814EF10
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	movs r0, 0x4
	bl FreeSpriteTilesByTag
	movs r0, 0x3
	bl FreeSpriteTilesByTag
	movs r0, 0x2
	bl FreeSpriteTilesByTag
	movs r0, 0x1
	bl FreeSpriteTilesByTag
	movs r0, 0x4
	bl FreeSpritePaletteByTag
	movs r0, 0x2
	bl FreeSpritePaletteByTag
	movs r0, 0x1
	bl FreeSpritePaletteByTag
	movs r0, 0xD8
	lsls r0, 1
	adds r6, r5, r0
_0814EF46:
	lsls r0, r4, 2
	adds r0, r6, r0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _0814EF46
	movs r0, 0x2
	bl sub_815D108
	movs r0, 0x1
	bl sub_815D108
	movs r0, 0
	bl sub_815D108
	movs r4, 0
	movs r1, 0xC2
	lsls r1, 1
	adds r6, r5, r1
_0814EF74:
	lsls r0, r4, 2
	adds r0, r6, r0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _0814EF74
	movs r4, 0
	ldrb r2, [r5, 0x9]
	cmp r4, r2
	bcs _0814EFAC
_0814EF90:
	lsls r1, r4, 2
	movs r2, 0xAE
	lsls r2, 1
	adds r0, r5, r2
	adds r0, r1
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x9]
	cmp r4, r0
	bcc _0814EF90
_0814EFAC:
	movs r1, 0xAC
	lsls r1, 1
	adds r0, r5, r1
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814EFC8
	adds r0, r2, 0
	bl DestroySprite
_0814EFC8:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_814EF10

	thumb_func_start sub_814EFD0
sub_814EFD0: @ 814EFD0
	push {lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0814EFF6
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
_0814EFF6:
	pop {r0}
	bx r0
	thumb_func_end sub_814EFD0

	thumb_func_start sub_814EFFC
sub_814EFFC: @ 814EFFC
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r1, 0
	ldr r5, _0814F040 @ =SpriteCallbackDummy
	adds r2, r3, 0
	adds r2, 0x2E
	movs r4, 0
_0814F00A:
	lsls r0, r1, 1
	adds r0, r2, r0
	strh r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _0814F00A
	movs r0, 0
	strh r0, [r3, 0x24]
	strh r0, [r3, 0x26]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	str r5, [r3, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814F040: .4byte SpriteCallbackDummy
	thumb_func_end sub_814EFFC

	thumb_func_start sub_814F044
sub_814F044: @ 814F044
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x2E
	ldrh r0, [r4, 0x4]
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r5, 0x26]
	adds r0, r2
	strh r0, [r5, 0x26]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r6, 0x80
	lsls r6, 8
	ands r0, r6
	cmp r0, 0
	beq _0814F0AA
	ldrh r0, [r4, 0x6]
	ldrh r2, [r5, 0x2E]
	adds r0, r2
	strh r0, [r5, 0x2E]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 23
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ands r0, r6
	cmp r0, 0
	beq _0814F0AA
	ldrh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 23
	cmp r0, 0x7E
	ble _0814F0AA
	movs r0, 0
	strh r0, [r5, 0x24]
	ldrh r1, [r4, 0xE]
	ldr r0, _0814F0D0 @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xE]
_0814F0AA:
	ldrh r0, [r4]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r5, 0x20]
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	ldrh r2, [r4, 0xE]
	ldr r0, _0814F0D0 @ =0x00007fff
	ands r0, r2
	cmp r1, r0
	ble _0814F0CA
	ldr r0, _0814F0D4 @ =sub_814EFFC
	str r0, [r5, 0x1C]
_0814F0CA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814F0D0: .4byte 0x00007fff
_0814F0D4: .4byte sub_814EFFC
	thumb_func_end sub_814F044

	thumb_func_start sub_814F0D8
sub_814F0D8: @ 814F0D8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r7, r6, 0
	adds r7, 0x2E
	movs r0, 0
	mov r8, r0
	movs r2, 0xA0
	lsls r2, 2
	strh r2, [r7, 0x2]
	movs r0, 0x20
	strh r0, [r7, 0x4]
	movs r1, 0xA8
	strh r1, [r7, 0xE]
	movs r0, 0x24
	ldrsh r4, [r6, r0]
	lsls r4, 23
	lsrs r4, 16
	ldrh r0, [r6, 0x22]
	subs r1, r0
	lsls r1, 23
	asrs r1, 16
	adds r2, 0x20
	asrs r2, 1
	movs r0, 0x7
	bl sub_80D8B40
	adds r5, r0, 0
	ldrh r0, [r6, 0x20]
	lsls r0, 7
	strh r0, [r6, 0x2E]
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	movs r0, 0x7
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80D8B40
	strh r0, [r7, 0x6]
	movs r0, 0x7
	adds r1, r5, 0
	movs r2, 0x55
	bl sub_80D8ABC
	adds r2, r0, 0
	mov r1, r8
	strh r1, [r7, 0x8]
	movs r1, 0xFE
	lsls r1, 6
	lsls r2, 16
	asrs r2, 16
	movs r0, 0x7
	bl sub_80D8B40
	strh r0, [r7, 0xA]
	movs r2, 0x24
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bge _0814F156
	adds r0, 0x3
_0814F156:
	asrs r0, 2
	strh r0, [r7, 0xC]
	ldrh r0, [r7, 0xE]
	ldr r2, _0814F194 @ =0xffff8000
	adds r1, r2, 0
	orrs r0, r1
	strh r0, [r7, 0xE]
	mov r0, r8
	strh r0, [r6, 0x26]
	strh r0, [r6, 0x24]
	ldr r0, _0814F198 @ =sub_814F044
	str r0, [r6, 0x1C]
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r2, 0x12
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814F194: .4byte 0xffff8000
_0814F198: .4byte sub_814F044
	thumb_func_end sub_814F0D8

	.align 2, 0 @ Don't pad with nop.
