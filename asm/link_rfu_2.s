	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_87
nullsub_87: @ 80F85F0
	bx lr
	thumb_func_end nullsub_87

	thumb_func_start nullsub_88
nullsub_88: @ 80F85F4
	bx lr
	thumb_func_end nullsub_88

	thumb_func_start sub_80F85F8
sub_80F85F8: @ 80F85F8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	ldr r6, _080F869C @ =gUnknown_3005450
	adds r5, r6, 0
	adds r5, 0xEE
	ldrb r4, [r5]
	mov r0, sp
	movs r7, 0
	strh r7, [r0]
	ldr r2, _080F86A0 @ =0x010004d6
	adds r1, r6, 0
	bl CpuSet
	movs r0, 0xFF
	strb r0, [r6, 0xC]
	ldrb r0, [r5]
	strb r4, [r5]
	ldrb r0, [r5]
	cmp r0, 0x4
	beq _080F862A
	ldrb r0, [r5]
	strb r7, [r5]
_080F862A:
	mov r7, sp
	adds r7, 0x2
	add r0, sp, 0x4
	mov r8, r0
	movs r0, 0x6
	add r0, sp
	mov r9, r0
	adds r5, r6, 0
	adds r5, 0x80
	movs r4, 0x4
_080F863E:
	adds r0, r5, 0
	bl sub_80F9CB4
	adds r5, 0x14
	subs r4, 0x1
	cmp r4, 0
	bge _080F863E
	movs r5, 0
	ldr r4, _080F86A4 @ =gUnknown_30054BC
	adds r0, r4, 0
	bl sub_80F9CB4
	adds r0, r4, 0
	adds r0, 0xB8
	bl sub_80FC478
	ldr r0, _080F86A8 @ =0x00000634
	adds r4, r0
	adds r0, r4, 0
	bl sub_80FC4D4
	strh r5, [r7]
	ldr r1, _080F86AC @ =gUnknown_3003F50
	ldr r2, _080F86B0 @ =0x01000008
	adds r0, r7, 0
	bl CpuSet
	mov r0, r8
	strh r5, [r0]
	ldr r1, _080F86B4 @ =gUnknown_3003ED0
	ldr r2, _080F86B8 @ =0x01000028
	bl CpuSet
	mov r0, r9
	strh r5, [r0]
	ldr r1, _080F86BC @ =gLinkPlayers
	ldr r2, _080F86C0 @ =0x01000046
	bl CpuSet
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F869C: .4byte gUnknown_3005450
_080F86A0: .4byte 0x010004d6
_080F86A4: .4byte gUnknown_30054BC
_080F86A8: .4byte 0x00000634
_080F86AC: .4byte gUnknown_3003F50
_080F86B0: .4byte 0x01000008
_080F86B4: .4byte gUnknown_3003ED0
_080F86B8: .4byte 0x01000028
_080F86BC: .4byte gLinkPlayers
_080F86C0: .4byte 0x01000046
	thumb_func_end sub_80F85F8

	thumb_func_start InitRFU
InitRFU: @ 80F86C4
	push {r4-r6,lr}
	ldr r4, _080F86EC @ =gIntrTable
	ldr r5, [r4, 0x4]
	ldr r6, [r4, 0x8]
	bl sub_80F86F4
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	ldr r1, _080F86F0 @ =0x04000208
	movs r0, 0
	strh r0, [r1]
	str r5, [r4, 0x4]
	str r6, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F86EC: .4byte gIntrTable
_080F86F0: .4byte 0x04000208
	thumb_func_end InitRFU

	thumb_func_start sub_80F86F4
sub_80F86F4: @ 80F86F4
	push {r4,lr}
	ldr r0, _080F8728 @ =gUnknown_3001190
	ldr r1, _080F872C @ =0x00000e64
	ldr r4, _080F8730 @ =gIntrTable + 0x4
	adds r2, r4, 0
	movs r3, 0x1
	bl sub_81E05B0
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080F8722
	ldr r0, _080F8734 @ =gUnknown_202271A
	strh r1, [r0]
	movs r0, 0
	bl sub_80FB128
	bl sub_80F85F8
	adds r1, r4, 0x4
	movs r0, 0x3
	bl rfu_setTimerInterrupt
_080F8722:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F8728: .4byte gUnknown_3001190
_080F872C: .4byte 0x00000e64
_080F8730: .4byte gIntrTable + 0x4
_080F8734: .4byte gUnknown_202271A
	thumb_func_end sub_80F86F4

	thumb_func_start sub_80F8738
sub_80F8738: @ 80F8738
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80FA738
	ldr r0, _080F8758 @ =gUnknown_3005450
	ldrh r0, [r0, 0x4]
	cmp r0, 0x12
	bls _080F874C
	b _080F8852
_080F874C:
	lsls r0, 2
	ldr r1, _080F875C @ =_080F8760
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F8758: .4byte gUnknown_3005450
_080F875C: .4byte _080F8760
	.align 2, 0
_080F8760:
	.4byte _080F87AC
	.4byte _080F8852
	.4byte _080F87D4
	.4byte _080F8852
	.4byte _080F8804
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8852
	.4byte _080F8818
_080F87AC:
	ldr r0, _080F87C8 @ =gUnknown_203ABF0
	bl sub_80FD4B0
	ldr r0, _080F87CC @ =gUnknown_3005450
	movs r2, 0x1
	strh r2, [r0, 0x4]
	ldr r1, _080F87D0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xA]
	b _080F8852
	.align 2, 0
_080F87C8: .4byte gUnknown_203ABF0
_080F87CC: .4byte gUnknown_3005450
_080F87D0: .4byte gTasks
_080F87D4:
	ldr r4, _080F87F8 @ =gUnknown_3005450
	ldrb r0, [r4, 0xC]
	ldr r3, _080F87FC @ =gUnknown_843EC8C
	movs r1, 0
	movs r2, 0xF0
	bl sub_80FD538
	movs r0, 0x3
	strh r0, [r4, 0x4]
	ldr r1, _080F8800 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x6
	strh r1, [r0, 0xA]
	b _080F8852
	.align 2, 0
_080F87F8: .4byte gUnknown_3005450
_080F87FC: .4byte gUnknown_843EC8C
_080F8800: .4byte gTasks
_080F8804:
	movs r0, 0
	bl sub_80FD760
	ldr r1, _080F8814 @ =gUnknown_3005450
	movs r0, 0x5
	strh r0, [r1, 0x4]
	b _080F8852
	.align 2, 0
_080F8814: .4byte gUnknown_3005450
_080F8818:
	ldr r4, _080F8858 @ =gUnknown_3005450
	ldr r0, _080F885C @ =0x00000993
	adds r1, r4, r0
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080F8860 @ =sub_80F8DA8
	bl sub_80FEA10
	bl sub_80F8AA4
	bl sub_80F8AEC
	movs r0, 0x14
	strh r0, [r4, 0x4]
	ldr r1, _080F8864 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	strh r1, [r0, 0xA]
	ldr r0, _080F8868 @ =sub_80FA834
	movs r1, 0x5
	bl CreateTask
	adds r0, r5, 0
	bl DestroyTask
_080F8852:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F8858: .4byte gUnknown_3005450
_080F885C: .4byte 0x00000993
_080F8860: .4byte sub_80F8DA8
_080F8864: .4byte gTasks
_080F8868: .4byte sub_80FA834
	thumb_func_end sub_80F8738

	thumb_func_start sub_80F886C
sub_80F886C: @ 80F886C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080F8878 @ =gUnknown_843EC51
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080F8878: .4byte gUnknown_843EC51
	thumb_func_end sub_80F886C

	thumb_func_start sub_80F887C
sub_80F887C: @ 80F887C
	push {r4-r7,lr}
	adds r2, r0, 0
	adds r5, r1, 0
	movs r4, 0x1
	adds r1, r2, 0
	movs r6, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _080F88BC
	movs r3, 0
	movs r5, 0x1
	ldr r1, _080F88B8 @ =gUnknown_3005DE6
_080F8896:
	adds r0, r2, 0
	ands r0, r5
	cmp r0, 0
	beq _080F88A8
	adds r0, r3, r1
	strb r4, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080F88A8:
	asrs r2, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080F8896
	b _080F8932
	.align 2, 0
_080F88B8: .4byte gUnknown_3005DE6
_080F88BC:
	movs r3, 0
	mvns r0, r1
	mov r12, r0
	movs r7, 0x1
	ldr r4, _080F8938 @ =gUnknown_3005DE6
_080F88C6:
	adds r2, r1, 0
	ands r2, r7
	cmp r2, 0
	bne _080F88D2
	adds r0, r3, r4
	strb r2, [r0]
_080F88D2:
	asrs r1, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080F88C6
	movs r4, 0x4
	ldr r0, _080F8938 @ =gUnknown_3005DE6
	ldrb r7, [r0]
_080F88E4:
	movs r3, 0
	subs r1, r4, 0x1
	cmp r7, r4
	beq _080F8900
	ldr r2, _080F8938 @ =gUnknown_3005DE6
_080F88EE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bhi _080F8900
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, r4
	bne _080F88EE
_080F8900:
	cmp r3, 0x4
	bne _080F8906
	adds r6, r4, 0
_080F8906:
	lsls r0, r1, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080F88E4
	mov r0, r12
	ands r5, r0
	movs r3, 0
	movs r2, 0x1
	ldr r1, _080F8938 @ =gUnknown_3005DE6
_080F8918:
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _080F8926
	adds r0, r3, r1
	strb r6, [r0]
	adds r6, 0x1
_080F8926:
	asrs r5, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080F8918
_080F8932:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F8938: .4byte gUnknown_3005DE6
	thumb_func_end sub_80F887C

	thumb_func_start sub_80F893C
sub_80F893C: @ 80F893C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080F8958 @ =gUnknown_3005450
	ldrh r3, [r0, 0x4]
	adds r7, r0, 0
	cmp r3, 0xC
	bls _080F894E
	b _080F8A8A
_080F894E:
	lsls r0, r3, 2
	ldr r1, _080F895C @ =_080F8960
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F8958: .4byte gUnknown_3005450
_080F895C: .4byte _080F8960
	.align 2, 0
_080F8960:
	.4byte _080F8994
	.4byte _080F8A8A
	.4byte _080F8A8A
	.4byte _080F8A8A
	.4byte _080F8A8A
	.4byte _080F8A8A
	.4byte _080F89AC
	.4byte _080F8A8A
	.4byte _080F8A8A
	.4byte _080F89D4
	.4byte _080F8A8A
	.4byte _080F89E8
	.4byte _080F8A2C
_080F8994:
	ldr r0, _080F89A4 @ =gUnknown_843EBB4
	bl sub_80FD4B0
	ldr r0, _080F89A8 @ =gUnknown_3005450
	movs r2, 0x1
	strh r2, [r0, 0x4]
	b _080F89BC
	.align 2, 0
_080F89A4: .4byte gUnknown_843EBB4
_080F89A8: .4byte gUnknown_3005450
_080F89AC:
	ldrb r0, [r7, 0xC]
	ldr r3, _080F89CC @ =gUnknown_843EC8C
	movs r1, 0
	movs r2, 0xF0
	bl sub_80FD538
	movs r2, 0x7
	strh r2, [r7, 0x4]
_080F89BC:
	ldr r1, _080F89D0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xA]
	b _080F8A8A
	.align 2, 0
_080F89CC: .4byte gUnknown_843EC8C
_080F89D0: .4byte gTasks
_080F89D4:
	ldr r0, _080F89E4 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0xA
	strh r0, [r1, 0xA]
	b _080F8A8A
	.align 2, 0
_080F89E4: .4byte gTasks
_080F89E8:
	bl sub_80FA788
	cmp r0, 0x6
	beq _080F8A0C
	cmp r0, 0x6
	bgt _080F89FA
	cmp r0, 0x5
	beq _080F8A00
	b _080F8A8A
_080F89FA:
	cmp r0, 0x9
	beq _080F8A0C
	b _080F8A8A
_080F8A00:
	ldr r1, _080F8A08 @ =gUnknown_3005450
	movs r0, 0xC
	strh r0, [r1, 0x4]
	b _080F8A8A
	.align 2, 0
_080F8A08: .4byte gUnknown_3005450
_080F8A0C:
	bl sub_80FEB14
	ldr r0, _080F8A24 @ =gUnknown_3005450
	ldr r1, _080F8A28 @ =0x0000099c
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	adds r0, r6, 0
	bl DestroyTask
	b _080F8A8A
	.align 2, 0
_080F8A24: .4byte gUnknown_3005450
_080F8A28: .4byte 0x0000099c
_080F8A2C:
	ldr r0, _080F8A90 @ =0x000008f6
	adds r4, r7, r0
	ldrb r0, [r4]
	movs r5, 0x80
	lsls r5, 17
	lsls r5, r0
	lsrs r5, 24
	ldrb r1, [r4]
	movs r0, 0xC
	bl rfu_clearSlot
	ldrb r1, [r4]
	ldr r0, _080F8A94 @ =0x000008f7
	adds r2, r7, r0
	movs r0, 0x10
	movs r3, 0x46
	bl rfu_setRecvBuffer
	adds r1, r7, 0
	adds r1, 0x4C
	adds r0, r5, 0
	movs r2, 0xE
	bl rfu_UNI_setSendData
	ldr r1, _080F8A98 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	strh r1, [r0, 0xA]
	adds r0, r6, 0
	bl DestroyTask
	ldr r4, _080F8A9C @ =gUnknown_203AC08
	ldrb r0, [r4, 0xF]
	cmp r0, 0
	bne _080F8A82
	bl sub_80FC208
	ldrb r0, [r4, 0xF]
	adds r0, 0x1
	strb r0, [r4, 0xF]
_080F8A82:
	ldr r0, _080F8AA0 @ =sub_80FA834
	movs r1, 0x5
	bl CreateTask
_080F8A8A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F8A90: .4byte 0x000008f6
_080F8A94: .4byte 0x000008f7
_080F8A98: .4byte gTasks
_080F8A9C: .4byte gUnknown_203AC08
_080F8AA0: .4byte sub_80FA834
	thumb_func_end sub_80F893C

	thumb_func_start sub_80F8AA4
sub_80F8AA4: @ 80F8AA4
	push {r4,r5,lr}
	ldr r0, _080F8AE4 @ =gUnknown_3005E10
	ldrb r5, [r0]
	movs r4, 0
_080F8AAC:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _080F8AD0
	lsls r2, r4, 3
	subs r2, r4
	lsls r2, 1
	ldr r0, _080F8AE8 @ =gUnknown_3005464
	adds r2, r0
	movs r0, 0x10
	adds r1, r4, 0
	movs r3, 0xE
	bl rfu_setRecvBuffer
	movs r0, 0x3
	adds r1, r4, 0
	bl rfu_clearSlot
_080F8AD0:
	lsrs r5, 1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080F8AAC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F8AE4: .4byte gUnknown_3005E10
_080F8AE8: .4byte gUnknown_3005464
	thumb_func_end sub_80F8AA4

	thumb_func_start sub_80F8AEC
sub_80F8AEC: @ 80F8AEC
	push {r4-r6,lr}
	ldr r0, _080F8B28 @ =gUnknown_3005E10
	ldrb r5, [r0]
	ldr r4, _080F8B2C @ =gUnknown_3005D8F
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x46
	bl rfu_UNI_setSendData
	adds r0, r5, 0
	bl sub_80F886C
	ldr r1, _080F8B30 @ =0xfffff6c1
	adds r6, r4, r1
	adds r1, r4, 0
	adds r1, 0x53
	strb r0, [r1]
	adds r4, 0x5B
	strb r5, [r4]
	movs r1, 0x1
	negs r1, r1
	adds r0, r5, 0
	bl sub_80F887C
	movs r0, 0x1
	strb r0, [r6, 0xC]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8B28: .4byte gUnknown_3005E10
_080F8B2C: .4byte gUnknown_3005D8F
_080F8B30: .4byte 0xfffff6c1
	thumb_func_end sub_80F8AEC

	thumb_func_start sub_80F8B34
sub_80F8B34: @ 80F8B34
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x54
	bne _080F8B68
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080F8B68
	ldr r0, _080F8B80 @ =gUnknown_3005E10
	ldrb r0, [r0]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	movs r0, 0
	movs r1, 0
	bl sub_80FB9E4
_080F8B68:
	ldr r0, _080F8B84 @ =gUnknown_3005450
	ldrh r2, [r0, 0x4]
	adds r6, r0, 0
	cmp r2, 0x12
	bls _080F8B74
	b _080F8CE6
_080F8B74:
	lsls r0, r2, 2
	ldr r1, _080F8B88 @ =_080F8B8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F8B80: .4byte gUnknown_3005E10
_080F8B84: .4byte gUnknown_3005450
_080F8B88: .4byte _080F8B8C
	.align 2, 0
_080F8B8C:
	.4byte _080F8BD8
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8CE6
	.4byte _080F8C28
	.4byte _080F8C88
	.4byte _080F8CE6
	.4byte _080F8C9C
	.4byte _080F8C00
	.4byte _080F8CE6
_080F8BD8:
	ldr r0, _080F8BF4 @ =gUnknown_203ABF0
	bl sub_80FD4B0
	ldr r0, _080F8BF8 @ =gUnknown_3005450
	movs r2, 0x1
	strh r2, [r0, 0x4]
	ldr r1, _080F8BFC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xA]
	b _080F8CE6
	.align 2, 0
_080F8BF4: .4byte gUnknown_203ABF0
_080F8BF8: .4byte gUnknown_3005450
_080F8BFC: .4byte gTasks
_080F8C00:
	ldr r3, _080F8C1C @ =gUnknown_843EC8C
	movs r0, 0x2
	movs r1, 0
	movs r2, 0xF0
	bl sub_80FD538
	ldr r0, _080F8C20 @ =sub_80F8D20
	bl sub_80FEA10
	ldr r1, _080F8C24 @ =gUnknown_3005450
	movs r0, 0x12
	strh r0, [r1, 0x4]
	b _080F8CE6
	.align 2, 0
_080F8C1C: .4byte gUnknown_843EC8C
_080F8C20: .4byte sub_80F8D20
_080F8C24: .4byte gUnknown_3005450
_080F8C28:
	ldr r1, _080F8C6C @ =0x000008f6
	adds r0, r6, r1
	ldrb r1, [r0]
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r1
	lsrs r0, 24
	adds r1, r6, 0
	adds r1, 0x4C
	movs r2, 0xE
	bl rfu_UNI_setSendData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _080F8CE6
	strb r0, [r6, 0xC]
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, _080F8C70 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x16
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080F8C78
	ldr r0, _080F8C74 @ =sub_80FACF0
	movs r1, 0x1
	bl CreateTask
	b _080F8CE6
	.align 2, 0
_080F8C6C: .4byte 0x000008f6
_080F8C70: .4byte gTasks
_080F8C74: .4byte sub_80FACF0
_080F8C78:
	ldr r0, _080F8C84 @ =sub_80FA834
	movs r1, 0x5
	bl CreateTask
	b _080F8CE6
	.align 2, 0
_080F8C84: .4byte sub_80FA834
_080F8C88:
	movs r0, 0
	bl sub_80FD760
	ldr r1, _080F8C98 @ =gUnknown_3005450
	movs r0, 0xF
	strh r0, [r1, 0x4]
	b _080F8CE6
	.align 2, 0
_080F8C98: .4byte gUnknown_3005450
_080F8C9C:
	ldr r0, _080F8CEC @ =0x00000993
	adds r1, r6, r0
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080F8CF0 @ =sub_80F8DA8
	bl sub_80FEA10
	movs r0, 0x1
	bl sub_80FAFE0
	bl sub_80F8AA4
	bl sub_80F8AEC
	movs r0, 0x14
	strh r0, [r6, 0x4]
	ldr r1, _080F8CF4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	strh r1, [r0, 0xA]
	movs r4, 0x1
	strb r4, [r6, 0xC]
	ldr r0, _080F8CF8 @ =sub_80FA834
	movs r1, 0x5
	bl CreateTask
	movs r1, 0x9A
	lsls r1, 4
	adds r0, r6, r1
	strb r4, [r0]
	adds r0, r5, 0
	bl DestroyTask
_080F8CE6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8CEC: .4byte 0x00000993
_080F8CF0: .4byte sub_80F8DA8
_080F8CF4: .4byte gTasks
_080F8CF8: .4byte sub_80FA834
	thumb_func_end sub_80F8B34

	thumb_func_start sub_80F8CFC
sub_80F8CFC: @ 80F8CFC
	push {lr}
	ldr r3, _080F8D10 @ =gUnknown_843EC8C
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xF0
	bl sub_80FD538
	pop {r0}
	bx r0
	.align 2, 0
_080F8D10: .4byte gUnknown_843EC8C
	thumb_func_end sub_80F8CFC

	thumb_func_start sub_80F8D14
sub_80F8D14: @ 80F8D14
	push {lr}
	movs r0, 0
	bl sub_80FD760
	pop {r0}
	bx r0
	thumb_func_end sub_80F8D14

	thumb_func_start sub_80F8D20
sub_80F8D20: @ 80F8D20
	push {r4,lr}
	ldr r0, _080F8D90 @ =gUnknown_3005450
	movs r2, 0
	movs r1, 0xD
	adds r0, 0x59
_080F8D2A:
	strb r2, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _080F8D2A
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	ldr r1, _080F8D94 @ =gUnknown_3007440
	ldr r3, _080F8D90 @ =gUnknown_3005450
	ldr r0, _080F8D98 @ =0x000008f6
	adds r4, r3, r0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x12]
	cmp r0, 0
	beq _080F8D84
	ldr r2, _080F8D9C @ =0x00000988
	adds r1, r3, r2
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r1, 0x92
	lsls r1, 1
	adds r0, r3, r1
	ldr r2, _080F8DA0 @ =0x000008f7
	adds r1, r3, r2
	bl sub_80FC588
	ldr r1, _080F8DA4 @ =gUnknown_203AC08
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	bl sub_80F906C
	ldrb r0, [r4]
	bl rfu_UNI_readySendData
	ldrb r0, [r4]
	bl rfu_UNI_clearRecvNewDataFlag
_080F8D84:
	movs r0, 0x1
	bl rfu_REQ_sendData_wrapper
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F8D90: .4byte gUnknown_3005450
_080F8D94: .4byte gUnknown_3007440
_080F8D98: .4byte 0x000008f6
_080F8D9C: .4byte 0x00000988
_080F8DA0: .4byte 0x000008f7
_080F8DA4: .4byte gUnknown_203AC08
	thumb_func_end sub_80F8D20

	thumb_func_start sub_80F8DA8
sub_80F8DA8: @ 80F8DA8
	ldr r0, _080F8DB8 @ =gUnknown_3005450
	ldr r1, _080F8DBC @ =0x00000993
	adds r0, r1
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
	bx lr
	.align 2, 0
_080F8DB8: .4byte gUnknown_3005450
_080F8DBC: .4byte 0x00000993
	thumb_func_end sub_80F8DA8

	thumb_func_start sub_80F8DC0
sub_80F8DC0: @ 80F8DC0
	push {r4-r6,lr}
	ldr r0, _080F8DE0 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080F8E64
	bl sub_80FD52C
	ldr r4, _080F8DE4 @ =gUnknown_3005450
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	bne _080F8DEC
	ldr r0, _080F8DE8 @ =sub_80F8738
	b _080F8DF2
	.align 2, 0
_080F8DE0: .4byte gUnknown_203ADFA
_080F8DE4: .4byte gUnknown_3005450
_080F8DE8: .4byte sub_80F8738
_080F8DEC:
	cmp r0, 0
	bne _080F8E14
	ldr r0, _080F8E10 @ =sub_80F893C
_080F8DF2:
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F8E34
	adds r0, r4, 0
	adds r0, 0x67
	ldrb r0, [r0]
	bl DestroyTask
	bl sub_80F85F8
	b _080F8E34
	.align 2, 0
_080F8E10: .4byte sub_80F893C
_080F8E14:
	cmp r0, 0x2
	bne _080F8E34
	ldr r0, _080F8E6C @ =sub_80F8B34
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F8E34
	adds r0, r4, 0
	adds r0, 0x67
	ldrb r0, [r0]
	bl DestroyTask
	bl sub_80F85F8
_080F8E34:
	movs r5, 0
	ldr r6, _080F8E70 @ =gUnknown_843ED88
_080F8E38:
	lsls r0, r5, 2
	adds r0, r6
	ldr r4, [r0]
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F8E5A
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080F8E5A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080F8E38
_080F8E64:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8E6C: .4byte sub_80F8B34
_080F8E70: .4byte gUnknown_843ED88
	thumb_func_end sub_80F8DC0

	thumb_func_start sub_80F8E74
sub_80F8E74: @ 80F8E74
	push {lr}
	ldr r0, _080F8E98 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080F8E92
	ldr r0, _080F8E9C @ =sub_80F8738
	movs r1, 0x1
	bl CreateTask
	ldr r1, _080F8EA0 @ =gUnknown_3005450
	adds r1, 0x67
	strb r0, [r1]
_080F8E92:
	pop {r0}
	bx r0
	.align 2, 0
_080F8E98: .4byte gUnknown_203ADFA
_080F8E9C: .4byte sub_80F8738
_080F8EA0: .4byte gUnknown_3005450
	thumb_func_end sub_80F8E74

	thumb_func_start sub_80F8EA4
sub_80F8EA4: @ 80F8EA4
	push {lr}
	ldr r1, _080F8EBC @ =gUnknown_3005450
	ldrh r0, [r1, 0x4]
	cmp r0, 0x7
	bne _080F8EC4
	ldr r2, _080F8EC0 @ =0x00000985
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F8EC4
	movs r0, 0x1
	b _080F8EC6
	.align 2, 0
_080F8EBC: .4byte gUnknown_3005450
_080F8EC0: .4byte 0x00000985
_080F8EC4:
	movs r0, 0
_080F8EC6:
	pop {r1}
	bx r1
	thumb_func_end sub_80F8EA4

	thumb_func_start sub_80F8ECC
sub_80F8ECC: @ 80F8ECC
	push {r4,lr}
	ldr r4, _080F8EFC @ =gUnknown_3005450
	ldrh r0, [r4, 0x4]
	cmp r0, 0x7
	bne _080F8F08
	ldr r0, _080F8F00 @ =gUnknown_3007460
	ldr r1, [r0]
	ldr r2, _080F8F04 @ =0x000008f5
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 5
	adds r1, r0
	ldrh r0, [r1, 0x14]
	movs r1, 0xF0
	bl sub_80FD610
	lsls r0, 24
	cmp r0, 0
	bne _080F8F08
	movs r0, 0x9
	strh r0, [r4, 0x4]
	movs r0, 0x1
	b _080F8F0A
	.align 2, 0
_080F8EFC: .4byte gUnknown_3005450
_080F8F00: .4byte gUnknown_3007460
_080F8F04: .4byte 0x000008f5
_080F8F08:
	movs r0, 0
_080F8F0A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F8ECC

	thumb_func_start sub_80F8F10
sub_80F8F10: @ 80F8F10
	push {lr}
	ldr r0, _080F8F34 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080F8F2E
	ldr r0, _080F8F38 @ =sub_80F893C
	movs r1, 0x1
	bl CreateTask
	ldr r1, _080F8F3C @ =gUnknown_3005450
	adds r1, 0x67
	strb r0, [r1]
_080F8F2E:
	pop {r0}
	bx r0
	.align 2, 0
_080F8F34: .4byte gUnknown_203ADFA
_080F8F38: .4byte sub_80F893C
_080F8F3C: .4byte gUnknown_3005450
	thumb_func_end sub_80F8F10

	thumb_func_start sub_80F8F40
sub_80F8F40: @ 80F8F40
	push {lr}
	ldr r0, _080F8F50 @ =gUnknown_3005E10
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F8F54
	movs r0, 0
	b _080F8F56
	.align 2, 0
_080F8F50: .4byte gUnknown_3005E10
_080F8F54:
	movs r0, 0x1
_080F8F56:
	pop {r1}
	bx r1
	thumb_func_end sub_80F8F40

	thumb_func_start sub_80F8F5C
sub_80F8F5C: @ 80F8F5C
	ldr r1, _080F8F70 @ =gUnknown_3005450
	movs r0, 0x4
	strh r0, [r1, 0x4]
	ldr r0, _080F8F74 @ =gUnknown_3005E10
	ldrb r0, [r0]
	ldr r2, _080F8F78 @ =0x0000099f
	adds r1, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080F8F70: .4byte gUnknown_3005450
_080F8F74: .4byte gUnknown_3005E10
_080F8F78: .4byte 0x0000099f
	thumb_func_end sub_80F8F5C

	thumb_func_start sub_80F8F7C
sub_80F8F7C: @ 80F8F7C
	push {lr}
	adds r1, r0, 0
	ldr r2, _080F8F94 @ =gUnknown_3005450
	ldrh r0, [r2, 0x4]
	cmp r0, 0x11
	beq _080F8F8C
	cmp r1, 0
	beq _080F8F98
_080F8F8C:
	movs r0, 0x12
	strh r0, [r2, 0x4]
	movs r0, 0x1
	b _080F8F9A
	.align 2, 0
_080F8F94: .4byte gUnknown_3005450
_080F8F98:
	movs r0, 0
_080F8F9A:
	pop {r1}
	bx r1
	thumb_func_end sub_80F8F7C

	thumb_func_start sub_80F8FA0
sub_80F8FA0: @ 80F8FA0
	ldr r1, _080F8FA8 @ =gUnknown_3005450
	movs r0, 0xE
	strh r0, [r1, 0x4]
	bx lr
	.align 2, 0
_080F8FA8: .4byte gUnknown_3005450
	thumb_func_end sub_80F8FA0

	thumb_func_start sub_80F8FAC
sub_80F8FAC: @ 80F8FAC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0
	b _080F8FBE
_080F8FB6:
	lsrs r1, 1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080F8FBE:
	cmp r2, 0x3
	bhi _080F8FD0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F8FB6
	adds r0, r2, 0
	bl rfu_UNI_readySendData
_080F8FD0:
	pop {r0}
	bx r0
	thumb_func_end sub_80F8FAC

	thumb_func_start sub_80F8FD4
sub_80F8FD4: @ 80F8FD4
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0
	ldr r7, _080F9028 @ =gUnknown_3003ED0
	ldr r0, _080F902C @ =gUnknown_3005450
	adds r6, r7, 0
	ldr r1, _080F9030 @ =0x0000093f
	adds r5, r0, r1
_080F8FE4:
	movs r3, 0
	lsls r0, r2, 3
	lsls r1, r2, 4
	adds r4, r2, 0x1
	subs r0, r2
	lsls r0, 1
	adds r2, r0, r5
	adds r1, r6
_080F8FF4:
	ldrh r0, [r1]
	lsrs r0, 8
	strb r0, [r2, 0x1]
	ldrh r0, [r1]
	strb r0, [r2]
	adds r2, 0x2
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x6
	ble _080F8FF4
	adds r2, r4, 0
	cmp r2, 0x4
	ble _080F8FE4
	movs r0, 0
	mov r1, sp
	strh r0, [r1]
	ldr r2, _080F9034 @ =0x01000028
	mov r0, sp
	adds r1, r7, 0
	bl CpuSet
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9028: .4byte gUnknown_3003ED0
_080F902C: .4byte gUnknown_3005450
_080F9030: .4byte 0x0000093f
_080F9034: .4byte 0x01000028
	thumb_func_end sub_80F8FD4

	thumb_func_start sub_80F9038
sub_80F9038: @ 80F9038
	push {lr}
	ldr r3, _080F9064 @ =gUnknown_3003F50
	ldr r2, _080F9068 @ =gUnknown_3003ED0
	movs r1, 0x6
_080F9040:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080F9040
	ldr r1, _080F9064 @ =gUnknown_3003F50
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xC
_080F9056:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _080F9056
	pop {r0}
	bx r0
	.align 2, 0
_080F9064: .4byte gUnknown_3003F50
_080F9068: .4byte gUnknown_3003ED0
	thumb_func_end sub_80F9038

	thumb_func_start sub_80F906C
sub_80F906C: @ 80F906C
	push {r4,r5,lr}
	ldr r4, _080F90CC @ =gUnknown_3005450
	ldr r0, _080F90D0 @ =0x000008f4
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080F909E
	ldr r1, _080F90D4 @ =0x000008d4
	adds r0, r4, r1
	adds r1, r4, 0
	adds r1, 0x4C
	bl sub_80FC888
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080F90D8 @ =0x000008f2
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, r0, 0
	cmp r1, 0
	bne _080F909A
	ldrb r0, [r5]
	strb r1, [r5]
_080F909A:
	cmp r2, 0
	bne _080F90C4
_080F909E:
	ldr r5, _080F90CC @ =gUnknown_3005450
	ldr r1, _080F90D0 @ =0x000008f4
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F90C4
	movs r1, 0xD4
	lsls r1, 3
	adds r0, r5, r1
	adds r4, r5, 0
	adds r4, 0x4C
	adds r1, r4, 0
	bl sub_80FC79C
	ldr r1, _080F90D4 @ =0x000008d4
	adds r0, r5, r1
	adds r1, r4, 0
	bl sub_80FC828
_080F90C4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F90CC: .4byte gUnknown_3005450
_080F90D0: .4byte 0x000008f4
_080F90D4: .4byte 0x000008d4
_080F90D8: .4byte 0x000008f2
	thumb_func_end sub_80F906C

	thumb_func_start sub_80F90DC
sub_80F90DC: @ 80F90DC
	push {r4,lr}
	ldr r0, _080F90EC @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _080F90F0
_080F90E8:
	movs r0, 0
	b _080F9110
	.align 2, 0
_080F90EC: .4byte gUnknown_3007460
_080F90F0:
	movs r3, 0
	ldr r4, _080F9118 @ =gUnknown_3003ED0
_080F90F4:
	movs r2, 0
	lsls r0, r3, 4
	adds r1, r0, r4
_080F90FA:
	ldrh r0, [r1]
	cmp r0, 0
	bne _080F90E8
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x6
	ble _080F90FA
	adds r3, 0x1
	cmp r3, 0x4
	ble _080F90F4
	movs r0, 0x1
_080F9110:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F9118: .4byte gUnknown_3003ED0
	thumb_func_end sub_80F90DC

	thumb_func_start sub_80F911C
sub_80F911C: @ 80F911C
	push {r4-r6,lr}
	ldr r6, _080F9138 @ =gUnknown_3005450
	ldrh r0, [r6, 0x4]
	cmp r0, 0x13
	bhi _080F913C
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	movs r0, 0
	bl rfu_REQ_sendData_wrapper
	b _080F91F6
	.align 2, 0
_080F9138: .4byte gUnknown_3005450
_080F913C:
	ldr r0, _080F9198 @ =0x00000993
	adds r1, r6, r0
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080F919C @ =0x0000099a
	adds r1, r6, r0
	ldr r0, _080F91A0 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r1, [r1]
	ldrb r0, [r0, 0x2]
	ands r0, r1
	cmp r0, r1
	bne _080F91F6
	cmp r0, 0
	beq _080F91F6
	ldr r1, _080F91A4 @ =0x00000994
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r5, r0, 0
	cmp r5, 0
	bne _080F91EC
	ldr r0, _080F91A8 @ =0x0000099b
	adds r4, r6, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _080F91CC
	bl sub_80FBCF8
	strb r5, [r4]
	ldr r1, _080F91AC @ =0x0000099c
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F91B0
	movs r4, 0x80
	lsls r4, 8
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
	adds r0, r4, 0
	bl sub_80FB0E8
	b _080F91F6
	.align 2, 0
_080F9198: .4byte 0x00000993
_080F919C: .4byte 0x0000099a
_080F91A0: .4byte gUnknown_3007460
_080F91A4: .4byte 0x00000994
_080F91A8: .4byte 0x0000099b
_080F91AC: .4byte 0x0000099c
_080F91B0:
	ldr r0, _080F91C4 @ =gUnknown_3005E10
	ldrb r4, [r0]
	cmp r4, 0
	bne _080F91CC
	bl sub_80F8DC0
	ldr r0, _080F91C8 @ =gUnknown_3003F64
	strb r4, [r0]
	b _080F91F6
	.align 2, 0
_080F91C4: .4byte gUnknown_3005E10
_080F91C8: .4byte gUnknown_3003F64
_080F91CC:
	bl sub_80F8FD4
	ldr r0, _080F91E4 @ =gUnknown_3005450
	ldr r1, _080F91E8 @ =0x00000992
	adds r0, r1
	ldrb r0, [r0]
	bl rfu_UNI_readySendData
	movs r0, 0x1
	bl rfu_REQ_sendData_wrapper
	b _080F91F0
	.align 2, 0
_080F91E4: .4byte gUnknown_3005450
_080F91E8: .4byte 0x00000992
_080F91EC:
	bl rfu_REQ_PARENT_resumeRetransmitAndChange
_080F91F0:
	ldr r1, _080F9200 @ =gUnknown_3005450
	movs r0, 0x1
	strb r0, [r1, 0xE]
_080F91F6:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F9200: .4byte gUnknown_3005450
	thumb_func_end sub_80F911C

	thumb_func_start sub_80F9204
sub_80F9204: @ 80F9204
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _080F92E4 @ =gUnknown_3005450
	ldrh r1, [r0, 0x4]
	adds r6, r0, 0
	cmp r1, 0x13
	bhi _080F921C
	b _080F947E
_080F921C:
	ldrb r0, [r6, 0xE]
	cmp r0, 0x1
	beq _080F9224
	b _080F947E
_080F9224:
	bl rfu_waitREQComplete
	ldr r0, _080F92E8 @ =0x00000993
	adds r2, r6, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _080F9244
	adds r1, r6, 0
	adds r1, 0xEE
_080F9236:
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F923E
	b _080F94A4
_080F923E:
	ldrb r0, [r2]
	cmp r0, 0
	beq _080F9236
_080F9244:
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	ldr r2, _080F92EC @ =gUnknown_3005E10
	ldr r4, _080F92E4 @ =gUnknown_3005450
	ldr r1, _080F92F0 @ =0x0000099a
	adds r0, r4, r1
	ldrb r1, [r2, 0x3]
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, r0
	beq _080F9260
	b _080F9468
_080F9260:
	ldr r6, _080F92F4 @ =0x00000994
	adds r1, r4, r6
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080F92F8 @ =gUnknown_203AC08
	ldrh r0, [r1, 0x6]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	ldrb r7, [r2]
	movs r5, 0
_080F9276:
	movs r0, 0x1
	ands r0, r7
	lsrs r1, r7, 1
	str r1, [sp, 0x4]
	adds r2, r5, 0x1
	str r2, [sp]
	cmp r0, 0
	bne _080F9288
	b _080F9388
_080F9288:
	ldr r1, _080F92E4 @ =gUnknown_3005450
	lsls r2, r5, 3
	subs r0, r2, r5
	lsls r4, r0, 1
	adds r0, r1, 0
	adds r0, 0x15
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r6, r1, 0
	adds r3, r2, 0
	lsls r1, r5, 24
	mov r10, r1
	cmp r0, 0
	beq _080F9380
	ldr r2, _080F92FC @ =0x000009a6
	adds r0, r6, r2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _080F9304
	adds r0, r6, 0
	adds r0, 0x14
	adds r0, r4, r0
	ldrb r2, [r0]
	lsrs r2, 5
	ldrb r0, [r1]
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	cmp r2, r0
	beq _080F9304
	ldr r0, _080F9300 @ =0x000009a2
	adds r1, r6, r0
	adds r1, r5, r1
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080F9380
	movs r0, 0x81
	lsls r0, 8
	bl sub_80FB0E8
	b _080F9380
	.align 2, 0
_080F92E4: .4byte gUnknown_3005450
_080F92E8: .4byte 0x00000993
_080F92EC: .4byte gUnknown_3005E10
_080F92F0: .4byte 0x0000099a
_080F92F4: .4byte 0x00000994
_080F92F8: .4byte gUnknown_203AC08
_080F92FC: .4byte 0x000009a6
_080F9300: .4byte 0x000009a2
_080F9304:
	ldr r2, _080F9444 @ =gUnknown_3005450
	ldr r6, _080F9448 @ =0x000009a6
	adds r1, r2, r6
	adds r1, r5, r1
	subs r3, r5
	lsls r3, 1
	adds r4, r2, 0
	adds r4, 0x14
	adds r2, r3, r4
	ldrb r0, [r2]
	lsrs r0, 5
	strb r0, [r1]
	ldr r1, _080F9444 @ =gUnknown_3005450
	subs r6, 0x4
	adds r0, r1, r6
	adds r0, r5, r0
	movs r1, 0
	strb r1, [r0]
	ldrb r1, [r2]
	movs r0, 0x1F
	ands r0, r1
	strb r0, [r2]
	ldr r2, _080F944C @ =gUnknown_3005DE6
	adds r0, r5, r2
	ldrb r0, [r0]
	movs r6, 0
	lsls r1, r5, 24
	mov r10, r1
	lsrs r2, r7, 1
	str r2, [sp, 0x4]
	adds r5, 0x1
	str r5, [sp]
	ldr r1, _080F9450 @ =gUnknown_3003ED0
	mov r9, r1
	adds r5, r3, 0
	adds r7, r4, 0
	lsls r0, 4
	mov r8, r0
	adds r2, r5, 0x1
	mov r12, r2
_080F9354:
	lsls r1, r6, 1
	mov r0, r8
	adds r4, r1, r0
	add r4, r9
	mov r2, r12
	adds r3, r1, r2
	adds r3, r7
	ldrb r2, [r3]
	lsls r2, 8
	adds r1, r5
	adds r1, r7
	ldrb r0, [r1]
	orrs r0, r2
	strh r0, [r4]
	movs r0, 0
	strb r0, [r3]
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x6
	bls _080F9354
_080F9380:
	mov r1, r10
	lsrs r0, r1, 24
	bl rfu_UNI_clearRecvNewDataFlag
_080F9388:
	ldr r2, [sp, 0x4]
	lsls r0, r2, 16
	lsrs r7, r0, 16
	ldr r6, [sp]
	lsls r0, r6, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bhi _080F939A
	b _080F9276
_080F939A:
	bl sub_80F9038
	movs r0, 0
	bl sub_80F9868
	bl sub_80FA510
	ldr r4, _080F9444 @ =gUnknown_3005450
	ldr r1, _080F9454 @ =0x0000099d
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F9476
	ldr r2, _080F9458 @ =0x00000991
	adds r0, r4, r2
	ldrb r2, [r0]
	cmp r2, 0
	bne _080F9476
	ldr r0, _080F945C @ =gUnknown_203AC08
	ldrb r1, [r0, 0xE]
	strb r2, [r0, 0xE]
	ldr r6, _080F9460 @ =0x00000992
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, 0x3
	bl rfu_clearSlot
	movs r5, 0
	adds r7, r4, 0
	adds r7, 0x14
_080F93D6:
	ldr r0, _080F9454 @ =0x0000099d
	adds r6, r4, r0
	ldrb r0, [r6]
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F93FA
	lsls r1, r5, 24
	lsrs r1, 24
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 1
	adds r2, r7
	movs r0, 0x10
	movs r3, 0xE
	bl rfu_setRecvBuffer
_080F93FA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080F93D6
	subs r4, r6, 0x3
	ldrb r0, [r4]
	ldrb r2, [r6]
	adds r1, r0, 0
	orrs r1, r2
	bl sub_80F887C
	ldrb r1, [r6]
	movs r2, 0
	strb r1, [r6, 0x4]
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	strb r2, [r6]
	ldrb r0, [r4]
	adds r1, r6, 0
	subs r1, 0x5E
	movs r2, 0x46
	bl rfu_UNI_setSendData
	ldrb r0, [r4]
	bl sub_80F886C
	adds r1, r6, 0
	subs r1, 0xB
	strb r0, [r1]
	ldr r0, _080F9464 @ =sub_80FAA94
	movs r1, 0
	bl CreateTask
	b _080F9476
	.align 2, 0
_080F9444: .4byte gUnknown_3005450
_080F9448: .4byte 0x000009a6
_080F944C: .4byte gUnknown_3005DE6
_080F9450: .4byte gUnknown_3003ED0
_080F9454: .4byte 0x0000099d
_080F9458: .4byte 0x00000991
_080F945C: .4byte gUnknown_203AC08
_080F9460: .4byte 0x00000992
_080F9464: .4byte sub_80FAA94
_080F9468:
	ldr r2, _080F9498 @ =0x00000994
	adds r1, r4, r2
	ldrb r0, [r1]
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1]
	strb r2, [r4, 0xE]
_080F9476:
	ldr r1, _080F949C @ =gUnknown_3005450
	movs r0, 0
	strb r0, [r1, 0xE]
	adds r6, r1, 0
_080F947E:
	ldr r1, _080F9498 @ =0x00000994
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r1, r0, 0
	ldr r0, _080F94A0 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	beq _080F94A8
	movs r0, 0x1
	ands r0, r1
	b _080F94AA
	.align 2, 0
_080F9498: .4byte 0x00000994
_080F949C: .4byte gUnknown_3005450
_080F94A0: .4byte gUnknown_3007460
_080F94A4:
	movs r0, 0
	b _080F94AA
_080F94A8:
	movs r0, 0
_080F94AA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F9204

	thumb_func_start sub_80F94BC
sub_80F94BC: @ 80F94BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r2, r1, 0
	ldrh r1, [r4]
	cmp r1, 0
	beq _080F9500
	ldr r0, _080F94FC @ =gUnknown_3005450
	movs r5, 0x81
	lsls r5, 1
	adds r3, r0, r5
	ldrb r0, [r3]
	lsls r0, 5
	orrs r0, r1
	strh r0, [r4]
	ldrb r0, [r3]
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	strb r0, [r3]
	adds r3, r4, 0
	movs r4, 0x6
_080F94E6:
	ldrh r1, [r3]
	lsrs r0, r1, 8
	strb r0, [r2, 0x1]
	strb r1, [r2]
	adds r2, 0x2
	adds r3, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080F94E6
	b _080F950E
	.align 2, 0
_080F94FC: .4byte gUnknown_3005450
_080F9500:
	movs r1, 0
	adds r0, r2, 0
	adds r0, 0xD
_080F9506:
	strb r1, [r0]
	subs r0, 0x1
	cmp r0, r2
	bge _080F9506
_080F950E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F94BC

	thumb_func_start sub_80F9514
sub_80F9514: @ 80F9514
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x58
	ldr r0, _080F9638 @ =gUnknown_3005574
	mov r1, sp
	bl sub_80FC6E8
	movs r1, 0
	ldr r0, _080F963C @ =gUnknown_3003ED0
	mov r12, r0
_080F952A:
	movs r4, 0
	lsls r0, r1, 3
	adds r2, r1, 0x1
	mov r8, r2
	lsls r6, r1, 4
	subs r0, r1
	lsls r5, r0, 1
_080F9538:
	lsls r1, r4, 1
	adds r3, r1, r6
	add r3, r12
	adds r1, r5, r1
	adds r0, r1, 0x1
	add r0, sp
	ldrb r2, [r0]
	lsls r2, 8
	mov r7, sp
	adds r0, r7, r1
	ldrb r0, [r0]
	orrs r0, r2
	strh r0, [r3]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _080F9538
	mov r1, r8
	lsls r0, r1, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080F952A
	movs r0, 0
	bl sub_80F9868
	ldr r0, _080F9640 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	bne _080F95E4
	ldr r0, _080F9644 @ =gUnknown_3005450
	ldr r2, _080F9648 @ =0x0000099c
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F95E4
	ldr r0, _080F964C @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	orrs r0, r1
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080F95B0
	cmp r0, 0x6
	beq _080F95B0
	cmp r0, 0x9
	beq _080F95B0
	movs r1, 0x90
	lsls r1, 8
	movs r0, 0x2
	bl sub_80FB9E4
_080F95B0:
	bl rfu_clearAllSlot
	ldr r1, _080F9650 @ =gUnknown_3003F64
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080F9644 @ =gUnknown_3005450
	movs r5, 0
	str r5, [r0]
	ldr r7, _080F9648 @ =0x0000099c
	adds r6, r0, r7
	ldrb r0, [r6]
	cmp r0, 0x1
	bne _080F95DC
	movs r4, 0x90
	lsls r4, 8
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
	adds r0, r4, 0
	bl sub_80FB0E8
_080F95DC:
	ldr r0, _080F9640 @ =gUnknown_3005E10
	strb r5, [r0, 0x5]
	strb r5, [r0, 0x4]
	strb r5, [r6]
_080F95E4:
	ldr r6, _080F9644 @ =gUnknown_3005450
	ldr r0, _080F9654 @ =0x00000988
	adds r2, r6, r0
	ldrb r0, [r2]
	cmp r0, 0
	beq _080F9628
	ldrb r0, [r2]
	subs r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	bl sub_80FA510
	ldr r5, _080F9658 @ =gUnknown_3003F50
	add r4, sp, 0x48
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80F94BC
	movs r1, 0xD4
	lsls r1, 3
	adds r0, r6, r1
	adds r1, r4, 0
	bl sub_80FC63C
	movs r1, 0
	movs r2, 0
_080F9618:
	lsls r0, r1, 1
	adds r0, r5
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _080F9618
_080F9628:
	bl sub_80F90DC
	add sp, 0x58
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F9638: .4byte gUnknown_3005574
_080F963C: .4byte gUnknown_3003ED0
_080F9640: .4byte gUnknown_3005E10
_080F9644: .4byte gUnknown_3005450
_080F9648: .4byte 0x0000099c
_080F964C: .4byte gUnknown_3007460
_080F9650: .4byte gUnknown_3003F64
_080F9654: .4byte 0x00000988
_080F9658: .4byte gUnknown_3003F50
	thumb_func_end sub_80F9514

	thumb_func_start sub_80F965C
sub_80F965C: @ 80F965C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080F9708 @ =gUnknown_3005450
	ldr r2, [r0, 0x70]
	mov r10, r2
	movs r5, 0
	adds r2, r0, 0
	adds r2, 0x6E
	ldrh r3, [r2]
	cmp r5, r3
	bge _080F96F8
	mov r9, r0
	ldr r0, _080F970C @ =gUnknown_3002008
	mov r8, r0
_080F967E:
	movs r0, 0x1
	ands r0, r1
	lsrs r7, r1, 1
	adds r6, r5, 0x1
	cmp r0, 0
	bne _080F96EC
	ldr r1, _080F9710 @ =0xffff8900
	adds r0, r1, 0
	adds r1, r5, 0
	orrs r1, r0
	mov r2, r8
	strh r1, [r2]
	movs r4, 0
	lsls r0, r5, 1
	ldr r3, _080F9714 @ =gUnknown_3001FF8
	mov r12, r3
	adds r0, r5
	lsls r0, 2
	mov r1, r10
	adds r2, r0, r1
	mov r3, r8
	adds r3, 0x2
_080F96AA:
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	ldrb r0, [r2]
	orrs r0, r1
	strh r0, [r3]
	adds r2, 0x2
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x6
	ble _080F96AA
	movs r4, 0
	ldr r2, _080F970C @ =gUnknown_3002008
	ldr r1, _080F9714 @ =gUnknown_3001FF8
_080F96C4:
	ldrh r0, [r2]
	lsrs r0, 8
	strb r0, [r1, 0x1]
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x6
	ble _080F96C4
	ldr r0, _080F9718 @ =gUnknown_3005AF0
	mov r1, r12
	bl sub_80FC63C
	movs r1, 0x1
	lsls r1, r5
	mov r2, r9
	ldr r0, [r2, 0x78]
	orrs r0, r1
	str r0, [r2, 0x78]
_080F96EC:
	adds r1, r7, 0
	adds r5, r6, 0
	ldr r3, _080F971C @ =gUnknown_30054BE
	ldrh r3, [r3]
	cmp r5, r3
	blt _080F967E
_080F96F8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9708: .4byte gUnknown_3005450
_080F970C: .4byte gUnknown_3002008
_080F9710: .4byte 0xffff8900
_080F9714: .4byte gUnknown_3001FF8
_080F9718: .4byte gUnknown_3005AF0
_080F971C: .4byte gUnknown_30054BE
	thumb_func_end sub_80F965C

	thumb_func_start sub_80F9720
sub_80F9720: @ 80F9720
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F973C @ =gUnknown_3005450
	ldrb r2, [r0, 0xC]
	cmp r2, 0x1
	bne _080F9740
	cmp r1, 0
	beq _080F9740
	adds r0, 0x61
	adds r0, r1, r0
	strb r2, [r0]
	b _080F9748
	.align 2, 0
_080F973C: .4byte gUnknown_3005450
_080F9740:
	adds r0, 0x5C
	adds r0, r1, r0
	movs r1, 0x1
	strb r1, [r0]
_080F9748:
	pop {r0}
	bx r0
	thumb_func_end sub_80F9720

	thumb_func_start sub_80F974C
sub_80F974C: @ 80F974C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080F976C @ =gUnknown_3005450
	adds r1, r3, 0
	adds r1, 0x5C
	adds r1, r0, r1
	movs r2, 0
	strb r2, [r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	adds r1, 0x92
	strb r2, [r1]
	bx lr
	.align 2, 0
_080F976C: .4byte gUnknown_3005450
	thumb_func_end sub_80F974C

	thumb_func_start sub_80F9770
sub_80F9770: @ 80F9770
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _080F9784 @ =gUnknown_3005450
	ldrb r1, [r0, 0xC]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080F9788
	movs r0, 0
	b _080F97AA
	.align 2, 0
_080F9784: .4byte gUnknown_3005450
_080F9788:
	movs r2, 0
	ldr r0, _080F97B0 @ =0x00000996
	adds r4, r5, r0
_080F978E:
	adds r1, r2, r4
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080F978E
	ldr r1, _080F97B4 @ =0x000008f6
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r0, r3
	ldrb r0, [r0]
_080F97AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F97B0: .4byte 0x00000996
_080F97B4: .4byte 0x000008f6
	thumb_func_end sub_80F9770

	thumb_func_start rfu_func_080F97B8
rfu_func_080F97B8: @ 80F97B8
	push {lr}
	ldr r0, _080F97F0 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F97EA
	ldr r3, _080F97F4 @ =gUnknown_3005028
	ldrh r2, [r3]
	cmp r2, 0
	beq _080F97EA
	ldr r0, _080F97F8 @ =gLinkTransferringData
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080F97EA
	ldr r1, _080F97FC @ =gUnknown_3001188
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, 8
	orrs r0, r2
	strh r0, [r3]
	movs r0, 0xBE
	lsls r0, 8
	bl sub_80F9D04
_080F97EA:
	pop {r0}
	bx r0
	.align 2, 0
_080F97F0: .4byte gUnknown_3003F64
_080F97F4: .4byte gUnknown_3005028
_080F97F8: .4byte gLinkTransferringData
_080F97FC: .4byte gUnknown_3001188
	thumb_func_end rfu_func_080F97B8

	thumb_func_start sub_80F9800
sub_80F9800: @ 80F9800
	ldr r0, _080F9804 @ =gUnknown_3005440
	bx lr
	.align 2, 0
_080F9804: .4byte gUnknown_3005440
	thumb_func_end sub_80F9800

	thumb_func_start sub_80F9808
sub_80F9808: @ 80F9808
	push {lr}
	movs r2, 0
	ldr r0, _080F9820 @ =gUnknown_3005450
	ldr r1, [r0]
	ldr r0, _080F9824 @ =rfu_func_080F97B8
	cmp r1, r0
	bne _080F9818
	movs r2, 0x1
_080F9818:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_080F9820: .4byte gUnknown_3005450
_080F9824: .4byte rfu_func_080F97B8
	thumb_func_end sub_80F9808

	thumb_func_start sub_80F9828
sub_80F9828: @ 80F9828
	push {r4,lr}
	ldr r4, _080F9848 @ =gUnknown_3005450
	ldr r0, [r4]
	cmp r0, 0
	beq _080F983E
	ldr r0, _080F984C @ =gUnknown_843ED94	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu.c"
	ldr r1, _080F9850 @ =0x000005c1
	ldr r2, _080F9854 @ =gUnknown_843EDC4	"Rfu.RfuFunc == NULL"
	movs r3, 0x1
	bl AGBAssert
_080F983E:
	ldr r0, _080F9858 @ =rfu_func_080F97B8
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9848: .4byte gUnknown_3005450
_080F984C: .4byte gUnknown_843ED94
_080F9850: .4byte 0x000005c1
_080F9854: .4byte gUnknown_843EDC4
_080F9858: .4byte rfu_func_080F97B8
	thumb_func_end sub_80F9828

	thumb_func_start sub_80F985C
sub_80F985C: @ 80F985C
	ldr r1, _080F9864 @ =gUnknown_3005450
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080F9864: .4byte gUnknown_3005450
	thumb_func_end sub_80F985C

	thumb_func_start sub_80F9868
sub_80F9868: @ 80F9868
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r8, r0
_080F9876:
	mov r1, r8
	lsls r5, r1, 4
	ldr r2, _080F98B4 @ =gUnknown_3003ED0
	adds r0, r5, r2
	ldrh r7, [r0]
	movs r3, 0xFF
	lsls r3, 8
	adds r0, r3, 0
	adds r1, r0, 0
	ands r1, r7
	movs r0, 0x88
	lsls r0, 8
	adds r2, r5, 0
	cmp r1, r0
	beq _080F9954
	cmp r1, r0
	bgt _080F98CA
	movs r0, 0xCC
	lsls r0, 7
	cmp r1, r0
	bne _080F98A2
	b _080F9AD0
_080F98A2:
	cmp r1, r0
	bgt _080F98B8
	movs r0, 0xBE
	lsls r0, 7
	cmp r1, r0
	bne _080F98B0
	b _080F9AC0
_080F98B0:
	b _080F9BF4
	.align 2, 0
_080F98B4: .4byte gUnknown_3003ED0
_080F98B8:
	movs r0, 0xEE
	lsls r0, 7
	cmp r1, r0
	beq _080F9914
	movs r0, 0xF0
	lsls r0, 7
	cmp r1, r0
	beq _080F9902
	b _080F9BF4
_080F98CA:
	movs r0, 0xBE
	lsls r0, 8
	cmp r1, r0
	bne _080F98D4
	b _080F9BE4
_080F98D4:
	cmp r1, r0
	bgt _080F98EC
	movs r0, 0x89
	lsls r0, 8
	cmp r1, r0
	beq _080F99B8
	movs r0, 0xA1
	lsls r0, 8
	cmp r1, r0
	bne _080F98EA
	b _080F9A9C
_080F98EA:
	b _080F9BF4
_080F98EC:
	movs r0, 0xED
	lsls r0, 8
	cmp r1, r0
	bne _080F98F6
	b _080F9B00
_080F98F6:
	movs r0, 0xEE
	lsls r0, 8
	cmp r1, r0
	bne _080F9900
	b _080F9BA0
_080F9900:
	b _080F9BF4
_080F9902:
	ldr r4, _080F993C @ =gUnknown_3005450
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	bne _080F9914
	ldr r0, _080F9940 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F9914
	b _080F9C40
_080F9914:
	ldr r0, _080F9944 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	mov r6, r8
	adds r6, 0x1
	cmp r0, 0
	beq _080F9924
	b _080F9BF8
_080F9924:
	ldr r1, _080F9948 @ =gUnknown_3003ED2
	adds r0, r2, r1
	ldrh r0, [r0]
	ldr r3, _080F993C @ =gUnknown_3005450
	strb r0, [r3, 0xD]
	ldr r4, _080F994C @ =gUnknown_3003ED4
	adds r0, r2, r4
	bl sub_80F9770
	ldr r1, _080F9950 @ =gUnknown_3005DD6
	strb r0, [r1]
	b _080F9BF8
	.align 2, 0
_080F993C: .4byte gUnknown_3005450
_080F9940: .4byte gUnknown_3003F64
_080F9944: .4byte gUnknown_3007460
_080F9948: .4byte gUnknown_3003ED2
_080F994C: .4byte gUnknown_3003ED4
_080F9950: .4byte gUnknown_3005DD6
_080F9954:
	ldr r2, _080F99AC @ =gUnknown_3005450
	mov r9, r2
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r7, r0, 2
	adds r3, r7, r2
	movs r4, 0x92
	adds r4, r3
	mov r12, r4
	ldrb r4, [r4]
	mov r6, r8
	adds r6, 0x1
	cmp r4, 0
	beq _080F9974
	b _080F9BF8
_080F9974:
	adds r0, r3, 0
	adds r0, 0x80
	movs r2, 0
	strh r4, [r0]
	ldr r1, _080F99B0 @ =gUnknown_3003ED2
	adds r0, r5, r1
	ldrh r0, [r0]
	adds r1, r3, 0
	adds r1, 0x82
	strh r0, [r1]
	ldr r1, _080F99B4 @ =gUnknown_3003ED4
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r0, r3, 0
	adds r0, 0x91
	strb r1, [r0]
	mov r0, r9
	adds r0, 0x88
	adds r0, r7, r0
	str r4, [r0]
	movs r0, 0x1
	mov r3, r12
	strb r0, [r3]
	mov r0, r9
	adds r0, 0x5C
	add r0, r8
	strb r2, [r0]
	b _080F9BF8
	.align 2, 0
_080F99AC: .4byte gUnknown_3005450
_080F99B0: .4byte gUnknown_3003ED2
_080F99B4: .4byte gUnknown_3003ED4
_080F99B8:
	ldr r4, _080F9A88 @ =gUnknown_3005450
	mov r9, r4
	mov r0, r8
	lsls r1, r0, 2
	adds r0, r1, r0
	lsls r4, r0, 2
	mov r3, r9
	adds r2, r4, r3
	adds r0, r2, 0
	adds r0, 0x92
	ldrb r3, [r0]
	mov r10, r1
	mov r6, r8
	adds r6, 0x1
	cmp r3, 0x1
	beq _080F99DA
	b _080F9BF8
_080F99DA:
	movs r0, 0xFF
	ands r0, r7
	adds r2, 0x80
	strh r0, [r2]
	mov r1, r9
	adds r1, 0x88
	adds r1, r4, r1
	lsls r3, r0
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
	movs r4, 0
	ldr r0, _080F9A8C @ =gUnknown_2022118
	mov r9, r0
	mov r12, r2
	mov r1, r8
	lsls r7, r1, 8
	adds r3, r5, 0
_080F99FE:
	mov r2, r12
	ldrh r0, [r2]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, r4
	lsls r1, 1
	adds r1, r7
	add r1, r9
	adds r2, r4, 0x1
	lsls r0, r2, 1
	adds r0, r3
	ldr r4, _080F9A90 @ =gUnknown_3003ED0
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 16
	lsrs r4, r2, 16
	cmp r4, 0x5
	bls _080F99FE
	ldr r4, _080F9A88 @ =gUnknown_3005450
	mov r0, r10
	add r0, r8
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x88
	adds r1, r0, r1
	adds r2, r0, r4
	adds r0, r2, 0
	adds r0, 0x82
	ldrh r0, [r0]
	lsls r0, 2
	ldr r3, _080F9A94 @ =gUnknown_843EBD4
	adds r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	beq _080F9A4C
	b _080F9BF8
_080F9A4C:
	adds r1, r2, 0
	adds r1, 0x92
	movs r0, 0x2
	strb r0, [r1]
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_80F9720
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	beq _080F9A6E
	b _080F9BF8
_080F9A6E:
	ldr r0, _080F9A98 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F9A78
	b _080F9BF8
_080F9A78:
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	beq _080F9A80
	b _080F9BF8
_080F9A80:
	ldr r0, _080F9A8C @ =gUnknown_2022118
	bl sub_80FAA58
	b _080F9BF8
	.align 2, 0
_080F9A88: .4byte gUnknown_3005450
_080F9A8C: .4byte gUnknown_2022118
_080F9A90: .4byte gUnknown_3003ED0
_080F9A94: .4byte gUnknown_843EBD4
_080F9A98: .4byte gUnknown_3003F64
_080F9A9C:
	ldr r2, _080F9AB8 @ =gUnknown_843EC64
	ldr r3, _080F9ABC @ =gUnknown_3003ED2
	adds r0, r5, r3
	ldrh r1, [r0]
	lsls r1, 3
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, 0x4
	adds r1, r2
	ldrh r1, [r1]
	bl sub_80F9E60
	b _080F9BF4
	.align 2, 0
_080F9AB8: .4byte gUnknown_843EC64
_080F9ABC: .4byte gUnknown_3003ED2
_080F9AC0:
	ldr r1, _080F9ACC @ =gUnknown_3005534
	add r1, r8
	movs r0, 0x1
	strb r0, [r1]
	b _080F9BF4
	.align 2, 0
_080F9ACC: .4byte gUnknown_3005534
_080F9AD0:
	ldr r2, _080F9AF8 @ =gUnknown_3005450
	movs r4, 0x80
	lsls r4, 1
	adds r0, r2, r4
	ldr r3, _080F9AFC @ =gUnknown_3003ED2
	adds r1, r5, r3
	ldrh r0, [r0]
	mov r6, r8
	adds r6, 0x1
	ldrh r1, [r1]
	cmp r0, r1
	beq _080F9AEA
	b _080F9BF8
_080F9AEA:
	adds r0, r2, 0
	adds r0, 0xE9
	add r0, r8
	movs r1, 0x1
	strb r1, [r0]
	b _080F9BF8
	.align 2, 0
_080F9AF8: .4byte gUnknown_3005450
_080F9AFC: .4byte gUnknown_3003ED2
_080F9B00:
	ldr r7, _080F9B4C @ =gUnknown_3005450
	ldrb r2, [r7, 0xC]
	cmp r2, 0
	bne _080F9B68
	ldr r3, _080F9B50 @ =gUnknown_3003F64
	ldrb r0, [r3]
	mov r6, r8
	adds r6, 0x1
	cmp r0, 0
	beq _080F9BF8
	ldr r0, _080F9B54 @ =gUnknown_3003ED2
	adds r4, r5, r0
	ldrh r1, [r4]
	ldr r0, _080F9B58 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	ands r1, r0
	cmp r1, 0
	beq _080F9B38
	strb r2, [r3]
	bl sub_80FEB14
	ldr r1, _080F9B5C @ =gUnknown_3003ED4
	adds r0, r5, r1
	ldrh r1, [r0]
	ldr r2, _080F9B60 @ =0x0000099c
	adds r0, r7, r2
	strb r1, [r0]
_080F9B38:
	ldr r0, _080F9B64 @ =gUnknown_3003ED0
	adds r0, 0x6
	adds r0, r5, r0
	ldrh r0, [r0]
	strb r0, [r7, 0xD]
	ldrh r0, [r4]
	bl sub_80FA9D0
	b _080F9BF8
	.align 2, 0
_080F9B4C: .4byte gUnknown_3005450
_080F9B50: .4byte gUnknown_3003F64
_080F9B54: .4byte gUnknown_3003ED2
_080F9B58: .4byte gUnknown_3007460
_080F9B5C: .4byte gUnknown_3003ED4
_080F9B60: .4byte 0x0000099c
_080F9B64: .4byte gUnknown_3003ED0
_080F9B68:
	movs r0, 0xEE
	lsls r0, 8
	bl sub_80F9D04
	ldr r1, _080F9B90 @ =gUnknown_3003F50
	ldr r3, _080F9B94 @ =gUnknown_3003ED2
	adds r0, r5, r3
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	ldr r4, _080F9B98 @ =gUnknown_3003ED4
	adds r0, r5, r4
	ldrh r0, [r0]
	strh r0, [r1, 0x4]
	ldr r0, _080F9B9C @ =gUnknown_3003ED0
	adds r0, 0x6
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r1, 0x6]
	b _080F9BF4
	.align 2, 0
_080F9B90: .4byte gUnknown_3003F50
_080F9B94: .4byte gUnknown_3003ED2
_080F9B98: .4byte gUnknown_3003ED4
_080F9B9C: .4byte gUnknown_3003ED0
_080F9BA0:
	ldr r4, _080F9BD0 @ =gUnknown_3005450
	ldrb r0, [r4, 0xC]
	mov r6, r8
	adds r6, 0x1
	cmp r0, 0x1
	bne _080F9C34
	ldr r0, _080F9BD4 @ =0x0000099b
	adds r2, r4, r0
	ldr r1, _080F9BD8 @ =gUnknown_3003ED2
	adds r3, r5, r1
	ldrb r1, [r3]
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _080F9BDC @ =gUnknown_3003ED4
	adds r0, r5, r2
	ldrh r1, [r0]
	ldr r2, _080F9BE0 @ =0x0000099c
	adds r0, r4, r2
	strb r1, [r0]
	ldrh r0, [r3]
	bl sub_80FA9D0
	b _080F9BF8
	.align 2, 0
_080F9BD0: .4byte gUnknown_3005450
_080F9BD4: .4byte 0x0000099b
_080F9BD8: .4byte gUnknown_3003ED2
_080F9BDC: .4byte gUnknown_3003ED4
_080F9BE0: .4byte 0x0000099c
_080F9BE4:
	ldr r0, _080F9C24 @ =gUnknown_3003E60
	mov r3, r8
	lsls r1, r3, 1
	adds r1, r0
	ldr r4, _080F9C28 @ =gUnknown_3003ED2
	adds r0, r5, r4
	ldrh r0, [r0]
	strh r0, [r1]
_080F9BF4:
	mov r6, r8
	adds r6, 0x1
_080F9BF8:
	ldr r3, _080F9C2C @ =gUnknown_3005450
	ldrb r4, [r3, 0xC]
	cmp r4, 0x1
	bne _080F9C34
	adds r0, r3, 0
	adds r0, 0x61
	mov r1, r8
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r1, r0, 0
	cmp r1, 0
	beq _080F9C34
	cmp r1, 0x4
	bne _080F9C30
	adds r0, r3, 0
	adds r0, 0x5C
	add r0, r8
	movs r1, 0
	strb r4, [r0]
	strb r1, [r2]
	b _080F9C34
	.align 2, 0
_080F9C24: .4byte gUnknown_3003E60
_080F9C28: .4byte gUnknown_3003ED2
_080F9C2C: .4byte gUnknown_3005450
_080F9C30:
	adds r0, 0x1
	strb r0, [r2]
_080F9C34:
	lsls r0, r6, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0x4
	bhi _080F9C40
	b _080F9876
_080F9C40:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F9868

	thumb_func_start sub_80F9C50
sub_80F9C50: @ 80F9C50
	push {lr}
	movs r2, 0
	ldr r0, _080F9C64 @ =gUnknown_3005450
	adds r1, r0, 0
	adds r1, 0x92
_080F9C5A:
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F9C68
	movs r0, 0
	b _080F9C72
	.align 2, 0
_080F9C64: .4byte gUnknown_3005450
_080F9C68:
	adds r1, 0x14
	adds r2, 0x1
	cmp r2, 0x4
	ble _080F9C5A
	movs r0, 0x1
_080F9C72:
	pop {r1}
	bx r1
	thumb_func_end sub_80F9C50

	thumb_func_start sub_80F9C78
sub_80F9C78: @ 80F9C78
	push {r4,lr}
	movs r1, 0
	ldr r2, _080F9CA0 @ =gUnknown_3005450
	ldrb r0, [r2, 0xD]
	cmp r1, r0
	bge _080F9CAC
	adds r4, r0, 0
	adds r3, r2, 0
	adds r3, 0x92
	adds r2, 0x5C
_080F9C8C:
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _080F9C9A
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080F9CA4
_080F9C9A:
	movs r0, 0
	b _080F9CAE
	.align 2, 0
_080F9CA0: .4byte gUnknown_3005450
_080F9CA4:
	adds r3, 0x14
	adds r1, 0x1
	cmp r1, r4
	blt _080F9C8C
_080F9CAC:
	movs r0, 0x1
_080F9CAE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F9C78

	thumb_func_start sub_80F9CB4
sub_80F9CB4: @ 80F9CB4
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	strh r1, [r0, 0x2]
	str r1, [r0, 0x4]
	str r1, [r0, 0x8]
	strb r2, [r0, 0x10]
	strb r2, [r0, 0x11]
	strb r2, [r0, 0x12]
	bx lr
	thumb_func_end sub_80F9CB4

	thumb_func_start sub_80F9CC8
sub_80F9CC8: @ 80F9CC8
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r0, _080F9D00 @ =gUnknown_3005450
	adds r3, r0, 0
	adds r3, 0x92
	adds r4, r0, 0
	adds r4, 0x5C
_080F9CD8:
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _080F9CEE
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F9CEE
	lsls r0, r1
	orrs r2, r0
	lsls r0, r2, 24
	lsrs r2, r0, 24
_080F9CEE:
	adds r3, 0x14
	adds r1, 0x1
	cmp r1, 0x4
	ble _080F9CD8
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F9D00: .4byte gUnknown_3005450
	thumb_func_end sub_80F9CC8

	thumb_func_start sub_80F9D04
sub_80F9D04: @ 80F9D04
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r5, _080F9D34 @ =gUnknown_3003F50
	strh r1, [r5]
	movs r0, 0xF0
	lsls r0, 7
	adds r4, r5, 0
	cmp r1, r0
	beq _080F9D98
	cmp r1, r0
	bgt _080F9D4A
	movs r0, 0xBE
	lsls r0, 7
	cmp r1, r0
	beq _080F9DE8
	cmp r1, r0
	bgt _080F9D38
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	beq _080F9DFC
	b _080F9E22
	.align 2, 0
_080F9D34: .4byte gUnknown_3003F50
_080F9D38:
	movs r0, 0xCC
	lsls r0, 7
	cmp r1, r0
	beq _080F9DE8
	movs r0, 0xEE
	lsls r0, 7
	cmp r1, r0
	beq _080F9D98
	b _080F9E22
_080F9D4A:
	movs r0, 0xBE
	lsls r0, 8
	cmp r1, r0
	beq _080F9E1C
	cmp r1, r0
	bgt _080F9E22
	movs r0, 0x88
	lsls r0, 8
	cmp r1, r0
	beq _080F9D68
	movs r0, 0xA1
	lsls r0, 8
	cmp r1, r0
	beq _080F9D80
	b _080F9E22
_080F9D68:
	ldr r0, _080F9D7C @ =gUnknown_3005450
	adds r1, r0, 0
	adds r1, 0x6E
	ldrh r1, [r1]
	strh r1, [r5, 0x2]
	adds r0, 0x7D
	ldrb r0, [r0]
	adds r0, 0x80
	strh r0, [r5, 0x4]
	b _080F9E22
	.align 2, 0
_080F9D7C: .4byte gUnknown_3005450
_080F9D80:
	bl sub_80F9C50
	lsls r0, 24
	cmp r0, 0
	beq _080F9E22
	ldr r0, _080F9D94 @ =gUnknown_3005450
	adds r0, 0x5A
	ldrb r0, [r0]
	b _080F9E20
	.align 2, 0
_080F9D94: .4byte gUnknown_3005450
_080F9D98:
	ldr r3, _080F9DD4 @ =gUnknown_3005450
	ldr r1, _080F9DD8 @ =0x0000099a
	adds r0, r3, r1
	ldr r2, _080F9DDC @ =0x0000099b
	adds r1, r3, r2
	ldrb r2, [r0]
	ldrb r0, [r1]
	eors r0, r2
	ldr r1, _080F9DE0 @ =gUnknown_843EC41
	adds r0, r1
	ldrb r0, [r0]
	adds r0, 0x1
	strb r0, [r3, 0xD]
	ldrb r0, [r3, 0xD]
	strh r0, [r4, 0x2]
	adds r2, r4, 0x4
	movs r4, 0
	ldr r0, _080F9DE4 @ =0x00000996
	adds r3, r0
_080F9DBE:
	adds r1, r2, r4
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080F9DBE
	b _080F9E22
	.align 2, 0
_080F9DD4: .4byte gUnknown_3005450
_080F9DD8: .4byte 0x0000099a
_080F9DDC: .4byte 0x0000099b
_080F9DE0: .4byte gUnknown_843EC41
_080F9DE4: .4byte 0x00000996
_080F9DE8:
	ldr r0, _080F9DF8 @ =gUnknown_3005450
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	b _080F9E22
	.align 2, 0
_080F9DF8: .4byte gUnknown_3005450
_080F9DFC:
	movs r4, 0
	ldr r3, _080F9E18 @ =gUnknown_3005542
_080F9E00:
	adds r2, r4, 0x1
	lsls r1, r2, 1
	adds r1, r5
	lsls r0, r4, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0x5
	bls _080F9E00
	b _080F9E22
	.align 2, 0
_080F9E18: .4byte gUnknown_3005542
_080F9E1C:
	ldr r0, _080F9E28 @ =gUnknown_3005028
	ldrh r0, [r0]
_080F9E20:
	strh r0, [r5, 0x2]
_080F9E22:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9E28: .4byte gUnknown_3005028
	thumb_func_end sub_80F9D04

	thumb_func_start sub_80F9E2C
sub_80F9E2C: @ 80F9E2C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080F9E58 @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	bne _080F9E52
	bl sub_80FBA00
	cmp r0, 0
	bne _080F9E52
	ldr r0, _080F9E5C @ =gUnknown_3005542
	adds r1, r4, 0
	movs r2, 0xC
	bl memcpy
	movs r0, 0xBC
	lsls r0, 6
	bl sub_80F9D04
_080F9E52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9E58: .4byte gUnknown_3003F50
_080F9E5C: .4byte gUnknown_3005542
	thumb_func_end sub_80F9E2C

	thumb_func_start sub_80F9E60
sub_80F9E60: @ 80F9E60
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	adds r6, r1, 0
	cmp r6, 0xFC
	bls _080F9E7C
	ldr r0, _080F9EA8 @ =gUnknown_843ED94	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu.c"
	ldr r1, _080F9EAC @ =0x00000701
	ldr r2, _080F9EB0 @ =gUnknown_843EDD8	"size<=252"
	movs r3, 0x1
	bl AGBAssert
_080F9E7C:
	ldr r5, _080F9EB4 @ =gUnknown_3005450
	ldr r0, [r5]
	cmp r0, 0
	bne _080F9EA4
	ldr r0, _080F9EB8 @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	bne _080F9EA4
	movs r0, 0x7C
	adds r0, r5
	mov r9, r0
	ldrb r1, [r0]
	mov r8, r1
	cmp r1, 0
	beq _080F9EC0
	ldr r1, _080F9EBC @ =gUnknown_203AC08
	adds r1, 0x83
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F9EA4:
	movs r0, 0
	b _080F9F2A
	.align 2, 0
_080F9EA8: .4byte gUnknown_843ED94
_080F9EAC: .4byte 0x00000701
_080F9EB0: .4byte gUnknown_843EDD8
_080F9EB4: .4byte gUnknown_3005450
_080F9EB8: .4byte gUnknown_3003F50
_080F9EBC: .4byte gUnknown_203AC08
_080F9EC0:
	adds r0, r6, 0
	movs r1, 0xC
	bl __umodsi3
	negs r4, r0
	orrs r4, r0
	lsrs r4, 31
	bl GetMultiplayerId
	adds r1, r5, 0
	adds r1, 0x7D
	strb r0, [r1]
	movs r0, 0x1
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0xC
	bl __udivsi3
	adds r0, r4
	adds r1, r5, 0
	adds r1, 0x6E
	strh r0, [r1]
	adds r0, r5, 0
	adds r0, 0x6C
	mov r1, r8
	strh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	cmp r6, r0
	bls _080F9F02
	str r7, [r5, 0x70]
	b _080F9F14
_080F9F02:
	ldr r4, _080F9F38 @ =gUnknown_2022618
	cmp r7, r4
	beq _080F9F12
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl memcpy
_080F9F12:
	str r4, [r5, 0x70]
_080F9F14:
	movs r0, 0x88
	lsls r0, 8
	bl sub_80F9D04
	ldr r0, _080F9F3C @ =gUnknown_3005450
	ldr r1, _080F9F40 @ =rfufunc_80F9F44
	str r1, [r0]
	adds r0, 0x5B
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
_080F9F2A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F9F38: .4byte gUnknown_2022618
_080F9F3C: .4byte gUnknown_3005450
_080F9F40: .4byte rfufunc_80F9F44
	thumb_func_end sub_80F9E60

	thumb_func_start rfufunc_80F9F44
rfufunc_80F9F44: @ 80F9F44
	push {r4,r5,lr}
	ldr r0, _080F9F74 @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	bne _080F9F98
	movs r5, 0x88
	lsls r5, 8
	adds r0, r5, 0
	bl sub_80F9D04
	ldr r4, _080F9F78 @ =gUnknown_3005450
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	bne _080F9F7C
	adds r1, r4, 0
	adds r1, 0x5B
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _080F9F98
	b _080F9F94
	.align 2, 0
_080F9F74: .4byte gUnknown_3003F50
_080F9F78: .4byte gUnknown_3005450
_080F9F7C:
	bl GetMultiplayerId
	ldr r1, _080F9FA0 @ =gUnknown_3003ED0
	lsls r0, 24
	lsrs r0, 20
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, r5
	bne _080F9F98
_080F9F94:
	ldr r0, _080F9FA4 @ =sub_80F9FA8
	str r0, [r4]
_080F9F98:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9FA0: .4byte gUnknown_3003ED0
_080F9FA4: .4byte sub_80F9FA8
	thumb_func_end rfufunc_80F9F44

	thumb_func_start sub_80F9FA8
sub_80F9FA8: @ 80F9FA8
	push {r4-r6,lr}
	ldr r0, _080FA014 @ =gUnknown_3005450
	mov r12, r0
	ldr r5, [r0, 0x70]
	ldr r3, _080FA018 @ =gUnknown_3003F50
	mov r2, r12
	adds r2, 0x6C
	ldrh r1, [r2]
	movs r4, 0x89
	lsls r4, 8
	adds r0, r4, 0
	orrs r0, r1
	strh r0, [r3]
	movs r4, 0
	adds r6, r2, 0
	adds r3, 0x2
_080F9FC8:
	lsls r2, r4, 1
	ldrh r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r3]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x6
	ble _080F9FC8
	mov r0, r12
	adds r0, 0x6C
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	adds r0, 0x2
	ldrh r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	cmp r0, r1
	bhi _080FA00C
	mov r0, r12
	adds r0, 0x7C
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080FA01C @ =rfufunc_80FA020
	mov r1, r12
	str r0, [r1]
_080FA00C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FA014: .4byte gUnknown_3005450
_080FA018: .4byte gUnknown_3003F50
_080FA01C: .4byte rfufunc_80FA020
	thumb_func_end sub_80F9FA8

	thumb_func_start rfufunc_80FA020
rfufunc_80FA020: @ 80FA020
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, _080FA0C8 @ =gUnknown_3005450
	ldr r0, [r5, 0x70]
	mov r8, r0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _080FA0E8
	ldr r3, _080FA0CC @ =gUnknown_3003F50
	adds r2, r5, 0
	adds r2, 0x6E
	ldrh r0, [r2]
	subs r0, 0x1
	ldr r4, _080FA0D0 @ =0xffff8900
	adds r1, r4, 0
	orrs r0, r1
	strh r0, [r3]
	movs r4, 0
	mov r9, r5
	ldr r0, _080FA0D4 @ =gUnknown_3003ED0
	mov r12, r0
	lsls r5, r6, 4
	adds r7, r2, 0
	adds r3, 0x2
_080FA05C:
	lsls r2, r4, 1
	ldrh r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	add r0, r8
	adds r1, r0, 0
	subs r1, 0xB
	ldrb r1, [r1]
	lsls r1, 8
	subs r0, 0xC
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r3]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x6
	ble _080FA05C
	mov r1, r12
	adds r0, r5, r1
	ldrb r1, [r0]
	mov r3, r9
	adds r0, r3, 0
	adds r0, 0x6E
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _080FA0EC
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x88
	adds r1, r0, r1
	ldr r2, _080FA0D8 @ =gUnknown_843EBD4
	adds r0, r3
	adds r0, 0x82
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	beq _080FA0E0
	adds r0, r6, 0
	bl sub_80F965C
	ldr r1, _080FA0DC @ =gUnknown_203AC08
	adds r1, 0x64
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080FA0EC
	.align 2, 0
_080FA0C8: .4byte gUnknown_3005450
_080FA0CC: .4byte gUnknown_3003F50
_080FA0D0: .4byte 0xffff8900
_080FA0D4: .4byte gUnknown_3003ED0
_080FA0D8: .4byte gUnknown_843EBD4
_080FA0DC: .4byte gUnknown_203AC08
_080FA0E0:
	movs r0, 0
	mov r4, r9
	str r0, [r4]
	b _080FA0EC
_080FA0E8:
	movs r0, 0
	str r0, [r5]
_080FA0EC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end rfufunc_80FA020

	thumb_func_start sub_80FA0F8
sub_80FA0F8: @ 80FA0F8
	push {lr}
	ldr r1, _080FA110 @ =gUnknown_3005450
	adds r1, 0x5A
	strb r0, [r1]
	movs r0, 0xA1
	lsls r0, 8
	bl sub_80F9D04
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080FA110: .4byte gUnknown_3005450
	thumb_func_end sub_80FA0F8

	thumb_func_start sub_80FA114
sub_80FA114: @ 80FA114
	push {lr}
	bl rfu_clearAllSlot
	bl sub_80FD52C
	ldr r1, _080FA138 @ =gUnknown_3003F64
	movs r0, 0
	strb r0, [r1]
	ldr r2, _080FA13C @ =gUnknown_3005450
	adds r3, r2, 0
	adds r3, 0xEF
	movs r1, 0
	movs r0, 0x1
	strb r0, [r3]
	str r1, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080FA138: .4byte gUnknown_3003F64
_080FA13C: .4byte gUnknown_3005450
	thumb_func_end sub_80FA114

	thumb_func_start sub_80FA140
sub_80FA140: @ 80FA140
	push {lr}
	ldr r0, _080FA15C @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	orrs r0, r1
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	bl sub_80FA114
	pop {r0}
	bx r0
	.align 2, 0
_080FA15C: .4byte gUnknown_3007460
	thumb_func_end sub_80FA140

	thumb_func_start sub_80FA160
sub_80FA160: @ 80FA160
	push {r4,lr}
	ldr r4, _080FA178 @ =gUnknown_3005450
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	bne _080FA180
	bl sub_80FEB14
	ldr r0, _080FA17C @ =0x0000099c
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	b _080FA184
	.align 2, 0
_080FA178: .4byte gUnknown_3005450
_080FA17C: .4byte 0x0000099c
_080FA180:
	ldr r0, _080FA18C @ =sub_80FA140
	str r0, [r4]
_080FA184:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA18C: .4byte sub_80FA140
	thumb_func_end sub_80FA160

	thumb_func_start sub_80FA190
sub_80FA190: @ 80FA190
	push {lr}
	bl sub_80FEB14
	ldr r2, _080FA1B4 @ =gUnknown_3005450
	ldr r0, _080FA1B8 @ =0x0000099c
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080FA1BC @ =gUnknown_3007460
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	ldr r1, _080FA1C0 @ =0x0000099b
	adds r2, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080FA1B4: .4byte gUnknown_3005450
_080FA1B8: .4byte 0x0000099c
_080FA1BC: .4byte gUnknown_3007460
_080FA1C0: .4byte 0x0000099b
	thumb_func_end sub_80FA190

	thumb_func_start sub_80FA1C4
sub_80FA1C4: @ 80FA1C4
	push {r4,r5,lr}
	ldr r0, _080FA208 @ =gUnknown_3005450
	ldrb r5, [r0, 0xD]
	movs r2, 0
	movs r1, 0
	adds r3, r0, 0
	adds r4, r3, 0
	adds r4, 0xE4
_080FA1D4:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FA1DE
	adds r2, 0x1
_080FA1DE:
	adds r1, 0x1
	cmp r1, 0x4
	ble _080FA1D4
	cmp r2, r5
	bne _080FA218
	ldr r2, _080FA20C @ =gBattleTypeFlags
	ldr r0, [r2]
	ldr r1, _080FA210 @ =0x0000ffdf
	ands r0, r1
	str r0, [r2]
	ldrb r0, [r3, 0xC]
	cmp r0, 0
	bne _080FA214
	adds r0, r3, 0
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0x3
	strb r1, [r0]
	bl sub_80FA160
	b _080FA218
	.align 2, 0
_080FA208: .4byte gUnknown_3005450
_080FA20C: .4byte gBattleTypeFlags
_080FA210: .4byte 0x0000ffdf
_080FA214:
	ldr r0, _080FA220 @ =sub_80FA160
	str r0, [r3]
_080FA218:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA220: .4byte sub_80FA160
	thumb_func_end sub_80FA1C4

	thumb_func_start sub_80FA224
sub_80FA224: @ 80FA224
	push {r4,lr}
	ldr r0, _080FA250 @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA248
	ldr r4, _080FA254 @ =gUnknown_3005450
	movs r1, 0x9A
	lsls r1, 4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA248
	movs r0, 0xBE
	lsls r0, 7
	bl sub_80F9D04
	ldr r0, _080FA258 @ =sub_80FA1C4
	str r0, [r4]
_080FA248:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA250: .4byte gUnknown_3003F50
_080FA254: .4byte gUnknown_3005450
_080FA258: .4byte sub_80FA1C4
	thumb_func_end sub_80FA224

	thumb_func_start sub_80FA25C
sub_80FA25C: @ 80FA25C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080FA280 @ =gUnknown_3005450
	ldr r0, [r2]
	cmp r0, 0
	bne _080FA27C
	ldr r1, _080FA284 @ =0x00000991
	adds r0, r2, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _080FA288 @ =sub_80FA224
	str r0, [r2]
	adds r0, r3, 0
	bl DestroyTask
_080FA27C:
	pop {r0}
	bx r0
	.align 2, 0
_080FA280: .4byte gUnknown_3005450
_080FA284: .4byte 0x00000991
_080FA288: .4byte sub_80FA224
	thumb_func_end sub_80FA25C

	thumb_func_start task_add_05_task_del_08FA224_when_no_RfuFunc
task_add_05_task_del_08FA224_when_no_RfuFunc: @ 80FA28C
	push {r4,lr}
	ldr r4, _080FA2AC @ =sub_80FA25C
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080FA2A4
	adds r0, r4, 0
	movs r1, 0x5
	bl CreateTask
_080FA2A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA2AC: .4byte sub_80FA25C
	thumb_func_end task_add_05_task_del_08FA224_when_no_RfuFunc

	thumb_func_start sub_80FA2B0
sub_80FA2B0: @ 80FA2B0
	push {r4,r5,lr}
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _080FA2DE
	ldr r1, _080FA348 @ =gUnknown_3005450
	ldr r2, _080FA34C @ =0x0000069e
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r0, 0
	cmp r4, 0
	bne _080FA2DE
	adds r5, r1, 0
	adds r5, 0xFE
	ldrh r0, [r5]
	cmp r0, 0x3C
	bls _080FA2DE
	movs r0, 0xCC
	lsls r0, 7
	bl sub_80F9D04
	strh r4, [r5]
_080FA2DE:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	cmp r1, r2
	bcs _080FA30A
	ldr r0, _080FA348 @ =gUnknown_3005450
	adds r3, r0, 0
	adds r3, 0xE9
	ldrb r0, [r3]
	cmp r0, 0
	beq _080FA30A
_080FA2F8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _080FA30A
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA2F8
_080FA30A:
	ldr r4, _080FA348 @ =gUnknown_3005450
	cmp r1, r2
	bne _080FA336
	movs r1, 0
	adds r3, r4, 0
	adds r3, 0xE9
	movs r2, 0
_080FA318:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080FA318
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0]
	str r2, [r4]
_080FA336:
	adds r1, r4, 0
	adds r1, 0xFE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA348: .4byte gUnknown_3005450
_080FA34C: .4byte 0x0000069e
	thumb_func_end sub_80FA2B0

	thumb_func_start sub_80FA350
sub_80FA350: @ 80FA350
	push {r4,lr}
	ldr r4, _080FA378 @ =gUnknown_3005450
	ldr r1, _080FA37C @ =0x0000069e
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA372
	ldr r0, _080FA380 @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA372
	movs r0, 0xCC
	lsls r0, 7
	bl sub_80F9D04
	ldr r0, _080FA384 @ =sub_80FA2B0
	str r0, [r4]
_080FA372:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA378: .4byte gUnknown_3005450
_080FA37C: .4byte 0x0000069e
_080FA380: .4byte gUnknown_3003F50
_080FA384: .4byte sub_80FA2B0
	thumb_func_end sub_80FA350

	thumb_func_start sub_80FA388
sub_80FA388: @ 80FA388
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _080FA3C4
	ldr r4, _080FA3B4 @ =gUnknown_3005450
	ldr r1, _080FA3B8 @ =0x0000069e
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA416
	ldr r0, _080FA3BC @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA416
	movs r0, 0xCC
	lsls r0, 7
	bl sub_80F9D04
	ldr r0, _080FA3C0 @ =sub_80FA2B0
	b _080FA414
	.align 2, 0
_080FA3B4: .4byte gUnknown_3005450
_080FA3B8: .4byte 0x0000069e
_080FA3BC: .4byte gUnknown_3003F50
_080FA3C0: .4byte sub_80FA2B0
_080FA3C4:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1
	cmp r1, r2
	bcs _080FA3F2
	ldr r3, _080FA41C @ =gUnknown_3005450
	adds r0, r3, 0
	adds r0, 0xEA
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FA3F2
	adds r3, 0xE9
_080FA3E0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _080FA3F2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA3E0
_080FA3F2:
	cmp r1, r2
	bne _080FA416
	ldr r4, _080FA41C @ =gUnknown_3005450
	ldr r1, _080FA420 @ =0x0000069e
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FA416
	ldr r0, _080FA424 @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA416
	movs r0, 0xCC
	lsls r0, 7
	bl sub_80F9D04
	ldr r0, _080FA428 @ =sub_80FA350
_080FA414:
	str r0, [r4]
_080FA416:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA41C: .4byte gUnknown_3005450
_080FA420: .4byte 0x0000069e
_080FA424: .4byte gUnknown_3003F50
_080FA428: .4byte sub_80FA350
	thumb_func_end sub_80FA388

	thumb_func_start sub_80FA42C
sub_80FA42C: @ 80FA42C
	push {lr}
	ldr r1, _080FA444 @ =gUnknown_3005450
	ldr r2, [r1]
	cmp r2, 0
	bne _080FA440
	ldr r0, _080FA448 @ =sub_80FA388
	str r0, [r1]
	adds r0, r1, 0
	adds r0, 0xFE
	strh r2, [r0]
_080FA440:
	pop {r0}
	bx r0
	.align 2, 0
_080FA444: .4byte gUnknown_3005450
_080FA448: .4byte sub_80FA388
	thumb_func_end sub_80FA42C

	thumb_func_start sub_80FA44C
sub_80FA44C: @ 80FA44C
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, _080FA468 @ =gUnknown_843EC8C
	ldrh r0, [r1]
	cmp r0, r3
	beq _080FA47A
	ldr r4, _080FA46C @ =0x0000ffff
	adds r2, r1, 0
_080FA45C:
	ldrh r0, [r2]
	cmp r0, r4
	bne _080FA470
	movs r0, 0
	b _080FA47C
	.align 2, 0
_080FA468: .4byte gUnknown_843EC8C
_080FA46C: .4byte 0x0000ffff
_080FA470:
	adds r1, 0x2
	adds r2, 0x2
	ldrh r0, [r1]
	cmp r0, r3
	bne _080FA45C
_080FA47A:
	movs r0, 0x1
_080FA47C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA44C

	thumb_func_start sub_80FA484
sub_80FA484: @ 80FA484
	push {lr}
	cmp r0, 0
	beq _080FA498
	movs r1, 0x96
	lsls r1, 2
	movs r0, 0x1
	bl sub_80FEA34
	movs r0, 0
	b _080FA4A4
_080FA498:
	movs r0, 0
	movs r1, 0
	bl sub_80FEA34
	lsls r0, 24
	lsrs r0, 24
_080FA4A4:
	pop {r1}
	bx r1
	thumb_func_end sub_80FA484

	thumb_func_start sub_80FA4A8
sub_80FA4A8: @ 80FA4A8
	push {lr}
	ldr r0, _080FA4C0 @ =gUnknown_3005450
	ldr r1, _080FA4C4 @ =0x00000991
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0
	bl sub_80FD760
	pop {r0}
	bx r0
	.align 2, 0
_080FA4C0: .4byte gUnknown_3005450
_080FA4C4: .4byte 0x00000991
	thumb_func_end sub_80FA4A8

	thumb_func_start rfu_get_multiplayer_id
rfu_get_multiplayer_id: @ 80FA4C8
	push {lr}
	ldr r1, _080FA4DC @ =gUnknown_3005450
	ldrb r0, [r1, 0xC]
	cmp r0, 0x1
	beq _080FA4E4
	ldr r2, _080FA4E0 @ =0x00000986
	adds r0, r1, r2
	ldrb r0, [r0]
	b _080FA4E6
	.align 2, 0
_080FA4DC: .4byte gUnknown_3005450
_080FA4E0: .4byte 0x00000986
_080FA4E4:
	movs r0, 0
_080FA4E6:
	pop {r1}
	bx r1
	thumb_func_end rfu_get_multiplayer_id

	thumb_func_start sub_80FA4EC
sub_80FA4EC: @ 80FA4EC
	ldr r0, _080FA4F4 @ =gUnknown_3005450
	ldrb r0, [r0, 0xD]
	bx lr
	.align 2, 0
_080FA4F4: .4byte gUnknown_3005450
	thumb_func_end sub_80FA4EC

	thumb_func_start sub_80FA4F8
sub_80FA4F8: @ 80FA4F8
	push {lr}
	movs r1, 0
	ldr r0, _080FA50C @ =gUnknown_3005450
	ldr r0, [r0]
	cmp r0, 0
	bne _080FA506
	movs r1, 0x1
_080FA506:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080FA50C: .4byte gUnknown_3005450
	thumb_func_end sub_80FA4F8

	thumb_func_start sub_80FA510
sub_80FA510: @ 80FA510
	push {lr}
	ldr r0, _080FA524 @ =gUnknown_3005450
	ldr r0, [r0]
	cmp r0, 0
	beq _080FA51E
	bl _call_via_r0
_080FA51E:
	pop {r0}
	bx r0
	.align 2, 0
_080FA524: .4byte gUnknown_3005450
	thumb_func_end sub_80FA510

	thumb_func_start sub_80FA528
sub_80FA528: @ 80FA528
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	movs r5, 0
	ldr r6, _080FA594 @ =gUnknown_3005450
	ldr r0, _080FA598 @ =0x000008f6
	adds r0, r6
	mov r8, r0
_080FA53A:
	ldr r1, _080FA59C @ =0x00000989
	adds r0, r6, r1
	adds r4, r5, r0
	ldrb r0, [r4]
	subs r0, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080FA5C2
	ldr r1, _080FA5A0 @ =gUnknown_3007450
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x46
	beq _080FA55E
	cmp r0, 0x48
	bne _080FA5A8
_080FA55E:
	ldr r2, _080FA5A4 @ =0x0000098d
	adds r0, r6, r2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _080FA5C2
	movs r0, 0x9
	strb r0, [r4]
	movs r0, 0xA
	strb r0, [r1]
	lsls r1, r5, 24
	lsrs r1, 24
	movs r0, 0x8
	bl rfu_clearSlot
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r5
	lsrs r0, 24
	movs r1, 0x8
	adds r2, r4, 0
	movs r3, 0x1
	bl rfu_NI_setSendData
	movs r7, 0x1
	b _080FA5C2
	.align 2, 0
_080FA594: .4byte gUnknown_3005450
_080FA598: .4byte 0x000008f6
_080FA59C: .4byte 0x00000989
_080FA5A0: .4byte gUnknown_3007450
_080FA5A4: .4byte 0x0000098d
_080FA5A8:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x47
	bne _080FA5C2
	lsls r1, r5, 24
	lsrs r1, 24
	movs r0, 0x8
	bl rfu_clearSlot
_080FA5C2:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080FA53A
	adds r0, r7, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA528

	thumb_func_start sub_80FA5D4
sub_80FA5D4: @ 80FA5D4
	push {r4-r6,lr}
	movs r3, 0
	movs r1, 0
	ldr r5, _080FA620 @ =gUnknown_3005DDD
	movs r6, 0x1
	movs r4, 0
_080FA5E0:
	adds r2, r1, r5
	ldrb r0, [r2]
	cmp r0, 0xB
	bne _080FA5F4
	adds r0, r6, 0
	lsls r0, r1
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
	strb r4, [r2]
_080FA5F4:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080FA5E0
	cmp r3, 0
	beq _080FA608
	adds r0, r3, 0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080FA608:
	movs r1, 0
	ldr r2, _080FA620 @ =gUnknown_3005DDD
_080FA60C:
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080FA624
	movs r0, 0x1
	b _080FA62C
	.align 2, 0
_080FA620: .4byte gUnknown_3005DDD
_080FA624:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080FA60C
	movs r0, 0
_080FA62C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA5D4

	thumb_func_start sub_80FA634
sub_80FA634: @ 80FA634
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	lsls r2, 16
	lsrs r2, 16
	adds r1, r2, 0
	bl sub_80FBC70
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080FA668
	ldr r0, _080FA660 @ =gUnknown_3005450
	ldr r2, _080FA664 @ =0x00000989
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x9
	beq _080FA668
	movs r0, 0
	b _080FA66A
	.align 2, 0
_080FA660: .4byte gUnknown_3005450
_080FA664: .4byte 0x00000989
_080FA668:
	movs r0, 0x1
_080FA66A:
	pop {r1}
	bx r1
	thumb_func_end sub_80FA634

	thumb_func_start sub_80FA670
sub_80FA670: @ 80FA670
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r0, r2, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_80FBC70
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080FA6B4 @ =gUnknown_3005450
	ldr r0, _080FA6B8 @ =0x00000989
	adds r5, r0
	adds r5, r4, r5
	strb r6, [r5]
	movs r0, 0x4
	adds r1, r4, 0
	bl rfu_clearSlot
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r4
	lsrs r0, 24
	movs r1, 0x8
	adds r2, r5, 0
	movs r3, 0x1
	bl rfu_NI_setSendData
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FA6B4: .4byte gUnknown_3005450
_080FA6B8: .4byte 0x00000989
	thumb_func_end sub_80FA670

	thumb_func_start sub_80FA6BC
sub_80FA6BC: @ 80FA6BC
	push {r4,r5,lr}
	ldr r4, _080FA6F0 @ =gUnknown_3005450
	ldr r0, _080FA6F4 @ =0x0000093d
	adds r5, r4, r0
	movs r0, 0x8
	strb r0, [r5]
	ldr r0, _080FA6F8 @ =0x000008f6
	adds r4, r0
	ldrb r1, [r4]
	movs r0, 0x4
	bl rfu_clearSlot
	ldrb r1, [r4]
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r1
	lsrs r0, 24
	movs r1, 0x8
	adds r2, r5, 0
	movs r3, 0x1
	bl rfu_NI_setSendData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA6F0: .4byte gUnknown_3005450
_080FA6F4: .4byte 0x0000093d
_080FA6F8: .4byte 0x000008f6
	thumb_func_end sub_80FA6BC

	thumb_func_start sub_80FA6FC
sub_80FA6FC: @ 80FA6FC
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	lsls r2, 16
	lsrs r2, 16
	adds r1, r2, 0
	bl sub_80FBC70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080FA718
	movs r0, 0x2
	b _080FA732
_080FA718:
	ldr r1, _080FA72C @ =gUnknown_3007450
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0
	beq _080FA730
	movs r0, 0
	b _080FA732
	.align 2, 0
_080FA72C: .4byte gUnknown_3007450
_080FA730:
	movs r0, 0x1
_080FA732:
	pop {r1}
	bx r1
	thumb_func_end sub_80FA6FC

	thumb_func_start sub_80FA738
sub_80FA738: @ 80FA738
	push {r4,r5,lr}
	bl sub_80FA528
	movs r4, 0
	ldr r0, _080FA77C @ =gUnknown_3005450
	ldr r1, _080FA780 @ =0x0000098d
	adds r5, r0, r1
_080FA746:
	ldr r1, _080FA784 @ =gUnknown_3007450
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, 0x26
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080FA770
	adds r1, r4, r5
	ldrb r0, [r1]
	cmp r0, 0xA
	bne _080FA766
	movs r0, 0xB
	strb r0, [r1]
_080FA766:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x4
	bl rfu_clearSlot
_080FA770:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FA746
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA77C: .4byte gUnknown_3005450
_080FA780: .4byte 0x0000098d
_080FA784: .4byte gUnknown_3007450
	thumb_func_end sub_80FA738

	thumb_func_start sub_80FA788
sub_80FA788: @ 80FA788
	push {r4,r5,lr}
	movs r4, 0
	ldr r1, _080FA800 @ =gUnknown_3005450
	ldr r2, _080FA804 @ =0x0000093d
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _080FA7C2
	ldr r2, _080FA808 @ =gUnknown_3007450
	ldr r0, _080FA80C @ =0x000008f6
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x26
	beq _080FA7BA
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x27
	bne _080FA7C2
_080FA7BA:
	ldrb r1, [r1]
	movs r0, 0x4
	bl rfu_clearSlot
_080FA7C2:
	ldr r2, _080FA808 @ =gUnknown_3007450
	ldr r5, _080FA800 @ =gUnknown_3005450
	ldr r0, _080FA80C @ =0x000008f6
	adds r1, r5, r0
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x46
	beq _080FA7E6
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x48
	bne _080FA814
_080FA7E6:
	ldrb r1, [r1]
	movs r0, 0x8
	bl rfu_clearSlot
	ldr r2, _080FA810 @ =0x0000093e
	adds r4, r5, r2
	ldrb r0, [r4]
	movs r1, 0
	bl sub_80FB9E4
	ldrb r4, [r4]
	b _080FA82C
	.align 2, 0
_080FA800: .4byte gUnknown_3005450
_080FA804: .4byte 0x0000093d
_080FA808: .4byte gUnknown_3007450
_080FA80C: .4byte 0x000008f6
_080FA810: .4byte 0x0000093e
_080FA814:
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x34]
	cmp r0, 0x47
	bne _080FA82C
	ldrb r1, [r1]
	movs r0, 0x8
	bl rfu_clearSlot
	movs r4, 0x6
_080FA82C:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA788

	thumb_func_start sub_80FA834
sub_80FA834: @ 80FA834
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080FA884 @ =gUnknown_3005450
	adds r0, r5, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080FA85C
	movs r0, 0x9A
	lsls r0, 4
	adds r1, r5, r0
	movs r0, 0
	strb r0, [r1]
	adds r0, r6, 0
	bl DestroyTask
_080FA85C:
	ldr r2, _080FA888 @ =gTasks
	lsls r1, r6, 2
	adds r0, r1, r6
	lsls r0, 3
	adds r4, r0, r2
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	adds r7, r1, 0
	cmp r0, 0x3
	beq _080FA904
	cmp r0, 0x3
	bgt _080FA88C
	cmp r0, 0x1
	beq _080FA8B4
	cmp r0, 0x1
	bgt _080FA900
	cmp r0, 0
	beq _080FA89E
	b _080FA9BC
	.align 2, 0
_080FA884: .4byte gUnknown_3005450
_080FA888: .4byte gTasks
_080FA88C:
	cmp r0, 0x5
	beq _080FA938
	cmp r0, 0x5
	blt _080FA926
	cmp r0, 0x6
	beq _080FA96C
	cmp r0, 0x65
	beq _080FA8EC
	b _080FA9BC
_080FA89E:
	bl sub_80F9C50
	lsls r0, 24
	cmp r0, 0
	bne _080FA8AA
	b _080FA9BC
_080FA8AA:
	bl ResetBlockReceivedFlags
	bl sub_800B0B4
	b _080FA930
_080FA8B4:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	bne _080FA8F4
	ldr r0, _080FA8CC @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FA8D0
	movs r0, 0xF0
	lsls r0, 7
	bl sub_80F9D04
	b _080FA8D8
	.align 2, 0
_080FA8CC: .4byte gUnknown_3003F64
_080FA8D0:
	movs r0, 0xEE
	lsls r0, 7
	bl sub_80F9D04
_080FA8D8:
	ldr r0, _080FA8E8 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x65
	strh r0, [r1, 0x8]
	b _080FA9BC
	.align 2, 0
_080FA8E8: .4byte gTasks
_080FA8EC:
	ldr r0, _080FA8FC @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	bne _080FA9BC
_080FA8F4:
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080FA9BC
	.align 2, 0
_080FA8FC: .4byte gUnknown_3003F50
_080FA900:
	ldrb r0, [r5, 0xD]
	b _080FA92C
_080FA904:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	bne _080FA930
	bl sub_80F9C50
	lsls r0, 24
	cmp r0, 0
	beq _080FA9BC
	adds r1, r5, 0
	adds r1, 0x5A
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xA1
	lsls r0, 8
	bl sub_80F9D04
	b _080FA930
_080FA926:
	bl sub_80F9C78
	lsls r0, 24
_080FA92C:
	cmp r0, 0
	beq _080FA9BC
_080FA930:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080FA9BC
_080FA938:
	movs r4, 0
	ldrb r0, [r5, 0xD]
	cmp r4, r0
	bge _080FA956
_080FA940:
	adds r0, r4, 0
	bl sub_800B110
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80F974C
	adds r4, 0x1
	ldrb r2, [r5, 0xD]
	cmp r4, r2
	blt _080FA940
_080FA956:
	ldr r0, _080FA968 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080FA9BC
	.align 2, 0
_080FA968: .4byte gTasks
_080FA96C:
	adds r0, r6, 0
	bl DestroyTask
	ldr r1, _080FA9C4 @ =gUnknown_3003F64
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x9A
	lsls r0, 4
	adds r1, r5, r0
	movs r0, 0
	strb r0, [r1]
	movs r1, 0x96
	lsls r1, 2
	movs r0, 0x1
	bl sub_80FEA34
	ldr r2, _080FA9C8 @ =0x0000099e
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _080FA9BC
	movs r4, 0
	adds r2, r1, 0
	movs r3, 0x1
	ldr r0, _080FA9CC @ =0x0000099d
	adds r5, r0
_080FA9A0:
	ldrb r0, [r2]
	asrs r0, r4
	ands r0, r3
	cmp r0, 0
	beq _080FA9B6
	adds r0, r3, 0
	lsls r0, r4
	strb r0, [r5]
	ldrb r1, [r2]
	eors r0, r1
	strb r0, [r2]
_080FA9B6:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FA9A0
_080FA9BC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA9C4: .4byte gUnknown_3003F64
_080FA9C8: .4byte 0x0000099e
_080FA9CC: .4byte 0x0000099d
	thumb_func_end sub_80FA834

	thumb_func_start sub_80FA9D0
sub_80FA9D0: @ 80FA9D0
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	movs r5, 0x1
	ldr r4, _080FA9F8 @ =gUnknown_3005DE6
	movs r3, 0
_080FA9DE:
	adds r0, r2, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _080FA9EC
	adds r0, r1, r4
	strb r3, [r0]
_080FA9EC:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080FA9DE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA9F8: .4byte gUnknown_3005DE6
	thumb_func_end sub_80FA9D0

	thumb_func_start sub_80FA9FC
sub_80FA9FC: @ 80FA9FC
	push {r4-r7,lr}
	adds r2, r0, 0
	ldr r1, _080FAA4C @ =gUnknown_3005450
	ldrb r0, [r2, 0xF]
	strb r0, [r1, 0xD]
	movs r4, 0
	ldr r0, _080FAA50 @ =0x00000996
	adds r5, r1, r0
	adds r3, r2, 0
	adds r3, 0x10
_080FAA10:
	adds r0, r4, r5
	adds r1, r3, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FAA10
	adds r6, r2, 0
	ldr r5, _080FAA54 @ =gLinkPlayers
	movs r4, 0x4
_080FAA24:
	adds r0, r5, 0
	adds r1, r6, 0
	adds r1, 0x14
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r5, 0
	bl sub_800B284
	adds r6, 0x1C
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _080FAA24
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FAA4C: .4byte gUnknown_3005450
_080FAA50: .4byte 0x00000996
_080FAA54: .4byte gLinkPlayers
	thumb_func_end sub_80FA9FC

	thumb_func_start sub_80FAA58
sub_80FAA58: @ 80FAA58
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _080FAA8C @ =gUnknown_843EDE4	"PokemonSioInfo"
	adds r1, r4, 0
	bl strcmp
	adds r5, r0, 0
	cmp r5, 0
	bne _080FAA84
	adds r0, r4, 0
	bl sub_80FA9FC
	mov r0, sp
	strh r5, [r0]
	ldr r2, _080FAA90 @ =0x0100007e
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0
	bl ResetBlockReceivedFlag
_080FAA84:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FAA8C: .4byte gUnknown_843EDE4
_080FAA90: .4byte 0x0100007e
	thumb_func_end sub_80FAA58

	thumb_func_start sub_80FAA94
sub_80FAA94: @ 80FAA94
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _080FAAF4 @ =gUnknown_3005450
	ldr r2, _080FAAF8 @ =gUnknown_843EC38
	ldr r1, _080FAAFC @ =0x000009a1
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r1, r2
	ldr r2, _080FAB00 @ =0x00000996
	adds r0, r3, r2
	ldrb r1, [r1]
	adds r0, r1
	ldrb r4, [r0]
	adds r0, r3, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080FAAD2
	movs r5, 0x9A
	lsls r5, 4
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	adds r0, r6, 0
	bl DestroyTask
_080FAAD2:
	ldr r0, _080FAB04 @ =gTasks
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	adds r3, r0, 0
	adds r7, r2, 0
	cmp r1, 0x5
	bls _080FAAEA
	b _080FACD6
_080FAAEA:
	lsls r0, r1, 2
	ldr r1, _080FAB08 @ =_080FAB0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FAAF4: .4byte gUnknown_3005450
_080FAAF8: .4byte gUnknown_843EC38
_080FAAFC: .4byte 0x000009a1
_080FAB00: .4byte 0x00000996
_080FAB04: .4byte gTasks
_080FAB08: .4byte _080FAB0C
	.align 2, 0
_080FAB0C:
	.4byte _080FAB24
	.4byte _080FAB44
	.4byte _080FAB5C
	.4byte _080FABA4
	.4byte _080FABEE
	.4byte _080FAC78
_080FAB24:
	ldr r0, _080FAB40 @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	beq _080FAB2E
	b _080FACD6
_080FAB2E:
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	movs r0, 0xF0
	lsls r0, 7
	bl sub_80F9D04
	b _080FAC2E
	.align 2, 0
_080FAB40: .4byte gUnknown_3003F50
_080FAB44:
	ldr r0, _080FAB58 @ =gUnknown_3003F50
	ldrh r0, [r0]
	cmp r0, 0
	beq _080FAB4E
	b _080FACD6
_080FAB4E:
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r3
	b _080FAC36
	.align 2, 0
_080FAB58: .4byte gUnknown_3003F50
_080FAB5C:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080FAB70
	b _080FACD6
_080FAB70:
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	lsls r2, r4, 8
	ldr r0, _080FAB9C @ =gUnknown_2022118
	adds r2, r0
	ldr r1, _080FABA0 @ =gLinkPlayers
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	adds r1, r0, 0
	adds r2, 0x10
	ldm r2!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r2!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r2, [r2]
	str r2, [r1]
	bl sub_800B284
	b _080FAC2E
	.align 2, 0
_080FAB9C: .4byte gUnknown_2022118
_080FABA0: .4byte gLinkPlayers
_080FABA4:
	ldr r5, _080FAC40 @ =gUnknown_2022618
	adds r1, r5, 0
	ldr r0, _080FAC44 @ =gUnknown_843EDE4	"PokemonSioInfo"
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldrh r2, [r0]
	strh r2, [r1]
	ldrb r0, [r0, 0x2]
	strb r0, [r1, 0x2]
	ldr r1, _080FAC48 @ =gUnknown_3005450
	ldrb r0, [r1, 0xD]
	strb r0, [r5, 0xF]
	movs r2, 0
	adds r4, r5, 0
	adds r4, 0x10
	ldr r0, _080FAC4C @ =0x00000996
	adds r3, r1, r0
_080FABC6:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FABC6
	ldr r1, _080FAC50 @ =gLinkPlayers
	adds r0, r5, 0
	adds r0, 0x14
	movs r2, 0x8C
	bl memcpy
	ldr r0, _080FAC54 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080FABEE:
	ldr r5, _080FAC40 @ =gUnknown_2022618
	ldr r1, _080FAC48 @ =gUnknown_3005450
	ldrb r0, [r1, 0xD]
	strb r0, [r5, 0xF]
	movs r2, 0
	ldr r3, _080FAC50 @ =gLinkPlayers
	mov r12, r3
	adds r4, r5, 0
	adds r4, 0x10
	ldr r0, _080FAC4C @ =0x00000996
	adds r3, r1, r0
_080FAC04:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FAC04
	adds r0, r5, 0
	adds r0, 0x14
	mov r1, r12
	movs r2, 0x8C
	bl memcpy
	ldr r1, _080FAC40 @ =gUnknown_2022618
	movs r0, 0
	movs r2, 0xA0
	bl SendBlock
	lsls r0, 24
	cmp r0, 0
	beq _080FACD6
_080FAC2E:
	ldr r0, _080FAC54 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r1, r0
_080FAC36:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080FACD6
	.align 2, 0
_080FAC40: .4byte gUnknown_2022618
_080FAC44: .4byte gUnknown_843EDE4
_080FAC48: .4byte gUnknown_3005450
_080FAC4C: .4byte 0x00000996
_080FAC50: .4byte gLinkPlayers
_080FAC54: .4byte gTasks
_080FAC58:
	adds r0, r3, 0
	lsls r0, r2
	ldr r2, _080FAC74 @ =0x0000099d
	adds r1, r5, r2
	strb r0, [r1]
	ldrb r1, [r4]
	eors r0, r1
	strb r0, [r4]
	movs r4, 0x9A
	lsls r4, 4
	adds r0, r5, r4
	strb r3, [r0]
	b _080FACD0
	.align 2, 0
_080FAC74: .4byte 0x0000099d
_080FAC78:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _080FACD6
	bl GetBlockReceivedStatus
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080FACD6
	mov r0, sp
	movs r4, 0
	strh r4, [r0]
	ldr r1, _080FACE0 @ =gUnknown_2022118
	ldr r2, _080FACE4 @ =0x0100007e
	bl CpuSet
	movs r0, 0
	bl ResetBlockReceivedFlag
	ldr r1, _080FACE8 @ =gUnknown_3005450
	movs r5, 0x9A
	lsls r5, 4
	adds r0, r1, r5
	strb r4, [r0]
	ldr r0, _080FACEC @ =0x0000099e
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, 0
	beq _080FACD0
	movs r2, 0
	adds r5, r1, 0
	adds r4, r3, 0
	ldrb r1, [r4]
	movs r3, 0x1
_080FACC0:
	adds r0, r1, 0
	asrs r0, r2
	ands r0, r3
	cmp r0, 0
	bne _080FAC58
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FACC0
_080FACD0:
	adds r0, r6, 0
	bl DestroyTask
_080FACD6:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FACE0: .4byte gUnknown_2022118
_080FACE4: .4byte 0x0100007e
_080FACE8: .4byte gUnknown_3005450
_080FACEC: .4byte 0x0000099e
	thumb_func_end sub_80FAA94

	thumb_func_start sub_80FACF0
sub_80FACF0: @ 80FACF0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _080FAD2C @ =gUnknown_3005450
	adds r0, r6, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080FAD0E
	adds r0, r5, 0
	bl DestroyTask
_080FAD0E:
	ldr r1, _080FAD30 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080FAD54
	cmp r0, 0x1
	bgt _080FAD34
	cmp r0, 0
	beq _080FAD3A
	b _080FAD8A
	.align 2, 0
_080FAD2C: .4byte gUnknown_3005450
_080FAD30: .4byte gTasks
_080FAD34:
	cmp r0, 0x2
	beq _080FAD66
	b _080FAD8A
_080FAD3A:
	ldrb r0, [r6, 0xD]
	cmp r0, 0
	beq _080FAD8A
	bl sub_800B0B4
	ldr r1, _080FAD50 @ =gUnknown_2022618
	movs r0, 0
	movs r2, 0x3C
	bl SendBlock
	b _080FAD5E
	.align 2, 0
_080FAD50: .4byte gUnknown_2022618
_080FAD54:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _080FAD8A
_080FAD5E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080FAD8A
_080FAD66:
	bl GetBlockReceivedStatus
	movs r4, 0x1
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080FAD8A
	ldr r0, _080FAD90 @ =gUnknown_2022118
	bl sub_80FA9FC
	movs r0, 0
	bl ResetBlockReceivedFlag
	ldr r0, _080FAD94 @ =gUnknown_3003F64
	strb r4, [r0]
	adds r0, r5, 0
	bl DestroyTask
_080FAD8A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FAD90: .4byte gUnknown_2022118
_080FAD94: .4byte gUnknown_3003F64
	thumb_func_end sub_80FACF0

	thumb_func_start sub_80FAD98
sub_80FAD98: @ 80FAD98
	push {r4-r7,lr}
	ldr r0, _080FAE10 @ =gUnknown_3005450
	adds r7, r0, 0
	adds r7, 0xEE
	ldrb r1, [r7]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080FAE30
	ldr r0, _080FAE14 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	bne _080FAE30
	ldr r6, _080FAE18 @ =gMain
	ldr r1, [r6, 0x4]
	ldr r0, _080FAE1C @ =sub_814208C
	cmp r1, r0
	bne _080FADC0
	ldr r1, _080FAE20 @ =gUnknown_3003F3C
	movs r0, 0x2
	strb r0, [r1]
_080FADC0:
	ldr r4, _080FAE24 @ =c2_800ACD4
	adds r0, r4, 0
	bl SetMainCallback2
	str r4, [r6, 0x8]
	ldrh r0, [r5, 0xA]
	lsls r4, r0, 16
	ldrh r0, [r5, 0x10]
	lsls r0, 8
	orrs r4, r0
	ldrh r0, [r5, 0x12]
	orrs r4, r0
	ldr r1, _080FAE28 @ =0x0000069e
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r6, r0, 0
	ldr r1, _080FAE2C @ =0x000008d2
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r5, r0, 0
	bl sub_80FB9F4
	movs r3, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080FADF8
	movs r3, 0x1
_080FADF8:
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_800ACBC
	ldrb r0, [r7]
	movs r0, 0x2
	strb r0, [r7]
	bl sub_80098B8
	b _080FAE62
	.align 2, 0
_080FAE10: .4byte gUnknown_3005450
_080FAE14: .4byte gUnknown_3005E10
_080FAE18: .4byte gMain
_080FAE1C: .4byte sub_814208C
_080FAE20: .4byte gUnknown_3003F3C
_080FAE24: .4byte c2_800ACD4
_080FAE28: .4byte 0x0000069e
_080FAE2C: .4byte 0x000008d2
_080FAE30:
	ldr r1, _080FAE68 @ =0x000008d3
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080FAE44
	ldr r1, _080FAE6C @ =0x0000069f
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FAE62
_080FAE44:
	ldr r0, _080FAE70 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	beq _080FAE50
	bl sub_80FEB14
_080FAE50:
	movs r4, 0xE0
	lsls r4, 7
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80FB9E4
	adds r0, r4, 0
	bl sub_80FB0E8
_080FAE62:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FAE68: .4byte 0x000008d3
_080FAE6C: .4byte 0x0000069f
_080FAE70: .4byte gUnknown_3005E10
	thumb_func_end sub_80FAD98

	thumb_func_start rfu_REQ_recvData_then_sendData
rfu_REQ_recvData_then_sendData: @ 80FAE74
	push {lr}
	ldr r0, _080FAE90 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	bne _080FAE8C
	bl rfu_REQ_recvData
	bl rfu_waitREQComplete
	movs r0, 0
	bl rfu_REQ_sendData_wrapper
_080FAE8C:
	pop {r0}
	bx r0
	.align 2, 0
_080FAE90: .4byte gUnknown_3005E10
	thumb_func_end rfu_REQ_recvData_then_sendData

	thumb_func_start sub_80FAE94
sub_80FAE94: @ 80FAE94
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _080FAEC8 @ =gUnknown_3005450
	ldr r1, _080FAECC @ =0x00000985
	adds r0, r4, r1
	strb r5, [r0]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	bl sub_80FDA30
	adds r0, r4, 0
	adds r0, 0xEF
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FAEE8
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	beq _080FAED6
	cmp r0, 0x1
	bgt _080FAED0
	cmp r0, 0
	beq _080FAEDC
	b _080FAEE8
	.align 2, 0
_080FAEC8: .4byte gUnknown_3005450
_080FAECC: .4byte 0x00000985
_080FAED0:
	cmp r0, 0x2
	beq _080FAEE4
	b _080FAEE8
_080FAED6:
	bl sub_80F911C
	b _080FAEE8
_080FAEDC:
	bl sub_80F9514
	adds r5, r0, 0
	b _080FAEE8
_080FAEE4:
	bl rfu_REQ_recvData_then_sendData
_080FAEE8:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FAE94

	thumb_func_start sub_80FAEF0
sub_80FAEF0: @ 80FAEF0
	push {r4,lr}
	movs r4, 0
	ldr r1, _080FAF18 @ =gUnknown_3005450
	adds r0, r1, 0
	adds r0, 0xEF
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FAF10
	ldrb r0, [r1, 0xC]
	cmp r0, 0x1
	bne _080FAF0C
	bl sub_80F9204
	adds r4, r0, 0
_080FAF0C:
	bl sub_80FAD98
_080FAF10:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FAF18: .4byte gUnknown_3005450
	thumb_func_end sub_80FAEF0

	thumb_func_start sub_80FAF1C
sub_80FAF1C: @ 80FAF1C
	push {lr}
	ldr r0, _080FAF2C @ =gUnknown_3005E00
	ldr r1, _080FAF30 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080FAF2C: .4byte gUnknown_3005E00
_080FAF30: .4byte gSaveBlock2Ptr
	thumb_func_end sub_80FAF1C

	thumb_func_start sub_80FAF34
sub_80FAF34: @ 80FAF34
	push {r4,lr}
	ldr r4, _080FAF54 @ =gUnknown_3005440
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80FCB54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAF54: .4byte gUnknown_3005440
	thumb_func_end sub_80FAF34

	thumb_func_start sub_80FAF58
sub_80FAF58: @ 80FAF58
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080FAF70 @ =gUnknown_3005440
	adds r1, r4, 0
	bl sub_80FCB54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAF70: .4byte gUnknown_3005440
	thumb_func_end sub_80FAF58

	thumb_func_start sub_80FAF74
sub_80FAF74: @ 80FAF74
	push {r4,r5,lr}
	ldr r5, _080FAF9C @ =gUnknown_3005440
	movs r4, 0x1
	ands r0, r4
	lsls r0, 4
	ldrb r3, [r5]
	movs r2, 0x11
	negs r2, r2
	ands r2, r3
	orrs r2, r0
	ands r1, r4
	lsls r1, 5
	movs r0, 0x21
	negs r0, r0
	ands r2, r0
	orrs r2, r1
	strb r2, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FAF9C: .4byte gUnknown_3005440
	thumb_func_end sub_80FAF74

	thumb_func_start sub_80FAFA0
sub_80FAFA0: @ 80FAFA0
	push {r4,r5,lr}
	ldr r5, _080FAFD4 @ =gUnknown_3005440
	lsls r0, 2
	ldrb r4, [r5, 0x9]
	movs r3, 0x3
	ands r3, r4
	orrs r3, r0
	strb r3, [r5, 0x9]
	ldr r3, _080FAFD8 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldrh r3, [r5, 0x8]
	ldr r0, _080FAFDC @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r5, 0x8]
	lsls r2, 1
	ldrb r1, [r5, 0xB]
	movs r0, 0x1
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0xB]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FAFD4: .4byte gUnknown_3005440
_080FAFD8: .4byte 0x000003ff
_080FAFDC: .4byte 0xfffffc00
	thumb_func_end sub_80FAFA0

	thumb_func_start sub_80FAFE0
sub_80FAFE0: @ 80FAFE0
	push {lr}
	lsls r0, 24
	ldr r2, _080FB000 @ =gUnknown_3005440
	lsrs r0, 17
	ldrb r3, [r2, 0xA]
	movs r1, 0x7F
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, 0xA]
	ldr r3, _080FB004 @ =gUnknown_3005E00
	movs r0, 0
	movs r1, 0x2
	bl rfu_REQ_configGameData
	pop {r0}
	bx r0
	.align 2, 0
_080FB000: .4byte gUnknown_3005440
_080FB004: .4byte gUnknown_3005E00
	thumb_func_end sub_80FAFE0

	thumb_func_start sub_80FB008
sub_80FB008: @ 80FB008
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080FB016
	bl sub_80FAF58
_080FB016:
	ldr r2, _080FB028 @ =gUnknown_3005440
	ldr r3, _080FB02C @ =gUnknown_3005E00
	movs r0, 0
	movs r1, 0x2
	bl rfu_REQ_configGameData
	pop {r0}
	bx r0
	.align 2, 0
_080FB028: .4byte gUnknown_3005440
_080FB02C: .4byte gUnknown_3005E00
	thumb_func_end sub_80FB008

	thumb_func_start sub_80FB030
sub_80FB030: @ 80FB030
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	bne _080FB0C4
	movs r5, 0
	movs r7, 0
	ldr r3, _080FB0D4 @ =gUnknown_3005450
	ldr r1, _080FB0D8 @ =0x0000099a
	adds r0, r3, r1
	ldr r2, _080FB0DC @ =0x0000099b
	adds r1, r3, r2
	ldrb r2, [r0]
	ldrb r0, [r1]
	adds r1, r0, 0
	eors r1, r2
	mov r8, r1
	movs r4, 0
	movs r6, 0x1
	ldr r2, _080FB0E0 @ =gLinkPlayers
	mov r12, r2
	ldr r0, _080FB0E4 @ =0x00000996
	adds r0, r3
	mov r10, r0
	mov r3, r12
	adds r3, 0x4
_080FB074:
	mov r0, r8
	asrs r0, r4
	ands r0, r6
	cmp r0, 0
	beq _080FB0B4
	mov r1, r10
	adds r0, r4, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r2, r12
	adds r1, r0, r2
	ldrb r1, [r1, 0x13]
	adds r2, r6, 0
	ands r2, r1
	lsls r2, 3
	adds r0, r3
	ldr r1, [r0]
	movs r0, 0x7
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	orrs r2, r1
	lsls r0, r5, 3
	lsls r2, r0
	orrs r7, r2
	adds r5, 0x1
	mov r0, r9
	subs r0, 0x1
	cmp r5, r0
	beq _080FB0BA
_080FB0B4:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FB074
_080FB0BA:
	movs r0, 0x45
	adds r1, r7, 0
	movs r2, 0
	bl sub_80FB008
_080FB0C4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB0D4: .4byte gUnknown_3005450
_080FB0D8: .4byte 0x0000099a
_080FB0DC: .4byte 0x0000099b
_080FB0E0: .4byte gLinkPlayers
_080FB0E4: .4byte 0x00000996
	thumb_func_end sub_80FB030

	thumb_func_start sub_80FB0E8
sub_80FB0E8: @ 80FB0E8
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _080FB110 @ =gUnknown_3005450
	adds r3, r2, 0
	adds r3, 0xEE
	ldrb r0, [r3]
	cmp r0, 0
	bne _080FB10A
	ldr r1, _080FB114 @ =gUnknown_3005E10
	ldrh r0, [r1, 0x14]
	strh r0, [r2, 0x10]
	ldrh r0, [r1, 0x16]
	strh r0, [r2, 0x12]
	strh r4, [r2, 0xA]
	ldrb r0, [r3]
	movs r0, 0x1
	strb r0, [r3]
_080FB10A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FB110: .4byte gUnknown_3005450
_080FB114: .4byte gUnknown_3005E10
	thumb_func_end sub_80FB0E8

	thumb_func_start sub_80FB118
sub_80FB118: @ 80FB118
	ldr r0, _080FB124 @ =gUnknown_3005450
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080FB124: .4byte gUnknown_3005450
	thumb_func_end sub_80FB118

	thumb_func_start sub_80FB128
sub_80FB128: @ 80FB128
	push {lr}
	adds r2, r0, 0
	cmp r2, 0
	bne _080FB140
	ldr r0, _080FB13C @ =gUnknown_3005450
	adds r0, 0xEE
	ldrb r1, [r0]
	strb r2, [r0]
	b _080FB14A
	.align 2, 0
_080FB13C: .4byte gUnknown_3005450
_080FB140:
	ldr r0, _080FB150 @ =gUnknown_3005450
	adds r0, 0xEE
	ldrb r1, [r0]
	movs r1, 0x4
	strb r1, [r0]
_080FB14A:
	pop {r0}
	bx r0
	.align 2, 0
_080FB150: .4byte gUnknown_3005450
	thumb_func_end sub_80FB128

	thumb_func_start sub_80FB154
sub_80FB154: @ 80FB154
	push {lr}
	ldr r0, _080FB16C @ =gUnknown_3005E10
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_80FBE20
	ldr r1, _080FB170 @ =gUnknown_3005450
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080FB16C: .4byte gUnknown_3005E10
_080FB170: .4byte gUnknown_3005450
	thumb_func_end sub_80FB154

	thumb_func_start sub_80FB174
sub_80FB174: @ 80FB174
	ldr r1, _080FB17C @ =gUnknown_3005450
	ldr r0, _080FB180 @ =sub_80FB154
	str r0, [r1]
	bx lr
	.align 2, 0
_080FB17C: .4byte gUnknown_3005450
_080FB180: .4byte sub_80FB154
	thumb_func_end sub_80FB174

	thumb_func_start sub_80FB184
sub_80FB184: @ 80FB184
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r6, 0
	cmp r4, 0x32
	bne _080FB19A
	b _080FB2D8
_080FB19A:
	cmp r4, 0x32
	bgt _080FB1CA
	cmp r4, 0x13
	bgt _080FB1B8
	cmp r4, 0x12
	blt _080FB1A8
	b _080FB366
_080FB1A8:
	cmp r4, 0x10
	bne _080FB1AE
	b _080FB366
_080FB1AE:
	cmp r4, 0x10
	bgt _080FB204
	cmp r4, 0
	beq _080FB1F6
	b _080FB366
_080FB1B8:
	cmp r4, 0x30
	bne _080FB1BE
	b _080FB2E4
_080FB1BE:
	cmp r4, 0x30
	ble _080FB1C4
	b _080FB2CC
_080FB1C4:
	cmp r4, 0x14
	beq _080FB2A0
	b _080FB366
_080FB1CA:
	cmp r4, 0x44
	bgt _080FB1DC
	cmp r4, 0x42
	blt _080FB1D4
	b _080FB366
_080FB1D4:
	cmp r4, 0x33
	bne _080FB1DA
	b _080FB2E4
_080FB1DA:
	b _080FB366
_080FB1DC:
	cmp r4, 0xF3
	bne _080FB1E2
	b _080FB332
_080FB1E2:
	cmp r4, 0xF3
	bgt _080FB1EE
	cmp r4, 0xF0
	bge _080FB1EC
	b _080FB366
_080FB1EC:
	b _080FB34C
_080FB1EE:
	cmp r4, 0xFF
	bne _080FB1F4
	b _080FB34C
_080FB1F4:
	b _080FB366
_080FB1F6:
	ldr r1, _080FB200 @ =gUnknown_3005450
	movs r0, 0x2
	strh r0, [r1, 0x4]
	b _080FB366
	.align 2, 0
_080FB200: .4byte gUnknown_3005450
_080FB204:
	ldr r0, _080FB268 @ =gUnknown_3005E10
	ldrh r0, [r0, 0x14]
	bl sub_80FB564
	movs r5, 0
	movs r0, 0x1
	mov r8, r0
	ldr r1, _080FB26C @ =gUnknown_3005450
	mov r9, r1
	ldr r3, _080FB270 @ =0x0000098d
	add r3, r9
	mov r10, r3
	movs r7, 0x7F
_080FB21E:
	ldr r0, _080FB268 @ =gUnknown_3005E10
	ldrh r0, [r0, 0x14]
	asrs r0, r5
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _080FB286
	ldr r0, _080FB274 @ =gUnknown_3007460
	lsls r1, r5, 5
	adds r1, 0x14
	ldr r0, [r0]
	adds r0, r1
	ldrb r0, [r0, 0x10]
	adds r4, r7, 0
	ands r4, r0
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	adds r0, r7, 0
	ands r0, r1
	cmp r4, r0
	bne _080FB27C
	ldr r0, _080FB278 @ =0x00000989
	add r0, r9
	adds r0, r5, r0
	movs r1, 0
	strb r1, [r0]
	mov r3, r10
	adds r2, r5, r3
	strb r1, [r2]
	movs r0, 0x20
	adds r1, r5, 0
	movs r3, 0x1
	bl rfu_setRecvBuffer
	b _080FB286
	.align 2, 0
_080FB268: .4byte gUnknown_3005E10
_080FB26C: .4byte gUnknown_3005450
_080FB270: .4byte 0x0000098d
_080FB274: .4byte gUnknown_3007460
_080FB278: .4byte 0x00000989
_080FB27C:
	mov r0, r8
	lsls r0, r5
	orrs r6, r0
	lsls r0, r6, 24
	lsrs r6, r0, 24
_080FB286:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080FB21E
	cmp r6, 0
	beq _080FB366
	adds r0, r6, 0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	b _080FB366
_080FB2A0:
	ldr r4, _080FB2C0 @ =gUnknown_3005450
	ldr r1, _080FB2C4 @ =0x0000099f
	adds r0, r4, r1
	ldr r1, _080FB2C8 @ =gUnknown_3005E10
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	beq _080FB2BA
	eors r0, r2
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080FB2BA:
	movs r0, 0x11
	strh r0, [r4, 0x4]
	b _080FB366
	.align 2, 0
_080FB2C0: .4byte gUnknown_3005450
_080FB2C4: .4byte 0x0000099f
_080FB2C8: .4byte gUnknown_3005E10
_080FB2CC:
	ldr r0, _080FB2D4 @ =gUnknown_3005450
	adds r0, 0xF0
	b _080FB362
	.align 2, 0
_080FB2D4: .4byte gUnknown_3005450
_080FB2D8:
	ldr r0, _080FB2E0 @ =gUnknown_3005450
	adds r0, 0xF0
	movs r1, 0x3
	b _080FB364
	.align 2, 0
_080FB2E0: .4byte gUnknown_3005450
_080FB2E4:
	ldr r1, _080FB314 @ =gUnknown_3005450
	adds r2, r1, 0
	adds r2, 0xF0
	movs r0, 0x4
	strb r0, [r2]
	ldr r3, _080FB318 @ =0x0000099a
	adds r1, r3
	ldr r0, _080FB31C @ =gUnknown_3005E10
	ldrb r2, [r0, 0x14]
	ldrb r0, [r1]
	adds r3, r0, 0
	bics r3, r2
	adds r2, r3, 0
	strb r2, [r1]
	ldr r0, _080FB320 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FB328
	cmp r2, 0
	bne _080FB324
	adds r0, r4, 0
	bl sub_80FB0E8
	b _080FB328
	.align 2, 0
_080FB314: .4byte gUnknown_3005450
_080FB318: .4byte 0x0000099a
_080FB31C: .4byte gUnknown_3005E10
_080FB320: .4byte gUnknown_3003F64
_080FB324:
	bl sub_80FB174
_080FB328:
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
	b _080FB366
_080FB332:
	movs r0, 0x1
	movs r1, 0xF3
	bl sub_80FB9E4
	movs r0, 0xF3
	bl sub_80FB0E8
	ldr r0, _080FB348 @ =gUnknown_3005450
	adds r0, 0xEF
	b _080FB362
	.align 2, 0
_080FB348: .4byte gUnknown_3005450
_080FB34C:
	adds r0, r4, 0
	bl sub_80FB0E8
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80FB9E4
	ldr r0, _080FB374 @ =gUnknown_3005450
	ldr r1, _080FB378 @ =0x00000993
	adds r0, r1
	ldrb r1, [r0]
_080FB362:
	movs r1, 0x1
_080FB364:
	strb r1, [r0]
_080FB366:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB374: .4byte gUnknown_3005450
_080FB378: .4byte 0x00000993
	thumb_func_end sub_80FB184

	thumb_func_start sub_80FB37C
sub_80FB37C: @ 80FB37C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x31
	bne _080FB388
	b _080FB4E8
_080FB388:
	cmp r4, 0x31
	bgt _080FB3B6
	cmp r4, 0x22
	beq _080FB40C
	cmp r4, 0x22
	bgt _080FB3A4
	cmp r4, 0x20
	beq _080FB3F4
	cmp r4, 0x20
	ble _080FB39E
	b _080FB556
_080FB39E:
	cmp r4, 0
	beq _080FB3E6
	b _080FB556
_080FB3A4:
	cmp r4, 0x24
	beq _080FB432
	cmp r4, 0x24
	blt _080FB428
	cmp r4, 0x25
	beq _080FB47C
	cmp r4, 0x30
	beq _080FB486
	b _080FB556
_080FB3B6:
	cmp r4, 0x44
	bgt _080FB3CC
	cmp r4, 0x42
	blt _080FB3C0
	b _080FB556
_080FB3C0:
	cmp r4, 0x33
	beq _080FB49A
	cmp r4, 0x33
	bge _080FB3CA
	b _080FB504
_080FB3CA:
	b _080FB556
_080FB3CC:
	cmp r4, 0xF3
	bne _080FB3D2
	b _080FB524
_080FB3D2:
	cmp r4, 0xF3
	bgt _080FB3DE
	cmp r4, 0xF0
	bge _080FB3DC
	b _080FB556
_080FB3DC:
	b _080FB53C
_080FB3DE:
	cmp r4, 0xFF
	bne _080FB3E4
	b _080FB53C
_080FB3E4:
	b _080FB556
_080FB3E6:
	ldr r1, _080FB3F0 @ =gUnknown_3005450
	movs r0, 0x6
	strh r0, [r1, 0x4]
	b _080FB556
	.align 2, 0
_080FB3F0: .4byte gUnknown_3005450
_080FB3F4:
	ldr r0, _080FB400 @ =gUnknown_3005450
	ldr r1, _080FB404 @ =gUnknown_3005E10
	ldrh r1, [r1, 0x14]
	ldr r2, _080FB408 @ =0x00000985
	adds r0, r2
	b _080FB554
	.align 2, 0
_080FB400: .4byte gUnknown_3005450
_080FB404: .4byte gUnknown_3005E10
_080FB408: .4byte 0x00000985
_080FB40C:
	ldr r0, _080FB41C @ =gUnknown_3005450
	ldr r1, _080FB420 @ =gUnknown_3005E10
	ldrh r1, [r1, 0x14]
	ldr r2, _080FB424 @ =0x000008f6
	adds r0, r2
	ldrb r2, [r0]
	b _080FB554
	.align 2, 0
_080FB41C: .4byte gUnknown_3005450
_080FB420: .4byte gUnknown_3005E10
_080FB424: .4byte 0x000008f6
_080FB428:
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
	b _080FB556
_080FB432:
	ldr r4, _080FB468 @ =gUnknown_3005450
	movs r1, 0
	movs r0, 0xB
	strh r0, [r4, 0x4]
	ldr r2, _080FB46C @ =0x0000093d
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _080FB470 @ =0x0000093e
	adds r2, r4, r0
	strb r1, [r2]
	ldr r1, _080FB474 @ =0x000008f6
	adds r5, r4, r1
	ldrb r1, [r5]
	movs r0, 0x20
	movs r3, 0x1
	bl rfu_setRecvBuffer
	ldrb r1, [r5]
	ldr r2, _080FB478 @ =0x000008f7
	adds r4, r2
	movs r0, 0x10
	adds r2, r4, 0
	movs r3, 0x46
	bl rfu_setRecvBuffer
	b _080FB556
	.align 2, 0
_080FB468: .4byte gUnknown_3005450
_080FB46C: .4byte 0x0000093d
_080FB470: .4byte 0x0000093e
_080FB474: .4byte 0x000008f6
_080FB478: .4byte 0x000008f7
_080FB47C:
	movs r0, 0x2
	movs r1, 0x25
	bl sub_80FB9E4
	b _080FB556
_080FB486:
	ldr r0, _080FB4D8 @ =gUnknown_3005450
	adds r2, r0, 0
	adds r2, 0xF0
	movs r1, 0x2
	strb r1, [r2]
	ldr r1, _080FB4DC @ =0x0000093e
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _080FB556
_080FB49A:
	ldr r2, _080FB4D8 @ =gUnknown_3005450
	adds r1, r2, 0
	adds r1, 0xF0
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _080FB4AA
	movs r0, 0x4
	strb r0, [r1]
_080FB4AA:
	ldr r1, _080FB4DC @ =0x0000093e
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	beq _080FB4BC
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
_080FB4BC:
	ldr r0, _080FB4E0 @ =gUnknown_843EDF8	"LINK LOSS DISCONNECT!"
	movs r1, 0x5
	movs r2, 0x5
	bl nullsub_87
	ldr r0, _080FB4E4 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FB556
	adds r0, r4, 0
	bl sub_80FB0E8
	b _080FB556
	.align 2, 0
_080FB4D8: .4byte gUnknown_3005450
_080FB4DC: .4byte 0x0000093e
_080FB4E0: .4byte gUnknown_843EDF8
_080FB4E4: .4byte gUnknown_3003F64
_080FB4E8:
	ldr r0, _080FB4FC @ =gUnknown_3005450
	adds r0, 0xF0
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _080FB500 @ =gUnknown_843EE10	"LINK LOSS RECOVERY NOW"
	movs r1, 0x5
	movs r2, 0x5
	bl nullsub_87
	b _080FB556
	.align 2, 0
_080FB4FC: .4byte gUnknown_3005450
_080FB500: .4byte gUnknown_843EE10
_080FB504:
	ldr r1, _080FB51C @ =gUnknown_3005450
	adds r2, r1, 0
	adds r2, 0xF0
	movs r0, 0x3
	strb r0, [r2]
	ldr r2, _080FB520 @ =0x000008f4
	adds r1, r2
	ldrb r0, [r1]
	movs r0, 0x1
	strb r0, [r1]
	b _080FB556
	.align 2, 0
_080FB51C: .4byte gUnknown_3005450
_080FB520: .4byte 0x000008f4
_080FB524:
	movs r0, 0x1
	movs r1, 0xF3
	bl sub_80FB9E4
	movs r0, 0xF3
	bl sub_80FB0E8
	ldr r0, _080FB538 @ =gUnknown_3005450
	adds r0, 0xEF
	b _080FB552
	.align 2, 0
_080FB538: .4byte gUnknown_3005450
_080FB53C:
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80FB9E4
	adds r0, r4, 0
	bl sub_80FB0E8
	ldr r0, _080FB55C @ =gUnknown_3005450
	ldr r1, _080FB560 @ =0x00000993
	adds r0, r1
	ldrb r1, [r0]
_080FB552:
	movs r1, 0x1
_080FB554:
	strb r1, [r0]
_080FB556:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FB55C: .4byte gUnknown_3005450
_080FB560: .4byte 0x00000993
	thumb_func_end sub_80FB37C

	thumb_func_start sub_80FB564
sub_80FB564: @ 80FB564
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r2, 0
	movs r6, 0x1
	ldr r0, _080FB598 @ =gUnknown_3005450
	ldr r4, _080FB59C @ =0x000009a2
	adds r1, r0, r4
	movs r5, 0
	movs r4, 0xFF
_080FB576:
	adds r0, r3, 0
	asrs r0, r2
	ands r0, r6
	cmp r0, 0
	beq _080FB588
	strb r5, [r1]
	ldrb r0, [r1, 0x4]
	orrs r0, r4
	strb r0, [r1, 0x4]
_080FB588:
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FB576
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FB598: .4byte gUnknown_3005450
_080FB59C: .4byte 0x000009a2
	thumb_func_end sub_80FB564

	thumb_func_start sub_80FB5A0
sub_80FB5A0: @ 80FB5A0
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r3, 0
	movs r2, 0
	movs r4, 0x1
	ldr r6, _080FB5E8 @ =gUnknown_3007460
	movs r7, 0x7F
_080FB5AE:
	adds r0, r5, 0
	asrs r0, r2
	ands r0, r4
	cmp r0, 0
	beq _080FB5D4
	lsls r1, r2, 5
	adds r1, 0x14
	ldr r0, [r6]
	adds r0, r1
	ldrb r1, [r0, 0x10]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0x45
	bne _080FB5D4
	adds r0, r4, 0
	lsls r0, r2
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
_080FB5D4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080FB5AE
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FB5E8: .4byte gUnknown_3007460
	thumb_func_end sub_80FB5A0

	thumb_func_start sub_80FB5EC
sub_80FB5EC: @ 80FB5EC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x25
	bne _080FB5F8
	b _080FB86C
_080FB5F8:
	cmp r4, 0x25
	bgt _080FB63A
	cmp r4, 0x14
	bne _080FB602
	b _080FB780
_080FB602:
	cmp r4, 0x14
	bgt _080FB61A
	cmp r4, 0x11
	beq _080FB69A
	cmp r4, 0x11
	ble _080FB610
	b _080FB9C2
_080FB610:
	cmp r4, 0
	beq _080FB684
	cmp r4, 0x10
	beq _080FB690
	b _080FB9C2
_080FB61A:
	cmp r4, 0x22
	bne _080FB620
	b _080FB7E8
_080FB620:
	cmp r4, 0x22
	bgt _080FB62C
	cmp r4, 0x20
	bne _080FB62A
	b _080FB7D0
_080FB62A:
	b _080FB9C2
_080FB62C:
	cmp r4, 0x23
	bne _080FB632
	b _080FB804
_080FB632:
	cmp r4, 0x24
	bne _080FB638
	b _080FB83A
_080FB638:
	b _080FB9C2
_080FB63A:
	cmp r4, 0x44
	bgt _080FB66A
	cmp r4, 0x42
	blt _080FB644
	b _080FB9C2
_080FB644:
	cmp r4, 0x32
	bne _080FB64A
	b _080FB894
_080FB64A:
	cmp r4, 0x32
	bgt _080FB65C
	cmp r4, 0x30
	bne _080FB654
	b _080FB8C0
_080FB654:
	cmp r4, 0x31
	bne _080FB65A
	b _080FB876
_080FB65A:
	b _080FB9C2
_080FB65C:
	cmp r4, 0x33
	bne _080FB662
	b _080FB8C8
_080FB662:
	cmp r4, 0x40
	bne _080FB668
	b _080FB97C
_080FB668:
	b _080FB9C2
_080FB66A:
	cmp r4, 0xF3
	bne _080FB670
	b _080FB98C
_080FB670:
	cmp r4, 0xF3
	bgt _080FB67C
	cmp r4, 0xF0
	bge _080FB67A
	b _080FB9C2
_080FB67A:
	b _080FB9A8
_080FB67C:
	cmp r4, 0xFF
	bne _080FB682
	b _080FB9A8
_080FB682:
	b _080FB9C2
_080FB684:
	ldr r1, _080FB68C @ =gUnknown_3005450
	movs r0, 0x11
	strh r0, [r1, 0x4]
	b _080FB9C2
	.align 2, 0
_080FB68C: .4byte gUnknown_3005450
_080FB690:
	movs r0, 0x4
	movs r1, 0
	bl sub_80FB9E4
	b _080FB9C2
_080FB69A:
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	bne _080FB758
	ldr r5, _080FB704 @ =gUnknown_3005450
	ldr r1, _080FB708 @ =0x00000991
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FB758
	ldr r0, _080FB70C @ =gUnknown_3005E10
	ldrh r0, [r0, 0x14]
	bl sub_80FB5A0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080FB722
	adds r0, r4, 0
	bl sub_80F886C
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1
	mov r12, r2
	mov r1, r12
	lsls r1, r0
	lsls r1, 24
	lsrs r1, 24
	ldr r7, _080FB710 @ =0x0000099e
	adds r6, r5, r7
	ldrb r2, [r6]
	cmp r2, 0
	bne _080FB714
	movs r0, 0x9A
	lsls r0, 4
	adds r3, r5, r0
	ldrb r0, [r3]
	cmp r0, 0
	bne _080FB714
	subs r7, 0x1
	adds r0, r5, r7
	strb r1, [r0]
	eors r1, r4
	orrs r1, r2
	strb r1, [r6]
	mov r0, r12
	strb r0, [r3]
	b _080FB722
	.align 2, 0
_080FB704: .4byte gUnknown_3005450
_080FB708: .4byte 0x00000991
_080FB70C: .4byte gUnknown_3005E10
_080FB710: .4byte 0x0000099e
_080FB714:
	ldr r0, _080FB744 @ =gUnknown_3005450
	ldr r1, _080FB748 @ =0x0000099e
	adds r0, r1
	ldrb r2, [r0]
	adds r1, r4, 0
	orrs r1, r2
	strb r1, [r0]
_080FB722:
	ldr r0, _080FB74C @ =gUnknown_3005E10
	ldrh r1, [r0, 0x14]
	cmp r4, r1
	beq _080FB772
	ldr r2, _080FB744 @ =gUnknown_3005450
	ldr r7, _080FB750 @ =0x0000099b
	adds r3, r2, r7
	adds r0, r4, 0
	eors r0, r1
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080FB754 @ =0x0000099c
	adds r2, r0
	movs r0, 0x2
	strb r0, [r2]
	b _080FB772
	.align 2, 0
_080FB744: .4byte gUnknown_3005450
_080FB748: .4byte 0x0000099e
_080FB74C: .4byte gUnknown_3005E10
_080FB750: .4byte 0x0000099b
_080FB754: .4byte 0x0000099c
_080FB758:
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x54
	bne _080FB772
	ldr r0, _080FB77C @ =gUnknown_3005E10
	ldrb r0, [r0]
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080FB772:
	ldr r0, _080FB77C @ =gUnknown_3005E10
	ldrh r0, [r0, 0x14]
	bl sub_80FB564
	b _080FB9C2
	.align 2, 0
_080FB77C: .4byte gUnknown_3005E10
_080FB780:
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	beq _080FB7B6
	ldr r4, _080FB7C8 @ =gUnknown_3005E10
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	bls _080FB7B6
	ldrb r0, [r4, 0x14]
	bl sub_80F886C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r0
	lsrs r1, 24
	ldrb r0, [r4]
	eors r1, r0
	adds r0, r1, 0
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
_080FB7B6:
	ldr r1, _080FB7CC @ =gUnknown_3005450
	ldrh r0, [r1, 0x4]
	cmp r0, 0xF
	beq _080FB7C0
	b _080FB9C2
_080FB7C0:
	movs r0, 0x10
	strh r0, [r1, 0x4]
	b _080FB9C2
	.align 2, 0
_080FB7C8: .4byte gUnknown_3005E10
_080FB7CC: .4byte gUnknown_3005450
_080FB7D0:
	ldr r0, _080FB7DC @ =gUnknown_3005450
	ldr r1, _080FB7E0 @ =gUnknown_3005E10
	ldrh r1, [r1, 0x14]
	ldr r2, _080FB7E4 @ =0x00000985
	adds r0, r2
	b _080FB9C0
	.align 2, 0
_080FB7DC: .4byte gUnknown_3005450
_080FB7E0: .4byte gUnknown_3005E10
_080FB7E4: .4byte 0x00000985
_080FB7E8:
	ldr r0, _080FB7F8 @ =gUnknown_3005450
	ldr r1, _080FB7FC @ =gUnknown_3005E10
	ldrh r1, [r1, 0x14]
	ldr r7, _080FB800 @ =0x000008f6
	adds r0, r7
	ldrb r2, [r0]
	b _080FB9C0
	.align 2, 0
_080FB7F8: .4byte gUnknown_3005450
_080FB7FC: .4byte gUnknown_3005E10
_080FB800: .4byte 0x000008f6
_080FB804:
	ldr r1, _080FB824 @ =gUnknown_3005450
	movs r0, 0x12
	strh r0, [r1, 0x4]
	ldr r0, _080FB828 @ =0x00000987
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x1
	bhi _080FB830
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _080FB82C @ =sub_80FC028
	movs r1, 0x2
	bl CreateTask
	b _080FB9C2
	.align 2, 0
_080FB824: .4byte gUnknown_3005450
_080FB828: .4byte 0x00000987
_080FB82C: .4byte sub_80FC028
_080FB830:
	movs r0, 0x2
	movs r1, 0x23
	bl sub_80FB9E4
	b _080FB9C2
_080FB83A:
	ldr r4, _080FB860 @ =gUnknown_3005450
	movs r0, 0xD
	strh r0, [r4, 0x4]
	movs r0, 0x3
	movs r1, 0
	bl sub_80FB9E4
	ldr r1, _080FB864 @ =0x000008f6
	adds r0, r4, r1
	ldrb r1, [r0]
	ldr r2, _080FB868 @ =0x000008f7
	adds r4, r2
	movs r0, 0x10
	adds r2, r4, 0
	movs r3, 0x46
	bl rfu_setRecvBuffer
	b _080FB9C2
	.align 2, 0
_080FB860: .4byte gUnknown_3005450
_080FB864: .4byte 0x000008f6
_080FB868: .4byte 0x000008f7
_080FB86C:
	movs r0, 0x2
	movs r1, 0x25
	bl sub_80FB9E4
	b _080FB9C2
_080FB876:
	ldr r0, _080FB88C @ =gUnknown_3005E10
	ldrb r1, [r0]
	ldrh r0, [r0, 0x14]
	ands r1, r0
	cmp r1, 0
	bne _080FB884
	b _080FB9C2
_080FB884:
	ldr r0, _080FB890 @ =gUnknown_3005450
	adds r0, 0xF0
	movs r1, 0x1
	b _080FB9C0
	.align 2, 0
_080FB88C: .4byte gUnknown_3005E10
_080FB890: .4byte gUnknown_3005450
_080FB894:
	ldr r2, _080FB8B4 @ =gUnknown_3005450
	adds r1, r2, 0
	adds r1, 0xF0
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _080FB8B8 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FB8AA
	b _080FB9C2
_080FB8AA:
	ldr r7, _080FB8BC @ =0x000008f4
	adds r0, r2, r7
	ldrb r1, [r0]
	movs r1, 0x1
	b _080FB9C0
	.align 2, 0
_080FB8B4: .4byte gUnknown_3005450
_080FB8B8: .4byte gUnknown_3007460
_080FB8BC: .4byte 0x000008f4
_080FB8C0:
	ldr r0, _080FB900 @ =gUnknown_3005450
	adds r0, 0xF0
	movs r1, 0x2
	strb r1, [r0]
_080FB8C8:
	ldr r2, _080FB900 @ =gUnknown_3005450
	adds r1, r2, 0
	adds r1, 0xF0
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _080FB8D8
	movs r0, 0x4
	strb r0, [r1]
_080FB8D8:
	ldrb r0, [r2, 0xC]
	cmp r0, 0x1
	bne _080FB916
	ldr r0, _080FB904 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FB934
	ldr r0, _080FB908 @ =0x0000099a
	adds r2, r0
	ldr r0, _080FB90C @ =gUnknown_3005E10
	ldrb r1, [r0, 0x14]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	cmp r0, 0
	bne _080FB910
	adds r0, r4, 0
	bl sub_80FB0E8
	b _080FB934
	.align 2, 0
_080FB900: .4byte gUnknown_3005450
_080FB904: .4byte gUnknown_3003F64
_080FB908: .4byte 0x0000099a
_080FB90C: .4byte gUnknown_3005E10
_080FB910:
	bl sub_80FB174
	b _080FB934
_080FB916:
	ldr r1, _080FB964 @ =0x0000099c
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080FB934
	ldr r0, _080FB968 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FB934
	adds r0, r4, 0
	bl sub_80FB0E8
	movs r0, 0
	bl sub_80FD760
_080FB934:
	ldr r0, _080FB96C @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080FB95A
	ldr r0, _080FB970 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	bne _080FB95A
	ldr r0, _080FB974 @ =sub_80F8B34
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FB95A
	ldr r1, _080FB978 @ =gUnknown_3005450
	movs r0, 0x11
	strh r0, [r1, 0x4]
_080FB95A:
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80FB9E4
	b _080FB9C2
	.align 2, 0
_080FB964: .4byte 0x0000099c
_080FB968: .4byte gUnknown_3003F64
_080FB96C: .4byte gUnknown_3007460
_080FB970: .4byte gUnknown_3005E10
_080FB974: .4byte sub_80F8B34
_080FB978: .4byte gUnknown_3005450
_080FB97C:
	ldr r0, _080FB984 @ =gUnknown_3005450
	ldr r2, _080FB988 @ =0x0000099b
	adds r0, r2
	b _080FB9BE
	.align 2, 0
_080FB984: .4byte gUnknown_3005450
_080FB988: .4byte 0x0000099b
_080FB98C:
	movs r0, 0x1
	movs r1, 0xF3
	bl sub_80FB9E4
	movs r0, 0xF3
	bl sub_80FB0E8
	ldr r0, _080FB9A4 @ =gUnknown_3005450
	adds r0, 0xEF
	movs r1, 0x1
	b _080FB9C0
	.align 2, 0
_080FB9A4: .4byte gUnknown_3005450
_080FB9A8:
	adds r0, r4, 0
	bl sub_80FB0E8
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80FB9E4
	ldr r0, _080FB9C8 @ =gUnknown_3005450
	ldr r7, _080FB9CC @ =0x00000993
	adds r0, r7
	ldrb r1, [r0]
_080FB9BE:
	movs r1, 0
_080FB9C0:
	strb r1, [r0]
_080FB9C2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB9C8: .4byte gUnknown_3005450
_080FB9CC: .4byte 0x00000993
	thumb_func_end sub_80FB5EC

	thumb_func_start sub_80FB9D0
sub_80FB9D0: @ 80FB9D0
	ldr r0, _080FB9DC @ =gUnknown_3005450
	ldr r1, _080FB9E0 @ =0x0000099c
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080FB9DC: .4byte gUnknown_3005450
_080FB9E0: .4byte 0x0000099c
	thumb_func_end sub_80FB9D0

	thumb_func_start sub_80FB9E4
sub_80FB9E4: @ 80FB9E4
	ldr r2, _080FB9F0 @ =gUnknown_3005450
	adds r3, r2, 0
	adds r3, 0xF1
	strb r0, [r3]
	strh r1, [r2, 0xA]
	bx lr
	.align 2, 0
_080FB9F0: .4byte gUnknown_3005450
	thumb_func_end sub_80FB9E4

	thumb_func_start sub_80FB9F4
sub_80FB9F4: @ 80FB9F4
	ldr r0, _080FB9FC @ =gUnknown_3005450
	adds r0, 0xF1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080FB9FC: .4byte gUnknown_3005450
	thumb_func_end sub_80FB9F4

	thumb_func_start sub_80FBA00
sub_80FBA00: @ 80FBA00
	push {lr}
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x1
	bls _080FBA14
	movs r0, 0
	b _080FBA16
_080FBA14:
	movs r0, 0x1
_080FBA16:
	pop {r1}
	bx r1
	thumb_func_end sub_80FBA00

	thumb_func_start sub_80FBA1C
sub_80FBA1C: @ 80FBA1C
	ldr r0, _080FBA28 @ =gUnknown_3005450
	movs r1, 0x9A
	lsls r1, 4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080FBA28: .4byte gUnknown_3005450
	thumb_func_end sub_80FBA1C

	thumb_func_start sub_80FBA2C
sub_80FBA2C: @ 80FBA2C
	ldr r0, _080FBA34 @ =gUnknown_3005450
	ldrb r0, [r0, 0xC]
	bx lr
	.align 2, 0
_080FBA34: .4byte gUnknown_3005450
	thumb_func_end sub_80FBA2C

	thumb_func_start RFUVSync
RFUVSync: @ 80FBA38
	push {lr}
	bl rfu_syncVBlank_
	pop {r0}
	bx r0
	thumb_func_end RFUVSync

	thumb_func_start sub_80FBA44
sub_80FBA44: @ 80FBA44
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _080FBA5C @ =gUnknown_3003ED0
	ldr r2, _080FBA60 @ =0x05000014
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080FBA5C: .4byte gUnknown_3003ED0
_080FBA60: .4byte 0x05000014
	thumb_func_end sub_80FBA44

	thumb_func_start sub_80FBA64
sub_80FBA64: @ 80FBA64
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80FBA64

	thumb_func_start sub_80FBA78
sub_80FBA78: @ 80FBA78
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl ResetPaletteFade
	ldr r0, _080FBAF4 @ =sub_80FBA64
	bl SetVBlankCallback
	bl sub_8009480
	lsls r0, 24
	cmp r0, 0
	beq _080FBAEC
	ldr r1, _080FBAF8 @ =gUnknown_202271A
	ldr r2, _080FBAFC @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_800B1F4
	bl sub_8009804
	ldr r0, _080FBB00 @ =gMain
	ldrh r0, [r0, 0x24]
	bl SeedRng
	movs r4, 0
_080FBAB4:
	bl Random
	ldr r1, _080FBB04 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	adds r1, 0xA
	adds r1, r4
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FBAB4
	movs r1, 0xAA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_80FBB20
	ldr r0, _080FBB08 @ =sub_80FBB74
	bl SetMainCallback2
_080FBAEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FBAF4: .4byte sub_80FBA64
_080FBAF8: .4byte gUnknown_202271A
_080FBAFC: .4byte 0x00001111
_080FBB00: .4byte gMain
_080FBB04: .4byte gSaveBlock2Ptr
_080FBB08: .4byte sub_80FBB74
	thumb_func_end sub_80FBA78

	thumb_func_start sub_80FBB0C
sub_80FBB0C: @ 80FBB0C
	push {lr}
	ldr r0, _080FBB1C @ =sub_80F8B34
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080FBB1C: .4byte sub_80F8B34
	thumb_func_end sub_80FBB0C

	thumb_func_start sub_80FBB20
sub_80FBB20: @ 80FBB20
	push {r4,lr}
	ldr r4, _080FBB44 @ =nullsub_89
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080FBB3E
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	ldr r1, _080FBB48 @ =gUnknown_3005450
	adds r1, 0x66
	strb r0, [r1]
_080FBB3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FBB44: .4byte nullsub_89
_080FBB48: .4byte gUnknown_3005450
	thumb_func_end sub_80FBB20

	thumb_func_start sub_80FBB4C
sub_80FBB4C: @ 80FBB4C
	push {lr}
	ldr r0, _080FBB6C @ =nullsub_89
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FBB66
	ldr r0, _080FBB70 @ =gUnknown_3005450
	adds r0, 0x66
	ldrb r0, [r0]
	bl DestroyTask
_080FBB66:
	pop {r0}
	bx r0
	.align 2, 0
_080FBB6C: .4byte nullsub_89
_080FBB70: .4byte gUnknown_3005450
	thumb_func_end sub_80FBB4C

	thumb_func_start sub_80FBB74
sub_80FBB74: @ 80FBB74
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80FBB74

	thumb_func_start sub_80FBB8C
sub_80FBB8C: @ 80FBB8C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r1, _080FBBC4 @ =gUnknown_3005450
	movs r0, 0x1
	strb r0, [r1, 0xC]
	bl sub_80FAF1C
	ldr r0, _080FBBC8 @ =sub_80FB184
	movs r1, 0
	bl sub_80FD430
	ldr r2, _080FBBCC @ =gUnknown_203ABF0
	adds r1, r2, 0
	ldr r0, _080FBBD0 @ =gUnknown_843EBB4
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldr r0, _080FBBD4 @ =gUnknown_843EBCC
	subs r4, 0x1
	adds r4, r0
	ldrb r0, [r4]
	strh r0, [r2, 0x2]
	bl sub_80F8E74
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBBC4: .4byte gUnknown_3005450
_080FBBC8: .4byte sub_80FB184
_080FBBCC: .4byte gUnknown_203ABF0
_080FBBD0: .4byte gUnknown_843EBB4
_080FBBD4: .4byte gUnknown_843EBCC
	thumb_func_end sub_80FBB8C

	thumb_func_start sub_80FBBD8
sub_80FBBD8: @ 80FBBD8
	push {lr}
	ldr r1, _080FBBF4 @ =gUnknown_3005450
	movs r0, 0
	strb r0, [r1, 0xC]
	bl sub_80FAF1C
	ldr r0, _080FBBF8 @ =sub_80FB37C
	ldr r1, _080FBBFC @ =sub_80F8D20
	bl sub_80FD430
	bl sub_80F8F10
	pop {r0}
	bx r0
	.align 2, 0
_080FBBF4: .4byte gUnknown_3005450
_080FBBF8: .4byte sub_80FB37C
_080FBBFC: .4byte sub_80F8D20
	thumb_func_end sub_80FBBD8

	thumb_func_start sub_80FBC00
sub_80FBC00: @ 80FBC00
	push {r4-r7,lr}
	ldr r0, _080FBC4C @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080FBC46
	ldr r4, _080FBC50 @ =gUnknown_3005450
	movs r5, 0
	movs r0, 0x2
	strb r0, [r4, 0xC]
	bl sub_80FAF1C
	ldr r0, _080FBC54 @ =sub_80FB5EC
	movs r1, 0
	bl sub_80FD430
	ldr r2, _080FBC58 @ =gUnknown_203ABF0
	adds r1, r2, 0
	ldr r0, _080FBC5C @ =gUnknown_843EBB4
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	strb r5, [r2, 0x11]
	movs r0, 0x96
	lsls r0, 2
	strh r0, [r2, 0x12]
	ldr r0, _080FBC60 @ =sub_80F8B34
	movs r1, 0x1
	bl CreateTask
	adds r4, 0x67
	strb r0, [r4]
_080FBC46:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FBC4C: .4byte gUnknown_203ADFA
_080FBC50: .4byte gUnknown_3005450
_080FBC54: .4byte sub_80FB5EC
_080FBC58: .4byte gUnknown_203ABF0
_080FBC5C: .4byte gUnknown_843EBB4
_080FBC60: .4byte sub_80F8B34
	thumb_func_end sub_80FBC00

	thumb_func_start sub_80FBC64
sub_80FBC64: @ 80FBC64
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	bx lr
	thumb_func_end sub_80FBC64

	thumb_func_start sub_80FBC70
sub_80FBC70: @ 80FBC70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	movs r0, 0xFF
	mov r9, r0
	movs r7, 0
	ldr r1, _080FBCF4 @ =gUnknown_3007460
	mov r8, r1
_080FBC8E:
	lsls r4, r7, 5
	adds r5, r4, 0
	adds r5, 0x14
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5
	adds r0, 0x8
	bl sub_80FBC64
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	ldrh r0, [r0, 0x18]
	bl sub_80FA44C
	cmp r0, 0
	beq _080FBCD8
	mov r0, r8
	ldr r1, [r0]
	adds r1, r5
	adds r1, 0x15
	ldr r0, [sp]
	bl StringCompare
	cmp r0, 0
	bne _080FBCD8
	cmp r10, r6
	bne _080FBCD8
	mov r9, r7
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	ldrb r0, [r0, 0x16]
	cmp r0, 0xFF
	bne _080FBCE2
_080FBCD8:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _080FBC8E
_080FBCE2:
	mov r0, r9
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FBCF4: .4byte gUnknown_3007460
	thumb_func_end sub_80FBC70

	thumb_func_start sub_80FBCF8
sub_80FBCF8: @ 80FBCF8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r0, r6, 24
	lsrs r0, 24
	bl rfu_REQ_disconnect
	bl rfu_waitREQComplete
	ldr r4, _080FBD3C @ =gUnknown_3005450
	ldr r0, _080FBD40 @ =0x0000099a
	adds r5, r4, r0
	ldrb r0, [r5]
	bics r0, r6
	strb r0, [r5]
	ldr r1, _080FBD44 @ =0x00000992
	adds r6, r4, r1
	ldrb r1, [r6]
	movs r0, 0x1
	bl rfu_clearSlot
	ldrb r0, [r5]
	ldr r1, _080FBD48 @ =0x0000093f
	adds r4, r1
	adds r1, r4, 0
	movs r2, 0x46
	bl rfu_UNI_setSendData
	ldrb r0, [r5]
	bl sub_80F886C
	strb r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBD3C: .4byte gUnknown_3005450
_080FBD40: .4byte 0x0000099a
_080FBD44: .4byte 0x00000992
_080FBD48: .4byte 0x0000093f
	thumb_func_end sub_80FBCF8

	thumb_func_start sub_80FBD4C
sub_80FBD4C: @ 80FBD4C
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80FBC70
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080FBD66
	movs r0, 0x1
	lsls r0, r1
	bl sub_80FBCF8
_080FBD66:
	pop {r0}
	bx r0
	thumb_func_end sub_80FBD4C

	thumb_func_start sub_80FBD6C
sub_80FBD6C: @ 80FBD6C
	push {r4-r6,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _080FBDAC
	movs r3, 0
	movs r2, 0
	ldr r5, _080FBDB4 @ =gUnknown_3005DE6
	adds r6, r5, 0x4
_080FBD7C:
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r4
	bne _080FBD9A
	ldrb r0, [r6]
	asrs r0, r2
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FBD9A
	adds r0, r1, 0
	lsls r0, r2
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
_080FBD9A:
	adds r2, 0x1
	cmp r2, 0x3
	ble _080FBD7C
	cmp r3, 0
	beq _080FBDAC
	adds r0, r3, 0
	movs r1, 0x2
	bl sub_80FBE20
_080FBDAC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBDB4: .4byte gUnknown_3005DE6
	thumb_func_end sub_80FBD6C

	thumb_func_start sub_80FBDB8
sub_80FBDB8: @ 80FBDB8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _080FBE10 @ =gUnknown_3003F50
	ldrh r0, [r6]
	cmp r0, 0
	bne _080FBE08
	ldr r5, _080FBE14 @ =gUnknown_3005450
	movs r1, 0x9A
	lsls r1, 4
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FBE08
	movs r0, 0xED
	lsls r0, 8
	bl sub_80F9D04
	ldr r1, _080FBE18 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	strh r1, [r6, 0x2]
	ldrh r1, [r0, 0xA]
	strh r1, [r6, 0x4]
	ldr r1, _080FBE1C @ =gUnknown_843EC41
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r0, r1
	ldrb r1, [r5, 0xD]
	ldrb r0, [r0]
	subs r1, r0
	strb r1, [r5, 0xD]
	ldrb r0, [r5, 0xD]
	strh r0, [r6, 0x6]
	adds r0, r4, 0
	bl DestroyTask
_080FBE08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBE10: .4byte gUnknown_3003F50
_080FBE14: .4byte gUnknown_3005450
_080FBE18: .4byte gTasks
_080FBE1C: .4byte gUnknown_843EC41
	thumb_func_end sub_80FBDB8

	thumb_func_start sub_80FBE20
sub_80FBE20: @ 80FBE20
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	ldr r5, _080FBE50 @ =sub_80FBDB8
	adds r0, r5, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080FBE58
	adds r0, r5, 0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080FBE54 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _080FBE68
	.align 2, 0
_080FBE50: .4byte sub_80FBDB8
_080FBE54: .4byte gTasks
_080FBE58:
	ldr r0, _080FBE7C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	orrs r4, r0
	strh r4, [r1, 0x8]
_080FBE68:
	ldr r1, _080FBE7C @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0xA]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBE7C: .4byte gTasks
	thumb_func_end sub_80FBE20

	thumb_func_start sub_80FBE80
sub_80FBE80: @ 80FBE80
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080FBED8 @ =gTasks+0x8
	adds r4, r0, r1
	bl sub_80F8EA4
	lsls r0, 24
	cmp r0, 0
	beq _080FBF30
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_80FBC64
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80FBC70
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080FBF18
	ldr r0, _080FBEDC @ =gUnknown_3007460
	ldr r0, [r0]
	lsls r1, r2, 5
	adds r0, r1
	ldrb r0, [r0, 0x16]
	cmp r0, 0xFF
	beq _080FBEE8
	ldr r0, _080FBEE0 @ =gUnknown_3005450
	ldr r1, _080FBEE4 @ =0x000008f5
	adds r0, r1
	strb r2, [r0]
	bl sub_80F8ECC
	cmp r0, 0
	beq _080FBF36
	b _080FBF10
	.align 2, 0
_080FBED8: .4byte gTasks+0x8
_080FBEDC: .4byte gUnknown_3007460
_080FBEE0: .4byte gUnknown_3005450
_080FBEE4: .4byte 0x000008f5
_080FBEE8:
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r5, 0x7F
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0x15
	beq _080FBF30
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0x16
	beq _080FBF30
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_80FB9E4
_080FBF10:
	adds r0, r6, 0
	bl DestroyTask
	b _080FBF36
_080FBF18:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	ldr r0, _080FBF28 @ =gUnknown_3005450
	ldr r1, _080FBF2C @ =0x000008f5
	adds r0, r1
	strb r2, [r0]
	b _080FBF36
	.align 2, 0
_080FBF28: .4byte gUnknown_3005450
_080FBF2C: .4byte 0x000008f5
_080FBF30:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
_080FBF36:
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF0
	ble _080FBF4E
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_80FB9E4
	adds r0, r6, 0
	bl DestroyTask
_080FBF4E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80FBE80

	thumb_func_start sub_80FBF54
sub_80FBF54: @ 80FBF54
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	ldr r0, _080FBF8C @ =gUnknown_3005450
	adds r0, 0xF1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080FBF90 @ =sub_80FBE80
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080FBF94 @ =gTasks+0x8
	adds r4, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl StringCopy
	strh r5, [r4, 0x10]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBF8C: .4byte gUnknown_3005450
_080FBF90: .4byte sub_80FBE80
_080FBF94: .4byte gTasks+0x8
	thumb_func_end sub_80FBF54

	thumb_func_start sub_80FBF98
sub_80FBF98: @ 80FBF98
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	bl sub_80F9800
	ldrb r1, [r0, 0xA]
	movs r2, 0x7F
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0x45
	bne _080FBFBE
	ldrb r1, [r4, 0xA]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0x45
	beq _080FC01E
_080FBFBA:
	movs r0, 0x1
	b _080FC020
_080FBFBE:
	ldrb r1, [r4, 0xA]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0x40
	bne _080FBFBA
	cmp r5, 0x44
	bne _080FC01E
	ldr r5, _080FBFEC @ =gUnknown_300555A
	ldrh r0, [r5, 0x8]
	ldr r3, _080FBFF0 @ =0x000003ff
	adds r2, r3, 0
	ands r2, r0
	movs r0, 0xCE
	lsls r0, 1
	cmp r2, r0
	bne _080FBFF4
	ldrh r1, [r4, 0x8]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, r2
	beq _080FC01E
	b _080FBFBA
	.align 2, 0
_080FBFEC: .4byte gUnknown_300555A
_080FBFF0: .4byte 0x000003ff
_080FBFF4:
	ldrh r1, [r4, 0x8]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, r2
	bne _080FBFBA
	ldrb r2, [r4, 0xB]
	movs r0, 0xFE
	ldrb r3, [r5, 0xB]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _080FBFBA
	ldrb r2, [r4, 0x9]
	movs r0, 0xFC
	ldrb r3, [r5, 0x9]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _080FBFBA
_080FC01E:
	movs r0, 0
_080FC020:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FBF98

	thumb_func_start sub_80FC028
sub_80FC028: @ 80FC028
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	mov r8, r5
	ldr r6, _080FC0E0 @ =gUnknown_3005450
	adds r0, r6, 0
	adds r0, 0xF1
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _080FC046
	adds r0, r5, 0
	bl DestroyTask
_080FC046:
	ldr r1, _080FC0E4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 17
	cmp r0, r1
	ble _080FC070
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_80FB9E4
	adds r0, r5, 0
	bl DestroyTask
_080FC070:
	ldr r1, _080FC0E8 @ =0x00000985
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FC108
	ldr r0, _080FC0EC @ =gUnknown_3005E10
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _080FC108
	movs r2, 0x86
	lsls r2, 1
	adds r0, r6, r2
	bl sub_80FBC64
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080FC0F0 @ =0x00000119
	adds r0, r6, r2
	bl sub_80FBC70
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080FC108
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	ldr r7, _080FC0F4 @ =gUnknown_3007460
	lsls r4, r2, 5
	adds r2, r4, 0
	adds r2, 0x14
	ldr r1, [r7]
	adds r1, r2
	adds r1, 0x6
	bl sub_80FBF98
	cmp r0, 0
	bne _080FC0F8
	ldr r0, [r7]
	adds r1, r0, r4
	ldrb r0, [r1, 0x16]
	cmp r0, 0xFF
	beq _080FC108
	ldrh r0, [r1, 0x14]
	movs r1, 0x5A
	bl sub_80FD610
	lsls r0, 24
	cmp r0, 0
	bne _080FC108
	movs r0, 0xA
	strh r0, [r6, 0x4]
	adds r0, r5, 0
	bl DestroyTask
	b _080FC108
	.align 2, 0
_080FC0E0: .4byte gUnknown_3005450
_080FC0E4: .4byte gTasks
_080FC0E8: .4byte 0x00000985
_080FC0EC: .4byte gUnknown_3005E10
_080FC0F0: .4byte 0x00000119
_080FC0F4: .4byte gUnknown_3007460
_080FC0F8:
	movs r1, 0xE0
	lsls r1, 7
	movs r0, 0x2
	bl sub_80FB9E4
	mov r0, r8
	bl DestroyTask
_080FC108:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FC028

	thumb_func_start sub_80FC114
sub_80FC114: @ 80FC114
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	ldr r6, _080FC184 @ =gUnknown_3005450
	ldr r1, _080FC188 @ =0x00000987
	adds r0, r6, r1
	movs r7, 0
	strb r7, [r0]
	adds r0, r6, 0
	adds r0, 0xF1
	strb r7, [r0]
	ldr r1, _080FC18C @ =0x00000119
	adds r0, r6, r1
	adds r1, r3, 0
	bl StringCopy
	movs r1, 0x85
	lsls r1, 1
	adds r0, r6, r1
	adds r1, r5, 0
	movs r2, 0xD
	bl memcpy
	bl sub_80FEB3C
	ldr r0, _080FC190 @ =sub_80FC028
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080FC194 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	strh r4, [r1, 0xA]
	ldr r0, _080FC198 @ =sub_80F8B34
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r4, 0x45
	bne _080FC19C
	cmp r1, 0xFF
	beq _080FC1AA
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x1
	strh r1, [r0, 0x16]
	b _080FC1AA
	.align 2, 0
_080FC184: .4byte gUnknown_3005450
_080FC188: .4byte 0x00000987
_080FC18C: .4byte 0x00000119
_080FC190: .4byte sub_80FC028
_080FC194: .4byte gTasks
_080FC198: .4byte sub_80F8B34
_080FC19C:
	cmp r2, 0xFF
	beq _080FC1AA
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r5
	strh r7, [r0, 0x16]
_080FC1AA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FC114

	thumb_func_start sub_80FC1B0
sub_80FC1B0: @ 80FC1B0
	push {lr}
	ldr r0, _080FC1C0 @ =gUnknown_3005450
	adds r0, 0xF0
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080FC1C4
	movs r0, 0
	b _080FC1C6
	.align 2, 0
_080FC1C0: .4byte gUnknown_3005450
_080FC1C4:
	movs r0, 0x1
_080FC1C6:
	pop {r1}
	bx r1
	thumb_func_end sub_80FC1B0

	thumb_func_start sub_80FC1CC
sub_80FC1CC: @ 80FC1CC
	push {r4,lr}
	movs r1, 0
	ldr r0, _080FC1F0 @ =gUnknown_3005E10
	ldrb r2, [r0]
	ldr r4, _080FC1F4 @ =gUnknown_3005DD9
	movs r3, 0x1
_080FC1D8:
	adds r0, r2, 0
	asrs r0, r1
	ands r0, r3
	cmp r0, 0
	beq _080FC1F8
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FC1F8
	movs r0, 0
	b _080FC200
	.align 2, 0
_080FC1F0: .4byte gUnknown_3005E10
_080FC1F4: .4byte gUnknown_3005DD9
_080FC1F8:
	adds r1, 0x1
	cmp r1, 0x3
	ble _080FC1D8
	movs r0, 0x1
_080FC200:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FC1CC

	thumb_func_start sub_80FC208
sub_80FC208: @ 80FC208
	push {r4,lr}
	movs r4, 0
_080FC20C:
	lsls r2, r4, 24
	lsrs r2, 24
	ldr r0, _080FC224 @ =gUnknown_843EE28
	movs r1, 0
	bl nullsub_87
	adds r4, 0x1
	cmp r4, 0x13
	ble _080FC20C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC224: .4byte gUnknown_843EE28
	thumb_func_end sub_80FC208

	thumb_func_start sub_80FC228
sub_80FC228: @ 80FC228
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1C
	movs r2, 0x13
	movs r3, 0x2
	bl nullsub_88
	ldr r4, _080FC2F8 @ =gUnknown_3007460
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	movs r1, 0x14
	movs r2, 0x1
	movs r3, 0x1
	bl nullsub_88
	ldr r0, [r4]
	ldrb r0, [r0, 0x3]
	movs r1, 0x17
	movs r2, 0x1
	movs r3, 0x1
	bl nullsub_88
	ldr r0, _080FC2FC @ =gUnknown_3005450
	ldrb r0, [r0, 0xC]
	cmp r0, 0x1
	bne _080FC304
	movs r6, 0
	adds r7, r4, 0
	movs r5, 0x14
_080FC26C:
	ldr r2, [r7]
	ldrb r0, [r2, 0x7]
	asrs r0, r6
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FC2AA
	lsls r0, r6, 5
	adds r0, r2, r0
	ldrh r0, [r0, 0x18]
	adds r4, r6, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, [r7]
	adds r0, r5
	adds r0, 0x6
	movs r1, 0x6
	adds r2, r4, 0
	bl nullsub_87
	ldr r0, [r7]
	adds r0, r5
	adds r0, 0x15
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_87
_080FC2AA:
	adds r5, 0x20
	adds r6, 0x1
	cmp r6, 0x3
	ble _080FC26C
	movs r6, 0
	ldr r0, _080FC2FC @ =gUnknown_3005450
	mov r8, r0
_080FC2B8:
	movs r5, 0
	adds r7, r6, 0x1
	lsls r0, r6, 3
	adds r2, r6, 0
	adds r2, 0xB
	subs r0, r6
	lsls r0, 1
	mov r1, r8
	adds r1, 0x14
	adds r4, r0, r1
	lsls r6, r2, 24
_080FC2CE:
	ldrb r0, [r4]
	lsls r1, r5, 25
	lsrs r1, 24
	lsrs r2, r6, 24
	movs r3, 0x2
	bl nullsub_88
	adds r4, 0x1
	adds r5, 0x1
	cmp r5, 0xD
	ble _080FC2CE
	adds r6, r7, 0
	cmp r6, 0x3
	ble _080FC2B8
	ldr r0, _080FC300 @ =gUnknown_843EE64	"NOWSLOT"
	movs r1, 0x1
	movs r2, 0xF
	bl nullsub_87
	b _080FC436
	.align 2, 0
_080FC2F8: .4byte gUnknown_3007460
_080FC2FC: .4byte gUnknown_3005450
_080FC300: .4byte gUnknown_843EE64
_080FC304:
	ldr r1, [r4]
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _080FC3A0
	ldrb r0, [r1, 0x7]
	cmp r0, 0
	beq _080FC3A0
	movs r6, 0
	movs r5, 0xC0
	lsls r5, 18
_080FC318:
	lsrs r4, r5, 24
	movs r0, 0
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, _080FC38C @ =gUnknown_843EE47
	movs r1, 0x6
	adds r2, r4, 0
	bl nullsub_87
	ldr r0, _080FC390 @ =gUnknown_843EE57
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_87
	movs r1, 0x80
	lsls r1, 17
	adds r5, r1
	adds r6, 0x1
	cmp r6, 0x3
	ble _080FC318
	ldr r5, _080FC394 @ =gUnknown_3007460
	ldr r1, [r5]
	ldr r4, _080FC398 @ =gUnknown_3005450
	ldr r0, _080FC39C @ =0x000008f6
	adds r4, r0
	ldrb r0, [r4]
	lsls r0, 5
	adds r1, r0
	ldrh r0, [r1, 0x18]
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x4
	bl nullsub_88
	ldrb r1, [r4]
	lsls r1, 5
	adds r1, 0x14
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x6
	movs r1, 0x6
	movs r2, 0x3
	bl nullsub_87
	ldrb r1, [r4]
	lsls r1, 5
	adds r1, 0x14
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x15
	movs r1, 0x16
	movs r2, 0x3
	bl nullsub_87
	b _080FC436
	.align 2, 0
_080FC38C: .4byte gUnknown_843EE47
_080FC390: .4byte gUnknown_843EE57
_080FC394: .4byte gUnknown_3007460
_080FC398: .4byte gUnknown_3005450
_080FC39C: .4byte 0x000008f6
_080FC3A0:
	movs r6, 0
	ldr r1, _080FC440 @ =gUnknown_3007460
	ldr r0, [r1]
	ldrb r0, [r0, 0x8]
	cmp r6, r0
	bge _080FC3FC
	adds r7, r1, 0
	movs r1, 0x14
	mov r8, r1
_080FC3B2:
	ldr r0, [r7]
	lsls r5, r6, 5
	adds r1, r0, r5
	ldrb r0, [r1, 0x16]
	cmp r0, 0xFF
	beq _080FC3EE
	ldrh r0, [r1, 0x18]
	adds r4, r6, 0x3
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, [r7]
	adds r0, r5
	ldrh r0, [r0, 0x14]
	movs r1, 0x6
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, [r7]
	add r0, r8
	adds r0, 0x15
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_87
_080FC3EE:
	movs r0, 0x20
	add r8, r0
	adds r6, 0x1
	ldr r0, [r7]
	ldrb r0, [r0, 0x8]
	cmp r6, r0
	blt _080FC3B2
_080FC3FC:
	cmp r6, 0x3
	bgt _080FC436
	lsls r0, r6, 24
	movs r1, 0xC0
	lsls r1, 18
	adds r5, r0, r1
_080FC408:
	lsrs r4, r5, 24
	movs r0, 0
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x4
	bl nullsub_88
	ldr r0, _080FC444 @ =gUnknown_843EE47
	movs r1, 0x6
	adds r2, r4, 0
	bl nullsub_87
	ldr r0, _080FC448 @ =gUnknown_843EE57
	movs r1, 0x16
	adds r2, r4, 0
	bl nullsub_87
	movs r0, 0x80
	lsls r0, 17
	adds r5, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _080FC408
_080FC436:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC440: .4byte gUnknown_3007460
_080FC444: .4byte gUnknown_843EE47
_080FC448: .4byte gUnknown_843EE57
	thumb_func_end sub_80FC228

	thumb_func_start sub_80FC44C
sub_80FC44C: @ 80FC44C
	ldr r0, _080FC458 @ =gUnknown_3005450
	ldr r1, _080FC45C @ =0x000008d2
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080FC458: .4byte gUnknown_3005450
_080FC45C: .4byte 0x000008d2
	thumb_func_end sub_80FC44C

	thumb_func_start sub_80FC460
sub_80FC460: @ 80FC460
	ldr r0, _080FC46C @ =gUnknown_3005450
	ldr r1, _080FC470 @ =0x0000069e
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080FC46C: .4byte gUnknown_3005450
_080FC470: .4byte 0x0000069e
	thumb_func_end sub_80FC460

	thumb_func_start nullsub_89
nullsub_89: @ 80FC474
	bx lr
	thumb_func_end nullsub_89

	thumb_func_start sub_80FC478
sub_80FC478: @ 80FC478
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r0, 0
	movs r4, 0
	movs r5, 0x46
_080FC482:
	adds r2, r0, 0x1
	movs r1, 0x45
	muls r0, r5
	adds r0, r3
	adds r0, 0x45
_080FC48C:
	strb r4, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _080FC48C
	adds r0, r2, 0
	cmp r0, 0x13
	ble _080FC482
	movs r1, 0
	ldr r2, _080FC4C8 @ =0x00000579
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	movs r2, 0xAF
	lsls r2, 3
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _080FC4CC @ =0x0000057a
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _080FC4D0 @ =0x0000057b
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FC4C8: .4byte 0x00000579
_080FC4CC: .4byte 0x0000057a
_080FC4D0: .4byte 0x0000057b
	thumb_func_end sub_80FC478

	thumb_func_start sub_80FC4D4
sub_80FC4D4: @ 80FC4D4
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0
	movs r4, 0
_080FC4DC:
	lsls r0, r1, 3
	adds r2, r1, 0x1
	subs r0, r1
	movs r1, 0xD
	lsls r0, 1
	adds r0, r3
	adds r0, 0xD
_080FC4EA:
	strb r4, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _080FC4EA
	adds r1, r2, 0
	cmp r1, 0x27
	ble _080FC4DC
	movs r1, 0
	ldr r2, _080FC524 @ =0x00000231
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	movs r2, 0x8C
	lsls r2, 2
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _080FC528 @ =0x00000232
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _080FC52C @ =0x00000233
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC524: .4byte 0x00000231
_080FC528: .4byte 0x00000232
_080FC52C: .4byte 0x00000233
	thumb_func_end sub_80FC4D4

	thumb_func_start sub_80FC530
sub_80FC530: @ 80FC530
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0
	movs r4, 0
_080FC538:
	lsls r0, r1, 8
	adds r2, r1, 0x1
	movs r1, 0xFF
	adds r0, r3
	adds r0, 0xFF
_080FC542:
	strb r4, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _080FC542
	adds r1, r2, 0
	cmp r1, 0x1
	ble _080FC538
	movs r1, 0
	ldr r2, _080FC57C @ =0x00000201
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	movs r2, 0x80
	lsls r2, 2
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _080FC580 @ =0x00000202
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r2, _080FC584 @ =0x00000203
	adds r0, r3, r2
	ldrb r2, [r0]
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC57C: .4byte 0x00000201
_080FC580: .4byte 0x00000202
_080FC584: .4byte 0x00000203
	thumb_func_end sub_80FC530

	thumb_func_start sub_80FC588
sub_80FC588: @ 80FC588
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _080FC620 @ =0x0000057a
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x13
	bhi _080FC628
	ldr r0, _080FC624 @ =0x04000208
	ldrh r1, [r0]
	adds r7, r1, 0
	movs r1, 0
	strh r1, [r0]
	movs r3, 0
	movs r2, 0
_080FC5A6:
	adds r1, r6, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _080FC5BA
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080FC5BA
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080FC5BA:
	adds r2, 0xE
	cmp r2, 0x45
	ble _080FC5A6
	cmp r3, 0x5
	beq _080FC618
	movs r2, 0
	movs r0, 0xAF
	lsls r0, 3
	adds r3, r5, r0
	movs r4, 0x46
_080FC5CE:
	ldrb r0, [r3]
	adds r1, r0, 0
	muls r1, r4
	adds r1, r2, r1
	adds r1, r5, r1
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x45
	ble _080FC5CE
	movs r1, 0xAF
	lsls r1, 3
	adds r4, r5, r1
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0x14
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r0, _080FC620 @ =0x0000057a
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r1, 0
	adds r0, r6, 0
	adds r0, 0x45
_080FC610:
	strb r1, [r0]
	subs r0, 0x1
	cmp r0, r6
	bge _080FC610
_080FC618:
	ldr r0, _080FC624 @ =0x04000208
	strh r7, [r0]
	b _080FC632
	.align 2, 0
_080FC620: .4byte 0x0000057a
_080FC624: .4byte 0x04000208
_080FC628:
	ldr r1, _080FC638 @ =0x0000057b
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
_080FC632:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC638: .4byte 0x0000057b
	thumb_func_end sub_80FC588

	thumb_func_start sub_80FC63C
sub_80FC63C: @ 80FC63C
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	ldr r1, _080FC6CC @ =0x00000232
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0x27
	bhi _080FC6D4
	ldr r1, _080FC6D0 @ =0x04000208
	ldrh r0, [r1]
	adds r7, r0, 0
	movs r0, 0
	strh r0, [r1]
	movs r2, 0
	ldrb r0, [r5]
	cmp r0, 0
	bne _080FC66C
_080FC65E:
	adds r2, 0x1
	cmp r2, 0xD
	bgt _080FC66C
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FC65E
_080FC66C:
	cmp r2, 0xE
	beq _080FC6C4
	movs r2, 0
	movs r0, 0x8C
	lsls r0, 2
	adds r3, r6, r0
_080FC678:
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r2, r0
	adds r0, r6, r0
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0xD
	ble _080FC678
	movs r1, 0x8C
	lsls r1, 2
	adds r4, r6, r1
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0x28
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r0, _080FC6CC @ =0x00000232
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r1, 0
	adds r0, r5, 0
	adds r0, 0xD
_080FC6BC:
	strb r1, [r0]
	subs r0, 0x1
	cmp r0, r5
	bge _080FC6BC
_080FC6C4:
	ldr r0, _080FC6D0 @ =0x04000208
	strh r7, [r0]
	b _080FC6DE
	.align 2, 0
_080FC6CC: .4byte 0x00000232
_080FC6D0: .4byte 0x04000208
_080FC6D4:
	ldr r1, _080FC6E4 @ =0x00000233
	adds r0, r6, r1
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
_080FC6DE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC6E4: .4byte 0x00000233
	thumb_func_end sub_80FC63C

	thumb_func_start sub_80FC6E8
sub_80FC6E8: @ 80FC6E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r3, r1, 0
	ldr r1, _080FC730 @ =0x04000208
	ldrh r0, [r1]
	mov r8, r0
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xAF
	lsls r1, 3
	adds r0, r5, r1
	ldr r7, _080FC734 @ =0x00000579
	adds r4, r5, r7
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	beq _080FC718
	ldr r1, _080FC738 @ =0x0000057b
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FC73C
_080FC718:
	movs r1, 0
	adds r0, r3, 0
	adds r0, 0x45
_080FC71E:
	strb r1, [r0]
	subs r0, 0x1
	cmp r0, r3
	bge _080FC71E
	ldr r0, _080FC730 @ =0x04000208
	mov r7, r8
	strh r7, [r0]
	movs r0, 0
	b _080FC784
	.align 2, 0
_080FC730: .4byte 0x04000208
_080FC734: .4byte 0x00000579
_080FC738: .4byte 0x0000057b
_080FC73C:
	movs r2, 0
	movs r6, 0x46
_080FC740:
	adds r1, r3, r2
	ldrb r0, [r4]
	adds r7, r0, 0
	muls r7, r6
	adds r0, r7, 0
	adds r0, r2, r0
	adds r0, r5, r0
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x45
	ble _080FC740
	ldr r0, _080FC790 @ =0x00000579
	adds r4, r5, r0
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0x14
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r7, _080FC794 @ =0x0000057a
	adds r1, r5, r7
	ldrb r0, [r1]
	subs r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, _080FC798 @ =0x04000208
	mov r1, r8
	strh r1, [r0]
	movs r0, 0x1
_080FC784:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FC790: .4byte 0x00000579
_080FC794: .4byte 0x0000057a
_080FC798: .4byte 0x04000208
	thumb_func_end sub_80FC6E8

	thumb_func_start sub_80FC79C
sub_80FC79C: @ 80FC79C
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r1, 0x8C
	lsls r1, 2
	adds r0, r5, r1
	adds r1, 0x1
	adds r4, r5, r1
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	beq _080FC7C0
	ldr r1, _080FC7C4 @ =0x00000233
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r2, r0, 0
	cmp r2, 0
	beq _080FC7C8
_080FC7C0:
	movs r0, 0
	b _080FC814
	.align 2, 0
_080FC7C4: .4byte 0x00000233
_080FC7C8:
	ldr r1, _080FC81C @ =0x04000208
	ldrh r0, [r1]
	adds r7, r0, 0
	strh r2, [r1]
	movs r3, 0
_080FC7D2:
	adds r2, r6, r3
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r3, r0
	adds r0, r5, r0
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, 0x1
	cmp r3, 0xD
	ble _080FC7D2
	ldr r0, _080FC820 @ =0x00000231
	adds r4, r5, r0
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0x28
	bl __umodsi3
	ldrb r1, [r4]
	strb r0, [r4]
	ldr r0, _080FC824 @ =0x00000232
	adds r1, r5, r0
	ldrb r0, [r1]
	subs r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, _080FC81C @ =0x04000208
	strh r7, [r0]
	movs r0, 0x1
_080FC814:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FC81C: .4byte 0x04000208
_080FC820: .4byte 0x00000231
_080FC824: .4byte 0x00000232
	thumb_func_end sub_80FC79C

	thumb_func_start sub_80FC828
sub_80FC828: @ 80FC828
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _080FC83E
	adds r0, r2, 0
	movs r1, 0
	bl sub_80FC888
	b _080FC880
_080FC83E:
	movs r3, 0
_080FC840:
	ldrb r1, [r2, 0x1C]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r3, r0
	adds r0, r2, r0
	adds r1, r4, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0xD
	ble _080FC840
	ldrb r0, [r2, 0x1C]
	adds r0, 0x1
	ldrb r1, [r2, 0x1C]
	strb r0, [r2, 0x1C]
	ldrb r1, [r2, 0x1C]
	movs r0, 0x1
	ands r0, r1
	ldrb r1, [r2, 0x1C]
	strb r0, [r2, 0x1C]
	ldrb r0, [r2, 0x1E]
	cmp r0, 0x1
	bhi _080FC87A
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	ldrb r1, [r2, 0x1E]
	strb r0, [r2, 0x1E]
	b _080FC880
_080FC87A:
	ldrb r0, [r2, 0x1C]
	ldrb r1, [r2, 0x1D]
	strb r0, [r2, 0x1D]
_080FC880:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FC828

	thumb_func_start sub_80FC888
sub_80FC888: @ 80FC888
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	ldrb r0, [r3, 0x1E]
	cmp r0, 0
	bne _080FC898
	movs r0, 0
	b _080FC8D2
_080FC898:
	cmp r5, 0
	beq _080FC8B6
	movs r4, 0
_080FC89E:
	adds r2, r5, r4
	ldrb r1, [r3, 0x1D]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r4, r0
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r2]
	adds r4, 0x1
	cmp r4, 0xD
	ble _080FC89E
_080FC8B6:
	ldrb r0, [r3, 0x1D]
	adds r0, 0x1
	ldrb r1, [r3, 0x1D]
	strb r0, [r3, 0x1D]
	ldrb r1, [r3, 0x1D]
	movs r0, 0x1
	ands r0, r1
	ldrb r1, [r3, 0x1D]
	strb r0, [r3, 0x1D]
	ldrb r0, [r3, 0x1E]
	subs r0, 0x1
	ldrb r1, [r3, 0x1E]
	strb r0, [r3, 0x1E]
	movs r0, 0x1
_080FC8D2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FC888

	thumb_func_start sub_80FC8D8
sub_80FC8D8: @ 80FC8D8
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	ldr r1, _080FC92C @ =0x00000202
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _080FC930
	movs r2, 0
	movs r0, 0x80
	lsls r0, 2
	adds r4, r3, r0
_080FC8F0:
	ldrb r0, [r4]
	lsls r0, 8
	adds r0, r2, r0
	adds r0, r3, r0
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0xFF
	ble _080FC8F0
	movs r0, 0x80
	lsls r0, 2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldrb r2, [r1]
	movs r0, 0x1
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, _080FC92C @ =0x00000202
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	b _080FC93A
	.align 2, 0
_080FC92C: .4byte 0x00000202
_080FC930:
	ldr r1, _080FC940 @ =0x00000203
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
_080FC93A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FC940: .4byte 0x00000203
	thumb_func_end sub_80FC8D8

	thumb_func_start sub_80FC944
sub_80FC944: @ 80FC944
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	movs r1, 0x80
	lsls r1, 2
	adds r0, r3, r1
	adds r1, 0x1
	adds r4, r3, r1
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	beq _080FC966
	ldr r1, _080FC96C @ =0x00000203
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FC970
_080FC966:
	movs r0, 0
	b _080FC9AA
	.align 2, 0
_080FC96C: .4byte 0x00000203
_080FC970:
	movs r2, 0
_080FC972:
	adds r0, r5, r2
	ldrb r1, [r4]
	lsls r1, 8
	adds r1, r2, r1
	adds r1, r3, r1
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0xFF
	ble _080FC972
	ldr r0, _080FC9B0 @ =0x00000201
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	ldrb r2, [r1]
	movs r0, 0x1
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r0, _080FC9B4 @ =0x00000202
	adds r1, r3, r0
	ldrb r0, [r1]
	subs r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0x1
_080FC9AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080FC9B0: .4byte 0x00000201
_080FC9B4: .4byte 0x00000202
	thumb_func_end sub_80FC944

	thumb_func_start sub_80FC9B8
sub_80FC9B8: @ 80FC9B8
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	movs r5, 0
	cmp r1, 0x1
	beq _080FC9F6
	cmp r1, 0x1
	bgt _080FC9D2
	cmp r1, 0
	beq _080FC9DC
	b _080FCA6A
_080FC9D2:
	cmp r0, 0x2
	beq _080FCA16
	cmp r0, 0x3
	beq _080FCA36
	b _080FCA6A
_080FC9DC:
	movs r4, 0
_080FC9DE:
	adds r0, r6, r4
	adds r1, r4, 0x1
	strb r1, [r0]
	lsls r0, r5, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, r1, 0
	cmp r4, 0xC7
	ble _080FC9DE
	b _080FCA30
_080FC9F6:
	movs r4, 0
	adds r2, r6, 0
	adds r2, 0xC8
_080FC9FC:
	adds r0, r6, r4
	adds r1, r4, 0x1
	strb r1, [r0]
	lsls r0, r5, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, r1, 0
	cmp r4, 0x63
	ble _080FC9FC
	strh r5, [r2]
	b _080FCA6A
_080FCA16:
	movs r4, 0
_080FCA18:
	bl Random
	lsls r0, 24
	lsrs r0, 24
	adds r1, r6, r4
	strb r0, [r1]
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	cmp r4, 0xC7
	ble _080FCA18
_080FCA30:
	adds r0, r6, r4
	strh r5, [r0]
	b _080FCA6A
_080FCA36:
	movs r4, 0
	ldr r3, _080FCA70 @ =gUnknown_3002018
	ldrb r1, [r3]
	ldrb r0, [r3]
	adds r7, r0, 0x1
	adds r2, r1, 0x1
	movs r0, 0xFF
	mov r12, r0
_080FCA46:
	adds r0, r6, r4
	adds r1, r4, 0x1
	strb r2, [r0]
	adds r0, r4, r7
	mov r4, r12
	ands r0, r4
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r2, 0x1
	adds r4, r1, 0
	cmp r1, 0xC7
	ble _080FCA46
	adds r0, r6, r1
	strh r5, [r0]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
_080FCA6A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCA70: .4byte gUnknown_3002018
	thumb_func_end sub_80FC9B8

	thumb_func_start sub_80FCA74
sub_80FCA74: @ 80FCA74
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r3, 0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _080FCA98
	ldr r5, _080FCAA4 @ =gUnknown_843F104
	adds r2, r1, 0
_080FCA84:
	adds r1, r4, r3
	ldrb r0, [r2]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080FCA84
_080FCA98:
	adds r1, r4, r3
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FCAA4: .4byte gUnknown_843F104
	thumb_func_end sub_80FCA74

	thumb_func_start sub_80FCAA8
sub_80FCAA8: @ 80FCAA8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r3, 0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080FCACC
	ldr r5, _080FCAD8 @ =gUnknown_843F004
	adds r2, r1, 0
_080FCAB8:
	adds r1, r4, r3
	ldrb r0, [r2]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	ldrb r0, [r2]
	cmp r0, 0
	bne _080FCAB8
_080FCACC:
	adds r1, r4, r3
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FCAD8: .4byte gUnknown_843F004
	thumb_func_end sub_80FCAA8

	thumb_func_start sub_80FCADC
sub_80FCADC: @ 80FCADC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r0, _080FCB04 @ =gUnknown_3007460
	ldr r4, [r0]
	ldrb r2, [r4, 0x2]
	ldrb r1, [r4]
	adds r7, r0, 0
	cmp r1, 0x1
	bne _080FCB32
	movs r3, 0
	ands r1, r2
	cmp r1, 0
	beq _080FCB0E
	cmp r5, 0x1
	bne _080FCB08
	ldrb r0, [r4, 0xA]
	b _080FCB4C
	.align 2, 0
_080FCB04: .4byte gUnknown_3007460
_080FCB08:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080FCB0E:
	lsrs r2, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bhi _080FCB4A
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080FCB0E
	adds r0, r6, 0x1
	cmp r5, r0
	bne _080FCB08
_080FCB28:
	ldr r0, [r7]
	adds r0, 0xA
	adds r0, r3
	ldrb r0, [r0]
	b _080FCB4C
_080FCB32:
	movs r3, 0
	movs r1, 0x1
_080FCB36:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080FCB28
	lsrs r2, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080FCB36
_080FCB4A:
	movs r0, 0
_080FCB4C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FCADC

	thumb_func_start sub_80FCB54
sub_80FCB54: @ 80FCB54
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r4, 0
	ldr r0, _080FCC30 @ =gSaveBlock2Ptr
	mov r8, r0
	adds r6, r7, 0x2
	ldr r0, [r0]
	adds r5, r0, 0
	adds r5, 0xA
_080FCB72:
	adds r0, r6, r4
	adds r1, r5, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x1
	ble _080FCB72
	movs r4, 0
	lsls r2, 7
	mov r12, r2
	adds r1, r7, 0x4
_080FCB88:
	adds r0, r1, r4
	strb r3, [r0]
	asrs r3, 8
	adds r4, 0x1
	cmp r4, 0x3
	ble _080FCB88
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, 0x8]
	movs r6, 0x1
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r7, 0xB]
	movs r5, 0x2
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0xB]
	movs r4, 0x7F
	mov r1, r9
	ands r1, r4
	ldrb r2, [r7, 0xA]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	ands r0, r4
	mov r1, r12
	orrs r0, r1
	strb r0, [r7, 0xA]
	ldrb r0, [r7]
	movs r1, 0x10
	negs r1, r1
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	ldrb r2, [r7, 0x1]
	movs r0, 0x3D
	negs r0, r0
	ands r0, r2
	movs r2, 0x10
	orrs r0, r2
	strb r0, [r7, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r1, r0
	subs r0, 0x10
	ands r1, r0
	subs r0, 0x20
	ands r1, r0
	strb r1, [r7]
	ldr r0, _080FCC34 @ =0x00000844
	bl FlagGet
	lsls r0, 7
	ldrb r1, [r7]
	ands r4, r1
	orrs r4, r0
	strb r4, [r7]
	bl sub_806E25C
	ands r0, r6
	ldrb r1, [r7, 0x1]
	ands r5, r1
	orrs r5, r0
	strb r5, [r7, 0x1]
	ldr r0, _080FCC38 @ =0x0000082c
	bl FlagGet
	ands r6, r0
	lsls r6, 1
	ldrb r1, [r7, 0x1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	strb r0, [r7, 0x1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCC30: .4byte gSaveBlock2Ptr
_080FCC34: .4byte 0x00000844
_080FCC38: .4byte 0x0000082c
	thumb_func_end sub_80FCB54

	thumb_func_start sub_80FCC3C
sub_80FCC3C: @ 80FCC3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	mov r8, r1
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r0, _080FCC90 @ =gUnknown_3005E10
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	bne _080FCC98
	movs r0, 0x1
	mov r9, r0
	ldr r6, _080FCC94 @ =gUnknown_3007460
	ldr r0, [r6]
	lsls r4, r5, 5
	adds r0, r4
	ldrh r0, [r0, 0x18]
	bl sub_80FA44C
	cmp r0, 0
	beq _080FCC78
	ldr r1, [r6]
	ldrb r0, [r1, 0x7]
	asrs r0, r5
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	bne _080FCCB0
_080FCC78:
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	mov r0, r8
	movs r1, 0
	movs r2, 0x8
	bl memset
	b _080FCCE4
	.align 2, 0
_080FCC90: .4byte gUnknown_3005E10
_080FCC94: .4byte gUnknown_3007460
_080FCC98:
	movs r0, 0
	mov r9, r0
	ldr r6, _080FCCCC @ =gUnknown_3007460
	ldr r0, [r6]
	lsls r4, r5, 5
	adds r0, r4
	ldrh r0, [r0, 0x18]
	bl sub_80FA44C
	cmp r0, 0
	beq _080FCCD0
	ldr r1, [r6]
_080FCCB0:
	adds r1, r4, r1
	adds r1, 0x1A
	adds r0, r7, 0
	movs r2, 0xD
	bl memcpy
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, 0x29
	mov r0, r8
	movs r2, 0x8
	bl memcpy
	b _080FCCE4
	.align 2, 0
_080FCCCC: .4byte gUnknown_3007460
_080FCCD0:
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	mov r0, r8
	movs r1, 0
	movs r2, 0x8
	bl memset
_080FCCE4:
	mov r0, r9
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FCC3C

	thumb_func_start sub_80FCCF4
sub_80FCCF4: @ 80FCCF4
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	movs r7, 0
	ldr r6, _080FCD2C @ =gUnknown_3007460
	ldr r0, [r6]
	lsrs r4, r2, 19
	adds r2, r0, r4
	ldrh r1, [r2, 0x18]
	ldr r0, _080FCD30 @ =0x00007f7d
	cmp r1, r0
	bne _080FCD34
	adds r1, r2, 0
	adds r1, 0x1A
	adds r0, r3, 0
	movs r2, 0xD
	bl memcpy
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, 0x29
	adds r0, r5, 0
	movs r2, 0x8
	bl memcpy
	movs r7, 0x1
	b _080FCD48
	.align 2, 0
_080FCD2C: .4byte gUnknown_3007460
_080FCD30: .4byte 0x00007f7d
_080FCD34:
	adds r0, r3, 0
	movs r1, 0
	movs r2, 0xD
	bl memset
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x8
	bl memset
_080FCD48:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FCCF4

	thumb_func_start sub_80FCD50
sub_80FCD50: @ 80FCD50
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080FCD6C @ =gUnknown_3005440
	movs r2, 0xD
	bl memcpy
	ldr r1, _080FCD70 @ =gUnknown_3005E00
	adds r0, r4, 0
	movs r2, 0x8
	bl memcpy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FCD6C: .4byte gUnknown_3005440
_080FCD70: .4byte gUnknown_3005E00
	thumb_func_end sub_80FCD50

	thumb_func_start sub_80FCD74
sub_80FCD74: @ 80FCD74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	cmp r3, 0
	bne _080FCD8A
	cmp r2, 0
	bne _080FCD8A
	movs r3, 0xE7
	movs r2, 0x8
_080FCD8A:
	ldr r0, _080FCDCC @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FCDE4
	ldr r0, _080FCDD0 @ =gUnknown_843F284
	adds r1, r3, 0
	movs r3, 0
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080FCDD4 @ =gSprites
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldr r0, _080FCDD8 @ =0x00001234
	strh r0, [r4, 0x3C]
	ldr r0, _080FCDDC @ =gUnknown_843F274
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	strh r0, [r4, 0x3A]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldr r0, _080FCDE0 @ =gUnknown_203ACE4
	strb r5, [r0]
	b _080FCE2A
	.align 2, 0
_080FCDCC: .4byte gUnknown_3007460
_080FCDD0: .4byte gUnknown_843F284
_080FCDD4: .4byte gSprites
_080FCDD8: .4byte 0x00001234
_080FCDDC: .4byte gUnknown_843F274
_080FCDE0: .4byte gUnknown_203ACE4
_080FCDE4:
	ldr r0, _080FCE30 @ =gUnknown_843F284
	adds r1, r3, 0
	movs r3, 0
	bl CreateSprite
	ldr r4, _080FCE34 @ =gUnknown_203ACE4
	strb r0, [r4]
	ldr r5, _080FCE38 @ =gSprites
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080FCE3C @ =0x00001234
	strh r1, [r0, 0x3C]
	ldr r0, _080FCE40 @ =gUnknown_843F274
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x3A]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080FCE2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FCE30: .4byte gUnknown_843F284
_080FCE34: .4byte gUnknown_203ACE4
_080FCE38: .4byte gSprites
_080FCE3C: .4byte 0x00001234
_080FCE40: .4byte gUnknown_843F274
	thumb_func_end sub_80FCD74

	thumb_func_start sub_80FCE44
sub_80FCE44: @ 80FCE44
	push {r4,lr}
	ldr r4, _080FCE90 @ =gSprites
	ldr r3, _080FCE94 @ =gUnknown_203ACE4
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r4
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	ldr r0, _080FCE98 @ =0x00001234
	cmp r1, r0
	bne _080FCE8A
	movs r0, 0
	strh r0, [r2, 0x3C]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r3, _080FCE9C @ =gMain
	movs r0, 0x84
	lsls r0, 3
	adds r3, r0
	ldr r0, _080FCEA0 @ =gDummyOamData
	ldr r1, [r0]
	ldr r2, [r0, 0x4]
	str r1, [r3]
	str r2, [r3, 0x4]
	ldr r1, _080FCEA4 @ =0x070003e8
	movs r2, 0x4
	bl CpuSet
_080FCE8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FCE90: .4byte gSprites
_080FCE94: .4byte gUnknown_203ACE4
_080FCE98: .4byte 0x00001234
_080FCE9C: .4byte gMain
_080FCEA0: .4byte gDummyOamData
_080FCEA4: .4byte 0x070003e8
	thumb_func_end sub_80FCE44

	thumb_func_start sub_80FCEA8
sub_80FCEA8: @ 80FCEA8
	push {r4,lr}
	ldr r4, _080FCED4 @ =gUnknown_843F274
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _080FCED8 @ =0xffff0000
	cmp r0, r1
	bne _080FCEC0
	adds r0, r4, 0
	bl LoadCompressedObjectPic
_080FCEC0:
	ldr r0, _080FCEDC @ =gUnknown_843F27C
	bl LoadSpritePalette
	ldr r1, _080FCEE0 @ =gUnknown_203ACE4
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FCED4: .4byte gUnknown_843F274
_080FCED8: .4byte 0xffff0000
_080FCEDC: .4byte gUnknown_843F27C
_080FCEE0: .4byte gUnknown_203ACE4
	thumb_func_end sub_80FCEA8

	thumb_func_start sub_80FCEE4
sub_80FCEE4: @ 80FCEE4
	push {r4,lr}
	ldr r1, _080FCF04 @ =gUnknown_3007460
	ldr r0, [r1]
	ldrb r2, [r0, 0x2]
	movs r3, 0
	movs r4, 0x1
_080FCEF0:
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	beq _080FCF08
	ldr r0, [r1]
	adds r0, 0xA
	adds r0, r3
	ldrb r0, [r0]
	b _080FCF16
	.align 2, 0
_080FCF04: .4byte gUnknown_3007460
_080FCF08:
	lsrs r2, 1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080FCEF0
	movs r0, 0
_080FCF16:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FCEE4

	thumb_func_start sub_80FCF1C
sub_80FCF1C: @ 80FCF1C
	push {lr}
	adds r2, r0, 0
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, r1
	beq _080FCF30
	movs r0, 0
	strh r1, [r2, 0x32]
	strh r0, [r2, 0x34]
	strh r0, [r2, 0x36]
_080FCF30:
	pop {r0}
	bx r0
	thumb_func_end sub_80FCF1C

	thumb_func_start sub_80FCF34
sub_80FCF34: @ 80FCF34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _080FCF78 @ =gUnknown_203ACE4
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080FCF44
	b _080FD106
_080FCF44:
	ldr r2, _080FCF7C @ =gSprites
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	ldr r0, _080FCF80 @ =0x00001234
	cmp r1, r0
	beq _080FCF5C
	b _080FD106
_080FCF5C:
	adds r6, r2, 0
	movs r5, 0xFF
	movs r4, 0
	ldr r0, _080FCF84 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FCFB6
	adds r7, r6, 0
	adds r7, 0x28
	movs r1, 0x29
	adds r1, r6
	mov r8, r1
	b _080FCFA6
	.align 2, 0
_080FCF78: .4byte gUnknown_203ACE4
_080FCF7C: .4byte gSprites
_080FCF80: .4byte 0x00001234
_080FCF84: .4byte gUnknown_3007460
_080FCF88:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80FCADC
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcc _080FCFA6
	adds r0, r4, 0
	bl sub_80FCADC
	lsls r0, 24
	lsrs r5, r0, 24
_080FCFA6:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r4, r0
	blt _080FCF88
	b _080FCFC8
_080FCFB6:
	bl sub_80FCEE4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r6, 0
	adds r7, 0x28
	movs r2, 0x29
	adds r2, r6
	mov r8, r2
_080FCFC8:
	bl sub_80FC1B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FCFD8
	movs r0, 0x4
	b _080FD006
_080FCFD8:
	cmp r5, 0x18
	bhi _080FCFE0
	movs r0, 0x3
	b _080FD006
_080FCFE0:
	adds r0, r5, 0
	subs r0, 0x19
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	bhi _080FCFF0
	movs r0, 0x2
	b _080FD006
_080FCFF0:
	adds r0, r5, 0
	subs r0, 0x7F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	bhi _080FD000
	movs r0, 0x1
	b _080FD006
_080FD000:
	cmp r5, 0xE4
	bls _080FD008
	movs r0, 0
_080FD006:
	strh r0, [r6, 0x2E]
_080FD008:
	movs r3, 0x2E
	ldrsh r1, [r6, r3]
	movs r2, 0x30
	ldrsh r0, [r6, r2]
	cmp r1, r0
	beq _080FD01E
	adds r0, r6, 0
	bl sub_80FCF1C
	ldrh r0, [r6, 0x2E]
	strh r0, [r6, 0x30]
_080FD01E:
	movs r0, 0x32
	ldrsh r1, [r6, r0]
	ldr r2, [r6, 0x8]
	lsls r1, 2
	adds r1, r2
	movs r3, 0x36
	ldrsh r0, [r6, r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	movs r3, 0x34
	ldrsh r1, [r6, r3]
	cmp r0, r1
	bge _080FD06C
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r6, 0x36]
	strh r3, [r6, 0x34]
	movs r1, 0x32
	ldrsh r0, [r6, r1]
	lsls r0, 2
	adds r0, r2
	movs r2, 0x36
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	ldrsh r1, [r1, r0]
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _080FD072
	strh r3, [r6, 0x36]
	b _080FD072
_080FD06C:
	ldrh r0, [r6, 0x34]
	adds r0, 0x1
	strh r0, [r6, 0x34]
_080FD072:
	ldr r4, _080FD110 @ =gMain
	movs r1, 0x84
	lsls r1, 3
	adds r0, r4, r1
	ldr r1, _080FD114 @ =gUnknown_843F204
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r0]
	str r2, [r0, 0x4]
	movs r3, 0x20
	ldrsh r2, [r6, r3]
	movs r1, 0
	ldrsb r1, [r7, r1]
	adds r2, r1
	ldr r1, _080FD118 @ =0x00000422
	adds r5, r4, r1
	ldr r3, _080FD11C @ =0x000001ff
	adds r1, r3, 0
	ands r2, r1
	ldrh r3, [r5]
	ldr r1, _080FD120 @ =0xfffffe00
	ands r1, r3
	orrs r1, r2
	strh r1, [r5]
	ldrh r1, [r6, 0x22]
	mov r2, r8
	ldrb r2, [r2]
	adds r1, r2
	strb r1, [r0]
	ldrb r2, [r6, 0x5]
	ldr r3, _080FD124 @ =0x00000425
	adds r5, r4, r3
	lsrs r2, 4
	lsls r2, 4
	ldrb r3, [r5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r2
	strb r1, [r5]
	movs r1, 0x32
	ldrsh r2, [r6, r1]
	ldr r1, [r6, 0x8]
	lsls r2, 2
	adds r2, r1
	movs r3, 0x36
	ldrsh r1, [r6, r3]
	ldr r2, [r2]
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1]
	ldrh r6, [r6, 0x3A]
	adds r2, r6
	ldr r1, _080FD128 @ =0x00000424
	adds r4, r1
	ldr r3, _080FD12C @ =0x000003ff
	adds r1, r3, 0
	ands r2, r1
	ldrh r3, [r4]
	ldr r1, _080FD130 @ =0xfffffc00
	ands r1, r3
	orrs r1, r2
	strh r1, [r4]
	ldr r1, _080FD134 @ =0x070003e8
	movs r2, 0x4
	bl CpuSet
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FD106
	bl sub_80FCE44
_080FD106:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD110: .4byte gMain
_080FD114: .4byte gUnknown_843F204
_080FD118: .4byte 0x00000422
_080FD11C: .4byte 0x000001ff
_080FD120: .4byte 0xfffffe00
_080FD124: .4byte 0x00000425
_080FD128: .4byte 0x00000424
_080FD12C: .4byte 0x000003ff
_080FD130: .4byte 0xfffffc00
_080FD134: .4byte 0x070003e8
	thumb_func_end sub_80FCF34

	thumb_func_start sub_80FD138
sub_80FD138: @ 80FD138
	push {r4,r5,lr}
	adds r4, r0, 0
	str r1, [r4]
	movs r3, 0
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _080FD15C
	adds r5, r4, 0x4
_080FD148:
	adds r1, r5, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x6
	bgt _080FD15C
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080FD148
_080FD15C:
	adds r0, r4, 0x4
	adds r0, r3
	movs r1, 0xFF
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80FD138

	thumb_func_start sub_80FD16C
sub_80FD16C: @ 80FD16C
	push {lr}
	movs r2, 0
	movs r1, 0x7
_080FD172:
	strb r2, [r0]
	adds r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _080FD172
	pop {r0}
	bx r0
	thumb_func_end sub_80FD16C

	thumb_func_start sub_80FD180
sub_80FD180: @ 80FD180
	push {lr}
	adds r1, r0, 0
	movs r2, 0
_080FD186:
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0
	beq _080FD192
	movs r0, 0
	b _080FD19A
_080FD192:
	adds r2, 0x1
	cmp r2, 0x7
	ble _080FD186
	movs r0, 0x1
_080FD19A:
	pop {r1}
	bx r1
	thumb_func_end sub_80FD180

	thumb_func_start sub_80FD1A0
sub_80FD1A0: @ 80FD1A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r0, _080FD1C4 @ =gUnknown_3003F3C
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FD1B6
	b _080FD318
_080FD1B6:
	movs r0, 0xF0
	bl AllocZeroed
	str r0, [sp, 0x14]
	movs r4, 0
	b _080FD22C
	.align 2, 0
_080FD1C4: .4byte gUnknown_3003F3C
_080FD1C8:
	lsls r2, r4, 2
	mov r0, sp
	adds r1, r0, r2
	movs r0, 0x1
	negs r0, r0
	str r0, [r1]
	movs r5, 0
	mov r8, r2
	lsls r0, r4, 3
	adds r1, r4, 0x1
	mov r9, r1
	subs r0, r4
	lsls r0, 2
	str r0, [sp, 0x1C]
	ldr r2, _080FD24C @ =gLinkPlayers + 8
	mov r10, r2
	ldr r6, _080FD250 @ =0x00003ba8
	movs r4, 0
	mov r0, r10
	subs r0, 0x4
	ldr r7, [sp, 0x1C]
	adds r3, r7, r0
_080FD1F4:
	ldrh r1, [r3]
	ldr r0, _080FD254 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r7, _080FD250 @ =0x00003ba8
	adds r0, r2, r7
	adds r0, r4
	ldr r0, [r0]
	cmp r1, r0
	bne _080FD220
	adds r1, r2, r6
	adds r1, 0x4
	ldr r0, [sp, 0x1C]
	add r0, r10
	str r3, [sp, 0x18]
	bl StringCompare
	ldr r3, [sp, 0x18]
	cmp r0, 0
	bne _080FD220
	mov r0, sp
	add r0, r8
	str r5, [r0]
_080FD220:
	adds r6, 0xC
	adds r4, 0xC
	adds r5, 0x1
	cmp r5, 0x13
	ble _080FD1F4
	mov r4, r9
_080FD22C:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _080FD1C8
	movs r0, 0
	mov r8, r0
	movs r4, 0
	ldr r1, _080FD254 @ =gSaveBlock1Ptr
	mov r9, r1
	mov r7, sp
	movs r5, 0
	ldr r6, [sp, 0x14]
	b _080FD2A4
	.align 2, 0
_080FD24C: .4byte gLinkPlayers + 8
_080FD250: .4byte 0x00003ba8
_080FD254: .4byte gSaveBlock1Ptr
_080FD258:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _080FD29E
	ldr r2, _080FD328 @ =gLinkPlayers
	adds r0, r5, r2
	ldrh r0, [r0, 0x1A]
	cmp r0, 0x1
	beq _080FD29E
	adds r0, r2, 0x4
	adds r0, r5, r0
	ldrh r1, [r0]
	adds r2, 0x8
	adds r2, r5, r2
	adds r0, r6, 0
	bl sub_80FD138
	ldr r1, [r7]
	cmp r1, 0
	blt _080FD298
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	mov r2, r9
	ldr r1, [r2]
	adds r0, r1
	ldr r1, _080FD32C @ =0x00003bac
	adds r0, r1
	bl sub_80FD16C
_080FD298:
	adds r6, 0xC
	movs r2, 0x1
	add r8, r2
_080FD29E:
	adds r7, 0x4
	adds r5, 0x1C
	adds r4, 0x1
_080FD2A4:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _080FD258
	movs r4, 0
	ldr r7, _080FD330 @ =gSaveBlock1Ptr
	mov r9, r7
	ldr r6, _080FD334 @ =0x00003ba8
	movs r7, 0
	mov r1, r8
	lsls r0, r1, 1
	add r0, r8
	lsls r0, 2
	ldr r2, [sp, 0x14]
	adds r5, r0, r2
_080FD2C6:
	mov r1, r9
	ldr r0, [r1]
	adds r0, r6
	adds r0, 0x4
	bl sub_80FD180
	cmp r0, 0
	bne _080FD2F8
	mov r0, r9
	ldr r2, [r0]
	ldr r1, _080FD334 @ =0x00003ba8
	adds r0, r2, r1
	adds r0, r7
	ldr r1, [r0]
	adds r2, r6
	adds r2, 0x4
	adds r0, r5, 0
	bl sub_80FD138
	adds r5, 0xC
	movs r2, 0x1
	add r8, r2
	mov r0, r8
	cmp r0, 0x13
	bgt _080FD302
_080FD2F8:
	adds r6, 0xC
	adds r7, 0xC
	adds r4, 0x1
	cmp r4, 0x13
	ble _080FD2C6
_080FD302:
	ldr r0, _080FD330 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _080FD334 @ =0x00003ba8
	adds r0, r1
	ldr r1, [sp, 0x14]
	movs r2, 0xF0
	bl memcpy
	ldr r0, [sp, 0x14]
	bl Free
_080FD318:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD328: .4byte gLinkPlayers
_080FD32C: .4byte 0x00003bac
_080FD330: .4byte gSaveBlock1Ptr
_080FD334: .4byte 0x00003ba8
	thumb_func_end sub_80FD1A0

	thumb_func_start sub_80FD338
sub_80FD338: @ 80FD338
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	movs r7, 0
	ldr r6, _080FD374 @ =gSaveBlock1Ptr
	ldr r4, _080FD378 @ =0x00003ba8
	movs r5, 0
_080FD350:
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x4
	mov r1, r9
	movs r2, 0x7
	bl StringCompareN
	cmp r0, 0
	bne _080FD37C
	ldr r0, [r6]
	ldr r1, _080FD378 @ =0x00003ba8
	adds r0, r1
	adds r0, r5
	ldr r0, [r0]
	cmp r0, r8
	bne _080FD37C
	movs r0, 0x1
	b _080FD396
	.align 2, 0
_080FD374: .4byte gSaveBlock1Ptr
_080FD378: .4byte 0x00003ba8
_080FD37C:
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x4
	bl sub_80FD180
	cmp r0, 0
	bne _080FD394
	adds r4, 0xC
	adds r5, 0xC
	adds r7, 0x1
	cmp r7, 0x13
	ble _080FD350
_080FD394:
	movs r0, 0
_080FD396:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD338

	.align 2, 0 @ Don't pad with nop.
