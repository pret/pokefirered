	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_814FD04
sub_814FD04: @ 814FD04
	push {r4,lr}
	adds r3, r1, 0
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0814FD34 @ =gUnknown_84566A8
	movs r2, 0xA0
	lsls r2, 2
	bl LoadBgTiles
	movs r0, 0x2
	bl stdpal_get
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814FD34: .4byte gUnknown_84566A8
	thumb_func_end sub_814FD04

	thumb_func_start sub_814FD38
sub_814FD38: @ 814FD38
	push {r4,lr}
	adds r3, r1, 0
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0814FD68 @ =gUnknown_841F1C8
	movs r2, 0xA0
	lsls r2, 2
	bl LoadBgTiles
	movs r0, 0
	bl stdpal_get
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814FD68: .4byte gUnknown_841F1C8
	thumb_func_end sub_814FD38

	thumb_func_start sub_814FD6C
sub_814FD6C: @ 814FD6C
	push {r4,lr}
	adds r3, r1, 0
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0814FD9C @ =gUnknown_8470B0C
	movs r2, 0x98
	lsls r2, 2
	bl LoadBgTiles
	movs r0, 0x1
	bl stdpal_get
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814FD9C: .4byte gUnknown_8470B0C
	thumb_func_end sub_814FD6C

	thumb_func_start sub_814FDA0
sub_814FDA0: @ 814FDA0
	push {r4,lr}
	adds r3, r1, 0
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0814FDD0 @ =gUnknown_8471A4C
	movs r2, 0x90
	lsls r2, 1
	bl LoadBgTiles
	movs r0, 0x3
	bl stdpal_get
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814FDD0: .4byte gUnknown_8471A4C
	thumb_func_end sub_814FDA0

	thumb_func_start sub_814FDD4
sub_814FDD4: @ 814FDD4
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 16
	lsrs r3, 16
	ldr r1, _0814FDF0 @ =gUnknown_8471B6C
	movs r2, 0xA0
	lsls r2, 2
	bl LoadBgTiles
	pop {r0}
	bx r0
	.align 2, 0
_0814FDF0: .4byte gUnknown_8471B6C
	thumb_func_end sub_814FDD4

	thumb_func_start sub_814FDF4
sub_814FDF4: @ 814FDF4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsls r6, 16
	lsrs r6, 16
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r5, _0814FE3C @ =gUnknown_8471E8C
	lsrs r4, 21
	adds r1, r4, r5
	ldr r1, [r1]
	movs r2, 0x90
	lsls r2, 1
	adds r3, r6, 0
	bl LoadBgTiles
	adds r5, 0x4
	adds r4, r5
	ldr r0, [r4]
	mov r1, r8
	movs r2, 0x20
	bl LoadPalette
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814FE3C: .4byte gUnknown_8471E8C
	thumb_func_end sub_814FDF4

	thumb_func_start sub_814FE40
sub_814FE40: @ 814FE40
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _0814FE68 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	ldrb r1, [r1, 0x14]
	lsrs r1, 3
	adds r2, r4, 0
	bl sub_814FFC4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814FE68: .4byte gSaveBlock2Ptr
	thumb_func_end sub_814FE40

	thumb_func_start sub_814FE6C
sub_814FE6C: @ 814FE6C
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814FEA8 @ =gUnknown_84566A8
	movs r2, 0xA0
	lsls r2, 2
	adds r3, r4, 0
	bl LoadBgTiles
	movs r0, 0x2
	bl stdpal_get
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814FEA8: .4byte gUnknown_84566A8
	thumb_func_end sub_814FE6C

	thumb_func_start sub_814FEAC
sub_814FEAC: @ 814FEAC
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814FEE8 @ =gUnknown_841F1C8
	movs r2, 0xA0
	lsls r2, 2
	adds r3, r4, 0
	bl LoadBgTiles
	movs r0, 0
	bl stdpal_get
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814FEE8: .4byte gUnknown_841F1C8
	thumb_func_end sub_814FEAC

	thumb_func_start sub_814FEEC
sub_814FEEC: @ 814FEEC
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814FF28 @ =gUnknown_8470B0C
	movs r2, 0x98
	lsls r2, 2
	adds r3, r4, 0
	bl LoadBgTiles
	movs r0, 0x1
	bl stdpal_get
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814FF28: .4byte gUnknown_8470B0C
	thumb_func_end sub_814FEEC

	thumb_func_start sub_814FF2C
sub_814FF2C: @ 814FF2C
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814FF68 @ =gUnknown_8471A4C
	movs r2, 0x90
	lsls r2, 1
	adds r3, r4, 0
	bl LoadBgTiles
	movs r0, 0x3
	bl stdpal_get
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814FF68: .4byte gUnknown_8471A4C
	thumb_func_end sub_814FF2C

	thumb_func_start sub_814FF6C
sub_814FF6C: @ 814FF6C
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	movs r1, 0
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814FF94 @ =gUnknown_8471A4C
	movs r2, 0x90
	lsls r2, 1
	adds r3, r4, 0
	bl LoadBgTiles
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814FF94: .4byte gUnknown_8471A4C
	thumb_func_end sub_814FF6C

	thumb_func_start sub_814FF98
sub_814FF98: @ 814FF98
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	movs r1, 0
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814FFC0 @ =gUnknown_8471B6C
	movs r2, 0xA0
	lsls r2, 2
	adds r3, r4, 0
	bl LoadBgTiles
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814FFC0: .4byte gUnknown_8471B6C
	thumb_func_end sub_814FF98

	thumb_func_start sub_814FFC4
sub_814FFC4: @ 814FFC4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 16
	lsrs r6, 16
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r1, 0
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08150018 @ =gUnknown_8471E8C
	lsls r4, 3
	adds r1, r4, r5
	ldr r1, [r1]
	movs r2, 0x90
	lsls r2, 1
	adds r3, r6, 0
	bl LoadBgTiles
	adds r5, 0x4
	adds r4, r5
	ldr r0, [r4]
	mov r1, r8
	movs r2, 0x20
	bl LoadPalette
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08150018: .4byte gUnknown_8471E8C
	thumb_func_end sub_814FFC4

	thumb_func_start sub_815001C
sub_815001C: @ 815001C
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _08150044 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	ldrb r1, [r1, 0x14]
	lsrs r1, 3
	adds r2, r4, 0
	bl sub_814FFC4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08150044: .4byte gSaveBlock2Ptr
	thumb_func_end sub_815001C

	thumb_func_start DrawTextBorderOuter
DrawTextBorderOuter: @ 8150048
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl GetWindowAttribute
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r4, 0
	movs r1, 0x2
	bl GetWindowAttribute
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	adds r0, r4, 0
	movs r1, 0x3
	bl GetWindowAttribute
	mov r9, r0
	mov r2, r9
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	adds r0, r4, 0
	movs r1, 0x4
	bl GetWindowAttribute
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	mov r0, r8
	subs r0, 0x1
	lsls r2, r0, 24
	lsrs r2, 24
	str r2, [sp, 0x14]
	subs r4, r6, 0x1
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	mov r10, r0
	str r0, [sp]
	str r0, [sp, 0x4]
	ldr r2, [sp, 0xC]
	str r2, [sp, 0x8]
	adds r0, r7, 0
	adds r1, r5, 0
	ldr r2, [sp, 0x14]
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	adds r1, r5, 0x1
	lsls r1, 16
	lsrs r1, 16
	mov r0, r8
	lsls r2, r0, 24
	lsrs r2, 24
	str r2, [sp, 0x18]
	mov r2, r9
	lsls r0, r2, 24
	lsrs r0, 24
	str r0, [sp, 0x1C]
	str r0, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	ldr r2, [sp, 0xC]
	str r2, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x18]
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	adds r1, r5, 0x2
	lsls r1, 16
	lsrs r1, 16
	add r8, r9
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r2, r10
	str r2, [sp]
	str r2, [sp, 0x4]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	adds r1, r5, 0x3
	lsls r1, 16
	lsrs r1, 16
	lsls r2, r6, 24
	lsrs r2, 24
	mov r9, r2
	mov r0, r10
	str r0, [sp]
	ldr r2, [sp, 0x10]
	lsls r4, r2, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x14]
	mov r3, r9
	bl FillBgTilemapBufferRect
	adds r1, r5, 0x5
	lsls r1, 16
	lsrs r1, 16
	mov r2, r10
	str r2, [sp]
	str r4, [sp, 0x4]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	mov r3, r9
	bl FillBgTilemapBufferRect
	adds r1, r5, 0x6
	lsls r1, 16
	lsrs r1, 16
	ldr r2, [sp, 0x10]
	adds r6, r2
	lsls r6, 24
	lsrs r6, 24
	mov r0, r10
	str r0, [sp]
	str r0, [sp, 0x4]
	ldr r2, [sp, 0xC]
	str r2, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x14]
	adds r3, r6, 0
	bl FillBgTilemapBufferRect
	adds r1, r5, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0x1C]
	str r0, [sp]
	mov r2, r10
	str r2, [sp, 0x4]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x18]
	adds r3, r6, 0
	bl FillBgTilemapBufferRect
	adds r5, 0x8
	lsls r5, 16
	lsrs r5, 16
	mov r2, r10
	str r2, [sp]
	str r2, [sp, 0x4]
	ldr r0, [sp, 0xC]
	str r0, [sp, 0x8]
	adds r0, r7, 0
	adds r1, r5, 0
	mov r2, r8
	adds r3, r6, 0
	bl FillBgTilemapBufferRect
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DrawTextBorderOuter

	thumb_func_start sub_81501D0
sub_81501D0: @ 81501D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	adds r4, r0, 0
	mov r9, r1
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	adds r0, r4, 0
	movs r1, 0
	bl GetWindowAttribute
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl GetWindowAttribute
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r4, 0
	movs r1, 0x2
	bl GetWindowAttribute
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	adds r0, r4, 0
	movs r1, 0x3
	bl GetWindowAttribute
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x4
	bl GetWindowAttribute
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	mov r0, r8
	lsls r2, r0, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r4, r6, 24
	lsrs r4, 24
	movs r0, 0x1
	str r0, [sp]
	str r0, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	adds r0, r7, 0
	mov r1, r9
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	mov r1, r9
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	mov r0, r8
	adds r0, 0x1
	lsls r2, r0, 24
	lsrs r2, 24
	str r2, [sp, 0x14]
	subs r0, r5, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	adds r0, r7, 0
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	mov r1, r9
	adds r1, 0x2
	lsls r1, 16
	lsrs r1, 16
	add r8, r5
	movs r0, 0x1
	negs r0, r0
	add r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0x1
	str r0, [sp]
	str r0, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	mov r1, r9
	adds r1, 0x3
	lsls r1, 16
	lsrs r1, 16
	adds r5, r6, 0x1
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	str r0, [sp]
	ldr r4, [sp, 0xC]
	subs r4, 0x2
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x10]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r1, r9
	adds r1, 0x5
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1
	str r0, [sp]
	str r4, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r1, r9
	adds r1, 0x6
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0xC]
	adds r6, r0
	subs r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x1
	str r0, [sp]
	str r0, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x10]
	adds r3, r6, 0
	bl FillBgTilemapBufferRect
	mov r1, r9
	adds r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0x18]
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x14]
	adds r3, r6, 0
	bl FillBgTilemapBufferRect
	movs r0, 0x8
	add r9, r0
	mov r0, r9
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r0, 0x1
	str r0, [sp]
	str r0, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	adds r0, r7, 0
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl FillBgTilemapBufferRect
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81501D0

	thumb_func_start rbox_fill_rectangle
rbox_fill_rectangle: @ 815036C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0xC
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r6, 0
	movs r1, 0
	bl GetWindowAttribute
	mov r9, r0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r6, 0
	movs r1, 0x1
	bl GetWindowAttribute
	mov r8, r0
	mov r1, r8
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	adds r0, r6, 0
	movs r1, 0x2
	bl GetWindowAttribute
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x3
	bl GetWindowAttribute
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x4
	bl GetWindowAttribute
	movs r1, 0x1
	negs r1, r1
	add r8, r1
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	subs r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	adds r4, 0x2
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	lsls r0, 24
	movs r1, 0x80
	lsls r1, 18
	adds r0, r1
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	mov r0, r9
	movs r1, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end rbox_fill_rectangle

	thumb_func_start stdpal_get
stdpal_get: @ 8150408
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08150444
	lsls r0, 2
	ldr r1, _0815041C @ =_08150420
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815041C: .4byte _08150420
	.align 2, 0
_08150420:
	.4byte _08150434
	.4byte _08150438
	.4byte _0815043C
	.4byte _08150440
	.4byte _08150444
_08150434:
	movs r0, 0
	b _08150446
_08150438:
	movs r0, 0x10
	b _08150446
_0815043C:
	movs r0, 0x20
	b _08150446
_08150440:
	movs r0, 0x30
	b _08150446
_08150444:
	movs r0, 0x40
_08150446:
	lsls r0, 1
	ldr r1, _08150450 @ =gUnknown_8471DEC
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_08150450: .4byte gUnknown_8471DEC
	thumb_func_end stdpal_get

	.align 2, 0 @ Don't pad with nop.
