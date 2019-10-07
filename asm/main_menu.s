	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_800CED4
sub_800CED4: @ 800CED4
	push {r4-r6,lr}
	sub sp, 0x2C
	ldr r6, _0800CF30 @ =gUnknown_823468B
	str r6, [sp]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0x4]
	ldr r0, _0800CF34 @ =gText_Time
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x22
	bl AddTextPrinterParameterized3
	ldr r4, _0800CF38 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	add r0, sp, 0xC
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r1, 0xF0
	strb r1, [r0]
	adds r0, 0x1
	ldr r1, [r4]
	ldrb r1, [r1, 0x10]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	str r6, [sp]
	str r5, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x3E
	movs r3, 0x22
	bl AddTextPrinterParameterized3
	add sp, 0x2C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CF30: .4byte gUnknown_823468B
_0800CF34: .4byte gText_Time
_0800CF38: .4byte gSaveBlock2Ptr
	thumb_func_end sub_800CED4

	thumb_func_start sub_800CF3C
sub_800CF3C: @ 800CF3C
	push {r4-r6,lr}
	sub sp, 0x2C
	ldr r0, _0800CF60 @ =0x00000829
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0800CFAE
	bl IsNationalPokedexEnabled
	cmp r0, 0
	beq _0800CF64
	movs r0, 0x1
	bl GetNationalPokedexCount
	b _0800CF6A
	.align 2, 0
_0800CF60: .4byte 0x00000829
_0800CF64:
	movs r0, 0x1
	bl GetKantoPokedexCount
_0800CF6A:
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r5, _0800CFB8 @ =gUnknown_823468B
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0800CFBC @ =gText_Pokedex
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x32
	bl AddTextPrinterParameterized3
	add r0, sp, 0xC
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r1, _0800CFC0 @ =gUnknown_841B6EB
	bl StringAppend
	str r5, [sp]
	str r4, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x3E
	movs r3, 0x32
	bl AddTextPrinterParameterized3
_0800CFAE:
	add sp, 0x2C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CFB8: .4byte gUnknown_823468B
_0800CFBC: .4byte gText_Pokedex
_0800CFC0: .4byte gUnknown_841B6EB
	thumb_func_end sub_800CF3C

	thumb_func_start sub_800CFC4
sub_800CFC4: @ 800CFC4
	push {r4-r6,lr}
	sub sp, 0x2C
	movs r6, 0
	movs r4, 0x82
	lsls r4, 4
_0800CFCE:
	lsls r0, r4, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0800CFE2
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0800CFE2:
	adds r4, 0x1
	ldr r0, _0800D034 @ =0x00000827
	cmp r4, r0
	bls _0800CFCE
	ldr r5, _0800D038 @ =gUnknown_823468B
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0800D03C @ =gUnknown_841B6EC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x2
	movs r3, 0x42
	bl AddTextPrinterParameterized3
	add r0, sp, 0xC
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r1, _0800D040 @ =gUnknown_841B6F3
	bl StringAppend
	str r5, [sp]
	str r4, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x3E
	movs r3, 0x42
	bl AddTextPrinterParameterized3
	add sp, 0x2C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D034: .4byte 0x00000827
_0800D038: .4byte gUnknown_823468B
_0800D03C: .4byte gUnknown_841B6EC
_0800D040: .4byte gUnknown_841B6F3
	thumb_func_end sub_800CFC4

	thumb_func_start sub_800D044
sub_800D044: @ 800D044
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0800D088 @ =gSaveBlock2Ptr
	ldr r0, [r5]
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl sub_8069788
	ldr r1, [r0]
	movs r2, 0x90
	lsls r2, 1
	ldr r3, _0800D08C @ =0x000001b1
	adds r0, r4, 0
	bl LoadBgTiles
	ldr r0, [r5]
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl sub_8069788
	ldr r0, [r0, 0x4]
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0800D090 @ =gUnknown_8234638
	bl sub_800D1E8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D088: .4byte gSaveBlock2Ptr
_0800D08C: .4byte 0x000001b1
_0800D090: .4byte gUnknown_8234638
	thumb_func_end sub_800D044

	thumb_func_start sub_800D094
sub_800D094: @ 800D094
	push {lr}
	ldr r1, _0800D0AC @ =0x000001b1
	movs r0, 0
	movs r2, 0x20
	bl TextWindow_SetStdFrame0_WithPal
	ldr r0, _0800D0B0 @ =gUnknown_8234638
	bl sub_800D1E8
	pop {r0}
	bx r0
	.align 2, 0
_0800D0AC: .4byte 0x000001b1
_0800D0B0: .4byte gUnknown_8234638
	thumb_func_end sub_800D094

	thumb_func_start sub_800D0B4
sub_800D0B4: @ 800D0B4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	adds r5, r0, 0
	ldrb r0, [r5]
	ldr r1, _0800D1D8 @ =0x000001b1
	ldrb r2, [r5, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r6, 0x1
	str r6, [sp]
	str r6, [sp, 0x4]
	movs r4, 0x2
	mov r8, r4
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	movs r1, 0xD9
	lsls r1, 1
	ldrb r2, [r5, 0x1]
	ldrb r3, [r5, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r4, [r5, 0x3]
	str r4, [sp]
	ldrb r4, [r5, 0x4]
	str r4, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	ldr r1, _0800D1DC @ =0x000001b3
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x1]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x2]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	movs r1, 0xDA
	lsls r1, 1
	ldrb r2, [r5, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x2]
	str r6, [sp]
	ldrb r4, [r5, 0x4]
	str r4, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	movs r1, 0xDB
	lsls r1, 1
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x1]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x2]
	str r6, [sp]
	ldrb r4, [r5, 0x4]
	str r4, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	ldr r1, _0800D1E0 @ =0x000001b7
	ldrb r2, [r5, 0x1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x4]
	ldrb r4, [r5, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	movs r1, 0xDC
	lsls r1, 1
	ldrb r2, [r5, 0x1]
	ldrb r3, [r5, 0x4]
	ldrb r4, [r5, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	ldrb r4, [r5, 0x3]
	str r4, [sp]
	str r6, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	ldr r1, _0800D1E4 @ =0x000001b9
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x1]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5, 0x4]
	ldrb r4, [r5, 0x2]
	adds r3, r4
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl FillBgTilemapBufferRect
	ldrb r0, [r5]
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D1D8: .4byte 0x000001b1
_0800D1DC: .4byte 0x000001b3
_0800D1E0: .4byte 0x000001b7
_0800D1E4: .4byte 0x000001b9
	thumb_func_end sub_800D0B4

	thumb_func_start sub_800D1E8
sub_800D1E8: @ 800D1E8
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldrb r0, [r6]
	ldrb r1, [r6, 0x1]
	subs r2, r1, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r4, [r6, 0x2]
	subs r3, r4, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r5, [r6, 0x3]
	adds r1, r5
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	ldrb r1, [r6, 0x4]
	adds r4, r1
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	movs r1, 0x2
	str r1, [sp, 0x8]
	movs r1, 0
	bl FillBgTilemapBufferRect
	ldrb r0, [r6]
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_800D1E8

	.align 2, 0 @ Don't pad with nop.
