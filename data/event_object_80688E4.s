	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83A710C::
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step
	.4byte little_step

gUnknown_83A714C::
	.4byte double_little_steps
	.4byte double_little_steps
	.4byte double_little_steps
	.4byte double_little_steps
	.4byte double_little_steps
	.4byte double_little_steps
	.4byte double_little_steps
	.4byte double_little_steps

gUnknown_83A716C::
	.4byte double_little_steps
	.4byte triple_little_steps
	.4byte triple_little_steps
	.4byte double_little_steps
	.4byte triple_little_steps
	.4byte triple_little_steps

gUnknown_83A7184::
	.4byte quad_little_steps
	.4byte quad_little_steps
	.4byte quad_little_steps
	.4byte quad_little_steps

gUnknown_83A7194::
	.4byte oct_little_steps
	.4byte oct_little_steps

gUnknown_83A719C:: @ 83A719C
	.4byte gUnknown_83A710C
	.4byte gUnknown_83A714C
	.4byte gUnknown_83A716C
	.4byte gUnknown_83A7184
	.4byte gUnknown_83A7194

gUnknown_83A71B0:: @ 83A71B0
	.2byte 0x0010, 0x0008, 0x0006, 0x0004, 0x0002

gUnknown_83A71BA::
	.byte 0xfc, 0xfa, 0xf8, 0xf6, 0xf5, 0xf4, 0xf4, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xfa, 0xfc, 0x00, 0x00

gUnknown_83A71CA::
	.byte 0x00, 0xfe, 0xfd, 0xfc, 0xfb, 0xfa, 0xfa, 0xfa, 0xfb, 0xfb, 0xfc, 0xfd, 0xfe, 0x00, 0x00, 0x00

gUnknown_83A71DA::
	.byte 0xfe, 0xfc, 0xfa, 0xf8, 0xf7, 0xf6, 0xf6, 0xf6, 0xf7, 0xf8, 0xfa, 0xfb, 0xfd, 0xfe, 0x00, 0x00

	.align 2
gUnknown_83A71EC:: @ 83A71EC
	.4byte gUnknown_83A71BA
	.4byte gUnknown_83A71CA
	.4byte gUnknown_83A71DA

	.align 1
gUnknown_83A71F8:: @ 83A71F8
	.2byte 0x10, 0x10, 0x20

gUnknown_83A71FE:: @ 83A71FE
	.byte 0, 0, 1

	.align 1
gUnknown_83A7202:: @ 83A7202
	.2byte 0x20, 0x20, 0x40

gUnknown_83A7208:: @ 83A7208
	.byte 1, 1, 2

	.align 2
gUnknown_83A720C:: @ 83A720C
	abspath "evobjmv.c"

	.align 2
gUnknown_83A7240:: @ 83A7240
	.asciz "0"
