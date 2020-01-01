	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
