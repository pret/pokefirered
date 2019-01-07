	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	thumb_func_start sub_8059948
sub_8059948: @ 8059948
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _08059968 @ =gUnknown_2036E28
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0805996C
	cmp r0, 0x1
	ble _080599B8
	cmp r0, 0x2
	beq _08059980
	cmp r0, 0x3
	beq _08059994
	b _080599B8
	.align 2, 0
_08059968: .4byte gUnknown_2036E28
_0805996C:
	lsls r4, 5
	ldr r0, _0805997C @ =gPlttBufferUnfaded
	adds r0, r4, r0
	lsls r1, r6, 4
	bl TintPalette_GrayScale
	b _080599AA
	.align 2, 0
_0805997C: .4byte gPlttBufferUnfaded
_08059980:
	lsls r4, 5
	ldr r0, _08059990 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	lsls r1, r6, 4
	bl TintPalette_SepiaTone
	b _080599AA
	.align 2, 0
_08059990: .4byte gPlttBufferUnfaded
_08059994:
	lsls r0, r4, 4
	lsls r5, r6, 4
	adds r1, r5, 0
	bl sub_8111F38
	lsls r4, 5
	ldr r0, _080599C0 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	adds r1, r5, 0
	bl TintPalette_GrayScale
_080599AA:
	ldr r0, _080599C0 @ =gPlttBufferUnfaded
	adds r0, r4, r0
	ldr r1, _080599C4 @ =gPlttBufferFaded
	adds r1, r4, r1
	lsls r2, r6, 3
	bl CpuFastSet
_080599B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080599C0: .4byte gPlttBufferUnfaded
_080599C4: .4byte gPlttBufferFaded
	thumb_func_end sub_8059948

	thumb_func_start apply_map_tileset_palette
apply_map_tileset_palette: @ 80599C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	mov r8, r5
	lsls r6, r2, 16
	lsrs r7, r6, 16
	adds r2, r7, 0
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	cmp r4, 0
	beq _08059A46
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08059A1C
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x2
	bl LoadPalette
	ldr r0, [r4, 0x8]
	adds r0, 0x2
	adds r5, 0x1
	lsls r5, 16
	lsrs r5, 16
	subs r4, r7, 0x2
	lsls r2, r4, 16
	lsrs r2, 16
	adds r1, r5, 0
	bl LoadPalette
	lsls r4, 15
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80598CC
	b _08059A46
_08059A1C:
	cmp r0, 0x1
	bne _08059A36
	ldr r0, [r4, 0x8]
	adds r0, 0xE0
	adds r1, r5, 0
	adds r2, r7, 0
	bl LoadPalette
	lsrs r1, r6, 17
	adds r0, r5, 0
	bl sub_80598CC
	b _08059A46
_08059A36:
	ldr r0, [r4, 0x8]
	mov r1, r8
	bl LoadCompressedPalette
	lsrs r1, r6, 17
	mov r0, r8
	bl sub_80598CC
_08059A46:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset_palette

	thumb_func_start sub_8059A54
sub_8059A54: @ 8059A54
	push {lr}
	ldr r0, [r0, 0x10]
	movs r1, 0xA0
	lsls r1, 2
	movs r2, 0
	bl copy_tileset_patterns_to_vram
	pop {r0}
	bx r0
	thumb_func_end sub_8059A54

	thumb_func_start sub_8059A68
sub_8059A68: @ 8059A68
	push {lr}
	ldr r0, [r0, 0x14]
	movs r1, 0xC0
	lsls r1, 1
	movs r2, 0xA0
	lsls r2, 2
	bl copy_tileset_patterns_to_vram
	pop {r0}
	bx r0
	thumb_func_end sub_8059A68

	thumb_func_start copy_map_tileset2_to_vram_2
copy_map_tileset2_to_vram_2: @ 8059A7C
	push {lr}
	ldr r0, [r0, 0x14]
	movs r1, 0xC0
	lsls r1, 1
	movs r2, 0xA0
	lsls r2, 2
	bl copy_tileset_patterns_to_vram2
	pop {r0}
	bx r0
	thumb_func_end copy_map_tileset2_to_vram_2

	thumb_func_start sub_8059A90
sub_8059A90: @ 8059A90
	push {lr}
	ldr r0, [r0, 0x10]
	movs r1, 0
	movs r2, 0xE0
	bl apply_map_tileset_palette
	pop {r0}
	bx r0
	thumb_func_end sub_8059A90

	thumb_func_start sub_8059AA0
sub_8059AA0: @ 8059AA0
	push {lr}
	ldr r0, [r0, 0x14]
	movs r1, 0x70
	movs r2, 0xC0
	bl apply_map_tileset_palette
	pop {r0}
	bx r0
	thumb_func_end sub_8059AA0

	thumb_func_start copy_map_tileset1_tileset2_to_vram
copy_map_tileset1_tileset2_to_vram: @ 8059AB0
	push {r4,r5,lr}
	adds r5, r0, 0
	cmp r5, 0
	beq _08059AD2
	ldr r0, [r5, 0x10]
	movs r4, 0xA0
	lsls r4, 2
	adds r1, r4, 0
	movs r2, 0
	bl copy_tileset_patterns_to_vram2
	ldr r0, [r5, 0x14]
	movs r1, 0xC0
	lsls r1, 1
	adds r2, r4, 0
	bl copy_tileset_patterns_to_vram2
_08059AD2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end copy_map_tileset1_tileset2_to_vram

	thumb_func_start apply_map_tileset1_tileset2_palette
apply_map_tileset1_tileset2_palette: @ 8059AD8
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08059AEA
	bl sub_8059A90
	adds r0, r4, 0
	bl sub_8059AA0
_08059AEA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_tileset2_palette

	.align 2, 0 @ Don't pad with nop.
