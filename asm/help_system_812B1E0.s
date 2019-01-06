	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_812B1E0
sub_812B1E0: @ 812B1E0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0812B1EC @ =gUnknown_203B0EC
	strh r0, [r1]
	bx lr
	.align 2, 0
_0812B1EC: .4byte gUnknown_203B0EC
	thumb_func_end sub_812B1E0

	thumb_func_start sub_812B1F0
sub_812B1F0: @ 812B1F0
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0812B21C @ =gUnknown_203B0EC
	ldrh r2, [r0]
	cmp r2, 0x1A
	bgt _0812B216
	cmp r2, 0x17
	blt _0812B216
	cmp r1, 0x9
	beq _0812B218
	cmp r1, 0x5
	beq _0812B218
	cmp r1, 0x6
	beq _0812B218
	cmp r1, 0x7
	beq _0812B218
	cmp r1, 0x8
	beq _0812B218
_0812B216:
	strh r1, [r0]
_0812B218:
	pop {r0}
	bx r0
	.align 2, 0
_0812B21C: .4byte gUnknown_203B0EC
	thumb_func_end sub_812B1F0

	thumb_func_start sub_812B220
sub_812B220: @ 812B220
	ldr r0, _0812B22C @ =gUnknown_203B0EC
	ldr r1, _0812B230 @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0812B22C: .4byte gUnknown_203B0EC
_0812B230: .4byte gSpecialVar_0x8004
	thumb_func_end sub_812B220

	thumb_func_start sub_812B234
sub_812B234: @ 812B234
	ldr r0, _0812B240 @ =gUnknown_3005EA0
	ldr r1, _0812B244 @ =gUnknown_203B0EC
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0812B240: .4byte gUnknown_3005EA0
_0812B244: .4byte gUnknown_203B0EC
	thumb_func_end sub_812B234

	thumb_func_start sub_812B248
sub_812B248: @ 812B248
	ldr r0, _0812B254 @ =gUnknown_203B0EC
	ldr r1, _0812B258 @ =gUnknown_3005EA0
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0812B254: .4byte gUnknown_203B0EC
_0812B258: .4byte gUnknown_3005EA0
	thumb_func_end sub_812B248

	thumb_func_start sub_812B25C
sub_812B25C: @ 812B25C
	push {lr}
	ldr r0, _0812B268 @ =gUnknown_845C594
	bl sub_812B27C
	pop {r1}
	bx r1
	.align 2, 0
_0812B268: .4byte gUnknown_845C594
	thumb_func_end sub_812B25C

	thumb_func_start sub_812B26C
sub_812B26C: @ 812B26C
	push {lr}
	ldr r0, _0812B278 @ =gUnknown_845C5BC
	bl sub_812B27C
	pop {r1}
	bx r1
	.align 2, 0
_0812B278: .4byte gUnknown_845C5BC
	thumb_func_end sub_812B26C

	thumb_func_start sub_812B27C
sub_812B27C: @ 812B27C
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _0812B2AC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	lsls r1, 8
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r0, [r2]
	ldr r1, _0812B2B0 @ =0x0000ffff
	cmp r0, r1
	beq _0812B2BC
	adds r4, r1, 0
	adds r1, r2, 0
_0812B2A2:
	ldrh r0, [r1]
	cmp r0, r3
	bne _0812B2B4
	movs r0, 0x1
	b _0812B2BE
	.align 2, 0
_0812B2AC: .4byte gSaveBlock1Ptr
_0812B2B0: .4byte 0x0000ffff
_0812B2B4:
	adds r1, 0x2
	ldrh r0, [r1]
	cmp r0, r4
	bne _0812B2A2
_0812B2BC:
	movs r0, 0
_0812B2BE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812B27C

	thumb_func_start sub_812B2C4
sub_812B2C4: @ 812B2C4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r5, 0
	ldr r0, _0812B2E8 @ =gUnknown_845C5CE
	mov r9, r0
	movs r0, 0x2
	add r0, r9
	mov r8, r0
_0812B2D8:
	movs r6, 0
	mov r4, r9
	lsls r1, r5, 1
	adds r0, r1, r5
	add r0, r8
	adds r7, r1, 0
	b _0812B33A
	.align 2, 0
_0812B2E8: .4byte gUnknown_845C5CE
_0812B2EC:
	adds r3, r1, r5
	adds r0, r3, r4
	ldrb r1, [r0]
	ldr r0, _0812B324 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0812B32C
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r0, r6
	movs r1, 0x5
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _0812B32C
	cmp r5, 0xF
	bne _0812B320
	ldr r0, _0812B328 @ =0x00000849
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812B32C
_0812B320:
	movs r0, 0x1
	b _0812B34C
	.align 2, 0
_0812B324: .4byte gSaveBlock1Ptr
_0812B328: .4byte 0x00000849
_0812B32C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _0812B358 @ =gUnknown_845C5CE
	adds r1, r7, 0
	adds r0, r1, r5
	add r0, r8
_0812B33A:
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0812B2EC
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _0812B2D8
	movs r0, 0
_0812B34C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0812B358: .4byte gUnknown_845C5CE
	thumb_func_end sub_812B2C4

	thumb_func_start sub_812B35C
sub_812B35C: @ 812B35C
	push {lr}
	bl sub_812B4B8
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0812B376
	movs r0, 0x16
	bl sub_812B1F0
	b _0812B406
_0812B376:
	bl sub_812B2C4
	lsls r0, 24
	cmp r0, 0
	beq _0812B388
	movs r0, 0x15
	bl sub_812B1F0
	b _0812B406
_0812B388:
	ldr r0, _0812B3B0 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl is_light_level_8_or_9
	lsls r0, 24
	cmp r0, 0
	beq _0812B400
	ldr r0, _0812B3B4 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	cmp r1, 0x4
	beq _0812B3A8
	movs r0, 0x82
	lsls r0, 1
	cmp r1, r0
	bne _0812B3B8
_0812B3A8:
	movs r0, 0xE
	bl sub_812B1F0
	b _0812B406
	.align 2, 0
_0812B3B0: .4byte gMapHeader
_0812B3B4: .4byte gSaveBlock1Ptr
_0812B3B8:
	movs r0, 0xC1
	lsls r0, 2
	cmp r1, r0
	bne _0812B3C8
	movs r0, 0xF
	bl sub_812B1F0
	b _0812B406
_0812B3C8:
	bl IsCurMapPokeCenter
	cmp r0, 0x1
	bne _0812B3D8
	movs r0, 0x10
	bl sub_812B1F0
	b _0812B406
_0812B3D8:
	bl sub_812B25C
	cmp r0, 0x1
	bne _0812B3E8
	movs r0, 0x11
	bl sub_812B1F0
	b _0812B406
_0812B3E8:
	bl sub_812B26C
	cmp r0, 0x1
	bne _0812B3F8
	movs r0, 0x12
	bl sub_812B1F0
	b _0812B406
_0812B3F8:
	movs r0, 0x13
	bl sub_812B1F0
	b _0812B406
_0812B400:
	movs r0, 0x14
	bl sub_812B1F0
_0812B406:
	pop {r0}
	bx r0
	thumb_func_end sub_812B35C

	thumb_func_start sub_812B40C
sub_812B40C: @ 812B40C
	push {lr}
	ldr r0, _0812B434 @ =gUnknown_203B0EE
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0812B42E
	ldr r0, _0812B438 @ =gSaveFileStatus
	ldrh r0, [r0]
	cmp r0, 0
	beq _0812B440
	cmp r0, 0x2
	beq _0812B440
	ldr r0, _0812B43C @ =0x0000083c
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0812B440
_0812B42E:
	movs r0, 0
	b _0812B44E
	.align 2, 0
_0812B434: .4byte gUnknown_203B0EE
_0812B438: .4byte gSaveFileStatus
_0812B43C: .4byte 0x0000083c
_0812B440:
	ldr r0, _0812B454 @ =0x0000083c
	bl FlagSet
	ldr r1, _0812B458 @ =gUnknown_203B0EE
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
_0812B44E:
	pop {r1}
	bx r1
	.align 2, 0
_0812B454: .4byte 0x0000083c
_0812B458: .4byte gUnknown_203B0EE
	thumb_func_end sub_812B40C

	thumb_func_start sub_812B45C
sub_812B45C: @ 812B45C
	push {lr}
	ldr r0, _0812B46C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0812B470
	movs r0, 0x1
	b _0812B472
	.align 2, 0
_0812B46C: .4byte gReceivedRemoteLinkPlayers
_0812B470:
	movs r0, 0
_0812B472:
	pop {r1}
	bx r1
	thumb_func_end sub_812B45C

	thumb_func_start sub_812B478
sub_812B478: @ 812B478
	ldr r1, _0812B480 @ =gUnknown_3005ECC
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0812B480: .4byte gUnknown_3005ECC
	thumb_func_end sub_812B478

	thumb_func_start sub_812B484
sub_812B484: @ 812B484
	push {lr}
	ldr r0, _0812B4A4 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0812B49E
	ldr r1, _0812B4A8 @ =gUnknown_3005ECC
	movs r0, 0x1
	strb r0, [r1]
	bl sub_812B4B8
_0812B49E:
	pop {r0}
	bx r0
	.align 2, 0
_0812B4A4: .4byte gUnknown_203ADFA
_0812B4A8: .4byte gUnknown_3005ECC
	thumb_func_end sub_812B484

	thumb_func_start sub_812B4AC
sub_812B4AC: @ 812B4AC
	ldr r1, _0812B4B4 @ =gUnknown_203F175
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0812B4B4: .4byte gUnknown_203F175
	thumb_func_end sub_812B4AC

	thumb_func_start sub_812B4B8
sub_812B4B8: @ 812B4B8
	ldr r1, _0812B4C0 @ =gUnknown_203F175
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0812B4C0: .4byte gUnknown_203F175
	thumb_func_end sub_812B4B8

	thumb_func_start sub_812B4C4
sub_812B4C4: @ 812B4C4
	str r1, [r0]
	movs r2, 0x1
	movs r1, 0x1
	strh r1, [r0, 0x4]
	strh r1, [r0, 0x6]
	strb r2, [r0, 0x8]
	movs r1, 0x4
	strb r1, [r0, 0x9]
	bx lr
	thumb_func_end sub_812B4C4

	thumb_func_start sub_812B4D8
sub_812B4D8: @ 812B4D8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_812B4C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_812B520
	ldr r0, _0812B518 @ =gUnknown_841DFAC
	bl sub_812BF74
	ldr r0, _0812B51C @ =gUnknown_3005E9C
	ldrb r2, [r0, 0x2]
	adds r0, r4, 0
	movs r1, 0
	bl sub_813C64C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_812BF9C
	movs r0, 0x1
	bl sub_813BDA4
	movs r0, 0x1
	bl sub_813BD5C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B518: .4byte gUnknown_841DFAC
_0812B51C: .4byte gUnknown_3005E9C
	thumb_func_end sub_812B4D8

	thumb_func_start sub_812B520
sub_812B520: @ 812B520
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r4, 0
	movs r3, 0
	ldr r0, _0812B598 @ =gUnknown_845C4B0
	mov r9, r0
	ldr r1, _0812B59C @ =gUnknown_203B0EC
	mov r8, r1
	ldr r0, _0812B5A0 @ =gUnknown_845C4B6
	mov r12, r0
	ldr r7, _0812B5A4 @ =gUnknown_845B080
_0812B53E:
	mov r1, r9
	adds r0, r3, r1
	ldrb r2, [r0]
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	adds r0, r2, r0
	add r0, r12
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0812B56C
	lsls r1, r4, 3
	adds r1, r5
	lsls r0, r2, 2
	adds r0, r7
	ldr r0, [r0]
	str r0, [r1]
	str r2, [r1, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0812B56C:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _0812B53E
	lsls r0, r4, 3
	adds r0, r5
	subs r0, 0x8
	movs r1, 0x2
	negs r1, r1
	str r1, [r0, 0x4]
	movs r0, 0
	strh r4, [r6, 0x4]
	strh r4, [r6, 0x6]
	strb r0, [r6, 0x8]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812B598: .4byte gUnknown_845C4B0
_0812B59C: .4byte gUnknown_203B0EC
_0812B5A0: .4byte gUnknown_845C4B6
_0812B5A4: .4byte gUnknown_845B080
	thumb_func_end sub_812B520

	thumb_func_start sub_812B5A8
sub_812B5A8: @ 812B5A8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	bl sub_813BDE8
	movs r0, 0
	bl sub_813BFC0
	movs r0, 0x1
	bl sub_813BE78
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_812B4C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_812B614
	ldr r0, _0812B608 @ =gUnknown_841DFC9
	bl sub_812BF74
	ldrb r1, [r4, 0xC]
	ldrb r2, [r4, 0xD]
	adds r0, r4, 0
	bl sub_813C64C
	ldr r1, _0812B60C @ =gUnknown_845B080
	ldr r0, _0812B610 @ =gUnknown_3005E9C
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_813C4CC
	movs r0, 0x1
	bl sub_813BDA4
	movs r0, 0x1
	bl sub_813BD5C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B608: .4byte gUnknown_841DFC9
_0812B60C: .4byte gUnknown_845B080
_0812B610: .4byte gUnknown_3005E9C
	thumb_func_end sub_812B5A8

	thumb_func_start sub_812B614
sub_812B614: @ 812B614
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	adds r5, r1, 0
	movs r6, 0
	ldr r3, _0812B664 @ =gUnknown_845B9E0
	ldr r0, _0812B668 @ =gUnknown_203B0EC
	ldrh r1, [r0]
	lsls r0, r1, 2
	ldr r2, _0812B66C @ =gUnknown_3005E9C
	adds r0, r1
	ldrb r2, [r2, 0x1]
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldr r3, [r0]
	movs r7, 0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _0812B6D0
_0812B640:
	adds r4, r3, r7
	ldrb r0, [r4]
	str r3, [sp]
	bl sub_812B780
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp]
	cmp r0, 0x1
	bne _0812B6C2
	ldr r0, _0812B66C @ =gUnknown_3005E9C
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _0812B674
	lsls r1, r6, 3
	adds r1, r5
	ldr r2, _0812B670 @ =gUnknown_845B0B0
	b _0812B6AA
	.align 2, 0
_0812B664: .4byte gUnknown_845B9E0
_0812B668: .4byte gUnknown_203B0EC
_0812B66C: .4byte gUnknown_3005E9C
_0812B670: .4byte gUnknown_845B0B0
_0812B674:
	cmp r0, 0x1
	bne _0812B684
	lsls r1, r6, 3
	adds r1, r5
	ldr r2, _0812B680 @ =gUnknown_845B218
	b _0812B6AA
	.align 2, 0
_0812B680: .4byte gUnknown_845B218
_0812B684:
	cmp r0, 0x2
	bne _0812B694
	lsls r1, r6, 3
	adds r1, r5
	ldr r2, _0812B690 @ =gUnknown_845B3A0
	b _0812B6AA
	.align 2, 0
_0812B690: .4byte gUnknown_845B3A0
_0812B694:
	cmp r0, 0x3
	bne _0812B6A4
	lsls r1, r6, 3
	adds r1, r5
	ldr r2, _0812B6A0 @ =gUnknown_845B500
	b _0812B6AA
	.align 2, 0
_0812B6A0: .4byte gUnknown_845B500
_0812B6A4:
	lsls r1, r6, 3
	adds r1, r5
	ldr r2, _0812B744 @ =gUnknown_845B540
_0812B6AA:
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
	lsls r0, r6, 3
	adds r0, r5
	ldrb r1, [r4]
	str r1, [r0, 0x4]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0812B6C2:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r3, r7
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0812B640
_0812B6D0:
	bl sub_812B754
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812B710
	movs r7, 0
	ldr r3, _0812B748 @ =gUnknown_845B9BE
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _0812B710
	ldr r4, _0812B74C @ =gUnknown_845B3A0
_0812B6E8:
	lsls r1, r6, 3
	adds r1, r5
	adds r2, r3, r7
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	ldrb r0, [r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r3, r7
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0812B6E8
_0812B710:
	lsls r0, r6, 3
	adds r0, r5
	ldr r1, _0812B750 @ =gUnknown_81B2E6F
	str r1, [r0]
	movs r1, 0x2
	negs r1, r1
	str r1, [r0, 0x4]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0
	mov r0, r8
	strh r6, [r0, 0x4]
	movs r0, 0x7
	mov r2, r8
	strh r0, [r2, 0x6]
	strb r1, [r2, 0x8]
	movs r0, 0x15
	strb r0, [r2, 0x9]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812B744: .4byte gUnknown_845B540
_0812B748: .4byte gUnknown_845B9BE
_0812B74C: .4byte gUnknown_845B3A0
_0812B750: .4byte gUnknown_81B2E6F
	thumb_func_end sub_812B614

	thumb_func_start sub_812B754
sub_812B754: @ 812B754
	push {lr}
	movs r0, 0x96
	lsls r0, 3
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812B778
	ldr r0, _0812B774 @ =gUnknown_3005E9C
	ldrb r0, [r0, 0x1]
	cmp r0, 0x2
	bne _0812B778
	movs r0, 0x1
	b _0812B77A
	.align 2, 0
_0812B774: .4byte gUnknown_3005E9C
_0812B778:
	movs r0, 0
_0812B77A:
	pop {r1}
	bx r1
	thumb_func_end sub_812B754

	thumb_func_start sub_812B780
sub_812B780: @ 812B780
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	adds r5, r1, 0
	movs r4, 0
	ldr r0, _0812B7A8 @ =gUnknown_3005E9C
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0812B794
	b _0812B8AC
_0812B794:
	subs r0, r1, 0x1
	cmp r0, 0x2B
	bls _0812B79C
	b _0812BB04
_0812B79C:
	lsls r0, 2
	ldr r1, _0812B7AC @ =_0812B7B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812B7A8: .4byte gUnknown_3005E9C
_0812B7AC: .4byte _0812B7B0
	.align 2, 0
_0812B7B0:
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812B860
	.4byte _0812BB08
	.4byte _0812B868
	.4byte _0812B870
	.4byte _0812BB08
	.4byte _0812B880
	.4byte _0812B868
	.4byte _0812B878
	.4byte _0812B890
	.4byte _0812B880
	.4byte _0812B880
	.4byte _0812B880
	.4byte _0812B868
	.4byte _0812B880
	.4byte _0812B880
	.4byte _0812B868
	.4byte _0812B880
	.4byte _0812B888
	.4byte _0812B868
	.4byte _0812B888
	.4byte _0812B878
	.4byte _0812B890
	.4byte _0812B880
	.4byte _0812B890
	.4byte _0812B896
	.4byte _0812B880
	.4byte _0812B890
	.4byte _0812B880
	.4byte _0812B890
	.4byte _0812B890
	.4byte _0812BB08
	.4byte _0812B868
	.4byte _0812B868
	.4byte _0812B880
	.4byte _0812BB08
	.4byte _0812B89C
	.4byte _0812B896
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812B8A4
_0812B860:
	ldr r0, _0812B864 @ =0x000002cf
	b _0812BAF2
	.align 2, 0
_0812B864: .4byte 0x000002cf
_0812B868:
	ldr r0, _0812B86C @ =0x00000891
	b _0812BAF2
	.align 2, 0
_0812B86C: .4byte 0x00000891
_0812B870:
	ldr r0, _0812B874 @ =0x00000895
	b _0812BAF2
	.align 2, 0
_0812B874: .4byte 0x00000895
_0812B878:
	ldr r0, _0812B87C @ =0x000008a4
	b _0812BAF2
	.align 2, 0
_0812B87C: .4byte 0x000008a4
_0812B880:
	ldr r0, _0812B884 @ =0x00000828
	b _0812BAF2
	.align 2, 0
_0812B884: .4byte 0x00000828
_0812B888:
	ldr r0, _0812B88C @ =0x00000829
	b _0812BAF2
	.align 2, 0
_0812B88C: .4byte 0x00000829
_0812B890:
	movs r0, 0x82
	lsls r0, 4
	b _0812BAF2
_0812B896:
	bl sub_812BB10
	b _0812BAF6
_0812B89C:
	ldr r0, _0812B8A0 @ =0x0000029b
	b _0812BAF2
	.align 2, 0
_0812B8A0: .4byte 0x0000029b
_0812B8A4:
	ldr r0, _0812B8A8 @ =0x00000892
	b _0812BAF2
	.align 2, 0
_0812B8A8: .4byte 0x00000892
_0812B8AC:
	cmp r0, 0x1
	beq _0812B8B2
	b _0812B9D8
_0812B8B2:
	subs r0, r1, 0x1
	cmp r0, 0x2F
	bls _0812B8BA
	b _0812BB04
_0812B8BA:
	lsls r0, 2
	ldr r1, _0812B8C4 @ =_0812B8C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812B8C4: .4byte _0812B8C8
	.align 2, 0
_0812B8C8:
	.4byte _0812B988
	.4byte _0812B9A0
	.4byte _0812B9A0
	.4byte _0812B9A8
	.4byte _0812B9A0
	.4byte _0812BB08
	.4byte _0812B9A0
	.4byte _0812B9A0
	.4byte _0812B9A0
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812B9A0
	.4byte _0812B990
	.4byte _0812B9BA
	.4byte _0812B9C0
	.4byte _0812B9C0
	.4byte _0812B9C6
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812B988
	.4byte _0812BB08
	.4byte _0812B9A0
	.4byte _0812B9A0
	.4byte _0812B9A8
	.4byte _0812B9A0
	.4byte _0812BB08
	.4byte _0812B988
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812B9A0
	.4byte _0812B9A0
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812B9D0
_0812B988:
	ldr r0, _0812B98C @ =0x00000829
	b _0812BAF2
	.align 2, 0
_0812B98C: .4byte 0x00000829
_0812B990:
	ldr r0, _0812B99C @ =0x00000169
	movs r1, 0x1
	bl CheckBagHasItem
	b _0812BAF6
	.align 2, 0
_0812B99C: .4byte 0x00000169
_0812B9A0:
	ldr r0, _0812B9A4 @ =0x00000828
	b _0812BAF2
	.align 2, 0
_0812B9A4: .4byte 0x00000828
_0812B9A8:
	movs r0, 0x1
	bl sub_8088EDC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0812B9B8
	b _0812BB08
_0812B9B8:
	b _0812BB04
_0812B9BA:
	movs r0, 0x82
	lsls r0, 4
	b _0812BAF2
_0812B9C0:
	bl sub_812BB10
	b _0812BAF6
_0812B9C6:
	ldr r0, _0812B9CC @ =0x00000271
	b _0812BAF2
	.align 2, 0
_0812B9CC: .4byte 0x00000271
_0812B9D0:
	ldr r0, _0812B9D4 @ =0x0000082c
	b _0812BAF2
	.align 2, 0
_0812B9D4: .4byte 0x0000082c
_0812B9D8:
	cmp r0, 0x2
	beq _0812B9DE
	b _0812BADC
_0812B9DE:
	bl sub_812B754
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812BA0E
	ldr r0, _0812BA20 @ =gUnknown_845B9BE
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0xFF
	beq _0812BA0E
	adds r1, r2, 0
_0812B9F6:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, r5
	bne _0812BA00
	b _0812BB04
_0812BA00:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0812B9F6
_0812BA0E:
	subs r0, r5, 0x1
	cmp r0, 0x26
	bls _0812BA16
	b _0812BB08
_0812BA16:
	lsls r0, 2
	ldr r1, _0812BA24 @ =_0812BA28
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812BA20: .4byte gUnknown_845B9BE
_0812BA24: .4byte _0812BA28
	.align 2, 0
_0812BA28:
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAD2
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BB08
	.4byte _0812BAD2
	.4byte _0812BAC4
	.4byte _0812BB08
	.4byte _0812BAD2
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BAC4
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BB08
	.4byte _0812BACC
	.4byte _0812BACC
	.4byte _0812BB08
	.4byte _0812BAD2
_0812BAC4:
	ldr r0, _0812BAC8 @ =0x00000828
	b _0812BAF2
	.align 2, 0
_0812BAC8: .4byte 0x00000828
_0812BACC:
	bl sub_812BB10
	b _0812BAF6
_0812BAD2:
	ldr r0, _0812BAD8 @ =0x000008a4
	b _0812BAF2
	.align 2, 0
_0812BAD8: .4byte 0x000008a4
_0812BADC:
	cmp r0, 0x3
	bne _0812BB00
	cmp r5, 0x5
	beq _0812BAEA
	cmp r5, 0x6
	beq _0812BAF0
	b _0812BB08
_0812BAEA:
	movs r0, 0x82
	lsls r0, 4
	b _0812BAF2
_0812BAF0:
	ldr r0, _0812BAFC @ =0x00000821
_0812BAF2:
	bl FlagGet
_0812BAF6:
	lsls r0, 24
	lsrs r0, 24
	b _0812BB0A
	.align 2, 0
_0812BAFC: .4byte 0x00000821
_0812BB00:
	cmp r0, 0x4
	beq _0812BB08
_0812BB04:
	movs r0, 0
	b _0812BB0A
_0812BB08:
	movs r0, 0x1
_0812BB0A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_812B780

	thumb_func_start sub_812BB10
sub_812BB10: @ 812BB10
	push {lr}
	ldr r0, _0812BB7C @ =0x00000237
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	movs r0, 0x8E
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB80 @ =0x00000239
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB84 @ =0x0000023a
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB88 @ =0x0000023b
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB8C @ =0x000002ef
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB90 @ =0x000001f1
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	movs r0, 0
	b _0812BB96
	.align 2, 0
_0812BB7C: .4byte 0x00000237
_0812BB80: .4byte 0x00000239
_0812BB84: .4byte 0x0000023a
_0812BB88: .4byte 0x0000023b
_0812BB8C: .4byte 0x000002ef
_0812BB90: .4byte 0x000001f1
_0812BB94:
	movs r0, 0x1
_0812BB96:
	pop {r1}
	bx r1
	thumb_func_end sub_812BB10

	thumb_func_start sub_812BB9C
sub_812BB9C: @ 812BB9C
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r0, [r2, 0xE]
	cmp r0, 0xA
	bhi _0812BC4C
	lsls r0, 2
	ldr r1, _0812BBB4 @ =_0812BBB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812BBB4: .4byte _0812BBB8
	.align 2, 0
_0812BBB8:
	.4byte _0812BC02
	.4byte _0812BC0C
	.4byte _0812BC16
	.4byte _0812BC20
	.4byte _0812BC2A
	.4byte _0812BC34
	.4byte _0812BC3E
	.4byte _0812BC4C
	.4byte _0812BBE4
	.4byte _0812BBEE
	.4byte _0812BBF8
_0812BBE4:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BC54
	b _0812BC46
_0812BBEE:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BC80
	b _0812BC46
_0812BBF8:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BCA8
	b _0812BC46
_0812BC02:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BCD0
	b _0812BC46
_0812BC0C:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BD2C
	b _0812BC46
_0812BC16:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BD64
	b _0812BC46
_0812BC20:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BD98
	b _0812BC46
_0812BC2A:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BE10
	b _0812BC46
_0812BC34:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BEEC
	b _0812BC46
_0812BC3E:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BF18
_0812BC46:
	lsls r0, 24
	lsrs r0, 24
	b _0812BC4E
_0812BC4C:
	movs r0, 0
_0812BC4E:
	pop {r1}
	bx r1
	thumb_func_end sub_812BB9C

	thumb_func_start sub_812BC54
sub_812BC54: @ 812BC54
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812BC7C @ =gUnknown_841DFA5
	bl sub_812BF74
	bl sub_812BF5C
	movs r0, 0x1
	bl sub_813BDA4
	movs r0, 0x1
	bl sub_813BD5C
	movs r0, 0x9
	strb r0, [r4, 0xE]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BC7C: .4byte gUnknown_841DFA5
	thumb_func_end sub_812BC54

	thumb_func_start sub_812BC80
sub_812BC80: @ 812BC80
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812BCA4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812BC9A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	strb r0, [r4, 0xE]
_0812BC9A:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BCA4: .4byte gMain
	thumb_func_end sub_812BC80

	thumb_func_start sub_812BCA8
sub_812BCA8: @ 812BCA8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	ldr r0, _0812BCCC @ =gUnknown_3005E9C
	movs r5, 0
	strb r5, [r0, 0x2]
	adds r0, r4, 0
	bl sub_812BF94
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_812B4D8
	strb r5, [r4, 0xE]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0812BCCC: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BCA8

	thumb_func_start sub_812BCD0
sub_812BCD0: @ 812BCD0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_813C690
	adds r1, r0, 0
	adds r0, r1, 0x6
	cmp r0, 0x5
	bhi _0812BD16
	lsls r0, 2
	ldr r1, _0812BCEC @ =_0812BCF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812BCEC: .4byte _0812BCF0
	.align 2, 0
_0812BCF0:
	.4byte _0812BD08
	.4byte _0812BD0C
	.4byte _0812BD0C
	.4byte _0812BD1E
	.4byte _0812BD08
	.4byte _0812BD1E
_0812BD08:
	movs r0, 0
	b _0812BD20
_0812BD0C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_812BF9C
	b _0812BD1E
_0812BD16:
	ldr r0, _0812BD28 @ =gUnknown_3005E9C
	strb r1, [r0, 0x1]
	movs r0, 0x1
	strb r0, [r4, 0xE]
_0812BD1E:
	movs r0, 0x1
_0812BD20:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812BD28: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BCD0

	thumb_func_start sub_812BD2C
sub_812BD2C: @ 812BD2C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0812BD60 @ =gUnknown_3005E9C
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4, 0xD]
	strb r0, [r1, 0x2]
	adds r0, r4, 0
	bl sub_812BF94
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_812B5A8
	bl sub_813C75C
	movs r0, 0x2
	bl sub_813C684
	movs r0, 0x3
	strb r0, [r4, 0xE]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812BD60: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BD2C

	thumb_func_start sub_812BD64
sub_812BD64: @ 812BD64
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0
	movs r1, 0
	bl sub_813C004
	movs r0, 0x1
	movs r1, 0
	bl sub_813C004
	ldr r0, _0812BD94 @ =gUnknown_3005E9C
	movs r4, 0
	strb r4, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_812B4D8
	strb r4, [r5, 0xE]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0812BD94: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BD64

	thumb_func_start sub_812BD98
sub_812BD98: @ 812BD98
	push {r4,lr}
	adds r4, r0, 0
	bl sub_813C690
	adds r1, r0, 0
	adds r0, r1, 0x6
	cmp r0, 0x5
	bhi _0812BDD8
	lsls r0, 2
	ldr r1, _0812BDB4 @ =_0812BDB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812BDB4: .4byte _0812BDB8
	.align 2, 0
_0812BDB8:
	.4byte _0812BDD0
	.4byte _0812BDE0
	.4byte _0812BDE0
	.4byte _0812BDE0
	.4byte _0812BDD4
	.4byte _0812BDE0
_0812BDD0:
	movs r0, 0
	b _0812BDE2
_0812BDD4:
	movs r0, 0x2
	b _0812BDDE
_0812BDD8:
	ldr r0, _0812BDE8 @ =gUnknown_3005E9C
	strb r1, [r0, 0x3]
	movs r0, 0x4
_0812BDDE:
	strb r0, [r4, 0xE]
_0812BDE0:
	movs r0, 0x1
_0812BDE2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BDE8: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BD98

	thumb_func_start sub_812BDEC
sub_812BDEC: @ 812BDEC
	push {lr}
	ldr r1, _0812BE08 @ =gUnknown_845B080
	ldr r0, _0812BE0C @ =gUnknown_3005E9C
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_813C4CC
	pop {r0}
	bx r0
	.align 2, 0
_0812BE08: .4byte gUnknown_845B080
_0812BE0C: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BDEC

	thumb_func_start sub_812BE10
sub_812BE10: @ 812BE10
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0812BE4C @ =gUnknown_3005E9C
	movs r0, 0x2
	strb r0, [r4]
	movs r0, 0
	bl sub_813BDA4
	bl sub_813C624
	ldr r0, _0812BE50 @ =gUnknown_841DFBE
	bl sub_812BF74
	movs r0, 0x1
	bl sub_813BDE8
	movs r0, 0x1
	bl sub_813BEE4
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _0812BE5C
	ldr r0, _0812BE54 @ =gUnknown_845B0B0
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BE58 @ =gUnknown_845B164
	b _0812BEA4
	.align 2, 0
_0812BE4C: .4byte gUnknown_3005E9C
_0812BE50: .4byte gUnknown_841DFBE
_0812BE54: .4byte gUnknown_845B0B0
_0812BE58: .4byte gUnknown_845B164
_0812BE5C:
	cmp r0, 0x1
	bne _0812BE78
	ldr r0, _0812BE70 @ =gUnknown_845B218
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BE74 @ =gUnknown_845B2DC
	b _0812BEA4
	.align 2, 0
_0812BE70: .4byte gUnknown_845B218
_0812BE74: .4byte gUnknown_845B2DC
_0812BE78:
	cmp r0, 0x2
	bne _0812BE94
	ldr r0, _0812BE8C @ =gUnknown_845B3A0
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BE90 @ =gUnknown_845B450
	b _0812BEA4
	.align 2, 0
_0812BE8C: .4byte gUnknown_845B3A0
_0812BE90: .4byte gUnknown_845B450
_0812BE94:
	cmp r0, 0x3
	bne _0812BEB8
	ldr r0, _0812BEB0 @ =gUnknown_845B500
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BEB4 @ =gUnknown_845B520
_0812BEA4:
	adds r1, r2
	ldr r1, [r1]
	bl sub_813C50C
	b _0812BECC
	.align 2, 0
_0812BEB0: .4byte gUnknown_845B500
_0812BEB4: .4byte gUnknown_845B520
_0812BEB8:
	ldr r0, _0812BEE4 @ =gUnknown_845B540
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BEE8 @ =gUnknown_845B5D0
	adds r1, r2
	ldr r1, [r1]
	bl sub_813C50C
_0812BECC:
	movs r0, 0x1
	bl sub_813BDA4
	movs r0, 0x1
	bl sub_813BD5C
	movs r0, 0x6
	strb r0, [r5, 0xE]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812BEE4: .4byte gUnknown_845B540
_0812BEE8: .4byte gUnknown_845B5D0
	thumb_func_end sub_812BE10

	thumb_func_start sub_812BEEC
sub_812BEEC: @ 812BEEC
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _0812BF14 @ =gUnknown_3005E9C
	movs r0, 0x1
	strb r0, [r2]
	adds r0, r4, 0
	bl sub_812B5A8
	bl sub_813C75C
	movs r0, 0x2
	bl sub_813C684
	movs r0, 0x3
	strb r0, [r4, 0xE]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BF14: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BEEC

	thumb_func_start sub_812BF18
sub_812BF18: @ 812BF18
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812BF40 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0812BF30
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812BF44
_0812BF30:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x5
	strb r0, [r4, 0xE]
	movs r0, 0x1
	b _0812BF54
	.align 2, 0
_0812BF40: .4byte gMain
_0812BF44:
	movs r0, 0xC0
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _0812BF52
	movs r0, 0x1
	b _0812BF54
_0812BF52:
	movs r0, 0
_0812BF54:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812BF18

	thumb_func_start sub_812BF5C
sub_812BF5C: @ 812BF5C
	push {lr}
	bl sub_813C624
	ldr r0, _0812BF70 @ =gUnknown_81B2FC9
	movs r1, 0
	movs r2, 0
	bl sub_813C4CC
	pop {r0}
	bx r0
	.align 2, 0
_0812BF70: .4byte gUnknown_81B2FC9
	thumb_func_end sub_812BF5C

	thumb_func_start sub_812BF74
sub_812BF74: @ 812BF74
	push {r4,lr}
	adds r4, r0, 0
	bl sub_813C5FC
	adds r0, r4, 0
	bl sub_813C488
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812BF74

	thumb_func_start sub_812BF88
sub_812BF88: @ 812BF88
	ldr r0, _0812BF90 @ =gUnknown_3005E9C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0812BF90: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BF88

	thumb_func_start sub_812BF94
sub_812BF94: @ 812BF94
	movs r1, 0
	strb r1, [r0, 0xC]
	strb r1, [r0, 0xD]
	bx lr
	thumb_func_end sub_812BF94

	thumb_func_start sub_812BF9C
sub_812BF9C: @ 812BF9C
	push {lr}
	ldrb r2, [r0, 0xC]
	ldrb r0, [r0, 0xD]
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	ldr r1, [r2, 0x4]
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _0812BFC0
	ldr r0, _0812BFBC @ =gUnknown_845B098
	ldr r0, [r0, 0x14]
	bl sub_813C584
	b _0812BFCC
	.align 2, 0
_0812BFBC: .4byte gUnknown_845B098
_0812BFC0:
	ldr r0, _0812BFD8 @ =gUnknown_845B098
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_813C584
_0812BFCC:
	movs r0, 0x1
	bl sub_813BE30
	pop {r0}
	bx r0
	.align 2, 0
_0812BFD8: .4byte gUnknown_845B098
	thumb_func_end sub_812BF9C

	.align 2, 0 @ Don't pad with nop.
