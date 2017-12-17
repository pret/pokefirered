	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8000968
sub_8000968: @ 8000968
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r2, 0
	ldr r7, _080009AC @ =gUnknown_30000C0
	ldr r0, _080009B0 @ =gUnknown_30000C1
	mov r12, r0
	ldr r1, _080009B4 @ =gUnknown_30000C2
	mov r8, r1
	ldr r6, _080009B8 @ =gUnknown_3000000
	movs r5, 0
	ldr r4, _080009BC @ =gUnknown_3000060
	movs r3, 0xFF
_08000982:
	adds r0, r2, r6
	strb r5, [r0]
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x5F
	ble _08000982
	movs r0, 0
	strb r0, [r7]
	mov r1, r12
	strb r0, [r1]
	movs r0, 0
	mov r1, r8
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080009AC: .4byte gUnknown_30000C0
_080009B0: .4byte gUnknown_30000C1
_080009B4: .4byte gUnknown_30000C2
_080009B8: .4byte gUnknown_3000000
_080009BC: .4byte gUnknown_3000060
	thumb_func_end sub_8000968

	thumb_func_start sub_80009C0
sub_80009C0: @ 80009C0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bne _080009EC
	ldr r2, _080009E0 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _080009E4 @ =0x0000ffe7
	ands r0, r1
	strh r0, [r2]
	ldr r1, _080009E8 @ =gUnknown_3000004
	ldrh r0, [r2]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	b _080009FA
	.align 2, 0
_080009E0: .4byte 0x04000004
_080009E4: .4byte 0x0000ffe7
_080009E8: .4byte gUnknown_3000004
_080009EC:
	movs r0, 0x80
	lsls r0, 19
	adds r0, r2, r0
	ldr r1, _08000A00 @ =gUnknown_3000000
	adds r1, r2, r1
	ldrh r1, [r1]
	strh r1, [r0]
_080009FA:
	pop {r0}
	bx r0
	.align 2, 0
_08000A00: .4byte gUnknown_3000000
	thumb_func_end sub_80009C0

	thumb_func_start sub_8000A04
sub_8000A04: @ 8000A04
	push {r4,r5,lr}
	ldr r0, _08000A30 @ =gUnknown_30000C0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08000A28
	movs r5, 0
_08000A10:
	ldr r0, _08000A34 @ =gUnknown_3000060
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08000A28
	bl sub_80009C0
	movs r0, 0xFF
	strb r0, [r4]
	adds r5, 0x1
	cmp r5, 0x5F
	ble _08000A10
_08000A28:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08000A30: .4byte gUnknown_30000C0
_08000A34: .4byte gUnknown_3000060
	thumb_func_end sub_8000A04

	thumb_func_start sub_8000A38
sub_8000A38: @ 8000A38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r1, 16
	cmp r4, 0x5F
	bhi _08000AB4
	ldr r0, _08000A74 @ =gUnknown_3000000
	adds r0, r4, r0
	strh r1, [r0]
	ldr r0, _08000A78 @ =0x04000006
	ldrh r1, [r0]
	movs r0, 0xFF
	ands r0, r1
	subs r0, 0xA1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x40
	bls _08000A6C
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08000A82
_08000A6C:
	adds r0, r4, 0
	bl sub_80009C0
	b _08000AB4
	.align 2, 0
_08000A74: .4byte gUnknown_3000000
_08000A78: .4byte 0x04000006
_08000A7C:
	movs r0, 0
	strb r0, [r5]
	b _08000AB4
_08000A82:
	ldr r2, _08000ABC @ =gUnknown_30000C0
	movs r0, 0x1
	strb r0, [r2]
	movs r3, 0
	ldr r0, _08000AC0 @ =gUnknown_3000060
	ldrb r1, [r0]
	adds r5, r2, 0
	adds r2, r0, 0
	cmp r1, 0xFF
	beq _08000AAC
	adds r1, r2, 0
_08000A98:
	ldrb r0, [r1]
	cmp r0, r4
	beq _08000A7C
	adds r1, 0x1
	adds r3, 0x1
	cmp r3, 0x5F
	bgt _08000AAC
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08000A98
_08000AAC:
	adds r0, r3, r2
	movs r1, 0
	strb r4, [r0]
	strb r1, [r5]
_08000AB4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08000ABC: .4byte gUnknown_30000C0
_08000AC0: .4byte gUnknown_3000060
	thumb_func_end sub_8000A38

	thumb_func_start sub_8000AC4
sub_8000AC4: @ 8000AC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r1, 0x4
	bne _08000AD8
	ldr r0, _08000AD4 @ =0x04000004
	b _08000AEA
	.align 2, 0
_08000AD4: .4byte 0x04000004
_08000AD8:
	cmp r1, 0x6
	beq _08000AE8
	ldr r0, _08000AE4 @ =gUnknown_3000000
	adds r0, r1, r0
	ldrh r0, [r0]
	b _08000AEC
	.align 2, 0
_08000AE4: .4byte gUnknown_3000000
_08000AE8:
	ldr r0, _08000AF0 @ =0x04000006
_08000AEA:
	ldrh r0, [r0]
_08000AEC:
	pop {r1}
	bx r1
	.align 2, 0
_08000AF0: .4byte 0x04000006
	thumb_func_end sub_8000AC4

	thumb_func_start sub_8000AF4
sub_8000AF4: @ 8000AF4
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08000B10 @ =gUnknown_3000000
	adds r1, r0, r1
	ldrh r1, [r1]
	orrs r1, r2
	lsls r1, 16
	lsrs r1, 16
	bl sub_8000A38
	pop {r0}
	bx r0
	.align 2, 0
_08000B10: .4byte gUnknown_3000000
	thumb_func_end sub_8000AF4

	thumb_func_start sub_8000B14
sub_8000B14: @ 8000B14
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	ldr r1, _08000B30 @ =gUnknown_3000000
	adds r1, r0, r1
	ldrh r1, [r1]
	lsrs r2, 16
	bics r1, r2
	bl sub_8000A38
	pop {r0}
	bx r0
	.align 2, 0
_08000B30: .4byte gUnknown_3000000
	thumb_func_end sub_8000B14

	thumb_func_start sub_8000B34
sub_8000B34: @ 8000B34
	push {r4,r5,lr}
	ldr r5, _08000B58 @ =gUnknown_30000C1
	ldrb r0, [r5]
	cmp r0, 0
	beq _08000B52
	ldr r2, _08000B5C @ =0x04000208
	ldrh r1, [r2]
	movs r4, 0
	strh r4, [r2]
	ldr r3, _08000B60 @ =0x04000200
	ldr r0, _08000B64 @ =gUnknown_30000C2
	ldrh r0, [r0]
	strh r0, [r3]
	strh r1, [r2]
	strb r4, [r5]
_08000B52:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08000B58: .4byte gUnknown_30000C1
_08000B5C: .4byte 0x04000208
_08000B60: .4byte 0x04000200
_08000B64: .4byte gUnknown_30000C2
	thumb_func_end sub_8000B34

	thumb_func_start sub_8000B68
sub_8000B68: @ 8000B68
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08000B8C @ =gUnknown_30000C2
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _08000B90 @ =gUnknown_30000C1
	movs r0, 0x1
	strb r0, [r1]
	bl sub_8000B34
	ldrh r0, [r4]
	bl sub_8000BC0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000B8C: .4byte gUnknown_30000C2
_08000B90: .4byte gUnknown_30000C1
	thumb_func_end sub_8000B68

	thumb_func_start sub_8000B94
sub_8000B94: @ 8000B94
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08000BB8 @ =gUnknown_30000C2
	ldrh r1, [r4]
	bics r1, r0
	strh r1, [r4]
	ldr r1, _08000BBC @ =gUnknown_30000C1
	movs r0, 0x1
	strb r0, [r1]
	bl sub_8000B34
	ldrh r0, [r4]
	bl sub_8000BC0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000BB8: .4byte gUnknown_30000C2
_08000BBC: .4byte gUnknown_30000C1
	thumb_func_end sub_8000B94

	thumb_func_start sub_8000BC0
sub_8000BC0: @ 8000BC0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x4
	bl sub_8000AC4
	movs r2, 0x18
	ands r2, r0
	movs r1, 0x1
	ands r1, r4
	negs r0, r1
	orrs r0, r1
	asrs r1, r0, 31
	movs r0, 0x8
	ands r1, r0
	movs r0, 0x2
	ands r0, r4
	cmp r0, 0
	beq _08000BEC
	movs r0, 0x10
	orrs r1, r0
_08000BEC:
	cmp r2, r1
	beq _08000BF6
	movs r0, 0x4
	bl sub_8000A38
_08000BF6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8000BC0

	.align 2, 0 @ Don't pad with nop.
