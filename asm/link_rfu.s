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
	ldr r0, _080FD410 @ =gRfuLinkStatus
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
_080FD410: .4byte gRfuLinkStatus
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
	ldr r0, _080FD6B4 @ =gRfuLinkStatus
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
_080FD6B4: .4byte gRfuLinkStatus
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
	ldr r7, _080FD75C @ =gRfuLinkStatus
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
_080FD75C: .4byte gRfuLinkStatus
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
	ldr r4, _080FD82C @ =gRfuLinkStatus
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
_080FD82C: .4byte gRfuLinkStatus
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
	bl rfu_REQBN_watchLink
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
	ldr r0, _080FDA0C @ =gRfuLinkStatus
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
_080FDA0C: .4byte gRfuLinkStatus
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
	bl rfu_REQ_startSearchChild
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
	ldr r0, _080FDBC0 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	bl rfu_REQ_CHILD_startConnectRecovery
	b _080FDBDA
	.align 2, 0
_080FDBC0: .4byte gRfuLinkStatus
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
	ldr r0, _080FDC24 @ =gRfuLinkStatus
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
_080FDC24: .4byte gRfuLinkStatus
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
	ldr r0, _080FDEB0 @ =gRfuLinkStatus
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
_080FDEB0: .4byte gRfuLinkStatus
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
	ldr r2, _080FDFFC @ =gRfuLinkStatus
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
_080FDFFC: .4byte gRfuLinkStatus
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
	ldr r0, _080FE0B8 @ =gRfuLinkStatus
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
_080FE0B8: .4byte gRfuLinkStatus
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
	ldr r0, _080FE158 @ =gRfuLinkStatus
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
_080FE158: .4byte gRfuLinkStatus
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
	ldr r4, _080FE1E0 @ =gRfuLinkStatus
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
_080FE1E0: .4byte gRfuLinkStatus
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
	ldr r2, _080FE2AC @ =gRfuLinkStatus
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
_080FE2AC: .4byte gRfuLinkStatus
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
	ldr r0, _080FE300 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080FE322
	movs r0, 0x50
	movs r1, 0
	bl sub_80FE7F0
	b _080FE322
	.align 2, 0
_080FE300: .4byte gRfuLinkStatus
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
	ldr r2, _080FE354 @ =gRfuLinkStatus
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
_080FE354: .4byte gRfuLinkStatus
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
	ldr r0, _080FE3CC @ =gRfuLinkStatus
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
_080FE3CC: .4byte gRfuLinkStatus
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
	ldr r0, _080FE4A0 @ =gRfuLinkStatus
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
_080FE4A0: .4byte gRfuLinkStatus
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
	ldr r0, _080FE518 @ =gRfuSlotStatusNI
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
	ldr r0, _080FE520 @ =gRfuLinkStatus
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
_080FE518: .4byte gRfuSlotStatusNI
_080FE51C: .4byte 0x0000ffff
_080FE520: .4byte gRfuLinkStatus
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
	ldr r0, _080FE600 @ =gRfuLinkStatus
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
_080FE600: .4byte gRfuLinkStatus
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
	ldr r1, _080FE6E8 @ =gRfuSlotStatusNI
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
	ldr r0, _080FE6EC @ =gRfuLinkStatus
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
_080FE6E8: .4byte gRfuSlotStatusNI
_080FE6EC: .4byte gRfuLinkStatus
	thumb_func_end sub_80FE63C

	thumb_func_start sub_80FE6F0
sub_80FE6F0: @ 80FE6F0
	push {r4,r5,lr}
	ldr r5, _080FE744 @ =gUnknown_3005E10
	ldrb r0, [r5, 0x4]
	cmp r0, 0xF
	bne _080FE73C
	ldr r1, _080FE748 @ =gRfuSlotStatusNI
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
_080FE748: .4byte gRfuSlotStatusNI
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
	ldr r1, _080FE7E4 @ =gRfuLinkStatus
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
_080FE7E4: .4byte gRfuLinkStatus
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
	ldr r0, _080FE908 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080FE884
	movs r4, 0
_080FE84E:
	ldr r1, _080FE90C @ =gRfuSlotStatusNI
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
	ldr r0, _080FE908 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	beq _080FE8C2
	movs r4, 0
_080FE890:
	ldr r1, _080FE90C @ =gRfuSlotStatusNI
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
	ldr r0, _080FE908 @ =gRfuLinkStatus
	ldr r3, [r0]
	ldrb r2, [r3, 0x6]
	cmp r2, 0
	beq _080FE900
	mvns r1, r5
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3, 0x6]
	movs r4, 0
	ldr r7, _080FE910 @ =gRfuSlotStatusUNI
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
_080FE908: .4byte gRfuLinkStatus
_080FE90C: .4byte gRfuSlotStatusNI
_080FE910: .4byte gRfuSlotStatusUNI
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
	ldr r0, _080FEA08 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080FE9B8
	movs r6, 0
_080FE938:
	ldr r3, _080FEA0C @ =gRfuSlotStatusNI
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
	ldr r0, _080FEA08 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	beq _080FE9F4
	movs r6, 0
_080FE9C4:
	ldr r1, _080FEA0C @ =gRfuSlotStatusNI
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
_080FEA08: .4byte gRfuLinkStatus
_080FEA0C: .4byte gRfuSlotStatusNI
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
	ldr r0, _080FEA94 @ =gRfuLinkStatus
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
_080FEA94: .4byte gRfuLinkStatus
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

	.align 2, 0 @ Don't pad with nop.
