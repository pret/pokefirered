	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_814BB4C
sub_814BB4C: @ 814BB4C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r2, 0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	mov r8, r4
	bl sub_814B6F0
	adds r6, r0, 0
	cmp r5, 0x19
	bls _0814BB6A
	movs r5, 0
_0814BB6A:
	cmp r4, 0
	beq _0814BB74
	cmp r4, 0x1
	beq _0814BBA0
	b _0814BBAA
_0814BB74:
	cmp r5, 0
	beq _0814BB88
	ldr r0, _0814BB9C @ =gUnknown_846E34C
	lsls r1, r5, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r6, 0
	adds r1, r7, 0
	bl _call_via_r2
_0814BB88:
	ldrb r0, [r6, 0xE]
	cmp r0, 0x19
	bls _0814BB92
	mov r0, r8
	strb r0, [r6, 0xE]
_0814BB92:
	ldr r0, _0814BB9C @ =gUnknown_846E34C
	ldrb r1, [r6, 0xE]
	lsls r1, 2
	b _0814BBA4
	.align 2, 0
_0814BB9C: .4byte gUnknown_846E34C
_0814BBA0:
	ldr r0, _0814BBB4 @ =gUnknown_846E34C
	lsls r1, r5, 2
_0814BBA4:
	adds r1, r0
	ldr r0, [r1]
	str r0, [r6, 0x4]
_0814BBAA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814BBB4: .4byte gUnknown_846E34C
	thumb_func_end sub_814BB4C

	thumb_func_start sub_814BBB8
sub_814BBB8: @ 814BBB8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldrb r2, [r1]
	ldrb r3, [r1, 0x1]
	lsls r3, 8
	orrs r2, r3
	ldrb r3, [r1, 0x2]
	lsls r3, 16
	orrs r2, r3
	ldrb r3, [r1, 0x3]
	lsls r3, 24
	adds r0, r2, 0
	orrs r0, r3
	ldrb r2, [r1, 0x9]
	strb r2, [r1]
	ldrb r4, [r1, 0x8]
	lsls r4, 8
	ldrb r2, [r1, 0x7]
	orrs r4, r2
	ldr r5, _0814BC0C @ =gPaletteFade
	ldrb r3, [r5, 0x8]
	movs r2, 0x7F
	ands r2, r3
	strb r2, [r5, 0x8]
	movs r5, 0x4
	ldrsb r5, [r1, r5]
	ldrb r2, [r1, 0x5]
	ldrb r3, [r1, 0x6]
	str r4, [sp]
	adds r1, r5, 0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	movs r0, 0x2
	strb r0, [r6, 0xE]
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814BC0C: .4byte gPaletteFade
	thumb_func_end sub_814BBB8

	thumb_func_start sub_814BC10
sub_814BC10: @ 814BC10
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	beq _0814BC44
	cmp r0, 0x1
	bgt _0814BC26
	cmp r0, 0
	beq _0814BC30
	b _0814BC66
_0814BC26:
	cmp r0, 0x2
	beq _0814BC4A
	cmp r0, 0x3
	beq _0814BC56
	b _0814BC66
_0814BC30:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0814BC6C
	ldrb r0, [r5]
	cmp r0, 0
	bne _0814BC66
	movs r0, 0x3
	b _0814BC6A
_0814BC44:
	bl sub_80FA42C
	b _0814BC66
_0814BC4A:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	bne _0814BC66
	b _0814BC6C
_0814BC56:
	ldrb r0, [r4, 0xF]
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r0, 0
	strb r0, [r4, 0xC]
	b _0814BC6E
_0814BC66:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
_0814BC6A:
	strb r0, [r4, 0xC]
_0814BC6C:
	movs r0, 0
_0814BC6E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814BC10

	thumb_func_start sub_814BC74
sub_814BC74: @ 814BC74
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r0, 0
	adds r5, r1, 0
	ldrb r4, [r5, 0x3]
	lsls r4, 8
	ldrb r0, [r5, 0x2]
	orrs r4, r0
	ldrb r6, [r7, 0xC]
	cmp r6, 0x1
	beq _0814BD20
	cmp r6, 0x1
	bgt _0814BC98
	cmp r6, 0
	beq _0814BCA2
	b _0814BD68
_0814BC98:
	cmp r6, 0x2
	beq _0814BD38
	cmp r6, 0x3
	beq _0814BD48
	b _0814BD68
_0814BCA2:
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	ldrb r1, [r5, 0x1]
	movs r0, 0x2
	mov r8, r0
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0814BCF0
	ldr r4, _0814BCE8 @ =gStringVar4
	ldr r1, _0814BCEC @ =gUnknown_846E328
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldrb r3, [r7, 0xB]
	str r6, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl AddTextPrinterParameterized2
	b _0814BD12
	.align 2, 0
_0814BCE8: .4byte gStringVar4
_0814BCEC: .4byte gUnknown_846E328
_0814BCF0:
	ldr r1, _0814BD1C @ =gUnknown_846E328
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	ldrb r3, [r7, 0xB]
	str r4, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	bl AddTextPrinterParameterized2
_0814BD12:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	b _0814BD68
	.align 2, 0
_0814BD1C: .4byte gUnknown_846E328
_0814BD20:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _0814BD6E
	cmp r4, 0
	bne _0814BD68
	ldrb r0, [r7, 0xC]
	adds r0, 0x1
	strb r0, [r7, 0xC]
	b _0814BD68
_0814BD38:
	ldr r0, _0814BD44 @ =gMain
	ldrh r0, [r0, 0x2E]
	ands r4, r0
	cmp r4, 0
	bne _0814BD68
	b _0814BD6E
	.align 2, 0
_0814BD44: .4byte gMain
_0814BD48:
	ldrb r1, [r5, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814BD5A
	movs r0, 0
	movs r1, 0x1
	bl ClearDialogWindowAndFrame
_0814BD5A:
	ldrb r0, [r7, 0xE]
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	ldrb r0, [r5, 0x4]
	b _0814BD6C
_0814BD68:
	ldrb r0, [r7, 0xC]
	adds r0, 0x1
_0814BD6C:
	strb r0, [r7, 0xC]
_0814BD6E:
	movs r0, 0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_814BC74

	thumb_func_start sub_814BD7C
sub_814BD7C: @ 814BD7C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_814D5C8
	cmp r0, 0
	beq _0814BD94
	ldrb r0, [r4, 0xE]
	adds r2, r4, 0
	adds r2, 0x36
	movs r1, 0
	bl sub_814BB4C
_0814BD94:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814BD7C

	thumb_func_start sub_814BD9C
sub_814BD9C: @ 814BD9C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_814D888
	cmp r0, 0
	beq _0814BDB4
	ldrb r0, [r4, 0xE]
	adds r2, r4, 0
	adds r2, 0x36
	movs r1, 0
	bl sub_814BB4C
_0814BDB4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814BD9C

	thumb_func_start sub_814BDBC
sub_814BDBC: @ 814BDBC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	beq _0814BDCC
	cmp r0, 0x1
	beq _0814BDD2
	b _0814BDFC
_0814BDCC:
	bl sub_80FA42C
	b _0814BDFC
_0814BDD2:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814BE02
	ldr r0, _0814BDF8 @ =0x00000111
	bl PlayNewMapMusic
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r1, 0
	movs r0, 0x3
	strh r0, [r4, 0x12]
	strb r1, [r4, 0xC]
	b _0814BE02
	.align 2, 0
_0814BDF8: .4byte 0x00000111
_0814BDFC:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_0814BE02:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814BDBC

	thumb_func_start sub_814BE0C
sub_814BE0C: @ 814BE0C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	beq _0814BE22
	cmp r0, 0x1
	beq _0814BE48
	adds r0, 0x1
	b _0814BE58
_0814BE22:
	adds r0, r4, 0
	bl sub_814D4D8
	movs r0, 0x1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_814D5A4
	movs r0, 0x7
	strb r0, [r4, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	b _0814BE5A
_0814BE48:
	movs r0, 0x8
	strb r0, [r4, 0xE]
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r0, 0x2
_0814BE58:
	strb r0, [r4, 0xC]
_0814BE5A:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814BE0C

	thumb_func_start sub_814BE64
sub_814BE64: @ 814BE64
	push {lr}
	movs r1, 0
	str r1, [r0, 0x4]
	ldr r0, _0814BE78 @ =sub_814B8F0
	bl SetMainCallback2
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0814BE78: .4byte sub_814B8F0
	thumb_func_end sub_814BE64

	thumb_func_start sub_814BE7C
sub_814BE7C: @ 814BE7C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r2, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x5
	bls _0814BE8C
	b _0814BFC0
_0814BE8C:
	lsls r0, 2
	ldr r1, _0814BE98 @ =_0814BE9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814BE98: .4byte _0814BE9C
	.align 2, 0
_0814BE9C:
	.4byte _0814BEB4
	.4byte _0814BED4
	.4byte _0814BEDA
	.4byte _0814BF0A
	.4byte _0814BF1A
	.4byte _0814BFA4
_0814BEB4:
	movs r0, 0x1
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0
	bl sub_814D5A4
	movs r0, 0x9
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	b _0814BFC6
_0814BED4:
	bl sub_80FA42C
	b _0814BFC0
_0814BEDA:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814BFC6
	adds r4, r5, 0
	adds r4, 0x42
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xC
	bl memset
	ldrb r0, [r5, 0x8]
	lsls r0, 5
	adds r0, r5, r0
	adds r0, 0xA4
	ldrh r0, [r0]
	strh r0, [r4]
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0x2
	bl SendBlock
	b _0814BFC0
_0814BF0A:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814BFC6
	movs r0, 0
	strh r0, [r5, 0x10]
	b _0814BFC0
_0814BF1A:
	bl GetBlockReceivedStatus
	ldr r2, _0814BF98 @ =gUnknown_846E3C8
	ldrb r4, [r5, 0x9]
	subs r1, r4, 0x2
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _0814BFC6
	movs r3, 0
	cmp r3, r4
	bcs _0814BF7E
	ldr r7, _0814BF9C @ =gBlockRecvBuffer
	movs r6, 0
	ldr r4, _0814BFA0 @ =gUnknown_83DFC9C
_0814BF3C:
	lsls r0, r3, 5
	adds r0, r5, r0
	lsls r1, r3, 8
	adds r1, r7
	ldrh r1, [r1]
	adds r2, r0, 0
	adds r2, 0xA4
	strh r1, [r2]
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0xB0
	bls _0814BF56
	strh r6, [r2]
_0814BF56:
	ldrh r1, [r2]
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x18]
	ldrb r1, [r1]
	adds r0, r1
	strh r0, [r5, 0x18]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x2]
	ldr r0, [r5, 0x1C]
	adds r0, r1
	str r0, [r5, 0x1C]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r5, 0x9]
	cmp r3, r0
	bcc _0814BF3C
_0814BF7E:
	movs r0, 0
	strh r0, [r5, 0x10]
	bl ResetBlockReceivedFlags
	movs r1, 0x18
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r1, 0x80
	lsls r1, 6
	bl sub_80D8B68
	str r0, [r5, 0x20]
	b _0814BFC0
	.align 2, 0
_0814BF98: .4byte gUnknown_846E3C8
_0814BF9C: .4byte gBlockRecvBuffer
_0814BFA0: .4byte gUnknown_83DFC9C
_0814BFA4:
	movs r0, 0
	movs r1, 0x1
	bl ClearDialogWindowAndFrame
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r1, 0
	movs r0, 0x4
	strh r0, [r5, 0x12]
	strb r1, [r5, 0xC]
	b _0814BFC6
_0814BFC0:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0814BFC6:
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_814BE7C

	thumb_func_start sub_814BFD0
sub_814BFD0: @ 814BFD0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x6
	bls _0814BFDC
	b _0814C108
_0814BFDC:
	lsls r0, 2
	ldr r1, _0814BFE8 @ =_0814BFEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814BFE8: .4byte _0814BFEC
	.align 2, 0
_0814BFEC:
	.4byte _0814C008
	.4byte _0814C01A
	.4byte _0814C048
	.4byte _0814C080
	.4byte _0814C0B0
	.4byte _0814C0D2
	.4byte _0814C0E4
_0814C008:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r4, r0
	adds r0, r4, 0
	bl sub_814DA24
	bl sub_80FA42C
	b _0814C108
_0814C01A:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814C10E
	movs r2, 0x9C
	lsls r2, 1
	adds r1, r4, r2
	movs r0, 0
	strb r0, [r1]
	ldr r3, _0814C044 @ =0x00000139
	adds r1, r4, r3
	strb r0, [r1]
	adds r2, 0x2
	adds r1, r4, r2
	strb r0, [r1]
	adds r3, 0x2
	adds r1, r4, r3
	strb r0, [r1]
	b _0814C108
	.align 2, 0
_0814C044: .4byte 0x00000139
_0814C048:
	movs r0, 0x9C
	lsls r0, 1
	adds r3, r4, r0
	ldrb r0, [r3]
	lsls r0, 2
	movs r2, 0xB8
	lsls r2, 1
	adds r1, r4, r2
	adds r0, r1, r0
	ldr r2, [r0]
	ldr r0, _0814C07C @ =sub_814DB84
	str r0, [r2, 0x1C]
	ldrb r0, [r3]
	lsls r0, 2
	adds r1, r0
	ldr r1, [r1]
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r1]
	movs r0, 0x36
	bl PlaySE
	b _0814C108
	.align 2, 0
_0814C07C: .4byte sub_814DB84
_0814C080:
	movs r3, 0x9C
	lsls r3, 1
	adds r2, r4, r3
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, 0x38
	adds r1, r4, r3
	adds r3, r1, r0
	ldr r0, [r3]
	ldr r1, [r0, 0x1C]
	ldr r0, _0814C0AC @ =sub_814DB84
	cmp r1, r0
	beq _0814C10E
	movs r0, 0
	str r0, [r3]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	bl sub_80FA42C
	b _0814C108
	.align 2, 0
_0814C0AC: .4byte sub_814DB84
_0814C0B0:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814C10E
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r4, r0
	ldrb r0, [r1]
	ldrb r2, [r4, 0x9]
	cmp r0, r2
	bcs _0814C0CC
	movs r0, 0x2
	b _0814C10C
_0814C0CC:
	movs r0, 0
	strb r0, [r1]
	b _0814C108
_0814C0D2:
	movs r3, 0x9C
	lsls r3, 1
	adds r1, r4, r3
	adds r0, r4, 0
	bl sub_814DC24
	bl sub_80FA42C
	b _0814C108
_0814C0E4:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814C10E
	movs r0, 0x25
	bl PlaySE
	movs r0, 0xB
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r1, 0
	movs r0, 0x5
	strh r0, [r4, 0x12]
	strb r1, [r4, 0xC]
	b _0814C10E
_0814C108:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
_0814C10C:
	strb r0, [r4, 0xC]
_0814C10E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814BFD0

	thumb_func_start sub_814C118
sub_814C118: @ 814C118
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0xC]
	cmp r1, 0x1
	beq _0814C17C
	cmp r1, 0x1
	bgt _0814C12C
	cmp r1, 0
	beq _0814C136
	b _0814C23C
_0814C12C:
	cmp r1, 0x2
	beq _0814C1FC
	cmp r1, 0x3
	beq _0814C21E
	b _0814C23C
_0814C136:
	ldrh r0, [r4, 0x2A]
	adds r0, 0x4
	strh r0, [r4, 0x2A]
	lsls r0, 16
	cmp r0, 0
	bge _0814C144
	b _0814C242
_0814C144:
	strh r1, [r4, 0x2A]
	ldr r0, _0814C174 @ =0x00000139
	adds r3, r4, r0
	movs r0, 0x4
	strb r0, [r3]
	movs r2, 0x9C
	lsls r2, 1
	adds r1, r4, r2
	movs r0, 0
	strb r0, [r1]
	ldr r2, _0814C178 @ =gUnknown_846E2F0
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	adds r0, r2
	ldrb r0, [r0]
	movs r2, 0x9D
	lsls r2, 1
	adds r1, r4, r2
	strb r0, [r1]
	movs r0, 0xCF
	bl PlaySE
	b _0814C23C
	.align 2, 0
_0814C174: .4byte 0x00000139
_0814C178: .4byte gUnknown_846E2F0
_0814C17C:
	ldr r7, _0814C1F4 @ =gUnknown_846E2F0
	movs r0, 0x9C
	lsls r0, 1
	adds r6, r4, r0
	ldr r1, _0814C1F8 @ =0x00000139
	adds r5, r4, r1
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	ldrb r2, [r6]
	adds r0, r2
	adds r0, r7
	movs r1, 0
	ldrsb r1, [r0, r1]
	strh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x12
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1A
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1E
	bl SetGpuReg
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	movs r1, 0x9D
	lsls r1, 1
	adds r2, r4, r1
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2]
	cmp r0, r1
	bcc _0814C242
	ldrb r0, [r5]
	cmp r0, 0
	beq _0814C23C
	subs r0, 0x1
	strb r0, [r5]
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0
	strb r0, [r6]
	b _0814C242
	.align 2, 0
_0814C1F4: .4byte gUnknown_846E2F0
_0814C1F8: .4byte 0x00000139
_0814C1FC:
	movs r0, 0
	strh r0, [r4, 0x2C]
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	bl sub_80FA42C
	b _0814C23C
_0814C21E:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814C242
	movs r0, 0xC
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r1, 0
	movs r0, 0x6
	strh r0, [r4, 0x12]
	strb r1, [r4, 0xC]
	b _0814C242
_0814C23C:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_0814C242:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_814C118

	thumb_func_start sub_814C24C
sub_814C24C: @ 814C24C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	beq _0814C26C
	cmp r0, 0x1
	bgt _0814C262
	cmp r0, 0
	beq _0814C292
	b _0814C2EC
_0814C262:
	cmp r0, 0x2
	beq _0814C28A
	cmp r0, 0x3
	beq _0814C298
	b _0814C2EC
_0814C26C:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814C2F2
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x78
	movs r3, 0x50
	bl sub_815F138
	b _0814C2EC
_0814C28A:
	bl sub_815F198
	cmp r0, 0
	bne _0814C2F2
_0814C292:
	bl sub_80FA42C
	b _0814C2EC
_0814C298:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814C2F2
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldr r2, _0814C2D4 @ =0x00000139
	adds r1, r4, r2
	strb r0, [r1]
	adds r2, 0x1
	adds r1, r4, r2
	strb r0, [r1]
	adds r2, 0x1
	adds r1, r4, r2
	strb r0, [r1]
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	cmp r0, 0
	bne _0814C2D8
	movs r0, 0xD
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	b _0814C2E2
	.align 2, 0
_0814C2D4: .4byte 0x00000139
_0814C2D8:
	movs r0, 0xE
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
_0814C2E2:
	movs r1, 0
	movs r0, 0x7
	strh r0, [r4, 0x12]
	strb r1, [r4, 0xC]
	b _0814C2F2
_0814C2EC:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_0814C2F2:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814C24C

	thumb_func_start sub_814C2FC
sub_814C2FC: @ 814C2FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	movs r0, 0
	mov r8, r0
	movs r2, 0
	adds r7, r2, 0
	ldrb r1, [r4, 0x9]
	cmp r7, r1
	bcs _0814C40A
	movs r2, 0x5E
	adds r2, r4
	mov r9, r2
	ldr r3, _0814C3C0 @ =gUnknown_846E2E0
	mov r10, r3
_0814C320:
	lsls r0, r7, 4
	ldr r1, _0814C3C4 @ =gRecvCmds
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	movs r3, 0xBC
	lsls r3, 6
	cmp r0, r3
	bne _0814C3FE
	ldrh r0, [r2, 0x2]
	cmp r0, 0x2
	bne _0814C3FE
	ldrb r1, [r2, 0x4]
	movs r0, 0x4
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0814C3F6
	mov r0, r9
	ldrb r2, [r0]
	lsrs r1, r2, 3
	mov r3, r10
	adds r0, r7, r3
	ldrb r0, [r0]
	orrs r1, r0
	lsls r1, 3
	movs r0, 0x7
	ands r0, r2
	orrs r0, r1
	mov r1, r9
	strb r0, [r1]
	lsls r2, r7, 5
	adds r3, r4, r2
	mov r12, r3
	mov r1, r12
	adds r1, 0xB5
	movs r0, 0x1
	strb r0, [r1]
	subs r1, 0x7
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	subs r1, 0x8
	ldrh r0, [r4, 0x28]
	ldrh r1, [r1]
	subs r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	mov r5, r12
	adds r5, 0xAA
	ldrh r1, [r5]
	subs r0, r1, 0x1
	adds r6, r2, 0
	cmp r3, r0
	blt _0814C3C8
	adds r0, r1, 0x1
	cmp r3, r0
	bgt _0814C3C8
	mov r1, r12
	adds r1, 0xA8
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r3, [r5]
	mov r0, r12
	adds r0, 0xAC
	ldrh r1, [r1]
	ldrh r2, [r0]
	cmp r1, r2
	bls _0814C3D6
	strh r1, [r0]
	b _0814C3D6
	.align 2, 0
_0814C3C0: .4byte gUnknown_846E2E0
_0814C3C4: .4byte gRecvCmds
_0814C3C8:
	adds r0, r4, r6
	adds r2, r0, 0
	adds r2, 0xA8
	movs r1, 0
	strh r1, [r2]
	adds r0, 0xAA
	strh r3, [r0]
_0814C3D6:
	adds r1, r4, r6
	ldrh r0, [r4, 0x28]
	adds r3, r1, 0
	adds r3, 0xA6
	movs r2, 0
	strh r0, [r3]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _0814C3FE
	strb r2, [r1]
	b _0814C3FE
_0814C3F6:
	lsls r0, r7, 5
	adds r0, r4, r0
	adds r0, 0xB5
	strb r1, [r0]
_0814C3FE:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r3, [r4, 0x9]
	cmp r7, r3
	bcc _0814C320
_0814C40A:
	mov r0, r8
	cmp r0, 0x1
	bls _0814C440
	movs r7, 0
	ldrb r1, [r4, 0x9]
	cmp r7, r1
	bcs _0814C440
	movs r3, 0x2
_0814C41A:
	lsls r0, r7, 5
	adds r1, r4, r0
	adds r2, r1, 0
	adds r2, 0xB5
	ldrb r0, [r2]
	cmp r0, 0
	beq _0814C434
	orrs r0, r3
	strb r0, [r2]
	adds r1, 0xB0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0814C434:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r2, [r4, 0x9]
	cmp r7, r2
	bcc _0814C41A
_0814C440:
	mov r3, r8
	cmp r3, 0
	beq _0814C4A8
	ldrh r0, [r4, 0x2E]
	add r0, r8
	strh r0, [r4, 0x2E]
	ldr r1, _0814C490 @ =gUnknown_846E2E8
	mov r0, r8
	subs r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	add r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r0, [r4, 0x34]
	add r0, r8
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x1A]
	add r0, r8
	strh r0, [r4, 0x1A]
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	movs r3, 0x1A
	ldrsh r2, [r4, r3]
	subs r0, r2
	cmp r0, 0
	ble _0814C494
	lsls r2, 8
	ldr r1, [r4, 0x20]
	adds r0, r2, 0
	bl sub_80D8B68
	adds r2, r0, 0
	asrs r2, 8
	adds r0, r4, 0
	adds r0, 0x24
	strb r2, [r0]
	b _0814C4A8
	.align 2, 0
_0814C490: .4byte gUnknown_846E2E8
_0814C494:
	adds r1, r4, 0
	adds r1, 0x24
	movs r0, 0x20
	strb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x5E
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_0814C4A8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_814C2FC

	thumb_func_start sub_814C4B8
sub_814C4B8: @ 814C4B8
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r6, 0
	movs r1, 0
	adds r4, r1, 0
	ldrb r0, [r3, 0x9]
	cmp r4, r0
	bcs _0814C510
	adds r5, r3, 0
	adds r5, 0x64
_0814C4CC:
	lsls r0, r4, 5
	adds r1, r3, r0
	adds r0, r1, 0
	adds r0, 0xB5
	ldrb r2, [r0]
	cmp r2, 0
	beq _0814C504
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r1, 0
	adds r0, 0xB4
	ldrb r0, [r0]
	adds r1, r0, 0x1
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0814C4F4
	movs r0, 0x4
	orrs r1, r0
_0814C4F4:
	lsls r0, r4, 1
	adds r0, r4
	lsls r1, r0
	lsls r0, r1, 16
	lsrs r1, r0, 16
	ldrh r0, [r5]
	orrs r1, r0
	strh r1, [r5]
_0814C504:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r3, 0x9]
	cmp r4, r1
	bcc _0814C4CC
_0814C510:
	adds r0, r3, 0
	adds r0, 0x24
	ldrb r1, [r0]
	adds r0, 0x3C
	strh r1, [r0]
	cmp r6, 0
	bne _0814C534
	ldr r2, _0814C530 @ =0x0000013b
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0814C600
	movs r4, 0x9C
	lsls r4, 1
	adds r1, r3, r4
	b _0814C572
	.align 2, 0
_0814C530: .4byte 0x0000013b
_0814C534:
	ldr r5, _0814C560 @ =0x0000013b
	adds r2, r3, r5
	ldrb r0, [r2]
	cmp r0, 0
	beq _0814C57A
	ldr r0, _0814C564 @ =0x00000139
	adds r1, r3, r0
	ldrb r2, [r1]
	cmp r6, r2
	beq _0814C56C
	subs r0, r6, 0x1
	strb r0, [r1]
	ldr r1, _0814C568 @ =gUnknown_846E314
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x9D
	lsls r4, 1
	adds r1, r3, r4
	strb r0, [r1]
	b _0814C5A0
	.align 2, 0
_0814C560: .4byte 0x0000013b
_0814C564: .4byte 0x00000139
_0814C568: .4byte gUnknown_846E314
_0814C56C:
	movs r5, 0x9C
	lsls r5, 1
	adds r1, r3, r5
_0814C572:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0814C5A0
_0814C57A:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0
	strb r0, [r1]
	subs r0, r6, 0x1
	ldr r4, _0814C5D0 @ =0x00000139
	adds r1, r3, r4
	strb r0, [r1]
	ldr r1, _0814C5D4 @ =gUnknown_846E314
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r5, 0x9D
	lsls r5, 1
	adds r1, r3, r5
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r2]
_0814C5A0:
	ldr r0, _0814C5D8 @ =0x0000013b
	adds r4, r3, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0814C600
	movs r2, 0x9C
	lsls r2, 1
	adds r1, r3, r2
	movs r5, 0x9D
	lsls r5, 1
	adds r2, r3, r5
	ldrb r0, [r1]
	ldrb r5, [r2]
	cmp r0, r5
	bcc _0814C5DC
	movs r0, 0
	strb r0, [r1]
	ldr r5, _0814C5D0 @ =0x00000139
	adds r1, r3, r5
	strb r0, [r1]
	strb r0, [r2]
	strb r0, [r4]
	movs r1, 0
	b _0814C5F0
	.align 2, 0
_0814C5D0: .4byte 0x00000139
_0814C5D4: .4byte gUnknown_846E314
_0814C5D8: .4byte 0x0000013b
_0814C5DC:
	ldr r2, _0814C5F8 @ =gUnknown_846E314
	ldrb r1, [r1]
	ldr r4, _0814C5FC @ =0x00000139
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, 0x1
	adds r1, r0
	adds r1, r2
	ldrb r1, [r1]
_0814C5F0:
	adds r0, r3, 0
	adds r0, 0x5F
	strb r1, [r0]
	b _0814C608
	.align 2, 0
_0814C5F8: .4byte gUnknown_846E314
_0814C5FC: .4byte 0x00000139
_0814C600:
	adds r1, r3, 0
	adds r1, 0x5F
	movs r0, 0
	strb r0, [r1]
_0814C608:
	ldrh r1, [r3, 0x26]
	adds r0, r3, 0
	adds r0, 0x62
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_814C4B8

	thumb_func_start sub_814C618
sub_814C618: @ 814C618
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldr r3, _0814C6AC @ =gMain
	ldrh r1, [r3, 0x2E]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0814C63A
	adds r2, r5, 0
	adds r2, 0x5E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814C63A:
	ldrh r1, [r3, 0x2C]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0814C65A
	ldrb r0, [r5, 0x8]
	lsls r0, 5
	adds r0, r5, r0
	adds r1, r0, 0
	adds r1, 0xB2
	ldrh r0, [r1]
	ldrh r2, [r5, 0x28]
	cmp r0, r2
	bcs _0814C65A
	adds r0, 0x1
	strh r0, [r1]
_0814C65A:
	ldrb r0, [r5, 0x8]
	adds r7, r5, 0
	adds r7, 0x5E
	cmp r0, 0
	beq _0814C670
	ldrb r1, [r7]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0814C670
	b _0814C7AC
_0814C670:
	adds r4, r5, 0
	adds r4, 0x5C
	movs r0, 0x2
	strh r0, [r4]
	ldrh r0, [r5, 0x28]
	movs r1, 0x1E
	bl __umodsi3
	lsls r0, 16
	mov r8, r4
	adds r6, r5, 0
	adds r6, 0x25
	cmp r0, 0
	bne _0814C6C8
	movs r0, 0x2E
	ldrsh r2, [r5, r0]
	ldr r1, _0814C6B0 @ =gUnknown_846E3C4
	ldrb r0, [r5, 0x9]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	ble _0814C6B4
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrb r0, [r6]
	movs r1, 0x10
	orrs r0, r1
	b _0814C6BC
	.align 2, 0
_0814C6AC: .4byte gMain
_0814C6B0: .4byte gUnknown_846E3C4
_0814C6B4:
	ldrb r1, [r6]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
_0814C6BC:
	strb r0, [r6]
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
_0814C6C8:
	ldrh r0, [r5, 0x28]
	movs r1, 0xF
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _0814C73E
	movs r0, 0x34
	ldrsh r2, [r5, r0]
	ldr r3, _0814C6F4 @ =gUnknown_846E3B4
	ldrb r0, [r5, 0x9]
	subs r0, 0x2
	lsls r1, r0, 2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bge _0814C6F8
	ldrb r1, [r6]
	movs r0, 0x1F
	ands r0, r1
	strb r0, [r6]
	b _0814C738
	.align 2, 0
_0814C6F4: .4byte gUnknown_846E3B4
_0814C6F8:
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r2, r0
	bge _0814C70C
	ldrb r0, [r6]
	movs r1, 0x1F
	ands r1, r0
	movs r0, 0x20
	b _0814C734
_0814C70C:
	adds r0, r3, 0x2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r2, r0
	bge _0814C71C
	movs r0, 0x2
	strh r0, [r5, 0x34]
	b _0814C738
_0814C71C:
	adds r0, r3, 0x3
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r2, r0
	bge _0814C72C
	movs r0, 0x3
	strh r0, [r5, 0x34]
	b _0814C738
_0814C72C:
	ldrb r0, [r6]
	movs r1, 0x1F
	ands r1, r0
	movs r0, 0x80
_0814C734:
	orrs r1, r0
	strb r1, [r6]
_0814C738:
	movs r0, 0
	strh r0, [r5, 0x34]
	b _0814C76A
_0814C73E:
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3C
	bls _0814C76A
	cmp r0, 0x46
	bls _0814C75A
	bl sub_80FBA44
	movs r0, 0
	strh r0, [r5, 0x10]
	b _0814C76A
_0814C75A:
	ldrb r0, [r7]
	movs r4, 0xF8
	ands r4, r0
	cmp r4, 0
	bne _0814C76A
	bl sub_80FBA44
	strh r4, [r5, 0x10]
_0814C76A:
	ldrh r1, [r5, 0x28]
	ldr r0, _0814C7B8 @ =0x00008c9f
	cmp r1, r0
	bls _0814C77A
	ldrb r0, [r7]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r7]
_0814C77A:
	ldrb r1, [r6]
	lsls r1, 27
	lsrs r1, 31
	lsls r1, 1
	ldrb r2, [r7]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7]
	ldrb r0, [r6]
	lsrs r0, 5
	adds r2, r5, 0
	adds r2, 0x66
	strh r0, [r2]
	adds r4, r5, 0
	adds r4, 0x42
	adds r0, r4, 0
	mov r1, r8
	movs r2, 0xC
	bl memcpy
	adds r0, r4, 0
	bl sub_80F9E2C
_0814C7AC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814C7B8: .4byte 0x00008c9f
	thumb_func_end sub_814C618

	thumb_func_start sub_814C7BC
sub_814C7BC: @ 814C7BC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
	ldr r3, _0814C808 @ =gRecvCmds
	ldrb r0, [r5, 0x9]
	cmp r4, r0
	bcs _0814C7E0
	movs r1, 0
_0814C7CC:
	lsls r0, r4, 5
	adds r0, r5, r0
	adds r0, 0xB5
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x9]
	cmp r4, r0
	bcc _0814C7CC
_0814C7E0:
	adds r2, r3, 0
	ldrh r0, [r2]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _0814C7F8
	ldrh r0, [r2, 0x2]
	cmp r0, 0x2
	beq _0814C80C
_0814C7F8:
	adds r2, r5, 0
	adds r2, 0x25
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _0814C84A
	.align 2, 0
_0814C808: .4byte gRecvCmds
_0814C80C:
	adds r4, r5, 0
	adds r4, 0x4E
	adds r0, r4, 0
	adds r1, r3, 0
	movs r2, 0xE
	bl memcpy
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x2A]
	movs r0, 0x5
	ldrsb r0, [r4, r0]
	strh r0, [r5, 0x2C]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x28]
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	adds r0, r5, 0
	bl sub_814DC5C
	ldrb r1, [r4, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814C84A
	adds r0, r5, 0
	adds r0, 0x25
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
_0814C84A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814C7BC

	thumb_func_start sub_814C850
sub_814C850: @ 814C850
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x5C
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r4, 0
	adds r0, 0x4E
	movs r1, 0
	movs r2, 0xE
	bl memset
	adds r0, r4, 0
	bl sub_814C7BC
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x12
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1A
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1E
	bl SetGpuReg
	adds r0, r4, 0
	adds r0, 0x25
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0814C8D8
	ldrh r1, [r4, 0x28]
	ldr r0, _0814C8C0 @ =0x00008c9f
	cmp r1, r0
	bls _0814C8C4
	adds r0, 0x1
	strh r0, [r4, 0x28]
	movs r0, 0x10
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	b _0814C8CE
	.align 2, 0
_0814C8C0: .4byte 0x00008c9f
_0814C8C4:
	movs r0, 0xF
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
_0814C8CE:
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x10]
	strb r1, [r4, 0xC]
	b _0814C8F2
_0814C8D8:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	bl sub_814C2FC
	adds r0, r4, 0
	bl sub_814C4B8
	adds r0, r4, 0
	bl sub_814C618
	movs r0, 0
_0814C8F2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814C850

	thumb_func_start sub_814C8F8
sub_814C8F8: @ 814C8F8
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x5C
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r4, 0
	adds r0, 0x4E
	movs r1, 0
	movs r2, 0xE
	bl memset
	adds r0, r4, 0
	bl sub_814C7BC
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x12
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1A
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1E
	bl SetGpuReg
	adds r0, r4, 0
	adds r0, 0x25
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0814C980
	ldrh r1, [r4, 0x28]
	ldr r0, _0814C968 @ =0x00008c9f
	cmp r1, r0
	bls _0814C96C
	adds r0, 0x1
	strh r0, [r4, 0x28]
	movs r0, 0x10
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	b _0814C976
	.align 2, 0
_0814C968: .4byte 0x00008c9f
_0814C96C:
	movs r0, 0xF
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
_0814C976:
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x10]
	strb r1, [r4, 0xC]
	b _0814C988
_0814C980:
	adds r0, r4, 0
	bl sub_814C618
	movs r0, 0
_0814C988:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_814C8F8

	thumb_func_start sub_814C990
sub_814C990: @ 814C990
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x5
	bls _0814C99C
	b _0814CB12
_0814C99C:
	lsls r0, 2
	ldr r1, _0814C9A8 @ =_0814C9AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814C9A8: .4byte _0814C9AC
	.align 2, 0
_0814C9AC:
	.4byte _0814C9C4
	.4byte _0814C9EC
	.4byte _0814CA3C
	.4byte _0814CABC
	.4byte _0814CADA
	.4byte _0814CAF4
_0814C9C4:
	movs r0, 0x8
	strh r0, [r4, 0x12]
	movs r0, 0xCF
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	ldr r2, _0814C9E8 @ =0x000003ff
	movs r1, 0x8
	bl BlendPalettes
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	b _0814CB12
	.align 2, 0
_0814C9E8: .4byte 0x000003ff
_0814C9EC:
	movs r1, 0x9C
	lsls r1, 1
	adds r5, r4, r1
	ldrb r0, [r5]
	subs r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0814CA02
	b _0814CB18
_0814CA02:
	movs r0, 0x1
	negs r0, r0
	ldr r2, _0814CA30 @ =0x000003ff
	movs r1, 0
	bl BlendPalettes
	ldr r2, _0814CA34 @ =0x00000139
	adds r1, r4, r2
	movs r0, 0x4
	strb r0, [r1]
	movs r0, 0
	strb r0, [r5]
	ldr r2, _0814CA38 @ =gUnknown_846E2F0
	ldrb r1, [r1]
	lsls r0, r1, 3
	subs r0, r1
	adds r0, r2
	ldrb r0, [r0]
	movs r2, 0x9D
	lsls r2, 1
	adds r1, r4, r2
	strb r0, [r1]
	b _0814CB12
	.align 2, 0
_0814CA30: .4byte 0x000003ff
_0814CA34: .4byte 0x00000139
_0814CA38: .4byte gUnknown_846E2F0
_0814CA3C:
	ldr r7, _0814CAB4 @ =gUnknown_846E2F0
	movs r0, 0x9C
	lsls r0, 1
	adds r6, r4, r0
	ldr r1, _0814CAB8 @ =0x00000139
	adds r5, r4, r1
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	ldrb r2, [r6]
	adds r0, r2
	adds r0, r7
	movs r1, 0
	ldrsb r1, [r0, r1]
	strh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x12
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1A
	bl SetGpuReg
	ldrh r1, [r4, 0x2C]
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x1E
	bl SetGpuReg
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	movs r1, 0x9D
	lsls r1, 1
	adds r2, r4, r1
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2]
	cmp r0, r1
	bcc _0814CB18
	ldrb r0, [r5]
	cmp r0, 0
	beq _0814CB12
	subs r0, 0x1
	strb r0, [r5]
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0
	strb r0, [r6]
	b _0814CB18
	.align 2, 0
_0814CAB4: .4byte gUnknown_846E2F0
_0814CAB8: .4byte 0x00000139
_0814CABC:
	movs r0, 0
	strh r0, [r4, 0x2C]
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	b _0814CB12
_0814CADA:
	movs r2, 0x9C
	lsls r2, 1
	adds r1, r4, r2
	adds r0, r4, 0
	bl sub_814DE50
	cmp r0, 0
	beq _0814CB18
	bl sub_80FA42C
	movs r0, 0
	strh r0, [r4, 0x10]
	b _0814CB12
_0814CAF4:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814CB18
	movs r0, 0x11
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x10]
	strb r1, [r4, 0xC]
	b _0814CB1A
_0814CB12:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_0814CB18:
	movs r0, 0
_0814CB1A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_814C990

	thumb_func_start sub_814CB20
sub_814CB20: @ 814CB20
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	beq _0814CB64
	cmp r0, 0x1
	bgt _0814CB38
	cmp r0, 0
	beq _0814CB42
	b _0814CBFC
_0814CB38:
	cmp r0, 0x2
	beq _0814CB8A
	cmp r0, 0x3
	beq _0814CBBC
	b _0814CBFC
_0814CB42:
	movs r0, 0x9
	strh r0, [r5, 0x12]
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x8
	movs r2, 0x1F
	bl BlendPalettes
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	movs r0, 0x4
	strb r0, [r1]
	b _0814CBFC
_0814CB64:
	movs r0, 0x9C
	lsls r0, 1
	adds r4, r5, r0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0814CC02
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	movs r2, 0x1F
	bl BlendPalettes
	movs r0, 0
	strb r0, [r4]
	b _0814CBFC
_0814CB8A:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	adds r0, r5, 0
	bl sub_814DE50
	cmp r0, 0
	beq _0814CC02
	bl sub_80FA42C
	movs r0, 0
	strh r0, [r5, 0x10]
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	b _0814CBFC
_0814CBBC:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814CC02
	ldr r0, _0814CBF8 @ =gStringVar1
	ldr r1, [r5, 0x1C]
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r4, 0
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0x7
	movs r2, 0x1
	movs r3, 0
	bl sub_814D5A4
	movs r0, 0x13
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r0, 0
	strh r4, [r5, 0x10]
	b _0814CC00
	.align 2, 0
_0814CBF8: .4byte gStringVar1
_0814CBFC:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
_0814CC00:
	strb r0, [r5, 0xC]
_0814CC02:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_814CB20

	thumb_func_start sub_814CC0C
sub_814CC0C: @ 814CC0C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldrb r0, [r7, 0xC]
	cmp r0, 0x7
	bls _0814CC22
	b _0814CF8E
_0814CC22:
	lsls r0, 2
	ldr r1, _0814CC2C @ =_0814CC30
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814CC2C: .4byte _0814CC30
	.align 2, 0
_0814CC30:
	.4byte _0814CC50
	.4byte _0814CC8A
	.4byte _0814CC98
	.4byte _0814CD00
	.4byte _0814CE80
	.4byte _0814CF30
	.4byte _0814CF3C
	.4byte _0814CF70
_0814CC50:
	adds r4, r7, 0
	adds r4, 0x42
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x4
	bl memset
	ldrb r0, [r7, 0x8]
	lsls r0, 5
	adds r0, r7, r0
	adds r2, r0, 0
	adds r2, 0xB2
	ldrh r1, [r7, 0x28]
	ldrh r0, [r2]
	cmp r0, r1
	bls _0814CC72
	strh r1, [r2]
_0814CC72:
	ldrb r0, [r7, 0x8]
	lsls r0, 5
	adds r0, r7, r0
	adds r0, 0xB2
	ldrh r0, [r0]
	strh r0, [r4]
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0x2
	bl SendBlock
	b _0814CF8E
_0814CC8A:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	bne _0814CC96
	b _0814CF94
_0814CC96:
	b _0814CF64
_0814CC98:
	bl GetBlockReceivedStatus
	ldr r2, _0814CCF4 @ =gUnknown_846E3C8
	ldrb r3, [r7, 0x9]
	subs r1, r3, 0x2
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	beq _0814CCB0
	b _0814CF94
_0814CCB0:
	movs r0, 0
	mov r8, r0
	adds r4, r7, 0
	adds r4, 0x42
	cmp r8, r3
	bcs _0814CCDE
	ldr r2, _0814CCF8 @ =gBlockRecvBuffer
_0814CCBE:
	mov r3, r8
	lsls r1, r3, 5
	adds r1, r7, r1
	lsls r0, r3, 8
	adds r0, r2
	ldrh r0, [r0]
	adds r1, 0xB2
	strh r0, [r1]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r6, [r7, 0x9]
	cmp r8, r6
	bcc _0814CCBE
_0814CCDE:
	movs r0, 0
	strh r0, [r7, 0x10]
	strh r0, [r4]
	bl ResetBlockReceivedFlags
	ldrb r0, [r7, 0x8]
	cmp r0, 0
	bne _0814CCFC
	movs r0, 0x3
	b _0814CF92
	.align 2, 0
_0814CCF4: .4byte gUnknown_846E3C8
_0814CCF8: .4byte gBlockRecvBuffer
_0814CCFC:
	movs r0, 0x6
	b _0814CF92
_0814CD00:
	adds r0, r7, 0
	adds r0, 0x68
	movs r1, 0
	movs r2, 0x30
	bl memset
	ldrh r1, [r7, 0x28]
	adds r0, r7, 0
	adds r0, 0x6C
	strh r1, [r0]
	movs r0, 0x18
	ldrsh r4, [r7, r0]
	ldrh r0, [r7, 0x28]
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl __divsi3
	adds r1, r7, 0
	adds r1, 0x6E
	strh r0, [r1]
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	lsls r0, 8
	movs r4, 0xC8
	lsls r4, 6
	adds r1, r4, 0
	bl sub_80D8AE0
	adds r2, r0, 0
	movs r3, 0x32
	ldrsh r1, [r7, r3]
	lsls r1, 8
	bl sub_80D8B68
	adds r2, r0, r4
	asrs r2, 8
	movs r1, 0x7F
	adds r0, r2, 0
	ands r0, r1
	adds r1, r7, 0
	adds r1, 0x70
	strh r0, [r1]
	lsls r2, 8
	movs r1, 0xC8
	lsls r1, 7
	adds r0, r2, 0
	bl sub_80D8B68
	adds r2, r0, 0
	ldrb r1, [r7, 0x9]
	ldr r0, [r7, 0x1C]
	muls r0, r1
	lsls r4, r0, 8
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80D8AE0
	adds r4, r0, 0
	asrs r0, r4, 8
	str r0, [r7, 0x68]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r1, r7, 0
	adds r1, 0x8F
	strb r0, [r1]
	movs r6, 0
	mov r8, r6
	mov r9, r1
	ldrb r0, [r7, 0x9]
	cmp r8, r0
	bcc _0814CDA4
	b _0814CF8E
_0814CDA4:
	adds r0, r7, 0
	adds r0, 0x88
	add r0, r8
	mov r1, r8
	strb r1, [r0]
	adds r0, r7, 0
	adds r0, 0x90
	add r0, r8
	strb r1, [r0]
	mov r3, r8
	lsls r2, r3, 1
	adds r1, r7, 0
	adds r1, 0x74
	adds r1, r2
	lsls r0, r3, 5
	adds r3, r7, r0
	adds r5, r3, 0
	adds r5, 0xAE
	ldrh r0, [r5]
	strh r0, [r1]
	adds r1, r7, 0
	adds r1, 0x72
	ldrh r6, [r1]
	adds r0, r6
	strh r0, [r1]
	mov r1, r9
	ldrb r0, [r1]
	adds r6, r2, 0
	cmp r0, 0x1
	beq _0814CE0E
	cmp r0, 0x1
	bgt _0814CDEA
	cmp r0, 0
	beq _0814CDF0
	b _0814CE64
_0814CDEA:
	cmp r0, 0x2
	beq _0814CE2C
	b _0814CE64
_0814CDF0:
	ldrh r0, [r5]
	cmp r0, 0
	beq _0814CE32
	adds r0, r3, 0
	adds r0, 0xAC
	ldrh r2, [r0]
	lsls r2, 8
	adds r0, r2, 0
	movs r1, 0xC8
	lsls r1, 7
	bl sub_80D8AE0
	adds r2, r0, 0
	ldrh r4, [r5]
	b _0814CE5A
_0814CE0E:
	ldrh r0, [r5]
	cmp r0, 0
	beq _0814CE32
	adds r0, r3, 0
	adds r0, 0xB0
	ldrh r2, [r0]
	lsls r2, 8
	adds r0, r2, 0
	movs r1, 0xC8
	lsls r1, 7
	bl sub_80D8AE0
	adds r2, r0, 0
	ldrh r4, [r5]
	b _0814CE5A
_0814CE2C:
	ldrh r0, [r5]
	cmp r0, 0
	bne _0814CE36
_0814CE32:
	movs r4, 0
	b _0814CE64
_0814CE36:
	adds r1, r3, 0
	adds r1, 0xB2
	ldrh r0, [r1]
	ldrh r2, [r7, 0x28]
	cmp r0, r2
	bcc _0814CE48
	movs r4, 0xC8
	lsls r4, 7
	b _0814CE64
_0814CE48:
	ldrh r2, [r1]
	lsls r2, 8
	adds r0, r2, 0
	movs r1, 0xC8
	lsls r1, 7
	bl sub_80D8AE0
	adds r2, r0, 0
	ldrh r4, [r7, 0x28]
_0814CE5A:
	lsls r4, 8
	adds r1, r4, 0
	bl sub_80D8B68
	adds r4, r0, 0
_0814CE64:
	asrs r4, 4
	adds r0, r7, 0
	adds r0, 0x7E
	adds r0, r6
	strh r4, [r0]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r3, [r7, 0x9]
	cmp r8, r3
	bcc _0814CDA4
	b _0814CF8E
_0814CE80:
	movs r6, 0
	mov r8, r6
	ldrb r0, [r7, 0x9]
	subs r0, 0x1
	adds r1, r7, 0
	adds r1, 0x68
	str r1, [sp, 0xC]
	cmp r8, r0
	bge _0814CF24
_0814CE92:
	ldrb r0, [r7, 0x9]
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r2, r8
	adds r2, 0x1
	str r2, [sp, 0x8]
	cmp r4, r8
	bls _0814CF14
	adds r3, r7, 0
	adds r3, 0x74
	str r3, [sp]
	adds r6, r7, 0
	adds r6, 0x88
	str r6, [sp, 0x4]
	movs r0, 0x90
	adds r0, r7
	mov r10, r0
	movs r1, 0x7E
	adds r1, r7
	mov r9, r1
_0814CEBC:
	subs r2, r4, 0x1
	mov r12, r2
	lsls r6, r2, 1
	ldr r0, [sp]
	adds r3, r0, r6
	lsls r5, r4, 1
	adds r1, r0, r5
	ldrh r2, [r3]
	ldrh r0, [r1]
	cmp r2, r0
	bcs _0814CEE6
	ldrh r0, [r1]
	strh r2, [r1]
	strh r0, [r3]
	ldr r1, [sp, 0x4]
	adds r2, r1, r4
	ldrb r3, [r2]
	add r1, r12
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
_0814CEE6:
	mov r2, r9
	adds r3, r2, r6
	adds r1, r2, r5
	ldrh r2, [r3]
	ldrh r6, [r1]
	cmp r2, r6
	bcs _0814CF0A
	ldrh r0, [r1]
	strh r2, [r1]
	strh r0, [r3]
	mov r0, r10
	adds r2, r0, r4
	ldrb r3, [r2]
	mov r1, r10
	add r1, r12
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
_0814CF0A:
	mov r1, r12
	lsls r0, r1, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bhi _0814CEBC
_0814CF14:
	ldr r2, [sp, 0x8]
	lsls r0, r2, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r7, 0x9]
	subs r0, 0x1
	cmp r8, r0
	blt _0814CE92
_0814CF24:
	movs r0, 0
	ldr r1, [sp, 0xC]
	movs r2, 0x30
	bl SendBlock
	b _0814CF8E
_0814CF30:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814CF94
	b _0814CF64
_0814CF3C:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0814CF94
	adds r4, r7, 0
	adds r4, 0x68
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x30
	bl memset
	ldr r1, _0814CF6C @ =gBlockRecvBuffer
	adds r0, r4, 0
	movs r2, 0x30
	bl memcpy
	bl ResetBlockReceivedFlags
_0814CF64:
	movs r0, 0
	strh r0, [r7, 0x10]
	b _0814CF8E
	.align 2, 0
_0814CF6C: .4byte gBlockRecvBuffer
_0814CF70:
	bl sub_814B930
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r0, 0
	movs r1, 0xB
	strh r1, [r7, 0x12]
	strb r0, [r7, 0xC]
	adds r1, r7, 0
	adds r1, 0x24
	strb r0, [r1]
	b _0814CF94
_0814CF8E:
	ldrb r0, [r7, 0xC]
	adds r0, 0x1
_0814CF92:
	strb r0, [r7, 0xC]
_0814CF94:
	movs r0, 0
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_814CC0C

	thumb_func_start sub_814CFA8
sub_814CFA8: @ 814CFA8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x4
	bhi _0814D084
	lsls r0, 2
	ldr r1, _0814CFC0 @ =_0814CFC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814CFC0: .4byte _0814CFC4
	.align 2, 0
_0814CFC4:
	.4byte _0814CFD8
	.4byte _0814CFEA
	.4byte _0814CFFC
	.4byte _0814D02C
	.4byte _0814D03C
_0814CFD8:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	adds r0, r5, 0
	bl sub_814E644
	cmp r0, 0
	bne _0814D084
	b _0814D08A
_0814CFEA:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	movs r0, 0x1E
	strb r0, [r1]
	b _0814D084
_0814CFFC:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0814D00E
	subs r0, 0x1
	strb r0, [r1]
	b _0814D08A
_0814D00E:
	ldr r0, _0814D028 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814D08A
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl sub_814E80C
	b _0814D084
	.align 2, 0
_0814D028: .4byte gMain
_0814D02C:
	ldrh r0, [r5, 0x12]
	cmp r0, 0xC
	bhi _0814D084
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x12]
	strb r1, [r5, 0xC]
	b _0814D08A
_0814D03C:
	ldr r0, _0814D07C @ =gStringVar1
	ldr r1, [r5, 0x1C]
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _0814D080 @ =gStringVar2
	bl GetBerryPowder
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r4, 0
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0x2
	movs r2, 0x3
	movs r3, 0
	bl sub_814D5A4
	movs r0, 0x13
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	strb r4, [r5, 0xC]
	b _0814D08A
	.align 2, 0
_0814D07C: .4byte gStringVar1
_0814D080: .4byte gStringVar2
_0814D084:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0814D08A:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_814CFA8

	thumb_func_start sub_814D094
sub_814D094: @ 814D094
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x4
	bhi _0814D178
	lsls r0, 2
	ldr r1, _0814D0AC @ =_0814D0B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814D0AC: .4byte _0814D0B0
	.align 2, 0
_0814D0B0:
	.4byte _0814D0C4
	.4byte _0814D100
	.4byte _0814D106
	.4byte _0814D150
	.4byte _0814D164
_0814D0C4:
	ldrh r1, [r5, 0x28]
	ldr r0, _0814D0FC @ =0x00008c9f
	cmp r1, r0
	bls _0814D0D6
	movs r1, 0x9C
	lsls r1, 1
	adds r0, r5, r1
	bl sub_814EB04
_0814D0D6:
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x8
	movs r2, 0
	movs r3, 0
	bl sub_814D5A4
	movs r4, 0
	movs r0, 0x13
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	strb r4, [r5, 0xC]
	b _0814D17E
	.align 2, 0
_0814D0FC: .4byte 0x00008c9f
_0814D100:
	bl sub_80FA42C
	b _0814D178
_0814D106:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814D17E
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	ldr r2, _0814D148 @ =gUnknown_8419F54
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized2
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _0814D14C @ =sub_80DA634
	movs r1, 0
	bl CreateTask
	b _0814D178
	.align 2, 0
_0814D148: .4byte gUnknown_8419F54
_0814D14C: .4byte sub_80DA634
_0814D150:
	ldr r0, _0814D160 @ =sub_80DA634
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _0814D178
	b _0814D17E
	.align 2, 0
_0814D160: .4byte sub_80DA634
_0814D164:
	movs r0, 0x14
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r1, 0
	movs r0, 0xF
	strh r0, [r5, 0x12]
	strb r1, [r5, 0xC]
	b _0814D17E
_0814D178:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0814D17E:
	movs r0, 0
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814D094

	thumb_func_start sub_814D188
sub_814D188: @ 814D188
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	beq _0814D1CA
	cmp r0, 0x1
	bgt _0814D1A0
	cmp r0, 0
	beq _0814D1A6
	b _0814D230
_0814D1A0:
	cmp r0, 0x2
	beq _0814D1D0
	b _0814D230
_0814D1A6:
	movs r0, 0x1
	str r0, [sp]
	adds r0, r6, 0
	movs r1, 0x4
	movs r2, 0
	movs r3, 0
	bl sub_814D5A4
	movs r0, 0x14
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r0, 0
	strb r0, [r5, 0xC]
	b _0814D238
_0814D1CA:
	bl DisplayYesNoMenuDefaultYes
	b _0814D230
_0814D1D0:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _0814D236
	adds r0, r5, 0
	adds r0, 0x42
	movs r1, 0
	movs r2, 0xC
	bl memset
	cmp r4, 0
	bne _0814D202
	bl CheckHasAtLeastOneBerry
	lsls r0, 24
	cmp r0, 0
	beq _0814D1FE
	strh r4, [r5, 0x14]
	b _0814D206
_0814D1FE:
	movs r0, 0x3
	b _0814D204
_0814D202:
	movs r0, 0x1
_0814D204:
	strh r0, [r5, 0x14]
_0814D206:
	movs r0, 0
	movs r1, 0x1
	bl ClearDialogWindowAndFrame
	movs r4, 0
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0x8
	movs r2, 0
	movs r3, 0
	bl sub_814D5A4
	movs r0, 0x15
	strb r0, [r5, 0xE]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	strb r4, [r5, 0xC]
	b _0814D236
_0814D230:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0814D236:
	movs r0, 0
_0814D238:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_814D188

	thumb_func_start sub_814D240
sub_814D240: @ 814D240
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	beq _0814D266
	cmp r0, 0x1
	bgt _0814D256
	cmp r0, 0
	beq _0814D260
	b _0814D30C
_0814D256:
	cmp r0, 0x2
	beq _0814D288
	cmp r0, 0x3
	beq _0814D296
	b _0814D30C
_0814D260:
	bl sub_80FA42C
	b _0814D30C
_0814D266:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814D312
	ldrh r0, [r4, 0x14]
	adds r1, r4, 0
	adds r1, 0x42
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x4E
	strh r5, [r0]
	movs r0, 0
	movs r2, 0x2
	bl SendBlock
	b _0814D30C
_0814D288:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814D312
	strh r5, [r4, 0x10]
	b _0814D30C
_0814D296:
	bl GetBlockReceivedStatus
	ldr r2, _0814D2E8 @ =gUnknown_846E3C8
	ldrb r3, [r4, 0x9]
	subs r1, r3, 0x2
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _0814D312
	adds r7, r4, 0
	adds r7, 0x42
	adds r6, r4, 0
	adds r6, 0x4E
	cmp r5, r3
	bcs _0814D2D4
	adds r1, r6, 0
	ldr r2, _0814D2EC @ =gBlockRecvBuffer
_0814D2BC:
	lsls r0, r5, 8
	adds r0, r2
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r3
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4, 0x9]
	cmp r5, r0
	bcc _0814D2BC
_0814D2D4:
	ldrh r0, [r6]
	cmp r0, 0
	beq _0814D2F0
	movs r0, 0x17
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	b _0814D2FA
	.align 2, 0
_0814D2E8: .4byte gUnknown_846E3C8
_0814D2EC: .4byte gBlockRecvBuffer
_0814D2F0:
	movs r0, 0x16
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
_0814D2FA:
	bl ResetBlockReceivedFlags
	movs r1, 0
	movs r0, 0
	strh r0, [r7]
	strh r0, [r6]
	strh r0, [r4, 0x10]
	strb r1, [r4, 0xC]
	b _0814D314
_0814D30C:
	ldrb r0, [r4, 0xC]
	adds r0, 0x1
	strb r0, [r4, 0xC]
_0814D312:
	movs r0, 0
_0814D314:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_814D240

	thumb_func_start sub_814D31C
sub_814D31C: @ 814D31C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrb r4, [r5, 0xC]
	cmp r4, 0x1
	beq _0814D34A
	cmp r4, 0x1
	bgt _0814D332
	cmp r4, 0
	beq _0814D33C
	b _0814D394
_0814D332:
	cmp r4, 0x2
	beq _0814D356
	cmp r4, 0x3
	beq _0814D37A
	b _0814D394
_0814D33C:
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	b _0814D370
_0814D34A:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _0814D394
	b _0814D39A
_0814D356:
	movs r0, 0
	movs r1, 0x1
	bl ClearDialogWindowAndFrame
	adds r0, r5, 0
	bl sub_814DA04
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
_0814D370:
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _0814D394
_0814D37A:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0814D39A
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	movs r0, 0
	strh r4, [r5, 0x12]
	b _0814D398
_0814D394:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
_0814D398:
	strb r0, [r5, 0xC]
_0814D39A:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814D31C

	thumb_func_start sub_814D3A4
sub_814D3A4: @ 814D3A4
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	ldrb r4, [r5, 0xC]
	cmp r4, 0x1
	beq _0814D41C
	cmp r4, 0x1
	bgt _0814D3BA
	cmp r4, 0
	beq _0814D3C0
	b _0814D456
_0814D3BA:
	cmp r4, 0x2
	beq _0814D434
	b _0814D456
_0814D3C0:
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	ldrh r1, [r5, 0x14]
	cmp r1, 0x3
	bne _0814D3F0
	ldr r0, _0814D3EC @ =gUnknown_846E328
	ldr r2, [r0, 0x14]
	ldrb r3, [r5, 0xB]
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	bl AddTextPrinterParameterized2
	b _0814D40C
	.align 2, 0
_0814D3EC: .4byte gUnknown_846E328
_0814D3F0:
	ldr r0, _0814D418 @ =gUnknown_846E328
	ldr r2, [r0, 0x18]
	ldrb r3, [r5, 0xB]
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	bl AddTextPrinterParameterized2
_0814D40C:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	b _0814D456
	.align 2, 0
_0814D418: .4byte gUnknown_846E328
_0814D41C:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _0814D45C
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	movs r0, 0x78
	strb r0, [r1]
	b _0814D456
_0814D434:
	movs r0, 0x9C
	lsls r0, 1
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r4, r0, 0
	cmp r4, 0
	beq _0814D448
	subs r0, 0x1
	strb r0, [r1]
	b _0814D45C
_0814D448:
	movs r0, 0x18
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	strb r4, [r5, 0xC]
	b _0814D45C
_0814D456:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0814D45C:
	movs r0, 0
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814D3A4

	thumb_func_start sub_814D468
sub_814D468: @ 814D468
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r4, [r5, 0xC]
	cmp r4, 0x1
	beq _0814D488
	cmp r4, 0x1
	bgt _0814D47C
	cmp r4, 0
	beq _0814D482
	b _0814D4B8
_0814D47C:
	cmp r4, 0x2
	beq _0814D498
	b _0814D4B8
_0814D482:
	bl sub_80FA42C
	b _0814D4B8
_0814D488:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0814D4BE
	bl sub_800AAC0
	b _0814D4B8
_0814D498:
	ldr r0, _0814D4B4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814D4BE
	movs r0, 0x19
	strb r0, [r5, 0xE]
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0
	bl sub_814BB4C
	strb r4, [r5, 0xC]
	b _0814D4BE
	.align 2, 0
_0814D4B4: .4byte gReceivedRemoteLinkPlayers
_0814D4B8:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
_0814D4BE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814D468

	thumb_func_start sub_814D4C8
sub_814D4C8: @ 814D4C8
	push {lr}
	movs r0, 0
	bl sub_814B6FC
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_814D4C8

	thumb_func_start sub_814D4D8
sub_814D4D8: @ 814D4D8
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r5, 0
	movs r0, 0x33
	bl IncrementGameStat
	strb r5, [r4, 0xD]
	movs r1, 0
	strh r5, [r4, 0x10]
	movs r0, 0x2
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	str r5, [r4, 0x1C]
	strh r5, [r4, 0x18]
	strh r5, [r4, 0x1A]
	str r5, [r4, 0x20]
	adds r0, r4, 0
	adds r0, 0x24
	strb r1, [r0]
	adds r1, r4, 0
	adds r1, 0x25
	movs r0, 0
	strb r0, [r1]
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x28]
	strh r5, [r4, 0x2E]
	ldr r0, _0814D560 @ =0x0000ffff
	strh r0, [r4, 0x32]
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x34]
	movs r6, 0
	movs r3, 0
_0814D518:
	lsls r0, r5, 5
	adds r2, r4, r0
	adds r1, r2, 0
	adds r1, 0xA4
	ldr r0, _0814D560 @ =0x0000ffff
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0xA6
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r1, 0x6
	movs r0, 0x1
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0xAC
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strb r6, [r0]
	adds r0, 0x1
	strb r6, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0814D518
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814D560: .4byte 0x0000ffff
	thumb_func_end sub_814D4D8

	thumb_func_start sub_814D564
sub_814D564: @ 814D564
	push {r4-r6,lr}
	sub sp, 0x8
	str r2, [sp, 0x4]
	ldr r5, [sp, 0x18]
	ldr r6, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	mov r2, sp
	strh r4, [r2]
	add r4, sp, 0x4
	ldrb r2, [r4]
	strb r2, [r0]
	ldrb r2, [r4, 0x1]
	strb r2, [r0, 0x1]
	ldrb r2, [r4, 0x2]
	strb r2, [r0, 0x2]
	ldrb r2, [r4, 0x3]
	strb r2, [r0, 0x3]
	strb r3, [r0, 0x4]
	strb r5, [r0, 0x5]
	strb r6, [r0, 0x6]
	mov r2, sp
	ldrb r2, [r2]
	strb r2, [r0, 0x7]
	mov r2, sp
	ldrb r2, [r2, 0x1]
	strb r2, [r0, 0x8]
	strb r1, [r0, 0x9]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_814D564

	thumb_func_start sub_814D5A4
sub_814D5A4: @ 814D5A4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, [sp, 0x10]
	mov r4, sp
	strh r3, [r4]
	strb r1, [r0]
	strb r2, [r0, 0x1]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0, 0x2]
	mov r1, sp
	ldrb r1, [r1, 0x1]
	strb r1, [r0, 0x3]
	strb r5, [r0, 0x4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814D5A4

	.align 2, 0 @ Don't pad with nop.
