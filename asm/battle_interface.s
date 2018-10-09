	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8047B0C
sub_8047B0C: @ 8047B0C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	movs r3, 0
	movs r2, 0
_08047B28:
	lsls r0, r3, 24
	asrs r0, 24
	mov r3, sp
	adds r1, r3, r0
	strb r2, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _08047B28
	movs r3, 0x3
	movs r0, 0x1
	negs r0, r0
	mov r9, r0
	mov r8, sp
_08047B48:
	lsls r0, r5, 16
	asrs r6, r0, 16
	cmp r6, 0
	ble _08047B76
	lsls r4, r3, 24
	asrs r4, 24
	mov r1, sp
	adds r5, r1, r4
	adds r0, r6, 0
	movs r1, 0xA
	bl __modsi3
	strb r0, [r5]
	adds r0, r6, 0
	movs r1, 0xA
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	subs r4, 0x1
	lsls r4, 24
	lsrs r3, r4, 24
	b _08047B48
_08047B76:
	lsls r1, r3, 24
	asrs r0, r1, 24
	cmp r0, r9
	ble _08047B9A
	movs r4, 0xFF
	movs r3, 0x1
	negs r3, r3
_08047B84:
	asrs r2, r1, 24
	mov r5, sp
	adds r1, r5, r2
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	subs r2, 0x1
	lsls r1, r2, 24
	asrs r0, r1, 24
	cmp r0, r3
	bgt _08047B84
_08047B9A:
	mov r1, r8
	ldrb r0, [r1, 0x3]
	cmp r0, 0xFF
	bne _08047BA6
	movs r0, 0
	strb r0, [r1, 0x3]
_08047BA6:
	mov r2, r10
	cmp r2, 0
	bne _08047C36
	movs r3, 0
	movs r1, 0
	movs r6, 0xFC
	lsls r6, 8
	movs r5, 0x1E
	mov r12, r5
_08047BB8:
	lsls r1, 24
	asrs r2, r1, 24
	mov r0, sp
	adds r5, r0, r2
	ldrb r0, [r5]
	mov r8, r1
	cmp r0, 0xFF
	bne _08047BEE
	lsls r1, r2, 1
	adds r1, r7
	ldrh r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	mov r2, r12
	orrs r0, r2
	strh r0, [r1]
	lsls r3, 24
	asrs r1, r3, 23
	adds r1, r7
	adds r1, 0x40
	ldrh r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	mov r5, r12
	orrs r0, r5
	strh r0, [r1]
	b _08047C1E
_08047BEE:
	lsls r2, 1
	adds r2, r7
	ldrh r0, [r2]
	adds r1, r6, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x14
	orrs r1, r0
	strh r1, [r2]
	lsls r4, r3, 24
	asrs r3, r4, 24
	lsls r2, r3, 1
	adds r2, r7
	adds r2, 0x40
	ldrh r0, [r2]
	adds r1, r6, 0
	ands r1, r0
	mov r5, sp
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, 0x34
	orrs r1, r0
	strh r1, [r2]
	adds r3, r4, 0
_08047C1E:
	movs r0, 0x80
	lsls r0, 17
	add r0, r8
	lsrs r1, r0, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r3, r2
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _08047BB8
	b _08047C9A
_08047C36:
	movs r3, 0
	movs r4, 0xFC
	lsls r4, 8
	movs r6, 0x1E
_08047C3E:
	lsls r1, r3, 24
	asrs r2, r1, 24
	mov r3, sp
	adds r5, r3, r2
	ldrb r0, [r5]
	adds r3, r1, 0
	cmp r0, 0xFF
	bne _08047C6A
	lsls r1, r2, 1
	adds r1, r7
	ldrh r2, [r1]
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	adds r1, 0x40
	ldrh r2, [r1]
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	b _08047C8C
_08047C6A:
	lsls r2, 1
	adds r2, r7
	ldrh r0, [r2]
	adds r1, r4, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x14
	orrs r1, r0
	strh r1, [r2]
	adds r2, 0x40
	ldrh r0, [r2]
	adds r1, r4, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x34
	orrs r1, r0
	strh r1, [r2]
_08047C8C:
	movs r5, 0x80
	lsls r5, 17
	adds r0, r3, r5
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _08047C3E
_08047C9A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8047B0C

	thumb_func_start sub_8047CAC
sub_8047CAC: @ 8047CAC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	movs r1, 0x1E
	strh r1, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	adds r1, r5, 0
	movs r2, 0
	bl sub_8047B0C
	lsls r4, 16
	asrs r4, 16
	adds r5, 0xA
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_8047B0C
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8047CAC

	thumb_func_start CreateBankHealthboxSprites
CreateBankHealthboxSprites: @ 8047CE0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0
	str r0, [sp]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _08047DF4
	mov r0, r10
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08047D78
	ldr r4, _08047D68 @ =gUnknown_8260278
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08047D6C @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	movs r3, 0x3F
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r2, r4
	ldrb r0, [r2, 0x1]
	ands r3, r0
	strb r3, [r2, 0x1]
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x40
	ldr r4, _08047D70 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _08047D74 @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	b _08047DBE
	.align 2, 0
_08047D68: .4byte gUnknown_8260278
_08047D6C: .4byte gSprites
_08047D70: .4byte 0x000003ff
_08047D74: .4byte 0xfffffc00
_08047D78:
	ldr r4, _08047DE0 @ =gUnknown_82602A8
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08047DE4 @ =gSprites
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08047DE8 @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08047DEC @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	movs r0, 0x2
	str r0, [sp]
_08047DBE:
	ldr r2, _08047DE4 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r2
	strh r7, [r0, 0x6]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r1, r0, r2
	strh r6, [r1, 0x38]
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08047DF0 @ =sub_8048128
	str r1, [r0]
	b _08047F1C
	.align 2, 0
_08047DE0: .4byte gUnknown_82602A8
_08047DE4: .4byte gSprites
_08047DE8: .4byte 0x000003ff
_08047DEC: .4byte 0xfffffc00
_08047DF0: .4byte sub_8048128
_08047DF4:
	mov r0, r10
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08047E98
	mov r0, r10
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r4, _08047E84 @ =gUnknown_8260278
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r10
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08047E88 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x6]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r3, r2, r4
	strh r6, [r3, 0x38]
	ldrh r1, [r3, 0x4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08047E8C @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08047E90 @ =0xfffffc00
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r4, 0x1C
	adds r2, r4
	ldr r0, _08047E94 @ =sub_8048128
	str r0, [r2]
	movs r0, 0x1
	b _08047F1A
	.align 2, 0
_08047E84: .4byte gUnknown_8260278
_08047E88: .4byte gSprites
_08047E8C: .4byte 0x000003ff
_08047E90: .4byte 0xfffffc00
_08047E94: .4byte sub_8048128
_08047E98:
	mov r0, r10
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r4, _08047FE0 @ =gUnknown_82602A8
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r10
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08047FE4 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x6]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r3, r2, r4
	strh r6, [r3, 0x38]
	ldrh r1, [r3, 0x4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08047FE8 @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08047FEC @ =0xfffffc00
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r4, 0x1C
	adds r2, r4
	ldr r0, _08047FF0 @ =sub_8048128
	str r0, [r2]
	movs r0, 0x2
_08047F1A:
	str r0, [sp]
_08047F1C:
	ldr r0, _08047FF4 @ =gUnknown_2023BD6
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _08047FF8 @ =gUnknown_82602F8
	adds r0, r1
	movs r1, 0x8C
	movs r2, 0x3C
	movs r3, 0
	bl CreateSpriteAtEnd
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r1, _08047FE4 @ =gSprites
	mov r8, r1
	add r4, r8
	mov r0, r10
	bl GetBattlerSide
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 21
	ldr r0, _08047FFC @ =gUnknown_82603C4
	adds r1, r0
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r2, r4, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r2, 0x4
	mov r9, r2
	mov r1, r9
	orrs r0, r1
	strb r0, [r4, 0x5]
	movs r0, 0x1
	bl GetHealthboxElementGfxPtr
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _08048000 @ =0x06010000
	adds r1, r2
	ldr r2, _08048004 @ =0x04000010
	bl CpuSet
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	add r0, r8
	strh r5, [r0, 0x38]
	mov r2, r10
	strh r2, [r0, 0x3A]
	adds r0, 0x3E
	ldrb r1, [r0]
	mov r5, r9
	orrs r1, r5
	strb r1, [r0]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	add r0, r8
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	strh r6, [r4, 0x38]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x3A]
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r5
	strb r0, [r4]
	adds r0, r6, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08047FE0: .4byte gUnknown_82602A8
_08047FE4: .4byte gSprites
_08047FE8: .4byte 0x000003ff
_08047FEC: .4byte 0xfffffc00
_08047FF0: .4byte sub_8048128
_08047FF4: .4byte gUnknown_2023BD6
_08047FF8: .4byte gUnknown_82602F8
_08047FFC: .4byte gUnknown_82603C4
_08048000: .4byte 0x06010000
_08048004: .4byte 0x04000010
	thumb_func_end CreateBankHealthboxSprites

	thumb_func_start CreateSafariPlayerHealthboxSprites
CreateSafariPlayerHealthboxSprites: @ 8048008
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, _08048094 @ =gUnknown_82602D8
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08048098 @ =gSprites
	mov r9, r1
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	add r4, r9
	ldrb r3, [r4, 0x1]
	movs r2, 0x3F
	adds r1, r2, 0
	ands r1, r3
	strb r1, [r4, 0x1]
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	mov r7, r9
	adds r5, r3, r7
	ldrb r1, [r5, 0x1]
	ands r2, r1
	strb r2, [r5, 0x1]
	ldrh r1, [r5, 0x4]
	mov r8, r1
	mov r7, r8
	lsls r2, r7, 22
	lsrs r2, 22
	adds r2, 0x40
	ldr r7, _0804809C @ =0x000003ff
	adds r1, r7, 0
	ands r2, r1
	ldr r1, _080480A0 @ =0xfffffc00
	mov r7, r8
	ands r1, r7
	orrs r1, r2
	strh r1, [r5, 0x4]
	strh r0, [r4, 0x6]
	strh r6, [r5, 0x38]
	movs r0, 0x1C
	add r9, r0
	add r3, r9
	ldr r0, _080480A4 @ =sub_8048128
	str r0, [r3]
	adds r0, r6, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08048094: .4byte gUnknown_82602D8
_08048098: .4byte gSprites
_0804809C: .4byte 0x000003ff
_080480A0: .4byte 0xfffffc00
_080480A4: .4byte sub_8048128
	thumb_func_end CreateSafariPlayerHealthboxSprites

	thumb_func_start GetHealthboxElementGfxPtr
GetHealthboxElementGfxPtr: @ 80480A8
	lsls r0, 24
	lsrs r0, 19
	ldr r1, _080480B4 @ =gUnknown_8D11BC4
	adds r0, r1
	bx lr
	.align 2, 0
_080480B4: .4byte gUnknown_8D11BC4
	thumb_func_end GetHealthboxElementGfxPtr

	thumb_func_start sub_80480B8
sub_80480B8: @ 80480B8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080480E8
	cmp r0, 0x1
	bgt _080480FC
	cmp r0, 0
	bne _080480FC
	ldr r2, _080480E4 @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	b _0804810A
	.align 2, 0
_080480E4: .4byte gSprites
_080480E8:
	ldr r2, _080480F8 @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	b _0804810A
	.align 2, 0
_080480F8: .4byte gSprites
_080480FC:
	ldr r2, _08048124 @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x8
_0804810A:
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x22]
	strh r0, [r4, 0x22]
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	strh r1, [r4, 0x24]
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048124: .4byte gSprites
	thumb_func_end sub_80480B8

	thumb_func_start sub_8048128
sub_8048128: @ 8048128
	ldrh r1, [r0, 0x38]
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0804814C @ =gSprites
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x20]
	adds r1, 0x40
	strh r1, [r0, 0x20]
	ldrh r1, [r2, 0x22]
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x24]
	strh r1, [r0, 0x24]
	ldrh r1, [r2, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_0804814C: .4byte gSprites
	thumb_func_end sub_8048128

	thumb_func_start SetBattleBarStruct
SetBattleBarStruct: @ 8048150
	push {r4-r7,lr}
	ldr r7, [sp, 0x14]
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08048180 @ =gUnknown_2024018
	ldr r4, [r6]
	ldr r5, [r4, 0xC]
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 2
	adds r5, r4, r5
	strb r1, [r5]
	ldr r0, [r6]
	ldr r0, [r0, 0xC]
	adds r4, r0
	str r2, [r4, 0x4]
	str r3, [r4, 0x8]
	str r7, [r4, 0xC]
	ldr r0, _08048184 @ =0xffff8000
	str r0, [r4, 0x10]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048180: .4byte gUnknown_2024018
_08048184: .4byte 0xffff8000
	thumb_func_end SetBattleBarStruct

	thumb_func_start SetHealthboxSpriteInvisible
SetHealthboxSpriteInvisible: @ 8048188
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080481D0 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	movs r0, 0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	ldrh r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080481D0: .4byte gSprites
	thumb_func_end SetHealthboxSpriteInvisible

	thumb_func_start SetHealthboxSpriteVisible
SetHealthboxSpriteVisible: @ 80481D4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08048224 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	adds r4, r2, 0
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r3, 0x5
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r4, [r0]
	adds r1, r3, 0
	ands r1, r4
	strb r1, [r0]
	ldrh r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048224: .4byte gSprites
	thumb_func_end SetHealthboxSpriteVisible

	thumb_func_start UpdateSpritePos
UpdateSpritePos: @ 8048228
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08048244 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	strh r1, [r3, 0x20]
	strh r2, [r3, 0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048244: .4byte gSprites
	thumb_func_end UpdateSpritePos

	thumb_func_start DestoryHealthboxSprite
DestoryHealthboxSprite: @ 8048248
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08048284 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	ldrh r1, [r4, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048284: .4byte gSprites
	thumb_func_end DestoryHealthboxSprite

	thumb_func_start nullsub_21
nullsub_21: @ 8048288
	bx lr
	thumb_func_end nullsub_21

	thumb_func_start UpdateOamPriorityInAllHealthboxes
UpdateOamPriorityInAllHealthboxes: @ 804828C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	ldr r1, _08048310 @ =gBattlersCount
	mov r8, r1
	ldrb r2, [r1]
	cmp r6, r2
	bge _08048304
	ldr r1, _08048314 @ =gSprites
	mov r12, r1
	movs r1, 0x3
	ands r0, r1
	lsls r5, r0, 2
	movs r7, 0xD
	negs r7, r7
	ldr r2, _08048318 @ =gUnknown_3004FF0
	mov r9, r2
_080482B6:
	mov r1, r9
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	ldrb r4, [r1, 0x6]
	ldrh r3, [r1, 0x38]
	lsls r3, 24
	lsrs r3, 24
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	adds r6, 0x1
	mov r2, r8
	ldrb r2, [r2]
	cmp r6, r2
	blt _080482B6
_08048304:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048310: .4byte gBattlersCount
_08048314: .4byte gSprites
_08048318: .4byte gUnknown_3004FF0
	thumb_func_end UpdateOamPriorityInAllHealthboxes

	thumb_func_start SetBankHealthboxSpritePos
SetBankHealthboxSpritePos: @ 804831C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r4, 0
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _08048348
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08048342
	movs r5, 0x2C
	movs r4, 0x1E
	b _08048380
_08048342:
	movs r5, 0x9E
	movs r4, 0x58
	b _08048380
_08048348:
	adds r0, r6, 0
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08048376
	cmp r0, 0x1
	bgt _08048360
	cmp r0, 0
	beq _0804836A
	b _08048380
_08048360:
	cmp r0, 0x2
	beq _08048370
	cmp r0, 0x3
	beq _0804837C
	b _08048380
_0804836A:
	movs r5, 0x9F
	movs r4, 0x4B
	b _08048380
_08048370:
	movs r5, 0xAB
	movs r4, 0x64
	b _08048380
_08048376:
	movs r5, 0x2C
	movs r4, 0x13
	b _08048380
_0804837C:
	movs r5, 0x20
	movs r4, 0x2C
_08048380:
	ldr r0, _08048394 @ =gUnknown_3004FF0
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r4, 0
	bl UpdateSpritePos
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048394: .4byte gUnknown_3004FF0
	thumb_func_end SetBankHealthboxSpritePos

	thumb_func_start UpdateLvlInHealthbox
UpdateLvlInHealthbox: @ 8048398
	push {r4-r6,lr}
	sub sp, 0x14
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08048410 @ =gUnknown_826051C
	mov r0, sp
	movs r2, 0x10
	bl memcpy
	mov r0, sp
	adds r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r1, r0, 0
	subs r1, 0x2
	mov r0, sp
	subs r1, r0
	movs r0, 0x3
	subs r0, r1
	lsls r1, r0, 2
	adds r1, r0
	add r3, sp, 0x10
	mov r0, sp
	movs r2, 0x3
	bl AddTextPrinterAndCreateWindowOnHealthbox
	adds r6, r0, 0
	ldr r0, _08048414 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r4, r0, 17
	ldrh r0, [r1, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08048420
	bl sub_8075290
	lsls r0, 24
	ldr r2, _08048418 @ =0x06010420
	adds r1, r4, r2
	cmp r0, 0
	bne _08048424
	ldr r0, _0804841C @ =0x06010820
	adds r1, r4, r0
	b _08048424
	.align 2, 0
_08048410: .4byte gUnknown_826051C
_08048414: .4byte gSprites
_08048418: .4byte 0x06010420
_0804841C: .4byte 0x06010820
_08048420:
	ldr r2, _0804843C @ =0x06010400
	adds r1, r4, r2
_08048424:
	adds r0, r1, 0
	adds r1, r6, 0
	movs r2, 0x3
	bl sub_804A6E8
	ldr r0, [sp, 0x10]
	bl sub_804A6D8
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804843C: .4byte 0x06010400
	thumb_func_end UpdateLvlInHealthbox

	thumb_func_start sub_8048440
sub_8048440: @ 8048440
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r1, _080484B4 @ =gSprites
	lsls r0, 4
	add r0, r9
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08048514
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _08048514
	mov r0, r8
	cmp r0, 0
	beq _080484BC
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	add r0, sp, 0x10
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	add r3, sp, 0x2C
	add r0, sp, 0x10
	movs r1, 0
	movs r2, 0x5
	bl AddTextPrinterAndCreateWindowOnHealthbox
	adds r5, r0, 0
	ldrh r0, [r4, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldr r1, _080484B8 @ =0x06010a40
	adds r0, r1
	adds r1, r5, 0
	b _080484FE
	.align 2, 0
_080484B4: .4byte gSprites
_080484B8: .4byte 0x06010a40
_080484BC:
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	add r0, sp, 0x10
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r1, 0xBA
	strb r1, [r0]
	movs r1, 0xFF
	strb r1, [r0, 0x1]
	add r3, sp, 0x2C
	add r0, sp, 0x10
	movs r1, 0x4
	movs r2, 0x5
	bl AddTextPrinterAndCreateWindowOnHealthbox
	adds r5, r0, 0
	ldrh r4, [r4, 0x4]
	lsls r4, 22
	lsrs r4, 17
	ldr r1, _0804850C @ =0x060102e0
	adds r0, r4, r1
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_804A6E8
	ldr r2, _08048510 @ =0x06010a00
	adds r4, r2
	adds r1, r5, 0
	adds r1, 0x20
	adds r0, r4, 0
_080484FE:
	movs r2, 0x2
	bl sub_804A6E8
	ldr r0, [sp, 0x2C]
	bl sub_804A6D8
	b _080485F8
	.align 2, 0
_0804850C: .4byte 0x060102e0
_08048510: .4byte 0x06010a00
_08048514:
	add r5, sp, 0x18
	ldr r1, _0804855C @ =gUnknown_826052C
	adds r0, r5, 0
	movs r2, 0x14
	bl memcpy
	ldr r1, _08048560 @ =gSprites
	mov r0, r9
	lsls r4, r0, 4
	adds r0, r4, r0
	lsls r0, 2
	adds r7, r0, r1
	ldrh r0, [r7, 0x3A]
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804854C
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08048564
_0804854C:
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	mov r0, r9
	mov r2, r8
	bl sub_8048618
	b _080485F8
	.align 2, 0
_0804855C: .4byte gUnknown_826052C
_08048560: .4byte gSprites
_08048564:
	ldrh r0, [r7, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08048580
	movs r6, 0x59
	mov r0, r8
	cmp r0, 0
	bne _0804858A
	movs r6, 0x1D
	b _0804858A
_08048580:
	movs r6, 0x30
	mov r1, r8
	cmp r1, 0
	bne _0804858A
	movs r6, 0x14
_0804858A:
	mov r0, sp
	adds r0, 0x1E
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _08048608 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	movs r1, 0xBA
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	str r1, [sp, 0xC]
	adds r2, r5, 0
	movs r3, 0
	bl RenderTextFont9
	movs r5, 0
	ldr r1, _0804860C @ =gSprites
	mov r2, r9
	adds r0, r4, r2
	lsls r0, 2
	adds r4, r0, r1
_080485C6:
	ldr r0, _08048608 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	movs r1, 0xBA
	lsls r1, 1
	adds r0, r1
	lsls r1, r5, 6
	adds r1, 0x20
	ldr r0, [r0]
	adds r0, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r6
	adds r1, r5
	lsls r1, 5
	ldr r2, _08048610 @ =0x06010000
	adds r1, r2
	ldr r2, _08048614 @ =0x04000008
	bl CpuSet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080485C6
_080485F8:
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048608: .4byte gMonSpritesGfxPtr
_0804860C: .4byte gSprites
_08048610: .4byte 0x06010000
_08048614: .4byte 0x04000008
	thumb_func_end sub_8048440

	thumb_func_start sub_8048618
sub_8048618: @ 8048618
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r1, _080486F8 @ =gUnknown_8260542
	add r0, sp, 0x10
	movs r2, 0x14
	bl memcpy
	ldr r5, _080486FC @ =gSprites
	mov r1, r9
	lsls r0, r1, 4
	add r0, r9
	lsls r0, 2
	adds r2, r0, r5
	ldrh r0, [r2, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08048700 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	mov r3, r10
	lsls r0, r3, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0804866A
	b _080487DC
_0804866A:
	movs r6, 0x4
	mov r1, r8
	negs r0, r1
	orrs r0, r1
	asrs r0, 31
	ands r6, r0
	ldrh r0, [r2, 0x38]
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, sp
	adds r0, 0x16
	lsls r1, r4, 16
	asrs r1, 16
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r2, r8
	cmp r2, 0
	bne _08048698
	ldr r1, _08048704 @ =gUnknown_8260540
	bl StringCopy
_08048698:
	ldr r0, _08048708 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	movs r3, 0xBA
	lsls r3, 1
	adds r0, r3
	ldr r0, [r0]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	str r1, [sp, 0xC]
	add r2, sp, 0x10
	movs r3, 0
	bl RenderTextFont9
	adds r4, r6, 0
	adds r0, r4, 0x3
	cmp r4, r0
	bge _08048748
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r5, r0, r5
_080486C6:
	cmp r4, 0x2
	bhi _08048714
	ldr r0, _08048708 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	movs r1, 0xBA
	lsls r1, 1
	adds r0, r1
	subs r1, r4, r6
	lsls r1, 6
	adds r1, 0x20
	ldr r0, [r0]
	adds r0, r1
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r4, 0x1
	adds r1, r4
	lsls r1, 5
	ldr r2, _0804870C @ =0x06010000
	adds r1, r2
	ldr r2, _08048710 @ =0x04000008
	bl CpuSet
	b _0804873E
	.align 2, 0
_080486F8: .4byte gUnknown_8260542
_080486FC: .4byte gSprites
_08048700: .4byte gUnknown_2024018
_08048704: .4byte gUnknown_8260540
_08048708: .4byte gMonSpritesGfxPtr
_0804870C: .4byte 0x06010000
_08048710: .4byte 0x04000008
_08048714:
	ldr r0, _08048790 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	movs r3, 0xBA
	lsls r3, 1
	adds r0, r3
	subs r1, r4, r6
	lsls r1, 6
	adds r1, 0x20
	ldr r0, [r0]
	adds r0, r1
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r4, r1
	lsls r1, 5
	ldr r2, _08048794 @ =0x06010020
	adds r1, r2
	ldr r2, _08048798 @ =0x04000008
	bl CpuSet
	adds r4, 0x1
_0804873E:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	adds r0, r6, 0x3
	cmp r4, r0
	blt _080486C6
_08048748:
	mov r3, r8
	cmp r3, 0
	bne _080487A8
	ldr r0, _08048790 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	movs r1, 0xBA
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	adds r0, 0xE0
	ldr r1, _0804879C @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	adds r1, 0x80
	ldr r5, _080487A0 @ =0x06010000
	adds r1, r5
	ldr r2, _08048798 @ =0x04000008
	bl CpuSet
	mov r2, r8
	str r2, [sp, 0x24]
	add r0, sp, 0x24
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	adds r1, r5
	ldr r2, _080487A4 @ =0x05000008
	bl CpuSet
	b _080487DC
	.align 2, 0
_08048790: .4byte gMonSpritesGfxPtr
_08048794: .4byte 0x06010020
_08048798: .4byte 0x04000008
_0804879C: .4byte gSprites
_080487A0: .4byte 0x06010000
_080487A4: .4byte 0x05000008
_080487A8:
	mov r0, r10
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080487DC
	movs r0, 0x74
	bl GetHealthboxElementGfxPtr
	ldr r2, _080487EC @ =gSprites
	mov r3, r9
	lsls r1, r3, 4
	add r1, r9
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0xD0
	lsls r2, 3
	adds r1, r2
	ldr r2, _080487F0 @ =0x06010000
	adds r1, r2
	ldr r2, _080487F4 @ =0x04000008
	bl CpuSet
_080487DC:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080487EC: .4byte gSprites
_080487F0: .4byte 0x06010000
_080487F4: .4byte 0x04000008
	thumb_func_end sub_8048618

	thumb_func_start sub_80487F8
sub_80487F8: @ 80487F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	ldr r1, _080488AC @ =gUnknown_826052C
	add r0, sp, 0x10
	movs r2, 0x14
	bl memcpy
	ldr r1, _080488B0 @ =gSprites
	ldr r2, [sp, 0x24]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerPosition
	ldr r1, _080488B4 @ =gMonSpritesGfxPtr
	ldr r2, [r1]
	movs r3, 0xBA
	lsls r3, 1
	adds r2, r3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	movs r0, 0xA4
	lsls r0, 3
	adds r1, r0
	ldr r0, [r2]
	adds r6, r0, r1
	movs r1, 0x5
	mov r8, r1
	adds r0, r4, 0
	bl GetNature
	lsls r0, 24
	mov r4, sp
	adds r4, 0x16
	ldr r1, _080488B8 @ =gUnknown_8463E60
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0
	add r2, sp, 0x10
	movs r3, 0
	bl RenderTextFont9
	movs r7, 0x6
	movs r5, 0
	mov r2, sp
	adds r2, 0x19
	str r2, [sp, 0x28]
_08048888:
	mov r0, sp
	adds r0, r7
	adds r0, 0x10
	ldrb r1, [r0]
	adds r0, r1, 0
	subs r0, 0x37
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _080488A8
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080488BC
_080488A8:
	movs r0, 0x2C
	b _080488DA
	.align 2, 0
_080488AC: .4byte gUnknown_826052C
_080488B0: .4byte gSprites
_080488B4: .4byte gMonSpritesGfxPtr
_080488B8: .4byte gUnknown_8463E60
_080488BC:
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080488D4
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080488D8
_080488D4:
	movs r0, 0x2D
	b _080488DA
_080488D8:
	movs r0, 0x2B
_080488DA:
	bl GetHealthboxElementGfxPtr
	lsls r1, r5, 6
	adds r1, r6, r1
	ldr r2, _080489F8 @ =0x04000008
	bl CpuSet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, 0x1
	cmp r5, r8
	bcc _08048888
	movs r7, 0x1
	ldr r3, [sp, 0x24]
	lsls r3, 4
	str r3, [sp, 0x2C]
	movs r0, 0x1
	add r0, r8
	mov r9, r0
	cmp r7, r9
	bge _08048966
	ldr r1, _080489FC @ =gSprites
	ldr r2, _080489F8 @ =0x04000008
	mov r10, r2
	ldr r2, [sp, 0x24]
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	mov r8, r0
_08048916:
	mov r3, r8
	ldrh r0, [r3, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r5, r7, 0
	cmp r7, 0
	bge _08048926
	adds r5, r7, 0x7
_08048926:
	asrs r5, 3
	lsls r4, r5, 3
	subs r4, r7, r4
	adds r0, r4
	lsls r5, 6
	adds r0, r5
	lsls r0, 5
	ldr r2, _08048A00 @ =0x06010000
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	mov r3, r8
	ldrh r0, [r3, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r4, 0x8
	adds r0, r4
	adds r0, r5
	lsls r0, 5
	ldr r2, _08048A00 @ =0x06010000
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	adds r7, 0x1
	cmp r7, r9
	blt _08048916
_08048966:
	ldr r6, _080489FC @ =gSprites
	ldr r3, [sp, 0x2C]
	ldr r1, [sp, 0x24]
	adds r0, r3, r1
	lsls r0, 2
	adds r0, r6
	ldrh r4, [r0, 0x38]
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08048A04 @ =gBattleStruct
	ldr r0, [r5]
	adds r0, 0x7C
	ldrb r1, [r0]
	mov r0, sp
	adds r0, 0x16
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r5]
	adds r0, 0x7B
	ldrb r1, [r0]
	ldr r0, [sp, 0x28]
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	add r0, sp, 0x10
	movs r1, 0
	strb r1, [r0, 0x5]
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2, 0x8]
	ldr r5, _08048A08 @ =gMonSpritesGfxPtr
	ldr r0, [r5]
	movs r2, 0xBA
	lsls r2, 1
	adds r0, r2
	ldr r0, [r0]
	str r1, [sp]
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	str r1, [sp, 0xC]
	add r2, sp, 0x10
	movs r3, 0
	bl RenderTextFont9
	movs r7, 0
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r6, r0, r6
	movs r4, 0x20
_080489D0:
	cmp r7, 0x1
	bgt _08048A0C
	ldr r0, [r5]
	movs r3, 0xBA
	lsls r3, 1
	adds r0, r3
	ldr r0, [r0]
	adds r0, r4
	ldrh r1, [r6, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r7, 0x2
	adds r1, r2
	lsls r1, 5
	ldr r2, _08048A00 @ =0x06010000
	adds r1, r2
	ldr r2, _080489F8 @ =0x04000008
	bl CpuSet
	b _08048A2C
	.align 2, 0
_080489F8: .4byte 0x04000008
_080489FC: .4byte gSprites
_08048A00: .4byte 0x06010000
_08048A04: .4byte gBattleStruct
_08048A08: .4byte gMonSpritesGfxPtr
_08048A0C:
	ldr r0, [r5]
	movs r3, 0xBA
	lsls r3, 1
	adds r0, r3
	ldr r0, [r0]
	adds r0, r4
	ldrh r1, [r6, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r7, r1
	lsls r1, 5
	ldr r2, _08048A44 @ =0x060100c0
	adds r1, r2
	ldr r2, _08048A48 @ =0x04000008
	bl CpuSet
_08048A2C:
	adds r4, 0x40
	adds r7, 0x1
	cmp r7, 0x4
	ble _080489D0
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048A44: .4byte 0x060100c0
_08048A48: .4byte 0x04000008
	thumb_func_end sub_80487F8

	thumb_func_start sub_8048A4C
sub_8048A4C: @ 8048A4C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	mov r9, r0
	ldr r0, _08048B78 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r9, r0
	blt _08048A66
	b _08048CF2
_08048A66:
	ldr r1, _08048B7C @ =gSprites
	mov r10, r1
	ldr r2, _08048B80 @ =gBattlerPartyIndexes
	mov r8, r2
_08048A6E:
	ldr r0, _08048B84 @ =gUnknown_3004FF0
	mov r1, r9
	adds r6, r1, r0
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r10
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _08048B88 @ =SpriteCallbackDummy
	cmp r1, r0
	beq _08048A8C
	b _08048CE0
_08048A8C:
	mov r2, r9
	lsls r0, r2, 24
	lsrs r7, r0, 24
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08048AA2
	b _08048CE0
_08048AA2:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _08048ABA
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08048ABA
	b _08048CE0
_08048ABA:
	ldr r5, _08048B8C @ =gUnknown_2024018
	ldr r0, [r5]
	ldr r3, [r0]
	mov r0, r9
	lsls r4, r0, 2
	adds r3, r4, r3
	ldr r0, [r3]
	lsls r0, 27
	lsrs r0, 31
	movs r2, 0x1
	eors r2, r0
	lsls r2, 4
	mov r12, r2
	ldrb r0, [r3]
	movs r2, 0x11
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	mov r1, r12
	orrs r0, r1
	strb r0, [r3]
	ldr r0, [r5]
	ldr r0, [r0]
	adds r4, r0
	ldr r0, [r4]
	lsls r0, 27
	lsrs r4, r0, 31
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08048BE8
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _08048B08
	b _08048CE0
_08048B08:
	ldr r0, _08048B90 @ =gBattleTypeFlags
	ldr r2, [r0]
	movs r0, 0x80
	ands r2, r0
	cmp r2, 0
	beq _08048B16
	b _08048CE0
_08048B16:
	cmp r4, 0x1
	bne _08048BA0
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r1, r0, 24
	str r2, [sp]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _08048B94 @ =0x06010000
	adds r1, r2
	mov r0, sp
	ldr r2, _08048B98 @ =0x05000040
	bl CpuSet
	ldrb r4, [r6]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, 0x64
	muls r0, r2
	ldr r1, _08048B9C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8048618
	ldrb r4, [r6]
	mov r2, r8
	ldrh r0, [r2]
	movs r1, 0x64
	muls r0, r1
	ldr r2, _08048B9C @ =gPlayerParty
	b _08048C6E
	.align 2, 0
_08048B78: .4byte gBattlersCount
_08048B7C: .4byte gSprites
_08048B80: .4byte gBattlerPartyIndexes
_08048B84: .4byte gUnknown_3004FF0
_08048B88: .4byte SpriteCallbackDummy
_08048B8C: .4byte gUnknown_2024018
_08048B90: .4byte gBattleTypeFlags
_08048B94: .4byte 0x06010000
_08048B98: .4byte 0x05000040
_08048B9C: .4byte gPlayerParty
_08048BA0:
	ldrb r0, [r6]
	bl UpdateStatusIconInHealthbox
	ldrb r0, [r6]
	mov r2, r8
	ldrh r1, [r2]
	movs r2, 0x64
	muls r1, r2
	ldr r2, _08048BDC @ =gPlayerParty
	adds r1, r2
	movs r2, 0x5
	bl UpdateHealthboxAttribute
	movs r0, 0x75
	bl GetHealthboxElementGfxPtr
	ldrb r2, [r6]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r10
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _08048BE0 @ =0x06010680
	adds r1, r2
	ldr r2, _08048BE4 @ =0x04000008
	bl CpuSet
	b _08048CCA
	.align 2, 0
_08048BDC: .4byte gPlayerParty
_08048BE0: .4byte 0x06010680
_08048BE4: .4byte 0x04000008
_08048BE8:
	cmp r4, 0x1
	bne _08048C94
	ldr r0, _08048C0C @ =gBattleTypeFlags
	ldr r2, [r0]
	movs r0, 0x80
	ands r2, r0
	cmp r2, 0
	beq _08048C14
	ldrb r0, [r6]
	mov r2, r8
	ldrh r1, [r2]
	movs r2, 0x64
	muls r1, r2
	ldr r2, _08048C10 @ =gEnemyParty
	adds r1, r2
	bl sub_80487F8
	b _08048CCA
	.align 2, 0
_08048C0C: .4byte gBattleTypeFlags
_08048C10: .4byte gEnemyParty
_08048C14:
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r1, r0, 24
	str r2, [sp]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r0, _08048C88 @ =0x06010000
	adds r1, r0
	mov r0, sp
	ldr r2, _08048C8C @ =0x05000040
	bl CpuSet
	ldrb r4, [r6]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, 0x64
	muls r0, r2
	ldr r1, _08048C90 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8048618
	ldrb r4, [r6]
	mov r2, r8
	ldrh r0, [r2]
	movs r1, 0x64
	muls r0, r1
	ldr r2, _08048C90 @ =gEnemyParty
_08048C6E:
	adds r0, r2
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8048618
	b _08048CCA
	.align 2, 0
_08048C88: .4byte 0x06010000
_08048C8C: .4byte 0x05000040
_08048C90: .4byte gEnemyParty
_08048C94:
	ldrb r0, [r6]
	bl UpdateStatusIconInHealthbox
	ldrb r0, [r6]
	mov r2, r8
	ldrh r1, [r2]
	movs r5, 0x64
	muls r1, r5
	ldr r4, _08048D04 @ =gEnemyParty
	adds r1, r4
	movs r2, 0x5
	bl UpdateHealthboxAttribute
	ldr r0, _08048D08 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08048CCA
	ldrb r0, [r6]
	mov r2, r8
	ldrh r1, [r2]
	muls r1, r5
	adds r1, r4
	movs r2, 0x4
	bl UpdateHealthboxAttribute
_08048CCA:
	ldr r0, _08048D0C @ =gUnknown_3004FF0
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrh r1, [r0, 0x3C]
	movs r2, 0x1
	eors r1, r2
	strh r1, [r0, 0x3C]
_08048CE0:
	movs r0, 0x2
	add r8, r0
	movs r1, 0x1
	add r9, r1
	ldr r0, _08048D10 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r9, r0
	bge _08048CF2
	b _08048A6E
_08048CF2:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048D04: .4byte gEnemyParty
_08048D08: .4byte gBattleTypeFlags
_08048D0C: .4byte gUnknown_3004FF0
_08048D10: .4byte gBattlersCount
	thumb_func_end sub_8048A4C

	thumb_func_start sub_8048D14
sub_8048D14: @ 8048D14
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	str r1, [sp, 0xC]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	cmp r4, 0
	beq _08048D44
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08048D88
_08048D44:
	ldr r0, [sp, 0x8]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08048D64
	movs r7, 0
	movs r1, 0x88
	movs r2, 0x60
	movs r0, 0x64
	mov r8, r0
	ldr r5, _08048D60 @ =0x0000fffb
	b _08048D94
	.align 2, 0
_08048D60: .4byte 0x0000fffb
_08048D64:
	movs r7, 0x1
	cmp r4, 0
	beq _08048D74
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _08048D7A
_08048D74:
	movs r1, 0x68
	movs r2, 0x28
	b _08048D7E
_08048D7A:
	movs r1, 0x68
	movs r2, 0x10
_08048D7E:
	ldr r3, _08048D84 @ =0x0000ff9c
	mov r8, r3
	b _08048D92
	.align 2, 0
_08048D84: .4byte 0x0000ff9c
_08048D88:
	movs r7, 0x1
	movs r1, 0x68
	movs r2, 0x28
	ldr r5, _08048E40 @ =0x0000ff9c
	mov r8, r5
_08048D92:
	movs r5, 0x5
_08048D94:
	movs r6, 0
	str r6, [sp, 0x14]
	lsls r4, r7, 3
	ldr r0, _08048E44 @ =gUnknown_826046C
	mov r10, r0
	lsls r3, r7, 1
	mov r9, r3
	lsls r1, 16
	str r1, [sp, 0x20]
	lsls r2, 16
	str r2, [sp, 0x24]
	ldr r2, _08048E48 @ =0x0000ffff
	ldr r1, [sp, 0xC]
	movs r6, 0x5
_08048DB0:
	ldrh r0, [r1]
	cmp r0, r2
	beq _08048DC4
	ldr r3, [sp, 0x14]
	lsls r0, r3, 24
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r0, 24
	str r0, [sp, 0x14]
_08048DC4:
	adds r1, 0x8
	subs r6, 0x1
	cmp r6, 0
	bge _08048DB0
	mov r6, r10
	adds r0, r4, r6
	bl sub_800F034
	ldr r0, _08048E4C @ =gUnknown_826049C
	adds r0, r4, r0
	bl LoadSpriteSheet
	ldr r0, _08048E50 @ =gUnknown_826047C
	adds r0, r4, r0
	bl LoadSpritePalette
	ldr r0, _08048E54 @ =gUnknown_826048C
	adds r0, r4, r0
	bl LoadSpritePalette
	mov r1, r9
	adds r0, r1, r7
	lsls r0, 3
	ldr r1, _08048E58 @ =gUnknown_82604BC
	adds r0, r1
	ldr r2, [sp, 0x20]
	asrs r1, r2, 16
	ldr r3, [sp, 0x24]
	asrs r2, r3, 16
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	lsls r0, 4
	ldr r6, [sp, 0x18]
	adds r0, r6
	lsls r0, 2
	ldr r1, _08048E5C @ =gSprites
	adds r4, r0, r1
	ldr r1, _08048E60 @ =gUnknown_82603FC
	adds r0, r4, 0
	bl SetSubspriteTables
	mov r0, r8
	strh r0, [r4, 0x24]
	strh r5, [r4, 0x2E]
	cmp r7, 0
	beq _08048E64
	ldrh r0, [r4, 0x20]
	subs r0, 0x60
	strh r0, [r4, 0x20]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x3]
	b _08048E6A
	.align 2, 0
_08048E40: .4byte 0x0000ff9c
_08048E44: .4byte gUnknown_826046C
_08048E48: .4byte 0x0000ffff
_08048E4C: .4byte gUnknown_826049C
_08048E50: .4byte gUnknown_826047C
_08048E54: .4byte gUnknown_826048C
_08048E58: .4byte gUnknown_82604BC
_08048E5C: .4byte gSprites
_08048E60: .4byte gUnknown_82603FC
_08048E64:
	ldrh r0, [r4, 0x20]
	adds r0, 0x60
	strh r0, [r4, 0x20]
_08048E6A:
	movs r6, 0
	ldr r1, _08048F14 @ =gSprites
	mov r10, r1
	mov r4, sp
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	str r0, [sp, 0x1C]
	movs r3, 0xA
	mov r9, r3
	mov r8, r6
_08048E80:
	ldr r0, _08048F18 @ =gUnknown_82604EC
	ldr r5, [sp, 0x24]
	ldr r1, _08048F1C @ =0xfffc0000
	adds r2, r5, r1
	ldr r3, [sp, 0x1C]
	adds r0, r3, r0
	ldr r5, [sp, 0x20]
	asrs r1, r5, 16
	asrs r2, 16
	movs r3, 0x9
	bl CreateSpriteAtEnd
	strb r0, [r4]
	ldr r0, [sp, 0x10]
	cmp r0, 0
	bne _08048EB0
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _08048F20 @ =gSprites + 0x1C
	adds r1, r2
	ldr r0, _08048F24 @ =SpriteCB_StatusSummaryBallsOnSwitchout
	str r0, [r1]
_08048EB0:
	ldr r5, _08048F14 @ =gSprites
	cmp r7, 0
	bne _08048ECE
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	strh r7, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	strh r7, [r0, 0x26]
_08048ECE:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	mov r3, sp
	ldrh r3, [r3, 0x18]
	strh r3, [r0, 0x2E]
	cmp r7, 0
	bne _08048F28
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1, 0x20]
	adds r0, 0x18
	add r0, r8
	strh r0, [r1, 0x20]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r9
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x78
	b _08048F66
	.align 2, 0
_08048F14: .4byte gSprites
_08048F18: .4byte gUnknown_82604EC
_08048F1C: .4byte 0xfffc0000
_08048F20: .4byte gSprites + 0x1C
_08048F24: .4byte SpriteCB_StatusSummaryBallsOnSwitchout
_08048F28:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x20]
	subs r3, 0x18
	movs r1, 0x5
	subs r1, r6
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	subs r3, r0
	strh r3, [r2, 0x20]
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	movs r1, 0x6
	subs r1, r6
	lsls r0, r1, 3
	subs r0, r1
	adds r0, 0xA
	strh r0, [r2, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08048FD4 @ =0x0000ff88
_08048F66:
	strh r1, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x32]
	adds r4, 0x1
	movs r2, 0x7
	add r9, r2
	movs r3, 0xA
	add r8, r3
	adds r6, 0x1
	cmp r6, 0x5
	bgt _08048F86
	b _08048E80
_08048F86:
	ldr r0, [sp, 0x8]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0804906E
	movs r6, 0
	ldr r5, _08048FD8 @ =gBattleTypeFlags
	mov r10, r5
	ldr r0, _08048FDC @ =0x0000ffff
	mov r9, r0
	ldr r7, _08048FE0 @ =gSprites
	ldr r1, _08048FE4 @ =0x000003ff
	mov r12, r1
	ldr r2, _08048FE8 @ =0xfffffc00
	mov r8, r2
	mov r4, sp
	ldr r5, [sp, 0xC]
_08048FAA:
	mov r3, r10
	ldr r0, [r3]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08048FEC
	ldrh r0, [r5]
	cmp r0, r9
	beq _08048FF6
	cmp r0, 0
	bne _0804903E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08049056
	.align 2, 0
_08048FD4: .4byte 0x0000ff88
_08048FD8: .4byte gBattleTypeFlags
_08048FDC: .4byte 0x0000ffff
_08048FE0: .4byte gSprites
_08048FE4: .4byte 0x000003ff
_08048FE8: .4byte 0xfffffc00
_08048FEC:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	asrs r0, 24
	cmp r6, r0
	blt _08049024
_08048FF6:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x1
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	b _08049062
_08049024:
	ldrh r0, [r5]
	cmp r0, 0
	bne _0804903E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08049056
_0804903E:
	ldr r0, [r5, 0x4]
	cmp r0, 0
	beq _08049062
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x2
_08049056:
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08049062:
	adds r4, 0x1
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _08048FAA
	b _08049148
_0804906E:
	movs r6, 0
	ldr r1, _080490B4 @ =gBattleTypeFlags
	mov r10, r1
	ldr r2, _080490B8 @ =0x0000ffff
	mov r9, r2
	ldr r7, _080490BC @ =gSprites
	ldr r3, _080490C0 @ =0x000003ff
	mov r12, r3
	ldr r5, _080490C4 @ =0xfffffc00
	mov r8, r5
	ldr r5, [sp, 0xC]
	mov r4, sp
	adds r4, 0x5
_08049088:
	mov r1, r10
	ldr r0, [r1]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080490C8
	ldrh r0, [r5]
	cmp r0, r9
	beq _080490D2
	cmp r0, 0
	bne _0804911A
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08049132
	.align 2, 0
_080490B4: .4byte gBattleTypeFlags
_080490B8: .4byte 0x0000ffff
_080490BC: .4byte gSprites
_080490C0: .4byte 0x000003ff
_080490C4: .4byte 0xfffffc00
_080490C8:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	asrs r0, 24
	cmp r6, r0
	blt _08049100
_080490D2:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x1
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	b _0804913E
_08049100:
	ldrh r0, [r5]
	cmp r0, 0
	bne _0804911A
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08049132
_0804911A:
	ldr r0, [r5, 0x4]
	cmp r0, 0
	beq _0804913E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x2
_08049132:
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_0804913E:
	subs r4, 0x1
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _08049088
_08049148:
	ldr r0, _080491A8 @ =TaskDummy
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080491AC @ =gTasks
	lsls r3, r4, 2
	adds r1, r3, r4
	lsls r1, 3
	adds r0, r1, r2
	mov r5, sp
	ldrh r5, [r5, 0x8]
	strh r5, [r0, 0x8]
	mov r6, sp
	ldrh r6, [r6, 0x18]
	strh r6, [r0, 0xA]
	movs r6, 0
	adds r0, r2, 0
	adds r0, 0xE
	adds r1, r0
_08049172:
	mov r5, sp
	adds r0, r5, r6
	ldrb r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x5
	ble _08049172
	adds r0, r3, r4
	lsls r0, 3
	adds r0, r2
	ldrh r6, [r5, 0x10]
	strh r6, [r0, 0x1C]
	movs r0, 0x6B
	movs r1, 0
	bl PlaySE12WithPanning
	adds r0, r4, 0
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080491A8: .4byte TaskDummy
_080491AC: .4byte gTasks
	thumb_func_end sub_8048D14

	thumb_func_start sub_80491B0
sub_80491B0: @ 80491B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _080492C0 @ =gTasks
	lsls r3, r0, 2
	adds r1, r3, r0
	lsls r1, 3
	adds r0, r1, r2
	ldrb r7, [r0, 0x1C]
	ldrb r4, [r0, 0xA]
	mov r10, r4
	ldrb r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r5, 0
	str r3, [sp, 0xC]
	adds r2, 0xE
	adds r2, r1, r2
_080491DE:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _080491DE
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	ldr r1, _080492C0 @ =gTasks
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x10
	strh r1, [r0, 0x26]
	movs r5, 0
	mov r1, r10
	lsls r1, 4
	str r1, [sp, 0x10]
	ldr r3, _080492C4 @ =gSprites
	movs r6, 0xD
	negs r6, r6
	mov r12, r3
	movs r4, 0x4
_08049220:
	mov r2, sp
	adds r0, r2, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0x1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x1]
	adds r5, 0x1
	cmp r5, 0x5
	ble _08049220
	ldr r2, [sp, 0x10]
	add r2, r10
	lsls r2, 2
	add r2, r12
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x1]
	cmp r7, 0
	bne _0804925A
	b _08049360
_0804925A:
	movs r5, 0
	mov r6, r12
	mov r9, r5
	adds r3, r6, 0
	adds r3, 0x1C
	mov r4, sp
	movs r7, 0
_08049268:
	ldr r0, [sp, 0x8]
	str r3, [sp, 0x14]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, [sp, 0x14]
	cmp r2, 0
	beq _080492CC
	movs r0, 0x5
	subs r0, r5
	mov r1, sp
	adds r2, r1, r0
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x36]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080492C8 @ =sub_8049630
	str r1, [r0]
	ldr r2, _080492C4 @ =gSprites
	mov r12, r2
	b _08049302
	.align 2, 0
_080492C0: .4byte gTasks
_080492C4: .4byte gSprites
_080492C8: .4byte sub_8049630
_080492CC:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x34]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _08049348 @ =sub_8049630
	str r1, [r0]
	ldr r0, _0804934C @ =gSprites
	mov r12, r0
_08049302:
	adds r4, 0x1
	adds r7, 0x7
	adds r5, 0x1
	cmp r5, 0x5
	ble _08049268
	ldr r3, [sp, 0x10]
	add r3, r10
	lsls r3, 2
	mov r1, r12
	adds r0, r3, r1
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	mov r1, r12
	adds r1, 0x1C
	adds r3, r1
	ldr r1, _08049350 @ =sub_8049568
	str r1, [r3]
	ldr r1, _08049354 @ =gUnknown_8260404
	bl SetSubspriteTables
	ldr r1, _08049358 @ =gTasks
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0804935C @ =sub_8049388
	str r1, [r0]
	b _0804936E
	.align 2, 0
_08049348: .4byte sub_8049630
_0804934C: .4byte gSprites
_08049350: .4byte sub_8049568
_08049354: .4byte gUnknown_8260404
_08049358: .4byte gTasks
_0804935C: .4byte sub_8049388
_08049360:
	ldr r0, _08049380 @ =gTasks
	ldr r1, [sp, 0xC]
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldr r0, _08049384 @ =sub_804948C
	str r0, [r1]
_0804936E:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049380: .4byte gTasks
_08049384: .4byte sub_804948C
	thumb_func_end sub_80491B0

	thumb_func_start sub_8049388
sub_8049388: @ 8049388
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080493DC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080493C8
	ldrh r0, [r4, 0x26]
	subs r1, r0, 0x1
	strh r1, [r4, 0x26]
	lsls r0, r1, 16
	cmp r0, 0
	blt _080493D4
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
_080493C8:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080493D4
	ldr r0, _080493E0 @ =sub_80493E4
	str r0, [r4]
_080493D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080493DC: .4byte gTasks
_080493E0: .4byte sub_80493E4
	thumb_func_end sub_8049388

	thumb_func_start sub_80493E4
sub_80493E4: @ 80493E4
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r7, _0804945C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	adds r1, r6, r7
	ldrh r0, [r1, 0x26]
	subs r0, 0x1
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r2, r0, 16
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08049464
	ldrb r3, [r1, 0xA]
	movs r5, 0
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r6, r0
_08049412:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08049412
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08049460 @ =gSprites
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_08049442:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _08049442
	b _08049482
	.align 2, 0
_0804945C: .4byte gTasks
_08049460: .4byte gSprites
_08049464:
	movs r0, 0x3
	negs r0, r0
	cmp r2, r0
	bne _08049482
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyTask
_08049482:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80493E4

	thumb_func_start sub_804948C
sub_804948C: @ 804948C
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r7, _080494C4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	adds r3, r6, r7
	ldrh r0, [r3, 0x26]
	subs r1, r0, 0x1
	strh r1, [r3, 0x26]
	lsls r0, r1, 16
	asrs r2, r0, 16
	cmp r2, 0
	blt _080494C8
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	b _08049546
	.align 2, 0
_080494C4: .4byte gTasks
_080494C8:
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08049528
	ldrb r3, [r3, 0xA]
	movs r5, 0
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r6, r0
_080494DA:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _080494DA
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08049524 @ =gSprites
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_0804950A:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804950A
	b _08049546
	.align 2, 0
_08049524: .4byte gSprites
_08049528:
	movs r0, 0x3
	negs r0, r0
	cmp r2, r0
	bne _08049546
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyTask
_08049546:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804948C

	thumb_func_start SpriteCB_StatusSummaryBar
SpriteCB_StatusSummaryBar: @ 8049550
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x24]
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08049564
	ldrh r0, [r1, 0x2E]
	adds r0, r2, r0
	strh r0, [r1, 0x24]
_08049564:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_StatusSummaryBar

	thumb_func_start sub_8049568
sub_8049568: @ 8049568
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	adds r1, 0x20
	strh r1, [r2, 0x30]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _08049586
	lsls r0, r1, 16
	asrs r0, 20
	ldrh r1, [r2, 0x24]
	adds r0, r1
	b _0804958E
_08049586:
	lsls r1, 16
	asrs r1, 20
	ldrh r0, [r2, 0x24]
	subs r0, r1
_0804958E:
	strh r0, [r2, 0x24]
	ldrh r1, [r2, 0x30]
	movs r0, 0xF
	ands r0, r1
	strh r0, [r2, 0x30]
	pop {r0}
	bx r0
	thumb_func_end sub_8049568

	thumb_func_start SpriteCB_StatusSummaryBallsOnBattleStart
SpriteCB_StatusSummaryBallsOnBattleStart: @ 804959C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080495B0
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _08049626
_080495B0:
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r3, r0, 24
	ldrh r2, [r4, 0x34]
	adds r0, r2, 0
	adds r0, 0x38
	lsls r1, r0, 16
	lsrs r2, r1, 16
	ldr r0, _080495E0 @ =0x0000fff0
	ands r2, r0
	strh r2, [r4, 0x34]
	cmp r3, 0
	beq _080495E4
	lsrs r0, r1, 20
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080495F4
	movs r0, 0
	strh r0, [r4, 0x24]
	b _080495F4
	.align 2, 0
_080495E0: .4byte 0x0000fff0
_080495E4:
	lsrs r1, 20
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bge _080495F4
	strh r3, [r4, 0x24]
_080495F4:
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08049626
	movs r1, 0x3F
	cmp r3, 0
	beq _08049604
	movs r1, 0xC0
_08049604:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08049618
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x6D
	bl PlaySE2WithPanning
	b _08049622
_08049618:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x6C
	bl PlaySE1WithPanning
_08049622:
	ldr r0, _0804962C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_08049626:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804962C: .4byte SpriteCallbackDummy
	thumb_func_end SpriteCB_StatusSummaryBallsOnBattleStart

	thumb_func_start sub_8049630
sub_8049630: @ 8049630
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _08049644
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _08049694
_08049644:
	ldrh r0, [r3, 0x32]
	lsls r0, 24
	ldrh r2, [r3, 0x34]
	adds r1, r2, 0
	adds r1, 0x38
	lsls r4, r1, 16
	lsrs r2, r4, 16
	ldr r1, _08049664 @ =0x0000fff0
	ands r2, r1
	strh r2, [r3, 0x34]
	cmp r0, 0
	beq _08049668
	lsrs r0, r4, 20
	ldrh r1, [r3, 0x24]
	adds r0, r1
	b _0804966E
	.align 2, 0
_08049664: .4byte 0x0000fff0
_08049668:
	lsrs r1, r4, 20
	ldrh r0, [r3, 0x24]
	subs r0, r1
_0804966E:
	strh r0, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x80
	lsls r1, 1
	cmp r0, r1
	bls _08049694
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0804969C @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
_08049694:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804969C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8049630

	thumb_func_start SpriteCB_StatusSummaryBallsOnSwitchout
SpriteCB_StatusSummaryBallsOnSwitchout: @ 80496A0
	ldrh r2, [r0, 0x2E]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080496BC @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	strh r2, [r0, 0x24]
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_080496BC: .4byte gSprites
	thumb_func_end SpriteCB_StatusSummaryBallsOnSwitchout

	thumb_func_start sub_80496C0
sub_80496C0: @ 80496C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08049760 @ =gDisplayedStringBattle
	ldr r1, _08049764 @ =gUnknown_8260556
	bl StringCopy
	adds r5, r0, 0
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	adds r0, r5, 0
	mov r1, sp
	bl StringCopy
	adds r5, r0, 0
	movs r0, 0xFC
	strb r0, [r5]
	adds r5, 0x1
	movs r0, 0x1
	strb r0, [r5]
	adds r5, 0x1
	adds r0, r7, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x1D
	beq _08049720
	cmp r0, 0x20
	bne _08049734
_08049720:
	movs r0, 0xB
	muls r1, r0
	ldr r0, _08049768 @ =gSpeciesNames
	adds r1, r0
	mov r0, sp
	bl StringCompare
	cmp r0, 0
	bne _08049734
	movs r6, 0x64
_08049734:
	ldr r1, _0804976C @ =gSprites
	mov r0, r8
	lsls r4, r0, 4
	adds r0, r4, r0
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl sub_80448F8
	lsls r0, 24
	cmp r0, 0
	beq _08049754
	movs r6, 0x64
_08049754:
	cmp r6, 0
	beq _08049770
	cmp r6, 0xFE
	beq _0804977A
	movs r0, 0xB
	b _08049782
	.align 2, 0
_08049760: .4byte gDisplayedStringBattle
_08049764: .4byte gUnknown_8260556
_08049768: .4byte gSpeciesNames
_0804976C: .4byte gSprites
_08049770:
	movs r0, 0xB
	strb r0, [r5]
	adds r5, 0x1
	movs r0, 0xB5
	b _08049782
_0804977A:
	movs r0, 0xA
	strb r0, [r5]
	adds r5, 0x1
	movs r0, 0xB6
_08049782:
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	ldr r0, _080497E4 @ =gDisplayedStringBattle
	add r3, sp, 0xC
	movs r1, 0
	movs r2, 0x3
	bl AddTextPrinterAndCreateWindowOnHealthbox
	adds r6, r0, 0
	ldr r0, _080497E8 @ =gSprites
	mov r2, r8
	adds r1, r4, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r4, r0, 17
	ldrh r0, [r1, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080497F8
	ldr r1, _080497EC @ =0x06010040
	adds r0, r4, r1
	adds r1, r6, 0
	movs r2, 0x6
	bl sub_804A6E8
	bl sub_8075290
	lsls r0, 24
	ldr r2, _080497F0 @ =0x06010400
	adds r5, r4, r2
	cmp r0, 0
	bne _080497D4
	ldr r0, _080497F4 @ =0x06010800
	adds r5, r4, r0
_080497D4:
	adds r1, r6, 0
	adds r1, 0xC0
	adds r0, r5, 0
	movs r2, 0x1
	bl sub_804A6E8
	b _08049804
	.align 2, 0
_080497E4: .4byte gDisplayedStringBattle
_080497E8: .4byte gSprites
_080497EC: .4byte 0x06010040
_080497F0: .4byte 0x06010400
_080497F4: .4byte 0x06010800
_080497F8:
	ldr r1, _08049818 @ =0x06010020
	adds r0, r4, r1
	adds r1, r6, 0
	movs r2, 0x7
	bl sub_804A6E8
_08049804:
	ldr r0, [sp, 0xC]
	bl sub_804A6D8
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049818: .4byte 0x06010020
	thumb_func_end sub_80496C0

	thumb_func_start sub_804981C
sub_804981C: @ 804981C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	ldr r0, _080498DC @ =gBattleTypeFlags
	ldr r1, [r0]
	ldr r0, _080498E0 @ =0x00010210
	ands r0, r1
	cmp r0, 0
	bne _0804991C
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	bne _0804991C
	ldr r0, _080498E4 @ =gSprites
	mov r9, r0
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	add r0, r9
	mov r8, r0
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _0804991C
	ldr r1, _080498E8 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r5, r0, r1
	ldrh r0, [r5]
	movs r7, 0x64
	muls r0, r7
	ldr r6, _080498EC @ =gEnemyParty
	adds r0, r6
	adds r1, r4, 0
	bl sub_80448F8
	lsls r0, 24
	cmp r0, 0
	bne _0804991C
	ldrh r0, [r5]
	muls r0, r7
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8088E74
	lsls r0, 24
	cmp r0, 0
	beq _0804991C
	mov r1, r8
	ldrh r0, [r1, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	mov r2, r10
	cmp r2, 0
	beq _080498F8
	movs r0, 0x46
	bl GetHealthboxElementGfxPtr
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r9
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
	ldr r2, _080498F0 @ =0x06010000
	adds r1, r2
	ldr r2, _080498F4 @ =0x04000008
	bl CpuSet
	b _0804991C
	.align 2, 0
_080498DC: .4byte gBattleTypeFlags
_080498E0: .4byte 0x00010210
_080498E4: .4byte gSprites
_080498E8: .4byte gBattlerPartyIndexes
_080498EC: .4byte gEnemyParty
_080498F0: .4byte 0x06010000
_080498F4: .4byte 0x04000008
_080498F8:
	mov r0, r10
	str r0, [sp]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
	ldr r0, _0804992C @ =0x06010000
	adds r1, r0
	ldr r2, _08049930 @ =0x05000008
	mov r0, sp
	bl CpuSet
_0804991C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804992C: .4byte 0x06010000
_08049930: .4byte 0x05000008
	thumb_func_end sub_804981C

	thumb_func_start UpdateStatusIconInHealthbox
UpdateStatusIconInHealthbox: @ 8049934
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _08049998 @ =gSprites
	mov r2, r9
	lsls r1, r2, 4
	add r1, r9
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r1, 0x38]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080499A4
	ldr r1, _0804999C @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080499A0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	bl sub_8075290
	lsls r0, 24
	movs r3, 0x12
	mov r8, r3
	cmp r0, 0
	bne _080499C0
	movs r0, 0x1A
	mov r8, r0
	b _080499C0
	.align 2, 0
_08049998: .4byte gSprites
_0804999C: .4byte gBattlerPartyIndexes
_080499A0: .4byte gPlayerParty
_080499A4:
	ldr r1, _080499E0 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080499E4 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	movs r1, 0x11
	mov r8, r1
_080499C0:
	movs r0, 0x7
	ands r0, r4
	cmp r0, 0
	beq _080499E8
	movs r0, 0x1B
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0x2
	b _08049AF4
	.align 2, 0
_080499E0: .4byte gBattlerPartyIndexes
_080499E4: .4byte gEnemyParty
_080499E8:
	movs r0, 0x88
	ands r0, r4
	cmp r0, 0
	beq _08049A06
	movs r0, 0x15
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0
	b _08049AF4
_08049A06:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _08049A24
	movs r0, 0x21
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0x4
	b _08049AF4
_08049A24:
	movs r0, 0x20
	ands r0, r4
	cmp r0, 0
	beq _08049A42
	movs r0, 0x1E
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0x3
	b _08049AF4
_08049A42:
	movs r0, 0x40
	ands r0, r4
	cmp r0, 0
	beq _08049A60
	movs r0, 0x18
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0x1
	b _08049AF4
_08049A60:
	movs r0, 0x27
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r4, 0
	mov r2, r9
	lsls r0, r2, 4
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	lsls r7, 2
	ldr r1, _08049AE0 @ =gSprites
	add r0, r9
	lsls r0, 2
	adds r5, r0, r1
_08049A7E:
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	mov r2, r8
	asrs r0, r2, 16
	adds r1, r0
	adds r1, r4
	lsls r1, 5
	ldr r3, _08049AE4 @ =0x06010000
	adds r1, r3
	adds r0, r6, 0
	ldr r2, _08049AE8 @ =0x04000008
	bl CpuSet
	adds r4, 0x1
	cmp r4, 0x2
	ble _08049A7E
	ldr r0, _08049AEC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08049AD4
	movs r0, 0x1
	bl GetHealthboxElementGfxPtr
	ldr r2, _08049AE0 @ =gSprites
	mov r3, r10
	lsls r1, r3, 4
	add r1, r10
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _08049AE4 @ =0x06010000
	adds r1, r2
	ldr r2, _08049AF0 @ =0x04000010
	bl CpuSet
_08049AD4:
	mov r0, r9
	movs r1, 0x1
	bl sub_804981C
	b _08049BB6
	.align 2, 0
_08049AE0: .4byte gSprites
_08049AE4: .4byte 0x06010000
_08049AE8: .4byte 0x04000008
_08049AEC: .4byte gUnknown_2024018
_08049AF0: .4byte 0x04000010
_08049AF4:
	mov r1, r9
	lsls r5, r1, 4
	add r5, r9
	lsls r5, 2
	ldr r2, _08049BC4 @ =gSprites
	adds r5, r2
	ldrb r4, [r5, 0x5]
	lsrs r4, 4
	lsls r4, 4
	adds r4, 0xC
	adds r4, r7
	ldr r1, _08049BC8 @ =gUnknown_826055A
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	movs r3, 0x80
	lsls r3, 1
	adds r1, r4, r3
	movs r2, 0x2
	bl FillPalette
	lsls r4, 1
	ldr r0, _08049BCC @ =gUnknown_20373F8
	adds r0, r4, r0
	ldr r1, _08049BD0 @ =0x05000200
	adds r4, r1
	adds r1, r4, 0
	movs r2, 0x1
	bl CpuSet
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	add r1, r8
	lsls r1, 5
	ldr r2, _08049BD4 @ =0x06010000
	mov r8, r2
	add r1, r8
	ldr r2, _08049BD8 @ =0x04000018
	adds r0, r6, 0
	bl CpuSet
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08049B62
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08049BAE
_08049B62:
	ldr r0, _08049BDC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r7, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08049BAE
	movs r0, 0
	bl GetHealthboxElementGfxPtr
	mov r3, r10
	lsls r4, r3, 4
	add r4, r10
	lsls r4, 2
	ldr r1, _08049BC4 @ =gSprites
	adds r4, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	add r1, r8
	ldr r5, _08049BE0 @ =0x04000008
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x41
	bl GetHealthboxElementGfxPtr
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	adds r1, 0x20
	add r1, r8
	adds r2, r5, 0
	bl CpuSet
_08049BAE:
	mov r0, r9
	movs r1, 0
	bl sub_804981C
_08049BB6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049BC4: .4byte gSprites
_08049BC8: .4byte gUnknown_826055A
_08049BCC: .4byte gUnknown_20373F8
_08049BD0: .4byte 0x05000200
_08049BD4: .4byte 0x06010000
_08049BD8: .4byte 0x04000018
_08049BDC: .4byte gUnknown_2024018
_08049BE0: .4byte 0x04000008
	thumb_func_end UpdateStatusIconInHealthbox

	thumb_func_start GetStatusIconForBankId
GetStatusIconForBankId: @ 8049BE4
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsrs r2, r0, 24
	adds r0, r2, 0
	subs r0, 0x15
	cmp r0, 0xC
	bhi _08049CA4
	lsls r0, 2
	ldr r1, _08049C00 @ =_08049C04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08049C00: .4byte _08049C04
	.align 2, 0
_08049C04:
	.4byte _08049C38
	.4byte _08049CA4
	.4byte _08049CA4
	.4byte _08049C4E
	.4byte _08049CA4
	.4byte _08049CA4
	.4byte _08049C64
	.4byte _08049CA4
	.4byte _08049CA4
	.4byte _08049C7A
	.4byte _08049CA4
	.4byte _08049CA4
	.4byte _08049C90
_08049C38:
	movs r2, 0x15
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x47
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x65
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x56
	b _08049CA4
_08049C4E:
	movs r2, 0x18
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x4A
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x68
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x59
	b _08049CA4
_08049C64:
	movs r2, 0x1B
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x4D
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x6B
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x5C
	b _08049CA4
_08049C7A:
	movs r2, 0x1E
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x50
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x6E
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x5F
	b _08049CA4
_08049C90:
	movs r2, 0x21
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x53
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x71
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x62
_08049CA4:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end GetStatusIconForBankId

	thumb_func_start UpdateSafariBallsTextOnHealthbox
UpdateSafariBallsTextOnHealthbox: @ 8049CAC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08049D00 @ =gUnknown_83FE80C
	movs r1, 0
	movs r2, 0x3
	mov r3, sp
	bl AddTextPrinterAndCreateWindowOnHealthbox
	adds r5, r0, 0
	ldr r1, _08049D04 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r4, [r0, 0x4]
	lsls r4, 22
	lsrs r4, 17
	ldr r1, _08049D08 @ =0x06010040
	adds r0, r4, r1
	adds r1, r5, 0
	movs r2, 0x6
	bl sub_804A6E8
	ldr r0, _08049D0C @ =0x06010800
	adds r4, r0
	adds r5, 0xC0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_804A6E8
	ldr r0, [sp]
	bl sub_804A6D8
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049D00: .4byte gUnknown_83FE80C
_08049D04: .4byte gSprites
_08049D08: .4byte 0x06010040
_08049D0C: .4byte 0x06010800
	thumb_func_end UpdateSafariBallsTextOnHealthbox

	thumb_func_start UpdateLeftNoOfBallsTextOnHealthbox
UpdateLeftNoOfBallsTextOnHealthbox: @ 8049D10
	push {r4,r5,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08049D84 @ =gUnknown_83FE81C
	mov r0, sp
	bl StringCopy
	ldr r1, _08049D88 @ =gUnknown_2039994
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r0, 0
	mov r1, sp
	movs r2, 0
	bl GetStringWidth
	movs r1, 0x2F
	subs r1, r0
	add r3, sp, 0x10
	mov r0, sp
	movs r2, 0x3
	bl AddTextPrinterAndCreateWindowOnHealthbox
	adds r5, r0, 0
	ldr r1, _08049D8C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r4, [r0, 0x4]
	lsls r4, 22
	lsrs r4, 17
	ldr r1, _08049D90 @ =0x060102c0
	adds r0, r4, r1
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_804A734
	ldr r0, _08049D94 @ =0x06010a00
	adds r4, r0
	adds r5, 0x40
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_804A734
	ldr r0, [sp, 0x10]
	bl sub_804A6D8
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049D84: .4byte gUnknown_83FE81C
_08049D88: .4byte gUnknown_2039994
_08049D8C: .4byte gSprites
_08049D90: .4byte 0x060102c0
_08049D94: .4byte 0x06010a00
	thumb_func_end UpdateLeftNoOfBallsTextOnHealthbox

	thumb_func_start UpdateHealthboxAttribute
UpdateHealthboxAttribute: @ 8049D98
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r1
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r1, _08049F44 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r7, 0
	bne _08049DD4
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _08049DD4
	mov r0, r9
	bl GetBattlerSide
_08049DD4:
	ldr r1, _08049F44 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08049DF0
	b _08049F50
_08049DF0:
	cmp r7, 0x3
	beq _08049DF8
	cmp r7, 0
	bne _08049E0C
_08049DF8:
	mov r0, r8
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl UpdateLvlInHealthbox
_08049E0C:
	cmp r7, 0x1
	bhi _08049E26
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r6, 0
	movs r2, 0
	bl sub_8048440
_08049E26:
	cmp r7, 0x2
	beq _08049E2E
	cmp r7, 0
	bne _08049E44
_08049E2E:
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r6, 0
	movs r2, 0x1
	bl sub_8048440
_08049E44:
	cmp r7, 0x5
	beq _08049E4C
	cmp r7, 0
	bne _08049E80
_08049E4C:
	movs r0, 0
	bl LoadBattleBarGfx
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r9
	adds r1, r6, 0
	adds r2, r4, 0
	bl SetBattleBarStruct
	mov r0, r9
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0
	bl sub_8049FD8
_08049E80:
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0
	bne _08049F06
	cmp r7, 0x6
	beq _08049E96
	cmp r7, 0
	bne _08049F06
_08049E96:
	movs r0, 0x3
	bl LoadBattleBarGfx
	mov r0, r8
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r8
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	movs r1, 0x19
	bl GetMonData
	adds r3, r0, 0
	ldr r0, _08049F48 @ =gExperienceTables
	mov r12, r0
	lsls r1, r4, 2
	ldr r2, _08049F4C @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	add r1, r12
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	add r4, r12
	ldr r2, [r4]
	subs r2, r1
	mov r0, r10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, 0
	bl SetBattleBarStruct
	mov r0, r9
	adds r1, r6, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8049FD8
_08049F06:
	cmp r7, 0x4
	beq _08049F0E
	cmp r7, 0
	bne _08049F16
_08049F0E:
	adds r0, r6, 0
	mov r1, r8
	bl sub_80496C0
_08049F16:
	cmp r7, 0x9
	beq _08049F1E
	cmp r7, 0
	bne _08049F24
_08049F1E:
	adds r0, r6, 0
	bl UpdateStatusIconInHealthbox
_08049F24:
	cmp r7, 0xA
	bne _08049F2E
	adds r0, r6, 0
	bl UpdateSafariBallsTextOnHealthbox
_08049F2E:
	adds r0, r7, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08049FC6
	adds r0, r6, 0
	bl UpdateLeftNoOfBallsTextOnHealthbox
	b _08049FC6
	.align 2, 0
_08049F44: .4byte gSprites
_08049F48: .4byte gExperienceTables
_08049F4C: .4byte gBaseStats
_08049F50:
	cmp r7, 0x3
	beq _08049F58
	cmp r7, 0
	bne _08049F6C
_08049F58:
	mov r0, r8
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl UpdateLvlInHealthbox
_08049F6C:
	cmp r7, 0x5
	beq _08049F74
	cmp r7, 0
	bne _08049FA8
_08049F74:
	movs r0, 0
	bl LoadBattleBarGfx
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r9
	adds r1, r6, 0
	adds r2, r4, 0
	bl SetBattleBarStruct
	mov r0, r9
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0
	bl sub_8049FD8
_08049FA8:
	cmp r7, 0x4
	beq _08049FB0
	cmp r7, 0
	bne _08049FB8
_08049FB0:
	adds r0, r6, 0
	mov r1, r8
	bl sub_80496C0
_08049FB8:
	cmp r7, 0x9
	beq _08049FC0
	cmp r7, 0
	bne _08049FC6
_08049FC0:
	adds r0, r6, 0
	bl UpdateStatusIconInHealthbox
_08049FC6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end UpdateHealthboxAttribute

	thumb_func_start sub_8049FD8
sub_8049FD8: @ 8049FD8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	cmp r2, 0
	bne _0804A024
	ldr r0, _0804A020 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	mov r1, r8
	lsls r5, r1, 2
	adds r3, r5, r1
	lsls r3, 2
	adds r3, r0
	ldr r0, [r3, 0x4]
	ldr r1, [r3, 0x8]
	ldr r2, [r3, 0xC]
	adds r3, 0x10
	movs r4, 0x6
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	bl sub_804A2F0
	adds r4, r0, 0
	adds r7, r5, 0
	b _0804A080
	.align 2, 0
_0804A020: .4byte gUnknown_2024018
_0804A024:
	ldr r2, _0804A0D0 @ =gUnknown_2024018
	mov r10, r2
	ldr r0, [r2]
	ldr r2, [r0, 0xC]
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r6, r0, 2
	adds r2, r6, r2
	ldr r0, [r2, 0x8]
	ldr r1, [r2, 0xC]
	ldr r2, [r2, 0x4]
	movs r3, 0x8
	bl GetScaledExpFraction
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r4, 0
	cmp r5, 0
	bne _0804A04E
	movs r5, 0x1
_0804A04E:
	mov r1, r10
	ldr r0, [r1]
	ldr r0, [r0, 0xC]
	adds r4, r6, r0
	ldr r6, [r4, 0xC]
	adds r0, r6, 0
	adds r1, r5, 0
	bl __divsi3
	cmp r0, 0
	bge _0804A066
	negs r0, r0
_0804A066:
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r4, 0x4]
	ldr r1, [r4, 0x8]
	adds r3, r4, 0
	adds r3, 0x10
	movs r2, 0x8
	str r2, [sp]
	str r5, [sp, 0x4]
	adds r2, r6, 0
	bl sub_804A2F0
	adds r4, r0, 0
_0804A080:
	mov r2, r9
	cmp r2, 0x1
	beq _0804A09C
	cmp r2, 0
	bne _0804A0A4
	ldr r0, _0804A0D0 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0804A0A4
_0804A09C:
	mov r0, r8
	mov r1, r9
	bl sub_804A0D4
_0804A0A4:
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _0804A0BE
	ldr r0, _0804A0D0 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0xC]
	mov r2, r8
	adds r0, r7, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	str r1, [r0, 0x10]
_0804A0BE:
	adds r0, r4, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804A0D0: .4byte gUnknown_2024018
	thumb_func_end sub_8049FD8

	thumb_func_start sub_804A0D4
sub_804A0D4: @ 804A0D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _0804A0F0
	cmp r1, 0x1
	beq _0804A1D8
	b _0804A2D6
_0804A0F0:
	ldr r0, _0804A184 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	adds r3, r0
	ldr r0, [r3, 0x4]
	ldr r1, [r3, 0x8]
	ldr r2, [r3, 0xC]
	adds r3, 0x10
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804A3C4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	mov r9, r1
	adds r7, r5, 0
	cmp r0, 0x18
	bhi _0804A12C
	movs r2, 0x38
	mov r9, r2
	cmp r0, 0x9
	bls _0804A12C
	movs r4, 0x2F
	mov r9, r4
_0804A12C:
	movs r5, 0
	ldr r0, _0804A188 @ =gSprites
	mov r8, r0
_0804A132:
	ldr r0, _0804A184 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0xC]
	adds r0, r7, r6
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r5, 0x1
	bhi _0804A194
	mov r0, r9
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r8
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0x2
	adds r1, r2
	lsls r1, 5
	ldr r2, _0804A18C @ =0x06010000
	adds r1, r2
	ldr r2, _0804A190 @ =0x04000008
	bl CpuSet
	b _0804A1C2
	.align 2, 0
_0804A184: .4byte gUnknown_2024018
_0804A188: .4byte gSprites
_0804A18C: .4byte 0x06010000
_0804A190: .4byte 0x04000008
_0804A194:
	mov r0, r9
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r8
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r4, _0804A1D0 @ =0x06010040
	adds r1, r4
	ldr r2, _0804A1D4 @ =0x04000008
	bl CpuSet
_0804A1C2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0804A132
	b _0804A2D6
	.align 2, 0
_0804A1D0: .4byte 0x06010040
_0804A1D4: .4byte 0x04000008
_0804A1D8:
	ldr r0, _0804A27C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	adds r3, r0
	ldr r0, [r3, 0x4]
	ldr r1, [r3, 0x8]
	ldr r2, [r3, 0xC]
	adds r3, 0x10
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x8
	str r4, [sp, 0x4]
	bl sub_804A3C4
	ldr r1, _0804A280 @ =gBattlerPartyIndexes
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804A284 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	adds r7, r5, 0
	cmp r0, 0x64
	bne _0804A230
	movs r5, 0
	movs r1, 0
_0804A21E:
	mov r0, sp
	adds r0, r5
	adds r0, 0x8
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0804A21E
_0804A230:
	movs r5, 0
	ldr r0, _0804A288 @ =gSprites
	mov r8, r0
	adds r0, r7, r6
	lsls r4, r0, 2
_0804A23A:
	cmp r5, 0x3
	bhi _0804A294
	movs r0, 0xC
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804A27C @ =gUnknown_2024018
	ldr r1, [r1]
	ldr r1, [r1, 0xC]
	adds r1, r4, r1
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0
	adds r2, 0x24
	adds r1, r2
	lsls r1, 5
	ldr r2, _0804A28C @ =0x06010000
	adds r1, r2
	ldr r2, _0804A290 @ =0x04000008
	bl CpuSet
	b _0804A2CC
	.align 2, 0
_0804A27C: .4byte gUnknown_2024018
_0804A280: .4byte gBattlerPartyIndexes
_0804A284: .4byte gPlayerParty
_0804A288: .4byte gSprites
_0804A28C: .4byte 0x06010000
_0804A290: .4byte 0x04000008
_0804A294:
	movs r0, 0xC
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804A2E4 @ =gUnknown_2024018
	ldr r1, [r1]
	ldr r1, [r1, 0xC]
	adds r1, r4, r1
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r2, _0804A2E8 @ =0x06010b80
	adds r1, r2
	ldr r2, _0804A2EC @ =0x04000008
	bl CpuSet
_0804A2CC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0804A23A
_0804A2D6:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A2E4: .4byte gUnknown_2024018
_0804A2E8: .4byte 0x06010b80
_0804A2EC: .4byte 0x04000008
	thumb_func_end sub_804A0D4

	thumb_func_start sub_804A2F0
sub_804A2F0: @ 804A2F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	mov r8, r2
	adds r5, r3, 0
	ldr r1, [sp, 0x18]
	ldr r0, [sp, 0x1C]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 27
	lsrs r2, r1, 24
	ldr r1, [r5]
	ldr r0, _0804A31C @ =0xffff8000
	cmp r1, r0
	bne _0804A322
	cmp r7, r2
	bge _0804A320
	lsls r0, r4, 8
	str r0, [r5]
	b _0804A322
	.align 2, 0
_0804A31C: .4byte 0xffff8000
_0804A320:
	str r4, [r5]
_0804A322:
	mov r0, r8
	subs r4, r0
	cmp r4, 0
	bge _0804A32E
	movs r4, 0
	b _0804A334
_0804A32E:
	cmp r4, r7
	ble _0804A334
	adds r4, r7, 0
_0804A334:
	cmp r7, r2
	bge _0804A350
	ldr r0, [r5]
	asrs r1, r0, 8
	adds r6, r0, 0
	cmp r4, r1
	bne _0804A35C
	movs r0, 0xFF
	ands r0, r6
	cmp r0, 0
	bne _0804A35C
	movs r0, 0x1
	negs r0, r0
	b _0804A3B8
_0804A350:
	ldr r6, [r5]
	cmp r4, r6
	bne _0804A35C
	movs r0, 0x1
	negs r0, r0
	b _0804A3B8
_0804A35C:
	cmp r7, r2
	bge _0804A396
	lsls r0, r7, 8
	adds r1, r2, 0
	bl __divsi3
	mov r1, r8
	cmp r1, 0
	bge _0804A37A
	adds r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	cmp r2, r4
	blt _0804A3B6
	b _0804A38E
_0804A37A:
	subs r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	movs r1, 0xFF
	ands r0, r1
	cmp r0, 0
	ble _0804A38A
	adds r2, 0x1
_0804A38A:
	cmp r2, r4
	bgt _0804A3B6
_0804A38E:
	lsls r0, r4, 8
	str r0, [r5]
	adds r2, r4, 0
	b _0804A3B6
_0804A396:
	mov r0, r8
	cmp r0, 0
	bge _0804A3A8
	ldr r0, [r5]
	adds r0, r3
	str r0, [r5]
	cmp r0, r4
	ble _0804A3B4
	b _0804A3B2
_0804A3A8:
	ldr r0, [r5]
	subs r0, r3
	str r0, [r5]
	cmp r0, r4
	bge _0804A3B4
_0804A3B2:
	str r4, [r5]
_0804A3B4:
	ldr r2, [r5]
_0804A3B6:
	adds r0, r2, 0
_0804A3B8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804A2F0

	thumb_func_start sub_804A3C4
sub_804A3C4: @ 804A3C4
	push {r4-r7,lr}
	adds r4, r0, 0
	mov r12, r3
	ldr r7, [sp, 0x14]
	ldr r0, [sp, 0x18]
	lsls r0, 24
	lsrs r6, r0, 24
	subs r5, r1, r2
	cmp r5, 0
	bge _0804A3DC
	movs r5, 0
	b _0804A3E2
_0804A3DC:
	cmp r5, r4
	ble _0804A3E2
	adds r5, r4, 0
_0804A3E2:
	lsls r0, r6, 27
	lsrs r3, r0, 24
	movs r1, 0
	cmp r1, r6
	bcs _0804A3FC
	movs r2, 0
_0804A3EE:
	adds r0, r7, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcc _0804A3EE
_0804A3FC:
	cmp r4, r3
	bge _0804A410
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
	asrs r0, 8
	b _0804A41C
_0804A410:
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
_0804A41C:
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r3, 0
	bne _0804A432
	cmp r5, 0
	ble _0804A432
	movs r0, 0x1
	strb r0, [r7]
	movs r3, 0x1
	b _0804A456
_0804A432:
	movs r1, 0
	movs r4, 0x8
_0804A436:
	cmp r1, r6
	bcs _0804A456
	cmp r2, 0x7
	bls _0804A452
	adds r0, r7, r1
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	b _0804A436
_0804A452:
	adds r0, r7, r1
	strb r2, [r0]
_0804A456:
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804A3C4

	thumb_func_start sub_804A460
sub_804A460: @ 804A460
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	mov r9, r0
	mov r10, r1
	adds r6, r2, 0
	mov r8, r3
	ldr r5, [sp, 0x24]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 24
	lsrs r5, 24
	mov r1, r9
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	mov r3, r9
	ldr r2, [r3, 0x8]
	movs r3, 0x6
	str r3, [sp]
	movs r3, 0x1
	str r3, [sp, 0x4]
	mov r3, r10
	bl sub_804A2F0
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	str r5, [sp]
	mov r0, r9
	mov r1, r10
	adds r2, r6, 0
	mov r3, r8
	bl sub_804A510
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_804A460

	thumb_func_start sub_804A4C8
sub_804A4C8: @ 804A4C8
	push {r4,lr}
	sub sp, 0x8
	adds r3, r1, 0
	ldr r4, [r0]
	ldr r1, [r0, 0x4]
	ldr r2, [r0, 0x8]
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	adds r0, r4, 0
	bl sub_804A2F0
	lsls r0, 16
	asrs r0, 16
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_804A4C8

	thumb_func_start sub_804A4F0
sub_804A4F0: @ 804A4F0
	push {r4,lr}
	sub sp, 0x4
	ldr r4, [sp, 0xC]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	bl sub_804A510
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804A4F0

	thumb_func_start sub_804A510
sub_804A510: @ 804A510
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [sp, 0x40]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	ldr r2, [r4, 0x8]
	add r3, sp, 0xC
	str r3, [sp]
	movs r3, 0x6
	str r3, [sp, 0x4]
	adds r3, r5, 0
	bl sub_804A3C4
	movs r3, 0
	add r6, sp, 0x14
	adds r7, r6, 0
	ldrb r0, [r4, 0xC]
	lsls r5, r0, 27
	ldr r4, [r4, 0x10]
_0804A554:
	lsls r2, r3, 1
	adds r2, r7, r2
	lsrs r1, r5, 15
	mov r0, sp
	adds r0, r3
	adds r0, 0xC
	ldrb r0, [r0]
	adds r0, r4, r0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _0804A554
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	mov r0, r9
	adds r1, r6, 0
	mov r2, r10
	mov r3, r8
	bl CopyToBgTilemapBufferRect_ChangePalette
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804A510

	thumb_func_start GetScaledExpFraction
GetScaledExpFraction: @ 804A59C
	push {r4-r7,lr}
	adds r6, r2, 0
	lsls r3, 27
	lsrs r7, r3, 24
	subs r5, r0, r1
	cmp r5, 0
	bge _0804A5AE
	movs r5, 0
	b _0804A5B4
_0804A5AE:
	cmp r5, r6
	ble _0804A5B4
	adds r5, r6, 0
_0804A5B4:
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	subs r0, r4, r0
	cmp r0, 0
	bge _0804A5DC
	negs r0, r0
_0804A5DC:
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetScaledExpFraction

	thumb_func_start GetScaledHPFraction
GetScaledHPFraction: @ 804A5E8
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	muls r0, r2
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0804A60C
	cmp r4, 0
	ble _0804A60C
	movs r0, 0x1
_0804A60C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetScaledHPFraction

	thumb_func_start GetHPBarLevel
GetHPBarLevel: @ 804A614
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _0804A626
	movs r0, 0x4
	b _0804A642
_0804A626:
	movs r2, 0x30
	bl GetScaledHPFraction
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x3
	cmp r1, 0x18
	bhi _0804A642
	movs r0, 0x2
	cmp r1, 0x9
	bhi _0804A642
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0804A642:
	pop {r1}
	bx r1
	thumb_func_end GetHPBarLevel

	thumb_func_start AddTextPrinterAndCreateWindowOnHealthbox
AddTextPrinterAndCreateWindowOnHealthbox: @ 804A648
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x20
	mov r9, r0
	adds r6, r1, 0
	mov r8, r2
	mov r10, r3
	ldr r0, _0804A6D4 @ =gUnknown_8260564
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	add r0, sp, 0x18
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, r4, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x22
	bl FillWindowPixelBuffer
	add r1, sp, 0x14
	movs r2, 0
	movs r0, 0x2
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	str r2, [sp]
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0xC]
	mov r0, r9
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r6, 0
	mov r3, r8
	bl AddTextPrinterParametrized2
	mov r0, r10
	str r4, [r0]
	adds r0, r5, 0
	movs r1, 0x7
	bl GetWindowAttribute
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804A6D4: .4byte gUnknown_8260564
	thumb_func_end AddTextPrinterAndCreateWindowOnHealthbox

	thumb_func_start sub_804A6D8
sub_804A6D8: @ 804A6D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	pop {r0}
	bx r0
	thumb_func_end sub_804A6D8

	thumb_func_start sub_804A6E8
sub_804A6E8: @ 804A6E8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	movs r1, 0x80
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r6, r1
	lsls r2, r4, 3
	ldr r3, _0804A72C @ =0x001fffff
	ands r2, r3
	movs r3, 0x80
	lsls r3, 19
	orrs r2, r3
	bl CpuSet
	cmp r4, 0
	ble _0804A724
_0804A70C:
	adds r0, r5, 0
	adds r0, 0x14
	adds r1, r6, 0
	adds r1, 0x14
	ldr r2, _0804A730 @ =0x04000003
	bl CpuSet
	adds r6, 0x20
	adds r5, 0x20
	subs r4, 0x1
	cmp r4, 0
	bne _0804A70C
_0804A724:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A72C: .4byte 0x001fffff
_0804A730: .4byte 0x04000003
	thumb_func_end sub_804A6E8

	thumb_func_start sub_804A734
sub_804A734: @ 804A734
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r4, r2, 3
	ldr r0, _0804A768 @ =0x001fffff
	ands r4, r0
	movs r0, 0x80
	lsls r0, 19
	orrs r4, r0
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl CpuSet
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0
	adds r6, r0
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl CpuSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A768: .4byte 0x001fffff
	thumb_func_end sub_804A734

	.align 2, 0 @ Don't pad with nop.
