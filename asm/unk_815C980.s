	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815C980
sub_815C980: @ 815C980
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _0815C9A0 @ =gUnknown_203F454
	ldr r0, [r5]
	cmp r0, 0
	beq _0815C990
	bl sub_815C9F4
_0815C990:
	movs r0, 0x8
	bl Alloc
	str r0, [r5]
	cmp r0, 0
	bne _0815C9A4
	movs r0, 0
	b _0815C9EC
	.align 2, 0
_0815C9A0: .4byte gUnknown_203F454
_0815C9A4:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	bl Alloc
	ldr r1, [r5]
	str r0, [r1, 0x4]
	cmp r0, 0
	bne _0815C9C0
	adds r0, r1, 0
	bl Free
	movs r0, 0
	b _0815C9EC
_0815C9C0:
	str r4, [r1]
	movs r3, 0
	cmp r3, r4
	bcs _0815C9EA
	movs r7, 0
	movs r6, 0xFF
	movs r2, 0
_0815C9CE:
	ldr r0, [r5]
	ldr r0, [r0, 0x4]
	adds r0, r2, r0
	strb r7, [r0]
	ldr r0, [r5]
	ldr r1, [r0, 0x4]
	adds r1, r2, r1
	ldrb r0, [r1, 0x1]
	orrs r0, r6
	strb r0, [r1, 0x1]
	adds r2, 0x1C
	adds r3, 0x1
	cmp r3, r4
	bcc _0815C9CE
_0815C9EA:
	movs r0, 0x1
_0815C9EC:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_815C980

	thumb_func_start sub_815C9F4
sub_815C9F4: @ 815C9F4
	push {r4,r5,lr}
	ldr r2, _0815CA3C @ =gUnknown_203F454
	ldr r1, [r2]
	cmp r1, 0
	beq _0815CA34
	ldr r0, [r1, 0x4]
	cmp r0, 0
	beq _0815CA28
	movs r4, 0
	ldr r0, [r1]
	cmp r4, r0
	bcs _0815CA1E
	adds r5, r2, 0
_0815CA0E:
	adds r0, r4, 0
	bl sub_815D108
	adds r4, 0x1
	ldr r0, [r5]
	ldr r0, [r0]
	cmp r4, r0
	bcc _0815CA0E
_0815CA1E:
	ldr r0, _0815CA3C @ =gUnknown_203F454
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	bl Free
_0815CA28:
	ldr r4, _0815CA3C @ =gUnknown_203F454
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_0815CA34:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815CA3C: .4byte gUnknown_203F454
	thumb_func_end sub_815C9F4

	thumb_func_start sub_815CA40
sub_815CA40: @ 815CA40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r8, r0
	mov r10, r1
	adds r5, r2, 0
	ldr r6, _0815CAB8 @ =gUnknown_203F454
	ldr r0, [r6]
	cmp r0, 0
	beq _0815CB00
	ldr r1, [r0, 0x4]
	mov r0, r8
	lsls r2, r0, 3
	subs r0, r2, r0
	lsls r4, r0, 2
	adds r1, r4, r1
	ldrb r0, [r1]
	mov r9, r2
	cmp r0, 0
	bne _0815CB00
	ldrb r0, [r5, 0x1]
	bl sub_815D244
	ldr r1, [r6]
	ldr r1, [r1, 0x4]
	adds r1, r4, r1
	strb r0, [r1, 0x1]
	ldr r0, [r6]
	ldr r0, [r0, 0x4]
	adds r0, r4, r0
	ldrb r0, [r0, 0x1]
	cmp r0, 0xFF
	beq _0815CB00
	ldr r0, [r5, 0x8]
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	ldr r2, [r6]
	ldr r1, [r2, 0x4]
	adds r1, r4, r1
	strh r0, [r1, 0xA]
	ldr r0, [r2, 0x4]
	adds r0, r4, r0
	ldrh r1, [r0, 0xA]
	ldr r7, _0815CABC @ =0xffff0000
	lsrs r0, r7, 16
	cmp r1, r0
	bne _0815CB0C
	ldr r2, [r5, 0x8]
	ldrh r0, [r2, 0x4]
	adds r1, r2, 0
	cmp r0, 0
	beq _0815CAC0
	adds r0, r1, 0
	bl LoadSpriteSheet
	b _0815CAE0
	.align 2, 0
_0815CAB8: .4byte gUnknown_203F454
_0815CABC: .4byte 0xffff0000
_0815CAC0:
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, [r2]
	bl sub_800F0C4
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp, 0x4]
	ands r1, r7
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadCompressedObjectPic
_0815CAE0:
	ldr r1, [r6]
	ldr r1, [r1, 0x4]
	adds r1, r4, r1
	strh r0, [r1, 0xA]
	ldr r0, _0815CB04 @ =gUnknown_203F454
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	mov r2, r9
	mov r3, r8
	subs r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0xA]
	ldr r0, _0815CB08 @ =0x0000ffff
	cmp r1, r0
	bne _0815CB0C
_0815CB00:
	movs r0, 0
	b _0815CC14
	.align 2, 0
_0815CB04: .4byte gUnknown_203F454
_0815CB08: .4byte 0x0000ffff
_0815CB0C:
	ldr r0, [r5, 0xC]
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	ldr r6, _0815CC24 @ =gUnknown_203F454
	ldr r1, [r6]
	ldr r1, [r1, 0x4]
	mov r4, r9
	mov r3, r8
	subs r2, r4, r3
	lsls r4, r2, 2
	adds r1, r4, r1
	strb r0, [r1, 0x4]
	ldr r0, [r6]
	ldr r0, [r0, 0x4]
	adds r0, r4, r0
	ldrb r0, [r0, 0x4]
	cmp r0, 0xFF
	bne _0815CB40
	ldr r0, [r5, 0xC]
	bl LoadSpritePalette
	ldr r1, [r6]
	ldr r1, [r1, 0x4]
	adds r1, r4, r1
	strb r0, [r1, 0x4]
_0815CB40:
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	adds r1, r4, r1
	ldrb r0, [r5]
	lsls r0, 30
	lsrs r0, 30
	strb r0, [r1, 0x2]
	ldr r0, [r6]
	ldr r0, [r0, 0x4]
	adds r0, r4, r0
	ldrb r1, [r5, 0x1]
	strb r1, [r0, 0x3]
	ldr r2, [r6]
	ldr r0, [r2, 0x4]
	adds r0, r4, r0
	ldrh r1, [r5, 0x4]
	strh r1, [r0, 0xC]
	ldr r0, [r2, 0x4]
	adds r0, r4, r0
	ldrh r1, [r5, 0x6]
	strh r1, [r0, 0xE]
	ldr r1, [r2, 0x4]
	adds r1, r4, r1
	ldrb r0, [r5]
	lsls r0, 28
	lsrs r0, 30
	strb r0, [r1, 0x6]
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	adds r1, r4, r1
	ldrb r0, [r5]
	lsls r0, 26
	lsrs r0, 30
	strb r0, [r1, 0x5]
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	adds r1, r4, r1
	ldrb r0, [r5]
	lsrs r0, 6
	strb r0, [r1, 0x7]
	ldr r0, [r6]
	ldr r0, [r0, 0x4]
	adds r0, r4, r0
	ldrb r1, [r5, 0x2]
	strb r1, [r0, 0x8]
	ldrb r1, [r5]
	lsls r0, r1, 28
	lsrs r0, 30
	lsls r1, 26
	lsrs r1, 30
	bl sub_815D324
	ldr r1, [r6]
	ldr r1, [r1, 0x4]
	adds r1, r4, r1
	strb r0, [r1, 0x9]
	ldr r2, [r6]
	ldr r0, [r2, 0x4]
	adds r0, r4, r0
	ldr r1, [r5, 0x8]
	ldrh r1, [r1, 0x6]
	strh r1, [r0, 0x10]
	ldr r0, [r2, 0x4]
	adds r0, r4, r0
	ldr r1, [r5, 0xC]
	ldrh r1, [r1, 0x4]
	strh r1, [r0, 0x12]
	ldr r0, [r2, 0x4]
	adds r0, r4, r0
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r6]
	ldr r0, [r0, 0x4]
	adds r0, r4, r0
	str r1, [r0, 0x14]
	movs r3, 0x1
	ldrb r0, [r5, 0x1]
	cmp r3, r0
	bcs _0815CBF6
_0815CBDE:
	ldr r0, [r6]
	ldr r2, [r0, 0x4]
	adds r2, r4, r2
	ldr r1, [r2, 0x14]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	str r0, [r2, 0x14]
	adds r3, 0x1
	ldrb r2, [r5, 0x1]
	cmp r3, r2
	bcc _0815CBDE
_0815CBF6:
	ldr r0, _0815CC24 @ =gUnknown_203F454
	ldr r0, [r0]
	mov r3, r9
	mov r4, r8
	subs r1, r3, r4
	lsls r1, 2
	ldr r0, [r0, 0x4]
	adds r0, r1
	bl sub_815CC28
	mov r0, r8
	mov r1, r10
	bl sub_815CD70
	movs r0, 0x1
_0815CC14:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0815CC24: .4byte gUnknown_203F454
	thumb_func_end sub_815CA40

	thumb_func_start sub_815CC28
sub_815CC28: @ 815CC28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	ldrb r5, [r4, 0x1]
	movs r0, 0xC
	ldrsh r7, [r4, r0]
	ldrb r0, [r4, 0x3]
	adds r0, 0x1
	mov r8, r0
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	lsls r1, r5, 3
	ldr r2, _0815CD58 @ =gMain + 0x38
	mov r9, r2
	add r1, r9
	mov r0, r8
	lsls r2, r0, 2
	movs r0, 0x80
	lsls r0, 17
	orrs r2, r0
	mov r0, sp
	bl CpuSet
	movs r6, 0
	ldrb r5, [r4, 0x1]
	cmp r6, r8
	bcs _0815CCFA
	movs r1, 0x3F
	mov r10, r1
	movs r2, 0xD
	negs r2, r2
	mov r9, r2
_0815CC72:
	lsls r0, r5, 3
	ldr r1, _0815CD5C @ =gMain
	adds r3, r0, r1
	ldrh r1, [r4, 0xE]
	adds r0, r3, 0
	adds r0, 0x38
	strb r1, [r0]
	ldr r2, _0815CD60 @ =0x000001ff
	adds r0, r2, 0
	adds r1, r7, 0
	ands r1, r0
	ldrh r2, [r3, 0x3A]
	ldr r0, _0815CD64 @ =0xfffffe00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x3A]
	ldrb r1, [r4, 0x6]
	movs r0, 0x39
	adds r0, r3
	mov r12, r0
	lsls r1, 6
	ldrb r2, [r0]
	mov r0, r10
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrb r1, [r4, 0x5]
	movs r2, 0x3B
	adds r2, r3
	mov r12, r2
	lsls r1, 6
	ldrb r2, [r2]
	mov r0, r10
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r4, 0xA]
	ldr r1, _0815CD68 @ =0x000003ff
	ands r1, r0
	ldrh r2, [r3, 0x3C]
	ldr r0, _0815CD6C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x3C]
	adds r3, 0x3D
	movs r0, 0x3
	ldrb r1, [r4, 0x7]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrb r2, [r4, 0x4]
	lsls r2, 4
	movs r1, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	ldrb r0, [r4, 0x8]
	adds r7, r0
	adds r6, 0x1
	adds r5, 0x1
	cmp r6, r8
	bcc _0815CC72
_0815CCFA:
	subs r5, 0x1
	ldr r0, _0815CD5C @ =gMain
	lsls r3, r5, 3
	adds r3, r0
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	ldrb r0, [r4, 0x8]
	subs r1, r0
	ldr r2, _0815CD60 @ =0x000001ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x3A]
	ldr r0, _0815CD64 @ =0xfffffe00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x3A]
	adds r2, r3, 0
	adds r2, 0x39
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4, 0x9]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	ldrh r4, [r4, 0xA]
	adds r1, r4
	ldr r2, _0815CD68 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x3C]
	ldr r0, _0815CD6C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x3C]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815CD58: .4byte gMain + 0x38
_0815CD5C: .4byte gMain
_0815CD60: .4byte 0x000001ff
_0815CD64: .4byte 0xfffffe00
_0815CD68: .4byte 0x000003ff
_0815CD6C: .4byte 0xfffffc00
	thumb_func_end sub_815CC28

	thumb_func_start sub_815CD70
sub_815CD70: @ 815CD70
	push {r4-r6,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldr r0, _0815CDA0 @ =gUnknown_203F454
	ldr r1, [r0]
	adds r6, r0, 0
	cmp r1, 0
	beq _0815CDD4
	ldr r2, [r1, 0x4]
	lsls r1, r3, 3
	subs r0, r1, r3
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2]
	adds r5, r1, 0
	cmp r0, 0
	beq _0815CDD4
	str r4, [r2, 0x18]
	cmp r4, 0
	bge _0815CDA4
	movs r2, 0x1
	negs r4, r4
	b _0815CDA6
	.align 2, 0
_0815CDA0: .4byte gUnknown_203F454
_0815CDA4:
	movs r2, 0
_0815CDA6:
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	subs r0, r5, r3
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x2]
	cmp r3, 0x1
	beq _0815CDC6
	cmp r3, 0x1
	ble _0815CDBE
	cmp r3, 0x2
	beq _0815CDCE
_0815CDBE:
	adds r1, r4, 0
	bl sub_815CDDC
	b _0815CDD4
_0815CDC6:
	adds r1, r4, 0
	bl sub_815CE90
	b _0815CDD4
_0815CDCE:
	adds r1, r4, 0
	bl sub_815CFEC
_0815CDD4:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_815CD70

	thumb_func_start sub_815CDDC
sub_815CDDC: @ 815CDDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	mov r9, r1
	str r2, [sp]
	ldr r5, [r0, 0x14]
	ldrb r7, [r0, 0x1]
	ldr r0, _0815CE60 @ =gMain
	mov r10, r0
	cmp r5, 0
	beq _0815CE46
	lsls r0, r7, 3
	adds r0, 0x3C
	mov r1, r10
	adds r6, r0, r1
_0815CE02:
	mov r0, r9
	adds r1, r5, 0
	bl __udivsi3
	adds r4, r0, 0
	adds r0, r4, 0
	muls r0, r5
	mov r2, r9
	subs r2, r0
	mov r9, r2
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r5, r0, 0
	mov r1, r8
	ldrb r0, [r1, 0x9]
	adds r1, r4, 0
	muls r1, r0
	mov r2, r8
	ldrh r2, [r2, 0xA]
	adds r1, r2
	ldr r2, _0815CE64 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r0, [r6]
	ldr r2, _0815CE68 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r6]
	adds r6, 0x8
	adds r7, 0x1
	cmp r5, 0
	bne _0815CE02
_0815CE46:
	ldr r0, [sp]
	cmp r0, 0
	beq _0815CE6C
	lsls r0, r7, 3
	add r0, r10
	adds r0, 0x39
	ldrb r2, [r0]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	b _0815CE80
	.align 2, 0
_0815CE60: .4byte gMain
_0815CE64: .4byte 0x000003ff
_0815CE68: .4byte 0xfffffc00
_0815CE6C:
	lsls r2, r7, 3
	add r2, r10
	adds r2, 0x39
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
_0815CE80:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_815CDDC

	thumb_func_start sub_815CE90
sub_815CE90: @ 815CE90
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r0, 0
	mov r8, r1
	str r2, [sp]
	ldr r5, [r6, 0x14]
	ldr r3, _0815CF38 @ =gUnknown_3002078
	ldrb r0, [r6, 0x1]
	str r0, [r3]
	ldr r2, _0815CF3C @ =gUnknown_300207C
	movs r0, 0
	str r0, [r2]
	ldr r1, _0815CF40 @ =gUnknown_3002080
	subs r0, 0x1
	str r0, [r1]
	adds r7, r3, 0
	mov r10, r1
	ldr r0, _0815CF44 @ =gMain
	mov r9, r0
	cmp r5, 0
	beq _0815CF78
_0815CEC2:
	mov r0, r8
	adds r1, r5, 0
	bl __udivsi3
	adds r4, r0, 0
	adds r0, r4, 0
	muls r0, r5
	mov r1, r8
	subs r1, r0
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r5, r0, 0
	cmp r4, 0
	bne _0815CEF4
	mov r2, r10
	ldr r1, [r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0815CEF4
	cmp r5, 0
	bne _0815CF50
_0815CEF4:
	ldr r2, [r7]
	lsls r2, 3
	add r2, r9
	ldrb r0, [r6, 0x9]
	adds r3, r4, 0
	muls r3, r0
	ldrh r4, [r6, 0xA]
	adds r3, r4
	ldr r1, _0815CF48 @ =0x000003ff
	adds r0, r1, 0
	ands r3, r0
	ldrh r0, [r2, 0x3C]
	ldr r4, _0815CF4C @ =0xfffffc00
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r3
	strh r0, [r2, 0x3C]
	adds r2, 0x39
	ldrb r0, [r2]
	movs r1, 0x4
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	mov r2, r10
	ldr r1, [r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0815CF66
	ldr r4, _0815CF3C @ =gUnknown_300207C
	ldr r0, [r4]
	str r0, [r2]
	b _0815CF66
	.align 2, 0
_0815CF38: .4byte gUnknown_3002078
_0815CF3C: .4byte gUnknown_300207C
_0815CF40: .4byte gUnknown_3002080
_0815CF44: .4byte gMain
_0815CF48: .4byte 0x000003ff
_0815CF4C: .4byte 0xfffffc00
_0815CF50:
	ldr r0, [r7]
	lsls r0, 3
	add r0, r9
	adds r0, 0x39
	ldrb r1, [r0]
	movs r2, 0x4
	negs r2, r2
	ands r1, r2
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_0815CF66:
	ldr r0, [r7]
	adds r0, 0x1
	str r0, [r7]
	ldr r4, _0815CFB8 @ =gUnknown_300207C
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	cmp r5, 0
	bne _0815CEC2
_0815CF78:
	ldr r0, [sp]
	cmp r0, 0
	beq _0815CFC4
	ldr r1, [r7]
	lsls r1, 3
	add r1, r9
	adds r1, 0x39
	ldrb r2, [r1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r3, [r7]
	lsls r3, 3
	add r3, r9
	movs r1, 0xC
	ldrsh r2, [r6, r1]
	mov r4, r10
	ldr r0, [r4]
	subs r0, 0x1
	ldrb r1, [r6, 0x8]
	muls r0, r1
	adds r2, r0
	ldr r1, _0815CFBC @ =0x000001ff
	adds r0, r1, 0
	ands r2, r0
	ldrh r1, [r3, 0x3A]
	ldr r0, _0815CFC0 @ =0xfffffe00
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, 0x3A]
	b _0815CFDA
	.align 2, 0
_0815CFB8: .4byte gUnknown_300207C
_0815CFBC: .4byte 0x000001ff
_0815CFC0: .4byte 0xfffffe00
_0815CFC4:
	ldr r0, [r7]
	lsls r0, 3
	add r0, r9
	adds r0, 0x39
	ldrb r2, [r0]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_0815CFDA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_815CE90

	thumb_func_start sub_815CFEC
sub_815CFEC: @ 815CFEC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r8, r0
	mov r10, r1
	str r2, [sp]
	ldr r5, [r0, 0x14]
	ldrb r3, [r0, 0x1]
	movs r0, 0
	str r0, [sp, 0x4]
	mov r9, r0
	cmp r5, 0
	beq _0815D086
_0815D00C:
	lsls r0, r3, 3
	adds r1, r0, 0
	adds r1, 0x39
	ldr r2, _0815D0D0 @ =gMain
	adds r7, r1, r2
	adds r0, 0x3C
	adds r6, r0, r2
_0815D01A:
	mov r0, r10
	adds r1, r5, 0
	str r3, [sp, 0x8]
	bl __udivsi3
	adds r4, r0, 0
	adds r0, r4, 0
	muls r0, r5
	mov r1, r10
	subs r1, r0
	mov r10, r1
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r5, r0, 0
	ldr r3, [sp, 0x8]
	cmp r4, 0
	bne _0815D04A
	ldr r2, [sp, 0x4]
	cmp r2, 0
	bne _0815D04A
	cmp r5, 0
	bne _0815D00C
_0815D04A:
	movs r0, 0x1
	str r0, [sp, 0x4]
	mov r1, r8
	ldrb r0, [r1, 0x9]
	adds r2, r4, 0
	muls r2, r0
	ldrh r4, [r1, 0xA]
	adds r2, r4
	ldr r1, _0815D0D4 @ =0x000003ff
	adds r0, r1, 0
	ands r2, r0
	ldrh r0, [r6]
	ldr r4, _0815D0D8 @ =0xfffffc00
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strh r0, [r6]
	ldrb r0, [r7]
	movs r2, 0x4
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r7]
	adds r7, 0x8
	adds r6, 0x8
	adds r3, 0x1
	movs r4, 0x1
	add r9, r4
	cmp r5, 0
	bne _0815D01A
_0815D086:
	mov r0, r8
	ldrb r0, [r0, 0x3]
	cmp r9, r0
	bge _0815D0B6
	ldr r1, _0815D0D0 @ =gMain
	movs r5, 0x4
	negs r5, r5
	movs r4, 0x2
	lsls r0, r3, 3
	adds r0, 0x39
	adds r2, r0, r1
_0815D09C:
	ldrb r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
	adds r2, 0x8
	adds r3, 0x1
	movs r1, 0x1
	add r9, r1
	mov r0, r8
	ldrb r0, [r0, 0x3]
	cmp r9, r0
	blt _0815D09C
_0815D0B6:
	ldr r1, [sp]
	cmp r1, 0
	beq _0815D0DC
	lsls r0, r3, 3
	ldr r2, _0815D0D0 @ =gMain
	adds r0, r2
	adds r0, 0x39
	ldrb r2, [r0]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	b _0815D0F2
	.align 2, 0
_0815D0D0: .4byte gMain
_0815D0D4: .4byte 0x000003ff
_0815D0D8: .4byte 0xfffffc00
_0815D0DC:
	lsls r2, r3, 3
	ldr r4, _0815D104 @ =gMain
	adds r2, r4
	adds r2, 0x39
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
_0815D0F2:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815D104: .4byte gMain
	thumb_func_end sub_815CFEC

	thumb_func_start sub_815D108
sub_815D108: @ 815D108
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _0815D1A0 @ =gUnknown_203F454
	ldr r0, [r0]
	cmp r0, 0
	beq _0815D19A
	ldr r2, [r0, 0x4]
	lsls r1, r4, 3
	subs r0, r1, r4
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2]
	adds r5, r1, 0
	cmp r0, 0
	beq _0815D19A
	ldrb r3, [r2, 0x3]
	adds r0, r3, 0x1
	ldrb r2, [r2, 0x1]
	cmp r0, 0
	beq _0815D152
	ldr r1, _0815D1A4 @ =gMain
	movs r7, 0x4
	negs r7, r7
	movs r6, 0x2
	adds r3, r0, 0
	lsls r0, r2, 3
	adds r0, 0x39
	adds r2, r0, r1
_0815D140:
	ldrb r1, [r2]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r6
	strb r0, [r2]
	subs r3, 0x1
	adds r2, 0x8
	cmp r3, 0
	bne _0815D140
_0815D152:
	adds r0, r4, 0
	bl sub_815D29C
	cmp r0, 0
	bne _0815D16E
	ldr r0, _0815D1A0 @ =gUnknown_203F454
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	subs r0, r5, r4
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x10]
	bl FreeSpriteTilesByTag
_0815D16E:
	adds r0, r4, 0
	bl sub_815D2E0
	cmp r0, 0
	bne _0815D18A
	ldr r0, _0815D1A0 @ =gUnknown_203F454
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	subs r0, r5, r4
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x12]
	bl FreeSpritePaletteByTag
_0815D18A:
	ldr r0, _0815D1A0 @ =gUnknown_203F454
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	subs r0, r5, r4
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0815D19A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815D1A0: .4byte gUnknown_203F454
_0815D1A4: .4byte gMain
	thumb_func_end sub_815D108

	thumb_func_start sub_815D1A8
sub_815D1A8: @ 815D1A8
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _0815D1FC @ =gUnknown_203F454
	ldr r1, [r0]
	adds r7, r0, 0
	cmp r1, 0
	beq _0815D238
	ldr r2, [r1, 0x4]
	lsls r1, r4, 3
	subs r0, r1, r4
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2]
	adds r6, r1, 0
	cmp r0, 0
	beq _0815D238
	ldrb r3, [r2, 0x3]
	adds r1, r3, 0x1
	ldrb r0, [r2, 0x1]
	cmp r5, 0
	beq _0815D204
	cmp r1, 0
	beq _0815D238
	ldr r1, _0815D200 @ =gMain
	movs r5, 0x4
	negs r5, r5
	movs r4, 0x2
	adds r3, 0x1
	lsls r0, 3
	adds r0, 0x39
	adds r2, r0, r1
_0815D1E8:
	ldrb r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
	subs r3, 0x1
	adds r2, 0x8
	cmp r3, 0
	bne _0815D1E8
	b _0815D238
	.align 2, 0
_0815D1FC: .4byte gUnknown_203F454
_0815D200: .4byte gMain
_0815D204:
	cmp r1, 0
	beq _0815D226
	ldr r1, _0815D240 @ =gMain
	movs r5, 0x4
	negs r5, r5
	adds r3, 0x1
	lsls r0, 3
	adds r0, 0x39
	adds r2, r0, r1
_0815D216:
	ldrb r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2]
	subs r3, 0x1
	adds r2, 0x8
	cmp r3, 0
	bne _0815D216
_0815D226:
	ldr r0, [r7]
	ldr r1, [r0, 0x4]
	subs r0, r6, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0, 0x18]
	adds r0, r4, 0
	bl sub_815CD70
_0815D238:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815D240: .4byte gMain
	thumb_func_end sub_815D1A8

	thumb_func_start sub_815D244
sub_815D244: @ 815D244
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0x40
	movs r3, 0
	ldr r0, _0815D270 @ =gUnknown_203F454
	ldr r0, [r0]
	ldr r2, [r0]
	cmp r3, r2
	bcs _0815D286
	ldr r1, [r0, 0x4]
_0815D25A:
	ldrb r0, [r1]
	cmp r0, 0
	bne _0815D274
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _0815D27E
	ldrb r0, [r1, 0x3]
	cmp r0, r4
	bhi _0815D27E
	ldrb r0, [r1, 0x1]
	b _0815D296
	.align 2, 0
_0815D270: .4byte gUnknown_203F454
_0815D274:
	adds r0, r5, 0x1
	ldrb r5, [r1, 0x3]
	adds r0, r5
	lsls r0, 16
	lsrs r5, r0, 16
_0815D27E:
	adds r1, 0x1C
	adds r3, 0x1
	cmp r3, r2
	bcc _0815D25A
_0815D286:
	adds r0, r5, r4
	adds r0, 0x1
	cmp r0, 0x80
	bgt _0815D294
	lsls r0, r5, 24
	lsrs r0, 24
	b _0815D296
_0815D294:
	movs r0, 0xFF
_0815D296:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_815D244

	thumb_func_start sub_815D29C
sub_815D29C: @ 815D29C
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r0, _0815D2CC @ =gUnknown_203F454
	ldr r0, [r0]
	ldr r4, [r0]
	cmp r2, r4
	bcs _0815D2D8
	ldr r1, [r0, 0x4]
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r5, r0, r1
_0815D2B6:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0815D2D0
	cmp r2, r3
	beq _0815D2D0
	ldrh r0, [r1, 0x10]
	ldrh r6, [r5, 0x10]
	cmp r0, r6
	bne _0815D2D0
	movs r0, 0x1
	b _0815D2DA
	.align 2, 0
_0815D2CC: .4byte gUnknown_203F454
_0815D2D0:
	adds r1, 0x1C
	adds r2, 0x1
	cmp r2, r4
	bcc _0815D2B6
_0815D2D8:
	movs r0, 0
_0815D2DA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_815D29C

	thumb_func_start sub_815D2E0
sub_815D2E0: @ 815D2E0
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r0, _0815D310 @ =gUnknown_203F454
	ldr r0, [r0]
	ldr r4, [r0]
	cmp r2, r4
	bcs _0815D31C
	ldr r1, [r0, 0x4]
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r5, r0, r1
_0815D2FA:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0815D314
	cmp r2, r3
	beq _0815D314
	ldrh r0, [r1, 0x12]
	ldrh r6, [r5, 0x12]
	cmp r0, r6
	bne _0815D314
	movs r0, 0x1
	b _0815D31E
	.align 2, 0
_0815D310: .4byte gUnknown_203F454
_0815D314:
	adds r1, 0x1C
	adds r2, 0x1
	cmp r2, r4
	bcc _0815D2FA
_0815D31C:
	movs r0, 0
_0815D31E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_815D2E0

	thumb_func_start sub_815D324
sub_815D324: @ 815D324
	ldr r2, _0815D330 @ =gUnknown_8479658
	lsls r0, 2
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0815D330: .4byte gUnknown_8479658
	thumb_func_end sub_815D324

	.align 2, 0 @ Don't pad with nop.
