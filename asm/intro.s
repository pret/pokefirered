	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80EDD28
sub_80EDD28: @ 80EDD28
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _080EDDCC @ =gUnknown_203AB12
	ldrh r0, [r0]
	ands r2, r0
	adds r2, 0x2
	lsls r2, 16
	lsrs r4, r2, 16
	ldr r1, _080EDDD0 @ =gUnknown_203AB2C
	ldrh r0, [r1]
	adds r2, r0, 0
	adds r0, r2, 0x1
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080EDD5C
	movs r6, 0x3
	negs r6, r6
	adds r0, r6, 0
	strh r0, [r1]
_080EDD5C:
	lsls r1, r5, 16
	asrs r1, 16
	lsls r0, r4, 16
	asrs r7, r0, 16
	adds r1, r7
	lsls r0, r3, 16
	asrs r0, 16
	lsls r2, 16
	asrs r6, r2, 16
	adds r0, r6
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	ldr r0, _080EDDD4 @ =0xffff0000
	adds r1, r0
	lsrs r1, 16
	cmp r1, 0xEE
	bhi _080EDDC6
	ldr r0, _080EDDD8 @ =gUnknown_840BC84
	lsls r1, r3, 16
	asrs r5, r1, 16
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080EDDC6
	ldr r0, _080EDDDC @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, _080EDDE0 @ =gUnknown_203AB22
	ldrh r0, [r0]
	lsls r4, r0
	strh r4, [r1, 0x2E]
	ldr r2, _080EDDE4 @ =gUnknown_203AB24
	adds r0, r5, 0
	ldrh r2, [r2]
	lsls r0, r2
	strh r0, [r1, 0x30]
	ldr r0, _080EDDE8 @ =gUnknown_203AB1E
	ldrh r0, [r0]
	muls r0, r7
	strh r0, [r1, 0x32]
	ldr r0, _080EDDEC @ =gUnknown_203AB20
	ldrh r0, [r0]
	muls r0, r6
	strh r0, [r1, 0x34]
_080EDDC6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDDCC: .4byte gUnknown_203AB12
_080EDDD0: .4byte gUnknown_203AB2C
_080EDDD4: .4byte 0xffff0000
_080EDDD8: .4byte gUnknown_840BC84
_080EDDDC: .4byte gSprites
_080EDDE0: .4byte gUnknown_203AB22
_080EDDE4: .4byte gUnknown_203AB24
_080EDDE8: .4byte gUnknown_203AB1E
_080EDDEC: .4byte gUnknown_203AB20
	thumb_func_end sub_80EDD28

	thumb_func_start sub_80EDDF0
sub_80EDDF0: @ 80EDDF0
	push {lr}
	ldr r0, _080EDE00 @ =sub_80EDE04
	movs r1, 0x1
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080EDE00: .4byte sub_80EDE04
	thumb_func_end sub_80EDDF0

	thumb_func_start sub_80EDE04
sub_80EDE04: @ 80EDE04
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	ldr r1, _080EDEB0 @ =gTasks+0x8
	adds r0, r1
	mov r8, r0
	ldrh r1, [r0, 0x4]
	adds r1, 0x1
	strh r1, [r0, 0x4]
	ldrh r0, [r0, 0x6]
	adds r0, 0x1
	mov r2, r8
	strh r0, [r2, 0x6]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x6
	ble _080EDECA
	movs r0, 0
	strh r0, [r2, 0x4]
	ldrb r6, [r2]
	ldr r0, _080EDEB4 @ =gUnknown_840BC84
	ldr r1, _080EDEB8 @ =gUnknown_840BC08
	lsls r6, 2
	adds r6, r1
	movs r3, 0
	ldrsh r1, [r6, r3]
	movs r3, 0x2
	ldrsh r2, [r6, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _080EDEBC @ =gSprites
	adds r7, r4, r5
	adds r0, r7, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080EDEC0 @ =sub_80EE40C
	str r0, [r4]
	ldrh r0, [r6, 0x2]
	lsls r0, 4
	strh r0, [r7, 0x30]
	movs r0, 0x78
	strh r0, [r7, 0x32]
	mov r1, r8
	ldrh r0, [r1, 0x2]
	strh r0, [r7, 0x34]
	lsls r0, 16
	cmp r0, 0
	bge _080EDE88
	movs r0, 0x1
	strh r0, [r7, 0x34]
_080EDE88:
	mov r2, r8
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _080EDECA
	ldrh r0, [r2, 0x2]
	adds r0, 0x1
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080EDEC4
	mov r0, r9
	bl DestroyTask
	b _080EDECA
	.align 2, 0
_080EDEB0: .4byte gTasks+0x8
_080EDEB4: .4byte gUnknown_840BC84
_080EDEB8: .4byte gUnknown_840BC08
_080EDEBC: .4byte gSprites
_080EDEC0: .4byte sub_80EE40C
_080EDEC4:
	movs r0, 0
	mov r3, r8
	strh r0, [r3]
_080EDECA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EDE04

	thumb_func_start sub_80EDED8
sub_80EDED8: @ 80EDED8
	push {lr}
	ldr r0, _080EDEE8 @ =sub_80EDEEC
	movs r1, 0x2
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080EDEE8: .4byte sub_80EDEEC
	thumb_func_end sub_80EDED8

	thumb_func_start sub_80EDEEC
sub_80EDEEC: @ 80EDEEC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080EDF5C @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080EDF44
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x2]
	adds r0, r1, 0x4
	strh r0, [r4, 0x2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _080EDF1A
	subs r0, r1, 0x5
	strh r0, [r4, 0x2]
_080EDF1A:
	ldr r0, _080EDF60 @ =gUnknown_840BCBC
	ldr r1, _080EDF64 @ =gUnknown_840BC08
	lsls r2, 2
	adds r2, r1
	movs r3, 0
	ldrsh r1, [r2, r3]
	movs r3, 0x2
	ldrsh r2, [r2, r3]
	movs r3, 0x3
	bl CreateSprite
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080EDF44
	adds r0, r5, 0
	bl DestroyTask
_080EDF44:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _080EDF56
	movs r0, 0
	strh r0, [r4]
_080EDF56:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EDF5C: .4byte gTasks+0x8
_080EDF60: .4byte gUnknown_840BCBC
_080EDF64: .4byte gUnknown_840BC08
	thumb_func_end sub_80EDEEC

	thumb_func_start sub_80EDF68
sub_80EDF68: @ 80EDF68
	push {lr}
	ldr r0, _080EDF8C @ =gUnknown_840BCDC
	movs r1, 0x78
	movs r2, 0x46
	movs r3, 0x4
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080EDF90 @ =gSprites
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080EDF8C: .4byte gUnknown_840BCDC
_080EDF90: .4byte gSprites
	thumb_func_end sub_80EDF68

	thumb_func_start sub_80EDF94
sub_80EDF94: @ 80EDF94
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0
	strb r0, [r4, 0x6]
	ldr r0, _080EDFD0 @ =sub_80EE024
	movs r1, 0x4
	bl CreateTask
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x5
	adds r2, r4, 0
	bl SetWordTaskArg
	ldr r0, _080EDFD4 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r0, 0x40
	strh r0, [r4, 0xE]
	movs r0, 0
	bl GetBgX
	strh r0, [r4, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EDFD0: .4byte sub_80EE024
_080EDFD4: .4byte gTasks
	thumb_func_end sub_80EDF94

	thumb_func_start sub_80EDFD8
sub_80EDFD8: @ 80EDFD8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r4, 15
	movs r0, 0xF8
	lsls r0, 9
	adds r4, r0
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	mov r1, r8
	movs r2, 0
	bl ChangeBgX
	lsls r5, 8
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl ChangeBgX
	lsls r6, 8
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	bl ChangeBgY
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80EDFD8

	thumb_func_start sub_80EE024
sub_80EE024: @ 80EE024
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080EE048 @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x5
	bhi _080EE11C
	lsls r0, 2
	ldr r1, _080EE04C @ =_080EE050
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EE048: .4byte gTasks+0x8
_080EE04C: .4byte _080EE050
	.align 2, 0
_080EE050:
	.4byte _080EE068
	.4byte _080EE07A
	.4byte _080EE094
	.4byte _080EE0BC
	.4byte _080EE0EE
	.4byte _080EE114
_080EE068:
	movs r0, 0x2
	strh r0, [r5, 0xE]
	movs r0, 0
	strh r0, [r5, 0x2]
	movs r0, 0x6
	strh r0, [r5, 0x10]
	movs r0, 0x20
	strh r0, [r5, 0x12]
	b _080EE10C
_080EE07A:
	ldrh r0, [r5, 0x6]
	subs r0, 0x2
	strh r0, [r5, 0x6]
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080EE11C
	movs r0, 0
	strh r0, [r5, 0x2]
	b _080EE10C
_080EE094:
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xE
	bne _080EE0AE
	adds r0, r2, 0
	movs r1, 0x5
	bl GetWordTaskArg
	movs r1, 0x1
	strb r1, [r0, 0x6]
_080EE0AE:
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0xF
	ble _080EE11C
	movs r0, 0
	strh r0, [r5, 0x2]
	b _080EE10C
_080EE0BC:
	ldrh r0, [r5, 0x6]
	adds r0, 0x8
	strh r0, [r5, 0x6]
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080EE0E0
	bl sub_80EE160
	movs r0, 0x20
	strh r0, [r5, 0x10]
	movs r0, 0x30
	strh r0, [r5, 0x12]
	movs r0, 0x3
	strh r0, [r5, 0xE]
_080EE0E0:
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	cmp r0, 0x7
	ble _080EE11C
	movs r0, 0
	strh r0, [r5, 0x2]
	b _080EE10C
_080EE0EE:
	ldrh r0, [r5, 0x6]
	subs r0, 0x8
	strh r0, [r5, 0x6]
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080EE11C
	movs r1, 0
	strh r1, [r5, 0xE]
	movs r0, 0x40
	strh r0, [r5, 0x6]
	strh r1, [r5, 0x2]
_080EE10C:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080EE11C
_080EE114:
	adds r0, r2, 0
	bl DestroyTask
	b _080EE156
_080EE11C:
	movs r4, 0x6
	ldrsh r3, [r5, r4]
	ldr r4, _080EE15C @ =gSineTable
	adds r0, r3, 0
	adds r0, 0x40
	lsls r0, 1
	adds r0, r4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x12
	ldrsh r0, [r5, r2]
	muls r1, r0
	asrs r1, 8
	negs r1, r1
	movs r0, 0x10
	ldrsh r2, [r5, r0]
	lsls r3, 1
	adds r3, r4
	movs r4, 0
	ldrsh r0, [r3, r4]
	muls r0, r2
	asrs r0, 8
	subs r2, r0
	movs r3, 0xE
	ldrsh r0, [r5, r3]
	movs r4, 0x8
	ldrsh r3, [r5, r4]
	bl sub_80EDFD8
_080EE156:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE15C: .4byte gSineTable
	thumb_func_end sub_80EE024

	thumb_func_start sub_80EE160
sub_80EE160: @ 80EE160
	push {r4,lr}
	ldr r4, _080EE1BC @ =gUnknown_840BE8C
	adds r0, r4, 0
	movs r1, 0x84
	movs r2, 0x4E
	movs r3, 0x6
	bl CreateSprite
	adds r0, r4, 0
	movs r1, 0x84
	movs r2, 0x76
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080EE1B4
	ldr r0, _080EE1C0 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldrb r2, [r4, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r4, 0x3]
	adds r0, r4, 0
	bl sub_80EDAD8
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080EE1B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE1BC: .4byte gUnknown_840BE8C
_080EE1C0: .4byte gSprites
	thumb_func_end sub_80EE160

	thumb_func_start sub_80EE1C4
sub_80EE1C4: @ 80EE1C4
	push {lr}
	adds r3, r0, 0
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
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE1FA
	adds r0, r3, 0
	bl DestroySprite
_080EE1FA:
	pop {r0}
	bx r0
	thumb_func_end sub_80EE1C4

	thumb_func_start sub_80EE200
sub_80EE200: @ 80EE200
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080EE220 @ =gTasks+0x8
	adds r1, r0, r1
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080EE224
	cmp r0, 0x1
	beq _080EE232
	b _080EE28A
	.align 2, 0
_080EE220: .4byte gTasks+0x8
_080EE224:
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	strh r0, [r1, 0x2]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EE232:
	ldrh r0, [r1, 0x4]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _080EE250
	ldrh r2, [r1, 0x2]
	movs r3, 0x2
	ldrsh r0, [r1, r3]
	cmp r0, 0x10
	ble _080EE250
	adds r0, r2, 0
	subs r0, 0x10
	strh r0, [r1, 0x2]
_080EE250:
	movs r0, 0x2
	ldrsh r1, [r1, r0]
	movs r0, 0
	movs r2, 0x1
	bl ChangeBgX
	ldr r5, _080EE290 @ =gUnknown_203AB30
	str r0, [r5]
	ldr r1, _080EE294 @ =0x00007fff
	cmp r0, r1
	bls _080EE270
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
_080EE270:
	ldr r1, [r5]
	ldr r0, _080EE298 @ =0x0000eeff
	cmp r1, r0
	bls _080EE28A
	movs r1, 0xEF
	lsls r1, 8
	movs r0, 0
	movs r2, 0
	bl ChangeBgX
	adds r0, r4, 0
	bl DestroyTask
_080EE28A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE290: .4byte gUnknown_203AB30
_080EE294: .4byte 0x00007fff
_080EE298: .4byte 0x0000eeff
	thumb_func_end sub_80EE200

	thumb_func_start sub_80EE29C
sub_80EE29C: @ 80EE29C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x2E]
	ldrh r0, [r5, 0x32]
	subs r2, r0
	strh r2, [r5, 0x2E]
	ldrh r1, [r5, 0x34]
	ldrh r0, [r5, 0x30]
	adds r1, r0
	strh r1, [r5, 0x30]
	ldrh r0, [r5, 0x36]
	adds r0, 0x30
	strh r0, [r5, 0x36]
	lsls r2, 16
	asrs r2, 20
	strh r2, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldr r1, _080EE340 @ =gSineTable
	lsls r0, 16
	asrs r0, 20
	adds r0, 0x40
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x38]
	adds r0, 0x1
	strh r0, [r5, 0x38]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	ldr r1, _080EE344 @ =gUnknown_203AB16
	ldrh r1, [r1]
	bl __modsi3
	cmp r0, 0
	beq _080EE324
	adds r4, r5, 0
	adds r4, 0x3A
	adds r0, r4, 0
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r1, [sp]
	ldr r0, _080EE348 @ =0x41c64e6d
	muls r1, r0
	ldr r3, _080EE34C @ =0x00006073
	adds r1, r3
	str r1, [sp]
	adds r0, r4, 0
	bl StoreWordInTwoHalfwords
	ldr r2, [sp]
	lsrs r2, 16
	str r2, [sp]
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	ldrh r1, [r5, 0x26]
	ldrh r3, [r5, 0x22]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	bl sub_80EDD28
_080EE324:
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	bge _080EE336
	adds r0, r5, 0
	bl DestroySprite
_080EE336:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE340: .4byte gSineTable
_080EE344: .4byte gUnknown_203AB16
_080EE348: .4byte 0x41c64e6d
_080EE34C: .4byte 0x00006073
	thumb_func_end sub_80EE29C

	thumb_func_start sub_80EE350
sub_80EE350: @ 80EE350
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	strh r0, [r4, 0x2E]
	ldrh r2, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	adds r0, r2, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	adds r1, 0x1
	strh r1, [r4, 0x36]
	ldrh r0, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrh r0, [r4, 0x2E]
	ldr r1, _080EE3F8 @ =gUnknown_203AB22
	ldrh r1, [r1]
	asrs r0, r1
	strh r0, [r4, 0x20]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldr r1, _080EE3FC @ =gUnknown_203AB24
	ldrh r1, [r1]
	asrs r0, r1
	strh r0, [r4, 0x22]
	ldr r1, _080EE400 @ =gUnknown_203AB1C
	ldrh r0, [r1]
	cmp r0, 0
	beq _080EE3A4
	lsls r0, r2, 16
	cmp r0, 0
	bge _080EE3A4
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	ldrh r1, [r1]
	asrs r0, r1
	strh r0, [r4, 0x26]
_080EE3A4:
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	ldr r0, _080EE404 @ =gUnknown_203AB18
	ldrh r0, [r0]
	cmp r1, r0
	ble _080EE3DC
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	ldr r0, _080EE408 @ =gUnknown_203AB1A
	ldrh r0, [r0]
	cmp r1, r0
	ble _080EE3DC
	adds r0, r4, 0
	bl DestroySprite
_080EE3DC:
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	bls _080EE3F0
	adds r0, r4, 0
	bl DestroySprite
_080EE3F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE3F8: .4byte gUnknown_203AB22
_080EE3FC: .4byte gUnknown_203AB24
_080EE400: .4byte gUnknown_203AB1C
_080EE404: .4byte gUnknown_203AB18
_080EE408: .4byte gUnknown_203AB1A
	thumb_func_end sub_80EE350

	thumb_func_start sub_80EE40C
sub_80EE40C: @ 80EE40C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080EE490
	subs r0, r1, 0x1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x22]
	cmp r0, 0x56
	ble _080EE438
	movs r0, 0x4A
	strh r0, [r4, 0x22]
	movs r0, 0x94
	lsls r0, 3
	strh r0, [r4, 0x30]
_080EE438:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE4D4
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080EE46C
	ldrh r0, [r4, 0x20]
	adds r1, r0, 0
	adds r1, 0x1A
	strh r1, [r4, 0x20]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xBC
	ble _080EE486
	movs r2, 0xBC
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r0, 0x1
	b _080EE484
_080EE46C:
	ldrh r0, [r4, 0x20]
	adds r1, r0, 0
	subs r1, 0x1A
	strh r1, [r4, 0x20]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x33
	bgt _080EE486
	movs r0, 0x68
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r0, 0
_080EE484:
	strh r0, [r4, 0x2E]
_080EE486:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	b _080EE4D4
_080EE490:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080EE49E
	adds r0, r4, 0
	bl DestroySprite
_080EE49E:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE4B4
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080EE4B4:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	ble _080EE4D4
	adds r0, r4, 0
	bl DestroySprite
_080EE4D4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80EE40C

	thumb_func_start sub_80EE4DC
sub_80EE4DC: @ 80EE4DC
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE4F2
	adds r0, r2, 0
	bl DestroySprite
_080EE4F2:
	pop {r0}
	bx r0
	thumb_func_end sub_80EE4DC

	thumb_func_start sub_80EE4F8
sub_80EE4F8: @ 80EE4F8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080EE520 @ =gUnknown_840BD88
	movs r1, 0
	movs r2, 0
	movs r3, 0x9
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080EE524 @ =gSprites
	adds r1, r0
	str r1, [r4, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE520: .4byte gUnknown_840BD88
_080EE524: .4byte gSprites
	thumb_func_end sub_80EE4F8

	thumb_func_start sub_80EE528
sub_80EE528: @ 80EE528
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r4, r0, 0
	adds r0, r2, 0
	adds r5, r3, 0
	lsls r1, 16
	lsls r0, 16
	lsls r5, 16
	lsrs r5, 16
	lsrs r2, r1, 16
	mov r9, r2
	asrs r1, 16
	lsls r2, r1, 4
	movs r3, 0
	mov r8, r3
	strh r2, [r4, 0x2E]
	lsrs r6, r0, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	adds r1, r5, 0
	bl __divsi3
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x32]
	strh r6, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	mov r2, r9
	strh r2, [r4, 0x20]
	movs r0, 0x64
	strh r0, [r4, 0x22]
	ldr r0, _080EE57C @ =sub_80EE580
	str r0, [r4, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE57C: .4byte sub_80EE580
	thumb_func_end sub_80EE528

	thumb_func_start sub_80EE580
sub_80EE580: @ 80EE580
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x36]
	adds r0, 0x1
	strh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _080EE5A0
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0x1
	ble _080EE5A0
	subs r0, r1, 0x1
	strh r0, [r2, 0x30]
_080EE5A0:
	ldrh r0, [r2, 0x30]
	ldrh r4, [r2, 0x2E]
	adds r0, r4
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	ldrh r3, [r2, 0x34]
	movs r4, 0x34
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _080EE5BE
	strh r3, [r2, 0x20]
	ldr r0, _080EE5C4 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_080EE5BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE5C4: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE580

	thumb_func_start sub_80EE5C8
sub_80EE5C8: @ 80EE5C8
	push {lr}
	movs r2, 0
	ldr r0, [r0, 0x18]
	ldr r1, [r0, 0x1C]
	ldr r0, _080EE5E0 @ =sub_80EE580
	cmp r1, r0
	bne _080EE5D8
	movs r2, 0x1
_080EE5D8:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_080EE5E0: .4byte sub_80EE580
	thumb_func_end sub_80EE5C8

	thumb_func_start sub_80EE5E4
sub_80EE5E4: @ 80EE5E4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x18]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r0, [r4, 0x18]
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x30]
	ldr r1, [r4, 0x18]
	movs r0, 0x3
	strh r0, [r1, 0x26]
	ldr r1, [r4, 0x18]
	ldr r0, _080EE60C @ =sub_80EE610
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE60C: .4byte sub_80EE610
	thumb_func_end sub_80EE5E4

	thumb_func_start sub_80EE610
sub_80EE610: @ 80EE610
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080EE646
	cmp r5, 0x1
	bgt _080EE626
	cmp r5, 0
	beq _080EE62C
	b _080EE69A
_080EE626:
	cmp r5, 0x2
	beq _080EE65C
	b _080EE69A
_080EE62C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080EE69A
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	strh r5, [r4, 0x26]
	b _080EE654
_080EE646:
	movs r0, 0x21
	movs r1, 0x3F
	movs r2, 0x1
	bl PlayCry3
	movs r0, 0
	strh r0, [r4, 0x30]
_080EE654:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EE69A
_080EE65C:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080EE67C
	movs r0, 0
	strh r0, [r4, 0x32]
	movs r1, 0
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080EE67A
	movs r1, 0x1
_080EE67A:
	strh r1, [r4, 0x26]
_080EE67C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x30
	ble _080EE69A
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r0, _080EE6A0 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080EE69A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE6A0: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE610

	thumb_func_start sub_80EE6A4
sub_80EE6A4: @ 80EE6A4
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080EE6F0 @ =gUnknown_203AB0A
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _080EE6F4 @ =gUnknown_203AB04
	movs r0, 0x3
	strh r0, [r1]
	ldr r1, _080EE6F8 @ =gUnknown_203AB08
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _080EE6FC @ =gUnknown_203AB06
	movs r0, 0
	strh r0, [r1]
	ldr r0, [r4, 0x18]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r0, [r4, 0x18]
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x30]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x32]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x34]
	ldr r0, [r4, 0x18]
	strh r1, [r0, 0x36]
	ldr r1, [r4, 0x18]
	movs r0, 0x28
	strh r0, [r1, 0x3C]
	ldr r1, [r4, 0x18]
	ldr r0, _080EE700 @ =sub_80EE704
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE6F0: .4byte gUnknown_203AB0A
_080EE6F4: .4byte gUnknown_203AB04
_080EE6F8: .4byte gUnknown_203AB08
_080EE6FC: .4byte gUnknown_203AB06
_080EE700: .4byte sub_80EE704
	thumb_func_end sub_80EE6A4

	thumb_func_start sub_80EE704
sub_80EE704: @ 80EE704
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080EE740
	cmp r0, 0x1
	bgt _080EE71A
	cmp r0, 0
	beq _080EE726
	b _080EE846
_080EE71A:
	cmp r0, 0x2
	beq _080EE7C4
	cmp r0, 0x3
	bne _080EE724
	b _080EE824
_080EE724:
	b _080EE846
_080EE726:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080EE736
	b _080EE846
_080EE736:
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	b _080EE818
_080EE740:
	ldrh r2, [r4, 0x3C]
	ldrh r3, [r4, 0x32]
	adds r1, r2, r3
	movs r5, 0
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x8
	strh r0, [r4, 0x34]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x24]
	ldr r1, _080EE7B0 @ =gSineTable
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _080EE7B4 @ =gUnknown_203AB04
	ldrh r0, [r0]
	muls r0, r1
	ldr r1, _080EE7B8 @ =gUnknown_203AB08
	ldrh r1, [r1]
	asrs r0, r1
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	ldr r0, _080EE7BC @ =gUnknown_203AB06
	ldrh r0, [r0]
	cmp r1, r0
	ble _080EE78C
	strh r5, [r4, 0x38]
	subs r0, r2, 0x1
	strh r0, [r4, 0x3C]
_080EE78C:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080EE846
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
	ldr r0, _080EE7C0 @ =0x00004757
	strh r0, [r4, 0x3A]
	movs r0, 0x1C
	strh r0, [r4, 0x3C]
	b _080EE818
	.align 2, 0
_080EE7B0: .4byte gSineTable
_080EE7B4: .4byte gUnknown_203AB04
_080EE7B8: .4byte gUnknown_203AB08
_080EE7BC: .4byte gUnknown_203AB06
_080EE7C0: .4byte 0x00004757
_080EE7C4:
	ldrh r0, [r4, 0x3C]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r1, r0, 20
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080EE804
	ldrh r0, [r4, 0x20]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r3, 0x3A
	ldrsh r2, [r4, r3]
	bl sub_80EE864
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	ldr r0, _080EE820 @ =0x41c64e6d
	muls r0, r1
	strh r0, [r4, 0x3A]
_080EE804:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0xC
	ble _080EE846
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0x30]
_080EE818:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EE846
	.align 2, 0
_080EE820: .4byte 0x41c64e6d
_080EE824:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080EE846
	ldr r0, _080EE84C @ =gUnknown_203AB0A
	ldrh r1, [r0]
	ldrh r2, [r4, 0x24]
	negs r2, r2
	lsls r2, 16
	asrs r2, 16
	adds r0, r4, 0
	movs r3, 0x4
	bl sub_80EE970
_080EE846:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE84C: .4byte gUnknown_203AB0A
	thumb_func_end sub_80EE704

	thumb_func_start sub_80EE850
sub_80EE850: @ 80EE850
	ldr r0, [r0, 0x18]
	ldr r1, [r0, 0x1C]
	ldr r0, _080EE860 @ =SpriteCallbackDummy
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	.align 2, 0
_080EE860: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE850

	thumb_func_start sub_80EE864
sub_80EE864: @ 80EE864
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r2, 16
	lsrs r5, r2, 16
	movs r6, 0
	lsls r0, 16
	ldr r2, _080EE8D4 @ =0xffea0000
	adds r2, r0
	mov r8, r2
	lsls r1, 16
	movs r0, 0xC0
	lsls r0, 13
	adds r7, r1, r0
_080EE880:
	ldr r0, _080EE8D8 @ =gUnknown_840BEC4
	mov r2, r8
	asrs r1, r2, 16
	asrs r2, r7, 16
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080EE8C4
	ldr r0, _080EE8DC @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	lsls r5, 16
	asrs r5, 16
	adds r0, r5, 0
	movs r1, 0xD
	bl __modsi3
	adds r0, 0x8
	strh r0, [r4, 0x34]
	adds r0, r5, 0
	movs r1, 0x3
	bl __modsi3
	strh r0, [r4, 0x36]
	strh r6, [r4, 0x3C]
	ldr r0, _080EE8E0 @ =0x41c64e6d
	muls r0, r5
	lsls r0, 16
	lsrs r5, r0, 16
_080EE8C4:
	adds r6, 0x1
	cmp r6, 0x1
	ble _080EE880
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EE8D4: .4byte 0xffea0000
_080EE8D8: .4byte gUnknown_840BEC4
_080EE8DC: .4byte gSprites
_080EE8E0: .4byte 0x41c64e6d
	thumb_func_end sub_80EE864

	thumb_func_start sub_80EE8E4
sub_80EE8E4: @ 80EE8E4
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x2E
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080EE8FA
	cmp r0, 0x1
	beq _080EE90C
	b _080EE93E
_080EE8FA:
	ldrh r0, [r5, 0x20]
	lsls r0, 4
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x22]
	lsls r0, 4
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_080EE90C:
	ldrh r1, [r4, 0x2]
	ldrh r0, [r4, 0x6]
	subs r1, r0
	strh r1, [r4, 0x2]
	ldrh r0, [r4, 0x8]
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r4, 0x4]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x20]
	ldrh r0, [r4, 0x4]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE93E
	adds r0, r5, 0
	bl DestroySprite
_080EE93E:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080EE96A
	movs r0, 0
	strh r0, [r4, 0xE]
	adds r3, r5, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080EE96A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80EE8E4

	thumb_func_start sub_80EE970
sub_80EE970: @ 80EE970
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	adds r6, r3, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	movs r1, 0
	mov r8, r1
	mov r1, r8
	strh r1, [r4, 0x2E]
	strh r5, [r4, 0x30]
	ldrh r1, [r4, 0x24]
	lsls r1, 4
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 12
	adds r1, r5, 0
	bl __divsi3
	strh r0, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	movs r0, 0x80
	lsls r0, 4
	adds r1, r5, 0
	bl __divsi3
	strh r0, [r4, 0x38]
	mov r1, r8
	strh r1, [r4, 0x3A]
	strh r6, [r4, 0x3C]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r0, _080EE9D0 @ =sub_80EE9D4
	str r0, [r4, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE9D0: .4byte sub_80EE9D4
	thumb_func_end sub_80EE970

	thumb_func_start sub_80EE9D4
sub_80EE9D4: @ 80EE9D4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080EEA08
	cmp r5, 0x1
	bgt _080EE9EA
	cmp r5, 0
	beq _080EE9F0
	b _080EEA88
_080EE9EA:
	cmp r5, 0x2
	beq _080EEA6E
	b _080EEA88
_080EE9F0:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080EEA88
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	b _080EEA64
_080EEA08:
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r5, r0, 16
	cmp r5, 0
	beq _080EEA4C
	ldrh r1, [r4, 0x34]
	ldrh r2, [r4, 0x32]
	adds r1, r2
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x24]
	ldr r1, _080EEA48 @ =gSineTable
	lsls r0, 16
	asrs r0, 20
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	asrs r0, r1
	negs r0, r0
	strh r0, [r4, 0x26]
	b _080EEA88
	.align 2, 0
_080EEA48: .4byte gSineTable
_080EEA4C:
	ldrh r0, [r4, 0x32]
	lsrs r0, 4
	strh r0, [r4, 0x24]
	strh r5, [r4, 0x26]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	beq _080EEA84
_080EEA64:
	strh r5, [r4, 0x3A]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EEA88
_080EEA6E:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080EEA88
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080EEA84:
	ldr r0, _080EEA90 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080EEA88:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EEA90: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE9D4

	thumb_func_start sub_80EEA94
sub_80EEA94: @ 80EEA94
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x18]
	movs r2, 0
	strh r2, [r0, 0x2E]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x30]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x32]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x34]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x36]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x38]
	ldr r1, [r4, 0x18]
	ldrh r0, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r0, r3
	strh r0, [r1, 0x20]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x24]
	ldr r1, _080EEAF4 @ =gUnknown_203AB0C
	movs r0, 0x24
	strh r0, [r1]
	ldr r1, _080EEAF8 @ =gUnknown_203AB06
	movs r0, 0x28
	strh r0, [r1]
	ldr r1, _080EEAFC @ =gUnknown_203AB04
	movs r0, 0x3
	strh r0, [r1]
	ldr r1, _080EEB00 @ =gUnknown_203AB08
	movs r0, 0x4
	strh r0, [r1]
	ldr r1, [r4, 0x18]
	movs r0, 0x24
	strh r0, [r1, 0x3C]
	ldr r0, [r4, 0x18]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r1, [r4, 0x18]
	ldr r0, _080EEB04 @ =sub_80EEB08
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EEAF4: .4byte gUnknown_203AB0C
_080EEAF8: .4byte gUnknown_203AB06
_080EEAFC: .4byte gUnknown_203AB04
_080EEB00: .4byte gUnknown_203AB08
_080EEB04: .4byte sub_80EEB08
	thumb_func_end sub_80EEA94

	thumb_func_start sub_80EEB08
sub_80EEB08: @ 80EEB08
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080EEB58
	cmp r0, 0x1
	bgt _080EEB1E
	cmp r0, 0
	beq _080EEB24
	b _080EEBCE
_080EEB1E:
	cmp r0, 0x2
	beq _080EEB84
	b _080EEBCE
_080EEB24:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EEB4A
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ands r0, r1
	cmp r0, 0
	beq _080EEB44
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	b _080EEB48
_080EEB44:
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
_080EEB48:
	strh r0, [r4, 0x24]
_080EEB4A:
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	cmp r0, 0x11
	ble _080EEBCE
	movs r0, 0
	strh r0, [r4, 0x30]
	b _080EEB78
_080EEB58:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _080EEB80 @ =gUnknown_203AB06
	ldrh r1, [r1]
	cmp r0, r1
	blt _080EEBCE
	adds r0, r4, 0
	movs r1, 0x4
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
_080EEB78:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EEBCE
	.align 2, 0
_080EEB80: .4byte gUnknown_203AB06
_080EEB84:
	ldrh r2, [r4, 0x3C]
	ldrh r1, [r4, 0x30]
	adds r0, r2, r1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	negs r1, r0
	strh r1, [r4, 0x24]
	ldr r1, _080EEBD4 @ =gSineTable
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _080EEBD8 @ =gUnknown_203AB04
	ldrh r0, [r0]
	muls r0, r1
	ldr r1, _080EEBDC @ =gUnknown_203AB08
	ldrh r1, [r1]
	asrs r0, r1
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080EEBC0
	subs r0, r2, 0x1
	strh r0, [r4, 0x3C]
_080EEBC0:
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	cmp r0, 0x3F
	ble _080EEBCE
	ldr r0, _080EEBE0 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080EEBCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EEBD4: .4byte gSineTable
_080EEBD8: .4byte gUnknown_203AB04
_080EEBDC: .4byte gUnknown_203AB08
_080EEBE0: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EEB08

	thumb_func_start sub_80EEBE4
sub_80EEBE4: @ 80EEBE4
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _080EEC04 @ =gUnknown_840BEDC
_080EEBEA:
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x6
	bls _080EEBEA
	ldr r0, _080EEC08 @ =gUnknown_840BF14
	bl LoadSpritePalettes
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EEC04: .4byte gUnknown_840BEDC
_080EEC08: .4byte gUnknown_840BF14
	thumb_func_end sub_80EEBE4

	.align 2, 0 @ Don't pad with nop.
