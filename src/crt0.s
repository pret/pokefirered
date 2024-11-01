	.include "constants/gba_constants.inc"
	.include "constants/misc_constants.inc"
	.include "constants/version.inc"

	.syntax unified

	.arm
	.align 2, 0
	.global start_vector
start_vector:
.ifdef SRAM
	ldr sp, =0x03007f00
	mov r0, #252
	mov r0, r0, lsl #16
	mov r1, #0x8000000
	orr r0, r0, r1
	mov r1, #0xe000000
	mov r2, #16
	mov r2, r2, lsl #12
_08fa0020:
	ldrb r3, [r0]
	ldrb r4, [r0]
	cmp r3, r4
	bne _08fa0020
	strb r3, [r1]
	add r1, r1, #1
	add r0, r0, #1
	subs r2, r2, #1
	bne _08fa0020
loop_start_vector:
.endif
	mov r0, #PSR_IRQ_MODE
	msr cpsr_cf, r0
	ldr sp, sp_irq
	mov r0, #PSR_SYS_MODE
	msr cpsr_cf, r0
	ldr sp, sp_usr
	ldr r1, =INTR_VECTOR
	adr r0, intr_main
	str r0, [r1]
	ldr r1, =AgbMain
	mov lr, pc
	bx r1
.ifdef SRAM
	b loop_start_vector
.else
	b start_vector
.endif

	.align 2, 0
sp_usr: .word IWRAM_END - 0x1C0
sp_irq: .word IWRAM_END - 0x60

	.pool

	.arm
	.align 2, 0
	.global intr_main
intr_main:
	mov r3, #REG_BASE
	add r3, r3, #OFFSET_REG_IE
	ldr r2, [r3]
	ldrh r1, [r3, #REG_IME - REG_IE]
	mrs r0, spsr
	stmdb sp!, {r0-r3,lr}
	mov r0, #0
	strh r0, [r3, #REG_IME - REG_IE]
	and r1, r2, r2, lsr #16
	mov r12, #0
	ands r0, r1, #INTR_FLAG_VCOUNT
	bne jump_intr
	add r12, r12, 0x4
	mov r0, 0x1
	strh r0, [r3, #REG_IME - REG_IE]
	ands r0, r1, #INTR_FLAG_SERIAL
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_TIMER3
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_HBLANK
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_VBLANK
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_TIMER0
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_TIMER1
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_TIMER2
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_DMA0
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_DMA1
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_DMA2
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_DMA3
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_KEYPAD
	bne jump_intr
	add r12, r12, 0x4
	ands r0, r1, #INTR_FLAG_GAMEPAK
	strbne r0, [r3, #REG_SOUNDCNT_X - REG_IE]
loop:
	bne loop @ spin
jump_intr:
	strh r0, [r3, #REG_IF - REG_IE]
	bic r2, r2, r0
	ldr r0, =gSTWIStatus
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	mov r1, #INTR_FLAG_TIMER0
	lsl r0, r1, r0
	orr r0, r0, #INTR_FLAG_GAMEPAK
	orr r1, r0, #INTR_FLAG_SERIAL | INTR_FLAG_TIMER3 | INTR_FLAG_VCOUNT | INTR_FLAG_HBLANK
	and r1, r1, r2
	strh r1, [r3, #0]
	mrs r3, cpsr
	bic r3, r3, #PSR_I_BIT | PSR_F_BIT | PSR_MODE_MASK
	orr r3, r3, #PSR_SYS_MODE
	msr cpsr_cf, r3
	ldr r1, =gIntrTable
	add r1, r1, r12
	ldr r0, [r1]
	stmdb sp!, {lr}
	adr lr, intr_return
	bx r0
intr_return:
	ldmia sp!, {lr}
	mrs r3, cpsr
	bic r3, r3, #PSR_I_BIT | PSR_F_BIT | PSR_MODE_MASK
	orr r3, r3, #PSR_I_BIT | PSR_IRQ_MODE
	msr cpsr_cf, r3
	ldmia sp!, {r0-r3,lr}
	strh r2, [r3, #0]
	strh r1, [r3, #REG_IME - REG_IE]
	msr spsr_cf, r0
	bx lr

	.pool

.ifdef SRAM
	.arm
	.align 2, 0
	.global sub_08fa0074
sub_08fa0074:
	stmdb sp!, {r0-r7}
	ldr r0, =0x04000208 @ "#REG_IME"
	ldr r1, =0x0203fc00
	ldrh r2, [r0]
	strh r2, [r1]
	ldr r0, =0x04000200 @ "REG_IE"
	ldr r1, =0x0203fc02
	ldrh r2, [r0]
	strh r2, [r1], #2
	mov r0, #0x04000000
	ldrh r2, [r0, #0x82]
	strh r2, [r1], #2
	ldrh r2, [r0, #0x80]
	strh r2, [r1], #2
	ldrh r2, [r0, #0xba]
	strh r2, [r1], #2
	ldrh r2, [r0, #0xc6]
	strh r2, [r1], #2
	ldrh r2, [r0, #0xd2]
	strh r2, [r1], #2
	ldrh r2, [r0, #0xde]
	strh r2, [r1], #2
	mov r0, #0
	ldr r1, =0x04000208
	strh r0, [r1]
	ldr r1, =0x04000200
	strh r0, [r1]
	mov r1, #0x04000000
	strh r0, [r1, #0x80]
	strh r0, [r1, #0xba]
	strh r0, [r1, #0xc6]
	strh r0, [r1, #0xd2]
	strh r0, [r1, #0xde]
	mov r0, #3
	strh r0, [r1, #0x82]
	ldr r0, =0x04000084 @ "REG_SOUNDCNT_X"
	ldrh r1, [r0]
	b _08fa0198
_08fa010c:
	ldr r0, =0x04000208
	ldr r1, =0x0203fc00
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, =0x04000200
	ldr r1, =0x0203fc02
	ldrh r2, [r1], #2
	strh r2, [r0]
	mov r0, #0x04000000
	ldrh r2, [r1], #2
	strh r2, [r0, #0x82]
	ldrh r2, [r1], #2
	strh r2, [r0, #0x80]
	ldrh r2, [r1], #2
	strh r2, [r0, #0xba]
	ldrh r2, [r1], #2
	strh r2, [r0, #0xc6]
	ldrh r2, [r1], #2
	strh r2, [r0, #0xd2]
	ldrh r2, [r1], #2
	strh r2, [r0, #0xde]
	ldmia sp!, {r0-r7}
@ "return"
	ldr r0, =_return_thumb_mode+1
	bx r0

	.pool

_08fa0198:
	ldr r0, =0x0203fc10
	ldr r1, =_08fa01c4
	ldr r2, =_08fa0358
_08fa01a4:
	ldr r3, [r1]
	str r3, [r0]
	add r1, r1, #4
	add r0, r0, #4
	cmp r1, r2
	bne _08fa01a4
	ldr r0, =0x0203fc10
	bx r0
_08fa01c4:
	ldr r0, =0xf0f0
	ldr r1, =0x08000154 @ "?"
	strh r0, [r1]
	ldr r0, =0x9898
	strh r0, [r1]
	ldr r0, =0x08000040 @ "?"
	ldrh r1, [r0]
	ldr r2, =0x5152
	cmp r1, r2
	bne _08fa0200
	ldr r0, =0xf0f0
	mov r1, #0x8000000
	strh r0, [r1]
	mov r0, #0
	b continue_08fa02dc
_08fa0200:
	mov r1, #0x8000000
	mov r1, #0xff
	strh r1, [r0]
	mov r0, r0
	mov r1, #0x50
	strh r1, [r0]
	mov r0, r0
	mov r1, #0x90
	strh r1, [r0]
	mov r0, r0
	mov r2, #8
_08fa022c:
	ldrh r1, [r0]
	cmp r1, #0x8a
	beq _08fa025c
	subs r2, r2, #1
	bne _08fa022c
	cmp r1, #0x89
	beq _08fa02e4
	mov r0, #0x8000000
	mov r1, #0xf0
	strh r1, [r0]
	mov r0, #2
	b continue_08fa02dc
_08fa025c:
	mov r0, #0x8000000
	mov r1, #0xff
	strh r1, [r0]
	mov r0, r0
	mov r1, #0x90
	strh r1, [r0]
	mov r0, r0
	mov r0, #0x8000000
	add r0, r0, #2
	ldrh r1, [r0]
	ldr r2, =0x8815
	cmp r1, r2
	bne _08fa02a0
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #3
	b continue_08fa02dc
_08fa02a0:
	ldr r2, =0x887d
	cmp r1, r2
	bne _08fa02c4
_08fa02ac:
	subs r0, r0, #2
	mov r6, #0
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #1
	b continue_08fa02dc
_08fa02c4:
	ldr r2, =0x88b0
	cmp r1, r2
	beq _08fa02ac
	mov r1, #0xf0
	strh r1, [r0]
	mov r0, #0
continue_08fa02dc:
	ldr r1, =_08fa02f8
	bx r1
_08fa02e4:
	mov r6, #0xff
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #1
	b continue_08fa02dc
_08fa02f8: @ "switch"
	cmp r0, #0
	beq _08fa0318
	cmp r0, #1
	beq _08fa031c
	cmp r0, #2
	beq _08fa0320
	cmp r0, #3
	beq _08fa0324
_08fa0318:
	b _08fa035c
_08fa031c:
	b _08fa0678
_08fa0320:
	b _08fa0504
_08fa0324:
	b _08fa083c

	.pool

_08fa0358:
	mov r0, r0
_08fa035c:
	ldr r0, =0x0203fc10
	ldr r1, =_08fa0388
	ldr r2, =_08fa0500
_08fa0368:
	ldr r3, [r1]
	str r3, [r0]
	add r1, r1, #4
	add r0, r0, #4
	cmp r1, r2
	bne _08fa0368
	ldr r0, =0x0203fc10
	bx r0
_08fa0388:
	mov r2, #0xfc
	mov r2, r2, lsl #16
	mov r0, #0x8000000
	orr r2, r2, r0
	ldr r0, =0x08001554 @ "?"
	ldr r1, =0x08000aaa @ "?"
	ldr r4, =0xaaa9
	ldr r5, =0x5556
	ldr r3, =0xf0f1
	subs r3, r3, #1
	strh r3, [r2]
	strh r4, [r0]
	strh r5, [r1]
	ldr r3, =0x8080
	strh r3, [r0]
	strh r4, [r0]
	strh r5, [r1]
	ldr r3, =0x3030
	strh r3, [r2]
	bl _08fa040c
	ldr r3, =0xf0f2
	subs r3, r3, #2
	strh r3, [r2]
	strh r4, [r0]
	strh r5, [r1]
	ldr r3, =0x2020
	strh r3, [r0]
	bl _08fa0470
	ldr r3, =0xf0f3
	subs r3, r3, #3
	strh r3, [r2]
	ldr r0, =_08fa010c
	bx r0
_08fa040c:
	stmdb sp!, {lr}
	mov r3, #0x100000
_08fa0414:
	subs r3, r3, #1
	beq _08fa043c
	ldrh r6, [r2]
	tst r6, #0x8000
	bne _08fa043c
	tst r6, #0x2000
	beq _08fa0414
	ldrh r6, [r2]
	tst r6, #0x8000
	beq _08fa0414
_08fa043c:
	mov r3, #0x100000
_08fa0440:
	subs r3, r3, #1
	beq _08fa0468
	ldrh r6, [r2]
	tst r6, #0x80
	bne _08fa0468
	tst r6, #0x20
	beq _08fa0440
	ldrh r6, [r2]
	tst r6, #0x80
	beq _08fa0440
_08fa0468:
	ldmia sp!, {lr}
	mov pc, lr
_08fa0470:
	stmdb sp!, {r2, lr}
	mov r1, #0xe000000
	mov r3, #16
	mov r3, r3, lsl #12
_08fa0480:
	ldrb r6, [r1], #1
	ldrb r7, [r1], #1
	orr r6, r6, r7, lsl #8
	ldr r5, =0xa0a0
	strh r5, [r2]
	mov r0, r0
	strh r6, [r2]
	mov r0, #0x100
_08fa04a0:
	ldrh r7, [r2]
	cmp r6, r7
	beq _08fa04b4
	subs r0, r0, #1
	bne _08fa04a0
_08fa04b4:
	add r2, r2, #2
	subs r3, r3, #2
	bne _08fa0480
	ldmia sp!, {r2, lr}
	mov pc, lr

	.pool

_08fa0500:
	mov r0, r0
_08fa0504:
	ldr r0, =0x0203fc10
	ldr r1, =_08fa0530
	ldr r2, =_08fa0674
_08fa0510:
	ldr r3, [r1]
	str r3, [r0]
	add r1, r1, #4
	add r0, r0, #4
	cmp r1, r2
	bne _08fa0510
	ldr r0, =0x0203fc10
	bx r0
_08fa0530:
	mov r2, #0xfc
	mov r2, r2, lsl #16
	mov r0, #0x8000000
	orr r2, r2, r0
	ldr r0, =0x08000aad @ "?"
	subs r0, r0, #3     @ "r0 = 0x08000aaa"
	ldr r1, =0x08000554 @ "?"
	mov r4, #0xa9
	mov r5, #0x56
	bl _08fa05b4
	strh r4, [r0]
	strh r5, [r1]
	mov r3, #0x80
	strh r3, [r0]
	strh r4, [r0]
	strh r5, [r1]
	mov r3, #0x30
	strh r3, [r2]
	bl _08fa0628
	bl _08fa05b4
	strh r4, [r0]
	strh r5, [r1]
	mov r3, #0x20
	strh r3, [r0]
	bl _08fa05d0
	mov r3, #0x90
	strh r3, [r2]
	mov r3, #0
	strh r3, [r2]
	bl _08fa05b4
	ldr r0, =_08fa010c + 3 @ "why +3 n sub #3 ?"
	subs r0, r0, #3
	bx r0

_08fa05b4:
	stmdb sp!, {lr}
	strh r4, [r0]
	strh r5, [r1]
	mov r3, #0xf0
	strh r3, [r2]
	ldmia sp!, {lr}
	mov pc, lr
_08fa05d0:
	stmdb sp!, {r0-r5, lr}
	mov r1, #0xe000000
	mov r3, #16
	mov r3, r3, lsl #12
_08fa05e0:
	ldrb r6, [r1], #1
	ldrb r7, [r1], #1
	orr r6, r6, r7, lsl #8
	ldr r5, =0xa0
	strh r5, [r2]
	mov r0, r0
	strh r6, [r2]
	mov r0, #0x100
_08fa0600:
	ldrh r7, [r2]
	cmp r6, r7
	beq _08fa0614
	subs r0, r0, #1
	bne _08fa0600
_08fa0614:
	add r2, r2, #2
	subs r3, r3, #2
	bne _08fa05e0
	ldmia sp!, {r0-r5, lr}
	mov pc, lr
_08fa0628:
	stmdb sp!, {r2, lr}
	mov r3, #0x100000
_08fa0630:
	subs r3, r3, #1
	beq _08fa0658
	ldrh r6, [r2]
	tst r6, #0x80
	bne _08fa0658
	tst r6, #0x20
	beq _08fa0630
	ldrh r6, [r2]
	tst r6, #0x80
	beq _08fa0630
_08fa0658:
	ldmia sp!, {r2, lr}
	mov pc, lr

	.pool

_08fa0674:
	mov r0, r0
_08fa0678:
	ldr r0, =0x0203fc10
	ldr r1, =_08fa06a4
	ldr r2, =_08fa0838
_08fa0684:
	ldr r3, [r1]
	str r3, [r0]
	add r1, r1, #4
	add r0, r0, #4
	cmp r1, r2
	bne _08fa0684
	ldr r0, =0x0203fc10
	bx r0
_08fa06a4:
	mov r2, #0xfc
	mov r2, r2, lsl #16
	mov r0, #0x8000000
	orr r2, r2, r0
	bl _08fa0794
	mov r5, #0xe000000
	mov r3, #16
	mov r3, r3, lsl #12
	bl _08fa06d4
	ldr r0, =_08fa010c + 1 @ "why +1 n sub #1 ?"
	subs r0, r0, #1
	bx r0
_08fa06d4:
	stmdb sp!, {lr}
_08fa06d8:
	mov r0, #0xff
	strh r0, [r2]
	mov r0, r0
	mov r0, #0x70
	strh r0, [r2]
	mov r0, r0
_08fa06f0:
	ldrb r0, [r2]
	and r0, r0, #0xff
	cmp r0, #0x80
	bne _08fa06f0
	mov r0, #0xff
	strh r0, [r2]
	mov r0, r0
	cmp r6, #0
	beq _08fa071c
	mov r0, #0xe9
	b _08fa0720
_08fa071c:
	mov r0, #0xea
_08fa0720:
	strh r0, [r2]
	mov r0, r0
	ldr r0, =0x01ff
	strh r0, [r2]
	mov r0, r0
	mov r1, #0x200
_08fa0738:
	ldrb r0, [r5]
	add r5, r5, #1
	ldrb r7, [r5]
	add r5, r5, #1
	orr r0, r0, r7, lsl #8
	strh r0, [r2]
	add r2, r2, #2
	subs r1, r1, #1
	bne _08fa0738
	mov r0, #0xd0
	strh r0, [r2]
	mov r0, r0
_08fa0768:
	ldrb r0, [r2]
	and r0, r0, #0xff
	cmp r0, #0x80
	bne _08fa0768
	mov r4, #0x400
	subs r3, r3, r4
	bne _08fa06d8
	mov r0, #0xff
	strh r0, [r2]
	ldmia sp!, {lr}
	mov pc, lr
_08fa0794:
	stmdb sp!, {r2, lr}
	mov r0, #0xff
	strh r0, [r2]
	mov r0, r0
	mov r0, #0x60
	strh r0, [r2]
	mov r0, r0
	mov r0, #0xd0
	strh r0, [r2]
	mov r0, r0
	mov r0, #0x90
	strh r0, [r2]
	mov r0, r0
	add r2, r2, #2
_08fa07cc:
	ldrb r0, [r2]
	and r0, r0, #3
	bne _08fa07cc
	subs r2, r2, #2
	mov r0, r0
	mov r0, #0xff
	strh r0, [r2]
	mov r0, r0
	mov r0, #0x20
	strh r0, [r2]
	mov r0, r0
	mov r0, #0xd0
	strh r0, [r2]
	mov r0, r0
_08fa0804:
	ldrb r0, [r2]
	and r0, r0, #0xff
	cmp r0, #0x80
	bne _08fa0804
	mov r0, r0
	mov r0, #0xff
	strh r0, [r2]
	ldmia sp!, {r2, lr}
	mov pc, lr

	.pool

_08fa0838:
	mov r0, r0
_08fa083c:
	ldr r0, =0x0203fc10
	ldr r1, =_08fa0868
	ldr r2, =_08fa09bc
_08fa0848:
	ldr r3, [r1]
	str r3, [r0]
	add r1, r1, #4
	add r0, r0, #4
	cmp r1, r2
	bne _08fa0848
	ldr r0, =0x0203fc10
	bx r0
_08fa0868:
	mov r2, #0xfc
	mov r2, r2, lsl #16
	mov r0, #0x8000000
	orr r2, r2, r0
	bl _08fa091c
	mov r5, #0xe000000
	mov r3, #16
	mov r3, r3, lsl #12
	bl _08fa0898
	ldr r0, =_08fa010c + 6 @ "why +6 n sub #6 ?"
	subs r0, r0, #6
	bx r0
_08fa0898:
	stmdb sp!, {lr}
_08fa089c:
	mov r0, #0xff
	strh r0, [r2]
	mov r0, r0
	mov r0, #0x70
	strh r0, [r2]
	mov r0, r0
_08fa08b4:
	ldrb r0, [r2]
	and r0, r0, #0xff
	cmp r0, #0x80
	bne _08fa08b4
	mov r0, #0xff
	strh r0, [r2]
	mov r0, r0
	mov r0, #0x40
	strh r0, [r2]
	ldrb r6, [r5]
	add r5, r5, #1
	ldrb r7, [r5]
	add r5, r5, #1
	orr r6, r6, r7, lsl #8
	strh r6, [r2]
_08fa08f0:
	ldrb r0, [r2]
	and r0, r0, #0xff
	cmp r0, #0x80
	bne _08fa08f0
	add r2, r2, #2
	sub r3, r3, #2
	bne _08fa089c
	mov r0, #0xff
	strh r0, [r2]
	ldmia sp!, {lr}
	mov pc, lr
_08fa091c:
	stmdb sp!, {r2, lr}
	mov r0, #0xff
	strh r0, [r2]
	mov r0, r0
	mov r0, #0x60
	strh r0, [r2]
	mov r0, r0
	mov r0, #0xd0
	strh r0, [r2]
	mov r0, r0
	mov r0, #0x90
	strh r0, [r2]
	mov r0, r0
	add r2, r2, #2
_08fa0954:
	ldrb r0, [r2]
	and r0, r0, #3
	bne _08fa0954
	subs r2, r2, #2
	mov r0, r0
	mov r0, #0xff
	strh r0, [r2]
	mov r0, r0
	mov r0, #0x20
	strh r0, [r2]
	mov r0, r0
	mov r0, #0xd0
	strh r0, [r2]
	mov r0, r0
_08fa098c:
	ldrb r0, [r2]
	and r0, r0, #0xff
	cmp r0, #0x80
	bne _08fa098c
	mov r0, r0
	mov r0, #0xff
	strh r0, [r2]
	ldmia sp!, {r2, lr}
	mov pc, lr

	.pool

_08fa09bc: @ "bruh"
	mov r0, r0
	mov r0, r0

	.thumb
	.align 2, 0
	.global go_arm_test
go_arm_test:
	ldr r0, =sub_08fa0074
	bx r0
_return_thumb_mode:
	pop {pc}
	.pool

.endif

	.align 2, 0 @ Don't pad with nop.
