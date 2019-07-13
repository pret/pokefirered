	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80CD9F4
sub_80CD9F4: @ 80CD9F4
	push {r4-r7,lr}
	sub sp, 0x14
	movs r0, 0x17
	bl GetGameStat
	adds r4, r0, 0
	movs r0, 0x18
	bl GetGameStat
	adds r5, r0, 0
	movs r0, 0x19
	bl GetGameStat
	adds r6, r0, 0
	ldr r0, _080CDAB0 @ =0x0000270f
	cmp r4, r0
	bls _080CDA18
	adds r4, r0, 0
_080CDA18:
	cmp r5, r0
	bls _080CDA1E
	adds r5, r0, 0
_080CDA1E:
	cmp r6, r0
	bls _080CDA24
	adds r6, r0, 0
_080CDA24:
	ldr r0, _080CDAB4 @ =gStringVar1
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, _080CDAB8 @ =gStringVar2
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, _080CDABC @ =gStringVar3
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r3, 0
	ldr r6, _080CDAC0 @ =gUnknown_83F6C84
	ldr r7, _080CDAC4 @ =gStringVar4
	ldr r0, _080CDAC8 @ =gUnknown_8418188
	mov r12, r0
	movs r5, 0
_080CDA54:
	lsls r0, r3, 2
	adds r0, r6
	ldr r2, [r0]
	movs r1, 0
	adds r4, r3, 0x1
	movs r3, 0x3
_080CDA60:
	cmp r1, 0
	bne _080CDA70
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080CDA6C
	movs r1, 0x1
_080CDA6C:
	cmp r1, 0
	beq _080CDA72
_080CDA70:
	strb r5, [r2]
_080CDA72:
	adds r2, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _080CDA60
	movs r0, 0xFF
	strb r0, [r2]
	adds r3, r4, 0
	cmp r3, 0x2
	bls _080CDA54
	adds r0, r7, 0
	mov r1, r12
	bl StringExpandPlaceholders
	movs r0, 0
	str r0, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	ldr r1, _080CDACC @ =gUnknown_83F6C78
	str r1, [sp, 0x8]
	str r0, [sp, 0xC]
	str r7, [sp, 0x10]
	movs r1, 0x2
	movs r2, 0xC
	movs r3, 0x18
	bl AddTextPrinterParameterized4
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDAB0: .4byte 0x0000270f
_080CDAB4: .4byte gStringVar1
_080CDAB8: .4byte gStringVar2
_080CDABC: .4byte gStringVar3
_080CDAC0: .4byte gUnknown_83F6C84
_080CDAC4: .4byte gStringVar4
_080CDAC8: .4byte gUnknown_8418188
_080CDACC: .4byte gUnknown_83F6C78
	thumb_func_end sub_80CD9F4

	thumb_func_start sub_80CDAD0
sub_80CDAD0: @ 80CDAD0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r5, 0
	ldrh r0, [r6, 0xA]
	cmp r0, 0
	bne _080CDB50
	ldr r0, [r6, 0xC]
	cmp r0, 0
	bne _080CDB50
	str r5, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	ldr r0, _080CDB44 @ =gUnknown_83F6C78
	str r0, [sp, 0x8]
	str r5, [sp, 0xC]
	ldr r0, _080CDB48 @ =gUnknown_84181B6
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	mov r3, r8
	bl AddTextPrinterParameterized4
	movs r6, 0
_080CDB0E:
	movs r4, 0x54
	cmp r5, 0
	beq _080CDB1C
	movs r4, 0xB4
	cmp r5, 0x1
	bne _080CDB1C
	movs r4, 0x84
_080CDB1C:
	adds r2, r4, 0
	str r6, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	ldr r0, _080CDB44 @ =gUnknown_83F6C78
	str r0, [sp, 0x8]
	str r6, [sp, 0xC]
	ldr r0, _080CDB4C @ =gUnknown_84181BE
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	mov r3, r8
	bl AddTextPrinterParameterized4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080CDB0E
	b _080CDBCE
	.align 2, 0
_080CDB44: .4byte gUnknown_83F6C78
_080CDB48: .4byte gUnknown_84181B6
_080CDB4C: .4byte gUnknown_84181BE
_080CDB50:
	movs r5, 0
	ldr r7, _080CDB70 @ =gStringVar1
	mov r9, r5
_080CDB56:
	cmp r5, 0
	bne _080CDB74
	movs r4, 0
	adds r0, r7, 0
	movs r1, 0x8
	bl StringFillWithTerminator
	adds r0, r7, 0
	adds r1, r6, 0
	movs r2, 0x7
	bl StringCopyN
	b _080CDBA6
	.align 2, 0
_080CDB70: .4byte gStringVar1
_080CDB74:
	cmp r5, 0x1
	bne _080CDB7E
	movs r4, 0x54
	ldrh r1, [r6, 0xA]
	b _080CDB86
_080CDB7E:
	cmp r5, 0x2
	bne _080CDB98
	movs r4, 0x84
	ldrh r1, [r6, 0xC]
_080CDB86:
	ldr r0, _080CDB94 @ =gStringVar1
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	b _080CDBA6
	.align 2, 0
_080CDB94: .4byte gStringVar1
_080CDB98:
	movs r4, 0xB4
	ldrh r1, [r6, 0xE]
	ldr r0, _080CDBDC @ =gStringVar1
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
_080CDBA6:
	adds r2, r4, 0
	mov r0, r9
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	ldr r0, _080CDBE0 @ =gUnknown_83F6C78
	str r0, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	str r7, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	mov r3, r8
	bl AddTextPrinterParameterized4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080CDB56
_080CDBCE:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDBDC: .4byte gStringVar1
_080CDBE0: .4byte gUnknown_83F6C78
	thumb_func_end sub_80CDAD0

	thumb_func_start sub_80CDBE4
sub_80CDBE4: @ 80CDBE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	movs r0, 0xD8
	str r0, [sp]
	movs r0, 0x90
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	ldr r5, _080CDC9C @ =gStringVar4
	ldr r1, _080CDCA0 @ =gUnknown_8418174
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	adds r1, r5, 0
	bl GetStringWidth
	movs r2, 0xD0
	subs r2, r0
	lsrs r2, 1
	lsls r2, 24
	lsrs r2, 24
	movs r4, 0
	str r4, [sp]
	movs r0, 0x2
	mov r9, r0
	str r0, [sp, 0x4]
	ldr r6, _080CDCA4 @ =gUnknown_83F6C78
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	str r5, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x4
	bl AddTextPrinterParameterized4
	ldr r5, _080CDCA8 @ =gSaveBlock2Ptr
	ldr r0, [r5]
	ldr r1, _080CDCAC @ =0x00000a98
	mov r8, r1
	add r0, r8
	bl sub_80CD9F4
	str r4, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r0, _080CDCB0 @ =gUnknown_84181A4
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x54
	movs r3, 0x30
	bl AddTextPrinterParameterized4
	adds r7, r5, 0
	movs r5, 0xF4
	lsls r5, 22
	mov r6, r8
	movs r4, 0x4
_080CDC70:
	ldr r0, [r7]
	adds r0, r6
	lsrs r1, r5, 24
	bl sub_80CDAD0
	movs r1, 0xE0
	lsls r1, 20
	adds r5, r1
	adds r6, 0x10
	subs r4, 0x1
	cmp r4, 0
	bge _080CDC70
	movs r0, 0
	bl sub_80CDCB4
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDC9C: .4byte gStringVar4
_080CDCA0: .4byte gUnknown_8418174
_080CDCA4: .4byte gUnknown_83F6C78
_080CDCA8: .4byte gSaveBlock2Ptr
_080CDCAC: .4byte 0x00000a98
_080CDCB0: .4byte gUnknown_84181A4
	thumb_func_end sub_80CDBE4

	thumb_func_start sub_80CDCB4
sub_80CDCB4: @ 80CDCB4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CDCB4

	thumb_func_start sub_80CDCD0
sub_80CDCD0: @ 80CDCD0
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080CDD0C @ =gUnknown_83F6388
	adds r0, r4, 0
	movs r2, 0xC0
	movs r3, 0
	bl LoadBgTiles
	ldr r1, _080CDD10 @ =gUnknown_83F6468
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBufferRect
	ldr r0, _080CDD14 @ =gUnknown_83F6448
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CDD0C: .4byte gUnknown_83F6388
_080CDD10: .4byte gUnknown_83F6468
_080CDD14: .4byte gUnknown_83F6448
	thumb_func_end sub_80CDCD0

	.align 2, 0 @ Don't pad with nop.
