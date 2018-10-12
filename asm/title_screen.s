	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8078914
sub_8078914: @ 8078914
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r0, _08078930 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r6, [r0]
	cmp r6, 0x1
	beq _080789F0
	cmp r6, 0x1
	bgt _08078934
	cmp r6, 0
	beq _08078946
	b _0807893A
	.align 2, 0
_08078930: .4byte gMain
_08078934:
	cmp r6, 0x2
	bne _0807893A
	b _08078AC0
_0807893A:
	ldr r0, _080789D0 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_08078946:
	movs r0, 0
	bl SetVBlankCallback
	bl StartTimer1
	ldr r0, _080789D4 @ =gHeap
	movs r1, 0xE0
	lsls r1, 9
	bl InitHeap
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl sub_8078B34
	add r1, sp, 0x4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080789D8 @ =0x040000d4
	add r0, sp, 0x4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080789DC @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080789E0 @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strh r2, [r0]
	str r0, [r1]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080789E4 @ =0x81000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080789E8 @ =gUnknown_83BFB74
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080789EC @ =gUnknown_2037F30
	movs r0, 0xFF
	strb r0, [r1]
	b _08078B18
	.align 2, 0
_080789D0: .4byte gMain
_080789D4: .4byte gHeap
_080789D8: .4byte 0x040000d4
_080789DC: .4byte 0x8100c000
_080789E0: .4byte 0x85000100
_080789E4: .4byte 0x81000200
_080789E8: .4byte gUnknown_83BFB74
_080789EC: .4byte gUnknown_2037F30
_080789F0:
	ldr r0, _08078A94 @ =gUnknown_8EAB6C4
	movs r2, 0xD0
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	ldr r1, _08078A98 @ =gUnknown_8EAB8C4
	movs r4, 0
	str r4, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _08078A9C @ =gUnknown_8EAD390
	str r6, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _08078AA0 @ =gUnknown_8EAD5E8
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08078AA4 @ =gUnknown_8EAD608
	str r4, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _08078AA8 @ =gUnknown_8EADEE4
	str r6, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r5, _08078AAC @ =gUnknown_8EAE094
	adds r0, r5, 0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08078AB0 @ =gUnknown_8EAE0B4
	str r4, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _08078AB4 @ =gUnknown_8EAE374
	str r6, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	adds r0, r5, 0
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08078AB8 @ =gUnknown_83BF58C
	str r4, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _08078ABC @ =gUnknown_83BF5A8
	str r6, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	bl sub_8079708
	b _08078B18
	.align 2, 0
_08078A94: .4byte gUnknown_8EAB6C4
_08078A98: .4byte gUnknown_8EAB8C4
_08078A9C: .4byte gUnknown_8EAD390
_08078AA0: .4byte gUnknown_8EAD5E8
_08078AA4: .4byte gUnknown_8EAD608
_08078AA8: .4byte gUnknown_8EADEE4
_08078AAC: .4byte gUnknown_8EAE094
_08078AB0: .4byte gUnknown_8EAE0B4
_08078AB4: .4byte gUnknown_8EAE374
_08078AB8: .4byte gUnknown_83BF58C
_08078ABC: .4byte gUnknown_83BF5A8
_08078AC0:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	cmp r0, 0
	bne _08078B26
	ldr r0, _08078B00 @ =0x0000ffff
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _08078B04 @ =sub_8078C24
	movs r1, 0x4
	bl CreateTask
	ldr r0, _08078B08 @ =sub_8078BEC
	movs r1, 0x2
	bl CreateTask
	ldr r1, _08078B0C @ =gUnknown_2037F30
	strb r0, [r1]
	ldr r0, _08078B10 @ =sub_8078BB4
	bl SetVBlankCallback
	ldr r0, _08078B14 @ =sub_8078B9C
	bl SetMainCallback2
	movs r0, 0x8B
	lsls r0, 1
	bl m4aSongNumStart
	b _08078B26
	.align 2, 0
_08078B00: .4byte 0x0000ffff
_08078B04: .4byte sub_8078C24
_08078B08: .4byte sub_8078BEC
_08078B0C: .4byte gUnknown_2037F30
_08078B10: .4byte sub_8078BB4
_08078B14: .4byte sub_8078B9C
_08078B18:
	ldr r1, _08078B30 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08078B26:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078B30: .4byte gMain
	thumb_func_end sub_8078914

	thumb_func_start sub_8078B34
sub_8078B34: @ 8078B34
	push {lr}
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x16
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1C
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_8078B34

	thumb_func_start sub_8078B9C
sub_8078B9C: @ 8078B9C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8078B9C

	thumb_func_start sub_8078BB4
sub_8078BB4: @ 8078BB4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8087F54
	ldr r1, _08078BE4 @ =gUnknown_2037F30
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08078BE0
	ldr r2, _08078BE8 @ =gTasks
	adds r1, r0, 0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
_08078BE0:
	pop {r0}
	bx r0
	.align 2, 0
_08078BE4: .4byte gUnknown_2037F30
_08078BE8: .4byte gTasks
	thumb_func_end sub_8078BB4

	thumb_func_start sub_8078BEC
sub_8078BEC: @ 8078BEC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _08078C18 @ =gTasks+0x8
	adds r0, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _08078C1C @ =0x00000a8b
	cmp r1, r0
	ble _08078C12
	ldr r1, _08078C20 @ =gUnknown_2037F30
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r2, 0
	bl DestroyTask
_08078C12:
	pop {r0}
	bx r0
	.align 2, 0
_08078C18: .4byte gTasks+0x8
_08078C1C: .4byte 0x00000a8b
_08078C20: .4byte gUnknown_2037F30
	thumb_func_end sub_8078BEC

	thumb_func_start sub_8078C24
sub_8078C24: @ 8078C24
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08078C6C @ =gTasks+0x8
	adds r4, r1, r0
	ldr r0, _08078C70 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xB
	ands r0, r1
	cmp r0, 0
	beq _08078C74
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	beq _08078C74
	cmp r0, 0x4
	beq _08078C74
	cmp r0, 0x5
	beq _08078C74
	bl sub_8079620
	bl sub_8079648
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	bl sub_8079A10
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8078C90
	b _08078C86
	.align 2, 0
_08078C6C: .4byte gTasks+0x8
_08078C70: .4byte gMain
_08078C74:
	ldr r0, _08078C8C @ =gUnknown_83BFB84
	movs r2, 0
	ldrsh r1, [r4, r2]
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
_08078C86:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078C8C: .4byte gUnknown_83BFB84
	thumb_func_end sub_8078C24

	thumb_func_start sub_8078C90
sub_8078C90: @ 8078C90
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r2, [r0, 0x2]
	strh r1, [r0]
	bx lr
	thumb_func_end sub_8078C90

	thumb_func_start sub_8078C9C
sub_8078C9C: @ 8078C9C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	mov r8, r0
	movs r0, 0
	bl HideBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	ldr r0, _08078D14 @ =0x04000054
	str r0, [sp]
	ldr r0, _08078D18 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r5, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r5, [r0, 0x9]
	add r0, sp, 0xC
	strh r5, [r0]
	ldr r4, _08078D1C @ =gUnknown_2038700
	ldr r6, _08078D20 @ =0x010000a0
	adds r1, r4, 0
	adds r2, r6, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0xE
	strh r5, [r0]
	movs r1, 0xF0
	lsls r1, 3
	adds r4, r1
	adds r1, r4, 0
	adds r2, r6, 0
	bl CpuSet
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_8087EE4
	mov r0, r8
	movs r1, 0x1
	bl sub_8078C90
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078D14: .4byte 0x04000054
_08078D18: .4byte 0xa2600001
_08078D1C: .4byte gUnknown_2038700
_08078D20: .4byte 0x010000a0
	thumb_func_end sub_8078C9C

	thumb_func_start sub_8078D24
sub_8078D24: @ 8078D24
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08078D5C
	cmp r0, 0x1
	bgt _08078D3A
	cmp r0, 0
	beq _08078D40
	b _08078D9C
_08078D3A:
	cmp r0, 0x2
	beq _08078D84
	b _08078D9C
_08078D40:
	movs r0, 0x50
	movs r1, 0x82
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x80
	strh r0, [r4, 0x4]
	movs r0, 0x80
	bl sub_8079550
	b _08078D78
_08078D5C:
	ldrh r0, [r4, 0x4]
	subs r0, 0x4
	strh r0, [r4, 0x4]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	bl sub_8079550
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _08078D9C
	ldr r1, _08078D80 @ =gUnknown_2039600
	movs r0, 0x3
	strb r0, [r1, 0x15]
_08078D78:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	b _08078D9C
	.align 2, 0
_08078D80: .4byte gUnknown_2039600
_08078D84:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8078C90
_08078D9C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078D24

	thumb_func_start sub_8078DA4
sub_8078DA4: @ 8078DA4
	push {r4-r7,lr}
	sub sp, 0xC
	adds r6, r0, 0
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0x9
	bls _08078DB4
	b _08078FB6
_08078DB4:
	lsls r0, 2
	ldr r1, _08078DC0 @ =_08078DC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078DC0: .4byte _08078DC4
	.align 2, 0
_08078DC4:
	.4byte _08078DEC
	.4byte _08078DF2
	.4byte _08078E24
	.4byte _08078E40
	.4byte _08078E80
	.4byte _08078EA4
	.4byte _08078ED4
	.4byte _08078EF8
	.4byte _08078F24
	.4byte _08078F98
_08078DEC:
	movs r0, 0
	strh r0, [r6, 0x4]
	b _08078F80
_08078DF2:
	ldrh r0, [r6, 0x4]
	adds r0, 0x1
	strh r0, [r6, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bgt _08078E02
	b _08078FB6
_08078E02:
	ldr r0, _08078E20 @ =gUnknown_2037398
	movs r1, 0x10
	bl TintPalette_GrayScale2
	movs r0, 0x80
	lsls r0, 6
	movs r1, 0
	str r1, [sp]
	movs r1, 0x9
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08078F80
	.align 2, 0
_08078E20: .4byte gUnknown_2037398
_08078E24:
	ldr r0, _08078E3C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08078E36
	b _08078FB6
_08078E36:
	strh r0, [r6, 0x4]
	b _08078F80
	.align 2, 0
_08078E3C: .4byte gPaletteFade
_08078E40:
	ldrh r0, [r6, 0x4]
	adds r0, 0x1
	strh r0, [r6, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x24
	bgt _08078E50
	b _08078FB6
_08078E50:
	ldr r0, _08078E78 @ =sub_80792C8
	movs r1, 0x3
	bl CreateTask
	movs r0, 0x80
	lsls r0, 6
	movs r1, 0x4
	negs r1, r1
	ldr r2, _08078E7C @ =0x00007fde
	str r2, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r2, 0x1
	movs r3, 0x10
	bl sub_80717A8
	strh r4, [r6, 0x4]
	b _08078F80
	.align 2, 0
_08078E78: .4byte sub_80792C8
_08078E7C: .4byte 0x00007fde
_08078E80:
	movs r0, 0
	bl sub_807185C
	adds r3, r0, 0
	cmp r3, 0
	beq _08078E8E
	b _08078FB6
_08078E8E:
	movs r0, 0x80
	lsls r0, 6
	movs r1, 0x4
	negs r1, r1
	ldr r2, _08078EA0 @ =0x00007fde
	str r2, [sp]
	str r3, [sp, 0x4]
	str r3, [sp, 0x8]
	b _08078F78
	.align 2, 0
_08078EA0: .4byte 0x00007fde
_08078EA4:
	ldrh r0, [r6, 0x4]
	adds r0, 0x1
	strh r0, [r6, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bgt _08078EB4
	b _08078FB6
_08078EB4:
	movs r0, 0
	strh r0, [r6, 0x4]
	movs r0, 0x80
	lsls r0, 6
	movs r1, 0x4
	negs r1, r1
	ldr r2, _08078ED0 @ =0x00007fde
	str r2, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r2, 0x1
	movs r3, 0x10
	b _08078F7C
	.align 2, 0
_08078ED0: .4byte 0x00007fde
_08078ED4:
	movs r0, 0
	bl sub_807185C
	adds r3, r0, 0
	cmp r3, 0
	bne _08078FB6
	movs r0, 0x80
	lsls r0, 6
	movs r1, 0x4
	negs r1, r1
	ldr r2, _08078EF4 @ =0x00007fde
	str r2, [sp]
	str r3, [sp, 0x4]
	str r3, [sp, 0x8]
	b _08078F78
	.align 2, 0
_08078EF4: .4byte 0x00007fde
_08078EF8:
	ldrh r0, [r6, 0x4]
	adds r0, 0x1
	strh r0, [r6, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08078FB6
	movs r0, 0
	strh r0, [r6, 0x4]
	movs r0, 0x80
	lsls r0, 6
	movs r1, 0x3
	negs r1, r1
	ldr r2, _08078F20 @ =0x00007fde
	str r2, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r3, 0x10
	b _08078F7C
	.align 2, 0
_08078F20: .4byte 0x00007fde
_08078F24:
	movs r0, 0
	bl sub_807185C
	adds r7, r0, 0
	cmp r7, 0
	bne _08078FB6
	movs r0, 0x1
	strh r0, [r6, 0xA]
	bl sub_80799F0
	movs r4, 0x80
	lsls r4, 9
	lsls r4, r0
	ldr r0, _08078F88 @ =0x00001fff
	orrs r4, r0
	ldr r5, _08078F8C @ =0x00007fde
	adds r0, r4, 0
	movs r1, 0x10
	adds r2, r5, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	ldr r0, _08078F90 @ =gUnknown_8EAD5E8
	ldr r1, _08078F94 @ =gUnknown_2037398
	movs r2, 0x10
	bl CpuSet
	movs r0, 0x80
	lsls r0, 6
	str r5, [sp]
	str r7, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r1, 0x1
_08078F78:
	movs r2, 0xF
	movs r3, 0
_08078F7C:
	bl sub_80717A8
_08078F80:
	ldrh r0, [r6, 0x2]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	b _08078FB6
	.align 2, 0
_08078F88: .4byte 0x00001fff
_08078F8C: .4byte 0x00007fde
_08078F90: .4byte gUnknown_8EAD5E8
_08078F94: .4byte gUnknown_2037398
_08078F98:
	movs r0, 0
	bl sub_807185C
	cmp r0, 0
	bne _08078FB6
	ldr r0, _08078FC0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08078FB6
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8078C90
_08078FB6:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078FC0: .4byte gPaletteFade
	thumb_func_end sub_8078DA4

	thumb_func_start sub_8078FC4
sub_8078FC4: @ 8078FC4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08078FD6
	cmp r0, 0x1
	beq _08079004
	b _08079094
_08078FD6:
	movs r0, 0x1
	bl sub_812B1F0
	ldr r0, _0807902C @ =sub_807941C
	movs r1, 0
	bl CreateTask
	ldr r0, _08079030 @ =sub_8079840
	movs r1, 0x5
	bl CreateTask
	bl sub_80790A0
	bl sub_8079A40
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	bl sub_812B484
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
_08079004:
	ldr r2, _08079034 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x46
	ands r0, r1
	cmp r0, 0x46
	bne _08079040
	ldrb r0, [r4, 0xC]
	bl sub_8079A88
	ldr r0, _08079038 @ =sub_8078C24
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _0807903C @ =sub_80796CC
	bl SetMainCallback2
	b _08079094
	.align 2, 0
_0807902C: .4byte sub_807941C
_08079030: .4byte sub_8079840
_08079034: .4byte gMain
_08079038: .4byte sub_8078C24
_0807903C: .4byte sub_80796CC
_08079040:
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x6
	bne _0807906C
	ldrb r0, [r4, 0xC]
	bl sub_8079A88
	ldr r0, _08079064 @ =sub_8078C24
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _08079068 @ =sub_80796E8
	bl SetMainCallback2
	b _08079094
	.align 2, 0
_08079064: .4byte sub_8078C24
_08079068: .4byte sub_80796E8
_0807906C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x9
	ands r0, r1
	cmp r0, 0
	beq _08079080
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_8078C90
	b _08079094
_08079080:
	ldr r0, _0807909C @ =sub_8078BEC
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08079094
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_8078C90
_08079094:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807909C: .4byte sub_8078BEC
	thumb_func_end sub_8078FC4

	thumb_func_start sub_80790A0
sub_80790A0: @ 80790A0
	push {lr}
	movs r1, 0x80
	lsls r1, 8
	movs r0, 0
	bl SetGpuRegBits
	ldr r1, _080790C8 @ =0x00003f1f
	movs r0, 0x4A
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0x81
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0xD
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080790C8: .4byte 0x00003f1f
	thumb_func_end sub_80790A0

	thumb_func_start sub_80790CC
sub_80790CC: @ 80790CC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _080791B0
	lsls r0, 2
	ldr r1, _080790E4 @ =_080790E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080790E4: .4byte _080790E8
	.align 2, 0
_080790E8:
	.4byte _080790FC
	.4byte _08079104
	.4byte _0807913C
	.4byte _08079170
	.4byte _08079198
_080790FC:
	ldrb r0, [r4, 0xC]
	bl sub_8079A88
	b _0807918C
_08079104:
	ldr r0, _08079138 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080791B0
	ldrb r0, [r4, 0xC]
	bl sub_8079AA8
	adds r5, r0, 0
	cmp r5, 0
	bne _080791B0
	movs r0, 0xA
	bl FadeOutMapMusic
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl sub_8079528
	b _0807918C
	.align 2, 0
_08079138: .4byte gPaletteFade
_0807913C:
	bl IsNotWaitingForBGMStop
	lsls r0, 24
	cmp r0, 0
	beq _080791B0
	ldr r0, _08079168 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080791B0
	ldr r0, _0807916C @ =sub_807941C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	strh r5, [r4, 0x4]
	b _0807918C
	.align 2, 0
_08079168: .4byte gPaletteFade
_0807916C: .4byte sub_807941C
_08079170:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080791B0
	ldr r0, _08079194 @ =sub_807941C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0807918C:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	b _080791B0
	.align 2, 0
_08079194: .4byte sub_807941C
_08079198:
	bl sub_812B478
	ldr r0, _080791B8 @ =sub_8078C24
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _080791BC @ =sub_80EC864
	bl SetMainCallback2
_080791B0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080791B8: .4byte sub_8078C24
_080791BC: .4byte sub_80EC864
	thumb_func_end sub_80790CC

	thumb_func_start sub_80791C0
sub_80791C0: @ 80791C0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08079204
	cmp r0, 0x1
	bgt _080791D8
	cmp r0, 0
	beq _080791DE
	b _080792A6
_080791D8:
	cmp r0, 0x2
	beq _08079248
	b _080792A6
_080791DE:
	ldr r0, _08079200 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080792A6
	movs r0, 0x6
	movs r1, 0
	bl PlayCry1
	ldrb r0, [r4, 0xC]
	bl sub_8079A88
	strh r5, [r4, 0x4]
	b _08079238
	.align 2, 0
_08079200: .4byte gPaletteFade
_08079204:
	ldrh r1, [r4, 0x4]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0x59
	bgt _08079214
	adds r0, r1, 0x1
	strh r0, [r4, 0x4]
	b _080792A6
_08079214:
	ldrb r0, [r4, 0xC]
	bl sub_8079AA8
	cmp r0, 0
	bne _080792A6
	ldr r0, _08079240 @ =0x0fffffff
	ldr r1, _08079244 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl sub_8079528
	movs r0, 0x4
	bl FadeOutBGM
_08079238:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	b _080792A6
	.align 2, 0
_08079240: .4byte 0x0fffffff
_08079244: .4byte 0x00007fff
_08079248:
	ldr r0, _080792B0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080792A6
	bl SeedRngAndSetTrainerId
	bl SetSaveBlocksPointers
	bl sub_8054A28
	bl ResetSaveCounters
	movs r0, 0
	bl sub_80DA4FC
	ldr r0, _080792B4 @ =gUnknown_30053A0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08079276
	cmp r0, 0x2
	bne _0807927A
_08079276:
	bl Sav2_ClearSetDefault
_0807927A:
	ldr r0, _080792B8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x15]
	lsls r0, 31
	lsrs r0, 31
	bl SetPokemonCryStereo
	ldr r0, _080792BC @ =gHeap
	movs r1, 0xE0
	lsls r1, 9
	bl InitHeap
	ldr r0, _080792C0 @ =sub_800C300
	bl SetMainCallback2
	ldr r0, _080792C4 @ =sub_8078C24
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080792A6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080792B0: .4byte gPaletteFade
_080792B4: .4byte gUnknown_30053A0
_080792B8: .4byte gSaveBlock2Ptr
_080792BC: .4byte gHeap
_080792C0: .4byte sub_800C300
_080792C4: .4byte sub_8078C24
	thumb_func_end sub_80791C0

	thumb_func_start sub_80792C8
sub_80792C8: @ 80792C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080792EC @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080792E2
	b _08079414
_080792E2:
	lsls r0, 2
	ldr r1, _080792F0 @ =_080792F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080792EC: .4byte gTasks+0x8
_080792F0: .4byte _080792F4
	.align 2, 0
_080792F4:
	.4byte _0807930C
	.4byte _08079344
	.4byte _08079368
	.4byte _0807937C
	.4byte _080793BC
	.4byte _08079404
_0807930C:
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x37
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0xA0
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0
	movs r2, 0
	bl BlendPalettes
	b _080793AA
_08079344:
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x4]
	cmp r0, 0xEF
	ble _08079364
	movs r0, 0xF0
	strh r0, [r4, 0x4]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_08079364:
	ldrh r1, [r4, 0x4]
	b _080793F6
_08079368:
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08079414
	movs r0, 0
	strh r0, [r4, 0x6]
	b _080793AA
_0807937C:
	movs r0, 0x4A
	movs r1, 0x3B
	bl SetGpuReg
	ldr r1, _080793B4 @ =0x0000f0f0
	movs r0, 0x40
	bl SetGpuReg
	ldr r1, _080793B8 @ =0xffff1000
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x80
	lsls r0, 8
	movs r1, 0
	movs r2, 0
	bl BlendPalettes
	movs r1, 0xF0
	lsls r1, 4
	adds r0, r1, 0
	strh r0, [r4, 0x2]
_080793AA:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08079414
	.align 2, 0
_080793B4: .4byte 0x0000f0f0
_080793B8: .4byte 0xffff1000
_080793BC:
	ldr r1, _08079400 @ =0xfffffe80
	adds r0, r1, 0
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x4]
	cmp r0, 0
	bgt _080793DA
	movs r0, 0
	strh r0, [r4, 0x4]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080793DA:
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	negs r1, r1
	lsls r1, 8
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgX
	ldrh r1, [r4, 0x4]
	lsls r1, 8
	movs r0, 0xF0
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
_080793F6:
	movs r0, 0x40
	bl SetGpuReg
	b _08079414
	.align 2, 0
_08079400: .4byte 0xfffffe80
_08079404:
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
	adds r0, r5, 0
	bl DestroyTask
_08079414:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80792C8

	thumb_func_start sub_807941C
sub_807941C: @ 807941C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _08079460 @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08079444
	ldr r0, _08079464 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08079444
	movs r0, 0x1
	strh r0, [r5, 0x1C]
_08079444:
	movs r3, 0x1C
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _08079468
	ldr r0, _08079464 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08079468
	adds r0, r2, 0
	bl DestroyTask
	b _08079510
	.align 2, 0
_08079460: .4byte gTasks+0x8
_08079464: .4byte gPaletteFade
_08079468:
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	ldrh r2, [r5, 0x2]
	cmp r0, 0
	bne _08079476
	movs r0, 0x3C
	b _08079478
_08079476:
	movs r0, 0x1E
_08079478:
	strh r0, [r5, 0x4]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x4
	ldrsh r1, [r5, r3]
	cmp r0, r1
	blt _08079510
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x1
	eors r0, r2
	strh r0, [r5, 0x2]
	lsls r0, 16
	cmp r0, 0
	beq _080794CC
	ldr r2, _080794C0 @ =gUnknown_20371F8
	ldr r4, _080794C4 @ =gUnknown_8EAE094
	ldr r1, _080794C8 @ =gUnknown_20375F8
	movs r0, 0xF1
	lsls r0, 1
	adds r1, r0
	adds r2, r0
	movs r3, 0x4
_080794AC:
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r1, 0x2
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080794AC
	b _080794F2
	.align 2, 0
_080794C0: .4byte gUnknown_20371F8
_080794C4: .4byte gUnknown_8EAE094
_080794C8: .4byte gUnknown_20375F8
_080794CC:
	movs r3, 0
	ldr r2, _08079518 @ =gUnknown_20371F8
	ldr r0, _0807951C @ =gUnknown_8EAE094
	ldr r1, _08079520 @ =gUnknown_20375F8
	adds r4, r0, 0x2
	movs r0, 0xF1
	lsls r0, 1
	adds r1, r0
	adds r2, r0
_080794DE:
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4]
	strh r0, [r1]
	adds r4, 0x2
	adds r1, 0x2
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x4
	ble _080794DE
_080794F2:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08079510
	movs r0, 0x80
	lsls r0, 8
	ldr r2, _08079524 @ =gPaletteFade
	ldrh r1, [r2, 0x4]
	lsls r1, 21
	lsrs r1, 27
	ldrh r2, [r2, 0x6]
	lsls r2, 17
	lsrs r2, 17
	bl BlendPalettes
_08079510:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079518: .4byte gUnknown_20371F8
_0807951C: .4byte gUnknown_8EAE094
_08079520: .4byte gUnknown_20375F8
_08079524: .4byte gPaletteFade
	thumb_func_end sub_807941C

	thumb_func_start sub_8079528
sub_8079528: @ 8079528
	push {lr}
	ldr r0, _08079548 @ =sub_807941C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807954C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x26]
	pop {r0}
	bx r0
	.align 2, 0
_08079548: .4byte sub_807941C
_0807954C: .4byte gTasks
	thumb_func_end sub_8079528

	thumb_func_start sub_8079550
sub_8079550: @ 8079550
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r5, r0, 16
	asrs r4, r5, 16
	cmp r4, 0
	blt _08079574
	ldr r3, _08079618 @ =gUnknown_2038700
	lsls r2, r4, 1
	ldr r0, _0807961C @ =gUnknown_2039600
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r3
	movs r0, 0x10
	strh r0, [r2]
_08079574:
	movs r3, 0
	mov r8, r5
	adds r6, r4, 0
	ldr r0, _08079618 @ =gUnknown_2038700
	mov r12, r0
	ldr r7, _0807961C @ =gUnknown_2039600
	movs r5, 0xF
	lsls r2, r6, 1
	adds r4, r2, 0
_08079586:
	adds r0, r6, r3
	cmp r0, 0
	blt _0807959A
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r0, r4, r0
	add r0, r12
	strh r5, [r0]
_0807959A:
	subs r0, r6, r3
	cmp r0, 0
	blt _080795AE
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r0, r2, r0
	add r0, r12
	strh r5, [r0]
_080795AE:
	subs r5, 0x1
	subs r2, 0x2
	adds r4, 0x2
	adds r3, 0x1
	cmp r3, 0xF
	ble _08079586
	mov r1, r8
	asrs r0, r1, 16
	adds r3, r0, 0
	adds r3, 0x10
	cmp r3, 0x9F
	bgt _080795E6
	ldr r6, _08079618 @ =gUnknown_2038700
	ldr r5, _0807961C @ =gUnknown_2039600
	movs r4, 0
_080795CC:
	cmp r3, 0
	blt _080795E0
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	strh r4, [r2]
_080795E0:
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080795CC
_080795E6:
	mov r1, r8
	asrs r0, r1, 16
	adds r3, r0, 0
	subs r3, 0x10
	cmp r3, 0
	blt _0807960E
	ldr r6, _08079618 @ =gUnknown_2038700
	ldr r5, _0807961C @ =gUnknown_2039600
	movs r4, 0
_080795F8:
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	strh r4, [r2]
	subs r3, 0x1
	cmp r3, 0
	bge _080795F8
_0807960E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079618: .4byte gUnknown_2038700
_0807961C: .4byte gUnknown_2039600
	thumb_func_end sub_8079550

	thumb_func_start sub_8079620
sub_8079620: @ 8079620
	push {lr}
	ldr r1, _08079644 @ =gUnknown_2039600
	ldrb r0, [r1, 0x15]
	cmp r0, 0
	beq _0807962E
	movs r0, 0x3
	strb r0, [r1, 0x15]
_0807962E:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_08079644: .4byte gUnknown_2039600
	thumb_func_end sub_8079620

	thumb_func_start sub_8079648
sub_8079648: @ 8079648
	push {r4,lr}
	ldr r0, _080796BC @ =sub_80792C8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0807965C
	bl DestroyTask
_0807965C:
	bl sub_8071898
	bl ResetPaletteFadeControl
	ldr r0, _080796C0 @ =gUnknown_8EAB6C4
	movs r2, 0xD0
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	ldr r0, _080796C4 @ =gUnknown_8EAD5E8
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080796C8 @ =gUnknown_8EAE094
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	bl sub_80F6C14
	movs r1, 0xE0
	lsls r1, 8
	movs r0, 0
	bl ClearGpuRegBits
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080796BC: .4byte sub_80792C8
_080796C0: .4byte gUnknown_8EAB6C4
_080796C4: .4byte gUnknown_8EAD5E8
_080796C8: .4byte gUnknown_8EAE094
	thumb_func_end sub_8079648

	thumb_func_start sub_80796CC
sub_80796CC: @ 80796CC
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080796DE
	ldr r0, _080796E4 @ =sub_80F55A0
	bl SetMainCallback2
_080796DE:
	pop {r0}
	bx r0
	.align 2, 0
_080796E4: .4byte sub_80F55A0
	thumb_func_end sub_80796CC

	thumb_func_start sub_80796E8
sub_80796E8: @ 80796E8
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080796FE
	bl m4aMPlayAllStop
	ldr r0, _08079704 @ =sub_815F74C
	bl SetMainCallback2
_080796FE:
	pop {r0}
	bx r0
	.align 2, 0
_08079704: .4byte sub_815F74C
	thumb_func_end sub_80796E8

	thumb_func_start sub_8079708
sub_8079708: @ 8079708
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _08079728 @ =gUnknown_83BFB9C
_0807970E:
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x3
	bls _0807970E
	ldr r0, _0807972C @ =gUnknown_83BFBBC
	bl LoadSpritePalettes
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079728: .4byte gUnknown_83BFB9C
_0807972C: .4byte gUnknown_83BFBBC
	thumb_func_end sub_8079708

	thumb_func_start sub_8079730
sub_8079730: @ 8079730
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x2E
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	blt _08079774
	ldrh r0, [r2, 0x6]
	ldrh r1, [r2, 0x4]
	adds r0, r1
	strh r0, [r2, 0x4]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x22]
	subs r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB8
	bhi _08079774
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0807977C
_08079774:
	adds r0, r4, 0
	bl DestroySprite
	b _080797A6
_0807977C:
	ldrh r1, [r2, 0xE]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080797A6
	subs r0, r1, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080797A6
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080797A6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8079730

	thumb_func_start sub_80797AC
sub_80797AC: @ 80797AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	mov r8, r2
	adds r7, r3, 0
	ldr r0, [sp, 0x18]
	cmp r0, 0
	beq _080797C8
	ldr r0, _080797C4 @ =gUnknown_83BFB04
	b _080797CA
	.align 2, 0
_080797C4: .4byte gUnknown_83BFB04
_080797C8:
	ldr r0, _08079828 @ =gUnknown_83BFB1C
_080797CA:
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r5, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08079834
	ldr r0, _0807982C @ =gSprites
	mov r12, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r6, r0, 2
	mov r1, r12
	adds r2, r6, r1
	lsls r0, r4, 4
	movs r1, 0
	strh r0, [r2, 0x2E]
	mov r0, r8
	strh r0, [r2, 0x30]
	lsls r0, r5, 4
	strh r0, [r2, 0x32]
	strh r7, [r2, 0x34]
	strh r1, [r2, 0x36]
	mov r3, r8
	muls r3, r7
	adds r0, r3, 0
	cmp r3, 0
	bge _0807980C
	adds r0, 0xF
_0807980C:
	asrs r0, 4
	lsls r0, 4
	subs r0, r3, r0
	strh r0, [r2, 0x38]
	mov r1, sp
	ldrh r1, [r1, 0x18]
	strh r1, [r2, 0x3A]
	mov r0, r12
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _08079830 @ =sub_8079730
	str r1, [r0]
	movs r0, 0x1
	b _08079836
	.align 2, 0
_08079828: .4byte gUnknown_83BFB1C
_0807982C: .4byte gSprites
_08079830: .4byte sub_8079730
_08079834:
	movs r0, 0
_08079836:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80797AC

	thumb_func_start sub_8079840
sub_8079840: @ 8079840
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08079868 @ =gTasks+0x8
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _0807986C
	cmp r0, 0x1
	beq _08079884
	b _0807998A
	.align 2, 0
_08079868: .4byte gTasks+0x8
_0807986C:
	ldr r2, _08079880 @ =0x00007878
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_807999C
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _0807998A
	.align 2, 0
_08079880: .4byte 0x00007878
_08079884:
	ldrh r0, [r6, 0x2]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x4
	ldrsh r1, [r6, r2]
	cmp r0, r1
	blt _0807998A
	movs r0, 0
	strh r0, [r6, 0x2]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	movs r0, 0x12
	strh r0, [r6, 0x4]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	subs r1, 0x2
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	adds r7, r1, 0
	subs r7, 0x10
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x74
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	movs r2, 0
	lsls r0, 16
	movs r1, 0xF0
	lsls r1, 12
	ands r1, r0
	lsrs r1, 16
	cmp r1, 0x7
	bls _0807991C
	movs r2, 0x1
_0807991C:
	str r2, [sp]
	adds r0, r4, 0
	mov r1, r9
	mov r2, r8
	adds r3, r7, 0
	bl sub_80797AC
	movs r4, 0
_0807992C:
	ldr r1, _08079998 @ =gUnknown_83BFBD4
	adds r1, r4, r1
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	ldrb r1, [r1]
	adds r0, r1
	movs r1, 0x1
	str r1, [sp]
	mov r1, r9
	mov r2, r8
	adds r3, r7, 0
	bl sub_80797AC
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	subs r1, 0x2
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80799B4
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	adds r7, r1, 0
	subs r7, 0x10
	adds r4, 0x1
	cmp r4, 0xE
	ble _0807992C
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0807998A
	movs r0, 0
	strh r0, [r6, 0xA]
_0807998A:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079998: .4byte gUnknown_83BFBD4
	thumb_func_end sub_8079840

	thumb_func_start sub_807999C
sub_807999C: @ 807999C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	bl SetWordTaskArg
	pop {r0}
	bx r0
	thumb_func_end sub_807999C

	thumb_func_start sub_80799B4
sub_80799B4: @ 80799B4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetWordTaskArg
	adds r6, r0, 0
	ldr r0, _080799E8 @ =0x41c64e6d
	muls r0, r6
	ldr r1, _080799EC @ =0x00006073
	adds r6, r0, r1
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl SetWordTaskArg
	lsrs r0, r6, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080799E8: .4byte 0x41c64e6d
_080799EC: .4byte 0x00006073
	thumb_func_end sub_80799B4

	thumb_func_start sub_80799F0
sub_80799F0: @ 80799F0
	push {lr}
	ldr r0, _08079A0C @ =gUnknown_83BFB3C
	movs r1, 0x18
	movs r2, 0x90
	movs r3, 0
	bl CreateSprite
	movs r0, 0x2
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08079A0C: .4byte gUnknown_83BFB3C
	thumb_func_end sub_80799F0

	thumb_func_start sub_8079A10
sub_8079A10: @ 8079A10
	push {lr}
	cmp r0, 0
	beq _08079A38
	movs r0, 0x2
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	ldr r0, _08079A34 @ =gUnknown_8EAE488
	lsrs r1, 4
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	b _08079A3C
	.align 2, 0
_08079A34: .4byte gUnknown_8EAE488
_08079A38:
	bl sub_80799F0
_08079A3C:
	pop {r0}
	bx r0
	thumb_func_end sub_8079A10

	thumb_func_start sub_8079A40
sub_8079A40: @ 8079A40
	push {r4,lr}
	ldr r0, _08079A7C @ =gUnknown_83BFB5C
	movs r1, 0x20
	negs r1, r1
	movs r2, 0x1B
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r4, r1, 0
	cmp r1, 0x40
	beq _08079A74
	ldr r3, _08079A80 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _08079A84 @ =sub_8079AD8
	str r2, [r1]
	adds r0, r3
	movs r1, 0x87
	lsls r1, 2
	strh r1, [r0, 0x30]
_08079A74:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079A7C: .4byte gUnknown_83BFB5C
_08079A80: .4byte gSprites
_08079A84: .4byte sub_8079AD8
	thumb_func_end sub_8079A40

	thumb_func_start sub_8079A88
sub_8079A88: @ 8079A88
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08079AA0
	ldr r0, _08079AA4 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x32]
_08079AA0:
	pop {r0}
	bx r0
	.align 2, 0
_08079AA4: .4byte gSprites
	thumb_func_end sub_8079A88

	thumb_func_start sub_8079AA8
sub_8079AA8: @ 8079AA8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	bne _08079AB6
	movs r0, 0
	b _08079ACE
_08079AB6:
	ldr r1, _08079AD4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	movs r0, 0x2
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_08079ACE:
	pop {r1}
	bx r1
	.align 2, 0
_08079AD4: .4byte gSprites
	thumb_func_end sub_8079AA8

	thumb_func_start sub_8079AD8
sub_8079AD8: @ 8079AD8
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _08079B24
	cmp r0, 0x1
	bgt _08079B74
	cmp r0, 0
	bne _08079B74
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08079B04
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x2
	strh r0, [r2, 0x2E]
_08079B04:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08079B74
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	movs r0, 0x1
	strh r0, [r2, 0x2E]
	b _08079B74
_08079B24:
	ldrh r0, [r2, 0x20]
	adds r0, 0x9
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x43
	bne _08079B38
	ldrh r0, [r2, 0x22]
	subs r0, 0x7
	strh r0, [r2, 0x22]
_08079B38:
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	cmp r1, 0x94
	bne _08079B46
	ldrh r0, [r2, 0x22]
	adds r0, 0x7
	strh r0, [r2, 0x22]
_08079B46:
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	ble _08079B74
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x32
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08079B68
	movs r0, 0x2
	strh r0, [r2, 0x2E]
	b _08079B74
_08079B68:
	ldr r0, _08079B78 @ =0x0000ffe0
	strh r0, [r2, 0x20]
	movs r0, 0x87
	lsls r0, 2
	strh r0, [r2, 0x30]
	strh r1, [r2, 0x2E]
_08079B74:
	pop {r0}
	bx r0
	.align 2, 0
_08079B78: .4byte 0x0000ffe0
	thumb_func_end sub_8079AD8

	.align 2, 0 @ Don't pad with nop.
