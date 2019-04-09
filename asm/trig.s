	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start Sin
Sin: @ 8044E30
	lsls r1, 16
	asrs r1, 16
	ldr r2, _08044E48 @ =gSineTable
	lsls r0, 16
	asrs r0, 15
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	lsls r0, 8
	asrs r0, 16
	bx lr
	.align 2, 0
_08044E48: .4byte gSineTable
	thumb_func_end Sin

	thumb_func_start Cos
Cos: @ 8044E4C
	lsls r1, 16
	asrs r1, 16
	ldr r2, _08044E68 @ =gSineTable
	lsls r0, 16
	asrs r0, 15
	adds r0, 0x80
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	lsls r0, 8
	asrs r0, 16
	bx lr
	.align 2, 0
_08044E68: .4byte gSineTable
	thumb_func_end Cos

	thumb_func_start Sin2
Sin2: @ 8044E6C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r5, 0
	movs r1, 0xB4
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0xB4
	bl __udivsi3
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08044EA0 @ =gUnknown_825E2F4
	lsls r4, 1
	adds r4, r1
	ldrh r1, [r4]
	cmp r0, 0
	bne _08044EA4
	lsls r0, r1, 16
	b _08044EA8
	.align 2, 0
_08044EA0: .4byte gUnknown_825E2F4
_08044EA4:
	lsls r0, r1, 16
	negs r0, r0
_08044EA8:
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end Sin2

	thumb_func_start Cos2
Cos2: @ 8044EB0
	push {lr}
	lsls r0, 16
	movs r1, 0xB4
	lsls r1, 15
	adds r0, r1
	lsrs r0, 16
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end Cos2

	.align 2, 0 @ Don't pad with nop.
