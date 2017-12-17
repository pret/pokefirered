	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BE46C
sub_80BE46C: @ 80BE46C
	ldr r1, _080BE474 @ =gUnknown_20399C0
	str r0, [r1]
	bx lr
	.align 2, 0
_080BE474: .4byte gUnknown_20399C0
	thumb_func_end sub_80BE46C

	thumb_func_start sub_80BE478
sub_80BE478: @ 80BE478
	push {lr}
	sub sp, 0x4
	ldr r0, _080BE4B0 @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl sub_8069788
	ldr r3, _080BE4B4 @ =gUnknown_20399C0
	ldr r2, [r3]
	ldr r1, [r0]
	str r1, [r2, 0x2C]
	ldr r0, [r0, 0x4]
	str r0, [r2, 0x30]
	ldr r0, _080BE4B8 @ =0x000010b4
	adds r2, r0
	movs r1, 0
	strb r1, [r2]
	mov r0, sp
	strh r1, [r0]
	ldr r1, [r3]
	adds r1, 0x34
	ldr r2, _080BE4BC @ =0x01000800
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080BE4B0: .4byte gUnknown_300500C
_080BE4B4: .4byte gUnknown_20399C0
_080BE4B8: .4byte 0x000010b4
_080BE4BC: .4byte 0x01000800
	thumb_func_end sub_80BE478

	thumb_func_start sub_80BE4C0
sub_80BE4C0: @ 80BE4C0
	push {r4-r7,lr}
	ldr r0, _080BE4E0 @ =gUnknown_20399C0
	ldr r1, [r0]
	ldr r2, _080BE4E4 @ =0x000010b4
	adds r0, r1, r2
	ldrb r2, [r0]
	lsls r0, r2, 8
	adds r0, 0x34
	adds r5, r1, r0
	cmp r2, 0xD
	beq _080BE590
	cmp r2, 0xD
	bgt _080BE4E8
	cmp r2, 0
	beq _080BE4EE
	b _080BE538
	.align 2, 0
_080BE4E0: .4byte gUnknown_20399C0
_080BE4E4: .4byte 0x000010b4
_080BE4E8:
	cmp r2, 0xE
	beq _080BE5DC
	b _080BE538
_080BE4EE:
	ldr r0, [r1, 0x2C]
	adds r1, r5, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r4, 0
	adds r7, r5, 0
	adds r7, 0xE0
_080BE4FE:
	ldr r6, _080BE530 @ =gUnknown_20399C0
	ldr r0, [r6]
	ldr r0, [r0, 0x2C]
	adds r0, 0x20
	adds r4, 0x1
	lsls r1, r4, 5
	adds r1, r5, r1
	movs r2, 0x8
	bl CpuFastSet
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x5
	bls _080BE4FE
	ldr r0, [r6]
	ldr r0, [r0, 0x2C]
	adds r0, 0x40
	adds r1, r7, 0
	movs r2, 0x8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r0, _080BE534 @ =0x000010b4
	adds r1, r0
	b _080BE57E
	.align 2, 0
_080BE530: .4byte gUnknown_20399C0
_080BE534: .4byte 0x000010b4
_080BE538:
	ldr r0, _080BE588 @ =gUnknown_20399C0
	ldr r0, [r0]
	ldr r0, [r0, 0x2C]
	adds r0, 0x60
	adds r1, r5, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r4, 0
	adds r7, r5, 0
	adds r7, 0xE0
_080BE54E:
	ldr r6, _080BE588 @ =gUnknown_20399C0
	ldr r0, [r6]
	ldr r0, [r0, 0x2C]
	adds r0, 0x80
	adds r4, 0x1
	lsls r1, r4, 5
	adds r1, r5, r1
	movs r2, 0x8
	bl CpuFastSet
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x5
	bls _080BE54E
	ldr r0, [r6]
	ldr r0, [r0, 0x2C]
	adds r0, 0xA0
	adds r1, r7, 0
	movs r2, 0x8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r2, _080BE58C @ =0x000010b4
	adds r1, r2
_080BE57E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080BE5E8
	.align 2, 0
_080BE588: .4byte gUnknown_20399C0
_080BE58C: .4byte 0x000010b4
_080BE590:
	ldr r0, [r1, 0x2C]
	adds r0, 0xC0
	adds r1, r5, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r4, 0
	adds r7, r5, 0
	adds r7, 0xE0
_080BE5A2:
	ldr r6, _080BE5E0 @ =gUnknown_20399C0
	ldr r0, [r6]
	ldr r0, [r0, 0x2C]
	adds r0, 0xE0
	adds r4, 0x1
	lsls r1, r4, 5
	adds r1, r5, r1
	movs r2, 0x8
	bl CpuFastSet
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x5
	bls _080BE5A2
	ldr r0, [r6]
	ldr r0, [r0, 0x2C]
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	adds r1, r7, 0
	movs r2, 0x8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r2, _080BE5E4 @ =0x000010b4
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080BE5DC:
	movs r0, 0
	b _080BE5EA
	.align 2, 0
_080BE5E0: .4byte gUnknown_20399C0
_080BE5E4: .4byte 0x000010b4
_080BE5E8:
	movs r0, 0x1
_080BE5EA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BE4C0

	thumb_func_start sub_80BE5F0
sub_80BE5F0: @ 80BE5F0
	push {lr}
	bl sub_80BE478
_080BE5F6:
	bl sub_80BE4C0
	lsls r0, 24
	cmp r0, 0
	bne _080BE5F6
	pop {r0}
	bx r0
	thumb_func_end sub_80BE5F0

	thumb_func_start sub_80BE604
sub_80BE604: @ 80BE604
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r2, _080BE654 @ =gUnknown_20399C0
	ldr r3, [r2]
	movs r1, 0
	strb r1, [r3, 0x5]
	ldr r1, [r2]
	strb r0, [r1, 0x4]
	movs r3, 0
	adds r7, r2, 0
	adds r4, r7, 0
	movs r2, 0x1
_080BE622:
	ldr r0, [r4]
	adds r1, r0, 0x6
	adds r1, r3
	ldrb r0, [r0, 0x4]
	asrs r0, r3
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080BE622
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, r6, 16
	asrs r1, 16
	ldr r3, [r7]
	ldrh r2, [r3]
	ldrh r3, [r3, 0x2]
	bl sub_80BE7CC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE654: .4byte gUnknown_20399C0
	thumb_func_end sub_80BE604

	thumb_func_start sub_80BE658
sub_80BE658: @ 80BE658
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080BE6EC @ =gUnknown_20399C0
_080BE65E:
	ldr r0, [r5]
	ldrh r0, [r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpriteTilesByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _080BE65E
	ldr r4, _080BE6EC @ =gUnknown_20399C0
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	movs r4, 0
_080BE690:
	ldr r0, _080BE6EC @ =gUnknown_20399C0
	ldr r0, [r0]
	lsls r1, r4, 2
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080BE6E6
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080BE690
	movs r4, 0
_080BE6B0:
	ldr r5, _080BE6EC @ =gUnknown_20399C0
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r0, 0x14
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080BE6E6
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080BE6B0
	ldr r0, [r5]
	ldr r0, [r0, 0x24]
	cmp r0, 0
	beq _080BE6DA
	bl DestroySprite
_080BE6DA:
	ldr r0, [r5]
	ldr r0, [r0, 0x28]
	cmp r0, 0
	beq _080BE6E6
	bl DestroySprite
_080BE6E6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BE6EC: .4byte gUnknown_20399C0
	thumb_func_end sub_80BE658

	thumb_func_start sub_80BE6F0
sub_80BE6F0: @ 80BE6F0
	push {r4,r5,lr}
	ldr r0, _080BE720 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _080BE728
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _080BE724 @ =gUnknown_20399C0
	ldr r1, [r2]
	ldrb r0, [r1, 0x5]
	subs r0, 0x1
	strb r0, [r1, 0x5]
	lsls r0, 24
	cmp r0, 0
	bge _080BE7B0
	ldr r1, [r2]
	movs r0, 0x5
	strb r0, [r1, 0x5]
	b _080BE7B0
	.align 2, 0
_080BE720: .4byte gUnknown_30030F0
_080BE724: .4byte gUnknown_20399C0
_080BE728:
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080BE758
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _080BE754 @ =gUnknown_20399C0
	ldr r1, [r2]
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x5
	ble _080BE7B0
	ldr r0, [r2]
	strb r5, [r0, 0x5]
	b _080BE7B0
	.align 2, 0
_080BE754: .4byte gUnknown_20399C0
_080BE758:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BE7B4
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _080BE788 @ =gUnknown_20399C0
	ldr r0, [r2]
	movs r1, 0x5
	ldrsb r1, [r0, r1]
	cmp r1, 0x4
	beq _080BE78C
	cmp r1, 0x5
	beq _080BE7C2
	adds r0, 0x6
	adds r1, r0, r1
	movs r2, 0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080BE7AE
	movs r2, 0x1
	b _080BE7AE
	.align 2, 0
_080BE788: .4byte gUnknown_20399C0
_080BE78C:
	strb r4, [r0, 0x4]
	movs r3, 0
	adds r4, r2, 0
_080BE792:
	ldr r2, [r4]
	adds r0, r2, 0x6
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, r3
	ldrb r1, [r2, 0x4]
	orrs r0, r1
	strb r0, [r2, 0x4]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080BE792
	b _080BE7C2
_080BE7AE:
	strb r2, [r1]
_080BE7B0:
	movs r0, 0x1
	b _080BE7C4
_080BE7B4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BE7B0
	movs r0, 0x5
	bl sub_80722CC
_080BE7C2:
	movs r0, 0
_080BE7C4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BE6F0

	thumb_func_start sub_80BE7CC
sub_80BE7CC: @ 80BE7CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x50
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r4, _080BE9C4 @ =gUnknown_20399C0
	ldr r0, [r4]
	adds r0, 0x34
	str r0, [sp, 0x18]
	add r1, sp, 0x1C
	movs r7, 0
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r1]
	mov r0, sp
	adds r0, 0x1E
	strh r5, [r0]
	add r1, sp, 0x20
	ldr r0, _080BE9C8 @ =gUnknown_8E9CBBC
	str r0, [sp, 0x20]
	movs r0, 0xC8
	lsls r0, 2
	strh r0, [r1, 0x4]
	adds r0, r5, 0x1
	strh r0, [r1, 0x6]
	add r0, sp, 0x28
	movs r1, 0
	movs r2, 0x8
	bl memset
	add r2, sp, 0x18
	mov r10, r2
	mov r0, sp
	mov r1, r10
	movs r2, 0x18
	bl memcpy
	ldr r0, [r4]
	ldr r0, [r0, 0x30]
	str r0, [sp, 0x30]
	add r0, sp, 0x34
	strh r6, [r0]
	add r1, sp, 0x38
	ldr r0, _080BE9CC @ =gUnknown_8E9CB9C
	str r0, [sp, 0x38]
	adds r0, r6, 0x1
	strh r0, [r1, 0x4]
	add r0, sp, 0x40
	movs r1, 0
	movs r2, 0x8
	bl memset
	add r4, sp, 0x30
	mov r0, r10
	adds r1, r4, 0
	movs r2, 0x18
	bl memcpy
	strh r5, [r4]
	strh r6, [r4, 0x2]
	ldr r0, _080BE9D0 @ =gUnknown_83EE830
	str r0, [r4, 0x4]
	ldr r0, _080BE9D4 @ =gUnknown_83EE8C8
	str r0, [r4, 0x8]
	str r7, [r4, 0xC]
	ldr r0, _080BE9D8 @ =gUnknown_8231CFC
	str r0, [r4, 0x10]
	ldr r0, _080BE9DC @ =nullsub_62
	str r0, [r4, 0x14]
	mov r0, sp
	bl LoadSpriteSheets
	mov r0, r10
	bl LoadSpritePalettes
	movs r5, 0
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	movs r0, 0x80
	lsls r0, 14
	add r0, r8
	mov r10, r0
	mov r1, r8
	str r1, [sp, 0x48]
	mov r2, r9
	lsls r2, 16
	mov r9, r2
	movs r7, 0x80
	lsls r7, 14
	add r7, r9
	mov r3, r9
	str r3, [sp, 0x4C]
_080BE8A4:
	adds r0, r4, 0
	mov r2, r10
	asrs r1, r2, 16
	asrs r2, r7, 16
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	bne _080BE8BC
	b _080BEA48
_080BE8BC:
	ldr r6, _080BE9C4 @ =gUnknown_20399C0
	ldr r2, [r6]
	lsls r0, r5, 2
	adds r2, 0xC
	adds r2, r0
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r1, _080BE9E0 @ =gUnknown_202063C
	adds r0, r1
	str r0, [r2]
	lsls r1, r5, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080BE8A4
	ldr r0, [r6]
	ldr r1, [r0, 0x10]
	ldr r3, [sp, 0x4C]
	asrs r0, r3, 16
	adds r0, 0x60
	strh r0, [r1, 0x22]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	ldr r0, _080BE9E4 @ =gUnknown_83EE890
	str r0, [r4, 0x8]
	ldr r0, _080BE9E8 @ =sub_80BEA8C
	str r0, [r4, 0x14]
	ldr r0, _080BE9EC @ =gUnknown_83EE838
	str r0, [r4, 0x4]
	movs r5, 0
	ldr r0, [sp, 0x48]
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	mov r9, r0
_080BE914:
	lsls r2, r5, 4
	adds r2, 0x10
	ldr r3, [sp, 0x4C]
	asrs r3, 16
	mov r8, r3
	add r2, r8
	lsls r2, 16
	asrs r2, 16
	adds r0, r4, 0
	mov r3, r9
	asrs r1, r3, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	bne _080BE93A
	b _080BEA58
_080BE93A:
	ldr r6, _080BE9C4 @ =gUnknown_20399C0
	ldr r1, [r6]
	lsls r0, r5, 2
	adds r1, 0x14
	adds r1, r0
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r7, _080BE9E0 @ =gUnknown_202063C
	adds r0, r7
	str r0, [r1]
	strh r5, [r0, 0x2E]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080BE914
	ldr r0, _080BE9F0 @ =nullsub_8
	str r0, [r4, 0x14]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080BE9F4
	ldr r0, [r6]
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r7
	str r1, [r0, 0x28]
	ldrb r3, [r1, 0x1]
	movs r2, 0x3F
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1, 0x1]
	ldr r0, [r6]
	ldr r1, [r0, 0x28]
	ldrb r0, [r1, 0x3]
	ands r2, r0
	movs r0, 0x80
	orrs r2, r0
	strb r2, [r1, 0x3]
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	movs r1, 0x9
	bl StartSpriteAnim
	ldr r1, [r6]
	ldr r2, [r1, 0x28]
	ldr r3, [sp, 0x48]
	asrs r0, r3, 16
	adds r0, 0x20
	strh r0, [r2, 0x20]
	ldr r2, [r1, 0x28]
	mov r0, r8
	adds r0, 0x50
	strh r0, [r2, 0x22]
	ldr r0, [r1, 0x28]
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0
	bl CalcCenterToCornerVec
	b _080BE9FA
	.align 2, 0
_080BE9C4: .4byte gUnknown_20399C0
_080BE9C8: .4byte gUnknown_8E9CBBC
_080BE9CC: .4byte gUnknown_8E9CB9C
_080BE9D0: .4byte gUnknown_83EE830
_080BE9D4: .4byte gUnknown_83EE8C8
_080BE9D8: .4byte gUnknown_8231CFC
_080BE9DC: .4byte nullsub_62
_080BE9E0: .4byte gUnknown_202063C
_080BE9E4: .4byte gUnknown_83EE890
_080BE9E8: .4byte sub_80BEA8C
_080BE9EC: .4byte gUnknown_83EE838
_080BE9F0: .4byte nullsub_8
_080BE9F4:
	ldr r1, [r6]
	movs r0, 0
	str r0, [r1, 0x28]
_080BE9FA:
	ldr r0, _080BEA3C @ =sub_80BEAC8
	str r0, [r4, 0x14]
	ldr r0, [sp, 0x48]
	movs r2, 0xC0
	lsls r2, 12
	adds r1, r0, r2
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080BEA6C
	ldr r0, _080BEA40 @ =gUnknown_20399C0
	ldr r2, [r0]
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	ldr r0, _080BEA44 @ =gUnknown_202063C
	adds r1, r0
	str r1, [r2, 0x24]
	ldr r3, [sp, 0x4C]
	asrs r0, r3, 16
	adds r0, 0x10
	strh r0, [r1, 0x2E]
	ldr r0, [r2, 0x24]
	movs r1, 0x8
	bl StartSpriteAnim
	b _080BEA74
	.align 2, 0
_080BEA3C: .4byte sub_80BEAC8
_080BEA40: .4byte gUnknown_20399C0
_080BEA44: .4byte gUnknown_202063C
_080BEA48:
	ldr r0, _080BEA54 @ =gUnknown_20399C0
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, 0xC
	b _080BEA60
	.align 2, 0
_080BEA54: .4byte gUnknown_20399C0
_080BEA58:
	ldr r0, _080BEA68 @ =gUnknown_20399C0
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, 0x14
_080BEA60:
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	b _080BEA74
	.align 2, 0
_080BEA68: .4byte gUnknown_20399C0
_080BEA6C:
	ldr r0, _080BEA84 @ =gUnknown_20399C0
	ldr r1, [r0]
	movs r0, 0
	str r0, [r1, 0x24]
_080BEA74:
	add sp, 0x50
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BEA84: .4byte gUnknown_20399C0
	thumb_func_end sub_80BE7CC

	thumb_func_start nullsub_62
nullsub_62: @ 80BEA88
	bx lr
	thumb_func_end nullsub_62

	thumb_func_start sub_80BEA8C
sub_80BEA8C: @ 80BEA8C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080BEAB4 @ =gUnknown_20399C0
	ldr r0, [r0]
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	adds r0, 0x6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BEAB8
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	b _080BEAC2
	.align 2, 0
_080BEAB4: .4byte gUnknown_20399C0
_080BEAB8:
	lsls r1, 25
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
_080BEAC2:
	pop {r0}
	bx r0
	thumb_func_end sub_80BEA8C

	thumb_func_start sub_80BEAC8
sub_80BEAC8: @ 80BEAC8
	ldr r1, _080BEADC @ =gUnknown_20399C0
	ldr r1, [r1]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 4
	ldrh r2, [r0, 0x2E]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080BEADC: .4byte gUnknown_20399C0
	thumb_func_end sub_80BEAC8

	thumb_func_start sub_80BEAE0
sub_80BEAE0: @ 80BEAE0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r2, 0
	bne _080BEAF0
	ldr r2, _080BEAFC @ =gUnknown_83EE008
_080BEAF0:
	movs r3, 0x10
	bl sub_80BEB20
	pop {r1}
	bx r1
	.align 2, 0
_080BEAFC: .4byte gUnknown_83EE008
	thumb_func_end sub_80BEAE0

	thumb_func_start sub_80BEB00
sub_80BEB00: @ 80BEB00
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r2, 0
	bne _080BEB10
	ldr r2, _080BEB1C @ =gUnknown_83EE008
_080BEB10:
	movs r3, 0x1
	bl sub_80BEB20
	pop {r1}
	bx r1
	.align 2, 0
_080BEB1C: .4byte gUnknown_83EE008
	thumb_func_end sub_80BEB00

	thumb_func_start sub_80BEB20
sub_80BEB20: @ 80BEB20
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x28
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _080BEB9C @ =gUnknown_83EE028
	str r4, [sp, 0x18]
	movs r4, 0x80
	add r5, sp, 0x18
	lsrs r6, r0, 16
	orrs r0, r4
	str r0, [r5, 0x4]
	str r2, [sp, 0x20]
	ldr r0, _080BEBA0 @ =0xffff0000
	mov r8, r0
	add r4, sp, 0x20
	ldr r0, [r4, 0x4]
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	mov r0, sp
	movs r2, 0
	strh r6, [r0]
	strh r1, [r0, 0x2]
	ldr r0, _080BEBA4 @ =gUnknown_83EE8D0
	str r0, [sp, 0x4]
	ldr r0, _080BEBA8 @ =gUnknown_83EE958
	str r0, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r0, _080BEBAC @ =gUnknown_8231CFC
	str r0, [sp, 0x10]
	ldr r0, _080BEBB0 @ =nullsub_62
	str r0, [sp, 0x14]
	lsls r3, 23
	lsrs r3, 16
	ldr r0, [r5, 0x4]
	mov r1, r8
	ands r0, r1
	orrs r0, r3
	str r0, [r5, 0x4]
	adds r0, r5, 0
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080BEBB4
	movs r0, 0
	b _080BEBBE
	.align 2, 0
_080BEB9C: .4byte gUnknown_83EE028
_080BEBA0: .4byte 0xffff0000
_080BEBA4: .4byte gUnknown_83EE8D0
_080BEBA8: .4byte gUnknown_83EE958
_080BEBAC: .4byte gUnknown_8231CFC
_080BEBB0: .4byte nullsub_62
_080BEBB4:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BEBCC @ =gUnknown_202063C
	adds r0, r1
_080BEBBE:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BEBCC: .4byte gUnknown_202063C
	thumb_func_end sub_80BEB20

	thumb_func_start sub_80BEBD0
sub_80BEBD0: @ 80BEBD0
	push {lr}
	lsls r0, 24
	lsrs r0, 17
	ldr r2, _080BEBE8 @ =gUnknown_83EE028
	adds r0, r2
	movs r2, 0x80
	movs r3, 0x1
	bl RequestDma3Copy
	pop {r0}
	bx r0
	.align 2, 0
_080BEBE8: .4byte gUnknown_83EE028
	thumb_func_end sub_80BEBD0

	.align 2, 0 @ Don't pad with nop.
