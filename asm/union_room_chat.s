	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_812AE70
sub_812AE70: @ 812AE70
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _0812AE9C @ =gUnknown_845AF58
_0812AE76:
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x4
	bls _0812AE76
	ldr r0, _0812AEA0 @ =gUnknown_845AF80
	bl LoadSpritePalette
	ldr r4, _0812AEA4 @ =gUnknown_203B0E8
	movs r0, 0x18
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0812AEA8
	movs r0, 0x1
	b _0812AEAA
	.align 2, 0
_0812AE9C: .4byte gUnknown_845AF58
_0812AEA0: .4byte gUnknown_845AF80
_0812AEA4: .4byte gUnknown_203B0E8
_0812AEA8:
	movs r0, 0
_0812AEAA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_812AE70

	thumb_func_start sub_812AEB0
sub_812AEB0: @ 812AEB0
	push {lr}
	ldr r0, _0812AEC4 @ =gUnknown_203B0E8
	ldr r0, [r0]
	cmp r0, 0
	beq _0812AEBE
	bl Free
_0812AEBE:
	pop {r0}
	bx r0
	.align 2, 0
_0812AEC4: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AEB0

	thumb_func_start sub_812AEC8
sub_812AEC8: @ 812AEC8
	push {lr}
	ldr r0, _0812AEF0 @ =gUnknown_845AFC0
	movs r1, 0xA
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0812AEF4 @ =gUnknown_203B0E8
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0812AEF8 @ =gSprites
	adds r1, r0
	str r1, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0812AEF0: .4byte gUnknown_845AFC0
_0812AEF4: .4byte gUnknown_203B0E8
_0812AEF8: .4byte gSprites
	thumb_func_end sub_812AEC8

	thumb_func_start sub_812AEFC
sub_812AEFC: @ 812AEFC
	ldr r1, _0812AF18 @ =gUnknown_203B0E8
	ldr r1, [r1]
	ldr r2, [r1]
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
_0812AF18: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AEFC

	thumb_func_start sub_812AF1C
sub_812AF1C: @ 812AF1C
	push {r4,r5,lr}
	sub sp, 0x4
	bl GetCurrentKeyboardPage
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	adds r5, 0x1
	mov r0, sp
	adds r1, r5, 0
	bl sub_8129700
	cmp r4, 0x3
	beq _0812AF5C
	ldr r4, _0812AF58 @ =gUnknown_203B0E8
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	ldr r1, [r4]
	ldr r2, [r1]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, 0xA
	strh r0, [r2, 0x20]
	ldr r2, [r1]
	b _0812AF72
	.align 2, 0
_0812AF58: .4byte gUnknown_203B0E8
_0812AF5C:
	ldr r4, _0812AF88 @ =gUnknown_203B0E8
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r2, [r4]
	ldr r1, [r2]
	movs r0, 0x18
	strh r0, [r1, 0x20]
	ldr r2, [r2]
_0812AF72:
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, 0x18
	strh r0, [r2, 0x22]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812AF88: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AF1C

	thumb_func_start sub_812AF8C
sub_812AF8C: @ 812AF8C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 2
	ldr r0, _0812AFB8 @ =gUnknown_845AC14 + 2
	adds r4, r0
	movs r0, 0
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	ldr r0, _0812AFBC @ =0x01010000
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x4
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AFB8: .4byte gUnknown_845AC14 + 2
_0812AFBC: .4byte 0x01010000
	thumb_func_end sub_812AF8C

	thumb_func_start sub_812AFC0
sub_812AFC0: @ 812AFC0
	push {lr}
	bl GetCurrentKeyboardPage
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0812AFE0
	ldr r0, _0812AFDC @ =gUnknown_203B0E8
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _0812AFEC
	.align 2, 0
_0812AFDC: .4byte gUnknown_203B0E8
_0812AFE0:
	ldr r0, _0812AFF8 @ =gUnknown_203B0E8
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
_0812AFEC:
	ldr r0, _0812AFF8 @ =gUnknown_203B0E8
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0x14]
	pop {r0}
	bx r0
	.align 2, 0
_0812AFF8: .4byte gUnknown_203B0E8
	thumb_func_end sub_812AFC0

	thumb_func_start sub_812AFFC
sub_812AFFC: @ 812AFFC
	push {r4,lr}
	ldr r4, _0812B00C @ =gUnknown_203B0E8
	ldr r1, [r4]
	ldrh r0, [r1, 0x14]
	cmp r0, 0x3
	bls _0812B010
_0812B008:
	movs r0, 0
	b _0812B042
	.align 2, 0
_0812B00C: .4byte gUnknown_203B0E8
_0812B010:
	adds r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0812B040
	bl GetCurrentKeyboardPage
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0812B034
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	b _0812B008
_0812B034:
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	b _0812B008
_0812B040:
	movs r0, 0x1
_0812B042:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812AFFC

	thumb_func_start sub_812B048
sub_812B048: @ 812B048
	push {r4,r5,lr}
	ldr r0, _0812B08C @ =gUnknown_845AFE0
	movs r1, 0x4C
	movs r2, 0x98
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0812B090 @ =gUnknown_203B0E8
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _0812B094 @ =gSprites
	adds r1, r4
	str r1, [r2, 0x8]
	ldr r0, _0812B098 @ =gUnknown_845AFF8
	movs r1, 0x40
	movs r2, 0x98
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2, 0x4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B08C: .4byte gUnknown_845AFE0
_0812B090: .4byte gUnknown_203B0E8
_0812B094: .4byte gSprites
_0812B098: .4byte gUnknown_845AFF8
	thumb_func_end sub_812B048

	thumb_func_start sub_812B09C
sub_812B09C: @ 812B09C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_81297DC
	adds r3, r0, 0
	cmp r3, 0xF
	bne _0812B0B8
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0812B0CC
_0812B0B8:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	lsls r0, r3, 3
	adds r0, 0x4C
	strh r0, [r4, 0x20]
_0812B0CC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812B09C

	thumb_func_start sub_812B0D4
sub_812B0D4: @ 812B0D4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0812B0FA
	strh r2, [r1, 0x2E]
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0812B0FA
	strh r2, [r1, 0x24]
_0812B0FA:
	pop {r0}
	bx r0
	thumb_func_end sub_812B0D4

	thumb_func_start sub_812B100
sub_812B100: @ 812B100
	push {r4,r5,lr}
	ldr r0, _0812B150 @ =gUnknown_845B050
	movs r1, 0x8
	movs r2, 0x98
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0812B154 @ =gUnknown_203B0E8
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _0812B158 @ =gSprites
	adds r1, r4
	str r1, [r2, 0xC]
	ldr r0, _0812B15C @ =gUnknown_845B068
	movs r1, 0x20
	movs r2, 0x98
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2, 0x10]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B150: .4byte gUnknown_845B050
_0812B154: .4byte gUnknown_203B0E8
_0812B158: .4byte gSprites
_0812B15C: .4byte gUnknown_845B068
	thumb_func_end sub_812B100

	thumb_func_start sub_812B160
sub_812B160: @ 812B160
	push {r4,lr}
	bl GetCurrentKeyboardPage
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0812B198
	bl sub_8129720
	cmp r0, 0
	beq _0812B1A2
	ldr r3, _0812B194 @ =gUnknown_203B0E8
	ldr r0, [r3]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x10]
	movs r1, 0x3
	bl StartSpriteAnim
	b _0812B1D6
	.align 2, 0
_0812B194: .4byte gUnknown_203B0E8
_0812B198:
	bl sub_81297E8
	adds r4, r0, 0
	cmp r4, 0x3
	bne _0812B1B8
_0812B1A2:
	ldr r0, _0812B1B4 @ =gUnknown_203B0E8
	ldr r0, [r0]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _0812B1D6
	.align 2, 0
_0812B1B4: .4byte gUnknown_203B0E8
_0812B1B8:
	ldr r3, _0812B1DC @ =gUnknown_203B0E8
	ldr r0, [r3]
	ldr r1, [r0, 0x10]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x10]
	lsls r1, r4, 24
	lsrs r1, 24
	bl StartSpriteAnim
_0812B1D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812B1DC: .4byte gUnknown_203B0E8
	thumb_func_end sub_812B160

	.align 2, 0 @ Don't pad with nop.
