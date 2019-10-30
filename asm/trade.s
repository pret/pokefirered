	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
	ldr r0, _080540B4 @ =sTradeData
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
_080540B4: .4byte sTradeData
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
	bl DrawTextOnTradeWindow
	b _08054396
	.align 2, 0
_080540FC: .4byte gStringVar4
_08054100: .4byte gText_SavingDontTurnOffThePower2
_08054104:
	bl InUnionRoom
	cmp r0, 0
	beq _08054120
	ldr r0, _0805411C @ =sTradeData
	ldr r1, [r0]
	adds r1, 0xF8
	movs r0, 0x12
	bl sub_8113550
	b _08054132
	.align 2, 0
_0805411C: .4byte sTradeData
_08054120:
	ldr r0, _08054174 @ =sTradeData
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
_08054174: .4byte sTradeData
_08054178: .4byte gWirelessCommType
_0805417C: .4byte gLinkPlayers
_08054180: .4byte gMain
_08054184:
	ldr r0, _0805419C @ =sTradeData
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
_0805419C: .4byte sTradeData
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
	ldr r0, _080541D8 @ =sTradeData
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
_080541D8: .4byte sTradeData
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
	ldr r0, _08054200 @ =sTradeData
	ldr r0, [r0]
	str r2, [r0, 0x64]
	b _08054396
	.align 2, 0
_080541FC: .4byte gMain
_08054200: .4byte sTradeData
_08054204:
	ldr r4, _08054238 @ =sTradeData
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
_08054238: .4byte sTradeData
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
	ldr r0, _08054270 @ =sTradeData
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
_08054270: .4byte sTradeData
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
	ldr r0, _080542C0 @ =sTradeData
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
_080542C0: .4byte sTradeData
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
	ldr r4, _08054434 @ =sTradeData
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
_08054434: .4byte sTradeData
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
	ldr r0, _080544A0 @ =CB2_InitTradeAnim_InGameTrade
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
_080544A0: .4byte CB2_InitTradeAnim_InGameTrade
_080544A4: .4byte gFieldCallback
_080544A8: .4byte FieldCallback_ReturnToEventScript2
	thumb_func_end sub_8054470

	thumb_func_start CheckPartnersMonForRibbons
CheckPartnersMonForRibbons: @ 80544AC
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0
_080544B2:
	ldr r0, _080544F0 @ =gSelectedTradeMonPositions
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
_080544F0: .4byte gSelectedTradeMonPositions
_080544F4: .4byte gEnemyParty
_080544F8: .4byte 0x0000083b
	thumb_func_end CheckPartnersMonForRibbons

	thumb_func_start sub_80544FC
sub_80544FC: @ 80544FC
	push {lr}
	bl TradeAnimInit_LoadGfx
	pop {r0}
	bx r0
	thumb_func_end sub_80544FC

	thumb_func_start DrawTextOnTradeWindow
DrawTextOnTradeWindow: @ 8054508
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
	ldr r2, _08054580 @ =sTradeData
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
_08054580: .4byte sTradeData
_08054584: .4byte 0x00000105
	thumb_func_end DrawTextOnTradeWindow

	thumb_func_start Task_AnimateWirelessSignal
Task_AnimateWirelessSignal: @ 8054588
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
	thumb_func_end Task_AnimateWirelessSignal

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
	ldr r1, _0805472C @ =sTradeData
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
	ldr r4, _0805472C @ =sTradeData
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
_0805472C: .4byte sTradeData
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
	ldr r1, _080547EC @ =sTradeData
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
	ldr r5, _080547EC @ =sTradeData
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
_080547EC: .4byte sTradeData
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
