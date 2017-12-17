	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_803D97C
sub_803D97C: @ 803D97C
	push {lr}
	adds r2, r0, 0
	movs r1, 0
	movs r3, 0
_0803D984:
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0x4F
	bls _0803D984
	pop {r0}
	bx r0
	thumb_func_end sub_803D97C

	thumb_func_start sub_803D994
sub_803D994: @ 803D994
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_803D97C
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x37
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x38
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3A
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3B
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3C
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3D
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3E
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3F
	mov r2, sp
	bl sub_804037C
	movs r0, 0xFF
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x40
	mov r2, sp
	bl sub_804037C
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_803D994

	thumb_func_start sub_803DA14
sub_803DA14: @ 803DA14
	push {r4,r5,lr}
	ldr r4, _0803DA30 @ =gUnknown_2024284
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r4, r0
_0803DA1E:
	adds r0, r4, 0
	bl sub_803D994
	adds r4, 0x64
	cmp r4, r5
	ble _0803DA1E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DA30: .4byte gUnknown_2024284
	thumb_func_end sub_803DA14

	thumb_func_start sub_803DA34
sub_803DA34: @ 803DA34
	push {r4,r5,lr}
	ldr r4, _0803DA50 @ =gUnknown_202402C
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r4, r0
_0803DA3E:
	adds r0, r4, 0
	bl sub_803D994
	adds r4, 0x64
	cmp r4, r5
	ble _0803DA3E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DA50: .4byte gUnknown_202402C
	thumb_func_end sub_803DA34

	thumb_func_start sub_803DA54
sub_803DA54: @ 803DA54
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x1C
	mov r8, r0
	adds r6, r1, 0
	ldr r4, [sp, 0x34]
	ldr r7, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	lsls r6, 16
	lsrs r6, 16
	add r0, sp, 0x10
	strb r2, [r0]
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r0, r8
	str r3, [sp, 0x18]
	bl sub_803D994
	str r4, [sp]
	str r7, [sp, 0x4]
	str r5, [sp, 0x8]
	ldr r0, [sp, 0x40]
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r6, 0
	add r2, sp, 0x10
	ldrb r2, [r2]
	ldr r3, [sp, 0x18]
	bl sub_803DAC4
	mov r0, r8
	movs r1, 0x38
	add r2, sp, 0x10
	bl sub_804037C
	movs r0, 0xFF
	str r0, [sp, 0x14]
	add r2, sp, 0x14
	mov r0, r8
	movs r1, 0x40
	bl sub_804037C
	mov r0, r8
	bl sub_803E47C
	add sp, 0x1C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_803DA54

	thumb_func_start sub_803DAC4
sub_803DAC4: @ 803DAC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r7, r0, 0
	ldr r4, [sp, 0x40]
	ldr r0, [sp, 0x48]
	movs r5, 0xE
	add r5, sp
	strh r1, [r5]
	add r6, sp, 0x10
	strb r2, [r6]
	mov r5, sp
	adds r5, 0x11
	strb r3, [r5]
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r7, 0
	bl sub_803D97C
	cmp r4, 0
	beq _0803DB00
	ldr r0, [sp, 0x44]
	str r0, [sp, 0x14]
	b _0803DB14
_0803DB00:
	bl sub_8044EC8
	adds r4, r0, 0
	bl sub_8044EC8
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	str r4, [sp, 0x14]
_0803DB14:
	add r2, sp, 0x14
	adds r0, r7, 0
	movs r1, 0
	bl sub_80404D0
	add r0, sp, 0x18
	mov r9, r0
	add r5, sp, 0xC
	mov r1, r10
	cmp r1, 0x2
	bne _0803DB6C
	ldr r2, _0803DB64 @ =0xffff0000
	mov r8, r2
	ldr r6, _0803DB68 @ =0x0000ffff
_0803DB30:
	bl sub_8044EC8
	adds r4, r0, 0
	bl sub_8044EC8
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	str r4, [sp, 0x18]
	adds r1, r4, 0
	mov r3, r8
	ands r1, r3
	lsrs r1, 16
	ands r4, r6
	eors r1, r4
	ldr r2, [sp, 0x14]
	adds r0, r2, 0
	ands r0, r3
	lsrs r0, 16
	eors r1, r0
	ands r2, r6
	eors r1, r2
	cmp r1, 0x7
	bls _0803DB30
	b _0803DB92
	.align 2, 0
_0803DB64: .4byte 0xffff0000
_0803DB68: .4byte 0x0000ffff
_0803DB6C:
	mov r0, r10
	cmp r0, 0x1
	bne _0803DB78
	ldr r0, [sp, 0x4C]
	str r0, [sp, 0x18]
	b _0803DB92
_0803DB78:
	ldr r0, _0803DCBC @ =gUnknown_300500C
	ldr r2, [r0]
	ldrb r1, [r2, 0xA]
	ldrb r0, [r2, 0xB]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0xC]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0xD]
	lsls r0, 24
	orrs r1, r0
	str r1, [sp, 0x18]
_0803DB92:
	adds r0, r7, 0
	movs r1, 0x1
	mov r2, r9
	bl sub_80404D0
	adds r0, r7, 0
	bl sub_803E3E8
	strh r0, [r5]
	adds r0, r7, 0
	movs r1, 0x9
	adds r2, r5, 0
	bl sub_80404D0
	adds r0, r7, 0
	bl sub_803F8F8
	mov r0, sp
	ldrh r1, [r0, 0xE]
	bl sub_8040FD0
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, sp
	bl sub_80404D0
	ldr r2, _0803DCC0 @ =gUnknown_81E9F11
	adds r0, r7, 0
	movs r1, 0x3
	bl sub_80404D0
	ldr r5, _0803DCBC @ =gUnknown_300500C
	ldr r2, [r5]
	adds r0, r7, 0
	movs r1, 0x7
	bl sub_80404D0
	adds r0, r7, 0
	movs r1, 0xB
	mov r2, sp
	adds r2, 0xE
	bl sub_80404D0
	ldr r4, _0803DCC4 @ =gUnknown_8254784
	mov r2, sp
	ldrh r1, [r2, 0xE]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	adds r2, r1, 0
	muls r2, r0
	mov r3, sp
	ldrb r0, [r3, 0x10]
	lsls r0, 2
	ldr r1, _0803DCC8 @ =gUnknown_8253AE4
	adds r0, r1
	adds r2, r0
	adds r0, r7, 0
	movs r1, 0x19
	bl sub_80404D0
	mov r1, sp
	ldrh r0, [r1, 0xE]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	adds r4, 0x12
	adds r2, r4
	adds r0, r7, 0
	movs r1, 0x20
	bl sub_80404D0
	bl sub_8056260
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	adds r0, r7, 0
	movs r1, 0x23
	mov r2, r9
	bl sub_80404D0
	adds r0, r7, 0
	movs r1, 0x24
	add r2, sp, 0x10
	bl sub_80404D0
	ldr r2, _0803DCCC @ =gUnknown_81E9F10
	adds r0, r7, 0
	movs r1, 0x25
	bl sub_80404D0
	movs r0, 0x4
	str r0, [sp, 0x18]
	adds r0, r7, 0
	movs r1, 0x26
	mov r2, r9
	bl sub_80404D0
	ldr r2, [r5]
	adds r2, 0x8
	adds r0, r7, 0
	movs r1, 0x31
	bl sub_80404D0
	mov r2, sp
	ldrb r0, [r2, 0x11]
	cmp r0, 0x1F
	bhi _0803DCD0
	adds r0, r7, 0
	movs r1, 0x27
	adds r2, 0x11
	bl sub_80404D0
	adds r0, r7, 0
	movs r1, 0x28
	mov r2, sp
	adds r2, 0x11
	bl sub_80404D0
	adds r0, r7, 0
	movs r1, 0x29
	mov r2, sp
	adds r2, 0x11
	bl sub_80404D0
	adds r0, r7, 0
	movs r1, 0x2A
	mov r2, sp
	adds r2, 0x11
	bl sub_80404D0
	adds r0, r7, 0
	movs r1, 0x2B
	mov r2, sp
	adds r2, 0x11
	bl sub_80404D0
	adds r0, r7, 0
	movs r1, 0x2C
	mov r2, sp
	adds r2, 0x11
	bl sub_80404D0
	b _0803DD58
	.align 2, 0
_0803DCBC: .4byte gUnknown_300500C
_0803DCC0: .4byte gUnknown_81E9F11
_0803DCC4: .4byte gUnknown_8254784
_0803DCC8: .4byte gUnknown_8253AE4
_0803DCCC: .4byte gUnknown_81E9F10
_0803DCD0:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
	movs r3, 0x1F
	mov r8, r3
	ands r0, r3
	str r0, [sp, 0x1C]
	add r4, sp, 0x1C
	adds r0, r7, 0
	movs r1, 0x27
	adds r2, r4, 0
	bl sub_80404D0
	ldr r0, [sp, 0x18]
	movs r6, 0xF8
	lsls r6, 2
	ands r0, r6
	lsrs r0, 5
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x28
	adds r2, r4, 0
	bl sub_80404D0
	ldr r0, [sp, 0x18]
	movs r5, 0xF8
	lsls r5, 7
	ands r0, r5
	lsrs r0, 10
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x29
	adds r2, r4, 0
	bl sub_80404D0
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
	mov r1, r8
	ands r0, r1
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x2A
	adds r2, r4, 0
	bl sub_80404D0
	ldr r0, [sp, 0x18]
	ands r0, r6
	lsrs r0, 5
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x2B
	adds r2, r4, 0
	bl sub_80404D0
	ldr r0, [sp, 0x18]
	ands r0, r5
	lsrs r0, 10
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x2C
	adds r2, r4, 0
	bl sub_80404D0
_0803DD58:
	ldr r2, _0803DD94 @ =gUnknown_8254784
	mov r3, sp
	ldrh r1, [r3, 0xE]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x17]
	cmp r0, 0
	beq _0803DD7E
	ldr r0, [sp, 0x14]
	movs r1, 0x1
	ands r0, r1
	str r0, [sp, 0x18]
	adds r0, r7, 0
	movs r1, 0x2E
	mov r2, r9
	bl sub_80404D0
_0803DD7E:
	adds r0, r7, 0
	bl sub_803E9E0
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803DD94: .4byte gUnknown_8254784
	thumb_func_end sub_803DAC4

	thumb_func_start sub_803DD98
sub_803DD98: @ 803DD98
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	mov r9, r0
	ldr r0, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
_0803DDB8:
	bl sub_8044EC8
	adds r4, r0, 0
	bl sub_8044EC8
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	adds r0, r4, 0
	bl sub_8042EB4
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _0803DDB8
	movs r0, 0x1
	str r0, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	mov r0, r9
	mov r1, r8
	adds r2, r7, 0
	adds r3, r6, 0
	bl sub_803DA54
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_803DD98

	thumb_func_start sub_803DE00
sub_803DE00: @ 803DE00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	str r0, [sp, 0x10]
	ldr r4, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	ldr r0, [sp, 0x40]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x14]
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	lsls r5, 24
	lsrs r6, r5, 24
	lsls r0, 24
	lsrs r1, r0, 24
	mov r9, r1
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1B
	bhi _0803DEA6
_0803DE40:
	bl sub_8044EC8
	adds r4, r0, 0
	bl sub_8044EC8
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r4
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r4
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r4
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r4
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl sub_8042EB4
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0803DE40
	adds r0, r7, 0
	adds r1, r4, 0
	bl sub_803F78C
	lsls r0, 24
	lsrs r0, 24
	cmp r8, r0
	bne _0803DE40
	mov r0, r9
	subs r0, 0x1
	cmp r5, r0
	bne _0803DE40
	b _0803DED6
_0803DEA6:
	bl sub_8044EC8
	adds r4, r0, 0
	bl sub_8044EC8
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	adds r0, r4, 0
	bl sub_8042EB4
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0803DEA6
	adds r0, r7, 0
	adds r1, r4, 0
	bl sub_803F78C
	lsls r0, 24
	lsrs r0, 24
	cmp r8, r0
	bne _0803DEA6
_0803DED6:
	movs r0, 0x1
	str r0, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x10]
	adds r1, r7, 0
	ldr r2, [sp, 0x14]
	mov r3, r10
	bl sub_803DA54
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_803DE00

	thumb_func_start sub_803DF00
sub_803DF00: @ 803DF00
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
_0803DF12:
	bl sub_8044EC8
	adds r4, r0, 0
	bl sub_8044EC8
	lsls r4, 16
	lsrs r5, r4, 16
	lsls r0, 16
	orrs r5, r0
	bl sub_8044EC8
	adds r4, r0, 0
	bl sub_8044EC8
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_803F78C
	lsls r0, 24
	cmp r0, 0
	bne _0803DF12
	movs r0, 0x1
	str r0, [sp]
	str r4, [sp, 0x4]
	str r0, [sp, 0x8]
	str r5, [sp, 0xC]
	mov r0, r8
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x20
	bl sub_803DA54
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_803DF00

	thumb_func_start sub_803DF68
sub_803DF68: @ 803DF68
	push {r4,lr}
	sub sp, 0x14
	adds r4, r0, 0
	str r3, [sp, 0x10]
	ldr r3, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x1
	str r0, [sp]
	str r3, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r3, 0
	bl sub_803DA54
	adds r0, r4, 0
	movs r1, 0x42
	add r2, sp, 0x10
	bl sub_804037C
	adds r0, r4, 0
	bl sub_803E47C
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_803DF68

	thumb_func_start sub_803DFA8
sub_803DFA8: @ 803DFA8
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r3, 0
	ldr r3, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	str r3, [sp, 0xC]
	adds r0, r5, 0
	movs r3, 0
	bl sub_803DA54
	adds r0, r5, 0
	movs r1, 0x27
	adds r2, r4, 0
	bl sub_804037C
	adds r2, r4, 0x1
	adds r0, r5, 0
	movs r1, 0x28
	bl sub_804037C
	adds r2, r4, 0x2
	adds r0, r5, 0
	movs r1, 0x29
	bl sub_804037C
	adds r2, r4, 0x3
	adds r0, r5, 0
	movs r1, 0x2A
	bl sub_804037C
	adds r2, r4, 0x4
	adds r0, r5, 0
	movs r1, 0x2B
	bl sub_804037C
	adds r4, 0x5
	adds r0, r5, 0
	movs r1, 0x2C
	adds r2, r4, 0
	bl sub_804037C
	adds r0, r5, 0
	bl sub_803E47C
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_803DFA8

	thumb_func_start sub_803E01C
sub_803E01C: @ 803E01C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r7, r0, 0
	ldr r0, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r6, 0
	str r6, [sp]
	str r6, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	adds r0, r7, 0
	bl sub_803DA54
	mov r4, r8
	movs r1, 0x1
	movs r5, 0x5
_0803E050:
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0803E05A
	adds r6, 0x1
_0803E05A:
	lsrs r4, 1
	subs r5, 0x1
	cmp r5, 0
	bge _0803E050
	movs r0, 0xFF
	lsls r0, 1
	adds r1, r6, 0
	bl __divsi3
	add r1, sp, 0x10
	strh r0, [r1]
	movs r4, 0x1
	movs r5, 0
_0803E074:
	mov r0, r8
	ands r0, r4
	cmp r0, 0
	beq _0803E088
	adds r1, r5, 0
	adds r1, 0x1A
	adds r0, r7, 0
	add r2, sp, 0x10
	bl sub_804037C
_0803E088:
	lsls r0, r4, 25
	lsrs r4, r0, 24
	adds r5, 0x1
	cmp r5, 0x5
	ble _0803E074
	adds r0, r7, 0
	bl sub_803E47C
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_803E01C

	thumb_func_start sub_803E0A4
sub_803E0A4: @ 803E0A4
	push {r4-r7,lr}
	sub sp, 0x14
	adds r7, r0, 0
	adds r6, r1, 0
	ldrh r1, [r6]
	ldrb r2, [r6, 0xC]
	movs r3, 0x1
	str r3, [sp]
	ldr r0, [r6, 0x1C]
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	ldr r0, [r6, 0x14]
	str r0, [sp, 0xC]
	adds r0, r7, 0
	movs r3, 0
	bl sub_803DA54
	movs r5, 0
	adds r4, r6, 0x4
_0803E0CA:
	ldrh r1, [r4]
	lsls r2, r5, 24
	lsrs r2, 24
	adds r0, r7, 0
	bl sub_803E964
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803E0CA
	adds r2, r6, 0
	adds r2, 0xD
	adds r0, r7, 0
	movs r1, 0x15
	bl sub_804037C
	adds r2, r6, 0x2
	adds r0, r7, 0
	movs r1, 0xC
	bl sub_804037C
	adds r2, r6, 0
	adds r2, 0x20
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_804037C
	adds r2, r6, 0
	adds r2, 0x2B
	adds r0, r7, 0
	movs r1, 0x20
	bl sub_804037C
	adds r2, r6, 0
	adds r2, 0xE
	adds r0, r7, 0
	movs r1, 0x1A
	bl sub_804037C
	adds r2, r6, 0
	adds r2, 0xF
	adds r0, r7, 0
	movs r1, 0x1B
	bl sub_804037C
	adds r2, r6, 0
	adds r2, 0x10
	adds r0, r7, 0
	movs r1, 0x1C
	bl sub_804037C
	adds r2, r6, 0
	adds r2, 0x11
	adds r0, r7, 0
	movs r1, 0x1D
	bl sub_804037C
	adds r2, r6, 0
	adds r2, 0x12
	adds r0, r7, 0
	movs r1, 0x1E
	bl sub_804037C
	adds r2, r6, 0
	adds r2, 0x13
	adds r0, r7, 0
	movs r1, 0x1F
	bl sub_804037C
	ldrb r0, [r6, 0x1B]
	lsrs r0, 7
	add r1, sp, 0x10
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x2E
	add r2, sp, 0x10
	bl sub_804037C
	add r1, sp, 0x10
	ldrb r0, [r6, 0x18]
	lsls r0, 27
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x27
	add r2, sp, 0x10
	bl sub_804037C
	add r1, sp, 0x10
	ldrh r0, [r6, 0x18]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x28
	add r2, sp, 0x10
	bl sub_804037C
	add r1, sp, 0x10
	ldrb r0, [r6, 0x19]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x29
	add r2, sp, 0x10
	bl sub_804037C
	add r1, sp, 0x10
	ldr r0, [r6, 0x18]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x2A
	add r2, sp, 0x10
	bl sub_804037C
	add r1, sp, 0x10
	ldrh r0, [r6, 0x1A]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x2B
	add r2, sp, 0x10
	bl sub_804037C
	add r1, sp, 0x10
	ldrb r0, [r6, 0x1B]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x2C
	add r2, sp, 0x10
	bl sub_804037C
	adds r0, r7, 0
	bl sub_803E47C
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_803E0A4

	thumb_func_start sub_803E1EC
sub_803E1EC: @ 803E1EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	mov r8, r0
	ldr r4, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	ldr r5, [sp, 0x34]
	ldr r7, [sp, 0x38]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	str r0, [sp, 0x10]
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	str r7, [sp, 0xC]
	mov r0, r8
	bl sub_803DA54
	mov r0, r8
	movs r1, 0x50
	add r2, sp, 0x10
	bl sub_804037C
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_803E1EC

	thumb_func_start sub_803E23C
sub_803E23C: @ 803E23C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	adds r6, r1, 0
	movs r1, 0xB
	movs r2, 0
	bl sub_803FBE8
	strh r0, [r6]
	adds r0, r7, 0
	movs r1, 0xC
	movs r2, 0
	bl sub_803FBE8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803E266
	movs r0, 0
_0803E266:
	strh r0, [r6, 0x2]
	movs r5, 0
	movs r0, 0x2B
	adds r0, r6
	mov r8, r0
	movs r1, 0x20
	adds r1, r6
	mov r9, r1
	adds r4, r6, 0x4
_0803E278:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r7, 0
	movs r2, 0
	bl sub_803FBE8
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803E278
	adds r0, r7, 0
	movs r1, 0x38
	movs r2, 0
	bl sub_803FBE8
	strb r0, [r6, 0xC]
	adds r0, r7, 0
	movs r1, 0x15
	movs r2, 0
	bl sub_803FBE8
	strb r0, [r6, 0xD]
	adds r0, r7, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_803FBE8
	str r0, [r6, 0x14]
	adds r0, r7, 0
	movs r1, 0x1A
	movs r2, 0
	bl sub_803FBE8
	strb r0, [r6, 0xE]
	adds r0, r7, 0
	movs r1, 0x1B
	movs r2, 0
	bl sub_803FBE8
	strb r0, [r6, 0xF]
	adds r0, r7, 0
	movs r1, 0x1C
	movs r2, 0
	bl sub_803FBE8
	strb r0, [r6, 0x10]
	adds r0, r7, 0
	movs r1, 0x1D
	movs r2, 0
	bl sub_803FBE8
	strb r0, [r6, 0x11]
	adds r0, r7, 0
	movs r1, 0x1E
	movs r2, 0
	bl sub_803FBE8
	strb r0, [r6, 0x12]
	adds r0, r7, 0
	movs r1, 0x1F
	movs r2, 0
	bl sub_803FBE8
	strb r0, [r6, 0x13]
	adds r0, r7, 0
	movs r1, 0x20
	movs r2, 0
	bl sub_803FBE8
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x27
	movs r2, 0
	bl sub_803FBE8
	movs r4, 0x1F
	ands r0, r4
	ldrb r2, [r6, 0x18]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, 0x18]
	adds r0, r7, 0
	movs r1, 0x28
	movs r2, 0
	bl sub_803FBE8
	movs r5, 0x1F
	ands r0, r5
	lsls r0, 5
	ldrh r2, [r6, 0x18]
	ldr r1, _0803E3DC @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, 0x18]
	adds r0, r7, 0
	movs r1, 0x29
	movs r2, 0
	bl sub_803FBE8
	ands r0, r4
	lsls r0, 2
	ldrb r2, [r6, 0x19]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, 0x19]
	adds r0, r7, 0
	movs r1, 0x2A
	movs r2, 0
	bl sub_803FBE8
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [r6, 0x18]
	ldr r2, _0803E3E0 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [r6, 0x18]
	adds r0, r7, 0
	movs r1, 0x2B
	movs r2, 0
	bl sub_803FBE8
	ands r0, r5
	lsls r0, 4
	ldrh r2, [r6, 0x1A]
	ldr r1, _0803E3E4 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, 0x1A]
	adds r0, r7, 0
	movs r1, 0x2C
	movs r2, 0
	bl sub_803FBE8
	ands r0, r4
	lsls r0, 1
	ldrb r2, [r6, 0x1B]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, 0x1B]
	adds r0, r7, 0
	movs r1, 0x2E
	movs r2, 0
	bl sub_803FBE8
	lsls r0, 7
	ldrb r2, [r6, 0x1B]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, 0x1B]
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	bl sub_803FBE8
	str r0, [r6, 0x1C]
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, r9
	bl sub_803FBE8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E3DC: .4byte 0xfffffc1f
_0803E3E0: .4byte 0xfff07fff
_0803E3E4: .4byte 0xfffffe0f
	thumb_func_end sub_803E23C

	thumb_func_start sub_803E3E8
sub_803E3E8: @ 803E3E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	movs r6, 0
	ldr r1, [r4]
	movs r2, 0
	bl sub_803F940
	adds r5, r0, 0
	ldr r1, [r4]
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_803F940
	adds r7, r0, 0
	ldr r1, [r4]
	adds r0, r4, 0
	movs r2, 0x2
	bl sub_803F940
	mov r8, r0
	ldr r1, [r4]
	adds r0, r4, 0
	movs r2, 0x3
	bl sub_803F940
	adds r3, r0, 0
	movs r1, 0x5
_0803E422:
	ldrh r0, [r5]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r5, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0803E422
	adds r2, r7, 0
	movs r1, 0x5
_0803E436:
	ldrh r0, [r2]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0803E436
	mov r2, r8
	movs r1, 0x5
_0803E44A:
	ldrh r0, [r2]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0803E44A
	adds r2, r3, 0
	movs r1, 0x5
_0803E45E:
	ldrh r0, [r2]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0803E45E
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_803E3E8

	thumb_func_start sub_803E47C
sub_803E47C: @ 803E47C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x40
	adds r5, r0, 0
	movs r1, 0x3A
	movs r2, 0
	bl sub_803FBE8
	mov r8, r0
	adds r0, r5, 0
	movs r1, 0x39
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp, 0x1C]
	adds r0, r5, 0
	movs r1, 0x27
	movs r2, 0
	bl sub_803FBE8
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0x1A
	movs r2, 0
	bl sub_803FBE8
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0x28
	movs r2, 0
	bl sub_803FBE8
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x1B
	movs r2, 0
	bl sub_803FBE8
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0x29
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp, 0x20]
	adds r0, r5, 0
	movs r1, 0x1C
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp, 0x24]
	adds r0, r5, 0
	movs r1, 0x2A
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp, 0x28]
	adds r0, r5, 0
	movs r1, 0x1D
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp, 0x2C]
	adds r0, r5, 0
	movs r1, 0x2B
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp, 0x30]
	adds r0, r5, 0
	movs r1, 0x1E
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp, 0x34]
	adds r0, r5, 0
	movs r1, 0x2C
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp, 0x38]
	adds r0, r5, 0
	movs r1, 0x1F
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp, 0x3C]
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl sub_803FBE8
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r5, 0
	bl sub_803E7C4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x38
	mov r2, sp
	bl sub_804037C
	ldr r0, _0803E564 @ =0x0000012f
	cmp r7, r0
	bne _0803E568
	movs r0, 0x1
	str r0, [sp, 0x4]
	lsls r6, r7, 3
	b _0803E596
	.align 2, 0
_0803E564: .4byte 0x0000012f
_0803E568:
	ldr r1, _0803E734 @ =gUnknown_8254784
	lsls r2, r7, 3
	subs r0, r2, r7
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, r0, r6
	adds r0, r4, 0
	adds r6, r2, 0
	cmp r0, 0
	bge _0803E582
	adds r0, 0x3
_0803E582:
	asrs r0, 2
	adds r0, r1, r0
	ldr r4, [sp]
	muls r0, r4
	movs r1, 0x64
	bl __divsi3
	adds r0, r4
	adds r0, 0xA
	str r0, [sp, 0x4]
_0803E596:
	ldr r1, _0803E738 @ =gUnknown_2023FC4
	add r2, sp, 0x4
	ldrb r0, [r2]
	mov r3, r8
	subs r0, r3
	adds r1, 0x23
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _0803E5AE
	movs r0, 0x1
	strb r0, [r1]
_0803E5AE:
	adds r0, r5, 0
	movs r1, 0x3A
	bl sub_804037C
	ldr r0, _0803E734 @ =gUnknown_8254784
	subs r1, r6, r7
	lsls r1, 2
	adds r6, r1, r0
	ldrb r0, [r6, 0x1]
	lsls r0, 1
	mov r2, r10
	adds r1, r0, r2
	mov r0, r9
	cmp r0, 0
	bge _0803E5CE
	adds r0, 0x3
_0803E5CE:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0x8]
	adds r0, r5, 0
	bl sub_8042E9C
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0x8
	ldrh r1, [r4]
	movs r2, 0x1
	bl sub_8043698
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3B
	adds r2, r4, 0
	bl sub_804037C
	ldrb r0, [r6, 0x2]
	lsls r0, 1
	ldr r3, [sp, 0x20]
	adds r1, r0, r3
	ldr r0, [sp, 0x24]
	cmp r0, 0
	bge _0803E614
	adds r0, 0x3
_0803E614:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0xC]
	adds r0, r5, 0
	bl sub_8042E9C
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0xC
	ldrh r1, [r4]
	movs r2, 0x2
	bl sub_8043698
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0x3C
	adds r2, r4, 0
	bl sub_804037C
	ldrb r0, [r6, 0x3]
	lsls r0, 1
	ldr r2, [sp, 0x28]
	adds r1, r0, r2
	ldr r0, [sp, 0x2C]
	cmp r0, 0
	bge _0803E65A
	adds r0, 0x3
_0803E65A:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0x10]
	adds r0, r5, 0
	bl sub_8042E9C
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0x10
	ldrh r1, [r4]
	movs r2, 0x3
	bl sub_8043698
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x3D
	adds r2, r4, 0
	bl sub_804037C
	ldrb r0, [r6, 0x4]
	lsls r0, 1
	ldr r3, [sp, 0x30]
	adds r1, r0, r3
	ldr r0, [sp, 0x34]
	cmp r0, 0
	bge _0803E6A0
	adds r0, 0x3
_0803E6A0:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0x14]
	adds r0, r5, 0
	bl sub_8042E9C
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0x14
	ldrh r1, [r4]
	movs r2, 0x4
	bl sub_8043698
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
	adds r0, r5, 0
	movs r1, 0x3E
	adds r2, r4, 0
	bl sub_804037C
	ldrb r0, [r6, 0x5]
	lsls r0, 1
	ldr r2, [sp, 0x38]
	adds r1, r0, r2
	ldr r0, [sp, 0x3C]
	cmp r0, 0
	bge _0803E6E6
	adds r0, 0x3
_0803E6E6:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0x18]
	adds r0, r5, 0
	bl sub_8042E9C
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0x18
	ldrh r1, [r4]
	movs r2, 0x5
	bl sub_8043698
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
	adds r0, r5, 0
	movs r1, 0x3F
	adds r2, r4, 0
	bl sub_804037C
	ldr r0, _0803E73C @ =0x0000012f
	cmp r7, r0
	bne _0803E740
	ldr r0, [sp, 0x1C]
	cmp r0, 0
	bne _0803E72E
	mov r3, r8
	cmp r3, 0
	bne _0803E764
_0803E72E:
	movs r0, 0x1
	b _0803E758
	.align 2, 0
_0803E734: .4byte gUnknown_8254784
_0803E738: .4byte gUnknown_2023FC4
_0803E73C: .4byte 0x0000012f
_0803E740:
	ldr r1, [sp, 0x1C]
	cmp r1, 0
	bne _0803E750
	mov r0, r8
	cmp r0, 0
	bne _0803E764
	ldr r0, [sp, 0x4]
	b _0803E758
_0803E750:
	ldr r0, [sp, 0x4]
	mov r2, r8
	subs r0, r2
	adds r0, r1, r0
_0803E758:
	str r0, [sp, 0x1C]
	add r2, sp, 0x1C
	adds r0, r5, 0
	movs r1, 0x39
	bl sub_804037C
_0803E764:
	add sp, 0x40
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_803E47C

	thumb_func_start sub_803E774
sub_803E774: @ 803E774
	push {r4,lr}
	sub sp, 0x4
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r2, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x37
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3A
	mov r2, sp
	bl sub_804037C
	movs r0, 0xFF
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x40
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	bl sub_803E47C
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_803E774

	thumb_func_start sub_803E7C4
sub_803E7C4: @ 803E7C4
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl sub_803FBE8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x19
	movs r2, 0
	bl sub_803FBE8
	adds r3, r0, 0
	movs r2, 0x1
	ldr r6, _0803E828 @ =gUnknown_8253AE4
	ldr r1, _0803E82C @ =gUnknown_8254784
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x13]
	movs r5, 0xCA
	lsls r5, 1
	muls r0, r5
	adds r0, 0x4
	adds r0, r6
	ldr r0, [r0]
	cmp r0, r3
	bhi _0803E81A
	adds r4, r1, 0
_0803E804:
	adds r2, 0x1
	cmp r2, 0x64
	bgt _0803E81A
	lsls r1, r2, 2
	ldrb r0, [r4, 0x13]
	muls r0, r5
	adds r1, r0
	adds r1, r6
	ldr r0, [r1]
	cmp r0, r3
	bls _0803E804
_0803E81A:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803E828: .4byte gUnknown_8253AE4
_0803E82C: .4byte gUnknown_8254784
	thumb_func_end sub_803E7C4

	thumb_func_start sub_803E830
sub_803E830: @ 803E830
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl sub_803FD44
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x19
	movs r2, 0
	bl sub_803FD44
	adds r3, r0, 0
	movs r2, 0x1
	ldr r6, _0803E894 @ =gUnknown_8253AE4
	ldr r1, _0803E898 @ =gUnknown_8254784
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x13]
	movs r5, 0xCA
	lsls r5, 1
	muls r0, r5
	adds r0, 0x4
	adds r0, r6
	ldr r0, [r0]
	cmp r0, r3
	bhi _0803E886
	adds r4, r1, 0
_0803E870:
	adds r2, 0x1
	cmp r2, 0x64
	bgt _0803E886
	lsls r1, r2, 2
	ldrb r0, [r4, 0x13]
	muls r0, r5
	adds r1, r0
	adds r1, r6
	ldr r0, [r1]
	cmp r0, r3
	bls _0803E870
_0803E886:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803E894: .4byte gUnknown_8253AE4
_0803E898: .4byte gUnknown_8254784
	thumb_func_end sub_803E830

	thumb_func_start sub_803E89C
sub_803E89C: @ 803E89C
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_803E8B0
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_803E89C

	thumb_func_start sub_803E8B0
sub_803E8B0: @ 803E8B0
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	mov r6, sp
_0803E8BE:
	adds r4, r5, 0
	adds r4, 0xD
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_803FD44
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0803E8FC
	adds r0, r7, 0
	adds r1, r4, 0
	mov r2, sp
	bl sub_80404D0
	adds r1, r5, 0
	adds r1, 0x11
	ldrh r0, [r6]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _0803E8F8 @ =gUnknown_8250C08
	adds r2, r0
	adds r0, r7, 0
	bl sub_80404D0
	ldrh r0, [r6]
	b _0803E914
	.align 2, 0
_0803E8F8: .4byte gUnknown_8250C08
_0803E8FC:
	ldrh r1, [r6]
	cmp r0, r1
	bne _0803E90C
	ldr r0, _0803E908 @ =0x0000fffe
	b _0803E914
	.align 2, 0
_0803E908: .4byte 0x0000fffe
_0803E90C:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803E8BE
	ldr r0, _0803E91C @ =0x0000ffff
_0803E914:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E91C: .4byte 0x0000ffff
	thumb_func_end sub_803E8B0

	thumb_func_start sub_803E920
sub_803E920: @ 803E920
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	movs r3, 0
	adds r5, r0, 0
	adds r5, 0x24
	ldr r2, _0803E94C @ =gUnknown_8250C04
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r2, r1, r2
	adds r1, r0, 0
	adds r1, 0xC
_0803E93A:
	ldrh r0, [r1]
	cmp r0, 0
	bne _0803E950
	strh r4, [r1]
	adds r1, r5, r3
	ldrb r0, [r2, 0x4]
	strb r0, [r1]
	adds r0, r4, 0
	b _0803E95A
	.align 2, 0
_0803E94C: .4byte gUnknown_8250C04
_0803E950:
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _0803E93A
	ldr r0, _0803E960 @ =0x0000ffff
_0803E95A:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803E960: .4byte 0x0000ffff
	thumb_func_end sub_803E920

	thumb_func_start sub_803E964
sub_803E964: @ 803E964
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r2, 0
	mov r0, sp
	strh r1, [r0]
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r5, 0
	mov r2, sp
	bl sub_804037C
	adds r4, 0x11
	mov r0, sp
	ldrh r0, [r0]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _0803E9A0 @ =gUnknown_8250C08
	adds r2, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_804037C
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803E9A0: .4byte gUnknown_8250C08
	thumb_func_end sub_803E964

	thumb_func_start sub_803E9A4
sub_803E9A4: @ 803E9A4
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r4, r2, 1
	adds r3, r0, 0
	adds r3, 0xC
	adds r3, r4
	strh r1, [r3]
	adds r0, 0x24
	adds r0, r2
	ldr r3, _0803E9D0 @ =gUnknown_8250C04
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrb r1, [r2, 0x4]
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E9D0: .4byte gUnknown_8250C04
	thumb_func_end sub_803E9A4

	thumb_func_start sub_803E9D4
sub_803E9D4: @ 803E9D4
	push {lr}
	bl sub_803E9E0
	pop {r0}
	bx r0
	thumb_func_end sub_803E9D4

	thumb_func_start sub_803E9E0
sub_803E9E0: @ 803E9E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	movs r1, 0xB
	movs r2, 0
	bl sub_803FD44
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	bl sub_803E830
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _0803EA7C @ =gUnknown_825D7B4
	lsls r6, r4, 2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrh r1, [r0]
	ldr r2, _0803EA80 @ =0xffff0000
	lsrs r0, r2, 16
	cmp r1, r0
	beq _0803EA6C
	mov r9, r2
	movs r3, 0
_0803EA1E:
	ldr r0, _0803EA7C @ =gUnknown_825D7B4
	adds r7, r6, r0
	ldr r0, [r7]
	adds r0, r3, r0
	ldrh r2, [r0]
	movs r1, 0xFE
	lsls r1, 8
	adds r0, r1, 0
	ands r0, r2
	mov r4, r10
	lsls r1, r4, 9
	cmp r0, r1
	bgt _0803EA6C
	ldr r1, _0803EA84 @ =0x000001ff
	adds r0, r1, 0
	adds r4, r0, 0
	ands r4, r2
	mov r0, r8
	adds r1, r4, 0
	str r3, [sp]
	bl sub_803E8B0
	lsls r0, 16
	mov r1, r9
	lsrs r5, r1, 16
	ldr r3, [sp]
	cmp r0, r9
	bne _0803EA60
	mov r0, r8
	adds r1, r4, 0
	bl sub_803EC40
	ldr r3, [sp]
_0803EA60:
	adds r3, 0x2
	ldr r0, [r7]
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, r5
	bne _0803EA1E
_0803EA6C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EA7C: .4byte gUnknown_825D7B4
_0803EA80: .4byte 0xffff0000
_0803EA84: .4byte 0x000001ff
	thumb_func_end sub_803E9E0

	thumb_func_start sub_803EA88
sub_803EA88: @ 803EA88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	lsls r4, r1, 24
	lsrs r4, 24
	movs r0, 0
	str r0, [sp]
	mov r0, r8
	movs r1, 0xB
	movs r2, 0
	bl sub_803FBE8
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl sub_803FBE8
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r4, 0
	beq _0803EB20
	ldr r4, _0803EB0C @ =gUnknown_2024028
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r4]
	ldr r2, _0803EB10 @ =gUnknown_825D7B4
	mov r5, r9
	lsls r3, r5, 2
	adds r5, r3, r2
	ldr r0, [r5]
	ldrh r1, [r0]
	movs r7, 0xFE
	lsls r7, 8
	adds r0, r7, 0
	ands r0, r1
	adds r6, r4, 0
	mov r12, r2
	mov r1, r10
	lsls r4, r1, 9
	cmp r0, r4
	beq _0803EB48
	adds r2, r6, 0
	ldr r0, _0803EB14 @ =0x0000ffff
	mov r12, r0
	adds r6, r7, 0
	adds r3, r5, 0
_0803EAF4:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldrb r0, [r2]
	ldr r1, [r3]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, r12
	bne _0803EB18
	movs r0, 0
	b _0803EB74
	.align 2, 0
_0803EB0C: .4byte gUnknown_2024028
_0803EB10: .4byte gUnknown_825D7B4
_0803EB14: .4byte 0x0000ffff
_0803EB18:
	adds r0, r6, 0
	ands r0, r1
	cmp r0, r4
	bne _0803EAF4
_0803EB20:
	ldr r3, _0803EB84 @ =gUnknown_825D7B4
	mov r1, r9
	lsls r4, r1, 2
	adds r1, r4, r3
	ldr r2, _0803EB88 @ =gUnknown_2024028
	ldrb r0, [r2]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r1
	mov r5, r10
	lsls r1, r5, 9
	adds r6, r2, 0
	mov r12, r3
	adds r3, r4, 0
	cmp r0, r1
	bne _0803EB72
_0803EB48:
	ldr r2, _0803EB8C @ =gUnknown_2024022
	mov r0, r12
	adds r1, r3, r0
	ldrb r0, [r6]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0803EB90 @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	ldrh r1, [r2]
	mov r0, r8
	bl sub_803E89C
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
_0803EB72:
	ldr r0, [sp]
_0803EB74:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803EB84: .4byte gUnknown_825D7B4
_0803EB88: .4byte gUnknown_2024028
_0803EB8C: .4byte gUnknown_2024022
_0803EB90: .4byte 0x000001ff
	thumb_func_end sub_803EA88

	thumb_func_start sub_803EB94
sub_803EB94: @ 803EB94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r4, 0
	add r7, sp, 0x8
	add r0, sp, 0xC
	mov r9, r0
	mov r5, sp
_0803EBB0:
	adds r1, r4, 0
	adds r1, 0xE
	adds r0, r6, 0
	movs r2, 0
	bl sub_803FBE8
	strh r0, [r5]
	adds r1, r4, 0
	adds r1, 0x12
	adds r0, r6, 0
	movs r2, 0
	bl sub_803FBE8
	adds r1, r7, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _0803EBB0
	adds r0, r6, 0
	movs r1, 0x15
	movs r2, 0
	bl sub_803FBE8
	mov r1, r9
	strb r0, [r1]
	ldrb r0, [r1]
	lsrs r0, 2
	strb r0, [r1]
	mov r0, sp
	mov r2, r8
	strh r2, [r0, 0x6]
	ldr r1, _0803EC3C @ =gUnknown_8250C04
	mov r2, r8
	lsls r0, r2, 1
	add r0, r8
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x4]
	strb r0, [r7, 0x3]
	movs r4, 0
	mov r5, sp
_0803EC04:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	adds r2, r5, 0
	bl sub_804037C
	adds r1, r4, 0
	adds r1, 0x11
	adds r2, r7, r4
	adds r0, r6, 0
	bl sub_804037C
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0803EC04
	adds r0, r6, 0
	movs r1, 0x15
	mov r2, r9
	bl sub_804037C
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EC3C: .4byte gUnknown_8250C04
	thumb_func_end sub_803EB94

	thumb_func_start sub_803EC40
sub_803EC40: @ 803EC40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r4, 0
	add r7, sp, 0x8
	add r0, sp, 0xC
	mov r9, r0
	mov r5, sp
_0803EC5C:
	adds r1, r4, 0
	adds r1, 0xE
	adds r0, r6, 0
	movs r2, 0
	bl sub_803FD44
	strh r0, [r5]
	adds r1, r4, 0
	adds r1, 0x12
	adds r0, r6, 0
	movs r2, 0
	bl sub_803FD44
	adds r1, r7, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _0803EC5C
	adds r0, r6, 0
	movs r1, 0x15
	movs r2, 0
	bl sub_803FD44
	mov r1, r9
	strb r0, [r1]
	ldrb r0, [r1]
	lsrs r0, 2
	strb r0, [r1]
	mov r0, sp
	mov r2, r8
	strh r2, [r0, 0x6]
	ldr r1, _0803ECE8 @ =gUnknown_8250C04
	mov r2, r8
	lsls r0, r2, 1
	add r0, r8
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x4]
	strb r0, [r7, 0x3]
	movs r4, 0
	mov r5, sp
_0803ECB0:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	adds r2, r5, 0
	bl sub_80404D0
	adds r1, r4, 0
	adds r1, 0x11
	adds r2, r7, r4
	adds r0, r6, 0
	bl sub_80404D0
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0803ECB0
	adds r0, r6, 0
	movs r1, 0x15
	mov r2, r9
	bl sub_80404D0
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803ECE8: .4byte gUnknown_8250C04
	thumb_func_end sub_803EC40

	.align 2, 0 @ Don't pad with nop.
