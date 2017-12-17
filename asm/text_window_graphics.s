	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8069788
sub_8069788: @ 8069788
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080697A0
	lsls r0, 3
	ldr r1, _0806979C @ =gUnknown_8471E8C
	adds r0, r1
	b _080697A2
	.align 2, 0
_0806979C: .4byte gUnknown_8471E8C
_080697A0:
	ldr r0, _080697A8 @ =gUnknown_8471E8C
_080697A2:
	pop {r1}
	bx r1
	.align 2, 0
_080697A8: .4byte gUnknown_8471E8C
	thumb_func_end sub_8069788

	.align 2, 0 @ Don't pad with nop.
