	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_805232C
sub_805232C: @ 805232C
	push {r4-r7,lr}
	sub sp, 0x10
	ldr r0, _08052350 @ =sTradeData
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
_08052350: .4byte sTradeData
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
	ldr r1, _080528A0 @ =gText_XWillBeSentToY
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl DrawTextOnTradeWindow
	ldr r4, _080528A4 @ =sTradeData
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
_080528A0: .4byte gText_XWillBeSentToY
_080528A4: .4byte sTradeData
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
	bl CreateTradePokeballSprite
	ldr r1, [r7]
	adds r1, 0xD2
	strb r0, [r1]
	ldr r1, [r7]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r4, _08052914 @ =gStringVar4
	ldr r1, _08052918 @ =gText_ByeByeVar1
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl DrawTextOnTradeWindow
	bl _08053774
	.align 2, 0
_0805290C: .4byte gSprites
_08052910: .4byte 0x000fffff
_08052914: .4byte gStringVar4
_08052918: .4byte gText_ByeByeVar1
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
	ldr r0, _08052980 @ =sTradePokeballSpriteTemplate
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
	ldr r1, _08052984 @ =SpriteCB_TradePokeball_Outbound
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
_08052980: .4byte sTradePokeballSpriteTemplate
_08052984: .4byte SpriteCB_TradePokeball_Outbound
_08052988:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080529A8 @ =sTradeData
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x14
	strh r1, [r0]
	bl _08053774
	.align 2, 0
_080529A8: .4byte sTradeData
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
	bl SetTradeSequenceBgGpuRegs
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
	ldr r4, _08052A2C @ =sTradeData
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
_08052A2C: .4byte sTradeData
_08052A30:
	movs r0, 0x1
	bl SetTradeSequenceBgGpuRegs
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
	ldr r0, _08052A54 @ =sTradeData
	ldr r4, [r0]
	bl _0805330C
	.align 2, 0
_08052A54: .4byte sTradeData
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
	bl SetTradeSequenceBgGpuRegs
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
	ldr r0, _08052B04 @ =sTradeData
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x1A
	strh r1, [r0]
	bl _08053774
	.align 2, 0
_08052B00: .4byte c3_08054588
_08052B04: .4byte sTradeData
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
	ldr r4, _08052B84 @ =sTradeData
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
	ldr r1, _08052B8C @ =SpriteCB_TradeGlowWireless
	str r1, [r0]
	ldr r0, _08052B90 @ =sGlowBallSpriteTemplate
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
_08052B84: .4byte sTradeData
_08052B88: .4byte gSprites
_08052B8C: .4byte SpriteCB_TradeGlowWireless
_08052B90: .4byte sGlowBallSpriteTemplate
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
	ldr r0, _08052C38 @ =sTradeData
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x1E
	strh r1, [r0]
	bl _08053774
	.align 2, 0
_08052C38: .4byte sTradeData
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
	bl SetTradeSequenceBgGpuRegs
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
	ldr r5, _08052CCC @ =sGlowBallSpriteTemplate
	adds r0, r5, 0
	movs r1, 0x6F
	movs r2, 0xAA
	movs r3, 0
	bl CreateSprite
	ldr r4, _08052CD0 @ =sTradeData
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
_08052CCC: .4byte sGlowBallSpriteTemplate
_08052CD0: .4byte sTradeData
_08052CD4:
	ldr r0, _08052D24 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08052CF2
	movs r0, 0x28
	bl PlaySE
	ldr r0, _08052D28 @ =sTradeData
	ldr r1, [r0]
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08052CF2:
	ldr r3, _08052D2C @ =gSprites
	ldr r0, _08052D28 @ =sTradeData
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
_08052D28: .4byte sTradeData
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
	ldr r5, _08052E44 @ =sTradeData
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
_08052E44: .4byte sTradeData
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
	ldr r5, _08052EF8 @ =sTradeData
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
_08052EF8: .4byte sTradeData
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
	bl SetTradeSequenceBgGpuRegs
	ldr r0, [r7]
	adds r0, 0xE0
	movs r1, 0xA6
	strh r1, [r0]
	movs r0, 0x3
	bl SetTradeSequenceBgGpuRegs
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
	ldr r1, _080530F0 @ =SpriteCB_TradeGlowWireless
	str r1, [r0]
	ldr r0, _080530F4 @ =sGlowBallSpriteTemplate
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
_080530F0: .4byte SpriteCB_TradeGlowWireless
_080530F4: .4byte sGlowBallSpriteTemplate
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
	ldr r4, _080531DC @ =sTradeData
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
_080531DC: .4byte sTradeData
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
	ldr r0, _08053248 @ =sTradeData
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x94
	movs r0, 0x2E
	strh r0, [r1]
	str r3, [r2, 0x64]
	b _08053774
	.align 2, 0
_08053244: .4byte c3_08054588
_08053248: .4byte sTradeData
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
	ldr r2, _0805329C @ =sTradeData
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
_0805329C: .4byte sTradeData
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
	bl SetTradeSequenceBgGpuRegs
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
	ldr r0, _0805333C @ =sTradeData
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x3C
	strh r1, [r0]
	b _08053774
	.align 2, 0
_0805333C: .4byte sTradeData
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
	bl SetTradeSequenceBgGpuRegs
	movs r0, 0x7
	bl SetTradeSequenceBgGpuRegs
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
	ldr r0, _08053438 @ =sTradePokeballSpriteTemplate
	movs r2, 0x8
	negs r2, r2
	movs r1, 0x78
	movs r3, 0
	bl CreateSprite
	ldr r5, _0805343C @ =sTradeData
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
	ldr r1, _08053444 @ =SpriteCB_TradePokeball_Inbound
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
_08053438: .4byte sTradePokeballSpriteTemplate
_0805343C: .4byte sTradeData
_08053440: .4byte gSprites
_08053444: .4byte SpriteCB_TradePokeball_Inbound
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
	ldr r1, _080535B4 @ =gText_XSentOverY
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl DrawTextOnTradeWindow
	ldr r0, _080535B8 @ =sTradeData
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0x94
	movs r2, 0
	movs r0, 0xA7
	b _080535EA
	.align 2, 0
_080535B0: .4byte gStringVar4
_080535B4: .4byte gText_XSentOverY
_080535B8: .4byte sTradeData
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
	ldr r0, _0805360C @ =sTradeData
	ldr r0, [r0]
	adds r0, 0x94
	movs r1, 0x44
	strh r1, [r0]
	b _08053774
	.align 2, 0
_0805360C: .4byte sTradeData
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
	ldr r1, _08053658 @ =gText_TakeGoodCareOfX
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl DrawTextOnTradeWindow
	ldr r0, [r7]
	str r5, [r0, 0x64]
	b _08053774
	.align 2, 0
_08053650: .4byte 0x00000103
_08053654: .4byte gStringVar4
_08053658: .4byte gText_TakeGoodCareOfX
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
	bl CheckPartnersMonForRibbons
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
	bl TradeMons
	ldr r1, _080536E0 @ =gCB2_AfterEvolution
	ldr r0, _080536E4 @ =CB2_RunTradeAnim_InGameTrade
	str r0, [r1]
	ldr r7, _080536E8 @ =gSelectedTradeMonPositions
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
	ldr r1, _080536F0 @ =sTradeData
	ldr r1, [r1]
	adds r1, 0x8F
	ldrb r2, [r1]
	adds r1, r4, 0
	bl TradeEvolutionScene
	b _08053704
	.align 2, 0
_080536DC: .4byte gSpecialVar_0x8005
_080536E0: .4byte gCB2_AfterEvolution
_080536E4: .4byte CB2_RunTradeAnim_InGameTrade
_080536E8: .4byte gSelectedTradeMonPositions
_080536EC: .4byte gPlayerParty
_080536F0: .4byte sTradeData
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
	ldr r0, _08053714 @ =sTradeData
	ldr r1, [r0]
_08053708:
	adds r1, 0x94
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08053774
	.align 2, 0
_08053714: .4byte sTradeData
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
	bl BufferInGameTradeMonName
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
	ldr r7, _080537FC @ =gSelectedTradeMonPositions
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
	ldr r1, _08053804 @ =sTradeData
	ldr r1, [r1]
	adds r1, 0x8F
	ldrb r2, [r1]
	adds r1, r4, 0
	bl TradeEvolutionScene
	b _0805380E
	.align 2, 0
_080537F4: .4byte gCB2_AfterEvolution
_080537F8: .4byte sub_8053E8C
_080537FC: .4byte gSelectedTradeMonPositions
_08053800: .4byte gPlayerParty
_08053804: .4byte sTradeData
_08053808:
	mov r0, r8
	bl SetMainCallback2
_0805380E:
	ldr r1, _08053838 @ =gSelectedTradeMonPositions
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
_08053838: .4byte gSelectedTradeMonPositions
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
	ldr r0, _080538B8 @ =sTradeData
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
	ldr r0, _080538B8 @ =sTradeData
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
_080538B8: .4byte sTradeData
	thumb_func_end sub_805383C

	thumb_func_start SpriteCB_TradePokeball_Default
SpriteCB_TradePokeball_Default: @ 80538BC
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
	thumb_func_end SpriteCB_TradePokeball_Default

	thumb_func_start SpriteCB_TradePokeball_Outbound
SpriteCB_TradePokeball_Outbound: @ 8053938
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
	ldr r0, _080539A4 @ =SpriteCB_TradePokeball_Outbound2
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
_080539A4: .4byte SpriteCB_TradePokeball_Outbound2
_080539A8: .4byte 0x0000ffff
	thumb_func_end SpriteCB_TradePokeball_Outbound

	thumb_func_start SpriteCB_TradePokeball_Outbound2
SpriteCB_TradePokeball_Outbound2: @ 80539AC
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
	ldr r0, _08053A08 @ =sTradeData
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
_08053A08: .4byte sTradeData
	thumb_func_end SpriteCB_TradePokeball_Outbound2

	thumb_func_start SpriteCB_TradePokeball_Inbound
SpriteCB_TradePokeball_Inbound: @ 8053A0C
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
	thumb_func_end SpriteCB_TradePokeball_Inbound

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

	thumb_func_start BufferInGameTradeMonName
BufferInGameTradeMonName: @ 8053AE4
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
	thumb_func_end BufferInGameTradeMonName

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
	ldr r0, _08053CB0 @ =gLinkPartnerMail
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
_08053CB0: .4byte gLinkPartnerMail
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

	thumb_func_start CB2_RunTradeAnim_LinkTrade
CB2_RunTradeAnim_LinkTrade: @ 8053D84
	push {r4-r6,lr}
	bl sub_8050F14
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bne _08053DE6
	ldr r5, _08053E08 @ =sTradeData
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
	ldr r0, _08053E10 @ =gSelectedTradeMonPositions
	ldrb r4, [r0]
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl TradeMons
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
_08053E08: .4byte sTradeData
_08053E0C: .4byte gSprites
_08053E10: .4byte gSelectedTradeMonPositions
_08053E14: .4byte 0x0000abcd
_08053E18: .4byte sub_8053E1C
	thumb_func_end CB2_RunTradeAnim_LinkTrade

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
	ldr r4, _08053E80 @ =sTradeData
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
_08053E80: .4byte sTradeData
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
