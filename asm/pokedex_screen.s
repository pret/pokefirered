	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8104F0C
sub_8104F0C: @ 8104F0C
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x1E
	str r0, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r5, 0x20
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
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
	ldr r5, _08104F80 @ =gUnknown_203ACF0
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r0, [r0]
	adds r1, 0x2B
	ldrb r1, [r1]
	bl sub_81068DC
	movs r0, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	cmp r6, 0
	beq _08104F88
	ldr r1, _08104F84 @ =gUnknown_8452344
	ldr r0, [r5]
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl sub_8106E78
	b _08104FD0
	.align 2, 0
_08104F80: .4byte gUnknown_203ACF0
_08104F84: .4byte gUnknown_8452344
_08104F88:
	ldr r1, _08105048 @ =gUnknown_8452344
	ldr r0, [r5]
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl sub_8106E78
	ldr r0, [r5]
	adds r0, 0x2B
	ldrb r0, [r0]
	bl sub_8106AF8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, [r5]
	adds r0, 0x2A
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	bl sub_8106AF8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	adds r1, r4, 0
	movs r3, 0xA0
	bl sub_8104EC0
_08104FD0:
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	cmp r6, 0
	bne _08104FEA
	ldr r0, _0810504C @ =gUnknown_8415F6C
	bl sub_8104C2C
_08104FEA:
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r5, _08105050 @ =gUnknown_203ACF0
	ldr r1, [r5]
	ldrh r0, [r1, 0x18]
	ldr r4, _08105054 @ =0x0000ffff
	cmp r0, r4
	beq _08105008
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r1, 0
	bl sub_8104C64
_08105008:
	ldr r1, [r5]
	ldrh r0, [r1, 0x1A]
	cmp r0, r4
	beq _0810501A
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r1, 0x1
	bl sub_8104C64
_0810501A:
	ldr r1, [r5]
	ldrh r0, [r1, 0x1C]
	cmp r0, r4
	beq _0810502C
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r1, 0x2
	bl sub_8104C64
_0810502C:
	ldr r1, [r5]
	ldrh r0, [r1, 0x1E]
	cmp r0, r4
	beq _0810503E
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r1, 0x3
	bl sub_8104C64
_0810503E:
	movs r0, 0
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08105048: .4byte gUnknown_8452344
_0810504C: .4byte gUnknown_8415F6C
_08105050: .4byte gUnknown_203ACF0
_08105054: .4byte 0x0000ffff
	thumb_func_end sub_8104F0C

	thumb_func_start sub_8105058
sub_8105058: @ 8105058
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	cmp r0, 0xFF
	bne _081050C0
	ldr r7, _081050B4 @ =gUnknown_84406C8
	movs r6, 0xB0
	lsls r6, 15
	movs r5, 0xA4
	lsls r5, 15
	movs r4, 0x3
_0810507A:
	lsrs r1, r5, 16
	adds r0, r7, 0
	movs r2, 0x2
	bl LoadPalette
	lsrs r1, r6, 16
	adds r0, r7, 0x2
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0x80
	lsls r0, 13
	adds r6, r0
	adds r5, r0
	subs r4, 0x1
	cmp r4, 0
	bge _0810507A
	ldr r0, _081050B4 @ =gUnknown_84406C8
	ldr r1, _081050B8 @ =0x00000141
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _081050BC @ =gUnknown_203ACF0
	ldr r0, [r0]
	adds r0, 0x2E
	movs r1, 0
	strb r1, [r0]
	b _0810515E
	.align 2, 0
_081050B4: .4byte gUnknown_84406C8
_081050B8: .4byte 0x00000141
_081050BC: .4byte gUnknown_203ACF0
_081050C0:
	ldr r2, _08105120 @ =gUnknown_203ACF0
	ldr r1, [r2]
	adds r1, 0x2E
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x2E
	ldrb r0, [r1]
	cmp r0, 0x10
	bne _081050DC
	movs r0, 0
	strb r0, [r1]
_081050DC:
	ldr r0, [r2]
	adds r0, 0x2E
	ldrb r0, [r0]
	lsrs r7, r0, 2
	movs r4, 0
	lsls r0, r7, 2
	mov r8, r0
	ldr r0, _08105124 @ =gUnknown_84406CC
	mov r10, r0
	movs r6, 0xB0
	lsls r6, 15
	movs r5, 0xA4
	lsls r5, 15
	movs r0, 0x4
	negs r0, r0
	add r0, r10
	mov r9, r0
_081050FE:
	ldr r0, [sp]
	cmp r4, r0
	bne _0810512C
	lsrs r1, r5, 16
	mov r0, r8
	add r0, r10
	movs r2, 0x2
	bl LoadPalette
	lsrs r1, r6, 16
	ldr r0, _08105128 @ =gUnknown_84406CE
	add r0, r8
	movs r2, 0x2
	bl LoadPalette
	b _08105142
	.align 2, 0
_08105120: .4byte gUnknown_203ACF0
_08105124: .4byte gUnknown_84406CC
_08105128: .4byte gUnknown_84406CE
_0810512C:
	lsrs r1, r5, 16
	mov r0, r9
	movs r2, 0x2
	bl LoadPalette
	lsrs r1, r6, 16
	mov r0, r9
	adds r0, 0x2
	movs r2, 0x2
	bl LoadPalette
_08105142:
	lsls r1, r7, 2
	movs r0, 0x80
	lsls r0, 13
	adds r6, r0
	adds r5, r0
	adds r4, 0x1
	cmp r4, 0x3
	ble _081050FE
	ldr r0, _08105170 @ =gUnknown_84406CC
	adds r0, r1, r0
	ldr r1, _08105174 @ =0x00000141
	movs r2, 0x2
	bl LoadPalette
_0810515E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105170: .4byte gUnknown_84406CC
_08105174: .4byte 0x00000141
	thumb_func_end sub_8105058

	thumb_func_start sub_8105178
sub_8105178: @ 8105178
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsls r2, 24
	movs r3, 0xFF
	lsls r3, 24
	adds r2, r3
	ldr r3, _081051A8 @ =gUnknown_8452334
	lsrs r2, 22
	adds r2, r3
	ldr r2, [r2]
	lsrs r1, 22
	adds r1, r2
	ldrb r3, [r1, 0x2]
	lsls r3, 3
	ldrb r2, [r1, 0x3]
	lsls r2, 3
	adds r1, r3, 0
	movs r3, 0
	bl ListMenuUpdateCursorObject
	pop {r0}
	bx r0
	.align 2, 0
_081051A8: .4byte gUnknown_8452334
	thumb_func_end sub_8105178

	thumb_func_start sub_81051AC
sub_81051AC: @ 81051AC
	push {lr}
	lsls r1, 24
	lsls r3, 24
	lsrs r1, 23
	adds r1, r0, r1
	lsrs r3, 23
	adds r2, r3
	movs r3, 0x13
_081051BC:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, 0x40
	adds r1, 0x40
	subs r3, 0x1
	cmp r3, 0
	bge _081051BC
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_81051AC

	thumb_func_start sub_81051D0
sub_81051D0: @ 81051D0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 24
	lsrs r2, 23
	adds r1, r2
	movs r2, 0x13
_081051DE:
	strh r0, [r1]
	adds r1, 0x40
	subs r2, 0x1
	cmp r2, 0
	bge _081051DE
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_81051D0

	thumb_func_start sub_81051F0
sub_81051F0: @ 81051F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetBgTilemapBuffer
	mov r10, r0
	movs r0, 0x2
	bl GetBgTilemapBuffer
	mov r9, r0
	movs r0, 0x3
	bl GetBgTilemapBuffer
	mov r8, r0
	ldr r0, _0810526C @ =gUnknown_203ACF0
	ldr r0, [r0]
	ldr r0, [r0, 0x5C]
	movs r1, 0x80
	lsls r1, 5
	adds r1, r0, r1
	str r1, [sp, 0x4]
	movs r1, 0x80
	lsls r1, 4
	adds r1, r0, r1
	str r1, [sp, 0x8]
	str r0, [sp, 0xC]
	movs r0, 0
	str r0, [sp]
	ldr r1, _08105270 @ =gUnknown_8452388
	movs r7, 0
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 1
	adds r6, r0, r1
_08105242:
	ldrb r4, [r6]
	cmp r4, 0x1E
	bne _08105274
	lsrs r4, r7, 24
	movs r0, 0
	mov r1, r10
	adds r2, r4, 0
	bl sub_81051D0
	movs r0, 0
	mov r1, r9
	adds r2, r4, 0
	bl sub_81051D0
	movs r0, 0xC
	mov r1, r8
	adds r2, r4, 0
	bl sub_81051D0
	b _0810529A
	.align 2, 0
_0810526C: .4byte gUnknown_203ACF0
_08105270: .4byte gUnknown_8452388
_08105274:
	lsrs r5, r7, 24
	ldr r0, [sp, 0x4]
	adds r1, r4, 0
	mov r2, r10
	adds r3, r5, 0
	bl sub_81051AC
	ldr r0, [sp, 0x8]
	adds r1, r4, 0
	mov r2, r9
	adds r3, r5, 0
	bl sub_81051AC
	ldr r0, [sp, 0xC]
	adds r1, r4, 0
	mov r2, r8
	adds r3, r5, 0
	bl sub_81051AC
_0810529A:
	movs r1, 0x80
	lsls r1, 17
	adds r7, r1
	adds r6, 0x1
	ldr r0, [sp]
	adds r0, 0x1
	str r0, [sp]
	cmp r0, 0x1D
	ble _08105242
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81051F0

	thumb_func_start sub_81052D0
sub_81052D0: @ 81052D0
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	bl IsNationalPokedexEnabled
	cmp r0, 0
	beq _081052E8
	ldr r0, _081052E4 @ =gUnknown_84406E0
	b _081052EA
	.align 2, 0
_081052E4: .4byte gUnknown_84406E0
_081052E8:
	ldr r0, _08105304 @ =gUnknown_84404C8
_081052EA:
	ldrh r4, [r0, 0xE]
	ldr r1, _08105308 @ =gUnknown_203ACF0
	ldr r0, [r1]
	ldrb r0, [r0, 0x2]
	adds r5, r1, 0
	cmp r0, 0x9
	bls _081052FA
	b _0810557C
_081052FA:
	lsls r0, 2
	ldr r1, _0810530C @ =_08105310
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08105304: .4byte gUnknown_84404C8
_08105308: .4byte gUnknown_203ACF0
_0810530C: .4byte _08105310
	.align 2, 0
_08105310:
	.4byte _08105338
	.4byte _08105358
	.4byte _08105364
	.4byte _08105384
	.4byte _081053DC
	.4byte _0810547C
	.4byte _08105492
	.4byte _081054F0
	.4byte _08105528
	.4byte _0810555C
_08105338:
	movs r0, 0xC0
	lsls r0, 5
	bl Alloc
	ldr r1, _08105350 @ =gUnknown_203ACF0
	ldr r1, [r1]
	str r0, [r1, 0x5C]
	cmp r6, 0
	beq _08105354
	movs r0, 0x6
	b _0810557A
	.align 2, 0
_08105350: .4byte gUnknown_203ACF0
_08105354:
	movs r0, 0x2
	b _0810557A
_08105358:
	ldr r0, [r5]
	ldr r0, [r0, 0x5C]
	bl Free
	movs r0, 0x1
	b _0810557E
_08105364:
	ldr r0, _0810537C @ =0x00007fff
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08105380 @ =gUnknown_203ACF0
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	b _0810557A
	.align 2, 0
_0810537C: .4byte 0x00007fff
_08105380: .4byte gUnknown_203ACF0
_08105384:
	movs r0, 0x1E
	str r0, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0xC
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r5, 0x20
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
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
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r0, _081053D8 @ =gUnknown_203ACF0
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	b _0810557A
	.align 2, 0
_081053D8: .4byte gUnknown_203ACF0
_081053DC:
	ldr r0, _08105474 @ =0x00007fff
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl sub_8104F0C
	movs r0, 0x3
	bl GetBgTilemapBuffer
	ldr r6, _08105478 @ =gUnknown_203ACF0
	ldr r1, [r6]
	ldr r1, [r1, 0x5C]
	movs r4, 0x80
	lsls r4, 2
	adds r2, r4, 0
	bl CpuFastSet
	movs r0, 0x2
	bl GetBgTilemapBuffer
	ldr r1, [r6]
	ldr r1, [r1, 0x5C]
	movs r2, 0x80
	lsls r2, 4
	adds r1, r2
	adds r2, r4, 0
	bl CpuFastSet
	movs r0, 0x1
	bl GetBgTilemapBuffer
	ldr r1, [r6]
	ldr r1, [r1, 0x5C]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r2
	adds r2, r4, 0
	bl CpuFastSet
	movs r0, 0x1E
	str r0, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0xC
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r5, 0x20
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
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
	ldr r1, [r6]
	movs r0, 0
	strb r0, [r1, 0x3]
	ldr r1, [r6]
	b _081054DC
	.align 2, 0
_08105474: .4byte 0x00007fff
_08105478: .4byte gUnknown_203ACF0
_0810547C:
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	cmp r0, 0x9
	bhi _08105578
	bl sub_81051F0
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	b _0810557C
_08105492:
	movs r0, 0x3
	bl GetBgTilemapBuffer
	ldr r4, _081054EC @ =gUnknown_203ACF0
	ldr r1, [r4]
	ldr r1, [r1, 0x5C]
	movs r5, 0x80
	lsls r5, 2
	adds r2, r5, 0
	bl CpuFastSet
	movs r0, 0x2
	bl GetBgTilemapBuffer
	ldr r1, [r4]
	ldr r1, [r1, 0x5C]
	movs r2, 0x80
	lsls r2, 4
	adds r1, r2
	adds r2, r5, 0
	bl CpuFastSet
	movs r0, 0x1
	bl GetBgTilemapBuffer
	ldr r1, [r4]
	ldr r1, [r1, 0x5C]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r2
	adds r2, r5, 0
	bl CpuFastSet
	ldr r1, [r4]
	movs r0, 0x9
	strb r0, [r1, 0x3]
	ldr r1, [r4]
_081054DC:
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0x6B
	bl PlaySE
	b _0810557C
	.align 2, 0
_081054EC: .4byte gUnknown_203ACF0
_081054F0:
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	beq _08105506
	bl sub_81051F0
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	b _0810557C
_08105506:
	ldrb r0, [r1, 0x2]
	bl sub_81051F0
	ldr r0, _08105524 @ =0x00007fff
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	b _0810557A
	.align 2, 0
_08105524: .4byte 0x00007fff
_08105528:
	ldr r2, _08105554 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0
	bl sub_8104F0C
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r0, _08105558 @ =gUnknown_203ACF0
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	b _0810557A
	.align 2, 0
_08105554: .4byte gPaletteFade
_08105558: .4byte gUnknown_203ACF0
_0810555C:
	ldr r2, _08105588 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0810558C @ =0x00007fff
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08105590 @ =gUnknown_203ACF0
	ldr r1, [r0]
_08105578:
	movs r0, 0x1
_0810557A:
	strb r0, [r1, 0x2]
_0810557C:
	movs r0, 0
_0810557E:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08105588: .4byte gPaletteFade
_0810558C: .4byte 0x00007fff
_08105590: .4byte gUnknown_203ACF0
	thumb_func_end sub_81052D0

	thumb_func_start sub_8105594
sub_8105594: @ 8105594
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _081055C0 @ =gUnknown_203ACF0
	ldr r3, [r0]
	adds r2, r3, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	cmp r0, 0
	bne _081055C8
	ldr r0, _081055C4 @ =gUnknown_8452334
	ldr r0, [r0]
	ldrb r3, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	b _081055E2
	.align 2, 0
_081055C0: .4byte gUnknown_203ACF0
_081055C4: .4byte gUnknown_8452334
_081055C8:
	ldr r1, _08105634 @ =gUnknown_8452334
	ldrb r0, [r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x2D
	ldrb r1, [r1]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrb r3, [r1, 0x2]
	ldrb r1, [r1, 0x3]
_081055E2:
	lsls r0, r4, 26
	movs r2, 0xC0
	lsls r2, 19
	adds r0, r2
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r2, r4, 1
	adds r0, r2, 0x3
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x8]
	cmp r0, 0x1B
	bls _08105602
	movs r0, 0x1C
	str r0, [sp, 0x8]
_08105602:
	ldr r0, [sp, 0xC]
	cmp r0, 0xD
	bls _0810560C
	movs r0, 0xE
	str r0, [sp, 0xC]
_0810560C:
	subs r0, r3, r2
	lsls r0, 16
	subs r1, r4
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x10]
	lsrs r6, r0, 16
	asrs r1, r0, 16
	ldr r2, [sp, 0x8]
	adds r0, r1, r2
	adds r0, 0x2
	cmp r0, 0x1D
	ble _08105638
	adds r0, r1, 0
	adds r0, 0x1C
	adds r1, r6, r2
	subs r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	b _0810563E
	.align 2, 0
_08105634: .4byte gUnknown_8452334
_08105638:
	cmp r1, 0
	bge _0810563E
	movs r6, 0
_0810563E:
	ldr r3, [sp, 0x10]
	lsls r0, r3, 16
	asrs r1, r0, 16
	ldr r2, [sp, 0xC]
	adds r0, r1, r2
	adds r0, 0x2
	cmp r0, 0x11
	ble _0810565E
	adds r0, r1, 0
	adds r0, 0x10
	adds r1, r3, r2
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	b _08105666
_0810565E:
	cmp r1, 0x1
	bgt _08105666
	movs r3, 0x2
	str r3, [sp, 0x10]
_08105666:
	ldr r1, [sp, 0xC]
	lsrs r0, r1, 1
	adds r0, 0x2
	ldr r2, [sp, 0x10]
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	add r10, r0
	mov r3, r10
	lsls r3, 16
	lsrs r3, 16
	mov r10, r3
	lsls r2, r6, 24
	lsrs r2, 24
	str r2, [sp, 0x14]
	ldr r0, [sp, 0x10]
	lsls r4, r0, 24
	lsrs r4, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x4
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	adds r6, 0x1
	lsls r2, r6, 24
	lsrs r2, 24
	str r2, [sp, 0x18]
	ldr r1, [sp, 0x8]
	str r1, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x5
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057EC @ =0x00000404
	ldr r2, [sp, 0x8]
	lsls r2, 24
	asrs r2, 24
	mov r8, r2
	add r8, r6
	mov r3, r8
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r6, [sp, 0x10]
	adds r6, 0x1
	ldr r0, [sp, 0xC]
	lsls r4, r0, 24
	asrs r4, 24
	adds r4, r6
	lsls r4, 24
	lsrs r4, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0xA
	ldr r2, [sp, 0x14]
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, [sp, 0x8]
	str r1, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0xB
	ldr r2, [sp, 0x18]
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057F0 @ =0x0000040a
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	lsls r3, r6, 24
	lsrs r3, 24
	str r3, [sp, 0x1C]
	str r5, [sp]
	mov r2, r10
	ldr r3, [sp, 0x10]
	subs r6, r2, r3
	subs r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x6
	ldr r2, [sp, 0x14]
	ldr r3, [sp, 0x1C]
	bl FillBgTilemapBufferRect_Palette0
	mov r0, r10
	lsls r3, r0, 24
	lsrs r3, 24
	str r3, [sp, 0x20]
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x7
	ldr r2, [sp, 0x14]
	bl FillBgTilemapBufferRect_Palette0
	movs r1, 0x1
	add r1, r10
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	str r5, [sp]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	adds r4, r2, r3
	mov r0, r10
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x9
	ldr r2, [sp, 0x14]
	mov r3, r9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057F4 @ =0x00000406
	str r5, [sp]
	str r6, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	ldr r3, [sp, 0x1C]
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057F8 @ =0x00000407
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	ldr r3, [sp, 0x20]
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057FC @ =0x00000409
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	mov r3, r9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, [sp, 0x8]
	str r1, [sp]
	str r6, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x1
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl FillBgTilemapBufferRect_Palette0
	ldr r2, [sp, 0x8]
	str r2, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x8
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x20]
	bl FillBgTilemapBufferRect_Palette0
	ldr r3, [sp, 0x8]
	str r3, [sp]
	str r4, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x2
	ldr r2, [sp, 0x18]
	mov r3, r9
	bl FillBgTilemapBufferRect_Palette0
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081057EC: .4byte 0x00000404
_081057F0: .4byte 0x0000040a
_081057F4: .4byte 0x00000406
_081057F8: .4byte 0x00000407
_081057FC: .4byte 0x00000409
	thumb_func_end sub_8105594

	thumb_func_start sub_8105800
sub_8105800: @ 8105800
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	adds r0, r1, 0
	bl SpeciesToNationalPokedexNum
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r2, _08105860 @ =gPokedexEntries
	adds r5, r1, r2
	movs r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08105864
	ldrb r0, [r5]
	cmp r0, 0
	beq _08105878
_08105840:
	mov r1, sp
	adds r1, r4
	adds r1, 0x8
	adds r0, r5, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08105878
	cmp r4, 0xA
	bls _08105840
	b _08105878
	.align 2, 0
_08105860: .4byte gPokedexEntries
_08105864:
	movs r1, 0xAC
_08105866:
	mov r0, sp
	adds r0, r4
	adds r0, 0x8
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _08105866
_08105878:
	mov r1, sp
	adds r1, r4
	adds r1, 0x8
	movs r0, 0xFF
	strb r0, [r1]
	str r7, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	mov r0, r8
	movs r1, 0
	add r2, sp, 0x8
	adds r3, r6, 0
	bl sub_81047C8
	movs r0, 0
	add r1, sp, 0x8
	movs r2, 0
	bl GetStringWidth
	adds r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _081058C0 @ =gUnknown_8415F8F
	str r7, [sp]
	str r4, [sp, 0x4]
	mov r0, r8
	movs r1, 0
	adds r3, r6, 0
	bl sub_81047C8
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081058C0: .4byte gUnknown_8415F8F
	thumb_func_end sub_8105800

	thumb_func_start sub_81058C4
sub_81058C4: @ 81058C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	adds r0, r1, 0
	bl SpeciesToNationalPokedexNum
	ldr r2, _08105974 @ =gPokedexEntries
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r4, [r1, 0xC]
	ldr r1, _08105978 @ =gUnknown_8415F98
	mov r10, r1
	movs r3, 0
	add r2, sp, 0x8
	movs r1, 0xFC
	strb r1, [r2]
	adds r2, 0x1
	movs r1, 0x14
	strb r1, [r2]
	adds r2, 0x1
	movs r1, 0x5
	strb r1, [r2]
	mov r1, sp
	adds r1, 0xB
	strb r3, [r1]
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _081059CE
	ldr r0, _0810597C @ =0x00002710
	muls r0, r4
	movs r1, 0xFE
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0xA
	bl __umodsi3
	cmp r0, 0x4
	bls _0810593A
	adds r5, 0xA
_0810593A:
	adds r0, r5, 0
	movs r1, 0x78
	bl __udivsi3
	adds r6, r0, 0
	lsls r0, r6, 4
	subs r0, r6
	lsls r0, 3
	subs r0, r5, r0
	movs r1, 0xA
	bl __udivsi3
	adds r5, r0, 0
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	adds r2, r0, 0
	cmp r2, 0
	bne _08105980
	add r0, sp, 0xC
	strb r2, [r0]
	mov r1, sp
	adds r1, 0xD
	adds r0, r6, 0
	adds r0, 0xA1
	strb r0, [r1]
	b _08105998
	.align 2, 0
_08105974: .4byte gPokedexEntries
_08105978: .4byte gUnknown_8415F98
_0810597C: .4byte 0x00002710
_08105980:
	add r1, sp, 0xC
	adds r0, r2, 0
	adds r0, 0xA1
	strb r0, [r1]
	mov r4, sp
	adds r4, 0xD
	adds r0, r6, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
_08105998:
	mov r1, sp
	adds r1, 0xE
	movs r0, 0xB4
	strb r0, [r1]
	mov r4, sp
	adds r4, 0xF
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	add r4, sp, 0x10
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
	mov r1, sp
	adds r1, 0x11
	movs r0, 0xB2
	strb r0, [r1]
	movs r2, 0xB
	adds r1, 0x1
	movs r0, 0xFF
	b _081059F2
_081059CE:
	add r0, sp, 0xC
	movs r1, 0xAC
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	mov r2, sp
	adds r2, 0xE
	movs r0, 0xB4
	strb r0, [r2]
	mov r0, sp
	adds r0, 0xF
	strb r1, [r0]
	add r0, sp, 0x10
	strb r1, [r0]
	movs r2, 0xA
	mov r1, sp
	adds r1, 0x11
	movs r0, 0xB2
_081059F2:
	strb r0, [r1]
	mov r1, sp
	adds r1, r2
	adds r1, 0x8
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, r8
	str r0, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	mov r0, r9
	movs r1, 0
	mov r2, r10
	adds r3, r7, 0
	bl sub_81047C8
	adds r0, r7, 0
	adds r0, 0x1E
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, r8
	str r1, [sp]
	str r4, [sp, 0x4]
	mov r0, r9
	movs r1, 0
	add r2, sp, 0x8
	adds r3, r7, 0
	bl sub_81047C8
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81058C4

	thumb_func_start sub_8105A3C
sub_8105A3C: @ 8105A3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	adds r0, r1, 0
	bl SpeciesToNationalPokedexNum
	ldr r2, _08105ACC @ =gPokedexEntries
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r4, [r1, 0xE]
	add r2, sp, 0x8
	movs r1, 0xFC
	strb r1, [r2]
	adds r2, 0x1
	movs r1, 0x14
	strb r1, [r2]
	adds r2, 0x1
	movs r1, 0x5
	strb r1, [r2]
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	bne _08105A92
	b _08105BC4
_08105A92:
	ldr r7, _08105AD0 @ =0x000186a0
	adds r0, r4, 0
	muls r0, r7
	ldr r1, _08105AD4 @ =0x000011b8
	bl __divsi3
	adds r6, r0, 0
	movs r1, 0xA
	bl __umodsi3
	cmp r0, 0x4
	bls _08105AAC
	adds r6, 0xA
_08105AAC:
	movs r5, 0
	mov r4, sp
	adds r4, 0xB
	adds r0, r6, 0
	adds r1, r7, 0
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	bne _08105AD8
	movs r7, 0x4
	strb r5, [r4]
	b _08105ADC
	.align 2, 0
_08105ACC: .4byte gPokedexEntries
_08105AD0: .4byte 0x000186a0
_08105AD4: .4byte 0x000011b8
_08105AD8:
	movs r5, 0x1
	movs r7, 0x4
_08105ADC:
	ldr r1, _08105B14 @ =0x000186a0
	adds r0, r6, 0
	bl __umodsi3
	adds r6, r0, 0
	mov r4, sp
	adds r4, r7
	adds r4, 0x8
	ldr r1, _08105B18 @ =0x00002710
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	bne _08105B1C
	cmp r5, 0
	bne _08105B1C
	adds r0, r7, 0
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r7, r1, 24
	add r0, sp
	adds r0, 0x8
	strb r5, [r0]
	b _08105B24
	.align 2, 0
_08105B14: .4byte 0x000186a0
_08105B18: .4byte 0x00002710
_08105B1C:
	movs r5, 0x1
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08105B24:
	ldr r1, _08105B5C @ =0x00002710
	adds r0, r6, 0
	bl __umodsi3
	adds r6, r0, 0
	mov r4, sp
	adds r4, r7
	adds r4, 0x8
	movs r1, 0xFA
	lsls r1, 2
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	bne _08105B60
	cmp r5, 0
	bne _08105B60
	adds r0, r7, 0
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r7, r1, 24
	add r0, sp
	adds r0, 0x8
	strb r5, [r0]
	b _08105B66
	.align 2, 0
_08105B5C: .4byte 0x00002710
_08105B60:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08105B66:
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r6, 0
	bl __umodsi3
	adds r6, r0, 0
	adds r1, r7, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r5, r7, 0
	mov r4, sp
	adds r4, r1
	adds r4, 0x8
	adds r0, r6, 0
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	adds r0, r6, 0
	movs r1, 0x64
	bl __umodsi3
	adds r6, r0, 0
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	movs r0, 0xAD
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	mov r4, sp
	adds r4, r2
	adds r4, 0x8
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	b _08105BE6
_08105BC4:
	mov r0, sp
	adds r0, 0xB
	movs r2, 0xAC
	strb r2, [r0]
	add r0, sp, 0xC
	strb r2, [r0]
	adds r0, 0x1
	strb r2, [r0]
	adds r0, 0x1
	strb r2, [r0]
	mov r1, sp
	adds r1, 0xF
	movs r0, 0xAD
	strb r0, [r1]
	movs r7, 0x9
	add r0, sp, 0x10
	strb r2, [r0]
_08105BE6:
	adds r1, r7, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	mov r0, sp
	adds r0, r1
	adds r0, 0x8
	movs r4, 0
	strb r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r3, r7, 0
	mov r1, sp
	adds r1, r2
	adds r1, 0x8
	movs r0, 0xFC
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	mov r1, sp
	adds r1, r3
	adds r1, 0x8
	movs r0, 0x14
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, sp
	adds r0, r2
	adds r0, 0x8
	strb r4, [r0]
	movs r2, 0
	movs r0, 0x21
	subs r1, r0, r7
	mov r5, r8
	adds r5, 0x1E
	cmp r2, r1
	bcs _08105C60
	ldr r3, _08105CA8 @ =gUnknown_8415FA0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _08105C60
	adds r3, r1, 0
	ldr r4, _08105CA8 @ =gUnknown_8415FA0
	adds r1, r7, 0
	add r1, sp
	adds r1, 0x8
_08105C4C:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x1
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, r3
	bcs _08105C60
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _08105C4C
_08105C60:
	adds r0, r7, r2
	mov r1, sp
	adds r1, r0
	adds r1, 0x8
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, r9
	str r0, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	mov r0, r10
	movs r1, 0
	ldr r2, _08105CAC @ =gUnknown_8415F9B
	mov r3, r8
	bl sub_81047C8
	lsls r0, r5, 24
	lsrs r0, 24
	mov r8, r0
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	mov r0, r10
	movs r1, 0
	add r2, sp, 0x8
	mov r3, r8
	bl sub_81047C8
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105CA8: .4byte gUnknown_8415FA0
_08105CAC: .4byte gUnknown_8415F9B
	thumb_func_end sub_8105A3C

	thumb_func_start sub_8105CB0
sub_8105CB0: @ 8105CB0
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	adds r0, r1, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08105D5C
	ldr r1, _08105D44 @ =gPokedexEntries
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, 0x10
	adds r0, r1
	ldr r1, [r0]
	str r1, [sp]
	mov r0, sp
	movs r3, 0
	strb r6, [r0, 0x4]
	mov r2, sp
	movs r0, 0x2
	strb r0, [r2, 0x5]
	movs r0, 0x1
	strb r0, [r2, 0xA]
	mov r0, sp
	strb r3, [r0, 0xB]
	mov r4, sp
	ldrb r3, [r4, 0xC]
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r4, 0xC]
	mov r3, sp
	movs r0, 0x10
	strb r0, [r3, 0xC]
	ldrb r0, [r3, 0xD]
	ands r2, r0
	strb r2, [r3, 0xD]
	mov r2, sp
	movs r0, 0x20
	strb r0, [r2, 0xD]
	movs r0, 0x2
	movs r2, 0
	bl GetStringWidth
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	adds r0, r5, r1
	cmp r0, 0
	ble _08105D48
	lsls r0, 24
	lsrs r5, r0, 24
	b _08105D4A
	.align 2, 0
_08105D44: .4byte gPokedexEntries
_08105D48:
	movs r5, 0
_08105D4A:
	mov r0, sp
	strb r5, [r0, 0x6]
	strb r7, [r0, 0x7]
	strb r5, [r0, 0x8]
	strb r7, [r0, 0x9]
	movs r1, 0xFF
	movs r2, 0
	bl AddTextPrinter
_08105D5C:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8105CB0

	thumb_func_start sub_8105D64
sub_8105D64: @ 8105D64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08105E02
	ldr r1, _08105E14 @ =gUnknown_843FAB0
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	mov r12, r0
	ldr r7, _08105E18 @ =gDecompressionBuffer
	movs r5, 0
	movs r1, 0
_08105DA6:
	mov r2, r12
	adds r0, r2, r1
	ldrb r3, [r0]
	movs r4, 0
	adds r6, r1, 0x1
_08105DB0:
	lsls r1, r4, 1
	adds r2, r3, 0
	asrs r2, r1
	movs r0, 0x1
	ands r2, r0
	movs r0, 0x2
	lsls r0, r1
	ands r0, r3
	cmp r0, 0
	beq _08105DC8
	movs r0, 0x10
	orrs r2, r0
_08105DC8:
	adds r0, r7, r5
	strb r2, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08105DB0
	lsls r0, r6, 16
	lsrs r1, r0, 16
	cmp r1, 0x1F
	bls _08105DA6
	movs r0, 0x10
	str r0, [sp]
	str r0, [sp, 0x4]
	mov r1, r9
	str r1, [sp, 0x8]
	mov r2, r8
	str r2, [sp, 0xC]
	str r0, [sp, 0x10]
	str r0, [sp, 0x14]
	mov r0, r10
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
_08105E02:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105E14: .4byte gUnknown_843FAB0
_08105E18: .4byte gDecompressionBuffer
	thumb_func_end sub_8105D64

	thumb_func_start sub_8105E1C
sub_8105E1C: @ 8105E1C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x3
	movs r1, 0x6
	bl sub_8105594
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x14
	str r5, [sp, 0x4]
	movs r0, 0x2
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
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r0, _08105FD0 @ =gUnknown_84521D4
	bl AddWindow
	ldr r4, _08105FD4 @ =gUnknown_203ACF0
	ldr r1, [r4]
	adds r1, 0x4A
	movs r2, 0
	mov r8, r2
	strb r0, [r1]
	ldr r0, _08105FD8 @ =gUnknown_84521DC
	bl AddWindow
	ldr r1, [r4]
	adds r1, 0x4B
	strb r0, [r1]
	ldr r0, _08105FDC @ =gUnknown_84521E4
	bl AddWindow
	ldr r1, [r4]
	adds r1, 0x4C
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x4A
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4A
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0x90
	bl sub_81049FC
	ldr r0, [r4]
	adds r0, 0x4A
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	adds r0, 0x4A
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	adds r0, 0x4B
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r2, [r1]
	movs r5, 0x8
	str r5, [sp]
	movs r1, 0
	movs r3, 0
	bl sub_8104A34
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r2, [r1]
	movs r1, 0xB
	muls r2, r1
	ldr r1, _08105FE0 @ =gSpeciesNames
	adds r2, r1
	str r5, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r1, 0x2
	movs r3, 0x1C
	bl sub_81047C8
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0x18
	bl sub_8105800
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0x24
	bl sub_81058C4
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0x30
	bl sub_8105A3C
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0x58
	movs r3, 0x28
	bl sub_8105D64
	ldr r0, [r4]
	adds r0, 0x4B
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	adds r0, 0x4B
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	adds r0, 0x4C
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4C
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0x8
	bl sub_8105CB0
	ldr r0, [r4]
	adds r0, 0x4C
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	adds r0, 0x4C
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	cmp r6, 0
	bne _08105FEC
	ldr r2, _08105FE4 @ =gUnknown_8415FAD
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0x8
	bl sub_81047C8
	ldr r0, _08105FE8 @ =gUnknown_8415FB3
	bl sub_8104C2C
	b _08105FF2
	.align 2, 0
_08105FD0: .4byte gUnknown_84521D4
_08105FD4: .4byte gUnknown_203ACF0
_08105FD8: .4byte gUnknown_84521DC
_08105FDC: .4byte gUnknown_84521E4
_08105FE0: .4byte gSpeciesNames
_08105FE4: .4byte gUnknown_8415FAD
_08105FE8: .4byte gUnknown_8415FB3
_08105FEC:
	ldr r0, _08106010 @ =gUnknown_8415FC8
	bl sub_8104C2C
_08105FF2:
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08106010: .4byte gUnknown_8415FC8
	thumb_func_end sub_8105E1C

	thumb_func_start sub_8106014
sub_8106014: @ 8106014
	push {r4,lr}
	ldr r4, _08106038 @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r0, 0x4A
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x4B
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x4C
	bl sub_81047B0
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08106038: .4byte gUnknown_203ACF0
	thumb_func_end sub_8106014

	thumb_func_start sub_810603C
sub_810603C: @ 810603C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r6, _08106424 @ =gUnknown_203ACF0
	ldr r0, [r6]
	adds r0, 0x5A
	ldrh r0, [r0]
	str r0, [sp, 0x1C]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
	ldr r0, [sp, 0x1C]
	movs r1, 0x1
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r7, 0x1C
	movs r0, 0xE
	mov r8, r0
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106428 @ =0x00000404
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1D
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _0810642C @ =0x00000804
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0x11
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106430 @ =0x00000c04
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1D
	movs r3, 0x11
	bl FillBgTilemapBufferRect_Palette0
	str r7, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x5
	movs r2, 0x1
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106434 @ =0x00000805
	str r7, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1
	movs r3, 0x11
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x6
	movs r2, 0
	movs r3, 0x3
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106438 @ =0x00000406
	str r4, [sp]
	mov r2, r8
	str r2, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1D
	movs r3, 0x3
	bl FillBgTilemapBufferRect_Palette0
	str r7, [sp]
	mov r3, r8
	str r3, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x3
	bl FillBgTilemapBufferRect_Palette0
	movs r5, 0x1E
	str r5, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r7, 0xA
	movs r0, 0x6
	mov r8, r0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1D
	movs r2, 0x1
	movs r3, 0x9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _0810643C @ =0x0000041d
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r2, 0xC
	movs r3, 0x9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106440 @ =0x0000081d
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r2, 0x1
	movs r3, 0x10
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106444 @ =0x00000c1d
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r2, 0xC
	movs r3, 0x10
	bl FillBgTilemapBufferRect_Palette0
	str r7, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1E
	movs r2, 0x2
	movs r3, 0x9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106448 @ =0x0000081e
	str r7, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r2, 0x2
	movs r3, 0x10
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1F
	movs r2, 0x1
	movs r3, 0xA
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _0810644C @ =0x0000041f
	str r4, [sp]
	mov r2, r8
	str r2, [sp, 0x4]
	movs r0, 0
	movs r2, 0xC
	movs r3, 0xA
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0x2
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
	bl GetUnlockedSeviiAreas
	ldr r1, [r6]
	adds r1, 0x64
	strb r0, [r1]
	movs r3, 0x4
	mov r9, r3
	movs r4, 0x3
	ldr r0, [r6]
	adds r0, 0x64
	ldrb r1, [r0]
	movs r2, 0x1
_081061E2:
	adds r0, r1, 0
	asrs r0, r4
	ands r0, r2
	cmp r0, 0
	beq _081061F0
	movs r0, 0
	mov r9, r0
_081061F0:
	adds r4, 0x1
	cmp r4, 0x6
	ble _081061E2
	ldr r0, _08106450 @ =gUnknown_8452214
	bl AddWindow
	ldr r5, _08106424 @ =gUnknown_203ACF0
	ldr r1, [r5]
	adds r1, 0x4A
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r0, [r0]
	ldr r1, _08106454 @ =gUnknown_8443620
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r4, [r0]
	adds r0, r4, 0
	movs r1, 0x2
	bl GetWindowAttribute
	adds r2, r0, 0
	add r2, r9
	adds r0, r4, 0
	movs r1, 0x2
	bl SetWindowAttribute
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r0, [r0]
	bl PutWindowTilemap
	movs r4, 0
	mov r1, r9
	lsls r1, 27
	str r1, [sp, 0x20]
	ldr r7, _08106458 @ =gUnknown_8452254
	adds r2, r7, 0x4
	mov r8, r2
_08106246:
	ldr r0, [r5]
	adds r0, 0x64
	ldrb r1, [r0]
	asrs r1, r4
	movs r0, 0x1
	ands r1, r0
	adds r6, r4, 0x1
	cmp r1, 0
	beq _081062B4
	lsls r4, 3
	adds r0, r4, r7
	ldr r0, [r0]
	bl AddWindow
	ldr r1, [r5]
	adds r1, 0x4A
	adds r1, r6
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4A
	adds r0, r6
	ldrb r0, [r0]
	add r4, r8
	ldr r1, [r4]
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r0, [r5]
	adds r0, 0x4A
	adds r0, r6
	ldrb r4, [r0]
	adds r0, r4, 0
	movs r1, 0x2
	bl GetWindowAttribute
	adds r2, r0, 0
	add r2, r9
	adds r0, r4, 0
	movs r1, 0x2
	bl SetWindowAttribute
	ldr r0, [r5]
	adds r0, 0x4A
	adds r0, r6
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r5]
	adds r0, 0x4A
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
_081062B4:
	adds r4, r6, 0
	cmp r4, 0x6
	ble _08106246
	ldr r0, _0810645C @ =gUnknown_84521F4
	bl AddWindow
	ldr r7, _08106424 @ =gUnknown_203ACF0
	ldr r1, [r7]
	adds r1, 0x52
	movs r6, 0
	strb r0, [r1]
	ldr r5, _08106460 @ =gUnknown_84521FC
	adds r0, r5, 0
	bl AddWindow
	ldr r1, [r7]
	adds r1, 0x53
	strb r0, [r1]
	ldr r3, _08106464 @ =gUnknown_8452204
	mov r8, r3
	mov r0, r8
	bl AddWindow
	ldr r1, [r7]
	adds r1, 0x54
	strb r0, [r1]
	ldr r0, _08106468 @ =gUnknown_84521EC
	bl AddWindow
	ldr r1, [r7]
	adds r1, 0x55
	strb r0, [r1]
	ldr r0, _0810646C @ =gUnknown_845220C
	bl AddWindow
	ldr r1, [r7]
	adds r1, 0x56
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x55
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0xA0
	ldr r1, [sp, 0x1C]
	bl sub_8107CD8
	ldr r0, [sp, 0x1C]
	bl sub_81049CC
	adds r2, r0, 0
	ldr r0, [r7]
	adds r0, 0x55
	ldrb r0, [r0]
	str r6, [sp]
	ldr r1, [sp, 0x1C]
	movs r3, 0
	bl sub_8107CF8
	ldr r0, [r7]
	adds r0, 0x55
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x55
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r7]
	adds r0, 0x53
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, _08106470 @ =gUnknown_8415FED
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	ldr r1, [r7]
	adds r1, 0x53
	ldrb r1, [r1]
	ldrb r3, [r5, 0x3]
	lsls r3, 3
	subs r3, r0
	lsrs r0, r3, 31
	adds r3, r0
	asrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	movs r5, 0x4
	str r5, [sp]
	str r6, [sp, 0x4]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r4, 0
	bl sub_81047C8
	ldr r0, [r7]
	adds r0, 0x53
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x53
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r7]
	adds r0, 0x54
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, _08106474 @ =gUnknown_8415FE8
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	ldr r1, [r7]
	adds r1, 0x54
	ldrb r1, [r1]
	mov r2, r8
	ldrb r3, [r2, 0x3]
	lsls r3, 3
	subs r3, r0
	lsrs r0, r3, 31
	adds r3, r0
	asrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r6, [sp, 0x4]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r4, 0
	bl sub_81047C8
	ldr r0, [r7]
	adds r0, 0x54
	ldrb r4, [r0]
	adds r0, r4, 0
	movs r1, 0x2
	bl GetWindowAttribute
	adds r2, r0, 0
	add r2, r9
	adds r0, r4, 0
	movs r1, 0x2
	bl SetWindowAttribute
	ldr r0, [r7]
	adds r0, 0x54
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x54
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	str r6, [sp]
	movs r1, 0
	ldr r2, [sp, 0x1C]
	movs r3, 0
	bl sub_8104A34
	b _08106478
	.align 2, 0
_08106424: .4byte gUnknown_203ACF0
_08106428: .4byte 0x00000404
_0810642C: .4byte 0x00000804
_08106430: .4byte 0x00000c04
_08106434: .4byte 0x00000805
_08106438: .4byte 0x00000406
_0810643C: .4byte 0x0000041d
_08106440: .4byte 0x0000081d
_08106444: .4byte 0x00000c1d
_08106448: .4byte 0x0000081e
_0810644C: .4byte 0x0000041f
_08106450: .4byte gUnknown_8452214
_08106454: .4byte gUnknown_8443620
_08106458: .4byte gUnknown_8452254
_0810645C: .4byte gUnknown_84521F4
_08106460: .4byte gUnknown_84521FC
_08106464: .4byte gUnknown_8452204
_08106468: .4byte gUnknown_84521EC
_0810646C: .4byte gUnknown_845220C
_08106470: .4byte gUnknown_8415FED
_08106474: .4byte gUnknown_8415FE8
_08106478:
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	movs r1, 0xB
	ldr r3, [sp, 0x1C]
	adds r2, r3, 0
	muls r2, r1
	ldr r1, _081066B0 @ =gSpeciesNames
	adds r2, r1
	movs r1, 0xC
	str r1, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x2
	movs r3, 0x3
	bl sub_81047C8
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0xB0
	movs r1, 0x1
	bl sub_8107D38
	mov r0, r10
	cmp r0, 0
	beq _08106504
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	ldr r1, _081066B4 @ =gBaseStats
	ldr r2, [sp, 0x1C]
	lsls r4, r2, 3
	subs r4, r2
	lsls r4, 2
	adds r4, r1
	ldrb r5, [r4, 0x6]
	adds r1, r5, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	movs r3, 0x1
	bl BlitMoveInfoIcon
	ldrb r1, [r4, 0x7]
	cmp r5, r1
	beq _08106504
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x20
	movs r3, 0x1
	bl BlitMoveInfoIcon
_08106504:
	ldr r7, _081066B8 @ =gUnknown_203ACF0
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	bl ResetAllPicSprites
	ldr r0, _081066BC @ =gUnknown_8452368
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	mov r3, r10
	cmp r3, 0
	bne _08106534
	b _081066D0
_08106534:
	ldr r0, [sp, 0x1C]
	bl sub_81049CC
	adds r2, r0, 0
	movs r0, 0x28
	str r0, [sp]
	movs r0, 0x68
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldr r1, _081066C0 @ =0x0000ffff
	str r1, [sp, 0xC]
	ldr r0, [sp, 0x1C]
	movs r1, 0x8
	movs r3, 0x1
	bl CreateMonPicSprite_HandleDeoxys
	ldr r1, [r7]
	adds r1, 0x58
	strb r0, [r1]
	ldr r2, _081066C4 @ =gSprites
	mov r10, r2
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x5]
	movs r3, 0xF
	mov r9, r3
	mov r0, r9
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x1]
	subs r3, 0x13
	mov r8, r3
	mov r0, r8
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x3]
	movs r6, 0x3F
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x3]
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x5]
	movs r5, 0xD
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldr r1, _081066C8 @ =gPokedexEntries
	ldr r2, [sp, 0x18]
	lsls r4, r2, 3
	adds r4, r2
	lsls r4, 2
	adds r4, r1
	ldrh r1, [r4, 0x1C]
	strh r1, [r0, 0x26]
	ldrh r1, [r4, 0x1A]
	str r1, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r0, _081066CC @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	bl PlayerGenderToFrontTrainerPicId_Debug
	lsls r0, 16
	lsrs r0, 16
	movs r3, 0
	str r3, [sp]
	ldr r1, _081066C0 @ =0x0000ffff
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x50
	movs r3, 0x68
	bl CreateTrainerPicSprite
	ldr r1, [r7]
	adds r1, 0x59
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r1, [r0, 0x5]
	mov r2, r9
	ands r2, r1
	movs r3, 0x20
	orrs r2, r3
	strb r2, [r0, 0x5]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r1, [r0, 0x1]
	mov r2, r8
	ands r2, r1
	movs r3, 0x1
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r1, [r0, 0x3]
	ands r6, r1
	movs r1, 0x2
	orrs r6, r1
	strb r6, [r0, 0x3]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r1, [r0, 0x5]
	ands r5, r1
	movs r1, 0x4
	orrs r5, r1
	strb r5, [r0, 0x5]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x26]
	ldrh r1, [r4, 0x1E]
	str r1, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _081066E2
	.align 2, 0
_081066B0: .4byte gSpeciesNames
_081066B4: .4byte gBaseStats
_081066B8: .4byte gUnknown_203ACF0
_081066BC: .4byte gUnknown_8452368
_081066C0: .4byte 0x0000ffff
_081066C4: .4byte gSprites
_081066C8: .4byte gPokedexEntries
_081066CC: .4byte gSaveBlock2Ptr
_081066D0:
	ldr r0, [r7]
	adds r0, 0x58
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, 0x59
	movs r1, 0x1
	negs r1, r1
	strb r1, [r0]
_081066E2:
	ldr r1, _081067A8 @ =0x000007d1
	ldr r2, [sp, 0x20]
	lsrs r3, r2, 24
	ldr r0, [sp, 0x1C]
	movs r2, 0x3
	bl sub_8134230
	ldr r5, _081067AC @ =gUnknown_203ACF0
	ldr r1, [r5]
	strb r0, [r1, 0x4]
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	bl sub_81344E0
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _0810675A
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r0, [r0]
	ldr r1, _081067B0 @ =gUnknown_8443D00
	movs r4, 0x58
	str r4, [sp]
	movs r3, 0x10
	str r3, [sp, 0x4]
	movs r2, 0x4
	str r2, [sp, 0x8]
	movs r2, 0x1C
	str r2, [sp, 0xC]
	str r4, [sp, 0x10]
	str r3, [sp, 0x14]
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
	ldr r4, _081067B4 @ =gUnknown_8415FF2
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	ldr r1, [r5]
	adds r1, 0x4A
	ldrb r1, [r1]
	movs r3, 0x60
	subs r3, r0
	lsrs r0, r3, 31
	adds r3, r0
	asrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x1D
	str r0, [sp]
	str r6, [sp, 0x4]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r4, 0
	bl sub_81047C8
_0810675A:
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r2, _081067B8 @ =gUnknown_8415FAD
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0x8
	bl sub_81047C8
	ldr r0, _081067BC @ =gUnknown_8415FCF
	bl sub_8104C2C
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081067A8: .4byte 0x000007d1
_081067AC: .4byte gUnknown_203ACF0
_081067B0: .4byte gUnknown_8443D00
_081067B4: .4byte gUnknown_8415FF2
_081067B8: .4byte gUnknown_8415FAD
_081067BC: .4byte gUnknown_8415FCF
	thumb_func_end sub_810603C

	thumb_func_start sub_81067C0
sub_81067C0: @ 81067C0
	push {r4,r5,lr}
	ldr r4, _0810680C @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldrb r0, [r0, 0x4]
	bl sub_81343F4
	movs r5, 0
_081067CE:
	adds r1, r5, 0
	adds r1, 0x4A
	ldr r0, [r4]
	adds r0, r1
	bl sub_81047B0
	adds r5, 0x1
	cmp r5, 0xC
	ble _081067CE
	ldr r4, _0810680C @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x59
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _081067F2
	bl FreeAndDestroyTrainerPicSprite
_081067F2:
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x58
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08106802
	bl FreeAndDestroyMonPicSprite
_08106802:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810680C: .4byte gUnknown_203ACF0
	thumb_func_end sub_81067C0

	thumb_func_start sub_8106810
sub_8106810: @ 8106810
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl IsNationalPokedexEnabled
	cmp r0, 0x1
	beq _08106830
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x97
	bls _08106830
	movs r0, 0
	b _08106832
_08106830:
	movs r0, 0x1
_08106832:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8106810

	thumb_func_start sub_8106838
sub_8106838: @ 8106838
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08106888 @ =gUnknown_8452C4C
	lsrs r0, 21
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r6, 3
	adds r1, r2
	ldrb r1, [r1, 0x4]
	mov r8, r1
	movs r5, 0
	adds r7, r0, 0
_08106858:
	cmp r5, r8
	bge _0810688C
	ldr r1, [r7]
	lsls r0, r6, 3
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r5, 1
	adds r0, r1
	ldrh r4, [r0]
	adds r0, r4, 0
	bl sub_8106810
	cmp r0, 0x1
	bne _0810688C
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _0810688C
	movs r0, 0x1
	b _08106894
	.align 2, 0
_08106888: .4byte gUnknown_8452C4C
_0810688C:
	adds r5, 0x1
	cmp r5, 0x3
	ble _08106858
	movs r0, 0
_08106894:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8106838

	thumb_func_start sub_81068A0
sub_81068A0: @ 81068A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _081068C8 @ =gUnknown_8452C4C
	lsls r0, r6, 3
	adds r0, r1
	ldrb r5, [r0, 0x4]
	movs r4, 0
	cmp r4, r5
	bge _081068D2
_081068B4:
	lsls r1, r4, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8106838
	lsls r0, 24
	cmp r0, 0
	beq _081068CC
	movs r0, 0x1
	b _081068D4
	.align 2, 0
_081068C8: .4byte gUnknown_8452C4C
_081068CC:
	adds r4, 0x1
	cmp r4, r5
	blt _081068B4
_081068D2:
	movs r0, 0
_081068D4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81068A0

	thumb_func_start sub_81068DC
sub_81068DC: @ 81068DC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08106990 @ =gUnknown_8452C4C
	lsls r0, r4, 3
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r6, 3
	adds r0, r1
	ldrb r0, [r0, 0x4]
	mov r9, r0
	ldr r2, _08106994 @ =gUnknown_203ACF0
	ldr r0, [r2]
	adds r0, 0x2C
	movs r1, 0
	strb r1, [r0]
	movs r5, 0
	ldr r0, _08106998 @ =0x0000ffff
	adds r3, r0, 0
_0810690C:
	ldr r0, [r2]
	lsls r1, r5, 1
	adds r0, 0x18
	adds r0, r1
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r5, 0x1
	cmp r5, 0x3
	ble _0810690C
	movs r5, 0
	cmp r5, r9
	bge _08106982
	ldr r1, _08106990 @ =gUnknown_8452C4C
	lsls r0, r4, 3
	adds r0, r1
	mov r8, r0
	lsls r7, r6, 3
_08106930:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	lsls r6, r5, 1
	adds r0, r6, r0
	ldrh r4, [r0]
	adds r0, r4, 0
	bl sub_8106810
	cmp r0, 0x1
	bne _0810697C
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _0810697C
	ldr r0, _08106994 @ =gUnknown_203ACF0
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	lsls r0, 1
	adds r1, 0x18
	adds r1, r0
	mov r3, r8
	ldr r0, [r3]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_0810697C:
	adds r5, 0x1
	cmp r5, r9
	blt _08106930
_08106982:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106990: .4byte gUnknown_8452C4C
_08106994: .4byte gUnknown_203ACF0
_08106998: .4byte 0x0000ffff
	thumb_func_end sub_81068DC

	thumb_func_start sub_810699C
sub_810699C: @ 810699C
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081069F8 @ =gUnknown_8452C4C
	lsls r0, r7, 3
	adds r0, r1
	ldrb r6, [r0, 0x4]
	movs r2, 0xFF
	movs r3, 0xFF
	movs r5, 0
	cmp r5, r6
	bge _081069DE
_081069B6:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	adds r1, r4, 0
	str r2, [sp]
	str r3, [sp, 0x4]
	bl sub_8106838
	lsls r0, 24
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _081069D8
	cmp r2, 0xFF
	bne _081069D6
	adds r2, r4, 0
_081069D6:
	adds r3, r4, 0
_081069D8:
	adds r5, 0x1
	cmp r5, r6
	blt _081069B6
_081069DE:
	cmp r3, 0xFF
	bne _08106A00
	ldr r2, _081069FC @ =gUnknown_203ACF0
	ldr r0, [r2]
	adds r0, 0x29
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x2A
	strb r1, [r0]
	movs r0, 0x1
	b _08106A12
	.align 2, 0
_081069F8: .4byte gUnknown_8452C4C
_081069FC: .4byte gUnknown_203ACF0
_08106A00:
	ldr r1, _08106A1C @ =gUnknown_203ACF0
	ldr r0, [r1]
	adds r0, 0x29
	strb r2, [r0]
	ldr r0, [r1]
	adds r1, r3, 0x1
	adds r0, 0x2A
	strb r1, [r0]
	movs r0, 0
_08106A12:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08106A1C: .4byte gUnknown_203ACF0
	thumb_func_end sub_810699C

	thumb_func_start sub_8106A20
sub_8106A20: @ 8106A20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r1, _08106A98 @ =gUnknown_8452C4C
	str r1, [sp, 0x10]
_08106A3A:
	ldr r2, [sp, 0x10]
	ldrb r2, [r2, 0x4]
	str r2, [sp, 0x8]
	movs r7, 0
	cmp r7, r2
	bge _08106AD6
	ldr r0, [sp, 0x10]
	str r0, [sp, 0xC]
	movs r1, 0
	mov r9, r1
_08106A4E:
	ldr r2, [sp, 0xC]
	ldr r0, [r2]
	add r0, r9
	ldrb r6, [r0, 0x4]
	movs r5, 0
	mov r8, r5
	cmp r5, r6
	bge _08106ACA
	ldr r0, [sp, 0x10]
	mov r10, r0
	ldr r3, _08106A9C @ =gUnknown_203ACF0
_08106A64:
	mov r1, r10
	ldr r0, [r1]
	add r0, r9
	ldr r1, [r0]
	lsls r0, r5, 1
	adds r0, r1
	ldrh r0, [r0]
	adds r4, r0, 0
	ldr r2, [sp]
	cmp r2, r4
	bne _08106AA0
	ldr r0, [r3]
	adds r0, 0x28
	mov r1, sp
	ldrb r1, [r1, 0x4]
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, 0x2B
	strb r7, [r0]
	ldr r0, [r3]
	adds r0, 0x2D
	mov r2, r8
	strb r2, [r0]
	movs r0, 0
	b _08106AE8
	.align 2, 0
_08106A98: .4byte gUnknown_8452C4C
_08106A9C: .4byte gUnknown_203ACF0
_08106AA0:
	adds r0, r4, 0
	str r3, [sp, 0x14]
	bl sub_8106810
	ldr r3, [sp, 0x14]
	cmp r0, 0x1
	bne _08106AC4
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	ldr r3, [sp, 0x14]
	cmp r0, 0
	beq _08106AC4
	movs r0, 0x1
	add r8, r0
_08106AC4:
	adds r5, 0x1
	cmp r5, r6
	blt _08106A64
_08106ACA:
	movs r1, 0x8
	add r9, r1
	adds r7, 0x1
	ldr r2, [sp, 0x8]
	cmp r7, r2
	blt _08106A4E
_08106AD6:
	ldr r0, [sp, 0x10]
	adds r0, 0x8
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x4]
	adds r1, 0x1
	str r1, [sp, 0x4]
	cmp r1, 0x8
	bls _08106A3A
	movs r0, 0x1
_08106AE8:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8106A20

	thumb_func_start sub_8106AF8
sub_8106AF8: @ 8106AF8
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0
	movs r6, 0
	cmp r6, r5
	bge _08106B24
_08106B06:
	ldr r0, _08106B30 @ =gUnknown_203ACF0
	ldr r0, [r0]
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r1, r4, 24
	lsrs r1, 24
	bl sub_8106838
	lsls r0, 24
	cmp r0, 0
	beq _08106B1E
	adds r6, 0x1
_08106B1E:
	adds r4, 0x1
	cmp r4, r5
	blt _08106B06
_08106B24:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08106B30: .4byte gUnknown_203ACF0
	thumb_func_end sub_8106AF8

	thumb_func_start sub_8106B34
sub_8106B34: @ 8106B34
	push {lr}
	ldr r0, _08106B58 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08106B54
	ldr r0, _08106B5C @ =gUnknown_203ACF0
	ldr r0, [r0]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
_08106B54:
	pop {r0}
	bx r0
	.align 2, 0
_08106B58: .4byte gMain
_08106B5C: .4byte gUnknown_203ACF0
	thumb_func_end sub_8106B34

	thumb_func_start sub_8106B60
sub_8106B60: @ 8106B60
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0x2
	movs r2, 0x1
	bl sub_8104AB0
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0x1
	bl sub_8104AB0
	bl IsNationalPokedexEnabled
	cmp r0, 0
	bne _08106BA4
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x97
	bls _08106BA4
	ldr r0, _08106BA0 @ =sub_8106BD8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	b _08106BC6
	.align 2, 0
_08106BA0: .4byte sub_8106BD8
_08106BA4:
	bl sub_810250C
	ldr r2, _08106BCC @ =gTasks
	ldr r4, _08106BD0 @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08106BD4 @ =sub_8106BE8
	str r1, [r0]
	adds r0, r5, 0
	bl sub_8106A20
	ldr r0, [r4]
	ldrb r0, [r0]
_08106BC6:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08106BCC: .4byte gTasks
_08106BD0: .4byte gUnknown_203ACF0
_08106BD4: .4byte sub_8106BE8
	thumb_func_end sub_8106B60

	thumb_func_start sub_8106BD8
sub_8106BD8: @ 8106BD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8106BD8

	thumb_func_start sub_8106BE8
sub_8106BE8: @ 8106BE8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08106C08 @ =gUnknown_203ACF0
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0xB
	bls _08106BFE
	b _08106E6A
_08106BFE:
	lsls r0, 2
	ldr r1, _08106C0C @ =_08106C10
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106C08: .4byte gUnknown_203ACF0
_08106C0C: .4byte _08106C10
	.align 2, 0
_08106C10:
	.4byte _08106C40
	.4byte _08106C62
	.4byte _08106C84
	.4byte _08106C98
	.4byte _08106CD4
	.4byte _08106D1C
	.4byte _08106D4C
	.4byte _08106D9E
	.4byte _08106DBA
	.4byte _08106DCC
	.4byte _08106DDE
	.4byte _08106E58
_08106C40:
	ldr r0, [r4]
	adds r0, 0x28
	ldrb r0, [r0]
	bl sub_810699C
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x2B
	adds r0, 0x29
	ldrb r1, [r0]
	ldrb r0, [r2]
	cmp r0, r1
	bcs _08106C5C
	strb r1, [r2]
_08106C5C:
	ldr r1, [r4]
	movs r0, 0x3
	b _08106E68
_08106C62:
	bl sub_8106014
	bl sub_8104E90
	ldr r0, _08106C7C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08106C80 @ =gUnknown_203ACF0
	ldr r1, [r0]
	b _08106E66
	.align 2, 0
_08106C7C: .4byte gMain
_08106C80: .4byte gUnknown_203ACF0
_08106C84:
	bl sub_8102798
	lsls r0, 24
	cmp r0, 0
	bne _08106C90
	b _08106E6A
_08106C90:
	adds r0, r5, 0
	bl DestroyTask
	b _08106E6A
_08106C98:
	movs r0, 0x1
	bl sub_8104F0C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0xFF
	bl sub_8105058
	ldr r0, _08106CD0 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x4
	b _08106E68
	.align 2, 0
_08106CD0: .4byte gUnknown_203ACF0
_08106CD4:
	ldr r2, _08106D10 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08106D14 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0
	bl ShowBg
	ldr r0, _08106D18 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x5
	b _08106E68
	.align 2, 0
_08106D10: .4byte gPaletteFade
_08106D14: .4byte 0x0000ffff
_08106D18: .4byte gUnknown_203ACF0
_08106D1C:
	ldr r1, _08106D40 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1E
	strh r1, [r0, 0x8]
	ldr r0, _08106D44 @ =gUnknown_84524C4
	movs r1, 0
	bl ListMenuAddCursorObjectInternal
	ldr r2, _08106D48 @ =gUnknown_203ACF0
	ldr r1, [r2]
	adds r1, 0x61
	strb r0, [r1]
	ldr r1, [r2]
	movs r0, 0x6
	b _08106E68
	.align 2, 0
_08106D40: .4byte gTasks
_08106D44: .4byte gUnknown_84524C4
_08106D48: .4byte gUnknown_203ACF0
_08106D4C:
	ldr r0, [r4]
	adds r0, 0x2D
	ldrb r0, [r0]
	bl sub_8105058
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x61
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x2D
	ldrb r1, [r1]
	adds r2, 0x2C
	ldrb r2, [r2]
	bl sub_8105178
	ldr r1, _08106D88 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08106D8C
	subs r0, r2, 0x1
	strh r0, [r1, 0x8]
	b _08106E6A
	.align 2, 0
_08106D88: .4byte gTasks
_08106D8C:
	ldr r0, [r4]
	adds r0, 0x61
	ldrb r0, [r0]
	movs r1, 0
	bl ListMenuRemoveCursorObject
	ldr r1, [r4]
	movs r0, 0x7
	b _08106E68
_08106D9E:
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x2D
	ldrb r1, [r0]
	lsls r1, 1
	subs r0, 0x15
	adds r0, r1
	ldrh r0, [r0]
	adds r1, r2, 0
	adds r1, 0x5A
	strh r0, [r1]
	movs r0, 0x8
	strb r0, [r2, 0x1]
	b _08106E6A
_08106DBA:
	movs r0, 0x1
	bl sub_8105E1C
	ldr r0, _08106DC8 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x9
	b _08106E68
	.align 2, 0
_08106DC8: .4byte gUnknown_203ACF0
_08106DCC:
	ldr r0, [r4]
	movs r1, 0
	strb r1, [r0, 0x2]
	ldr r0, [r4]
	strb r1, [r0, 0x3]
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
_08106DDE:
	ldr r1, [r4]
	ldrb r0, [r1, 0x3]
	cmp r0, 0x5
	bhi _08106E10
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _08106E0A
	ldrb r1, [r1, 0x3]
	movs r0, 0
	bl sub_8105594
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r4]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	ldr r1, [r4]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	b _08106E6A
_08106E0A:
	subs r0, 0x1
	strb r0, [r1, 0x2]
	b _08106E6A
_08106E10:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r4]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldr r1, [r4]
	movs r0, 0xB
	b _08106E68
_08106E58:
	ldr r0, _08106E74 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08106E6A
	ldr r1, [r4]
_08106E66:
	movs r0, 0x2
_08106E68:
	strb r0, [r1, 0x1]
_08106E6A:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106E74: .4byte gMain
	thumb_func_end sub_8106BE8

	thumb_func_start sub_8106E78
sub_8106E78: @ 8106E78
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	cmp r1, 0x1
	beq _08106E8E
	cmp r1, 0x1
	bgt _08106EA0
	cmp r1, 0
	bne _08106EA0
	movs r1, 0x8
	b _08106EAE
_08106E8E:
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xF0
	subs r1, r0
	lsrs r1, 1
	b _08106EAE
_08106EA0:
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xE8
	subs r1, r0
_08106EAE:
	lsls r3, r1, 24
	lsrs r3, 24
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_81047C8
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8106E78

	.align 2, 0 @ Don't pad with nop.
