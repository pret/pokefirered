	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_810C3A4
sub_810C3A4: @ 810C3A4
	push {lr}
	ldr r0, _0810C3B4 @ =sub_810C3B8
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810C3B4: .4byte sub_810C3B8
	thumb_func_end sub_810C3A4

	thumb_func_start sub_810C3B8
sub_810C3B8: @ 810C3B8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0810C43C @ =gUnknown_3005090
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0810C3E2
	bl walkrun_is_standing_still
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _0810C3E2
	bl sub_805C270
	strh r4, [r5, 0x8]
_0810C3E2:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0810C41C
	movs r4, 0
	ldr r7, _0810C440 @ =gUnknown_2036E38
_0810C3EE:
	adds r0, r4, 0
	bl sub_810CF04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810C412
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r7
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _0810C436
	adds r0, r1, 0
	bl FreezeMapObject
_0810C412:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0810C3EE
_0810C41C:
	movs r0, 0x1
	strh r0, [r5, 0xA]
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0810C436
	adds r0, r6, 0
	bl DestroyTask
	bl sub_805C780
	bl EnableBothScriptContexts
_0810C436:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C43C: .4byte gUnknown_3005090
_0810C440: .4byte gUnknown_2036E38
	thumb_func_end sub_810C3B8

	thumb_func_start sub_810C444
sub_810C444: @ 810C444
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r0, _0810C4E0 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 4
	adds r1, r0
	mov r8, r1
	movs r7, 0
	ldr r0, _0810C4E4 @ =gUnknown_2036DFC
	ldr r1, [r0, 0x4]
	adds r2, r0, 0
	ldrb r1, [r1]
	cmp r7, r1
	bcs _0810C4D2
_0810C466:
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, 0xC]
	cmp r0, 0x1
	beq _0810C47A
	cmp r0, 0x3
	bne _0810C4C4
_0810C47A:
	ldrb r0, [r5, 0x9]
	subs r0, 0x4D
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0810C4C4
	bl sub_810CF54
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r5]
	ldr r1, _0810C4E0 @ =gUnknown_3005008
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r2, _0810C4E8 @ =gUnknown_2036E38
	adds r4, r1, r2
	bl sub_810CF04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810C4C0
	adds r0, r4, 0
	adds r1, r6, 0
	bl npc_set_running_behaviour_etc
_0810C4C0:
	strb r6, [r5, 0x9]
	ldr r2, _0810C4E4 @ =gUnknown_2036DFC
_0810C4C4:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, [r2, 0x4]
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0810C466
_0810C4D2:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C4E0: .4byte gUnknown_3005008
_0810C4E4: .4byte gUnknown_2036DFC
_0810C4E8: .4byte gUnknown_2036E38
	thumb_func_end sub_810C444

	thumb_func_start sub_810C4EC
sub_810C4EC: @ 810C4EC
	push {r4-r7,lr}
	movs r0, 0xB5
	lsls r0, 1
	movs r1, 0x1
	bl sub_8099F40
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810C516
	ldr r0, _0810C568 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r2, 0xC7
	lsls r2, 3
	adds r1, r0, r2
	ldrh r2, [r1]
	ldrb r0, [r1]
	cmp r0, 0x63
	bhi _0810C516
	adds r0, r2, 0x1
	strh r0, [r1]
_0810C516:
	ldr r7, _0810C56C @ =0x00000801
	adds r0, r7, 0
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810C570
	ldr r6, _0810C568 @ =gUnknown_3005008
	ldr r0, [r6]
	movs r5, 0xC7
	lsls r5, 3
	adds r3, r0, r5
	ldrh r2, [r3]
	lsrs r1, r2, 8
	movs r4, 0xFF
	cmp r1, 0x63
	bhi _0810C548
	adds r1, 0x1
	lsls r1, 24
	movs r0, 0xFF
	ands r0, r2
	lsrs r1, 16
	orrs r0, r1
	strh r0, [r3]
_0810C548:
	ldr r0, [r6]
	adds r0, r5
	ldrh r0, [r0]
	lsrs r0, 8
	ands r0, r4
	cmp r0, 0x64
	bne _0810C570
	adds r0, r7, 0
	bl FlagClear
	bl sub_810C640
	bl sub_810D0D0
	movs r0, 0x1
	b _0810C572
	.align 2, 0
_0810C568: .4byte gUnknown_3005008
_0810C56C: .4byte 0x00000801
_0810C570:
	movs r0, 0
_0810C572:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810C4EC

	thumb_func_start sub_810C578
sub_810C578: @ 810C578
	push {lr}
	ldr r0, _0810C590 @ =0x00000801
	bl FlagClear
	bl sub_810C640
	bl sub_810D0D0
	bl sub_810C594
	pop {r0}
	bx r0
	.align 2, 0
_0810C590: .4byte 0x00000801
	thumb_func_end sub_810C578

	thumb_func_start sub_810C594
sub_810C594: @ 810C594
	push {r4-r7,lr}
	movs r5, 0
	movs r6, 0
_0810C59A:
	lsls r0, r5, 3
	adds r0, r5
	lsls r0, 2
	ldr r1, _0810C5FC @ =gUnknown_2036E38
	adds r4, r0, r1
	ldrb r0, [r4, 0x6]
	subs r0, 0x4D
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0810C5EA
	bl sub_810CF54
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _0810C5EA
	ldr r2, _0810C600 @ =gUnknown_202063C
	ldrb r0, [r4, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r7, 0x2E
	ldrsh r0, [r1, r7]
	cmp r0, r5
	bne _0810C5EA
	strh r6, [r1, 0x24]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x26]
	adds r0, r4, 0
	adds r1, r3, 0
	bl npc_set_running_behaviour_etc
_0810C5EA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _0810C59A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C5FC: .4byte gUnknown_2036E38
_0810C600: .4byte gUnknown_202063C
	thumb_func_end sub_810C594

	thumb_func_start sub_810C604
sub_810C604: @ 810C604
	ldr r0, _0810C61C @ =gUnknown_3005008
	ldr r1, [r0]
	movs r0, 0xC7
	lsls r0, 3
	adds r1, r0
	ldrh r2, [r1]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0810C61C: .4byte gUnknown_3005008
	thumb_func_end sub_810C604

	thumb_func_start sub_810C620
sub_810C620: @ 810C620
	ldr r0, _0810C63C @ =gUnknown_3005008
	ldr r2, [r0]
	movs r0, 0xC7
	lsls r0, 3
	adds r2, r0
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	movs r1, 0x64
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0810C63C: .4byte gUnknown_3005008
	thumb_func_end sub_810C620

	thumb_func_start sub_810C640
sub_810C640: @ 810C640
	ldr r0, _0810C650 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xC7
	lsls r1, 3
	adds r0, r1
	ldrb r1, [r0]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0810C650: .4byte gUnknown_3005008
	thumb_func_end sub_810C640

	thumb_func_start sub_810C654
sub_810C654: @ 810C654
	ldr r0, _0810C66C @ =gUnknown_3005008
	ldr r1, [r0]
	movs r0, 0xC7
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	movs r3, 0xC8
	lsls r3, 7
	adds r2, r3, 0
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0810C66C: .4byte gUnknown_3005008
	thumb_func_end sub_810C654

	.align 2, 0 @ Don't pad with nop.
