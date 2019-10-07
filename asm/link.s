	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_800ACBC
sub_800ACBC: @ 800ACBC
	push {r4,lr}
	ldr r4, _0800ACD0 @ =sLinkErrorBuffer
	str r0, [r4]
	strb r1, [r4, 0x5]
	strb r2, [r4, 0x4]
	strb r3, [r4, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ACD0: .4byte sLinkErrorBuffer
	thumb_func_end sub_800ACBC

	thumb_func_start CB2_LinkError
CB2_LinkError: @ 800ACD4
	push {r4,lr}
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r0, _0800ADE0 @ =gMPlayInfo_SE1
	bl m4aMPlayStop
	ldr r0, _0800ADE4 @ =gMPlayInfo_SE2
	bl m4aMPlayStop
	ldr r0, _0800ADE8 @ =gMPlayInfo_SE3
	bl m4aMPlayStop
	ldr r0, _0800ADEC @ =gHeap
	movs r1, 0xE0
	lsls r1, 9
	bl InitHeap
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFadeControl
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl ResetTasks
	bl ScanlineEffect_Stop
	ldr r1, _0800ADF0 @ =gWirelessCommType
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800AD30
	ldr r0, _0800ADF4 @ =sLinkErrorBuffer
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _0800AD2C
	movs r0, 0x3
	strb r0, [r1]
_0800AD2C:
	bl sub_80F85F8
_0800AD30:
	ldr r0, _0800ADF8 @ =sub_800978C
	bl SetVBlankCallback
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0800ADFC @ =gUnknown_82345E8
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	ldr r4, _0800AE00 @ =gUnknown_2022860
	movs r0, 0x80
	lsls r0, 4
	bl Alloc
	adds r1, r0, 0
	str r1, [r4]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r0, _0800AE04 @ =gUnknown_82345F0
	bl InitWindows
	lsls r0, 16
	cmp r0, 0
	beq _0800ADD8
	bl DeactivateAllTextPrinters
	bl ResetTempTileDataBuffers
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x16
	movs r1, 0
	bl SetGpuReg
	movs r1, 0xE0
	lsls r1, 8
	movs r0, 0
	bl ClearGpuRegBits
	ldr r0, _0800AE08 @ =gTMCaseMainWindowPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0800AE0C @ =gSoftResetDisabled
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0800AE10 @ =Task_DestroySelf
	movs r1, 0
	bl CreateTask
	bl StopMapMusic
	ldr r1, _0800AE14 @ =gMain
	movs r0, 0
	str r0, [r1]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _0800AE18 @ =sub_800AF2C
	bl SetMainCallback2
_0800ADD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ADE0: .4byte gMPlayInfo_SE1
_0800ADE4: .4byte gMPlayInfo_SE2
_0800ADE8: .4byte gMPlayInfo_SE3
_0800ADEC: .4byte gHeap
_0800ADF0: .4byte gWirelessCommType
_0800ADF4: .4byte sLinkErrorBuffer
_0800ADF8: .4byte sub_800978C
_0800ADFC: .4byte gUnknown_82345E8
_0800AE00: .4byte gUnknown_2022860
_0800AE04: .4byte gUnknown_82345F0
_0800AE08: .4byte gTMCaseMainWindowPalette
_0800AE0C: .4byte gSoftResetDisabled
_0800AE10: .4byte Task_DestroySelf
_0800AE14: .4byte gMain
_0800AE18: .4byte sub_800AF2C
	thumb_func_end CB2_LinkError

	thumb_func_start sub_800AE1C
sub_800AE1C: @ 800AE1C
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r1, _0800AEB8 @ =gWirelessLinkDisplay4bpp
	movs r5, 0
	str r5, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _0800AEBC @ =gWirelessLinkDisplayBin
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, _0800AEC0 @ =gWirelessLinkDisplayPal
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, _0800AEC4 @ =gUnknown_8234610
	str r4, [sp]
	str r5, [sp, 0x4]
	ldr r0, _0800AEC8 @ =gUnknown_841DEF0
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x5
	bl AddTextPrinterParameterized3
	str r4, [sp]
	str r5, [sp, 0x4]
	ldr r0, _0800AECC @ =gUnknown_841DF05
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x2
	bl AddTextPrinterParameterized3
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800AEB8: .4byte gWirelessLinkDisplay4bpp
_0800AEBC: .4byte gWirelessLinkDisplayBin
_0800AEC0: .4byte gWirelessLinkDisplayPal
_0800AEC4: .4byte gUnknown_8234610
_0800AEC8: .4byte gUnknown_841DEF0
_0800AECC: .4byte gUnknown_841DF05
	thumb_func_end sub_800AE1C

	thumb_func_start sub_800AED0
sub_800AED0: @ 800AED0
	push {lr}
	sub sp, 0xC
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, _0800AF24 @ =gUnknown_8234610
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0800AF28 @ =gUnknown_841DE9D
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized3
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0
	bl ShowBg
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0800AF24: .4byte gUnknown_8234610
_0800AF28: .4byte gUnknown_841DE9D
	thumb_func_end sub_800AED0

	thumb_func_start sub_800AF2C
sub_800AF2C: @ 800AF2C
	push {r4,lr}
	sub sp, 0xC
	ldr r0, _0800AF4C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3C
	beq _0800AF72
	cmp r0, 0x3C
	bgt _0800AF50
	cmp r0, 0
	beq _0800AF5A
	cmp r0, 0x1E
	beq _0800AF72
	b _0800AFC4
	.align 2, 0
_0800AF4C: .4byte gMain
_0800AF50:
	cmp r0, 0x5A
	beq _0800AF72
	cmp r0, 0x82
	beq _0800AF7A
	b _0800AFC4
_0800AF5A:
	ldr r0, _0800AF68 @ =sLinkErrorBuffer
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	beq _0800AF6C
	bl sub_800AE1C
	b _0800AFC4
	.align 2, 0
_0800AF68: .4byte sLinkErrorBuffer
_0800AF6C:
	bl sub_800AED0
	b _0800AFC4
_0800AF72:
	movs r0, 0x16
	bl PlaySE
	b _0800AFC4
_0800AF7A:
	ldr r0, _0800AF9C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0800AFA8
	ldr r0, _0800AFA0 @ =gUnknown_8234610
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0800AFA4 @ =gUnknown_841DF6B
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x14
	bl AddTextPrinterParameterized3
	b _0800AFC4
	.align 2, 0
_0800AF9C: .4byte gWirelessCommType
_0800AFA0: .4byte gUnknown_8234610
_0800AFA4: .4byte gUnknown_841DF6B
_0800AFA8:
	cmp r0, 0x1
	bne _0800AFC4
	ldr r0, _0800AFFC @ =gUnknown_8234610
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0800B000 @ =gUnknown_841DF4C
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x14
	bl AddTextPrinterParameterized3
_0800AFC4:
	ldr r0, _0800B004 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r1, [r1]
	cmp r1, 0xA0
	bne _0800B03C
	ldr r4, _0800B008 @ =gWirelessCommType
	ldrb r2, [r4]
	cmp r2, 0x1
	bne _0800B010
	ldrh r0, [r0, 0x2E]
	ands r2, r0
	cmp r2, 0
	beq _0800B02E
	bl sub_812B484
	movs r0, 0x15
	bl PlaySE
	movs r0, 0
	strb r0, [r4]
	ldr r1, _0800B00C @ =sLinkErrorBuffer
	movs r0, 0
	strb r0, [r1, 0x6]
	bl sub_8079B7C
	b _0800B02E
	.align 2, 0
_0800AFFC: .4byte gUnknown_8234610
_0800B000: .4byte gUnknown_841DF4C
_0800B004: .4byte gMain
_0800B008: .4byte gWirelessCommType
_0800B00C: .4byte sLinkErrorBuffer
_0800B010:
	cmp r2, 0x2
	bne _0800B02E
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800B02E
	bl sub_812B484
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	bl DoSoftReset
_0800B02E:
	ldr r0, _0800B050 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r1, [r1]
	cmp r1, 0xA0
	beq _0800B048
_0800B03C:
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0800B048:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B050: .4byte gMain
	thumb_func_end sub_800AF2C

	thumb_func_start GetSioMultiSI
GetSioMultiSI: @ 800B054
	ldr r0, _0800B060 @ =0x04000128
	ldrh r0, [r0]
	lsrs r0, 2
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0800B060: .4byte 0x04000128
	thumb_func_end GetSioMultiSI

	thumb_func_start IsSioMultiMaster
IsSioMultiMaster: @ 800B064
	push {lr}
	movs r3, 0
	ldr r2, _0800B088 @ =0x04000128
	ldrh r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800B080
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0800B080
	movs r3, 0x1
_0800B080:
	adds r0, r3, 0
	pop {r1}
	bx r1
	.align 2, 0
_0800B088: .4byte 0x04000128
	thumb_func_end IsSioMultiMaster

	thumb_func_start IsLinkConnectionEstablished
IsLinkConnectionEstablished: @ 800B08C
	ldr r0, _0800B098 @ =gLinkStatus
	ldr r0, [r0]
	lsrs r0, 6
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0800B098: .4byte gLinkStatus
	thumb_func_end IsLinkConnectionEstablished

	thumb_func_start SetSuppressLinkErrorMessage
SetSuppressLinkErrorMessage: @ 800B09C
	ldr r1, _0800B0A4 @ =gSuppressLinkErrorMessage
	strb r0, [r1]
	bx lr
	.align 2, 0
_0800B0A4: .4byte gSuppressLinkErrorMessage
	thumb_func_end SetSuppressLinkErrorMessage

	thumb_func_start HasLinkErrorOccurred
HasLinkErrorOccurred: @ 800B0A8
	ldr r0, _0800B0B0 @ =gLinkErrorOccurred
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800B0B0: .4byte gLinkErrorOccurred
	thumb_func_end HasLinkErrorOccurred

	thumb_func_start sub_800B0B4
sub_800B0B4: @ 800B0B4
	push {r4-r6,lr}
	bl InitLocalLinkPlayer
	ldr r1, _0800B100 @ =gLocalLinkPlayerBlock
	adds r2, r1, 0
	adds r2, 0x10
	ldr r0, _0800B104 @ =gLocalLinkPlayer
	ldm r0!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r0!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldr r0, [r0]
	str r0, [r2]
	ldr r3, _0800B108 @ =gASCIIGameFreakInc
	adds r2, r1, 0
	adds r0, r3, 0
	ldm r0!, {r4-r6}
	stm r2!, {r4-r6}
	ldrh r4, [r0]
	strh r4, [r2]
	ldrb r0, [r0, 0x2]
	strb r0, [r2, 0x2]
	adds r0, r1, 0
	adds r0, 0x2C
	ldm r3!, {r2,r5,r6}
	stm r0!, {r2,r5,r6}
	ldrh r2, [r3]
	strh r2, [r0]
	ldrb r2, [r3, 0x2]
	strb r2, [r0, 0x2]
	ldr r0, _0800B10C @ =gBlockSendBuffer
	movs r2, 0x3C
	bl memcpy
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B100: .4byte gLocalLinkPlayerBlock
_0800B104: .4byte gLocalLinkPlayer
_0800B108: .4byte gASCIIGameFreakInc
_0800B10C: .4byte gBlockSendBuffer
	thumb_func_end sub_800B0B4

	thumb_func_start sub_800B110
sub_800B110: @ 800B110
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 8
	ldr r1, _0800B168 @ =gBlockRecvBuffer
	adds r4, r2, r1
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	ldr r0, _0800B16C @ =gLinkPlayers
	adds r2, r0
	adds r1, r2, 0
	adds r0, r4, 0
	adds r0, 0x10
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r2, 0
	bl sub_800B284
	ldr r5, _0800B170 @ =gASCIIGameFreakInc
	adds r0, r4, 0
	adds r1, r5, 0
	bl strcmp
	cmp r0, 0
	bne _0800B15A
	adds r0, r4, 0
	adds r0, 0x2C
	adds r1, r5, 0
	bl strcmp
	cmp r0, 0
	beq _0800B160
_0800B15A:
	ldr r0, _0800B174 @ =CB2_LinkError
	bl SetMainCallback2
_0800B160:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B168: .4byte gBlockRecvBuffer
_0800B16C: .4byte gLinkPlayers
_0800B170: .4byte gASCIIGameFreakInc
_0800B174: .4byte CB2_LinkError
	thumb_func_end sub_800B110

	thumb_func_start HandleLinkConnection
HandleLinkConnection: @ 800B178
	push {r4,r5,lr}
	ldr r0, _0800B1B0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800B1C8
	ldr r0, _0800B1B4 @ =gShouldAdvanceLinkState
	ldr r1, _0800B1B8 @ =gSendCmd
	ldr r2, _0800B1BC @ =gRecvCmds
	bl LinkMain1
	ldr r4, _0800B1C0 @ =gLinkStatus
	str r0, [r4]
	ldr r0, _0800B1C4 @ =gMain + 0x2C
	bl LinkMain2
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	beq _0800B1EC
	bl sub_8058318
	cmp r0, 0x1
	bne _0800B1EC
_0800B1AA:
	movs r0, 0x1
	b _0800B1EE
	.align 2, 0
_0800B1B0: .4byte gWirelessCommType
_0800B1B4: .4byte gShouldAdvanceLinkState
_0800B1B8: .4byte gSendCmd
_0800B1BC: .4byte gRecvCmds
_0800B1C0: .4byte gLinkStatus
_0800B1C4: .4byte gMain + 0x2C
_0800B1C8:
	bl sub_80FAE94
	adds r4, r0, 0
	bl sub_80FAEF0
	adds r5, r0, 0
	bl sub_8058318
	cmp r0, 0x1
	bne _0800B1EC
	cmp r4, 0x1
	beq _0800B1AA
	bl sub_80F90DC
	cmp r0, 0
	bne _0800B1AA
	cmp r5, 0
	bne _0800B1AA
_0800B1EC:
	movs r0, 0
_0800B1EE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end HandleLinkConnection

	thumb_func_start sub_800B1F4
sub_800B1F4: @ 800B1F4
	push {lr}
	ldr r0, _0800B208 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800B204
	ldr r1, _0800B20C @ =gWirelessCommType
	movs r0, 0x1
	strb r0, [r1]
_0800B204:
	pop {r0}
	bx r0
	.align 2, 0
_0800B208: .4byte gReceivedRemoteLinkPlayers
_0800B20C: .4byte gWirelessCommType
	thumb_func_end sub_800B1F4

	thumb_func_start sub_800B210
sub_800B210: @ 800B210
	push {lr}
	ldr r0, _0800B224 @ =gReceivedRemoteLinkPlayers
	ldrb r1, [r0]
	cmp r1, 0
	bne _0800B21E
	ldr r0, _0800B228 @ =gWirelessCommType
	strb r1, [r0]
_0800B21E:
	pop {r0}
	bx r0
	.align 2, 0
_0800B224: .4byte gReceivedRemoteLinkPlayers
_0800B228: .4byte gWirelessCommType
	thumb_func_end sub_800B210

	thumb_func_start sub_800B22C
sub_800B22C: @ 800B22C
	push {lr}
	ldr r0, _0800B240 @ =gReceivedRemoteLinkPlayers
	ldrb r1, [r0]
	cmp r1, 0
	bne _0800B23A
	ldr r0, _0800B244 @ =gWirelessCommType
	strb r1, [r0]
_0800B23A:
	pop {r0}
	bx r0
	.align 2, 0
_0800B240: .4byte gReceivedRemoteLinkPlayers
_0800B244: .4byte gWirelessCommType
	thumb_func_end sub_800B22C

	thumb_func_start sub_800B248
sub_800B248: @ 800B248
	push {lr}
	ldr r0, _0800B25C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800B268
	ldr r0, _0800B260 @ =gLink
	ldr r1, _0800B264 @ =0x00000fbd
	adds r0, r1
	ldrb r0, [r0]
	b _0800B26C
	.align 2, 0
_0800B25C: .4byte gWirelessCommType
_0800B260: .4byte gLink
_0800B264: .4byte 0x00000fbd
_0800B268:
	bl sub_80FC460
_0800B26C:
	pop {r1}
	bx r1
	thumb_func_end sub_800B248

	thumb_func_start sub_800B270
sub_800B270: @ 800B270
	push {lr}
	bl sub_800B248
	cmp r0, 0x2
	bhi _0800B27E
	movs r0, 0
	b _0800B280
_0800B27E:
	movs r0, 0x1
_0800B280:
	pop {r1}
	bx r1
	thumb_func_end sub_800B270

	thumb_func_start sub_800B284
sub_800B284: @ 800B284
	push {lr}
	ldrb r1, [r0, 0x10]
	strb r1, [r0, 0x12]
	adds r2, r0, 0
	adds r2, 0x8
	ldrb r1, [r0, 0x1A]
	adds r0, r2, 0
	bl ConvertInternationalString
	pop {r0}
	bx r0
	thumb_func_end sub_800B284

	thumb_func_start DisableSerial
DisableSerial: @ 800B29C
	push {lr}
	sub sp, 0x4
	movs r0, 0xC0
	bl DisableInterrupts
	ldr r1, _0800B2DC @ =0x04000128
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0800B2E0 @ =0x0400010e
	movs r2, 0
	strh r2, [r0]
	adds r1, 0xDA
	movs r0, 0xC0
	strh r0, [r1]
	ldr r0, _0800B2E4 @ =0x0400012a
	strh r2, [r0]
	ldr r2, _0800B2E8 @ =0x04000120
	movs r0, 0
	movs r1, 0
	str r0, [r2]
	str r1, [r2, 0x4]
	str r0, [sp]
	ldr r1, _0800B2EC @ =gLink
	ldr r2, _0800B2F0 @ =0x050003f0
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0800B2DC: .4byte 0x04000128
_0800B2E0: .4byte 0x0400010e
_0800B2E4: .4byte 0x0400012a
_0800B2E8: .4byte 0x04000120
_0800B2EC: .4byte gLink
_0800B2F0: .4byte 0x050003f0
	thumb_func_end DisableSerial

	thumb_func_start EnableSerial
EnableSerial: @ 800B2F4
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0xC0
	bl DisableInterrupts
	ldr r0, _0800B354 @ =0x04000134
	movs r4, 0
	strh r4, [r0]
	ldr r2, _0800B358 @ =0x04000128
	movs r1, 0x80
	lsls r1, 6
	adds r0, r1, 0
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r3, _0800B35C @ =0x00004003
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0x80
	bl EnableInterrupts
	ldr r0, _0800B360 @ =0x0400012a
	strh r4, [r0]
	movs r5, 0
	str r5, [sp]
	ldr r1, _0800B364 @ =gLink
	ldr r2, _0800B368 @ =0x050003f0
	mov r0, sp
	bl CpuSet
	ldr r0, _0800B36C @ =sNumVBlanksWithoutSerialIntr
	strb r4, [r0]
	ldr r0, _0800B370 @ =sSendNonzeroCheck
	strh r5, [r0]
	ldr r0, _0800B374 @ =sRecvNonzeroCheck
	strh r5, [r0]
	ldr r0, _0800B378 @ =sChecksumAvailable
	strb r4, [r0]
	ldr r0, _0800B37C @ =sHandshakePlayerCount
	strb r4, [r0]
	ldr r0, _0800B380 @ =gLastSendQueueCount
	strb r4, [r0]
	ldr r0, _0800B384 @ =gLastRecvQueueCount
	strb r4, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B354: .4byte 0x04000134
_0800B358: .4byte 0x04000128
_0800B35C: .4byte 0x00004003
_0800B360: .4byte 0x0400012a
_0800B364: .4byte gLink
_0800B368: .4byte 0x050003f0
_0800B36C: .4byte sNumVBlanksWithoutSerialIntr
_0800B370: .4byte sSendNonzeroCheck
_0800B374: .4byte sRecvNonzeroCheck
_0800B378: .4byte sChecksumAvailable
_0800B37C: .4byte sHandshakePlayerCount
_0800B380: .4byte gLastSendQueueCount
_0800B384: .4byte gLastRecvQueueCount
	thumb_func_end EnableSerial

	thumb_func_start ResetSerial
ResetSerial: @ 800B388
	push {lr}
	bl EnableSerial
	bl DisableSerial
	pop {r0}
	bx r0
	thumb_func_end ResetSerial

	thumb_func_start LinkMain1
LinkMain1: @ 800B398
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, _0800B3B4 @ =gLink
	ldrb r0, [r0, 0x1]
	cmp r0, 0x4
	bhi _0800B44A
	lsls r0, 2
	ldr r1, _0800B3B8 @ =_0800B3BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B3B4: .4byte gLink
_0800B3B8: .4byte _0800B3BC
	.align 2, 0
_0800B3BC:
	.4byte _0800B3D0
	.4byte _0800B3E0
	.4byte _0800B3F8
	.4byte _0800B434
	.4byte _0800B43E
_0800B3D0:
	bl DisableSerial
	ldr r1, _0800B3DC @ =gLink
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _0800B44A
	.align 2, 0
_0800B3DC: .4byte gLink
_0800B3E0:
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _0800B44A
	bl EnableSerial
	ldr r1, _0800B3F4 @ =gLink
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _0800B44A
	.align 2, 0
_0800B3F4: .4byte gLink
_0800B3F8:
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _0800B408
	cmp r1, 0x2
	beq _0800B420
	bl CheckMasterOrSlave
	b _0800B44A
_0800B408:
	ldr r2, _0800B41C @ =gLink
	ldrb r0, [r2]
	cmp r0, 0x8
	bne _0800B44A
	ldrb r0, [r2, 0x3]
	cmp r0, 0x1
	bls _0800B44A
	strb r1, [r2, 0xE]
	b _0800B44A
	.align 2, 0
_0800B41C: .4byte gLink
_0800B420:
	ldr r0, _0800B42C @ =gLink
	movs r1, 0
	strb r1, [r0, 0x1]
	ldr r0, _0800B430 @ =0x0400012a
	strh r1, [r0]
	b _0800B44A
	.align 2, 0
_0800B42C: .4byte gLink
_0800B430: .4byte 0x0400012a
_0800B434:
	bl InitTimer
	ldr r1, _0800B484 @ =gLink
	movs r0, 0x4
	strb r0, [r1, 0x1]
_0800B43E:
	adds r0, r5, 0
	bl sub_800B520
	adds r0, r6, 0
	bl sub_800B608
_0800B44A:
	movs r0, 0
	strb r0, [r4]
	ldr r1, _0800B484 @ =gLink
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 2
	orrs r2, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _0800B462
	movs r0, 0x20
	orrs r2, r0
_0800B462:
	ldrb r0, [r1, 0xC]
	lsls r3, r0, 8
	ldrb r0, [r1, 0xF]
	lsls r4, r0, 9
	ldrb r0, [r1, 0x10]
	lsls r5, r0, 12
	ldrb r0, [r1, 0x11]
	lsls r6, r0, 13
	ldrb r0, [r1, 0x12]
	lsls r7, r0, 14
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _0800B488
	movs r0, 0x40
	orrs r0, r3
	orrs r0, r2
	b _0800B48C
	.align 2, 0
_0800B484: .4byte gLink
_0800B488:
	adds r0, r2, 0
	orrs r0, r3
_0800B48C:
	orrs r0, r4
	orrs r0, r5
	orrs r0, r6
	orrs r0, r7
	adds r2, r0, 0
	ldrb r3, [r1, 0x13]
	cmp r3, 0x1
	bne _0800B4A2
	movs r0, 0x80
	lsls r0, 9
	orrs r2, r0
_0800B4A2:
	ldrb r0, [r1, 0x2]
	cmp r0, 0x3
	bls _0800B4AE
	movs r0, 0x80
	lsls r0, 10
	orrs r2, r0
_0800B4AE:
	adds r1, r2, 0
	cmp r3, 0x2
	bne _0800B4BA
	movs r0, 0x80
	lsls r0, 11
	orrs r1, r0
_0800B4BA:
	adds r0, r1, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end LinkMain1

	thumb_func_start CheckMasterOrSlave
CheckMasterOrSlave: @ 800B4C4
	push {lr}
	ldr r0, _0800B4E0 @ =0x04000128
	ldr r1, [r0]
	movs r0, 0xC
	ands r1, r0
	ldr r2, _0800B4E4 @ =gLink
	cmp r1, 0x8
	bne _0800B4E8
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _0800B4E8
	strb r1, [r2]
	b _0800B4EC
	.align 2, 0
_0800B4E0: .4byte 0x04000128
_0800B4E4: .4byte gLink
_0800B4E8:
	movs r0, 0
	strb r0, [r2]
_0800B4EC:
	pop {r0}
	bx r0
	thumb_func_end CheckMasterOrSlave

	thumb_func_start InitTimer
InitTimer: @ 800B4F0
	push {lr}
	ldr r0, _0800B514 @ =gLink
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800B50E
	ldr r1, _0800B518 @ =0x0400010c
	ldr r2, _0800B51C @ =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x41
	strh r0, [r1]
	movs r0, 0x40
	bl EnableInterrupts
_0800B50E:
	pop {r0}
	bx r0
	.align 2, 0
_0800B514: .4byte gLink
_0800B518: .4byte 0x0400010c
_0800B51C: .4byte 0x0000ff3b
	thumb_func_end InitTimer

	thumb_func_start sub_800B520
sub_800B520: @ 800B520
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	ldr r2, _0800B598 @ =gLinkSavedIme
	ldr r1, _0800B59C @ =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0800B5A0 @ =gLink
	ldr r4, _0800B5A4 @ =0x00000339
	adds r0, r1, r4
	ldrb r4, [r0]
	adds r6, r1, 0
	cmp r4, 0x31
	bhi _0800B5B0
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B55E
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_0800B55E:
	movs r2, 0
	ldr r4, _0800B5A8 @ =sSendNonzeroCheck
	mov r9, r4
	ldr r1, _0800B5AC @ =gLastSendQueueCount
	mov r10, r1
	lsls r5, r0, 1
	movs r0, 0x18
	adds r0, r6
	mov r8, r0
	mov r12, r2
	movs r7, 0x64
_0800B574:
	ldrh r0, [r4]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r4]
	adds r0, r2, 0
	muls r0, r7
	adds r0, r5, r0
	add r0, r8
	strh r1, [r0]
	mov r1, r12
	strh r1, [r3]
	adds r3, 0x2
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B574
	b _0800B5BC
	.align 2, 0
_0800B598: .4byte gLinkSavedIme
_0800B59C: .4byte 0x04000208
_0800B5A0: .4byte gLink
_0800B5A4: .4byte 0x00000339
_0800B5A8: .4byte sSendNonzeroCheck
_0800B5AC: .4byte gLastSendQueueCount
_0800B5B0:
	movs r0, 0x1
	strb r0, [r6, 0x12]
	ldr r2, _0800B5F4 @ =sSendNonzeroCheck
	mov r9, r2
	ldr r4, _0800B5F8 @ =gLastSendQueueCount
	mov r10, r4
_0800B5BC:
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	beq _0800B5D4
	ldr r2, _0800B5FC @ =0x00000339
	adds r0, r6, r2
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	mov r4, r9
	strh r2, [r4]
_0800B5D4:
	ldr r1, _0800B600 @ =0x04000208
	ldr r2, _0800B604 @ =gLinkSavedIme
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r4, _0800B5FC @ =0x00000339
	adds r0, r6, r4
	ldrb r0, [r0]
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
_0800B5F4: .4byte sSendNonzeroCheck
_0800B5F8: .4byte gLastSendQueueCount
_0800B5FC: .4byte 0x00000339
_0800B600: .4byte 0x04000208
_0800B604: .4byte gLinkSavedIme
	thumb_func_end sub_800B520

	thumb_func_start sub_800B608
sub_800B608: @ 800B608
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	ldr r2, _0800B664 @ =gLinkSavedIme
	ldr r1, _0800B668 @ =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0800B66C @ =gLink
	ldr r3, _0800B670 @ =0x00000fbd
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0
	bne _0800B674
	movs r3, 0
	ldrb r0, [r1, 0x3]
	cmp r3, r0
	bcs _0800B65A
	movs r5, 0
	adds r6, r0, 0
_0800B63A:
	movs r2, 0
	lsls r1, r3, 4
	adds r4, r3, 0x1
	add r1, r9
_0800B642:
	lsls r0, r2, 1
	adds r0, r1
	strh r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B642
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, r6
	bcc _0800B63A
_0800B65A:
	movs r0, 0x1
	mov r7, r12
	strb r0, [r7, 0xC]
	b _0800B6F0
	.align 2, 0
_0800B664: .4byte gLinkSavedIme
_0800B668: .4byte 0x04000208
_0800B66C: .4byte gLink
_0800B670: .4byte 0x00000fbd
_0800B674:
	movs r3, 0
	mov r0, r12
	ldrb r1, [r0, 0x3]
	cmp r3, r1
	bcs _0800B6CA
	ldr r0, _0800B708 @ =0x00000fbc
	add r0, r12
	ldrb r0, [r0]
	lsls r6, r0, 1
	movs r2, 0xCF
	lsls r2, 2
	add r2, r12
	mov r8, r2
	mov r10, r1
_0800B690:
	movs r2, 0
	lsls r1, r3, 4
	adds r4, r3, 0x1
	lsls r0, r3, 1
	mov r7, r9
	adds r5, r1, r7
	adds r0, r3
	lsls r0, 3
	adds r0, r3
	lsls r3, r0, 5
_0800B6A4:
	lsls r1, r2, 1
	adds r1, r5
	movs r7, 0x64
	adds r0, r2, 0
	muls r0, r7
	adds r0, r6, r0
	adds r0, r3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B6A4
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, r10
	bcc _0800B690
_0800B6CA:
	mov r2, r12
	ldr r0, _0800B70C @ =0x00000fbd
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, 0x1
	movs r3, 0
	strb r0, [r1]
	ldr r1, _0800B708 @ =0x00000fbc
	adds r2, r1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B6EC
	strb r3, [r2]
_0800B6EC:
	mov r2, r12
	strb r3, [r2, 0xC]
_0800B6F0:
	ldr r1, _0800B710 @ =0x04000208
	ldr r3, _0800B714 @ =gLinkSavedIme
	ldrh r0, [r3]
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B708: .4byte 0x00000fbc
_0800B70C: .4byte 0x00000fbd
_0800B710: .4byte 0x04000208
_0800B714: .4byte gLinkSavedIme
	thumb_func_end sub_800B608

	thumb_func_start LinkVSync
LinkVSync: @ 800B718
	push {r4,lr}
	ldr r3, _0800B740 @ =gLink
	ldrb r4, [r3]
	cmp r4, 0
	beq _0800B754
	ldrb r0, [r3, 0x1]
	cmp r0, 0x2
	beq _0800B74E
	cmp r0, 0x4
	bne _0800B77E
	movs r0, 0xD
	ldrsb r0, [r3, r0]
	cmp r0, 0x8
	bgt _0800B744
	ldrb r0, [r3, 0x10]
	cmp r0, 0x1
	beq _0800B74E
	movs r0, 0x1
	strb r0, [r3, 0x13]
	b _0800B77E
	.align 2, 0
_0800B740: .4byte gLink
_0800B744:
	ldrb r0, [r3, 0x13]
	cmp r0, 0x1
	beq _0800B77E
	movs r0, 0
	strb r0, [r3, 0xD]
_0800B74E:
	bl sub_800B820
	b _0800B77E
_0800B754:
	ldrb r2, [r3, 0x1]
	cmp r2, 0x4
	beq _0800B75E
	cmp r2, 0x2
	bne _0800B77E
_0800B75E:
	ldr r1, _0800B784 @ =sNumVBlanksWithoutSerialIntr
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _0800B77E
	cmp r2, 0x4
	bne _0800B776
	movs r0, 0x2
	strb r0, [r3, 0x13]
_0800B776:
	cmp r2, 0x2
	bne _0800B77E
	strb r4, [r3, 0x3]
	strb r4, [r3, 0xF]
_0800B77E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B784: .4byte sNumVBlanksWithoutSerialIntr
	thumb_func_end LinkVSync

	thumb_func_start Timer3Intr
Timer3Intr: @ 800B788
	push {lr}
	bl StopTimer
	bl sub_800B820
	pop {r0}
	bx r0
	thumb_func_end Timer3Intr

	thumb_func_start SerialCB
SerialCB: @ 800B798
	push {r4,lr}
	ldr r4, _0800B7C4 @ =gLink
	ldr r0, _0800B7C8 @ =0x04000128
	ldr r1, [r0]
	lsls r0, r1, 26
	lsrs r0, 30
	strb r0, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _0800B7CC
	cmp r0, 0x4
	bne _0800B7EA
	lsls r0, r1, 25
	lsrs r0, 31
	strb r0, [r4, 0x10]
	bl DoRecv
	bl DoSend
	bl SendRecvDone
	b _0800B7EA
	.align 2, 0
_0800B7C4: .4byte gLink
_0800B7C8: .4byte 0x04000128
_0800B7CC:
	bl DoHandshake
	lsls r0, 24
	cmp r0, 0
	beq _0800B7EA
	ldrb r0, [r4]
	cmp r0, 0
	beq _0800B7E6
	movs r0, 0x3
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0xD]
	b _0800B7EA
_0800B7E6:
	movs r0, 0x4
	strb r0, [r4, 0x1]
_0800B7EA:
	ldr r3, _0800B810 @ =gLink
	ldrb r0, [r3, 0xD]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r3, 0xD]
	ldr r1, _0800B814 @ =sNumVBlanksWithoutSerialIntr
	strb r2, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	bne _0800B80A
	ldr r0, _0800B818 @ =gLastRecvQueueCount
	ldr r2, _0800B81C @ =0x00000fbd
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
_0800B80A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B810: .4byte gLink
_0800B814: .4byte sNumVBlanksWithoutSerialIntr
_0800B818: .4byte gLastRecvQueueCount
_0800B81C: .4byte 0x00000fbd
	thumb_func_end SerialCB

	thumb_func_start sub_800B820
sub_800B820: @ 800B820
	ldr r0, _0800B82C @ =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0800B82C: .4byte 0x04000128
	thumb_func_end sub_800B820

	thumb_func_start DoHandshake
DoHandshake: @ 800B830
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r5, 0
	ldr r6, _0800B84C @ =0x0000ffff
	ldr r0, _0800B850 @ =gLink
	ldrb r1, [r0, 0xE]
	adds r7, r0, 0
	cmp r1, 0x1
	bne _0800B85C
	ldr r1, _0800B854 @ =0x0400012a
	ldr r2, _0800B858 @ =0x00008fff
	b _0800B860
	.align 2, 0
_0800B84C: .4byte 0x0000ffff
_0800B850: .4byte gLink
_0800B854: .4byte 0x0400012a
_0800B858: .4byte 0x00008fff
_0800B85C:
	ldr r1, _0800B8B4 @ =0x0400012a
	ldr r2, _0800B8B8 @ =0x0000b9a0
_0800B860:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _0800B8BC @ =gLink + 4
	ldr r3, _0800B8C0 @ =0x04000120
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0
	movs r1, 0
	str r0, [r3]
	str r1, [r3, 0x4]
	strb r0, [r2, 0xA]
	movs r4, 0
	ldr r0, _0800B8C4 @ =sHandshakePlayerCount
	mov r9, r0
	mov r8, r2
	ldr r2, _0800B8C8 @ =0x00008fff
	ldr r1, _0800B8CC @ =0x0000ffff
	mov r12, r1
_0800B888:
	lsls r0, r4, 1
	add r0, r8
	ldrh r3, [r0]
	movs r0, 0x4
	negs r0, r0
	ands r0, r3
	ldr r1, _0800B8B8 @ =0x0000b9a0
	cmp r0, r1
	beq _0800B8A0
	adds r0, r3, 0
	cmp r0, r2
	bne _0800B8D0
_0800B8A0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r3, 0
	cmp r6, r0
	bls _0800B8D8
	cmp r0, 0
	beq _0800B8D8
	adds r6, r3, 0
	b _0800B8D8
	.align 2, 0
_0800B8B4: .4byte 0x0400012a
_0800B8B8: .4byte 0x0000b9a0
_0800B8BC: .4byte gLink + 4
_0800B8C0: .4byte 0x04000120
_0800B8C4: .4byte sHandshakePlayerCount
_0800B8C8: .4byte 0x00008fff
_0800B8CC: .4byte 0x0000ffff
_0800B8D0:
	cmp r0, r12
	beq _0800B8E2
	movs r5, 0
	b _0800B8E2
_0800B8D8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800B888
_0800B8E2:
	strb r5, [r7, 0x3]
	adds r0, r5, 0
	cmp r0, 0x1
	bls _0800B912
	mov r2, r9
	ldrb r2, [r2]
	cmp r0, r2
	bne _0800B904
	ldrh r1, [r7, 0x4]
	ldr r0, _0800B900 @ =0x00008fff
	cmp r1, r0
	bne _0800B904
	movs r0, 0x1
	b _0800B91E
	.align 2, 0
_0800B900: .4byte 0x00008fff
_0800B904:
	ldrb r0, [r7, 0x3]
	cmp r0, 0x1
	bls _0800B912
	movs r0, 0x3
	ands r6, r0
	adds r0, r6, 0x1
	b _0800B914
_0800B912:
	movs r0, 0
_0800B914:
	strb r0, [r7, 0xF]
	ldrb r0, [r7, 0x3]
	mov r1, r9
	strb r0, [r1]
	movs r0, 0
_0800B91E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end DoHandshake

	thumb_func_start DoRecv
DoRecv: @ 800B92C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r0, _0800B984 @ =0x04000120
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _0800B988 @ =gLink
	ldrb r1, [r0, 0x16]
	adds r6, r0, 0
	cmp r1, 0
	bne _0800B990
	movs r4, 0
	ldr r7, _0800B98C @ =sChecksumAvailable
	ldrb r0, [r6, 0x3]
	cmp r4, r0
	bcs _0800B97A
	adds r5, r6, 0
	ldrh r1, [r6, 0x14]
	adds r3, r7, 0
	adds r2, r6, 0
_0800B95A:
	lsls r0, r4, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _0800B96E
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800B96E
	movs r0, 0x1
	strb r0, [r5, 0x11]
_0800B96E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r2, 0x3]
	cmp r4, r0
	bcc _0800B95A
_0800B97A:
	movs r0, 0
	strh r0, [r6, 0x14]
	movs r0, 0x1
	strb r0, [r7]
	b _0800BA30
	.align 2, 0
_0800B984: .4byte 0x04000120
_0800B988: .4byte gLink
_0800B98C: .4byte sChecksumAvailable
_0800B990:
	ldr r2, _0800BA00 @ =0x00000fbc
	adds r1, r6, r2
	adds r2, 0x1
	adds r0, r6, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	adds r0, r2, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B9AC
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_0800B9AC:
	cmp r2, 0x31
	bhi _0800BA08
	movs r4, 0
	ldrb r1, [r6, 0x3]
	cmp r4, r1
	bcs _0800BA0C
	adds r5, r6, 0
	ldr r7, _0800BA04 @ =sRecvNonzeroCheck
	lsls r0, 1
	mov r12, r0
	movs r2, 0xCF
	lsls r2, 2
	adds r2, r6
	mov r8, r2
_0800B9C8:
	lsls r1, r4, 1
	mov r2, sp
	adds r0, r2, r1
	ldrh r3, [r0]
	ldrh r2, [r5, 0x14]
	adds r0, r3, r2
	strh r0, [r5, 0x14]
	ldrh r0, [r7]
	orrs r0, r3
	strh r0, [r7]
	ldrb r2, [r5, 0x17]
	movs r0, 0x64
	muls r0, r2
	add r0, r12
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 5
	adds r0, r1
	add r0, r8
	strh r3, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x3]
	cmp r4, r0
	bcc _0800B9C8
	b _0800BA0C
	.align 2, 0
_0800BA00: .4byte 0x00000fbc
_0800BA04: .4byte sRecvNonzeroCheck
_0800BA08:
	movs r0, 0x2
	strb r0, [r6, 0x12]
_0800BA0C:
	ldrb r0, [r6, 0x17]
	adds r0, 0x1
	strb r0, [r6, 0x17]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _0800BA30
	ldr r2, _0800BA3C @ =sRecvNonzeroCheck
	ldrh r0, [r2]
	cmp r0, 0
	beq _0800BA30
	ldr r1, _0800BA40 @ =0x00000fbd
	adds r0, r6, r1
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0
	strh r0, [r2]
_0800BA30:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA3C: .4byte sRecvNonzeroCheck
_0800BA40: .4byte 0x00000fbd
	thumb_func_end DoRecv

	thumb_func_start DoSend
DoSend: @ 800BA44
	push {r4,lr}
	ldr r0, _0800BA80 @ =gLink
	ldrb r1, [r0, 0x16]
	adds r4, r0, 0
	cmp r1, 0x8
	bne _0800BA96
	ldr r1, _0800BA84 @ =0x0400012a
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	ldr r1, _0800BA88 @ =sSendBufferEmpty
	ldrb r2, [r1]
	cmp r2, 0
	bne _0800BA90
	ldr r0, _0800BA8C @ =0x00000339
	adds r1, r4, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r0, 0xCE
	lsls r0, 2
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800BAEC
	strb r2, [r1]
	b _0800BAEC
	.align 2, 0
_0800BA80: .4byte gLink
_0800BA84: .4byte 0x0400012a
_0800BA88: .4byte sSendBufferEmpty
_0800BA8C: .4byte 0x00000339
_0800BA90:
	movs r0, 0
	strb r0, [r1]
	b _0800BAEC
_0800BA96:
	ldr r1, _0800BABC @ =sSendBufferEmpty
	ldrb r0, [r1]
	cmp r0, 0
	bne _0800BAB2
	ldr r2, _0800BAC0 @ =0x00000339
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800BAAC
	movs r0, 0x1
	strb r0, [r1]
_0800BAAC:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800BAC8
_0800BAB2:
	ldr r1, _0800BAC4 @ =0x0400012a
	movs r0, 0
	strh r0, [r1]
	b _0800BAE6
	.align 2, 0
_0800BABC: .4byte sSendBufferEmpty
_0800BAC0: .4byte 0x00000339
_0800BAC4: .4byte 0x0400012a
_0800BAC8:
	ldr r3, _0800BAF4 @ =0x0400012a
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 1
	ldrb r2, [r4, 0x16]
	movs r1, 0x64
	muls r1, r2
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x18
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
_0800BAE6:
	ldrb r0, [r4, 0x16]
	adds r0, 0x1
	strb r0, [r4, 0x16]
_0800BAEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAF4: .4byte 0x0400012a
	thumb_func_end DoSend

	thumb_func_start StopTimer
StopTimer: @ 800BAF8
	push {lr}
	ldr r0, _0800BB18 @ =gLink
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800BB14
	ldr r2, _0800BB1C @ =0x0400010e
	ldrh r1, [r2]
	ldr r0, _0800BB20 @ =0x0000ff7f
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0800BB24 @ =0x0400010c
	ldr r2, _0800BB28 @ =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
_0800BB14:
	pop {r0}
	bx r0
	.align 2, 0
_0800BB18: .4byte gLink
_0800BB1C: .4byte 0x0400010e
_0800BB20: .4byte 0x0000ff7f
_0800BB24: .4byte 0x0400010c
_0800BB28: .4byte 0x0000ff3b
	thumb_func_end StopTimer

	thumb_func_start SendRecvDone
SendRecvDone: @ 800BB2C
	push {lr}
	ldr r1, _0800BB40 @ =gLink
	ldrb r0, [r1, 0x17]
	cmp r0, 0x8
	bne _0800BB44
	movs r0, 0
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	b _0800BB54
	.align 2, 0
_0800BB40: .4byte gLink
_0800BB44:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800BB54
	ldr r0, _0800BB58 @ =0x0400010e
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_0800BB54:
	pop {r0}
	bx r0
	.align 2, 0
_0800BB58: .4byte 0x0400010e
	thumb_func_end SendRecvDone

	thumb_func_start ResetSendBuffer
ResetSendBuffer: @ 800BB5C
	push {r4-r6,lr}
	ldr r1, _0800BBA4 @ =gLink
	ldr r2, _0800BBA8 @ =0x00000339
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	movs r3, 0xCE
	lsls r3, 2
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0
	movs r6, 0x64
	adds r5, r1, 0
	adds r5, 0x18
	ldr r4, _0800BBAC @ =0x0000efff
_0800BB7A:
	movs r2, 0
	adds r1, r0, 0x1
	adds r3, r0, 0
	muls r3, r6
_0800BB82:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _0800BB82
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0800BB7A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BBA4: .4byte gLink
_0800BBA8: .4byte 0x00000339
_0800BBAC: .4byte 0x0000efff
	thumb_func_end ResetSendBuffer

	thumb_func_start ResetRecvBuffer
ResetRecvBuffer: @ 800BBB0
	push {r4-r7,lr}
	ldr r1, _0800BC10 @ =gLink
	ldr r2, _0800BC14 @ =0x00000fbd
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _0800BC18 @ =0x00000fbc
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0x64
	mov r12, r0
	movs r3, 0xCF
	lsls r3, 2
	adds r7, r1, r3
	ldr r6, _0800BC1C @ =0x0000efff
_0800BBCE:
	movs r3, 0
	lsls r0, r2, 1
	adds r5, r2, 0x1
	adds r0, r2
	lsls r0, 3
	adds r0, r2
	lsls r4, r0, 5
_0800BBDC:
	movs r2, 0
	adds r1, r3, 0x1
	mov r0, r12
	muls r0, r3
	adds r3, r0, 0
_0800BBE6:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r4
	adds r0, r7
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _0800BBE6
	lsls r0, r1, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _0800BBDC
	lsls r0, r5, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0800BBCE
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BC10: .4byte gLink
_0800BC14: .4byte 0x00000fbd
_0800BC18: .4byte 0x00000fbc
_0800BC1C: .4byte 0x0000efff
	thumb_func_end ResetRecvBuffer

	.align 2, 0 @ Don't pad with nop.
