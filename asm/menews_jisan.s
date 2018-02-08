	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8146C30
sub_8146C30: @ 8146C30
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8143D94
	adds r5, r0, 0
	movs r0, 0x3
	adds r1, r4, 0
	ands r1, r0
	ldrb r2, [r5]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	cmp r4, 0x2
	bhi _08146C56
	cmp r4, 0x1
	bcs _08146C5C
	b _08146C80
_08146C56:
	cmp r4, 0x3
	beq _08146C6E
	b _08146C80
_08146C5C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	bl __umodsi3
	adds r0, 0x10
	b _08146C7E
_08146C6E:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	bl __umodsi3
	adds r0, 0x1
_08146C7E:
	strb r0, [r5, 0x1]
_08146C80:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8146C30

	thumb_func_start sub_8146C88
sub_8146C88: @ 8146C88
	push {lr}
	bl sub_8143D94
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0, 0x1]
	ldr r0, _08146CA0 @ =0x00004028
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08146CA0: .4byte 0x00004028
	thumb_func_end sub_8146C88

	thumb_func_start sub_8146CA4
sub_8146CA4: @ 8146CA4
	push {r4,lr}
	ldr r0, _08146CE0 @ =0x00004028
	bl sub_806E454
	adds r4, r0, 0
	bl sub_8143D94
	adds r2, r0, 0
	ldr r0, [r2]
	lsls r0, 24
	lsrs r0, 29
	cmp r0, 0x4
	bls _08146CD8
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	ldr r1, _08146CE4 @ =0x01f30000
	cmp r0, r1
	bls _08146CD8
	ldrb r0, [r2]
	movs r1, 0x1F
	ands r1, r0
	strb r1, [r2]
	movs r0, 0
	strh r0, [r4]
_08146CD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146CE0: .4byte 0x00004028
_08146CE4: .4byte 0x01f30000
	thumb_func_end sub_8146CA4

	thumb_func_start sub_8146CE8
sub_8146CE8: @ 8146CE8
	push {r4-r6,lr}
	ldr r6, _08146D08 @ =gUnknown_20370D0
	bl sub_8143D94
	adds r4, r0, 0
	bl sub_806E2BC
	cmp r0, 0
	beq _08146D02
	bl sub_8143E1C
	cmp r0, 0
	bne _08146D0C
_08146D02:
	movs r0, 0
	b _08146D6E
	.align 2, 0
_08146D08: .4byte gUnknown_20370D0
_08146D0C:
	adds r0, r4, 0
	bl sub_8146E0C
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bhi _08146D6C
	lsls r0, r5, 2
	ldr r1, _08146D24 @ =_08146D28
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08146D24: .4byte _08146D28
	.align 2, 0
_08146D28:
	.4byte _08146D6C
	.4byte _08146D44
	.4byte _08146D44
	.4byte _08146D6C
	.4byte _08146D4E
	.4byte _08146D5E
	.4byte _08146D6C
_08146D44:
	adds r0, r4, 0
	bl sub_8146D74
	strh r0, [r6]
	b _08146D6C
_08146D4E:
	adds r0, r4, 0
	bl sub_8146D74
	strh r0, [r6]
	adds r0, r4, 0
	bl sub_8146DA0
	b _08146D6C
_08146D5E:
	adds r0, r4, 0
	bl sub_8146D74
	strh r0, [r6]
	adds r0, r4, 0
	bl sub_8146D94
_08146D6C:
	adds r0, r5, 0
_08146D6E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8146CE8

	thumb_func_start sub_8146D74
sub_8146D74: @ 8146D74
	push {r4,lr}
	ldrb r2, [r0]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r4, [r0, 0x1]
	adds r4, 0x84
	movs r1, 0
	strb r1, [r0, 0x1]
	bl sub_8146DD8
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8146D74

	thumb_func_start sub_8146D94
sub_8146D94: @ 8146D94
	ldrb r2, [r0]
	movs r1, 0x1D
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_8146D94

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
