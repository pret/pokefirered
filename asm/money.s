	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_809FD58
sub_809FD58: @ 809FD58
	ldr r1, _0809FD6C @ =gUnknown_300500C
	ldr r1, [r1]
	movs r2, 0xF2
	lsls r2, 4
	adds r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	eors r0, r1
	bx lr
	.align 2, 0
_0809FD6C: .4byte gUnknown_300500C
	thumb_func_end sub_809FD58

	thumb_func_start sub_809FD70
sub_809FD70: @ 809FD70
	ldr r2, _0809FD84 @ =gUnknown_300500C
	ldr r2, [r2]
	movs r3, 0xF2
	lsls r3, 4
	adds r2, r3
	ldr r2, [r2]
	eors r2, r1
	str r2, [r0]
	bx lr
	.align 2, 0
_0809FD84: .4byte gUnknown_300500C
	thumb_func_end sub_809FD70

	thumb_func_start IsEnoughMoney
IsEnoughMoney: @ 809FD88
	push {r4,lr}
	adds r4, r1, 0
	bl sub_809FD58
	cmp r0, r4
	bcs _0809FD98
	movs r0, 0
	b _0809FD9A
_0809FD98:
	movs r0, 0x1
_0809FD9A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsEnoughMoney

	thumb_func_start AddMoney
AddMoney: @ 809FDA0
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	bl sub_809FD58
	adds r5, r0, 0
	adds r0, r5, r4
	ldr r5, _0809FDD4 @ =0x000f423f
	adds r4, r5, 0
	cmp r0, r5
	bhi _0809FDC4
	adds r5, r0, 0
	adds r0, r6, 0
	bl sub_809FD58
	cmp r5, r0
	bcs _0809FDC4
	adds r5, r4, 0
_0809FDC4:
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_809FD70
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FDD4: .4byte 0x000f423f
	thumb_func_end AddMoney

	thumb_func_start RemoveMoney
RemoveMoney: @ 809FDD8
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl sub_809FD58
	adds r1, r0, 0
	cmp r1, r4
	bcs _0809FDEC
	movs r1, 0
	b _0809FDEE
_0809FDEC:
	subs r1, r4
_0809FDEE:
	adds r0, r5, 0
	bl sub_809FD70
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end RemoveMoney

	thumb_func_start IsEnoughForCostInVar0x8005
IsEnoughForCostInVar0x8005: @ 809FDFC
	push {lr}
	ldr r0, _0809FE18 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	ldr r1, _0809FE1C @ =gUnknown_20370C2
	ldrh r1, [r1]
	bl IsEnoughMoney
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0809FE18: .4byte gUnknown_3005008
_0809FE1C: .4byte gUnknown_20370C2
	thumb_func_end IsEnoughForCostInVar0x8005

	thumb_func_start sub_809FE20
sub_809FE20: @ 809FE20
	push {lr}
	ldr r0, _0809FE38 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	ldr r1, _0809FE3C @ =gUnknown_20370C2
	ldrh r1, [r1]
	bl RemoveMoney
	pop {r0}
	bx r0
	.align 2, 0
_0809FE38: .4byte gUnknown_3005008
_0809FE3C: .4byte gUnknown_20370C2
	thumb_func_end sub_809FE20

	thumb_func_start sub_809FE40
sub_809FE40: @ 809FE40
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _0809FEB8 @ =gUnknown_2021CD0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	subs r1, r0
	ldr r2, _0809FEBC @ =gUnknown_2021D18
	adds r0, r1, 0
	subs r1, 0x1
	cmp r0, 0
	beq _0809FE7E
	movs r3, 0
_0809FE72:
	strb r3, [r2]
	adds r2, 0x1
	adds r0, r1, 0
	subs r1, 0x1
	cmp r0, 0
	bne _0809FE72
_0809FE7E:
	ldr r1, _0809FEC0 @ =gUnknown_841697A
	adds r0, r2, 0
	bl StringExpandPlaceholders
	ldr r4, _0809FEBC @ =gUnknown_2021D18
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8005ED4
	movs r3, 0x40
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0xC
	str r0, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	adds r2, r4, 0
	bl PrintTextOnWindow
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FEB8: .4byte gUnknown_2021CD0
_0809FEBC: .4byte gUnknown_2021D18
_0809FEC0: .4byte gUnknown_841697A
	thumb_func_end sub_809FE40

	thumb_func_start sub_809FEC4
sub_809FEC4: @ 809FEC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r4, [sp, 0x24]
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r4, 24
	lsrs r5, r4, 24
	ldr r4, _0809FF3C @ =gUnknown_2021CD0
	adds r0, r4, 0
	adds r1, r3, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	subs r1, r0
	ldr r2, _0809FF40 @ =gUnknown_2021D18
	adds r0, r1, 0
	subs r1, 0x1
	cmp r0, 0
	beq _0809FF14
	movs r3, 0
_0809FF08:
	strb r3, [r2]
	adds r2, 0x1
	adds r0, r1, 0
	subs r1, 0x1
	cmp r0, 0
	bne _0809FF08
_0809FF14:
	ldr r1, _0809FF44 @ =gUnknown_841697A
	adds r0, r2, 0
	bl StringExpandPlaceholders
	ldr r2, _0809FF40 @ =gUnknown_2021D18
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0
	mov r3, r8
	bl PrintTextOnWindow
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF3C: .4byte gUnknown_2021CD0
_0809FF40: .4byte gUnknown_2021D18
_0809FF44: .4byte gUnknown_841697A
	thumb_func_end sub_809FEC4

	thumb_func_start sub_809FF48
sub_809FF48: @ 809FF48
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
	ldr r2, _0809FF9C @ =gUnknown_8419CE7
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	movs r3, 0
	bl PrintTextOnWindow
	adds r0, r6, 0
	mov r1, r8
	movs r2, 0
	bl sub_809FE40
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF9C: .4byte gUnknown_8419CE7
	thumb_func_end sub_809FF48

	thumb_func_start sub_809FFA0
sub_809FFA0: @ 809FFA0
	push {lr}
	adds r1, r0, 0
	ldr r0, _0809FFB4 @ =gUnknown_2039990
	ldrb r0, [r0]
	movs r2, 0
	bl sub_809FE40
	pop {r0}
	bx r0
	.align 2, 0
_0809FFB4: .4byte gUnknown_2039990
	thumb_func_end sub_809FFA0

	thumb_func_start sub_809FFB8
sub_809FFB8: @ 809FFB8
	push {r4-r6,lr}
	sub sp, 0x20
	adds r6, r0, 0
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	movs r0, 0x80
	lsls r0, 17
	adds r4, r0
	lsrs r4, 24
	adds r3, r0
	lsrs r3, 24
	movs r1, 0x8
	str r1, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	add r0, sp, 0x10
	movs r1, 0
	adds r2, r4, 0
	bl SetWindowTemplateFields
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r4, _080A002C @ =gUnknown_2039990
	add r0, sp, 0x18
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	ldr r5, _080A0030 @ =0x0000021d
	adds r1, r5, 0
	movs r2, 0xD0
	bl sub_814FF2C
	ldrb r0, [r4]
	adds r1, r5, 0
	movs r2, 0xD
	adds r3, r6, 0
	bl sub_809FF48
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A002C: .4byte gUnknown_2039990
_080A0030: .4byte 0x0000021d
	thumb_func_end sub_809FFB8

	thumb_func_start sub_80A0034
sub_80A0034: @ 80A0034
	push {r4,lr}
	ldr r4, _080A0054 @ =gUnknown_2039990
	ldrb r0, [r4]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0054: .4byte gUnknown_2039990
	thumb_func_end sub_80A0034

	.align 2, 0 @ Don't pad with nop.
