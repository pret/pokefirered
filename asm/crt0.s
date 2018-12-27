	.include "constants/gba_constants.inc"

	.syntax unified

	.global Start

	.text

	.arm

Start: @ 8000000
	b Init

	.include "asm/rom_header.inc"

@ 80000C0
	.word 0

	.global GPIOPortData
GPIOPortData: @ 80000C4
	.hword 0

	.global GPIOPortDirection
GPIOPortDirection: @ 80000C6
	.hword 0

	.global GPIOPortReadEnable
GPIOPortReadEnable: @ 80000C8
	.hword 0

	.space 6

@ 80000D0

@ TODO: figure out what this data is

	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte          4
	.4byte          2
	.ascii "pokemon red version"
	.space 13
	.4byte  0x82350AC @ gMonFrontPicTable
	.4byte  0x823654C @ gMonBackPicTable
	.4byte  0x823730C @ gMonPaletteTable
	.4byte  0x82380CC @ gMonShinyPaletteTable
	.4byte  0x83D37A0 @ gMonIconTable
	.4byte  0x83D3E80 @ gMonIconPaletteIndices
	.4byte  0x83D4038 @ gMonIconPaletteTable
	.4byte  0x8245EE0 @ gSpeciesNames
	.4byte  0x8247094 @ gMoveNames
	.4byte  0x84556F8 @ gDecorations
	.4byte      0xEE0 @ offsetof(struct SaveBlock1, flags)
	.4byte     0x1000 @ offsetof(struct SaveBlock1, vars)
	.4byte       0x18 @ offsetof(struct SaveBlock2, pokedex)
	.4byte      0x5F8 @ offsetof(struct SaveBlock1, seen1)
	.4byte     0x3A18 @ offsetof(struct SaveBlock1, seen2)
	.4byte       0x3C
	.4byte      0x838
	.4byte      0x839
	.4byte      0x182
	.4byte  0xA0A0A07
	.4byte  0xC060C0C
	.4byte  0xC121006
	.4byte  0x8010B0F
	.4byte        0xC
	.4byte      0xF24 @ sizeof(struct SaveBlock2)
	.4byte     0x3D68 @ sizeof(struct SaveBlock1)
	.4byte       0x34 @ offsetof(struct SaveBlock1, playerPartyCount)
	.4byte       0x38 @ offsetof(struct SaveBlock1, playerParty)
	.4byte          9 @ offsetof(struct SaveBlock2, specialSaveWarp)
	.4byte        0xA @ offsetof(struct SaveBlock2, playerTrainerId)
	.4byte          0 @ offsetof(struct SaveBlock2, playerName)
	.4byte          8 @ offsetof(struct SaveBlock2, playerGender)

	.4byte       0xAD @ offsetof(struct SaveBlock2, ?????? (0xAD))
	.4byte       0xAD @ offsetof(struct SaveBlock2, ?????? (0xAD))
	.4byte     0x30BB
	.4byte     0x30A7
	.4byte          0
	.4byte  0x8254784 @ gBaseStats
	.4byte  0x824FC40 @ gAbilityNames
	.4byte  0x824FB08 @ gAbilityDescriptionPointers
	.4byte  0x83DB028 @ gItems
	.4byte  0x8250C04 @ gBattleMoves
	.4byte  0x826056C @ gBallSpriteSheets
	.4byte  0x82605CC @ gBallSpritePalettes
	.4byte       0xA8
	.4byte      0x82C
	.4byte      0x83B
	.4byte 0x3A0D1E2A
	.4byte     0x1E2B
	.4byte      0x298 @ offsetof(struct SaveBlock1, pcItems)  // maybe all items were in a struct together?
	.4byte     0x309C @ offsetof(struct SaveBlock1, giftRibbons)
	.4byte     0x30EC @ offsetof(struct SaveBlock1, enigmaBerry)
	.4byte       0x34 @ size of SaveBlock1 map header reconstruction data?
	.4byte          0
	.4byte 0xFFFFFFFF

	.arm
	.align 2, 0
	.global Init
Init:
	mov r0, PSR_IRQ_MODE
	msr cpsr_cf, r0
	ldr sp, sp_irq
	mov r0, PSR_SYS_MODE
	msr cpsr_cf, r0
	ldr sp, sp_sys
	ldr r1, =INTR_VECTOR
	adr r0, IntrMain
	str r0, [r1]
	ldr r1, =AgbMain
	mov lr, pc
	bx r1
	b Init

	.align 2, 0
sp_sys: .word IWRAM_END - 0x1C0
sp_irq: .word IWRAM_END - 0x60

	.pool

	.arm
	.align 2, 0
	.global IntrMain
IntrMain:
	mov r3, REG_BASE
	add r3, r3, 0x200
	ldr r2, [r3, OFFSET_REG_IE - 0x200]
	ldrh r1, [r3, OFFSET_REG_IME - 0x200]
	mrs r0, spsr
	stmdb sp!, {r0-r3,lr}
	mov r0, 0
	strh r0, [r3, OFFSET_REG_IME - 0x200]
	and r1, r2, r2, lsr 16
	mov r12, 0
	ands r0, r1, INTR_FLAG_VCOUNT
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	mov r0, 0x1
	strh r0, [r3, OFFSET_REG_IME - 0x200]
	ands r0, r1, INTR_FLAG_SERIAL
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER3
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_HBLANK
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_VBLANK
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER0
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER1
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER2
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA0
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA1
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA2
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA3
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_KEYPAD
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_GAMEPAK
	strbne r0, [r3, OFFSET_REG_SOUNDCNT_X - 0x200]
	bne . @ spin
IntrMain_FoundIntr:
	strh r0, [r3, OFFSET_REG_IF - 0x200]
	bic r2, r2, r0
	ldr r0, =gRfuState
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	mov r1, 0x8
	mov r0, r1, lsl r0
	orr r0, r0, INTR_FLAG_GAMEPAK
	orr r1, r0, INTR_FLAG_SERIAL | INTR_FLAG_TIMER3 | INTR_FLAG_VCOUNT | INTR_FLAG_HBLANK
	and r1, r1, r2
	strh r1, [r3, OFFSET_REG_IE - 0x200]
	mrs r3, cpsr
	bic r3, r3, PSR_I_BIT | PSR_F_BIT | PSR_MODE_MASK
	orr r3, r3, PSR_SYS_MODE
	msr cpsr_cf, r3
	ldr r1, =gIntrTable
	add r1, r1, r12
	ldr r0, [r1]
	stmdb sp!, {lr}
	adr lr, IntrMain_RetAddr
	bx r0
IntrMain_RetAddr:
	ldmia sp!, {lr}
	mrs r3, cpsr
	bic r3, r3, PSR_I_BIT | PSR_F_BIT | PSR_MODE_MASK
	orr r3, r3, PSR_I_BIT | PSR_IRQ_MODE
	msr cpsr_cf, r3
	ldmia sp!, {r0-r3,lr}
	strh r2, [r3, OFFSET_REG_IE - 0x200]
	strh r1, [r3, OFFSET_REG_IME - 0x200]
	msr spsr_cf, r0
	bx lr

	.pool

	.align 2, 0 @ Don't pad with nop.
