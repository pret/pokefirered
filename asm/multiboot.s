	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start MultiBootInit
MultiBootInit: @ 800BC20
	adds r2, r0, 0
	movs r1, 0
	strb r1, [r2, 0x1E]
	strb r1, [r2, 0x18]
	strb r1, [r2, 0x1D]
	adds r3, r2, 0
	adds r3, 0x4A
	movs r0, 0xF
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x48
	strb r1, [r0]
	strh r1, [r2, 0x16]
	ldr r0, _0800BC4C @ =0x04000134
	strh r1, [r0]
	ldr r2, _0800BC50 @ =0x04000128
	ldr r3, _0800BC54 @ =0x00002003
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _0800BC58 @ =0x0400012a
	strh r1, [r0]
	bx lr
	.align 2, 0
_0800BC4C: .4byte 0x04000134
_0800BC50: .4byte 0x04000128
_0800BC54: .4byte 0x00002003
_0800BC58: .4byte 0x0400012a
	thumb_func_end MultiBootInit

	thumb_func_start MultiBootMain
MultiBootMain: @ 800BC5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	bl MultiBootCheckComplete
	cmp r0, 0
	beq _0800BC72
	b _0800C03A
_0800BC72:
	adds r0, r7, 0
	adds r0, 0x4A
	ldrb r1, [r0]
	mov r10, r0
	cmp r1, 0xF
	bls _0800BC86
	subs r0, r1, 0x1
	mov r1, r10
	strb r0, [r1]
	b _0800C03A
_0800BC86:
	adds r1, r7, 0
	adds r1, 0x48
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800BCB0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0800BCAC @ =0x04000128
	ldrh r0, [r0]
	movs r5, 0xFC
	ands r5, r0
	cmp r5, 0x8
	beq _0800BCB0
	adds r0, r7, 0
	bl MultiBootInit
	movs r0, 0x8
	eors r0, r5
	b _0800C03C
	.align 2, 0
_0800BCAC: .4byte 0x04000128
_0800BCB0:
	ldrb r0, [r7, 0x18]
	cmp r0, 0xDF
	bls _0800BD02
	adds r0, r7, 0
	bl MultiBootHandShake
	adds r5, r0, 0
	cmp r5, 0
	beq _0800BCC4
	b _0800C03C
_0800BCC4:
	adds r0, r7, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800BCE0
	ldrb r0, [r7, 0x18]
	cmp r0, 0xE1
	bls _0800BCE0
	adds r0, r7, 0
	bl MultiBootCheckComplete
	cmp r0, 0
	bne _0800BCE0
	b _0800C02A
_0800BCE0:
	adds r0, r7, 0
	bl MultiBootCheckComplete
	cmp r0, 0
	beq _0800BCEC
	b _0800C03A
_0800BCEC:
	ldrh r0, [r7, 0x16]
	cmp r0, 0
	bne _0800BCFC
	adds r0, r7, 0
	bl MultiBootInit
	movs r0, 0x71
	b _0800C03C
_0800BCFC:
	subs r0, 0x1
	strh r0, [r7, 0x16]
	b _0800C03A
_0800BD02:
	ldrb r0, [r7, 0x18]
	cmp r0, 0x2
	bne _0800BD0A
	b _0800BE40
_0800BD0A:
	cmp r0, 0x2
	bgt _0800BD18
	cmp r0, 0
	beq _0800BD26
	cmp r0, 0x1
	beq _0800BDE2
	b _0800BF78
_0800BD18:
	cmp r0, 0xD0
	bne _0800BD1E
	b _0800BE8C
_0800BD1E:
	cmp r0, 0xD1
	bne _0800BD24
	b _0800BF26
_0800BD24:
	b _0800BF78
_0800BD26:
	movs r3, 0xE
	movs r5, 0x3
	ldr r0, _0800BD6C @ =0x04000120
	ldrh r0, [r0, 0x6]
	adds r1, r0, 0
	ldr r0, _0800BD70 @ =0x0000ffff
	ldrb r2, [r7, 0x1E]
	adds r6, r2, 0
	cmp r1, r0
	bne _0800BD4E
	adds r4, r1, 0
	ldr r1, _0800BD74 @ =0x04000126
_0800BD3E:
	asrs r3, 1
	subs r1, 0x2
	subs r5, 0x1
	cmp r5, 0
	beq _0800BD4E
	ldrh r0, [r1]
	cmp r0, r4
	beq _0800BD3E
_0800BD4E:
	movs r0, 0xE
	ands r3, r0
	strb r3, [r7, 0x1D]
	movs r5, 0x3
	ldr r0, _0800BD6C @ =0x04000120
	ldrh r0, [r0, 0x6]
	adds r4, r0, 0
	asrs r0, r2, 3
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800BD7C
	ldr r0, _0800BD78 @ =0x00007208
	b _0800BDA2
	.align 2, 0
_0800BD6C: .4byte 0x04000120
_0800BD70: .4byte 0x0000ffff
_0800BD74: .4byte 0x04000126
_0800BD78: .4byte 0x00007208
_0800BD7C:
	subs r5, 0x1
	cmp r5, 0
	beq _0800BDA8
	lsls r0, r5, 1
	ldr r1, _0800BDD0 @ =0x04000120
	adds r0, r1
	ldrh r0, [r0]
	adds r4, r0, 0
	adds r0, r2, 0
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800BD7C
	adds r0, r1, 0
	lsls r0, r5
	movs r1, 0xE4
	lsls r1, 7
	orrs r0, r1
_0800BDA2:
	cmp r4, r0
	beq _0800BD7C
	movs r3, 0
_0800BDA8:
	adds r0, r3, 0
	ands r0, r6
	strb r0, [r7, 0x1E]
	cmp r3, 0
	bne _0800BDB8
	movs r0, 0xF
	mov r2, r10
	strb r0, [r2]
_0800BDB8:
	mov r1, r10
	ldrb r0, [r1]
	cmp r0, 0
	bne _0800BDD4
	ldrb r0, [r7, 0x1D]
	ldrb r2, [r7, 0x1E]
	cmp r0, r2
	beq _0800BDDA
	adds r0, r7, 0
	bl MultiBootStartProbe
	b _0800BDE2
	.align 2, 0
_0800BDD0: .4byte 0x04000120
_0800BDD4:
	subs r0, 0x1
	mov r1, r10
	strb r0, [r1]
_0800BDDA:
	ldrb r1, [r7, 0x1E]
	movs r2, 0xC4
	lsls r2, 7
	b _0800BEE2
_0800BDE2:
	adds r1, r7, 0
	adds r1, 0x49
	movs r0, 0
	strb r0, [r1]
	movs r5, 0x3
	mov r12, r1
	ldr r3, _0800BE38 @ =gUnknown_3000E6C
_0800BDF0:
	lsls r0, r5, 1
	ldr r2, _0800BE3C @ =0x04000120
	adds r0, r2
	ldrh r0, [r0]
	adds r4, r0, 0
	asrs r0, r4, 8
	subs r2, r5, 0x1
	cmp r0, 0x72
	bne _0800BE1A
	lsls r0, r2, 1
	adds r0, r3
	strh r4, [r0]
	movs r0, 0xFF
	ands r4, r0
	movs r0, 0x1
	lsls r0, r5
	cmp r4, r0
	bne _0800BE1A
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
_0800BE1A:
	adds r5, r2, 0
	cmp r5, 0
	bne _0800BDF0
	ldrb r0, [r7, 0x1D]
	mov r1, r12
	ldrb r1, [r1]
	cmp r0, r1
	bne _0800BDDA
	movs r0, 0x2
	strb r0, [r7, 0x18]
	mov r2, r12
	ldrb r1, [r2]
	movs r2, 0xC2
	lsls r2, 7
	b _0800BEE2
	.align 2, 0
_0800BE38: .4byte gUnknown_3000E6C
_0800BE3C: .4byte 0x04000120
_0800BE40:
	movs r5, 0x3
	movs r0, 0x49
	adds r0, r7
	mov r12, r0
	mov r4, r12
	movs r6, 0x1
	ldr r1, _0800BE84 @ =gUnknown_3000E6C
	mov r9, r1
	ldr r2, _0800BE88 @ =0x04000120
	mov r8, r2
_0800BE54:
	ldrb r3, [r4]
	adds r0, r3, 0
	asrs r0, r5
	ands r0, r6
	subs r2, r5, 0x1
	cmp r0, 0
	beq _0800BE7A
	lsls r0, r5, 1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, 1
	add r0, r9
	ldrh r0, [r0]
	cmp r1, r0
	beq _0800BE7A
	adds r0, r6, 0
	lsls r0, r5
	eors r3, r0
	strb r3, [r4]
_0800BE7A:
	adds r5, r2, 0
	cmp r5, 0
	bne _0800BE54
	b _0800BFE0
	.align 2, 0
_0800BE84: .4byte gUnknown_3000E6C
_0800BE88: .4byte 0x04000120
_0800BE8C:
	movs r3, 0x1
	movs r5, 0x3
	movs r0, 0x49
	adds r0, r7
	mov r12, r0
	adds r6, r7, 0
	adds r6, 0x19
	ldr r1, _0800BEF0 @ =gUnknown_3000E6C
	mov r8, r1
_0800BE9E:
	lsls r0, r5, 1
	ldr r2, _0800BEF4 @ =0x04000120
	adds r0, r2
	ldrh r0, [r0]
	adds r4, r0, 0
	subs r2, r5, 0x1
	adds r0, r6, r2
	strb r4, [r0]
	mov r0, r12
	ldrb r1, [r0]
	asrs r1, r5
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0800BED2
	asrs r0, r4, 8
	subs r0, 0x72
	cmp r0, 0x1
	bls _0800BEC6
	b _0800C030
_0800BEC6:
	lsls r0, r2, 1
	add r0, r8
	ldrh r0, [r0]
	cmp r4, r0
	bne _0800BED2
	movs r3, 0
_0800BED2:
	adds r5, r2, 0
	cmp r5, 0
	bne _0800BE9E
	cmp r3, 0
	bne _0800BEF8
	ldrb r1, [r7, 0x1C]
	movs r2, 0xC6
	lsls r2, 7
_0800BEE2:
	adds r0, r2, 0
	orrs r1, r0
	adds r0, r7, 0
	bl MultiBootSend
	b _0800C03C
	.align 2, 0
_0800BEF0: .4byte gUnknown_3000E6C
_0800BEF4: .4byte 0x04000120
_0800BEF8:
	movs r0, 0xD1
	strb r0, [r7, 0x18]
	movs r3, 0x11
	movs r5, 0x3
	adds r1, r6, 0x2
_0800BF02:
	ldrb r0, [r1]
	adds r3, r0
	subs r1, 0x1
	subs r5, 0x1
	cmp r5, 0
	bne _0800BF02
	strb r3, [r7, 0x14]
	movs r0, 0xFF
	ands r3, r0
	movs r1, 0xC8
	lsls r1, 7
	adds r0, r1, 0
	orrs r3, r0
	adds r0, r7, 0
	adds r1, r3, 0
	bl MultiBootSend
	b _0800C03C
_0800BF26:
	movs r5, 0x3
	movs r2, 0x49
	ldrb r1, [r2, r7]
	ldr r2, _0800BF64 @ =0x04000126
	movs r3, 0x1
_0800BF30:
	ldrh r0, [r2]
	adds r4, r0, 0
	adds r0, r1, 0
	asrs r0, r5
	ands r0, r3
	cmp r0, 0
	beq _0800BF44
	asrs r0, r4, 8
	cmp r0, 0x73
	bne _0800C030
_0800BF44:
	subs r2, 0x2
	subs r5, 0x1
	cmp r5, 0
	bne _0800BF30
	adds r0, r7, 0
	bl MultiBoot
	adds r5, r0, 0
	cmp r5, 0
	bne _0800BF68
	movs r0, 0xE0
	strb r0, [r7, 0x18]
	adds r0, 0xB0
	strh r0, [r7, 0x16]
	b _0800C03A
	.align 2, 0
_0800BF64: .4byte 0x04000126
_0800BF68:
	adds r0, r7, 0
	bl MultiBootInit
	movs r0, 0x1E
	mov r1, r10
	strb r0, [r1]
	movs r0, 0x70
	b _0800C03C
_0800BF78:
	movs r5, 0x3
	movs r2, 0x49
	adds r2, r7
	mov r12, r2
	mov r8, r12
	movs r0, 0x1
	mov r9, r0
_0800BF86:
	mov r1, r8
	ldrb r6, [r1]
	adds r0, r6, 0
	asrs r0, r5
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	beq _0800BFC0
	lsls r0, r5, 1
	ldr r1, _0800BFDC @ =0x04000120
	adds r0, r1
	ldrh r0, [r0]
	adds r4, r0, 0
	asrs r2, r4, 8
	ldrb r0, [r7, 0x18]
	lsrs r0, 1
	movs r1, 0x62
	subs r1, r0
	mov r3, r9
	lsls r3, r5
	cmp r2, r1
	bne _0800BFBA
	movs r0, 0xFF
	ands r4, r0
	cmp r4, r3
	beq _0800BFC0
_0800BFBA:
	eors r6, r3
	mov r2, r8
	strb r6, [r2]
_0800BFC0:
	subs r5, 0x1
	cmp r5, 0
	bne _0800BF86
	ldrb r0, [r7, 0x18]
	cmp r0, 0xC4
	bne _0800BFE0
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0xE
	ands r0, r1
	strb r0, [r7, 0x1E]
	strb r5, [r7, 0x18]
	b _0800BDDA
	.align 2, 0
_0800BFDC: .4byte 0x04000120
_0800BFE0:
	mov r1, r12
	ldrb r0, [r1]
	cmp r0, 0
	bne _0800BFF2
	adds r0, r7, 0
	bl MultiBootInit
	movs r0, 0x50
	b _0800C03C
_0800BFF2:
	ldrb r0, [r7, 0x18]
	adds r0, 0x2
	strb r0, [r7, 0x18]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC4
	bne _0800C002
	b _0800BDDA
_0800C002:
	ldrb r0, [r7, 0x18]
	ldr r1, [r7, 0x28]
	adds r0, r1
	subs r1, r0, 0x3
	ldrb r2, [r1]
	lsls r2, 8
	subs r0, 0x4
	ldrb r1, [r0]
	orrs r1, r2
	adds r0, r7, 0
	bl MultiBootSend
	adds r5, r0, 0
	cmp r5, 0
	bne _0800C03C
	adds r0, r7, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800C03A
_0800C02A:
	bl MultiBootWaitSendDone
	b _0800BC86
_0800C030:
	adds r0, r7, 0
	bl MultiBootInit
	movs r0, 0x60
	b _0800C03C
_0800C03A:
	movs r0, 0
_0800C03C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end MultiBootMain

	thumb_func_start MultiBootSend
MultiBootSend: @ 800C04C
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800C078 @ =0x04000128
	ldrh r0, [r3]
	movs r4, 0x8C
	ands r4, r0
	cmp r4, 0x8
	bne _0800C084
	ldr r0, _0800C07C @ =0x0400012a
	strh r1, [r0]
	ldr r1, _0800C080 @ =0x00002083
	adds r0, r1, 0
	strh r0, [r3]
	adds r1, r2, 0
	adds r1, 0x48
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0
	b _0800C090
	.align 2, 0
_0800C078: .4byte 0x04000128
_0800C07C: .4byte 0x0400012a
_0800C080: .4byte 0x00002083
_0800C084:
	adds r0, r2, 0
	bl MultiBootInit
	movs r0, 0x8
	eors r4, r0
	adds r0, r4, 0
_0800C090:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MultiBootSend

	thumb_func_start MultiBootStartProbe
MultiBootStartProbe: @ 800C098
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	beq _0800C0AA
	adds r0, r1, 0
	bl MultiBootInit
	b _0800C0B6
_0800C0AA:
	adds r2, r1, 0
	adds r2, 0x4A
	strb r0, [r2]
	strb r0, [r1, 0x1E]
	movs r0, 0x1
	strb r0, [r1, 0x18]
_0800C0B6:
	pop {r0}
	bx r0
	thumb_func_end MultiBootStartProbe

	thumb_func_start MultiBootStartMaster
MultiBootStartMaster: @ 800C0BC
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	ldr r0, [sp, 0x14]
	lsls r3, 24
	lsrs r5, r3, 24
	lsls r0, 24
	lsrs r7, r0, 24
	movs r3, 0
	ldrb r0, [r4, 0x18]
	cmp r0, 0
	bne _0800C0F8
	ldrb r0, [r4, 0x1E]
	cmp r0, 0
	beq _0800C0F8
	adds r0, r4, 0
	adds r0, 0x4A
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800C0F8
	str r6, [r4, 0x20]
	adds r2, 0xF
	movs r0, 0x10
	negs r0, r0
	ands r2, r0
	subs r0, 0xF0
	adds r1, r2, r0
	ldr r0, _0800C100 @ =0x0003ff00
	cmp r1, r0
	bls _0800C104
_0800C0F8:
	adds r0, r4, 0
	bl MultiBootInit
	b _0800C178
	.align 2, 0
_0800C100: .4byte 0x0003ff00
_0800C104:
	adds r0, r6, r2
	str r0, [r4, 0x24]
	lsls r1, r7, 24
	movs r2, 0x80
	lsls r2, 19
	adds r0, r1, r2
	asrs r0, 24
	adds r2, r1, 0
	cmp r0, 0x8
	bhi _0800C164
	lsls r0, 2
	ldr r1, _0800C124 @ =_0800C128
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800C124: .4byte _0800C128
	.align 2, 0
_0800C128:
	.4byte _0800C14C
	.4byte _0800C14C
	.4byte _0800C14C
	.4byte _0800C14C
	.4byte _0800C156
	.4byte _0800C15C
	.4byte _0800C15C
	.4byte _0800C15C
	.4byte _0800C15C
_0800C14C:
	lsls r3, r5, 3
	asrs r1, r2, 24
	movs r0, 0x3
	subs r0, r1
	b _0800C162
_0800C156:
	movs r0, 0x38
	adds r3, r5, 0
	b _0800C162
_0800C15C:
	lsls r3, r5, 3
	asrs r0, r2, 24
	subs r0, 0x1
_0800C162:
	orrs r3, r0
_0800C164:
	movs r0, 0x3F
	ands r3, r0
	lsls r0, r3, 1
	movs r2, 0x7F
	negs r2, r2
	adds r1, r2, 0
	orrs r0, r1
	strb r0, [r4, 0x1C]
	movs r0, 0xD0
	strb r0, [r4, 0x18]
_0800C178:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end MultiBootStartMaster

	thumb_func_start MultiBootCheckComplete
MultiBootCheckComplete: @ 800C180
	push {lr}
	ldrb r0, [r0, 0x18]
	cmp r0, 0xE9
	beq _0800C18C
	movs r0, 0
	b _0800C18E
_0800C18C:
	movs r0, 0x1
_0800C18E:
	pop {r1}
	bx r1
	thumb_func_end MultiBootCheckComplete

	thumb_func_start MultiBootHandShake
MultiBootHandShake: @ 800C194
	push {r4-r6,lr}
	adds r3, r0, 0
	ldrb r0, [r3, 0x18]
	cmp r0, 0xE0
	beq _0800C1B0
	cmp r0, 0xE0
	blt _0800C1C0
	cmp r0, 0xE8
	bgt _0800C1C0
	cmp r0, 0xE7
	blt _0800C1C0
	movs r4, 0x3
	ldrb r5, [r3, 0x1E]
	b _0800C220
_0800C1B0:
	movs r1, 0
	movs r0, 0xE1
	strb r0, [r3, 0x18]
	str r1, [r3, 0x4]
	movs r0, 0x80
	lsls r0, 13
	str r0, [r3]
	b _0800C212
_0800C1C0:
	movs r4, 0x3
	ldrb r5, [r3, 0x1E]
	movs r6, 0x1
	ldr r1, _0800C21C @ =0x04000126
_0800C1C8:
	ldrh r0, [r1]
	adds r2, r0, 0
	adds r0, r5, 0
	asrs r0, r4
	ands r0, r6
	cmp r0, 0
	beq _0800C1DC
	ldr r0, [r3, 0x4]
	cmp r2, r0
	bne _0800C1B0
_0800C1DC:
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bne _0800C1C8
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	strb r0, [r3, 0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, 0x4]
	cmp r1, 0
	bne _0800C20A
	ldr r0, [r3, 0x28]
	adds r1, r0, 0
	adds r1, 0xAC
	ldrb r1, [r1]
	adds r0, 0xAD
	ldrb r0, [r0]
	lsls r0, 8
	orrs r1, r0
	str r1, [r3, 0x4]
	lsls r1, 5
	str r1, [r3]
_0800C20A:
	ldr r0, [r3]
	lsrs r0, 5
	str r0, [r3]
_0800C210:
	ldrh r1, [r3]
_0800C212:
	adds r0, r3, 0
	bl MultiBootSend
	b _0800C278
	.align 2, 0
_0800C21C: .4byte 0x04000126
_0800C220:
	lsls r0, r4, 1
	ldr r1, _0800C268 @ =0x04000120
	adds r0, r1
	ldrh r0, [r0]
	adds r2, r0, 0
	adds r0, r5, 0
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800C23C
	ldr r0, [r3, 0x4]
	cmp r2, r0
	bne _0800C26C
_0800C23C:
	subs r4, 0x1
	cmp r4, 0
	bne _0800C220
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	strb r0, [r3, 0x18]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE9
	beq _0800C276
	ldr r0, [r3, 0x28]
	adds r1, r0, 0
	adds r1, 0xAE
	ldrb r1, [r1]
	adds r0, 0xAF
	ldrb r0, [r0]
	lsls r0, 8
	orrs r1, r0
	str r1, [r3]
	str r1, [r3, 0x4]
	b _0800C210
	.align 2, 0
_0800C268: .4byte 0x04000120
_0800C26C:
	adds r0, r3, 0
	bl MultiBootInit
	movs r0, 0x71
	b _0800C278
_0800C276:
	movs r0, 0
_0800C278:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end MultiBootHandShake

	thumb_func_start MultiBootWaitCycles
MultiBootWaitCycles: @ 800C280
	mov r2, pc
	lsrs r2, 24
	movs r1, 0xC
	cmp r2, 0x2
	beq _0800C292
	movs r1, 0xD
	cmp r2, 0x8
	beq _0800C292
	movs r1, 0x4
_0800C292:
	subs r0, r1
	bgt _0800C292
	bx lr
	thumb_func_end MultiBootWaitCycles

	thumb_func_start MultiBootWaitSendDone
MultiBootWaitSendDone: @ 800C298
	push {r4,r5,lr}
	movs r2, 0
	ldr r3, _0800C2CC @ =0x04000128
	ldrh r1, [r3]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0800C2BC
	ldr r5, _0800C2D0 @ =0x0000795c
	movs r4, 0x80
_0800C2AC:
	adds r2, 0x1
	cmp r2, r5
	bgt _0800C2BC
	ldrh r1, [r3]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _0800C2AC
_0800C2BC:
	movs r0, 0x96
	lsls r0, 2
	bl MultiBootWaitCycles
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800C2CC: .4byte 0x04000128
_0800C2D0: .4byte 0x0000795c
	thumb_func_end MultiBootWaitSendDone

	.align 2, 0 @ Don't pad with nop.
