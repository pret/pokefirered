	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_809E700
sub_809E700: @ 809E700
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809E718
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAnim
_0809E718:
	ldrh r0, [r5, 0x36]
	movs r1, 0xFF
	ands r1, r0
	adds r6, r5, 0
	adds r6, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r6]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	bl GetCurrentPageColumnCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0809E74C
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
_0809E74C:
	ldrb r1, [r6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0809E77C
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _0809E77C
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0809E77C
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r1, r0
	beq _0809E786
_0809E77C:
	movs r0, 0
	strh r0, [r5, 0x38]
	movs r0, 0x2
	strh r0, [r5, 0x3A]
	strh r0, [r5, 0x3C]
_0809E786:
	ldrh r0, [r5, 0x3C]
	subs r0, 0x1
	strh r0, [r5, 0x3C]
	lsls r0, 16
	cmp r0, 0
	bne _0809E7AE
	ldrh r1, [r5, 0x3A]
	ldrh r2, [r5, 0x38]
	adds r0, r1, r2
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _0809E7A6
	cmp r0, 0
	bne _0809E7AA
_0809E7A6:
	negs r0, r1
	strh r0, [r5, 0x3A]
_0809E7AA:
	movs r0, 0x2
	strh r0, [r5, 0x3C]
_0809E7AE:
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _0809E7E4
	ldrh r4, [r5, 0x38]
	lsls r5, r4, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 17
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r2, _0809E7EC @ =0x01010000
	adds r0, r2
	lsrs r0, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r5, 0
	bl MultiplyInvertedPaletteRGBComponents
_0809E7E4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E7EC: .4byte 0x01010000
	thumb_func_end sub_809E700

	thumb_func_start sub_809E7F0
sub_809E7F0: @ 809E7F0
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _0809E838 @ =gUnknown_83E2364
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0809E814
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0809E822
_0809E814:
	movs r0, 0x8
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
_0809E822:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x24]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E838: .4byte gUnknown_83E2364
	thumb_func_end sub_809E7F0

	thumb_func_start sub_809E83C
sub_809E83C: @ 809E83C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _0809E864 @ =gUnknown_83E236C
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	bl sub_809F668
	lsls r0, 24
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	cmp r0, r1
	beq _0809E868
	movs r0, 0
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x30]
	b _0809E88E
	.align 2, 0
_0809E864: .4byte gUnknown_83E236C
_0809E868:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0809E890
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r0, 0
_0809E88E:
	strh r0, [r4, 0x32]
_0809E890:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809E83C

	thumb_func_start sub_809E898
sub_809E898: @ 809E898
	push {lr}
	bl sub_809E8B4
	bl sub_809EB5C
	bl sub_809EDE8
	bl sub_809EE60
	bl sub_809EF24
	pop {r0}
	bx r0
	thumb_func_end sub_809E898

	thumb_func_start sub_809E8B4
sub_809E8B4: @ 809E8B4
	push {r4-r6,lr}
	ldr r0, _0809E938 @ =gUnknown_83E25EC
	movs r1, 0x26
	movs r2, 0x58
	movs r3, 0x1
	bl CreateSprite
	ldr r5, _0809E93C @ =gNamingScreenData
	ldr r1, [r5]
	ldr r4, _0809E940 @ =0x00001e23
	adds r1, r4
	strb r0, [r1]
	movs r0, 0x1
	bl sub_809EA0C
	ldr r6, _0809E944 @ =gSprites
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r0, [r5]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ands r2, r1
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldr r2, [r5]
	adds r2, r4
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	strh r1, [r0, 0x3A]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	strh r1, [r0, 0x3A]
	movs r0, 0
	movs r1, 0
	bl SetCursorPos
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E938: .4byte gUnknown_83E25EC
_0809E93C: .4byte gNamingScreenData
_0809E940: .4byte 0x00001e23
_0809E944: .4byte gSprites
	thumb_func_end sub_809E8B4

	thumb_func_start SetCursorPos
SetCursorPos: @ 809E948
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	ldr r1, _0809E994 @ =gNamingScreenData
	ldr r1, [r1]
	ldr r2, _0809E998 @ =0x00001e23
	adds r1, r2
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _0809E99C @ =gSprites
	adds r5, r1, r2
	lsrs r1, r0, 16
	mov r8, r1
	asrs r6, r0, 16
	ldr r4, _0809E9A0 @ =gUnknown_83E2330
	bl sub_809DE50
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r0, [r0]
	cmp r6, r0
	bge _0809E9A8
	bl sub_809DE50
	ldr r1, _0809E9A4 @ =gUnknown_83E2333
	lsls r0, 24
	lsrs r0, 21
	adds r0, r6, r0
	adds r0, r1
	ldrb r0, [r0]
	adds r0, 0x26
	b _0809E9AA
	.align 2, 0
_0809E994: .4byte gNamingScreenData
_0809E998: .4byte 0x00001e23
_0809E99C: .4byte gSprites
_0809E9A0: .4byte gUnknown_83E2330
_0809E9A4: .4byte gUnknown_83E2333
_0809E9A8:
	movs r0, 0
_0809E9AA:
	strh r0, [r5, 0x20]
	lsls r0, r7, 16
	asrs r0, 12
	adds r0, 0x58
	strh r0, [r5, 0x22]
	ldrh r0, [r5, 0x2E]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x30]
	strh r0, [r5, 0x34]
	mov r2, r8
	strh r2, [r5, 0x2E]
	strh r7, [r5, 0x30]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SetCursorPos

	thumb_func_start GetCursorPos
GetCursorPos: @ 809E9CC
	ldr r2, _0809E9EC @ =gNamingScreenData
	ldr r2, [r2]
	ldr r3, _0809E9F0 @ =0x00001e23
	adds r2, r3
	ldrb r3, [r2]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	ldr r3, _0809E9F4 @ =gSprites
	adds r2, r3
	ldrh r3, [r2, 0x2E]
	strh r3, [r0]
	ldrh r0, [r2, 0x30]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0809E9EC: .4byte gNamingScreenData
_0809E9F0: .4byte 0x00001e23
_0809E9F4: .4byte gSprites
	thumb_func_end GetCursorPos

	thumb_func_start MoveCursorToOKButton
MoveCursorToOKButton: @ 809E9F8
	push {lr}
	bl GetCurrentPageColumnCount
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl SetCursorPos
	pop {r0}
	bx r0
	thumb_func_end MoveCursorToOKButton

	thumb_func_start sub_809EA0C
sub_809EA0C: @ 809EA0C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0809EA54 @ =gSprites
	ldr r1, _0809EA58 @ =gNamingScreenData
	ldr r4, [r1]
	ldr r1, _0809EA5C @ =0x00001e23
	adds r4, r1
	ldrb r1, [r4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x36]
	ldr r1, _0809EA60 @ =0xffffff00
	ands r1, r3
	strh r1, [r2, 0x36]
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrh r2, [r1, 0x36]
	orrs r0, r2
	strh r0, [r1, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809EA54: .4byte gSprites
_0809EA58: .4byte gNamingScreenData
_0809EA5C: .4byte 0x00001e23
_0809EA60: .4byte 0xffffff00
	thumb_func_end sub_809EA0C

	thumb_func_start sub_809EA64
sub_809EA64: @ 809EA64
	push {r4,r5,lr}
	lsls r0, 24
	ldr r5, _0809EA9C @ =gSprites
	ldr r1, _0809EAA0 @ =gNamingScreenData
	ldr r4, [r1]
	ldr r1, _0809EAA4 @ =0x00001e23
	adds r4, r1
	ldrb r1, [r4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x36]
	movs r1, 0xFF
	ands r1, r3
	strh r1, [r2, 0x36]
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsrs r0, 16
	ldrh r2, [r1, 0x36]
	orrs r0, r2
	strh r0, [r1, 0x36]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809EA9C: .4byte gSprites
_0809EAA0: .4byte gNamingScreenData
_0809EAA4: .4byte 0x00001e23
	thumb_func_end sub_809EA64

	thumb_func_start sub_809EAA8
sub_809EAA8: @ 809EAA8
	push {lr}
	ldr r0, _0809EAC8 @ =gNamingScreenData
	ldr r0, [r0]
	ldr r1, _0809EACC @ =0x00001e23
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809EAD0 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_0809EAC8: .4byte gNamingScreenData
_0809EACC: .4byte 0x00001e23
_0809EAD0: .4byte gSprites
	thumb_func_end sub_809EAA8

	thumb_func_start IsCursorAnimFinished
IsCursorAnimFinished: @ 809EAD4
	ldr r2, _0809EAF4 @ =gSprites
	ldr r0, _0809EAF8 @ =gNamingScreenData
	ldr r0, [r0]
	ldr r1, _0809EAFC @ =0x00001e23
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	.align 2, 0
_0809EAF4: .4byte gSprites
_0809EAF8: .4byte gNamingScreenData
_0809EAFC: .4byte 0x00001e23
	thumb_func_end IsCursorAnimFinished

	thumb_func_start sub_809EB00
sub_809EB00: @ 809EB00
	push {r4,r5,lr}
	sub sp, 0x4
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl GetCursorPos
	mov r0, sp
	movs r1, 0
	ldrsh r4, [r0, r1]
	bl GetCurrentPageColumnCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _0809EB34
	ldr r0, _0809EB30 @ =gUnknown_83E2374
	movs r2, 0
	ldrsh r1, [r5, r2]
	adds r1, r0
	ldrb r0, [r1]
	b _0809EB36
	.align 2, 0
_0809EB30: .4byte gUnknown_83E2374
_0809EB34:
	movs r0, 0
_0809EB36:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809EB00

	thumb_func_start GetCurrentPageColumnCount
GetCurrentPageColumnCount: @ 809EB40
	push {r4,lr}
	ldr r4, _0809EB58 @ =gUnknown_83E2330
	bl sub_809DE50
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809EB58: .4byte gUnknown_83E2330
	thumb_func_end GetCurrentPageColumnCount

	thumb_func_start sub_809EB5C
sub_809EB5C: @ 809EB5C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _0809EC00 @ =gUnknown_83E2574
	movs r1, 0xCC
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809EC04 @ =gNamingScreenData
	ldr r1, [r1]
	ldr r2, _0809EC08 @ =0x00001e24
	adds r1, r2
	strb r0, [r1]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r0, _0809EC0C @ =gSprites
	mov r8, r0
	add r5, r8
	ldr r1, _0809EC10 @ =gUnknown_83E2504
	adds r0, r5, 0
	bl SetSubspriteTables
	adds r1, r5, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r6, 0x4
	orrs r0, r6
	strb r0, [r1]
	ldr r0, _0809EC14 @ =gUnknown_83E25A4
	movs r1, 0xCC
	movs r2, 0x54
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r8
	ldr r1, _0809EC18 @ =gUnknown_83E250C
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	ldr r0, _0809EC1C @ =gUnknown_83E258C
	movs r1, 0xCC
	movs r2, 0x53
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r6
	strb r1, [r2, 0x5]
	strh r0, [r5, 0x3C]
	adds r2, 0x3E
	ldrb r0, [r2]
	orrs r0, r6
	strb r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC00: .4byte gUnknown_83E2574
_0809EC04: .4byte gNamingScreenData
_0809EC08: .4byte 0x00001e24
_0809EC0C: .4byte gSprites
_0809EC10: .4byte gUnknown_83E2504
_0809EC14: .4byte gUnknown_83E25A4
_0809EC18: .4byte gUnknown_83E250C
_0809EC1C: .4byte gUnknown_83E258C
	thumb_func_end sub_809EB5C

	thumb_func_start sub_809EC20
sub_809EC20: @ 809EC20
	ldr r0, _0809EC44 @ =gNamingScreenData
	ldr r2, [r0]
	ldr r1, _0809EC48 @ =0x00001e24
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809EC4C @ =gSprites
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldr r1, _0809EC50 @ =0x00001e22
	adds r2, r1
	ldrb r1, [r2]
	strh r1, [r0, 0x30]
	bx lr
	.align 2, 0
_0809EC44: .4byte gNamingScreenData
_0809EC48: .4byte 0x00001e24
_0809EC4C: .4byte gSprites
_0809EC50: .4byte 0x00001e22
	thumb_func_end sub_809EC20

	thumb_func_start sub_809EC54
sub_809EC54: @ 809EC54
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0809EC78 @ =gUnknown_83E2378
_0809EC5A:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0809EC5A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC78: .4byte gUnknown_83E2378
	thumb_func_end sub_809EC54

	thumb_func_start sub_809EC7C
sub_809EC7C: @ 809EC7C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r1, _0809ECC4 @ =gSprites
	adds r5, r1
	movs r2, 0x3C
	ldrsh r0, [r6, r2]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r1
	ldr r0, _0809ECC8 @ =gNamingScreenData
	ldr r0, [r0]
	ldr r1, _0809ECCC @ =0x00001e22
	adds r0, r1
	ldrb r0, [r0]
	bl sub_809DE20
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_809ED88
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	strh r0, [r6, 0x2E]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809ECC4: .4byte gSprites
_0809ECC8: .4byte gNamingScreenData
_0809ECCC: .4byte 0x00001e22
	thumb_func_end sub_809EC7C

	thumb_func_start sub_809ECD0
sub_809ECD0: @ 809ECD0
	movs r0, 0
	bx lr
	thumb_func_end sub_809ECD0

	thumb_func_start sub_809ECD4
sub_809ECD4: @ 809ECD4
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r2, _0809ED40 @ =gSprites
	adds r4, r0, r2
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r2
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0809ED38
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	ldr r0, _0809ED44 @ =0x0000fffc
	strh r0, [r4, 0x26]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x30]
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	bl sub_809DE20
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_809ED88
_0809ED38:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809ED40: .4byte gSprites
_0809ED44: .4byte 0x0000fffc
	thumb_func_end sub_809ECD4

	thumb_func_start sub_809ED48
sub_809ED48: @ 809ED48
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809ED84 @ =gSprites
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _0809ED7C
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_0809ED7C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809ED84: .4byte gSprites
	thumb_func_end sub_809ED48

	thumb_func_start sub_809ED88
sub_809ED88: @ 809ED88
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0809EDE0 @ =gUnknown_83E2388
	lsls r4, r5, 1
	adds r0, r4, r0
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	mov r1, r8
	ldrb r2, [r1, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	mov r0, r8
	strb r1, [r0, 0x5]
	ldr r0, _0809EDE4 @ =gUnknown_83E238E
	adds r4, r0
	ldrh r0, [r4]
	bl GetSpriteTileStartByTag
	adds r1, r6, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r6, 0x42
	movs r1, 0x3F
	ands r1, r5
	ldrb r2, [r6]
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EDE0: .4byte gUnknown_83E2388
_0809EDE4: .4byte gUnknown_83E238E
	thumb_func_end sub_809ED88

	thumb_func_start sub_809EDE8
sub_809EDE8: @ 809EDE8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _0809EE50 @ =gUnknown_83E25BC
	movs r1, 0xCC
	movs r2, 0x74
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r6, _0809EE54 @ =gSprites
	adds r4, r6
	ldr r0, _0809EE58 @ =gUnknown_83E2524
	mov r8, r0
	adds r0, r4, 0
	mov r1, r8
	bl SetSubspriteTables
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r5, 0x4
	orrs r0, r5
	strb r0, [r4]
	ldr r0, _0809EE5C @ =gUnknown_83E25D4
	movs r1, 0xCC
	movs r2, 0x8C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r6
	adds r0, r4, 0
	mov r1, r8
	bl SetSubspriteTables
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r5
	strb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EE50: .4byte gUnknown_83E25BC
_0809EE54: .4byte gSprites
_0809EE58: .4byte gUnknown_83E2524
_0809EE5C: .4byte gUnknown_83E25D4
	thumb_func_end sub_809EDE8

	thumb_func_start sub_809EE60
sub_809EE60: @ 809EE60
	push {r4-r6,lr}
	ldr r5, _0809EF0C @ =gNamingScreenData
	ldr r0, [r5]
	ldr r4, _0809EF10 @ =0x00001e16
	adds r0, r4
	ldrh r1, [r0]
	subs r1, 0x5
	ldr r0, _0809EF14 @ =gUnknown_83E2604
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, _0809EF18 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r5]
	adds r4, r0, r4
	ldrh r1, [r4]
	movs r5, 0
	ldr r2, _0809EF1C @ =0x00001e28
	adds r0, r2
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcs _0809EF04
	adds r6, r3, 0
_0809EEB2:
	lsls r1, 16
	asrs r4, r1, 16
	movs r0, 0xC0
	lsls r0, 10
	adds r1, r0
	asrs r1, 16
	ldr r0, _0809EF20 @ =gUnknown_83E261C
	movs r2, 0x3C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	strh r5, [r0, 0x2E]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x8
	lsls r4, 16
	lsrs r1, r4, 16
	ldr r0, _0809EF0C @ =gNamingScreenData
	ldr r0, [r0]
	ldr r2, _0809EF1C @ =0x00001e28
	adds r0, r2
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcc _0809EEB2
_0809EF04:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EF0C: .4byte gNamingScreenData
_0809EF10: .4byte 0x00001e16
_0809EF14: .4byte gUnknown_83E2604
_0809EF18: .4byte gSprites
_0809EF1C: .4byte 0x00001e28
_0809EF20: .4byte gUnknown_83E261C
	thumb_func_end sub_809EE60

	thumb_func_start sub_809EF24
sub_809EF24: @ 809EF24
	push {lr}
	ldr r1, _0809EF44 @ =gUnknown_83E2394
	ldr r0, _0809EF48 @ =gNamingScreenData
	ldr r0, [r0]
	ldr r2, _0809EF4C @ =0x00001e28
	adds r0, r2
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_0809EF44: .4byte gUnknown_83E2394
_0809EF48: .4byte gNamingScreenData
_0809EF4C: .4byte 0x00001e28
	thumb_func_end sub_809EF24

	thumb_func_start nullsub_54
nullsub_54: @ 809EF50
	bx lr
	thumb_func_end nullsub_54

	thumb_func_start sub_809EF54
sub_809EF54: @ 809EF54
	push {lr}
	sub sp, 0x4
	ldr r0, _0809EFA0 @ =gNamingScreenData
	ldr r0, [r0]
	ldr r1, _0809EFA4 @ =0x00001e34
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0
	bl sub_805C7C8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809EFA8 @ =SpriteCallbackDummy
	movs r2, 0
	str r2, [sp]
	movs r2, 0x38
	movs r3, 0x25
	bl AddPseudoObjectEvent
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0809EFAC @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x4
	bl StartSpriteAnim
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0809EFA0: .4byte gNamingScreenData
_0809EFA4: .4byte 0x00001e34
_0809EFA8: .4byte SpriteCallbackDummy
_0809EFAC: .4byte gSprites
	thumb_func_end sub_809EF54

	thumb_func_start sub_809EFB0
sub_809EFB0: @ 809EFB0
	push {r4,lr}
	ldr r0, _0809EFE4 @ =gUnknown_83E2634
	movs r1, 0x38
	movs r2, 0x29
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0809EFE8 @ =gSprites
	adds r4, r0
	ldr r1, _0809EFEC @ =gUnknown_83E252C
	adds r0, r4, 0
	bl SetSubspriteTables
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EFE4: .4byte gUnknown_83E2634
_0809EFE8: .4byte gSprites
_0809EFEC: .4byte gUnknown_83E252C
	thumb_func_end sub_809EFB0

	thumb_func_start sub_809EFF0
sub_809EFF0: @ 809EFF0
	push {lr}
	sub sp, 0xC
	bl LoadMonIconPalettes
	ldr r0, _0809F038 @ =gNamingScreenData
	ldr r3, [r0]
	ldr r1, _0809F03C @ =0x00001e34
	adds r0, r3, r1
	ldrh r0, [r0]
	ldr r1, _0809F040 @ =SpriteCallbackDummy
	movs r2, 0
	str r2, [sp]
	ldr r2, _0809F044 @ =0x00001e38
	adds r3, r2
	ldr r2, [r3]
	str r2, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
	movs r2, 0x38
	movs r3, 0x28
	bl CreateMonIcon
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809F048 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0809F038: .4byte gNamingScreenData
_0809F03C: .4byte 0x00001e34
_0809F040: .4byte SpriteCallbackDummy
_0809F044: .4byte 0x00001e38
_0809F048: .4byte gSprites
	thumb_func_end sub_809EFF0

	thumb_func_start sub_809F04C
sub_809F04C: @ 809F04C
	push {r4,lr}
	sub sp, 0x2C
	ldr r0, _0809F0B8 @ =gUnknown_83E23C0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x1C]
	str r1, [sp, 0x20]
	ldr r0, _0809F0BC @ =gUnknown_83E23C8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x24]
	str r1, [sp, 0x28]
	ldr r1, _0809F0C0 @ =SpriteCallbackDummy
	add r3, sp, 0x18
	movs r0, 0
	mov r2, sp
	bl sub_805E8E8
	mov r2, sp
	add r0, sp, 0x1C
	ldrh r1, [r0, 0x6]
	strh r1, [r2]
	add r4, sp, 0x24
	ldrh r1, [r4, 0x4]
	strh r1, [r2, 0x2]
	ldr r1, _0809F0C4 @ =gUnknown_83E23BC
	str r1, [sp, 0x8]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0x38
	movs r2, 0x25
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809F0C8 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	add sp, 0x2C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F0B8: .4byte gUnknown_83E23C0
_0809F0BC: .4byte gUnknown_83E23C8
_0809F0C0: .4byte SpriteCallbackDummy
_0809F0C4: .4byte gUnknown_83E23BC
_0809F0C8: .4byte gSprites
	thumb_func_end sub_809F04C

	thumb_func_start HandleKeyboardEvent
HandleKeyboardEvent: @ 809F0CC
	push {r4,r5,lr}
	bl GetInputEvent
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_809EB00
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0x8
	bne _0809F0EA
	bl sub_809F1F0
	b _0809F106
_0809F0EA:
	cmp r4, 0x6
	bne _0809F0F4
	bl sub_809F700
	b _0809F114
_0809F0F4:
	cmp r5, 0x9
	beq _0809F110
	ldr r1, _0809F10C @ =gUnknown_83E23D0
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_0809F106:
	lsls r0, 24
	lsrs r0, 24
	b _0809F116
	.align 2, 0
_0809F10C: .4byte gUnknown_83E23D0
_0809F110:
	bl MoveCursorToOKButton
_0809F114:
	movs r0, 0
_0809F116:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end HandleKeyboardEvent

	thumb_func_start sub_809F11C
sub_809F11C: @ 809F11C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_809E518
	cmp r4, 0x5
	bne _0809F156
	bl sub_809F75C
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_809EAA8
	cmp r4, 0
	beq _0809F156
	movs r0, 0
	bl SetInputState
	ldr r0, _0809F160 @ =gNamingScreenData
	ldr r0, [r0]
	ldr r1, _0809F164 @ =0x00001e10
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
_0809F156:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809F160: .4byte gNamingScreenData
_0809F164: .4byte 0x00001e10
	thumb_func_end sub_809F11C

	thumb_func_start KeyboardKeyHandler_Page
KeyboardKeyHandler_Page: @ 809F168
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_809E518
	cmp r4, 0x5
	beq _0809F182
	movs r0, 0
	b _0809F18A
_0809F182:
	bl sub_809F1F0
	lsls r0, 24
	lsrs r0, 24
_0809F18A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end KeyboardKeyHandler_Page

	thumb_func_start KeyboardKeyHandler_Backspace
KeyboardKeyHandler_Backspace: @ 809F190
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_809E518
	cmp r4, 0x5
	bne _0809F1AA
	bl sub_809F700
_0809F1AA:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end KeyboardKeyHandler_Backspace

	thumb_func_start KeyboardKeyHandler_OK
KeyboardKeyHandler_OK: @ 809F1B4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_809E518
	cmp r4, 0x5
	beq _0809F1CE
	movs r0, 0
	b _0809F1E2
_0809F1CE:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0809F1E8 @ =gNamingScreenData
	ldr r0, [r0]
	ldr r1, _0809F1EC @ =0x00001e10
	adds r0, r1
	movs r1, 0x6
	strb r1, [r0]
	movs r0, 0x1
_0809F1E2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809F1E8: .4byte gNamingScreenData
_0809F1EC: .4byte 0x00001e10
	thumb_func_end KeyboardKeyHandler_OK

	thumb_func_start sub_809F1F0
sub_809F1F0: @ 809F1F0
	ldr r0, _0809F200 @ =gNamingScreenData
	ldr r0, [r0]
	ldr r1, _0809F204 @ =0x00001e10
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	movs r0, 0x1
	bx lr
	.align 2, 0
_0809F200: .4byte gNamingScreenData
_0809F204: .4byte 0x00001e10
	thumb_func_end sub_809F1F0

	thumb_func_start InputInit
InputInit: @ 809F208
	push {lr}
	ldr r0, _0809F218 @ =sub_809F26C
	movs r1, 0x1
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0809F218: .4byte sub_809F26C
	thumb_func_end InputInit

	thumb_func_start GetInputEvent
GetInputEvent: @ 809F21C
	push {lr}
	ldr r0, _0809F238 @ =sub_809F26C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809F23C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0xA]
	pop {r1}
	bx r1
	.align 2, 0
_0809F238: .4byte sub_809F26C
_0809F23C: .4byte gTasks
	thumb_func_end GetInputEvent

	thumb_func_start SetInputState
SetInputState: @ 809F240
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0809F264 @ =sub_809F26C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809F268 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F264: .4byte sub_809F26C
_0809F268: .4byte gTasks
	thumb_func_end SetInputState

	thumb_func_start sub_809F26C
sub_809F26C: @ 809F26C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0809F294 @ =gUnknown_83E23E0
	ldr r2, _0809F298 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0809F294: .4byte gUnknown_83E23E0
_0809F298: .4byte gTasks
	thumb_func_end sub_809F26C

	thumb_func_start InputState_Disabled
InputState_Disabled: @ 809F29C
	movs r1, 0
	strh r1, [r0, 0xA]
	bx lr
	thumb_func_end InputState_Disabled

	thumb_func_start InputState_Enabled
InputState_Enabled: @ 809F2A4
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2, 0xA]
	ldr r0, _0809F2C0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809F2C4
	movs r0, 0x5
	strh r0, [r2, 0xA]
	b _0809F2F4
	.align 2, 0
_0809F2C0: .4byte gMain
_0809F2C4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809F2D2
	movs r0, 0x6
	strh r0, [r2, 0xA]
	b _0809F2F4
_0809F2D2:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809F2E0
	movs r0, 0x8
	strh r0, [r2, 0xA]
	b _0809F2F4
_0809F2E0:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0809F2EE
	movs r0, 0x9
	strh r0, [r2, 0xA]
	b _0809F2F4
_0809F2EE:
	adds r0, r2, 0
	bl sub_809F2F8
_0809F2F4:
	pop {r0}
	bx r0
	thumb_func_end InputState_Enabled

	thumb_func_start sub_809F2F8
sub_809F2F8: @ 809F2F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	mov r9, r0
	ldr r1, _0809F3E4 @ =gUnknown_83E23E8
	mov r0, sp
	movs r2, 0xA
	bl memcpy
	add r0, sp, 0xC
	mov r10, r0
	ldr r1, _0809F3E8 @ =gUnknown_83E23F2
	movs r2, 0xA
	bl memcpy
	mov r1, sp
	adds r1, 0x18
	str r1, [sp, 0x2C]
	ldr r1, _0809F3EC @ =gUnknown_83E23FC
	ldr r0, [sp, 0x2C]
	movs r2, 0x8
	bl memcpy
	mov r2, sp
	adds r2, 0x20
	str r2, [sp, 0x30]
	ldr r1, _0809F3F0 @ =gUnknown_83E2404
	adds r0, r2, 0
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x28
	mov r5, sp
	adds r5, 0x2A
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetCursorPos
	ldr r0, _0809F3F4 @ =gMain
	ldrh r2, [r0, 0x30]
	movs r0, 0x40
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r1, r0, 31
	movs r0, 0x80
	ands r0, r2
	adds r6, r4, 0
	cmp r0, 0
	beq _0809F366
	movs r1, 0x2
_0809F366:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _0809F370
	movs r1, 0x3
_0809F370:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _0809F37A
	movs r1, 0x4
_0809F37A:
	ldrh r0, [r6]
	mov r8, r0
	lsls r1, 1
	mov r2, sp
	adds r7, r2, r1
	ldrh r0, [r7]
	add r0, r8
	strh r0, [r6]
	add r1, r10
	ldrh r0, [r1]
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r5]
	movs r2, 0
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bge _0809F3A6
	bl GetCurrentPageColumnCount
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6]
_0809F3A6:
	movs r0, 0
	ldrsh r4, [r6, r0]
	bl GetCurrentPageColumnCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	ble _0809F3BA
	movs r0, 0
	strh r0, [r6]
_0809F3BA:
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _0809F426
	movs r2, 0
	ldrsh r4, [r6, r2]
	bl GetCurrentPageColumnCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0809F3F8
	ldrh r0, [r5]
	mov r1, r9
	strh r0, [r1, 0xC]
	movs r2, 0
	ldrsh r0, [r5, r2]
	lsls r0, 1
	ldr r1, [sp, 0x2C]
	adds r0, r1, r0
	b _0809F422
	.align 2, 0
_0809F3E4: .4byte gUnknown_83E23E8
_0809F3E8: .4byte gUnknown_83E23F2
_0809F3EC: .4byte gUnknown_83E23FC
_0809F3F0: .4byte gUnknown_83E2404
_0809F3F4: .4byte gMain
_0809F3F8:
	mov r2, r8
	lsls r4, r2, 16
	asrs r4, 16
	bl GetCurrentPageColumnCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0809F426
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _0809F418
	mov r2, r9
	ldrh r0, [r2, 0xC]
	b _0809F424
_0809F418:
	movs r1, 0
	ldrsh r0, [r5, r1]
	lsls r0, 1
	ldr r2, [sp, 0x30]
	adds r0, r2, r0
_0809F422:
	ldrh r0, [r0]
_0809F424:
	strh r0, [r5]
_0809F426:
	movs r0, 0
	ldrsh r4, [r6, r0]
	bl GetCurrentPageColumnCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0809F468
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bge _0809F442
	movs r0, 0x2
	strh r0, [r5]
_0809F442:
	movs r2, 0
	ldrsh r0, [r5, r2]
	cmp r0, 0x2
	ble _0809F44E
	movs r0, 0
	strh r0, [r5]
_0809F44E:
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0809F45E
	movs r0, 0x1
	mov r2, r9
	strh r0, [r2, 0xC]
	b _0809F480
_0809F45E:
	cmp r0, 0x2
	bne _0809F480
	mov r1, r9
	strh r0, [r1, 0xC]
	b _0809F480
_0809F468:
	movs r2, 0
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bge _0809F474
	movs r0, 0x3
	strh r0, [r5]
_0809F474:
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x3
	ble _0809F480
	movs r0, 0
	strh r0, [r5]
_0809F480:
	movs r2, 0
	ldrsh r0, [r6, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl SetCursorPos
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809F2F8

	thumb_func_start sub_809F49C
sub_809F49C: @ 809F49C
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r5, _0809F4E4 @ =gNamingScreenData
	ldr r0, [r5]
	ldr r4, _0809F4E8 @ =0x00001e14
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0809F4EC @ =0x00001e28
	adds r1, r2
	ldr r1, [r1]
	ldr r2, [r1, 0x8]
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x1
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F4E4: .4byte gNamingScreenData
_0809F4E8: .4byte 0x00001e14
_0809F4EC: .4byte 0x00001e28
	thumb_func_end sub_809F49C

	thumb_func_start sub_809F4F0
sub_809F4F0: @ 809F4F0
	push {r4,r5,lr}
	sub sp, 0x2C
	ldr r5, _0809F558 @ =gNamingScreenData
	ldr r0, [r5]
	ldr r1, _0809F55C @ =0x00001e34
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _0809F560 @ =gSpeciesNames
	adds r1, r0
	add r0, sp, 0xC
	bl StringCopy
	ldr r0, [r5]
	ldr r1, _0809F564 @ =0x00001e28
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0, 0x8]
	add r0, sp, 0xC
	movs r2, 0xF
	bl StringAppendN
	ldr r0, [r5]
	ldr r4, _0809F568 @ =0x00001e14
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x1
	add r2, sp, 0xC
	movs r3, 0x1
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	add sp, 0x2C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F558: .4byte gNamingScreenData
_0809F55C: .4byte 0x00001e34
_0809F560: .4byte gSpeciesNames
_0809F564: .4byte 0x00001e28
_0809F568: .4byte 0x00001e14
	thumb_func_end sub_809F4F0

	thumb_func_start sub_809F56C
sub_809F56C: @ 809F56C
	push {lr}
	ldr r1, _0809F588 @ =gUnknown_83E240C
	ldr r0, _0809F58C @ =gNamingScreenData
	ldr r0, [r0]
	ldr r2, _0809F590 @ =0x00001e2c
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_0809F588: .4byte gUnknown_83E240C
_0809F58C: .4byte gNamingScreenData
_0809F590: .4byte 0x00001e2c
	thumb_func_end sub_809F56C

	thumb_func_start sub_809F594
sub_809F594: @ 809F594
	push {lr}
	ldr r1, _0809F5B4 @ =gUnknown_83E2420
	ldr r0, _0809F5B8 @ =gNamingScreenData
	ldr r0, [r0]
	ldr r2, _0809F5BC @ =0x00001e28
	adds r0, r2
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_0809F5B4: .4byte gUnknown_83E2420
_0809F5B8: .4byte gNamingScreenData
_0809F5BC: .4byte 0x00001e28
	thumb_func_end sub_809F594

	thumb_func_start nullsub_55
nullsub_55: @ 809F5C0
	bx lr
	thumb_func_end nullsub_55

	thumb_func_start sub_809F5C4
sub_809F5C4: @ 809F5C4
	push {r4,r5,lr}
	sub sp, 0x10
	movs r4, 0
	ldr r1, _0809F61C @ =gText_MaleSymbol
	add r0, sp, 0xC
	bl StringCopy
	ldr r5, _0809F620 @ =gNamingScreenData
	ldr r0, [r5]
	ldr r1, _0809F624 @ =0x00001e36
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xFF
	beq _0809F614
	cmp r0, 0xFE
	bne _0809F5EE
	ldr r1, _0809F628 @ =gText_FemaleSymbol
	add r0, sp, 0xC
	bl StringCopy
	movs r4, 0x1
_0809F5EE:
	ldr r0, [r5]
	ldr r1, _0809F62C @ =0x00001e13
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r4, 1
	adds r1, r4
	ldr r2, _0809F630 @ =gUnknown_83E2428
	adds r1, r2
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	add r1, sp, 0xC
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0x68
	movs r3, 0x1
	bl AddTextPrinterParameterized3
_0809F614:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F61C: .4byte gText_MaleSymbol
_0809F620: .4byte gNamingScreenData
_0809F624: .4byte 0x00001e36
_0809F628: .4byte gText_FemaleSymbol
_0809F62C: .4byte 0x00001e13
_0809F630: .4byte gUnknown_83E2428
	thumb_func_end sub_809F5C4

	thumb_func_start sub_809F634
sub_809F634: @ 809F634
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _0809F664 @ =gUnknown_83E22D0
	bl sub_809DE50
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 13
	adds r4, r5
	lsls r0, 24
	lsrs r0, 19
	adds r4, r0
	adds r4, r6
	ldrb r0, [r4]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809F664: .4byte gUnknown_83E22D0
	thumb_func_end sub_809F634

	thumb_func_start sub_809F668
sub_809F668: @ 809F668
	push {r4,r5,lr}
	movs r2, 0
	ldr r0, _0809F690 @ =gNamingScreenData
	ldr r4, [r0]
	ldr r3, _0809F694 @ =0x00001e28
	adds r1, r4, r3
	ldr r1, [r1]
	ldrb r3, [r1, 0x1]
	adds r5, r0, 0
	cmp r2, r3
	bcs _0809F6A2
	movs r0, 0xC0
	lsls r0, 5
	adds r1, r4, r0
_0809F684:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0809F698
	adds r0, r2, 0
	b _0809F6B2
	.align 2, 0
_0809F690: .4byte gNamingScreenData
_0809F694: .4byte 0x00001e28
_0809F698:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _0809F684
_0809F6A2:
	ldr r0, [r5]
	ldr r1, _0809F6B8 @ =0x00001e28
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_0809F6B2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809F6B8: .4byte 0x00001e28
	thumb_func_end sub_809F668

	thumb_func_start sub_809F6BC
sub_809F6BC: @ 809F6BC
	push {lr}
	ldr r0, _0809F6E8 @ =gNamingScreenData
	ldr r2, [r0]
	ldr r1, _0809F6EC @ =0x00001e28
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	ble _0809F6F8
	movs r0, 0xC0
	lsls r0, 5
	adds r3, r2, r0
_0809F6D8:
	asrs r2, r1, 24
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0809F6F0
	lsrs r0, r1, 24
	b _0809F6FA
	.align 2, 0
_0809F6E8: .4byte gNamingScreenData
_0809F6EC: .4byte 0x00001e28
_0809F6F0:
	subs r0, r2, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	bgt _0809F6D8
_0809F6F8:
	movs r0, 0
_0809F6FA:
	pop {r1}
	bx r1
	thumb_func_end sub_809F6BC

	thumb_func_start sub_809F700
sub_809F700: @ 809F700
	push {r4-r6,lr}
	bl sub_809F6BC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _0809F758 @ =gNamingScreenData
	ldr r0, [r6]
	movs r5, 0xC0
	lsls r5, 5
	adds r0, r5
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
	bl sub_809F914
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r0, [r6]
	adds r0, r5
	adds r0, r4
	movs r1, 0xFF
	strb r1, [r0]
	bl sub_809EB00
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0809F740
	cmp r0, 0x2
	bne _0809F74A
_0809F740:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl sub_809E518
_0809F74A:
	movs r0, 0x17
	bl PlaySE
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F758: .4byte gNamingScreenData
	thumb_func_end sub_809F700

	thumb_func_start sub_809F75C
sub_809F75C: @ 809F75C
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetCursorPos
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_809F634
	lsls r0, 24
	lsrs r0, 24
	bl sub_809F7C4
	bl sub_809F914
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x5
	bl PlaySE
	bl sub_809F6BC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809F7B0 @ =gNamingScreenData
	ldr r1, [r1]
	ldr r2, _0809F7B4 @ =0x00001e28
	adds r1, r2
	ldr r1, [r1]
	ldrb r1, [r1, 0x1]
	subs r1, 0x1
	cmp r0, r1
	bne _0809F7B8
	movs r0, 0x1
	b _0809F7BA
	.align 2, 0
_0809F7B0: .4byte gNamingScreenData
_0809F7B4: .4byte 0x00001e28
_0809F7B8:
	movs r0, 0
_0809F7BA:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809F75C

	thumb_func_start sub_809F7C4
sub_809F7C4: @ 809F7C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_809F668
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809F7E8 @ =gNamingScreenData
	ldr r1, [r1]
	movs r2, 0xC0
	lsls r2, 5
	adds r1, r2
	adds r1, r0
	strb r4, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F7E8: .4byte gNamingScreenData
	thumb_func_end sub_809F7C4

	thumb_func_start sub_809F7EC
sub_809F7EC: @ 809F7EC
	push {r4,r5,lr}
	movs r2, 0
	ldr r1, _0809F800 @ =gNamingScreenData
	ldr r0, [r1]
	ldr r4, _0809F804 @ =0x00001e28
	adds r0, r4
	ldr r0, [r0]
	adds r5, r1, 0
	b _0809F84C
	.align 2, 0
_0809F800: .4byte gNamingScreenData
_0809F804: .4byte 0x00001e28
_0809F808:
	ldr r1, [r1]
	movs r0, 0xC0
	lsls r0, 5
	adds r3, r1, r0
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809F83C
	cmp r0, 0xFF
	beq _0809F83C
	ldr r2, _0809F838 @ =0x00001e30
	adds r0, r1, r2
	ldr r0, [r0]
	adds r1, r4
	ldr r1, [r1]
	ldrb r2, [r1, 0x1]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r1, r3, 0
	bl StringCopyN
	b _0809F852
	.align 2, 0
_0809F838: .4byte 0x00001e30
_0809F83C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, r5, 0
	ldr r0, [r1]
	ldr r4, _0809F858 @ =0x00001e28
	adds r0, r4
	ldr r0, [r0]
_0809F84C:
	ldrb r0, [r0, 0x1]
	cmp r2, r0
	bcc _0809F808
_0809F852:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F858: .4byte 0x00001e28
	thumb_func_end sub_809F7EC

	thumb_func_start choose_name_or_words_screen_load_bg_tile_patterns
choose_name_or_words_screen_load_bg_tile_patterns: @ 809F85C
	push {r4-r6,lr}
	ldr r0, _0809F8AC @ =gUnknown_8E980E4
	ldr r6, _0809F8B0 @ =gNamingScreenData
	ldr r1, [r6]
	ldr r4, _0809F8B4 @ =0x00001810
	adds r1, r4
	bl LZ77UnCompWram
	ldr r1, [r6]
	adds r1, r4
	movs r5, 0xC0
	lsls r5, 3
	movs r0, 0x1
	adds r2, r5, 0
	movs r3, 0
	bl LoadBgTiles
	ldr r1, [r6]
	adds r1, r4
	movs r0, 0x2
	adds r2, r5, 0
	movs r3, 0
	bl LoadBgTiles
	ldr r1, [r6]
	adds r1, r4
	movs r0, 0x3
	adds r2, r5, 0
	movs r3, 0
	bl LoadBgTiles
	ldr r0, _0809F8B8 @ =gUnknown_83E267C
	bl LoadSpriteSheets
	ldr r0, _0809F8BC @ =gUnknown_83E26E4
	bl LoadSpritePalettes
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F8AC: .4byte gUnknown_8E980E4
_0809F8B0: .4byte gNamingScreenData
_0809F8B4: .4byte 0x00001810
_0809F8B8: .4byte gUnknown_83E267C
_0809F8BC: .4byte gUnknown_83E26E4
	thumb_func_end choose_name_or_words_screen_load_bg_tile_patterns

	thumb_func_start sub_809F8C0
sub_809F8C0: @ 809F8C0
	push {lr}
	bl InputInit
	bl sub_809E4F0
	pop {r0}
	bx r0
	thumb_func_end sub_809F8C0

	thumb_func_start choose_name_or_words_screen_apply_bg_pals
choose_name_or_words_screen_apply_bg_pals: @ 809F8D0
	push {lr}
	ldr r0, _0809F8F8 @ =gUnknown_8E98024
	movs r1, 0
	movs r2, 0xC0
	bl LoadPalette
	ldr r0, _0809F8FC @ =gUnknown_8E97FE4
	movs r1, 0xA0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x2
	bl stdpal_get
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_0809F8F8: .4byte gUnknown_8E98024
_0809F8FC: .4byte gUnknown_8E97FE4
	thumb_func_end choose_name_or_words_screen_apply_bg_pals

	thumb_func_start sub_809F900
sub_809F900: @ 809F900
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_809F900

	thumb_func_start sub_809F914
sub_809F914: @ 809F914
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r7, _0809F9D8 @ =gNamingScreenData
	ldr r1, [r7]
	ldr r2, _0809F9DC @ =0x00001e28
	adds r0, r1, r2
	ldr r0, [r0]
	ldrb r6, [r0, 0x1]
	subs r2, 0x12
	adds r0, r1, r2
	ldrh r0, [r0]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r0, _0809F9E0 @ =0x00001e13
	adds r1, r0
	ldrb r0, [r1]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r4, 0
	cmp r4, r6
	bcs _0809F9AA
	add r5, sp, 0xC
	mov r10, r4
	ldr r0, _0809F9E4 @ =gExpandedPlaceholder_Empty
	ldrb r0, [r0]
	mov r8, r0
_0809F956:
	ldr r0, [r7]
	movs r1, 0xC0
	lsls r1, 5
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r5]
	mov r2, r8
	strb r2, [r5, 0x1]
	ldrb r0, [r5]
	bl sub_809FC54
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0x1
	bne _0809F97A
	movs r1, 0x2
_0809F97A:
	ldr r0, [r7]
	ldr r2, _0809F9E0 @ =0x00001e13
	adds r0, r2
	ldrb r0, [r0]
	lsls r3, r4, 3
	add r3, r9
	adds r3, r1
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	movs r1, 0x2
	add r2, sp, 0xC
	bl AddTextPrinterParameterized
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _0809F956
_0809F9AA:
	bl sub_809F594
	ldr r5, _0809F9D8 @ =gNamingScreenData
	ldr r0, [r5]
	ldr r4, _0809F9E0 @ =0x00001e13
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F9D8: .4byte gNamingScreenData
_0809F9DC: .4byte 0x00001e28
_0809F9E0: .4byte 0x00001e13
_0809F9E4: .4byte gExpandedPlaceholder_Empty
	thumb_func_end sub_809F914

	thumb_func_start sub_809F9E8
sub_809F9E8: @ 809F9E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _0809FA54 @ =gUnknown_83E243C
	adds r0, r5, r0
	ldrb r1, [r0]
	adds r0, r6, 0
	bl FillWindowPixelBuffer
	movs r4, 0
	ldr r1, _0809FA58 @ =gUnknown_83E2440
	lsls r0, r5, 2
	adds r0, r1
	ldr r7, [r0]
	ldr r0, _0809FA5C @ =gUnknown_83E264C
	mov r8, r0
_0809FA12:
	lsls r3, r4, 4
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r7, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r4, 2
	lsls r1, r5, 4
	adds r0, r1
	add r0, r8
	ldr r0, [r0]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x1
	movs r2, 0
	bl AddTextPrinterParameterized3
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0809FA12
	adds r0, r6, 0
	bl PutWindowTilemap
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA54: .4byte gUnknown_83E243C
_0809FA58: .4byte gUnknown_83E2440
_0809FA5C: .4byte gUnknown_83E264C
	thumb_func_end sub_809F9E8

	thumb_func_start sub_809FA60
sub_809FA60: @ 809FA60
	push {r4,r5,lr}
	movs r0, 0xA
	bl GetGpuReg
	adds r4, r0, 0
	movs r5, 0x3
	ands r4, r5
	movs r0, 0xC
	bl GetGpuReg
	ands r0, r5
	cmp r4, r0
	bls _0809FA90
	movs r2, 0x1
	movs r5, 0x1
	ldr r1, _0809FA88 @ =gNamingScreenData
	ldr r0, [r1]
	ldr r3, _0809FA8C @ =0x00001e11
	b _0809FA9A
	.align 2, 0
_0809FA88: .4byte gNamingScreenData
_0809FA8C: .4byte 0x00001e11
_0809FA90:
	movs r2, 0x2
	movs r5, 0x2
	ldr r1, _0809FAD4 @ =gNamingScreenData
	ldr r0, [r1]
	ldr r3, _0809FAD8 @ =0x00001e12
_0809FA9A:
	adds r0, r3
	ldrb r4, [r0]
	adds r0, r1, 0
	ldr r1, _0809FADC @ =gUnknown_83E244C
	ldr r0, [r0]
	ldr r3, _0809FAE0 @ =0x00001e22
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl sub_809F900
	bl sub_809DE30
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_809F9E8
	adds r0, r5, 0
	bl CopyBgTilemapBufferToVram
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FAD4: .4byte gNamingScreenData
_0809FAD8: .4byte 0x00001e12
_0809FADC: .4byte gUnknown_83E244C
_0809FAE0: .4byte 0x00001e22
	thumb_func_end sub_809FA60

	thumb_func_start sub_809FAE4
sub_809FAE4: @ 809FAE4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	ldr r1, _0809FB60 @ =gUnknown_83E2458
	add r0, sp, 0xC
	movs r2, 0x3
	bl memcpy
	ldr r0, _0809FB64 @ =gUnknown_8418E77
	mov r8, r0
	movs r0, 0
	mov r1, r8
	movs r2, 0
	bl GetStringWidth
	adds r6, r0, 0
	ldr r5, _0809FB68 @ =gNamingScreenData
	ldr r0, [r5]
	ldr r4, _0809FB6C @ =0x00001e15
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x14
	negs r1, r1
	adds r2, r1, 0
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	add r1, sp, 0xC
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	movs r1, 0
	movs r3, 0
	bl AddTextPrinterParameterized3
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FB60: .4byte gUnknown_83E2458
_0809FB64: .4byte gUnknown_8418E77
_0809FB68: .4byte gNamingScreenData
_0809FB6C: .4byte 0x00001e15
	thumb_func_end sub_809FAE4

	thumb_func_start sub_809FB70
sub_809FB70: @ 809FB70
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_809FB70

	thumb_func_start NamingScreen_TurnOffScreen
NamingScreen_TurnOffScreen: @ 809FB88
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	pop {r0}
	bx r0
	thumb_func_end NamingScreen_TurnOffScreen

	thumb_func_start NamingScreen_InitDisplayMode
NamingScreen_InitDisplayMode: @ 809FB9C
	push {lr}
	ldr r0, _0809FBA8 @ =sub_809FBAC
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_0809FBA8: .4byte sub_809FBAC
	thumb_func_end NamingScreen_InitDisplayMode

	thumb_func_start sub_809FBAC
sub_809FBAC: @ 809FBAC
	push {r4,r5,lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r5, _0809FC1C @ =gNamingScreenData
	ldr r0, [r5]
	ldr r1, _0809FC20 @ =0x00001e18
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x16
	bl SetGpuReg
	ldr r0, [r5]
	ldr r1, _0809FC24 @ =0x00001e1a
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x1A
	bl SetGpuReg
	movs r0, 0xA
	bl GetGpuReg
	ldr r4, _0809FC28 @ =0x0000fffc
	adds r1, r4, 0
	ands r1, r0
	movs r0, 0xA
	bl SetGpuReg
	ldr r0, [r5]
	ldr r1, _0809FC2C @ =0x00001e1c
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0xA
	bl SetGpuRegBits
	movs r0, 0xC
	bl GetGpuReg
	ands r4, r0
	movs r0, 0xC
	adds r1, r4, 0
	bl SetGpuReg
	ldr r0, [r5]
	ldr r1, _0809FC30 @ =0x00001e1e
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0xC
	bl SetGpuRegBits
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FC1C: .4byte gNamingScreenData
_0809FC20: .4byte 0x00001e18
_0809FC24: .4byte 0x00001e1a
_0809FC28: .4byte 0x0000fffc
_0809FC2C: .4byte 0x00001e1c
_0809FC30: .4byte 0x00001e1e
	thumb_func_end sub_809FBAC

	thumb_func_start sub_809FC34
sub_809FC34: @ 809FC34
	push {lr}
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	pop {r0}
	bx r0
	thumb_func_end sub_809FC34

	thumb_func_start sub_809FC54
sub_809FC54: @ 809FC54
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	ldr r0, _0809FC74 @ =gUnknown_8418E8A
	ldrb r1, [r0]
	adds r3, r0, 0
	cmp r1, 0xFF
	beq _0809FC86
	adds r1, r3, 0
_0809FC68:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r4, r0
	bne _0809FC78
	movs r0, 0x1
	b _0809FC88
	.align 2, 0
_0809FC74: .4byte gUnknown_8418E8A
_0809FC78:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0809FC68
_0809FC86:
	movs r0, 0
_0809FC88:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809FC54

	thumb_func_start sub_809FC90
sub_809FC90: @ 809FC90
	push {lr}
	sub sp, 0x8
	ldr r0, _0809FCB0 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldrb r2, [r1, 0x8]
	movs r0, 0
	str r0, [sp]
	ldr r0, _0809FCB4 @ =CB2_ReturnToFieldWithOpenMenu
	str r0, [sp, 0x4]
	movs r0, 0
	movs r3, 0
	bl DoNamingScreen
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809FCB0: .4byte gSaveBlock2Ptr
_0809FCB4: .4byte CB2_ReturnToFieldWithOpenMenu
	thumb_func_end sub_809FC90

	thumb_func_start sub_809FCB8
sub_809FCB8: @ 809FCB8
	push {lr}
	sub sp, 0x8
	ldr r0, _0809FCD8 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldrb r2, [r1, 0x8]
	movs r0, 0
	str r0, [sp]
	ldr r0, _0809FCDC @ =CB2_ReturnToFieldWithOpenMenu
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r3, 0
	bl DoNamingScreen
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809FCD8: .4byte gSaveBlock2Ptr
_0809FCDC: .4byte CB2_ReturnToFieldWithOpenMenu
	thumb_func_end sub_809FCB8

	thumb_func_start sub_809FCE0
sub_809FCE0: @ 809FCE0
	push {lr}
	sub sp, 0x8
	ldr r0, _0809FD00 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldrb r2, [r1, 0x8]
	movs r0, 0
	str r0, [sp]
	ldr r0, _0809FD04 @ =CB2_ReturnToFieldWithOpenMenu
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r3, 0
	bl DoNamingScreen
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809FD00: .4byte gSaveBlock2Ptr
_0809FD04: .4byte CB2_ReturnToFieldWithOpenMenu
	thumb_func_end sub_809FCE0

	thumb_func_start sub_809FD08
sub_809FD08: @ 809FD08
	push {lr}
	sub sp, 0x8
	ldr r0, _0809FD28 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldrb r2, [r1, 0x8]
	movs r0, 0
	str r0, [sp]
	ldr r0, _0809FD2C @ =CB2_ReturnToFieldWithOpenMenu
	str r0, [sp, 0x4]
	movs r0, 0x3
	movs r3, 0
	bl DoNamingScreen
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809FD28: .4byte gSaveBlock2Ptr
_0809FD2C: .4byte CB2_ReturnToFieldWithOpenMenu
	thumb_func_end sub_809FD08

	thumb_func_start sub_809FD30
sub_809FD30: @ 809FD30
	push {lr}
	sub sp, 0x8
	ldr r0, _0809FD50 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldrb r2, [r1, 0x8]
	movs r0, 0
	str r0, [sp]
	ldr r0, _0809FD54 @ =CB2_ReturnToFieldWithOpenMenu
	str r0, [sp, 0x4]
	movs r0, 0x4
	movs r3, 0
	bl DoNamingScreen
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809FD50: .4byte gSaveBlock2Ptr
_0809FD54: .4byte CB2_ReturnToFieldWithOpenMenu
	thumb_func_end sub_809FD30

	.align 2, 0 @ Don't pad with nop.
