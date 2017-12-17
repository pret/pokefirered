	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815EDDC
sub_815EDDC: @ 815EDDC
	ldr r1, _0815EDF0 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	movs r2, 0xF2
	lsls r2, 4
	adds r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	eors r0, r1
	bx lr
	.align 2, 0
_0815EDF0: .4byte gSaveBlock2Ptr
	thumb_func_end sub_815EDDC

	thumb_func_start sub_815EDF4
sub_815EDF4: @ 815EDF4
	ldr r2, _0815EE08 @ =gSaveBlock2Ptr
	ldr r2, [r2]
	movs r3, 0xF2
	lsls r3, 4
	adds r2, r3
	ldr r2, [r2]
	eors r2, r1
	str r2, [r0]
	bx lr
	.align 2, 0
_0815EE08: .4byte gSaveBlock2Ptr
	thumb_func_end sub_815EDF4

	thumb_func_start sub_815EE0C
sub_815EE0C: @ 815EE0C
	push {r4-r6,lr}
	ldr r6, _0815EE30 @ =gSaveBlock1Ptr
	ldr r5, _0815EE34 @ =0x00003d38
	movs r4, 0x3
_0815EE14:
	ldr r0, [r6]
	adds r0, r5
	adds r0, 0x4
	ldr r1, _0815EE38 @ =0x00034bbf
	bl sub_815EDF4
	adds r5, 0xC
	subs r4, 0x1
	cmp r4, 0
	bge _0815EE14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815EE30: .4byte gSaveBlock1Ptr
_0815EE34: .4byte 0x00003d38
_0815EE38: .4byte 0x00034bbf
	thumb_func_end sub_815EE0C

	thumb_func_start sub_815EE3C
sub_815EE3C: @ 815EE3C
	ldr r1, _0815EE50 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	movs r2, 0xF2
	lsls r2, 4
	adds r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	eors r0, r1
	bx lr
	.align 2, 0
_0815EE50: .4byte gSaveBlock2Ptr
	thumb_func_end sub_815EE3C

	thumb_func_start sub_815EE54
sub_815EE54: @ 815EE54
	ldr r2, _0815EE68 @ =gSaveBlock2Ptr
	ldr r2, [r2]
	movs r3, 0xF2
	lsls r3, 4
	adds r2, r3
	ldr r2, [r2]
	eors r2, r1
	str r2, [r0]
	bx lr
	.align 2, 0
_0815EE68: .4byte gSaveBlock2Ptr
	thumb_func_end sub_815EE54

	thumb_func_start sub_815EE6C
sub_815EE6C: @ 815EE6C
	push {lr}
	adds r1, r0, 0
	ldr r0, _0815EE80 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r2, _0815EE84 @ =0x00000af8
	adds r0, r2
	bl sub_804C588
	pop {r0}
	bx r0
	.align 2, 0
_0815EE80: .4byte gSaveBlock2Ptr
_0815EE84: .4byte 0x00000af8
	thumb_func_end sub_815EE6C

	thumb_func_start sub_815EE88
sub_815EE88: @ 815EE88
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0815EEA0 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _0815EEA4 @ =0x00000af8
	adds r0, r1
	bl sub_815EE3C
	cmp r0, r4
	bcc _0815EEA8
	movs r0, 0x1
	b _0815EEAA
	.align 2, 0
_0815EEA0: .4byte gSaveBlock2Ptr
_0815EEA4: .4byte 0x00000af8
_0815EEA8:
	movs r0, 0
_0815EEAA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_815EE88

	thumb_func_start sub_815EEB0
sub_815EEB0: @ 815EEB0
	push {lr}
	ldr r0, _0815EECC @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _0815EED0 @ =0x00000af8
	adds r0, r1
	bl sub_815EE3C
	ldr r1, _0815EED4 @ =gUnknown_20370C0
	ldrh r1, [r1]
	cmp r0, r1
	bcc _0815EED8
	movs r0, 0x1
	b _0815EEDA
	.align 2, 0
_0815EECC: .4byte gSaveBlock2Ptr
_0815EED0: .4byte 0x00000af8
_0815EED4: .4byte gUnknown_20370C0
_0815EED8:
	movs r0, 0
_0815EEDA:
	pop {r1}
	bx r1
	thumb_func_end sub_815EEB0

	thumb_func_start sub_815EEE0
sub_815EEE0: @ 815EEE0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _0815EF04 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _0815EF08 @ =0x00000af8
	adds r5, r0, r1
	adds r0, r5, 0
	bl sub_815EE3C
	adds r1, r0, r4
	ldr r2, _0815EF0C @ =0x0001869f
	cmp r1, r2
	bhi _0815EF10
	adds r0, r5, 0
	bl sub_815EE54
	movs r0, 0x1
	b _0815EF1A
	.align 2, 0
_0815EF04: .4byte gSaveBlock2Ptr
_0815EF08: .4byte 0x00000af8
_0815EF0C: .4byte 0x0001869f
_0815EF10:
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_815EE54
	movs r0, 0
_0815EF1A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_815EEE0

	thumb_func_start sub_815EF20
sub_815EF20: @ 815EF20
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _0815EF4C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _0815EF50 @ =0x00000af8
	adds r4, r0, r1
	adds r0, r5, 0
	bl sub_815EE88
	lsls r0, 24
	cmp r0, 0
	beq _0815EF54
	adds r0, r4, 0
	bl sub_815EE3C
	adds r1, r0, 0
	subs r1, r5
	adds r0, r4, 0
	bl sub_815EE54
	movs r0, 0x1
	b _0815EF56
	.align 2, 0
_0815EF4C: .4byte gSaveBlock2Ptr
_0815EF50: .4byte 0x00000af8
_0815EF54:
	movs r0, 0
_0815EF56:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_815EF20

	thumb_func_start sub_815EF5C
sub_815EF5C: @ 815EF5C
	push {r4,r5,lr}
	ldr r0, _0815EF8C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _0815EF90 @ =0x00000af8
	adds r4, r0, r1
	ldr r5, _0815EF94 @ =gUnknown_20370C0
	ldrh r0, [r5]
	bl sub_815EE88
	lsls r0, 24
	cmp r0, 0
	beq _0815EF98
	adds r0, r4, 0
	bl sub_815EE3C
	adds r1, r0, 0
	ldrh r0, [r5]
	subs r1, r0
	adds r0, r4, 0
	bl sub_815EE54
	movs r0, 0x1
	b _0815EF9A
	.align 2, 0
_0815EF8C: .4byte gSaveBlock2Ptr
_0815EF90: .4byte 0x00000af8
_0815EF94: .4byte gUnknown_20370C0
_0815EF98:
	movs r0, 0
_0815EF9A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_815EF5C

	thumb_func_start sub_815EFA0
sub_815EFA0: @ 815EFA0
	push {lr}
	ldr r0, _0815EFB4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _0815EFB8 @ =0x00000af8
	adds r0, r1
	bl sub_815EE3C
	pop {r1}
	bx r1
	.align 2, 0
_0815EFB4: .4byte gSaveBlock2Ptr
_0815EFB8: .4byte 0x00000af8
	thumb_func_end sub_815EFA0

	thumb_func_start sub_815EFBC
sub_815EFBC: @ 815EFBC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0xC
	adds r6, r0, 0
	mov r8, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x24]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0815F010 @ =gUnknown_2021CD0
	mov r9, r0
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	mov r2, r9
	mov r3, r8
	bl PrintTextOnWindow
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815F010: .4byte gUnknown_2021CD0
	thumb_func_end sub_815EFBC

	thumb_func_start sub_815F014
sub_815F014: @ 815F014
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl SetWindowBorderStyle
	ldr r2, _0815F06C @ =gUnknown_8416655
	movs r4, 0
	str r4, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r3, 0
	bl PrintTextOnWindow
	str r4, [sp]
	adds r0, r6, 0
	mov r1, r8
	movs r2, 0x27
	movs r3, 0xC
	bl sub_815EFBC
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815F06C: .4byte gUnknown_8416655
	thumb_func_end sub_815F014

	thumb_func_start sub_815F070
sub_815F070: @ 815F070
	push {lr}
	sub sp, 0x4
	bl sub_815EFA0
	adds r1, r0, 0
	ldr r0, _0815F090 @ =gUnknown_203F464
	ldrb r0, [r0]
	movs r2, 0
	str r2, [sp]
	movs r2, 0x27
	movs r3, 0xC
	bl sub_815EFBC
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0815F090: .4byte gUnknown_203F464
	thumb_func_end sub_815F070

	thumb_func_start sub_815F094
sub_815F094: @ 815F094
	push {r4,r5,lr}
	sub sp, 0x20
	ldr r0, _0815F108 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0815F100
	movs r0, 0x8
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0x20
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	movs r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl SetWindowTemplateFields
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r4, _0815F10C @ =gUnknown_203F464
	add r0, sp, 0x18
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	ldr r5, _0815F110 @ =0x0000021d
	adds r1, r5, 0
	movs r2, 0xD0
	bl sub_814FF2C
	ldrb r4, [r4]
	bl sub_815EFA0
	adds r3, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0xD
	bl sub_815F014
_0815F100:
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815F108: .4byte sub_809D6D4
_0815F10C: .4byte gUnknown_203F464
_0815F110: .4byte 0x0000021d
	thumb_func_end sub_815F094

	thumb_func_start sub_815F114
sub_815F114: @ 815F114
	push {r4,lr}
	ldr r4, _0815F134 @ =gUnknown_203F464
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810F4D8
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815F134: .4byte gUnknown_203F464
	thumb_func_end sub_815F114

	.align 2, 0 @ Don't pad with nop.
