	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start Random
Random: @ 8044EC8
	ldr r2, _08044EDC @ =gUnknown_3005000
	ldr r1, [r2]
	ldr r0, _08044EE0 @ =0x41c64e6d
	muls r0, r1
	ldr r1, _08044EE4 @ =0x00006073
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	bx lr
	.align 2, 0
_08044EDC: .4byte gUnknown_3005000
_08044EE0: .4byte 0x41c64e6d
_08044EE4: .4byte 0x00006073
	thumb_func_end Random

	thumb_func_start SeedRng
SeedRng: @ 8044EE8
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08044EF4 @ =gUnknown_3005000
	str r0, [r1]
	bx lr
	.align 2, 0
_08044EF4: .4byte gUnknown_3005000
	thumb_func_end SeedRng

	.align 2, 0 @ Don't pad with nop.
