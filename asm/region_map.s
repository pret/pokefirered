	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C4398
sub_80C4398: @ 80C4398
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r5, _080C43F4 @ =gUnknown_20399EC
	ldr r0, _080C43F8 @ =0x0000046c
	bl AllocZeroed
	str r0, [r5]
	movs r2, 0x8D
	lsls r2, 3
	adds r1, r0, r2
	mov r2, r8
	str r2, [r1]
	movs r1, 0x8C
	lsls r1, 3
	adds r0, r1
	strb r4, [r0]
	ldr r0, _080C43FC @ =gUnknown_83F18D8
	ldr r1, [r5]
	bl LZ77UnCompWram
	ldr r0, _080C4400 @ =gUnknown_83F1908
	ldr r1, [r5]
	adds r1, 0x40
	bl LZ77UnCompWram
	ldr r1, _080C4404 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C4408 @ =sub_80C440C
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C43F4: .4byte gUnknown_20399EC
_080C43F8: .4byte 0x0000046c
_080C43FC: .4byte gUnknown_83F18D8
_080C4400: .4byte gUnknown_83F1908
_080C4404: .4byte gTasks
_080C4408: .4byte sub_80C440C
	thumb_func_end sub_80C4398

	thumb_func_start sub_80C440C
sub_80C440C: @ 80C440C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C442C @ =gUnknown_20399EC
	ldr r0, [r0]
	ldr r1, _080C4430 @ =0x00000463
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _080C44BC
	lsls r0, 2
	ldr r1, _080C4434 @ =_080C4438
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C442C: .4byte gUnknown_20399EC
_080C4430: .4byte 0x00000463
_080C4434: .4byte _080C4438
	.align 2, 0
_080C4438:
	.4byte _080C444C
	.4byte _080C4452
	.4byte _080C4468
	.4byte _080C446E
	.4byte _080C44A0
_080C444C:
	bl sub_80C08E0
	b _080C44A4
_080C4452:
	bl sub_80C47F0
	ldr r0, _080C4460 @ =gUnknown_20399EC
	ldr r1, [r0]
	ldr r0, _080C4464 @ =0x00000463
	adds r1, r0
	b _080C44AC
	.align 2, 0
_080C4460: .4byte gUnknown_20399EC
_080C4464: .4byte 0x00000463
_080C4468:
	bl sub_80C4750
	b _080C44A4
_080C446E:
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080C4498 @ =gUnknown_20399EC
	ldr r1, [r0]
	ldr r0, _080C449C @ =0x00000463
	adds r1, r0
	b _080C44AC
	.align 2, 0
_080C4498: .4byte gUnknown_20399EC
_080C449C: .4byte 0x00000463
_080C44A0:
	bl sub_80C08F4
_080C44A4:
	ldr r0, _080C44B4 @ =gUnknown_20399EC
	ldr r1, [r0]
	ldr r2, _080C44B8 @ =0x00000463
	adds r1, r2
_080C44AC:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080C44DC
	.align 2, 0
_080C44B4: .4byte gUnknown_20399EC
_080C44B8: .4byte 0x00000463
_080C44BC:
	movs r0, 0
	bl GetGpuReg
	adds r1, r0, 0
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl sub_80C44E4
_080C44DC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C440C

	thumb_func_start sub_80C44E4
sub_80C44E4: @ 80C44E4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C4504 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080C4508 @ =gUnknown_20399EC
	ldr r0, [r0]
	movs r2, 0x8D
	lsls r2, 3
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
	bx lr
	.align 2, 0
_080C4504: .4byte gTasks
_080C4508: .4byte gUnknown_20399EC
	thumb_func_end sub_80C44E4

	thumb_func_start sub_80C450C
sub_80C450C: @ 80C450C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	mov r10, r0
	mov r9, r1
	adds r4, r2, 0
	adds r5, r3, 0
	ldr r3, [sp, 0x4C]
	ldr r6, [sp, 0x50]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	str r5, [sp, 0x28]
	lsls r3, 24
	lsrs r3, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r7, _080C45F4 @ =gUnknown_20399EC
	ldr r0, [r7]
	adds r0, 0x40
	str r0, [sp, 0x18]
	movs r2, 0x80
	lsls r2, 1
	add r0, sp, 0x18
	lsls r1, r3, 16
	orrs r1, r2
	str r1, [r0, 0x4]
	ldr r1, _080C45F8 @ =gUnknown_83EF2BC
	str r1, [sp, 0x20]
	ldr r2, _080C45FC @ =0xffff0000
	add r5, sp, 0x20
	mov r8, r5
	ldr r1, [r5, 0x4]
	ands r1, r2
	orrs r1, r6
	str r1, [r5, 0x4]
	mov r1, sp
	movs r2, 0
	strh r3, [r1]
	strh r6, [r1, 0x2]
	ldr r1, _080C4600 @ =gUnknown_83F1C68
	str r1, [sp, 0x4]
	ldr r1, _080C4604 @ =gUnknown_83F1C94
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r1, _080C4608 @ =gDummySpriteAffineAnimTable
	str r1, [sp, 0x10]
	ldr r1, _080C460C @ =SpriteCallbackDummy
	str r1, [sp, 0x14]
	bl LoadSpriteSheet
	mov r0, r8
	bl LoadSpritePalette
	lsls r4, 19
	movs r0, 0x90
	lsls r0, 14
	adds r4, r0
	asrs r4, 16
	ldr r1, [sp, 0x28]
	lsls r5, r1, 19
	adds r5, r0
	asrs r5, 16
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r7]
	mov r5, r9
	lsls r5, 4
	mov r9, r5
	movs r1, 0xB6
	lsls r1, 2
	adds r2, r1
	add r2, r9
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080C4610 @ =gSprites
	adds r1, r0
	str r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r7]
	add r0, r9
	movs r2, 0xB5
	lsls r2, 2
	adds r0, r2
	mov r5, r10
	strb r5, [r0]
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C45F4: .4byte gUnknown_20399EC
_080C45F8: .4byte gUnknown_83EF2BC
_080C45FC: .4byte 0xffff0000
_080C4600: .4byte gUnknown_83F1C68
_080C4604: .4byte gUnknown_83F1C94
_080C4608: .4byte gDummySpriteAffineAnimTable
_080C460C: .4byte SpriteCallbackDummy
_080C4610: .4byte gSprites
	thumb_func_end sub_80C450C

	thumb_func_start sub_80C4614
sub_80C4614: @ 80C4614
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	ldr r4, [sp, 0x4C]
	ldr r5, [sp, 0x50]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x28]
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r7, 0
	ldr r0, _080C4730 @ =gUnknown_20399EC
	ldr r0, [r0]
	str r0, [sp, 0x18]
	movs r2, 0x40
	add r0, sp, 0x18
	lsls r1, r4, 16
	orrs r1, r2
	str r1, [r0, 0x4]
	ldr r1, _080C4734 @ =gUnknown_83EF2BC
	str r1, [sp, 0x20]
	ldr r2, _080C4738 @ =0xffff0000
	add r6, sp, 0x20
	ldr r1, [r6, 0x4]
	ands r1, r2
	orrs r1, r5
	str r1, [r6, 0x4]
	mov r1, sp
	strh r4, [r1]
	strh r5, [r1, 0x2]
	ldr r1, _080C473C @ =gUnknown_83F1C70
	str r1, [sp, 0x4]
	ldr r1, _080C4740 @ =gUnknown_83F1C98
	str r1, [sp, 0x8]
	str r7, [sp, 0xC]
	ldr r1, _080C4744 @ =gDummySpriteAffineAnimTable
	str r1, [sp, 0x10]
	ldr r1, _080C4748 @ =SpriteCallbackDummy
	str r1, [sp, 0x14]
	bl LoadSpriteSheet
	adds r0, r6, 0
	bl LoadSpritePalette
	mov r0, r9
	lsls r2, r0, 16
	asrs r2, 16
	mov r1, r8
	lsls r3, r1, 16
	asrs r3, 16
	mov r0, r10
	movs r1, 0
	bl sub_80C4164
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	adds r0, r4, 0
	bl sub_80C35DC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080C46BE
	adds r0, r4, 0
	bl sub_80C35DC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080C46C4
_080C46BE:
	cmp r5, 0x64
	beq _080C46C4
	movs r7, 0x2
_080C46C4:
	mov r3, r8
	lsls r1, r3, 3
	lsls r0, r7, 16
	asrs r0, 16
	adds r0, 0x24
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	mov r3, r9
	lsls r2, r3, 3
	adds r2, r0
	lsls r2, 16
	asrs r2, 16
	mov r0, sp
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080C4730 @ =gUnknown_20399EC
	ldr r2, [r4]
	ldr r1, [sp, 0x28]
	lsls r3, r1, 4
	movs r1, 0xA4
	lsls r1, 1
	adds r2, r1
	adds r2, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080C474C @ =gSprites
	adds r1, r0
	str r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r3
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r3
	mov r1, r10
	strb r1, [r0]
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4730: .4byte gUnknown_20399EC
_080C4734: .4byte gUnknown_83EF2BC
_080C4738: .4byte 0xffff0000
_080C473C: .4byte gUnknown_83F1C70
_080C4740: .4byte gUnknown_83F1C98
_080C4744: .4byte gDummySpriteAffineAnimTable
_080C4748: .4byte SpriteCallbackDummy
_080C474C: .4byte gSprites
	thumb_func_end sub_80C4614

	thumb_func_start sub_80C4750
sub_80C4750: @ 80C4750
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r7, 0
	movs r0, 0x3
	bl sub_80C0E04
	lsls r0, 24
	cmp r0, 0
	beq _080C47E0
	movs r1, 0
_080C476C:
	movs r5, 0
	lsls r0, r1, 24
	adds r1, 0x1
	mov r10, r1
	lsrs r0, 24
	str r0, [sp, 0x8]
_080C4778:
	movs r4, 0
	lsls r0, r5, 16
	mov r8, r0
	adds r1, r5, 0x1
	mov r9, r1
_080C4782:
	lsls r3, r4, 16
	asrs r3, 16
	ldr r0, [sp, 0x8]
	movs r1, 0
	mov r6, r8
	asrs r2, r6, 16
	bl sub_80C4164
	lsls r0, 24
	lsrs r0, 24
	bl sub_80C35DC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080C47C2
	adds r0, r7, 0
	adds r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x8]
	adds r1, r7, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_80C450C
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080C47C2:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x15
	bls _080C4782
	mov r1, r9
	lsls r0, r1, 16
	lsrs r5, r0, 16
	cmp r5, 0xE
	bls _080C4778
	mov r6, r10
	lsls r0, r6, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080C476C
_080C47E0:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C4750

	thumb_func_start sub_80C47F0
sub_80C47F0: @ 80C47F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r6, 0
	movs r1, 0
_080C4800:
	movs r7, 0
	lsls r0, r1, 24
	adds r1, 0x1
	str r1, [sp, 0x8]
	lsrs r0, 24
	mov r8, r0
_080C480C:
	movs r5, 0
	lsls r0, r7, 16
	mov r9, r0
	adds r1, r7, 0x1
	mov r10, r1
_080C4816:
	lsls r3, r5, 16
	asrs r3, 16
	mov r0, r8
	movs r1, 0x1
	mov r4, r9
	asrs r2, r4, 16
	bl sub_80C4164
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r0, 0xC5
	beq _080C4884
	cmp r0, 0x8D
	bne _080C4840
	ldr r0, _080C48B4 @ =0x00000844
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080C4884
_080C4840:
	adds r0, r6, 0
	adds r0, 0x23
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	mov r0, r8
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r7, 0
	bl sub_80C4614
	adds r0, r4, 0
	bl sub_80C3878
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080C487E
	ldr r0, _080C48B8 @ =gUnknown_20399EC
	ldr r0, [r0]
	lsls r1, r6, 4
	movs r2, 0xA4
	lsls r2, 1
	adds r0, r2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
_080C487E:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080C4884:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x15
	bls _080C4816
	mov r4, r10
	lsls r0, r4, 16
	lsrs r7, r0, 16
	cmp r7, 0xE
	bls _080C480C
	ldr r1, [sp, 0x8]
	lsls r0, r1, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080C4800
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C48B4: .4byte 0x00000844
_080C48B8: .4byte gUnknown_20399EC
	thumb_func_end sub_80C47F0

	thumb_func_start sub_80C48BC
sub_80C48BC: @ 80C48BC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	cmp r1, 0x19
	bne _080C4920
	movs r3, 0
	ldr r0, _080C491C @ =gUnknown_20399EC
	mov r12, r0
	movs r1, 0x1
	adds r0, r5, 0
	ands r0, r1
	lsls r5, r0, 2
	movs r6, 0x5
	negs r6, r6
_080C48E0:
	mov r7, r12
	ldr r1, [r7]
	lsls r2, r3, 4
	adds r0, r1, r2
	movs r7, 0xB5
	lsls r7, 2
	adds r0, r7
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C48F8
	cmp r4, 0xFF
	bne _080C490E
_080C48F8:
	movs r7, 0xB6
	lsls r7, 2
	adds r0, r1, r7
	adds r0, r2
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1]
_080C490E:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x18
	bls _080C48E0
	b _080C4954
	.align 2, 0
_080C491C: .4byte gUnknown_20399EC
_080C4920:
	ldr r0, _080C495C @ =gUnknown_20399EC
	ldr r2, [r0]
	lsls r1, 4
	adds r0, r2, r1
	movs r3, 0xB5
	lsls r3, 2
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _080C4954
	movs r7, 0xB6
	lsls r7, 2
	adds r0, r2, r7
	adds r0, r1
	ldr r2, [r0]
	adds r2, 0x3E
	movs r0, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_080C4954:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C495C: .4byte gUnknown_20399EC
	thumb_func_end sub_80C48BC

	thumb_func_start sub_80C4960
sub_80C4960: @ 80C4960
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	cmp r1, 0x19
	bne _080C49C4
	movs r3, 0
	ldr r0, _080C49C0 @ =gUnknown_20399EC
	mov r12, r0
	movs r1, 0x1
	adds r0, r5, 0
	ands r0, r1
	lsls r5, r0, 2
	movs r6, 0x5
	negs r6, r6
_080C4984:
	mov r7, r12
	ldr r1, [r7]
	lsls r2, r3, 4
	adds r0, r1, r2
	movs r7, 0xA2
	lsls r7, 1
	adds r0, r7
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C499C
	cmp r4, 0xFF
	bne _080C49B2
_080C499C:
	movs r7, 0xA4
	lsls r7, 1
	adds r0, r1, r7
	adds r0, r2
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1]
_080C49B2:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x18
	bls _080C4984
	b _080C49F8
	.align 2, 0
_080C49C0: .4byte gUnknown_20399EC
_080C49C4:
	ldr r0, _080C4A00 @ =gUnknown_20399EC
	ldr r2, [r0]
	lsls r1, 4
	adds r0, r2, r1
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C49F8
	movs r7, 0xA4
	lsls r7, 1
	adds r0, r2, r7
	adds r0, r1
	ldr r2, [r0]
	adds r2, 0x3E
	movs r0, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_080C49F8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4A00: .4byte gUnknown_20399EC
	thumb_func_end sub_80C4960

	thumb_func_start sub_80C4A04
sub_80C4A04: @ 80C4A04
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _080C4AA4 @ =gUnknown_20399EC
_080C4A0A:
	ldr r0, [r6]
	lsls r4, r5, 4
	movs r1, 0xB6
	lsls r1, 2
	adds r0, r1
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	beq _080C4A3E
	bl DestroySprite
	ldr r0, [r6]
	adds r0, r4
	movs r1, 0xB7
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r6]
	adds r0, r4
	ldr r1, _080C4AA8 @ =0x000002de
	adds r0, r1
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080C4A3E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x18
	bls _080C4A0A
	movs r5, 0
	ldr r6, _080C4AA4 @ =gUnknown_20399EC
_080C4A4C:
	ldr r0, [r6]
	lsls r4, r5, 4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	beq _080C4A82
	bl DestroySprite
	ldr r0, [r6]
	adds r0, r4
	movs r1, 0xA6
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r6]
	adds r0, r4
	movs r1, 0xA7
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080C4A82:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x18
	bls _080C4A4C
	ldr r4, _080C4AA4 @ =gUnknown_20399EC
	ldr r0, [r4]
	cmp r0, 0
	beq _080C4A9C
	bl Free
	movs r0, 0
	str r0, [r4]
_080C4A9C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4AA4: .4byte gUnknown_20399EC
_080C4AA8: .4byte 0x000002de
	thumb_func_end sub_80C4A04

	thumb_func_start sub_80C4AAC
sub_80C4AAC: @ 80C4AAC
	push {r4,lr}
	lsls r0, 24
	ldr r1, _080C4B24 @ =gUnknown_20399F0
	lsrs r0, 22
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	bne _080C4B28
	movs r0, 0x14
	bl AllocZeroed
	str r0, [r4]
	movs r0, 0x50
	bl GetGpuReg
	ldr r1, [r4]
	strh r0, [r1]
	movs r0, 0x54
	bl GetGpuReg
	ldr r1, [r4]
	strh r0, [r1, 0x2]
	movs r0, 0x52
	bl GetGpuReg
	ldr r1, [r4]
	strh r0, [r1, 0x4]
	movs r0, 0x48
	bl GetGpuReg
	ldr r1, [r4]
	strh r0, [r1, 0x6]
	movs r0, 0x4A
	bl GetGpuReg
	ldr r1, [r4]
	strh r0, [r1, 0x8]
	movs r0, 0x40
	bl GetGpuReg
	ldr r1, [r4]
	strh r0, [r1, 0xA]
	movs r0, 0x42
	bl GetGpuReg
	ldr r1, [r4]
	strh r0, [r1, 0xC]
	movs r0, 0x44
	bl GetGpuReg
	ldr r1, [r4]
	strh r0, [r1, 0xE]
	movs r0, 0x46
	bl GetGpuReg
	ldr r1, [r4]
	strh r0, [r1, 0x10]
	movs r0, 0x1
	b _080C4B2A
	.align 2, 0
_080C4B24: .4byte gUnknown_20399F0
_080C4B28:
	movs r0, 0
_080C4B2A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C4AAC

	thumb_func_start sub_80C4B30
sub_80C4B30: @ 80C4B30
	push {r4,lr}
	lsls r0, 24
	ldr r1, _080C4B44 @ =gUnknown_20399F0
	lsrs r0, 22
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	bne _080C4B48
	movs r0, 0
	b _080C4BB0
	.align 2, 0
_080C4B44: .4byte gUnknown_20399F0
_080C4B48:
	ldrh r1, [r0]
	movs r0, 0x50
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x2]
	movs r0, 0x54
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x4]
	movs r0, 0x52
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x6]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x8]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0xA]
	movs r0, 0x40
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0xC]
	movs r0, 0x42
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x10]
	movs r0, 0x46
	bl SetGpuReg
	ldr r0, [r4]
	cmp r0, 0
	beq _080C4BAE
	bl Free
	movs r0, 0
	str r0, [r4]
_080C4BAE:
	movs r0, 0x1
_080C4BB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C4B30

	thumb_func_start sub_80C4BB8
sub_80C4BB8: @ 80C4BB8
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _080C4BE0 @ =gUnknown_20399F0
_080C4BBE:
	lsls r0, r5, 2
	adds r4, r0, r6
	ldr r0, [r4]
	cmp r0, 0
	beq _080C4BD0
	bl Free
	movs r0, 0
	str r0, [r4]
_080C4BD0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080C4BBE
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4BE0: .4byte gUnknown_20399F0
	thumb_func_end sub_80C4BB8

	thumb_func_start sub_80C4BE4
sub_80C4BE4: @ 80C4BE4
	push {lr}
	sub sp, 0x8
	movs r0, 0
	movs r1, 0
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	bl sub_80C4C2C
	movs r0, 0
	bl sub_80C4C48
	movs r0, 0
	mov r1, sp
	bl sub_80C4CF0
	movs r0, 0x1
	mov r1, sp
	bl sub_80C4CF0
	movs r0, 0
	movs r1, 0
	bl sub_80C4C74
	movs r0, 0
	movs r1, 0x1
	bl sub_80C4C9C
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80C4C9C
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_80C4BE4

	thumb_func_start sub_80C4C2C
sub_80C4C2C: @ 80C4C2C
	push {lr}
	adds r3, r0, 0
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	orrs r3, r1
	orrs r3, r2
	lsrs r3, 16
	movs r0, 0x50
	adds r1, r3, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_80C4C2C

	thumb_func_start sub_80C4C48
sub_80C4C48: @ 80C4C48
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x54
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_80C4C48

	thumb_func_start sub_80C4C5C
sub_80C4C5C: @ 80C4C5C
	push {lr}
	adds r2, r0, 0
	lsls r1, 16
	lsls r2, 24
	orrs r2, r1
	lsrs r2, 16
	movs r0, 0x52
	adds r1, r2, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_80C4C5C

	thumb_func_start sub_80C4C74
sub_80C4C74: @ 80C4C74
	push {lr}
	lsls r0, 16
	lsls r1, 24
	orrs r1, r0
	lsrs r1, 16
	movs r0, 0x48
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_80C4C74

	thumb_func_start sub_80C4C88
sub_80C4C88: @ 80C4C88
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x4A
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_80C4C88

	thumb_func_start sub_80C4C9C
sub_80C4C9C: @ 80C4C9C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r1, _080C4CBC @ =gUnknown_83F1CA0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	cmp r4, 0
	beq _080C4CC0
	cmp r4, 0x1
	beq _080C4CDC
	b _080C4CE8
	.align 2, 0
_080C4CBC: .4byte gUnknown_83F1CA0
_080C4CC0:
	movs r0, 0
	bl GetGpuReg
	adds r1, r0, 0
	lsls r0, r5, 1
	add r0, sp
	ldrh r0, [r0]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
	b _080C4CE8
_080C4CDC:
	lsls r0, r5, 1
	add r0, sp
	ldrh r1, [r0]
	movs r0, 0
	bl ClearGpuRegBits
_080C4CE8:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C4C9C

	thumb_func_start sub_80C4CF0
sub_80C4CF0: @ 80C4CF0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	ldr r5, _080C4D2C @ =gUnknown_83F1CA4
	lsrs r4, 23
	adds r0, r4, r5
	ldrb r0, [r0]
	ldrh r1, [r6, 0x2]
	lsls r1, 8
	ldrh r2, [r6, 0x6]
	orrs r1, r2
	lsls r1, 16
	lsrs r1, 16
	bl SetGpuReg
	adds r5, 0x1
	adds r4, r5
	ldrb r0, [r4]
	ldrh r1, [r6]
	lsls r1, 8
	ldrh r2, [r6, 0x4]
	orrs r1, r2
	lsls r1, 16
	lsrs r1, 16
	bl SetGpuReg
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4D2C: .4byte gUnknown_83F1CA4
	thumb_func_end sub_80C4CF0

	thumb_func_start sub_80C4D30
sub_80C4D30: @ 80C4D30
	push {lr}
	bl sub_80C4BB8
	bl sub_80C4BE4
	pop {r0}
	bx r0
	thumb_func_end sub_80C4D30

	thumb_func_start sub_80C4D40
sub_80C4D40: @ 80C4D40
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080C4D68 @ =gUnknown_20399D4
	ldr r0, [r0]
	cmp r0, 0
	bne _080C4D70
	cmp r1, 0x5E
	bne _080C4D70
	ldr r0, _080C4D6C @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0xA
	bne _080C4D70
	ldrb r0, [r1, 0x5]
	cmp r0, 0x6
	bhi _080C4D70
	movs r0, 0x1
	b _080C4D72
	.align 2, 0
_080C4D68: .4byte gUnknown_20399D4
_080C4D6C: .4byte gSaveBlock1Ptr
_080C4D70:
	movs r0, 0
_080C4D72:
	pop {r1}
	bx r1
	thumb_func_end sub_80C4D40

	thumb_func_start GetMapName
GetMapName: @ 80C4D78
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	lsrs r0, r1, 16
	ldr r2, _080C4D9C @ =0xffa80000
	adds r1, r2
	lsrs r5, r1, 16
	cmp r5, 0x6C
	bhi _080C4DBC
	bl sub_80C4D40
	cmp r0, 0x1
	bne _080C4DA4
	ldr r1, _080C4DA0 @ =gMapSecName_CeladonDept
	b _080C4DAC
	.align 2, 0
_080C4D9C: .4byte 0xffa80000
_080C4DA0: .4byte gMapSecName_CeladonDept
_080C4DA4:
	ldr r0, _080C4DB8 @ =gUnknown_83F1CAC
	lsls r1, r5, 2
	adds r1, r0
	ldr r1, [r1]
_080C4DAC:
	adds r0, r6, 0
	bl StringCopy
	adds r1, r0, 0
	b _080C4DCE
	.align 2, 0
_080C4DB8: .4byte gUnknown_83F1CAC
_080C4DBC:
	cmp r4, 0
	bne _080C4DC2
	movs r4, 0x12
_080C4DC2:
	adds r0, r6, 0
	movs r1, 0
	adds r2, r4, 0
	bl StringFill
	b _080C4DF2
_080C4DCE:
	cmp r4, 0
	beq _080C4DF0
	subs r0, r1, r6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bcs _080C4DEC
	movs r2, 0
_080C4DDE:
	strb r2, [r1]
	adds r1, 0x1
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bcc _080C4DDE
_080C4DEC:
	movs r0, 0xFF
	strb r0, [r1]
_080C4DF0:
	adds r0, r1, 0
_080C4DF2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetMapName

	thumb_func_start GetMapNameGeneric
GetMapNameGeneric: @ 80C4DF8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0
	bl GetMapName
	pop {r1}
	bx r1
	thumb_func_end GetMapNameGeneric

	thumb_func_start sub_80C4E08
sub_80C4E08: @ 80C4E08
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl GetMapNameGeneric
	pop {r1}
	bx r1
	thumb_func_end sub_80C4E08

	thumb_func_start sub_80C4E18
sub_80C4E18: @ 80C4E18
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r0, _080C4E38 @ =gUnknown_20399D4
	ldr r0, [r0]
	ldr r1, _080C4E3C @ =0x00004799
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080C4E40
	movs r0, 0x3
	movs r1, 0
	bl FillWindowPixelBuffer
	b _080C4E48
	.align 2, 0
_080C4E38: .4byte gUnknown_20399D4
_080C4E3C: .4byte 0x00004799
_080C4E40:
	movs r0, 0x3
	movs r1, 0xFF
	bl FillWindowPixelBuffer
_080C4E48:
	ldr r0, _080C4E70 @ =gUnknown_83F1CA8
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AddTextPrinterParameterized3
	movs r0, 0x3
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4E70: .4byte gUnknown_83F1CA8
	thumb_func_end sub_80C4E18

	thumb_func_start sub_80C4E74
sub_80C4E74: @ 80C4E74
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r0, _080C4E94 @ =gUnknown_20399D4
	ldr r0, [r0]
	ldr r1, _080C4E98 @ =0x00004799
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080C4E9C
	movs r0, 0x4
	movs r1, 0
	bl FillWindowPixelBuffer
	b _080C4EA4
	.align 2, 0
_080C4E94: .4byte gUnknown_20399D4
_080C4E98: .4byte 0x00004799
_080C4E9C:
	movs r0, 0x4
	movs r1, 0xFF
	bl FillWindowPixelBuffer
_080C4EA4:
	ldr r0, _080C4ECC @ =gUnknown_83F1CA8
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x4
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AddTextPrinterParameterized3
	movs r0, 0x4
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4ECC: .4byte gUnknown_83F1CA8
	thumb_func_end sub_80C4E74

	thumb_func_start sub_80C4ED0
sub_80C4ED0: @ 80C4ED0
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _080C4EE6
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	b _080C4EF2
_080C4EE6:
	movs r0, 0x3
	bl ClearWindowTilemap
	movs r0, 0x4
	bl ClearWindowTilemap
_080C4EF2:
	pop {r0}
	bx r0
	thumb_func_end sub_80C4ED0

	thumb_func_start MCB2_FlyMap
MCB2_FlyMap: @ 80C4EF8
	push {lr}
	bl sub_80C51E8
	movs r0, 0x2
	bl sub_80BFEDC
	pop {r0}
	bx r0
	thumb_func_end MCB2_FlyMap

	thumb_func_start sub_80C4F08
sub_80C4F08: @ 80C4F08
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C4F28 @ =gUnknown_20399FC
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, 0x6
	bls _080C4F1C
	b _080C51B8
_080C4F1C:
	lsls r0, 2
	ldr r1, _080C4F2C @ =_080C4F30
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4F28: .4byte gUnknown_20399FC
_080C4F2C: .4byte _080C4F30
	.align 2, 0
_080C4F30:
	.4byte _080C4F4C
	.4byte _080C4F92
	.4byte _080C4FEC
	.4byte _080C5000
	.4byte _080C5028
	.4byte _080C5180
	.4byte _080C5196
_080C4F4C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl sub_80C0E20
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80C07E4
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C4398
	movs r0, 0
	movs r1, 0
	bl sub_80C3008
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80C41D8
	movs r0, 0
	bl sub_80C3154
	movs r0, 0
	bl sub_80C4324
	b _080C51A6
_080C4F92:
	movs r0, 0x2
	bl sub_80C0E04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C4FAE
	bl sub_80C07E4
	adds r1, r0, 0
	adds r0, r5, 0
	bl sub_80C2208
	b _080C51A6
_080C4FAE:
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	ldr r0, _080C4FE8 @ =gUnknown_8418EB5
	bl sub_80C4E18
	bl sub_80C0E20
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0
	bl sub_80C48BC
	bl sub_80C0E20
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0
	bl sub_80C4960
	b _080C51A6
	.align 2, 0
_080C4FE8: .4byte gUnknown_8418EB5
_080C4FEC:
	ldr r0, _080C4FFC @ =gUnknown_8418EB0
	bl sub_80C4E74
	movs r0, 0
	bl sub_80C4ED0
	b _080C51A6
	.align 2, 0
_080C4FFC: .4byte gUnknown_8418EB0
_080C5000:
	ldr r0, _080C5024 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080C500E
	b _080C51DC
_080C500E:
	bl sub_80C0B18
	movs r0, 0
	bl PutWindowTilemap
	bl sub_80C0BB0
	movs r0, 0x1
	bl PutWindowTilemap
	b _080C51A6
	.align 2, 0
_080C5024: .4byte gPaletteFade
_080C5028:
	bl sub_80C3400
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x5
	bls _080C5038
	b _080C51DC
_080C5038:
	lsls r0, 2
	ldr r1, _080C5044 @ =_080C5048
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C5044: .4byte _080C5048
	.align 2, 0
_080C5048:
	.4byte _080C51DC
	.4byte _080C51DC
	.4byte _080C5070
	.4byte _080C50F8
	.4byte _080C5168
	.4byte _080C5060
_080C5060:
	ldr r0, _080C506C @ =gUnknown_20399FC
	ldr r1, [r0]
	movs r0, 0x6
	strb r0, [r1]
	b _080C51DC
	.align 2, 0
_080C506C: .4byte gUnknown_20399FC
_080C5070:
	movs r0, 0
	bl sub_80C3AC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080C5086
	movs r0, 0x66
	bl PlaySE
	b _080C508A
_080C5086:
	bl sub_80C0450
_080C508A:
	bl sub_80C3178
	bl sub_80C0B18
	bl sub_80C0BB0
	bl sub_80C0B9C
	bl sub_80C3508
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x15
	bne _080C50C4
	bl sub_80C3514
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xD
	bne _080C50C4
	movs r0, 0xE1
	bl PlaySE
	ldr r0, _080C50C0 @ =gUnknown_8418E95
	bl sub_80C4E74
	b _080C51DC
	.align 2, 0
_080C50C0: .4byte gUnknown_8418E95
_080C50C4:
	movs r0, 0
	bl sub_80C3AC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080C50E0
	movs r0, 0
	bl sub_80C3AC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080C50EC
_080C50E0:
	ldr r0, _080C50E8 @ =gUnknown_8418EB0
	bl sub_80C4E74
	b _080C51DC
	.align 2, 0
_080C50E8: .4byte gUnknown_8418EB0
_080C50EC:
	ldr r0, _080C50F4 @ =gUnknown_8418E8B
	bl sub_80C4E74
	b _080C51DC
	.align 2, 0
_080C50F4: .4byte gUnknown_8418E8B
_080C50F8:
	movs r0, 0
	bl sub_80C3AC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080C5114
	movs r0, 0
	bl sub_80C3AC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080C51DC
_080C5114:
	movs r0, 0x3
	bl sub_80C0E04
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _080C51DC
	ldr r0, _080C514C @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	bl get_map_light_level_by_bank_and_number
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _080C5140
	cmp r0, 0x8
	bne _080C5154
_080C5140:
	ldr r2, _080C5150 @ =gUnknown_20399FC
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldr r1, [r2]
	b _080C51AA
	.align 2, 0
_080C514C: .4byte gSaveBlock1Ptr
_080C5150: .4byte gUnknown_20399FC
_080C5154:
	movs r0, 0x1
	bl PlaySE
	ldr r1, _080C5164 @ =gUnknown_20399FC
	ldr r0, [r1]
	strb r4, [r0, 0x2]
	ldr r1, [r1]
	b _080C51AA
	.align 2, 0
_080C5164: .4byte gUnknown_20399FC
_080C5168:
	bl sub_80C0E20
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C517C @ =sub_80C07F8
	adds r1, r5, 0
	bl sub_80C0E70
	b _080C51DC
	.align 2, 0
_080C517C: .4byte sub_80C07F8
_080C5180:
	movs r0, 0x2
	bl sub_80C0E04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C51A6
	adds r0, r5, 0
	bl sub_80C2C1C
	b _080C51A6
_080C5196:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080C51A6:
	ldr r0, _080C51B4 @ =gUnknown_20399FC
	ldr r1, [r0]
_080C51AA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080C51DC
	.align 2, 0
_080C51B4: .4byte gUnknown_20399FC
_080C51B8:
	ldr r0, _080C51E4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C51DC
	ldrb r0, [r2, 0x2]
	cmp r0, 0x1
	bne _080C51D6
	bl sub_80C3520
	lsls r0, 16
	lsrs r0, 16
	bl sub_80C527C
_080C51D6:
	adds r0, r5, 0
	bl sub_80C5208
_080C51DC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C51E4: .4byte gPaletteFade
	thumb_func_end sub_80C4F08

	thumb_func_start sub_80C51E8
sub_80C51E8: @ 80C51E8
	push {r4,lr}
	ldr r4, _080C5204 @ =gUnknown_20399FC
	movs r0, 0x4
	bl AllocZeroed
	str r0, [r4]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r4]
	strb r1, [r0, 0x1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5204: .4byte gUnknown_20399FC
	thumb_func_end sub_80C51E8

	thumb_func_start sub_80C5208
sub_80C5208: @ 80C5208
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	bl sub_80C0E04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C5220
	bl sub_80C25BC
_080C5220:
	bl sub_80C4A04
	bl sub_80C3188
	bl sub_80C4348
	bl sub_80C4D30
	bl sub_80C0898
	adds r0, r4, 0
	bl DestroyTask
	bl FreeAllWindowBuffers
	ldr r0, _080C5250 @ =gUnknown_20399FC
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	cmp r0, 0x1
	bne _080C5258
	ldr r0, _080C5254 @ =CB2_ReturnToField
	bl SetMainCallback2
	b _080C525E
	.align 2, 0
_080C5250: .4byte gUnknown_20399FC
_080C5254: .4byte CB2_ReturnToField
_080C5258:
	ldr r0, _080C5274 @ =CB2_ReturnToPartyMenuFromFlyMap
	bl SetMainCallback2
_080C525E:
	ldr r4, _080C5278 @ =gUnknown_20399FC
	ldr r0, [r4]
	cmp r0, 0
	beq _080C526E
	bl Free
	movs r0, 0
	str r0, [r4]
_080C526E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5274: .4byte CB2_ReturnToPartyMenuFromFlyMap
_080C5278: .4byte gUnknown_20399FC
	thumb_func_end sub_80C5208

	thumb_func_start sub_80C527C
sub_80C527C: @ 80C527C
	push {r4,r5,lr}
	lsls r0, 16
	ldr r1, _080C52A4 @ =0xffa80000
	adds r0, r1
	lsrs r0, 16
	ldr r5, _080C52A8 @ =gUnknown_83F2EE0
	lsls r1, r0, 1
	adds r4, r1, r0
	adds r0, r5, 0x2
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C52AC
	bl sub_805546C
	adds r0, r4, r5
	bl sub_8124C1C
	b _080C52C6
	.align 2, 0
_080C52A4: .4byte 0xffa80000
_080C52A8: .4byte gUnknown_83F2EE0
_080C52AC:
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r5, 0x1
	adds r1, r4, r1
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	bl warp1_set_2
_080C52C6:
	bl sub_80842C8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C527C

	thumb_func_start sub_80C52D0
sub_80C52D0: @ 80C52D0
	push {lr}
	ldr r2, _080C5318 @ =gUnknown_3005334
	ldr r1, [r0, 0x4]
	str r1, [r2]
	ldr r2, _080C531C @ =gUnknown_3005348
	ldrb r1, [r0, 0x1F]
	strb r1, [r2]
	ldr r2, _080C5320 @ =gUnknown_3005330
	ldrb r1, [r0, 0x19]
	strb r1, [r2]
	ldr r2, _080C5324 @ =gUnknown_3005344
	ldrb r1, [r0, 0x1A]
	strb r1, [r2]
	ldr r2, _080C5328 @ =gUnknown_3005340
	ldrb r1, [r0, 0x1B]
	strb r1, [r2]
	ldr r2, _080C532C @ =gUnknown_3005338
	ldrb r1, [r0, 0x1C]
	strb r1, [r2]
	ldr r2, _080C5330 @ =gUnknown_300534C
	ldrb r1, [r0, 0x1D]
	strb r1, [r2]
	ldr r2, _080C5334 @ =gUnknown_300533C
	ldrb r1, [r0, 0x1E]
	strb r1, [r2]
	ldrb r0, [r0]
	subs r0, 0x2
	cmp r0, 0x22
	bls _080C530C
	b _080C5458
_080C530C:
	lsls r0, 2
	ldr r1, _080C5338 @ =_080C533C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C5318: .4byte gUnknown_3005334
_080C531C: .4byte gUnknown_3005348
_080C5320: .4byte gUnknown_3005330
_080C5324: .4byte gUnknown_3005344
_080C5328: .4byte gUnknown_3005340
_080C532C: .4byte gUnknown_3005338
_080C5330: .4byte gUnknown_300534C
_080C5334: .4byte gUnknown_300533C
_080C5338: .4byte _080C533C
	.align 2, 0
_080C533C:
	.4byte _080C53C8
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5428
	.4byte _080C5458
	.4byte _080C53CE
	.4byte _080C53D4
	.4byte _080C53E8
	.4byte _080C53FA
	.4byte _080C5458
	.4byte _080C5410
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5416
	.4byte _080C53F4
	.4byte _080C541C
	.4byte _080C5422
	.4byte _080C5458
	.4byte _080C5458
	.4byte _080C5434
_080C53C8:
	bl sub_80C55D4
	b _080C5458
_080C53CE:
	bl sub_80C568C
	b _080C5458
_080C53D4:
	bl sub_80C5884
	ldr r0, _080C53E4 @ =gUnknown_3005348
	ldrb r0, [r0]
	bl sub_80C5748
	b _080C5458
	.align 2, 0
_080C53E4: .4byte gUnknown_3005348
_080C53E8:
	bl sub_80C5884
	bl sub_80C59D4
	bl sub_80C57EC
_080C53F4:
	bl sub_80C59D4
	b _080C5458
_080C53FA:
	bl sub_80C5884
	bl sub_80C5B9C
	bl sub_80C5B9C
	bl sub_80C5C44
	bl sub_80C57EC
	b _080C5458
_080C5410:
	bl sub_80C5A6C
	b _080C5458
_080C5416:
	bl sub_80C5884
	b _080C5458
_080C541C:
	bl sub_80C5B9C
	b _080C5458
_080C5422:
	bl sub_80C5C44
	b _080C5458
_080C5428:
	bl sub_80C55F4
	movs r0, 0x3
	bl sub_80C545C
	b _080C5458
_080C5434:
	bl sub_80C5884
	bl sub_80C5B9C
	bl sub_80C5C44
	bl sub_80C57EC
	bl sub_80C568C
	bl sub_80C568C
	movs r0, 0x2
	bl sub_80C545C
	movs r0, 0x4
	bl sub_80C5514
_080C5458:
	pop {r0}
	bx r0
	thumb_func_end sub_80C52D0

	thumb_func_start sub_80C545C
sub_80C545C: @ 80C545C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r2, 0
	ldr r0, _080C54FC @ =gUnknown_3005338
	mov r8, r0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C54EE
	ldr r1, _080C5500 @ =gUnknown_3005340
	mov r12, r1
	ldr r3, _080C5504 @ =gUnknown_300534C
	mov r10, r3
	ldr r0, _080C5508 @ =gUnknown_3005330
	mov r9, r0
_080C5482:
	ldr r1, _080C550C @ =gUnknown_3005344
	ldrb r0, [r1]
	adds r0, r2
	mov r3, r10
	ldrb r1, [r3]
	muls r0, r1
	lsls r0, 1
	ldr r3, _080C5510 @ =gUnknown_3005334
	ldr r1, [r3]
	adds r1, r0
	mov r3, r9
	ldrb r0, [r3]
	lsls r0, 1
	adds r3, r1, r0
	movs r4, 0
	adds r5, r2, 0x1
	mov r0, r12
	ldrb r0, [r0]
	cmp r4, r0
	bcs _080C54E2
	movs r6, 0x80
	lsls r6, 8
_080C54AE:
	ldrh r1, [r3]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _080C54D2
	movs r0, 0x1F
	ands r0, r1
	adds r0, r7
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _080C54C8
	movs r2, 0x1F
_080C54C8:
	lsls r0, r2, 10
	lsls r1, r2, 5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r3]
_080C54D2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r3, 0x2
	mov r1, r12
	ldrb r1, [r1]
	cmp r4, r1
	bcc _080C54AE
_080C54E2:
	lsls r0, r5, 24
	lsrs r2, r0, 24
	mov r3, r8
	ldrb r3, [r3]
	cmp r2, r3
	bcc _080C5482
_080C54EE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C54FC: .4byte gUnknown_3005338
_080C5500: .4byte gUnknown_3005340
_080C5504: .4byte gUnknown_300534C
_080C5508: .4byte gUnknown_3005330
_080C550C: .4byte gUnknown_3005344
_080C5510: .4byte gUnknown_3005334
	thumb_func_end sub_80C545C

	thumb_func_start sub_80C5514
sub_80C5514: @ 80C5514
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r2, 0
	ldr r0, _080C55BC @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C55AC
	ldr r1, _080C55C0 @ =gUnknown_3005340
	mov r10, r1
_080C5532:
	ldr r3, _080C55C4 @ =gUnknown_3005344
	ldrb r0, [r3]
	adds r0, r2
	ldr r3, _080C55C8 @ =gUnknown_300534C
	ldrb r1, [r3]
	muls r0, r1
	lsls r0, 1
	ldr r3, _080C55CC @ =gUnknown_3005334
	ldr r1, [r3]
	adds r1, r0
	ldr r3, _080C55D0 @ =gUnknown_3005330
	ldrb r0, [r3]
	lsls r0, 1
	adds r3, r1, r0
	movs r5, 0
	adds r7, r2, 0x1
	mov r0, r10
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080C55A0
	movs r1, 0x80
	lsls r1, 8
	mov r9, r1
	movs r0, 0x1F
	mov r12, r0
	mov r1, r8
	subs r6, r0, r1
_080C5568:
	ldrh r1, [r3]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080C5590
	movs r4, 0x1F
	mov r2, r12
	ands r2, r1
	cmp r2, r6
	ble _080C5586
	mov r1, r8
	lsrs r0, r1, 1
	subs r0, r4, r0
	lsls r0, 24
	lsrs r2, r0, 24
_080C5586:
	lsls r0, r2, 10
	lsls r1, r2, 5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r3]
_080C5590:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r3, 0x2
	mov r0, r10
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080C5568
_080C55A0:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r1, _080C55BC @ =gUnknown_3005338
	ldrb r1, [r1]
	cmp r2, r1
	bcc _080C5532
_080C55AC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C55BC: .4byte gUnknown_3005338
_080C55C0: .4byte gUnknown_3005340
_080C55C4: .4byte gUnknown_3005344
_080C55C8: .4byte gUnknown_300534C
_080C55CC: .4byte gUnknown_3005334
_080C55D0: .4byte gUnknown_3005330
	thumb_func_end sub_80C5514

	thumb_func_start sub_80C55D4
sub_80C55D4: @ 80C55D4
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080C55F0 @ =0x00000c7f
_080C55DA:
	lsls r0, r4, 16
	lsrs r0, 16
	bl sub_80C5CF8
	adds r4, 0x1
	cmp r4, r5
	bls _080C55DA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C55F0: .4byte 0x00000c7f
	thumb_func_end sub_80C55D4

	thumb_func_start sub_80C55F4
sub_80C55F4: @ 80C55F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080C5674 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C5666
	ldr r0, _080C5678 @ =gUnknown_3005334
	mov r8, r0
	ldr r3, _080C567C @ =gUnknown_3005340
_080C560C:
	ldr r0, _080C5680 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080C5684 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080C5688 @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080C565A
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080C5638:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080C564C
	adds r0, r4, 0
	str r3, [sp]
	bl sub_80C5ECC
	strh r0, [r4]
	ldr r3, [sp]
_080C564C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080C5638
_080C565A:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080C5674 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C560C
_080C5666:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5674: .4byte gUnknown_3005338
_080C5678: .4byte gUnknown_3005334
_080C567C: .4byte gUnknown_3005340
_080C5680: .4byte gUnknown_3005344
_080C5684: .4byte gUnknown_300534C
_080C5688: .4byte gUnknown_3005330
	thumb_func_end sub_80C55F4

	thumb_func_start sub_80C568C
sub_80C568C: @ 80C568C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r2, 0
	ldr r0, _080C5730 @ =gUnknown_3005340
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C5722
	ldr r0, _080C5734 @ =gUnknown_3005334
	mov r8, r0
	ldr r3, _080C5738 @ =gUnknown_300534C
_080C56A4:
	ldr r0, _080C573C @ =gUnknown_3005344
	ldrb r1, [r0]
	ldrb r0, [r3]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080C5740 @ =gUnknown_3005330
	ldrb r0, [r0]
	adds r0, r2
	lsls r0, 1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, 0x1
	ldrb r0, [r3]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080C5744 @ =gUnknown_3005338
	ldrb r0, [r0]
	subs r0, 0x1
	adds r7, r2, 0x1
	cmp r5, r0
	bge _080C5716
	ldr r6, _080C5738 @ =gUnknown_300534C
_080C56DA:
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080C5700
	ldrb r2, [r6]
	lsls r2, 1
	adds r2, r4, r2
	mov r0, sp
	adds r1, r4, 0
	str r3, [sp, 0x4]
	bl sub_80C61BC
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
	ldr r3, [sp, 0x4]
_080C5700:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080C5744 @ =gUnknown_3005338
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r5, r0
	blt _080C56DA
_080C5716:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080C5730 @ =gUnknown_3005340
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C56A4
_080C5722:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5730: .4byte gUnknown_3005340
_080C5734: .4byte gUnknown_3005334
_080C5738: .4byte gUnknown_300534C
_080C573C: .4byte gUnknown_3005344
_080C5740: .4byte gUnknown_3005330
_080C5744: .4byte gUnknown_3005338
	thumb_func_end sub_80C568C

	thumb_func_start sub_80C5748
sub_80C5748: @ 80C5748
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r2, 0
	ldr r0, _080C57D4 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C57C4
	ldr r0, _080C57D8 @ =gUnknown_3005334
	mov r9, r0
	ldr r3, _080C57DC @ =gUnknown_3005340
_080C5768:
	ldr r0, _080C57E0 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080C57E4 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r9
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080C57E8 @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080C57B8
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080C5794:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080C57AA
	adds r0, r4, 0
	mov r1, r8
	str r3, [sp]
	bl sub_80C5F00
	strh r0, [r4]
	ldr r3, [sp]
_080C57AA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080C5794
_080C57B8:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080C57D4 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C5768
_080C57C4:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C57D4: .4byte gUnknown_3005338
_080C57D8: .4byte gUnknown_3005334
_080C57DC: .4byte gUnknown_3005340
_080C57E0: .4byte gUnknown_3005344
_080C57E4: .4byte gUnknown_300534C
_080C57E8: .4byte gUnknown_3005330
	thumb_func_end sub_80C5748

	thumb_func_start sub_80C57EC
sub_80C57EC: @ 80C57EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080C586C @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C585E
	ldr r0, _080C5870 @ =gUnknown_3005334
	mov r8, r0
	ldr r3, _080C5874 @ =gUnknown_3005340
_080C5804:
	ldr r0, _080C5878 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080C587C @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080C5880 @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080C5852
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080C5830:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080C5844
	adds r0, r4, 0
	str r3, [sp]
	bl sub_80C600C
	strh r0, [r4]
	ldr r3, [sp]
_080C5844:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080C5830
_080C5852:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080C586C @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C5804
_080C585E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C586C: .4byte gUnknown_3005338
_080C5870: .4byte gUnknown_3005334
_080C5874: .4byte gUnknown_3005340
_080C5878: .4byte gUnknown_3005344
_080C587C: .4byte gUnknown_300534C
_080C5880: .4byte gUnknown_3005330
	thumb_func_end sub_80C57EC

	thumb_func_start sub_80C5884
sub_80C5884: @ 80C5884
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r7, 0
	ldr r0, _080C59BC @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r7, r0
	bcs _080C5910
	ldr r0, _080C59C0 @ =gUnknown_3005334
	mov r8, r0
_080C589A:
	ldr r0, _080C59C4 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r7
	ldr r0, _080C59C8 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r2, r8
	ldr r1, [r2]
	adds r1, r0
	ldr r0, _080C59CC @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r5, r1, r0
	adds r4, r5, 0x2
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80C603C
	strh r0, [r5]
	movs r6, 0x1
	adds r5, r4, 0
	ldr r0, _080C59D0 @ =gUnknown_3005340
	ldrb r0, [r0]
	subs r0, 0x1
	adds r7, 0x1
	cmp r6, r0
	bge _080C58FA
_080C58D2:
	adds r4, r5, 0x2
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80C603C
	strh r0, [r5]
	subs r1, r5, 0x2
	adds r0, r5, 0
	bl sub_80C603C
	strh r0, [r5]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r5, r4, 0
	ldr r0, _080C59D0 @ =gUnknown_3005340
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r6, r0
	blt _080C58D2
_080C58FA:
	subs r1, r5, 0x2
	adds r0, r5, 0
	bl sub_80C603C
	strh r0, [r5]
	lsls r0, r7, 24
	lsrs r7, r0, 24
	ldr r0, _080C59BC @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r7, r0
	bcc _080C589A
_080C5910:
	movs r6, 0
	ldr r0, _080C59D0 @ =gUnknown_3005340
	ldrb r0, [r0]
	cmp r6, r0
	bcs _080C59B0
	ldr r3, _080C59C0 @ =gUnknown_3005334
	mov r9, r3
	ldr r0, _080C59C8 @ =gUnknown_300534C
	mov r8, r0
_080C5922:
	ldr r0, _080C59C4 @ =gUnknown_3005344
	ldrb r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	muls r0, r1
	lsls r0, 1
	mov r3, r9
	ldr r2, [r3]
	adds r2, r0
	ldr r0, _080C59CC @ =gUnknown_3005330
	ldrb r0, [r0]
	adds r0, r6
	lsls r0, 1
	adds r5, r2, r0
	lsls r1, 1
	adds r1, r5, r1
	adds r0, r5, 0
	bl sub_80C603C
	strh r0, [r5]
	movs r7, 0x1
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, 1
	adds r5, r0
	ldr r0, _080C59BC @ =gUnknown_3005338
	ldrb r0, [r0]
	subs r0, 0x1
	adds r6, 0x1
	cmp r7, r0
	bge _080C5994
	ldr r4, _080C59C8 @ =gUnknown_300534C
_080C5962:
	ldrb r1, [r4]
	lsls r1, 1
	adds r1, r5, r1
	adds r0, r5, 0
	bl sub_80C603C
	strh r0, [r5]
	ldrb r1, [r4]
	lsls r1, 1
	subs r1, r5, r1
	adds r0, r5, 0
	bl sub_80C603C
	strh r0, [r5]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
	lsls r0, 1
	adds r5, r0
	ldr r0, _080C59BC @ =gUnknown_3005338
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r7, r0
	blt _080C5962
_080C5994:
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 1
	subs r1, r5, r1
	adds r0, r5, 0
	bl sub_80C603C
	strh r0, [r5]
	lsls r0, r6, 24
	lsrs r6, r0, 24
	ldr r0, _080C59D0 @ =gUnknown_3005340
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080C5922
_080C59B0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C59BC: .4byte gUnknown_3005338
_080C59C0: .4byte gUnknown_3005334
_080C59C4: .4byte gUnknown_3005344
_080C59C8: .4byte gUnknown_300534C
_080C59CC: .4byte gUnknown_3005330
_080C59D0: .4byte gUnknown_3005340
	thumb_func_end sub_80C5884

	thumb_func_start sub_80C59D4
sub_80C59D4: @ 80C59D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080C5A54 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C5A46
	ldr r0, _080C5A58 @ =gUnknown_3005334
	mov r8, r0
	ldr r3, _080C5A5C @ =gUnknown_3005340
_080C59EC:
	ldr r0, _080C5A60 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080C5A64 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080C5A68 @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080C5A3A
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080C5A18:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080C5A2C
	adds r0, r4, 0
	str r3, [sp]
	bl sub_80C606C
	strh r0, [r4]
	ldr r3, [sp]
_080C5A2C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080C5A18
_080C5A3A:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080C5A54 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C59EC
_080C5A46:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5A54: .4byte gUnknown_3005338
_080C5A58: .4byte gUnknown_3005334
_080C5A5C: .4byte gUnknown_3005340
_080C5A60: .4byte gUnknown_3005344
_080C5A64: .4byte gUnknown_300534C
_080C5A68: .4byte gUnknown_3005330
	thumb_func_end sub_80C59D4

	thumb_func_start sub_80C5A6C
sub_80C5A6C: @ 80C5A6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _080C5B98 @ =gUnknown_3005334
	ldr r4, [r0]
	movs r6, 0
	movs r0, 0x80
	lsls r0, 8
	adds r5, r0, 0
_080C5A84:
	movs r7, 0
_080C5A86:
	ldrh r0, [r4]
	ands r0, r5
	cmp r0, 0
	bne _080C5A96
	adds r0, r4, 0
	bl sub_80C606C
	strh r0, [r4]
_080C5A96:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, 0x2
	cmp r7, 0x3F
	bls _080C5A86
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3F
	bls _080C5A84
	movs r7, 0
	ldr r1, _080C5B98 @ =gUnknown_3005334
	mov r10, r1
	mov r3, sp
	movs r2, 0x80
	lsls r2, 8
	mov r9, r2
_080C5ABA:
	lsls r0, r7, 1
	mov r2, r10
	ldr r1, [r2]
	adds r4, r1, r0
	ldrh r1, [r4]
	strh r1, [r3]
	mov r1, r9
	strh r1, [r4]
	movs r6, 0x1
	adds r4, 0x80
	adds r5, r0, 0
_080C5AD0:
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	ands r0, r2
	cmp r0, 0
	bne _080C5AF0
	adds r2, r4, 0
	adds r2, 0x80
	mov r0, sp
	adds r1, r4, 0
	str r3, [sp, 0x4]
	bl sub_80C62DC
	strh r0, [r4]
	ldr r3, [sp, 0x4]
	strh r0, [r3]
_080C5AF0:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, 0x80
	cmp r6, 0x3E
	bls _080C5AD0
	mov r0, r9
	strh r0, [r4]
	mov r1, r10
	ldr r0, [r1]
	adds r4, r0, r5
	ldrh r0, [r4]
	strh r0, [r3]
	mov r2, r9
	strh r2, [r4]
	movs r6, 0x1
	adds r4, 0x80
	movs r0, 0x80
	lsls r0, 8
	mov r8, r0
_080C5B18:
	ldrh r0, [r4]
	mov r1, r8
	ands r0, r1
	adds r5, r4, 0
	adds r5, 0x80
	cmp r0, 0
	bne _080C5B38
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	str r3, [sp, 0x4]
	bl sub_80C62DC
	strh r0, [r4]
	ldr r3, [sp, 0x4]
	strh r0, [r3]
_080C5B38:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r5, 0
	cmp r6, 0x3E
	bls _080C5B18
	mov r2, r9
	strh r2, [r4]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3F
	bls _080C5ABA
	ldr r0, _080C5B98 @ =gUnknown_3005334
	ldr r4, [r0]
	movs r6, 0
	movs r0, 0x80
	lsls r0, 8
	mov r8, r0
_080C5B5E:
	movs r7, 0
	adds r5, r6, 0x1
_080C5B62:
	ldrh r0, [r4]
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _080C5B74
	adds r0, r4, 0
	bl sub_80C606C
	strh r0, [r4]
_080C5B74:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, 0x2
	cmp r7, 0x3F
	bls _080C5B62
	lsls r0, r5, 24
	lsrs r6, r0, 24
	cmp r6, 0x3F
	bls _080C5B5E
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5B98: .4byte gUnknown_3005334
	thumb_func_end sub_80C5A6C

	thumb_func_start sub_80C5B9C
sub_80C5B9C: @ 80C5B9C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080C5C2C @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C5C1E
	ldr r0, _080C5C30 @ =gUnknown_3005334
	mov r8, r0
_080C5BB2:
	ldr r0, _080C5C34 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080C5C38 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080C5C3C @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, 0x1
	adds r4, 0x2
	ldr r0, _080C5C40 @ =gUnknown_3005340
	ldrb r0, [r0]
	subs r0, 0x1
	adds r6, r2, 0x1
	cmp r5, r0
	bge _080C5C12
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080C5BEA:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080C5C00
	mov r0, sp
	adds r1, r4, 0
	bl sub_80C6098
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
_080C5C00:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080C5C40 @ =gUnknown_3005340
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r5, r0
	blt _080C5BEA
_080C5C12:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080C5C2C @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C5BB2
_080C5C1E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5C2C: .4byte gUnknown_3005338
_080C5C30: .4byte gUnknown_3005334
_080C5C34: .4byte gUnknown_3005344
_080C5C38: .4byte gUnknown_300534C
_080C5C3C: .4byte gUnknown_3005330
_080C5C40: .4byte gUnknown_3005340
	thumb_func_end sub_80C5B9C

	thumb_func_start sub_80C5C44
sub_80C5C44: @ 80C5C44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r2, 0
	ldr r0, _080C5CE0 @ =gUnknown_3005340
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C5CD2
	ldr r0, _080C5CE4 @ =gUnknown_3005334
	mov r8, r0
	ldr r7, _080C5CE8 @ =gUnknown_300534C
_080C5C5C:
	ldr r0, _080C5CEC @ =gUnknown_3005344
	ldrb r1, [r0]
	ldrb r0, [r7]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080C5CF0 @ =gUnknown_3005330
	ldrb r0, [r0]
	adds r0, r2
	lsls r0, 1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, 0x1
	ldrb r0, [r7]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080C5CF4 @ =gUnknown_3005338
	ldrb r0, [r0]
	subs r0, 0x1
	adds r6, r2, 0x1
	cmp r5, r0
	bge _080C5CC6
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080C5C96:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	bne _080C5CB0
	mov r0, sp
	adds r1, r4, 0
	str r2, [sp, 0x4]
	bl sub_80C6098
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
	ldr r2, [sp, 0x4]
_080C5CB0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r7]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080C5CF4 @ =gUnknown_3005338
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r5, r0
	blt _080C5C96
_080C5CC6:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080C5CE0 @ =gUnknown_3005340
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C5C5C
_080C5CD2:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5CE0: .4byte gUnknown_3005340
_080C5CE4: .4byte gUnknown_3005334
_080C5CE8: .4byte gUnknown_300534C
_080C5CEC: .4byte gUnknown_3005344
_080C5CF0: .4byte gUnknown_3005330
_080C5CF4: .4byte gUnknown_3005338
	thumb_func_end sub_80C5C44

	thumb_func_start sub_80C5CF8
sub_80C5CF8: @ 80C5CF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	mov r2, sp
	ldr r3, _080C5D64 @ =gUnknown_83F3024
	lsls r1, r0, 1
	add r1, r10
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r2, 0x1]
	mov r5, sp
	adds r0, r3, 0x2
	adds r1, r0
	ldrb r4, [r1]
	lsls r2, r4, 24
	lsrs r1, r2, 27
	movs r0, 0x7
	ands r1, r0
	strh r1, [r5, 0x2]
	lsrs r2, 25
	mov r9, r2
	movs r0, 0x3
	ands r2, r0
	mov r9, r2
	movs r5, 0x1
	ands r5, r4
	movs r4, 0x1
	mov r8, r4
	cmp r8, r1
	bcs _080C5DAA
	mov r3, sp
_080C5D4A:
	cmp r5, 0
	bne _080C5D68
	mov r0, r8
	lsls r2, r0, 2
	mov r4, sp
	adds r1, r4, r2
	ldrb r0, [r3]
	mov r4, r8
	subs r0, r4
	strb r0, [r1]
	ldrb r0, [r3, 0x1]
	add r0, r8
	b _080C5D7A
	.align 2, 0
_080C5D64: .4byte gUnknown_83F3024
_080C5D68:
	mov r0, r8
	lsls r2, r0, 2
	mov r4, sp
	adds r1, r4, r2
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r3, 0x1]
	subs r0, 0x1
_080C5D7A:
	strb r0, [r1, 0x1]
	add r2, sp
	ldrb r0, [r2]
	cmp r0, 0x3F
	bhi _080C5D8A
	ldrb r0, [r2, 0x1]
	cmp r0, 0x3F
	bls _080C5D92
_080C5D8A:
	mov r0, r8
	subs r0, 0x1
	strh r0, [r3, 0x2]
	b _080C5DAA
_080C5D92:
	ldrh r0, [r3, 0x2]
	mov r1, r8
	subs r0, r1
	strh r0, [r2, 0x2]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r0, [r3, 0x2]
	cmp r8, r0
	bcc _080C5D4A
_080C5DAA:
	movs r2, 0
	mov r8, r2
	mov r0, sp
	ldrh r0, [r0, 0x2]
	cmp r8, r0
	bcc _080C5DB8
	b _080C5EBA
_080C5DB8:
	movs r3, 0x1F
_080C5DBA:
	ldr r1, _080C5E18 @ =gUnknown_3005334
	mov r4, r8
	lsls r0, r4, 2
	mov r2, sp
	adds r6, r2, r0
	ldrb r0, [r6, 0x1]
	lsls r0, 7
	ldr r1, [r1]
	adds r1, r0
	ldrb r0, [r6]
	lsls r0, 1
	adds r2, r1, r0
	ldrh r1, [r2]
	movs r4, 0x80
	lsls r4, 8
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080C5EA6
	movs r7, 0x1F
	ands r7, r1
	lsls r0, r1, 16
	lsrs r5, r0, 21
	ands r5, r3
	lsrs r4, r0, 26
	ands r4, r3
	mov r0, r9
	cmp r0, 0
	blt _080C5E9C
	cmp r0, 0x1
	ble _080C5E1C
	cmp r0, 0x3
	bgt _080C5E9C
	ldrh r0, [r6, 0x2]
	adds r1, r7, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r1, r5, r0
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r7, 0x1F
	bls _080C5E90
	movs r7, 0x1F
	b _080C5E90
	.align 2, 0
_080C5E18: .4byte gUnknown_3005334
_080C5E1C:
	mov r1, r10
	lsls r0, r1, 1
	add r0, r10
	ldr r1, _080C5E50 @ =gUnknown_83F3024
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsrs r0, 3
	movs r1, 0x7
	ands r0, r1
	movs r1, 0x3
	str r2, [sp, 0x18]
	str r3, [sp, 0x1C]
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	cmp r0, 0x1
	beq _080C5E6C
	cmp r0, 0x1
	bgt _080C5E54
	cmp r0, 0
	beq _080C5E5A
	b _080C5E9C
	.align 2, 0
_080C5E50: .4byte gUnknown_83F3024
_080C5E54:
	cmp r0, 0x2
	beq _080C5E7E
	b _080C5E9C
_080C5E5A:
	ldrh r0, [r6, 0x2]
	cmp r7, r0
	bcc _080C5E68
	subs r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
	b _080C5E9C
_080C5E68:
	movs r7, 0
	b _080C5E9C
_080C5E6C:
	ldrh r0, [r6, 0x2]
	cmp r5, r0
	bcc _080C5E7A
	subs r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	b _080C5E9C
_080C5E7A:
	movs r5, 0
	b _080C5E9C
_080C5E7E:
	ldrh r0, [r6, 0x2]
	cmp r4, r0
	bcc _080C5E8C
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _080C5E9C
_080C5E8C:
	movs r4, 0
	b _080C5E9C
_080C5E90:
	cmp r5, 0x1F
	bls _080C5E96
	movs r5, 0x1F
_080C5E96:
	cmp r4, 0x1F
	bls _080C5E9C
	movs r4, 0x1F
_080C5E9C:
	lsls r0, r4, 10
	lsls r1, r5, 5
	orrs r0, r1
	orrs r7, r0
	strh r7, [r2]
_080C5EA6:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, sp
	ldrh r0, [r0, 0x2]
	cmp r8, r0
	bcs _080C5EBA
	b _080C5DBA
_080C5EBA:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C5CF8

	thumb_func_start sub_80C5ECC
sub_80C5ECC: @ 80C5ECC
	push {lr}
	ldrh r1, [r0]
	movs r3, 0x1F
	movs r0, 0x1F
	ands r0, r1
	lsls r1, 16
	lsrs r2, r1, 21
	ands r2, r3
	lsrs r1, 26
	ands r1, r3
	adds r0, r2
	adds r0, r1
	movs r1, 0x3
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r0, r1, 10
	lsls r2, r1, 5
	orrs r0, r2
	orrs r0, r1
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80C5ECC

	thumb_func_start sub_80C5F00
sub_80C5F00: @ 80C5F00
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldrh r0, [r0]
	movs r2, 0x1F
	movs r1, 0x1F
	ands r1, r0
	lsls r0, 16
	lsrs r3, r0, 21
	ands r3, r2
	lsrs r0, 26
	ands r0, r2
	cmp r1, 0x10
	bhi _080C5F30
	cmp r3, 0x10
	bhi _080C5F30
	cmp r0, 0x10
	bhi _080C5F30
	adds r0, r4, 0
	bl sub_80C5F3C
	lsls r0, 16
	lsrs r0, 16
	b _080C5F32
_080C5F30:
	ldr r0, _080C5F38 @ =0x00007fff
_080C5F32:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C5F38: .4byte 0x00007fff
	thumb_func_end sub_80C5F00

	thumb_func_start sub_80C5F3C
sub_80C5F3C: @ 80C5F3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	mov r8, r0
	movs r6, 0
	movs r7, 0
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _080C5FF4
	lsls r0, 2
	ldr r1, _080C5F80 @ =_080C5F84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C5F80: .4byte _080C5F84
	.align 2, 0
_080C5F84:
	.4byte _080C5F9C
	.4byte _080C5FAC
	.4byte _080C5FBC
	.4byte _080C5FCA
	.4byte _080C5FD8
	.4byte _080C5FE6
_080C5F9C:
	movs r0, 0x15
	subs r0, r5
	lsls r0, 16
	lsrs r6, r0, 16
	adds r7, r6, 0
	movs r1, 0
	mov r8, r1
	b _080C5FF4
_080C5FAC:
	movs r7, 0
	movs r0, 0x15
	subs r0, r5
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r6, r8
	b _080C5FF4
_080C5FBC:
	movs r0, 0x15
	subs r0, r5
	lsls r0, 16
	lsrs r7, r0, 16
	movs r6, 0
	mov r8, r7
	b _080C5FF4
_080C5FCA:
	movs r7, 0
	movs r6, 0
	movs r0, 0x17
	subs r0, r5
	lsls r0, 16
	lsrs r0, 16
	b _080C5FF2
_080C5FD8:
	movs r0, 0x17
	subs r0, r5
	lsls r0, 16
	lsrs r7, r0, 16
	movs r6, 0
	mov r8, r6
	b _080C5FF4
_080C5FE6:
	movs r7, 0
	movs r0, 0x17
	subs r0, r5
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0
_080C5FF2:
	mov r8, r0
_080C5FF4:
	lsls r0, r7, 10
	lsls r1, r6, 5
	orrs r0, r1
	mov r1, r8
	orrs r1, r0
	lsls r0, r1, 16
	lsrs r0, 16
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C5F3C

	thumb_func_start sub_80C600C
sub_80C600C: @ 80C600C
	push {lr}
	ldrh r0, [r0]
	movs r2, 0x1F
	movs r1, 0x1F
	ands r1, r0
	lsls r0, 16
	lsrs r3, r0, 21
	ands r3, r2
	lsrs r0, 26
	ands r0, r2
	cmp r1, 0x10
	bhi _080C6030
	cmp r3, 0x10
	bhi _080C6030
	cmp r0, 0x10
	bhi _080C6030
	movs r0, 0
	b _080C6032
_080C6030:
	ldr r0, _080C6038 @ =0x00007fff
_080C6032:
	pop {r1}
	bx r1
	.align 2, 0
_080C6038: .4byte 0x00007fff
	thumb_func_end sub_80C600C

	thumb_func_start sub_80C603C
sub_80C603C: @ 80C603C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r3, [r4]
	cmp r3, 0
	beq _080C6064
	movs r2, 0x80
	lsls r2, 8
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _080C6056
	adds r0, r2, 0
	b _080C6066
_080C6056:
	ldrh r1, [r1]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080C6064
	ldrh r0, [r4]
	b _080C6066
_080C6064:
	movs r0, 0
_080C6066:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C603C

	thumb_func_start sub_80C606C
sub_80C606C: @ 80C606C
	push {r4,lr}
	ldrh r1, [r0]
	movs r0, 0x1F
	movs r3, 0x1F
	ands r3, r1
	lsls r1, 16
	lsrs r2, r1, 21
	lsrs r1, 26
	subs r3, r0, r3
	adds r4, r0, 0
	bics r4, r2
	adds r2, r4, 0
	bics r0, r1
	lsls r0, 10
	lsls r2, 5
	orrs r0, r2
	orrs r0, r3
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C606C

	thumb_func_start sub_80C6098
sub_80C6098: @ 80C6098
	push {r4-r7,lr}
	sub sp, 0x14
	adds r7, r1, 0
	ldrh r4, [r0]
	ldrh r5, [r7]
	lsls r6, r4, 16
	lsls r0, r5, 16
	mov r12, r0
	cmp r4, r5
	beq _080C610A
	mov r2, sp
	movs r3, 0x1F
	movs r1, 0x1F
	adds r0, r1, 0
	ands r0, r4
	strh r0, [r2]
	lsrs r0, r6, 21
	ands r0, r3
	strh r0, [r2, 0x2]
	lsrs r0, r6, 26
	ands r0, r3
	strh r0, [r2, 0x4]
	mov r0, sp
	ands r1, r5
	strh r1, [r0, 0x6]
	mov r1, sp
	mov r2, r12
	lsrs r0, r2, 21
	ands r0, r3
	strh r0, [r1, 0x8]
	lsrs r0, r2, 26
	ands r0, r3
	strh r0, [r1, 0xA]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0x19
	bls _080C60F2
	mov r0, sp
	ldrh r0, [r0, 0x2]
	cmp r0, 0x19
	bls _080C60F2
	mov r0, sp
	ldrh r0, [r0, 0x4]
	cmp r0, 0x19
	bhi _080C610A
_080C60F2:
	mov r0, sp
	ldrh r0, [r0, 0x6]
	cmp r0, 0x19
	bls _080C610E
	mov r0, sp
	ldrh r0, [r0, 0x8]
	cmp r0, 0x19
	bls _080C610E
	mov r0, sp
	ldrh r0, [r0, 0xA]
	cmp r0, 0x19
	bls _080C610E
_080C610A:
	ldrh r0, [r7]
	b _080C61B4
_080C610E:
	movs r4, 0
	add r6, sp, 0xC
	mov r7, sp
	adds r7, 0x6
	adds r5, r6, 0
_080C6118:
	lsls r2, r4, 1
	mov r1, sp
	adds r0, r1, r2
	adds r1, r7, r2
	ldrh r3, [r0]
	ldrh r0, [r1]
	cmp r3, r0
	bls _080C612E
	adds r1, r5, r2
	subs r0, r3, r0
	b _080C6132
_080C612E:
	adds r1, r5, r2
	subs r0, r3
_080C6132:
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _080C6118
	adds r1, r6, 0
	ldrh r0, [r1, 0x2]
	ldrh r3, [r1]
	cmp r3, r0
	bcc _080C6158
	ldrh r2, [r1, 0x4]
	cmp r3, r2
	bcc _080C6152
	adds r2, r3, 0
	b _080C616C
_080C6152:
	cmp r0, r2
	bcs _080C615E
	b _080C6166
_080C6158:
	ldrh r2, [r1, 0x4]
	cmp r0, r2
	bcc _080C6162
_080C615E:
	ldrh r2, [r1, 0x2]
	b _080C616C
_080C6162:
	cmp r2, r3
	bcc _080C616A
_080C6166:
	ldrh r2, [r1, 0x4]
	b _080C616C
_080C616A:
	ldrh r2, [r6]
_080C616C:
	mov r0, sp
	ldrh r1, [r0, 0x6]
	lsrs r0, r2, 1
	movs r6, 0x1F
	subs r6, r0
	adds r0, r1, 0
	muls r0, r6
	movs r1, 0x1F
	bl __divsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, sp
	ldrh r0, [r0, 0x8]
	muls r0, r6
	movs r1, 0x1F
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	ldrh r0, [r0, 0xA]
	muls r0, r6
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 6
	lsls r4, 5
	orrs r0, r4
	orrs r5, r0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r5, 0
_080C61B4:
	add sp, 0x14
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C6098

	thumb_func_start sub_80C61BC
sub_80C61BC: @ 80C61BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r3, r0, 0
	mov r10, r1
	str r2, [sp]
	ldrh r1, [r3]
	mov r0, r10
	ldrh r0, [r0]
	cmp r1, r0
	bne _080C61E4
	ldrh r0, [r2]
	cmp r0, r1
	bne _080C61E4
	mov r1, r10
	ldrh r0, [r1]
	b _080C62CC
_080C61E4:
	mov r2, r10
	ldrh r0, [r2]
	movs r1, 0x1F
	mov r9, r1
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	lsls r0, 16
	lsrs r2, r0, 21
	mov r1, r9
	ands r1, r2
	mov r8, r1
	lsrs r0, 26
	mov r2, r9
	ands r2, r0
	str r2, [sp, 0x4]
	ldrh r2, [r3]
	adds r0, r4, 0
	ands r0, r2
	lsls r2, 16
	lsrs r1, r2, 21
	mov r3, r9
	ands r1, r3
	adds r0, r1
	lsrs r2, 26
	ands r2, r3
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	adds r0, r5, r1
	ldr r2, [sp, 0x4]
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, [sp]
	ldrh r1, [r3]
	ands r4, r1
	lsls r1, 16
	lsrs r0, r1, 21
	mov r2, r9
	ands r0, r2
	adds r4, r0
	lsrs r1, 26
	ands r1, r2
	adds r4, r1
	adds r0, r4, 0
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r7, r6
	bne _080C6266
	cmp r1, r6
	bne _080C6266
	mov r3, r10
	ldrh r0, [r3]
	b _080C62CC
_080C6266:
	cmp r7, r6
	bls _080C626E
	subs r0, r7, r6
	b _080C6270
_080C626E:
	subs r0, r6, r7
_080C6270:
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, r6
	bls _080C627C
	subs r0, r1, r6
	b _080C627E
_080C627C:
	subs r0, r6, r1
_080C627E:
	lsls r0, 16
	lsrs r0, 16
	cmp r2, r0
	bcc _080C6288
	adds r0, r2, 0
_080C6288:
	lsrs r0, 1
	movs r4, 0x1F
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0x4]
	adds r0, r1, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 6
	mov r2, r8
	lsls r1, r2, 5
	orrs r0, r1
	orrs r5, r0
	lsls r0, r5, 16
	lsrs r0, 16
_080C62CC:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C61BC

	thumb_func_start sub_80C62DC
sub_80C62DC: @ 80C62DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r3, r0, 0
	mov r10, r1
	str r2, [sp]
	ldrh r1, [r3]
	mov r0, r10
	ldrh r0, [r0]
	cmp r1, r0
	bne _080C6304
	ldrh r0, [r2]
	cmp r0, r1
	bne _080C6304
	mov r1, r10
	ldrh r0, [r1]
	b _080C63EA
_080C6304:
	mov r2, r10
	ldrh r0, [r2]
	movs r1, 0x1F
	mov r9, r1
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	lsls r0, 16
	lsrs r2, r0, 21
	mov r1, r9
	ands r1, r2
	mov r8, r1
	lsrs r0, 26
	mov r2, r9
	ands r2, r0
	str r2, [sp, 0x4]
	ldrh r2, [r3]
	adds r0, r4, 0
	ands r0, r2
	lsls r2, 16
	lsrs r1, r2, 21
	mov r3, r9
	ands r1, r3
	adds r0, r1
	lsrs r2, 26
	ands r2, r3
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	adds r0, r5, r1
	ldr r2, [sp, 0x4]
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, [sp]
	ldrh r1, [r3]
	ands r4, r1
	lsls r1, 16
	lsrs r0, r1, 21
	mov r2, r9
	ands r0, r2
	adds r4, r0
	lsrs r1, 26
	ands r1, r2
	adds r4, r1
	adds r0, r4, 0
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r7, r6
	bne _080C6386
	cmp r1, r6
	bne _080C6386
	mov r3, r10
	ldrh r0, [r3]
	b _080C63EA
_080C6386:
	cmp r7, r6
	bls _080C638E
	subs r0, r7, r6
	b _080C6390
_080C638E:
	subs r0, r6, r7
_080C6390:
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, r6
	bls _080C639C
	subs r0, r1, r6
	b _080C639E
_080C639C:
	subs r0, r6, r1
_080C639E:
	lsls r0, 16
	lsrs r0, 16
	cmp r2, r0
	bcc _080C63A8
	adds r0, r2, 0
_080C63A8:
	movs r4, 0x1F
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0x4]
	adds r0, r1, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 6
	mov r2, r8
	lsls r1, r2, 5
	orrs r0, r1
	orrs r5, r0
	lsls r0, r5, 16
	lsrs r0, 16
_080C63EA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C62DC

	thumb_func_start sub_80C63FC
sub_80C63FC: @ 80C63FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldrb r1, [r0, 0x1D]
	lsrs r5, r1, 3
	ldrb r1, [r0, 0x1E]
	lsrs r1, 3
	str r1, [sp, 0x8]
	ldr r1, [r0, 0x4]
	str r1, [sp]
	ldr r2, [r0, 0x10]
	str r2, [sp, 0x4]
	ldrh r0, [r0, 0x16]
	cmp r0, 0x2
	bne _080C64AC
	movs r1, 0
	ldr r0, [sp, 0x8]
	cmp r1, r0
	bcc _080C642A
	b _080C6538
_080C642A:
	movs r0, 0
	adds r2, r1, 0x1
	mov r10, r2
	cmp r0, r5
	bcs _080C649E
	adds r2, r1, 0
	muls r2, r5
	mov r9, r2
	lsls r1, 3
	mov r8, r1
_080C643E:
	movs r4, 0
	lsls r6, r0, 4
	adds r7, r0, 0x1
	add r0, r9
	lsls r0, 6
	ldr r1, [sp, 0x4]
	adds r1, r0
	mov r12, r1
_080C644E:
	lsls r0, r4, 3
	mov r2, r12
	adds r3, r2, r0
	mov r1, r8
	adds r0, r1, r4
	lsls r0, 3
	muls r0, r5
	lsls r0, 1
	ldr r2, [sp]
	adds r0, r2, r0
	adds r2, r0, r6
	ldrh r0, [r2, 0x2]
	lsls r0, 8
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r3]
	ldrh r0, [r2, 0x6]
	lsls r0, 8
	ldrh r1, [r2, 0x4]
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrh r0, [r2, 0xA]
	lsls r0, 8
	ldrh r1, [r2, 0x8]
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r2, 0xE]
	lsls r0, 8
	ldrh r1, [r2, 0xC]
	orrs r0, r1
	strh r0, [r3, 0x6]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x7
	bls _080C644E
	lsls r0, r7, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _080C643E
_080C649E:
	mov r1, r10
	lsls r0, r1, 16
	lsrs r1, r0, 16
	ldr r2, [sp, 0x8]
	cmp r1, r2
	bcc _080C642A
	b _080C6538
_080C64AC:
	movs r1, 0
	ldr r0, [sp, 0x8]
	cmp r1, r0
	bcs _080C6538
_080C64B4:
	movs r0, 0
	adds r2, r1, 0x1
	mov r10, r2
	cmp r0, r5
	bcs _080C652C
	adds r2, r1, 0
	muls r2, r5
	mov r9, r2
	lsls r1, 3
	mov r8, r1
_080C64C8:
	movs r4, 0
	lsls r6, r0, 4
	adds r7, r0, 0x1
	add r0, r9
	lsls r0, 5
	ldr r1, [sp, 0x4]
	adds r1, r0
	mov r12, r1
_080C64D8:
	lsls r0, r4, 2
	mov r2, r12
	adds r3, r2, r0
	mov r1, r8
	adds r0, r1, r4
	lsls r0, 3
	muls r0, r5
	lsls r0, 1
	ldr r2, [sp]
	adds r0, r2, r0
	adds r2, r0, r6
	ldrh r1, [r2, 0x2]
	lsls r1, 4
	ldrh r0, [r2]
	orrs r1, r0
	ldrh r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2, 0x6]
	lsls r0, 12
	orrs r1, r0
	strh r1, [r3]
	ldrh r1, [r2, 0xA]
	lsls r1, 4
	ldrh r0, [r2, 0x8]
	orrs r1, r0
	ldrh r0, [r2, 0xC]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2, 0xE]
	lsls r0, 12
	orrs r1, r0
	strh r1, [r3, 0x2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x7
	bls _080C64D8
	lsls r0, r7, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _080C64C8
_080C652C:
	mov r1, r10
	lsls r0, r1, 16
	lsrs r1, r0, 16
	ldr r2, [sp, 0x8]
	cmp r1, r2
	bcc _080C64B4
_080C6538:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C63FC

	thumb_func_start sub_80C6548
sub_80C6548: @ 80C6548
	push {lr}
	ldr r2, _080C6598 @ =gUnknown_3005354
	ldrb r1, [r0, 0x18]
	lsls r1, 4
	strh r1, [r2]
	ldr r3, _080C659C @ =gUnknown_3005350
	ldrh r2, [r2]
	lsls r2, 1
	ldr r1, [r0, 0x8]
	adds r1, r2
	str r1, [r3]
	ldr r2, _080C65A0 @ =gUnknown_3005334
	ldr r1, [r0, 0x4]
	str r1, [r2]
	ldr r2, _080C65A4 @ =gUnknown_3005330
	ldrb r1, [r0, 0x19]
	strb r1, [r2]
	ldr r2, _080C65A8 @ =gUnknown_3005344
	ldrb r1, [r0, 0x1A]
	strb r1, [r2]
	ldr r2, _080C65AC @ =gUnknown_3005340
	ldrb r1, [r0, 0x1B]
	strb r1, [r2]
	ldr r2, _080C65B0 @ =gUnknown_3005338
	ldrb r1, [r0, 0x1C]
	strb r1, [r2]
	ldr r2, _080C65B4 @ =gUnknown_300534C
	ldrb r1, [r0, 0x1D]
	strb r1, [r2]
	ldr r2, _080C65B8 @ =gUnknown_300533C
	ldrb r1, [r0, 0x1E]
	strb r1, [r2]
	ldrh r0, [r0, 0x14]
	cmp r0, 0x5
	bhi _080C660E
	lsls r0, 2
	ldr r1, _080C65BC @ =_080C65C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6598: .4byte gUnknown_3005354
_080C659C: .4byte gUnknown_3005350
_080C65A0: .4byte gUnknown_3005334
_080C65A4: .4byte gUnknown_3005330
_080C65A8: .4byte gUnknown_3005344
_080C65AC: .4byte gUnknown_3005340
_080C65B0: .4byte gUnknown_3005338
_080C65B4: .4byte gUnknown_300534C
_080C65B8: .4byte gUnknown_300533C
_080C65BC: .4byte _080C65C0
	.align 2, 0
_080C65C0:
	.4byte _080C65D8
	.4byte _080C65E0
	.4byte _080C65E8
	.4byte _080C65F2
	.4byte _080C65FC
	.4byte _080C6606
_080C65D8:
	movs r0, 0
	bl sub_80C6748
	b _080C660E
_080C65E0:
	movs r0, 0x1
	bl sub_80C6748
	b _080C660E
_080C65E8:
	bl sub_80C6614
	bl sub_80C6AB8
	b _080C660E
_080C65F2:
	bl sub_80C6714
	bl sub_80C6A08
	b _080C660E
_080C65FC:
	bl sub_80C66D8
	bl sub_80C6958
	b _080C660E
_080C6606:
	bl sub_80C66BC
	bl sub_80C68A0
_080C660E:
	pop {r0}
	bx r0
	thumb_func_end sub_80C6548

	thumb_func_start sub_80C6614
sub_80C6614: @ 80C6614
	ldr r2, _080C667C @ =gUnknown_3005350
	ldr r1, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r0, [r2]
	ldr r2, _080C6680 @ =0x000018c6
	adds r1, r2, 0
	strh r1, [r0, 0x2]
	ldr r2, _080C6684 @ =0x000077bd
	adds r1, r2, 0
	strh r1, [r0, 0x4]
	ldr r2, _080C6688 @ =0x00002d6b
	adds r1, r2, 0
	strh r1, [r0, 0x6]
	ldr r2, _080C668C @ =0x000018dd
	adds r1, r2, 0
	strh r1, [r0, 0x8]
	ldr r2, _080C6690 @ =0x00001ba6
	adds r1, r2, 0
	strh r1, [r0, 0xA]
	ldr r2, _080C6694 @ =0x000074c6
	adds r1, r2, 0
	strh r1, [r0, 0xC]
	ldr r2, _080C6698 @ =0x00001bbd
	adds r1, r2, 0
	strh r1, [r0, 0xE]
	ldr r2, _080C669C @ =0x000074dd
	adds r1, r2, 0
	strh r1, [r0, 0x10]
	ldr r2, _080C66A0 @ =0x000077a6
	adds r1, r2, 0
	strh r1, [r0, 0x12]
	ldr r2, _080C66A4 @ =0x0000197d
	adds r1, r2, 0
	strh r1, [r0, 0x14]
	ldr r2, _080C66A8 @ =0x00001bab
	adds r1, r2, 0
	strh r1, [r0, 0x16]
	ldr r2, _080C66AC @ =0x00007566
	adds r1, r2, 0
	strh r1, [r0, 0x18]
	ldr r2, _080C66B0 @ =0x00002cdd
	adds r1, r2, 0
	strh r1, [r0, 0x1A]
	ldr r2, _080C66B4 @ =0x00002fa6
	adds r1, r2, 0
	strh r1, [r0, 0x1C]
	ldr r2, _080C66B8 @ =0x000074cb
	adds r1, r2, 0
	strh r1, [r0, 0x1E]
	bx lr
	.align 2, 0
_080C667C: .4byte gUnknown_3005350
_080C6680: .4byte 0x000018c6
_080C6684: .4byte 0x000077bd
_080C6688: .4byte 0x00002d6b
_080C668C: .4byte 0x000018dd
_080C6690: .4byte 0x00001ba6
_080C6694: .4byte 0x000074c6
_080C6698: .4byte 0x00001bbd
_080C669C: .4byte 0x000074dd
_080C66A0: .4byte 0x000077a6
_080C66A4: .4byte 0x0000197d
_080C66A8: .4byte 0x00001bab
_080C66AC: .4byte 0x00007566
_080C66B0: .4byte 0x00002cdd
_080C66B4: .4byte 0x00002fa6
_080C66B8: .4byte 0x000074cb
	thumb_func_end sub_80C6614

	thumb_func_start sub_80C66BC
sub_80C66BC: @ 80C66BC
	ldr r2, _080C66D0 @ =gUnknown_3005350
	ldr r0, [r2]
	movs r1, 0
	strh r1, [r0]
	ldr r2, [r2]
	strh r1, [r2, 0x2]
	ldr r1, _080C66D4 @ =0x00007fff
	adds r0, r1, 0
	strh r0, [r2, 0x4]
	bx lr
	.align 2, 0
_080C66D0: .4byte gUnknown_3005350
_080C66D4: .4byte 0x00007fff
	thumb_func_end sub_80C66BC

	thumb_func_start sub_80C66D8
sub_80C66D8: @ 80C66D8
	push {r4,r5,lr}
	ldr r1, _080C6710 @ =gUnknown_3005350
	ldr r0, [r1]
	movs r2, 0
	strh r2, [r0]
	ldr r0, [r1]
	strh r2, [r0, 0x2]
	movs r4, 0
	adds r5, r1, 0
_080C66EA:
	ldr r0, [r5]
	lsls r2, r4, 1
	adds r2, r0
	adds r0, r4, 0x2
	lsls r3, r0, 1
	lsls r1, r0, 11
	lsls r0, 6
	orrs r1, r0
	orrs r1, r3
	strh r1, [r2, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xD
	bls _080C66EA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6710: .4byte gUnknown_3005350
	thumb_func_end sub_80C66D8

	thumb_func_start sub_80C6714
sub_80C6714: @ 80C6714
	push {r4,lr}
	ldr r2, _080C6744 @ =gUnknown_3005350
	ldr r1, [r2]
	movs r0, 0
	strh r0, [r1]
	movs r3, 0
	adds r4, r2, 0
_080C6722:
	ldr r0, [r4]
	lsls r2, r3, 1
	adds r2, r0
	lsls r0, r3, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r0, r3
	strh r0, [r2, 0x2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _080C6722
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6744: .4byte gUnknown_3005350
	thumb_func_end sub_80C6714

	thumb_func_start sub_80C6748
sub_80C6748: @ 80C6748
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	movs r1, 0xDF
	mov r9, r1
	cmp r0, 0
	bne _080C6760
	movs r2, 0xFF
	mov r9, r2
_080C6760:
	movs r6, 0
	ldr r3, _080C67E4 @ =gUnknown_3005350
	mov r12, r3
	mov r0, r9
	lsls r4, r0, 1
	ldr r5, _080C67E8 @ =gUnknown_3005338
	cmp r6, r9
	bcs _080C6784
	movs r2, 0
_080C6772:
	ldr r0, [r3]
	lsls r1, r6, 1
	adds r1, r0
	strh r2, [r1]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r9
	bcc _080C6772
_080C6784:
	mov r1, r12
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, _080C67EC @ =0x00003def
	adds r1, r2, 0
	strh r1, [r0]
	movs r3, 0
	ldrb r5, [r5]
	cmp r3, r5
	bcs _080C6888
_080C6798:
	ldr r2, _080C67F0 @ =gUnknown_3005334
	ldr r0, _080C67F4 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r3
	ldr r0, _080C67F8 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	ldr r1, [r2]
	adds r1, r0
	ldr r0, _080C67FC @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r6, 0
	ldr r0, _080C6800 @ =gUnknown_3005340
	adds r2, r0, 0
	adds r3, 0x1
	mov r10, r3
	ldrb r3, [r2]
	cmp r6, r3
	bcs _080C687A
	ldr r0, _080C6804 @ =gUnknown_3005354
	mov r8, r0
_080C67C8:
	ldrh r0, [r4]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080C6808
	mov r1, r8
	ldrh r0, [r1]
	strh r0, [r4]
	adds r6, 0x1
	adds r7, r4, 0x2
	b _080C686E
	.align 2, 0
_080C67E4: .4byte gUnknown_3005350
_080C67E8: .4byte gUnknown_3005338
_080C67EC: .4byte 0x00003def
_080C67F0: .4byte gUnknown_3005334
_080C67F4: .4byte gUnknown_3005344
_080C67F8: .4byte gUnknown_300534C
_080C67FC: .4byte gUnknown_3005330
_080C6800: .4byte gUnknown_3005340
_080C6804: .4byte gUnknown_3005354
_080C6808:
	adds r0, r4, 0
	bl sub_80C6B68
	lsls r0, 16
	lsrs r5, r0, 16
	movs r3, 0x1
	adds r6, 0x1
	adds r7, r4, 0x2
	cmp r3, r9
	bcs _080C6864
	ldr r0, _080C6834 @ =gUnknown_3005350
	ldr r2, [r0]
	ldrh r1, [r2, 0x2]
	mov r12, r0
	cmp r1, 0
	bne _080C6838
	strh r5, [r2, 0x2]
	mov r2, r8
	ldrh r0, [r2]
	adds r0, 0x1
	b _080C6862
	.align 2, 0
_080C6834: .4byte gUnknown_3005350
_080C6838:
	mov r2, r12
	ldr r1, [r2]
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _080C685C
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r9
	bcs _080C6864
	lsls r0, r3, 1
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	bne _080C6838
	strh r5, [r1]
_080C685C:
	mov r1, r8
	ldrh r0, [r1]
	adds r0, r3
_080C6862:
	strh r0, [r4]
_080C6864:
	ldr r2, _080C6898 @ =gUnknown_3005340
	cmp r3, r9
	bne _080C686E
	mov r3, r9
	strh r3, [r4]
_080C686E:
	lsls r0, r6, 24
	lsrs r6, r0, 24
	adds r4, r7, 0
	ldrb r0, [r2]
	cmp r6, r0
	bcc _080C67C8
_080C687A:
	mov r1, r10
	lsls r0, r1, 24
	lsrs r3, r0, 24
	ldr r0, _080C689C @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r3, r0
	bcc _080C6798
_080C6888:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6898: .4byte gUnknown_3005340
_080C689C: .4byte gUnknown_3005338
	thumb_func_end sub_80C6748

	thumb_func_start sub_80C68A0
sub_80C68A0: @ 80C68A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r2, 0
	ldr r0, _080C68F4 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C6944
	ldr r0, _080C68F8 @ =gUnknown_3005334
	mov r8, r0
_080C68B4:
	ldr r0, _080C68FC @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080C6900 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080C6904 @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r6, 0
	ldr r0, _080C6908 @ =gUnknown_3005340
	adds r3, r0, 0
	adds r7, r2, 0x1
	ldrb r0, [r3]
	cmp r6, r0
	bcs _080C6938
	ldr r5, _080C690C @ =gUnknown_3005354
_080C68E0:
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080C6910
	ldrh r0, [r5]
	strh r0, [r4]
	b _080C692A
	.align 2, 0
_080C68F4: .4byte gUnknown_3005338
_080C68F8: .4byte gUnknown_3005334
_080C68FC: .4byte gUnknown_3005344
_080C6900: .4byte gUnknown_300534C
_080C6904: .4byte gUnknown_3005330
_080C6908: .4byte gUnknown_3005340
_080C690C: .4byte gUnknown_3005354
_080C6910:
	adds r0, r4, 0
	bl sub_80C600C
	lsls r0, 16
	cmp r0, 0
	bne _080C6922
	ldrh r0, [r5]
	adds r0, 0x1
	b _080C6926
_080C6922:
	ldrh r0, [r5]
	adds r0, 0x2
_080C6926:
	strh r0, [r4]
	ldr r3, _080C6950 @ =gUnknown_3005340
_080C692A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r6, r0
	bcc _080C68E0
_080C6938:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080C6954 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C68B4
_080C6944:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6950: .4byte gUnknown_3005340
_080C6954: .4byte gUnknown_3005338
	thumb_func_end sub_80C68A0

	thumb_func_start sub_80C6958
sub_80C6958: @ 80C6958
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080C69AC @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C69F4
	ldr r0, _080C69B0 @ =gUnknown_3005334
	mov r8, r0
_080C696E:
	ldr r0, _080C69B4 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080C69B8 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080C69BC @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	ldr r0, _080C69C0 @ =gUnknown_3005340
	adds r7, r2, 0x1
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080C69E8
	ldr r6, _080C69C4 @ =gUnknown_3005354
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080C699E:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	beq _080C69C8
	ldrh r0, [r6]
	strh r0, [r4]
	b _080C69D8
	.align 2, 0
_080C69AC: .4byte gUnknown_3005338
_080C69B0: .4byte gUnknown_3005334
_080C69B4: .4byte gUnknown_3005344
_080C69B8: .4byte gUnknown_300534C
_080C69BC: .4byte gUnknown_3005330
_080C69C0: .4byte gUnknown_3005340
_080C69C4: .4byte gUnknown_3005354
_080C69C8:
	adds r0, r4, 0
	str r2, [sp]
	bl sub_80C6CAC
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_080C69D8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080C6A00 @ =gUnknown_3005340
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080C699E
_080C69E8:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080C6A04 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C696E
_080C69F4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6A00: .4byte gUnknown_3005340
_080C6A04: .4byte gUnknown_3005338
	thumb_func_end sub_80C6958

	thumb_func_start sub_80C6A08
sub_80C6A08: @ 80C6A08
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080C6A5C @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C6AA4
	ldr r0, _080C6A60 @ =gUnknown_3005334
	mov r8, r0
_080C6A1E:
	ldr r0, _080C6A64 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080C6A68 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080C6A6C @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	ldr r0, _080C6A70 @ =gUnknown_3005340
	adds r7, r2, 0x1
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080C6A98
	ldr r6, _080C6A74 @ =gUnknown_3005354
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080C6A4E:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	beq _080C6A78
	ldrh r0, [r6]
	strh r0, [r4]
	b _080C6A88
	.align 2, 0
_080C6A5C: .4byte gUnknown_3005338
_080C6A60: .4byte gUnknown_3005334
_080C6A64: .4byte gUnknown_3005344
_080C6A68: .4byte gUnknown_300534C
_080C6A6C: .4byte gUnknown_3005330
_080C6A70: .4byte gUnknown_3005340
_080C6A74: .4byte gUnknown_3005354
_080C6A78:
	adds r0, r4, 0
	str r2, [sp]
	bl sub_80C6CE0
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_080C6A88:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080C6AB0 @ =gUnknown_3005340
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080C6A4E
_080C6A98:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080C6AB4 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C6A1E
_080C6AA4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6AB0: .4byte gUnknown_3005340
_080C6AB4: .4byte gUnknown_3005338
	thumb_func_end sub_80C6A08

	thumb_func_start sub_80C6AB8
sub_80C6AB8: @ 80C6AB8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080C6B0C @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080C6B54
	ldr r0, _080C6B10 @ =gUnknown_3005334
	mov r8, r0
_080C6ACE:
	ldr r0, _080C6B14 @ =gUnknown_3005344
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080C6B18 @ =gUnknown_300534C
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080C6B1C @ =gUnknown_3005330
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	ldr r0, _080C6B20 @ =gUnknown_3005340
	adds r7, r2, 0x1
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080C6B48
	ldr r6, _080C6B24 @ =gUnknown_3005354
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080C6AFE:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	beq _080C6B28
	ldrh r0, [r6]
	strh r0, [r4]
	b _080C6B38
	.align 2, 0
_080C6B0C: .4byte gUnknown_3005338
_080C6B10: .4byte gUnknown_3005334
_080C6B14: .4byte gUnknown_3005344
_080C6B18: .4byte gUnknown_300534C
_080C6B1C: .4byte gUnknown_3005330
_080C6B20: .4byte gUnknown_3005340
_080C6B24: .4byte gUnknown_3005354
_080C6B28:
	adds r0, r4, 0
	str r2, [sp]
	bl sub_80C6BDC
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_080C6B38:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080C6B60 @ =gUnknown_3005340
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080C6AFE
_080C6B48:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080C6B64 @ =gUnknown_3005338
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080C6ACE
_080C6B54:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6B60: .4byte gUnknown_3005340
_080C6B64: .4byte gUnknown_3005338
	thumb_func_end sub_80C6AB8

	thumb_func_start sub_80C6B68
sub_80C6B68: @ 80C6B68
	push {r4,lr}
	ldrh r0, [r0]
	movs r1, 0x1F
	movs r4, 0x1F
	ands r4, r0
	lsls r0, 16
	lsrs r3, r0, 21
	ands r3, r1
	lsrs r2, r0, 26
	ands r2, r1
	movs r1, 0x3
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080C6B8C
	movs r0, 0x1C
	ands r0, r4
	adds r4, r0, 0x4
_080C6B8C:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080C6B9A
	movs r0, 0x1C
	ands r0, r3
	adds r3, r0, 0x4
_080C6B9A:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080C6BA8
	movs r0, 0x1C
	ands r0, r2
	adds r2, r0, 0x4
_080C6BA8:
	cmp r4, 0x5
	bhi _080C6BAE
	movs r4, 0x6
_080C6BAE:
	cmp r4, 0x1E
	bls _080C6BB4
	movs r4, 0x1E
_080C6BB4:
	cmp r3, 0x5
	bhi _080C6BBA
	movs r3, 0x6
_080C6BBA:
	cmp r3, 0x1E
	bls _080C6BC0
	movs r3, 0x1E
_080C6BC0:
	cmp r2, 0x5
	bhi _080C6BC6
	movs r2, 0x6
_080C6BC6:
	cmp r2, 0x1E
	bls _080C6BCC
	movs r2, 0x1E
_080C6BCC:
	lsls r0, r2, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r4, r0
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C6B68

	thumb_func_start sub_80C6BDC
sub_80C6BDC: @ 80C6BDC
	push {lr}
	ldrh r0, [r0]
	movs r1, 0x1F
	movs r3, 0x1F
	ands r3, r0
	lsls r0, 16
	lsrs r2, r0, 21
	ands r2, r1
	lsrs r0, 26
	ands r0, r1
	cmp r3, 0xB
	bhi _080C6C00
	cmp r2, 0xA
	bhi _080C6C00
	cmp r0, 0xA
	bhi _080C6C00
	movs r0, 0x1
	b _080C6CA6
_080C6C00:
	cmp r3, 0x13
	bls _080C6C24
	cmp r2, 0x13
	bls _080C6C0C
	cmp r0, 0x13
	bhi _080C6C30
_080C6C0C:
	cmp r3, 0x13
	bls _080C6C24
	cmp r2, 0x13
	bls _080C6C1A
	cmp r0, 0xE
	bhi _080C6C30
	b _080C6C68
_080C6C1A:
	cmp r0, 0x13
	bls _080C6C24
	cmp r2, 0xE
	bhi _080C6C30
	b _080C6C44
_080C6C24:
	cmp r2, 0x13
	bls _080C6C34
	cmp r0, 0x13
	bls _080C6C34
	cmp r3, 0xE
	bls _080C6C8C
_080C6C30:
	movs r0, 0x2
	b _080C6CA6
_080C6C34:
	cmp r3, 0x13
	bls _080C6C58
	cmp r2, 0xB
	bls _080C6C4C
	cmp r0, 0xB
	bls _080C6C48
	cmp r2, r0
	bcs _080C6C68
_080C6C44:
	movs r0, 0x8
	b _080C6CA6
_080C6C48:
	movs r0, 0xA
	b _080C6CA6
_080C6C4C:
	cmp r0, 0xB
	bls _080C6C54
	movs r0, 0xD
	b _080C6CA6
_080C6C54:
	movs r0, 0x4
	b _080C6CA6
_080C6C58:
	cmp r2, 0x13
	bls _080C6C7C
	cmp r3, 0xB
	bls _080C6C70
	cmp r0, 0xB
	bls _080C6C6C
	cmp r3, r0
	bcc _080C6C8C
_080C6C68:
	movs r0, 0x7
	b _080C6CA6
_080C6C6C:
	movs r0, 0xB
	b _080C6CA6
_080C6C70:
	cmp r0, 0xB
	bls _080C6C78
	movs r0, 0xE
	b _080C6CA6
_080C6C78:
	movs r0, 0x5
	b _080C6CA6
_080C6C7C:
	cmp r0, 0x13
	bls _080C6CA4
	cmp r3, 0xB
	bls _080C6C90
	cmp r2, 0xB
	bls _080C6C98
	cmp r3, r2
	bcs _080C6C44
_080C6C8C:
	movs r0, 0x9
	b _080C6CA6
_080C6C90:
	cmp r2, 0xB
	bls _080C6C98
	movs r0, 0xC
	b _080C6CA6
_080C6C98:
	cmp r0, 0xB
	bls _080C6CA0
	movs r0, 0xF
	b _080C6CA6
_080C6CA0:
	movs r0, 0x6
	b _080C6CA6
_080C6CA4:
	movs r0, 0x3
_080C6CA6:
	pop {r1}
	bx r1
	thumb_func_end sub_80C6BDC

	thumb_func_start sub_80C6CAC
sub_80C6CAC: @ 80C6CAC
	push {lr}
	ldrh r1, [r0]
	movs r3, 0x1F
	movs r0, 0x1F
	ands r0, r1
	lsls r1, 16
	lsrs r2, r1, 21
	ands r2, r3
	lsrs r1, 26
	ands r1, r3
	adds r0, r2
	adds r0, r1
	movs r1, 0x3
	bl __divsi3
	movs r1, 0x1E
	ands r0, r1
	lsls r0, 16
	cmp r0, 0
	beq _080C6CD8
	lsrs r0, 17
	b _080C6CDA
_080C6CD8:
	movs r0, 0x1
_080C6CDA:
	pop {r1}
	bx r1
	thumb_func_end sub_80C6CAC

	thumb_func_start sub_80C6CE0
sub_80C6CE0: @ 80C6CE0
	push {lr}
	ldrh r1, [r0]
	movs r3, 0x1F
	movs r0, 0x1F
	ands r0, r1
	lsls r1, 16
	lsrs r2, r1, 21
	ands r2, r3
	lsrs r1, 26
	ands r1, r3
	adds r0, r2
	adds r0, r1
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80C6CE0

	.align 2, 0 @ Don't pad with nop.
