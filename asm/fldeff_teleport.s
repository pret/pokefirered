	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F66F0
sub_80F66F0: @ 80F66F0
	push {lr}
	ldr r0, _080F6708 @ =gUnknown_2036DFC
	ldrb r0, [r0, 0x17]
	bl sub_80561FC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080F670C
	movs r0, 0
	b _080F671A
	.align 2, 0
_080F6708: .4byte gUnknown_2036DFC
_080F670C:
	ldr r1, _080F6720 @ =gUnknown_3005024
	ldr r0, _080F6724 @ =sub_81248B0
	str r0, [r1]
	ldr r1, _080F6728 @ =gUnknown_203B0C4
	ldr r0, _080F672C @ =sub_80F6730
	str r0, [r1]
	movs r0, 0x1
_080F671A:
	pop {r1}
	bx r1
	.align 2, 0
_080F6720: .4byte gUnknown_3005024
_080F6724: .4byte sub_81248B0
_080F6728: .4byte gUnknown_203B0C4
_080F672C: .4byte sub_80F6730
	thumb_func_end sub_80F66F0

	thumb_func_start sub_80F6730
sub_80F6730: @ 80F6730
	push {lr}
	bl sub_8054D08
	movs r0, 0x3F
	bl sub_8083444
	bl sub_811FB0C
	ldr r1, _080F674C @ =gUnknown_20386E0
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F674C: .4byte gUnknown_20386E0
	thumb_func_end sub_80F6730

	thumb_func_start sub_80F6750
sub_80F6750: @ 80F6750
	push {lr}
	bl sub_80C97FC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F6778 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080F677C @ =sub_80F6780
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x1
	bl sub_805BDEC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080F6778: .4byte gUnknown_3005090
_080F677C: .4byte sub_80F6780
	thumb_func_end sub_80F6750

	thumb_func_start sub_80F6780
sub_80F6780: @ 80F6780
	push {lr}
	movs r0, 0x3F
	bl sub_80837FC
	bl sub_8085B64
	pop {r0}
	bx r0
	thumb_func_end sub_80F6780

	.align 2, 0 @ Don't pad with nop.
