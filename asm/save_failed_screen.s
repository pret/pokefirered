	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F5350
sub_80F5350: @ 80F5350
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x24]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r7, r5, 16
	lsrs r0, r2, 24
	adds r2, r0, r4
	cmp r0, r2
	bge _080F53B6
	mov r12, r2
	ldr r1, _080F53C8 @ =gDecompressionBuffer + 0x3800
	mov r10, r1
_080F5386:
	mov r4, r9
	mov r2, r8
	adds r1, r4, r2
	adds r3, r0, 0x1
	cmp r4, r1
	bge _080F53AE
	lsls r2, r0, 6
	mov r5, r10
_080F5396:
	lsls r0, r4, 1
	adds r0, r2, r0
	adds r0, r5
	strh r6, [r0]
	adds r0, r6, r7
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r1
	blt _080F5396
_080F53AE:
	lsls r0, r3, 16
	lsrs r0, 16
	cmp r0, r12
	blt _080F5386
_080F53B6:
	bl sub_80F5318
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F53C8: .4byte gDecompressionBuffer + 0x3800
	thumb_func_end sub_80F5350

	thumb_func_start sub_80F53CC
sub_80F53CC: @ 80F53CC
	push {lr}
	sub sp, 0x8
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x5
	movs r3, 0x1C
	bl sub_80F5350
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_80F53CC

	thumb_func_start sub_80F53E8
sub_80F53E8: @ 80F53E8
	push {lr}
	sub sp, 0x8
	movs r0, 0x14
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1E
	bl sub_80F5350
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_80F53E8

	thumb_func_start sub_80F5404
sub_80F5404: @ 80F5404
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x3
	bl GenerateFontHalfRowLookupTable
	add r1, sp, 0xC
	ldr r2, _080F544C @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080F5450 @ =gDecompressionBuffer + 0x020
	ldr r2, _080F5454 @ =0x01001180
	adds r0, r1, 0
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1C
	str r0, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	movs r0, 0x2
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl HelpSystemRenderText
	bl sub_80F5334
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F544C: .4byte 0x00001111
_080F5450: .4byte gDecompressionBuffer + 0x020
_080F5454: .4byte 0x01001180
	thumb_func_end sub_80F5404

	thumb_func_start sub_80F5458
sub_80F5458: @ 80F5458
	push {r4,r5,lr}
	movs r5, 0
	ldr r0, _080F5490 @ =gDamagedSaveSectors
	ldr r1, [r0]
	adds r4, r0, 0
	cmp r1, 0
	beq _080F548C
_080F5466:
	ldr r0, [r4]
	bl sub_80F5540
	cmp r0, 0
	bne _080F5498
	ldr r0, _080F5494 @ =gUnknown_203AB4C
	ldrb r0, [r0]
	bl HandleSavingData
	adds r5, 0x1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F548C
	ldr r4, _080F5490 @ =gDamagedSaveSectors
	cmp r5, 0x2
	ble _080F5466
	ldr r0, [r4]
	cmp r0, 0
	bne _080F5498
_080F548C:
	movs r0, 0x1
	b _080F549A
	.align 2, 0
_080F5490: .4byte gDamagedSaveSectors
_080F5494: .4byte gUnknown_203AB4C
_080F5498:
	movs r0, 0
_080F549A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5458

	thumb_func_start VerifySectorWipe
VerifySectorWipe: @ 80F54A0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080F54C4 @ =gSaveDataBuffer
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	adds r2, r4, 0
	bl ReadFlash
	movs r1, 0
	ldr r2, _080F54C8 @ =0x000003ff
_080F54B8:
	ldr r0, [r4]
	cmp r0, 0
	beq _080F54CC
	movs r0, 0x1
	b _080F54DA
	.align 2, 0
_080F54C4: .4byte gSaveDataBuffer
_080F54C8: .4byte 0x000003ff
_080F54CC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, 0x4
	cmp r1, r2
	bls _080F54B8
	movs r0, 0
_080F54DA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VerifySectorWipe

	thumb_func_start WipeSector
WipeSector: @ 80F54E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0
	lsls r6, r7, 16
	ldr r1, _080F5538 @ =ProgramFlashByte
	mov r9, r1
	ldr r1, _080F553C @ =0x00000fff
	mov r8, r1
_080F54F6:
	movs r4, 0
	adds r5, r0, 0x1
_080F54FA:
	mov r0, r9
	ldr r3, [r0]
	lsrs r0, r6, 16
	adds r1, r4, 0
	movs r2, 0
	bl _call_via_r3
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bls _080F54FA
	adds r0, r7, 0
	bl VerifySectorWipe
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r0, r5, 16
	lsrs r0, 16
	cmp r1, 0
	beq _080F5528
	cmp r0, 0x81
	bls _080F54F6
_080F5528:
	adds r0, r1, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F5538: .4byte ProgramFlashByte
_080F553C: .4byte 0x00000fff
	thumb_func_end WipeSector

	thumb_func_start sub_80F5540
sub_80F5540: @ 80F5540
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r6, 0
_080F5546:
	movs r4, 0x1
	lsls r4, r6
	adds r0, r5, 0
	ands r0, r4
	cmp r0, 0
	beq _080F555E
	adds r0, r6, 0
	bl WipeSector
	cmp r0, 0
	bne _080F555E
	bics r5, r4
_080F555E:
	adds r6, 0x1
	cmp r6, 0x1F
	ble _080F5546
	cmp r5, 0
	beq _080F556C
	movs r0, 0x1
	b _080F556E
_080F556C:
	movs r0, 0
_080F556E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5540

	.align 2, 0 @ Don't pad with nop.
