	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815AB94
sub_815AB94: @ 815AB94
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_815AB94

	thumb_func_start sub_815ABB0
sub_815ABB0: @ 815ABB0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_815ABB0

	thumb_func_start sub_815ABC4
sub_815ABC4: @ 815ABC4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r3, _0815ABF4 @ =gUnknown_203F444
	movs r4, 0
	strb r2, [r3, 0x4]
	str r1, [r3]
	cmp r2, 0
	bne _0815ABE0
	movs r0, 0
	strh r4, [r3, 0x6]
	strh r4, [r3, 0x8]
	strb r0, [r3, 0x5]
_0815ABE0:
	cmp r2, 0x1
	bne _0815ABE6
	strb r4, [r3, 0x4]
_0815ABE6:
	ldr r0, _0815ABF8 @ =sub_815AC2C
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815ABF4: .4byte gUnknown_203F444
_0815ABF8: .4byte sub_815AC2C
	thumb_func_end sub_815ABC4

	thumb_func_start sub_815ABFC
sub_815ABFC: @ 815ABFC
	push {lr}
	ldr r1, _0815AC10 @ =gUnknown_203F444
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	bne _0815AC14
	ldr r1, [r1]
	movs r0, 0x1
	bl sub_815ABC4
	b _0815AC1C
	.align 2, 0
_0815AC10: .4byte gUnknown_203F444
_0815AC14:
	ldr r1, [r1]
	movs r0, 0x2
	bl sub_815ABC4
_0815AC1C:
	pop {r0}
	bx r0
	thumb_func_end sub_815ABFC

	thumb_func_start sub_815AC20
sub_815AC20: @ 815AC20
	ldr r1, _0815AC28 @ =gUnknown_203F444
	movs r0, 0x1
	strb r0, [r1, 0x4]
	bx lr
	.align 2, 0
_0815AC28: .4byte gUnknown_203F444
	thumb_func_end sub_815AC20

	thumb_func_start sub_815AC2C
sub_815AC2C: @ 815AC2C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _0815AC44 @ =gUnknown_30030F0
	movs r1, 0x87
	lsls r1, 3
	adds r6, r0, r1
	ldrb r5, [r6]
	cmp r5, 0
	beq _0815AC48
	cmp r5, 0x1
	beq _0815AC9C
	b _0815AD6E
	.align 2, 0
_0815AC44: .4byte gUnknown_30030F0
_0815AC48:
	ldr r4, _0815AC90 @ =gUnknown_203F450
	ldr r0, _0815AC94 @ =0x00004008
	bl AllocZeroed
	str r0, [r4]
	str r5, [r0]
	ldr r1, _0815AC98 @ =0x00004006
	adds r0, r1
	strb r5, [r0]
	ldr r0, [r4]
	adds r1, 0x1
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	bl sub_80BF768
	bl clear_scheduled_bg_copies_to_vram
	bl remove_some_task
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl sub_815AD88
	bl sub_815AE38
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _0815AD6E
	.align 2, 0
_0815AC90: .4byte gUnknown_203F450
_0815AC94: .4byte 0x00004008
_0815AC98: .4byte 0x00004006
_0815AC9C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0815AD6E
	bl sub_815AEB8
	bl sub_815AFEC
	ldr r0, _0815ACE0 @ =gUnknown_203F444
	ldrb r0, [r0, 0x4]
	cmp r0, 0x2
	bne _0815ACEC
	ldr r0, _0815ACE4 @ =sub_815BA54
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_815B014
	ldr r2, _0815ACE8 @ =gUnknown_3005090
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xA]
	adds r0, r5, 0
	bl sub_815B118
	b _0815AD26
	.align 2, 0
_0815ACE0: .4byte gUnknown_203F444
_0815ACE4: .4byte sub_815BA54
_0815ACE8: .4byte gUnknown_3005090
_0815ACEC:
	ldr r0, _0815AD78 @ =sub_815B2C0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_815AEE8
	ldr r1, _0815AD7C @ =gUnknown_3005090
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	bl sub_815B014
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	bl sub_815AF5C
	movs r0, 0xAD
	lsls r0, 1
	bl PlayNewMapMusic
	bl sub_815B094
_0815AD26:
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x3
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x9
	bl sub_812B1E0
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
	ldr r0, _0815AD80 @ =sub_815ABB0
	bl SetVBlankCallback
	ldr r0, _0815AD84 @ =sub_815AB94
	bl SetMainCallback2
_0815AD6E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815AD78: .4byte sub_815B2C0
_0815AD7C: .4byte gUnknown_3005090
_0815AD80: .4byte sub_815ABB0
_0815AD84: .4byte sub_815AB94
	thumb_func_end sub_815AC2C

	thumb_func_start sub_815AD88
sub_815AD88: @ 815AD88
	push {r4,lr}
	bl sub_80BF7C8
	movs r0, 0
	bl sub_8001618
	ldr r1, _0815AE20 @ =gUnknown_84792E0
	movs r0, 0
	movs r2, 0x4
	bl sub_8001658
	ldr r4, _0815AE24 @ =gUnknown_203F450
	ldr r1, [r4]
	adds r1, 0x4
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0815AE28 @ =0x00001004
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0815AE2C @ =0x00002004
	adds r1, r0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	movs r1, 0xC1
	lsls r1, 6
	movs r0, 0
	bl SetGpuReg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x3
	movs r2, 0x2
	bl ChangeBgX
	movs r1, 0xA0
	lsls r1, 6
	movs r0, 0x3
	movs r2, 0x1
	bl ChangeBgY
	ldr r0, [r4]
	ldr r1, _0815AE30 @ =0x00004004
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _0815AE34 @ =0x00004005
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815AE20: .4byte gUnknown_84792E0
_0815AE24: .4byte gUnknown_203F450
_0815AE28: .4byte 0x00001004
_0815AE2C: .4byte 0x00002004
_0815AE30: .4byte 0x00004004
_0815AE34: .4byte 0x00004005
	thumb_func_end sub_815AD88

	thumb_func_start sub_815AE38
sub_815AE38: @ 815AE38
	push {r4,lr}
	sub sp, 0x8
	movs r4, 0
	add r0, sp, 0x4
	strh r4, [r0]
	bl reset_temp_tile_data_buffers
	ldr r1, _0815AE98 @ =gUnknown_8E86240
	str r4, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _0815AE9C @ =gUnknown_8E86BE8
	ldr r4, _0815AEA0 @ =gUnknown_203F450
	ldr r1, [r4]
	adds r1, 0x4
	bl LZDecompressWram
	ldr r0, _0815AEA4 @ =gUnknown_8E86D6C
	ldr r1, [r4]
	ldr r2, _0815AEA8 @ =0x00003004
	adds r1, r2
	bl LZDecompressWram
	ldr r0, _0815AEAC @ =gUnknown_8E86F98
	movs r1, 0
	movs r2, 0x80
	bl LoadCompressedPalette
	add r0, sp, 0x4
	movs r1, 0
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _0815AEB0 @ =gUnknown_83A5348
	bl LoadSpritePalette
	ldr r0, [r4]
	ldr r1, _0815AEB4 @ =0x00002004
	adds r0, r1
	bl sub_815BD80
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815AE98: .4byte gUnknown_8E86240
_0815AE9C: .4byte gUnknown_8E86BE8
_0815AEA0: .4byte gUnknown_203F450
_0815AEA4: .4byte gUnknown_8E86D6C
_0815AEA8: .4byte 0x00003004
_0815AEAC: .4byte gUnknown_8E86F98
_0815AEB0: .4byte gUnknown_83A5348
_0815AEB4: .4byte 0x00002004
	thumb_func_end sub_815AE38

	thumb_func_start sub_815AEB8
sub_815AEB8: @ 815AEB8
	push {lr}
	ldr r0, _0815AEE4 @ =gUnknown_84792F0
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, 0
	movs r1, 0xCC
	bl FillWindowPixelBuffer
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	.align 2, 0
_0815AEE4: .4byte gUnknown_84792F0
	thumb_func_end sub_815AEB8

	thumb_func_start sub_815AEE8
sub_815AEE8: @ 815AEE8
	push {r4,r5,lr}
	ldr r4, _0815AF48 @ =gUnknown_3005E70
	adds r1, r4, 0
	ldr r0, _0815AF4C @ =gUnknown_8479368
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	movs r0, 0x1
	strb r0, [r4, 0x10]
	ldr r0, _0815AF50 @ =sub_815AFD8
	str r0, [r4, 0x4]
	movs r0, 0xB6
	lsls r0, 1
	movs r1, 0x1
	bl sub_8099F40
	lsls r0, 24
	cmp r0, 0
	bne _0815AF30
	ldr r0, _0815AF54 @ =gUnknown_8479340
	str r0, [r4]
	movs r0, 0x5
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	ldrb r2, [r4, 0x14]
	lsls r1, r2, 28
	lsrs r1, 28
	adds r1, 0x8
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x14]
_0815AF30:
	ldr r0, _0815AF58 @ =gUnknown_203F444
	ldrh r1, [r0, 0x6]
	ldrh r2, [r0, 0x8]
	adds r0, r4, 0
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0815AF48: .4byte gUnknown_3005E70
_0815AF4C: .4byte gUnknown_8479368
_0815AF50: .4byte sub_815AFD8
_0815AF54: .4byte gUnknown_8479340
_0815AF58: .4byte gUnknown_203F444
	thumb_func_end sub_815AEE8

	thumb_func_start sub_815AF5C
sub_815AF5C: @ 815AF5C
	push {lr}
	movs r0, 0xB6
	lsls r0, 1
	movs r1, 0x1
	bl sub_8099F40
	lsls r0, 24
	cmp r0, 0
	bne _0815AF84
	ldr r0, _0815AF7C @ =gUnknown_203F450
	ldr r0, [r0]
	ldr r1, _0815AF80 @ =0x00004007
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	b _0815AF96
	.align 2, 0
_0815AF7C: .4byte gUnknown_203F450
_0815AF80: .4byte 0x00004007
_0815AF84:
	ldr r0, _0815AF9C @ =gUnknown_8479380
	ldr r1, _0815AFA0 @ =gUnknown_203F44A
	bl AddScrollIndicatorArrowPair
	ldr r1, _0815AFA4 @ =gUnknown_203F450
	ldr r1, [r1]
	ldr r2, _0815AFA8 @ =0x00004007
	adds r1, r2
	strb r0, [r1]
_0815AF96:
	pop {r0}
	bx r0
	.align 2, 0
_0815AF9C: .4byte gUnknown_8479380
_0815AFA0: .4byte gUnknown_203F44A
_0815AFA4: .4byte gUnknown_203F450
_0815AFA8: .4byte 0x00004007
	thumb_func_end sub_815AF5C

	thumb_func_start sub_815AFAC
sub_815AFAC: @ 815AFAC
	push {r4,lr}
	ldr r4, _0815AFD0 @ =gUnknown_203F450
	ldr r0, [r4]
	ldr r2, _0815AFD4 @ =0x00004007
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0815AFCA
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r1, _0815AFD4 @ =0x00004007
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
_0815AFCA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815AFD0: .4byte gUnknown_203F450
_0815AFD4: .4byte 0x00004007
	thumb_func_end sub_815AFAC

	thumb_func_start sub_815AFD8
sub_815AFD8: @ 815AFD8
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	beq _0815AFE8
	movs r0, 0x5
	bl sub_80722CC
_0815AFE8:
	pop {r0}
	bx r0
	thumb_func_end sub_815AFD8

	thumb_func_start sub_815AFEC
sub_815AFEC: @ 815AFEC
	push {lr}
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x1F
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0xCC
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x5
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_815AFEC

	thumb_func_start sub_815B014
sub_815B014: @ 815B014
	push {lr}
	sub sp, 0x4
	ldr r1, _0815B054 @ =nullsub_8
	movs r0, 0x8
	str r0, [sp]
	movs r0, 0x5A
	movs r2, 0
	movs r3, 0
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0815B058 @ =gUnknown_202063C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	movs r3, 0x8
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2]
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_0815B054: .4byte nullsub_8
_0815B058: .4byte gUnknown_202063C
	thumb_func_end sub_815B014

	thumb_func_start sub_815B05C
sub_815B05C: @ 815B05C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r5, _0815B090 @ =gUnknown_202063C
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	strh r1, [r0, 0x24]
	strh r2, [r0, 0x26]
	adds r4, r0, 0
	adds r4, 0x3E
	ldrb r2, [r4]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r4]
	adds r1, r3, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815B090: .4byte gUnknown_202063C
	thumb_func_end sub_815B05C

	thumb_func_start sub_815B094
sub_815B094: @ 815B094
	push {lr}
	ldr r1, _0815B0AC @ =0x00000c64
	movs r0, 0x44
	bl SetGpuReg
	ldr r1, _0815B0B0 @ =0x00001cd4
	movs r0, 0x40
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0815B0AC: .4byte 0x00000c64
_0815B0B0: .4byte 0x00001cd4
	thumb_func_end sub_815B094

	thumb_func_start sub_815B0B4
sub_815B0B4: @ 815B0B4
	push {lr}
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_815B0B4

	thumb_func_start sub_815B0CC
sub_815B0CC: @ 815B0CC
	push {r4-r7,lr}
	movs r0, 0x2
	bl GetBgTilemapBuffer
	adds r7, r0, 0
	movs r0, 0x1
_0815B0D8:
	movs r4, 0x2
	lsls r5, r0, 5
	adds r6, r0, 0x1
_0815B0DE:
	bl Random
	adds r2, r5, r4
	lsls r2, 1
	adds r2, r7
	movs r1, 0x3
	ands r1, r0
	lsls r1, 10
	ldr r3, _0815B114 @ =0x0000301f
	adds r0, r3, 0
	adds r1, r0
	strh r1, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1B
	bls _0815B0DE
	lsls r0, r6, 24
	lsrs r0, 24
	cmp r0, 0xC
	bls _0815B0D8
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815B114: .4byte 0x0000301f
	thumb_func_end sub_815B0CC

	thumb_func_start sub_815B118
sub_815B118: @ 815B118
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0815B190 @ =gUnknown_3005098
	adds r5, r0, r1
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815B194 @ =gUnknown_202063C
	adds r7, r0, r1
	movs r0, 0x1
	bl ClearWindowTilemap
	bl sub_815B0B4
	ldr r0, _0815B198 @ =gUnknown_203F444
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	blt _0815B1B8
	cmp r0, 0x3
	bgt _0815B1A8
	ldrb r0, [r5, 0x2]
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl sub_815B05C
	movs r4, 0xC0
	lsls r4, 6
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x1
	bl ChangeBgX
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x2
	bl ChangeBgY
	ldr r2, _0815B19C @ =gUnknown_203F450
	ldr r1, [r2]
	ldr r0, _0815B1A0 @ =0x00004004
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x3
	strb r0, [r1]
	ldr r1, [r2]
	ldr r0, _0815B1A4 @ =0x00004005
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x3
	strb r0, [r1]
	b _0815B1B8
	.align 2, 0
_0815B190: .4byte gUnknown_3005098
_0815B194: .4byte gUnknown_202063C
_0815B198: .4byte gUnknown_203F444
_0815B19C: .4byte gUnknown_203F450
_0815B1A0: .4byte 0x00004004
_0815B1A4: .4byte 0x00004005
_0815B1A8:
	cmp r0, 0x5
	bgt _0815B1B8
	ldrb r0, [r5, 0x2]
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl sub_815B05C
_0815B1B8:
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r0, [r5, 0xA]
	movs r0, 0x24
	ldrsh r1, [r7, r0]
	movs r0, 0x26
	ldrsh r2, [r7, r0]
	movs r0, 0x1
	str r0, [sp]
	adds r0, r6, 0
	movs r3, 0
	bl sub_815BAA0
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_815B118

	thumb_func_start sub_815B1DC
sub_815B1DC: @ 815B1DC
	push {r4,lr}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r2, _0815B21C @ =gUnknown_3003E50
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl sub_80F78A8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x4
	adds r2, r4, 0
	bl AddTextPrinterParametrized
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B21C: .4byte gUnknown_3003E50
	thumb_func_end sub_815B1DC

	thumb_func_start sub_815B220
sub_815B220: @ 815B220
	push {r4,lr}
	ldr r4, _0815B238 @ =gUnknown_203F450
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	bl FreeAllWindowBuffers
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B238: .4byte gUnknown_203F450
	thumb_func_end sub_815B220

	thumb_func_start sub_815B23C
sub_815B23C: @ 815B23C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0815B26C @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0815B270 @ =sub_815B274
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B26C: .4byte gUnknown_3005090
_0815B270: .4byte sub_815B274
	thumb_func_end sub_815B23C

	thumb_func_start sub_815B274
sub_815B274: @ 815B274
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0815B298 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0815B2B6
	ldr r0, _0815B29C @ =gUnknown_203F450
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _0815B2A0
	bl SetMainCallback2
	b _0815B2AC
	.align 2, 0
_0815B298: .4byte gUnknown_2037AB8
_0815B29C: .4byte gUnknown_203F450
_0815B2A0:
	bl sub_8055DC4
	ldr r0, _0815B2BC @ =gUnknown_203F444
	ldr r0, [r0]
	bl SetMainCallback2
_0815B2AC:
	bl sub_815B220
	adds r0, r4, 0
	bl DestroyTask
_0815B2B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B2BC: .4byte gUnknown_203F444
	thumb_func_end sub_815B274

	thumb_func_start sub_815B2C0
sub_815B2C0: @ 815B2C0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _0815B31C @ =gUnknown_3005098
	adds r6, r0, r1
	bl sub_815B0CC
	ldr r0, _0815B320 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0815B37A
	ldrb r0, [r6]
	bl ListMenuHandleInput
	adds r5, r0, 0
	ldrb r0, [r6]
	ldr r4, _0815B324 @ =gUnknown_203F44A
	adds r2, r4, 0x2
	adds r1, r4, 0
	bl get_coro_args_x18_x1A
	ldr r0, _0815B328 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0815B30A
	subs r0, r4, 0x6
	ldr r1, [r0]
	ldr r0, _0815B32C @ =sub_8107EB8
	cmp r1, r0
	bne _0815B330
_0815B30A:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _0815B330
	adds r0, 0x1
	cmp r5, r0
	bne _0815B33E
	b _0815B37A
	.align 2, 0
_0815B31C: .4byte gUnknown_3005098
_0815B320: .4byte gUnknown_2037AB8
_0815B324: .4byte gUnknown_203F44A
_0815B328: .4byte gUnknown_30030F0
_0815B32C: .4byte sub_8107EB8
_0815B330:
	movs r0, 0x5
	bl sub_80722CC
	adds r0, r7, 0
	bl sub_815B23C
	b _0815B37A
_0815B33E:
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _0815B380 @ =gUnknown_203F444
	movs r4, 0
	strb r5, [r2, 0x5]
	ldrb r0, [r6]
	adds r1, r2, 0x6
	adds r2, 0x8
	bl sub_810713C
	bl sub_815B0B4
	movs r0, 0x1
	bl ClearWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_815AFAC
	strh r4, [r6, 0x6]
	strh r4, [r6, 0x4]
	ldr r1, _0815B384 @ =gUnknown_3005090
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0815B388 @ =sub_815B4EC
	str r1, [r0]
_0815B37A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815B380: .4byte gUnknown_203F444
_0815B384: .4byte gUnknown_3005090
_0815B388: .4byte sub_815B4EC
	thumb_func_end sub_815B2C0

	thumb_func_start sub_815B38C
sub_815B38C: @ 815B38C
	push {r4,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0815B3F8 @ =gUnknown_3005098
	adds r4, r1, r0
	bl sub_815B0CC
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _0815B3F0
	ldr r0, _0815B3FC @ =gUnknown_203F450
	ldr r1, [r0]
	ldr r0, _0815B400 @ =0x00003004
	adds r1, r0
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldrb r0, [r4, 0x2]
	movs r1, 0x8
	movs r2, 0x38
	movs r3, 0x7
	bl sub_815B05C
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0
	strh r0, [r4, 0x4]
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	movs r0, 0x88
	lsls r0, 1
	bl PlayNewMapMusic
_0815B3F0:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B3F8: .4byte gUnknown_3005098
_0815B3FC: .4byte gUnknown_203F450
_0815B400: .4byte 0x00003004
	thumb_func_end sub_815B38C

	thumb_func_start sub_815B404
sub_815B404: @ 815B404
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0815B450 @ =gUnknown_3005098
	adds r4, r1, r0
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x86
	bne _0815B448
	movs r0, 0x1A
	str r0, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0
	strh r0, [r4, 0x4]
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
_0815B448:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B450: .4byte gUnknown_3005098
	thumb_func_end sub_815B404

	thumb_func_start sub_815B454
sub_815B454: @ 815B454
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0815B484 @ =gUnknown_3005098
	adds r4, r1, r0
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815B488 @ =gUnknown_202063C
	adds r1, r0, r1
	ldrh r2, [r4, 0x4]
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r0, 0x23
	beq _0815B48C
	adds r0, r2, 0x1
	strh r0, [r4, 0x4]
	b _0815B4B8
	.align 2, 0
_0815B484: .4byte gUnknown_3005098
_0815B488: .4byte gUnknown_202063C
_0815B48C:
	ldrh r2, [r1, 0x24]
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0x78
	bne _0815B4B4
	adds r0, r1, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _0815B4B0 @ =gUnknown_841B83D
	bl sub_815B1DC
	movs r0, 0
	strh r0, [r4, 0x4]
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	b _0815B4B8
	.align 2, 0
_0815B4B0: .4byte gUnknown_841B83D
_0815B4B4:
	adds r0, r2, 0x1
	strh r0, [r1, 0x24]
_0815B4B8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_815B454

	thumb_func_start sub_815B4C0
sub_815B4C0: @ 815B4C0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0815B4E8 @ =gUnknown_3005098
	adds r4, r1, r0
	movs r0, 0
	bl sub_80BF518
	lsls r0, 16
	cmp r0, 0
	bne _0815B4E2
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
_0815B4E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B4E8: .4byte gUnknown_3005098
	thumb_func_end sub_815B4C0

	thumb_func_start sub_815B4EC
sub_815B4EC: @ 815B4EC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r6, r0, 3
	ldr r7, _0815B548 @ =gUnknown_3005098
	adds r5, r6, r7
	ldr r0, _0815B54C @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0815B55C
	ldr r0, _0815B550 @ =gUnknown_203F450
	ldr r0, [r0]
	ldr r1, _0815B554 @ =0x00004006
	adds r0, r1
	movs r4, 0
	movs r1, 0x1
	strb r1, [r0]
	ldrb r0, [r5, 0x2]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_815B05C
	movs r0, 0
	movs r1, 0xCC
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	bl sub_815B908
	strh r4, [r5, 0x4]
	strh r4, [r5, 0x6]
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0815B558 @ =sub_815B92C
	str r1, [r0]
	b _0815B578
	.align 2, 0
_0815B548: .4byte gUnknown_3005098
_0815B54C: .4byte gUnknown_30030F0
_0815B550: .4byte gUnknown_203F450
_0815B554: .4byte 0x00004006
_0815B558: .4byte sub_815B92C
_0815B55C:
	ldr r1, _0815B580 @ =gUnknown_8479548
	ldr r0, _0815B584 @ =gUnknown_203F444
	ldrb r0, [r0, 0x5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
_0815B578:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815B580: .4byte gUnknown_8479548
_0815B584: .4byte gUnknown_203F444
	thumb_func_end sub_815B4EC

	thumb_func_start sub_815B588
sub_815B588: @ 815B588
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0815B5B4 @ =gUnknown_3005098
	adds r4, r0
	ldr r1, _0815B5B8 @ =gUnknown_8479560
	ldr r0, _0815B5BC @ =gUnknown_203F444
	ldrb r0, [r0, 0x5]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl sub_815B1DC
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B5B4: .4byte gUnknown_3005098
_0815B5B8: .4byte gUnknown_8479560
_0815B5BC: .4byte gUnknown_203F444
	thumb_func_end sub_815B588

	thumb_func_start sub_815B5C0
sub_815B5C0: @ 815B5C0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0815B5EC @ =gUnknown_3005098
	adds r4, r0
	ldr r1, _0815B5F0 @ =gUnknown_8479578
	ldr r0, _0815B5F4 @ =gUnknown_203F444
	ldrb r0, [r0, 0x5]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl sub_815B1DC
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B5EC: .4byte gUnknown_3005098
_0815B5F0: .4byte gUnknown_8479578
_0815B5F4: .4byte gUnknown_203F444
	thumb_func_end sub_815B5C0

	thumb_func_start sub_815B5F8
sub_815B5F8: @ 815B5F8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0815B620 @ =gUnknown_3005098
	adds r4, r1, r0
	movs r0, 0
	bl sub_80BF518
	lsls r0, 16
	cmp r0, 0
	bne _0815B61A
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
_0815B61A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B620: .4byte gUnknown_3005098
	thumb_func_end sub_815B5F8

	thumb_func_start sub_815B624
sub_815B624: @ 815B624
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0815B65C @ =gUnknown_3005098
	adds r4, r1, r0
	ldr r0, _0815B660 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0815B656
	movs r0, 0
	movs r1, 0xCC
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
_0815B656:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B65C: .4byte gUnknown_3005098
_0815B660: .4byte gUnknown_30030F0
	thumb_func_end sub_815B624

	thumb_func_start sub_815B664
sub_815B664: @ 815B664
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0815B6A0 @ =gUnknown_3005098
	adds r4, r0
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815B6A4 @ =gUnknown_202063C
	adds r0, r1
	movs r1, 0x5
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B6A0: .4byte gUnknown_3005098
_0815B6A4: .4byte gUnknown_202063C
	thumb_func_end sub_815B664

	thumb_func_start sub_815B6A8
sub_815B6A8: @ 815B6A8
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0815B730 @ =gUnknown_3005098
	adds r4, r0, r1
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815B734 @ =gUnknown_202063C
	adds r6, r0, r1
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0x3
	movs r2, 0x2
	bl ChangeBgY
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _0815B702
	ldr r0, _0815B738 @ =gUnknown_203F450
	ldr r1, [r0]
	ldr r2, _0815B73C @ =0x00004005
	adds r1, r2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r0, 0x24
	ldrsh r1, [r6, r0]
	movs r0, 0x26
	ldrsh r2, [r6, r0]
	str r3, [sp]
	adds r0, r5, 0
	movs r3, 0
	bl sub_815BAA0
_0815B702:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x30
	bne _0815B726
	movs r1, 0
	strh r1, [r4, 0x4]
	movs r2, 0x1
	negs r2, r2
	adds r0, r2, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	adds r0, r6, 0
	movs r1, 0x7
	bl StartSpriteAnim
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
_0815B726:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815B730: .4byte gUnknown_3005098
_0815B734: .4byte gUnknown_202063C
_0815B738: .4byte gUnknown_203F450
_0815B73C: .4byte 0x00004005
	thumb_func_end sub_815B6A8

	thumb_func_start sub_815B740
sub_815B740: @ 815B740
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0815B7D4 @ =gUnknown_3005098
	adds r4, r0, r1
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815B7D8 @ =gUnknown_202063C
	adds r6, r0, r1
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0x3
	movs r2, 0x1
	bl ChangeBgX
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	movs r2, 0xF
	ands r0, r2
	cmp r0, 0
	bne _0815B78A
	ldr r0, _0815B7DC @ =gUnknown_203F450
	ldr r1, [r0]
	ldr r3, _0815B7E0 @ =0x00004004
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0815B78A:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	adds r0, 0x8
	ands r0, r2
	cmp r0, 0
	bne _0815B7AC
	ldrh r1, [r6, 0x24]
	adds r1, 0x8
	lsls r1, 16
	asrs r1, 16
	movs r3, 0x26
	ldrsh r2, [r6, r3]
	str r0, [sp]
	adds r0, r5, 0
	movs r3, 0
	bl sub_815BAA0
_0815B7AC:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x30
	bne _0815B7CA
	movs r0, 0
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	adds r0, r6, 0
	movs r1, 0x3
	bl StartSpriteAnim
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
_0815B7CA:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815B7D4: .4byte gUnknown_3005098
_0815B7D8: .4byte gUnknown_202063C
_0815B7DC: .4byte gUnknown_203F450
_0815B7E0: .4byte 0x00004004
	thumb_func_end sub_815B740

	thumb_func_start sub_815B7E4
sub_815B7E4: @ 815B7E4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	ldr r0, _0815B838 @ =gUnknown_3005098
	adds r5, r0
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0815B83C @ =gUnknown_202063C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x6
	bl StartSpriteAnim
	ldrh r0, [r5, 0x6]
	adds r0, 0x1
	strh r0, [r5, 0x6]
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r0, [r5, 0xA]
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	movs r0, 0x26
	ldrsh r2, [r4, r0]
	movs r0, 0
	str r0, [sp]
	adds r0, r6, 0
	movs r3, 0
	bl sub_815BAA0
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815B838: .4byte gUnknown_3005098
_0815B83C: .4byte gUnknown_202063C
	thumb_func_end sub_815B7E4

	thumb_func_start sub_815B840
sub_815B840: @ 815B840
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _0815B890 @ =gUnknown_3005098
	adds r5, r0, r1
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815B894 @ =gUnknown_202063C
	adds r4, r0, r1
	ldrh r1, [r4, 0x24]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0815B87E
	subs r1, 0x8
	lsls r1, 16
	asrs r1, 16
	movs r6, 0x26
	ldrsh r2, [r4, r6]
	str r0, [sp]
	adds r0, r3, 0
	movs r3, 0
	bl sub_815BAA0
_0815B87E:
	ldrh r1, [r4, 0x24]
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0x8
	bne _0815B898
	ldrh r0, [r5, 0x6]
	adds r0, 0x1
	strh r0, [r5, 0x6]
	b _0815B89C
	.align 2, 0
_0815B890: .4byte gUnknown_3005098
_0815B894: .4byte gUnknown_202063C
_0815B898:
	subs r0, r1, 0x1
	strh r0, [r4, 0x24]
_0815B89C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_815B840

	thumb_func_start sub_815B8A4
sub_815B8A4: @ 815B8A4
	push {r4,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0815B900 @ =gUnknown_3005098
	adds r4, r1, r0
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0815B8DC
	ldr r1, _0815B904 @ =gUnknown_8479590
	movs r0, 0x8
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x14
	movs r3, 0xA
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
_0815B8DC:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7E
	ble _0815B8F8
	bl sub_815B908
	movs r0, 0
	strh r0, [r4, 0x4]
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
_0815B8F8:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815B900: .4byte gUnknown_3005098
_0815B904: .4byte gUnknown_8479590
	thumb_func_end sub_815B8A4

	thumb_func_start sub_815B908
sub_815B908: @ 815B908
	push {lr}
	sub sp, 0x8
	movs r0, 0x8
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x14
	movs r3, 0xA
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_815B908

	thumb_func_start sub_815B92C
sub_815B92C: @ 815B92C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 3
	ldr r7, _0815B9DC @ =gUnknown_3005098
	adds r5, r6, r7
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0815B94C
	movs r0, 0xAD
	lsls r0, 1
	bl PlayNewMapMusic
_0815B94C:
	bl sub_815B0CC
	ldrh r0, [r5, 0x4]
	adds r0, 0x1
	strh r0, [r5, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _0815B9D4
	movs r4, 0
	strh r4, [r5, 0x4]
	strh r4, [r5, 0x6]
	bl sub_815AEE8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0815B9E0 @ =sub_815B2C0
	str r1, [r0]
	movs r0, 0
	bl PutWindowTilemap
	bl sub_815AF5C
	bl sub_815B094
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x3
	movs r2, 0x2
	bl ChangeBgX
	movs r1, 0xA0
	lsls r1, 6
	movs r0, 0x3
	movs r2, 0x1
	bl ChangeBgY
	ldr r2, _0815B9E4 @ =gUnknown_203F450
	ldr r0, [r2]
	ldr r1, _0815B9E8 @ =0x00004004
	adds r0, r1
	strb r4, [r0]
	ldr r0, [r2]
	adds r1, 0x1
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _0815B9EC @ =0x00004006
	adds r0, r1
	strb r4, [r0]
_0815B9D4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815B9DC: .4byte gUnknown_3005098
_0815B9E0: .4byte sub_815B2C0
_0815B9E4: .4byte gUnknown_203F450
_0815B9E8: .4byte 0x00004004
_0815B9EC: .4byte 0x00004006
	thumb_func_end sub_815B92C

	thumb_func_start sub_815B9F0
sub_815B9F0: @ 815B9F0
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, _0815BA0C @ =gUnknown_203F444
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	blt _0815BA22
	cmp r0, 0x3
	bgt _0815BA10
	adds r0, r1, 0
	bl sub_815BC90
	b _0815BA22
	.align 2, 0
_0815BA0C: .4byte gUnknown_203F444
_0815BA10:
	cmp r0, 0x5
	bgt _0815BA22
	ldr r0, _0815BA28 @ =gUnknown_203F450
	ldr r1, [r0]
	ldr r0, _0815BA2C @ =sub_815BA30
	str r0, [r1]
	adds r0, r2, 0
	bl sub_815B23C
_0815BA22:
	pop {r0}
	bx r0
	.align 2, 0
_0815BA28: .4byte gUnknown_203F450
_0815BA2C: .4byte sub_815BA30
	thumb_func_end sub_815B9F0

	thumb_func_start sub_815BA30
sub_815BA30: @ 815BA30
	push {lr}
	ldr r0, _0815BA44 @ =gUnknown_203F444
	ldrb r0, [r0, 0x5]
	cmp r0, 0x4
	bne _0815BA48
	movs r0, 0xA
	bl sub_810B108
	b _0815BA4E
	.align 2, 0
_0815BA44: .4byte gUnknown_203F444
_0815BA48:
	movs r0, 0x9
	bl sub_810B108
_0815BA4E:
	pop {r0}
	bx r0
	thumb_func_end sub_815BA30

	thumb_func_start sub_815BA54
sub_815BA54: @ 815BA54
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r2, r1, 3
	ldr r4, _0815BA8C @ =gUnknown_3005098
	adds r3, r2, r4
	ldr r0, _0815BA90 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0815BA86
	ldr r1, _0815BA94 @ =gUnknown_8479390
	ldr r0, _0815BA98 @ =gUnknown_203F444
	ldrb r0, [r0, 0x5]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r3, 0x6]
	adds r0, r4, 0
	subs r0, 0x8
	adds r0, r2, r0
	ldr r1, _0815BA9C @ =sub_815B4EC
	str r1, [r0]
_0815BA86:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815BA8C: .4byte gUnknown_3005098
_0815BA90: .4byte gUnknown_2037AB8
_0815BA94: .4byte gUnknown_8479390
_0815BA98: .4byte gUnknown_203F444
_0815BA9C: .4byte sub_815B4EC
	thumb_func_end sub_815BA54

	thumb_func_start sub_815BAA0
sub_815BAA0: @ 815BAA0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r1, r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	ldr r0, _0815BB34 @ =gUnknown_203F450
	ldr r0, [r0]
	ldr r2, _0815BB38 @ =0x00004006
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0815BB5C
	lsls r0, r6, 16
	ldr r2, _0815BB3C @ =0xfff00000
	adds r0, r2
	asrs r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	adds r1, r5, 0
	bl sub_815BC40
	lsls r0, 24
	cmp r0, 0
	beq _0815BB5C
	ldr r0, _0815BB40 @ =gUnknown_83A0010
	ldr r0, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	adds r3, r7, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0815BB44 @ =gUnknown_202063C
	adds r4, r1, r0
	strh r6, [r4, 0x24]
	adds r0, r5, 0
	adds r0, 0x8
	strh r0, [r4, 0x26]
	ldr r0, _0815BB48 @ =sub_815BB6C
	str r0, [r4, 0x1C]
	mov r0, r9
	strh r0, [r4, 0x2E]
	mov r2, r8
	cmp r2, 0x1
	bne _0815BB4C
	adds r0, r4, 0
	movs r1, 0x4
	bl SeekSpriteAnim
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x8
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _0815BB5C
	.align 2, 0
_0815BB34: .4byte gUnknown_203F450
_0815BB38: .4byte 0x00004006
_0815BB3C: .4byte 0xfff00000
_0815BB40: .4byte gUnknown_83A0010
_0815BB44: .4byte gUnknown_202063C
_0815BB48: .4byte sub_815BB6C
_0815BB4C:
	ldr r1, _0815BB68 @ =gUnknown_84795B8
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r1, r4, 0
	adds r1, 0x42
	movs r0, 0x40
	strb r0, [r1]
_0815BB5C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815BB68: .4byte gUnknown_84795B8
	thumb_func_end sub_815BAA0

	thumb_func_start sub_815BB6C
sub_815BB6C: @ 815BB6C
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0815BBA4 @ =gUnknown_3005098
	adds r4, r0, r1
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0815BBA8 @ =gUnknown_202063C
	adds r5, r0, r1
	ldr r0, _0815BBAC @ =gUnknown_203F450
	ldr r0, [r0]
	ldr r1, _0815BBB0 @ =0x00004006
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0815BBB4
	adds r0, r3, 0
	bl DestroySprite
	b _0815BC3A
	.align 2, 0
_0815BBA4: .4byte gUnknown_3005098
_0815BBA8: .4byte gUnknown_202063C
_0815BBAC: .4byte gUnknown_203F450
_0815BBB0: .4byte 0x00004006
_0815BBB4:
	adds r0, r3, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0
	bne _0815BBD2
	adds r2, r3, 0
	adds r2, 0x42
	ldrb r0, [r2]
	movs r1, 0x40
	negs r1, r1
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r2]
	b _0815BBE0
_0815BBD2:
	adds r2, r3, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x40
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0815BBE0:
	ldrh r0, [r4, 0x8]
	ldrh r2, [r3, 0x24]
	adds r0, r2
	strh r0, [r3, 0x24]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r3, 0x26]
	adds r0, r1
	strh r0, [r3, 0x26]
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0815BC3A
	adds r1, r3, 0
	adds r1, 0x43
	movs r0, 0
	strb r0, [r1]
	ldrh r1, [r3, 0x24]
	ldrh r0, [r5, 0x24]
	subs r1, r0
	ldrh r0, [r3, 0x26]
	ldrh r2, [r5, 0x26]
	subs r0, r2
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	movs r2, 0xF0
	lsls r2, 12
	adds r1, r2
	lsrs r1, 16
	cmp r1, 0x1E
	bhi _0815BC34
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	ble _0815BC34
	cmp r1, 0x17
	ble _0815BC3A
_0815BC34:
	adds r0, r3, 0
	bl DestroySprite
_0815BC3A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_815BB6C

	thumb_func_start sub_815BC40
sub_815BC40: @ 815BC40
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r4, r0, 16
	cmp r4, 0
	blt _0815BC52
	lsls r1, 16
	cmp r1, 0
	bge _0815BC56
_0815BC52:
	movs r0, 0
	b _0815BC78
_0815BC56:
	ldr r3, _0815BC80 @ =gUnknown_84795C8
	ldr r0, _0815BC84 @ =gUnknown_203F450
	ldr r2, [r0]
	ldr r5, _0815BC88 @ =0x00004005
	adds r0, r2, r5
	asrs r1, 20
	ldrb r0, [r0]
	adds r1, r0
	lsls r1, 4
	ldr r0, _0815BC8C @ =0x00004004
	adds r2, r0
	asrs r0, r4, 20
	ldrb r2, [r2]
	adds r0, r2
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
_0815BC78:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0815BC80: .4byte gUnknown_84795C8
_0815BC84: .4byte gUnknown_203F450
_0815BC88: .4byte 0x00004005
_0815BC8C: .4byte 0x00004004
	thumb_func_end sub_815BC40

	thumb_func_start sub_815BC90
sub_815BC90: @ 815BC90
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0815BCCC @ =gUnknown_3005098
	adds r5, r0, r1
	bl sub_815B220
	ldr r1, _0815BCD0 @ =gUnknown_20370C0
	ldr r4, _0815BCD4 @ =gUnknown_203F444
	ldrb r0, [r4, 0x5]
	strh r0, [r1]
	ldr r1, _0815BCD8 @ =gUnknown_30030F0
	ldr r0, _0815BCDC @ =sub_815BD58
	str r0, [r1, 0x8]
	bl copy_player_party_to_sav1
	bl sub_8159F40
	movs r0, 0
	bl PlayMapChosenOrBattleBGM
	ldrb r0, [r4, 0x5]
	cmp r0, 0
	bne _0815BCE0
	movs r0, 0x9
	b _0815BCE2
	.align 2, 0
_0815BCCC: .4byte gUnknown_3005098
_0815BCD0: .4byte gUnknown_20370C0
_0815BCD4: .4byte gUnknown_203F444
_0815BCD8: .4byte gUnknown_30030F0
_0815BCDC: .4byte sub_815BD58
_0815BCE0:
	movs r0, 0x8
_0815BCE2:
	strh r0, [r5, 0xC]
	movs r0, 0
	strh r0, [r5, 0xE]
	ldr r1, _0815BCFC @ =gUnknown_3005090
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0815BD00 @ =sub_815BD04
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815BCFC: .4byte gUnknown_3005090
_0815BD00: .4byte sub_815BD04
	thumb_func_end sub_815BC90

	thumb_func_start sub_815BD04
sub_815BD04: @ 815BD04
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0815BD24 @ =gUnknown_3005098
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0815BD28
	cmp r0, 0x1
	beq _0815BD36
	b _0815BD4C
	.align 2, 0
_0815BD24: .4byte gUnknown_3005098
_0815BD28:
	ldrb r0, [r4, 0xC]
	bl sub_80D08B8
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	b _0815BD4C
_0815BD36:
	bl sub_80D08F8
	lsls r0, 24
	cmp r0, 0
	beq _0815BD4C
	ldr r0, _0815BD54 @ =sub_800FD9C
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0815BD4C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815BD54: .4byte sub_800FD9C
	thumb_func_end sub_815BD04

	thumb_func_start sub_815BD58
sub_815BD58: @ 815BD58
	push {lr}
	bl sub_804C230
	ldr r0, _0815BD6C @ =gUnknown_2023E8A
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0815BD70
	bl sub_815AC20
	b _0815BD78
	.align 2, 0
_0815BD6C: .4byte gUnknown_2023E8A
_0815BD70:
	movs r0, 0x88
	lsls r0, 1
	bl PlayNewMapMusic
_0815BD78:
	bl sub_815ABFC
	pop {r0}
	bx r0
	thumb_func_end sub_815BD58

	thumb_func_start sub_815BD80
sub_815BD80: @ 815BD80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x10]
	ldr r1, _0815BE1C @ =gUnknown_82E55CC
	mov r8, r1
	movs r0, 0x80
	lsls r0, 4
	bl AllocZeroed
	adds r6, r0, 0
	movs r0, 0x80
	lsls r0, 8
	bl AllocZeroed
	str r0, [sp, 0x8]
	movs r0, 0x10
	bl Alloc
	str r0, [sp, 0xC]
	movs r1, 0xFF
	movs r2, 0x10
	bl memset
	mov r2, r8
	ldr r0, [r2, 0x10]
	movs r2, 0xA0
	lsls r2, 2
	ldr r1, [sp, 0x8]
	bl sub_815BF48
	mov r3, r8
	ldr r0, [r3, 0x14]
	ldr r2, [sp, 0x8]
	movs r3, 0xA0
	lsls r3, 7
	adds r1, r2, r3
	movs r2, 0xC0
	lsls r2, 1
	bl sub_815BF48
	movs r4, 0
_0815BDDE:
	movs r2, 0
	adds r0, r4, 0x6
	str r0, [sp, 0x18]
	lsls r1, r4, 4
	mov r10, r1
	lsls r3, r4, 6
	mov r9, r3
	adds r4, 0x1
	str r4, [sp, 0x14]
_0815BDF0:
	mov r1, r8
	ldr r0, [r1]
	ldr r3, [sp, 0x18]
	muls r0, r3
	ldr r1, [r1, 0xC]
	adds r0, r2, r0
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0, 0x10]
	ldr r3, _0815BE20 @ =0x000003ff
	adds r0, r3, 0
	adds r4, r0, 0
	ands r4, r1
	movs r3, 0
	mov r0, r10
	adds r1, r0, r2
	lsls r5, r2, 1
	adds r7, r2, 0x1
	cmp r3, r1
	bge _0815BE3C
	ldrh r0, [r6]
	b _0815BE34
	.align 2, 0
_0815BE1C: .4byte gUnknown_82E55CC
_0815BE20: .4byte 0x000003ff
_0815BE24:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bge _0815BE3C
	lsls r0, r3, 1
	adds r0, r6
	ldrh r0, [r0]
_0815BE34:
	cmp r0, 0
	beq _0815BE46
	cmp r0, r4
	bne _0815BE24
_0815BE3C:
	lsls r0, r3, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, 0
	bne _0815BE56
_0815BE46:
	lsls r0, r3, 1
	adds r0, r6
	strh r4, [r0]
	ldr r0, [sp, 0x10]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
_0815BE56:
	mov r2, r9
	adds r1, r2, r5
	lsls r1, 1
	ldr r0, [sp, 0x4]
	adds r1, r0, r1
	str r3, [sp]
	mov r0, r8
	ldr r2, [sp, 0xC]
	adds r3, r4, 0
	bl sub_815BF70
	lsls r0, r7, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0815BDF0
	ldr r1, [sp, 0x14]
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x8
	bls _0815BDDE
	ldr r2, [sp, 0x10]
	lsls r0, r2, 7
	bl Alloc
	adds r7, r0, 0
	movs r0, 0x80
	bl Alloc
	adds r5, r0, 0
	movs r4, 0
	ldr r3, [sp, 0x10]
	lsls r3, 23
	mov r9, r3
	ldr r0, [sp, 0x10]
	cmp r4, r0
	bcs _0815BF00
	ldr r1, _0815BECC @ =0x0000027f
	mov r10, r1
_0815BEA2:
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x80
	bl memset
	lsls r0, r4, 1
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, r10
	bhi _0815BED0
	mov r2, r8
	ldr r0, [r2, 0x10]
	ldrh r1, [r1]
	lsls r1, 4
	ldr r0, [r0, 0xC]
	adds r0, r1
	adds r1, r5, 0
	ldr r2, [sp, 0x8]
	bl sub_815BFF0
	b _0815BEE8
	.align 2, 0
_0815BECC: .4byte 0x0000027f
_0815BED0:
	mov r3, r8
	ldr r0, [r3, 0x14]
	ldrh r1, [r1]
	ldr r2, _0815BF44 @ =0xfffffd80
	adds r1, r2
	lsls r1, 4
	ldr r0, [r0, 0xC]
	adds r0, r1
	adds r1, r5, 0
	ldr r2, [sp, 0x8]
	bl sub_815BFF0
_0815BEE8:
	lsls r1, r4, 7
	adds r1, r7, r1
	adds r0, r5, 0
	movs r2, 0x20
	bl CpuFastSet
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r3, [sp, 0x10]
	cmp r4, r3
	bcc _0815BEA2
_0815BF00:
	mov r0, r9
	lsrs r2, r0, 16
	movs r0, 0x3
	adds r1, r7, 0
	movs r3, 0
	bl LoadBgTiles
	mov r0, r8
	ldr r1, [sp, 0xC]
	bl sub_815C230
	adds r0, r5, 0
	bl Free
	adds r0, r7, 0
	bl Free
	ldr r0, [sp, 0xC]
	bl Free
	ldr r0, [sp, 0x8]
	bl Free
	adds r0, r6, 0
	bl Free
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815BF44: .4byte 0xfffffd80
	thumb_func_end sub_815BD80

	thumb_func_start sub_815BF48
sub_815BF48: @ 815BF48
	push {lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r2, 16
	cmp r3, 0
	beq _0815BF6A
	ldrb r0, [r3]
	cmp r0, 0
	bne _0815BF64
	ldr r0, [r3, 0x4]
	lsls r2, 3
	bl CpuFastSet
	b _0815BF6A
_0815BF64:
	ldr r0, [r3, 0x4]
	bl LZDecompressWram
_0815BF6A:
	pop {r0}
	bx r0
	thumb_func_end sub_815BF48

	thumb_func_start sub_815BF70
sub_815BF70: @ 815BF70
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r7, r1, 0
	adds r6, r2, 0
	ldr r0, [sp, 0x14]
	lsls r3, 16
	lsrs r1, r3, 16
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0815BF8C @ =0x0000027f
	cmp r1, r0
	bhi _0815BF90
	ldr r0, [r5, 0x10]
	b _0815BF96
	.align 2, 0
_0815BF8C: .4byte 0x0000027f
_0815BF90:
	ldr r0, [r5, 0x14]
	ldr r2, _0815BFEC @ =0xfffffd80
	adds r1, r2
_0815BF96:
	lsls r1, 4
	ldr r0, [r0, 0xC]
	adds r5, r0, r1
	ldrh r1, [r5]
	adds r0, r6, 0
	bl sub_815C1F0
	lsls r0, 12
	lsls r4, 2
	adds r0, r4
	strh r0, [r7]
	ldrh r1, [r5, 0x2]
	adds r0, r6, 0
	bl sub_815C1F0
	lsls r0, 12
	adds r0, r4
	adds r0, 0x1
	strh r0, [r7, 0x2]
	ldrh r1, [r5, 0x4]
	adds r0, r6, 0
	bl sub_815C1F0
	adds r1, r7, 0
	adds r1, 0x40
	lsls r0, 12
	adds r0, r4
	adds r0, 0x2
	strh r0, [r1]
	ldrh r1, [r5, 0x6]
	adds r0, r6, 0
	bl sub_815C1F0
	adds r1, r7, 0
	adds r1, 0x42
	lsls r0, 12
	adds r0, r4
	adds r0, 0x3
	strh r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815BFEC: .4byte 0xfffffd80
	thumb_func_end sub_815BF70

	thumb_func_start sub_815BFF0
sub_815BFF0: @ 815BFF0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	ldrh r2, [r0]
	ldr r4, _0815C0D0 @ =0x000003ff
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	movs r6, 0x3
	ands r2, r6
	mov r0, r9
	bl sub_815C0D4
	mov r0, r8
	ldrh r2, [r0, 0x8]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r9
	bl sub_815C0D4
	movs r0, 0x20
	add r0, r9
	mov r10, r0
	mov r0, r8
	ldrh r2, [r0, 0x2]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r10
	bl sub_815C0D4
	mov r0, r8
	ldrh r2, [r0, 0xA]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r10
	bl sub_815C0D4
	movs r0, 0x40
	add r0, r9
	mov r10, r0
	mov r0, r8
	ldrh r2, [r0, 0x4]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r10
	bl sub_815C0D4
	mov r0, r8
	ldrh r2, [r0, 0xC]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r10
	bl sub_815C0D4
	movs r0, 0x60
	add r9, r0
	mov r0, r8
	ldrh r2, [r0, 0x6]
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 5
	adds r1, r5, r1
	lsrs r2, 10
	ands r2, r6
	mov r0, r9
	bl sub_815C0D4
	mov r0, r8
	ldrh r2, [r0, 0xE]
	ands r4, r2
	lsls r4, 5
	adds r5, r4
	lsrs r2, 10
	ands r2, r6
	mov r0, r9
	adds r1, r5, 0
	bl sub_815C0D4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815C0D0: .4byte 0x000003ff
	thumb_func_end sub_815BFF0

	thumb_func_start sub_815C0D4
sub_815C0D4: @ 815C0D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	movs r0, 0x20
	bl AllocZeroed
	adds r6, r0, 0
	movs r0, 0x20
	bl AllocZeroed
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r0, 0x1
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	beq _0815C15A
	movs r5, 0
	movs r7, 0xF
	mov r12, r7
	movs r0, 0xF0
	mov r8, r0
_0815C118:
	movs r3, 0
	lsls r4, r5, 2
_0815C11C:
	subs r0, r3, 0x3
	subs r0, r4, r0
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r2, r4, r3
	ldr r7, [sp]
	adds r2, r7, r2
	adds r0, r1, 0
	mov r7, r12
	ands r0, r7
	lsls r0, 4
	mov r7, r8
	ands r1, r7
	lsrs r1, 4
	adds r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0815C11C
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0815C118
	ldr r0, [sp]
	adds r1, r6, 0
	movs r2, 0x8
	bl CpuFastSet
_0815C15A:
	movs r0, 0x2
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	beq _0815C18E
	movs r5, 0
_0815C166:
	lsls r0, r5, 2
	ldr r7, [sp]
	adds r0, r7
	movs r1, 0x7
	subs r1, r5
	lsls r1, 2
	adds r1, r6
	movs r2, 0x4
	bl memcpy
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0815C166
	ldr r0, [sp]
	adds r1, r6, 0
	movs r2, 0x8
	bl CpuFastSet
_0815C18E:
	movs r5, 0
	movs r0, 0xF0
	mov r8, r0
	movs r1, 0xF
	mov r12, r1
_0815C198:
	adds r4, r6, r5
	ldrb r0, [r4]
	mov r3, r8
	ands r3, r0
	cmp r3, 0
	beq _0815C1B2
	mov r7, r9
	adds r2, r7, r5
	ldrb r1, [r2]
	mov r0, r12
	ands r0, r1
	adds r0, r3
	strb r0, [r2]
_0815C1B2:
	ldrb r0, [r4]
	mov r3, r12
	ands r3, r0
	cmp r3, 0
	beq _0815C1CA
	mov r0, r9
	adds r2, r0, r5
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	adds r0, r3
	strb r0, [r2]
_0815C1CA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1F
	bls _0815C198
	ldr r0, [sp]
	bl Free
	adds r0, r6, 0
	bl Free
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_815C0D4

	thumb_func_start sub_815C1F0
sub_815C1F0: @ 815C1F0
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 28
	movs r3, 0
	ldrb r0, [r4]
	cmp r0, r1
	beq _0815C220
	cmp r0, 0xFF
	bne _0815C208
	strb r1, [r4]
	b _0815C220
_0815C208:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xF
	bhi _0815C220
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, r1
	beq _0815C220
	cmp r0, 0xFF
	bne _0815C208
	strb r1, [r2]
_0815C220:
	movs r0, 0xF
	subs r0, r3
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_815C1F0

	thumb_func_start sub_815C230
sub_815C230: @ 815C230
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r4, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _0815C274
_0815C23E:
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, 0x6
	bls _0815C24A
	ldr r0, [r6, 0x14]
	b _0815C24C
_0815C24A:
	ldr r0, [r6, 0x10]
_0815C24C:
	ldrb r1, [r1]
	lsls r1, 5
	ldr r0, [r0, 0x8]
	adds r0, r1
	movs r1, 0xF
	subs r1, r4
	lsls r1, 20
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bhi _0815C274
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0815C23E
_0815C274:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_815C230

	.align 2, 0 @ Don't pad with nop.
