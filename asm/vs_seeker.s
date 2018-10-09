	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
