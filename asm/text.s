	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80062B0
sub_80062B0: @ 80062B0
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r2, [r1, r3]
	cmp r2, 0
	beq _080062C4
	subs r0, 0x1
	strh r0, [r1, 0x2E]
	b _080062FA
_080062C4:
	movs r0, 0x8
	strh r0, [r1, 0x2E]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080062E8
	cmp r0, 0x1
	bgt _080062DA
	cmp r0, 0
	beq _080062E4
	b _080062F4
_080062DA:
	cmp r0, 0x2
	beq _080062E8
	cmp r0, 0x3
	beq _080062EC
	b _080062F4
_080062E4:
	strh r2, [r1, 0x26]
	b _080062F4
_080062E8:
	strh r0, [r1, 0x26]
	b _080062F4
_080062EC:
	movs r0, 0x1
	strh r0, [r1, 0x26]
	strh r2, [r1, 0x30]
	b _080062FA
_080062F4:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
_080062FA:
	pop {r0}
	bx r0
	thumb_func_end sub_80062B0

	thumb_func_start sub_8006300
sub_8006300: @ 8006300
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r1, [sp, 0x14]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r1, 0x1
	ands r0, r1
	lsls r0, 3
	ldr r1, _08006388 @ =gUnknown_81EA68C
	adds r0, r1
	bl LoadSpriteSheet
	ldr r0, _0800638C @ =gUnknown_81EA6A4
	bl LoadSpritePalette
	ldr r0, _08006390 @ =gUnknown_81EA6B4
	adds r4, 0x3
	lsls r4, 16
	asrs r4, 16
	adds r5, 0x4
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	mov r3, r8
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08006394 @ =gUnknown_202063C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ands r6, r1
	lsls r6, 2
	ldrb r3, [r2, 0x5]
	subs r1, 0x10
	ands r1, r3
	orrs r1, r6
	strb r1, [r2, 0x5]
	ldrb r3, [r2, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0x8
	strh r1, [r2, 0x2E]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08006388: .4byte gUnknown_81EA68C
_0800638C: .4byte gUnknown_81EA6A4
_08006390: .4byte gUnknown_81EA6B4
_08006394: .4byte gUnknown_202063C
	thumb_func_end sub_8006300

	thumb_func_start sub_8006398
sub_8006398: @ 8006398
	push {r4,lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080063C4 @ =gUnknown_202063C
	adds r0, r1
	bl DestroySprite
	movs r4, 0x80
	lsls r4, 8
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080063C4: .4byte gUnknown_202063C
	thumb_func_end sub_8006398

	thumb_func_start DrawKeypadIcon
DrawKeypadIcon: @ 80063C8
	push {r4,r5,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r4, _08006410 @ =gUnknown_81EA6CC
	lsrs r1, 22
	adds r1, r4
	ldrh r5, [r1]
	lsls r5, 5
	ldr r4, _08006414 @ =gUnknown_81EA700
	adds r5, r4
	movs r4, 0x80
	str r4, [sp]
	str r4, [sp, 0x4]
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	ldrb r4, [r1, 0x2]
	str r4, [sp, 0x10]
	ldrb r1, [r1, 0x3]
	str r1, [sp, 0x14]
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
	adds r0, r4, 0
	add sp, 0x18
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08006410: .4byte gUnknown_81EA6CC
_08006414: .4byte gUnknown_81EA700
	thumb_func_end DrawKeypadIcon

	thumb_func_start GetKeypadIconTileOffset
GetKeypadIconTileOffset: @ 8006418
	lsls r0, 24
	ldr r1, _08006424 @ =gUnknown_81EA6CC
	lsrs r0, 22
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08006424: .4byte gUnknown_81EA6CC
	thumb_func_end GetKeypadIconTileOffset

	thumb_func_start GetKeypadIconWidth
GetKeypadIconWidth: @ 8006428
	lsls r0, 24
	ldr r1, _08006434 @ =gUnknown_81EA6CC
	lsrs r0, 22
	adds r0, r1
	ldrb r0, [r0, 0x2]
	bx lr
	.align 2, 0
_08006434: .4byte gUnknown_81EA6CC
	thumb_func_end GetKeypadIconWidth

	thumb_func_start GetKeypadIconHeight
GetKeypadIconHeight: @ 8006438
	lsls r0, 24
	ldr r1, _08006444 @ =gUnknown_81EA6CC
	lsrs r0, 22
	adds r0, r1
	ldrb r0, [r0, 0x3]
	bx lr
	.align 2, 0
_08006444: .4byte gUnknown_81EA6CC
	thumb_func_end GetKeypadIconHeight

	thumb_func_start DecompressGlyphFont0
DecompressGlyphFont0: @ 8006448
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _08006490
	lsrs r2, r0, 20
	lsls r2, 9
	movs r0, 0xF
	ands r0, r6
	lsls r0, 4
	ldr r1, _08006488 @ =gUnknown_81EF100
	adds r0, r1
	adds r5, r2, r0
	ldr r4, _0800648C @ =gGlyphInfo
	adds r0, r5, 0
	adds r1, r4, 0
	bl DecompressGlyphTile
	movs r1, 0x80
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	adds r1, r4, 0
	adds r1, 0x80
	movs r0, 0x8
	strb r0, [r1]
	adds r4, 0x81
	movs r0, 0xC
	b _080064BC
	.align 2, 0
_08006488: .4byte gUnknown_81EF100
_0800648C: .4byte gGlyphInfo
_08006490:
	lsls r1, r6, 5
	ldr r0, _080064C4 @ =gUnknown_81EAF00
	adds r5, r1, r0
	ldr r4, _080064C8 @ =gGlyphInfo
	adds r0, r5, 0
	adds r1, r4, 0
	bl DecompressGlyphTile
	adds r0, r5, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	ldr r0, _080064CC @ =gUnknown_81EEF00
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r4, 0x81
	movs r0, 0xD
_080064BC:
	strb r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080064C4: .4byte gUnknown_81EAF00
_080064C8: .4byte gGlyphInfo
_080064CC: .4byte gUnknown_81EEF00
	thumb_func_end DecompressGlyphFont0

	thumb_func_start GetGlyphWidthFont0
GetGlyphWidthFont0: @ 80064D0
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	beq _080064E8
	ldr r0, _080064E4 @ =gUnknown_81EEF00
	adds r0, r2, r0
	ldrb r0, [r0]
	b _080064EA
	.align 2, 0
_080064E4: .4byte gUnknown_81EEF00
_080064E8:
	movs r0, 0x8
_080064EA:
	pop {r1}
	bx r1
	thumb_func_end GetGlyphWidthFont0

	thumb_func_start DecompressGlyphFont1
DecompressGlyphFont1: @ 80064F0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _0800653C
	lsrs r2, r0, 20
	lsls r2, 9
	movs r0, 0xF
	ands r0, r6
	lsls r0, 4
	ldr r1, _08006534 @ =gUnknown_81FB300
	adds r0, r1
	adds r5, r2, r0
	ldr r4, _08006538 @ =gGlyphInfo
	adds r0, r5, 0
	adds r1, r4, 0
	bl DecompressGlyphTile
	movs r1, 0x80
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	adds r1, r4, 0
	adds r1, 0x80
	movs r0, 0x8
	strb r0, [r1]
	adds r4, 0x81
	movs r0, 0x10
	strb r0, [r4]
	b _08006584
	.align 2, 0
_08006534: .4byte gUnknown_81FB300
_08006538: .4byte gGlyphInfo
_0800653C:
	lsls r1, r6, 6
	ldr r0, _0800658C @ =gUnknown_81F3100
	adds r5, r1, r0
	ldr r4, _08006590 @ =gGlyphInfo
	adds r0, r5, 0
	adds r1, r4, 0
	bl DecompressGlyphTile
	adds r0, r5, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x20
	bl DecompressGlyphTile
	adds r0, r5, 0
	adds r0, 0x20
	adds r1, r4, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	adds r0, r5, 0
	adds r0, 0x30
	adds r1, r4, 0
	adds r1, 0x60
	bl DecompressGlyphTile
	ldr r0, _08006594 @ =gUnknown_81FB100
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r4, 0
	adds r1, 0x81
	movs r0, 0xE
	strb r0, [r1]
_08006584:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800658C: .4byte gUnknown_81F3100
_08006590: .4byte gGlyphInfo
_08006594: .4byte gUnknown_81FB100
	thumb_func_end DecompressGlyphFont1

	thumb_func_start GetGlyphWidthFont1
GetGlyphWidthFont1: @ 8006598
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	beq _080065B0
	ldr r0, _080065AC @ =gUnknown_81FB100
	adds r0, r2, r0
	ldrb r0, [r0]
	b _080065B2
	.align 2, 0
_080065AC: .4byte gUnknown_81FB100
_080065B0:
	movs r0, 0x8
_080065B2:
	pop {r1}
	bx r1
	thumb_func_end GetGlyphWidthFont1

	thumb_func_start DecompressGlyphFont2
DecompressGlyphFont2: @ 80065B8
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _0800665C
	cmp r6, 0
	bne _080065F8
	movs r0, 0x2
	bl GetLastTextColor
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _080065F4 @ =gGlyphInfo
	lsls r2, r0, 4
	orrs r2, r0
	adds r7, r3, 0
	adds r7, 0x80
	movs r6, 0xA
	adds r5, r3, 0
	adds r5, 0x81
	movs r4, 0xC
_080065E4:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _080065E4
	b _080066E4
	.align 2, 0
_080065F4: .4byte gGlyphInfo
_080065F8:
	lsrs r2, r0, 19
	lsls r2, 9
	movs r0, 0x7
	ands r0, r6
	lsls r0, 5
	ldr r1, _08006650 @ =gUnknown_8207500
	adds r0, r1
	adds r4, r2, r0
	ldr r5, _08006654 @ =gGlyphInfo
	adds r0, r4, 0
	adds r1, r5, 0
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl DecompressGlyphTile
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	movs r1, 0x88
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x60
	bl DecompressGlyphTile
	ldr r0, _08006658 @ =gUnknown_820F500
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xC
	b _080066E2
	.align 2, 0
_08006650: .4byte gUnknown_8207500
_08006654: .4byte gGlyphInfo
_08006658: .4byte gUnknown_820F500
_0800665C:
	cmp r6, 0
	bne _0800669C
	movs r0, 0x2
	bl GetLastTextColor
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006694 @ =gGlyphInfo
	lsls r2, r0, 4
	orrs r2, r0
	ldr r0, _08006698 @ =gUnknown_8207300
	ldrb r4, [r0]
	movs r0, 0x81
	adds r0, r3
	mov r12, r0
	adds r6, r3, 0
	adds r6, 0x80
	movs r5, 0xE
_08006682:
	adds r0, r1, r3
	strb r2, [r0]
	strb r4, [r6]
	mov r0, r12
	strb r5, [r0]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006682
	b _080066E4
	.align 2, 0
_08006694: .4byte gGlyphInfo
_08006698: .4byte gUnknown_8207300
_0800669C:
	lsls r1, r6, 6
	ldr r0, _080066EC @ =gUnknown_81FF300
	adds r4, r1, r0
	ldr r5, _080066F0 @ =gGlyphInfo
	adds r0, r4, 0
	adds r1, r5, 0
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x20
	adds r1, r5, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x30
	adds r1, r5, 0
	adds r1, 0x60
	bl DecompressGlyphTile
	ldr r0, _080066F4 @ =gUnknown_8207300
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xE
_080066E2:
	strb r0, [r1]
_080066E4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080066EC: .4byte gUnknown_81FF300
_080066F0: .4byte gGlyphInfo
_080066F4: .4byte gUnknown_8207300
	thumb_func_end DecompressGlyphFont2

	thumb_func_start GetGlyphWidthFont2
GetGlyphWidthFont2: @ 80066F8
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	bne _08006714
	cmp r2, 0
	bne _0800670A
	movs r0, 0xA
	b _0800671A
_0800670A:
	ldr r0, _08006710 @ =gUnknown_820F500
	b _08006716
	.align 2, 0
_08006710: .4byte gUnknown_820F500
_08006714:
	ldr r0, _08006720 @ =gUnknown_8207300
_08006716:
	adds r0, r2, r0
	ldrb r0, [r0]
_0800671A:
	pop {r1}
	bx r1
	.align 2, 0
_08006720: .4byte gUnknown_8207300
	thumb_func_end GetGlyphWidthFont2

	thumb_func_start DecompressGlyphFont3
DecompressGlyphFont3: @ 8006724
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r1, 0x1
	bne _080067C0
	cmp r3, 0
	bne _08006764
	movs r0, 0x2
	bl GetLastTextColor
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006760 @ =gGlyphInfo
	lsls r2, r0, 4
	orrs r2, r0
	adds r7, r3, 0
	adds r7, 0x80
	movs r6, 0xA
	adds r5, r3, 0
	adds r5, 0x81
	movs r4, 0xC
_08006750:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006750
	b _080067C6
	.align 2, 0
_08006760: .4byte gGlyphInfo
_08006764:
	lsrs r2, r0, 19
	lsls r2, 9
	movs r0, 0x7
	ands r0, r3
	lsls r0, 5
	ldr r1, _080067B8 @ =gUnknown_8207500
	adds r0, r1
	adds r5, r2, r0
	ldr r4, _080067BC @ =gGlyphInfo
	adds r0, r5, 0
	adds r1, r4, 0
	bl DecompressGlyphTile
	adds r0, r5, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x20
	bl DecompressGlyphTile
	movs r1, 0x80
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	movs r1, 0x88
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r4, 0
	adds r1, 0x60
	bl DecompressGlyphTile
	adds r1, r4, 0
	adds r1, 0x80
	movs r0, 0xA
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0xC
	strb r0, [r1]
	b _080067C6
	.align 2, 0
_080067B8: .4byte gUnknown_8207500
_080067BC: .4byte gGlyphInfo
_080067C0:
	adds r0, r3, 0
	bl DecompressGlyphFont2
_080067C6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DecompressGlyphFont3

	thumb_func_start GetGlyphWidthFont3
GetGlyphWidthFont3: @ 80067CC
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	beq _080067E4
	ldr r0, _080067E0 @ =gUnknown_8207300
	adds r0, r2, r0
	ldrb r0, [r0]
	b _080067E6
	.align 2, 0
_080067E0: .4byte gUnknown_8207300
_080067E4:
	movs r0, 0xA
_080067E6:
	pop {r1}
	bx r1
	thumb_func_end GetGlyphWidthFont3

	thumb_func_start DecompressGlyphFont4
DecompressGlyphFont4: @ 80067EC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _08006890
	cmp r6, 0
	bne _0800682C
	movs r0, 0x2
	bl GetLastTextColor
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006828 @ =gGlyphInfo
	lsls r2, r0, 4
	orrs r2, r0
	adds r7, r3, 0
	adds r7, 0x80
	movs r6, 0xA
	adds r5, r3, 0
	adds r5, 0x81
	movs r4, 0xC
_08006818:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006818
	b _08006918
	.align 2, 0
_08006828: .4byte gGlyphInfo
_0800682C:
	lsrs r2, r0, 19
	lsls r2, 9
	movs r0, 0x7
	ands r0, r6
	lsls r0, 5
	ldr r1, _08006884 @ =gUnknown_8217818
	adds r0, r1
	adds r4, r2, r0
	ldr r5, _08006888 @ =gGlyphInfo
	adds r0, r4, 0
	adds r1, r5, 0
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl DecompressGlyphTile
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	movs r1, 0x88
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x60
	bl DecompressGlyphTile
	ldr r0, _0800688C @ =gUnknown_821F818
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xC
	b _08006916
	.align 2, 0
_08006884: .4byte gUnknown_8217818
_08006888: .4byte gGlyphInfo
_0800688C: .4byte gUnknown_821F818
_08006890:
	cmp r6, 0
	bne _080068D0
	movs r0, 0x2
	bl GetLastTextColor
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _080068C8 @ =gGlyphInfo
	lsls r2, r0, 4
	orrs r2, r0
	ldr r0, _080068CC @ =gUnknown_8217618
	ldrb r4, [r0]
	movs r0, 0x81
	adds r0, r3
	mov r12, r0
	adds r6, r3, 0
	adds r6, 0x80
	movs r5, 0xE
_080068B6:
	adds r0, r1, r3
	strb r2, [r0]
	strb r4, [r6]
	mov r0, r12
	strb r5, [r0]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _080068B6
	b _08006918
	.align 2, 0
_080068C8: .4byte gGlyphInfo
_080068CC: .4byte gUnknown_8217618
_080068D0:
	lsls r1, r6, 6
	ldr r0, _08006920 @ =gUnknown_820F618
	adds r4, r1, r0
	ldr r5, _08006924 @ =gGlyphInfo
	adds r0, r4, 0
	adds r1, r5, 0
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x20
	adds r1, r5, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x30
	adds r1, r5, 0
	adds r1, 0x60
	bl DecompressGlyphTile
	ldr r0, _08006928 @ =gUnknown_8217618
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xE
_08006916:
	strb r0, [r1]
_08006918:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006920: .4byte gUnknown_820F618
_08006924: .4byte gGlyphInfo
_08006928: .4byte gUnknown_8217618
	thumb_func_end DecompressGlyphFont4

	thumb_func_start GetGlyphWidthFont4
GetGlyphWidthFont4: @ 800692C
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	bne _08006948
	cmp r2, 0
	bne _0800693E
	movs r0, 0xA
	b _0800694E
_0800693E:
	ldr r0, _08006944 @ =gUnknown_821F818
	b _0800694A
	.align 2, 0
_08006944: .4byte gUnknown_821F818
_08006948:
	ldr r0, _08006954 @ =gUnknown_8217618
_0800694A:
	adds r0, r2, r0
	ldrb r0, [r0]
_0800694E:
	pop {r1}
	bx r1
	.align 2, 0
_08006954: .4byte gUnknown_8217618
	thumb_func_end GetGlyphWidthFont4

	thumb_func_start DecompressGlyphFont5
DecompressGlyphFont5: @ 8006958
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r1, 0x1
	bne _080069FC
	cmp r6, 0
	bne _08006998
	movs r0, 0x2
	bl GetLastTextColor
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006994 @ =gGlyphInfo
	lsls r2, r0, 4
	orrs r2, r0
	adds r7, r3, 0
	adds r7, 0x80
	movs r6, 0xA
	adds r5, r3, 0
	adds r5, 0x81
	movs r4, 0xC
_08006984:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006984
	b _08006A84
	.align 2, 0
_08006994: .4byte gGlyphInfo
_08006998:
	lsrs r2, r0, 19
	lsls r2, 9
	movs r0, 0x7
	ands r0, r6
	lsls r0, 5
	ldr r1, _080069F0 @ =gUnknown_8227B30
	adds r0, r1
	adds r4, r2, r0
	ldr r5, _080069F4 @ =gGlyphInfo
	adds r0, r4, 0
	adds r1, r5, 0
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl DecompressGlyphTile
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	movs r1, 0x88
	lsls r1, 1
	adds r0, r4, r1
	adds r1, r5, 0
	adds r1, 0x60
	bl DecompressGlyphTile
	ldr r0, _080069F8 @ =gUnknown_822FB30
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xC
	b _08006A82
	.align 2, 0
_080069F0: .4byte gUnknown_8227B30
_080069F4: .4byte gGlyphInfo
_080069F8: .4byte gUnknown_822FB30
_080069FC:
	cmp r6, 0
	bne _08006A3C
	movs r0, 0x2
	bl GetLastTextColor
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldr r3, _08006A34 @ =gGlyphInfo
	lsls r2, r0, 4
	orrs r2, r0
	ldr r0, _08006A38 @ =gUnknown_8227930
	ldrb r4, [r0]
	movs r0, 0x81
	adds r0, r3
	mov r12, r0
	adds r6, r3, 0
	adds r6, 0x80
	movs r5, 0xE
_08006A22:
	adds r0, r1, r3
	strb r2, [r0]
	strb r4, [r6]
	mov r0, r12
	strb r5, [r0]
	adds r1, 0x1
	cmp r1, 0x7F
	ble _08006A22
	b _08006A84
	.align 2, 0
_08006A34: .4byte gGlyphInfo
_08006A38: .4byte gUnknown_8227930
_08006A3C:
	lsls r1, r6, 6
	ldr r0, _08006A8C @ =gUnknown_821F930
	adds r4, r1, r0
	ldr r5, _08006A90 @ =gGlyphInfo
	adds r0, r4, 0
	adds r1, r5, 0
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r5, 0
	adds r1, 0x20
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x20
	adds r1, r5, 0
	adds r1, 0x40
	bl DecompressGlyphTile
	adds r0, r4, 0
	adds r0, 0x30
	adds r1, r5, 0
	adds r1, 0x60
	bl DecompressGlyphTile
	ldr r0, _08006A94 @ =gUnknown_8227930
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x80
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x81
	movs r0, 0xE
_08006A82:
	strb r0, [r1]
_08006A84:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006A8C: .4byte gUnknown_821F930
_08006A90: .4byte gGlyphInfo
_08006A94: .4byte gUnknown_8227930
	thumb_func_end DecompressGlyphFont5

	thumb_func_start GetGlyphWidthFont5
GetGlyphWidthFont5: @ 8006A98
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, 0x1
	bne _08006AB4
	cmp r2, 0
	bne _08006AAA
	movs r0, 0xA
	b _08006ABA
_08006AAA:
	ldr r0, _08006AB0 @ =gUnknown_822FB30
	b _08006AB6
	.align 2, 0
_08006AB0: .4byte gUnknown_822FB30
_08006AB4:
	ldr r0, _08006AC0 @ =gUnknown_8227930
_08006AB6:
	adds r0, r2, r0
	ldrb r0, [r0]
_08006ABA:
	pop {r1}
	bx r1
	.align 2, 0
_08006AC0: .4byte gUnknown_8227930
	thumb_func_end GetGlyphWidthFont5

	thumb_func_start DecompressGlyphFont9
DecompressGlyphFont9: @ 8006AC4
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 20
	lsls r4, 9
	movs r1, 0xF0
	lsls r1, 12
	ands r1, r0
	lsrs r1, 12
	ldr r0, _08006B08 @ =gUnknown_822FC48
	adds r1, r0
	adds r4, r1
	ldr r5, _08006B0C @ =gGlyphInfo
	adds r0, r4, 0
	adds r1, r5, 0
	bl DecompressGlyphTile
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	adds r1, r5, 0
	adds r1, 0x40
	adds r0, r4, 0
	bl DecompressGlyphTile
	adds r1, r5, 0
	adds r1, 0x80
	movs r0, 0x8
	strb r0, [r1]
	adds r5, 0x81
	movs r0, 0xC
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006B08: .4byte gUnknown_822FC48
_08006B0C: .4byte gGlyphInfo
	thumb_func_end DecompressGlyphFont9

	.align 2, 0 @ Don't pad with nop.
