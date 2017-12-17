	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_809AAB0
sub_809AAB0: @ 809AAB0
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	bl sub_809AB7C
	ldr r4, _0809AAE8 @ =gUnknown_2039934
	movs r1, 0xF
	ands r1, r0
	ldrb r2, [r4, 0x16]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x16]
	movs r0, 0
	strh r0, [r4, 0xC]
	bl sub_80CBE00
	lsls r0, 24
	cmp r0, 0
	bne _0809AAF0
	ldrh r0, [r4, 0x16]
	ldr r1, _0809AAEC @ =0xfffffe0f
	ands r1, r0
	movs r0, 0x40
	b _0809AAF8
	.align 2, 0
_0809AAE8: .4byte gUnknown_2039934
_0809AAEC: .4byte 0xfffffe0f
_0809AAF0:
	ldrh r0, [r4, 0x16]
	ldr r1, _0809AB68 @ =0xfffffe0f
	ands r1, r0
	movs r0, 0x50
_0809AAF8:
	orrs r1, r0
	strh r1, [r4, 0x16]
	ldr r4, _0809AB6C @ =gUnknown_2039950
	ldr r0, _0809AB70 @ =gUnknown_83DF0BC
	bl sub_8003CE4
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0
	bl sub_80F7750
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r4]
	movs r6, 0x10
	str r6, [sp]
	movs r5, 0x3
	str r5, [sp, 0x4]
	ldr r1, _0809AB74 @ =gUnknown_83DF09C
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x2
	bl PrintTextArray
	ldrb r0, [r4]
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F7D8
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl CopyWindowToVram
	ldr r0, _0809AB78 @ =sub_809AC10
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809AB68: .4byte 0xfffffe0f
_0809AB6C: .4byte gUnknown_2039950
_0809AB70: .4byte gUnknown_83DF0BC
_0809AB74: .4byte gUnknown_83DF09C
_0809AB78: .4byte sub_809AC10
	thumb_func_end sub_809AAB0

	thumb_func_start sub_809AB7C
sub_809AB7C: @ 809AB7C
	push {r4,r5,lr}
	cmp r0, 0
	beq _0809AB8C
	lsls r0, 24
	lsrs r0, 24
	b _0809ABCE
_0809AB88:
	movs r0, 0x1
	b _0809ABCE
_0809AB8C:
	movs r4, 0
	ldr r1, _0809ABD4 @ =gUnknown_2039934
	ldrh r0, [r1, 0x10]
	cmp r4, r0
	bcs _0809ABCC
	ldr r0, [r1, 0x4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809ABCC
	adds r5, r1, 0
_0809ABA0:
	ldr r1, [r5, 0x4]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _0809AB88
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r0, [r5, 0x10]
	cmp r4, r0
	bcs _0809ABCC
	ldr r0, [r5, 0x4]
	lsls r1, r4, 1
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0809ABA0
_0809ABCC:
	movs r0, 0
_0809ABCE:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809ABD4: .4byte gUnknown_2039934
	thumb_func_end sub_809AB7C

	thumb_func_start sub_809ABD8
sub_809ABD8: @ 809ABD8
	push {lr}
	adds r1, r0, 0
	ldr r2, _0809AC00 @ =gUnknown_2039934
	str r1, [r2, 0x4]
	movs r0, 0
	strh r0, [r2, 0x10]
	ldrh r0, [r1]
	cmp r0, 0
	beq _0809ABFC
_0809ABEA:
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
	ldrh r0, [r2, 0x10]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809ABEA
_0809ABFC:
	pop {r0}
	bx r0
	.align 2, 0
_0809AC00: .4byte gUnknown_2039934
	thumb_func_end sub_809ABD8

	thumb_func_start sub_809AC04
sub_809AC04: @ 809AC04
	ldr r1, _0809AC0C @ =gUnknown_2039934
	str r0, [r1]
	bx lr
	.align 2, 0
_0809AC0C: .4byte gUnknown_2039934
	thumb_func_end sub_809AC04

	thumb_func_start sub_809AC10
sub_809AC10: @ 809AC10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl ProcessMenuInputNoWrapAround
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _0809AC52
	adds r0, 0x1
	cmp r1, r0
	bne _0809AC3C
	movs r0, 0x5
	bl sub_80722CC
	adds r0, r4, 0
	bl sub_809ACF8
	b _0809AC52
_0809AC3C:
	ldr r4, _0809AC58 @ =gUnknown_83DF09C
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_0809AC52:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809AC58: .4byte gUnknown_83DF09C
	thumb_func_end sub_809AC10

	thumb_func_start sub_809AC5C
sub_809AC5C: @ 809AC5C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _0809AC8C @ =sub_809AE14
	adds r0, r4, 0
	movs r1, 0xE
	bl SetWordTaskArg
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _0809AC90 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809AC94 @ =sub_809AD40
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AC8C: .4byte sub_809AE14
_0809AC90: .4byte gUnknown_3005090
_0809AC94: .4byte sub_809AD40
	thumb_func_end sub_809AC5C

	thumb_func_start sub_809AC98
sub_809AC98: @ 809AC98
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _0809ACC8 @ =sub_809ACD4
	adds r0, r4, 0
	movs r1, 0xE
	bl SetWordTaskArg
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _0809ACCC @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809ACD0 @ =sub_809AD40
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809ACC8: .4byte sub_809ACD4
_0809ACCC: .4byte gUnknown_3005090
_0809ACD0: .4byte sub_809AD40
	thumb_func_end sub_809AC98

	thumb_func_start sub_809ACD4
sub_809ACD4: @ 809ACD4
	push {lr}
	ldr r2, _0809ACEC @ =c2_exit_to_overworld_2_switch
	movs r0, 0x2
	movs r1, 0x3
	bl sub_8107DB4
	ldr r1, _0809ACF0 @ =gUnknown_3005020
	ldr r0, _0809ACF4 @ =sub_809AD74
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809ACEC: .4byte c2_exit_to_overworld_2_switch
_0809ACF0: .4byte gUnknown_3005020
_0809ACF4: .4byte sub_809AD74
	thumb_func_end sub_809ACD4

	thumb_func_start sub_809ACF8
sub_809ACF8: @ 809ACF8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_809AD24
	bl sub_809C138
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _0809AD20 @ =gUnknown_2039934
	ldr r0, [r0]
	cmp r0, 0
	beq _0809AD1A
	bl _call_via_r0
_0809AD1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AD20: .4byte gUnknown_2039934
	thumb_func_end sub_809ACF8

	thumb_func_start sub_809AD24
sub_809AD24: @ 809AD24
	push {r4,lr}
	ldr r4, _0809AD3C @ =gUnknown_2039950
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_810F4D8
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AD3C: .4byte gUnknown_2039950
	thumb_func_end sub_809AD24

	thumb_func_start sub_809AD40
sub_809AD40: @ 809AD40
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809AD70 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0809AD68
	adds r0, r4, 0
	movs r1, 0xE
	bl GetWordTaskArg
	bl SetMainCallback2
	bl FreeAllWindowBuffers
	adds r0, r4, 0
	bl DestroyTask
_0809AD68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AD70: .4byte gUnknown_2037AB8
	thumb_func_end sub_809AD40

	thumb_func_start sub_809AD74
sub_809AD74: @ 809AD74
	push {lr}
	bl sub_807DC00
	ldr r0, _0809AD88 @ =sub_809AD8C
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0809AD88: .4byte sub_809AD8C
	thumb_func_end sub_809AD74

	thumb_func_start sub_809AD8C
sub_809AD8C: @ 809AD8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807AA70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809ADB2
	bl sub_809B56C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0809ADB8 @ =gUnknown_841689E
	ldr r3, _0809ADBC @ =sub_809ADC0
	adds r0, r4, 0
	bl DisplayItemMessageOnField
_0809ADB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809ADB8: .4byte gUnknown_841689E
_0809ADBC: .4byte sub_809ADC0
	thumb_func_end sub_809AD8C

	thumb_func_start sub_809ADC0
sub_809ADC0: @ 809ADC0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0809ADE0 @ =gUnknown_2039934
	ldrb r0, [r0, 0x16]
	lsls r0, 28
	lsrs r0, 28
	bl sub_809AAB0
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809ADE0: .4byte gUnknown_2039934
	thumb_func_end sub_809ADC0

	thumb_func_start sub_809ADE4
sub_809ADE4: @ 809ADE4
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl do_scheduled_bg_tilemap_copies_to_vram
	pop {r0}
	bx r0
	thumb_func_end sub_809ADE4

	thumb_func_start sub_809AE00
sub_809AE00: @ 809AE00
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_809AE00

	thumb_func_start sub_809AE14
sub_809AE14: @ 809AE14
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r0, _0809AE90 @ =gUnknown_30030F0
	movs r1, 0x87
	lsls r1, 3
	adds r5, r0, r1
	ldrb r4, [r5]
	cmp r4, 0
	beq _0809AEAC
	cmp r4, 0x1
	bne _0809AE2C
	b _0809AF54
_0809AE2C:
	ldr r0, _0809AE94 @ =gUnknown_2039934
	movs r5, 0
	strh r5, [r0, 0xC]
	strh r5, [r0, 0xE]
	bl sub_809B15C
	bl sub_809B690
	ldr r0, _0809AE98 @ =sub_809BBC0
	movs r1, 0x8
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0809AE9C @ =gUnknown_3005E70
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	ldr r2, _0809AEA0 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x16]
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0809AEA4 @ =sub_809AE00
	bl SetVBlankCallback
	ldr r0, _0809AEA8 @ =sub_809ADE4
	bl SetMainCallback2
	b _0809AF64
	.align 2, 0
_0809AE90: .4byte gUnknown_30030F0
_0809AE94: .4byte gUnknown_2039934
_0809AE98: .4byte sub_809BBC0
_0809AE9C: .4byte gUnknown_3005E70
_0809AEA0: .4byte gUnknown_3005090
_0809AEA4: .4byte sub_809AE00
_0809AEA8: .4byte sub_809ADE4
_0809AEAC:
	bl sub_80BF768
	str r4, [sp, 0x8]
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _0809AF4C @ =0x01000100
	add r0, sp, 0x8
	bl CpuFastSet
	bl remove_some_task
	bl reset_temp_tile_data_buffers
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl clear_scheduled_bg_copies_to_vram
	bl sub_80984D8
	bl sub_809AF6C
	lsls r0, 24
	cmp r0, 0
	beq _0809AF64
	bl sub_809B188
	lsls r0, 24
	cmp r0, 0
	beq _0809AF64
	bl sub_809AFD0
	movs r4, 0x20
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r0, _0809AF50 @ =gUnknown_2039934
	ldrb r0, [r0, 0x16]
	lsls r0, 28
	lsrs r0, 28
	bl sub_813F66C
	bl sub_809B080
	b _0809AF5E
	.align 2, 0
_0809AF4C: .4byte 0x01000100
_0809AF50: .4byte gUnknown_2039934
_0809AF54:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	cmp r0, 0
	bne _0809AF64
_0809AF5E:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
_0809AF64:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_809AE14

	thumb_func_start sub_809AF6C
sub_809AF6C: @ 809AF6C
	push {r4,r5,lr}
	ldr r4, _0809AFB0 @ =gUnknown_2039954
	movs r5, 0x80
	lsls r5, 4
	adds r0, r5, 0
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0809AFC0
	ldr r4, _0809AFB4 @ =gUnknown_2039958
	adds r0, r5, 0
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0809AFC0
	ldr r4, _0809AFB8 @ =gUnknown_203995C
	adds r0, r5, 0
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0809AFC0
	ldr r4, _0809AFBC @ =gUnknown_2039960
	adds r0, r5, 0
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0809AFC0
	movs r0, 0x1
	b _0809AFCA
	.align 2, 0
_0809AFB0: .4byte gUnknown_2039954
_0809AFB4: .4byte gUnknown_2039958
_0809AFB8: .4byte gUnknown_203995C
_0809AFBC: .4byte gUnknown_2039960
_0809AFC0:
	bl sub_809B604
	bl sub_809B670
	movs r0, 0
_0809AFCA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809AF6C

	thumb_func_start sub_809AFD0
sub_809AFD0: @ 809AFD0
	push {lr}
	movs r0, 0
	bl sub_8001618
	ldr r1, _0809B070 @ =gUnknown_83DF0C4
	movs r0, 0
	movs r2, 0x4
	bl sub_8001658
	ldr r0, _0809B074 @ =gUnknown_2039958
	ldr r1, [r0]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r0, _0809B078 @ =gUnknown_2039960
	ldr r1, [r0]
	movs r0, 0x2
	bl SetBgTilemapBuffer
	ldr r0, _0809B07C @ =gUnknown_203995C
	ldr r1, [r0]
	movs r0, 0x3
	bl SetBgTilemapBuffer
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
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r1, 0x82
	lsls r1, 5
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
	pop {r0}
	bx r0
	.align 2, 0
_0809B070: .4byte gUnknown_83DF0C4
_0809B074: .4byte gUnknown_2039958
_0809B078: .4byte gUnknown_2039960
_0809B07C: .4byte gUnknown_203995C
	thumb_func_end sub_809AFD0

	thumb_func_start sub_809B080
sub_809B080: @ 809B080
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0809B0B0 @ =gUnknown_8E85DC8
	movs r2, 0x90
	lsls r2, 3
	movs r3, 0xF7
	lsls r3, 2
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _0809B0B4 @ =gUnknown_2039934
	ldrb r1, [r0, 0x16]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	beq _0809B0C0
	ldr r0, _0809B0B8 @ =gUnknown_8E85EFC
	ldr r1, _0809B0BC @ =gUnknown_2039954
	ldr r1, [r1]
	bl LZDecompressWram
	b _0809B0CA
	.align 2, 0
_0809B0B0: .4byte gUnknown_8E85DC8
_0809B0B4: .4byte gUnknown_2039934
_0809B0B8: .4byte gUnknown_8E85EFC
_0809B0BC: .4byte gUnknown_2039954
_0809B0C0:
	ldr r0, _0809B100 @ =gUnknown_8E86038
	ldr r1, _0809B104 @ =gUnknown_2039954
	ldr r1, [r1]
	bl LZDecompressWram
_0809B0CA:
	movs r0, 0x40
	bl Alloc
	adds r4, r0, 0
	ldr r0, _0809B108 @ =gUnknown_8E86170
	adds r1, r4, 0
	bl LZDecompressWram
	adds r0, r4, 0
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0x20
	movs r1, 0x60
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	bl Free
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B100: .4byte gUnknown_8E86038
_0809B104: .4byte gUnknown_2039954
_0809B108: .4byte gUnknown_8E86170
	thumb_func_end sub_809B080

	thumb_func_start sub_809B10C
sub_809B10C: @ 809B10C
	push {lr}
	sub sp, 0x8
	movs r2, 0x6
	cmp r0, 0
	bne _0809B118
	movs r2, 0xB
_0809B118:
	ldr r0, _0809B138 @ =gUnknown_2039934
	ldrb r1, [r0, 0x16]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	beq _0809B13C
	movs r0, 0x6
	str r0, [sp]
	str r2, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x1E
	bl sub_80F6B08
	b _0809B14E
	.align 2, 0
_0809B138: .4byte gUnknown_2039934
_0809B13C:
	movs r0, 0x8
	str r0, [sp]
	str r2, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x1E
	bl sub_80F6B08
_0809B14E:
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_809B10C

	thumb_func_start sub_809B15C
sub_809B15C: @ 809B15C
	push {lr}
	bl sub_809B764
	bl sub_809BAFC
	bl sub_813F6D0
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x3
	bl schedule_bg_copy_tilemap_to_vram
	pop {r0}
	bx r0
	thumb_func_end sub_809B15C

	thumb_func_start sub_809B188
sub_809B188: @ 809B188
	push {r4-r7,lr}
	ldr r7, _0809B1C0 @ =gUnknown_2039964
	ldr r4, _0809B1C4 @ =gUnknown_2039934
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	lsls r0, 3
	bl Alloc
	str r0, [r7]
	cmp r0, 0
	beq _0809B1B2
	ldr r5, _0809B1C8 @ =gUnknown_2039968
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	movs r1, 0xD
	muls r0, r1
	bl Alloc
	str r0, [r5]
	cmp r0, 0
	bne _0809B1CC
_0809B1B2:
	bl sub_809B604
	bl sub_809B670
	movs r0, 0
	b _0809B2F0
	.align 2, 0
_0809B1C0: .4byte gUnknown_2039964
_0809B1C4: .4byte gUnknown_2039934
_0809B1C8: .4byte gUnknown_2039968
_0809B1CC:
	movs r6, 0
	b _0809B1F2
_0809B1D0:
	lsls r1, r6, 3
	ldr r0, [r7]
	adds r0, r1
	ldr r2, [r4, 0x4]
	lsls r1, r6, 1
	adds r1, r2
	ldrh r1, [r1]
	movs r2, 0xD
	adds r3, r6, 0
	muls r3, r2
	ldr r2, [r5]
	adds r2, r3
	bl sub_809B300
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_0809B1F2:
	ldrh r0, [r4, 0x10]
	cmp r6, r0
	bcc _0809B1D0
	ldr r5, _0809B2C8 @ =gUnknown_2039968
	movs r0, 0xD
	adds r4, r6, 0
	muls r4, r0
	ldr r0, [r5]
	adds r0, r4
	ldr r1, _0809B2CC @ =gUnknown_84161C1
	bl StringCopy
	ldr r0, _0809B2D0 @ =gUnknown_2039964
	ldr r2, [r0]
	lsls r1, r6, 3
	adds r1, r2
	ldr r0, [r5]
	adds r0, r4
	str r0, [r1]
	movs r0, 0x2
	negs r0, r0
	str r0, [r1, 0x4]
	ldr r5, _0809B2D4 @ =gUnknown_3005E70
	str r2, [r5]
	ldr r6, _0809B2D8 @ =gUnknown_2039934
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0xC]
	movs r0, 0x4
	strb r0, [r5, 0x10]
	strb r1, [r5, 0x11]
	movs r0, 0x9
	strb r0, [r5, 0x12]
	movs r0, 0x1
	strb r0, [r5, 0x13]
	ldrb r1, [r5, 0x16]
	subs r0, 0x9
	ands r0, r1
	movs r1, 0x39
	negs r1, r1
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x16]
	ldrb r2, [r5, 0x14]
	movs r1, 0x10
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r3, 0x2
	orrs r0, r3
	strb r0, [r5, 0x14]
	ldrb r2, [r5, 0x17]
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r5, 0x17]
	ldrb r0, [r5, 0x15]
	ands r1, r0
	strb r1, [r5, 0x15]
	movs r0, 0x2
	movs r1, 0x5
	bl GetFontAttribute
	lsls r0, 4
	ldrb r2, [r5, 0x14]
	movs r4, 0xF
	adds r1, r4, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x14]
	movs r0, 0x2
	movs r1, 0x7
	bl GetFontAttribute
	lsls r0, 4
	ldrb r2, [r5, 0x15]
	adds r1, r4, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x15]
	ldr r0, _0809B2DC @ =sub_809B320
	str r0, [r5, 0x4]
	ldr r0, _0809B2E0 @ =sub_809B408
	str r0, [r5, 0x8]
	ldrb r2, [r5, 0x16]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r5, 0x16]
	ldrb r0, [r5, 0x17]
	ands r1, r0
	strb r1, [r5, 0x17]
	ldrb r0, [r6, 0x16]
	ands r4, r0
	movs r1, 0x6
	cmp r4, 0x1
	bne _0809B2BC
	movs r1, 0x5
_0809B2BC:
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	cmp r0, r1
	ble _0809B2E4
	strh r1, [r5, 0xE]
	b _0809B2E6
	.align 2, 0
_0809B2C8: .4byte gUnknown_2039968
_0809B2CC: .4byte gUnknown_84161C1
_0809B2D0: .4byte gUnknown_2039964
_0809B2D4: .4byte gUnknown_3005E70
_0809B2D8: .4byte gUnknown_2039934
_0809B2DC: .4byte sub_809B320
_0809B2E0: .4byte sub_809B408
_0809B2E4:
	strh r0, [r5, 0xE]
_0809B2E6:
	ldr r0, _0809B2F8 @ =gUnknown_2039934
	ldr r1, _0809B2FC @ =gUnknown_3005E70
	ldrh r1, [r1, 0xE]
	strh r1, [r0, 0x12]
	movs r0, 0x1
_0809B2F0:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809B2F8: .4byte gUnknown_2039934
_0809B2FC: .4byte gUnknown_3005E70
	thumb_func_end sub_809B188

	thumb_func_start sub_809B300
sub_809B300: @ 809B300
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8099E90
	str r6, [r4]
	str r5, [r4, 0x4]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_809B300

	thumb_func_start sub_809B320
sub_809B320: @ 809B320
	push {r4-r7,lr}
	sub sp, 0x14
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	beq _0809B334
	movs r0, 0x5
	bl sub_80722CC
_0809B334:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _0809B348
	lsls r0, r5, 16
	lsrs r0, 16
	bl ItemId_GetDescription
	adds r7, r0, 0
	b _0809B34A
_0809B348:
	ldr r7, _0809B384 @ =gUnknown_8416757
_0809B34A:
	movs r0, 0x5
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r6, _0809B388 @ =gUnknown_2039934
	ldrb r0, [r6, 0x16]
	movs r4, 0xF
	ands r4, r0
	cmp r4, 0x1
	beq _0809B3D8
	ldrb r1, [r6, 0x17]
	lsls r1, 29
	lsrs r1, 30
	movs r0, 0x1
	eors r0, r1
	bl sub_8098940
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _0809B38C
	lsls r0, r5, 16
	lsrs r0, 16
	ldrb r1, [r6, 0x17]
	lsls r1, 29
	lsrs r1, 30
	bl sub_80988E8
	b _0809B398
	.align 2, 0
_0809B384: .4byte gUnknown_8416757
_0809B388: .4byte gUnknown_2039934
_0809B38C:
	ldr r0, _0809B3D0 @ =0x00000177
	ldrb r1, [r6, 0x17]
	lsls r1, 29
	lsrs r1, 30
	bl sub_80988E8
_0809B398:
	ldr r3, _0809B3D4 @ =gUnknown_2039934
	ldrb r2, [r3, 0x17]
	lsls r0, r2, 29
	lsrs r0, 30
	movs r1, 0x1
	eors r1, r0
	lsls r1, 1
	movs r0, 0x7
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x17]
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x2
	adds r2, r7, 0
	movs r3, 0
	bl sub_813F6F4
	b _0809B400
	.align 2, 0
_0809B3D0: .4byte 0x00000177
_0809B3D4: .4byte gUnknown_2039934
_0809B3D8:
	movs r0, 0x6
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl sub_809B494
	movs r0, 0x3
	str r0, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x2
	adds r2, r7, 0
	movs r3, 0x2
	bl sub_813F6F4
_0809B400:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809B320

	thumb_func_start sub_809B408
sub_809B408: @ 809B408
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _0809B480
	ldr r4, _0809B488 @ =gUnknown_2021CD0
	lsls r0, r1, 16
	lsrs r0, 16
	bl itemid_get_market_price
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl sub_8008E78
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x4
	subs r1, r0
	ldr r2, _0809B48C @ =gUnknown_2021D18
	adds r0, r1, 0
	subs r1, 0x1
	cmp r0, 0
	beq _0809B45C
	movs r3, 0
_0809B450:
	strb r3, [r2]
	adds r2, 0x1
	adds r0, r1, 0
	subs r1, 0x1
	cmp r0, 0
	bne _0809B450
_0809B45C:
	ldr r1, _0809B490 @ =gUnknown_841697A
	adds r0, r2, 0
	bl sub_8008FCC
	ldr r2, _0809B48C @ =gUnknown_2021D18
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r0, 0x1
	str r0, [sp, 0x10]
	adds r0, r6, 0
	movs r1, 0
	movs r3, 0x69
	bl sub_813F6F4
_0809B480:
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B488: .4byte gUnknown_2021CD0
_0809B48C: .4byte gUnknown_2021D18
_0809B490: .4byte gUnknown_841697A
	thumb_func_end sub_809B408

	thumb_func_start sub_809B494
sub_809B494: @ 809B494
	push {r4-r7,lr}
	sub sp, 0x14
	adds r7, r0, 0
	movs r0, 0x2
	negs r0, r0
	cmp r7, r0
	beq _0809B528
	ldr r4, _0809B514 @ =gUnknown_2021CD0
	ldr r0, _0809B518 @ =0xfffffee0
	adds r1, r7, r0
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8008E78
	ldr r5, _0809B51C @ =gUnknown_2021D18
	ldr r1, _0809B520 @ =gUnknown_8416226
	adds r0, r5, 0
	bl StringCopy
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r6, 0x1
	str r6, [sp, 0x10]
	movs r0, 0x6
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_813F6F4
	lsls r0, r7, 16
	lsrs r0, 16
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _0809B524 @ =gUnknown_8247094
	adds r1, r0
	adds r0, r5, 0
	bl StringCopy
	movs r0, 0x10
	str r0, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r0, 0x6
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0
	bl sub_813F6F4
	b _0809B55C
	.align 2, 0
_0809B514: .4byte gUnknown_2021CD0
_0809B518: .4byte 0xfffffee0
_0809B51C: .4byte gUnknown_2021D18
_0809B520: .4byte gUnknown_8416226
_0809B524: .4byte gUnknown_8247094
_0809B528:
	ldr r2, _0809B564 @ =gUnknown_8416213
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r5, 0x1
	str r5, [sp, 0x10]
	movs r0, 0x6
	movs r1, 0
	movs r3, 0
	bl sub_813F6F4
	ldr r2, _0809B568 @ =gUnknown_8416217
	movs r0, 0x10
	str r0, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r5, [sp, 0x10]
	movs r0, 0x6
	movs r1, 0x2
	movs r3, 0
	bl sub_813F6F4
_0809B55C:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B564: .4byte gUnknown_8416213
_0809B568: .4byte gUnknown_8416217
	thumb_func_end sub_809B494

	thumb_func_start sub_809B56C
sub_809B56C: @ 809B56C
	ldr r0, _0809B578 @ =gUnknown_2039934
	ldrh r0, [r0, 0x16]
	lsls r0, 23
	lsrs r0, 27
	bx lr
	.align 2, 0
_0809B578: .4byte gUnknown_2039934
	thumb_func_end sub_809B56C

	thumb_func_start sub_809B57C
sub_809B57C: @ 809B57C
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl ListMenuGetYCoordForPrintingArrowCursor
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_809B59C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809B57C

	thumb_func_start sub_809B59C
sub_809B59C: @ 809B59C
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0xFF
	bne _0809B5E0
	movs r0, 0x2
	movs r1, 0
	bl GetFontAttribute
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0
	movs r2, 0x1
	adds r3, r5, 0
	bl FillWindowPixelRect
	movs r0, 0x4
	movs r1, 0x2
	bl CopyWindowToVram
	b _0809B5F8
_0809B5E0:
	ldr r2, _0809B600 @ =gUnknown_841623B
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r0, 0x4
	movs r1, 0x2
	movs r3, 0x1
	bl sub_813F6F4
_0809B5F8:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B600: .4byte gUnknown_841623B
	thumb_func_end sub_809B59C

	thumb_func_start sub_809B604
sub_809B604: @ 809B604
	push {lr}
	ldr r0, _0809B658 @ =gUnknown_2039954
	ldr r0, [r0]
	cmp r0, 0
	beq _0809B612
	bl Free
_0809B612:
	ldr r0, _0809B65C @ =gUnknown_2039958
	ldr r0, [r0]
	cmp r0, 0
	beq _0809B61E
	bl Free
_0809B61E:
	ldr r0, _0809B660 @ =gUnknown_203995C
	ldr r0, [r0]
	cmp r0, 0
	beq _0809B62A
	bl Free
_0809B62A:
	ldr r0, _0809B664 @ =gUnknown_2039960
	ldr r0, [r0]
	cmp r0, 0
	beq _0809B636
	bl Free
_0809B636:
	ldr r0, _0809B668 @ =gUnknown_2039964
	ldr r0, [r0]
	cmp r0, 0
	beq _0809B642
	bl Free
_0809B642:
	ldr r0, _0809B66C @ =gUnknown_2039968
	ldr r0, [r0]
	cmp r0, 0
	beq _0809B64E
	bl Free
_0809B64E:
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
_0809B658: .4byte gUnknown_2039954
_0809B65C: .4byte gUnknown_2039958
_0809B660: .4byte gUnknown_203995C
_0809B664: .4byte gUnknown_2039960
_0809B668: .4byte gUnknown_2039964
_0809B66C: .4byte gUnknown_2039968
	thumb_func_end sub_809B604

	thumb_func_start sub_809B670
sub_809B670: @ 809B670
	push {lr}
	ldr r0, _0809B684 @ =gUnknown_3005020
	ldr r1, _0809B688 @ =sub_809AD74
	str r1, [r0]
	ldr r0, _0809B68C @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0809B684: .4byte gUnknown_3005020
_0809B688: .4byte sub_809AD74
_0809B68C: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_809B670

	thumb_func_start sub_809B690
sub_809B690: @ 809B690
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _0809B6C0 @ =gUnknown_2039934
	ldrb r1, [r4, 0x16]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	beq _0809B6C4
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	adds r0, 0x1
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r0, 0xE
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0xA0
	movs r2, 0x8
	movs r3, 0x68
	b _0809B6E2
	.align 2, 0
_0809B6C0: .4byte gUnknown_2039934
_0809B6C4:
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	adds r0, 0x1
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r0, 0xE
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0xA0
	movs r2, 0x8
	movs r3, 0x58
_0809B6E2:
	bl AddScrollIndicatorArrowPairParametrized
	lsls r0, 3
	ldrb r2, [r4, 0x17]
	movs r1, 0x7
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x17]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809B690

	thumb_func_start sub_809B6FC
sub_809B6FC: @ 809B6FC
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _0809B738 @ =gUnknown_2039934
	movs r0, 0x1
	strh r0, [r4, 0x18]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r0, 0x18
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0x98
	movs r2, 0x48
	movs r3, 0x68
	bl AddScrollIndicatorArrowPairParametrized
	lsls r0, 3
	ldrb r2, [r4, 0x17]
	movs r1, 0x7
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x17]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B738: .4byte gUnknown_2039934
	thumb_func_end sub_809B6FC

	thumb_func_start sub_809B73C
sub_809B73C: @ 809B73C
	push {r4,lr}
	ldr r4, _0809B760 @ =gUnknown_2039934
	ldrb r1, [r4, 0x17]
	movs r0, 0xF8
	ands r0, r1
	cmp r0, 0xF8
	beq _0809B758
	lsrs r0, r1, 3
	bl RemoveScrollIndicatorArrowPair
	ldrb r0, [r4, 0x17]
	movs r1, 0xF8
	orrs r0, r1
	strb r0, [r4, 0x17]
_0809B758:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B760: .4byte gUnknown_2039934
	thumb_func_end sub_809B73C

	thumb_func_start sub_809B764
sub_809B764: @ 809B764
	push {lr}
	bl sub_809B92C
	bl sub_809BA40
	bl sub_809B778
	pop {r0}
	bx r0
	thumb_func_end sub_809B764

	thumb_func_start sub_809B778
sub_809B778: @ 809B778
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _0809B804 @ =gUnknown_2036DFC
	ldr r0, [r0]
	mov r9, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x2
	strh r0, [r1]
	ldrh r0, [r4]
	subs r0, 0x3
	strh r0, [r4]
	movs r1, 0
	mov r10, r4
_0809B7AA:
	movs r4, 0
	lsls r1, 16
	mov r8, r1
	asrs r7, r1, 16
_0809B7B2:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsls r4, 16
	asrs r6, r4, 16
	adds r0, r6
	mov r2, r10
	movs r3, 0
	ldrsh r1, [r2, r3]
	adds r1, r7
	bl sub_8058E48
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, sp
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, 16
	asrs r0, 16
	mov r2, r10
	ldrh r1, [r2]
	adds r1, r7, r1
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F8C
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0809B808 @ =0x0000027f
	cmp r5, r0
	bhi _0809B80C
	mov r1, r9
	ldr r0, [r1, 0x10]
	lsls r1, r5, 4
	ldr r2, [r0, 0xC]
	adds r2, r1
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_809B850
	b _0809B822
	.align 2, 0
_0809B804: .4byte gUnknown_2036DFC
_0809B808: .4byte 0x0000027f
_0809B80C:
	mov r2, r9
	ldr r0, [r2, 0x14]
	ldr r2, _0809B84C @ =0xfffffd80
	adds r1, r5, r2
	lsls r1, 4
	ldr r2, [r0, 0xC]
	adds r2, r1
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_809B850
_0809B822:
	movs r3, 0x80
	lsls r3, 9
	adds r0, r4, r3
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0809B7B2
	adds r0, r3, 0
	add r0, r8
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _0809B7AA
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B84C: .4byte 0xfffffd80
	thumb_func_end sub_809B778

	thumb_func_start sub_809B850
sub_809B850: @ 809B850
	push {r4-r6,lr}
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 24
	adds r2, r3, 0
	lsls r0, 17
	lsrs r5, r0, 16
	lsls r1, 22
	movs r0, 0x80
	lsls r0, 15
	adds r1, r0
	lsrs r1, 16
	cmp r3, 0x1
	beq _0809B8A0
	cmp r3, 0x1
	bgt _0809B876
	cmp r3, 0
	beq _0809B87C
	b _0809B8F6
_0809B876:
	cmp r2, 0x2
	beq _0809B8D0
	b _0809B8F6
_0809B87C:
	ldr r0, _0809B898 @ =gUnknown_2039960
	ldr r0, [r0]
	lsls r5, 16
	asrs r5, 16
	lsls r4, r1, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r6, 0
	bl sub_809B904
	ldr r0, _0809B89C @ =gUnknown_2039958
	b _0809B8B8
	.align 2, 0
_0809B898: .4byte gUnknown_2039960
_0809B89C: .4byte gUnknown_2039958
_0809B8A0:
	ldr r0, _0809B8C8 @ =gUnknown_203995C
	ldr r0, [r0]
	lsls r5, 16
	asrs r5, 16
	lsls r4, r1, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r6, 0
	bl sub_809B904
	ldr r0, _0809B8CC @ =gUnknown_2039960
_0809B8B8:
	ldr r0, [r0]
	adds r3, r6, 0
	adds r3, 0x8
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_809B904
	b _0809B8F6
	.align 2, 0
_0809B8C8: .4byte gUnknown_203995C
_0809B8CC: .4byte gUnknown_2039960
_0809B8D0:
	ldr r0, _0809B8FC @ =gUnknown_203995C
	ldr r0, [r0]
	lsls r5, 16
	asrs r5, 16
	lsls r4, r1, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r6, 0
	bl sub_809B904
	ldr r0, _0809B900 @ =gUnknown_2039958
	ldr r0, [r0]
	adds r3, r6, 0
	adds r3, 0x8
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_809B904
_0809B8F6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B8FC: .4byte gUnknown_203995C
_0809B900: .4byte gUnknown_2039958
	thumb_func_end sub_809B850

	thumb_func_start sub_809B904
sub_809B904: @ 809B904
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r2
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, 0x2]
	strh r0, [r1, 0x2]
	adds r2, r1, 0
	adds r2, 0x40
	ldrh r0, [r3, 0x4]
	strh r0, [r2]
	adds r1, 0x42
	ldrh r0, [r3, 0x6]
	strh r0, [r1]
	bx lr
	thumb_func_end sub_809B904

	thumb_func_start sub_809B92C
sub_809B92C: @ 809B92C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r9, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r5, 0
	ldr r2, _0809B9DC @ =gUnknown_20398B4
	movs r1, 0x10
_0809B958:
	lsls r0, r5, 3
	adds r0, r2
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _0809B958
	movs r5, 0
	ldr r6, _0809B9E0 @ =gUnknown_20398BA
	subs r1, r6, 0x6
	mov r8, r1
_0809B970:
	movs r4, 0
	adds r2, r5, 0x1
	mov r10, r2
_0809B976:
	mov r1, sp
	ldr r3, _0809B9E4 @ =0x0000fffd
	adds r0, r3, 0
	ldrh r1, [r1]
	adds r0, r1
	adds r0, r4
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _0809B9E8 @ =0x0000fffe
	adds r1, r2, 0
	mov r3, sp
	ldrh r3, [r3, 0x2]
	adds r1, r3
	adds r1, r5
	lsls r1, 16
	lsrs r1, 16
	ldr r2, [sp, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _0809BA1C
	mov r0, r9
	lsls r2, r0, 3
	mov r1, r8
	adds r0, r2, r1
	movs r7, 0
	strh r3, [r0]
	mov r0, r8
	adds r0, 0x2
	adds r0, r2, r0
	strh r4, [r0]
	ldr r1, _0809B9EC @ =gUnknown_20398B8
	adds r0, r2, r1
	strh r5, [r0]
	ldr r1, _0809B9F0 @ =gUnknown_2036E38
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x2
	beq _0809BA00
	cmp r0, 0x2
	bgt _0809B9F4
	cmp r0, 0x1
	beq _0809B9FA
	b _0809BA0C
	.align 2, 0
_0809B9DC: .4byte gUnknown_20398B4
_0809B9E0: .4byte gUnknown_20398BA
_0809B9E4: .4byte 0x0000fffd
_0809B9E8: .4byte 0x0000fffe
_0809B9EC: .4byte gUnknown_20398B8
_0809B9F0: .4byte gUnknown_2036E38
_0809B9F4:
	cmp r0, 0x3
	beq _0809BA06
	b _0809BA0C
_0809B9FA:
	adds r0, r2, r6
	strh r7, [r0]
	b _0809BA12
_0809BA00:
	adds r1, r2, r6
	movs r0, 0x1
	b _0809BA10
_0809BA06:
	adds r1, r2, r6
	movs r0, 0x2
	b _0809BA10
_0809BA0C:
	adds r1, r2, r6
	movs r0, 0x3
_0809BA10:
	strh r0, [r1]
_0809BA12:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0809BA1C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _0809B976
	mov r2, r10
	lsls r0, r2, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0809B970
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809B92C

	thumb_func_start sub_809BA40
sub_809BA40: @ 809BA40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r6, 0
	ldr r7, _0809BAE8 @ =gUnknown_20398B4
	ldr r0, _0809BAEC @ =gUnknown_2036E38
	mov r8, r0
	adds r1, r7, 0x6
	mov r9, r1
_0809BA56:
	lsls r5, r6, 3
	adds r4, r5, r7
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	beq _0809BACE
	adds r1, r0, 0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x5]
	bl sub_805F2C8
	movs r1, 0
	ldrsh r2, [r4, r1]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r4, [r1, 0x5]
	adds r1, r7, 0x2
	adds r1, r5, r1
	ldrh r2, [r1]
	lsls r2, 20
	ldr r1, _0809BAF0 @ =0xfff80000
	adds r2, r1
	asrs r2, 16
	adds r1, r7, 0x4
	adds r1, r5, r1
	ldrh r3, [r1]
	lsls r3, 4
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	subs r0, 0x30
	subs r3, r0
	lsls r3, 16
	asrs r3, 16
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	ldr r1, _0809BAF4 @ =nullsub_8
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0809BAF8 @ =gUnknown_202063C
	adds r2, r0
	mov r1, r9
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	bl StartSpriteAnim
_0809BACE:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bls _0809BA56
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BAE8: .4byte gUnknown_20398B4
_0809BAEC: .4byte gUnknown_2036E38
_0809BAF0: .4byte 0xfff80000
_0809BAF4: .4byte nullsub_8
_0809BAF8: .4byte gUnknown_202063C
	thumb_func_end sub_809BA40

	thumb_func_start sub_809BAFC
sub_809BAFC: @ 809BAFC
	push {r4-r6,lr}
	ldr r0, _0809BB34 @ =gUnknown_2039958
	ldr r4, [r0]
	ldr r0, _0809BB38 @ =gUnknown_2039954
	ldr r3, [r0]
	movs r1, 0
	ldr r0, _0809BB3C @ =0x0000b3dc
	adds r6, r0, 0
	ldr r5, _0809BB40 @ =0x000003ff
_0809BB0E:
	lsls r0, r1, 16
	asrs r2, r0, 16
	lsls r1, r2, 1
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809BB22
	adds r1, r4
	adds r0, r6
	strh r0, [r1]
_0809BB22:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, r5
	ble _0809BB0E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809BB34: .4byte gUnknown_2039958
_0809BB38: .4byte gUnknown_2039954
_0809BB3C: .4byte 0x0000b3dc
_0809BB40: .4byte 0x000003ff
	thumb_func_end sub_809BAFC

	thumb_func_start sub_809BB44
sub_809BB44: @ 809BB44
	push {r4,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0809BBAC @ =gUnknown_3005098
	adds r4, r0
	movs r0, 0x3
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, _0809BBB0 @ =gUnknown_2039934
	ldr r3, [r0, 0x8]
	movs r0, 0xFF
	str r0, [sp]
	movs r0, 0x3
	movs r1, 0x36
	movs r2, 0xA
	bl sub_809FEC4
	ldr r0, _0809BBB4 @ =gUnknown_2021CD0
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8008E78
	ldr r4, _0809BBB8 @ =gUnknown_2021D18
	ldr r1, _0809BBBC @ =gUnknown_84162B9
	adds r0, r4, 0
	bl sub_8008FCC
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	movs r0, 0x1
	str r0, [sp, 0x10]
	movs r0, 0x3
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x2
	bl sub_813F6F4
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809BBAC: .4byte gUnknown_3005098
_0809BBB0: .4byte gUnknown_2039934
_0809BBB4: .4byte gUnknown_2021CD0
_0809BBB8: .4byte gUnknown_2021D18
_0809BBBC: .4byte gUnknown_84162B9
	thumb_func_end sub_809BB44

	thumb_func_start sub_809BBC0
sub_809BBC0: @ 809BBC0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0809BC00 @ =gUnknown_3005098
	adds r5, r0, r1
	ldr r0, _0809BC04 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0809BC8E
	ldrb r0, [r5, 0xE]
	bl ListMenuHandleInput
	adds r4, r0, 0
	ldrb r0, [r5, 0xE]
	ldr r7, _0809BC08 @ =gUnknown_2039942
	subs r2, r7, 0x2
	adds r1, r7, 0
	bl get_coro_args_x18_x1A
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _0809BC0C
	adds r0, 0x1
	cmp r4, r0
	bne _0809BC1A
	b _0809BC8E
	.align 2, 0
_0809BC00: .4byte gUnknown_3005098
_0809BC04: .4byte gUnknown_2037AB8
_0809BC08: .4byte gUnknown_2039942
_0809BC0C:
	movs r0, 0x5
	bl sub_80722CC
	adds r0, r6, 0
	bl sub_809C004
	b _0809BC8E
_0809BC1A:
	movs r0, 0x5
	bl sub_80722CC
	strh r4, [r5, 0xA]
	movs r0, 0x5
	bl ClearWindowTilemap
	bl sub_809B73C
	ldrb r0, [r5, 0xE]
	movs r1, 0x2
	bl sub_809B57C
	movs r0, 0x1
	bl sub_809B10C
	lsls r0, r4, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl itemid_get_market_price
	adds r1, r0, 0
	adds r0, r7, 0
	subs r0, 0xE
	lsls r1, 16
	lsrs r1, 16
	str r1, [r0, 0x8]
	ldr r0, _0809BC70 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r2, 0xA4
	lsls r2, 2
	adds r0, r2
	bl IsEnoughMoney
	lsls r0, 24
	cmp r0, 0
	bne _0809BC7C
	ldr r1, _0809BC74 @ =gUnknown_8416842
	ldr r2, _0809BC78 @ =sub_809BF98
	adds r0, r6, 0
	bl sub_813F75C
	b _0809BC8E
	.align 2, 0
_0809BC70: .4byte gUnknown_3005008
_0809BC74: .4byte gUnknown_8416842
_0809BC78: .4byte sub_809BF98
_0809BC7C:
	ldr r1, _0809BC94 @ =gUnknown_2021CD0
	adds r0, r4, 0
	bl sub_8099E90
	ldr r1, _0809BC98 @ =gUnknown_8416766
	ldr r2, _0809BC9C @ =sub_809BCA0
	adds r0, r6, 0
	bl sub_813F75C
_0809BC8E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BC94: .4byte gUnknown_2021CD0
_0809BC98: .4byte gUnknown_8416766
_0809BC9C: .4byte sub_809BCA0
	thumb_func_end sub_809BBC0

	thumb_func_start sub_809BCA0
sub_809BCA0: @ 809BCA0
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r5, r7, 2
	adds r5, r7
	lsls r5, 3
	ldr r0, _0809BD40 @ =gUnknown_3005098
	adds r5, r0
	ldrh r0, [r5, 0xA]
	bl sub_809A7DC
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x1
	movs r1, 0
	bl sub_813F7C0
	ldr r0, _0809BD44 @ =gUnknown_2021CD0
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl sub_8008E78
	ldr r6, _0809BD48 @ =gUnknown_2021D18
	ldr r1, _0809BD4C @ =gUnknown_8416749
	adds r0, r6, 0
	bl sub_8008FCC
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	movs r4, 0x1
	str r4, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	adds r2, r6, 0
	movs r3, 0
	bl sub_813F6F4
	strh r4, [r5, 0x2]
	movs r0, 0x3
	movs r1, 0
	bl sub_813F7A8
	adds r0, r7, 0
	bl sub_809BB44
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _0809BD50 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl sub_809FD58
	adds r4, r0, 0
	ldrh r0, [r5, 0xA]
	bl itemid_get_market_price
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl __udivsi3
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x63
	bls _0809BD58
	ldr r1, _0809BD54 @ =gUnknown_2039934
	movs r0, 0x63
	b _0809BD5E
	.align 2, 0
_0809BD40: .4byte gUnknown_3005098
_0809BD44: .4byte gUnknown_2021CD0
_0809BD48: .4byte gUnknown_2021D18
_0809BD4C: .4byte gUnknown_8416749
_0809BD50: .4byte gUnknown_3005008
_0809BD54: .4byte gUnknown_2039934
_0809BD58:
	ldr r1, _0809BD80 @ =gUnknown_2039934
	lsls r0, r2, 24
	lsrs r0, 24
_0809BD5E:
	strh r0, [r1, 0x14]
	cmp r2, 0x1
	beq _0809BD68
	bl sub_809B6FC
_0809BD68:
	ldr r0, _0809BD84 @ =gUnknown_3005090
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _0809BD88 @ =sub_809BD8C
	str r0, [r1]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BD80: .4byte gUnknown_2039934
_0809BD84: .4byte gUnknown_3005090
_0809BD88: .4byte sub_809BD8C
	thumb_func_end sub_809BCA0

	thumb_func_start sub_809BD8C
sub_809BD8C: @ 809BD8C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0809BDCC @ =gUnknown_3005098
	adds r4, r0, r1
	adds r0, r4, 0x2
	ldr r6, _0809BDD0 @ =gUnknown_2039934
	ldrh r1, [r6, 0x14]
	bl sub_80BF848
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809BDD4
	ldrh r0, [r4, 0xA]
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 16
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	muls r0, r1
	str r0, [r6, 0x8]
	adds r0, r5, 0
	bl sub_809BB44
	b _0809BE88
	.align 2, 0
_0809BDCC: .4byte gUnknown_3005098
_0809BDD0: .4byte gUnknown_2039934
_0809BDD4:
	ldr r0, _0809BE3C @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809BE54
	movs r0, 0x5
	bl sub_80722CC
	bl sub_809B73C
	movs r0, 0x3
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x1
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x3
	bl ClearWindowTilemap
	movs r0, 0x1
	bl ClearWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	ldrh r0, [r4, 0xA]
	ldr r1, _0809BE40 @ =gUnknown_2021CD0
	bl sub_8099E90
	ldr r0, _0809BE44 @ =gUnknown_2021CF0
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0x2
	bl sub_8008E78
	ldr r0, _0809BE48 @ =gUnknown_2021D04
	ldr r1, [r6, 0x8]
	movs r2, 0
	movs r3, 0x8
	bl sub_8008E78
	ldr r1, _0809BE4C @ =gUnknown_841678E
	ldr r2, _0809BE50 @ =sub_809BE90
	adds r0, r5, 0
	bl sub_813F75C
	b _0809BE88
	.align 2, 0
_0809BE3C: .4byte gUnknown_30030F0
_0809BE40: .4byte gUnknown_2021CD0
_0809BE44: .4byte gUnknown_2021CF0
_0809BE48: .4byte gUnknown_2021D04
_0809BE4C: .4byte gUnknown_841678E
_0809BE50: .4byte sub_809BE90
_0809BE54:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809BE88
	movs r0, 0x5
	bl sub_80722CC
	bl sub_809B73C
	movs r0, 0x3
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x1
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x3
	bl ClearWindowTilemap
	movs r0, 0x1
	bl ClearWindowTilemap
	adds r0, r7, 0
	bl sub_809BF98
_0809BE88:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809BD8C

	thumb_func_start sub_809BE90
sub_809BE90: @ 809BE90
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809BEA0 @ =gUnknown_83DF0B4
	bl sub_813F7D8
	pop {r0}
	bx r0
	.align 2, 0
_0809BEA0: .4byte gUnknown_83DF0B4
	thumb_func_end sub_809BE90

	thumb_func_start sub_809BEA4
sub_809BEA4: @ 809BEA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0809BEE8 @ =gUnknown_3005098
	adds r4, r0, r1
	movs r0, 0x4
	bl PutWindowTilemap
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x2]
	bl sub_809A084
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809BEF4
	ldr r1, _0809BEEC @ =gUnknown_84167E7
	ldr r2, _0809BEF0 @ =sub_809BF0C
	adds r0, r5, 0
	bl sub_813F75C
	adds r0, r5, 0
	bl nullsub_52
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x2]
	movs r2, 0x1
	bl sub_809C09C
	b _0809BEFE
	.align 2, 0
_0809BEE8: .4byte gUnknown_3005098
_0809BEEC: .4byte gUnknown_84167E7
_0809BEF0: .4byte sub_809BF0C
_0809BEF4:
	ldr r1, _0809BF04 @ =gUnknown_8416861
	ldr r2, _0809BF08 @ =sub_809BF98
	adds r0, r5, 0
	bl sub_813F75C
_0809BEFE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BF04: .4byte gUnknown_8416861
_0809BF08: .4byte sub_809BF98
	thumb_func_end sub_809BEA4

	thumb_func_start sub_809BF0C
sub_809BF0C: @ 809BF0C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x26
	bl sub_8054E90
	ldr r6, _0809BF58 @ =gUnknown_3005008
	ldr r0, [r6]
	movs r5, 0xA4
	lsls r5, 2
	adds r0, r5
	ldr r1, _0809BF5C @ =gUnknown_2039934
	ldr r1, [r1, 0x8]
	bl RemoveMoney
	movs r0, 0xF8
	bl sub_80722CC
	ldr r0, [r6]
	adds r0, r5
	bl sub_809FD58
	adds r1, r0, 0
	movs r0, 0
	movs r2, 0
	bl sub_809FE40
	ldr r1, _0809BF60 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809BF64 @ =sub_809BF68
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809BF58: .4byte gUnknown_3005008
_0809BF5C: .4byte gUnknown_2039934
_0809BF60: .4byte gUnknown_3005090
_0809BF64: .4byte sub_809BF68
	thumb_func_end sub_809BF0C

	thumb_func_start sub_809BF68
sub_809BF68: @ 809BF68
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809BF94 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0809BF82
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809BF8E
_0809BF82:
	movs r0, 0x5
	bl sub_80722CC
	adds r0, r4, 0
	bl sub_809BF98
_0809BF8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809BF94: .4byte gUnknown_30030F0
	thumb_func_end sub_809BF68

	thumb_func_start sub_809BF98
sub_809BF98: @ 809BF98
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r5, r1, 3
	ldr r6, _0809BFF8 @ =gUnknown_3005098
	adds r4, r5, r6
	movs r0, 0x2
	movs r1, 0
	bl sub_810F260
	ldrb r0, [r4, 0xE]
	movs r1, 0x1
	bl sub_809B57C
	movs r0, 0
	bl sub_809B10C
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	ldr r0, _0809BFFC @ =gUnknown_2039934
	ldrb r1, [r0, 0x16]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _0809BFDC
	movs r0, 0x6
	bl PutWindowTilemap
_0809BFDC:
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_809B690
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _0809C000 @ =sub_809BBC0
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809BFF8: .4byte gUnknown_3005098
_0809BFFC: .4byte gUnknown_2039934
_0809C000: .4byte sub_809BBC0
	thumb_func_end sub_809BF98

	thumb_func_start sub_809C004
sub_809C004: @ 809C004
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0809C03C @ =gUnknown_3005020
	ldr r0, _0809C040 @ =sub_809AD74
	str r0, [r1]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0809C044 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809C048 @ =sub_809C04C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C03C: .4byte gUnknown_3005020
_0809C040: .4byte sub_809AD74
_0809C044: .4byte gUnknown_3005090
_0809C048: .4byte sub_809C04C
	thumb_func_end sub_809C004

	thumb_func_start sub_809C04C
sub_809C04C: @ 809C04C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0809C088 @ =gUnknown_3005098
	adds r2, r0, r1
	ldr r0, _0809C08C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0809C082
	ldrb r0, [r2, 0xE]
	movs r1, 0
	movs r2, 0
	bl sub_810713C
	bl sub_809B604
	ldr r0, _0809C090 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0809C082:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C088: .4byte gUnknown_3005098
_0809C08C: .4byte gUnknown_2037AB8
_0809C090: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_809C04C

	thumb_func_start nullsub_52
nullsub_52: @ 809C094
	bx lr
	thumb_func_end nullsub_52

	thumb_func_start nullsub_53
nullsub_53: @ 809C098
	bx lr
	thumb_func_end nullsub_53

	thumb_func_start sub_809C09C
sub_809C09C: @ 809C09C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r1, _0809C0B8 @ =gUnknown_203996C
	ldrb r2, [r1, 0xA]
	cmp r2, r5
	bne _0809C0BC
	adds r4, r1, 0
	b _0809C0D4
	.align 2, 0
_0809C0B8: .4byte gUnknown_203996C
_0809C0BC:
	ldrb r0, [r1, 0x16]
	cmp r0, r5
	bne _0809C0C8
	adds r4, r1, 0
	adds r4, 0xC
	b _0809C0D4
_0809C0C8:
	adds r4, r1, 0
	adds r4, 0xC
	cmp r2, 0
	bne _0809C0D2
	adds r4, r1, 0
_0809C0D2:
	strb r5, [r4, 0xA]
_0809C0D4:
	ldrh r0, [r4, 0x4]
	cmp r0, 0
	beq _0809C0DE
	movs r0, 0x1
	strb r0, [r4, 0x9]
_0809C0DE:
	strh r3, [r4, 0x4]
	ldrh r1, [r4, 0x6]
	ldr r0, _0809C128 @ =0x000003e6
	cmp r1, r0
	bhi _0809C0F8
	adds r0, r6, r1
	strh r0, [r4, 0x6]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0809C12C @ =0x000003e7
	cmp r0, r1
	bls _0809C0F8
	strh r1, [r4, 0x6]
_0809C0F8:
	ldr r1, [r4]
	ldr r0, _0809C130 @ =0x000f423e
	cmp r1, r0
	bhi _0809C120
	adds r0, r3, 0
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 16
	subs r1, r5, 0x1
	asrs r0, r1
	adds r1, r0, 0
	muls r1, r6
	ldr r0, [r4]
	adds r0, r1
	str r0, [r4]
	ldr r1, _0809C134 @ =0x000f423f
	cmp r0, r1
	bls _0809C120
	str r1, [r4]
_0809C120:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809C128: .4byte 0x000003e6
_0809C12C: .4byte 0x000003e7
_0809C130: .4byte 0x000f423e
_0809C134: .4byte 0x000f423f
	thumb_func_end sub_809C09C

	thumb_func_start sub_809C138
sub_809C138: @ 809C138
	push {r4,lr}
	ldr r4, _0809C160 @ =gUnknown_203996C
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _0809C14A
	adds r0, 0x24
	adds r1, r4, 0
	bl sub_8113550
_0809C14A:
	ldrb r0, [r4, 0x16]
	cmp r0, 0
	beq _0809C15A
	adds r0, 0x24
	adds r1, r4, 0
	adds r1, 0xC
	bl sub_8113550
_0809C15A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C160: .4byte gUnknown_203996C
	thumb_func_end sub_809C138

	thumb_func_start sub_809C164
sub_809C164: @ 809C164
	push {r4,lr}
	bl sub_809ABD8
	movs r0, 0
	bl sub_809AAB0
	ldr r0, _0809C194 @ =EnableBothScriptContexts
	bl sub_809AC04
	bl nullsub_53
	ldr r4, _0809C198 @ =gUnknown_203996C
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	ldr r0, _0809C19C @ =gUnknown_2036DFC
	ldrb r0, [r0, 0x14]
	strb r0, [r4, 0x8]
	strb r0, [r4, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C194: .4byte EnableBothScriptContexts
_0809C198: .4byte gUnknown_203996C
_0809C19C: .4byte gUnknown_2036DFC
	thumb_func_end sub_809C164

	thumb_func_start sub_809C1A0
sub_809C1A0: @ 809C1A0
	push {lr}
	bl sub_809ABD8
	movs r0, 0x2
	bl sub_809AAB0
	ldr r0, _0809C1B8 @ =EnableBothScriptContexts
	bl sub_809AC04
	pop {r0}
	bx r0
	.align 2, 0
_0809C1B8: .4byte EnableBothScriptContexts
	thumb_func_end sub_809C1A0

	thumb_func_start sub_809C1BC
sub_809C1BC: @ 809C1BC
	push {lr}
	bl sub_809ABD8
	movs r0, 0x3
	bl sub_809AAB0
	ldr r0, _0809C1D4 @ =EnableBothScriptContexts
	bl sub_809AC04
	pop {r0}
	bx r0
	.align 2, 0
_0809C1D4: .4byte EnableBothScriptContexts
	thumb_func_end sub_809C1BC

	thumb_func_start sub_809C1D8
sub_809C1D8: @ 809C1D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r9, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	ldr r2, _0809C26C @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0x10]
	subs r0, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r1, 0x12]
	subs r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r4, [r1, 0xA]
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0809C29C
	movs r2, 0
	lsls r5, 16
	str r5, [sp, 0xC]
	lsls r0, r3, 16
	lsls r1, r4, 16
	asrs r0, 16
	str r0, [sp]
	asrs r1, 16
	str r1, [sp, 0x4]
	lsls r0, r1, 1
	mov r1, r9
	adds r7, r0, r1
_0809C22C:
	movs r4, 0
	lsls r2, 16
	mov r8, r2
	asrs r0, r2, 16
	ldr r2, [sp]
	adds r6, r2, r0
_0809C238:
	ldr r0, [sp, 0xC]
	asrs r1, r0, 16
	lsls r4, 16
	asrs r0, r4, 16
	adds r5, r1, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8058E48
	movs r2, 0
	ldrsh r1, [r7, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	bne _0809C280
	ldr r0, [sp, 0x4]
	cmp r0, 0x2
	beq _0809C270
	ldrh r0, [r7, 0x2]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8058FA4
	b _0809C280
	.align 2, 0
_0809C26C: .4byte gUnknown_3005090
_0809C270:
	mov r1, r9
	ldrh r0, [r1]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8058FA4
_0809C280:
	movs r2, 0x80
	lsls r2, 9
	adds r0, r4, r2
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _0809C238
	adds r0, r2, 0
	add r0, r8
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _0809C22C
	b _0809C324
_0809C29C:
	movs r2, 0
	lsls r5, 16
	str r5, [sp, 0xC]
	lsls r0, r3, 16
	lsls r1, r4, 16
	asrs r0, 16
	str r0, [sp, 0x8]
	asrs r7, r1, 16
_0809C2AC:
	movs r4, 0
	lsls r2, 16
	mov r8, r2
	asrs r0, r2, 16
	ldr r1, [sp, 0x8]
	adds r6, r1, r0
_0809C2B8:
	ldr r2, [sp, 0xC]
	asrs r1, r2, 16
	lsls r4, 16
	asrs r0, r4, 16
	adds r5, r1, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8058E48
	movs r1, 0x2
	subs r1, r7
	lsls r1, 1
	add r1, r9
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	bne _0809C30A
	cmp r7, 0x2
	beq _0809C2FA
	movs r0, 0x1
	subs r0, r7
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8058FA4
	b _0809C30A
_0809C2FA:
	mov r1, r9
	ldrh r0, [r1, 0x4]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8058FA4
_0809C30A:
	movs r2, 0x80
	lsls r2, 9
	adds r0, r4, r2
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _0809C2B8
	adds r0, r2, 0
	add r0, r8
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _0809C2AC
_0809C324:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809C1D8

	thumb_func_start sub_809C334
sub_809C334: @ 809C334
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _0809C35C @ =gUnknown_3005098
	adds r4, r0, r1
	movs r0, 0x1
	strh r0, [r4, 0x6]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bhi _0809C3CE
	lsls r0, 2
	ldr r1, _0809C360 @ =_0809C364
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809C35C: .4byte gUnknown_3005098
_0809C360: .4byte _0809C364
	.align 2, 0
_0809C364:
	.4byte _0809C380
	.4byte _0809C388
	.4byte _0809C390
	.4byte _0809C398
	.4byte _0809C3A0
	.4byte _0809C3B4
	.4byte _0809C3C4
_0809C380:
	ldr r1, _0809C384 @ =gUnknown_83DF0D4
	b _0809C3B6
	.align 2, 0
_0809C384: .4byte gUnknown_83DF0D4
_0809C388:
	ldr r1, _0809C38C @ =gUnknown_83DF0DA
	b _0809C3B6
	.align 2, 0
_0809C38C: .4byte gUnknown_83DF0DA
_0809C390:
	ldr r1, _0809C394 @ =gUnknown_83DF0E0
	b _0809C3A2
	.align 2, 0
_0809C394: .4byte gUnknown_83DF0E0
_0809C398:
	ldr r1, _0809C39C @ =gUnknown_83DF0E6
	b _0809C3B6
	.align 2, 0
_0809C39C: .4byte gUnknown_83DF0E6
_0809C3A0:
	ldr r1, _0809C3B0 @ =gUnknown_83DF0EC
_0809C3A2:
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r3, 0
	bl sub_809C1D8
	b _0809C3CE
	.align 2, 0
_0809C3B0: .4byte gUnknown_83DF0EC
_0809C3B4:
	ldr r1, _0809C3C0 @ =gUnknown_83DF0F2
_0809C3B6:
	adds r0, r3, 0
	movs r2, 0
	bl sub_809C1D8
	b _0809C3CE
	.align 2, 0
_0809C3C0: .4byte gUnknown_83DF0F2
_0809C3C4:
	ldr r1, _0809C3F8 @ =gUnknown_83DF0F8
	adds r0, r3, 0
	movs r2, 0
	bl sub_809C1D8
_0809C3CE:
	ldrh r0, [r4]
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	strh r0, [r4]
	adds r5, r0, 0
	cmp r5, 0
	bne _0809C3F2
	bl DrawWholeMapView
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	strh r0, [r4, 0x2]
	strh r5, [r4, 0x6]
_0809C3F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3F8: .4byte gUnknown_83DF0F8
	thumb_func_end sub_809C334

	thumb_func_start sub_809C3FC
sub_809C3FC: @ 809C3FC
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _0809C440 @ =sub_809C334
	adds r0, r6, 0
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0809C444 @ =gUnknown_3005098
	adds r7, r0, r1
	adds r0, r7, 0
	adds r0, 0x8
	adds r1, r7, 0
	adds r1, 0xA
	bl PlayerGetDestCoords
	movs r0, 0
	strh r0, [r7]
	strh r0, [r7, 0x2]
	strh r5, [r7, 0x4]
	adds r0, r4, 0
	bl _call_via_r6
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809C440: .4byte sub_809C334
_0809C444: .4byte gUnknown_3005098
	thumb_func_end sub_809C3FC

	thumb_func_start sub_809C448
sub_809C448: @ 809C448
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_809C3FC
	ldr r1, _0809C45C @ =gUnknown_2039984
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809C45C: .4byte gUnknown_2039984
	thumb_func_end sub_809C448

	thumb_func_start sub_809C460
sub_809C460: @ 809C460
	push {lr}
	ldr r0, _0809C470 @ =gUnknown_2039984
	ldrb r0, [r0]
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_0809C470: .4byte gUnknown_2039984
	thumb_func_end sub_809C460

	thumb_func_start sub_809C474
sub_809C474: @ 809C474
	push {lr}
	ldr r2, _0809C498 @ =gUnknown_3005090
	ldr r0, _0809C49C @ =gUnknown_2039984
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0809C4A0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	bne _0809C4A0
	movs r0, 0
	b _0809C4A2
	.align 2, 0
_0809C498: .4byte gUnknown_3005090
_0809C49C: .4byte gUnknown_2039984
_0809C4A0:
	movs r0, 0x1
_0809C4A2:
	pop {r1}
	bx r1
	thumb_func_end sub_809C474

	thumb_func_start sub_809C4A8
sub_809C4A8: @ 809C4A8
	push {r4,lr}
	ldr r0, _0809C4E0 @ =sub_809C500
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809C4E4 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	adds r2, 0x8
	adds r1, r2
	adds r0, r1, 0x4
	adds r1, 0x6
	bl PlayerGetDestCoords
	ldr r0, _0809C4E8 @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809C4EC
	ldrh r0, [r4, 0xC]
	adds r0, 0x6
	b _0809C4F0
	.align 2, 0
_0809C4E0: .4byte sub_809C500
_0809C4E4: .4byte gUnknown_3005090
_0809C4E8: .4byte gUnknown_20370C0
_0809C4EC:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
_0809C4F0:
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	subs r0, 0x5
	strh r0, [r4, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809C4A8

	thumb_func_start sub_809C500
sub_809C500: @ 809C500
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0809C544 @ =gUnknown_3005098
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0809C588
	ldrh r1, [r4, 0x2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0809C550
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	ldr r2, _0809C548 @ =0x00000eb5
	bl sub_8058FA4
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	adds r1, 0x2
	ldr r2, _0809C54C @ =0x00000eb7
	bl sub_8058FA4
	b _0809C56E
	.align 2, 0
_0809C544: .4byte gUnknown_3005098
_0809C548: .4byte 0x00000eb5
_0809C54C: .4byte 0x00000eb7
_0809C550:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	ldr r2, _0809C5EC @ =0x00000eb6
	bl sub_8058FA4
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	adds r1, 0x2
	ldr r2, _0809C5F0 @ =0x00000eb8
	bl sub_8058FA4
_0809C56E:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	adds r1, 0x2
	bl CurrentMapDrawMetatileAt
_0809C588:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _0809C5E6
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	bne _0809C5E6
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	ldr r2, _0809C5F4 @ =0x00000e8a
	bl sub_8058FA4
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	adds r1, 0x2
	ldr r2, _0809C5F8 @ =0x00000e96
	bl sub_8058FA4
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	adds r1, 0x2
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	bl DestroyTask
_0809C5E6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809C5EC: .4byte 0x00000eb6
_0809C5F0: .4byte 0x00000eb8
_0809C5F4: .4byte 0x00000e8a
_0809C5F8: .4byte 0x00000e96
	thumb_func_end sub_809C500

	thumb_func_start sub_809C5FC
sub_809C5FC: @ 809C5FC
	push {r4,lr}
	ldr r0, _0809C638 @ =sub_809C640
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809C63C @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	adds r2, 0x8
	adds r1, r2
	adds r0, r1, 0x4
	adds r1, 0x6
	bl PlayerGetDestCoords
	ldrh r0, [r4, 0xC]
	adds r0, 0x4
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	subs r0, 0x5
	strh r0, [r4, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C638: .4byte sub_809C640
_0809C63C: .4byte gUnknown_3005090
	thumb_func_end sub_809C5FC

	thumb_func_start sub_809C640
sub_809C640: @ 809C640
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0809C6A8 @ =gUnknown_3005098
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0809C6F2
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0809C6BA
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	ldr r2, _0809C6AC @ =0x00000e85
	bl sub_8058FA4
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	adds r1, 0x1
	ldr r2, _0809C6B0 @ =0x00000eb4
	bl sub_8058FA4
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	adds r1, 0x1
	bl CurrentMapDrawMetatileAt
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _0809C6B4
	adds r0, r5, 0
	bl DestroyTask
	b _0809C70A
	.align 2, 0
_0809C6A8: .4byte gUnknown_3005098
_0809C6AC: .4byte 0x00000e85
_0809C6B0: .4byte 0x00000eb4
_0809C6B4:
	ldrh r0, [r4, 0x4]
	subs r0, 0x1
	strh r0, [r4, 0x4]
_0809C6BA:
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	ldr r2, _0809C710 @ =0x00000eb9
	bl sub_8058FA4
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	adds r1, 0x1
	ldr r2, _0809C714 @ =0x00000eba
	bl sub_8058FA4
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	adds r1, 0x1
	bl CurrentMapDrawMetatileAt
_0809C6F2:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0809C70A
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
_0809C70A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809C710: .4byte 0x00000eb9
_0809C714: .4byte 0x00000eba
	thumb_func_end sub_809C640

	.align 2, 0 @ Don't pad with nop.
