	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_810B858
sub_810B858: @ 810B858
	push {r4,lr}
	ldr r0, _0810B86C @ =gUnknown_203ACFC
	ldrb r0, [r0, 0x4]
	cmp r0, 0x3
	beq _0810B874
	ldr r0, _0810B870 @ =gUnknown_84530C4
	bl InitWindows
	b _0810B87A
	.align 2, 0
_0810B86C: .4byte gUnknown_203ACFC
_0810B870: .4byte gUnknown_84530C4
_0810B874:
	ldr r0, _0810B8E4 @ =gUnknown_84530E4
	bl InitWindows
_0810B87A:
	bl DeactivateAllTextPrinters
	movs r0, 0
	movs r1, 0x64
	movs r2, 0xE0
	bl sub_815001C
	movs r0, 0
	movs r1, 0x6D
	movs r2, 0xD0
	bl sub_814FEAC
	movs r0, 0
	movs r1, 0x81
	movs r2, 0xC0
	bl sub_814FF2C
	ldr r0, _0810B8E8 @ =gUnknown_8453098
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r4, 0
_0810B8A8:
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0810B8A8
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r4, 0
	ldr r3, _0810B8EC @ =gUnknown_203AD34
	movs r2, 0xFF
_0810B8CC:
	adds r0, r4, r3
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _0810B8CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B8E4: .4byte gUnknown_84530E4
_0810B8E8: .4byte gUnknown_8453098
_0810B8EC: .4byte gUnknown_203AD34
	thumb_func_end sub_810B858

	thumb_func_start sub_810B8F0
sub_810B8F0: @ 810B8F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r3
	ldr r3, [sp, 0x30]
	ldr r4, [sp, 0x34]
	ldr r6, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	mov r8, r5
	ldr r5, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	lsls r7, 24
	lsrs r7, 24
	mov r9, r7
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r6, [sp, 0x4]
	lsls r4, r5, 1
	adds r4, r5
	ldr r5, _0810B954 @ =gUnknown_84530B8
	adds r4, r5
	str r4, [sp, 0x8]
	mov r4, r8
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	str r2, [sp, 0x10]
	mov r2, r9
	bl AddTextPrinterParametrized2
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810B954: .4byte gUnknown_84530B8
	thumb_func_end sub_810B8F0

	thumb_func_start sub_810B958
sub_810B958: @ 810B958
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0
	bl sub_8005ED4
	movs r2, 0x48
	subs r2, r0
	lsrs r2, 1
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0810B990 @ =gUnknown_84530B8
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x1
	movs r3, 0x1
	bl box_print
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B990: .4byte gUnknown_84530B8
	thumb_func_end sub_810B958

	thumb_func_start sub_810B994
sub_810B994: @ 810B994
	push {r4,lr}
	sub sp, 0xC
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x81
	movs r3, 0xC
	bl SetWindowBorderStyle
	ldr r4, _0810B9D8 @ =gUnknown_84162E8
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8005ED4
	movs r3, 0x40
	subs r3, r0
	lsrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	adds r2, r4, 0
	bl PrintTextOnWindow
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B9D8: .4byte gUnknown_84162E8
	thumb_func_end sub_810B994

	thumb_func_start sub_810B9DC
sub_810B9DC: @ 810B9DC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r6, _0810BA10 @ =gUnknown_203AD34
	adds r4, r5, r6
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _0810BA2A
	adds r0, r5, r1
	lsls r0, 3
	ldr r1, _0810BA14 @ =gUnknown_8453104
	adds r0, r1
	bl AddWindow
	strb r0, [r4]
	cmp r5, 0x6
	beq _0810BA18
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0x64
	movs r3, 0xE
	bl SetWindowBorderStyle
	b _0810BA24
	.align 2, 0
_0810BA10: .4byte gUnknown_203AD34
_0810BA14: .4byte gUnknown_8453104
_0810BA18:
	ldrb r0, [r6, 0x6]
	movs r1, 0
	movs r2, 0x81
	movs r3, 0xC
	bl SetWindowBorderStyle
_0810BA24:
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
_0810BA2A:
	ldr r0, _0810BA38 @ =gUnknown_203AD34
	adds r0, r5, r0
	ldrb r0, [r0]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0810BA38: .4byte gUnknown_203AD34
	thumb_func_end sub_810B9DC

	thumb_func_start sub_810BA3C
sub_810BA3C: @ 810BA3C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810BA6C @ =gUnknown_203AD34
	adds r4, r0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810BA6C: .4byte gUnknown_203AD34
	thumb_func_end sub_810BA3C

	thumb_func_start sub_810BA70
sub_810BA70: @ 810BA70
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0810BA94 @ =gUnknown_203AD34
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _0810BA8C
	lsls r0, r1, 3
	ldr r1, _0810BA98 @ =gUnknown_8453104
	adds r0, r1
	bl AddWindow
	strb r0, [r4]
_0810BA8C:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810BA94: .4byte gUnknown_203AD34
_0810BA98: .4byte gUnknown_8453104
	thumb_func_end sub_810BA70

	thumb_func_start sub_810BA9C
sub_810BA9C: @ 810BA9C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810BAD4 @ =gUnknown_203AD34
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0810BACE
	movs r1, 0
	bl sub_810F260
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0xFF
	strb r0, [r4]
_0810BACE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810BAD4: .4byte gUnknown_203AD34
	thumb_func_end sub_810BA9C

	thumb_func_start sub_810BAD8
sub_810BAD8: @ 810BAD8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810BAE4 @ =gUnknown_203AD34
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0810BAE4: .4byte gUnknown_203AD34
	thumb_func_end sub_810BAD8

	thumb_func_start sub_810BAE8
sub_810BAE8: @ 810BAE8
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810BB10 @ =gUnknown_845311C
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x64
	str r2, [sp, 0x4]
	movs r2, 0xE
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	movs r2, 0x2
	movs r3, 0
	bl sub_80BF5D0
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0810BB10: .4byte gUnknown_845311C
	thumb_func_end sub_810BAE8

	thumb_func_start sub_810BB14
sub_810BB14: @ 810BB14
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810BB3C @ =gUnknown_8453124
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x64
	str r2, [sp, 0x4]
	movs r2, 0xE
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	movs r2, 0x2
	movs r3, 0
	bl sub_80BF5D0
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0810BB3C: .4byte gUnknown_8453124
	thumb_func_end sub_810BB14

	thumb_func_start sub_810BB40
sub_810BB40: @ 810BB40
	push {r4,lr}
	movs r0, 0x2
	movs r1, 0
	bl sub_810B9DC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810BB70 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl sub_809FD58
	adds r3, r0, 0
	adds r0, r4, 0
	movs r1, 0x81
	movs r2, 0xC
	bl sub_809FF48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810BB70: .4byte gUnknown_3005008
	thumb_func_end sub_810BB40

	thumb_func_start sub_810BB74
sub_810BB74: @ 810BB74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	movs r2, 0xE
	bl sub_8150048
	pop {r0}
	bx r0
	thumb_func_end sub_810BB74

	.align 2, 0 @ Don't pad with nop.
