	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FD3A4
sub_80FD3A4: @ 80FD3A4
	push {r4,lr}
	bl rfu_REQBN_softReset_and_checkID
	adds r4, r0, 0
	ldr r0, _080FD3E8 @ =0x00008001
	cmp r4, r0
	bne _080FD3B8
	ldr r1, _080FD3EC @ =gUnknown_3005E10
	movs r0, 0x1
	strb r0, [r1, 0x8]
_080FD3B8:
	ldr r0, _080FD3EC @ =gUnknown_3005E10
	ldrb r2, [r0, 0x4]
	adds r1, r0, 0
	cmp r2, 0x17
	beq _080FD3CC
	cmp r2, 0x1
	beq _080FD3CC
	movs r0, 0
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
_080FD3CC:
	movs r0, 0
	strb r0, [r1, 0x7]
	strb r0, [r1, 0xD]
	strb r0, [r1, 0x1]
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x6]
	bl sub_80FEAF4
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FD3E8: .4byte 0x00008001
_080FD3EC: .4byte gUnknown_3005E10
	thumb_func_end sub_80FD3A4

	thumb_func_start rfu_REQ_sendData_wrapper
rfu_REQ_sendData_wrapper: @ 80FD3F0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080FD410 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FD418
	ldr r0, _080FD414 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x2]
	movs r2, 0
	cmp r0, 0x1
	bne _080FD420
	movs r2, 0x1
	b _080FD420
	.align 2, 0
_080FD410: .4byte gUnknown_3007460
_080FD414: .4byte gUnknown_3005E10
_080FD418:
	ldr r0, _080FD42C @ =gUnknown_3005E10
	ldrb r1, [r0, 0x3]
	movs r1, 0
	strb r1, [r0, 0x3]
_080FD420:
	adds r0, r2, 0
	bl rfu_REQ_sendData
	pop {r0}
	bx r0
	.align 2, 0
_080FD42C: .4byte gUnknown_3005E10
	thumb_func_end rfu_REQ_sendData_wrapper

	thumb_func_start sub_80FD430
sub_80FD430: @ 80FD430
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	cmp r5, 0
	beq _080FD478
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r4, _080FD468 @ =gUnknown_3005E10
	ldr r2, _080FD46C @ =0x01000024
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0xFF
	strb r0, [r4, 0x6]
	str r5, [r4, 0x40]
	str r6, [r4, 0x44]
	ldr r0, _080FD470 @ =sub_80FE394
	bl rfu_setMSCCallback
	ldr r0, _080FD474 @ =sub_80FDC98
	bl rfu_setREQCallback
	movs r0, 0
	b _080FD47A
	.align 2, 0
_080FD468: .4byte gUnknown_3005E10
_080FD46C: .4byte 0x01000024
_080FD470: .4byte sub_80FE394
_080FD474: .4byte sub_80FDC98
_080FD478:
	movs r0, 0x4
_080FD47A:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD430

	thumb_func_start sub_80FD484
sub_80FD484: @ 80FD484
	push {r4,lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r4, _080FD4A8 @ =gUnknown_3005E10
	ldr r2, _080FD4AC @ =0x01000020
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0xFF
	strb r0, [r4, 0x6]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FD4A8: .4byte gUnknown_3005E10
_080FD4AC: .4byte 0x01000020
	thumb_func_end sub_80FD484

	thumb_func_start sub_80FD4B0
sub_80FD4B0: @ 80FD4B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80FD4E4
	ldr r1, _080FD4E0 @ =gUnknown_3005E10
	movs r2, 0x1
	strb r2, [r1, 0x4]
	movs r0, 0x2
	strb r0, [r1, 0x5]
	str r4, [r1, 0x3C]
	ldrb r0, [r4, 0x11]
	strb r0, [r1, 0x9]
	ldrh r0, [r4, 0x12]
	strh r0, [r1, 0x32]
	ldrh r0, [r4, 0x14]
	strh r0, [r1, 0x18]
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _080FD4D8
	strb r2, [r1, 0xB]
_080FD4D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FD4E0: .4byte gUnknown_3005E10
	thumb_func_end sub_80FD4B0

	thumb_func_start sub_80FD4E4
sub_80FD4E4: @ 80FD4E4
	push {r4,r5,lr}
	ldr r2, _080FD528 @ =gUnknown_3005E10
	movs r0, 0
	strb r0, [r2, 0x5]
	strb r0, [r2, 0x4]
	movs r1, 0xFF
	strb r1, [r2, 0x6]
	strb r0, [r2, 0x7]
	strb r0, [r2, 0x10]
	strb r0, [r2, 0xC]
	adds r1, r2, 0
	adds r1, 0x24
	strb r0, [r1]
	adds r1, 0xC
	strb r0, [r1]
	movs r3, 0
	adds r5, r2, 0
	adds r5, 0x28
	movs r4, 0
	adds r2, 0x34
_080FD50C:
	lsls r1, r3, 1
	adds r0, r1, r5
	strh r4, [r0]
	adds r1, r2
	strh r4, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080FD50C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FD528: .4byte gUnknown_3005E10
	thumb_func_end sub_80FD4E4

	thumb_func_start sub_80FD52C
sub_80FD52C: @ 80FD52C
	ldr r1, _080FD534 @ =gUnknown_3005E10
	movs r0, 0x15
	strb r0, [r1, 0x4]
	bx lr
	.align 2, 0
_080FD534: .4byte gUnknown_3005E10
	thumb_func_end sub_80FD52C

	thumb_func_start sub_80FD538
sub_80FD538: @ 80FD538
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r3, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r1, _080FD570 @ =gUnknown_3005E10
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080FD574
	cmp r0, 0x8
	bne _080FD55E
	cmp r5, 0x1
	beq _080FD574
_080FD55E:
	movs r0, 0x1
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_80FE7F0
	movs r0, 0x1
	b _080FD606
	.align 2, 0
_080FD570: .4byte gUnknown_3005E10
_080FD574:
	bl rfu_getMasterSlave
	lsls r0, 24
	cmp r0, 0
	bne _080FD594
	ldr r1, _080FD590 @ =gUnknown_3005E10
	movs r0, 0x2
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_80FE7F0
	movs r0, 0x2
	b _080FD606
	.align 2, 0
_080FD590: .4byte gUnknown_3005E10
_080FD594:
	movs r2, 0
	ldrh r0, [r6]
	ldr r4, _080FD5C8 @ =0x0000ffff
	adds r1, r6, 0x2
	ldr r3, _080FD5CC @ =gUnknown_3005E10
	cmp r0, r4
	beq _080FD5B4
_080FD5A2:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bhi _080FD5B4
	ldrh r0, [r1]
	adds r1, 0x2
	cmp r0, r4
	bne _080FD5A2
_080FD5B4:
	cmp r2, 0x10
	bne _080FD5D0
	movs r0, 0x4
	strh r0, [r3, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_80FE7F0
	movs r0, 0x4
	b _080FD606
	.align 2, 0
_080FD5C8: .4byte 0x0000ffff
_080FD5CC: .4byte gUnknown_3005E10
_080FD5D0:
	cmp r5, 0x1
	bls _080FD5DE
	movs r0, 0x1
	strb r0, [r3, 0x7]
	movs r5, 0x1
	movs r7, 0
	b _080FD5E2
_080FD5DE:
	movs r0, 0
	strb r0, [r3, 0x7]
_080FD5E2:
	cmp r5, 0
	beq _080FD5EC
	movs r0, 0x5
	strb r0, [r3, 0x4]
	b _080FD5FA
_080FD5EC:
	movs r0, 0x9
	strb r0, [r3, 0x4]
	ldrb r0, [r3, 0xB]
	cmp r0, 0
	beq _080FD5FA
	movs r0, 0x2
	strb r0, [r3, 0xB]
_080FD5FA:
	strb r5, [r3, 0x6]
	strh r7, [r3, 0x1A]
	mov r0, r8
	strh r0, [r3, 0x26]
	str r6, [r3, 0x20]
	movs r0, 0
_080FD606:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD538

	thumb_func_start sub_80FD610
sub_80FD610: @ 80FD610
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldr r1, _080FD644 @ =gUnknown_3005E10
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080FD648
	subs r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _080FD648
	movs r0, 0x1
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_80FE7F0
	movs r0, 0x1
	b _080FD6E8
	.align 2, 0
_080FD644: .4byte gUnknown_3005E10
_080FD648:
	bl rfu_getMasterSlave
	lsls r0, 24
	cmp r0, 0
	bne _080FD668
	ldr r1, _080FD664 @ =gUnknown_3005E10
	movs r0, 0x2
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_80FE7F0
	movs r0, 0x2
	b _080FD6E8
	.align 2, 0
_080FD664: .4byte gUnknown_3005E10
_080FD668:
	movs r2, 0
	ldr r0, _080FD6B4 @ =gUnknown_3007460
	ldr r1, [r0]
	ldrb r3, [r1, 0x8]
	ldr r5, _080FD6B8 @ =gUnknown_3005E10
	adds r7, r0, 0
	cmp r2, r3
	bcs _080FD696
	ldrh r0, [r1, 0x14]
	cmp r0, r6
	beq _080FD696
	adds r4, r1, 0
	adds r1, r3, 0
_080FD682:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcs _080FD696
	lsls r0, r2, 5
	adds r0, r4, r0
	ldrh r0, [r0, 0x14]
	cmp r0, r6
	bne _080FD682
_080FD696:
	ldr r0, [r7]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _080FD6A2
	cmp r2, r0
	bne _080FD6BC
_080FD6A2:
	movs r0, 0x3
	strh r0, [r5, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_80FE7F0
	movs r0, 0x3
	b _080FD6E8
	.align 2, 0
_080FD6B4: .4byte gUnknown_3007460
_080FD6B8: .4byte gUnknown_3005E10
_080FD6BC:
	ldrb r0, [r5, 0x4]
	cmp r0, 0
	beq _080FD6C6
	cmp r0, 0x9
	bne _080FD6CE
_080FD6C6:
	movs r0, 0xC
	strb r0, [r5, 0x4]
	movs r0, 0xD
	b _080FD6D4
_080FD6CE:
	movs r0, 0xB
	strb r0, [r5, 0x4]
	movs r0, 0xC
_080FD6D4:
	strb r0, [r5, 0x5]
	strh r6, [r5, 0x1E]
	mov r0, r8
	strh r0, [r5, 0x1A]
	ldrb r0, [r5, 0x7]
	cmp r0, 0
	beq _080FD6E6
	movs r0, 0x7
	strb r0, [r5, 0x7]
_080FD6E6:
	movs r0, 0
_080FD6E8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD610

	thumb_func_start sub_80FD6F4
sub_80FD6F4: @ 80FD6F4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r6, _080FD758 @ =gUnknown_3005E10
	adds r3, r6, 0
	adds r3, 0x30
	ldrb r2, [r3]
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080FD750
	adds r0, r2, 0
	bics r0, r1
	strb r0, [r3]
	movs r4, 0
	ldr r7, _080FD75C @ =gUnknown_3007460
	movs r5, 0x1
	adds r3, 0x4
	movs r2, 0
_080FD71A:
	adds r0, r1, 0
	asrs r0, r4
	ands r0, r5
	cmp r0, 0
	beq _080FD72A
	lsls r0, r4, 1
	adds r0, r3
	strh r2, [r0]
_080FD72A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080FD71A
	ldr r0, [r7]
	ldrb r4, [r0, 0x3]
	ands r4, r1
	cmp r4, 0
	beq _080FD744
	adds r0, r4, 0
	bl sub_80FE818
_080FD744:
	ldr r0, _080FD758 @ =gUnknown_3005E10
	strh r4, [r0, 0x14]
	movs r0, 0x33
	adds r1, r4, 0
	bl sub_80FE7F0
_080FD750:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD758: .4byte gUnknown_3005E10
_080FD75C: .4byte gUnknown_3007460
	thumb_func_end sub_80FD6F4

	thumb_func_start sub_80FD760
sub_80FD760: @ 80FD760
	push {r4,r5,lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _080FD77C @ =gUnknown_3005E10
	strb r2, [r1, 0x7]
	adds r5, r1, 0
	cmp r0, 0
	beq _080FD780
	bl sub_80FD4E4
	movs r0, 0x17
	strb r0, [r5, 0x4]
	b _080FD84A
	.align 2, 0
_080FD77C: .4byte gUnknown_3005E10
_080FD780:
	ldrb r0, [r5, 0x4]
	subs r0, 0x5
	cmp r0, 0xD
	bhi _080FD836
	lsls r0, 2
	ldr r1, _080FD794 @ =_080FD798
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FD794: .4byte _080FD798
	.align 2, 0
_080FD798:
	.4byte _080FD7D0
	.4byte _080FD7DC
	.4byte _080FD7DC
	.4byte _080FD83C
	.4byte _080FD7E6
	.4byte _080FD7F0
	.4byte _080FD7F0
	.4byte _080FD7FA
	.4byte _080FD804
	.4byte _080FD804
	.4byte _080FD83C
	.4byte _080FD80A
	.4byte _080FD830
	.4byte _080FD830
_080FD7D0:
	movs r1, 0
	movs r0, 0x8
	strb r0, [r5, 0x4]
	strb r1, [r5, 0x5]
	movs r2, 0x13
	b _080FD83C
_080FD7DC:
	movs r0, 0x7
	strb r0, [r5, 0x4]
	movs r0, 0x8
	strb r0, [r5, 0x5]
	b _080FD83C
_080FD7E6:
	movs r0, 0
	strb r0, [r5, 0x5]
	strb r0, [r5, 0x4]
	movs r2, 0x21
	b _080FD83C
_080FD7F0:
	movs r1, 0
	movs r0, 0xB
	strb r0, [r5, 0x4]
	strb r1, [r5, 0x5]
	b _080FD83C
_080FD7FA:
	movs r0, 0
	strb r0, [r5, 0x5]
	strb r0, [r5, 0x4]
	movs r2, 0x23
	b _080FD83C
_080FD804:
	movs r0, 0xE
	strb r0, [r5, 0x4]
	b _080FD83C
_080FD80A:
	ldrb r0, [r5, 0x11]
	strb r0, [r5, 0x4]
	ldrb r0, [r5, 0x12]
	strb r0, [r5, 0x5]
	ldr r4, _080FD82C @ =gUnknown_3007460
	ldr r0, [r4]
	ldrb r0, [r0, 0x3]
	bl sub_80FE818
	ldr r0, [r4]
	ldrb r0, [r0, 0x3]
	strh r0, [r5, 0x14]
	movs r0, 0x33
	movs r1, 0x1
	bl sub_80FE7F0
	b _080FD84A
	.align 2, 0
_080FD82C: .4byte gUnknown_3007460
_080FD830:
	movs r0, 0x12
	strb r0, [r5, 0x4]
	b _080FD83C
_080FD836:
	strb r2, [r5, 0x5]
	strb r2, [r5, 0x4]
	movs r2, 0x43
_080FD83C:
	ldrb r0, [r5, 0x4]
	cmp r0, 0
	bne _080FD84A
	adds r0, r2, 0
	movs r1, 0
	bl sub_80FE7F0
_080FD84A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80FD760

	thumb_func_start sub_80FD850
sub_80FD850: @ 80FD850
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	mov r8, r1
	mov r5, sp
	adds r5, 0x1
	mov r4, sp
	adds r4, 0x2
	mov r1, sp
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_81E13F0
	mov r0, sp
	ldrb r0, [r0]
	adds r7, r4, 0
	cmp r0, 0
	beq _080FD922
	ldr r1, _080FD8EC @ =gUnknown_3005E10
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, 0x14]
	ldrb r0, [r5]
	strh r0, [r1, 0x16]
	ldrb r0, [r1, 0x9]
	adds r6, r1, 0
	cmp r0, 0
	beq _080FD90A
	movs r0, 0x1
	strb r0, [r6, 0xA]
	ldrb r0, [r6, 0x6]
	cmp r0, 0
	bne _080FD8A6
	ldrb r0, [r5]
	cmp r0, 0
	bne _080FD8A6
	movs r0, 0x4
	strb r0, [r6, 0xA]
_080FD8A6:
	ldrb r0, [r6, 0xA]
	cmp r0, 0x1
	bne _080FD8F0
	movs r2, 0
	mov r4, sp
	movs r5, 0x1
	mov r12, r6
	mov r3, r12
	adds r3, 0x30
	movs r6, 0x34
	add r6, r12
	mov r9, r6
_080FD8BE:
	ldrb r0, [r4]
	asrs r0, r2
	ands r0, r5
	cmp r0, 0
	beq _080FD8DC
	adds r0, r5, 0
	lsls r0, r2
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r2, 1
	add r0, r9
	mov r6, r12
	ldrh r1, [r6, 0x32]
	strh r1, [r0]
_080FD8DC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080FD8BE
	movs r0, 0x31
	b _080FD902
	.align 2, 0
_080FD8EC: .4byte gUnknown_3005E10
_080FD8F0:
	movs r0, 0
	strb r0, [r6, 0xA]
	mov r0, sp
	ldrb r0, [r0]
	bl sub_80FE818
	movs r0, 0x1
	mov r8, r0
	movs r0, 0x33
_080FD902:
	movs r1, 0x1
	bl sub_80FE7F0
	b _080FD91E
_080FD90A:
	mov r0, sp
	ldrb r0, [r0]
	bl sub_80FE818
	movs r1, 0x1
	mov r8, r1
	movs r0, 0x30
	movs r1, 0x2
	bl sub_80FE7F0
_080FD91E:
	bl sub_80FEAF4
_080FD922:
	ldr r0, _080FDA0C @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FD9FC
	ldrb r0, [r7]
	cmp r0, 0
	beq _080FD980
	movs r2, 0
	ldr r6, _080FDA10 @ =gUnknown_3005E10
	movs r3, 0x1
	adds r4, r6, 0
	adds r4, 0x34
	adds r6, 0x30
	adds r5, r7, 0
_080FD940:
	ldrb r0, [r6]
	asrs r0, r2
	ands r0, r3
	cmp r0, 0
	beq _080FD95C
	ldrb r0, [r5]
	asrs r0, r2
	ands r0, r3
	cmp r0, 0
	beq _080FD95C
	lsls r0, r2, 1
	adds r0, r4
	movs r1, 0
	strh r1, [r0]
_080FD95C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080FD940
	ldr r3, _080FDA10 @ =gUnknown_3005E10
	adds r2, r3, 0
	adds r2, 0x30
	ldrb r1, [r7]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	strh r0, [r3, 0x14]
	movs r0, 0x32
	movs r1, 0x1
	bl sub_80FE7F0
_080FD980:
	ldr r0, _080FDA10 @ =gUnknown_3005E10
	adds r3, r0, 0
	adds r3, 0x30
	ldrb r1, [r3]
	adds r6, r0, 0
	cmp r1, 0
	beq _080FD9F8
	movs r4, 0
	movs r2, 0
	movs r5, 0x1
_080FD994:
	ldrb r0, [r3]
	asrs r0, r2
	ands r0, r5
	cmp r0, 0
	beq _080FD9C6
	lsls r1, r2, 1
	adds r0, r6, 0
	adds r0, 0x34
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _080FD9C6
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _080FD9C6
	adds r0, r5, 0
	lsls r0, r2
	ldrb r1, [r3]
	bics r1, r0
	strb r1, [r3]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080FD9C6:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080FD994
	cmp r4, 0
	beq _080FD9EA
	adds r0, r4, 0
	bl sub_80FE818
	movs r6, 0x1
	mov r8, r6
	ldr r0, _080FDA10 @ =gUnknown_3005E10
	strh r4, [r0, 0x14]
	movs r0, 0x33
	movs r1, 0x1
	bl sub_80FE7F0
_080FD9EA:
	ldr r0, _080FDA10 @ =gUnknown_3005E10
	adds r1, r0, 0
	adds r1, 0x30
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	bne _080FD9FC
_080FD9F8:
	movs r0, 0
	strb r0, [r6, 0xA]
_080FD9FC:
	mov r0, r8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FDA0C: .4byte gUnknown_3007460
_080FDA10: .4byte gUnknown_3005E10
	thumb_func_end sub_80FD850

	thumb_func_start rfu_syncVBlank_
rfu_syncVBlank_: @ 80FDA14
	push {lr}
	bl rfu_syncVBlank
	lsls r0, 16
	cmp r0, 0
	beq _080FDA2C
	movs r0, 0xF1
	movs r1, 0
	bl sub_80FE7F0
	bl sub_80FEAF4
_080FDA2C:
	pop {r0}
	bx r0
	thumb_func_end rfu_syncVBlank_

	thumb_func_start sub_80FDA30
sub_80FDA30: @ 80FDA30
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, _080FDA48 @ =gUnknown_3005E10
	ldr r2, [r1, 0x40]
	cmp r2, 0
	bne _080FDA4C
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080FDA4C
	strb r2, [r1, 0x4]
	b _080FDC1A
	.align 2, 0
_080FDA48: .4byte gUnknown_3005E10
_080FDA4C:
	ldr r0, _080FDA80 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _080FDA5A
	adds r0, r3, 0
	bl sub_80FDC28
_080FDA5A:
	ldr r4, _080FDA80 @ =gUnknown_3005E10
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	bne _080FDA64
	b _080FDBE4
_080FDA64:
	bl rfu_waitREQComplete
	movs r0, 0x1
	strb r0, [r4, 0xE]
	ldrb r0, [r4, 0x4]
	subs r0, 0x1
	cmp r0, 0x16
	bls _080FDA76
	b _080FDBDA
_080FDA76:
	lsls r0, 2
	ldr r1, _080FDA84 @ =_080FDA88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FDA80: .4byte gUnknown_3005E10
_080FDA84: .4byte _080FDA88
	.align 2, 0
_080FDA88:
	.4byte _080FDB08
	.4byte _080FDB40
	.4byte _080FDB46
	.4byte _080FDB5C
	.4byte _080FDB74
	.4byte _080FDB7A
	.4byte _080FDB80
	.4byte _080FDBDA
	.4byte _080FDB86
	.4byte _080FDB8C
	.4byte _080FDB92
	.4byte _080FDB98
	.4byte _080FDBA8
	.4byte _080FDBAE
	.4byte _080FDBDA
	.4byte _080FDBB4
	.4byte _080FDBC4
	.4byte _080FDBCA
	.4byte _080FDBD0
	.4byte _080FDBDA
	.4byte _080FDBD6
	.4byte _080FDBDA
	.4byte _080FDAE4
_080FDAE4:
	bl sub_80FD3A4
	ldr r1, _080FDB00 @ =0x00008001
	movs r2, 0xFF
	cmp r0, r1
	bne _080FDAF2
	movs r2, 0x44
_080FDAF2:
	ldr r1, _080FDB04 @ =gUnknown_3005E10
	movs r0, 0
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
	adds r0, r2, 0
	b _080FDB32
	.align 2, 0
_080FDB00: .4byte 0x00008001
_080FDB04: .4byte gUnknown_3005E10
_080FDB08:
	bl sub_80FD3A4
	ldr r1, _080FDB20 @ =0x00008001
	cmp r0, r1
	bne _080FDB28
	ldr r0, _080FDB24 @ =gUnknown_3005E10
	ldrb r1, [r0, 0x5]
	strb r1, [r0, 0x4]
	movs r1, 0x3
	strb r1, [r0, 0x5]
	b _080FDBDA
	.align 2, 0
_080FDB20: .4byte 0x00008001
_080FDB24: .4byte gUnknown_3005E10
_080FDB28:
	ldr r1, _080FDB3C @ =gUnknown_3005E10
	movs r0, 0
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
	movs r0, 0xFF
_080FDB32:
	movs r1, 0
	bl sub_80FE7F0
	b _080FDBDA
	.align 2, 0
_080FDB3C: .4byte gUnknown_3005E10
_080FDB40:
	bl rfu_REQ_reset
	b _080FDBDA
_080FDB46:
	ldr r0, _080FDB58 @ =gUnknown_3005E10
	ldr r2, [r0, 0x3C]
	ldrh r0, [r2, 0x2]
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	bl rfu_REQ_configSystem
	b _080FDBDA
	.align 2, 0
_080FDB58: .4byte gUnknown_3005E10
_080FDB5C:
	ldr r0, _080FDB70 @ =gUnknown_3005E10
	ldr r3, [r0, 0x3C]
	ldrb r0, [r3, 0x4]
	ldrh r1, [r3, 0x6]
	ldr r2, [r3, 0x8]
	ldr r3, [r3, 0xC]
	bl rfu_REQ_configGameData
	b _080FDBDA
	.align 2, 0
_080FDB70: .4byte gUnknown_3005E10
_080FDB74:
	bl sub_81E0CAC
	b _080FDBDA
_080FDB7A:
	bl rfu_REQ_pollSearchChild
	b _080FDBDA
_080FDB80:
	bl rfu_REQ_endSearchChild
	b _080FDBDA
_080FDB86:
	bl rfu_REQ_startSearchParent
	b _080FDBDA
_080FDB8C:
	bl rfu_REQ_pollSearchParent
	b _080FDBDA
_080FDB92:
	bl rfu_REQ_endSearchParent
	b _080FDBDA
_080FDB98:
	ldr r0, _080FDBA4 @ =gUnknown_3005E10
	ldrh r0, [r0, 0x1E]
	bl rfu_REQ_startConnectParent
	b _080FDBDA
	.align 2, 0
_080FDBA4: .4byte gUnknown_3005E10
_080FDBA8:
	bl rfu_REQ_pollConnectParent
	b _080FDBDA
_080FDBAE:
	bl rfu_REQ_endConnectParent
	b _080FDBDA
_080FDBB4:
	ldr r0, _080FDBC0 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	bl rfu_REQ_CHILD_startConnectRecovery
	b _080FDBDA
	.align 2, 0
_080FDBC0: .4byte gUnknown_3007460
_080FDBC4:
	bl rfu_REQ_CHILD_pollConnectRecovery
	b _080FDBDA
_080FDBCA:
	bl rfu_REQ_CHILD_endConnectRecovery
	b _080FDBDA
_080FDBD0:
	bl rfu_REQ_changeMasterSlave
	b _080FDBDA
_080FDBD6:
	bl rfu_REQ_stopMode
_080FDBDA:
	bl rfu_waitREQComplete
	ldr r1, _080FDC20 @ =gUnknown_3005E10
	movs r0, 0
	strb r0, [r1, 0xE]
_080FDBE4:
	ldr r0, _080FDC20 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x4]
	subs r0, 0x12
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080FDBF4
	b _080FDA5A
_080FDBF4:
	ldr r0, _080FDC24 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FDC0A
	movs r0, 0
	bl sub_80FD850
	lsls r0, 24
	cmp r0, 0
	bne _080FDC1A
_080FDC0A:
	bl sub_80FE418
	bl sub_80FE63C
	bl sub_80FE74C
	bl sub_80FE918
_080FDC1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FDC20: .4byte gUnknown_3005E10
_080FDC24: .4byte gUnknown_3007460
	thumb_func_end sub_80FDA30

	thumb_func_start sub_80FDC28
sub_80FDC28: @ 80FDC28
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080FDC4C @ =gUnknown_3005E10
	ldrb r1, [r0, 0x7]
	adds r4, r0, 0
	cmp r1, 0x5
	bne _080FDC52
	movs r2, 0x1
	strb r2, [r4, 0x6]
	strb r1, [r4, 0x4]
	ldrh r0, [r4, 0x1C]
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	beq _080FDC50
	movs r0, 0x6
	strb r0, [r4, 0x7]
	b _080FDC52
	.align 2, 0
_080FDC4C: .4byte gUnknown_3005E10
_080FDC50:
	strb r2, [r4, 0x7]
_080FDC52:
	ldrb r0, [r4, 0x7]
	cmp r0, 0x1
	bne _080FDC7C
	strb r0, [r4, 0x6]
	movs r0, 0x5
	strb r0, [r4, 0x4]
	adds r0, r3, 0
	movs r1, 0x8C
	bl __umodsi3
	strh r0, [r4, 0x1A]
	movs r1, 0x8C
	subs r1, r0
	strh r1, [r4, 0x1C]
	lsls r0, 16
	cmp r0, 0
	beq _080FDC78
	movs r0, 0x2
	b _080FDC7A
_080FDC78:
	movs r0, 0x3
_080FDC7A:
	strb r0, [r4, 0x7]
_080FDC7C:
	ldrb r0, [r4, 0x7]
	cmp r0, 0x3
	bne _080FDC92
	movs r0, 0
	strb r0, [r4, 0x6]
	movs r0, 0x28
	strh r0, [r4, 0x1A]
	movs r0, 0x4
	strb r0, [r4, 0x7]
	movs r0, 0x9
	strb r0, [r4, 0x4]
_080FDC92:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FDC28

	thumb_func_start sub_80FDC98
sub_80FDC98: @ 80FDC98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _080FDCD0 @ =gUnknown_3005E10
	ldrb r1, [r0, 0xE]
	adds r7, r0, 0
	cmp r1, 0
	bne _080FDCB6
	b _080FE17C
_080FDCB6:
	movs r0, 0
	strb r0, [r7, 0xE]
	mov r0, r8
	subs r0, 0x10
	cmp r0, 0x2D
	bls _080FDCC4
	b _080FE16E
_080FDCC4:
	lsls r0, 2
	ldr r1, _080FDCD4 @ =_080FDCD8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FDCD0: .4byte gUnknown_3005E10
_080FDCD4: .4byte _080FDCD8
	.align 2, 0
_080FDCD8:
	.4byte _080FDD90
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FDDBC
	.4byte _080FDDA8
	.4byte _080FE16E
	.4byte _080FDDD0
	.4byte _080FDDE0
	.4byte _080FDE04
	.4byte _080FDE24
	.4byte _080FDE44
	.4byte _080FDEB4
	.4byte _080FDEE6
	.4byte _080FDEFC
	.4byte _080FDF44
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE0BC
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FDFB4
	.4byte _080FE000
	.4byte _080FE048
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE16E
	.4byte _080FE15C
_080FDD90:
	cmp r6, 0
	beq _080FDD96
	b _080FE16E
_080FDD96:
	ldr r0, _080FDDA4 @ =gUnknown_3005E10
	ldrb r1, [r0, 0x5]
	strb r1, [r0, 0x4]
	movs r1, 0x4
	strb r1, [r0, 0x5]
	b _080FE16E
	.align 2, 0
_080FDDA4: .4byte gUnknown_3005E10
_080FDDA8:
	cmp r6, 0
	beq _080FDDAE
	b _080FE16E
_080FDDAE:
	ldr r0, _080FDDB8 @ =gUnknown_3005E10
	ldrb r1, [r0, 0x5]
	strb r1, [r0, 0x4]
	strb r6, [r0, 0x5]
	b _080FE16E
	.align 2, 0
_080FDDB8: .4byte gUnknown_3005E10
_080FDDBC:
	cmp r6, 0
	beq _080FDDC2
	b _080FE16E
_080FDDC2:
	ldr r0, _080FDDCC @ =gUnknown_3005E10
	strb r6, [r0, 0x5]
	strb r6, [r0, 0x4]
	movs r0, 0
	b _080FE0DA
	.align 2, 0
_080FDDCC: .4byte gUnknown_3005E10
_080FDDD0:
	cmp r6, 0
	beq _080FDDD6
	b _080FE16E
_080FDDD6:
	ldr r1, _080FDDDC @ =gUnknown_3005E10
	movs r0, 0x6
	b _080FDEF0
	.align 2, 0
_080FDDDC: .4byte gUnknown_3005E10
_080FDDE0:
	ldr r1, _080FDE00 @ =gUnknown_3005E10
	ldrh r0, [r1, 0x1A]
	cmp r0, 0
	bne _080FDDEA
	b _080FE16E
_080FDDEA:
	subs r0, 0x1
	strh r0, [r1, 0x1A]
	lsls r0, 16
	cmp r0, 0
	beq _080FDDF6
	b _080FE16E
_080FDDF6:
	movs r0, 0x7
	strb r0, [r1, 0x4]
	movs r0, 0x8
	strb r0, [r1, 0x5]
	b _080FE16E
	.align 2, 0
_080FDE00: .4byte gUnknown_3005E10
_080FDE04:
	cmp r6, 0
	beq _080FDE0A
	b _080FE16E
_080FDE0A:
	ldr r0, _080FDE20 @ =gUnknown_3005E10
	ldrb r1, [r0, 0x5]
	strb r1, [r0, 0x4]
	strb r6, [r0, 0x5]
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _080FDE1A
	b _080FE16E
_080FDE1A:
	movs r0, 0x13
	b _080FE0DA
	.align 2, 0
_080FDE20: .4byte gUnknown_3005E10
_080FDE24:
	cmp r6, 0
	beq _080FDE2A
	b _080FE16E
_080FDE2A:
	ldrb r0, [r7, 0xB]
	cmp r0, 0x1
	bne _080FDE3A
	ldrh r0, [r7, 0x1A]
	cmp r0, 0x1
	bls _080FDE3A
	subs r0, 0x1
	strh r0, [r7, 0x1A]
_080FDE3A:
	ldr r1, _080FDE40 @ =gUnknown_3005E10
	movs r0, 0xA
	b _080FDEF0
	.align 2, 0
_080FDE40: .4byte gUnknown_3005E10
_080FDE44:
	cmp r6, 0
	bne _080FDE8A
	bl sub_80FE778
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	ldr r4, _080FDEAC @ =gUnknown_3005E10
	strh r0, [r4, 0x14]
	cmp r0, 0
	beq _080FDE64
	movs r0, 0x20
	movs r1, 0x1
	bl sub_80FE7F0
_080FDE64:
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	beq _080FDE8A
	ldrh r0, [r4, 0x1A]
	cmp r0, 0x1
	beq _080FDE8A
	ldr r0, _080FDEB0 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0x4
	bne _080FDE8A
	bl rfu_REQ_endSearchParent
	bl rfu_waitREQComplete
	movs r0, 0x9
	strb r0, [r4, 0x4]
	movs r0, 0x1
	strb r0, [r4, 0xB]
_080FDE8A:
	ldr r1, _080FDEAC @ =gUnknown_3005E10
	ldrh r0, [r1, 0x1A]
	cmp r0, 0
	bne _080FDE94
	b _080FE16E
_080FDE94:
	subs r0, 0x1
	strh r0, [r1, 0x1A]
	lsls r0, 16
	cmp r0, 0
	beq _080FDEA0
	b _080FE16E
_080FDEA0:
	movs r0, 0xB
	strb r0, [r1, 0x4]
	movs r0, 0
	strb r0, [r1, 0x5]
	b _080FE16E
	.align 2, 0
_080FDEAC: .4byte gUnknown_3005E10
_080FDEB0: .4byte gUnknown_3007460
_080FDEB4:
	cmp r6, 0
	beq _080FDEBA
	b _080FE16E
_080FDEBA:
	ldr r2, _080FDED4 @ =gUnknown_3005E10
	ldrb r0, [r2, 0x5]
	strb r0, [r2, 0x4]
	ldrb r1, [r2, 0x7]
	cmp r1, 0
	bne _080FDED8
	lsls r0, 24
	cmp r0, 0
	beq _080FDECE
	b _080FE16E
_080FDECE:
	movs r0, 0x21
	b _080FE0DA
	.align 2, 0
_080FDED4: .4byte gUnknown_3005E10
_080FDED8:
	cmp r1, 0x7
	bne _080FDEDE
	b _080FE16E
_080FDEDE:
	movs r0, 0x5
	strb r0, [r2, 0x4]
	strb r0, [r2, 0x7]
	b _080FE16E
_080FDEE6:
	cmp r6, 0
	beq _080FDEEC
	b _080FE16E
_080FDEEC:
	ldr r1, _080FDEF8 @ =gUnknown_3005E10
	movs r0, 0xD
_080FDEF0:
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
	b _080FE16E
	.align 2, 0
_080FDEF8: .4byte gUnknown_3005E10
_080FDEFC:
	cmp r6, 0
	bne _080FDF20
	ldr r4, _080FDF3C @ =gUnknown_3005E20
	mov r0, sp
	adds r1, r4, 0
	bl rfu_getConnectParentStatus
	lsls r0, 16
	cmp r0, 0
	bne _080FDF20
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FDF20
	adds r1, r4, 0
	subs r1, 0x10
	movs r0, 0xE
	strb r0, [r1, 0x4]
_080FDF20:
	ldr r1, _080FDF40 @ =gUnknown_3005E10
	ldrh r0, [r1, 0x1A]
	cmp r0, 0
	bne _080FDF2A
	b _080FE16E
_080FDF2A:
	subs r0, 0x1
	strh r0, [r1, 0x1A]
	lsls r0, 16
	cmp r0, 0
	beq _080FDF36
	b _080FE16E
_080FDF36:
	movs r0, 0xE
	strb r0, [r1, 0x4]
	b _080FE16E
	.align 2, 0
_080FDF3C: .4byte gUnknown_3005E20
_080FDF40: .4byte gUnknown_3005E10
_080FDF44:
	cmp r6, 0
	beq _080FDF4A
	b _080FE16E
_080FDF4A:
	ldr r4, _080FDF7C @ =gUnknown_3005E20
	mov r0, sp
	adds r1, r4, 0
	bl rfu_getConnectParentStatus
	lsls r0, 16
	cmp r0, 0
	beq _080FDF5C
	b _080FE16E
_080FDF5C:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FDF80
	adds r1, r4, 0
	subs r1, 0x10
	movs r0, 0x13
	strb r0, [r1, 0x4]
	movs r0, 0xF
	strb r0, [r1, 0x5]
	movs r0, 0x22
	strh r0, [r1, 0x1E]
	ldrb r0, [r1, 0x10]
	strh r0, [r1, 0x14]
	b _080FDFA0
	.align 2, 0
_080FDF7C: .4byte gUnknown_3005E20
_080FDF80:
	adds r1, r4, 0
	subs r1, 0x10
	strb r6, [r1, 0x5]
	strb r6, [r1, 0x4]
	movs r0, 0x23
	strh r0, [r1, 0x1E]
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, 0x14]
	ldrb r0, [r1, 0x7]
	cmp r0, 0
	beq _080FDFA0
	movs r0, 0x3
	strb r0, [r1, 0x7]
	movs r0, 0x9
	strb r0, [r1, 0x4]
_080FDFA0:
	ldr r4, _080FDFB0 @ =gUnknown_3005E10
	ldrb r0, [r4, 0x1E]
	movs r1, 0x1
	bl sub_80FE7F0
	movs r0, 0
	strh r0, [r4, 0x1E]
	b _080FE16E
	.align 2, 0
_080FDFB0: .4byte gUnknown_3005E10
_080FDFB4:
	cmp r6, 0
	beq _080FDFBA
	b _080FE16E
_080FDFBA:
	ldr r2, _080FDFFC @ =gUnknown_3007460
	ldr r3, [r2]
	ldrb r0, [r3, 0x3]
	movs r1, 0
	strh r0, [r7, 0x14]
	movs r0, 0x11
	strb r0, [r7, 0x5]
	strb r0, [r7, 0x4]
	strb r1, [r7, 0x10]
	ldrb r0, [r3, 0x3]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FDFD8
	b _080FE16E
_080FDFD8:
	adds r1, r7, 0
	movs r3, 0x1
_080FDFDC:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080FDFEC
	b _080FE16E
_080FDFEC:
	ldr r0, [r2]
	ldrb r0, [r0, 0x3]
	ldrb r4, [r7, 0x10]
	asrs r0, r4
	ands r0, r3
	cmp r0, 0
	beq _080FDFDC
	b _080FE16E
	.align 2, 0
_080FDFFC: .4byte gUnknown_3007460
_080FE000:
	cmp r6, 0
	bne _080FE01E
	mov r0, sp
	bl rfu_CHILD_getConnectRecoveryStatus
	lsls r0, 16
	cmp r0, 0
	bne _080FE01E
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _080FE01E
	ldr r1, _080FE044 @ =gUnknown_3005E10
	movs r0, 0x12
	strb r0, [r1, 0x4]
_080FE01E:
	ldr r2, _080FE044 @ =gUnknown_3005E10
	ldrb r0, [r2, 0x10]
	lsls r0, 1
	adds r1, r2, 0
	adds r1, 0x34
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	bne _080FE032
	b _080FE16E
_080FE032:
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080FE03E
	b _080FE16E
_080FE03E:
	movs r0, 0x12
	strb r0, [r2, 0x4]
	b _080FE16E
	.align 2, 0
_080FE044: .4byte gUnknown_3005E10
_080FE048:
	cmp r6, 0
	beq _080FE04E
	b _080FE16E
_080FE04E:
	mov r0, sp
	bl rfu_CHILD_getConnectRecoveryStatus
	lsls r0, 16
	cmp r0, 0
	beq _080FE05C
	b _080FE16E
_080FE05C:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FE078
	ldr r1, _080FE074 @ =gUnknown_3005E10
	movs r0, 0x13
	strb r0, [r1, 0x4]
	movs r0, 0x16
	strb r0, [r1, 0x5]
	movs r0, 0x32
	strh r0, [r1, 0x1E]
	b _080FE08C
	.align 2, 0
_080FE074: .4byte gUnknown_3005E10
_080FE078:
	ldr r4, _080FE0B4 @ =gUnknown_3005E10
	strb r6, [r4, 0x5]
	strb r6, [r4, 0x4]
	ldr r0, _080FE0B8 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	bl sub_80FE818
	movs r0, 0x33
	strh r0, [r4, 0x1E]
_080FE08C:
	ldr r5, _080FE0B4 @ =gUnknown_3005E10
	ldrb r0, [r5, 0x10]
	lsls r0, 1
	adds r1, r5, 0
	adds r1, 0x34
	adds r0, r1
	movs r1, 0
	movs r4, 0
	strh r4, [r0]
	adds r0, r5, 0
	adds r0, 0x30
	strb r1, [r0]
	strb r1, [r5, 0xA]
	ldrb r0, [r5, 0x1E]
	movs r1, 0x1
	bl sub_80FE7F0
	strh r4, [r5, 0x1E]
	b _080FE16E
	.align 2, 0
_080FE0B4: .4byte gUnknown_3005E10
_080FE0B8: .4byte gUnknown_3007460
_080FE0BC:
	cmp r6, 0
	bne _080FE16E
	ldr r5, _080FE0E4 @ =gUnknown_3005E10
	ldrb r1, [r5, 0x5]
	adds r0, r1, 0
	cmp r0, 0x16
	bne _080FE0E8
	ldrb r0, [r5, 0x11]
	strb r0, [r5, 0x4]
	ldrb r0, [r5, 0x12]
	strb r0, [r5, 0x5]
	ldrb r0, [r5, 0x2]
	movs r0, 0x1
	strb r0, [r5, 0x2]
	movs r0, 0x41
_080FE0DA:
	movs r1, 0
	bl sub_80FE7F0
	b _080FE16E
	.align 2, 0
_080FE0E4: .4byte gUnknown_3005E10
_080FE0E8:
	cmp r0, 0xF
	bne _080FE16E
	strb r1, [r5, 0x4]
	ldrb r0, [r5, 0x2]
	movs r4, 0x1
	strb r4, [r5, 0x2]
	movs r0, 0x41
	movs r1, 0
	bl sub_80FE7F0
	adds r1, r5, 0
	adds r1, 0x24
	ldrb r0, [r5, 0x10]
	lsls r4, r0
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
	ldrb r0, [r5, 0x10]
	lsls r0, 1
	adds r1, 0x4
	adds r0, r1
	ldrh r1, [r5, 0x26]
	movs r7, 0
	strh r1, [r0]
	ldrb r1, [r5, 0x10]
	movs r0, 0x4
	bl rfu_clearSlot
	mov r4, sp
	ldrb r0, [r5, 0x10]
	movs r1, 0xE
	bl rfu_NI_CHILD_setSendGameName
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	beq _080FE16E
	strb r7, [r5, 0x5]
	strb r7, [r5, 0x4]
	bl sub_80FEAF4
	ldr r0, _080FE158 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	orrs r0, r1
	bl sub_80FE818
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r5, 0x14]
	movs r0, 0x25
	movs r1, 0x1
	bl sub_80FE7F0
	b _080FE16E
	.align 2, 0
_080FE158: .4byte gUnknown_3007460
_080FE15C:
	cmp r6, 0
	bne _080FE16E
	ldr r0, _080FE178 @ =gUnknown_3005E10
	strb r6, [r0, 0x5]
	strb r6, [r0, 0x4]
	movs r0, 0x42
	movs r1, 0
	bl sub_80FE7F0
_080FE16E:
	ldr r1, _080FE178 @ =gUnknown_3005E10
	movs r0, 0x1
	strb r0, [r1, 0xE]
	b _080FE1CA
	.align 2, 0
_080FE178: .4byte gUnknown_3005E10
_080FE17C:
	cmp r6, 0x3
	bne _080FE1CA
	ldrb r0, [r7, 0xF]
	cmp r0, 0
	beq _080FE1CA
	mov r3, r8
	cmp r3, 0x24
	beq _080FE194
	cmp r3, 0x26
	beq _080FE194
	cmp r3, 0x27
	bne _080FE1CA
_080FE194:
	bl rfu_REQ_RFUStatus
	bl rfu_waitREQComplete
	mov r0, sp
	bl rfu_getRFUStatus
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FE1CA
	ldr r4, _080FE1E0 @ =gUnknown_3007460
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FE1CA
	bl rfu_getSTWIRecvBuffer
	ldr r1, [r4]
	ldrb r1, [r1, 0x2]
	strb r1, [r0, 0x4]
	movs r1, 0x1
	strb r1, [r0, 0x5]
	movs r0, 0x29
	bl sub_80FD850
	movs r6, 0
_080FE1CA:
	mov r4, r8
	cmp r4, 0x26
	bne _080FE1D2
	b _080FE2E6
_080FE1D2:
	cmp r4, 0x26
	bgt _080FE1E4
	cmp r4, 0x10
	bne _080FE1DC
	b _080FE304
_080FE1DC:
	b _080FE322
	.align 2, 0
_080FE1E0: .4byte gUnknown_3007460
_080FE1E4:
	mov r0, r8
	cmp r0, 0x30
	beq _080FE1F2
	cmp r0, 0x3D
	bne _080FE1F0
	b _080FE304
_080FE1F0:
	b _080FE322
_080FE1F2:
	cmp r6, 0
	beq _080FE1F8
	b _080FE326
_080FE1F8:
	bl rfu_getSTWIRecvBuffer
	ldr r4, _080FE2A8 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x8]
	strh r0, [r4, 0x14]
	bl sub_80FE83C
	adds r2, r4, 0
	adds r2, 0x30
	ldrb r1, [r2]
	cmp r1, 0
	beq _080FE24E
	ldrb r0, [r4, 0x14]
	adds r3, r1, 0
	bics r3, r0
	adds r0, r3, 0
	strb r0, [r2]
	movs r3, 0
	adds r7, r4, 0
	adds r1, r7, 0
	movs r5, 0x1
	adds r4, r1, 0
	adds r4, 0x34
	movs r2, 0
_080FE228:
	ldrh r0, [r1, 0x14]
	asrs r0, r3
	ands r0, r5
	cmp r0, 0
	beq _080FE238
	lsls r0, r3, 1
	adds r0, r4
	strh r2, [r0]
_080FE238:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080FE228
	ldr r1, _080FE2A8 @ =gUnknown_3005E10
	ldrb r0, [r1, 0x6]
	cmp r0, 0
	bne _080FE24E
	strb r0, [r1, 0x5]
	strb r0, [r1, 0x4]
_080FE24E:
	mov r3, sp
	ldr r1, _080FE2A8 @ =gUnknown_3005E10
	ldrb r2, [r1]
	ldrb r0, [r1, 0x14]
	ands r0, r2
	strb r0, [r3]
	movs r3, 0
	adds r7, r1, 0
	ldr r2, _080FE2AC @ =gUnknown_3007460
	mov r1, sp
	movs r5, 0x1
	adds r4, r7, 0
_080FE266:
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, 0
	beq _080FE27A
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _080FE27A
	subs r0, 0x1
	strb r0, [r7, 0x1]
_080FE27A:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080FE266
	ldrb r1, [r7, 0x14]
	ldrb r0, [r7]
	bics r0, r1
	strb r0, [r7]
	ldrb r1, [r7, 0x7]
	cmp r1, 0
	beq _080FE2C4
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080FE2D6
	cmp r1, 0x8
	bne _080FE2B0
	ldrh r0, [r7, 0x1C]
	strh r0, [r7, 0x1A]
	movs r0, 0x6
	strb r0, [r7, 0x7]
	b _080FE2C2
	.align 2, 0
_080FE2A8: .4byte gUnknown_3005E10
_080FE2AC: .4byte gUnknown_3007460
_080FE2B0:
	ldrb r0, [r7, 0x4]
	subs r0, 0x6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080FE2C4
	movs r0, 0x1
	strb r0, [r7, 0x7]
	movs r0, 0x5
_080FE2C2:
	strb r0, [r7, 0x4]
_080FE2C4:
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080FE2D6
	ldrb r0, [r7, 0x4]
	cmp r0, 0
	bne _080FE2D6
	movs r0, 0xFF
	strb r0, [r7, 0x6]
_080FE2D6:
	ldrb r0, [r7, 0xE]
	cmp r0, 0
	bne _080FE322
	movs r0, 0x40
	movs r1, 0x1
	bl sub_80FE7F0
	b _080FE322
_080FE2E6:
	bl sub_80FE6F0
	ldr r0, _080FE300 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080FE322
	movs r0, 0x50
	movs r1, 0
	bl sub_80FE7F0
	b _080FE322
	.align 2, 0
_080FE300: .4byte gUnknown_3007460
_080FE304:
	cmp r6, 0
	bne _080FE326
	ldr r0, _080FE350 @ =gUnknown_3005E10
	strb r6, [r0, 0xD]
	strb r6, [r0, 0x1]
	strb r6, [r0]
	movs r1, 0xFF
	strb r1, [r0, 0x6]
	bl sub_80FEAF4
	mov r4, r8
	cmp r4, 0x3D
	bne _080FE322
	bl sub_80FD484
_080FE322:
	cmp r6, 0
	beq _080FE376
_080FE326:
	ldr r7, _080FE350 @ =gUnknown_3005E10
	mov r0, r8
	cmp r0, 0x1C
	bne _080FE358
	cmp r6, 0
	beq _080FE358
	ldrb r0, [r7, 0x7]
	cmp r0, 0x4
	bne _080FE358
	ldr r2, _080FE354 @ =gUnknown_3007460
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, [r2]
	movs r0, 0xF
	strb r0, [r1, 0x2]
	bl sub_80FE818
	bl rfu_waitREQComplete
	b _080FE388
	.align 2, 0
_080FE350: .4byte gUnknown_3005E10
_080FE354: .4byte gUnknown_3007460
_080FE358:
	movs r1, 0
	mov r3, r8
	strh r3, [r7, 0x14]
	strh r6, [r7, 0x16]
	ldrb r0, [r7, 0xE]
	cmp r0, 0
	beq _080FE36A
	strb r1, [r7, 0x5]
	strb r1, [r7, 0x4]
_080FE36A:
	movs r0, 0xF0
	movs r1, 0x2
	bl sub_80FE7F0
	bl sub_80FEAF4
_080FE376:
	mov r4, r8
	cmp r4, 0xFF
	bne _080FE388
	movs r0, 0xF2
	movs r1, 0
	bl sub_80FE7F0
	bl sub_80FEAF4
_080FE388:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FDC98

	thumb_func_start sub_80FE394
sub_80FE394: @ 80FE394
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r4, _080FE3C8 @ =gUnknown_3005E10
	ldrb r7, [r4, 0xE]
	movs r0, 0
	strb r0, [r4, 0xE]
	movs r0, 0x1
	strb r0, [r4, 0xF]
	ldr r0, _080FE3CC @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r5, [r0]
	cmp r5, 0
	bne _080FE3D0
	adds r0, r6, 0
	bl sub_80FD850
	ldrb r0, [r4, 0x2]
	cmp r0, 0x1
	beq _080FE3E8
	bl sub_80FEAF4
	strb r5, [r4, 0xF]
	strb r7, [r4, 0xE]
	b _080FE40C
	.align 2, 0
_080FE3C8: .4byte gUnknown_3005E10
_080FE3CC: .4byte gUnknown_3007460
_080FE3D0:
	mov r0, sp
	bl rfu_UNI_PARENT_getDRAC_ACK
	lsls r0, 16
	cmp r0, 0
	bne _080FE3E8
	mov r1, sp
	ldrb r0, [r4, 0x3]
	ldrb r1, [r1]
	orrs r0, r1
	ldrb r1, [r4, 0x3]
	strb r0, [r4, 0x3]
_080FE3E8:
	ldr r4, _080FE414 @ =gUnknown_3005E10
	ldr r1, [r4, 0x44]
	cmp r1, 0
	beq _080FE404
	adds r0, r6, 0
	bl _call_via_r1
	bl rfu_waitREQComplete
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	bne _080FE404
	bl sub_80FEAF4
_080FE404:
	ldr r1, _080FE414 @ =gUnknown_3005E10
	movs r0, 0
	strb r0, [r1, 0xF]
	strb r7, [r1, 0xE]
_080FE40C:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE414: .4byte gUnknown_3005E10
	thumb_func_end sub_80FE394

	thumb_func_start sub_80FE418
sub_80FE418: @ 80FE418
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r1, _080FE49C @ =gUnknown_3005E10
	ldrb r0, [r1, 0x4]
	subs r0, 0x5
	lsls r0, 24
	lsrs r0, 24
	adds r3, r1, 0
	cmp r0, 0x3
	bls _080FE436
	b _080FE62A
_080FE436:
	ldr r0, _080FE4A0 @ =gUnknown_3007460
	ldr r2, [r0]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r3, 0xC]
	adds r4, r1, 0
	eors r4, r0
	ands r4, r1
	ldrb r0, [r2, 0x7]
	bics r4, r0
	mov r8, r4
	strb r1, [r3, 0xC]
	cmp r4, 0
	beq _080FE45E
	strh r4, [r3, 0x14]
	movs r0, 0x10
	movs r1, 0x1
	str r3, [sp, 0x4]
	bl sub_80FE7F0
	ldr r3, [sp, 0x4]
_080FE45E:
	movs r0, 0
	str r0, [sp]
	movs r6, 0
	adds r7, r3, 0
	movs r1, 0x24
	adds r1, r3
	mov r9, r1
_080FE46C:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r6
	lsrs r4, r0, 24
	movs r5, 0
	mov r0, r8
	ands r0, r4
	cmp r0, 0
	beq _080FE4BE
	lsls r1, r6, 1
	adds r0, r7, 0
	adds r0, 0x28
	adds r1, r0
	ldrh r0, [r7, 0x26]
	strh r0, [r1]
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	orrs r0, r1
	strb r0, [r2]
	adds r6, 0x1
	mov r10, r6
	b _080FE574
	.align 2, 0
_080FE49C: .4byte gUnknown_3005E10
_080FE4A0: .4byte gUnknown_3007460
_080FE4A4:
	ldrb r1, [r7]
	adds r0, r4, 0
	orrs r0, r1
	strb r0, [r7]
	ldrb r0, [r7, 0x1]
	adds r0, 0x1
	strb r0, [r7, 0x1]
	ldr r0, [sp]
	orrs r0, r4
	str r0, [sp]
	movs r0, 0x1
	orrs r5, r0
	b _080FE508
_080FE4BE:
	mov r1, r9
	ldrb r0, [r1]
	ands r0, r4
	adds r2, r6, 0x1
	mov r10, r2
	cmp r0, 0
	beq _080FE574
	ldr r0, _080FE518 @ =gUnknown_3007450
	lsls r1, r6, 2
	adds r1, r0
	ldr r1, [r1]
	ldrh r0, [r1, 0x34]
	cmp r0, 0x46
	bne _080FE524
	adds r0, r1, 0
	adds r0, 0x61
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FE53C
	movs r5, 0x2
	ldr r3, [r3, 0x20]
	ldrh r2, [r3]
	ldr r0, _080FE51C @ =0x0000ffff
	cmp r2, r0
	beq _080FE508
	ldr r0, _080FE520 @ =gUnknown_3007460
	ldr r0, [r0]
	lsls r1, r6, 5
	adds r0, r1
	ldrh r0, [r0, 0x18]
	ldr r1, _080FE51C @ =0x0000ffff
_080FE4FC:
	cmp r0, r2
	beq _080FE4A4
	adds r3, 0x2
	ldrh r2, [r3]
	cmp r2, r1
	bne _080FE4FC
_080FE508:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	bne _080FE53C
	movs r0, 0x4
	orrs r5, r0
	b _080FE53C
	.align 2, 0
_080FE518: .4byte gUnknown_3007450
_080FE51C: .4byte 0x0000ffff
_080FE520: .4byte gUnknown_3007460
_080FE524:
	lsls r1, r6, 1
	adds r0, r3, 0
	adds r0, 0x28
	adds r1, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldr r1, _080FE5F8 @ =0x0000ffff
	ands r0, r1
	cmp r0, 0
	bne _080FE53C
	movs r5, 0x6
_080FE53C:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080FE562
	mov r2, r9
	ldrb r0, [r2]
	bics r0, r4
	movs r2, 0
	mov r1, r9
	strb r0, [r1]
	lsls r0, r6, 1
	adds r1, r7, 0
	adds r1, 0x28
	adds r0, r1
	strh r2, [r0]
	movs r0, 0x8
	adds r1, r6, 0
	bl rfu_clearSlot
_080FE562:
	movs r0, 0x4
	ands r5, r0
	ldr r3, _080FE5FC @ =gUnknown_3005E10
	cmp r5, 0
	beq _080FE574
	ldrb r1, [r7, 0xD]
	adds r0, r4, 0
	orrs r0, r1
	strb r0, [r7, 0xD]
_080FE574:
	mov r2, r10
	lsls r0, r2, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _080FE580
	b _080FE46C
_080FE580:
	ldr r4, [sp]
	cmp r4, 0
	beq _080FE592
	ldr r0, _080FE5FC @ =gUnknown_3005E10
	strh r4, [r0, 0x14]
	movs r0, 0x11
	movs r1, 0x1
	bl sub_80FE7F0
_080FE592:
	ldr r1, _080FE5FC @ =gUnknown_3005E10
	ldrb r0, [r1, 0xD]
	cmp r0, 0
	beq _080FE5CE
	movs r5, 0x1
	ldr r0, _080FE600 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	beq _080FE5B2
	ldrb r0, [r1, 0x3]
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, r1
	beq _080FE5B2
	movs r5, 0
_080FE5B2:
	cmp r5, 0
	beq _080FE5CE
	ldr r4, _080FE5FC @ =gUnknown_3005E10
	ldrb r0, [r4, 0xD]
	bl sub_80FE818
	ldrb r0, [r4, 0xD]
	movs r1, 0
	strh r0, [r4, 0x14]
	strb r1, [r4, 0xD]
	movs r0, 0x12
	movs r1, 0x1
	bl sub_80FE7F0
_080FE5CE:
	ldr r0, _080FE5FC @ =gUnknown_3005E10
	adds r1, r0, 0
	adds r1, 0x24
	ldrb r1, [r1]
	adds r3, r0, 0
	cmp r1, 0
	bne _080FE62A
	ldrb r0, [r3, 0x4]
	cmp r0, 0x8
	bne _080FE62A
	ldrb r0, [r3, 0x7]
	cmp r0, 0
	bne _080FE604
	strb r0, [r3, 0x5]
	strb r0, [r3, 0x4]
	movs r0, 0x14
	movs r1, 0
	bl sub_80FE7F0
	b _080FE62A
	.align 2, 0
_080FE5F8: .4byte 0x0000ffff
_080FE5FC: .4byte gUnknown_3005E10
_080FE600: .4byte gUnknown_3007460
_080FE604:
	cmp r0, 0x2
	bne _080FE610
	movs r0, 0x3
	strb r0, [r3, 0x7]
	movs r0, 0x9
	b _080FE616
_080FE610:
	movs r0, 0x1
	strb r0, [r3, 0x7]
	movs r0, 0x5
_080FE616:
	strb r0, [r3, 0x4]
	ldrb r0, [r3]
	cmp r0, 0
	beq _080FE62A
	movs r0, 0
	strh r0, [r3, 0x1A]
	movs r0, 0x8
	strb r0, [r3, 0x7]
	movs r0, 0x5
	strb r0, [r3, 0x4]
_080FE62A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FE418

	thumb_func_start sub_80FE63C
sub_80FE63C: @ 80FE63C
	push {r4-r6,lr}
	ldr r1, _080FE6E0 @ =0x04000208
	ldrh r0, [r1]
	adds r6, r0, 0
	movs r0, 0
	strh r0, [r1]
	ldr r4, _080FE6E4 @ =gUnknown_3005E10
	ldrb r0, [r4, 0x4]
	cmp r0, 0xF
	bne _080FE6A0
	ldrb r1, [r4, 0x10]
	lsls r1, 1
	adds r5, r4, 0
	adds r5, 0x28
	adds r1, r5
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080FE676
	ldr r1, _080FE6E8 @ =gUnknown_3007450
	ldrb r0, [r4, 0x10]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x27
	bne _080FE6A0
_080FE676:
	bl sub_80FEB14
	movs r0, 0x18
	strb r0, [r4, 0x4]
	ldrb r1, [r4, 0x10]
	movs r0, 0x4
	bl rfu_clearSlot
	adds r2, r4, 0
	adds r2, 0x24
	movs r1, 0x1
	ldrb r0, [r4, 0x10]
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldrb r0, [r4, 0x10]
	lsls r0, 1
	adds r0, r5
	movs r1, 0
	strh r1, [r0]
_080FE6A0:
	ldr r0, _080FE6E0 @ =0x04000208
	strh r6, [r0]
	ldr r5, _080FE6E4 @ =gUnknown_3005E10
	ldrb r0, [r5, 0x4]
	cmp r0, 0x18
	bne _080FE6DA
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080FE6B6
	bl sub_80FEB14
_080FE6B6:
	ldrb r0, [r5, 0x2]
	adds r4, r0, 0
	cmp r4, 0
	bne _080FE6DA
	strb r4, [r5, 0x5]
	strb r4, [r5, 0x4]
	ldr r0, _080FE6EC @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	orrs r0, r1
	bl sub_80FE818
	strh r4, [r5, 0x14]
	movs r0, 0x25
	movs r1, 0x1
	bl sub_80FE7F0
_080FE6DA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FE6E0: .4byte 0x04000208
_080FE6E4: .4byte gUnknown_3005E10
_080FE6E8: .4byte gUnknown_3007450
_080FE6EC: .4byte gUnknown_3007460
	thumb_func_end sub_80FE63C

	thumb_func_start sub_80FE6F0
sub_80FE6F0: @ 80FE6F0
	push {r4,r5,lr}
	ldr r5, _080FE744 @ =gUnknown_3005E10
	ldrb r0, [r5, 0x4]
	cmp r0, 0xF
	bne _080FE73C
	ldr r1, _080FE748 @ =gUnknown_3007450
	ldrb r2, [r5, 0x10]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x26
	bne _080FE73C
	movs r4, 0
	strb r4, [r5, 0x5]
	strb r4, [r5, 0x4]
	movs r0, 0x4
	adds r1, r2, 0
	bl rfu_clearSlot
	adds r2, r5, 0
	adds r2, 0x24
	movs r1, 0x1
	ldrb r0, [r5, 0x10]
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldrb r0, [r5, 0x10]
	lsls r0, 1
	adds r1, r5, 0
	adds r1, 0x28
	adds r0, r1
	strh r4, [r0]
	movs r0, 0x24
	movs r1, 0
	bl sub_80FE7F0
_080FE73C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE744: .4byte gUnknown_3005E10
_080FE748: .4byte gUnknown_3007450
	thumb_func_end sub_80FE6F0

	thumb_func_start sub_80FE74C
sub_80FE74C: @ 80FE74C
	push {lr}
	ldr r1, _080FE774 @ =gUnknown_3005E10
	ldrb r0, [r1, 0x6]
	cmp r0, 0
	bne _080FE770
	ldrb r0, [r1, 0xA]
	cmp r0, 0x1
	bne _080FE770
	ldrb r0, [r1, 0x4]
	strb r0, [r1, 0x11]
	ldrb r0, [r1, 0x5]
	strb r0, [r1, 0x12]
	movs r0, 0x10
	strb r0, [r1, 0x4]
	movs r0, 0x11
	strb r0, [r1, 0x5]
	movs r0, 0x2
	strb r0, [r1, 0xA]
_080FE770:
	pop {r0}
	bx r0
	.align 2, 0
_080FE774: .4byte gUnknown_3005E10
	thumb_func_end sub_80FE74C

	thumb_func_start sub_80FE778
sub_80FE778: @ 80FE778
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	movs r5, 0
	ldr r1, _080FE7E4 @ =gUnknown_3007460
	ldr r0, [r1]
	ldrb r0, [r0, 0x8]
	cmp r6, r0
	bcs _080FE7D4
	mov r8, r0
	ldr r0, _080FE7E8 @ =gUnknown_3005E10
	mov r10, r0
	mov r9, r1
_080FE798:
	mov r1, r10
	ldr r3, [r1, 0x20]
	ldrh r2, [r3]
	adds r0, r5, 0x1
	mov r12, r0
	ldr r1, _080FE7EC @ =0x0000ffff
	cmp r2, r1
	beq _080FE7CA
	mov r1, r9
	ldr r0, [r1]
	lsls r1, r5, 5
	adds r0, r1
	ldrh r4, [r0, 0x18]
	ldr r7, _080FE7EC @ =0x0000ffff
	movs r1, 0x1
	lsls r1, r5
_080FE7B8:
	cmp r4, r2
	bne _080FE7C2
	orrs r6, r1
	lsls r0, r6, 24
	lsrs r6, r0, 24
_080FE7C2:
	adds r3, 0x2
	ldrh r2, [r3]
	cmp r2, r7
	bne _080FE7B8
_080FE7CA:
	mov r1, r12
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, r8
	bcc _080FE798
_080FE7D4:
	adds r0, r6, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FE7E4: .4byte gUnknown_3007460
_080FE7E8: .4byte gUnknown_3005E10
_080FE7EC: .4byte 0x0000ffff
	thumb_func_end sub_80FE778

	thumb_func_start sub_80FE7F0
sub_80FE7F0: @ 80FE7F0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r4, _080FE814 @ =gUnknown_3005E10
	ldr r2, [r4, 0x40]
	cmp r2, 0
	beq _080FE806
	bl _call_via_r2
_080FE806:
	movs r0, 0
	strh r0, [r4, 0x16]
	strh r0, [r4, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE814: .4byte gUnknown_3005E10
	thumb_func_end sub_80FE7F0

	thumb_func_start sub_80FE818
sub_80FE818: @ 80FE818
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080FE838 @ =gUnknown_3005E10
	ldrb r5, [r4, 0xE]
	movs r1, 0x1
	strb r1, [r4, 0xE]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	strb r5, [r4, 0xE]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE838: .4byte gUnknown_3005E10
	thumb_func_end sub_80FE818

	thumb_func_start sub_80FE83C
sub_80FE83C: @ 80FE83C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080FE908 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080FE884
	movs r4, 0
_080FE84E:
	ldr r1, _080FE90C @ =gUnknown_3007450
	lsls r0, r4, 2
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE87A
	ldrb r1, [r2, 0x1A]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE87A
	adds r2, r1, 0
	bics r2, r5
	movs r0, 0x20
	adds r1, r4, 0
	bl rfu_changeSendTarget
_080FE87A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080FE84E
_080FE884:
	ldr r0, _080FE908 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	beq _080FE8C2
	movs r4, 0
_080FE890:
	ldr r1, _080FE90C @ =gUnknown_3007450
	lsls r0, r4, 2
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2, 0x34]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE8B8
	adds r0, r2, 0
	adds r0, 0x4E
	ldrb r0, [r0]
	ands r0, r5
	cmp r0, 0
	beq _080FE8B8
	adds r0, r4, 0
	bl rfu_NI_stopReceivingData
_080FE8B8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080FE890
_080FE8C2:
	ldr r0, _080FE908 @ =gUnknown_3007460
	ldr r3, [r0]
	ldrb r2, [r3, 0x6]
	cmp r2, 0
	beq _080FE900
	mvns r1, r5
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3, 0x6]
	movs r4, 0
	ldr r7, _080FE910 @ =gUnknown_3007440
	ldr r6, _080FE914 @ =0x00008024
_080FE8DA:
	lsls r0, r4, 2
	adds r0, r7
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r0, r6
	bne _080FE8F6
	ldrb r3, [r2, 0x3]
	adds r0, r5, 0
	ands r0, r3
	cmp r0, 0
	beq _080FE8F6
	adds r0, r1, 0
	ands r0, r3
	strb r0, [r2, 0x3]
_080FE8F6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080FE8DA
_080FE900:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE908: .4byte gUnknown_3007460
_080FE90C: .4byte gUnknown_3007450
_080FE910: .4byte gUnknown_3007440
_080FE914: .4byte 0x00008024
	thumb_func_end sub_80FE83C

	thumb_func_start sub_80FE918
sub_80FE918: @ 80FE918
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080FEA04 @ =gUnknown_3005E10
	ldrh r0, [r0, 0x18]
	cmp r0, 0
	beq _080FE9F4
	ldr r0, _080FEA08 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080FE9B8
	movs r6, 0
_080FE938:
	ldr r3, _080FEA0C @ =gUnknown_3007450
	lsls r2, r6, 2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r4, 0x80
	lsls r4, 8
	adds r0, r4, 0
	ands r1, r0
	adds r7, r2, 0
	adds r0, r6, 0x1
	mov r9, r0
	cmp r1, 0
	beq _080FE9AE
	movs r5, 0
	movs r4, 0
	movs r1, 0x1
	mov r8, r1
	mov r10, r3
_080FE95E:
	adds r0, r7, r3
	ldr r0, [r0]
	ldrb r0, [r0, 0x1A]
	asrs r0, r4
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _080FE988
	lsls r0, r4, 2
	adds r0, r3
	ldr r0, [r0]
	ldr r1, _080FEA04 @ =gUnknown_3005E10
	ldrh r0, [r0, 0x2]
	ldrh r1, [r1, 0x18]
	cmp r0, r1
	bls _080FE988
	mov r0, r8
	lsls r0, r4
	orrs r5, r0
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080FE988:
	cmp r5, 0
	beq _080FE9A4
	mov r1, r10
	adds r0, r7, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1A]
	adds r2, r5, 0
	eors r2, r0
	movs r0, 0x20
	adds r1, r6, 0
	str r3, [sp]
	bl rfu_changeSendTarget
	ldr r3, [sp]
_080FE9A4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080FE95E
_080FE9AE:
	mov r3, r9
	lsls r0, r3, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _080FE938
_080FE9B8:
	ldr r0, _080FEA08 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	beq _080FE9F4
	movs r6, 0
_080FE9C4:
	ldr r1, _080FEA0C @ =gUnknown_3007450
	lsls r0, r6, 2
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2, 0x34]
	movs r4, 0x80
	lsls r4, 8
	adds r1, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE9EA
	ldr r1, _080FEA04 @ =gUnknown_3005E10
	ldrh r0, [r2, 0x36]
	ldrh r1, [r1, 0x18]
	cmp r0, r1
	bls _080FE9EA
	adds r0, r6, 0
	bl rfu_NI_stopReceivingData
_080FE9EA:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _080FE9C4
_080FE9F4:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FEA04: .4byte gUnknown_3005E10
_080FEA08: .4byte gUnknown_3007460
_080FEA0C: .4byte gUnknown_3007450
	thumb_func_end sub_80FE918

	thumb_func_start sub_80FEA10
sub_80FEA10: @ 80FEA10
	push {lr}
	ldr r1, _080FEA20 @ =gUnknown_3005E10
	str r0, [r1, 0x44]
	ldr r0, _080FEA24 @ =sub_80FE394
	bl rfu_setMSCCallback
	pop {r0}
	bx r0
	.align 2, 0
_080FEA20: .4byte gUnknown_3005E10
_080FEA24: .4byte sub_80FE394
	thumb_func_end sub_80FEA10

	thumb_func_start sub_80FEA28
sub_80FEA28: @ 80FEA28
	ldr r1, _080FEA30 @ =gUnknown_3005E10
	str r0, [r1, 0x40]
	bx lr
	.align 2, 0
_080FEA30: .4byte gUnknown_3005E10
	thumb_func_end sub_80FEA28

	thumb_func_start sub_80FEA34
sub_80FEA34: @ 80FEA34
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _080FEA58 @ =gUnknown_3005E10
	ldrb r1, [r0, 0x9]
	adds r3, r0, 0
	cmp r1, 0
	beq _080FEA5C
	cmp r4, 0
	bne _080FEA5C
	adds r0, 0x30
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FEA5C
	movs r0, 0x5
	b _080FEA6C
	.align 2, 0
_080FEA58: .4byte gUnknown_3005E10
_080FEA5C:
	ldr r2, _080FEA74 @ =0x04000208
	ldrh r1, [r2]
	movs r0, 0
	strh r0, [r2]
	strb r4, [r3, 0x9]
	strh r5, [r3, 0x32]
	strh r1, [r2]
	movs r0, 0
_080FEA6C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080FEA74: .4byte 0x04000208
	thumb_func_end sub_80FEA34

	thumb_func_start sub_80FEA78
sub_80FEA78: @ 80FEA78
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080FEA94 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r1, [r0, 0x4]
	ldrb r0, [r0, 0x5]
	orrs r0, r1
	cmp r0, 0
	bne _080FEA9C
	ldr r0, _080FEA98 @ =gUnknown_3005E10
	strh r2, [r0, 0x18]
	movs r0, 0
	b _080FEAAC
	.align 2, 0
_080FEA94: .4byte gUnknown_3007460
_080FEA98: .4byte gUnknown_3005E10
_080FEA9C:
	ldr r1, _080FEAB0 @ =gUnknown_3005E10
	movs r0, 0x6
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_80FE7F0
	movs r0, 0x6
_080FEAAC:
	pop {r1}
	bx r1
	.align 2, 0
_080FEAB0: .4byte gUnknown_3005E10
	thumb_func_end sub_80FEA78

	thumb_func_start sub_80FEAB4
sub_80FEAB4: @ 80FEAB4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	ldr r1, _080FEADC @ =gUnknown_3005E10
	ldrb r0, [r1, 0x4]
	subs r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _080FEAE0
	movs r0, 0x7
	strh r0, [r1, 0x14]
	movs r0, 0xF3
	movs r1, 0x1
	bl sub_80FE7F0
	movs r0, 0x7
	b _080FEAEE
	.align 2, 0
_080FEADC: .4byte gUnknown_3005E10
_080FEAE0:
	cmp r2, 0
	beq _080FEAEA
	movs r0, 0x1
	strb r0, [r1, 0xB]
	b _080FEAEC
_080FEAEA:
	strb r3, [r1, 0xB]
_080FEAEC:
	movs r0, 0
_080FEAEE:
	pop {r1}
	bx r1
	thumb_func_end sub_80FEAB4

	thumb_func_start sub_80FEAF4
sub_80FEAF4: @ 80FEAF4
	push {lr}
	ldr r1, _080FEB10 @ =gUnknown_3005E10
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _080FEB0C
	ldrb r0, [r1, 0x2]
	movs r0, 0
	strb r0, [r1, 0x2]
	movs r0, 0x45
	movs r1, 0
	bl sub_80FE7F0
_080FEB0C:
	pop {r0}
	bx r0
	.align 2, 0
_080FEB10: .4byte gUnknown_3005E10
	thumb_func_end sub_80FEAF4

	thumb_func_start sub_80FEB14
sub_80FEB14: @ 80FEB14
	push {lr}
	ldr r1, _080FEB28 @ =gUnknown_3005E10
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _080FEB2C
	movs r0, 0x45
	movs r1, 0
	bl sub_80FE7F0
	b _080FEB38
	.align 2, 0
_080FEB28: .4byte gUnknown_3005E10
_080FEB2C:
	ldrb r0, [r1, 0x2]
	cmp r0, 0x1
	bne _080FEB38
	ldrb r0, [r1, 0x2]
	movs r0, 0x2
	strb r0, [r1, 0x2]
_080FEB38:
	pop {r0}
	bx r0
	thumb_func_end sub_80FEB14

	thumb_func_start sub_80FEB3C
sub_80FEB3C: @ 80FEB3C
	push {lr}
	ldr r0, _080FEB5C @ =gUnknown_3005E10
	ldrb r1, [r0, 0x7]
	adds r2, r0, 0
	cmp r1, 0
	beq _080FEBA6
	ldrb r0, [r2, 0x4]
	subs r0, 0x5
	cmp r0, 0x6
	bhi _080FEBA6
	lsls r0, 2
	ldr r1, _080FEB60 @ =_080FEB64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FEB5C: .4byte gUnknown_3005E10
_080FEB60: .4byte _080FEB64
	.align 2, 0
_080FEB64:
	.4byte _080FEB80
	.4byte _080FEB88
	.4byte _080FEB92
	.4byte _080FEB92
	.4byte _080FEB98
	.4byte _080FEB98
	.4byte _080FEB9E
_080FEB80:
	movs r0, 0x3
	strb r0, [r2, 0x7]
	movs r0, 0x9
	b _080FEBA4
_080FEB88:
	movs r0, 0x2
	strb r0, [r2, 0x7]
	movs r0, 0x1
	strh r0, [r2, 0x1A]
	b _080FEBA6
_080FEB92:
	movs r0, 0x2
	strb r0, [r2, 0x7]
	b _080FEBA6
_080FEB98:
	movs r0, 0x28
	strh r0, [r2, 0x1A]
	b _080FEBA6
_080FEB9E:
	movs r0, 0x28
	strh r0, [r2, 0x1A]
	movs r0, 0xA
_080FEBA4:
	strb r0, [r2, 0x4]
_080FEBA6:
	pop {r0}
	bx r0
	thumb_func_end sub_80FEB3C

	thumb_func_start sub_80FEBAC
sub_80FEBAC: @ 80FEBAC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	bl ResetTasks
	ldr r0, _080FEC00 @ =sub_80FEC54
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080FEC04 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0xA]
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r6, 0
	bl SetWordTaskArg
	adds r0, r4, 0
	movs r1, 0x4
	mov r2, r8
	bl SetWordTaskArg
	ldr r0, _080FEC08 @ =sub_80FEC0C
	bl SetMainCallback2
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FEC00: .4byte sub_80FEC54
_080FEC04: .4byte gTasks
_080FEC08: .4byte sub_80FEC0C
	thumb_func_end sub_80FEBAC

	thumb_func_start sub_80FEC0C
sub_80FEC0C: @ 80FEC0C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80FEC0C

	thumb_func_start sub_80FEC24
sub_80FEC24: @ 80FEC24
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	thumb_func_end sub_80FEC24

	thumb_func_start sub_80FEC38
sub_80FEC38: @ 80FEC38
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080FEC50 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	str r1, [r2]
	movs r0, 0
	strh r0, [r2, 0x8]
	bx lr
	.align 2, 0
_080FEC50: .4byte gTasks
	thumb_func_end sub_80FEC38

	thumb_func_start sub_80FEC54
sub_80FEC54: @ 80FEC54
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsUpdateLinkStateCBActive
	cmp r0, 0
	bne _080FEC70
_080FEC62:
	adds r0, r4, 0
	bl sub_80FED80
	lsls r0, 24
	cmp r0, 0
	bne _080FEC62
	b _080FEC7E
_080FEC70:
	adds r0, r4, 0
	bl sub_80FED80
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080FEC86
_080FEC7E:
	ldr r1, _080FEC8C @ =sub_80FEC90
	adds r0, r4, 0
	bl sub_80FEC38
_080FEC86:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEC8C: .4byte sub_80FEC90
	thumb_func_end sub_80FEC54

	thumb_func_start sub_80FEC90
sub_80FEC90: @ 80FEC90
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080FECB4 @ =gTasks+0x8
	adds r6, r0, r1
	movs r0, 0
	ldrsh r5, [r6, r0]
	cmp r5, 0x1
	beq _080FECEC
	cmp r5, 0x1
	bgt _080FECB8
	cmp r5, 0
	beq _080FECC2
	b _080FED6E
	.align 2, 0
_080FECB4: .4byte gTasks+0x8
_080FECB8:
	cmp r5, 0x2
	beq _080FED28
	cmp r5, 0x3
	beq _080FED38
	b _080FED6E
_080FECC2:
	ldr r0, _080FECE8 @ =sub_80FEC24
	bl SetVBlankCallback
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	adds r1, r4, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080FED20
	.align 2, 0
_080FECE8: .4byte sub_80FEC24
_080FECEC:
	bl sub_80FF028
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x17
	bne _080FED10
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x3
	strh r0, [r6]
	b _080FED6E
_080FED10:
	cmp r4, 0
	beq _080FED6E
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_8100134
_080FED20:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _080FED6E
_080FED28:
	bl sub_810014C
	lsls r0, 24
	cmp r0, 0
	bne _080FED6E
	movs r0, 0x1
	strh r0, [r6]
	b _080FED6E
_080FED38:
	ldr r0, _080FED78 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080FED6E
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0xE
	bne _080FED50
	bl sub_80FEF4C
_080FED50:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080FED62
	ldr r0, _080FED7C @ =0x0000082d
	bl FlagSet
	bl sub_80FEF2C
_080FED62:
	adds r0, r4, 0
	movs r1, 0x4
	bl GetWordTaskArg
	bl sub_80FEE24
_080FED6E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FED78: .4byte gPaletteFade
_080FED7C: .4byte 0x0000082d
	thumb_func_end sub_80FEC90

	thumb_func_start sub_80FED80
sub_80FED80: @ 80FED80
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080FEDA4 @ =gTasks+0x8
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x4
	bhi _080FEE12
	lsls r0, 2
	ldr r1, _080FEDA8 @ =_080FEDAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FEDA4: .4byte gTasks+0x8
_080FEDA8: .4byte _080FEDAC
	.align 2, 0
_080FEDAC:
	.4byte _080FEDC0
	.4byte _080FEDD4
	.4byte _080FEDDA
	.4byte _080FEDEE
	.4byte _080FEE06
_080FEDC0:
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	b _080FEE16
_080FEDD4:
	bl sub_80BDE44
	b _080FEDF2
_080FEDDA:
	ldrb r4, [r6, 0x2]
	adds r0, r5, 0
	movs r1, 0x2
	bl GetWordTaskArg
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_80FEF6C
	b _080FEDF2
_080FEDEE:
	bl sub_80FFF80
_080FEDF2:
	lsls r0, 24
	cmp r0, 0
	bne _080FEE16
	adds r0, r5, 0
	movs r1, 0x4
	bl GetWordTaskArg
	bl sub_80FEE24
	b _080FEE16
_080FEE06:
	bl sub_80FFF98
	lsls r0, 24
	cmp r0, 0
	beq _080FEE16
	b _080FEE1C
_080FEE12:
	movs r0, 0
	b _080FEE1E
_080FEE16:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
_080FEE1C:
	movs r0, 0x1
_080FEE1E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80FED80

	thumb_func_start sub_80FEE24
sub_80FEE24: @ 80FEE24
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80BDE70
	bl sub_80FF010
	bl sub_810011C
	bl FreeAllWindowBuffers
	adds r0, r4, 0
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FEE24

	thumb_func_start sub_80FEE44
sub_80FEE44: @ 80FEE44
	push {lr}
	ldr r0, _080FEE58 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0xE
	bhi _080FEF12
	lsls r0, 2
	ldr r1, _080FEE5C @ =_080FEE60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FEE58: .4byte gSpecialVar_0x8004
_080FEE5C: .4byte _080FEE60
	.align 2, 0
_080FEE60:
	.4byte _080FEE9C
	.4byte _080FEEB0
	.4byte _080FEEC4
	.4byte _080FEED8
	.4byte _080FEEF4
	.4byte _080FEF12
	.4byte _080FEF12
	.4byte _080FEF12
	.4byte _080FEF12
	.4byte _080FEF12
	.4byte _080FEF12
	.4byte _080FEF12
	.4byte _080FEF12
	.4byte _080FEF12
	.4byte _080FEEEC
_080FEE9C:
	ldr r0, _080FEEA8 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r2, _080FEEAC @ =0x00002ca0
	adds r1, r0, r2
	b _080FEF08
	.align 2, 0
_080FEEA8: .4byte gSaveBlock1Ptr
_080FEEAC: .4byte 0x00002ca0
_080FEEB0:
	ldr r0, _080FEEBC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r2, _080FEEC0 @ =0x00002cac
	adds r1, r0, r2
	b _080FEF08
	.align 2, 0
_080FEEBC: .4byte gSaveBlock1Ptr
_080FEEC0: .4byte 0x00002cac
_080FEEC4:
	ldr r0, _080FEED0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r2, _080FEED4 @ =0x00002cb8
	adds r1, r0, r2
	b _080FEF08
	.align 2, 0
_080FEED0: .4byte gSaveBlock1Ptr
_080FEED4: .4byte 0x00002cb8
_080FEED8:
	ldr r0, _080FEEE4 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r2, _080FEEE8 @ =0x00002cc4
	adds r1, r0, r2
	b _080FEF08
	.align 2, 0
_080FEEE4: .4byte gSaveBlock1Ptr
_080FEEE8: .4byte 0x00002cc4
_080FEEEC:
	bl sub_8143DA8
	adds r1, r0, 0
	b _080FEF08
_080FEEF4:
	ldr r2, _080FEF18 @ =gSaveBlock1Ptr
	ldr r0, _080FEF1C @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080FEF20 @ =0x00002cd0
	adds r0, r1
	ldr r1, [r2]
	adds r1, r0
_080FEF08:
	ldr r0, _080FEF24 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	ldr r2, _080FEF28 @ =sub_80568C4
	bl sub_80FEBAC
_080FEF12:
	pop {r0}
	bx r0
	.align 2, 0
_080FEF18: .4byte gSaveBlock1Ptr
_080FEF1C: .4byte gSpecialVar_0x8005
_080FEF20: .4byte 0x00002cd0
_080FEF24: .4byte gSpecialVar_0x8004
_080FEF28: .4byte sub_80568C4
	thumb_func_end sub_80FEE44

	thumb_func_start sub_80FEF2C
sub_80FEF2C: @ 80FEF2C
	push {r4,lr}
	ldr r4, _080FEF44 @ =gSpecialVar_0x8004
	ldr r0, _080FEF48 @ =gUnknown_843F29C
	movs r1, 0x4
	bl sub_80FFEDC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEF44: .4byte gSpecialVar_0x8004
_080FEF48: .4byte gUnknown_843F29C
	thumb_func_end sub_80FEF2C

	thumb_func_start sub_80FEF4C
sub_80FEF4C: @ 80FEF4C
	push {r4,lr}
	ldr r4, _080FEF64 @ =gSpecialVar_0x8004
	ldr r0, _080FEF68 @ =gUnknown_843F2A4
	movs r1, 0x4
	bl sub_80FFEDC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEF64: .4byte gSpecialVar_0x8004
_080FEF68: .4byte gUnknown_843F2A4
	thumb_func_end sub_80FEF4C

	thumb_func_start sub_80FEF6C
sub_80FEF6C: @ 80FEF6C
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080FEF88 @ =gUnknown_203ACE8
	movs r0, 0x2C
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	bne _080FEF8C
	movs r0, 0
	b _080FF006
	.align 2, 0
_080FEF88: .4byte gUnknown_203ACE8
_080FEF8C:
	movs r1, 0
	strb r5, [r0]
	ldr r0, [r4]
	str r6, [r0, 0x14]
	strb r1, [r0, 0x4]
	ldr r0, [r4]
	strb r1, [r0, 0x5]
	ldr r0, [r4]
	strb r1, [r0, 0x6]
	ldr r0, [r4]
	strb r1, [r0, 0x9]
	adds r0, r5, 0
	bl sub_80FFF1C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [r4]
	ldr r2, _080FF00C @ =gUnknown_843F2AC
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r2, [r1, 0x1]
	strb r2, [r3, 0x2]
	ldr r2, [r4]
	ldrb r1, [r1, 0x2]
	strb r1, [r2, 0x3]
	ldr r1, [r4]
	ldrb r3, [r1, 0x2]
	ldrb r2, [r1, 0x3]
	adds r5, r3, 0
	muls r5, r2
	adds r2, r5, 0
	strb r2, [r1, 0x7]
	ldr r1, [r4]
	strb r0, [r1, 0x1]
	ldr r1, [r4]
	ldrb r0, [r1, 0x7]
	cmp r0, 0x9
	bls _080FEFE0
	movs r0, 0x9
	strb r0, [r1, 0x7]
_080FEFE0:
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x18
	ldrb r2, [r0, 0x7]
	adds r0, r6, 0
	bl CpuSet
	bl sub_80BDF38
	ldr r2, [r4]
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0x1
	strb r0, [r2, 0xD]
	movs r0, 0x1
_080FF006:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080FF00C: .4byte gUnknown_843F2AC
	thumb_func_end sub_80FEF6C

	thumb_func_start sub_80FF010
sub_80FF010: @ 80FF010
	push {lr}
	ldr r0, _080FF024 @ =gUnknown_203ACE8
	ldr r0, [r0]
	cmp r0, 0
	beq _080FF01E
	bl Free
_080FF01E:
	pop {r0}
	bx r0
	.align 2, 0
_080FF024: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF010

	thumb_func_start sub_80FF028
sub_80FF028: @ 80FF028
	push {lr}
	ldr r0, _080FF040 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r0, 0x6
	bhi _080FF092
	lsls r0, 2
	ldr r1, _080FF044 @ =_080FF048
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FF040: .4byte gUnknown_203ACE8
_080FF044: .4byte _080FF048
	.align 2, 0
_080FF048:
	.4byte _080FF064
	.4byte _080FF06A
	.4byte _080FF070
	.4byte _080FF076
	.4byte _080FF07C
	.4byte _080FF082
	.4byte _080FF088
_080FF064:
	bl sub_80FF098
	b _080FF08C
_080FF06A:
	bl sub_80FF20C
	b _080FF08C
_080FF070:
	bl sub_80FF360
	b _080FF08C
_080FF076:
	bl sub_80FF41C
	b _080FF08C
_080FF07C:
	bl sub_80FF4A8
	b _080FF08C
_080FF082:
	bl sub_80FF544
	b _080FF08C
_080FF088:
	bl sub_80FF4F0
_080FF08C:
	lsls r0, 16
	lsrs r0, 16
	b _080FF094
_080FF092:
	movs r0, 0
_080FF094:
	pop {r1}
	bx r1
	thumb_func_end sub_80FF028

	thumb_func_start sub_80FF098
sub_80FF098: @ 80FF098
	push {r4-r7,lr}
	ldr r0, _080FF0C0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FF0E4
	ldr r1, _080FF0C4 @ =gUnknown_203ACE8
	ldr r3, [r1]
	movs r2, 0
	movs r0, 0x2
	strb r0, [r3, 0x4]
	ldr r0, [r1]
	strb r2, [r0, 0xA]
	ldr r0, [r1]
	strb r2, [r0, 0xB]
	ldr r0, [r1]
	strb r2, [r0, 0xC]
	movs r0, 0x9
	b _080FF1FC
	.align 2, 0
_080FF0C0: .4byte gMain
_080FF0C4: .4byte gUnknown_203ACE8
_080FF0C8:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _080FF194
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080FF184
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080FF174
	movs r0, 0
	b _080FF1FC
_080FF0E4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080FF1A4
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _080FF1AA
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080FF0C8
	ldr r2, _080FF16C @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0x6]
	subs r0, 0x1
_080FF104:
	strb r0, [r1, 0x6]
_080FF106:
	adds r7, r2, 0
	adds r4, r7, 0
	ldr r2, [r4]
	movs r0, 0x6
	ldrsb r0, [r2, r0]
	ldr r6, _080FF170 @ =gUnknown_843F2AC
	cmp r0, 0
	bge _080FF124
	ldrb r0, [r2, 0x1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x2]
	strb r0, [r2, 0x6]
_080FF124:
	ldr r3, [r4]
	movs r2, 0x6
	ldrsb r2, [r3, r2]
	adds r5, r6, 0
	ldrb r1, [r3, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0, 0x2]
	cmp r2, r0
	ble _080FF140
	movs r0, 0
	strb r0, [r3, 0x6]
_080FF140:
	ldr r3, [r4]
	movs r2, 0x6
	ldrsb r2, [r3, r2]
	ldrb r1, [r3, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r5
	ldrb r0, [r1, 0x2]
	cmp r2, r0
	bne _080FF1B4
	movs r0, 0x5
	ldrsb r0, [r3, r0]
	cmp r0, 0x2
	ble _080FF162
	movs r0, 0x2
	strb r0, [r3, 0x5]
_080FF162:
	ldr r1, [r4]
	movs r0, 0x1
	strb r0, [r1, 0x4]
	movs r0, 0x3
	b _080FF1FC
	.align 2, 0
_080FF16C: .4byte gUnknown_203ACE8
_080FF170: .4byte gUnknown_843F2AC
_080FF174:
	ldr r2, _080FF180 @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
	b _080FF106
	.align 2, 0
_080FF180: .4byte gUnknown_203ACE8
_080FF184:
	ldr r2, _080FF190 @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0x6]
	adds r0, 0x1
	b _080FF104
	.align 2, 0
_080FF190: .4byte gUnknown_203ACE8
_080FF194:
	ldr r2, _080FF1A0 @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0x5]
	subs r0, 0x1
	strb r0, [r1, 0x5]
	b _080FF106
	.align 2, 0
_080FF1A0: .4byte gUnknown_203ACE8
_080FF1A4:
	bl sub_80FF590
	b _080FF1AE
_080FF1AA:
	bl sub_80FF5C0
_080FF1AE:
	lsls r0, 16
	lsrs r0, 16
	b _080FF1FC
_080FF1B4:
	movs r0, 0x5
	ldrsb r0, [r3, r0]
	cmp r0, 0
	bge _080FF1C2
	ldrb r0, [r1, 0x1]
	subs r0, 0x1
	strb r0, [r3, 0x5]
_080FF1C2:
	ldr r3, [r4]
	movs r2, 0x5
	ldrsb r2, [r3, r2]
	ldrb r1, [r3, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x1]
	cmp r2, r0
	blt _080FF1DC
	movs r0, 0
	strb r0, [r3, 0x5]
_080FF1DC:
	bl sub_80FFCE0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080FF1FA
	ldr r2, [r7]
	ldr r0, [r2, 0x4]
	ldr r1, _080FF204 @ =0x00ffff00
	ands r0, r1
	ldr r1, _080FF208 @ =0x00040100
	cmp r0, r1
	bne _080FF1FA
	movs r0, 0
	strb r0, [r2, 0x5]
_080FF1FA:
	movs r0, 0x2
_080FF1FC:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FF204: .4byte 0x00ffff00
_080FF208: .4byte 0x00040100
	thumb_func_end sub_80FF098

	thumb_func_start sub_80FF20C
sub_80FF20C: @ 80FF20C
	push {r4-r6,lr}
	ldr r2, _080FF22C @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FF270
	ldr r0, _080FF230 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _080FF26A
	b _080FF254
	.align 2, 0
_080FF22C: .4byte gMain
_080FF230: .4byte gUnknown_203ACE8
_080FF234:
	movs r0, 0x20
	ands r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _080FF2F8
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	bne _080FF2E8
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _080FF2D8
	movs r0, 0
	b _080FF34E
_080FF254:
	cmp r0, 0x1
	bgt _080FF25E
	cmp r0, 0
	beq _080FF264
	b _080FF270
_080FF25E:
	cmp r0, 0x2
	beq _080FF30E
	b _080FF270
_080FF264:
	bl sub_80FF5A8
	b _080FF312
_080FF26A:
	bl sub_80FF590
	b _080FF312
_080FF270:
	ldrh r2, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	bne _080FF308
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	bne _080FF30E
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _080FF234
	ldr r2, _080FF2D0 @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0x6]
	subs r0, 0x1
	strb r0, [r1, 0x6]
_080FF294:
	adds r6, r2, 0
_080FF296:
	adds r5, r6, 0
	ldr r4, [r5]
	movs r3, 0x6
	ldrsb r3, [r4, r3]
	ldr r2, _080FF2D4 @ =gUnknown_843F2AC
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	ldrb r0, [r1, 0x2]
	cmp r3, r0
	bne _080FF318
	movs r0, 0x5
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bge _080FF2BC
	movs r0, 0x2
	strb r0, [r4, 0x5]
_080FF2BC:
	ldr r1, [r5]
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	ble _080FF2CA
	movs r0, 0
	strb r0, [r1, 0x5]
_080FF2CA:
	movs r0, 0x3
	b _080FF34E
	.align 2, 0
_080FF2D0: .4byte gUnknown_203ACE8
_080FF2D4: .4byte gUnknown_843F2AC
_080FF2D8:
	ldr r2, _080FF2E4 @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
	b _080FF294
	.align 2, 0
_080FF2E4: .4byte gUnknown_203ACE8
_080FF2E8:
	ldr r1, _080FF2F4 @ =gUnknown_203ACE8
	ldr r0, [r1]
	strb r3, [r0, 0x6]
	adds r6, r1, 0
	b _080FF296
	.align 2, 0
_080FF2F4: .4byte gUnknown_203ACE8
_080FF2F8:
	ldr r2, _080FF304 @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0x5]
	subs r0, 0x1
	strb r0, [r1, 0x5]
	b _080FF294
	.align 2, 0
_080FF304: .4byte gUnknown_203ACE8
_080FF308:
	bl sub_80FF590
	b _080FF312
_080FF30E:
	bl sub_80FF5C0
_080FF312:
	lsls r0, 16
	lsrs r0, 16
	b _080FF34E
_080FF318:
	movs r0, 0x5
	ldrsb r0, [r4, r0]
	ldrb r1, [r1, 0x1]
	cmp r0, r1
	blt _080FF326
	subs r0, r1, 0x1
	strb r0, [r4, 0x5]
_080FF326:
	bl sub_80FFCE0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080FF344
	ldr r2, [r6]
	ldr r0, [r2, 0x4]
	ldr r1, _080FF354 @ =0x00ffff00
	ands r0, r1
	ldr r1, _080FF358 @ =0x00040100
	cmp r0, r1
	bne _080FF344
	movs r0, 0
	strb r0, [r2, 0x5]
_080FF344:
	ldr r0, _080FF35C @ =gUnknown_203ACE8
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x4]
	movs r0, 0x2
_080FF34E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080FF354: .4byte 0x00ffff00
_080FF358: .4byte 0x00040100
_080FF35C: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF20C

	thumb_func_start sub_80FF360
sub_80FF360: @ 80FF360
	push {lr}
	ldr r1, _080FF378 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r2
	adds r3, r1, 0
	cmp r0, 0
	beq _080FF37C
	bl sub_80FF678
	b _080FF412
	.align 2, 0
_080FF378: .4byte gMain
_080FF37C:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080FF3CA
	ldr r0, _080FF39C @ =gUnknown_203ACE8
	ldr r2, [r0]
	movs r1, 0xA
	ldrsb r1, [r2, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080FF3A0
	bl sub_80FF5FC
	b _080FF412
	.align 2, 0
_080FF39C: .4byte gUnknown_203ACE8
_080FF3A0:
	movs r0, 0xB
	ldrsb r0, [r2, r0]
	cmp r0, 0x1
	beq _080FF3BE
	cmp r0, 0x1
	bgt _080FF3B2
	cmp r0, 0
	beq _080FF3B8
	b _080FF3CA
_080FF3B2:
	cmp r0, 0x2
	beq _080FF3C4
	b _080FF3CA
_080FF3B8:
	bl sub_80FF688
	b _080FF412
_080FF3BE:
	bl sub_80FF6B4
	b _080FF412
_080FF3C4:
	bl sub_80FF678
	b _080FF412
_080FF3CA:
	ldrh r1, [r3, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080FF3DA
	bl sub_80FF688
	b _080FF412
_080FF3DA:
	ldrh r1, [r3, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080FF3E8
	movs r0, 0x2
	b _080FF40E
_080FF3E8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080FF3F4
	movs r0, 0x3
	b _080FF40E
_080FF3F4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080FF400
	movs r0, 0x1
	b _080FF40E
_080FF400:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080FF40C
	movs r0, 0
	b _080FF416
_080FF40C:
	movs r0, 0
_080FF40E:
	bl sub_80FF7CC
_080FF412:
	lsls r0, 16
	lsrs r0, 16
_080FF416:
	pop {r1}
	bx r1
	thumb_func_end sub_80FF360

	thumb_func_start sub_80FF41C
sub_80FF41C: @ 80FF41C
	push {lr}
	ldr r2, _080FF438 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080FF440
	ldr r0, _080FF43C @ =gUnknown_203ACE8
	ldr r1, [r0]
	movs r0, 0x2
	strb r0, [r1, 0x4]
	movs r0, 0xD
	b _080FF4A2
	.align 2, 0
_080FF438: .4byte gMain
_080FF43C: .4byte gUnknown_203ACE8
_080FF440:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FF44E
	bl sub_80FF6C8
	b _080FF49E
_080FF44E:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080FF45A
	movs r0, 0x4
	b _080FF49A
_080FF45A:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080FF466
	movs r0, 0x5
	b _080FF49A
_080FF466:
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080FF474
	movs r0, 0x2
	b _080FF49A
_080FF474:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080FF480
	movs r0, 0x3
	b _080FF49A
_080FF480:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080FF48C
	movs r0, 0x1
	b _080FF49A
_080FF48C:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080FF498
	movs r0, 0
	b _080FF4A2
_080FF498:
	movs r0, 0
_080FF49A:
	bl sub_80FFA38
_080FF49E:
	lsls r0, 16
	lsrs r0, 16
_080FF4A2:
	pop {r1}
	bx r1
	thumb_func_end sub_80FF41C

	thumb_func_start sub_80FF4A8
sub_80FF4A8: @ 80FF4A8
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080FF4DC
	cmp r1, 0
	bgt _080FF4C4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080FF4C8
	b _080FF4E8
_080FF4C4:
	cmp r1, 0x1
	bne _080FF4E8
_080FF4C8:
	bl sub_80FF5F0
	ldr r1, _080FF4D8 @ =gUnknown_203ACE8
	ldr r1, [r1]
	strb r0, [r1, 0x4]
	movs r0, 0x7
	b _080FF4EA
	.align 2, 0
_080FF4D8: .4byte gUnknown_203ACE8
_080FF4DC:
	ldr r0, _080FF4E4 @ =gSpecialVar_Result
	strh r1, [r0]
	movs r0, 0x17
	b _080FF4EA
	.align 2, 0
_080FF4E4: .4byte gSpecialVar_Result
_080FF4E8:
	movs r0, 0
_080FF4EA:
	pop {r1}
	bx r1
	thumb_func_end sub_80FF4A8

	thumb_func_start sub_80FF4F0
sub_80FF4F0: @ 80FF4F0
	push {r4,lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080FF524
	cmp r1, 0
	bgt _080FF50C
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080FF510
	b _080FF53C
_080FF50C:
	cmp r1, 0x1
	bne _080FF53C
_080FF510:
	bl sub_80FF5F0
	ldr r1, _080FF520 @ =gUnknown_203ACE8
	ldr r1, [r1]
	strb r0, [r1, 0x4]
	movs r0, 0x7
	b _080FF53E
	.align 2, 0
_080FF520: .4byte gUnknown_203ACE8
_080FF524:
	ldr r4, _080FF538 @ =gSpecialVar_Result
	bl sub_80FF78C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	bl sub_80FF6F0
	movs r0, 0x17
	b _080FF53E
	.align 2, 0
_080FF538: .4byte gSpecialVar_Result
_080FF53C:
	movs r0, 0
_080FF53E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FF4F0

	thumb_func_start sub_80FF544
sub_80FF544: @ 80FF544
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080FF574
	cmp r1, 0
	bgt _080FF560
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080FF564
	b _080FF588
_080FF560:
	cmp r1, 0x1
	bne _080FF588
_080FF564:
	ldr r0, _080FF570 @ =gUnknown_203ACE8
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1, 0x4]
	movs r0, 0x7
	b _080FF58A
	.align 2, 0
_080FF570: .4byte gUnknown_203ACE8
_080FF574:
	bl sub_80FF728
	ldr r0, _080FF584 @ =gUnknown_203ACE8
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1, 0x4]
	movs r0, 0x8
	b _080FF58A
	.align 2, 0
_080FF584: .4byte gUnknown_203ACE8
_080FF588:
	movs r0, 0
_080FF58A:
	pop {r1}
	bx r1
	thumb_func_end sub_80FF544

	thumb_func_start sub_80FF590
sub_80FF590: @ 80FF590
	ldr r2, _080FF5A4 @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0x4]
	strb r0, [r1, 0x8]
	ldr r1, [r2]
	movs r0, 0x4
	strb r0, [r1, 0x4]
	movs r0, 0x5
	bx lr
	.align 2, 0
_080FF5A4: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF590

	thumb_func_start sub_80FF5A8
sub_80FF5A8: @ 80FF5A8
	ldr r2, _080FF5BC @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0x4]
	strb r0, [r1, 0x8]
	ldr r1, [r2]
	movs r0, 0x5
	strb r0, [r1, 0x4]
	movs r0, 0x4
	bx lr
	.align 2, 0
_080FF5BC: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF5A8

	thumb_func_start sub_80FF5C0
sub_80FF5C0: @ 80FF5C0
	push {r4,lr}
	ldr r4, _080FF5DC @ =gUnknown_203ACE8
	ldr r0, [r4]
	ldrb r1, [r0, 0x4]
	strb r1, [r0, 0x8]
	bl sub_80FFF48
	cmp r0, 0
	bne _080FF5E0
	ldr r1, [r4]
	movs r0, 0x6
	strb r0, [r1, 0x4]
	b _080FF5E8
	.align 2, 0
_080FF5DC: .4byte gUnknown_203ACE8
_080FF5E0:
	ldr r1, [r4]
	movs r0, 0x4
	strb r0, [r1, 0x4]
	movs r0, 0x5
_080FF5E8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FF5C0

	thumb_func_start sub_80FF5F0
sub_80FF5F0: @ 80FF5F0
	ldr r0, _080FF5F8 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	bx lr
	.align 2, 0
_080FF5F8: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF5F0

	thumb_func_start sub_80FF5FC
sub_80FF5FC: @ 80FF5FC
	push {lr}
	ldr r0, _080FF624 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	bne _080FF628
	bl sub_80FFB8C
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BDF44
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_80BE16C
	b _080FF638
	.align 2, 0
_080FF624: .4byte gUnknown_203ACE8
_080FF628:
	bl sub_80FFBAC
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1
	bl sub_80BE16C
_080FF638:
	bl sub_80BE1D4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080FF670
	ldr r2, _080FF66C @ =gUnknown_203ACE8
	ldr r3, [r2]
	subs r0, 0x1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	movs r1, 0
	strb r0, [r3, 0xF]
	ldr r0, [r2]
	strb r1, [r0, 0xE]
	ldr r0, [r2]
	strb r1, [r0, 0x10]
	ldr r0, [r2]
	strb r1, [r0, 0x11]
	ldr r1, [r2]
	movs r0, 0x3
	strb r0, [r1, 0x4]
	movs r0, 0xB
	b _080FF672
	.align 2, 0
_080FF66C: .4byte gUnknown_203ACE8
_080FF670:
	movs r0, 0
_080FF672:
	pop {r1}
	bx r1
	thumb_func_end sub_80FF5FC

	thumb_func_start sub_80FF678
sub_80FF678: @ 80FF678
	ldr r0, _080FF684 @ =gUnknown_203ACE8
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x4]
	movs r0, 0xA
	bx lr
	.align 2, 0
_080FF684: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF678

	thumb_func_start sub_80FF688
sub_80FF688: @ 80FF688
	push {lr}
	ldr r1, _080FF6A8 @ =gUnknown_203ACE8
	ldr r0, [r1]
	movs r2, 0
	strb r2, [r0, 0xA]
	ldr r0, [r1]
	strb r2, [r0, 0xB]
	ldr r0, [r1]
	strb r2, [r0, 0xC]
	ldr r1, [r1]
	ldrb r0, [r1, 0x9]
	cmp r0, 0
	bne _080FF6AC
	movs r0, 0x1
	strb r0, [r1, 0x9]
	b _080FF6AE
	.align 2, 0
_080FF6A8: .4byte gUnknown_203ACE8
_080FF6AC:
	strb r2, [r1, 0x9]
_080FF6AE:
	movs r0, 0x16
	pop {r1}
	bx r1
	thumb_func_end sub_80FF688

	thumb_func_start sub_80FF6B4
sub_80FF6B4: @ 80FF6B4
	push {lr}
	ldr r0, _080FF6C4 @ =0x0000ffff
	bl sub_80FF768
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080FF6C4: .4byte 0x0000ffff
	thumb_func_end sub_80FF6B4

	thumb_func_start sub_80FF6C8
sub_80FF6C8: @ 80FF6C8
	push {lr}
	bl sub_80FFBE4
	lsls r0, 16
	lsrs r0, 16
	bl sub_80BE19C
	lsls r0, 16
	lsrs r0, 16
	bl sub_80FF768
	ldr r0, _080FF6EC @ =gUnknown_203ACE8
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x4]
	movs r0, 0xC
	pop {r1}
	bx r1
	.align 2, 0
_080FF6EC: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF6C8

	thumb_func_start sub_80FF6F0
sub_80FF6F0: @ 80FF6F0
	push {r4,r5,lr}
	movs r4, 0
	ldr r3, _080FF724 @ =gUnknown_203ACE8
	ldr r0, [r3]
	ldrb r0, [r0, 0x7]
	cmp r4, r0
	bcs _080FF71E
	adds r5, r3, 0
_080FF700:
	ldr r3, [r5]
	ldr r1, [r3, 0x14]
	lsls r2, r4, 1
	adds r1, r2, r1
	adds r0, r3, 0
	adds r0, 0x18
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r3, [r3, 0x7]
	cmp r4, r3
	bcc _080FF700
_080FF71E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF724: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF6F0

	thumb_func_start sub_80FF728
sub_80FF728: @ 80FF728
	push {r4,r5,lr}
	movs r3, 0
	ldr r2, _080FF760 @ =gUnknown_203ACE8
	ldr r0, [r2]
	ldrb r0, [r0, 0x7]
	cmp r3, r0
	bcs _080FF758
	adds r5, r2, 0
	ldr r0, _080FF764 @ =0x0000ffff
	adds r4, r0, 0
_080FF73C:
	ldr r2, [r5]
	lsls r0, r3, 1
	adds r1, r2, 0
	adds r1, 0x18
	adds r1, r0
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrb r2, [r2, 0x7]
	cmp r3, r2
	bcc _080FF73C
_080FF758:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF760: .4byte gUnknown_203ACE8
_080FF764: .4byte 0x0000ffff
	thumb_func_end sub_80FF728

	thumb_func_start sub_80FF768
sub_80FF768: @ 80FF768
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_80FFB6C
	lsls r0, 16
	ldr r1, _080FF788 @ =gUnknown_203ACE8
	ldr r1, [r1]
	lsrs r0, 15
	adds r1, 0x18
	adds r1, r0
	strh r4, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF788: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF768

	thumb_func_start sub_80FF78C
sub_80FF78C: @ 80FF78C
	push {r4,r5,lr}
	movs r2, 0
	ldr r0, _080FF7B4 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r1, [r0, 0x7]
	cmp r2, r1
	bcs _080FF7C2
	adds r5, r1, 0
	adds r4, r0, 0
	adds r4, 0x18
	ldr r3, [r0, 0x14]
_080FF7A2:
	lsls r0, r2, 1
	adds r1, r4, r0
	adds r0, r3
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	beq _080FF7B8
	movs r0, 0x1
	b _080FF7C4
	.align 2, 0
_080FF7B4: .4byte gUnknown_203ACE8
_080FF7B8:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r5
	bcc _080FF7A2
_080FF7C2:
	movs r0, 0
_080FF7C4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FF78C

	thumb_func_start sub_80FF7CC
sub_80FF7CC: @ 80FF7CC
	push {lr}
	adds r2, r0, 0
	ldr r0, _080FF7F0 @ =gUnknown_203ACE8
	ldr r3, [r0]
	movs r1, 0xA
	ldrsb r1, [r3, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080FF7FC
	ldrb r0, [r3, 0x9]
	cmp r0, 0
	bne _080FF7F4
	adds r0, r2, 0
	bl sub_80FF80C
	b _080FF802
	.align 2, 0
_080FF7F0: .4byte gUnknown_203ACE8
_080FF7F4:
	adds r0, r2, 0
	bl sub_80FF8D8
	b _080FF802
_080FF7FC:
	adds r0, r2, 0
	bl sub_80FF968
_080FF802:
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80FF7CC

	thumb_func_start sub_80FF80C
sub_80FF80C: @ 80FF80C
	push {r4,lr}
	cmp r0, 0x1
	beq _080FF882
	cmp r0, 0x1
	bcc _080FF8A2
	cmp r0, 0x2
	beq _080FF820
	cmp r0, 0x3
	beq _080FF848
	b _080FF8CE
_080FF820:
	ldr r0, _080FF83C @ =gUnknown_203ACE8
	ldr r1, [r0]
	movs r0, 0xB
	ldrsb r0, [r1, r0]
	ldrb r3, [r1, 0xC]
	cmn r0, r3
	beq _080FF8CE
	ldrb r2, [r1, 0xB]
	cmp r0, 0
	beq _080FF840
	subs r0, r2, 0x1
	strb r0, [r1, 0xB]
_080FF838:
	movs r0, 0xE
	b _080FF8D0
	.align 2, 0
_080FF83C: .4byte gUnknown_203ACE8
_080FF840:
	subs r0, r3, 0x1
	strb r0, [r1, 0xC]
	movs r0, 0x10
	b _080FF8D0
_080FF848:
	ldr r0, _080FF870 @ =gUnknown_203ACE8
	ldr r2, [r0]
	movs r1, 0xB
	ldrsb r1, [r2, r1]
	ldrb r3, [r2, 0xC]
	adds r1, r3
	ldrb r0, [r2, 0xD]
	subs r0, 0x1
	cmp r1, r0
	bge _080FF8CE
	ldrb r1, [r2, 0xB]
	movs r0, 0xB
	ldrsb r0, [r2, r0]
	cmp r0, 0x2
	bgt _080FF874
	adds r0, r1, 0x1
	strb r0, [r2, 0xB]
	movs r4, 0xE
	b _080FF87A
	.align 2, 0
_080FF870: .4byte gUnknown_203ACE8
_080FF874:
	adds r0, r3, 0x1
	strb r0, [r2, 0xC]
	movs r4, 0xF
_080FF87A:
	bl sub_80FFC1C
	adds r0, r4, 0
	b _080FF8D0
_080FF882:
	ldr r0, _080FF898 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r2, [r1, 0xA]
	movs r0, 0xA
	ldrsb r0, [r1, r0]
	cmp r0, 0
	beq _080FF89C
	subs r0, r2, 0x1
	strb r0, [r1, 0xA]
	b _080FF838
	.align 2, 0
_080FF898: .4byte gUnknown_203ACE8
_080FF89C:
	bl sub_80FF9E8
	b _080FF838
_080FF8A2:
	ldr r0, _080FF8C4 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r2, [r1, 0xA]
	movs r0, 0xA
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bgt _080FF8C8
	adds r0, r2, 0x1
	strb r0, [r1, 0xA]
	bl sub_80FFC6C
	lsls r0, 24
	cmp r0, 0
	beq _080FF838
	bl sub_80FF9E8
	b _080FF838
	.align 2, 0
_080FF8C4: .4byte gUnknown_203ACE8
_080FF8C8:
	bl sub_80FF9E8
	b _080FF838
_080FF8CE:
	movs r0, 0
_080FF8D0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FF80C

	thumb_func_start sub_80FF8D8
sub_80FF8D8: @ 80FF8D8
	push {lr}
	cmp r0, 0x1
	beq _080FF944
	cmp r0, 0x1
	bcc _080FF928
	cmp r0, 0x2
	beq _080FF8EE
	cmp r0, 0x3
	beq _080FF90E
	movs r0, 0
	b _080FF960
_080FF8EE:
	ldr r0, _080FF900 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r2, [r1, 0xB]
	movs r0, 0xB
	ldrsb r0, [r1, r0]
	cmp r0, 0
	ble _080FF904
	subs r0, r2, 0x1
	b _080FF906
	.align 2, 0
_080FF900: .4byte gUnknown_203ACE8
_080FF904:
	movs r0, 0x3
_080FF906:
	strb r0, [r1, 0xB]
	bl sub_80FFC1C
	b _080FF95E
_080FF90E:
	ldr r0, _080FF920 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r2, [r1, 0xB]
	movs r0, 0xB
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	bgt _080FF924
	adds r0, r2, 0x1
	b _080FF906
	.align 2, 0
_080FF920: .4byte gUnknown_203ACE8
_080FF924:
	movs r0, 0
	b _080FF906
_080FF928:
	ldr r0, _080FF940 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r0, [r1, 0xA]
	adds r0, 0x1
	strb r0, [r1, 0xA]
	bl sub_80FFC6C
	lsls r0, 24
	cmp r0, 0
	beq _080FF95E
	b _080FF95A
	.align 2, 0
_080FF940: .4byte gUnknown_203ACE8
_080FF944:
	ldr r2, _080FF964 @ =gUnknown_203ACE8
	ldr r1, [r2]
	ldrb r0, [r1, 0xA]
	subs r0, 0x1
	strb r0, [r1, 0xA]
	ldr r0, [r2]
	ldrb r0, [r0, 0xA]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080FF95E
_080FF95A:
	bl sub_80FF9E8
_080FF95E:
	movs r0, 0xE
_080FF960:
	pop {r1}
	bx r1
	.align 2, 0
_080FF964: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF8D8

	thumb_func_start sub_80FF968
sub_80FF968: @ 80FF968
	push {lr}
	adds r2, r0, 0
	cmp r2, 0x1
	beq _080FF9B8
	cmp r2, 0x1
	bcc _080FF9CC
	cmp r2, 0x2
	beq _080FF980
	cmp r2, 0x3
	beq _080FF99C
	movs r0, 0
	b _080FF9DE
_080FF980:
	ldr r0, _080FF994 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r3, [r1, 0xB]
	movs r0, 0xB
	ldrsb r0, [r1, r0]
	cmp r0, 0
	beq _080FF998
	subs r0, r3, 0x1
	b _080FF9DA
	.align 2, 0
_080FF994: .4byte gUnknown_203ACE8
_080FF998:
	strb r2, [r1, 0xB]
	b _080FF9DC
_080FF99C:
	ldr r0, _080FF9B0 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r2, [r1, 0xB]
	movs r0, 0xB
	ldrsb r0, [r1, r0]
	cmp r0, 0x1
	bgt _080FF9B4
	adds r0, r2, 0x1
	b _080FF9DA
	.align 2, 0
_080FF9B0: .4byte gUnknown_203ACE8
_080FF9B4:
	movs r0, 0
	b _080FF9DA
_080FF9B8:
	ldr r0, _080FF9C8 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r0, [r1, 0xB]
	adds r0, 0x1
	strb r0, [r1, 0xB]
	bl sub_80FFA0C
	b _080FF9DC
	.align 2, 0
_080FF9C8: .4byte gUnknown_203ACE8
_080FF9CC:
	ldr r2, _080FF9E4 @ =gUnknown_203ACE8
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1, 0xA]
	ldr r1, [r2]
	ldrb r0, [r1, 0xB]
	adds r0, 0x1
_080FF9DA:
	strb r0, [r1, 0xB]
_080FF9DC:
	movs r0, 0xE
_080FF9DE:
	pop {r1}
	bx r1
	.align 2, 0
_080FF9E4: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF968

	thumb_func_start sub_80FF9E8
sub_80FF9E8: @ 80FF9E8
	push {lr}
	ldr r2, _080FFA08 @ =gUnknown_203ACE8
	ldr r1, [r2]
	movs r0, 0xFF
	strb r0, [r1, 0xA]
	ldr r2, [r2]
	ldrb r1, [r2, 0xB]
	movs r0, 0xB
	ldrsb r0, [r2, r0]
	cmp r0, 0
	beq _080FFA02
	subs r0, r1, 0x1
	strb r0, [r2, 0xB]
_080FFA02:
	pop {r0}
	bx r0
	.align 2, 0
_080FFA08: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FF9E8

	thumb_func_start sub_80FFA0C
sub_80FFA0C: @ 80FFA0C
	push {r4,lr}
	ldr r4, _080FFA24 @ =gUnknown_203ACE8
	ldr r1, [r4]
	ldrb r0, [r1, 0x9]
	cmp r0, 0
	bne _080FFA28
	movs r0, 0x1
	strb r0, [r1, 0xA]
	bl sub_80FFC1C
	b _080FFA32
	.align 2, 0
_080FFA24: .4byte gUnknown_203ACE8
_080FFA28:
	ldrb r0, [r1, 0xB]
	bl sub_80FFC04
	ldr r1, [r4]
	strb r0, [r1, 0xA]
_080FFA32:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FFA0C

	thumb_func_start sub_80FFA38
sub_80FFA38: @ 80FFA38
	push {r4,lr}
	cmp r0, 0x5
	bls _080FFA40
	b _080FFB64
_080FFA40:
	lsls r0, 2
	ldr r1, _080FFA4C @ =_080FFA50
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FFA4C: .4byte _080FFA50
	.align 2, 0
_080FFA50:
	.4byte _080FFAEC
	.4byte _080FFACA
	.4byte _080FFA68
	.4byte _080FFA94
	.4byte _080FFB14
	.4byte _080FFB34
_080FFA68:
	ldr r0, _080FFA88 @ =gUnknown_203ACE8
	ldr r1, [r0]
	movs r0, 0x11
	ldrsb r0, [r1, r0]
	ldrb r3, [r1, 0xE]
	adds r0, r3
	cmp r0, 0
	bgt _080FFA7A
	b _080FFB64
_080FFA7A:
	ldrb r2, [r1, 0x11]
	movs r0, 0x11
	ldrsb r0, [r1, r0]
	cmp r0, 0
	ble _080FFA8C
	subs r0, r2, 0x1
	b _080FFAB2
	.align 2, 0
_080FFA88: .4byte gUnknown_203ACE8
_080FFA8C:
	subs r0, r3, 0x1
	strb r0, [r1, 0xE]
	movs r4, 0x12
	b _080FFAC2
_080FFA94:
	ldr r0, _080FFAB8 @ =gUnknown_203ACE8
	ldr r1, [r0]
	movs r0, 0x11
	ldrsb r0, [r1, r0]
	ldrb r3, [r1, 0xE]
	adds r0, r3
	ldrb r2, [r1, 0xF]
	cmp r0, r2
	bge _080FFB64
	ldrb r2, [r1, 0x11]
	movs r0, 0x11
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	bgt _080FFABC
	adds r0, r2, 0x1
_080FFAB2:
	strb r0, [r1, 0x11]
	movs r4, 0x11
	b _080FFAC2
	.align 2, 0
_080FFAB8: .4byte gUnknown_203ACE8
_080FFABC:
	adds r0, r3, 0x1
	strb r0, [r1, 0xE]
	movs r4, 0x13
_080FFAC2:
	bl sub_80FFC44
	adds r0, r4, 0
	b _080FFB66
_080FFACA:
	ldr r0, _080FFADC @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r2, [r1, 0x10]
	movs r0, 0x10
	ldrsb r0, [r1, r0]
	cmp r0, 0
	ble _080FFAE0
	subs r0, r2, 0x1
	b _080FFAE2
	.align 2, 0
_080FFADC: .4byte gUnknown_203ACE8
_080FFAE0:
	movs r0, 0x1
_080FFAE2:
	strb r0, [r1, 0x10]
	bl sub_80FFC44
_080FFAE8:
	movs r0, 0x11
	b _080FFB66
_080FFAEC:
	ldr r4, _080FFB10 @ =gUnknown_203ACE8
	ldr r1, [r4]
	ldrb r2, [r1, 0x10]
	movs r0, 0x10
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bgt _080FFB0A
	adds r0, r2, 0x1
	strb r0, [r1, 0x10]
	bl sub_80FFCC0
	lsls r0, 24
	cmp r0, 0
	beq _080FFAE8
	ldr r1, [r4]
_080FFB0A:
	movs r0, 0
	strb r0, [r1, 0x10]
	b _080FFAE8
	.align 2, 0
_080FFB10: .4byte gUnknown_203ACE8
_080FFB14:
	ldr r0, _080FFB28 @ =gUnknown_203ACE8
	ldr r2, [r0]
	ldrb r0, [r2, 0xE]
	adds r1, r0, 0
	cmp r1, 0
	beq _080FFB64
	cmp r1, 0x3
	bls _080FFB2C
	subs r0, 0x4
	b _080FFB2E
	.align 2, 0
_080FFB28: .4byte gUnknown_203ACE8
_080FFB2C:
	movs r0, 0
_080FFB2E:
	strb r0, [r2, 0xE]
	movs r0, 0x14
	b _080FFB66
_080FFB34:
	ldr r3, _080FFB60 @ =gUnknown_203ACE8
	ldr r1, [r3]
	ldrb r2, [r1, 0xE]
	ldrb r0, [r1, 0xF]
	subs r0, 0x4
	cmp r2, r0
	bgt _080FFB64
	adds r0, r2, 0x4
	strb r0, [r1, 0xE]
	ldr r2, [r3]
	ldrb r1, [r2, 0xE]
	ldrb r3, [r2, 0xF]
	subs r0, r3, 0x3
	cmp r1, r0
	ble _080FFB58
	adds r0, r3, 0
	adds r0, 0xFD
	strb r0, [r2, 0xE]
_080FFB58:
	bl sub_80FFC44
	movs r0, 0x15
	b _080FFB66
	.align 2, 0
_080FFB60: .4byte gUnknown_203ACE8
_080FFB64:
	movs r0, 0
_080FFB66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FFA38

	thumb_func_start sub_80FFB6C
sub_80FFB6C: @ 80FFB6C
	ldr r0, _080FFB88 @ =gUnknown_203ACE8
	ldr r0, [r0]
	movs r2, 0x6
	ldrsb r2, [r0, r2]
	ldrb r1, [r0, 0x2]
	muls r1, r2
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_080FFB88: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFB6C

	thumb_func_start sub_80FFB8C
sub_80FFB8C: @ 80FFB8C
	ldr r0, _080FFBA8 @ =gUnknown_203ACE8
	ldr r0, [r0]
	movs r1, 0xB
	ldrsb r1, [r0, r1]
	ldrb r2, [r0, 0xC]
	adds r1, r2
	lsls r1, 1
	ldrb r0, [r0, 0xA]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_080FFBA8: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFB8C

	thumb_func_start sub_80FFBAC
sub_80FFBAC: @ 80FFBAC
	push {lr}
	ldr r0, _080FFBDC @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r0, [r1, 0xA]
	movs r3, 0
	cmp r0, 0x6
	bhi _080FFBBE
	movs r3, 0xA
	ldrsb r3, [r1, r3]
_080FFBBE:
	ldrb r0, [r1, 0xB]
	movs r2, 0
	cmp r0, 0x3
	bhi _080FFBCA
	movs r2, 0xB
	ldrsb r2, [r1, r2]
_080FFBCA:
	ldr r0, _080FFBE0 @ =gUnknown_843F39C
	lsls r1, r2, 3
	subs r1, r2
	adds r1, r3, r1
	adds r1, r0
	ldrb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_080FFBDC: .4byte gUnknown_203ACE8
_080FFBE0: .4byte gUnknown_843F39C
	thumb_func_end sub_80FFBAC

	thumb_func_start sub_80FFBE4
sub_80FFBE4: @ 80FFBE4
	ldr r0, _080FFC00 @ =gUnknown_203ACE8
	ldr r0, [r0]
	movs r1, 0x11
	ldrsb r1, [r0, r1]
	ldrb r2, [r0, 0xE]
	adds r1, r2
	lsls r1, 1
	ldrb r0, [r0, 0x10]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_080FFC00: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFBE4

	thumb_func_start sub_80FFC04
sub_80FFC04: @ 80FFC04
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080FFC12
	cmp r0, 0x1
	beq _080FFC16
_080FFC12:
	movs r0, 0x6
	b _080FFC18
_080FFC16:
	movs r0, 0x5
_080FFC18:
	pop {r1}
	bx r1
	thumb_func_end sub_80FFC04

	thumb_func_start sub_80FFC1C
sub_80FFC1C: @ 80FFC1C
	push {lr}
	b _080FFC32
_080FFC20:
	ldr r0, _080FFC40 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r2, [r1, 0xA]
	movs r0, 0xA
	ldrsb r0, [r1, r0]
	cmp r0, 0
	beq _080FFC3C
	subs r0, r2, 0x1
	strb r0, [r1, 0xA]
_080FFC32:
	bl sub_80FFC6C
	lsls r0, 24
	cmp r0, 0
	bne _080FFC20
_080FFC3C:
	pop {r0}
	bx r0
	.align 2, 0
_080FFC40: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFC1C

	thumb_func_start sub_80FFC44
sub_80FFC44: @ 80FFC44
	push {lr}
	b _080FFC5A
_080FFC48:
	ldr r0, _080FFC68 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r2, [r1, 0x10]
	movs r0, 0x10
	ldrsb r0, [r1, r0]
	cmp r0, 0
	beq _080FFC64
	subs r0, r2, 0x1
	strb r0, [r1, 0x10]
_080FFC5A:
	bl sub_80FFCC0
	lsls r0, 24
	cmp r0, 0
	bne _080FFC48
_080FFC64:
	pop {r0}
	bx r0
	.align 2, 0
_080FFC68: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFC44

	thumb_func_start sub_80FFC6C
sub_80FFC6C: @ 80FFC6C
	push {r4,lr}
	ldr r4, _080FFC98 @ =gUnknown_203ACE8
	ldr r1, [r4]
	ldrb r0, [r1, 0x9]
	cmp r0, 0
	bne _080FFC9C
	bl sub_80FFB8C
	adds r4, r0, 0
	bl sub_80BDF38
	movs r1, 0
	lsls r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsrs r0, 24
	cmp r4, r0
	bcc _080FFC92
	movs r1, 0x1
_080FFC92:
	adds r0, r1, 0
	b _080FFCB8
	.align 2, 0
_080FFC98: .4byte gUnknown_203ACE8
_080FFC9C:
	ldrb r0, [r1, 0xB]
	bl sub_80FFC04
	movs r2, 0
	ldr r1, [r4]
	ldrb r1, [r1, 0xA]
	lsls r1, 24
	asrs r1, 24
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	ble _080FFCB6
	movs r2, 0x1
_080FFCB6:
	adds r0, r2, 0
_080FFCB8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FFC6C

	thumb_func_start sub_80FFCC0
sub_80FFCC0: @ 80FFCC0
	push {r4,lr}
	bl sub_80FFBE4
	adds r4, r0, 0
	bl sub_80BE1D4
	movs r1, 0
	lsls r4, 16
	lsls r0, 16
	cmp r4, r0
	bcc _080FFCD8
	movs r1, 0x1
_080FFCD8:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FFCC0

	thumb_func_start sub_80FFCE0
sub_80FFCE0: @ 80FFCE0
	ldr r2, _080FFCF4 @ =gUnknown_843F2AC
	ldr r0, _080FFCF8 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x3]
	bx lr
	.align 2, 0
_080FFCF4: .4byte gUnknown_843F2AC
_080FFCF8: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFCE0

	thumb_func_start sub_80FFCFC
sub_80FFCFC: @ 80FFCFC
	ldr r2, _080FFD14 @ =gUnknown_843F2AC
	ldr r0, _080FFD18 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080FFD14: .4byte gUnknown_843F2AC
_080FFD18: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFCFC

	thumb_func_start sub_80FFD1C
sub_80FFD1C: @ 80FFD1C
	ldr r0, _080FFD24 @ =gUnknown_203ACE8
	ldr r0, [r0]
	adds r0, 0x18
	bx lr
	.align 2, 0
_080FFD24: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFD1C

	thumb_func_start sub_80FFD28
sub_80FFD28: @ 80FFD28
	ldr r0, _080FFD30 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	bx lr
	.align 2, 0
_080FFD30: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFD28

	thumb_func_start sub_80FFD34
sub_80FFD34: @ 80FFD34
	ldr r0, _080FFD3C @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	bx lr
	.align 2, 0
_080FFD3C: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFD34

	thumb_func_start sub_80FFD40
sub_80FFD40: @ 80FFD40
	ldr r0, _080FFD48 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	bx lr
	.align 2, 0
_080FFD48: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFD40

	thumb_func_start sub_80FFD4C
sub_80FFD4C: @ 80FFD4C
	ldr r0, _080FFD54 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	bx lr
	.align 2, 0
_080FFD54: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFD4C

	thumb_func_start sub_80FFD58
sub_80FFD58: @ 80FFD58
	push {r4,r5,lr}
	ldr r4, _080FFD88 @ =gUnknown_843F2AC
	ldr r2, _080FFD8C @ =gUnknown_203ACE8
	ldr r5, [r2]
	ldrb r3, [r5, 0x1]
	lsls r2, r3, 1
	adds r2, r3
	lsls r2, 3
	adds r3, r4, 0
	adds r3, 0x8
	adds r2, r3
	ldr r2, [r2]
	str r2, [r0]
	ldrb r2, [r5, 0x1]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r4, 0xC
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FFD88: .4byte gUnknown_843F2AC
_080FFD8C: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFD58

	thumb_func_start sub_80FFD90
sub_80FFD90: @ 80FFD90
	push {r4,r5,lr}
	ldr r4, _080FFDC0 @ =gUnknown_843F2AC
	ldr r2, _080FFDC4 @ =gUnknown_203ACE8
	ldr r5, [r2]
	ldrb r3, [r5, 0x1]
	lsls r2, r3, 1
	adds r2, r3
	lsls r2, 3
	adds r3, r4, 0
	adds r3, 0x10
	adds r2, r3
	ldr r2, [r2]
	str r2, [r0]
	ldrb r2, [r5, 0x1]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r4, 0x14
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FFDC0: .4byte gUnknown_843F2AC
_080FFDC4: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFD90

	thumb_func_start sub_80FFDC8
sub_80FFDC8: @ 80FFDC8
	push {lr}
	adds r2, r0, 0
	ldr r0, _080FFDDC @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _080FFDE4
	ldr r0, _080FFDE0 @ =gUnknown_84189EE
	b _080FFDE6
	.align 2, 0
_080FFDDC: .4byte gUnknown_203ACE8
_080FFDE0: .4byte gUnknown_84189EE
_080FFDE4:
	ldr r0, _080FFDF0 @ =gUnknown_84189E0
_080FFDE6:
	str r0, [r2]
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080FFDF0: .4byte gUnknown_84189E0
	thumb_func_end sub_80FFDC8

	thumb_func_start sub_80FFDF4
sub_80FFDF4: @ 80FFDF4
	ldr r2, _080FFE00 @ =gUnknown_8418937
	str r2, [r0]
	ldr r0, _080FFE04 @ =gUnknown_8418956
	str r0, [r1]
	bx lr
	.align 2, 0
_080FFE00: .4byte gUnknown_8418937
_080FFE04: .4byte gUnknown_8418956
	thumb_func_end sub_80FFDF4

	thumb_func_start sub_80FFE08
sub_80FFE08: @ 80FFE08
	ldr r2, _080FFE18 @ =gUnknown_203ACE8
	ldr r3, [r2]
	ldrb r2, [r3, 0xA]
	strb r2, [r0]
	ldrb r0, [r3, 0xB]
	strb r0, [r1]
	bx lr
	.align 2, 0
_080FFE18: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFE08

	thumb_func_start sub_80FFE1C
sub_80FFE1C: @ 80FFE1C
	ldr r0, _080FFE24 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	bx lr
	.align 2, 0
_080FFE24: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFE1C

	thumb_func_start sub_80FFE28
sub_80FFE28: @ 80FFE28
	ldr r0, _080FFE30 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0xC]
	bx lr
	.align 2, 0
_080FFE30: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFE28

	thumb_func_start sub_80FFE34
sub_80FFE34: @ 80FFE34
	ldr r2, _080FFE44 @ =gUnknown_203ACE8
	ldr r3, [r2]
	ldrb r2, [r3, 0x10]
	strb r2, [r0]
	ldrb r0, [r3, 0x11]
	strb r0, [r1]
	bx lr
	.align 2, 0
_080FFE44: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFE34

	thumb_func_start sub_80FFE48
sub_80FFE48: @ 80FFE48
	ldr r0, _080FFE50 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0xE]
	bx lr
	.align 2, 0
_080FFE50: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFE48

	thumb_func_start sub_80FFE54
sub_80FFE54: @ 80FFE54
	ldr r0, _080FFE5C @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r0, [r0, 0xF]
	bx lr
	.align 2, 0
_080FFE5C: .4byte gUnknown_203ACE8
	thumb_func_end sub_80FFE54

	thumb_func_start sub_80FFE60
sub_80FFE60: @ 80FFE60
	movs r0, 0
	bx lr
	thumb_func_end sub_80FFE60

	thumb_func_start sub_80FFE64
sub_80FFE64: @ 80FFE64
	push {lr}
	ldr r0, _080FFE78 @ =gUnknown_203ACE8
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	cmp r0, 0x2
	beq _080FFE7C
	cmp r0, 0x3
	beq _080FFE86
	b _080FFE90
	.align 2, 0
_080FFE78: .4byte gUnknown_203ACE8
_080FFE7C:
	ldrb r0, [r1, 0x9]
	cmp r0, 0
	bne _080FFE90
	ldrb r0, [r1, 0xC]
	b _080FFE88
_080FFE86:
	ldrb r0, [r1, 0xE]
_080FFE88:
	cmp r0, 0
	beq _080FFE90
	movs r0, 0x1
	b _080FFE92
_080FFE90:
	movs r0, 0
_080FFE92:
	pop {r1}
	bx r1
	thumb_func_end sub_80FFE64

	thumb_func_start sub_80FFE98
sub_80FFE98: @ 80FFE98
	push {lr}
	ldr r0, _080FFEAC @ =gUnknown_203ACE8
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	cmp r0, 0x2
	beq _080FFEB0
	cmp r0, 0x3
	beq _080FFEC6
	b _080FFED4
	.align 2, 0
_080FFEAC: .4byte gUnknown_203ACE8
_080FFEB0:
	ldrb r0, [r2, 0x9]
	cmp r0, 0
	bne _080FFED4
	ldrb r1, [r2, 0xC]
	adds r1, 0x4
	ldrb r0, [r2, 0xD]
	subs r0, 0x1
	cmp r1, r0
	bgt _080FFED4
	movs r0, 0x1
	b _080FFED6
_080FFEC6:
	ldrb r0, [r2, 0xE]
	adds r0, 0x4
	ldrb r2, [r2, 0xF]
	cmp r0, r2
	bgt _080FFED4
	movs r0, 0x1
	b _080FFED6
_080FFED4:
	movs r0, 0
_080FFED6:
	pop {r1}
	bx r1
	thumb_func_end sub_80FFE98

	thumb_func_start sub_80FFEDC
sub_80FFEDC: @ 80FFEDC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	movs r2, 0
	cmp r2, r3
	bcs _080FFF12
	ldr r0, _080FFF04 @ =gUnknown_203ACE8
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0x18
_080FFEF2:
	lsls r0, r2, 1
	adds r1, r0, r5
	adds r0, r4, r0
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	beq _080FFF08
	movs r0, 0x1
	b _080FFF14
	.align 2, 0
_080FFF04: .4byte gUnknown_203ACE8
_080FFF08:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _080FFEF2
_080FFF12:
	movs r0, 0
_080FFF14:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FFEDC

	thumb_func_start sub_80FFF1C
sub_80FFF1C: @ 80FFF1C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r2, _080FFF34 @ =gUnknown_843F2AC
_080FFF26:
	ldrb r0, [r2]
	cmp r0, r3
	bne _080FFF38
	lsls r0, r1, 24
	lsrs r0, 24
	b _080FFF42
	.align 2, 0
_080FFF34: .4byte gUnknown_843F2AC
_080FFF38:
	adds r2, 0x18
	adds r1, 0x1
	cmp r1, 0x9
	bls _080FFF26
	movs r0, 0
_080FFF42:
	pop {r1}
	bx r1
	thumb_func_end sub_80FFF1C

	thumb_func_start sub_80FFF48
sub_80FFF48: @ 80FFF48
	push {r4,lr}
	movs r2, 0
	ldr r0, _080FFF68 @ =gUnknown_203ACE8
	ldr r0, [r0]
	ldrb r1, [r0, 0x7]
	cmp r2, r1
	bge _080FFF78
	ldr r4, _080FFF6C @ =0x0000ffff
	adds r3, r1, 0
	adds r1, r0, 0
	adds r1, 0x18
_080FFF5E:
	ldrh r0, [r1]
	cmp r0, r4
	beq _080FFF70
	movs r0, 0
	b _080FFF7A
	.align 2, 0
_080FFF68: .4byte gUnknown_203ACE8
_080FFF6C: .4byte 0x0000ffff
_080FFF70:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r3
	blt _080FFF5E
_080FFF78:
	movs r0, 0x1
_080FFF7A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FFF48

	thumb_func_start sub_80FFF80
sub_80FFF80: @ 80FFF80
	push {lr}
	bl sub_8100BF4
	lsls r0, 24
	cmp r0, 0
	beq _080FFF90
	movs r0, 0x1
	b _080FFF92
_080FFF90:
	movs r0, 0
_080FFF92:
	pop {r1}
	bx r1
	thumb_func_end sub_80FFF80

	thumb_func_start sub_80FFF98
sub_80FFF98: @ 80FFF98
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _080FFFB4 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x5
	bls _080FFFA8
	b _08100100
_080FFFA8:
	lsls r0, 2
	ldr r1, _080FFFB8 @ =_080FFFBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FFFB4: .4byte gUnknown_203ACEC
_080FFFB8: .4byte _080FFFBC
	.align 2, 0
_080FFFBC:
	.4byte _080FFFD4
	.4byte _08100038
	.4byte _0810006C
	.4byte _0810009C
	.4byte _081000AE
	.4byte _081000B8
_080FFFD4:
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08100028 @ =gUnknown_843F8A0
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	ldr r4, _0810002C @ =gUnknown_203ACEC
	ldr r1, [r4]
	movs r0, 0xB0
	lsls r0, 4
	adds r1, r0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r0, _08100030 @ =gUnknown_843F8B0
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl sub_8100CBC
	bl sub_8100C5C
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _08100034 @ =0x01000100
	add r0, sp, 0x4
	bl CpuFastSet
	b _08100104
	.align 2, 0
_08100028: .4byte gUnknown_843F8A0
_0810002C: .4byte gUnknown_203ACEC
_08100030: .4byte gUnknown_843F8B0
_08100034: .4byte 0x01000100
_08100038:
	ldr r1, _08100064 @ =gUnknown_8E99DAC
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _08100068 @ =gUnknown_8E99E74
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	bl sub_8100F44
	bl sub_8102428
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _08100104
	.align 2, 0
_08100064: .4byte gUnknown_8E99DAC
_08100068: .4byte gUnknown_8E99E74
_0810006C:
	ldr r0, _08100094 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 2
	adds r0, r1
	bl sub_8101100
	ldr r1, _08100098 @ =gUnknown_843F7AC
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	b _08100104
	.align 2, 0
_08100094: .4byte gUnknown_203ACEC
_08100098: .4byte gUnknown_843F7AC
_0810009C:
	bl sub_8100D24
	bl sub_8100E34
	bl sub_8100FDC
	bl sub_81012CC
	b _08100104
_081000AE:
	bl sub_8101A90
	bl sub_8101AC4
	b _08100104
_081000B8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0810010E
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8101A5C
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x3B
	bl SetGpuReg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0
	bl ShowBg
	bl sub_81021D4
	bl sub_8102320
	b _08100104
_08100100:
	movs r0, 0
	b _08100110
_08100104:
	ldr r0, _08100118 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810010E:
	movs r0, 0x1
_08100110:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08100118: .4byte gUnknown_203ACEC
	thumb_func_end sub_80FFF98

	thumb_func_start sub_810011C
sub_810011C: @ 810011C
	push {lr}
	ldr r0, _08100130 @ =gUnknown_203ACEC
	ldr r0, [r0]
	cmp r0, 0
	beq _0810012A
	bl Free
_0810012A:
	pop {r0}
	bx r0
	.align 2, 0
_08100130: .4byte gUnknown_203ACEC
	thumb_func_end sub_810011C

	thumb_func_start sub_8100134
sub_8100134: @ 8100134
	push {lr}
	ldr r1, _08100148 @ =gUnknown_203ACEC
	ldr r1, [r1]
	movs r2, 0
	strh r0, [r1, 0x4]
	strh r2, [r1]
	bl sub_810014C
	pop {r0}
	bx r0
	.align 2, 0
_08100148: .4byte gUnknown_203ACEC
	thumb_func_end sub_8100134

	thumb_func_start sub_810014C
sub_810014C: @ 810014C
	push {lr}
	ldr r0, _08100164 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0, 0x4]
	cmp r0, 0x16
	bhi _08100250
	lsls r0, 2
	ldr r1, _08100168 @ =_0810016C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08100164: .4byte gUnknown_203ACEC
_08100168: .4byte _0810016C
	.align 2, 0
_0810016C:
	.4byte _08100250
	.4byte _081001C8
	.4byte _081001CE
	.4byte _081001D4
	.4byte _081001DA
	.4byte _081001E0
	.4byte _081001E6
	.4byte _081001EC
	.4byte _081001F2
	.4byte _081001F8
	.4byte _081001FE
	.4byte _08100204
	.4byte _0810020A
	.4byte _08100210
	.4byte _08100216
	.4byte _0810021C
	.4byte _08100222
	.4byte _08100228
	.4byte _0810022E
	.4byte _08100234
	.4byte _0810023A
	.4byte _08100240
	.4byte _08100246
_081001C8:
	bl sub_8100258
	b _0810024A
_081001CE:
	bl sub_8100290
	b _0810024A
_081001D4:
	bl sub_8100374
	b _0810024A
_081001DA:
	bl sub_8100430
	b _0810024A
_081001E0:
	bl sub_81003A8
	b _0810024A
_081001E6:
	bl sub_81003EC
	b _0810024A
_081001EC:
	bl sub_8100474
	b _0810024A
_081001F2:
	bl sub_81004B8
	b _0810024A
_081001F8:
	bl sub_81004F4
	b _0810024A
_081001FE:
	bl sub_81005C0
	b _0810024A
_08100204:
	bl sub_81007D0
	b _0810024A
_0810020A:
	bl sub_8100890
	b _0810024A
_08100210:
	bl sub_810093C
	b _0810024A
_08100216:
	bl sub_8100720
	b _0810024A
_0810021C:
	bl sub_810072C
	b _0810024A
_08100222:
	bl sub_8100774
	b _0810024A
_08100228:
	bl sub_81009F8
	b _0810024A
_0810022E:
	bl sub_8100A78
	b _0810024A
_08100234:
	bl sub_8100A04
	b _0810024A
_0810023A:
	bl sub_8100B70
	b _0810024A
_08100240:
	bl sub_8100AE8
	b _0810024A
_08100246:
	bl sub_8100660
_0810024A:
	lsls r0, 24
	lsrs r0, 24
	b _08100252
_08100250:
	movs r0, 0
_08100252:
	pop {r1}
	bx r1
	thumb_func_end sub_810014C

	thumb_func_start sub_8100258
sub_8100258: @ 8100258
	push {r4,lr}
	ldr r4, _0810026C @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08100270
	cmp r0, 0x1
	beq _0810027E
	b _08100288
	.align 2, 0
_0810026C: .4byte gUnknown_203ACEC
_08100270:
	bl sub_8100FDC
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100288
_0810027E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0810028A
_08100288:
	movs r0, 0x1
_0810028A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100258

	thumb_func_start sub_8100290
sub_8100290: @ 8100290
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x40
	bl sub_80FFD1C
	adds r4, r0, 0
	bl sub_80FFCE0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	bl sub_80FFD40
	lsls r0, 24
	lsrs r7, r0, 24
	bl sub_80FFD4C
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl sub_80FFD34
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	lsls r0, 1
	adds r4, r0
	ldr r1, _08100304 @ =gUnknown_843F888
	mov r2, r9
	lsls r0, r2, 2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 19
	movs r1, 0xD0
	lsls r1, 12
	adds r0, r1
	lsrs r6, r0, 16
	movs r5, 0
	cmp r5, r7
	bcs _0810033A
	ldr r2, _08100308 @ =0x0000ffff
	mov r10, r2
_081002EE:
	ldrh r0, [r4]
	cmp r0, r10
	bne _08100310
	movs r0, 0x1
	ldr r1, _0810030C @ =gUnknown_843F8D8
	movs r2, 0
	bl GetStringWidth
	lsls r1, r0, 3
	subs r0, r1, r0
	b _08100322
	.align 2, 0
_08100304: .4byte gUnknown_843F888
_08100308: .4byte 0x0000ffff
_0810030C: .4byte gUnknown_843F8D8
_08100310:
	ldrh r1, [r4]
	mov r0, sp
	bl CopyEasyChatWord
	movs r0, 0x1
	mov r1, sp
	movs r2, 0
	bl GetStringWidth
_08100322:
	adds r0, 0x11
	lsls r1, r6, 16
	asrs r1, 16
	adds r1, r0
	lsls r1, 16
	lsrs r6, r1, 16
	adds r4, 0x2
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _081002EE
_0810033A:
	ldr r1, _08100370 @ =gUnknown_843F888
	mov r2, r9
	lsls r0, r2, 2
	adds r0, r1
	mov r2, r8
	lsls r1, r2, 1
	ldrb r0, [r0, 0x1]
	adds r1, r0
	adds r1, 0x1
	lsls r1, 3
	adds r1, 0x1
	lsls r0, r6, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_8101B58
	movs r0, 0
	add sp, 0x40
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08100370: .4byte gUnknown_843F888
	thumb_func_end sub_8100290

	thumb_func_start sub_8100374
sub_8100374: @ 8100374
	push {lr}
	bl sub_80FFD40
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08100396
	cmp r0, 0x1
	bgt _0810038C
	cmp r0, 0
	beq _08100392
	b _081003A2
_0810038C:
	cmp r0, 0x2
	beq _0810039A
	b _081003A2
_08100392:
	movs r0, 0x1C
	b _0810039C
_08100396:
	movs r0, 0x73
	b _0810039C
_0810039A:
	movs r0, 0xBF
_0810039C:
	movs r1, 0x61
	bl sub_8101B58
_081003A2:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8100374

	thumb_func_start sub_81003A8
sub_81003A8: @ 81003A8
	push {r4,lr}
	ldr r4, _081003BC @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _081003C0
	cmp r0, 0x1
	beq _081003DA
	b _081003E4
	.align 2, 0
_081003BC: .4byte gUnknown_203ACEC
_081003C0:
	bl sub_8101B88
	movs r0, 0x2
	bl sub_8100E7C
	movs r0, 0x1
	bl sub_8100F18
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081003E4
_081003DA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _081003E6
_081003E4:
	movs r0, 0x1
_081003E6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81003A8

	thumb_func_start sub_81003EC
sub_81003EC: @ 81003EC
	push {r4,lr}
	ldr r4, _08100400 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08100404
	cmp r0, 0x1
	beq _0810041E
	b _08100428
	.align 2, 0
_08100400: .4byte gUnknown_203ACEC
_08100404:
	bl sub_8101B88
	movs r0, 0x3
	bl sub_8100E7C
	movs r0, 0
	bl sub_8100F18
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100428
_0810041E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0810042A
_08100428:
	movs r0, 0x1
_0810042A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81003EC

	thumb_func_start sub_8100430
sub_8100430: @ 8100430
	push {r4,lr}
	ldr r4, _08100444 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08100448
	cmp r0, 0x1
	beq _08100462
	b _0810046C
	.align 2, 0
_08100444: .4byte gUnknown_203ACEC
_08100448:
	bl sub_8101B88
	movs r0, 0x1
	bl sub_8100E7C
	movs r0, 0x1
	bl sub_8100F18
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0810046C
_08100462:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0810046E
_0810046C:
	movs r0, 0x1
_0810046E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100430

	thumb_func_start sub_8100474
sub_8100474: @ 8100474
	push {r4,lr}
	ldr r4, _08100488 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _0810048C
	cmp r0, 0x1
	beq _081004A6
	b _081004B0
	.align 2, 0
_08100488: .4byte gUnknown_203ACEC
_0810048C:
	bl sub_8101BA8
	movs r0, 0
	bl sub_8100E7C
	movs r0, 0
	bl ShowBg
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081004B0
_081004A6:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _081004B2
_081004B0:
	movs r0, 0x1
_081004B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100474

	thumb_func_start sub_81004B8
sub_81004B8: @ 81004B8
	push {r4,lr}
	ldr r4, _081004CC @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _081004D0
	cmp r0, 0x1
	beq _081004E6
	movs r0, 0x1
	b _081004EE
	.align 2, 0
_081004CC: .4byte gUnknown_203ACEC
_081004D0:
	bl sub_8101BA8
	movs r0, 0
	bl sub_8100E7C
	bl sub_8100FDC
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081004E6:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
_081004EE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81004B8

	thumb_func_start sub_81004F4
sub_81004F4: @ 81004F4
	push {lr}
	ldr r0, _0810050C @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _081005AE
	lsls r0, 2
	ldr r1, _08100510 @ =_08100514
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810050C: .4byte gUnknown_203ACEC
_08100510: .4byte _08100514
	.align 2, 0
_08100514:
	.4byte _08100528
	.4byte _08100544
	.4byte _08100556
	.4byte _0810056C
	.4byte _0810058C
_08100528:
	bl sub_8101B88
	movs r0, 0
	bl HideBg
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8101A5C
	bl sub_810131C
	b _0810057A
_08100544:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	movs r0, 0
	bl sub_81015D4
	b _0810057A
_08100556:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	b _0810057A
_0810056C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	bl sub_8101FAC
_0810057A:
	ldr r0, _08100588 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081005B8
	.align 2, 0
_08100588: .4byte gUnknown_203ACEC
_0810058C:
	bl sub_8102018
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	bl sub_8101BC0
	movs r0, 0
	bl sub_81022E0
	bl sub_810224C
	ldr r0, _081005B4 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081005AE:
	movs r0, 0
	b _081005BA
	.align 2, 0
_081005B4: .4byte gUnknown_203ACEC
_081005B8:
	movs r0, 0x1
_081005BA:
	pop {r1}
	bx r1
	thumb_func_end sub_81004F4

	thumb_func_start sub_81005C0
sub_81005C0: @ 81005C0
	push {lr}
	ldr r0, _081005D8 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _08100658
	lsls r0, 2
	ldr r1, _081005DC @ =_081005E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081005D8: .4byte gUnknown_203ACEC
_081005DC: .4byte _081005E0
	.align 2, 0
_081005E0:
	.4byte _081005F4
	.4byte _08100602
	.4byte _0810061E
	.4byte _08100630
	.4byte _08100654
_081005F4:
	bl sub_8101C48
	bl sub_81020AC
	bl sub_81022B0
	b _08100644
_08100602:
	bl sub_81020D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08100658
	movs r0, 0x1
	bl sub_81015D4
	ldr r0, _0810062C @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810061E:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100658
	b _08100644
	.align 2, 0
_0810062C: .4byte gUnknown_203ACEC
_08100630:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100658
	bl sub_8101BA8
	movs r0, 0
	bl ShowBg
_08100644:
	ldr r0, _08100650 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100658
	.align 2, 0
_08100650: .4byte gUnknown_203ACEC
_08100654:
	movs r0, 0
	b _0810065A
_08100658:
	movs r0, 0x1
_0810065A:
	pop {r1}
	bx r1
	thumb_func_end sub_81005C0

	thumb_func_start sub_8100660
sub_8100660: @ 8100660
	push {lr}
	ldr r0, _08100678 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _08100718
	lsls r0, 2
	ldr r1, _0810067C @ =_08100680
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08100678: .4byte gUnknown_203ACEC
_0810067C: .4byte _08100680
	.align 2, 0
_08100680:
	.4byte _08100694
	.4byte _081006A8
	.4byte _081006C2
	.4byte _081006E8
	.4byte _0810070E
_08100694:
	bl sub_8101C48
	bl sub_81022B0
	bl sub_810215C
	movs r0, 0x5
	bl sub_81015D4
	b _081006D6
_081006A8:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	bl sub_81021B8
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	bl sub_810131C
	b _081006D6
_081006C2:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	movs r0, 0x6
	bl sub_81015D4
	bl sub_8102178
_081006D6:
	ldr r0, _081006E4 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100718
	.align 2, 0
_081006E4: .4byte gUnknown_203ACEC
_081006E8:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	bl sub_81021B8
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	bl sub_810224C
	bl sub_8101BC0
	ldr r0, _08100714 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810070E:
	movs r0, 0
	b _0810071A
	.align 2, 0
_08100714: .4byte gUnknown_203ACEC
_08100718:
	movs r0, 0x1
_0810071A:
	pop {r1}
	bx r1
	thumb_func_end sub_8100660

	thumb_func_start sub_8100720
sub_8100720: @ 8100720
	push {lr}
	bl sub_8101C80
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8100720

	thumb_func_start sub_810072C
sub_810072C: @ 810072C
	push {r4,lr}
	ldr r4, _08100740 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08100744
	cmp r0, 0x1
	beq _08100754
	b _0810076A
	.align 2, 0
_08100740: .4byte gUnknown_203ACEC
_08100744:
	movs r0, 0x1
	movs r1, 0x2
	bl sub_81019B0
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100754:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _0810076A
	bl sub_8101C80
	bl sub_810224C
	movs r0, 0
	b _0810076C
_0810076A:
	movs r0, 0x1
_0810076C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810072C

	thumb_func_start sub_8100774
sub_8100774: @ 8100774
	push {r4,lr}
	ldr r4, _0810078C @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _081007A8
	cmp r0, 0x1
	bgt _08100790
	cmp r0, 0
	beq _08100796
	b _081007C8
	.align 2, 0
_0810078C: .4byte gUnknown_203ACEC
_08100790:
	cmp r0, 0x2
	beq _081007C0
	b _081007C8
_08100796:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	bl sub_81019B0
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081007A8:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _081007C8
	bl sub_810224C
	ldr r0, _081007C4 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081007C0:
	movs r0, 0
	b _081007CA
	.align 2, 0
_081007C4: .4byte gUnknown_203ACEC
_081007C8:
	movs r0, 0x1
_081007CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100774

	thumb_func_start sub_81007D0
sub_81007D0: @ 81007D0
	push {lr}
	ldr r0, _081007E8 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x5
	bhi _08100888
	lsls r0, 2
	ldr r1, _081007EC @ =_081007F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081007E8: .4byte gUnknown_203ACEC
_081007EC: .4byte _081007F0
	.align 2, 0
_081007F0:
	.4byte _08100808
	.4byte _08100816
	.4byte _08100826
	.4byte _08100838
	.4byte _08100858
	.4byte _0810087E
_08100808:
	bl sub_8101C48
	bl sub_81020AC
	bl sub_81022B0
	b _08100848
_08100816:
	bl sub_81020D0
	lsls r0, 24
	cmp r0, 0
	bne _08100888
	bl sub_81015BC
	b _08100848
_08100826:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100888
	movs r0, 0x2
	bl sub_81015D4
	b _08100848
_08100838:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100888
	movs r0, 0x2
	bl sub_81012E0
_08100848:
	ldr r0, _08100854 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100888
	.align 2, 0
_08100854: .4byte gUnknown_203ACEC
_08100858:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100888
	bl sub_8101E80
	movs r0, 0x1
	bl sub_81022E0
	bl sub_810224C
	bl sub_8102394
	ldr r0, _08100884 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810087E:
	movs r0, 0
	b _0810088A
	.align 2, 0
_08100884: .4byte gUnknown_203ACEC
_08100888:
	movs r0, 0x1
_0810088A:
	pop {r1}
	bx r1
	thumb_func_end sub_81007D0

	thumb_func_start sub_8100890
sub_8100890: @ 8100890
	push {lr}
	ldr r0, _081008A8 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x5
	bhi _08100934
	lsls r0, 2
	ldr r1, _081008AC @ =_081008B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081008A8: .4byte gUnknown_203ACEC
_081008AC: .4byte _081008B0
	.align 2, 0
_081008B0:
	.4byte _081008C8
	.4byte _081008CE
	.4byte _081008E0
	.4byte _081008F2
	.4byte _08100914
	.4byte _0810092C
_081008C8:
	bl sub_8100FDC
	b _08100902
_081008CE:
	bl sub_8101F80
	bl sub_81022B0
	bl sub_81023F8
	bl sub_81015BC
	b _08100902
_081008E0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100934
	movs r0, 0x3
	bl sub_81015D4
	b _08100902
_081008F2:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100934
	movs r0, 0
	bl ShowBg
_08100902:
	ldr r0, _08100910 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100934
	.align 2, 0
_08100910: .4byte gUnknown_203ACEC
_08100914:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100934
	bl sub_8101BA8
	ldr r0, _08100930 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810092C:
	movs r0, 0
	b _08100936
	.align 2, 0
_08100930: .4byte gUnknown_203ACEC
_08100934:
	movs r0, 0x1
_08100936:
	pop {r1}
	bx r1
	thumb_func_end sub_8100890

	thumb_func_start sub_810093C
sub_810093C: @ 810093C
	push {lr}
	ldr r0, _08100954 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _081009F0
	lsls r0, 2
	ldr r1, _08100958 @ =_0810095C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08100954: .4byte gUnknown_203ACEC
_08100958: .4byte _0810095C
	.align 2, 0
_0810095C:
	.4byte _08100970
	.4byte _08100982
	.4byte _08100994
	.4byte _081009A4
	.4byte _081009C4
_08100970:
	bl sub_8101F80
	bl sub_81022B0
	bl sub_81023F8
	bl sub_81015BC
	b _081009B2
_08100982:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081009F0
	movs r0, 0x4
	bl sub_81015D4
	b _081009B2
_08100994:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _081009F0
	bl sub_810131C
	b _081009B2
_081009A4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081009F0
	bl sub_8101FAC
_081009B2:
	ldr r0, _081009C0 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081009F0
	.align 2, 0
_081009C0: .4byte gUnknown_203ACEC
_081009C4:
	bl sub_8102018
	lsls r0, 24
	cmp r0, 0
	bne _081009F0
	bl sub_8101BC0
	movs r0, 0
	bl sub_81022E0
	bl sub_810224C
	ldr r0, _081009EC @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _081009F2
	.align 2, 0
_081009EC: .4byte gUnknown_203ACEC
_081009F0:
	movs r0, 0x1
_081009F2:
	pop {r1}
	bx r1
	thumb_func_end sub_810093C

	thumb_func_start sub_81009F8
sub_81009F8: @ 81009F8
	push {lr}
	bl sub_8101F04
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_81009F8

	thumb_func_start sub_8100A04
sub_8100A04: @ 8100A04
	push {r4,lr}
	ldr r4, _08100A1C @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08100A30
	cmp r0, 0x1
	bgt _08100A20
	cmp r0, 0
	beq _08100A2A
	b _08100A6E
	.align 2, 0
_08100A1C: .4byte gUnknown_203ACEC
_08100A20:
	cmp r0, 0x2
	beq _08100A4C
	cmp r0, 0x3
	beq _08100A6A
	b _08100A6E
_08100A2A:
	bl sub_81013EC
	b _08100A42
_08100A30:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100A6E
	movs r0, 0x1
	movs r1, 0x2
	bl sub_81019B0
_08100A42:
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100A6E
_08100A4C:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _08100A6E
	bl sub_8101F04
	bl sub_810224C
	bl sub_8102394
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100A6A:
	movs r0, 0
	b _08100A70
_08100A6E:
	movs r0, 0x1
_08100A70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100A04

	thumb_func_start sub_8100A78
sub_8100A78: @ 8100A78
	push {r4,lr}
	ldr r4, _08100A90 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08100AA4
	cmp r0, 0x1
	bgt _08100A94
	cmp r0, 0
	beq _08100A9E
	b _08100AE0
	.align 2, 0
_08100A90: .4byte gUnknown_203ACEC
_08100A94:
	cmp r0, 0x2
	beq _08100AC2
	cmp r0, 0x3
	beq _08100ADC
	b _08100AE0
_08100A9E:
	bl sub_8101410
	b _08100AB8
_08100AA4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100AE0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	bl sub_81019B0
_08100AB8:
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100AE0
_08100AC2:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _08100AE0
	bl sub_810224C
	bl sub_8102394
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100ADC:
	movs r0, 0
	b _08100AE2
_08100AE0:
	movs r0, 0x1
_08100AE2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100A78

	thumb_func_start sub_8100AE8
sub_8100AE8: @ 8100AE8
	push {r4,r5,lr}
	ldr r5, _08100B00 @ =gUnknown_203ACEC
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08100B14
	cmp r0, 0x1
	bgt _08100B04
	cmp r0, 0
	beq _08100B0E
	b _08100B66
	.align 2, 0
_08100B00: .4byte gUnknown_203ACEC
_08100B04:
	cmp r0, 0x2
	beq _08100B44
	cmp r0, 0x3
	beq _08100B62
	b _08100B66
_08100B0E:
	bl sub_8101434
	b _08100B3A
_08100B14:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100B66
	bl sub_80FFE48
	adds r4, r0, 0
	bl sub_8101A48
	lsls r4, 24
	lsrs r4, 24
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_81019B0
_08100B3A:
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100B66
_08100B44:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _08100B66
	bl sub_8101F04
	bl sub_810224C
	bl sub_8102394
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100B62:
	movs r0, 0
	b _08100B68
_08100B66:
	movs r0, 0x1
_08100B68:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8100AE8

	thumb_func_start sub_8100B70
sub_8100B70: @ 8100B70
	push {r4,r5,lr}
	ldr r5, _08100B88 @ =gUnknown_203ACEC
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08100B9C
	cmp r0, 0x1
	bgt _08100B8C
	cmp r0, 0
	beq _08100B96
	b _08100BEA
	.align 2, 0
_08100B88: .4byte gUnknown_203ACEC
_08100B8C:
	cmp r0, 0x2
	beq _08100BCC
	cmp r0, 0x3
	beq _08100BE6
	b _08100BEA
_08100B96:
	bl sub_8101478
	b _08100BC2
_08100B9C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100BEA
	bl sub_80FFE48
	adds r4, r0, 0
	bl sub_8101A48
	lsls r4, 24
	lsrs r4, 24
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_81019B0
_08100BC2:
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100BEA
_08100BCC:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _08100BEA
	bl sub_810224C
	bl sub_8102394
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100BE6:
	movs r0, 0
	b _08100BEC
_08100BEA:
	movs r0, 0x1
_08100BEC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8100B70

	thumb_func_start sub_8100BF4
sub_8100BF4: @ 8100BF4
	push {r4,lr}
	ldr r4, _08100C50 @ =gUnknown_203ACEC
	movs r0, 0x98
	lsls r0, 5
	bl Alloc
	adds r2, r0, 0
	str r2, [r4]
	cmp r2, 0
	beq _08100C54
	movs r1, 0
	strh r1, [r2]
	movs r3, 0xB6
	lsls r3, 2
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	movs r0, 0x1
	b _08100C56
	.align 2, 0
_08100C50: .4byte gUnknown_203ACEC
_08100C54:
	movs r0, 0
_08100C56:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100BF4

	thumb_func_start sub_8100C5C
sub_8100C5C: @ 8100C5C
	push {lr}
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r1, 0xC1
	lsls r1, 6
	movs r0, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_8100C5C

	thumb_func_start sub_8100CBC
sub_8100CBC: @ 8100CBC
	push {r4,lr}
	bl ResetPaletteFade
	ldr r0, _08100D10 @ =gUnknown_8E99D8C
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08100D14 @ =gUnknown_843F76C
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08100D18 @ =gUnknown_843F78C
	movs r1, 0x40
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08100D1C @ =gUnknown_843F874
	movs r1, 0xA0
	movs r2, 0x8
	bl LoadPalette
	ldr r4, _08100D20 @ =gUnknown_843F87C
	adds r0, r4, 0
	movs r1, 0xB0
	movs r2, 0xA
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0x30
	movs r2, 0xA
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100D10: .4byte gUnknown_8E99D8C
_08100D14: .4byte gUnknown_843F76C
_08100D18: .4byte gUnknown_843F78C
_08100D1C: .4byte gUnknown_843F874
_08100D20: .4byte gUnknown_843F87C
	thumb_func_end sub_8100CBC

	thumb_func_start sub_8100D24
sub_8100D24: @ 8100D24
	push {r4,r5,lr}
	sub sp, 0x14
	bl sub_80FFCFC
	adds r5, r0, 0
	cmp r5, 0
	beq _08100D7A
	movs r0, 0x1
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	movs r4, 0x80
	subs r4, r0
	lsrs r4, 1
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	movs r0, 0x3
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x1
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8100DC4
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
_08100D7A:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8100D24

	thumb_func_start sub_8100D84
sub_8100D84: @ 8100D84
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r2, 0
	ldr r2, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r0, r2, 24
	lsls r4, 24
	lsrs r4, 24
	cmp r1, 0x1
	bne _08100DAC
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
_08100DAC:
	str r0, [sp]
	str r4, [sp, 0x4]
	ldr r0, [sp, 0x24]
	str r0, [sp, 0x8]
	adds r0, r5, 0
	adds r2, r6, 0
	bl AddTextPrinterParameterized
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8100D84

	thumb_func_start sub_8100DC4
sub_8100DC4: @ 8100DC4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	mov r9, r2
	ldr r2, [sp, 0x2C]
	ldr r4, [sp, 0x30]
	ldr r5, [sp, 0x34]
	ldr r6, [sp, 0x38]
	ldr r7, [sp, 0x3C]
	mov r8, r7
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r2, 24
	lsrs r3, r2, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r1, 0x1
	bne _08100E0A
	adds r0, r3, 0x2
	lsls r0, 24
	lsrs r3, r0, 24
_08100E0A:
	add r0, sp, 0xC
	strb r5, [r0]
	strb r6, [r0, 0x1]
	strb r2, [r0, 0x2]
	str r0, [sp]
	lsls r0, r4, 24
	asrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r9
	str r0, [sp, 0x8]
	mov r0, r12
	adds r2, r7, 0
	bl AddTextPrinterParameterized3
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8100DC4

	thumb_func_start sub_8100E34
sub_8100E34: @ 8100E34
	push {lr}
	sub sp, 0xC
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0xE0
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	movs r0, 0
	bl sub_8100E7C
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_8100E34

	thumb_func_start sub_8100E7C
sub_8100E7C: @ 8100E7C
	push {lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	movs r0, 0
	str r0, [sp, 0x10]
	str r0, [sp, 0xC]
	cmp r1, 0x1
	beq _08100EC2
	cmp r1, 0x1
	bgt _08100E9A
	cmp r1, 0
	beq _08100EA4
	b _08100ECA
_08100E9A:
	cmp r2, 0x2
	beq _08100EAE
	cmp r2, 0x3
	beq _08100EB8
	b _08100ECA
_08100EA4:
	add r1, sp, 0x10
	add r0, sp, 0xC
	bl sub_80FFD58
	b _08100ECA
_08100EAE:
	add r1, sp, 0x10
	add r0, sp, 0xC
	bl sub_80FFDC8
	b _08100ECA
_08100EB8:
	add r1, sp, 0x10
	add r0, sp, 0xC
	bl sub_80FFD90
	b _08100ECA
_08100EC2:
	add r1, sp, 0x10
	add r0, sp, 0xC
	bl sub_80FFDF4
_08100ECA:
	movs r0, 0x1
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, [sp, 0xC]
	cmp r2, 0
	beq _08100EEC
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r3, 0
	bl sub_8100D84
_08100EEC:
	ldr r2, [sp, 0x10]
	cmp r2, 0
	beq _08100F08
	movs r0, 0x10
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r3, 0
	bl sub_8100D84
_08100F08:
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x14
	pop {r0}
	bx r0
	thumb_func_end sub_8100E7C

	thumb_func_start sub_8100F18
sub_8100F18: @ 8100F18
	push {lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08100F40 @ =gUnknown_843F8D0
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r2, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08100F40: .4byte gUnknown_843F8D0
	thumb_func_end sub_8100F18

	thumb_func_start sub_8100F44
sub_8100F44: @ 8100F44
	push {r4,r5,lr}
	sub sp, 0x8
	bl sub_80FFCE0
	lsls r0, 24
	ldr r5, _08100FC0 @ =0xffffff00
	ldr r3, [sp]
	ands r3, r5
	movs r1, 0x3
	orrs r3, r1
	str r3, [sp]
	ldr r1, _08100FC4 @ =gUnknown_843F888
	lsrs r0, 22
	adds r0, r1
	ldrb r2, [r0]
	lsls r2, 8
	ldr r4, _08100FC8 @ =0xffff00ff
	adds r1, r4, 0
	ands r1, r3
	orrs r1, r2
	str r1, [sp]
	ldrb r2, [r0, 0x1]
	lsls r2, 16
	ldr r3, _08100FCC @ =0xff00ffff
	ands r3, r1
	orrs r3, r2
	str r3, [sp]
	ldrb r2, [r0, 0x2]
	lsls r2, 24
	ldr r1, _08100FD0 @ =0x00ffffff
	ands r1, r3
	orrs r1, r2
	str r1, [sp]
	ldrb r1, [r0, 0x3]
	ldr r0, [sp, 0x4]
	ands r0, r5
	orrs r0, r1
	ands r0, r4
	movs r1, 0xB0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _08100FD4 @ =0x0000ffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 15
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl AddWindow
	ldr r1, _08100FD8 @ =gUnknown_203ACEC
	ldr r1, [r1]
	strh r0, [r1, 0x2]
	lsls r0, 24
	lsrs r0, 24
	bl PutWindowTilemap
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100FC0: .4byte 0xffffff00
_08100FC4: .4byte gUnknown_843F888
_08100FC8: .4byte 0xffff00ff
_08100FCC: .4byte 0xff00ffff
_08100FD0: .4byte 0x00ffffff
_08100FD4: .4byte 0x0000ffff
_08100FD8: .4byte gUnknown_203ACEC
	thumb_func_end sub_8100F44

	thumb_func_start sub_8100FDC
sub_8100FDC: @ 8100FDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	bl sub_80FFD1C
	adds r4, r0, 0
	bl sub_80FFD34
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl sub_80FFD28
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	bl sub_80FFCE0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
	ldr r0, _0810101C @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r6, 0
	b _081010D6
	.align 2, 0
_0810101C: .4byte gUnknown_203ACEC
_08101020:
	ldr r0, _0810105C @ =gUnknown_203ACEC
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0xA
	movs r0, 0xFF
	strb r0, [r1, 0xA]
	adds r0, r2, 0
	ldr r1, _08101060 @ =gUnknown_843F8DB
	bl StringAppend
	adds r2, r0, 0
	movs r5, 0
	lsls r7, r6, 28
	adds r0, r6, 0x1
	mov r9, r0
	cmp r5, r8
	bge _081010B4
	ldr r0, _08101064 @ =0x0000ffff
	mov r10, r0
_08101046:
	ldrh r0, [r4]
	cmp r0, r10
	beq _08101068
	adds r1, r0, 0
	adds r0, r2, 0
	bl CopyEasyChatWord
	adds r2, r0, 0
	adds r4, 0x2
	b _08101096
	.align 2, 0
_0810105C: .4byte gUnknown_203ACEC
_08101060: .4byte gUnknown_843F8DB
_08101064: .4byte 0x0000ffff
_08101068:
	adds r0, r2, 0
	movs r1, 0
	movs r2, 0x4
	bl WriteColorChangeControlCode
	adds r2, r0, 0
	adds r4, 0x2
	movs r3, 0xF9
	movs r1, 0x9
	movs r0, 0x6
_0810107C:
	strb r3, [r2]
	adds r2, 0x1
	strb r1, [r2]
	adds r2, 0x1
	subs r0, 0x1
	cmp r0, 0
	bge _0810107C
	adds r0, r2, 0
	movs r1, 0
	movs r2, 0x2
	bl WriteColorChangeControlCode
	adds r2, r0, 0
_08101096:
	adds r0, r2, 0
	ldr r1, _081010F8 @ =gUnknown_843F8DB
	bl StringAppend
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	cmp r0, 0x2
	bne _081010AE
	cmp r5, 0
	bne _081010AE
	cmp r6, 0x4
	beq _081010B4
_081010AE:
	adds r5, 0x1
	cmp r5, r8
	blt _08101046
_081010B4:
	movs r0, 0xFF
	strb r0, [r2]
	ldr r0, _081010FC @ =gUnknown_203ACEC
	ldr r2, [r0]
	ldrb r0, [r2, 0x2]
	adds r2, 0xA
	lsrs r1, r7, 24
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl sub_8100D84
	mov r6, r9
_081010D6:
	ldr r0, [sp, 0xC]
	cmp r6, r0
	blt _08101020
	ldr r0, _081010FC @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081010F8: .4byte gUnknown_843F8DB
_081010FC: .4byte gUnknown_203ACEC
	thumb_func_end sub_8100FDC

	thumb_func_start sub_8101100
sub_8101100: @ 8101100
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	bl sub_80FFCE0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	str r0, [sp]
	ldr r2, _08101194 @ =0x01000200
	mov r0, sp
	mov r1, r8
	bl CpuFastSet
	cmp r5, 0x2
	bne _081011A4
	ldr r0, _08101198 @ =gUnknown_843F888
	adds r1, r0, 0
	adds r1, 0x8
	ldrb r5, [r0, 0x8]
	ldrb r0, [r1, 0x2]
	adds r4, r5, r0
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x3]
	adds r0, r2
	mov r12, r0
	adds r7, r2, 0
	cmp r7, r12
	blt _08101144
	b _08101296
_08101144:
	adds r3, r5, 0
	lsls r0, r3, 1
	mov r9, r0
_0810114A:
	subs r6, r3, 0x1
	lsls r0, r7, 5
	adds r1, r0, r6
	lsls r1, 1
	add r1, r8
	ldr r5, _0810119C @ =0x00001005
	adds r2, r5, 0
	strh r2, [r1]
	adds r6, r3, 0
	adds r5, r0, 0
	adds r2, r7, 0x1
	cmp r6, r4
	bge _0810117E
	movs r0, 0x80
	lsls r0, 5
	adds r1, r0, 0
	lsls r0, r7, 6
	add r0, r8
	add r0, r9
	subs r6, r4, r6
_08101172:
	strh r1, [r0]
	adds r0, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _08101172
	adds r6, r4, 0
_0810117E:
	adds r0, r5, r6
	lsls r0, 1
	add r0, r8
	ldr r5, _081011A0 @ =0x00001007
	adds r1, r5, 0
	strh r1, [r0]
	adds r7, r2, 0
	cmp r7, r12
	blt _0810114A
	b _08101296
	.align 2, 0
_08101194: .4byte 0x01000200
_08101198: .4byte gUnknown_843F888
_0810119C: .4byte 0x00001005
_081011A0: .4byte 0x00001007
_081011A4:
	ldr r6, _081012A8 @ =gUnknown_843F888
	mov r9, r6
	lsls r5, 2
	adds r1, r5, r6
	ldrb r3, [r1, 0x1]
	subs r7, r3, 0x1
	ldrb r2, [r1]
	subs r6, r2, 0x1
	ldrb r0, [r1, 0x2]
	adds r4, r2, r0
	ldrb r0, [r1, 0x3]
	adds r3, r0
	mov r12, r3
	lsls r0, r7, 5
	adds r0, r6
	lsls r0, 1
	add r0, r8
	ldr r3, _081012AC @ =0x00001001
	adds r1, r3, 0
	strh r1, [r0]
	adds r6, r2, 0
	mov r10, r9
	mov r9, r5
	cmp r6, r4
	bge _081011F0
	ldr r5, _081012B0 @ =0x00001002
	adds r2, r5, 0
	lsls r1, r6, 1
	lsls r0, r7, 6
	add r0, r8
	adds r1, r0
	subs r6, r4, r6
_081011E4:
	strh r2, [r1]
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _081011E4
	adds r6, r4, 0
_081011F0:
	lsls r0, r7, 5
	adds r0, r6
	lsls r0, 1
	add r0, r8
	ldr r6, _081012B4 @ =0x00001003
	adds r1, r6, 0
	strh r1, [r0]
	adds r7, 0x1
	cmp r7, r12
	bge _08101252
	ldr r0, _081012A8 @ =gUnknown_843F888
	add r0, r9
	ldrb r3, [r0]
	lsls r5, r3, 1
_0810120C:
	subs r6, r3, 0x1
	lsls r0, r7, 5
	adds r0, r6
	lsls r0, 1
	add r0, r8
	ldr r2, _081012B8 @ =0x00001005
	adds r1, r2, 0
	strh r1, [r0]
	adds r6, r3, 0
	adds r2, r7, 0x1
	cmp r6, r4
	bge _0810123E
	movs r0, 0x80
	lsls r0, 5
	adds r1, r0, 0
	lsls r0, r7, 6
	add r0, r8
	adds r0, r5, r0
	subs r6, r4, r6
_08101232:
	strh r1, [r0]
	adds r0, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _08101232
	adds r6, r4, 0
_0810123E:
	lsls r0, r7, 5
	adds r0, r6
	lsls r0, 1
	add r0, r8
	ldr r6, _081012BC @ =0x00001007
	adds r1, r6, 0
	strh r1, [r0]
	adds r7, r2, 0
	cmp r7, r12
	blt _0810120C
_08101252:
	mov r0, r9
	add r0, r10
	ldrb r3, [r0]
	subs r6, r3, 0x1
	lsls r2, r7, 5
	adds r0, r2, r6
	lsls r0, 1
	add r0, r8
	ldr r5, _081012C0 @ =0x00001009
	adds r1, r5, 0
	strh r1, [r0]
	adds r6, r3, 0
	adds r5, r2, 0
	cmp r6, r4
	bge _0810128A
	ldr r0, _081012C4 @ =0x0000100a
	adds r2, r0, 0
	lsls r1, r6, 1
	lsls r0, r7, 6
	add r0, r8
	adds r0, r1, r0
	subs r6, r4, r6
_0810127E:
	strh r2, [r0]
	adds r0, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _0810127E
	adds r6, r4, 0
_0810128A:
	adds r0, r5, r6
	lsls r0, 1
	add r0, r8
	ldr r2, _081012C8 @ =0x0000100b
	adds r1, r2, 0
	strh r1, [r0]
_08101296:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081012A8: .4byte gUnknown_843F888
_081012AC: .4byte 0x00001001
_081012B0: .4byte 0x00001002
_081012B4: .4byte 0x00001003
_081012B8: .4byte 0x00001005
_081012BC: .4byte 0x00001007
_081012C0: .4byte 0x00001009
_081012C4: .4byte 0x0000100a
_081012C8: .4byte 0x0000100b
	thumb_func_end sub_8101100

	thumb_func_start sub_81012CC
sub_81012CC: @ 81012CC
	push {lr}
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	pop {r0}
	bx r0
	thumb_func_end sub_81012CC

	thumb_func_start sub_81012E0
sub_81012E0: @ 81012E0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_810198C
	movs r0, 0x2
	movs r1, 0x11
	bl FillWindowPixelBuffer
	cmp r4, 0x1
	beq _08101304
	cmp r4, 0x1
	bcc _081012FE
	cmp r4, 0x2
	beq _0810130A
	b _0810130E
_081012FE:
	bl sub_810133C
	b _0810130E
_08101304:
	bl sub_81013A0
	b _0810130E
_0810130A:
	bl sub_81013DC
_0810130E:
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81012E0

	thumb_func_start sub_810131C
sub_810131C: @ 810131C
	push {lr}
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _08101330
	movs r0, 0
	bl sub_81012E0
	b _08101336
_08101330:
	movs r0, 0x1
	bl sub_81012E0
_08101336:
	pop {r0}
	bx r0
	thumb_func_end sub_810131C

	thumb_func_start sub_810133C
sub_810133C: @ 810133C
	push {r4-r7,lr}
	sub sp, 0xC
	movs r5, 0
	movs r7, 0x60
_08101344:
	movs r4, 0
	lsls r0, r7, 24
	lsrs r6, r0, 24
_0810134A:
	lsls r0, r5, 24
	lsrs r0, 24
	adds r5, 0x1
	bl sub_80BDF44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x16
	beq _0810138A
	bl sub_80BDFB0
	adds r2, r0, 0
	movs r0, 0x54
	adds r3, r4, 0
	muls r3, r0
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x1
	bl sub_8100D84
	adds r4, 0x1
	cmp r4, 0x1
	ble _0810134A
	adds r7, 0x10
	b _08101344
_0810138A:
	bl sub_80FFE28
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_81019B0
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810133C

	thumb_func_start sub_81013A0
sub_81013A0: @ 81013A0
	push {r4-r6,lr}
	sub sp, 0xC
	movs r5, 0
	movs r4, 0xC0
	lsls r4, 23
	ldr r6, _081013D8 @ =gUnknown_843F8E0
_081013AC:
	ldm r6!, {r2}
	lsrs r0, r4, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x1
	movs r3, 0xA
	bl sub_8100D84
	movs r0, 0x80
	lsls r0, 21
	adds r4, r0
	adds r5, 0x1
	cmp r5, 0x3
	bls _081013AC
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081013D8: .4byte gUnknown_843F8E0
	thumb_func_end sub_81013A0

	thumb_func_start sub_81013DC
sub_81013DC: @ 81013DC
	push {lr}
	movs r0, 0
	movs r1, 0x4
	bl sub_81014AC
	pop {r0}
	bx r0
	thumb_func_end sub_81013DC

	thumb_func_start sub_81013EC
sub_81013EC: @ 81013EC
	push {r4,lr}
	bl sub_80FFE48
	adds r4, r0, 0
	adds r4, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8101558
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81014AC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81013EC

	thumb_func_start sub_8101410
sub_8101410: @ 8101410
	push {r4,lr}
	bl sub_80FFE48
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8101558
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81014AC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101410

	thumb_func_start sub_8101434
sub_8101434: @ 8101434
	push {r4,r5,lr}
	bl sub_80FFE48
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	adds r0, r5, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80FFE54
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bls _08101456
	adds r4, r0, 0
_08101456:
	cmp r5, r4
	bcs _08101470
	subs r4, r5
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8101558
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81014AC
_08101470:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8101434

	thumb_func_start sub_8101478
sub_8101478: @ 8101478
	push {r4,r5,lr}
	bl sub_80FFE48
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8101A48
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcs _081014A4
	subs r4, r0, r5
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8101558
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81014AC
_081014A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8101478

	thumb_func_start sub_81014AC
sub_81014AC: @ 81014AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r4, r0, 1
	lsls r0, 4
	adds r1, r0, 0
	adds r1, 0x60
	movs r0, 0xFF
	ands r1, r0
	movs r0, 0
	cmp r0, r10
	bge _08101538
	ldr r2, _08101550 @ =gUnknown_203ACEC
	mov r9, r2
_081014D8:
	movs r5, 0
	movs r2, 0x10
	adds r2, r1
	mov r8, r2
	adds r7, r0, 0x1
	lsls r0, r1, 24
	lsrs r6, r0, 24
_081014E6:
	lsls r0, r4, 16
	lsrs r0, 16
	adds r4, 0x1
	bl sub_80BE19C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _08101554 @ =0x0000ffff
	cmp r1, r0
	beq _0810152A
	mov r2, r9
	ldr r0, [r2]
	adds r0, 0xCB
	movs r2, 0
	bl CopyEasyChatWordPadded
	mov r0, r9
	ldr r2, [r0]
	adds r2, 0xCB
	movs r0, 0xD
	adds r3, r5, 0
	muls r3, r0
	adds r3, 0x3
	lsls r3, 27
	lsrs r3, 24
	str r6, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x1
	bl sub_8100D84
_0810152A:
	adds r5, 0x1
	cmp r5, 0x1
	ble _081014E6
	mov r1, r8
	adds r0, r7, 0
	cmp r0, r10
	blt _081014D8
_08101538:
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101550: .4byte gUnknown_203ACEC
_08101554: .4byte 0x0000ffff
	thumb_func_end sub_81014AC

	thumb_func_start sub_8101558
sub_8101558: @ 8101558
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsls r1, 24
	lsrs r0, 20
	adds r3, r0, 0
	adds r3, 0x60
	movs r0, 0xFF
	ands r3, r0
	lsrs r0, r1, 20
	adds r1, r3, r0
	cmp r1, 0xFF
	ble _08101584
	ldr r0, _08101580 @ =0xffffff00
	adds r4, r1, r0
	movs r0, 0x80
	lsls r0, 1
	subs r0, r3
	b _08101586
	.align 2, 0
_08101580: .4byte 0xffffff00
_08101584:
	movs r4, 0
_08101586:
	movs r5, 0xE0
	str r5, [sp]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0x11
	movs r2, 0
	bl FillWindowPixelRect
	cmp r4, 0
	beq _081015B2
	str r5, [sp]
	lsls r0, r4, 16
	lsrs r0, 16
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0x11
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
_081015B2:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8101558

	thumb_func_start sub_81015BC
sub_81015BC: @ 81015BC
	push {lr}
	movs r0, 0x2
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_81015BC

	thumb_func_start sub_81015D4
sub_81015D4: @ 81015D4
	push {lr}
	ldr r1, _081015E8 @ =gUnknown_203ACEC
	cmp r0, 0x6
	bhi _0810168E
	lsls r0, 2
	ldr r1, _081015EC @ =_081015F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081015E8: .4byte gUnknown_203ACEC
_081015EC: .4byte _081015F0
	.align 2, 0
_081015F0:
	.4byte _0810160C
	.4byte _08101620
	.4byte _08101630
	.4byte _08101644
	.4byte _08101658
	.4byte _0810166C
	.4byte _08101680
_0810160C:
	ldr r1, _0810161C @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0xA
	b _0810168C
	.align 2, 0
_0810161C: .4byte gUnknown_203ACEC
_08101620:
	ldr r1, _0810162C @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x9
	b _0810164C
	.align 2, 0
_0810162C: .4byte gUnknown_203ACEC
_08101630:
	ldr r1, _08101640 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0xB
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0x11
	b _0810168C
	.align 2, 0
_08101640: .4byte gUnknown_203ACEC
_08101644:
	ldr r1, _08101654 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x11
_0810164C:
	strb r0, [r2, 0x6]
	ldr r0, [r1]
	strb r3, [r0, 0x7]
	b _0810168E
	.align 2, 0
_08101654: .4byte gUnknown_203ACEC
_08101658:
	ldr r1, _08101668 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0x11
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0xA
	b _0810168C
	.align 2, 0
_08101668: .4byte gUnknown_203ACEC
_0810166C:
	ldr r1, _0810167C @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0x12
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0x16
	b _0810168C
	.align 2, 0
_0810167C: .4byte gUnknown_203ACEC
_08101680:
	ldr r1, _081016A8 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0x16
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0x12
_0810168C:
	strb r0, [r2, 0x7]
_0810168E:
	ldr r1, [r1]
	ldrb r0, [r1, 0x6]
	movs r3, 0x1
	negs r3, r3
	adds r2, r3, 0
	ldrb r3, [r1, 0x7]
	cmp r0, r3
	bcs _081016A0
	movs r2, 0x1
_081016A0:
	strb r2, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_081016A8: .4byte gUnknown_203ACEC
	thumb_func_end sub_81015D4

	thumb_func_start sub_81016AC
sub_81016AC: @ 81016AC
	push {r4,lr}
	ldr r4, _081016D8 @ =gUnknown_203ACEC
	ldr r1, [r4]
	ldrb r2, [r1, 0x6]
	ldrb r0, [r1, 0x7]
	cmp r2, r0
	beq _081016DC
	ldrb r0, [r1, 0x8]
	adds r0, r2, r0
	strb r0, [r1, 0x6]
	ldr r0, [r4]
	ldrb r0, [r0, 0x6]
	bl sub_81016E4
	ldr r0, [r4]
	ldrb r1, [r0, 0x6]
	ldrb r0, [r0, 0x7]
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	b _081016DE
	.align 2, 0
_081016D8: .4byte gUnknown_203ACEC
_081016DC:
	movs r0, 0
_081016DE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81016AC

	thumb_func_start sub_81016E4
sub_81016E4: @ 81016E4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0xA
	bl FillBgTilemapBufferRect_Palette0
	cmp r4, 0x16
	bls _08101706
	b _08101822
_08101706:
	lsls r0, r4, 2
	ldr r1, _08101710 @ =_08101714
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08101710: .4byte _08101714
	.align 2, 0
_08101714:
	.4byte _08101822
	.4byte _08101770
	.4byte _08101778
	.4byte _08101780
	.4byte _08101788
	.4byte _08101790
	.4byte _08101798
	.4byte _08101808
	.4byte _081017FA
	.4byte _081017EC
	.4byte _081017DE
	.4byte _081017A6
	.4byte _081017AE
	.4byte _081017B6
	.4byte _081017BE
	.4byte _081017C6
	.4byte _081017CE
	.4byte _081017D6
	.4byte _081017DE
	.4byte _081017EC
	.4byte _081017FA
	.4byte _08101808
	.4byte _08101816
_08101770:
	movs r0, 0xB
	movs r1, 0xE
	movs r2, 0x3
	b _0810179E
_08101778:
	movs r0, 0x9
	movs r1, 0xE
	movs r2, 0x7
	b _0810179E
_08101780:
	movs r0, 0x7
	movs r1, 0xE
	movs r2, 0xB
	b _0810179E
_08101788:
	movs r0, 0x5
	movs r1, 0xE
	movs r2, 0xF
	b _0810179E
_08101790:
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x13
	b _0810179E
_08101798:
	movs r0, 0x1
	movs r1, 0xE
	movs r2, 0x17
_0810179E:
	movs r3, 0x2
	bl sub_8101830
	b _08101822
_081017A6:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x18
	b _081017E4
_081017AE:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x19
	b _081017E4
_081017B6:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1A
	b _081017E4
_081017BE:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1B
	b _081017E4
_081017C6:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	b _081017E4
_081017CE:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1D
	b _081017E4
_081017D6:
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x1E
	b _081017E4
_081017DE:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x17
_081017E4:
	movs r3, 0xA
	bl sub_8101830
	b _08101822
_081017EC:
	movs r0, 0x1
	movs r1, 0xB
	movs r2, 0x17
	movs r3, 0x8
	bl sub_8101830
	b _08101822
_081017FA:
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x17
	movs r3, 0x6
	bl sub_8101830
	b _08101822
_08101808:
	movs r0, 0x1
	movs r1, 0xD
	movs r2, 0x17
	movs r3, 0x4
	bl sub_8101830
	b _08101822
_08101816:
	movs r0, 0x1
	movs r1, 0xE
	movs r2, 0x17
	movs r3, 0x2
	bl sub_8101830
_08101822:
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81016E4

	thumb_func_start sub_8101830
sub_8101830: @ 8101830
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r12, r0
	adds r7, r1, 0
	mov r9, r2
	mov r10, r3
	ldr r0, _08101968 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 2
	adds r6, r0, r1
	mov r0, r12
	add r0, r9
	subs r5, r0, 0x1
	adds r0, r7, r3
	subs r0, 0x1
	mov r8, r0
	mov r2, r12
	adds r3, r7, 0
	lsls r0, r3, 5
	adds r0, r2
	lsls r0, 1
	adds r0, r6
	ldr r4, _0810196C @ =0x00004001
	adds r1, r4, 0
	strh r1, [r0]
	adds r2, 0x1
	cmp r2, r5
	bge _0810188C
	ldr r0, _08101970 @ =0x00004002
	adds r4, r0, 0
	lsls r1, r2, 1
	lsls r0, r3, 6
	adds r0, r6
	adds r1, r0
	subs r2, r5, r2
_08101880:
	strh r4, [r1]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _08101880
	adds r2, r5, 0
_0810188C:
	lsls r0, r3, 5
	adds r0, r2
	lsls r0, 1
	adds r0, r6
	ldr r2, _08101974 @ =0x00004003
	adds r1, r2, 0
	strh r1, [r0]
	adds r3, 0x1
	mov r4, r12
	adds r4, 0x1
	adds r0, r7, 0x1
	str r0, [sp, 0x4]
	mov r1, r9
	subs r1, 0x2
	str r1, [sp]
	movs r2, 0x2
	negs r2, r2
	add r10, r2
	cmp r3, r8
	bge _081018FC
	lsls r7, r4, 1
	mov r9, r7
_081018B8:
	lsls r0, r3, 5
	add r0, r12
	lsls r0, 1
	adds r0, r6
	ldr r2, _08101978 @ =0x00004005
	adds r1, r2, 0
	strh r1, [r0]
	adds r2, r4, 0
	adds r7, r3, 0x1
	cmp r4, r5
	bge _081018E8
	movs r0, 0x80
	lsls r0, 7
	adds r1, r0, 0
	lsls r0, r3, 6
	adds r0, r6
	add r0, r9
	subs r2, r5, r4
_081018DC:
	strh r1, [r0]
	adds r0, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _081018DC
	adds r2, r5, 0
_081018E8:
	lsls r0, r3, 5
	adds r0, r2
	lsls r0, 1
	adds r0, r6
	ldr r2, _0810197C @ =0x00004007
	adds r1, r2, 0
	strh r1, [r0]
	adds r3, r7, 0
	cmp r3, r8
	blt _081018B8
_081018FC:
	lsls r0, r3, 5
	mov r7, r12
	adds r1, r0, r7
	lsls r1, 1
	adds r1, r6
	ldr r7, _08101980 @ =0x00004009
	adds r2, r7, 0
	strh r2, [r1]
	adds r2, r4, 0
	mov r12, r0
	cmp r4, r5
	bge _0810192E
	ldr r0, _08101984 @ =0x0000400a
	adds r7, r0, 0
	lsls r1, r4, 1
	lsls r0, r3, 6
	adds r0, r6
	adds r0, r1, r0
	subs r2, r5, r4
_08101922:
	strh r7, [r0]
	adds r0, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _08101922
	adds r2, r5, 0
_0810192E:
	mov r1, r12
	adds r0, r1, r2
	lsls r0, 1
	adds r0, r6
	ldr r2, _08101988 @ =0x0000400b
	adds r1, r2, 0
	strh r1, [r0]
	lsls r0, r4, 27
	lsrs r0, 24
	ldr r3, [sp, 0x4]
	lsls r1, r3, 27
	lsrs r1, 24
	ldr r4, [sp]
	lsls r2, r4, 27
	lsrs r2, 24
	mov r7, r10
	lsls r3, r7, 27
	lsrs r3, 24
	bl sub_8101A5C
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101968: .4byte gUnknown_203ACEC
_0810196C: .4byte 0x00004001
_08101970: .4byte 0x00004002
_08101974: .4byte 0x00004003
_08101978: .4byte 0x00004005
_0810197C: .4byte 0x00004007
_08101980: .4byte 0x00004009
_08101984: .4byte 0x0000400a
_08101988: .4byte 0x0000400b
	thumb_func_end sub_8101830

	thumb_func_start sub_810198C
sub_810198C: @ 810198C
	push {lr}
	movs r1, 0x80
	lsls r1, 4
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgY
	ldr r0, _081019AC @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xB3
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_081019AC: .4byte gUnknown_203ACEC
	thumb_func_end sub_810198C

	thumb_func_start sub_81019B0
sub_81019B0: @ 81019B0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0x2
	bl GetBgY
	adds r2, r0, 0
	ldr r0, _081019FC @ =gUnknown_203ACEC
	ldr r3, [r0]
	movs r0, 0xB3
	lsls r0, 2
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, r4
	strh r0, [r1]
	lsls r4, 20
	asrs r4, 16
	lsls r0, r4, 8
	adds r2, r0
	cmp r5, 0
	beq _08101A00
	movs r1, 0xB4
	lsls r1, 2
	adds r0, r3, r1
	str r2, [r0]
	movs r0, 0xB5
	lsls r0, 2
	adds r1, r3, r0
	lsls r0, r5, 8
	str r0, [r1]
	cmp r4, 0
	bge _08101A0A
	negs r0, r0
	str r0, [r1]
	b _08101A0A
	.align 2, 0
_081019FC: .4byte gUnknown_203ACEC
_08101A00:
	movs r0, 0x2
	adds r1, r2, 0
	movs r2, 0
	bl ChangeBgY
_08101A0A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81019B0

	thumb_func_start sub_8101A10
sub_8101A10: @ 8101A10
	push {lr}
	movs r0, 0x2
	bl GetBgY
	ldr r1, _08101A3C @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r3, 0xB4
	lsls r3, 2
	adds r1, r2, r3
	ldr r1, [r1]
	cmp r0, r1
	beq _08101A40
	movs r1, 0xB5
	lsls r1, 2
	adds r0, r2, r1
	ldr r1, [r0]
	movs r0, 0x2
	movs r2, 0x1
	bl ChangeBgY
	movs r0, 0x1
	b _08101A42
	.align 2, 0
_08101A3C: .4byte gUnknown_203ACEC
_08101A40:
	movs r0, 0
_08101A42:
	pop {r1}
	bx r1
	thumb_func_end sub_8101A10

	thumb_func_start sub_8101A48
sub_8101A48: @ 8101A48
	ldr r0, _08101A58 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xB3
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08101A58: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101A48

	thumb_func_start sub_8101A5C
sub_8101A5C: @ 8101A5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, r0, 8
	adds r0, r2
	orrs r4, r0
	lsls r5, r1, 8
	adds r1, r3
	orrs r5, r1
	movs r0, 0x40
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x44
	adds r1, r5, 0
	bl SetGpuReg
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8101A5C

	thumb_func_start sub_8101A90
sub_8101A90: @ 8101A90
	push {r4,r5,lr}
	ldr r0, _08101AB8 @ =gUnknown_843F8F0
	bl LoadSpriteSheets
	ldr r0, _08101ABC @ =gUnknown_843F910
	bl LoadSpritePalettes
	movs r5, 0
	ldr r4, _08101AC0 @ =gUnknown_843F938
_08101AA2:
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x3
	bls _08101AA2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08101AB8: .4byte gUnknown_843F8F0
_08101ABC: .4byte gUnknown_843F910
_08101AC0: .4byte gUnknown_843F938
	thumb_func_end sub_8101A90

	thumb_func_start sub_8101AC4
sub_8101AC4: @ 8101AC4
	push {lr}
	bl sub_80FFCE0
	lsls r0, 24
	ldr r1, _08101B10 @ =gUnknown_843F888
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 19
	ldrb r2, [r0, 0x1]
	adds r2, 0x1
	lsls r2, 3
	adds r2, 0x1
	ldr r0, _08101B14 @ =gUnknown_843F968
	movs r3, 0xD0
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08101B18 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r1, 0xB6
	lsls r1, 2
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08101B1C @ =gSprites
	adds r1, r0
	str r1, [r2]
	movs r0, 0x1
	strh r0, [r1, 0x30]
	pop {r0}
	bx r0
	.align 2, 0
_08101B10: .4byte gUnknown_843F888
_08101B14: .4byte gUnknown_843F968
_08101B18: .4byte gUnknown_203ACEC
_08101B1C: .4byte gSprites
	thumb_func_end sub_8101AC4

	thumb_func_start sub_8101B20
sub_8101B20: @ 8101B20
	push {lr}
	adds r1, r0, 0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08101B4E
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08101B4E
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _08101B4E
	ldr r0, _08101B54 @ =0x0000fffa
	strh r0, [r1, 0x24]
_08101B4E:
	pop {r0}
	bx r0
	.align 2, 0
_08101B54: .4byte 0x0000fffa
	thumb_func_end sub_8101B20

	thumb_func_start sub_8101B58
sub_8101B58: @ 8101B58
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08101B84 @ =gUnknown_203ACEC
	ldr r2, [r2]
	movs r3, 0xB6
	lsls r3, 2
	adds r2, r3
	ldr r3, [r2]
	movs r4, 0
	strh r0, [r3, 0x20]
	ldr r0, [r2]
	strh r1, [r0, 0x22]
	ldr r0, [r2]
	strh r4, [r0, 0x24]
	ldr r0, [r2]
	strh r4, [r0, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101B84: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101B58

	thumb_func_start sub_8101B88
sub_8101B88: @ 8101B88
	ldr r0, _08101BA4 @ =gUnknown_203ACEC
	ldr r1, [r0]
	movs r0, 0xB6
	lsls r0, 2
	adds r1, r0
	ldr r0, [r1]
	movs r2, 0
	strh r2, [r0, 0x2E]
	ldr r0, [r1]
	strh r2, [r0, 0x30]
	ldr r0, [r1]
	strh r2, [r0, 0x24]
	bx lr
	.align 2, 0
_08101BA4: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101B88

	thumb_func_start sub_8101BA8
sub_8101BA8: @ 8101BA8
	ldr r0, _08101BBC @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xB6
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x30]
	bx lr
	.align 2, 0
_08101BBC: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101BA8

	thumb_func_start sub_8101BC0
sub_8101BC0: @ 8101BC0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r6, _08101C38 @ =gUnknown_843F9B8
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08101C3C @ =gUnknown_203ACEC
	ldr r2, [r5]
	movs r1, 0xB7
	lsls r1, 2
	mov r8, r1
	add r2, r8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _08101C40 @ =gSprites
	adds r1, r4
	str r1, [r2]
	movs r0, 0x20
	strh r0, [r1, 0x24]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	movs r1, 0xB8
	lsls r1, 2
	adds r3, r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r3]
	ldr r0, _08101C44 @ =0x0000ffe0
	strh r0, [r1, 0x24]
	add r2, r8
	ldr r1, [r2]
	adds r1, 0x3F
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	bl sub_8101C80
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101C38: .4byte gUnknown_843F9B8
_08101C3C: .4byte gUnknown_203ACEC
_08101C40: .4byte gSprites
_08101C44: .4byte 0x0000ffe0
	thumb_func_end sub_8101BC0

	thumb_func_start sub_8101C48
sub_8101C48: @ 8101C48
	push {r4-r6,lr}
	ldr r5, _08101C7C @ =gUnknown_203ACEC
	ldr r0, [r5]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	adds r4, r0, r4
	movs r6, 0
	str r6, [r4]
	movs r4, 0xB8
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	adds r0, r4
	str r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101C7C: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101C48

	thumb_func_start sub_8101C80
sub_8101C80: @ 8101C80
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08101CC8 @ =gUnknown_203ACEC
	ldr r1, [r0]
	movs r2, 0xB7
	lsls r2, 2
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08101CDC
	adds r2, 0x4
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08101CDC
	mov r4, sp
	adds r4, 0x1
	mov r0, sp
	adds r1, r4, 0
	bl sub_80FFE08
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _08101CCC
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	bl sub_8101CE4
	b _08101CDC
	.align 2, 0
_08101CC8: .4byte gUnknown_203ACEC
_08101CCC:
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	bl sub_8101D9C
_08101CDC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101C80

	thumb_func_start sub_8101CE4
sub_8101CE4: @ 8101CE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r0, 24
	asrs r5, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _08101D48
	ldr r0, _08101D44 @ =gUnknown_203ACEC
	mov r8, r0
	ldr r0, [r0]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	mov r2, r8
	ldr r1, [r2]
	adds r4, r1, r4
	ldr r2, [r4]
	movs r0, 0x54
	muls r5, r0
	adds r5, 0x3A
	strh r5, [r2, 0x20]
	ldr r0, [r4]
	lsls r4, r7, 24
	asrs r4, 20
	adds r4, 0x60
	strh r4, [r0, 0x22]
	movs r6, 0xB8
	lsls r6, 2
	adds r1, r6
	ldr r0, [r1]
	movs r1, 0
	bl StartSpriteAnim
	mov r1, r8
	ldr r0, [r1]
	adds r0, r6
	ldr r1, [r0]
	strh r5, [r1, 0x20]
	b _08101D8A
	.align 2, 0
_08101D44: .4byte gUnknown_203ACEC
_08101D48:
	ldr r6, _08101D98 @ =gUnknown_203ACEC
	ldr r0, [r6]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r6]
	adds r4, r1, r4
	ldr r0, [r4]
	movs r2, 0xD8
	mov r8, r2
	mov r2, r8
	strh r2, [r0, 0x20]
	ldr r0, [r4]
	lsls r4, r7, 24
	asrs r4, 20
	adds r4, 0x70
	strh r4, [r0, 0x22]
	movs r5, 0xB8
	lsls r5, 2
	adds r1, r5
	ldr r0, [r1]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r6]
	adds r0, r5
	ldr r1, [r0]
	mov r2, r8
	strh r2, [r1, 0x20]
_08101D8A:
	ldr r0, [r0]
	strh r4, [r0, 0x22]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101D98: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101CE4

	thumb_func_start sub_8101D9C
sub_8101D9C: @ 8101D9C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsrs r4, r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _08101E2C
	lsls r0, r5, 24
	asrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, 0x60
	mov r8, r0
	movs r7, 0x20
	cmp r2, 0x6
	bne _08101DCE
	cmp r1, 0
	bne _08101DCE
	movs r7, 0x9D
	movs r6, 0x2
	b _08101DE4
_08101DCE:
	ldr r3, _08101E24 @ =gUnknown_843F958
	lsls r1, r4, 24
	lsrs r0, r1, 24
	movs r2, 0
	cmp r0, 0x6
	bhi _08101DDC
	asrs r2, r1, 24
_08101DDC:
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r7, r0
	movs r6, 0x3
_08101DE4:
	ldr r5, _08101E28 @ =gUnknown_203ACEC
	ldr r0, [r5]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	adds r1, r6, 0
	bl StartSpriteAnim
	ldr r1, [r5]
	adds r4, r1, r4
	ldr r0, [r4]
	strh r7, [r0, 0x20]
	ldr r0, [r4]
	mov r2, r8
	strh r2, [r0, 0x22]
	movs r4, 0xB8
	lsls r4, 2
	adds r1, r4
	ldr r0, [r1]
	adds r1, r6, 0
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, r4
	ldr r1, [r0]
	strh r7, [r1, 0x20]
	ldr r0, [r0]
	mov r1, r8
	strh r1, [r0, 0x22]
	b _08101E72
	.align 2, 0
_08101E24: .4byte gUnknown_843F958
_08101E28: .4byte gUnknown_203ACEC
_08101E2C:
	ldr r6, _08101E7C @ =gUnknown_203ACEC
	ldr r0, [r6]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r6]
	adds r4, r1, r4
	ldr r0, [r4]
	movs r2, 0xD8
	mov r8, r2
	mov r2, r8
	strh r2, [r0, 0x20]
	ldr r0, [r4]
	lsls r4, r5, 24
	asrs r4, 20
	adds r4, 0x70
	strh r4, [r0, 0x22]
	movs r5, 0xB8
	lsls r5, 2
	adds r1, r5
	ldr r0, [r1]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r6]
	adds r0, r5
	ldr r1, [r0]
	mov r2, r8
	strh r2, [r1, 0x20]
	ldr r0, [r0]
	strh r4, [r0, 0x22]
_08101E72:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101E7C: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101D9C

	thumb_func_start sub_8101E80
sub_8101E80: @ 8101E80
	push {lr}
	ldr r0, _08101EC4 @ =gUnknown_843F968
	movs r1, 0
	movs r2, 0
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08101EC8 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r1, 0xB9
	lsls r1, 2
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08101ECC @ =gSprites
	adds r1, r0
	str r1, [r2]
	ldr r0, _08101ED0 @ =sub_8101ED4
	str r0, [r1, 0x1C]
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	bl sub_8101F04
	pop {r0}
	bx r0
	.align 2, 0
_08101EC4: .4byte gUnknown_843F968
_08101EC8: .4byte gUnknown_203ACEC
_08101ECC: .4byte gSprites
_08101ED0: .4byte sub_8101ED4
	thumb_func_end sub_8101E80

	thumb_func_start sub_8101ED4
sub_8101ED4: @ 8101ED4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08101EFA
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _08101EFA
	ldr r0, _08101F00 @ =0x0000fffa
	strh r0, [r1, 0x24]
_08101EFA:
	pop {r0}
	bx r0
	.align 2, 0
_08101F00: .4byte 0x0000fffa
	thumb_func_end sub_8101ED4

	thumb_func_start sub_8101F04
sub_8101F04: @ 8101F04
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x1
	mov r0, sp
	adds r1, r4, 0
	bl sub_80FFE34
	mov r0, sp
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xD
	muls r0, r1
	adds r0, 0x3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r1, 25
	movs r2, 0xB0
	lsls r2, 20
	adds r1, r2
	lsrs r1, 24
	bl sub_8101F40
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101F04

	thumb_func_start sub_8101F40
sub_8101F40: @ 8101F40
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _08101F7C @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xB9
	lsls r1, 2
	adds r3, r0, r1
	ldr r1, [r3]
	cmp r1, 0
	beq _08101F74
	lsls r0, r2, 3
	adds r0, 0x4
	movs r2, 0
	strh r0, [r1, 0x20]
	ldr r1, [r3]
	adds r0, r4, 0x1
	lsls r0, 3
	adds r0, 0x1
	strh r0, [r1, 0x22]
	ldr r0, [r3]
	strh r2, [r0, 0x24]
	ldr r0, [r3]
	strh r2, [r0, 0x2E]
_08101F74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101F7C: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101F40

	thumb_func_start sub_8101F80
sub_8101F80: @ 8101F80
	push {r4,lr}
	ldr r4, _08101FA8 @ =gUnknown_203ACEC
	ldr r0, [r4]
	movs r1, 0xB9
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _08101FA2
	bl DestroySprite
	ldr r0, [r4]
	movs r1, 0xB9
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_08101FA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101FA8: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101F80

	thumb_func_start sub_8101FAC
sub_8101FAC: @ 8101FAC
	push {r4-r6,lr}
	ldr r0, _08102004 @ =gUnknown_843FA40
	movs r1, 0xD0
	movs r2, 0x80
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08102008 @ =gUnknown_203ACEC
	ldr r2, [r5]
	movs r1, 0xBA
	lsls r1, 2
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _0810200C @ =gSprites
	adds r1, r4
	str r1, [r2]
	movs r6, 0
	ldr r0, _08102010 @ =0x0000ffc0
	strh r0, [r1, 0x24]
	ldr r0, _08102014 @ =gUnknown_843FA20
	movs r1, 0xD0
	movs r2, 0x50
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	movs r1, 0xBB
	lsls r1, 2
	adds r3, r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r3]
	strb r6, [r2, 0x9]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102004: .4byte gUnknown_843FA40
_08102008: .4byte gUnknown_203ACEC
_0810200C: .4byte gSprites
_08102010: .4byte 0x0000ffc0
_08102014: .4byte gUnknown_843FA20
	thumb_func_end sub_8101FAC

	thumb_func_start sub_8102018
sub_8102018: @ 8102018
	push {r4,lr}
	ldr r4, _0810202C @ =gUnknown_203ACEC
	ldr r2, [r4]
	ldrb r3, [r2, 0x9]
	cmp r3, 0
	beq _08102030
	cmp r3, 0x1
	beq _08102088
	movs r0, 0
	b _081020A6
	.align 2, 0
_0810202C: .4byte gUnknown_203ACEC
_08102030:
	movs r0, 0xBA
	lsls r0, 2
	adds r2, r0
	ldr r1, [r2]
	ldrh r0, [r1, 0x24]
	adds r0, 0x8
	strh r0, [r1, 0x24]
	ldr r2, [r2]
	movs r1, 0x24
	ldrsh r0, [r2, r1]
	cmp r0, 0
	blt _081020A4
	strh r3, [r2, 0x24]
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _08102066
	ldr r0, [r4]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _08102076
_08102066:
	ldr r0, [r4]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
_08102076:
	ldr r0, _08102084 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	b _081020A4
	.align 2, 0
_08102084: .4byte gUnknown_203ACEC
_08102088:
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r2, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081020A4
	movs r0, 0x2
	strb r0, [r2, 0x9]
	movs r0, 0
	b _081020A6
_081020A4:
	movs r0, 0x1
_081020A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8102018

	thumb_func_start sub_81020AC
sub_81020AC: @ 81020AC
	push {lr}
	ldr r2, _081020CC @ =gUnknown_203ACEC
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1, 0x9]
	ldr r0, [r2]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_081020CC: .4byte gUnknown_203ACEC
	thumb_func_end sub_81020AC

	thumb_func_start sub_81020D0
sub_81020D0: @ 81020D0
	push {r4-r6,lr}
	ldr r5, _081020E4 @ =gUnknown_203ACEC
	ldr r3, [r5]
	ldrb r0, [r3, 0x9]
	cmp r0, 0
	beq _081020E8
	cmp r0, 0x1
	beq _08102102
	movs r0, 0
	b _08102154
	.align 2, 0
_081020E4: .4byte gUnknown_203ACEC
_081020E8:
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r3, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08102152
	movs r0, 0x1
	strb r0, [r3, 0x9]
	b _08102152
_08102102:
	movs r0, 0xBA
	lsls r0, 2
	adds r2, r3, r0
	ldr r1, [r2]
	ldrh r0, [r1, 0x24]
	subs r0, 0x8
	movs r6, 0
	strh r0, [r1, 0x24]
	ldr r0, [r2]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bgt _08102152
	movs r4, 0xBB
	lsls r4, 2
	adds r0, r3, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	movs r1, 0xBA
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl DestroySprite
	ldr r1, [r5]
	adds r4, r1, r4
	str r6, [r4]
	movs r2, 0xBA
	lsls r2, 2
	adds r0, r1, r2
	str r6, [r0]
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	movs r0, 0
	b _08102154
_08102152:
	movs r0, 0x1
_08102154:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81020D0

	thumb_func_start sub_810215C
sub_810215C: @ 810215C
	push {lr}
	ldr r0, _08102174 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x4
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_08102174: .4byte gUnknown_203ACEC
	thumb_func_end sub_810215C

	thumb_func_start sub_8102178
sub_8102178: @ 8102178
	push {lr}
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _0810219C
	ldr r0, _08102198 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _081021AE
	.align 2, 0
_08102198: .4byte gUnknown_203ACEC
_0810219C:
	ldr r0, _081021B4 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
_081021AE:
	pop {r0}
	bx r0
	.align 2, 0
_081021B4: .4byte gUnknown_203ACEC
	thumb_func_end sub_8102178

	thumb_func_start sub_81021B8
sub_81021B8: @ 81021B8
	ldr r0, _081021D0 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	lsrs r1, 4
	movs r0, 0x1
	bics r0, r1
	bx lr
	.align 2, 0
_081021D0: .4byte gUnknown_203ACEC
	thumb_func_end sub_81021B8

	thumb_func_start sub_81021D4
sub_81021D4: @ 81021D4
	push {r4,lr}
	ldr r4, _08102240 @ =gUnknown_843FA98
	adds r0, r4, 0
	movs r1, 0x60
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08102202
	ldr r0, _08102244 @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBC
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102248 @ =gSprites
	adds r0, r1
	str r0, [r2]
_08102202:
	adds r0, r4, 0
	movs r1, 0x60
	movs r2, 0x9C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08102236
	ldr r0, _08102244 @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBD
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102248 @ =gSprites
	adds r0, r1
	str r0, [r2]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_08102236:
	bl sub_81022B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102240: .4byte gUnknown_843FA98
_08102244: .4byte gUnknown_203ACEC
_08102248: .4byte gSprites
	thumb_func_end sub_81021D4

	thumb_func_start sub_810224C
sub_810224C: @ 810224C
	push {r4-r6,lr}
	bl sub_80FFE64
	ldr r6, _081022AC @ =gUnknown_203ACEC
	ldr r1, [r6]
	movs r2, 0xBC
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _08102266
	movs r2, 0x1
_08102266:
	adds r3, r1, 0
	adds r3, 0x3E
	movs r4, 0x1
	lsls r2, 2
	ldrb r1, [r3]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	bl sub_80FFE98
	ldr r1, [r6]
	movs r2, 0xBD
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _08102292
	movs r2, 0x1
_08102292:
	adds r3, r1, 0
	adds r3, 0x3E
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 2
	ldrb r2, [r3]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081022AC: .4byte gUnknown_203ACEC
	thumb_func_end sub_810224C

	thumb_func_start sub_81022B0
sub_81022B0: @ 81022B0
	ldr r3, _081022DC @ =gUnknown_203ACEC
	ldr r0, [r3]
	movs r1, 0xBC
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xBD
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_081022DC: .4byte gUnknown_203ACEC
	thumb_func_end sub_81022B0

	thumb_func_start sub_81022E0
sub_81022E0: @ 81022E0
	push {lr}
	cmp r0, 0
	bne _081022FC
	ldr r0, _081022F8 @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r1, 0xBC
	lsls r1, 2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, 0x60
	b _0810230A
	.align 2, 0
_081022F8: .4byte gUnknown_203ACEC
_081022FC:
	ldr r0, _0810231C @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r1, 0xBC
	lsls r1, 2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, 0x78
_0810230A:
	strh r1, [r0, 0x20]
	movs r3, 0xBD
	lsls r3, 2
	adds r0, r2, r3
	ldr r0, [r0]
	strh r1, [r0, 0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0810231C: .4byte gUnknown_203ACEC
	thumb_func_end sub_81022E0

	thumb_func_start sub_8102320
sub_8102320: @ 8102320
	push {r4,lr}
	ldr r4, _08102388 @ =gUnknown_843FA80
	adds r0, r4, 0
	movs r1, 0xDC
	movs r2, 0x54
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0810234E
	ldr r0, _0810238C @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBE
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102390 @ =gSprites
	adds r0, r1
	str r0, [r2]
_0810234E:
	adds r0, r4, 0
	movs r1, 0xDC
	movs r2, 0x9C
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0810237E
	ldr r0, _0810238C @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBF
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102390 @ =gSprites
	adds r0, r1
	str r0, [r2]
	movs r1, 0x1
	bl StartSpriteAnim
_0810237E:
	bl sub_81023F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102388: .4byte gUnknown_843FA80
_0810238C: .4byte gUnknown_203ACEC
_08102390: .4byte gSprites
	thumb_func_end sub_8102320

	thumb_func_start sub_8102394
sub_8102394: @ 8102394
	push {r4-r6,lr}
	bl sub_80FFE64
	ldr r6, _081023F4 @ =gUnknown_203ACEC
	ldr r1, [r6]
	movs r2, 0xBE
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _081023AE
	movs r2, 0x1
_081023AE:
	adds r3, r1, 0
	adds r3, 0x3E
	movs r4, 0x1
	lsls r2, 2
	ldrb r1, [r3]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	bl sub_80FFE98
	ldr r1, [r6]
	movs r2, 0xBF
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _081023DA
	movs r2, 0x1
_081023DA:
	adds r3, r1, 0
	adds r3, 0x3E
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 2
	ldrb r2, [r3]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081023F4: .4byte gUnknown_203ACEC
	thumb_func_end sub_8102394

	thumb_func_start sub_81023F8
sub_81023F8: @ 81023F8
	ldr r3, _08102424 @ =gUnknown_203ACEC
	ldr r0, [r3]
	movs r1, 0xBE
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xBF
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08102424: .4byte gUnknown_203ACEC
	thumb_func_end sub_81023F8

	thumb_func_start sub_8102428
sub_8102428: @ 8102428
	push {r4,lr}
	sub sp, 0x14
	ldr r3, _081024A8 @ =0xffffff00
	ldr r0, [sp, 0xC]
	ands r0, r3
	movs r1, 0x3
	orrs r0, r1
	ldr r2, _081024AC @ =0xffff00ff
	ands r0, r2
	movs r1, 0x80
	lsls r1, 3
	orrs r0, r1
	ldr r1, _081024B0 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xB0
	lsls r1, 12
	orrs r0, r1
	ldr r1, _081024B4 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 21
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r3
	movs r1, 0x2
	orrs r0, r1
	ands r0, r2
	movs r1, 0xB0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _081024B8 @ =0x0000ffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 14
	orrs r0, r1
	str r0, [sp, 0x10]
	add r0, sp, 0xC
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _081024BC @ =gUnknown_841EE2B
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x1
	movs r3, 0
	bl sub_8100D84
	adds r0, r4, 0
	bl PutWindowTilemap
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081024A8: .4byte 0xffffff00
_081024AC: .4byte 0xffff00ff
_081024B0: .4byte 0xff00ffff
_081024B4: .4byte 0x00ffffff
_081024B8: .4byte 0x0000ffff
_081024BC: .4byte gUnknown_841EE2B
	thumb_func_end sub_8102428

	.align 2, 0 @ Don't pad with nop.
