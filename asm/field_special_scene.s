	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A0E78
sub_80A0E78: @ 80A0E78
	movs r0, 0
	bx lr
	thumb_func_end sub_80A0E78

	thumb_func_start nullsub_57
nullsub_57: @ 80A0E7C
	bx lr
	thumb_func_end nullsub_57

	thumb_func_start nullsub_58
nullsub_58: @ 80A0E80
	bx lr
	thumb_func_end nullsub_58

	thumb_func_start nullsub_59
nullsub_59: @ 80A0E84
	bx lr
	thumb_func_end nullsub_59

	thumb_func_start nullsub_60
nullsub_60: @ 80A0E88
	bx lr
	thumb_func_end nullsub_60

	thumb_func_start nullsub_61
nullsub_61: @ 80A0E8C
	bx lr
	thumb_func_end nullsub_61

	.align 2, 0 @ Don't pad with nop.
