	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_810EDC4
sub_810EDC4: @ 810EDC4
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810EE00 @ =gUnknown_203ADF0
	strh r2, [r0]
	ldr r0, _0810EE04 @ =gUnknown_203ADF2
	strb r3, [r0]
	ldr r1, _0810EE08 @ =sub_810EE5C
	adds r0, r5, 0
	bl CallWindowFunction
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl PutWindowTilemap
	cmp r4, 0x1
	bne _0810EDFA
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
_0810EDFA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EE00: .4byte gUnknown_203ADF0
_0810EE04: .4byte gUnknown_203ADF2
_0810EE08: .4byte sub_810EE5C
	thumb_func_end sub_810EDC4

	thumb_func_start sub_810EE0C
sub_810EE0C: @ 810EE0C
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810EE50 @ =gUnknown_203ADF0
	strh r2, [r0]
	ldr r5, _0810EE54 @ =gUnknown_203ADF2
	adds r0, r6, 0
	movs r1, 0x5
	bl GetWindowAttribute
	strb r0, [r5]
	ldr r1, _0810EE58 @ =sub_810EE5C
	adds r0, r6, 0
	bl CallWindowFunction
	adds r0, r6, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r6, 0
	bl PutWindowTilemap
	cmp r4, 0x1
	bne _0810EE4A
	adds r0, r6, 0
	movs r1, 0x3
	bl CopyWindowToVram
_0810EE4A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810EE50: .4byte gUnknown_203ADF0
_0810EE54: .4byte gUnknown_203ADF2
_0810EE58: .4byte sub_810EE5C
	thumb_func_end sub_810EE0C

	thumb_func_start sub_810EE5C
sub_810EE5C: @ 810EE5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r6, r0, 0
	adds r5, r2, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r0, r1, 24
	lsls r5, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	ldr r1, _0810F228 @ =gUnknown_203ADF0
	mov r9, r1
	ldrh r1, [r1]
	lsrs r2, r0, 24
	str r2, [sp, 0xC]
	movs r3, 0xFE
	lsls r3, 24
	adds r2, r0, r3
	lsrs r2, 24
	str r2, [sp, 0x14]
	lsrs r0, r5, 24
	mov r10, r0
	movs r2, 0xFF
	lsls r2, 24
	adds r5, r2
	lsrs r5, 24
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	ldr r3, _0810F22C @ =gUnknown_203ADF2
	mov r8, r3
	ldrb r0, [r3]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x14]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r0, r9
	ldrh r1, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0xC]
	subs r0, 0x1
	lsls r2, r0, 24
	lsrs r2, 24
	str r2, [sp, 0x18]
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x18]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0x2
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0x10]
	str r0, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0xC]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0x3
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0xC]
	ldr r2, [sp, 0x10]
	adds r7, r0, r2
	lsls r2, r7, 24
	lsrs r2, 24
	str r2, [sp, 0x1C]
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r3, r8
	ldrb r0, [r3]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r0, r9
	ldrh r1, [r0]
	adds r1, 0x4
	lsls r1, 16
	lsrs r1, 16
	adds r0, r7, 0x1
	lsls r2, r0, 24
	lsrs r7, r2, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	adds r2, r7, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0x5
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x14]
	mov r3, r10
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0x6
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x18]
	mov r3, r10
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0x8
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x1C]
	mov r3, r10
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0x9
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	adds r2, r7, 0
	mov r3, r10
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0xA
	lsls r1, 16
	lsrs r1, 16
	mov r5, r10
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x14]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0xB
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x18]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0xC
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x1C]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	mov r3, r9
	ldrh r1, [r3]
	adds r1, 0xD
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	adds r2, r7, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r3, _0810F230 @ =0x0000080a
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	mov r5, r10
	adds r5, 0x2
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x14]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r3, _0810F234 @ =0x0000080b
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x18]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r3, _0810F238 @ =0x0000080c
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x1C]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r3, _0810F23C @ =0x0000080d
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	adds r2, r7, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r3, _0810F240 @ =0x00000805
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	mov r5, r10
	adds r5, 0x3
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x14]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r3, _0810F244 @ =0x00000806
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x18]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r3, _0810F248 @ =0x00000808
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x1C]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r3, _0810F24C @ =0x00000809
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	adds r2, r7, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	movs r3, 0x80
	lsls r3, 4
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x4
	add r10, r2
	mov r3, r10
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x14]
	bl FillBgTilemapBufferRect
	ldr r3, _0810F250 @ =0x00000801
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r2, r8
	ldrb r0, [r2]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x18]
	mov r3, r10
	bl FillBgTilemapBufferRect
	ldr r3, _0810F254 @ =0x00000802
	adds r1, r3, 0
	mov r0, r9
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, [sp, 0x10]
	str r2, [sp]
	str r4, [sp, 0x4]
	mov r3, r8
	ldrb r0, [r3]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0xC]
	mov r3, r10
	bl FillBgTilemapBufferRect
	ldr r0, _0810F258 @ =0x00000803
	adds r1, r0, 0
	mov r2, r9
	ldrh r2, [r2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r3, r8
	ldrb r0, [r3]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	ldr r2, [sp, 0x1C]
	mov r3, r10
	bl FillBgTilemapBufferRect
	ldr r0, _0810F25C @ =0x00000804
	adds r1, r0, 0
	mov r2, r9
	ldrh r2, [r2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r3, r8
	ldrb r0, [r3]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	adds r2, r7, 0
	mov r3, r10
	bl FillBgTilemapBufferRect
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810F228: .4byte gUnknown_203ADF0
_0810F22C: .4byte gUnknown_203ADF2
_0810F230: .4byte 0x0000080a
_0810F234: .4byte 0x0000080b
_0810F238: .4byte 0x0000080c
_0810F23C: .4byte 0x0000080d
_0810F240: .4byte 0x00000805
_0810F244: .4byte 0x00000806
_0810F248: .4byte 0x00000808
_0810F24C: .4byte 0x00000809
_0810F250: .4byte 0x00000801
_0810F254: .4byte 0x00000802
_0810F258: .4byte 0x00000803
_0810F25C: .4byte 0x00000804
	thumb_func_end sub_810EE5C

	thumb_func_start sub_810F260
sub_810F260: @ 810F260
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0810F294 @ =sub_810F298
	adds r0, r5, 0
	bl CallWindowFunction
	adds r0, r5, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl ClearWindowTilemap
	cmp r4, 0x1
	bne _0810F28E
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
_0810F28E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F294: .4byte sub_810F298
	thumb_func_end sub_810F260

	thumb_func_start sub_810F298
sub_810F298: @ 810F298
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r1, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsls r5, 24
	lsls r3, 24
	lsls r1, 24
	movs r2, 0xFE
	lsls r2, 24
	adds r4, r2
	lsrs r4, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r5, r2
	lsrs r5, 24
	movs r2, 0x80
	lsls r2, 19
	adds r3, r2
	lsrs r3, 24
	str r3, [sp]
	movs r2, 0x80
	lsls r2, 18
	adds r1, r2
	lsrs r1, 24
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r2, r4, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810F298

	thumb_func_start SetWindowBorderStyle
SetWindowBorderStyle: @ 810F2E8
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810F324 @ =gUnknown_203ADF0
	strh r2, [r0]
	ldr r0, _0810F328 @ =gUnknown_203ADF2
	strb r3, [r0]
	ldr r1, _0810F32C @ =DrawWindowBorder
	adds r0, r5, 0
	bl CallWindowFunction
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl PutWindowTilemap
	cmp r4, 0x1
	bne _0810F31E
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
_0810F31E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F324: .4byte gUnknown_203ADF0
_0810F328: .4byte gUnknown_203ADF2
_0810F32C: .4byte DrawWindowBorder
	thumb_func_end SetWindowBorderStyle

	thumb_func_start sub_810F330
sub_810F330: @ 810F330
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810F374 @ =gUnknown_203ADF0
	strh r2, [r0]
	ldr r5, _0810F378 @ =gUnknown_203ADF2
	adds r0, r6, 0
	movs r1, 0x5
	bl GetWindowAttribute
	strb r0, [r5]
	ldr r1, _0810F37C @ =DrawWindowBorder
	adds r0, r6, 0
	bl CallWindowFunction
	adds r0, r6, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r6, 0
	bl PutWindowTilemap
	cmp r4, 0x1
	bne _0810F36E
	adds r0, r6, 0
	movs r1, 0x3
	bl CopyWindowToVram
_0810F36E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810F374: .4byte gUnknown_203ADF0
_0810F378: .4byte gUnknown_203ADF2
_0810F37C: .4byte DrawWindowBorder
	thumb_func_end sub_810F330

	thumb_func_start DrawWindowBorder
DrawWindowBorder: @ 810F380
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	mov r9, r0
	adds r6, r1, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x38]
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r6, 24
	lsls r4, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	ldr r2, _0810F4D0 @ =gUnknown_203ADF0
	ldrh r1, [r2]
	lsrs r0, r6, 24
	str r0, [sp, 0xC]
	movs r2, 0xFF
	lsls r2, 24
	adds r6, r2
	lsrs r6, 24
	lsrs r0, r4, 24
	mov r8, r0
	adds r4, r2
	lsrs r4, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	ldr r7, _0810F4D4 @ =gUnknown_203ADF2
	ldrb r0, [r7]
	str r0, [sp, 0x8]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	ldr r2, _0810F4D0 @ =gUnknown_203ADF0
	ldrh r1, [r2]
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0x10]
	str r0, [sp]
	str r5, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0x8]
	mov r0, r9
	ldr r2, [sp, 0xC]
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	ldr r2, _0810F4D0 @ =gUnknown_203ADF0
	ldrh r1, [r2]
	adds r1, 0x2
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0xC]
	ldr r2, [sp, 0x10]
	adds r0, r2
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	str r5, [sp]
	str r5, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0x8]
	mov r0, r9
	mov r2, r10
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	ldr r0, _0810F4D0 @ =gUnknown_203ADF0
	ldrh r1, [r0]
	adds r1, 0x3
	lsls r1, 16
	lsrs r1, 16
	str r5, [sp]
	ldr r2, [sp, 0x14]
	str r2, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0x8]
	mov r0, r9
	adds r2, r6, 0
	mov r3, r8
	bl FillBgTilemapBufferRect
	ldr r0, _0810F4D0 @ =gUnknown_203ADF0
	ldrh r1, [r0]
	adds r1, 0x5
	lsls r1, 16
	lsrs r1, 16
	str r5, [sp]
	ldr r2, [sp, 0x14]
	str r2, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0x8]
	mov r0, r9
	mov r2, r10
	mov r3, r8
	bl FillBgTilemapBufferRect
	ldr r0, _0810F4D0 @ =gUnknown_203ADF0
	ldrh r1, [r0]
	adds r1, 0x6
	lsls r1, 16
	lsrs r1, 16
	ldr r2, [sp, 0x14]
	add r8, r2
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	str r5, [sp]
	str r5, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0x8]
	mov r0, r9
	adds r2, r6, 0
	mov r3, r8
	bl FillBgTilemapBufferRect
	ldr r2, _0810F4D0 @ =gUnknown_203ADF0
	ldrh r1, [r2]
	adds r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0x10]
	str r0, [sp]
	str r5, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0x8]
	mov r0, r9
	ldr r2, [sp, 0xC]
	mov r3, r8
	bl FillBgTilemapBufferRect
	ldr r2, _0810F4D0 @ =gUnknown_203ADF0
	ldrh r1, [r2]
	adds r1, 0x8
	lsls r1, 16
	lsrs r1, 16
	str r5, [sp]
	str r5, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0x8]
	mov r0, r9
	mov r2, r10
	mov r3, r8
	bl FillBgTilemapBufferRect
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810F4D0: .4byte gUnknown_203ADF0
_0810F4D4: .4byte gUnknown_203ADF2
	thumb_func_end DrawWindowBorder

	thumb_func_start sub_810F4D8
sub_810F4D8: @ 810F4D8
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0810F50C @ =sub_810F510
	adds r0, r5, 0
	bl CallWindowFunction
	adds r0, r5, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl ClearWindowTilemap
	cmp r4, 0x1
	bne _0810F506
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
_0810F506:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F50C: .4byte sub_810F510
	thumb_func_end sub_810F4D8

	thumb_func_start sub_810F510
sub_810F510: @ 810F510
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r1, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsls r5, 24
	lsls r3, 24
	lsls r1, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r4, r2
	lsrs r4, 24
	adds r5, r2
	lsrs r5, 24
	movs r2, 0x80
	lsls r2, 18
	adds r3, r2
	lsrs r3, 24
	str r3, [sp]
	adds r1, r2
	lsrs r1, 24
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r2, r4, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810F510

	thumb_func_start CreateWindow_SnapRight_StdPal
CreateWindow_SnapRight_StdPal: @ 810F558
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r5, r3, 24
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	movs r1, 0
	movs r2, 0x8
	bl memset
	cmp r6, 0x3
	bls _0810F58E
	movs r1, 0
	mov r0, sp
	strb r1, [r0]
	b _0810F592
_0810F58E:
	mov r0, sp
	strb r6, [r0]
_0810F592:
	mov r1, sp
	mov r0, r8
	strb r0, [r1, 0x2]
	movs r0, 0x2
	strb r0, [r1, 0x4]
	movs r0, 0x1E
	subs r0, r7
	strb r0, [r1, 0x1]
	strb r7, [r1, 0x3]
	strb r5, [r1, 0x5]
	strh r4, [r1, 0x6]
	ldr r4, _0810F5BC @ =gUnknown_203ADF4
	mov r0, sp
	bl AddWindow
	strb r0, [r4]
	cmp r5, 0xF
	bls _0810F5C0
	movs r5, 0xF0
	b _0810F5C4
	.align 2, 0
_0810F5BC: .4byte gUnknown_203ADF4
_0810F5C0:
	lsls r0, r5, 28
	lsrs r5, r0, 24
_0810F5C4:
	movs r0, 0x2
	bl stdpal_get
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810F5E4 @ =gUnknown_203ADF4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810F5E4: .4byte gUnknown_203ADF4
	thumb_func_end CreateWindow_SnapRight_StdPal

	thumb_func_start PrintTextOnRightSnappedWindow
PrintTextOnRightSnappedWindow: @ 810F5E8
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r4, _0810F648 @ =gUnknown_203ADF4
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0810F63E
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	ldrb r1, [r4]
	movs r3, 0x14
	negs r3, r3
	adds r2, r3, 0
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0810F64C @ =gUnknown_8456618
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	cmp r6, 0
	beq _0810F63E
	ldrb r0, [r4]
	movs r1, 0x3
	bl CopyWindowToVram
_0810F63E:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810F648: .4byte gUnknown_203ADF4
_0810F64C: .4byte gUnknown_8456618
	thumb_func_end PrintTextOnRightSnappedWindow

	thumb_func_start Menu_PrintHelpSystemUIHeader
Menu_PrintHelpSystemUIHeader: @ 810F650
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	mov r8, r0
	adds r5, r1, 0
	ldr r0, [sp, 0x30]
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0810F67C @ =gUnknown_203ADF4
	ldrb r1, [r0]
	adds r6, r0, 0
	cmp r1, 0xFF
	beq _0810F6F6
	cmp r2, 0
	beq _0810F680
	add r1, sp, 0x14
	movs r0, 0
	b _0810F684
	.align 2, 0
_0810F67C: .4byte gUnknown_203ADF4
_0810F680:
	add r1, sp, 0x14
	movs r0, 0xF
_0810F684:
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	adds r4, r6, 0
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	cmp r5, 0
	beq _0810F6CE
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	ldrb r1, [r4]
	movs r3, 0x14
	negs r3, r3
	adds r2, r3, 0
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	add r0, sp, 0x14
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0
	movs r3, 0x1
	bl AddTextPrinterParameterized3
_0810F6CE:
	ldrb r0, [r6]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	add r2, sp, 0x14
	str r2, [sp, 0x8]
	str r1, [sp, 0xC]
	mov r3, r8
	str r3, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0x4
	movs r3, 0x1
	bl AddTextPrinterParameterized4
	cmp r7, 0
	beq _0810F6F6
	ldrb r0, [r6]
	movs r1, 0x3
	bl CopyWindowToVram
_0810F6F6:
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end Menu_PrintHelpSystemUIHeader

	thumb_func_start sub_810F704
sub_810F704: @ 810F704
	push {lr}
	ldr r1, _0810F718 @ =gUnknown_203ADF4
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0810F714
	movs r1, 0x3
	bl CopyWindowToVram
_0810F714:
	pop {r0}
	bx r0
	.align 2, 0
_0810F718: .4byte gUnknown_203ADF4
	thumb_func_end sub_810F704

	thumb_func_start sub_810F71C
sub_810F71C: @ 810F71C
	push {r4,lr}
	ldr r4, _0810F73C @ =gUnknown_203ADF4
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0810F734
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	movs r1, 0x3
	bl CopyWindowToVram
_0810F734:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810F73C: .4byte gUnknown_203ADF4
	thumb_func_end sub_810F71C

	thumb_func_start sub_810F740
sub_810F740: @ 810F740
	push {r4,lr}
	ldr r4, _0810F770 @ =gUnknown_203ADF4
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0810F768
	movs r1, 0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0xFF
	strb r0, [r4]
_0810F768:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810F770: .4byte gUnknown_203ADF4
	thumb_func_end sub_810F740

	thumb_func_start sub_810F774
sub_810F774: @ 810F774
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, 0x18]
	mov r8, r4
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	ldr r6, [sp, 0x24]
	mov r12, r6
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r7, r5, 24
	ldr r5, _0810F7B8 @ =gUnknown_203ADE4
	movs r6, 0
	strb r2, [r5]
	strb r3, [r5, 0x1]
	strb r6, [r5, 0x3]
	subs r4, 0x1
	strb r4, [r5, 0x4]
	strb r0, [r5, 0x5]
	strb r1, [r5, 0x6]
	mov r0, r8
	strb r0, [r5, 0x8]
	mov r4, r12
	strb r4, [r5, 0xB]
	cmp r7, 0
	blt _0810F7B4
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	cmp r7, r0
	ble _0810F7BC
_0810F7B4:
	strb r6, [r5, 0x2]
	b _0810F7BE
	.align 2, 0
_0810F7B8: .4byte gUnknown_203ADE4
_0810F7BC:
	strb r7, [r5, 0x2]
_0810F7BE:
	movs r0, 0
	bl MoveMenuCursor
	ldr r0, _0810F7D4 @ =gUnknown_203ADE4
	ldrb r0, [r0, 0x2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810F7D4: .4byte gUnknown_203ADE4
	thumb_func_end sub_810F774

	thumb_func_start ProgramAndPlaceMenuCursorOnWindow
ProgramAndPlaceMenuCursorOnWindow: @ 810F7D8
	push {r4-r6,lr}
	sub sp, 0x10
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x24]
	ldr r6, [sp, 0x28]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r4, 0
	str r4, [sp, 0xC]
	bl sub_810F774
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ProgramAndPlaceMenuCursorOnWindow

	thumb_func_start sub_810F818
sub_810F818: @ 810F818
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x14
	mov r8, r0
	adds r6, r1, 0
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r6, 24
	lsrs r6, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0x1
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl GetMenuCursorDimensionByFont
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	mov r0, r8
	adds r1, r6, 0
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	bl ProgramAndPlaceMenuCursorOnWindow
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810F818

	thumb_func_start RedrawMenuCursor
RedrawMenuCursor: @ 810F874
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0xC
	adds r6, r0, 0
	mov r8, r1
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r5, _0810F8FC @ =gUnknown_203ADE4
	ldrb r0, [r5, 0x6]
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5, 0x6]
	movs r1, 0x1
	bl GetMenuCursorDimensionByFont
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r5, 0x5]
	mov r9, r1
	ldrb r2, [r5]
	ldrb r1, [r5, 0x8]
	adds r3, r1, 0
	muls r3, r6
	ldrb r6, [r5, 0x1]
	adds r3, r6
	lsls r3, 16
	lsrs r3, 16
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r9
	movs r1, 0x1
	bl FillWindowPixelRect
	ldrb r0, [r5, 0x5]
	ldrb r1, [r5, 0x6]
	ldr r2, _0810F900 @ =gFameCheckerText_ListMenuCursor
	ldrb r3, [r5]
	ldrb r4, [r5, 0x8]
	mov r6, r8
	muls r6, r4
	adds r4, r6, 0
	ldrb r5, [r5, 0x1]
	adds r4, r5
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	bl AddTextPrinterParameterized
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810F8FC: .4byte gUnknown_203ADE4
_0810F900: .4byte gFameCheckerText_ListMenuCursor
	thumb_func_end RedrawMenuCursor

	thumb_func_start MoveMenuCursor
MoveMenuCursor: @ 810F904
	push {r4,r5,lr}
	ldr r1, _0810F924 @ =gUnknown_203ADE4
	ldrb r5, [r1, 0x2]
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	lsls r0, 24
	asrs r3, r0, 24
	adds r2, r3
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	adds r4, r1, 0
	cmp r2, r0
	bge _0810F928
	ldrb r0, [r4, 0x4]
	b _0810F936
	.align 2, 0
_0810F924: .4byte gUnknown_203ADE4
_0810F928:
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r2, r0
	ble _0810F934
	ldrb r0, [r4, 0x3]
	b _0810F936
_0810F934:
	adds r0, r3, r5
_0810F936:
	strb r0, [r4, 0x2]
	ldrb r1, [r4, 0x2]
	adds r0, r5, 0
	bl RedrawMenuCursor
	ldrb r0, [r4, 0x2]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end MoveMenuCursor

	thumb_func_start MoveMenuCursorNoWrapAround
MoveMenuCursorNoWrapAround: @ 810F948
	push {r4,r5,lr}
	ldr r1, _0810F968 @ =gUnknown_203ADE4
	ldrb r5, [r1, 0x2]
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	lsls r0, 24
	asrs r3, r0, 24
	adds r2, r3
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	adds r4, r1, 0
	cmp r2, r0
	bge _0810F96C
	ldrb r0, [r4, 0x3]
	b _0810F97A
	.align 2, 0
_0810F968: .4byte gUnknown_203ADE4
_0810F96C:
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r2, r0
	ble _0810F978
	ldrb r0, [r4, 0x4]
	b _0810F97A
_0810F978:
	adds r0, r3, r5
_0810F97A:
	strb r0, [r4, 0x2]
	ldrb r1, [r4, 0x2]
	adds r0, r5, 0
	bl RedrawMenuCursor
	ldrb r0, [r4, 0x2]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end MoveMenuCursorNoWrapAround

	thumb_func_start GetMenuCursorPos
GetMenuCursorPos: @ 810F98C
	ldr r0, _0810F994 @ =gUnknown_203ADE4
	ldrb r0, [r0, 0x2]
	bx lr
	.align 2, 0
_0810F994: .4byte gUnknown_203ADE4
	thumb_func_end GetMenuCursorPos

	thumb_func_start ProcessMenuInput
ProcessMenuInput: @ 810F998
	push {r4,lr}
	ldr r0, _0810F9BC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810F9C4
	ldr r4, _0810F9C0 @ =gUnknown_203ADE4
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	bne _0810F9B4
	movs r0, 0x5
	bl PlaySE
_0810F9B4:
	movs r0, 0x2
	ldrsb r0, [r4, r0]
	b _0810F9FE
	.align 2, 0
_0810F9BC: .4byte gMain
_0810F9C0: .4byte gUnknown_203ADE4
_0810F9C4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810F9D2
	movs r0, 0x1
	negs r0, r0
	b _0810F9FE
_0810F9D2:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810F9E6
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _0810F9F6
_0810F9E6:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810F9FA
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_0810F9F6:
	bl MoveMenuCursor
_0810F9FA:
	movs r0, 0x2
	negs r0, r0
_0810F9FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInput

	thumb_func_start ProcessMenuInputNoWrapAround
ProcessMenuInputNoWrapAround: @ 810FA04
	push {r4-r6,lr}
	ldr r4, _0810FA2C @ =gUnknown_203ADE4
	ldrb r5, [r4, 0x2]
	adds r6, r5, 0
	ldr r0, _0810FA30 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810FA34
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	bne _0810FA24
	movs r0, 0x5
	bl PlaySE
_0810FA24:
	movs r0, 0x2
	ldrsb r0, [r4, r0]
	b _0810FA7C
	.align 2, 0
_0810FA2C: .4byte gUnknown_203ADE4
_0810FA30: .4byte gMain
_0810FA34:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810FA42
	movs r0, 0x1
	negs r0, r0
	b _0810FA7C
_0810FA42:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810FA5C
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrapAround
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _0810FA78
	b _0810FA72
_0810FA5C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810FA78
	movs r0, 0x1
	bl MoveMenuCursorNoWrapAround
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _0810FA78
_0810FA72:
	movs r0, 0x5
	bl PlaySE
_0810FA78:
	movs r0, 0x2
	negs r0, r0
_0810FA7C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInputNoWrapAround

	thumb_func_start ProcessMenuInput_other
ProcessMenuInput_other: @ 810FA84
	push {r4,lr}
	ldr r2, _0810FAA8 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810FAB0
	ldr r4, _0810FAAC @ =gUnknown_203ADE4
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	bne _0810FAA0
	movs r0, 0x5
	bl PlaySE
_0810FAA0:
	movs r0, 0x2
	ldrsb r0, [r4, r0]
	b _0810FAE8
	.align 2, 0
_0810FAA8: .4byte gMain
_0810FAAC: .4byte gUnknown_203ADE4
_0810FAB0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810FABE
	movs r0, 0x1
	negs r0, r0
	b _0810FAE8
_0810FABE:
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _0810FAD4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _0810FAE0
_0810FAD4:
	cmp r1, 0x80
	bne _0810FAE4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_0810FAE0:
	bl MoveMenuCursor
_0810FAE4:
	movs r0, 0x2
	negs r0, r0
_0810FAE8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInput_other

	thumb_func_start ProcessMenuInputNoWrapAround_other
ProcessMenuInputNoWrapAround_other: @ 810FAF0
	push {r4-r6,lr}
	ldr r4, _0810FB18 @ =gUnknown_203ADE4
	ldrb r5, [r4, 0x2]
	adds r6, r5, 0
	ldr r2, _0810FB1C @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810FB20
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	bne _0810FB10
	movs r0, 0x5
	bl PlaySE
_0810FB10:
	movs r0, 0x2
	ldrsb r0, [r4, r0]
	b _0810FB66
	.align 2, 0
_0810FB18: .4byte gUnknown_203ADE4
_0810FB1C: .4byte gMain
_0810FB20:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810FB2E
	movs r0, 0x1
	negs r0, r0
	b _0810FB66
_0810FB2E:
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _0810FB4A
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrapAround
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _0810FB62
	b _0810FB5C
_0810FB4A:
	cmp r1, 0x80
	bne _0810FB62
	movs r0, 0x1
	bl MoveMenuCursorNoWrapAround
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _0810FB62
_0810FB5C:
	movs r0, 0x5
	bl PlaySE
_0810FB62:
	movs r0, 0x2
	negs r0, r0
_0810FB66:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInputNoWrapAround_other

	thumb_func_start PrintTextArray
PrintTextArray: @ 810FB6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r4, [sp, 0x2C]
	ldr r5, [sp, 0x30]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 24
	lsrs r7, r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r4, 0
	cmp r4, r5
	bcs _0810FBD0
_0810FBA0:
	lsls r0, r4, 3
	ldr r1, [sp, 0x34]
	adds r0, r1
	ldr r2, [r0]
	adds r0, r7, 0
	muls r0, r4
	add r0, r8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r6, 0
	mov r1, r10
	mov r3, r9
	bl AddTextPrinterParameterized
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0810FBA0
_0810FBD0:
	adds r0, r6, 0
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PrintTextArray

	thumb_func_start sub_810FBE8
sub_810FBE8: @ 810FBE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r4, [sp, 0x40]
	ldr r5, [sp, 0x44]
	ldr r6, [sp, 0x4C]
	ldr r7, [sp, 0x50]
	mov r8, r7
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x14]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x18]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r9, r6
	mov r0, r8
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _0810FC68
_0810FC30:
	lsls r0, r4, 3
	ldr r1, [sp, 0x48]
	adds r0, r1
	ldr r2, [r0]
	mov r0, r10
	muls r0, r4
	ldr r1, [sp, 0x1C]
	adds r0, r1, r0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	str r6, [sp, 0x10]
	adds r0, r7, 0
	ldr r1, [sp, 0x14]
	ldr r3, [sp, 0x18]
	bl AddTextPrinterParameterized5
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0810FC30
_0810FC68:
	adds r0, r7, 0
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810FBE8

	thumb_func_start sub_810FC80
sub_810FC80: @ 810FC80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	mov r8, r0
	adds r6, r1, 0
	adds r4, r2, 0
	adds r5, r3, 0
	ldr r7, [sp, 0x24]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	str r4, [sp]
	str r5, [sp, 0x4]
	str r7, [sp, 0x8]
	mov r0, r8
	adds r1, r6, 0
	movs r3, 0
	bl PrintTextArray
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810FC80

	thumb_func_start AddItemMenuActionTextPrinters
AddItemMenuActionTextPrinters: @ 810FCD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r6, r1, 0
	mov r8, r2
	ldr r1, [sp, 0x38]
	mov r9, r1
	ldr r1, [sp, 0x3C]
	ldr r2, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
	lsls r6, 24
	lsrs r6, 24
	mov r4, r8
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x14]
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r7, r2, 24
	mov r0, sp
	ldrb r1, [r0, 0x10]
	strb r1, [r0, 0x4]
	strb r6, [r0, 0x5]
	adds r0, r6, 0
	movs r1, 0x5
	bl GetFontAttribute
	mov r3, sp
	lsls r0, 4
	ldrb r2, [r3, 0xC]
	movs r5, 0xF
	adds r1, r5, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xC]
	adds r0, r6, 0
	movs r1, 0x6
	bl GetFontAttribute
	mov r3, sp
	adds r1, r5, 0
	ands r1, r0
	ldrb r2, [r3, 0xD]
	movs r4, 0x10
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0xD]
	adds r0, r6, 0
	movs r1, 0x7
	bl GetFontAttribute
	mov r3, sp
	lsls r0, 4
	ldrb r2, [r3, 0xD]
	adds r1, r5, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xD]
	adds r0, r6, 0
	movs r1, 0x4
	bl GetFontAttribute
	mov r1, sp
	ands r5, r0
	ldrb r0, [r1, 0xC]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, 0xC]
	mov r0, sp
	mov r2, r9
	strb r2, [r0, 0xA]
	adds r0, r6, 0
	movs r1, 0x3
	bl GetFontAttribute
	mov r1, sp
	strb r0, [r1, 0xB]
	mov r0, sp
	mov r4, r8
	strb r4, [r0, 0x6]
	strb r4, [r0, 0x8]
	movs r4, 0
	cmp r4, r7
	bcs _0810FDCA
	mov r5, sp
_0810FD9A:
	ldr r1, [sp, 0x48]
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, 3
	ldr r2, [sp, 0x44]
	adds r0, r2
	ldr r0, [r0]
	str r0, [sp]
	mov r0, r10
	muls r0, r4
	ldr r1, [sp, 0x14]
	adds r0, r1, r0
	strb r0, [r5, 0x7]
	strb r0, [r5, 0x9]
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0
	bl AddTextPrinter
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r7
	bcc _0810FD9A
_0810FDCA:
	ldr r0, [sp, 0x10]
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end AddItemMenuActionTextPrinters

	thumb_func_start sub_810FDE4
sub_810FDE4: @ 810FDE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r0
	adds r4, r1, 0
	adds r6, r2, 0
	mov r8, r3
	ldr r7, [sp, 0x30]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetFontAttribute
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	movs r1, 0x2
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	str r6, [sp, 0x4]
	mov r0, r8
	str r0, [sp, 0x8]
	str r7, [sp, 0xC]
	ldr r0, [sp, 0x34]
	str r0, [sp, 0x10]
	mov r0, r9
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl AddItemMenuActionTextPrinters
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810FDE4

	thumb_func_start SetWindowTemplateFields
SetWindowTemplateFields: @ 810FE50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, [sp, 0x28]
	mov r12, r4
	ldr r4, [sp, 0x2C]
	mov r9, r4
	ldr r4, [sp, 0x30]
	mov r10, r4
	ldr r7, [sp, 0x34]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsls r3, 24
	mov r4, r9
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	mov r4, r10
	lsls r4, 24
	mov r10, r4
	ldr r4, _0810FEF0 @ =0xffffff00
	mov r8, r4
	mov r5, r8
	ldr r4, [sp]
	ands r5, r4
	orrs r5, r1
	str r5, [sp]
	lsrs r2, 16
	ldr r6, _0810FEF4 @ =0xffff00ff
	adds r4, r6, 0
	ands r4, r5
	orrs r4, r2
	str r4, [sp]
	lsrs r3, 8
	ldr r1, _0810FEF8 @ =0xff00ffff
	ands r1, r4
	orrs r1, r3
	str r1, [sp]
	mov r2, r12
	lsls r2, 24
	mov r12, r2
	ldr r2, _0810FEFC @ =0x00ffffff
	ands r1, r2
	mov r4, r12
	orrs r4, r1
	str r4, [sp]
	ldr r1, [sp, 0x4]
	mov r2, r8
	ands r1, r2
	mov r4, r9
	orrs r1, r4
	mov r8, r1
	str r1, [sp, 0x4]
	mov r1, r10
	lsrs r1, 16
	mov r2, r8
	ands r6, r2
	orrs r6, r1
	str r6, [sp, 0x4]
	lsls r2, r7, 16
	ldr r1, _0810FF00 @ =0x0000ffff
	ands r6, r1
	orrs r6, r2
	str r6, [sp, 0x4]
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	str r1, [r0]
	str r2, [r0, 0x4]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r2}
	bx r2
	.align 2, 0
_0810FEF0: .4byte 0xffffff00
_0810FEF4: .4byte 0xffff00ff
_0810FEF8: .4byte 0xff00ffff
_0810FEFC: .4byte 0x00ffffff
_0810FF00: .4byte 0x0000ffff
	thumb_func_end SetWindowTemplateFields

	thumb_func_start sub_810FF04
sub_810FF04: @ 810FF04
	push {r4-r6,lr}
	sub sp, 0x20
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, [sp, 0x30]
	ldr r1, [sp, 0x34]
	ldr r2, [sp, 0x38]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	str r3, [sp]
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	add r0, sp, 0x10
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl SetWindowTemplateFields
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	add r0, sp, 0x18
	bl AddWindow
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x20
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810FF04

	thumb_func_start CreateYesNoMenu
CreateYesNoMenu: @ 810FF60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	adds r6, r1, 0
	mov r8, r2
	mov r9, r3
	ldr r4, [sp, 0x3C]
	ldr r5, [sp, 0x40]
	ldr r1, [sp, 0x44]
	mov r10, r1
	lsls r6, 24
	lsrs r6, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	mov r1, r10
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	ldr r7, _0811009C @ =gUnknown_203ADF3
	bl AddWindow
	strb r0, [r7]
	ldrb r0, [r7]
	movs r1, 0x1
	adds r2, r4, 0
	adds r3, r5, 0
	bl SetWindowBorderStyle
	ldr r0, _081100A0 @ =gUnknown_841623D
	str r0, [sp, 0xC]
	add r1, sp, 0xC
	ldrb r0, [r7]
	strb r0, [r1, 0x4]
	adds r0, r1, 0
	strb r6, [r0, 0x5]
	adds r0, r6, 0
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	add r1, sp, 0xC
	add r0, r8
	strb r0, [r1, 0x6]
	adds r0, r1, 0
	mov r1, r9
	strb r1, [r0, 0x7]
	adds r1, r0, 0
	ldrb r0, [r0, 0x6]
	strb r0, [r1, 0x8]
	adds r0, r1, 0
	ldrb r0, [r0, 0x7]
	strb r0, [r1, 0x9]
	adds r0, r6, 0
	movs r1, 0x5
	bl GetFontAttribute
	add r3, sp, 0xC
	lsls r0, 4
	ldrb r2, [r3, 0xC]
	movs r5, 0xF
	adds r1, r5, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xC]
	adds r0, r6, 0
	movs r1, 0x6
	bl GetFontAttribute
	add r3, sp, 0xC
	adds r1, r5, 0
	ands r1, r0
	ldrb r2, [r3, 0xD]
	movs r4, 0x10
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0xD]
	adds r0, r6, 0
	movs r1, 0x7
	bl GetFontAttribute
	add r3, sp, 0xC
	lsls r0, 4
	ldrb r2, [r3, 0xD]
	adds r1, r5, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xD]
	adds r0, r6, 0
	movs r1, 0x4
	bl GetFontAttribute
	add r1, sp, 0xC
	ands r5, r0
	ldrb r0, [r1, 0xC]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, 0xC]
	adds r0, r6, 0
	movs r1, 0x2
	bl GetFontAttribute
	add r1, sp, 0xC
	strb r0, [r1, 0xA]
	adds r0, r6, 0
	movs r1, 0x3
	bl GetFontAttribute
	add r1, sp, 0xC
	strb r0, [r1, 0xB]
	adds r0, r1, 0
	movs r1, 0xFF
	movs r2, 0
	bl AddTextPrinter
	adds r0, r6, 0
	movs r1, 0x1
	bl GetFontAttribute
	add r1, sp, 0xC
	ldrb r1, [r1, 0xB]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r7]
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	adds r0, r1, 0
	adds r1, r6, 0
	mov r2, r8
	mov r3, r9
	bl ProgramAndPlaceMenuCursorOnWindow
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811009C: .4byte gUnknown_203ADF3
_081100A0: .4byte gUnknown_841623D
	thumb_func_end CreateYesNoMenu

	thumb_func_start sub_81100A4
sub_81100A4: @ 81100A4
	push {lr}
	sub sp, 0xC
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	str r2, [sp]
	str r3, [sp, 0x4]
	movs r2, 0
	str r2, [sp, 0x8]
	movs r3, 0
	bl CreateYesNoMenu
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_81100A4

	thumb_func_start Menu_ProcessInputNoWrapClearOnChoose
Menu_ProcessInputNoWrapClearOnChoose: @ 81100C8
	push {r4,lr}
	bl ProcessMenuInputNoWrapAround
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _081100DE
	bl sub_81100E8
_081100DE:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Menu_ProcessInputNoWrapClearOnChoose

	thumb_func_start sub_81100E8
sub_81100E8: @ 81100E8
	push {r4,lr}
	ldr r4, _08110100 @ =gUnknown_203ADF3
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810F4D8
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110100: .4byte gUnknown_203ADF3
	thumb_func_end sub_81100E8

	thumb_func_start sub_8110104
sub_8110104: @ 8110104
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r4, [sp, 0x40]
	ldr r5, [sp, 0x44]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x14]
	lsls r4, 24
	lsrs r6, r4, 24
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x18]
	mov r0, r9
	movs r1, 0
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	mov r0, r9
	movs r1, 0x1
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x10
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x1C]
	movs r5, 0
	b _081101B8
_08110164:
	movs r4, 0
	adds r1, r5, 0x1
	mov r8, r1
	cmp r4, r6
	bcs _081101B2
	ldr r1, [sp, 0x14]
	adds r0, r1, 0
	muls r0, r5
	ldr r1, [sp, 0x1C]
	adds r0, r1, r0
	lsls r0, 24
	lsrs r7, r0, 24
_0811017C:
	adds r0, r5, 0
	muls r0, r6
	adds r0, r4
	lsls r0, 3
	ldr r1, [sp, 0x48]
	adds r0, r1
	ldr r2, [r0]
	ldr r0, [sp, 0x10]
	adds r3, r0, 0
	muls r3, r4
	add r3, r10
	lsls r3, 24
	lsrs r3, 24
	str r7, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldr r0, [sp, 0xC]
	mov r1, r9
	bl AddTextPrinterParameterized
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _0811017C
_081101B2:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
_081101B8:
	ldr r0, [sp, 0x18]
	cmp r5, r0
	bcc _08110164
	ldr r0, [sp, 0xC]
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8110104

	thumb_func_start sub_81101D8
sub_81101D8: @ 81101D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, [sp, 0x3C]
	ldr r5, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x14]
	lsls r4, 24
	lsrs r6, r4, 24
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x18]
	mov r0, r10
	movs r1, 0
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r5, 0
	b _08110272
_0811021C:
	movs r4, 0
	adds r1, r5, 0x1
	mov r8, r1
	cmp r4, r6
	bcs _0811026C
	ldr r1, [sp, 0x14]
	adds r0, r1, 0
	muls r0, r5
	lsls r0, 24
	lsrs r7, r0, 24
_08110230:
	adds r0, r5, 0
	muls r0, r6
	adds r0, r4
	ldr r1, [sp, 0x48]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, [sp, 0x44]
	adds r0, r1
	ldr r2, [r0]
	ldr r0, [sp, 0x10]
	adds r3, r0, 0
	muls r3, r4
	add r3, r9
	lsls r3, 24
	lsrs r3, 24
	str r7, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldr r0, [sp, 0xC]
	mov r1, r10
	bl AddTextPrinterParameterized
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08110230
_0811026C:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
_08110272:
	ldr r0, [sp, 0x18]
	cmp r5, r0
	bcc _0811021C
	ldr r0, [sp, 0xC]
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81101D8

	thumb_func_start sub_8110290
sub_8110290: @ 8110290
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, [sp, 0x20]
	mov r12, r4
	ldr r4, [sp, 0x24]
	mov r8, r4
	ldr r4, [sp, 0x28]
	mov r9, r4
	ldr r4, [sp, 0x2C]
	mov r10, r4
	ldr r4, [sp, 0x30]
	ldr r5, [sp, 0x34]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r7, r5, 24
	ldr r5, _081102E8 @ =gUnknown_203ADE4
	movs r6, 0
	strb r2, [r5]
	strb r3, [r5, 0x1]
	strb r6, [r5, 0x3]
	subs r4, 0x1
	strb r4, [r5, 0x4]
	strb r0, [r5, 0x5]
	strb r1, [r5, 0x6]
	mov r0, r12
	strb r0, [r5, 0x7]
	mov r4, r8
	strb r4, [r5, 0x8]
	mov r0, r9
	strb r0, [r5, 0x9]
	mov r4, r10
	strb r4, [r5, 0xA]
	cmp r7, 0
	blt _081102E4
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	cmp r7, r0
	ble _081102EC
_081102E4:
	strb r6, [r5, 0x2]
	b _081102EE
	.align 2, 0
_081102E8: .4byte gUnknown_203ADE4
_081102EC:
	strb r7, [r5, 0x2]
_081102EE:
	movs r0, 0
	movs r1, 0
	bl sub_8110450
	ldr r0, _08110308 @ =gUnknown_203ADE4
	ldrb r0, [r0, 0x2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08110308: .4byte gUnknown_203ADE4
	thumb_func_end sub_8110290

	thumb_func_start sub_811030C
sub_811030C: @ 811030C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	ldr r4, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	ldr r6, [sp, 0x40]
	ldr r7, [sp, 0x44]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r7, 24
	adds r4, r7, 0
	lsrs r4, 24
	mov r9, r4
	movs r7, 0x10
	mov r10, r7
	adds r4, r5, 0
	muls r4, r6
	lsls r4, 24
	lsrs r4, 24
	mov r7, r8
	str r7, [sp]
	mov r7, r10
	str r7, [sp, 0x4]
	str r5, [sp, 0x8]
	str r6, [sp, 0xC]
	str r4, [sp, 0x10]
	mov r4, r9
	str r4, [sp, 0x14]
	bl sub_8110290
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811030C

	thumb_func_start sub_811037C
sub_811037C: @ 811037C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, r1, 24
	lsrs r7, r0, 24
	ldr r5, _08110448 @ =gUnknown_203ADE4
	ldrb r0, [r5, 0x6]
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	mov r9, r0
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldrb r0, [r5, 0x6]
	movs r1, 0x1
	bl GetMenuCursorDimensionByFont
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldrb r0, [r5, 0x9]
	mov r10, r0
	mov r0, r8
	mov r1, r10
	bl __umodsi3
	ldrb r1, [r5, 0x7]
	adds r4, r1, 0
	muls r4, r0
	ldrb r1, [r5]
	adds r4, r1
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	mov r1, r10
	bl __udivsi3
	ldrb r1, [r5, 0x8]
	adds r3, r1, 0
	muls r3, r0
	ldrb r0, [r5, 0x1]
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r5, 0x5]
	mov r1, r9
	str r1, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x11
	adds r2, r4, 0
	bl FillWindowPixelRect
	ldrb r6, [r5, 0x9]
	adds r0, r7, 0
	adds r1, r6, 0
	bl __umodsi3
	ldrb r1, [r5, 0x7]
	adds r4, r1, 0
	muls r4, r0
	ldrb r0, [r5]
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	adds r1, r6, 0
	bl __udivsi3
	ldrb r1, [r5, 0x8]
	adds r3, r1, 0
	muls r3, r0
	ldrb r1, [r5, 0x1]
	adds r3, r1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r5, 0x5]
	ldrb r1, [r5, 0x6]
	ldr r2, _0811044C @ =gFameCheckerText_ListMenuCursor
	str r3, [sp]
	movs r3, 0
	str r3, [sp, 0x4]
	str r3, [sp, 0x8]
	adds r3, r4, 0
	bl AddTextPrinterParameterized
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08110448: .4byte gUnknown_203ADE4
_0811044C: .4byte gFameCheckerText_ListMenuCursor
	thumb_func_end sub_811037C

	thumb_func_start sub_8110450
sub_8110450: @ 8110450
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r1, _0811048C @ =gUnknown_203ADE4
	ldrb r2, [r1, 0x2]
	mov r8, r2
	lsls r0, 24
	asrs r6, r0, 24
	adds r5, r1, 0
	cmp r6, 0
	beq _081104A6
	movs r7, 0x2
	ldrsb r7, [r5, r7]
	ldrb r4, [r5, 0x9]
	adds r0, r7, 0
	adds r1, r4, 0
	bl __modsi3
	adds r0, r6
	cmp r0, 0
	bge _08110490
	adds r0, r4, 0
	adds r0, 0xFF
	add r0, r8
	b _081104A4
	.align 2, 0
_0811048C: .4byte gUnknown_203ADE4
_08110490:
	cmp r0, r4
	blt _081104A0
	adds r0, r7, 0
	adds r1, r4, 0
	bl __divsi3
	muls r0, r4
	b _081104A4
_081104A0:
	mov r1, r8
	adds r0, r6, r1
_081104A4:
	strb r0, [r5, 0x2]
_081104A6:
	mov r2, r9
	lsls r0, r2, 24
	asrs r6, r0, 24
	cmp r6, 0
	beq _081104EA
	movs r0, 0x2
	ldrsb r0, [r5, r0]
	ldrb r4, [r5, 0x9]
	adds r1, r4, 0
	bl __divsi3
	adds r1, r0, r6
	cmp r1, 0
	bge _081104CE
	ldrb r0, [r5, 0xA]
	subs r0, 0x1
	muls r0, r4
	ldrb r1, [r5, 0x2]
	adds r0, r1
	b _081104E8
_081104CE:
	ldrb r0, [r5, 0xA]
	cmp r1, r0
	blt _081104E0
	subs r0, 0x1
	adds r1, r4, 0
	muls r1, r0
	ldrb r0, [r5, 0x2]
	subs r0, r1
	b _081104E8
_081104E0:
	adds r0, r4, 0
	muls r0, r6
	ldrb r2, [r5, 0x2]
	adds r0, r2
_081104E8:
	strb r0, [r5, 0x2]
_081104EA:
	movs r1, 0x2
	ldrsb r1, [r5, r1]
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bgt _08110500
	ldrb r1, [r5, 0x2]
	mov r0, r8
	bl sub_811037C
	b _08110504
_08110500:
	mov r0, r8
	strb r0, [r5, 0x2]
_08110504:
	ldrb r0, [r5, 0x2]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8110450

	thumb_func_start sub_8110514
sub_8110514: @ 8110514
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r1, _0811058C @ =gUnknown_203ADE4
	ldrb r7, [r1, 0x2]
	lsls r0, 24
	asrs r4, r0, 24
	adds r5, r1, 0
	cmp r4, 0
	beq _08110548
	movs r0, 0x2
	ldrsb r0, [r5, r0]
	ldrb r6, [r5, 0x9]
	adds r1, r6, 0
	bl __modsi3
	adds r0, r4
	cmp r0, 0
	blt _08110548
	cmp r0, r6
	bge _08110548
	adds r0, r4, r7
	strb r0, [r5, 0x2]
_08110548:
	mov r1, r8
	lsls r0, r1, 24
	asrs r4, r0, 24
	cmp r4, 0
	beq _08110574
	movs r0, 0x2
	ldrsb r0, [r5, r0]
	ldrb r6, [r5, 0x9]
	adds r1, r6, 0
	bl __divsi3
	adds r0, r4
	cmp r0, 0
	blt _08110574
	ldrb r1, [r5, 0xA]
	cmp r0, r1
	bge _08110574
	adds r0, r6, 0
	muls r0, r4
	ldrb r1, [r5, 0x2]
	adds r0, r1
	strb r0, [r5, 0x2]
_08110574:
	movs r1, 0x2
	ldrsb r1, [r5, r1]
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bgt _08110590
	ldrb r1, [r5, 0x2]
	adds r0, r7, 0
	bl sub_811037C
	b _08110592
	.align 2, 0
_0811058C: .4byte gUnknown_203ADE4
_08110590:
	strb r7, [r5, 0x2]
_08110592:
	ldrb r0, [r5, 0x2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8110514

	thumb_func_start sub_81105A0
sub_81105A0: @ 81105A0
	push {r4,lr}
	ldr r4, _081105C0 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081105C8
	movs r0, 0x5
	bl PlaySE
	ldr r0, _081105C4 @ =gUnknown_203ADE4
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	b _08110648
	.align 2, 0
_081105C0: .4byte gMain
_081105C4: .4byte gUnknown_203ADE4
_081105C8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081105D6
	movs r0, 0x1
	negs r0, r0
	b _08110648
_081105D6:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _081105EC
	movs r0, 0x5
	bl PlaySE
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	b _08110640
_081105EC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08110600
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	movs r1, 0x1
	b _08110640
_08110600:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08110614
	bl GetLRKeysState
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08110620
_08110614:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _0811063E
_08110620:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08110636
	bl GetLRKeysState
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08110644
_08110636:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_0811063E:
	movs r1, 0
_08110640:
	bl sub_8110450
_08110644:
	movs r0, 0x2
	negs r0, r0
_08110648:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81105A0

	thumb_func_start sub_8110650
sub_8110650: @ 8110650
	push {r4-r6,lr}
	ldr r5, _08110670 @ =gUnknown_203ADE4
	ldrb r4, [r5, 0x2]
	ldr r6, _08110674 @ =gMain
	ldrh r1, [r6, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08110678
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	ldrsb r0, [r5, r0]
	b _081106EE
	.align 2, 0
_08110670: .4byte gUnknown_203ADE4
_08110674: .4byte gMain
_08110678:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08110686
	movs r0, 0x1
	negs r0, r0
	b _081106EE
_08110686:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08110696
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	b _081106D8
_08110696:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081106A4
	movs r0, 0
	movs r1, 0x1
	b _081106D8
_081106A4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _081106B8
	bl GetLRKeysState
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081106BE
_081106B8:
	movs r0, 0x1
	negs r0, r0
	b _081106D6
_081106BE:
	ldrh r1, [r6, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _081106D4
	bl GetLRKeysState
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _081106EA
_081106D4:
	movs r0, 0x1
_081106D6:
	movs r1, 0
_081106D8:
	bl sub_8110514
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _081106EA
	movs r0, 0x5
	bl PlaySE
_081106EA:
	movs r0, 0x2
	negs r0, r0
_081106EE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8110650

	thumb_func_start sub_81106F4
sub_81106F4: @ 81106F4
	push {r4,r5,lr}
	ldr r4, _08110714 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811071C
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08110718 @ =gUnknown_203ADE4
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	b _08110798
	.align 2, 0
_08110714: .4byte gMain
_08110718: .4byte gUnknown_203ADE4
_0811071C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0811072A
	movs r0, 0x1
	negs r0, r0
	b _08110798
_0811072A:
	ldrh r0, [r4, 0x30]
	movs r5, 0xF0
	adds r1, r5, 0
	ands r1, r0
	cmp r1, 0x40
	bne _08110744
	movs r0, 0x5
	bl PlaySE
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	b _08110790
_08110744:
	cmp r1, 0x80
	bne _08110754
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	movs r1, 0x1
	b _08110790
_08110754:
	cmp r1, 0x20
	beq _08110764
	bl sub_80BF66C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08110770
_08110764:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _0811078E
_08110770:
	ldrh r1, [r4, 0x30]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0x10
	beq _08110786
	bl sub_80BF66C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08110794
_08110786:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_0811078E:
	movs r1, 0
_08110790:
	bl sub_8110450
_08110794:
	movs r0, 0x2
	negs r0, r0
_08110798:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81106F4

	thumb_func_start sub_81107A0
sub_81107A0: @ 81107A0
	push {r4-r6,lr}
	ldr r6, _081107C0 @ =gUnknown_203ADE4
	ldrb r4, [r6, 0x2]
	ldr r5, _081107C4 @ =gMain
	ldrh r1, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081107C8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	ldrsb r0, [r6, r0]
	b _0811083A
	.align 2, 0
_081107C0: .4byte gUnknown_203ADE4
_081107C4: .4byte gMain
_081107C8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081107D6
	movs r0, 0x1
	negs r0, r0
	b _0811083A
_081107D6:
	ldrh r0, [r5, 0x30]
	movs r6, 0xF0
	adds r1, r6, 0
	ands r1, r0
	cmp r1, 0x40
	bne _081107EA
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	b _08110824
_081107EA:
	cmp r1, 0x80
	bne _081107F4
	movs r0, 0
	movs r1, 0x1
	b _08110824
_081107F4:
	cmp r1, 0x20
	beq _08110804
	bl sub_80BF66C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0811080A
_08110804:
	movs r0, 0x1
	negs r0, r0
	b _08110822
_0811080A:
	ldrh r1, [r5, 0x30]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0x10
	beq _08110820
	bl sub_80BF66C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08110836
_08110820:
	movs r0, 0x1
_08110822:
	movs r1, 0
_08110824:
	bl sub_8110514
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _08110836
	movs r0, 0x5
	bl PlaySE
_08110836:
	movs r0, 0x2
	negs r0, r0
_0811083A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81107A0

	.align 2, 0 @ Don't pad with nop.
