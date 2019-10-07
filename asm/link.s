	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start LinkMain1
LinkMain1: @ 800B398
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, _0800B3B4 @ =gLink
	ldrb r0, [r0, 0x1]
	cmp r0, 0x4
	bhi _0800B44A
	lsls r0, 2
	ldr r1, _0800B3B8 @ =_0800B3BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B3B4: .4byte gLink
_0800B3B8: .4byte _0800B3BC
	.align 2, 0
_0800B3BC:
	.4byte _0800B3D0
	.4byte _0800B3E0
	.4byte _0800B3F8
	.4byte _0800B434
	.4byte _0800B43E
_0800B3D0:
	bl DisableSerial
	ldr r1, _0800B3DC @ =gLink
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _0800B44A
	.align 2, 0
_0800B3DC: .4byte gLink
_0800B3E0:
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _0800B44A
	bl EnableSerial
	ldr r1, _0800B3F4 @ =gLink
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _0800B44A
	.align 2, 0
_0800B3F4: .4byte gLink
_0800B3F8:
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _0800B408
	cmp r1, 0x2
	beq _0800B420
	bl CheckMasterOrSlave
	b _0800B44A
_0800B408:
	ldr r2, _0800B41C @ =gLink
	ldrb r0, [r2]
	cmp r0, 0x8
	bne _0800B44A
	ldrb r0, [r2, 0x3]
	cmp r0, 0x1
	bls _0800B44A
	strb r1, [r2, 0xE]
	b _0800B44A
	.align 2, 0
_0800B41C: .4byte gLink
_0800B420:
	ldr r0, _0800B42C @ =gLink
	movs r1, 0
	strb r1, [r0, 0x1]
	ldr r0, _0800B430 @ =0x0400012a
	strh r1, [r0]
	b _0800B44A
	.align 2, 0
_0800B42C: .4byte gLink
_0800B430: .4byte 0x0400012a
_0800B434:
	bl InitTimer
	ldr r1, _0800B484 @ =gLink
	movs r0, 0x4
	strb r0, [r1, 0x1]
_0800B43E:
	adds r0, r5, 0
	bl sub_800B520
	adds r0, r6, 0
	bl sub_800B608
_0800B44A:
	movs r0, 0
	strb r0, [r4]
	ldr r1, _0800B484 @ =gLink
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 2
	orrs r2, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _0800B462
	movs r0, 0x20
	orrs r2, r0
_0800B462:
	ldrb r0, [r1, 0xC]
	lsls r3, r0, 8
	ldrb r0, [r1, 0xF]
	lsls r4, r0, 9
	ldrb r0, [r1, 0x10]
	lsls r5, r0, 12
	ldrb r0, [r1, 0x11]
	lsls r6, r0, 13
	ldrb r0, [r1, 0x12]
	lsls r7, r0, 14
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _0800B488
	movs r0, 0x40
	orrs r0, r3
	orrs r0, r2
	b _0800B48C
	.align 2, 0
_0800B484: .4byte gLink
_0800B488:
	adds r0, r2, 0
	orrs r0, r3
_0800B48C:
	orrs r0, r4
	orrs r0, r5
	orrs r0, r6
	orrs r0, r7
	adds r2, r0, 0
	ldrb r3, [r1, 0x13]
	cmp r3, 0x1
	bne _0800B4A2
	movs r0, 0x80
	lsls r0, 9
	orrs r2, r0
_0800B4A2:
	ldrb r0, [r1, 0x2]
	cmp r0, 0x3
	bls _0800B4AE
	movs r0, 0x80
	lsls r0, 10
	orrs r2, r0
_0800B4AE:
	adds r1, r2, 0
	cmp r3, 0x2
	bne _0800B4BA
	movs r0, 0x80
	lsls r0, 11
	orrs r1, r0
_0800B4BA:
	adds r0, r1, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end LinkMain1

	thumb_func_start CheckMasterOrSlave
CheckMasterOrSlave: @ 800B4C4
	push {lr}
	ldr r0, _0800B4E0 @ =0x04000128
	ldr r1, [r0]
	movs r0, 0xC
	ands r1, r0
	ldr r2, _0800B4E4 @ =gLink
	cmp r1, 0x8
	bne _0800B4E8
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _0800B4E8
	strb r1, [r2]
	b _0800B4EC
	.align 2, 0
_0800B4E0: .4byte 0x04000128
_0800B4E4: .4byte gLink
_0800B4E8:
	movs r0, 0
	strb r0, [r2]
_0800B4EC:
	pop {r0}
	bx r0
	thumb_func_end CheckMasterOrSlave

	thumb_func_start InitTimer
InitTimer: @ 800B4F0
	push {lr}
	ldr r0, _0800B514 @ =gLink
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800B50E
	ldr r1, _0800B518 @ =0x0400010c
	ldr r2, _0800B51C @ =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x41
	strh r0, [r1]
	movs r0, 0x40
	bl EnableInterrupts
_0800B50E:
	pop {r0}
	bx r0
	.align 2, 0
_0800B514: .4byte gLink
_0800B518: .4byte 0x0400010c
_0800B51C: .4byte 0x0000ff3b
	thumb_func_end InitTimer

	thumb_func_start sub_800B520
sub_800B520: @ 800B520
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	ldr r2, _0800B598 @ =gLinkSavedIme
	ldr r1, _0800B59C @ =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0800B5A0 @ =gLink
	ldr r4, _0800B5A4 @ =0x00000339
	adds r0, r1, r4
	ldrb r4, [r0]
	adds r6, r1, 0
	cmp r4, 0x31
	bhi _0800B5B0
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B55E
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_0800B55E:
	movs r2, 0
	ldr r4, _0800B5A8 @ =sSendNonzeroCheck
	mov r9, r4
	ldr r1, _0800B5AC @ =gLastSendQueueCount
	mov r10, r1
	lsls r5, r0, 1
	movs r0, 0x18
	adds r0, r6
	mov r8, r0
	mov r12, r2
	movs r7, 0x64
_0800B574:
	ldrh r0, [r4]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r4]
	adds r0, r2, 0
	muls r0, r7
	adds r0, r5, r0
	add r0, r8
	strh r1, [r0]
	mov r1, r12
	strh r1, [r3]
	adds r3, 0x2
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B574
	b _0800B5BC
	.align 2, 0
_0800B598: .4byte gLinkSavedIme
_0800B59C: .4byte 0x04000208
_0800B5A0: .4byte gLink
_0800B5A4: .4byte 0x00000339
_0800B5A8: .4byte sSendNonzeroCheck
_0800B5AC: .4byte gLastSendQueueCount
_0800B5B0:
	movs r0, 0x1
	strb r0, [r6, 0x12]
	ldr r2, _0800B5F4 @ =sSendNonzeroCheck
	mov r9, r2
	ldr r4, _0800B5F8 @ =gLastSendQueueCount
	mov r10, r4
_0800B5BC:
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	beq _0800B5D4
	ldr r2, _0800B5FC @ =0x00000339
	adds r0, r6, r2
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	mov r4, r9
	strh r2, [r4]
_0800B5D4:
	ldr r1, _0800B600 @ =0x04000208
	ldr r2, _0800B604 @ =gLinkSavedIme
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r4, _0800B5FC @ =0x00000339
	adds r0, r6, r4
	ldrb r0, [r0]
	mov r1, r10
	strb r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B5F4: .4byte sSendNonzeroCheck
_0800B5F8: .4byte gLastSendQueueCount
_0800B5FC: .4byte 0x00000339
_0800B600: .4byte 0x04000208
_0800B604: .4byte gLinkSavedIme
	thumb_func_end sub_800B520

	thumb_func_start sub_800B608
sub_800B608: @ 800B608
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	ldr r2, _0800B664 @ =gLinkSavedIme
	ldr r1, _0800B668 @ =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0800B66C @ =gLink
	ldr r3, _0800B670 @ =0x00000fbd
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0
	bne _0800B674
	movs r3, 0
	ldrb r0, [r1, 0x3]
	cmp r3, r0
	bcs _0800B65A
	movs r5, 0
	adds r6, r0, 0
_0800B63A:
	movs r2, 0
	lsls r1, r3, 4
	adds r4, r3, 0x1
	add r1, r9
_0800B642:
	lsls r0, r2, 1
	adds r0, r1
	strh r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B642
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, r6
	bcc _0800B63A
_0800B65A:
	movs r0, 0x1
	mov r7, r12
	strb r0, [r7, 0xC]
	b _0800B6F0
	.align 2, 0
_0800B664: .4byte gLinkSavedIme
_0800B668: .4byte 0x04000208
_0800B66C: .4byte gLink
_0800B670: .4byte 0x00000fbd
_0800B674:
	movs r3, 0
	mov r0, r12
	ldrb r1, [r0, 0x3]
	cmp r3, r1
	bcs _0800B6CA
	ldr r0, _0800B708 @ =0x00000fbc
	add r0, r12
	ldrb r0, [r0]
	lsls r6, r0, 1
	movs r2, 0xCF
	lsls r2, 2
	add r2, r12
	mov r8, r2
	mov r10, r1
_0800B690:
	movs r2, 0
	lsls r1, r3, 4
	adds r4, r3, 0x1
	lsls r0, r3, 1
	mov r7, r9
	adds r5, r1, r7
	adds r0, r3
	lsls r0, 3
	adds r0, r3
	lsls r3, r0, 5
_0800B6A4:
	lsls r1, r2, 1
	adds r1, r5
	movs r7, 0x64
	adds r0, r2, 0
	muls r0, r7
	adds r0, r6, r0
	adds r0, r3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B6A4
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, r10
	bcc _0800B690
_0800B6CA:
	mov r2, r12
	ldr r0, _0800B70C @ =0x00000fbd
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, 0x1
	movs r3, 0
	strb r0, [r1]
	ldr r1, _0800B708 @ =0x00000fbc
	adds r2, r1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B6EC
	strb r3, [r2]
_0800B6EC:
	mov r2, r12
	strb r3, [r2, 0xC]
_0800B6F0:
	ldr r1, _0800B710 @ =0x04000208
	ldr r3, _0800B714 @ =gLinkSavedIme
	ldrh r0, [r3]
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B708: .4byte 0x00000fbc
_0800B70C: .4byte 0x00000fbd
_0800B710: .4byte 0x04000208
_0800B714: .4byte gLinkSavedIme
	thumb_func_end sub_800B608

	thumb_func_start LinkVSync
LinkVSync: @ 800B718
	push {r4,lr}
	ldr r3, _0800B740 @ =gLink
	ldrb r4, [r3]
	cmp r4, 0
	beq _0800B754
	ldrb r0, [r3, 0x1]
	cmp r0, 0x2
	beq _0800B74E
	cmp r0, 0x4
	bne _0800B77E
	movs r0, 0xD
	ldrsb r0, [r3, r0]
	cmp r0, 0x8
	bgt _0800B744
	ldrb r0, [r3, 0x10]
	cmp r0, 0x1
	beq _0800B74E
	movs r0, 0x1
	strb r0, [r3, 0x13]
	b _0800B77E
	.align 2, 0
_0800B740: .4byte gLink
_0800B744:
	ldrb r0, [r3, 0x13]
	cmp r0, 0x1
	beq _0800B77E
	movs r0, 0
	strb r0, [r3, 0xD]
_0800B74E:
	bl sub_800B820
	b _0800B77E
_0800B754:
	ldrb r2, [r3, 0x1]
	cmp r2, 0x4
	beq _0800B75E
	cmp r2, 0x2
	bne _0800B77E
_0800B75E:
	ldr r1, _0800B784 @ =sNumVBlanksWithoutSerialIntr
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _0800B77E
	cmp r2, 0x4
	bne _0800B776
	movs r0, 0x2
	strb r0, [r3, 0x13]
_0800B776:
	cmp r2, 0x2
	bne _0800B77E
	strb r4, [r3, 0x3]
	strb r4, [r3, 0xF]
_0800B77E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B784: .4byte sNumVBlanksWithoutSerialIntr
	thumb_func_end LinkVSync

	thumb_func_start Timer3Intr
Timer3Intr: @ 800B788
	push {lr}
	bl StopTimer
	bl sub_800B820
	pop {r0}
	bx r0
	thumb_func_end Timer3Intr

	thumb_func_start SerialCB
SerialCB: @ 800B798
	push {r4,lr}
	ldr r4, _0800B7C4 @ =gLink
	ldr r0, _0800B7C8 @ =0x04000128
	ldr r1, [r0]
	lsls r0, r1, 26
	lsrs r0, 30
	strb r0, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _0800B7CC
	cmp r0, 0x4
	bne _0800B7EA
	lsls r0, r1, 25
	lsrs r0, 31
	strb r0, [r4, 0x10]
	bl DoRecv
	bl DoSend
	bl SendRecvDone
	b _0800B7EA
	.align 2, 0
_0800B7C4: .4byte gLink
_0800B7C8: .4byte 0x04000128
_0800B7CC:
	bl DoHandshake
	lsls r0, 24
	cmp r0, 0
	beq _0800B7EA
	ldrb r0, [r4]
	cmp r0, 0
	beq _0800B7E6
	movs r0, 0x3
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0xD]
	b _0800B7EA
_0800B7E6:
	movs r0, 0x4
	strb r0, [r4, 0x1]
_0800B7EA:
	ldr r3, _0800B810 @ =gLink
	ldrb r0, [r3, 0xD]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r3, 0xD]
	ldr r1, _0800B814 @ =sNumVBlanksWithoutSerialIntr
	strb r2, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	bne _0800B80A
	ldr r0, _0800B818 @ =gLastRecvQueueCount
	ldr r2, _0800B81C @ =0x00000fbd
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
_0800B80A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B810: .4byte gLink
_0800B814: .4byte sNumVBlanksWithoutSerialIntr
_0800B818: .4byte gLastRecvQueueCount
_0800B81C: .4byte 0x00000fbd
	thumb_func_end SerialCB

	thumb_func_start sub_800B820
sub_800B820: @ 800B820
	ldr r0, _0800B82C @ =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0800B82C: .4byte 0x04000128
	thumb_func_end sub_800B820

	thumb_func_start DoHandshake
DoHandshake: @ 800B830
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r5, 0
	ldr r6, _0800B84C @ =0x0000ffff
	ldr r0, _0800B850 @ =gLink
	ldrb r1, [r0, 0xE]
	adds r7, r0, 0
	cmp r1, 0x1
	bne _0800B85C
	ldr r1, _0800B854 @ =0x0400012a
	ldr r2, _0800B858 @ =0x00008fff
	b _0800B860
	.align 2, 0
_0800B84C: .4byte 0x0000ffff
_0800B850: .4byte gLink
_0800B854: .4byte 0x0400012a
_0800B858: .4byte 0x00008fff
_0800B85C:
	ldr r1, _0800B8B4 @ =0x0400012a
	ldr r2, _0800B8B8 @ =0x0000b9a0
_0800B860:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _0800B8BC @ =gLink + 4
	ldr r3, _0800B8C0 @ =0x04000120
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0
	movs r1, 0
	str r0, [r3]
	str r1, [r3, 0x4]
	strb r0, [r2, 0xA]
	movs r4, 0
	ldr r0, _0800B8C4 @ =sHandshakePlayerCount
	mov r9, r0
	mov r8, r2
	ldr r2, _0800B8C8 @ =0x00008fff
	ldr r1, _0800B8CC @ =0x0000ffff
	mov r12, r1
_0800B888:
	lsls r0, r4, 1
	add r0, r8
	ldrh r3, [r0]
	movs r0, 0x4
	negs r0, r0
	ands r0, r3
	ldr r1, _0800B8B8 @ =0x0000b9a0
	cmp r0, r1
	beq _0800B8A0
	adds r0, r3, 0
	cmp r0, r2
	bne _0800B8D0
_0800B8A0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r3, 0
	cmp r6, r0
	bls _0800B8D8
	cmp r0, 0
	beq _0800B8D8
	adds r6, r3, 0
	b _0800B8D8
	.align 2, 0
_0800B8B4: .4byte 0x0400012a
_0800B8B8: .4byte 0x0000b9a0
_0800B8BC: .4byte gLink + 4
_0800B8C0: .4byte 0x04000120
_0800B8C4: .4byte sHandshakePlayerCount
_0800B8C8: .4byte 0x00008fff
_0800B8CC: .4byte 0x0000ffff
_0800B8D0:
	cmp r0, r12
	beq _0800B8E2
	movs r5, 0
	b _0800B8E2
_0800B8D8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800B888
_0800B8E2:
	strb r5, [r7, 0x3]
	adds r0, r5, 0
	cmp r0, 0x1
	bls _0800B912
	mov r2, r9
	ldrb r2, [r2]
	cmp r0, r2
	bne _0800B904
	ldrh r1, [r7, 0x4]
	ldr r0, _0800B900 @ =0x00008fff
	cmp r1, r0
	bne _0800B904
	movs r0, 0x1
	b _0800B91E
	.align 2, 0
_0800B900: .4byte 0x00008fff
_0800B904:
	ldrb r0, [r7, 0x3]
	cmp r0, 0x1
	bls _0800B912
	movs r0, 0x3
	ands r6, r0
	adds r0, r6, 0x1
	b _0800B914
_0800B912:
	movs r0, 0
_0800B914:
	strb r0, [r7, 0xF]
	ldrb r0, [r7, 0x3]
	mov r1, r9
	strb r0, [r1]
	movs r0, 0
_0800B91E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end DoHandshake

	thumb_func_start DoRecv
DoRecv: @ 800B92C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r0, _0800B984 @ =0x04000120
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _0800B988 @ =gLink
	ldrb r1, [r0, 0x16]
	adds r6, r0, 0
	cmp r1, 0
	bne _0800B990
	movs r4, 0
	ldr r7, _0800B98C @ =sChecksumAvailable
	ldrb r0, [r6, 0x3]
	cmp r4, r0
	bcs _0800B97A
	adds r5, r6, 0
	ldrh r1, [r6, 0x14]
	adds r3, r7, 0
	adds r2, r6, 0
_0800B95A:
	lsls r0, r4, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _0800B96E
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800B96E
	movs r0, 0x1
	strb r0, [r5, 0x11]
_0800B96E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r2, 0x3]
	cmp r4, r0
	bcc _0800B95A
_0800B97A:
	movs r0, 0
	strh r0, [r6, 0x14]
	movs r0, 0x1
	strb r0, [r7]
	b _0800BA30
	.align 2, 0
_0800B984: .4byte 0x04000120
_0800B988: .4byte gLink
_0800B98C: .4byte sChecksumAvailable
_0800B990:
	ldr r2, _0800BA00 @ =0x00000fbc
	adds r1, r6, r2
	adds r2, 0x1
	adds r0, r6, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	adds r0, r2, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B9AC
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_0800B9AC:
	cmp r2, 0x31
	bhi _0800BA08
	movs r4, 0
	ldrb r1, [r6, 0x3]
	cmp r4, r1
	bcs _0800BA0C
	adds r5, r6, 0
	ldr r7, _0800BA04 @ =sRecvNonzeroCheck
	lsls r0, 1
	mov r12, r0
	movs r2, 0xCF
	lsls r2, 2
	adds r2, r6
	mov r8, r2
_0800B9C8:
	lsls r1, r4, 1
	mov r2, sp
	adds r0, r2, r1
	ldrh r3, [r0]
	ldrh r2, [r5, 0x14]
	adds r0, r3, r2
	strh r0, [r5, 0x14]
	ldrh r0, [r7]
	orrs r0, r3
	strh r0, [r7]
	ldrb r2, [r5, 0x17]
	movs r0, 0x64
	muls r0, r2
	add r0, r12
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 5
	adds r0, r1
	add r0, r8
	strh r3, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x3]
	cmp r4, r0
	bcc _0800B9C8
	b _0800BA0C
	.align 2, 0
_0800BA00: .4byte 0x00000fbc
_0800BA04: .4byte sRecvNonzeroCheck
_0800BA08:
	movs r0, 0x2
	strb r0, [r6, 0x12]
_0800BA0C:
	ldrb r0, [r6, 0x17]
	adds r0, 0x1
	strb r0, [r6, 0x17]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _0800BA30
	ldr r2, _0800BA3C @ =sRecvNonzeroCheck
	ldrh r0, [r2]
	cmp r0, 0
	beq _0800BA30
	ldr r1, _0800BA40 @ =0x00000fbd
	adds r0, r6, r1
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0
	strh r0, [r2]
_0800BA30:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA3C: .4byte sRecvNonzeroCheck
_0800BA40: .4byte 0x00000fbd
	thumb_func_end DoRecv

	thumb_func_start DoSend
DoSend: @ 800BA44
	push {r4,lr}
	ldr r0, _0800BA80 @ =gLink
	ldrb r1, [r0, 0x16]
	adds r4, r0, 0
	cmp r1, 0x8
	bne _0800BA96
	ldr r1, _0800BA84 @ =0x0400012a
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	ldr r1, _0800BA88 @ =sSendBufferEmpty
	ldrb r2, [r1]
	cmp r2, 0
	bne _0800BA90
	ldr r0, _0800BA8C @ =0x00000339
	adds r1, r4, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r0, 0xCE
	lsls r0, 2
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800BAEC
	strb r2, [r1]
	b _0800BAEC
	.align 2, 0
_0800BA80: .4byte gLink
_0800BA84: .4byte 0x0400012a
_0800BA88: .4byte sSendBufferEmpty
_0800BA8C: .4byte 0x00000339
_0800BA90:
	movs r0, 0
	strb r0, [r1]
	b _0800BAEC
_0800BA96:
	ldr r1, _0800BABC @ =sSendBufferEmpty
	ldrb r0, [r1]
	cmp r0, 0
	bne _0800BAB2
	ldr r2, _0800BAC0 @ =0x00000339
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800BAAC
	movs r0, 0x1
	strb r0, [r1]
_0800BAAC:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800BAC8
_0800BAB2:
	ldr r1, _0800BAC4 @ =0x0400012a
	movs r0, 0
	strh r0, [r1]
	b _0800BAE6
	.align 2, 0
_0800BABC: .4byte sSendBufferEmpty
_0800BAC0: .4byte 0x00000339
_0800BAC4: .4byte 0x0400012a
_0800BAC8:
	ldr r3, _0800BAF4 @ =0x0400012a
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 1
	ldrb r2, [r4, 0x16]
	movs r1, 0x64
	muls r1, r2
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x18
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
_0800BAE6:
	ldrb r0, [r4, 0x16]
	adds r0, 0x1
	strb r0, [r4, 0x16]
_0800BAEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAF4: .4byte 0x0400012a
	thumb_func_end DoSend

	thumb_func_start StopTimer
StopTimer: @ 800BAF8
	push {lr}
	ldr r0, _0800BB18 @ =gLink
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800BB14
	ldr r2, _0800BB1C @ =0x0400010e
	ldrh r1, [r2]
	ldr r0, _0800BB20 @ =0x0000ff7f
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0800BB24 @ =0x0400010c
	ldr r2, _0800BB28 @ =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
_0800BB14:
	pop {r0}
	bx r0
	.align 2, 0
_0800BB18: .4byte gLink
_0800BB1C: .4byte 0x0400010e
_0800BB20: .4byte 0x0000ff7f
_0800BB24: .4byte 0x0400010c
_0800BB28: .4byte 0x0000ff3b
	thumb_func_end StopTimer

	thumb_func_start SendRecvDone
SendRecvDone: @ 800BB2C
	push {lr}
	ldr r1, _0800BB40 @ =gLink
	ldrb r0, [r1, 0x17]
	cmp r0, 0x8
	bne _0800BB44
	movs r0, 0
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	b _0800BB54
	.align 2, 0
_0800BB40: .4byte gLink
_0800BB44:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800BB54
	ldr r0, _0800BB58 @ =0x0400010e
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_0800BB54:
	pop {r0}
	bx r0
	.align 2, 0
_0800BB58: .4byte 0x0400010e
	thumb_func_end SendRecvDone

	thumb_func_start ResetSendBuffer
ResetSendBuffer: @ 800BB5C
	push {r4-r6,lr}
	ldr r1, _0800BBA4 @ =gLink
	ldr r2, _0800BBA8 @ =0x00000339
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	movs r3, 0xCE
	lsls r3, 2
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0
	movs r6, 0x64
	adds r5, r1, 0
	adds r5, 0x18
	ldr r4, _0800BBAC @ =0x0000efff
_0800BB7A:
	movs r2, 0
	adds r1, r0, 0x1
	adds r3, r0, 0
	muls r3, r6
_0800BB82:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _0800BB82
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0800BB7A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BBA4: .4byte gLink
_0800BBA8: .4byte 0x00000339
_0800BBAC: .4byte 0x0000efff
	thumb_func_end ResetSendBuffer

	thumb_func_start ResetRecvBuffer
ResetRecvBuffer: @ 800BBB0
	push {r4-r7,lr}
	ldr r1, _0800BC10 @ =gLink
	ldr r2, _0800BC14 @ =0x00000fbd
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _0800BC18 @ =0x00000fbc
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0x64
	mov r12, r0
	movs r3, 0xCF
	lsls r3, 2
	adds r7, r1, r3
	ldr r6, _0800BC1C @ =0x0000efff
_0800BBCE:
	movs r3, 0
	lsls r0, r2, 1
	adds r5, r2, 0x1
	adds r0, r2
	lsls r0, 3
	adds r0, r2
	lsls r4, r0, 5
_0800BBDC:
	movs r2, 0
	adds r1, r3, 0x1
	mov r0, r12
	muls r0, r3
	adds r3, r0, 0
_0800BBE6:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r4
	adds r0, r7
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _0800BBE6
	lsls r0, r1, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _0800BBDC
	lsls r0, r5, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0800BBCE
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BC10: .4byte gLink
_0800BC14: .4byte 0x00000fbd
_0800BC18: .4byte 0x00000fbc
_0800BC1C: .4byte 0x0000efff
	thumb_func_end ResetRecvBuffer

	.align 2, 0 @ Don't pad with nop.
