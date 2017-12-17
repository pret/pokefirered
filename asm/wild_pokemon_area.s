	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813C9DC
sub_813C9DC: @ 813C9DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r1, [sp, 0x10]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	bl sub_813CB34
	cmp r0, 0
	blt _0813CA02
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x10]
	bl sub_813CB5C
	b _0813CB1A
_0813CA02:
	bl sub_80CC204
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	movs r0, 0
	str r0, [sp, 0x18]
	ldr r0, _0813CA74 @ =0x00004024
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x1C]
	cmp r0, 0x8
	ble _0813CA24
	movs r1, 0
	str r1, [sp, 0x1C]
_0813CA24:
	movs r6, 0
	mov r8, r6
	ldr r1, _0813CA78 @ =gUnknown_83C9CB8
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0813CB18
_0813CA30:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r1
	adds r0, r4, 0
	bl sub_813CC44
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xB7
	bne _0813CA5A
	ldr r2, [sp, 0x18]
	adds r2, 0x1
	str r2, [sp, 0x18]
	adds r0, r2, 0
	subs r0, 0x1
	adds r1, r6, 0x1
	str r1, [sp, 0x20]
	ldr r2, [sp, 0x1C]
	cmp r2, r0
	bne _0813CB06
_0813CA5A:
	adds r0, r4, 0
	ldr r1, [sp, 0xC]
	bl sub_813CBD0
	adds r6, 0x1
	str r6, [sp, 0x20]
	cmp r0, 0
	beq _0813CB06
	movs r0, 0
	str r0, [sp, 0x8]
	lsls r7, r5, 16
	add r6, sp, 0x8
	b _0813CA94
	.align 2, 0
_0813CA74: .4byte 0x00004024
_0813CA78: .4byte gUnknown_83C9CB8
_0813CA7C:
	add r0, sp, 0x4
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813CA94
	mov r0, r8
	movs r1, 0x1
	add r8, r1
	add r1, sp, 0x4
	ldrh r1, [r1]
	ldr r2, [sp, 0x10]
	bl sub_81344A4
_0813CA94:
	lsrs r0, r7, 16
	add r2, sp, 0x4
	str r2, [sp]
	ldr r1, _0813CAC8 @ =gUnknown_8464148
	movs r2, 0x37
	adds r3, r6, 0
	bl sub_813CC58
	cmp r0, 0
	bne _0813CA7C
	movs r2, 0
	add r5, sp, 0x4
	ldr r0, _0813CACC @ =gUnknown_84642BC
	mov r10, r0
_0813CAB0:
	ldr r0, [sp, 0x14]
	asrs r0, r2
	movs r1, 0x1
	ands r0, r1
	adds r1, r2, 0x1
	mov r9, r1
	cmp r0, 0
	beq _0813CB00
	movs r0, 0
	str r0, [sp, 0x8]
	lsls r4, r2, 3
	b _0813CAE4
	.align 2, 0
_0813CAC8: .4byte gUnknown_8464148
_0813CACC: .4byte gUnknown_84642BC
_0813CAD0:
	ldrh r0, [r5]
	cmp r0, 0
	beq _0813CAE4
	mov r0, r8
	movs r2, 0x1
	add r8, r2
	ldrh r1, [r5]
	ldr r2, [sp, 0x10]
	bl sub_81344A4
_0813CAE4:
	mov r1, r10
	adds r0, r4, r1
	ldr r1, [r0]
	ldr r2, _0813CB2C @ =gUnknown_84642C0
	adds r0, r4, r2
	ldr r2, [r0]
	add r0, sp, 0x4
	str r0, [sp]
	lsrs r0, r7, 16
	adds r3, r6, 0
	bl sub_813CC58
	cmp r0, 0
	bne _0813CAD0
_0813CB00:
	mov r2, r9
	cmp r2, 0x6
	bls _0813CAB0
_0813CB06:
	ldr r6, [sp, 0x20]
	ldr r1, _0813CB30 @ =gUnknown_83C9CB8
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0813CA30
_0813CB18:
	mov r0, r8
_0813CB1A:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813CB2C: .4byte gUnknown_84642C0
_0813CB30: .4byte gUnknown_83C9CB8
	thumb_func_end sub_813C9DC

	thumb_func_start sub_813CB34
sub_813CB34: @ 813CB34
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0
	ldr r2, _0813CB48 @ =gUnknown_84642F4
_0813CB3E:
	ldrh r0, [r2]
	cmp r0, r3
	bne _0813CB4C
	adds r0, r1, 0
	b _0813CB58
	.align 2, 0
_0813CB48: .4byte gUnknown_84642F4
_0813CB4C:
	adds r2, 0x4
	adds r1, 0x1
	cmp r1, 0x2
	bls _0813CB3E
	movs r0, 0x1
	negs r0, r0
_0813CB58:
	pop {r1}
	bx r1
	thumb_func_end sub_813CB34

	thumb_func_start sub_813CB5C
sub_813CB5C: @ 813CB5C
	push {r4,r5,lr}
	sub sp, 0xC
	adds r5, r1, 0
	lsls r0, 16
	lsrs r0, 16
	bl sub_813CB34
	adds r4, r0, 0
	cmp r4, 0
	blt _0813CBC4
	ldr r0, _0813CBBC @ =gUnknown_84642F4
	lsls r4, 2
	adds r4, r0
	bl sub_80CBDB0
	ldrh r1, [r4, 0x2]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bne _0813CBC4
	bl sub_8142044
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	str r1, [sp, 0x8]
	ldr r1, _0813CBC0 @ =gUnknown_8464148
	add r3, sp, 0x8
	add r2, sp, 0x4
	str r2, [sp]
	movs r2, 0x37
	bl sub_813CC58
	cmp r0, 0
	beq _0813CBC4
	add r0, sp, 0x4
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813CBC4
	add r0, sp, 0x4
	ldrh r1, [r0]
	movs r0, 0
	adds r2, r5, 0
	bl sub_81344A4
	movs r0, 0x1
	b _0813CBC6
	.align 2, 0
_0813CBBC: .4byte gUnknown_84642F4
_0813CBC0: .4byte gUnknown_8464148
_0813CBC4:
	movs r0, 0
_0813CBC6:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813CB5C

	thumb_func_start sub_813CBD0
sub_813CBD0: @ 813CBD0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4, 0x4]
	movs r2, 0xC
	bl sub_813CC18
	cmp r0, 0
	bne _0813CC10
	ldr r0, [r4, 0x8]
	adds r1, r5, 0
	movs r2, 0x5
	bl sub_813CC18
	cmp r0, 0
	bne _0813CC10
	ldr r0, [r4, 0x10]
	adds r1, r5, 0
	movs r2, 0xC
	bl sub_813CC18
	cmp r0, 0
	bne _0813CC10
	ldr r0, [r4, 0xC]
	adds r1, r5, 0
	movs r2, 0x5
	bl sub_813CC18
	cmp r0, 0
	bne _0813CC10
	movs r0, 0
	b _0813CC12
_0813CC10:
	movs r0, 0x1
_0813CC12:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813CBD0

	thumb_func_start sub_813CC18
sub_813CC18: @ 813CC18
	push {r4,lr}
	adds r4, r1, 0
	cmp r0, 0
	beq _0813CC3A
	movs r1, 0
	cmp r1, r2
	bge _0813CC3A
	ldr r3, [r0, 0x4]
_0813CC28:
	ldrh r0, [r3, 0x2]
	cmp r0, r4
	bne _0813CC32
	movs r0, 0x1
	b _0813CC3C
_0813CC32:
	adds r3, 0x4
	adds r1, 0x1
	cmp r1, r2
	blt _0813CC28
_0813CC3A:
	movs r0, 0
_0813CC3C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_813CC18

	thumb_func_start sub_813CC44
sub_813CC44: @ 813CC44
	push {lr}
	ldrb r2, [r0]
	ldrb r1, [r0, 0x1]
	adds r0, r2, 0
	bl sub_8055238
	ldrb r0, [r0, 0x14]
	pop {r1}
	bx r1
	thumb_func_end sub_813CC44

	thumb_func_start sub_813CC58
sub_813CC58: @ 813CC58
	push {r4-r6,lr}
	adds r4, r2, 0
	ldr r6, [sp, 0x10]
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, [r3]
	cmp r2, r4
	bge _0813CC86
	lsls r0, r2, 2
	adds r1, r0, r1
_0813CC6C:
	ldrh r0, [r1]
	cmp r0, r5
	bne _0813CC7E
	ldrh r0, [r1, 0x2]
	strh r0, [r6]
	adds r0, r2, 0x1
	str r0, [r3]
	movs r0, 0x1
	b _0813CC88
_0813CC7E:
	adds r1, 0x4
	adds r2, 0x1
	cmp r2, r4
	blt _0813CC6C
_0813CC86:
	movs r0, 0
_0813CC88:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_813CC58

	.align 2, 0 @ Don't pad with nop.
