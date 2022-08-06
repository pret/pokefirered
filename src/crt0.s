	.include "constants/gba_constants.inc"
	.include "constants/misc_constants.inc"
	.include "constants/version.inc"

	.syntax unified

	.arm
	.align 2, 0
	.global start_vector
start_vector:
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
	b start_vector

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

	.align 2, 0 @ Don't pad with nop.
