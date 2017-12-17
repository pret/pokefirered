	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D0554
sub_80D0554: @ 80D0554
	ldr r0, _080D0574 @ =gUnknown_3005008
	ldr r1, [r0]
	movs r0, 0xA5
	lsls r0, 2
	adds r1, r0
	ldr r0, _080D0578 @ =gUnknown_300500C
	ldr r0, [r0]
	movs r2, 0xF2
	lsls r2, 4
	adds r0, r2
	ldr r0, [r0]
	ldrh r1, [r1]
	eors r0, r1
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_080D0574: .4byte gUnknown_3005008
_080D0578: .4byte gUnknown_300500C
	thumb_func_end sub_80D0554

	thumb_func_start sub_80D057C
sub_80D057C: @ 80D057C
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080D059C @ =gUnknown_3005008
	ldr r2, [r1]
	ldr r1, _080D05A0 @ =gUnknown_300500C
	ldr r1, [r1]
	movs r3, 0xF2
	lsls r3, 4
	adds r1, r3
	ldr r1, [r1]
	eors r0, r1
	movs r1, 0xA5
	lsls r1, 2
	adds r2, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080D059C: .4byte gUnknown_3005008
_080D05A0: .4byte gUnknown_300500C
	thumb_func_end sub_80D057C

	thumb_func_start sub_80D05A4
sub_80D05A4: @ 80D05A4
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_80D0554
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080D05BC @ =0x0000270e
	cmp r1, r0
	bls _080D05C0
	movs r0, 0
	b _080D05DA
	.align 2, 0
_080D05BC: .4byte 0x0000270e
_080D05C0:
	adds r0, r1, r4
	cmp r1, r0
	bgt _080D05D0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080D05E0 @ =0x0000270f
	cmp r1, r0
	bls _080D05D2
_080D05D0:
	ldr r1, _080D05E0 @ =0x0000270f
_080D05D2:
	adds r0, r1, 0
	bl sub_80D057C
	movs r0, 0x1
_080D05DA:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D05E0: .4byte 0x0000270f
	thumb_func_end sub_80D05A4

	thumb_func_start sub_80D05E4
sub_80D05E4: @ 80D05E4
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_80D0554
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bcs _080D05FA
	movs r0, 0
	b _080D0606
_080D05FA:
	subs r0, r4
	lsls r0, 16
	lsrs r0, 16
	bl sub_80D057C
	movs r0, 0x1
_080D0606:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80D05E4

	thumb_func_start sub_80D060C
sub_80D060C: @ 80D060C
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
	ldr r0, _080D0668 @ =gUnknown_2021CD0
	movs r2, 0x1
	movs r3, 0x4
	bl sub_8008E78
	ldr r0, _080D066C @ =gUnknown_2021D18
	mov r9, r0
	ldr r1, _080D0670 @ =gUnknown_84162C4
	bl sub_8008FCC
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	mov r2, r9
	mov r3, r8
	bl sub_8002C48
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D0668: .4byte gUnknown_2021CD0
_080D066C: .4byte gUnknown_2021D18
_080D0670: .4byte gUnknown_84162C4
	thumb_func_end sub_80D060C

	thumb_func_start sub_80D0674
sub_80D0674: @ 80D0674
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
	ldr r2, _080D06CC @ =gUnknown_8417C2D
	movs r4, 0
	str r4, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0x2
	movs r3, 0
	bl sub_8002C48
	str r4, [sp]
	adds r0, r6, 0
	mov r1, r8
	movs r2, 0x10
	movs r3, 0xC
	bl sub_80D060C
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D06CC: .4byte gUnknown_8417C2D
	thumb_func_end sub_80D0674

	thumb_func_start sub_80D06D0
sub_80D06D0: @ 80D06D0
	push {r4,lr}
	sub sp, 0xC
	adds r1, r0, 0
	ldr r0, _080D071C @ =gUnknown_2021CD0
	movs r2, 0x1
	movs r3, 0x4
	bl sub_8008E78
	ldr r4, _080D0720 @ =gUnknown_2021D18
	ldr r1, _080D0724 @ =gUnknown_84162C4
	adds r0, r4, 0
	bl sub_8008FCC
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_8005ED4
	ldr r1, _080D0728 @ =gUnknown_2039A28
	ldrb r1, [r1]
	movs r3, 0x40
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0xC
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r4, 0
	bl sub_8002C48
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D071C: .4byte gUnknown_2021CD0
_080D0720: .4byte gUnknown_2021D18
_080D0724: .4byte gUnknown_84162C4
_080D0728: .4byte gUnknown_2039A28
	thumb_func_end sub_80D06D0

	thumb_func_start sub_80D072C
sub_80D072C: @ 80D072C
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
	adds r2, r4, 0
	bl sub_810FE50
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r4, _080D07BC @ =gUnknown_2039A28
	add r0, sp, 0x18
	bl sub_8003CE4
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	ldr r5, _080D07C0 @ =0x0000021d
	adds r1, r5, 0
	movs r2, 0xD0
	bl sub_814FF2C
	ldrb r0, [r4]
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0xD
	bl SetWindowBorderStyle
	ldrb r0, [r4]
	ldr r2, _080D07C4 @ =gUnknown_8417C2D
	movs r3, 0
	str r3, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r1, 0x2
	bl sub_8002C48
	adds r0, r6, 0
	bl sub_80D06D0
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D07BC: .4byte gUnknown_2039A28
_080D07C0: .4byte 0x0000021d
_080D07C4: .4byte gUnknown_8417C2D
	thumb_func_end sub_80D072C

	thumb_func_start sub_80D07C8
sub_80D07C8: @ 80D07C8
	push {r4,lr}
	ldr r4, _080D07E8 @ =gUnknown_2039A28
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810F4D8
	ldrb r0, [r4]
	bl sub_8003E3C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D07E8: .4byte gUnknown_2039A28
	thumb_func_end sub_80D07C8

	.align 2, 0 @ Don't pad with nop.
