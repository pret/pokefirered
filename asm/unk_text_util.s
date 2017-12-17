	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start UnkTextUtil_Reset
UnkTextUtil_Reset: @ 813CC90
	push {lr}
	ldr r1, _0813CCA8 @ =gUnknown_203F34C
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0x1C
_0813CC9A:
	str r2, [r0]
	subs r0, 0x4
	cmp r0, r1
	bge _0813CC9A
	pop {r0}
	bx r0
	.align 2, 0
_0813CCA8: .4byte gUnknown_203F34C
	thumb_func_end UnkTextUtil_Reset

	thumb_func_start UnkTextUtil_SetPtrI
UnkTextUtil_SetPtrI: @ 813CCAC
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bhi _0813CCC0
	ldr r1, _0813CCC4 @ =gUnknown_203F34C
	lsls r0, 2
	adds r0, r1
	str r2, [r0]
_0813CCC0:
	pop {r0}
	bx r0
	.align 2, 0
_0813CCC4: .4byte gUnknown_203F34C
	thumb_func_end UnkTextUtil_SetPtrI

	thumb_func_start UnkTextUtil_StringExpandPlaceholders
UnkTextUtil_StringExpandPlaceholders: @ 813CCC8
	push {r4,r5,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _0813CD08
	ldr r5, _0813CCE4 @ =gUnknown_203F34C
_0813CCD8:
	cmp r1, 0xF7
	beq _0813CCE8
	strb r1, [r2]
	adds r4, 0x1
	adds r2, 0x1
	b _0813CD00
	.align 2, 0
_0813CCE4: .4byte gUnknown_203F34C
_0813CCE8:
	adds r4, 0x1
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	cmp r1, 0
	beq _0813CCFE
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
_0813CCFE:
	adds r4, 0x1
_0813CD00:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _0813CCD8
_0813CD08:
	movs r0, 0xFF
	strb r0, [r2]
	adds r0, r2, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end UnkTextUtil_StringExpandPlaceholders

	thumb_func_start UnkTextUtil_GetPtrI
UnkTextUtil_GetPtrI: @ 813CD14
	lsls r0, 24
	ldr r1, _0813CD20 @ =gUnknown_203F34C
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0813CD20: .4byte gUnknown_203F34C
	thumb_func_end UnkTextUtil_GetPtrI

	thumb_func_start sub_813CD24
sub_813CD24: @ 813CD24
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	lsrs r2, r0, 17
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	cmp r2, 0x4B
	bhi _0813CD48
	ldr r0, _0813CD44 @ =gUnknown_8464300
	adds r0, r2, r0
	ldrb r0, [r0]
	asrs r0, r1
	movs r1, 0xF
	ands r0, r1
	b _0813CD4A
	.align 2, 0
_0813CD44: .4byte gUnknown_8464300
_0813CD48:
	movs r0, 0x3
_0813CD4A:
	pop {r1}
	bx r1
	thumb_func_end sub_813CD24

	.align 2, 0 @ Don't pad with nop.
