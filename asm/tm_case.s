	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8133244
sub_8133244: @ 8133244
	push {r4,lr}
	ldr r0, _081332E0 @ =gUnknown_8463190
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, 0
	movs r1, 0x5B
	movs r2, 0xE0
	bl sub_815001C
	movs r0, 0
	movs r1, 0x64
	movs r2, 0xB0
	bl sub_814FEAC
	movs r0, 0
	movs r1, 0x78
	movs r2, 0xD0
	bl sub_814FF2C
	ldr r4, _081332E4 @ =gUnknown_841F408
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xA0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _081332E8 @ =gUnknown_8463180
	adds r0, r4, 0
	movs r1, 0xF6
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xD6
	movs r2, 0x4
	bl LoadPalette
	movs r0, 0xC0
	movs r1, 0x1
	bl sub_8107D38
	movs r4, 0
_081332A4:
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _081332A4
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081332E0: .4byte gUnknown_8463190
_081332E4: .4byte gUnknown_841F408
_081332E8: .4byte gUnknown_8463180
	thumb_func_end sub_8133244

	thumb_func_start sub_81332EC
sub_81332EC: @ 81332EC
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
	ldr r5, _08133350 @ =gUnknown_8463184
	adds r4, r5
	str r4, [sp, 0x8]
	mov r4, r8
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	str r2, [sp, 0x10]
	mov r2, r9
	bl AddTextPrinterParametrized2
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133350: .4byte gUnknown_8463184
	thumb_func_end sub_81332EC

	thumb_func_start sub_8133354
sub_8133354: @ 8133354
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	movs r2, 0x5B
	movs r3, 0xE
	bl SetWindowBorderStyle
	pop {r0}
	bx r0
	thumb_func_end sub_8133354

	thumb_func_start sub_8133368
sub_8133368: @ 8133368
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	movs r2, 0x78
	movs r3, 0xD
	bl SetWindowBorderStyle
	pop {r0}
	bx r0
	thumb_func_end sub_8133368

	thumb_func_start sub_813337C
sub_813337C: @ 813337C
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
	bl GetTextSpeedSetting
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0x6
	movs r2, 0x64
	movs r3, 0xB
	bl DisplayMessageAndContinueTask
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813337C

	thumb_func_start sub_81333C4
sub_81333C4: @ 81333C4
	push {r4,lr}
	sub sp, 0xC
	ldr r4, _081333FC @ =gUnknown_84166D3
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r2, 0x48
	subs r2, r0
	lsrs r2, 1
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08133400 @ =gUnknown_8463184
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x1
	movs r3, 0x1
	bl box_print
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081333FC: .4byte gUnknown_84166D3
_08133400: .4byte gUnknown_8463184
	thumb_func_end sub_81333C4

	thumb_func_start sub_8133404
sub_8133404: @ 8133404
	push {lr}
	movs r0, 0x4
	movs r1, 0x13
	movs r2, 0
	movs r3, 0
	bl sub_8107D68
	movs r0, 0x4
	movs r1, 0x14
	movs r2, 0
	movs r3, 0xC
	bl sub_8107D68
	movs r0, 0x4
	movs r1, 0x15
	movs r2, 0
	movs r3, 0x18
	bl sub_8107D68
	movs r0, 0x4
	movs r1, 0x16
	movs r2, 0
	movs r3, 0x24
	bl sub_8107D68
	movs r0, 0x4
	movs r1, 0x2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_8133404

	thumb_func_start sub_8133444
sub_8133444: @ 8133444
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x28
	str r0, [sp]
	movs r0, 0x30
	str r0, [sp, 0x4]
	movs r0, 0x5
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	cmp r4, 0
	bne _081334A8
	movs r4, 0
	movs r5, 0
_0813346E:
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 26
	lsrs r0, 24
	str r0, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r0, 0x3
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x3
	ldr r2, _081334A4 @ =gUnknown_8416213
	movs r3, 0x7
	bl sub_81332EC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0813346E
	movs r0, 0x5
	movs r1, 0x2
	bl CopyWindowToVram
	b _0813359A
	.align 2, 0
_081334A4: .4byte gUnknown_8416213
_081334A8:
	adds r0, r4, 0
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r1, _081334D8 @ =gBattleMoves
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	movs r2, 0
	movs r3, 0
	bl sub_8107D68
	ldrb r0, [r5, 0x1]
	cmp r0, 0x1
	bhi _081334E0
	ldr r2, _081334DC @ =gUnknown_8416213
	b _081334F0
	.align 2, 0
_081334D8: .4byte gBattleMoves
_081334DC: .4byte gUnknown_8416213
_081334E0:
	ldr r4, _08133524 @ =gStringVar1
	ldrb r1, [r5, 0x1]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r2, r4, 0
_081334F0:
	movs r0, 0xC
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r0, 0x3
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x3
	movs r3, 0x7
	bl sub_81332EC
	ldr r2, _08133528 @ =gBattleMoves
	lsls r1, r7, 1
	adds r0, r1, r7
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x3]
	adds r6, r1, 0
	cmp r0, 0
	bne _08133530
	ldr r2, _0813352C @ =gUnknown_8416213
	b _08133540
	.align 2, 0
_08133524: .4byte gStringVar1
_08133528: .4byte gBattleMoves
_0813352C: .4byte gUnknown_8416213
_08133530:
	ldr r4, _081335A8 @ =gStringVar1
	ldrb r1, [r2, 0x3]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r2, r4, 0
_08133540:
	movs r0, 0x18
	str r0, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0xFF
	mov r8, r0
	str r0, [sp, 0xC]
	movs r0, 0x3
	mov r9, r0
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x3
	movs r3, 0x7
	bl sub_81332EC
	ldr r5, _081335A8 @ =gStringVar1
	ldr r1, _081335AC @ =gBattleMoves
	adds r0, r6, r7
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x4]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x24
	str r0, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	mov r0, r9
	str r0, [sp, 0x10]
	movs r0, 0x5
	movs r1, 0x3
	adds r2, r5, 0
	movs r3, 0x7
	bl sub_81332EC
	movs r0, 0x5
	movs r1, 0x2
	bl CopyWindowToVram
_0813359A:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081335A8: .4byte gStringVar1
_081335AC: .4byte gBattleMoves
	thumb_func_end sub_8133444

	thumb_func_start sub_81335B0
sub_81335B0: @ 81335B0
	push {r4,lr}
	sub sp, 0x8
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _081335DC @ =gUnknown_8E99118
	movs r2, 0x10
	str r2, [sp]
	movs r2, 0xC
	str r2, [sp, 0x4]
	adds r2, r4, 0
	bl BlitBitmapToWindow
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081335DC: .4byte gUnknown_8E99118
	thumb_func_end sub_81335B0

	thumb_func_start sub_81335E0
sub_81335E0: @ 81335E0
	push {lr}
	ldr r0, _08133600 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl GetMoney
	adds r3, r0, 0
	movs r0, 0x8
	movs r1, 0x78
	movs r2, 0xD
	bl PrintMoneyAmountInMoneyBoxWithBorder
	pop {r0}
	bx r0
	.align 2, 0
_08133600: .4byte gSaveBlock1Ptr
	thumb_func_end sub_81335E0

	thumb_func_start sub_8133604
sub_8133604: @ 8133604
	push {lr}
	sub sp, 0x10
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813362C @ =gUnknown_84631E0
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x5B
	str r2, [sp, 0x4]
	movs r2, 0xE
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	movs r2, 0x2
	movs r3, 0
	bl sub_80BF5D0
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0813362C: .4byte gUnknown_84631E0
	thumb_func_end sub_8133604

	thumb_func_start sub_8133630
sub_8133630: @ 8133630
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _08133656
	lsls r0, r1, 3
	ldr r1, _08133660 @ =gUnknown_84631E8
	adds r0, r1
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	bl sub_8133354
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
_08133656:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08133660: .4byte gUnknown_84631E8
	thumb_func_end sub_8133630

	thumb_func_start sub_8133664
sub_8133664: @ 8133664
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8133664

	thumb_func_start sub_813368C
sub_813368C: @ 813368C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _081336E8 @ =gUnknown_8463220
	movs r1, 0x29
	movs r2, 0x2E
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r6, 0
	beq _081336F4
	adds r5, r6, 0
	subs r5, 0x21
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	ldr r0, _081336EC @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8133714
	ldr r0, _081336F0 @ =gBattleMoves
	mov r8, r0
	adds r0, r6, 0
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x2]
	bl sub_8133730
	adds r0, r4, 0
	adds r1, r5, 0
	b _08133700
	.align 2, 0
_081336E8: .4byte gUnknown_8463220
_081336EC: .4byte gSprites
_081336F0: .4byte gBattleMoves
_081336F4:
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _08133710 @ =gSprites
	adds r0, r1
	movs r1, 0xFF
_08133700:
	bl sub_8133790
	adds r0, r7, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08133710: .4byte gSprites
	thumb_func_end sub_813368C

	thumb_func_start sub_8133714
sub_8133714: @ 8133714
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x31
	bls _08133726
	movs r1, 0x1
	bl StartSpriteAnim
	b _0813372C
_08133726:
	movs r1, 0
	bl StartSpriteAnim
_0813372C:
	pop {r0}
	bx r0
	thumb_func_end sub_8133714

	thumb_func_start sub_8133730
sub_8133730: @ 8133730
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xC8
	lsls r0, 1
	bl IndexOfSpritePaletteTag
	lsls r0, 28
	lsrs r5, r0, 24
	ldr r2, _08133784 @ =gUnknown_203B12C
	ldr r0, _08133788 @ =gUnknown_8463238
	lsls r4, 1
	adds r4, r0
	ldrh r1, [r4]
	lsls r1, 1
	ldr r0, [r2]
	adds r0, r1
	movs r1, 0x80
	lsls r1, 1
	adds r2, r1, 0
	adds r1, r5, 0
	orrs r1, r2
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0813378C @ =gUnknown_203B10C
	ldrb r0, [r0, 0x4]
	cmp r0, 0x4
	bne _0813377C
	adds r1, r5, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0x4
	movs r2, 0
	bl BlendPalettes
_0813377C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08133784: .4byte gUnknown_203B12C
_08133788: .4byte gUnknown_8463238
_0813378C: .4byte gUnknown_203B10C
	thumb_func_end sub_8133730

	thumb_func_start sub_8133790
sub_8133790: @ 8133790
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r4, 0xFF
	bne _081337A6
	movs r6, 0x1B
	movs r1, 0x36
	movs r0, 0x14
	strh r0, [r5, 0x26]
	b _081337D8
_081337A6:
	cmp r4, 0x31
	bls _081337B0
	adds r0, r4, 0
	subs r0, 0x32
	b _081337B4
_081337B0:
	adds r0, r4, 0
	adds r0, 0x8
_081337B4:
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 9
	movs r1, 0x3A
	bl __divsi3
	asrs r0, 8
	movs r1, 0x29
	subs r6, r1, r0
	lsls r0, r4, 11
	movs r1, 0x3A
	bl __divsi3
	asrs r0, 8
	adds r1, r0, 0
	adds r1, 0x2E
_081337D8:
	strh r6, [r5, 0x20]
	strh r1, [r5, 0x22]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8133790

	thumb_func_start sub_81337E4
sub_81337E4: @ 81337E4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08133808 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r0, r2, r3
	movs r4, 0
	strh r1, [r0, 0x2E]
	strh r4, [r0, 0x30]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _0813380C @ =sub_8133810
	str r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133808: .4byte gSprites
_0813380C: .4byte sub_8133810
	thumb_func_end sub_81337E4

	thumb_func_start sub_8133810
sub_8133810: @ 8133810
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08133822
	cmp r0, 0x1
	beq _08133886
	b _081338A2
_08133822:
	ldrh r1, [r5, 0x26]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r0, 0x13
	ble _08133880
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08133890
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldr r4, _08133878 @ =gBattleMoves
	ldrh r0, [r5, 0x2E]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x2]
	bl sub_8133730
	ldr r2, _0813387C @ =0xfffffedf
	adds r1, r2, 0
	ldrh r0, [r5, 0x2E]
	adds r1, r0
	strh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_8133714
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_8133790
	b _081338A2
	.align 2, 0
_08133878: .4byte gBattleMoves
_0813387C: .4byte 0xfffffedf
_08133880:
	adds r0, r1, 0
	adds r0, 0xA
	b _081338A0
_08133886:
	ldrh r1, [r5, 0x26]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bgt _0813389C
_08133890:
	ldr r0, _08133898 @ =SpriteCallbackDummy
	str r0, [r5, 0x1C]
	b _081338A2
	.align 2, 0
_08133898: .4byte SpriteCallbackDummy
_0813389C:
	adds r0, r1, 0
	subs r0, 0xA
_081338A0:
	strh r0, [r5, 0x26]
_081338A2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8133810

	thumb_func_start sub_81338A8
sub_81338A8: @ 81338A8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _081338F4 @ =gUnknown_203B12C
	movs r5, 0x88
	lsls r5, 2
	adds r0, r5, 0
	bl Alloc
	adds r1, r0, 0
	str r1, [r4]
	ldr r0, _081338F8 @ =gUnknown_8E84F20
	bl LZDecompressWram
	ldr r0, _081338FC @ =gUnknown_8E85068
	ldr r1, [r4]
	movs r2, 0x80
	lsls r2, 2
	adds r1, r2
	bl LZDecompressWram
	ldr r0, [r4]
	adds r0, r5
	str r0, [sp]
	ldr r1, _08133900 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC8
	lsls r1, 1
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081338F4: .4byte gUnknown_203B12C
_081338F8: .4byte gUnknown_8E84F20
_081338FC: .4byte gUnknown_8E85068
_08133900: .4byte 0xffff0000
	thumb_func_end sub_81338A8

	.align 2, 0 @ Don't pad with nop.
