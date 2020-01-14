	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FCB54
sub_80FCB54: @ 80FCB54
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r4, 0
	ldr r0, _080FCC30 @ =gSaveBlock2Ptr
	mov r8, r0
	adds r6, r7, 0x2
	ldr r0, [r0]
	adds r5, r0, 0
	adds r5, 0xA
_080FCB72:
	adds r0, r6, r4
	adds r1, r5, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x1
	ble _080FCB72
	movs r4, 0
	lsls r2, 7
	mov r12, r2
	adds r1, r7, 0x4
_080FCB88:
	adds r0, r1, r4
	strb r3, [r0]
	asrs r3, 8
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FCB88
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, 0x8]
	movs r6, 0x1
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r7, 0xB]
	movs r5, 0x2
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0xB]
	movs r4, 0x7F
	mov r1, r9
	ands r1, r4
	ldrb r2, [r7, 0xA]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	ands r0, r4
	mov r1, r12
	orrs r0, r1
	strb r0, [r7, 0xA]
	ldrb r0, [r7]
	movs r1, 0x10
	negs r1, r1
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	ldrb r2, [r7, 0x1]
	movs r0, 0x3D
	negs r0, r0
	ands r0, r2
	.ifdef FIRERED
	movs r2, 0x10 @ VERSION_FIRE_RED << 2
	.else
	.ifdef LEAFGREEN
	movs r2, 0x14 @ VERSION_LEAF_GREEN << 2
	.endif
	.endif
	orrs r0, r2
	strb r0, [r7, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r1, r0
	subs r0, 0x10
	ands r1, r0
	subs r0, 0x20
	ands r1, r0
	strb r1, [r7]
	ldr r0, _080FCC34 @ =0x00000844
	bl FlagGet
	lsls r0, 7
	ldrb r1, [r7]
	ands r4, r1
	orrs r4, r0
	strb r4, [r7]
	bl IsNationalPokedexEnabled
	ands r0, r6
	ldrb r1, [r7, 0x1]
	ands r5, r1
	orrs r5, r0
	strb r5, [r7, 0x1]
	ldr r0, _080FCC38 @ =0x0000082c
	bl FlagGet
	ands r6, r0
	lsls r6, 1
	ldrb r1, [r7, 0x1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	strb r0, [r7, 0x1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCC30: .4byte gSaveBlock2Ptr
_080FCC34: .4byte 0x00000844
_080FCC38: .4byte 0x0000082c
	thumb_func_end sub_80FCB54

	thumb_func_start sub_80FCC3C
sub_80FCC3C: @ 80FCC3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	mov r8, r1
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r0, _080FCC90 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	bne _080FCC98
	movs r0, 0x1
	mov r9, r0
	ldr r6, _080FCC94 @ =gRfuLinkStatus
	ldr r0, [r6]
	lsls r4, r5, 5
	adds r0, r4
	ldrh r0, [r0, 0x18]
	bl sub_80FA44C
	cmp r0, 0
	beq _080FCC78
	ldr r1, [r6]
	ldrb r0, [r1, 0x7]
	asrs r0, r5
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	bne _080FCCB0
_080FCC78:
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	mov r0, r8
	movs r1, 0
	movs r2, 0x8
	bl memset
	b _080FCCE4
	.align 2, 0
_080FCC90: .4byte gUnknown_3005E10
_080FCC94: .4byte gRfuLinkStatus
_080FCC98:
	movs r0, 0
	mov r9, r0
	ldr r6, _080FCCCC @ =gRfuLinkStatus
	ldr r0, [r6]
	lsls r4, r5, 5
	adds r0, r4
	ldrh r0, [r0, 0x18]
	bl sub_80FA44C
	cmp r0, 0
	beq _080FCCD0
	ldr r1, [r6]
_080FCCB0:
	adds r1, r4, r1
	adds r1, 0x1A
	adds r0, r7, 0
	movs r2, 0xD
	bl memcpy
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, 0x29
	mov r0, r8
	movs r2, 0x8
	bl memcpy
	b _080FCCE4
	.align 2, 0
_080FCCCC: .4byte gRfuLinkStatus
_080FCCD0:
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	mov r0, r8
	movs r1, 0
	movs r2, 0x8
	bl memset
_080FCCE4:
	mov r0, r9
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FCC3C

	thumb_func_start sub_80FCCF4
sub_80FCCF4: @ 80FCCF4
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	movs r7, 0
	ldr r6, _080FCD2C @ =gRfuLinkStatus
	ldr r0, [r6]
	lsrs r4, r2, 19
	adds r2, r0, r4
	ldrh r1, [r2, 0x18]
	ldr r0, _080FCD30 @ =0x00007f7d
	cmp r1, r0
	bne _080FCD34
	adds r1, r2, 0
	adds r1, 0x1A
	adds r0, r3, 0
	movs r2, 0xD
	bl memcpy
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, 0x29
	adds r0, r5, 0
	movs r2, 0x8
	bl memcpy
	movs r7, 0x1
	b _080FCD48
	.align 2, 0
_080FCD2C: .4byte gRfuLinkStatus
_080FCD30: .4byte 0x00007f7d
_080FCD34:
	adds r0, r3, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x8
	bl memset
_080FCD48:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FCCF4

	thumb_func_start sub_80FCD50
sub_80FCD50: @ 80FCD50
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080FCD6C @ =gUnknown_3005440
	movs r2, 0xD
	bl memcpy
	ldr r1, _080FCD70 @ =gUnknown_3005E00
	adds r0, r4, 0
	movs r2, 0x8
	bl memcpy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FCD6C: .4byte gUnknown_3005440
_080FCD70: .4byte gUnknown_3005E00
	thumb_func_end sub_80FCD50

	thumb_func_start CreateWirelessStatusIndicatorSprite
CreateWirelessStatusIndicatorSprite: @ 80FCD74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	cmp r3, 0
	bne _080FCD8A
	cmp r2, 0
	bne _080FCD8A
	movs r3, 0xE7
	movs r2, 0x8
_080FCD8A:
	ldr r0, _080FCDCC @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FCDE4
	ldr r0, _080FCDD0 @ =sWirelessStatusIndicatorSpriteTemplate
	adds r1, r3, 0
	movs r3, 0
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080FCDD4 @ =gSprites
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldr r0, _080FCDD8 @ =0x00001234
	strh r0, [r4, 0x3C]
	ldr r0, _080FCDDC @ =sWirelessStatusIndicatorSpriteSheet
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	strh r0, [r4, 0x3A]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldr r0, _080FCDE0 @ =gUnknown_203ACE4
	strb r5, [r0]
	b _080FCE2A
	.align 2, 0
_080FCDCC: .4byte gRfuLinkStatus
_080FCDD0: .4byte sWirelessStatusIndicatorSpriteTemplate
_080FCDD4: .4byte gSprites
_080FCDD8: .4byte 0x00001234
_080FCDDC: .4byte sWirelessStatusIndicatorSpriteSheet
_080FCDE0: .4byte gUnknown_203ACE4
_080FCDE4:
	ldr r0, _080FCE30 @ =sWirelessStatusIndicatorSpriteTemplate
	adds r1, r3, 0
	movs r3, 0
	bl CreateSprite
	ldr r4, _080FCE34 @ =gUnknown_203ACE4
	strb r0, [r4]
	ldr r5, _080FCE38 @ =gSprites
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080FCE3C @ =0x00001234
	strh r1, [r0, 0x3C]
	ldr r0, _080FCE40 @ =sWirelessStatusIndicatorSpriteSheet
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x3A]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080FCE2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FCE30: .4byte sWirelessStatusIndicatorSpriteTemplate
_080FCE34: .4byte gUnknown_203ACE4
_080FCE38: .4byte gSprites
_080FCE3C: .4byte 0x00001234
_080FCE40: .4byte sWirelessStatusIndicatorSpriteSheet
	thumb_func_end CreateWirelessStatusIndicatorSprite

	thumb_func_start DestroyWirelessStatusIndicatorSprite
DestroyWirelessStatusIndicatorSprite: @ 80FCE44
	push {r4,lr}
	ldr r4, _080FCE90 @ =gSprites
	ldr r3, _080FCE94 @ =gUnknown_203ACE4
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r4
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	ldr r0, _080FCE98 @ =0x00001234
	cmp r1, r0
	bne _080FCE8A
	movs r0, 0
	strh r0, [r2, 0x3C]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r3, _080FCE9C @ =gMain
	movs r0, 0x84
	lsls r0, 3
	adds r3, r0
	ldr r0, _080FCEA0 @ =gDummyOamData
	ldr r1, [r0]
	ldr r2, [r0, 0x4]
	str r1, [r3]
	str r2, [r3, 0x4]
	ldr r1, _080FCEA4 @ =0x070003e8
	movs r2, 0x4
	bl CpuSet
_080FCE8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FCE90: .4byte gSprites
_080FCE94: .4byte gUnknown_203ACE4
_080FCE98: .4byte 0x00001234
_080FCE9C: .4byte gMain
_080FCEA0: .4byte gDummyOamData
_080FCEA4: .4byte 0x070003e8
	thumb_func_end DestroyWirelessStatusIndicatorSprite

	thumb_func_start LoadWirelessStatusIndicatorSpriteGfx
LoadWirelessStatusIndicatorSpriteGfx: @ 80FCEA8
	push {r4,lr}
	ldr r4, _080FCED4 @ =sWirelessStatusIndicatorSpriteSheet
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _080FCED8 @ =0xffff0000
	cmp r0, r1
	bne _080FCEC0
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
_080FCEC0:
	ldr r0, _080FCEDC @ =sWirelessStatusIndicatorSpritePalette
	bl LoadSpritePalette
	ldr r1, _080FCEE0 @ =gUnknown_203ACE4
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FCED4: .4byte sWirelessStatusIndicatorSpriteSheet
_080FCED8: .4byte 0xffff0000
_080FCEDC: .4byte sWirelessStatusIndicatorSpritePalette
_080FCEE0: .4byte gUnknown_203ACE4
	thumb_func_end LoadWirelessStatusIndicatorSpriteGfx

	thumb_func_start sub_80FCEE4
sub_80FCEE4: @ 80FCEE4
	push {r4,lr}
	ldr r1, _080FCF04 @ =gRfuLinkStatus
	ldr r0, [r1]
	ldrb r2, [r0, 0x2]
	movs r3, 0
	movs r4, 0x1
_080FCEF0:
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	beq _080FCF08
	ldr r0, [r1]
	adds r0, 0xA
	adds r0, r3
	ldrb r0, [r0]
	b _080FCF16
	.align 2, 0
_080FCF04: .4byte gRfuLinkStatus
_080FCF08:
	lsrs r2, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080FCEF0
	movs r0, 0
_080FCF16:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FCEE4

	thumb_func_start sub_80FCF1C
sub_80FCF1C: @ 80FCF1C
	push {lr}
	adds r2, r0, 0
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, r1
	beq _080FCF30
	movs r0, 0
	strh r1, [r2, 0x32]
	strh r0, [r2, 0x34]
	strh r0, [r2, 0x36]
_080FCF30:
	pop {r0}
	bx r0
	thumb_func_end sub_80FCF1C

	thumb_func_start sub_80FCF34
sub_80FCF34: @ 80FCF34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _080FCF78 @ =gUnknown_203ACE4
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080FCF44
	b _080FD106
_080FCF44:
	ldr r2, _080FCF7C @ =gSprites
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	ldr r0, _080FCF80 @ =0x00001234
	cmp r1, r0
	beq _080FCF5C
	b _080FD106
_080FCF5C:
	adds r6, r2, 0
	movs r5, 0xFF
	movs r4, 0
	ldr r0, _080FCF84 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FCFB6
	adds r7, r6, 0
	adds r7, 0x28
	movs r1, 0x29
	adds r1, r6
	mov r8, r1
	b _080FCFA6
	.align 2, 0
_080FCF78: .4byte gUnknown_203ACE4
_080FCF7C: .4byte gSprites
_080FCF80: .4byte 0x00001234
_080FCF84: .4byte gRfuLinkStatus
_080FCF88:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80FCADC
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcc _080FCFA6
	adds r0, r4, 0
	bl sub_80FCADC
	lsls r0, 24
	lsrs r5, r0, 24
_080FCFA6:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r4, r0
	blt _080FCF88
	b _080FCFC8
_080FCFB6:
	bl sub_80FCEE4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r6, 0
	adds r7, 0x28
	movs r2, 0x29
	adds r2, r6
	mov r8, r2
_080FCFC8:
	bl sub_80FC1B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FCFD8
	movs r0, 0x4
	b _080FD006
_080FCFD8:
	cmp r5, 0x18
	bhi _080FCFE0
	movs r0, 0x3
	b _080FD006
_080FCFE0:
	adds r0, r5, 0
	subs r0, 0x19
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	bhi _080FCFF0
	movs r0, 0x2
	b _080FD006
_080FCFF0:
	adds r0, r5, 0
	subs r0, 0x7F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	bhi _080FD000
	movs r0, 0x1
	b _080FD006
_080FD000:
	cmp r5, 0xE4
	bls _080FD008
	movs r0, 0
_080FD006:
	strh r0, [r6, 0x2E]
_080FD008:
	movs r3, 0x2E
	ldrsh r1, [r6, r3]
	movs r2, 0x30
	ldrsh r0, [r6, r2]
	cmp r1, r0
	beq _080FD01E
	adds r0, r6, 0
	bl sub_80FCF1C
	ldrh r0, [r6, 0x2E]
	strh r0, [r6, 0x30]
_080FD01E:
	movs r0, 0x32
	ldrsh r1, [r6, r0]
	ldr r2, [r6, 0x8]
	lsls r1, 2
	adds r1, r2
	movs r3, 0x36
	ldrsh r0, [r6, r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	movs r3, 0x34
	ldrsh r1, [r6, r3]
	cmp r0, r1
	bge _080FD06C
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r6, 0x36]
	strh r3, [r6, 0x34]
	movs r1, 0x32
	ldrsh r0, [r6, r1]
	lsls r0, 2
	adds r0, r2
	movs r2, 0x36
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	ldrsh r1, [r1, r0]
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _080FD072
	strh r3, [r6, 0x36]
	b _080FD072
_080FD06C:
	ldrh r0, [r6, 0x34]
	adds r0, 0x1
	strh r0, [r6, 0x34]
_080FD072:
	ldr r4, _080FD110 @ =gMain
	movs r1, 0x84
	lsls r1, 3
	adds r0, r4, r1
	ldr r1, _080FD114 @ =sWirelessStatusIndicatorOamData
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r0]
	str r2, [r0, 0x4]
	movs r3, 0x20
	ldrsh r2, [r6, r3]
	movs r1, 0
	ldrsb r1, [r7, r1]
	adds r2, r1
	ldr r1, _080FD118 @ =0x00000422
	adds r5, r4, r1
	ldr r3, _080FD11C @ =0x000001ff
	adds r1, r3, 0
	ands r2, r1
	ldrh r3, [r5]
	ldr r1, _080FD120 @ =0xfffffe00
	ands r1, r3
	orrs r1, r2
	strh r1, [r5]
	ldrh r1, [r6, 0x22]
	mov r2, r8
	ldrb r2, [r2]
	adds r1, r2
	strb r1, [r0]
	ldrb r2, [r6, 0x5]
	ldr r3, _080FD124 @ =0x00000425
	adds r5, r4, r3
	lsrs r2, 4
	lsls r2, 4
	ldrb r3, [r5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r2
	strb r1, [r5]
	movs r1, 0x32
	ldrsh r2, [r6, r1]
	ldr r1, [r6, 0x8]
	lsls r2, 2
	adds r2, r1
	movs r3, 0x36
	ldrsh r1, [r6, r3]
	ldr r2, [r2]
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1]
	ldrh r6, [r6, 0x3A]
	adds r2, r6
	ldr r1, _080FD128 @ =0x00000424
	adds r4, r1
	ldr r3, _080FD12C @ =0x000003ff
	adds r1, r3, 0
	ands r2, r1
	ldrh r3, [r4]
	ldr r1, _080FD130 @ =0xfffffc00
	ands r1, r3
	orrs r1, r2
	strh r1, [r4]
	ldr r1, _080FD134 @ =0x070003e8
	movs r2, 0x4
	bl CpuSet
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FD106
	bl DestroyWirelessStatusIndicatorSprite
_080FD106:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD110: .4byte gMain
_080FD114: .4byte sWirelessStatusIndicatorOamData
_080FD118: .4byte 0x00000422
_080FD11C: .4byte 0x000001ff
_080FD120: .4byte 0xfffffe00
_080FD124: .4byte 0x00000425
_080FD128: .4byte 0x00000424
_080FD12C: .4byte 0x000003ff
_080FD130: .4byte 0xfffffc00
_080FD134: .4byte 0x070003e8
	thumb_func_end sub_80FCF34

	thumb_func_start sub_80FD138
sub_80FD138: @ 80FD138
	push {r4,r5,lr}
	adds r4, r0, 0
	str r1, [r4]
	movs r3, 0
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _080FD15C
	adds r5, r4, 0x4
_080FD148:
	adds r1, r5, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x6
	bgt _080FD15C
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080FD148
_080FD15C:
	adds r0, r4, 0x4
	adds r0, r3
	movs r1, 0xFF
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80FD138

	thumb_func_start sub_80FD16C
sub_80FD16C: @ 80FD16C
	push {lr}
	movs r2, 0
	movs r1, 0x7
_080FD172:
	strb r2, [r0]
	adds r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _080FD172
	pop {r0}
	bx r0
	thumb_func_end sub_80FD16C

	thumb_func_start sub_80FD180
sub_80FD180: @ 80FD180
	push {lr}
	adds r1, r0, 0
	movs r2, 0
_080FD186:
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0
	beq _080FD192
	movs r0, 0
	b _080FD19A
_080FD192:
	adds r2, 0x1
	cmp r2, 0x7
	ble _080FD186
	movs r0, 0x1
_080FD19A:
	pop {r1}
	bx r1
	thumb_func_end sub_80FD180

	thumb_func_start sub_80FD1A0
sub_80FD1A0: @ 80FD1A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r0, _080FD1C4 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FD1B6
	b _080FD318
_080FD1B6:
	movs r0, 0xF0
	bl AllocZeroed
	str r0, [sp, 0x14]
	movs r4, 0
	b _080FD22C
	.align 2, 0
_080FD1C4: .4byte gWirelessCommType
_080FD1C8:
	lsls r2, r4, 2
	mov r0, sp
	adds r1, r0, r2
	movs r0, 0x1
	negs r0, r0
	str r0, [r1]
	movs r5, 0
	mov r8, r2
	lsls r0, r4, 3
	adds r1, r4, 0x1
	mov r9, r1
	subs r0, r4
	lsls r0, 2
	str r0, [sp, 0x1C]
	ldr r2, _080FD24C @ =gLinkPlayers + 8
	mov r10, r2
	ldr r6, _080FD250 @ =0x00003ba8
	movs r4, 0
	mov r0, r10
	subs r0, 0x4
	ldr r7, [sp, 0x1C]
	adds r3, r7, r0
_080FD1F4:
	ldrh r1, [r3]
	ldr r0, _080FD254 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r7, _080FD250 @ =0x00003ba8
	adds r0, r2, r7
	adds r0, r4
	ldr r0, [r0]
	cmp r1, r0
	bne _080FD220
	adds r1, r2, r6
	adds r1, 0x4
	ldr r0, [sp, 0x1C]
	add r0, r10
	str r3, [sp, 0x18]
	bl StringCompare
	ldr r3, [sp, 0x18]
	cmp r0, 0
	bne _080FD220
	mov r0, sp
	add r0, r8
	str r5, [r0]
_080FD220:
	adds r6, 0xC
	adds r4, 0xC
	adds r5, 0x1
	cmp r5, 0x13
	ble _080FD1F4
	mov r4, r9
_080FD22C:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _080FD1C8
	movs r0, 0
	mov r8, r0
	movs r4, 0
	ldr r1, _080FD254 @ =gSaveBlock1Ptr
	mov r9, r1
	mov r7, sp
	movs r5, 0
	ldr r6, [sp, 0x14]
	b _080FD2A4
	.align 2, 0
_080FD24C: .4byte gLinkPlayers + 8
_080FD250: .4byte 0x00003ba8
_080FD254: .4byte gSaveBlock1Ptr
_080FD258:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _080FD29E
	ldr r2, _080FD328 @ =gLinkPlayers
	adds r0, r5, r2
	ldrh r0, [r0, 0x1A]
	cmp r0, 0x1
	beq _080FD29E
	adds r0, r2, 0x4
	adds r0, r5, r0
	ldrh r1, [r0]
	adds r2, 0x8
	adds r2, r5, r2
	adds r0, r6, 0
	bl sub_80FD138
	ldr r1, [r7]
	cmp r1, 0
	blt _080FD298
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	mov r2, r9
	ldr r1, [r2]
	adds r0, r1
	ldr r1, _080FD32C @ =0x00003bac
	adds r0, r1
	bl sub_80FD16C
_080FD298:
	adds r6, 0xC
	movs r2, 0x1
	add r8, r2
_080FD29E:
	adds r7, 0x4
	adds r5, 0x1C
	adds r4, 0x1
_080FD2A4:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _080FD258
	movs r4, 0
	ldr r7, _080FD330 @ =gSaveBlock1Ptr
	mov r9, r7
	ldr r6, _080FD334 @ =0x00003ba8
	movs r7, 0
	mov r1, r8
	lsls r0, r1, 1
	add r0, r8
	lsls r0, 2
	ldr r2, [sp, 0x14]
	adds r5, r0, r2
_080FD2C6:
	mov r1, r9
	ldr r0, [r1]
	adds r0, r6
	adds r0, 0x4
	bl sub_80FD180
	cmp r0, 0
	bne _080FD2F8
	mov r0, r9
	ldr r2, [r0]
	ldr r1, _080FD334 @ =0x00003ba8
	adds r0, r2, r1
	adds r0, r7
	ldr r1, [r0]
	adds r2, r6
	adds r2, 0x4
	adds r0, r5, 0
	bl sub_80FD138
	adds r5, 0xC
	movs r2, 0x1
	add r8, r2
	mov r0, r8
	cmp r0, 0x13
	bgt _080FD302
_080FD2F8:
	adds r6, 0xC
	adds r7, 0xC
	adds r4, 0x1
	cmp r4, 0x13
	ble _080FD2C6
_080FD302:
	ldr r0, _080FD330 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _080FD334 @ =0x00003ba8
	adds r0, r1
	ldr r1, [sp, 0x14]
	movs r2, 0xF0
	bl memcpy
	ldr r0, [sp, 0x14]
	bl Free
_080FD318:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD328: .4byte gLinkPlayers
_080FD32C: .4byte 0x00003bac
_080FD330: .4byte gSaveBlock1Ptr
_080FD334: .4byte 0x00003ba8
	thumb_func_end sub_80FD1A0

	thumb_func_start sub_80FD338
sub_80FD338: @ 80FD338
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	movs r7, 0
	ldr r6, _080FD374 @ =gSaveBlock1Ptr
	ldr r4, _080FD378 @ =0x00003ba8
	movs r5, 0
_080FD350:
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x4
	mov r1, r9
	movs r2, 0x7
	bl StringCompareN
	cmp r0, 0
	bne _080FD37C
	ldr r0, [r6]
	ldr r1, _080FD378 @ =0x00003ba8
	adds r0, r1
	adds r0, r5
	ldr r0, [r0]
	cmp r0, r8
	bne _080FD37C
	movs r0, 0x1
	b _080FD396
	.align 2, 0
_080FD374: .4byte gSaveBlock1Ptr
_080FD378: .4byte 0x00003ba8
_080FD37C:
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x4
	bl sub_80FD180
	cmp r0, 0
	bne _080FD394
	adds r4, 0xC
	adds r5, 0xC
	adds r7, 0x1
	cmp r7, 0x13
	ble _080FD350
_080FD394:
	movs r0, 0
_080FD396:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD338

	.align 2, 0 @ Don't pad with nop
