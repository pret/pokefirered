	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D8BE4
sub_80D8BE4: @ 80D8BE4
	push {lr}
	movs r1, 0
	strb r1, [r0]
	strh r1, [r0, 0x2]
	adds r0, 0x4
	movs r2, 0xC0
	bl memset
	pop {r0}
	bx r0
	thumb_func_end sub_80D8BE4

	thumb_func_start sub_80D8BF8
sub_80D8BF8: @ 80D8BF8
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r6, 0xF
	bhi _080D8C14
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r5, r3, r0
	ldrb r7, [r5, 0x4]
	lsrs r0, r7, 7
	cmp r0, 0
	beq _080D8C18
_080D8C14:
	movs r0, 0xFF
	b _080D8C76
_080D8C18:
	ldrh r0, [r2]
	movs r4, 0
	strh r0, [r5, 0x8]
	ldrh r0, [r2, 0x2]
	strh r0, [r5, 0xA]
	ldrb r0, [r2, 0x4]
	strb r0, [r5, 0xC]
	ldrb r0, [r2, 0x5]
	strb r0, [r5, 0xD]
	ldrb r0, [r2, 0x6]
	strb r0, [r5, 0xE]
	ldrb r3, [r2, 0x7]
	lsls r0, r3, 27
	lsrs r0, 27
	ldrb r2, [r5, 0xF]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	movs r0, 0x60
	ands r0, r3
	movs r2, 0x61
	negs r2, r2
	ands r1, r2
	orrs r1, r0
	lsls r3, 24
	asrs r3, 31
	lsls r3, 7
	movs r0, 0x7F
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, 0xF]
	subs r0, 0xFF
	ands r0, r7
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r5, 0x4]
	strb r4, [r5, 0x6]
	strb r4, [r5, 0x5]
	lsls r1, 24
	cmp r1, 0
	bge _080D8C70
	movs r0, 0xFF
	b _080D8C72
_080D8C70:
	movs r0, 0x1
_080D8C72:
	strb r0, [r5, 0x7]
	adds r0, r6, 0
_080D8C76:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80D8BF8

	thumb_func_start sub_80D8C7C
sub_80D8C7C: @ 80D8C7C
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r1, 0
	cmp r4, 0xF
	bhi _080D8CA8
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r1, r2, r0
	ldrb r0, [r1, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _080D8CA8
	adds r0, r1, 0x4
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r4, 0
	b _080D8CAA
_080D8CA8:
	movs r0, 0xFF
_080D8CAA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80D8C7C

	thumb_func_start sub_80D8CB0
sub_80D8CB0: @ 80D8CB0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	movs r0, 0
	mov r12, r0
	ldrb r1, [r5, 0x8]
	cmp r12, r1
	bcc _080D8CC8
	b _080D8E60
_080D8CC8:
	movs r7, 0x1F
	ldr r0, _080D8CF8 @ =0xfffffc1f
	mov r10, r0
	movs r1, 0x7D
	negs r1, r1
	mov r9, r1
	movs r0, 0x1F
	mov r8, r0
_080D8CD8:
	ldrh r0, [r5, 0x6]
	add r0, r12
	lsls r0, 1
	ldr r1, _080D8CFC @ =gUnknown_20375F8
	adds r3, r0, r1
	ldr r1, _080D8D00 @ =gUnknown_20371F8
	adds r6, r0, r1
	ldrb r0, [r5]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x1
	beq _080D8D04
	cmp r0, 0x2
	beq _080D8D62
	b _080D8E4E
	.align 2, 0
_080D8CF8: .4byte 0xfffffc1f
_080D8CFC: .4byte gUnknown_20375F8
_080D8D00: .4byte gUnknown_20371F8
_080D8D04:
	ldr r0, [r3]
	lsls r2, r0, 27
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bhi _080D8D26
	lsrs r0, r2, 27
	adds r0, r1
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_080D8D26:
	ldr r0, [r3]
	lsls r2, r0, 22
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bhi _080D8D4A
	lsrs r0, r2, 27
	adds r0, r1
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_080D8D4A:
	ldr r0, [r3]
	lsls r2, r0, 17
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bls _080D8D5C
	b _080D8E4E
_080D8D5C:
	lsrs r0, r2, 27
	adds r0, r1
	b _080D8E40
_080D8D62:
	movs r0, 0x3
	ldrsb r0, [r5, r0]
	cmp r0, 0
	bge _080D8DD4
	ldr r0, [r3]
	lsls r4, r0, 27
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	blt _080D8D92
	lsrs r0, r4, 27
	adds r0, r2
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_080D8D92:
	ldr r0, [r3]
	lsls r4, r0, 22
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 22
	lsrs r0, 27
	cmp r1, r0
	blt _080D8DBC
	lsrs r0, r4, 27
	adds r0, r2
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_080D8DBC:
	ldr r0, [r3]
	lsls r4, r0, 17
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 17
	lsrs r0, 27
	cmp r1, r0
	blt _080D8E4E
	b _080D8E3C
_080D8DD4:
	ldr r0, [r3]
	lsls r4, r0, 27
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	bgt _080D8DFC
	lsrs r0, r4, 27
	adds r0, r2
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_080D8DFC:
	ldr r0, [r3]
	lsls r4, r0, 22
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 22
	lsrs r0, 27
	cmp r1, r0
	bgt _080D8E26
	lsrs r0, r4, 27
	adds r0, r2
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_080D8E26:
	ldr r0, [r3]
	lsls r4, r0, 17
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 17
	lsrs r0, 27
	cmp r1, r0
	bgt _080D8E4E
_080D8E3C:
	lsrs r0, r4, 27
	adds r0, r2
_080D8E40:
	ands r0, r7
	lsls r0, 2
	ldrb r2, [r3, 0x1]
	mov r1, r9
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
_080D8E4E:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	ldrb r0, [r5, 0x8]
	cmp r12, r0
	bcs _080D8E60
	b _080D8CD8
_080D8E60:
	ldrb r1, [r5, 0x2]
	adds r0, r1, 0x1
	strb r0, [r5, 0x2]
	ldrb r0, [r5, 0xB]
	lsls r0, 27
	lsls r1, 24
	asrs r0, 3
	cmp r1, r0
	beq _080D8E76
	movs r0, 0
	b _080D8EAA
_080D8E76:
	movs r0, 0
	strb r0, [r5, 0x2]
	movs r0, 0x3
	ldrsb r0, [r5, r0]
	negs r0, r0
	strb r0, [r5, 0x3]
	ldrb r2, [r5]
	movs r1, 0x7F
	movs r0, 0x7F
	ands r0, r2
	cmp r0, 0x1
	bne _080D8E96
	lsls r0, r2, 25
	lsrs r0, 25
	adds r0, 0x1
	b _080D8E9C
_080D8E96:
	lsls r0, r2, 25
	lsrs r0, 25
	subs r0, 0x1
_080D8E9C:
	ands r0, r1
	movs r1, 0x80
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	movs r0, 0x1
_080D8EAA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80D8CB0

	thumb_func_start sub_80D8EB8
sub_80D8EB8: @ 80D8EB8
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r2, 0
	ldrb r0, [r3]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x1
	beq _080D8ECE
	cmp r0, 0x2
	beq _080D8EFC
	b _080D8F36
_080D8ECE:
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcs _080D8EEE
	ldr r4, _080D8EF8 @ =gUnknown_20375F8
_080D8ED6:
	ldrh r0, [r3, 0x6]
	adds r0, r2
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r3, 0x4]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcc _080D8ED6
_080D8EEE:
	ldrb r2, [r3]
	lsls r1, r2, 25
	lsrs r1, 25
	adds r1, 0x1
	b _080D8F28
	.align 2, 0
_080D8EF8: .4byte gUnknown_20375F8
_080D8EFC:
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcs _080D8F20
	ldr r5, _080D8F40 @ =gUnknown_20375F8
	ldr r4, _080D8F44 @ =gUnknown_20371F8
_080D8F06:
	ldrh r0, [r3, 0x6]
	adds r0, r2
	lsls r0, 1
	adds r1, r0, r5
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcc _080D8F06
_080D8F20:
	ldrb r2, [r3]
	lsls r1, r2, 25
	lsrs r1, 25
	subs r1, 0x1
_080D8F28:
	movs r0, 0x7F
	ands r1, r0
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D8F36:
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D8F40: .4byte gUnknown_20375F8
_080D8F44: .4byte gUnknown_20371F8
	thumb_func_end sub_80D8EB8

	thumb_func_start task_tutorial_controls_fadein
task_tutorial_controls_fadein: @ 80D8F48
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _080D8FAC
_080D8F54:
	ldrh r0, [r4, 0x2]
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D8FA2
	lsls r1, r5, 1
	adds r0, r1, r5
	lsls r3, r0, 2
	adds r2, r4, r3
	ldrb r0, [r2, 0x5]
	subs r0, 0x1
	strb r0, [r2, 0x5]
	lsls r0, 24
	lsrs r0, 24
	adds r6, r1, 0
	cmp r0, 0xFF
	bne _080D8FA2
	ldrh r0, [r2, 0x8]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080D8F90
	adds r0, r3, 0x4
	adds r0, r4, r0
	bl sub_80D8CB0
	b _080D8F98
_080D8F90:
	adds r0, r3, 0x4
	adds r0, r4, r0
	bl sub_80D8EB8
_080D8F98:
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r0, 0xD]
	strb r1, [r0, 0x5]
_080D8FA2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080D8F54
_080D8FAC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end task_tutorial_controls_fadein

	thumb_func_start sub_80D8FB4
sub_80D8FB4: @ 80D8FB4
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r4, 0
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	movs r5, 0x1
	movs r7, 0x80
	negs r7, r7
_080D8FCA:
	adds r0, r6, 0
	asrs r0, r4
	ands r0, r5
	cmp r0, 0
	beq _080D8FF8
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r3, r0
	ldrb r0, [r2, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _080D8FF8
	adds r0, r5, 0
	lsls r0, r4
	ldrh r1, [r3, 0x2]
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrb r1, [r2, 0x4]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r5
	strb r0, [r2, 0x4]
_080D8FF8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080D8FCA
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D8FB4

	thumb_func_start sub_80D9008
sub_80D9008: @ 80D9008
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	movs r5, 0
	movs r3, 0x1
_080D9016:
	ldrh r0, [r6, 0x2]
	asrs r0, r5
	ands r0, r3
	cmp r0, 0
	beq _080D907E
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r4, r6, r0
	ldrb r0, [r4, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _080D907E
	adds r0, r7, 0
	asrs r0, r5
	ands r0, r3
	cmp r0, 0
	beq _080D907E
	ldrh r1, [r4, 0xA]
	lsls r1, 1
	ldr r0, _080D9074 @ =gUnknown_20375F8
	adds r0, r1, r0
	ldr r2, _080D9078 @ =gUnknown_20371F8
	adds r1, r2
	ldrb r2, [r4, 0xC]
	lsls r2, 1
	str r3, [sp]
	bl memcpy
	ldrb r0, [r4, 0x4]
	movs r2, 0x80
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4, 0x4]
	movs r0, 0
	strb r0, [r4, 0x6]
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0xF]
	lsls r0, 24
	ldr r3, [sp]
	cmp r0, 0
	bge _080D907C
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	b _080D907E
	.align 2, 0
_080D9074: .4byte gUnknown_20375F8
_080D9078: .4byte gUnknown_20371F8
_080D907C:
	strb r3, [r4, 0x7]
_080D907E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080D9016
	ldr r0, _080D9094 @ =0x0000ffff
	cmp r7, r0
	bne _080D9098
	movs r0, 0
	strb r0, [r6]
	b _080D909C
	.align 2, 0
_080D9094: .4byte 0x0000ffff
_080D9098:
	ldrh r0, [r6, 0x2]
	bics r0, r7
_080D909C:
	strh r0, [r6, 0x2]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9008

	thumb_func_start sub_80D90A8
sub_80D90A8: @ 80D90A8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
	strh r4, [r5]
	adds r0, r5, 0x4
	movs r1, 0
	movs r2, 0xC0
	bl memset
_080D90BA:
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r5, r0
	strb r4, [r0, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080D90BA
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D90A8

	thumb_func_start sub_80D90D4
sub_80D90D4: @ 80D90D4
	push {r4,r5,lr}
	adds r2, r0, 0
	adds r5, r1, 0
	movs r3, 0
	movs r4, 0
	ldrb r0, [r2, 0x5]
	lsrs r0, 7
	cmp r0, 0
	bne _080D90EA
	adds r4, r2, 0x4
	b _080D9108
_080D90EA:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bhi _080D9108
	lsls r0, r3, 1
	adds r0, r3
	lsls r1, r0, 2
	adds r0, r2, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 7
	cmp r0, 0
	bne _080D90EA
	adds r0, r1, 0x4
	adds r4, r2, r0
_080D9108:
	cmp r4, 0
	beq _080D9136
	ldrb r1, [r4, 0x1]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	adds r1, r4, 0x4
	adds r0, r5, 0
	ldm r0!, {r2,r4}
	stm r1!, {r2,r4}
	adds r0, r3, 0
	b _080D9138
_080D9136:
	movs r0, 0xFF
_080D9138:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80D90D4

	thumb_func_start sub_80D9140
sub_80D9140: @ 80D9140
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0x1]
	movs r2, 0x40
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080D9182
	ldrb r1, [r4, 0xB]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080D9182
	ldrh r2, [r4, 0x6]
	ldrb r0, [r4, 0x8]
	adds r0, r2, r0
	cmp r2, r0
	bge _080D9182
	ldr r5, _080D91B4 @ =gUnknown_20375F8
	ldr r3, _080D91B8 @ =gUnknown_20371F8
_080D9168:
	lsls r0, r2, 1
	adds r1, r0, r5
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r4, 0x6]
	ldrb r1, [r4, 0x8]
	adds r0, r1
	cmp r2, r0
	blt _080D9168
_080D9182:
	adds r0, r4, 0x4
	movs r1, 0
	movs r2, 0x8
	bl memset
	ldrb r1, [r4, 0x1]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	subs r1, 0x10
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	movs r1, 0x7F
	ands r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0
	strb r0, [r4, 0x3]
	strb r0, [r4, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D91B4: .4byte gUnknown_20375F8
_080D91B8: .4byte gUnknown_20371F8
	thumb_func_end sub_80D9140

	thumb_func_start sub_80D91BC
sub_80D91BC: @ 80D91BC
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	movs r5, 0
	cmp r2, 0
	bne _080D91E0
	movs r1, 0xF
	ands r1, r4
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, 0x4
	adds r0, r6, r0
	bl sub_80D9140
	b _080D920C
_080D91E0:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080D9200
	lsls r0, r5, 1
	adds r0, r5
	lsls r1, r0, 2
	adds r0, r6, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 7
	cmp r0, 0
	beq _080D9200
	adds r0, r1, 0x4
	adds r0, r6, r0
	bl sub_80D9140
_080D9200:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xF
	bls _080D91E0
_080D920C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D91BC

	thumb_func_start sub_80D9214
sub_80D9214: @ 80D9214
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	movs r3, 0
	cmp r2, 0
	bne _080D9248
	movs r0, 0xF
	adds r3, r0, 0
	ands r3, r4
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r5, r1
	ldrb r2, [r1, 0x5]
	movs r0, 0x41
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x1
	lsls r0, r3
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	b _080D928C
_080D9248:
	movs r6, 0x1
	movs r7, 0x41
	negs r7, r7
_080D924E:
	adds r0, r4, 0
	ands r0, r6
	cmp r0, 0
	beq _080D926C
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r2, r5, r0
	ldrb r1, [r2, 0x5]
	lsrs r0, r1, 7
	cmp r0, 0
	beq _080D926C
	lsls r0, r1, 25
	cmp r0, 0
	blt _080D9272
_080D926C:
	lsls r0, r4, 17
	lsrs r4, r0, 16
	b _080D9282
_080D9272:
	adds r0, r7, 0
	ands r0, r1
	strb r0, [r2, 0x5]
	adds r0, r6, 0
	lsls r0, r3
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
_080D9282:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _080D924E
_080D928C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9214

	thumb_func_start sub_80D9294
sub_80D9294: @ 80D9294
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	movs r0, 0
	mov r12, r0
	cmp r2, 0
	bne _080D931C
	movs r1, 0xF
	ands r1, r7
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, 0x4
	mov r1, r8
	adds r3, r1, r0
	ldrb r1, [r3, 0x1]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x80
	bne _080D93A6
	ldrb r1, [r3, 0xB]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080D92FA
	ldrh r2, [r3, 0x6]
	ldrb r0, [r3, 0x8]
	adds r0, r2, r0
	cmp r2, r0
	bge _080D92FA
	ldr r5, _080D9314 @ =gUnknown_20375F8
	ldr r4, _080D9318 @ =gUnknown_20371F8
_080D92E0:
	lsls r0, r2, 1
	adds r1, r0, r5
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r3, 0x6]
	ldrb r1, [r3, 0x8]
	adds r0, r1
	cmp r2, r0
	blt _080D92E0
_080D92FA:
	ldrb r0, [r3, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r3, 0x1]
	movs r1, 0x1
	mov r2, r12
	lsls r1, r2
	mov r2, r8
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	b _080D93A6
	.align 2, 0
_080D9314: .4byte gUnknown_20375F8
_080D9318: .4byte gUnknown_20371F8
_080D931C:
	movs r0, 0x1
	mov r9, r0
	movs r1, 0x40
	mov r10, r1
_080D9324:
	mov r2, r12
	lsls r0, r2, 1
	add r0, r12
	lsls r0, 2
	adds r0, 0x4
	mov r1, r8
	adds r3, r1, r0
	adds r0, r7, 0
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	beq _080D9346
	ldrb r1, [r3, 0x1]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x80
	beq _080D9350
_080D9346:
	lsls r0, r7, 17
	lsrs r7, r0, 16
	mov r5, r12
	adds r5, 0x1
	b _080D939C
_080D9350:
	ldrb r1, [r3, 0xB]
	mov r0, r10
	ands r0, r1
	mov r5, r12
	adds r5, 0x1
	cmp r0, 0
	beq _080D9386
	ldrh r2, [r3, 0x6]
	ldrb r0, [r3, 0x8]
	adds r0, r2, r0
	cmp r2, r0
	bge _080D9386
	ldr r6, _080D93B4 @ =gUnknown_20375F8
	ldr r4, _080D93B8 @ =gUnknown_20371F8
_080D936C:
	lsls r0, r2, 1
	adds r1, r0, r6
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r3, 0x6]
	ldrb r1, [r3, 0x8]
	adds r0, r1
	cmp r2, r0
	blt _080D936C
_080D9386:
	ldrb r1, [r3, 0x1]
	mov r0, r10
	orrs r0, r1
	strb r0, [r3, 0x1]
	mov r1, r9
	mov r0, r12
	lsls r1, r0
	mov r2, r8
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
_080D939C:
	lsls r0, r5, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0xF
	bls _080D9324
_080D93A6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D93B4: .4byte gUnknown_20375F8
_080D93B8: .4byte gUnknown_20371F8
	thumb_func_end sub_80D9294

	thumb_func_start sub_80D93BC
sub_80D93BC: @ 80D93BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	movs r0, 0
	mov r10, r0
	ldr r1, [sp]
	ldrh r0, [r1]
	cmp r0, 0
	bne _080D93D8
	b _080D9562
_080D93D8:
	movs r2, 0xF
	mov r9, r2
	movs r3, 0x10
	negs r3, r3
	mov r8, r3
	movs r7, 0x1
_080D93E4:
	mov r5, r10
	lsls r0, r5, 1
	add r0, r10
	lsls r0, 2
	adds r0, 0x4
	ldr r1, [sp]
	adds r4, r1, r0
	ldrb r2, [r4, 0x1]
	movs r3, 0xC0
	ands r3, r2
	cmp r3, 0x80
	beq _080D93FE
	b _080D9552
_080D93FE:
	ldr r0, _080D944C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080D9414
	ldrb r0, [r4, 0xB]
	ands r3, r0
	cmp r3, 0
	beq _080D9414
	b _080D9552
_080D9414:
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	strb r0, [r4, 0x2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080D9424
	b _080D9552
_080D9424:
	ldrb r0, [r4, 0x9]
	strb r0, [r4, 0x2]
	ldrh r0, [r4, 0x6]
	ldrb r1, [r4, 0x8]
	lsls r2, 28
	lsrs r2, 28
	ldrh r3, [r4, 0x4]
	bl BlendPalette
	ldrb r5, [r4, 0xB]
	lsls r0, r5, 26
	asrs r0, 30
	cmp r0, 0x1
	beq _080D9482
	cmp r0, 0x1
	bgt _080D9450
	cmp r0, 0
	beq _080D9456
	b _080D953C
	.align 2, 0
_080D944C: .4byte gUnknown_2037AB8
_080D9450:
	cmp r0, 0x2
	beq _080D94FE
	b _080D953C
_080D9456:
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 28
	lsrs r0, r1, 28
	adds r0, 0x1
	mov r3, r9
	ands r0, r3
	mov r6, r8
	adds r3, r6, 0
	ands r3, r2
	orrs r3, r0
	strb r3, [r4, 0x1]
	lsrs r1, 28
	lsls r0, r5, 28
	asrs r0, 28
	cmp r1, r0
	bne _080D953C
	ldrb r0, [r4, 0x3]
	adds r0, 0x1
	strb r0, [r4, 0x3]
	ands r3, r6
	strb r3, [r4, 0x1]
	b _080D953C
_080D9482:
	ldrb r3, [r4, 0x1]
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _080D94C0
	lsls r0, r3, 28
	lsrs r0, 28
	subs r0, 0x1
	mov r5, r9
	ands r0, r5
	mov r2, r8
	ands r2, r3
	orrs r2, r0
	strb r2, [r4, 0x1]
	cmp r0, 0
	bne _080D953C
	ldrb r0, [r4, 0x3]
	adds r0, 0x1
	strb r0, [r4, 0x3]
	lsls r0, r2, 27
	lsrs r0, 31
	eors r0, r7
	ands r0, r7
	lsls r0, 4
	movs r3, 0x11
	negs r3, r3
	adds r1, r3, 0
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0x1]
	b _080D953C
_080D94C0:
	lsls r0, r5, 28
	asrs r0, 28
	subs r0, 0x1
	mov r5, r9
	ands r0, r5
	lsls r2, r3, 28
	lsrs r1, r2, 28
	adds r1, 0x1
	ands r1, r5
	mov r5, r8
	ands r3, r5
	orrs r3, r1
	strb r3, [r4, 0x1]
	lsrs r2, 28
	cmp r2, r0
	bne _080D953C
	ldrb r0, [r4, 0x3]
	adds r0, 0x1
	strb r0, [r4, 0x3]
	lsls r0, r3, 27
	lsrs r0, 31
	eors r0, r7
	ands r0, r7
	lsls r0, 4
	movs r2, 0x11
	negs r2, r2
	adds r1, r2, 0
	ands r3, r1
	orrs r3, r0
	strb r3, [r4, 0x1]
	b _080D953C
_080D94FE:
	ldrb r2, [r4, 0x1]
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080D950E
	mov r0, r8
	ands r0, r2
	b _080D951C
_080D950E:
	lsls r1, r5, 28
	asrs r1, 28
	mov r3, r9
	ands r1, r3
	mov r0, r8
	ands r0, r2
	orrs r0, r1
_080D951C:
	strb r0, [r4, 0x1]
	ldrb r2, [r4, 0x1]
	lsls r0, r2, 27
	lsrs r0, 31
	eors r0, r7
	ands r0, r7
	lsls r0, 4
	movs r5, 0x11
	negs r5, r5
	adds r1, r5, 0
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	adds r0, 0x1
	strb r0, [r4, 0x3]
_080D953C:
	ldrb r1, [r4, 0xA]
	cmp r1, 0xFF
	beq _080D9552
	ldrb r0, [r4, 0x3]
	cmp r0, r1
	bne _080D9552
	ldrb r1, [r4]
	ldr r0, [sp]
	movs r2, 0
	bl sub_80D9294
_080D9552:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0xF
	bhi _080D9562
	b _080D93E4
_080D9562:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D93BC

	thumb_func_start sub_80D9574
sub_80D9574: @ 80D9574
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	lsrs r3, 19
	adds r3, r2
	lsls r3, 1
	adds r6, r3
	cmp r1, r4
	bcs _080D95BE
_080D959C:
	lsls r0, r1, 6
	adds r2, r6, r0
	movs r0, 0
	adds r3, r1, 0x1
	cmp r0, r5
	bcs _080D95B6
_080D95A8:
	strh r7, [r2]
	adds r2, 0x2
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bcc _080D95A8
_080D95B6:
	lsls r0, r3, 24
	lsrs r1, r0, 24
	cmp r1, r4
	bcc _080D959C
_080D95BE:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9574

	thumb_func_start sub_80D95C4
sub_80D95C4: @ 80D95C4
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r6, r4, 24
	movs r4, 0
	lsrs r3, 19
	adds r3, r2
	lsls r3, 1
	adds r7, r3
	cmp r4, r6
	bcs _080D960E
_080D95E8:
	lsls r0, r4, 6
	adds r2, r7, r0
	movs r3, 0
	adds r4, 0x1
	cmp r3, r5
	bcs _080D9606
_080D95F4:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r5
	bcc _080D95F4
_080D9606:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _080D95E8
_080D960E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D95C4

	.align 2, 0 @ Don't pad with nop.
