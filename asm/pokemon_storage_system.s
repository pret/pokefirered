	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start AddBoxMenu
AddBoxMenu: @ 8094900
	push {lr}
	bl InitMenu
	movs r0, 0x9
	bl SetMenuText
	movs r0, 0xA
	bl SetMenuText
	movs r0, 0xB
	bl SetMenuText
	movs r0, 0
	bl SetMenuText
	pop {r0}
	bx r0
	thumb_func_end AddBoxMenu

	thumb_func_start sub_8094924
sub_8094924: @ 8094924
	push {lr}
	bl InitMenu
	ldr r0, _0809493C @ =sPSSData
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08094940
	bl sub_8094A0C
	b _08094944
	.align 2, 0
_0809493C: .4byte sPSSData
_08094940:
	bl sub_809494C
_08094944:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8094924

	thumb_func_start sub_809494C
sub_809494C: @ 809494C
	push {lr}
	bl sub_8092458
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0809496C @ =sPSSData
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	beq _08094976
	cmp r0, 0x1
	bgt _08094970
	cmp r0, 0
	beq _08094982
	b _080949BC
	.align 2, 0
_0809496C: .4byte sPSSData
_08094970:
	cmp r0, 0x2
	beq _0809498E
	b _080949BC
_08094976:
	cmp r1, 0
	beq _080949BC
	movs r0, 0x1
	bl SetMenuText
	b _080949C0
_08094982:
	cmp r1, 0
	beq _080949BC
	movs r0, 0x2
	bl SetMenuText
	b _080949C0
_0809498E:
	ldr r0, _080949A4 @ =sIsMonBeingMoved
	ldrb r0, [r0]
	cmp r0, 0
	beq _080949B0
	cmp r1, 0
	beq _080949A8
	movs r0, 0x4
	bl SetMenuText
	b _080949C0
	.align 2, 0
_080949A4: .4byte sIsMonBeingMoved
_080949A8:
	movs r0, 0x5
	bl SetMenuText
	b _080949C0
_080949B0:
	cmp r1, 0
	beq _080949BC
	movs r0, 0x3
	bl SetMenuText
	b _080949C0
_080949BC:
	movs r0, 0
	b _08094A06
_080949C0:
	movs r0, 0x6
	bl SetMenuText
	ldr r0, _080949E4 @ =sPSSData
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x2
	bne _080949F2
	ldr r0, _080949E8 @ =sBoxCursorArea
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _080949EC
	movs r0, 0x2
	bl SetMenuText
	b _080949F2
	.align 2, 0
_080949E4: .4byte sPSSData
_080949E8: .4byte sBoxCursorArea
_080949EC:
	movs r0, 0x1
	bl SetMenuText
_080949F2:
	movs r0, 0x8
	bl SetMenuText
	movs r0, 0x7
	bl SetMenuText
	movs r0, 0
	bl SetMenuText
	movs r0, 0x1
_08094A06:
	pop {r1}
	bx r1
	thumb_func_end sub_809494C

	thumb_func_start sub_8094A0C
sub_8094A0C: @ 8094A0C
	push {r4,r5,lr}
	ldr r4, _08094A48 @ =sPSSData
	ldr r0, [r4]
	movs r5, 0xCE
	lsls r5, 4
	adds r0, r5
	ldrh r1, [r0]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _08094A9E
	bl IsActiveItemMoving
	lsls r0, 24
	cmp r0, 0
	bne _08094A70
	ldr r2, [r4]
	ldr r0, _08094A4C @ =0x00000ce2
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _08094A50
	adds r0, r2, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _08094A9E
	movs r0, 0xE
	bl SetMenuText
	b _08094AA8
	.align 2, 0
_08094A48: .4byte sPSSData
_08094A4C: .4byte 0x00000ce2
_08094A50:
	ldrh r0, [r1]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	bne _08094A68
	movs r0, 0xC
	bl SetMenuText
	movs r0, 0x10
	bl SetMenuText
_08094A68:
	movs r0, 0x11
	bl SetMenuText
	b _08094AA8
_08094A70:
	ldr r2, [r4]
	ldr r0, _08094A8C @ =0x00000ce2
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _08094A90
	adds r0, r2, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _08094A9E
	movs r0, 0xD
	bl SetMenuText
	b _08094AA8
	.align 2, 0
_08094A8C: .4byte 0x00000ce2
_08094A90:
	ldrh r0, [r1]
	bl ItemIsMail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08094AA2
_08094A9E:
	movs r0, 0
	b _08094AB0
_08094AA2:
	movs r0, 0xF
	bl SetMenuText
_08094AA8:
	movs r0, 0
	bl SetMenuText
	movs r0, 0x1
_08094AB0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8094A0C

	thumb_func_start sub_8094AB8
sub_8094AB8: @ 8094AB8
	ldr r1, _08094AD4 @ =sPSSData
	ldr r1, [r1]
	movs r2, 0xCB
	lsls r2, 4
	adds r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0x20]
	ldr r1, [r1]
	ldrh r1, [r1, 0x22]
	adds r1, 0x14
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08094AD4: .4byte sPSSData
	thumb_func_end sub_8094AB8

	thumb_func_start sub_8094AD8
sub_8094AD8: @ 8094AD8
	push {r4-r6,lr}
	sub sp, 0x2C
	mov r1, sp
	ldr r0, _08094BA4 @ =gUnknown_83D34A0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	add r4, sp, 0x18
	adds r1, r4, 0
	ldr r0, _08094BA8 @ =gUnknown_83D34B8
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r0]
	str r0, [r1]
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, 0
	bl LoadSpritePalettes
	ldr r0, _08094BAC @ =0x0000daca
	bl IndexOfSpritePaletteTag
	ldr r6, _08094BB0 @ =sPSSData
	ldr r1, [r6]
	ldr r4, _08094BB4 @ =0x00000cd4
	adds r1, r4
	strb r0, [r1]
	ldr r0, _08094BB8 @ =0x0000dac7
	bl IndexOfSpritePaletteTag
	ldr r1, [r6]
	ldr r5, _08094BBC @ =0x00000cd5
	adds r1, r5
	strb r0, [r1]
	ldr r0, _08094BC0 @ =sBoxCursorArea
	ldrb r0, [r0]
	ldr r1, _08094BC4 @ =sBoxCursorPosition
	ldrb r1, [r1]
	add r4, sp, 0x28
	mov r5, sp
	adds r5, 0x2A
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_8092398
	ldr r0, _08094BC8 @ =gUnknown_83D350C
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0
	ldrsh r2, [r5, r3]
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08094BD8
	ldr r2, [r6]
	movs r4, 0xCB
	lsls r4, 4
	adds r3, r2, r4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08094BCC @ =gSprites
	adds r1, r0
	str r1, [r3]
	ldr r0, _08094BD0 @ =sCanOnlyMove
	ldr r5, _08094BB4 @ =0x00000cd4
	adds r2, r5
	ldrb r0, [r0]
	adds r2, r0
	ldrb r2, [r2]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [r6]
	adds r0, r4
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _08094BD4 @ =sIsMonBeingMoved
	ldrb r0, [r0]
	cmp r0, 0
	beq _08094BE4
	ldr r0, [r6]
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	b _08094BE4
	.align 2, 0
_08094BA4: .4byte gUnknown_83D34A0
_08094BA8: .4byte gUnknown_83D34B8
_08094BAC: .4byte 0x0000daca
_08094BB0: .4byte sPSSData
_08094BB4: .4byte 0x00000cd4
_08094BB8: .4byte 0x0000dac7
_08094BBC: .4byte 0x00000cd5
_08094BC0: .4byte sBoxCursorArea
_08094BC4: .4byte sBoxCursorPosition
_08094BC8: .4byte gUnknown_83D350C
_08094BCC: .4byte gSprites
_08094BD0: .4byte sCanOnlyMove
_08094BD4: .4byte sIsMonBeingMoved
_08094BD8:
	ldr r0, [r6]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_08094BE4:
	ldr r0, _08094BF8 @ =sBoxCursorArea
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _08094BFC
	movs r3, 0xD
	movs r4, 0x1
	b _08094C00
	.align 2, 0
_08094BF8: .4byte sBoxCursorArea
_08094BFC:
	movs r3, 0x15
	movs r4, 0x2
_08094C00:
	ldr r0, _08094C54 @ =gUnknown_83D3524
	movs r1, 0
	movs r2, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08094C68
	ldr r5, _08094C58 @ =sPSSData
	ldr r2, [r5]
	ldr r3, _08094C5C @ =0x00000cb4
	adds r2, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08094C60 @ =gSprites
	adds r1, r0
	str r1, [r2]
	lsls r3, r4, 2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r0, _08094C64 @ =sBoxCursorArea
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08094C74
	ldr r0, [r5]
	ldr r4, _08094C5C @ =0x00000cb4
	adds r0, r4
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _08094C74
	.align 2, 0
_08094C54: .4byte gUnknown_83D3524
_08094C58: .4byte sPSSData
_08094C5C: .4byte 0x00000cb4
_08094C60: .4byte gSprites
_08094C64: .4byte sBoxCursorArea
_08094C68:
	ldr r0, _08094C7C @ =sPSSData
	ldr r0, [r0]
	ldr r5, _08094C80 @ =0x00000cb4
	adds r0, r5
	movs r1, 0
	str r1, [r0]
_08094C74:
	add sp, 0x2C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094C7C: .4byte sPSSData
_08094C80: .4byte 0x00000cb4
	thumb_func_end sub_8094AD8

	thumb_func_start sub_8094C84
sub_8094C84: @ 8094C84
	push {lr}
	ldr r2, _08094CBC @ =sCanOnlyMove
	movs r1, 0
	ldrb r0, [r2]
	cmp r0, 0
	bne _08094C92
	movs r1, 0x1
_08094C92:
	strb r1, [r2]
	ldr r0, _08094CC0 @ =sPSSData
	ldr r0, [r0]
	movs r3, 0xCB
	lsls r3, 4
	adds r1, r0, r3
	ldr r3, [r1]
	ldr r1, _08094CC4 @ =0x00000cd4
	adds r0, r1
	ldrb r2, [r2]
	adds r0, r2
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r3, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	pop {r0}
	bx r0
	.align 2, 0
_08094CBC: .4byte sCanOnlyMove
_08094CC0: .4byte sPSSData
_08094CC4: .4byte 0x00000cd4
	thumb_func_end sub_8094C84

	thumb_func_start GetBoxCursorPosition
GetBoxCursorPosition: @ 8094CC8
	ldr r0, _08094CD0 @ =sBoxCursorPosition
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08094CD0: .4byte sBoxCursorPosition
	thumb_func_end GetBoxCursorPosition

	thumb_func_start sub_8094CD4
sub_8094CD4: @ 8094CD4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r0, _08094D00 @ =sBoxCursorArea
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08094D08
	ldr r4, _08094D04 @ =sBoxCursorPosition
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	bl __modsi3
	strb r0, [r5]
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	bl __divsi3
	b _08094D0C
	.align 2, 0
_08094D00: .4byte sBoxCursorArea
_08094D04: .4byte sBoxCursorPosition
_08094D08:
	movs r0, 0
	strb r0, [r5]
_08094D0C:
	strb r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8094CD4

	thumb_func_start sub_8094D14
sub_8094D14: @ 8094D14
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08094D30 @ =sPSSData
	ldr r0, [r0]
	movs r2, 0xCB
	lsls r2, 4
	adds r0, r2
	ldr r0, [r0]
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_08094D30: .4byte sPSSData
	thumb_func_end sub_8094D14

	thumb_func_start sub_8094D34
sub_8094D34: @ 8094D34
	ldr r0, _08094D3C @ =sMovingMonOrigBoxId
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08094D3C: .4byte sMovingMonOrigBoxId
	thumb_func_end sub_8094D34

	thumb_func_start sub_8094D40
sub_8094D40: @ 8094D40
	ldr r0, _08094D5C @ =sPSSData
	ldr r0, [r0]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	bx lr
	.align 2, 0
_08094D5C: .4byte sPSSData
	thumb_func_end sub_8094D40

	thumb_func_start sub_8094D60
sub_8094D60: @ 8094D60
	push {lr}
	ldr r0, _08094D7C @ =sBoxCursorArea
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08094D78
	ldr r0, _08094D80 @ =sBoxCursorPosition
	ldrb r1, [r0]
	movs r0, 0
	bl sub_8095D44
_08094D78:
	pop {r0}
	bx r0
	.align 2, 0
_08094D7C: .4byte sBoxCursorArea
_08094D80: .4byte sBoxCursorPosition
	thumb_func_end sub_8094D60

	thumb_func_start sub_8094D84
sub_8094D84: @ 8094D84
	push {lr}
	ldr r0, _08094DA0 @ =sBoxCursorArea
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08094D9C
	ldr r0, _08094DA4 @ =sBoxCursorPosition
	ldrb r1, [r0]
	movs r0, 0
	bl sub_8095C84
_08094D9C:
	pop {r0}
	bx r0
	.align 2, 0
_08094DA0: .4byte sBoxCursorArea
_08094DA4: .4byte sBoxCursorPosition
	thumb_func_end sub_8094D84

	@ file boundary?

	thumb_func_start InitMenu
InitMenu: @ 8094DA8
	ldr r2, _08094DDC @ =sPSSData
	ldr r0, [r2]
	ldr r1, _08094DE0 @ =0x00000ca8
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r3, _08094DE4 @ =0x00000ca9
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	subs r3, 0x41
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _08094DE8 @ =0x00000c6d
	adds r0, r1
	movs r1, 0xF
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, 0x6
	adds r0, r3
	movs r1, 0x5C
	strh r1, [r0]
	bx lr
	.align 2, 0
_08094DDC: .4byte sPSSData
_08094DE0: .4byte 0x00000ca8
_08094DE4: .4byte 0x00000ca9
_08094DE8: .4byte 0x00000c6d
	thumb_func_end InitMenu

	thumb_func_start SetMenuText
SetMenuText: @ 8094DEC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r4, _08094E40 @ =sPSSData
	ldr r2, [r4]
	ldr r5, _08094E44 @ =0x00000ca8
	adds r1, r2, r5
	ldrb r0, [r1]
	cmp r0, 0x6
	bhi _08094E38
	adds r1, r0, 0
	lsls r1, 3
	movs r0, 0xC7
	lsls r0, 4
	adds r1, r0
	adds r1, r2, r1
	ldr r2, _08094E48 @ =gUnknown_83D353C
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
	str r3, [r1, 0x4]
	bl StringLength
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, [r4]
	ldr r2, _08094E4C @ =0x00000ca9
	adds r0, r2
	ldrb r2, [r0]
	cmp r1, r2
	bls _08094E2E
	strb r1, [r0]
_08094E2E:
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08094E38:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094E40: .4byte sPSSData
_08094E44: .4byte 0x00000ca8
_08094E48: .4byte gUnknown_83D353C
_08094E4C: .4byte 0x00000ca9
	thumb_func_end SetMenuText

	thumb_func_start sub_8094E50
sub_8094E50: @ 8094E50
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08094E74 @ =sPSSData
	ldr r1, [r0]
	ldr r3, _08094E78 @ =0x00000ca8
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08094E80
	lsls r0, r2, 3
	ldr r2, _08094E7C @ =0x00000c74
	adds r1, r2
	adds r1, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	b _08094E84
	.align 2, 0
_08094E74: .4byte sPSSData
_08094E78: .4byte 0x00000ca8
_08094E7C: .4byte 0x00000c74
_08094E80:
	movs r0, 0x1
	negs r0, r0
_08094E84:
	pop {r1}
	bx r1
	thumb_func_end sub_8094E50

	thumb_func_start AddMenu
AddMenu: @ 8094E88
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	ldr r5, _08094F6C @ =sPSSData
	ldr r1, [r5]
	ldr r2, _08094F70 @ =0x00000ca9
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r0, 0x2
	subs r2, 0x3E
	adds r1, r2
	movs r3, 0
	mov r10, r3
	strb r0, [r1]
	ldr r1, [r5]
	ldr r0, _08094F74 @ =0x00000ca8
	mov r8, r0
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, 1
	ldr r3, _08094F78 @ =0x00000c6c
	adds r1, r3
	strb r0, [r1]
	ldr r1, [r5]
	adds r2, r1, r2
	ldrb r2, [r2]
	movs r0, 0x1D
	subs r0, r2
	ldr r2, _08094F7C @ =0x00000c69
	adds r1, r2
	strb r0, [r1]
	ldr r1, [r5]
	adds r3, r1, r3
	ldrb r2, [r3]
	movs r0, 0xF
	subs r0, r2
	ldr r3, _08094F80 @ =0x00000c6a
	adds r1, r3
	strb r0, [r1]
	ldr r0, [r5]
	ldr r1, _08094F84 @ =0x00000c68
	adds r0, r1
	bl AddWindow
	ldr r1, [r5]
	ldr r4, _08094F88 @ =0x00000cac
	adds r1, r4
	movs r2, 0
	mov r9, r2
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0xB
	movs r3, 0xE
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, [r5]
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r6, 0x10
	str r6, [sp]
	mov r3, r8
	adds r1, r2, r3
	ldrb r1, [r1]
	str r1, [sp, 0x4]
	movs r1, 0xC7
	lsls r1, 4
	adds r2, r1
	str r2, [sp, 0x8]
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x2
	bl PrintTextArray
	ldr r1, [r5]
	adds r4, r1, r4
	ldrb r0, [r4]
	str r6, [sp]
	add r1, r8
	ldrb r1, [r1]
	str r1, [sp, 0x4]
	mov r2, r10
	str r2, [sp, 0x8]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x2
	bl Menu_InitCursor
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldr r0, [r5]
	ldr r3, _08094F8C @ =0x00000caa
	adds r0, r3
	mov r1, r9
	strb r1, [r0]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094F6C: .4byte sPSSData
_08094F70: .4byte 0x00000ca9
_08094F74: .4byte 0x00000ca8
_08094F78: .4byte 0x00000c6c
_08094F7C: .4byte 0x00000c69
_08094F80: .4byte 0x00000c6a
_08094F84: .4byte 0x00000c68
_08094F88: .4byte 0x00000cac
_08094F8C: .4byte 0x00000caa
	thumb_func_end AddMenu

	thumb_func_start sub_8094F90
sub_8094F90: @ 8094F90
	movs r0, 0
	bx lr
	thumb_func_end sub_8094F90

	thumb_func_start sub_8094F94
sub_8094F94: @ 8094F94
	push {r4,r5,lr}
	movs r5, 0x2
	negs r5, r5
	ldr r4, _08094FD0 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08094FEA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08094FB6
	movs r0, 0x5
	bl PlaySE
	adds r5, 0x1
_08094FB6:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08094FD4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl Menu_MoveCursor
	b _08094FF2
	.align 2, 0
_08094FD0: .4byte gMain
_08094FD4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08094FF2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl Menu_MoveCursor
	b _08094FF2
_08094FEA:
	bl Menu_GetCursorPos
	lsls r0, 24
	lsrs r5, r0, 24
_08094FF2:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _08094FFE
	bl sub_8095024
_08094FFE:
	cmp r5, 0
	blt _08095010
	ldr r0, _0809501C @ =sPSSData
	ldr r0, [r0]
	lsls r1, r5, 3
	ldr r2, _08095020 @ =0x00000c74
	adds r0, r2
	adds r0, r1
	ldr r5, [r0]
_08095010:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809501C: .4byte sPSSData
_08095020: .4byte 0x00000c74
	thumb_func_end sub_8094F94

	thumb_func_start sub_8095024
sub_8095024: @ 8095024
	push {r4,r5,lr}
	ldr r5, _08095048 @ =sPSSData
	ldr r0, [r5]
	ldr r4, _0809504C @ =0x00000cac
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x1
	bl ClearStdWindowAndFrameToTransparent
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095048: .4byte sPSSData
_0809504C: .4byte 0x00000cac
	thumb_func_end sub_8095024

	thumb_func_start sub_8095050
sub_8095050: @ 8095050
	push {r4,lr}
	ldr r4, _08095088 @ =gUnknown_2039828
	ldr r0, _0809508C @ =0x00000974
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0809509C
	ldr r0, _08095090 @ =gUnknown_83D35D4
	bl AddWindow8Bit
	adds r1, r0, 0
	ldr r0, _08095094 @ =sPSSData
	ldr r0, [r0]
	ldr r2, _08095098 @ =0x000021f0
	adds r0, r2
	strh r1, [r0]
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0xFF
	beq _0809509C
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x1
	b _0809509E
	.align 2, 0
_08095088: .4byte gUnknown_2039828
_0809508C: .4byte 0x00000974
_08095090: .4byte gUnknown_83D35D4
_08095094: .4byte sPSSData
_08095098: .4byte 0x000021f0
_0809509C:
	movs r0, 0
_0809509E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8095050

	thumb_func_start sub_80950A4
sub_80950A4: @ 80950A4
	push {lr}
	ldr r0, _080950B8 @ =gUnknown_2039828
	ldr r0, [r0]
	cmp r0, 0
	beq _080950B2
	bl Free
_080950B2:
	pop {r0}
	bx r0
	.align 2, 0
_080950B8: .4byte gUnknown_2039828
	thumb_func_end sub_80950A4

	thumb_func_start sub_80950BC
sub_80950BC: @ 80950BC
	ldr r2, _080950CC @ =gUnknown_2039828
	ldr r1, [r2]
	movs r3, 0
	strb r0, [r1]
	ldr r0, [r2]
	strb r3, [r0, 0x1]
	bx lr
	.align 2, 0
_080950CC: .4byte gUnknown_2039828
	thumb_func_end sub_80950BC

	thumb_func_start sub_80950D0
sub_80950D0: @ 80950D0
	push {lr}
	ldr r0, _080950E8 @ =gUnknown_2039828
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08095130
	lsls r0, 2
	ldr r1, _080950EC @ =_080950F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080950E8: .4byte gUnknown_2039828
_080950EC: .4byte _080950F0
	.align 2, 0
_080950F0:
	.4byte _08095108
	.4byte _0809510E
	.4byte _08095114
	.4byte _0809511A
	.4byte _08095120
	.4byte _08095126
_08095108:
	bl sub_8095138
	b _0809512A
_0809510E:
	bl sub_8095234
	b _0809512A
_08095114:
	bl sub_80952A0
	b _0809512A
_0809511A:
	bl sub_8095314
	b _0809512A
_08095120:
	bl sub_8095394
	b _0809512A
_08095126:
	bl sub_80953BC
_0809512A:
	lsls r0, 24
	lsrs r0, 24
	b _08095132
_08095130:
	movs r0, 0
_08095132:
	pop {r1}
	bx r1
	thumb_func_end sub_80950D0

	thumb_func_start sub_8095138
sub_8095138: @ 8095138
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _08095150 @ =gUnknown_2039828
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	beq _08095168
	cmp r0, 0x1
	bgt _08095154
	cmp r0, 0
	beq _0809515A
	b _08095228
	.align 2, 0
_08095150: .4byte gUnknown_2039828
_08095154:
	cmp r0, 0x2
	beq _08095214
	b _08095228
_0809515A:
	movs r0, 0
	bl HideBg
	movs r0, 0x80
	bl LoadMonIconPalettesAt
	b _080951F8
_08095168:
	adds r0, r1, 0x2
	adds r1, 0x3
	bl sub_8094CD4
	ldr r1, [r6]
	ldrb r0, [r1, 0x2]
	strb r0, [r1, 0x4]
	ldr r1, [r6]
	ldrb r0, [r1, 0x3]
	strb r0, [r1, 0x5]
	ldr r4, _08095204 @ =0xfffffc00
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r5, _08095208 @ =sPSSData
	ldr r0, [r5]
	ldr r4, _0809520C @ =0x000021f0
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer8Bit
	ldr r1, [r6]
	ldrb r0, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	bl sub_80956A4
	movs r0, 0
	movs r1, 0x4
	movs r2, 0x1
	bl SetBgAttribute
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram8Bit
	movs r0, 0xFC
	lsls r0, 6
	ldr r2, _08095210 @ =0x00007fff
	movs r1, 0x8
	bl BlendPalettes
	movs r0, 0x2
	bl sub_8094D14
	movs r0, 0x8
	movs r1, 0x80
	bl SetGpuRegBits
_080951F8:
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _08095228
	.align 2, 0
_08095204: .4byte 0xfffffc00
_08095208: .4byte sPSSData
_0809520C: .4byte 0x000021f0
_08095210: .4byte 0x00007fff
_08095214:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08095228
	movs r0, 0
	bl ShowBg
	movs r0, 0
	b _0809522A
_08095228:
	movs r0, 0x1
_0809522A:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8095138

	thumb_func_start sub_8095234
sub_8095234: @ 8095234
	push {r4,lr}
	ldr r4, _0809524C @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	beq _0809525E
	cmp r0, 0x1
	bgt _08095250
	cmp r0, 0
	beq _08095256
	b _08095298
	.align 2, 0
_0809524C: .4byte gUnknown_2039828
_08095250:
	cmp r0, 0x2
	beq _08095272
	b _08095298
_08095256:
	movs r0, 0
	bl HideBg
	b _08095268
_0809525E:
	bl sub_8095A58
	movs r0, 0
	bl sub_8094D14
_08095268:
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _08095298
_08095272:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08095298
	bl sub_8094D40
	movs r0, 0x3
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	bl ShowBg
	movs r0, 0
	b _0809529A
_08095298:
	movs r0, 0x1
_0809529A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8095234

	thumb_func_start sub_80952A0
sub_80952A0: @ 80952A0
	push {r4,lr}
	ldr r4, _080952B4 @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080952B8
	cmp r0, 0x1
	beq _08095300
	b _0809530A
	.align 2, 0
_080952B4: .4byte gUnknown_2039828
_080952B8:
	bl sub_80924A8
	lsls r0, 24
	cmp r0, 0
	bne _0809530A
	ldr r1, [r4]
	adds r0, r1, 0x6
	adds r1, 0x7
	bl sub_8094CD4
	bl sub_8095520
	ldr r1, [r4]
	ldrb r0, [r1, 0x6]
	strb r0, [r1, 0x4]
	ldr r1, [r4]
	ldrb r0, [r1, 0x7]
	strb r0, [r1, 0x5]
	ldr r0, _080952F8 @ =sPSSData
	ldr r0, [r0]
	ldr r1, _080952FC @ =0x000021f0
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram8Bit
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _0809530A
	.align 2, 0
_080952F8: .4byte sPSSData
_080952FC: .4byte 0x000021f0
_08095300:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0809530C
_0809530A:
	movs r0, 0x1
_0809530C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80952A0

	thumb_func_start sub_8095314
sub_8095314: @ 8095314
	push {r4,lr}
	ldr r4, _0809532C @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	beq _08095342
	cmp r0, 0x1
	bgt _08095330
	cmp r0, 0
	beq _08095336
	b _0809538C
	.align 2, 0
_0809532C: .4byte gUnknown_2039828
_08095330:
	cmp r0, 0x2
	beq _0809536E
	b _0809538C
_08095336:
	bl sub_80957C8
	bl sub_80958A0
	movs r0, 0
	b _08095360
_08095342:
	bl DoMonPlaceChange
	lsls r0, 24
	cmp r0, 0
	bne _0809538C
	movs r0, 0x3
	bl sub_8094D14
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0
	movs r2, 0x8
	bl sub_8095780
	movs r0, 0x1
_08095360:
	bl sub_8092BAC
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _0809538C
_0809536E:
	bl sub_8095790
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl DoMonPlaceChange
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0
	bne _0809538C
	cmp r0, 0
	bne _0809538C
	movs r0, 0
	b _0809538E
_0809538C:
	movs r0, 0x1
_0809538E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8095314

	thumb_func_start sub_8095394
sub_8095394: @ 8095394
	push {r4,lr}
	bl sub_80924A8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8095790
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0
	bne _080953B4
	cmp r0, 0
	bne _080953B4
	movs r0, 0
	b _080953B6
_080953B4:
	movs r0, 0x1
_080953B6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8095394

	thumb_func_start sub_80953BC
sub_80953BC: @ 80953BC
	push {r4,lr}
	ldr r4, _080953D4 @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	beq _080953FA
	cmp r0, 0x1
	bgt _080953D8
	cmp r0, 0
	beq _080953E2
	b _0809546A
	.align 2, 0
_080953D4: .4byte gUnknown_2039828
_080953D8:
	cmp r0, 0x2
	beq _08095426
	cmp r0, 0x3
	beq _08095444
	b _0809546A
_080953E2:
	bl sub_80959A8
	movs r1, 0xFF
	lsls r1, 8
	movs r0, 0
	movs r2, 0x8
	bl sub_8095780
	movs r0, 0
	bl sub_8092BAC
	b _0809543A
_080953FA:
	bl DoMonPlaceChange
	lsls r0, 24
	cmp r0, 0
	bne _0809546A
	bl sub_8095790
	lsls r0, 24
	cmp r0, 0
	bne _0809546A
	bl sub_8095918
	movs r0, 0x2
	bl sub_8094D14
	movs r0, 0x1
	bl sub_8092BAC
	movs r0, 0
	bl HideBg
	b _0809543A
_08095426:
	bl DoMonPlaceChange
	lsls r0, 24
	cmp r0, 0
	bne _0809546A
	movs r0, 0
	bl sub_8094D14
	bl sub_8095A58
_0809543A:
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _0809546A
_08095444:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0809546A
	movs r0, 0x3
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	bl sub_8094D40
	movs r0, 0
	bl ShowBg
	movs r0, 0
	b _0809546C
_0809546A:
	movs r0, 0x1
_0809546C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80953BC

	thumb_func_start sub_8095474
sub_8095474: @ 8095474
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080954B0
	cmp r0, 0x1
	bgt _0809548A
	cmp r0, 0
	beq _08095494
	b _08095518
_0809548A:
	cmp r1, 0x2
	beq _080954D0
	cmp r1, 0x3
	beq _080954F0
	b _08095518
_08095494:
	ldr r0, _080954AC @ =gUnknown_2039828
	ldr r1, [r0]
	ldrb r0, [r1, 0x9]
	cmp r0, 0
	beq _080954FE
	subs r0, 0x1
	strb r0, [r1, 0x9]
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	b _080954E4
	.align 2, 0
_080954AC: .4byte gUnknown_2039828
_080954B0:
	ldr r0, _080954CC @ =gUnknown_2039828
	ldr r1, [r0]
	ldrb r2, [r1, 0x9]
	ldrb r0, [r1, 0xB]
	adds r0, r2, r0
	cmp r0, 0x4
	bgt _080954FE
	adds r0, r2, 0x1
	strb r0, [r1, 0x9]
	movs r1, 0xFC
	lsls r1, 8
	movs r0, 0
	b _080954E4
	.align 2, 0
_080954CC: .4byte gUnknown_2039828
_080954D0:
	ldr r0, _080954EC @ =gUnknown_2039828
	ldr r1, [r0]
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _080954FE
	subs r0, 0x1
	strb r0, [r1, 0x8]
	movs r0, 0x80
	lsls r0, 3
	movs r1, 0
_080954E4:
	movs r2, 0x6
	bl sub_8095780
	b _08095518
	.align 2, 0
_080954EC: .4byte gUnknown_2039828
_080954F0:
	ldr r0, _08095504 @ =gUnknown_2039828
	ldr r1, [r0]
	ldrb r2, [r1, 0x8]
	ldrb r0, [r1, 0xA]
	adds r0, r2, r0
	cmp r0, 0x5
	ble _08095508
_080954FE:
	movs r0, 0
	b _0809551A
	.align 2, 0
_08095504: .4byte gUnknown_2039828
_08095508:
	adds r0, r2, 0x1
	strb r0, [r1, 0x8]
	movs r0, 0xFC
	lsls r0, 8
	movs r1, 0
	movs r2, 0x6
	bl sub_8095780
_08095518:
	movs r0, 0x1
_0809551A:
	pop {r1}
	bx r1
	thumb_func_end sub_8095474

	thumb_func_start sub_8095520
sub_8095520: @ 8095520
	push {r4-r7,lr}
	ldr r6, _080955C0 @ =gUnknown_2039828
	ldr r2, [r6]
	ldrb r3, [r2, 0x2]
	ldrb r5, [r2, 0x6]
	subs r1, r3, r5
	cmp r1, 0
	bge _08095532
	negs r1, r1
_08095532:
	ldrb r0, [r2, 0x4]
	subs r0, r3, r0
	cmp r0, 0
	bge _0809553C
	negs r0, r0
_0809553C:
	subs r0, r1, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x7]
	subs r3, r1, r0
	cmp r3, 0
	bge _0809554E
	negs r3, r3
_0809554E:
	ldrb r2, [r2, 0x5]
	subs r0, r1, r2
	cmp r0, 0
	bge _08095558
	negs r0, r0
_08095558:
	subs r0, r3, r0
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r0, r4, 16
	asrs r4, r0, 16
	cmp r4, 0
	ble _0809556C
	adds r0, r5, 0
	bl sub_80955C4
_0809556C:
	cmp r4, 0
	bge _08095588
	ldr r2, [r6]
	ldrb r0, [r2, 0x4]
	ldrb r1, [r2, 0x3]
	ldrb r2, [r2, 0x5]
	bl sub_8095634
	ldr r2, [r6]
	ldrb r0, [r2, 0x6]
	ldrb r1, [r2, 0x3]
	ldrb r2, [r2, 0x5]
	bl sub_80955C4
_08095588:
	lsls r0, r7, 16
	asrs r4, r0, 16
	cmp r4, 0
	ble _0809559C
	ldr r2, [r6]
	ldrb r0, [r2, 0x7]
	ldrb r1, [r2, 0x2]
	ldrb r2, [r2, 0x4]
	bl sub_80955FC
_0809559C:
	cmp r4, 0
	bge _080955B8
	ldr r2, [r6]
	ldrb r0, [r2, 0x5]
	ldrb r1, [r2, 0x2]
	ldrb r2, [r2, 0x4]
	bl sub_809566C
	ldr r2, [r6]
	ldrb r0, [r2, 0x7]
	ldrb r1, [r2, 0x2]
	ldrb r2, [r2, 0x4]
	bl sub_80955FC
_080955B8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080955C0: .4byte gUnknown_2039828
	thumb_func_end sub_8095520

	thumb_func_start sub_80955C4
sub_80955C4: @ 80955C4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r4, 0
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r5, 0
	cmp r4, r5
	bls _080955E2
	adds r4, r5, 0
	adds r5, r1, 0
	cmp r0, r5
	bhi _080955F4
_080955E2:
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	bl sub_80956A4
	cmp r4, r5
	bls _080955E2
_080955F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80955C4

	thumb_func_start sub_80955FC
sub_80955FC: @ 80955FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r4, 0
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r5, 0
	cmp r4, r5
	bls _0809561A
	adds r4, r5, 0
	adds r5, r1, 0
	cmp r0, r5
	bhi _0809562C
_0809561A:
	adds r0, r4, 0
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r6, 0
	bl sub_80956A4
	cmp r4, r5
	bls _0809561A
_0809562C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80955FC

	thumb_func_start sub_8095634
sub_8095634: @ 8095634
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r4, 0
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r5, 0
	cmp r4, r5
	bls _08095652
	adds r4, r5, 0
	adds r5, r1, 0
	cmp r0, r5
	bhi _08095664
_08095652:
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	bl sub_809572C
	cmp r4, r5
	bls _08095652
_08095664:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8095634

	thumb_func_start sub_809566C
sub_809566C: @ 809566C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r4, 0
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r5, 0
	cmp r4, r5
	bls _0809568A
	adds r4, r5, 0
	adds r5, r1, 0
	cmp r0, r5
	bhi _0809569C
_0809568A:
	adds r0, r4, 0
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r6, 0
	bl sub_809572C
	cmp r4, r5
	bls _0809568A
_0809569C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_809566C

	thumb_func_start sub_80956A4
sub_80956A4: @ 80956A4
	push {r4-r7,lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r7, r0, r1
	lsls r4, r7, 1
	adds r4, r6, r4
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x41
	bl GetCurrentBoxMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetCurrentBoxMonData
	adds r1, r0, 0
	cmp r5, 0
	beq _0809571A
	adds r0, r5, 0
	movs r2, 0x1
	bl GetMonIconPtr
	adds r4, r0, 0
	adds r0, r5, 0
	bl GetValidMonIconPalIndex
	adds r0, 0x8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08095724 @ =sPSSData
	ldr r1, [r1]
	ldr r2, _08095728 @ =0x000021f0
	adds r1, r2
	ldrb r3, [r1]
	movs r2, 0x20
	str r2, [sp]
	str r2, [sp, 0x4]
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 3
	str r1, [sp, 0x8]
	lsls r1, r7, 3
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	str r2, [sp, 0x14]
	str r0, [sp, 0x18]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow4BitTo8Bit
_0809571A:
	add sp, 0x1C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095724: .4byte sPSSData
_08095728: .4byte 0x000021f0
	thumb_func_end sub_80956A4

	thumb_func_start sub_809572C
sub_809572C: @ 809572C
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r5, r0, r1
	lsls r0, r5, 1
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x41
	bl GetCurrentBoxMonData
	lsls r0, 16
	cmp r0, 0
	beq _0809576E
	ldr r0, _08095778 @ =sPSSData
	ldr r0, [r0]
	ldr r1, _0809577C @ =0x000021f0
	adds r0, r1
	ldrb r0, [r0]
	lsls r2, r4, 1
	adds r2, r4
	lsls r2, 3
	lsls r3, r5, 3
	movs r1, 0x20
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0
	bl FillWindowPixelRect8Bit
_0809576E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095778: .4byte sPSSData
_0809577C: .4byte 0x000021f0
	thumb_func_end sub_809572C

	thumb_func_start sub_8095780
sub_8095780: @ 8095780
	ldr r3, _0809578C @ =gUnknown_2039828
	ldr r3, [r3]
	strh r0, [r3, 0xC]
	strh r1, [r3, 0xE]
	strh r2, [r3, 0x10]
	bx lr
	.align 2, 0
_0809578C: .4byte gUnknown_2039828
	thumb_func_end sub_8095780

	thumb_func_start sub_8095790
sub_8095790: @ 8095790
	push {r4,lr}
	ldr r4, _080957C4 @ =gUnknown_2039828
	ldr r1, [r4]
	ldrh r0, [r1, 0x10]
	cmp r0, 0
	beq _080957BA
	ldrh r1, [r1, 0xC]
	movs r0, 0
	movs r2, 0x1
	bl ChangeBgX
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	movs r0, 0
	movs r2, 0x1
	bl ChangeBgY
	ldr r1, [r4]
	ldrh r0, [r1, 0x10]
	subs r0, 0x1
	strh r0, [r1, 0x10]
_080957BA:
	ldr r0, [r4]
	ldrb r0, [r0, 0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080957C4: .4byte gUnknown_2039828
	thumb_func_end sub_8095790

	thumb_func_start sub_80957C8
sub_80957C8: @ 80957C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _0809589C @ =gUnknown_2039828
	ldr r1, [r4]
	ldrb r0, [r1, 0x4]
	ldrb r2, [r1, 0x2]
	cmp r0, r2
	bls _080957E0
	adds r0, r2, 0
_080957E0:
	strb r0, [r1, 0x8]
	ldr r1, [r4]
	ldrb r0, [r1, 0x5]
	ldrb r2, [r1, 0x3]
	cmp r0, r2
	bls _080957EE
	adds r0, r2, 0
_080957EE:
	strb r0, [r1, 0x9]
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x4]
	subs r0, r1, r0
	cmp r0, 0
	bge _080957FE
	negs r0, r0
_080957FE:
	adds r0, 0x1
	strb r0, [r2, 0xA]
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x5]
	subs r0, r1, r0
	cmp r0, 0
	bge _08095810
	negs r0, r0
_08095810:
	adds r0, 0x1
	strb r0, [r2, 0xB]
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r6, 0
	ldr r0, [r4]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r2, r1
	mov r8, r2
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r0, r1
	mov r9, r0
	adds r2, r1, 0
	cmp r2, r9
	bge _0809588C
_08095838:
	lsls r0, r2, 1
	adds r0, r2
	ldr r3, _0809589C @ =gUnknown_2039828
	ldr r1, [r3]
	lsls r0, 1
	ldrb r3, [r1, 0x8]
	adds r0, r3
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r4, [r1, 0x8]
	adds r7, r2, 0x1
	cmp r4, r8
	bge _08095886
	mov r0, r8
	subs r4, r0, r4
_08095856:
	mov r0, r10
	adds r1, r5, 0
	bl GetBoxedMonPtr
	adds r1, r0, 0
	ldr r2, _0809589C @ =gUnknown_2039828
	ldr r0, [r2]
	lsls r2, r6, 2
	adds r2, r6
	lsls r2, 4
	adds r0, r2
	adds r0, 0x14
	movs r2, 0x50
	bl memcpy
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bne _08095856
_08095886:
	adds r2, r7, 0
	cmp r2, r9
	blt _08095838
_0809588C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809589C: .4byte gUnknown_2039828
	thumb_func_end sub_80957C8

	thumb_func_start sub_80958A0
sub_80958A0: @ 80958A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, _08095914 @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r7, r2, r1
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r1, r0
	mov r9, r1
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, [r4]
	ldrb r2, [r0, 0x9]
	cmp r2, r9
	bge _08095908
_080958CC:
	lsls r0, r2, 1
	adds r0, r2
	ldr r1, _08095914 @ =gUnknown_2039828
	ldr r1, [r1]
	lsls r0, 1
	ldrb r3, [r1, 0x8]
	adds r0, r3
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r4, [r1, 0x8]
	adds r6, r2, 0x1
	cmp r4, r7
	bge _08095902
	subs r4, r7, r4
_080958E8:
	adds r0, r5, 0
	bl DestroyBoxMonIconAtPosition
	mov r0, r8
	adds r1, r5, 0
	bl ZeroBoxMonAt
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bne _080958E8
_08095902:
	adds r2, r6, 0
	cmp r2, r9
	blt _080958CC
_08095908:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095914: .4byte gUnknown_2039828
	thumb_func_end sub_80958A0

	thumb_func_start sub_8095918
sub_8095918: @ 8095918
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080959A4 @ =gUnknown_2039828
	ldr r0, [r0]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r2, r1
	mov r8, r2
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r0, r1
	mov r10, r0
	movs r6, 0
	adds r2, r1, 0
	cmp r2, r10
	bge _08095994
_0809593E:
	lsls r0, r2, 1
	adds r0, r2
	ldr r3, _080959A4 @ =gUnknown_2039828
	ldr r1, [r3]
	lsls r0, 1
	ldrb r4, [r1, 0x8]
	adds r0, r4
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r4, [r1, 0x8]
	adds r7, r2, 0x1
	cmp r4, r8
	bge _0809598E
	mov r9, r3
	mov r0, r8
	subs r4, r0, r4
_0809595E:
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 4
	adds r1, 0x14
	mov r2, r9
	ldr r0, [r2]
	adds r0, r1
	movs r1, 0x5
	bl GetBoxMonData
	cmp r0, 0
	beq _0809597C
	adds r0, r5, 0
	bl sub_80901EC
_0809597C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bne _0809595E
_0809598E:
	adds r2, r7, 0
	cmp r2, r10
	blt _0809593E
_08095994:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080959A4: .4byte gUnknown_2039828
	thumb_func_end sub_8095918

	thumb_func_start sub_80959A8
sub_80959A8: @ 80959A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, _08095A54 @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r2, r1
	mov r10, r2
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r1, r0
	str r1, [sp]
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r7, 0
	ldr r0, [r4]
	ldrb r3, [r0, 0x9]
	ldr r0, [sp]
	cmp r3, r0
	bge _08095A42
_080959DE:
	lsls r0, r3, 1
	adds r0, r3
	ldr r2, _08095A54 @ =gUnknown_2039828
	ldr r1, [r2]
	lsls r0, 1
	ldrb r4, [r1, 0x8]
	adds r0, r4
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r5, [r1, 0x8]
	adds r3, 0x1
	mov r9, r3
	cmp r5, r10
	bge _08095A3A
	mov r8, r2
	mov r0, r10
	subs r5, r0, r5
_08095A00:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 4
	adds r4, r0, 0
	adds r4, 0x14
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	movs r1, 0x5
	bl GetBoxMonData
	cmp r0, 0
	beq _08095A28
	mov r0, r8
	ldr r2, [r0]
	adds r2, r4
	ldr r0, [sp, 0x4]
	adds r1, r6, 0
	bl SetBoxMonAt
_08095A28:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	subs r5, 0x1
	cmp r5, 0
	bne _08095A00
_08095A3A:
	mov r3, r9
	ldr r1, [sp]
	cmp r3, r1
	blt _080959DE
_08095A42:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095A54: .4byte gUnknown_2039828
	thumb_func_end sub_80959A8

	thumb_func_start sub_8095A58
sub_8095A58: @ 8095A58
	push {lr}
	sub sp, 0x8
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	movs r1, 0x4
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x8
	movs r1, 0x80
	bl ClearGpuRegBits
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_8095A58

	thumb_func_start sub_8095AA0
sub_8095AA0: @ 8095AA0
	ldr r0, _08095AB8 @ =gUnknown_2039828
	ldr r2, [r0]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	ldrb r2, [r2, 0x2]
	adds r0, r2
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08095AB8: .4byte gUnknown_2039828
	thumb_func_end sub_8095AA0

	thumb_func_start sub_8095ABC
sub_8095ABC: @ 8095ABC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _08095B28 @ =gUnknown_2039828
	ldr r0, [r0]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r2, r1
	mov r9, r2
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r0, r1, r0
	str r0, [sp]
	movs r7, 0
	adds r6, r1, 0
	cmp r6, r0
	bge _08095B4A
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 1
	mov r8, r0
_08095AEC:
	ldr r2, _08095B28 @ =gUnknown_2039828
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	add r0, r8
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r4, [r1, 0x8]
	cmp r4, r9
	bge _08095B3E
	mov r10, r2
_08095B00:
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 4
	adds r1, 0x14
	mov r2, r10
	ldr r0, [r2]
	adds r0, r1
	movs r1, 0x5
	bl GetBoxMonData
	cmp r0, 0
	beq _08095B2C
	adds r0, r5, 0
	movs r1, 0x5
	bl GetCurrentBoxMonData
	cmp r0, 0
	beq _08095B2C
	movs r0, 0
	b _08095B4C
	.align 2, 0
_08095B28: .4byte gUnknown_2039828
_08095B2C:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x1
	cmp r4, r9
	blt _08095B00
_08095B3E:
	movs r0, 0x6
	add r8, r0
	adds r6, 0x1
	ldr r2, [sp]
	cmp r6, r2
	blt _08095AEC
_08095B4A:
	movs r0, 0x1
_08095B4C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8095ABC

	thumb_func_start sub_8095B5C
sub_8095B5C: @ 8095B5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r3, _08095C58 @ =sPSSData
	ldr r0, [r3]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095C3C
	ldr r0, _08095C5C @ =gUnknown_3000FE8
	str r0, [sp, 0x18]
	ldr r1, _08095C60 @ =0xffff0000
	add r2, sp, 0x18
	ldr r0, [r2, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	str r0, [r2, 0x4]
	mov r1, sp
	ldr r0, _08095C64 @ =gUnknown_83D3728
	ldm r0!, {r4-r6}
	stm r1!, {r4-r6}
	ldm r0!, {r4-r6}
	stm r1!, {r4-r6}
	movs r7, 0
	mov r9, r2
	mov r8, r3
	movs r0, 0
	mov r10, r0
_08095B9C:
	adds r6, r7, 0x7
	lsls r1, r6, 16
	mov r2, r9
	ldrh r0, [r2, 0x4]
	orrs r0, r1
	str r0, [r2, 0x4]
	mov r0, r9
	bl LoadCompressedSpriteSheet
	mov r4, r9
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	mov r5, r8
	ldr r1, [r5]
	lsls r5, r7, 4
	ldr r2, _08095C68 @ =0x000021f8
	adds r1, r2
	adds r1, r5
	lsls r0, 16
	lsrs r0, 11
	ldr r4, _08095C6C @ =0x06010000
	adds r0, r4
	str r0, [r1]
	ldr r0, _08095C70 @ =0xffffdacb
	adds r4, r7, r0
	lsls r0, r4, 16
	lsrs r0, 16
	bl AllocSpritePalette
	mov r2, r8
	ldr r1, [r2]
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08095C74 @ =0x000021fc
	adds r1, r2
	strh r0, [r1]
	ldrh r0, [r1]
	lsls r0, 4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2
	strh r0, [r1]
	mov r0, sp
	strh r6, [r0]
	strh r4, [r0, 0x2]
	movs r1, 0
	movs r2, 0
	movs r3, 0xB
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r4, r8
	ldr r2, [r4]
	ldr r6, _08095C78 @ =0x000021f4
	adds r2, r6
	adds r2, r5
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08095C7C @ =gSprites
	adds r1, r0
	str r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x88
	lsls r1, 6
	adds r0, r1
	mov r2, r10
	strb r2, [r0]
	adds r7, 0x1
	cmp r7, 0x2
	ble _08095B9C
_08095C3C:
	ldr r0, _08095C58 @ =sPSSData
	ldr r0, [r0]
	ldr r4, _08095C80 @ =0x00002224
	adds r0, r4
	movs r1, 0
	strh r1, [r0]
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095C58: .4byte sPSSData
_08095C5C: .4byte gUnknown_3000FE8
_08095C60: .4byte 0xffff0000
_08095C64: .4byte gUnknown_83D3728
_08095C68: .4byte 0x000021f8
_08095C6C: .4byte 0x06010000
_08095C70: .4byte 0xffffdacb
_08095C74: .4byte 0x000021fc
_08095C78: .4byte 0x000021f4
_08095C7C: .4byte gSprites
_08095C80: .4byte 0x00002224
	thumb_func_end sub_8095B5C

	thumb_func_start sub_8095C84
sub_8095C84: @ 8095C84
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _08095CB8 @ =sPSSData
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095D36
	mov r0, r8
	adds r1, r7, 0
	bl sub_8096210
	cmp r0, 0
	bne _08095D36
	mov r0, r8
	cmp r0, 0
	beq _08095CBC
	cmp r0, 0x1
	beq _08095CD2
	b _08095D36
	.align 2, 0
_08095CB8: .4byte sPSSData
_08095CBC:
	adds r0, r7, 0
	movs r1, 0x5
	bl GetCurrentBoxMonData
	cmp r0, 0
	beq _08095D36
	adds r0, r7, 0
	movs r1, 0xC
	bl GetCurrentBoxMonData
	b _08095CF0
_08095CD2:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08095D40 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _08095D36
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
_08095CF0:
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08095D36
	adds r0, r4, 0
	bl GetItemIconPic
	adds r6, r0, 0
	adds r0, r4, 0
	bl GetItemIconPalette
	adds r5, r0, 0
	bl sub_80961D8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	mov r1, r8
	adds r2, r7, 0
	bl sub_80962F0
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_8096408
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8096624
_08095D36:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095D40: .4byte gPlayerParty
	thumb_func_end sub_8095C84

	thumb_func_start sub_8095D44
sub_8095D44: @ 8095D44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08095D80 @ =sPSSData
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095D7A
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_80964E8
_08095D7A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095D80: .4byte sPSSData
	thumb_func_end sub_8095D44

	thumb_func_start Item_FromMonToMoving
Item_FromMonToMoving: @ 8095D84
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	ldr r0, _08095DE8 @ =sPSSData
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095E14
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x1
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_80964E8
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0
	bl sub_80962F0
	cmp r6, 0
	bne _08095DEC
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetCurrentBoxMonData
	adds r0, r5, 0
	movs r1, 0x1
	bl SetBoxMonIconObjMode
	b _08095E04
	.align 2, 0
_08095DE8: .4byte sPSSData
_08095DEC:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _08095E1C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r0, r7, 0
	movs r1, 0x1
	bl SetPartyMonIconObjMode
_08095E04:
	ldr r0, _08095E20 @ =sPSSData
	ldr r0, [r0]
	ldr r2, _08095E24 @ =0x00000ce2
	adds r1, r0, r2
	ldrh r1, [r1]
	ldr r2, _08095E28 @ =0x00002224
	adds r0, r2
	strh r1, [r0]
_08095E14:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095E1C: .4byte gPlayerParty
_08095E20: .4byte sPSSData
_08095E24: .4byte 0x00000ce2
_08095E28: .4byte 0x00002224
	thumb_func_end Item_FromMonToMoving

	thumb_func_start sub_8095E2C
sub_8095E2C: @ 8095E2C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r5, 0
	bl GetItemIconPic
	mov r8, r0
	adds r0, r5, 0
	bl GetItemIconPalette
	adds r6, r0, 0
	bl sub_80961D8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	mov r1, r8
	adds r2, r6, 0
	bl sub_8096408
	adds r0, r4, 0
	movs r1, 0x6
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0
	bl sub_80964E8
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0
	bl sub_80962F0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8096624
	ldr r0, _08095E98 @ =sPSSData
	ldr r0, [r0]
	ldr r1, _08095E9C @ =0x00002224
	adds r0, r1
	strh r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095E98: .4byte sPSSData
_08095E9C: .4byte 0x00002224
	thumb_func_end sub_8095E2C

	thumb_func_start Item_SwitchMonsWithMoving
Item_SwitchMonsWithMoving: @ 8095EA0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _08095F08 @ =sPSSData
	mov r8, r0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095F5E
	mov r0, r9
	adds r1, r7, 0
	bl sub_8096258
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0
	bl sub_80964E8
	mov r1, r9
	cmp r1, 0
	bne _08095F10
	adds r0, r7, 0
	movs r1, 0xC
	bl GetCurrentBoxMonData
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r8
	ldr r2, [r0]
	ldr r4, _08095F0C @ =0x00002224
	adds r2, r4
	adds r0, r7, 0
	movs r1, 0xC
	bl SetCurrentBoxMonData
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	b _08095F3C
	.align 2, 0
_08095F08: .4byte sPSSData
_08095F0C: .4byte 0x00002224
_08095F10:
	movs r0, 0x64
	adds r4, r7, 0
	muls r4, r0
	ldr r0, _08095F6C @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r8
	ldr r2, [r0]
	ldr r5, _08095F70 @ =0x00002224
	adds r2, r5
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5
_08095F3C:
	strh r6, [r0]
	movs r0, 0x2
	movs r1, 0
	bl sub_8096258
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x4
	mov r2, r9
	adds r3, r7, 0
	bl sub_80964E8
_08095F5E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095F6C: .4byte gPlayerParty
_08095F70: .4byte 0x00002224
	thumb_func_end Item_SwitchMonsWithMoving

	thumb_func_start Item_GiveMovingToMon
Item_GiveMovingToMon: @ 8095F74
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	ldr r6, _08095FCC @ =sPSSData
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095FF4
	movs r0, 0x2
	movs r1, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r7, 0
	adds r3, r5, 0
	bl sub_80964E8
	cmp r7, 0
	bne _08095FD4
	ldr r2, [r6]
	ldr r0, _08095FD0 @ =0x00002224
	adds r2, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl SetCurrentBoxMonData
	adds r0, r5, 0
	movs r1, 0
	bl SetBoxMonIconObjMode
	b _08095FF4
	.align 2, 0
_08095FCC: .4byte sPSSData
_08095FD0: .4byte 0x00002224
_08095FD4:
	movs r0, 0x64
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _08096000 @ =gPlayerParty
	adds r0, r1
	ldr r2, [r6]
	ldr r1, _08096004 @ =0x00002224
	adds r2, r1
	movs r1, 0xC
	bl SetMonData
	mov r0, r8
	movs r1, 0
	bl SetPartyMonIconObjMode
_08095FF4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096000: .4byte gPlayerParty
_08096004: .4byte 0x00002224
	thumb_func_end Item_GiveMovingToMon

	thumb_func_start Item_TakeMons
Item_TakeMons: @ 8096008
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	ldr r0, _08096060 @ =sPSSData
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _0809607C
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_80964E8
	cmp r6, 0
	bne _08096064
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetCurrentBoxMonData
	adds r0, r5, 0
	movs r1, 0x1
	bl SetBoxMonIconObjMode
	b _0809607C
	.align 2, 0
_08096060: .4byte sPSSData
_08096064:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _08096084 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r0, r7, 0
	movs r1, 0x1
	bl SetPartyMonIconObjMode
_0809607C:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096084: .4byte gPlayerParty
	thumb_func_end Item_TakeMons

	thumb_func_start sub_8096088
sub_8096088: @ 8096088
	push {r4,lr}
	ldr r0, _080960BC @ =sPSSData
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _080960B6
	movs r0, 0x2
	movs r1, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_80964E8
_080960B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080960BC: .4byte sPSSData
	thumb_func_end sub_8096088

	thumb_func_start sub_80960C0
sub_80960C0: @ 80960C0
	push {r4,lr}
	ldr r0, _08096108 @ =sPSSData
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08096100
	movs r4, 0
_080960CE:
	ldr r0, _08096108 @ =sPSSData
	ldr r1, [r0]
	lsls r0, r4, 4
	adds r1, r0
	movs r2, 0x88
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080960FA
	subs r2, 0x2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080960FA
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0x7
	movs r2, 0x2
	movs r3, 0
	bl sub_80964E8
_080960FA:
	adds r4, 0x1
	cmp r4, 0x2
	ble _080960CE
_08096100:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096108: .4byte sPSSData
	thumb_func_end sub_80960C0

	thumb_func_start sub_809610C
sub_809610C: @ 809610C
	push {r4,r5,lr}
	movs r5, 0
	ldr r0, _08096148 @ =sPSSData
	ldr r0, [r0]
	ldr r1, _0809614C @ =0x000021f4
	adds r4, r0, r1
	adds r3, r0, 0
_0809611A:
	movs r1, 0x88
	lsls r1, 6
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08096158
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x28
	ands r0, r1
	cmp r0, 0x8
	beq _08096144
	ldr r1, [r2, 0x1C]
	ldr r0, _08096150 @ =SpriteCallbackDummy
	cmp r1, r0
	beq _08096158
	ldr r0, _08096154 @ =sub_80969BC
	cmp r1, r0
	beq _08096158
_08096144:
	movs r0, 0x1
	b _08096164
	.align 2, 0
_08096148: .4byte sPSSData
_0809614C: .4byte 0x000021f4
_08096150: .4byte SpriteCallbackDummy
_08096154: .4byte sub_80969BC
_08096158:
	adds r4, 0x10
	adds r3, 0x10
	adds r5, 0x1
	cmp r5, 0x2
	ble _0809611A
	movs r0, 0
_08096164:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809610C

	thumb_func_start IsActiveItemMoving
IsActiveItemMoving: @ 809616C
	push {lr}
	ldr r0, _08096190 @ =sPSSData
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x3
	bne _080961A0
	movs r2, 0
	ldr r0, _08096194 @ =0x000021fe
	adds r1, r0
_0809617E:
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _08096198
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _08096198
	movs r0, 0x1
	b _080961A2
	.align 2, 0
_08096190: .4byte sPSSData
_08096194: .4byte 0x000021fe
_08096198:
	adds r1, 0x10
	adds r2, 0x1
	cmp r2, 0x2
	ble _0809617E
_080961A0:
	movs r0, 0
_080961A2:
	pop {r1}
	bx r1
	thumb_func_end IsActiveItemMoving

	thumb_func_start GetMovingItemName
GetMovingItemName: @ 80961A8
	push {lr}
	ldr r0, _080961BC @ =sPSSData
	ldr r0, [r0]
	ldr r1, _080961C0 @ =0x00002224
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetName
	pop {r1}
	bx r1
	.align 2, 0
_080961BC: .4byte sPSSData
_080961C0: .4byte 0x00002224
	thumb_func_end GetMovingItemName

	thumb_func_start GetMovingItem
GetMovingItem: @ 80961C4
	ldr r0, _080961D0 @ =sPSSData
	ldr r0, [r0]
	ldr r1, _080961D4 @ =0x00002224
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080961D0: .4byte sPSSData
_080961D4: .4byte 0x00002224
	thumb_func_end GetMovingItem

	thumb_func_start sub_80961D8
sub_80961D8: @ 80961D8
	push {r4,r5,lr}
	movs r2, 0
	ldr r5, _080961F8 @ =sPSSData
	movs r3, 0x88
	lsls r3, 6
	movs r4, 0x1
_080961E4:
	ldr r0, [r5]
	lsls r1, r2, 4
	adds r0, r1
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, 0
	bne _080961FC
	strb r4, [r1]
	adds r0, r2, 0
	b _08096208
	.align 2, 0
_080961F8: .4byte sPSSData
_080961FC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080961E4
	movs r0, 0x3
_08096208:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80961D8

	thumb_func_start sub_8096210
sub_8096210: @ 8096210
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	ldr r0, _08096244 @ =sPSSData
	ldr r2, [r0]
_08096220:
	movs r5, 0x88
	lsls r5, 6
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _08096248
	subs r5, 0x2
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r4
	bne _08096248
	adds r5, 0x1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r1
	bne _08096248
	movs r0, 0x1
	b _08096252
	.align 2, 0
_08096244: .4byte sPSSData
_08096248:
	adds r2, 0x10
	adds r3, 0x1
	cmp r3, 0x2
	ble _08096220
	movs r0, 0
_08096252:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8096210

	thumb_func_start sub_8096258
sub_8096258: @ 8096258
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r0, _08096290 @ =sPSSData
	ldr r1, [r0]
_08096268:
	lsls r0, r3, 4
	adds r2, r1, r0
	movs r6, 0x88
	lsls r6, 6
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, 0
	beq _08096294
	subs r6, 0x2
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _08096294
	adds r6, 0x1
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r4
	bne _08096294
	adds r0, r3, 0
	b _080962A0
	.align 2, 0
_08096290: .4byte sPSSData
_08096294:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _08096268
	movs r0, 0x3
_080962A0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8096258

	thumb_func_start sub_80962A8
sub_80962A8: @ 80962A8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r2, 0
	ldr r0, _080962D4 @ =sPSSData
	ldr r3, [r0]
	ldr r0, _080962D8 @ =0x000021f4
	adds r4, r3, r0
	movs r6, 0x88
	lsls r6, 6
_080962BA:
	lsls r1, r2, 4
	adds r0, r3, r1
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0
	beq _080962DC
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, r5
	bne _080962DC
	adds r0, r2, 0
	b _080962E8
	.align 2, 0
_080962D4: .4byte sPSSData
_080962D8: .4byte 0x000021f4
_080962DC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080962BA
	movs r0, 0x3
_080962E8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80962A8

	thumb_func_start sub_80962F0
sub_80962F0: @ 80962F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	cmp r5, 0x2
	bhi _080963EE
	cmp r1, 0
	beq _0809631C
	cmp r1, 0x1
	beq _08096378
	ldr r4, _08096318 @ =sPSSData
	lsls r3, r5, 4
	b _080963D8
	.align 2, 0
_08096318: .4byte sPSSData
_0809631C:
	adds r0, r7, 0
	movs r1, 0x6
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08096370 @ =sPSSData
	ldr r2, [r6]
	lsls r5, 4
	ldr r1, _08096374 @ =0x000021f4
	adds r2, r1
	adds r2, r5
	ldr r3, [r2]
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 3
	adds r1, 0x70
	strh r1, [r3, 0x20]
	ldr r3, [r2]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, 0x38
	strh r1, [r3, 0x22]
	ldr r2, [r2]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x5]
	adds r4, r6, 0
	adds r3, r5, 0
	b _080963D8
	.align 2, 0
_08096370: .4byte sPSSData
_08096374: .4byte 0x000021f4
_08096378:
	cmp r7, 0
	bne _080963A0
	ldr r4, _08096398 @ =sPSSData
	ldr r0, [r4]
	lsls r3, r5, 4
	ldr r1, _0809639C @ =0x000021f4
	adds r0, r1
	adds r0, r3
	ldr r2, [r0]
	movs r1, 0x74
	strh r1, [r2, 0x20]
	ldr r1, [r0]
	movs r0, 0x4C
	strh r0, [r1, 0x22]
	b _080963C0
	.align 2, 0
_08096398: .4byte sPSSData
_0809639C: .4byte 0x000021f4
_080963A0:
	ldr r4, _080963F8 @ =sPSSData
	ldr r0, [r4]
	lsls r3, r5, 4
	ldr r1, _080963FC @ =0x000021f4
	adds r0, r1
	adds r0, r3
	ldr r2, [r0]
	movs r1, 0xA4
	strh r1, [r2, 0x20]
	ldr r2, [r0]
	subs r1, r7, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x1C
	strh r0, [r2, 0x22]
_080963C0:
	ldr r0, [r4]
	ldr r1, _080963FC @ =0x000021f4
	adds r0, r1
	adds r0, r3
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
_080963D8:
	ldr r0, [r4]
	adds r0, r3
	ldr r1, _08096400 @ =0x000021fe
	adds r0, r1
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r3
	ldr r1, _08096404 @ =0x000021ff
	adds r0, r1
	strb r7, [r0]
_080963EE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080963F8: .4byte sPSSData
_080963FC: .4byte 0x000021f4
_08096400: .4byte 0x000021fe
_08096404: .4byte 0x000021ff
	thumb_func_end sub_80962F0

	thumb_func_start sub_8096408
sub_8096408: @ 8096408
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r8, r1
	mov r9, r2
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bhi _08096490
	movs r0, 0
	str r0, [sp]
	ldr r4, _080964A0 @ =sPSSData
	ldr r1, [r4]
	ldr r6, _080964A4 @ =0x000042bc
	adds r1, r6
	ldr r2, _080964A8 @ =0x01000080
	mov r0, sp
	bl CpuFastSet
	ldr r1, [r4]
	ldr r5, _080964AC @ =0x000022bc
	adds r1, r5
	mov r0, r8
	bl LZ77UnCompWram
	lsls r7, 4
	mov r8, r7
	adds r7, r4, 0
	movs r4, 0x2
_08096446:
	ldr r1, [r7]
	adds r0, r1, r5
	adds r1, r6
	movs r2, 0x18
	bl CpuFastSet
	adds r6, 0x80
	adds r5, 0x60
	subs r4, 0x1
	cmp r4, 0
	bge _08096446
	ldr r5, _080964A0 @ =sPSSData
	ldr r1, [r5]
	ldr r4, _080964A4 @ =0x000042bc
	adds r0, r1, r4
	ldr r2, _080964B0 @ =0x000021f8
	adds r1, r2
	add r1, r8
	ldr r1, [r1]
	movs r2, 0x80
	bl CpuFastSet
	ldr r1, [r5]
	adds r1, r4
	mov r0, r9
	bl LZ77UnCompWram
	ldr r0, [r5]
	adds r4, r0, r4
	add r0, r8
	ldr r1, _080964B4 @ =0x000021fc
	adds r0, r1
	ldrh r1, [r0]
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
_08096490:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080964A0: .4byte sPSSData
_080964A4: .4byte 0x000042bc
_080964A8: .4byte 0x01000080
_080964AC: .4byte 0x000022bc
_080964B0: .4byte 0x000021f8
_080964B4: .4byte 0x000021fc
	thumb_func_end sub_8096408

	thumb_func_start sub_80964B8
sub_80964B8: @ 80964B8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r2, 0x2
	bhi _080964DA
	ldr r0, _080964E0 @ =sPSSData
	ldr r0, [r0]
	lsls r1, r2, 4
	ldr r2, _080964E4 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r0, [r0]
	adds r1, r3, 0
	bl StartSpriteAffineAnim
_080964DA:
	pop {r0}
	bx r0
	.align 2, 0
_080964E0: .4byte sPSSData
_080964E4: .4byte 0x000021f4
	thumb_func_end sub_80964B8

	thumb_func_start sub_80964E8
sub_80964E8: @ 80964E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r3, 24
	cmp r4, 0x2
	bls _08096500
	b _08096612
_08096500:
	cmp r0, 0x7
	bls _08096506
	b _08096612
_08096506:
	lsls r0, 2
	ldr r1, _08096510 @ =_08096514
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096510: .4byte _08096514
	.align 2, 0
_08096514:
	.4byte _08096534
	.4byte _08096558
	.4byte _0809657C
	.4byte _080965A8
	.4byte _080965D4
	.4byte _08096612
	.4byte _08096612
	.4byte _08096600
_08096534:
	ldr r0, _0809654C @ =sPSSData
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _08096550 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
	strh r4, [r1, 0x2E]
	ldr r1, [r0]
	ldr r0, _08096554 @ =sub_809692C
	b _08096610
	.align 2, 0
_0809654C: .4byte sPSSData
_08096550: .4byte 0x000021f4
_08096554: .4byte sub_809692C
_08096558:
	ldr r0, _08096570 @ =sPSSData
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _08096574 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	movs r1, 0
	strh r1, [r2, 0x2E]
	ldr r1, [r0]
	ldr r0, _08096578 @ =sub_8096958
	b _08096610
	.align 2, 0
_08096570: .4byte sPSSData
_08096574: .4byte 0x000021f4
_08096578: .4byte sub_8096958
_0809657C:
	ldr r0, _0809659C @ =sPSSData
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _080965A0 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	movs r1, 0
	strh r1, [r2, 0x2E]
	ldr r1, [r0]
	strh r5, [r1, 0x3A]
	ldr r1, [r0]
	strh r3, [r1, 0x3C]
	ldr r1, [r0]
	ldr r0, _080965A4 @ =sub_80969F4
	b _08096610
	.align 2, 0
_0809659C: .4byte sPSSData
_080965A0: .4byte 0x000021f4
_080965A4: .4byte sub_80969F4
_080965A8:
	ldr r0, _080965C8 @ =sPSSData
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _080965CC @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	movs r1, 0
	strh r1, [r2, 0x2E]
	ldr r2, [r0]
	ldr r1, _080965D0 @ =sub_8096A74
	str r1, [r2, 0x1C]
	strh r5, [r2, 0x3A]
	ldr r0, [r0]
	strh r3, [r0, 0x3C]
	b _08096612
	.align 2, 0
_080965C8: .4byte sPSSData
_080965CC: .4byte 0x000021f4
_080965D0: .4byte sub_8096A74
_080965D4:
	ldr r0, _080965F4 @ =sPSSData
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _080965F8 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	movs r1, 0
	strh r1, [r2, 0x2E]
	ldr r1, [r0]
	strh r5, [r1, 0x3A]
	ldr r1, [r0]
	strh r3, [r1, 0x3C]
	ldr r1, [r0]
	ldr r0, _080965FC @ =sub_8096B10
	b _08096610
	.align 2, 0
_080965F4: .4byte sPSSData
_080965F8: .4byte 0x000021f4
_080965FC: .4byte sub_8096B10
_08096600:
	ldr r0, _08096618 @ =sPSSData
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _0809661C @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _08096620 @ =sub_8096BAC
_08096610:
	str r0, [r1, 0x1C]
_08096612:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096618: .4byte sPSSData
_0809661C: .4byte 0x000021f4
_08096620: .4byte sub_8096BAC
	thumb_func_end sub_80964E8

	thumb_func_start sub_8096624
sub_8096624: @ 8096624
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r2, 0x2
	bhi _08096666
	ldr r1, _0809666C @ =sPSSData
	ldr r0, [r1]
	lsls r2, 4
	adds r0, r2
	movs r3, 0x88
	lsls r3, 6
	adds r0, r3
	strb r4, [r0]
	ldr r0, [r1]
	ldr r1, _08096670 @ =0x000021f4
	adds r0, r1
	adds r0, r2
	ldr r0, [r0]
	movs r3, 0
	cmp r4, 0
	bne _08096654
	movs r3, 0x1
_08096654:
	adds r2, r0, 0
	adds r2, 0x3E
	lsls r3, 2
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_08096666:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809666C: .4byte sPSSData
_08096670: .4byte 0x000021f4
	thumb_func_end sub_8096624

	thumb_func_start GetItemIconPic
GetItemIconPic: @ 8096674
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl GetItemIconGfxPtr
	pop {r1}
	bx r1
	thumb_func_end GetItemIconPic

	thumb_func_start GetItemIconPalette
GetItemIconPalette: @ 8096684
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetItemIconGfxPtr
	pop {r1}
	bx r1
	thumb_func_end GetItemIconPalette

	thumb_func_start PrintItemDescription
PrintItemDescription: @ 8096694
	push {r4,lr}
	sub sp, 0x14
	bl IsActiveItemMoving
	lsls r0, 24
	cmp r0, 0
	beq _080966B4
	ldr r0, _080966AC @ =sPSSData
	ldr r0, [r0]
	ldr r1, _080966B0 @ =0x00002224
	b _080966BA
	.align 2, 0
_080966AC: .4byte sPSSData
_080966B0: .4byte 0x00002224
_080966B4:
	ldr r0, _080966EC @ =sPSSData
	ldr r0, [r0]
	ldr r1, _080966F0 @ =0x00000ce2
_080966BA:
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetDescription
	adds r4, r0, 0
	movs r0, 0x2
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x2
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0x2
	bl AddTextPrinterParameterized5
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080966EC: .4byte sPSSData
_080966F0: .4byte 0x00000ce2
	thumb_func_end PrintItemDescription

	thumb_func_start sub_80966F4
sub_80966F4: @ 80966F4
	push {lr}
	ldr r0, _0809671C @ =sPSSData
	ldr r0, [r0]
	ldr r1, _08096720 @ =0x00002226
	adds r0, r1
	movs r1, 0x19
	strh r1, [r0]
	ldr r1, _08096724 @ =gUnknown_83D35DC
	movs r3, 0xD2
	lsls r3, 1
	movs r0, 0
	movs r2, 0x80
	bl LoadBgTiles
	movs r0, 0
	bl sub_8096898
	pop {r0}
	bx r0
	.align 2, 0
_0809671C: .4byte sPSSData
_08096720: .4byte 0x00002226
_08096724: .4byte gUnknown_83D35DC
	thumb_func_end sub_80966F4

	thumb_func_start sub_8096728
sub_8096728: @ 8096728
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r0, _08096740 @ =sPSSData
	ldr r0, [r0]
	ldr r2, _08096744 @ =0x00002226
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0
	bne _08096748
	movs r0, 0
	b _080967AE
	.align 2, 0
_08096740: .4byte sPSSData
_08096744: .4byte 0x00002226
_08096748:
	subs r0, 0x1
	strh r0, [r1]
	ldrh r1, [r1]
	movs r0, 0x19
	subs r5, r0, r1
	movs r4, 0
	cmp r4, r5
	bge _08096798
_08096758:
	movs r0, 0
	movs r1, 0xA
	bl GetBgAttribute
	adds r1, r0, 0
	ldr r0, _080967B8 @ =sPSSData
	ldr r0, [r0]
	ldr r2, _080967BC @ =0x00002226
	adds r0, r2
	adds r1, 0x14
	ldrh r0, [r0]
	adds r1, r0
	adds r1, r4
	lsls r1, 16
	lsrs r1, 16
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0x19
	str r0, [sp, 0xC]
	movs r0, 0
	movs r3, 0xC
	bl WriteSequenceToBgTilemapBuffer
	adds r4, 0x1
	cmp r4, r5
	blt _08096758
_08096798:
	adds r0, r5, 0
	bl sub_8096898
	ldr r0, _080967B8 @ =sPSSData
	ldr r0, [r0]
	ldr r1, _080967BC @ =0x00002226
	adds r0, r1
	ldrh r1, [r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_080967AE:
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080967B8: .4byte sPSSData
_080967BC: .4byte 0x00002226
	thumb_func_end sub_8096728

	thumb_func_start sub_80967C0
sub_80967C0: @ 80967C0
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r5, _080967D8 @ =sPSSData
	ldr r0, [r5]
	ldr r4, _080967DC @ =0x00002226
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0x19
	bne _080967E0
	movs r0, 0
	b _08096886
	.align 2, 0
_080967D8: .4byte sPSSData
_080967DC: .4byte 0x00002226
_080967E0:
	cmp r0, 0
	bne _080967FC
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x19
	movs r3, 0xB
	bl FillBgTilemapBufferRect
_080967FC:
	ldr r1, [r5]
	adds r1, r4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrh r1, [r1]
	movs r0, 0x19
	subs r5, r0, r1
	movs r4, 0
	cmp r4, r5
	bge _08096852
_08096812:
	movs r0, 0
	movs r1, 0xA
	bl GetBgAttribute
	adds r1, r0, 0
	ldr r0, _08096890 @ =sPSSData
	ldr r0, [r0]
	ldr r2, _08096894 @ =0x00002226
	adds r0, r2
	adds r1, 0x14
	ldrh r0, [r0]
	adds r1, r0
	adds r1, r4
	lsls r1, 16
	lsrs r1, 16
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0x19
	str r0, [sp, 0xC]
	movs r0, 0
	movs r3, 0xC
	bl WriteSequenceToBgTilemapBuffer
	adds r4, 0x1
	cmp r4, r5
	blt _08096812
_08096852:
	adds r0, r5, 0
	bl sub_8096898
	lsls r2, r5, 24
	lsrs r2, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	ldr r0, _08096890 @ =sPSSData
	ldr r0, [r0]
	ldr r1, _08096894 @ =0x00002226
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x19
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_08096886:
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08096890: .4byte sPSSData
_08096894: .4byte 0x00002226
	thumb_func_end sub_80967C0

	thumb_func_start sub_8096898
sub_8096898: @ 8096898
	push {r4-r7,lr}
	sub sp, 0xC
	adds r7, r0, 0
	cmp r7, 0
	beq _080968D0
	movs r1, 0xD2
	lsls r1, 1
	lsls r4, r7, 24
	lsrs r4, 24
	str r4, [sp]
	movs r6, 0x1
	str r6, [sp, 0x4]
	movs r5, 0xF
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	ldr r1, _08096920 @ =0x000009a4
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0x14
	bl FillBgTilemapBufferRect
_080968D0:
	ldr r1, _08096924 @ =0x000001a5
	lsls r5, r7, 24
	lsrs r5, 24
	movs r4, 0x1
	str r4, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	movs r6, 0xF
	str r6, [sp, 0x8]
	movs r0, 0
	adds r2, r5, 0
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	movs r1, 0xD3
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	adds r2, r5, 0
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	ldr r1, _08096928 @ =0x000001a7
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	adds r2, r5, 0
	movs r3, 0x14
	bl FillBgTilemapBufferRect
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096920: .4byte 0x000009a4
_08096924: .4byte 0x000001a5
_08096928: .4byte 0x000001a7
	thumb_func_end sub_8096898

	thumb_func_start sub_809692C
sub_809692C: @ 809692C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0809694C
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8096624
	ldr r0, _08096954 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_0809694C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096954: .4byte SpriteCallbackDummy
	thumb_func_end sub_809692C

	thumb_func_start sub_8096958
sub_8096958: @ 8096958
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _0809696A
	cmp r1, 0x1
	beq _08096986
	b _080969B4
_0809696A:
	ldrh r0, [r3, 0x20]
	lsls r0, 4
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x22]
	lsls r0, 4
	strh r0, [r3, 0x32]
	movs r0, 0xA
	strh r0, [r3, 0x34]
	movs r0, 0x15
	strh r0, [r3, 0x36]
	strh r1, [r3, 0x38]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
_08096986:
	ldrh r1, [r3, 0x30]
	ldrh r0, [r3, 0x34]
	subs r1, r0
	strh r1, [r3, 0x30]
	ldrh r0, [r3, 0x32]
	ldrh r2, [r3, 0x36]
	subs r0, r2
	strh r0, [r3, 0x32]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r3, 0x20]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r3, 0x22]
	ldrh r0, [r3, 0x38]
	adds r0, 0x1
	strh r0, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _080969B4
	ldr r0, _080969B8 @ =sub_80969BC
	str r0, [r3, 0x1C]
_080969B4:
	pop {r0}
	bx r0
	.align 2, 0
_080969B8: .4byte sub_80969BC
	thumb_func_end sub_8096958

	thumb_func_start sub_80969BC
sub_80969BC: @ 80969BC
	ldr r1, _080969F0 @ =sPSSData
	ldr r3, [r1]
	movs r1, 0xCB
	lsls r1, 4
	adds r3, r1
	ldr r1, [r3]
	ldrh r1, [r1, 0x20]
	adds r1, 0x4
	strh r1, [r0, 0x20]
	ldr r2, [r3]
	ldrh r1, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r1, r2
	adds r1, 0x8
	strh r1, [r0, 0x22]
	ldr r1, [r3]
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	bx lr
	.align 2, 0
_080969F0: .4byte sPSSData
	thumb_func_end sub_80969BC

	thumb_func_start sub_80969F4
sub_80969F4: @ 80969F4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08096A06
	cmp r1, 0x1
	beq _08096A22
	b _08096A6A
_08096A06:
	ldrh r0, [r4, 0x20]
	lsls r0, 4
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0xA
	strh r0, [r4, 0x34]
	movs r0, 0x15
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08096A22:
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	ldrh r2, [r4, 0x32]
	adds r1, r2
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x22]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _08096A6A
	adds r0, r4, 0
	bl sub_80962A8
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	bl sub_80962F0
	ldr r0, _08096A70 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_08096A6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096A70: .4byte SpriteCallbackDummy
	thumb_func_end sub_80969F4

	thumb_func_start sub_8096A74
sub_8096A74: @ 8096A74
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08096A86
	cmp r1, 0x1
	beq _08096AA2
	b _08096B00
_08096A86:
	ldrh r0, [r4, 0x20]
	lsls r0, 4
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0xA
	strh r0, [r4, 0x34]
	movs r0, 0x15
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08096AA2:
	ldrh r1, [r4, 0x30]
	ldrh r0, [r4, 0x34]
	subs r1, r0
	strh r1, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	subs r0, r2
	strh r0, [r4, 0x32]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x20]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x22]
	ldr r1, _08096B08 @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 4
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _08096B00
	adds r0, r4, 0
	bl sub_80962A8
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	bl sub_80962F0
	movs r0, 0
	strh r0, [r4, 0x24]
	ldr r0, _08096B0C @ =sub_80969BC
	str r0, [r4, 0x1C]
_08096B00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096B08: .4byte gSineTable
_08096B0C: .4byte sub_80969BC
	thumb_func_end sub_8096A74

	thumb_func_start sub_8096B10
sub_8096B10: @ 8096B10
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08096B22
	cmp r1, 0x1
	beq _08096B3E
	b _08096B9E
_08096B22:
	ldrh r0, [r4, 0x20]
	lsls r0, 4
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0xA
	strh r0, [r4, 0x34]
	movs r0, 0x15
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08096B3E:
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	ldrh r2, [r4, 0x32]
	adds r1, r2
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x22]
	ldr r1, _08096BA4 @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 4
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _08096B9E
	adds r0, r4, 0
	bl sub_80962A8
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	bl sub_80962F0
	ldr r0, _08096BA8 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x24]
_08096B9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096BA4: .4byte gSineTable
_08096BA8: .4byte SpriteCallbackDummy
	thumb_func_end sub_8096B10

	thumb_func_start sub_8096BAC
sub_8096BAC: @ 8096BAC
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x22]
	subs r0, 0x8
	strh r0, [r2, 0x22]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _08096BDC
	ldr r0, _08096BE0 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
	adds r0, r2, 0
	bl sub_80962A8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8096624
_08096BDC:
	pop {r0}
	bx r0
	.align 2, 0
_08096BE0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8096BAC

	thumb_func_start sub_8096BE4
sub_8096BE4: @ 8096BE4
	ldr r3, _08096BF4 @ =gUnknown_203982C
	str r0, [r3]
	str r1, [r0]
	movs r1, 0
	strb r2, [r0, 0x5]
	strb r1, [r0, 0x4]
	bx lr
	.align 2, 0
_08096BF4: .4byte gUnknown_203982C
	thumb_func_end sub_8096BE4

	thumb_func_start sub_8096BF8
sub_8096BF8: @ 8096BF8
	push {r4,r5,lr}
	ldr r2, _08096C3C @ =gUnknown_203982C
	ldr r1, [r2]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08096C36
	movs r4, 0
	ldrb r1, [r1, 0x4]
	cmp r4, r1
	bcs _08096C2E
	adds r5, r2, 0
_08096C0E:
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 2
	ldr r0, [r0]
	adds r0, r1
	ldr r1, [r0, 0x10]
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	cmp r4, r0
	bcc _08096C0E
_08096C2E:
	ldr r0, _08096C3C @ =gUnknown_203982C
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x4]
_08096C36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096C3C: .4byte gUnknown_203982C
	thumb_func_end sub_8096BF8

	thumb_func_start sub_8096C40
sub_8096C40: @ 8096C40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	mov r10, r3
	ldr r0, [sp, 0x24]
	ldr r3, [sp, 0x28]
	ldr r4, [sp, 0x2C]
	ldr r5, [sp, 0x30]
	ldr r6, [sp, 0x34]
	lsls r1, 16
	lsrs r1, 16
	mov r12, r1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp]
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _08096CC0 @ =gUnknown_203982C
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0
	ldrb r7, [r2, 0x5]
	cmp r1, r7
	bcs _08096CC8
	adds r0, 0x1
	strb r0, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, [r2]
	adds r1, r0
	lsls r0, r4, 1
	strh r0, [r1, 0x8]
	ldr r2, [sp]
	lsls r0, r2, 5
	add r0, r12
	lsls r0, 1
	add r0, r9
	str r0, [r1, 0x4]
	adds r0, r3, 0
	muls r0, r6
	add r0, r8
	lsls r0, 1
	add r0, r10
	str r0, [r1]
	strh r5, [r1, 0xC]
	strh r6, [r1, 0xA]
	ldr r0, _08096CC4 @ =sub_8096CDC
	str r0, [r1, 0x10]
	movs r0, 0x1
	b _08096CCA
	.align 2, 0
_08096CC0: .4byte gUnknown_203982C
_08096CC4: .4byte sub_8096CDC
_08096CC8:
	movs r0, 0
_08096CCA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8096C40

	thumb_func_start sub_8096CDC
sub_8096CDC: @ 8096CDC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	b _08096D06
_08096CE4:
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	ldrh r2, [r4, 0x8]
	lsrs r2, 1
	bl CpuSet
	ldr r0, [r4, 0x4]
	adds r0, 0x40
	str r0, [r4, 0x4]
	ldrh r1, [r4, 0xA]
	lsls r1, 1
	ldr r0, [r4]
	adds r0, r1
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08096D06:
	ldrh r0, [r4, 0xC]
	cmp r5, r0
	bcc _08096CE4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8096CDC

	thumb_func_start sub_8096D14
sub_8096D14: @ 8096D14
	push {r4-r7,lr}
	mov r12, r0
	ldr r0, [sp, 0x14]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08096D60 @ =gUnknown_203982C
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0
	ldrb r7, [r2, 0x5]
	cmp r1, r7
	bcs _08096D68
	adds r0, 0x1
	strb r0, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, [r2]
	adds r1, r0
	lsls r0, r3, 1
	strh r0, [r1, 0x8]
	lsls r0, r4, 5
	adds r0, r6
	lsls r0, 1
	add r0, r12
	str r0, [r1, 0x4]
	strh r5, [r1, 0xC]
	ldr r0, _08096D64 @ =sub_8096D70
	str r0, [r1, 0x10]
	movs r0, 0x1
	b _08096D6A
	.align 2, 0
_08096D60: .4byte gUnknown_203982C
_08096D64: .4byte sub_8096D70
_08096D68:
	movs r0, 0
_08096D6A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8096D14

	thumb_func_start sub_8096D70
sub_8096D70: @ 8096D70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r0, 0
	movs r0, 0
	ldrh r1, [r6, 0xC]
	cmp r0, r1
	bcs _08096DFE
	movs r7, 0x80
	lsls r7, 5
	mov r5, sp
	ldr r2, _08096DBC @ =0x040000d4
	mov r8, r2
	movs r1, 0x81
	lsls r1, 24
	mov r10, r1
_08096D96:
	ldr r2, [r6, 0x4]
	ldrh r3, [r6, 0x8]
	mov r12, r2
	adds r0, 0x1
	mov r9, r0
	cmp r3, r7
	bhi _08096DC0
	movs r0, 0
	strh r0, [r5]
	mov r2, sp
	mov r0, r8
	str r2, [r0]
	mov r1, r12
	str r1, [r0, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
	mov r1, r8
	b _08096DE8
	.align 2, 0
_08096DBC: .4byte 0x040000d4
_08096DC0:
	movs r4, 0
	strh r4, [r5]
	ldr r1, _08096E10 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _08096E14 @ =0x81000800
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r7
	subs r3, r7
	cmp r3, r7
	bhi _08096DC0
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
_08096DE8:
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, r12
	adds r0, 0x40
	str r0, [r6, 0x4]
	mov r1, r9
	lsls r0, r1, 16
	lsrs r0, 16
	ldrh r2, [r6, 0xC]
	cmp r0, r2
	bcc _08096D96
_08096DFE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096E10: .4byte 0x040000d4
_08096E14: .4byte 0x81000800
	thumb_func_end sub_8096D70

	.align 2, 0 @ Don't pad with nop.
