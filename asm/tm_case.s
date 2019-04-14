	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8131E18
sub_8131E18: @ 8131E18
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	bne _08131E2C
	movs r5, 0
	b _08131E3A
_08131E2C:
	lsls r1, r4, 16
	lsrs r1, 16
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r5, r0, 16
_08131E3A:
	cmp r6, 0x1
	beq _08131E50
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08131E64 @ =gUnknown_203B118
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	adds r1, r5, 0
	bl sub_81337E4
_08131E50:
	adds r0, r4, 0
	bl sub_8131F0C
	adds r0, r5, 0
	bl sub_8133444
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08131E64: .4byte gUnknown_203B118
	thumb_func_end sub_8131E18

	thumb_func_start sub_8131E68
sub_8131E68: @ 8131E68
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r7, r9
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	mov r4, r8
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08131EFE
	lsls r0, r1, 16
	lsrs r6, r0, 16
	movs r0, 0x4
	adds r1, r6, 0
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_unique
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08131EF4
	ldr r4, _08131EE8 @ =gStringVar1
	movs r0, 0x4
	adds r1, r6, 0
	bl sub_809A7B4
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _08131EEC @ =gStringVar4
	ldr r1, _08131EF0 @ =gUnknown_84162B9
	adds r0, r4, 0
	bl StringExpandPlaceholders
	mov r0, r8
	str r0, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0xFF
	str r0, [sp, 0xC]
	movs r0, 0x1
	str r0, [sp, 0x10]
	mov r0, r9
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0x7E
	bl sub_81332EC
	b _08131EFE
	.align 2, 0
_08131EE8: .4byte gStringVar1
_08131EEC: .4byte gStringVar4
_08131EF0: .4byte gUnknown_84162B9
_08131EF4:
	adds r0, r7, 0
	movs r1, 0x8
	adds r2, r4, 0
	bl sub_81335B0
_08131EFE:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8131E68

	thumb_func_start sub_8131F0C
sub_8131F0C: @ 8131F0C
	push {r4,lr}
	sub sp, 0x14
	adds r1, r0, 0
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08131F30
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl ItemId_GetDescription
	adds r4, r0, 0
	b _08131F32
_08131F30:
	ldr r4, _08131F60 @ =gUnknown_84166E1
_08131F32:
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0x2
	bl sub_81332EC
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08131F60: .4byte gUnknown_84166E1
	thumb_func_end sub_8131F0C

	thumb_func_start sub_8131F64
sub_8131F64: @ 8131F64
	push {lr}
	sub sp, 0x8
	movs r1, 0x8
	str r1, [sp]
	lsls r0, 1
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x1E
	bl sub_80F6B08
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_8131F64

	thumb_func_start sub_8131F90
sub_8131F90: @ 8131F90
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
	bl sub_8131FB0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8131F90

	thumb_func_start sub_8131FB0
sub_8131FB0: @ 8131FB0
	push {r4,r5,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0xFF
	bne _08131FF4
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
	movs r0, 0
	movs r1, 0
	movs r2, 0
	adds r3, r5, 0
	bl FillWindowPixelRect
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	b _0813200A
_08131FF4:
	ldr r2, _08132014 @ =gFameCheckerText_ListMenuCursor
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0
	bl sub_81332EC
_0813200A:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132014: .4byte gFameCheckerText_ListMenuCursor
	thumb_func_end sub_8131FB0

	thumb_func_start sub_8132018
sub_8132018: @ 8132018
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _0813204C @ =gUnknown_203B118
	ldr r1, [r4]
	ldrb r0, [r1, 0x6]
	ldrb r1, [r1, 0x5]
	subs r0, r1
	adds r0, 0x1
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	ldr r0, _08132050 @ =gUnknown_203B10C + 10
	str r0, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0xA0
	movs r2, 0x8
	movs r3, 0x58
	bl AddScrollIndicatorArrowPairParametrized
	ldr r1, [r4]
	strb r0, [r1, 0x8]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813204C: .4byte gUnknown_203B118
_08132050: .4byte gUnknown_203B10C + 10
	thumb_func_end sub_8132018

	thumb_func_start sub_8132054
sub_8132054: @ 8132054
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _08132088 @ =gUnknown_203B118
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0xA]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x6E
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r1, 0xA
	str r1, [sp, 0xC]
	movs r0, 0x2
	movs r1, 0x98
	movs r2, 0x48
	movs r3, 0x68
	bl AddScrollIndicatorArrowPairParametrized
	ldr r1, [r4]
	strb r0, [r1, 0x8]
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132088: .4byte gUnknown_203B118
	thumb_func_end sub_8132054

	thumb_func_start sub_813208C
sub_813208C: @ 813208C
	push {r4,lr}
	ldr r4, _081320A8 @ =gUnknown_203B118
	ldr r1, [r4]
	ldrb r0, [r1, 0x8]
	cmp r0, 0xFF
	beq _081320A2
	bl RemoveScrollIndicatorArrowPair
	ldr r1, [r4]
	movs r0, 0xFF
	strb r0, [r1, 0x8]
_081320A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081320A8: .4byte gUnknown_203B118
	thumb_func_end sub_813208C

	thumb_func_start sub_81320AC
sub_81320AC: @ 81320AC
	ldr r1, _081320B8 @ =gUnknown_203B10C
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
	bx lr
	.align 2, 0
_081320B8: .4byte gUnknown_203B10C
	thumb_func_end sub_81320AC

	thumb_func_start sub_81320BC
sub_81320BC: @ 81320BC
	push {r4,lr}
	ldr r4, _08132118 @ =gUnknown_20398A4
	ldr r0, [r4]
	ldrb r1, [r4, 0x4]
	bl sub_809A584
	ldr r3, _0813211C @ =gUnknown_203B118
	ldr r1, [r3]
	movs r0, 0
	strb r0, [r1, 0x6]
	movs r2, 0
	ldrb r0, [r4, 0x4]
	cmp r2, r0
	bcs _08132100
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08132100
_081320E0:
	ldr r0, [r3]
	ldrb r1, [r0, 0x6]
	adds r1, 0x1
	strb r1, [r0, 0x6]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r0, [r4, 0x4]
	cmp r2, r0
	bcs _08132100
	ldr r0, [r4]
	lsls r1, r2, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _081320E0
_08132100:
	ldr r0, _0813211C @ =gUnknown_203B118
	ldr r1, [r0]
	ldrb r0, [r1, 0x6]
	adds r0, 0x1
	cmp r0, 0x5
	ble _0813210E
	movs r0, 0x5
_0813210E:
	strb r0, [r1, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132118: .4byte gUnknown_20398A4
_0813211C: .4byte gUnknown_203B118
	thumb_func_end sub_81320BC

	thumb_func_start sub_8132120
sub_8132120: @ 8132120
	push {r4,r5,lr}
	ldr r0, _08132160 @ =gUnknown_203B10C
	ldrh r1, [r0, 0xA]
	adds r4, r0, 0
	ldr r5, _08132164 @ =gUnknown_203B118
	cmp r1, 0
	beq _08132144
	ldrh r0, [r4, 0xA]
	ldr r1, [r5]
	ldrb r3, [r1, 0x5]
	adds r0, r3
	ldrb r2, [r1, 0x6]
	adds r1, r2, 0x1
	cmp r0, r1
	ble _08132144
	subs r0, r3, 0x1
	subs r0, r2, r0
	strh r0, [r4, 0xA]
_08132144:
	adds r3, r4, 0
	ldrh r0, [r3, 0xA]
	ldrh r1, [r3, 0x8]
	adds r0, r1
	ldr r1, [r5]
	ldrb r1, [r1, 0x6]
	adds r2, r1, 0x1
	cmp r0, r2
	blt _0813216A
	cmp r2, 0x1
	bgt _08132168
	movs r0, 0
	strh r0, [r3, 0x8]
	b _0813216A
	.align 2, 0
_08132160: .4byte gUnknown_203B10C
_08132164: .4byte gUnknown_203B118
_08132168:
	strh r1, [r4, 0x8]
_0813216A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8132120

	thumb_func_start sub_8132170
sub_8132170: @ 8132170
	push {r4-r6,lr}
	ldr r0, _081321CC @ =gUnknown_203B10C
	ldrh r1, [r0, 0x8]
	adds r6, r0, 0
	cmp r1, 0x3
	bls _081321C4
	movs r4, 0
	ldrh r0, [r6, 0x8]
	subs r0, 0x3
	cmp r4, r0
	bgt _081321C4
	ldrh r1, [r6, 0xA]
	ldr r5, _081321D0 @ =gUnknown_203B118
	ldr r2, [r5]
	ldrb r0, [r2, 0x5]
	adds r1, r0
	ldrb r0, [r2, 0x6]
	adds r0, 0x1
	cmp r1, r0
	beq _081321C4
	adds r3, r6, 0
_0813219A:
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrh r0, [r3, 0x8]
	subs r0, 0x3
	cmp r4, r0
	bgt _081321C4
	ldrh r1, [r6, 0xA]
	ldr r2, [r5]
	ldrb r0, [r2, 0x5]
	adds r1, r0
	ldrb r0, [r2, 0x6]
	adds r0, 0x1
	cmp r1, r0
	bne _0813219A
_081321C4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081321CC: .4byte gUnknown_203B10C
_081321D0: .4byte gUnknown_203B118
	thumb_func_end sub_8132170

	thumb_func_start sub_81321D4
sub_81321D4: @ 81321D4
	push {lr}
	ldr r0, _0813221C @ =gUnknown_203B118
	ldr r0, [r0]
	cmp r0, 0
	beq _081321E2
	bl Free
_081321E2:
	ldr r0, _08132220 @ =gUnknown_203B120
	ldr r0, [r0]
	cmp r0, 0
	beq _081321EE
	bl Free
_081321EE:
	ldr r0, _08132224 @ =gUnknown_203B124
	ldr r0, [r0]
	cmp r0, 0
	beq _081321FA
	bl Free
_081321FA:
	ldr r0, _08132228 @ =gUnknown_203B128
	ldr r0, [r0]
	cmp r0, 0
	beq _08132206
	bl Free
_08132206:
	ldr r0, _0813222C @ =gUnknown_203B12C
	ldr r0, [r0]
	cmp r0, 0
	beq _08132212
	bl Free
_08132212:
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
_0813221C: .4byte gUnknown_203B118
_08132220: .4byte gUnknown_203B120
_08132224: .4byte gUnknown_203B124
_08132228: .4byte gUnknown_203B128
_0813222C: .4byte gUnknown_203B12C
	thumb_func_end sub_81321D4

	thumb_func_start sub_8132230
sub_8132230: @ 8132230
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08132264 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08132268 @ =sub_813226C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132264: .4byte gTasks
_08132268: .4byte sub_813226C
	thumb_func_end sub_8132230

	thumb_func_start sub_813226C
sub_813226C: @ 813226C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081322A4 @ =gTasks+0x8
	adds r2, r0, r1
	ldr r0, _081322A8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081322CC
	ldrb r0, [r2]
	ldr r4, _081322AC @ =gUnknown_203B10C + 10
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl sub_810713C
	ldr r0, _081322B0 @ =gUnknown_203B118
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _081322B4
	bl SetMainCallback2
	b _081322BE
	.align 2, 0
_081322A4: .4byte gTasks+0x8
_081322A8: .4byte gPaletteFade
_081322AC: .4byte gUnknown_203B10C + 10
_081322B0: .4byte gUnknown_203B118
_081322B4:
	adds r0, r4, 0
	subs r0, 0xA
	ldr r0, [r0]
	bl SetMainCallback2
_081322BE:
	bl sub_813208C
	bl sub_81321D4
	adds r0, r5, 0
	bl DestroyTask
_081322CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813226C

	thumb_func_start sub_81322D4
sub_81322D4: @ 81322D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08132340 @ =gTasks+0x8
	adds r6, r0, r1
	ldr r0, _08132344 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0
	bne _081323C8
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081323C8
	ldrb r0, [r6]
	bl ListMenuHandleInput
	adds r5, r0, 0
	ldrb r0, [r6]
	ldr r4, _08132348 @ =gUnknown_203B10C + 10
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl get_coro_args_x18_x1A
	ldr r0, _0813234C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08132354
	adds r0, r4, 0
	subs r0, 0xA
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _08132354
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08132350 @ =gSpecialVar_ItemId
	mov r1, r8
	strh r1, [r0]
	b _08132370
	.align 2, 0
_08132340: .4byte gTasks+0x8
_08132344: .4byte gPaletteFade
_08132348: .4byte gUnknown_203B10C + 10
_0813234C: .4byte gMain
_08132350: .4byte gSpecialVar_ItemId
_08132354:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _08132364
	adds r0, 0x1
	cmp r5, r0
	bne _0813237C
	b _081323C8
_08132364:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08132378 @ =gSpecialVar_ItemId
	movs r0, 0
	strh r0, [r1]
_08132370:
	adds r0, r7, 0
	bl sub_8132230
	b _081323C8
	.align 2, 0
_08132378: .4byte gSpecialVar_ItemId
_0813237C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_8131F64
	bl sub_813208C
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8131F90
	strh r5, [r6, 0x2]
	lsls r4, r5, 16
	lsrs r4, 16
	movs r0, 0x4
	adds r1, r4, 0
	bl sub_809A7B4
	strh r0, [r6, 0x4]
	movs r0, 0x4
	adds r1, r4, 0
	bl sub_809A798
	ldr r1, _081323D4 @ =gSpecialVar_ItemId
	strh r0, [r1]
	ldr r0, _081323D8 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r2, _081323DC @ =gUnknown_8463140
	ldr r0, _081323E0 @ =gUnknown_203B10C
	ldrb r0, [r0, 0x4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
_081323C8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081323D4: .4byte gSpecialVar_ItemId
_081323D8: .4byte gTasks
_081323DC: .4byte gUnknown_8463140
_081323E0: .4byte gUnknown_203B10C
	thumb_func_end sub_81322D4

	thumb_func_start sub_81323E4
sub_81323E4: @ 81323E4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_8131F64
	bl sub_8132018
	ldr r1, _0813240C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08132410 @ =sub_81322D4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813240C: .4byte gTasks
_08132410: .4byte sub_81322D4
	thumb_func_end sub_81323E4

	thumb_func_start sub_8132414
sub_8132414: @ 8132414
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x2
	bl sub_8133368
	bl sub_80BF708
	lsls r0, 24
	cmp r0, 0
	bne _08132454
	bl InUnionRoom
	cmp r0, 0x1
	beq _08132454
	ldr r4, _0813244C @ =gUnknown_203B118
	ldr r0, [r4]
	adds r0, 0x7
	movs r1, 0
	bl sub_8133630
	ldr r1, [r4]
	ldr r0, _08132450 @ =gUnknown_8463168
	str r0, [r1, 0xC]
	movs r0, 0x3
	b _08132468
	.align 2, 0
_0813244C: .4byte gUnknown_203B118
_08132450: .4byte gUnknown_8463168
_08132454:
	ldr r4, _0813254C @ =gUnknown_203B118
	ldr r0, [r4]
	adds r0, 0x7
	movs r1, 0x1
	bl sub_8133630
	ldr r1, [r4]
	ldr r0, _08132550 @ =gUnknown_846316B
	str r0, [r1, 0xC]
	movs r0, 0x2
_08132468:
	strb r0, [r1, 0x10]
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0813254C @ =gUnknown_203B118
	ldr r1, [r6]
	ldrb r2, [r1, 0x7]
	movs r5, 0
	str r5, [sp]
	str r0, [sp, 0x4]
	ldrb r0, [r1, 0x10]
	str r0, [sp, 0x8]
	ldr r0, _08132554 @ =gUnknown_8463150
	str r0, [sp, 0xC]
	ldr r0, [r1, 0xC]
	str r0, [sp, 0x10]
	adds r0, r2, 0
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0x2
	bl AddItemMenuActionTextPrinters
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r6]
	ldrb r2, [r1, 0x7]
	str r0, [sp]
	ldrb r0, [r1, 0x10]
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r2, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl ProgramAndPlaceMenuCursorOnWindow
	movs r0, 0x80
	lsls r0, 1
	bl Alloc
	adds r4, r0, 0
	ldr r6, _08132558 @ =gSpecialVar_ItemId
	ldrh r1, [r6]
	bl sub_8131D48
	ldr r1, _0813255C @ =gUnknown_8416301
	adds r0, r4, 0
	bl StringAppend
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	str r5, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x2
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl sub_81332EC
	adds r0, r4, 0
	bl Free
	ldrh r0, [r6]
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	beq _08132528
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x2
	bl sub_81335B0
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
_08132528:
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _08132560 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08132564 @ =sub_8132568
	str r0, [r1]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813254C: .4byte gUnknown_203B118
_08132550: .4byte gUnknown_846316B
_08132554: .4byte gUnknown_8463150
_08132558: .4byte gSpecialVar_ItemId
_0813255C: .4byte gUnknown_8416301
_08132560: .4byte gTasks
_08132564: .4byte sub_8132568
	thumb_func_end sub_8132414

	thumb_func_start sub_8132568
sub_8132568: @ 8132568
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl sub_80BF72C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081325E0
	bl ProcessMenuInputNoWrapAround
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _081325E0
	adds r0, 0x1
	cmp r4, r0
	bne _081325C0
	movs r0, 0x5
	bl PlaySE
	ldr r2, _081325B8 @ =gUnknown_8463150
	ldr r0, _081325BC @ =gUnknown_203B118
	ldr r1, [r0]
	ldrb r0, [r1, 0x10]
	ldr r1, [r1, 0xC]
	adds r0, r1
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r2, 0x4
	adds r0, r2
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _081325E0
	.align 2, 0
_081325B8: .4byte gUnknown_8463150
_081325BC: .4byte gUnknown_203B118
_081325C0:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _081325E8 @ =gUnknown_8463150
	ldr r0, _081325EC @ =gUnknown_203B118
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl _call_via_r1
_081325E0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081325E8: .4byte gUnknown_8463150
_081325EC: .4byte gUnknown_203B118
	thumb_func_end sub_8132568

	thumb_func_start sub_81325F0
sub_81325F0: @ 81325F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _08132634 @ =gUnknown_203B118
	ldr r0, [r5]
	adds r0, 0x7
	bl sub_8133664
	movs r0, 0x2
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x2
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _08132638
	adds r0, r4, 0
	bl sub_81326F8
	b _0813264A
	.align 2, 0
_08132634: .4byte gUnknown_203B118
_08132638:
	ldr r1, _08132650 @ =gUnknown_3005E98
	ldr r0, _08132654 @ =sub_8125B40
	str r0, [r1]
	ldr r1, [r5]
	ldr r0, _08132658 @ =sub_8124C8C
	str r0, [r1]
	adds r0, r4, 0
	bl sub_8132230
_0813264A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132650: .4byte gUnknown_3005E98
_08132654: .4byte sub_8125B40
_08132658: .4byte sub_8124C8C
	thumb_func_end sub_81325F0

	thumb_func_start sub_813265C
sub_813265C: @ 813265C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081326D0 @ =gTasks+0x8
	adds r0, r1
	ldrh r1, [r0, 0x2]
	movs r0, 0x4
	bl sub_809A798
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r6, _081326D4 @ =gUnknown_203B118
	ldr r0, [r6]
	adds r0, 0x7
	bl sub_8133664
	movs r0, 0x2
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x2
	bl ClearWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r4, 0
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _081326EC
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _081326D8
	adds r0, r5, 0
	bl sub_81326F8
	b _081326F2
	.align 2, 0
_081326D0: .4byte gTasks+0x8
_081326D4: .4byte gUnknown_203B118
_081326D8:
	ldr r1, [r6]
	ldr r0, _081326E8 @ =sub_8126EDC
	str r0, [r1]
	adds r0, r5, 0
	bl sub_8132230
	b _081326F2
	.align 2, 0
_081326E8: .4byte sub_8126EDC
_081326EC:
	adds r0, r5, 0
	bl sub_8132714
_081326F2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813265C

	thumb_func_start sub_81326F8
sub_81326F8: @ 81326F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813270C @ =gUnknown_841632A
	ldr r3, _08132710 @ =sub_8132758
	movs r1, 0x2
	bl sub_813337C
	pop {r0}
	bx r0
	.align 2, 0
_0813270C: .4byte gUnknown_841632A
_08132710: .4byte sub_8132758
	thumb_func_end sub_81326F8

	thumb_func_start sub_8132714
sub_8132714: @ 8132714
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08132744 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldr r1, _08132748 @ =gStringVar1
	bl CopyItemName
	ldr r5, _0813274C @ =gStringVar4
	ldr r1, _08132750 @ =gUnknown_841635E
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r3, _08132754 @ =sub_8132758
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl sub_813337C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132744: .4byte gSpecialVar_ItemId
_08132748: .4byte gStringVar1
_0813274C: .4byte gStringVar4
_08132750: .4byte gUnknown_841635E
_08132754: .4byte sub_8132758
	thumb_func_end sub_8132714

	thumb_func_start sub_8132758
sub_8132758: @ 8132758
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813277C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08132776
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_8132780
_08132776:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813277C: .4byte gMain
	thumb_func_end sub_8132758

	thumb_func_start sub_8132780
sub_8132780: @ 8132780
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	ldr r0, _081327F0 @ =gTasks+0x8
	adds r5, r0
	ldrb r0, [r5]
	ldr r4, _081327F4 @ =gUnknown_203B10C + 10
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl sub_810713C
	ldr r0, _081327F8 @ =gUnknown_3005E70
	subs r4, 0xA
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0x8]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r1, 0x1
	bl sub_8131F90
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
	movs r0, 0x6
	bl ClearWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r6, 0
	bl sub_81323E4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081327F0: .4byte gTasks+0x8
_081327F4: .4byte gUnknown_203B10C + 10
_081327F8: .4byte gUnknown_3005E70
	thumb_func_end sub_8132780

	thumb_func_start sub_81327FC
sub_81327FC: @ 81327FC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08132860 @ =gTasks+0x8
	adds r4, r0
	ldr r0, _08132864 @ =gUnknown_203B118
	ldr r0, [r0]
	adds r0, 0x7
	bl sub_8133664
	movs r0, 0x2
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x2
	bl ClearWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8131F90
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	adds r0, r5, 0
	bl sub_81323E4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132860: .4byte gTasks+0x8
_08132864: .4byte gUnknown_203B118
	thumb_func_end sub_81327FC

	thumb_func_start sub_8132868
sub_8132868: @ 8132868
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _081328A0 @ =gTasks+0x8
	adds r0, r1
	ldrh r1, [r0, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _081328AC
	ldr r0, _081328A4 @ =gUnknown_203B118
	ldr r1, [r0]
	ldr r0, _081328A8 @ =c2_8123744
	str r0, [r1]
	adds r0, r4, 0
	bl sub_8132230
	b _081328B2
	.align 2, 0
_081328A0: .4byte gTasks+0x8
_081328A4: .4byte gUnknown_203B118
_081328A8: .4byte c2_8123744
_081328AC:
	adds r0, r4, 0
	bl sub_8132714
_081328B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8132868

	thumb_func_start sub_81328B8
sub_81328B8: @ 81328B8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _081328F0 @ =gTasks+0x8
	adds r0, r1
	ldrh r1, [r0, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _081328FC
	ldr r0, _081328F4 @ =gUnknown_203B118
	ldr r1, [r0]
	ldr r0, _081328F8 @ =sub_808CE60
	str r0, [r1]
	adds r0, r4, 0
	bl sub_8132230
	b _08132902
	.align 2, 0
_081328F0: .4byte gTasks+0x8
_081328F4: .4byte gUnknown_203B118
_081328F8: .4byte sub_808CE60
_081328FC:
	adds r0, r4, 0
	bl sub_8132714
_08132902:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81328B8

	thumb_func_start sub_8132908
sub_8132908: @ 8132908
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08132950 @ =gTasks+0x8
	adds r4, r0, r1
	ldr r6, _08132954 @ =gSpecialVar_ItemId
	ldrh r0, [r6]
	bl itemid_get_market_price
	lsls r0, 16
	cmp r0, 0
	bne _08132968
	ldrh r0, [r6]
	ldr r1, _08132958 @ =gStringVar1
	bl CopyItemName
	ldr r4, _0813295C @ =gStringVar4
	ldr r1, _08132960 @ =gUnknown_84168F1
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08132964 @ =sub_8132780
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_813337C
	b _081329AE
	.align 2, 0
_08132950: .4byte gTasks+0x8
_08132954: .4byte gSpecialVar_ItemId
_08132958: .4byte gStringVar1
_0813295C: .4byte gStringVar4
_08132960: .4byte gUnknown_84168F1
_08132964: .4byte sub_8132780
_08132968:
	movs r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _08132980
	bl sub_81335E0
	adds r0, r5, 0
	bl sub_81329C4
	b _081329AE
_08132980:
	cmp r0, 0x63
	ble _08132988
	movs r0, 0x63
	strh r0, [r4, 0x4]
_08132988:
	ldrh r0, [r6]
	ldr r1, _081329B4 @ =gStringVar1
	bl CopyItemName
	ldr r4, _081329B8 @ =gStringVar4
	ldr r1, _081329BC @ =gUnknown_8416911
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _081329C0 @ =sub_8132AAC
	adds r0, r7, 0
	adds r2, r4, 0
	bl sub_813337C
_081329AE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081329B4: .4byte gStringVar1
_081329B8: .4byte gStringVar4
_081329BC: .4byte gUnknown_8416911
_081329C0: .4byte sub_8132AAC
	thumb_func_end sub_8132908

	thumb_func_start sub_81329C4
sub_81329C4: @ 81329C4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08132A20 @ =gTasks+0x8
	adds r4, r0
	ldr r6, _08132A24 @ =gStringVar3
	ldrh r1, [r4, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	muls r1, r0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _08132A28 @ =gStringVar4
	ldr r1, _08132A2C @ =gUnknown_8416936
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80BF8E4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08132A30 @ =sub_8132A34
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_813337C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132A20: .4byte gTasks+0x8
_08132A24: .4byte gStringVar3
_08132A28: .4byte gStringVar4
_08132A2C: .4byte gUnknown_8416936
_08132A30: .4byte sub_8132A34
	thumb_func_end sub_81329C4

	thumb_func_start sub_8132A34
sub_8132A34: @ 8132A34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08132A44 @ =gUnknown_8463170
	bl sub_8133604
	pop {r0}
	bx r0
	.align 2, 0
_08132A44: .4byte gUnknown_8463170
	thumb_func_end sub_8132A34

	thumb_func_start sub_8132A48
sub_8132A48: @ 8132A48
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08132AA8 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0x8
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
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
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8131F90
	adds r0, r5, 0
	bl sub_81323E4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132AA8: .4byte gTasks+0x8
	thumb_func_end sub_8132A48

	thumb_func_start sub_8132AAC
sub_8132AAC: @ 8132AAC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r6, _08132B48 @ =gTasks+0x8
	adds r0, r4, r6
	mov r8, r0
	movs r0, 0x7
	bl sub_8133354
	ldr r0, _08132B4C @ =gStringVar1
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r5, _08132B50 @ =gStringVar4
	ldr r1, _08132B54 @ =gUnknown_84162B9
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r0, 0x7
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0x4
	bl sub_81332EC
	mov r2, r8
	ldrh r1, [r2, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r3, r8
	movs r2, 0x10
	ldrsh r1, [r3, r2]
	muls r1, r0
	movs r0, 0x1
	bl sub_8132B5C
	bl sub_81335E0
	bl sub_8132054
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	subs r6, 0x8
	adds r4, r6
	ldr r0, _08132B58 @ =sub_8132BC8
	str r0, [r4]
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132B48: .4byte gTasks+0x8
_08132B4C: .4byte gStringVar1
_08132B50: .4byte gStringVar4
_08132B54: .4byte gUnknown_84162B9
_08132B58: .4byte sub_8132BC8
	thumb_func_end sub_8132AAC

	thumb_func_start sub_8132B5C
sub_8132B5C: @ 8132B5C
	push {r4-r6,lr}
	sub sp, 0x14
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x7
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, _08132BBC @ =gStringVar1
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r5, _08132BC0 @ =gStringVar4
	ldr r1, _08132BC4 @ =gUnknown_84162B9
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x7
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0x4
	bl sub_81332EC
	str r4, [sp]
	movs r0, 0x7
	movs r1, 0x38
	movs r2, 0xA
	adds r3, r6, 0
	bl PrintMoneyAmount
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132BBC: .4byte gStringVar1
_08132BC0: .4byte gStringVar4
_08132BC4: .4byte gUnknown_84162B9
	thumb_func_end sub_8132B5C

	thumb_func_start sub_8132BC8
sub_8132BC8: @ 8132BC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08132C14 @ =gTasks+0x8
	adds r5, r0, r1
	adds r0, r5, 0
	adds r0, 0x10
	ldrh r1, [r5, 0x4]
	bl sub_80BF848
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08132C18
	movs r0, 0x10
	ldrsh r4, [r5, r0]
	ldrh r1, [r5, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	muls r1, r0
	adds r0, r4, 0
	bl sub_8132B5C
	b _08132CA6
	.align 2, 0
_08132C14: .4byte gTasks+0x8
_08132C18:
	ldr r0, _08132C4C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08132C50
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x7
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_813208C
	adds r0, r4, 0
	bl sub_81329C4
	b _08132CA6
	.align 2, 0
_08132C4C: .4byte gMain
_08132C50:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08132CA6
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x7
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x8
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	bl sub_813208C
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8131F90
	adds r0, r6, 0
	bl sub_81323E4
_08132CA6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8132BC8

	thumb_func_start sub_8132CAC
sub_8132CAC: @ 8132CAC
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08132D18 @ =gTasks+0x8
	adds r4, r0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _08132D1C @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	ldr r1, _08132D20 @ =gStringVar1
	bl CopyItemName
	ldr r6, _08132D24 @ =gStringVar3
	ldrh r1, [r4, 0x2]
	movs r0, 0x4
	bl sub_809A798
	lsls r0, 16
	lsrs r0, 16
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	muls r1, r0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _08132D28 @ =gStringVar4
	ldr r1, _08132D2C @ =gUnknown_8416959
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r3, _08132D30 @ =sub_8132D34
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_813337C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132D18: .4byte gTasks+0x8
_08132D1C: .4byte gSpecialVar_ItemId
_08132D20: .4byte gStringVar1
_08132D24: .4byte gStringVar3
_08132D28: .4byte gStringVar4
_08132D2C: .4byte gUnknown_8416959
_08132D30: .4byte sub_8132D34
	thumb_func_end sub_8132CAC

	thumb_func_start sub_8132D34
sub_8132D34: @ 8132D34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r6, r0, 2
	adds r6, r0
	lsls r6, 3
	ldr r0, _08132DF4 @ =gTasks+0x8
	mov r9, r0
	adds r1, r6, 0
	add r1, r9
	mov r8, r1
	movs r0, 0xF8
	bl PlaySE
	ldr r5, _08132DF8 @ =gSpecialVar_ItemId
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	bl RemoveBagItem
	ldr r7, _08132DFC @ =gSaveBlock1Ptr
	ldr r4, [r7]
	movs r3, 0xA4
	lsls r3, 2
	mov r10, r3
	add r4, r10
	ldrh r0, [r5]
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 17
	mov r2, r8
	movs r3, 0x10
	ldrsh r1, [r2, r3]
	muls r1, r0
	adds r0, r4, 0
	bl AddMoney
	ldrh r0, [r5]
	mov r2, r8
	ldrh r1, [r2, 0x10]
	movs r2, 0x2
	bl sub_809C09C
	mov r3, r8
	ldrb r0, [r3]
	ldr r4, _08132E00 @ =gUnknown_203B10C + 10
	subs r2, r4, 0x2
	adds r1, r4, 0
	bl sub_810713C
	bl sub_81320BC
	bl sub_8132120
	bl sub_8131C50
	ldr r0, _08132E04 @ =gUnknown_3005E70
	subs r4, 0xA
	ldrh r1, [r4, 0xA]
	ldrh r2, [r4, 0x8]
	bl ListMenuInit
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1]
	movs r1, 0x2
	bl sub_8131F90
	ldr r0, [r7]
	add r0, r10
	bl GetMoney
	adds r1, r0, 0
	movs r0, 0x8
	movs r2, 0
	bl PrintMoneyAmountInMoneyBox
	movs r2, 0x8
	negs r2, r2
	add r9, r2
	add r6, r9
	ldr r0, _08132E08 @ =sub_8132E0C
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08132DF4: .4byte gTasks+0x8
_08132DF8: .4byte gSpecialVar_ItemId
_08132DFC: .4byte gSaveBlock1Ptr
_08132E00: .4byte gUnknown_203B10C + 10
_08132E04: .4byte gUnknown_3005E70
_08132E08: .4byte sub_8132E0C
	thumb_func_end sub_8132D34

	thumb_func_start sub_8132E0C
sub_8132E0C: @ 8132E0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08132E60 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08132E26
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08132E5A
_08132E26:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x8
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x3
	bl PutWindowTilemap
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x5
	bl PutWindowTilemap
	adds r0, r4, 0
	bl sub_8132780
_08132E5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132E60: .4byte gMain
	thumb_func_end sub_8132E0C

	thumb_func_start sub_8132E64
sub_8132E64: @ 8132E64
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r4, _08132EFC @ =gUnknown_203B11C
	movs r0, 0xB2
	lsls r0, 1
	bl AllocZeroed
	str r0, [r4]
	ldr r5, _08132F00 @ =gSaveBlock1Ptr
	ldr r1, [r5]
	ldr r2, _08132F04 @ =0x00000464
	mov r8, r2
	add r1, r8
	movs r2, 0xE8
	bl memcpy
	ldr r0, [r4]
	adds r0, 0xE8
	ldr r1, [r5]
	movs r6, 0xEE
	lsls r6, 2
	adds r1, r6
	movs r2, 0x78
	bl memcpy
	ldr r3, [r4]
	ldr r2, _08132F08 @ =gUnknown_203B10C
	ldrh r1, [r2, 0x8]
	movs r4, 0xB0
	lsls r4, 1
	adds r0, r3, r4
	strh r1, [r0]
	ldrh r0, [r2, 0xA]
	movs r2, 0xB1
	lsls r2, 1
	adds r1, r3, r2
	strh r0, [r1]
	ldr r0, [r5]
	add r0, r8
	movs r1, 0x3A
	bl ClearItemSlots
	ldr r0, [r5]
	adds r0, r6
	movs r1, 0x1E
	bl ClearItemSlots
	bl sub_81320AC
	ldr r0, _08132F0C @ =0x00000121
	movs r1, 0x1
	bl AddBagItem
	ldr r0, _08132F10 @ =0x00000123
	movs r1, 0x1
	bl AddBagItem
	ldr r0, _08132F14 @ =0x00000129
	movs r1, 0x1
	bl AddBagItem
	ldr r0, _08132F18 @ =0x00000143
	movs r1, 0x1
	bl AddBagItem
	ldr r1, _08132F1C @ =sub_815ABFC
	movs r0, 0x4
	movs r2, 0
	bl sub_81317F8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132EFC: .4byte gUnknown_203B11C
_08132F00: .4byte gSaveBlock1Ptr
_08132F04: .4byte 0x00000464
_08132F08: .4byte gUnknown_203B10C
_08132F0C: .4byte 0x00000121
_08132F10: .4byte 0x00000123
_08132F14: .4byte 0x00000129
_08132F18: .4byte 0x00000143
_08132F1C: .4byte sub_815ABFC
	thumb_func_end sub_8132E64

	thumb_func_start sub_8132F20
sub_8132F20: @ 8132F20
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r3, r1, 3
	ldr r4, _08132F54 @ =gTasks+0x8
	adds r2, r3, r4
	ldr r0, _08132F58 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08132F4E
	strh r0, [r2, 0x10]
	strh r0, [r2, 0x12]
	adds r0, r4, 0
	subs r0, 0x8
	adds r0, r3, r0
	ldr r1, _08132F5C @ =sub_8132F60
	str r1, [r0]
_08132F4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132F54: .4byte gTasks+0x8
_08132F58: .4byte gPaletteFade
_08132F5C: .4byte sub_8132F60
	thumb_func_end sub_8132F20

	thumb_func_start sub_8132F60
sub_8132F60: @ 8132F60
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08132FA4 @ =gTasks+0x8
	adds r6, r0, r1
	ldr r0, _08132FA8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08132F8E
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	cmp r0, 0x14
	bgt _08132F8E
	movs r0, 0x15
	strh r0, [r6, 0x10]
	bl sub_815AC20
_08132F8E:
	movs r3, 0x10
	ldrsh r0, [r6, r3]
	cmp r0, 0x15
	bls _08132F98
	b _08133210
_08132F98:
	lsls r0, 2
	ldr r1, _08132FAC @ =_08132FB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08132FA4: .4byte gTasks+0x8
_08132FA8: .4byte gMain
_08132FAC: .4byte _08132FB0
	.align 2, 0
_08132FB0:
	.4byte _08133008
	.4byte _08133024
	.4byte _08133050
	.4byte _08133050
	.4byte _08133050
	.4byte _08133080
	.4byte _08133080
	.4byte _08133080
	.4byte _081330B0
	.4byte _081330E0
	.4byte _081330F4
	.4byte _08133024
	.4byte _08133050
	.4byte _08133050
	.4byte _08133050
	.4byte _08133080
	.4byte _08133080
	.4byte _08133080
	.4byte _0813312C
	.4byte _081330E0
	.4byte _0813315C
	.4byte _08133170
_08133008:
	ldr r0, _08133020 @ =0xffff8405
	movs r1, 0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x6
	bl BeginNormalPaletteFade
	movs r0, 0x1
	bl sub_8131F64
	b _081331EA
	.align 2, 0
_08133020: .4byte 0xffff8405
_08133024:
	ldr r0, _0813304C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08133036
	b _08133232
_08133036:
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bgt _08133046
	b _08133232
_08133046:
	strh r1, [r6, 0x12]
	b _081331EA
	.align 2, 0
_0813304C: .4byte gPaletteFade
_08133050:
	movs r0, 0x12
	ldrsh r1, [r6, r0]
	cmp r1, 0
	bne _08133066
	ldr r0, _0813307C @ =gMain
	strh r1, [r0, 0x2E]
	movs r1, 0x80
	strh r1, [r0, 0x30]
	ldrb r0, [r6]
	bl ListMenuHandleInput
_08133066:
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bgt _08133076
	b _08133232
_08133076:
	movs r0, 0
	strh r0, [r6, 0x12]
	b _081331EA
	.align 2, 0
_0813307C: .4byte gMain
_08133080:
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	cmp r1, 0
	bne _08133096
	ldr r0, _081330AC @ =gMain
	strh r1, [r0, 0x2E]
	movs r1, 0x40
	strh r1, [r0, 0x30]
	ldrb r0, [r6]
	bl ListMenuHandleInput
_08133096:
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bgt _081330A6
	b _08133232
_081330A6:
	movs r0, 0
	strh r0, [r6, 0x12]
	b _081331EA
	.align 2, 0
_081330AC: .4byte gMain
_081330B0:
	movs r0, 0x1
	bl sub_8131F64
	ldr r2, _081330D4 @ =gUnknown_841C587
	adds r0, r4, 0
	movs r1, 0x4
	movs r3, 0
	bl sub_813337C
	ldr r1, _081330D8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081330DC @ =sub_8132F60
	str r1, [r0]
	b _081331EA
	.align 2, 0
_081330D4: .4byte gUnknown_841C587
_081330D8: .4byte gTasks
_081330DC: .4byte sub_8132F60
_081330E0:
	bl RunTextPrinters
	movs r0, 0x6
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	beq _081330F2
	b _08133232
_081330F2:
	b _081331EA
_081330F4:
	ldr r0, _08133128 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08133102
	b _08133232
_08133102:
	movs r0, 0
	bl sub_8131F64
	movs r0, 0x80
	lsls r0, 3
	movs r1, 0
	str r1, [sp]
	movs r2, 0x6
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x6
	movs r1, 0
	bl sub_810F260
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	b _081331EA
	.align 2, 0
_08133128: .4byte gMain
_0813312C:
	movs r0, 0x1
	bl sub_8131F64
	ldr r2, _08133150 @ =gUnknown_841C693
	adds r0, r4, 0
	movs r1, 0x4
	movs r3, 0
	bl sub_813337C
	ldr r1, _08133154 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08133158 @ =sub_8132F60
	str r1, [r0]
	b _081331EA
	.align 2, 0
_08133150: .4byte gUnknown_841C693
_08133154: .4byte gTasks
_08133158: .4byte sub_8132F60
_0813315C:
	ldr r0, _0813316C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08133232
	b _081331EA
	.align 2, 0
_0813316C: .4byte gMain
_08133170:
	ldr r0, _081331F4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _08133232
	ldr r5, _081331F8 @ =gSaveBlock1Ptr
	ldr r0, [r5]
	ldr r1, _081331FC @ =0x00000464
	adds r0, r1
	ldr r4, _08133200 @ =gUnknown_203B11C
	ldr r1, [r4]
	movs r2, 0xE8
	bl memcpy
	ldr r0, [r5]
	movs r3, 0xEE
	lsls r3, 2
	adds r0, r3
	ldr r1, [r4]
	adds r1, 0xE8
	movs r2, 0x78
	bl memcpy
	ldrb r0, [r6]
	movs r1, 0
	movs r2, 0
	bl sub_810713C
	ldr r2, _08133204 @ =gUnknown_203B10C
	ldr r0, [r4]
	movs r3, 0xB0
	lsls r3, 1
	adds r1, r0, r3
	ldrh r1, [r1]
	strh r1, [r2, 0x8]
	adds r3, 0x2
	adds r1, r0, r3
	ldrh r1, [r1]
	strh r1, [r2, 0xA]
	bl Free
	ldr r0, _08133208 @ =gPlttBufferFaded
	ldr r1, _0813320C @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 1
	bl CpuFastSet
	bl sub_8108CF0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	str r7, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_081331EA:
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
	b _08133232
	.align 2, 0
_081331F4: .4byte gPaletteFade
_081331F8: .4byte gSaveBlock1Ptr
_081331FC: .4byte 0x00000464
_08133200: .4byte gUnknown_203B11C
_08133204: .4byte gUnknown_203B10C
_08133208: .4byte gPlttBufferFaded
_0813320C: .4byte gPlttBufferUnfaded
_08133210:
	ldr r0, _0813323C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08133232
	ldr r0, _08133240 @ =gUnknown_203B10C
	ldr r0, [r0]
	bl SetMainCallback2
	bl sub_813208C
	bl sub_81321D4
	adds r0, r4, 0
	bl DestroyTask
_08133232:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813323C: .4byte gPaletteFade
_08133240: .4byte gUnknown_203B10C
	thumb_func_end sub_8132F60

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
