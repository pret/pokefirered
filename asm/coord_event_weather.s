	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_27
nullsub_27: @ 806E7A8
	bx lr
	thumb_func_end nullsub_27

	thumb_func_start nullsub_28
nullsub_28: @ 806E7AC
	bx lr
	thumb_func_end nullsub_28

	thumb_func_start nullsub_29
nullsub_29: @ 806E7B0
	bx lr
	thumb_func_end nullsub_29

	thumb_func_start nullsub_30
nullsub_30: @ 806E7B4
	bx lr
	thumb_func_end nullsub_30

	thumb_func_start nullsub_31
nullsub_31: @ 806E7B8
	bx lr
	thumb_func_end nullsub_31

	thumb_func_start nullsub_32
nullsub_32: @ 806E7BC
	bx lr
	thumb_func_end nullsub_32

	thumb_func_start nullsub_33
nullsub_33: @ 806E7C0
	bx lr
	thumb_func_end nullsub_33

	thumb_func_start nullsub_34
nullsub_34: @ 806E7C4
	bx lr
	thumb_func_end nullsub_34

	thumb_func_start nullsub_35
nullsub_35: @ 806E7C8
	bx lr
	thumb_func_end nullsub_35

	thumb_func_start nullsub_36
nullsub_36: @ 806E7CC
	bx lr
	thumb_func_end nullsub_36

	thumb_func_start nullsub_37
nullsub_37: @ 806E7D0
	bx lr
	thumb_func_end nullsub_37

	thumb_func_start nullsub_38
nullsub_38: @ 806E7D4
	bx lr
	thumb_func_end nullsub_38

	thumb_func_start nullsub_39
nullsub_39: @ 806E7D8
	bx lr
	thumb_func_end nullsub_39

	thumb_func_start sub_806E7DC
sub_806E7DC: @ 806E7DC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	ldr r3, _0806E7FC @ =gUnknown_83A72A8
_0806E7E6:
	lsls r1, r2, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0806E800
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	bl _call_via_r0
	b _0806E80A
	.align 2, 0
_0806E7FC: .4byte gUnknown_83A72A8
_0806E800:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xC
	bls _0806E7E6
_0806E80A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806E7DC

	.align 2, 0 @ Don't pad with nop.
