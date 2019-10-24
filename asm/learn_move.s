	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80E4620
sub_80E4620: @ 80E4620
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80E4620

	thumb_func_start DisplayMoveTutorMenu
DisplayMoveTutorMenu: @ 80E4634
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080E465C @ =sub_80E4660
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080E465C: .4byte sub_80E4660
	thumb_func_end DisplayMoveTutorMenu

	thumb_func_start sub_80E4660
sub_80E4660: @ 80E4660
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E468C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E4684
	ldr r0, _080E4690 @ =sub_80E478C
	bl SetMainCallback2
	ldr r1, _080E4694 @ =gFieldCallback
	ldr r0, _080E4698 @ =FieldCallback_ReturnToEventScript2
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_080E4684:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E468C: .4byte gPaletteFade
_080E4690: .4byte sub_80E478C
_080E4694: .4byte gFieldCallback
_080E4698: .4byte FieldCallback_ReturnToEventScript2
	thumb_func_end sub_80E4660

	thumb_func_start sub_80E469C
sub_80E469C: @ 80E469C
	push {r4,r5,lr}
	sub sp, 0xC
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080E4774 @ =gUnknown_83FFA3C
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	bl ResetTempTileDataBuffers
	ldr r0, _080E4778 @ =gUnknown_83FFA44
	bl InitWindows
	lsls r0, 16
	cmp r0, 0
	beq _080E476C
	bl DeactivateAllTextPrinters
	movs r5, 0
_080E46C6:
	lsls r4, r5, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl ClearWindowTilemap
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r5, 0x1
	cmp r5, 0x8
	bls _080E46C6
	movs r0, 0x7
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
	ldr r0, _080E477C @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xE0
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0xD0
	movs r1, 0x1
	bl sub_8107D38
	ldr r0, _080E4780 @ =gUnknown_8E97DDC
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080E4784 @ =gUnknown_8E97DFC
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080E4788 @ =gUnknown_8E97EC4
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x16
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
_080E476C:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E4774: .4byte gUnknown_83FFA3C
_080E4778: .4byte gUnknown_83FFA44
_080E477C: .4byte gUnknown_203AAB4
_080E4780: .4byte gUnknown_8E97DDC
_080E4784: .4byte gUnknown_8E97DFC
_080E4788: .4byte gUnknown_8E97EC4
	thumb_func_end sub_80E469C

	thumb_func_start sub_80E478C
sub_80E478C: @ 80E478C
	push {r4,lr}
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r4, _080E47EC @ =gUnknown_203AAB4
	ldr r0, _080E47F0 @ =0x00000a6c
	bl AllocZeroed
	str r0, [r4]
	bl sub_80E4F54
	ldr r0, [r4]
	ldr r1, _080E47F4 @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	movs r2, 0x98
	lsls r2, 2
	adds r0, r2
	strb r1, [r0]
	bl sub_80E50CC
	ldr r0, _080E47F8 @ =sub_80E4620
	bl SetVBlankCallback
	bl sub_80E469C
	bl sub_80E5004
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _080E47FC @ =sub_80E4870
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E47EC: .4byte gUnknown_203AAB4
_080E47F0: .4byte 0x00000a6c
_080E47F4: .4byte gSpecialVar_0x8004
_080E47F8: .4byte sub_80E4620
_080E47FC: .4byte sub_80E4870
	thumb_func_end sub_80E478C

	thumb_func_start sub_80E4800
sub_80E4800: @ 80E4800
	push {lr}
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl sub_80E50CC
	ldr r0, _080E485C @ =gUnknown_203AAB4
	ldr r0, [r0]
	ldr r1, _080E4860 @ =gSpecialVar_0x8005
	ldrh r1, [r1]
	ldr r2, _080E4864 @ =0x00000261
	adds r0, r2
	strb r1, [r0]
	ldr r0, _080E4868 @ =sub_80E4620
	bl SetVBlankCallback
	bl sub_80E469C
	bl sub_80E5004
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _080E486C @ =sub_80E4870
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080E485C: .4byte gUnknown_203AAB4
_080E4860: .4byte gSpecialVar_0x8005
_080E4864: .4byte 0x00000261
_080E4868: .4byte sub_80E4620
_080E486C: .4byte sub_80E4870
	thumb_func_end sub_80E4800

	thumb_func_start sub_80E4870
sub_80E4870: @ 80E4870
	push {r4,lr}
	movs r0, 0x7
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080E4882
	bl sub_80E48F4
_080E4882:
	ldr r4, _080E48B8 @ =gUnknown_203AAB4
	ldr r0, [r4]
	ldr r1, _080E48BC @ =0x0000025f
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E489E
	bl sub_80E54C0
	ldr r0, [r4]
	ldr r1, _080E48BC @ =0x0000025f
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_080E489E:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E48B8: .4byte gUnknown_203AAB4
_080E48BC: .4byte 0x0000025f
	thumb_func_end sub_80E4870

	thumb_func_start sub_80E48C0
sub_80E48C0: @ 80E48C0
	push {r4,lr}
	sub sp, 0x8
	adds r1, r0, 0
	ldr r4, _080E48F0 @ =gStringVar4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x7
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl sub_80E559C
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E48F0: .4byte gStringVar4
	thumb_func_end sub_80E48C0

	thumb_func_start sub_80E48F4
sub_80E48F4: @ 80E48F4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r1, _080E4918 @ =gUnknown_203AAB4
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0x21
	bls _080E490C
	b _080E4EDA
_080E490C:
	lsls r0, 2
	ldr r1, _080E491C @ =_080E4920
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E4918: .4byte gUnknown_203AAB4
_080E491C: .4byte _080E4920
	.align 2, 0
_080E4920:
	.4byte _080E49A8
	.4byte _080E49F4
	.4byte _080E4A0C
	.4byte _080E4A14
	.4byte _080E4A38
	.4byte _080E4EDA
	.4byte _080E4EDA
	.4byte _080E4EDA
	.4byte _080E4A3E
	.4byte _080E4A68
	.4byte _080E4EDA
	.4byte _080E4EDA
	.4byte _080E4AF4
	.4byte _080E4B20
	.4byte _080E4CFA
	.4byte _080E4D18
	.4byte _080E4B58
	.4byte _080E4B70
	.4byte _080E4B98
	.4byte _080E4C5A
	.4byte _080E4C70
	.4byte _080E4CE4
	.4byte _080E4CE8
	.4byte _080E4EDA
	.4byte _080E4BDC
	.4byte _080E4BF4
	.4byte _080E4C1C
	.4byte _080E4C54
	.4byte _080E4D48
	.4byte _080E4D8C
	.4byte _080E4E70
	.4byte _080E4E90
	.4byte _080E4EA8
	.4byte _080E4EC0
_080E49A8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	bl sub_80E5444
	ldr r4, _080E49EC @ =gUnknown_203AAB4
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_80E4EF0
	movs r0, 0
	bl sub_80E4F0C
	bl sub_80E5300
	ldr r0, [r4]
	ldr r1, _080E49F0 @ =0x0000025f
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _080E4EDA
	.align 2, 0
_080E49EC: .4byte gUnknown_203AAB4
_080E49F0: .4byte 0x0000025f
_080E49F4:
	ldr r0, _080E4A08 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E4A02
	b _080E4EDA
_080E4A02:
	ldr r1, [r7]
	movs r0, 0x4
	b _080E4ED8
	.align 2, 0
_080E4A08: .4byte gPaletteFade
_080E4A0C:
	ldr r1, [r7]
	ldrb r0, [r1]
	adds r0, 0x1
	b _080E4ED8
_080E4A14:
	movs r0, 0
	bl sub_80E4F0C
	ldr r2, _080E4A30 @ =gUnknown_203AAB4
	ldr r0, [r2]
	ldr r3, _080E4A34 @ =0x0000025f
	adds r0, r3
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	b _080E4ED8
	.align 2, 0
_080E4A30: .4byte gUnknown_203AAB4
_080E4A34: .4byte 0x0000025f
_080E4A38:
	bl sub_80E5204
	b _080E4EDA
_080E4A3E:
	ldr r0, _080E4A60 @ =gUnknown_83FFA8C
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	ldr r0, _080E4A64 @ =gUnknown_203AAB4
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _080E4ED8
	.align 2, 0
_080E4A60: .4byte gUnknown_83FFA8C
_080E4A64: .4byte gUnknown_203AAB4
_080E4A68:
	bl sub_80E5574
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E4A88
	cmp r1, 0
	bgt _080E4A82
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080E4AE6
	b _080E4EDA
_080E4A82:
	cmp r1, 0x1
	beq _080E4AE6
	b _080E4EDA
_080E4A88:
	ldr r4, _080E4AC8 @ =gUnknown_203AAB4
	ldr r2, [r4]
	movs r6, 0x98
	lsls r6, 2
	adds r0, r2, r6
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E4ACC @ =gPlayerParty
	adds r0, r1
	ldr r3, _080E4AD0 @ =0x00000a67
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, 1
	adds r2, 0xE8
	adds r2, r1
	ldrh r1, [r2]
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _080E4AD4 @ =0xffff0000
	cmp r0, r1
	beq _080E4AE0
	ldr r0, _080E4AD8 @ =gUnknown_841E405
	bl sub_80E48C0
	ldr r1, _080E4ADC @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, [r4]
	movs r0, 0x1F
	b _080E4ED8
	.align 2, 0
_080E4AC8: .4byte gUnknown_203AAB4
_080E4ACC: .4byte gPlayerParty
_080E4AD0: .4byte 0x00000a67
_080E4AD4: .4byte 0xffff0000
_080E4AD8: .4byte gUnknown_841E405
_080E4ADC: .4byte gSpecialVar_0x8004
_080E4AE0:
	ldr r1, [r4]
	movs r0, 0x10
	b _080E4ED8
_080E4AE6:
	ldr r0, _080E4AF0 @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x3
	b _080E4ED8
	.align 2, 0
_080E4AF0: .4byte gUnknown_203AAB4
_080E4AF4:
	ldr r0, _080E4B18 @ =gUnknown_83FFA8C
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	ldr r0, _080E4B1C @ =gUnknown_203AAB4
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _080E4ED8
	.align 2, 0
_080E4B18: .4byte gUnknown_83FFA8C
_080E4B1C: .4byte gUnknown_203AAB4
_080E4B20:
	bl sub_80E5574
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E4B40
	cmp r1, 0
	bgt _080E4B3A
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080E4B4C
	b _080E4EDA
_080E4B3A:
	cmp r1, 0x1
	beq _080E4B4C
	b _080E4EDA
_080E4B40:
	ldr r0, _080E4B48 @ =gSpecialVar_0x8004
	strh r1, [r0]
	b _080E4ED2
	.align 2, 0
_080E4B48: .4byte gSpecialVar_0x8004
_080E4B4C:
	ldr r0, _080E4B54 @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x3
	b _080E4ED8
	.align 2, 0
_080E4B54: .4byte gUnknown_203AAB4
_080E4B58:
	ldr r0, _080E4B68 @ =gUnknown_841E414
	bl sub_80E48C0
	ldr r0, _080E4B6C @ =gUnknown_203AAB4
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _080E4ED8
	.align 2, 0
_080E4B68: .4byte gUnknown_841E414
_080E4B6C: .4byte gUnknown_203AAB4
_080E4B70:
	ldr r0, _080E4B90 @ =gUnknown_83FFA8C
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	ldr r0, _080E4B94 @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x12
	b _080E4ED8
	.align 2, 0
_080E4B90: .4byte gUnknown_83FFA8C
_080E4B94: .4byte gUnknown_203AAB4
_080E4B98:
	bl sub_80E5574
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E4BB8
	cmp r1, 0
	bgt _080E4BB2
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080E4BD0
	b _080E4EDA
_080E4BB2:
	cmp r1, 0x1
	beq _080E4BD0
	b _080E4EDA
_080E4BB8:
	ldr r0, _080E4BC8 @ =gUnknown_841E50C
	bl sub_80E48C0
	ldr r0, _080E4BCC @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x13
	b _080E4ED8
	.align 2, 0
_080E4BC8: .4byte gUnknown_841E50C
_080E4BCC: .4byte gUnknown_203AAB4
_080E4BD0:
	ldr r0, _080E4BD8 @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x18
	b _080E4ED8
	.align 2, 0
_080E4BD8: .4byte gUnknown_203AAB4
_080E4BDC:
	ldr r0, _080E4BEC @ =gUnknown_841E481
	bl sub_80E48C0
	ldr r0, _080E4BF0 @ =gUnknown_203AAB4
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _080E4ED8
	.align 2, 0
_080E4BEC: .4byte gUnknown_841E481
_080E4BF0: .4byte gUnknown_203AAB4
_080E4BF4:
	ldr r0, _080E4C14 @ =gUnknown_83FFA8C
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	ldr r0, _080E4C18 @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x1A
	b _080E4ED8
	.align 2, 0
_080E4C14: .4byte gUnknown_83FFA8C
_080E4C18: .4byte gUnknown_203AAB4
_080E4C1C:
	bl sub_80E5574
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E4C3C
	cmp r1, 0
	bgt _080E4C36
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080E4C48
	b _080E4EDA
_080E4C36:
	cmp r1, 0x1
	beq _080E4C48
	b _080E4EDA
_080E4C3C:
	ldr r0, _080E4C44 @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x1B
	b _080E4ED8
	.align 2, 0
_080E4C44: .4byte gUnknown_203AAB4
_080E4C48:
	ldr r0, _080E4C50 @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x10
	b _080E4ED8
	.align 2, 0
_080E4C50: .4byte gUnknown_203AAB4
_080E4C54:
	ldr r1, [r7]
	movs r0, 0x3
	b _080E4ED8
_080E4C5A:
	ldr r1, [r7]
	movs r2, 0
	movs r0, 0x14
	strb r0, [r1]
	subs r0, 0x15
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080E4EDA
_080E4C70:
	ldr r0, _080E4CC8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E4C7E
	b _080E4EDA
_080E4C7E:
	ldr r2, [r7]
	ldr r6, _080E4CCC @ =0x00000263
	adds r0, r2, r6
	ldrb r0, [r0]
	ldr r3, _080E4CD0 @ =0x00000a68
	adds r1, r2, r3
	ldr r6, _080E4CD4 @ =0x00000a6a
	adds r2, r6
	bl ListMenuGetScrollAndRow
	bl FreeAllWindowBuffers
	ldr r0, _080E4CD8 @ =gPlayerParty
	ldr r5, [r7]
	movs r2, 0x98
	lsls r2, 2
	adds r1, r5, r2
	ldrb r1, [r1]
	ldr r2, _080E4CDC @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080E4CE0 @ =sub_80E4800
	subs r6, 0x3
	adds r4, r5, r6
	ldrb r4, [r4]
	lsls r4, 1
	adds r5, 0xE8
	adds r5, r4
	ldrh r4, [r5]
	str r4, [sp]
	bl ShowSelectMovePokemonSummaryScreen
	ldr r1, [r7]
	movs r0, 0x1C
	b _080E4ED8
	.align 2, 0
_080E4CC8: .4byte gPaletteFade
_080E4CCC: .4byte 0x00000263
_080E4CD0: .4byte 0x00000a68
_080E4CD4: .4byte 0x00000a6a
_080E4CD8: .4byte gPlayerParty
_080E4CDC: .4byte gPlayerPartyCount
_080E4CE0: .4byte sub_80E4800
_080E4CE4:
	ldr r1, [r7]
	b _080E4ED6
_080E4CE8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080E4EDA
_080E4CFA:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080E4D14 @ =gUnknown_203AAB4
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _080E4ED8
	.align 2, 0
_080E4D14: .4byte gUnknown_203AAB4
_080E4D18:
	ldr r0, _080E4D3C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E4D26
	b _080E4EDA
_080E4D26:
	bl FreeAllWindowBuffers
	ldr r0, _080E4D40 @ =gUnknown_203AAB4
	ldr r0, [r0]
	bl Free
	ldr r0, _080E4D44 @ =CB2_ReturnToField
	bl SetMainCallback2
	b _080E4EDA
	.align 2, 0
_080E4D3C: .4byte gPaletteFade
_080E4D40: .4byte gUnknown_203AAB4
_080E4D44: .4byte CB2_ReturnToField
_080E4D48:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	ldr r0, _080E4D88 @ =gUnknown_203AAB4
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_80E5444
	bl sub_80E4EF0
	bl sub_80E5300
	movs r0, 0x1
	bl sub_80E4F0C
	bl sub_80E54C0
	b _080E4EDA
	.align 2, 0
_080E4D88: .4byte gUnknown_203AAB4
_080E4D8C:
	ldr r0, _080E4DAC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E4D9A
	b _080E4EDA
_080E4D9A:
	ldr r1, [r7]
	ldr r0, _080E4DB0 @ =0x00000261
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0x4
	bne _080E4DB4
	movs r0, 0x18
	b _080E4ED8
	.align 2, 0
_080E4DAC: .4byte gPaletteFade
_080E4DB0: .4byte 0x00000261
_080E4DB4:
	movs r4, 0x98
	lsls r4, 2
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080E4E50 @ =gPlayerParty
	adds r0, r5
	ldrb r1, [r2]
	adds r1, 0xD
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080E4E54 @ =gStringVar3
	movs r1, 0xD
	mov r9, r1
	mov r1, r9
	muls r1, r0
	ldr r3, _080E4E58 @ =gMoveNames
	mov r8, r3
	add r1, r8
	adds r0, r2, 0
	bl StringCopy
	ldr r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	muls r0, r6
	adds r0, r5
	ldr r2, _080E4E5C @ =0x00000261
	adds r1, r2
	ldrb r1, [r1]
	bl RemoveMonPPBonus
	ldr r3, [r7]
	adds r4, r3, r4
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	ldr r4, _080E4E60 @ =0x00000a67
	adds r1, r3, r4
	ldrb r2, [r1]
	lsls r2, 1
	adds r1, r3, 0
	adds r1, 0xE8
	adds r1, r2
	ldrh r1, [r1]
	ldr r6, _080E4E5C @ =0x00000261
	adds r3, r6
	ldrb r2, [r3]
	bl SetMonMoveSlot
	ldr r0, _080E4E64 @ =gStringVar2
	ldr r2, [r7]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r1, 1
	adds r2, 0xE8
	adds r2, r1
	ldrh r1, [r2]
	mov r2, r9
	muls r2, r1
	adds r1, r2, 0
	add r1, r8
	bl StringCopy
	ldr r0, _080E4E68 @ =gUnknown_841E493
	bl sub_80E48C0
	ldr r1, [r7]
	movs r0, 0x1E
	strb r0, [r1]
	ldr r1, _080E4E6C @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	b _080E4EDA
	.align 2, 0
_080E4E50: .4byte gPlayerParty
_080E4E54: .4byte gStringVar3
_080E4E58: .4byte gMoveNames
_080E4E5C: .4byte 0x00000261
_080E4E60: .4byte 0x00000a67
_080E4E64: .4byte gStringVar2
_080E4E68: .4byte gUnknown_841E493
_080E4E6C: .4byte gSpecialVar_0x8004
_080E4E70:
	ldr r0, _080E4E88 @ =gUnknown_841E4C0
	bl sub_80E48C0
	ldr r0, _080E4E8C @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x1F
	strb r0, [r1]
	adds r0, 0xE2
	bl PlayFanfare
	b _080E4EDA
	.align 2, 0
_080E4E88: .4byte gUnknown_841E4C0
_080E4E8C: .4byte gUnknown_203AAB4
_080E4E90:
	ldr r0, _080E4EA0 @ =0x00000101
	bl PlayFanfare
	ldr r0, _080E4EA4 @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x20
	b _080E4ED8
	.align 2, 0
_080E4EA0: .4byte 0x00000101
_080E4EA4: .4byte gUnknown_203AAB4
_080E4EA8:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _080E4EDA
	ldr r0, _080E4EBC @ =gUnknown_203AAB4
	ldr r1, [r0]
	movs r0, 0x21
	b _080E4ED8
	.align 2, 0
_080E4EBC: .4byte gUnknown_203AAB4
_080E4EC0:
	ldr r0, _080E4EE8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E4EDA
	movs r0, 0x5
	bl PlaySE
_080E4ED2:
	ldr r0, _080E4EEC @ =gUnknown_203AAB4
	ldr r1, [r0]
_080E4ED6:
	movs r0, 0xE
_080E4ED8:
	strb r0, [r1]
_080E4EDA:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4EE8: .4byte gMain
_080E4EEC: .4byte gUnknown_203AAB4
	thumb_func_end sub_80E48F4

	thumb_func_start sub_80E4EF0
sub_80E4EF0: @ 80E4EF0
	push {r4,lr}
	movs r4, 0x6
_080E4EF4:
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	adds r4, 0x1
	cmp r4, 0x7
	ble _080E4EF4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E4EF0

	thumb_func_start sub_80E4F0C
sub_80E4F0C: @ 80E4F0C
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080E4F42
	ldr r4, _080E4F4C @ =gStringVar4
	ldr r1, _080E4F50 @ =gUnknown_841E3E3
	adds r0, r4, 0
	bl StringExpandPlaceholders
	str r5, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x7
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl sub_80E559C
	movs r0, 0x7
	bl PutWindowTilemap
	movs r0, 0x7
	movs r1, 0x3
	bl CopyWindowToVram
_080E4F42:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E4F4C: .4byte gStringVar4
_080E4F50: .4byte gUnknown_841E3E3
	thumb_func_end sub_80E4F0C

	thumb_func_start sub_80E4F54
sub_80E4F54: @ 80E4F54
	push {r4,lr}
	ldr r2, _080E4FA4 @ =gUnknown_203AAB4
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x2]
	ldr r0, [r2]
	strb r1, [r0, 0x19]
	ldr r0, [r2]
	strb r1, [r0, 0x18]
	ldr r0, [r2]
	strb r1, [r0, 0x1C]
	ldr r0, [r2]
	strb r1, [r0, 0x1A]
	ldr r0, [r2]
	strb r1, [r0, 0x1B]
	ldr r0, [r2]
	strb r1, [r0, 0x1D]
	ldr r0, [r2]
	strb r1, [r0, 0x1E]
	ldr r0, [r2]
	ldr r3, _080E4FA8 @ =0x0000025f
	adds r0, r3
	strb r1, [r0]
	movs r3, 0
	adds r4, r2, 0
	movs r2, 0
_080E4F8C:
	ldr r0, [r4]
	lsls r1, r3, 1
	adds r0, 0xE8
	adds r0, r1
	strh r2, [r0]
	adds r3, 0x1
	cmp r3, 0x13
	ble _080E4F8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4FA4: .4byte gUnknown_203AAB4
_080E4FA8: .4byte 0x0000025f
	thumb_func_end sub_80E4F54

	thumb_func_start sub_80E4FAC
sub_80E4FAC: @ 80E4FAC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	movs r0, 0xFF
	ands r1, r0
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	beq _080E4FD0
	cmp r0, 0x1
	ble _080E4FF6
	cmp r0, 0x2
	beq _080E4FE4
	b _080E4FF6
_080E4FD0:
	adds r0, r1, 0
	movs r1, 0x3
	bl Sin
	ldrh r1, [r4, 0x32]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	strh r0, [r4, 0x24]
	b _080E4FF6
_080E4FE4:
	adds r0, r1, 0
	movs r1, 0x1
	bl Sin
	ldrh r1, [r4, 0x32]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	strh r0, [r4, 0x26]
_080E4FF6:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E4FAC

	thumb_func_start sub_80E5004
sub_80E5004: @ 80E5004
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _080E50B4 @ =gUnknown_83FF9F4
	bl LoadSpriteSheet
	ldr r0, _080E50B8 @ =gUnknown_83FF9FC
	bl LoadSpritePalette
	ldr r0, _080E50BC @ =gUnknown_83FFA24
	mov r8, r0
	movs r1, 0xC8
	movs r2, 0x4
	movs r3, 0
	bl CreateSprite
	ldr r5, _080E50C0 @ =gUnknown_203AAB4
	ldr r1, [r5]
	strb r0, [r1, 0x3]
	ldr r0, [r5]
	ldrb r1, [r0, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080E50C4 @ =gSprites
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r5]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r6, 0x2
	strh r6, [r0, 0x2E]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080E50C8 @ =0x0000ffff
	strh r1, [r0, 0x32]
	mov r0, r8
	movs r1, 0xC8
	movs r2, 0x6C
	movs r3, 0
	bl CreateSprite
	ldr r1, [r5]
	strb r0, [r1, 0x3]
	ldr r2, [r5]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r6, [r0, 0x2E]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	strh r1, [r0, 0x32]
	movs r2, 0
	movs r3, 0x4
_080E508C:
	ldr r0, [r5]
	adds r0, 0x3
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x1
	ble _080E508C
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E50B4: .4byte gUnknown_83FF9F4
_080E50B8: .4byte gUnknown_83FF9FC
_080E50BC: .4byte gUnknown_83FFA24
_080E50C0: .4byte gUnknown_203AAB4
_080E50C4: .4byte gSprites
_080E50C8: .4byte 0x0000ffff
	thumb_func_end sub_80E5004

	thumb_func_start sub_80E50CC
sub_80E50CC: @ 80E50CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r7, _080E51E8 @ =gUnknown_203AAB4
	ldr r1, [r7]
	movs r4, 0x98
	lsls r4, 2
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080E51EC @ =gPlayerParty
	adds r0, r5
	adds r1, 0xE8
	bl GetMoveRelearnerMoves
	ldr r1, [r7]
	strb r0, [r1, 0x1A]
	ldr r1, [r7]
	adds r4, r1, r4
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	adds r1, 0xE8
	bl GetMoveRelearnerMoves
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r0, [r7]
	ldrb r0, [r0, 0x1A]
	cmp r5, r0
	bge _080E513C
	adds r6, r7, 0
	movs r7, 0xD
	movs r4, 0x8D
	lsls r4, 1
_080E511A:
	ldr r1, [r6]
	adds r0, r1, r4
	lsls r2, r5, 1
	adds r1, 0xE8
	adds r1, r2
	ldrh r1, [r1]
	muls r1, r7
	ldr r2, _080E51F0 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	adds r4, 0xD
	adds r5, 0x1
	ldr r0, [r6]
	ldrb r0, [r0, 0x1A]
	cmp r5, r0
	blt _080E511A
_080E513C:
	ldr r4, _080E51E8 @ =gUnknown_203AAB4
	ldr r0, [r4]
	movs r1, 0x98
	lsls r1, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E51EC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _080E51F4 @ =gStringVar1
	mov r1, sp
	bl StringCopy10
	ldr r0, [r4]
	ldrb r2, [r0, 0x1A]
	movs r1, 0xD
	muls r1, r2
	movs r7, 0x8D
	lsls r7, 1
	adds r1, r7
	adds r0, r1
	ldr r1, _080E51F8 @ =gFameCheckerText_Cancel
	bl StringCopy
	ldr r1, [r4]
	ldrb r0, [r1, 0x1A]
	adds r0, 0x1
	strb r0, [r1, 0x1A]
	movs r5, 0
	movs r3, 0x1
	add r3, r8
	mov r12, r3
	cmp r5, r8
	bge _080E51AA
	adds r6, r4, 0
	adds r4, r7, 0
_080E518E:
	ldr r0, [r6]
	lsls r3, r5, 3
	adds r1, r0, 0
	adds r1, 0x20
	adds r1, r3
	adds r2, r0, r4
	str r2, [r1]
	adds r0, 0x24
	adds r0, r3
	str r5, [r0]
	adds r4, 0xD
	adds r5, 0x1
	cmp r5, r8
	blt _080E518E
_080E51AA:
	ldr r4, _080E51E8 @ =gUnknown_203AAB4
	ldr r2, [r4]
	lsls r3, r5, 3
	adds r0, r2, 0
	adds r0, 0x20
	adds r0, r3
	ldr r1, _080E51F8 @ =gFameCheckerText_Cancel
	str r1, [r0]
	adds r2, 0x24
	adds r2, r3
	movs r0, 0xFE
	str r0, [r2]
	ldr r2, _080E51FC @ =gMultiuseListMenuTemplate
	adds r1, r2, 0
	ldr r0, _080E5200 @ =gUnknown_83FFA94
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldr r0, [r4]
	adds r0, 0x20
	str r0, [r2]
	mov r5, r12
	strh r5, [r2, 0xC]
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E51E8: .4byte gUnknown_203AAB4
_080E51EC: .4byte gPlayerParty
_080E51F0: .4byte gMoveNames
_080E51F4: .4byte gStringVar1
_080E51F8: .4byte gFameCheckerText_Cancel
_080E51FC: .4byte gMultiuseListMenuTemplate
_080E5200: .4byte gUnknown_83FFA94
	thumb_func_end sub_80E50CC

	thumb_func_start sub_80E5204
sub_80E5204: @ 80E5204
	push {r4,r5,lr}
	ldr r4, _080E5258 @ =gUnknown_203AAB4
	ldr r0, [r4]
	ldr r1, _080E525C @ =0x00000263
	adds r0, r1
	ldrb r0, [r0]
	bl ListMenu_ProcessInput
	ldr r0, _080E5260 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E5284
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldr r2, _080E5264 @ =0x00000a67
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xFE
	beq _080E5270
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _080E5268 @ =gStringVar2
	ldr r1, [r4]
	adds r2, r1, r2
	ldrb r3, [r2]
	movs r2, 0xD
	muls r2, r3
	movs r3, 0x8D
	lsls r3, 1
	adds r2, r3
	adds r1, r2
	bl StringCopy
	ldr r0, _080E526C @ =gUnknown_841E3FB
	bl sub_80E48C0
	b _080E529E
	.align 2, 0
_080E5258: .4byte gUnknown_203AAB4
_080E525C: .4byte 0x00000263
_080E5260: .4byte gMain
_080E5264: .4byte 0x00000a67
_080E5268: .4byte gStringVar2
_080E526C: .4byte gUnknown_841E3FB
_080E5270:
	ldr r0, _080E5280 @ =gUnknown_841E4E2
	bl sub_80E48C0
	ldr r1, [r4]
	movs r0, 0xC
	strb r0, [r1]
	b _080E529E
	.align 2, 0
_080E5280: .4byte gUnknown_841E4E2
_080E5284:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E529E
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	movs r1, 0xC
	strb r1, [r0]
	ldr r0, _080E52DC @ =gUnknown_841E4E2
	bl sub_80E48C0
_080E529E:
	ldr r0, _080E52E0 @ =gUnknown_203AAB4
	ldr r4, [r0]
	ldrb r0, [r4, 0x1A]
	cmp r0, 0x6
	bls _080E52FA
	ldr r2, _080E52E4 @ =gSprites
	movs r0, 0x3E
	adds r0, r2
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x5
	negs r1, r1
	adds r3, r1, 0
	ands r3, r0
	mov r0, r12
	strb r3, [r0]
	adds r5, r2, 0
	adds r5, 0x82
	ldrb r0, [r5]
	adds r2, r1, 0
	ands r2, r0
	strb r2, [r5]
	ldrb r0, [r4, 0x19]
	cmp r0, 0
	bne _080E52E8
	movs r1, 0x4
	adds r0, r3, 0
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	b _080E52FA
	.align 2, 0
_080E52DC: .4byte gUnknown_841E4E2
_080E52E0: .4byte gUnknown_203AAB4
_080E52E4: .4byte gSprites
_080E52E8:
	ldrb r1, [r4, 0x19]
	ldrb r0, [r4, 0x1A]
	subs r0, 0x6
	cmp r1, r0
	bne _080E52FA
	movs r1, 0x4
	adds r0, r2, 0
	orrs r0, r1
	strb r0, [r5]
_080E52FA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E5204

	thumb_func_start sub_80E5300
sub_80E5300: @ 80E5300
	push {r4,lr}
	ldr r0, _080E5330 @ =gMultiuseListMenuTemplate
	ldr r4, _080E5334 @ =gUnknown_203AAB4
	ldr r2, [r4]
	ldr r3, _080E5338 @ =0x00000a68
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r3, 0x2
	adds r2, r3
	ldrh r2, [r2]
	bl ListMenuInit
	ldr r1, [r4]
	ldr r2, _080E533C @ =0x00000263
	adds r1, r2
	strb r0, [r1]
	movs r0, 0x6
	movs r1, 0x1
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5330: .4byte gMultiuseListMenuTemplate
_080E5334: .4byte gUnknown_203AAB4
_080E5338: .4byte 0x00000a68
_080E533C: .4byte 0x00000263
	thumb_func_end sub_80E5300

	thumb_func_start sub_80E5340
sub_80E5340: @ 80E5340
	push {r4,r5,lr}
	sub sp, 0x3C
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080E5380 @ =gBattleMoves
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x2]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	movs r2, 0x1
	movs r3, 0x4
	bl BlitMoveInfoIcon
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	bhi _080E5388
	ldr r1, _080E5384 @ =gText_ThreeHyphens
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1
	movs r3, 0x4
	bl sub_80E559C
	b _080E53A6
	.align 2, 0
_080E5380: .4byte gBattleMoves
_080E5384: .4byte gText_ThreeHyphens
_080E5388:
	ldrb r1, [r4, 0x1]
	add r0, sp, 0x8
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x3
	add r1, sp, 0x8
	movs r2, 0x1
	movs r3, 0x4
	bl sub_80E559C
_080E53A6:
	ldr r2, _080E53CC @ =gBattleMoves
	lsls r1, r5, 1
	adds r0, r1, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x3]
	adds r4, r1, 0
	cmp r2, 0
	bne _080E53D4
	ldr r1, _080E53D0 @ =gText_ThreeHyphens
	str r2, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1
	movs r3, 0x12
	bl sub_80E559C
	b _080E53F4
	.align 2, 0
_080E53CC: .4byte gBattleMoves
_080E53D0: .4byte gText_ThreeHyphens
_080E53D4:
	ldrb r1, [r0, 0x3]
	add r0, sp, 0x8
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x3
	add r1, sp, 0x8
	movs r2, 0x1
	movs r3, 0x12
	bl sub_80E559C
_080E53F4:
	ldr r1, _080E543C @ =gBattleMoves
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x4]
	add r0, sp, 0x8
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x4
	add r1, sp, 0x8
	movs r2, 0x2
	movs r3, 0x2
	bl sub_80E559C
	ldr r1, _080E5440 @ =gMoveDescriptionPointers
	subs r0, r5, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x5
	movs r2, 0x1
	movs r3, 0
	bl sub_80E559C
	add sp, 0x3C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E543C: .4byte gBattleMoves
_080E5440: .4byte gMoveDescriptionPointers
	thumb_func_end sub_80E5340

	thumb_func_start sub_80E5444
sub_80E5444: @ 80E5444
	push {lr}
	movs r0, 0
	movs r1, 0x13
	movs r2, 0x1
	movs r3, 0x4
	bl BlitMoveInfoIcon
	movs r0, 0x1
	movs r1, 0x14
	movs r2, 0
	movs r3, 0x4
	bl BlitMoveInfoIcon
	movs r0, 0x1
	movs r1, 0x15
	movs r2, 0
	movs r3, 0x13
	bl BlitMoveInfoIcon
	movs r0, 0
	movs r1, 0x16
	movs r2, 0x1
	movs r3, 0x13
	bl BlitMoveInfoIcon
	movs r0, 0
	movs r1, 0x17
	movs r2, 0x1
	movs r3, 0x22
	bl BlitMoveInfoIcon
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x7
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_80E5444

	thumb_func_start sub_80E54C0
sub_80E54C0: @ 80E54C0
	push {r4,r5,lr}
	ldr r0, _080E54E0 @ =gUnknown_203AAB4
	ldr r1, [r0]
	ldr r0, _080E54E4 @ =0x00000a67
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0xFE
	beq _080E54E8
	lsls r0, 1
	adds r1, 0xE8
	adds r1, r0
	ldrh r0, [r1]
	bl sub_80E5340
	b _080E5504
	.align 2, 0
_080E54E0: .4byte gUnknown_203AAB4
_080E54E4: .4byte 0x00000a67
_080E54E8:
	movs r5, 0x2
_080E54EA:
	lsls r4, r5, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0
	movs r1, 0x2
	bl CopyWindowToVram
	adds r5, 0x1
	cmp r5, 0x5
	ble _080E54EA
_080E5504:
	movs r0, 0x3
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x4
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x5
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x7
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E54C0

	thumb_func_start sub_80E553C
sub_80E553C: @ 80E553C
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _080E5560
	movs r0, 0x5
	bl PlaySE
	ldr r2, _080E5568 @ =gUnknown_203AAB4
	ldr r0, [r2]
	ldr r1, _080E556C @ =0x0000025f
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _080E5570 @ =0x00000a67
	adds r0, r1
	strb r4, [r0]
_080E5560:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5568: .4byte gUnknown_203AAB4
_080E556C: .4byte 0x0000025f
_080E5570: .4byte 0x00000a67
	thumb_func_end sub_80E553C

	thumb_func_start sub_80E5574
sub_80E5574: @ 80E5574
	push {r4,lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _080E5594
	movs r0, 0x6
	bl PutWindowTilemap
	movs r0, 0x6
	movs r1, 0x1
	bl CopyWindowToVram
_080E5594:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5574

	thumb_func_start sub_80E559C
sub_80E559C: @ 80E559C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r10, r1
	ldr r4, [sp, 0x38]
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	movs r0, 0x1
	mov r8, r0
	mov r9, r0
	cmp r4, 0x1
	bhi _080E55C8
	movs r1, 0
	mov r8, r1
	mov r9, r1
_080E55C8:
	cmp r4, 0
	blt _080E5622
	cmp r4, 0x1
	ble _080E55D6
	cmp r4, 0x2
	beq _080E5604
	b _080E5622
_080E55D6:
	ldr r2, _080E55F4 @ =gUnknown_203AAB4
	ldr r0, [r2]
	ldr r1, _080E55F8 @ =0x00000a64
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _080E55FC @ =0x00000a65
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _080E5600 @ =0x00000a66
	b _080E561C
	.align 2, 0
_080E55F4: .4byte gUnknown_203AAB4
_080E55F8: .4byte 0x00000a64
_080E55FC: .4byte 0x00000a65
_080E5600: .4byte 0x00000a66
_080E5604:
	ldr r2, _080E5678 @ =gUnknown_203AAB4
	ldr r0, [r2]
	ldr r1, _080E567C @ =0x00000a64
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _080E5680 @ =0x00000a65
	adds r0, r1
	strb r4, [r0]
	ldr r0, [r2]
	adds r1, 0x1
_080E561C:
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
_080E5622:
	cmp r4, 0x1
	beq _080E563E
	ldr r0, _080E5678 @ =gUnknown_203AAB4
	ldr r0, [r0]
	ldr r1, _080E567C @ =0x00000a64
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FillWindowPixelBuffer
_080E563E:
	mov r0, r8
	str r0, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	ldr r0, _080E5678 @ =gUnknown_203AAB4
	ldr r0, [r0]
	ldr r1, _080E567C @ =0x00000a64
	adds r0, r1
	str r0, [sp, 0x8]
	ldr r0, [sp, 0x34]
	lsls r0, 24
	asrs r0, 24
	str r0, [sp, 0xC]
	mov r0, r10
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r7, 0
	adds r3, r6, 0
	bl AddTextPrinterParameterized4
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E5678: .4byte gUnknown_203AAB4
_080E567C: .4byte 0x00000a64
_080E5680: .4byte 0x00000a65
	thumb_func_end sub_80E559C

	.align 2, 0 @ Don't pad with nop.
