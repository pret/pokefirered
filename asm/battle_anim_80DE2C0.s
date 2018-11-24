	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80DE2C0
sub_80DE2C0: @ 80DE2C0
	push {lr}
	adds r2, r0, 0
	ldr r1, _080DE2E4 @ =gUnknown_2037F02
	ldrh r0, [r1]
	ldrh r3, [r2, 0x20]
	adds r0, r3
	strh r0, [r2, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r3, [r2, 0x22]
	adds r0, r3
	strh r0, [r2, 0x22]
	movs r3, 0x6
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080DE2E8
	ldrh r0, [r1, 0x4]
	b _080DE2EC
	.align 2, 0
_080DE2E4: .4byte gUnknown_2037F02
_080DE2E8:
	ldrh r0, [r1, 0x4]
	negs r0, r0
_080DE2EC:
	strh r0, [r2, 0x2E]
	ldrh r0, [r1, 0x8]
	strh r0, [r2, 0x30]
	ldr r0, _080DE2FC @ =sub_80DE300
	str r0, [r2, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_080DE2FC: .4byte sub_80DE300
	thumb_func_end sub_80DE2C0

	thumb_func_start sub_80DE300
sub_80DE300: @ 80DE300
	push {lr}
	adds r3, r0, 0
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	ble _080DE340
	ldrh r1, [r3, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x2E]
	adds r1, r0
	strh r1, [r3, 0x32]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	b _080DE346
_080DE340:
	adds r0, r3, 0
	bl DestroyAnimSprite
_080DE346:
	pop {r0}
	bx r0
	thumb_func_end sub_80DE300

	thumb_func_start sub_80DE34C
sub_80DE34C: @ 80DE34C
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _080DE398 @ =gUnknown_2037F1B
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 8
	movs r0, 0x80
	lsls r0, 12
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8074480
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 8
	movs r0, 0x80
	lsls r0, 12
	adds r1, r0
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_804A76C
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DE398: .4byte gUnknown_2037F1B
	thumb_func_end sub_80DE34C

	thumb_func_start sub_80DE39C
sub_80DE39C: @ 80DE39C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5A
	strh r0, [r4, 0x2E]
	ldr r0, _080DE3D8 @ =sub_8074C44
	str r0, [r4, 0x1C]
	movs r0, 0x7
	strh r0, [r4, 0x30]
	ldr r1, _080DE3DC @ =sub_80DE3E0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r0, [r4, 0x30]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE3D8: .4byte sub_8074C44
_080DE3DC: .4byte sub_80DE3E0
	thumb_func_end sub_80DE39C

	thumb_func_start sub_80DE3E0
sub_80DE3E0: @ 80DE3E0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _080DE414
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DE41C @ =sub_80DE420
	str r0, [r4, 0x1C]
_080DE414:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE41C: .4byte sub_80DE420
	thumb_func_end sub_80DE3E0

	thumb_func_start sub_80DE420
sub_80DE420: @ 80DE420
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE420

	thumb_func_start sub_80DE440
sub_80DE440: @ 80DE440
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r4, _080DE4CC @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8075114
	ldrh r0, [r5, 0x20]
	subs r0, r7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r5, 0x22]
	subs r1, r6
	lsls r1, 16
	asrs r1, 16
	bl sub_8075B30
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 23
	adds r0, r1
	lsrs r4, r0, 16
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080DE49E
	movs r1, 0x80
	lsls r1, 7
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080DE49E:
	movs r3, 0x80
	lsls r3, 1
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8075A1C
	ldr r0, _080DE4D0 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x32]
	strh r6, [r5, 0x36]
	ldr r0, _080DE4D4 @ =sub_8075590
	str r0, [r5, 0x1C]
	ldr r1, _080DE4D8 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DE4CC: .4byte gUnknown_2037F1B
_080DE4D0: .4byte gUnknown_2037F02
_080DE4D4: .4byte sub_8075590
_080DE4D8: .4byte DestroyAnimSprite
	thumb_func_end sub_80DE440

	thumb_func_start sub_80DE4DC
sub_80DE4DC: @ 80DE4DC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	ldr r0, _080DE504 @ =sub_80DE508
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE504: .4byte sub_80DE508
	thumb_func_end sub_80DE4DC

	thumb_func_start sub_80DE508
sub_80DE508: @ 80DE508
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DE52E
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	b _080DE532
_080DE52E:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
_080DE532:
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	beq _080DE540
	cmp r0, 0x4
	bne _080DE548
_080DE540:
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x30]
_080DE548:
	ldrh r0, [r4, 0x32]
	adds r1, r0, 0x1
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x46
	ble _080DE58C
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0
	strh r0, [r4, 0x32]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DE594 @ =sub_80DE598
	str r0, [r4, 0x1C]
_080DE58C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE594: .4byte sub_80DE598
	thumb_func_end sub_80DE508

	thumb_func_start sub_80DE598
sub_80DE598: @ 80DE598
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x32]
	adds r1, r0, 0x1
	strh r1, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _080DE5D4
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DE5D4
	ldr r0, _080DE5D8 @ =sub_80DE5DC
	str r0, [r3, 0x1C]
_080DE5D4:
	pop {r0}
	bx r0
	.align 2, 0
_080DE5D8: .4byte sub_80DE5DC
	thumb_func_end sub_80DE598

	thumb_func_start sub_80DE5DC
sub_80DE5DC: @ 80DE5DC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bhi _080DE634
	lsls r0, 2
	ldr r1, _080DE5F4 @ =_080DE5F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DE5F4: .4byte _080DE5F8
	.align 2, 0
_080DE5F8:
	.4byte _080DE614
	.4byte _080DE614
	.4byte _080DE61E
	.4byte _080DE61E
	.4byte _080DE62C
	.4byte _080DE62C
	.4byte _080DE634
_080DE614:
	movs r1, 0
	movs r0, 0x1
	strh r0, [r4, 0x24]
	strh r1, [r4, 0x26]
	b _080DE63C
_080DE61E:
	ldr r0, _080DE628 @ =0x0000ffff
	strh r0, [r4, 0x24]
	movs r0, 0
	b _080DE63A
	.align 2, 0
_080DE628: .4byte 0x0000ffff
_080DE62C:
	movs r0, 0
	strh r0, [r4, 0x24]
	movs r0, 0x1
	b _080DE63A
_080DE634:
	movs r0, 0
	strh r0, [r4, 0x24]
	ldr r0, _080DE680 @ =0x0000ffff
_080DE63A:
	strh r0, [r4, 0x26]
_080DE63C:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080DE64E
	strh r2, [r4, 0x34]
_080DE64E:
	ldrh r0, [r4, 0x36]
	adds r1, r0, 0x1
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080DE678
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r4, 0x2E]
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, _080DE684 @ =sub_80DE688
	str r0, [r4, 0x1C]
_080DE678:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE680: .4byte 0x0000ffff
_080DE684: .4byte sub_80DE688
	thumb_func_end sub_80DE5DC

	thumb_func_start sub_80DE688
sub_80DE688: @ 80DE688
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldrh r0, [r4, 0x30]
	adds r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DE6B8
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
_080DE6B8:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DE6CC
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080DE6CC:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080DE6EA
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimSprite
_080DE6EA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE688

	thumb_func_start sub_80DE6F0
sub_80DE6F0: @ 80DE6F0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DE70C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080DE710 @ =sub_80DE718
	str r0, [r1]
	ldr r1, _080DE714 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080DE70C: .4byte gTasks
_080DE710: .4byte sub_80DE718
_080DE714: .4byte gUnknown_2037EE2
	thumb_func_end sub_80DE6F0

	thumb_func_start sub_80DE718
sub_80DE718: @ 80DE718
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8075454
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _080DE7A4 @ =gTasks
	lsls r5, r4, 2
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r7
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080DE788
	ldr r0, _080DE7A8 @ =gPlttBufferFaded
	lsls r2, r6, 4
	adds r1, r2, 0
	adds r1, 0xB
	lsls r1, 1
	adds r1, r0
	ldrh r3, [r1]
	mov r8, r3
	movs r3, 0xA
	mov r9, r7
	adds r7, r5, 0
	mov r12, r0
	adds r5, r2, 0
	lsls r0, r6, 5
	add r0, r12
	adds r2, r0, 0
	adds r2, 0x14
_080DE766:
	ldrh r0, [r2]
	strh r0, [r1]
	subs r2, 0x2
	subs r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bgt _080DE766
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r12
	movs r1, 0
	mov r2, r8
	strh r2, [r0]
	adds r0, r7, r4
	lsls r0, 3
	add r0, r9
	strh r1, [r0, 0x12]
_080DE788:
	ldr r0, _080DE7AC @ =gUnknown_2037F02
	ldrh r1, [r0, 0xE]
	ldr r0, _080DE7B0 @ =0x0000ffff
	cmp r1, r0
	bne _080DE798
	adds r0, r4, 0
	bl DestroyTask
_080DE798:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DE7A4: .4byte gTasks
_080DE7A8: .4byte gPlttBufferFaded
_080DE7AC: .4byte gUnknown_2037F02
_080DE7B0: .4byte 0x0000ffff
	thumb_func_end sub_80DE718

	thumb_func_start sub_80DE7B4
sub_80DE7B4: @ 80DE7B4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DE7D0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080DE7D4 @ =sub_80DE7DC
	str r0, [r1]
	ldr r1, _080DE7D8 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080DE7D0: .4byte gTasks
_080DE7D4: .4byte sub_80DE7DC
_080DE7D8: .4byte gUnknown_2037EE2
	thumb_func_end sub_80DE7B4

	thumb_func_start sub_80DE7DC
sub_80DE7DC: @ 80DE7DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl sub_8075454
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _080DE89C @ =gTasks
	mov r0, r8
	lsls r3, r0, 2
	adds r1, r3, r0
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080DE87E
	ldr r0, _080DE8A0 @ =gPlttBufferFaded
	lsls r2, r7, 4
	adds r1, r2, 0
	adds r1, 0xB
	lsls r1, 1
	adds r1, r0
	ldrh r6, [r1]
	movs r4, 0xA
	mov r10, r3
	mov r9, r0
	adds r5, r2, 0
	ldr r2, _080DE8A4 @ =gPlttBufferUnfaded
	mov r12, r2
	lsls r0, r7, 5
	add r0, r9
	adds r3, r0, 0
	adds r3, 0x14
_080DE830:
	ldrh r0, [r3]
	strh r0, [r1]
	subs r3, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _080DE830
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	adds r1, r5, 0
	adds r1, 0xB
	lsls r1, 1
	add r1, r12
	ldrh r6, [r1]
	movs r4, 0xA
	lsls r0, r7, 5
	add r0, r12
	adds r2, r0, 0
	adds r2, 0x14
_080DE85A:
	ldrh r0, [r2]
	strh r0, [r1]
	subs r2, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _080DE85A
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r12
	movs r1, 0
	strh r6, [r0]
	mov r0, r10
	add r0, r8
	lsls r0, 3
	ldr r2, _080DE89C @ =gTasks
	adds r0, r2
	strh r1, [r0, 0x12]
_080DE87E:
	ldr r0, _080DE8A8 @ =gUnknown_2037F02
	ldrh r1, [r0, 0xE]
	ldr r0, _080DE8AC @ =0x0000ffff
	cmp r1, r0
	bne _080DE88E
	mov r0, r8
	bl DestroyTask
_080DE88E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DE89C: .4byte gTasks
_080DE8A0: .4byte gPlttBufferFaded
_080DE8A4: .4byte gPlttBufferUnfaded
_080DE8A8: .4byte gUnknown_2037F02
_080DE8AC: .4byte 0x0000ffff
	thumb_func_end sub_80DE7DC

	thumb_func_start sub_80DE8B0
sub_80DE8B0: @ 80DE8B0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080DE914 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	mov r5, sp
	adds r5, 0x2
	movs r1, 0
	mov r2, sp
	adds r3, r5, 0
	bl sub_8076D9C
	ldr r0, _080DE918 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080DE8E4
	ldr r1, _080DE91C @ =gUnknown_2037F02
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080DE8E4:
	ldr r1, _080DE91C @ =gUnknown_2037F02
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	mov r2, sp
	ldrh r0, [r1, 0x4]
	ldrh r2, [r2]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x6]
	ldrh r5, [r5]
	adds r0, r5
	strh r0, [r4, 0x36]
	ldr r0, _080DE920 @ =0x0000ffce
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	ldr r0, _080DE924 @ =sub_80DE928
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DE914: .4byte gUnknown_2037F1B
_080DE918: .4byte gUnknown_2037F1A
_080DE91C: .4byte gUnknown_2037F02
_080DE920: .4byte 0x0000ffce
_080DE924: .4byte sub_80DE928
	thumb_func_end sub_80DE8B0

	thumb_func_start sub_80DE928
sub_80DE928: @ 80DE928
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080DE94A
	movs r1, 0
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	ldr r0, _080DE950 @ =sub_8074C44
	str r0, [r4, 0x1C]
	ldr r1, _080DE954 @ =sub_80DE958
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
_080DE94A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE950: .4byte sub_8074C44
_080DE954: .4byte sub_80DE958
	thumb_func_end sub_80DE928

	thumb_func_start sub_80DE958
sub_80DE958: @ 80DE958
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DE984
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_080DE984:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080DE998
	adds r0, r3, 0
	bl DestroyAnimSprite
_080DE998:
	pop {r0}
	bx r0
	thumb_func_end sub_80DE958

	thumb_func_start sub_80DE99C
sub_80DE99C: @ 80DE99C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8074FCC
	ldr r5, _080DE9CC @ =gUnknown_2037F02
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_8074FF8
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080DE9D0 @ =sub_8074F6C
	str r0, [r4, 0x1C]
	ldr r1, _080DE9D4 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DE9CC: .4byte gUnknown_2037F02
_080DE9D0: .4byte sub_8074F6C
_080DE9D4: .4byte DestroyAnimSprite
	thumb_func_end sub_80DE99C

	thumb_func_start sub_80DE9D8
sub_80DE9D8: @ 80DE9D8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DEA38
	adds r0, r4, 0
	bl sub_8074FCC
	ldr r5, _080DEA14 @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r1, [r5, r2]
	adds r0, r4, 0
	bl sub_8074FF8
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080DEA2C
	ldr r0, _080DEA18 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080DEA1C
	ldrh r0, [r5, 0x4]
	b _080DEA32
	.align 2, 0
_080DEA14: .4byte gUnknown_2037F02
_080DEA18: .4byte gUnknown_2037F1A
_080DEA1C:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r2, 0x6
	ldrsh r0, [r5, r2]
	negs r0, r0
	b _080DEA36
_080DEA2C:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	negs r0, r0
_080DEA32:
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x6]
_080DEA36:
	strh r0, [r4, 0x32]
_080DEA38:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	movs r3, 0xFF
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	strh r1, [r4, 0x24]
	ands r0, r3
	movs r1, 0x5
	bl Sin
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF0
	bls _080DEA90
	adds r0, r4, 0
	bl DestroyAnimSprite
_080DEA90:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE9D8

	thumb_func_start sub_80DEA98
sub_80DEA98: @ 80DEA98
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DEAAE
	adds r0, r2, 0
	bl DestroyAnimSprite
_080DEAAE:
	pop {r0}
	bx r0
	thumb_func_end sub_80DEA98

	thumb_func_start sub_80DEAB4
sub_80DEAB4: @ 80DEAB4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080DEAD0 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DEAD8
	ldr r1, _080DEAD4 @ =gUnknown_2037F02
	movs r0, 0
	b _080DEADC
	.align 2, 0
_080DEAD0: .4byte gUnknown_2037F1B
_080DEAD4: .4byte gUnknown_2037F02
_080DEAD8:
	ldr r1, _080DEAEC @ =gUnknown_2037F02
	movs r0, 0x1
_080DEADC:
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DEAEC: .4byte gUnknown_2037F02
	thumb_func_end sub_80DEAB4

	thumb_func_start sub_80DEAF0
sub_80DEAF0: @ 80DEAF0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080DEB04 @ =gUnknown_2037EE8
	ldr r0, [r0]
	cmp r0, 0
	ble _080DEB0C
	ldr r1, _080DEB08 @ =gUnknown_2037F02
	movs r0, 0
	b _080DEB10
	.align 2, 0
_080DEB04: .4byte gUnknown_2037EE8
_080DEB08: .4byte gUnknown_2037F02
_080DEB0C:
	ldr r1, _080DEB1C @ =gUnknown_2037F02
	movs r0, 0x1
_080DEB10:
	strh r0, [r1, 0xE]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080DEB1C: .4byte gUnknown_2037F02
	thumb_func_end sub_80DEAF0

	thumb_func_start sub_80DEB20
sub_80DEB20: @ 80DEB20
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _080DEB7C @ =0x00001f3f
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r0, _080DEB80 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080DEB84 @ =gUnknown_2022986
	strh r1, [r4]
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x44
	bl SetGpuReg
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075114
	ldrb r1, [r5, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r5, 0x1]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DEB88 @ =sub_80DEB8C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DEB7C: .4byte 0x00001f3f
_080DEB80: .4byte gUnknown_2022984
_080DEB84: .4byte gUnknown_2022986
_080DEB88: .4byte sub_80DEB8C
	thumb_func_end sub_80DEB20

	thumb_func_start sub_80DEB8C
sub_80DEB8C: @ 80DEB8C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _080DEC4C
	lsls r0, 2
	ldr r1, _080DEBA4 @ =_080DEBA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DEBA4: .4byte _080DEBA8
	.align 2, 0
_080DEBA8:
	.4byte _080DEBC0
	.4byte _080DEBDE
	.4byte _080DEBFE
	.4byte _080DEBDE
	.4byte _080DEC1E
	.4byte _080DEC2E
_080DEBC0:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DEC4C
	b _080DEC26
_080DEBDE:
	ldrh r0, [r4, 0x30]
	adds r0, 0x75
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080DEC4C
	movs r0, 0
	strh r0, [r4, 0x32]
	b _080DEC26
_080DEBFE:
	ldrh r0, [r4, 0x30]
	subs r0, 0x75
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x29
	bne _080DEC4C
	movs r0, 0
	strh r0, [r4, 0x32]
	b _080DEC26
_080DEC1E:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_080DEC26:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DEC4C
_080DEC2E:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DEC4C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DEC54 @ =sub_80DEC58
	str r0, [r4, 0x1C]
_080DEC4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DEC54: .4byte sub_80DEC58
	thumb_func_end sub_80DEB8C

	thumb_func_start sub_80DEC58
sub_80DEC58: @ 80DEC58
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080DEC8C @ =0x00003f3f
	movs r0, 0x4A
	bl SetGpuReg
	movs r0, 0
	bl GetGpuReg
	adds r1, r0, 0
	movs r2, 0x80
	lsls r2, 8
	adds r0, r2, 0
	eors r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DEC8C: .4byte 0x00003f3f
	thumb_func_end sub_80DEC58

	thumb_func_start sub_80DEC90
sub_80DEC90: @ 80DEC90
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080DED04 @ =gUnknown_2037F02
	movs r1, 0x6
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080DECBC
	ldr r4, _080DED08 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_080DECBC:
	ldrh r0, [r6]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	movs r3, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0x2]
	ldrh r4, [r5, 0x22]
	adds r0, r4
	strh r0, [r5, 0x22]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r4, _080DED0C @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080DED10 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080DED18
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldr r0, _080DED14 @ =0x0000fff4
	strh r0, [r5, 0x24]
	movs r0, 0x2
	b _080DED1E
	.align 2, 0
_080DED04: .4byte gUnknown_2037F02
_080DED08: .4byte gUnknown_2037F1A
_080DED0C: .4byte 0x000003ff
_080DED10: .4byte 0xfffffc00
_080DED14: .4byte 0x0000fff4
_080DED18:
	movs r0, 0xC
	strh r0, [r5, 0x24]
	ldr r0, _080DED3C @ =0x0000fffe
_080DED1E:
	strh r0, [r5, 0x30]
	ldr r1, _080DED40 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0xFF
	beq _080DED32
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x34]
_080DED32:
	ldr r0, _080DED44 @ =sub_80DED48
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DED3C: .4byte 0x0000fffe
_080DED40: .4byte gUnknown_2037F02
_080DED44: .4byte sub_80DED48
	thumb_func_end sub_80DEC90

	thumb_func_start sub_80DED48
sub_80DED48: @ 80DED48
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DED86
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080DEDA6
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DEDA6
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xD7
	bl PlaySE1WithPanning
	b _080DEDA6
_080DED86:
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x30]
	subs r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080DED98
	negs r0, r0
_080DED98:
	cmp r0, 0xC
	bne _080DEDA6
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	subs r0, r2, 0x1
	strh r0, [r4, 0x32]
_080DEDA6:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DEDB4
	adds r0, r4, 0
	bl DestroyAnimSprite
_080DEDB4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DED48

	thumb_func_start sub_80DEDBC
sub_80DEDBC: @ 80DEDBC
	push {lr}
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r1, 0xFF
	strh r1, [r0, 0x34]
	bl sub_80DEC90
	pop {r0}
	bx r0
	thumb_func_end sub_80DEDBC

	thumb_func_start sub_80DEDD8
sub_80DEDD8: @ 80DEDD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080DEE2C
	ldr r1, _080DEE14 @ =0x00001f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080DEE18 @ =gUnknown_2022988
	ldr r2, _080DEE1C @ =0x000098f0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080DEE20 @ =gUnknown_202298A
	movs r0, 0xA0
	strh r0, [r1]
	ldr r0, _080DEE24 @ =gUnknown_2022984
	ldrh r1, [r0]
	movs r0, 0x42
	bl SetGpuReg
	ldr r0, _080DEE28 @ =gUnknown_2022986
	ldrh r1, [r0]
	movs r0, 0x46
	bl SetGpuReg
	b _080DEE5C
	.align 2, 0
_080DEE14: .4byte 0x00001f3f
_080DEE18: .4byte gUnknown_2022988
_080DEE1C: .4byte 0x000098f0
_080DEE20: .4byte gUnknown_202298A
_080DEE24: .4byte gUnknown_2022984
_080DEE28: .4byte gUnknown_2022986
_080DEE2C:
	ldr r1, _080DEE68 @ =0x00001f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080DEE6C @ =gUnknown_2022988
	movs r0, 0xF0
	strh r0, [r1]
	ldr r4, _080DEE70 @ =gUnknown_202298A
	ldr r1, _080DEE74 @ =0x000078a0
	adds r0, r1, 0
	strh r0, [r4]
	movs r0, 0x42
	movs r1, 0xF0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x46
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 7
	movs r0, 0
	bl SetGpuRegBits
_080DEE5C:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DEE68: .4byte 0x00001f3f
_080DEE6C: .4byte gUnknown_2022988
_080DEE70: .4byte gUnknown_202298A
_080DEE74: .4byte 0x000078a0
	thumb_func_end sub_80DEDD8

	thumb_func_start sub_80DEE78
sub_80DEE78: @ 80DEE78
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080DEEB0 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, _080DEEB4 @ =gUnknown_2022988
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080DEEB8 @ =gUnknown_202298A
	strh r1, [r0]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080DEEA4
	movs r1, 0x80
	lsls r1, 7
	movs r0, 0
	bl ClearGpuRegBits
_080DEEA4:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DEEB0: .4byte 0x00003f3f
_080DEEB4: .4byte gUnknown_2022988
_080DEEB8: .4byte gUnknown_202298A
	thumb_func_end sub_80DEE78

	thumb_func_start sub_80DEEBC
sub_80DEEBC: @ 80DEEBC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080DEED0 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080DEED8
	ldr r4, _080DEED4 @ =gUnknown_2037F1A
	b _080DEEDA
	.align 2, 0
_080DEED0: .4byte gUnknown_2037F02
_080DEED4: .4byte gUnknown_2037F1A
_080DEED8:
	ldr r4, _080DEF2C @ =gUnknown_2037F1B
_080DEEDA:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x2]
	adds r0, r6
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r2, _080DEF30 @ =gUnknown_2037F02
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x26]
	movs r3, 0
	lsls r0, 16
	asrs r0, 16
	ldrh r4, [r2, 0x6]
	movs r6, 0x6
	ldrsh r1, [r2, r6]
	cmp r0, r1
	ble _080DEF12
	movs r3, 0x1
_080DEF12:
	strh r3, [r5, 0x2E]
	movs r0, 0
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0xA]
	strh r0, [r5, 0x34]
	strh r4, [r5, 0x36]
	ldr r0, _080DEF34 @ =sub_80DEF38
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DEF2C: .4byte gUnknown_2037F1B
_080DEF30: .4byte gUnknown_2037F02
_080DEF34: .4byte sub_80DEF38
	thumb_func_end sub_80DEEBC

	thumb_func_start sub_80DEF38
sub_80DEF38: @ 80DEF38
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r2, 0x30]
	ldr r1, _080DEF80 @ =gUnknown_825E074
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x26]
	adds r1, r0, r3
	strh r1, [r2, 0x26]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080DEF84
	lsls r0, r1, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _080DEF96
	adds r0, r2, 0
	bl DestroyAnimSprite
	b _080DEF96
	.align 2, 0
_080DEF80: .4byte gUnknown_825E074
_080DEF84:
	lsls r0, r1, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _080DEF96
	adds r0, r2, 0
	bl DestroyAnimSprite
_080DEF96:
	pop {r0}
	bx r0
	thumb_func_end sub_80DEF38

	thumb_func_start sub_80DEF9C
sub_80DEF9C: @ 80DEF9C
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DEFBC @ =gTasks
	adds r5, r1, r0
	ldr r0, _080DEFC0 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DEFC8
	ldr r4, _080DEFC4 @ =gUnknown_2037F1A
	b _080DEFCA
	.align 2, 0
_080DEFBC: .4byte gTasks
_080DEFC0: .4byte gUnknown_2037F02
_080DEFC4: .4byte gUnknown_2037F1A
_080DEFC8:
	ldr r4, _080DF010 @ =gUnknown_2037F1B
_080DEFCA:
	ldrb r0, [r4]
	bl sub_807492C
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	bl sub_80768B0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r6, 0
	adds r1, r0, 0
	adds r1, 0x24
	movs r2, 0
	strh r1, [r5, 0x8]
	strh r1, [r5, 0xA]
	subs r0, 0x21
	strh r0, [r5, 0xC]
	cmp r0, 0
	bge _080DEFF4
	strh r2, [r5, 0xC]
_080DEFF4:
	ldrh r0, [r5, 0x8]
	strh r0, [r5, 0xE]
	movs r0, 0x8
	strh r0, [r5, 0x10]
	ldr r1, _080DF014 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x12]
	strh r2, [r5, 0x14]
	strh r2, [r5, 0x16]
	cmp r7, 0x1
	bne _080DF01C
	ldr r0, _080DF018 @ =gUnknown_2022978
	b _080DF01E
	.align 2, 0
_080DF010: .4byte gUnknown_2037F1B
_080DF014: .4byte gUnknown_2037F02
_080DF018: .4byte gUnknown_2022978
_080DF01C:
	ldr r0, _080DF03C @ =gUnknown_202297C
_080DF01E:
	ldrh r2, [r0]
	strh r2, [r5, 0x18]
	adds r3, r2, 0
	adds r3, 0xF0
	strh r3, [r5, 0x1A]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x1C]
	movs r4, 0x4
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _080DF040
	strh r3, [r5, 0x1E]
	ldrh r3, [r5, 0x18]
	b _080DF044
	.align 2, 0
_080DF03C: .4byte gUnknown_202297C
_080DF040:
	strh r2, [r5, 0x1E]
	ldrh r3, [r5, 0x1A]
_080DF044:
	movs r0, 0
	strh r0, [r5, 0x26]
	ldrh r1, [r5, 0xC]
	lsls r2, r1, 16
	asrs r1, r2, 16
	movs r6, 0xE
	ldrsh r0, [r5, r6]
	cmp r1, r0
	bgt _080DF07A
	ldr r4, _080DF084 @ =gUnknown_2038700
	movs r0, 0xF0
	lsls r0, 3
	adds r0, r4
	mov r12, r0
_080DF060:
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	add r1, r12
	strh r3, [r1]
	adds r2, 0x1
	lsls r2, 16
	asrs r1, r2, 16
	movs r6, 0xE
	ldrsh r0, [r5, r6]
	cmp r1, r0
	ble _080DF060
_080DF07A:
	cmp r7, 0x1
	bne _080DF08C
	ldr r0, _080DF088 @ =0x04000014
	b _080DF08E
	.align 2, 0
_080DF084: .4byte gUnknown_2038700
_080DF088: .4byte 0x04000014
_080DF08C:
	ldr r0, _080DF0B8 @ =0x04000018
_080DF08E:
	str r0, [sp]
	ldr r0, _080DF0BC @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_8087EE4
	ldr r0, _080DF0C0 @ =sub_80DF0C4
	str r0, [r5]
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF0B8: .4byte 0x04000018
_080DF0BC: .4byte 0xa2600001
_080DF0C0: .4byte sub_80DF0C4
	thumb_func_end sub_80DEF9C

	thumb_func_start sub_80DF0C4
sub_80DF0C4: @ 80DF0C4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080DF114 @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _080DF0EC
	strh r2, [r4, 0x8]
_080DF0EC:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DF118
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _080DF11C
	strh r2, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0x26]
	b _080DF11C
	.align 2, 0
_080DF114: .4byte gTasks
_080DF118:
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
_080DF11C:
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DF148
	movs r0, 0
	strh r0, [r4, 0x14]
	movs r1, 0
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DF13A
	movs r1, 0x1
_080DF13A:
	strh r1, [r4, 0x16]
	cmp r1, 0
	beq _080DF144
	ldrh r0, [r4, 0x18]
	b _080DF146
_080DF144:
	ldrh r0, [r4, 0x1A]
_080DF146:
	strh r0, [r4, 0x20]
_080DF148:
	ldrh r1, [r4, 0x8]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _080DF17C
	ldr r5, _080DF1D4 @ =gUnknown_2038700
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080DF15E:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x20]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x20]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080DF15E
_080DF17C:
	ldrh r1, [r4, 0xA]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _080DF1B0
	ldr r5, _080DF1D4 @ =gUnknown_2038700
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080DF192:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x1E]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x1E]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _080DF192
_080DF1B0:
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080DF1CC
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DF1C6
	ldr r1, _080DF1D8 @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080DF1C6:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080DF1CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF1D4: .4byte gUnknown_2038700
_080DF1D8: .4byte gUnknown_2039600
	thumb_func_end sub_80DF0C4

	thumb_func_start sub_80DF1DC
sub_80DF1DC: @ 80DF1DC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080DF230 @ =gTasks
	adds r4, r0
	movs r5, 0
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	ldr r6, _080DF234 @ =gUnknown_2037F1A
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xE]
	movs r0, 0x20
	strh r0, [r4, 0x10]
	ldr r0, _080DF238 @ =0x0000ffec
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080DF23C @ =sub_80DF240
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DF230: .4byte gTasks
_080DF234: .4byte gUnknown_2037F1A
_080DF238: .4byte 0x0000ffec
_080DF23C: .4byte sub_80DF240
	thumb_func_end sub_80DF1DC

	thumb_func_start sub_80DF240
sub_80DF240: @ 80DF240
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DF26C @ =gTasks
	adds r6, r0, r1
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0x5
	bls _080DF260
	b _080DF41A
_080DF260:
	lsls r0, 2
	ldr r1, _080DF270 @ =_080DF274
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DF26C: .4byte gTasks
_080DF270: .4byte _080DF274
	.align 2, 0
_080DF274:
	.4byte _080DF28C
	.4byte _080DF34C
	.4byte _080DF37A
	.4byte _080DF38E
	.4byte _080DF3A4
	.4byte _080DF40C
_080DF28C:
	movs r0, 0xC
	ldrsh r2, [r6, r0]
	ldrh r1, [r6, 0xA]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DF2A2
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	subs r0, r2, r0
	b _080DF2A8
_080DF2A2:
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	adds r0, r2, r0
_080DF2A8:
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r2, [r6, 0x12]
	ldrh r0, [r6, 0xE]
	adds r2, r0
	ldr r0, _080DF33C @ =gUnknown_83E398C
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	ldrb r4, [r6, 0xA]
	movs r3, 0x6
	subs r3, r4
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xB3
	bl PlaySE12WithPanning
	cmp r4, 0x40
	beq _080DF30C
	ldr r5, _080DF340 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r3, r1, r5
	ldrh r0, [r6, 0xA]
	movs r2, 0x1
	ands r2, r0
	adds r3, 0x3F
	ldrb r4, [r3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r4
	orrs r0, r2
	strb r0, [r3]
	adds r5, 0x1C
	adds r1, r5
	ldr r0, _080DF344 @ =SpriteCallbackDummy
	str r0, [r1]
_080DF30C:
	ldrh r1, [r6, 0xA]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080DF324
	ldrh r0, [r6, 0x10]
	subs r0, 0x6
	strh r0, [r6, 0x10]
	ldrh r0, [r6, 0x12]
	subs r0, 0x6
	strh r0, [r6, 0x12]
_080DF324:
	ldrh r1, [r6, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080DF348 @ =gUnknown_83FF080
	adds r0, r6, 0
	bl sub_80762D0
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	strh r4, [r6, 0x8]
	b _080DF41A
	.align 2, 0
_080DF33C: .4byte gUnknown_83E398C
_080DF340: .4byte gSprites
_080DF344: .4byte SpriteCallbackDummy
_080DF348: .4byte gUnknown_83FF080
_080DF34C:
	adds r0, r6, 0
	bl sub_8076308
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080DF41A
	movs r2, 0xA
	ldrsh r1, [r6, r2]
	cmp r1, 0x6
	bne _080DF36C
	movs r0, 0x8
	strh r0, [r6, 0x14]
	movs r0, 0x3
	strh r0, [r6, 0x8]
	b _080DF41A
_080DF36C:
	cmp r1, 0x2
	bgt _080DF372
	movs r0, 0xA
_080DF372:
	strh r0, [r6, 0x14]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	b _080DF41A
_080DF37A:
	ldrh r0, [r6, 0x14]
	movs r2, 0x14
	ldrsh r1, [r6, r2]
	cmp r1, 0
	beq _080DF38A
	subs r0, 0x1
	strh r0, [r6, 0x14]
	b _080DF41A
_080DF38A:
	strh r1, [r6, 0x8]
	b _080DF41A
_080DF38E:
	ldrh r1, [r6, 0x14]
	movs r2, 0x14
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _080DF39E
	subs r0, r1, 0x1
	strh r0, [r6, 0x14]
	b _080DF41A
_080DF39E:
	movs r0, 0x4
	strh r0, [r6, 0x8]
	b _080DF41A
_080DF3A4:
	movs r5, 0
	movs r7, 0
	ldr r3, _080DF400 @ =gSprites
	movs r0, 0x1C
	adds r0, r3
	mov r8, r0
_080DF3B0:
	lsls r0, r5, 4
	adds r0, r5
	lsls r4, r0, 2
	adds r0, r3, 0
	adds r0, 0x14
	adds r0, r4, r0
	ldr r1, [r0]
	ldr r0, _080DF404 @ =gUnknown_83E398C
	cmp r1, r0
	bne _080DF3EC
	adds r0, r4, r3
	strh r2, [r0, 0x2E]
	movs r1, 0x6
	strh r1, [r0, 0x30]
	movs r1, 0x2
	str r2, [sp]
	str r3, [sp, 0x4]
	bl StartSpriteAnim
	mov r0, r8
	adds r1, r4, r0
	ldr r0, _080DF408 @ =sub_80DF428
	str r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	cmp r7, 0x6
	beq _080DF3F6
_080DF3EC:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3F
	bls _080DF3B0
_080DF3F6:
	strh r7, [r6, 0x14]
	movs r0, 0x5
	strh r0, [r6, 0x8]
	b _080DF41A
	.align 2, 0
_080DF400: .4byte gSprites
_080DF404: .4byte gUnknown_83E398C
_080DF408: .4byte sub_80DF428
_080DF40C:
	movs r1, 0x14
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080DF41A
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DF41A:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DF240

	thumb_func_start sub_80DF428
sub_80DF428: @ 80DF428
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DF45C
	ldr r3, _080DF464 @ =gTasks
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080DF45C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF464: .4byte gTasks
	thumb_func_end sub_80DF428

	thumb_func_start sub_80DF468
sub_80DF468: @ 80DF468
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DF47C
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075160
_080DF47C:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	bgt _080DF4AE
	ldrh r0, [r5, 0x2E]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080DF4A0
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _080DF4AC
_080DF4A0:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_080DF4AC:
	strb r0, [r2]
_080DF4AE:
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x1E
	ble _080DF4C4
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080DF4C4:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x3D
	bne _080DF510
	ldr r1, _080DF518 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldrh r0, [r5, 0x24]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x24]
	strh r1, [r5, 0x26]
	movs r0, 0x14
	strh r0, [r5, 0x2E]
	ldr r4, _080DF51C @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080DF520 @ =sub_8075590
	str r0, [r5, 0x1C]
_080DF510:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF518: .4byte DestroyAnimSprite
_080DF51C: .4byte gUnknown_2037F1B
_080DF520: .4byte sub_8075590
	thumb_func_end sub_80DF468

	thumb_func_start sub_80DF524
sub_80DF524: @ 80DF524
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080DF544 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DF548
	cmp r0, 0x1
	beq _080DF568
	b _080DF57A
	.align 2, 0
_080DF544: .4byte gTasks
_080DF548:
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080DF564 @ =gUnknown_83FF130
	adds r0, r4, 0
	bl sub_80762D0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DF57A
	.align 2, 0
_080DF564: .4byte gUnknown_83FF130
_080DF568:
	adds r0, r4, 0
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080DF57A
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DF57A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DF524

	thumb_func_start sub_80DF580
sub_80DF580: @ 80DF580
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DF5E0
	cmp r0, 0x1
	bgt _080DF5A0
	cmp r0, 0
	beq _080DF5AA
	b _080DF682
_080DF5A0:
	cmp r0, 0x2
	beq _080DF610
	cmp r0, 0x3
	beq _080DF664
	b _080DF682
_080DF5AA:
	ldr r4, _080DF5DC @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	adds r0, r6, 0
	movs r1, 0
	bl sub_80758E0
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x32]
	b _080DF658
	.align 2, 0
_080DF5DC: .4byte gUnknown_2037F1A
_080DF5E0:
	ldrh r0, [r5, 0x30]
	adds r0, 0x60
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	subs r0, 0x1A
	strh r0, [r5, 0x32]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	movs r0, 0x32
	ldrsh r2, [r5, r0]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080DF610
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_080DF610:
	ldrh r0, [r5, 0x30]
	adds r0, 0x60
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x30
	strh r0, [r5, 0x32]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	movs r0, 0x32
	ldrsh r2, [r5, r0]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _080DF682
	movs r0, 0
	strh r0, [r5, 0x34]
	ldr r1, _080DF660 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, 0
	bl sub_8075980
_080DF658:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DF682
	.align 2, 0
_080DF660: .4byte gSprites
_080DF664:
	ldrh r0, [r5, 0x26]
	subs r0, 0x6
	strh r0, [r5, 0x26]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080DF682
	adds r0, r5, 0
	bl DestroyAnimSprite
_080DF682:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DF580

	thumb_func_start sub_80DF688
sub_80DF688: @ 80DF688
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DF6A0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080DF6A8
	ldr r0, _080DF6A4 @ =0x0000fff0
	b _080DF6AC
	.align 2, 0
_080DF6A0: .4byte gUnknown_2037F1A
_080DF6A4: .4byte 0x0000fff0
_080DF6A8:
	movs r0, 0x80
	lsls r0, 1
_080DF6AC:
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x22]
	ldr r0, _080DF6BC @ =sub_80DF6C0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF6BC: .4byte sub_80DF6C0
	thumb_func_end sub_80DF688

	thumb_func_start sub_80DF6C0
sub_80DF6C0: @ 80DF6C0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x48
	strh r0, [r4, 0x2E]
	ldr r0, _080DF6E0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080DF6E4
	ldrh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 20
	b _080DF6EC
	.align 2, 0
_080DF6E0: .4byte gUnknown_2037F1A
_080DF6E4:
	ldrh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 20
	negs r0, r0
_080DF6EC:
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x10
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r5, r0, r1
	strh r5, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080DF738
	ldr r0, _080DF758 @ =gUnknown_83FF180
	ldrh r1, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x22]
	adds r2, r5
	lsls r2, 16
	asrs r2, 16
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSpriteAndAnimate
_080DF738:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x20
	movs r1, 0x98
	lsls r1, 1
	cmp r0, r1
	bls _080DF752
	adds r0, r4, 0
	bl DestroyAnimSprite
_080DF752:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF758: .4byte gUnknown_83FF180
	thumb_func_end sub_80DF6C0

	thumb_func_start sub_80DF75C
sub_80DF75C: @ 80DF75C
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080DF776
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x4
	b _080DF77E
_080DF776:
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x5
_080DF77E:
	ldr r3, _080DF7B0 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080DF7B4 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	bl Random
	movs r1, 0x7
	ands r0, r1
	adds r1, r0, 0
	cmp r1, 0x3
	ble _080DF7A0
	negs r0, r1
	lsls r0, 24
	lsrs r0, 24
_080DF7A0:
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080DF7B8 @ =sub_80DF7BC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF7B0: .4byte 0x000003ff
_080DF7B4: .4byte 0xfffffc00
_080DF7B8: .4byte sub_80DF7BC
	thumb_func_end sub_80DF75C

	thumb_func_start sub_80DF7BC
sub_80DF7BC: @ 80DF7BC
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	bgt _080DF7FE
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080DF832
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r0, 0
	b _080DF830
_080DF7FE:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x2
	bne _080DF814
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080DF814:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x3
	bne _080DF82C
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DF844 @ =0x0000ffff
	strh r0, [r3, 0x30]
_080DF82C:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
_080DF830:
	strh r0, [r3, 0x30]
_080DF832:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0x3C
	ble _080DF840
	adds r0, r3, 0
	bl DestroySprite
_080DF840:
	pop {r0}
	bx r0
	.align 2, 0
_080DF844: .4byte 0x0000ffff
	thumb_func_end sub_80DF7BC

	thumb_func_start sub_80DF848
sub_80DF848: @ 80DF848
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DF880 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DF888
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080DF884 @ =gUnknown_83FF198
	adds r0, r4, 0
	bl sub_80762D0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DF89A
	.align 2, 0
_080DF880: .4byte gTasks
_080DF884: .4byte gUnknown_83FF198
_080DF888:
	adds r0, r4, 0
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080DF89A
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DF89A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DF848

	thumb_func_start sub_80DF8A0
sub_80DF8A0: @ 80DF8A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DF8D8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DF8E0
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080DF8DC @ =gUnknown_83FF1C0
	adds r0, r4, 0
	bl sub_80762D0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DF8F2
	.align 2, 0
_080DF8D8: .4byte gTasks
_080DF8DC: .4byte gUnknown_83FF1C0
_080DF8E0:
	adds r0, r4, 0
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080DF8F2
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DF8F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DF8A0

	thumb_func_start sub_80DF8F8
sub_80DF8F8: @ 80DF8F8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DF90A
	cmp r0, 0x1
	beq _080DF934
	b _080DF95C
_080DF90A:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075160
	movs r0, 0x90
	lsls r0, 4
	strh r0, [r4, 0x30]
	ldr r0, _080DF930 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DF95C
	.align 2, 0
_080DF930: .4byte gUnknown_2037F1A
_080DF934:
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	subs r2, 0x60
	strh r2, [r4, 0x30]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080DF95C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080DF95C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DF8F8

	thumb_func_start sub_80DF964
sub_80DF964: @ 80DF964
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DF99C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DF9A4
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080DF9A0 @ =gUnknown_83FF210
	adds r0, r4, 0
	bl sub_80762D0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DF9B6
	.align 2, 0
_080DF99C: .4byte gTasks
_080DF9A0: .4byte gUnknown_83FF210
_080DF9A4:
	adds r0, r4, 0
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080DF9B6
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DF9B6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DF964

	thumb_func_start sub_80DF9BC
sub_80DF9BC: @ 80DF9BC
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080DF9E4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0x4
	bls _080DF9DA
	b _080DFBCE
_080DF9DA:
	lsls r0, 2
	ldr r1, _080DF9E8 @ =_080DF9EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DF9E4: .4byte gTasks
_080DF9E8: .4byte _080DF9EC
	.align 2, 0
_080DF9EC:
	.4byte _080DFA00
	.4byte _080DFA4C
	.4byte _080DFA86
	.4byte _080DFB1C
	.4byte _080DFB58
_080DFA00:
	movs r0, 0x4C
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080DFA24 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DFA28
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x1
	bl SetAnimBgAttribute
	b _080DFA32
	.align 2, 0
_080DFA24: .4byte gUnknown_2037F1A
_080DFA28:
	movs r0, 0x2
	movs r1, 0x2
	movs r2, 0x1
	bl SetAnimBgAttribute
_080DFA32:
	ldr r0, _080DFA44 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080DFA48 @ =gUnknown_2037F02
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	b _080DFB00
	.align 2, 0
_080DFA44: .4byte gTasks
_080DFA48: .4byte gUnknown_2037F02
_080DFA4C:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r5, r0, r3
	ldrh r0, [r5, 0xC]
	adds r1, r0, 0x1
	strh r1, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _080DFA64
	b _080DFBCE
_080DFA64:
	movs r0, 0
	strh r0, [r5, 0xC]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	ldrh r4, [r5, 0xA]
	lsls r1, r4, 4
	orrs r1, r4
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x4C
	bl SetGpuReg
	cmp r4, 0xF
	beq _080DFA84
	b _080DFBCE
_080DFA84:
	b _080DFB50
_080DFA86:
	ldr r6, _080DFAB4 @ =gUnknown_2037F1A
	ldrb r0, [r6]
	ldr r1, _080DFAB8 @ =gUnknown_2037F1B
	ldrb r1, [r1]
	lsls r4, r5, 2
	adds r2, r4, r5
	lsls r2, 3
	adds r2, r3
	ldrb r2, [r2, 0x1C]
	bl sub_8034BF4
	ldrb r1, [r6]
	mov r0, sp
	bl sub_8075300
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080DFABC
	movs r1, 0
	b _080DFAC6
	.align 2, 0
_080DFAB4: .4byte gUnknown_2037F1A
_080DFAB8: .4byte gUnknown_2037F1B
_080DFABC:
	ldrb r0, [r6]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r1, r0, 24
_080DFAC6:
	ldr r0, _080DFB08 @ =gMonSpritesGfxPtr
	ldr r2, [r0]
	lsls r0, r1, 2
	adds r2, 0x4
	adds r2, r0
	ldr r1, _080DFB0C @ =gBattleMonForms
	ldr r0, _080DFB10 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 11
	ldr r0, [r2]
	adds r0, r1
	ldr r1, [sp]
	ldr r2, _080DFB14 @ =0x04000200
	bl CpuSet
	ldr r1, [sp]
	movs r2, 0x80
	lsls r2, 4
	mov r0, sp
	ldrh r3, [r0, 0xA]
	movs r0, 0x1
	bl LoadBgTiles
	ldr r0, _080DFB18 @ =gTasks
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
_080DFB00:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080DFBCE
	.align 2, 0
_080DFB08: .4byte gMonSpritesGfxPtr
_080DFB0C: .4byte gBattleMonForms
_080DFB10: .4byte gUnknown_2037F1A
_080DFB14: .4byte 0x04000200
_080DFB18: .4byte gTasks
_080DFB1C:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r5, r0, r3
	ldrh r0, [r5, 0xC]
	adds r1, r0, 0x1
	strh r1, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DFBCE
	movs r0, 0
	strh r0, [r5, 0xC]
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
	strh r0, [r5, 0xA]
	ldrh r4, [r5, 0xA]
	lsls r1, r4, 4
	orrs r1, r4
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x4C
	bl SetGpuReg
	cmp r4, 0
	bne _080DFBCE
_080DFB50:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080DFBCE
_080DFB58:
	movs r0, 0x4C
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080DFB7C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DFB80
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl SetAnimBgAttribute
	b _080DFB8A
	.align 2, 0
_080DFB7C: .4byte gUnknown_2037F1A
_080DFB80:
	movs r0, 0x2
	movs r1, 0x2
	movs r2, 0
	bl SetAnimBgAttribute
_080DFB8A:
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080DFBC8
	ldr r4, _080DFBD8 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DFBC8
	ldr r0, _080DFBDC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x1C
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080DFBC8
	ldrb r0, [r4]
	ldr r1, _080DFBE0 @ =gUnknown_2024018
	ldr r1, [r1]
	ldr r2, [r1]
	lsls r1, r0, 2
	adds r1, r2
	ldrh r1, [r1, 0x2]
	bl SetBankEnemyShadowSpriteCallback
_080DFBC8:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DFBCE:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DFBD8: .4byte gUnknown_2037F1A
_080DFBDC: .4byte gTasks
_080DFBE0: .4byte gUnknown_2024018
	thumb_func_end sub_80DF9BC

	thumb_func_start c3_80DFBE4
c3_80DFBE4: @ 80DFBE4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080DFC14 @ =gUnknown_2037F02
	ldr r3, _080DFC18 @ =gSprites
	ldr r2, _080DFC1C @ =gUnknown_2023D44
	ldr r1, _080DFC20 @ =gUnknown_2037F1A
	ldrb r1, [r1]
	adds r1, r2
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	adds r1, 0x3E
	ldrb r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r4, 0xE]
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DFC14: .4byte gUnknown_2037F02
_080DFC18: .4byte gSprites
_080DFC1C: .4byte gUnknown_2023D44
_080DFC20: .4byte gUnknown_2037F1A
	thumb_func_end c3_80DFBE4

	thumb_func_start sub_80DFC24
sub_80DFC24: @ 80DFC24
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080DFC48 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	ldr r1, _080DFC4C @ =gUnknown_2037F1B
	ldrb r1, [r1]
	movs r2, 0x1
	bl sub_8034BF4
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DFC48: .4byte gUnknown_2037F1A
_080DFC4C: .4byte gUnknown_2037F1B
	thumb_func_end sub_80DFC24

	thumb_func_start sub_80DFC50
sub_80DFC50: @ 80DFC50
	push {r4,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080DFC78 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bls _080DFC6E
	b _080DFECA
_080DFC6E:
	lsls r0, 2
	ldr r1, _080DFC7C @ =_080DFC80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DFC78: .4byte gTasks
_080DFC7C: .4byte _080DFC80
	.align 2, 0
_080DFC80:
	.4byte _080DFC94
	.4byte _080DFD90
	.4byte _080DFDE0
	.4byte _080DFE4A
	.4byte _080DFE7E
_080DFC94:
	ldr r1, _080DFD18 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl SetAnimBgAttribute
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080DFCCE
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080DFCCE:
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080DFD1C @ =gUnknown_8D2A8C0
	bl sub_807543C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080DFD20 @ =gUnknown_8D2A808
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080DFD24 @ =gUnknown_8D2A8A8
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080DFD30
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
	ldr r1, _080DFD28 @ =gUnknown_2022978
	ldr r3, _080DFD2C @ =0x0000ffc8
	b _080DFD58
	.align 2, 0
_080DFD18: .4byte 0x00003f42
_080DFD1C: .4byte gUnknown_8D2A8C0
_080DFD20: .4byte gUnknown_8D2A808
_080DFD24: .4byte gUnknown_8D2A8A8
_080DFD28: .4byte gUnknown_2022978
_080DFD2C: .4byte 0x0000ffc8
_080DFD30:
	ldr r0, _080DFD48 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080DFD54
	ldr r1, _080DFD4C @ =gUnknown_2022978
	ldr r2, _080DFD50 @ =0x0000ff79
	adds r0, r2, 0
	b _080DFD5A
	.align 2, 0
_080DFD48: .4byte gUnknown_2037F1A
_080DFD4C: .4byte gUnknown_2022978
_080DFD50: .4byte 0x0000ff79
_080DFD54:
	ldr r1, _080DFD80 @ =gUnknown_2022978
	ldr r3, _080DFD84 @ =0x0000fff6
_080DFD58:
	adds r0, r3, 0
_080DFD5A:
	strh r0, [r1]
	ldr r1, _080DFD88 @ =gUnknown_202297A
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080DFD8C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080DFD80 @ =gUnknown_2022978
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	ldr r0, _080DFD88 @ =gUnknown_202297A
	ldrh r0, [r0]
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	b _080DFE66
	.align 2, 0
_080DFD80: .4byte gUnknown_2022978
_080DFD84: .4byte 0x0000fff6
_080DFD88: .4byte gUnknown_202297A
_080DFD8C: .4byte gTasks
_080DFD90:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0x10]
	adds r1, r0, 0x1
	strh r1, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bgt _080DFDA6
	b _080DFECA
_080DFDA6:
	movs r0, 0
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080DFDBC
	movs r0, 0xC
	strh r0, [r4, 0xA]
_080DFDBC:
	ldrh r0, [r4, 0xA]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0xC
	bne _080DFECA
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DFECA
_080DFDE0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _080DFDF8
	movs r0, 0
	strh r0, [r4, 0xA]
_080DFDF8:
	ldrh r0, [r4, 0xA]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DFECA
	ldr r2, _080DFE3C @ =gUnknown_2022978
	ldr r1, _080DFE40 @ =gUnknown_83FF240
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080DFE44
	strh r0, [r4, 0x8]
	b _080DFECA
	.align 2, 0
_080DFE3C: .4byte gUnknown_2022978
_080DFE40: .4byte gUnknown_83FF240
_080DFE44:
	movs r0, 0x3
	strh r0, [r4, 0x8]
	b _080DFECA
_080DFE4A:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xE]
	adds r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080DFECA
	movs r0, 0
	strh r0, [r1, 0xE]
	movs r0, 0x1
_080DFE66:
	strh r0, [r1, 0x8]
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xDD
	bl PlaySE12WithPanning
	b _080DFECA
_080DFE7E:
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	bl sub_8075358
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080DFEA0
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080DFEA0:
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	ldr r0, _080DFED4 @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080DFED8 @ =gUnknown_202297A
	strh r1, [r0]
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080DFECA:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DFED4: .4byte gUnknown_2022978
_080DFED8: .4byte gUnknown_202297A
	thumb_func_end sub_80DFC50

	thumb_func_start sub_80DFEDC
sub_80DFEDC: @ 80DFEDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	bl Random
	lsls r0, 16
	movs r1, 0xFC
	lsls r1, 14
	ands r1, r0
	lsrs r5, r1, 16
	adds r1, r5, 0
	cmp r1, 0x1F
	ble _080DFF06
	movs r0, 0x20
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_080DFF06:
	ldr r4, _080E0000 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r5
	strh r0, [r7, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r7, 0x22]
	ldr r1, _080E0004 @ =gUnknown_2037F02
	ldrh r0, [r1]
	strh r0, [r7, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r7, 0x32]
	ldr r4, _080E0008 @ =gUnknown_83FF26C
	movs r0, 0x20
	ldrsh r1, [r7, r0]
	movs r0, 0x22
	ldrsh r2, [r7, r0]
	adds r5, r7, 0
	adds r5, 0x43
	ldrb r3, [r5]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	bl CreateSprite
	mov r9, r0
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r0, 0x20
	ldrsh r1, [r7, r0]
	movs r0, 0x22
	ldrsh r2, [r7, r0]
	ldrb r3, [r5]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	bl CreateSprite
	mov r8, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r0, r9
	lsls r2, r0, 4
	add r2, r9
	lsls r2, 2
	ldr r1, _080E000C @ =gSprites
	mov r10, r1
	adds r5, r2, r1
	adds r0, r5, 0
	movs r1, 0x1
	str r2, [sp]
	bl StartSpriteAnim
	mov r0, r8
	lsls r6, r0, 4
	add r6, r8
	lsls r6, 2
	mov r1, r10
	adds r4, r6, r1
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r1, _080E0004 @ =gUnknown_2037F02
	ldrh r0, [r1]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x32]
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	ldr r0, _080E0010 @ =0x0000ffff
	strh r0, [r5, 0x3C]
	movs r0, 0x1
	negs r0, r0
	strh r0, [r4, 0x3C]
	adds r5, 0x3E
	ldrb r0, [r5]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5]
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x1C
	add r10, r0
	ldr r2, [sp]
	add r2, r10
	ldr r0, _080E0014 @ =sub_80E0128
	str r0, [r2]
	add r6, r10
	str r0, [r6]
	mov r1, r9
	strh r1, [r7, 0x3A]
	mov r0, r8
	strh r0, [r7, 0x3C]
	ldr r0, _080E0018 @ =sub_80E001C
	str r0, [r7, 0x1C]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0000: .4byte gUnknown_2037F1A
_080E0004: .4byte gUnknown_2037F02
_080E0008: .4byte gUnknown_83FF26C
_080E000C: .4byte gSprites
_080E0010: .4byte 0x0000ffff
_080E0014: .4byte sub_80E0128
_080E0018: .4byte sub_80E001C
	thumb_func_end sub_80DFEDC

	thumb_func_start sub_80E001C
sub_80E001C: @ 80E001C
	push {lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x32]
	ldrh r0, [r3, 0x34]
	adds r2, r0
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r3, 0x26]
	subs r1, r0
	strh r1, [r3, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r3, 0x34]
	movs r2, 0x36
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _080E006A
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	bge _080E006A
	ldr r2, _080E00C4 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r3, 0x36]
	adds r0, 0x1
	strh r0, [r3, 0x36]
_080E006A:
	movs r1, 0x36
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _080E009E
	movs r2, 0x26
	ldrsh r1, [r3, r2]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080E009E
	ldr r2, _080E00C4 @ =gSprites
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r3, 0x36]
	adds r0, 0x1
	strh r0, [r3, 0x36]
_080E009E:
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080E00C0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080E00C8 @ =sub_80E00CC
	str r0, [r3, 0x1C]
_080E00C0:
	pop {r0}
	bx r0
	.align 2, 0
_080E00C4: .4byte gSprites
_080E00C8: .4byte sub_80E00CC
	thumb_func_end sub_80E001C

	thumb_func_start sub_80E00CC
sub_80E00CC: @ 80E00CC
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080E0120 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r6, r5, 0
	adds r6, 0x1C
	adds r0, r3, r6
	ldr r2, [r0]
	ldr r0, _080E0124 @ =SpriteCallbackDummy
	cmp r2, r0
	bne _080E0118
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldr r0, [r1]
	cmp r0, r2
	bne _080E0118
	adds r0, r3, r5
	bl DestroySprite
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E0118:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E0120: .4byte gSprites
_080E0124: .4byte SpriteCallbackDummy
	thumb_func_end sub_80E00CC

	thumb_func_start sub_80E0128
sub_80E0128: @ 80E0128
	push {lr}
	adds r3, r0, 0
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080E0174
	ldrh r2, [r3, 0x32]
	ldrh r1, [r3, 0x34]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x26]
	subs r0, r1
	strh r0, [r3, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r3, 0x34]
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080E0174
	mov r1, r12
	ldrb r0, [r1]
	movs r1, 0x4
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldr r0, _080E0178 @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
_080E0174:
	pop {r0}
	bx r0
	.align 2, 0
_080E0178: .4byte SpriteCallbackDummy
	thumb_func_end sub_80E0128

	thumb_func_start sub_80E017C
sub_80E017C: @ 80E017C
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080E01A4 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _080E019A
	b _080E0476
_080E019A:
	lsls r0, 2
	ldr r1, _080E01A8 @ =_080E01AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E01A4: .4byte gTasks
_080E01A8: .4byte _080E01AC
	.align 2, 0
_080E01AC:
	.4byte _080E01C4
	.4byte _080E0304
	.4byte _080E038C
	.4byte _080E03C2
	.4byte _080E03F0
	.4byte _080E042A
_080E01C4:
	ldr r1, _080E0248 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _080E024C @ =0x00000d03
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl SetAnimBgAttribute
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080E01FC
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
_080E01FC:
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080E0250 @ =gUnknown_8D2A8C0
	bl sub_807543C
	mov r0, sp
	ldrb r0, [r0, 0x9]
	ldr r1, _080E0254 @ =gUnknown_8D2A808
	mov r2, sp
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080E0258 @ =gUnknown_8D2A8A8
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080E0264
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80730C0
	ldr r1, _080E025C @ =gUnknown_2022978
	ldr r3, _080E0260 @ =0x0000ffc8
	adds r0, r3, 0
	b _080E02CE
	.align 2, 0
_080E0248: .4byte 0x00003f42
_080E024C: .4byte 0x00000d03
_080E0250: .4byte gUnknown_8D2A8C0
_080E0254: .4byte gUnknown_8D2A808
_080E0258: .4byte gUnknown_8D2A8A8
_080E025C: .4byte gUnknown_2022978
_080E0260: .4byte 0x0000ffc8
_080E0264:
	ldr r0, _080E02A4 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E02B8
	ldr r1, _080E02A8 @ =gUnknown_2022978
	cmp r4, 0x1
	bne _080E0288
	ldr r2, _080E02AC @ =0x0000ff65
	adds r0, r2, 0
	strh r0, [r1]
_080E0288:
	cmp r4, 0x3
	bne _080E0292
	ldr r3, _080E02B0 @ =0x0000ff8d
	adds r0, r3, 0
	strh r0, [r1]
_080E0292:
	cmp r4, 0
	bne _080E029A
	movs r0, 0xE
	strh r0, [r1]
_080E029A:
	cmp r4, 0x2
	bne _080E02D0
	ldr r1, _080E02A8 @ =gUnknown_2022978
	ldr r2, _080E02B4 @ =0x0000ffec
	b _080E02CC
	.align 2, 0
_080E02A4: .4byte gUnknown_2037F1B
_080E02A8: .4byte gUnknown_2022978
_080E02AC: .4byte 0x0000ff65
_080E02B0: .4byte 0x0000ff8d
_080E02B4: .4byte 0x0000ffec
_080E02B8:
	cmp r4, 0x1
	bne _080E02C4
	ldr r1, _080E02F0 @ =gUnknown_2022978
	ldr r3, _080E02F4 @ =0x0000ff79
	adds r0, r3, 0
	strh r0, [r1]
_080E02C4:
	cmp r4, 0
	bne _080E02D0
	ldr r1, _080E02F0 @ =gUnknown_2022978
	ldr r2, _080E02F8 @ =0x0000fff6
_080E02CC:
	adds r0, r2, 0
_080E02CE:
	strh r0, [r1]
_080E02D0:
	ldr r1, _080E02FC @ =gUnknown_202297A
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080E0300 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080E02F0 @ =gUnknown_2022978
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	ldr r0, _080E02FC @ =gUnknown_202297A
	ldrh r0, [r0]
	strh r0, [r1, 0x1E]
	b _080E0384
	.align 2, 0
_080E02F0: .4byte gUnknown_2022978
_080E02F4: .4byte 0x0000ff79
_080E02F8: .4byte 0x0000fff6
_080E02FC: .4byte gUnknown_202297A
_080E0300: .4byte gTasks
_080E0304:
	ldr r1, _080E0338 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0
	strh r0, [r5, 0xE]
	ldr r0, _080E033C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E0348
	ldr r2, _080E0340 @ =gUnknown_2022978
	ldr r1, _080E0344 @ =gUnknown_83FF284
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r5, [r5, 0x1C]
	adds r0, r5
	b _080E035A
	.align 2, 0
_080E0338: .4byte gTasks
_080E033C: .4byte gUnknown_2037F1B
_080E0340: .4byte gUnknown_2022978
_080E0344: .4byte gUnknown_83FF284
_080E0348:
	ldr r2, _080E0378 @ =gUnknown_2022978
	ldr r1, _080E037C @ =gUnknown_83FF284
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, 0x1C]
	subs r0, r1
_080E035A:
	strh r0, [r2]
	ldr r0, _080E0380 @ =gTasks
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080E0384
	strh r0, [r1, 0x8]
	b _080E0476
	.align 2, 0
_080E0378: .4byte gUnknown_2022978
_080E037C: .4byte gUnknown_83FF284
_080E0380: .4byte gTasks
_080E0384:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080E0476
_080E038C:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080E03A6
	movs r0, 0x5
	strh r0, [r4, 0xA]
_080E03A6:
	ldrh r1, [r4, 0xA]
	lsls r1, 8
	movs r0, 0x3
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bne _080E0476
	b _080E03E2
_080E03C2:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r1, [r4, 0xE]
	adds r1, 0x1
	strh r1, [r4, 0xE]
	lsls r1, 16
	asrs r1, 16
	ldr r2, _080E03EC @ =gUnknown_83FF288
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	adds r0, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _080E0476
_080E03E2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E0476
	.align 2, 0
_080E03EC: .4byte gUnknown_83FF288
_080E03F0:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	ble _080E040A
	movs r0, 0xD
	strh r0, [r4, 0xA]
_080E040A:
	ldrh r1, [r4, 0xA]
	lsls r1, 8
	movs r0, 0x3
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0xD
	bne _080E0476
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _080E0476
_080E042A:
	mov r0, sp
	bl sub_80752A0
	mov r0, sp
	ldrb r0, [r0, 0x9]
	bl sub_8075358
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080E044C
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
_080E044C:
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	ldr r0, _080E0480 @ =gUnknown_2022978
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E0484 @ =gUnknown_202297A
	strh r1, [r0]
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080E0476:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E0480: .4byte gUnknown_2022978
_080E0484: .4byte gUnknown_202297A
	thumb_func_end sub_80E017C

	thumb_func_start sub_80E0488
sub_80E0488: @ 80E0488
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080E04C0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E04C8
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080E04C4 @ =gUnknown_83FF290
	adds r0, r4, 0
	bl sub_80762D0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E04DA
	.align 2, 0
_080E04C0: .4byte gTasks
_080E04C4: .4byte gUnknown_83FF290
_080E04C8:
	adds r0, r4, 0
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080E04DA
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080E04DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E0488

	thumb_func_start sub_80E04E0
sub_80E04E0: @ 80E04E0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _080E04FE
	adds r0, r4, 0
	movs r1, 0
	bl sub_8075160
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080E0552
_080E04FE:
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	cmp r1, 0x14
	ble _080E0552
	ldrh r0, [r4, 0x30]
	adds r0, 0xA0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	adds r0, 0x80
	strh r0, [r4, 0x32]
	ldr r0, _080E052C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080E0530
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	b _080E0536
	.align 2, 0
_080E052C: .4byte gUnknown_2037F1A
_080E0530:
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
_080E0536:
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	ble _080E0552
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E0552:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E04E0

	thumb_func_start sub_80E0558
sub_80E0558: @ 80E0558
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E057C @ =gTasks
	adds r4, r0, r1
	ldr r5, _080E0580 @ =gUnknown_2037F02
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080E0584
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	b _080E0618
	.align 2, 0
_080E057C: .4byte gTasks
_080E0580: .4byte gUnknown_2037F02
_080E0584:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bge _080E0590
	movs r0, 0
	strh r0, [r5, 0x4]
_080E0590:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0x2
	ble _080E059C
	movs r0, 0x2
	strh r0, [r5, 0x4]
_080E059C:
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r1, 1
	movs r0, 0x8
	subs r0, r1
	strh r0, [r4, 0xE]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	lsls r0, 7
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r4, 0x10]
	ldrh r0, [r5, 0x4]
	adds r0, 0x2
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x14]
	ldrb r0, [r5]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080E05E8
	ldr r0, _080E05E4 @ =gUnknown_2037F1A
	b _080E05EA
	.align 2, 0
_080E05E4: .4byte gUnknown_2037F1A
_080E05E8:
	ldr r0, _080E0620 @ =gUnknown_2037F1B
_080E05EA:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E0608
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x12]
_080E0608:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80758E0
	ldr r0, _080E0624 @ =sub_80E0628
	str r0, [r4]
_080E0618:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E0620: .4byte gUnknown_2037F1B
_080E0624: .4byte sub_80E0628
	thumb_func_end sub_80E0558

	thumb_func_start sub_80E0628
sub_80E0628: @ 80E0628
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080E064C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r6, [r4, r0]
	cmp r6, 0x1
	beq _080E06B0
	cmp r6, 0x1
	bgt _080E0650
	cmp r6, 0
	beq _080E065C
	b _080E0788
	.align 2, 0
_080E064C: .4byte gTasks
_080E0650:
	cmp r6, 0x2
	beq _080E0708
	cmp r6, 0x3
	bne _080E065A
	b _080E0778
_080E065A:
	b _080E0788
_080E065C:
	ldr r2, _080E06AC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x10]
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80759DC
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080E0788
	strh r6, [r4, 0xA]
	b _080E0770
	.align 2, 0
_080E06AC: .4byte gSprites
_080E06B0:
	ldr r2, _080E0704 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0x12]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0xC]
	adds r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80759DC
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 1
	cmp r1, r0
	blt _080E0788
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080E0770
	.align 2, 0
_080E0704: .4byte gSprites
_080E0708:
	ldr r2, _080E076C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	movs r5, 0
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x10]
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80759DC
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080E0788
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080E0770
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0x8]
	b _080E0788
	.align 2, 0
_080E076C: .4byte gSprites
_080E0770:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E0788
_080E0778:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8075980
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080E0788:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E0628

	thumb_func_start sub_80E0790
sub_80E0790: @ 80E0790
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E07AC @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080E07B4
	strh r0, [r4, 0x20]
	ldr r1, _080E07B0 @ =gUnknown_2037F02
	ldrh r0, [r1]
	b _080E07BE
	.align 2, 0
_080E07AC: .4byte gUnknown_2037F1A
_080E07B0: .4byte gUnknown_2037F02
_080E07B4:
	movs r0, 0xF0
	strh r0, [r4, 0x20]
	ldr r1, _080E07D8 @ =gUnknown_2037F02
	ldrh r0, [r1]
	subs r0, 0x1E
_080E07BE:
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrb r1, [r1, 0x2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080E07DC @ =sub_80E07E0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E07D8: .4byte gUnknown_2037F02
_080E07DC: .4byte sub_80E07E0
	thumb_func_end sub_80E0790

	thumb_func_start sub_80E07E0
sub_80E07E0: @ 80E07E0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x3
	strh r0, [r4, 0x2E]
	ldr r0, _080E0820 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E0824
	ldrh r1, [r4, 0x20]
	adds r1, 0x5
	strh r1, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF0
	ble _080E0812
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E0812:
	ldrh r1, [r4, 0x2E]
	movs r0, 0xFF
	ands r0, r1
	movs r1, 0x10
	bl Sin
	b _080E0848
	.align 2, 0
_080E0820: .4byte gUnknown_2037F1A
_080E0824:
	ldrh r1, [r4, 0x20]
	subs r1, 0x5
	strh r1, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	lsls r1, 16
	cmp r1, 0
	bge _080E083C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E083C:
	ldrh r1, [r4, 0x2E]
	movs r0, 0xFF
	ands r0, r1
	movs r1, 0x10
	bl Cos
_080E0848:
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E07E0

	thumb_func_start sub_80E0850
sub_80E0850: @ 80E0850
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080E0898 @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r0, 0x20
	strh r0, [r4, 0x20]
	movs r0, 0x40
	strh r0, [r4, 0x22]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x24]
	ldr r0, _080E089C @ =gUnknown_2037F02
	ldrb r0, [r0]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	movs r1, 0
	bl sub_80758E0
	ldr r0, _080E08A0 @ =sub_80E08A4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0898: .4byte gTasks
_080E089C: .4byte gUnknown_2037F02
_080E08A0: .4byte sub_80E08A4
	thumb_func_end sub_80E0850

	thumb_func_start sub_80E08A4
sub_80E08A4: @ 80E08A4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080E08D0 @ =gTasks
	adds r7, r0, r1
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	mov r8, r0
	cmp r0, 0x1
	beq _080E0940
	cmp r0, 0x1
	bgt _080E08D4
	cmp r0, 0
	beq _080E08DC
	b _080E09BA
	.align 2, 0
_080E08D0: .4byte gTasks
_080E08D4:
	mov r2, r8
	cmp r2, 0x2
	beq _080E09A8
	b _080E09BA
_080E08DC:
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ldrh r1, [r7, 0xC]
	adds r2, r0, r1
	strh r2, [r7, 0xC]
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r3, [r7, 0x24]
	mov r8, r3
	movs r3, 0x24
	ldrsh r1, [r7, r3]
	cmp r0, r1
	blt _080E09BA
	mov r0, r8
	subs r5, r0, r2
	lsls r5, 16
	asrs r5, 16
	adds r6, r1, 0
	lsls r6, 1
	adds r0, r5, 0
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x1
	ands r4, r1
	cmp r4, 0
	bne _080E0934
	lsls r0, 16
	asrs r0, 16
	mov r2, r8
	subs r0, r2, r0
	b _080E0992
_080E0934:
	lsls r0, 16
	asrs r0, 16
	mov r3, r8
	subs r0, r3
	strh r0, [r7, 0xC]
	b _080E09BA
_080E0940:
	ldr r1, _080E0998 @ =0xfffffe00
	adds r0, r1, 0
	ldrh r2, [r7, 0xC]
	adds r1, r0, r2
	strh r1, [r7, 0xC]
	movs r3, 0xC
	ldrsh r0, [r7, r3]
	movs r2, 0x24
	ldrsh r6, [r7, r2]
	cmn r0, r6
	bgt _080E09BA
	ldrh r3, [r7, 0x24]
	mov r9, r3
	mov r0, r9
	subs r4, r0, r1
	lsls r4, 16
	asrs r4, 16
	lsls r6, 1
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	adds r1, r6, 0
	bl __modsi3
	lsls r0, 16
	lsrs r2, r0, 16
	mov r1, r8
	ands r1, r5
	lsls r0, r1, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _080E099C
	lsls r0, r2, 16
	asrs r0, 16
	mov r2, r9
	subs r0, r2
_080E0992:
	strh r0, [r7, 0xC]
	strh r1, [r7, 0x8]
	b _080E09BA
	.align 2, 0
_080E0998: .4byte 0xfffffe00
_080E099C:
	lsls r0, r2, 16
	asrs r0, 16
	mov r3, r9
	subs r0, r3, r0
	strh r0, [r7, 0xC]
	b _080E09BA
_080E09A8:
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8075980
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080E0A30
_080E09BA:
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r7, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80759DC
	ldr r2, _080E0A28 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0xC
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bge _080E09EE
	adds r0, 0x3F
_080E09EE:
	asrs r0, 6
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r7, 0xA]
	adds r0, 0x1
	strh r0, [r7, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080E0A30
	ldrh r1, [r7, 0x20]
	movs r3, 0x20
	ldrsh r0, [r7, r3]
	cmp r0, 0
	beq _080E0A2C
	subs r0, r1, 0x1
	strh r0, [r7, 0x20]
	ldrh r0, [r7, 0x24]
	ldrh r1, [r7, 0x22]
	subs r0, r1
	strh r0, [r7, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _080E0A30
	movs r0, 0x10
	strh r0, [r7, 0x24]
	b _080E0A30
	.align 2, 0
_080E0A28: .4byte gSprites
_080E0A2C:
	movs r0, 0x2
	strh r0, [r7, 0x8]
_080E0A30:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E08A4

	thumb_func_start sub_80E0A3C
sub_80E0A3C: @ 80E0A3C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080E0A9C
	ldr r6, _080E0A94 @ =gUnknown_2037F02
	movs r2, 0x4
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _080E0A70
	ldr r4, _080E0A98 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_080E0A70:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrh r1, [r6, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r1, r2
	strh r0, [r5, 0x22]
	movs r0, 0x80
	strh r0, [r5, 0x30]
	movs r0, 0xC0
	lsls r0, 2
	strh r0, [r5, 0x32]
	strh r1, [r5, 0x34]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080E0AFA
	.align 2, 0
_080E0A94: .4byte gUnknown_2037F02
_080E0A98: .4byte gUnknown_2037F1A
_080E0A9C:
	ldrh r1, [r5, 0x30]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r5, 0x26]
	adds r0, r2
	strh r0, [r5, 0x26]
	movs r2, 0x36
	ldrsh r0, [r5, r2]
	adds r4, r1, 0
	cmp r0, 0
	bne _080E0ADA
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmn r1, r0
	ble _080E0ADA
	movs r0, 0x1
	strh r0, [r5, 0x36]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	negs r0, r0
	movs r1, 0x3
	bl __divsi3
	lsls r0, 1
	strh r0, [r5, 0x32]
_080E0ADA:
	adds r0, r4, 0
	adds r0, 0xC0
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x80
	strh r0, [r5, 0x32]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E0AFA
	adds r0, r5, 0
	bl DestroyAnimSprite
_080E0AFA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E0A3C

	thumb_func_start sub_80E0B00
sub_80E0B00: @ 80E0B00
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldr r1, _080E0B30 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080E0C0C
	ldr r0, _080E0B34 @ =gUnknown_2037F02
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r8, r0
	cmp r1, 0
	bne _080E0B3C
	ldr r0, _080E0B38 @ =gUnknown_2037F1A
	b _080E0B3E
	.align 2, 0
_080E0B30: .4byte gTasks
_080E0B34: .4byte gUnknown_2037F02
_080E0B38: .4byte gUnknown_2037F1A
_080E0B3C:
	ldr r0, _080E0B78 @ =gUnknown_2037F1B
_080E0B3E:
	ldrb r0, [r0]
	strh r0, [r2, 0x1E]
	mov r1, r8
	ldrb r0, [r1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E0B7C @ =gTasks
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r6, r0, r1
	strh r5, [r6, 0x1C]
	adds r0, r5, 0
	movs r1, 0
	bl sub_80758E0
	mov r2, r8
	movs r3, 0x2
	ldrsh r0, [r2, r3]
	cmp r0, 0x1
	beq _080E0BA0
	cmp r0, 0x1
	bgt _080E0B80
	cmp r0, 0
	beq _080E0B88
	lsls r2, r5, 4
	b _080E0BE8
	.align 2, 0
_080E0B78: .4byte gUnknown_2037F1B
_080E0B7C: .4byte gTasks
_080E0B80:
	cmp r0, 0x2
	beq _080E0BAA
	lsls r2, r5, 4
	b _080E0BE8
_080E0B88:
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r5, 0
	movs r1, 0xE0
	movs r3, 0
	bl obj_id_set_rotscale
	adds r0, r5, 0
	bl sub_8076440
	lsls r2, r5, 4
	b _080E0BE8
_080E0BA0:
	movs r2, 0x98
	lsls r2, 1
	movs r3, 0xF0
	lsls r3, 4
	b _080E0BB2
_080E0BAA:
	movs r2, 0x98
	lsls r2, 1
	movs r3, 0xF1
	lsls r3, 8
_080E0BB2:
	adds r0, r5, 0
	movs r1, 0xD0
	bl obj_id_set_rotscale
	adds r0, r5, 0
	bl sub_8076440
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _080E0BD8
	ldrb r0, [r6, 0x1E]
	bl GetBattlerSide
	lsls r0, 24
	lsls r2, r5, 4
	cmp r0, 0
	bne _080E0BE8
_080E0BD8:
	ldr r0, _080E0C04 @ =gSprites
	lsls r2, r5, 4
	adds r1, r2, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x10
	strh r0, [r1, 0x26]
_080E0BE8:
	ldr r1, _080E0C04 @ =gSprites
	adds r0, r2, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x24]
	ldr r0, _080E0C08 @ =gTasks
	adds r1, r4, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080E0C58
	.align 2, 0
_080E0C04: .4byte gSprites
_080E0C08: .4byte gTasks
_080E0C0C:
	ldrb r5, [r2, 0x1C]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080E0C30
	strh r4, [r2, 0xC]
	ldr r0, _080E0C64 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x24]
	negs r0, r0
	strh r0, [r1, 0x24]
_080E0C30:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	bne _080E0C58
	adds r0, r5, 0
	bl sub_8075980
	ldr r1, _080E0C64 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x24]
	strh r4, [r0, 0x26]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080E0C58:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0C64: .4byte gSprites
	thumb_func_end sub_80E0B00

	thumb_func_start sub_80E0C68
sub_80E0C68: @ 80E0C68
	push {r4,r5,lr}
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xC
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, r0
	ldr r3, _080E0CB4 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080E0CB8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	bl Random
	ldr r5, _080E0CBC @ =0x000001ff
	ands r5, r0
	bl Random
	movs r1, 0xFF
	ands r1, r0
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _080E0CC0
	movs r2, 0xBC
	lsls r2, 3
	adds r0, r5, r2
	b _080E0CC8
	.align 2, 0
_080E0CB4: .4byte 0x000003ff
_080E0CB8: .4byte 0xfffffc00
_080E0CBC: .4byte 0x000001ff
_080E0CC0:
	movs r3, 0xBC
	lsls r3, 3
	adds r0, r3, 0
	subs r0, r5
_080E0CC8:
	strh r0, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E0CDA
	movs r2, 0x90
	lsls r2, 3
	adds r0, r1, r2
	b _080E0CE2
_080E0CDA:
	movs r3, 0x90
	lsls r3, 3
	adds r0, r3, 0
	subs r0, r1
_080E0CE2:
	strh r0, [r4, 0x30]
	ldr r0, _080E0CF4 @ =gUnknown_2037F02
	ldrh r0, [r0]
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _080E0CFC
	ldr r0, _080E0CF8 @ =0x0000fff8
	b _080E0CFE
	.align 2, 0
_080E0CF4: .4byte gUnknown_2037F02
_080E0CF8: .4byte 0x0000fff8
_080E0CFC:
	movs r0, 0xF8
_080E0CFE:
	strh r0, [r4, 0x20]
	movs r0, 0x68
	strh r0, [r4, 0x22]
	ldr r0, _080E0D10 @ =sub_80E0D14
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E0D10: .4byte sub_80E0D14
	thumb_func_end sub_80E0C68

	thumb_func_start sub_80E0D14
sub_80E0D14: @ 80E0D14
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E0D2C
	ldrh r3, [r4, 0x2E]
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	b _080E0D36
_080E0D2C:
	ldrh r3, [r4, 0x2E]
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
_080E0D36:
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	adds r0, r3, 0
	subs r0, 0x16
	strh r0, [r4, 0x2E]
	adds r1, r2, 0
	subs r1, 0x30
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _080E0D5A
	movs r0, 0
	strh r0, [r4, 0x2E]
_080E0D5A:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080E0D6E
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E0D6E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E0D14

	thumb_func_start sub_80E0D74
sub_80E0D74: @ 80E0D74
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _080E0DD8 @ =0x00001f3f
	movs r0, 0x4A
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r0, _080E0DDC @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080E0DE0 @ =gUnknown_2022986
	strh r1, [r4]
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, _080E0DE4 @ =gUnknown_2037F02
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8075114
	ldrb r1, [r5, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r5, 0x1]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080E0DE8 @ =sub_80E0DEC
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E0DD8: .4byte 0x00001f3f
_080E0DDC: .4byte gUnknown_2022984
_080E0DE0: .4byte gUnknown_2022986
_080E0DE4: .4byte gUnknown_2037F02
_080E0DE8: .4byte sub_80E0DEC
	thumb_func_end sub_80E0D74

	thumb_func_start sub_80E0DEC
sub_80E0DEC: @ 80E0DEC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080E0E2A
	cmp r0, 0x1
	bgt _080E0E02
	cmp r0, 0
	beq _080E0E0C
	b _080E0E8A
_080E0E02:
	cmp r0, 0x2
	beq _080E0E40
	cmp r0, 0x3
	beq _080E0E62
	b _080E0E8A
_080E0E0C:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080E0E8A
	b _080E0E5A
_080E0E2A:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080E0E8A
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _080E0E5A
_080E0E40:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080E0E8A
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080E0E5A:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	b _080E0E8A
_080E0E62:
	ldr r1, _080E0E90 @ =0x00003f3f
	movs r0, 0x4A
	bl SetGpuReg
	movs r0, 0
	bl GetGpuReg
	adds r1, r0, 0
	movs r2, 0x80
	lsls r2, 8
	adds r0, r2, 0
	eors r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E0E8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0E90: .4byte 0x00003f3f
	thumb_func_end sub_80E0DEC

	thumb_func_start sub_80E0E94
sub_80E0E94: @ 80E0E94
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E0ED0 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r1, _080E0ED4 @ =gUnknown_2037F02
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldr r1, _080E0ED8 @ =sub_80E0EDC
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E0ED0: .4byte gUnknown_2037F1A
_080E0ED4: .4byte gUnknown_2037F02
_080E0ED8: .4byte sub_80E0EDC
	thumb_func_end sub_80E0E94

	thumb_func_start sub_80E0EDC
sub_80E0EDC: @ 80E0EDC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, 0x34]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x9
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	lsls r1, r0, 16
	cmp r0, 0x3F
	bls _080E0F16
	asrs r0, r1, 16
	cmp r0, 0xC3
	ble _080E0F28
_080E0F16:
	ldr r0, _080E0F24 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_807685C
	subs r0, 0x1
	b _080E0F32
	.align 2, 0
_080E0F24: .4byte gUnknown_2037F1A
_080E0F28:
	ldr r0, _080E0F74 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_807685C
	adds r0, 0x1
_080E0F32:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r3, 0x38
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _080E0F78
	movs r1, 0x80
	lsls r1, 3
	adds r0, r1, 0
	ldrh r3, [r4, 0x32]
	adds r0, r3
	strh r0, [r4, 0x32]
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r3, [r4, 0x34]
	adds r0, r3
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080E0FA8
	strh r2, [r4, 0x36]
	movs r0, 0x1
	strh r0, [r4, 0x38]
	b _080E0FA8
	.align 2, 0
_080E0F74: .4byte gUnknown_2037F1A
_080E0F78:
	cmp r2, 0x1
	bne _080E0FA8
	ldr r1, _080E0FB0 @ =0xfffffc00
	adds r0, r1, 0
	ldrh r2, [r4, 0x32]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldr r3, _080E0FB4 @ =0xffffff00
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080E0FA8
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E0FA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0FB0: .4byte 0xfffffc00
_080E0FB4: .4byte 0xffffff00
	thumb_func_end sub_80E0EDC

	thumb_func_start sub_80E0FB8
sub_80E0FB8: @ 80E0FB8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r0, _080E1040 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080E107C
	movs r0, 0
	str r0, [sp, 0x1C]
	ldr r6, _080E1044 @ =gBattlerPartyIndexes
	ldr r4, _080E1048 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r7, _080E104C @ =gPlayerParty
	adds r0, r7
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldr r0, _080E1050 @ =gUnknown_2024018
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080E1074
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E1054
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
	b _080E1062
	.align 2, 0
_080E1040: .4byte gUnknown_2037F1A
_080E1044: .4byte gBattlerPartyIndexes
_080E1048: .4byte gUnknown_2037F1B
_080E104C: .4byte gPlayerParty
_080E1050: .4byte gUnknown_2024018
_080E1054:
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	ldr r1, _080E1070 @ =gEnemyParty
	adds r0, r1
_080E1062:
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	b _080E1076
	.align 2, 0
_080E1070: .4byte gEnemyParty
_080E1074:
	ldrh r6, [r1, 0x2]
_080E1076:
	movs r1, 0x14
	mov r8, r1
	b _080E1112
_080E107C:
	movs r2, 0x1
	str r2, [sp, 0x1C]
	ldr r6, _080E10E0 @ =gBattlerPartyIndexes
	ldr r4, _080E10E4 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r7, _080E10E8 @ =gEnemyParty
	adds r0, r7
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldr r0, _080E10EC @ =gUnknown_2024018
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080E110C
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E10F4
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	ldr r1, _080E10F0 @ =gPlayerParty
	adds r0, r1
	b _080E1100
	.align 2, 0
_080E10E0: .4byte gBattlerPartyIndexes
_080E10E4: .4byte gUnknown_2037F1B
_080E10E8: .4byte gEnemyParty
_080E10EC: .4byte gUnknown_2024018
_080E10F0: .4byte gPlayerParty
_080E10F4:
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
_080E1100:
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	b _080E110E
_080E110C:
	ldrh r6, [r1, 0x2]
_080E110E:
	ldr r3, _080E11FC @ =0x0000ffec
	mov r8, r3
_080E1112:
	ldr r0, _080E1200 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl sub_8076884
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _080E1200 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	mov r2, r8
	lsls r1, r2, 16
	asrs r1, 16
	adds r4, r1
	lsls r4, 16
	asrs r4, 16
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	mov r3, r10
	str r3, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	ldr r0, _080E1204 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	str r0, [sp, 0x10]
	movs r0, 0x1
	str r0, [sp, 0x14]
	adds r0, r6, 0
	ldr r1, [sp, 0x1C]
	movs r2, 0
	adds r3, r4, 0
	bl sub_80768D0
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080E1208 @ =gSprites
	lsls r5, r6, 4
	adds r5, r6
	lsls r5, 2
	adds r5, r0
	movs r0, 0x3
	ands r7, r0
	lsls r7, 2
	mov r8, r7
	ldrb r0, [r5, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r1, r4, 0
	ands r1, r0
	mov r2, r8
	orrs r1, r2
	strb r1, [r5, 0x5]
	ldrb r2, [r5, 0x1]
	adds r0, r4, 0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r5, 0x1]
	ldr r0, _080E120C @ =0x00007fff
	lsrs r1, 4
	lsls r1, 4
	movs r3, 0x80
	lsls r3, 1
	adds r2, r3, 0
	orrs r1, r2
	movs r2, 0x20
	bl FillPalette
	ldrb r0, [r5, 0x5]
	ands r4, r0
	mov r0, r8
	orrs r4, r0
	strb r4, [r5, 0x5]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldr r0, _080E1210 @ =gTasks
	ldr r1, [sp, 0x18]
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xA]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	strh r6, [r4, 0x8]
	ldr r0, _080E1214 @ =sub_80E1218
	str r0, [r4]
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E11FC: .4byte 0x0000ffec
_080E1200: .4byte gUnknown_2037F1A
_080E1204: .4byte gUnknown_2037F1B
_080E1208: .4byte gSprites
_080E120C: .4byte 0x00007fff
_080E1210: .4byte gTasks
_080E1214: .4byte sub_80E1218
	thumb_func_end sub_80E0FB8

	thumb_func_start sub_80E1218
sub_80E1218: @ 80E1218
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E126C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1266
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080E1266
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x1C]
	strh r0, [r4, 0x1E]
	ldr r0, _080E1270 @ =sub_80E1274
	str r0, [r4]
_080E1266:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E126C: .4byte gTasks
_080E1270: .4byte sub_80E1274
	thumb_func_end sub_80E1218

	thumb_func_start sub_80E1274
sub_80E1274: @ 80E1274
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E12EC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r2, [r5, 0x8]
	ldrh r0, [r5, 0x1C]
	subs r0, 0x10
	movs r4, 0
	strh r0, [r5, 0x1C]
	ldrh r0, [r5, 0x1E]
	adds r0, 0x80
	strh r0, [r5, 0x1E]
	ldr r1, _080E12F0 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r6, r0, r1
	ldrb r2, [r6, 0x1]
	lsls r1, r2, 30
	lsrs r1, 30
	movs r0, 0x2
	orrs r1, r0
	subs r0, 0x6
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
	movs r0, 0x1C
	ldrsh r2, [r5, r0]
	movs r0, 0x1E
	ldrsh r3, [r5, r0]
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8075A1C
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _080E12E2
	adds r0, r6, 0
	bl sub_8075AD8
	adds r0, r6, 0
	bl sub_8076B20
	ldr r0, _080E12F4 @ =sub_8074FA8
	str r0, [r5]
_080E12E2:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E12EC: .4byte gTasks
_080E12F0: .4byte gSprites
_080E12F4: .4byte sub_8074FA8
	thumb_func_end sub_80E1274

	thumb_func_start sub_80E12F8
sub_80E12F8: @ 80E12F8
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080E1318 @ =gTasks
	adds r4, r1, r0
	ldr r0, _080E131C @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E1324
	ldr r0, _080E1320 @ =gUnknown_2037F1A
	b _080E1326
	.align 2, 0
_080E1318: .4byte gTasks
_080E131C: .4byte gUnknown_2037F02
_080E1320: .4byte gUnknown_2037F1A
_080E1324:
	ldr r0, _080E13A4 @ =gUnknown_2037F1B
_080E1326:
	ldrb r5, [r0]
	movs r6, 0
	strh r6, [r4, 0x8]
	strh r6, [r4, 0xA]
	strh r6, [r4, 0xC]
	movs r0, 0x10
	strh r0, [r4, 0xE]
	strh r6, [r4, 0x10]
	strh r5, [r4, 0x12]
	movs r0, 0x20
	strh r0, [r4, 0x14]
	strh r6, [r4, 0x16]
	movs r0, 0x18
	strh r0, [r4, 0x18]
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E1358
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x18]
_080E1358:
	adds r0, r5, 0
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x22
	strh r0, [r4, 0x22]
	cmp r0, 0
	bge _080E136C
	strh r6, [r4, 0x22]
_080E136C:
	ldrh r0, [r4, 0x22]
	adds r0, 0x42
	strh r0, [r4, 0x24]
	ldr r0, _080E13A8 @ =gUnknown_2037F02
	ldrb r0, [r0]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	adds r0, r5, 0
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E13BC
	ldr r0, _080E13AC @ =0x04000014
	str r0, [sp]
	ldr r1, _080E13B0 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	ldr r0, _080E13B4 @ =gUnknown_2022978
	ldrh r5, [r0]
	ldr r0, _080E13B8 @ =gUnknown_202297A
	b _080E13CE
	.align 2, 0
_080E13A4: .4byte gUnknown_2037F1B
_080E13A8: .4byte gUnknown_2037F02
_080E13AC: .4byte 0x04000014
_080E13B0: .4byte 0x00003f42
_080E13B4: .4byte gUnknown_2022978
_080E13B8: .4byte gUnknown_202297A
_080E13BC:
	ldr r0, _080E1434 @ =0x04000018
	str r0, [sp]
	ldr r1, _080E1438 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	ldr r0, _080E143C @ =gUnknown_202297C
	ldrh r5, [r0]
	ldr r0, _080E1440 @ =gUnknown_202297E
_080E13CE:
	ldrh r3, [r0]
	movs r7, 0
	movs r2, 0
	ldr r6, _080E1444 @ =gUnknown_2038700
	movs r0, 0xF0
	lsls r0, 3
	adds r0, r6
	mov r12, r0
_080E13DE:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r6
	strh r5, [r0]
	add r1, r12
	strh r5, [r1]
	adds r0, r2, 0x1
	lsls r0, 1
	adds r1, r0, r6
	strh r3, [r1]
	add r0, r12
	strh r3, [r0]
	lsls r0, r7, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	adds r2, 0x2
	lsls r2, 16
	lsrs r2, 16
	lsrs r7, r0, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _080E13DE
	ldr r0, _080E1448 @ =0xa6600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_8087EE4
	ldr r0, _080E144C @ =sub_80E1450
	str r0, [r4]
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1434: .4byte 0x04000018
_080E1438: .4byte 0x00003f44
_080E143C: .4byte gUnknown_202297C
_080E1440: .4byte gUnknown_202297E
_080E1444: .4byte gUnknown_2038700
_080E1448: .4byte 0xa6600001
_080E144C: .4byte sub_80E1450
	thumb_func_end sub_80E12F8

	thumb_func_start sub_80E1450
sub_80E1450: @ 80E1450
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080E1484 @ =gTasks
	adds r6, r0, r1
	ldrb r0, [r6, 0x12]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E1490
	ldr r0, _080E1488 @ =gUnknown_2022978
	ldrh r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _080E148C @ =gUnknown_202297A
	b _080E1498
	.align 2, 0
_080E1484: .4byte gTasks
_080E1488: .4byte gUnknown_2022978
_080E148C: .4byte gUnknown_202297A
_080E1490:
	ldr r0, _080E14B0 @ =gUnknown_202297C
	ldrh r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _080E14B4 @ =gUnknown_202297E
_080E1498:
	ldrh r0, [r0]
	str r0, [sp, 0x8]
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _080E14A6
	b _080E1684
_080E14A6:
	cmp r0, 0x1
	bgt _080E14B8
	cmp r0, 0
	beq _080E14C6
	b _080E16F4
	.align 2, 0
_080E14B0: .4byte gUnknown_202297C
_080E14B4: .4byte gUnknown_202297E
_080E14B8:
	cmp r0, 0x2
	bne _080E14BE
	b _080E16A4
_080E14BE:
	cmp r0, 0x3
	bne _080E14C4
	b _080E16EE
_080E14C4:
	b _080E16F4
_080E14C6:
	movs r2, 0x24
	ldrsh r0, [r6, r2]
	lsls r0, 17
	lsrs r5, r0, 16
	movs r3, 0
	str r3, [sp]
	mov r9, r3
	movs r4, 0
	ldrh r0, [r6, 0xA]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0xA]
	ldrh r7, [r6, 0xA]
	mov r8, r7
	movs r0, 0x14
	ldrsh r1, [r6, r0]
	movs r0, 0xFC
	lsls r0, 3
	bl __divsi3
	strh r0, [r6, 0x1A]
	movs r1, 0x16
	ldrsh r0, [r6, r1]
	lsls r0, 1
	movs r2, 0x1A
	ldrsh r1, [r6, r2]
	bl __divsi3
	negs r0, r0
	strh r0, [r6, 0x1C]
	ldrh r0, [r6, 0x16]
	strh r0, [r6, 0x1E]
	lsls r0, 16
	asrs r0, 21
	lsls r0, 16
	lsrs r7, r0, 16
	strh r7, [r6, 0x20]
	ldrh r2, [r6, 0x24]
	lsls r3, r2, 16
	mov r12, r3
	asrs r1, r3, 16
	movs r3, 0x22
	ldrsh r0, [r6, r3]
	cmp r1, r0
	ble _080E15E6
	ldr r0, _080E163C @ =gUnknown_2039600
	mov r10, r0
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r0, 16
	str r0, [sp, 0x10]
	ldr r2, [sp, 0x8]
	lsls r0, r2, 16
	asrs r0, 16
	str r0, [sp, 0xC]
_080E1536:
	lsls r5, 16
	asrs r5, 16
	adds r2, r5, 0x1
	lsls r2, 1
	mov r3, r10
	ldrb r1, [r3, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	ldr r0, _080E1640 @ =gUnknown_2038700
	adds r2, r0
	lsls r4, 16
	asrs r4, 16
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	subs r0, r4, r0
	ldr r3, [sp, 0xC]
	adds r0, r3, r0
	strh r0, [r2]
	lsls r3, r5, 1
	mov r0, r10
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r3, r0
	ldr r1, _080E1640 @ =gUnknown_2038700
	adds r3, r1
	lsls r1, r7, 16
	asrs r1, 16
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	mov r7, r8
	lsls r2, r7, 16
	asrs r2, 16
	lsls r0, r2, 1
	ldr r7, _080E1644 @ =gUnknown_825E074
	adds r0, r7
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	adds r1, r0
	strh r1, [r3]
	adds r2, 0xA
	mov r8, r2
	movs r0, 0xFF
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrh r0, [r6, 0x1C]
	ldrh r2, [r6, 0x1E]
	adds r0, r2
	strh r0, [r6, 0x1E]
	lsls r0, 16
	asrs r0, 21
	lsls r0, 16
	lsrs r7, r0, 16
	strh r7, [r6, 0x20]
	adds r4, 0x1
	lsls r4, 16
	lsrs r4, 16
	subs r5, 0x2
	lsls r5, 16
	lsrs r5, 16
	ldr r3, [sp]
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r1, [r6, 0x14]
	adds r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	str r2, [sp]
	asrs r0, 21
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r0, _080E1648 @ =0xffff0000
	add r0, r12
	lsrs r2, r0, 16
	lsls r3, r2, 16
	mov r12, r3
	asrs r1, r3, 16
	movs r3, 0x22
	ldrsh r0, [r6, r3]
	cmp r1, r0
	bgt _080E1536
_080E15E6:
	lsls r1, r2, 17
	cmp r1, 0
	blt _080E1612
	ldr r4, _080E1640 @ =gUnknown_2038700
	ldr r7, [sp, 0x4]
	lsls r0, r7, 16
	asrs r0, 16
	adds r3, r0, 0
	adds r3, 0xF0
	movs r0, 0xF0
	lsls r0, 3
	adds r5, r4, r0
_080E15FE:
	asrs r2, r1, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r5
	strh r3, [r1]
	subs r2, 0x2
	lsls r1, r2, 16
	cmp r1, 0
	bge _080E15FE
_080E1612:
	ldrh r0, [r6, 0x14]
	adds r0, 0x1
	strh r0, [r6, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _080E167A
	movs r0, 0x40
	strh r0, [r6, 0x14]
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E164C
	ldrh r0, [r6, 0xE]
	subs r0, 0x1
	strh r0, [r6, 0xE]
	b _080E1652
	.align 2, 0
_080E163C: .4byte gUnknown_2039600
_080E1640: .4byte gUnknown_2038700
_080E1644: .4byte gUnknown_825E074
_080E1648: .4byte 0xffff0000
_080E164C:
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
_080E1652:
	ldrh r1, [r6, 0x10]
	lsls r1, 8
	ldrh r0, [r6, 0xE]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0xE
	ldrsh r1, [r6, r2]
	cmp r1, 0
	bne _080E16F4
	movs r3, 0x10
	ldrsh r0, [r6, r3]
	cmp r0, 0x10
	bne _080E16F4
	strh r1, [r6, 0xC]
	strh r1, [r6, 0xE]
	b _080E16E6
_080E167A:
	ldrh r0, [r6, 0x18]
	ldrh r7, [r6, 0x16]
	adds r0, r7
	strh r0, [r6, 0x16]
	b _080E16F4
_080E1684:
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080E16F4
	ldr r1, _080E16A0 @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
	movs r0, 0
	strh r0, [r6, 0xC]
	b _080E16E6
	.align 2, 0
_080E16A0: .4byte gUnknown_2039600
_080E16A4:
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E16BA
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	b _080E16C0
_080E16BA:
	ldrh r0, [r6, 0x10]
	subs r0, 0x1
	strh r0, [r6, 0x10]
_080E16C0:
	ldrh r1, [r6, 0x10]
	lsls r1, 8
	ldrh r0, [r6, 0xE]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	cmp r0, 0x10
	bne _080E16F4
	movs r2, 0x10
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _080E16F4
	strh r0, [r6, 0xC]
	strh r0, [r6, 0xE]
_080E16E6:
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _080E16F4
_080E16EE:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E16F4:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1450

	thumb_func_start sub_80E1704
sub_80E1704: @ 80E1704
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080E173C @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _080E1740 @ =gUnknown_2037F02
	ldrb r0, [r0]
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _080E1744 @ =gUnknown_83FF3D0
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080E1748 @ =sub_80E174C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E173C: .4byte gTasks
_080E1740: .4byte gUnknown_2037F02
_080E1744: .4byte gUnknown_83FF3D0
_080E1748: .4byte sub_80E174C
	thumb_func_end sub_80E1704

	thumb_func_start sub_80E174C
sub_80E174C: @ 80E174C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r2, _080E17A4 @ =gTasks
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	adds r1, r0, 0x1
	movs r5, 0
	strh r1, [r3, 0x8]
	subs r0, 0x14
	lsls r0, 16
	lsrs r0, 16
	adds r6, r2, 0
	cmp r0, 0x16
	bhi _080E17B0
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E17C0
	strh r5, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r5, 0x1
	ands r0, r5
	cmp r0, 0
	bne _080E17B0
	ldr r2, _080E17A8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080E17AC @ =0x0000ffff
	strh r1, [r0, 0x24]
	b _080E17C0
	.align 2, 0
_080E17A4: .4byte gTasks
_080E17A8: .4byte gSprites
_080E17AC: .4byte 0x0000ffff
_080E17B0:
	ldr r2, _080E17E0 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
_080E17C0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r6
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080E17D8
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E17D8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E17E0: .4byte gSprites
	thumb_func_end sub_80E174C

	thumb_func_start sub_80E17E4
sub_80E17E4: @ 80E17E4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r2, 0
	adds r0, r3, 0
	ldr r4, [sp, 0x14]
	ldr r6, [sp, 0x18]
	lsls r1, 16
	lsrs r1, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r2, r8
	strh r1, [r2, 0x20]
	strh r5, [r2, 0x22]
	lsls r1, 16
	asrs r1, 16
	lsls r2, r1, 4
	mov r3, r8
	strh r2, [r3, 0x36]
	lsls r5, 16
	asrs r5, 16
	lsls r2, r5, 4
	strh r2, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1, 0x3A]
	lsls r4, 16
	asrs r4, 16
	subs r4, r5
	lsls r4, 4
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E17E4

	thumb_func_start sub_80E184C
sub_80E184C: @ 80E184C
	ldrh r1, [r0, 0x3A]
	ldrh r2, [r0, 0x36]
	adds r1, r2
	strh r1, [r0, 0x36]
	ldrh r2, [r0, 0x3C]
	ldrh r3, [r0, 0x38]
	adds r2, r3
	strh r2, [r0, 0x38]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r0, 0x20]
	lsls r2, 16
	asrs r2, 20
	strh r2, [r0, 0x22]
	bx lr
	thumb_func_end sub_80E184C

	thumb_func_start sub_80E186C
sub_80E186C: @ 80E186C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrh r6, [r4, 0x20]
	ldrh r5, [r4, 0x22]
	bl sub_8074FCC
	ldr r0, _080E18B4 @ =gUnknown_2037F02
	ldrb r1, [r0]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x22
	ldrsh r2, [r4, r0]
	lsls r6, 16
	asrs r6, 16
	lsls r5, 16
	asrs r5, 16
	str r5, [sp]
	movs r0, 0x40
	str r0, [sp, 0x4]
	adds r0, r4, 0
	adds r3, r6, 0
	bl sub_80E17E4
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080E18B8 @ =sub_80E18BC
	str r0, [r4, 0x1C]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E18B4: .4byte gUnknown_2037F02
_080E18B8: .4byte sub_80E18BC
	thumb_func_end sub_80E186C

	thumb_func_start sub_80E18BC
sub_80E18BC: @ 80E18BC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	lsls r4, 3
	movs r0, 0xFF
	ands r4, r0
	adds r0, r5, 0
	bl sub_80E184C
	adds r0, r4, 0
	movs r1, 0x8
	bl Sin
	strh r0, [r5, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x3A
	ble _080E1922
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1922
	movs r0, 0
	strh r0, [r5, 0x30]
	ldrh r1, [r5, 0x32]
	adds r1, 0x1
	strh r1, [r5, 0x32]
	movs r0, 0x1
	ands r1, r0
	adds r3, r5, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	subs r0, 0x6
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x3
	ble _080E1922
	adds r0, r5, 0
	bl move_anim_8074EE0
_080E1922:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E18BC

	thumb_func_start sub_80E1928
sub_80E1928: @ 80E1928
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080E1980 @ =gUnknown_2037F02
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x2E]
	ldrb r1, [r6]
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	ldr r0, _080E1984 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080E194E
	ldrh r0, [r6, 0x2]
	negs r0, r0
	strh r0, [r6, 0x2]
_080E194E:
	ldr r4, _080E1988 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x4]
	adds r0, r6
	strh r0, [r5, 0x22]
	ldr r0, _080E198C @ =sub_80B1D3C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1980: .4byte gUnknown_2037F02
_080E1984: .4byte gUnknown_2037F1B
_080E1988: .4byte gUnknown_2037F1A
_080E198C: .4byte sub_80B1D3C
	thumb_func_end sub_80E1928

	thumb_func_start sub_80E1990
sub_80E1990: @ 80E1990
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	ldr r2, _080E19E0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _080E1A12
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080E1A12
	movs r2, 0x1A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _080E19E4
	ldrh r0, [r3, 0x10]
	strh r0, [r3, 0x1A]
	negs r0, r0
	strh r0, [r3, 0x10]
	b _080E19E6
	.align 2, 0
_080E19E0: .4byte gTasks
_080E19E4:
	strh r7, [r3, 0x1A]
_080E19E6:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0x1C
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080E1A02
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x1C]
	negs r0, r0
	strh r0, [r1, 0x12]
	b _080E1A06
_080E1A02:
	movs r0, 0
	strh r0, [r1, 0x1C]
_080E1A06:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	add r0, r8
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0xA]
_080E1A12:
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldrh r6, [r4, 0x16]
	ldrh r7, [r4, 0x18]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r12, r2
	cmp r0, 0
	beq _080E1A50
	ldr r3, _080E1A4C @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsrs r2, r6, 8
	ldrh r0, [r4, 0x1A]
	subs r0, r2
	strh r0, [r1, 0x24]
	adds r2, r3, 0
	b _080E1A66
	.align 2, 0
_080E1A4C: .4byte gSprites
_080E1A50:
	ldr r2, _080E1A94 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	lsrs r1, r6, 8
	ldrh r4, [r4, 0x1A]
	adds r1, r4
	strh r1, [r0, 0x24]
_080E1A66:
	mov r1, r12
	adds r0, r1, r5
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080E1A98
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r2, r7, 8
	ldrh r0, [r4, 0x1C]
	subs r0, r2
	b _080E1AAA
	.align 2, 0
_080E1A94: .4byte gSprites
_080E1A98:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r0, r7, 8
	ldrh r4, [r4, 0x1C]
	adds r0, r4
_080E1AAA:
	strh r0, [r1, 0x26]
	mov r2, r12
	adds r0, r2, r5
	lsls r0, 3
	add r0, r8
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bgt _080E1ACA
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _080E1AD4 @ =gUnknown_2037EE2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080E1ACA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1AD4: .4byte gUnknown_2037EE2
	thumb_func_end sub_80E1990

	thumb_func_start sub_80E1AD8
sub_80E1AD8: @ 80E1AD8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r7, 0
	ldr r2, _080E1B2C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _080E1B5E
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080E1B5E
	movs r2, 0x1A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _080E1B30
	ldrh r0, [r3, 0x10]
	strh r0, [r3, 0x1A]
	negs r0, r0
	strh r0, [r3, 0x10]
	b _080E1B32
	.align 2, 0
_080E1B2C: .4byte gTasks
_080E1B30:
	strh r7, [r3, 0x1A]
_080E1B32:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0x1C
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080E1B4E
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x1C]
	negs r0, r0
	strh r0, [r1, 0x12]
	b _080E1B52
_080E1B4E:
	movs r0, 0
	strh r0, [r1, 0x1C]
_080E1B52:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	add r0, r8
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0xA]
_080E1B5E:
	lsls r3, r6, 2
	adds r0, r3, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldrh r2, [r4, 0xC]
	ldr r1, _080E1BB0 @ =0x00007fff
	adds r0, r1, 0
	ands r0, r2
	ldrh r2, [r4, 0x16]
	adds r0, r2
	lsls r5, r0, 16
	lsrs r0, r5, 16
	mov r9, r0
	ldrh r0, [r4, 0xE]
	ands r1, r0
	ldrh r2, [r4, 0x18]
	adds r1, r2
	lsls r1, 16
	lsrs r7, r1, 16
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r12, r3
	cmp r0, 0
	beq _080E1BB8
	ldr r3, _080E1BB4 @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsrs r2, r5, 24
	ldrh r0, [r4, 0x1A]
	subs r0, r2
	strh r0, [r1, 0x24]
	adds r2, r3, 0
	b _080E1BCE
	.align 2, 0
_080E1BB0: .4byte 0x00007fff
_080E1BB4: .4byte gSprites
_080E1BB8:
	ldr r2, _080E1BFC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	lsrs r1, r5, 24
	ldrh r4, [r4, 0x1A]
	adds r1, r4
	strh r1, [r0, 0x24]
_080E1BCE:
	mov r1, r12
	adds r0, r1, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080E1C00
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r2, r7, 8
	ldrh r0, [r4, 0x1C]
	subs r0, r2
	b _080E1C12
	.align 2, 0
_080E1BFC: .4byte gSprites
_080E1C00:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r0, r7, 8
	ldrh r4, [r4, 0x1C]
	adds r0, r4
_080E1C12:
	strh r0, [r1, 0x26]
	mov r2, r12
	adds r0, r2, r6
	lsls r0, 3
	mov r1, r8
	adds r2, r0, r1
	mov r0, r9
	strh r0, [r2, 0x16]
	strh r7, [r2, 0x18]
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bgt _080E1C38
	movs r0, 0x1E
	strh r0, [r2, 0x8]
	movs r0, 0
	strh r0, [r2, 0x22]
	ldr r0, _080E1C44 @ =sub_80E1990
	str r0, [r2]
_080E1C38:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1C44: .4byte sub_80E1990
	thumb_func_end sub_80E1AD8

	thumb_func_start sub_80E1C48
sub_80E1C48: @ 80E1C48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080E1CA8 @ =gTasks
	mov r8, r0
	lsls r7, r6, 2
	adds r0, r7, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldr r1, _080E1CAC @ =gUnknown_2023D44
	ldr r2, _080E1CB0 @ =gUnknown_2037F1A
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x26]
	ldr r5, _080E1CB4 @ =gUnknown_2037F02
	ldrh r0, [r5]
	strh r0, [r4, 0x24]
	ldrh r0, [r5]
	strh r0, [r4, 0x8]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x22]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _080E1C8C
	ldrh r0, [r4, 0x14]
	ldr r3, _080E1CB8 @ =0xffff8000
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r4, 0x14]
_080E1C8C:
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080E1CBC
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xE]
	mov r3, r8
	adds r4, r7, 0
	b _080E1D2C
	.align 2, 0
_080E1CA8: .4byte gTasks
_080E1CAC: .4byte gUnknown_2023D44
_080E1CB0: .4byte gUnknown_2037F1A
_080E1CB4: .4byte gUnknown_2037F02
_080E1CB8: .4byte 0xffff8000
_080E1CBC:
	movs r7, 0x2
	ldrsh r0, [r5, r7]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080E1CD8
	ldrh r1, [r5, 0x2]
	ldr r0, _080E1CD4 @ =0x00007fff
	ands r0, r1
	b _080E1CE0
	.align 2, 0
_080E1CD4: .4byte 0x00007fff
_080E1CD8:
	ldrh r0, [r5, 0x2]
	ldr r2, _080E1D08 @ =0xffff8000
	adds r1, r2, 0
	orrs r0, r1
_080E1CE0:
	strh r0, [r4, 0xC]
	ldr r0, _080E1D0C @ =gUnknown_2037F02
	movs r3, 0x4
	ldrsh r1, [r0, r3]
	movs r2, 0x80
	lsls r2, 8
	ands r1, r2
	adds r5, r0, 0
	cmp r1, 0
	beq _080E1D18
	ldr r3, _080E1D10 @ =gTasks
	lsls r4, r6, 2
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r3
	ldrh r2, [r5, 0x4]
	ldr r0, _080E1D14 @ =0x00007fff
	ands r0, r2
	b _080E1D2A
	.align 2, 0
_080E1D08: .4byte 0xffff8000
_080E1D0C: .4byte gUnknown_2037F02
_080E1D10: .4byte gTasks
_080E1D14: .4byte 0x00007fff
_080E1D18:
	ldr r3, _080E1D50 @ =gTasks
	lsls r4, r6, 2
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r3
	ldrh r2, [r5, 0x4]
	ldr r7, _080E1D54 @ =0xffff8000
	adds r0, r7, 0
	orrs r0, r2
_080E1D2A:
	strh r0, [r1, 0xE]
_080E1D2C:
	adds r0, r4, r6
	lsls r0, 3
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x18]
	strh r1, [r0, 0x16]
	ldrh r1, [r5, 0x8]
	strh r1, [r0, 0x10]
	ldrh r1, [r5, 0xA]
	strh r1, [r0, 0x12]
	ldr r1, _080E1D58 @ =sub_80E1AD8
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1D50: .4byte gTasks
_080E1D54: .4byte 0xffff8000
_080E1D58: .4byte sub_80E1AD8
	thumb_func_end sub_80E1C48

	thumb_func_start sub_80E1D5C
sub_80E1D5C: @ 80E1D5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E1D94 @ =gTasks
	adds r5, r0, r1
	ldr r4, _080E1D98 @ =gUnknown_2037F02
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E1D7C
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E1D7C:
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r0, [r5, 0xA]
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0xE]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E1DA0
	ldr r0, _080E1D9C @ =gUnknown_2037F1A
	b _080E1DA2
	.align 2, 0
_080E1D94: .4byte gTasks
_080E1D98: .4byte gUnknown_2037F02
_080E1D9C: .4byte gUnknown_2037F1A
_080E1DA0:
	ldr r0, _080E1DF0 @ =gUnknown_2037F1B
_080E1DA2:
	ldrb r4, [r0]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	adds r0, r4, 0
	bl sub_807685C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldr r0, _080E1DF4 @ =gUnknown_2037F02
	ldrb r0, [r0]
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r5, 0x26]
	ldr r2, _080E1DF8 @ =gUnknown_83FF52C
	adds r0, r5, 0
	bl sub_80762D0
	ldr r0, _080E1DFC @ =sub_80E1E00
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1DF0: .4byte gUnknown_2037F1B
_080E1DF4: .4byte gUnknown_2037F02
_080E1DF8: .4byte gUnknown_83FF52C
_080E1DFC: .4byte sub_80E1E00
	thumb_func_end sub_80E1D5C

	thumb_func_start sub_80E1E00
sub_80E1E00: @ 80E1E00
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080E1E20 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E1E24
	cmp r0, 0x1
	beq _080E1E84
	b _080E1E92
	.align 2, 0
_080E1E20: .4byte gTasks
_080E1E24:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080E1E3A
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80E1E98
_080E1E3A:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x12
	bne _080E1E4A
	adds r0, r5, 0
	movs r1, 0
	bl sub_80E1E98
_080E1E4A:
	adds r0, r4, 0
	bl sub_8076308
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080E1E92
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080E1E6C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E1E92
_080E1E6C:
	strh r1, [r4, 0xA]
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080E1E80 @ =gUnknown_83FF52C
	adds r0, r4, 0
	bl sub_80762D0
	b _080E1E92
	.align 2, 0
_080E1E80: .4byte gUnknown_83FF52C
_080E1E84:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E1E92
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080E1E92:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1E00

	thumb_func_start sub_80E1E98
sub_80E1E98: @ 80E1E98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r2, _080E1EBC @ =gTasks
	adds r4, r0, r2
	cmp r1, 0
	bne _080E1EC0
	movs r1, 0x12
	movs r3, 0xEC
	b _080E1EC4
	.align 2, 0
_080E1EBC: .4byte gTasks
_080E1EC0:
	movs r1, 0x1E
	movs r3, 0x14
_080E1EC4:
	mov r2, sp
	ldrh r0, [r4, 0x10]
	subs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x10]
	subs r0, r1
	subs r0, 0x4
	strh r0, [r2, 0x2]
	ldrh r0, [r4, 0x10]
	adds r0, r1
	strh r0, [r2, 0x4]
	ldrh r0, [r4, 0x10]
	adds r0, r1
	adds r0, 0x4
	strh r0, [r2, 0x6]
	add r2, sp, 0x8
	lsls r1, r3, 24
	asrs r1, 24
	ldrh r0, [r4, 0x12]
	adds r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x12]
	adds r0, r1
	adds r0, 0x6
	strh r0, [r2, 0x2]
	movs r5, 0
	mov r8, r2
	ldr r7, _080E1F68 @ =gSprites
_080E1EFC:
	lsls r0, r5, 1
	add r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	ands r0, r5
	lsls r0, 1
	add r0, r8
	movs r3, 0
	ldrsh r2, [r0, r3]
	ldrb r3, [r4, 0x14]
	subs r3, 0x5
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _080E1F6C @ =gUnknown_83FF54C
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080E1F50
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r7
	movs r0, 0
	strh r0, [r1, 0x2E]
	movs r0, 0x2
	cmp r5, 0x1
	bhi _080E1F3E
	movs r2, 0x2
	negs r2, r2
	adds r0, r2, 0
_080E1F3E:
	strh r0, [r1, 0x30]
	ldr r0, _080E1F70 @ =0x0000ffff
	strh r0, [r1, 0x32]
	strh r6, [r1, 0x34]
	movs r0, 0x2
	strh r0, [r1, 0x36]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_080E1F50:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080E1EFC
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1F68: .4byte gSprites
_080E1F6C: .4byte gUnknown_83FF54C
_080E1F70: .4byte 0x0000ffff
	thumb_func_end sub_80E1E98

	thumb_func_start sub_80E1F74
sub_80E1F74: @ 80E1F74
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080E1FBA
	ldr r3, _080E1FC0 @ =gTasks
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x34
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080E1FBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1FC0: .4byte gTasks
	thumb_func_end sub_80E1F74

	thumb_func_start sub_80E1FC4
sub_80E1FC4: @ 80E1FC4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E200C @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r1, _080E2010 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xA]
	ldrb r0, [r1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E2014 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	adds r0, r1
	strh r0, [r4, 0xC]
	ldr r0, _080E2018 @ =sub_80E201C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E200C: .4byte gTasks
_080E2010: .4byte gUnknown_2037F02
_080E2014: .4byte gSprites
_080E2018: .4byte sub_80E201C
	thumb_func_end sub_80E1FC4

	thumb_func_start sub_80E201C
sub_80E201C: @ 80E201C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E2064 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E206C
	ldrh r0, [r4, 0xC]
	ldr r2, _080E2068 @ =gUnknown_83FF564
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r1, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0x8
	bl BlendPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _080E205C
	movs r0, 0
	strh r0, [r4, 0x8]
_080E205C:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	b _080E207E
	.align 2, 0
_080E2064: .4byte gTasks
_080E2068: .4byte gUnknown_83FF564
_080E206C:
	ldrh r0, [r4, 0xC]
	movs r1, 0x10
	movs r2, 0
	movs r3, 0
	bl BlendPalette
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080E207E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E201C

	thumb_func_start sub_80E2084
sub_80E2084: @ 80E2084
	push {lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xD0
	lsls r2, 1
	ldr r1, _080E20C0 @ =gUnknown_2037F1A
	ldrb r3, [r1]
	ldr r1, _080E20C4 @ =gUnknown_2037F02
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0x2
	str r1, [sp, 0x8]
	movs r1, 0x1E
	str r1, [sp, 0xC]
	ldr r1, _080E20C8 @ =gUnknown_8D2DE3C
	str r1, [sp, 0x10]
	ldr r1, _080E20CC @ =gUnknown_8D2DF98
	str r1, [sp, 0x14]
	ldr r1, _080E20D0 @ =gUnknown_8D2DF78
	str r1, [sp, 0x18]
	movs r1, 0
	bl sub_80BBA20
	add sp, 0x1C
	pop {r0}
	bx r0
	.align 2, 0
_080E20C0: .4byte gUnknown_2037F1A
_080E20C4: .4byte gUnknown_2037F02
_080E20C8: .4byte gUnknown_8D2DE3C
_080E20CC: .4byte gUnknown_8D2DF98
_080E20D0: .4byte gUnknown_8D2DF78
	thumb_func_end sub_80E2084

	thumb_func_start sub_80E20D4
sub_80E20D4: @ 80E20D4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080E212C @ =gUnknown_2037F1A
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E20F0
	ldr r1, _080E2130 @ =gUnknown_2037F02
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080E20F0:
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	ldr r4, _080E2130 @ =gUnknown_2037F02
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r5, 0x22]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E2138
	movs r0, 0xA0
	lsls r0, 2
	strh r0, [r5, 0x2E]
	ldr r0, _080E2134 @ =0x0000fd80
	strh r0, [r5, 0x30]
	b _080E2160
	.align 2, 0
_080E212C: .4byte gUnknown_2037F1A
_080E2130: .4byte gUnknown_2037F02
_080E2134: .4byte 0x0000fd80
_080E2138:
	cmp r0, 0x1
	bne _080E2152
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xA0
	lsls r0, 2
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	b _080E2160
_080E2152:
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0xA0
	lsls r0, 2
	strh r0, [r5, 0x2E]
_080E2160:
	ldr r0, _080E218C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080E2180
	ldrh r0, [r5, 0x2E]
	negs r0, r0
	strh r0, [r5, 0x2E]
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080E2180:
	ldr r0, _080E2190 @ =sub_80E2194
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E218C: .4byte gUnknown_2037F1A
_080E2190: .4byte sub_80E2194
	thumb_func_end sub_80E20D4

	thumb_func_start sub_80E2194
sub_80E2194: @ 80E2194
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x3A]
	adds r0, r1
	strh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x30]
	ldrh r3, [r2, 0x3C]
	adds r1, r3
	strh r1, [r2, 0x3C]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	ldrh r0, [r2, 0x38]
	adds r0, 0x1
	strh r0, [r2, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xE
	bne _080E21C8
	adds r0, r2, 0
	bl DestroyAnimSprite
_080E21C8:
	pop {r0}
	bx r0
	thumb_func_end sub_80E2194

	thumb_func_start sub_80E21CC
sub_80E21CC: @ 80E21CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080E221C @ =gTasks
	adds r6, r1, r0
	movs r1, 0
	movs r0, 0xC
	strh r0, [r6, 0x12]
	movs r0, 0x3
	strh r0, [r6, 0x14]
	strh r1, [r6, 0x16]
	ldr r5, _080E2220 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E2224
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8076B2C
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080E2216
	adds r0, 0x3
_080E2216:
	asrs r0, 2
	adds r0, r4, r0
	b _080E2248
	.align 2, 0
_080E221C: .4byte gTasks
_080E2220: .4byte gUnknown_2037F1A
_080E2224:
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8076B2C
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080E2244
	adds r0, 0x3
_080E2244:
	asrs r0, 2
	subs r0, r4, r0
_080E2248:
	strh r0, [r6, 0x1E]
	ldr r5, _080E229C @ =gUnknown_2037F1A
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	adds r4, r0, 0
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8076B2C
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080E226C
	adds r0, 0x3
_080E226C:
	asrs r0, 2
	subs r0, r4, r0
	strh r0, [r6, 0x20]
	ldr r4, _080E22A0 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x24]
	ldr r0, _080E22A4 @ =sub_80E22A8
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E229C: .4byte gUnknown_2037F1A
_080E22A0: .4byte gUnknown_2037F1B
_080E22A4: .4byte sub_80E22A8
	thumb_func_end sub_80E21CC

	thumb_func_start sub_80E22A8
sub_80E22A8: @ 80E22A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080E22D0 @ =gTasks
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0
	beq _080E22D4
	cmp r1, 0x1
	bne _080E22CC
	b _080E23CC
_080E22CC:
	b _080E23DA
	.align 2, 0
_080E22D0: .4byte gTasks
_080E22D4:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080E23DA
	strh r1, [r5, 0xA]
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	movs r4, 0x24
	ldrsh r3, [r5, r4]
	ldrb r4, [r5, 0x12]
	str r4, [sp]
	ldrb r4, [r5, 0xC]
	str r4, [sp, 0x4]
	add r4, sp, 0x10
	str r4, [sp, 0x8]
	adds r4, 0x2
	str r4, [sp, 0xC]
	bl sub_80E23E8
	movs r6, 0
	mov r8, r4
	ldr r4, _080E2348 @ =gSprites
_080E230E:
	add r0, sp, 0x10
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	ldr r0, _080E234C @ =gUnknown_83FF5CC
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080E23A2
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080E2362
	cmp r6, 0
	bne _080E2350
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	negs r0, r0
	strh r0, [r1, 0x26]
	strh r0, [r1, 0x24]
	b _080E238A
	.align 2, 0
_080E2348: .4byte gSprites
_080E234C: .4byte gUnknown_83FF5CC
_080E2350:
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	strh r0, [r1, 0x26]
	ldrh r0, [r5, 0x14]
	strh r0, [r1, 0x24]
	b _080E238A
_080E2362:
	cmp r6, 0
	bne _080E2378
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r5, 0x14]
	b _080E2388
_080E2378:
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	strh r0, [r1, 0x24]
	ldrh r0, [r5, 0x14]
	negs r0, r0
_080E2388:
	strh r0, [r1, 0x26]
_080E238A:
	ldr r1, _080E23C8 @ =gSprites
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2E]
	strh r7, [r0, 0x30]
	movs r1, 0xA
	strh r1, [r0, 0x32]
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
_080E23A2:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bls _080E230E
	ldrh r2, [r5, 0xC]
	movs r3, 0xC
	ldrsh r1, [r5, r3]
	movs r4, 0x12
	ldrsh r0, [r5, r4]
	cmp r1, r0
	bne _080E23C0
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080E23C0:
	adds r0, r2, 0x1
	strh r0, [r5, 0xC]
	b _080E23DA
	.align 2, 0
_080E23C8: .4byte gSprites
_080E23CC:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080E23DA
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080E23DA:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E22A8

	thumb_func_start sub_80E23E8
sub_80E23E8: @ 80E23E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	mov r9, r6
	ldr r6, [sp, 0x34]
	mov r10, r6
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 16
	lsrs r2, 16
	adds r7, r2, 0
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x4]
	lsls r4, 24
	lsrs r6, r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r8, r5
	cmp r5, 0
	bne _080E2430
	mov r2, r9
	strh r0, [r2]
	mov r6, r10
	strh r1, [r6]
	b _080E248E
_080E2430:
	cmp r5, r6
	bcc _080E243E
	mov r0, r9
	strh r2, [r0]
	mov r1, r10
	strh r3, [r1]
	b _080E248E
_080E243E:
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	mov r2, r12
	lsls r1, r2, 16
	asrs r1, 16
	lsls r5, r1, 8
	lsls r0, r7, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 8
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r5, r0
	ldr r2, [sp]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r4, r1, 8
	ldr r2, [sp, 0x4]
	lsls r0, r2, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 8
	adds r1, r6, 0
	bl __divsi3
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	adds r4, r0
	asrs r5, 8
	mov r0, r9
	strh r5, [r0]
	asrs r4, 8
	mov r1, r10
	strh r4, [r1]
_080E248E:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E23E8

	thumb_func_start sub_80E24A0
sub_80E24A0: @ 80E24A0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x24
	ble _080E24D6
	ldr r3, _080E24DC @ =gTasks
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080E24D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E24DC: .4byte gTasks
	thumb_func_end sub_80E24A0

	thumb_func_start sub_80E24E0
sub_80E24E0: @ 80E24E0
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080E250C @ =gUnknown_2037F02
	ldrh r0, [r1]
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldr r1, _080E2510 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _080E2514 @ =sub_8075764
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E250C: .4byte gUnknown_2037F02
_080E2510: .4byte DestroyAnimSprite
_080E2514: .4byte sub_8075764
	thumb_func_end sub_80E24E0

	thumb_func_start sub_80E2518
sub_80E2518: @ 80E2518
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	ldr r1, _080E2638 @ =gTasks
	adds r7, r0, r1
	ldr r0, _080E263C @ =gUnknown_2037F1A
	mov r10, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x1E]
	mov r1, r10
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x20]
	ldr r0, _080E2640 @ =gUnknown_2037F1B
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x22]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8074480
	adds r4, r0, 0
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0
	bl sub_8076B2C
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080E258A
	adds r0, 0x3
_080E258A:
	asrs r0, 2
	adds r0, r4, r0
	strh r0, [r7, 0x24]
	ldr r4, _080E2644 @ =gUnknown_83FF62C
	movs r0, 0x1E
	ldrsh r5, [r7, r0]
	movs r1, 0x20
	ldrsh r6, [r7, r1]
	mov r1, r8
	ldrb r0, [r1]
	bl sub_807685C
	adds r3, r0, 0
	subs r3, 0x5
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x26]
	cmp r0, 0x40
	beq _080E2654
	ldr r4, _080E2648 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x10
	strh r1, [r0, 0x2E]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r7, 0x22]
	strh r1, [r0, 0x32]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r7, 0x24]
	strh r1, [r0, 0x36]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080E264C @ =0x0000ffe0
	strh r1, [r0, 0x38]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_8075068
	mov r1, r10
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E2632
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080E2632:
	ldr r0, _080E2650 @ =sub_80E2668
	str r0, [r7]
	b _080E265A
	.align 2, 0
_080E2638: .4byte gTasks
_080E263C: .4byte gUnknown_2037F1A
_080E2640: .4byte gUnknown_2037F1B
_080E2644: .4byte gUnknown_83FF62C
_080E2648: .4byte gSprites
_080E264C: .4byte 0x0000ffe0
_080E2650: .4byte sub_80E2668
_080E2654:
	mov r0, r9
	bl DestroyAnimVisualTask
_080E265A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2518

	thumb_func_start sub_80E2668
sub_80E2668: @ 80E2668
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E268C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080E26D0
	cmp r1, 0x1
	bgt _080E2690
	cmp r1, 0
	beq _080E269A
	b _080E276E
	.align 2, 0
_080E268C: .4byte gTasks
_080E2690:
	cmp r1, 0x2
	beq _080E26F4
	cmp r1, 0x3
	beq _080E2768
	b _080E276E
_080E269A:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E276E
	strh r1, [r4, 0xA]
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E26CC @ =gSprites
	adds r0, r1
	bl AnimateBallThrow
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080E276E
	b _080E275A
	.align 2, 0
_080E26CC: .4byte gSprites
_080E26D0:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E26F0 @ =gSprites
	adds r0, r1
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080E276E
	movs r0, 0
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	b _080E275A
	.align 2, 0
_080E26F0: .4byte gSprites
_080E26F4:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E276E
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	adds r2, 0x1
	strh r2, [r4, 0xC]
	ldr r5, _080E2764 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x1
	ands r2, r0
	adds r1, 0x3E
	lsls r2, 2
	ldrb r3, [r1]
	subs r0, 0x6
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080E276E
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_080E275A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E276E
	.align 2, 0
_080E2764: .4byte gSprites
_080E2768:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E276E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2668

	thumb_func_start sub_80E2774
sub_80E2774: @ 80E2774
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r0, _080E2788 @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r6, r0, 0
	cmp r1, 0
	bne _080E2790
	ldr r0, _080E278C @ =gUnknown_2037F1A
	b _080E2792
	.align 2, 0
_080E2788: .4byte gUnknown_2037F02
_080E278C: .4byte gUnknown_2037F1A
_080E2790:
	ldr r0, _080E27F8 @ =gUnknown_2037F1B
_080E2792:
	ldrb r5, [r0]
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r3, _080E27FC @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080E2800 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r1, r6, 0
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x3A]
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	movs r1, 0x1
	cmp r0, 0
	bne _080E27C0
	movs r3, 0x1
	negs r3, r3
	adds r1, r3, 0
_080E27C0:
	strh r1, [r4, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080E2804
	ldrb r2, [r4, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8076B2C
	subs r0, 0x8
	b _080E280E
	.align 2, 0
_080E27F8: .4byte gUnknown_2037F1B
_080E27FC: .4byte 0x000003ff
_080E2800: .4byte 0xfffffc00
_080E2804:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8076B2C
	adds r0, 0x8
_080E280E:
	strh r0, [r4, 0x20]
	ldr r0, _080E281C @ =sub_80E2820
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E281C: .4byte sub_80E2820
	thumb_func_end sub_80E2774

	thumb_func_start sub_80E2820
sub_80E2820: @ 80E2820
	push {lr}
	adds r2, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	cmp r1, 0x1
	beq _080E2868
	cmp r1, 0x1
	bgt _080E2836
	cmp r1, 0
	beq _080E2840
	b _080E28D8
_080E2836:
	cmp r1, 0x2
	beq _080E2878
	cmp r1, 0x3
	beq _080E289E
	b _080E28D8
_080E2840:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E28D8
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x3C]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080E28D8
	b _080E2896
_080E2868:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080E28D8
	b _080E2892
_080E2878:
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	lsls r1, 2
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080E28D8
_080E2892:
	movs r0, 0
	strh r0, [r2, 0x30]
_080E2896:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _080E28D8
_080E289E:
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080E28D8
	ldrh r0, [r2, 0x3A]
	subs r0, 0x1
	strh r0, [r2, 0x3A]
	lsls r0, 16
	cmp r0, 0
	beq _080E28D2
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	b _080E28D8
_080E28D2:
	adds r0, r2, 0
	bl DestroyAnimSprite
_080E28D8:
	pop {r0}
	bx r0
	thumb_func_end sub_80E2820

	thumb_func_start sub_80E28DC
sub_80E28DC: @ 80E28DC
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, _080E28F4 @ =gUnknown_2037F02
	movs r3, 0
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080E28F8
	adds r0, r1, 0
	bl DestroyAnimVisualTask
	b _080E2920
	.align 2, 0
_080E28F4: .4byte gUnknown_2037F02
_080E28F8:
	ldr r0, _080E2928 @ =gTasks
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r2, 0x2]
	strh r0, [r4, 0x8]
	ldrb r0, [r2]
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _080E292C @ =gUnknown_83FF65C
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080E2930 @ =sub_80E2934
	str r0, [r4]
_080E2920:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2928: .4byte gTasks
_080E292C: .4byte gUnknown_83FF65C
_080E2930: .4byte sub_80E2934
	thumb_func_end sub_80E28DC

	thumb_func_start sub_80E2934
sub_80E2934: @ 80E2934
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080E2974 @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E298E
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E297C
	ldr r2, _080E2978 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	b _080E298C
	.align 2, 0
_080E2974: .4byte gTasks
_080E2978: .4byte gSprites
_080E297C:
	ldr r2, _080E29D4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080E29D8 @ =0x0000fffe
_080E298C:
	strh r1, [r0, 0x24]
_080E298E:
	adds r0, r4, 0
	bl sub_8076308
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080E29EA
	ldr r2, _080E29D4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	cmp r0, 0
	beq _080E29E4
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080E29DC @ =gTasks
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080E29E0 @ =gUnknown_83FF65C
	bl sub_80762D0
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	b _080E29EA
	.align 2, 0
_080E29D4: .4byte gSprites
_080E29D8: .4byte 0x0000fffe
_080E29DC: .4byte gTasks
_080E29E0: .4byte gUnknown_83FF65C
_080E29E4:
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080E29EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2934

	thumb_func_start sub_80E29F0
sub_80E29F0: @ 80E29F0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080E2A04 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E2A0C
	ldr r4, _080E2A08 @ =gUnknown_2037F1A
	b _080E2A0E
	.align 2, 0
_080E2A04: .4byte gUnknown_2037F02
_080E2A08: .4byte gUnknown_2037F1A
_080E2A0C:
	ldr r4, _080E2A4C @ =gUnknown_2037F1B
_080E2A0E:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8076B2C
	strh r0, [r5, 0x22]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	cmp r0, 0x7
	bgt _080E2A32
	movs r0, 0x8
	strh r0, [r5, 0x22]
_080E2A32:
	movs r2, 0
	strh r2, [r5, 0x2E]
	ldr r1, _080E2A50 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x30]
	strh r2, [r5, 0x32]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x34]
	ldr r0, _080E2A54 @ =sub_80E2A58
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2A4C: .4byte gUnknown_2037F1B
_080E2A50: .4byte gUnknown_2037F02
_080E2A54: .4byte sub_80E2A58
	thumb_func_end sub_80E29F0

	thumb_func_start sub_80E2A58
sub_80E2A58: @ 80E2A58
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x30
	ldrsh r1, [r3, r2]
	cmp r0, r1
	blt _080E2AAC
	movs r0, 0
	strh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x32]
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	strh r1, [r3, 0x32]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	lsls r1, 2
	ldrb r2, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080E2AAC
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _080E2AAC
	adds r0, r3, 0
	bl DestroyAnimSprite
_080E2AAC:
	pop {r0}
	bx r0
	thumb_func_end sub_80E2A58

	thumb_func_start sub_80E2AB0
sub_80E2AB0: @ 80E2AB0
	push {lr}
	adds r3, r0, 0
	ldr r0, _080E2ADC @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E2AE0
	ldrb r2, [r3, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	movs r0, 0x64
	strh r0, [r3, 0x20]
	movs r0, 0x1
	b _080E2AE6
	.align 2, 0
_080E2ADC: .4byte gUnknown_2037F02
_080E2AE0:
	movs r0, 0x8C
	strh r0, [r3, 0x20]
	ldr r0, _080E2AF4 @ =0x0000ffff
_080E2AE6:
	strh r0, [r3, 0x3C]
	movs r0, 0x38
	strh r0, [r3, 0x22]
	ldr r0, _080E2AF8 @ =sub_80E2AFC
	str r0, [r3, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_080E2AF4: .4byte 0x0000ffff
_080E2AF8: .4byte sub_80E2AFC
	thumb_func_end sub_80E2AB0

	thumb_func_start sub_80E2AFC
sub_80E2AFC: @ 80E2AFC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bls _080E2B0A
	b _080E2CDC
_080E2B0A:
	lsls r0, 2
	ldr r1, _080E2B14 @ =_080E2B18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2B14: .4byte _080E2B18
	.align 2, 0
_080E2B18:
	.4byte _080E2B3C
	.4byte _080E2B6E
	.4byte _080E2B80
	.4byte _080E2BC0
	.4byte _080E2BD2
	.4byte _080E2C10
	.4byte _080E2C74
	.4byte _080E2C94
	.4byte _080E2CBA
_080E2B3C:
	movs r3, 0x3C
	ldrsh r0, [r4, r3]
	lsls r0, 1
	ldrh r1, [r4, 0x22]
	subs r1, r0
	strh r1, [r4, 0x22]
	ldrh r2, [r4, 0x30]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080E2B5E
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x20]
	subs r0, r1
	strh r0, [r4, 0x20]
_080E2B5E:
	adds r0, r2, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	beq _080E2B6C
	b _080E2CDC
_080E2B6C:
	b _080E2CAE
_080E2B6E:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _080E2B7E
	b _080E2CDC
_080E2B7E:
	b _080E2CAE
_080E2B80:
	ldrh r2, [r4, 0x30]
	adds r2, 0x1
	strh r2, [r4, 0x30]
	movs r3, 0x3C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r3, _080E2BBC @ =gUnknown_825E074
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x3C]
	muls r0, r1
	strh r0, [r4, 0x24]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0xC
	beq _080E2BB8
	b _080E2CDC
_080E2BB8:
	b _080E2CAE
	.align 2, 0
_080E2BBC: .4byte gUnknown_825E074
_080E2BC0:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	beq _080E2BD0
	b _080E2CDC
_080E2BD0:
	b _080E2CAE
_080E2BD2:
	ldrh r2, [r4, 0x30]
	adds r2, 0x1
	strh r2, [r4, 0x30]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x22]
	subs r0, r1
	strh r0, [r4, 0x22]
	ldr r3, _080E2C0C @ =gUnknown_825E074
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x3C]
	muls r0, r1
	strh r0, [r4, 0x24]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0xC
	bne _080E2CDC
	b _080E2CB2
	.align 2, 0
_080E2C0C: .4byte gUnknown_825E074
_080E2C10:
	ldrh r2, [r4, 0x30]
	adds r2, 0x1
	strh r2, [r4, 0x30]
	movs r3, 0x3C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r3, _080E2C68 @ =gUnknown_825E074
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x3C]
	muls r0, r1
	strh r0, [r4, 0x24]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0xF
	bne _080E2C5C
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r3, _080E2C6C @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080E2C70 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
_080E2C5C:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x12
	bne _080E2CDC
	b _080E2CAE
	.align 2, 0
_080E2C68: .4byte gUnknown_825E074
_080E2C6C: .4byte 0x000003ff
_080E2C70: .4byte 0xfffffc00
_080E2C74:
	movs r3, 0x3C
	ldrsh r0, [r4, r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x20]
	adds r1, r0
	strh r1, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _080E2CDC
	b _080E2CAE
_080E2C94:
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r0, 1
	ldrh r3, [r4, 0x20]
	adds r0, r3
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080E2CDC
_080E2CAE:
	movs r0, 0
	strh r0, [r4, 0x30]
_080E2CB2:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080E2CDC
_080E2CBA:
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x20]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080E2CDC
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E2CDC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2AFC

	thumb_func_start sub_80E2CE4
sub_80E2CE4: @ 80E2CE4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080E2D34 @ =gTasks
	adds r6, r1, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	bl sub_8075290
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x1
	bne _080E2D44
	ldr r5, _080E2D38 @ =gUnknown_2037F1A
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r1, [r5]
	movs r0, 0x2
	eors r0, r1
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	ble _080E2D3C
	strh r7, [r6, 0x24]
	b _080E2D64
	.align 2, 0
_080E2D34: .4byte gTasks
_080E2D38: .4byte gUnknown_2037F1A
_080E2D3C:
	ldr r0, _080E2D40 @ =0x0000ffff
	b _080E2D62
	.align 2, 0
_080E2D40: .4byte 0x0000ffff
_080E2D44:
	ldr r0, _080E2D58 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E2D60
	ldr r0, _080E2D5C @ =0x0000ffff
	b _080E2D62
	.align 2, 0
_080E2D58: .4byte gUnknown_2037F1A
_080E2D5C: .4byte 0x0000ffff
_080E2D60:
	movs r0, 0x1
_080E2D62:
	strh r0, [r6, 0x24]
_080E2D64:
	ldr r0, _080E2D70 @ =sub_80E2D74
	str r0, [r6]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E2D70: .4byte sub_80E2D74
	thumb_func_end sub_80E2CE4

	thumb_func_start sub_80E2D74
sub_80E2D74: @ 80E2D74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080E2D98 @ =gTasks
	adds r3, r0, r1
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0x8
	bls _080E2D8E
	b _080E2F08
_080E2D8E:
	lsls r0, 2
	ldr r1, _080E2D9C @ =_080E2DA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2D98: .4byte gTasks
_080E2D9C: .4byte _080E2DA0
	.align 2, 0
_080E2DA0:
	.4byte _080E2DC4
	.4byte _080E2DD6
	.4byte _080E2E08
	.4byte _080E2E38
	.4byte _080E2E5E
	.4byte _080E2E88
	.4byte _080E2E98
	.4byte _080E2EB8
	.4byte _080E2EF0
_080E2DC4:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	beq _080E2DD4
	b _080E2F08
_080E2DD4:
	b _080E2EE0
_080E2DD6:
	ldr r2, _080E2E04 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	lsls r2, r0, 1
	adds r2, r0
	ldrh r0, [r1, 0x24]
	subs r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	beq _080E2E02
	b _080E2F08
_080E2E02:
	b _080E2EE0
	.align 2, 0
_080E2E04: .4byte gSprites
_080E2E08:
	ldr r2, _080E2E34 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x24
	ldrsh r2, [r3, r0]
	lsls r0, r2, 1
	adds r0, r2
	ldrh r2, [r1, 0x24]
	adds r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080E2F08
	b _080E2EE0
	.align 2, 0
_080E2E34: .4byte gSprites
_080E2E38:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080E2F08
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r1, [r3, 0xC]
	movs r2, 0xC
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _080E2EE4
	adds r0, r1, 0x1
	strh r0, [r3, 0xC]
	movs r0, 0x1
	strh r0, [r3, 0x8]
	b _080E2F08
_080E2E5E:
	ldr r2, _080E2E84 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x24]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080E2F08
	b _080E2EE0
	.align 2, 0
_080E2E84: .4byte gSprites
_080E2E88:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080E2F08
	b _080E2EE0
_080E2E98:
	ldr r2, _080E2EB4 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x24
	ldrsh r2, [r3, r0]
	lsls r2, 2
	ldrh r0, [r1, 0x24]
	subs r0, r2
	b _080E2ED0
	.align 2, 0
_080E2EB4: .4byte gSprites
_080E2EB8:
	ldr r2, _080E2EEC @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	lsls r0, 2
	ldrh r2, [r1, 0x24]
	adds r0, r2
_080E2ED0:
	strh r0, [r1, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080E2F08
_080E2EE0:
	movs r0, 0
	strh r0, [r3, 0xA]
_080E2EE4:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080E2F08
	.align 2, 0
_080E2EEC: .4byte gSprites
_080E2EF0:
	ldr r2, _080E2F10 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E2F08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2F10: .4byte gSprites
	thumb_func_end sub_80E2D74

	thumb_func_start sub_80E2F14
sub_80E2F14: @ 80E2F14
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E2F30 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E2F38
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080E2F34 @ =gUnknown_2037F1A
	b _080E2F3A
	.align 2, 0
_080E2F30: .4byte gUnknown_2037F02
_080E2F34: .4byte gUnknown_2037F1A
_080E2F38:
	ldr r0, _080E2F90 @ =gUnknown_2037F1B
_080E2F3A:
	ldrb r0, [r0]
	strh r0, [r4, 0x3C]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E2F5E
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r4, 0x3]
_080E2F5E:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8076884
	movs r2, 0x3
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0x1]
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
	ldr r0, _080E2F94 @ =sub_80E2F98
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2F90: .4byte gUnknown_2037F1B
_080E2F94: .4byte sub_80E2F98
	thumb_func_end sub_80E2F14

	thumb_func_start sub_80E2F98
sub_80E2F98: @ 80E2F98
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080E2FA6
	b _080E3196
_080E2FA6:
	lsls r0, 2
	ldr r1, _080E2FB0 @ =_080E2FB4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2FB0: .4byte _080E2FB4
	.align 2, 0
_080E2FB4:
	.4byte _080E2FC8
	.4byte _080E30C8
	.4byte _080E3130
	.4byte _080E3144
	.4byte _080E3190
_080E2FC8:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bhi _080E2FF8
	lsls r0, 2
	ldr r1, _080E2FDC @ =_080E2FE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2FDC: .4byte _080E2FE0
	.align 2, 0
_080E2FE0:
	.4byte _080E2FFC
	.4byte _080E3018
	.4byte _080E303A
	.4byte _080E3056
	.4byte _080E2FFC
	.4byte _080E307C
_080E2FF8:
	movs r0, 0
	strh r0, [r4, 0x3A]
_080E2FFC:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x5
	bl sub_8076B2C
	subs r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	b _080E3070
_080E3018:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x5
	bl sub_8076B2C
	subs r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8076B2C
	adds r0, 0x4
	b _080E3076
_080E303A:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8076B2C
	adds r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	b _080E3070
_080E3056:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8076B2C
	adds r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
_080E3070:
	bl sub_8076B2C
	subs r0, 0x4
_080E3076:
	lsls r0, 16
	lsrs r1, r0, 16
	b _080E309C
_080E307C:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r1, r0, 24
_080E309C:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	bne _080E30A8
	movs r0, 0x18
	b _080E30B2
_080E30A8:
	cmp r0, 0x5
	bne _080E30B0
	movs r0, 0x6
	b _080E30B2
_080E30B0:
	movs r0, 0xC
_080E30B2:
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	strh r1, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	b _080E3188
_080E30C8:
	adds r0, r4, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080E3196
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	beq _080E3100
	cmp r0, 0x5
	beq _080E3120
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _080E3118
_080E3100:
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x38]
_080E3118:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	b _080E3196
_080E3120:
	movs r0, 0
	strh r0, [r4, 0x2E]
	movs r1, 0x10
	strh r1, [r4, 0x30]
	strh r0, [r4, 0x32]
	movs r0, 0x3
	strh r0, [r4, 0x38]
	b _080E3196
_080E3130:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080E3196
	movs r0, 0
	strh r0, [r4, 0x38]
	b _080E3196
_080E3144:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E3156
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	b _080E315C
_080E3156:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
_080E315C:
	ldrh r1, [r4, 0x32]
	lsls r1, 8
	ldrh r0, [r4, 0x30]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	bne _080E3196
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080E3188:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _080E3196
_080E3190:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E3196:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2F98

	thumb_func_start sub_80E319C
sub_80E319C: @ 80E319C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	muls r0, r1
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r5, r0, 0
	strh r5, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	muls r0, r1
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r3, r0, 0
	strh r3, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E31FA
	ldr r0, _080E3218 @ =gUnknown_83FF180
	ldrh r1, [r4, 0x20]
	adds r1, r5
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x22]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x5
	bl CreateSprite
_080E31FA:
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E320C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E320C:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3218: .4byte gUnknown_83FF180
	thumb_func_end sub_80E319C

	thumb_func_start sub_80E321C
sub_80E321C: @ 80E321C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E3250 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E3258
	ldr r2, _080E3254 @ =gUnknown_2037F02
	ldrh r1, [r5, 0x20]
	ldrh r0, [r2]
	subs r0, r1, r0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	subs r1, r0
	b _080E3266
	.align 2, 0
_080E3250: .4byte gUnknown_2037F1B
_080E3254: .4byte gUnknown_2037F02
_080E3258:
	ldr r2, _080E328C @ =gUnknown_2037F02
	ldrh r1, [r5, 0x20]
	ldrh r0, [r2]
	adds r0, r1, r0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	adds r1, r0
_080E3266:
	strh r1, [r5, 0x32]
	adds r3, r2, 0
	ldrh r1, [r5, 0x22]
	ldrh r2, [r3, 0x2]
	adds r2, r1, r2
	strh r2, [r5, 0x30]
	ldrh r0, [r3, 0x6]
	adds r1, r0
	strh r1, [r5, 0x34]
	ldrh r0, [r3, 0x8]
	strh r0, [r5, 0x36]
	ldrh r0, [r5, 0x2E]
	strh r0, [r5, 0x20]
	strh r2, [r5, 0x22]
	ldr r0, _080E3290 @ =sub_80E319C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E328C: .4byte gUnknown_2037F02
_080E3290: .4byte sub_80E319C
	thumb_func_end sub_80E321C

	thumb_func_start sub_80E3294
sub_80E3294: @ 80E3294
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	ldr r0, _080E32D8 @ =gTasks
	mov r9, r0
	lsls r7, r6, 2
	adds r0, r7, r6
	lsls r0, 3
	mov r8, r0
	mov r4, r8
	add r4, r9
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E32DC
	adds r0, r5, 0
	movs r1, 0
	bl sub_80758E0
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	b _080E3328
	.align 2, 0
_080E32D8: .4byte gTasks
_080E32DC:
	cmp r0, 0x1
	bne _080E3334
	ldrh r0, [r4, 0xA]
	adds r0, 0x60
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	subs r0, 0xD
	strh r0, [r4, 0xC]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r0, 0xC
	ldrsh r2, [r4, r0]
	adds r0, r5, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _080E3360
	movs r0, 0
	strh r0, [r4, 0xE]
	adds r0, r5, 0
	bl sub_8075980
	ldr r1, _080E3330 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080E3328:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E3360
	.align 2, 0
_080E3330: .4byte gSprites
_080E3334:
	ldr r0, _080E336C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	movs r1, 0
	bl LoadBattleMonGfxAndAnimate
	adds r3, r7, 0
	mov r4, r9
	movs r1, 0xF
	mov r2, r8
	adds r0, r4, r2
	adds r0, 0x26
	movs r2, 0
_080E334C:
	strh r2, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080E334C
	adds r0, r3, r6
	lsls r0, 3
	adds r0, r4
	ldr r1, _080E3370 @ =sub_80E3374
	str r1, [r0]
_080E3360:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E336C: .4byte gUnknown_2037F1A
_080E3370: .4byte sub_80E3374
	thumb_func_end sub_80E3294

	thumb_func_start sub_80E3374
sub_80E3374: @ 80E3374
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _080E33A0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080E33D8
	cmp r5, 0x1
	bgt _080E33A4
	cmp r5, 0
	beq _080E33AE
	b _080E34C6
	.align 2, 0
_080E33A0: .4byte gTasks
_080E33A4:
	cmp r5, 0x2
	beq _080E3444
	cmp r5, 0x3
	beq _080E3480
	b _080E34C6
_080E33AE:
	ldr r0, _080E33D0 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldr r0, _080E33D4 @ =0x0000ff38
	strh r0, [r1, 0x26]
	movs r0, 0xC8
	strh r0, [r1, 0x24]
	adds r1, 0x3E
	ldrb r2, [r1]
	subs r0, 0xCD
	ands r0, r2
	strb r0, [r1]
	strh r5, [r4, 0x1C]
	b _080E3472
	.align 2, 0
_080E33D0: .4byte gSprites
_080E33D4: .4byte 0x0000ff38
_080E33D8:
	ldrh r1, [r4, 0x1C]
	adds r1, 0x70
	movs r5, 0
	strh r1, [r4, 0x1C]
	ldr r2, _080E343C @ =gSprites
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r2
	lsls r1, 16
	asrs r1, 24
	ldrh r3, [r2, 0x26]
	adds r1, r3
	strh r1, [r2, 0x26]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	blt _080E3408
	strh r5, [r2, 0x24]
_080E3408:
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	cmp r0, 0
	ble _080E3412
	strh r5, [r2, 0x26]
_080E3412:
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080E34C6
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x76
	bl PlaySE12WithPanning
	ldr r1, _080E3440 @ =0xfffff800
	adds r0, r1, 0
	ldrh r2, [r4, 0x1C]
	adds r0, r2
	strh r0, [r4, 0x1C]
	b _080E3472
	.align 2, 0
_080E343C: .4byte gSprites
_080E3440: .4byte 0xfffff800
_080E3444:
	ldrh r0, [r4, 0x1C]
	subs r0, 0x70
	strh r0, [r4, 0x1C]
	lsls r0, 16
	cmp r0, 0
	bge _080E3454
	movs r0, 0
	strh r0, [r4, 0x1C]
_080E3454:
	ldr r0, _080E347C @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r4, 0x1C]
	lsls r2, 16
	asrs r2, 24
	ldrh r0, [r1, 0x26]
	subs r0, r2
	strh r0, [r1, 0x26]
	movs r3, 0x1C
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080E34C6
_080E3472:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E34C6
	.align 2, 0
_080E347C: .4byte gSprites
_080E3480:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x70
	strh r0, [r4, 0x1C]
	ldr r2, _080E34CC @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r1, 0x26]
	adds r0, r2
	strh r0, [r1, 0x26]
	lsls r0, 16
	cmp r0, 0
	ble _080E34A4
	movs r0, 0
	strh r0, [r1, 0x26]
_080E34A4:
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080E34C6
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x76
	bl PlaySE12WithPanning
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080E34C6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E34CC: .4byte gSprites
	thumb_func_end sub_80E3374

	thumb_func_start sub_80E34D0
sub_80E34D0: @ 80E34D0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E34F4 @ =gUnknown_2037F1B
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E34FC
	ldrb r0, [r4]
	bl sub_807685C
	subs r0, 0x2
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r4, _080E34F8 @ =0x0000ff70
	b _080E350C
	.align 2, 0
_080E34F4: .4byte gUnknown_2037F1B
_080E34F8: .4byte 0x0000ff70
_080E34FC:
	ldrb r0, [r4]
	bl sub_807685C
	adds r0, 0x2
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r4, _080E3528 @ =0x0000ffa0
_080E350C:
	ldr r0, _080E352C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	strh r4, [r5, 0x26]
	ldr r0, _080E3530 @ =sub_80E3534
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3528: .4byte 0x0000ffa0
_080E352C: .4byte gUnknown_2037F1B
_080E3530: .4byte sub_80E3534
	thumb_func_end sub_80E34D0

	thumb_func_start sub_80E3534
sub_80E3534: @ 80E3534
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080E3542
	b _080E365E
_080E3542:
	lsls r0, 2
	ldr r1, _080E354C @ =_080E3550
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E354C: .4byte _080E3550
	.align 2, 0
_080E3550:
	.4byte _080E3564
	.4byte _080E3588
	.4byte _080E35C8
	.4byte _080E35F8
	.4byte _080E3624
_080E3564:
	ldrh r0, [r4, 0x26]
	adds r0, 0xA
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080E365E
	movs r0, 0x3F
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC6
	bl PlaySE12WithPanning
	movs r0, 0
	strh r0, [r4, 0x26]
	b _080E361C
_080E3588:
	ldrh r1, [r4, 0x30]
	adds r1, 0x4
	movs r5, 0
	strh r1, [r4, 0x30]
	ldr r2, _080E35C4 @ =gUnknown_825E074
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	negs r0, r0
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080E365E
	movs r0, 0x3F
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC6
	bl PlaySE12WithPanning
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x26]
	b _080E361C
	.align 2, 0
_080E35C4: .4byte gUnknown_825E074
_080E35C8:
	ldrh r1, [r4, 0x30]
	adds r1, 0x6
	movs r3, 0
	strh r1, [r4, 0x30]
	ldr r2, _080E35F4 @ =gUnknown_825E074
	movs r5, 0x30
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	negs r0, r0
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080E365E
	strh r3, [r4, 0x30]
	strh r3, [r4, 0x26]
	b _080E361C
	.align 2, 0
_080E35F4: .4byte gUnknown_825E074
_080E35F8:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080E365E
	movs r0, 0x3F
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xB9
	bl PlaySE12WithPanning
	movs r0, 0
	strh r0, [r4, 0x30]
_080E361C:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080E365E
_080E3624:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080E365E
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	movs r0, 0x1
	ands r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	subs r0, 0x6
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bne _080E365E
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E365E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E3534

	thumb_func_start sub_80E3664
sub_80E3664: @ 80E3664
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r1, r0, 16
	str r1, [sp]
	asrs r6, r0, 16
	cmp r6, 0
	blt _080E36A6
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r1, r0, 16
	mov r9, r1
	asrs r1, r0, 16
	cmp r1, 0
	bge _080E36B4
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _080E36B0 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
_080E36A6:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	b _080E37BA
	.align 2, 0
_080E36B0: .4byte gSprites
_080E36B4:
	ldr r4, _080E3744 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r4
	ldrh r0, [r5, 0x24]
	adds r0, 0x18
	movs r1, 0
	strh r0, [r5, 0x24]
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r6, r0, r4
	ldrh r0, [r6, 0x24]
	subs r0, 0x18
	strh r0, [r6, 0x24]
	strh r1, [r5, 0x2E]
	strh r1, [r6, 0x2E]
	strh r1, [r5, 0x30]
	strh r1, [r6, 0x30]
	strh r1, [r5, 0x32]
	strh r1, [r6, 0x32]
	movs r0, 0x10
	strh r0, [r5, 0x34]
	ldr r0, _080E3748 @ =0x0000fff0
	strh r0, [r6, 0x34]
	strh r1, [r5, 0x36]
	movs r0, 0x80
	strh r0, [r6, 0x36]
	movs r0, 0x18
	strh r0, [r5, 0x38]
	strh r0, [r6, 0x38]
	strh r7, [r5, 0x3A]
	strh r7, [r6, 0x3A]
	strh r1, [r5, 0x3C]
	strh r1, [r6, 0x3C]
	ldr r2, _080E374C @ =gTasks
	lsls r3, r7, 2
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x8]
	ldr r0, _080E3750 @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _080E3754 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	mov r12, r4
	mov r10, r2
	mov r8, r3
	cmp r0, 0
	bne _080E3758
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	b _080E376E
	.align 2, 0
_080E3744: .4byte gSprites
_080E3748: .4byte 0x0000fff0
_080E374C: .4byte gTasks
_080E3750: .4byte gUnknown_2024018
_080E3754: .4byte gUnknown_2037F1B
_080E3758:
	adds r1, r5, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	adds r1, r6, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_080E376E:
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	mov r0, r12
	adds r4, r2, r0
	ldrb r1, [r4, 0x1]
	movs r3, 0xD
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldr r1, [sp]
	lsls r0, r1, 16
	asrs r0, 16
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	mov r0, r12
	adds r4, r1, r0
	ldrb r0, [r4, 0x1]
	ands r3, r0
	strb r3, [r4, 0x1]
	mov r3, r12
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080E37CC @ =sub_80E37FC
	str r0, [r2]
	adds r1, r3
	str r0, [r1]
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	add r0, r10
	ldr r1, _080E37D0 @ =sub_80E37D4
	str r1, [r0]
_080E37BA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E37CC: .4byte sub_80E37FC
_080E37D0: .4byte sub_80E37D4
	thumb_func_end sub_80E3664

	thumb_func_start sub_80E37D4
sub_80E37D4: @ 80E37D4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080E37F8 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E37F2
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E37F2:
	pop {r0}
	bx r0
	.align 2, 0
_080E37F8: .4byte gTasks
	thumb_func_end sub_80E37D4

	thumb_func_start sub_80E37FC
sub_80E37FC: @ 80E37FC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E3846
	movs r0, 0
	strh r0, [r4, 0x30]
	ldr r0, _080E3870 @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _080E3874 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E3846
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r1, r2, 29
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080E3846:
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	movs r5, 0
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E3878
	cmp r0, 0x1
	beq _080E3890
	b _080E38CE
	.align 2, 0
_080E3870: .4byte gUnknown_2024018
_080E3874: .4byte gUnknown_2037F1B
_080E3878:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	bne _080E38CE
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080E38CE
_080E3890:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	ble _080E38CE
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x38]
	subs r0, 0x2
	strh r0, [r4, 0x38]
	lsls r0, 16
	cmp r0, 0
	bge _080E38CE
	ldr r3, _080E38D4 @ =gTasks
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl obj_delete_but_dont_free_vram
_080E38CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E38D4: .4byte gTasks
	thumb_func_end sub_80E37FC

	thumb_func_start sub_80E38D8
sub_80E38D8: @ 80E38D8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, _080E3924 @ =gUnknown_2037F02
	movs r2, 0
	strh r2, [r3, 0xE]
	ldr r1, _080E3928 @ =gUnknown_2037EFE
	ldrb r0, [r1]
	ldrb r1, [r1]
	adds r0, r1, 0
	subs r0, 0x3D
	lsls r0, 24
	lsrs r0, 24
	adds r2, r1, 0
	cmp r0, 0x1E
	bhi _080E38FC
	movs r0, 0x1
	strh r0, [r3, 0xE]
_080E38FC:
	adds r0, r2, 0
	subs r0, 0x5C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6C
	bhi _080E390C
	movs r0, 0x2
	strh r0, [r3, 0xE]
_080E390C:
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0xC8
	bls _080E3918
	movs r0, 0x3
	strh r0, [r3, 0xE]
_080E3918:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E3924: .4byte gUnknown_2037F02
_080E3928: .4byte gUnknown_2037EFE
	thumb_func_end sub_80E38D8

	thumb_func_start sub_80E392C
sub_80E392C: @ 80E392C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _080E395C @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _080E3952
	b _080E3E6C
_080E3952:
	lsls r0, 2
	ldr r1, _080E3960 @ =_080E3964
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E395C: .4byte gTasks
_080E3960: .4byte _080E3964
	.align 2, 0
_080E3964:
	.4byte _080E3978
	.4byte _080E3A2C
	.4byte _080E3BEC
	.4byte _080E3D0C
	.4byte _080E3D90
_080E3978:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080E39C4 @ =gTasks
	mov r2, r8
	lsls r4, r2, 2
	adds r0, r4, r2
	lsls r0, 3
	adds r6, r0, r1
	movs r3, 0x80
	lsls r3, 4
	adds r0, r3, 0
	ldrh r1, [r6, 0xA]
	adds r0, r1
	strh r0, [r6, 0xA]
	ldr r0, _080E39C8 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _080E39D0
	ldr r2, _080E39CC @ =gSprites
	lsls r3, r7, 4
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
	b _080E39EA
	.align 2, 0
_080E39C4: .4byte gTasks
_080E39C8: .4byte gUnknown_2037F1A
_080E39CC: .4byte gSprites
_080E39D0:
	ldr r3, _080E3A24 @ =gSprites
	lsls r4, r7, 4
	adds r2, r4, r7
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r6, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
_080E39EA:
	ldr r1, _080E3A28 @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	ldrb r0, [r4, 0xA]
	strh r0, [r4, 0xA]
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bhi _080E3A16
	b _080E3E6C
_080E3A16:
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E3E6C
	.align 2, 0
_080E3A24: .4byte gSprites
_080E3A28: .4byte gTasks
_080E3A2C:
	ldr r4, _080E3A90 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E3ACC
	ldr r7, _080E3A94 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080E3A98 @ =gPlayerParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldr r0, _080E3A9C @ =gUnknown_2024018
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080E3AA0
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	b _080E3AA2
	.align 2, 0
_080E3A90: .4byte gUnknown_2037F1A
_080E3A94: .4byte gBattlerPartyIndexes
_080E3A98: .4byte gPlayerParty
_080E3A9C: .4byte gUnknown_2024018
_080E3AA0:
	ldrh r5, [r1, 0x2]
_080E3AA2:
	movs r0, 0x1
	bl GetAnimBankSpriteId
	ldr r2, _080E3AC8 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0
	movs r6, 0x88
	lsls r6, 1
	b _080E3B54
	.align 2, 0
_080E3AC8: .4byte gSprites
_080E3ACC:
	ldr r7, _080E3B24 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080E3B28 @ =gEnemyParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldr r0, _080E3B2C @ =gUnknown_2024018
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080E3B30
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	b _080E3B32
	.align 2, 0
_080E3B24: .4byte gBattlerPartyIndexes
_080E3B28: .4byte gEnemyParty
_080E3B2C: .4byte gUnknown_2024018
_080E3B30:
	ldrh r5, [r1, 0x2]
_080E3B32:
	movs r0, 0x1
	bl GetAnimBankSpriteId
	ldr r2, _080E3BD0 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0x1
	ldr r6, _080E3BD4 @ =0x0000ffe0
_080E3B54:
	ldr r0, _080E3BD8 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r6, 16
	asrs r3, 16
	str r0, [sp]
	str r4, [sp, 0x4]
	mov r2, r10
	str r2, [sp, 0x8]
	mov r4, r9
	str r4, [sp, 0xC]
	ldr r4, _080E3BDC @ =gUnknown_2037F1A
	ldrb r0, [r4]
	str r0, [sp, 0x10]
	movs r0, 0
	str r0, [sp, 0x14]
	adds r0, r5, 0
	adds r1, r7, 0
	movs r2, 0
	bl sub_80768D0
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E3BE0 @ =gUnknown_2024018
	ldr r1, [r0]
	ldrb r0, [r4]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _080E3BBE
	ldr r1, _080E3BD0 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	orrs r0, r1
	ldr r3, _080E3BE4 @ =0x00007fff
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
_080E3BBE:
	ldr r0, _080E3BE8 @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	strh r5, [r1, 0x26]
	b _080E3D82
	.align 2, 0
_080E3BD0: .4byte gSprites
_080E3BD4: .4byte 0x0000ffe0
_080E3BD8: .4byte gUnknown_2037F1B
_080E3BDC: .4byte gUnknown_2037F1A
_080E3BE0: .4byte gUnknown_2024018
_080E3BE4: .4byte 0x00007fff
_080E3BE8: .4byte gTasks
_080E3BEC:
	ldr r1, _080E3C38 @ =gTasks
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r0, 3
	adds r6, r0, r1
	ldrh r0, [r6, 0x26]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1, 0
	ldrh r2, [r6, 0xA]
	adds r0, r2
	strh r0, [r6, 0xA]
	ldr r0, _080E3C3C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _080E3C44
	ldr r3, _080E3C40 @ =gSprites
	lsls r4, r5, 4
	adds r2, r4, r5
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r6, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
	b _080E3C5A
	.align 2, 0
_080E3C38: .4byte gTasks
_080E3C3C: .4byte gUnknown_2037F1A
_080E3C40: .4byte gSprites
_080E3C44:
	ldr r2, _080E3CA8 @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
_080E3C5A:
	ldr r1, _080E3CAC @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r6, r0, r1
	ldrb r0, [r6, 0xA]
	strh r0, [r6, 0xA]
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080E3CDA
	ldr r0, _080E3CB0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E3CB8
	lsls r4, r5, 16
	asrs r4, 16
	ldr r0, _080E3CB4 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bge _080E3CDA
	b _080E3CCE
	.align 2, 0
_080E3CA8: .4byte gSprites
_080E3CAC: .4byte gTasks
_080E3CB0: .4byte gUnknown_2037F1A
_080E3CB4: .4byte gUnknown_2037F1B
_080E3CB8:
	lsls r4, r5, 16
	asrs r4, 16
	ldr r0, _080E3CFC @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	ble _080E3CDA
_080E3CCE:
	ldrh r0, [r6, 0x24]
	adds r0, 0x1
	strh r0, [r6, 0x24]
	ldr r1, _080E3D00 @ =gUnknown_2037F02
	ldr r0, _080E3D04 @ =0x0000ffff
	strh r0, [r1, 0xE]
_080E3CDA:
	lsls r0, r5, 16
	movs r2, 0x80
	lsls r2, 14
	adds r0, r2
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bhi _080E3CEC
	b _080E3E6C
_080E3CEC:
	ldr r0, _080E3D08 @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0xA]
	b _080E3D82
	.align 2, 0
_080E3CFC: .4byte gUnknown_2037F1B
_080E3D00: .4byte gUnknown_2037F02
_080E3D04: .4byte 0x0000ffff
_080E3D08: .4byte gTasks
_080E3D0C:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080E3D58 @ =gTasks
	mov r3, r8
	lsls r4, r3, 2
	adds r0, r4, r3
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x26]
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r5, _080E3D5C @ =gSprites
	adds r0, r5
	bl sub_8076B20
	ldr r0, _080E3D60 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _080E3D64
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1, 0x20]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r1, 0x24]
	b _080E3D78
	.align 2, 0
_080E3D58: .4byte gTasks
_080E3D5C: .4byte gSprites
_080E3D60: .4byte gUnknown_2037F1A
_080E3D64:
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r0, r5
	ldrh r2, [r0, 0x20]
	movs r4, 0x88
	lsls r4, 1
	adds r1, r4, 0
	subs r1, r2
	strh r1, [r0, 0x24]
_080E3D78:
	ldr r0, _080E3D8C @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
_080E3D82:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080E3E6C
	.align 2, 0
_080E3D8C: .4byte gTasks
_080E3D90:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080E3E04 @ =gTasks
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1, 0
	ldrh r3, [r2, 0xA]
	adds r0, r3
	strh r0, [r2, 0xA]
	ldr r0, _080E3E08 @ =gUnknown_2037F1A
	mov r10, r0
	ldrb r0, [r0]
	str r2, [sp, 0x18]
	bl GetBattlerSide
	lsls r0, 24
	mov r9, r4
	ldr r2, [sp, 0x18]
	cmp r0, 0
	bne _080E3E10
	ldr r1, _080E3E0C @ =gSprites
	lsls r5, r7, 4
	adds r0, r5, r7
	lsls r0, 2
	adds r6, r0, r1
	ldrh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r6, 0x24]
	adds r0, r1
	strh r0, [r6, 0x24]
	movs r2, 0x24
	ldrsh r4, [r6, r2]
	movs r3, 0x20
	ldrsh r0, [r6, r3]
	adds r4, r0
	mov r1, r10
	ldrb r0, [r1]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r3, r5, 0
	cmp r4, r0
	blt _080E3E48
	movs r2, 0
	strh r2, [r6, 0x24]
	b _080E3E48
	.align 2, 0
_080E3E04: .4byte gTasks
_080E3E08: .4byte gUnknown_2037F1A
_080E3E0C: .4byte gSprites
_080E3E10:
	ldr r1, _080E3E7C @ =gSprites
	lsls r5, r7, 4
	adds r0, r5, r7
	lsls r0, 2
	adds r6, r0, r1
	ldrh r1, [r2, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r6, 0x24]
	subs r0, r1
	strh r0, [r6, 0x24]
	movs r3, 0x24
	ldrsh r4, [r6, r3]
	movs r1, 0x20
	ldrsh r0, [r6, r1]
	adds r4, r0
	mov r2, r10
	ldrb r0, [r2]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r3, r5, 0
	cmp r4, r0
	bgt _080E3E48
	movs r4, 0
	strh r4, [r6, 0x24]
_080E3E48:
	ldr r1, _080E3E80 @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xA]
	strh r1, [r0, 0xA]
	ldr r1, _080E3E7C @ =gSprites
	adds r0, r3, r7
	lsls r0, 2
	adds r0, r1
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E3E6C
	mov r0, r8
	bl DestroyAnimVisualTask
_080E3E6C:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3E7C: .4byte gSprites
_080E3E80: .4byte gTasks
	thumb_func_end sub_80E392C

	thumb_func_start sub_80E3E84
sub_80E3E84: @ 80E3E84
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E3E96
	cmp r0, 0x1
	beq _080E3F36
	b _080E3FB8
_080E3E96:
	ldr r0, _080E3F14 @ =gUnknown_2037F02
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080E3F28
	movs r0, 0x3F
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x73
	bl PlaySE12WithPanning
	ldr r0, _080E3F18 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	strh r0, [r4, 0x22]
	ldr r0, _080E3F1C @ =0x0000ffe0
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080E3F20 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E3FB8
	movs r0, 0x1
	bl GetAnimBankSpriteId
	ldr r2, _080E3F24 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	b _080E3FB8
	.align 2, 0
_080E3F14: .4byte gUnknown_2037F02
_080E3F18: .4byte gUnknown_2037F1B
_080E3F1C: .4byte 0x0000ffe0
_080E3F20: .4byte gUnknown_2037F1A
_080E3F24: .4byte gSprites
_080E3F28:
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _080E3FB8
_080E3F36:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x30]
	adds r0, r2, 0x5
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	ble _080E3F6A
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r2, 0
	subs r0, 0x7A
	strh r0, [r4, 0x30]
_080E3F6A:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldr r0, _080E3F94 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E3F98
	ldrh r2, [r4, 0x32]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	adds r1, r2, 0
	b _080E3FA4
	.align 2, 0
_080E3F94: .4byte gUnknown_2037F1A
_080E3F98:
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
_080E3FA4:
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	bne _080E3FB8
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E3FB8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E3E84

	thumb_func_start sub_80E3FC0
sub_80E3FC0: @ 80E3FC0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080E3FE8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0x4
	bls _080E3FDC
	b _080E412E
_080E3FDC:
	lsls r0, 2
	ldr r1, _080E3FEC @ =_080E3FF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E3FE8: .4byte gTasks
_080E3FEC: .4byte _080E3FF0
	.align 2, 0
_080E3FF0:
	.4byte _080E4004
	.4byte _080E4054
	.4byte _080E40B0
	.4byte _080E40C8
	.4byte _080E412E
_080E4004:
	ldr r0, _080E4048 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _080E404C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r1, _080E4050 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x6
	strh r0, [r1, 0x8]
	cmp r5, r2
	ble _080E403A
	negs r0, r0
	strh r0, [r1, 0x8]
_080E403A:
	strh r5, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _080E414C
	.align 2, 0
_080E4048: .4byte gUnknown_2037F1A
_080E404C: .4byte gUnknown_2037F1B
_080E4050: .4byte gTasks
_080E4054:
	ldr r1, _080E4090 @ =gUnknown_2023D44
	ldr r0, _080E4094 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _080E4098 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0x8]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080E409C
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	b _080E4122
	.align 2, 0
_080E4090: .4byte gUnknown_2023D44
_080E4094: .4byte gUnknown_2037F1A
_080E4098: .4byte gSprites
_080E409C:
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _080E414C
	b _080E4126
_080E40B0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0, 0x8]
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	strh r1, [r0, 0x26]
	b _080E414C
_080E40C8:
	ldr r1, _080E4108 @ =gUnknown_2023D44
	ldr r0, _080E410C @ =gUnknown_2037F1A
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _080E4110 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0x8]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _080E4114
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _080E414C
	b _080E4126
	.align 2, 0
_080E4108: .4byte gUnknown_2023D44
_080E410C: .4byte gUnknown_2037F1A
_080E4110: .4byte gSprites
_080E4114:
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r2, r3]
_080E4122:
	cmp r0, r1
	blt _080E414C
_080E4126:
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	b _080E414C
_080E412E:
	ldr r1, _080E4154 @ =gUnknown_2023D44
	ldr r0, _080E4158 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _080E415C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x24]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E414C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E4154: .4byte gUnknown_2023D44
_080E4158: .4byte gUnknown_2037F1A
_080E415C: .4byte gSprites
	thumb_func_end sub_80E3FC0

	thumb_func_start sub_80E4160
sub_80E4160: @ 80E4160
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080E41C8 @ =gTasks
	adds r4, r1, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0xE]
	ldr r0, _080E41CC @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080E4194
	movs r1, 0x1
_080E4194:
	strh r1, [r4, 0x10]
	ldr r2, _080E41D0 @ =gSprites
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x14]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x1A]
	strh r5, [r4, 0x1E]
	movs r0, 0x1
	strh r0, [r4, 0x1C]
	strh r5, [r4, 0x20]
	ldr r0, _080E41D4 @ =sub_80E41D8
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E41C8: .4byte gTasks
_080E41CC: .4byte gUnknown_2037F1A
_080E41D0: .4byte gSprites
_080E41D4: .4byte sub_80E41D8
	thumb_func_end sub_80E4160

	thumb_func_start sub_80E41D8
sub_80E41D8: @ 80E41D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E41FC @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080E4280
	cmp r0, 0x1
	bgt _080E4200
	cmp r0, 0
	beq _080E4206
	b _080E42D6
	.align 2, 0
_080E41FC: .4byte gTasks
_080E4200:
	cmp r0, 0x2
	beq _080E42D0
	b _080E42D6
_080E4206:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x8
	movs r2, 0xFF
	ands r0, r2
	strh r0, [r4, 0x1E]
	ldr r5, _080E4278 @ =gSprites
	movs r6, 0xE
	ldrsh r0, [r4, r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldr r3, _080E427C @ =gUnknown_825E074
	movs r6, 0x1E
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x2
	ands r0, r2
	strh r0, [r4, 0x1A]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	movs r6, 0x1A
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x10]
	muls r0, r1
	ldrh r1, [r4, 0x12]
	adds r0, r1
	strh r0, [r2, 0x20]
	movs r6, 0x1A
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bne _080E42D6
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r4, 0x12]
	strh r1, [r0, 0x20]
	b _080E42C0
	.align 2, 0
_080E4278: .4byte gSprites
_080E427C: .4byte gUnknown_825E074
_080E4280:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x1E]
	ldr r3, _080E42C8 @ =gSprites
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _080E42CC @ =gUnknown_825E074
	movs r5, 0x1E
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	movs r6, 0x1E
	ldrsh r2, [r4, r6]
	cmp r2, 0
	bne _080E42D6
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	strh r2, [r1, 0x24]
_080E42C0:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E42D6
	.align 2, 0
_080E42C8: .4byte gSprites
_080E42CC: .4byte gUnknown_825E074
_080E42D0:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E42D6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E41D8

	thumb_func_start sub_80E42DC
sub_80E42DC: @ 80E42DC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E4330 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E4322
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E4322:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4330: .4byte gUnknown_2037F1B
	thumb_func_end sub_80E42DC

	thumb_func_start sub_80E4334
sub_80E4334: @ 80E4334
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E436C @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080E4378
	ldr r2, _080E4370 @ =gUnknown_2037F02
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080E4374 @ =0x0000fff5
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080E4392
	.align 2, 0
_080E436C: .4byte gUnknown_2037F1B
_080E4370: .4byte gUnknown_2037F02
_080E4374: .4byte 0x0000fff5
_080E4378:
	movs r0, 0xB
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	ldr r1, _080E439C @ =gUnknown_2037F02
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080E4392:
	ldr r0, _080E43A0 @ =sub_80E42DC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E439C: .4byte gUnknown_2037F02
_080E43A0: .4byte sub_80E42DC
	thumb_func_end sub_80E4334

	thumb_func_start sub_80E43A4
sub_80E43A4: @ 80E43A4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E43E8 @ =gUnknown_2037F1A
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8076B2C
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _080E43CE
	movs r0, 0x10
	strh r0, [r5, 0x22]
_080E43CE:
	movs r0, 0
	strh r0, [r5, 0x3A]
	movs r1, 0x10
	strh r1, [r5, 0x3C]
	ldr r0, _080E43EC @ =sub_80E43F0
	str r0, [r5, 0x1C]
	lsls r1, 8
	movs r0, 0x52
	bl SetGpuReg
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E43E8: .4byte gUnknown_2037F1A
_080E43EC: .4byte sub_80E43F0
	thumb_func_end sub_80E43A4

	thumb_func_start sub_80E43F0
sub_80E43F0: @ 80E43F0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080E4468
	cmp r1, 0x1
	bgt _080E4406
	cmp r1, 0
	beq _080E4410
	b _080E44E4
_080E4406:
	cmp r1, 0x2
	beq _080E447E
	cmp r1, 0x3
	beq _080E44DE
	b _080E44E4
_080E4410:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E44E4
	strh r1, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E443A
	ldrh r2, [r4, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r4, r3]
	cmp r0, 0xF
	bgt _080E4448
	adds r0, r2, 0x1
	strh r0, [r4, 0x3A]
	b _080E4448
_080E443A:
	ldrh r2, [r4, 0x3C]
	movs r3, 0x3C
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080E4448
	subs r0, r2, 0x1
	strh r0, [r4, 0x3C]
_080E4448:
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x3C]
	lsls r1, 8
	ldrh r0, [r4, 0x3A]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E44E4
	b _080E44D6
_080E4468:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080E44E4
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x30]
	b _080E44D6
_080E447E:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E44E4
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E44AA
	ldrh r2, [r4, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080E44B8
	subs r0, r2, 0x1
	strh r0, [r4, 0x3A]
	b _080E44B8
_080E44AA:
	ldrh r2, [r4, 0x3C]
	movs r3, 0x3C
	ldrsh r0, [r4, r3]
	cmp r0, 0xF
	bgt _080E44B8
	adds r0, r2, 0x1
	strh r0, [r4, 0x3C]
_080E44B8:
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x3C]
	lsls r1, 8
	ldrh r0, [r4, 0x3A]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080E44E4
_080E44D6:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	b _080E44E4
_080E44DE:
	adds r0, r4, 0
	bl move_anim_8074EE0
_080E44E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E43F0

	thumb_func_start sub_80E44EC
sub_80E44EC: @ 80E44EC
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080E4508 @ =gUnknown_2037F02
	movs r0, 0
	strh r0, [r2, 0xE]
	ldr r0, _080E450C @ =gUnknown_2037F00
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080E4510
	movs r0, 0x1
	b _080E4532
	.align 2, 0
_080E4508: .4byte gUnknown_2037F02
_080E450C: .4byte gUnknown_2037F00
_080E4510:
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080E451C
	movs r0, 0x2
	b _080E4532
_080E451C:
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _080E4528
	movs r0, 0x3
	b _080E4532
_080E4528:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E4534
	movs r0, 0x4
_080E4532:
	strh r0, [r2, 0xE]
_080E4534:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	thumb_func_end sub_80E44EC

	thumb_func_start sub_80E4540
sub_80E4540: @ 80E4540
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080E4578 @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _080E457C @ =gUnknown_2037F02
	ldrb r0, [r0]
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _080E4580 @ =gUnknown_83FF7A8
	adds r0, r4, 0
	bl sub_80762D0
	ldr r0, _080E4584 @ =sub_80E4588
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4578: .4byte gTasks
_080E457C: .4byte gUnknown_2037F02
_080E4580: .4byte gUnknown_83FF7A8
_080E4584: .4byte sub_80E4588
	thumb_func_end sub_80E4540

	thumb_func_start sub_80E4588
sub_80E4588: @ 80E4588
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r2, _080E45E0 @ =gTasks
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	adds r1, r0, 0x1
	movs r5, 0
	strh r1, [r3, 0x8]
	subs r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	adds r6, r2, 0
	cmp r0, 0x16
	bhi _080E45EC
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080E45FC
	strh r5, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r5, 0x1
	ands r0, r5
	cmp r0, 0
	bne _080E45EC
	ldr r2, _080E45E4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080E45E8 @ =0x0000ffff
	strh r1, [r0, 0x24]
	b _080E45FC
	.align 2, 0
_080E45E0: .4byte gTasks
_080E45E4: .4byte gSprites
_080E45E8: .4byte 0x0000ffff
_080E45EC:
	ldr r2, _080E461C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
_080E45FC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r6
	bl sub_8076308
	lsls r0, 24
	cmp r0, 0
	bne _080E4614
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E4614:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E461C: .4byte gSprites
	thumb_func_end sub_80E4588

	.align 2, 0 @ Don't pad with nop.
