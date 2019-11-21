	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start GoToBagMenu
GoToBagMenu: @ 8107DB4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, r6, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	bl sub_81081AC
	ldr r5, _08107DE4 @ =gUnknown_203AD10
	movs r0, 0x14
	bl Alloc
	str r0, [r5]
	cmp r0, 0
	bne _08107DE8
	adds r0, r4, 0
	bl SetMainCallback2
	b _08107E9A
	.align 2, 0
_08107DE4: .4byte gUnknown_203AD10
_08107DE8:
	cmp r6, 0xB
	beq _08107DF0
	ldr r0, _08107E38 @ =gUnknown_203ACFC
	strb r6, [r0, 0x4]
_08107DF0:
	cmp r4, 0
	beq _08107DF8
	ldr r0, _08107E38 @ =gUnknown_203ACFC
	str r4, [r0]
_08107DF8:
	ldr r1, [r5]
	movs r0, 0
	str r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r2, [r5]
	ldrb r1, [r2, 0x5]
	movs r0, 0x31
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x5]
	ldr r2, [r5]
	ldrb r1, [r2, 0x5]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x5]
	ldr r1, [r5]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x8]
	ldr r1, [r5]
	strb r0, [r1, 0x9]
	cmp r6, 0x3
	bne _08107E3C
	ldr r2, [r5]
	ldrb r1, [r2, 0x5]
	subs r0, 0xF
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	b _08107E5A
	.align 2, 0
_08107E38: .4byte gUnknown_203ACFC
_08107E3C:
	cmp r7, 0x6
	bne _08107E50
	ldr r2, [r5]
	ldrb r1, [r2, 0x5]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	b _08107E5A
_08107E50:
	ldr r2, [r5]
	ldrb r1, [r2, 0x5]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
_08107E5A:
	strb r0, [r2, 0x5]
	movs r1, 0
	ldr r4, _08107EA4 @ =gTextFlags
	ldr r5, _08107EA8 @ =gSpecialVar_ItemId
	ldr r6, _08107EAC @ =sub_8107F10
	ldr r3, _08107EB0 @ =gUnknown_203AD10
	movs r2, 0
_08107E68:
	ldr r0, [r3]
	adds r0, 0x10
	adds r0, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _08107E68
	mov r0, r8
	cmp r0, 0x2
	bhi _08107E86
	ldr r0, _08107EB4 @ =gUnknown_203ACFC
	mov r1, r8
	strh r1, [r0, 0x6]
_08107E86:
	ldrb r0, [r4]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0
	strh r0, [r5]
	adds r0, r6, 0
	bl SetMainCallback2
_08107E9A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08107EA4: .4byte gTextFlags
_08107EA8: .4byte gSpecialVar_ItemId
_08107EAC: .4byte sub_8107F10
_08107EB0: .4byte gUnknown_203AD10
_08107EB4: .4byte gUnknown_203ACFC
	thumb_func_end GoToBagMenu

	thumb_func_start CB2_BagMenuFromStartMenu
CB2_BagMenuFromStartMenu: @ 8107EB8
	push {lr}
	ldr r2, _08107EC8 @ =CB2_ReturnToStartMenu
	movs r0, 0
	movs r1, 0x3
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_08107EC8: .4byte CB2_ReturnToStartMenu
	thumb_func_end CB2_BagMenuFromStartMenu

	thumb_func_start sub_8107ECC
sub_8107ECC: @ 8107ECC
	push {lr}
	ldr r2, _08107EDC @ =SetCB2ToReshowScreenAfterMenu2
	movs r0, 0x5
	movs r1, 0x3
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_08107EDC: .4byte SetCB2ToReshowScreenAfterMenu2
	thumb_func_end sub_8107ECC

	thumb_func_start sub_8107EE0
sub_8107EE0: @ 8107EE0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl DoScheduledBgTilemapCopiesToVram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8107EE0

	thumb_func_start sub_8107EFC
sub_8107EFC: @ 8107EFC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8107EFC

	thumb_func_start sub_8107F10
sub_8107F10: @ 8107F10
	push {lr}
_08107F12:
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08107F36
	bl sub_8107F3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08107F36
	bl MenuHelpers_LinkSomething
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08107F12
_08107F36:
	pop {r0}
	bx r0
	thumb_func_end sub_8107F10

	thumb_func_start sub_8107F3C
sub_8107F3C: @ 8107F3C
	push {r4,r5,lr}
	ldr r0, _08107F58 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x13
	bls _08107F4E
	b _0810811C
_08107F4E:
	lsls r0, 2
	ldr r1, _08107F5C @ =_08107F60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08107F58: .4byte gMain
_08107F5C: .4byte _08107F60
	.align 2, 0
_08107F60:
	.4byte _08107FB0
	.4byte _08107FBA
	.4byte _08107FC0
	.4byte _08107FC6
	.4byte _08107FD8
	.4byte _08107FDE
	.4byte _08107FE4
	.4byte _08107FF6
	.4byte _08108010
	.4byte _08108020
	.4byte _08108026
	.4byte _08108034
	.4byte _08108046
	.4byte _08108054
	.4byte _0810806E
	.4byte _081080B8
	.4byte _081080C8
	.4byte _081080D2
	.4byte _081080D8
	.4byte _081080DE
_08107FB0:
	bl SetVBlankHBlankCallbacksToNull
	bl ClearScheduledBgCopiesToVram
	b _08108104
_08107FBA:
	bl ScanlineEffect_Stop
	b _08108104
_08107FC0:
	bl FreeAllSpritePalettes
	b _08108104
_08107FC6:
	bl ResetPaletteFade
	ldr r2, _08107FD4 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	b _08108102
	.align 2, 0
_08107FD4: .4byte gPaletteFade
_08107FD8:
	bl ResetSpriteData
	b _08108104
_08107FDE:
	bl ResetItemMenuIconState
	b _08108104
_08107FE4:
	bl MenuHelpers_LinkSomething
	lsls r0, 24
	cmp r0, 0
	beq _08107FF0
	b _08108104
_08107FF0:
	bl ResetTasks
	b _08108104
_08107FF6:
	bl sub_81081D0
	lsls r0, 24
	cmp r0, 0
	beq _0810803E
	ldr r0, _0810800C @ =gUnknown_203AD10
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x10]
	b _08108104
	.align 2, 0
_0810800C: .4byte gUnknown_203AD10
_08108010:
	bl sub_8108240
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810801E
	b _08108134
_0810801E:
	b _08108104
_08108020:
	bl sub_810B858
	b _08108104
_08108026:
	bl sub_8108E54
	bl sub_8108A68
	bl sub_8108A84
	b _08108104
_08108034:
	bl sub_81083F4
	lsls r0, 24
	cmp r0, 0
	bne _08108104
_0810803E:
	bl sub_810813C
	movs r0, 0x1
	b _08108136
_08108046:
	ldr r0, _08108050 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	bl sub_810842C
	b _08108104
	.align 2, 0
_08108050: .4byte gUnknown_203ACFC
_08108054:
	ldr r0, _08108064 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x4]
	cmp r0, 0x3
	beq _08108068
	bl sub_81087EC
	b _08108104
	.align 2, 0
_08108064: .4byte gUnknown_203ACFC
_08108068:
	bl sub_810B994
	b _08108104
_0810806E:
	ldr r4, _081080AC @ =gUnknown_203ACFC
	ldrb r0, [r4, 0x4]
	bl sub_8108388
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _081080B0 @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r1, r4, 0
	adds r1, 0xE
	adds r1, r2, r1
	ldrh r1, [r1]
	adds r4, 0x8
	adds r2, r4
	ldrh r2, [r2]
	bl ListMenuInit
	ldr r2, _081080B4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	strh r0, [r1, 0x8]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x18]
	b _08108104
	.align 2, 0
_081080AC: .4byte gUnknown_203ACFC
_081080B0: .4byte gMultiuseListMenuTemplate
_081080B4: .4byte gTasks
_081080B8:
	ldr r0, _081080C4 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	bl sub_80984FC
	b _08108104
	.align 2, 0
_081080C4: .4byte gUnknown_203ACFC
_081080C8:
	bl sub_8108888
	bl sub_81088D8
	b _08108104
_081080D2:
	bl sub_80985E4
	b _08108104
_081080D8:
	bl sub_8108C10
	b _08108104
_081080DE:
	ldr r0, _081080F0 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x4]
	cmp r0, 0x3
	bne _081080F4
	movs r0, 0x1D
	bl HelpSystem_SetSomeVariable2
	b _081080FA
	.align 2, 0
_081080F0: .4byte gUnknown_203ACFC
_081080F4:
	movs r0, 0x9
	bl HelpSystem_SetSomeVariable2
_081080FA:
	ldr r2, _08108114 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
_08108102:
	strb r0, [r2, 0x8]
_08108104:
	ldr r1, _08108118 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08108134
	.align 2, 0
_08108114: .4byte gPaletteFade
_08108118: .4byte gMain
_0810811C:
	ldr r0, _0810812C @ =sub_8107EFC
	bl SetVBlankCallback
	ldr r0, _08108130 @ =sub_8107EE0
	bl SetMainCallback2
	movs r0, 0x1
	b _08108136
	.align 2, 0
_0810812C: .4byte sub_8107EFC
_08108130: .4byte sub_8107EE0
_08108134:
	movs r0, 0
_08108136:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8107F3C

	thumb_func_start sub_810813C
sub_810813C: @ 810813C
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0810816C @ =sub_8108178
	movs r1, 0
	bl CreateTask
	ldr r0, _08108170 @ =sub_8107EFC
	bl SetVBlankCallback
	ldr r0, _08108174 @ =sub_8107EE0
	bl SetMainCallback2
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810816C: .4byte sub_8108178
_08108170: .4byte sub_8107EFC
_08108174: .4byte sub_8107EE0
	thumb_func_end sub_810813C

	thumb_func_start sub_8108178
sub_8108178: @ 8108178
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081081A4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810819C
	ldr r0, _081081A8 @ =gUnknown_203ACFC
	ldr r0, [r0]
	bl SetMainCallback2
	bl sub_8108B04
	adds r0, r4, 0
	bl DestroyTask
_0810819C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081081A4: .4byte gPaletteFade
_081081A8: .4byte gUnknown_203ACFC
	thumb_func_end sub_8108178

	thumb_func_start sub_81081AC
sub_81081AC: @ 81081AC
	ldr r0, _081081C0 @ =gUnknown_203AD10
	movs r1, 0
	str r1, [r0]
	ldr r0, _081081C4 @ =gUnknown_203AD14
	str r1, [r0]
	ldr r0, _081081C8 @ =gUnknown_203AD18
	str r1, [r0]
	ldr r0, _081081CC @ =gUnknown_203AD1C
	str r1, [r0]
	bx lr
	.align 2, 0
_081081C0: .4byte gUnknown_203AD10
_081081C4: .4byte gUnknown_203AD14
_081081C8: .4byte gUnknown_203AD18
_081081CC: .4byte gUnknown_203AD1C
	thumb_func_end sub_81081AC

	thumb_func_start sub_81081D0
sub_81081D0: @ 81081D0
	push {r4,r5,lr}
	bl ResetAllBgsCoordinatesAndBgCntRegs
	ldr r5, _08108230 @ =gUnknown_203AD14
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	bl Alloc
	str r0, [r5]
	cmp r0, 0
	beq _08108238
	movs r1, 0
	adds r2, r4, 0
	bl memset
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08108234 @ =gUnknown_8452CF4
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	ldr r1, [r5]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	movs r1, 0xC1
	lsls r1, 6
	movs r0, 0
	bl SetGpuReg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1
	b _0810823A
	.align 2, 0
_08108230: .4byte gUnknown_203AD14
_08108234: .4byte gUnknown_8452CF4
_08108238:
	movs r0, 0
_0810823A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81081D0

	thumb_func_start sub_8108240
sub_8108240: @ 8108240
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _0810825C @ =gUnknown_203AD10
	ldr r0, [r4]
	ldrb r0, [r0, 0x10]
	cmp r0, 0x5
	bls _08108250
	b _08108368
_08108250:
	lsls r0, 2
	ldr r1, _08108260 @ =_08108264
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810825C: .4byte gUnknown_203AD10
_08108260: .4byte _08108264
	.align 2, 0
_08108264:
	.4byte _0810827C
	.4byte _08108298
	.4byte _081082D8
	.4byte _08108310
	.4byte _08108340
	.4byte _0810834C
_0810827C:
	bl ResetTempTileDataBuffers
	ldr r1, _08108294 @ =gUnknown_8E830CC
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	b _08108352
	.align 2, 0
_08108294: .4byte gUnknown_8E830CC
_08108298:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810837C
	ldr r0, _081082B8 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x4]
	cmp r0, 0x3
	beq _081082C4
	ldr r0, _081082BC @ =gUnknown_8E832C0
	ldr r1, _081082C0 @ =gUnknown_203AD14
	ldr r1, [r1]
	bl LZDecompressWram
	b _08108352
	.align 2, 0
_081082B8: .4byte gUnknown_203ACFC
_081082BC: .4byte gUnknown_8E832C0
_081082C0: .4byte gUnknown_203AD14
_081082C4:
	ldr r0, _081082D0 @ =gUnknown_8E83444
	ldr r1, _081082D4 @ =gUnknown_203AD14
	ldr r1, [r1]
	bl LZDecompressWram
	b _08108352
	.align 2, 0
_081082D0: .4byte gUnknown_8E83444
_081082D4: .4byte gUnknown_203AD14
_081082D8:
	ldr r0, _08108304 @ =gUnknown_8E835B4
	movs r1, 0
	movs r2, 0x60
	bl LoadCompressedPalette
	bl sub_810ADAC
	lsls r0, 24
	cmp r0, 0
	bne _08108352
	ldr r0, _08108308 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _08108352
	ldr r0, _0810830C @ =gUnknown_8E83604
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	b _08108352
	.align 2, 0
_08108304: .4byte gUnknown_8E835B4
_08108308: .4byte gSaveBlock2Ptr
_0810830C: .4byte gUnknown_8E83604
_08108310:
	bl sub_810ADAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08108326
	ldr r0, _0810832C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08108334
_08108326:
	ldr r0, _08108330 @ =gUnknown_83D41E4
	b _0810834E
	.align 2, 0
_0810832C: .4byte gSaveBlock2Ptr
_08108330: .4byte gUnknown_83D41E4
_08108334:
	ldr r0, _0810833C @ =gUnknown_83D41EC
	bl LoadCompressedSpriteSheet
	b _08108352
	.align 2, 0
_0810833C: .4byte gUnknown_83D41EC
_08108340:
	ldr r0, _08108348 @ =gUnknown_83D41F4
	bl LoadCompressedSpritePalette
	b _08108352
	.align 2, 0
_08108348: .4byte gUnknown_83D41F4
_0810834C:
	ldr r0, _08108360 @ =gBagSwapSpriteSheet
_0810834E:
	bl LoadCompressedSpriteSheet
_08108352:
	ldr r0, _08108364 @ =gUnknown_203AD10
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _0810837C
	.align 2, 0
_08108360: .4byte gBagSwapSpriteSheet
_08108364: .4byte gUnknown_203AD10
_08108368:
	ldr r0, _08108378 @ =gBagSwapSpritePalette
	bl LoadCompressedSpritePalette
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x10]
	movs r0, 0x1
	b _0810837E
	.align 2, 0
_08108378: .4byte gBagSwapSpritePalette
_0810837C:
	movs r0, 0
_0810837E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8108240

	thumb_func_start sub_8108388
sub_8108388: @ 8108388
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x6
	cmp r0, 0x4
	bhi _081083E0
	lsls r0, 2
	ldr r1, _081083A0 @ =_081083A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081083A0: .4byte _081083A4
	.align 2, 0
_081083A4:
	.4byte _081083B8
	.4byte _081083D0
	.4byte _081083D8
	.4byte _081083C0
	.4byte _081083C8
_081083B8:
	ldr r0, _081083BC @ =sub_810AF9C
	b _081083E2
	.align 2, 0
_081083BC: .4byte sub_810AF9C
_081083C0:
	ldr r0, _081083C4 @ =sub_810B1D4
	b _081083E2
	.align 2, 0
_081083C4: .4byte sub_810B1D4
_081083C8:
	ldr r0, _081083CC @ =sub_810B5D4
	b _081083E2
	.align 2, 0
_081083CC: .4byte sub_810B5D4
_081083D0:
	ldr r0, _081083D4 @ =sub_810B4BC
	b _081083E2
	.align 2, 0
_081083D4: .4byte sub_810B4BC
_081083D8:
	ldr r0, _081083DC @ =sub_810B378
	b _081083E2
	.align 2, 0
_081083DC: .4byte sub_810B378
_081083E0:
	ldr r0, _081083F0 @ =sub_8108F0C
_081083E2:
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_081083F0: .4byte sub_8108F0C
	thumb_func_end sub_8108388

	thumb_func_start sub_81083F4
sub_81083F4: @ 81083F4
	push {r4,lr}
	ldr r4, _08108418 @ =gUnknown_203AD18
	movs r0, 0xAC
	lsls r0, 1
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _08108424
	ldr r4, _0810841C @ =gUnknown_203AD1C
	ldr r0, _08108420 @ =0x00000331
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _08108424
	movs r0, 0x1
	b _08108426
	.align 2, 0
_08108418: .4byte gUnknown_203AD18
_0810841C: .4byte gUnknown_203AD1C
_08108420: .4byte 0x00000331
_08108424:
	movs r0, 0
_08108426:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81083F4

	thumb_func_start sub_810842C
sub_810842C: @ 810842C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, r7, 3
	ldr r0, _0810853C @ =gBagPockets
	adds r1, r0
	mov r8, r1
	movs r6, 0
	ldr r0, _08108540 @ =gUnknown_203AD10
	ldr r0, [r0]
	adds r0, 0xA
	adds r0, r7
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0810848C
	ldr r5, _08108544 @ =gUnknown_203AD1C
_08108450:
	lsls r2, r6, 2
	adds r4, r2, r6
	lsls r4, 2
	subs r4, r6
	ldr r0, [r5]
	adds r0, r4
	mov r3, r8
	ldr r1, [r3]
	adds r2, r1
	ldrh r1, [r2]
	bl sub_8108560
	ldr r0, _08108548 @ =gUnknown_203AD18
	ldr r0, [r0]
	lsls r1, r6, 3
	adds r1, r0
	ldr r0, [r5]
	adds r0, r4
	str r0, [r1]
	str r6, [r1, 0x4]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _08108540 @ =gUnknown_203AD10
	ldr r0, [r0]
	adds r0, 0xA
	adds r0, r7
	ldrb r0, [r0]
	cmp r6, r0
	bcc _08108450
_0810848C:
	ldr r5, _08108544 @ =gUnknown_203AD1C
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 2
	subs r4, r6
	ldr r0, [r5]
	adds r0, r4
	ldr r1, _0810854C @ =gUnknown_8452F60
	bl StringCopy
	ldr r0, [r5]
	adds r0, r4
	ldr r1, _08108550 @ =gFameCheckerText_Cancel
	bl StringAppend
	ldr r0, _08108548 @ =gUnknown_203AD18
	ldr r2, [r0]
	lsls r1, r6, 3
	adds r1, r2
	ldr r0, [r5]
	adds r0, r4
	str r0, [r1]
	str r6, [r1, 0x4]
	ldr r3, _08108554 @ =gMultiuseListMenuTemplate
	str r2, [r3]
	ldr r0, _08108540 @ =gUnknown_203AD10
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xA
	adds r0, r7
	ldrb r0, [r0]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0xC]
	strb r1, [r3, 0x10]
	strb r1, [r3, 0x11]
	movs r0, 0x9
	strb r0, [r3, 0x12]
	movs r0, 0x1
	strb r0, [r3, 0x13]
	ldrb r0, [r3, 0x16]
	movs r4, 0x8
	negs r4, r4
	ands r4, r0
	movs r0, 0x39
	negs r0, r0
	ands r4, r0
	movs r0, 0x10
	orrs r4, r0
	strb r4, [r3, 0x16]
	ldrb r0, [r3, 0x14]
	movs r1, 0x10
	negs r1, r1
	ands r1, r0
	movs r5, 0x2
	orrs r1, r5
	strb r1, [r3, 0x14]
	adds r2, 0xD
	adds r2, r7
	ldrb r0, [r2]
	strh r0, [r3, 0xE]
	ldrb r0, [r3, 0x17]
	movs r2, 0x40
	negs r2, r2
	ands r2, r0
	orrs r2, r5
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x20
	orrs r1, r0
	strb r1, [r3, 0x14]
	movs r0, 0x30
	strb r0, [r3, 0x15]
	ldr r0, _08108558 @ =sub_81085A4
	str r0, [r3, 0x4]
	ldr r0, _0810855C @ =sub_8108654
	str r0, [r3, 0x8]
	movs r0, 0x3F
	ands r2, r0
	strb r2, [r3, 0x17]
	ands r4, r0
	strb r4, [r3, 0x16]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810853C: .4byte gBagPockets
_08108540: .4byte gUnknown_203AD10
_08108544: .4byte gUnknown_203AD1C
_08108548: .4byte gUnknown_203AD18
_0810854C: .4byte gUnknown_8452F60
_08108550: .4byte gFameCheckerText_Cancel
_08108554: .4byte gMultiuseListMenuTemplate
_08108558: .4byte sub_81085A4
_0810855C: .4byte sub_8108654
	thumb_func_end sub_810842C

	thumb_func_start sub_8108560
sub_8108560: @ 8108560
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _0810857C @ =0xfe940000
	adds r1, r0
	lsrs r1, 16
	cmp r1, 0x1
	bhi _08108584
	ldr r1, _08108580 @ =gUnknown_8452F66
	adds r0, r4, 0
	bl StringCopy
	b _0810858C
	.align 2, 0
_0810857C: .4byte 0xfe940000
_08108580: .4byte gUnknown_8452F66
_08108584:
	ldr r1, _081085A0 @ =gUnknown_8452F60
	adds r0, r4, 0
	bl StringCopy
_0810858C:
	adds r0, r5, 0
	bl ItemId_GetName
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringAppend
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081085A0: .4byte gUnknown_8452F60
	thumb_func_end sub_8108560

	thumb_func_start sub_81085A4
sub_81085A4: @ 81085A4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	beq _081085BA
	movs r0, 0xF5
	bl PlaySE
	bl sub_8098580
_081085BA:
	ldr r4, _08108604 @ =gUnknown_203AD10
	ldr r1, [r4]
	ldrb r0, [r1, 0x4]
	cmp r0, 0xFF
	bne _08108644
	ldrb r1, [r1, 0x5]
	lsls r1, 26
	lsrs r1, 30
	movs r0, 0x1
	eors r0, r1
	bl DestroyItemMenuIcon
	ldr r2, [r4]
	ldr r0, _08108608 @ =gUnknown_203ACFC
	ldrh r1, [r0, 0x6]
	adds r0, r2, 0
	adds r0, 0xA
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, r5
	beq _0810860C
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r5, 16
	lsrs r1, 16
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [r4]
	ldrb r1, [r1, 0x5]
	lsls r1, 26
	lsrs r1, 30
	bl CreateItemMenuIcon
	b _08108618
	.align 2, 0
_08108604: .4byte gUnknown_203AD10
_08108608: .4byte gUnknown_203ACFC
_0810860C:
	ldr r0, _0810864C @ =0x00000177
	ldrb r1, [r2, 0x5]
	lsls r1, 26
	lsrs r1, 30
	bl CreateItemMenuIcon
_08108618:
	ldr r4, _08108650 @ =gUnknown_203AD10
	ldr r3, [r4]
	ldrb r2, [r3, 0x5]
	lsls r0, r2, 26
	lsrs r0, 30
	movs r1, 0x1
	eors r1, r0
	lsls r1, 4
	movs r0, 0x31
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r4]
	ldrb r1, [r0, 0x5]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	bne _08108644
	adds r0, r5, 0
	bl sub_8108818
_08108644:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810864C: .4byte 0x00000177
_08108650: .4byte gUnknown_203AD10
	thumb_func_end sub_81085A4

	thumb_func_start sub_8108654
sub_8108654: @ 8108654
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _08108684 @ =gUnknown_203AD10
	ldr r0, [r0]
	ldrb r1, [r0, 0x4]
	cmp r1, 0xFF
	beq _08108690
	lsls r0, r4, 24
	lsrs r0, 24
	cmp r1, r0
	bne _08108688
	adds r0, r6, 0
	movs r1, 0x2
	bl bag_menu_print_cursor
	b _08108690
	.align 2, 0
_08108684: .4byte gUnknown_203AD10
_08108688:
	adds r0, r6, 0
	movs r1, 0xFF
	bl bag_menu_print_cursor
_08108690:
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _08108752
	ldr r0, _08108718 @ =gUnknown_203AD10
	ldr r0, [r0]
	ldr r5, _0810871C @ =gUnknown_203ACFC
	ldrh r1, [r5, 0x6]
	adds r0, 0xA
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, r4
	beq _08108752
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	adds r1, r4, 0
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r7, r0, 16
	ldrb r0, [r5, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl BagGetQuantityByPocketPosition
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r0, [r5, 0x6]
	cmp r0, 0x1
	beq _0810872C
	adds r0, r7, 0
	bl itemid_is_unique
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0810872C
	ldr r0, _08108720 @ =gStringVar1
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _08108724 @ =gStringVar4
	ldr r1, _08108728 @ =gText_TimesStrVar1
	adds r0, r4, 0
	bl StringExpandPlaceholders
	str r6, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r0, 0x1
	str r0, [sp, 0x10]
	mov r0, r8
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x6E
	bl sub_810B8F0
	b _08108752
	.align 2, 0
_08108718: .4byte gUnknown_203AD10
_0810871C: .4byte gUnknown_203ACFC
_08108720: .4byte gStringVar1
_08108724: .4byte gStringVar4
_08108728: .4byte gText_TimesStrVar1
_0810872C:
	ldr r0, _08108760 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08108764 @ =0x00000296
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08108752
	cmp r0, r7
	bne _08108752
	ldr r1, _08108768 @ =gUnknown_8452F7C
	movs r0, 0x18
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	mov r0, r8
	movs r2, 0x70
	adds r3, r6, 0
	bl BlitBitmapToWindow
_08108752:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108760: .4byte gSaveBlock1Ptr
_08108764: .4byte 0x00000296
_08108768: .4byte gUnknown_8452F7C
	thumb_func_end sub_8108654

	thumb_func_start bag_menu_print_cursor_
bag_menu_print_cursor_: @ 810876C
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
	bl bag_menu_print_cursor
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end bag_menu_print_cursor_

	thumb_func_start bag_menu_print_cursor
bag_menu_print_cursor: @ 810878C
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0xFF
	bne _081087C8
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetMenuCursorDimensionByFont
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1
	adds r3, r5, 0
	bl FillWindowPixelRect
	b _081087DE
_081087C8:
	ldr r2, _081087E8 @ =gFameCheckerText_ListMenuCursor
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0x1
	bl sub_810B8F0
_081087DE:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081087E8: .4byte gFameCheckerText_ListMenuCursor
	thumb_func_end bag_menu_print_cursor

	thumb_func_start sub_81087EC
sub_81087EC: @ 81087EC
	push {lr}
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r2, _08108810 @ =gUnknown_8452CFC
	ldr r0, _08108814 @ =gUnknown_203ACFC
	ldrh r1, [r0, 0x6]
	lsls r0, r1, 2
	adds r0, r2
	ldr r0, [r0]
	lsls r1, 24
	lsrs r1, 24
	bl sub_810B958
	pop {r0}
	bx r0
	.align 2, 0
_08108810: .4byte gUnknown_8452CFC
_08108814: .4byte gUnknown_203ACFC
	thumb_func_end sub_81087EC

	thumb_func_start sub_8108818
sub_8108818: @ 8108818
	push {r4,lr}
	sub sp, 0x14
	adds r2, r0, 0
	ldr r0, _0810884C @ =gUnknown_203AD10
	ldr r0, [r0]
	ldr r1, _08108850 @ =gUnknown_203ACFC
	ldrh r1, [r1, 0x6]
	adds r0, 0xA
	adds r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	beq _08108854
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r2, 16
	lsrs r1, 16
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl ItemId_GetDescription
	adds r4, r0, 0
	b _08108856
	.align 2, 0
_0810884C: .4byte gUnknown_203AD10
_08108850: .4byte gUnknown_203ACFC
_08108854:
	ldr r4, _08108884 @ =gUnknown_84162F5
_08108856:
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl sub_810B8F0
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08108884: .4byte gUnknown_84162F5
	thumb_func_end sub_8108818

	thumb_func_start sub_8108888
sub_8108888: @ 8108888
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _081088D0 @ =gUnknown_203AD10
	ldr r1, [r4]
	ldr r2, _081088D4 @ =gUnknown_203ACFC
	ldrh r3, [r2, 0x6]
	adds r0, r1, 0
	adds r0, 0xA
	adds r0, r3
	ldrb r0, [r0]
	adds r1, 0xD
	adds r1, r3
	ldrb r1, [r1]
	subs r0, r1
	adds r0, 0x1
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	ldrh r0, [r2, 0x6]
	lsls r0, 1
	adds r2, 0xE
	adds r0, r2
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0xA0
	movs r2, 0x8
	movs r3, 0x68
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r4]
	strb r0, [r1, 0x8]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081088D0: .4byte gUnknown_203AD10
_081088D4: .4byte gUnknown_203ACFC
	thumb_func_end sub_8108888

	thumb_func_start sub_81088D8
sub_81088D8: @ 81088D8
	push {r4,lr}
	ldr r4, _081088FC @ =gUnknown_203AD10
	ldr r0, [r4]
	ldrb r1, [r0, 0x5]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	beq _081088F4
	ldr r0, _08108900 @ =gUnknown_8452F6C
	ldr r1, _08108904 @ =gUnknown_203AD02
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	strb r0, [r1, 0x9]
_081088F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081088FC: .4byte gUnknown_203AD10
_08108900: .4byte gUnknown_8452F6C
_08108904: .4byte gUnknown_203AD02
	thumb_func_end sub_81088D8

	thumb_func_start sub_8108908
sub_8108908: @ 8108908
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _0810893C @ =gUnknown_203AD10
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0x6]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r1, 0x6
	str r1, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0x98
	movs r2, 0x48
	movs r3, 0x68
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r4]
	strb r0, [r1, 0x8]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810893C: .4byte gUnknown_203AD10
	thumb_func_end sub_8108908

	thumb_func_start sub_8108940
sub_8108940: @ 8108940
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _08108974 @ =gUnknown_203AD10
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0x6]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r1, 0x6
	str r1, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0xD4
	movs r2, 0x78
	movs r3, 0x98
	bl AddScrollIndicatorArrowPairParameterized
	ldr r1, [r4]
	strb r0, [r1, 0x8]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08108974: .4byte gUnknown_203AD10
	thumb_func_end sub_8108940

	thumb_func_start sub_8108978
sub_8108978: @ 8108978
	push {r4,lr}
	ldr r4, _08108998 @ =gUnknown_203AD10
	ldr r1, [r4]
	ldrb r0, [r1, 0x8]
	cmp r0, 0xFF
	beq _0810898E
	bl RemoveScrollIndicatorArrowPair
	ldr r1, [r4]
	movs r0, 0xFF
	strb r0, [r1, 0x8]
_0810898E:
	bl sub_810899C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08108998: .4byte gUnknown_203AD10
	thumb_func_end sub_8108978

	thumb_func_start sub_810899C
sub_810899C: @ 810899C
	push {r4,lr}
	ldr r4, _081089B8 @ =gUnknown_203AD10
	ldr r1, [r4]
	ldrb r0, [r1, 0x9]
	cmp r0, 0xFF
	beq _081089B2
	bl RemoveScrollIndicatorArrowPair
	ldr r1, [r4]
	movs r0, 0xFF
	strb r0, [r1, 0x9]
_081089B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081089B8: .4byte gUnknown_203AD10
	thumb_func_end sub_810899C

	thumb_func_start sub_81089BC
sub_81089BC: @ 81089BC
	push {r4,r5,lr}
	ldr r0, _081089F0 @ =gUnknown_203ACFC
	movs r2, 0
	movs r1, 0
	strh r1, [r0, 0x6]
	strb r2, [r0, 0x5]
	movs r2, 0
	adds r5, r0, 0
	adds r5, 0x8
	movs r3, 0
	adds r4, r0, 0
	adds r4, 0xE
_081089D4:
	lsls r1, r2, 1
	adds r0, r1, r5
	strh r3, [r0]
	adds r1, r4
	strh r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _081089D4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081089F0: .4byte gUnknown_203ACFC
	thumb_func_end sub_81089BC

	thumb_func_start sub_81089F4
sub_81089F4: @ 81089F4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _08108A60 @ =gUnknown_203ACFC
	lsls r1, r4, 1
	adds r0, r2, 0
	adds r0, 0xE
	adds r3, r1, r0
	ldrh r0, [r3]
	adds r7, r2, 0
	ldr r6, _08108A64 @ =gUnknown_203AD10
	cmp r0, 0
	beq _08108A2E
	adds r2, r0, 0
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0xD
	adds r0, r4
	ldrb r5, [r0]
	adds r2, r5
	adds r1, 0xA
	adds r1, r4
	ldrb r1, [r1]
	adds r0, r1, 0x1
	cmp r2, r0
	ble _08108A2E
	subs r0, r5, 0x1
	subs r0, r1, r0
	strh r0, [r3]
_08108A2E:
	lsls r2, r4, 1
	adds r0, r7, 0
	adds r0, 0xE
	adds r0, r2, r0
	ldrh r1, [r0]
	adds r0, r7, 0
	adds r0, 0x8
	adds r2, r0
	ldrh r0, [r2]
	adds r1, r0
	ldr r0, [r6]
	adds r0, 0xA
	adds r0, r4
	ldrb r0, [r0]
	adds r3, r0, 0x1
	cmp r1, r3
	blt _08108A58
	cmp r3, 0x1
	bgt _08108A56
	movs r0, 0
_08108A56:
	strh r0, [r2]
_08108A58:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108A60: .4byte gUnknown_203ACFC
_08108A64: .4byte gUnknown_203AD10
	thumb_func_end sub_81089F4

	thumb_func_start sub_8108A68
sub_8108A68: @ 8108A68
	push {r4,lr}
	movs r4, 0
_08108A6C:
	adds r0, r4, 0
	bl sub_81089F4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08108A6C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8108A68

	thumb_func_start sub_8108A84
sub_8108A84: @ 8108A84
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r0, _08108AF8 @ =gUnknown_203AD04
	mov r8, r0
_08108A90:
	lsls r2, r6, 1
	mov r3, r8
	adds r1, r2, r3
	ldrh r0, [r1]
	adds r7, r6, 0x1
	cmp r0, 0x3
	bls _08108AE6
	movs r5, 0
	subs r0, 0x3
	cmp r5, r0
	bgt _08108AE6
	ldr r0, _08108AFC @ =gUnknown_203AD0A
	ldr r3, _08108B00 @ =gUnknown_203AD10
	mov r12, r3
	adds r4, r2, r0
	adds r3, r1, 0
_08108AB0:
	ldrh r2, [r4]
	mov r0, r12
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xD
	adds r0, r6
	ldrb r0, [r0]
	adds r2, r0
	adds r1, 0xA
	adds r1, r6
	ldrb r0, [r1]
	adds r0, 0x1
	cmp r2, r0
	beq _08108AE6
	ldrh r0, [r3]
	subs r0, 0x1
	strh r0, [r3]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r3]
	subs r0, 0x3
	cmp r5, r0
	ble _08108AB0
_08108AE6:
	lsls r0, r7, 24
	lsrs r6, r0, 24
	cmp r6, 0x2
	bls _08108A90
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108AF8: .4byte gUnknown_203AD04
_08108AFC: .4byte gUnknown_203AD0A
_08108B00: .4byte gUnknown_203AD10
	thumb_func_end sub_8108A84

	thumb_func_start sub_8108B04
sub_8108B04: @ 8108B04
	push {lr}
	ldr r0, _08108B40 @ =gUnknown_203AD10
	ldr r0, [r0]
	cmp r0, 0
	beq _08108B12
	bl Free
_08108B12:
	ldr r0, _08108B44 @ =gUnknown_203AD14
	ldr r0, [r0]
	cmp r0, 0
	beq _08108B1E
	bl Free
_08108B1E:
	ldr r0, _08108B48 @ =gUnknown_203AD18
	ldr r0, [r0]
	cmp r0, 0
	beq _08108B2A
	bl Free
_08108B2A:
	ldr r0, _08108B4C @ =gUnknown_203AD1C
	ldr r0, [r0]
	cmp r0, 0
	beq _08108B36
	bl Free
_08108B36:
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
_08108B40: .4byte gUnknown_203AD10
_08108B44: .4byte gUnknown_203AD14
_08108B48: .4byte gUnknown_203AD18
_08108B4C: .4byte gUnknown_203AD1C
	thumb_func_end sub_8108B04

	thumb_func_start ItemMenu_StartFadeToExitCallback
ItemMenu_StartFadeToExitCallback: @ 8108B50
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08108B84 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08108B88 @ =sub_8108B8C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08108B84: .4byte gTasks
_08108B88: .4byte sub_8108B8C
	thumb_func_end ItemMenu_StartFadeToExitCallback

	thumb_func_start sub_8108B8C
sub_8108B8C: @ 8108B8C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08108BE0 @ =gTasks+0x8
	adds r4, r0, r1
	ldr r0, _08108BE4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08108C08
	ldr r0, _08108BE8 @ =sub_8108CFC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08108C08
	ldrb r0, [r4]
	ldr r4, _08108BEC @ =gUnknown_203ACFC
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r1, r4, 0
	adds r1, 0xE
	adds r1, r2, r1
	adds r3, r4, 0
	adds r3, 0x8
	adds r2, r3
	bl DestroyListMenuTask
	ldr r0, _08108BF0 @ =gUnknown_203AD10
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _08108BF4
	bl SetMainCallback2
	b _08108BFA
	.align 2, 0
_08108BE0: .4byte gTasks+0x8
_08108BE4: .4byte gPaletteFade
_08108BE8: .4byte sub_8108CFC
_08108BEC: .4byte gUnknown_203ACFC
_08108BF0: .4byte gUnknown_203AD10
_08108BF4:
	ldr r0, [r4]
	bl SetMainCallback2
_08108BFA:
	bl sub_8108978
	bl sub_8108B04
	adds r0, r5, 0
	bl DestroyTask
_08108C08:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8108B8C

	thumb_func_start sub_8108C10
sub_8108C10: @ 8108C10
	push {r4,r5,lr}
	sub sp, 0x8
	movs r5, 0
	add r0, sp, 0x4
	strh r5, [r0]
	movs r1, 0
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x3F
	bl SetGpuReg
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r4, _08108C68 @ =gUnknown_203ACFC
	ldrb r0, [r4, 0x5]
	cmp r0, 0x1
	bne _08108C6C
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	b _08108C9E
	.align 2, 0
_08108C68: .4byte gUnknown_203ACFC
_08108C6C:
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0xA0
	bl SetGpuReg
	ldr r0, _08108CA8 @ =sub_8108CFC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08108CAC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0xC0
	strh r0, [r1, 0x8]
	ldr r0, _08108CB0 @ =0x0000fff0
	strh r0, [r1, 0xA]
	movs r0, 0x1
	strb r0, [r4, 0x5]
_08108C9E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08108CA8: .4byte sub_8108CFC
_08108CAC: .4byte gTasks
_08108CB0: .4byte 0x0000fff0
	thumb_func_end sub_8108C10

	thumb_func_start sub_8108CB4
sub_8108CB4: @ 8108CB4
	push {lr}
	ldr r0, _08108CE0 @ =sub_8108CFC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08108CE4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	ldr r0, _08108CE8 @ =0x0000fff0
	strh r0, [r1, 0x8]
	movs r0, 0x10
	strh r0, [r1, 0xA]
	ldr r0, _08108CEC @ =gUnknown_203ACFC
	strb r2, [r0, 0x5]
	pop {r0}
	bx r0
	.align 2, 0
_08108CE0: .4byte sub_8108CFC
_08108CE4: .4byte gTasks
_08108CE8: .4byte 0x0000fff0
_08108CEC: .4byte gUnknown_203ACFC
	thumb_func_end sub_8108CB4

	thumb_func_start CB2_SetUpReshowBattleScreenAfterMenu
CB2_SetUpReshowBattleScreenAfterMenu: @ 8108CF0
	ldr r1, _08108CF8 @ =gUnknown_203ACFC
	movs r0, 0
	strb r0, [r1, 0x5]
	bx lr
	.align 2, 0
_08108CF8: .4byte gUnknown_203ACFC
	thumb_func_end CB2_SetUpReshowBattleScreenAfterMenu

	thumb_func_start sub_8108CFC
sub_8108CFC: @ 8108CFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08108D28 @ =gTasks+0x8
	adds r4, r0, r1
	ldrh r0, [r4, 0x2]
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA0
	ble _08108D2C
	movs r0, 0x44
	movs r1, 0xA0
	bl SetGpuReg
	b _08108D34
	.align 2, 0
_08108D28: .4byte gTasks+0x8
_08108D2C:
	ldrh r1, [r4]
	movs r0, 0x44
	bl SetGpuReg
_08108D34:
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	cmp r1, 0x10
	bne _08108D44
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0xA0
	beq _08108D54
_08108D44:
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bne _08108D5A
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08108D5A
_08108D54:
	adds r0, r5, 0
	bl DestroyTask
_08108D5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8108CFC

	thumb_func_start ItemMenu_MoveItemSlotToNewPositionInArray
ItemMenu_MoveItemSlotToNewPositionInArray: @ 8108D60
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r3, r2, 0
	cmp r1, r3
	beq _08108DC0
	lsls r0, r1, 2
	adds r0, r4
	ldr r6, [r0]
	cmp r3, r1
	bls _08108D98
	subs r3, 0x1
	lsls r1, 16
	lsls r0, r3, 16
	asrs r2, r0, 16
	cmp r1, r0
	bge _08108DBA
	adds r5, r2, 0
_08108D82:
	asrs r2, r1, 16
	lsls r0, r2, 2
	adds r0, r4
	ldr r1, [r0, 0x4]
	str r1, [r0]
	adds r2, 0x1
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, r5
	blt _08108D82
	b _08108DBA
_08108D98:
	lsls r1, 16
	lsls r0, r3, 16
	asrs r2, r0, 16
	cmp r1, r0
	ble _08108DBA
	adds r5, r2, 0
_08108DA4:
	asrs r2, r1, 16
	lsls r1, r2, 2
	adds r1, r4
	subs r0, r1, 0x4
	ldr r0, [r0]
	str r0, [r1]
	subs r2, 0x1
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, r5
	bgt _08108DA4
_08108DBA:
	lsls r0, r3, 2
	adds r0, r4
	str r6, [r0]
_08108DC0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ItemMenu_MoveItemSlotToNewPositionInArray

	thumb_func_start sub_8108DC8
sub_8108DC8: @ 8108DC8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, r5, 3
	ldr r0, _08108E3C @ =gBagPockets
	adds r4, r1, r0
	ldr r0, [r4]
	ldrb r1, [r4, 0x4]
	bl BagPocketCompaction
	ldr r3, _08108E40 @ =gUnknown_203AD10
	ldr r0, [r3]
	adds r0, 0xA
	adds r0, r5
	movs r1, 0
	strb r1, [r0]
	movs r2, 0
	ldrb r0, [r4, 0x4]
	cmp r2, r0
	bcs _08108E1C
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08108E1C
_08108DF8:
	ldr r0, [r3]
	adds r0, 0xA
	adds r0, r5
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r0, [r4, 0x4]
	cmp r2, r0
	bcs _08108E1C
	ldr r0, [r4]
	lsls r1, r2, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _08108DF8
_08108E1C:
	ldr r0, _08108E40 @ =gUnknown_203AD10
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xA
	adds r0, r5
	ldrb r0, [r0]
	adds r2, r0, 0x1
	cmp r2, 0x6
	ble _08108E44
	adds r0, r1, 0
	adds r0, 0xD
	adds r0, r5
	movs r1, 0x6
	strb r1, [r0]
	b _08108E4C
	.align 2, 0
_08108E3C: .4byte gBagPockets
_08108E40: .4byte gUnknown_203AD10
_08108E44:
	adds r0, r1, 0
	adds r0, 0xD
	adds r0, r5
	strb r2, [r0]
_08108E4C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8108DC8

	thumb_func_start sub_8108E54
sub_8108E54: @ 8108E54
	push {r4,lr}
	movs r4, 0
_08108E58:
	adds r0, r4, 0
	bl sub_8108DC8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08108E58
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8108E54

	thumb_func_start DisplayItemMessageInBag
DisplayItemMessageInBag: @ 8108E70
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x10
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	mov r9, r3
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08108EDC @ =gTasks+0x8
	adds r4, r0
	movs r0, 0x5
	bl sub_810BA70
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x14]
	str r6, [sp]
	str r0, [sp, 0x4]
	mov r0, r8
	str r0, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r2, 0x6D
	movs r3, 0xD
	bl DisplayMessageAndContinueTask
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08108EDC: .4byte gTasks+0x8
	thumb_func_end DisplayItemMessageInBag

	thumb_func_start ItemMenu_SetExitCallback
ItemMenu_SetExitCallback: @ 8108EE0
	ldr r1, _08108EE8 @ =gUnknown_203AD10
	ldr r1, [r1]
	str r0, [r1]
	bx lr
	.align 2, 0
_08108EE8: .4byte gUnknown_203AD10
	thumb_func_end ItemMenu_SetExitCallback

	thumb_func_start sub_8108EEC
sub_8108EEC: @ 8108EEC
	lsls r0, 24
	ldr r1, _08108F08 @ =gUnknown_203ACFC
	lsrs r0, 23
	adds r2, r1, 0
	adds r2, 0xE
	adds r2, r0, r2
	adds r1, 0x8
	adds r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2]
	adds r0, r2
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08108F08: .4byte gUnknown_203ACFC
	thumb_func_end sub_8108EEC

	thumb_func_start sub_8108F0C
sub_8108F0C: @ 8108F0C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08108F78 @ =gTasks+0x8
	adds r7, r0, r1
	ldr r0, _08108F7C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08108F2C
	b _081090C6
_08108F2C:
	ldr r0, _08108F80 @ =sub_8108CFC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08108F3C
	b _081090C6
_08108F3C:
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08108F4A
	b _081090C6
_08108F4A:
	ldr r4, _08108F84 @ =gUnknown_203ACFC
	ldrb r1, [r4, 0x6]
	adds r0, r6, 0
	bl sub_8109168
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08108F8C
	cmp r0, 0x2
	beq _08108F94
	ldr r0, _08108F88 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08108FE4
	adds r5, r4, 0
	ldrb r0, [r5, 0x4]
	cmp r0, 0
	bne _08108FE4
	b _08108FA0
	.align 2, 0
_08108F78: .4byte gTasks+0x8
_08108F7C: .4byte gPaletteFade
_08108F80: .4byte sub_8108CFC
_08108F84: .4byte gUnknown_203ACFC
_08108F88: .4byte gMain
_08108F8C:
	movs r1, 0x1
	negs r1, r1
	adds r0, r6, 0
	b _08108F98
_08108F94:
	adds r0, r6, 0
	movs r1, 0x1
_08108F98:
	movs r2, 0
	bl sub_81091D0
	b _081090C6
_08108FA0:
	ldrb r0, [r7]
	mov r4, sp
	adds r4, 0x2
	mov r1, sp
	adds r2, r4, 0
	bl ListMenuGetScrollAndRow
	mov r0, sp
	ldrh r1, [r0]
	ldrh r0, [r4]
	adds r1, r0
	ldr r0, _08108FE0 @ =gUnknown_203AD10
	ldr r0, [r0]
	adds r0, 0xA
	ldrh r5, [r5, 0x6]
	adds r0, r5
	ldrb r0, [r0]
	cmp r1, r0
	beq _08108FE4
	movs r0, 0x5
	bl PlaySE
	mov r0, sp
	ldrh r1, [r4]
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	adds r0, r6, 0
	bl sub_81093B8
	b _081090C6
	.align 2, 0
_08108FE0: .4byte gUnknown_203AD10
_08108FE4:
	ldrb r0, [r7]
	bl ListMenu_ProcessInput
	adds r4, r0, 0
	ldrb r0, [r7]
	ldr r5, _08109014 @ =gUnknown_203ACFC
	ldrh r2, [r5, 0x6]
	lsls r2, 1
	adds r1, r5, 0
	adds r1, 0xE
	adds r1, r2, r1
	adds r3, r5, 0
	adds r3, 0x8
	adds r2, r3
	bl ListMenuGetScrollAndRow
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _08109018
	adds r0, 0x1
	cmp r4, r0
	bne _08109044
	b _081090C6
	.align 2, 0
_08109014: .4byte gUnknown_203ACFC
_08109018:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08109038 @ =gSpecialVar_ItemId
	movs r0, 0
	strh r0, [r1]
	bl sub_8108CB4
	ldr r1, _0810903C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08109040 @ =ItemMenu_StartFadeToExitCallback
	b _081090C4
	.align 2, 0
_08109038: .4byte gSpecialVar_ItemId
_0810903C: .4byte gTasks
_08109040: .4byte ItemMenu_StartFadeToExitCallback
_08109044:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08109074 @ =gUnknown_203AD10
	ldr r0, [r0]
	adds r0, 0xA
	ldrh r1, [r5, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	cmp r4, r0
	bne _08109084
	ldr r1, _08109078 @ =gSpecialVar_ItemId
	movs r0, 0
	strh r0, [r1]
	bl sub_8108CB4
	ldr r1, _0810907C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08109080 @ =ItemMenu_StartFadeToExitCallback
	b _081090C4
	.align 2, 0
_08109074: .4byte gUnknown_203AD10
_08109078: .4byte gSpecialVar_ItemId
_0810907C: .4byte gTasks
_08109080: .4byte ItemMenu_StartFadeToExitCallback
_08109084:
	bl sub_8108978
	ldrb r0, [r7]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	strh r4, [r7, 0x2]
	ldrb r0, [r5, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	adds r1, r4, 0
	bl BagGetQuantityByPocketPosition
	strh r0, [r7, 0x4]
	ldrb r0, [r5, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl BagGetItemIdByPocketPosition
	ldr r1, _081090D0 @ =gSpecialVar_ItemId
	strh r0, [r1]
	ldr r1, _081090D4 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _081090D8 @ =sub_81090DC
_081090C4:
	str r1, [r0]
_081090C6:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081090D0: .4byte gSpecialVar_ItemId
_081090D4: .4byte gTasks
_081090D8: .4byte sub_81090DC
	thumb_func_end sub_8108F0C

	thumb_func_start sub_81090DC
sub_81090DC: @ 81090DC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _08109104 @ =gUnknown_8452F34
	ldr r0, _08109108 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109104: .4byte gUnknown_8452F34
_08109108: .4byte gUnknown_203ACFC
	thumb_func_end sub_81090DC

	thumb_func_start sub_810910C
sub_810910C: @ 810910C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_8109140
	bl sub_8108888
	bl sub_81088D8
	ldr r1, _08109138 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810913C @ =sub_8108F0C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109138: .4byte gTasks
_0810913C: .4byte sub_8108F0C
	thumb_func_end sub_810910C

	thumb_func_start sub_8109140
sub_8109140: @ 8109140
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
	bl SetBgTilemapPalette
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_8109140

	thumb_func_start sub_8109168
sub_8109168: @ 8109168
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _081091A4 @ =gUnknown_203AD10
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _081091C6
	bl GetLRKeysState
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081091A8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08109194
	cmp r2, 0x1
	bne _081091AC
_08109194:
	cmp r4, 0
	beq _081091C6
	movs r0, 0xF6
	bl PlaySE
	movs r0, 0x1
	b _081091C8
	.align 2, 0
_081091A4: .4byte gUnknown_203AD10
_081091A8: .4byte gMain
_081091AC:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _081091B8
	cmp r2, 0x2
	bne _081091C6
_081091B8:
	cmp r4, 0x1
	bhi _081091C6
	movs r0, 0xF6
	bl PlaySE
	movs r0, 0x2
	b _081091C8
_081091C6:
	movs r0, 0
_081091C8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8109168

	thumb_func_start sub_81091D0
sub_81091D0: @ 81091D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r6, r1, 0
	lsls r2, 16
	lsls r0, r5, 2
	adds r0, r5
	lsls r7, r0, 3
	ldr r0, _08109288 @ =gTasks+0x8
	mov r8, r0
	adds r4, r7, r0
	movs r0, 0
	strh r0, [r4, 0x1A]
	strh r0, [r4, 0x18]
	strh r6, [r4, 0x16]
	cmp r2, 0
	bne _08109242
	movs r0, 0
	bl ClearWindowTilemap
	movs r0, 0x1
	bl ClearWindowTilemap
	movs r0, 0x2
	bl ClearWindowTilemap
	ldrb r0, [r4]
	ldr r3, _0810928C @ =gUnknown_203ACFC
	ldrh r2, [r3, 0x6]
	lsls r2, 1
	adds r1, r3, 0
	adds r1, 0xE
	adds r1, r2, r1
	adds r3, 0x8
	adds r2, r3
	bl DestroyListMenuTask
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _08109290 @ =gUnknown_203AD10
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	lsls r1, 26
	lsrs r1, 30
	movs r0, 0x1
	eors r0, r1
	bl DestroyItemMenuIcon
	bl sub_8108978
_08109242:
	movs r0, 0x12
	str r0, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x2D
	movs r2, 0xB
	movs r3, 0x1
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _0810928C @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, r6
	lsls r0, 24
	lsrs r0, 24
	bl sub_8098528
	ldr r1, _08109294 @ =sub_8109298
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r2, [r0]
	adds r0, r5, 0
	bl SetTaskFuncWithFollowupFunc
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08109288: .4byte gTasks+0x8
_0810928C: .4byte gUnknown_203ACFC
_08109290: .4byte gUnknown_203AD10
_08109294: .4byte sub_8109298
	thumb_func_end sub_81091D0

	thumb_func_start sub_8109298
sub_8109298: @ 8109298
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _081092DC @ =gTasks+0x8
	adds r5, r0, r1
	bl MenuHelpers_LinkSomething
	lsls r0, 24
	cmp r0, 0
	bne _08109314
	bl sub_810ADAC
	lsls r0, 24
	cmp r0, 0
	bne _08109314
	ldr r4, _081092E0 @ =gUnknown_203ACFC
	ldrb r1, [r5, 0x16]
	ldrb r0, [r4, 0x6]
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8109168
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081092E4
	cmp r0, 0x2
	beq _081092FA
	b _08109314
	.align 2, 0
_081092DC: .4byte gTasks+0x8
_081092E0: .4byte gUnknown_203ACFC
_081092E4:
	ldrh r0, [r5, 0x16]
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r4, 0x6]
	adds r0, r6, 0
	bl SwitchTaskToFollowupFunc
	movs r1, 0x1
	negs r1, r1
	adds r0, r6, 0
	b _0810930C
_081092FA:
	ldrh r0, [r5, 0x16]
	ldrh r2, [r4, 0x6]
	adds r0, r2
	strh r0, [r4, 0x6]
	adds r0, r6, 0
	bl SwitchTaskToFollowupFunc
	adds r0, r6, 0
	movs r1, 0x1
_0810930C:
	movs r2, 0x1
	bl sub_81091D0
	b _081093AA
_08109314:
	movs r1, 0x1A
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08109322
	cmp r0, 0x1
	beq _08109358
	b _081093AA
_08109322:
	ldrh r1, [r5, 0x18]
	movs r2, 0x18
	ldrsh r0, [r5, r2]
	ldr r4, _08109354 @ =0x00007fff
	cmp r0, r4
	beq _0810934C
	adds r0, r1, 0x1
	strh r0, [r5, 0x18]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8109854
	movs r1, 0x18
	ldrsh r0, [r5, r1]
	cmp r0, 0xC
	bne _08109344
	strh r4, [r5, 0x18]
_08109344:
	movs r2, 0x18
	ldrsh r0, [r5, r2]
	cmp r0, r4
	bne _081093AA
_0810934C:
	ldrh r0, [r5, 0x1A]
	adds r0, 0x1
	strh r0, [r5, 0x1A]
	b _081093AA
	.align 2, 0
_08109354: .4byte 0x00007fff
_08109358:
	ldr r4, _081093B0 @ =gUnknown_203ACFC
	ldrh r0, [r5, 0x16]
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r4, 0x6]
	bl sub_81087EC
	ldrb r0, [r4, 0x6]
	bl sub_810842C
	ldr r0, _081093B4 @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r1, r4, 0
	adds r1, 0xE
	adds r1, r2, r1
	ldrh r1, [r1]
	adds r4, 0x8
	adds r2, r4
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_8108888
	bl sub_81088D8
	adds r0, r6, 0
	bl SwitchTaskToFollowupFunc
_081093AA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081093B0: .4byte gUnknown_203ACFC
_081093B4: .4byte gMultiuseListMenuTemplate
	thumb_func_end sub_8109298

	thumb_func_start sub_81093B8
sub_81093B8: @ 81093B8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x18
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, r0, 2
	adds r5, r0
	lsls r5, 3
	ldr r0, _08109494 @ =gTasks+0x8
	mov r9, r0
	adds r1, r5, 0
	add r1, r9
	mov r8, r1
	ldrb r0, [r1]
	mov r2, sp
	adds r2, 0x16
	add r1, sp, 0x14
	bl ListMenuGetScrollAndRow
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x10
	movs r2, 0x1
	bl ListMenuSetUnkIndicatorsStructField
	mov r0, r8
	strh r4, [r0, 0x2]
	ldr r0, _08109498 @ =gUnknown_203AD10
	ldr r0, [r0]
	movs r6, 0
	strb r4, [r0, 0x4]
	ldr r4, _0810949C @ =gStringVar1
	ldr r0, _081094A0 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	ldrh r1, [r2, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl ItemId_GetName
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r4, _081094A4 @ =gStringVar4
	ldr r1, _081094A8 @ =gOtherText_WhereShouldTheStrVar1BePlaced
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl sub_810B8F0
	mov r1, r8
	ldrb r0, [r1]
	bl ListMenuGetYCoordForPrintingArrowCursor
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl sub_80986A8
	movs r0, 0
	bl sub_8098660
	bl sub_810899C
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x8
	negs r0, r0
	add r9, r0
	add r5, r9
	ldr r0, _081094AC @ =sub_81094B0
	str r0, [r5]
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109494: .4byte gTasks+0x8
_08109498: .4byte gUnknown_203AD10
_0810949C: .4byte gStringVar1
_081094A0: .4byte gUnknown_203ACFC
_081094A4: .4byte gStringVar4
_081094A8: .4byte gOtherText_WhereShouldTheStrVar1BePlaced
_081094AC: .4byte sub_81094B0
	thumb_func_end sub_81093B8

	thumb_func_start sub_81094B0
sub_81094B0: @ 81094B0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08109538 @ =gTasks+0x8
	adds r4, r0, r1
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810959E
	ldrb r0, [r4]
	bl ListMenu_ProcessInput
	adds r5, r0, 0
	ldrb r0, [r4]
	ldr r3, _0810953C @ =gUnknown_203ACFC
	ldrh r2, [r3, 0x6]
	lsls r2, 1
	adds r1, r3, 0
	adds r1, 0xE
	adds r1, r2, r1
	adds r3, 0x8
	adds r2, r3
	bl ListMenuGetScrollAndRow
	ldrb r0, [r4]
	bl ListMenuGetYCoordForPrintingArrowCursor
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl sub_80986A8
	ldr r0, _08109540 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08109548
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08109544 @ =gUnknown_203AD10
	ldr r1, [r0]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldrb r0, [r4]
	mov r4, sp
	adds r4, 0x2
	mov r1, sp
	adds r2, r4, 0
	bl ListMenuGetScrollAndRow
	mov r0, sp
	ldrh r1, [r0]
	ldrh r0, [r4]
	adds r1, r0
	adds r0, r6, 0
	bl sub_81095AC
	b _0810959E
	.align 2, 0
_08109538: .4byte gTasks+0x8
_0810953C: .4byte gUnknown_203ACFC
_08109540: .4byte gMain
_08109544: .4byte gUnknown_203AD10
_08109548:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _08109558
	adds r0, 0x1
	cmp r5, r0
	bne _08109588
	b _0810959E
_08109558:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08109584 @ =gUnknown_203AD10
	ldr r1, [r0]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldrb r0, [r4]
	mov r4, sp
	adds r4, 0x2
	mov r1, sp
	adds r2, r4, 0
	bl ListMenuGetScrollAndRow
	mov r0, sp
	ldrh r1, [r0]
	ldrh r0, [r4]
	adds r1, r0
	adds r0, r6, 0
	bl sub_810967C
	b _0810959E
	.align 2, 0
_08109584: .4byte gUnknown_203AD10
_08109588:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _081095A8 @ =gUnknown_203AD10
	ldr r1, [r0]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_81095AC
_0810959E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081095A8: .4byte gUnknown_203AD10
	thumb_func_end sub_81094B0

	thumb_func_start sub_81095AC
sub_81095AC: @ 81095AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	mov r9, r0
	ldr r0, _081095E4 @ =gTasks+0x8
	mov r10, r0
	mov r6, r9
	add r6, r10
	movs r3, 0x2
	ldrsh r2, [r6, r3]
	cmp r2, r5
	beq _081095DA
	subs r0, r5, 0x1
	cmp r2, r0
	bne _081095E8
_081095DA:
	adds r0, r1, 0
	adds r1, r5, 0
	bl sub_810967C
	b _0810965C
	.align 2, 0
_081095E4: .4byte gTasks+0x8
_081095E8:
	ldr r1, _0810966C @ =gBagPockets
	ldr r4, _08109670 @ =gUnknown_203ACFC
	ldrh r0, [r4, 0x6]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r2, 0
	adds r2, r5, 0
	bl ItemMenu_MoveItemSlotToNewPositionInArray
	ldrb r0, [r6]
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	movs r1, 0xE
	adds r1, r4
	mov r8, r1
	adds r1, r2, r1
	adds r7, r4, 0
	adds r7, 0x8
	adds r2, r7
	bl DestroyListMenuTask
	movs r3, 0x2
	ldrsh r0, [r6, r3]
	cmp r0, r5
	bcs _08109628
	ldrh r1, [r4, 0x6]
	lsls r1, 1
	adds r1, r7
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_08109628:
	ldrb r0, [r4, 0x6]
	bl sub_810842C
	ldr r0, _08109674 @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	mov r3, r8
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r2, r7
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6]
	movs r0, 0x1
	bl sub_8098660
	bl sub_81088D8
	mov r0, r10
	subs r0, 0x8
	add r0, r9
	ldr r1, _08109678 @ =sub_8108F0C
	str r1, [r0]
_0810965C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810966C: .4byte gBagPockets
_08109670: .4byte gUnknown_203ACFC
_08109674: .4byte gMultiuseListMenuTemplate
_08109678: .4byte sub_8108F0C
	thumb_func_end sub_81095AC

	thumb_func_start sub_810967C
sub_810967C: @ 810967C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	mov r8, r1
	ldr r0, _0810970C @ =gTasks+0x8
	mov r10, r0
	mov r6, r8
	add r6, r10
	ldrb r0, [r6]
	ldr r5, _08109710 @ =gUnknown_203ACFC
	ldrh r2, [r5, 0x6]
	lsls r2, 1
	movs r1, 0xE
	adds r1, r5
	mov r9, r1
	adds r1, r2, r1
	adds r7, r5, 0
	adds r7, 0x8
	adds r2, r7
	bl DestroyListMenuTask
	movs r3, 0x2
	ldrsh r0, [r6, r3]
	cmp r0, r4
	bcs _081096CA
	ldrh r1, [r5, 0x6]
	lsls r1, 1
	adds r1, r7
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_081096CA:
	ldrb r0, [r5, 0x6]
	bl sub_810842C
	ldr r0, _08109714 @ =gMultiuseListMenuTemplate
	ldrh r2, [r5, 0x6]
	lsls r2, 1
	mov r3, r9
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r2, r7
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6]
	movs r0, 0x1
	bl sub_8098660
	bl sub_81088D8
	mov r0, r10
	subs r0, 0x8
	add r0, r8
	ldr r1, _08109718 @ =sub_8108F0C
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810970C: .4byte gTasks+0x8
_08109710: .4byte gUnknown_203ACFC
_08109714: .4byte gMultiuseListMenuTemplate
_08109718: .4byte sub_8108F0C
	thumb_func_end sub_810967C

	thumb_func_start sub_810971C
sub_810971C: @ 810971C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x14
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x6
	movs r1, 0x2
	bl sub_810B9DC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _081097D4 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081097D8 @ =gStringVar1
	mov r10, r1
	bl CopyItemName
	ldr r0, _081097DC @ =gStringVar4
	mov r9, r0
	adds r1, r6, 0
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [sp]
	movs r1, 0x1
	mov r8, r1
	str r1, [sp, 0x4]
	movs r6, 0
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	str r1, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x2
	mov r2, r9
	movs r3, 0
	bl sub_810B8F0
	movs r0, 0
	movs r1, 0
	bl sub_810B9DC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r1, _081097E0 @ =gText_TimesStrVar1
	mov r0, r9
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	str r0, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0
	mov r2, r9
	movs r3, 0x4
	bl sub_810B8F0
	bl sub_8108940
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081097D4: .4byte gUnknown_203ACFC
_081097D8: .4byte gStringVar1
_081097DC: .4byte gStringVar4
_081097E0: .4byte gText_TimesStrVar1
	thumb_func_end sub_810971C

	thumb_func_start sub_81097E4
sub_81097E4: @ 81097E4
	push {r4-r6,lr}
	sub sp, 0x14
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0
	bl sub_810BAD8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r6, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, _08109848 @ =gStringVar1
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	movs r2, 0x2
	adds r3, r5, 0
	bl ConvertIntToDecimalStringN
	ldr r4, _0810984C @ =gStringVar4
	ldr r1, _08109850 @ =gText_TimesStrVar1
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
	adds r0, r6, 0
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x4
	bl sub_810B8F0
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109848: .4byte gStringVar1
_0810984C: .4byte gStringVar4
_08109850: .4byte gText_TimesStrVar1
	thumb_func_end sub_81097E4

	thumb_func_start sub_8109854
sub_8109854: @ 8109854
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xC
	subs r2, r0
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	ldr r2, _0810988C @ =gUnknown_8452D08
	adds r1, r2
	movs r3, 0xD
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x12
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r2, 0xB
	bl CopyToBgTilemapBufferRect
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0810988C: .4byte gUnknown_8452D08
	thumb_func_end sub_8109854

	thumb_func_start sub_8109890
sub_8109890: @ 8109890
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r0, _081098A8 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x4]
	cmp r0, 0x6
	beq _08109924
	cmp r0, 0x6
	bgt _081098AC
	cmp r0, 0x5
	beq _081098B6
	b _0810993C
	.align 2, 0
_081098A8: .4byte gUnknown_203ACFC
_081098AC:
	cmp r0, 0x7
	beq _081098B6
	cmp r0, 0x8
	beq _08109924
	b _0810993C
_081098B6:
	ldr r2, _081098D4 @ =gSpecialVar_ItemId
	ldrh r1, [r2]
	ldr r0, _081098D8 @ =0x0000016d
	cmp r1, r0
	bne _081098E8
	ldr r1, _081098DC @ =gUnknown_203AD20
	movs r0, 0x8
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r0, _081098E0 @ =gUnknown_203AD24
	str r1, [r0]
	ldr r1, _081098E4 @ =gUnknown_203AD28
	movs r0, 0x2
	b _08109AD0
	.align 2, 0
_081098D4: .4byte gSpecialVar_ItemId
_081098D8: .4byte 0x0000016d
_081098DC: .4byte gUnknown_203AD20
_081098E0: .4byte gUnknown_203AD24
_081098E4: .4byte gUnknown_203AD28
_081098E8:
	ldrh r0, [r2]
	bl ItemId_GetBattleUsage
	lsls r0, 24
	cmp r0, 0
	beq _0810990C
	ldr r1, _08109900 @ =gUnknown_203AD24
	ldr r0, _08109904 @ =gUnknown_8452F30
	str r0, [r1]
	ldr r1, _08109908 @ =gUnknown_203AD28
	movs r0, 0x2
	b _08109AD0
	.align 2, 0
_08109900: .4byte gUnknown_203AD24
_08109904: .4byte gUnknown_8452F30
_08109908: .4byte gUnknown_203AD28
_0810990C:
	ldr r1, _08109918 @ =gUnknown_203AD24
	ldr r0, _0810991C @ =gUnknown_8452F32
	str r0, [r1]
	ldr r1, _08109920 @ =gUnknown_203AD28
	movs r0, 0x1
	b _08109AD0
	.align 2, 0
_08109918: .4byte gUnknown_203AD24
_0810991C: .4byte gUnknown_8452F32
_08109920: .4byte gUnknown_203AD28
_08109924:
	ldr r1, _08109930 @ =gUnknown_203AD24
	ldr r0, _08109934 @ =gUnknown_8452F30
	str r0, [r1]
	ldr r1, _08109938 @ =gUnknown_203AD28
	movs r0, 0x2
	b _08109AD0
	.align 2, 0
_08109930: .4byte gUnknown_203AD24
_08109934: .4byte gUnknown_8452F30
_08109938: .4byte gUnknown_203AD28
_0810993C:
	bl MenuHelpers_LinkSomething
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08109950
	bl InUnionRoom
	cmp r0, 0x1
	bne _081099C4
_08109950:
	ldr r1, _08109970 @ =gSpecialVar_ItemId
	ldr r2, _08109974 @ =0xfffffe94
	adds r0, r2, 0
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _08109984
	ldr r1, _08109978 @ =gUnknown_203AD24
	ldr r0, _0810997C @ =gUnknown_8452F2E
	str r0, [r1]
	ldr r1, _08109980 @ =gUnknown_203AD28
	movs r0, 0x2
	b _08109AD0
	.align 2, 0
_08109970: .4byte gSpecialVar_ItemId
_08109974: .4byte 0xfffffe94
_08109978: .4byte gUnknown_203AD24
_0810997C: .4byte gUnknown_8452F2E
_08109980: .4byte gUnknown_203AD28
_08109984:
	ldr r0, _08109998 @ =gUnknown_203ACFC
	ldrh r2, [r0, 0x6]
	adds r3, r0, 0
	cmp r2, 0x1
	bne _081099A0
	ldr r0, _0810999C @ =gUnknown_203AD28
	strb r2, [r0]
	adds r7, r0, 0
	b _081099A8
	.align 2, 0
_08109998: .4byte gUnknown_203ACFC
_0810999C: .4byte gUnknown_203AD28
_081099A0:
	ldr r1, _081099B8 @ =gUnknown_203AD28
	movs r0, 0x2
	strb r0, [r1]
	adds r7, r1, 0
_081099A8:
	ldr r0, _081099BC @ =gUnknown_203AD24
	ldrh r1, [r3, 0x6]
	lsls r1, 1
	ldr r2, _081099C0 @ =gUnknown_8452F28
	adds r1, r2
	str r1, [r0]
	b _08109AD4
	.align 2, 0
_081099B8: .4byte gUnknown_203AD28
_081099BC: .4byte gUnknown_203AD24
_081099C0: .4byte gUnknown_8452F28
_081099C4:
	ldr r5, _081099D8 @ =gUnknown_203ACFC
	ldrh r0, [r5, 0x6]
	cmp r0, 0x1
	beq _08109A34
	cmp r0, 0x1
	bgt _081099E0
	cmp r0, 0
	beq _081099EC
	ldr r7, _081099DC @ =gUnknown_203AD28
	b _08109AD4
	.align 2, 0
_081099D8: .4byte gUnknown_203ACFC
_081099DC: .4byte gUnknown_203AD28
_081099E0:
	cmp r0, 0x2
	beq _08109AC4
	ldr r7, _081099E8 @ =gUnknown_203AD28
	b _08109AD4
	.align 2, 0
_081099E8: .4byte gUnknown_203AD28
_081099EC:
	ldr r4, _08109A0C @ =gUnknown_203AD28
	movs r0, 0x4
	strb r0, [r4]
	ldr r0, _08109A10 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08109A1C
	ldr r1, _08109A14 @ =gUnknown_203AD24
	ldr r0, _08109A18 @ =gUnknown_8452F24
	str r0, [r1]
	adds r7, r4, 0
	b _08109AD4
	.align 2, 0
_08109A0C: .4byte gUnknown_203AD28
_08109A10: .4byte gSpecialVar_ItemId
_08109A14: .4byte gUnknown_203AD24
_08109A18: .4byte gUnknown_8452F24
_08109A1C:
	ldr r0, _08109A2C @ =gUnknown_203AD24
	ldrh r1, [r5, 0x6]
	lsls r1, 2
	ldr r2, _08109A30 @ =gUnknown_8452F18
	adds r1, r2
	str r1, [r0]
	adds r7, r4, 0
	b _08109AD4
	.align 2, 0
_08109A2C: .4byte gUnknown_203AD24
_08109A30: .4byte gUnknown_8452F18
_08109A34:
	ldr r0, _08109A5C @ =gUnknown_203AD24
	ldr r2, _08109A60 @ =gUnknown_203AD20
	str r2, [r0]
	ldr r3, _08109A64 @ =gUnknown_203AD28
	movs r0, 0x3
	strb r0, [r3]
	movs r0, 0x4
	strb r0, [r2, 0x2]
	ldr r0, _08109A68 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08109A6C @ =0x00000296
	adds r0, r1
	ldr r1, _08109A70 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	adds r7, r3, 0
	ldrh r3, [r1]
	cmp r0, r3
	bne _08109A74
	movs r0, 0xA
	b _08109A76
	.align 2, 0
_08109A5C: .4byte gUnknown_203AD24
_08109A60: .4byte gUnknown_203AD20
_08109A64: .4byte gUnknown_203AD28
_08109A68: .4byte gSaveBlock1Ptr
_08109A6C: .4byte 0x00000296
_08109A70: .4byte gSpecialVar_ItemId
_08109A74:
	movs r0, 0x2
_08109A76:
	strb r0, [r2, 0x1]
	ldrh r1, [r1]
	ldr r3, _08109A8C @ =0xfffffe94
	adds r0, r1, r3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _08109A90
	movs r0, 0x7
	strb r0, [r2]
	b _08109AD4
	.align 2, 0
_08109A8C: .4byte 0xfffffe94
_08109A90:
	lsls r1, 16
	movs r0, 0xB4
	lsls r0, 17
	cmp r1, r0
	bne _08109AB0
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08109AB0
	ldr r1, _08109AAC @ =gUnknown_203AD20
	movs r0, 0x9
	b _08109AB4
	.align 2, 0
_08109AAC: .4byte gUnknown_203AD20
_08109AB0:
	ldr r1, _08109ABC @ =gUnknown_203AD20
	movs r0, 0
_08109AB4:
	strb r0, [r1]
	ldr r7, _08109AC0 @ =gUnknown_203AD28
	b _08109AD4
	.align 2, 0
_08109ABC: .4byte gUnknown_203AD20
_08109AC0: .4byte gUnknown_203AD28
_08109AC4:
	ldr r1, _08109B98 @ =gUnknown_203AD24
	ldr r0, _08109B9C @ =gUnknown_8452F18
	adds r0, 0x8
	str r0, [r1]
	ldr r1, _08109BA0 @ =gUnknown_203AD28
	movs r0, 0x3
_08109AD0:
	strb r0, [r1]
	adds r7, r1, 0
_08109AD4:
	ldrb r1, [r7]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xA
	bl sub_810B9DC
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x2
	movs r1, 0x2
	bl GetFontAttribute
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0x8]
	ldr r0, _08109BA4 @ =gUnknown_8452EB8
	str r0, [sp, 0xC]
	ldr r0, _08109B98 @ =gUnknown_203AD24
	ldr r0, [r0]
	str r0, [sp, 0x10]
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0x2
	bl AddItemMenuActionTextPrinters
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldrb r0, [r7]
	str r0, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl Menu_InitCursor
	movs r0, 0x6
	movs r1, 0
	bl sub_810B9DC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08109BA8 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldr r1, _08109BAC @ =gStringVar1
	bl CopyItemName
	ldr r6, _08109BB0 @ =gStringVar4
	ldr r1, _08109BB4 @ =gOtherText_StrVar1
	adds r0, r6, 0
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	str r5, [sp, 0xC]
	str r0, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r6, 0
	movs r3, 0
	bl sub_810B8F0
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08109B98: .4byte gUnknown_203AD24
_08109B9C: .4byte gUnknown_8452F18
_08109BA0: .4byte gUnknown_203AD28
_08109BA4: .4byte gUnknown_8452EB8
_08109BA8: .4byte gSpecialVar_ItemId
_08109BAC: .4byte gStringVar1
_08109BB0: .4byte gStringVar4
_08109BB4: .4byte gOtherText_StrVar1
	thumb_func_end sub_8109890

	thumb_func_start sub_8109BB8
sub_8109BB8: @ 8109BB8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8109890
	ldr r1, _08109BDC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08109BE0 @ =sub_8109BE4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109BDC: .4byte gTasks
_08109BE0: .4byte sub_8109BE4
	thumb_func_end sub_8109BB8

	thumb_func_start sub_8109BE4
sub_8109BE4: @ 8109BE4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08109C42
	bl Menu_ProcessInputNoWrapAround
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _08109C42
	adds r0, 0x1
	cmp r4, r0
	bne _08109C24
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08109C20 @ =gUnknown_8452EB8
	ldr r1, [r0, 0x24]
	adds r0, r5, 0
	bl _call_via_r1
	b _08109C42
	.align 2, 0
_08109C20: .4byte gUnknown_8452EB8
_08109C24:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08109C48 @ =gUnknown_8452EB8
	ldr r0, _08109C4C @ =gUnknown_203AD24
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl _call_via_r1
_08109C42:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109C48: .4byte gUnknown_8452EB8
_08109C4C: .4byte gUnknown_203AD24
	thumb_func_end sub_8109BE4

	thumb_func_start sub_8109C50
sub_8109C50: @ 8109C50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _08109CA0 @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	bl ItemId_GetFieldFunc
	cmp r0, 0
	beq _08109CB4
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _08109CA4
	ldrh r0, [r5]
	bl ItemId_GetType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08109CA4
	adds r0, r4, 0
	bl sub_810A170
	b _08109CB4
	.align 2, 0
_08109CA0: .4byte gSpecialVar_ItemId
_08109CA4:
	ldr r0, _08109CBC @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl ItemId_GetFieldFunc
	adds r1, r0, 0
	adds r0, r4, 0
	bl _call_via_r1
_08109CB4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08109CBC: .4byte gSpecialVar_ItemId
	thumb_func_end sub_8109C50

	thumb_func_start sub_8109CC0
sub_8109CC0: @ 8109CC0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _08109D14 @ =gTasks+0x8
	adds r4, r6, r7
	movs r0, 0xA
	bl sub_810BAD8
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	movs r0, 0x6
	bl sub_810BAD8
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _08109D18
	adds r0, r5, 0
	bl sub_8109D38
	b _08109D2A
	.align 2, 0
_08109D14: .4byte gTasks+0x8
_08109D18:
	ldrh r0, [r4, 0x2]
	ldr r1, _08109D30 @ =gText_TossOutHowManyStrVar1s
	bl sub_810971C
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _08109D34 @ =sub_8109DEC
	str r1, [r0]
_08109D2A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08109D30: .4byte gText_TossOutHowManyStrVar1s
_08109D34: .4byte sub_8109DEC
	thumb_func_end sub_8109CC0

	thumb_func_start sub_8109D38
sub_8109D38: @ 8109D38
	push {r4,r5,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	ldr r0, _08109D9C @ =gTasks+0x8
	adds r1, r0
	ldr r0, _08109DA0 @ =gStringVar2
	movs r2, 0x10
	ldrsh r1, [r1, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r5, _08109DA4 @ =gStringVar4
	ldr r1, _08109DA8 @ =gText_ThrowAwayStrVar2OfThisItemQM
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x6
	movs r1, 0x1
	bl sub_810B9DC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	str r1, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0
	bl sub_810B8F0
	ldr r1, _08109DAC @ =gUnknown_8452F50
	adds r0, r4, 0
	bl sub_810BAE8
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08109D9C: .4byte gTasks+0x8
_08109DA0: .4byte gStringVar2
_08109DA4: .4byte gStringVar4
_08109DA8: .4byte gText_ThrowAwayStrVar2OfThisItemQM
_08109DAC: .4byte gUnknown_8452F50
	thumb_func_end sub_8109D38

	thumb_func_start sub_8109DB0
sub_8109DB0: @ 8109DB0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08109DE8 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	adds r0, r5, 0
	bl sub_810910C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08109DE8: .4byte gTasks+0x8
	thumb_func_end sub_8109DB0

	thumb_func_start sub_8109DEC
sub_8109DEC: @ 8109DEC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08109E1C @ =gTasks+0x8
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x10
	ldrh r1, [r4, 0x4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08109E20
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl sub_81097E4
	b _08109EA2
	.align 2, 0
_08109E1C: .4byte gTasks+0x8
_08109E20:
	ldr r0, _08109E60 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08109E64
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	bl sub_810BAD8
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_8108978
	adds r0, r5, 0
	bl sub_8109D38
	b _08109EA2
	.align 2, 0
_08109E60: .4byte gMain
_08109E64:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08109EA2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	bl sub_8108978
	adds r0, r6, 0
	bl sub_810910C
_08109EA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8109DEC

	thumb_func_start sub_8109EA8
sub_8109EA8: @ 8109EA8
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r5, _08109F28 @ =gTasks+0x8
	adds r6, r4, r5
	movs r0, 0x6
	bl sub_810BA3C
	ldr r0, _08109F2C @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08109F30 @ =gStringVar1
	bl CopyItemName
	ldr r0, _08109F34 @ =gStringVar2
	movs r2, 0x10
	ldrsh r1, [r6, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r6, _08109F38 @ =gStringVar4
	ldr r1, _08109F3C @ =gText_ThrewAwayStrVar2StrVar1s
	adds r0, r6, 0
	bl StringExpandPlaceholders
	movs r0, 0x6
	movs r1, 0x3
	bl sub_810B9DC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	str r1, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0x2
	adds r2, r6, 0
	movs r3, 0
	bl sub_810B8F0
	subs r5, 0x8
	adds r4, r5
	ldr r0, _08109F40 @ =sub_8109F44
	str r0, [r4]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109F28: .4byte gTasks+0x8
_08109F2C: .4byte gUnknown_203ACFC
_08109F30: .4byte gStringVar1
_08109F34: .4byte gStringVar2
_08109F38: .4byte gStringVar4
_08109F3C: .4byte gText_ThrewAwayStrVar2StrVar1s
_08109F40: .4byte sub_8109F44
	thumb_func_end sub_8109EA8

	thumb_func_start sub_8109F44
sub_8109F44: @ 8109F44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _08109FEC @ =gTasks+0x8
	adds r7, r0, r1
	ldr r0, _08109FF0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08109F6E
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08109FE0
_08109F6E:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08109FF4 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldrh r1, [r7, 0x10]
	bl RemoveBagItem
	movs r0, 0x6
	bl sub_810BA3C
	ldrb r0, [r7]
	ldr r4, _08109FF8 @ =gUnknown_203ACFC
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r4, 0
	adds r5, 0xE
	adds r1, r2, r5
	adds r6, r4, 0
	adds r6, 0x8
	adds r2, r6
	bl DestroyListMenuTask
	ldrb r0, [r4, 0x6]
	bl sub_8108DC8
	ldrb r0, [r4, 0x6]
	bl sub_81089F4
	ldrb r0, [r4, 0x6]
	bl sub_810842C
	ldr r0, _08109FFC @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r2, r5
	ldrh r1, [r5]
	adds r2, r6
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7]
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r7]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	mov r0, r8
	bl sub_810910C
_08109FE0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08109FEC: .4byte gTasks+0x8
_08109FF0: .4byte gMain
_08109FF4: .4byte gSpecialVar_ItemId
_08109FF8: .4byte gUnknown_203ACFC
_08109FFC: .4byte gMultiuseListMenuTemplate
	thumb_func_end sub_8109F44

	thumb_func_start sub_810A000
sub_810A000: @ 810A000
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _0810A040 @ =gTasks+0x8
	adds r7, r0, r1
	ldr r0, _0810A044 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r7, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _0810A048 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r3, _0810A04C @ =0x00000296
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, r2
	bne _0810A050
	movs r0, 0
	strh r0, [r1]
	b _0810A052
	.align 2, 0
_0810A040: .4byte gTasks+0x8
_0810A044: .4byte gUnknown_203ACFC
_0810A048: .4byte gSaveBlock1Ptr
_0810A04C: .4byte 0x00000296
_0810A050:
	strh r2, [r1]
_0810A052:
	ldrb r0, [r7]
	ldr r4, _0810A0A0 @ =gUnknown_203ACFC
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r4, 0
	adds r5, 0xE
	adds r1, r2, r5
	adds r6, r4, 0
	adds r6, 0x8
	adds r2, r6
	bl DestroyListMenuTask
	ldrb r0, [r4, 0x6]
	bl sub_810842C
	ldr r0, _0810A0A4 @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r2, r5
	ldrh r1, [r5]
	adds r2, r6
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7]
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	mov r0, r8
	bl sub_810A2DC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810A0A0: .4byte gUnknown_203ACFC
_0810A0A4: .4byte gMultiuseListMenuTemplate
	thumb_func_end sub_810A000

	thumb_func_start sub_810A0A8
sub_810A0A8: @ 810A0A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	ldr r0, _0810A110 @ =gTasks+0x8
	mov r8, r0
	adds r1, r6, r0
	ldr r0, _0810A114 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r1, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	adds r0, r5, 0
	bl itemid_80BF6D8_mail_related
	lsls r0, 24
	cmp r0, 0
	bne _0810A120
	ldr r2, _0810A118 @ =gUnknown_841630F
	ldr r3, _0810A11C @ =sub_810A1D0
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
	b _0810A166
	.align 2, 0
_0810A110: .4byte gTasks+0x8
_0810A114: .4byte gUnknown_203ACFC
_0810A118: .4byte gUnknown_841630F
_0810A11C: .4byte sub_810A1D0
_0810A120:
	adds r0, r5, 0
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _0810A160
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _0810A13E
	adds r0, r4, 0
	bl sub_810A170
	b _0810A166
_0810A13E:
	ldr r0, _0810A154 @ =gUnknown_203AD10
	ldr r1, [r0]
	ldr r0, _0810A158 @ =CB2_ChooseMonToGiveItem
	str r0, [r1]
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0810A15C @ =ItemMenu_StartFadeToExitCallback
	str r1, [r0]
	b _0810A166
	.align 2, 0
_0810A154: .4byte gUnknown_203AD10
_0810A158: .4byte CB2_ChooseMonToGiveItem
_0810A15C: .4byte ItemMenu_StartFadeToExitCallback
_0810A160:
	adds r0, r7, 0
	bl sub_810A18C
_0810A166:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810A0A8

	thumb_func_start sub_810A170
sub_810A170: @ 810A170
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810A184 @ =gText_ThereIsNoPokemon
	ldr r3, _0810A188 @ =sub_810A1D0
	movs r1, 0x2
	bl DisplayItemMessageInBag
	pop {r0}
	bx r0
	.align 2, 0
_0810A184: .4byte gText_ThereIsNoPokemon
_0810A188: .4byte sub_810A1D0
	thumb_func_end sub_810A170

	thumb_func_start sub_810A18C
sub_810A18C: @ 810A18C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810A1BC @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldr r1, _0810A1C0 @ =gStringVar1
	bl CopyItemName
	ldr r5, _0810A1C4 @ =gStringVar4
	ldr r1, _0810A1C8 @ =gText_ItemCantBeHeld
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r3, _0810A1CC @ =sub_810A1D0
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl DisplayItemMessageInBag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810A1BC: .4byte gSpecialVar_ItemId
_0810A1C0: .4byte gStringVar1
_0810A1C4: .4byte gStringVar4
_0810A1C8: .4byte gText_ItemCantBeHeld
_0810A1CC: .4byte sub_810A1D0
	thumb_func_end sub_810A18C

	thumb_func_start sub_810A1D0
sub_810A1D0: @ 810A1D0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810A1F4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810A1EE
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_810A1F8
_0810A1EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810A1F4: .4byte gMain
	thumb_func_end sub_810A1D0

	thumb_func_start sub_810A1F8
sub_810A1F8: @ 810A1F8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, r0, 2
	add r5, r8
	lsls r5, 3
	ldr r0, _0810A27C @ =gTasks+0x8
	adds r5, r0
	movs r0, 0x5
	bl sub_810BA9C
	ldrb r0, [r5]
	ldr r4, _0810A280 @ =gUnknown_203ACFC
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r6, r4, 0
	adds r6, 0xE
	adds r1, r2, r6
	movs r3, 0x8
	adds r3, r4
	mov r9, r3
	add r2, r9
	bl DestroyListMenuTask
	ldrb r0, [r4, 0x6]
	bl sub_8108DC8
	ldrb r0, [r4, 0x6]
	bl sub_81089F4
	ldrb r0, [r4, 0x6]
	bl sub_810842C
	ldr r0, _0810A284 @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r6, r2, r6
	ldrh r1, [r6]
	add r2, r9
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r5]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	mov r0, r8
	bl sub_810910C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A27C: .4byte gTasks+0x8
_0810A280: .4byte gUnknown_203ACFC
_0810A284: .4byte gMultiuseListMenuTemplate
	thumb_func_end sub_810A1F8

	thumb_func_start sub_810A288
sub_810A288: @ 810A288
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0810A2D8 @ =gTasks+0x8
	adds r4, r0
	ldrb r0, [r4]
	mov r6, sp
	adds r6, 0x2
	mov r1, sp
	adds r2, r6, 0
	bl ListMenuGetScrollAndRow
	mov r0, sp
	ldrh r0, [r0]
	ldrh r1, [r6]
	adds r0, r1
	bl sub_8108818
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	adds r0, r5, 0
	bl sub_810910C
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A2D8: .4byte gTasks+0x8
	thumb_func_end sub_810A288

	thumb_func_start sub_810A2DC
sub_810A2DC: @ 810A2DC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldr r1, _0810A320 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	adds r0, r4, 0
	bl sub_810910C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810A320: .4byte gTasks
	thumb_func_end sub_810A2DC

	thumb_func_start sub_810A324
sub_810A324: @ 810A324
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0810A36C @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	bl ItemId_GetBattleFunc
	cmp r0, 0
	beq _0810A364
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	ldrh r0, [r5]
	bl ItemId_GetBattleFunc
	adds r1, r0, 0
	adds r0, r4, 0
	bl _call_via_r1
_0810A364:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810A36C: .4byte gSpecialVar_ItemId
	thumb_func_end sub_810A324

	thumb_func_start sub_810A370
sub_810A370: @ 810A370
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r7, r0, 3
	ldr r0, _0810A3BC @ =gTasks+0x8
	mov r9, r0
	adds r1, r7, r0
	ldr r2, _0810A3C0 @ =gUnknown_203ACFC
	mov r8, r2
	ldrb r0, [r2, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r1, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	adds r0, r4, 0
	bl itemid_80BF6D8_mail_related
	lsls r0, 24
	cmp r0, 0
	bne _0810A3CC
	ldr r2, _0810A3C4 @ =gUnknown_841630F
	ldr r3, _0810A3C8 @ =sub_810A1D0
	adds r0, r5, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
	b _0810A426
	.align 2, 0
_0810A3BC: .4byte gTasks+0x8
_0810A3C0: .4byte gUnknown_203ACFC
_0810A3C4: .4byte gUnknown_841630F
_0810A3C8: .4byte sub_810A1D0
_0810A3CC:
	movs r0, 0xB6
	lsls r0, 1 @ ITEM_TM_CASE
	cmp r4, r0
	bne _0810A3DC
	ldr r0, _0810A3D8 @ =sub_810A434
	b _0810A3E4
	.align 2, 0
_0810A3D8: .4byte sub_810A434
_0810A3DC:
	ldr r0, _0810A3F0 @ =ITEM_BERRY_POUCH
	cmp r4, r0
	bne _0810A3F8
	ldr r0, _0810A3F4 @ =sub_810A448
_0810A3E4:
	bl ItemMenu_SetExitCallback
	adds r0, r5, 0
	bl ItemMenu_StartFadeToExitCallback
	b _0810A426
	.align 2, 0
_0810A3F0: .4byte 0x0000016d @ ITEM_BERRY_POUCH
_0810A3F4: .4byte sub_810A448
_0810A3F8:
	mov r1, r8
	ldrh r0, [r1, 0x6]
	cmp r0, 0x1
	beq _0810A420
	adds r0, r6, 0
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _0810A420
	bl sub_8108CB4
	mov r0, r9
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0810A41C @ =ItemMenu_StartFadeToExitCallback
	str r1, [r0]
	b _0810A426
	.align 2, 0
_0810A41C: .4byte ItemMenu_StartFadeToExitCallback
_0810A420:
	adds r0, r5, 0
	bl sub_810A18C
_0810A426:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810A370

	thumb_func_start sub_810A434
sub_810A434: @ 810A434
	push {lr}
	ldr r1, _0810A444 @ =sub_810A45C
	movs r0, 0x1
	movs r2, 0
	bl InitTMCase
	pop {r0}
	bx r0
	.align 2, 0
_0810A444: .4byte sub_810A45C
	thumb_func_end sub_810A434

	thumb_func_start sub_810A448
sub_810A448: @ 810A448
	push {lr}
	ldr r1, _0810A458 @ =sub_810A45C
	movs r0, 0x1
	movs r2, 0
	bl InitBerryPouch
	pop {r0}
	bx r0
	.align 2, 0
_0810A458: .4byte sub_810A45C
	thumb_func_end sub_810A448

	thumb_func_start sub_810A45C
sub_810A45C: @ 810A45C
	push {lr}
	bl CB2_SelectBagItemToGive
	pop {r0}
	bx r0
	thumb_func_end sub_810A45C

	thumb_func_start sub_810A468
sub_810A468: @ 810A468
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r7, r0, 3
	ldr r0, _0810A4B4 @ =gTasks+0x8
	mov r9, r0
	adds r1, r7, r0
	ldr r2, _0810A4B8 @ =gUnknown_203ACFC
	mov r8, r2
	ldrb r0, [r2, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r1, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	adds r0, r4, 0
	bl ItemIsMail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810A4C4
	ldr r2, _0810A4BC @ =gUnknown_841630F
	ldr r3, _0810A4C0 @ =sub_810A1D0
	adds r0, r5, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
	b _0810A51E
	.align 2, 0
_0810A4B4: .4byte gTasks+0x8
_0810A4B8: .4byte gUnknown_203ACFC
_0810A4BC: .4byte gUnknown_841630F
_0810A4C0: .4byte sub_810A1D0
_0810A4C4:
	movs r0, 0xB6
	lsls r0, 1 @ ITEM_TM_CASE
	cmp r4, r0
	bne _0810A4D4
	ldr r0, _0810A4D0 @ =sub_810A52C
	b _0810A4DC
	.align 2, 0
_0810A4D0: .4byte sub_810A52C
_0810A4D4:
	ldr r0, _0810A4E8 @ =0x0000016d @ ITEM_BERRY_POUCH
	cmp r4, r0
	bne _0810A4F0
	ldr r0, _0810A4EC @ =sub_810A540
_0810A4DC:
	bl ItemMenu_SetExitCallback
	adds r0, r5, 0
	bl ItemMenu_StartFadeToExitCallback
	b _0810A51E
	.align 2, 0
_0810A4E8: .4byte 0x0000016d
_0810A4EC: .4byte sub_810A540
_0810A4F0:
	mov r1, r8
	ldrh r0, [r1, 0x6]
	cmp r0, 0x1
	beq _0810A518
	adds r0, r6, 0
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _0810A518
	bl sub_8108CB4
	mov r0, r9
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0810A514 @ =ItemMenu_StartFadeToExitCallback
	str r1, [r0]
	b _0810A51E
	.align 2, 0
_0810A514: .4byte ItemMenu_StartFadeToExitCallback
_0810A518:
	adds r0, r5, 0
	bl sub_810A18C
_0810A51E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810A468

	thumb_func_start sub_810A52C
sub_810A52C: @ 810A52C
	push {lr}
	ldr r1, _0810A53C @ =sub_810A554
	movs r0, 0x3
	movs r2, 0
	bl InitTMCase
	pop {r0}
	bx r0
	.align 2, 0
_0810A53C: .4byte sub_810A554
	thumb_func_end sub_810A52C

	thumb_func_start sub_810A540
sub_810A540: @ 810A540
	push {lr}
	ldr r1, _0810A550 @ =sub_810A554
	movs r0, 0x3
	movs r2, 0
	bl InitBerryPouch
	pop {r0}
	bx r0
	.align 2, 0
_0810A550: .4byte sub_810A554
	thumb_func_end sub_810A540

	thumb_func_start sub_810A554
sub_810A554: @ 810A554
	push {lr}
	ldr r2, _0810A564 @ =sub_808CE60
	movs r0, 0x4
	movs r1, 0x3
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_0810A564: .4byte sub_808CE60
	thumb_func_end sub_810A554

	thumb_func_start sub_810A568
sub_810A568: @ 810A568
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810A58C @ =gTasks+0x8
	adds r4, r0, r1
	ldr r6, _0810A590 @ =gSpecialVar_ItemId
	ldrh r1, [r6]
	movs r0, 0xB6
	lsls r0, 1
	cmp r1, r0
	bne _0810A598
	ldr r0, _0810A594 @ =sub_810A654
	b _0810A5A0
	.align 2, 0
_0810A58C: .4byte gTasks+0x8
_0810A590: .4byte gSpecialVar_ItemId
_0810A594: .4byte sub_810A654
_0810A598:
	ldr r0, _0810A5AC @ =0x0000016d
	cmp r1, r0
	bne _0810A5B4
	ldr r0, _0810A5B0 @ =sub_810A668
_0810A5A0:
	bl ItemMenu_SetExitCallback
	adds r0, r5, 0
	bl ItemMenu_StartFadeToExitCallback
	b _0810A63E
	.align 2, 0
_0810A5AC: .4byte 0x0000016d
_0810A5B0: .4byte sub_810A668
_0810A5B4:
	ldrh r0, [r6]
	bl itemid_get_market_price
	lsls r0, 16
	cmp r0, 0
	bne _0810A5F8
	ldrh r0, [r6]
	ldr r1, _0810A5E8 @ =gStringVar1
	bl CopyItemName
	ldr r4, _0810A5EC @ =gStringVar4
	ldr r1, _0810A5F0 @ =gText_OhNoICantBuyThat
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0810A5F4 @ =sub_810A1F8
	adds r0, r5, 0
	adds r2, r4, 0
	bl DisplayItemMessageInBag
	b _0810A63E
	.align 2, 0
_0810A5E8: .4byte gStringVar1
_0810A5EC: .4byte gStringVar4
_0810A5F0: .4byte gText_OhNoICantBuyThat
_0810A5F4: .4byte sub_810A1F8
_0810A5F8:
	movs r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _0810A610
	bl sub_810BB40
	adds r0, r5, 0
	bl sub_810A690
	b _0810A63E
_0810A610:
	cmp r0, 0x63
	ble _0810A618
	movs r0, 0x63
	strh r0, [r4, 0x4]
_0810A618:
	ldrh r0, [r6]
	ldr r1, _0810A644 @ =gStringVar1
	bl CopyItemName
	ldr r4, _0810A648 @ =gStringVar4
	ldr r1, _0810A64C @ =gText_HowManyWouldYouLikeToSell
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0810A650 @ =sub_810A770
	adds r0, r7, 0
	adds r2, r4, 0
	bl DisplayItemMessageInBag
_0810A63E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810A644: .4byte gStringVar1
_0810A648: .4byte gStringVar4
_0810A64C: .4byte gText_HowManyWouldYouLikeToSell
_0810A650: .4byte sub_810A770
	thumb_func_end sub_810A568

	thumb_func_start sub_810A654
sub_810A654: @ 810A654
	push {lr}
	ldr r1, _0810A664 @ =sub_810A67C
	movs r0, 0x2
	movs r2, 0
	bl InitTMCase
	pop {r0}
	bx r0
	.align 2, 0
_0810A664: .4byte sub_810A67C
	thumb_func_end sub_810A654

	thumb_func_start sub_810A668
sub_810A668: @ 810A668
	push {lr}
	ldr r1, _0810A678 @ =sub_810A67C
	movs r0, 0x2
	movs r2, 0
	bl InitBerryPouch
	pop {r0}
	bx r0
	.align 2, 0
_0810A678: .4byte sub_810A67C
	thumb_func_end sub_810A668

	thumb_func_start sub_810A67C
sub_810A67C: @ 810A67C
	push {lr}
	ldr r2, _0810A68C @ =CB2_ReturnToField
	movs r0, 0x2
	movs r1, 0x3
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_0810A68C: .4byte CB2_ReturnToField
	thumb_func_end sub_810A67C

	thumb_func_start sub_810A690
sub_810A690: @ 810A690
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0810A6F4 @ =gTasks+0x8
	adds r4, r0
	ldr r6, _0810A6F8 @ =gStringVar3
	ldr r0, _0810A6FC @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	muls r1, r0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _0810A700 @ =gStringVar4
	ldr r1, _0810A704 @ =gText_ICanPayThisMuch_WouldThatBeOkay
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0810A708 @ =sub_810A70C
	adds r0, r5, 0
	adds r2, r4, 0
	bl DisplayItemMessageInBag
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A6F4: .4byte gTasks+0x8
_0810A6F8: .4byte gStringVar3
_0810A6FC: .4byte gUnknown_203ACFC
_0810A700: .4byte gStringVar4
_0810A704: .4byte gText_ICanPayThisMuch_WouldThatBeOkay
_0810A708: .4byte sub_810A70C
	thumb_func_end sub_810A690

	thumb_func_start sub_810A70C
sub_810A70C: @ 810A70C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810A71C @ =gUnknown_8452F58
	bl sub_810BB14
	pop {r0}
	bx r0
	.align 2, 0
_0810A71C: .4byte gUnknown_8452F58
	thumb_func_end sub_810A70C

	thumb_func_start sub_810A720
sub_810A720: @ 810A720
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0810A76C @ =gTasks+0x8
	adds r4, r0
	movs r0, 0x2
	bl sub_810BA3C
	movs r0, 0x5
	bl sub_810BA9C
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	adds r0, r5, 0
	bl sub_810910C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810A76C: .4byte gTasks+0x8
	thumb_func_end sub_810A720

	thumb_func_start sub_810A770
sub_810A770: @ 810A770
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r5, r0, 2
	adds r5, r0
	lsls r5, 3
	ldr r0, _0810A81C @ =gTasks+0x8
	mov r8, r0
	adds r2, r5, 0
	add r2, r8
	mov r9, r2
	movs r0, 0
	movs r1, 0x1
	bl sub_810B9DC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810A820 @ =gStringVar1
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r6, _0810A824 @ =gStringVar4
	ldr r1, _0810A828 @ =gText_TimesStrVar1
	adds r0, r6, 0
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0
	adds r2, r6, 0
	movs r3, 0x4
	bl sub_810B8F0
	ldr r0, _0810A82C @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r3, r9
	ldrh r1, [r3, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r2, r9
	movs r3, 0x10
	ldrsh r1, [r2, r3]
	muls r0, r1
	bl sub_810A834
	bl sub_810BB40
	bl sub_8108908
	movs r0, 0x8
	negs r0, r0
	add r8, r0
	add r5, r8
	ldr r0, _0810A830 @ =sub_810A85C
	str r0, [r5]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A81C: .4byte gTasks+0x8
_0810A820: .4byte gStringVar1
_0810A824: .4byte gStringVar4
_0810A828: .4byte gText_TimesStrVar1
_0810A82C: .4byte gUnknown_203ACFC
_0810A830: .4byte sub_810A85C
	thumb_func_end sub_810A770

	thumb_func_start sub_810A834
sub_810A834: @ 810A834
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0
	bl sub_810BAD8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	str r1, [sp]
	movs r1, 0x38
	movs r2, 0xA
	adds r3, r4, 0
	bl PrintMoneyAmount
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810A834

	thumb_func_start sub_810A85C
sub_810A85C: @ 810A85C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0810A8B4 @ =gTasks+0x8
	adds r5, r0, r1
	adds r0, r5, 0
	adds r0, 0x10
	ldrh r1, [r5, 0x4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810A8BC
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r1, 0x2
	bl sub_81097E4
	ldr r0, _0810A8B8 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	muls r0, r1
	bl sub_810A834
	b _0810A93A
	.align 2, 0
_0810A8B4: .4byte gTasks+0x8
_0810A8B8: .4byte gUnknown_203ACFC
_0810A8BC:
	ldr r0, _0810A8EC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810A8F0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_8108978
	adds r0, r4, 0
	bl sub_810A690
	b _0810A93A
	.align 2, 0
_0810A8EC: .4byte gMain
_0810A8F0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810A93A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0x2
	bl sub_810BA3C
	movs r0, 0x5
	bl sub_810BA9C
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_8108978
	ldrb r0, [r5]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	adds r0, r6, 0
	bl sub_810910C
_0810A93A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810A85C

	thumb_func_start sub_810A940
sub_810A940: @ 810A940
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0810A9B4 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _0810A9B8 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldr r1, _0810A9BC @ =gStringVar1
	bl CopyItemName
	ldr r6, _0810A9C0 @ =gStringVar3
	ldr r0, _0810A9C4 @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x6]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	bl BagGetItemIdByPocketPosition
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	muls r1, r0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _0810A9C8 @ =gStringVar4
	ldr r1, _0810A9CC @ =gText_TurnedOverItemsWorthYen
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r3, _0810A9D0 @ =sub_810A9D4
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl DisplayItemMessageInBag
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A9B4: .4byte gTasks+0x8
_0810A9B8: .4byte gSpecialVar_ItemId
_0810A9BC: .4byte gStringVar1
_0810A9C0: .4byte gStringVar3
_0810A9C4: .4byte gUnknown_203ACFC
_0810A9C8: .4byte gStringVar4
_0810A9CC: .4byte gText_TurnedOverItemsWorthYen
_0810A9D0: .4byte sub_810A9D4
	thumb_func_end sub_810A940

	thumb_func_start sub_810A9D4
sub_810A9D4: @ 810A9D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r6, r0, 2
	adds r6, r0
	lsls r6, 3
	ldr r0, _0810AAD8 @ =gTasks+0x8
	mov r10, r0
	adds r1, r6, 0
	add r1, r10
	mov r8, r1
	movs r0, 0xF8
	bl PlaySE
	ldr r5, _0810AADC @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	bl RemoveBagItem
	ldr r3, _0810AAE0 @ =gSaveBlock1Ptr
	ldr r4, [r3]
	movs r7, 0xA4
	lsls r7, 2
	adds r4, r7
	ldrh r0, [r5]
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r2, r8
	movs r3, 0x10
	ldrsh r1, [r2, r3]
	muls r1, r0
	adds r0, r4, 0
	bl AddMoney
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	movs r2, 0x2
	bl sub_809C09C
	mov r3, r8
	ldrb r0, [r3]
	ldr r4, _0810AAE4 @ =gUnknown_203ACFC
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r4, 0
	adds r5, 0xE
	adds r1, r2, r5
	movs r3, 0x8
	adds r3, r4
	mov r9, r3
	add r2, r9
	bl DestroyListMenuTask
	ldrb r0, [r4, 0x6]
	bl sub_8108DC8
	ldrb r0, [r4, 0x6]
	bl sub_81089F4
	ldr r0, _0810AAE8 @ =gUnknown_203AD10
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldrb r0, [r4, 0x6]
	bl sub_810842C
	ldr r0, _0810AAEC @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r2, r5
	ldrh r1, [r5]
	add r2, r9
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x2
	bl sub_810BAD8
	lsls r0, 24
	lsrs r0, 24
	bl sub_810BB74
	movs r0, 0x2
	bl sub_810BAD8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _0810AAE0 @ =gSaveBlock1Ptr
	ldr r0, [r2]
	adds r0, r7
	bl GetMoney
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	bl PrintMoneyAmountInMoneyBox
	movs r3, 0x8
	negs r3, r3
	add r10, r3
	add r6, r10
	ldr r0, _0810AAF0 @ =sub_810AAF4
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AAD8: .4byte gTasks+0x8
_0810AADC: .4byte gSpecialVar_ItemId
_0810AAE0: .4byte gSaveBlock1Ptr
_0810AAE4: .4byte gUnknown_203ACFC
_0810AAE8: .4byte gUnknown_203AD10
_0810AAEC: .4byte gMultiuseListMenuTemplate
_0810AAF0: .4byte sub_810AAF4
	thumb_func_end sub_810A9D4

	thumb_func_start sub_810AAF4
sub_810AAF4: @ 810AAF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810AB38 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810AB0E
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810AB32
_0810AB0E:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	bl sub_810BA3C
	movs r0, 0x2
	bl PutWindowTilemap
	ldr r0, _0810AB3C @ =gUnknown_203AD10
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x5]
	adds r0, r4, 0
	bl sub_810A1F8
_0810AB32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810AB38: .4byte gMain
_0810AB3C: .4byte gUnknown_203AD10
	thumb_func_end sub_810AAF4

	thumb_func_start sub_810AB40
sub_810AB40: @ 810AB40
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r4, r0, 3
	ldr r5, _0810AB64 @ =gTasks+0x8
	adds r1, r4, r5
	movs r0, 0x1
	strh r0, [r1, 0x10]
	movs r3, 0x4
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	bne _0810AB68
	adds r0, r2, 0
	bl sub_810AC40
	b _0810AB7A
	.align 2, 0
_0810AB64: .4byte gTasks+0x8
_0810AB68:
	ldrh r0, [r1, 0x2]
	ldr r1, _0810AB80 @ =gUnknown_841638F
	bl sub_810971C
	adds r0, r5, 0
	subs r0, 0x8
	adds r0, r4, r0
	ldr r1, _0810AB84 @ =sub_810AB88
	str r1, [r0]
_0810AB7A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810AB80: .4byte gUnknown_841638F
_0810AB84: .4byte sub_810AB88
	thumb_func_end sub_810AB40

	thumb_func_start sub_810AB88
sub_810AB88: @ 810AB88
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810ABB8 @ =gTasks+0x8
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x10
	ldrh r1, [r4, 0x4]
	bl AdjustQuantityAccordingToDPadInput
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810ABBC
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl sub_81097E4
	b _0810AC38
	.align 2, 0
_0810ABB8: .4byte gTasks+0x8
_0810ABBC:
	ldr r0, _0810ABFC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810AC00
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	bl sub_810BAD8
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	bl sub_8108978
	adds r0, r5, 0
	bl sub_810AC40
	b _0810AC38
	.align 2, 0
_0810ABFC: .4byte gMain
_0810AC00:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810AC38
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl sub_810BA3C
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldrb r0, [r4]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	bl sub_8108978
	adds r0, r6, 0
	bl sub_810910C
_0810AC38:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810AB88

	thumb_func_start sub_810AC40
sub_810AC40: @ 810AC40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r8, r0
	ldr r0, _0810ACCC @ =gTasks+0x8
	mov r9, r0
	mov r7, r8
	add r7, r9
	ldr r5, _0810ACD0 @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	ldrh r1, [r7, 0x10]
	bl AddPCItem
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bne _0810ACEC
	ldrh r2, [r5]
	ldr r3, _0810ACD4 @ =0x0000ffff
	movs r0, 0x1C
	movs r1, 0
	bl ItemUse_SetQuestLogEvent
	ldrh r0, [r5]
	ldr r1, _0810ACD8 @ =gStringVar1
	bl CopyItemName
	ldr r0, _0810ACDC @ =gStringVar2
	movs r2, 0x10
	ldrsh r1, [r7, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _0810ACE0 @ =gStringVar4
	ldr r1, _0810ACE4 @ =gUnknown_84163A7
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0x6
	movs r1, 0x3
	bl sub_810B9DC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	str r1, [sp]
	str r6, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	str r1, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl sub_810B8F0
	mov r0, r9
	subs r0, 0x8
	add r0, r8
	ldr r1, _0810ACE8 @ =sub_8109F44
	str r1, [r0]
	b _0810ACF8
	.align 2, 0
_0810ACCC: .4byte gTasks+0x8
_0810ACD0: .4byte gSpecialVar_ItemId
_0810ACD4: .4byte 0x0000ffff
_0810ACD8: .4byte gStringVar1
_0810ACDC: .4byte gStringVar2
_0810ACE0: .4byte gStringVar4
_0810ACE4: .4byte gUnknown_84163A7
_0810ACE8: .4byte sub_8109F44
_0810ACEC:
	ldr r2, _0810AD08 @ =gUnknown_84163BB
	ldr r3, _0810AD0C @ =sub_810A1D0
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
_0810ACF8:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AD08: .4byte gUnknown_84163BB
_0810AD0C: .4byte sub_810A1D0
	thumb_func_end sub_810AC40

	thumb_func_start UseRegisteredKeyItemOnField
UseRegisteredKeyItemOnField: @ 810AD10
	push {r4-r6,lr}
	bl InUnionRoom
	cmp r0, 0x1
	bne _0810AD1E
	movs r0, 0
	b _0810ADA0
_0810AD1E:
	bl DismissMapNamePopup
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	ldr r4, _0810AD80 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	ldr r5, _0810AD84 @ =0x00000296
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, 0
	beq _0810AD98
	movs r1, 0x1
	bl CheckBagHasItem
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bne _0810AD90
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	bl sub_805C270
	bl sub_805C780
	ldr r2, _0810AD88 @ =gSpecialVar_ItemId
	ldr r0, [r4]
	adds r0, r5
	ldrh r1, [r0]
	strh r1, [r2]
	ldrh r0, [r0]
	bl ItemId_GetFieldFunc
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810AD8C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r6, [r1, 0xE]
	b _0810AD9E
	.align 2, 0
_0810AD80: .4byte gSaveBlock1Ptr
_0810AD84: .4byte 0x00000296
_0810AD88: .4byte gSpecialVar_ItemId
_0810AD8C: .4byte gTasks
_0810AD90:
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0
	strh r1, [r0]
_0810AD98:
	ldr r0, _0810ADA8 @ =gUnknown_81A77A0
	bl ScriptContext1_SetupScript
_0810AD9E:
	movs r0, 0x1
_0810ADA0:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0810ADA8: .4byte gUnknown_81A77A0
	thumb_func_end UseRegisteredKeyItemOnField

	thumb_func_start sub_810ADAC
sub_810ADAC: @ 810ADAC
	push {lr}
	ldr r0, _0810ADCC @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x4]
	cmp r0, 0x6
	beq _0810ADC6
	cmp r0, 0x8
	beq _0810ADC6
	cmp r0, 0x7
	beq _0810ADC6
	cmp r0, 0x9
	beq _0810ADC6
	cmp r0, 0xA
	bne _0810ADD0
_0810ADC6:
	movs r0, 0x1
	b _0810ADD2
	.align 2, 0
_0810ADCC: .4byte gUnknown_203ACFC
_0810ADD0:
	movs r0, 0
_0810ADD2:
	pop {r1}
	bx r1
	thumb_func_end sub_810ADAC

	thumb_func_start sub_810ADD8
sub_810ADD8: @ 810ADD8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _0810AEBC @ =gUnknown_203AD2C
	movs r0, 0xB2
	lsls r0, 1
	bl AllocZeroed
	str r0, [r5]
	ldr r4, _0810AEC0 @ =gSaveBlock1Ptr
	ldr r1, [r4]
	movs r2, 0xC4
	lsls r2, 2
	adds r1, r2
	movs r2, 0xA8
	bl memcpy
	ldr r0, [r5]
	adds r0, 0xA8
	ldr r1, [r4]
	movs r3, 0xEE
	lsls r3, 2
	adds r1, r3
	movs r2, 0x78
	bl memcpy
	ldr r0, [r5]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	ldr r1, [r4]
	movs r2, 0x86
	lsls r2, 3
	adds r1, r2
	movs r2, 0x34
	bl memcpy
	ldr r2, [r5]
	ldr r0, [r4]
	ldr r3, _0810AEC4 @ =0x00000296
	adds r0, r3
	ldrh r1, [r0]
	movs r3, 0xB0
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0810AEC8 @ =gUnknown_203ACFC
	ldrh r0, [r1, 0x6]
	adds r3, 0x2
	adds r2, r3
	strh r0, [r2]
	movs r4, 0
	mov r8, r5
	movs r7, 0xAA
	lsls r7, 1
	movs r0, 0xE
	adds r0, r1
	mov r12, r0
	movs r6, 0xAD
	lsls r6, 1
	adds r5, r1, 0
	adds r5, 0x8
_0810AE54:
	mov r1, r8
	ldr r2, [r1]
	lsls r3, r4, 1
	adds r0, r2, r7
	adds r0, r3
	ldrh r1, [r5]
	strh r1, [r0]
	adds r2, r6
	adds r2, r3
	mov r3, r12
	ldrh r0, [r3]
	strh r0, [r2]
	movs r0, 0x2
	add r12, r0
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	bls _0810AE54
	ldr r4, _0810AEC0 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	movs r1, 0xC4
	lsls r1, 2
	adds r0, r1
	movs r1, 0x2A
	bl ClearItemSlots
	ldr r0, [r4]
	movs r2, 0xEE
	lsls r2, 2
	adds r0, r2
	movs r1, 0x1E
	bl ClearItemSlots
	ldr r0, [r4]
	movs r3, 0x86
	lsls r3, 3
	adds r0, r3
	movs r1, 0xD
	bl ClearItemSlots
	ldr r0, [r4]
	ldr r1, _0810AEC4 @ =0x00000296
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bl sub_81089BC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AEBC: .4byte gUnknown_203AD2C
_0810AEC0: .4byte gSaveBlock1Ptr
_0810AEC4: .4byte 0x00000296
_0810AEC8: .4byte gUnknown_203ACFC
	thumb_func_end sub_810ADD8

	thumb_func_start sub_810AECC
sub_810AECC: @ 810AECC
	push {r4-r7,lr}
	ldr r4, _0810AF64 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	movs r1, 0xC4
	lsls r1, 2
	adds r0, r1
	ldr r5, _0810AF68 @ =gUnknown_203AD2C
	ldr r1, [r5]
	movs r2, 0xA8
	bl memcpy
	ldr r0, [r4]
	movs r2, 0xEE
	lsls r2, 2
	adds r0, r2
	ldr r1, [r5]
	adds r1, 0xA8
	movs r2, 0x78
	bl memcpy
	ldr r0, [r4]
	movs r3, 0x86
	lsls r3, 3
	adds r0, r3
	ldr r1, [r5]
	movs r2, 0x90
	lsls r2, 1
	adds r1, r2
	movs r2, 0x34
	bl memcpy
	ldr r1, [r4]
	ldr r2, [r5]
	movs r3, 0xB0
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	ldr r3, _0810AF6C @ =0x00000296
	adds r1, r3
	strh r0, [r1]
	ldr r1, _0810AF70 @ =gUnknown_203ACFC
	movs r3, 0xB1
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, 0x6]
	movs r4, 0
	mov r12, r5
	adds r3, r1, 0
	adds r3, 0x8
	mov r7, r12
	movs r6, 0xAA
	lsls r6, 1
	movs r5, 0xAD
	lsls r5, 1
_0810AF3A:
	lsls r2, r4, 1
	ldr r1, [r7]
	adds r0, r1, r6
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	adds r1, r5
	adds r1, r2
	ldrh r0, [r1]
	strh r0, [r3, 0x6]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	bls _0810AF3A
	mov r1, r12
	ldr r0, [r1]
	bl Free
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AF64: .4byte gSaveBlock1Ptr
_0810AF68: .4byte gUnknown_203AD2C
_0810AF6C: .4byte 0x00000296
_0810AF70: .4byte gUnknown_203ACFC
	thumb_func_end sub_810AECC

	thumb_func_start sub_810AF74
sub_810AF74: @ 810AF74
	push {lr}
	bl sub_810ADD8
	movs r0, 0xD
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0x4
	movs r1, 0x1
	bl AddBagItem
	ldr r2, _0810AF98 @ =SetCB2ToReshowScreenAfterMenu2
	movs r0, 0x6
	movs r1, 0
	bl GoToBagMenu
	pop {r0}
	bx r0
	.align 2, 0
_0810AF98: .4byte SetCB2ToReshowScreenAfterMenu2
	thumb_func_end sub_810AF74

	thumb_func_start sub_810AF9C
sub_810AF9C: @ 810AF9C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	ldr r7, _0810AFCC @ =gTasks+0x8
	adds r5, r6, r7
	ldr r0, _0810AFD0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810B06A
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	cmp r1, 0xCC
	beq _0810AFE4
	cmp r1, 0xCC
	bgt _0810AFD4
	cmp r1, 0x66
	beq _0810AFE4
	b _0810B064
	.align 2, 0
_0810AFCC: .4byte gTasks+0x8
_0810AFD0: .4byte gPaletteFade
_0810AFD4:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810AFF6
	adds r0, 0x66
	cmp r1, r0
	beq _0810B01C
	b _0810B064
_0810AFE4:
	movs r0, 0xF6
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_81091D0
	b _0810B064
_0810AFF6:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r5]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B018 @ =gSpecialVar_ItemId
	movs r0, 0x4
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8109890
	b _0810B064
	.align 2, 0
_0810B018: .4byte gSpecialVar_ItemId
_0810B01C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	bl sub_8108CB4
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0810B060 @ =sub_810B070
	str r1, [r0]
	b _0810B06A
	.align 2, 0
_0810B060: .4byte sub_810B070
_0810B064:
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
_0810B06A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810AF9C

	thumb_func_start sub_810B070
sub_810B070: @ 810B070
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810B0A4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810B0A8 @ =sub_810B0AC
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B0A4: .4byte gTasks
_0810B0A8: .4byte sub_810B0AC
	thumb_func_end sub_810B070

	thumb_func_start sub_810B0AC
sub_810B0AC: @ 810B0AC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810B0DC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810B0FE
	ldr r0, _0810B0E0 @ =sub_8108CFC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810B0FE
	ldr r0, _0810B0E4 @ =gUnknown_203AD10
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _0810B0E8
	bl SetMainCallback2
	b _0810B0F0
	.align 2, 0
_0810B0DC: .4byte gPaletteFade
_0810B0E0: .4byte sub_8108CFC
_0810B0E4: .4byte gUnknown_203AD10
_0810B0E8:
	ldr r0, _0810B104 @ =gUnknown_203ACFC
	ldr r0, [r0]
	bl SetMainCallback2
_0810B0F0:
	bl sub_8108978
	bl sub_8108B04
	adds r0, r4, 0
	bl DestroyTask
_0810B0FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B104: .4byte gUnknown_203ACFC
	thumb_func_end sub_810B0AC

	thumb_func_start sub_810B108
sub_810B108: @ 810B108
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_810ADD8
	movs r0, 0xD
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0xE
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0xB7
	lsls r0, 1
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0xB6
	lsls r0, 1
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0x4
	movs r1, 0x5
	bl AddBagItem
	movs r0, 0x3
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0x8
	movs r1, 0x1
	bl AddBagItem
	cmp r4, 0x7
	beq _0810B160
	cmp r4, 0x8
	beq _0810B16C
	ldr r2, _0810B15C @ =CB2_ReturnToTeachyTV
	adds r0, r4, 0
	b _0810B170
	.align 2, 0
_0810B15C: .4byte CB2_ReturnToTeachyTV
_0810B160:
	ldr r2, _0810B168 @ =SetCB2ToReshowScreenAfterMenu2
	movs r0, 0x7
	b _0810B170
	.align 2, 0
_0810B168: .4byte SetCB2ToReshowScreenAfterMenu2
_0810B16C:
	ldr r2, _0810B17C @ =SetCB2ToReshowScreenAfterMenu2
	movs r0, 0x8
_0810B170:
	movs r1, 0
	bl GoToBagMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B17C: .4byte SetCB2ToReshowScreenAfterMenu2
	thumb_func_end sub_810B108

	thumb_func_start sub_810B180
sub_810B180: @ 810B180
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810B198 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0810B19C
	movs r0, 0
	b _0810B1BC
	.align 2, 0
_0810B198: .4byte gMain
_0810B19C:
	bl sub_810AECC
	bl SetTeachyTvControllerModeToResume
	ldr r0, _0810B1C4 @ =gUnknown_203AD10
	ldr r1, [r0]
	ldr r0, _0810B1C8 @ =CB2_ReturnToTeachyTV
	str r0, [r1]
	ldr r1, _0810B1CC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810B1D0 @ =sub_810B070
	str r1, [r0]
	movs r0, 0x1
_0810B1BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810B1C4: .4byte gUnknown_203AD10
_0810B1C8: .4byte CB2_ReturnToTeachyTV
_0810B1CC: .4byte gTasks
_0810B1D0: .4byte sub_810B070
	thumb_func_end sub_810B180

	thumb_func_start sub_810B1D4
sub_810B1D4: @ 810B1D4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r5, r0, 3
	ldr r6, _0810B220 @ =gTasks+0x8
	adds r7, r5, r6
	ldr r0, _0810B224 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810B1F2
	b _0810B372
_0810B1F2:
	adds r0, r4, 0
	bl sub_810B180
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B202
	b _0810B372
_0810B202:
	movs r0, 0x10
	ldrsh r1, [r7, r0]
	movs r0, 0xCC
	lsls r0, 1
	cmp r1, r0
	beq _0810B29E
	cmp r1, r0
	bgt _0810B232
	cmp r1, 0xCC
	beq _0810B266
	cmp r1, 0xCC
	bgt _0810B228
	cmp r1, 0x66
	beq _0810B254
	b _0810B36C
	.align 2, 0
_0810B220: .4byte gTasks+0x8
_0810B224: .4byte gPaletteFade
_0810B228:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810B290
	b _0810B36C
_0810B232:
	movs r0, 0x99
	lsls r0, 2
	cmp r1, r0
	beq _0810B32C
	cmp r1, r0
	bgt _0810B246
	subs r0, 0x66
	cmp r1, r0
	beq _0810B32C
	b _0810B36C
_0810B246:
	ldr r0, _0810B250 @ =0x000002ca
	cmp r1, r0
	bne _0810B24E
	b _0810B344
_0810B24E:
	b _0810B36C
	.align 2, 0
_0810B250: .4byte 0x000002ca
_0810B254:
	movs r0, 0xF6
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_81091D0
	b _0810B36C
_0810B266:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r7]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B28C @ =gSpecialVar_ItemId
	movs r2, 0xB7
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8109890
	b _0810B36C
	.align 2, 0
_0810B28C: .4byte gSpecialVar_ItemId
_0810B290:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl Menu_MoveCursorNoWrapAround
	b _0810B36C
_0810B29E:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0810B318 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _0810B31C @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	ldr r2, _0810B320 @ =0x00000296
	adds r0, r2
	strh r1, [r0]
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r7]
	ldr r4, _0810B324 @ =gUnknown_203ACFC
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r4, 0
	adds r5, 0xE
	adds r1, r2, r5
	adds r6, r4, 0
	adds r6, 0x8
	adds r2, r6
	bl DestroyListMenuTask
	ldrb r0, [r4, 0x6]
	bl sub_810842C
	ldr r0, _0810B328 @ =gMultiuseListMenuTemplate
	ldrh r2, [r4, 0x6]
	lsls r2, 1
	adds r5, r2, r5
	ldrh r1, [r5]
	adds r2, r6
	ldrh r2, [r2]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7]
	movs r0, 0
	bl sub_8109140
	ldrb r0, [r7]
	movs r1, 0x1
	bl bag_menu_print_cursor_
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	b _0810B36C
	.align 2, 0
_0810B318: .4byte gSaveBlock1Ptr
_0810B31C: .4byte gSpecialVar_ItemId
_0810B320: .4byte 0x00000296
_0810B324: .4byte gUnknown_203ACFC
_0810B328: .4byte gMultiuseListMenuTemplate
_0810B32C:
	ldr r1, _0810B340 @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
	movs r0, 0x80
	strh r0, [r1, 0x30]
	ldrb r0, [r7]
	bl ListMenu_ProcessInput
	b _0810B36C
	.align 2, 0
_0810B340: .4byte gMain
_0810B344:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r7]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	bl sub_8108CB4
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _0810B368 @ =sub_810B070
	str r1, [r0]
	b _0810B372
	.align 2, 0
_0810B368: .4byte sub_810B070
_0810B36C:
	ldrh r0, [r7, 0x10]
	adds r0, 0x1
	strh r0, [r7, 0x10]
_0810B372:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810B1D4

	thumb_func_start sub_810B378
sub_810B378: @ 810B378
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0810B3B0 @ =gTasks+0x8
	adds r4, r6, r7
	ldr r0, _0810B3B4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810B396
	b _0810B4B6
_0810B396:
	adds r0, r5, 0
	bl sub_810B180
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B3B8
	bl FreeRestoreBattleData
	bl LoadPlayerParty
	b _0810B4B6
	.align 2, 0
_0810B3B0: .4byte gTasks+0x8
_0810B3B4: .4byte gPaletteFade
_0810B3B8:
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r0, 0xCC
	lsls r0, 1
	cmp r1, r0
	beq _0810B41A
	cmp r1, r0
	bgt _0810B3E0
	cmp r1, 0xCC
	beq _0810B408
	cmp r1, 0xCC
	bgt _0810B3D6
	cmp r1, 0x66
	beq _0810B408
	b _0810B4B0
_0810B3D6:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810B41A
	b _0810B4B0
_0810B3E0:
	movs r0, 0x99
	lsls r0, 2
	cmp r1, r0
	beq _0810B428
	cmp r1, r0
	bgt _0810B3F4
	subs r0, 0x66
	cmp r1, r0
	beq _0810B428
	b _0810B4B0
_0810B3F4:
	ldr r0, _0810B404 @ =0x000002ca
	cmp r1, r0
	beq _0810B440
	adds r0, 0x66
	cmp r1, r0
	beq _0810B468
	b _0810B4B0
	.align 2, 0
_0810B404: .4byte 0x000002ca
_0810B408:
	movs r0, 0xF6
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_81091D0
	b _0810B4B0
_0810B41A:
	ldr r1, _0810B424 @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
	movs r0, 0x80
	b _0810B430
	.align 2, 0
_0810B424: .4byte gMain
_0810B428:
	ldr r1, _0810B43C @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
	movs r0, 0x40
_0810B430:
	strh r0, [r1, 0x30]
	ldrb r0, [r4]
	bl ListMenu_ProcessInput
	b _0810B4B0
	.align 2, 0
_0810B43C: .4byte gMain
_0810B440:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B464 @ =gSpecialVar_ItemId
	movs r0, 0x4
	strh r0, [r1]
	adds r0, r5, 0
	bl sub_8109890
	b _0810B4B0
	.align 2, 0
_0810B464: .4byte gSpecialVar_ItemId
_0810B468:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	bl sub_8108CB4
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0810B4AC @ =sub_810B070
	str r1, [r0]
	b _0810B4B6
	.align 2, 0
_0810B4AC: .4byte sub_810B070
_0810B4B0:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
_0810B4B6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810B378

	thumb_func_start sub_810B4BC
sub_810B4BC: @ 810B4BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r8, r0
	ldr r0, _0810B504 @ =gTasks+0x8
	mov r9, r0
	mov r5, r8
	add r5, r9
	ldr r0, _0810B508 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r7, 0x80
	adds r0, r7, 0
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _0810B5C6
	adds r0, r4, 0
	bl sub_810B180
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B50C
	bl FreeRestoreBattleData
	bl LoadPlayerParty
	b _0810B5C6
	.align 2, 0
_0810B504: .4byte gTasks+0x8
_0810B508: .4byte gPaletteFade
_0810B50C:
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	cmp r1, 0xCC
	beq _0810B53C
	cmp r1, 0xCC
	bgt _0810B51E
	cmp r1, 0x66
	beq _0810B528
	b _0810B5C0
_0810B51E:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810B564
	b _0810B5C0
_0810B528:
	ldr r0, _0810B538 @ =gMain
	strh r6, [r0, 0x2E]
	strh r7, [r0, 0x30]
	ldrb r0, [r5]
	bl ListMenu_ProcessInput
	b _0810B5C0
	.align 2, 0
_0810B538: .4byte gMain
_0810B53C:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r5]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B560 @ =gSpecialVar_ItemId
	movs r0, 0xE
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8109890
	b _0810B5C0
	.align 2, 0
_0810B560: .4byte gSpecialVar_ItemId
_0810B564:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	ldr r1, _0810B5B0 @ =gItemUseCB
	ldr r0, _0810B5B4 @ =ItemUseCB_Medicine
	str r0, [r1]
	ldr r0, _0810B5B8 @ =ChooseMonForInBattleItem
	bl ItemMenu_SetExitCallback
	mov r0, r9
	subs r0, 0x8
	add r0, r8
	ldr r1, _0810B5BC @ =sub_810B070
	str r1, [r0]
	b _0810B5C6
	.align 2, 0
_0810B5B0: .4byte gItemUseCB
_0810B5B4: .4byte ItemUseCB_Medicine
_0810B5B8: .4byte ChooseMonForInBattleItem
_0810B5BC: .4byte sub_810B070
_0810B5C0:
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
_0810B5C6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810B4BC

	thumb_func_start sub_810B5D4
sub_810B5D4: @ 810B5D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r8, r0
	ldr r0, _0810B624 @ =gTasks+0x8
	mov r9, r0
	mov r6, r8
	add r6, r9
	ldr r0, _0810B628 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r7, 0x80
	adds r0, r7, 0
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0810B6E6
	adds r0, r4, 0
	bl sub_810B180
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810B6E6
	movs r2, 0x10
	ldrsh r1, [r6, r2]
	cmp r1, 0xCC
	beq _0810B64E
	cmp r1, 0xCC
	bgt _0810B62C
	cmp r1, 0x66
	beq _0810B63C
	b _0810B6E0
	.align 2, 0
_0810B624: .4byte gTasks+0x8
_0810B628: .4byte gPaletteFade
_0810B62C:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _0810B660
	adds r0, 0x66
	cmp r1, r0
	beq _0810B68C
	b _0810B6E0
_0810B63C:
	movs r0, 0xF6
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_81091D0
	b _0810B6E0
_0810B64E:
	ldr r0, _0810B65C @ =gMain
	strh r5, [r0, 0x2E]
	strh r7, [r0, 0x30]
	ldrb r0, [r6]
	bl ListMenu_ProcessInput
	b _0810B6E0
	.align 2, 0
_0810B65C: .4byte gMain
_0810B660:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r6]
	movs r1, 0x2
	bl bag_menu_print_cursor_
	movs r0, 0x1
	bl sub_8109140
	ldr r1, _0810B688 @ =gSpecialVar_ItemId
	movs r2, 0xB6
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8109890
	b _0810B6E0
	.align 2, 0
_0810B688: .4byte gSpecialVar_ItemId
_0810B68C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	bl sub_810BA3C
	movs r0, 0x6
	bl sub_810BA3C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r6]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	bl sub_810AECC
	ldr r0, _0810B6D4 @ =gUnknown_203AD10
	ldr r1, [r0]
	ldr r0, _0810B6D8 @ =PokeDude_InitTMCase
	str r0, [r1]
	mov r0, r9
	subs r0, 0x8
	add r0, r8
	ldr r1, _0810B6DC @ =sub_810B070
	str r1, [r0]
	b _0810B6E6
	.align 2, 0
_0810B6D4: .4byte gUnknown_203AD10
_0810B6D8: .4byte PokeDude_InitTMCase
_0810B6DC: .4byte sub_810B070
_0810B6E0:
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
_0810B6E6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810B5D4

	.align 2, 0 @ Don't pad with nop.
