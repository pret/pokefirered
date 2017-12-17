	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80984D8
sub_80984D8: @ 80984D8
	push {r4,lr}
	movs r2, 0
	ldr r4, _080984F8 @ =gUnknown_2039878
	movs r3, 0xFF
_080984E0:
	adds r0, r2, r4
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xB
	bls _080984E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080984F8: .4byte gUnknown_2039878
	thumb_func_end sub_80984D8

	thumb_func_start sub_80984FC
sub_80984FC: @ 80984FC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08098520 @ =gUnknown_83D41FC
	movs r1, 0x28
	movs r2, 0x44
	movs r3, 0
	bl CreateSprite
	ldr r1, _08098524 @ =gUnknown_2039878
	strb r0, [r1]
	adds r0, r4, 0
	bl sub_8098528
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098520: .4byte gUnknown_83D41FC
_08098524: .4byte gUnknown_2039878
	thumb_func_end sub_80984FC

	thumb_func_start sub_8098528
sub_8098528: @ 8098528
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08098550 @ =gUnknown_2039878
	ldrb r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _08098554 @ =gUnknown_202063C
	adds r0, r2
	ldr r2, _08098558 @ =0x0000fffb
	strh r2, [r0, 0x26]
	ldr r2, _0809855C @ =sub_8098560
	str r2, [r0, 0x1C]
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_08098550: .4byte gUnknown_2039878
_08098554: .4byte gUnknown_202063C
_08098558: .4byte 0x0000fffb
_0809855C: .4byte sub_8098560
	thumb_func_end sub_8098528

	thumb_func_start sub_8098560
sub_8098560: @ 8098560
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x26]
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08098574
	adds r0, r2, 0x1
	strh r0, [r1, 0x26]
	b _08098578
_08098574:
	ldr r0, _0809857C @ =nullsub_8
	str r0, [r1, 0x1C]
_08098578:
	pop {r0}
	bx r0
	.align 2, 0
_0809857C: .4byte nullsub_8
	thumb_func_end sub_8098560

	thumb_func_start sub_8098580
sub_8098580: @ 8098580
	push {r4,lr}
	ldr r0, _080985B0 @ =gUnknown_2039878
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080985B4 @ =gUnknown_202063C
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080985AA
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _080985B8 @ =sub_80985BC
	str r0, [r4, 0x1C]
_080985AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080985B0: .4byte gUnknown_2039878
_080985B4: .4byte gUnknown_202063C
_080985B8: .4byte sub_80985BC
	thumb_func_end sub_8098580

	thumb_func_start sub_80985BC
sub_80985BC: @ 80985BC
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080985D8
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _080985E0 @ =nullsub_8
	str r0, [r4, 0x1C]
_080985D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080985E0: .4byte nullsub_8
	thumb_func_end sub_80985BC

	thumb_func_start sub_80985E4
sub_80985E4: @ 80985E4
	push {r4-r7,lr}
	ldr r7, _08098620 @ =gUnknown_2039879
	movs r5, 0
	ldr r6, _08098624 @ =gUnknown_202063C
_080985EC:
	lsls r1, r5, 20
	movs r0, 0xC0
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	ldr r0, _08098628 @ =gUnknown_83D4250
	movs r2, 0x7
	movs r3, 0
	bl CreateSprite
	adds r1, r7, r5
	strb r0, [r1]
	adds r4, r1, 0
	cmp r5, 0
	beq _0809863C
	cmp r5, 0x8
	bne _0809862C
	ldrb r1, [r7, 0x8]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	bl StartSpriteAnim
	b _0809863C
	.align 2, 0
_08098620: .4byte gUnknown_2039879
_08098624: .4byte gUnknown_202063C
_08098628: .4byte gUnknown_83D4250
_0809862C:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	bl StartSpriteAnim
_0809863C:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x8
	bls _080985EC
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80985E4

	thumb_func_start sub_8098660
sub_8098660: @ 8098660
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _080986A0 @ =gUnknown_2039879
	movs r3, 0
	ldr r6, _080986A4 @ =gUnknown_202063C
	movs r1, 0x1
	ands r0, r1
	lsls r4, r0, 2
	movs r5, 0x5
	negs r5, r5
_08098676:
	adds r0, r7, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x8
	bls _08098676
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080986A0: .4byte gUnknown_2039879
_080986A4: .4byte gUnknown_202063C
	thumb_func_end sub_8098660

	thumb_func_start sub_80986A8
sub_80986A8: @ 80986A8
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r7, _080986E4 @ =gUnknown_2039879
	movs r3, 0
	ldr r4, _080986E8 @ =gUnknown_202063C
	adds r5, r1, 0x7
_080986BA:
	adds r2, r7, r3
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r6, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x22]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x8
	bls _080986BA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080986E4: .4byte gUnknown_2039879
_080986E8: .4byte gUnknown_202063C
	thumb_func_end sub_80986A8

	thumb_func_start sub_80986EC
sub_80986EC: @ 80986EC
	push {r4,r5,lr}
	ldr r5, _08098714 @ =gUnknown_2039884
	movs r0, 0x90
	lsls r0, 1
	bl Alloc
	str r0, [r5]
	cmp r0, 0
	beq _08098722
	ldr r4, _08098718 @ =gUnknown_2039888
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r4]
	cmp r0, 0
	beq _0809871C
	movs r0, 0x1
	b _08098724
	.align 2, 0
_08098714: .4byte gUnknown_2039884
_08098718: .4byte gUnknown_2039888
_0809871C:
	ldr r0, [r5]
	bl Free
_08098722:
	movs r0, 0
_08098724:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80986EC

	thumb_func_start sub_809872C
sub_809872C: @ 809872C
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r4, 0
_08098734:
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 5
	adds r0, r6, r0
	lsls r1, r4, 7
	adds r1, r5, r1
	movs r2, 0x30
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08098734
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_809872C

	thumb_func_start sub_8098758
sub_8098758: @ 8098758
	push {r4-r7,lr}
	sub sp, 0x28
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r7, r2, 16
	bl sub_80986EC
	lsls r0, 24
	cmp r0, 0
	beq _08098810
	adds r0, r7, 0
	movs r1, 0
	bl sub_8098974
	ldr r2, _080987FC @ =gUnknown_2039884
	ldr r1, [r2]
	bl LZDecompressWram
	ldr r1, _080987FC @ =gUnknown_2039884
	ldr r0, [r1]
	ldr r2, _08098800 @ =gUnknown_2039888
	ldr r1, [r2]
	bl sub_809872C
	ldr r1, _08098800 @ =gUnknown_2039888
	ldr r0, [r1]
	str r0, [sp, 0x18]
	ldr r4, _08098804 @ =0xffff0000
	add r0, sp, 0x18
	ldr r1, [r0, 0x4]
	ands r1, r4
	movs r2, 0x80
	lsls r2, 2
	orrs r1, r2
	lsls r3, r6, 16
	ldr r2, _08098808 @ =0x0000ffff
	ands r1, r2
	orrs r1, r3
	str r1, [r0, 0x4]
	bl LoadSpriteSheet
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_8098974
	str r0, [sp, 0x20]
	add r0, sp, 0x20
	ldr r1, [r0, 0x4]
	ands r1, r4
	orrs r1, r5
	str r1, [r0, 0x4]
	bl LoadCompressedObjectPalette
	ldr r0, _0809880C @ =gUnknown_83D427C
	mov r1, sp
	movs r2, 0xC
	bl CpuSet
	mov r0, sp
	strh r6, [r0]
	strh r5, [r0, 0x2]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _080987FC @ =gUnknown_2039884
	ldr r0, [r2]
	bl Free
	ldr r1, _08098800 @ =gUnknown_2039888
	ldr r0, [r1]
	bl Free
	adds r0, r4, 0
	b _08098812
	.align 2, 0
_080987FC: .4byte gUnknown_2039884
_08098800: .4byte gUnknown_2039888
_08098804: .4byte 0xffff0000
_08098808: .4byte 0x0000ffff
_0809880C: .4byte gUnknown_83D427C
_08098810:
	movs r0, 0x40
_08098812:
	add sp, 0x28
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8098758

	thumb_func_start sub_809881C
sub_809881C: @ 809881C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 16
	lsrs r7, r3, 16
	bl sub_80986EC
	lsls r0, 24
	cmp r0, 0
	beq _080988D8
	adds r0, r7, 0
	movs r1, 0
	bl sub_8098974
	ldr r2, _080988C8 @ =gUnknown_2039884
	ldr r1, [r2]
	bl LZDecompressWram
	ldr r1, _080988C8 @ =gUnknown_2039884
	ldr r0, [r1]
	ldr r2, _080988CC @ =gUnknown_2039888
	ldr r1, [r2]
	bl sub_809872C
	ldr r1, _080988CC @ =gUnknown_2039888
	ldr r0, [r1]
	str r0, [sp, 0x18]
	ldr r4, _080988D0 @ =0xffff0000
	add r0, sp, 0x18
	ldr r1, [r0, 0x4]
	ands r1, r4
	movs r2, 0x80
	lsls r2, 2
	orrs r1, r2
	lsls r3, r6, 16
	ldr r2, _080988D4 @ =0x0000ffff
	ands r1, r2
	orrs r1, r3
	str r1, [r0, 0x4]
	bl LoadSpriteSheet
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_8098974
	str r0, [sp, 0x20]
	add r0, sp, 0x20
	ldr r1, [r0, 0x4]
	ands r1, r4
	orrs r1, r5
	str r1, [r0, 0x4]
	bl LoadCompressedObjectPalette
	mov r0, r8
	mov r1, sp
	movs r2, 0xC
	bl CpuSet
	mov r0, sp
	strh r6, [r0]
	strh r5, [r0, 0x2]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _080988C8 @ =gUnknown_2039884
	ldr r0, [r2]
	bl Free
	ldr r1, _080988CC @ =gUnknown_2039888
	ldr r0, [r1]
	bl Free
	adds r0, r4, 0
	b _080988DA
	.align 2, 0
_080988C8: .4byte gUnknown_2039884
_080988CC: .4byte gUnknown_2039888
_080988D0: .4byte 0xffff0000
_080988D4: .4byte 0x0000ffff
_080988D8:
	movs r0, 0x40
_080988DA:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809881C

	thumb_func_start sub_80988E8
sub_80988E8: @ 80988E8
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08098938 @ =gUnknown_2039882
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, 0xFF
	bne _08098932
	adds r4, r1, 0
	adds r4, 0x66
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8098758
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08098932
	strb r2, [r5]
	ldr r1, _0809893C @ =gUnknown_202063C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x18
	strh r1, [r0, 0x24]
	movs r1, 0x8C
	strh r1, [r0, 0x26]
_08098932:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098938: .4byte gUnknown_2039882
_0809893C: .4byte gUnknown_202063C
	thumb_func_end sub_80988E8

	thumb_func_start sub_8098940
sub_8098940: @ 8098940
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809896C @ =gUnknown_2039882
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08098964
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08098970 @ =gUnknown_202063C
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0xFF
	strb r0, [r4]
_08098964:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809896C: .4byte gUnknown_2039882
_08098970: .4byte gUnknown_202063C
	thumb_func_end sub_8098940

	thumb_func_start sub_8098974
sub_8098974: @ 8098974
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08098998 @ =0x00000177
	cmp r3, r0
	bls _08098986
	movs r3, 0
_08098986:
	ldr r2, _0809899C @ =gUnknown_83D4294
	lsls r0, r1, 2
	lsls r1, r3, 3
	adds r0, r1
	adds r0, r2
	ldr r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08098998: .4byte 0x00000177
_0809899C: .4byte gUnknown_83D4294
	thumb_func_end sub_8098974

	thumb_func_start sub_80989A0
sub_80989A0: @ 80989A0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080989F0 @ =gUnknown_2039882
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, 0xFF
	bne _080989EA
	adds r4, r1, 0
	adds r4, 0x66
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8098758
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080989EA
	strb r2, [r5]
	ldr r1, _080989F4 @ =gUnknown_202063C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x18
	strh r1, [r0, 0x24]
	movs r1, 0x93
	strh r1, [r0, 0x26]
_080989EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080989F0: .4byte gUnknown_2039882
_080989F4: .4byte gUnknown_202063C
	thumb_func_end sub_80989A0

	.align 2, 0 @ Don't pad with nop.
