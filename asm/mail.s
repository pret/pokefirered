	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BEBEC
sub_80BEBEC: @ 80BEBEC
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r4, _080BEC38 @ =gUnknown_20399C4
	ldr r0, _080BEC3C @ =0x000020fc
	bl AllocZeroed
	str r0, [r4]
	adds r0, 0xED
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xEE
	movs r1, 0x1
	strb r1, [r0]
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0xF0
	ldr r0, _080BEC40 @ =CopyEasyChatWord
	str r0, [r1]
	adds r1, 0x4
	ldr r0, _080BEC44 @ =ConvertEasyChatWordsToString
	str r0, [r1]
	ldrh r1, [r5, 0x20]
	adds r0, r1, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bhi _080BEC48
	subs r1, 0x79
	adds r0, r2, 0
	adds r0, 0xEA
	strb r1, [r0]
	b _080BEC52
	.align 2, 0
_080BEC38: .4byte gUnknown_20399C4
_080BEC3C: .4byte 0x000020fc
_080BEC40: .4byte CopyEasyChatWord
_080BEC44: .4byte ConvertEasyChatWordsToString
_080BEC48:
	adds r1, r2, 0
	adds r1, 0xEA
	movs r0, 0
	strb r0, [r1]
	movs r6, 0
_080BEC52:
	ldr r0, _080BEC78 @ =gUnknown_20399C4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xEE
	ldrb r1, [r1]
	cmp r1, 0
	beq _080BEC64
	cmp r1, 0x1
	beq _080BEC80
_080BEC64:
	adds r2, r0, 0
	adds r2, 0xF8
	adds r0, 0xEA
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BEC7C @ =gUnknown_83EEAC4
	b _080BEC90
	.align 2, 0
_080BEC78: .4byte gUnknown_20399C4
_080BEC7C: .4byte gUnknown_83EEAC4
_080BEC80:
	adds r2, r0, 0
	adds r2, 0xF8
	adds r0, 0xEA
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BECC8 @ =gUnknown_83EEB68
_080BEC90:
	adds r0, r1
	str r0, [r2]
	ldrh r0, [r5, 0x1E]
	mov r1, sp
	bl sub_8097F20
	lsls r0, 16
	ldr r1, _080BECCC @ =0xffff0000
	adds r0, r1
	movs r1, 0xCD
	lsls r1, 17
	cmp r0, r1
	bhi _080BECE4
	ldr r0, _080BECD0 @ =gUnknown_20399C4
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0xEA
	ldrb r2, [r2]
	adds r3, r0, 0
	cmp r2, 0x6
	beq _080BECD4
	cmp r2, 0x9
	beq _080BECDC
	adds r1, 0xEB
	movs r0, 0
	strb r0, [r1]
	b _080BECF0
	.align 2, 0
_080BECC8: .4byte gUnknown_83EEB68
_080BECCC: .4byte 0xffff0000
_080BECD0: .4byte gUnknown_20399C4
_080BECD4:
	adds r1, 0xEB
	movs r0, 0x1
	strb r0, [r1]
	b _080BECF0
_080BECDC:
	adds r1, 0xEB
	movs r0, 0x2
	strb r0, [r1]
	b _080BECF0
_080BECE4:
	ldr r0, _080BED10 @ =gUnknown_20399C4
	ldr r1, [r0]
	adds r1, 0xEB
	movs r2, 0
	strb r2, [r1]
	adds r3, r0, 0
_080BECF0:
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0xE4
	str r5, [r0]
	subs r0, 0x8
	str r7, [r0]
	adds r0, 0xC
	strb r6, [r0]
	ldr r0, _080BED14 @ =sub_80BF110
	bl SetMainCallback2
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BED10: .4byte gUnknown_20399C4
_080BED14: .4byte sub_80BF110
	thumb_func_end sub_80BEBEC

	thumb_func_start sub_80BED18
sub_80BED18: @ 80BED18
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r0, _080BED38 @ =gUnknown_30030F0
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x12
	bls _080BED2C
	b _080BF102
_080BED2C:
	lsls r0, 2
	ldr r1, _080BED3C @ =_080BED40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BED38: .4byte gUnknown_30030F0
_080BED3C: .4byte _080BED40
	.align 2, 0
_080BED40:
	.4byte _080BED8C
	.4byte _080BEDBC
	.4byte _080BEDD4
	.4byte _080BEDDA
	.4byte _080BEDE0
	.4byte _080BEDE6
	.4byte _080BEE40
	.4byte _080BEE78
	.4byte _080BEE88
	.4byte _080BEEB8
	.4byte _080BEEC6
	.4byte _080BEF14
	.4byte _080BEF28
	.4byte _080BEFE8
	.4byte _080BF000
	.4byte _080BF01C
	.4byte _080BF026
	.4byte _080BF040
	.4byte _080BF0A4
_080BED8C:
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080BEDB0 @ =gUnknown_203AAC4
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	bne _080BEDB4
	movs r0, 0x22
	bl sub_812B1F0
	b _080BF0F4
	.align 2, 0
_080BEDB0: .4byte gUnknown_203AAC4
_080BEDB4:
	movs r0, 0x1E
	bl sub_812B1F0
	b _080BF0F4
_080BEDBC:
	add r1, sp, 0x8
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _080BEDD0 @ =0x01000200
	add r0, sp, 0x8
	bl CpuSet
	b _080BF0F4
	.align 2, 0
_080BEDD0: .4byte 0x01000200
_080BEDD4:
	bl ResetPaletteFade
	b _080BF0F4
_080BEDDA:
	bl ResetTasks
	b _080BF0F4
_080BEDE0:
	bl ResetSpriteData
	b _080BF0F4
_080BEDE6:
	bl FreeAllSpritePalettes
	bl reset_temp_tile_data_buffers
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
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x18
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
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	b _080BF0F4
_080BEE40:
	movs r0, 0
	bl sub_8001618
	ldr r1, _080BEE6C @ =gUnknown_83EE998
	movs r0, 0
	movs r2, 0x3
	bl sub_8001658
	ldr r4, _080BEE70 @ =gUnknown_20399C4
	ldr r1, [r4]
	adds r1, 0xFC
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _080BEE74 @ =0x000010fc
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	b _080BF0F4
	.align 2, 0
_080BEE6C: .4byte gUnknown_83EE998
_080BEE70: .4byte gUnknown_20399C4
_080BEE74: .4byte 0x000010fc
_080BEE78:
	ldr r0, _080BEE84 @ =gUnknown_83EE9A4
	bl InitWindows
	bl DeactivateAllTextPrinters
	b _080BF0F4
	.align 2, 0
_080BEE84: .4byte gUnknown_83EE9A4
_080BEE88:
	ldr r2, _080BEEB0 @ =gUnknown_83EE9C8
	ldr r0, _080BEEB4 @ =gUnknown_20399C4
	ldr r0, [r0]
	adds r0, 0xEA
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	b _080BF0F4
	.align 2, 0
_080BEEB0: .4byte gUnknown_83EE9C8
_080BEEB4: .4byte gUnknown_20399C4
_080BEEB8:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	cmp r0, 0
	bne _080BEEC4
	b _080BF0F4
_080BEEC4:
	b _080BF102
_080BEEC6:
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
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r2, _080BEF0C @ =gUnknown_83EE9C8
	ldr r0, _080BEF10 @ =gUnknown_20399C4
	ldr r0, [r0]
	adds r0, 0xEA
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x8
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	b _080BF0F4
	.align 2, 0
_080BEF0C: .4byte gUnknown_83EE9C8
_080BEF10: .4byte gUnknown_20399C4
_080BEF14:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	b _080BF0F4
_080BEF28:
	movs r0, 0
	bl stdpal_get
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r6, _080BEFD0 @ =gUnknown_20371F8
	ldr r4, _080BEFD4 @ =gUnknown_83EE9C8
	ldr r0, _080BEFD8 @ =gUnknown_20399C4
	ldr r3, [r0]
	adds r3, 0xEA
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x10]
	movs r2, 0xFA
	lsls r2, 1
	adds r0, r6, r2
	strh r1, [r0]
	ldr r5, _080BEFDC @ =gUnknown_20375F8
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x10]
	adds r2, r5, r2
	strh r0, [r2]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x12]
	movs r2, 0xFB
	lsls r2, 1
	adds r0, r6, r2
	strh r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x12]
	adds r2, r5, r2
	strh r0, [r2]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080BEFE0 @ =gUnknown_83EE9C0
	ldr r0, _080BEFE4 @ =gUnknown_300500C
	ldr r2, [r0]
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r6, 0x14]
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r5, 0x14]
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r1, 0x2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r6, 0x16]
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r5, 0x16]
	b _080BF0F4
	.align 2, 0
_080BEFD0: .4byte gUnknown_20371F8
_080BEFD4: .4byte gUnknown_83EE9C8
_080BEFD8: .4byte gUnknown_20399C4
_080BEFDC: .4byte gUnknown_20375F8
_080BEFE0: .4byte gUnknown_83EE9C0
_080BEFE4: .4byte gUnknown_300500C
_080BEFE8:
	ldr r0, _080BEFFC @ =gUnknown_20399C4
	ldr r0, [r0]
	adds r0, 0xE8
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BEFF6
	b _080BF0F4
_080BEFF6:
	bl sub_80BF13C
	b _080BF0F4
	.align 2, 0
_080BEFFC: .4byte gUnknown_20399C4
_080BF000:
	ldr r0, _080BF018 @ =gUnknown_20399C4
	ldr r0, [r0]
	adds r0, 0xE8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BF0F4
	bl sub_80BF224
	bl sub_8002DE8
	b _080BF0F4
	.align 2, 0
_080BF018: .4byte gUnknown_20399C4
_080BF01C:
	bl sub_8058244
	cmp r0, 0x1
	bne _080BF0F4
	b _080BF102
_080BF026:
	ldr r0, _080BF038 @ =sub_80BF354
	bl SetVBlankCallback
	ldr r2, _080BF03C @ =gUnknown_2037AB8
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	b _080BF0F4
	.align 2, 0
_080BF038: .4byte sub_80BF354
_080BF03C: .4byte gUnknown_2037AB8
_080BF040:
	ldr r5, _080BF064 @ =gUnknown_20399C4
	ldr r0, [r5]
	adds r0, 0xE4
	ldr r0, [r0]
	ldrh r0, [r0, 0x1E]
	bl sub_8096FD4
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r5]
	adds r0, 0xEB
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080BF068
	cmp r0, 0x2
	beq _080BF080
	b _080BF0F4
	.align 2, 0
_080BF064: .4byte gUnknown_20399C4
_080BF068:
	adds r0, r4, 0
	bl sub_80970E0
	ldr r1, _080BF07C @ =nullsub_8
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0x60
	b _080BF092
	.align 2, 0
_080BF07C: .4byte nullsub_8
_080BF080:
	adds r0, r4, 0
	bl sub_80970E0
	ldr r1, _080BF0A0 @ =nullsub_8
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0x28
_080BF092:
	movs r3, 0x80
	bl sub_8096ECC
	ldr r1, [r5]
	adds r1, 0xEC
	strb r0, [r1]
	b _080BF0F4
	.align 2, 0
_080BF0A0: .4byte nullsub_8
_080BF0A4:
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
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _080BF0E8 @ =gUnknown_2037AB8
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _080BF0EC @ =gUnknown_20399C4
	ldr r0, [r0]
	adds r0, 0xE0
	ldr r1, _080BF0F0 @ =sub_80BF394
	str r1, [r0]
	movs r0, 0x1
	b _080BF104
	.align 2, 0
_080BF0E8: .4byte gUnknown_2037AB8
_080BF0EC: .4byte gUnknown_20399C4
_080BF0F0: .4byte sub_80BF394
_080BF0F4:
	ldr r1, _080BF10C @ =gUnknown_30030F0
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080BF102:
	movs r0, 0
_080BF104:
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BF10C: .4byte gUnknown_30030F0
	thumb_func_end sub_80BED18

	thumb_func_start sub_80BF110
sub_80BF110: @ 80BF110
	push {lr}
_080BF112:
	bl sub_80BED18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BF12C
	ldr r0, _080BF128 @ =sub_80BF368
	bl SetMainCallback2
	b _080BF138
	.align 2, 0
_080BF128: .4byte sub_80BF368
_080BF12C:
	bl sub_80BF708
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BF112
_080BF138:
	pop {r0}
	bx r0
	thumb_func_end sub_80BF110

	thumb_func_start sub_80BF13C
sub_80BF13C: @ 80BF13C
	push {r4-r7,lr}
	movs r6, 0
	movs r5, 0
	ldr r2, _080BF1E0 @ =gUnknown_20399C4
	ldr r0, [r2]
	adds r0, 0xF8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080BF19C
	adds r7, r2, 0
_080BF152:
	movs r0, 0x1A
	muls r0, r5
	ldr r2, [r7]
	adds r0, r2, r0
	adds r1, r2, 0
	adds r1, 0xE4
	lsls r3, r6, 1
	ldr r1, [r1]
	adds r1, r3
	adds r2, 0xF8
	ldr r2, [r2]
	ldr r2, [r2, 0x8]
	lsls r4, r5, 2
	adds r2, r4, r2
	ldr r2, [r2]
	lsls r2, 30
	lsrs r2, 30
	movs r3, 0x1
	bl ConvertEasyChatWordsToString
	ldr r0, [r7]
	adds r0, 0xF8
	ldr r1, [r0]
	ldr r0, [r1, 0x8]
	adds r4, r0
	ldr r0, [r4]
	lsls r0, 30
	lsrs r0, 30
	adds r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r1, [r1]
	cmp r5, r1
	bcc _080BF152
_080BF19C:
	ldr r4, _080BF1E0 @ =gUnknown_20399C4
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0xEE
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BF1E8
	adds r0, r1, 0
	adds r0, 0xD0
	adds r1, 0xE4
	ldr r1, [r1]
	adds r1, 0x12
	bl StringCopy
	ldr r1, _080BF1E4 @ =gUnknown_841E234
	bl StringCopy
	ldr r0, [r4]
	adds r0, 0xD0
	bl StringLength
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0xF8
	ldr r1, [r1]
	lsls r0, 16
	lsrs r0, 13
	subs r0, 0x60
	ldrb r1, [r1, 0x2]
	subs r1, r0
	adds r2, 0xE9
	strb r1, [r2]
	b _080BF21E
	.align 2, 0
_080BF1E0: .4byte gUnknown_20399C4
_080BF1E4: .4byte gUnknown_841E234
_080BF1E8:
	adds r0, r1, 0
	adds r0, 0xD0
	adds r1, 0xE4
	ldr r1, [r1]
	adds r1, 0x12
	bl StringCopy
	ldr r0, [r4]
	adds r0, 0xD0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _080BF210
	ldr r0, [r4]
	adds r0, 0xD0
	movs r1, 0x1
	bl ConvertInternationalString
_080BF210:
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0xF8
	ldr r1, [r1]
	ldrb r1, [r1, 0x2]
	adds r0, 0xE9
	strb r1, [r0]
_080BF21E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BF13C

	thumb_func_start sub_80BF224
sub_80BF224: @ 80BF224
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	movs r7, 0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r6, 0
	ldr r0, _080BF348 @ =gUnknown_20399C4
	mov r9, r0
	ldr r0, [r0]
	adds r0, 0xF8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r6, r0
	bcs _080BF2CE
	mov r8, r9
_080BF260:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0x1A
	muls r0, r6
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _080BF2BA
	cmp r0, 0
	beq _080BF2BA
	adds r0, r1, 0
	adds r0, 0xF8
	ldr r1, [r0]
	ldr r0, [r1, 0x8]
	lsls r4, r6, 2
	adds r0, r4, r0
	ldr r2, [r0]
	lsls r2, 24
	lsrs r2, 26
	ldrb r0, [r1, 0x4]
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r1, 0x3]
	adds r3, r7, r3
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _080BF34C @ =gUnknown_83EE9BC
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x1
	bl box_print
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xF8
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	adds r4, r0
	ldrb r0, [r4, 0x1]
	adds r0, r7, r0
	lsls r0, 24
	lsrs r7, r0, 24
_080BF2BA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0xF8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080BF260
_080BF2CE:
	ldr r4, _080BF350 @ =gUnknown_841E234
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0
	bl sub_8005ED4
	mov r9, r0
	ldr r5, _080BF348 @ =gUnknown_20399C4
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0xE9
	ldrb r2, [r1]
	adds r0, 0xF8
	ldr r0, [r0]
	ldrb r3, [r0, 0x1]
	ldr r0, _080BF34C @ =gUnknown_83EE9BC
	mov r8, r0
	str r0, [sp]
	movs r6, 0
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	bl box_print
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0xE9
	ldrb r2, [r0]
	add r2, r9
	lsls r2, 24
	lsrs r2, 24
	adds r0, 0xF
	ldr r0, [r0]
	ldrb r3, [r0, 0x1]
	mov r0, r8
	str r0, [sp]
	str r6, [sp, 0x4]
	adds r0, r1, 0
	adds r0, 0xD0
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	bl box_print
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF348: .4byte gUnknown_20399C4
_080BF34C: .4byte gUnknown_83EE9BC
_080BF350: .4byte gUnknown_841E234
	thumb_func_end sub_80BF224

	thumb_func_start sub_80BF354
sub_80BF354: @ 80BF354
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80BF354

	thumb_func_start sub_80BF368
sub_80BF368: @ 80BF368
	push {r4,lr}
	ldr r4, _080BF390 @ =gUnknown_20399C4
	ldr r0, [r4]
	adds r0, 0xEB
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BF37E
	bl AnimateSprites
	bl BuildOamBuffer
_080BF37E:
	ldr r0, [r4]
	adds r0, 0xE0
	ldr r0, [r0]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF390: .4byte gUnknown_20399C4
	thumb_func_end sub_80BF368

	thumb_func_start sub_80BF394
sub_80BF394: @ 80BF394
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080BF3AA
	ldr r0, _080BF3B0 @ =gUnknown_20399C4
	ldr r0, [r0]
	adds r0, 0xE0
	ldr r1, _080BF3B4 @ =sub_80BF3B8
	str r1, [r0]
_080BF3AA:
	pop {r0}
	bx r0
	.align 2, 0
_080BF3B0: .4byte gUnknown_20399C4
_080BF3B4: .4byte sub_80BF3B8
	thumb_func_end sub_80BF394

	thumb_func_start sub_80BF3B8
sub_80BF3B8: @ 80BF3B8
	push {lr}
	sub sp, 0x4
	ldr r0, _080BF3E8 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080BF3E2
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080BF3EC @ =gUnknown_20399C4
	ldr r0, [r0]
	adds r0, 0xE0
	ldr r1, _080BF3F0 @ =sub_80BF3F4
	str r1, [r0]
_080BF3E2:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080BF3E8: .4byte gUnknown_30030F0
_080BF3EC: .4byte gUnknown_20399C4
_080BF3F0: .4byte sub_80BF3F4
	thumb_func_end sub_80BF3B8

	thumb_func_start sub_80BF3F4
sub_80BF3F4: @ 80BF3F4
	push {r4,lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080BF460
	ldr r4, _080BF468 @ =gUnknown_20399C4
	ldr r0, [r4]
	adds r0, 0xDC
	ldr r0, [r0]
	bl SetMainCallback2
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0xEB
	ldrb r1, [r1]
	cmp r1, 0x2
	bgt _080BF442
	cmp r1, 0x1
	blt _080BF442
	adds r0, 0xE4
	ldr r0, [r0]
	ldrh r0, [r0, 0x1E]
	bl sub_8096FD4
	lsls r0, 16
	lsrs r0, 16
	bl sub_8097168
	ldr r0, [r4]
	adds r0, 0xEC
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF46C @ =gUnknown_202063C
	adds r0, r1
	bl sub_8097070
_080BF442:
	ldr r4, _080BF468 @ =gUnknown_20399C4
	ldr r0, [r4]
	ldr r2, _080BF470 @ =0x000020fc
	movs r1, 0
	bl memset
	bl ResetPaletteFade
	bl FreeAllWindowBuffers
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_080BF460:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF468: .4byte gUnknown_20399C4
_080BF46C: .4byte gUnknown_202063C
_080BF470: .4byte 0x000020fc
	thumb_func_end sub_80BF3F4

	.align 2, 0 @ Don't pad with nop.
