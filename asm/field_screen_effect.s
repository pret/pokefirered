	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_807EE00
sub_807EE00: @ 807EE00
	push {lr}
	cmp r1, 0xA0
	bhi _0807EE28
	cmp r2, 0
	bge _0807EE0C
	movs r2, 0
_0807EE0C:
	cmp r2, 0xFF
	ble _0807EE12
	movs r2, 0xFF
_0807EE12:
	cmp r3, 0
	bge _0807EE18
	movs r3, 0
_0807EE18:
	cmp r3, 0xFF
	ble _0807EE1E
	movs r3, 0xFF
_0807EE1E:
	lsls r1, 1
	adds r1, r0
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
_0807EE28:
	pop {r0}
	bx r0
	thumb_func_end sub_807EE00

	thumb_func_start sub_807EE2C
sub_807EE2C: @ 807EE2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	mov r10, r1
	mov r9, r2
	adds r6, r3, 0
	mov r8, r6
	movs r7, 0
	cmp r6, 0
	blt _0807EEA8
_0807EE48:
	mov r0, r9
	subs r1, r0, r7
	mov r0, r10
	subs r4, r0, r6
	adds r5, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_807EE00
	mov r0, r9
	adds r1, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_807EE00
	mov r0, r9
	subs r1, r0, r6
	mov r0, r10
	subs r4, r0, r7
	adds r5, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_807EE00
	mov r0, r9
	adds r1, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_807EE00
	mov r1, r8
	adds r1, 0x1
	lsls r0, r7, 1
	subs r1, r0
	mov r8, r1
	adds r7, 0x1
	cmp r1, 0
	bge _0807EEA4
	subs r1, r6, 0x1
	lsls r0, r1, 1
	add r8, r0
	adds r6, r1, 0
_0807EEA4:
	cmp r6, r7
	bge _0807EE48
_0807EEA8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807EE2C

	thumb_func_start sub_807EEB8
sub_807EEB8: @ 807EEB8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807EEDC @ =gUnknown_3005098
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807EF14
	cmp r0, 0x1
	bgt _0807EEE0
	cmp r0, 0
	beq _0807EEE6
	b _0807EF76
	.align 2, 0
_0807EEDC: .4byte gUnknown_3005098
_0807EEE0:
	cmp r0, 0x2
	beq _0807EF6C
	b _0807EF76
_0807EEE6:
	ldr r0, _0807EF0C @ =gUnknown_2039600
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _0807EF10 @ =gUnknown_2038700
	adds r0, r1
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_807EE2C
	movs r0, 0x1
	strh r0, [r4]
	b _0807EF76
	.align 2, 0
_0807EF0C: .4byte gUnknown_2039600
_0807EF10: .4byte gUnknown_2038700
_0807EF14:
	ldr r0, _0807EF5C @ =gUnknown_2039600
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _0807EF60 @ =gUnknown_2038700
	adds r0, r1
	movs r6, 0x2
	ldrsh r1, [r4, r6]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r6, 0x6
	ldrsh r3, [r4, r6]
	bl sub_807EE2C
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0807EF76
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _0807EF64
	bl remove_some_task
	movs r0, 0x2
	strh r0, [r4]
	b _0807EF76
	.align 2, 0
_0807EF5C: .4byte gUnknown_2039600
_0807EF60: .4byte gUnknown_2038700
_0807EF64:
	adds r0, r5, 0
	bl DestroyTask
	b _0807EF76
_0807EF6C:
	bl dp12_8087EA4
	adds r0, r5, 0
	bl DestroyTask
_0807EF76:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_807EEB8

	thumb_func_start sub_807EF7C
sub_807EF7C: @ 807EF7C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0807EFA0 @ =sub_807EEB8
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0807EF98
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_0807EF98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFA0: .4byte sub_807EEB8
	thumb_func_end sub_807EF7C

	thumb_func_start sub_807EFA4
sub_807EFA4: @ 807EFA4
	push {r4,lr}
	ldr r4, _0807EFC4 @ =sub_807EF7C
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0807EFBC
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0807EFBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFC4: .4byte sub_807EF7C
	thumb_func_end sub_807EFA4

	thumb_func_start sub_807EFC8
sub_807EFC8: @ 807EFC8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x1C]
	ldr r0, [sp, 0x20]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0807F00C @ =sub_807EEB8
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0807F010 @ =gUnknown_3005098
	adds r1, r0, r1
	strh r5, [r1, 0x6]
	strh r4, [r1, 0x8]
	mov r0, r8
	strh r0, [r1, 0x2]
	mov r0, r9
	strh r0, [r1, 0x4]
	strh r6, [r1, 0xC]
	cmp r5, r4
	bge _0807F014
	strh r7, [r1, 0xA]
	b _0807F018
	.align 2, 0
_0807F00C: .4byte sub_807EEB8
_0807F010: .4byte gUnknown_3005098
_0807F014:
	negs r0, r7
	strh r0, [r1, 0xA]
_0807F018:
	adds r0, r2, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807EFC8

	thumb_func_start sub_807F028
sub_807F028: @ 807F028
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	cmp r4, 0
	bne _0807F042
	movs r5, 0x1
_0807F042:
	ldr r1, _0807F070 @ =gUnknown_83C68D4
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r3, [r0]
	str r5, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x50
	bl sub_807EFC8
	bl sub_807EFA4
	bl ScriptContext2_Enable
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F070: .4byte gUnknown_83C68D4
	thumb_func_end sub_807F028

	thumb_func_start sub_807F074
sub_807F074: @ 807F074
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807F0A2
	ldr r4, _0807F0A8 @ =gUnknown_2038700
	ldr r1, _0807F0AC @ =gUnknown_83C68D4
	lsls r0, 1
	adds r0, r1
	ldrh r3, [r0]
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x50
	bl sub_807EE2C
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r4, r0
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r4, 0
	bl CpuFastSet
_0807F0A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F0A8: .4byte gUnknown_2038700
_0807F0AC: .4byte gUnknown_83C68D4
	thumb_func_end sub_807F074

	thumb_func_start sub_807F0B0
sub_807F0B0: @ 807F0B0
	push {lr}
	bl sub_8055FD4
	ldr r0, _0807F0C4 @ =sub_807F0C8
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807F0C4: .4byte sub_807F0C8
	thumb_func_end sub_807F0B0

	thumb_func_start sub_807F0C8
sub_807F0C8: @ 807F0C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8055FC4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807F0E4
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_0807F0E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807F0C8

	thumb_func_start sub_807F0EC
sub_807F0EC: @ 807F0EC
	push {lr}
	ldr r0, _0807F10C @ =sub_807F204
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807F110 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_0807F10C: .4byte sub_807F204
_0807F110: .4byte gUnknown_3005090
	thumb_func_end sub_807F0EC

	thumb_func_start sub_807F114
sub_807F114: @ 807F114
	push {lr}
	ldr r0, _0807F134 @ =sub_807F204
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807F138 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_0807F134: .4byte sub_807F204
_0807F138: .4byte gUnknown_3005090
	thumb_func_end sub_807F114

	thumb_func_start sub_807F13C
sub_807F13C: @ 807F13C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0807F19C @ =gUnknown_3005098
	adds r4, r0
	movs r0, 0
	bl GetGpuReg
	strh r0, [r4]
	movs r0, 0x48
	bl GetGpuReg
	strh r0, [r4, 0x2]
	movs r0, 0x4A
	bl GetGpuReg
	strh r0, [r4, 0x4]
	movs r0, 0x50
	bl GetGpuReg
	strh r0, [r4, 0x6]
	movs r0, 0x52
	bl GetGpuReg
	strh r0, [r4, 0x8]
	movs r0, 0x40
	bl GetGpuReg
	strh r0, [r4, 0xA]
	movs r0, 0x44
	bl GetGpuReg
	strh r0, [r4, 0xC]
	movs r0, 0x42
	bl GetGpuReg
	strh r0, [r4, 0xE]
	movs r0, 0x46
	bl GetGpuReg
	strh r0, [r4, 0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F19C: .4byte gUnknown_3005098
	thumb_func_end sub_807F13C

	thumb_func_start sub_807F1A0
sub_807F1A0: @ 807F1A0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0807F200 @ =gUnknown_3005098
	adds r4, r0
	ldrh r1, [r4]
	movs r0, 0
	bl SetGpuReg
	ldrh r1, [r4, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldrh r1, [r4, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldrh r1, [r4, 0x6]
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r4, 0x8]
	movs r0, 0x52
	bl SetGpuReg
	ldrh r1, [r4, 0xA]
	movs r0, 0x40
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x44
	bl SetGpuReg
	ldrh r1, [r4, 0xE]
	movs r0, 0x42
	bl SetGpuReg
	ldrh r1, [r4, 0x10]
	movs r0, 0x46
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F200: .4byte gUnknown_3005098
	thumb_func_end sub_807F1A0

	thumb_func_start sub_807F204
sub_807F204: @ 807F204
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0807F228 @ =gUnknown_3005098
	adds r5, r0, r1
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0807F2BC
	cmp r0, 0x1
	bgt _0807F22C
	cmp r0, 0
	beq _0807F236
	b _0807F2F4
	.align 2, 0
_0807F228: .4byte gUnknown_3005098
_0807F22C:
	cmp r0, 0x2
	beq _0807F2D0
	cmp r0, 0x3
	beq _0807F2E8
	b _0807F2F4
_0807F236:
	adds r0, r4, 0
	bl sub_807F13C
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	movs r1, 0x80
	lsls r1, 7
	movs r0, 0
	bl SetGpuRegBits
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0807F280
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	ldr r1, _0807F27C @ =0x0000f0ff
	movs r0, 0x42
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0xFF
	bl SetGpuReg
	movs r0, 0x46
	movs r1, 0xFF
	bl SetGpuReg
	b _0807F2A0
	.align 2, 0
_0807F27C: .4byte 0x0000f0ff
_0807F280:
	movs r0, 0x40
	movs r1, 0x78
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0xFF
	bl SetGpuReg
	ldr r1, _0807F2B8 @ =0x000078ff
	movs r0, 0x42
	bl SetGpuReg
	movs r0, 0x46
	movs r1, 0xFF
	bl SetGpuReg
_0807F2A0:
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x1
	strh r0, [r5, 0x12]
	b _0807F2F4
	.align 2, 0
_0807F2B8: .4byte 0x000078ff
_0807F2BC:
	ldr r0, _0807F2CC @ =sub_807F2FC
	movs r1, 0x50
	bl CreateTask
	movs r0, 0x2
	strh r0, [r5, 0x12]
	b _0807F2F4
	.align 2, 0
_0807F2CC: .4byte sub_807F2FC
_0807F2D0:
	ldr r0, _0807F2E4 @ =sub_807F2FC
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0807F2F4
	movs r0, 0x3
	strh r0, [r5, 0x12]
	b _0807F2F4
	.align 2, 0
_0807F2E4: .4byte sub_807F2FC
_0807F2E8:
	adds r0, r4, 0
	bl sub_807F1A0
	adds r0, r4, 0
	bl DestroyTask
_0807F2F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807F204

	thumb_func_start sub_807F2FC
sub_807F2FC: @ 807F2FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	mov r8, r5
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r4, _0807F348 @ =gUnknown_3005098
	adds r6, r0, r4
	ldr r0, _0807F34C @ =sub_807F204
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0807F350
	ldrh r4, [r6]
	movs r0, 0xF0
	subs r0, r4
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _0807F36C
	adds r0, r5, 0
	bl DestroyTask
	b _0807F39A
	.align 2, 0
_0807F348: .4byte gUnknown_3005098
_0807F34C: .4byte sub_807F204
_0807F350:
	ldrh r0, [r6]
	movs r1, 0x78
	subs r1, r0
	lsls r1, 16
	adds r0, 0x78
	lsls r0, 16
	lsrs r7, r0, 16
	lsrs r4, r1, 16
	cmp r1, 0
	bge _0807F36C
	mov r0, r8
	bl DestroyTask
	b _0807F39A
_0807F36C:
	lsls r4, 16
	lsrs r1, r4, 16
	movs r0, 0x40
	bl SetGpuReg
	lsls r1, r7, 16
	asrs r1, 8
	movs r0, 0xF0
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x42
	bl SetGpuReg
	asrs r4, 16
	cmp r4, 0x59
	bgt _0807F394
	ldrh r0, [r6]
	adds r0, 0x4
	b _0807F398
_0807F394:
	ldrh r0, [r6]
	adds r0, 0x2
_0807F398:
	strh r0, [r6]
_0807F39A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807F2FC

	thumb_func_start sub_807F3A4
sub_807F3A4: @ 807F3A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	ldr r2, _0807F3DC @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrb r7, [r4, 0xA]
	movs r0, 0xC
	ldrsh r6, [r4, r0]
	cmp r6, 0
	beq _0807F3E0
	cmp r6, 0x1
	beq _0807F430
	b _0807F448
	.align 2, 0
_0807F3DC: .4byte gUnknown_3005090
_0807F3E0:
	adds r0, r7, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r5, _0807F424 @ =gUnknown_2021D18
	adds r0, r5, 0
	mov r1, r8
	bl sub_8008FCC
	movs r0, 0x1
	mov r8, r0
	str r0, [sp]
	str r6, [sp, 0x4]
	ldr r0, _0807F428 @ =gUnknown_83C68EC
	str r0, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	str r5, [sp, 0x10]
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, r10
	mov r3, r9
	bl sub_812E5A4
	ldr r2, _0807F42C @ =gUnknown_3003E50
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r0, r8
	strh r0, [r4, 0xC]
	b _0807F448
	.align 2, 0
_0807F424: .4byte gUnknown_2021D18
_0807F428: .4byte gUnknown_83C68EC
_0807F42C: .4byte gUnknown_3003E50
_0807F430:
	bl sub_8002DE8
	adds r0, r7, 0
	bl sub_8002E64
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807F448
	strh r0, [r4, 0xC]
	movs r0, 0x1
	b _0807F44A
_0807F448:
	movs r0, 0
_0807F44A:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807F3A4

	thumb_func_start sub_807F45C
sub_807F45C: @ 807F45C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0807F484 @ =gUnknown_3005090
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x6
	bls _0807F478
	b _0807F5E4
_0807F478:
	lsls r0, 2
	ldr r1, _0807F488 @ =_0807F48C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807F484: .4byte gUnknown_3005090
_0807F488: .4byte _0807F48C
	.align 2, 0
_0807F48C:
	.4byte _0807F4A8
	.4byte _0807F538
	.4byte _0807F588
	.4byte _0807F5B6
	.4byte _0807F540
	.4byte _0807F588
	.4byte _0807F5D0
_0807F4A8:
	ldr r0, _0807F518 @ =gUnknown_83C68E4
	bl sub_8003CE4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0807F51C @ =gUnknown_3005090
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r7, r0, r1
	strh r5, [r7, 0xA]
	movs r0, 0xF0
	bl sub_80F77CC
	adds r0, r5, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl PutWindowTilemap
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0x1
	bl GetHealLocationPointer
	adds r3, r0, 0
	ldr r0, _0807F520 @ =gUnknown_3005008
	ldr r2, [r0]
	ldrh r0, [r2, 0x1C]
	ldrh r5, [r3]
	cmp r0, r5
	bne _0807F524
	movs r1, 0x1E
	ldrsb r1, [r2, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0807F524
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r5, 0x2
	ldrsh r0, [r3, r5]
	cmp r1, r0
	bne _0807F524
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	movs r2, 0x4
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _0807F524
	movs r0, 0x4
	strh r0, [r7, 0x8]
	b _0807F5E4
	.align 2, 0
_0807F518: .4byte gUnknown_83C68E4
_0807F51C: .4byte gUnknown_3005090
_0807F520: .4byte gUnknown_3005008
_0807F524:
	ldr r0, _0807F534 @ =gUnknown_3005090
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x8]
	b _0807F5E4
	.align 2, 0
_0807F534: .4byte gUnknown_3005090
_0807F538:
	ldr r1, _0807F53C @ =gUnknown_841B554
	b _0807F542
	.align 2, 0
_0807F53C: .4byte gUnknown_841B554
_0807F540:
	ldr r1, _0807F578 @ =gUnknown_841B5B6
_0807F542:
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl sub_807F3A4
	lsls r0, 24
	cmp r0, 0
	beq _0807F5E4
	ldr r0, _0807F57C @ =gUnknown_2037078
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807F580 @ =gUnknown_2036E38
	adds r0, r1
	movs r1, 0x2
	bl FieldObjectTurn
	ldr r1, _0807F584 @ =gUnknown_3005090
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _0807F5E4
	.align 2, 0
_0807F578: .4byte gUnknown_841B5B6
_0807F57C: .4byte gUnknown_2037078
_0807F580: .4byte gUnknown_2036E38
_0807F584: .4byte gUnknown_3005090
_0807F588:
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r2
	ldrb r5, [r4, 0xA]
	adds r0, r5, 0
	bl ClearWindowTilemap
	adds r0, r5, 0
	movs r1, 0x1
	bl CopyWindowToVram
	adds r0, r5, 0
	bl RemoveWindow
	bl palette_bg_faded_fill_black
	bl sub_807DC00
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807F5E4
_0807F5B6:
	bl sub_807E418
	cmp r0, 0x1
	bne _0807F5E4
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, _0807F5CC @ =gUnknown_81A8D97
	bl ScriptContext1_SetupScript
	b _0807F5E4
	.align 2, 0
_0807F5CC: .4byte gUnknown_81A8D97
_0807F5D0:
	bl sub_807E418
	cmp r0, 0x1
	bne _0807F5E4
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, _0807F5EC @ =gUnknown_81A8DD8
	bl ScriptContext1_SetupScript
_0807F5E4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5EC: .4byte gUnknown_81A8DD8
	thumb_func_end sub_807F45C

	thumb_func_start sub_807F5F0
sub_807F5F0: @ 807F5F0
	push {lr}
	bl ScriptContext2_Enable
	bl palette_bg_faded_fill_black
	ldr r0, _0807F618 @ =sub_807F45C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807F61C @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0807F618: .4byte sub_807F45C
_0807F61C: .4byte gUnknown_3005090
	thumb_func_end sub_807F5F0

	.align 2, 0 @ Don't pad with nop.
