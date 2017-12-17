	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813EC8C
sub_813EC8C: @ 813EC8C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	ldr r7, _0813ECE0 @ =gUnknown_2036DFC
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r3, r0, 3
	ldr r5, _0813ECE4 @ =gUnknown_3005098
	adds r6, r1, 0
	movs r1, 0
_0813ECA2:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0813ECA2
	ldr r0, [r7, 0x4]
	adds r1, r4, 0
	bl sub_813EE14
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813ECFC
	bl sub_813F3EC
	ldr r0, _0813ECE8 @ =gUnknown_3005090
	adds r1, r6, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x14
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _0813ECF0
	ldr r0, _0813ECEC @ =sub_813EDB0
	str r0, [r1]
	b _0813ED08
	.align 2, 0
_0813ECE0: .4byte gUnknown_2036DFC
_0813ECE4: .4byte gUnknown_3005098
_0813ECE8: .4byte gUnknown_3005090
_0813ECEC: .4byte sub_813EDB0
_0813ECF0:
	ldr r0, _0813ECF8 @ =sub_813ED3C
	str r0, [r1]
	b _0813ED08
	.align 2, 0
_0813ECF8: .4byte sub_813ED3C
_0813ECFC:
	ldr r2, _0813ED10 @ =gUnknown_8416513
	ldr r3, _0813ED14 @ =sub_813ED18
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageOnField
_0813ED08:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813ED10: .4byte gUnknown_8416513
_0813ED14: .4byte sub_813ED18
	thumb_func_end sub_813EC8C

	thumb_func_start sub_813ED18
sub_813ED18: @ 813ED18
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6F54
	bl sub_80696C0
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813ED18

	thumb_func_start sub_813ED3C
sub_813ED3C: @ 813ED3C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 3
	ldr r7, _0813ED80 @ =gUnknown_3005098
	adds r4, r6, r7
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	movs r1, 0x19
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _0813EDA2
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl sub_813F2F0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813ED88
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813ED84 @ =sub_813F364
	str r1, [r0]
	b _0813EDA8
	.align 2, 0
_0813ED80: .4byte gUnknown_3005098
_0813ED84: .4byte sub_813F364
_0813ED88:
	movs r0, 0x41
	bl sub_80722CC
	ldrb r0, [r4, 0xA]
	adds r1, r5, 0
	bl sub_813F40C
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
_0813EDA2:
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
_0813EDA8:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813ED3C

	thumb_func_start sub_813EDB0
sub_813EDB0: @ 813EDB0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r5, r1, 3
	ldr r6, _0813EDE4 @ =gUnknown_3005098
	adds r4, r5, r6
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	movs r1, 0x19
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _0813EE08
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813EDEC
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _0813EDE8 @ =sub_813F3A8
	str r1, [r0]
	b _0813EE0E
	.align 2, 0
_0813EDE4: .4byte gUnknown_3005098
_0813EDE8: .4byte sub_813F3A8
_0813EDEC:
	movs r0, 0x41
	bl sub_80722CC
	bl sub_813F5AC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
_0813EE08:
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
_0813EE0E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813EDB0

	thumb_func_start sub_813EE14
sub_813EE14: @ 813EE14
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldr r1, _0813EEC8 @ =gUnknown_3005090
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	movs r3, 0
	mov r0, r8
	ldrb r0, [r0, 0x3]
	cmp r3, r0
	bge _0813EF04
_0813EE4E:
	lsls r3, 16
	asrs r1, r3, 16
	mov r0, r8
	ldr r2, [r0, 0x10]
	lsls r0, r1, 1
	adds r0, r1
	lsls r7, r0, 2
	adds r1, r7, r2
	ldrb r0, [r1, 0x5]
	mov r10, r3
	cmp r0, 0x7
	bne _0813EEF2
	ldr r0, [r1, 0x8]
	movs r1, 0x1
	bl sub_80CC44C
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E6D0
	lsls r0, 24
	cmp r0, 0
	bne _0813EEF2
	mov r1, r8
	ldr r2, [r1, 0x10]
	adds r2, r7, r2
	ldrh r0, [r2]
	adds r0, 0x7
	mov r1, sp
	ldrh r1, [r1]
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r2, 0x2]
	adds r0, 0x7
	mov r3, sp
	ldrh r1, [r3, 0x2]
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	ldr r0, [r2, 0x8]
	movs r1, 0x3
	bl sub_80CC44C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _0813EECC
	cmp r5, 0
	bne _0813EEF2
	cmp r4, 0
	bne _0813EEF2
	mov r1, r8
	ldr r0, [r1, 0x10]
	adds r0, r7, r0
	ldr r1, [r0, 0x8]
	mov r0, r9
	bl sub_813EF40
	b _0813EF2E
	.align 2, 0
_0813EEC8: .4byte gUnknown_3005090
_0813EECC:
	lsls r0, r5, 16
	asrs r1, r0, 16
	movs r2, 0xE0
	lsls r2, 11
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xE
	bhi _0813EEF2
	lsls r0, r6, 16
	asrs r2, r0, 16
	movs r3, 0x5
	negs r3, r3
	cmp r2, r3
	blt _0813EEF2
	cmp r2, 0x5
	bgt _0813EEF2
	mov r0, r9
	bl sub_813F220
_0813EEF2:
	movs r0, 0x80
	lsls r0, 9
	add r0, r10
	lsrs r3, r0, 16
	asrs r0, 16
	mov r1, r8
	ldrb r1, [r1, 0x3]
	cmp r0, r1
	blt _0813EE4E
_0813EF04:
	mov r0, r9
	bl sub_813F108
	ldr r0, _0813EF24 @ =gUnknown_3005090
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _0813EF28
	movs r0, 0
	b _0813EF30
	.align 2, 0
_0813EF24: .4byte gUnknown_3005090
_0813EF28:
	mov r0, r9
	bl sub_813EF9C
_0813EF2E:
	movs r0, 0x1
_0813EF30:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_813EE14

	thumb_func_start sub_813EF40
sub_813EF40: @ 813EF40
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0813EF8C @ =gUnknown_3005098
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80CC44C
	ldr r1, _0813EF90 @ =gUnknown_20370C0
	strh r0, [r1]
	adds r0, r5, 0
	movs r1, 0
	bl sub_80CC44C
	ldr r1, _0813EF94 @ =gUnknown_20370C2
	strh r0, [r1]
	ldr r0, _0813EF98 @ =gUnknown_20370C4
	movs r5, 0x1
	strh r5, [r0]
	ldrh r1, [r1]
	movs r0, 0
	bl sub_80CBED4
	strh r5, [r4, 0x4]
	movs r0, 0
	strh r0, [r4]
	strh r0, [r4, 0x2]
	movs r0, 0x3
	strh r0, [r4, 0x8]
	strh r5, [r4, 0xC]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813EF8C: .4byte gUnknown_3005098
_0813EF90: .4byte gUnknown_20370C0
_0813EF94: .4byte gUnknown_20370C2
_0813EF98: .4byte gUnknown_20370C4
	thumb_func_end sub_813EF40

	thumb_func_start sub_813EF9C
sub_813EF9C: @ 813EF9C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813EFEC @ =gUnknown_3005098
	adds r1, r0
	ldrh r3, [r1, 0x2]
	ldrh r2, [r1]
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _0813EFBC
	cmp r3, 0
	beq _0813EFF8
_0813EFBC:
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bge _0813EFCA
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
_0813EFCA:
	movs r4, 0x2
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bge _0813EFD8
	negs r0, r0
	lsls r0, 16
	lsrs r3, r0, 16
_0813EFD8:
	lsls r0, r2, 16
	asrs r2, r0, 16
	lsls r0, r3, 16
	asrs r0, 16
	cmp r2, r0
	ble _0813EFF0
	cmp r2, 0x3
	ble _0813EFF8
	movs r0, 0x2
	b _0813EFFA
	.align 2, 0
_0813EFEC: .4byte gUnknown_3005098
_0813EFF0:
	cmp r0, 0x3
	ble _0813EFF8
	movs r0, 0x2
	b _0813EFFA
_0813EFF8:
	movs r0, 0x4
_0813EFFA:
	strh r0, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813EF9C

	thumb_func_start sub_813F004
sub_813F004: @ 813F004
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldrb r5, [r0, 0x3]
	ldr r4, [r0, 0x10]
	movs r3, 0
	cmp r3, r5
	bge _0813F066
	lsls r0, r1, 16
	asrs r1, r0, 16
	lsls r0, r2, 16
	asrs r2, r0, 16
_0813F020:
	ldrb r0, [r4, 0x5]
	cmp r0, 0x7
	bne _0813F05E
	ldrh r0, [r4]
	cmp r1, r0
	bne _0813F05E
	ldrh r0, [r4, 0x2]
	cmp r2, r0
	bne _0813F05E
	ldr r0, [r4, 0x8]
	movs r1, 0x1
	bl sub_80CC44C
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r4, 0x8]
	movs r1, 0x3
	bl sub_80CC44C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _0813F066
	adds r0, r5, 0
	bl sub_806E6D0
	lsls r0, 24
	cmp r0, 0
	bne _0813F066
	movs r0, 0x1
	b _0813F068
_0813F05E:
	adds r4, 0xC
	adds r3, 0x1
	cmp r3, r5
	blt _0813F020
_0813F066:
	movs r0, 0
_0813F068:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813F004

	thumb_func_start sub_813F070
sub_813F070: @ 813F070
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl sub_80589C4
	adds r3, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _0813F098
	cmp r0, 0x2
	bgt _0813F08E
	cmp r0, 0x1
	beq _0813F0AC
	b _0813F0EC
_0813F08E:
	cmp r0, 0x3
	beq _0813F0C4
	cmp r0, 0x4
	beq _0813F0CE
	b _0813F0EC
_0813F098:
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	subs r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
	subs r0, 0x7
	adds r0, r6
	b _0813F0E2
_0813F0AC:
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	subs r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0813F0C0 @ =gUnknown_2036DFC
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	b _0813F0DE
	.align 2, 0
_0813F0C0: .4byte gUnknown_2036DFC
_0813F0C4:
	ldr r0, [r3]
	ldr r0, [r0]
	subs r0, 0x7
	adds r0, r5
	b _0813F0D8
_0813F0CE:
	ldr r0, _0813F0E8 @ =gUnknown_2036DFC
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, 0x7
	subs r0, r5, r0
_0813F0D8:
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r4, 0x4]
_0813F0DE:
	adds r0, 0x7
	subs r0, r6, r0
_0813F0E2:
	lsls r0, 16
	lsrs r2, r0, 16
	b _0813F0F0
	.align 2, 0
_0813F0E8: .4byte gUnknown_2036DFC
_0813F0EC:
	movs r0, 0
	b _0813F102
_0813F0F0:
	ldr r0, [r3, 0x4]
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	bl sub_813F004
	lsls r0, 24
	lsrs r0, 24
_0813F102:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_813F070

	thumb_func_start sub_813F108
sub_813F108: @ 813F108
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _0813F21C @ =gUnknown_2036DFC
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldr r0, [r1, 0x4]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	adds r1, 0x7
	cmp r0, r1
	bgt _0813F20C
_0813F156:
	mov r5, sp
	ldrh r0, [r5, 0x2]
	subs r0, 0x5
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r2, r4, 16
	asrs r1, r2, 16
	movs r6, 0x2
	ldrsh r0, [r5, r6]
	adds r0, 0x5
	lsls r3, 16
	mov r8, r3
	cmp r1, r0
	bgt _0813F1F6
	movs r0, 0x7
	str r0, [sp, 0x10]
	mov r1, r8
	asrs r1, 16
	mov r9, r1
	mov r10, r0
_0813F17E:
	ldr r3, [sp, 0x10]
	cmp r3, r9
	bgt _0813F1A0
	ldr r5, [sp, 0x8]
	lsls r0, r5, 16
	asrs r0, 16
	cmp r9, r0
	bge _0813F1A0
	asrs r1, r2, 16
	cmp r10, r1
	bgt _0813F1A0
	ldr r6, [sp, 0xC]
	lsls r0, r6, 16
	asrs r0, 16
	lsls r7, r4, 16
	cmp r1, r0
	blt _0813F1DE
_0813F1A0:
	mov r0, r8
	asrs r5, r0, 16
	lsls r4, 16
	asrs r6, r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_805973C
	adds r7, r4, 0
	cmp r0, 0
	beq _0813F1DE
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_813F070
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813F1DE
	mov r0, sp
	ldrh r1, [r0]
	subs r1, r5, r1
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, r6, r2
	lsls r2, 16
	asrs r2, 16
	ldr r0, [sp, 0x4]
	bl sub_813F220
_0813F1DE:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r4, r0, 16
	lsls r2, r4, 16
	asrs r1, r2, 16
	mov r3, sp
	movs r5, 0x2
	ldrsh r0, [r3, r5]
	adds r0, 0x5
	cmp r1, r0
	ble _0813F17E
_0813F1F6:
	movs r1, 0x80
	lsls r1, 9
	add r1, r8
	lsrs r3, r1, 16
	asrs r1, 16
	mov r0, sp
	movs r6, 0
	ldrsh r0, [r0, r6]
	adds r0, 0x7
	cmp r1, r0
	ble _0813F156
_0813F20C:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F21C: .4byte gUnknown_2036DFC
	thumb_func_end sub_813F108

	thumb_func_start sub_813F220
sub_813F220: @ 813F220
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r12, r2
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813F254 @ =gUnknown_3005098
	adds r3, r1, r0
	movs r1, 0x4
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _0813F258
	strh r7, [r3]
	mov r0, r12
	strh r0, [r3, 0x2]
	movs r0, 0x1
	strh r0, [r3, 0x4]
	b _0813F2E2
	.align 2, 0
_0813F254: .4byte gUnknown_3005098
_0813F258:
	movs r1, 0
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bge _0813F268
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _0813F26A
_0813F268:
	ldrh r4, [r3]
_0813F26A:
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	ldrh r1, [r3, 0x2]
	mov r9, r1
	cmp r0, 0
	bge _0813F27E
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
	b _0813F280
_0813F27E:
	ldrh r2, [r3, 0x2]
_0813F280:
	lsls r1, r7, 16
	asrs r0, r1, 16
	cmp r0, 0
	bge _0813F290
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	b _0813F292
_0813F290:
	lsrs r6, r1, 16
_0813F292:
	mov r1, r12
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r8, r0
	cmp r1, 0
	bge _0813F2A4
	negs r0, r1
	lsls r0, 16
	b _0813F2A6
_0813F2A4:
	mov r0, r8
_0813F2A6:
	lsrs r5, r0, 16
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r2, 16
	asrs r2, r1, 16
	adds r4, r0, r2
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	adds r0, r1
	cmp r4, r0
	ble _0813F2C8
	strh r7, [r3]
	mov r1, r12
	strh r1, [r3, 0x2]
	b _0813F2E2
_0813F2C8:
	cmp r4, r0
	bne _0813F2E2
	cmp r2, r1
	bgt _0813F2DC
	cmp r2, r1
	bne _0813F2E2
	mov r1, r9
	lsls r0, r1, 16
	cmp r0, r8
	bge _0813F2E2
_0813F2DC:
	strh r7, [r3]
	mov r0, r12
	strh r0, [r3, 0x2]
_0813F2E2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813F220

	thumb_func_start sub_813F2F0
sub_813F2F0: @ 813F2F0
	push {r4,r5,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bne _0813F302
	cmp r1, 0
	beq _0813F35C
_0813F302:
	lsls r0, r2, 16
	asrs r2, r0, 16
	adds r5, r0, 0
	cmp r2, 0
	bge _0813F314
	negs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	b _0813F316
_0813F314:
	lsrs r4, r5, 16
_0813F316:
	lsls r0, r1, 16
	asrs r2, r0, 16
	adds r1, r0, 0
	cmp r2, 0
	bge _0813F328
	negs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	b _0813F32A
_0813F328:
	lsrs r3, r1, 16
_0813F32A:
	lsls r0, r4, 16
	asrs r2, r0, 16
	lsls r0, r3, 16
	asrs r0, 16
	cmp r2, r0
	ble _0813F342
	cmp r5, 0
	bge _0813F33E
	movs r0, 0x4
	b _0813F35E
_0813F33E:
	movs r0, 0x2
	b _0813F35E
_0813F342:
	cmp r2, r0
	bge _0813F34C
	cmp r1, 0
	blt _0813F354
	b _0813F358
_0813F34C:
	cmp r2, r0
	bne _0813F35C
	cmp r1, 0
	bge _0813F358
_0813F354:
	movs r0, 0x1
	b _0813F35E
_0813F358:
	movs r0, 0x3
	b _0813F35E
_0813F35C:
	movs r0, 0
_0813F35E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813F2F0

	thumb_func_start sub_813F364
sub_813F364: @ 813F364
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813F378 @ =gUnknown_8416476
	ldr r3, _0813F37C @ =sub_813F380
	movs r1, 0x2
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0813F378: .4byte gUnknown_8416476
_0813F37C: .4byte sub_813F380
	thumb_func_end sub_813F364

	thumb_func_start sub_813F380
sub_813F380: @ 813F380
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_813F3FC
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6F54
	bl sub_80696C0
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813F380

	thumb_func_start sub_813F3A8
sub_813F3A8: @ 813F3A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813F3BC @ =gUnknown_84164BE
	ldr r3, _0813F3C0 @ =sub_813F3C4
	movs r1, 0x2
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0813F3BC: .4byte gUnknown_84164BE
_0813F3C0: .4byte sub_813F3C4
	thumb_func_end sub_813F3A8

	thumb_func_start sub_813F3C4
sub_813F3C4: @ 813F3C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_813F3FC
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _0813F3E8 @ =gUnknown_81A8D49
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813F3E8: .4byte gUnknown_81A8D49
	thumb_func_end sub_813F3C4

	thumb_func_start sub_813F3EC
sub_813F3EC: @ 813F3EC
	push {lr}
	ldr r0, _0813F3F8 @ =gUnknown_84647FC
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0813F3F8: .4byte gUnknown_84647FC
	thumb_func_end sub_813F3EC

	thumb_func_start sub_813F3FC
sub_813F3FC: @ 813F3FC
	push {lr}
	movs r0, 0xFA
	lsls r0, 3
	bl FreeSpriteTilesByTag
	pop {r0}
	bx r0
	thumb_func_end sub_813F3FC

	thumb_func_start sub_813F40C
sub_813F40C: @ 813F40C
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _0813F464 @ =gUnknown_84647E4
	movs r1, 0x78
	movs r2, 0x4C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0813F468 @ =gUnknown_202063C
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	adds r4, r0
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r4, 0x5]
	adds r0, r4, 0
	adds r1, r5, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r5, [r4, 0x3C]
	strh r0, [r4, 0x2E]
	strh r0, [r4, 0x34]
	strh r0, [r4, 0x36]
	movs r0, 0x78
	strh r0, [r4, 0x38]
	movs r0, 0x4C
	strh r0, [r4, 0x3A]
	cmp r7, 0x4
	bhi _0813F53E
	lsls r0, r7, 2
	ldr r1, _0813F46C @ =_0813F470
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813F464: .4byte gUnknown_84647E4
_0813F468: .4byte gUnknown_202063C
_0813F46C: .4byte _0813F470
	.align 2, 0
_0813F470:
	.4byte _0813F484
	.4byte _0813F4C8
	.4byte _0813F4EC
	.4byte _0813F50C
	.4byte _0813F52C
_0813F484:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _0813F4C8
	cmp r0, 0x2
	bgt _0813F49A
	cmp r0, 0x1
	beq _0813F50C
	b _0813F53E
_0813F49A:
	cmp r0, 0x3
	beq _0813F4A4
	cmp r0, 0x4
	beq _0813F4EC
	b _0813F53E
_0813F4A4:
	ldr r1, _0813F4C0 @ =gUnknown_202063C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	movs r2, 0
	ldr r1, _0813F4C4 @ =0x0000ff9c
	strh r1, [r0, 0x30]
	strh r2, [r0, 0x32]
	movs r1, 0
	bl StartSpriteAffineAnim
	b _0813F53E
	.align 2, 0
_0813F4C0: .4byte gUnknown_202063C
_0813F4C4: .4byte 0x0000ff9c
_0813F4C8:
	ldr r1, _0813F4E4 @ =gUnknown_202063C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	ldr r1, _0813F4E8 @ =0x0000ff9c
	strh r1, [r0, 0x32]
	movs r1, 0x3
	bl StartSpriteAffineAnim
	b _0813F53E
	.align 2, 0
_0813F4E4: .4byte gUnknown_202063C
_0813F4E8: .4byte 0x0000ff9c
_0813F4EC:
	ldr r1, _0813F508 @ =gUnknown_202063C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	movs r2, 0
	movs r1, 0x64
	strh r1, [r0, 0x30]
	strh r2, [r0, 0x32]
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _0813F53E
	.align 2, 0
_0813F508: .4byte gUnknown_202063C
_0813F50C:
	ldr r1, _0813F528 @ =gUnknown_202063C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	movs r1, 0x64
	strh r1, [r0, 0x32]
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _0813F53E
	.align 2, 0
_0813F528: .4byte gUnknown_202063C
_0813F52C:
	ldr r1, _0813F544 @ =gUnknown_202063C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	movs r2, 0
	ldr r1, _0813F548 @ =0x0000ff9c
	strh r1, [r0, 0x30]
	strh r2, [r0, 0x32]
_0813F53E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F544: .4byte gUnknown_202063C
_0813F548: .4byte 0x0000ff9c
	thumb_func_end sub_813F40C

	thumb_func_start sub_813F54C
sub_813F54C: @ 813F54C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x36]
	adds r1, r3
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	ldrh r3, [r2, 0x38]
	adds r0, r3
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 24
	ldrh r3, [r2, 0x3A]
	adds r1, r3
	strh r1, [r2, 0x22]
	subs r0, 0x69
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1B
	bhi _0813F58A
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _0813F58A
	cmp r0, 0x58
	ble _0813F58E
_0813F58A:
	ldr r0, _0813F594 @ =sub_813F598
	str r0, [r2, 0x1C]
_0813F58E:
	pop {r0}
	bx r0
	.align 2, 0
_0813F594: .4byte sub_813F598
	thumb_func_end sub_813F54C

	thumb_func_start sub_813F598
sub_813F598: @ 813F598
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813F598

	thumb_func_start sub_813F5AC
sub_813F5AC: @ 813F5AC
	push {r4,r5,lr}
	ldr r0, _0813F604 @ =gUnknown_84647E4
	movs r1, 0x78
	movs r2, 0x4C
	movs r3, 0
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r2, _0813F608 @ =gUnknown_202063C
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r4, r1, r2
	ldrb r3, [r4, 0x5]
	movs r0, 0xF
	ands r0, r3
	strb r0, [r4, 0x5]
	adds r2, 0x1C
	adds r1, r2
	ldr r0, _0813F60C @ =sub_813F614
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0x4
	bl StartSpriteAnim
	movs r1, 0
	strh r1, [r4, 0x3C]
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x34]
	strh r1, [r4, 0x36]
	movs r0, 0x78
	strh r0, [r4, 0x38]
	movs r0, 0x4C
	strh r0, [r4, 0x3A]
	strh r1, [r4, 0x30]
	ldr r0, _0813F610 @ =0x0000ff9c
	strh r0, [r4, 0x32]
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0813F604: .4byte gUnknown_84647E4
_0813F608: .4byte gUnknown_202063C
_0813F60C: .4byte sub_813F614
_0813F610: .4byte 0x0000ff9c
	thumb_func_end sub_813F5AC

	thumb_func_start sub_813F614
sub_813F614: @ 813F614
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x36]
	adds r1, r3
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	ldrh r3, [r2, 0x38]
	adds r0, r3
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 24
	ldrh r3, [r2, 0x3A]
	adds r1, r3
	strh r1, [r2, 0x22]
	subs r0, 0x69
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1B
	bhi _0813F652
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _0813F652
	cmp r0, 0x58
	ble _0813F656
_0813F652:
	ldr r0, _0813F65C @ =sub_813F660
	str r0, [r2, 0x1C]
_0813F656:
	pop {r0}
	bx r0
	.align 2, 0
_0813F65C: .4byte sub_813F660
	thumb_func_end sub_813F614

	thumb_func_start sub_813F660
sub_813F660: @ 813F660
	push {lr}
	bl DestroySprite
	pop {r0}
	bx r0
	thumb_func_end sub_813F660

	.align 2, 0 @ Don't pad with nop.
