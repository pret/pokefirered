	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	@ file boundary maybe

	thumb_func_start sub_8146288
sub_8146288: @ 8146288
	push {r4-r6,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _0814629E
	ldr r5, =gUnknown_203F3CC
	ldr r0, =0x000013a4
	bl AllocZeroed
	str r0, [r5]
	cmp r0, 0
	bne _081462AC
_0814629E:
	movs r0, 0
	b _081462DC
	.pool
_081462AC:
	movs r6, 0xDE
	lsls r6, 1
	adds r1, r4, 0
	adds r2, r6, 0
	bl memcpy
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	cmp r0, 0x7
	bls _081462C4
	movs r0, 0
	strb r0, [r1, 0x3]
_081462C4:
	ldr r2, [r5]
	adds r3, r2, r6
	ldrb r0, [r2, 0x3]
	lsls r0, 4
	ldr r1, =gUnknown_8468720
	adds r0, r1
	str r0, [r3]
	ldr r0, =0x000001c1
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0x1
_081462DC:
	pop {r4-r6}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8146288

	thumb_func_start sub_81462EC
sub_81462EC: @ 81462EC
	push {r4,lr}
	ldr r4, =gUnknown_203F3CC
	ldr r0, [r4]
	cmp r0, 0
	beq _08146308
	ldr r2, =0x000013a4
	movs r1, 0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_08146308:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_81462EC

	thumb_func_start sub_8146318
sub_8146318: @ 8146318
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r5, =gUnknown_203F3CC
	ldr r0, [r5]
	cmp r0, 0
	bne _08146338
	movs r0, 0x1
	negs r0, r0
	b _081465EE
	.pool
_08146338:
	movs r4, 0xE0
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	lsrs r0, 1
	cmp r0, 0x6
	bls _08146348
	b _081465B8
_08146348:
	lsls r0, 2
	ldr r1, =_08146358
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08146358:
	.4byte _08146374
	.4byte _08146386
	.4byte _081463EC
	.4byte _08146494
	.4byte _08146544
	.4byte _0814654A
	.4byte _0814655C
_08146374:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _081465D2
_08146386:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _08146392
	b _081465EC
_08146392:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	ldr r1, =0x00001a98
	movs r0, 0x44
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x1F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x1B
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	b _081465D2
	.pool
_081463EC:
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r5, =gUnknown_203F3CC
	ldr r0, [r5]
	movs r1, 0xDE
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0x8
	bl decompress_and_copy_tile_data_to_vram
	ldr r4, =gUnknown_8468040
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
	adds r4, 0x8
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	movs r3, 0xE5
	lsls r3, 1
	adds r1, r3
	strh r0, [r1]
	b _081465D2
	.pool
_08146494:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	beq _081464A2
	b _081465EC
_081464A2:
	ldr r2, =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, =gUnknown_203F3CC
	mov r8, r0
	ldr r0, [r0]
	movs r4, 0xDE
	lsls r4, 1
	adds r0, r4
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	mov r2, r8
	ldr r1, [r2]
	adds r4, r1, r4
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	movs r6, 0xE9
	lsls r6, 2
	adds r1, r6
	bl LZ77UnCompWram
	mov r3, r8
	ldr r1, [r3]
	adds r1, r6
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x3
	str r5, [sp, 0x4]
	str r7, [sp, 0x8]
	str r7, [sp, 0xC]
	str r4, [sp, 0x10]
	str r5, [sp, 0x14]
	movs r0, 0x1
	mov r10, r0
	str r0, [sp, 0x18]
	movs r2, 0x8
	mov r9, r2
	str r2, [sp, 0x1C]
	str r7, [sp, 0x20]
	movs r2, 0
	movs r3, 0
	bl CopyRectToBgTilemapBufferRect
	mov r3, r8
	ldr r1, [r3]
	adds r1, r6
	str r4, [sp]
	movs r0, 0x17
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	str r0, [sp, 0x14]
	mov r0, r10
	str r0, [sp, 0x18]
	mov r2, r9
	str r2, [sp, 0x1C]
	str r7, [sp, 0x20]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0x3
	bl CopyRectToBgTilemapBufferRect
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _081465D2
	.pool
_08146544:
	bl sub_8146980
	b _081465D2
_0814654A:
	bl sub_8146A30
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _081465D2
_0814655C:
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	ldr r2, =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r4, =gUnknown_203F3CC
	ldr r1, [r4]
	movs r3, 0xE5
	lsls r3, 2
	adds r0, r1, r3
	movs r2, 0xE3
	lsls r2, 1
	adds r1, r2
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	ldr r3, =0x000001c1
	adds r2, r1, r3
	movs r1, 0
	strb r0, [r2]
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _081465D2
	.pool
_081465B8:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081465EC
	ldr r0, [r5]
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x1
	b _081465EE
_081465D2:
	ldr r0, =gUnknown_203F3CC
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r2, r0
	ldrb r3, [r2]
	lsrs r1, r3, 1
	adds r1, 0x1
	lsls r1, 1
	movs r0, 0x1
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_081465EC:
	movs r0, 0
_081465EE:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8146318

	thumb_func_start sub_8146604
sub_8146604: @ 8146604
	push {r4,r5,lr}
	sub sp, 0x8
	adds r2, r0, 0
	ldr r5, =gUnknown_203F3CC
	ldr r0, [r5]
	cmp r0, 0
	bne _0814661C
	movs r0, 0x1
	negs r0, r0
	b _081467E0
	.pool
_0814661C:
	movs r4, 0xE0
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	lsrs r0, 1
	cmp r0, 0x6
	bls _0814662C
	b _081467AA
_0814662C:
	lsls r0, 2
	ldr r1, =_0814663C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0814663C:
	.4byte _08146658
	.4byte _0814666A
	.4byte _081466AC
	.4byte _0814670C
	.4byte _0814673C
	.4byte _08146778
	.4byte _08146788
_08146658:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _081467C4
_0814666A:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _08146676
	b _081467DE
_08146676:
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
	b _081467C4
_081466AC:
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x14
	str r5, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r5, 0x18
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _081467C4
_0814670C:
	movs r0, 0x1
	bl HideBg
	movs r0, 0x2
	bl HideBg
	ldr r4, =gUnknown_203F3CC
	ldr r0, [r4]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	movs r2, 0xE4
	lsls r2, 1
	adds r0, r2
	ldrb r0, [r0]
	bl RemoveWindow
	b _081467C4
	.pool
_0814673C:
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	ldr r4, =gUnknown_203F3CC
	ldr r0, [r4]
	ldr r2, =0x000001c1
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _081467C4
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r2, =0x000001c1
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	b _081467C4
	.pool
_08146778:
	ldr r0, =gUnknown_203F3B8
	ldrb r0, [r0]
	adds r1, r2, 0
	bl sub_8142344
	b _081467C4
	.pool
_08146788:
	bl sub_8142420
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _081467C4
_081467AA:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081467DE
	ldr r0, [r5]
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x1
	b _081467E0
_081467C4:
	ldr r0, =gUnknown_203F3CC
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r2, r0
	ldrb r3, [r2]
	lsrs r1, r3, 1
	adds r1, 0x1
	lsls r1, 1
	movs r0, 0x1
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_081467DE:
	movs r0, 0
_081467E0:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8146604

	thumb_func_start sub_81467EC
sub_81467EC: @ 81467EC
	push {r4,r5,lr}
	ldr r4, =gUnknown_203F3CC
	ldr r2, [r4]
	movs r5, 0xE0
	lsls r5, 1
	adds r0, r2, r5
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08146826
	ldr r0, =0x000001c1
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08146826
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r2, =0x000001c1
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
_08146826:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_81467EC

	thumb_func_start sub_8146834
sub_8146834: @ 8146834
	push {r4,lr}
	ldr r4, =gUnknown_203F3CC
	ldr r2, [r4]
	movs r1, 0xE0
	lsls r1, 1
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146874
	movs r3, 0xE5
	lsls r3, 2
	adds r0, r2, r3
	movs r3, 0xE3
	lsls r3, 1
	adds r1, r2, r3
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	ldr r2, =0x000001c1
	adds r1, r2
	strb r0, [r1]
	ldr r1, [r4]
	movs r3, 0xE0
	lsls r3, 1
	adds r1, r3
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_08146874:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8146834

	thumb_func_start sub_8146884
sub_8146884: @ 8146884
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r3, r4, 0
	ldr r2, =gUnknown_203F3CC
	ldr r0, [r2]
	mov r12, r0
	movs r0, 0xE1
	lsls r0, 1
	add r0, r12
	ldrb r1, [r0]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _081468B4
	bl sub_8146B58
_081468AA:
	movs r0, 0xFF
	b _0814697A
	.pool
_081468B4:
	cmp r4, 0x2
	beq _081468D0
	cmp r4, 0x2
	bgt _081468C2
	cmp r4, 0x1
	beq _081468CC
	b _081468AA
_081468C2:
	cmp r3, 0x40
	beq _081468D4
	cmp r3, 0x80
	beq _08146904
	b _081468AA
_081468CC:
	movs r0, 0
	b _0814697A
_081468D0:
	movs r0, 0x1
	b _0814697A
_081468D4:
	movs r0, 0xE3
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	cmp r0, 0
	beq _081468AA
	movs r0, 0xE0
	lsls r0, 1
	add r0, r12
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _081468AA
	ldr r2, =0x000001c3
	add r2, r12
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	b _08146932
	.pool
_08146904:
	movs r0, 0xE3
	lsls r0, 1
	add r0, r12
	movs r1, 0xE2
	lsls r1, 1
	add r1, r12
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _081468AA
	movs r0, 0xE0
	lsls r0, 1
	add r0, r12
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _081468AA
	ldr r2, =0x000001c3
	add r2, r12
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
_08146932:
	strb r0, [r2]
	ldr r2, [r6]
	movs r4, 0xE1
	lsls r4, 1
	adds r2, r4
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r3, [r6]
	adds r3, r4
	ldrb r1, [r3]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldr r1, [r6]
	adds r4, 0x1
	adds r1, r4
	ldrb r3, [r1]
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _08146978
	movs r0, 0x3
	b _0814697A
	.pool
_08146978:
	movs r0, 0x2
_0814697A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8146884

	thumb_func_start sub_8146980
sub_8146980: @ 8146980
	push {r4-r6,lr}
	movs r5, 0
	ldr r4, =gUnknown_203F3CC
	ldr r1, [r4]
	movs r2, 0xE7
	lsls r2, 1
	adds r0, r1, r2
	adds r1, 0x4
	movs r2, 0x28
	bl memcpy
	ldr r0, [r4]
	movs r3, 0xFB
	lsls r3, 1
	adds r1, r0, r3
	movs r0, 0xFF
	strb r0, [r1]
	adds r6, r4, 0
_081469A4:
	ldr r2, [r6]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r5
	adds r0, r4, r2
	ldr r3, =0x000001f7
	adds r0, r3
	adds r1, r2
	adds r1, 0x2C
	movs r2, 0x28
	bl memcpy
	ldr r0, [r6]
	ldr r1, =0x0000021f
	adds r0, r1
	adds r0, r4
	movs r1, 0xFF
	strb r1, [r0]
	cmp r5, 0x7
	bls _081469E8
	ldr r1, [r6]
	ldr r2, =0x000001f7
	adds r0, r1, r2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _081469E8
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081469E8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _081469A4
	ldr r2, =gUnknown_203F3CC
	ldr r1, [r2]
	movs r4, 0xE5
	lsls r4, 2
	adds r1, r4
	ldr r0, =gUnknown_8468050
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, [r2]
	movs r5, 0xE2
	lsls r5, 1
	adds r0, r2, r5
	ldrh r1, [r0]
	movs r3, 0xE7
	lsls r3, 2
	adds r0, r2, r3
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8146980

	thumb_func_start sub_8146A30
sub_8146A30: @ 8146A30
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	movs r5, 0
	ldr r6, =gUnknown_203F3CC
	ldr r0, [r6]
	movs r7, 0xE4
	lsls r7, 1
	adds r0, r7
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	movs r4, 0xE5
	lsls r4, 1
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, [r6]
	movs r0, 0xE7
	lsls r0, 1
	mov r8, r0
	add r4, r8
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x3
	adds r1, r4, 0
	bl GetStringWidth
	movs r1, 0xE0
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	cmp r1, 0
	bge _08146AA0
	movs r1, 0
_08146AA0:
	ldr r4, [r6]
	adds r0, r4, r7
	ldrb r0, [r0]
	lsls r2, r1, 24
	lsrs r2, 24
	movs r3, 0xDE
	lsls r3, 1
	adds r1, r4, r3
	ldr r1, [r1]
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	lsls r3, r1, 1
	adds r3, r1
	ldr r1, =gUnknown_8468038
	adds r3, r1
	str r3, [sp]
	str r5, [sp, 0x4]
	add r4, r8
	str r4, [sp, 0x8]
	movs r1, 0x3
	movs r3, 0x6
	bl box_print
_08146AD0:
	ldr r6, =gUnknown_203F3CC
	ldr r4, [r6]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r3, r5, 4
	adds r3, 0x2
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0xDE
	lsls r2, 1
	adds r1, r4, r2
	ldr r1, [r1]
	ldrb r1, [r1]
	lsrs r1, 4
	lsls r2, r1, 1
	adds r2, r1
	ldr r1, =gUnknown_8468038
	adds r2, r1
	str r2, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r5
	ldr r2, =0x000001f7
	adds r1, r2
	adds r4, r1
	str r4, [sp, 0x8]
	movs r1, 0x3
	movs r2, 0
	bl box_print
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _08146AD0
	ldr r0, [r6]
	movs r3, 0xE4
	lsls r3, 1
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, [r6]
	movs r1, 0xE5
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8146A30

	thumb_func_start sub_8146B58
sub_8146B58: @ 8146B58
	push {r4-r6,lr}
	ldr r0, =gUnknown_203F3CC
	ldr r1, [r0]
	movs r2, 0xE1
	lsls r2, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	lsrs r4, r0, 1
	lsls r4, 8
	ldr r6, =0x000001c3
	adds r0, r1, r6
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146B98
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x1
	bl ChangeBgY
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x1
	bl ChangeBgY
	b _08146BAC
	.pool
_08146B98:
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x2
	bl ChangeBgY
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x2
	bl ChangeBgY
_08146BAC:
	ldr r3, =gUnknown_203F3CC
	ldr r0, [r3]
	ldr r2, =0x000001c3
	adds r5, r0, r2
	ldrb r4, [r5]
	lsrs r1, r4, 1
	movs r6, 0xE1
	lsls r6, 1
	adds r0, r6
	ldrb r0, [r0]
	lsrs r0, 1
	adds r1, r0
	lsls r1, 1
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r5]
	ldr r1, [r3]
	adds r2, r1, r2
	ldrb r2, [r2]
	lsrs r0, r2, 1
	cmp r0, 0xF
	bls _08146C24
	adds r0, r6, 0
	ands r0, r2
	cmp r0, 0
	beq _08146BF8
	movs r0, 0xE3
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _08146C02
	.pool
_08146BF8:
	movs r2, 0xE3
	lsls r2, 1
	adds r1, r2
	ldrh r0, [r1]
	subs r0, 0x1
_08146C02:
	strh r0, [r1]
	ldr r0, [r3]
	movs r6, 0xE1
	lsls r6, 1
	adds r2, r0, r6
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r1, =0x000001c3
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	strb r0, [r2]
_08146C24:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8146B58

	.align 2, 0 @ Don't pad with nop.
