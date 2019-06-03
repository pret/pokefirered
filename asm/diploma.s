	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F4BFC
sub_80F4BFC: @ 80F4BFC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80F4BFC

	thumb_func_start sub_80F4C10
sub_80F4C10: @ 80F4C10
	push {r4,lr}
	ldr r4, _080F4C40 @ =gUnknown_203AB48
	ldr r0, _080F4C44 @ =0x00001004
	bl AllocZeroed
	str r0, [r4]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r4]
	strb r1, [r0, 0x1]
	ldr r0, [r4]
	strb r1, [r0, 0x2]
	bl sub_80F4E24
	ldr r0, _080F4C48 @ =sub_80F4C68
	movs r1, 0
	bl CreateTask
	ldr r0, _080F4C4C @ =sub_80F4C50
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F4C40: .4byte gUnknown_203AB48
_080F4C44: .4byte 0x00001004
_080F4C48: .4byte sub_80F4C68
_080F4C4C: .4byte sub_80F4C50
	thumb_func_end sub_80F4C10

	thumb_func_start sub_80F4C50
sub_80F4C50: @ 80F4C50
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80F4C50

	thumb_func_start sub_80F4C68
sub_80F4C68: @ 80F4C68
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F4C84 @ =gUnknown_203AB48
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	cmp r0, 0x8
	bhi _080F4D30
	lsls r0, 2
	ldr r1, _080F4C88 @ =_080F4C8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F4C84: .4byte gUnknown_203AB48
_080F4C88: .4byte _080F4C8C
	.align 2, 0
_080F4C8C:
	.4byte _080F4CB0
	.4byte _080F4CB8
	.4byte _080F4CBE
	.4byte _080F4CCA
	.4byte _080F4CDC
	.4byte _080F4CFC
	.4byte _080F4D02
	.4byte _080F4D10
	.4byte _080F4D22
_080F4CB0:
	movs r0, 0
	bl SetVBlankCallback
	b _080F4D50
_080F4CB8:
	bl sub_80F4E40
	b _080F4D50
_080F4CBE:
	bl sub_80F4F9C
	lsls r0, 24
	cmp r0, 0
	beq _080F4D5A
	b _080F4D50
_080F4CCA:
	ldr r1, _080F4CD8 @ =gUnknown_84154E8
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	b _080F4D50
	.align 2, 0
_080F4CD8: .4byte gUnknown_84154E8
_080F4CDC:
	bl sub_8088F84
	lsls r0, 16
	cmp r0, 0
	beq _080F4CF2
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0x14
	bl SetGpuReg
	b _080F4D50
_080F4CF2:
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	b _080F4D50
_080F4CFC:
	bl sub_80F5018
	b _080F4D50
_080F4D02:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	b _080F4D50
_080F4D10:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080F4D50
_080F4D22:
	ldr r0, _080F4D2C @ =sub_80F4BFC
	bl SetVBlankCallback
	b _080F4D50
	.align 2, 0
_080F4D2C: .4byte sub_80F4BFC
_080F4D30:
	ldr r0, _080F4D64 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F4D50
	movs r0, 0x5
	bl PlayFanfareByFanfareNum
	ldr r0, _080F4D68 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080F4D6C @ =sub_80F4D74
	str r0, [r1]
_080F4D50:
	ldr r0, _080F4D70 @ =gUnknown_203AB48
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
_080F4D5A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F4D64: .4byte gPaletteFade
_080F4D68: .4byte gTasks
_080F4D6C: .4byte sub_80F4D74
_080F4D70: .4byte gUnknown_203AB48
	thumb_func_end sub_80F4C68

	thumb_func_start sub_80F4D74
sub_80F4D74: @ 80F4D74
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r4, _080F4D90 @ =gUnknown_203AB48
	ldr r0, [r4]
	ldrb r1, [r0]
	cmp r1, 0x1
	beq _080F4DA8
	cmp r1, 0x1
	bgt _080F4D94
	cmp r1, 0
	beq _080F4D9A
	b _080F4DD6
	.align 2, 0
_080F4D90: .4byte gUnknown_203AB48
_080F4D94:
	cmp r1, 0x2
	beq _080F4DD0
	b _080F4DD6
_080F4D9A:
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _080F4DD6
	b _080F4DC2
_080F4DA8:
	ldr r0, _080F4DCC @ =gMain
	ldrh r0, [r0, 0x2E]
	ands r1, r0
	cmp r1, 0
	beq _080F4DD6
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080F4DC2:
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F4DD6
	.align 2, 0
_080F4DCC: .4byte gMain
_080F4DD0:
	adds r0, r2, 0
	bl sub_80F4DE0
_080F4DD6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F4D74

	thumb_func_start sub_80F4DE0
sub_80F4DE0: @ 80F4DE0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080F4E18 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080F4E10
	adds r0, r2, 0
	bl DestroyTask
	bl FreeAllWindowBuffers
	ldr r4, _080F4E1C @ =gUnknown_203AB48
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r0, _080F4E20 @ =sub_80568FC
	bl SetMainCallback2
_080F4E10:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F4E18: .4byte gPaletteFade
_080F4E1C: .4byte gUnknown_203AB48
_080F4E20: .4byte sub_80568FC
	thumb_func_end sub_80F4DE0

	thumb_func_start sub_80F4E24
sub_80F4E24: @ 80F4E24
	push {lr}
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl ScanlineEffect_Stop
	pop {r0}
	bx r0
	thumb_func_end sub_80F4E24

	thumb_func_start sub_80F4E40
sub_80F4E40: @ 80F4E40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0xC
	mov r8, r0
	add r2, sp, 0x8
	movs r6, 0
	ldr r1, _080F4F88 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080F4F8C @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080F4E66:
	strh r6, [r2]
	add r0, sp, 0x8
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _080F4E66
	strh r6, [r2]
	add r2, sp, 0x8
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
	str r4, [sp, 0xC]
	ldr r2, _080F4F88 @ =0x040000d4
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
	add r0, sp, 0x8
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
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080F4F90 @ =gUnknown_8415A08
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
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
	ldr r0, _080F4F94 @ =gUnknown_8415A10
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _080F4F98 @ =gUnknown_203AB48
	ldr r1, [r0]
	adds r1, 0x4
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4F88: .4byte 0x040000d4
_080F4F8C: .4byte 0x81000800
_080F4F90: .4byte gUnknown_8415A08
_080F4F94: .4byte gUnknown_8415A10
_080F4F98: .4byte gUnknown_203AB48
	thumb_func_end sub_80F4E40

	thumb_func_start sub_80F4F9C
sub_80F4F9C: @ 80F4F9C
	push {lr}
	sub sp, 0x4
	ldr r0, _080F4FB4 @ =gUnknown_203AB48
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	beq _080F4FC8
	cmp r0, 0x1
	bgt _080F4FB8
	cmp r0, 0
	beq _080F4FC2
	b _080F4FF8
	.align 2, 0
_080F4FB4: .4byte gUnknown_203AB48
_080F4FB8:
	cmp r0, 0x2
	beq _080F4FE0
	cmp r0, 0x3
	beq _080F4FEE
	b _080F4FF8
_080F4FC2:
	bl reset_temp_tile_data_buffers
	b _080F5000
_080F4FC8:
	ldr r1, _080F4FDC @ =gUnknown_84147C0
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	b _080F5000
	.align 2, 0
_080F4FDC: .4byte gUnknown_84147C0
_080F4FE0:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F5000
	b _080F500A
_080F4FEE:
	ldr r0, _080F4FFC @ =gUnknown_8415954
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
_080F4FF8:
	movs r0, 0x1
	b _080F500C
	.align 2, 0
_080F4FFC: .4byte gUnknown_8415954
_080F5000:
	ldr r0, _080F5014 @ =gUnknown_203AB48
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
_080F500A:
	movs r0, 0
_080F500C:
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_080F5014: .4byte gUnknown_203AB48
	thumb_func_end sub_80F4F9C

	thumb_func_start sub_80F5018
sub_80F5018: @ 80F5018
	push {r4-r6,lr}
	sub sp, 0xAC
	bl UnkTextUtil_Reset
	ldr r0, _080F5040 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	bl sub_8088F84
	lsls r0, 16
	cmp r0, 0
	beq _080F5048
	ldr r1, _080F5044 @ =gUnknown_841B68F
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	b _080F5050
	.align 2, 0
_080F5040: .4byte gSaveBlock2Ptr
_080F5044: .4byte gUnknown_841B68F
_080F5048:
	ldr r1, _080F50E0 @ =gUnknown_841B698
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
_080F5050:
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r1, _080F50E4 @ =gUnknown_841B60E
	add r0, sp, 0xC
	bl UnkTextUtil_StringExpandPlaceholders
	movs r5, 0x1
	negs r5, r5
	movs r0, 0x2
	add r1, sp, 0xC
	adds r2, r5, 0
	bl GetStringWidth
	lsrs r2, r0, 1
	movs r4, 0x78
	subs r2, r4, r2
	lsls r2, 24
	lsrs r2, 24
	ldr r6, _080F50E8 @ =gUnknown_8415A04
	str r6, [sp]
	str r5, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x4
	bl AddTextPrinterParameterized3
	ldr r1, _080F50EC @ =gUnknown_841B619
	add r0, sp, 0xC
	bl UnkTextUtil_StringExpandPlaceholders
	movs r0, 0x2
	add r1, sp, 0xC
	adds r2, r5, 0
	bl GetStringWidth
	lsrs r0, 1
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	str r6, [sp]
	str r5, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0x1E
	bl AddTextPrinterParameterized3
	str r6, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _080F50F0 @ =gUnknown_841B684
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x78
	movs r3, 0x69
	bl AddTextPrinterParameterized3
	movs r0, 0
	bl PutWindowTilemap
	add sp, 0xAC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F50E0: .4byte gUnknown_841B698
_080F50E4: .4byte gUnknown_841B60E
_080F50E8: .4byte gUnknown_8415A04
_080F50EC: .4byte gUnknown_841B619
_080F50F0: .4byte gUnknown_841B684
	thumb_func_end sub_80F5018

	.align 2, 0 @ Don't pad with nop.
