	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_810CF90
sub_810CF90: @ 810CF90
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x11
	cmp r0, 0x2D
	bhi _0810D06C
	lsls r0, 2
	ldr r1, _0810CFA8 @ =_0810CFAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810CFA8: .4byte _0810CFAC
	.align 2, 0
_0810CFAC:
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D068
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D068
	.4byte _0810D068
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D064
_0810D064:
	movs r0, 0x4E
	b _0810D06E
_0810D068:
	movs r0, 0x4F
	b _0810D06E
_0810D06C:
	movs r0, 0x4D
_0810D06E:
	pop {r1}
	bx r1
	thumb_func_end sub_810CF90

	thumb_func_start sub_810D074
sub_810D074: @ 810D074
	adds r0, 0x2
	ldrb r1, [r0]
	ldrb r0, [r0, 0x1]
	lsls r0, 8
	orrs r1, r0
	adds r0, r1, 0
	bx lr
	thumb_func_end sub_810D074

	thumb_func_start sub_810D084
sub_810D084: @ 810D084
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0
	adds r2, r0, 0
_0810D08E:
	ldrh r0, [r2]
	cmp r0, r1
	bne _0810D098
	adds r0, r3, 0
	b _0810D0A4
_0810D098:
	adds r2, 0x10
	adds r3, 0x1
	cmp r3, 0xDC
	bls _0810D08E
	movs r0, 0x1
	negs r0, r0
_0810D0A4:
	pop {r1}
	bx r1
	thumb_func_end sub_810D084

	thumb_func_start sub_810D0A8
sub_810D0A8: @ 810D0A8
	push {lr}
	ldr r1, _0810D0C0 @ =gSaveBlock1Ptr
	ldr r1, [r1]
	ldr r2, _0810D0C4 @ =0x0000063a
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810D0C8
	movs r0, 0x1
	b _0810D0CA
	.align 2, 0
_0810D0C0: .4byte gSaveBlock1Ptr
_0810D0C4: .4byte 0x0000063a
_0810D0C8:
	movs r0, 0
_0810D0CA:
	pop {r1}
	bx r1
	thumb_func_end sub_810D0A8

	thumb_func_start sub_810D0D0
sub_810D0D0: @ 810D0D0
	push {r4,lr}
	movs r1, 0
	ldr r4, _0810D0F4 @ =gSaveBlock1Ptr
	ldr r3, _0810D0F8 @ =0x0000063a
	movs r2, 0
_0810D0DA:
	ldr r0, [r4]
	adds r0, r3
	adds r0, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x63
	bls _0810D0DA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D0F4: .4byte gSaveBlock1Ptr
_0810D0F8: .4byte 0x0000063a
	thumb_func_end sub_810D0D0

	thumb_func_start sub_810D0FC
sub_810D0FC: @ 810D0FC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	strh r0, [r1]
	ldrh r0, [r4]
	subs r0, 0x7
	strh r0, [r4]
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	subs r0, r2, 0x7
	movs r3, 0x8
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bgt _0810D15A
	adds r0, r2, 0x7
	cmp r0, r1
	blt _0810D15A
	movs r0, 0
	ldrsh r1, [r4, r0]
	subs r0, r1, 0x5
	movs r3, 0xA
	ldrsh r2, [r5, r3]
	cmp r0, r2
	bgt _0810D15A
	adds r0, r1, 0x5
	cmp r0, r2
	blt _0810D15A
	ldrb r0, [r5, 0x7]
	bl sub_810CF04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D15A
	movs r0, 0x1
	b _0810D15C
_0810D15A:
	movs r0, 0
_0810D15C:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_810D0FC

	thumb_func_start sub_810D164
sub_810D164: @ 810D164
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r1, 16
	movs r4, 0
	adds r3, r0, 0
_0810D16E:
	ldrh r0, [r3]
	cmp r0, r1
	bne _0810D1B8
	strb r4, [r2]
	movs r5, 0x1
	ldr r7, _0810D188 @ =0x0000ffff
	adds r4, r3, 0x2
	movs r6, 0
_0810D17E:
	ldrh r0, [r4]
	cmp r0, 0
	bne _0810D18C
	lsrs r0, r6, 24
	b _0810D1C6
	.align 2, 0
_0810D188: .4byte 0x0000ffff
_0810D18C:
	cmp r0, r7
	beq _0810D1A2
	ldrh r0, [r4]
	bl HasTrainerAlreadyBeenFought
	lsls r0, 24
	cmp r0, 0
	bne _0810D1A2
	lsls r0, r5, 24
	lsrs r0, 24
	b _0810D1C6
_0810D1A2:
	adds r4, 0x2
	movs r0, 0x80
	lsls r0, 17
	adds r6, r0
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D17E
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _0810D1C6
_0810D1B8:
	adds r3, 0x10
	adds r4, 0x1
	cmp r4, 0xDC
	bls _0810D16E
	movs r0, 0
	strb r0, [r2]
	movs r0, 0
_0810D1C6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810D164

	thumb_func_start sub_810D1CC
sub_810D1CC: @ 810D1CC
	push {r4-r7,lr}
	sub sp, 0x4
	movs r5, 0
	ldr r6, _0810D220 @ =gUnknown_203ADB8
	ldr r0, [r6]
	ldrb r0, [r0, 0x6]
	cmp r0, 0xFF
	beq _0810D23C
	adds r7, r6, 0
_0810D1DE:
	lsls r4, r5, 4
	ldr r0, [r7]
	adds r0, r4
	bl sub_810D0FC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D228
	ldr r0, [r6]
	adds r0, r4
	ldrh r0, [r0, 0x4]
	bl HasTrainerAlreadyBeenFought
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D216
	ldr r0, [r7]
	adds r0, r4
	ldrh r1, [r0, 0x4]
	ldr r0, _0810D224 @ =gUnknown_845318C
	mov r2, sp
	bl sub_810D164
	lsls r0, 24
	cmp r0, 0
	beq _0810D228
_0810D216:
	ldr r0, [r7]
	adds r0, r4
	ldrb r0, [r0, 0x6]
	b _0810D23E
	.align 2, 0
_0810D220: .4byte gUnknown_203ADB8
_0810D224: .4byte gUnknown_845318C
_0810D228:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0810D248 @ =gUnknown_203ADB8
	ldr r0, [r6]
	lsls r1, r5, 4
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0xFF
	bne _0810D1DE
_0810D23C:
	movs r0, 0xFF
_0810D23E:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810D248: .4byte gUnknown_203ADB8
	thumb_func_end sub_810D1CC

	thumb_func_start sub_810D24C
sub_810D24C: @ 810D24C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r1, [r4, 0x7]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810D278 @ =gUnknown_2036E38
	adds r0, r1
	bl npc_sync_anim_pause_bits
	ldrb r0, [r4, 0x6]
	ldr r1, _0810D27C @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	adds r3, r5, 0
	bl ScriptMovement_StartObjectMovementScript
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D278: .4byte gUnknown_2036E38
_0810D27C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_810D24C

	thumb_func_start sub_810D280
sub_810D280: @ 810D280
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r5, 0
	cmp r5, r6
	bge _0810D2F8
	ldr r7, _0810D2E0 @ =gUnknown_203ADB8
	movs r4, 0
_0810D298:
	ldr r0, [r7]
	adds r0, r4
	bl sub_810D0FC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D2F0
	ldr r1, [r7]
	adds r0, r1, r4
	ldrh r0, [r0, 0x4]
	cmp r0, r8
	bne _0810D2F0
	movs r3, 0
	movs r2, 0x86
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r3, r0
	bge _0810D2EC
	ldr r0, _0810D2E0 @ =gUnknown_203ADB8
	ldr r1, [r0]
	adds r0, r1, r4
	ldrh r4, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 3
	adds r2, r1, r0
	adds r0, 0x30
	adds r1, r0
	ldrb r1, [r1]
_0810D2D4:
	ldrh r0, [r2]
	cmp r0, r4
	bne _0810D2E4
	movs r0, 0x2
	b _0810D2FA
	.align 2, 0
_0810D2E0: .4byte gUnknown_203ADB8
_0810D2E4:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, r1
	blt _0810D2D4
_0810D2EC:
	movs r0, 0x1
	b _0810D2FA
_0810D2F0:
	adds r4, 0x10
	adds r5, 0x1
	cmp r5, r6
	blt _0810D298
_0810D2F8:
	movs r0, 0
_0810D2FA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810D280

	thumb_func_start sub_810D304
sub_810D304: @ 810D304
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r1, 0
	mov r0, sp
	strb r1, [r0]
	movs r7, 0
	ldr r2, _0810D328 @ =gUnknown_203ADB8
	ldr r0, [r2]
	movs r1, 0x86
	lsls r1, 3
	adds r0, r1
	mov r10, r2
	b _0810D3CC
	.align 2, 0
_0810D328: .4byte gUnknown_203ADB8
_0810D32C:
	ldr r0, [r2]
	ldrb r0, [r0, 0x6]
	adds r3, r7, 0x1
	mov r8, r3
	cmp r0, 0xFF
	beq _0810D3C0
	adds r5, r2, 0
	mov r10, r5
	movs r6, 0
	mov r9, r5
_0810D340:
	ldr r0, [r5]
	adds r2, r0, r6
	lsls r1, r7, 1
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3
	adds r0, r1
	ldrh r1, [r2, 0x4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0810D3B2
	ldrb r0, [r2, 0x7]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r2, _0810D3E4 @ =gUnknown_2036E38
	adds r4, r1, r2
	bl sub_810CF04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D380
	ldr r0, [r5]
	movs r1, 0x84
	lsls r1, 3
	adds r0, r1
	adds r0, r7
	ldrb r1, [r0]
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
_0810D380:
	ldr r0, [r5]
	movs r3, 0x84
	lsls r3, 3
	adds r0, r3
	adds r0, r7
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_805FE7C
	ldr r0, [r5]
	adds r0, r6
	ldrh r1, [r0, 0x4]
	ldr r0, _0810D3E8 @ =gUnknown_845318C
	mov r2, sp
	bl sub_810D164
	ldr r1, _0810D3EC @ =gSaveBlock1Ptr
	ldr r1, [r1]
	ldr r2, [r5]
	adds r2, r6
	ldr r3, _0810D3F0 @ =0x0000063a
	adds r1, r3
	ldrb r2, [r2, 0x6]
	adds r1, r2
	strb r0, [r1]
_0810D3B2:
	adds r6, 0x10
	mov r1, r9
	ldr r0, [r1]
	adds r0, r6
	ldrb r0, [r0, 0x6]
	cmp r0, 0xFF
	bne _0810D340
_0810D3C0:
	mov r7, r8
	mov r2, r10
	ldr r0, [r2]
	movs r3, 0x86
	lsls r3, 3
	adds r0, r3
_0810D3CC:
	ldrb r0, [r0]
	cmp r7, r0
	blt _0810D32C
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810D3E4: .4byte gUnknown_2036E38
_0810D3E8: .4byte gUnknown_845318C
_0810D3EC: .4byte gSaveBlock1Ptr
_0810D3F0: .4byte 0x0000063a
	thumb_func_end sub_810D304

	.align 2, 0 @ Don't pad with nop.
