	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A0A48
sub_80A0A48: @ 80A0A48
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _080A0A6C @ =sub_80A0B0C
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A0AC0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0A6C: .4byte sub_80A0B0C
	thumb_func_end sub_80A0A48

	thumb_func_start sub_80A0A70
sub_80A0A70: @ 80A0A70
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _080A0A94 @ =sub_80A0C78
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A0AC0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0A94: .4byte sub_80A0C78
	thumb_func_end sub_80A0A70

	thumb_func_start sub_80A0A98
sub_80A0A98: @ 80A0A98
	push {lr}
	ldr r0, _080A0AA8 @ =sub_80A0B0C
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080A0AA8: .4byte sub_80A0B0C
	thumb_func_end sub_80A0A98

	thumb_func_start sub_80A0AAC
sub_80A0AAC: @ 80A0AAC
	push {lr}
	ldr r0, _080A0ABC @ =sub_80A0C78
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080A0ABC: .4byte sub_80A0C78
	thumb_func_end sub_80A0AAC

	thumb_func_start sub_80A0AC0
sub_80A0AC0: @ 80A0AC0
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	adds r5, r4, 0
	lsls r3, 24
	lsrs r3, 24
	adds r1, r3, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r1, _080A0B08 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x10
	cmp r4, 0
	beq _080A0AEE
	adds r0, r4, 0
_080A0AEE:
	strh r0, [r1, 0xA]
	movs r0, 0x14
	cmp r5, 0
	beq _080A0AF8
	adds r0, r5, 0
_080A0AF8:
	strh r0, [r1, 0xC]
	ldr r1, [r1]
	adds r0, r2, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0B08: .4byte gTasks
	thumb_func_end sub_80A0AC0

	thumb_func_start sub_80A0B0C
sub_80A0B0C: @ 80A0B0C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A0B30 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080A0B8C
	cmp r0, 0x1
	bgt _080A0B34
	cmp r0, 0
	beq _080A0B3E
	b _080A0C5A
	.align 2, 0
_080A0B30: .4byte gTasks
_080A0B34:
	cmp r0, 0x2
	beq _080A0BAE
	cmp r0, 0x3
	beq _080A0C10
	b _080A0C5A
_080A0B3E:
	movs r0, 0x78
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	movs r0, 0x50
	strh r0, [r4, 0x12]
	movs r0, 0x51
	strh r0, [r4, 0x14]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0x10]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x40
	bl SetGpuReg
	ldrh r1, [r4, 0x12]
	lsls r1, 8
	ldrh r0, [r4, 0x14]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x44
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	b _080A0C6A
_080A0B8C:
	movs r0, 0x50
	bl GetGpuReg
	strh r0, [r4, 0x16]
	movs r0, 0x54
	bl GetGpuReg
	strh r0, [r4, 0x18]
	movs r0, 0x50
	movs r1, 0xBF
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x10
	bl SetGpuReg
	b _080A0C6A
_080A0BAE:
	ldrh r0, [r4, 0xE]
	ldrh r1, [r4, 0xA]
	subs r0, r1
	movs r5, 0
	strh r0, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	adds r1, r2
	strh r1, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	ble _080A0BCC
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xEF
	ble _080A0BF2
_080A0BCC:
	strh r5, [r4, 0xE]
	movs r0, 0xF0
	strh r0, [r4, 0x10]
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldrh r1, [r4, 0x16]
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	movs r2, 0
	bl BlendPalettes
	ldr r0, _080A0C0C @ =gPlttBufferFaded
	strh r5, [r0]
_080A0BF2:
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0x10]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x40
	bl SetGpuReg
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	b _080A0C54
	.align 2, 0
_080A0C0C: .4byte gPlttBufferFaded
_080A0C10:
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0xC]
	subs r0, r1
	strh r0, [r4, 0x12]
	ldrh r2, [r4, 0x14]
	adds r1, r2
	strh r1, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	ble _080A0C2C
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _080A0C3E
_080A0C2C:
	movs r0, 0
	strh r0, [r4, 0x12]
	movs r0, 0xA0
	strh r0, [r4, 0x14]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
_080A0C3E:
	ldrh r1, [r4, 0x12]
	lsls r1, 8
	ldrh r0, [r4, 0x14]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x44
	bl SetGpuReg
	movs r1, 0x12
	ldrsh r0, [r4, r1]
_080A0C54:
	cmp r0, 0
	bne _080A0C70
	b _080A0C6A
_080A0C5A:
	ldrh r1, [r4, 0x16]
	movs r0, 0x50
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyTask
	b _080A0C70
_080A0C6A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080A0C70:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0B0C

	thumb_func_start sub_80A0C78
sub_80A0C78: @ 80A0C78
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A0C9C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080A0CB4
	cmp r1, 0x1
	bgt _080A0CA0
	cmp r1, 0
	beq _080A0CAA
	b _080A0DA8
	.align 2, 0
_080A0C9C: .4byte gTasks
_080A0CA0:
	cmp r1, 0x2
	beq _080A0D02
	cmp r1, 0x3
	beq _080A0D54
	b _080A0DA8
_080A0CAA:
	ldr r0, _080A0CB0 @ =gPlttBufferFaded
	strh r1, [r0]
	b _080A0DCA
	.align 2, 0
_080A0CB0: .4byte gPlttBufferFaded
_080A0CB4:
	movs r1, 0
	strh r1, [r4, 0xE]
	movs r0, 0xF0
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	movs r0, 0xA0
	strh r0, [r4, 0x14]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0x10]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x40
	bl SetGpuReg
	ldrh r1, [r4, 0x12]
	lsls r1, 8
	ldrh r0, [r4, 0x14]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x44
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	b _080A0DCA
_080A0D02:
	ldrh r0, [r4, 0xC]
	ldrh r2, [r4, 0x12]
	adds r1, r0, r2
	strh r1, [r4, 0x12]
	ldrh r2, [r4, 0x14]
	subs r0, r2, r0
	strh r0, [r4, 0x14]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x4F
	bgt _080A0D20
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bgt _080A0D38
_080A0D20:
	movs r0, 0x50
	strh r0, [r4, 0x12]
	movs r0, 0x51
	strh r0, [r4, 0x14]
	movs r0, 0x50
	movs r1, 0xBF
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x10
	bl SetGpuReg
_080A0D38:
	ldrh r1, [r4, 0x12]
	lsls r1, 8
	ldrh r0, [r4, 0x14]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x44
	bl SetGpuReg
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	bne _080A0DD0
	b _080A0DCA
_080A0D54:
	ldrh r0, [r4, 0xA]
	ldrh r2, [r4, 0xE]
	adds r1, r0, r2
	strh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	subs r0, r2, r0
	strh r0, [r4, 0x10]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x77
	bgt _080A0D72
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bgt _080A0D88
_080A0D72:
	movs r0, 0x78
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	subs r0, 0x79
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r1, _080A0DA4 @ =gPlttBufferFaded
	movs r0, 0
	strh r0, [r1]
_080A0D88:
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0x10]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x40
	bl SetGpuReg
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x78
	bne _080A0DD0
	b _080A0DCA
	.align 2, 0
_080A0DA4: .4byte gPlttBufferFaded
_080A0DA8:
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyTask
	b _080A0DD0
_080A0DCA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080A0DD0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0C78

	.align 2, 0 @ Don't pad with nop.
