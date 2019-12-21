	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	arm_func_start IntrSIO32
IntrSIO32: @ 81DFC50
	mov r12, sp
	stmdb sp!, {r11,r12,lr,pc}
	ldr r3, _081DFCB0 @ =gRfuState
	ldr r0, [r3]
	ldr r2, [r0]
	sub r11, r12, 0x4
	cmp r2, 0xA
	bne _081DFC8C
	ldr r0, [r0, 0x20]
	cmp r0, 0
	ldmdbeq r11, {r11,sp,lr}
	bxeq lr
	bl sub_81E05AC
	ldmdb r11, {r11,sp,lr}
	bx lr
_081DFC8C:
	ldrb r3, [r0, 0x14]
	cmp r3, 0x1
	bne _081DFCA4
	bl sio32intr_clock_master
	ldmdb r11, {r11,sp,lr}
	bx lr
_081DFCA4:
	bl sio32intr_clock_slave
	ldmdb r11, {r11,sp,lr}
	bx lr
	.align 2, 0
_081DFCB0: .4byte gRfuState
	arm_func_end IntrSIO32

	arm_func_start sio32intr_clock_master
sio32intr_clock_master: @ 81DFCB4
	mov r12, sp
	stmdb sp!, {r4-r6,r11,r12,lr,pc}
	mov r0, 0x50
	sub r11, r12, 0x4
	bl STWI_set_timer_in_RAM
	mov r4, 0x120
	ldr r2, _081DFF28 @ =gRfuState
	add r4, r4, 0x4000000
	ldr lr, [r4]
	ldr r12, [r2]
	ldr r3, [r12]
	mov r6, r2
	cmp r3, 0
	bne _081DFD34
	cmp lr, 0x80000000
	bne _081DFDB4
	ldrb r2, [r12, 0x5]
	ldrb r3, [r12, 0x4]
	cmp r2, r3
	bhi _081DFD24
	ldr r3, [r12, 0x24]
	mov r1, r2
	ldr r2, [r3, r1, lsl 2]
	str r2, [r4]
	ldrb r3, [r12, 0x5]
	add r3, r3, 0x1
	strb r3, [r12, 0x5]
	b _081DFE10
_081DFD24:
	mov r3, 0x1
	str r3, [r12]
	str lr, [r4]
	b _081DFE10
_081DFD34:
	ldr r3, [r12]
	cmp r3, 0x1
	bne _081DFDC4
	mov r3, 0x99000000
	add r3, r3, 0x660000
	mov r5, 0x80000000
	and r2, lr, r5, asr 15
	cmp r2, r3
	bne _081DFDB4
	mov r3, 0
	strb r3, [r12, 0x8]
	ldr r1, [r6]
	ldrb r0, [r1, 0x8]
	ldr r2, [r1, 0x28]
	str lr, [r2, r0, lsl 2]
	ldrb r3, [r1, 0x8]
	add r3, r3, 0x1
	strb r3, [r1, 0x8]
	ldr r2, [r6]
	strb lr, [r2, 0x9]
	ldr r3, [r6]
	mov r2, lr, lsr 8
	strb r2, [r3, 0x7]
	ldr r1, [r6]
	ldrb r2, [r1, 0x7]
	ldrb r3, [r1, 0x8]
	cmp r2, r3
	bcc _081DFDFC
	mov r3, 0x2
	str r3, [r1]
	str r5, [r4]
	b _081DFE10
_081DFDB4:
	bl STWI_stop_timer_in_RAM
	mov r0, 0x82
	bl STWI_set_timer_in_RAM
	b _081DFF3C
_081DFDC4:
	ldr r3, [r12]
	cmp r3, 0x2
	bne _081DFE10
	ldrb r1, [r12, 0x8]
	ldr r2, [r12, 0x28]
	str lr, [r2, r1, lsl 2]
	ldrb r3, [r12, 0x8]
	add r3, r3, 0x1
	strb r3, [r12, 0x8]
	ldr r1, [r6]
	ldrb r2, [r1, 0x7]
	ldrb r3, [r1, 0x8]
	cmp r2, r3
	bcs _081DFE08
_081DFDFC:
	mov r3, 0x3
	str r3, [r1]
	b _081DFE10
_081DFE08:
	mov r3, 0x80000000
	str r3, [r4]
_081DFE10:
	mov r0, 0x1
	bl handshake_wait
	mov r0, r0, lsl 16
	cmp r0, 0x10000
	beq _081DFF3C
	mov r4, 0x128
	add r4, r4, 0x4000000
	mov r5, 0x5000
	add r3, r5, 0xB
	strh r3, [r4]
	mov r0, 0
	bl handshake_wait
	mov r0, r0, lsl 16
	cmp r0, 0x10000
	beq _081DFF3C
	bl STWI_stop_timer_in_RAM
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, 0x3
	bne _081DFF2C
	ldrb r3, [r1, 0x9]
	cmp r3, 0xA5
	cmpne r3, 0xA7
	beq _081DFE84
	and r3, r3, 0xFF
	cmp r3, 0xB5
	beq _081DFE84
	cmp r3, 0xB7
	bne _081DFECC
_081DFE84:
	mov r1, 0x120
	add r1, r1, 0x4000000
	mov r12, 0x128
	add r12, r12, 0x4000000
	ldr r0, [r6]
	mov r3, 0
	strb r3, [r0, 0x14]
	mov r2, 0x80000000
	str r2, [r1]
	add r3, r3, 0x5000
	add r2, r3, 0x2
	strh r2, [r12]
	add r3, r3, 0x82
	strh r3, [r12]
	ldr r2, [r6]
	mov r3, 0x5
	str r3, [r2]
	b _081DFEFC
_081DFECC:
	cmp r3, 0xEE
	bne _081DFEEC
	add r3, r5, 0x3
	strh r3, [r4]
	mov r2, 0x4
	str r2, [r1]
	strh r0, [r1, 0x12]
	b _081DFEFC
_081DFEEC:
	add r3, r5, 0x3
	strh r3, [r4]
	mov r2, 0x4
	str r2, [r1]
_081DFEFC:
	ldr r2, [r6]
	mov r3, 0
	strb r3, [r2, 0x2C]
	ldr r0, [r6]
	ldr r2, [r0, 0x18]
	cmp r2, r3
	beq _081DFF3C
	ldrh r1, [r0, 0x12]
	ldrb r0, [r0, 0x6]
	bl sub_81E05A4
	b _081DFF3C
	.align 2, 0
_081DFF28: .4byte gRfuState
_081DFF2C:
	add r3, r5, 0x3
	strh r3, [r4]
	add r2, r5, 0x83
	strh r2, [r4]
_081DFF3C:
	ldmdb r11, {r4-r6,r11,sp,lr}
	bx lr
	arm_func_end sio32intr_clock_master

	arm_func_start sio32intr_clock_slave
sio32intr_clock_slave: @ 81DFF44
	mov r12, sp
	stmdb sp!, {r4-r6,r11,r12,lr,pc}
	ldr r4, _081E02F0 @ =gRfuState
	mov r0, 0x64
	ldr r3, [r4]
	mov r6, 0
	strb r6, [r3, 0x10]
	sub r11, r12, 0x4
	bl STWI_set_timer_in_RAM
	mov r0, r6
	bl handshake_wait
	mov r0, r0, lsl 16
	cmp r0, 0x10000
	mov r5, r4
	beq _081E0348
	mov r3, 0x128
	add r3, r3, 0x4000000
	mov r2, 0x5000
	add r2, r2, 0xA
	strh r2, [r3]
	mov lr, 0x120
	ldr r0, [r5]
	add lr, lr, 0x4000000
	ldr r12, [lr]
	ldr r3, [r0]
	cmp r3, 0x5
	bne _081E0074
	ldr r3, [r0, 0x28]
	mov r4, 0x1
	mov r0, 0x99000000
	str r12, [r3]
	add r0, r0, 0x660000
	ldr r2, [r5]
	mov r3, r0, lsr 16
	strb r4, [r2, 0x5]
	cmp r3, r12, lsr 16
	bne _081E01C0
	ldr r3, [r5]
	mov r2, r12, lsr 8
	strb r2, [r3, 0x4]
	ldr r2, [r5]
	strb r12, [r2, 0x6]
	ldr r1, [r5]
	ldrb r3, [r1, 0x4]
	cmp r3, r6
	bne _081E0058
	ldrb r2, [r1, 0x6]
	sub r3, r2, 0x27
	cmp r2, 0x36
	cmpne r3, 0x2
	bhi _081E002C
	add r3, r2, 0x80
	strb r3, [r1, 0x9]
	ldr r2, [r5]
	ldrb r3, [r2, 0x9]
	ldr r1, [r2, 0x24]
	add r3, r3, r0
	b _081E00DC
_081E002C:
	ldr r2, [r1, 0x24]
	ldr r3, _081E02F4 @ =0x996601ee
	str r3, [r2]
	ldr r2, [r5]
	ldrb r3, [r2, 0x6]
	sub r3, r3, 0x10
	cmp r3, 0x2D
	bhi _081E0114
	ldr r3, [r2, 0x24]
	str r4, [r3, 0x4]
	b _081E0120
_081E0058:
	mov r3, 0x80000000
	str r3, [lr]
	strb r4, [r1, 0x5]
	ldr r2, [r5]
	add r3, r3, 0x80000006
	str r3, [r2]
	b _081E01D0
_081E0074:
	ldr r3, [r0]
	cmp r3, 0x6
	bne _081E0174
	ldrb r1, [r0, 0x5]
	ldr r2, [r0, 0x28]
	str r12, [r2, r1, lsl 2]
	ldrb r3, [r0, 0x5]
	add r3, r3, 0x1
	strb r3, [r0, 0x5]
	ldr r1, [r5]
	ldrb r2, [r1, 0x4]
	ldrb r3, [r1, 0x5]
	cmp r2, r3
	bcs _081E0168
	ldrb r2, [r1, 0x6]
	sub r3, r2, 0x28
	cmp r2, 0x36
	cmpne r3, 0x1
	bhi _081E00EC
	add r3, r2, 0x80
	strb r3, [r1, 0x9]
	ldr r2, [r5]
	ldrb r3, [r2, 0x9]
	ldr r1, [r2, 0x24]
	orr r3, r3, 0x99000000
	orr r3, r3, 0x660000
_081E00DC:
	str r3, [r1]
	ldr r2, [r5]
	strb r6, [r2, 0x7]
	b _081E0138
_081E00EC:
	ldr r2, [r1, 0x24]
	ldr r3, _081E02F4 @ =0x996601ee
	str r3, [r2]
	ldr r2, [r5]
	ldrb r3, [r2, 0x6]
	sub r3, r3, 0x10
	cmp r3, 0x2D
	ldrls r2, [r2, 0x24]
	movls r3, 0x1
	bls _081E011C
_081E0114:
	ldr r2, [r2, 0x24]
	mov r3, 0x2
_081E011C:
	str r3, [r2, 0x4]
_081E0120:
	ldr r2, [r5]
	mov r3, 0x1
	strb r3, [r2, 0x7]
	ldr r1, [r5]
	add r3, r3, 0x2
	strh r3, [r1, 0x12]
_081E0138:
	ldr r0, [r5]
	ldr r2, [r0, 0x24]
	mov r3, 0x120
	ldr r1, [r2]
	add r3, r3, 0x4000000
	str r1, [r3]
	mov r2, 0x1
	strb r2, [r0, 0x8]
	ldr r1, [r5]
	mov r3, 0x7
	str r3, [r1]
	b _081E01D0
_081E0168:
	mov r3, 0x80000000
	str r3, [lr]
	b _081E01D0
_081E0174:
	ldr r3, [r0]
	cmp r3, 0x7
	bne _081E01D0
	cmp r12, 0x80000000
	bne _081E01C0
	ldrb r2, [r0, 0x7]
	ldrb r3, [r0, 0x8]
	cmp r2, r3
	movcc r3, 0x8
	strcc r3, [r0]
	bcc _081E01D0
	ldrb r1, [r0, 0x8]
	ldr r3, [r0, 0x24]
	ldr r2, [r3, r1, lsl 2]
	str r2, [lr]
	ldrb r3, [r0, 0x8]
	add r3, r3, 0x1
	strb r3, [r0, 0x8]
	b _081E01D0
_081E01C0:
	bl STWI_stop_timer_in_RAM
	mov r0, 0x64
	bl STWI_set_timer_in_RAM
	b _081E0348
_081E01D0:
	mov r0, 0x1
	bl handshake_wait
	mov r0, r0, lsl 16
	cmp r0, 0x10000
	beq _081E0348
	mov r6, r5
	ldr r3, [r6]
	ldr r2, [r3]
	cmp r2, 0x8
	bne _081E0298
	mov r4, 0x128
	add r4, r4, 0x4000000
	mov r3, 0x5000
	add r3, r3, 0x2
	strh r3, [r4]
	bl STWI_stop_timer_in_RAM
	ldr r0, [r6]
	ldrh r3, [r0, 0x12]
	cmp r3, 0x3
	bne _081E0244
	bl STWI_init_slave
	ldr r3, [r6]
	ldr r1, [r3, 0x1C]
	cmp r1, 0
	beq _081E0348
	mov r0, 0x1EC
	add r0, r0, 0x2
	bl sub_81E05A8
	b _081E0348
_081E0244:
	mov r3, 0x120
	add r3, r3, 0x4000000
	mov r1, 0
	str r1, [r3]
	mov r2, 0x5000
	strh r1, [r4]
	add r2, r2, 0x3
	strh r2, [r4]
	mov r3, 0x1
	strb r3, [r0, 0x14]
	ldr r0, [r5]
	ldr r2, [r0, 0x1C]
	str r1, [r0]
	cmp r2, r1
	beq _081E0348
	ldrb r3, [r0, 0x4]
	ldrb r0, [r0, 0x6]
	mov r1, r2
	orr r0, r0, r3, lsl 8
	bl sub_81E05A8
	b _081E0348
_081E0298:
	mov r3, 0x208
	add r3, r3, 0x4000000
	mov r2, 0
	strh r2, [r3]
	mov r1, 0x100
	add r2, r1, 0x4000002
	ldrh r3, [r2]
	tst r3, 0x80
	beq _081E031C
	ldrh r3, [r2]
	tst r3, 0x3
	bne _081E02F8
	mov r2, 0xFF00
	add r1, r1, 0x4000000
	ldrh r3, [r1]
	add r2, r2, 0x9B
	cmp r3, r2
	bls _081E031C
_081E02E0:
	ldrh r3, [r1]
	cmp r3, r2
	bhi _081E02E0
	b _081E031C
	.align 2, 0
_081E02F0: .4byte gRfuState
_081E02F4: .4byte 0x996601ee
_081E02F8:
	mov r2, 0xFF00
	add r1, r1, 0x4000000
	ldrh r3, [r1]
	add r2, r2, 0xFE
	cmp r3, r2
	bls _081E031C
_081E0310:
	ldrh r3, [r1]
	cmp r3, r2
	bhi _081E0310
_081E031C:
	mov r1, 0x128
	add r1, r1, 0x4000000
	mov r0, 0x208
	add r0, r0, 0x4000000
	mov r3, 0x5000
	add r2, r3, 0x2
	strh r2, [r1]
	add r3, r3, 0x82
	strh r3, [r1]
	mov r2, 0x1
	strh r2, [r0]
_081E0348:
	ldmdb r11, {r4-r6,r11,sp,lr}
	bx lr
	arm_func_end sio32intr_clock_slave

	arm_func_start handshake_wait
handshake_wait: @ 81E0350
	mov r12, sp
	stmdb sp!, {r11,r12,lr,pc}
	mov r1, 0x128
	add r1, r1, 0x4000000
	mov r0, r0, lsl 16
	ldr r2, _081E03B4 @ =gRfuState
	sub r11, r12, 0x4
	mov lr, r0, lsr 14
	ldr r12, [r2]
_081E0374:
	ldrb r3, [r12, 0x10]
	and r0, r3, 0xFF
	cmp r0, 0x1
	beq _081E03A0
	ldrh r3, [r1]
	and r3, r3, 0x4
	cmp r3, lr
	bne _081E0374
	mov r0, 0
	ldmdb r11, {r11,sp,lr}
	bx lr
_081E03A0:
	ldr r2, [r2]
	mov r3, 0
	strb r3, [r2, 0x10]
	ldmdb r11, {r11,sp,lr}
	bx lr
	.align 2, 0
_081E03B4: .4byte gRfuState
	arm_func_end handshake_wait

	arm_func_start STWI_set_timer_in_RAM
STWI_set_timer_in_RAM: @ 81E03B8
	mov r12, sp
	stmdb sp!, {r4,r5,r11,r12,lr,pc}
	mov r1, 0x208
	add r1, r1, 0x4000000
	mov r3, 0
	sub r11, r12, 0x4
	ldr r12, _081E0470 @ =gRfuState
	and lr, r0, 0xFF
	ldr r2, [r12]
	cmp lr, 0x50
	ldrb r0, [r2, 0xA]
	mov r4, r12
	mov r2, lr
	strh r3, [r1]
	mov r0, r0, lsl 2
	add r3, r3, 0x100
	add r1, r3, 0x4000000
	add r3, r3, 0x4000002
	add r5, r0, r3
	beq _081E0440
	bgt _081E0418
	cmp lr, 0x32
	beq _081E042C
	b _081E048C
_081E0418:
	cmp r2, 0x64
	beq _081E0458
	cmp r2, 0x82
	beq _081E0474
	b _081E048C
_081E042C:
	mvn r3, 0x334
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, 0x1
	b _081E0488
_081E0440:
	mov r3, 0xAE000000
	mov r3, r3, asr 20
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, 0x2
	b _081E0488
_081E0458:
	mvn r3, 0x660
	sub r3, r3, 0x9
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, 0x3
	b _081E0488
	.align 2, 0
_081E0470: .4byte gRfuState
_081E0474:
	mvn r3, 0x850
	sub r3, r3, 0x2
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, 0x4
_081E0488:
	str r3, [r2, 0xC]
_081E048C:
	mov r12, 0x200
	add r12, r12, 0x4000002
	mov r3, 0xC3
	strh r3, [r5]
	mov r1, 0x208
	ldr r2, [r4]
	add r1, r1, 0x4000000
	ldrb r0, [r2, 0xA]
	sub r3, r3, 0xBB
	mov r3, r3, lsl r0
	strh r3, [r12]
	mov r2, 0x1
	strh r2, [r1]
	ldmdb r11, {r4,r5,r11,sp,lr}
	bx lr
	arm_func_end STWI_set_timer_in_RAM

	arm_func_start STWI_stop_timer_in_RAM
STWI_stop_timer_in_RAM: @ 81E04C8
	mov r12, sp
	stmdb sp!, {r11,r12,lr,pc}
	mov r1, 0x100
	ldr lr, _081E0514 @ =gRfuState
	add r0, r1, 0x4000000
	ldr r2, [lr]
	sub r11, r12, 0x4
	ldrb r3, [r2, 0xA]
	mov r12, 0
	str r12, [r2, 0xC]
	mov r3, r3, lsl 2
	strh r12, [r3, r0]
	ldr r2, [lr]
	ldrb r3, [r2, 0xA]
	add r1, r1, 0x4000002
	mov r3, r3, lsl 2
	strh r12, [r3, r1]
	ldmdb r11, {r11,sp,lr}
	bx lr
	.align 2, 0
_081E0514: .4byte gRfuState
	arm_func_end STWI_stop_timer_in_RAM

	arm_func_start STWI_init_slave
STWI_init_slave: @ 81E0518
	mov r12, sp
	stmdb sp!, {r11,r12,lr,pc}
	ldr r0, _081E05A0 @ =gRfuState
	ldr r2, [r0]
	mov r3, 0x5
	str r3, [r2]
	mov r1, 0
	strb r1, [r2, 0x14]
	ldr r3, [r0]
	strb r1, [r3, 0x4]
	ldr r2, [r0]
	strb r1, [r2, 0x5]
	ldr r3, [r0]
	strb r1, [r3, 0x6]
	ldr r2, [r0]
	strb r1, [r2, 0x7]
	ldr r3, [r0]
	strb r1, [r3, 0x8]
	ldr r2, [r0]
	strb r1, [r2, 0x9]
	ldr r3, [r0]
	str r1, [r3, 0xC]
	sub r11, r12, 0x4
	strb r1, [r3, 0x10]
	mov r2, 0x128
	ldr r12, [r0]
	add r2, r2, 0x4000000
	strh r1, [r12, 0x12]
	mov r3, 0x5000
	strb r1, [r12, 0x15]
	add r3, r3, 0x82
	strh r3, [r2]
	ldmdb r11, {r11,sp,lr}
	bx lr
	.align 2, 0
_081E05A0: .4byte gRfuState
	arm_func_end STWI_init_slave

	arm_func_start sub_81E05A4
sub_81E05A4: @ 81E05A4
	bx r2
	arm_func_end sub_81E05A4

	arm_func_start sub_81E05A8
sub_81E05A8: @ 81E05A8
	bx r1
	arm_func_end sub_81E05A8

	arm_func_start sub_81E05AC
sub_81E05AC: @ 81E05AC
	bx r0
	arm_func_end sub_81E05AC
