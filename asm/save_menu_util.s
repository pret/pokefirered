	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F7FCC
sub_80F7FCC: @ 80F7FCC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r2, 24
	lsrs r2, 24
	adds r5, r1, 0
	movs r1, 0xFC
	strb r1, [r5]
	adds r5, 0x1
	movs r0, 0x1
	strb r0, [r5]
	adds r5, 0x1
	strb r2, [r5]
	adds r5, 0x1
	strb r1, [r5]
	adds r5, 0x1
	movs r0, 0x3
	strb r0, [r5]
	adds r5, 0x1
	adds r2, 0x1
	strb r2, [r5]
	adds r5, 0x1
	cmp r3, 0x5
	bhi _080F80D8
	lsls r0, r3, 2
	ldr r1, _080F8008 @ =_080F800C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F8008: .4byte _080F800C
	.align 2, 0
_080F800C:
	.4byte _080F8024
	.4byte _080F8034
	.4byte _080F805C
	.4byte _080F8098
	.4byte _080F80A8
	.4byte _080F806C
_080F8024:
	ldr r0, _080F8030 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	adds r0, r5, 0
	bl StringCopy
	b _080F80D8
	.align 2, 0
_080F8030: .4byte gSaveBlock2Ptr
_080F8034:
	bl sub_806E25C
	cmp r0, 0
	beq _080F8044
	movs r0, 0x1
	bl pokedex_count
	b _080F804A
_080F8044:
	movs r0, 0x1
	bl sub_8088EDC
_080F804A:
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	b _080F80D8
_080F805C:
	ldr r4, _080F8068 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	adds r0, r5, 0
	movs r2, 0
	b _080F8076
	.align 2, 0
_080F8068: .4byte gSaveBlock2Ptr
_080F806C:
	ldr r4, _080F8094 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	adds r0, r5, 0
	movs r2, 0x1
_080F8076:
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r5, r0, 0
	movs r0, 0xF0
	strb r0, [r5]
	adds r5, 0x1
	ldr r0, [r4]
	ldrb r1, [r0, 0x10]
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	b _080F80D8
	.align 2, 0
_080F8094: .4byte gSaveBlock2Ptr
_080F8098:
	ldr r0, _080F80A4 @ =gMapHeader
	ldrb r1, [r0, 0x14]
	adds r0, r5, 0
	bl sub_80C4DF8
	b _080F80D8
	.align 2, 0
_080F80A4: .4byte gMapHeader
_080F80A8:
	movs r4, 0x82
	lsls r4, 4
	movs r6, 0
	adds r7, r5, 0x1
_080F80B0:
	lsls r0, r4, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080F80C0
	adds r6, 0x1
_080F80C0:
	adds r4, 0x1
	ldr r0, _080F80E0 @ =0x00000827
	cmp r4, r0
	ble _080F80B0
	adds r0, r6, 0
	subs r0, 0x5F
	strb r0, [r5]
	adds r5, r7, 0
	movs r0, 0xA
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
_080F80D8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F80E0: .4byte 0x00000827
	thumb_func_end sub_80F7FCC

	.align 2, 0 @ Don't pad with nop.
