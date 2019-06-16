	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_810E578
sub_810E578: @ 810E578
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	ldr r0, _0810E5D4 @ =gTasks+0x8
	adds r5, r0
	movs r0, 0x2
	bl sub_810EAF0
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r5]
	ldr r4, _0810E5D8 @ =gUnknown_203ADCC + 0x4
	adds r2, r4, 0x2
	adds r1, r4, 0
	bl DestroyListMenu
	bl sub_810DDA4
	bl sub_810DBF0
	bl sub_810D878
	ldr r0, _0810E5DC @ =gMultiuseListMenuTemplate
	subs r4, 0x4
	ldrh r1, [r4, 0x4]
	ldrh r2, [r4, 0x6]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, 0
	bl sub_810DFB0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E5D4: .4byte gTasks+0x8
_0810E5D8: .4byte gUnknown_203ADCC + 0x4
_0810E5DC: .4byte gMultiuseListMenuTemplate
	thumb_func_end sub_810E578

	thumb_func_start sub_810E5E0
sub_810E5E0: @ 810E5E0
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 16
	lsrs r0, 16
	bl ItemPc_GetItemIdBySlotId
	lsls r0, 16
	lsrs r0, 16
	ldr r6, _0810E660 @ =gStringVar1
	adds r1, r6, 0
	bl CopyItemName
	ldr r5, _0810E664 @ =gStringVar4
	ldr r1, _0810E668 @ =gUnknown_84177AC
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x1
	bl sub_810EAB4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r2, r5, 0
	movs r3, 0
	bl AddTextPrinterParameterized
	adds r0, r6, 0
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r1, _0810E66C @ =gText_TimesStrVar1
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x3
	bl sub_810EA9C
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x3
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0x8
	bl sub_810EA34
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E660: .4byte gStringVar1
_0810E664: .4byte gStringVar4
_0810E668: .4byte gUnknown_84177AC
_0810E66C: .4byte gText_TimesStrVar1
	thumb_func_end sub_810E5E0

	thumb_func_start sub_810E670
sub_810E670: @ 810E670
	push {r4,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x1C
	str r0, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x11
	movs r2, 0xA
	movs r3, 0xA
	bl FillWindowPixelRect
	ldr r0, _0810E6CC @ =gStringVar1
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _0810E6D0 @ =gStringVar4
	ldr r1, _0810E6D4 @ =gText_TimesStrVar1
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r0, 0x3
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x8
	bl sub_810EA34
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E6CC: .4byte gStringVar1
_0810E6D0: .4byte gStringVar4
_0810E6D4: .4byte gText_TimesStrVar1
	thumb_func_end sub_810E670

	thumb_func_start sub_810E6D8
sub_810E6D8: @ 810E6D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810E708 @ =gTasks+0x8
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x10
	ldrh r1, [r4, 0x4]
	bl sub_80BF848
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810E70C
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	bl sub_810E670
	b _0810E796
	.align 2, 0
_0810E708: .4byte gTasks+0x8
_0810E70C:
	ldr r0, _0810E74C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810E750
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_810EAF0
	movs r0, 0x3
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810DAB4
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_810DBD0
	adds r0, r5, 0
	bl sub_810E418
	b _0810E796
	.align 2, 0
_0810E74C: .4byte gMain
_0810E750:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810E796
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x3
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x1
	bl sub_810EAF0
	movs r0, 0x3
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810DAB4
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_810DBD0
	adds r0, r6, 0
	bl sub_810DFB0
_0810E796:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810E6D8

	thumb_func_start sub_810E79C
sub_810E79C: @ 810E79C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _0810E7DC
	movs r0, 0x4
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0
	bl sub_810EAF0
	movs r0, 0x4
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	ldr r1, _0810E7D4 @ =gText_ThereIsNoPokemon
	ldr r2, _0810E7D8 @ =sub_810E848
	adds r0, r4, 0
	bl sub_810EB30
	b _0810E7EA
	.align 2, 0
_0810E7D4: .4byte gText_ThereIsNoPokemon
_0810E7D8: .4byte sub_810E848
_0810E7DC:
	ldr r0, _0810E7F0 @ =gUnknown_203ADBC
	ldr r1, [r0]
	ldr r0, _0810E7F4 @ =sub_810E7F8
	str r0, [r1]
	adds r0, r4, 0
	bl sub_810DC8C
_0810E7EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E7F0: .4byte gUnknown_203ADBC
_0810E7F4: .4byte sub_810E7F8
	thumb_func_end sub_810E79C

	thumb_func_start sub_810E7F8
sub_810E7F8: @ 810E7F8
	push {lr}
	sub sp, 0xC
	movs r0, 0x6
	str r0, [sp]
	ldr r0, _0810E82C @ =sub_811FB28
	str r0, [sp, 0x4]
	ldr r0, _0810E830 @ =sub_810E838
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x6
	movs r3, 0
	bl sub_811EA44
	bl sub_810DD54
	lsls r0, 24
	lsrs r0, 24
	bl ItemPc_GetItemIdBySlotId
	ldr r1, _0810E834 @ =gUnknown_203B0A0
	strh r0, [r1, 0xC]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0810E82C: .4byte sub_811FB28
_0810E830: .4byte sub_810E838
_0810E834: .4byte gUnknown_203B0A0
	thumb_func_end sub_810E7F8

	thumb_func_start sub_810E838
sub_810E838: @ 810E838
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl sub_810D3F4
	pop {r0}
	bx r0
	thumb_func_end sub_810E838

	thumb_func_start sub_810E848
sub_810E848: @ 810E848
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0810E898 @ =gTasks+0x8
	adds r5, r0, r1
	ldr r0, _0810E89C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810E892
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x5
	movs r1, 0
	bl sub_810F260
	movs r0, 0x5
	bl ClearWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_810DAB4
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r4, 0
	bl sub_810DFB0
_0810E892:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E898: .4byte gTasks+0x8
_0810E89C: .4byte gMain
	thumb_func_end sub_810E848

	thumb_func_start sub_810E8A0
sub_810E8A0: @ 810E8A0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _0810E8EC @ =gTasks+0x8
	adds r4, r0
	movs r0, 0x4
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0
	bl sub_810EAF0
	movs r0, 0x4
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810DAB4
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r5, 0
	bl sub_810DFB0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E8EC: .4byte gTasks+0x8
	thumb_func_end sub_810E8A0

	thumb_func_start sub_810E8F0
sub_810E8F0: @ 810E8F0
	push {r4,lr}
	ldr r0, _0810E974 @ =gUnknown_8453F98
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r1, 0xF0
	lsls r1, 2
	movs r0, 0
	movs r2, 0xE0
	bl sub_815001C
	ldr r1, _0810E978 @ =0x000003a3
	movs r0, 0
	movs r2, 0xC0
	bl sub_814FF2C
	movs r1, 0xEB
	lsls r1, 2
	movs r0, 0
	movs r2, 0xB0
	bl sub_814FEAC
	movs r0, 0x2
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810E97C @ =gTMCaseMainWindowPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	movs r4, 0
_0810E938:
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0810E938
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r4, 0
	ldr r3, _0810E980 @ =gUnknown_203ADD8
	movs r2, 0xFF
_0810E95C:
	adds r0, r4, r3
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0810E95C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E974: .4byte gUnknown_8453F98
_0810E978: .4byte 0x000003a3
_0810E97C: .4byte gTMCaseMainWindowPalette
_0810E980: .4byte gUnknown_203ADD8
	thumb_func_end sub_810E8F0

	thumb_func_start sub_810E984
sub_810E984: @ 810E984
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x10
	ldr r6, [sp, 0x28]
	ldr r4, [sp, 0x2C]
	mov r8, r4
	ldr r4, [sp, 0x30]
	mov r9, r4
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r6, 24
	lsrs r6, 24
	mov r4, r8
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	mov r4, r9
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	str r1, [sp]
	mov r1, sp
	strb r0, [r1, 0x4]
	movs r0, 0x3
	strb r0, [r1, 0x5]
	mov r0, sp
	strb r2, [r0, 0x6]
	strb r3, [r0, 0x7]
	strb r2, [r0, 0x8]
	strb r3, [r0, 0x9]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r5, 0xF
	adds r0, r5, 0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r4, 0x10
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	strb r0, [r2, 0xD]
	mov r1, sp
	movs r0, 0x30
	strb r0, [r1, 0xD]
	movs r0, 0x3
	movs r1, 0x4
	bl GetFontAttribute
	mov r1, sp
	ands r5, r0
	ldrb r0, [r1, 0xC]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, 0xC]
	movs r0, 0x3
	movs r1, 0x2
	bl GetFontAttribute
	mov r1, sp
	adds r6, r0
	strb r6, [r1, 0xA]
	movs r0, 0x3
	movs r1, 0x3
	bl GetFontAttribute
	mov r1, sp
	add r8, r0
	mov r0, r8
	strb r0, [r1, 0xB]
	mov r0, sp
	mov r1, r9
	movs r2, 0
	bl AddTextPrinter
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810E984

	thumb_func_start sub_810EA34
sub_810EA34: @ 810EA34
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r3
	ldr r3, [sp, 0x30]
	ldr r4, [sp, 0x34]
	ldr r6, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	mov r8, r5
	ldr r5, [sp, 0x40]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	lsls r7, 24
	lsrs r7, 24
	mov r9, r7
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	str r4, [sp]
	str r6, [sp, 0x4]
	lsls r4, r5, 1
	adds r4, r5
	ldr r5, _0810EA98 @ =gUnknown_8453F8C
	adds r4, r5
	str r4, [sp, 0x8]
	mov r4, r8
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	str r2, [sp, 0x10]
	mov r2, r9
	bl AddTextPrinterParameterized4
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810EA98: .4byte gUnknown_8453F8C
	thumb_func_end sub_810EA34

	thumb_func_start sub_810EA9C
sub_810EA9C: @ 810EA9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xF0
	lsls r2, 2
	movs r1, 0
	movs r3, 0xE
	bl SetWindowBorderStyle
	pop {r0}
	bx r0
	thumb_func_end sub_810EA9C

	thumb_func_start sub_810EAB4
sub_810EAB4: @ 810EAB4
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0810EAE4 @ =gUnknown_203ADD8
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _0810EADC
	lsls r0, r1, 3
	ldr r1, _0810EAE8 @ =gUnknown_8453FD0
	adds r0, r1
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r2, _0810EAEC @ =0x000003a3
	movs r1, 0x1
	movs r3, 0xC
	bl SetWindowBorderStyle
_0810EADC:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810EAE4: .4byte gUnknown_203ADD8
_0810EAE8: .4byte gUnknown_8453FD0
_0810EAEC: .4byte 0x000003a3
	thumb_func_end sub_810EAB4

	thumb_func_start sub_810EAF0
sub_810EAF0: @ 810EAF0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810EB1C @ =gUnknown_203ADD8
	adds r4, r0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810EB1C: .4byte gUnknown_203ADD8
	thumb_func_end sub_810EAF0

	thumb_func_start sub_810EB20
sub_810EB20: @ 810EB20
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810EB2C @ =gUnknown_203ADD8
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0810EB2C: .4byte gUnknown_203ADD8
	thumb_func_end sub_810EB20

	thumb_func_start sub_810EB30
sub_810EB30: @ 810EB30
	push {r4-r6,lr}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xEB
	lsls r2, 2
	movs r1, 0x2
	str r1, [sp]
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	str r6, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0x5
	movs r3, 0xB
	bl DisplayMessageAndContinueTask
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810EB30

	.align 2, 0 @ Don't pad with nop.
