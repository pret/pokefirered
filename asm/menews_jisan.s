	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8146DA0
sub_8146DA0: @ 8146DA0
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3]
	lsls r0, 27
	lsrs r0, 29
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	lsls r0, 2
	ldrb r1, [r3]
	movs r4, 0x1D
	negs r4, r4
	adds r2, r4, 0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	ldr r0, [r3]
	lsls r0, 27
	lsrs r0, 29
	cmp r0, 0x4
	bls _08146DD2
	ands r2, r4
	movs r0, 0x10
	orrs r2, r0
	strb r2, [r3]
_08146DD2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8146DA0

	thumb_func_start sub_8146DD8
sub_8146DD8: @ 8146DD8
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3]
	lsls r0, 24
	lsrs r0, 29
	adds r0, 0x1
	lsls r0, 5
	ldrb r1, [r3]
	movs r4, 0x1F
	adds r2, r4, 0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	ldr r0, [r3]
	lsls r0, 24
	lsrs r0, 29
	cmp r0, 0x5
	bls _08146E04
	ands r2, r4
	movs r0, 0xA0
	orrs r2, r0
	strb r2, [r3]
_08146E04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8146DD8

	thumb_func_start sub_8146E0C
sub_8146E0C: @ 8146E0C
	push {lr}
	adds r2, r0, 0
	ldrb r1, [r2]
	movs r0, 0xE0
	ands r0, r1
	cmp r0, 0xA0
	bne _08146E1E
	movs r0, 0x6
	b _08146E66
_08146E1E:
	ldr r1, [r2]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r0, 0x1
	beq _08146E40
	cmp r0, 0x1
	bgt _08146E32
	cmp r0, 0
	beq _08146E3C
	b _08146E58
_08146E32:
	cmp r0, 0x2
	beq _08146E44
	cmp r0, 0x3
	beq _08146E48
	b _08146E58
_08146E3C:
	movs r0, 0x3
	b _08146E66
_08146E40:
	movs r0, 0x1
	b _08146E66
_08146E44:
	movs r0, 0x2
	b _08146E66
_08146E48:
	lsls r0, r1, 27
	lsrs r0, 29
	cmp r0, 0x2
	bhi _08146E54
	movs r0, 0x4
	b _08146E66
_08146E54:
	movs r0, 0x5
	b _08146E66
_08146E58:
	ldr r0, _08146E6C @ =gUnknown_8468C5C	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/menews_jisan.c"
	ldr r1, _08146E70 @ =0x0000017f
	ldr r2, _08146E74 @ =gUnknown_8468C94	"0"
	movs r3, 0x1
	bl AGBAssert
	movs r0, 0
_08146E66:
	pop {r1}
	bx r1
	.align 2, 0
_08146E6C: .4byte gUnknown_8468C5C
_08146E70: .4byte 0x0000017f
_08146E74: .4byte gUnknown_8468C94
	thumb_func_end sub_8146E0C

	.align 2, 0 @ Don't pad with nop.
