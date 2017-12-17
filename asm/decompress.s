	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_800EBB4
sub_800EBB4: @ 800EBB4
	push {lr}
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	thumb_func_end sub_800EBB4

	thumb_func_start sub_800EBC0
sub_800EBC0: @ 800EBC0
	push {lr}
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	thumb_func_end sub_800EBC0

	thumb_func_start sub_800EBCC
sub_800EBCC: @ 800EBCC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, [r4]
	ldr r5, _0800EBFC @ =gUnknown_201C000
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl sub_80086DC
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800EBFC: .4byte gUnknown_201C000
	thumb_func_end sub_800EBCC

	thumb_func_start sub_800EC00
sub_800EC00: @ 800EC00
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl sub_80086DC
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_800EC00

	thumb_func_start sub_800EC28
sub_800EC28: @ 800EC28
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5]
	ldr r4, _0800EC54 @ =gUnknown_201C000
	adds r1, r4, 0
	bl LZ77UnCompWram
	str r4, [sp]
	ldrh r2, [r5, 0x4]
	ldr r1, _0800EC58 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	bl sub_8008928
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EC54: .4byte gUnknown_201C000
_0800EC58: .4byte 0xffff0000
	thumb_func_end sub_800EC28

	thumb_func_start sub_800EC5C
sub_800EC5C: @ 800EC5C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, [r5]
	bl LZ77UnCompWram
	str r4, [sp]
	ldrh r2, [r5, 0x4]
	ldr r1, _0800EC88 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	bl sub_8008928
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EC88: .4byte 0xffff0000
	thumb_func_end sub_800EC5C

	thumb_func_start sub_800EC8C
sub_800EC8C: @ 800EC8C
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	ble _0800ECAC
	ldr r0, _0800ECA8 @ =gUnknown_82350AC
	ldr r0, [r0]
	bl LZ77UnCompWram
	b _0800ECB4
	.align 2, 0
_0800ECA8: .4byte gUnknown_82350AC
_0800ECAC:
	ldr r0, [r3]
	adds r1, r4, 0
	bl LZ77UnCompWram
_0800ECB4:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_800EDAC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_800EC8C

	thumb_func_start sub_800ECC4
sub_800ECC4: @ 800ECC4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r2, 3
	ldr r1, _0800ECEC @ =gUnknown_82350AC
	adds r0, r1
	movs r1, 0
	cmp r4, r0
	bne _0800ECDA
	movs r1, 0x1
_0800ECDA:
	str r1, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_800ECF0
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800ECEC: .4byte gUnknown_82350AC
	thumb_func_end sub_800ECC4

	thumb_func_start sub_800ECF0
sub_800ECF0: @ 800ECF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r7, r2, 0
	adds r5, r3, 0
	ldr r0, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r7, 0xC9
	bne _0800ED6C
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r5
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r5
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r5
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r5
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0800ED3E
	movs r1, 0xC9
	b _0800ED48
_0800ED3E:
	movs r2, 0xCE
	lsls r2, 1
	adds r0, r1, r2
	lsls r0, 16
	lsrs r1, r0, 16
_0800ED48:
	mov r0, r8
	cmp r0, 0
	bne _0800ED5C
	ldr r0, _0800ED58 @ =gUnknown_823654C
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	b _0800ED78
	.align 2, 0
_0800ED58: .4byte gUnknown_823654C
_0800ED5C:
	ldr r0, _0800ED68 @ =gUnknown_82350AC
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	b _0800ED78
	.align 2, 0
_0800ED68: .4byte gUnknown_82350AC
_0800ED6C:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	ble _0800ED84
	ldr r0, _0800ED80 @ =gUnknown_82350AC
	ldr r0, [r0]
_0800ED78:
	adds r1, r4, 0
	bl LZ77UnCompWram
	b _0800ED8C
	.align 2, 0
_0800ED80: .4byte gUnknown_82350AC
_0800ED84:
	ldr r0, [r6]
	adds r1, r4, 0
	bl LZ77UnCompWram
_0800ED8C:
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_800EDAC
	lsls r0, r7, 16
	lsrs r0, 16
	adds r1, r5, 0
	adds r2, r4, 0
	mov r3, r8
	bl sub_8043458
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800ECF0

	thumb_func_start sub_800EDAC
sub_800EDAC: @ 800EDAC
	push {lr}
	adds r3, r0, 0
	movs r0, 0xCD
	lsls r0, 1
	cmp r1, r0
	bne _0800EDC6
	movs r1, 0x80
	lsls r1, 4
	adds r0, r3, r1
	ldr r2, _0800EDCC @ =0x04000200
	adds r1, r3, 0
	bl CpuSet
_0800EDC6:
	pop {r0}
	bx r0
	.align 2, 0
_0800EDCC: .4byte 0x04000200
	thumb_func_end sub_800EDAC

	thumb_func_start sub_800EDD0
sub_800EDD0: @ 800EDD0
	push {lr}
	ldr r0, [r0]
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	thumb_func_end sub_800EDD0

	thumb_func_start sub_800EDDC
sub_800EDDC: @ 800EDDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	mov r9, r0
	str r1, [sp]
	str r2, [sp, 0x4]
	adds r5, r3, 0
	movs r0, 0x1
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	bne _0800EDFC
	b _0800EF94
_0800EDFC:
	asrs r0, r1, 1
	adds r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	movs r0, 0
	ldr r2, [sp]
	cmp r0, r2
	blt _0800EE10
	b _0800F024
_0800EE10:
	movs r4, 0x8
	subs r1, r4, r1
	str r1, [sp, 0x10]
_0800EE16:
	movs r7, 0
	adds r0, 0x1
	str r0, [sp, 0x14]
	ldr r0, [sp, 0x10]
	cmp r7, r0
	bge _0800EE92
	ldr r1, [sp, 0x8]
	lsls r1, 8
	str r1, [sp, 0x18]
	movs r2, 0
	mov r10, r2
	mov r0, r9
	movs r4, 0x8
	subs r0, r4, r0
	str r0, [sp, 0xC]
_0800EE34:
	movs r3, 0
	asrs r0, r7, 1
	adds r1, r7, 0
	movs r2, 0x1
	ands r1, r2
	str r1, [sp, 0x20]
	lsls r0, 8
	mov r8, r0
	mov r12, r5
_0800EE46:
	lsls r1, r3, 5
	ldr r4, [sp, 0x18]
	adds r0, r5, r4
	adds r0, r1
	mov r1, r8
	adds r2, r0, r1
	mov r1, r12
	add r1, r8
	movs r6, 0xF
_0800EE58:
	ldr r4, [sp, 0x20]
	cmp r4, 0
	bne _0800EE68
	strb r4, [r1]
	add r4, sp, 0x20
	ldrb r4, [r4]
	strb r4, [r2, 0x10]
	b _0800EE76
_0800EE68:
	mov r0, r10
	strb r0, [r1, 0x10]
	movs r4, 0x80
	lsls r4, 1
	adds r4, r2, r4
	str r4, [sp, 0x1C]
	strb r0, [r4]
_0800EE76:
	adds r2, 0x1
	adds r1, 0x1
	subs r6, 0x1
	cmp r6, 0
	bge _0800EE58
	movs r0, 0x20
	add r12, r0
	adds r3, 0x1
	cmp r3, 0x7
	ble _0800EE46
	adds r7, 0x1
	ldr r1, [sp, 0xC]
	cmp r7, r1
	blt _0800EE34
_0800EE92:
	movs r7, 0
	movs r2, 0
_0800EE96:
	movs r6, 0
	adds r4, r7, 0x1
	mov r8, r4
	lsls r4, r7, 5
_0800EE9E:
	adds r0, r6, 0x1
	mov r10, r0
	lsls r1, r6, 8
	adds r0, r1, 0
	adds r0, 0xC0
	adds r0, r5, r0
	adds r0, r4
	adds r1, r5, r1
	adds r1, r4
	movs r3, 0x1F
_0800EEB2:
	strb r2, [r1]
	strb r2, [r0]
	adds r0, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800EEB2
	mov r6, r10
	cmp r6, 0x7
	ble _0800EE9E
	mov r7, r8
	cmp r7, 0x1
	ble _0800EE96
	mov r1, r9
	cmp r1, 0x5
	bne _0800EED8
	movs r2, 0x90
	lsls r2, 1
	adds r5, r2
_0800EED8:
	movs r7, 0
	cmp r7, r9
	bge _0800EF6E
_0800EEDE:
	movs r3, 0
	adds r7, 0x1
	mov r8, r7
	cmp r3, r9
	bge _0800EF4E
_0800EEE8:
	adds r3, 0x1
	mov r10, r3
	ldr r4, [sp, 0x4]
	adds r4, 0x20
	adds r7, r5, 0
	adds r7, 0x20
	movs r0, 0x12
	adds r0, r5
	mov r12, r0
	ldr r2, [sp, 0x4]
	adds r3, r5, 0
	movs r6, 0x3
_0800EF00:
	ldrb r0, [r2]
	mov r1, r12
	strb r0, [r1]
	ldrb r0, [r2, 0x1]
	strb r0, [r1, 0x1]
	ldrb r0, [r2, 0x2]
	strb r0, [r1, 0x1E]
	ldrb r0, [r2, 0x3]
	strb r0, [r1, 0x1F]
	movs r0, 0x81
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r2, 0x10]
	strb r0, [r1]
	ldr r0, _0800EF58 @ =0x00000103
	adds r1, r3, r0
	ldrb r0, [r2, 0x11]
	strb r0, [r1]
	movs r0, 0x90
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r2, 0x12]
	strb r0, [r1]
	ldr r0, _0800EF5C @ =0x00000121
	adds r1, r3, r0
	ldrb r0, [r2, 0x13]
	strb r0, [r1]
	movs r1, 0x4
	add r12, r1
	adds r2, 0x4
	adds r3, 0x4
	subs r6, 0x1
	cmp r6, 0
	bge _0800EF00
	str r4, [sp, 0x4]
	adds r5, r7, 0
	mov r3, r10
	cmp r3, r9
	blt _0800EEE8
_0800EF4E:
	mov r2, r9
	cmp r2, 0x7
	bne _0800EF60
	adds r5, 0x20
	b _0800EF68
	.align 2, 0
_0800EF58: .4byte 0x00000103
_0800EF5C: .4byte 0x00000121
_0800EF60:
	mov r4, r9
	cmp r4, 0x5
	bne _0800EF68
	adds r5, 0x60
_0800EF68:
	mov r7, r8
	cmp r7, r9
	blt _0800EEDE
_0800EF6E:
	mov r0, r9
	cmp r0, 0x7
	bne _0800EF7C
	movs r1, 0x80
	lsls r1, 1
	adds r5, r1
	b _0800EF88
_0800EF7C:
	mov r2, r9
	cmp r2, 0x5
	bne _0800EF88
	movs r4, 0xF0
	lsls r4, 1
	adds r5, r4
_0800EF88:
	ldr r0, [sp, 0x14]
	ldr r1, [sp]
	cmp r0, r1
	bge _0800EF92
	b _0800EE16
_0800EF92:
	b _0800F024
_0800EF94:
	movs r6, 0
	ldr r2, [sp]
	cmp r6, r2
	bge _0800F024
_0800EF9C:
	adds r6, 0x1
	mov r10, r6
	mov r4, r9
	cmp r4, 0x6
	bne _0800EFB4
	movs r0, 0
	movs r3, 0xFF
_0800EFAA:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800EFAA
_0800EFB4:
	movs r7, 0
	cmp r7, r9
	bge _0800F008
_0800EFBA:
	adds r7, 0x1
	mov r8, r7
	mov r1, r9
	lsls r0, r1, 5
	cmp r1, 0x6
	bne _0800EFD4
	movs r1, 0
	movs r3, 0x1F
_0800EFCA:
	strb r1, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800EFCA
_0800EFD4:
	adds r1, r0, 0
	cmp r1, 0
	ble _0800EFEE
	adds r3, r1, 0
_0800EFDC:
	ldr r2, [sp, 0x4]
	ldrb r0, [r2]
	strb r0, [r5]
	adds r2, 0x1
	str r2, [sp, 0x4]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800EFDC
_0800EFEE:
	mov r4, r9
	cmp r4, 0x6
	bne _0800F002
	movs r0, 0
	movs r3, 0x1F
_0800EFF8:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800EFF8
_0800F002:
	mov r7, r8
	cmp r7, r9
	blt _0800EFBA
_0800F008:
	mov r0, r9
	cmp r0, 0x6
	bne _0800F01C
	movs r0, 0
	movs r3, 0xFF
_0800F012:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800F012
_0800F01C:
	mov r6, r10
	ldr r1, [sp]
	cmp r6, r1
	blt _0800EF9C
_0800F024:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800EDDC

	thumb_func_start sub_800F034
sub_800F034: @ 800F034
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, [r4]
	ldr r0, [r0]
	lsrs r0, 8
	bl sub_8002BB0
	adds r5, r0, 0
	cmp r5, 0
	beq _0800F06E
	ldr r0, [r4]
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl sub_80086DC
	adds r0, r5, 0
	bl sub_8002BC4
	movs r0, 0
	b _0800F070
_0800F06E:
	movs r0, 0x1
_0800F070:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_800F034

	thumb_func_start sub_800F078
sub_800F078: @ 800F078
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, [r4]
	ldr r0, [r0]
	lsrs r0, 8
	bl sub_8002BB0
	adds r5, r0, 0
	cmp r5, 0
	beq _0800F0B8
	ldr r0, [r4]
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r2, [r4, 0x4]
	ldr r1, _0800F0B4 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	bl sub_8008928
	adds r0, r5, 0
	bl sub_8002BC4
	movs r0, 0
	b _0800F0BA
	.align 2, 0
_0800F0B4: .4byte 0xffff0000
_0800F0B8:
	movs r0, 0x1
_0800F0BA:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_800F078

	thumb_func_start sub_800F0C4
sub_800F0C4: @ 800F0C4
	sub sp, 0x4
	mov r3, sp
	ldrb r2, [r0, 0x1]
	mov r1, sp
	strb r2, [r1]
	ldrb r1, [r0, 0x2]
	strb r1, [r3, 0x1]
	ldrb r0, [r0, 0x3]
	strb r0, [r3, 0x2]
	movs r0, 0
	strb r0, [r3, 0x3]
	ldr r0, [sp]
	add sp, 0x4
	bx lr
	thumb_func_end sub_800F0C4

	thumb_func_start sub_800F0E0
sub_800F0E0: @ 800F0E0
	push {lr}
	adds r3, r0, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r2, r0
	ble _0800F0FC
	ldr r0, _0800F0F8 @ =gUnknown_82350AC
	ldr r0, [r0]
	bl LZ77UnCompWram
	b _0800F102
	.align 2, 0
_0800F0F8: .4byte gUnknown_82350AC
_0800F0FC:
	ldr r0, [r3]
	bl LZ77UnCompWram
_0800F102:
	pop {r0}
	bx r0
	thumb_func_end sub_800F0E0

	thumb_func_start sub_800F108
sub_800F108: @ 800F108
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r2, 3
	ldr r1, _0800F130 @ =gUnknown_82350AC
	adds r0, r1
	movs r1, 0
	cmp r4, r0
	bne _0800F11E
	movs r1, 0x1
_0800F11E:
	str r1, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_800F134
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F130: .4byte gUnknown_82350AC
	thumb_func_end sub_800F108

	thumb_func_start sub_800F134
sub_800F134: @ 800F134
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r7, r2, 0
	adds r4, r3, 0
	ldr r0, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r7, 0xC9
	bne _0800F1B0
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
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0800F182
	movs r1, 0xC9
	b _0800F18C
_0800F182:
	movs r2, 0xCE
	lsls r2, 1
	adds r0, r1, r2
	lsls r0, 16
	lsrs r1, r0, 16
_0800F18C:
	mov r0, r8
	cmp r0, 0
	bne _0800F1A0
	ldr r0, _0800F19C @ =gUnknown_823654C
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	b _0800F1BC
	.align 2, 0
_0800F19C: .4byte gUnknown_823654C
_0800F1A0:
	ldr r0, _0800F1AC @ =gUnknown_82350AC
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	b _0800F1BC
	.align 2, 0
_0800F1AC: .4byte gUnknown_82350AC
_0800F1B0:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	ble _0800F1C8
	ldr r0, _0800F1C4 @ =gUnknown_82350AC
	ldr r0, [r0]
_0800F1BC:
	adds r1, r5, 0
	bl LZ77UnCompWram
	b _0800F1D0
	.align 2, 0
_0800F1C4: .4byte gUnknown_82350AC
_0800F1C8:
	ldr r0, [r6]
	adds r1, r5, 0
	bl LZ77UnCompWram
_0800F1D0:
	lsls r0, r7, 16
	lsrs r0, 16
	adds r1, r4, 0
	adds r2, r5, 0
	mov r3, r8
	bl sub_8043458
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800F134

	.align 2, 0 @ Don't pad with nop.
