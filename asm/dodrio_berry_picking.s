	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_81507FC
sub_81507FC: @ 81507FC
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _081508A4 @ =gUnknown_3002044
	movs r0, 0
	str r0, [r1]
	ldr r0, _081508A8 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _081508CC
	ldr r4, _081508AC @ =gUnknown_203F3E0
	ldr r0, _081508B0 @ =0x00003330
	bl AllocZeroed
	str r0, [r4]
	cmp r0, 0
	beq _081508CC
	bl sub_81508D8
	ldr r0, [r4]
	bl sub_81508EC
	ldr r0, [r4]
	str r5, [r0]
	bl GetMultiplayerId
	ldr r1, [r4]
	adds r1, 0x28
	strb r0, [r1]
	ldr r1, [r4]
	ldr r2, _081508B4 @ =0x000032cc
	adds r0, r1, r2
	adds r2, r1, 0
	adds r2, 0x28
	ldrb r3, [r2]
	lsls r2, r3, 4
	subs r2, r3
	lsls r2, 2
	adds r1, r2
	ldr r2, _081508B8 @ =0x000031a0
	adds r1, r2
	movs r2, 0x3C
	bl memcpy
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x28
	ldrb r1, [r1]
	lsls r1, 2
	ldr r2, _081508BC @ =0x0000318c
	adds r1, r2
	adds r0, r1
	movs r1, 0x64
	muls r1, r6
	ldr r2, _081508C0 @ =gPlayerParty
	adds r1, r2
	bl sub_8152048
	ldr r0, _081508C4 @ =sub_8150A84
	movs r1, 0x1
	bl CreateTask
	ldr r0, _081508C8 @ =sub_815201C
	bl SetMainCallback2
	bl sub_8153150
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x24
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x44
	adds r2, 0x48
	bl sub_81529A4
	bl StopMapMusic
	movs r0, 0xA5
	lsls r0, 1
	bl PlayNewMapMusic
	b _081508D2
	.align 2, 0
_081508A4: .4byte gUnknown_3002044
_081508A8: .4byte gReceivedRemoteLinkPlayers
_081508AC: .4byte gUnknown_203F3E0
_081508B0: .4byte 0x00003330
_081508B4: .4byte 0x000032cc
_081508B8: .4byte 0x000031a0
_081508BC: .4byte 0x0000318c
_081508C0: .4byte gPlayerParty
_081508C4: .4byte sub_8150A84
_081508C8: .4byte sub_815201C
_081508CC:
	adds r0, r5, 0
	bl SetMainCallback2
_081508D2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81507FC

	thumb_func_start sub_81508D8
sub_81508D8: @ 81508D8
	push {lr}
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	pop {r0}
	bx r0
	thumb_func_end sub_81508D8

	thumb_func_start sub_81508EC
sub_81508EC: @ 81508EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	adds r2, r0, 0
	movs r0, 0
	strb r0, [r2, 0xC]
	strb r0, [r2, 0x10]
	strb r0, [r2, 0x14]
	strb r0, [r2, 0x18]
	strb r0, [r2, 0x1C]
	movs r3, 0x8E
	lsls r3, 1
	adds r1, r2, r3
	str r0, [r1]
	movs r7, 0x90
	lsls r7, 1
	adds r1, r2, r7
	str r0, [r1]
	adds r1, r2, 0
	adds r1, 0x30
	strb r0, [r1]
	adds r1, 0x10
	strb r0, [r1]
	subs r1, 0x4
	strb r0, [r1]
	adds r3, 0x10
	adds r1, r2, r3
	str r0, [r1]
	movs r5, 0
	adds r1, r2, 0
	adds r1, 0x98
	movs r3, 0
_08150932:
	adds r0, r1, r5
	strb r3, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08150932
	movs r5, 0
	adds r7, r2, 0
	adds r7, 0xA8
	str r7, [sp]
	adds r0, r2, 0
	adds r0, 0xB0
	str r0, [sp, 0xC]
	movs r1, 0x4A
	adds r1, r2
	mov r10, r1
	movs r3, 0x4C
	adds r3, r2
	mov r9, r3
	movs r7, 0x4E
	adds r7, r2
	mov r12, r7
	subs r0, 0x60
	str r0, [sp, 0x24]
	adds r6, r2, 0
	adds r6, 0x54
	adds r1, r2, 0
	adds r1, 0xD0
	str r1, [sp, 0x1C]
	adds r3, r2, 0
	adds r3, 0xDC
	str r3, [sp, 0x20]
	adds r7, r2, 0
	adds r7, 0xC4
	str r7, [sp, 0x14]
	adds r0, 0xA4
	str r0, [sp, 0x4]
	adds r1, 0x25
	str r1, [sp, 0x8]
	subs r3, 0xBC
	str r3, [sp, 0x10]
	movs r7, 0x24
	adds r7, r2
	mov r8, r7
	subs r0, 0xC0
	str r0, [sp, 0x18]
	movs r3, 0
	movs r1, 0x86
	lsls r1, 1
	adds r4, r2, r1
	movs r7, 0x98
	lsls r7, 1
	adds r2, r7
_0815099E:
	ldr r1, [sp]
	adds r0, r1, r5
	strb r3, [r0]
	ldr r7, [sp, 0xC]
	adds r0, r7, r5
	strb r3, [r0]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	mov r7, r10
	adds r1, r7, r0
	strh r3, [r1]
	mov r7, r9
	adds r1, r7, r0
	strh r3, [r1]
	mov r7, r12
	adds r1, r7, r0
	strh r3, [r1]
	ldr r7, [sp, 0x24]
	adds r1, r7, r0
	strh r3, [r1]
	adds r0, r6, r0
	strh r3, [r0]
	adds r0, r4, r5
	strb r3, [r0]
	lsls r0, r5, 2
	adds r0, r2, r0
	str r3, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0815099E
	movs r5, 0
	movs r3, 0
	movs r4, 0xFF
	ldr r6, [sp, 0x1C]
_081509E8:
	adds r0, r6, r5
	strb r3, [r0]
	ldr r1, [sp, 0x20]
	adds r0, r1, r5
	strb r3, [r0]
	ldr r7, [sp, 0x14]
	adds r0, r7, r5
	strb r3, [r0]
	lsls r1, r5, 1
	ldr r0, [sp, 0x4]
	adds r2, r0, r1
	ldrb r0, [r2]
	orrs r0, r4
	strb r0, [r2]
	ldr r7, [sp, 0x8]
	adds r1, r7, r1
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _081509E8
	bl GetMultiplayerId
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _08150A26
	movs r1, 0x1
_08150A26:
	ldr r0, [sp, 0x10]
	strb r1, [r0]
	bl GetLinkPlayerCount
	mov r1, r8
	strb r0, [r1]
	bl GetMultiplayerId
	ldr r3, [sp, 0x18]
	strb r0, [r3]
	movs r5, 0x1
	mov r7, r8
	ldrb r7, [r7]
	cmp r5, r7
	bcs _08150A72
	ldr r7, [sp, 0x18]
	mov r6, r8
_08150A48:
	adds r4, r7, r5
	subs r0, r5, 0x1
	adds r0, r7, r0
	ldrb r0, [r0]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r2, [r4]
	ldrb r1, [r6]
	subs r0, r1, 0x1
	cmp r2, r0
	ble _08150A66
	adds r0, r2, 0
	bl __umodsi3
	strb r0, [r4]
_08150A66:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6]
	cmp r5, r0
	bcc _08150A48
_08150A72:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81508EC

	thumb_func_start sub_8150A84
sub_8150A84: @ 8150A84
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08150AA4 @ =gUnknown_203F3E0
	ldr r0, [r0]
	ldrb r0, [r0, 0xC]
	cmp r0, 0x7
	bls _08150A98
	b _08150BF0
_08150A98:
	lsls r0, 2
	ldr r1, _08150AA8 @ =_08150AAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08150AA4: .4byte gUnknown_203F3E0
_08150AA8: .4byte _08150AAC
	.align 2, 0
_08150AAC:
	.4byte _08150ACC
	.4byte _08150AE0
	.4byte _08150B08
	.4byte _08150B16
	.4byte _08150B3C
	.4byte _08150B90
	.4byte _08150BA2
	.4byte _08150BCC
_08150ACC:
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _08150ADC @ =sub_8151750
	movs r1, 0x4
	bl sub_815205C
	b _08150BDC
	.align 2, 0
_08150ADC: .4byte sub_8151750
_08150AE0:
	ldr r0, _08150B00 @ =sub_8151750
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08150AEE
	b _08150BFC
_08150AEE:
	ldr r4, _08150B04 @ =gUnknown_203F3E0
	ldr r0, [r4]
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r1
	bl sub_8154968
	ldr r1, [r4]
	b _08150BE0
	.align 2, 0
_08150B00: .4byte sub_8151750
_08150B04: .4byte gUnknown_203F3E0
_08150B08:
	bl sub_8155E68
	cmp r0, 0
	bne _08150BFC
	bl sub_80FA42C
	b _08150BDC
_08150B16:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08150BFC
	ldr r0, _08150B38 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08150BDC
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
	b _08150BDC
	.align 2, 0
_08150B38: .4byte gReceivedRemoteLinkPlayers
_08150B3C:
	ldr r0, _08150B88 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r5, [r0]
	bl sub_8153A9C
	movs r4, 0
	cmp r4, r5
	bcs _08150B76
_08150B4E:
	ldr r0, _08150B88 @ =gUnknown_203F3E0
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x34
	adds r0, r4
	ldrb r2, [r0]
	lsls r0, r2, 2
	ldr r3, _08150B8C @ =0x0000318c
	adds r0, r3
	adds r0, r1, r0
	adds r1, 0x24
	ldrb r3, [r1]
	adds r1, r4, 0
	bl sub_8153AFC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08150B4E
_08150B76:
	ldr r4, _08150B88 @ =gUnknown_203F3E0
	ldr r0, [r4]
	adds r0, 0x24
	ldrb r1, [r0]
	movs r0, 0
	bl sub_8153D80
	ldr r1, [r4]
	b _08150BE0
	.align 2, 0
_08150B88: .4byte gUnknown_203F3E0
_08150B8C: .4byte 0x0000318c
_08150B90:
	bl sub_8154128
	bl sub_815417C
	bl sub_8154438
	bl sub_8153E28
	b _08150BDC
_08150BA2:
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08150BC8 @ =sub_8152034
	bl SetVBlankCallback
	b _08150BDC
	.align 2, 0
_08150BC8: .4byte sub_8152034
_08150BCC:
	bl UpdatePaletteFade
	ldr r0, _08150BE8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08150BFC
_08150BDC:
	ldr r0, _08150BEC @ =gUnknown_203F3E0
	ldr r1, [r0]
_08150BE0:
	ldrb r0, [r1, 0xC]
	adds r0, 0x1
	strb r0, [r1, 0xC]
	b _08150BFC
	.align 2, 0
_08150BE8: .4byte gPaletteFade
_08150BEC: .4byte gUnknown_203F3E0
_08150BF0:
	adds r0, r1, 0
	bl DestroyTask
	ldr r0, _08150C04 @ =sub_81516DC
	bl sub_815206C
_08150BFC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08150C04: .4byte sub_81516DC
	thumb_func_end sub_8150A84

	thumb_func_start sub_8150C08
sub_8150C08: @ 8150C08
	push {lr}
	bl sub_8151B54
	ldr r1, _08150C34 @ =gUnknown_8475578
	ldr r0, _08150C38 @ =gUnknown_203F3E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x18]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08150C3C @ =gUnknown_3002044
	ldr r0, [r0]
	cmp r0, 0
	bne _08150C2C
	bl sub_815293C
_08150C2C:
	bl sub_8151BA0
	pop {r0}
	bx r0
	.align 2, 0
_08150C34: .4byte gUnknown_8475578
_08150C38: .4byte gUnknown_203F3E0
_08150C3C: .4byte gUnknown_3002044
	thumb_func_end sub_8150C08

	thumb_func_start sub_8150C40
sub_8150C40: @ 8150C40
	push {lr}
	bl sub_8151C5C
	ldr r1, _08150C6C @ =gUnknown_84755A8
	ldr r0, _08150C70 @ =gUnknown_203F3E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x18]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08150C74 @ =gUnknown_3002044
	ldr r0, [r0]
	cmp r0, 0
	bne _08150C64
	bl sub_8152970
_08150C64:
	bl sub_8151D28
	pop {r0}
	bx r0
	.align 2, 0
_08150C6C: .4byte gUnknown_84755A8
_08150C70: .4byte gUnknown_203F3E0
_08150C74: .4byte gUnknown_3002044
	thumb_func_end sub_8150C40

	thumb_func_start sub_8150C78
sub_8150C78: @ 8150C78
	push {r4,lr}
	ldr r4, _08150C8C @ =gUnknown_203F3E0
	ldr r0, [r4]
	ldrb r0, [r0, 0x10]
	cmp r0, 0
	beq _08150C90
	cmp r0, 0x1
	beq _08150CA6
	b _08150CB4
	.align 2, 0
_08150C8C: .4byte gUnknown_203F3E0
_08150C90:
	movs r0, 0x1
	bl sub_8153BF8
	movs r0, 0x1
	bl sub_81549D4
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08150CB4
_08150CA6:
	bl sub_8155E68
	cmp r0, 0
	bne _08150CB4
	movs r0, 0x1
	bl sub_8152090
_08150CB4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8150C78

	thumb_func_start sub_8150CBC
sub_8150CBC: @ 8150CBC
	push {r4,lr}
	ldr r4, _08150CD8 @ =gUnknown_203F3E0
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	cmp r0, 0
	bne _08150CDC
	bl sub_8152110
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08150CEC
	.align 2, 0
_08150CD8: .4byte gUnknown_203F3E0
_08150CDC:
	movs r0, 0x8C
	lsls r0, 1
	adds r1, r0
	movs r0, 0x1
	str r0, [r1]
	movs r0, 0x2
	bl sub_8152090
_08150CEC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8150CBC

	thumb_func_start sub_8150CF4
sub_8150CF4: @ 8150CF4
	push {lr}
	sub sp, 0x4
	ldr r0, _08150D0C @ =gUnknown_203F3E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x10]
	cmp r0, 0x4
	bhi _08150D74
	lsls r0, 2
	ldr r1, _08150D10 @ =_08150D14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08150D0C: .4byte gUnknown_203F3E0
_08150D10: .4byte _08150D14
	.align 2, 0
_08150D14:
	.4byte _08150D28
	.4byte _08150D4E
	.4byte _08150D3A
	.4byte _08150D46
	.4byte _08150D64
_08150D28:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0x78
	movs r3, 0x50
	bl sub_815F138
	b _08150D52
_08150D3A:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08150D74
	b _08150D52
_08150D46:
	bl sub_815F198
	cmp r0, 0
	bne _08150D74
_08150D4E:
	bl sub_80FA42C
_08150D52:
	ldr r0, _08150D60 @ =gUnknown_203F3E0
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08150D74
	.align 2, 0
_08150D60: .4byte gUnknown_203F3E0
_08150D64:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08150D74
	movs r0, 0x3
	bl sub_8152090
_08150D74:
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_8150CF4

	thumb_func_start sub_8150D7C
sub_8150D7C: @ 8150D7C
	push {lr}
	ldr r0, _08150DA0 @ =gUnknown_203F3E0
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	cmp r0, 0
	bne _08150D9A
	movs r2, 0x8E
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08150D9A
	movs r0, 0x4
	bl sub_8152090
_08150D9A:
	pop {r0}
	bx r0
	.align 2, 0
_08150DA0: .4byte gUnknown_203F3E0
	thumb_func_end sub_8150D7C

	thumb_func_start sub_8150DA4
sub_8150DA4: @ 8150DA4
	push {r4,lr}
	ldr r4, _08150DE4 @ =gUnknown_203F3E0
	ldr r2, [r4]
	ldrb r0, [r2, 0x10]
	cmp r0, 0
	bne _08150E62
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _08150E54
	adds r0, r2, 0
	adds r0, 0xA8
	ldrb r0, [r0]
	cmp r0, 0
	bne _08150E5A
	ldr r0, _08150DE8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08150DF4
	ldr r1, _08150DEC @ =0x000031cc
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, 0
	bne _08150E5A
	ldr r3, _08150DF0 @ =0x000031d0
	adds r0, r2, r3
	strb r1, [r0]
	movs r0, 0x2
	b _08150E2E
	.align 2, 0
_08150DE4: .4byte gUnknown_203F3E0
_08150DE8: .4byte gMain
_08150DEC: .4byte 0x000031cc
_08150DF0: .4byte 0x000031d0
_08150DF4:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08150E14
	ldr r3, _08150E10 @ =0x000031cc
	adds r0, r2, r3
	ldrb r1, [r0]
	cmp r1, 0
	bne _08150E5A
	adds r3, 0x4
	adds r0, r2, r3
	strb r1, [r0]
	movs r0, 0x1
	b _08150E2E
	.align 2, 0
_08150E10: .4byte 0x000031cc
_08150E14:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08150E40
	ldr r3, _08150E3C @ =0x000031cc
	adds r0, r2, r3
	ldrb r1, [r0]
	cmp r1, 0
	bne _08150E5A
	adds r3, 0x4
	adds r0, r2, r3
	strb r1, [r0]
	movs r0, 0x3
_08150E2E:
	bl sub_815327C
	ldr r1, [r4]
	ldr r2, _08150E3C @ =0x000031cc
	adds r1, r2
	strb r0, [r1]
	b _08150E5A
	.align 2, 0
_08150E3C: .4byte 0x000031cc
_08150E40:
	movs r0, 0
	bl sub_815327C
	ldr r1, [r4]
	ldr r3, _08150E50 @ =0x000031cc
	adds r1, r3
	strb r0, [r1]
	b _08150E5A
	.align 2, 0
_08150E50: .4byte 0x000031cc
_08150E54:
	movs r0, 0xB
	bl sub_8152090
_08150E5A:
	bl sub_815256C
	bl sub_8151D98
_08150E62:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8150DA4

	thumb_func_start sub_8150E68
sub_8150E68: @ 8150E68
	push {lr}
	ldr r0, _08150EA8 @ =gUnknown_203F3E0
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _08150F30
	ldr r0, _08150EAC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08150EB8
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r2, r0
	ldr r1, _08150EB0 @ =0x000031cc
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08150F36
	ldr r3, _08150EB4 @ =0x000032f8
	adds r1, r2, r3
	movs r0, 0x2
	strb r0, [r1]
	b _08150F36
	.align 2, 0
_08150EA8: .4byte gUnknown_203F3E0
_08150EAC: .4byte gMain
_08150EB0: .4byte 0x000031cc
_08150EB4: .4byte 0x000032f8
_08150EB8:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08150EEC
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r2, r0
	ldr r1, _08150EE4 @ =0x000031cc
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08150F36
	ldr r3, _08150EE8 @ =0x000032f8
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	b _08150F36
	.align 2, 0
_08150EE4: .4byte 0x000031cc
_08150EE8: .4byte 0x000032f8
_08150EEC:
	movs r0, 0x20
	ands r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08150F24
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r2, r0
	ldr r1, _08150F1C @ =0x000031cc
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08150F36
	ldr r3, _08150F20 @ =0x000032f8
	adds r1, r2, r3
	movs r0, 0x3
	strb r0, [r1]
	b _08150F36
	.align 2, 0
_08150F1C: .4byte 0x000031cc
_08150F20: .4byte 0x000032f8
_08150F24:
	ldr r3, _08150F2C @ =0x000032f8
	adds r0, r2, r3
	strb r1, [r0]
	b _08150F36
	.align 2, 0
_08150F2C: .4byte 0x000032f8
_08150F30:
	movs r0, 0xB
	bl sub_8152090
_08150F36:
	bl sub_8151E94
	pop {r0}
	bx r0
	thumb_func_end sub_8150E68

	thumb_func_start sub_8150F40
sub_8150F40: @ 8150F40
	push {r4,r5,lr}
	bl sub_815256C
	bl sub_8151D98
	bl sub_8152A98
	cmp r0, 0x1
	bne _08150F5E
	bl sub_8153004
	movs r0, 0x5
	bl sub_8152090
	b _08150FBC
_08150F5E:
	ldr r0, _08150F8C @ =gUnknown_203F3E0
	ldr r2, [r0]
	movs r1, 0x96
	lsls r1, 1
	adds r4, r2, r1
	movs r1, 0x1
	str r1, [r4]
	movs r3, 0x1
	adds r1, r2, 0
	adds r1, 0x24
	adds r5, r0, 0
	ldrb r1, [r1]
	cmp r3, r1
	bcs _08150FBC
	movs r1, 0x9A
	lsls r1, 1
	adds r0, r2, r1
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08150F90
	movs r0, 0
	str r0, [r4]
	b _08150FBC
	.align 2, 0
_08150F8C: .4byte gUnknown_203F3E0
_08150F90:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r3, r0
	bcs _08150FBC
	lsls r0, r3, 2
	movs r4, 0x98
	lsls r4, 1
	adds r1, r2, r4
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0x1
	beq _08150F90
	movs r0, 0x96
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	str r0, [r1]
_08150FBC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8150F40

	thumb_func_start sub_8150FC4
sub_8150FC4: @ 8150FC4
	push {lr}
	bl sub_8151E94
	bl sub_8152AD8
	cmp r0, 0x1
	bne _08150FD8
	movs r0, 0x5
	bl sub_8152090
_08150FD8:
	pop {r0}
	bx r0
	thumb_func_end sub_8150FC4

	thumb_func_start sub_8150FDC
sub_8150FDC: @ 8150FDC
	push {r4-r6,lr}
	ldr r6, _08150FF4 @ =gUnknown_203F3E0
	ldr r1, [r6]
	ldrb r4, [r1, 0x10]
	cmp r4, 0x1
	beq _08151010
	cmp r4, 0x1
	bgt _08150FF8
	cmp r4, 0
	beq _08150FFE
	b _08151078
	.align 2, 0
_08150FF4: .4byte gUnknown_203F3E0
_08150FF8:
	cmp r4, 0x2
	beq _0815101E
	b _08151078
_08150FFE:
	adds r1, 0x4A
	movs r0, 0
	movs r2, 0x3C
	bl SendBlock
	ldr r0, [r6]
	strb r4, [r0, 0x8]
	ldr r1, [r6]
	b _0815106A
_08151010:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08151092
	ldr r1, [r6]
	b _0815106A
_0815101E:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _08151048
_0815102A:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08151040
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	ldr r1, [r6]
	ldrb r0, [r1, 0x8]
	adds r0, 0x1
	strb r0, [r1, 0x8]
_08151040:
	lsrs r5, 1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08151048:
	ldr r0, [r6]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0815102A
	ldr r3, _08151074 @ =gUnknown_203F3E0
	ldr r2, [r3]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r0, [r2, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08151092
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	ldr r1, [r3]
_0815106A:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08151092
	.align 2, 0
_08151074: .4byte gUnknown_203F3E0
_08151078:
	movs r0, 0x1
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _08151092
	movs r0, 0x6
	bl sub_8152090
	ldr r0, _08151098 @ =0x00000137
	movs r1, 0x4
	bl FadeOutAndPlayNewMapMusic
_08151092:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08151098: .4byte 0x00000137
	thumb_func_end sub_8150FDC

	thumb_func_start sub_815109C
sub_815109C: @ 815109C
	push {r4-r6,lr}
	ldr r6, _081510B4 @ =gUnknown_203F3E0
	ldr r2, [r6]
	ldrb r4, [r2, 0x10]
	cmp r4, 0x1
	beq _081510DA
	cmp r4, 0x1
	bgt _081510B8
	cmp r4, 0
	beq _081510BE
	b _08151150
	.align 2, 0
_081510B4: .4byte gUnknown_203F3E0
_081510B8:
	cmp r4, 0x2
	beq _081510E8
	b _08151150
_081510BE:
	ldrb r0, [r2, 0x14]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, 0x4A
	adds r1, r2, r1
	movs r0, 0
	movs r2, 0x3C
	bl SendBlock
	ldr r0, [r6]
	strb r4, [r0, 0x8]
	ldr r1, [r6]
	b _08151140
_081510DA:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _0815118A
	ldr r1, [r6]
	b _08151140
_081510E8:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _0815111E
_081510F4:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08151116
	ldr r0, [r6]
	adds r0, 0x4A
	ldr r1, _08151148 @ =gBlockRecvBuffer
	movs r2, 0x3C
	bl memcpy
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	ldr r1, [r6]
	ldrb r0, [r1, 0x8]
	adds r0, 0x1
	strb r0, [r1, 0x8]
_08151116:
	lsrs r5, 1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0815111E:
	ldr r0, [r6]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r4, r0
	bcc _081510F4
	ldr r3, _0815114C @ =gUnknown_203F3E0
	ldr r2, [r3]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r0, [r2, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0815118A
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	ldr r1, [r3]
_08151140:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _0815118A
	.align 2, 0
_08151148: .4byte gBlockRecvBuffer
_0815114C: .4byte gUnknown_203F3E0
_08151150:
	movs r0, 0x1
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _0815118A
	ldr r0, _08151190 @ =gUnknown_203F3E0
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0x54
	adds r0, r1
	ldrh r1, [r0]
	movs r3, 0x8A
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, 0x6
	bl sub_8152090
	ldr r0, _08151194 @ =0x00000137
	movs r1, 0x4
	bl FadeOutAndPlayNewMapMusic
_0815118A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08151190: .4byte gUnknown_203F3E0
_08151194: .4byte 0x00000137
	thumb_func_end sub_815109C

	thumb_func_start sub_8151198
sub_8151198: @ 8151198
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _081511B0 @ =gUnknown_203F3E0
	ldr r0, [r6]
	ldrb r4, [r0, 0x10]
	cmp r4, 0x1
	beq _081511DC
	cmp r4, 0x1
	bgt _081511B4
	cmp r4, 0
	beq _081511BE
	b _0815129C
	.align 2, 0
_081511B0: .4byte gUnknown_203F3E0
_081511B4:
	cmp r4, 0x2
	beq _08151202
	cmp r4, 0x3
	beq _0815121C
	b _0815129C
_081511BE:
	bl sub_81531FC
	movs r0, 0x1
	bl sub_81540DC
	bl sub_81544F0
	movs r0, 0x1
	bl sub_81545BC
	movs r0, 0x2
	bl sub_81549D4
	ldr r1, [r6]
	b _0815128A
_081511DC:
	bl sub_8155E68
	cmp r0, 0
	bne _081512AA
	mov r0, sp
	strb r4, [r0]
	movs r0, 0x5
	bl sub_81549D4
	bl sub_8155E8C
	mov r1, sp
	strb r0, [r1]
	movs r0, 0
	movs r2, 0x1
	bl SendBlock
	ldr r1, [r6]
	b _0815128A
_08151202:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _081512AA
	ldr r1, [r6]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1, 0x10]
	ldr r0, [r6]
	strb r2, [r0, 0x8]
	b _081512AA
_0815121C:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _0815125A
_08151228:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08151252
	ldr r2, [r6]
	adds r2, r4, r2
	movs r0, 0x86
	lsls r0, 1
	adds r2, r0
	lsls r0, r4, 8
	ldr r1, _08151294 @ =gBlockRecvBuffer
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	ldr r1, [r6]
	ldrb r0, [r1, 0x8]
	adds r0, 0x1
	strb r0, [r1, 0x8]
_08151252:
	lsrs r5, 1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0815125A:
	ldr r0, [r6]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08151228
	ldr r4, _08151298 @ =gUnknown_203F3E0
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r0, [r2, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _081512AA
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bls _081512AA
	movs r0, 0x6
	bl sub_81549D4
	ldr r1, [r4]
_0815128A:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _081512AA
	.align 2, 0
_08151294: .4byte gBlockRecvBuffer
_08151298: .4byte gUnknown_203F3E0
_0815129C:
	bl sub_8155E68
	cmp r0, 0
	bne _081512AA
	movs r0, 0x7
	bl sub_8152090
_081512AA:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8151198

	thumb_func_start sub_81512B4
sub_81512B4: @ 81512B4
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r5, _081512D0 @ =gUnknown_203F3E0
	ldr r0, [r5]
	ldrb r0, [r0, 0x10]
	cmp r0, 0x6
	bls _081512C4
	b _0815144A
_081512C4:
	lsls r0, 2
	ldr r1, _081512D4 @ =_081512D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081512D0: .4byte gUnknown_203F3E0
_081512D4: .4byte _081512D8
	.align 2, 0
_081512D8:
	.4byte _081512F4
	.4byte _08151314
	.4byte _08151330
	.4byte _08151344
	.4byte _08151360
	.4byte _0815138C
	.4byte _081513AC
_081512F4:
	bl sub_81534AC
	ldr r1, _0815130C @ =0x00000bb7
	cmp r0, r1
	bls _08151304
	movs r0, 0x4
	bl sub_81549D4
_08151304:
	ldr r0, _08151310 @ =gUnknown_203F3E0
	ldr r1, [r0]
	b _0815142A
	.align 2, 0
_0815130C: .4byte 0x00000bb7
_08151310: .4byte gUnknown_203F3E0
_08151314:
	bl sub_8155E68
	cmp r0, 0
	beq _0815131E
	b _08151480
_0815131E:
	movs r0, 0x3
	bl sub_81549D4
	ldr r0, _0815132C @ =gUnknown_203F3E0
	ldr r1, [r0]
	b _0815142A
	.align 2, 0
_0815132C: .4byte gUnknown_203F3E0
_08151330:
	bl sub_81546C0
	bl sub_8153048
	ldr r0, _08151340 @ =gUnknown_203F3E0
	ldr r1, [r0]
	b _0815142A
	.align 2, 0
_08151340: .4byte gUnknown_203F3E0
_08151344:
	bl sub_8155E8C
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	cmp r0, 0
	bne _08151356
	b _08151480
_08151356:
	ldr r0, _0815135C @ =gUnknown_203F3E0
	ldr r1, [r0]
	b _0815142A
	.align 2, 0
_0815135C: .4byte gUnknown_203F3E0
_08151360:
	bl sub_8155E68
	cmp r0, 0
	beq _0815136A
	b _08151480
_0815136A:
	movs r0, 0x5
	bl sub_81549D4
	bl sub_8155E8C
	mov r1, sp
	strb r0, [r1]
	movs r0, 0
	movs r2, 0x1
	bl SendBlock
	ldr r0, _08151388 @ =gUnknown_203F3E0
	ldr r1, [r0]
	b _0815142A
	.align 2, 0
_08151388: .4byte gUnknown_203F3E0
_0815138C:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08151480
	ldr r3, _081513A8 @ =gUnknown_203F3E0
	ldr r1, [r3]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1, 0x10]
	ldr r0, [r3]
	strb r2, [r0, 0x8]
	b _08151480
	.align 2, 0
_081513A8: .4byte gUnknown_203F3E0
_081513AC:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r7, _08151434 @ =gUnknown_203F3E0
	ldr r0, [r7]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08151400
	adds r6, r7, 0
_081513C4:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _081513EE
	ldr r2, [r6]
	adds r2, r4, r2
	movs r0, 0x86
	lsls r0, 1
	adds r2, r0
	lsls r0, r4, 8
	ldr r1, _08151438 @ =gBlockRecvBuffer
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	ldr r1, [r6]
	ldrb r0, [r1, 0x8]
	adds r0, 0x1
	strb r0, [r1, 0x8]
_081513EE:
	lsrs r5, 1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r7]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r4, r0
	bcc _081513C4
_08151400:
	ldr r4, _08151434 @ =gUnknown_203F3E0
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r0, [r2, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0815143C
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bls _08151480
	bl sub_815336C
	movs r0, 0x6
	bl sub_81549D4
	ldr r1, [r4]
_0815142A:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08151480
	.align 2, 0
_08151434: .4byte gUnknown_203F3E0
_08151438: .4byte gBlockRecvBuffer
_0815143C:
	bl sub_81532B8
	b _08151480
_08151442:
	movs r0, 0x8
	bl sub_8152090
	b _08151480
_0815144A:
	bl sub_8155E68
	cmp r0, 0
	bne _08151480
	movs r4, 0
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0815147A
	movs r3, 0x86
	lsls r3, 1
	adds r2, r1, r3
	adds r1, r0, 0
_08151468:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08151442
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r1
	bcc _08151468
_0815147A:
	movs r0, 0xA
	bl sub_8152090
_08151480:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81512B4

	thumb_func_start sub_8151488
sub_8151488: @ 8151488
	push {r4,lr}
	ldr r4, _081514A0 @ =gUnknown_203F3E0
	ldr r0, [r4]
	ldrb r0, [r0, 0x10]
	cmp r0, 0x1
	beq _081514B6
	cmp r0, 0x1
	bgt _081514A4
	cmp r0, 0
	beq _081514AA
	b _081514D6
	.align 2, 0
_081514A0: .4byte gUnknown_203F3E0
_081514A4:
	cmp r0, 0x2
	beq _081514C0
	b _081514D6
_081514AA:
	bl sub_800AAC0
	movs r0, 0x7
	bl sub_81549D4
	b _081514CC
_081514B6:
	bl sub_8155E68
	cmp r0, 0
	bne _081514E4
	b _081514CC
_081514C0:
	bl sub_8155E8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _081514E4
_081514CC:
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _081514E4
_081514D6:
	ldr r0, _081514EC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _081514E4
	movs r0, 0x9
	bl sub_8152090
_081514E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081514EC: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8151488

	thumb_func_start sub_81514F0
sub_81514F0: @ 81514F0
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08151508 @ =gUnknown_203F3E0
	ldr r0, [r4]
	ldrb r1, [r0, 0x10]
	cmp r1, 0x1
	beq _08151524
	cmp r1, 0x1
	bgt _0815150C
	cmp r1, 0
	beq _08151512
	b _0815156C
	.align 2, 0
_08151508: .4byte gUnknown_203F3E0
_0815150C:
	cmp r1, 0x2
	beq _0815153C
	b _0815156C
_08151512:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0815155E
_08151524:
	bl UpdatePaletteFade
	ldr r0, _08151538 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08151590
	b _0815155E
	.align 2, 0
_08151538: .4byte gPaletteFade
_0815153C:
	bl sub_8154274
	bl sub_8153ED8
	ldr r0, [r4]
	adds r0, 0x24
	ldrb r0, [r0]
	bl sub_8153D08
	bl sub_8154578
	ldr r1, _08151568 @ =gUnknown_3002044
	movs r0, 0x1
	str r0, [r1]
	movs r0, 0x8
	bl sub_81549D4
_0815155E:
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08151590
	.align 2, 0
_08151568: .4byte gUnknown_3002044
_0815156C:
	bl sub_8155E68
	cmp r0, 0
	bne _08151590
	ldr r4, _08151598 @ =gUnknown_203F3E0
	ldr r0, [r4]
	ldr r0, [r0]
	bl SetMainCallback2
	ldr r0, [r4]
	ldrb r0, [r0, 0x4]
	bl DestroyTask
	ldr r0, [r4]
	bl Free
	bl FreeAllWindowBuffers
_08151590:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08151598: .4byte gUnknown_203F3E0
	thumb_func_end sub_81514F0

	thumb_func_start sub_815159C
sub_815159C: @ 815159C
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _081515B4 @ =gUnknown_203F3E0
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	cmp r0, 0x6
	bhi _0815169C
	lsls r0, 2
	ldr r1, _081515B8 @ =_081515BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081515B4: .4byte gUnknown_203F3E0
_081515B8: .4byte _081515BC
	.align 2, 0
_081515BC:
	.4byte _081515D8
	.4byte _08151676
	.4byte _081515F0
	.4byte _08151642
	.4byte _08151648
	.4byte _08151656
	.4byte _08151676
_081515D8:
	movs r0, 0x9
	bl sub_81549D4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08151686
_081515F0:
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
	b _08151686
_08151642:
	bl StopMapMusic
	b _08151686
_08151648:
	movs r0, 0xA5
	lsls r0, 1
	bl PlayNewMapMusic
	bl sub_8154540
	b _08151686
_08151656:
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08151686
_08151676:
	bl UpdatePaletteFade
	ldr r0, _08151694 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081516CC
_08151686:
	ldr r0, _08151698 @ =gUnknown_203F3E0
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _081516CC
	.align 2, 0
_08151694: .4byte gPaletteFade
_08151698: .4byte gUnknown_203F3E0
_0815169C:
	ldrb r0, [r1, 0x4]
	bl DestroyTask
	ldr r0, _081516D4 @ =sub_81516DC
	bl sub_815206C
	bl sub_8154730
	ldr r0, [r4]
	bl sub_81508EC
	ldr r0, _081516D8 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _081516C2
	ldr r0, [r4]
	adds r0, 0x24
	movs r1, 0x1
	strb r1, [r0]
_081516C2:
	bl sub_8153150
	movs r0, 0
	bl sub_81545BC
_081516CC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081516D4: .4byte sub_81516DC
_081516D8: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_815159C

	thumb_func_start sub_81516DC
sub_81516DC: @ 81516DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081516F8 @ =gUnknown_203F3E0
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _08151708
	cmp r0, 0x1
	bgt _081516FC
	cmp r0, 0
	beq _08151702
	b _08151720
	.align 2, 0
_081516F8: .4byte gUnknown_203F3E0
_081516FC:
	cmp r0, 0x2
	beq _0815170E
	b _08151720
_08151702:
	bl sub_81520B4
	b _08151712
_08151708:
	bl sub_8153DD8
	b _08151716
_0815170E:
	bl sub_8153F1C
_08151712:
	cmp r0, 0x1
	bne _08151744
_08151716:
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _08151744
_08151720:
	ldr r0, [r4]
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _08151738
	ldr r0, _08151734 @ =sub_8150C08
	bl sub_815206C
	b _0815173E
	.align 2, 0
_08151734: .4byte sub_8150C08
_08151738:
	ldr r0, _0815174C @ =sub_8150C40
	bl sub_815206C
_0815173E:
	adds r0, r5, 0
	bl DestroyTask
_08151744:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815174C: .4byte sub_8150C40
	thumb_func_end sub_81516DC

	thumb_func_start sub_8151750
sub_8151750: @ 8151750
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08151774 @ =gTasks+0x8
	adds r6, r0, r1
	movs r0, 0
	ldrsh r5, [r6, r0]
	cmp r5, 0x1
	beq _081517A8
	cmp r5, 0x1
	bgt _08151778
	cmp r5, 0
	beq _0815177E
	b _08151836
	.align 2, 0
_08151774: .4byte gTasks+0x8
_08151778:
	cmp r5, 0x2
	beq _081517BA
	b _08151836
_0815177E:
	ldr r4, _081517A0 @ =gUnknown_203F3E0
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 2
	ldr r2, _081517A4 @ =0x0000318c
	adds r0, r2
	adds r1, r0
	movs r0, 0
	movs r2, 0x1
	bl SendBlock
	ldr r0, [r4]
	strb r5, [r0, 0x8]
	b _081517B2
	.align 2, 0
_081517A0: .4byte gUnknown_203F3E0
_081517A4: .4byte 0x0000318c
_081517A8:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08151836
_081517B2:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _08151836
_081517BA:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r3, _08151840 @ =gUnknown_203F3E0
	ldr r0, [r3]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08151812
	adds r6, r3, 0
_081517D2:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08151800
	ldr r0, [r6]
	lsls r2, r4, 2
	adds r2, r0
	ldr r0, _08151844 @ =0x0000318c
	adds r2, r0
	lsls r0, r4, 8
	ldr r1, _08151848 @ =gBlockRecvBuffer
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r4, 0
	str r3, [sp]
	bl ResetBlockReceivedFlag
	ldr r1, [r6]
	ldrb r0, [r1, 0x8]
	adds r0, 0x1
	strb r0, [r1, 0x8]
	ldr r3, [sp]
_08151800:
	lsrs r5, 1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r3]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r4, r0
	bcc _081517D2
_08151812:
	ldr r4, _08151840 @ =gUnknown_203F3E0
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x24
	ldrb r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08151836
	adds r0, r7, 0
	bl DestroyTask
	movs r0, 0x6
	bl sub_81549D4
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
_08151836:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08151840: .4byte gUnknown_203F3E0
_08151844: .4byte 0x0000318c
_08151848: .4byte gBlockRecvBuffer
	thumb_func_end sub_8151750

	thumb_func_start sub_815184C
sub_815184C: @ 815184C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	ldr r6, _08151928 @ =gUnknown_203F3E0
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x24
	ldrb r7, [r1]
	ldr r2, _0815192C @ =0x000031a0
	adds r1, r0, r2
	ldr r3, _08151930 @ =0x000031cc
	adds r2, r0, r3
	ldr r4, _08151934 @ =0x00003208
	adds r3, r0, r4
	ldr r5, _08151938 @ =0x00003244
	adds r4, r0, r5
	str r4, [sp]
	adds r5, 0x3C
	adds r4, r0, r5
	str r4, [sp, 0x4]
	adds r5, 0x3C
	adds r4, r0, r5
	str r4, [sp, 0x8]
	adds r4, r0, 0
	adds r4, 0x40
	str r4, [sp, 0xC]
	movs r5, 0x90
	lsls r5, 1
	adds r4, r0, r5
	str r4, [sp, 0x10]
	movs r4, 0x96
	lsls r4, 1
	adds r0, r4
	str r0, [sp, 0x14]
	movs r0, 0
	bl sub_815A950
	ldr r1, [r6]
	ldr r5, _0815193C @ =0x000031b0
	adds r2, r1, r5
	str r0, [r2]
	movs r0, 0x94
	lsls r0, 1
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	movs r5, 0x1
	cmp r5, r7
	bcs _081518F4
_081518B0:
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0xA8
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _081518EA
	lsls r0, r5, 4
	subs r0, r5
	lsls r4, r0, 2
	adds r1, r4, r1
	ldr r2, _08151930 @ =0x000031cc
	adds r1, r2
	adds r0, r5, 0
	bl sub_815AB04
	adds r1, r0, 0
	cmp r1, 0
	bne _081518EA
	ldr r0, [r6]
	adds r0, r4
	ldr r3, _08151930 @ =0x000031cc
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r6]
	movs r4, 0x94
	lsls r4, 1
	adds r0, r4
	strb r1, [r0]
_081518EA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _081518B0
_081518F4:
	ldr r5, _08151928 @ =gUnknown_203F3E0
	ldr r1, [r5]
	movs r6, 0x92
	lsls r6, 1
	adds r1, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _08151952
	ldr r1, [r5]
	movs r2, 0x94
	lsls r2, 1
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, 0
	beq _08151940
	bl sub_80FBA44
	ldr r0, [r5]
	adds r0, r6
	movs r1, 0
	strb r1, [r0]
	b _08151952
	.align 2, 0
_08151928: .4byte gUnknown_203F3E0
_0815192C: .4byte 0x000031a0
_08151930: .4byte 0x000031cc
_08151934: .4byte 0x00003208
_08151938: .4byte 0x00003244
_0815193C: .4byte 0x000031b0
_08151940:
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, 0x46
	bls _08151952
	bl sub_80FBA44
	ldr r0, [r5]
	adds r0, r6
	strb r4, [r0]
_08151952:
	movs r5, 0
	cmp r5, r7
	bcs _08151A46
	ldr r3, _0815199C @ =0x000031cc
	mov r12, r3
	ldr r4, _081519A0 @ =gUnknown_203F3E0
	mov r8, r4
_08151960:
	mov r6, r8
	ldr r2, [r6]
	lsls r0, r5, 4
	subs r1, r0, r5
	lsls r1, 2
	adds r1, r2, r1
	add r1, r12
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	beq _08151986
	adds r0, r2, 0
	adds r0, 0xA8
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0
	bne _08151986
	movs r0, 0x1
	strb r0, [r1]
_08151986:
	adds r3, r4, 0
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0xA8
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	bgt _081519A4
	cmp r0, 0x1
	bge _081519AA
	b _08151A3C
	.align 2, 0
_0815199C: .4byte 0x000031cc
_081519A0: .4byte gUnknown_203F3E0
_081519A4:
	cmp r0, 0x4
	beq _081519F8
	b _08151A3C
_081519AA:
	adds r1, 0xB0
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _08151A3C
	ldr r0, [r3]
	adds r0, 0xB0
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, 0xA8
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r3]
	subs r1, r6, r5
	lsls r1, 2
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, r1
	ldr r6, _081519F0 @ =0x000031d0
	adds r0, r6
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, r1
	ldr r1, _081519F4 @ =0x000031d4
	adds r0, r1
	b _08151A3A
	.align 2, 0
_081519F0: .4byte 0x000031d0
_081519F4: .4byte 0x000031d4
_081519F8:
	adds r1, 0xB0
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	bls _08151A3C
	ldr r0, [r4]
	adds r0, 0xB0
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, 0xA8
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r4]
	subs r1, r6, r5
	lsls r1, 2
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, r1
	ldr r3, _08151A54 @ =0x000031d0
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, r1
	ldr r6, _08151A58 @ =0x000031d4
	adds r0, r6
_08151A3A:
	strb r2, [r0]
_08151A3C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08151960
_08151A46:
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08151A54: .4byte 0x000031d0
_08151A58: .4byte 0x000031d4
	thumb_func_end sub_815184C

	thumb_func_start sub_8151A5C
sub_8151A5C: @ 8151A5C
	push {r4-r7,lr}
	sub sp, 0x18
	ldr r5, _08151B20 @ =gUnknown_203F3E0
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0x24
	ldrb r6, [r1]
	ldr r2, _08151B24 @ =0x000031a0
	adds r1, r0, r2
	ldr r3, _08151B28 @ =0x000031cc
	adds r2, r0, r3
	ldr r4, _08151B2C @ =0x00003208
	adds r3, r0, r4
	ldr r7, _08151B30 @ =0x00003244
	adds r4, r0, r7
	str r4, [sp]
	adds r7, 0x3C
	adds r4, r0, r7
	str r4, [sp, 0x4]
	adds r7, 0x3C
	adds r4, r0, r7
	str r4, [sp, 0x8]
	adds r4, r0, 0
	adds r4, 0x40
	str r4, [sp, 0xC]
	movs r7, 0x90
	lsls r7, 1
	adds r4, r0, r7
	str r4, [sp, 0x10]
	movs r4, 0x96
	lsls r4, 1
	adds r0, r4
	str r0, [sp, 0x14]
	movs r0, 0
	bl sub_815A950
	ldr r1, [r5]
	ldr r7, _08151B34 @ =0x000031b0
	adds r2, r1, r7
	str r0, [r2]
	movs r0, 0x94
	lsls r0, 1
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	movs r4, 0x1
	cmp r4, r6
	bcs _08151AEC
_08151ABC:
	adds r0, r4, 0
	bl sub_815AB60
	cmp r0, 0
	beq _08151AE2
	ldr r0, _08151B20 @ =gUnknown_203F3E0
	ldr r2, [r0]
	lsls r1, r4, 2
	movs r3, 0x98
	lsls r3, 1
	adds r0, r2, r3
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	movs r7, 0x94
	lsls r7, 1
	adds r1, r2, r7
	movs r0, 0
	strb r0, [r1]
_08151AE2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08151ABC
_08151AEC:
	ldr r5, _08151B20 @ =gUnknown_203F3E0
	ldr r1, [r5]
	movs r6, 0x92
	lsls r6, 1
	adds r1, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _08151B4A
	ldr r1, [r5]
	movs r2, 0x94
	lsls r2, 1
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, 0
	beq _08151B38
	bl sub_80FBA44
	ldr r0, [r5]
	adds r0, r6
	movs r1, 0
	strb r1, [r0]
	b _08151B4A
	.align 2, 0
_08151B20: .4byte gUnknown_203F3E0
_08151B24: .4byte 0x000031a0
_08151B28: .4byte 0x000031cc
_08151B2C: .4byte 0x00003208
_08151B30: .4byte 0x00003244
_08151B34: .4byte 0x000031b0
_08151B38:
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, 0x46
	bls _08151B4A
	bl sub_80FBA44
	ldr r0, [r5]
	adds r0, r6
	strb r4, [r0]
_08151B4A:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8151A5C

	thumb_func_start sub_8151B54
sub_8151B54: @ 8151B54
	push {r4,r5,lr}
	ldr r5, _08151B6C @ =gUnknown_203F3E0
	ldr r0, [r5]
	ldrb r0, [r0, 0x18]
	cmp r0, 0x4
	beq _08151B90
	cmp r0, 0x4
	bgt _08151B70
	cmp r0, 0x3
	beq _08151B76
	b _08151B9A
	.align 2, 0
_08151B6C: .4byte gUnknown_203F3E0
_08151B70:
	cmp r0, 0xB
	beq _08151B96
	b _08151B9A
_08151B76:
	bl sub_8152A00
	adds r4, r0, 0
	cmp r4, 0x1
	bne _08151B9A
	bl sub_8152A70
	ldr r0, [r5]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r1
	str r4, [r0]
	b _08151B9A
_08151B90:
	bl sub_815184C
	b _08151B9A
_08151B96:
	bl sub_8151A5C
_08151B9A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8151B54

	thumb_func_start sub_8151BA0
sub_8151BA0: @ 8151BA0
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _08151BB4 @ =gUnknown_203F3E0
	ldr r5, [r0]
	ldrb r0, [r5, 0x18]
	cmp r0, 0x4
	beq _08151BB8
	cmp r0, 0xB
	beq _08151C08
	b _08151C44
	.align 2, 0
_08151BB4: .4byte gUnknown_203F3E0
_08151BB8:
	ldr r1, _08151BF8 @ =0x000032cc
	adds r0, r5, r1
	ldr r2, _08151BFC @ =0x000031cc
	adds r1, r5, r2
	ldr r3, _08151C00 @ =0x00003208
	adds r2, r5, r3
	ldr r4, _08151C04 @ =0x00003244
	adds r3, r5, r4
	movs r6, 0xCA
	lsls r6, 6
	adds r4, r5, r6
	str r4, [sp]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x4]
	adds r4, r5, 0
	adds r4, 0x40
	ldrb r4, [r4]
	str r4, [sp, 0x8]
	movs r6, 0x90
	lsls r6, 1
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, 0xC]
	adds r6, 0xC
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, 0x10]
	bl sub_815A61C
	b _08151C44
	.align 2, 0
_08151BF8: .4byte 0x000032cc
_08151BFC: .4byte 0x000031cc
_08151C00: .4byte 0x00003208
_08151C04: .4byte 0x00003244
_08151C08:
	ldr r1, _08151C4C @ =0x000032cc
	adds r0, r5, r1
	ldr r2, _08151C50 @ =0x000031cc
	adds r1, r5, r2
	ldr r3, _08151C54 @ =0x00003208
	adds r2, r5, r3
	ldr r4, _08151C58 @ =0x00003244
	adds r3, r5, r4
	movs r6, 0xCA
	lsls r6, 6
	adds r4, r5, r6
	str r4, [sp]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x4]
	adds r4, r5, 0
	adds r4, 0x40
	ldrb r4, [r4]
	str r4, [sp, 0x8]
	movs r6, 0x90
	lsls r6, 1
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, 0xC]
	adds r6, 0xC
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, 0x10]
	bl sub_815A61C
_08151C44:
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08151C4C: .4byte 0x000032cc
_08151C50: .4byte 0x000031cc
_08151C54: .4byte 0x00003208
_08151C58: .4byte 0x00003244
	thumb_func_end sub_8151BA0

	thumb_func_start sub_8151C5C
sub_8151C5C: @ 8151C5C
	push {r4-r6,lr}
	sub sp, 0x18
	ldr r0, _08151C70 @ =gUnknown_203F3E0
	ldr r5, [r0]
	ldrb r0, [r5, 0x18]
	cmp r0, 0x4
	beq _08151C74
	cmp r0, 0xB
	beq _08151CCC
	b _08151D10
	.align 2, 0
_08151C70: .4byte gUnknown_203F3E0
_08151C74:
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 2
	ldr r2, _08151CBC @ =0x000031a0
	adds r1, r2
	adds r1, r5, r1
	ldr r3, _08151CC0 @ =0x000031cc
	adds r2, r5, r3
	ldr r4, _08151CC4 @ =0x00003208
	adds r3, r5, r4
	ldr r6, _08151CC8 @ =0x00003244
	adds r4, r5, r6
	str r4, [sp]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x4]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x8]
	adds r4, r5, 0
	adds r4, 0x40
	str r4, [sp, 0xC]
	movs r6, 0x90
	lsls r6, 1
	adds r4, r5, r6
	str r4, [sp, 0x10]
	adds r6, 0xC
	adds r4, r5, r6
	str r4, [sp, 0x14]
	bl sub_815A950
	b _08151D10
	.align 2, 0
_08151CBC: .4byte 0x000031a0
_08151CC0: .4byte 0x000031cc
_08151CC4: .4byte 0x00003208
_08151CC8: .4byte 0x00003244
_08151CCC:
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 2
	ldr r2, _08151D18 @ =0x000031a0
	adds r1, r2
	adds r1, r5, r1
	ldr r3, _08151D1C @ =0x000031cc
	adds r2, r5, r3
	ldr r4, _08151D20 @ =0x00003208
	adds r3, r5, r4
	ldr r6, _08151D24 @ =0x00003244
	adds r4, r5, r6
	str r4, [sp]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x4]
	adds r6, 0x3C
	adds r4, r5, r6
	str r4, [sp, 0x8]
	adds r4, r5, 0
	adds r4, 0x40
	str r4, [sp, 0xC]
	movs r6, 0x90
	lsls r6, 1
	adds r4, r5, r6
	str r4, [sp, 0x10]
	adds r6, 0xC
	adds r4, r5, r6
	str r4, [sp, 0x14]
	bl sub_815A950
_08151D10:
	add sp, 0x18
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08151D18: .4byte 0x000031a0
_08151D1C: .4byte 0x000031cc
_08151D20: .4byte 0x00003208
_08151D24: .4byte 0x00003244
	thumb_func_end sub_8151C5C

	thumb_func_start sub_8151D28
sub_8151D28: @ 8151D28
	push {r4,lr}
	ldr r4, _08151D40 @ =gUnknown_203F3E0
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0x4
	beq _08151D5E
	cmp r0, 0x4
	bgt _08151D44
	cmp r0, 0x3
	beq _08151D4A
	b _08151D90
	.align 2, 0
_08151D40: .4byte gUnknown_203F3E0
_08151D44:
	cmp r0, 0xB
	beq _08151D74
	b _08151D90
_08151D4A:
	movs r0, 0x1
	bl sub_815A5BC
	ldr r0, [r4]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	b _08151D90
_08151D5E:
	ldr r2, _08151D70 @ =0x000032f8
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08151D90
	bl sub_815AAD8
	b _08151D90
	.align 2, 0
_08151D70: .4byte 0x000032f8
_08151D74:
	movs r2, 0x90
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _08151D90
	adds r2, 0xC
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _08151D90
	movs r0, 0x1
	bl sub_815AB3C
_08151D90:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8151D28

	thumb_func_start sub_8151D98
sub_8151D98: @ 8151D98
	push {r4-r6,lr}
	ldr r6, _08151DD0 @ =gUnknown_203F3E0
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r1, r2, r0
	ldr r3, _08151DD4 @ =0x000031cc
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08151DD8
	bl IsSEPlaying
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08151E3A
	ldr r0, [r6]
	movs r2, 0xA2
	lsls r2, 1
	adds r0, r2
	strb r1, [r0]
	b _08151E3A
	.align 2, 0
_08151DD0: .4byte gUnknown_203F3E0
_08151DD4: .4byte 0x000031cc
_08151DD8:
	ldr r3, _08151E04 @ =0x000031d0
	adds r0, r1, r3
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _08151E08
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08151E3A
	movs r0, 0x19
	bl m4aSongNumStop
	movs r0, 0x19
	bl PlaySE
	ldr r0, [r6]
	movs r2, 0xA2
	lsls r2, 1
	adds r0, r2
	b _08151E38
	.align 2, 0
_08151E04: .4byte 0x000031d0
_08151E08:
	ldr r3, _08151E64 @ =0x000031d4
	adds r0, r1, r3
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _08151E3A
	movs r5, 0xA2
	lsls r5, 1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _08151E3A
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08151E3A
	movs r0, 0x16
	bl PlaySE
	movs r0, 0x1
	bl sub_8153BC0
	ldr r0, [r6]
	adds r0, r5
_08151E38:
	strb r4, [r0]
_08151E3A:
	ldr r0, _08151E68 @ =gUnknown_203F3E0
	ldr r2, [r0]
	movs r5, 0xAA
	lsls r5, 1
	adds r1, r2, r5
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0
	bne _08151E6C
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _08151E6C
	bl StopMapMusic
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x1
	b _08151E8A
	.align 2, 0
_08151E64: .4byte 0x000031d4
_08151E68: .4byte gUnknown_203F3E0
_08151E6C:
	ldr r0, [r4]
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08151E8C
	movs r0, 0xA
	bl PlayFanfareByFanfareNum
	ldr r0, [r4]
	movs r2, 0xAA
	lsls r2, 1
	adds r0, r2
	movs r1, 0x2
_08151E8A:
	strb r1, [r0]
_08151E8C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8151D98

	thumb_func_start sub_8151E94
sub_8151E94: @ 8151E94
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _08151EE0 @ =gUnknown_203F3E0
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0x44
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r2, 0
	adds r0, 0x48
	ldrb r7, [r0]
	subs r0, 0x20
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r1, r2, r0
	ldr r3, _08151EE4 @ =0x000031cc
	adds r0, r1, r3
	ldrb r3, [r0]
	cmp r3, 0
	bne _08151EEC
	ldr r4, _08151EE8 @ =0x000031d0
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08151F4E
	adds r4, 0x4
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08151F4E
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r2, r1
	strb r3, [r0]
	b _08151F4E
	.align 2, 0
_08151EE0: .4byte gUnknown_203F3E0
_08151EE4: .4byte 0x000031cc
_08151EE8: .4byte 0x000031d0
_08151EEC:
	ldr r3, _08151F18 @ =0x000031d0
	adds r0, r1, r3
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _08151F1C
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08151F4E
	movs r0, 0x19
	bl m4aSongNumStop
	movs r0, 0x19
	bl PlaySE
	ldr r0, [r6]
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r3
	b _08151F4C
	.align 2, 0
_08151F18: .4byte 0x000031d0
_08151F1C:
	ldr r4, _08151FA0 @ =0x000031d4
	adds r0, r1, r4
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _08151F4E
	movs r5, 0xA2
	lsls r5, 1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _08151F4E
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08151F4E
	movs r0, 0x16
	bl PlaySE
	movs r0, 0x1
	bl sub_8153BC0
	ldr r0, [r6]
	adds r0, r5
_08151F4C:
	strb r4, [r0]
_08151F4E:
	mov r4, r8
	cmp r4, r7
	bcs _08151FC2
	ldr r5, _08151FA4 @ =gUnknown_203F3E0
_08151F56:
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	ldr r1, _08151FA8 @ =0x000031a0
	adds r0, r1
	adds r0, r2, r0
	adds r1, r0, 0
	adds r1, 0x14
	adds r0, 0x1F
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _08151FAC
	movs r3, 0xA4
	lsls r3, 1
	adds r0, r2, r3
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08151FB8
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r0, 0x43
	bl PlaySE
	ldr r0, [r5]
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	movs r1, 0x1
	b _08151FB6
	.align 2, 0
_08151FA0: .4byte 0x000031d4
_08151FA4: .4byte gUnknown_203F3E0
_08151FA8: .4byte 0x000031a0
_08151FAC:
	movs r3, 0xA4
	lsls r3, 1
	adds r0, r2, r3
	adds r0, r4
	movs r1, 0
_08151FB6:
	strb r1, [r0]
_08151FB8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r7
	bcc _08151F56
_08151FC2:
	ldr r0, _08151FEC @ =gUnknown_203F3E0
	ldr r2, [r0]
	movs r5, 0xAA
	lsls r5, 1
	adds r1, r2, r5
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0
	bne _08151FF0
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _08151FF0
	bl StopMapMusic
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x1
	b _0815200E
	.align 2, 0
_08151FEC: .4byte gUnknown_203F3E0
_08151FF0:
	ldr r0, [r4]
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08152010
	movs r0, 0xA
	bl PlayFanfareByFanfareNum
	ldr r0, [r4]
	movs r3, 0xAA
	lsls r3, 1
	adds r0, r3
	movs r1, 0x2
_0815200E:
	strb r1, [r0]
_08152010:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8151E94

	thumb_func_start sub_815201C
sub_815201C: @ 815201C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_815201C

	thumb_func_start sub_8152034
sub_8152034: @ 8152034
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	thumb_func_end sub_8152034

	thumb_func_start sub_8152048
sub_8152048: @ 8152048
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	bl IsMonShiny
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8152048

	thumb_func_start sub_815205C
sub_815205C: @ 815205C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	bl CreateTask
	pop {r0}
	bx r0
	thumb_func_end sub_815205C

	thumb_func_start sub_815206C
sub_815206C: @ 815206C
	push {lr}
	movs r1, 0x1
	bl CreateTask
	ldr r1, _0815208C @ =gUnknown_203F3E0
	ldr r3, [r1]
	movs r2, 0
	strb r0, [r3, 0x4]
	ldr r0, [r1]
	strb r2, [r0, 0x10]
	ldr r0, [r1]
	strb r2, [r0, 0xC]
	ldr r0, [r1]
	strb r2, [r0, 0x14]
	pop {r0}
	bx r0
	.align 2, 0
_0815208C: .4byte gUnknown_203F3E0
	thumb_func_end sub_815206C

	thumb_func_start sub_8152090
sub_8152090: @ 8152090
	push {r4,lr}
	ldr r2, _081520B0 @ =gUnknown_203F3E0
	ldr r1, [r2]
	ldrb r3, [r1, 0x18]
	movs r4, 0
	strb r3, [r1, 0x1C]
	ldr r1, [r2]
	strb r0, [r1, 0x18]
	ldr r0, [r2]
	strb r4, [r0, 0x10]
	ldr r0, [r2]
	strb r4, [r0, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081520B0: .4byte gUnknown_203F3E0
	thumb_func_end sub_8152090

	thumb_func_start sub_81520B4
sub_81520B4: @ 81520B4
	push {r4,lr}
	ldr r3, _081520E8 @ =gUnknown_203F3E0
	ldr r1, [r3]
	ldrb r0, [r1, 0x14]
	lsrs r2, r0, 2
	adds r0, 0x1
	strb r0, [r1, 0x14]
	cmp r2, 0
	beq _08152108
	ldr r3, [r3]
	ldrb r0, [r3, 0x14]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08152108
	ldr r1, _081520EC @ =gUnknown_8475548
	adds r0, r3, 0
	adds r0, 0x24
	ldrb r0, [r0]
	subs r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	bcc _081520F0
	movs r0, 0x1
	b _0815210A
	.align 2, 0
_081520E8: .4byte gUnknown_203F3E0
_081520EC: .4byte gUnknown_8475548
_081520F0:
	lsls r4, r2, 3
	adds r1, r4, 0
	movs r0, 0x14
	bl SetGpuReg
	negs r4, r4
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x18
	adds r1, r4, 0
	bl SetGpuReg
_08152108:
	movs r0, 0
_0815210A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81520B4

	thumb_func_start sub_8152110
sub_8152110: @ 8152110
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _08152168 @ =gUnknown_203F3E0
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x44
	adds r0, 0x48
	ldrb r5, [r0]
	ldrb r1, [r1]
	cmp r1, r5
	bcs _0815215C
	mov r8, r2
	ldr r0, _0815216C @ =0x000032e0
	mov r12, r0
	movs r7, 0
	movs r6, 0x1
_08152132:
	mov r2, r8
	ldr r0, [r2]
	mov r2, r12
	adds r4, r0, r2
	ldr r2, _08152170 @ =0x000032eb
	adds r0, r2
	adds r2, r0, r1
	movs r3, 0
	adds r0, r1, 0
	ands r0, r6
	cmp r0, 0
	bne _0815214C
	movs r3, 0x1
_0815214C:
	strb r3, [r2]
	adds r0, r4, r1
	strb r7, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r5
	bcc _08152132
_0815215C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08152168: .4byte gUnknown_203F3E0
_0815216C: .4byte 0x000032e0
_08152170: .4byte 0x000032eb
	thumb_func_end sub_8152110

	thumb_func_start sub_8152174
sub_8152174: @ 8152174
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r0, _08152248 @ =gUnknown_203F3E0
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x44
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r1, 0
	adds r0, 0x48
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	str r0, [sp, 0x8]
	adds r0, r1, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _081521A8
	b _08152464
_081521A8:
	movs r6, 0
	ldr r0, [sp, 0x8]
	cmp r6, r0
	bcs _08152290
_081521B0:
	ldr r3, _08152248 @ =gUnknown_203F3E0
	lsls r0, r6, 4
	subs r1, r0, r6
	lsls r1, 2
	ldr r2, [r3]
	adds r1, r2
	ldr r4, _0815224C @ =0x000031cc
	adds r4, r1
	mov r8, r4
	ldrb r1, [r4]
	mov r9, r0
	adds r0, r6, 0x1
	str r0, [sp, 0xC]
	cmp r1, 0
	beq _08152284
	adds r0, r2, 0
	adds r0, 0xA8
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08152284
	ldr r1, [sp]
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r10, r2
	bcs _08152284
	adds r7, r3, 0
_081521E6:
	ldr r0, _08152250 @ =gUnknown_8471F50
	add r0, r10
	ldrb r5, [r0]
	ldr r1, [r7]
	lsls r4, r5, 1
	adds r0, r1, 0
	adds r0, 0xF4
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _08152284
	adds r0, r1, 0
	adds r0, 0xF5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _08152284
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, 0
	adds r2, r5, 0
	bl sub_8152484
	cmp r0, 0x1
	bne _08152260
	movs r2, 0
	ldr r3, _08152248 @ =gUnknown_203F3E0
	mov r8, r4
_0815221E:
	ldr r0, [r3]
	mov r4, r8
	adds r1, r2, r4
	adds r0, 0xF4
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08152254
	strb r6, [r1]
	ldr r0, [r3]
	adds r0, 0xA8
	adds r0, r6
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, 0xC4
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	b _08152284
	.align 2, 0
_08152248: .4byte gUnknown_203F3E0
_0815224C: .4byte 0x000031cc
_08152250: .4byte gUnknown_8471F50
_08152254:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bls _0815221E
	b _08152284
_08152260:
	ldr r0, [r7]
	mov r2, r9
	subs r1, r2, r6
	lsls r1, 2
	adds r0, r1
	ldr r4, _08152354 @ =0x000031d4
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08152284
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, [sp, 0x4]
	cmp r10, r0
	bcc _081521E6
_08152284:
	ldr r1, [sp, 0xC]
	lsls r0, r1, 24
	lsrs r6, r0, 24
	ldr r2, [sp, 0x8]
	cmp r6, r2
	bcc _081521B0
_08152290:
	ldr r4, [sp]
	mov r10, r4
	ldr r0, [sp, 0x4]
	cmp r10, r0
	bcc _0815229C
	b _08152464
_0815229C:
	ldr r1, _08152358 @ =gUnknown_203F3E0
	mov r9, r1
_081522A0:
	movs r6, 0xFF
	ldr r0, _0815235C @ =gUnknown_8471F50
	add r0, r10
	ldrb r5, [r0]
	mov r2, r9
	ldr r0, [r2]
	adds r0, 0xC4
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _081522B8
	b _08152452
_081522B8:
	adds r0, r5, 0
	bl sub_8152BD4
	mov r1, r9
	ldr r4, [r1]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r1, 0x90
	adds r1, r0
	ldrb r0, [r1]
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _081522DE
	movs r3, 0x2
_081522DE:
	ldr r2, _08152360 @ =gUnknown_847553C
	ldr r0, _08152364 @ =0x000031b4
	adds r1, r4, r0
	adds r1, r5
	lsls r0, r3, 1
	adds r0, r3
	ldrb r1, [r1]
	adds r0, r1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0xD0
	adds r0, r5
	ldrb r0, [r0]
	subs r2, r1, r0
	cmp r2, 0x5
	bgt _0815230C
	adds r1, r4, 0
	adds r1, 0x9C
	adds r1, r5
	ldrb r0, [r1]
	adds r0, r2
	strb r0, [r1]
_0815230C:
	mov r2, r9
	ldr r1, [r2]
	adds r1, 0x9C
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	movs r4, 0xFF
	ands r0, r4
	cmp r0, 0x5
	bhi _08152326
	b _08152452
_08152326:
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0x9C
	adds r0, r5
	strb r2, [r0]
	ldr r3, [r1]
	lsls r1, r5, 1
	adds r0, r3, 0
	adds r0, 0xF4
	adds r2, r0, r1
	ldrb r0, [r2]
	mov r8, r1
	cmp r0, 0xFF
	bne _08152368
	adds r0, r3, 0
	adds r0, 0xF5
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08152350
	b _08152452
_08152350:
	b _08152378
	.align 2, 0
_08152354: .4byte 0x000031d4
_08152358: .4byte gUnknown_203F3E0
_0815235C: .4byte gUnknown_8471F50
_08152360: .4byte gUnknown_847553C
_08152364: .4byte 0x000031b4
_08152368:
	adds r0, r3, 0
	adds r0, 0xF5
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08152378
	ldrb r4, [r2]
	b _0815239E
_08152378:
	mov r2, r9
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0xF4
	add r0, r8
	ldrb r7, [r0]
	adds r1, 0xF5
	add r1, r8
	ldrb r6, [r1]
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _0815239A
	adds r4, r7, 0
	b _0815239E
_0815239A:
	adds r4, r6, 0
	adds r6, r7, 0
_0815239E:
	mov r1, r9
	ldr r0, [r1]
	ldr r2, _08152474 @ =0x000032eb
	adds r0, r2
	adds r0, r5
	movs r1, 0x7
	strb r1, [r0]
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0xC4
	adds r0, r5
	movs r1, 0x2
	strb r1, [r0]
	mov r2, r9
	ldr r0, [r2]
	adds r0, 0xA8
	adds r0, r4
	movs r1, 0x3
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xB8
	adds r0, r5
	strb r4, [r0]
	ldr r1, [r2]
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 2
	adds r1, r0
	ldr r2, _08152478 @ =0x000031d0
	adds r1, r2
	movs r0, 0x1
	strb r0, [r1]
	mov r2, r9
	ldr r1, [r2]
	lsls r0, r6, 4
	subs r0, r6
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815247C @ =0x000031d4
	adds r1, r0
	movs r2, 0x1
	strb r2, [r1]
	mov r0, r9
	ldr r1, [r0]
	lsls r0, r4, 1
	adds r1, 0x86
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8152D34
	movs r0, 0x1
	bl sub_8152F94
	adds r0, r4, 0
	bl sub_8152B64
	mov r1, r9
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0xE8
	adds r1, r5
	ldr r2, _08152480 @ =0x000032e0
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	mov r4, r9
	ldr r0, [r4]
	adds r0, r2
	adds r0, r5
	movs r1, 0x3
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, 0xF4
	add r1, r8
	ldrb r0, [r1]
	movs r2, 0xFF
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, 0xF5
	add r1, r8
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_08152452:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r4, [sp, 0x4]
	cmp r10, r4
	bcs _08152464
	b _081522A0
_08152464:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08152474: .4byte 0x000032eb
_08152478: .4byte 0x000031d0
_0815247C: .4byte 0x000031d4
_08152480: .4byte 0x000032e0
	thumb_func_end sub_8152174

	thumb_func_start sub_8152484
sub_8152484: @ 8152484
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r7, 0
	ldr r2, _081524B8 @ =gUnknown_203F3E0
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x24
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081524BC @ =0x000032e0
	adds r1, r0
	mov r12, r2
	cmp r3, 0x2
	beq _081524C0
	cmp r3, 0x2
	bgt _081524C6
	cmp r3, 0x1
	beq _081524C4
	b _081524C6
	.align 2, 0
_081524B8: .4byte gUnknown_203F3E0
_081524BC: .4byte 0x000032e0
_081524C0:
	movs r7, 0x1
	b _081524C6
_081524C4:
	movs r7, 0x2
_081524C6:
	adds r0, r1, 0
	adds r0, 0xB
	adds r0, r6
	ldrb r0, [r0]
	subs r0, 0x6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08152524
	ldr r0, _08152518 @ =gUnknown_8472063
	lsls r1, r4, 1
	adds r1, r4
	adds r1, r7, r1
	lsls r2, r5, 4
	subs r2, r5
	adds r1, r2
	adds r1, r0
	ldrb r1, [r1]
	cmp r6, r1
	bne _0815255A
	mov r0, r12
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xC4
	adds r0, r6
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08152520
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 2
	adds r0, r1, r0
	ldr r1, _0815251C @ =0x000031d4
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _0815255A
	.align 2, 0
_08152518: .4byte gUnknown_8472063
_0815251C: .4byte 0x000031d4
_08152520:
	movs r0, 0x1
	b _0815255C
_08152524:
	ldr r0, _08152564 @ =gUnknown_8472063
	lsls r1, r4, 1
	adds r1, r4
	adds r1, r7, r1
	lsls r2, r5, 4
	subs r2, r5
	adds r1, r2
	adds r1, r0
	ldrb r1, [r1]
	cmp r6, r1
	bne _0815255A
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xA8
	adds r0, r4
	movs r1, 0x4
	strb r1, [r0]
	mov r0, r12
	ldr r1, [r0]
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 2
	adds r1, r0
	ldr r0, _08152568 @ =0x000031d4
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
_0815255A:
	movs r0, 0
_0815255C:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08152564: .4byte gUnknown_8472063
_08152568: .4byte 0x000031d4
	thumb_func_end sub_8152484

	thumb_func_start sub_815256C
sub_815256C: @ 815256C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _08152640 @ =gUnknown_203F3E0
	ldr r4, [r2]
	adds r0, r4, 0
	adds r0, 0x44
	ldrb r1, [r0]
	adds r0, 0x4
	ldrb r0, [r0]
	mov r9, r0
	movs r3, 0
	mov r10, r3
	movs r5, 0x90
	lsls r5, 1
	adds r0, r4, r5
	str r3, [r0]
	adds r5, r1, 0
	mov r0, r9
	subs r0, 0x1
	cmp r5, r0
	blt _0815259E
	b _081527BC
_0815259E:
	mov r8, r2
_081525A0:
	mov r0, r8
	ldr r4, [r0]
	adds r0, r4, 0
	adds r0, 0xC4
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _081525B2
	b _081526BC
_081525B2:
	movs r1, 0x90
	lsls r1, 1
	adds r0, r4, r1
	movs r2, 0x1
	str r2, [r0]
	ldr r1, _08152644 @ =0x000032eb
	adds r0, r4, r1
	adds r6, r0, r5
	ldrb r0, [r6]
	cmp r0, 0x9
	bls _0815264C
	movs r7, 0
	movs r0, 0xA
	strb r0, [r6]
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xC4
	adds r0, r5
	movs r1, 0x3
	strb r1, [r0]
	mov r1, r8
	ldr r0, [r1]
	movs r6, 0xA4
	lsls r6, 1
	adds r0, r6
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0
	bne _081525FC
	strb r2, [r1]
	ldr r2, _08152648 @ =0x000032e0
	adds r0, r4, r2
	adds r0, r5
	ldrb r0, [r0]
	adds r0, 0x43
	bl PlaySE
_081525FC:
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _08152612
	mov r2, r10
	cmp r2, 0x1
	beq _08152612
	b _081527AC
_08152612:
	movs r0, 0x1
	mov r10, r0
	adds r0, r1, r6
	adds r0, r5
	strb r7, [r0]
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x40
	ldrb r0, [r1]
	cmp r0, 0x9
	bhi _0815262E
	adds r0, 0x1
	strb r0, [r1]
_0815262E:
	movs r0, 0x3
	adds r1, r5, 0
	movs r2, 0
	bl sub_8152D34
	movs r0, 0
	bl sub_8152F94
	b _081527AC
	.align 2, 0
_08152640: .4byte gUnknown_203F3E0
_08152644: .4byte 0x000032eb
_08152648: .4byte 0x000032e0
_0815264C:
	adds r0, r5, 0
	bl sub_8152BD4
	mov r2, r8
	ldr r7, [r2]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r7, 0
	adds r1, 0x90
	adds r1, r0
	ldrb r0, [r1]
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _08152672
	movs r3, 0x2
_08152672:
	ldr r2, _081526B4 @ =gUnknown_847553C
	ldr r0, _081526B8 @ =0x000032e0
	adds r1, r4, r0
	adds r1, r5
	lsls r0, r3, 1
	adds r0, r3
	ldrb r1, [r1]
	adds r0, r1
	adds r0, r2
	ldrb r2, [r0]
	adds r1, r7, 0
	adds r1, 0xD0
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r2
	bcc _081526AC
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xD0
	adds r0, r5
	strb r3, [r0]
_081526AC:
	bl sub_8152174
	b _081527AC
	.align 2, 0
_081526B4: .4byte gUnknown_847553C
_081526B8: .4byte 0x000032e0
_081526BC:
	cmp r0, 0x2
	bne _0815273C
	adds r1, r4, 0
	adds r1, 0xDC
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _081527AC
	mov r0, r8
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xB8
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r2, r0
	ldr r1, _08152730 @ =0x000031d0
	adds r2, r1
	strb r3, [r2]
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xDC
	adds r0, r5
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, 0xD0
	adds r0, r5
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, 0xC4
	adds r0, r5
	strb r3, [r0]
	ldr r1, _08152734 @ =0x000032eb
	adds r0, r4, r1
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r5, 0
	bl sub_8152BD4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	bl sub_8152BF8
	ldr r2, _08152738 @ =0x000032e0
	adds r1, r4, r2
	adds r1, r5
	strb r0, [r1]
	b _081527AC
	.align 2, 0
_08152730: .4byte 0x000031d0
_08152734: .4byte 0x000032eb
_08152738: .4byte 0x000032e0
_0815273C:
	cmp r0, 0x3
	bne _081527AC
	adds r1, r4, 0
	adds r1, 0xDC
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _081527AC
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _081527AC
	adds r0, r1, 0
	adds r0, 0xDC
	adds r0, r5
	strb r2, [r0]
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xD0
	adds r0, r5
	strb r2, [r0]
	ldr r0, [r1]
	adds r0, 0xC4
	adds r0, r5
	strb r2, [r0]
	ldr r2, _081527CC @ =0x000032eb
	adds r0, r4, r2
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	mov r0, r8
	ldr r1, [r0]
	adds r1, 0xE8
	adds r1, r5
	subs r2, 0xB
	adds r4, r2
	adds r4, r5
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r5, 0
	bl sub_8152BD4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	bl sub_8152BF8
	strb r0, [r4]
_081527AC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	subs r0, 0x1
	cmp r5, r0
	bge _081527BC
	b _081525A0
_081527BC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081527CC: .4byte 0x000032eb
	thumb_func_end sub_815256C

	thumb_func_start sub_81527D0
sub_81527D0: @ 81527D0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08152838 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x44
	adds r0, 0x48
	ldrb r0, [r0]
	mov r8, r0
	ldrb r6, [r1]
	cmp r6, r8
	bcs _081528C2
	ldr r0, _0815283C @ =gUnknown_8471F50
	mov r9, r0
_081527F0:
	ldr r0, _08152838 @ =gUnknown_203F3E0
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x28
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	ldr r2, _08152840 @ =0x000031a0
	adds r0, r2
	adds r7, r3, r0
	movs r0, 0xB
	adds r2, r1, 0
	muls r2, r0
	adds r2, r6, r2
	adds r3, 0x24
	ldrb r1, [r3]
	subs r1, 0x1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 3
	subs r0, r1
	adds r2, r0
	add r2, r9
	ldrb r4, [r2]
	adds r0, r7, 0
	adds r0, 0x1F
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08152844
	adds r0, r6, 0
	movs r1, 0
	bl sub_81542EC
	b _0815284C
	.align 2, 0
_08152838: .4byte gUnknown_203F3E0
_0815283C: .4byte gUnknown_8471F50
_08152840: .4byte 0x000031a0
_08152844:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_81542EC
_0815284C:
	adds r0, r7, 0
	adds r0, 0x1F
	adds r5, r0, r4
	ldrb r0, [r5]
	cmp r0, 0x9
	bls _08152878
	adds r0, r7, 0
	adds r0, 0x14
	adds r0, r4
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8154398
	ldrb r1, [r5]
	lsls r1, 25
	movs r0, 0xFF
	lsls r0, 24
	adds r1, r0
	b _0815289A
_08152878:
	adds r0, r7, 0
	adds r0, 0x14
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, 0x3
	bne _081528A4
	movs r0, 0x7
	strb r0, [r5]
	adds r0, r6, 0
	movs r1, 0x6
	bl sub_8154398
	ldrb r1, [r5]
	lsls r1, 25
	movs r2, 0xFF
	lsls r2, 24
	adds r1, r2
_0815289A:
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8154370
	b _081528B8
_081528A4:
	ldrb r1, [r3]
	adds r0, r6, 0
	bl sub_8154398
	ldrb r1, [r5]
	lsls r1, 25
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8154370
_081528B8:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r8
	bcc _081527F0
_081528C2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81527D0

	thumb_func_start sub_81528D0
sub_81528D0: @ 81528D0
	push {r4-r6,lr}
	ldr r1, _08152908 @ =gUnknown_203F3E0
	ldr r0, [r1]
	adds r0, 0x24
	ldrb r5, [r0]
	movs r4, 0
	cmp r4, r5
	bcs _08152902
	adds r6, r1, 0
_081528E2:
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 2
	ldr r1, [r6]
	adds r0, r1
	ldr r1, _0815290C @ =0x000031cc
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8153DA8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _081528E2
_08152902:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08152908: .4byte gUnknown_203F3E0
_0815290C: .4byte 0x000031cc
	thumb_func_end sub_81528D0

	thumb_func_start sub_8152910
sub_8152910: @ 8152910
	push {r4,r5,lr}
	ldr r0, _08152938 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r5, [r0]
	movs r4, 0
	cmp r4, r5
	bcs _08152932
_08152920:
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_8153DA8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08152920
_08152932:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08152938: .4byte gUnknown_203F3E0
	thumb_func_end sub_8152910

	thumb_func_start sub_815293C
sub_815293C: @ 815293C
	push {lr}
	bl sub_81527D0
	ldr r0, _08152954 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _08152958
	bl sub_8152910
	b _0815295C
	.align 2, 0
_08152954: .4byte gUnknown_203F3E0
_08152958:
	bl sub_81528D0
_0815295C:
	ldr r0, _0815296C @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x40
	ldrb r0, [r0]
	bl sub_8153FC8
	pop {r0}
	bx r0
	.align 2, 0
_0815296C: .4byte gUnknown_203F3E0
	thumb_func_end sub_815293C

	thumb_func_start sub_8152970
sub_8152970: @ 8152970
	push {lr}
	bl sub_81527D0
	ldr r0, _08152988 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x40
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _0815298C
	bl sub_8152910
	b _08152990
	.align 2, 0
_08152988: .4byte gUnknown_203F3E0
_0815298C:
	bl sub_81528D0
_08152990:
	ldr r0, _081529A0 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x40
	ldrb r0, [r0]
	bl sub_8153FC8
	pop {r0}
	bx r0
	.align 2, 0
_081529A0: .4byte gUnknown_203F3E0
	thumb_func_end sub_8152970

	thumb_func_start sub_81529A4
sub_81529A4: @ 81529A4
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x4
	bhi _081529FC
	lsls r0, 2
	ldr r1, _081529BC @ =_081529C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081529BC: .4byte _081529C0
	.align 2, 0
_081529C0:
	.4byte _081529D4
	.4byte _081529DC
	.4byte _081529E4
	.4byte _081529EC
	.4byte _081529F4
_081529D4:
	movs r0, 0x4
	strb r0, [r3]
	movs r0, 0x7
	b _081529FA
_081529DC:
	movs r0, 0x3
	strb r0, [r3]
	movs r0, 0x8
	b _081529FA
_081529E4:
	movs r0, 0x2
	strb r0, [r3]
	movs r0, 0x9
	b _081529FA
_081529EC:
	movs r0, 0x1
	strb r0, [r3]
	movs r0, 0xA
	b _081529FA
_081529F4:
	movs r0, 0
	strb r0, [r3]
	movs r0, 0xB
_081529FA:
	strb r0, [r2]
_081529FC:
	pop {r0}
	bx r0
	thumb_func_end sub_81529A4

	thumb_func_start sub_8152A00
sub_8152A00: @ 8152A00
	push {r4-r6,lr}
	ldr r1, _08152A58 @ =gUnknown_203F3E0
	ldr r0, [r1]
	adds r0, 0x24
	ldrb r5, [r0]
	movs r4, 0x1
	cmp r4, r5
	bcs _08152A66
	adds r6, r1, 0
_08152A12:
	ldr r0, [r6]
	movs r1, 0xAC
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08152A34
	adds r0, r4, 0
	bl sub_815A5E8
	ldr r1, [r6]
	movs r2, 0xAC
	lsls r2, 1
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
_08152A34:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08152A12
	cmp r4, r5
	bcs _08152A66
	ldr r0, _08152A58 @ =gUnknown_203F3E0
	ldr r0, [r0]
	movs r2, 0xAC
	lsls r2, 1
	adds r1, r0, r2
_08152A4C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08152A5C
	movs r0, 0
	b _08152A68
	.align 2, 0
_08152A58: .4byte gUnknown_203F3E0
_08152A5C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08152A4C
_08152A66:
	movs r0, 0x1
_08152A68:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8152A00

	thumb_func_start sub_8152A70
sub_8152A70: @ 8152A70
	push {r4,lr}
	movs r1, 0
	ldr r4, _08152A94 @ =gUnknown_203F3E0
	movs r3, 0xAC
	lsls r3, 1
	movs r2, 0
_08152A7C:
	ldr r0, [r4]
	adds r0, r3
	adds r0, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _08152A7C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08152A94: .4byte gUnknown_203F3E0
	thumb_func_end sub_8152A70

	thumb_func_start sub_8152A98
sub_8152A98: @ 8152A98
	push {r4,lr}
	ldr r3, _08152ACC @ =gUnknown_203F3E0
	ldr r1, [r3]
	adds r2, r1, 0
	adds r2, 0x40
	ldrb r0, [r2]
	cmp r0, 0x9
	bls _08152AD0
	movs r4, 0x90
	lsls r4, 1
	adds r0, r1, r4
	ldr r0, [r0]
	cmp r0, 0
	bne _08152AD0
	movs r0, 0xA
	strb r0, [r2]
	ldr r0, [r3]
	movs r1, 0x96
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _08152AD0
	movs r0, 0x1
	b _08152AD2
	.align 2, 0
_08152ACC: .4byte gUnknown_203F3E0
_08152AD0:
	movs r0, 0
_08152AD2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8152A98

	thumb_func_start sub_8152AD8
sub_8152AD8: @ 8152AD8
	push {r4-r6,lr}
	ldr r4, _08152B50 @ =gUnknown_203F3E0
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0x40
	ldrb r0, [r2]
	cmp r0, 0x9
	bls _08152B5C
	adds r0, r1, 0
	adds r0, 0x44
	ldrb r3, [r0]
	adds r0, 0x4
	ldrb r5, [r0]
	movs r0, 0xA
	strb r0, [r2]
	ldr r4, [r4]
	mov r12, r4
	movs r0, 0x96
	lsls r0, 1
	add r0, r12
	ldr r0, [r0]
	cmp r0, 0
	beq _08152B5C
	adds r4, r3, 0
	cmp r4, r5
	bcs _08152B4C
	mov r0, r12
	adds r0, 0x28
	ldrb r3, [r0]
	lsls r1, r3, 4
	subs r1, r3
	lsls r1, 2
	ldr r6, _08152B54 @ =gUnknown_8471F50
	subs r0, 0x4
	ldrb r2, [r0]
	subs r2, 0x1
	add r1, r12
	movs r0, 0xB
	muls r3, r0
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 3
	subs r2, r0, r2
	ldr r0, _08152B58 @ =0x000031bf
	adds r1, r0
_08152B32:
	adds r0, r4, r3
	adds r0, r2
	adds r0, r6
	ldrb r0, [r0]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0xA
	bne _08152B5C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08152B32
_08152B4C:
	movs r0, 0x1
	b _08152B5E
	.align 2, 0
_08152B50: .4byte gUnknown_203F3E0
_08152B54: .4byte gUnknown_8471F50
_08152B58: .4byte 0x000031bf
_08152B5C:
	movs r0, 0
_08152B5E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8152AD8

	thumb_func_start sub_8152B64
sub_8152B64: @ 8152B64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08152BCC @ =gUnknown_8475550
	mov r8, r0
	ldr r0, _08152BD0 @ =gUnknown_203F3E0
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0x90
	adds r0, r5
	mov r9, r0
	ldrb r7, [r0]
	adds r0, r7, 0
	movs r1, 0x7
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	add r4, r8
	adds r0, r7, 0
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldrb r4, [r4]
	adds r0, r4
	lsls r0, 24
	lsls r5, 1
	adds r6, 0x86
	adds r6, r5
	ldrh r1, [r6]
	lsrs r0, 24
	cmp r1, r0
	bcc _08152BBE
	adds r0, r7, 0x1
	mov r1, r9
	strb r0, [r1]
_08152BBE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08152BCC: .4byte gUnknown_8475550
_08152BD0: .4byte gUnknown_203F3E0
	thumb_func_end sub_8152B64

	thumb_func_start sub_8152BD4
sub_8152BD4: @ 8152BD4
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08152BF0 @ =gUnknown_84720FC
	ldr r1, _08152BF4 @ =gUnknown_203F3E0
	ldr r1, [r1]
	adds r1, 0x24
	ldrb r1, [r1]
	subs r1, 0x1
	movs r2, 0xB
	muls r1, r2
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08152BF0: .4byte gUnknown_84720FC
_08152BF4: .4byte gUnknown_203F3E0
	thumb_func_end sub_8152BD4

	thumb_func_start sub_8152BF8
sub_8152BF8: @ 8152BF8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _08152C78 @ =gUnknown_203F3E0
	ldr r1, [r4]
	adds r1, 0x24
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08152C7C @ =gUnknown_84720AE
	lsls r1, r0, 1
	adds r1, r0
	lsls r0, r2, 4
	subs r0, r2
	adds r1, r0
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r12, r0
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r3, 0x2
	adds r1, r3
	ldrb r1, [r1]
	mov r8, r1
	movs r3, 0
	ldr r1, _08152C80 @ =gUnknown_8472133
	lsls r0, r2, 2
	adds r2, r0, r2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08152C60
	adds r6, r1, 0
_08152C46:
	adds r0, r3, r2
	adds r0, r6
	ldrb r0, [r0]
	cmp r5, r0
	beq _08152C84
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r3, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08152C46
_08152C60:
	ldr r0, [r4]
	adds r0, 0x90
	mov r1, r12
	adds r2, r0, r1
	adds r1, r0, r7
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r0, r3
	bls _08152C8E
	adds r1, r0, 0
	b _08152C90
	.align 2, 0
_08152C78: .4byte gUnknown_203F3E0
_08152C7C: .4byte gUnknown_84720AE
_08152C80: .4byte gUnknown_8472133
_08152C84:
	ldr r0, [r4]
	adds r0, 0x90
	adds r0, r7
	ldrb r0, [r0]
	b _08152CA2
_08152C8E:
	ldrb r1, [r1]
_08152C90:
	ldr r0, [r4]
	adds r0, 0x90
	mov r2, r8
	adds r4, r0, r2
	ldrb r0, [r4]
	cmp r0, r1
	bls _08152CA0
	adds r1, r0, 0
_08152CA0:
	adds r0, r1, 0
_08152CA2:
	adds r1, r5, 0
	bl sub_8152CB8
	lsls r0, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8152BF8

	thumb_func_start sub_8152CB8
sub_8152CB8: @ 8152CB8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08152CE4 @ =gUnknown_203F3E0
	ldr r2, [r2]
	adds r2, 0xE8
	adds r2, r1
	ldrb r4, [r2]
	movs r1, 0x7
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bhi _08152D26
	lsls r0, 2
	ldr r1, _08152CE8 @ =_08152CEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08152CE4: .4byte gUnknown_203F3E0
_08152CE8: .4byte _08152CEC
	.align 2, 0
_08152CEC:
	.4byte _08152D26
	.4byte _08152D1E
	.4byte _08152D2A
	.4byte _08152D08
	.4byte _08152D0E
	.4byte _08152D14
	.4byte _08152D1A
_08152D08:
	cmp r4, 0
	beq _08152D1E
	b _08152D26
_08152D0E:
	cmp r4, 0
	beq _08152D2A
	b _08152D26
_08152D14:
	cmp r4, 0x2
	beq _08152D1E
	b _08152D2A
_08152D1A:
	cmp r4, 0
	bne _08152D22
_08152D1E:
	movs r0, 0x1
	b _08152D2C
_08152D22:
	cmp r4, 0x1
	beq _08152D2A
_08152D26:
	movs r0, 0
	b _08152D2C
_08152D2A:
	movs r0, 0x2
_08152D2C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8152CB8

	thumb_func_start sub_8152D34
sub_8152D34: @ 8152D34
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _08152D60 @ =gUnknown_203F3E0
	ldr r2, [r1]
	adds r0, r2, 0
	adds r0, 0x24
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r4, 0
	bge _08152D54
	b _08152F8E
_08152D54:
	cmp r4, 0x2
	ble _08152D64
	cmp r4, 0x3
	beq _08152D94
	b _08152F8E
	.align 2, 0
_08152D60: .4byte gUnknown_203F3E0
_08152D64:
	ldr r1, _08152D8C @ =0x000031b4
	adds r0, r2, r1
	adds r0, r3
	ldrb r4, [r0]
	lsls r4, 1
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r4, r0
	adds r0, r2, 0
	adds r0, 0x4A
	adds r0, r4
	ldrh r0, [r0]
	ldr r1, _08152D90 @ =0x00004e20
	bl sub_815378C
	ldr r1, [r5]
	adds r1, 0x4A
	adds r1, r4
	b _08152F8C
	.align 2, 0
_08152D8C: .4byte 0x000031b4
_08152D90: .4byte 0x00004e20
_08152D94:
	cmp r0, 0x3
	bne _08152D9A
	b _08152EE0
_08152D9A:
	cmp r0, 0x3
	bgt _08152DA6
	cmp r0, 0x2
	bne _08152DA4
	b _08152F4A
_08152DA4:
	b _08152F8E
_08152DA6:
	cmp r0, 0x4
	beq _08152E56
	cmp r0, 0x5
	beq _08152DB0
	b _08152F8E
_08152DB0:
	cmp r3, 0x9
	bls _08152DB6
	b _08152F8E
_08152DB6:
	lsls r0, r3, 2
	ldr r1, _08152DC0 @ =_08152DC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08152DC0: .4byte _08152DC4
	.align 2, 0
_08152DC4:
	.4byte _08152DEC
	.4byte _08152DFC
	.4byte _08152E02
	.4byte _08152E12
	.4byte _08152E18
	.4byte _08152E28
	.4byte _08152E2E
	.4byte _08152E3C
	.4byte _08152E40
	.4byte _08152E50
_08152DEC:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x68
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x74
	b _08152F88
_08152DFC:
	ldr r1, [r5]
	adds r1, 0x74
	b _08152F88
_08152E02:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x74
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x80
	b _08152F88
_08152E12:
	ldr r1, [r5]
	adds r1, 0x80
	b _08152F88
_08152E18:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x80
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x50
	b _08152F88
_08152E28:
	ldr r1, [r5]
	adds r1, 0x50
	b _08152F88
_08152E2E:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x50
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _08152F86
_08152E3C:
	ldr r1, [r5]
	b _08152F86
_08152E40:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x5C
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x68
	b _08152F88
_08152E50:
	ldr r1, [r5]
	adds r1, 0x68
	b _08152F88
_08152E56:
	subs r0, r3, 0x1
	cmp r0, 0x7
	bls _08152E5E
	b _08152F8E
_08152E5E:
	lsls r0, 2
	ldr r1, _08152E68 @ =_08152E6C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08152E68: .4byte _08152E6C
	.align 2, 0
_08152E6C:
	.4byte _08152E8C
	.4byte _08152E9C
	.4byte _08152EA2
	.4byte _08152EB2
	.4byte _08152EB8
	.4byte _08152EC6
	.4byte _08152ECA
	.4byte _08152EDA
_08152E8C:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x68
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x74
	b _08152F88
_08152E9C:
	ldr r1, [r5]
	adds r1, 0x74
	b _08152F88
_08152EA2:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x74
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x50
	b _08152F88
_08152EB2:
	ldr r1, [r5]
	adds r1, 0x50
	b _08152F88
_08152EB8:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x50
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _08152F86
_08152EC6:
	ldr r1, [r5]
	b _08152F86
_08152ECA:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x5C
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x68
	b _08152F88
_08152EDA:
	ldr r1, [r5]
	adds r1, 0x68
	b _08152F88
_08152EE0:
	subs r0, r3, 0x2
	cmp r0, 0x5
	bhi _08152F8E
	lsls r0, 2
	ldr r1, _08152EF0 @ =_08152EF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08152EF0: .4byte _08152EF4
	.align 2, 0
_08152EF4:
	.4byte _08152F0C
	.4byte _08152F1C
	.4byte _08152F22
	.4byte _08152F32
	.4byte _08152F38
	.4byte _08152F46
_08152F0C:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x5C
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x68
	b _08152F88
_08152F1C:
	ldr r1, [r5]
	adds r1, 0x68
	b _08152F88
_08152F22:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x68
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0x50
	b _08152F88
_08152F32:
	ldr r1, [r5]
	adds r1, 0x50
	b _08152F88
_08152F38:
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x50
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _08152F86
_08152F46:
	ldr r1, [r5]
	b _08152F86
_08152F4A:
	cmp r3, 0x4
	beq _08152F70
	cmp r3, 0x4
	bgt _08152F58
	cmp r3, 0x3
	beq _08152F62
	b _08152F8E
_08152F58:
	cmp r3, 0x5
	beq _08152F76
	cmp r3, 0x6
	beq _08152F84
	b _08152F8E
_08152F62:
	adds r1, r2, 0
	adds r1, 0x50
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r1, 0xC
	b _08152F88
_08152F70:
	adds r1, r2, 0
	adds r1, 0x50
	b _08152F88
_08152F76:
	adds r1, r2, 0
	adds r1, 0x50
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r1, 0xC
	b _08152F88
_08152F84:
	adds r1, r2, 0
_08152F86:
	adds r1, 0x5C
_08152F88:
	ldrh r0, [r1]
	adds r0, 0x1
_08152F8C:
	strh r0, [r1]
_08152F8E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8152D34

	thumb_func_start sub_8152F94
sub_8152F94: @ 8152F94
	push {r4,r5,lr}
	adds r1, r0, 0
	ldr r4, _08152FD8 @ =gUnknown_203F3E0
	ldr r3, [r4]
	adds r0, r3, 0
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _08152FFE
	cmp r1, 0x1
	bne _08152FE0
	movs r5, 0x89
	lsls r5, 1
	adds r1, r3, r5
	ldrh r0, [r1]
	adds r2, r0, 0x1
	strh r2, [r1]
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r3, r0
	lsls r0, r2, 16
	lsrs r0, 16
	ldrh r3, [r1]
	cmp r0, r3
	bls _08152FC8
	strh r2, [r1]
_08152FC8:
	ldr r0, [r4]
	adds r2, r0, r5
	ldrh r0, [r2]
	ldr r1, _08152FDC @ =0x0000270f
	cmp r0, r1
	bls _08152FFE
	strh r1, [r2]
	b _08152FFE
	.align 2, 0
_08152FD8: .4byte gUnknown_203F3E0
_08152FDC: .4byte 0x0000270f
_08152FE0:
	movs r2, 0x89
	lsls r2, 1
	adds r0, r3, r2
	movs r5, 0x8A
	lsls r5, 1
	adds r1, r3, r5
	ldrh r0, [r0]
	ldrh r3, [r1]
	cmp r0, r3
	bls _08152FF6
	strh r0, [r1]
_08152FF6:
	ldr r0, [r4]
	adds r0, r2
	movs r1, 0
	strh r1, [r0]
_08152FFE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8152F94

	thumb_func_start sub_8153004
sub_8153004: @ 8153004
	push {r4,r5,lr}
	movs r3, 0
	ldr r2, _08153044 @ =gUnknown_203F3E0
	ldr r0, [r2]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r3, r0
	bcs _0815303C
	adds r5, r2, 0
	movs r4, 0x8A
	lsls r4, 1
_0815301A:
	ldr r2, [r5]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x54
	adds r1, r0
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, 0x24
	ldrb r2, [r2]
	cmp r3, r2
	bcc _0815301A
_0815303C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08153044: .4byte gUnknown_203F3E0
	thumb_func_end sub_8153004

	thumb_func_start sub_8153048
sub_8153048: @ 8153048
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r5, 0
	ldr r7, _08153138 @ =gUnknown_203F3E0
	movs r4, 0
	ldr r0, _0815313C @ =0x000031bf
	mov r10, r0
_0815305C:
	movs r2, 0
	lsls r6, r5, 4
	lsls r1, r5, 1
	mov r8, r1
	lsls r0, r5, 3
	mov r12, r0
	adds r1, r5, 0x1
	mov r9, r1
	subs r0, r6, r5
	lsls r3, r0, 2
_08153070:
	ldr r0, [r7]
	adds r1, r2, r3
	add r0, r10
	adds r0, r1
	strb r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _08153070
	ldr r0, [r7]
	subs r1, r6, r5
	lsls r1, 2
	adds r0, r1
	ldr r2, _08153140 @ =0x000031cc
	adds r0, r2
	strb r4, [r0]
	ldr r0, [r7]
	adds r0, r1
	ldr r1, _08153144 @ =0x000031d0
	adds r0, r1
	strb r4, [r0]
	ldr r0, [r7]
	adds r0, 0x90
	adds r0, r5
	strb r4, [r0]
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0x86
	add r0, r8
	strh r4, [r0]
	add r1, r12
	ldr r2, _08153148 @ =0x00003308
	adds r1, r2
	strb r4, [r1]
	ldr r2, [r7]
	ldr r1, _0815314C @ =0x0000330c
	adds r0, r2, r1
	add r0, r12
	str r4, [r0]
	mov r0, r8
	adds r1, r0, r5
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0x4A
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x4E
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x50
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x52
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	adds r0, 0x54
	adds r0, r1
	strh r4, [r0]
	mov r1, r9
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0815305C
	ldr r2, _08153138 @ =gUnknown_203F3E0
	ldr r0, [r2]
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	movs r2, 0
	strb r2, [r0]
	ldr r1, _08153138 @ =gUnknown_203F3E0
	ldr r0, [r1]
	movs r1, 0x89
	lsls r1, 1
	adds r3, r0, r1
	movs r1, 0
	strh r2, [r3]
	adds r0, 0x40
	strb r1, [r0]
	bl sub_81528D0
	bl sub_81527D0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08153138: .4byte gUnknown_203F3E0
_0815313C: .4byte 0x000031bf
_08153140: .4byte 0x000031cc
_08153144: .4byte 0x000031d0
_08153148: .4byte 0x00003308
_0815314C: .4byte 0x0000330c
	thumb_func_end sub_8153048

	thumb_func_start sub_8153150
sub_8153150: @ 8153150
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _08153168 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r0, [r0]
	cmp r0, 0x4
	beq _0815316C
	cmp r0, 0x5
	beq _08153170
	b _08153172
	.align 2, 0
_08153168: .4byte gUnknown_203F3E0
_0815316C:
	movs r4, 0x1
	b _08153172
_08153170:
	movs r4, 0x2
_08153172:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	lsls r1, r4, 2
	ldr r5, _081531B4 @ =gUnknown_203F3E0
	ldr r2, _081531B8 @ =gUnknown_8475558
	adds r1, r4
	lsls r1, 1
	adds r0, r1
	adds r0, r2
	ldrb r2, [r0]
_08153196:
	ldr r1, [r5]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r1, 0x52
	adds r1, r0
	strh r2, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x4
	bls _08153196
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081531B4: .4byte gUnknown_203F3E0
_081531B8: .4byte gUnknown_8475558
	thumb_func_end sub_8153150

	thumb_func_start sub_81531BC
sub_81531BC: @ 81531BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081531F4 @ =gUnknown_203F3E0
	ldr r2, [r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0x4A
	adds r0, r1
	ldrh r3, [r0]
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r1
	ldrh r0, [r0]
	adds r2, 0x4E
	adds r2, r1
	adds r3, r0
	ldrh r2, [r2]
	adds r0, r3, r2
	ldr r1, _081531F8 @ =0x0000270f
	cmp r0, r1
	bls _081531EE
	adds r0, r1, 0
_081531EE:
	pop {r1}
	bx r1
	.align 2, 0
_081531F4: .4byte gUnknown_203F3E0
_081531F8: .4byte 0x0000270f
	thumb_func_end sub_81531BC

	thumb_func_start sub_81531FC
sub_81531FC: @ 81531FC
	push {r4-r6,lr}
	ldr r5, _08153264 @ =gUnknown_203F3E0
	ldr r0, [r5]
	adds r0, 0x28
	ldrb r0, [r0]
	bl sub_81531BC
	ldr r1, _08153268 @ =0x0000270f
	bl sub_815379C
	adds r4, r0, 0
	ldr r0, [r5]
	adds r0, 0x28
	ldrb r0, [r0]
	bl sub_8153424
	ldr r1, _0815326C @ =0x000f4236
	bl sub_815379C
	adds r2, r0, 0
	ldr r3, _08153270 @ =gSaveBlock2Ptr
	ldr r0, [r3]
	movs r6, 0xB1
	lsls r6, 4
	adds r1, r0, r6
	ldr r0, [r1]
	cmp r0, r2
	bcs _08153236
	str r2, [r1]
_08153236:
	ldr r0, [r3]
	ldr r2, _08153274 @ =0x00000b14
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, r4
	bcs _08153244
	strh r4, [r1]
_08153244:
	ldr r0, [r3]
	ldr r6, _08153278 @ =0x00000b16
	adds r2, r0, r6
	ldr r0, [r5]
	movs r1, 0x8A
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	cmp r0, r1
	bcs _0815325C
	strh r1, [r2]
_0815325C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08153264: .4byte gUnknown_203F3E0
_08153268: .4byte 0x0000270f
_0815326C: .4byte 0x000f4236
_08153270: .4byte gSaveBlock2Ptr
_08153274: .4byte 0x00000b14
_08153278: .4byte 0x00000b16
	thumb_func_end sub_81531FC

	thumb_func_start sub_815327C
sub_815327C: @ 815327C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081532B4 @ =gUnknown_203F3E0
	ldr r0, [r1]
	adds r0, 0x9B
	ldrb r6, [r0]
	movs r3, 0x3
	adds r5, r1, 0
	adds r4, r5, 0
_08153290:
	ldr r0, [r4]
	adds r0, 0x98
	adds r2, r0, r3
	subs r1, r3, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r3, 0
	bne _08153290
	ldr r0, [r5]
	adds r0, 0x98
	strb r7, [r0]
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081532B4: .4byte gUnknown_203F3E0
	thumb_func_end sub_815327C

	thumb_func_start sub_81532B8
sub_81532B8: @ 81532B8
	push {r4,lr}
	ldr r4, _081532EC @ =gUnknown_203F3E0
	ldr r3, [r4]
	adds r0, r3, 0
	adds r0, 0x28
	ldrb r1, [r0]
	adds r0, 0x88
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, 0
	bne _08153360
	ldr r0, _081532F0 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _081532F8
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, _081532F4 @ =0x000031cc
	adds r0, r1
	movs r1, 0x2
	b _0815332E
	.align 2, 0
_081532EC: .4byte gUnknown_203F3E0
_081532F0: .4byte gMain
_081532F4: .4byte 0x000031cc
_081532F8:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _08153314
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, _08153310 @ =0x000031cc
	adds r0, r1
	movs r1, 0x3
	b _0815332E
	.align 2, 0
_08153310: .4byte 0x000031cc
_08153314:
	movs r0, 0x10
	ands r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0815334C
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, _08153348 @ =0x000031cc
	adds r0, r1
	movs r1, 0x1
_0815332E:
	strb r1, [r0]
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x28
	adds r0, 0xB0
	ldrb r1, [r1]
	adds r0, r1
	movs r1, 0x6
	strb r1, [r0]
	movs r0, 0xCD
	bl PlaySE
	b _08153364
	.align 2, 0
_08153348: .4byte 0x000031cc
_0815334C:
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, _0815335C @ =0x000031cc
	adds r0, r1
	strb r2, [r0]
	b _08153364
	.align 2, 0
_0815335C: .4byte 0x000031cc
_08153360:
	subs r0, 0x1
	strb r0, [r2]
_08153364:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81532B8

	thumb_func_start sub_815336C
sub_815336C: @ 815336C
	ldr r0, _08153388 @ =gUnknown_203F3E0
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r2, [r0]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815338C @ =0x000031cc
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08153388: .4byte gUnknown_203F3E0
_0815338C: .4byte 0x000031cc
	thumb_func_end sub_815336C

	thumb_func_start sub_8153390
sub_8153390: @ 8153390
	ldr r0, _081533B0 @ =gUnknown_203F3E0
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, 0x52
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_081533B0: .4byte gUnknown_203F3E0
	thumb_func_end sub_8153390

	thumb_func_start sub_81533B4
sub_81533B4: @ 81533B4
	ldr r0, _081533C0 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081533C0: .4byte gUnknown_203F3E0
	thumb_func_end sub_81533B4

	thumb_func_start sub_81533C4
sub_81533C4: @ 81533C4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081533E4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _081533F0
	ldr r0, _081533E8 @ =gUnknown_203F3E0
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 2
	ldr r2, _081533EC @ =0x000031a0
	adds r1, r2
	ldr r0, [r0]
	b _081533F8
	.align 2, 0
_081533E4: .4byte gReceivedRemoteLinkPlayers
_081533E8: .4byte gUnknown_203F3E0
_081533EC: .4byte 0x000031a0
_081533F0:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	ldr r1, _08153400 @ =gLinkPlayers + 8
_081533F8:
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_08153400: .4byte gLinkPlayers + 8
	thumb_func_end sub_81533C4

	thumb_func_start sub_8153404
sub_8153404: @ 8153404
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r2, _08153420 @ =gUnknown_203F3E0
	ldr r3, [r2]
	lsrs r1, 23
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	adds r1, r2
	adds r3, 0x4A
	adds r3, r1
	ldrh r0, [r3]
	bx lr
	.align 2, 0
_08153420: .4byte gUnknown_203F3E0
	thumb_func_end sub_8153404

	thumb_func_start sub_8153424
sub_8153424: @ 8153424
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	movs r3, 0
	ldr r0, _08153490 @ =gUnknown_203F3E0
	mov r9, r0
	ldr r2, _08153494 @ =gUnknown_84755D8
	mov r10, r2
	ldr r2, [r0]
	lsls r1, r4, 1
	adds r0, r1, r4
	lsls r0, 2
	str r0, [sp]
	adds r6, r2, 0
	adds r6, 0x4A
	mov r12, r1
	mov r8, r10
_08153452:
	lsls r1, r3, 1
	ldr r7, [sp]
	adds r0, r1, r7
	adds r0, r6, r0
	ldrh r2, [r0]
	add r1, r8
	movs r7, 0
	ldrsh r0, [r1, r7]
	muls r0, r2
	adds r5, r0
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _08153452
	mov r0, r9
	ldr r1, [r0]
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 2
	adds r1, 0x50
	adds r1, r0
	ldrh r1, [r1]
	mov r3, r10
	movs r7, 0x6
	ldrsh r0, [r3, r7]
	muls r0, r1
	cmp r5, r0
	bls _08153498
	subs r0, r5, r0
	b _0815349A
	.align 2, 0
_08153490: .4byte gUnknown_203F3E0
_08153494: .4byte gUnknown_84755D8
_08153498:
	movs r0, 0
_0815349A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8153424

	thumb_func_start sub_81534AC
sub_81534AC: @ 81534AC
	push {r4-r6,lr}
	ldr r0, _081534E8 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r6, [r0]
	movs r0, 0
	bl sub_8153424
	adds r5, r0, 0
	movs r4, 0x1
	cmp r4, r6
	bcs _081534DA
_081534C4:
	adds r0, r4, 0
	bl sub_8153424
	cmp r0, r5
	bls _081534D0
	adds r5, r0, 0
_081534D0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _081534C4
_081534DA:
	ldr r1, _081534EC @ =0x000f4236
	adds r0, r5, 0
	bl sub_815379C
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081534E8: .4byte gUnknown_203F3E0
_081534EC: .4byte 0x000f4236
	thumb_func_end sub_81534AC

	thumb_func_start sub_81534F0
sub_81534F0: @ 81534F0
	push {r4,r5,lr}
	lsls r0, 24
	ldr r1, _08153530 @ =gUnknown_203F3E0
	ldr r2, [r1]
	adds r1, r2, 0
	adds r1, 0x24
	ldrb r5, [r1]
	lsrs r4, r0, 23
	adds r2, 0x4A
	adds r0, r2, r4
	ldrh r3, [r0]
	movs r1, 0
	cmp r1, r5
	bcs _08153528
_0815350C:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, r3
	bls _0815351E
	adds r3, r0, 0
_0815351E:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r5
	bcc _0815350C
_08153528:
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08153530: .4byte gUnknown_203F3E0
	thumb_func_end sub_81534F0

	thumb_func_start sub_8153534
sub_8153534: @ 8153534
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0x1
	ldr r0, _081535AC @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r5, [r0]
	movs r4, 0
	cmp r4, r5
	bcs _08153562
_0815354C:
	adds r0, r4, 0
	bl sub_8153424
	lsls r1, r4, 2
	add r1, sp
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0815354C
_08153562:
	lsls r7, 2
	mov r12, r7
	cmp r6, 0
	beq _0815359C
	subs r7, r5, 0x1
_0815356C:
	movs r6, 0
	movs r4, 0
	cmp r6, r7
	bge _08153598
	adds r5, r7, 0
_08153576:
	lsls r0, r4, 2
	mov r2, sp
	adds r1, r2, r0
	adds r4, 0x1
	lsls r0, r4, 2
	adds r3, r2, r0
	ldr r0, [r1]
	ldr r2, [r3]
	cmp r0, r2
	bcs _08153590
	str r2, [r1]
	str r0, [r3]
	movs r6, 0x1
_08153590:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, r5
	blt _08153576
_08153598:
	cmp r6, 0
	bne _0815356C
_0815359C:
	mov r0, sp
	add r0, r12
	ldr r0, [r0]
	add sp, 0x14
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081535AC: .4byte gUnknown_203F3E0
	thumb_func_end sub_8153534

	thumb_func_start sub_81535B0
sub_81535B0: @ 81535B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r10, r0
	mov r8, r0
	mov r9, r0
	ldr r6, _08153690 @ =gUnknown_203F3E0
	ldr r0, [r6]
	adds r0, 0x24
	ldrb r5, [r0]
	bl sub_81534AC
	bl sub_81534AC
	cmp r0, 0
	bne _08153604
	movs r4, 0
	cmp r9, r5
	bcs _08153604
	adds r2, r6, 0
	ldr r1, _08153694 @ =0x00003308
	mov r12, r1
	movs r7, 0
	movs r6, 0x4
	ldr r3, _08153698 @ =0x0000330c
_081535E8:
	ldr r0, [r2]
	lsls r1, r4, 3
	adds r0, r1
	add r0, r12
	strb r6, [r0]
	ldr r0, [r2]
	adds r0, r3
	adds r0, r1
	str r7, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _081535E8
_08153604:
	movs r4, 0
	cmp r4, r5
	bcs _0815362E
_0815360A:
	adds r0, r4, 0
	bl sub_8153424
	ldr r1, _0815369C @ =0x000f4236
	bl sub_815379C
	ldr r1, _08153690 @ =gUnknown_203F3E0
	ldr r1, [r1]
	lsls r2, r4, 3
	ldr r3, _08153698 @ =0x0000330c
	adds r1, r3
	adds r1, r2
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0815360A
_0815362E:
	mov r0, r10
	bl sub_8153534
	adds r6, r0, 0
	mov r3, r8
	movs r4, 0
	cmp r4, r5
	bcs _0815367A
	ldr r7, _08153690 @ =gUnknown_203F3E0
	mov r10, r7
_08153642:
	mov r0, r10
	ldr r2, [r0]
	lsls r1, r4, 3
	ldr r7, _08153698 @ =0x0000330c
	adds r0, r2, r7
	adds r0, r1
	ldr r0, [r0]
	cmp r6, r0
	bne _08153670
	adds r0, r2, r1
	ldr r1, _08153694 @ =0x00003308
	adds r0, r1
	strb r3, [r0]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08153670:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08153642
_0815367A:
	mov r10, r8
	cmp r9, r5
	bcc _0815362E
	movs r0, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08153690: .4byte gUnknown_203F3E0
_08153694: .4byte 0x00003308
_08153698: .4byte 0x0000330c
_0815369C: .4byte 0x000f4236
	thumb_func_end sub_81535B0

	thumb_func_start sub_81536A0
sub_81536A0: @ 81536A0
	lsls r1, 24
	ldr r2, _081536B8 @ =gUnknown_203F3E0
	ldr r2, [r2]
	lsrs r1, 21
	ldr r3, _081536BC @ =0x00003308
	adds r2, r3
	adds r2, r1
	ldr r1, [r2]
	ldr r2, [r2, 0x4]
	str r1, [r0]
	str r2, [r0, 0x4]
	bx lr
	.align 2, 0
_081536B8: .4byte gUnknown_203F3E0
_081536BC: .4byte 0x00003308
	thumb_func_end sub_81536A0

	thumb_func_start sub_81536C0
sub_81536C0: @ 81536C0
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r6, r0, 24
	movs r7, 0
	ldr r0, _08153728 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r5, [r0]
	mov r0, sp
	movs r1, 0
	movs r2, 0x14
	bl memset
	movs r4, 0
	cmp r7, r5
	bcs _081536F8
_081536E2:
	adds r0, r4, 0
	bl sub_8153424
	lsls r1, r4, 2
	add r1, sp
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _081536E2
_081536F8:
	lsls r0, r6, 2
	add r0, sp
	ldr r1, [r0]
	movs r4, 0
_08153700:
	cmp r4, r6
	beq _08153714
	lsls r0, r4, 2
	add r0, sp
	ldr r0, [r0]
	cmp r1, r0
	bcs _08153714
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08153714:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08153700
	adds r0, r7, 0
	add sp, 0x14
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08153728: .4byte gUnknown_203F3E0
	thumb_func_end sub_81536C0

	thumb_func_start sub_815372C
sub_815372C: @ 815372C
	push {r4-r6,lr}
	ldr r0, _08153754 @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x28
	ldrb r4, [r0]
	bl sub_8153390
	lsls r0, 16
	lsrs r5, r0, 16
	adds r6, r5, 0
	adds r0, r4, 0
	bl sub_8153424
	adds r4, r0, 0
	bl sub_81534AC
	cmp r4, r0
	beq _08153758
	movs r0, 0x3
	b _08153786
	.align 2, 0
_08153754: .4byte gUnknown_203F3E0
_08153758:
	adds r0, r5, 0
	movs r1, 0x1
	bl CheckBagHasSpace
	lsls r0, 24
	cmp r0, 0
	bne _0815376A
	movs r0, 0x2
	b _08153786
_0815376A:
	adds r0, r6, 0
	movs r1, 0x1
	bl AddBagItem
	adds r0, r6, 0
	movs r1, 0x1
	bl CheckBagHasSpace
	lsls r0, 24
	cmp r0, 0
	beq _08153784
	movs r0, 0
	b _08153786
_08153784:
	movs r0, 0x1
_08153786:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_815372C

	thumb_func_start sub_815378C
sub_815378C: @ 815378C
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	cmp r2, r0
	bcs _08153798
	adds r0, r2, 0x1
_08153798:
	pop {r1}
	bx r1
	thumb_func_end sub_815378C

	thumb_func_start sub_815379C
sub_815379C: @ 815379C
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	cmp r2, r0
	bcs _081537A8
	adds r0, r2, 0
_081537A8:
	pop {r1}
	bx r1
	thumb_func_end sub_815379C

	thumb_func_start sub_81537AC
sub_81537AC: @ 81537AC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081537BC @ =gUnknown_203F3E0
	ldr r1, [r1]
	adds r1, 0x34
	adds r1, r0
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_081537BC: .4byte gUnknown_203F3E0
	thumb_func_end sub_81537AC

	thumb_func_start sub_81537C0
sub_81537C0: @ 81537C0
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _081537F0 @ =gSpecialVar_Result
_081537C6:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _081537F4 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _081537F8
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0x55
	bne _081537F8
	movs r0, 0x1
	strh r0, [r6]
	b _08153804
	.align 2, 0
_081537F0: .4byte gSpecialVar_Result
_081537F4: .4byte gPlayerParty
_081537F8:
	adds r5, 0x1
	cmp r5, 0x5
	ble _081537C6
	ldr r1, _0815380C @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r1]
_08153804:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815380C: .4byte gSpecialVar_Result
	thumb_func_end sub_81537C0

	thumb_func_start sub_8153810
sub_8153810: @ 8153810
	push {r4,lr}
	ldr r4, _0815382C @ =sub_8153830
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815382C: .4byte sub_8153830
	thumb_func_end sub_8153810

	thumb_func_start sub_8153830
sub_8153830: @ 8153830
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08153854 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0815387C
	cmp r0, 0x1
	bgt _08153858
	cmp r0, 0
	beq _08153862
	b _081538CA
	.align 2, 0
_08153854: .4byte gTasks+0x8
_08153858:
	cmp r0, 0x2
	beq _08153888
	cmp r0, 0x3
	beq _081538B0
	b _081538CA
_08153862:
	ldr r0, _08153878 @ =gUnknown_84755E0
	bl AddWindow
	strh r0, [r4, 0x2]
	lsls r0, 24
	lsrs r0, 24
	bl sub_81538D0
	ldrb r0, [r4, 0x2]
	movs r1, 0x3
	b _0815389E
	.align 2, 0
_08153878: .4byte gUnknown_84755E0
_0815387C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081538CA
	b _081538A2
_08153888:
	ldr r0, _081538AC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _081538CA
	ldrb r0, [r4, 0x2]
	bl rbox_fill_rectangle
	ldrb r0, [r4, 0x2]
	movs r1, 0x1
_0815389E:
	bl CopyWindowToVram
_081538A2:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _081538CA
	.align 2, 0
_081538AC: .4byte gMain
_081538B0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081538CA
	ldrb r0, [r4, 0x2]
	bl RemoveWindow
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_081538CA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8153830

	thumb_func_start sub_81538D0
sub_81538D0: @ 81538D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _081539CC @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldr r2, _081539D0 @ =0x00000b14
	adds r0, r1, r2
	ldrh r0, [r0]
	str r0, [sp, 0xC]
	subs r2, 0x4
	adds r0, r1, r2
	ldr r0, [r0]
	str r0, [sp, 0x10]
	ldr r0, _081539D4 @ =0x00000b16
	adds r1, r0
	ldrh r0, [r1]
	str r0, [sp, 0x14]
	ldr r4, _081539D8 @ =0x0000021d
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0xD
	bl DrawTextBorderOuter
	adds r0, r7, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, _081539DC @ =gUnknown_84755E8
	ldr r2, [r0]
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized
	movs r4, 0
	add r2, sp, 0x18
	mov r8, r2
	movs r0, 0xFF
	mov r10, r0
	mov r9, r4
	mov r2, sp
	adds r2, 0xC
	str r2, [sp, 0x2C]
_08153946:
	ldr r0, [sp, 0x2C]
	ldm r0!, {r1}
	str r0, [sp, 0x2C]
	ldr r0, _081539E0 @ =gUnknown_84755F8
	adds r0, r4, r0
	ldrb r3, [r0]
	mov r0, r8
	movs r2, 0
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	mov r1, r8
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	adds r5, r0, 0
	ldr r1, _081539DC @ =gUnknown_84755E8
	adds r6, r4, 0x1
	lsls r0, r6, 2
	adds r0, r1
	ldr r2, [r0]
	ldr r0, _081539E4 @ =gUnknown_84755FC
	lsls r4, 1
	adds r0, r4, r0
	ldrb r0, [r0]
	str r0, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	mov r0, r9
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized
	movs r3, 0xE0
	subs r3, r5
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _081539E8 @ =gUnknown_8475602
	adds r4, r0
	ldrb r0, [r4]
	str r0, [sp]
	mov r2, r10
	str r2, [sp, 0x4]
	mov r0, r9
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, r8
	bl AddTextPrinterParameterized
	adds r4, r6, 0
	cmp r4, 0x2
	ble _08153946
	adds r0, r7, 0
	bl PutWindowTilemap
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081539CC: .4byte gSaveBlock2Ptr
_081539D0: .4byte 0x00000b14
_081539D4: .4byte 0x00000b16
_081539D8: .4byte 0x0000021d
_081539DC: .4byte gUnknown_84755E8
_081539E0: .4byte gUnknown_84755F8
_081539E4: .4byte gUnknown_84755FC
_081539E8: .4byte gUnknown_8475602
	thumb_func_end sub_81538D0

	thumb_func_start sub_81539EC
sub_81539EC: @ 81539EC
	push {lr}
	bl GetLinkPlayerCount
	ldr r1, _08153A00 @ =gUnknown_203F3E0
	ldr r1, [r1]
	adds r1, 0x24
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08153A00: .4byte gUnknown_203F3E0
	thumb_func_end sub_81539EC

	thumb_func_start sub_8153A04
sub_8153A04: @ 8153A04
	push {r4-r7,lr}
	ldr r0, _08153A8C @ =gUnknown_203F3E0
	ldr r0, [r0]
	adds r0, 0x24
	ldrb r4, [r0]
	cmp r4, 0x4
	bhi _08153A32
	ldr r5, _08153A90 @ =gUnknown_8475648
_08153A14:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _08153A94 @ =gLinkPlayers + 8
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r5
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08153A14
_08153A32:
	ldr r0, _08153A8C @ =gUnknown_203F3E0
	ldr r1, [r0]
	adds r1, 0x24
	movs r2, 0x5
	strb r2, [r1]
	movs r1, 0
	mov r12, r0
_08153A40:
	movs r4, 0
	mov r2, r12
	ldr r0, [r2]
	adds r0, 0x24
	adds r5, r1, 0x1
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08153A7E
	ldr r7, _08153A8C @ =gUnknown_203F3E0
	lsls r3, r1, 1
	ldr r6, _08153A98 @ =gUnknown_8475608
_08153A56:
	ldr r2, [r7]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r3, r0
	adds r1, r2, 0
	adds r1, 0x4A
	adds r1, r0
	lsls r0, r4, 3
	adds r0, r3, r0
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, 0x24
	ldrb r2, [r2]
	cmp r4, r2
	bcc _08153A56
_08153A7E:
	lsls r0, r5, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _08153A40
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08153A8C: .4byte gUnknown_203F3E0
_08153A90: .4byte gUnknown_8475648
_08153A94: .4byte gLinkPlayers + 8
_08153A98: .4byte gUnknown_8475608
	thumb_func_end sub_8153A04

	thumb_func_start sub_8153A9C
sub_8153A9C: @ 8153A9C
	push {r4,r5,lr}
	sub sp, 0x18
	movs r5, 0xC0
	lsls r5, 6
	adds r0, r5, 0
	bl AllocZeroed
	adds r4, r0, 0
	ldr r0, _08153AF0 @ =gUnknown_8478D90
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r0, _08153AF4 @ =gUnknown_8478D98
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	ldr r0, _08153AF8 @ =gUnknown_8477374
	adds r1, r4, 0
	bl LZ77UnCompWram
	cmp r4, 0
	beq _08153ADC
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl Free
_08153ADC:
	add r0, sp, 0x8
	bl LoadSpritePalette
	add r0, sp, 0x10
	bl LoadSpritePalette
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08153AF0: .4byte gUnknown_8478D90
_08153AF4: .4byte gUnknown_8478D98
_08153AF8: .4byte gUnknown_8477374
	thumb_func_end sub_8153A9C

	thumb_func_start sub_8153AFC
sub_8153AFC: @ 8153AFC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x30
	adds r6, r1, 0
	mov r8, r2
	adds r5, r3, 0
	lsls r6, 24
	lsrs r6, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r5, 24
	lsrs r5, 24
	add r1, sp, 0x18
	movs r3, 0
	strh r3, [r1]
	ldrb r2, [r0]
	mov r0, sp
	adds r0, 0x1A
	strh r2, [r0]
	ldr r0, _08153B88 @ =gUnknown_8478C98
	str r0, [sp, 0x1C]
	ldr r0, _08153B8C @ =gUnknown_8478CE0
	str r0, [sp, 0x20]
	str r3, [sp, 0x24]
	ldr r0, _08153B90 @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x28]
	ldr r0, _08153B94 @ =sub_8153B9C
	str r0, [sp, 0x2C]
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	movs r0, 0x4
	bl AllocZeroed
	ldr r1, _08153B98 @ =gUnknown_203F3E4
	mov r2, r8
	lsls r4, r2, 2
	adds r4, r1
	str r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8154608
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x88
	movs r3, 0x3
	bl CreateSprite
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	movs r0, 0x1
	mov r1, r8
	bl sub_8153D48
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08153B88: .4byte gUnknown_8478C98
_08153B8C: .4byte gUnknown_8478CE0
_08153B90: .4byte gDummySpriteAffineAnimTable
_08153B94: .4byte sub_8153B9C
_08153B98: .4byte gUnknown_203F3E4
	thumb_func_end sub_8153AFC

	thumb_func_start sub_8153B9C
sub_8153B9C: @ 8153B9C
	push {lr}
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	cmp r1, 0x1
	beq _08153BB0
	cmp r1, 0x1
	ble _08153BBA
	cmp r1, 0x2
	beq _08153BB6
	b _08153BBA
_08153BB0:
	bl sub_8153C30
	b _08153BBA
_08153BB6:
	bl sub_8153CA0
_08153BBA:
	pop {r0}
	bx r0
	thumb_func_end sub_8153B9C

	thumb_func_start sub_8153BC0
sub_8153BC0: @ 8153BC0
	push {lr}
	bl GetMultiplayerId
	ldr r1, _08153BF0 @ =gUnknown_203F3E4
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153BF4 @ =gSprites
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	strh r2, [r0, 0x34]
	strh r2, [r0, 0x36]
	pop {r0}
	bx r0
	.align 2, 0
_08153BF0: .4byte gUnknown_203F3E4
_08153BF4: .4byte gSprites
	thumb_func_end sub_8153BC0

	thumb_func_start sub_8153BF8
sub_8153BF8: @ 8153BF8
	push {lr}
	bl GetMultiplayerId
	ldr r1, _08153C28 @ =gUnknown_203F3E4
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153C2C @ =gSprites
	adds r0, r1
	movs r2, 0
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	strh r2, [r0, 0x34]
	strh r2, [r0, 0x36]
	pop {r0}
	bx r0
	.align 2, 0
_08153C28: .4byte gUnknown_203F3E4
_08153C2C: .4byte gSprites
	thumb_func_end sub_8153BF8

	thumb_func_start sub_8153C30
sub_8153C30: @ 8153C30
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r2, r0, 16
	lsrs r0, 31
	adds r0, r2, r0
	asrs r1, r0, 1
	adds r0, r1, 0
	cmp r1, 0
	bge _08153C4C
	adds r0, r1, 0x3
_08153C4C:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r2, 0x2
	ble _08153C96
	cmp r0, 0x2
	bgt _08153C62
	cmp r0, 0x1
	bge _08153C66
_08153C62:
	movs r0, 0x1
	b _08153C68
_08153C66:
	movs r0, 0xFF
_08153C68:
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _08153C96
	movs r0, 0
	strh r0, [r4, 0x2E]
	bl sub_81533B4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8154608
	strh r0, [r4, 0x20]
_08153C96:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8153C30

	thumb_func_start sub_8153CA0
sub_8153CA0: @ 8153CA0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xD
	bl __divsi3
	lsls r0, 16
	asrs r1, r0, 16
	adds r0, r1, 0
	cmp r1, 0
	bge _08153CC0
	adds r0, r1, 0x3
_08153CC0:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r1, 0xD
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _08153CE4
	cmp r4, 0
	beq _08153CE4
	movs r0, 0xCD
	bl PlaySE
_08153CE4:
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x67
	ble _08153CF2
	movs r0, 0
	strh r0, [r5, 0x2E]
	movs r4, 0
_08153CF2:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_8153DA8
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8153CA0

	thumb_func_start sub_8153D08
sub_8153D08: @ 8153D08
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _08153D3A
	ldr r6, _08153D40 @ =gUnknown_203F3E4
_08153D16:
	lsls r0, r4, 2
	adds r0, r6
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153D44 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _08153D30
	bl DestroySpriteAndFreeResources
_08153D30:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08153D16
_08153D3A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08153D40: .4byte gUnknown_203F3E4
_08153D44: .4byte gSprites
	thumb_func_end sub_8153D08

	thumb_func_start sub_8153D48
sub_8153D48: @ 8153D48
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _08153D78 @ =gSprites
	ldr r2, _08153D7C @ =gUnknown_203F3E4
	lsrs r1, 22
	adds r1, r2
	ldr r1, [r1]
	ldrh r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r3, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08153D78: .4byte gSprites
_08153D7C: .4byte gUnknown_203F3E4
	thumb_func_end sub_8153D48

	thumb_func_start sub_8153D80
sub_8153D80: @ 8153D80
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0
	cmp r4, r5
	bcs _08153DA2
_08153D90:
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8153D48
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _08153D90
_08153DA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8153D80

	thumb_func_start sub_8153DA8
sub_8153DA8: @ 8153DA8
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08153DCC @ =gUnknown_203F3E4
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _08153DD0 @ =gSprites
	adds r0, r2
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_08153DCC: .4byte gUnknown_203F3E4
_08153DD0: .4byte gSprites
	thumb_func_end sub_8153DA8

	thumb_func_start nullsub_97
nullsub_97: @ 8153DD4
	bx lr
	thumb_func_end nullsub_97

	thumb_func_start sub_8153DD8
sub_8153DD8: @ 8153DD8
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _08153E20 @ =gSprites
	mov r12, r0
	movs r6, 0
	ldr r5, _08153E24 @ =gUnknown_203F43C
_08153DE4:
	ldr r3, [r5]
	lsls r1, r4, 1
	adds r0, r3, 0
	adds r0, 0x2A
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	lsls r0, r4, 4
	adds r0, 0x30
	strh r0, [r1, 0x20]
	lsls r2, r4, 3
	movs r7, 0x8
	negs r7, r7
	adds r0, r7, 0
	subs r0, r2
	strh r0, [r1, 0x22]
	adds r3, 0xC
	adds r3, r4
	strb r6, [r3]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08153DE4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08153E20: .4byte gSprites
_08153E24: .4byte gUnknown_203F43C
	thumb_func_end sub_8153DD8

	thumb_func_start sub_8153E28
sub_8153E28: @ 8153E28
	push {r4-r6,lr}
	sub sp, 0x28
	movs r4, 0xC0
	lsls r4, 1
	adds r0, r4, 0
	bl AllocZeroed
	adds r6, r0, 0
	ldr r0, _08153EC8 @ =gUnknown_8478DA0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	ldr r0, _08153ECC @ =gUnknown_8477198
	adds r1, r6, 0
	bl LZ77UnCompWram
	cmp r6, 0
	beq _08153EB8
	str r6, [sp, 0x18]
	add r5, sp, 0x18
	movs r0, 0x80
	lsls r0, 9
	orrs r0, r4
	str r0, [r5, 0x4]
	mov r1, sp
	ldr r0, _08153ED0 @ =gUnknown_8478DA8
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r4, _08153ED4 @ =gUnknown_203F43C
	movs r0, 0x40
	bl AllocZeroed
	str r0, [r4]
	adds r0, r5, 0
	bl LoadSpriteSheet
	add r0, sp, 0x20
	bl LoadSpritePalette
	movs r4, 0
_08153E7E:
	lsls r1, r4, 20
	movs r0, 0xC0
	lsls r0, 14
	adds r1, r0
	asrs r1, 16
	lsls r0, r4, 3
	movs r3, 0x8
	negs r3, r3
	adds r2, r3, 0
	subs r2, r0
	lsls r2, 16
	asrs r2, 16
	mov r0, sp
	movs r3, 0
	bl CreateSprite
	ldr r1, _08153ED4 @ =gUnknown_203F43C
	ldr r1, [r1]
	lsls r2, r4, 1
	adds r1, 0x2A
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08153E7E
_08153EB8:
	adds r0, r6, 0
	bl Free
	add sp, 0x28
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08153EC8: .4byte gUnknown_8478DA0
_08153ECC: .4byte gUnknown_8477198
_08153ED0: .4byte gUnknown_8478DA8
_08153ED4: .4byte gUnknown_203F43C
	thumb_func_end sub_8153E28

	thumb_func_start sub_8153ED8
sub_8153ED8: @ 8153ED8
	push {r4,r5,lr}
	movs r4, 0
_08153EDC:
	ldr r5, _08153F14 @ =gUnknown_203F43C
	ldr r0, [r5]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153F18 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _08153EFA
	bl DestroySpriteAndFreeResources
_08153EFA:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08153EDC
	ldr r0, [r5]
	bl Free
	movs r0, 0
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08153F14: .4byte gUnknown_203F43C
_08153F18: .4byte gSprites
	thumb_func_end sub_8153ED8

	thumb_func_start sub_8153F1C
sub_8153F1C: @ 8153F1C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r3, 0
	movs r6, 0
	ldr r0, _08153FAC @ =gUnknown_203F43C
	mov r9, r0
_08153F2E:
	mov r7, r9
	ldr r2, [r7]
	lsls r5, r6, 1
	adds r0, r2, 0
	adds r0, 0x2A
	adds r0, r5
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08153FB0 @ =gSprites
	adds r4, r0, r1
	adds r0, r2, 0
	adds r0, 0x16
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	adds r0, 0xC
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, 0
	beq _08153F64
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r0, 0x8
	beq _08153F9A
_08153F64:
	movs r3, 0x1
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r0, 0x8
	bne _08153F8A
	cmp r1, 0
	bne _08153F9A
	strb r3, [r2]
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0x16
	adds r0, r5
	ldr r1, _08153FB4 @ =0x0000fff0
	strh r1, [r0]
	movs r0, 0x1E
	str r3, [sp]
	bl PlaySE
	ldr r3, [sp]
_08153F8A:
	mov r7, r9
	ldr r0, [r7]
	adds r0, 0x16
	adds r0, r5
	ldrh r0, [r0]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_08153F9A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x9
	bls _08153F2E
	cmp r3, 0
	bne _08153FB8
	movs r0, 0x1
	b _08153FBA
	.align 2, 0
_08153FAC: .4byte gUnknown_203F43C
_08153FB0: .4byte gSprites
_08153FB4: .4byte 0x0000fff0
_08153FB8:
	movs r0, 0
_08153FBA:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8153F1C

	thumb_func_start sub_8153FC8
sub_8153FC8: @ 8153FC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _08154004
	movs r4, 0
_08153FD4:
	ldr r0, _08153FFC @ =gUnknown_203F43C
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08154000 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08153FD4
	b _081540CE
	.align 2, 0
_08153FFC: .4byte gUnknown_203F43C
_08154000: .4byte gSprites
_08154004:
	movs r4, 0
	movs r0, 0xA
	subs r0, r5
	cmp r4, r0
	bge _081540CA
	ldr r6, _08154034 @ =gSprites
_08154010:
	cmp r5, 0x6
	bls _08154078
	ldr r0, _08154038 @ =gUnknown_203F43C
	ldr r2, [r0]
	ldr r1, _0815403C @ =0x0000fffa
	adds r0, r1, 0
	ldrh r1, [r2, 0x3E]
	adds r0, r1
	adds r0, r5
	movs r1, 0
	strh r0, [r2, 0x3E]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bls _08154040
	strh r1, [r2, 0x3E]
	b _08154092
	.align 2, 0
_08154034: .4byte gSprites
_08154038: .4byte gUnknown_203F43C
_0815403C: .4byte 0x0000fffa
_08154040:
	cmp r0, 0xA
	bls _0815405E
	lsls r1, r4, 1
	adds r0, r2, 0
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	bl StartSpriteAnim
	b _08154092
_0815405E:
	lsls r1, r4, 1
	adds r0, r2, 0
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
	b _08154092
_08154078:
	ldr r0, _081540A4 @ =gUnknown_203F43C
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
_08154092:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0xA
	subs r0, r5
	cmp r4, r0
	blt _08154010
	b _081540CA
	.align 2, 0
_081540A4: .4byte gUnknown_203F43C
_081540A8:
	ldr r0, _081540D4 @ =gUnknown_203F43C
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081540D8 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_081540CA:
	cmp r4, 0x9
	bls _081540A8
_081540CE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081540D4: .4byte gUnknown_203F43C
_081540D8: .4byte gSprites
	thumb_func_end sub_8153FC8

	thumb_func_start sub_81540DC
sub_81540DC: @ 81540DC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r7, _08154120 @ =gSprites
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r6, 0x5
	negs r6, r6
	ldr r5, _08154124 @ =gUnknown_203F43C
_081540F2:
	ldr r0, [r5]
	lsls r1, r3, 1
	adds r0, 0x2A
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x9
	bls _081540F2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154120: .4byte gSprites
_08154124: .4byte gUnknown_203F43C
	thumb_func_end sub_81540DC

	thumb_func_start sub_8154128
sub_8154128: @ 8154128
	push {r4,r5,lr}
	sub sp, 0x10
	movs r5, 0x90
	lsls r5, 3
	adds r0, r5, 0
	bl AllocZeroed
	adds r4, r0, 0
	ldr r0, _08154174 @ =gUnknown_8478DCC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	ldr r0, _08154178 @ =gUnknown_8475968
	adds r1, r4, 0
	bl LZ77UnCompWram
	cmp r4, 0
	beq _0815415E
	str r4, [sp]
	movs r0, 0x80
	lsls r0, 10
	orrs r0, r5
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
_0815415E:
	add r0, sp, 0x8
	bl LoadSpritePalette
	adds r0, r4, 0
	bl Free
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08154174: .4byte gUnknown_8478DCC
_08154178: .4byte gUnknown_8475968
	thumb_func_end sub_8154128

	thumb_func_start sub_815417C
sub_815417C: @ 815417C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x30
	mov r1, sp
	ldr r0, _0815420C @ =gUnknown_8478DDC
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	add r2, sp, 0x18
	adds r1, r2, 0
	ldr r0, _08154210 @ =gUnknown_8478DF4
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	movs r5, 0
	mov r9, r2
_081541A4:
	movs r0, 0x4
	bl AllocZeroed
	ldr r1, _08154214 @ =gUnknown_203F400
	lsls r4, r5, 2
	adds r4, r1
	str r0, [r4]
	lsls r0, r5, 3
	lsls r1, r5, 4
	adds r1, r0
	mov r0, sp
	movs r2, 0x8
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_81542EC
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _081541A4
	movs r5, 0
	ldr r7, _08154218 @ =gUnknown_203F42C
	ldr r4, _0815421C @ =gUnknown_8478DD4
	mov r8, r4
_081541E4:
	movs r0, 0x4
	bl AllocZeroed
	lsls r1, r5, 2
	adds r4, r1, r7
	str r0, [r4]
	adds r6, r1, 0
	cmp r5, 0x3
	bne _08154220
	mov r0, r8
	movs r2, 0x6
	ldrsh r1, [r0, r2]
	mov r0, r9
	movs r2, 0x39
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7, 0xC]
	b _08154234
	.align 2, 0
_0815420C: .4byte gUnknown_8478DDC
_08154210: .4byte gUnknown_8478DF4
_08154214: .4byte gUnknown_203F400
_08154218: .4byte gUnknown_203F42C
_0815421C: .4byte gUnknown_8478DD4
_08154220:
	lsls r0, r5, 1
	add r0, r8
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r0, r9
	movs r2, 0x3C
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
_08154234:
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r6, r7
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08154270 @ =gSprites
	adds r0, r1
	adds r1, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081541E4
	movs r0, 0x1
	bl sub_8154324
	add sp, 0x30
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154270: .4byte gSprites
	thumb_func_end sub_815417C

	thumb_func_start sub_8154274
sub_8154274: @ 8154274
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _081542E0 @ =gUnknown_203F400
_0815427A:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081542E4 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _08154294
	bl DestroySprite
_08154294:
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xA
	bls _0815427A
	movs r5, 0
	ldr r6, _081542E8 @ =gUnknown_203F42C
_081542AC:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081542E4 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _081542C6
	bl DestroySprite
_081542C6:
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081542AC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081542E0: .4byte gUnknown_203F400
_081542E4: .4byte gSprites
_081542E8: .4byte gUnknown_203F42C
	thumb_func_end sub_8154274

	thumb_func_start sub_81542EC
sub_81542EC: @ 81542EC
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0815431C @ =gSprites
	ldr r2, _08154320 @ =gUnknown_203F400
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0815431C: .4byte gSprites
_08154320: .4byte gUnknown_203F400
	thumb_func_end sub_81542EC

	thumb_func_start sub_8154324
sub_8154324: @ 8154324
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r7, _08154368 @ =gSprites
	ldr r6, _0815436C @ =gUnknown_203F42C
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_0815433A:
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0815433A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154368: .4byte gSprites
_0815436C: .4byte gUnknown_203F42C
	thumb_func_end sub_8154324

	thumb_func_start sub_8154370
sub_8154370: @ 8154370
	lsls r0, 24
	lsls r1, 24
	ldr r3, _08154390 @ =gSprites
	ldr r2, _08154394 @ =gUnknown_203F400
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	lsrs r1, 21
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08154390: .4byte gSprites
_08154394: .4byte gUnknown_203F400
	thumb_func_end sub_8154370

	thumb_func_start sub_8154398
sub_8154398: @ 8154398
	push {lr}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _081543BC @ =gUnknown_203F400
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _081543C0 @ =gSprites
	adds r0, r2
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_081543BC: .4byte gUnknown_203F400
_081543C0: .4byte gSprites
	thumb_func_end sub_8154398

	thumb_func_start sub_81543C4
sub_81543C4: @ 81543C4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081543E4 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, 0x32
	strh r1, [r2, 0x20]
	movs r0, 0x32
	strh r0, [r2, 0x22]
	bx lr
	.align 2, 0
_081543E4: .4byte gSprites
	thumb_func_end sub_81543C4

	thumb_func_start sub_81543E8
sub_81543E8: @ 81543E8
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r0, 0x42
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _0815442A
	movs r3, 0
	ldr r7, _08154430 @ =gUnknown_8478E0C
	ldr r6, _08154434 @ =gUnknown_203F3F8
	movs r5, 0
_081543FE:
	lsls r0, r3, 2
	adds r2, r0, r6
	ldr r1, [r2]
	ldrh r0, [r1, 0x2]
	adds r0, 0x1
	strh r0, [r1, 0x2]
	adds r1, r3, r7
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _08154420
	ldrh r0, [r4, 0x20]
	subs r0, 0x1
	strh r0, [r4, 0x20]
	ldr r0, [r2]
	strh r5, [r0, 0x2]
_08154420:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _081543FE
_0815442A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154430: .4byte gUnknown_8478E0C
_08154434: .4byte gUnknown_203F3F8
	thumb_func_end sub_81543E8

	thumb_func_start sub_8154438
sub_8154438: @ 8154438
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x28
	movs r4, 0x80
	lsls r4, 3
	adds r0, r4, 0
	bl AllocZeroed
	adds r6, r0, 0
	ldr r0, _081544DC @ =gUnknown_8478E18
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	ldr r0, _081544E0 @ =gUnknown_847722C
	adds r1, r6, 0
	bl LZ77UnCompWram
	cmp r6, 0
	beq _081544C6
	str r6, [sp, 0x18]
	add r0, sp, 0x18
	movs r1, 0xA0
	lsls r1, 11
	orrs r1, r4
	str r1, [r0, 0x4]
	mov r2, sp
	ldr r1, _081544E4 @ =gUnknown_8478E20
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	bl LoadSpriteSheet
	add r0, sp, 0x20
	bl LoadSpritePalette
	movs r5, 0
	ldr r7, _081544E8 @ =gUnknown_8478E0E
	adds r0, r7, 0x2
	mov r9, r0
	ldr r1, _081544EC @ =gUnknown_203F3F8
	mov r8, r1
_08154492:
	movs r0, 0x4
	bl AllocZeroed
	lsls r2, r5, 2
	mov r3, r8
	adds r4, r2, r3
	str r0, [r4]
	adds r0, r2, r7
	movs r3, 0
	ldrsh r1, [r0, r3]
	add r2, r9
	movs r0, 0
	ldrsh r2, [r2, r0]
	mov r0, sp
	movs r3, 0x4
	bl CreateSprite
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08154492
_081544C6:
	adds r0, r6, 0
	bl Free
	add sp, 0x28
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081544DC: .4byte gUnknown_8478E18
_081544E0: .4byte gUnknown_847722C
_081544E4: .4byte gUnknown_8478E20
_081544E8: .4byte gUnknown_8478E0E
_081544EC: .4byte gUnknown_203F3F8
	thumb_func_end sub_8154438

	thumb_func_start sub_81544F0
sub_81544F0: @ 81544F0
	push {r4-r7,lr}
	movs r3, 0
	ldr r0, _08154534 @ =gUnknown_203F3F8
	mov r12, r0
	ldr r4, _08154538 @ =gUnknown_8478E0E
	adds r7, r4, 0x2
	ldr r6, _0815453C @ =gSprites
	movs r5, 0x1
_08154500:
	lsls r2, r3, 2
	mov r1, r12
	adds r0, r2, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r0, r1, 0
	adds r0, 0x42
	strh r5, [r0]
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	adds r2, r7
	ldrh r0, [r2]
	strh r0, [r1, 0x22]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _08154500
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154534: .4byte gUnknown_203F3F8
_08154538: .4byte gUnknown_8478E0E
_0815453C: .4byte gSprites
	thumb_func_end sub_81544F0

	thumb_func_start sub_8154540
sub_8154540: @ 8154540
	push {r4,r5,lr}
	movs r2, 0
	ldr r5, _08154570 @ =gUnknown_203F3F8
	ldr r4, _08154574 @ =gSprites
	movs r3, 0
_0815454A:
	lsls r0, r2, 2
	adds r0, r5
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x42
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bls _0815454A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08154570: .4byte gUnknown_203F3F8
_08154574: .4byte gSprites
	thumb_func_end sub_8154540

	thumb_func_start sub_8154578
sub_8154578: @ 8154578
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _081545B4 @ =gUnknown_203F3F8
_0815457E:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081545B8 @ =gSprites
	adds r0, r1
	cmp r0, 0
	beq _08154598
	bl DestroySprite
_08154598:
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _0815457E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081545B4: .4byte gUnknown_203F3F8
_081545B8: .4byte gSprites
	thumb_func_end sub_8154578

	thumb_func_start sub_81545BC
sub_81545BC: @ 81545BC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r7, _08154600 @ =gSprites
	ldr r6, _08154604 @ =gUnknown_203F3F8
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_081545D2:
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bls _081545D2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154600: .4byte gSprites
_08154604: .4byte gUnknown_203F3F8
	thumb_func_end sub_81545BC

	thumb_func_start sub_8154608
sub_8154608: @ 8154608
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	subs r0, r1, 0x1
	cmp r0, 0x4
	bhi _081546BA
	lsls r0, 2
	ldr r1, _08154624 @ =_08154628
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08154624: .4byte _08154628
	.align 2, 0
_08154628:
	.4byte _081546A8
	.4byte _0815463C
	.4byte _08154646
	.4byte _0815465A
	.4byte _08154682
_0815463C:
	cmp r2, 0
	beq _08154672
	cmp r2, 0x1
	bne _081546BA
	b _08154676
_08154646:
	cmp r2, 0x1
	beq _081546AC
	cmp r2, 0x1
	bgt _08154654
	cmp r2, 0
	beq _081546A8
	b _081546BA
_08154654:
	cmp r2, 0x2
	bne _081546BA
	b _081546B8
_0815465A:
	cmp r2, 0x1
	beq _08154676
	cmp r2, 0x1
	bgt _08154668
	cmp r2, 0
	beq _08154672
	b _081546BA
_08154668:
	cmp r2, 0x2
	beq _0815467A
	cmp r2, 0x3
	beq _0815467E
	b _081546BA
_08154672:
	movs r3, 0xC
	b _081546BA
_08154676:
	movs r3, 0x12
	b _081546BA
_0815467A:
	movs r3, 0x18
	b _081546BA
_0815467E:
	movs r3, 0x6
	b _081546BA
_08154682:
	cmp r2, 0x4
	bhi _081546BA
	lsls r0, r2, 2
	ldr r1, _08154690 @ =_08154694
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08154690: .4byte _08154694
	.align 2, 0
_08154694:
	.4byte _081546A8
	.4byte _081546AC
	.4byte _081546B0
	.4byte _081546B4
	.4byte _081546B8
_081546A8:
	movs r3, 0xF
	b _081546BA
_081546AC:
	movs r3, 0x15
	b _081546BA
_081546B0:
	movs r3, 0x1B
	b _081546BA
_081546B4:
	movs r3, 0x3
	b _081546BA
_081546B8:
	movs r3, 0x9
_081546BA:
	lsls r0, r3, 3
	pop {r1}
	bx r1
	thumb_func_end sub_8154608

	thumb_func_start sub_81546C0
sub_81546C0: @ 81546C0
	push {r4,lr}
	movs r4, 0
_081546C4:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81542EC
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8154370
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _081546C4
	movs r0, 0
	bl sub_81540DC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81546C0

	thumb_func_start sub_81546EC
sub_81546EC: @ 81546EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl GetUserFrameGraphicsInfo
	ldr r1, [r0]
	movs r2, 0x90
	lsls r2, 1
	movs r0, 0
	movs r3, 0x1
	bl LoadBgTiles
	adds r0, r4, 0
	bl GetUserFrameGraphicsInfo
	ldr r0, [r0, 0x4]
	movs r1, 0xA0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81546EC

	thumb_func_start sub_8154720
sub_8154720: @ 8154720
	push {lr}
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xB0
	bl TextWindow_SetStdFrame0_WithPal
	pop {r0}
	bx r0
	thumb_func_end sub_8154720

	thumb_func_start sub_8154730
sub_8154730: @ 8154730
	ldr r3, _08154760 @ =gUnknown_203F440
	ldr r0, [r3]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r0, r2
	movs r2, 0
	str r2, [r1]
	ldr r1, _08154764 @ =0x00003014
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, 0x8
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_08154760: .4byte gUnknown_203F440
_08154764: .4byte 0x00003014
	thumb_func_end sub_8154730

	thumb_func_start sub_8154768
sub_8154768: @ 8154768
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r6, 0xA
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x1
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x4
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x6
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x7
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x8
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r4, [r4, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x9
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8154768

	thumb_func_start sub_8154868
sub_8154868: @ 8154868
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r6, 0xB
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xA
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xB
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xC
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xD
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x2]
	str r5, [sp]
	ldrb r0, [r4, 0x4]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0xF
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x10
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x1]
	ldrb r3, [r4, 0x4]
	ldrb r0, [r4, 0x2]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x3]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x11
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4, 0x4]
	ldrb r4, [r4, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x12
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8154868

	thumb_func_start sub_8154968
sub_8154968: @ 8154968
	push {r4,lr}
	ldr r4, _081549B0 @ =gUnknown_203F440
	str r0, [r4]
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r0, r2
	movs r2, 0
	str r2, [r1]
	ldr r3, _081549B4 @ =0x00003014
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _081549B8 @ =0x00003018
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r4]
	adds r3, 0xC
	adds r0, r3
	strb r2, [r0]
	ldr r0, [r4]
	adds r1, 0xC
	adds r0, r1
	strb r2, [r0]
	ldr r0, _081549BC @ =sub_8154A08
	movs r1, 0x3
	bl CreateTask
	ldr r1, [r4]
	ldr r2, _081549C0 @ =0x00003004
	adds r1, r2
	strb r0, [r1]
	ldr r0, _081549C4 @ =sub_8154A2C
	bl sub_8155E24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081549B0: .4byte gUnknown_203F440
_081549B4: .4byte 0x00003014
_081549B8: .4byte 0x00003018
_081549BC: .4byte sub_8154A08
_081549C0: .4byte 0x00003004
_081549C4: .4byte sub_8154A2C
	thumb_func_end sub_8154968

	thumb_func_start sub_81549C8
sub_81549C8: @ 81549C8
	push {lr}
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	thumb_func_end sub_81549C8

	thumb_func_start sub_81549D4
sub_81549D4: @ 81549D4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r5, _08154A04 @ =gUnknown_8478EC4
	adds r7, r5, 0x4
_081549E0:
	lsls r1, r4, 3
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r6
	bne _081549F2
	adds r0, r1, r7
	ldr r0, [r0]
	bl sub_8155E24
_081549F2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _081549E0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154A04: .4byte gUnknown_8478EC4
	thumb_func_end sub_81549D4

	thumb_func_start sub_8154A08
sub_8154A08: @ 8154A08
	push {lr}
	ldr r0, _08154A28 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _08154A22
	bl sub_8155E54
	bl _call_via_r0
_08154A22:
	pop {r0}
	bx r0
	.align 2, 0
_08154A28: .4byte gUnknown_203F440
	thumb_func_end sub_8154A08

	thumb_func_start sub_8154A2C
sub_8154A2C: @ 8154A2C
	push {lr}
	ldr r0, _08154A48 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r2, _08154A4C @ =0x00003014
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08154B24
	lsls r0, 2
	ldr r1, _08154A50 @ =_08154A54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08154A48: .4byte gUnknown_203F440
_08154A4C: .4byte 0x00003014
_08154A50: .4byte _08154A54
	.align 2, 0
_08154A54:
	.4byte _08154A68
	.4byte _08154A6E
	.4byte _08154A88
	.4byte _08154ACC
	.4byte _08154AF8
_08154A68:
	bl sub_8155EA0
	b _08154B08
_08154A6E:
	bl sub_8155FE0
	cmp r0, 0x1
	bne _08154B2E
	ldr r0, _08154A80 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r2, _08154A84 @ =0x00003014
	adds r1, r2
	b _08154B10
	.align 2, 0
_08154A80: .4byte gUnknown_203F440
_08154A84: .4byte 0x00003014
_08154A88:
	ldr r1, _08154AC0 @ =gUnknown_8478590
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, _08154AC4 @ =gUnknown_8478A4C
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r1, _08154AC8 @ =gUnknown_84787FC
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _08154B08
	.align 2, 0
_08154AC0: .4byte gUnknown_8478590
_08154AC4: .4byte gUnknown_8478A4C
_08154AC8: .4byte gUnknown_84787FC
_08154ACC:
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	ldr r0, _08154AF0 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r2, _08154AF4 @ =0x00003014
	adds r1, r2
	b _08154B10
	.align 2, 0
_08154AF0: .4byte gUnknown_203F440
_08154AF4: .4byte 0x00003014
_08154AF8:
	ldr r0, _08154B18 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl sub_81546EC
	bl sub_8154720
_08154B08:
	ldr r0, _08154B1C @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08154B20 @ =0x00003014
	adds r1, r0
_08154B10:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08154B2E
	.align 2, 0
_08154B18: .4byte gSaveBlock2Ptr
_08154B1C: .4byte gUnknown_203F440
_08154B20: .4byte 0x00003014
_08154B24:
	movs r2, 0xC0
	lsls r2, 6
	adds r1, r2
	movs r0, 0x1
	str r0, [r1]
_08154B2E:
	pop {r0}
	bx r0
	thumb_func_end sub_8154A2C

	thumb_func_start sub_8154B34
sub_8154B34: @ 8154B34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, _08154B74 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r2, _08154B78 @ =0x00003014
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08154B7C
	cmp r0, 0x1
	bne _08154B54
	b _08154CE0
_08154B54:
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB4
	bhi _08154B62
	b _08154D82
_08154B62:
	bl sub_81533B4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcc _08154B72
	b _08154D5A
_08154B72:
	b _08154D34
	.align 2, 0
_08154B74: .4byte gUnknown_203F440
_08154B78: .4byte 0x00003014
_08154B7C:
	bl sub_81533B4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08154CB8 @ =gUnknown_8478E80
	subs r0, r7, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r5, [r0]
	ldr r2, _08154CBC @ =0xffffff00
	ldr r0, [sp, 0xC]
	ands r0, r2
	ldr r1, _08154CC0 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xE0
	lsls r1, 19
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r2
	movs r1, 0x2
	orrs r0, r1
	ldr r1, _08154CC4 @ =0xffff00ff
	ands r0, r1
	movs r1, 0xD0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _08154CC8 @ =0x0000ffff
	ands r0, r1
	movs r1, 0x98
	lsls r1, 13
	orrs r0, r1
	str r0, [sp, 0x10]
	movs r6, 0
	cmp r6, r7
	bcs _08154CAC
	mov r3, sp
	adds r3, 0xC
	str r3, [sp, 0x18]
	mov r10, r4
	ldr r0, _08154CCC @ =0x00003008
	mov r9, r0
_08154BD0:
	movs r1, 0
	mov r8, r1
	adds r0, r6, 0
	bl sub_81537AC
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sub_81533C4
	adds r1, r0, 0
	movs r0, 0
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	movs r1, 0x38
	subs r1, r0
	lsrs r1, 1
	str r1, [sp, 0x14]
	ldrb r0, [r5]
	lsls r0, 8
	ldr r2, _08154CC4 @ =0xffff00ff
	ldr r1, [sp, 0xC]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0xC]
	ldrb r2, [r5, 0x1]
	lsls r2, 16
	ldr r0, _08154CD0 @ =0xff00ffff
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0xC]
	add r0, sp, 0xC
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	add r1, r9
	adds r1, r6
	strb r0, [r1]
	ldr r0, [r2]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r3, r10
	ldr r0, [r3]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08154C4E
	movs r0, 0x2
	mov r8, r0
_08154C4E:
	adds r0, r4, 0
	bl sub_81533C4
	adds r4, r0, 0
	mov r1, r10
	ldr r0, [r1]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	ldr r3, [sp, 0x14]
	lsls r2, r3, 24
	lsrs r2, 24
	mov r3, r8
	lsls r1, r3, 1
	add r1, r8
	ldr r3, _08154CD4 @ =gUnknown_8478E38
	adds r1, r3
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	mov r2, r10
	ldr r0, [r2]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r3, [sp, 0x18]
	ldrh r0, [r3, 0x6]
	adds r0, 0xE
	strh r0, [r3, 0x6]
	add r0, sp, 0xC
	bl sub_8154868
	adds r5, 0x4
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08154BD0
_08154CAC:
	ldr r0, _08154CD8 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08154CDC @ =0x00003014
	adds r1, r0
	b _08154D1E
	.align 2, 0
_08154CB8: .4byte gUnknown_8478E80
_08154CBC: .4byte 0xffffff00
_08154CC0: .4byte 0x00ffffff
_08154CC4: .4byte 0xffff00ff
_08154CC8: .4byte 0x0000ffff
_08154CCC: .4byte 0x00003008
_08154CD0: .4byte 0xff00ffff
_08154CD4: .4byte gUnknown_8478E38
_08154CD8: .4byte gUnknown_203F440
_08154CDC: .4byte 0x00003014
_08154CE0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08154D82
	bl sub_81533B4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcs _08154D10
_08154CF8:
	ldr r0, [r4]
	ldr r1, _08154D28 @ =0x00003008
	adds r0, r1
	adds r0, r6
	ldrb r0, [r0]
	bl PutWindowTilemap
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08154CF8
_08154D10:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08154D2C @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r2, _08154D30 @ =0x00003014
	adds r1, r2
_08154D1E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08154D82
	.align 2, 0
_08154D28: .4byte 0x00003008
_08154D2C: .4byte gUnknown_203F440
_08154D30: .4byte 0x00003014
_08154D34:
	ldr r5, _08154D94 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r4, _08154D98 @ =0x00003008
	adds r0, r4
	adds r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	adds r0, r6
	ldrb r0, [r0]
	bl RemoveWindow
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08154D34
_08154D5A:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08154D94 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r3, 0xC0
	lsls r3, 6
	adds r0, r3
	movs r1, 0x1
	str r1, [r0]
_08154D82:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154D94: .4byte gUnknown_203F440
_08154D98: .4byte 0x00003008
	thumb_func_end sub_8154B34

	thumb_func_start sub_8154D9C
sub_8154D9C: @ 8154D9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x70
	lsls r0, 24
	movs r1, 0
	mov r8, r1
	movs r6, 0
	lsrs r7, r0, 24
	add r4, sp, 0x2C
	ldr r1, _08154F64 @ =gUnknown_8478F14
	adds r0, r4, 0
	movs r2, 0x5
	bl memcpy
	movs r5, 0
	cmp r5, r7
	bcs _08154DEC
	add r4, sp, 0x34
_08154DC6:
	mov r0, sp
	adds r0, r5
	adds r0, 0x2C
	strb r5, [r0]
	add r0, sp, 0x5C
	adds r1, r5, 0
	bl sub_81536A0
	lsls r2, r5, 3
	adds r2, r4, r2
	ldr r0, [sp, 0x5C]
	ldr r1, [sp, 0x60]
	str r0, [r2]
	str r1, [r2, 0x4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154DC6
_08154DEC:
	bl sub_81534AC
	cmp r0, 0
	beq _08154E22
_08154DF4:
	movs r5, 0
	cmp r5, r7
	bcs _08154E1C
	add r2, sp, 0x34
	add r1, sp, 0x2C
_08154DFE:
	lsls r0, r5, 3
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r8
	bne _08154E12
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08154E12:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154DFE
_08154E1C:
	mov r8, r6
	cmp r6, r7
	bcc _08154DF4
_08154E22:
	movs r5, 0
	ldr r4, _08154F68 @ =gUnknown_841CE1C
	cmp r5, r7
	bcs _08154E48
	add r1, sp, 0x34
	add r6, sp, 0x38
	subs r3, r7, 0x1
_08154E30:
	lsls r2, r5, 3
	adds r0, r6, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _08154E3E
	adds r0, r1, r2
	strb r3, [r0]
_08154E3E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154E30
_08154E48:
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xD8
	subs r1, r0
	str r1, [sp, 0x64]
	movs r5, 0
	cmp r5, r7
	bcs _08154F52
	mov r2, sp
	adds r2, 0x34
	str r2, [sp, 0x68]
	ldr r3, _08154F6C @ =0x00003009
	mov r10, r3
	adds r0, r1, 0
	subs r0, 0x23
	lsls r0, 24
	str r0, [sp, 0x6C]
_08154E70:
	movs r4, 0
	mov r8, r4
	mov r0, sp
	adds r0, r5
	adds r0, 0x2C
	ldrb r0, [r0]
	adds r4, r0, 0
	lsls r1, r4, 3
	add r0, sp, 0x38
	adds r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r2, _08154F70 @ =gUnknown_203F440
	ldr r0, [r2]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, _08154F74 @ =gUnknown_8478E94
	ldr r3, [sp, 0x68]
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r3, _08154F78 @ =gUnknown_8478EBA
	lsls r1, r5, 1
	adds r1, r3
	ldrb r6, [r1]
	str r6, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	mov r3, r8
	str r3, [sp, 0x8]
	movs r1, 0
	movs r3, 0x8
	bl AddTextPrinterParameterized
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08154EC8
	movs r0, 0x2
	mov r8, r0
_08154EC8:
	adds r0, r4, 0
	bl sub_81533C4
	adds r3, r0, 0
	ldr r1, _08154F70 @ =gUnknown_203F440
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	mov r2, r8
	lsls r1, r2, 1
	add r1, r8
	ldr r2, _08154F7C @ =gUnknown_8478E38
	adds r1, r2
	str r1, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r1, 0
	movs r2, 0x1C
	adds r3, r6, 0
	bl AddTextPrinterParameterized3
	add r0, sp, 0xC
	mov r1, r9
	movs r2, 0x1
	movs r3, 0x7
	bl ConvertIntToDecimalStringN
	movs r0, 0
	add r1, sp, 0xC
	adds r2, r4, 0
	bl GetStringWidth
	ldr r1, _08154F70 @ =gUnknown_203F440
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	str r6, [sp]
	movs r2, 0xFF
	str r2, [sp, 0x4]
	movs r3, 0
	str r3, [sp, 0x8]
	movs r1, 0
	add r2, sp, 0xC
	ldr r4, [sp, 0x6C]
	lsrs r3, r4, 24
	bl AddTextPrinterParameterized
	ldr r1, _08154F70 @ =gUnknown_203F440
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, [sp, 0x64]
	lsls r3, r2, 24
	str r6, [sp]
	movs r4, 0xFF
	str r4, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	ldr r2, _08154F68 @ =gUnknown_841CE1C
	lsrs r3, 24
	bl AddTextPrinterParameterized
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154E70
_08154F52:
	add sp, 0x70
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154F64: .4byte gUnknown_8478F14
_08154F68: .4byte gUnknown_841CE1C
_08154F6C: .4byte 0x00003009
_08154F70: .4byte gUnknown_203F440
_08154F74: .4byte gUnknown_8478E94
_08154F78: .4byte gUnknown_8478EBA
_08154F7C: .4byte gUnknown_8478E38
	thumb_func_end sub_8154D9C

	thumb_func_start sub_8154F80
sub_8154F80: @ 8154F80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8C
	bl sub_81533B4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x84]
	ldr r6, _08154FB0 @ =gUnknown_203F440
	ldr r1, [r6]
	ldr r2, _08154FB4 @ =0x00003014
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xB
	bls _08154FA6
	b _08155678
_08154FA6:
	lsls r0, 2
	ldr r1, _08154FB8 @ =_08154FBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08154FB0: .4byte gUnknown_203F440
_08154FB4: .4byte 0x00003014
_08154FB8: .4byte _08154FBC
	.align 2, 0
_08154FBC:
	.4byte _08154FEC
	.4byte _08155008
	.4byte _08155060
	.4byte _0815524C
	.4byte _08155298
	.4byte _081552DC
	.4byte _08155340
	.4byte _0815537C
	.4byte _081553C0
	.4byte _08155480
	.4byte _081555D8
	.4byte _0815562C
_08154FEC:
	bl sub_81535B0
	ldr r0, _08155000 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08155004 @ =0x0000301c
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	b _0815565A
	.align 2, 0
_08155000: .4byte gUnknown_203F440
_08155004: .4byte 0x0000301c
_08155008:
	ldr r6, _08155050 @ =gUnknown_8475674
	adds r0, r6, 0
	bl AddWindow
	ldr r4, _08155054 @ =gUnknown_203F440
	ldr r1, [r4]
	ldr r2, _08155058 @ =0x00003008
	mov r8, r2
	add r1, r8
	strb r0, [r1]
	movs r0, 0x8
	adds r0, r6
	mov r9, r0
	bl AddWindow
	ldr r1, [r4]
	ldr r5, _0815505C @ =0x00003009
	adds r1, r5
	strb r0, [r1]
	ldr r0, [r4]
	add r0, r8
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, 0
	bl sub_8154868
	mov r0, r9
	bl sub_8154868
	b _08155658
	.align 2, 0
_08155050: .4byte gUnknown_8475674
_08155054: .4byte gUnknown_203F440
_08155058: .4byte 0x00003008
_0815505C: .4byte 0x00003009
_08155060:
	ldr r4, _081551A8 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r5, _081551AC @ =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _081551B0 @ =0x00003009
	mov r9, r1
	add r0, r9
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _081551B4 @ =gUnknown_841CD03
	mov r8, r2
	movs r2, 0x1
	negs r2, r2
	movs r0, 0
	mov r1, r8
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x2
	str r1, [sp]
	movs r6, 0xFF
	str r6, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r1, 0
	mov r2, r8
	bl AddTextPrinterParameterized
	ldr r0, [r4]
	add r0, r9
	ldrb r0, [r0]
	ldr r2, _081551B8 @ =gUnknown_841CD25
	movs r1, 0x10
	str r1, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0
	movs r3, 0x44
	bl AddTextPrinterParameterized
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0x84]
	cmp r9, r1
	bcc _081550DA
	b _08155214
_081550DA:
	movs r5, 0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r9, r0
	bne _081550EA
	movs r5, 0x2
_081550EA:
	mov r0, r9
	bl sub_81533C4
	adds r6, r0, 0
	ldr r0, _081551A8 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _081551B0 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	ldr r1, _081551BC @ =gUnknown_8478EB0
	mov r2, r9
	lsls r4, r2, 1
	adds r4, r1
	ldrb r3, [r4]
	lsls r1, r5, 1
	adds r1, r5
	ldr r2, _081551C0 @ =gUnknown_8478E38
	adds r1, r2
	str r1, [sp]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0
	movs r2, 0x2
	bl AddTextPrinterParameterized3
	movs r7, 0
	mov r0, r9
	adds r0, 0x1
	str r0, [sp, 0x88]
	mov r8, r4
	ldr r1, _081551C4 @ =gUnknown_8478EA8
	mov r10, r1
_0815512E:
	mov r0, r9
	adds r1, r7, 0
	bl sub_8153404
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081551C8 @ =0x0000270f
	bl sub_815379C
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl sub_81534F0
	ldr r1, _081551C8 @ =0x0000270f
	bl sub_815379C
	lsls r0, 16
	lsrs r6, r0, 16
	add r0, sp, 0xC
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r0, 0
	add r1, sp, 0xC
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	adds r5, r0, 0
	cmp r6, r4
	bne _081551D0
	cmp r6, 0
	beq _081551D0
	ldr r0, _081551A8 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _081551B0 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	lsls r1, r7, 1
	add r1, r10
	ldrb r2, [r1]
	subs r2, r5
	lsls r2, 24
	lsrs r2, 24
	mov r1, r8
	ldrb r3, [r1]
	ldr r1, _081551CC @ =gUnknown_8478E3B
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	add r1, sp, 0xC
	str r1, [sp, 0x8]
	movs r1, 0
	bl AddTextPrinterParameterized3
	b _081551FA
	.align 2, 0
_081551A8: .4byte gUnknown_203F440
_081551AC: .4byte 0x00003008
_081551B0: .4byte 0x00003009
_081551B4: .4byte gUnknown_841CD03
_081551B8: .4byte gUnknown_841CD25
_081551BC: .4byte gUnknown_8478EB0
_081551C0: .4byte gUnknown_8478E38
_081551C4: .4byte gUnknown_8478EA8
_081551C8: .4byte 0x0000270f
_081551CC: .4byte gUnknown_8478E3B
_081551D0:
	ldr r0, _0815523C @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _08155240 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	lsls r1, r7, 1
	add r1, r10
	ldrb r3, [r1]
	subs r3, r5
	lsls r3, 24
	lsrs r3, 24
	mov r2, r8
	ldrb r1, [r2]
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	add r2, sp, 0xC
	bl AddTextPrinterParameterized
_081551FA:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _0815512E
	ldr r1, [sp, 0x88]
	lsls r0, r1, 24
	lsrs r0, 24
	mov r9, r0
	ldr r2, [sp, 0x84]
	cmp r9, r2
	bcs _08155214
	b _081550DA
_08155214:
	ldr r4, _0815523C @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155244 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08155240 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _08155248 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_0815523C: .4byte gUnknown_203F440
_08155240: .4byte 0x00003009
_08155244: .4byte 0x00003008
_08155248: .4byte 0x00003014
_0815524C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155270
	ldr r4, _08155288 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815528C @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _08155290 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_08155270:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl sub_8154324
	ldr r0, _08155288 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08155294 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_08155288: .4byte gUnknown_203F440
_0815528C: .4byte 0x00003008
_08155290: .4byte 0x00003009
_08155294: .4byte 0x00003014
_08155298:
	ldr r4, _081552D0 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _081552D4 @ =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _081552B0
	b _081556C8
_081552B0:
	ldr r0, _081552D8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081552BE
	b _081556C8
_081552BE:
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_8154324
	b _08155658
	.align 2, 0
_081552D0: .4byte gUnknown_203F440
_081552D4: .4byte 0x0000301c
_081552D8: .4byte gMain
_081552DC:
	ldr r4, _08155330 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r5, _08155334 @ =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08155338 @ =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r6, _0815533C @ =gUnknown_841CD43
	movs r2, 0x1
	negs r2, r2
	movs r0, 0
	adds r1, r6, 0
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r2, r6, 0
	bl AddTextPrinterParameterized
	b _08155658
	.align 2, 0
_08155330: .4byte gUnknown_203F440
_08155334: .4byte 0x00003008
_08155338: .4byte 0x00003009
_0815533C: .4byte gUnknown_841CD43
_08155340:
	ldr r0, [sp, 0x84]
	bl sub_8154D9C
	ldr r4, _0815536C @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155370 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08155374 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _08155378 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_0815536C: .4byte gUnknown_203F440
_08155370: .4byte 0x00003008
_08155374: .4byte 0x00003009
_08155378: .4byte 0x00003014
_0815537C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081553A0
	ldr r4, _081553B0 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _081553B4 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _081553B8 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_081553A0:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _081553B0 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _081553BC @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_081553B0: .4byte gUnknown_203F440
_081553B4: .4byte 0x00003008
_081553B8: .4byte 0x00003009
_081553BC: .4byte 0x00003014
_081553C0:
	ldr r4, _08155408 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815540C @ =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _081553D8
	b _081556C8
_081553D8:
	ldr r0, _08155410 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081553E6
	b _081556C8
_081553E6:
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl PlaySE
	bl sub_81534AC
	ldr r1, _08155414 @ =0x00000bb7
	cmp r0, r1
	bhi _0815541C
	ldr r0, [r4]
	ldr r2, _08155418 @ =0x00003014
	adds r0, r2
	movs r1, 0x7F
	strb r1, [r0]
	b _0815542C
	.align 2, 0
_08155408: .4byte gUnknown_203F440
_0815540C: .4byte 0x0000301c
_08155410: .4byte gMain
_08155414: .4byte 0x00000bb7
_08155418: .4byte 0x00003014
_0815541C:
	bl StopMapMusic
	ldr r1, [r4]
	ldr r0, _08155470 @ =0x00003014
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0815542C:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x5
	bl FillBgTilemapBufferRect_Palette0
	ldr r5, _08155474 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r4, _08155478 @ =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r6, _0815547C @ =gUnknown_8475684
	adds r0, r6, 0
	bl AddWindow
	ldr r1, [r5]
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, 0
	bl sub_8154868
	b _081556C8
	.align 2, 0
_08155470: .4byte 0x00003014
_08155474: .4byte gUnknown_203F440
_08155478: .4byte 0x00003009
_0815547C: .4byte gUnknown_8475684
_08155480:
	ldr r0, _08155558 @ =0x00000101
	bl PlayNewMapMusic
	ldr r4, _0815555C @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r6, _08155560 @ =0x00003008
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08155564 @ =0x00003009
	mov r10, r1
	add r0, r10
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r5, _08155568 @ =gUnknown_841CD58
	movs r2, 0x1
	negs r2, r2
	movs r0, 0
	adds r1, r5, 0
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0x2
	mov r9, r2
	str r2, [sp]
	movs r1, 0xFF
	mov r8, r1
	str r1, [sp, 0x4]
	movs r6, 0
	str r6, [sp, 0x8]
	movs r1, 0
	adds r2, r5, 0
	bl AddTextPrinterParameterized
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_8153390
	lsls r0, 16
	lsrs r0, 16
	add r5, sp, 0x70
	adds r1, r5, 0
	bl CopyItemName
	movs r0, 0
	adds r1, r5, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, _0815556C @ =gUnknown_841CD7A
	add r0, sp, 0xC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r0, [r4]
	add r0, r10
	ldrb r0, [r0]
	mov r2, r9
	str r2, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0
	add r2, sp, 0xC
	movs r3, 0x8
	bl AddTextPrinterParameterized
	bl sub_815372C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	cmp r4, 0
	beq _0815559E
	cmp r4, 0x3
	beq _0815559E
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_8153390
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl CopyItemName
	movs r0, 0
	adds r1, r5, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	cmp r4, 0x2
	bne _08155574
	ldr r1, _08155570 @ =gUnknown_841CD9F
	add r0, sp, 0xC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _08155580
	.align 2, 0
_08155558: .4byte 0x00000101
_0815555C: .4byte gUnknown_203F440
_08155560: .4byte 0x00003008
_08155564: .4byte 0x00003009
_08155568: .4byte gUnknown_841CD58
_0815556C: .4byte gUnknown_841CD7A
_08155570: .4byte gUnknown_841CD9F
_08155574:
	cmp r6, 0x1
	bne _08155580
	ldr r1, _081555C4 @ =gUnknown_841CDBA
	add r0, sp, 0xC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
_08155580:
	ldr r0, _081555C8 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _081555CC @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x28
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	add r2, sp, 0xC
	movs r3, 0x8
	bl AddTextPrinterParameterized
_0815559E:
	ldr r4, _081555C8 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _081555D0 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _081555CC @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _081555D4 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_081555C4: .4byte gUnknown_841CDBA
_081555C8: .4byte gUnknown_203F440
_081555CC: .4byte 0x00003009
_081555D0: .4byte 0x00003008
_081555D4: .4byte 0x00003014
_081555D8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081555FC
	ldr r4, _08155618 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815561C @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _08155620 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_081555FC:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08155624 @ =0x00000137
	movs r1, 0x14
	movs r2, 0xA
	bl FadeOutAndFadeInNewMapMusic
	ldr r0, _08155618 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08155628 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_08155618: .4byte gUnknown_203F440
_0815561C: .4byte 0x00003008
_08155620: .4byte 0x00003009
_08155624: .4byte 0x00000137
_08155628: .4byte 0x00003014
_0815562C:
	ldr r4, _08155668 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815566C @ =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bls _081556C8
	ldr r0, _08155670 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081556C8
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl PlaySE
_08155658:
	ldr r1, [r4]
_0815565A:
	ldr r2, _08155674 @ =0x00003014
	adds r1, r2
_0815565E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081556C8
	.align 2, 0
_08155668: .4byte gUnknown_203F440
_0815566C: .4byte 0x0000301c
_08155670: .4byte gMain
_08155674: .4byte 0x00003014
_08155678:
	ldr r5, _081556D8 @ =0x00003008
	adds r0, r1, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	ldr r4, _081556DC @ =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r6]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_081556C8:
	add sp, 0x8C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081556D8: .4byte 0x00003008
_081556DC: .4byte 0x00003009
	thumb_func_end sub_8154F80

	thumb_func_start sub_81556E0
sub_81556E0: @ 81556E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r1, _08155708 @ =gUnknown_203F440
	ldr r2, [r1]
	ldr r0, _0815570C @ =0x00003014
	mov r9, r0
	adds r0, r2, r0
	ldrb r7, [r0]
	mov r10, r1
	cmp r7, 0x1
	beq _0815579C
	cmp r7, 0x1
	bgt _08155710
	cmp r7, 0
	beq _0815571E
	b _081559EC
	.align 2, 0
_08155708: .4byte gUnknown_203F440
_0815570C: .4byte 0x00003014
_08155710:
	cmp r7, 0x2
	bne _08155716
	b _08155868
_08155716:
	cmp r7, 0x3
	bne _0815571C
	b _081558A4
_0815571C:
	b _081559EC
_0815571E:
	ldr r5, _08155788 @ =gUnknown_847568C
	adds r0, r5, 0
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	ldr r3, _0815578C @ =0x00003008
	adds r1, r3
	strb r0, [r1]
	movs r0, 0x8
	adds r0, r5
	mov r8, r0
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	ldr r4, _08155790 @ =0x00003009
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r2]
	ldr r3, _0815578C @ =0x00003008
	adds r0, r3
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r1, r10
	ldr r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r5, 0
	bl sub_8154868
	mov r0, r8
	bl sub_8154768
	mov r2, r10
	ldr r1, [r2]
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	ldr r3, _08155794 @ =0x00003020
	adds r0, r3
	strb r7, [r0]
	ldr r0, [r2]
	ldr r1, _08155798 @ =0x00003024
	adds r0, r1
	strb r7, [r0]
	b _08155A58
	.align 2, 0
_08155788: .4byte gUnknown_847568C
_0815578C: .4byte 0x00003008
_08155790: .4byte 0x00003009
_08155794: .4byte 0x00003020
_08155798: .4byte 0x00003024
_0815579C:
	ldr r3, _0815584C @ =0x00003008
	mov r8, r3
	adds r0, r2, r3
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	mov r1, r10
	ldr r0, [r1]
	ldr r7, _08155850 @ =0x00003009
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	mov r2, r10
	ldr r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _08155854 @ =gUnknown_841CDD7
	movs r1, 0x6
	str r1, [sp]
	movs r5, 0xFF
	str r5, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	mov r3, r10
	ldr r0, [r3]
	adds r0, r7
	ldrb r0, [r0]
	ldr r2, _08155858 @ =gUnknown_8417938
	movs r1, 0x2
	mov r9, r1
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r2, r10
	ldr r0, [r2]
	adds r0, r7
	ldrb r0, [r0]
	ldr r2, _0815585C @ =gUnknown_841793C
	movs r1, 0x10
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r3, r10
	ldr r0, [r3]
	adds r0, r7
	ldrb r0, [r0]
	ldr r2, _08155860 @ =gFameCheckerText_ListMenuCursor
	mov r1, r9
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	mov r2, r10
	ldr r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	mov r3, r10
	ldr r0, [r3]
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	mov r0, r10
	ldr r1, [r0]
	ldr r2, _08155864 @ =0x00003014
	adds r1, r2
	b _081559DA
	.align 2, 0
_0815584C: .4byte 0x00003008
_08155850: .4byte 0x00003009
_08155854: .4byte gUnknown_841CDD7
_08155858: .4byte gUnknown_8417938
_0815585C: .4byte gUnknown_841793C
_08155860: .4byte gFameCheckerText_ListMenuCursor
_08155864: .4byte 0x00003014
_08155868:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0815588E
	mov r3, r10
	ldr r0, [r3]
	ldr r1, _0815589C @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	mov r2, r10
	ldr r0, [r2]
	ldr r3, _081558A0 @ =0x00003009
	adds r0, r3
	ldrb r0, [r0]
	bl PutWindowTilemap
_0815588E:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	mov r0, r10
	ldr r1, [r0]
	add r1, r9
	b _081559DA
	.align 2, 0
_0815589C: .4byte 0x00003008
_081558A0: .4byte 0x00003009
_081558A4:
	ldr r1, _0815590C @ =0x00003020
	adds r0, r2, r1
	ldrb r7, [r0]
	cmp r7, 0
	bne _081558B0
	movs r7, 0x1
_081558B0:
	ldr r4, _08155910 @ =0x00003009
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	mov r2, r10
	ldr r0, [r2]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155914 @ =gUnknown_8417938
	movs r3, 0x2
	mov r8, r3
	str r3, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r2, r10
	ldr r0, [r2]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155918 @ =gUnknown_841793C
	movs r6, 0x10
	str r6, [sp]
	movs r3, 0xFF
	str r3, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r1, r10
	ldr r0, [r1]
	adds r0, r4
	ldrb r1, [r0]
	ldr r2, _0815591C @ =gFameCheckerText_ListMenuCursor
	cmp r7, 0x1
	bne _08155920
	mov r3, r8
	str r3, [sp]
	b _08155922
	.align 2, 0
_0815590C: .4byte 0x00003020
_08155910: .4byte 0x00003009
_08155914: .4byte gUnknown_8417938
_08155918: .4byte gUnknown_841793C
_0815591C: .4byte gFameCheckerText_ListMenuCursor
_08155920:
	str r6, [sp]
_08155922:
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r4, _08155970 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155974 @ =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _08155978 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08155984
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r2, _0815597C @ =0x00003020
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _08155966
	strb r5, [r1]
_08155966:
	ldr r1, [r4]
	ldr r3, _08155980 @ =0x00003014
	adds r1, r3
	b _081559DA
	.align 2, 0
_08155970: .4byte gUnknown_203F440
_08155974: .4byte 0x00003009
_08155978: .4byte gMain
_0815597C: .4byte 0x00003020
_08155980: .4byte 0x00003014
_08155984:
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _081559BC
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r2, _081559A8 @ =0x00003020
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _081559B2
	cmp r0, 0x1
	bgt _081559AC
	cmp r0, 0
	beq _081559B2
	b _08155A58
	.align 2, 0
_081559A8: .4byte 0x00003020
_081559AC:
	cmp r0, 0x2
	beq _081559B8
	b _08155A58
_081559B2:
	movs r0, 0x2
	strb r0, [r1]
	b _08155A58
_081559B8:
	strb r5, [r1]
	b _08155A58
_081559BC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08155A58
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r3, _081559E4 @ =0x00003020
	adds r0, r3
	movs r1, 0x2
	strb r1, [r0]
	ldr r1, [r4]
	ldr r0, _081559E8 @ =0x00003014
	adds r1, r0
_081559DA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155A58
	.align 2, 0
_081559E4: .4byte 0x00003020
_081559E8: .4byte 0x00003014
_081559EC:
	mov r1, r10
	ldr r0, [r1]
	ldr r2, _08155A68 @ =0x00003020
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r3, _08155A6C @ =0x00003024
	adds r0, r3
	strb r1, [r0]
	mov r1, r10
	ldr r0, [r1]
	ldr r5, _08155A70 @ =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r2, r10
	ldr r0, [r2]
	ldr r4, _08155A74 @ =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r3, r10
	ldr r0, [r3]
	adds r0, r5
	ldrb r0, [r0]
	bl RemoveWindow
	mov r1, r10
	ldr r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	mov r2, r10
	ldr r0, [r2]
	movs r3, 0xC0
	lsls r3, 6
	adds r0, r3
	movs r1, 0x1
	str r1, [r0]
_08155A58:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08155A68: .4byte 0x00003020
_08155A6C: .4byte 0x00003024
_08155A70: .4byte 0x00003008
_08155A74: .4byte 0x00003009
	thumb_func_end sub_81556E0

	thumb_func_start sub_8155A78
sub_8155A78: @ 8155A78
	push {r4-r6,lr}
	sub sp, 0x10
	ldr r5, _08155A94 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r6, _08155A98 @ =0x00003014
	adds r0, r6
	ldrb r4, [r0]
	cmp r4, 0x1
	beq _08155AD0
	cmp r4, 0x1
	bgt _08155A9C
	cmp r4, 0
	beq _08155AA6
	b _08155B18
	.align 2, 0
_08155A94: .4byte gUnknown_203F440
_08155A98: .4byte 0x00003014
_08155A9C:
	cmp r4, 0x2
	beq _08155AE4
	cmp r4, 0x3
	beq _08155AFC
	b _08155B18
_08155AA6:
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	ldr r2, _08155ACC @ =gText_SavingDontTurnOffThePower2
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized2
	b _08155B08
	.align 2, 0
_08155ACC: .4byte gText_SavingDontTurnOffThePower2
_08155AD0:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, _08155AE0 @ =0x00003014
	adds r1, r0
	b _08155B0C
	.align 2, 0
_08155AE0: .4byte 0x00003014
_08155AE4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155B40
	ldr r0, _08155AF8 @ =sub_80DA634
	movs r1, 0
	bl CreateTask
	b _08155B08
	.align 2, 0
_08155AF8: .4byte sub_80DA634
_08155AFC:
	ldr r0, _08155B14 @ =sub_80DA634
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08155B40
_08155B08:
	ldr r1, [r5]
	adds r1, r6
_08155B0C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155B40
	.align 2, 0
_08155B14: .4byte sub_80DA634
_08155B18:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08155B48 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_08155B40:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08155B48: .4byte gUnknown_203F440
	thumb_func_end sub_8155A78

	thumb_func_start sub_8155B4C
sub_8155B4C: @ 8155B4C
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r1, _08155B6C @ =gUnknown_203F440
	ldr r2, [r1]
	ldr r6, _08155B70 @ =0x00003014
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x1
	beq _08155BA4
	cmp r0, 0x1
	bgt _08155B74
	cmp r0, 0
	beq _08155B7A
	b _08155C18
	.align 2, 0
_08155B6C: .4byte gUnknown_203F440
_08155B70: .4byte 0x00003014
_08155B74:
	cmp r0, 0x2
	beq _08155BEC
	b _08155C18
_08155B7A:
	ldr r4, _08155B9C @ =gUnknown_84756A4
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	ldr r2, _08155BA0 @ =0x00003008
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, 0
	bl sub_8154868
	b _08155C08
	.align 2, 0
_08155B9C: .4byte gUnknown_84756A4
_08155BA0: .4byte 0x00003008
_08155BA4:
	ldr r4, _08155BE0 @ =0x00003008
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155BE4 @ =gUnknown_841CE24
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, _08155BE8 @ =0x00003014
	adds r1, r0
	b _08155C0C
	.align 2, 0
_08155BE0: .4byte 0x00003008
_08155BE4: .4byte gUnknown_841CE24
_08155BE8: .4byte 0x00003014
_08155BEC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155C02
	ldr r0, [r5]
	ldr r1, _08155C14 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_08155C02:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_08155C08:
	ldr r1, [r5]
	adds r1, r6
_08155C0C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155C24
	.align 2, 0
_08155C14: .4byte 0x00003008
_08155C18:
	ldr r0, [r5]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_08155C24:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8155B4C

	thumb_func_start sub_8155C2C
sub_8155C2C: @ 8155C2C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r5, _08155C78 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r4, _08155C7C @ =0x00003008
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r5]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08155C78: .4byte gUnknown_203F440
_08155C7C: .4byte 0x00003008
	thumb_func_end sub_8155C2C

	thumb_func_start sub_8155C80
sub_8155C80: @ 8155C80
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r0, _08155CA0 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r7, _08155CA4 @ =0x00003014
	adds r2, r1, r7
	ldrb r5, [r2]
	adds r6, r0, 0
	cmp r5, 0x1
	beq _08155D08
	cmp r5, 0x1
	bgt _08155CA8
	cmp r5, 0
	beq _08155CB2
	b _08155D9C
	.align 2, 0
_08155CA0: .4byte gUnknown_203F440
_08155CA4: .4byte 0x00003014
_08155CA8:
	cmp r5, 0x2
	beq _08155D50
	cmp r5, 0x3
	beq _08155D7C
	b _08155D9C
_08155CB2:
	ldr r4, _08155CF8 @ =gUnknown_847569C
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r6]
	ldr r2, _08155CFC @ =0x00003008
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, 0
	bl sub_8154868
	ldr r1, [r6]
	adds r1, r7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	ldr r2, _08155D00 @ =0x0000301c
	adds r1, r0, r2
	movs r2, 0
	strh r5, [r1]
	ldr r1, _08155D04 @ =0x00003020
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r6]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	b _08155DE2
	.align 2, 0
_08155CF8: .4byte gUnknown_847569C
_08155CFC: .4byte 0x00003008
_08155D00: .4byte 0x0000301c
_08155D04: .4byte 0x00003020
_08155D08:
	ldr r4, _08155D44 @ =0x00003008
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155D48 @ =gUnknown_841CDEB
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r6]
	ldr r2, _08155D4C @ =0x00003014
	adds r1, r2
	b _08155D70
	.align 2, 0
_08155D44: .4byte 0x00003008
_08155D48: .4byte gUnknown_841CDEB
_08155D4C: .4byte 0x00003014
_08155D50:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155D66
	ldr r0, [r6]
	ldr r1, _08155D78 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_08155D66:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r6]
	adds r1, r7
_08155D70:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155DE2
	.align 2, 0
_08155D78: .4byte 0x00003008
_08155D7C:
	ldr r0, _08155D98 @ =0x0000301c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x77
	bls _08155DE2
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _08155DE2
	.align 2, 0
_08155D98: .4byte 0x0000301c
_08155D9C:
	ldr r0, [r6]
	ldr r1, _08155DEC @ =0x00003024
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	ldr r0, [r6]
	ldr r4, _08155DF0 @ =0x00003008
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r6]
	movs r2, 0xC0
	lsls r2, 6
	adds r0, r2
	movs r1, 0x1
	str r1, [r0]
_08155DE2:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08155DEC: .4byte 0x00003024
_08155DF0: .4byte 0x00003008
	thumb_func_end sub_8155C80

	thumb_func_start unused_0
unused_0: @ 8155DF4
	push {r4,lr}
	ldr r4, _08155E18 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155E1C @ =0x00003004
	adds r0, r1
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, [r4]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08155E18: .4byte gUnknown_203F440
_08155E1C: .4byte 0x00003004
	thumb_func_end unused_0

	thumb_func_start nullsub_98
nullsub_98: @ 8155E20
	bx lr
	thumb_func_end nullsub_98

	thumb_func_start sub_8155E24
sub_8155E24: @ 8155E24
	push {r4,lr}
	ldr r2, _08155E48 @ =gUnknown_203F440
	ldr r1, [r2]
	ldr r3, _08155E4C @ =0x00003014
	adds r1, r3
	movs r3, 0
	strb r3, [r1]
	ldr r1, [r2]
	movs r4, 0xC0
	lsls r4, 6
	adds r2, r1, r4
	str r3, [r2]
	ldr r2, _08155E50 @ =0x00003028
	adds r1, r2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08155E48: .4byte gUnknown_203F440
_08155E4C: .4byte 0x00003014
_08155E50: .4byte 0x00003028
	thumb_func_end sub_8155E24

	thumb_func_start sub_8155E54
sub_8155E54: @ 8155E54
	ldr r0, _08155E60 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r1, _08155E64 @ =0x00003028
	adds r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08155E60: .4byte gUnknown_203F440
_08155E64: .4byte 0x00003028
	thumb_func_end sub_8155E54

	thumb_func_start sub_8155E68
sub_8155E68: @ 8155E68
	push {lr}
	ldr r0, _08155E80 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08155E84
	movs r0, 0x1
	b _08155E86
	.align 2, 0
_08155E80: .4byte gUnknown_203F440
_08155E84:
	movs r0, 0
_08155E86:
	pop {r1}
	bx r1
	thumb_func_end sub_8155E68

	thumb_func_start sub_8155E8C
sub_8155E8C: @ 8155E8C
	ldr r0, _08155E98 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r1, _08155E9C @ =0x00003024
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08155E98: .4byte gUnknown_203F440
_08155E9C: .4byte 0x00003024
	thumb_func_end sub_8155E8C

	thumb_func_start sub_8155EA0
sub_8155EA0: @ 8155EA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _08155FD0 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08155FD4 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08155EC6:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08155EC6
	strh r6, [r2]
	mov r2, sp
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
	str r4, [sp, 0x4]
	ldr r2, _08155FD0 @ =0x040000d4
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
	mov r0, sp
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
	ldr r1, _08155FD8 @ =gUnknown_847565C
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
	bl InitStandardTextBoxWindows
	bl ResetBg0
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r4, _08155FDC @ =gUnknown_203F440
	ldr r1, [r4]
	movs r0, 0x3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r2
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 6
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08155FD0: .4byte 0x040000d4
_08155FD4: .4byte 0x81000800
_08155FD8: .4byte gUnknown_847565C
_08155FDC: .4byte gUnknown_203F440
	thumb_func_end sub_8155EA0

	thumb_func_start sub_8155FE0
sub_8155FE0: @ 8155FE0
	push {lr}
	sub sp, 0x4
	ldr r0, _08155FFC @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _08156000 @ =0x00003018
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _0815607A
	lsls r0, 2
	ldr r1, _08156004 @ =_08156008
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08155FFC: .4byte gUnknown_203F440
_08156000: .4byte 0x00003018
_08156004: .4byte _08156008
	.align 2, 0
_08156008:
	.4byte _08156020
	.4byte _08156030
	.4byte _08156036
	.4byte _08156044
	.4byte _0815605C
	.4byte _0815606A
_08156020:
	ldr r0, _0815602C @ =gUnknown_84758A8
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	b _08156082
	.align 2, 0
_0815602C: .4byte gUnknown_84758A8
_08156030:
	bl ResetTempTileDataBuffers
	b _08156082
_08156036:
	ldr r1, _08156040 @ =gUnknown_8475B3C
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	b _0815604C
	.align 2, 0
_08156040: .4byte gUnknown_8475B3C
_08156044:
	ldr r1, _08156058 @ =gUnknown_84763CC
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
_0815604C:
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	b _08156082
	.align 2, 0
_08156058: .4byte gUnknown_84763CC
_0815605C:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08156082
	b _08156090
_0815606A:
	movs r0, 0x3
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	b _08156082
_0815607A:
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _08156092
_08156082:
	ldr r0, _08156098 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _0815609C @ =0x00003018
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08156090:
	movs r0, 0
_08156092:
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_08156098: .4byte gUnknown_203F440
_0815609C: .4byte 0x00003018
	thumb_func_end sub_8155FE0

	.align 2, 0 @ Don't pad with nop.
