	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_804FE24
sub_804FE24: @ 804FE24
	push {r4,r5,lr}
	sub sp, 0x20
	ldr r0, _0804FEB0 @ =gUnknown_2031DAC
	ldr r0, [r0]
	mov r12, r0
	adds r0, 0xD4
	ldrh r1, [r0]
	lsls r1, 8
	adds r0, 0x2
	ldrh r2, [r0]
	lsls r2, 8
	adds r0, 0x6
	movs r4, 0
	ldrsh r3, [r0, r4]
	adds r0, 0x2
	movs r5, 0
	ldrsh r0, [r0, r5]
	str r0, [sp]
	mov r4, r12
	adds r4, 0xE8
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x4]
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x8]
	mov r0, r12
	adds r0, 0xEC
	ldrh r0, [r0]
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	bl DoBgAffineSet
	add r0, sp, 0x10
	ldrh r1, [r0]
	movs r0, 0x20
	bl SetGpuReg
	add r0, sp, 0x10
	ldrh r1, [r0, 0x2]
	movs r0, 0x22
	bl SetGpuReg
	add r0, sp, 0x10
	ldrh r1, [r0, 0x4]
	movs r0, 0x24
	bl SetGpuReg
	add r0, sp, 0x10
	ldrh r1, [r0, 0x6]
	movs r0, 0x26
	bl SetGpuReg
	ldr r1, [sp, 0x18]
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x28
	bl SetGpuReg
	ldr r1, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x2C
	bl SetGpuReg
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FEB0: .4byte gUnknown_2031DAC
	thumb_func_end sub_804FE24

	thumb_func_start sub_804FEB4
sub_804FEB4: @ 804FEB4
	push {r4,lr}
	ldr r4, _0804FEFC @ =gUnknown_2031DAC
	ldr r0, [r4]
	adds r0, 0xE0
	ldrh r1, [r0]
	movs r0, 0x16
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, 0xE2
	ldrh r1, [r0]
	movs r0, 0x14
	bl SetGpuReg
	movs r0, 0
	bl GetGpuReg
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	cmp r1, 0
	bne _0804FF00
	ldr r0, [r4]
	adds r0, 0xE4
	ldrh r1, [r0]
	movs r0, 0x1A
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, 0xE6
	ldrh r1, [r0]
	movs r0, 0x18
	bl SetGpuReg
	b _0804FF04
	.align 2, 0
_0804FEFC: .4byte gUnknown_2031DAC
_0804FF00:
	bl sub_804FE24
_0804FF04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804FEB4

	thumb_func_start sub_804FF0C
sub_804FF0C: @ 804FF0C
	push {lr}
	bl sub_804FEB4
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804FF0C

	thumb_func_start sub_804FF24
sub_804FF24: @ 804FF24
	push {r4,lr}
	ldr r3, _0804FF48 @ =gUnknown_2031DAC
	ldr r1, [r3]
	movs r0, 0x8A
	adds r0, r1
	mov r12, r0
	movs r2, 0
	movs r0, 0
	mov r4, r12
	strh r0, [r4]
	adds r1, 0x88
	strb r2, [r1]
	ldr r0, [r3]
	adds r0, 0x89
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FF48: .4byte gUnknown_2031DAC
	thumb_func_end sub_804FF24

	thumb_func_start sub_804FF4C
sub_804FF4C: @ 804FF4C
	push {r4,r5,lr}
	ldr r0, _0804FF70 @ =gUnknown_2031DAC
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x88
	adds r3, r2, 0
	adds r3, 0x89
	ldrb r1, [r1]
	adds r5, r0, 0
	ldrb r3, [r3]
	cmp r1, r3
	bne _0804FF74
	adds r1, r2, 0
	adds r1, 0x8A
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804FF7A
	.align 2, 0
_0804FF70: .4byte gUnknown_2031DAC
_0804FF74:
	adds r1, r2, 0
	adds r1, 0x8A
	movs r0, 0
_0804FF7A:
	strh r0, [r1]
	adds r4, r5, 0
	ldr r0, [r4]
	adds r0, 0x8A
	ldrh r1, [r0]
	movs r0, 0x96
	lsls r0, 1
	cmp r1, r0
	bls _0804FFAC
	bl CloseLink
	ldr r0, _0804FFC0 @ =CB2_LinkError
	bl SetMainCallback2
	ldr r1, [r4]
	adds r3, r1, 0
	adds r3, 0x8A
	movs r2, 0
	movs r0, 0
	strh r0, [r3]
	adds r1, 0x89
	strb r2, [r1]
	ldr r0, [r4]
	adds r0, 0x88
	strb r2, [r0]
_0804FFAC:
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0x88
	ldrb r1, [r1]
	adds r0, 0x89
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FFC0: .4byte CB2_LinkError
	thumb_func_end sub_804FF4C

	thumb_func_start sub_804FFC4
sub_804FFC4: @ 804FFC4
	push {lr}
	ldr r0, _0804FFD4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804FFD8
	movs r0, 0
	b _0804FFE0
	.align 2, 0
_0804FFD4: .4byte gReceivedRemoteLinkPlayers
_0804FFD8:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
_0804FFE0:
	pop {r1}
	bx r1
	thumb_func_end sub_804FFC4

	thumb_func_start sub_804FFE4
sub_804FFE4: @ 804FFE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0
	mov r8, r4
	cmp r6, 0
	bne _0805000A
	ldr r0, _08050034 @ =gUnknown_2031DA4
	ldrb r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08050038 @ =gPlayerParty
	adds r1, r0
	mov r8, r1
	movs r4, 0x1
_0805000A:
	cmp r6, 0x1
	bne _08050028
	ldr r0, _08050034 @ =gUnknown_2031DA4
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0805003C @ =gEnemyParty
	adds r1, r0
	mov r8, r1
	movs r4, 0x3
_08050028:
	cmp r5, 0
	beq _08050040
	cmp r5, 0x1
	beq _080500C8
	b _0805011E
	.align 2, 0
_08050034: .4byte gUnknown_2031DA4
_08050038: .4byte gPlayerParty
_0805003C: .4byte gEnemyParty
_08050040:
	mov r0, r8
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	movs r1, 0
	bl GetMonData
	adds r7, r0, 0
	cmp r6, 0
	bne _0805007C
	lsls r0, r5, 3
	ldr r1, _08050074 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08050078 @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	ldr r1, [r1, 0x8]
	adds r2, r5, 0
	adds r3, r7, 0
	bl HandleLoadSpecialPokePic
	movs r4, 0
	b _0805009A
	.align 2, 0
_08050074: .4byte gMonFrontPicTable
_08050078: .4byte gMonSpritesGfxPtr
_0805007C:
	lsls r0, r5, 3
	ldr r1, _080500BC @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _080500C0 @ =gMonSpritesGfxPtr
	ldr r2, [r1]
	lsls r4, r6, 1
	adds r1, r4, 0x1
	lsls r1, 2
	adds r2, 0x4
	adds r2, r1
	ldr r1, [r2]
	adds r2, r5, 0
	adds r3, r7, 0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
_0805009A:
	mov r0, r8
	bl GetMonSpritePalStruct
	bl LoadCompressedSpritePalette
	ldr r0, _080500C4 @ =gUnknown_2031DAC
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xF0
	adds r0, r4
	strh r5, [r0]
	lsls r0, r6, 2
	adds r1, 0x68
	adds r1, r0
	str r7, [r1]
	b _0805011E
	.align 2, 0
_080500BC: .4byte gMonFrontPicTable
_080500C0: .4byte gMonSpritesGfxPtr
_080500C4: .4byte gUnknown_2031DAC
_080500C8:
	mov r0, r8
	bl GetMonSpritePalStruct
	ldrh r0, [r0, 0x4]
	adds r1, r4, 0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _08050128 @ =gMultiuseSpriteTemplate
	movs r1, 0x78
	movs r2, 0x3C
	movs r3, 0x6
	bl CreateSprite
	ldr r4, _0805012C @ =gUnknown_2031DAC
	ldr r1, [r4]
	adds r1, 0x8E
	adds r1, r6
	strb r0, [r1]
	ldr r3, _08050130 @ =gSprites
	ldr r0, [r4]
	adds r0, 0x8E
	adds r0, r6
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
	adds r0, 0x8E
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r1, _08050134 @ =SpriteCallbackDummy
	str r1, [r0]
_0805011E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050128: .4byte gMultiuseSpriteTemplate
_0805012C: .4byte gUnknown_2031DAC
_08050130: .4byte gSprites
_08050134: .4byte SpriteCallbackDummy
	thumb_func_end sub_804FFE4

	thumb_func_start sub_8050138
sub_8050138: @ 8050138
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _08050158 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xC
	bls _0805014E
	b _08050472
_0805014E:
	lsls r0, 2
	ldr r1, _0805015C @ =_08050160
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050158: .4byte gMain
_0805015C: .4byte _08050160
	.align 2, 0
_08050160:
	.4byte _08050194
	.4byte _08050240
	.4byte _08050288
	.4byte _080502A8
	.4byte _080502F2
	.4byte _08050320
	.4byte _08050344
	.4byte _0805035C
	.4byte _08050366
	.4byte _08050380
	.4byte _0805039C
	.4byte _08050430
	.4byte _0805044C
_08050194:
	ldr r0, _08050228 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080501A8
	ldr r1, _0805022C @ =gLinkType
	ldr r2, _08050230 @ =0x00001144
	adds r0, r2, 0
	strh r0, [r1]
	bl CloseLink
_080501A8:
	ldr r4, _08050234 @ =gUnknown_2031DAC
	movs r0, 0x88
	lsls r0, 1
	bl AllocZeroed
	str r0, [r4]
	bl AllocateMonSpritesGfx
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _08050238 @ =sub_804FF0C
	bl SetVBlankCallback
	bl sub_80504CC
	bl sub_804FF24
	ldr r1, _0805023C @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x8C
	strh r2, [r0]
	adds r0, 0x8
	strh r2, [r0]
	adds r1, 0xEE
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, [r4]
	adds r0, r3, 0
	adds r0, 0xD4
	movs r1, 0x40
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r1, r3, 0
	adds r1, 0xDC
	movs r0, 0x78
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x50
	strh r0, [r1]
	adds r1, 0xA
	adds r0, 0xB0
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0xEC
	strh r2, [r0]
	b _08050472
	.align 2, 0
_08050228: .4byte gReceivedRemoteLinkPlayers
_0805022C: .4byte gLinkType
_08050230: .4byte 0x00001144
_08050234: .4byte gUnknown_2031DAC
_08050238: .4byte sub_804FF0C
_0805023C: .4byte gMain
_08050240:
	ldr r0, _08050270 @ =gReceivedRemoteLinkPlayers
	ldrb r5, [r0]
	cmp r5, 0
	bne _0805027C
	ldr r4, _08050274 @ =gUnknown_2031DAC
	ldr r0, [r4]
	movs r1, 0x84
	lsls r1, 1
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	bl OpenLink
	ldr r1, _08050278 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r4]
	str r5, [r0, 0x64]
	b _08050472
	.align 2, 0
_08050270: .4byte gReceivedRemoteLinkPlayers
_08050274: .4byte gUnknown_2031DAC
_08050278: .4byte gMain
_0805027C:
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
	movs r0, 0x4
	strb r0, [r1]
	b _08050472
_08050288:
	ldr r0, _080502A4 @ =gUnknown_2031DAC
	ldr r1, [r0]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x3C
	bhi _08050298
	b _08050472
_08050298:
	movs r0, 0
	str r0, [r1, 0x64]
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
	b _08050440
	.align 2, 0
_080502A4: .4byte gUnknown_2031DAC
_080502A8:
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	bne _080502B4
	b _08050438
_080502B4:
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl GetSavedPlayerCount
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcc _080502EC
	ldr r0, _080502E4 @ =gUnknown_2031DAC
	ldr r1, [r0]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x1E
	bhi _080502D6
	b _08050472
_080502D6:
	bl CheckShouldAdvanceLinkState
	ldr r1, _080502E8 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08050440
	.align 2, 0
_080502E4: .4byte gUnknown_2031DAC
_080502E8: .4byte gMain
_080502EC:
	bl sub_804FF4C
	b _08050472
_080502F2:
	bl sub_804FF4C
	ldr r0, _08050318 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08050300
	b _08050472
_08050300:
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0805030E
	b _08050472
_0805030E:
	ldr r1, _0805031C @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08050440
	.align 2, 0
_08050318: .4byte gReceivedRemoteLinkPlayers
_0805031C: .4byte gMain
_08050320:
	ldr r2, _08050340 @ =gUnknown_2031DAC
	ldr r0, [r2]
	adds r0, 0x72
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x73
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x93
	strb r1, [r0]
	movs r0, 0
	bl sub_804FFE4
	b _08050438
	.align 2, 0
_08050340: .4byte gUnknown_2031DAC
_08050344:
	movs r0, 0
	movs r1, 0x1
	bl sub_804FFE4
	ldr r1, _08050358 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08050440
	.align 2, 0
_08050358: .4byte gMain
_0805035C:
	movs r0, 0x1
	movs r1, 0
	bl sub_804FFE4
	b _08050438
_08050366:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804FFE4
	bl sub_80504B0
	ldr r1, _0805037C @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08050440
	.align 2, 0
_0805037C: .4byte gMain
_08050380:
	bl sub_8050DE0
	ldr r0, _08050394 @ =gUnknown_826CDD4
	bl LoadSpriteSheet
	ldr r0, _08050398 @ =gUnknown_826CDDC
	bl LoadSpritePalette
	b _08050438
	.align 2, 0
_08050394: .4byte gUnknown_826CDD4
_08050398: .4byte gUnknown_826CDDC
_0805039C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	ldr r4, _08050418 @ =gUnknown_2031DA4
	ldrb r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r1, _0805041C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	ldr r5, _08050420 @ =gUnknown_2031DAC
	ldr r1, [r5]
	adds r1, 0xF8
	strh r0, [r1]
	ldrb r0, [r4, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	muls r0, r6
	ldr r1, _08050424 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	ldr r4, [r5]
	adds r1, r4, 0
	adds r1, 0xFA
	strh r0, [r1]
	adds r4, 0xFC
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _08050428 @ =gLinkPlayers + 8
	adds r1, r0
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	ldr r1, _0805042C @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08050440
	.align 2, 0
_08050418: .4byte gUnknown_2031DA4
_0805041C: .4byte gPlayerParty
_08050420: .4byte gUnknown_2031DAC
_08050424: .4byte gEnemyParty
_08050428: .4byte gLinkPlayers + 8
_0805042C: .4byte gMain
_08050430:
	bl sub_805049C
	bl sub_8050E24
_08050438:
	ldr r1, _08050448 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
_08050440:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08050472
	.align 2, 0
_08050448: .4byte gMain
_0805044C:
	ldr r0, _08050490 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08050472
	ldr r0, _08050494 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805046C
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
_0805046C:
	ldr r0, _08050498 @ =sub_8053D84
	bl SetMainCallback2
_08050472:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050490: .4byte gPaletteFade
_08050494: .4byte gWirelessCommType
_08050498: .4byte sub_8053D84
	thumb_func_end sub_8050138

	thumb_func_start sub_805049C
sub_805049C: @ 805049C
	push {lr}
	movs r0, 0x5
	bl sub_8050968
	movs r0, 0
	bl sub_8050968
	pop {r0}
	bx r0
	thumb_func_end sub_805049C

	thumb_func_start sub_80504B0
sub_80504B0: @ 80504B0
	push {lr}
	movs r0, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_80504B0

	thumb_func_start sub_80504CC
sub_80504CC: @ 80504CC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080505B4 @ =gUnknown_826D1D4
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r5, 0x80
	lsls r5, 4
	adds r0, r5, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0
	bl SetBgTilemapBuffer
	adds r0, r5, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	adds r0, r5, 0
	bl Alloc
	adds r1, r0, 0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	bl DeactivateAllTextPrinters
	ldr r0, _080505B8 @ =gBattleTextboxTiles
	mov r10, r0
	movs r0, 0
	mov r9, r0
	str r0, [sp]
	mov r1, r10
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, _080505BC @ =gFile_graphics_interface_menu_map_tilemap
	mov r8, r0
	ldr r4, _080505C0 @ =gDecompressionBuffer
	adds r1, r4, 0
	bl LZDecompressWram
	movs r0, 0
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r6, _080505C4 @ =gBattleTextboxPalette
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r0, _080505C8 @ =gUnknown_826D1BC
	bl InitWindows
	mov r0, r9
	str r0, [sp]
	movs r0, 0
	mov r1, r10
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	mov r0, r8
	adds r1, r4, 0
	bl LZDecompressWram
	movs r0, 0
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080505B4: .4byte gUnknown_826D1D4
_080505B8: .4byte gBattleTextboxTiles
_080505BC: .4byte gFile_graphics_interface_menu_map_tilemap
_080505C0: .4byte gDecompressionBuffer
_080505C4: .4byte gBattleTextboxPalette
_080505C8: .4byte gUnknown_826D1BC
	thumb_func_end sub_80504CC

	thumb_func_start sub_80505CC
sub_80505CC: @ 80505CC
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r0, _080505EC @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _080505E0
	b _0805077E
_080505E0:
	lsls r0, 2
	ldr r1, _080505F0 @ =_080505F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080505EC: .4byte gMain
_080505F0: .4byte _080505F4
	.align 2, 0
_080505F4:
	.4byte _08050628
	.4byte _0805077E
	.4byte _0805077E
	.4byte _0805077E
	.4byte _0805077E
	.4byte _080506EC
	.4byte _080506F6
	.4byte _08050700
	.4byte _08050710
	.4byte _08050730
	.4byte _0805074C
	.4byte _08050754
	.4byte _08050778
_08050628:
	ldr r1, _080506CC @ =gUnknown_2031DA4
	ldr r0, _080506D0 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	movs r5, 0
	strb r0, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r4, _080506D4 @ =gLinkPlayers + 8
	ldr r0, _080506D8 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _080506DC @ =gEnemyParty
	movs r1, 0x7
	mov r2, sp
	bl GetMonData
	adds r4, 0x1C
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	ldr r4, _080506E0 @ =gUnknown_2031DAC
	movs r0, 0x88
	lsls r0, 1
	bl AllocZeroed
	str r0, [r4]
	bl AllocateMonSpritesGfx
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _080506E4 @ =sub_804FF0C
	bl SetVBlankCallback
	bl sub_80504CC
	ldr r0, [r4]
	adds r0, 0xEE
	strb r5, [r0]
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x8C
	strh r5, [r0]
	adds r0, 0x8
	strh r5, [r0]
	adds r0, 0x40
	movs r1, 0x40
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r1, r2, 0
	adds r1, 0xDC
	movs r0, 0x78
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x50
	strh r0, [r1]
	adds r1, 0xA
	adds r0, 0xB0
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0xEC
	strh r5, [r0]
	str r5, [r2, 0x64]
	ldr r0, _080506E8 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	b _0805077E
	.align 2, 0
_080506CC: .4byte gUnknown_2031DA4
_080506D0: .4byte gSpecialVar_0x8005
_080506D4: .4byte gLinkPlayers + 8
_080506D8: .4byte gSaveBlock2Ptr
_080506DC: .4byte gEnemyParty
_080506E0: .4byte gUnknown_2031DAC
_080506E4: .4byte sub_804FF0C
_080506E8: .4byte gMain
_080506EC:
	movs r0, 0
	movs r1, 0
	bl sub_804FFE4
	b _08050764
_080506F6:
	movs r0, 0
	movs r1, 0x1
	bl sub_804FFE4
	b _08050764
_08050700:
	movs r0, 0x1
	movs r1, 0
	bl sub_804FFE4
	movs r0, 0
	bl ShowBg
	b _08050764
_08050710:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804FFE4
	movs r0, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	b _08050764
_08050730:
	bl sub_8050DE0
	ldr r0, _08050744 @ =gUnknown_826CDD4
	bl LoadSpriteSheet
	ldr r0, _08050748 @ =gUnknown_826CDDC
	bl LoadSpritePalette
	b _08050764
	.align 2, 0
_08050744: .4byte gUnknown_826CDD4
_08050748: .4byte gUnknown_826CDDC
_0805074C:
	movs r0, 0
	bl ShowBg
	b _08050764
_08050754:
	movs r0, 0x5
	bl sub_8050968
	movs r0, 0
	bl sub_8050968
	bl sub_8050E24
_08050764:
	ldr r1, _08050774 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0805077E
	.align 2, 0
_08050774: .4byte gMain
_08050778:
	ldr r0, _0805079C @ =sub_8050948
	bl SetMainCallback2
_0805077E:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805079C: .4byte sub_8050948
	thumb_func_end sub_80505CC

	thumb_func_start sub_80507A0
sub_80507A0: @ 80507A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _080507FC @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080507F4
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl GetSetPokedexFlag
	adds r0, r4, 0
	movs r1, 0x3
	adds r2, r5, 0
	bl HandleSetPokedexFlag
_080507F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080507FC: .4byte gPlayerParty
	thumb_func_end sub_80507A0

	thumb_func_start sub_8050800
sub_8050800: @ 8050800
	push {lr}
	bl GetMultiplayerId
	pop {r0}
	bx r0
	thumb_func_end sub_8050800

	thumb_func_start sub_805080C
sub_805080C: @ 805080C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0x64
	mov r1, r9
	muls r1, r5
	ldr r0, _080508D8 @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r1, r4, 0
	muls r1, r5
	ldr r0, _080508DC @ =gEnemyParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r6, 0xFF
	beq _08050866
	ldr r0, _080508E0 @ =gSaveBlock1Ptr
	lsls r1, r6, 3
	adds r1, r6
	lsls r1, 2
	ldr r2, _080508E4 @ =0x00002cd0
	adds r1, r2
	ldr r0, [r0]
	adds r0, r1
	bl ClearMailStruct
_08050866:
	ldr r4, _080508E8 @ =gUnknown_2031DAC
	ldr r0, [r4]
	adds r1, r7, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	ldr r1, [r4]
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	movs r1, 0x46
	mov r0, sp
	strb r1, [r0]
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080508A2
	adds r0, r7, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_080508A2:
	mov r0, r8
	cmp r0, 0xFF
	beq _080508B8
	lsls r1, r0, 3
	add r1, r8
	lsls r1, 2
	ldr r0, _080508EC @ =gUnknown_2031CCC
	adds r1, r0
	adds r0, r7, 0
	bl GiveMailToMon2
_080508B8:
	mov r0, r9
	bl sub_80507A0
	ldr r0, _080508F0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080508CA
	bl sub_8050800
_080508CA:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080508D8: .4byte gPlayerParty
_080508DC: .4byte gEnemyParty
_080508E0: .4byte gSaveBlock1Ptr
_080508E4: .4byte 0x00002cd0
_080508E8: .4byte gUnknown_2031DAC
_080508EC: .4byte gUnknown_2031CCC
_080508F0: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_805080C

	thumb_func_start sub_80508F4
sub_80508F4: @ 80508F4
	push {r4,lr}
	ldr r4, _08050908 @ =gUnknown_2031DAC
	ldr r0, [r4]
	adds r0, 0x93
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0805090C
	cmp r0, 0x2
	beq _08050932
	b _0805093C
	.align 2, 0
_08050908: .4byte gUnknown_2031DAC
_0805090C:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08050932
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x74
	movs r2, 0x14
	bl SendBlock
	ldr r1, [r4]
	adds r1, 0x93
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08050932:
	ldr r0, _08050944 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x93
	movs r1, 0
	strb r1, [r0]
_0805093C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050944: .4byte gUnknown_2031DAC
	thumb_func_end sub_80508F4

	thumb_func_start sub_8050948
sub_8050948: @ 8050948
	push {lr}
	bl sub_8050F14
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8050948

	thumb_func_start sub_8050968
sub_8050968: @ 8050968
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _08050974
	b _08050DB4
_08050974:
	lsls r0, 2
	ldr r1, _08050980 @ =_08050984
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050980: .4byte _08050984
	.align 2, 0
_08050984:
	.4byte _080509A4
	.4byte _08050A18
	.4byte _08050AC4
	.4byte _08050B3C
	.4byte _08050B84
	.4byte _08050C54
	.4byte _08050C6C
	.4byte _08050D48
_080509A4:
	ldr r0, _080509FC @ =gUnknown_2031DAC
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0xE4
	movs r0, 0
	strh r0, [r2]
	adds r1, 0xE6
	movs r0, 0xB4
	strh r0, [r1]
	movs r1, 0xAA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r1, _08050A00 @ =0x00005206
	movs r0, 0xC
	bl SetGpuReg
	ldr r0, _08050A04 @ =gTradeGba2_Pal
	movs r1, 0x10
	movs r2, 0x60
	bl LoadPalette
	ldr r3, _08050A08 @ =gTradeGba_Gfx
	ldr r4, _08050A0C @ =0x06004000
	movs r5, 0xA1
	lsls r5, 5
	ldr r1, _08050A10 @ =0x040000d4
	ldr r6, _08050A14 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_080509E6:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _080509E6
	b _08050D98
	.align 2, 0
_080509FC: .4byte gUnknown_2031DAC
_08050A00: .4byte 0x00005206
_08050A04: .4byte gTradeGba2_Pal
_08050A08: .4byte gTradeGba_Gfx
_08050A0C: .4byte 0x06004000
_08050A10: .4byte 0x040000d4
_08050A14: .4byte 0x80000800
_08050A18:
	ldr r4, _08050A54 @ =gUnknown_2031DAC
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0xE2
	movs r0, 0
	strh r0, [r1]
	adds r2, 0xE0
	movs r1, 0xAE
	lsls r1, 1
	strh r1, [r2]
	movs r0, 0x16
	bl SetGpuReg
	ldr r1, _08050A58 @ =0x00008502
	movs r0, 0xA
	bl SetGpuReg
	ldr r1, _08050A5C @ =0x00009206
	movs r0, 0xC
	bl SetGpuReg
	ldr r0, [r4]
	movs r1, 0x84
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050A64
	ldr r1, _08050A60 @ =gUnknown_826AA5C
	b _08050A66
	.align 2, 0
_08050A54: .4byte gUnknown_2031DAC
_08050A58: .4byte 0x00008502
_08050A5C: .4byte 0x00009206
_08050A60: .4byte gUnknown_826AA5C
_08050A64:
	ldr r1, _08050AB0 @ =gUnknown_8269A5C
_08050A66:
	ldr r2, _08050AB4 @ =0x06002800
	ldr r0, _08050AB8 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08050ABC @ =0x80000800
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r3, _08050AC0 @ =gTradeGba_Gfx
	movs r4, 0xC0
	lsls r4, 19
	movs r5, 0xA1
	lsls r5, 5
	ldr r1, _08050AB8 @ =0x040000d4
	ldr r6, _08050ABC @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08050A8A:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08050A8A
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0x92
	lsls r1, 5
	b _08050B64
	.align 2, 0
_08050AB0: .4byte gUnknown_8269A5C
_08050AB4: .4byte 0x06002800
_08050AB8: .4byte 0x040000d4
_08050ABC: .4byte 0x80000800
_08050AC0: .4byte gTradeGba_Gfx
_08050AC4:
	ldr r0, _08050AF4 @ =gUnknown_2031DAC
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xE0
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r1, 0x84
	lsls r1, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08050B04
	ldr r1, _08050AF8 @ =0x00001241
	movs r0, 0
	bl SetGpuReg
	ldr r0, _08050AFC @ =gUnknown_3379A0Bin
	ldr r1, _08050B00 @ =0x06002800
	bl LZ77UnCompVram
	movs r0, 0x8
	b _08050B1E
	.align 2, 0
_08050AF4: .4byte gUnknown_2031DAC
_08050AF8: .4byte 0x00001241
_08050AFC: .4byte gUnknown_3379A0Bin
_08050B00: .4byte 0x06002800
_08050B04:
	ldr r1, _08050B28 @ =0x00001241
	movs r0, 0
	bl SetGpuReg
	ldr r1, _08050B2C @ =gUnknown_826407C
	ldr r2, _08050B30 @ =0x06002800
	ldr r0, _08050B34 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08050B38 @ =0x80000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0x1
_08050B1E:
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	b _08050DB4
	.align 2, 0
_08050B28: .4byte 0x00001241
_08050B2C: .4byte gUnknown_826407C
_08050B30: .4byte 0x06002800
_08050B34: .4byte 0x040000d4
_08050B38: .4byte 0x80000400
_08050B3C:
	ldr r0, _08050B6C @ =gUnknown_826BF5C
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08050B70 @ =gWirelessSignal4bpp
	ldr r1, _08050B74 @ =0x06004000
	bl LZ77UnCompVram
	ldr r0, _08050B78 @ =gUnknown_826C60C
	ldr r1, _08050B7C @ =0x06009000
	bl LZ77UnCompVram
	ldr r0, _08050B80 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0xE4
	movs r1, 0x50
	strh r1, [r0]
	movs r1, 0xB2
	lsls r1, 5
_08050B64:
	movs r0, 0
	bl SetGpuReg
	b _08050DB4
	.align 2, 0
_08050B6C: .4byte gUnknown_826BF5C
_08050B70: .4byte gWirelessSignal4bpp
_08050B74: .4byte 0x06004000
_08050B78: .4byte gUnknown_826C60C
_08050B7C: .4byte 0x06009000
_08050B80: .4byte gUnknown_2031DAC
_08050B84:
	ldr r1, _08050C0C @ =0x00001441
	movs r0, 0
	bl SetGpuReg
	ldr r1, _08050C10 @ =0x00001287
	movs r0, 0xC
	bl SetGpuReg
	ldr r0, _08050C14 @ =gUnknown_2031DAC
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0xD4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x5C
	strh r0, [r1]
	adds r1, 0x12
	movs r0, 0x20
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0xEC
	strh r2, [r0]
	ldr r3, _08050C18 @ =gUnknown_826701C
	ldr r4, _08050C1C @ =0x06004000
	movs r5, 0xA1
	lsls r5, 6
	ldr r1, _08050C20 @ =0x040000d4
	ldr r6, _08050C24 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08050BD0:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08050BD0
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, _08050C14 @ =gUnknown_2031DAC
	ldr r0, [r0]
	movs r1, 0x84
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050C34
	ldr r1, _08050C28 @ =gUnknown_826985C
	ldr r2, _08050C2C @ =0x06009000
	ldr r0, _08050C20 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08050C30 @ =0x80000080
	b _08050DB0
	.align 2, 0
_08050C0C: .4byte 0x00001441
_08050C10: .4byte 0x00001287
_08050C14: .4byte gUnknown_2031DAC
_08050C18: .4byte gUnknown_826701C
_08050C1C: .4byte 0x06004000
_08050C20: .4byte 0x040000d4
_08050C24: .4byte 0x80000800
_08050C28: .4byte gUnknown_826985C
_08050C2C: .4byte 0x06009000
_08050C30: .4byte 0x80000080
_08050C34:
	ldr r1, _08050C44 @ =gUnknown_826995C
	ldr r2, _08050C48 @ =0x06009000
	ldr r0, _08050C4C @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08050C50 @ =0x80000080
	b _08050DB0
	.align 2, 0
_08050C44: .4byte gUnknown_826995C
_08050C48: .4byte 0x06009000
_08050C4C: .4byte 0x040000d4
_08050C50: .4byte 0x80000080
_08050C54:
	ldr r0, _08050C68 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xE0
	movs r2, 0
	strh r2, [r1]
	adds r0, 0xE2
	strh r2, [r0]
	b _08050DB4
	.align 2, 0
_08050C68: .4byte gUnknown_2031DAC
_08050C6C:
	ldr r1, _08050D00 @ =0x00001441
	movs r0, 0
	bl SetGpuReg
	ldr r1, _08050D04 @ =0x00001287
	movs r0, 0xC
	bl SetGpuReg
	ldr r0, _08050D08 @ =gUnknown_2031DAC
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0xD4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x5C
	strh r0, [r1]
	adds r1, 0x12
	adds r0, 0xA4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x80
	strh r0, [r1]
	subs r1, 0xE
	movs r0, 0x78
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x50
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0xEC
	strh r2, [r0]
	ldr r3, _08050D0C @ =gUnknown_826701C
	ldr r4, _08050D10 @ =0x06004000
	movs r5, 0xA1
	lsls r5, 6
	ldr r1, _08050D14 @ =0x040000d4
	ldr r6, _08050D18 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08050CC2:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08050CC2
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, _08050D08 @ =gUnknown_2031DAC
	ldr r0, [r0]
	movs r1, 0x84
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050D28
	ldr r1, _08050D1C @ =gUnknown_826985C
	ldr r2, _08050D20 @ =0x06009000
	ldr r0, _08050D14 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08050D24 @ =0x80000080
	b _08050DB0
	.align 2, 0
_08050D00: .4byte 0x00001441
_08050D04: .4byte 0x00001287
_08050D08: .4byte gUnknown_2031DAC
_08050D0C: .4byte gUnknown_826701C
_08050D10: .4byte 0x06004000
_08050D14: .4byte 0x040000d4
_08050D18: .4byte 0x80000800
_08050D1C: .4byte gUnknown_826985C
_08050D20: .4byte 0x06009000
_08050D24: .4byte 0x80000080
_08050D28:
	ldr r1, _08050D38 @ =gUnknown_826995C
	ldr r2, _08050D3C @ =0x06009000
	ldr r0, _08050D40 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08050D44 @ =0x80000080
	b _08050DB0
	.align 2, 0
_08050D38: .4byte gUnknown_826995C
_08050D3C: .4byte 0x06009000
_08050D40: .4byte 0x040000d4
_08050D44: .4byte 0x80000080
_08050D48:
	ldr r0, _08050DBC @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xE4
	movs r2, 0
	strh r2, [r1]
	adds r0, 0xE6
	strh r2, [r0]
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	ldr r1, _08050DC0 @ =0x00005206
	movs r0, 0xC
	bl SetGpuReg
	ldr r0, _08050DC4 @ =gTradeGba2_Pal
	movs r1, 0x10
	movs r2, 0x60
	bl LoadPalette
	ldr r3, _08050DC8 @ =gTradeGba_Gfx
	ldr r4, _08050DCC @ =0x06004000
	movs r5, 0xA1
	lsls r5, 5
	ldr r1, _08050DD0 @ =0x040000d4
	ldr r6, _08050DD4 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08050D86:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08050D86
_08050D98:
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _08050DD8 @ =gUnknown_826601C
	ldr r2, _08050DDC @ =0x06009000
	ldr r0, _08050DD0 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08050DD4 @ =0x80000800
_08050DB0:
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
_08050DB4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050DBC: .4byte gUnknown_2031DAC
_08050DC0: .4byte 0x00005206
_08050DC4: .4byte gTradeGba2_Pal
_08050DC8: .4byte gTradeGba_Gfx
_08050DCC: .4byte 0x06004000
_08050DD0: .4byte 0x040000d4
_08050DD4: .4byte 0x80000800
_08050DD8: .4byte gUnknown_826601C
_08050DDC: .4byte 0x06009000
	thumb_func_end sub_8050968

	thumb_func_start sub_8050DE0
sub_8050DE0: @ 8050DE0
	push {lr}
	ldr r0, _08050E0C @ =gUnknown_826CE2C
	bl LoadSpriteSheet
	ldr r0, _08050E10 @ =gUnknown_826CE7C
	bl LoadSpriteSheet
	ldr r0, _08050E14 @ =gUnknown_826CEB0
	bl LoadSpriteSheet
	ldr r0, _08050E18 @ =gUnknown_826CF28
	bl LoadSpriteSheet
	ldr r0, _08050E1C @ =gUnknown_826CE34
	bl LoadSpritePalette
	ldr r0, _08050E20 @ =gUnknown_826CE3C
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_08050E0C: .4byte gUnknown_826CE2C
_08050E10: .4byte gUnknown_826CE7C
_08050E14: .4byte gUnknown_826CEB0
_08050E18: .4byte gUnknown_826CF28
_08050E1C: .4byte gUnknown_826CE34
_08050E20: .4byte gUnknown_826CE3C
	thumb_func_end sub_8050DE0

	thumb_func_start sub_8050E24
sub_8050E24: @ 8050E24
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r0, _08050E94 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0xEE
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050EB4
	bl GetMultiplayerId
	lsls r0, 24
	ldr r3, _08050E98 @ =gStringVar1
	movs r2, 0x80
	lsls r2, 17
	eors r2, r0
	lsrs r2, 24
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _08050E9C @ =gLinkPlayers + 8
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	ldr r5, _08050EA0 @ =gUnknown_2031DA4
	ldrb r0, [r5, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x64
	muls r0, r4
	ldr r1, _08050EA4 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _08050EA8 @ =gStringVar3
	mov r1, sp
	bl StringCopy10
	ldrb r0, [r5]
	muls r0, r4
	ldr r1, _08050EAC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _08050EB0 @ =gStringVar2
	mov r1, sp
	bl StringCopy10
	b _08050EF0
	.align 2, 0
_08050E94: .4byte gUnknown_2031DAC
_08050E98: .4byte gStringVar1
_08050E9C: .4byte gLinkPlayers + 8
_08050EA0: .4byte gUnknown_2031DA4
_08050EA4: .4byte gEnemyParty
_08050EA8: .4byte gStringVar3
_08050EAC: .4byte gPlayerParty
_08050EB0: .4byte gStringVar2
_08050EB4:
	ldr r0, _08050EF8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _08050EFC @ =gIngameTrades
	adds r4, r0
	ldr r0, _08050F00 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x2B
	bl StringCopy
	ldr r0, _08050F04 @ =gStringVar3
	adds r1, r4, 0
	bl StringCopy10
	ldr r0, _08050F08 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08050F0C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _08050F10 @ =gStringVar2
	mov r1, sp
	bl StringCopy10
_08050EF0:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050EF8: .4byte gSpecialVar_0x8004
_08050EFC: .4byte gIngameTrades
_08050F00: .4byte gStringVar1
_08050F04: .4byte gStringVar3
_08050F08: .4byte gSpecialVar_0x8005
_08050F0C: .4byte gPlayerParty
_08050F10: .4byte gStringVar2
	thumb_func_end sub_8050E24

	thumb_func_start sub_8050F14
sub_8050F14: @ 8050F14
	push {lr}
	ldr r0, _08050F2C @ =gUnknown_2031DAC
	ldr r0, [r0]
	movs r1, 0x84
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08050F30
	bl sub_805232C
	b _08050F34
	.align 2, 0
_08050F2C: .4byte gUnknown_2031DAC
_08050F30:
	bl sub_8050F3C
_08050F34:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8050F14

	thumb_func_start sub_8050F3C
sub_8050F3C: @ 8050F3C
	push {r4-r7,lr}
	sub sp, 0x10
	ldr r0, _08050F60 @ =gUnknown_2031DAC
	ldr r1, [r0]
	adds r1, 0x94
	ldrh r5, [r1]
	ldr r1, _08050F64 @ =0x0000010b
	adds r7, r0, 0
	cmp r5, r1
	bls _08050F54
	bl _08052318
_08050F54:
	lsls r0, r5, 2
	ldr r1, _08050F68 @ =_08050F6C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050F60: .4byte gUnknown_2031DAC
_08050F64: .4byte 0x0000010b
_08050F68: .4byte _08050F6C
	.align 2, 0
_08050F6C:
	.4byte _0805139C
	.4byte _08051414
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08051470
	.4byte _080514B8
	.4byte _0805152C
	.4byte _08052318
	.4byte _08051598
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _080515BC
	.4byte _080515EC
	.4byte _080515FE
	.4byte _08051620
	.4byte _08051668
	.4byte _08051698
	.4byte _080516E0
	.4byte _08051730
	.4byte _08051784
	.4byte _08051808
	.4byte _0805182C
	.4byte _08051878
	.4byte _080518C4
	.4byte _08051920
	.4byte _08051980
	.4byte _08051994
	.4byte _080519A8
	.4byte _080519BC
	.4byte _08051AE4
	.4byte _08051BB4
	.4byte _08051C3C
	.4byte _08051CB4
	.4byte _08051CC4
	.4byte _08051CE4
	.4byte _08051D34
	.4byte _08051D52
	.4byte _08051D90
	.4byte _08051DA0
	.4byte _08051E1C
	.4byte _08052318
	.4byte _08051E44
	.4byte _08051E84
	.4byte _08051EC4
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08051EE4
	.4byte _08051F0C
	.4byte _08051F28
	.4byte _08051F48
	.4byte _08051FF0
	.4byte _08052024
	.4byte _08052070
	.4byte _08052128
	.4byte _080521B4
	.4byte _08052200
	.4byte _08052210
	.4byte _08052216
	.4byte _0805223C
	.4byte _08052298
	.4byte _080522BC
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052160
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _080517B0
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052318
	.4byte _08052198
_0805139C:
	ldr r3, _08051408 @ =gSprites
	ldr r0, [r7]
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r4, [r7]
	adds r2, r4, 0
	adds r2, 0x8E
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _0805140C @ =0x0000ff4c
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _08051410 @ =gMonFrontPicCoords
	adds r0, r4, 0
	adds r0, 0xF0
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x26]
	adds r1, r4, 0
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	bl GetCurrentMapMusic
	ldr r1, [r7]
	adds r1, 0xF4
	strh r0, [r1]
	movs r0, 0x84
	lsls r0, 1
	bl PlayNewMapMusic
	bl _08052318
	.align 2, 0
_08051408: .4byte gSprites
_0805140C: .4byte 0x0000ff4c
_08051410: .4byte gMonFrontPicCoords
_08051414:
	ldr r5, [r7]
	adds r6, r5, 0
	adds r6, 0xE6
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	ble _08051448
	ldr r2, _08051444 @ =gSprites
	adds r0, r5, 0
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	adds r1, 0x3
	strh r1, [r0, 0x24]
	ldrh r0, [r6]
	subs r0, 0x3
	strh r0, [r6]
	bl _08052318
	.align 2, 0
_08051444: .4byte gSprites
_08051448:
	ldr r2, _0805146C @ =gSprites
	adds r0, r5, 0
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	strh r1, [r6]
	adds r1, r5, 0
	adds r1, 0x94
	movs r0, 0xA
	strh r0, [r1]
	bl _08052318
	.align 2, 0
_0805146C: .4byte gSprites
_08051470:
	ldr r4, _080514AC @ =gStringVar4
	ldr r1, _080514B0 @ =gUnknown_841E1E9
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8054508
	ldr r4, _080514B4 @ =gUnknown_2031DAC
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0xF0
	ldrh r1, [r2]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _0805149E
	adds r0, r1, 0
	movs r1, 0
	bl PlayCry1
_0805149E:
	ldr r3, [r4]
	adds r1, r3, 0
	adds r1, 0x94
	movs r2, 0
	movs r0, 0xB
	bl _0805218E
	.align 2, 0
_080514AC: .4byte gStringVar4
_080514B0: .4byte gUnknown_841E1E9
_080514B4: .4byte gUnknown_2031DAC
_080514B8:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x50
	beq _080514C8
	bl _08052318
_080514C8:
	adds r0, r1, 0
	adds r0, 0x8E
	ldrb r0, [r0]
	ldr r2, _0805151C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _08051520 @ =0x000fffff
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x20
	bl sub_804BB98
	ldr r1, [r7]
	adds r1, 0xD2
	strb r0, [r1]
	ldr r1, [r7]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r4, _08051524 @ =gStringVar4
	ldr r1, _08051528 @ =gUnknown_841E200
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8054508
	bl _08052318
	.align 2, 0
_0805151C: .4byte gSprites
_08051520: .4byte 0x000fffff
_08051524: .4byte gStringVar4
_08051528: .4byte gUnknown_841E200
_0805152C:
	ldr r5, _08051588 @ =gSprites
	ldr r0, [r7]
	adds r0, 0xD2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r5, 0
	adds r4, 0x1C
	adds r0, r4
	ldr r1, [r0]
	ldr r0, _0805158C @ =SpriteCallbackDummy
	cmp r1, r0
	beq _0805154C
	bl _08052318
_0805154C:
	ldr r0, _08051590 @ =gUnknown_826CDE4
	movs r1, 0x78
	movs r2, 0x20
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0xD3
	strb r0, [r1]
	ldr r2, [r7]
	adds r0, r2, 0
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08051594 @ =sub_8053938
	str r1, [r0]
	adds r2, 0xD2
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	ldr r1, [r7]
	bl _080522AC
	.align 2, 0
_08051588: .4byte gSprites
_0805158C: .4byte SpriteCallbackDummy
_08051590: .4byte gUnknown_826CDE4
_08051594: .4byte sub_8053938
_08051598:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080515B8 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x14
	strh r1, [r0]
	bl _08052318
	.align 2, 0
_080515B8: .4byte gUnknown_2031DAC
_080515BC:
	ldr r0, _080515E8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080515CC
	bl _08052318
_080515CC:
	movs r0, 0x4
	bl sub_8050968
	movs r0, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	bl _080522A8
	.align 2, 0
_080515E8: .4byte gPaletteFade
_080515EC:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl _080522A4
_080515FE:
	ldr r0, _0805161C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0805160E
	bl _08052318
_0805160E:
	ldr r0, [r7]
	adds r0, 0x94
	movs r1, 0x17
	strh r1, [r0]
	bl _08052318
	.align 2, 0
_0805161C: .4byte gPaletteFade
_08051620:
	ldr r4, _0805163C @ =gUnknown_2031DAC
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0xEA
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bls _08051640
	adds r0, r1, 0
	subs r0, 0x34
	strh r0, [r2]
	b _0805165C
	.align 2, 0
_0805163C: .4byte gUnknown_2031DAC
_08051640:
	movs r0, 0x1
	bl sub_8050968
	ldr r3, [r4]
	adds r1, r3, 0
	adds r1, 0xEA
	movs r2, 0
	movs r0, 0x80
	strh r0, [r1]
	subs r1, 0x56
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	str r2, [r3, 0x64]
_0805165C:
	ldr r0, _08051664 @ =gUnknown_2031DAC
	ldr r4, [r0]
	bl _08051EB0
	.align 2, 0
_08051664: .4byte gUnknown_2031DAC
_08051668:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x14
	bhi _08051678
	bl _08052318
_08051678:
	bl sub_804FE24
	ldr r0, _08051694 @ =gUnknown_826CF30
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x91
	strb r0, [r1]
	ldr r1, [r7]
	bl _080522AC
	.align 2, 0
_08051694: .4byte gUnknown_826CF30
_08051698:
	ldr r2, _080516D8 @ =gSprites
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _080516B8
	bl _08052318
_080516B8:
	adds r0, r1, 0
	bl DestroySprite
	movs r1, 0xC8
	lsls r1, 3
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080516DC @ =0x0000040c
	movs r0, 0x52
	bl SetGpuReg
	ldr r1, [r7]
	bl _080522AC
	.align 2, 0
_080516D8: .4byte gSprites
_080516DC: .4byte 0x0000040c
_080516E0:
	ldr r2, [r7]
	adds r0, r2, 0
	adds r0, 0xE0
	ldrh r1, [r0]
	subs r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x9E
	lsls r0, 17
	cmp r1, r0
	bne _08051700
	adds r1, r2, 0
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08051700:
	ldr r0, [r7]
	adds r0, 0xE0
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	beq _08051714
	bl _08052318
_08051714:
	ldr r0, _0805172C @ =gUnknown_826CEB8
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x92
	strb r0, [r1]
	bl _08052318
	.align 2, 0
_0805172C: .4byte gUnknown_826CEB8
_08051730:
	ldr r0, _08051774 @ =gUnknown_826CE44
	movs r1, 0x80
	movs r2, 0x50
	movs r3, 0x3
	bl CreateSprite
	ldr r4, _08051778 @ =gUnknown_2031DAC
	ldr r1, [r4]
	adds r1, 0x90
	strb r0, [r1]
	ldr r0, _0805177C @ =gUnknown_826CE84
	movs r1, 0x80
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0x91
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08051780 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r4]
	bl _080522AC
	.align 2, 0
_08051774: .4byte gUnknown_826CE44
_08051778: .4byte gUnknown_2031DAC
_0805177C: .4byte gUnknown_826CE84
_08051780: .4byte gSprites
_08051784:
	ldr r2, [r7]
	adds r1, r2, 0
	adds r1, 0xE0
	ldrh r0, [r1]
	subs r0, 0x2
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA6
	bne _0805179E
	subs r1, 0x4C
	movs r0, 0xC8
	strh r0, [r1]
_0805179E:
	ldr r1, _080517AC @ =0x00001241
	movs r0, 0
	bl SetGpuReg
	bl _08052318
	.align 2, 0
_080517AC: .4byte 0x00001241
_080517B0:
	ldr r2, _08051804 @ =gSprites
	ldr r4, [r7]
	adds r3, r4, 0
	adds r3, 0x90
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	adds r0, r4, 0
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r3, 0x22
	ldrsh r1, [r0, r3]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080517F6
	bl _08052318
_080517F6:
	adds r1, r4, 0
	adds r1, 0x94
	movs r0, 0x1D
	strh r0, [r1]
	bl _08052318
	.align 2, 0
_08051804: .4byte gSprites
_08051808:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08051828 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x1E
	strh r1, [r0]
	bl _08052318
	.align 2, 0
_08051828: .4byte gUnknown_2031DAC
_0805182C:
	ldr r0, _08051870 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0805183C
	bl _08052318
_0805183C:
	ldr r0, [r7]
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08051874 @ =gSprites
	adds r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	movs r0, 0x2
	bl sub_8050968
	ldr r1, [r7]
	bl _080522AC
	.align 2, 0
_08051870: .4byte gPaletteFade
_08051874: .4byte gSprites
_08051878:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r5, _080518BC @ =gUnknown_826CE84
	adds r0, r5, 0
	movs r1, 0x6F
	movs r2, 0xAA
	movs r3, 0
	bl CreateSprite
	ldr r4, _080518C0 @ =gUnknown_2031DAC
	ldr r1, [r4]
	adds r1, 0x90
	strb r0, [r1]
	movs r2, 0xA
	negs r2, r2
	adds r0, r5, 0
	movs r1, 0x81
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0x91
	strb r0, [r1]
	ldr r1, [r4]
	bl _080522AC
	.align 2, 0
_080518BC: .4byte gUnknown_826CE84
_080518C0: .4byte gUnknown_2031DAC
_080518C4:
	ldr r0, _08051914 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080518E2
	movs r0, 0x28
	bl PlaySE
	ldr r0, _08051918 @ =gUnknown_2031DAC
	ldr r1, [r0]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080518E2:
	ldr r3, _0805191C @ =gSprites
	ldr r0, _08051918 @ =gUnknown_2031DAC
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0x91
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	bl _08052318
	.align 2, 0
_08051914: .4byte gPaletteFade
_08051918: .4byte gUnknown_2031DAC
_0805191C: .4byte gSprites
_08051920:
	ldr r5, _0805197C @ =gSprites
	ldr r4, [r7]
	adds r2, r4, 0
	adds r2, 0x90
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r6, r4, 0
	adds r6, 0x91
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	movs r0, 0x5A
	negs r0, r0
	cmp r1, r0
	ble _08051966
	bl _08052318
_08051966:
	movs r2, 0x1
	strh r2, [r3, 0x30]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x30]
	adds r1, r4, 0
	bl _080522AC
	.align 2, 0
_0805197C: .4byte gSprites
_08051980:
	ldr r2, _08051990 @ =0x0000ffff
	movs r0, 0x1
	movs r1, 0x10
	bl BlendPalettes
	bl _080522A8
	.align 2, 0
_08051990: .4byte 0x0000ffff
_08051994:
	ldr r2, _080519A4 @ =0x0000ffff
	movs r0, 0x1
	movs r1, 0
	bl BlendPalettes
	bl _080522A8
	.align 2, 0
_080519A4: .4byte 0x0000ffff
_080519A8:
	ldr r2, _080519B8 @ =0x0000ffff
	movs r0, 0x1
	movs r1, 0x10
	bl BlendPalettes
	bl _080522A8
	.align 2, 0
_080519B8: .4byte 0x0000ffff
_080519BC:
	ldr r5, _08051A28 @ =gUnknown_2031DAC
	ldr r0, [r5]
	adds r0, 0xF0
	ldrh r0, [r0]
	bl IsPokeSpriteNotFlipped
	lsls r0, 24
	cmp r0, 0
	bne _08051A34
	ldr r4, _08051A2C @ =gSprites
	ldr r2, [r5]
	adds r2, 0x8E
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _08051A30 @ =gUnknown_826CF88
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, [r5]
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldr r0, [r5]
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	b _08051A4A
	.align 2, 0
_08051A28: .4byte gUnknown_2031DAC
_08051A2C: .4byte gSprites
_08051A30: .4byte gUnknown_826CF88
_08051A34:
	ldr r0, [r5]
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08051AD8 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAffineAnim
_08051A4A:
	ldr r5, _08051ADC @ =gUnknown_2031DAC
	ldr r0, [r5]
	adds r0, 0x8F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08051AD8 @ =gSprites
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r2, [r5]
	adds r3, r2, 0
	adds r3, 0x8E
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x3C
	strh r1, [r0, 0x20]
	adds r2, 0x8F
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xB4
	strh r1, [r0, 0x20]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xC0
	strh r1, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08051AE0 @ =0x0000ffe0
	strh r1, [r0, 0x22]
	ldrb r0, [r3]
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
	adds r0, 0x8F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r1, [r5]
	bl _080522AC
	.align 2, 0
_08051AD8: .4byte gSprites
_08051ADC: .4byte gUnknown_2031DAC
_08051AE0: .4byte 0x0000ffe0
_08051AE4:
	ldr r4, _08051BAC @ =gSprites
	ldr r2, [r7]
	adds r3, r2, 0
	adds r3, 0x8E
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	movs r5, 0
	strh r1, [r0, 0x26]
	adds r2, 0x8F
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x26]
	adds r0, 0xA3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _08051B2C
	movs r0, 0x27
	bl PlaySE
_08051B2C:
	ldr r2, [r7]
	adds r3, r2, 0
	adds r3, 0x8E
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r6, 0x26
	ldrsh r1, [r0, r6]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	blt _08051B4C
	bl _08052318
_08051B4C:
	adds r0, r2, 0
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r0, r2, 0
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r1, r2, 0
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, 0x8F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r2, _08051BB0 @ =0x0000ffff
	movs r0, 0x1
	movs r1, 0
	bl BlendPalettes
	b _08052318
	.align 2, 0
_08051BAC: .4byte gSprites
_08051BB0: .4byte 0x0000ffff
_08051BB4:
	ldr r4, _08051C38 @ =gSprites
	ldr r2, [r7]
	adds r3, r2, 0
	adds r3, 0x90
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0x91
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0x26
	ldrsh r1, [r0, r2]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	ble _08051BF6
	b _08052318
_08051BF6:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r7]
	adds r2, r1, 0
	adds r2, 0x94
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x90
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	b _08052318
	.align 2, 0
_08051C38: .4byte gSprites
_08051C3C:
	ldr r0, _08051CA4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08051C4A
	b _08052318
_08051C4A:
	ldr r1, [r7]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
	bl sub_8050968
	ldr r0, [r7]
	adds r0, 0xE0
	movs r1, 0xA6
	strh r1, [r0]
	ldr r0, _08051CA8 @ =gUnknown_826CE44
	movs r4, 0x14
	negs r4, r4
	movs r1, 0x80
	adds r2, r4, 0
	movs r3, 0x3
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x90
	strb r0, [r1]
	ldr r0, _08051CAC @ =gUnknown_826CE84
	movs r1, 0x80
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x91
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08051CB0 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	b _08052318
	.align 2, 0
_08051CA4: .4byte gPaletteFade
_08051CA8: .4byte gUnknown_826CE44
_08051CAC: .4byte gUnknown_826CE84
_08051CB0: .4byte gSprites
_08051CB4:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	b _080522A4
_08051CC4:
	movs r1, 0x92
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _08051CE0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08051CDC
	b _08052318
_08051CDC:
	b _080522A8
	.align 2, 0
_08051CE0: .4byte gPaletteFade
_08051CE4:
	ldr r2, _08051D30 @ =gSprites
	ldr r4, [r7]
	adds r3, r4, 0
	adds r3, 0x90
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	adds r0, r4, 0
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r3, 0x26
	ldrsh r1, [r0, r3]
	movs r6, 0x22
	ldrsh r0, [r0, r6]
	adds r1, r0
	cmp r1, 0x40
	beq _08051D2A
	b _08052318
_08051D2A:
	adds r1, r4, 0
	b _080522AC
	.align 2, 0
_08051D30: .4byte gSprites
_08051D34:
	ldr r1, [r7]
	adds r5, r1, 0
	adds r5, 0xE0
	ldrh r0, [r5]
	adds r0, 0x2
	strh r0, [r5]
	lsls r0, 16
	asrs r0, 16
	movs r6, 0x9E
	lsls r6, 1
	cmp r0, r6
	bgt _08051D4E
	b _08052318
_08051D4E:
	strh r6, [r5]
	b _080522AC
_08051D52:
	ldr r0, [r7]
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08051D8C @ =gSprites
	adds r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r3, [r7]
	adds r2, r3, 0
	adds r2, 0x94
	ldrh r0, [r2]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r2]
	str r1, [r3, 0x64]
	b _08052318
	.align 2, 0
_08051D8C: .4byte gSprites
_08051D90:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0xA
	beq _08051D9E
	b _08052318
_08051D9E:
	b _080522AC
_08051DA0:
	ldr r1, [r7]
	adds r2, r1, 0
	adds r2, 0xE0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xAE
	lsls r3, 1
	cmp r0, r3
	ble _08051DC2
	strh r3, [r2]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08051DC2:
	ldr r2, [r7]
	adds r0, r2, 0
	adds r0, 0xE0
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	beq _08051DD6
	b _08052318
_08051DD6:
	movs r6, 0x84
	lsls r6, 1
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, 0
	bne _08051DE4
	b _08052318
_08051DE4:
	ldr r0, _08051E10 @ =gUnknown_826CEB8
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x92
	strb r0, [r1]
	ldr r2, _08051E14 @ =gSprites
	ldr r0, [r7]
	adds r0, 0x92
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08051E18 @ =sub_804FDDC
	str r1, [r0]
	b _08052318
	.align 2, 0
_08051E10: .4byte gUnknown_826CEB8
_08051E14: .4byte gSprites
_08051E18: .4byte sub_804FDDC
_08051E1C:
	ldr r0, _08051E3C @ =gUnknown_826CF30
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r2, _08051E40 @ =gUnknown_2031DAC
	ldr r1, [r2]
	adds r1, 0x91
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0x94
	movs r1, 0x32
	strh r1, [r0]
	b _08052318
	.align 2, 0
_08051E3C: .4byte gUnknown_826CF30
_08051E40: .4byte gUnknown_2031DAC
_08051E44:
	ldr r2, _08051E80 @ =gSprites
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _08051E62
	b _08052318
_08051E62:
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x6
	bl sub_8050968
	ldr r1, [r7]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x98
	bl PlaySE
	b _08052318
	.align 2, 0
_08051E80: .4byte gSprites
_08051E84:
	ldr r1, [r7]
	adds r2, r1, 0
	adds r2, 0xEA
	ldrh r3, [r2]
	ldr r0, _08051E9C @ =0x000003ff
	cmp r3, r0
	bhi _08051EA0
	adds r0, r3, 0
	adds r0, 0x34
	strh r0, [r2]
	b _08051EAE
	.align 2, 0
_08051E9C: .4byte 0x000003ff
_08051EA0:
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r2]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08051EAE:
	ldr r4, [r7]
_08051EB0:
	adds r0, r4, 0
	adds r0, 0xEA
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	adds r4, 0xE8
	strh r0, [r4]
	b _08052318
_08051EC4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08051EE0 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x3C
	strh r1, [r0]
	b _08052318
	.align 2, 0
_08051EE0: .4byte gUnknown_2031DAC
_08051EE4:
	ldr r4, _08051F08 @ =gPaletteFade
	ldrb r1, [r4, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08051EF2
	b _08052318
_08051EF2:
	movs r0, 0x5
	bl sub_8050968
	movs r0, 0x7
	bl sub_8050968
	ldrb r0, [r4, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4, 0x8]
	b _080522A8
	.align 2, 0
_08051F08: .4byte gPaletteFade
_08051F0C:
	ldr r2, _08051F24 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _080522A4
	.align 2, 0
_08051F24: .4byte gPaletteFade
_08051F28:
	movs r1, 0xA2
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _08051F44 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08051F40
	b _08052318
_08051F40:
	b _080522A8
	.align 2, 0
_08051F44: .4byte gPaletteFade
_08051F48:
	ldr r0, _08051FDC @ =gUnknown_826CDE4
	movs r2, 0x8
	negs r2, r2
	movs r1, 0x78
	movs r3, 0
	bl CreateSprite
	ldr r5, _08051FE0 @ =gUnknown_2031DAC
	ldr r1, [r5]
	adds r1, 0xD3
	movs r6, 0
	strb r0, [r1]
	ldr r4, _08051FE4 @ =gSprites
	ldr r2, [r5]
	adds r2, 0xD3
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x4A
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08051FE8 @ =sub_8053A0C
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, [r5]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r2, _08051FEC @ =0x0000ffff
	movs r1, 0x10
	bl BlendPalettes
	ldr r2, [r5]
	adds r1, r2, 0
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	str r6, [r2, 0x64]
	b _08052318
	.align 2, 0
_08051FDC: .4byte gUnknown_826CDE4
_08051FE0: .4byte gUnknown_2031DAC
_08051FE4: .4byte gSprites
_08051FE8: .4byte sub_8053A0C
_08051FEC: .4byte 0x0000ffff
_08051FF0:
	ldr r2, _0805201C @ =gSprites
	ldr r0, [r7]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r1, _08052020 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, [r7]
	b _080522AC
	.align 2, 0
_0805201C: .4byte gSprites
_08052020: .4byte 0x0000ffff
_08052024:
	ldr r2, _08052060 @ =gSprites
	ldr r3, [r7]
	adds r0, r3, 0
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08052064 @ =SpriteCallbackDummy
	cmp r1, r0
	beq _08052042
	b _08052318
_08052042:
	adds r0, r3, 0
	adds r0, 0xF2
	ldrh r2, [r0]
	lsls r0, r2, 3
	ldr r1, _08052068 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _0805206C @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	ldr r1, [r1, 0x10]
	ldr r3, [r3, 0x6C]
	bl HandleLoadSpecialPokePic
	ldr r1, [r7]
	b _080522AC
	.align 2, 0
_08052060: .4byte gSprites
_08052064: .4byte SpriteCallbackDummy
_08052068: .4byte gMonFrontPicTable
_0805206C: .4byte gMonSpritesGfxPtr
_08052070:
	ldr r4, _0805211C @ =gSprites
	ldr r2, [r7]
	adds r6, r2, 0
	adds r6, 0x8F
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r5, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	ldrb r0, [r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldr r3, _08052120 @ =gMonFrontPicCoords
	adds r2, 0xF2
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	adds r0, 0x3C
	strh r0, [r1, 0x22]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x24]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x26]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, [r7]
	adds r0, 0x8F
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _08052124 @ =0x000fffff
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x54
	bl CreatePokeballSpriteToReleaseMon
	ldr r0, [r7]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, [r7]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, [r7]
	b _080522AC
	.align 2, 0
_0805211C: .4byte gSprites
_08052120: .4byte gMonFrontPicCoords
_08052124: .4byte 0x000fffff
_08052128:
	movs r1, 0xAA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r4, _08052154 @ =gStringVar4
	ldr r1, _08052158 @ =gUnknown_841E20D
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8054508
	ldr r0, _0805215C @ =gUnknown_2031DAC
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0x94
	movs r2, 0
	movs r0, 0xA7
	b _0805218E
	.align 2, 0
_08052154: .4byte gStringVar4
_08052158: .4byte gUnknown_841E20D
_0805215C: .4byte gUnknown_2031DAC
_08052160:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x3C
	bhi _0805216E
	b _08052318
_0805216E:
	adds r2, r1, 0
	adds r2, 0xF2
	ldrh r1, [r2]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _08052184
	adds r0, r1, 0
	movs r1, 0
	bl PlayCry1
_08052184:
	ldr r3, [r7]
	adds r1, r3, 0
	adds r1, 0x94
	movs r2, 0
	ldr r0, _08052194 @ =0x0000010b
_0805218E:
	strh r0, [r1]
	str r2, [r3, 0x64]
	b _08052318
	.align 2, 0
_08052194: .4byte 0x0000010b
_08052198:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _080521A4
	b _08052318
_080521A4:
	ldr r0, _080521B0 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x44
	strh r1, [r0]
	b _08052318
	.align 2, 0
_080521B0: .4byte gUnknown_2031DAC
_080521B4:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0xA
	bne _080521C6
	ldr r0, _080521F4 @ =0x00000103
	bl PlayFanfare
_080521C6:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	cmp r0, 0xFA
	beq _080521D0
	b _08052318
_080521D0:
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r1]
	ldr r4, _080521F8 @ =gStringVar4
	ldr r1, _080521FC @ =gUnknown_841E21E
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8054508
	ldr r0, [r7]
	str r5, [r0, 0x64]
	b _08052318
	.align 2, 0
_080521F4: .4byte 0x00000103
_080521F8: .4byte gStringVar4
_080521FC: .4byte gUnknown_841E21E
_08052200:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x3C
	beq _0805220E
	b _08052318
_0805220E:
	b _080522AC
_08052210:
	bl sub_80544AC
	b _080522A8
_08052216:
	ldr r2, [r7]
	adds r0, r2, 0
	adds r0, 0xEE
	ldrb r0, [r0]
	cmp r0, 0
	beq _08052226
	movs r0, 0x1
	b _0805231A
_08052226:
	ldr r0, _08052238 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08052318
	adds r1, r2, 0
	b _080522AC
	.align 2, 0
_08052238: .4byte gMain
_0805223C:
	ldr r0, _08052280 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	movs r1, 0
	bl sub_805080C
	ldr r1, _08052284 @ =gCB2_AfterEvolution
	ldr r0, _08052288 @ =sub_8050948
	str r0, [r1]
	ldr r7, _0805228C @ =gUnknown_2031DA4
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08052290 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x1
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080522A8
	ldrb r3, [r7]
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	ldr r1, _08052294 @ =gUnknown_2031DAC
	ldr r1, [r1]
	adds r1, 0x8F
	ldrb r2, [r1]
	adds r1, r4, 0
	bl TradeEvolutionScene
	b _080522A8
	.align 2, 0
_08052280: .4byte gSpecialVar_0x8005
_08052284: .4byte gCB2_AfterEvolution
_08052288: .4byte sub_8050948
_0805228C: .4byte gUnknown_2031DA4
_08052290: .4byte gPlayerParty
_08052294: .4byte gUnknown_2031DAC
_08052298:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_080522A4:
	bl BeginNormalPaletteFade
_080522A8:
	ldr r0, _080522B8 @ =gUnknown_2031DAC
	ldr r1, [r0]
_080522AC:
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08052318
	.align 2, 0
_080522B8: .4byte gUnknown_2031DAC
_080522BC:
	ldr r0, _08052324 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08052318
	ldr r0, [r7]
	adds r0, 0xF4
	ldrh r0, [r0]
	bl PlayNewMapMusic
	ldr r0, [r7]
	cmp r0, 0
	beq _0805230A
	bl FreeAllWindowBuffers
	movs r0, 0x3
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0
	bl GetBgTilemapBuffer
	bl Free
	bl FreeMonSpritesGfx
	ldr r0, [r7]
	bl Free
	str r4, [r7]
_0805230A:
	ldr r0, _08052328 @ =CB2_ReturnToField
	bl SetMainCallback2
	bl sub_8053AE4
	bl HelpSystem_Enable
_08052318:
	movs r0, 0
_0805231A:
	add sp, 0x10
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08052324: .4byte gPaletteFade
_08052328: .4byte CB2_ReturnToField
	thumb_func_end sub_8050F3C

	thumb_func_start sub_805232C
sub_805232C: @ 805232C
	push {r4-r7,lr}
	sub sp, 0x10
	ldr r0, _08052350 @ =gUnknown_2031DAC
	ldr r1, [r0]
	adds r1, 0x94
	ldrh r5, [r1]
	ldr r1, _08052354 @ =0x0000010b
	adds r7, r0, 0
	cmp r5, r1
	bls _08052344
	bl _08053774
_08052344:
	lsls r0, r5, 2
	ldr r1, _08052358 @ =_0805235C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052350: .4byte gUnknown_2031DAC
_08052354: .4byte 0x0000010b
_08052358: .4byte _0805235C
	.align 2, 0
_0805235C:
	.4byte _0805278C
	.4byte _08052804
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08052860
	.4byte _080528A8
	.4byte _0805291C
	.4byte _08053774
	.4byte _08052988
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _080529AC
	.4byte _080529DC
	.4byte _080529EE
	.4byte _08052A10
	.4byte _08053774
	.4byte _08053774
	.4byte _08052B08
	.4byte _08052B28
	.4byte _08052B94
	.4byte _08052C18
	.4byte _08052C3C
	.4byte _08052C88
	.4byte _08052CD4
	.4byte _08052D30
	.4byte _08052D9C
	.4byte _08052DB0
	.4byte _08052DC4
	.4byte _08052DD8
	.4byte _08052F00
	.4byte _08052FD0
	.4byte _08053058
	.4byte _080530F8
	.4byte _08053108
	.4byte _08053128
	.4byte _08053774
	.4byte _08053774
	.4byte _0805324C
	.4byte _0805325C
	.4byte _0805327A
	.4byte _08053774
	.4byte _080532A0
	.4byte _080532E0
	.4byte _08053320
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053340
	.4byte _08053368
	.4byte _08053384
	.4byte _080533A4
	.4byte _0805344C
	.4byte _08053480
	.4byte _080534CC
	.4byte _08053584
	.4byte _08053610
	.4byte _0805365C
	.4byte _0805366C
	.4byte _08053672
	.4byte _08053698
	.4byte _080536F4
	.4byte _08053718
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08052A58
	.4byte _08052A8C
	.4byte _08052AE0
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053180
	.4byte _080531E8
	.4byte _08053224
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _080535BC
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08052BC0
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _08053774
	.4byte _080535F4
_0805278C:
	ldr r3, _080527F8 @ =gSprites
	ldr r0, [r7]
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r4, [r7]
	adds r2, r4, 0
	adds r2, 0x8E
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080527FC @ =0x0000ff4c
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _08052800 @ =gMonFrontPicCoords
	adds r0, r4, 0
	adds r0, 0xF0
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x26]
	adds r1, r4, 0
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	bl GetCurrentMapMusic
	ldr r1, [r7]
	adds r1, 0xF4
	strh r0, [r1]
	movs r0, 0x84
	lsls r0, 1
	bl PlayNewMapMusic
	bl _08053774
	.align 2, 0
_080527F8: .4byte gSprites
_080527FC: .4byte 0x0000ff4c
_08052800: .4byte gMonFrontPicCoords
_08052804:
	ldr r5, [r7]
	adds r6, r5, 0
	adds r6, 0xE6
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	ble _08052838
	ldr r2, _08052834 @ =gSprites
	adds r0, r5, 0
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	adds r1, 0x3
	strh r1, [r0, 0x24]
	ldrh r0, [r6]
	subs r0, 0x3
	strh r0, [r6]
	bl _08053774
	.align 2, 0
_08052834: .4byte gSprites
_08052838:
	ldr r2, _0805285C @ =gSprites
	adds r0, r5, 0
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	strh r1, [r6]
	adds r1, r5, 0
	adds r1, 0x94
	movs r0, 0xA
	strh r0, [r1]
	bl _08053774
	.align 2, 0
_0805285C: .4byte gSprites
_08052860:
	ldr r4, _0805289C @ =gStringVar4
	ldr r1, _080528A0 @ =gUnknown_841E1E9
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8054508
	ldr r4, _080528A4 @ =gUnknown_2031DAC
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0xF0
	ldrh r1, [r2]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _0805288E
	adds r0, r1, 0
	movs r1, 0
	bl PlayCry1
_0805288E:
	ldr r3, [r4]
	adds r1, r3, 0
	adds r1, 0x94
	movs r2, 0
	movs r0, 0xB
	bl _080535EA
	.align 2, 0
_0805289C: .4byte gStringVar4
_080528A0: .4byte gUnknown_841E1E9
_080528A4: .4byte gUnknown_2031DAC
_080528A8:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x50
	beq _080528B8
	bl _08053774
_080528B8:
	adds r0, r1, 0
	adds r0, 0x8E
	ldrb r0, [r0]
	ldr r2, _0805290C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _08052910 @ =0x000fffff
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x20
	bl sub_804BB98
	ldr r1, [r7]
	adds r1, 0xD2
	strb r0, [r1]
	ldr r1, [r7]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r4, _08052914 @ =gStringVar4
	ldr r1, _08052918 @ =gUnknown_841E200
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8054508
	bl _08053774
	.align 2, 0
_0805290C: .4byte gSprites
_08052910: .4byte 0x000fffff
_08052914: .4byte gStringVar4
_08052918: .4byte gUnknown_841E200
_0805291C:
	ldr r5, _08052978 @ =gSprites
	ldr r0, [r7]
	adds r0, 0xD2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r5, 0
	adds r4, 0x1C
	adds r0, r4
	ldr r1, [r0]
	ldr r0, _0805297C @ =SpriteCallbackDummy
	cmp r1, r0
	beq _0805293C
	bl _08053774
_0805293C:
	ldr r0, _08052980 @ =gUnknown_826CDE4
	movs r1, 0x78
	movs r2, 0x20
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0xD3
	strb r0, [r1]
	ldr r2, [r7]
	adds r0, r2, 0
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08052984 @ =sub_8053938
	str r1, [r0]
	adds r2, 0xD2
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	ldr r1, [r7]
	bl _08053708
	.align 2, 0
_08052978: .4byte gSprites
_0805297C: .4byte SpriteCallbackDummy
_08052980: .4byte gUnknown_826CDE4
_08052984: .4byte sub_8053938
_08052988:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080529A8 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x14
	strh r1, [r0]
	bl _08053774
	.align 2, 0
_080529A8: .4byte gUnknown_2031DAC
_080529AC:
	ldr r0, _080529D8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080529BC
	bl _08053774
_080529BC:
	movs r0, 0x4
	bl sub_8050968
	movs r0, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	bl _08053704
	.align 2, 0
_080529D8: .4byte gPaletteFade
_080529DC:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl _08053700
_080529EE:
	ldr r0, _08052A0C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080529FE
	bl _08053774
_080529FE:
	ldr r0, [r7]
	adds r0, 0x94
	movs r1, 0x17
	strh r1, [r0]
	bl _08053774
	.align 2, 0
_08052A0C: .4byte gPaletteFade
_08052A10:
	ldr r4, _08052A2C @ =gUnknown_2031DAC
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0xEA
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bls _08052A30
	adds r0, r1, 0
	subs r0, 0x34
	strh r0, [r2]
	b _08052A4A
	.align 2, 0
_08052A2C: .4byte gUnknown_2031DAC
_08052A30:
	movs r0, 0x1
	bl sub_8050968
	ldr r3, [r4]
	adds r1, r3, 0
	adds r1, 0xEA
	movs r2, 0
	movs r0, 0x80
	strh r0, [r1]
	subs r1, 0x56
	movs r0, 0x7C
	strh r0, [r1]
	str r2, [r3, 0x64]
_08052A4A:
	ldr r0, _08052A54 @ =gUnknown_2031DAC
	ldr r4, [r0]
	bl _0805330C
	.align 2, 0
_08052A54: .4byte gUnknown_2031DAC
_08052A58:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x14
	bhi _08052A68
	bl _08053774
_08052A68:
	movs r0, 0x3
	bl sub_8050968
	ldr r0, _08052A88 @ =gUnknown_826CF48
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x91
	strb r0, [r1]
	ldr r1, [r7]
	bl _08053708
	.align 2, 0
_08052A88: .4byte gUnknown_826CF48
_08052A8C:
	ldr r2, _08052AD4 @ =gSprites
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _08052AAC
	bl _08053774
_08052AAC:
	adds r0, r1, 0
	bl DestroySprite
	ldr r1, _08052AD8 @ =0x00000452
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x82
	lsls r1, 3
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, _08052ADC @ =c3_08054588
	movs r1, 0x5
	bl CreateTask
	ldr r1, [r7]
	bl _08053708
	.align 2, 0
_08052AD4: .4byte gSprites
_08052AD8: .4byte 0x00000452
_08052ADC: .4byte c3_08054588
_08052AE0:
	ldr r0, _08052B00 @ =c3_08054588
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08052AF0
	bl _08053774
_08052AF0:
	ldr r0, _08052B04 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x1A
	strh r1, [r0]
	bl _08053774
	.align 2, 0
_08052B00: .4byte c3_08054588
_08052B04: .4byte gUnknown_2031DAC
_08052B08:
	ldr r2, [r7]
	adds r0, r2, 0
	adds r0, 0xE0
	ldrh r1, [r0]
	subs r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x9E
	lsls r0, 17
	cmp r1, r0
	beq _08052B22
	bl _08053774
_08052B22:
	adds r1, r2, 0
	bl _08053708
_08052B28:
	ldr r0, _08052B80 @ =gUnknown_826CE44
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0x3
	bl CreateSprite
	ldr r4, _08052B84 @ =gUnknown_2031DAC
	ldr r1, [r4]
	adds r1, 0x90
	strb r0, [r1]
	ldr r5, _08052B88 @ =gSprites
	ldr r0, [r4]
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08052B8C @ =sub_804FD48
	str r1, [r0]
	ldr r0, _08052B90 @ =gUnknown_826CE84
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0x91
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r4]
	bl _08053708
	.align 2, 0
_08052B80: .4byte gUnknown_826CE44
_08052B84: .4byte gUnknown_2031DAC
_08052B88: .4byte gSprites
_08052B8C: .4byte sub_804FD48
_08052B90: .4byte gUnknown_826CE84
_08052B94:
	ldr r2, [r7]
	adds r1, r2, 0
	adds r1, 0xE0
	ldrh r0, [r1]
	subs r0, 0x3
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA6
	bne _08052BAE
	subs r1, 0x4C
	movs r0, 0xC8
	strh r0, [r1]
_08052BAE:
	ldr r1, _08052BBC @ =0x00001241
	movs r0, 0
	bl SetGpuReg
	bl _08053774
	.align 2, 0
_08052BBC: .4byte 0x00001241
_08052BC0:
	ldr r2, _08052C14 @ =gSprites
	ldr r4, [r7]
	adds r3, r4, 0
	adds r3, 0x90
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	adds r0, r4, 0
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r2, 0x22
	ldrsh r1, [r0, r2]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _08052C06
	bl _08053774
_08052C06:
	adds r1, r4, 0
	adds r1, 0x94
	movs r0, 0x1D
	strh r0, [r1]
	bl _08053774
	.align 2, 0
_08052C14: .4byte gSprites
_08052C18:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08052C38 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x1E
	strh r1, [r0]
	bl _08053774
	.align 2, 0
_08052C38: .4byte gUnknown_2031DAC
_08052C3C:
	ldr r0, _08052C80 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08052C4C
	bl _08053774
_08052C4C:
	ldr r0, [r7]
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08052C84 @ =gSprites
	adds r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	movs r0, 0x2
	bl sub_8050968
	ldr r1, [r7]
	bl _08053708
	.align 2, 0
_08052C80: .4byte gPaletteFade
_08052C84: .4byte gSprites
_08052C88:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r5, _08052CCC @ =gUnknown_826CE84
	adds r0, r5, 0
	movs r1, 0x6F
	movs r2, 0xAA
	movs r3, 0
	bl CreateSprite
	ldr r4, _08052CD0 @ =gUnknown_2031DAC
	ldr r1, [r4]
	adds r1, 0x90
	strb r0, [r1]
	movs r2, 0xA
	negs r2, r2
	adds r0, r5, 0
	movs r1, 0x81
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0x91
	strb r0, [r1]
	ldr r1, [r4]
	bl _08053708
	.align 2, 0
_08052CCC: .4byte gUnknown_826CE84
_08052CD0: .4byte gUnknown_2031DAC
_08052CD4:
	ldr r0, _08052D24 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08052CF2
	movs r0, 0x28
	bl PlaySE
	ldr r0, _08052D28 @ =gUnknown_2031DAC
	ldr r1, [r0]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08052CF2:
	ldr r3, _08052D2C @ =gSprites
	ldr r0, _08052D28 @ =gUnknown_2031DAC
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0x91
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	bl _08053774
	.align 2, 0
_08052D24: .4byte gPaletteFade
_08052D28: .4byte gUnknown_2031DAC
_08052D2C: .4byte gSprites
_08052D30:
	ldr r5, _08052D94 @ =gSprites
	ldr r4, [r7]
	adds r2, r4, 0
	adds r2, 0x90
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r6, r4, 0
	adds r6, 0x91
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	movs r0, 0x5A
	negs r0, r0
	cmp r1, r0
	ble _08052D76
	bl _08053774
_08052D76:
	movs r2, 0x1
	strh r2, [r3, 0x30]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x30]
	adds r1, r4, 0
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r0, _08052D98 @ =c3_0805465C
	b _08052FBE
	.align 2, 0
_08052D94: .4byte gSprites
_08052D98: .4byte c3_0805465C
_08052D9C:
	ldr r2, _08052DAC @ =0x0000ffff
	movs r0, 0x8
	movs r1, 0x10
	bl BlendPalettes
	bl _08053704
	.align 2, 0
_08052DAC: .4byte 0x0000ffff
_08052DB0:
	ldr r2, _08052DC0 @ =0x0000ffff
	movs r0, 0x8
	movs r1, 0x10
	bl BlendPalettes
	bl _08053704
	.align 2, 0
_08052DC0: .4byte 0x0000ffff
_08052DC4:
	ldr r2, _08052DD4 @ =0x0000ffff
	movs r0, 0x8
	movs r1, 0x10
	bl BlendPalettes
	bl _08053704
	.align 2, 0
_08052DD4: .4byte 0x0000ffff
_08052DD8:
	ldr r5, _08052E44 @ =gUnknown_2031DAC
	ldr r0, [r5]
	adds r0, 0xF0
	ldrh r0, [r0]
	bl IsPokeSpriteNotFlipped
	lsls r0, 24
	cmp r0, 0
	bne _08052E50
	ldr r4, _08052E48 @ =gSprites
	ldr r2, [r5]
	adds r2, 0x8E
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _08052E4C @ =gUnknown_826CF88
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, [r5]
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldr r0, [r5]
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	b _08052E66
	.align 2, 0
_08052E44: .4byte gUnknown_2031DAC
_08052E48: .4byte gSprites
_08052E4C: .4byte gUnknown_826CF88
_08052E50:
	ldr r0, [r5]
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08052EF4 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAffineAnim
_08052E66:
	ldr r5, _08052EF8 @ =gUnknown_2031DAC
	ldr r0, [r5]
	adds r0, 0x8F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08052EF4 @ =gSprites
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r2, [r5]
	adds r3, r2, 0
	adds r3, 0x8E
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x28
	strh r1, [r0, 0x20]
	adds r2, 0x8F
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xC8
	strh r1, [r0, 0x20]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xC0
	strh r1, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08052EFC @ =0x0000ffe0
	strh r1, [r0, 0x22]
	ldrb r0, [r3]
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
	adds r0, 0x8F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r1, [r5]
	bl _08053708
	.align 2, 0
_08052EF4: .4byte gSprites
_08052EF8: .4byte gUnknown_2031DAC
_08052EFC: .4byte 0x0000ffe0
_08052F00:
	ldr r4, _08052FC8 @ =gSprites
	ldr r2, [r7]
	adds r3, r2, 0
	adds r3, 0x8E
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	movs r5, 0
	strh r1, [r0, 0x26]
	adds r2, 0x8F
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x26]
	adds r0, 0xA3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _08052F48
	movs r0, 0x27
	bl PlaySE
_08052F48:
	ldr r2, [r7]
	adds r3, r2, 0
	adds r3, 0x8E
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r6, 0x26
	ldrsh r1, [r0, r6]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	blt _08052F68
	bl _08053774
_08052F68:
	adds r0, r2, 0
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r0, r2, 0
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r1, r2, 0
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, 0x8F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _08052FCC @ =sub_8054734
_08052FBE:
	movs r1, 0x5
	bl CreateTask
	bl _08053774
	.align 2, 0
_08052FC8: .4byte gSprites
_08052FCC: .4byte sub_8054734
_08052FD0:
	ldr r4, _08053054 @ =gSprites
	ldr r2, [r7]
	adds r3, r2, 0
	adds r3, 0x90
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0x91
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0x26
	ldrsh r1, [r0, r2]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	ble _08053012
	b _08053774
_08053012:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r7]
	adds r2, r1, 0
	adds r2, 0x94
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x90
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	b _08053774
	.align 2, 0
_08053054: .4byte gSprites
_08053058:
	ldr r0, _080530E4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08053066
	b _08053774
_08053066:
	ldr r1, [r7]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
	bl sub_8050968
	ldr r0, [r7]
	adds r0, 0xE0
	movs r1, 0xA6
	strh r1, [r0]
	movs r0, 0x3
	bl sub_8050968
	ldr r0, [r7]
	adds r0, 0xE4
	movs r1, 0xCE
	lsls r1, 1
	strh r1, [r0]
	ldr r0, _080530E8 @ =gUnknown_826CE44
	movs r4, 0x14
	negs r4, r4
	movs r1, 0x78
	adds r2, r4, 0
	movs r3, 0x3
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x90
	strb r0, [r1]
	ldr r5, _080530EC @ =gSprites
	ldr r0, [r7]
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080530F0 @ =sub_804FD48
	str r1, [r0]
	ldr r0, _080530F4 @ =gUnknown_826CE84
	movs r1, 0x78
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x91
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	b _08053774
	.align 2, 0
_080530E4: .4byte gPaletteFade
_080530E8: .4byte gUnknown_826CE44
_080530EC: .4byte gSprites
_080530F0: .4byte sub_804FD48
_080530F4: .4byte gUnknown_826CE84
_080530F8:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	b _08053700
_08053108:
	movs r1, 0x92
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _08053124 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08053120
	b _08053774
_08053120:
	b _08053704
	.align 2, 0
_08053124: .4byte gPaletteFade
_08053128:
	ldr r2, _0805317C @ =gSprites
	ldr r4, [r7]
	adds r3, r4, 0
	adds r3, 0x90
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x4
	strh r1, [r0, 0x26]
	adds r0, r4, 0
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x4
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r6, 0x26
	ldrsh r1, [r0, r6]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	adds r1, r0
	cmp r1, 0x40
	beq _0805316E
	b _08053774
_0805316E:
	adds r0, r4, 0
	adds r0, 0x94
	movs r1, 0x90
	strh r1, [r0]
	movs r0, 0
	str r0, [r4, 0x64]
	b _08053774
	.align 2, 0
_0805317C: .4byte gSprites
_08053180:
	movs r1, 0xB2
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r4, _080531DC @ =gUnknown_2031DAC
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0xE0
	ldrh r0, [r1]
	adds r0, 0x3
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r1]
	adds r0, 0x3
	strh r0, [r1]
	ldr r0, [r2, 0x64]
	adds r0, 0x1
	str r0, [r2, 0x64]
	cmp r0, 0xA
	bne _080531C4
	ldr r0, _080531E0 @ =c3_08054588
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080531E4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0xC]
_080531C4:
	ldr r1, [r4]
	adds r3, r1, 0
	adds r3, 0xE0
	movs r6, 0
	ldrsh r0, [r3, r6]
	movs r2, 0x9E
	lsls r2, 1
	cmp r0, r2
	bgt _080531D8
	b _08053774
_080531D8:
	strh r2, [r3]
	b _08053708
	.align 2, 0
_080531DC: .4byte gUnknown_2031DAC
_080531E0: .4byte c3_08054588
_080531E4: .4byte gTasks
_080531E8:
	ldr r0, [r7]
	adds r0, 0x90
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08053220 @ =gSprites
	adds r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r3, [r7]
	adds r2, r3, 0
	adds r2, 0x94
	ldrh r0, [r2]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r2]
	str r1, [r3, 0x64]
	b _08053774
	.align 2, 0
_08053220: .4byte gSprites
_08053224:
	ldr r0, _08053244 @ =c3_08054588
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _08053234
	b _08053774
_08053234:
	ldr r0, _08053248 @ =gUnknown_2031DAC
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x94
	movs r0, 0x2E
	strh r0, [r1]
	str r3, [r2, 0x64]
	b _08053774
	.align 2, 0
_08053244: .4byte c3_08054588
_08053248: .4byte gUnknown_2031DAC
_0805324C:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0xA
	beq _0805325A
	b _08053774
_0805325A:
	b _08053708
_0805325C:
	ldr r1, [r7]
	adds r5, r1, 0
	adds r5, 0xE0
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	asrs r0, 16
	movs r6, 0xAE
	lsls r6, 1
	cmp r0, r6
	bgt _08053276
	b _08053774
_08053276:
	strh r6, [r5]
	b _08053708
_0805327A:
	ldr r0, _08053298 @ =gUnknown_826CF30
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r2, _0805329C @ =gUnknown_2031DAC
	ldr r1, [r2]
	adds r1, 0x91
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0x94
	movs r1, 0x32
	strh r1, [r0]
	b _08053774
	.align 2, 0
_08053298: .4byte gUnknown_826CF30
_0805329C: .4byte gUnknown_2031DAC
_080532A0:
	ldr r2, _080532DC @ =gSprites
	ldr r0, [r7]
	adds r0, 0x91
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _080532BE
	b _08053774
_080532BE:
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x6
	bl sub_8050968
	ldr r1, [r7]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x98
	bl PlaySE
	b _08053774
	.align 2, 0
_080532DC: .4byte gSprites
_080532E0:
	ldr r1, [r7]
	adds r2, r1, 0
	adds r2, 0xEA
	ldrh r3, [r2]
	ldr r0, _080532F8 @ =0x000003ff
	cmp r3, r0
	bhi _080532FC
	adds r0, r3, 0
	adds r0, 0x34
	strh r0, [r2]
	b _0805330A
	.align 2, 0
_080532F8: .4byte 0x000003ff
_080532FC:
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r2]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0805330A:
	ldr r4, [r7]
_0805330C:
	adds r0, r4, 0
	adds r0, 0xEA
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	adds r4, 0xE8
	strh r0, [r4]
	b _08053774
_08053320:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0805333C @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x3C
	strh r1, [r0]
	b _08053774
	.align 2, 0
_0805333C: .4byte gUnknown_2031DAC
_08053340:
	ldr r4, _08053364 @ =gPaletteFade
	ldrb r1, [r4, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0805334E
	b _08053774
_0805334E:
	movs r0, 0x5
	bl sub_8050968
	movs r0, 0x7
	bl sub_8050968
	ldrb r0, [r4, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4, 0x8]
	b _08053704
	.align 2, 0
_08053364: .4byte gPaletteFade
_08053368:
	ldr r2, _08053380 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _08053700
	.align 2, 0
_08053380: .4byte gPaletteFade
_08053384:
	movs r1, 0xA2
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r0, _080533A0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0805339C
	b _08053774
_0805339C:
	b _08053704
	.align 2, 0
_080533A0: .4byte gPaletteFade
_080533A4:
	ldr r0, _08053438 @ =gUnknown_826CDE4
	movs r2, 0x8
	negs r2, r2
	movs r1, 0x78
	movs r3, 0
	bl CreateSprite
	ldr r5, _0805343C @ =gUnknown_2031DAC
	ldr r1, [r5]
	adds r1, 0xD3
	movs r6, 0
	strb r0, [r1]
	ldr r4, _08053440 @ =gSprites
	ldr r2, [r5]
	adds r2, 0xD3
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x4A
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08053444 @ =sub_8053A0C
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, [r5]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r2, _08053448 @ =0x0000ffff
	movs r1, 0x10
	bl BlendPalettes
	ldr r2, [r5]
	adds r1, r2, 0
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	str r6, [r2, 0x64]
	b _08053774
	.align 2, 0
_08053438: .4byte gUnknown_826CDE4
_0805343C: .4byte gUnknown_2031DAC
_08053440: .4byte gSprites
_08053444: .4byte sub_8053A0C
_08053448: .4byte 0x0000ffff
_0805344C:
	ldr r2, _08053478 @ =gSprites
	ldr r0, [r7]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r1, _0805347C @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, [r7]
	b _08053708
	.align 2, 0
_08053478: .4byte gSprites
_0805347C: .4byte 0x0000ffff
_08053480:
	ldr r2, _080534BC @ =gSprites
	ldr r3, [r7]
	adds r0, r3, 0
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080534C0 @ =SpriteCallbackDummy
	cmp r1, r0
	beq _0805349E
	b _08053774
_0805349E:
	adds r0, r3, 0
	adds r0, 0xF2
	ldrh r2, [r0]
	lsls r0, r2, 3
	ldr r1, _080534C4 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _080534C8 @ =gMonSpritesGfxPtr
	ldr r1, [r1]
	ldr r1, [r1, 0x10]
	ldr r3, [r3, 0x6C]
	bl HandleLoadSpecialPokePic
	ldr r1, [r7]
	b _08053708
	.align 2, 0
_080534BC: .4byte gSprites
_080534C0: .4byte SpriteCallbackDummy
_080534C4: .4byte gMonFrontPicTable
_080534C8: .4byte gMonSpritesGfxPtr
_080534CC:
	ldr r4, _08053578 @ =gSprites
	ldr r2, [r7]
	adds r6, r2, 0
	adds r6, 0x8F
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r5, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	ldrb r0, [r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldr r3, _0805357C @ =gMonFrontPicCoords
	adds r2, 0xF2
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	adds r0, 0x3C
	strh r0, [r1, 0x22]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x24]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x26]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, [r7]
	adds r0, 0x8F
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _08053580 @ =0x000fffff
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x54
	bl CreatePokeballSpriteToReleaseMon
	ldr r0, [r7]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, [r7]
	adds r0, 0xD3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, [r7]
	b _08053708
	.align 2, 0
_08053578: .4byte gSprites
_0805357C: .4byte gMonFrontPicCoords
_08053580: .4byte 0x000fffff
_08053584:
	movs r1, 0xAA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r4, _080535B0 @ =gStringVar4
	ldr r1, _080535B4 @ =gUnknown_841E20D
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8054508
	ldr r0, _080535B8 @ =gUnknown_2031DAC
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0x94
	movs r2, 0
	movs r0, 0xA7
	b _080535EA
	.align 2, 0
_080535B0: .4byte gStringVar4
_080535B4: .4byte gUnknown_841E20D
_080535B8: .4byte gUnknown_2031DAC
_080535BC:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x3C
	bhi _080535CA
	b _08053774
_080535CA:
	adds r2, r1, 0
	adds r2, 0xF2
	ldrh r1, [r2]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _080535E0
	adds r0, r1, 0
	movs r1, 0
	bl PlayCry1
_080535E0:
	ldr r3, [r7]
	adds r1, r3, 0
	adds r1, 0x94
	movs r2, 0
	ldr r0, _080535F0 @ =0x0000010b
_080535EA:
	strh r0, [r1]
	str r2, [r3, 0x64]
	b _08053774
	.align 2, 0
_080535F0: .4byte 0x0000010b
_080535F4:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _08053600
	b _08053774
_08053600:
	ldr r0, _0805360C @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x44
	strh r1, [r0]
	b _08053774
	.align 2, 0
_0805360C: .4byte gUnknown_2031DAC
_08053610:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0xA
	bne _08053622
	ldr r0, _08053650 @ =0x00000103
	bl PlayFanfare
_08053622:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	cmp r0, 0xFA
	beq _0805362C
	b _08053774
_0805362C:
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r1]
	ldr r4, _08053654 @ =gStringVar4
	ldr r1, _08053658 @ =gUnknown_841E21E
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8054508
	ldr r0, [r7]
	str r5, [r0, 0x64]
	b _08053774
	.align 2, 0
_08053650: .4byte 0x00000103
_08053654: .4byte gStringVar4
_08053658: .4byte gUnknown_841E21E
_0805365C:
	ldr r1, [r7]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x3C
	beq _0805366A
	b _08053774
_0805366A:
	b _08053708
_0805366C:
	bl sub_80544AC
	b _08053704
_08053672:
	ldr r2, [r7]
	adds r0, r2, 0
	adds r0, 0xEE
	ldrb r0, [r0]
	cmp r0, 0
	beq _08053682
	movs r0, 0x1
	b _08053776
_08053682:
	ldr r0, _08053694 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08053774
	adds r1, r2, 0
	b _08053708
	.align 2, 0
_08053694: .4byte gMain
_08053698:
	ldr r0, _080536DC @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	movs r1, 0
	bl sub_805080C
	ldr r1, _080536E0 @ =gCB2_AfterEvolution
	ldr r0, _080536E4 @ =sub_8050948
	str r0, [r1]
	ldr r7, _080536E8 @ =gUnknown_2031DA4
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080536EC @ =gPlayerParty
	adds r0, r5
	movs r1, 0x1
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08053704
	ldrb r3, [r7]
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	ldr r1, _080536F0 @ =gUnknown_2031DAC
	ldr r1, [r1]
	adds r1, 0x8F
	ldrb r2, [r1]
	adds r1, r4, 0
	bl TradeEvolutionScene
	b _08053704
	.align 2, 0
_080536DC: .4byte gSpecialVar_0x8005
_080536E0: .4byte gCB2_AfterEvolution
_080536E4: .4byte sub_8050948
_080536E8: .4byte gUnknown_2031DA4
_080536EC: .4byte gPlayerParty
_080536F0: .4byte gUnknown_2031DAC
_080536F4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_08053700:
	bl BeginNormalPaletteFade
_08053704:
	ldr r0, _08053714 @ =gUnknown_2031DAC
	ldr r1, [r0]
_08053708:
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08053774
	.align 2, 0
_08053714: .4byte gUnknown_2031DAC
_08053718:
	ldr r0, _08053780 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08053774
	ldr r0, [r7]
	adds r0, 0xF4
	ldrh r0, [r0]
	bl PlayNewMapMusic
	ldr r0, [r7]
	cmp r0, 0
	beq _08053766
	bl FreeAllWindowBuffers
	movs r0, 0x3
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0
	bl GetBgTilemapBuffer
	bl Free
	bl FreeMonSpritesGfx
	ldr r0, [r7]
	bl Free
	str r4, [r7]
_08053766:
	ldr r0, _08053784 @ =CB2_ReturnToField
	bl SetMainCallback2
	bl sub_8053AE4
	bl HelpSystem_Enable
_08053774:
	movs r0, 0
_08053776:
	add sp, 0x10
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08053780: .4byte gPaletteFade
_08053784: .4byte CB2_ReturnToField
	thumb_func_end sub_805232C

	thumb_func_start sub_8053788
sub_8053788: @ 8053788
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080537A4 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _080537A8
	cmp r0, 0x4
	beq _080537B8
	b _08053814
	.align 2, 0
_080537A4: .4byte gMain
_080537A8:
	movs r0, 0x4
	strb r0, [r1]
	ldr r1, _080537B4 @ =gSoftResetDisabled
	movs r0, 0x1
	b _08053812
	.align 2, 0
_080537B4: .4byte gSoftResetDisabled
_080537B8:
	ldr r0, _080537F4 @ =gCB2_AfterEvolution
	ldr r1, _080537F8 @ =sub_8053E8C
	mov r8, r1
	str r1, [r0]
	ldr r7, _080537FC @ =gUnknown_2031DA4
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08053800 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x1
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08053808
	ldrb r3, [r7]
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	ldr r1, _08053804 @ =gUnknown_2031DAC
	ldr r1, [r1]
	adds r1, 0x8F
	ldrb r2, [r1]
	adds r1, r4, 0
	bl TradeEvolutionScene
	b _0805380E
	.align 2, 0
_080537F4: .4byte gCB2_AfterEvolution
_080537F8: .4byte sub_8053E8C
_080537FC: .4byte gUnknown_2031DA4
_08053800: .4byte gPlayerParty
_08053804: .4byte gUnknown_2031DAC
_08053808:
	mov r0, r8
	bl SetMainCallback2
_0805380E:
	ldr r1, _08053838 @ =gUnknown_2031DA4
	movs r0, 0xFF
_08053812:
	strb r0, [r1]
_08053814:
	bl HasLinkErrorOccurred
	lsls r0, 24
	cmp r0, 0
	bne _08053822
	bl RunTasks
_08053822:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053838: .4byte gUnknown_2031DA4
	thumb_func_end sub_8053788

	thumb_func_start sub_805383C
sub_805383C: @ 805383C
	push {r4-r6,lr}
	bl sub_804FFC4
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0x1
	adds r0, r5, 0
	ands r0, r6
	cmp r0, 0
	beq _0805387A
	ldr r4, _080538A8 @ =gBlockRecvBuffer
	ldrh r1, [r4]
	ldr r0, _080538AC @ =0x0000dcba
	cmp r1, r0
	bne _08053864
	ldr r0, _080538B0 @ =sub_8053788
	bl SetMainCallback2
_08053864:
	ldrh r1, [r4]
	ldr r0, _080538B4 @ =0x0000abcd
	cmp r1, r0
	bne _08053874
	ldr r0, _080538B8 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x72
	strb r6, [r0]
_08053874:
	movs r0, 0
	bl ResetBlockReceivedFlag
_0805387A:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080538A2
	ldr r0, _080538A8 @ =gBlockRecvBuffer
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _080538B4 @ =0x0000abcd
	cmp r1, r0
	bne _0805389C
	ldr r0, _080538B8 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x73
	movs r1, 0x1
	strb r1, [r0]
_0805389C:
	movs r0, 0x1
	bl ResetBlockReceivedFlag
_080538A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080538A8: .4byte gBlockRecvBuffer
_080538AC: .4byte 0x0000dcba
_080538B0: .4byte sub_8053788
_080538B4: .4byte 0x0000abcd
_080538B8: .4byte gUnknown_2031DAC
	thumb_func_end sub_805383C

	thumb_func_start sub_80538BC
sub_80538BC: @ 80538BC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	ldrh r4, [r5, 0x22]
	adds r4, r0
	strh r4, [r5, 0x22]
	ldrh r0, [r5, 0x30]
	ldrh r2, [r5, 0x38]
	adds r0, r2
	strh r0, [r5, 0x38]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r5, 0x20]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0x4C
	ble _0805390A
	movs r0, 0x4C
	strh r0, [r5, 0x22]
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	muls r0, r1
	negs r0, r0
	movs r1, 0x64
	bl __divsi3
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
_0805390A:
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	cmp r0, 0x78
	bne _08053916
	movs r0, 0
	strh r0, [r5, 0x30]
_08053916:
	ldrh r0, [r5, 0x36]
	ldrh r2, [r5, 0x2E]
	adds r0, r2
	strh r0, [r5, 0x2E]
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bne _0805392E
	movs r0, 0x1
	strh r0, [r5, 0x3C]
	ldr r0, _08053934 @ =SpriteCallbackDummy
	str r0, [r5, 0x1C]
_0805392E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053934: .4byte SpriteCallbackDummy
	thumb_func_end sub_80538BC

	thumb_func_start sub_8053938
sub_8053938: @ 8053938
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _080539A0 @ =gUnknown_826D1E4
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x16
	bne _08053960
	movs r0, 0x31
	bl PlaySE
_08053960:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2C
	bne _08053996
	movs r0, 0x85
	bl PlaySE
	ldr r0, _080539A4 @ =sub_80539AC
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0x1
	negs r1, r1
	ldr r2, _080539A8 @ =0x0000ffff
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08053996:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080539A0: .4byte gUnknown_826D1E4
_080539A4: .4byte sub_80539AC
_080539A8: .4byte 0x0000ffff
	thumb_func_end sub_8053938

	thumb_func_start sub_80539AC
sub_80539AC: @ 80539AC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	bne _080539C0
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080539C0:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080539FE
	ldr r1, _08053A04 @ =gUnknown_826D1E4
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	bne _080539FE
	adds r0, r4, 0
	bl DestroySprite
	ldr r0, _08053A08 @ =gUnknown_2031DAC
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0xE
	strh r1, [r0]
_080539FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053A04: .4byte gUnknown_826D1E4
_08053A08: .4byte gUnknown_2031DAC
	thumb_func_end sub_80539AC

	thumb_func_start sub_8053A0C
sub_8053A0C: @ 8053A0C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08053A3C
	ldrh r0, [r4, 0x22]
	adds r0, 0x4
	strh r0, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _08053A8C
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0x16
	strh r0, [r4, 0x2E]
	movs r0, 0x31
	bl PlaySE
	b _08053A8C
_08053A3C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x42
	bne _08053A4A
	movs r0, 0x32
	bl PlaySE
_08053A4A:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x5C
	bne _08053A58
	movs r0, 0x33
	bl PlaySE
_08053A58:
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r0, 0x6B
	bne _08053A66
	movs r0, 0x34
	bl PlaySE
_08053A66:
	ldr r1, _08053A94 @ =gUnknown_826D1E4
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r3, [r4, 0x26]
	adds r0, r3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6C
	bne _08053A8C
	ldr r0, _08053A98 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_08053A8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053A94: .4byte gUnknown_826D1E4
_08053A98: .4byte SpriteCallbackDummy
	thumb_func_end sub_8053A0C

	thumb_func_start GetInGameTradeSpeciesInfo
GetInGameTradeSpeciesInfo: @ 8053A9C
	push {r4-r6,lr}
	ldr r0, _08053AD0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _08053AD4 @ =gIngameTrades
	adds r4, r0
	ldr r0, _08053AD8 @ =gStringVar1
	ldrh r1, [r4, 0x38]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _08053ADC @ =gSpeciesNames
	adds r1, r5
	bl StringCopy
	ldr r0, _08053AE0 @ =gStringVar2
	ldrh r1, [r4, 0xC]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldrh r0, [r4, 0x38]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08053AD0: .4byte gSpecialVar_0x8004
_08053AD4: .4byte gIngameTrades
_08053AD8: .4byte gStringVar1
_08053ADC: .4byte gSpeciesNames
_08053AE0: .4byte gStringVar2
	thumb_func_end GetInGameTradeSpeciesInfo

	thumb_func_start sub_8053AE4
sub_8053AE4: @ 8053AE4
	push {r4,lr}
	sub sp, 0x20
	ldr r0, _08053B2C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _08053B30 @ =gIngameTrades
	adds r4, r0
	ldr r0, _08053B34 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08053B38 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _08053B3C @ =gStringVar1
	mov r1, sp
	bl StringCopy10
	ldr r0, _08053B40 @ =gStringVar2
	ldrh r2, [r4, 0xC]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _08053B44 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	add sp, 0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053B2C: .4byte gSpecialVar_0x8004
_08053B30: .4byte gIngameTrades
_08053B34: .4byte gSpecialVar_0x8005
_08053B38: .4byte gPlayerParty
_08053B3C: .4byte gStringVar1
_08053B40: .4byte gStringVar2
_08053B44: .4byte gSpeciesNames
	thumb_func_end sub_8053AE4

	thumb_func_start sub_8053B48
sub_8053B48: @ 8053B48
	push {r4-r7,lr}
	sub sp, 0x38
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r1, 4
	subs r2, r1
	lsls r2, 2
	ldr r1, _08053CA4 @ =gIngameTrades
	adds r5, r2, r1
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08053CA8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	add r4, sp, 0x34
	movs r0, 0xFE
	strb r0, [r4]
	ldr r6, _08053CAC @ =gEnemyParty
	ldrh r1, [r5, 0xC]
	movs r3, 0x1
	str r3, [sp]
	ldr r0, [r5, 0x24]
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	ldr r0, [r5, 0x18]
	str r0, [sp, 0xC]
	adds r0, r6, 0
	movs r3, 0x20
	bl CreateMon
	adds r2, r5, 0
	adds r2, 0xE
	adds r0, r6, 0
	movs r1, 0x27
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xF
	adds r0, r6, 0
	movs r1, 0x28
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x10
	adds r0, r6, 0
	movs r1, 0x29
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x11
	adds r0, r6, 0
	movs r1, 0x2A
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x12
	adds r0, r6, 0
	movs r1, 0x2B
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x13
	adds r0, r6, 0
	movs r1, 0x2C
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x2B
	adds r0, r6, 0
	movs r1, 0x7
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x36
	adds r0, r6, 0
	movs r1, 0x31
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x14
	adds r0, r6, 0
	movs r1, 0x2E
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1D
	adds r0, r6, 0
	movs r1, 0x17
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1E
	adds r0, r6, 0
	movs r1, 0x18
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1C
	adds r0, r6, 0
	movs r1, 0x16
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1F
	adds r0, r6, 0
	movs r1, 0x21
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x20
	adds r0, r6, 0
	movs r1, 0x2F
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x37
	adds r0, r6, 0
	movs r1, 0x30
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x23
	adds r2, r4, 0
	bl SetMonData
	mov r4, sp
	adds r4, 0x35
	movs r0, 0
	strb r0, [r4]
	ldrh r0, [r5, 0x28]
	cmp r0, 0
	beq _08053CC0
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _08053CB4
	add r0, sp, 0x10
	adds r1, r5, 0
	bl sub_8053CD4
	ldr r0, _08053CB0 @ =gUnknown_2031CCC
	add r1, sp, 0x10
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	adds r0, r6, 0
	movs r1, 0x40
	adds r2, r4, 0
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x28
	adds r0, r6, 0
	movs r1, 0xC
	bl SetMonData
	b _08053CC0
	.align 2, 0
_08053CA4: .4byte gIngameTrades
_08053CA8: .4byte gPlayerParty
_08053CAC: .4byte gEnemyParty
_08053CB0: .4byte gUnknown_2031CCC
_08053CB4:
	adds r2, r5, 0
	adds r2, 0x28
	adds r0, r6, 0
	movs r1, 0xC
	bl SetMonData
_08053CC0:
	ldr r0, _08053CD0 @ =gEnemyParty
	bl CalculateMonStats
	add sp, 0x38
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053CD0: .4byte gEnemyParty
	thumb_func_end sub_8053B48

	thumb_func_start sub_8053CD4
sub_8053CD4: @ 8053CD4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r2, _08053D28 @ =gUnknown_826D1A8
	adds r0, r5, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	adds r1, r4, 0
	movs r3, 0x8
_08053CEE:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _08053CEE
	adds r0, r4, 0
	adds r0, 0x12
	adds r1, r5, 0
	adds r1, 0x2B
	bl StringCopy
	ldr r1, [r5, 0x18]
	lsrs r0, r1, 24
	strb r0, [r4, 0x1A]
	lsrs r0, r1, 16
	strb r0, [r4, 0x1B]
	lsrs r0, r1, 8
	strb r0, [r4, 0x1C]
	strb r1, [r4, 0x1D]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x1E]
	ldrh r0, [r5, 0x28]
	strh r0, [r4, 0x20]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053D28: .4byte gUnknown_826D1A8
	thumb_func_end sub_8053CD4

	thumb_func_start GetTradeSpecies
GetTradeSpecies: @ 8053D2C
	push {r4-r6,lr}
	ldr r6, _08053D58 @ =gSpecialVar_0x8005
	ldrh r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08053D5C @ =gPlayerParty
	adds r0, r4
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08053D60
	ldrh r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	b _08053D62
	.align 2, 0
_08053D58: .4byte gSpecialVar_0x8005
_08053D5C: .4byte gPlayerParty
_08053D60:
	movs r0, 0
_08053D62:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetTradeSpecies

	thumb_func_start CreateInGameTradePokemon
CreateInGameTradePokemon: @ 8053D68
	push {lr}
	ldr r0, _08053D7C @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r1, _08053D80 @ =gSpecialVar_0x8004
	ldrb r1, [r1]
	bl sub_8053B48
	pop {r0}
	bx r0
	.align 2, 0
_08053D7C: .4byte gSpecialVar_0x8005
_08053D80: .4byte gSpecialVar_0x8004
	thumb_func_end CreateInGameTradePokemon

	thumb_func_start sub_8053D84
sub_8053D84: @ 8053D84
	push {r4-r6,lr}
	bl sub_8050F14
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bne _08053DE6
	ldr r5, _08053E08 @ =gUnknown_2031DAC
	ldr r0, [r5]
	adds r0, 0x8E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08053E0C @ =gSprites
	adds r0, r4
	bl DestroySprite
	ldr r0, [r5]
	adds r0, 0x8F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, _08053E10 @ =gUnknown_2031DA4
	ldrb r4, [r0]
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805080C
	ldr r0, [r5]
	adds r2, r0, 0
	adds r2, 0x74
	ldr r1, _08053E14 @ =0x0000abcd
	strh r1, [r2]
	adds r0, 0x93
	strb r6, [r0]
	ldr r0, _08053E18 @ =sub_8053E1C
	bl SetMainCallback2
_08053DE6:
	bl sub_80508F4
	bl sub_805383C
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053E08: .4byte gUnknown_2031DAC
_08053E0C: .4byte gSprites
_08053E10: .4byte gUnknown_2031DA4
_08053E14: .4byte 0x0000abcd
_08053E18: .4byte sub_8053E1C
	thumb_func_end sub_8053D84

	thumb_func_start sub_8053E1C
sub_8053E1C: @ 8053E1C
	push {r4,lr}
	bl sub_804FFC4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_805383C
	cmp r4, 0
	bne _08053E68
	ldr r4, _08053E80 @ =gUnknown_2031DAC
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x72
	ldrh r1, [r0]
	ldr r0, _08053E84 @ =0x00000101
	cmp r1, r0
	bne _08053E68
	adds r1, r2, 0
	adds r1, 0x74
	ldr r0, _08053E88 @ =0x0000dcba
	strh r0, [r1]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x74
	movs r2, 0x14
	bl SendBlock
	ldr r0, [r4]
	adds r0, 0x72
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x73
	strb r1, [r0]
_08053E68:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053E80: .4byte gUnknown_2031DAC
_08053E84: .4byte 0x00000101
_08053E88: .4byte 0x0000dcba
	thumb_func_end sub_8053E1C

	thumb_func_start sub_8053E8C
sub_8053E8C: @ 8053E8C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _08053EAC @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x65
	bls _08053EA2
	b _08054396
_08053EA2:
	lsls r0, 2
	ldr r1, _08053EB0 @ =_08053EB4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08053EAC: .4byte gMain
_08053EB0: .4byte _08053EB4
	.align 2, 0
_08053EB4:
	.4byte _0805404C
	.4byte _08054068
	.4byte _080540DC
	.4byte _08054396
	.4byte _080541E0
	.4byte _080542A0
	.4byte _080542C4
	.4byte _080542E0
	.4byte _08054304
	.4byte _0805434C
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054204
	.4byte _08054254
	.4byte _0805427E
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054104
	.4byte _08054184
	.4byte _080541A0
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054396
	.4byte _08054080
	.4byte _080540BC
_0805404C:
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r4, _08054060 @ =gStringVar4
	ldr r1, _08054064 @ =gUnknown_841E325
	b _080540EA
	.align 2, 0
_08054060: .4byte gStringVar4
_08054064: .4byte gUnknown_841E325
_08054068:
	bl sub_800AB9C
	ldr r0, _0805407C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x64
	b _080541F0
	.align 2, 0
_0805407C: .4byte gMain
_08054080:
	ldr r0, _080540B4 @ =gUnknown_2031DAC
	ldr r3, [r0]
	ldr r0, [r3, 0x64]
	adds r0, 0x1
	str r0, [r3, 0x64]
	cmp r0, 0xB4
	bls _0805409C
	movs r1, 0x87
	lsls r1, 3
	adds r0, r2, r1
	movs r2, 0
	movs r1, 0x65
	strb r1, [r0]
	str r2, [r3, 0x64]
_0805409C:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _080540A8
	b _08054396
_080540A8:
	ldr r0, _080540B8 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r2
	b _080540D0
	.align 2, 0
_080540B4: .4byte gUnknown_2031DAC
_080540B8: .4byte gMain
_080540BC:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _080540C8
	b _08054396
_080540C8:
	ldr r0, _080540D8 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
_080540D0:
	movs r1, 0x2
	strb r1, [r0]
	b _08054396
	.align 2, 0
_080540D8: .4byte gMain
_080540DC:
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
	movs r0, 0x32
	strb r0, [r1]
	ldr r4, _080540FC @ =gStringVar4
	ldr r1, _08054100 @ =gText_SavingDontTurnOffThePower2
_080540EA:
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8054508
	b _08054396
	.align 2, 0
_080540FC: .4byte gStringVar4
_08054100: .4byte gText_SavingDontTurnOffThePower2
_08054104:
	bl InUnionRoom
	cmp r0, 0
	beq _08054120
	ldr r0, _0805411C @ =gUnknown_2031DAC
	ldr r1, [r0]
	adds r1, 0xF8
	movs r0, 0x12
	bl sub_8113550
	b _08054132
	.align 2, 0
_0805411C: .4byte gUnknown_2031DAC
_08054120:
	ldr r0, _08054174 @ =gUnknown_2031DAC
	ldr r1, [r0]
	adds r1, 0xF8
	movs r0, 0xC
	bl sub_8113550
	movs r0, 0x15
	bl IncrementGameStat
_08054132:
	ldr r0, _08054178 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805415A
	ldr r4, _0805417C @ =gLinkPlayers
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, 0x4
	adds r1, r4
	ldr r1, [r1]
	movs r0, 0x2
	bl sub_8144714
_0805415A:
	bl sub_804C1C0
	bl sub_80DA3AC
	ldr r1, _08054180 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	b _080541F2
	.align 2, 0
_08054174: .4byte gUnknown_2031DAC
_08054178: .4byte gWirelessCommType
_0805417C: .4byte gLinkPlayers
_08054180: .4byte gMain
_08054184:
	ldr r0, _0805419C @ =gUnknown_2031DAC
	ldr r1, [r0]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x5
	beq _08054194
	b _08054396
_08054194:
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
	b _08054340
	.align 2, 0
_0805419C: .4byte gUnknown_2031DAC
_080541A0:
	bl sub_80DA3D8
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080541C4
	bl sav2_gender2_inplace_and_xFE
	ldr r0, _080541C0 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	b _08054396
	.align 2, 0
_080541C0: .4byte gMain
_080541C4:
	ldr r0, _080541D8 @ =gUnknown_2031DAC
	ldr r0, [r0]
	str r1, [r0, 0x64]
	ldr r0, _080541DC @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r2
	movs r1, 0x33
	strb r1, [r0]
	b _08054396
	.align 2, 0
_080541D8: .4byte gUnknown_2031DAC
_080541DC: .4byte gMain
_080541E0:
	bl sub_80DA40C
	ldr r0, _080541FC @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x28
_080541F0:
	strb r1, [r0]
_080541F2:
	ldr r0, _08054200 @ =gUnknown_2031DAC
	ldr r0, [r0]
	str r2, [r0, 0x64]
	b _08054396
	.align 2, 0
_080541FC: .4byte gMain
_08054200: .4byte gUnknown_2031DAC
_08054204:
	ldr r4, _08054238 @ =gUnknown_2031DAC
	ldr r1, [r4]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x32
	bhi _08054214
	b _08054396
_08054214:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _0805423C
	bl Random
	ldr r4, [r4]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1E
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [r4, 0x64]
	b _08054242
	.align 2, 0
_08054238: .4byte gUnknown_2031DAC
_0805423C:
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x64]
_08054242:
	ldr r0, _08054250 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r2
	movs r1, 0x29
	strb r1, [r0]
	b _08054396
	.align 2, 0
_08054250: .4byte gMain
_08054254:
	ldr r0, _08054270 @ =gUnknown_2031DAC
	ldr r1, [r0]
	ldr r0, [r1, 0x64]
	cmp r0, 0
	bne _08054278
	bl sub_800AB9C
	ldr r0, _08054274 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x2A
	strb r1, [r0]
	b _08054396
	.align 2, 0
_08054270: .4byte gUnknown_2031DAC
_08054274: .4byte gMain
_08054278:
	subs r0, 0x1
	str r0, [r1, 0x64]
	b _08054396
_0805427E:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _0805428A
	b _08054396
_0805428A:
	bl sub_80DA434
	ldr r0, _0805429C @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0]
	b _08054396
	.align 2, 0
_0805429C: .4byte gMain
_080542A0:
	ldr r0, _080542C0 @ =gUnknown_2031DAC
	ldr r1, [r0]
	ldr r0, [r1, 0x64]
	adds r0, 0x1
	str r0, [r1, 0x64]
	cmp r0, 0x3C
	bls _08054396
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_800AB9C
	b _08054396
	.align 2, 0
_080542C0: .4byte gUnknown_2031DAC
_080542C4:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08054396
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08054338
_080542E0:
	ldr r0, _080542FC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08054396
	movs r0, 0x3
	bl FadeOutBGM
	ldr r1, _08054300 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _08054340
	.align 2, 0
_080542FC: .4byte gPaletteFade
_08054300: .4byte gMain
_08054304:
	bl IsBGMStopped
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08054396
	ldr r0, _08054328 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08054334
	ldr r0, _0805432C @ =gMain
	ldr r1, [r0, 0x8]
	ldr r0, _08054330 @ =sub_804C718
	cmp r1, r0
	bne _08054334
	bl sub_800AB9C
	b _08054338
	.align 2, 0
_08054328: .4byte gWirelessCommType
_0805432C: .4byte gMain
_08054330: .4byte sub_804C718
_08054334:
	bl sub_800AAC0
_08054338:
	ldr r1, _08054348 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
_08054340:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08054396
	.align 2, 0
_08054348: .4byte gMain
_0805434C:
	ldr r0, _08054374 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08054384
	ldr r1, [r2, 0x8]
	ldr r0, _08054378 @ =sub_804C718
	cmp r1, r0
	bne _08054384
	bl IsLinkRfuTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08054396
	ldr r0, _0805437C @ =gSoftResetDisabled
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08054380 @ =sub_80543C4
	bl SetMainCallback2
	b _08054396
	.align 2, 0
_08054374: .4byte gWirelessCommType
_08054378: .4byte sub_804C718
_0805437C: .4byte gSoftResetDisabled
_08054380: .4byte sub_80543C4
_08054384:
	ldr r0, _080543B8 @ =gReceivedRemoteLinkPlayers
	ldrb r1, [r0]
	cmp r1, 0
	bne _08054396
	ldr r0, _080543BC @ =gSoftResetDisabled
	strb r1, [r0]
	ldr r0, _080543C0 @ =sub_80543C4
	bl SetMainCallback2
_08054396:
	bl HasLinkErrorOccurred
	lsls r0, 24
	cmp r0, 0
	bne _080543A4
	bl RunTasks
_080543A4:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080543B8: .4byte gReceivedRemoteLinkPlayers
_080543BC: .4byte gSoftResetDisabled
_080543C0: .4byte sub_80543C4
	thumb_func_end sub_8053E8C

	thumb_func_start sub_80543C4
sub_80543C4: @ 80543C4
	push {r4,r5,lr}
	ldr r0, _08054430 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0805441A
	bl FreeAllWindowBuffers
	movs r0, 0x3
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0x1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, 0
	bl GetBgTilemapBuffer
	bl Free
	bl FreeMonSpritesGfx
	ldr r4, _08054434 @ =gUnknown_2031DAC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r0, _08054438 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08054412
	bl DestroyWirelessStatusIndicatorSprite
_08054412:
	ldr r0, _0805443C @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0805441A:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08054430: .4byte gPaletteFade
_08054434: .4byte gUnknown_2031DAC
_08054438: .4byte gWirelessCommType
_0805443C: .4byte gMain
	thumb_func_end sub_80543C4

	thumb_func_start DoInGameTradeScene
DoInGameTradeScene: @ 8054440
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _0805446C @ =sub_8054470
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl HelpSystem_Disable
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805446C: .4byte sub_8054470
	thumb_func_end DoInGameTradeScene

	thumb_func_start sub_8054470
sub_8054470: @ 8054470
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0805449C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08054494
	ldr r0, _080544A0 @ =sub_80505CC
	bl SetMainCallback2
	ldr r1, _080544A4 @ =gFieldCallback
	ldr r0, _080544A8 @ =FieldCallback_ReturnToEventScript2
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_08054494:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805449C: .4byte gPaletteFade
_080544A0: .4byte sub_80505CC
_080544A4: .4byte gFieldCallback
_080544A8: .4byte FieldCallback_ReturnToEventScript2
	thumb_func_end sub_8054470

	thumb_func_start sub_80544AC
sub_80544AC: @ 80544AC
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0
_080544B2:
	ldr r0, _080544F0 @ =gUnknown_2031DA4
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080544F4 @ =gEnemyParty
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x43
	bl GetMonData
	adds r0, r5, r0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _080544B2
	cmp r5, 0
	beq _080544EA
	ldr r0, _080544F8 @ =0x0000083b
	bl FlagSet
_080544EA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080544F0: .4byte gUnknown_2031DA4
_080544F4: .4byte gEnemyParty
_080544F8: .4byte 0x0000083b
	thumb_func_end sub_80544AC

	thumb_func_start sub_80544FC
sub_80544FC: @ 80544FC
	push {lr}
	bl sub_80504CC
	pop {r0}
	bx r0
	thumb_func_end sub_80544FC

	thumb_func_start sub_8054508
sub_8054508: @ 8054508
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r5, r0, 0
	mov r8, r1
	adds r4, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r2, _08054580 @ =gUnknown_2031DAC
	ldr r1, [r2]
	movs r6, 0x82
	lsls r6, 1
	adds r1, r6
	movs r3, 0
	movs r0, 0xF
	strb r0, [r1]
	ldr r0, [r2]
	ldr r7, _08054584 @ =0x00000105
	adds r1, r0, r7
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r7, 0x1
	adds r1, r0, r7
	movs r0, 0x6
	strb r0, [r1]
	str r3, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	ldr r0, [r2]
	adds r0, r6
	str r0, [sp, 0x8]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	mov r0, r8
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl AddTextPrinterParameterized4
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054580: .4byte gUnknown_2031DAC
_08054584: .4byte 0x00000105
	thumb_func_end sub_8054508

	thumb_func_start c3_08054588
c3_08054588: @ 8054588
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080545C0 @ =gTasks+0x8
	adds r4, r0, r1
	ldr r1, _080545C4 @ =gUnknown_826D250
	movs r2, 0
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r2, r1, 0
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080545CC
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	beq _080545D4
	lsls r0, r1, 1
	ldr r1, _080545C8 @ =gUnknown_826BB5C
	adds r0, r1
	b _080545D6
	.align 2, 0
_080545C0: .4byte gTasks+0x8
_080545C4: .4byte gUnknown_826D250
_080545C8: .4byte gUnknown_826BB5C
_080545CC:
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bne _080545E4
_080545D4:
	ldr r0, _080545E0 @ =gUnknown_826BF5C
_080545D6:
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	b _080545F2
	.align 2, 0
_080545E0: .4byte gUnknown_826BF5C
_080545E4:
	lsls r0, r2, 1
	ldr r1, _08054648 @ =gUnknown_826BD5C
	adds r0, r1
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
_080545F2:
	ldr r0, _0805464C @ =gUnknown_826D250
	movs r2, 0
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _08054610
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _08054610
	movs r0, 0xBC
	bl PlaySE
_08054610:
	movs r0, 0x2
	ldrsh r2, [r4, r0]
	ldr r1, _0805464C @ =gUnknown_826D250
	movs r3, 0
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	bne _08054650
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r2, 0
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08054656
	adds r0, r5, 0
	bl DestroyTask
	b _08054656
	.align 2, 0
_08054648: .4byte gUnknown_826BD5C
_0805464C: .4byte gUnknown_826D250
_08054650:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
_08054656:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end c3_08054588

	thumb_func_start c3_0805465C
c3_0805465C: @ 805465C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08054728 @ =gTasks+0x8
	adds r7, r0, r1
	movs r0, 0
	ldrsh r4, [r7, r0]
	cmp r4, 0
	bne _080546BC
	ldr r1, _0805472C @ =gUnknown_2031DAC
	ldr r3, [r1]
	ldr r5, _08054730 @ =0x0000010b
	adds r2, r3, r5
	movs r0, 0x78
	strb r0, [r2]
	subs r5, 0x2
	adds r2, r3, r5
	strb r0, [r2]
	ldr r0, [r1]
	movs r2, 0x85
	lsls r2, 1
	adds r0, r2
	strb r4, [r0]
	ldr r0, [r1]
	movs r3, 0x86
	lsls r3, 1
	adds r0, r3
	movs r1, 0xA0
	strb r1, [r0]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x4A
	movs r1, 0x10
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x13
	bl SetGpuReg
_080546BC:
	ldr r4, _0805472C @ =gUnknown_2031DAC
	ldr r2, [r4]
	ldr r5, _08054730 @ =0x0000010b
	mov r8, r5
	adds r0, r2, r5
	ldrb r1, [r0]
	subs r5, 0x2
	adds r2, r5
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0x40
	bl SetGpuReg
	ldr r2, [r4]
	movs r1, 0x86
	lsls r1, 1
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r3, 0x85
	lsls r3, 1
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0x44
	bl SetGpuReg
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	subs r0, 0x5
	strb r0, [r1]
	ldr r1, [r4]
	add r1, r8
	ldrb r0, [r1]
	adds r0, 0x5
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x4F
	bhi _0805471E
	adds r0, r6, 0
	bl DestroyTask
_0805471E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054728: .4byte gTasks+0x8
_0805472C: .4byte gUnknown_2031DAC
_08054730: .4byte 0x0000010b
	thumb_func_end c3_0805465C

	thumb_func_start sub_8054734
sub_8054734: @ 8054734
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080547E8 @ =gTasks+0x8
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08054774
	ldr r1, _080547EC @ =gUnknown_2031DAC
	ldr r0, [r1]
	ldr r3, _080547F0 @ =0x00000109
	adds r2, r0, r3
	movs r0, 0x50
	strb r0, [r2]
	ldr r0, [r1]
	ldr r2, _080547F4 @ =0x0000010b
	adds r1, r0, r2
	movs r0, 0xA0
	strb r0, [r1]
	movs r0, 0x4A
	movs r1, 0x10
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x13
	bl SetGpuReg
_08054774:
	ldr r5, _080547EC @ =gUnknown_2031DAC
	ldr r0, [r5]
	ldr r3, _080547F4 @ =0x0000010b
	adds r1, r0, r3
	ldrb r1, [r1]
	ldr r4, _080547F0 @ =0x00000109
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0x40
	bl SetGpuReg
	ldr r2, [r5]
	movs r1, 0x86
	lsls r1, 1
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r3, 0x85
	lsls r3, 1
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x78
	beq _080547FC
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	ldr r0, [r5]
	adds r1, r0, r4
	ldrb r0, [r1]
	adds r0, 0x5
	strb r0, [r1]
	ldr r0, [r5]
	ldr r2, _080547F4 @ =0x0000010b
	adds r1, r0, r2
	ldrb r0, [r1]
	subs r0, 0x5
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x73
	bls _0805480C
	ldr r2, _080547F8 @ =0x0000ffff
	movs r0, 0x8
	movs r1, 0
	bl BlendPalettes
	b _0805480C
	.align 2, 0
_080547E8: .4byte gTasks+0x8
_080547EC: .4byte gUnknown_2031DAC
_080547F0: .4byte 0x00000109
_080547F4: .4byte 0x0000010b
_080547F8: .4byte 0x0000ffff
_080547FC:
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
	adds r0, r7, 0
	bl DestroyTask
_0805480C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8054734

	.align 2, 0 @ Don't pad with nop.
