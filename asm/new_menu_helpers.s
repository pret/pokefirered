	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start clear_scheduled_bg_copies_to_vram
clear_scheduled_bg_copies_to_vram: @ 80F6790
	push {lr}
	ldr r0, _080F67A0 @ =gUnknown_203AB58
	movs r1, 0
	movs r2, 0x4
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080F67A0: .4byte gUnknown_203AB58
	thumb_func_end clear_scheduled_bg_copies_to_vram

	thumb_func_start schedule_bg_copy_tilemap_to_vram
schedule_bg_copy_tilemap_to_vram: @ 80F67A4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080F67B4 @ =gUnknown_203AB58
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	bx lr
	.align 2, 0
_080F67B4: .4byte gUnknown_203AB58
	thumb_func_end schedule_bg_copy_tilemap_to_vram

	thumb_func_start do_scheduled_bg_tilemap_copies_to_vram
do_scheduled_bg_tilemap_copies_to_vram: @ 80F67B8
	push {r4,lr}
	ldr r4, _080F6804 @ =gUnknown_203AB58
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080F67CC
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	strb r0, [r4]
_080F67CC:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	bne _080F67DC
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	strb r0, [r4, 0x1]
_080F67DC:
	ldrb r0, [r4, 0x2]
	cmp r0, 0x1
	bne _080F67EC
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	strb r0, [r4, 0x2]
_080F67EC:
	ldrb r0, [r4, 0x3]
	cmp r0, 0x1
	bne _080F67FC
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	strb r0, [r4, 0x3]
_080F67FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6804: .4byte gUnknown_203AB58
	thumb_func_end do_scheduled_bg_tilemap_copies_to_vram

	thumb_func_start reset_temp_tile_data_buffers
reset_temp_tile_data_buffers: @ 80F6808
	push {lr}
	ldr r3, _080F6824 @ =gUnknown_203AB5C
	ldr r1, _080F6828 @ =gUnknown_203AB60
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0x7C
_080F6814:
	str r2, [r0]
	subs r0, 0x4
	cmp r0, r1
	bge _080F6814
	movs r0, 0
	strh r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_080F6824: .4byte gUnknown_203AB5C
_080F6828: .4byte gUnknown_203AB60
	thumb_func_end reset_temp_tile_data_buffers

	thumb_func_start free_temp_tile_data_buffers_if_possible
free_temp_tile_data_buffers_if_possible: @ 80F682C
	push {r4-r6,lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _080F6870
	ldr r1, _080F6868 @ =gUnknown_203AB5C
	ldrh r0, [r1]
	cmp r0, 0
	beq _080F6864
	movs r4, 0
	ldrh r1, [r1]
	cmp r4, r1
	bge _080F685E
	ldr r5, _080F686C @ =gUnknown_203AB60
	movs r6, 0
_080F684C:
	ldr r0, [r5]
	bl Free
	stm r5!, {r6}
	adds r4, 0x1
	ldr r0, _080F6868 @ =gUnknown_203AB5C
	ldrh r0, [r0]
	cmp r4, r0
	blt _080F684C
_080F685E:
	ldr r1, _080F6868 @ =gUnknown_203AB5C
	movs r0, 0
	strh r0, [r1]
_080F6864:
	movs r0, 0
	b _080F6872
	.align 2, 0
_080F6868: .4byte gUnknown_203AB5C
_080F686C: .4byte gUnknown_203AB60
_080F6870:
	movs r0, 0x1
_080F6872:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end free_temp_tile_data_buffers_if_possible

	thumb_func_start decompress_and_copy_tile_data_to_vram
decompress_and_copy_tile_data_to_vram: @ 80F6878
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r1, [sp, 0x24]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r6, _080F68D8 @ =gUnknown_203AB5C
	ldrh r0, [r6]
	cmp r0, 0x1F
	bhi _080F68E0
	adds r0, r4, 0
	add r1, sp, 0x4
	bl malloc_and_decompress
	adds r4, r0, 0
	cmp r5, 0
	bne _080F68B0
	ldr r5, [sp, 0x4]
_080F68B0:
	cmp r4, 0
	beq _080F68D4
	lsls r2, r5, 16
	lsrs r2, 16
	str r7, [sp]
	mov r0, r8
	adds r1, r4, 0
	mov r3, r9
	bl sub_80F6AD0
	ldr r2, _080F68DC @ =gUnknown_203AB60
	ldrh r0, [r6]
	adds r1, r0, 0x1
	strh r1, [r6]
	lsls r0, 16
	lsrs r0, 14
	adds r0, r2
	str r4, [r0]
_080F68D4:
	adds r0, r4, 0
	b _080F68E2
	.align 2, 0
_080F68D8: .4byte gUnknown_203AB5C
_080F68DC: .4byte gUnknown_203AB60
_080F68E0:
	movs r0, 0
_080F68E2:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end decompress_and_copy_tile_data_to_vram

	thumb_func_start sub_80F68F0
sub_80F68F0: @ 80F68F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r4, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x24]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r5, _080F6954 @ =gUnknown_203AB5C
	ldrh r0, [r5]
	cmp r0, 0x1F
	bhi _080F695C
	adds r0, r4, 0
	add r1, sp, 0x4
	bl malloc_and_decompress
	adds r4, r0, 0
	ldr r0, [sp, 0x4]
	cmp r0, r6
	bls _080F692A
	str r6, [sp, 0x4]
_080F692A:
	cmp r4, 0
	beq _080F6950
	ldr r2, [sp, 0x4]
	lsls r2, 16
	lsrs r2, 16
	str r7, [sp]
	mov r0, r8
	adds r1, r4, 0
	mov r3, r9
	bl sub_80F6AD0
	ldr r2, _080F6958 @ =gUnknown_203AB60
	ldrh r0, [r5]
	adds r1, r0, 0x1
	strh r1, [r5]
	lsls r0, 16
	lsrs r0, 14
	adds r0, r2
	str r4, [r0]
_080F6950:
	adds r0, r4, 0
	b _080F695E
	.align 2, 0
_080F6954: .4byte gUnknown_203AB5C
_080F6958: .4byte gUnknown_203AB60
_080F695C:
	movs r0, 0
_080F695E:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F68F0

	thumb_func_start sub_80F696C
sub_80F696C: @ 80F696C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r5, r2, 0
	ldr r2, [sp, 0x24]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r2, 24
	lsrs r7, r2, 24
	adds r0, r1, 0
	add r1, sp, 0x4
	bl malloc_and_decompress
	adds r6, r0, 0
	cmp r5, 0
	bne _080F699A
	ldr r5, [sp, 0x4]
_080F699A:
	cmp r6, 0
	beq _080F69D2
	ldr r0, _080F69E0 @ =task_free_buf_after_copying_tile_data_to_vram
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, r5, 16
	lsrs r2, 16
	str r7, [sp]
	mov r0, r8
	adds r1, r6, 0
	mov r3, r9
	bl sub_80F6AD0
	ldr r2, _080F69E4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x1
	adds r2, r6, 0
	bl SetWordTaskArg
_080F69D2:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F69E0: .4byte task_free_buf_after_copying_tile_data_to_vram
_080F69E4: .4byte gTasks
	thumb_func_end sub_80F696C

	thumb_func_start sub_80F69E8
sub_80F69E8: @ 80F69E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r2, 0
	ldr r2, [sp, 0x20]
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r3, 16
	lsrs r3, 16
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	adds r0, r1, 0
	add r1, sp, 0x4
	bl malloc_and_decompress
	adds r5, r0, 0
	ldr r0, [sp, 0x4]
	cmp r0, r4
	bls _080F6A14
	str r4, [sp, 0x4]
_080F6A14:
	cmp r5, 0
	beq _080F6A4E
	ldr r0, _080F6A5C @ =task_free_buf_after_copying_tile_data_to_vram
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, [sp, 0x4]
	lsls r2, 16
	lsrs r2, 16
	str r6, [sp]
	adds r0, r7, 0
	adds r1, r5, 0
	mov r3, r8
	bl sub_80F6AD0
	ldr r2, _080F6A60 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x1
	adds r2, r5, 0
	bl SetWordTaskArg
_080F6A4E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6A5C: .4byte task_free_buf_after_copying_tile_data_to_vram
_080F6A60: .4byte gTasks
	thumb_func_end sub_80F69E8

	thumb_func_start task_free_buf_after_copying_tile_data_to_vram
task_free_buf_after_copying_tile_data_to_vram: @ 80F6A64
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080F6A9C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	bl CheckForSpaceForDma3Request
	lsls r0, 16
	cmp r0, 0
	bne _080F6A94
	adds r0, r4, 0
	movs r1, 0x1
	bl GetWordTaskArg
	bl Free
	adds r0, r4, 0
	bl DestroyTask
_080F6A94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6A9C: .4byte gTasks
	thumb_func_end task_free_buf_after_copying_tile_data_to_vram

	thumb_func_start malloc_and_decompress
malloc_and_decompress: @ 80F6AA0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5, 0x1]
	strb r0, [r1]
	ldrb r0, [r5, 0x2]
	strb r0, [r1, 0x1]
	ldrb r0, [r5, 0x3]
	strb r0, [r1, 0x2]
	movs r0, 0
	strb r0, [r1, 0x3]
	ldr r0, [r1]
	bl Alloc
	adds r4, r0, 0
	cmp r4, 0
	beq _080F6AC8
	adds r0, r5, 0
	adds r1, r4, 0
	bl LZ77UnCompWram
_080F6AC8:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end malloc_and_decompress

	thumb_func_start sub_80F6AD0
sub_80F6AD0: @ 80F6AD0
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, [sp, 0x8]
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _080F6AEE
	cmp r1, 0x1
	beq _080F6AF6
_080F6AEE:
	adds r1, r4, 0
	bl LoadBgTiles
	b _080F6AFC
_080F6AF6:
	adds r1, r4, 0
	bl LoadBgTilemap
_080F6AFC:
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6AD0

	thumb_func_start sub_80F6B08
sub_80F6B08: @ 80F6B08
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r2, 0
	ldr r4, [sp, 0x28]
	ldr r2, [sp, 0x2C]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	lsls r5, 24
	lsrs r5, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x4]
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	bl GetBgTilemapBuffer
	mov r8, r0
	adds r0, r5, r4
	cmp r5, r0
	bge _080F6B80
	mov r9, r0
_080F6B46:
	ldr r3, [sp]
	ldr r1, [sp, 0x4]
	adds r0, r3, r1
	adds r7, r5, 0x1
	cmp r3, r0
	bge _080F6B78
	lsls r6, r5, 5
	ldr r1, _080F6B90 @ =0x00000fff
	mov r12, r1
	mov r1, r10
	lsls r5, r1, 12
	adds r4, r0, 0
_080F6B5E:
	adds r1, r6, r3
	lsls r1, 1
	add r1, r8
	ldrh r2, [r1]
	mov r0, r12
	ands r0, r2
	orrs r0, r5
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r4
	blt _080F6B5E
_080F6B78:
	lsls r0, r7, 24
	lsrs r5, r0, 24
	cmp r5, r9
	blt _080F6B46
_080F6B80:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6B90: .4byte 0x00000fff
	thumb_func_end sub_80F6B08

	thumb_func_start sub_80F6B94
sub_80F6B94: @ 80F6B94
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r1
	ldr r1, [sp, 0x24]
	ldr r4, [sp, 0x28]
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	bl GetBgTilemapBuffer
	adds r7, r0, 0
	movs r0, 0
	cmp r0, r8
	bcs _080F6C02
_080F6BCC:
	movs r2, 0
	adds r6, r0, 0x1
	cmp r2, r5
	bcs _080F6BFA
	adds r4, r0, 0
	muls r4, r5
	ldr r1, [sp]
	adds r0, r1
	lsls r3, r0, 5
_080F6BDE:
	adds r1, r4, r2
	lsls r1, 1
	add r1, r10
	adds r0, r3, r2
	add r0, r9
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r5
	bcc _080F6BDE
_080F6BFA:
	lsls r0, r6, 24
	lsrs r0, 24
	cmp r0, r8
	bcc _080F6BCC
_080F6C02:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F6B94

	thumb_func_start sub_80F6C14
sub_80F6C14: @ 80F6C14
	push {lr}
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
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
	pop {r0}
	bx r0
	thumb_func_end sub_80F6C14

	thumb_func_start InitStandardTextBoxWindows
InitStandardTextBoxWindows: @ 80F6C6C
	push {lr}
	ldr r0, _080F6C84 @ =gUnknown_841F42C
	bl InitWindows
	ldr r1, _080F6C88 @ =gUnknown_203ABE0
	movs r0, 0xFF
	strb r0, [r1]
	bl sub_8112EA8
	pop {r0}
	bx r0
	.align 2, 0
_080F6C84: .4byte gUnknown_841F42C
_080F6C88: .4byte gUnknown_203ABE0
	thumb_func_end InitStandardTextBoxWindows

	thumb_func_start sub_80F6C8C
sub_80F6C8C: @ 80F6C8C
	push {lr}
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	thumb_func_end sub_80F6C8C

	thumb_func_start ResetBg0
ResetBg0: @ 80F6C98
	push {lr}
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	bl DeactivateAllTextPrinters
	bl sub_80F6E9C
	pop {r0}
	bx r0
	thumb_func_end ResetBg0

	thumb_func_start sub_80F6CBC
sub_80F6CBC: @ 80F6CBC
	push {lr}
	bl RunTextPrinters
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80F6CBC

	thumb_func_start AddTextPrinterParametrized
AddTextPrinterParametrized: @ 80F6CD0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r7, [sp, 0x28]
	ldr r4, [sp, 0x2C]
	mov r8, r4
	ldr r5, [sp, 0x30]
	ldr r6, [sp, 0x34]
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	str r2, [sp]
	mov r2, sp
	movs r4, 0
	strb r0, [r2, 0x4]
	mov r0, sp
	strb r1, [r0, 0x5]
	strb r4, [r0, 0x6]
	movs r1, 0x1
	strb r1, [r0, 0x7]
	strb r4, [r0, 0x8]
	strb r1, [r0, 0x9]
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r4, sp
	ldrb r2, [r4, 0xC]
	subs r1, 0x11
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r4, 0xC]
	mov r0, sp
	mov r2, r8
	lsls r2, 4
	movs r4, 0xF
	strb r2, [r0, 0xC]
	mov r2, sp
	ands r5, r4
	ldrb r0, [r2, 0xD]
	ands r1, r0
	orrs r1, r5
	strb r1, [r2, 0xD]
	mov r0, sp
	lsrs r6, 20
	ands r1, r4
	orrs r1, r6
	strb r1, [r0, 0xD]
	ldr r2, _080F6D58 @ =gTextFlags
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r0, sp
	adds r1, r3, 0
	adds r2, r7, 0
	bl AddTextPrinter
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F6D58: .4byte gTextFlags
	thumb_func_end AddTextPrinterParametrized

	thumb_func_start sub_80F6D5C
sub_80F6D5C: @ 80F6D5C
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	ldr r3, _080F6DA8 @ =gTextFlags
	movs r4, 0x1
	ands r0, r4
	ldrb r2, [r3]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	bl sub_80CBE00
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080F6DB0
	bl GetTextSpeedSetting
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r2, _080F6DAC @ =gStringVar4
	str r5, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x4
	bl AddTextPrinterParametrized
	b _080F6DFC
	.align 2, 0
_080F6DA8: .4byte gTextFlags
_080F6DAC: .4byte gStringVar4
_080F6DB0:
	cmp r0, 0x1
	bne _080F6DDC
	bl GetTextSpeedSetting
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r2, _080F6DD8 @ =gStringVar4
	str r5, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x5
	bl AddTextPrinterParametrized
	b _080F6DFC
	.align 2, 0
_080F6DD8: .4byte gStringVar4
_080F6DDC:
	bl GetTextSpeedSetting
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r2, _080F6E04 @ =gStringVar4
	str r5, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	bl AddTextPrinterParametrized
_080F6DFC:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6E04: .4byte gStringVar4
	thumb_func_end sub_80F6D5C

	thumb_func_start sub_80F6E08
sub_80F6E08: @ 80F6E08
	push {r4,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080F6E4C @ =gTextFlags
	movs r4, 0x1
	ands r0, r4
	ldrb r2, [r3]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	bl GetTextSpeedSetting
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r2, _080F6E50 @ =gStringVar4
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	bl AddTextPrinterParametrized
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6E4C: .4byte gTextFlags
_080F6E50: .4byte gStringVar4
	thumb_func_end sub_80F6E08

	thumb_func_start sub_80F6E54
sub_80F6E54: @ 80F6E54
	push {r4,r5,lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _080F6E94 @ =gTextFlags
	movs r5, 0x1
	ands r0, r5
	ldrb r2, [r4]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	ldr r2, _080F6E98 @ =gStringVar4
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	bl AddTextPrinterParametrized
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6E94: .4byte gTextFlags
_080F6E98: .4byte gStringVar4
	thumb_func_end sub_80F6E54

	thumb_func_start sub_80F6E9C
sub_80F6E9C: @ 80F6E9C
	push {lr}
	ldr r0, _080F6EBC @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080F6EC4
	ldr r2, _080F6EC0 @ =gTextFlags
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl sub_814FF98
	b _080F6ED4
	.align 2, 0
_080F6EBC: .4byte gUnknown_203ADFA
_080F6EC0: .4byte gTextFlags
_080F6EC4:
	bl sub_80F77B8
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	movs r2, 0xF0
	bl sub_814FEAC
_080F6ED4:
	movs r1, 0x85
	lsls r1, 2
	movs r0, 0
	movs r2, 0xE0
	bl sub_815001C
	pop {r0}
	bx r0
	thumb_func_end sub_80F6E9C

	thumb_func_start DrawDialogueFrame
DrawDialogueFrame: @ 80F6EE4
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F6F18 @ =sub_80F7124
	adds r0, r5, 0
	bl CallWindowFunction
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl PutWindowTilemap
	cmp r4, 0x1
	bne _080F6F12
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
_080F6F12:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6F18: .4byte sub_80F7124
	thumb_func_end DrawDialogueFrame

	thumb_func_start DrawStdWindowFrame
DrawStdWindowFrame: @ 80F6F1C
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F6F50 @ =sub_80F6FD4
	adds r0, r5, 0
	bl CallWindowFunction
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl PutWindowTilemap
	cmp r4, 0x1
	bne _080F6F4A
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
_080F6F4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6F50: .4byte sub_80F6FD4
	thumb_func_end DrawStdWindowFrame

	thumb_func_start ClearDialogWindowAndFrame
ClearDialogWindowAndFrame: @ 80F6F54
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F6F94 @ =sub_80F76CC
	adds r0, r5, 0
	bl CallWindowFunction
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl ClearWindowTilemap
	cmp r4, 0x1
	bne _080F6F82
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
_080F6F82:
	ldr r0, _080F6F98 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080F6F8E
	bl sub_8111134
_080F6F8E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6F94: .4byte sub_80F76CC
_080F6F98: .4byte gUnknown_203ADFA
	thumb_func_end ClearDialogWindowAndFrame

	thumb_func_start ClearStdWindowAndFrame
ClearStdWindowAndFrame: @ 80F6F9C
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F6FD0 @ =sub_80F7684
	adds r0, r5, 0
	bl CallWindowFunction
	adds r0, r5, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl ClearWindowTilemap
	cmp r4, 0x1
	bne _080F6FCA
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
_080F6FCA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6FD0: .4byte sub_80F7684
	thumb_func_end ClearStdWindowAndFrame

	thumb_func_start sub_80F6FD4
sub_80F6FD4: @ 80F6FD4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	adds r4, r2, 0
	ldr r2, [sp, 0x3C]
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsls r4, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x14]
	movs r3, 0x85
	lsls r3, 2
	lsrs r0, r1, 24
	str r0, [sp, 0xC]
	movs r2, 0xFF
	lsls r2, 24
	adds r2, r1
	mov r8, r2
	lsrs r2, 24
	lsrs r0, r4, 24
	mov r9, r0
	movs r0, 0xFF
	lsls r0, 24
	adds r4, r0
	lsrs r4, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	movs r6, 0xE
	str r6, [sp, 0x8]
	adds r0, r7, 0
	adds r1, r3, 0
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F710C @ =0x00000215
	ldr r2, [sp, 0x10]
	str r2, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0xC]
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7110 @ =0x00000216
	ldr r3, [sp, 0xC]
	ldr r2, [sp, 0x10]
	adds r0, r3, r2
	lsls r0, 24
	mov r10, r0
	lsrs r2, r0, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	mov r5, r9
	ldr r0, [sp, 0x14]
	add r0, r9
	cmp r9, r0
	bge _080F70A8
	mov r3, r8
	str r3, [sp, 0x18]
	movs r6, 0x1
	movs r0, 0xE
	mov r8, r0
_080F706E:
	lsls r4, r5, 24
	lsrs r4, 24
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r2, r8
	str r2, [sp, 0x8]
	adds r0, r7, 0
	ldr r1, _080F7114 @ =0x00000217
	ldr r3, [sp, 0x18]
	lsrs r2, r3, 24
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r0, r8
	str r0, [sp, 0x8]
	adds r0, r7, 0
	ldr r1, _080F7118 @ =0x00000219
	mov r3, r10
	lsrs r2, r3, 24
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	adds r5, 0x1
	ldr r0, [sp, 0x14]
	add r0, r9
	cmp r5, r0
	blt _080F706E
_080F70A8:
	ldr r1, _080F711C @ =0x0000021a
	ldr r2, [sp, 0xC]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r4, [sp, 0x14]
	add r4, r9
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	movs r6, 0xE
	str r6, [sp, 0x8]
	adds r0, r7, 0
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7120 @ =0x0000021b
	ldr r0, [sp, 0x10]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0xC]
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	movs r1, 0x87
	lsls r1, 2
	ldr r3, [sp, 0xC]
	ldr r0, [sp, 0x10]
	adds r2, r3, r0
	lsls r2, 24
	lsrs r2, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	adds r3, r4, 0
	bl FillBgTilemapBufferRect
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F710C: .4byte 0x00000215
_080F7110: .4byte 0x00000216
_080F7114: .4byte 0x00000217
_080F7118: .4byte 0x00000219
_080F711C: .4byte 0x0000021a
_080F7120: .4byte 0x0000021b
	thumb_func_end sub_80F6FD4

	thumb_func_start sub_80F7124
sub_80F7124: @ 80F7124
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0xC]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x14]
	bl sub_8069A38
	lsls r0, 24
	cmp r0, 0
	beq _080F715A
	ldr r0, _080F7390 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080F715A
	b _080F73E8
_080F715A:
	movs r1, 0x80
	lsls r1, 2
	ldr r0, [sp, 0xC]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r5, [sp, 0x10]
	subs r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r6, 0xF
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7394 @ =0x00000201
	ldr r2, [sp, 0xC]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7398 @ =0x00000202
	ldr r0, [sp, 0x14]
	str r0, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0xC]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F739C @ =0x00000203
	ldr r2, [sp, 0xC]
	ldr r0, [sp, 0x14]
	adds r2, r0
	mov r8, r2
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x18]
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	movs r1, 0x81
	lsls r1, 2
	add r8, r4
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73A0 @ =0x00000205
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	ldr r3, [sp, 0x10]
	bl FillBgTilemapBufferRect
	ldr r1, _080F73A4 @ =0x00000206
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	ldr r3, [sp, 0x10]
	bl FillBgTilemapBufferRect
	movs r1, 0x82
	lsls r1, 2
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x10]
	bl FillBgTilemapBufferRect
	ldr r1, _080F73A8 @ =0x00000209
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	ldr r3, [sp, 0x10]
	bl FillBgTilemapBufferRect
	ldr r1, _080F73AC @ =0x0000020a
	ldr r5, [sp, 0x10]
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73B0 @ =0x0000020b
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	movs r1, 0x83
	lsls r1, 2
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x18]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73B4 @ =0x0000020d
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73B8 @ =0x00000a0a
	ldr r5, [sp, 0x10]
	adds r5, 0x2
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73BC @ =0x00000a0b
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73C0 @ =0x00000a0c
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x18]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73C4 @ =0x00000a0d
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73C8 @ =0x00000a05
	ldr r5, [sp, 0x10]
	adds r5, 0x3
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73CC @ =0x00000a06
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73D0 @ =0x00000a08
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x18]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73D4 @ =0x00000a09
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xA0
	lsls r1, 4
	ldr r5, [sp, 0x10]
	adds r5, 0x4
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73D8 @ =0x00000a01
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73DC @ =0x00000a02
	ldr r0, [sp, 0x14]
	str r0, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0xC]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73E0 @ =0x00000a03
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x18]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F73E4 @ =0x00000a04
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	b _080F761E
	.align 2, 0
_080F7390: .4byte gUnknown_203ADFA
_080F7394: .4byte 0x00000201
_080F7398: .4byte 0x00000202
_080F739C: .4byte 0x00000203
_080F73A0: .4byte 0x00000205
_080F73A4: .4byte 0x00000206
_080F73A8: .4byte 0x00000209
_080F73AC: .4byte 0x0000020a
_080F73B0: .4byte 0x0000020b
_080F73B4: .4byte 0x0000020d
_080F73B8: .4byte 0x00000a0a
_080F73BC: .4byte 0x00000a0b
_080F73C0: .4byte 0x00000a0c
_080F73C4: .4byte 0x00000a0d
_080F73C8: .4byte 0x00000a05
_080F73CC: .4byte 0x00000a06
_080F73D0: .4byte 0x00000a08
_080F73D4: .4byte 0x00000a09
_080F73D8: .4byte 0x00000a01
_080F73DC: .4byte 0x00000a02
_080F73E0: .4byte 0x00000a03
_080F73E4: .4byte 0x00000a04
_080F73E8:
	movs r1, 0x80
	lsls r1, 2
	ldr r2, [sp, 0xC]
	subs r2, 0x2
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldr r5, [sp, 0x10]
	subs r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r6, 0xF
	str r6, [sp, 0x8]
	adds r0, r7, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7630 @ =0x00000201
	ldr r0, [sp, 0xC]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7634 @ =0x00000202
	ldr r2, [sp, 0x14]
	str r2, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0xC]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7638 @ =0x00000203
	ldr r0, [sp, 0xC]
	ldr r2, [sp, 0x14]
	adds r0, r2
	mov r8, r0
	lsls r2, r0, 24
	lsrs r2, 24
	str r2, [sp, 0x1C]
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	movs r1, 0x81
	lsls r1, 2
	add r8, r4
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F763C @ =0x00000205
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	ldr r3, [sp, 0x10]
	bl FillBgTilemapBufferRect
	ldr r1, _080F7640 @ =0x00000206
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	ldr r3, [sp, 0x10]
	bl FillBgTilemapBufferRect
	movs r1, 0x82
	lsls r1, 2
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x1C]
	ldr r3, [sp, 0x10]
	bl FillBgTilemapBufferRect
	ldr r1, _080F7644 @ =0x00000209
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	ldr r3, [sp, 0x10]
	bl FillBgTilemapBufferRect
	ldr r1, _080F7648 @ =0x0000020a
	ldr r5, [sp, 0x10]
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F764C @ =0x0000020b
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	movs r1, 0x83
	lsls r1, 2
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x1C]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7650 @ =0x0000020d
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7654 @ =0x00000a05
	ldr r5, [sp, 0x10]
	adds r5, 0x2
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7658 @ =0x00000a06
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F765C @ =0x00000a08
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x1C]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7660 @ =0x00000a09
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7664 @ =0x00000a0a
	ldr r5, [sp, 0x10]
	adds r5, 0x3
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7668 @ =0x00000a0b
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F766C @ =0x00000a0c
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x1C]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7670 @ =0x00000a0d
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	movs r1, 0xA0
	lsls r1, 4
	ldr r5, [sp, 0x10]
	adds r5, 0x4
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r10
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7674 @ =0x00000a01
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r9
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7678 @ =0x00000a02
	ldr r2, [sp, 0x14]
	str r2, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0xC]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F767C @ =0x00000a03
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	ldr r2, [sp, 0x1C]
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	ldr r1, _080F7680 @ =0x00000a04
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
_080F761E:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7630: .4byte 0x00000201
_080F7634: .4byte 0x00000202
_080F7638: .4byte 0x00000203
_080F763C: .4byte 0x00000205
_080F7640: .4byte 0x00000206
_080F7644: .4byte 0x00000209
_080F7648: .4byte 0x0000020a
_080F764C: .4byte 0x0000020b
_080F7650: .4byte 0x0000020d
_080F7654: .4byte 0x00000a05
_080F7658: .4byte 0x00000a06
_080F765C: .4byte 0x00000a08
_080F7660: .4byte 0x00000a09
_080F7664: .4byte 0x00000a0a
_080F7668: .4byte 0x00000a0b
_080F766C: .4byte 0x00000a0c
_080F7670: .4byte 0x00000a0d
_080F7674: .4byte 0x00000a01
_080F7678: .4byte 0x00000a02
_080F767C: .4byte 0x00000a03
_080F7680: .4byte 0x00000a04
	thumb_func_end sub_80F7124

	thumb_func_start sub_80F7684
sub_80F7684: @ 80F7684
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r1, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsls r5, 24
	lsls r3, 24
	lsls r1, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r4, r2
	lsrs r4, 24
	adds r5, r2
	lsrs r5, 24
	movs r2, 0x80
	lsls r2, 18
	adds r3, r2
	lsrs r3, 24
	str r3, [sp]
	adds r1, r2
	lsrs r1, 24
	str r1, [sp, 0x4]
	movs r1, 0xE
	str r1, [sp, 0x8]
	movs r1, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F7684

	thumb_func_start sub_80F76CC
sub_80F76CC: @ 80F76CC
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r1, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsls r5, 24
	lsls r3, 24
	lsls r1, 24
	movs r2, 0xFE
	lsls r2, 24
	adds r4, r2
	lsrs r4, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r5, r2
	lsrs r5, 24
	movs r2, 0x80
	lsls r2, 19
	adds r3, r2
	lsrs r3, 24
	str r3, [sp]
	movs r2, 0x80
	lsls r2, 18
	adds r1, r2
	lsrs r1, 24
	str r1, [sp, 0x4]
	movs r1, 0xE
	str r1, [sp, 0x8]
	movs r1, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F76CC

	thumb_func_start sub_80F771C
sub_80F771C: @ 80F771C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	cmp r4, 0x1
	bne _080F7746
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_080F7746:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F771C

	thumb_func_start sub_80F7750
sub_80F7750: @ 80F7750
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x85
	lsls r2, 2
	movs r3, 0xE
	bl SetWindowBorderStyle
	pop {r0}
	bx r0
	thumb_func_end sub_80F7750

	thumb_func_start sub_80F7768
sub_80F7768: @ 80F7768
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080F7790 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080F7798
	ldr r2, _080F7794 @ =gTextFlags
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl sub_814FF98
	b _080F77A4
	.align 2, 0
_080F7790: .4byte gUnknown_203ADFA
_080F7794: .4byte gTextFlags
_080F7798:
	movs r1, 0x80
	lsls r1, 2
	adds r0, r4, 0
	movs r2, 0xF0
	bl sub_814FEAC
_080F77A4:
	movs r2, 0x80
	lsls r2, 2
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0xF
	bl sub_810EDC4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F7768

	thumb_func_start sub_80F77B8
sub_80F77B8: @ 80F77B8
	push {lr}
	ldr r0, _080F77C8 @ =gUnknown_841F408
	movs r1, 0xE0
	movs r2, 0x14
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080F77C8: .4byte gUnknown_841F408
	thumb_func_end sub_80F77B8

	thumb_func_start Menu_LoadStdPalAt
Menu_LoadStdPalAt: @ 80F77CC
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _080F77E0 @ =gUnknown_841F408
	movs r2, 0x14
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080F77E0: .4byte gUnknown_841F408
	thumb_func_end Menu_LoadStdPalAt

	thumb_func_start sub_80F77E4
sub_80F77E4: @ 80F77E4
	ldr r0, _080F77E8 @ =gUnknown_841F408
	bx lr
	.align 2, 0
_080F77E8: .4byte gUnknown_841F408
	thumb_func_end sub_80F77E4

	thumb_func_start sub_80F77EC
sub_80F77EC: @ 80F77EC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080F77F8
	movs r1, 0
_080F77F8:
	ldr r0, _080F7804 @ =gUnknown_841F408
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_080F7804: .4byte gUnknown_841F408
	thumb_func_end sub_80F77EC

	thumb_func_start DisplayItemMessageOnField
DisplayItemMessageOnField: @ 80F7808
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F6E9C
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 2
	str r4, [sp]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	movs r3, 0xF
	bl DisplayMessageAndContinueTask
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end DisplayItemMessageOnField

	thumb_func_start sub_80F7858
sub_80F7858: @ 80F7858
	push {lr}
	sub sp, 0xC
	ldr r0, _080F787C @ =gUnknown_841F43C
	movs r1, 0x85
	lsls r1, 2
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810FF60
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_080F787C: .4byte gUnknown_841F43C
	thumb_func_end sub_80F7858

	thumb_func_start sub_80F7880
sub_80F7880: @ 80F7880
	push {lr}
	sub sp, 0xC
	ldr r0, _080F78A4 @ =gUnknown_841F43C
	movs r1, 0x85
	lsls r1, 2
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	movs r1, 0x1
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810FF60
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_080F78A4: .4byte gUnknown_841F43C
	thumb_func_end sub_80F7880

	thumb_func_start GetTextSpeedSetting
GetTextSpeedSetting: @ 80F78A8
	push {lr}
	ldr r3, _080F78D8 @ =gSaveBlock2Ptr
	ldr r2, [r3]
	ldrb r1, [r2, 0x14]
	lsls r0, r1, 29
	lsrs r0, 29
	cmp r0, 0x2
	bls _080F78C4
	movs r0, 0x8
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x14]
_080F78C4:
	ldr r1, _080F78DC @ =gUnknown_841F428
	ldr r0, [r3]
	ldrb r0, [r0, 0x14]
	lsls r0, 29
	lsrs r0, 29
	adds r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080F78D8: .4byte gSaveBlock2Ptr
_080F78DC: .4byte gUnknown_841F428
	thumb_func_end GetTextSpeedSetting

	thumb_func_start sub_80F78E0
sub_80F78E0: @ 80F78E0
	push {r4,lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r4, _080F7934 @ =gUnknown_203ABE0
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080F792A
	movs r0, 0x7
	str r0, [sp]
	lsls r0, r1, 25
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	ldr r0, _080F7938 @ =0x0000013d
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	movs r1, 0
	movs r2, 0x16
	movs r3, 0x1
	bl SetWindowTemplateFields
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	add r0, sp, 0x18
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	bl PutWindowTilemap
_080F792A:
	ldrb r0, [r4]
	add sp, 0x20
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F7934: .4byte gUnknown_203ABE0
_080F7938: .4byte 0x0000013d
	thumb_func_end sub_80F78E0

	thumb_func_start GetStartMenuWindowId
GetStartMenuWindowId: @ 80F793C
	ldr r0, _080F7944 @ =gUnknown_203ABE0
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080F7944: .4byte gUnknown_203ABE0
	thumb_func_end GetStartMenuWindowId

	thumb_func_start remove_start_menu_window_maybe
remove_start_menu_window_maybe: @ 80F7948
	push {r4,lr}
	ldr r4, _080F7960 @ =gUnknown_203ABE0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080F795A
	bl RemoveWindow
	movs r0, 0xFF
	strb r0, [r4]
_080F795A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7960: .4byte gUnknown_203ABE0
	thumb_func_end remove_start_menu_window_maybe

	thumb_func_start sub_80F7964
sub_80F7964: @ 80F7964
	movs r0, 0x80
	lsls r0, 2
	bx lr
	thumb_func_end sub_80F7964

	thumb_func_start sub_80F796C
sub_80F796C: @ 80F796C
	movs r0, 0x85
	lsls r0, 2
	bx lr
	thumb_func_end sub_80F796C

	thumb_func_start sub_80F7974
sub_80F7974: @ 80F7974
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8112EB4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 2
	movs r2, 0xF0
	bl sub_814FE6C
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8113018
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F7974

	thumb_func_start sub_80F7998
sub_80F7998: @ 80F7998
	push {lr}
	movs r0, 0x2
	bl sub_8112EDC
	pop {r0}
	bx r0
	thumb_func_end sub_80F7998

	thumb_func_start sub_80F79A4
sub_80F79A4: @ 80F79A4
	push {lr}
	bl sub_80F77B8
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	movs r2, 0xF0
	bl sub_814FEEC
	movs r1, 0x85
	lsls r1, 2
	movs r0, 0
	movs r2, 0xE0
	bl sub_815001C
	pop {r0}
	bx r0
	thumb_func_end sub_80F79A4

	thumb_func_start SetDefaultFontsPointer
SetDefaultFontsPointer: @ 80F79C8
	push {lr}
	ldr r0, _080F79D4 @ =gUnknown_841F444
	bl SetFontsPointer
	pop {r0}
	bx r0
	.align 2, 0
_080F79D4: .4byte gUnknown_841F444
	thumb_func_end SetDefaultFontsPointer

	thumb_func_start GetFontAttribute
GetFontAttribute: @ 80F79D8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	cmp r1, 0x7
	bhi _080F7AB6
	lsls r0, r1, 2
	ldr r1, _080F79F4 @ =_080F79F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F79F4: .4byte _080F79F8
	.align 2, 0
_080F79F8:
	.4byte _080F7A18
	.4byte _080F7A2C
	.4byte _080F7A40
	.4byte _080F7A54
	.4byte _080F7A68
	.4byte _080F7A7C
	.4byte _080F7A90
	.4byte _080F7AA8
_080F7A18:
	ldr r1, _080F7A28 @ =gUnknown_841F444
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x4]
	b _080F7AB6
	.align 2, 0
_080F7A28: .4byte gUnknown_841F444
_080F7A2C:
	ldr r1, _080F7A3C @ =gUnknown_841F444
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	b _080F7AB6
	.align 2, 0
_080F7A3C: .4byte gUnknown_841F444
_080F7A40:
	ldr r1, _080F7A50 @ =gUnknown_841F444
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x6]
	b _080F7AB6
	.align 2, 0
_080F7A50: .4byte gUnknown_841F444
_080F7A54:
	ldr r1, _080F7A64 @ =gUnknown_841F444
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x7]
	b _080F7AB6
	.align 2, 0
_080F7A64: .4byte gUnknown_841F444
_080F7A68:
	ldr r0, _080F7A78 @ =gUnknown_841F444
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x8]
	b _080F7A9C
	.align 2, 0
_080F7A78: .4byte gUnknown_841F444
_080F7A7C:
	ldr r0, _080F7A8C @ =gUnknown_841F444
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x8]
	b _080F7AB4
	.align 2, 0
_080F7A8C: .4byte gUnknown_841F444
_080F7A90:
	ldr r0, _080F7AA4 @ =gUnknown_841F444
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x9]
_080F7A9C:
	lsls r0, 28
	lsrs r0, 28
	b _080F7AB6
	.align 2, 0
_080F7AA4: .4byte gUnknown_841F444
_080F7AA8:
	ldr r0, _080F7ABC @ =gUnknown_841F444
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x9]
_080F7AB4:
	lsrs r0, 4
_080F7AB6:
	pop {r1}
	bx r1
	.align 2, 0
_080F7ABC: .4byte gUnknown_841F444
	thumb_func_end GetFontAttribute

	thumb_func_start GetMenuCursorDimensionByFont
GetMenuCursorDimensionByFont: @ 80F7AC0
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080F7AD4 @ =gUnknown_841F4A4
	lsrs r0, 23
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080F7AD4: .4byte gUnknown_841F4A4
	thumb_func_end GetMenuCursorDimensionByFont

	.align 2, 0 @ Don't pad with nop.
