	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80797AC
sub_80797AC: @ 80797AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	mov r8, r2
	adds r7, r3, 0
	ldr r0, [sp, 0x18]
	cmp r0, 0
	beq _080797C8
	ldr r0, _080797C4 @ =gUnknown_83BFB04
	b _080797CA
	.align 2, 0
_080797C4: .4byte gUnknown_83BFB04
_080797C8:
	ldr r0, _08079828 @ =gUnknown_83BFB1C
_080797CA:
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r5, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08079834
	ldr r0, _0807982C @ =gSprites
	mov r12, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r6, r0, 2
	mov r1, r12
	adds r2, r6, r1
	lsls r0, r4, 4
	movs r1, 0
	strh r0, [r2, 0x2E]
	mov r0, r8
	strh r0, [r2, 0x30]
	lsls r0, r5, 4
	strh r0, [r2, 0x32]
	strh r7, [r2, 0x34]
	strh r1, [r2, 0x36]
	mov r3, r8
	muls r3, r7
	adds r0, r3, 0
	cmp r3, 0
	bge _0807980C
	adds r0, 0xF
_0807980C:
	asrs r0, 4
	lsls r0, 4
	subs r0, r3, r0
	strh r0, [r2, 0x38]
	mov r1, sp
	ldrh r1, [r1, 0x18]
	strh r1, [r2, 0x3A]
	mov r0, r12
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _08079830 @ =sub_8079730
	str r1, [r0]
	movs r0, 0x1
	b _08079836
	.align 2, 0
_08079828: .4byte gUnknown_83BFB1C
_0807982C: .4byte gSprites
_08079830: .4byte sub_8079730
_08079834:
	movs r0, 0
_08079836:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80797AC

	thumb_func_start sub_8079840
sub_8079840: @ 8079840
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08079868 @ =gTasks+0x8
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _0807986C
	cmp r0, 0x1
	beq _08079884
	b _0807998A
	.align 2, 0
_08079868: .4byte gTasks+0x8
_0807986C:
	ldr r2, _08079880 @ =0x00007878
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_807999C
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _0807998A
	.align 2, 0
_08079880: .4byte 0x00007878
_08079884:
	ldrh r0, [r6, 0x2]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x4
	ldrsh r1, [r6, r2]
	cmp r0, r1
	blt _0807998A
	movs r0, 0
	strh r0, [r6, 0x2]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	movs r0, 0x12
	strh r0, [r6, 0x4]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	subs r1, 0x2
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	adds r7, r1, 0
	subs r7, 0x10
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x74
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	movs r2, 0
	lsls r0, 16
	movs r1, 0xF0
	lsls r1, 12
	ands r1, r0
	lsrs r1, 16
	cmp r1, 0x7
	bls _0807991C
	movs r2, 0x1
_0807991C:
	str r2, [sp]
	adds r0, r4, 0
	mov r1, r9
	mov r2, r8
	adds r3, r7, 0
	bl sub_80797AC
	movs r4, 0
_0807992C:
	ldr r1, _08079998 @ =gUnknown_83BFBD4
	adds r1, r4, r1
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	ldrb r1, [r1]
	adds r0, r1
	movs r1, 0x1
	str r1, [sp]
	mov r1, r9
	mov r2, r8
	adds r3, r7, 0
	bl sub_80797AC
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	subs r1, 0x2
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	adds r7, r1, 0
	subs r7, 0x10
	adds r4, 0x1
	cmp r4, 0xE
	ble _0807992C
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0807998A
	movs r0, 0
	strh r0, [r6, 0xA]
_0807998A:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079998: .4byte gUnknown_83BFBD4
	thumb_func_end sub_8079840

	thumb_func_start sub_807999C
sub_807999C: @ 807999C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	bl SetWordTaskArg
	pop {r0}
	bx r0
	thumb_func_end sub_807999C

	thumb_func_start sub_80799B4
sub_80799B4: @ 80799B4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetWordTaskArg
	adds r6, r0, 0
	ldr r0, _080799E8 @ =0x41c64e6d
	muls r0, r6
	ldr r1, _080799EC @ =0x00006073
	adds r6, r0, r1
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl SetWordTaskArg
	lsrs r0, r6, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080799E8: .4byte 0x41c64e6d
_080799EC: .4byte 0x00006073
	thumb_func_end sub_80799B4

	thumb_func_start sub_80799F0
sub_80799F0: @ 80799F0
	push {lr}
	ldr r0, _08079A0C @ =gUnknown_83BFB3C
	movs r1, 0x18
	movs r2, 0x90
	movs r3, 0
	bl CreateSprite
	movs r0, 0x2
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08079A0C: .4byte gUnknown_83BFB3C
	thumb_func_end sub_80799F0

	thumb_func_start sub_8079A10
sub_8079A10: @ 8079A10
	push {lr}
	cmp r0, 0
	beq _08079A38
	movs r0, 0x2
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	ldr r0, _08079A34 @ =gUnknown_8EAE488
	lsrs r1, 4
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	b _08079A3C
	.align 2, 0
_08079A34: .4byte gUnknown_8EAE488
_08079A38:
	bl sub_80799F0
_08079A3C:
	pop {r0}
	bx r0
	thumb_func_end sub_8079A10

	thumb_func_start sub_8079A40
sub_8079A40: @ 8079A40
	push {r4,lr}
	ldr r0, _08079A7C @ =gUnknown_83BFB5C
	movs r1, 0x20
	negs r1, r1
	movs r2, 0x1B
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r4, r1, 0
	cmp r1, 0x40
	beq _08079A74
	ldr r3, _08079A80 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _08079A84 @ =sub_8079AD8
	str r2, [r1]
	adds r0, r3
	movs r1, 0x87
	lsls r1, 2
	strh r1, [r0, 0x30]
_08079A74:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079A7C: .4byte gUnknown_83BFB5C
_08079A80: .4byte gSprites
_08079A84: .4byte sub_8079AD8
	thumb_func_end sub_8079A40

	thumb_func_start sub_8079A88
sub_8079A88: @ 8079A88
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08079AA0
	ldr r0, _08079AA4 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x32]
_08079AA0:
	pop {r0}
	bx r0
	.align 2, 0
_08079AA4: .4byte gSprites
	thumb_func_end sub_8079A88

	thumb_func_start sub_8079AA8
sub_8079AA8: @ 8079AA8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	bne _08079AB6
	movs r0, 0
	b _08079ACE
_08079AB6:
	ldr r1, _08079AD4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	movs r0, 0x2
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_08079ACE:
	pop {r1}
	bx r1
	.align 2, 0
_08079AD4: .4byte gSprites
	thumb_func_end sub_8079AA8

	thumb_func_start sub_8079AD8
sub_8079AD8: @ 8079AD8
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _08079B24
	cmp r0, 0x1
	bgt _08079B74
	cmp r0, 0
	bne _08079B74
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08079B04
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x2
	strh r0, [r2, 0x2E]
_08079B04:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08079B74
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	movs r0, 0x1
	strh r0, [r2, 0x2E]
	b _08079B74
_08079B24:
	ldrh r0, [r2, 0x20]
	adds r0, 0x9
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x43
	bne _08079B38
	ldrh r0, [r2, 0x22]
	subs r0, 0x7
	strh r0, [r2, 0x22]
_08079B38:
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	cmp r1, 0x94
	bne _08079B46
	ldrh r0, [r2, 0x22]
	adds r0, 0x7
	strh r0, [r2, 0x22]
_08079B46:
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	ble _08079B74
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x32
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08079B68
	movs r0, 0x2
	strh r0, [r2, 0x2E]
	b _08079B74
_08079B68:
	ldr r0, _08079B78 @ =0x0000ffe0
	strh r0, [r2, 0x20]
	movs r0, 0x87
	lsls r0, 2
	strh r0, [r2, 0x30]
	strh r1, [r2, 0x2E]
_08079B74:
	pop {r0}
	bx r0
	.align 2, 0
_08079B78: .4byte 0x0000ffe0
	thumb_func_end sub_8079AD8

	.align 2, 0 @ Don't pad with nop.
