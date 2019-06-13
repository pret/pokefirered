	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813BC78
sub_813BC78: @ 813BC78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x24]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r7, r5, 16
	lsrs r0, r2, 24
	adds r2, r0, r4
	cmp r0, r2
	bge _0813BCDE
	mov r12, r2
	ldr r1, _0813BCF0 @ =gDecompressionBuffer + 0x3800
	mov r10, r1
_0813BCAE:
	mov r4, r9
	mov r2, r8
	adds r1, r4, r2
	adds r3, r0, 0x1
	cmp r4, r1
	bge _0813BCD6
	lsls r2, r0, 6
	mov r5, r10
_0813BCBE:
	lsls r0, r4, 1
	adds r0, r2, r0
	adds r0, r5
	strh r6, [r0]
	adds r0, r6, r7
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r1
	blt _0813BCBE
_0813BCD6:
	lsls r0, r3, 16
	lsrs r0, 16
	cmp r0, r12
	blt _0813BCAE
_0813BCDE:
	bl sub_813BC5C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813BCF0: .4byte gDecompressionBuffer + 0x3800
	thumb_func_end sub_813BC78

	thumb_func_start sub_813BCF4
sub_813BCF4: @ 813BCF4
	push {lr}
	sub sp, 0x8
	ldr r0, _0813BD10 @ =0x000001ff
	movs r1, 0x14
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0x1E
	bl sub_813BC78
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0813BD10: .4byte 0x000001ff
	thumb_func_end sub_813BCF4

	thumb_func_start sub_813BD14
sub_813BD14: @ 813BD14
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0813BD26
	cmp r2, 0x1
	beq _0813BD40
	b _0813BD54
_0813BD26:
	ldr r0, _0813BD3C @ =0x000001ff
	movs r1, 0x2
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x7
	bl sub_813BC78
	b _0813BD54
	.align 2, 0
_0813BD3C: .4byte 0x000001ff
_0813BD40:
	movs r0, 0xF4
	lsls r0, 1
	movs r1, 0x2
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x7
	bl sub_813BC78
_0813BD54:
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_813BD14

	thumb_func_start sub_813BD5C
sub_813BD5C: @ 813BD5C
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0813BD6E
	cmp r2, 0x1
	beq _0813BD88
	b _0813BD9C
_0813BD6E:
	ldr r0, _0813BD84 @ =0x000001ff
	movs r1, 0x2
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0xD
	movs r2, 0
	movs r3, 0x10
	bl sub_813BC78
	b _0813BD9C
	.align 2, 0
_0813BD84: .4byte 0x000001ff
_0813BD88:
	movs r0, 0xD0
	lsls r0, 1
	movs r1, 0x2
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0xD
	movs r2, 0
	movs r3, 0x10
	bl sub_813BC78
_0813BD9C:
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_813BD5C

	thumb_func_start sub_813BDA4
sub_813BDA4: @ 813BDA4
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0813BDB6
	cmp r2, 0x1
	beq _0813BDD0
	b _0813BDE2
_0813BDB6:
	ldr r0, _0813BDCC @ =0x000001ff
	movs r1, 0x10
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x2
	movs r2, 0x3
	movs r3, 0x1A
	bl sub_813BC78
	b _0813BDE2
	.align 2, 0
_0813BDCC: .4byte 0x000001ff
_0813BDD0:
	movs r0, 0x10
	str r0, [sp]
	str r2, [sp, 0x4]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x3
	movs r3, 0x1A
	bl sub_813BC78
_0813BDE2:
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_813BDA4

	thumb_func_start sub_813BDE8
sub_813BDE8: @ 813BDE8
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0813BDFA
	cmp r2, 0x1
	beq _0813BE14
	b _0813BE2A
_0813BDFA:
	ldr r0, _0813BE10 @ =0x000001ff
	movs r1, 0x10
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x1C
	bl sub_813BC78
	b _0813BE2A
	.align 2, 0
_0813BE10: .4byte 0x000001ff
_0813BE14:
	movs r0, 0xFD
	lsls r0, 1
	movs r1, 0x11
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x1C
	bl sub_813BC78
_0813BE2A:
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_813BDE8

	thumb_func_start sub_813BE30
sub_813BE30: @ 813BE30
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0813BE42
	cmp r2, 0x1
	beq _0813BE5C
	b _0813BE70
_0813BE42:
	ldr r0, _0813BE58 @ =0x000001ff
	movs r1, 0x5
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x2
	movs r2, 0xE
	movs r3, 0x1A
	bl sub_813BC78
	b _0813BE70
	.align 2, 0
_0813BE58: .4byte 0x000001ff
_0813BE5C:
	movs r0, 0x8F
	lsls r0, 1
	movs r1, 0x5
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x2
	movs r2, 0xE
	movs r3, 0x1A
	bl sub_813BC78
_0813BE70:
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_813BE30

	thumb_func_start sub_813BE78
sub_813BE78: @ 813BE78
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0813BE8A
	cmp r6, 0x1
	beq _0813BEB4
	b _0813BED8
_0813BE8A:
	ldr r5, _0813BEB0 @ =0x000001ff
	movs r4, 0x1
	str r4, [sp]
	str r6, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x1C
	bl sub_813BC78
	str r4, [sp]
	str r6, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x13
	movs r3, 0x1C
	bl sub_813BC78
	b _0813BED8
	.align 2, 0
_0813BEB0: .4byte 0x000001ff
_0813BEB4:
	ldr r0, _0813BEE0 @ =0x000001f7
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x1C
	bl sub_813BC78
	movs r0, 0xFC
	lsls r0, 1
	str r6, [sp]
	str r4, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x13
	movs r3, 0x1C
	bl sub_813BC78
_0813BED8:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813BEE0: .4byte 0x000001f7
	thumb_func_end sub_813BE78

	thumb_func_start sub_813BEE4
sub_813BEE4: @ 813BEE4
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0813BEF6
	cmp r6, 0x1
	beq _0813BF20
	b _0813BF44
_0813BEF6:
	ldr r5, _0813BF1C @ =0x000001ff
	movs r4, 0x1
	str r4, [sp]
	str r6, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x1C
	bl sub_813BC78
	str r4, [sp]
	str r6, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x13
	movs r3, 0x1C
	bl sub_813BC78
	b _0813BF44
	.align 2, 0
_0813BF1C: .4byte 0x000001ff
_0813BF20:
	ldr r0, _0813BF4C @ =0x000001fb
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x1C
	bl sub_813BC78
	movs r0, 0xFE
	lsls r0, 1
	str r6, [sp]
	str r4, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x13
	movs r3, 0x1C
	bl sub_813BC78
_0813BF44:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813BF4C: .4byte 0x000001fb
	thumb_func_end sub_813BEE4

	thumb_func_start sub_813BF50
sub_813BF50: @ 813BF50
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0813BF62
	cmp r6, 0x1
	beq _0813BF8C
	b _0813BFB2
_0813BF62:
	ldr r5, _0813BF88 @ =0x000001ff
	movs r4, 0x14
	str r4, [sp]
	str r6, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl sub_813BC78
	str r4, [sp]
	str r6, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x1D
	movs r2, 0
	movs r3, 0x1
	bl sub_813BC78
	b _0813BFB2
	.align 2, 0
_0813BF88: .4byte 0x000001ff
_0813BF8C:
	ldr r6, _0813BFBC @ =0x000001f9
	movs r5, 0x14
	str r5, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl sub_813BC78
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x1D
	movs r2, 0
	movs r3, 0x1
	bl sub_813BC78
_0813BFB2:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813BFBC: .4byte 0x000001f9
	thumb_func_end sub_813BF50

	thumb_func_start sub_813BFC0
sub_813BFC0: @ 813BFC0
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0813BFD2
	cmp r2, 0x1
	beq _0813BFE8
	b _0813BFFC
_0813BFD2:
	ldr r0, _0813BFE4 @ =0x000001ff
	movs r1, 0x1
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r2, 0x5
	movs r3, 0x1C
	bl sub_813BC78
	b _0813BFFC
	.align 2, 0
_0813BFE4: .4byte 0x000001ff
_0813BFE8:
	movs r0, 0xFE
	lsls r0, 1
	str r2, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x5
	movs r3, 0x1C
	bl sub_813BC78
_0813BFFC:
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_813BFC0

	thumb_func_start sub_813C004
sub_813C004: @ 813C004
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r6, 0
	beq _0813C01A
	cmp r6, 0x1
	beq _0813C040
	b _0813C06A
_0813C01A:
	ldr r5, _0813C03C @ =0x000001ff
	movs r4, 0x1
	str r4, [sp]
	str r6, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x1C
	movs r2, 0x3
	movs r3, 0x1
	bl sub_813BC78
	str r4, [sp]
	str r6, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x1C
	movs r2, 0x12
	b _0813C050
	.align 2, 0
_0813C03C: .4byte 0x000001ff
_0813C040:
	cmp r2, 0
	bne _0813C058
	movs r0, 0xFF
	lsls r0, 1
	str r6, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x1C
	movs r2, 0x3
_0813C050:
	movs r3, 0x1
	bl sub_813BC78
	b _0813C06A
_0813C058:
	ldr r0, _0813C074 @ =0x000001fd
	str r6, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x1C
	movs r2, 0x12
	movs r3, 0x1
	bl sub_813BC78
_0813C06A:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813C074: .4byte 0x000001fd
	thumb_func_end sub_813C004

	thumb_func_start HelpSystemRenderText
HelpSystemRenderText: @ 813C078
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	str r1, [sp, 0x28]
	mov r9, r2
	ldr r1, [sp, 0x58]
	ldr r2, [sp, 0x5C]
	ldr r4, [sp, 0x60]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x2C]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x30]
	str r7, [sp, 0x34]
_0813C0AC:
	mov r0, r9
	ldrb r1, [r0]
	movs r2, 0x1
	add r9, r2
	adds r0, r1, 0
	subs r0, 0xF8
	cmp r0, 0x7
	bls _0813C0BE
	b _0813C358
_0813C0BE:
	lsls r0, 2
	ldr r1, _0813C0C8 @ =_0813C0CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813C0C8: .4byte _0813C0CC
	.align 2, 0
_0813C0CC:
	.4byte _0813C2D4
	.4byte _0813C348
	.4byte _0813C1E4
	.4byte _0813C1E4
	.4byte _0813C200
	.4byte _0813C0EC
	.4byte _0813C1E4
	.4byte _0813C39C
_0813C0EC:
	mov r0, r9
	ldrb r1, [r0]
	movs r2, 0x1
	add r9, r2
	cmp r1, 0x1
	bne _0813C154
	movs r4, 0
	ldr r0, _0813C14C @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldrb r1, [r1]
	cmp r1, 0xFF
	beq _0813C0AC
	ldr r5, _0813C150 @ =gGlyphInfo + 0x80
_0813C106:
	ldr r0, [r0]
	adds r0, r4
	ldrb r1, [r0]
	ldr r0, [sp, 0x28]
	str r0, [sp]
	str r7, [sp, 0x4]
	mov r2, r10
	str r2, [sp, 0x8]
	ldr r0, [sp, 0x2C]
	str r0, [sp, 0xC]
	ldr r2, [sp, 0x30]
	str r2, [sp, 0x10]
	ldr r0, [sp, 0x24]
	add r2, sp, 0x14
	add r3, sp, 0x1C
	bl sub_813C3AC
	ldr r0, [sp, 0x24]
	ldrb r0, [r5]
	adds r0, r7, r0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bhi _0813C0AC
	ldr r0, _0813C14C @ =gSaveBlock2Ptr
	ldr r1, [r0]
	adds r1, r4
	ldrb r1, [r1]
	cmp r1, 0xFF
	bne _0813C106
	b _0813C0AC
	.align 2, 0
_0813C14C: .4byte gSaveBlock2Ptr
_0813C150: .4byte gGlyphInfo + 0x80
_0813C154:
	cmp r1, 0x2
	bne _0813C0AC
	movs r4, 0
	ldr r5, _0813C160 @ =gGlyphInfo + 0x80
	b _0813C1BC
	.align 2, 0
_0813C160: .4byte gGlyphInfo + 0x80
_0813C164:
	ldrb r1, [r1]
	ldr r2, [sp, 0x28]
	str r2, [sp]
	str r7, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	ldr r2, [sp, 0x2C]
	str r2, [sp, 0xC]
	ldr r0, [sp, 0x30]
	str r0, [sp, 0x10]
	ldr r0, [sp, 0x24]
	add r2, sp, 0x14
	add r3, sp, 0x1C
	bl sub_813C3AC
	b _0813C1AC
_0813C184:
	ldr r0, _0813C1D8 @ =gUnknown_841CB41
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0813C0AC
	adds r1, r0, 0
	ldr r2, [sp, 0x28]
	str r2, [sp]
	str r7, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	ldr r2, [sp, 0x2C]
	str r2, [sp, 0xC]
	ldr r0, [sp, 0x30]
	str r0, [sp, 0x10]
	ldr r0, [sp, 0x24]
	add r2, sp, 0x14
	add r3, sp, 0x1C
	bl sub_813C3AC
_0813C1AC:
	ldr r1, [sp, 0x24]
	ldrb r0, [r5]
	adds r0, r7, r0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0813C1BC:
	ldr r0, _0813C1DC @ =0x00000834
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813C184
	ldr r0, _0813C1E0 @ =gUnknown_841CB3C
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0813C164
	b _0813C0AC
	.align 2, 0
_0813C1D8: .4byte gUnknown_841CB41
_0813C1DC: .4byte 0x00000834
_0813C1E0: .4byte gUnknown_841CB3C
_0813C1E4:
	ldr r7, [sp, 0x34]
	ldr r1, _0813C1FC @ =gGlyphInfo
	adds r1, 0x81
	mov r0, r10
	adds r0, 0x1
	ldrb r1, [r1]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	b _0813C0AC
	.align 2, 0
_0813C1FC: .4byte gGlyphInfo
_0813C200:
	mov r2, r9
	ldrb r1, [r2]
	movs r0, 0x1
	add r9, r0
	subs r0, r1, 0x1
	cmp r0, 0x15
	bls _0813C210
	b _0813C0AC
_0813C210:
	lsls r0, 2
	ldr r1, _0813C21C @ =_0813C220
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813C21C: .4byte _0813C220
	.align 2, 0
_0813C220:
	.4byte _0813C2C8
	.4byte _0813C2C8
	.4byte _0813C2C8
	.4byte _0813C278
	.4byte _0813C2C8
	.4byte _0813C2C8
	.4byte _0813C0AC
	.4byte _0813C2C8
	.4byte _0813C0AC
	.4byte _0813C0AC
	.4byte _0813C27C
	.4byte _0813C2C8
	.4byte _0813C2C8
	.4byte _0813C2C8
	.4byte _0813C0AC
	.4byte _0813C27C
	.4byte _0813C2CE
	.4byte _0813C2CE
	.4byte _0813C282
	.4byte _0813C2CE
	.4byte _0813C0AC
	.4byte _0813C0AC
_0813C278:
	movs r1, 0x1
	add r9, r1
_0813C27C:
	movs r2, 0x1
	add r9, r2
	b _0813C2C8
_0813C282:
	mov r2, r9
	ldrb r0, [r2]
	ldr r1, [sp, 0x34]
	adds r0, r1
	subs r6, r0, r7
	cmp r6, 0
	ble _0813C2C8
	ldr r2, [sp, 0x28]
	str r2, [sp, 0x1C]
	ldr r1, [sp, 0x2C]
	lsls r0, r1, 3
	add r4, sp, 0x1C
	movs r5, 0
	strh r0, [r4, 0x4]
	ldr r2, [sp, 0x30]
	lsls r0, r2, 3
	strh r0, [r4, 0x6]
	ldr r0, [sp, 0x24]
	movs r1, 0x1
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r6, 16
	lsrs r3, 16
	str r0, [sp]
	str r5, [sp, 0x4]
	adds r0, r4, 0
	adds r1, r7, 0
	mov r2, r10
	bl FillBitmapRect4Bit
	adds r0, r7, r6
	lsls r0, 24
	lsrs r7, r0, 24
_0813C2C8:
	movs r0, 0x1
	add r9, r0
	b _0813C0AC
_0813C2CE:
	movs r1, 0x1
	add r9, r1
	b _0813C0AC
_0813C2D4:
	mov r2, r9
	ldrb r1, [r2]
	movs r0, 0x1
	add r9, r0
	adds r6, r1, 0
	adds r0, r6, 0
	bl GetKeypadIconTileOffset
	lsls r0, 24
	lsrs r0, 19
	ldr r1, _0813C344 @ =gKeypadIconTiles
	adds r0, r1
	str r0, [sp, 0x14]
	add r1, sp, 0x14
	movs r2, 0
	mov r8, r2
	movs r0, 0x80
	strh r0, [r1, 0x4]
	strh r0, [r1, 0x6]
	ldr r0, [sp, 0x28]
	str r0, [sp, 0x1C]
	ldr r1, [sp, 0x2C]
	lsls r0, r1, 3
	add r5, sp, 0x1C
	strh r0, [r5, 0x4]
	ldr r2, [sp, 0x30]
	lsls r0, r2, 3
	strh r0, [r5, 0x6]
	adds r0, r6, 0
	bl GetKeypadIconWidth
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl GetKeypadIconHeight
	lsls r0, 24
	lsrs r0, 24
	str r7, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r0, [sp, 0xC]
	mov r2, r8
	str r2, [sp, 0x10]
	add r0, sp, 0x14
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRect4Bit
	adds r0, r6, 0
	bl GetKeypadIconWidth
	b _0813C38E
	.align 2, 0
_0813C344: .4byte gKeypadIconTiles
_0813C348:
	mov r0, r9
	ldrb r1, [r0]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	orrs r1, r0
	movs r0, 0x1
	add r9, r0
_0813C358:
	cmp r1, 0
	bne _0813C36A
	ldr r1, [sp, 0x24]
	cmp r1, 0
	bne _0813C366
	adds r0, r7, 0x5
	b _0813C390
_0813C366:
	adds r0, r7, 0x4
	b _0813C390
_0813C36A:
	add r3, sp, 0x1C
	ldr r2, [sp, 0x28]
	str r2, [sp]
	str r7, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	ldr r2, [sp, 0x2C]
	str r2, [sp, 0xC]
	ldr r0, [sp, 0x30]
	str r0, [sp, 0x10]
	ldr r0, [sp, 0x24]
	add r2, sp, 0x14
	bl sub_813C3AC
	ldr r1, [sp, 0x24]
	ldr r0, _0813C398 @ =gGlyphInfo
	adds r0, 0x80
	ldrb r0, [r0]
_0813C38E:
	adds r0, r7, r0
_0813C390:
	lsls r0, 24
	lsrs r7, r0, 24
	b _0813C0AC
	.align 2, 0
_0813C398: .4byte gGlyphInfo
_0813C39C:
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end HelpSystemRenderText

	thumb_func_start sub_813C3AC
sub_813C3AC: @ 813C3AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r7, r2, 0
	mov r8, r3
	ldr r2, [sp, 0x38]
	ldr r3, [sp, 0x3C]
	ldr r4, [sp, 0x40]
	ldr r5, [sp, 0x44]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r0, r1, 16
	adds r1, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	cmp r6, 0
	bne _0813C3EE
	movs r1, 0
	bl DecompressGlyphFont0
	b _0813C402
_0813C3EE:
	cmp r6, 0x5
	bne _0813C3FA
	movs r1, 0
	bl DecompressGlyphFont5
	b _0813C402
_0813C3FA:
	adds r0, r1, 0
	movs r1, 0
	bl DecompressGlyphFont2
_0813C402:
	ldr r1, _0813C450 @ =gGlyphInfo
	str r1, [r7]
	movs r2, 0
	movs r0, 0x10
	strh r0, [r7, 0x4]
	strh r0, [r7, 0x6]
	ldr r0, [sp, 0x34]
	mov r3, r8
	str r0, [r3]
	lsls r0, r4, 3
	strh r0, [r3, 0x4]
	lsls r0, r5, 3
	strh r0, [r3, 0x6]
	mov r0, r10
	str r0, [sp]
	mov r3, r9
	str r3, [sp, 0x4]
	adds r0, r1, 0
	adds r0, 0x80
	ldrb r0, [r0]
	str r0, [sp, 0x8]
	adds r1, 0x81
	ldrb r0, [r1]
	str r0, [sp, 0xC]
	str r2, [sp, 0x10]
	adds r0, r7, 0
	mov r1, r8
	movs r3, 0
	bl BlitBitmapRect4Bit
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C450: .4byte gGlyphInfo
	thumb_func_end sub_813C3AC

	thumb_func_start sub_813C454
sub_813C454: @ 813C454
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r0, 0x1
	movs r1, 0xF
	movs r2, 0x2
	bl GenerateFontHalfRowLookupTable
	ldr r1, _0813C484 @ =gDecompressionBuffer + 0x3D00
	movs r2, 0x2
	str r2, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r0, 0x5
	adds r2, r4, 0
	movs r3, 0x6
	bl HelpSystemRenderText
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C484: .4byte gDecompressionBuffer + 0x3D00
	thumb_func_end sub_813C454

	thumb_func_start sub_813C488
sub_813C488: @ 813C488
	push {r4,r5,lr}
	sub sp, 0xC
	adds r5, r0, 0
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	movs r4, 0x7C
	subs r4, r0
	movs r0, 0x1
	movs r1, 0xF
	movs r2, 0x2
	bl GenerateFontHalfRowLookupTable
	ldr r1, _0813C4C8 @ =gDecompressionBuffer + 0x3400
	lsls r4, 24
	lsrs r4, 24
	movs r2, 0x2
	str r2, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r0, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl HelpSystemRenderText
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813C4C8: .4byte gDecompressionBuffer + 0x3400
	thumb_func_end sub_813C488

	thumb_func_start sub_813C4CC
sub_813C4CC: @ 813C4CC
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0xF
	movs r2, 0x2
	bl GenerateFontHalfRowLookupTable
	ldr r1, _0813C508 @ =gDecompressionBuffer
	str r4, [sp]
	movs r0, 0x1A
	str r0, [sp, 0x4]
	movs r0, 0x10
	str r0, [sp, 0x8]
	movs r0, 0x2
	adds r2, r6, 0
	adds r3, r5, 0
	bl HelpSystemRenderText
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813C508: .4byte gDecompressionBuffer
	thumb_func_end sub_813C4CC

	thumb_func_start sub_813C50C
sub_813C50C: @ 813C50C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x10
	mov r8, r0
	mov r9, r1
	add r1, sp, 0xC
	ldr r2, _0813C578 @ =0x0000eeee
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _0813C57C @ =gDecompressionBuffer
	ldr r2, _0813C580 @ =0x01001a00
	adds r0, r1, 0
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0x1
	movs r1, 0xE
	movs r2, 0x2
	bl GenerateFontHalfRowLookupTable
	movs r6, 0
	str r6, [sp]
	movs r5, 0x1A
	str r5, [sp, 0x4]
	movs r0, 0x10
	str r0, [sp, 0x8]
	movs r0, 0x2
	adds r1, r4, 0
	mov r2, r8
	movs r3, 0
	bl HelpSystemRenderText
	movs r0, 0x9C
	lsls r0, 4
	adds r4, r0
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r0, 0xD
	str r0, [sp, 0x8]
	movs r0, 0x2
	adds r1, r4, 0
	mov r2, r9
	movs r3, 0
	bl HelpSystemRenderText
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813C578: .4byte 0x0000eeee
_0813C57C: .4byte gDecompressionBuffer
_0813C580: .4byte 0x01001a00
	thumb_func_end sub_813C50C

	thumb_func_start sub_813C584
sub_813C584: @ 813C584
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	add r1, sp, 0xC
	ldr r2, _0813C5C8 @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _0813C5CC @ =gDecompressionBuffer + 0x23C0
	ldr r2, _0813C5D0 @ =0x01000820
	adds r0, r1, 0
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x3
	bl GenerateFontHalfRowLookupTable
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x1A
	str r0, [sp, 0x4]
	movs r0, 0x5
	str r0, [sp, 0x8]
	movs r0, 0x2
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl HelpSystemRenderText
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813C5C8: .4byte 0x00001111
_0813C5CC: .4byte gDecompressionBuffer + 0x23C0
_0813C5D0: .4byte 0x01000820
	thumb_func_end sub_813C584

	thumb_func_start sub_813C5D4
sub_813C5D4: @ 813C5D4
	push {lr}
	sub sp, 0x4
	mov r1, sp
	ldr r2, _0813C5F0 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0813C5F4 @ =gDecompressionBuffer + 0x3D00
	ldr r2, _0813C5F8 @ =0x010000e0
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813C5F0: .4byte 0x0000ffff
_0813C5F4: .4byte gDecompressionBuffer + 0x3D00
_0813C5F8: .4byte 0x010000e0
	thumb_func_end sub_813C5D4

	thumb_func_start sub_813C5FC
sub_813C5FC: @ 813C5FC
	push {lr}
	sub sp, 0x4
	mov r1, sp
	ldr r2, _0813C618 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0813C61C @ =gDecompressionBuffer + 0x3400
	ldr r2, _0813C620 @ =0x01000200
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813C618: .4byte 0x0000ffff
_0813C61C: .4byte gDecompressionBuffer + 0x3400
_0813C620: .4byte 0x01000200
	thumb_func_end sub_813C5FC

	thumb_func_start sub_813C624
sub_813C624: @ 813C624
	push {lr}
	sub sp, 0x4
	mov r1, sp
	ldr r2, _0813C640 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0813C644 @ =gDecompressionBuffer
	ldr r2, _0813C648 @ =0x01001a00
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813C640: .4byte 0x0000ffff
_0813C644: .4byte gDecompressionBuffer
_0813C648: .4byte 0x01001a00
	thumb_func_end sub_813C624

	thumb_func_start sub_813C64C
sub_813C64C: @ 813C64C
	push {r4-r7,lr}
	ldr r4, _0813C680 @ =gUnknown_203F190
	adds r3, r4, 0
	ldm r0!, {r5-r7}
	stm r3!, {r5-r7}
	movs r0, 0
	strb r1, [r4, 0xC]
	strb r2, [r4, 0xD]
	strb r0, [r4, 0xE]
	ldrh r0, [r4, 0x4]
	ldrh r1, [r4, 0x6]
	cmp r0, r1
	bcs _0813C668
	strh r0, [r4, 0x6]
_0813C668:
	movs r0, 0
	bl sub_813BDA4
	bl sub_813C624
	bl sub_813C7CC
	bl sub_813C828
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C680: .4byte gUnknown_203F190
	thumb_func_end sub_813C64C

	thumb_func_start sub_813C684
sub_813C684: @ 813C684
	ldr r1, _0813C68C @ =gUnknown_203F176
	strb r0, [r1]
	bx lr
	.align 2, 0
_0813C68C: .4byte gUnknown_203F176
	thumb_func_end sub_813C684

	thumb_func_start sub_813C690
sub_813C690: @ 813C690
	push {lr}
	ldr r1, _0813C6A0 @ =gUnknown_203F176
	ldrb r0, [r1]
	cmp r0, 0
	beq _0813C6A4
	subs r0, 0x1
	strb r0, [r1]
	b _0813C752
	.align 2, 0
_0813C6A0: .4byte gUnknown_203F176
_0813C6A4:
	ldr r2, _0813C6C8 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813C6D0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0813C6CC @ =gUnknown_203F190
	ldrb r0, [r1, 0xC]
	ldrb r2, [r1, 0xD]
	adds r0, r2
	ldr r1, [r1]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0, 0x4]
	b _0813C756
	.align 2, 0
_0813C6C8: .4byte gMain
_0813C6CC: .4byte gUnknown_203F190
_0813C6D0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813C6E4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	negs r0, r0
	b _0813C756
_0813C6E4:
	movs r0, 0xC0
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0813C6F4
	movs r0, 0x6
	negs r0, r0
	b _0813C756
_0813C6F4:
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813C702
	movs r0, 0x1
	b _0813C718
_0813C702:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813C70E
	movs r0, 0x1
	b _0813C73A
_0813C70E:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0813C730
	movs r0, 0x7
_0813C718:
	movs r1, 0
	bl sub_813C944
	lsls r0, 24
	cmp r0, 0
	bne _0813C72A
	movs r0, 0x5
	bl PlaySE
_0813C72A:
	movs r0, 0x4
	negs r0, r0
	b _0813C756
_0813C730:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0813C752
	movs r0, 0x7
_0813C73A:
	movs r1, 0x1
	bl sub_813C944
	lsls r0, 24
	cmp r0, 0
	bne _0813C74C
	movs r0, 0x5
	bl PlaySE
_0813C74C:
	movs r0, 0x5
	negs r0, r0
	b _0813C756
_0813C752:
	movs r0, 0x1
	negs r0, r0
_0813C756:
	pop {r1}
	bx r1
	thumb_func_end sub_813C690

	thumb_func_start sub_813C75C
sub_813C75C: @ 813C75C
	push {r4-r6,lr}
	ldr r5, _0813C784 @ =gUnknown_203F190
	ldrh r1, [r5, 0x4]
	subs r0, r1, 0x7
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r1, 0x7
	bls _0813C7C4
	ldrb r4, [r5, 0xC]
	ldrb r0, [r5, 0xD]
	adds r4, r0
	movs r0, 0
	movs r1, 0
	bl sub_813C004
	cmp r4, 0
	bne _0813C788
	movs r0, 0x1
	b _0813C7A2
	.align 2, 0
_0813C784: .4byte gUnknown_203F190
_0813C788:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _0813C798
	ldrb r0, [r5, 0xD]
	cmp r0, 0
	beq _0813C798
	movs r0, 0x1
	b _0813C7A2
_0813C798:
	ldr r0, _0813C7AC @ =gUnknown_203F190
	ldrb r0, [r0, 0xC]
	cmp r0, r6
	bne _0813C7B0
	movs r0, 0
_0813C7A2:
	movs r1, 0x1
	bl sub_813C004
	b _0813C7C4
	.align 2, 0
_0813C7AC: .4byte gUnknown_203F190
_0813C7B0:
	cmp r0, 0
	beq _0813C7C4
	movs r0, 0
	movs r1, 0x1
	bl sub_813C004
	movs r0, 0x1
	movs r1, 0x1
	bl sub_813C004
_0813C7C4:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813C75C

	thumb_func_start sub_813C7CC
sub_813C7CC: @ 813C7CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r3, _0813C824 @ =gUnknown_203F190
	ldrb r5, [r3, 0xC]
	movs r6, 0
	ldrh r0, [r3, 0x6]
	cmp r6, r0
	bge _0813C81A
	adds r4, r3, 0
	movs r7, 0
_0813C7F2:
	ldrb r1, [r4, 0x8]
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r4, 0x9]
	adds r2, r7
	lsls r2, 24
	lsrs r2, 24
	ldr r3, [r4]
	lsls r0, r5, 3
	adds r0, r3
	ldr r0, [r0]
	bl sub_813C4CC
	adds r5, 0x1
	add r7, r8
	adds r6, 0x1
	ldrh r0, [r4, 0x6]
	cmp r6, r0
	blt _0813C7F2
_0813C81A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C824: .4byte gUnknown_203F190
	thumb_func_end sub_813C7CC

	thumb_func_start sub_813C828
sub_813C828: @ 813C828
	push {r4,lr}
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0813C858 @ =gUnknown_203F190
	ldrb r1, [r3, 0x8]
	ldrb r2, [r3, 0xD]
	adds r4, r2, 0
	muls r4, r0
	adds r2, r4, 0
	ldrb r3, [r3, 0x9]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0813C85C @ =gFameCheckerText_ListMenuCursor
	bl sub_813C4CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C858: .4byte gUnknown_203F190
_0813C85C: .4byte gFameCheckerText_ListMenuCursor
	thumb_func_end sub_813C828

	thumb_func_start sub_813C860
sub_813C860: @ 813C860
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0813C894 @ =gUnknown_203F190
	ldrb r1, [r3, 0x8]
	adds r2, r4, 0
	muls r2, r0
	ldrb r3, [r3, 0x9]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0813C898 @ =gUnknown_841CB4E
	bl sub_813C4CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C894: .4byte gUnknown_203F190
_0813C898: .4byte gUnknown_841CB4E
	thumb_func_end sub_813C860

	thumb_func_start sub_813C89C
sub_813C89C: @ 813C89C
	push {r4,r5,lr}
	lsls r0, 24
	cmp r0, 0
	bne _0813C8EC
	ldr r0, _0813C8B4 @ =gUnknown_203F190
	ldrh r1, [r0, 0x6]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _0813C8B8
	movs r4, 0
	b _0813C8CA
	.align 2, 0
_0813C8B4: .4byte gUnknown_203F190
_0813C8B8:
	ldrh r0, [r5, 0x6]
	lsrs r2, r0, 1
	movs r1, 0x1
	ands r1, r0
	adds r2, r1
	subs r0, r2
	subs r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_0813C8CA:
	ldrb r1, [r5, 0xC]
	cmp r1, 0
	bne _0813C8DA
	ldrb r0, [r5, 0xD]
	cmp r0, 0
	beq _0813C926
	subs r0, 0x1
	b _0813C93A
_0813C8DA:
	ldrb r0, [r5, 0xD]
	cmp r0, r4
	bls _0813C8E4
	subs r0, 0x1
	b _0813C93A
_0813C8E4:
	subs r0, r1, 0x1
	strb r0, [r5, 0xC]
	movs r0, 0x2
	b _0813C93E
_0813C8EC:
	ldr r0, _0813C8FC @ =gUnknown_203F190
	ldrh r1, [r0, 0x6]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _0813C900
	movs r4, 0
	b _0813C90A
	.align 2, 0
_0813C8FC: .4byte gUnknown_203F190
_0813C900:
	ldrh r0, [r5, 0x6]
	lsrs r2, r0, 1
	movs r1, 0x1
	ands r0, r1
	adds r4, r2, r0
_0813C90A:
	adds r1, r5, 0
	ldrb r2, [r1, 0xC]
	ldrh r0, [r1, 0x4]
	ldrh r3, [r1, 0x6]
	subs r0, r3
	cmp r2, r0
	bne _0813C92A
	ldrb r2, [r1, 0xD]
	subs r0, r3, 0x1
	cmp r2, r0
	bge _0813C926
	adds r0, r2, 0x1
	strb r0, [r1, 0xD]
	b _0813C93C
_0813C926:
	movs r0, 0
	b _0813C93E
_0813C92A:
	ldrb r0, [r1, 0xD]
	cmp r0, r4
	bcc _0813C938
	adds r0, r2, 0x1
	strb r0, [r1, 0xC]
	movs r0, 0x2
	b _0813C93E
_0813C938:
	adds r0, 0x1
_0813C93A:
	strb r0, [r5, 0xD]
_0813C93C:
	movs r0, 0x1
_0813C93E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813C89C

	thumb_func_start sub_813C944
sub_813C944: @ 813C944
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _0813C97C @ =gUnknown_203F190
	ldrb r7, [r0, 0xD]
	movs r5, 0
	cmp r5, r2
	bge _0813C96C
	adds r4, r2, 0
_0813C95A:
	adds r0, r6, 0
	bl sub_813C89C
	orrs r5, r0
	lsls r0, r5, 24
	lsrs r5, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bne _0813C95A
_0813C96C:
	cmp r5, 0x1
	beq _0813C980
	cmp r5, 0x1
	ble _0813C978
	cmp r5, 0x3
	ble _0813C990
_0813C978:
	movs r0, 0x1
	b _0813C9D6
	.align 2, 0
_0813C97C: .4byte gUnknown_203F190
_0813C980:
	adds r0, r7, 0
	bl sub_813C860
	bl sub_813C828
	bl sub_813BC5C
	b _0813C9D4
_0813C990:
	bl sub_812BF88
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813C9B8
	movs r0, 0x2
	bl sub_813C684
	bl sub_813C624
	bl sub_813C7CC
	bl sub_813C828
	bl sub_812BDEC
	bl sub_813C75C
	b _0813C9D0
_0813C9B8:
	movs r0, 0
	bl sub_813BDA4
	bl sub_813C624
	bl sub_813C7CC
	bl sub_813C828
	movs r0, 0x1
	bl sub_813BDA4
_0813C9D0:
	bl sub_813BC5C
_0813C9D4:
	movs r0, 0
_0813C9D6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_813C944

	.align 2, 0 @ Don't pad with nop.
