	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815F138
sub_815F138: @ 815F138
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, [sp, 0x18]
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0815F190 @ =sub_815F1AC
	movs r1, 0x50
	str r3, [sp]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0815F194 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r6, [r1, 0x10]
	ldr r3, [sp]
	strh r3, [r1, 0x12]
	mov r0, r8
	strh r0, [r1, 0x14]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815F190: .4byte sub_815F1AC
_0815F194: .4byte gTasks
	thumb_func_end sub_815F138

	thumb_func_start sub_815F198
sub_815F198: @ 815F198
	push {lr}
	ldr r0, _0815F1A8 @ =sub_815F1AC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0815F1A8: .4byte sub_815F1AC
	thumb_func_end sub_815F198

	thumb_func_start sub_815F1AC
sub_815F1AC: @ 815F1AC
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0815F1D0 @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0815F21C
	cmp r0, 0x1
	bgt _0815F1D4
	cmp r0, 0
	beq _0815F1DA
	b _0815F29E
	.align 2, 0
_0815F1D0: .4byte gTasks+0x8
_0815F1D4:
	cmp r0, 0x2
	beq _0815F260
	b _0815F29E
_0815F1DA:
	ldrh r0, [r5, 0x4]
	ldrh r1, [r5, 0x6]
	bl sub_815F564
	ldrh r0, [r5, 0x4]
	ldrh r1, [r5, 0x6]
	movs r3, 0x8
	ldrsh r2, [r5, r3]
	movs r4, 0xA
	ldrsh r3, [r5, r4]
	ldrb r4, [r5, 0xC]
	str r4, [sp]
	bl sub_815F5BC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	ldrh r0, [r5, 0x4]
	ldrh r1, [r5, 0x6]
	movs r3, 0x8
	ldrsh r2, [r5, r3]
	movs r4, 0xA
	ldrsh r3, [r5, r4]
	ldrb r4, [r5, 0xC]
	str r4, [sp]
	adds r4, r5, 0
	adds r4, 0x10
	str r4, [sp, 0x4]
	adds r4, 0x2
	str r4, [sp, 0x8]
	bl sub_815F610
	b _0815F252
_0815F21C:
	ldrb r0, [r5, 0xE]
	bl sub_815F2AC
	cmp r0, 0
	bne _0815F29E
	ldrb r0, [r5, 0xE]
	ldrb r1, [r5, 0x10]
	ldrb r2, [r5, 0x12]
	bl sub_815F3E0
	movs r0, 0xE
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0815F25C @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	movs r3, 0xE
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
_0815F252:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0815F29E
	.align 2, 0
_0815F25C: .4byte gSprites
_0815F260:
	ldrb r0, [r5, 0x10]
	bl sub_815F444
	cmp r0, 0
	bne _0815F29E
	movs r4, 0x10
	ldrsh r1, [r5, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0815F2A8 @ =gSprites
	adds r0, r4
	bl DestroySprite
	movs r0, 0x12
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldrh r0, [r5, 0x4]
	bl FreeSpriteTilesByTag
	ldrh r0, [r5, 0x6]
	bl FreeSpritePaletteByTag
	adds r0, r6, 0
	bl DestroyTask
_0815F29E:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815F2A8: .4byte gSprites
	thumb_func_end sub_815F1AC

	thumb_func_start sub_815F2AC
sub_815F2AC: @ 815F2AC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0815F2D0 @ =gSprites
	adds r4, r1, r0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bls _0815F2C6
	b _0815F3D8
_0815F2C6:
	lsls r0, 2
	ldr r1, _0815F2D4 @ =_0815F2D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815F2D0: .4byte gSprites
_0815F2D4: .4byte _0815F2D8
	.align 2, 0
_0815F2D8:
	.4byte _0815F2F8
	.4byte _0815F30A
	.4byte _0815F330
	.4byte _0815F340
	.4byte _0815F362
	.4byte _0815F39A
	.4byte _0815F3C0
	.4byte _0815F396
_0815F2F8:
	movs r1, 0x80
	lsls r1, 4
	adds r0, r4, 0
	movs r2, 0x1A
	bl sub_8007FFC
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_0815F30A:
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0815F318
	movs r0, 0x32
	bl PlaySE
_0815F318:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0815F3D8
	movs r0, 0
	strh r0, [r4, 0x32]
	adds r0, r4, 0
	movs r1, 0x1
	b _0815F3B6
_0815F330:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0815F3D8
	b _0815F3BA
_0815F340:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0815F3D8
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _0815F3D8
_0815F362:
	ldrh r0, [r4, 0x22]
	subs r0, 0x4
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0815F3D8
	ldrh r1, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bgt _0815F392
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0x32]
	b _0815F3BA
_0815F392:
	movs r0, 0x7
	strh r0, [r4, 0x2E]
_0815F396:
	movs r0, 0
	b _0815F3DA
_0815F39A:
	ldrh r0, [r4, 0x22]
	adds r0, 0x4
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0815F3D8
	movs r0, 0
	strh r0, [r4, 0x32]
	adds r0, r4, 0
	movs r1, 0x3
_0815F3B6:
	bl StartSpriteAffineAnim
_0815F3BA:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	b _0815F3D6
_0815F3C0:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0815F3D8
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r0, 0x1
_0815F3D6:
	strh r0, [r4, 0x2E]
_0815F3D8:
	movs r0, 0x1
_0815F3DA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_815F2AC

	thumb_func_start sub_815F3E0
sub_815F3E0: @ 815F3E0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0815F438 @ =gSprites
	mov r8, r0
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r5, r4, r0
	ldr r0, _0815F43C @ =0x0000ffd8
	strh r0, [r5, 0x26]
	lsls r3, r2, 4
	adds r3, r2
	lsls r3, 2
	mov r1, r8
	adds r2, r3, r1
	strh r0, [r2, 0x26]
	adds r5, 0x3E
	ldrb r6, [r5]
	movs r1, 0x5
	negs r1, r1
	adds r0, r1, 0
	ands r0, r6
	strb r0, [r5]
	adds r2, 0x3E
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _0815F440 @ =sub_815F470
	str r0, [r4]
	add r3, r8
	str r0, [r3]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815F438: .4byte gSprites
_0815F43C: .4byte 0x0000ffd8
_0815F440: .4byte sub_815F470
	thumb_func_end sub_815F3E0

	thumb_func_start sub_815F444
sub_815F444: @ 815F444
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r2, _0815F468 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, 0x1C
	adds r1, r2
	ldr r1, [r1]
	ldr r0, _0815F46C @ =sub_815F470
	cmp r1, r0
	bne _0815F462
	movs r3, 0x1
_0815F462:
	adds r0, r3, 0
	pop {r1}
	bx r1
	.align 2, 0
_0815F468: .4byte gSprites
_0815F46C: .4byte sub_815F470
	thumb_func_end sub_815F444

	thumb_func_start sub_815F470
sub_815F470: @ 815F470
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x2E
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bhi _0815F55A
	lsls r0, 2
	ldr r1, _0815F48C @ =_0815F490
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815F48C: .4byte _0815F490
	.align 2, 0
_0815F490:
	.4byte _0815F4A4
	.4byte _0815F4B4
	.4byte _0815F4DC
	.4byte _0815F510
	.4byte _0815F548
_0815F4A4:
	movs r0, 0x40
	strh r0, [r4, 0x8]
	ldrh r0, [r5, 0x26]
	lsls r0, 4
	strh r0, [r4, 0xA]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0815F4B4:
	ldrh r1, [r4, 0x8]
	ldrh r2, [r4, 0xA]
	adds r0, r1, r2
	strh r0, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0x8]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x26]
	cmp r0, 0
	blt _0815F55A
	movs r0, 0x32
	bl PlaySE
	movs r0, 0
	strh r0, [r5, 0x26]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0815F55A
_0815F4DC:
	ldrh r0, [r4, 0x2]
	adds r0, 0xC
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	ble _0815F4FA
	movs r0, 0x32
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0815F4FA:
	ldr r0, _0815F50C @ =gSineTable
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	asrs r0, 4
	b _0815F53E
	.align 2, 0
_0815F50C: .4byte gSineTable
_0815F510:
	ldrh r0, [r4, 0x2]
	adds r0, 0x10
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	ble _0815F52E
	movs r0, 0x32
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0815F52E:
	ldr r1, _0815F544 @ =gSineTable
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
_0815F53E:
	negs r0, r0
	strh r0, [r5, 0x26]
	b _0815F55A
	.align 2, 0
_0815F544: .4byte gSineTable
_0815F548:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _0815F55A
	ldr r0, _0815F560 @ =SpriteCallbackDummy
	str r0, [r5, 0x1C]
_0815F55A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815F560: .4byte SpriteCallbackDummy
	thumb_func_end sub_815F470

	thumb_func_start sub_815F564
sub_815F564: @ 815F564
	push {r4,lr}
	sub sp, 0x10
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0815F5AC @ =gUnknown_847A79C
	ldr r3, [r2, 0x4]
	ldr r2, [r2]
	str r2, [sp]
	str r3, [sp, 0x4]
	ldr r2, _0815F5B0 @ =gUnknown_847A7A4
	ldr r3, [r2, 0x4]
	ldr r2, [r2]
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	lsls r0, 16
	ldr r3, _0815F5B4 @ =0x0000ffff
	ldr r2, [sp, 0x4]
	ands r2, r3
	orrs r2, r0
	str r2, [sp, 0x4]
	ldr r2, _0815F5B8 @ =0xffff0000
	add r4, sp, 0x8
	ldr r0, [r4, 0x4]
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	mov r0, sp
	bl LoadCompressedObjectPic
	adds r0, r4, 0
	bl LoadSpritePalette
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815F5AC: .4byte gUnknown_847A79C
_0815F5B0: .4byte gUnknown_847A7A4
_0815F5B4: .4byte 0x0000ffff
_0815F5B8: .4byte 0xffff0000
	thumb_func_end sub_815F564

	thumb_func_start sub_815F5BC
sub_815F5BC: @ 815F5BC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	mov r12, r3
	ldr r3, [sp, 0x30]
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	mov r5, sp
	ldr r4, _0815F60C @ =gUnknown_847A860
	ldm r4!, {r3,r6,r7}
	stm r5!, {r3,r6,r7}
	ldm r4!, {r3,r6,r7}
	stm r5!, {r3,r6,r7}
	mov r4, sp
	strh r0, [r4]
	mov r0, sp
	strh r1, [r0, 0x2]
	lsls r2, 16
	asrs r2, 16
	mov r0, r12
	lsls r6, r0, 16
	asrs r6, 16
	mov r0, sp
	adds r1, r2, 0
	adds r2, r6, 0
	mov r3, r8
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0815F60C: .4byte gUnknown_847A860
	thumb_func_end sub_815F5BC

	thumb_func_start sub_815F610
sub_815F610: @ 815F610
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	mov r12, r3
	ldr r6, [sp, 0x38]
	ldr r3, [sp, 0x3C]
	mov r9, r3
	ldr r4, [sp, 0x40]
	mov r8, r4
	lsls r1, 16
	lsrs r1, 16
	lsls r6, 24
	lsrs r6, 24
	mov r10, r6
	mov r4, sp
	ldr r3, _0815F6D4 @ =gUnknown_847A878
	ldm r3!, {r5-r7}
	stm r4!, {r5-r7}
	ldm r3!, {r5-r7}
	stm r4!, {r5-r7}
	mov r3, sp
	strh r0, [r3]
	mov r0, sp
	strh r1, [r0, 0x2]
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _0815F6D8 @ =0xffe00000
	adds r2, r0
	asrs r2, 16
	mov r1, r12
	lsls r5, r1, 16
	asrs r5, 16
	mov r0, sp
	adds r1, r2, 0
	adds r2, r5, 0
	mov r3, r10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r3, r9
	strh r0, [r3]
	adds r4, 0x20
	lsls r4, 16
	asrs r4, 16
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	mov r3, r10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r4, r8
	strh r0, [r4]
	ldr r2, _0815F6DC @ =gSprites
	mov r5, r9
	movs r6, 0
	ldrsh r1, [r5, r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r0]
	movs r7, 0
	ldrsh r1, [r4, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	movs r0, 0
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	bl StartSpriteAnim
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815F6D4: .4byte gUnknown_847A878
_0815F6D8: .4byte 0xffe00000
_0815F6DC: .4byte gSprites
	thumb_func_end sub_815F610

	.align 2, 0 @ Don't pad with nop.
