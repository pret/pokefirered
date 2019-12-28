	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start rfu_REQBN_watchLink
rfu_REQBN_watchLink: @ 81E13F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	mov r8, r1
	str r2, [sp]
	str r3, [sp, 0x4]
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0
	str r0, [sp, 0x8]
	movs r1, 0
	str r1, [sp, 0xC]
	mov r2, r8
	strb r1, [r2]
	mov r0, sp
	ldrb r1, [r0, 0xC]
	ldr r0, [sp]
	strb r1, [r0]
	mov r2, sp
	ldrb r0, [r2, 0xC]
	ldr r2, [sp, 0x4]
	strb r0, [r2]
	ldr r4, _081E1490 @ =gRfuLinkStatus
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081E142E
	b _081E178E
_081E142E:
	ldr r0, _081E1494 @ =gRfuState
	ldr r0, [r0]
	ldrb r0, [r0, 0x14]
	cmp r0, 0
	bne _081E143A
	b _081E178E
_081E143A:
	ldr r3, _081E1498 @ =gRfuStatic
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _081E144E
	movs r0, 0xB4
	lsls r0, 1
	strh r0, [r2, 0x20]
_081E144E:
	ldr r1, [r3]
	ldrb r0, [r1, 0x6]
	cmp r0, 0
	bne _081E1460
	ldr r0, [r4]
	ldrb r0, [r0, 0x9]
	strb r0, [r1, 0x6]
	movs r1, 0x1
	str r1, [sp, 0x8]
_081E1460:
	lsls r0, r5, 24
	lsrs r0, 24
	cmp r0, 0x29
	bne _081E14A0
	ldr r0, _081E149C @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r1, 0x5]
	ldr r1, [sp]
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081E148A
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	strb r0, [r2]
_081E148A:
	movs r2, 0x2
	str r2, [sp, 0x8]
	b _081E14F8
	.align 2, 0
_081E1490: .4byte gRfuLinkStatus
_081E1494: .4byte gRfuState
_081E1498: .4byte gRfuStatic
_081E149C: .4byte gRfuFixed
_081E14A0:
	movs r0, 0x9B
	lsls r0, 1
	cmp r5, r0
	bne _081E14F0
	ldr r0, _081E154C @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r6, [r0, 0x5]
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	eors r6, r0
	ands r6, r0
	mov r0, r8
	strb r6, [r0]
	movs r0, 0x1
	ldr r1, [sp]
	strb r0, [r1]
	movs r5, 0
_081E14C6:
	mov r2, r8
	ldrb r0, [r2]
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081E14E6
	ldr r0, _081E1550 @ =gRfuLinkStatus
	ldr r0, [r0]
	adds r0, 0xA
	adds r0, r5
	movs r1, 0
	strb r1, [r0]
	adds r0, r5, 0
	bl rfu_STC_removeLinkData
_081E14E6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081E14C6
_081E14F0:
	ldr r0, [sp, 0x8]
	cmp r0, 0
	bne _081E14F8
	b _081E178E
_081E14F8:
	ldr r4, _081E154C @ =gRfuFixed
	ldr r0, [r4]
	adds r0, 0xDC
	ldr r0, [r0]
	ldr r1, [r0]
	str r1, [sp, 0x10]
	ldr r0, [r0, 0x4]
	str r0, [sp, 0x14]
	ldr r0, _081E1554 @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_LinkStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	cmp r0, 0
	bne _081E1558
	ldr r0, [r4]
	adds r0, 0xDC
	ldr r0, [r0]
	adds r2, r0, 0x4
	movs r5, 0
	ldr r3, _081E1550 @ =gRfuLinkStatus
_081E152C:
	ldr r0, [r3]
	adds r0, 0xA
	adds r0, r5
	ldrb r1, [r2]
	strb r1, [r0]
	adds r2, 0x1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081E152C
	movs r2, 0
	mov r9, r2
	movs r5, 0
	b _081E1564
	.align 2, 0
_081E154C: .4byte gRfuFixed
_081E1550: .4byte gRfuLinkStatus
_081E1554: .4byte rfu_CB_defaultCallback
_081E1558:
	movs r0, 0x11
	ldr r1, [sp, 0xC]
	bl rfu_STC_REQ_callback
	ldr r0, [sp, 0xC]
	b _081E1790
_081E1564:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r5
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	mov r10, r0
	ldr r1, [sp, 0xC]
	cmp r1, 0
	beq _081E1578
	b _081E1742
_081E1578:
	ldr r2, [sp, 0x8]
	cmp r2, 0x1
	bne _081E164E
	ldr r4, _081E15B8 @ =gRfuLinkStatus
	ldr r1, [r4]
	ldrb r0, [r1, 0x2]
	ands r0, r6
	cmp r0, 0
	beq _081E164E
	adds r0, r1, 0
	adds r0, 0xA
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _081E1640
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _081E15C0
	ldr r2, _081E15BC @ =gRfuStatic
	ldr r1, [r2]
	adds r1, 0xA
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0xA
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _081E164E
	b _081E1626
	.align 2, 0
_081E15B8: .4byte gRfuLinkStatus
_081E15BC: .4byte gRfuStatic
_081E15C0:
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, 16
	cmp r0, 0
	bne _081E164E
	ldr r0, _081E15F0 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	bne _081E15F4
	mov r2, r8
	ldrb r1, [r2]
	adds r0, r6, 0
	orrs r0, r1
	strb r0, [r2]
	mov r0, sp
	ldrb r1, [r0, 0x8]
	ldr r0, [sp]
	b _081E164C
	.align 2, 0
_081E15F0: .4byte gRfuFixed
_081E15F4:
	ldr r2, _081E163C @ =gRfuStatic
	ldr r1, [r2]
	adds r1, 0xA
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	ldr r2, [r2]
	lsrs r0, 24
	ldrh r1, [r2, 0x1A]
	cmp r0, r1
	bls _081E164E
	adds r0, r2, 0
	adds r0, 0xA
	adds r0, r5
	mov r2, sp
	ldrb r2, [r2, 0xC]
	strb r2, [r0]
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	bl STWI_send_DisconnectREQ
	bl STWI_poll_CommandEnd
_081E1626:
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, 0
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r2, sp
	ldrb r0, [r2, 0x8]
	ldr r2, [sp]
	strb r0, [r2]
	b _081E164E
	.align 2, 0
_081E163C: .4byte gRfuStatic
_081E1640:
	ldr r0, _081E16B0 @ =gRfuStatic
	ldr r0, [r0]
	adds r0, 0xA
	adds r0, r5
	mov r1, sp
	ldrb r1, [r1, 0xC]
_081E164C:
	strb r1, [r0]
_081E164E:
	ldr r2, _081E16B4 @ =gRfuLinkStatus
	mov r12, r2
	ldr r1, [r2]
	ldrb r7, [r1]
	adds r0, r5, 0x1
	mov r10, r0
	cmp r7, 0x1
	bne _081E1742
	adds r0, r1, 0
	adds r0, 0xA
	adds r4, r0, r5
	ldrb r3, [r4]
	cmp r3, 0
	beq _081E1742
	ldrb r2, [r1, 0x3]
	adds r0, r6, 0
	ands r0, r2
	cmp r0, 0
	beq _081E16BE
	cmp r3, 0xA
	bls _081E16B8
	ldr r2, [sp, 0x4]
	ldrb r1, [r2]
	adds r0, r6, 0
	orrs r0, r1
	strb r0, [r2]
	mov r0, r12
	ldr r2, [r0]
	ldrb r1, [r2, 0x2]
	adds r0, r6, 0
	orrs r0, r1
	movs r3, 0
	strb r0, [r2, 0x2]
	mov r2, r12
	ldr r1, [r2]
	ldrb r0, [r1, 0x3]
	bics r0, r6
	strb r0, [r1, 0x3]
	ldr r1, [r2]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	ldr r0, _081E16B0 @ =gRfuStatic
	ldr r0, [r0]
	adds r0, 0xA
	adds r0, r5
	strb r3, [r0]
	b _081E1742
	.align 2, 0
_081E16B0: .4byte gRfuStatic
_081E16B4: .4byte gRfuLinkStatus
_081E16B8:
	movs r0, 0
	strb r0, [r4]
	b _081E1742
_081E16BE:
	ldrb r0, [r1, 0x2]
	orrs r0, r2
	ands r0, r6
	cmp r0, 0
	bne _081E1742
	bl STWI_send_SlotStatusREQ
	bl STWI_poll_CommandEnd
	ldr r0, _081E1708 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r2, [r0]
	ldrb r0, [r2, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, 0x8
	cmp r3, 0
	beq _081E1742
	ldrh r4, [r2]
	ldrb r0, [r2, 0x2]
	cmp r0, r5
	bne _081E1710
	ldr r0, _081E170C @ =gRfuStatic
	ldr r0, [r0]
	lsls r1, r5, 1
	adds r0, 0x12
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _081E1710
	lsls r7, r5
	mov r0, r9
	orrs r0, r7
	lsls r0, 24
	b _081E173E
	.align 2, 0
_081E1708: .4byte gRfuFixed
_081E170C: .4byte gRfuStatic
_081E1710:
	adds r2, 0x4
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _081E1742
	ldrh r4, [r2]
	ldrb r0, [r2, 0x2]
	cmp r0, r5
	bne _081E1710
	ldr r0, _081E17A0 @ =gRfuStatic
	ldr r0, [r0]
	lsls r1, r5, 1
	adds r0, 0x12
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _081E1710
	movs r0, 0x1
	lsls r0, r5
	mov r1, r9
	orrs r1, r0
	lsls r0, r1, 24
_081E173E:
	lsrs r0, 24
	mov r9, r0
_081E1742:
	ldr r0, _081E17A4 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	mov r2, r8
	ldrb r0, [r2]
	ands r0, r1
	ands r6, r0
	cmp r6, 0
	beq _081E175C
	adds r0, r5, 0
	movs r1, 0
	bl rfu_STC_removeLinkData
_081E175C:
	mov r1, r10
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bhi _081E1768
	b _081E1564
_081E1768:
	mov r2, r9
	cmp r2, 0
	beq _081E1778
	mov r0, r9
	bl STWI_send_DisconnectREQ
	bl STWI_poll_CommandEnd
_081E1778:
	ldr r1, _081E17A8 @ =gRfuFixed
	ldr r0, [r1]
	adds r0, 0xDC
	ldr r0, [r0]
	ldr r2, [sp, 0x10]
	str r2, [r0]
	ldr r0, [r1]
	adds r0, 0xDC
	ldr r0, [r0]
	ldr r1, [sp, 0x14]
	str r1, [r0, 0x4]
_081E178E:
	movs r0, 0
_081E1790:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E17A0: .4byte gRfuStatic
_081E17A4: .4byte gRfuLinkStatus
_081E17A8: .4byte gRfuFixed
	thumb_func_end rfu_REQBN_watchLink

	thumb_func_start rfu_STC_removeLinkData
rfu_STC_removeLinkData: @ 81E17AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r7
	lsrs r5, r0, 24
	ldr r1, _081E1850 @ =gRfuLinkStatus
	ldr r4, [r1]
	ldrb r0, [r4, 0x2]
	ands r0, r5
	mov r8, r1
	cmp r0, 0
	beq _081E17DE
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _081E17DE
	subs r0, 0x1
	strb r0, [r4, 0x1]
_081E17DE:
	mov r3, r8
	ldr r2, [r3]
	mvns r6, r5
	ldrb r1, [r2, 0x2]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r2, 0x2]
	ldr r2, [r3]
	ldrb r1, [r2, 0x3]
	adds r0, r5, 0
	orrs r0, r1
	strb r0, [r2, 0x3]
	ldr r3, [r3]
	ldr r0, [r3]
	ldr r1, _081E1854 @ =0x00ff00ff
	ands r0, r1
	cmp r0, 0
	bne _081E1806
	movs r0, 0xFF
	strb r0, [r3]
_081E1806:
	mov r0, r12
	cmp r0, 0
	beq _081E1844
	mov r1, sp
	movs r4, 0
	movs r0, 0
	strh r0, [r1]
	lsls r0, r7, 5
	adds r0, 0x14
	mov r2, r8
	ldr r1, [r2]
	adds r1, r0
	ldr r2, _081E1858 @ =0x01000010
	mov r0, sp
	bl CpuSet
	mov r0, r8
	ldr r2, [r0]
	ldrb r1, [r2, 0x3]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r2, 0x3]
	mov r2, r8
	ldr r1, [r2]
	ldrb r0, [r1, 0x7]
	ands r6, r0
	strb r6, [r1, 0x7]
	ldr r0, [r2]
	adds r0, 0xA
	adds r0, r7
	strb r4, [r0]
_081E1844:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E1850: .4byte gRfuLinkStatus
_081E1854: .4byte 0x00ff00ff
_081E1858: .4byte 0x01000010
	thumb_func_end rfu_STC_removeLinkData

	thumb_func_start rfu_REQ_disconnect
rfu_REQ_disconnect: @ 81E185C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _081E18A0 @ =gRfuLinkStatus
	ldr r1, [r2]
	ldrb r0, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	ands r0, r4
	cmp r0, 0
	beq _081E18E0
	ldr r0, _081E18A4 @ =gRfuStatic
	ldr r1, [r0]
	strb r4, [r1, 0x5]
	ldr r2, [r2]
	ldrb r1, [r2]
	adds r3, r0, 0
	cmp r1, 0xFF
	bne _081E18A8
	ldr r0, [r3]
	ldrb r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081E18A8
	ldrb r0, [r2, 0x3]
	ands r0, r4
	cmp r0, 0
	beq _081E18E0
	movs r0, 0x30
	movs r1, 0
	bl rfu_CB_disconnect
	b _081E18E0
	.align 2, 0
_081E18A0: .4byte gRfuLinkStatus
_081E18A4: .4byte gRfuStatic
_081E18A8:
	ldr r0, [r3]
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _081E18D4
	ldr r0, _081E18D0 @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_SC_EndREQ
	bl STWI_poll_CommandEnd
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _081E18D4
	movs r0, 0x1B
	bl rfu_STC_REQ_callback
	b _081E18E0
	.align 2, 0
_081E18D0: .4byte rfu_CB_defaultCallback
_081E18D4:
	ldr r0, _081E18E8 @ =rfu_CB_disconnect
	bl STWI_set_Callback_M
	adds r0, r4, 0
	bl STWI_send_DisconnectREQ
_081E18E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081E18E8: .4byte rfu_CB_disconnect
	thumb_func_end rfu_REQ_disconnect

	thumb_func_start rfu_CB_disconnect
rfu_CB_disconnect: @ 81E18EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r5, 0x3
	bne _081E1928
	ldr r0, _081E19BC @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	bne _081E1928
	ldr r0, _081E19C0 @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, 16
	cmp r0, 0
	bne _081E1928
	ldr r0, _081E19C4 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	bne _081E1928
	movs r5, 0
_081E1928:
	ldr r3, _081E19C8 @ =gRfuStatic
	ldr r2, [r3]
	ldr r0, _081E19BC @ =gRfuLinkStatus
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	ldrb r1, [r2, 0x5]
	ands r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _081E19C4 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r1, [r0]
	ldr r0, [r3]
	ldrb r0, [r0, 0x5]
	strb r0, [r1, 0x8]
	cmp r5, 0
	bne _081E1976
	movs r4, 0
_081E1950:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r4
	lsrs r0, 24
	ldr r1, _081E19C8 @ =gRfuStatic
	ldr r1, [r1]
	ldrb r1, [r1, 0x5]
	ands r0, r1
	cmp r0, 0
	beq _081E196C
	adds r0, r4, 0
	movs r1, 0x1
	bl rfu_STC_removeLinkData
_081E196C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E1950
_081E1976:
	ldr r0, _081E19BC @ =gRfuLinkStatus
	ldr r2, [r0]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	orrs r0, r1
	cmp r0, 0
	bne _081E1988
	movs r0, 0xFF
	strb r0, [r2]
_081E1988:
	adds r0, r6, 0
	adds r1, r5, 0
	bl rfu_STC_REQ_callback
	ldr r0, _081E19C8 @ =gRfuStatic
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _081E19B6
	ldr r0, _081E19C0 @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_SC_StartREQ
	bl STWI_poll_CommandEnd
	adds r5, r0, 0
	cmp r5, 0
	beq _081E19B6
	movs r0, 0x19
	adds r1, r5, 0
	bl rfu_STC_REQ_callback
_081E19B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081E19BC: .4byte gRfuLinkStatus
_081E19C0: .4byte rfu_CB_defaultCallback
_081E19C4: .4byte gRfuFixed
_081E19C8: .4byte gRfuStatic
	thumb_func_end rfu_CB_disconnect

	thumb_func_start rfu_REQ_CHILD_startConnectRecovery
rfu_REQ_CHILD_startConnectRecovery: @ 81E19CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081E1A1C @ =gRfuStatic
	ldr r0, [r0]
	strb r5, [r0, 0x5]
	movs r4, 0
	movs r0, 0x1
	ands r0, r5
	ldr r2, _081E1A20 @ =rfu_STC_REQ_callback
	cmp r0, 0
	bne _081E19FA
	movs r1, 0x1
_081E19E6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bhi _081E19FA
	adds r0, r5, 0
	asrs r0, r4
	ands r0, r1
	cmp r0, 0
	beq _081E19E6
_081E19FA:
	adds r0, r2, 0
	bl STWI_set_Callback_M
	ldr r0, _081E1A24 @ =gRfuLinkStatus
	ldr r1, [r0]
	lsls r0, r4, 5
	adds r0, r1, r0
	ldrh r0, [r0, 0x14]
	adds r1, 0x94
	ldrh r1, [r1]
	adds r2, r5, 0
	bl STWI_send_CPR_StartREQ
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E1A1C: .4byte gRfuStatic
_081E1A20: .4byte rfu_STC_REQ_callback
_081E1A24: .4byte gRfuLinkStatus
	thumb_func_end rfu_REQ_CHILD_startConnectRecovery

	thumb_func_start rfu_REQ_CHILD_pollConnectRecovery
rfu_REQ_CHILD_pollConnectRecovery: @ 81E1A28
	push {lr}
	ldr r0, _081E1A38 @ =rfu_CB_CHILD_pollConnectRecovery
	bl STWI_set_Callback_M
	bl STWI_send_CPR_PollingREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E1A38: .4byte rfu_CB_CHILD_pollConnectRecovery
	thumb_func_end rfu_REQ_CHILD_pollConnectRecovery

	thumb_func_start rfu_CB_CHILD_pollConnectRecovery
rfu_CB_CHILD_pollConnectRecovery: @ 81E1A3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r7, r1, 16
	cmp r7, 0
	bne _081E1AC0
	ldr r0, _081E1AD4 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _081E1AC0
	ldr r0, _081E1AD8 @ =gRfuStatic
	ldr r1, [r0]
	ldrb r1, [r1, 0x5]
	adds r6, r0, 0
	cmp r1, 0
	beq _081E1AC0
	ldr r1, _081E1ADC @ =gRfuLinkStatus
	ldr r0, [r1]
	strb r7, [r0]
	movs r4, 0
	adds r5, r1, 0
	mov r12, r4
_081E1A76:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r4
	lsrs r3, r0, 24
	ldr r2, [r5]
	ldr r0, [r6]
	ldrb r0, [r0, 0x5]
	ands r0, r3
	ldrb r1, [r2, 0x3]
	ands r0, r1
	cmp r0, 0
	beq _081E1AB0
	ldrb r1, [r2, 0x2]
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	bics r0, r3
	strb r0, [r1, 0x3]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	ldr r0, [r6]
	adds r0, 0xA
	adds r0, r4
	mov r1, r12
	strb r1, [r0]
_081E1AB0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E1A76
	ldr r1, [r6]
	movs r0, 0
	strb r0, [r1, 0x5]
_081E1AC0:
	mov r0, r8
	adds r1, r7, 0
	bl rfu_STC_REQ_callback
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E1AD4: .4byte gRfuFixed
_081E1AD8: .4byte gRfuStatic
_081E1ADC: .4byte gRfuLinkStatus
	thumb_func_end rfu_CB_CHILD_pollConnectRecovery

	thumb_func_start rfu_CHILD_getConnectRecoveryStatus
rfu_CHILD_getConnectRecoveryStatus: @ 81E1AE0
	push {lr}
	adds r2, r0, 0
	movs r0, 0xFF
	strb r0, [r2]
	ldr r0, _081E1B00 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x4D
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _081E1B04
	movs r0, 0x10
	b _081E1B0A
	.align 2, 0
_081E1B00: .4byte gRfuFixed
_081E1B04:
	ldrb r0, [r1, 0x4]
	strb r0, [r2]
	movs r0, 0
_081E1B0A:
	pop {r1}
	bx r1
	thumb_func_end rfu_CHILD_getConnectRecoveryStatus

	thumb_func_start rfu_REQ_CHILD_endConnectRecovery
rfu_REQ_CHILD_endConnectRecovery: @ 81E1B10
	push {lr}
	ldr r0, _081E1B20 @ =rfu_CB_CHILD_pollConnectRecovery
	bl STWI_set_Callback_M
	bl STWI_send_CPR_EndREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E1B20: .4byte rfu_CB_CHILD_pollConnectRecovery
	thumb_func_end rfu_REQ_CHILD_endConnectRecovery

	thumb_func_start rfu_STC_fastCopy
rfu_STC_fastCopy: @ 81E1B24
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r3, [r5]
	ldr r1, [r6]
	subs r2, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _081E1B48
	adds r4, r0, 0
_081E1B3A:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, 0x1
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, r4
	bne _081E1B3A
_081E1B48:
	str r3, [r5]
	str r1, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end rfu_STC_fastCopy

	thumb_func_start rfu_REQ_changeMasterSlave
rfu_REQ_changeMasterSlave: @ 81E1B54
	push {lr}
	movs r0, 0x1
	bl STWI_read_status
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _081E1B74
	ldr r0, _081E1B70 @ =rfu_STC_REQ_callback
	bl STWI_set_Callback_M
	bl STWI_send_MS_ChangeREQ
	b _081E1B7C
	.align 2, 0
_081E1B70: .4byte rfu_STC_REQ_callback
_081E1B74:
	movs r0, 0x27
	movs r1, 0
	bl rfu_STC_REQ_callback
_081E1B7C:
	pop {r0}
	bx r0
	thumb_func_end rfu_REQ_changeMasterSlave

	thumb_func_start rfu_getMasterSlave
rfu_getMasterSlave: @ 81E1B80
	push {lr}
	movs r0, 0x1
	bl STWI_read_status
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bne _081E1BAE
	ldr r0, _081E1BB4 @ =gRfuState
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r0, [r0]
	cmp r0, 0
	beq _081E1BAE
	ldrb r0, [r1, 0x6]
	cmp r0, 0x27
	beq _081E1BAC
	cmp r0, 0x25
	beq _081E1BAC
	cmp r0, 0x37
	bne _081E1BAE
_081E1BAC:
	movs r2, 0
_081E1BAE:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_081E1BB4: .4byte gRfuState
	thumb_func_end rfu_getMasterSlave

	thumb_func_start rfu_clearAllSlot
rfu_clearAllSlot: @ 81E1BB8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _081E1C3C @ =0x04000208
	ldrh r0, [r1]
	mov r8, r0
	movs r0, 0
	strh r0, [r1]
	movs r5, 0
	mov r0, sp
	adds r0, 0x2
	movs r7, 0
	adds r6, r0, 0
_081E1BD4:
	mov r0, sp
	strh r7, [r0]
	ldr r0, _081E1C40 @ =gRfuSlotStatusNI
	lsls r4, r5, 2
	adds r0, r4, r0
	ldr r1, [r0]
	mov r0, sp
	ldr r2, _081E1C44 @ =0x01000034
	bl CpuSet
	strh r7, [r6]
	ldr r0, _081E1C48 @ =gRfuSlotStatusUNI
	adds r4, r0
	ldr r1, [r4]
	adds r0, r6, 0
	ldr r2, _081E1C4C @ =0x0100000a
	bl CpuSet
	ldr r3, _081E1C50 @ =gRfuLinkStatus
	ldr r0, [r3]
	adds r0, 0x10
	adds r0, r5
	movs r1, 0x10
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _081E1BD4
	ldr r2, [r3]
	movs r1, 0
	movs r0, 0x57
	strb r0, [r2, 0xF]
	ldr r0, [r3]
	strb r1, [r0, 0x4]
	ldr r0, [r3]
	strb r1, [r0, 0x5]
	ldr r0, [r3]
	strb r1, [r0, 0x6]
	ldr r0, _081E1C54 @ =gRfuStatic
	ldr r0, [r0]
	strb r1, [r0, 0x2]
	ldr r0, _081E1C3C @ =0x04000208
	mov r1, r8
	strh r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E1C3C: .4byte 0x04000208
_081E1C40: .4byte gRfuSlotStatusNI
_081E1C44: .4byte 0x01000034
_081E1C48: .4byte gRfuSlotStatusUNI
_081E1C4C: .4byte 0x0100000a
_081E1C50: .4byte gRfuLinkStatus
_081E1C54: .4byte gRfuStatic
	thumb_func_end rfu_clearAllSlot

	thumb_func_start rfu_STC_releaseFrame
rfu_STC_releaseFrame: @ 81E1C58
	push {r4-r6,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r0, _081E1C90 @ =gRfuStatic
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081E1C98
	ldr r6, _081E1C94 @ =gRfuLinkStatus
	cmp r3, 0
	bne _081E1C84
	ldr r1, [r6]
	ldrb r0, [r1, 0xF]
	ldrh r4, [r4, 0x2E]
	adds r0, r4
	strb r0, [r1, 0xF]
_081E1C84:
	ldr r1, [r6]
	ldrb r0, [r1, 0xF]
	adds r0, 0x3
	strb r0, [r1, 0xF]
	b _081E1CB8
	.align 2, 0
_081E1C90: .4byte gRfuStatic
_081E1C94: .4byte gRfuLinkStatus
_081E1C98:
	ldr r6, _081E1CC0 @ =gRfuLinkStatus
	cmp r3, 0
	bne _081E1CAC
	ldr r1, [r6]
	adds r1, 0x10
	adds r1, r2
	ldrb r0, [r1]
	ldrh r4, [r4, 0x2E]
	adds r0, r4
	strb r0, [r1]
_081E1CAC:
	ldr r1, [r6]
	adds r1, 0x10
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x2
	strb r0, [r1]
_081E1CB8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081E1CC0: .4byte gRfuLinkStatus
	thumb_func_end rfu_STC_releaseFrame

	thumb_func_start rfu_clearSlot
rfu_clearSlot: @ 81E1CC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	cmp r7, 0x3
	bls _081E1CE4
	movs r0, 0x80
	lsls r0, 3
	b _081E1E5C
_081E1CE4:
	movs r0, 0xF
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _081E1CF4
	movs r0, 0xC0
	lsls r0, 3
	b _081E1E5C
_081E1CF4:
	ldr r1, _081E1D38 @ =0x04000208
	ldrh r0, [r1]
	mov r10, r0
	movs r0, 0
	strh r0, [r1]
	movs r0, 0xC
	mov r2, r8
	ands r0, r2
	cmp r0, 0
	beq _081E1DBC
	movs r3, 0
	ldr r1, _081E1D3C @ =gRfuSlotStatusNI
	lsls r0, r7, 2
	adds r0, r1
	mov r9, r0
_081E1D12:
	movs r4, 0
	cmp r3, 0
	bne _081E1D44
	movs r0, 0x4
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _081E1D64
	mov r2, r9
	ldr r4, [r2]
	ldr r0, _081E1D40 @ =gRfuLinkStatus
	ldr r2, [r0]
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	ldrb r0, [r2, 0x4]
	bics r0, r1
	strb r0, [r2, 0x4]
	b _081E1D64
	.align 2, 0
_081E1D38: .4byte 0x04000208
_081E1D3C: .4byte gRfuSlotStatusNI
_081E1D40: .4byte gRfuLinkStatus
_081E1D44:
	movs r0, 0x8
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _081E1D64
	mov r2, r9
	ldr r0, [r2]
	adds r4, r0, 0
	adds r4, 0x34
	ldr r0, _081E1DF8 @ =gRfuLinkStatus
	ldr r2, [r0]
	movs r1, 0x1
	lsls r1, r7
	ldrb r0, [r2, 0x5]
	bics r0, r1
	strb r0, [r2, 0x5]
_081E1D64:
	adds r6, r3, 0x1
	cmp r4, 0
	beq _081E1DB4
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _081E1DA4
	lsls r1, r3, 24
	lsrs r1, 24
	adds r0, r7, 0
	adds r2, r4, 0
	bl rfu_STC_releaseFrame
	movs r1, 0
	adds r2, r4, 0
	adds r2, 0x2C
	movs r5, 0x1
	movs r3, 0
_081E1D8E:
	ldrb r0, [r2]
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _081E1D9A
	strh r3, [r4, 0x2]
_081E1D9A:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _081E1D8E
_081E1DA4:
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	mov r0, sp
	adds r1, r4, 0
	ldr r2, _081E1DFC @ =0x0100001a
	bl CpuSet
_081E1DB4:
	lsls r0, r6, 16
	lsrs r3, r0, 16
	cmp r3, 0x1
	bls _081E1D12
_081E1DBC:
	movs r0, 0x1
	mov r4, r8
	ands r0, r4
	cmp r0, 0
	beq _081E1E32
	ldr r1, _081E1E00 @ =gRfuSlotStatusUNI
	lsls r0, r7, 2
	adds r0, r1
	ldr r3, [r0]
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _081E1E24
	ldr r0, _081E1E04 @ =gRfuStatic
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081E1E08
	ldr r2, _081E1DF8 @ =gRfuLinkStatus
	ldr r1, [r2]
	ldrb r0, [r1, 0xF]
	adds r0, 0x3
	ldrb r4, [r3, 0x4]
	adds r0, r4
	strb r0, [r1, 0xF]
	b _081E1E1A
	.align 2, 0
_081E1DF8: .4byte gRfuLinkStatus
_081E1DFC: .4byte 0x0100001a
_081E1E00: .4byte gRfuSlotStatusUNI
_081E1E04: .4byte gRfuStatic
_081E1E08:
	ldr r2, _081E1E6C @ =gRfuLinkStatus
	ldr r1, [r2]
	adds r1, 0x10
	adds r1, r7
	ldrb r0, [r1]
	adds r0, 0x2
	ldrb r4, [r3, 0x4]
	adds r0, r4
	strb r0, [r1]
_081E1E1A:
	ldr r2, [r2]
	ldrb r1, [r3, 0x3]
	ldrb r0, [r2, 0x6]
	bics r0, r1
	strb r0, [r2, 0x6]
_081E1E24:
	mov r0, sp
	movs r1, 0
	strh r1, [r0]
	ldr r2, _081E1E70 @ =0x01000006
	adds r1, r3, 0
	bl CpuSet
_081E1E32:
	movs r0, 0x2
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _081E1E54
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _081E1E74 @ =gRfuSlotStatusUNI
	lsls r0, r7, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0xC
	ldr r2, _081E1E78 @ =0x01000004
	mov r0, sp
	bl CpuSet
_081E1E54:
	ldr r0, _081E1E7C @ =0x04000208
	mov r2, r10
	strh r2, [r0]
	movs r0, 0
_081E1E5C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E1E6C: .4byte gRfuLinkStatus
_081E1E70: .4byte 0x01000006
_081E1E74: .4byte gRfuSlotStatusUNI
_081E1E78: .4byte 0x01000004
_081E1E7C: .4byte 0x04000208
	thumb_func_end rfu_clearSlot

	thumb_func_start rfu_setRecvBuffer
rfu_setRecvBuffer: @ 81E1E80
	push {r4-r6,lr}
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r3, 0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r1, 0
	cmp r1, 0x3
	bls _081E1E9C
	movs r0, 0x80
	lsls r0, 3
	b _081E1ED4
_081E1E9C:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _081E1EB8
	ldr r0, _081E1EB4 @ =gRfuSlotStatusNI
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	str r5, [r0, 0x68]
	str r6, [r0, 0x6C]
	b _081E1ED2
	.align 2, 0
_081E1EB4: .4byte gRfuSlotStatusNI
_081E1EB8:
	movs r0, 0x10
	ands r2, r0
	cmp r2, 0
	bne _081E1EC6
	movs r0, 0xC0
	lsls r0, 3
	b _081E1ED4
_081E1EC6:
	ldr r0, _081E1EDC @ =gRfuSlotStatusUNI
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	str r5, [r0, 0x14]
	str r6, [r0, 0x18]
_081E1ED2:
	movs r0, 0
_081E1ED4:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081E1EDC: .4byte gRfuSlotStatusUNI
	thumb_func_end rfu_setRecvBuffer

	thumb_func_start rfu_NI_setSendData
rfu_NI_setSendData: @ 81E1EE0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	str r3, [sp]
	movs r0, 0x20
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl rfu_STC_setSendData_org
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end rfu_NI_setSendData

	thumb_func_start rfu_UNI_setSendData
rfu_UNI_setSendData: @ 81E1F0C
	push {lr}
	sub sp, 0x4
	adds r3, r1, 0
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _081E1F28 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E1F2C
	adds r0, r2, 0x3
	b _081E1F2E
	.align 2, 0
_081E1F28: .4byte gRfuLinkStatus
_081E1F2C:
	adds r0, r2, 0x2
_081E1F2E:
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0
	str r0, [sp]
	movs r0, 0x10
	bl rfu_STC_setSendData_org
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end rfu_UNI_setSendData

	thumb_func_start rfu_NI_CHILD_setSendGameName
rfu_NI_CHILD_setSendGameName: @ 81E1F48
	push {lr}
	sub sp, 0x4
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r0
	lsrs r1, 24
	ldr r0, _081E1F78 @ =gRfuLinkStatus
	ldr r3, [r0]
	adds r3, 0x98
	movs r0, 0x1A
	str r0, [sp]
	movs r0, 0x40
	bl rfu_STC_setSendData_org
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_081E1F78: .4byte gRfuLinkStatus
	thumb_func_end rfu_NI_CHILD_setSendGameName

	thumb_func_start rfu_STC_setSendData_org
rfu_STC_setSendData_org: @ 81E1F7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	str r3, [sp]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r0, _081E1FA8 @ =gRfuLinkStatus
	ldr r2, [r0]
	ldrb r1, [r2]
	mov r10, r0
	cmp r1, 0xFF
	bne _081E1FB0
	ldr r0, _081E1FAC @ =0x00000301
	b _081E2166
	.align 2, 0
_081E1FA8: .4byte gRfuLinkStatus
_081E1FAC: .4byte 0x00000301
_081E1FB0:
	movs r0, 0xF
	ands r0, r3
	cmp r0, 0
	bne _081E1FBE
	movs r0, 0x80
	lsls r0, 3
	b _081E2166
_081E1FBE:
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	orrs r0, r1
	ands r0, r3
	cmp r0, r3
	beq _081E1FD4
	ldr r0, _081E1FD0 @ =0x00000401
	b _081E2166
	.align 2, 0
_081E1FD0: .4byte 0x00000401
_081E1FD4:
	movs r0, 0x10
	ands r0, r6
	cmp r0, 0
	beq _081E1FE0
	ldrb r0, [r2, 0x6]
	b _081E1FE2
_081E1FE0:
	ldrb r0, [r2, 0x4]
_081E1FE2:
	ands r0, r3
	cmp r0, 0
	beq _081E1FF0
	ldr r0, _081E1FEC @ =0x00000402
	b _081E2166
	.align 2, 0
_081E1FEC: .4byte 0x00000402
_081E1FF0:
	movs r2, 0
	movs r0, 0x1
	ands r0, r3
	ldr r4, _081E2020 @ =_Str_RfuHeader
	cmp r0, 0
	bne _081E2012
	movs r1, 0x1
_081E1FFE:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bhi _081E2012
	adds r0, r3, 0
	asrs r0, r2
	ands r0, r1
	cmp r0, 0
	beq _081E1FFE
_081E2012:
	mov r0, r10
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _081E2024
	adds r1, 0xF
	b _081E202E
	.align 2, 0
_081E2020: .4byte _Str_RfuHeader
_081E2024:
	cmp r0, 0
	bne _081E2030
	adds r0, r2, 0
	adds r0, 0x10
	adds r1, r0
_081E202E:
	mov r9, r1
_081E2030:
	mov r1, r10
	ldr r0, [r1]
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r4
	ldrb r4, [r0]
	mov r0, r9
	ldrb r0, [r0]
	cmp r8, r0
	bhi _081E2048
	cmp r8, r4
	bhi _081E204E
_081E2048:
	movs r0, 0xA0
	lsls r0, 3
	b _081E2166
_081E204E:
	ldr r1, _081E209C @ =0x04000208
	ldrh r0, [r1]
	str r0, [sp, 0x4]
	movs r7, 0
	strh r7, [r1]
	movs r0, 0x20
	ands r0, r6
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _081E2068
	cmp r6, 0x40
	bne _081E2124
_081E2068:
	ldr r1, _081E20A0 @ =gRfuSlotStatusNI
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	mov r12, r0
	movs r1, 0
	strh r1, [r0, 0x18]
	mov r1, r12
	adds r1, 0x2D
	mov r2, r12
	str r1, [r2, 0x4]
	movs r0, 0x7
	str r0, [r2, 0x14]
	mov r0, r12
	adds r0, 0x2C
	strb r3, [r0]
	strb r3, [r2, 0x1A]
	mov r2, r8
	subs r0, r2, r4
	mov r2, r12
	strh r0, [r2, 0x2E]
	cmp r5, 0
	beq _081E20A4
	strb r7, [r1]
	b _081E20A8
	.align 2, 0
_081E209C: .4byte 0x04000208
_081E20A0: .4byte gRfuSlotStatusNI
_081E20A4:
	movs r0, 0x1
	strb r0, [r1]
_081E20A8:
	ldr r0, [sp, 0x28]
	mov r1, r12
	str r0, [r1, 0x30]
	ldr r2, [sp]
	str r2, [r1, 0x28]
	movs r1, 0
	mov r0, r12
	strb r1, [r0, 0x1F]
	adds r0, 0x20
	strb r1, [r0]
	mov r4, r12
	adds r4, 0x1B
	movs r6, 0
	mov r2, r12
	adds r2, 0x21
	movs r5, 0x1
_081E20C8:
	adds r0, r4, r1
	strb r6, [r0]
	adds r0, r2, r1
	strb r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _081E20C8
	movs r2, 0
	movs r5, 0x1
	ldr r4, _081E211C @ =gRfuSlotStatusNI
	movs r1, 0
_081E20E2:
	adds r0, r3, 0
	asrs r0, r2
	ands r0, r5
	cmp r0, 0
	beq _081E20F4
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	strh r1, [r0, 0x2]
_081E20F4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _081E20E2
	mov r1, r10
	ldr r2, [r1]
	ldrb r1, [r2, 0x4]
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2, 0x4]
	mov r2, r9
	ldrb r0, [r2]
	mov r1, r8
	subs r0, r1
	strb r0, [r2]
	ldr r0, _081E2120 @ =0x00008021
	mov r2, r12
	strh r0, [r2]
	b _081E215C
	.align 2, 0
_081E211C: .4byte gRfuSlotStatusNI
_081E2120: .4byte 0x00008021
_081E2124:
	movs r0, 0x10
	ands r0, r6
	cmp r0, 0
	beq _081E215C
	ldr r1, _081E2178 @ =gRfuSlotStatusUNI
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, [r0]
	strb r3, [r1, 0x3]
	ldr r0, [sp]
	str r0, [r1, 0x8]
	mov r2, r8
	subs r0, r2, r4
	strh r0, [r1, 0x4]
	mov r2, r9
	ldrb r0, [r2]
	mov r2, r8
	subs r0, r2
	mov r2, r9
	strb r0, [r2]
	ldr r0, _081E217C @ =0x00008024
	strh r0, [r1]
	mov r0, r10
	ldr r2, [r0]
	ldrb r1, [r2, 0x6]
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2, 0x6]
_081E215C:
	ldr r0, _081E2180 @ =0x04000208
	mov r1, sp
	ldrh r1, [r1, 0x4]
	strh r1, [r0]
	movs r0, 0
_081E2166:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E2178: .4byte gRfuSlotStatusUNI
_081E217C: .4byte 0x00008024
_081E2180: .4byte 0x04000208
	thumb_func_end rfu_STC_setSendData_org

	thumb_func_start rfu_changeSendTarget
rfu_changeSendTarget: @ 81E2184
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	cmp r7, 0x3
	bls _081E21A8
	movs r0, 0x80
	lsls r0, 3
	b _081E22DC
_081E21A8:
	cmp r0, 0x20
	bne _081E2248
	ldr r0, _081E2238 @ =gRfuSlotStatusNI
	mov r12, r0
	lsls r0, r7, 2
	add r0, r12
	ldr r5, [r0]
	ldrh r2, [r5]
	ldr r1, _081E223C @ =0x00008020
	adds r0, r1, 0
	ands r0, r2
	cmp r0, r1
	bne _081E225E
	ldrb r0, [r5, 0x1A]
	adds r3, r6, 0
	eors r3, r0
	adds r2, r3, 0
	ands r2, r6
	cmp r2, 0
	bne _081E2296
	cmp r3, 0
	bne _081E21D6
	b _081E22DA
_081E21D6:
	ldr r1, _081E2240 @ =0x04000208
	ldrh r0, [r1]
	mov r8, r0
	strh r2, [r1]
	movs r2, 0
	mvns r1, r3
	str r1, [sp]
	lsls r4, r6, 24
	mov r10, r4
	movs r0, 0x1
	mov r9, r0
	movs r1, 0
_081E21EE:
	adds r0, r3, 0
	asrs r0, r2
	mov r4, r9
	ands r0, r4
	cmp r0, 0
	beq _081E2202
	lsls r0, r2, 2
	add r0, r12
	ldr r0, [r0]
	strh r1, [r0, 0x2]
_081E2202:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _081E21EE
	ldr r0, _081E2244 @ =gRfuLinkStatus
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	ldr r2, [sp]
	ands r2, r0
	strb r2, [r1, 0x4]
	strb r6, [r5, 0x1A]
	mov r0, r10
	cmp r0, 0
	bne _081E222E
	adds r0, r7, 0
	movs r1, 0
	adds r2, r5, 0
	bl rfu_STC_releaseFrame
	movs r0, 0x27
	strh r0, [r5]
_081E222E:
	ldr r0, _081E2240 @ =0x04000208
	mov r1, r8
	strh r1, [r0]
	b _081E22DA
	.align 2, 0
_081E2238: .4byte gRfuSlotStatusNI
_081E223C: .4byte 0x00008020
_081E2240: .4byte 0x04000208
_081E2244: .4byte gRfuLinkStatus
_081E2248:
	cmp r3, 0x10
	bne _081E22D4
	ldr r3, _081E2264 @ =gRfuSlotStatusUNI
	lsls r1, r7, 2
	adds r0, r1, r3
	ldr r0, [r0]
	ldrh r2, [r0]
	ldr r0, _081E2268 @ =0x00008024
	adds r5, r3, 0
	cmp r2, r0
	beq _081E2270
_081E225E:
	ldr r0, _081E226C @ =0x00000403
	b _081E22DC
	.align 2, 0
_081E2264: .4byte gRfuSlotStatusUNI
_081E2268: .4byte 0x00008024
_081E226C: .4byte 0x00000403
_081E2270:
	movs r3, 0
	movs r2, 0
	adds r4, r5, 0
_081E2276:
	cmp r2, r7
	beq _081E2284
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	orrs r3, r0
_081E2284:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _081E2276
	adds r2, r6, 0
	ands r2, r3
	cmp r2, 0
	beq _081E22A0
_081E2296:
	ldr r0, _081E229C @ =0x00000404
	b _081E22DC
	.align 2, 0
_081E229C: .4byte 0x00000404
_081E22A0:
	ldr r3, _081E22CC @ =0x04000208
	ldrh r0, [r3]
	mov r8, r0
	strh r2, [r3]
	ldr r4, _081E22D0 @ =gRfuLinkStatus
	ldr r2, [r4]
	adds r5, r1, r5
	ldr r0, [r5]
	ldrb r1, [r0, 0x3]
	ldrb r0, [r2, 0x6]
	bics r0, r1
	strb r0, [r2, 0x6]
	ldr r2, [r4]
	ldrb r1, [r2, 0x6]
	adds r0, r6, 0
	orrs r0, r1
	strb r0, [r2, 0x6]
	ldr r0, [r5]
	strb r6, [r0, 0x3]
	mov r2, r8
	strh r2, [r3]
	b _081E22DA
	.align 2, 0
_081E22CC: .4byte 0x04000208
_081E22D0: .4byte gRfuLinkStatus
_081E22D4:
	movs r0, 0xC0
	lsls r0, 3
	b _081E22DC
_081E22DA:
	movs r0, 0
_081E22DC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_changeSendTarget

	thumb_func_start rfu_NI_stopReceivingData
rfu_NI_stopReceivingData: @ 81E22EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _081E22FC
	movs r0, 0x80
	lsls r0, 3
	b _081E2356
_081E22FC:
	ldr r1, _081E2328 @ =gRfuSlotStatusNI
	lsls r0, r3, 2
	adds r0, r1
	ldr r2, [r0]
	adds r5, r2, 0
	adds r5, 0x34
	ldr r1, _081E232C @ =0x04000208
	ldrh r0, [r1]
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r1]
	ldrh r1, [r2, 0x34]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _081E2350
	ldr r0, _081E2330 @ =0x00008043
	cmp r1, r0
	bne _081E2334
	movs r0, 0x48
	b _081E2336
	.align 2, 0
_081E2328: .4byte gRfuSlotStatusNI
_081E232C: .4byte 0x04000208
_081E2330: .4byte 0x00008043
_081E2334:
	movs r0, 0x47
_081E2336:
	strh r0, [r2, 0x34]
	ldr r0, _081E235C @ =gRfuLinkStatus
	ldr r2, [r0]
	movs r1, 0x1
	lsls r1, r3
	ldrb r0, [r2, 0x5]
	bics r0, r1
	strb r0, [r2, 0x5]
	adds r0, r3, 0
	movs r1, 0x1
	adds r2, r5, 0
	bl rfu_STC_releaseFrame
_081E2350:
	ldr r0, _081E2360 @ =0x04000208
	strh r4, [r0]
	movs r0, 0
_081E2356:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081E235C: .4byte gRfuLinkStatus
_081E2360: .4byte 0x04000208
	thumb_func_end rfu_NI_stopReceivingData

	thumb_func_start rfu_UNI_changeAndReadySendData
rfu_UNI_changeAndReadySendData: @ 81E2364
	push {r4-r7,lr}
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r2, 24
	lsrs r5, r2, 24
	cmp r0, 0x3
	bls _081E237C
	movs r0, 0x80
	lsls r0, 3
	b _081E23F0
_081E237C:
	ldr r1, _081E2390 @ =gRfuSlotStatusUNI
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	ldrh r1, [r4]
	ldr r0, _081E2394 @ =0x00008024
	cmp r1, r0
	beq _081E239C
	ldr r0, _081E2398 @ =0x00000403
	b _081E23F0
	.align 2, 0
_081E2390: .4byte gRfuSlotStatusUNI
_081E2394: .4byte 0x00008024
_081E2398: .4byte 0x00000403
_081E239C:
	ldr r0, _081E23B0 @ =gRfuLinkStatus
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _081E23B4
	adds r6, r1, 0
	adds r6, 0xF
	ldrb r0, [r4, 0x4]
	ldrb r1, [r1, 0xF]
	b _081E23C2
	.align 2, 0
_081E23B0: .4byte gRfuLinkStatus
_081E23B4:
	adds r0, r3, 0
	adds r0, 0x10
	adds r6, r1, r0
	adds r1, 0x10
	adds r1, r3
	ldrb r0, [r4, 0x4]
	ldrb r1, [r1]
_081E23C2:
	adds r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r5
	bcc _081E23EC
	ldr r2, _081E23E8 @ =0x04000208
	ldrh r1, [r2]
	movs r0, 0
	strh r0, [r2]
	str r7, [r4, 0x8]
	subs r0, r3, r5
	strb r0, [r6]
	strh r5, [r4, 0x4]
	movs r0, 0x1
	strb r0, [r4, 0x2]
	strh r1, [r2]
	movs r0, 0
	b _081E23F0
	.align 2, 0
_081E23E8: .4byte 0x04000208
_081E23EC:
	movs r0, 0xA0
	lsls r0, 3
_081E23F0:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_UNI_changeAndReadySendData

	thumb_func_start rfu_UNI_readySendData
rfu_UNI_readySendData: @ 81E23F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _081E2416
	ldr r1, _081E241C @ =gRfuSlotStatusUNI
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	ldrh r1, [r2]
	ldr r0, _081E2420 @ =0x00008024
	cmp r1, r0
	bne _081E2416
	movs r0, 0x1
	strb r0, [r2, 0x2]
_081E2416:
	pop {r0}
	bx r0
	.align 2, 0
_081E241C: .4byte gRfuSlotStatusUNI
_081E2420: .4byte 0x00008024
	thumb_func_end rfu_UNI_readySendData

	thumb_func_start rfu_UNI_clearRecvNewDataFlag
rfu_UNI_clearRecvNewDataFlag: @ 81E2424
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _081E243A
	ldr r1, _081E2440 @ =gRfuSlotStatusUNI
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x12]
_081E243A:
	pop {r0}
	bx r0
	.align 2, 0
_081E2440: .4byte gRfuSlotStatusUNI
	thumb_func_end rfu_UNI_clearRecvNewDataFlag

	thumb_func_start rfu_REQ_sendData
rfu_REQ_sendData: @ 81E2444
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081E2490 @ =gRfuLinkStatus
	ldr r2, [r0]
	ldrb r1, [r2]
	adds r4, r0, 0
	cmp r1, 0xFF
	bne _081E2458
	b _081E257E
_081E2458:
	cmp r1, 0x1
	bne _081E24E8
	ldrb r0, [r2, 0x4]
	ldrb r1, [r2, 0x5]
	adds r3, r0, 0
	orrs r3, r1
	ldrb r0, [r2, 0x6]
	orrs r3, r0
	cmp r3, 0
	bne _081E24E8
	ldr r0, _081E2494 @ =gRfuStatic
	ldr r2, [r0]
	ldrb r1, [r2, 0x3]
	adds r4, r0, 0
	cmp r1, 0
	beq _081E2480
	movs r0, 0x10
	strb r0, [r2, 0x8]
	ldr r0, [r4]
	strb r3, [r0, 0x7]
_081E2480:
	ldr r1, [r4]
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _081E2498
	subs r0, 0x1
	strb r0, [r1, 0x8]
	b _081E249E
	.align 2, 0
_081E2490: .4byte gRfuLinkStatus
_081E2494: .4byte gRfuStatic
_081E2498:
	ldrb r0, [r1, 0x7]
	adds r0, 0x1
	strb r0, [r1, 0x7]
_081E249E:
	ldr r1, [r4]
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	bne _081E24B0
	ldrb r1, [r1, 0x7]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _081E2542
_081E24B0:
	ldr r4, _081E24D4 @ =gRfuFixed
	ldr r1, [r4]
	movs r0, 0x1
	str r0, [r1, 0x68]
	movs r0, 0xFF
	str r0, [r1, 0x78]
	ldr r0, _081E24D8 @ =rfu_CB_sendData3
	bl STWI_set_Callback_M
	cmp r5, 0
	bne _081E24DC
	ldr r0, [r4]
	adds r0, 0x68
	movs r1, 0x1
	bl STWI_send_DataTxREQ
	b _081E257E
	.align 2, 0
_081E24D4: .4byte gRfuFixed
_081E24D8: .4byte rfu_CB_sendData3
_081E24DC:
	ldr r0, [r4]
	adds r0, 0x68
	movs r1, 0x1
	bl STWI_send_DataTxAndChangeREQ
	b _081E257E
_081E24E8:
	ldr r0, [r4]
	ldrb r0, [r0, 0xE]
	cmp r0, 0
	bne _081E24F4
	bl rfu_constructSendLLFrame
_081E24F4:
	ldr r0, [r4]
	ldrb r0, [r0, 0xE]
	cmp r0, 0
	beq _081E2542
	ldr r0, _081E2520 @ =rfu_CB_sendData
	bl STWI_set_Callback_M
	cmp r5, 0
	beq _081E252C
	ldr r0, _081E2524 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0x68
	ldr r1, _081E2528 @ =gRfuStatic
	ldr r1, [r1]
	ldr r1, [r1, 0x24]
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	bl STWI_send_DataTxAndChangeREQ
	b _081E257E
	.align 2, 0
_081E2520: .4byte rfu_CB_sendData
_081E2524: .4byte gRfuFixed
_081E2528: .4byte gRfuStatic
_081E252C:
	ldr r0, _081E2564 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0x68
	ldr r1, _081E2568 @ =gRfuStatic
	ldr r1, [r1]
	ldr r1, [r1, 0x24]
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	bl STWI_send_DataTxREQ
_081E2542:
	cmp r5, 0
	beq _081E257E
	ldr r0, _081E256C @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E2574
	ldr r0, _081E2570 @ =gRfuState
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	cmp r1, 0
	beq _081E257E
	movs r0, 0x27
	bl _call_via_r1
	b _081E257E
	.align 2, 0
_081E2564: .4byte gRfuFixed
_081E2568: .4byte gRfuStatic
_081E256C: .4byte gRfuLinkStatus
_081E2570: .4byte gRfuState
_081E2574:
	ldr r0, _081E2584 @ =rfu_CB_sendData2
	bl STWI_set_Callback_M
	bl STWI_send_MS_ChangeREQ
_081E257E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E2584: .4byte rfu_CB_sendData2
	thumb_func_end rfu_REQ_sendData

	thumb_func_start rfu_CB_sendData
rfu_CB_sendData: @ 81E2588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 16
	lsrs r7, r1, 16
	cmp r7, 0
	bne _081E25F2
	movs r6, 0
	ldr r0, _081E2610 @ =0x00008020
	mov r8, r0
_081E259C:
	ldr r0, _081E2614 @ =gRfuSlotStatusUNI
	lsls r2, r6, 2
	adds r0, r2, r0
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _081E25AE
	movs r0, 0
	strb r0, [r1, 0x2]
_081E25AE:
	ldr r0, _081E2618 @ =gRfuSlotStatusNI
	adds r0, r2, r0
	ldr r4, [r0]
	ldrh r0, [r4]
	cmp r0, r8
	bne _081E25E8
	adds r0, r6, 0
	movs r1, 0
	adds r2, r4, 0
	bl rfu_STC_releaseFrame
	ldr r5, _081E261C @ =gRfuLinkStatus
	ldr r2, [r5]
	ldrb r1, [r4, 0x1A]
	ldrb r0, [r2, 0x4]
	bics r0, r1
	strb r0, [r2, 0x4]
	adds r0, r4, 0
	adds r0, 0x2D
	ldrb r3, [r0]
	cmp r3, 0x1
	bne _081E25E4
	ldr r1, [r5]
	lsls r3, r6
	ldrb r0, [r1, 0x7]
	orrs r3, r0
	strb r3, [r1, 0x7]
_081E25E4:
	movs r0, 0x26
	strh r0, [r4]
_081E25E8:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _081E259C
_081E25F2:
	ldr r0, _081E261C @ =gRfuLinkStatus
	ldr r1, [r0]
	ldrb r0, [r1, 0xE]
	movs r0, 0
	strb r0, [r1, 0xE]
	movs r0, 0x24
	adds r1, r7, 0
	bl rfu_STC_REQ_callback
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2610: .4byte 0x00008020
_081E2614: .4byte gRfuSlotStatusUNI
_081E2618: .4byte gRfuSlotStatusNI
_081E261C: .4byte gRfuLinkStatus
	thumb_func_end rfu_CB_sendData

	thumb_func_start rfu_CB_sendData2
rfu_CB_sendData2: @ 81E2620
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x24
	bl rfu_STC_REQ_callback
	pop {r0}
	bx r0
	thumb_func_end rfu_CB_sendData2

	thumb_func_start rfu_CB_sendData3
rfu_CB_sendData3: @ 81E2630
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0
	beq _081E2646
	movs r0, 0x24
	bl rfu_STC_REQ_callback
	b _081E2652
_081E2646:
	cmp r0, 0xFF
	bne _081E2652
	movs r0, 0xFF
	movs r1, 0
	bl rfu_STC_REQ_callback
_081E2652:
	pop {r0}
	bx r0
	thumb_func_end rfu_CB_sendData3

	thumb_func_start rfu_constructSendLLFrame
rfu_constructSendLLFrame: @ 81E2658
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _081E2704 @ =gRfuLinkStatus
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _081E2670
	b _081E2774
_081E2670:
	ldrb r0, [r2, 0x4]
	ldrb r1, [r2, 0x5]
	orrs r0, r1
	ldrb r1, [r2, 0x6]
	orrs r0, r1
	cmp r0, 0
	beq _081E2774
	ldrb r0, [r2, 0xE]
	movs r0, 0
	strb r0, [r2, 0xE]
	mov r8, r0
	ldr r0, _081E2708 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0x6C
	str r0, [sp]
	movs r6, 0
	movs r0, 0x80
	lsls r0, 8
	mov r9, r0
	ldr r1, _081E270C @ =0x00008024
	mov r10, r1
_081E269A:
	movs r5, 0
	ldr r0, _081E2710 @ =gRfuSlotStatusNI
	lsls r7, r6, 2
	adds r4, r7, r0
	ldr r2, [r4]
	ldrh r1, [r2]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	beq _081E26BA
	adds r0, r6, 0
	mov r1, sp
	bl rfu_STC_NI_constructLLSF
	lsls r0, 16
	lsrs r5, r0, 16
_081E26BA:
	ldr r2, [r4]
	ldrh r1, [r2, 0x34]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	beq _081E26D6
	adds r2, 0x34
	adds r0, r6, 0
	mov r1, sp
	bl rfu_STC_NI_constructLLSF
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0
_081E26D6:
	ldr r0, _081E2714 @ =gRfuSlotStatusUNI
	adds r0, r7, r0
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, r10
	bne _081E26F0
	adds r0, r6, 0
	mov r1, sp
	bl rfu_STC_UNI_constructLLSF
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0
_081E26F0:
	cmp r5, 0
	beq _081E2724
	ldr r0, _081E2704 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E2718
	add r8, r5
	b _081E2724
	.align 2, 0
_081E2704: .4byte gRfuLinkStatus
_081E2708: .4byte gRfuFixed
_081E270C: .4byte 0x00008024
_081E2710: .4byte gRfuSlotStatusNI
_081E2714: .4byte gRfuSlotStatusUNI
_081E2718:
	adds r0, r7, r6
	adds r0, 0x8
	lsls r5, r0
	mov r2, r8
	orrs r2, r5
	mov r8, r2
_081E2724:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _081E269A
	ldr r6, _081E2784 @ =gRfuStatic
	mov r0, r8
	cmp r0, 0
	beq _081E276E
	ldr r2, [sp]
	movs r0, 0x3
	ands r0, r2
	ldr r5, _081E2788 @ =gRfuLinkStatus
	ldr r1, _081E278C @ =gRfuFixed
	cmp r0, 0
	beq _081E2756
	movs r4, 0
	movs r3, 0x3
_081E2748:
	strb r4, [r2]
	adds r0, r2, 0x1
	str r0, [sp]
	adds r2, r0, 0
	ands r0, r3
	cmp r0, 0
	bne _081E2748
_081E2756:
	ldr r0, [r1]
	mov r2, r8
	str r2, [r0, 0x68]
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, 0
	bne _081E276E
	ldr r0, [sp]
	subs r0, 0x6C
	ldr r1, [r1]
	subs r0, r1
	mov r8, r0
_081E276E:
	ldr r0, [r6]
	mov r1, r8
	str r1, [r0, 0x24]
_081E2774:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2784: .4byte gRfuStatic
_081E2788: .4byte gRfuLinkStatus
_081E278C: .4byte gRfuFixed
	thumb_func_end rfu_constructSendLLFrame

	thumb_func_start rfu_STC_NI_constructLLSF
rfu_STC_NI_constructLLSF: @ 81E2790
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r12, r1
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r2, _081E280C @ =gRfuLinkStatus
	ldr r0, [r2]
	ldrb r0, [r0]
	lsls r0, 4
	ldr r1, _081E2810 @ =_Str_RfuHeader
	adds r0, r1
	mov r8, r0
	ldrh r1, [r4]
	ldr r0, _081E2814 @ =0x00008022
	cmp r1, r0
	bne _081E27FA
	adds r3, r4, 0
	adds r3, 0x20
	ldrb r1, [r3]
	lsls r1, 2
	adds r5, r4, 0x4
	adds r1, r5, r1
	ldr r2, [r4, 0x28]
	ldr r0, [r4, 0x30]
	adds r2, r0
	ldr r0, [r1]
	adds r6, r3, 0
	cmp r0, r2
	bcc _081E27FA
	movs r7, 0
_081E27D8:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _081E27E8
	strb r7, [r6]
_081E27E8:
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r5, r1
	ldr r2, [r4, 0x28]
	ldr r0, [r4, 0x30]
	adds r2, r0
	ldr r0, [r1]
	cmp r0, r2
	bcs _081E27D8
_081E27FA:
	ldrh r1, [r4]
	movs r0, 0x40
	ands r0, r1
	mov r9, r1
	cmp r0, 0
	beq _081E2818
	movs r5, 0
	b _081E285C
	.align 2, 0
_081E280C: .4byte gRfuLinkStatus
_081E2810: .4byte _Str_RfuHeader
_081E2814: .4byte 0x00008022
_081E2818:
	ldr r0, _081E2844 @ =0x00008022
	cmp r9, r0
	bne _081E284C
	adds r3, r4, 0
	adds r3, 0x20
	ldrb r0, [r3]
	lsls r0, 2
	adds r1, r4, 0x4
	adds r1, r0
	ldrh r7, [r4, 0x2E]
	ldr r5, [r1]
	adds r2, r5, r7
	ldr r1, [r4, 0x28]
	ldr r0, [r4, 0x30]
	adds r0, r1, r0
	adds r6, r3, 0
	cmp r2, r0
	bls _081E2848
	subs r0, r5
	lsls r0, 16
	lsrs r5, r0, 16
	b _081E2860
	.align 2, 0
_081E2844: .4byte 0x00008022
_081E2848:
	adds r5, r7, 0
	b _081E2860
_081E284C:
	ldrh r2, [r4, 0x2E]
	ldr r0, [r4, 0x14]
	cmp r0, r2
	bcc _081E2858
	adds r5, r2, 0
	b _081E285C
_081E2858:
	lsls r0, 16
	lsrs r5, r0, 16
_081E285C:
	adds r6, r4, 0
	adds r6, 0x20
_081E2860:
	movs r3, 0xF
	mov r0, r9
	ands r3, r0
	mov r1, r8
	ldrb r1, [r1, 0x3]
	lsls r3, r1
	ldrb r0, [r4, 0x1F]
	mov r2, r8
	ldrb r2, [r2, 0x4]
	lsls r0, r2
	orrs r3, r0
	ldrb r1, [r6]
	adds r0, r1, 0
	mov r7, r8
	ldrb r7, [r7, 0x5]
	lsls r0, r7
	orrs r3, r0
	adds r0, r4, 0
	adds r0, 0x21
	adds r0, r1
	ldrb r0, [r0]
	mov r1, r8
	ldrb r1, [r1, 0x6]
	lsls r0, r1
	orrs r3, r0
	orrs r3, r5
	str r3, [sp]
	ldr r2, _081E291C @ =gRfuLinkStatus
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E28A8
	ldrb r0, [r4, 0x1A]
	lsls r0, 18
	orrs r3, r0
	str r3, [sp]
_081E28A8:
	mov r2, sp
	movs r3, 0
	mov r7, r8
	ldrb r7, [r7]
	cmp r3, r7
	bcs _081E28D2
_081E28B4:
	mov r0, r12
	ldr r1, [r0]
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	mov r7, r12
	str r1, [r7]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	mov r0, r8
	ldrb r0, [r0]
	cmp r3, r0
	bcc _081E28B4
_081E28D2:
	cmp r5, 0
	beq _081E28F2
	ldrb r1, [r6]
	lsls r1, 2
	adds r0, r4, 0x4
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _081E2920 @ =gRfuFixed
	ldr r1, [r0]
	add r0, sp, 0x4
	ldr r3, [r1, 0x4]
	mov r1, r12
	adds r2, r5, 0
	bl _call_via_r3
_081E28F2:
	ldrh r1, [r4]
	ldr r0, _081E2924 @ =0x00008022
	cmp r1, r0
	bne _081E290C
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _081E290C
	movs r0, 0
	strb r0, [r6]
_081E290C:
	ldr r0, _081E291C @ =gRfuLinkStatus
	ldr r2, [r0]
	ldrb r1, [r2]
	cmp r1, 0x1
	bne _081E2928
	ldrb r0, [r2, 0xE]
	strb r1, [r2, 0xE]
	b _081E2936
	.align 2, 0
_081E291C: .4byte gRfuLinkStatus
_081E2920: .4byte gRfuFixed
_081E2924: .4byte 0x00008022
_081E2928:
	movs r0, 0x1
	mov r1, r10
	lsls r0, r1
	ldrb r1, [r2, 0xE]
	orrs r0, r1
	ldrb r1, [r2, 0xE]
	strb r0, [r2, 0xE]
_081E2936:
	mov r2, r8
	ldrb r0, [r2]
	adds r0, r5, r0
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_STC_NI_constructLLSF

	thumb_func_start rfu_STC_UNI_constructLLSF
rfu_STC_UNI_constructLLSF: @ 81E2950
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _081E2978 @ =gRfuSlotStatusUNI
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _081E2974
	ldrb r0, [r4, 0x3]
	cmp r0, 0
	bne _081E297C
_081E2974:
	movs r0, 0
	b _081E2A18
	.align 2, 0
_081E2978: .4byte gRfuSlotStatusUNI
_081E297C:
	ldr r0, _081E29F4 @ =gRfuLinkStatus
	ldr r2, [r0]
	ldrb r0, [r2]
	lsls r0, 4
	ldr r1, _081E29F8 @ =_Str_RfuHeader
	adds r5, r0, r1
	ldrh r0, [r4]
	movs r1, 0xF
	ands r1, r0
	ldrb r0, [r5, 0x3]
	lsls r1, r0
	ldrh r0, [r4, 0x4]
	orrs r1, r0
	str r1, [sp]
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _081E29A6
	ldrb r0, [r4, 0x3]
	lsls r0, 18
	orrs r1, r0
	str r1, [sp]
_081E29A6:
	mov r2, sp
	movs r3, 0
	ldr r1, _081E29FC @ =gRfuFixed
	mov r12, r1
	add r7, sp, 0x4
	ldrb r0, [r5]
	cmp r3, r0
	bcs _081E29CE
_081E29B6:
	ldr r1, [r6]
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	str r1, [r6]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r1, [r5]
	cmp r3, r1
	bcc _081E29B6
_081E29CE:
	ldr r0, [r4, 0x8]
	str r0, [sp, 0x4]
	mov r2, r12
	ldr r0, [r2]
	ldrh r2, [r4, 0x4]
	ldr r3, [r0, 0x4]
	adds r0, r7, 0
	adds r1, r6, 0
	bl _call_via_r3
	ldr r0, _081E29F4 @ =gRfuLinkStatus
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _081E2A00
	ldrb r0, [r2, 0xE]
	movs r0, 0x10
	b _081E2A0C
	.align 2, 0
_081E29F4: .4byte gRfuLinkStatus
_081E29F8: .4byte _Str_RfuHeader
_081E29FC: .4byte gRfuFixed
_081E2A00:
	movs r0, 0x10
	mov r1, r8
	lsls r0, r1
	ldrb r1, [r2, 0xE]
	orrs r0, r1
	ldrb r1, [r2, 0xE]
_081E2A0C:
	strb r0, [r2, 0xE]
	ldrh r0, [r4, 0x4]
	ldrb r5, [r5]
	adds r0, r5
	lsls r0, 16
	lsrs r0, 16
_081E2A18:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_STC_UNI_constructLLSF

	thumb_func_start rfu_REQ_recvData
rfu_REQ_recvData: @ 81E2A24
	push {r4,lr}
	ldr r0, _081E2A58 @ =gRfuLinkStatus
	ldr r4, [r0]
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _081E2A50
	ldr r2, _081E2A5C @ =gRfuStatic
	ldr r3, [r2]
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	orrs r0, r1
	ldrb r1, [r4, 0x6]
	orrs r0, r1
	movs r1, 0
	strb r0, [r3, 0x3]
	ldr r0, [r2]
	strb r1, [r0, 0x4]
	ldr r0, _081E2A60 @ =rfu_CB_recvData
	bl STWI_set_Callback_M
	bl STWI_send_DataRxREQ
_081E2A50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081E2A58: .4byte gRfuLinkStatus
_081E2A5C: .4byte gRfuStatic
_081E2A60: .4byte rfu_CB_recvData
	thumb_func_end rfu_REQ_recvData

	thumb_func_start rfu_CB_recvData
rfu_CB_recvData: @ 81E2A64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r7, r1, 16
	cmp r7, 0
	bne _081E2B28
	ldr r0, _081E2AA0 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _081E2B28
	ldr r0, _081E2AA4 @ =gRfuStatic
	ldr r0, [r0]
	strb r7, [r0, 0x1]
	ldr r0, _081E2AA8 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E2AAC
	bl rfu_STC_PARENT_analyzeRecvPacket
	b _081E2AB0
	.align 2, 0
_081E2AA0: .4byte gRfuFixed
_081E2AA4: .4byte gRfuStatic
_081E2AA8: .4byte gRfuLinkStatus
_081E2AAC:
	bl rfu_STC_CHILD_analyzeRecvPacket
_081E2AB0:
	movs r6, 0
	ldr r0, _081E2B40 @ =0x00008043
	mov r8, r0
	ldr r3, _081E2B44 @ =gRfuLinkStatus
_081E2AB8:
	ldr r0, _081E2B48 @ =gRfuSlotStatusNI
	lsls r1, r6, 2
	adds r1, r0
	ldr r4, [r1]
	ldrh r0, [r4, 0x34]
	cmp r0, r8
	bne _081E2B0A
	ldr r0, _081E2B4C @ =gRfuStatic
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	asrs r0, r6
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081E2B0A
	adds r5, r4, 0
	adds r5, 0x34
	adds r0, r4, 0
	adds r0, 0x61
	ldrb r2, [r0]
	cmp r2, 0x1
	bne _081E2AEE
	ldr r1, [r3]
	lsls r2, r6
	ldrb r0, [r1, 0x7]
	orrs r2, r0
	strb r2, [r1, 0x7]
_081E2AEE:
	adds r0, r6, 0
	movs r1, 0x1
	adds r2, r5, 0
	str r3, [sp]
	bl rfu_STC_releaseFrame
	ldr r3, [sp]
	ldr r2, [r3]
	ldrb r1, [r5, 0x1A]
	ldrb r0, [r2, 0x5]
	bics r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x46
	strh r0, [r4, 0x34]
_081E2B0A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _081E2AB8
	ldr r0, _081E2B4C @ =gRfuStatic
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _081E2B28
	adds r7, r0, 0
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1, 0
	orrs r7, r0
_081E2B28:
	mov r0, r9
	adds r1, r7, 0
	bl rfu_STC_REQ_callback
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2B40: .4byte 0x00008043
_081E2B44: .4byte gRfuLinkStatus
_081E2B48: .4byte gRfuSlotStatusNI
_081E2B4C: .4byte gRfuStatic
	thumb_func_end rfu_CB_recvData

	thumb_func_start rfu_STC_PARENT_analyzeRecvPacket
rfu_STC_PARENT_analyzeRecvPacket: @ 81E2B50
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _081E2BE0 @ =gRfuFixed
	ldr r0, [r1]
	adds r0, 0xDC
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	lsrs r3, r0, 8
	movs r5, 0
	mov r12, r1
	movs r7, 0x1F
	ldr r4, _081E2BE4 @ =gRfuStatic
	movs r6, 0x1
_081E2B6A:
	mov r0, sp
	adds r1, r0, r5
	adds r0, r3, 0
	ands r0, r7
	strb r0, [r1]
	lsrs r3, 5
	cmp r0, 0
	bne _081E2B86
	ldr r0, [r4]
	adds r1, r6, 0
	lsls r1, r5
	ldrb r2, [r0, 0x1]
	orrs r1, r2
	strb r1, [r0, 0x1]
_081E2B86:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081E2B6A
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDC
	ldr r0, [r0]
	adds r6, r0, 0
	adds r6, 0x8
	movs r5, 0
_081E2B9E:
	mov r0, sp
	adds r1, r0, r5
	ldrb r0, [r1]
	adds r7, r5, 0x1
	cmp r0, 0
	beq _081E2BD0
	adds r4, r1, 0
_081E2BAC:
	ldrb r2, [r4]
	adds r0, r5, 0
	adds r1, r6, 0
	bl rfu_STC_analyzeLLSF
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0
	ldrb r1, [r4]
	subs r1, r0
	strb r1, [r4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081E2BD0
	lsls r0, r1, 24
	cmp r0, 0
	bne _081E2BAC
_081E2BD0:
	lsls r0, r7, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081E2B9E
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2BE0: .4byte gRfuFixed
_081E2BE4: .4byte gRfuStatic
	thumb_func_end rfu_STC_PARENT_analyzeRecvPacket

	thumb_func_start rfu_STC_CHILD_analyzeRecvPacket
rfu_STC_CHILD_analyzeRecvPacket: @ 81E2BE8
	push {r4-r6,lr}
	ldr r0, _081E2C38 @ =gRfuFixed
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r1, [r0]
	ldrh r0, [r1, 0x4]
	movs r4, 0x7F
	ands r4, r0
	adds r5, r1, 0
	adds r5, 0x8
	cmp r4, 0
	bne _081E2C08
	ldr r0, _081E2C3C @ =gRfuStatic
	ldr r1, [r0]
	movs r0, 0xF
	strb r0, [r1, 0x1]
_081E2C08:
	movs r0, 0x80
	lsls r0, 8
	adds r6, r0, 0
_081E2C0E:
	cmp r4, 0
	beq _081E2C30
	movs r0, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl rfu_STC_analyzeLLSF
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	ands r0, r6
	cmp r0, 0
	beq _081E2C0E
_081E2C30:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081E2C38: .4byte gRfuFixed
_081E2C3C: .4byte gRfuStatic
	thumb_func_end rfu_STC_CHILD_analyzeRecvPacket

	thumb_func_start rfu_STC_analyzeLLSF
rfu_STC_analyzeLLSF: @ 81E2C40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r2, 16
	lsrs r3, r2, 16
	ldr r2, _081E2C74 @ =gRfuLinkStatus
	ldr r0, [r2]
	ldrb r0, [r0]
	mvns r0, r0
	movs r1, 0x1
	ands r0, r1
	lsls r0, 4
	ldr r1, _081E2C78 @ =_Str_RfuHeader
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r3, r0
	bcs _081E2C7C
	adds r0, r3, 0
	b _081E2E6E
	.align 2, 0
_081E2C74: .4byte gRfuLinkStatus
_081E2C78: .4byte _Str_RfuHeader
_081E2C7C:
	movs r5, 0
	movs r4, 0
	ldrb r3, [r6, 0x1]
	ldrb r1, [r6, 0x7]
	mov r8, r1
	ldr r2, [sp]
	mov r9, r2
	cmp r4, r0
	bcs _081E2CA4
	adds r2, r0, 0
_081E2C90:
	ldrb r0, [r7]
	lsls r1, r4, 3
	lsls r0, r1
	orrs r5, r0
	adds r7, 0x1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r2
	bcc _081E2C90
_081E2CA4:
	adds r0, r5, 0
	lsrs r0, r3
	mov r3, r8
	ands r0, r3
	ldr r1, _081E2D7C @ =0xffffff00
	mov r10, r1
	mov r3, r10
	mov r2, r9
	ands r3, r2
	orrs r3, r0
	str r3, [sp]
	adds r0, r5, 0
	ldrb r1, [r6, 0x2]
	lsrs r0, r1
	ldrb r1, [r6, 0x8]
	ands r0, r1
	lsls r0, 8
	ldr r4, _081E2D80 @ =0xffff00ff
	adds r2, r4, 0
	ands r2, r3
	orrs r2, r0
	str r2, [sp]
	adds r0, r5, 0
	ldrb r3, [r6, 0x3]
	lsrs r0, r3
	ldrb r1, [r6, 0x9]
	ands r0, r1
	lsls r0, 16
	ldr r3, _081E2D84 @ =0xff00ffff
	ands r3, r2
	orrs r3, r0
	str r3, [sp]
	adds r0, r5, 0
	ldrb r1, [r6, 0x4]
	lsrs r0, r1
	ldrb r1, [r6, 0xA]
	ands r0, r1
	lsls r0, 24
	ldr r2, _081E2D88 @ =0x00ffffff
	mov r8, r2
	mov r1, r8
	ands r1, r3
	orrs r1, r0
	mov r8, r1
	str r1, [sp]
	adds r1, r5, 0
	ldrb r2, [r6, 0x5]
	lsrs r1, r2
	ldrb r0, [r6, 0xB]
	ands r1, r0
	mov r9, sp
	ldr r2, [sp, 0x4]
	mov r3, r10
	ands r2, r3
	orrs r2, r1
	str r2, [sp, 0x4]
	adds r0, r5, 0
	ldrb r1, [r6, 0x6]
	lsrs r0, r1
	ldrb r1, [r6, 0xC]
	ands r0, r1
	lsls r0, 8
	ands r4, r2
	orrs r4, r0
	str r4, [sp, 0x4]
	ldrh r0, [r6, 0xE]
	ands r5, r0
	lsls r1, r5, 16
	ldr r0, _081E2D8C @ =0x0000ffff
	ands r0, r4
	orrs r0, r1
	str r0, [sp, 0x4]
	lsrs r0, 16
	ldrb r6, [r6]
	adds r0, r6
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	beq _081E2D4A
	b _081E2E6C
_081E2D4A:
	ldr r2, _081E2D90 @ =gRfuLinkStatus
	ldr r3, [r2]
	ldrb r2, [r3]
	cmp r2, 0x1
	bne _081E2E08
	ldrb r0, [r3, 0x2]
	mov r5, r12
	asrs r0, r5
	ands r0, r2
	cmp r0, 0
	bne _081E2D62
	b _081E2E6C
_081E2D62:
	mov r1, r8
	lsrs r0, r1, 16
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _081E2D94
	mov r0, r12
	mov r1, sp
	adds r2, r7, 0
	bl rfu_STC_UNI_receive
	b _081E2E6C
	.align 2, 0
_081E2D7C: .4byte 0xffffff00
_081E2D80: .4byte 0xffff00ff
_081E2D84: .4byte 0xff00ffff
_081E2D88: .4byte 0x00ffffff
_081E2D8C: .4byte 0x0000ffff
_081E2D90: .4byte gRfuLinkStatus
_081E2D94:
	mov r5, r9
	ldrb r0, [r5, 0x3]
	cmp r0, 0
	bne _081E2DA8
	mov r0, r12
	mov r1, sp
	adds r2, r7, 0
	bl rfu_STC_NI_receive_Receiver
	b _081E2E6C
_081E2DA8:
	movs r4, 0
	ldr r1, _081E2DC0 @ =gRfuSlotStatusNI
	ldr r0, [r1]
	ldrb r0, [r0, 0x1A]
	mov r5, r12
	asrs r0, r5
	ands r0, r2
	cmp r0, 0
	beq _081E2DC4
	ldrb r0, [r3, 0x4]
	b _081E2DEA
	.align 2, 0
_081E2DC0: .4byte gRfuSlotStatusNI
_081E2DC4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bhi _081E2E6C
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1A]
	mov r2, r12
	asrs r0, r2
	movs r2, 0x1
	ands r0, r2
	cmp r0, 0
	beq _081E2DC4
	ldr r3, _081E2E04 @ =gRfuLinkStatus
	ldr r0, [r3]
	ldrb r0, [r0, 0x4]
	mov r5, r12
_081E2DEA:
	asrs r0, r5
	ands r0, r2
	cmp r0, 0
	beq _081E2DC4
	cmp r4, 0x3
	bhi _081E2E6C
	adds r0, r4, 0
	mov r1, r12
	mov r2, sp
	adds r3, r7, 0
	bl rfu_STC_NI_receive_Sender
	b _081E2E6C
	.align 2, 0
_081E2E04: .4byte gRfuLinkStatus
_081E2E08:
	ldrb r1, [r3, 0x2]
	mov r2, r9
	ldrb r0, [r2, 0x1]
	adds r5, r1, 0
	ands r5, r0
	cmp r5, 0
	beq _081E2E6C
	movs r4, 0
	movs r6, 0x1
_081E2E1A:
	adds r0, r5, 0
	asrs r0, r4
	ands r0, r6
	cmp r0, 0
	beq _081E2E62
	mov r1, sp
	ldrb r0, [r1, 0x2]
	cmp r0, 0x4
	bne _081E2E36
	adds r0, r4, 0
	adds r2, r7, 0
	bl rfu_STC_UNI_receive
	b _081E2E62
_081E2E36:
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	bne _081E2E48
	adds r0, r4, 0
	mov r1, sp
	adds r2, r7, 0
	bl rfu_STC_NI_receive_Receiver
	b _081E2E62
_081E2E48:
	ldr r0, _081E2E80 @ =gRfuLinkStatus
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	asrs r0, r4
	ands r0, r6
	cmp r0, 0
	beq _081E2E62
	adds r0, r4, 0
	adds r1, r4, 0
	mov r2, sp
	adds r3, r7, 0
	bl rfu_STC_NI_receive_Sender
_081E2E62:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E2E1A
_081E2E6C:
	mov r0, r10
_081E2E6E:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E2E80: .4byte gRfuLinkStatus
	thumb_func_end rfu_STC_analyzeLLSF

	thumb_func_start rfu_STC_UNI_receive
rfu_STC_UNI_receive: @ 81E2E84
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r1, 0
	str r2, [sp]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _081E2EB8 @ =gRfuSlotStatusUNI
	lsls r1, r7, 2
	adds r1, r2
	ldr r3, [r1]
	adds r5, r3, 0
	adds r5, 0xC
	movs r4, 0
	movs r0, 0
	strh r0, [r5, 0x2]
	ldr r0, [r1]
	ldr r0, [r0, 0x18]
	adds r1, r2, 0
	ldrh r2, [r6, 0x6]
	cmp r0, r2
	bcs _081E2EC0
	movs r0, 0x49
	strh r0, [r3, 0xC]
	ldr r0, _081E2EBC @ =0x00000701
	strh r0, [r5, 0x2]
	b _081E2F0E
	.align 2, 0
_081E2EB8: .4byte gRfuSlotStatusUNI
_081E2EBC: .4byte 0x00000701
_081E2EC0:
	ldrb r0, [r5, 0x7]
	cmp r0, 0
	beq _081E2ED8
	ldrb r0, [r5, 0x6]
	cmp r0, 0
	beq _081E2EE4
	ldr r0, _081E2ED4 @ =0x00000709
	strh r0, [r5, 0x2]
	b _081E2F0E
	.align 2, 0
_081E2ED4: .4byte 0x00000709
_081E2ED8:
	ldrb r0, [r5, 0x6]
	cmp r0, 0
	beq _081E2EE4
	movs r0, 0xE1
	lsls r0, 3
	strh r0, [r5, 0x2]
_081E2EE4:
	movs r4, 0
	ldr r0, _081E2F2C @ =0x00008042
	strh r0, [r5]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x4]
	ldrh r2, [r6, 0x6]
	lsls r0, r7, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	str r0, [sp, 0x4]
	ldr r0, _081E2F30 @ =gRfuFixed
	ldr r0, [r0]
	add r1, sp, 0x4
	ldr r3, [r0, 0x4]
	mov r0, sp
	bl _call_via_r3
	movs r0, 0x1
	strb r0, [r5, 0x6]
	strh r4, [r5]
_081E2F0E:
	ldrh r0, [r5, 0x2]
	cmp r0, 0
	beq _081E2F22
	ldr r0, _081E2F34 @ =gRfuStatic
	ldr r2, [r0]
	movs r0, 0x10
	lsls r0, r7
	ldrb r1, [r2, 0x4]
	orrs r0, r1
	strb r0, [r2, 0x4]
_081E2F22:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2F2C: .4byte 0x00008042
_081E2F30: .4byte gRfuFixed
_081E2F34: .4byte gRfuStatic
	thumb_func_end rfu_STC_UNI_receive

	thumb_func_start rfu_STC_NI_receive_Sender
rfu_STC_NI_receive_Sender: @ 81E2F38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r2, 0
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	ldr r1, _081E3004 @ =gRfuSlotStatusNI
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	mov r12, r0
	ldrh r0, [r0]
	mov r9, r0
	mov r0, r12
	adds r0, 0x21
	ldrb r2, [r6, 0x4]
	adds r0, r2
	ldrb r0, [r0]
	str r0, [sp]
	ldrb r2, [r6, 0x2]
	cmp r2, 0x2
	bne _081E2F74
	ldr r0, _081E3008 @ =0x00008022
	cmp r9, r0
	beq _081E2F8E
_081E2F74:
	cmp r2, 0x1
	bne _081E2F7E
	ldr r0, _081E300C @ =0x00008021
	cmp r9, r0
	beq _081E2F8E
_081E2F7E:
	movs r3, 0x1B
	add r3, r12
	mov r8, r3
	cmp r2, 0x3
	bne _081E2FB2
	ldr r0, _081E3010 @ =0x00008023
	cmp r9, r0
	bne _081E2FB2
_081E2F8E:
	ldrb r1, [r6, 0x4]
	mov r0, r12
	adds r0, 0x21
	adds r0, r1
	ldrb r0, [r0]
	movs r7, 0x1B
	add r7, r12
	mov r8, r7
	ldrb r2, [r6, 0x5]
	cmp r0, r2
	bne _081E2FB2
	adds r0, r7, r1
	movs r1, 0x1
	mov r3, r10
	lsls r1, r3
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_081E2FB2:
	ldrb r2, [r6, 0x4]
	mov r7, r8
	adds r0, r7, r2
	ldrb r0, [r0]
	mov r3, r12
	ldrb r1, [r3, 0x1A]
	ands r0, r1
	cmp r0, r1
	bne _081E30AE
	adds r3, 0x21
	adds r2, r3, r2
	ldrb r0, [r2]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	movs r1, 0
	strb r0, [r2]
	ldrb r0, [r6, 0x4]
	add r0, r8
	strb r1, [r0]
	mov r7, r12
	ldrh r1, [r7]
	ldr r2, _081E3014 @ =0x00007fdf
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	adds r5, r3, 0
	cmp r0, 0x1
	bhi _081E30A0
	ldr r0, _081E300C @ =0x00008021
	cmp r1, r0
	bne _081E3018
	ldrb r1, [r6, 0x4]
	lsls r1, 2
	subs r3, 0x1D
	adds r1, r3, r1
	ldrh r2, [r7, 0x2E]
	ldr r0, [r1]
	adds r0, r2
	str r0, [r1]
	b _081E302E
	.align 2, 0
_081E3004: .4byte gRfuSlotStatusNI
_081E3008: .4byte 0x00008022
_081E300C: .4byte 0x00008021
_081E3010: .4byte 0x00008023
_081E3014: .4byte 0x00007fdf
_081E3018:
	ldrb r2, [r6, 0x4]
	lsls r2, 2
	mov r3, r12
	adds r3, 0x4
	adds r2, r3, r2
	mov r7, r12
	ldrh r1, [r7, 0x2E]
	lsls r1, 2
	ldr r0, [r2]
	adds r0, r1
	str r0, [r2]
_081E302E:
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	ldr r0, [r0, 0x14]
	subs r0, r1
	mov r1, r12
	str r0, [r1, 0x14]
	cmp r0, 0
	beq _081E3042
	cmp r0, 0
	bge _081E30AE
_081E3042:
	mov r0, r12
	adds r0, 0x20
	movs r2, 0
	strb r2, [r0]
	mov r7, r12
	ldrh r1, [r7]
	ldr r0, _081E3084 @ =0x00008021
	cmp r1, r0
	bne _081E308C
	movs r4, 0
_081E3056:
	adds r0, r5, r4
	movs r1, 0x1
	strb r1, [r0]
	lsls r1, r4, 2
	adds r1, r3, r1
	mov r2, r12
	ldrh r0, [r2, 0x2E]
	adds r2, r0, 0
	muls r2, r4
	mov r7, r12
	ldr r0, [r7, 0x28]
	adds r0, r2
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E3056
	ldr r0, [r7, 0x30]
	str r0, [r7, 0x14]
	ldr r0, _081E3088 @ =0x00008022
	strh r0, [r7]
	b _081E30AE
	.align 2, 0
_081E3084: .4byte 0x00008021
_081E3088: .4byte 0x00008022
_081E308C:
	strb r2, [r5]
	mov r0, r12
	str r2, [r0, 0x14]
	ldr r0, _081E309C @ =0x00008023
	mov r1, r12
	strh r0, [r1]
	b _081E30AE
	.align 2, 0
_081E309C: .4byte 0x00008023
_081E30A0:
	lsls r1, 16
	ldr r0, _081E3110 @ =0x80230000
	cmp r1, r0
	bne _081E30AE
	ldr r0, _081E3114 @ =0x00008020
	mov r2, r12
	strh r0, [r2]
_081E30AE:
	mov r3, r12
	ldrh r0, [r3]
	cmp r0, r9
	bne _081E30D8
	ldrb r2, [r6, 0x4]
	mov r0, r12
	adds r0, 0x21
	adds r0, r2
	ldrb r0, [r0]
	ldr r7, [sp]
	cmp r0, r7
	bne _081E30D8
	mov r1, r8
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r2, r10
	asrs r0, r2
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081E30FE
_081E30D8:
	ldr r4, _081E3118 @ =0x04000208
	ldrh r2, [r4]
	movs r0, 0
	strh r0, [r4]
	ldr r0, _081E311C @ =gRfuStatic
	ldr r3, [r0]
	movs r0, 0x10
	mov r7, r10
	lsls r0, r7
	ldrb r1, [r3, 0x2]
	orrs r0, r1
	movs r1, 0
	strb r0, [r3, 0x2]
	lsls r0, r7, 2
	ldr r3, _081E3120 @ =gRfuSlotStatusNI
	adds r0, r3
	ldr r0, [r0]
	strh r1, [r0, 0x2]
	strh r2, [r4]
_081E30FE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E3110: .4byte 0x80230000
_081E3114: .4byte 0x00008020
_081E3118: .4byte 0x04000208
_081E311C: .4byte gRfuStatic
_081E3120: .4byte gRfuSlotStatusNI
	thumb_func_end rfu_STC_NI_receive_Sender

	thumb_func_start rfu_STC_NI_receive_Receiver
rfu_STC_NI_receive_Receiver: @ 81E3124
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r1, 0
	str r2, [sp]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	ldr r1, _081E3184 @ =gRfuSlotStatusNI
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	adds r5, r4, 0
	adds r5, 0x34
	ldrh r0, [r4, 0x34]
	mov r9, r0
	ldrb r0, [r6, 0x4]
	adds r3, r4, 0
	adds r3, 0x55
	adds r0, r3, r0
	ldrb r0, [r0]
	mov r10, r0
	ldrb r0, [r6, 0x2]
	cmp r0, 0x3
	bne _081E3194
	ldr r0, _081E3188 @ =gRfuStatic
	ldr r2, [r0]
	movs r0, 0x1
	mov r1, r8
	lsls r0, r1
	ldrb r1, [r2, 0x1]
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrh r1, [r4, 0x34]
	ldr r0, _081E318C @ =0x00008042
	cmp r1, r0
	bne _081E31DA
	adds r0, r4, 0
	adds r0, 0x54
	strb r7, [r0]
	strb r7, [r3]
	ldr r0, _081E3190 @ =0x00008043
	strh r0, [r4, 0x34]
	b _081E31DA
	.align 2, 0
_081E3184: .4byte gRfuSlotStatusNI
_081E3188: .4byte gRfuStatic
_081E318C: .4byte 0x00008042
_081E3190: .4byte 0x00008043
_081E3194:
	cmp r0, 0x2
	bne _081E31C0
	ldr r0, _081E31B8 @ =0x00008041
	cmp r9, r0
	bne _081E31AC
	ldr r0, [r5, 0x14]
	cmp r0, 0
	bne _081E31AC
	mov r0, r8
	adds r1, r5, 0
	bl rfu_STC_NI_initSlot_asRecvDataEntity
_081E31AC:
	ldrh r1, [r5]
	ldr r0, _081E31BC @ =0x00008042
	cmp r1, r0
	bne _081E31DA
	b _081E31DE
	.align 2, 0
_081E31B8: .4byte 0x00008041
_081E31BC: .4byte 0x00008042
_081E31C0:
	cmp r0, 0x1
	bne _081E31DA
	ldr r7, _081E328C @ =0x00008041
	cmp r9, r7
	beq _081E31DE
	mov r0, r8
	adds r1, r5, 0
	bl rfu_STC_NI_initSlot_asRecvControllData
	ldrh r0, [r4, 0x34]
	cmp r0, r7
	bne _081E327A
	movs r7, 0x1
_081E31DA:
	cmp r7, 0
	beq _081E3234
_081E31DE:
	ldrb r2, [r6, 0x5]
	ldrb r3, [r6, 0x4]
	adds r4, r5, 0
	adds r4, 0x21
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	cmp r2, r0
	bne _081E3234
	ldr r0, _081E3290 @ =gRfuFixed
	ldr r0, [r0]
	lsls r1, r3, 2
	adds r1, 0x4
	adds r1, r5, r1
	ldrh r2, [r6, 0x6]
	ldr r3, [r0, 0x4]
	mov r0, sp
	bl _call_via_r3
	ldrh r1, [r5]
	ldr r0, _081E3294 @ =0x00008042
	cmp r1, r0
	bne _081E3224
	ldrb r0, [r6, 0x4]
	lsls r0, 2
	adds r2, r5, 0x4
	adds r2, r0
	ldrh r0, [r5, 0x2E]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, [r2]
	adds r0, r1
	str r0, [r2]
_081E3224:
	ldrh r1, [r6, 0x6]
	ldr r0, [r5, 0x14]
	subs r0, r1
	str r0, [r5, 0x14]
	ldrb r0, [r6, 0x4]
	adds r0, r4, r0
	ldrb r1, [r6, 0x5]
	strb r1, [r0]
_081E3234:
	ldrh r0, [r5, 0x18]
	cmp r0, 0
	bne _081E327A
	ldrb r0, [r6, 0x4]
	adds r1, r5, 0
	adds r1, 0x20
	strb r0, [r1]
	ldrh r0, [r5]
	cmp r0, r9
	bne _081E325C
	adds r0, r5, 0
	adds r0, 0x21
	ldrb r2, [r6, 0x4]
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, r10
	bne _081E325C
	ldrb r6, [r6, 0x5]
	cmp r0, r6
	bne _081E327A
_081E325C:
	ldr r3, _081E3298 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r0, _081E329C @ =gRfuStatic
	ldr r4, [r0]
	movs r0, 0x1
	mov r1, r8
	lsls r0, r1
	ldrb r1, [r4, 0x2]
	orrs r0, r1
	movs r1, 0
	strb r0, [r4, 0x2]
	strh r1, [r5, 0x2]
	strh r2, [r3]
_081E327A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E328C: .4byte 0x00008041
_081E3290: .4byte gRfuFixed
_081E3294: .4byte 0x00008042
_081E3298: .4byte 0x04000208
_081E329C: .4byte gRfuStatic
	thumb_func_end rfu_STC_NI_receive_Receiver

	thumb_func_start rfu_STC_NI_initSlot_asRecvControllData
rfu_STC_NI_initSlot_asRecvControllData: @ 81E32A0
	push {r4-r7,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081E32BC @ =gRfuLinkStatus
	ldr r3, [r0]
	ldrb r1, [r3]
	mov r12, r0
	cmp r1, 0x1
	bne _081E32C0
	movs r5, 0x3
	adds r1, r3, 0
	adds r1, 0xF
	b _081E32C8
	.align 2, 0
_081E32BC: .4byte gRfuLinkStatus
_081E32C0:
	movs r5, 0x2
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r3, r0
_081E32C8:
	movs r7, 0x1
	adds r0, r7, 0
	lsls r0, r4
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r6, 0
	ldrh r3, [r2]
	cmp r3, 0
	bne _081E3326
	ldrb r0, [r1]
	cmp r0, r5
	bcs _081E3300
	movs r0, 0x49
	strh r0, [r2]
	ldr r0, _081E32F8 @ =0x00000702
	strh r0, [r2, 0x18]
	ldr r0, _081E32FC @ =gRfuStatic
	ldr r2, [r0]
	ldrb r1, [r2, 0x4]
	adds r0, r6, 0
	orrs r0, r1
	strb r0, [r2, 0x4]
	b _081E3326
	.align 2, 0
_081E32F8: .4byte 0x00000702
_081E32FC: .4byte gRfuStatic
_081E3300:
	strh r3, [r2, 0x18]
	ldrb r0, [r1]
	subs r0, r5
	strb r0, [r1]
	adds r0, r2, 0
	adds r0, 0x2D
	str r0, [r2, 0x4]
	movs r0, 0x7
	str r0, [r2, 0x14]
	strb r7, [r2, 0x1F]
	strh r3, [r2, 0x2E]
	strb r4, [r2, 0x1A]
	ldr r0, _081E332C @ =0x00008041
	strh r0, [r2]
	mov r0, r12
	ldr r1, [r0]
	ldrb r0, [r1, 0x5]
	orrs r4, r0
	strb r4, [r1, 0x5]
_081E3326:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E332C: .4byte 0x00008041
	thumb_func_end rfu_STC_NI_initSlot_asRecvControllData

	thumb_func_start rfu_STC_NI_initSlot_asRecvDataEntity
rfu_STC_NI_initSlot_asRecvDataEntity: @ 81E3330
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	adds r0, 0x2D
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E3354
	ldr r0, _081E3350 @ =gRfuLinkStatus
	lsls r1, r5, 5
	adds r1, 0x14
	ldr r0, [r0]
	adds r0, r1
	adds r0, 0x4
	b _081E33AA
	.align 2, 0
_081E3350: .4byte gRfuLinkStatus
_081E3354:
	ldr r1, _081E3398 @ =gRfuSlotStatusNI
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	ldr r1, [r4, 0x30]
	ldr r0, [r2, 0x6C]
	cmp r1, r0
	bls _081E33A8
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r5
	lsrs r1, 24
	ldr r0, _081E339C @ =gRfuStatic
	ldr r3, [r0]
	ldrb r2, [r3, 0x4]
	adds r0, r1, 0
	orrs r0, r2
	strb r0, [r3, 0x4]
	ldr r0, _081E33A0 @ =gRfuLinkStatus
	ldr r2, [r0]
	ldrb r0, [r2, 0x5]
	bics r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _081E33A4 @ =0x00000701
	strh r0, [r4, 0x18]
	movs r0, 0x47
	strh r0, [r4]
	adds r0, r5, 0
	movs r1, 0x1
	adds r2, r4, 0
	bl rfu_STC_releaseFrame
	b _081E33DC
	.align 2, 0
_081E3398: .4byte gRfuSlotStatusNI
_081E339C: .4byte gRfuStatic
_081E33A0: .4byte gRfuLinkStatus
_081E33A4: .4byte 0x00000701
_081E33A8:
	ldr r0, [r2, 0x68]
_081E33AA:
	str r0, [r4, 0x4]
	movs r3, 0
	adds r6, r4, 0
	adds r6, 0x21
	movs r7, 0
	adds r5, r4, 0x4
_081E33B6:
	adds r0, r6, r3
	strb r7, [r0]
	lsls r1, r3, 2
	adds r1, r5, r1
	ldrh r0, [r4, 0x2E]
	adds r2, r0, 0
	muls r2, r3
	ldr r0, [r4, 0x4]
	adds r0, r2
	str r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _081E33B6
	ldr r0, [r4, 0x30]
	str r0, [r4, 0x14]
	ldr r0, _081E33E4 @ =0x00008042
	strh r0, [r4]
_081E33DC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E33E4: .4byte 0x00008042
	thumb_func_end rfu_STC_NI_initSlot_asRecvDataEntity

	thumb_func_start rfu_NI_checkCommFailCounter
rfu_NI_checkCommFailCounter: @ 81E33E8
	push {r4-r7,lr}
	ldr r2, _081E3474 @ =gRfuLinkStatus
	ldr r0, [r2]
	ldrb r1, [r0, 0x4]
	ldrb r0, [r0, 0x5]
	orrs r0, r1
	cmp r0, 0
	beq _081E346E
	ldr r1, _081E3478 @ =0x04000208
	ldrh r0, [r1]
	mov r12, r0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _081E347C @ =gRfuStatic
	ldr r0, [r1]
	ldrb r0, [r0, 0x2]
	lsrs r7, r0, 4
	movs r3, 0
	adds r6, r1, 0
	adds r5, r2, 0
	ldr r4, _081E3480 @ =gRfuSlotStatusNI
_081E3412:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r3
	lsrs r2, r0, 24
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	ands r0, r2
	cmp r0, 0
	beq _081E343A
	ldr r0, [r6]
	ldrb r0, [r0, 0x2]
	ands r0, r2
	cmp r0, 0
	bne _081E343A
	lsls r0, r3, 2
	adds r0, r4
	ldr r1, [r0]
	ldrh r0, [r1, 0x2]
	adds r0, 0x1
	strh r0, [r1, 0x2]
_081E343A:
	ldr r0, [r5]
	ldrb r0, [r0, 0x5]
	ands r0, r2
	cmp r0, 0
	beq _081E3458
	adds r0, r7, 0
	ands r0, r2
	cmp r0, 0
	bne _081E3458
	lsls r0, r3, 2
	adds r0, r4
	ldr r1, [r0]
	ldrh r0, [r1, 0x36]
	adds r0, 0x1
	strh r0, [r1, 0x36]
_081E3458:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _081E3412
	ldr r0, [r6]
	movs r1, 0
	strb r1, [r0, 0x2]
	ldr r0, _081E3478 @ =0x04000208
	mov r1, r12
	strh r1, [r0]
_081E346E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E3474: .4byte gRfuLinkStatus
_081E3478: .4byte 0x04000208
_081E347C: .4byte gRfuStatic
_081E3480: .4byte gRfuSlotStatusNI
	thumb_func_end rfu_NI_checkCommFailCounter

	thumb_func_start rfu_REQ_noise
rfu_REQ_noise: @ 81E3484
	push {lr}
	ldr r0, _081E3498 @ =rfu_STC_REQ_callback
	bl STWI_set_Callback_M
	movs r0, 0x1
	movs r1, 0
	bl STWI_send_TestModeREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E3498: .4byte rfu_STC_REQ_callback
	thumb_func_end rfu_REQ_noise

	thumb_func_start sub_81E349C
sub_81E349C: @ 81E349C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081E34B4 @ =0x04000208
	ldrh r0, [r0]
	cmp r0, 0
	bne _081E34B8
	movs r0, 0x1
	negs r0, r0
	b _081E3538
	.align 2, 0
_081E34B4: .4byte 0x04000208
_081E34B8:
	ldr r0, _081E34E4 @ =0x04000200
	ldrh r0, [r0]
	mov r8, r0
	ldr r4, _081E34E8 @ =gRfuState
	ldr r1, [r4]
	movs r0, 0xA
	str r0, [r1]
	ldr r0, _081E34EC @ =sub_81E36B8
	bl STWI_set_Callback_ID
	bl sub_81E3550
	ldr r0, [r4]
	ldrb r0, [r0, 0xA]
	lsls r0, 2
	ldr r1, _081E34F0 @ =0x04000100
	adds r4, r0, r1
	lsls r0, r5, 27
	lsrs r5, r0, 24
	movs r7, 0
	b _081E3506
	.align 2, 0
_081E34E4: .4byte 0x04000200
_081E34E8: .4byte gRfuState
_081E34EC: .4byte sub_81E36B8
_081E34F0: .4byte 0x04000100
_081E34F4:
	strh r6, [r4, 0x2]
	strh r6, [r4]
	movs r0, 0x83
	strh r0, [r4, 0x2]
_081E34FC:
	ldrh r0, [r4]
	cmp r0, 0x1F
	bls _081E34FC
	strh r7, [r4, 0x2]
	strh r7, [r4]
_081E3506:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	beq _081E351A
	bl sub_81E35C4
	adds r6, r0, 0
	cmp r6, 0
	beq _081E34F4
_081E351A:
	ldr r1, _081E3544 @ =0x04000208
	movs r0, 0
	strh r0, [r1]
	ldr r0, _081E3548 @ =0x04000200
	mov r2, r8
	strh r2, [r0]
	movs r0, 0x1
	strh r0, [r1]
	ldr r0, _081E354C @ =gRfuState
	ldr r1, [r0]
	movs r0, 0
	str r0, [r1]
	bl STWI_set_Callback_ID
	adds r0, r6, 0
_081E3538:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E3544: .4byte 0x04000208
_081E3548: .4byte 0x04000200
_081E354C: .4byte gRfuState
	thumb_func_end sub_81E349C

	thumb_func_start sub_81E3550
sub_81E3550: @ 81E3550
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r3, _081E35A8 @ =0x04000208
	movs r4, 0
	strh r4, [r3]
	ldr r2, _081E35AC @ =0x04000200
	ldr r0, _081E35B0 @ =gRfuState
	ldr r0, [r0]
	movs r1, 0x8
	ldrb r0, [r0, 0xA]
	lsls r1, r0
	movs r5, 0x80
	orrs r1, r5
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	movs r0, 0x1
	strh r0, [r3]
	ldr r0, _081E35B4 @ =0x04000134
	strh r4, [r0]
	subs r2, 0xD8
	movs r1, 0x80
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r2]
	ldrh r0, [r2]
	movs r3, 0x81
	lsls r3, 7
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0
	str r0, [sp]
	ldr r1, _081E35B8 @ =gUnknown_3007470
	ldr r2, _081E35BC @ =0x05000003
	mov r0, sp
	bl CpuSet
	ldr r0, _081E35C0 @ =0x04000202
	strh r5, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E35A8: .4byte 0x04000208
_081E35AC: .4byte 0x04000200
_081E35B0: .4byte gRfuState
_081E35B4: .4byte 0x04000134
_081E35B8: .4byte gUnknown_3007470
_081E35BC: .4byte 0x05000003
_081E35C0: .4byte 0x04000202
	thumb_func_end sub_81E3550

	thumb_func_start sub_81E35C4
sub_81E35C4: @ 81E35C4
	push {r4-r7,lr}
	ldr r0, _081E35D8 @ =gUnknown_3007470
	ldrb r1, [r0, 0x1]
	mov r12, r1
	adds r7, r0, 0
	cmp r1, 0
	beq _081E35DC
	cmp r1, 0x1
	beq _081E3614
	b _081E36AC
	.align 2, 0
_081E35D8: .4byte gUnknown_3007470
_081E35DC:
	movs r6, 0x1
	strb r6, [r7]
	ldr r3, _081E3608 @ =0x04000128
	ldrh r0, [r3]
	movs r5, 0x1
	orrs r0, r5
	strh r0, [r3]
	ldr r4, _081E360C @ =0x04000208
	mov r0, r12
	strh r0, [r4]
	ldr r2, _081E3610 @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r2]
	strh r6, [r4]
	strb r5, [r7, 0x1]
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
	b _081E36B0
	.align 2, 0
_081E3608: .4byte 0x04000128
_081E360C: .4byte 0x04000208
_081E3610: .4byte 0x04000200
_081E3614:
	ldrh r0, [r7, 0xA]
	cmp r0, 0
	bne _081E36A8
	ldrb r0, [r7]
	cmp r0, 0x1
	bne _081E3644
	ldrh r0, [r7, 0x2]
	cmp r0, 0
	bne _081E36B0
	ldr r3, _081E363C @ =0x04000208
	strh r0, [r3]
	ldr r2, _081E3640 @ =0x04000128
	ldrh r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r2]
	mov r1, r12
	strh r1, [r3]
	b _081E36B0
	.align 2, 0
_081E363C: .4byte 0x04000208
_081E3640: .4byte 0x04000128
_081E3644:
	ldrh r1, [r7, 0x4]
	ldr r0, _081E3690 @ =0x00008001
	cmp r1, r0
	beq _081E36B0
	ldrh r6, [r7, 0x2]
	cmp r6, 0
	bne _081E36B0
	ldr r4, _081E3694 @ =0x04000208
	strh r6, [r4]
	ldr r3, _081E3698 @ =0x04000200
	ldrh r1, [r3]
	ldr r0, _081E369C @ =0x0000ff7f
	ands r0, r1
	strh r0, [r3]
	mov r7, r12
	strh r7, [r4]
	ldr r2, _081E36A0 @ =0x04000128
	strh r6, [r2]
	movs r1, 0x80
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r2]
	ldr r0, _081E36A4 @ =0x04000202
	movs r5, 0x80
	strh r5, [r0]
	ldrh r0, [r2]
	movs r7, 0x81
	lsls r7, 7
	adds r1, r7, 0
	orrs r0, r1
	strh r0, [r2]
	strh r6, [r4]
	ldrh r0, [r3]
	orrs r0, r5
	strh r0, [r3]
	mov r0, r12
	strh r0, [r4]
	b _081E36B0
	.align 2, 0
_081E3690: .4byte 0x00008001
_081E3694: .4byte 0x04000208
_081E3698: .4byte 0x04000200
_081E369C: .4byte 0x0000ff7f
_081E36A0: .4byte 0x04000128
_081E36A4: .4byte 0x04000202
_081E36A8:
	movs r0, 0x2
	strb r0, [r7, 0x1]
_081E36AC:
	ldrh r0, [r7, 0xA]
	b _081E36B2
_081E36B0:
	movs r0, 0
_081E36B2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81E35C4

	thumb_func_start sub_81E36B8
sub_81E36B8: @ 81E36B8
	push {r4,r5,lr}
	ldr r0, _081E3700 @ =0x04000120
	ldr r5, [r0]
	ldr r0, _081E3704 @ =gUnknown_3007470
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x1
	beq _081E36D2
	ldr r0, _081E3708 @ =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_081E36D2:
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r0, r5, 0
	lsls r0, r1
	lsrs r1, r0, 16
	movs r0, 0x1
	subs r0, r2
	lsls r0, 4
	lsls r5, r0
	adds r0, r5, 0
	lsrs r5, r0, 16
	ldrh r0, [r4, 0xA]
	cmp r0, 0
	bne _081E3726
	ldrh r2, [r4, 0x6]
	cmp r1, r2
	bne _081E3724
	ldrh r3, [r4, 0x2]
	cmp r3, 0x3
	bls _081E370C
	strh r5, [r4, 0xA]
	b _081E3726
	.align 2, 0
_081E3700: .4byte 0x04000120
_081E3704: .4byte gUnknown_3007470
_081E3708: .4byte 0x04000128
_081E370C:
	ldrh r0, [r4, 0x4]
	mvns r0, r0
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bne _081E3726
	mvns r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r5, r0
	bne _081E3726
	adds r0, r3, 0x1
_081E3724:
	strh r0, [r4, 0x2]
_081E3726:
	ldrh r0, [r4, 0x2]
	cmp r0, 0x3
	bhi _081E373C
	lsls r0, 1
	ldr r1, _081E3738 @ =_Str_Sio32ID
	adds r0, r1
	ldrh r0, [r0]
	b _081E373E
	.align 2, 0
_081E3738: .4byte _Str_Sio32ID
_081E373C:
	ldr r0, _081E3794 @ =0x00008001
_081E373E:
	strh r0, [r4, 0x4]
	mvns r0, r5
	strh r0, [r4, 0x6]
	ldr r3, _081E3798 @ =0x04000120
	ldrh r2, [r4, 0x4]
	ldrb r1, [r4]
	movs r0, 0x1
	subs r0, r1
	lsls r0, 4
	lsls r2, r0
	ldrh r0, [r4, 0x6]
	lsls r1, 4
	lsls r0, r1
	adds r2, r0
	str r2, [r3]
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _081E378C
	ldrh r0, [r4, 0x2]
	cmp r0, 0
	bne _081E376E
	ldr r0, _081E379C @ =0x0000494e
	cmp r5, r0
	bne _081E378C
_081E376E:
	movs r0, 0
	ldr r1, _081E37A0 @ =0x00000257
_081E3772:
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r1
	bls _081E3772
	ldrh r0, [r4, 0xA]
	cmp r0, 0
	bne _081E378C
	ldr r0, _081E37A4 @ =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_081E378C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E3794: .4byte 0x00008001
_081E3798: .4byte 0x04000120
_081E379C: .4byte 0x0000494e
_081E37A0: .4byte 0x00000257
_081E37A4: .4byte 0x04000128
	thumb_func_end sub_81E36B8

	.align 2, 0 @ Don't pad with nop.
