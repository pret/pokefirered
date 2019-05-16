	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BFCD0
sub_80BFCD0: @ 80BFCD0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080BFD24 @ =0x00004082
	adds r0, r6, 0
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bne _080BFD38
	ldr r0, _080BFD28 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _080BFD2C @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _080BFD30 @ =0x00003d42
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	blt _080BFD0A
	adds r0, r6, 0
	movs r1, 0
	bl VarSet
_080BFD0A:
	ldr r0, _080BFD34 @ =gSpecialVar_LastTalked
	strh r5, [r0]
	movs r0, 0x4
	strh r0, [r4, 0x4]
	movs r0, 0xB
	strh r0, [r4, 0x6]
	movs r0, 0x2
	strb r0, [r4]
	movs r0, 0xA
	strb r0, [r4, 0x1]
	movs r0, 0xFF
	strb r0, [r4, 0x2]
	b _080BFDFA
	.align 2, 0
_080BFD24: .4byte 0x00004082
_080BFD28: .4byte gSaveBlock1Ptr
_080BFD2C: .4byte 0x00003d34
_080BFD30: .4byte 0x00003d42
_080BFD34: .4byte gSpecialVar_LastTalked
_080BFD38:
	ldr r0, _080BFD7C @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1D]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl GetHealLocationIndexFromMapGroupAndNum
	adds r6, r0, 0
	ldr r2, _080BFD80 @ =gUnknown_83EEC98
	subs r0, r6, 0x1
	lsls r0, 2
	adds r1, r0, r2
	ldrh r1, [r1]
	strb r1, [r4]
	adds r2, 0x2
	adds r0, r2
	ldrh r2, [r0]
	strb r2, [r4, 0x1]
	movs r0, 0xFF
	strb r0, [r4, 0x2]
	cmp r1, 0x4
	bne _080BFD84
	cmp r2, 0
	bne _080BFD84
	movs r0, 0x8
	strh r0, [r4, 0x4]
	movs r0, 0x5
	b _080BFDF2
	.align 2, 0
_080BFD7C: .4byte gSaveBlock1Ptr
_080BFD80: .4byte gUnknown_83EEC98
_080BFD84:
	ldr r0, _080BFDA4 @ =gUnknown_83EEC98
	subs r2, r6, 0x1
	lsls r3, r2, 2
	adds r1, r3, r0
	ldrh r1, [r1]
	adds r5, r0, 0
	cmp r1, 0xD
	bne _080BFDA8
	adds r0, r5, 0x2
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BFDA8
	strh r1, [r4, 0x4]
	movs r0, 0xC
	b _080BFDF2
	.align 2, 0
_080BFDA4: .4byte gUnknown_83EEC98
_080BFDA8:
	lsls r1, r2, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r0, 0x20
	bne _080BFDC0
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BFDC0
	movs r0, 0x5
	b _080BFDEE
_080BFDC0:
	lsls r2, 2
	adds r0, r2, r5
	ldrh r0, [r0]
	cmp r0, 0x2
	bne _080BFDEC
	adds r0, r5, 0x2
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, 0xA
	bne _080BFDEC
	movs r0, 0x4
	strh r0, [r4, 0x4]
	movs r0, 0xB
	strh r0, [r4, 0x6]
	ldr r0, _080BFDE8 @ =0x00004082
	movs r1, 0
	bl VarSet
	b _080BFDF4
	.align 2, 0
_080BFDE8: .4byte 0x00004082
_080BFDEC:
	movs r0, 0x7
_080BFDEE:
	strh r0, [r4, 0x4]
	movs r0, 0x4
_080BFDF2:
	strh r0, [r4, 0x6]
_080BFDF4:
	adds r0, r6, 0
	bl sub_80BFE00
_080BFDFA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BFCD0

	thumb_func_start sub_80BFE00
sub_80BFE00: @ 80BFE00
	ldr r2, _080BFE10 @ =gSpecialVar_LastTalked
	ldr r1, _080BFE14 @ =gUnknown_83EECE8
	subs r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080BFE10: .4byte gSpecialVar_LastTalked
_080BFE14: .4byte gUnknown_83EECE8
	thumb_func_end sub_80BFE00

	.align 2, 0 @ Don't pad with nop.
