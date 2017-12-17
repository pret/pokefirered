	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_800292C
sub_800292C: @ 800292C
	push {r4,lr}
	movs r4, 0
	strh r4, [r0]
	ldr r4, _08002944 @ =0x0000a3a3
	strh r4, [r0, 0x2]
	str r3, [r0, 0x4]
	str r1, [r0, 0x8]
	str r2, [r0, 0xC]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002944: .4byte 0x0000a3a3
	thumb_func_end sub_800292C

	thumb_func_start sub_8002948
sub_8002948: @ 8002948
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	subs r3, 0x10
	adds r1, r2, 0
	bl sub_800292C
	pop {r0}
	bx r0
	thumb_func_end sub_8002948

	thumb_func_start sub_800295C
sub_800295C: @ 800295C
	push {r4-r7,lr}
	adds r5, r1, 0
	ldr r2, _08002998 @ =gUnknown_2020004
	str r0, [r2]
	ldr r1, _0800299C @ =gUnknown_2020008
	str r0, [r1]
	movs r0, 0x3
	ands r0, r5
	cmp r0, 0
	beq _08002976
	lsrs r0, r5, 2
	adds r0, 0x1
	lsls r5, r0, 2
_08002976:
	adds r6, r1, 0
	ldr r7, _080029A0 @ =gUnknown_202000C
_0800297A:
	ldr r4, [r6]
	ldrh r0, [r4]
	cmp r0, 0
	bne _080029DC
	ldr r3, [r4, 0x4]
	cmp r3, r5
	bcc _080029DC
	subs r0, r3, r5
	cmp r0, 0x1F
	bhi _080029A4
	movs r0, 0x1
	strh r0, [r4]
	adds r0, r4, 0
	adds r0, 0x10
	b _080029F8
	.align 2, 0
_08002998: .4byte gUnknown_2020004
_0800299C: .4byte gUnknown_2020008
_080029A0: .4byte gUnknown_202000C
_080029A4:
	subs r3, 0x10
	subs r3, r5
	adds r0, r5, 0
	adds r0, 0x10
	adds r0, r4, r0
	str r0, [r7]
	movs r1, 0x1
	strh r1, [r4]
	str r5, [r4, 0x4]
	ldr r2, [r4, 0xC]
	adds r1, r4, 0
	bl sub_800292C
	ldr r0, [r6]
	ldr r1, [r7]
	str r1, [r0, 0xC]
	ldr r0, _080029D8 @ =gUnknown_2020004
	ldr r2, [r1, 0xC]
	ldr r0, [r0]
	cmp r2, r0
	beq _080029D0
	str r1, [r2, 0x8]
_080029D0:
	ldr r0, [r6]
	adds r0, 0x10
	b _080029F8
	.align 2, 0
_080029D8: .4byte gUnknown_2020004
_080029DC:
	ldr r0, [r1]
	ldr r3, [r0, 0xC]
	ldr r0, [r2]
	cmp r3, r0
	beq _080029EA
	str r3, [r1]
	b _0800297A
_080029EA:
	ldr r0, _08002A00 @ =gUnknown_81E9F68
	movs r1, 0xAE
	ldr r2, _08002A04 @ =gUnknown_81E9FA0
	movs r3, 0x1
	bl AGBAssert
	movs r0, 0
_080029F8:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08002A00: .4byte gUnknown_81E9F68
_08002A04: .4byte gUnknown_81E9FA0
	thumb_func_end sub_800295C

	thumb_func_start sub_8002A08
sub_8002A08: @ 8002A08
	push {r4-r7,lr}
	cmp r1, 0
	bne _08002A24
	ldr r0, _08002A1C @ =gUnknown_81E9F68
	ldr r2, _08002A20 @ =gUnknown_81E9FA4
	movs r1, 0xC3
	movs r3, 0x1
	bl AGBAssert
	b _08002ACA
	.align 2, 0
_08002A1C: .4byte gUnknown_81E9F68
_08002A20: .4byte gUnknown_81E9FA4
_08002A24:
	adds r6, r0, 0
	adds r4, r1, 0
	subs r4, 0x10
	ldrh r0, [r4, 0x2]
	ldr r7, _08002AD0 @ =0x0000a3a3
	cmp r0, r7
	beq _08002A3E
	ldr r0, _08002AD4 @ =gUnknown_81E9F68
	ldr r2, _08002AD8 @ =gUnknown_81E9FB0
	movs r1, 0xCC
	movs r3, 0x1
	bl AGBAssert
_08002A3E:
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _08002A50
	ldr r0, _08002AD4 @ =gUnknown_81E9F68
	ldr r2, _08002ADC @ =gUnknown_81E9FD8
	movs r1, 0xCD
	movs r3, 0x1
	bl AGBAssert
_08002A50:
	movs r0, 0
	strh r0, [r4]
	ldr r0, [r4, 0xC]
	cmp r0, r6
	beq _08002A8C
	ldrh r5, [r0]
	cmp r5, 0
	bne _08002A8C
	ldrh r0, [r0, 0x2]
	cmp r0, r7
	beq _08002A72
	ldr r0, _08002AD4 @ =gUnknown_81E9F68
	ldr r2, _08002AE0 @ =gUnknown_81E9FEC
	movs r1, 0xD3
	movs r3, 0x1
	bl AGBAssert
_08002A72:
	ldr r0, [r4, 0x4]
	adds r0, 0x10
	ldr r2, [r4, 0xC]
	ldr r1, [r2, 0x4]
	adds r0, r1
	str r0, [r4, 0x4]
	strh r5, [r2, 0x2]
	ldr r0, [r4, 0xC]
	ldr r0, [r0, 0xC]
	str r0, [r4, 0xC]
	cmp r0, r6
	beq _08002A8C
	str r4, [r0, 0x8]
_08002A8C:
	cmp r4, r6
	beq _08002ACA
	ldr r0, [r4, 0x8]
	ldrh r5, [r0]
	cmp r5, 0
	bne _08002ACA
	ldrh r1, [r0, 0x2]
	ldr r0, _08002AD0 @ =0x0000a3a3
	cmp r1, r0
	beq _08002AAC
	ldr r0, _08002AD4 @ =gUnknown_81E9F68
	ldr r2, _08002AE4 @ =gUnknown_81EA018
	movs r1, 0xE4
	movs r3, 0x1
	bl AGBAssert
_08002AAC:
	ldr r1, [r4, 0x8]
	ldr r0, [r4, 0xC]
	str r0, [r1, 0xC]
	ldr r1, [r4, 0xC]
	cmp r1, r6
	beq _08002ABC
	ldr r0, [r4, 0x8]
	str r0, [r1, 0x8]
_08002ABC:
	strh r5, [r4, 0x2]
	ldr r0, [r4, 0x8]
	ldr r1, [r0, 0x4]
	adds r1, 0x10
	ldr r2, [r4, 0x4]
	adds r1, r2
	str r1, [r0, 0x4]
_08002ACA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002AD0: .4byte 0x0000a3a3
_08002AD4: .4byte gUnknown_81E9F68
_08002AD8: .4byte gUnknown_81E9FB0
_08002ADC: .4byte gUnknown_81E9FD8
_08002AE0: .4byte gUnknown_81E9FEC
_08002AE4: .4byte gUnknown_81EA018
	thumb_func_end sub_8002A08

	thumb_func_start sub_8002AE8
sub_8002AE8: @ 8002AE8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r1, 0
	bl sub_800295C
	adds r5, r0, 0
	cmp r5, 0
	beq _08002B1C
	movs r0, 0x3
	ands r0, r4
	cmp r0, 0
	beq _08002B06
	lsrs r0, r4, 2
	adds r0, 0x1
	lsls r4, r0, 2
_08002B06:
	movs r0, 0
	str r0, [sp]
	lsls r2, r4, 9
	lsrs r2, 11
	movs r0, 0xA0
	lsls r0, 19
	orrs r2, r0
	mov r0, sp
	adds r1, r5, 0
	bl CpuSet
_08002B1C:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8002AE8

	thumb_func_start sub_8002B28
sub_8002B28: @ 8002B28
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r3, r1, 0
	subs r3, 0x10
	ldrh r2, [r3, 0x2]
	ldr r0, _08002B74 @ =0x0000a3a3
	cmp r2, r0
	bne _08002B6E
	ldr r0, [r3, 0xC]
	ldrh r1, [r0, 0x2]
	adds r4, r0, 0
	cmp r1, r2
	bne _08002B6E
	cmp r4, r5
	beq _08002B4C
	ldr r0, [r4, 0x8]
	cmp r0, r3
	bne _08002B6E
_08002B4C:
	ldr r2, [r3, 0x8]
	ldrh r1, [r2, 0x2]
	ldr r0, _08002B74 @ =0x0000a3a3
	cmp r1, r0
	bne _08002B6E
	cmp r2, r5
	beq _08002B60
	ldr r0, [r2, 0xC]
	cmp r0, r3
	bne _08002B6E
_08002B60:
	cmp r4, r5
	beq _08002B78
	ldr r0, [r3, 0x4]
	adds r0, 0x10
	adds r0, r3, r0
	cmp r4, r0
	beq _08002B78
_08002B6E:
	movs r0, 0
	b _08002B7A
	.align 2, 0
_08002B74: .4byte 0x0000a3a3
_08002B78:
	movs r0, 0x1
_08002B7A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8002B28

	thumb_func_start sub_8002B80
sub_8002B80: @ 8002B80
	push {lr}
	ldr r2, _08002B94 @ =gUnknown_3000A38
	str r0, [r2]
	ldr r2, _08002B98 @ =gUnknown_3000A3C
	str r1, [r2]
	bl sub_8002948
	pop {r0}
	bx r0
	.align 2, 0
_08002B94: .4byte gUnknown_3000A38
_08002B98: .4byte gUnknown_3000A3C
	thumb_func_end sub_8002B80

	thumb_func_start sub_8002B9C
sub_8002B9C: @ 8002B9C
	push {lr}
	adds r1, r0, 0
	ldr r0, _08002BAC @ =gUnknown_3000A38
	ldr r0, [r0]
	bl sub_800295C
	pop {r1}
	bx r1
	.align 2, 0
_08002BAC: .4byte gUnknown_3000A38
	thumb_func_end sub_8002B9C

	thumb_func_start sub_8002BB0
sub_8002BB0: @ 8002BB0
	push {lr}
	adds r1, r0, 0
	ldr r0, _08002BC0 @ =gUnknown_3000A38
	ldr r0, [r0]
	bl sub_8002AE8
	pop {r1}
	bx r1
	.align 2, 0
_08002BC0: .4byte gUnknown_3000A38
	thumb_func_end sub_8002BB0

	thumb_func_start sub_8002BC4
sub_8002BC4: @ 8002BC4
	push {lr}
	adds r1, r0, 0
	ldr r0, _08002BD4 @ =gUnknown_3000A38
	ldr r0, [r0]
	bl sub_8002A08
	pop {r0}
	bx r0
	.align 2, 0
_08002BD4: .4byte gUnknown_3000A38
	thumb_func_end sub_8002BC4

	thumb_func_start sub_8002BD8
sub_8002BD8: @ 8002BD8
	push {lr}
	adds r1, r0, 0
	ldr r0, _08002BE8 @ =gUnknown_3000A38
	ldr r0, [r0]
	bl sub_8002B28
	pop {r1}
	bx r1
	.align 2, 0
_08002BE8: .4byte gUnknown_3000A38
	thumb_func_end sub_8002BD8

	thumb_func_start sub_8002BEC
sub_8002BEC: @ 8002BEC
	push {r4,r5,lr}
	ldr r0, _08002C10 @ =gUnknown_3000A38
	ldr r4, [r0]
	adds r5, r0, 0
_08002BF4:
	ldr r0, [r5]
	adds r1, r4, 0
	adds r1, 0x10
	bl sub_8002B28
	cmp r0, 0
	beq _08002C14
	ldr r4, [r4, 0xC]
	ldr r0, [r5]
	cmp r4, r0
	bne _08002BF4
	movs r0, 0x1
	b _08002C16
	.align 2, 0
_08002C10: .4byte gUnknown_3000A38
_08002C14:
	movs r0, 0
_08002C16:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8002BEC

	.align 2, 0 @ Don't pad with nop.
