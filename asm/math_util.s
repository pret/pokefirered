	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start .gcc2_compiled._3
.gcc2_compiled._3: @ 80D8AA0
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	muls r0, r1
	adds r1, r0, 0
	cmp r0, 0
	bge _080D8AB4
	adds r1, 0xFF
_080D8AB4:
	lsls r0, r1, 8
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end .gcc2_compiled._3

	thumb_func_start sub_80D8ABC
sub_80D8ABC: @ 80D8ABC
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	muls r3, r2
	movs r1, 0x1
	lsls r1, r0
	adds r0, r3, 0
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80D8ABC

	thumb_func_start sub_80D8AE0
sub_80D8AE0: @ 80D8AE0
	push {r4-r7,lr}
	adds r2, r1, 0
	adds r4, r0, 0
	asrs r5, r0, 31
	asrs r3, r2, 31
	adds r1, r5, 0
	adds r0, r4, 0
	bl __muldi3
	adds r5, r1, 0
	adds r4, r0, 0
	adds r7, r5, 0
	adds r6, r4, 0
	cmp r5, 0
	bge _080D8B06
	movs r6, 0xFF
	movs r7, 0
	adds r6, r4
	adcs r7, r5
_080D8B06:
	lsls r3, r7, 24
	lsrs r2, r6, 8
	adds r0, r3, 0
	orrs r0, r2
	asrs r1, r7, 8
	adds r5, r1, 0
	adds r4, r0, 0
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80D8AE0

	thumb_func_start sub_80D8B1C
sub_80D8B1C: @ 80D8B1C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0
	beq _080D8B38
	lsls r0, 16
	asrs r0, 8
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	b _080D8B3A
_080D8B38:
	movs r0, 0
_080D8B3A:
	pop {r1}
	bx r1
	thumb_func_end sub_80D8B1C

	thumb_func_start sub_80D8B40
sub_80D8B40: @ 80D8B40
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 16
	asrs r1, r2, 16
	cmp r1, 0
	beq _080D8B62
	lsls r0, 16
	asrs r0, 16
	lsls r0, r3
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	b _080D8B64
_080D8B62:
	movs r0, 0
_080D8B64:
	pop {r1}
	bx r1
	thumb_func_end sub_80D8B40

	thumb_func_start sub_80D8B68
sub_80D8B68: @ 80D8B68
	push {r4-r6,lr}
	adds r6, r1, 0
	cmp r6, 0
	beq _080D8B88
	adds r2, r0, 0
	asrs r3, r0, 31
	lsrs r5, r2, 24
	lsls r4, r3, 8
	adds r1, r5, 0
	orrs r1, r4
	lsls r0, r2, 8
	adds r2, r6, 0
	asrs r3, r6, 31
	bl __divdi3
	b _080D8B8A
_080D8B88:
	movs r0, 0
_080D8B8A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80D8B68

	thumb_func_start sub_80D8B90
sub_80D8B90: @ 80D8B90
	push {lr}
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 9
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80D8B90

	thumb_func_start sub_80D8BA8
sub_80D8BA8: @ 80D8BA8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	lsls r2, r0
	lsls r1, 16
	asrs r1, 16
	adds r0, r2, 0
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80D8BA8

	thumb_func_start sub_80D8BC8
sub_80D8BC8: @ 80D8BC8
	push {lr}
	adds r2, r0, 0
	ldr r1, _080D8BE0 @ =0x00000000
	ldr r0, _080D8BDC @ =0x00010000
	asrs r3, r2, 31
	bl __divdi3
	pop {r1}
	bx r1
	.align 2, 0
_080D8BDC: .4byte 0x00010000
_080D8BE0: .4byte 0x00000000
	thumb_func_end sub_80D8BC8

	.align 2, 0 @ Don't pad with nop.
