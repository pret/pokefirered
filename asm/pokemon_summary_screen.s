	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_813B20C
sub_813B20C: @ 813B20C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0813B258 @ =gMonSummaryScreen
	ldr r0, [r2]
	ldr r3, _0813B25C @ =0x000032f4
	adds r1, r0, r3
	ldr r7, [r1]
	movs r6, 0
	ldr r1, _0813B260 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B26C
	lsls r0, r4, 24
	asrs r3, r0, 24
	movs r1, 0x1
	negs r1, r1
	adds r5, r0, 0
	ldr r6, _0813B264 @ =gLastViewedMonIndex
	cmp r3, r1
	bne _0813B23E
	ldrb r0, [r6]
	cmp r0, 0
	beq _0813B294
_0813B23E:
	asrs r0, r5, 24
	cmp r0, 0x1
	bne _0813B252
	ldr r0, [r2]
	ldr r2, _0813B268 @ =0x00003210
	adds r0, r2
	ldrb r1, [r6]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0813B294
_0813B252:
	ldrb r0, [r6]
	adds r0, r4
	b _0813B2BC
	.align 2, 0
_0813B258: .4byte gMonSummaryScreen
_0813B25C: .4byte 0x000032f4
_0813B260: .4byte 0x00003214
_0813B264: .4byte gLastViewedMonIndex
_0813B268: .4byte 0x00003210
_0813B26C:
	lsls r5, r4, 24
_0813B26E:
	lsls r0, r6, 24
	asrs r0, 24
	asrs r1, r5, 24
	adds r0, r1
	lsls r0, 24
	ldr r4, _0813B29C @ =gLastViewedMonIndex
	lsrs r6, r0, 24
	asrs r0, 24
	ldrb r3, [r4]
	adds r1, r0, r3
	cmp r1, 0
	blt _0813B294
	ldr r0, _0813B2A0 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r2, _0813B2A4 @ =0x00003210
	adds r0, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _0813B2A8
_0813B294:
	movs r0, 0x1
	negs r0, r0
	b _0813B2C0
	.align 2, 0
_0813B29C: .4byte gLastViewedMonIndex
_0813B2A0: .4byte gMonSummaryScreen
_0813B2A4: .4byte 0x00003210
_0813B2A8:
	movs r0, 0x64
	muls r0, r1
	adds r0, r7, r0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0813B26E
	ldrb r0, [r4]
	adds r0, r6
_0813B2BC:
	lsls r0, 24
	asrs r0, 24
_0813B2C0:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_813B20C

	thumb_func_start sub_813B2C8
sub_813B2C8: @ 813B2C8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0813B2FC
	ldr r0, _0813B2F4 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _0813B2F8 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B2F0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0813B2FC
_0813B2F0:
	movs r0, 0x1
	b _0813B2FE
	.align 2, 0
_0813B2F4: .4byte gMonSummaryScreen
_0813B2F8: .4byte 0x00003214
_0813B2FC:
	movs r0, 0
_0813B2FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_813B2C8

	thumb_func_start sub_813B304
sub_813B304: @ 813B304
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
_0813B30A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0813B33C
	ldr r0, _0813B334 @ =gUnknown_8463FB8
	adds r5, r4, r0
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813B338 @ =gPlayerParty
	adds r0, r1
	bl sub_813B2C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B30A
	movs r0, 0
	ldrsb r0, [r5, r0]
	b _0813B340
	.align 2, 0
_0813B334: .4byte gUnknown_8463FB8
_0813B338: .4byte gPlayerParty
_0813B33C:
	movs r0, 0x1
	negs r0, r0
_0813B340:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813B304

	thumb_func_start sub_813B348
sub_813B348: @ 813B348
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
_0813B34E:
	cmp r4, 0
	beq _0813B380
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813B378 @ =gUnknown_8463FB8
	adds r5, r4, r0
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813B37C @ =gPlayerParty
	adds r0, r1
	bl sub_813B2C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B34E
	movs r0, 0
	ldrsb r0, [r5, r0]
	b _0813B384
	.align 2, 0
_0813B378: .4byte gUnknown_8463FB8
_0813B37C: .4byte gPlayerParty
_0813B380:
	movs r0, 0x1
	negs r0, r0
_0813B384:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_813B348

	thumb_func_start sub_813B38C
sub_813B38C: @ 813B38C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	movs r5, 0
	b _0813B39E
_0813B398:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0813B39E:
	cmp r5, 0x5
	bhi _0813B3B6
	ldr r4, _0813B3D4 @ =gUnknown_8463FB8
	adds r4, r5, r4
	bl GetLastViewedMonIndex
	ldrb r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _0813B398
	adds r6, r5, 0
_0813B3B6:
	lsls r0, r7, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0813B3C6
	cmp r6, 0
	beq _0813B3CE
_0813B3C6:
	cmp r1, 0x1
	bne _0813B3D8
	cmp r6, 0x5
	bne _0813B3E0
_0813B3CE:
	movs r0, 0x1
	negs r0, r0
	b _0813B3EA
	.align 2, 0
_0813B3D4: .4byte gUnknown_8463FB8
_0813B3D8:
	adds r0, r6, 0
	bl sub_813B348
	b _0813B3E6
_0813B3E0:
	adds r0, r6, 0
	bl sub_813B304
_0813B3E6:
	lsls r0, 24
	asrs r0, 24
_0813B3EA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_813B38C

	thumb_func_start sub_813B3F0
sub_813B3F0: @ 813B3F0
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0813B414 @ =gMonSummaryScreen
	ldr r0, [r1]
	ldr r4, _0813B418 @ =0x0000328c
	adds r2, r0, r4
	ldrb r0, [r2]
	adds r5, r1, 0
	cmp r0, 0xB
	bls _0813B40A
	b _0813B73C
_0813B40A:
	lsls r0, 2
	ldr r1, _0813B41C @ =_0813B420
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813B414: .4byte gMonSummaryScreen
_0813B418: .4byte 0x0000328c
_0813B41C: .4byte _0813B420
	.align 2, 0
_0813B420:
	.4byte _0813B450
	.4byte _0813B478
	.4byte _0813B486
	.4byte _0813B4DC
	.4byte _0813B568
	.4byte _0813B5FC
	.4byte _0813B602
	.4byte _0813B620
	.4byte _0813B636
	.4byte _0813B654
	.4byte _0813B678
	.4byte _0813B70C
_0813B450:
	bl StopCryAndClearCrySongs
	ldr r0, _0813B468 @ =gUnknown_203B16D
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0813B46C @ =gUnknown_203B16E
	strb r1, [r0]
	ldr r0, _0813B470 @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r0, _0813B474 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B468: .4byte gUnknown_203B16D
_0813B46C: .4byte gUnknown_203B16E
_0813B470: .4byte gMonSummaryScreen
_0813B474: .4byte 0x0000328c
_0813B478:
	bl sub_8139C80
	bl sub_8139F20
	bl sub_8139D90
	b _0813B724
_0813B486:
	ldr r0, [r5]
	ldr r4, _0813B4D0 @ =0x00003290
	adds r0, r4
	bl sub_8138B8C
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x2D
	bl GetMonData
	ldr r1, [r5]
	movs r2, 0xC8
	lsls r2, 6
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x4
	bl GetMonData
	ldr r1, [r5]
	ldr r2, _0813B4D4 @ =0x00003204
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r2, r0, r2
	ldrb r1, [r2]
	cmp r1, 0x1
	bne _0813B4C6
	subs r4, 0x90
	adds r0, r4
	strb r1, [r0]
_0813B4C6:
	ldr r1, [r5]
	ldr r0, _0813B4D8 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B4D0: .4byte 0x00003290
_0813B4D4: .4byte 0x00003204
_0813B4D8: .4byte 0x0000328c
_0813B4DC:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r4, _0813B52C @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813B530 @ =0x00003290
	adds r0, r1
	bl IsMonShiny
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B538
	ldr r0, [r4]
	movs r2, 0xC8
	lsls r2, 6
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B538
	ldr r4, _0813B534 @ =gUnknown_8E9B3D0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	subs r4, 0x20
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	b _0813B550
	.align 2, 0
_0813B52C: .4byte gMonSummaryScreen
_0813B530: .4byte 0x00003290
_0813B534: .4byte gUnknown_8E9B3D0
_0813B538:
	ldr r4, _0813B55C @ =gUnknown_8E9B310
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	adds r4, 0x20
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
_0813B550:
	ldr r0, _0813B560 @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r4, _0813B564 @ =0x0000328c
	adds r1, r4
	b _0813B72C
	.align 2, 0
_0813B55C: .4byte gUnknown_8E9B310
_0813B560: .4byte gMonSummaryScreen
_0813B564: .4byte 0x0000328c
_0813B568:
	ldr r4, _0813B5A8 @ =gMonSummaryScreen
	ldr r1, [r4]
	ldr r2, _0813B5AC @ =0x00003214
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B5DC
	subs r2, 0x14
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0813B5B8
	adds r2, 0x3C
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _0813B5B0 @ =gUnknown_8E9BBCC
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r0, [r4]
	movs r4, 0xC9
	lsls r4, 6
	adds r0, r4
	ldrb r0, [r0]
	ldr r1, _0813B5B4 @ =gUnknown_8E9B750
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	b _0813B5DC
	.align 2, 0
_0813B5A8: .4byte gMonSummaryScreen
_0813B5AC: .4byte 0x00003214
_0813B5B0: .4byte gUnknown_8E9BBCC
_0813B5B4: .4byte gUnknown_8E9B750
_0813B5B8:
	ldr r2, _0813B5E8 @ =0x0000323c
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r1, _0813B5EC @ =gUnknown_8E9B598
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	ldr r0, [r4]
	movs r4, 0xC9
	lsls r4, 6
	adds r0, r4
	ldrb r0, [r0]
	ldr r1, _0813B5F0 @ =gUnknown_8E9B750
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
_0813B5DC:
	ldr r0, _0813B5F4 @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r0, _0813B5F8 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B5E8: .4byte 0x0000323c
_0813B5EC: .4byte gUnknown_8E9B598
_0813B5F0: .4byte gUnknown_8E9B750
_0813B5F4: .4byte gMonSummaryScreen
_0813B5F8: .4byte 0x0000328c
_0813B5FC:
	bl sub_81360D4
	b _0813B724
_0813B602:
	ldr r0, [r5]
	movs r4, 0xC8
	lsls r4, 6
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B614
	bl sub_8136350
_0813B614:
	ldr r1, [r5]
	ldr r0, _0813B61C @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B61C: .4byte 0x0000328c
_0813B620:
	ldr r0, [r5]
	movs r1, 0xC8
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813B632
	bl sub_81367B0
_0813B632:
	ldr r1, [r5]
	b _0813B728
_0813B636:
	bl sub_8136F4C
	bl sub_81374E8
	bl sub_8137BD0
	ldr r0, _0813B64C @ =gMonSummaryScreen
	ldr r1, [r0]
	ldr r4, _0813B650 @ =0x0000328c
	adds r1, r4
	b _0813B72C
	.align 2, 0
_0813B64C: .4byte gMonSummaryScreen
_0813B650: .4byte 0x0000328c
_0813B654:
	bl sub_8138A38
	bl sub_8138538
	ldr r4, _0813B670 @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r1, _0813B674 @ =0x00003214
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8137D28
	ldr r1, [r4]
	b _0813B728
	.align 2, 0
_0813B670: .4byte gMonSummaryScreen
_0813B674: .4byte 0x00003214
_0813B678:
	ldr r0, [r5]
	movs r4, 0xC0
	lsls r4, 6
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	ldr r1, _0813B6F8 @ =0x00003001
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	ldr r2, _0813B6FC @ =0x00003002
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	adds r4, 0x6
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	ldr r1, _0813B700 @ =0x00003003
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	ldr r2, _0813B704 @ =0x00003004
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r5]
	subs r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r1, [r5]
	ldr r0, _0813B708 @ =0x0000328c
	adds r1, r0
	b _0813B72C
	.align 2, 0
_0813B6F8: .4byte 0x00003001
_0813B6FC: .4byte 0x00003002
_0813B700: .4byte 0x00003003
_0813B704: .4byte 0x00003004
_0813B708: .4byte 0x0000328c
_0813B70C:
	bl Overworld_LinkRecvQueueLengthMoreThan2
	cmp r0, 0
	bne _0813B746
	bl sub_800B270
	cmp r0, 0
	bne _0813B746
	bl sub_813AFC4
	bl sub_813B784
_0813B724:
	ldr r0, _0813B734 @ =gMonSummaryScreen
	ldr r1, [r0]
_0813B728:
	ldr r2, _0813B738 @ =0x0000328c
	adds r1, r2
_0813B72C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0813B746
	.align 2, 0
_0813B734: .4byte gMonSummaryScreen
_0813B738: .4byte 0x0000328c
_0813B73C:
	movs r0, 0
	strb r0, [r2]
	adds r0, r3, 0
	bl DestroyTask
_0813B746:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B3F0

	thumb_func_start sub_813B750
sub_813B750: @ 813B750
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0x80
	lsls r5, 7
	movs r0, 0
	adds r1, r5, 0
	bl ClearGpuRegBits
	cmp r4, 0x2
	bgt _0813B77E
	cmp r4, 0
	blt _0813B77E
	movs r0, 0
	bl GetGpuReg
	adds r1, r5, 0
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	bl SetGpuReg
_0813B77E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B750

	thumb_func_start sub_813B784
sub_813B784: @ 813B784
	push {r4,r5,lr}
	ldr r4, _0813B7BC @ =gMonSummaryScreen
	ldr r0, [r4]
	ldr r5, _0813B7C0 @ =0x00003290
	adds r0, r5
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0813B7DA
	ldr r0, [r4]
	adds r0, r5
	bl ShouldPlayNormalPokeCry
	cmp r0, 0x1
	bne _0813B7C4
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0
	bl PlayCry3
	b _0813B7DA
	.align 2, 0
_0813B7BC: .4byte gMonSummaryScreen
_0813B7C0: .4byte 0x00003290
_0813B7C4:
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0xB
	bl PlayCry3
_0813B7DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B784

	thumb_func_start sub_813B7E0
sub_813B7E0: @ 813B7E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	beq _0813B7EE
	cmp r0, 0x15
	bne _0813B7F2
_0813B7EE:
	movs r0, 0x1
	b _0813B7F4
_0813B7F2:
	movs r0, 0
_0813B7F4:
	pop {r1}
	bx r1
	thumb_func_end sub_813B7E0

	thumb_func_start sub_813B7F8
sub_813B7F8: @ 813B7F8
	push {lr}
	ldr r0, _0813B828 @ =gMonSummaryScreen
	ldr r0, [r0]
	ldr r1, _0813B82C @ =0x00003290
	adds r0, r1
	movs r1, 0x25
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFC
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _0813B824
	cmp r1, 0x2
	beq _0813B824
	cmp r1, 0x1
	beq _0813B824
	cmp r1, 0x3
	bne _0813B830
_0813B824:
	movs r0, 0x1
	b _0813B832
	.align 2, 0
_0813B828: .4byte gMonSummaryScreen
_0813B82C: .4byte 0x00003290
_0813B830:
	movs r0, 0
_0813B832:
	pop {r1}
	bx r1
	thumb_func_end sub_813B7F8

	thumb_func_start sub_813B838
sub_813B838: @ 813B838
	push {lr}
	lsls r0, 24
	movs r1, 0xA8
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x6C
	bls _0813B84C
	movs r0, 0
	b _0813B84E
_0813B84C:
	movs r0, 0x1
_0813B84E:
	pop {r1}
	bx r1
	thumb_func_end sub_813B838

	thumb_func_start sub_813B854
sub_813B854: @ 813B854
	push {lr}
	sub sp, 0x4
	ldr r3, _0813B86C @ =CB2_ReturnToField
	movs r0, 0
	str r0, [sp]
	movs r1, 0
	movs r2, 0
	bl ShowPokemonSummaryScreen
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813B86C: .4byte CB2_ReturnToField
	thumb_func_end sub_813B854

	.align 2, 0 @ Don't pad with nop.
