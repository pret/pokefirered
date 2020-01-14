	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FD338
sub_80FD338: @ 80FD338
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	movs r7, 0
	ldr r6, _080FD374 @ =gSaveBlock1Ptr
	ldr r4, _080FD378 @ =0x00003ba8
	movs r5, 0
_080FD350:
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x4
	mov r1, r9
	movs r2, 0x7
	bl StringCompareN
	cmp r0, 0
	bne _080FD37C
	ldr r0, [r6]
	ldr r1, _080FD378 @ =0x00003ba8
	adds r0, r1
	adds r0, r5
	ldr r0, [r0]
	cmp r0, r8
	bne _080FD37C
	movs r0, 0x1
	b _080FD396
	.align 2, 0
_080FD374: .4byte gSaveBlock1Ptr
_080FD378: .4byte 0x00003ba8
_080FD37C:
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x4
	bl NameIsEmpty
	cmp r0, 0
	bne _080FD394
	adds r4, 0xC
	adds r5, 0xC
	adds r7, 0x1
	cmp r7, 0x13
	ble _080FD350
_080FD394:
	movs r0, 0
_080FD396:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD338

	.align 2, 0 @ Don't pad with nop
