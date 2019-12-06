	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start CB2_OpenPokedexFromStartMenu
CB2_OpenPokedexFromStartMenu: @ 810275C
	push {lr}
	bl sub_810250C
	movs r1, 0xC0
	lsls r1, 7
	movs r0, 0
	bl ClearGpuRegBits
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r0, _08102794 @ =sub_81024D4
	bl SetMainCallback2
	movs r0, 0x4
	bl HelpSystem_SetSomeVariable2
	pop {r0}
	bx r0
	.align 2, 0
_08102794: .4byte sub_81024D4
	thumb_func_end CB2_OpenPokedexFromStartMenu

	thumb_func_start sub_8102798
sub_8102798: @ 8102798
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081027B4 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r4, r0, r1
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _081027D8
	cmp r1, 0x1
	bgt _081027B8
	cmp r1, 0
	beq _081027BE
	b _0810284A
	.align 2, 0
_081027B4: .4byte gMain
_081027B8:
	cmp r1, 0x2
	beq _081027F2
	b _0810284A
_081027BE:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrb r0, [r4]
	adds r0, 0x1
_081027D2:
	strb r0, [r4]
_081027D4:
	movs r0, 0
	b _0810284C
_081027D8:
	ldr r0, _081027E8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081027EC
	movs r0, 0x2
	b _081027D2
	.align 2, 0
_081027E8: .4byte gPaletteFade
_081027EC:
	bl UpdatePaletteFade
	b _081027D4
_081027F2:
	ldr r4, _08102854 @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldr r0, [r0, 0x44]
	cmp r0, 0
	beq _08102800
	bl Free
_08102800:
	ldr r0, [r4]
	cmp r0, 0
	beq _0810280A
	bl Free
_0810280A:
	bl FreeAllWindowBuffers
	movs r0, 0
	bl GetBgTilemapBuffer
	cmp r0, 0
	beq _0810281C
	bl Free
_0810281C:
	movs r0, 0x1
	bl GetBgTilemapBuffer
	cmp r0, 0
	beq _0810282A
	bl Free
_0810282A:
	movs r0, 0x2
	bl GetBgTilemapBuffer
	cmp r0, 0
	beq _08102838
	bl Free
_08102838:
	movs r0, 0x3
	bl GetBgTilemapBuffer
	cmp r0, 0
	beq _08102846
	bl Free
_08102846:
	bl sub_807249C
_0810284A:
	movs r0, 0x1
_0810284C:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08102854: .4byte gUnknown_203ACF0
	thumb_func_end sub_8102798

	thumb_func_start sub_8102858
sub_8102858: @ 8102858
	push {lr}
	bl sub_8102798
	lsls r0, 24
	cmp r0, 0
	beq _08102874
	movs r1, 0xC0
	lsls r1, 7
	movs r0, 0
	bl SetGpuRegBits
	ldr r0, _08102878 @ =CB2_ReturnToFieldWithOpenMenu
	bl SetMainCallback2
_08102874:
	pop {r0}
	bx r0
	.align 2, 0
_08102878: .4byte CB2_ReturnToFieldWithOpenMenu
	thumb_func_end sub_8102858

	thumb_func_start sub_810287C
sub_810287C: @ 810287C
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0810289C @ =gUnknown_203ACF0
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x9
	bls _08102892
	b _08102C18
_08102892:
	lsls r0, 2
	ldr r1, _081028A0 @ =_081028A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810289C: .4byte gUnknown_203ACF0
_081028A0: .4byte _081028A4
	.align 2, 0
_081028A4:
	.4byte _081028CC
	.4byte _081028FC
	.4byte _08102930
	.4byte _08102940
	.4byte _08102964
	.4byte _081029D0
	.4byte _08102A14
	.4byte _08102B24
	.4byte _08102B94
	.4byte _08102BD8
_081028CC:
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x8]
	movs r4, 0
_081028D4:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_81068A0
	ldr r1, _081028F8 @ =gUnknown_203ACF0
	ldr r2, [r1]
	lsls r0, 24
	lsrs r0, 24
	lsls r0, r4
	ldr r1, [r2, 0x8]
	orrs r1, r0
	str r1, [r2, 0x8]
	adds r4, 0x1
	cmp r4, 0x8
	ble _081028D4
	movs r0, 0x2
	strb r0, [r2, 0x1]
	b _08102C18
	.align 2, 0
_081028F8: .4byte gUnknown_203ACF0
_081028FC:
	ldr r0, [r4]
	adds r0, 0x60
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	adds r0, 0x14
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x15
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x16
	bl sub_81047B0
	ldr r0, _0810292C @ =sub_8102858
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
	b _08102C18
	.align 2, 0
_0810292C: .4byte sub_8102858
_08102930:
	bl sub_8102C28
	ldr r0, _0810293C @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x3
	b _08102C16
	.align 2, 0
_0810293C: .4byte gUnknown_203ACF0
_08102940:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08102960 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x4
	b _08102C16
	.align 2, 0
_08102960: .4byte gUnknown_203ACF0
_08102964:
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0
	bl ShowBg
	ldr r2, _081029A4 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081029AC
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0x1
	negs r0, r0
	ldr r1, _081029A8 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	b _081029BC
	.align 2, 0
_081029A4: .4byte gPaletteFade
_081029A8: .4byte 0x0000ffff
_081029AC:
	ldr r0, _081029C4 @ =0xffff7fff
	ldr r1, _081029C8 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_081029BC:
	ldr r0, _081029CC @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x5
	b _08102C16
	.align 2, 0
_081029C4: .4byte 0xffff7fff
_081029C8: .4byte 0x0000ffff
_081029CC: .4byte gUnknown_203ACF0
_081029D0:
	ldr r4, _081029EC @ =gUnknown_203ACF0
	ldr r1, [r4]
	ldrb r0, [r1, 0x17]
	adds r1, 0x62
	movs r2, 0
	bl ListMenuGetScrollAndRow
	bl IsNationalPokedexEnabled
	cmp r0, 0
	beq _081029F4
	ldr r0, _081029F0 @ =gUnknown_84520E4
	b _081029F6
	.align 2, 0
_081029EC: .4byte gUnknown_203ACF0
_081029F0: .4byte gUnknown_84520E4
_081029F4:
	ldr r0, _08102A0C @ =gUnknown_84520D4
_081029F6:
	ldr r1, [r4]
	adds r1, 0x62
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	adds r1, 0x60
	strb r0, [r1]
	ldr r0, _08102A10 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x6
	b _08102C16
	.align 2, 0
_08102A0C: .4byte gUnknown_84520D4
_08102A10: .4byte gUnknown_203ACF0
_08102A14:
	ldr r0, [r4]
	ldrb r0, [r0, 0x17]
	bl ListMenu_ProcessInput
	ldr r1, [r4]
	str r0, [r1, 0xC]
	ldrb r0, [r1, 0x17]
	adds r1, 0x62
	movs r2, 0
	bl ListMenuGetScrollAndRow
	ldr r0, _08102A4C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r3, 0x1
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08102B14
	ldr r2, [r4]
	ldr r1, [r2, 0xC]
	cmp r1, 0xD
	bhi _08102A50
	cmp r1, 0xA
	bcs _08102ADC
	cmp r1, 0x8
	bls _08102A62
	b _08102AA4
	.align 2, 0
_08102A4C: .4byte gMain
_08102A50:
	cmp r1, 0xE
	beq _08102AA4
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08102A5E
	b _08102C18
_08102A5E:
	strb r3, [r2, 0x1]
	b _08102C18
_08102A62:
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_81068A0
	lsls r0, 24
	cmp r0, 0
	bne _08102A72
	b _08102C18
_08102A72:
	ldr r0, [r4]
	adds r0, 0x60
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r1, [r0, 0xC]
	adds r0, 0x28
	strb r1, [r0]
	ldr r0, _08102A9C @ =0xffff7fff
	ldr r1, _08102AA0 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	movs r0, 0x7
	b _08102C16
	.align 2, 0
_08102A9C: .4byte 0xffff7fff
_08102AA0: .4byte 0x0000ffff
_08102AA4:
	ldr r4, _08102AD0 @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r0, 0x60
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r1, [r4]
	ldr r0, [r1, 0xC]
	subs r0, 0x9
	adds r1, 0x42
	strb r0, [r1]
	ldr r0, _08102AD4 @ =0xffff7fff
	ldr r1, _08102AD8 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	movs r0, 0x9
	b _08102C16
	.align 2, 0
_08102AD0: .4byte gUnknown_203ACF0
_08102AD4: .4byte 0xffff7fff
_08102AD8: .4byte 0x0000ffff
_08102ADC:
	adds r0, r2, 0
	adds r0, 0x60
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	ldr r1, [r0, 0xC]
	subs r1, 0x9
	adds r0, 0x42
	movs r2, 0
	strb r1, [r0]
	ldr r0, [r4]
	strh r2, [r0, 0x3A]
	strh r2, [r0, 0x38]
	ldr r0, _08102B0C @ =0xffff7fff
	ldr r1, _08102B10 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	movs r0, 0x8
	b _08102C16
	.align 2, 0
_08102B0C: .4byte 0xffff7fff
_08102B10: .4byte 0x0000ffff
_08102B14:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08102B1E
	b _08102C18
_08102B1E:
	ldr r0, [r4]
	strb r3, [r0, 0x1]
	b _08102C18
_08102B24:
	ldr r2, [r4]
	ldrb r0, [r2, 0x17]
	adds r1, r2, 0
	adds r1, 0x12
	adds r2, 0x10
	bl DestroyListMenuTask
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, [r4]
	adds r0, 0x14
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x15
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x16
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x2B
	movs r2, 0
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, 0x2D
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, 0x2F
	strb r2, [r0]
	ldr r1, _08102B8C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08102B90 @ =sub_8103AC8
	str r1, [r0]
	ldr r0, [r4]
	strb r2, [r0, 0x1]
	b _08102C18
	.align 2, 0
_08102B8C: .4byte gTasks
_08102B90: .4byte sub_8103AC8
_08102B94:
	ldr r2, [r4]
	ldrb r0, [r2, 0x17]
	adds r1, r2, 0
	adds r1, 0x12
	adds r2, 0x10
	bl DestroyListMenuTask
	movs r0, 0x1
	bl HideBg
	ldr r0, [r4]
	adds r0, 0x14
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x15
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x16
	bl sub_81047B0
	ldr r1, _08102BD0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08102BD4 @ =sub_8103238
	b _08102C10
	.align 2, 0
_08102BD0: .4byte gTasks
_08102BD4: .4byte sub_8103238
_08102BD8:
	ldr r2, [r4]
	ldrb r0, [r2, 0x17]
	adds r1, r2, 0
	adds r1, 0x12
	adds r2, 0x10
	bl DestroyListMenuTask
	movs r0, 0x1
	bl HideBg
	ldr r0, [r4]
	adds r0, 0x14
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x15
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x16
	bl sub_81047B0
	ldr r1, _08102C20 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08102C24 @ =sub_8102F80
_08102C10:
	str r1, [r0]
	ldr r1, [r4]
	movs r0, 0
_08102C16:
	strb r0, [r1, 0x1]
_08102C18:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102C20: .4byte gTasks
_08102C24: .4byte sub_8102F80
	thumb_func_end sub_810287C

	thumb_func_start sub_8102C28
sub_8102C28: @ 8102C28
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x24
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0
	mov r9, r0
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r6, 0x11
	str r6, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r0, _08102DA4 @ =gUnknown_8451F54
	bl AddWindow
	ldr r7, _08102DA8 @ =gUnknown_203ACF0
	ldr r1, [r7]
	strb r0, [r1, 0x14]
	ldr r0, _08102DAC @ =gUnknown_8451F5C
	bl AddWindow
	ldr r1, [r7]
	strb r0, [r1, 0x15]
	ldr r0, _08102DB0 @ =gUnknown_8451F64
	bl AddWindow
	ldr r1, [r7]
	strb r0, [r1, 0x16]
	bl IsNationalPokedexEnabled
	adds r5, r0, 0
	cmp r5, 0
	bne _08102C9E
	b _08102DC8
_08102C9E:
	add r1, sp, 0xC
	ldr r0, _08102DB4 @ =gUnknown_84520BC
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	add r2, sp, 0xC
	ldr r0, [r7]
	ldrb r1, [r0, 0x14]
	strb r1, [r2, 0x10]
	ldrh r1, [r0, 0x12]
	ldrh r2, [r0, 0x10]
	add r0, sp, 0xC
	bl ListMenuInit
	ldr r1, [r7]
	strb r0, [r1, 0x17]
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	ldr r2, _08102DB8 @ =gUnknown_8415DC4
	movs r5, 0x2
	str r5, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl sub_81047C8
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	ldr r2, _08102DBC @ =gUnknown_8415DD1
	mov r8, r2
	movs r4, 0xD
	str r4, [sp]
	mov r3, r9
	str r3, [sp, 0x4]
	movs r1, 0
	movs r3, 0x8
	bl sub_81047C8
	ldr r1, [r7]
	ldrb r0, [r1, 0x16]
	adds r1, 0x66
	ldrh r2, [r1]
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r3, 0x34
	bl sub_810491C
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	ldr r6, _08102DC0 @ =gUnknown_8415DD7
	movs r4, 0x18
	str r4, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	movs r1, 0
	adds r2, r6, 0
	movs r3, 0x8
	bl sub_81047C8
	ldr r1, [r7]
	ldrb r0, [r1, 0x16]
	adds r1, 0x6A
	ldrh r2, [r1]
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r3, 0x34
	bl sub_810491C
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	ldr r2, _08102DC4 @ =gUnknown_8415DCA
	movs r1, 0x25
	str r1, [sp]
	mov r3, r9
	str r3, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl sub_81047C8
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	movs r4, 0x30
	str r4, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	movs r1, 0
	mov r2, r8
	movs r3, 0x8
	bl sub_81047C8
	ldr r1, [r7]
	ldrb r0, [r1, 0x16]
	adds r1, 0x68
	ldrh r2, [r1]
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r3, 0x34
	bl sub_810491C
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	movs r4, 0x3B
	str r4, [sp]
	mov r2, r9
	str r2, [sp, 0x4]
	movs r1, 0
	adds r2, r6, 0
	movs r3, 0x8
	bl sub_81047C8
	ldr r1, [r7]
	ldrb r0, [r1, 0x16]
	adds r1, 0x6C
	ldrh r2, [r1]
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r3, 0x34
	bl sub_810491C
	b _08102E4A
	.align 2, 0
_08102DA4: .4byte gUnknown_8451F54
_08102DA8: .4byte gUnknown_203ACF0
_08102DAC: .4byte gUnknown_8451F5C
_08102DB0: .4byte gUnknown_8451F64
_08102DB4: .4byte gUnknown_84520BC
_08102DB8: .4byte gUnknown_8415DC4
_08102DBC: .4byte gUnknown_8415DD1
_08102DC0: .4byte gUnknown_8415DD7
_08102DC4: .4byte gUnknown_8415DCA
_08102DC8:
	add r1, sp, 0xC
	ldr r0, _08102EA8 @ =gUnknown_8452004
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	add r2, sp, 0xC
	ldr r0, [r7]
	ldrb r1, [r0, 0x14]
	strb r1, [r2, 0x10]
	ldrh r1, [r0, 0x12]
	ldrh r2, [r0, 0x10]
	add r0, sp, 0xC
	bl ListMenuInit
	ldr r1, [r7]
	strb r0, [r1, 0x17]
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	ldr r2, _08102EAC @ =gUnknown_8415DC4
	movs r1, 0x9
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1
	movs r3, 0
	bl sub_81047C8
	ldr r1, [r7]
	ldrb r0, [r1, 0x16]
	adds r1, 0x66
	ldrh r2, [r1]
	movs r1, 0x15
	str r1, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r1, 0x1
	movs r3, 0x20
	bl sub_810491C
	ldr r0, [r7]
	ldrb r0, [r0, 0x16]
	ldr r2, _08102EB0 @ =gUnknown_8415DCA
	movs r1, 0x25
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1
	movs r3, 0
	bl sub_81047C8
	ldr r1, [r7]
	ldrb r0, [r1, 0x16]
	adds r1, 0x68
	ldrh r2, [r1]
	movs r1, 0x31
	str r1, [sp]
	str r4, [sp, 0x4]
	movs r1, 0x1
	movs r3, 0x20
	bl sub_810491C
_08102E4A:
	movs r0, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r0, _08102EB4 @ =gUnknown_8415D9C
	movs r1, 0x1
	bl sub_8106E78
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r0, _08102EB8 @ =gUnknown_8415DB8
	bl sub_8104C2C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r4, _08102EBC @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldrb r0, [r0, 0x16]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldrb r0, [r0, 0x16]
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x24
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08102EA8: .4byte gUnknown_8452004
_08102EAC: .4byte gUnknown_8415DC4
_08102EB0: .4byte gUnknown_8415DCA
_08102EB4: .4byte gUnknown_8415D9C
_08102EB8: .4byte gUnknown_8415DB8
_08102EBC: .4byte gUnknown_203ACF0
	thumb_func_end sub_8102C28

	thumb_func_start sub_8102EC0
sub_8102EC0: @ 8102EC0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _08102ED0
	movs r0, 0x5
	bl PlaySE
_08102ED0:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	bne _08102F00
	ldr r0, _08102EF4 @ =gUnknown_203ACF0
	ldr r0, [r0]
	ldrb r0, [r0, 0x15]
	ldr r1, _08102EF8 @ =gUnknown_8440EF0
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r0, _08102EFC @ =gUnknown_8443460
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	b _08102F24
	.align 2, 0
_08102EF4: .4byte gUnknown_203ACF0
_08102EF8: .4byte gUnknown_8440EF0
_08102EFC: .4byte gUnknown_8443460
_08102F00:
	ldr r0, _08102F40 @ =gUnknown_203ACF0
	ldr r0, [r0]
	ldrb r0, [r0, 0x15]
	ldr r4, _08102F44 @ =gUnknown_84520F4
	lsls r5, 3
	adds r1, r5, r4
	ldr r1, [r1]
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	adds r4, 0x4
	adds r5, r4
	ldr r0, [r5]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
_08102F24:
	ldr r4, _08102F40 @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldrb r0, [r0, 0x15]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldrb r0, [r0, 0x15]
	movs r1, 0x2
	bl CopyWindowToVram
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102F40: .4byte gUnknown_203ACF0
_08102F44: .4byte gUnknown_84520F4
	thumb_func_end sub_8102EC0

	thumb_func_start sub_8102F48
sub_8102F48: @ 8102F48
	push {lr}
	adds r2, r1, 0
	cmp r2, 0x8
	bhi _08102F60
	ldr r0, _08102F6C @ =gUnknown_203ACF0
	ldr r0, [r0]
	movs r1, 0x1
	lsls r1, r2
	ldr r0, [r0, 0x8]
	ands r0, r1
	cmp r0, 0
	beq _08102F70
_08102F60:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x3
	bl ListMenuOverrideSetColors
	b _08102F7A
	.align 2, 0
_08102F6C: .4byte gUnknown_203ACF0
_08102F70:
	movs r0, 0xA
	movs r1, 0
	movs r2, 0xB
	bl ListMenuOverrideSetColors
_08102F7A:
	pop {r0}
	bx r0
	thumb_func_end sub_8102F48

	thumb_func_start sub_8102F80
sub_8102F80: @ 8102F80
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08102FA0 @ =gUnknown_203ACF0
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _08102F96
	b _0810316C
_08102F96:
	lsls r0, 2
	ldr r1, _08102FA4 @ =_08102FA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08102FA0: .4byte gUnknown_203ACF0
_08102FA4: .4byte _08102FA8
	.align 2, 0
_08102FA8:
	.4byte _08102FC8
	.4byte _08102FF8
	.4byte _08103028
	.4byte _08103038
	.4byte _08103050
	.4byte _0810307C
	.4byte _08103098
	.4byte _0810312C
_08102FC8:
	movs r0, 0x10
	movs r1, 0
	bl sub_8107D38
	movs r0, 0x20
	movs r1, 0x1
	bl sub_8107D38
	ldr r4, _08102FF4 @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	bl sub_8103518
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x48
	strh r0, [r1]
	movs r0, 0x2
	strb r0, [r2, 0x1]
	b _0810316C
	.align 2, 0
_08102FF4: .4byte gUnknown_203ACF0
_08102FF8:
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	bl sub_8103988
	movs r0, 0x1
	bl HideBg
	ldr r0, [r4]
	adds r0, 0x40
	bl sub_81047B0
	ldr r1, _08103020 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08103024 @ =sub_810287C
	b _08103164
	.align 2, 0
_08103020: .4byte gTasks
_08103024: .4byte sub_810287C
_08103028:
	bl sub_810317C
	ldr r0, _08103034 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x3
	b _0810316A
	.align 2, 0
_08103034: .4byte gUnknown_203ACF0
_08103038:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, _0810304C @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x4
	b _0810316A
	.align 2, 0
_0810304C: .4byte gUnknown_203ACF0
_08103050:
	movs r0, 0x1
	bl ShowBg
	ldr r0, _08103070 @ =0xffff7fff
	ldr r1, _08103074 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08103078 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x5
	b _0810316A
	.align 2, 0
_08103070: .4byte 0xffff7fff
_08103074: .4byte 0x0000ffff
_08103078: .4byte gUnknown_203ACF0
_0810307C:
	ldr r1, [r4]
	ldrb r0, [r1, 0x17]
	adds r1, 0x62
	movs r2, 0
	bl ListMenuGetScrollAndRow
	bl sub_81039F0
	ldr r1, [r4]
	adds r1, 0x60
	strb r0, [r1]
	ldr r1, [r4]
	movs r0, 0x6
	b _0810316A
_08103098:
	ldr r0, [r4]
	adds r0, 0x41
	ldrb r0, [r0]
	bl ListMenu_ProcessInput
	ldr r1, [r4]
	str r0, [r1, 0x30]
	ldrb r0, [r1, 0x17]
	adds r1, 0x62
	movs r2, 0
	bl ListMenuGetScrollAndRow
	ldr r0, _081030F0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _081030FC
	ldr r1, [r4]
	ldr r2, [r1, 0x30]
	lsrs r0, r2, 16
	ands r0, r3
	cmp r0, 0
	beq _0810316C
	adds r0, r1, 0
	adds r0, 0x5A
	strh r2, [r0]
	adds r0, 0x6
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, _081030F4 @ =0xffff7fff
	ldr r1, _081030F8 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	movs r0, 0x7
	b _0810316A
	.align 2, 0
_081030F0: .4byte gMain
_081030F4: .4byte 0xffff7fff
_081030F8: .4byte 0x0000ffff
_081030FC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810316C
	ldr r0, [r4]
	adds r0, 0x60
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, _08103124 @ =0xffff7fff
	ldr r1, _08103128 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	movs r0, 0x1
	b _0810316A
	.align 2, 0
_08103124: .4byte 0xffff7fff
_08103128: .4byte 0x0000ffff
_0810312C:
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	bl sub_8103988
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, [r4]
	adds r0, 0x40
	bl sub_81047B0
	ldr r1, _08103174 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08103178 @ =sub_81042EC
_08103164:
	str r1, [r0]
	ldr r1, [r4]
	movs r0, 0
_0810316A:
	strb r0, [r1, 0x1]
_0810316C:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103174: .4byte gTasks
_08103178: .4byte sub_81042EC
	thumb_func_end sub_8102F80

	thumb_func_start sub_810317C
sub_810317C: @ 810317C
	push {r4,r5,lr}
	sub sp, 0x24
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r0, _08103224 @ =gUnknown_845216C
	bl AddWindow
	ldr r2, _08103228 @ =gUnknown_203ACF0
	ldr r1, [r2]
	adds r1, 0x40
	strb r0, [r1]
	add r1, sp, 0xC
	ldr r0, _0810322C @ =gUnknown_8452174
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r2, [r2]
	ldr r0, [r2, 0x44]
	str r0, [sp, 0xC]
	add r1, sp, 0xC
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	strb r0, [r1, 0x10]
	adds r0, r2, 0
	adds r0, 0x48
	ldrh r0, [r0]
	strh r0, [r1, 0xC]
	adds r0, r2, 0
	adds r0, 0x42
	ldrb r1, [r0]
	add r0, sp, 0xC
	bl sub_8103924
	movs r0, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r0, _08103230 @ =gUnknown_8415F3D
	movs r1, 0x1
	bl sub_8106E78
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r0, _08103234 @ =gText_PickOKExit
	bl sub_8104C2C
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x24
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103224: .4byte gUnknown_845216C
_08103228: .4byte gUnknown_203ACF0
_0810322C: .4byte gUnknown_8452174
_08103230: .4byte gUnknown_8415F3D
_08103234: .4byte gText_PickOKExit
	thumb_func_end sub_810317C

	thumb_func_start sub_8103238
sub_8103238: @ 8103238
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08103258 @ =gUnknown_203ACF0
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _0810324E
	b _0810344C
_0810324E:
	lsls r0, 2
	ldr r1, _0810325C @ =_08103260
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08103258: .4byte gUnknown_203ACF0
_0810325C: .4byte _08103260
	.align 2, 0
_08103260:
	.4byte _08103280
	.4byte _081032B0
	.4byte _081032E8
	.4byte _081032FC
	.4byte _08103318
	.4byte _08103344
	.4byte _08103362
	.4byte _08103404
_08103280:
	movs r0, 0x10
	movs r1, 0
	bl sub_8107D38
	movs r0, 0x20
	movs r1, 0x1
	bl sub_8107D38
	ldr r4, _081032AC @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	bl sub_8103518
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x48
	strh r0, [r1]
	movs r0, 0x2
	strb r0, [r2, 0x1]
	b _0810344C
	.align 2, 0
_081032AC: .4byte gUnknown_203ACF0
_081032B0:
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	bl sub_8103988
	movs r0, 0x1
	bl HideBg
	ldr r0, [r4]
	adds r0, 0x40
	bl sub_81047B0
	ldr r1, _081032E0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _081032E4 @ =sub_810287C
	str r1, [r0]
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x1]
	b _0810344C
	.align 2, 0
_081032E0: .4byte gTasks
_081032E4: .4byte sub_810287C
_081032E8:
	bl sub_810345C
	ldr r0, _081032F8 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	b _0810344C
	.align 2, 0
_081032F8: .4byte gUnknown_203ACF0
_081032FC:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, _08103314 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	b _0810344C
	.align 2, 0
_08103314: .4byte gUnknown_203ACF0
_08103318:
	movs r0, 0x1
	bl ShowBg
	ldr r0, _08103338 @ =0xffff7fff
	ldr r1, _0810333C @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08103340 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	b _0810344C
	.align 2, 0
_08103338: .4byte 0xffff7fff
_0810333C: .4byte 0x0000ffff
_08103340: .4byte gUnknown_203ACF0
_08103344:
	ldr r1, [r4]
	ldrb r0, [r1, 0x17]
	adds r1, 0x62
	movs r2, 0
	bl ListMenuGetScrollAndRow
	bl sub_81039F0
	ldr r1, [r4]
	adds r1, 0x60
	strb r0, [r1]
	ldr r1, [r4]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	b _0810344C
_08103362:
	ldr r0, [r4]
	adds r0, 0x41
	ldrb r0, [r0]
	bl ListMenu_ProcessInput
	ldr r1, [r4]
	str r0, [r1, 0x30]
	ldrb r0, [r1, 0x17]
	adds r1, 0x62
	movs r2, 0
	bl ListMenuGetScrollAndRow
	ldr r0, _081033C4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _081033D0
	ldr r0, [r4]
	ldr r1, [r0, 0x30]
	lsrs r0, r1, 16
	ands r0, r2
	cmp r0, 0
	beq _0810344C
	lsls r0, r1, 16
	lsrs r0, 16
	bl sub_8106A20
	lsls r0, 24
	cmp r0, 0
	bne _0810344C
	ldr r0, [r4]
	adds r0, 0x60
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, _081033C8 @ =0xffff7fff
	ldr r1, _081033CC @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	b _0810344C
	.align 2, 0
_081033C4: .4byte gMain
_081033C8: .4byte 0xffff7fff
_081033CC: .4byte 0x0000ffff
_081033D0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810344C
	ldr r0, [r4]
	adds r0, 0x60
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, _081033FC @ =0xffff7fff
	ldr r1, _08103400 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _0810344C
	.align 2, 0
_081033FC: .4byte 0xffff7fff
_08103400: .4byte 0x0000ffff
_08103404:
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	bl sub_8103988
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, [r4]
	adds r0, 0x40
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x2F
	movs r2, 0
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, _08103454 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08103458 @ =sub_8103AC8
	str r1, [r0]
	ldr r0, [r4]
	strb r2, [r0, 0x1]
_0810344C:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103454: .4byte gTasks
_08103458: .4byte sub_8103AC8
	thumb_func_end sub_8103238

	thumb_func_start sub_810345C
sub_810345C: @ 810345C
	push {r4,r5,lr}
	sub sp, 0x24
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	ldr r0, _08103504 @ =gUnknown_845216C
	bl AddWindow
	ldr r2, _08103508 @ =gUnknown_203ACF0
	ldr r1, [r2]
	adds r1, 0x40
	strb r0, [r1]
	add r1, sp, 0xC
	ldr r0, _0810350C @ =gUnknown_8452174
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r2, [r2]
	ldr r0, [r2, 0x44]
	str r0, [sp, 0xC]
	add r1, sp, 0xC
	adds r0, r2, 0
	adds r0, 0x40
	ldrb r0, [r0]
	strb r0, [r1, 0x10]
	adds r0, r2, 0
	adds r0, 0x48
	ldrh r0, [r0]
	strh r0, [r1, 0xC]
	adds r0, r2, 0
	adds r0, 0x42
	ldrb r1, [r0]
	add r0, sp, 0xC
	bl sub_8103924
	movs r0, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r0, _08103510 @ =gUnknown_8415F4A
	movs r1, 0x1
	bl sub_8106E78
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r0, _08103514 @ =gText_PickOKExit
	bl sub_8104C2C
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x24
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103504: .4byte gUnknown_845216C
_08103508: .4byte gUnknown_203ACF0
_0810350C: .4byte gUnknown_8452174
_08103510: .4byte gUnknown_8415F4A
_08103514: .4byte gText_PickOKExit
	thumb_func_end sub_810345C

	thumb_func_start sub_8103518
sub_8103518: @ 8103518
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsNationalPokedexEnabled
	movs r1, 0x97
	str r1, [sp]
	cmp r0, 0
	beq _0810353A
	movs r2, 0xC1
	lsls r2, 1
	str r2, [sp]
_0810353A:
	movs r0, 0
	mov r10, r0
	cmp r4, 0x5
	bhi _08103568
	lsls r0, r4, 2
	ldr r1, _0810354C @ =_08103550
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810354C: .4byte _08103550
	.align 2, 0
_08103550:
	.4byte _08103568
	.4byte _08103604
	.4byte _0810369C
	.4byte _0810373C
	.4byte _081037D8
	.4byte _08103874
_08103568:
	movs r1, 0
	mov r8, r1
_0810356C:
	mov r4, r8
	adds r4, 0x1
	lsls r0, r4, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r9, r4
	cmp r7, 0
	beq _081035C4
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	ldr r2, _081035BC @ =gUnknown_203ACF0
	ldr r1, [r2]
	ldr r2, [r1, 0x44]
	mov r1, r8
	lsls r3, r1, 3
	adds r2, r3, r2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB
	muls r0, r1
	ldr r1, _081035C0 @ =gSpeciesNames
	adds r0, r1
	str r0, [r2]
	mov r10, r5
	adds r4, r3, 0
	b _081035D6
	.align 2, 0
_081035BC: .4byte gUnknown_203ACF0
_081035C0: .4byte gSpeciesNames
_081035C4:
	ldr r2, _081035FC @ =gUnknown_203ACF0
	ldr r0, [r2]
	ldr r1, [r0, 0x44]
	mov r0, r8
	lsls r2, r0, 3
	adds r1, r2, r1
	ldr r0, _08103600 @ =gUnknown_8415F66
	str r0, [r1]
	adds r4, r2, 0
_081035D6:
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	ldr r2, _081035FC @ =gUnknown_203ACF0
	ldr r1, [r2]
	ldr r3, [r1, 0x44]
	adds r3, r4, r3
	lsls r2, r6, 17
	lsls r1, r7, 16
	adds r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r2, r0
	str r2, [r3, 0x4]
	mov r8, r9
	mov r0, r8
	cmp r0, 0x96
	ble _0810356C
	b _08103906
	.align 2, 0
_081035FC: .4byte gUnknown_203ACF0
_08103600: .4byte gUnknown_8415F66
_08103604:
	movs r1, 0
	mov r8, r1
	ldr r2, _08103690 @ =gUnknown_203ACF0
	mov r9, r2
_0810360C:
	ldr r1, _08103694 @ =gUnknown_8443FC0
	mov r2, r8
	lsls r0, r2, 1
	adds r0, r1
	ldrh r5, [r0]
	ldr r0, [sp]
	cmp r5, r0
	bgt _08103682
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r7, 0
	beq _08103682
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	mov r2, r9
	ldr r1, [r2]
	ldr r2, [r1, 0x44]
	mov r1, r10
	lsls r4, r1, 3
	adds r2, r4, r2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB
	muls r0, r1
	ldr r1, _08103698 @ =gSpeciesNames
	adds r0, r1
	str r0, [r2]
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	mov r2, r9
	ldr r1, [r2]
	ldr r1, [r1, 0x44]
	adds r4, r1
	lsls r2, r6, 17
	lsls r1, r7, 16
	adds r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r2, r0
	str r2, [r4, 0x4]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
_08103682:
	movs r0, 0x1
	add r8, r0
	movs r0, 0xCD
	lsls r0, 1
	cmp r8, r0
	ble _0810360C
	b _08103906
	.align 2, 0
_08103690: .4byte gUnknown_203ACF0
_08103694: .4byte gUnknown_8443FC0
_08103698: .4byte gSpeciesNames
_0810369C:
	movs r1, 0
	mov r8, r1
	ldr r2, _08103730 @ =gUnknown_203ACF0
	mov r9, r2
_081036A4:
	ldr r1, _08103734 @ =gUnknown_84448FE
	mov r2, r8
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [sp]
	cmp r5, r0
	bgt _08103722
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _08103722
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	mov r2, r9
	ldr r1, [r2]
	ldr r2, [r1, 0x44]
	mov r1, r10
	lsls r4, r1, 3
	adds r2, r4, r2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB
	muls r0, r1
	ldr r1, _08103738 @ =gSpeciesNames
	adds r0, r1
	str r0, [r2]
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	mov r2, r9
	ldr r1, [r2]
	ldr r1, [r1, 0x44]
	adds r4, r1
	lsls r2, r6, 17
	lsls r1, r7, 16
	adds r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r2, r0
	str r2, [r4, 0x4]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
_08103722:
	movs r0, 0x1
	add r8, r0
	movs r0, 0xCD
	lsls r0, 1
	cmp r8, r0
	ble _081036A4
	b _08103906
	.align 2, 0
_08103730: .4byte gUnknown_203ACF0
_08103734: .4byte gUnknown_84448FE
_08103738: .4byte gSpeciesNames
_0810373C:
	movs r1, 0
	mov r8, r1
	ldr r2, _081037C8 @ =gUnknown_203ACF0
	mov r9, r2
_08103744:
	ldr r1, _081037CC @ =gUnknown_84442F6
	mov r2, r8
	lsls r0, r2, 1
	adds r0, r1
	ldrh r5, [r0]
	ldr r0, [sp]
	cmp r5, r0
	bgt _081037BA
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _081037BA
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	mov r2, r9
	ldr r1, [r2]
	ldr r2, [r1, 0x44]
	mov r1, r10
	lsls r4, r1, 3
	adds r2, r4, r2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB
	muls r0, r1
	ldr r1, _081037D0 @ =gSpeciesNames
	adds r0, r1
	str r0, [r2]
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	mov r2, r9
	ldr r1, [r2]
	ldr r1, [r1, 0x44]
	adds r4, r1
	lsls r2, r6, 17
	lsls r1, r7, 16
	adds r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r2, r0
	str r2, [r4, 0x4]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
_081037BA:
	movs r0, 0x1
	add r8, r0
	ldr r0, _081037D4 @ =0x00000181
	cmp r8, r0
	ble _08103744
	b _08103906
	.align 2, 0
_081037C8: .4byte gUnknown_203ACF0
_081037CC: .4byte gUnknown_84442F6
_081037D0: .4byte gSpeciesNames
_081037D4: .4byte 0x00000181
_081037D8:
	movs r1, 0
	mov r8, r1
	ldr r2, _08103864 @ =gUnknown_203ACF0
	mov r9, r2
_081037E0:
	ldr r1, _08103868 @ =gUnknown_84445FA
	mov r2, r8
	lsls r0, r2, 1
	adds r0, r1
	ldrh r5, [r0]
	ldr r0, [sp]
	cmp r5, r0
	bgt _08103856
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _08103856
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	mov r2, r9
	ldr r1, [r2]
	ldr r2, [r1, 0x44]
	mov r1, r10
	lsls r4, r1, 3
	adds r2, r4, r2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB
	muls r0, r1
	ldr r1, _0810386C @ =gSpeciesNames
	adds r0, r1
	str r0, [r2]
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	mov r2, r9
	ldr r1, [r2]
	ldr r1, [r1, 0x44]
	adds r4, r1
	lsls r2, r6, 17
	lsls r1, r7, 16
	adds r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r2, r0
	str r2, [r4, 0x4]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
_08103856:
	movs r0, 0x1
	add r8, r0
	ldr r0, _08103870 @ =0x00000181
	cmp r8, r0
	ble _081037E0
	b _08103906
	.align 2, 0
_08103864: .4byte gUnknown_203ACF0
_08103868: .4byte gUnknown_84445FA
_0810386C: .4byte gSpeciesNames
_08103870: .4byte 0x00000181
_08103874:
	movs r1, 0
	mov r8, r1
_08103878:
	mov r4, r8
	adds r4, 0x1
	lsls r0, r4, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r9, r4
	cmp r7, 0
	beq _081038D0
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	ldr r2, _081038C8 @ =gUnknown_203ACF0
	ldr r1, [r2]
	ldr r2, [r1, 0x44]
	mov r1, r8
	lsls r3, r1, 3
	adds r2, r3, r2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB
	muls r0, r1
	ldr r1, _081038CC @ =gSpeciesNames
	adds r0, r1
	str r0, [r2]
	mov r10, r5
	adds r4, r3, 0
	b _081038E2
	.align 2, 0
_081038C8: .4byte gUnknown_203ACF0
_081038CC: .4byte gSpeciesNames
_081038D0:
	ldr r2, _08103918 @ =gUnknown_203ACF0
	ldr r0, [r2]
	ldr r1, [r0, 0x44]
	mov r0, r8
	lsls r2, r0, 3
	adds r1, r2, r1
	ldr r0, _0810391C @ =gUnknown_8415F66
	str r0, [r1]
	adds r4, r2, 0
_081038E2:
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	ldr r2, _08103918 @ =gUnknown_203ACF0
	ldr r1, [r2]
	ldr r3, [r1, 0x44]
	adds r3, r4, r3
	lsls r2, r6, 17
	lsls r1, r7, 16
	adds r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r2, r0
	str r2, [r3, 0x4]
	mov r8, r9
	ldr r0, _08103920 @ =0x00000181
	cmp r8, r0
	ble _08103878
_08103906:
	mov r0, r10
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08103918: .4byte gUnknown_203ACF0
_0810391C: .4byte gUnknown_8415F66
_08103920: .4byte 0x00000181
	thumb_func_end sub_8103518

	thumb_func_start sub_8103924
sub_8103924: @ 8103924
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x4
	bgt _08103936
	cmp r1, 0x1
	bge _08103950
	b _0810393A
_08103936:
	cmp r1, 0x5
	beq _08103964
_0810393A:
	ldr r1, _08103948 @ =gUnknown_845218C
	ldr r4, _0810394C @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldrh r2, [r0, 0x36]
	ldrh r3, [r0, 0x34]
	b _0810396E
	.align 2, 0
_08103948: .4byte gUnknown_845218C
_0810394C: .4byte gUnknown_203ACF0
_08103950:
	ldr r1, _0810395C @ =gUnknown_845218C
	ldr r4, _08103960 @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldrh r2, [r0, 0x3A]
	ldrh r3, [r0, 0x38]
	b _0810396E
	.align 2, 0
_0810395C: .4byte gUnknown_845218C
_08103960: .4byte gUnknown_203ACF0
_08103964:
	ldr r1, _08103980 @ =gUnknown_845218C
	ldr r4, _08103984 @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldrh r2, [r0, 0x3E]
	ldrh r3, [r0, 0x3C]
_0810396E:
	adds r0, r5, 0
	bl ListMenuInitInRect
	ldr r1, [r4]
	adds r1, 0x41
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103980: .4byte gUnknown_845218C
_08103984: .4byte gUnknown_203ACF0
	thumb_func_end sub_8103924

	thumb_func_start sub_8103988
sub_8103988: @ 8103988
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bgt _08103998
	cmp r0, 0x1
	bge _081039B8
	b _0810399C
_08103998:
	cmp r0, 0x5
	beq _081039D4
_0810399C:
	ldr r0, _081039B4 @ =gUnknown_203ACF0
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x36
	adds r2, 0x34
	bl DestroyListMenuTask
	b _081039E8
	.align 2, 0
_081039B4: .4byte gUnknown_203ACF0
_081039B8:
	ldr r0, _081039D0 @ =gUnknown_203ACF0
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x3A
	adds r2, 0x38
	bl DestroyListMenuTask
	b _081039E8
	.align 2, 0
_081039D0: .4byte gUnknown_203ACF0
_081039D4:
	ldr r0, _081039EC @ =gUnknown_203ACF0
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x3E
	adds r2, 0x3C
	bl DestroyListMenuTask
_081039E8:
	pop {r0}
	bx r0
	.align 2, 0
_081039EC: .4byte gUnknown_203ACF0
	thumb_func_end sub_8103988

	thumb_func_start sub_81039F0
sub_81039F0: @ 81039F0
	push {r4,lr}
	sub sp, 0x10
	mov r1, sp
	ldr r0, _08103A18 @ =gUnknown_84521B4
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _08103A1C @ =gUnknown_203ACF0
	ldr r0, [r2]
	adds r0, 0x48
	ldr r1, _08103A20 @ =gUnknown_8452174
	ldrh r3, [r0]
	ldrh r0, [r1, 0xE]
	cmp r3, r0
	bls _08103A24
	mov r1, sp
	subs r0, r3, r0
	b _08103A28
	.align 2, 0
_08103A18: .4byte gUnknown_84521B4
_08103A1C: .4byte gUnknown_203ACF0
_08103A20: .4byte gUnknown_8452174
_08103A24:
	mov r1, sp
	movs r0, 0
_08103A28:
	strh r0, [r1, 0x8]
	ldr r1, [r2]
	adds r1, 0x62
	mov r0, sp
	bl AddScrollIndicatorArrowPair
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81039F0

	thumb_func_start sub_8103A40
sub_8103A40: @ 8103A40
	push {r4-r7,lr}
	sub sp, 0x4
	adds r4, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r0, r4, 16
	lsrs r5, r0, 16
	movs r0, 0x1
	lsrs r4, 17
	ands r4, r0
	ldr r7, _08103AC0 @ =gUnknown_203ACF0
	ldr r0, [r7]
	adds r0, 0x40
	ldrb r0, [r0]
	str r6, [sp]
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0xC
	bl sub_8104A34
	cmp r4, 0
	beq _08103AB6
	ldr r0, [r7]
	adds r0, 0x40
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0x28
	adds r3, r6, 0
	bl BlitMoveInfoIcon
	ldr r0, _08103AC4 @ =gBaseStats
	lsls r4, r5, 3
	subs r4, r5
	lsls r4, 2
	adds r4, r0
	ldrb r5, [r4, 0x6]
	ldr r0, [r7]
	adds r0, 0x40
	ldrb r0, [r0]
	adds r1, r5, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x78
	adds r3, r6, 0
	bl BlitMoveInfoIcon
	ldrb r1, [r4, 0x7]
	cmp r5, r1
	beq _08103AB6
	ldr r0, [r7]
	adds r0, 0x40
	ldrb r0, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x98
	adds r3, r6, 0
	bl BlitMoveInfoIcon
_08103AB6:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08103AC0: .4byte gUnknown_203ACF0
_08103AC4: .4byte gBaseStats
	thumb_func_end sub_8103A40

	thumb_func_start sub_8103AC8
sub_8103AC8: @ 8103AC8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08103AE8 @ =gUnknown_203ACF0
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r5, r1, 0
	cmp r0, 0x1A
	bls _08103ADE
	b _08104228
_08103ADE:
	lsls r0, 2
	ldr r1, _08103AEC @ =_08103AF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08103AE8: .4byte gUnknown_203ACF0
_08103AEC: .4byte _08103AF0
	.align 2, 0
_08103AF0:
	.4byte _08103B5C
	.4byte _08103B98
	.4byte _08103BF8
	.4byte _08103C24
	.4byte _08103C5C
	.4byte _08103C84
	.4byte _08103E6C
	.4byte _08103E6C
	.4byte _08103EA0
	.4byte _08103ED4
	.4byte _08103EA0
	.4byte _08103EFC
	.4byte _08103F20
	.4byte _08103F42
	.4byte _08103F54
	.4byte _08103F68
	.4byte _08103F7A
	.4byte _08103FF0
	.4byte _0810403A
	.4byte _0810406C
	.4byte _08104080
	.4byte _081040E4
	.4byte _081040F4
	.4byte _08104118
	.4byte _081041DE
	.4byte _081041F0
	.4byte _0810421C
_08103B5C:
	movs r0, 0x3
	bl HideBg
	movs r0, 0x2
	bl HideBg
	movs r0, 0x1
	bl HideBg
	ldr r4, _08103B94 @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r0, 0x28
	ldrb r0, [r0]
	bl sub_810699C
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x2B
	adds r0, 0x29
	ldrb r1, [r0]
	ldrb r0, [r2]
	cmp r0, r1
	bcs _08103B8C
	strb r1, [r2]
_08103B8C:
	ldr r1, [r4]
	movs r0, 0x2
	b _08104226
	.align 2, 0
_08103B94: .4byte gUnknown_203ACF0
_08103B98:
	bl sub_8104E90
	movs r0, 0x2
	bl HideBg
	movs r0, 0x1
	bl HideBg
	ldr r0, _08103BC8 @ =gUnknown_203ACF0
	ldr r0, [r0]
	adds r0, 0x2F
	ldrb r0, [r0]
	cmp r0, 0
	beq _08103BB8
	cmp r0, 0x1
	beq _08103BD4
_08103BB8:
	ldr r0, _08103BCC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08103BD0 @ =sub_810287C
	b _08103BE0
	.align 2, 0
_08103BC8: .4byte gUnknown_203ACF0
_08103BCC: .4byte gTasks
_08103BD0: .4byte sub_810287C
_08103BD4:
	ldr r0, _08103BEC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08103BF0 @ =sub_8103238
_08103BE0:
	str r0, [r1]
	ldr r0, _08103BF4 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0
	b _08104226
	.align 2, 0
_08103BEC: .4byte gTasks
_08103BF0: .4byte sub_8103238
_08103BF4: .4byte gUnknown_203ACF0
_08103BF8:
	movs r0, 0
	bl sub_8104F0C
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0xFF
	bl sub_8105058
	ldr r0, _08103C20 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x3
	b _08104226
	.align 2, 0
_08103C20: .4byte gUnknown_203ACF0
_08103C24:
	ldr r0, _08103C50 @ =0xffff7fff
	ldr r1, _08103C54 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	ldr r0, _08103C58 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x4
	b _08104226
	.align 2, 0
_08103C50: .4byte 0xffff7fff
_08103C54: .4byte 0x0000ffff
_08103C58: .4byte gUnknown_203ACF0
_08103C5C:
	bl sub_8104234
	ldr r4, _08103C7C @ =gUnknown_203ACF0
	ldr r1, [r4]
	adds r1, 0x60
	strb r0, [r1]
	ldr r0, _08103C80 @ =gUnknown_84524C4
	movs r1, 0
	bl ListMenuAddCursorObjectInternal
	ldr r1, [r4]
	adds r1, 0x61
	strb r0, [r1]
	ldr r1, [r4]
	movs r0, 0x5
	b _08104226
	.align 2, 0
_08103C7C: .4byte gUnknown_203ACF0
_08103C80: .4byte gUnknown_84524C4
_08103C84:
	ldr r0, [r5]
	adds r0, 0x2D
	ldrb r0, [r0]
	bl sub_8105058
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x61
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x2D
	ldrb r1, [r1]
	adds r2, 0x2C
	ldrb r2, [r2]
	bl sub_8105178
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x62
	strh r0, [r1]
	movs r4, 0
	ldr r0, _08103CF8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08103CFC
	adds r0, r2, 0
	adds r0, 0x2D
	ldrb r1, [r0]
	lsls r1, 1
	subs r0, 0x15
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08103CFC
	ldr r0, [r5]
	adds r0, 0x60
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r5]
	adds r0, 0x61
	ldrb r0, [r0]
	movs r1, 0
	bl ListMenuRemoveCursorObject
	ldr r1, [r5]
	movs r0, 0xC
	b _08104226
	.align 2, 0
_08103CF8: .4byte gMain
_08103CFC:
	ldr r2, _08103D28 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _08103D6E
	ldrh r1, [r2, 0x30]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08103D32
	ldr r0, _08103D2C @ =gUnknown_203ACF0
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x2D
	ldrb r0, [r1]
	cmp r0, 0
	beq _08103D30
	subs r0, 0x1
	strb r0, [r1]
	b _08103D60
	.align 2, 0
_08103D28: .4byte gMain
_08103D2C: .4byte gUnknown_203ACF0
_08103D30:
	movs r4, 0x1
_08103D32:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _08103D6E
	ldrh r1, [r2, 0x30]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08103D6E
	ldr r0, _08103D68 @ =gUnknown_203ACF0
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0x2D
	ldrb r1, [r2]
	adds r0, 0x2C
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bge _08103D6C
	adds r0, r1, 0x1
	strb r0, [r2]
_08103D60:
	movs r0, 0x5
	bl PlaySE
	b _08104228
	.align 2, 0
_08103D68: .4byte gUnknown_203ACF0
_08103D6C:
	movs r4, 0x2
_08103D6E:
	cmp r4, 0
	bne _08103D78
	bl sub_8104284
	adds r4, r0, 0
_08103D78:
	cmp r4, 0x1
	beq _08103D94
	cmp r4, 0x1
	ble _08103E4E
	cmp r4, 0x2
	beq _08103DF8
	b _08103E4E
_08103D86:
	ldr r1, [r4]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	ldr r5, _08103D90 @ =gUnknown_203ACF0
	b _08103DDA
	.align 2, 0
_08103D90: .4byte gUnknown_203ACF0
_08103D94:
	ldr r0, _08103DE4 @ =gUnknown_203ACF0
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x2B
	adds r1, 0x29
	ldrb r2, [r2]
	adds r5, r0, 0
	ldrb r1, [r1]
	cmp r2, r1
	bls _08103DDA
	adds r4, r5, 0
_08103DAA:
	ldr r1, [r4]
	adds r1, 0x2B
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r0, [r0]
	adds r1, 0x2B
	ldrb r1, [r1]
	bl sub_8106838
	lsls r0, 24
	cmp r0, 0
	bne _08103D86
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x2B
	adds r1, 0x29
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhi _08103DAA
_08103DDA:
	ldr r1, [r5]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x8
	beq _08103E4E
	b _08103E4A
	.align 2, 0
_08103DE4: .4byte gUnknown_203ACF0
_08103DE8:
	ldr r1, [r4]
	movs r0, 0xA
	strb r0, [r1, 0x1]
	ldr r5, _08103DF4 @ =gUnknown_203ACF0
	b _08103E42
	.align 2, 0
_08103DF4: .4byte gUnknown_203ACF0
_08103DF8:
	ldr r1, _08103E64 @ =gUnknown_203ACF0
	ldr r0, [r1]
	adds r2, r0, 0
	adds r2, 0x2B
	ldrb r2, [r2]
	adds r0, 0x2A
	ldrb r0, [r0]
	subs r0, 0x1
	adds r5, r1, 0
	cmp r2, r0
	bge _08103E42
	adds r4, r5, 0
_08103E10:
	ldr r1, [r4]
	adds r1, 0x2B
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r0, [r0]
	adds r1, 0x2B
	ldrb r1, [r1]
	bl sub_8106838
	lsls r0, 24
	cmp r0, 0
	bne _08103DE8
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x2B
	ldrb r1, [r1]
	adds r0, 0x2A
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	blt _08103E10
_08103E42:
	ldr r1, [r5]
	ldrb r0, [r1, 0x1]
	cmp r0, 0xA
	beq _08103E4E
_08103E4A:
	movs r0, 0x6
	strb r0, [r1, 0x1]
_08103E4E:
	ldr r0, _08103E68 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08103E5C
	b _08104228
_08103E5C:
	ldr r0, _08103E64 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x6
	b _08104226
	.align 2, 0
_08103E64: .4byte gUnknown_203ACF0
_08103E68: .4byte gMain
_08103E6C:
	ldr r0, [r5]
	adds r0, 0x60
	ldrb r0, [r0]
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r5]
	adds r0, 0x61
	ldrb r0, [r0]
	movs r1, 0
	bl ListMenuRemoveCursorObject
	ldr r0, _08103E98 @ =0xffff7fff
	ldr r1, _08103E9C @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	movs r0, 0x1
	b _08104226
	.align 2, 0
_08103E98: .4byte 0xffff7fff
_08103E9C: .4byte 0x0000ffff
_08103EA0:
	bl sub_8104E90
	movs r0, 0xFF
	bl sub_8105058
	ldr r4, _08103ED0 @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r0, 0x61
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0xA0
	movs r3, 0
	bl ListMenuUpdateCursorObject
	ldr r0, [r4]
	adds r0, 0x2E
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r4]
	strb r1, [r0, 0x2]
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	b _08104226
	.align 2, 0
_08103ED0: .4byte gUnknown_203ACF0
_08103ED4:
	movs r0, 0
	bl sub_81052D0
	lsls r0, 24
	cmp r0, 0
	bne _08103EE2
	b _08104228
_08103EE2:
	ldr r2, _08103EF8 @ =gUnknown_203ACF0
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, 0x2D
	strb r0, [r1]
	ldr r1, [r2]
	movs r0, 0x5
	b _08104226
	.align 2, 0
_08103EF8: .4byte gUnknown_203ACF0
_08103EFC:
	movs r0, 0x1
	bl sub_81052D0
	lsls r0, 24
	cmp r0, 0
	bne _08103F0A
	b _08104228
_08103F0A:
	ldr r2, _08103F1C @ =gUnknown_203ACF0
	ldr r0, [r2]
	adds r0, 0x2D
	movs r1, 0
	strb r1, [r0]
	ldr r1, [r2]
	movs r0, 0x5
	b _08104226
	.align 2, 0
_08103F1C: .4byte gUnknown_203ACF0
_08103F20:
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x2D
	ldrb r1, [r0]
	lsls r1, 1
	subs r0, 0x15
	adds r0, r1
	ldrh r1, [r0]
	adds r0, r2, 0
	adds r0, 0x5A
	strh r1, [r0]
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r5]
	movs r0, 0xE
	b _08104226
_08103F42:
	bl sub_8106014
	ldr r0, _08103F50 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x4
	b _08104226
	.align 2, 0
_08103F50: .4byte gUnknown_203ACF0
_08103F54:
	movs r0, 0
	bl sub_8105E1C
	ldr r0, _08103F64 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0xF
	b _08104226
	.align 2, 0
_08103F64: .4byte gUnknown_203ACF0
_08103F68:
	ldr r0, [r5]
	movs r1, 0
	strb r1, [r0, 0x2]
	ldr r0, [r5]
	strb r1, [r0, 0x3]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
_08103F7A:
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	cmp r0, 0x5
	bhi _08103FA8
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _08103F8A
	b _081040BE
_08103F8A:
	ldrb r1, [r1, 0x3]
	movs r0, 0
	bl sub_8105594
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r5]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	b _08104228
_08103FA8:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r5]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	ldr r1, [r5]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldr r1, [r5]
	movs r0, 0x11
	b _08104226
_08103FF0:
	ldr r0, _08104024 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810402C
	bl sub_8106014
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, _08104028 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x15
	b _08104226
	.align 2, 0
_08104024: .4byte gMain
_08104028: .4byte gUnknown_203ACF0
_0810402C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08104036
	b _081041D8
_08104036:
	ldr r1, [r5]
	b _08104224
_0810403A:
	movs r0, 0
	bl sub_8104F0C
	movs r0, 0
	movs r1, 0x6
	bl sub_8105594
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08104068 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x13
	b _08104226
	.align 2, 0
_08104068: .4byte gUnknown_203ACF0
_0810406C:
	ldr r1, [r5]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldr r1, [r5]
	movs r0, 0x6
	strb r0, [r1, 0x3]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
_08104080:
	ldr r1, [r5]
	ldrb r2, [r1, 0x3]
	cmp r2, 0
	beq _081040C4
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _081040BE
	subs r0, r2, 0x1
	strb r0, [r1, 0x3]
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r0, [r5]
	ldrb r1, [r0, 0x3]
	movs r0, 0
	bl sub_8105594
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r5]
	movs r0, 0x1
	strb r0, [r1, 0x2]
	b _08104228
_081040BE:
	subs r0, 0x1
	strb r0, [r1, 0x2]
	b _08104228
_081040C4:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r5]
	movs r0, 0xD
	b _08104226
_081040E4:
	bl sub_810603C
	ldr r0, _081040F0 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x16
	b _08104226
	.align 2, 0
_081040F0: .4byte gUnknown_203ACF0
_081040F4:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08104114 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x17
	b _08104226
	.align 2, 0
_08104114: .4byte gUnknown_203ACF0
_08104118:
	ldr r0, _08104174 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810417C
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x10
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08104178 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x1A
	b _08104226
	.align 2, 0
_08104174: .4byte gMain
_08104178: .4byte gUnknown_203ACF0
_0810417C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081041D8
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x10
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _081041D4 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x18
	b _08104226
	.align 2, 0
_081041D4: .4byte gUnknown_203ACF0
_081041D8:
	bl sub_8106B34
	b _08104228
_081041DE:
	bl sub_81067C0
	ldr r0, _081041EC @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x19
	b _08104226
	.align 2, 0
_081041EC: .4byte gUnknown_203ACF0
_081041F0:
	movs r0, 0
	bl sub_8105E1C
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08104218 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x11
	b _08104226
	.align 2, 0
_08104218: .4byte gUnknown_203ACF0
_0810421C:
	bl sub_81067C0
	ldr r0, _08104230 @ =gUnknown_203ACF0
	ldr r1, [r0]
_08104224:
	movs r0, 0x12
_08104226:
	strb r0, [r1, 0x1]
_08104228:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104230: .4byte gUnknown_203ACF0
	thumb_func_end sub_8103AC8

	thumb_func_start sub_8104234
sub_8104234: @ 8104234
	push {r4,lr}
	sub sp, 0x10
	mov r1, sp
	ldr r0, _0810427C @ =gUnknown_84524B4
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r0, [r0]
	str r0, [r1]
	mov r1, sp
	ldr r0, _08104280 @ =gUnknown_203ACF0
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	strh r0, [r1, 0x6]
	adds r0, r2, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	subs r0, 0x1
	strh r0, [r1, 0x8]
	adds r0, r2, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x62
	strh r0, [r1]
	mov r0, sp
	bl AddScrollIndicatorArrowPair
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810427C: .4byte gUnknown_84524B4
_08104280: .4byte gUnknown_203ACF0
	thumb_func_end sub_8104234

	thumb_func_start sub_8104284
sub_8104284: @ 8104284
	push {lr}
	ldr r0, _081042B0 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	beq _081042C0
	cmp r0, 0x1
	ble _081042E6
	cmp r0, 0x2
	bne _081042E6
	ldr r0, _081042B4 @ =gMain
	ldr r2, [r0, 0x2C]
	ldr r1, _081042B8 @ =0x00200100
	adds r0, r2, 0
	ands r0, r1
	cmp r0, r1
	beq _081042CE
	ldr r0, _081042BC @ =0x00100100
	ands r2, r0
	cmp r2, r0
	beq _081042E2
	b _081042E6
	.align 2, 0
_081042B0: .4byte gSaveBlock2Ptr
_081042B4: .4byte gMain
_081042B8: .4byte 0x00200100
_081042BC: .4byte 0x00100100
_081042C0:
	ldr r0, _081042D4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _081042D8
_081042CE:
	movs r0, 0x1
	b _081042E8
	.align 2, 0
_081042D4: .4byte gMain
_081042D8:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _081042E6
_081042E2:
	movs r0, 0x2
	b _081042E8
_081042E6:
	movs r0, 0
_081042E8:
	pop {r1}
	bx r1
	thumb_func_end sub_8104284

	thumb_func_start sub_81042EC
sub_81042EC: @ 81042EC
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0810430C @ =gUnknown_203ACF0
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r5, r1, 0
	cmp r0, 0xC
	bls _08104302
	b _08104656
_08104302:
	lsls r0, 2
	ldr r1, _08104310 @ =_08104314
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810430C: .4byte gUnknown_203ACF0
_08104310: .4byte _08104314
	.align 2, 0
_08104314:
	.4byte _08104348
	.4byte _08104368
	.4byte _08104398
	.4byte _081043AC
	.4byte _081043E0
	.4byte _08104418
	.4byte _08104508
	.4byte _08104528
	.4byte _08104538
	.4byte _0810455C
	.4byte _081045F2
	.4byte _08104604
	.4byte _08104630
_08104348:
	movs r0, 0x3
	bl HideBg
	movs r0, 0x2
	bl HideBg
	movs r0, 0x1
	bl HideBg
	ldr r0, _08104364 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x2
	b _08104654
	.align 2, 0
_08104364: .4byte gUnknown_203ACF0
_08104368:
	movs r0, 0x2
	bl HideBg
	movs r0, 0x1
	bl HideBg
	ldr r1, _0810438C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08104390 @ =sub_8102F80
	str r1, [r0]
	ldr r0, _08104394 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0
	b _08104654
	.align 2, 0
_0810438C: .4byte gTasks
_08104390: .4byte sub_8102F80
_08104394: .4byte gUnknown_203ACF0
_08104398:
	ldr r0, [r5]
	adds r0, 0x2C
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0
	bl sub_8105E1C
	ldr r1, [r5]
	movs r0, 0x3
	b _08104654
_081043AC:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r4, _081043DC @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	ldr r1, [r4]
	movs r0, 0x4
	b _08104654
	.align 2, 0
_081043DC: .4byte gUnknown_203ACF0
_081043E0:
	ldr r0, _0810440C @ =0xffff7fff
	ldr r1, _08104410 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	ldr r0, _08104414 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x5
	b _08104654
	.align 2, 0
_0810440C: .4byte 0xffff7fff
_08104410: .4byte 0x0000ffff
_08104414: .4byte gUnknown_203ACF0
_08104418:
	ldr r0, _0810444C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08104454
	bl sub_8106014
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, _08104450 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x7
	b _08104654
	.align 2, 0
_0810444C: .4byte gMain
_08104450: .4byte gUnknown_203ACF0
_08104454:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08104484
	bl sub_8106014
	ldr r0, _08104478 @ =0xffff7fff
	ldr r1, _0810447C @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08104480 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x1
	b _08104654
	.align 2, 0
_08104478: .4byte 0xffff7fff
_0810447C: .4byte 0x0000ffff
_08104480: .4byte gUnknown_203ACF0
_08104484:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _081044C0
	movs r0, 0x1
	bl sub_8104664
	cmp r0, 0
	beq _081044C0
	bl sub_8106014
	ldr r0, _081044B4 @ =0xffff7fff
	ldr r1, _081044B8 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081044BC @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x6
	b _08104654
	.align 2, 0
_081044B4: .4byte 0xffff7fff
_081044B8: .4byte 0x0000ffff
_081044BC: .4byte gUnknown_203ACF0
_081044C0:
	ldr r0, _081044F8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081044CE
	b _081045EC
_081044CE:
	movs r0, 0
	bl sub_8104664
	cmp r0, 0
	bne _081044DA
	b _081045EC
_081044DA:
	bl sub_8106014
	ldr r0, _081044FC @ =0xffff7fff
	ldr r1, _08104500 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08104504 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x6
	b _08104654
	.align 2, 0
_081044F8: .4byte gMain
_081044FC: .4byte 0xffff7fff
_08104500: .4byte 0x0000ffff
_08104504: .4byte gUnknown_203ACF0
_08104508:
	movs r0, 0x2
	bl HideBg
	movs r0, 0x1
	bl HideBg
	ldr r0, _08104524 @ =gUnknown_203ACF0
	ldr r1, [r0]
	ldr r0, [r1, 0x30]
	adds r2, r1, 0
	adds r2, 0x5A
	strh r0, [r2]
	movs r0, 0x2
	b _08104654
	.align 2, 0
_08104524: .4byte gUnknown_203ACF0
_08104528:
	bl sub_810603C
	ldr r0, _08104534 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x8
	b _08104654
	.align 2, 0
_08104534: .4byte gUnknown_203ACF0
_08104538:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08104558 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x9
	b _08104654
	.align 2, 0
_08104558: .4byte gUnknown_203ACF0
_0810455C:
	ldr r0, _08104580 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08104590
	ldr r0, _08104584 @ =0xffff7fff
	ldr r1, _08104588 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0810458C @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0xC
	b _08104654
	.align 2, 0
_08104580: .4byte gMain
_08104584: .4byte 0xffff7fff
_08104588: .4byte 0x0000ffff
_0810458C: .4byte gUnknown_203ACF0
_08104590:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081045EC
	movs r5, 0x1E
	str r5, [sp]
	movs r4, 0x10
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _081045E8 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0xA
	b _08104654
	.align 2, 0
_081045E8: .4byte gUnknown_203ACF0
_081045EC:
	bl sub_8106B34
	b _08104656
_081045F2:
	bl sub_81067C0
	ldr r0, _08104600 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0xB
	b _08104654
	.align 2, 0
_08104600: .4byte gUnknown_203ACF0
_08104604:
	movs r0, 0
	bl sub_8105E1C
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _0810462C @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x5
	b _08104654
	.align 2, 0
_0810462C: .4byte gUnknown_203ACF0
_08104630:
	bl sub_81067C0
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08104660 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x1
_08104654:
	strb r0, [r1, 0x1]
_08104656:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104660: .4byte gUnknown_203ACF0
	thumb_func_end sub_81042EC

	thumb_func_start sub_8104664
sub_8104664: @ 8104664
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08104684 @ =gUnknown_203ACF0
	ldr r3, [r0]
	adds r2, r3, 0
	adds r2, 0x42
	ldrb r2, [r2]
	mov r8, r0
	cmp r2, 0x4
	bgt _08104688
	cmp r2, 0x1
	bge _0810469C
	b _0810468C
	.align 2, 0
_08104684: .4byte gUnknown_203ACF0
_08104688:
	cmp r2, 0x5
	beq _081046A8
_0810468C:
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0x36
	adds r2, r0
	mov r12, r2
	adds r6, r0, 0
	adds r6, 0x34
	b _081046B2
_0810469C:
	movs r0, 0x3A
	adds r0, r3
	mov r12, r0
	adds r6, r3, 0
	adds r6, 0x38
	b _081046B2
_081046A8:
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	adds r6, r3, 0
	adds r6, 0x3C
_081046B2:
	mov r2, r12
	ldrh r1, [r2]
	ldrh r0, [r6]
	adds r3, r1, r0
	cmp r4, 0
	beq _08104700
	cmp r3, 0
	beq _0810474C
	subs r3, 0x1
	cmp r3, 0
	blt _0810474C
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, 0x44]
	lsls r2, r3, 3
	adds r0, r2, r0
	ldrh r0, [r0, 0x6]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081046FA
	mov r5, r8
	movs r4, 0x1
	adds r1, r2, 0
_081046E2:
	subs r1, 0x8
	subs r3, 0x1
	cmp r3, 0
	blt _0810474C
	ldr r0, [r5]
	ldr r0, [r0, 0x44]
	adds r0, r1, r0
	ldrh r0, [r0, 0x6]
	ands r0, r4
	adds r2, r1, 0
	cmp r0, 0
	beq _081046E2
_081046FA:
	cmp r3, 0
	bge _08104750
	b _0810474C
_08104700:
	mov r2, r8
	ldr r5, [r2]
	adds r0, r5, 0
	adds r0, 0x48
	ldrh r4, [r0]
	subs r0, r4, 0x1
	cmp r3, r0
	beq _0810474C
	adds r3, 0x1
	cmp r3, r4
	bge _0810474C
	ldr r0, [r5, 0x44]
	lsls r2, r3, 3
	adds r0, r2, r0
	ldrh r0, [r0, 0x6]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08104740
	adds r1, r2, 0
	movs r7, 0x1
_0810472A:
	adds r1, 0x8
	adds r3, 0x1
	cmp r3, r4
	bge _0810474C
	ldr r0, [r5, 0x44]
	adds r0, r1, r0
	ldrh r0, [r0, 0x6]
	ands r0, r7
	adds r2, r1, 0
	cmp r0, 0
	beq _0810472A
_08104740:
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x48
	ldrh r0, [r0]
	cmp r3, r0
	blt _08104750
_0810474C:
	movs r0, 0
	b _081047A6
_08104750:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, [r1, 0x44]
	adds r0, r2, r0
	ldr r0, [r0, 0x4]
	str r0, [r1, 0x30]
	adds r1, 0x48
	ldrh r0, [r1]
	cmp r0, 0x9
	bls _0810479C
	cmp r3, 0x3
	bgt _08104770
	movs r0, 0
	mov r1, r12
	strh r0, [r1]
	b _081047A2
_08104770:
	ldrh r1, [r1]
	subs r0, r1, 0x4
	cmp r3, r0
	blt _08104790
	subs r0, 0x5
	mov r2, r12
	strh r0, [r2]
	adds r1, r3, 0
	adds r1, 0x9
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0x48
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r6]
	b _081047A4
_08104790:
	subs r0, r3, 0x4
	mov r1, r12
	strh r0, [r1]
	movs r0, 0x4
	strh r0, [r6]
	b _081047A4
_0810479C:
	movs r0, 0
	mov r2, r12
	strh r0, [r2]
_081047A2:
	strh r3, [r6]
_081047A4:
	movs r0, 0x1
_081047A6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8104664

	thumb_func_start sub_81047B0
sub_81047B0: @ 81047B0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _081047C2
	bl RemoveWindow
	movs r0, 0xFF
	strb r0, [r4]
_081047C2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81047B0

	thumb_func_start sub_81047C8
sub_81047C8: @ 81047C8
	push {r4-r7,lr}
	sub sp, 0x18
	mov r12, r2
	ldr r2, [sp, 0x2C]
	ldr r4, [sp, 0x30]
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r2, 24
	lsrs r3, r2, 24
	lsls r4, 24
	lsrs r0, r4, 24
	cmp r0, 0x4
	bhi _08104852
	lsls r0, 2
	ldr r1, _081047F4 @ =_081047F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081047F4: .4byte _081047F8
	.align 2, 0
_081047F8:
	.4byte _0810480C
	.4byte _0810481A
	.4byte _08104828
	.4byte _08104836
	.4byte _08104844
_0810480C:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x3
	b _08104850
_0810481A:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x1
	b _08104850
_08104828:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xF
	strb r0, [r1, 0x1]
	movs r0, 0xE
	b _08104850
_08104836:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xB
	strb r0, [r1, 0x1]
	movs r0, 0x1
	b _08104850
_08104844:
	add r1, sp, 0x14
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x2
_08104850:
	strb r0, [r1, 0x2]
_08104852:
	negs r0, r5
	orrs r0, r5
	lsrs r0, 31
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	add r0, sp, 0x14
	str r0, [sp, 0x8]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0xC]
	mov r0, r12
	str r0, [sp, 0x10]
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl AddTextPrinterParameterized4
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81047C8

	thumb_func_start sub_8104880
sub_8104880: @ 8104880
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r9, r0
	mov r10, r1
	adds r4, r2, 0
	ldr r6, [sp, 0x2C]
	ldr r0, [sp, 0x30]
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	add r5, sp, 0x8
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5]
	add r5, sp, 0x8
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5, 0x1]
	add r5, sp, 0x8
	adds r0, r4, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r5, 0x2]
	add r1, sp, 0x8
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	str r6, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	mov r0, r9
	mov r1, r10
	add r2, sp, 0x8
	adds r3, r7, 0
	bl sub_81047C8
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8104880

	thumb_func_start sub_810491C
sub_810491C: @ 810491C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r5, r2, 0
	ldr r2, [sp, 0x30]
	ldr r4, [sp, 0x34]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r5, 16
	lsrs r5, 16
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r4, 24
	lsrs r7, r4, 24
	add r4, sp, 0x8
	adds r0, r5, 0
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	add r6, sp, 0x8
	adds r0, r5, 0
	movs r1, 0x64
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r6, 0x1]
	add r5, sp, 0x8
	adds r0, r4, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r5, 0x2]
	add r1, sp, 0x8
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	adds r0, r1, 0
	ldrb r0, [r0]
	cmp r0, 0xA1
	bne _081049A8
	movs r3, 0
	mov r2, sp
	adds r2, 0xA
_0810499A:
	strb r3, [r1]
	adds r1, 0x1
	cmp r1, r2
	bgt _081049A8
	ldrb r0, [r1]
	cmp r0, 0xA1
	beq _0810499A
_081049A8:
	mov r0, r8
	str r0, [sp]
	str r7, [sp, 0x4]
	ldr r0, [sp, 0xC]
	mov r1, r10
	add r2, sp, 0x8
	mov r3, r9
	bl sub_81047C8
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810491C

	thumb_func_start sub_81049CC
sub_81049CC: @ 81049CC
	push {lr}
	adds r1, r0, 0
	cmp r1, 0xC9
	beq _081049E8
	movs r0, 0x9A
	lsls r0, 1
	cmp r1, r0
	bne _081049F4
	ldr r0, _081049E4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r0, [r0, 0x20]
	b _081049F6
	.align 2, 0
_081049E4: .4byte gSaveBlock2Ptr
_081049E8:
	ldr r0, _081049F0 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r0, [r0, 0x1C]
	b _081049F6
	.align 2, 0
_081049F0: .4byte gSaveBlock2Ptr
_081049F4:
	movs r0, 0
_081049F6:
	pop {r1}
	bx r1
	thumb_func_end sub_81049CC

	thumb_func_start sub_81049FC
sub_81049FC: @ 81049FC
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	adds r0, r5, 0
	bl sub_81049CC
	adds r2, r0, 0
	lsrs r4, 20
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	str r6, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x8
	movs r3, 0x1
	bl LoadMonPicInWindow
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81049FC

	thumb_func_start sub_8104A34
sub_8104A34: @ 8104A34
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	mov r8, r0
	mov r9, r1
	adds r0, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x24]
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	bl SpeciesToNationalPokedexNum
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r2, _08104AAC @ =gUnknown_8415FFF
	str r6, [sp]
	movs r0, 0
	mov r10, r0
	str r0, [sp, 0x4]
	mov r0, r8
	mov r1, r9
	adds r3, r4, 0
	bl sub_81047C8
	adds r4, 0x9
	lsls r4, 24
	lsrs r4, 24
	str r6, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	mov r0, r8
	mov r1, r9
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8104880
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08104AAC: .4byte gUnknown_8415FFF
	thumb_func_end sub_8104A34

	thumb_func_start sub_8104AB0
sub_8104AB0: @ 8104AB0
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	lsls r2, 24
	cmp r2, 0
	beq _08104ACA
	adds r0, r3, 0
	bl SpeciesToNationalPokedexNum
	adds r3, r0, 0
_08104ACA:
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	lsrs r0, 19
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x7
	ands r3, r0
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r3
	lsrs r6, r0, 24
	movs r0, 0
	mov r12, r0
	cmp r5, 0x1
	beq _08104B14
	cmp r5, 0x1
	bgt _08104AF4
	cmp r5, 0
	beq _08104AFE
	b _08104BB0
_08104AF4:
	cmp r7, 0x2
	beq _08104B68
	cmp r7, 0x3
	beq _08104BA0
	b _08104BB0
_08104AFE:
	ldr r0, _08104B10 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	adds r0, 0x5C
	adds r0, r4
	ldrb r1, [r0]
	ands r1, r6
	cmp r1, 0
	beq _08104BB0
	b _08104B34
	.align 2, 0
_08104B10: .4byte gSaveBlock2Ptr
_08104B14:
	ldr r0, _08104B5C @ =gSaveBlock2Ptr
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x28
	adds r0, r4
	ldrb r1, [r0]
	ands r1, r6
	cmp r1, 0
	beq _08104BB0
	adds r0, r2, 0
	adds r0, 0x5C
	adds r0, r4
	ldrb r0, [r0]
	ands r0, r6
	cmp r1, r0
	bne _08104BB0
_08104B34:
	ldr r0, _08104B60 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r3, 0xBF
	lsls r3, 3
	adds r0, r2, r3
	adds r0, r4
	ldrb r0, [r0]
	ands r0, r6
	cmp r1, r0
	bne _08104BB0
	ldr r3, _08104B64 @ =0x00003a18
	adds r0, r2, r3
	adds r0, r4
	ldrb r0, [r0]
	ands r0, r6
	cmp r1, r0
	bne _08104BB0
	movs r0, 0x1
	mov r12, r0
	b _08104BB0
	.align 2, 0
_08104B5C: .4byte gSaveBlock2Ptr
_08104B60: .4byte gSaveBlock1Ptr
_08104B64: .4byte 0x00003a18
_08104B68:
	ldr r0, _08104B94 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	adds r1, 0x5C
	adds r1, r4
	ldrb r2, [r1]
	adds r0, r6, 0
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _08104B98 @ =gSaveBlock1Ptr
	ldr r1, [r3]
	movs r0, 0xBF
	lsls r0, 3
	adds r1, r0
	adds r1, r4
	ldrb r2, [r1]
	adds r0, r6, 0
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	ldr r3, _08104B9C @ =0x00003a18
	adds r1, r3
	b _08104BA6
	.align 2, 0
_08104B94: .4byte gSaveBlock2Ptr
_08104B98: .4byte gSaveBlock1Ptr
_08104B9C: .4byte 0x00003a18
_08104BA0:
	ldr r0, _08104BB8 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	adds r1, 0x28
_08104BA6:
	adds r1, r4
	ldrb r2, [r1]
	adds r0, r6, 0
	orrs r0, r2
	strb r0, [r1]
_08104BB0:
	mov r0, r12
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08104BB8: .4byte gSaveBlock2Ptr
	thumb_func_end sub_8104AB0

	thumb_func_start sub_8104BBC
sub_8104BBC: @ 8104BBC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r5, 0
	cmp r1, 0
	beq _08104BD2
	cmp r1, 0x1
	beq _08104BF8
	b _08104C1E
_08104BD2:
	movs r0, 0
_08104BD4:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08104BF0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08104BF0:
	adds r0, r4, 0
	cmp r0, 0x96
	bls _08104BD4
	b _08104C1E
_08104BF8:
	movs r0, 0
	ldr r7, _08104C28 @ =0x00000181
_08104BFC:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08104C18
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08104C18:
	adds r0, r4, 0
	cmp r0, r7
	bls _08104BFC
_08104C1E:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08104C28: .4byte 0x00000181
	thumb_func_end sub_8104BBC

	thumb_func_start sub_8104C2C
sub_8104C2C: @ 8104C2C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0x14
	negs r1, r1
	adds r3, r1, 0
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	adds r2, r4, 0
	bl sub_81047C8
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104C2C

	thumb_func_start sub_8104C64
sub_8104C64: @ 8104C64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x20
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	movs r0, 0xFF
	lsls r0, 24
	adds r2, r0
	lsrs r2, 24
	mov r9, r2
	ldr r1, _08104D50 @ =gUnknown_845228C
	ldr r2, _08104D54 @ =gUnknown_8452334
	mov r3, r9
	lsls r0, r3, 2
	adds r6, r0, r2
	ldr r0, [r6]
	lsls r4, r5, 2
	adds r0, r4, r0
	ldrb r2, [r0]
	ldrb r3, [r0, 0x1]
	movs r0, 0x8
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r5, 0x5
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	movs r0, 0x3
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r7, _08104D58 @ =gUnknown_203ACF0
	ldr r0, [r7]
	adds r0, 0x20
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08104D6C
	ldr r0, _08104D5C @ =gUnknown_84521C4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, [r6]
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, 8
	ldr r3, _08104D60 @ =0xffff00ff
	ldr r2, [sp, 0x18]
	ands r2, r3
	orrs r2, r0
	str r2, [sp, 0x18]
	ldr r0, [r6]
	adds r0, r4, r0
	ldrb r1, [r0, 0x1]
	lsls r1, 16
	ldr r0, _08104D64 @ =0xff00ffff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x18]
	adds r1, r5, 0x1
	lsls r1, 24
	lsrs r1, 16
	ldr r0, [sp, 0x1C]
	ands r0, r3
	orrs r0, r1
	lsls r1, r5, 6
	adds r1, 0x8
	lsls r1, 16
	ldr r2, _08104D68 @ =0x0000ffff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x1C]
	add r0, sp, 0x18
	bl AddWindow
	ldr r1, [r7]
	adds r1, 0x20
	adds r1, r5
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x20
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r7]
	adds r0, 0x20
	adds r0, r5
	ldrb r0, [r0]
	lsls r2, r5, 20
	movs r1, 0x80
	lsls r1, 13
	adds r2, r1
	lsrs r2, 16
	mov r1, r8
	bl sub_81049FC
	ldr r0, [r7]
	adds r0, 0x20
	adds r0, r5
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x20
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	b _08104D72
	.align 2, 0
_08104D50: .4byte gUnknown_845228C
_08104D54: .4byte gUnknown_8452334
_08104D58: .4byte gUnknown_203ACF0
_08104D5C: .4byte gUnknown_84521C4
_08104D60: .4byte 0xffff00ff
_08104D64: .4byte 0xff00ffff
_08104D68: .4byte 0x0000ffff
_08104D6C:
	ldrb r0, [r1]
	bl PutWindowTilemap
_08104D72:
	ldr r6, _08104E60 @ =gUnknown_203ACF0
	ldr r0, [r6]
	adds r0, 0x24
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08104E78
	mov r3, r8
	cmp r3, 0
	beq _08104E7E
	ldr r0, _08104E64 @ =gUnknown_84521CC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, _08104E68 @ =gUnknown_8452334
	mov r1, r9
	lsls r2, r1, 2
	adds r2, r0
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, r1, r0
	ldrb r0, [r0, 0x2]
	add r3, sp, 0x18
	movs r4, 0
	strb r0, [r3, 0x1]
	ldr r0, [r2]
	adds r0, r1, r0
	ldrb r0, [r0, 0x3]
	strb r0, [r3, 0x2]
	adds r1, r5
	lsls r1, 3
	movs r0, 0x84
	lsls r0, 1
	adds r1, r0
	strh r1, [r3, 0x6]
	adds r0, r3, 0
	bl AddWindow
	ldr r1, [r6]
	adds r1, 0x24
	adds r1, r5
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x24
	adds r0, r5
	ldrb r0, [r0]
	ldr r1, _08104E6C @ =gUnknown_8440124
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r0, [r6]
	adds r0, 0x24
	adds r0, r5
	ldrb r0, [r0]
	str r4, [sp]
	movs r1, 0
	mov r2, r8
	movs r3, 0xC
	bl sub_8104A34
	ldr r0, [r6]
	adds r0, 0x24
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0xB
	mov r2, r8
	muls r2, r1
	ldr r1, _08104E70 @ =gSpeciesNames
	adds r2, r1
	movs r1, 0xD
	str r1, [sp]
	str r4, [sp, 0x4]
	movs r1, 0x2
	movs r3, 0x2
	bl sub_81047C8
	mov r0, r8
	movs r1, 0x1
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08104E42
	ldr r0, [r6]
	adds r0, 0x24
	adds r0, r5
	ldrb r0, [r0]
	ldr r1, _08104E74 @ =gUnknown_8443600
	movs r3, 0x8
	str r3, [sp]
	str r3, [sp, 0x4]
	movs r2, 0x2
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	str r3, [sp, 0x14]
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
_08104E42:
	ldr r0, [r6]
	adds r0, 0x24
	adds r0, r5
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	adds r0, 0x24
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	b _08104E7E
	.align 2, 0
_08104E60: .4byte gUnknown_203ACF0
_08104E64: .4byte gUnknown_84521CC
_08104E68: .4byte gUnknown_8452334
_08104E6C: .4byte gUnknown_8440124
_08104E70: .4byte gSpeciesNames
_08104E74: .4byte gUnknown_8443600
_08104E78:
	ldrb r0, [r1]
	bl PutWindowTilemap
_08104E7E:
	movs r0, 0x1
	add sp, 0x20
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8104C64

	thumb_func_start sub_8104E90
sub_8104E90: @ 8104E90
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08104EBC @ =gUnknown_203ACF0
_08104E96:
	adds r1, r4, 0
	adds r1, 0x20
	ldr r0, [r5]
	adds r0, r1
	bl sub_81047B0
	adds r1, r4, 0
	adds r1, 0x24
	ldr r0, [r5]
	adds r0, r1
	bl sub_81047B0
	adds r4, 0x1
	cmp r4, 0x3
	ble _08104E96
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104EBC: .4byte gUnknown_203ACF0
	thumb_func_end sub_8104E90

	thumb_func_start sub_8104EC0
sub_8104EC0: @ 8104EC0
	push {r4,r5,lr}
	sub sp, 0x20
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r1, _08104F08 @ =gUnknown_8416002
	mov r0, sp
	bl StringCopy
	adds r1, r0, 0
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r1, r0, 0
	movs r0, 0xBA
	strb r0, [r1]
	adds r1, 0x1
	adds r0, r1, 0
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x2
	bl sub_8106E78
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104F08: .4byte gUnknown_8416002
	thumb_func_end sub_8104EC0

	thumb_func_start sub_8104F0C
sub_8104F0C: @ 8104F0C
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x1E
	str r0, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r5, 0x20
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r5, _08104F80 @ =gUnknown_203ACF0
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r0, [r0]
	adds r1, 0x2B
	ldrb r1, [r1]
	bl sub_81068DC
	movs r0, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	cmp r6, 0
	beq _08104F88
	ldr r1, _08104F84 @ =gUnknown_8452344
	ldr r0, [r5]
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl sub_8106E78
	b _08104FD0
	.align 2, 0
_08104F80: .4byte gUnknown_203ACF0
_08104F84: .4byte gUnknown_8452344
_08104F88:
	ldr r1, _08105048 @ =gUnknown_8452344
	ldr r0, [r5]
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl sub_8106E78
	ldr r0, [r5]
	adds r0, 0x2B
	ldrb r0, [r0]
	bl sub_8106AF8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, [r5]
	adds r0, 0x2A
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	bl sub_8106AF8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	adds r1, r4, 0
	movs r3, 0xA0
	bl sub_8104EC0
_08104FD0:
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	cmp r6, 0
	bne _08104FEA
	ldr r0, _0810504C @ =gUnknown_8415F6C
	bl sub_8104C2C
_08104FEA:
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r5, _08105050 @ =gUnknown_203ACF0
	ldr r1, [r5]
	ldrh r0, [r1, 0x18]
	ldr r4, _08105054 @ =0x0000ffff
	cmp r0, r4
	beq _08105008
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r1, 0
	bl sub_8104C64
_08105008:
	ldr r1, [r5]
	ldrh r0, [r1, 0x1A]
	cmp r0, r4
	beq _0810501A
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r1, 0x1
	bl sub_8104C64
_0810501A:
	ldr r1, [r5]
	ldrh r0, [r1, 0x1C]
	cmp r0, r4
	beq _0810502C
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r1, 0x2
	bl sub_8104C64
_0810502C:
	ldr r1, [r5]
	ldrh r0, [r1, 0x1E]
	cmp r0, r4
	beq _0810503E
	adds r1, 0x2C
	ldrb r2, [r1]
	movs r1, 0x3
	bl sub_8104C64
_0810503E:
	movs r0, 0
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08105048: .4byte gUnknown_8452344
_0810504C: .4byte gUnknown_8415F6C
_08105050: .4byte gUnknown_203ACF0
_08105054: .4byte 0x0000ffff
	thumb_func_end sub_8104F0C

	thumb_func_start sub_8105058
sub_8105058: @ 8105058
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	cmp r0, 0xFF
	bne _081050C0
	ldr r7, _081050B4 @ =gUnknown_84406C8
	movs r6, 0xB0
	lsls r6, 15
	movs r5, 0xA4
	lsls r5, 15
	movs r4, 0x3
_0810507A:
	lsrs r1, r5, 16
	adds r0, r7, 0
	movs r2, 0x2
	bl LoadPalette
	lsrs r1, r6, 16
	adds r0, r7, 0x2
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0x80
	lsls r0, 13
	adds r6, r0
	adds r5, r0
	subs r4, 0x1
	cmp r4, 0
	bge _0810507A
	ldr r0, _081050B4 @ =gUnknown_84406C8
	ldr r1, _081050B8 @ =0x00000141
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _081050BC @ =gUnknown_203ACF0
	ldr r0, [r0]
	adds r0, 0x2E
	movs r1, 0
	strb r1, [r0]
	b _0810515E
	.align 2, 0
_081050B4: .4byte gUnknown_84406C8
_081050B8: .4byte 0x00000141
_081050BC: .4byte gUnknown_203ACF0
_081050C0:
	ldr r2, _08105120 @ =gUnknown_203ACF0
	ldr r1, [r2]
	adds r1, 0x2E
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x2E
	ldrb r0, [r1]
	cmp r0, 0x10
	bne _081050DC
	movs r0, 0
	strb r0, [r1]
_081050DC:
	ldr r0, [r2]
	adds r0, 0x2E
	ldrb r0, [r0]
	lsrs r7, r0, 2
	movs r4, 0
	lsls r0, r7, 2
	mov r8, r0
	ldr r0, _08105124 @ =gUnknown_84406CC
	mov r10, r0
	movs r6, 0xB0
	lsls r6, 15
	movs r5, 0xA4
	lsls r5, 15
	movs r0, 0x4
	negs r0, r0
	add r0, r10
	mov r9, r0
_081050FE:
	ldr r0, [sp]
	cmp r4, r0
	bne _0810512C
	lsrs r1, r5, 16
	mov r0, r8
	add r0, r10
	movs r2, 0x2
	bl LoadPalette
	lsrs r1, r6, 16
	ldr r0, _08105128 @ =gUnknown_84406CE
	add r0, r8
	movs r2, 0x2
	bl LoadPalette
	b _08105142
	.align 2, 0
_08105120: .4byte gUnknown_203ACF0
_08105124: .4byte gUnknown_84406CC
_08105128: .4byte gUnknown_84406CE
_0810512C:
	lsrs r1, r5, 16
	mov r0, r9
	movs r2, 0x2
	bl LoadPalette
	lsrs r1, r6, 16
	mov r0, r9
	adds r0, 0x2
	movs r2, 0x2
	bl LoadPalette
_08105142:
	lsls r1, r7, 2
	movs r0, 0x80
	lsls r0, 13
	adds r6, r0
	adds r5, r0
	adds r4, 0x1
	cmp r4, 0x3
	ble _081050FE
	ldr r0, _08105170 @ =gUnknown_84406CC
	adds r0, r1, r0
	ldr r1, _08105174 @ =0x00000141
	movs r2, 0x2
	bl LoadPalette
_0810515E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105170: .4byte gUnknown_84406CC
_08105174: .4byte 0x00000141
	thumb_func_end sub_8105058

	thumb_func_start sub_8105178
sub_8105178: @ 8105178
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsls r2, 24
	movs r3, 0xFF
	lsls r3, 24
	adds r2, r3
	ldr r3, _081051A8 @ =gUnknown_8452334
	lsrs r2, 22
	adds r2, r3
	ldr r2, [r2]
	lsrs r1, 22
	adds r1, r2
	ldrb r3, [r1, 0x2]
	lsls r3, 3
	ldrb r2, [r1, 0x3]
	lsls r2, 3
	adds r1, r3, 0
	movs r3, 0
	bl ListMenuUpdateCursorObject
	pop {r0}
	bx r0
	.align 2, 0
_081051A8: .4byte gUnknown_8452334
	thumb_func_end sub_8105178

	thumb_func_start sub_81051AC
sub_81051AC: @ 81051AC
	push {lr}
	lsls r1, 24
	lsls r3, 24
	lsrs r1, 23
	adds r1, r0, r1
	lsrs r3, 23
	adds r2, r3
	movs r3, 0x13
_081051BC:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, 0x40
	adds r1, 0x40
	subs r3, 0x1
	cmp r3, 0
	bge _081051BC
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_81051AC

	thumb_func_start sub_81051D0
sub_81051D0: @ 81051D0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 24
	lsrs r2, 23
	adds r1, r2
	movs r2, 0x13
_081051DE:
	strh r0, [r1]
	adds r1, 0x40
	subs r2, 0x1
	cmp r2, 0
	bge _081051DE
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_81051D0

	thumb_func_start sub_81051F0
sub_81051F0: @ 81051F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetBgTilemapBuffer
	mov r10, r0
	movs r0, 0x2
	bl GetBgTilemapBuffer
	mov r9, r0
	movs r0, 0x3
	bl GetBgTilemapBuffer
	mov r8, r0
	ldr r0, _0810526C @ =gUnknown_203ACF0
	ldr r0, [r0]
	ldr r0, [r0, 0x5C]
	movs r1, 0x80
	lsls r1, 5
	adds r1, r0, r1
	str r1, [sp, 0x4]
	movs r1, 0x80
	lsls r1, 4
	adds r1, r0, r1
	str r1, [sp, 0x8]
	str r0, [sp, 0xC]
	movs r0, 0
	str r0, [sp]
	ldr r1, _08105270 @ =gUnknown_8452388
	movs r7, 0
	lsls r0, r4, 4
	subs r0, r4
	lsls r0, 1
	adds r6, r0, r1
_08105242:
	ldrb r4, [r6]
	cmp r4, 0x1E
	bne _08105274
	lsrs r4, r7, 24
	movs r0, 0
	mov r1, r10
	adds r2, r4, 0
	bl sub_81051D0
	movs r0, 0
	mov r1, r9
	adds r2, r4, 0
	bl sub_81051D0
	movs r0, 0xC
	mov r1, r8
	adds r2, r4, 0
	bl sub_81051D0
	b _0810529A
	.align 2, 0
_0810526C: .4byte gUnknown_203ACF0
_08105270: .4byte gUnknown_8452388
_08105274:
	lsrs r5, r7, 24
	ldr r0, [sp, 0x4]
	adds r1, r4, 0
	mov r2, r10
	adds r3, r5, 0
	bl sub_81051AC
	ldr r0, [sp, 0x8]
	adds r1, r4, 0
	mov r2, r9
	adds r3, r5, 0
	bl sub_81051AC
	ldr r0, [sp, 0xC]
	adds r1, r4, 0
	mov r2, r8
	adds r3, r5, 0
	bl sub_81051AC
_0810529A:
	movs r1, 0x80
	lsls r1, 17
	adds r7, r1
	adds r6, 0x1
	ldr r0, [sp]
	adds r0, 0x1
	str r0, [sp]
	cmp r0, 0x1D
	ble _08105242
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81051F0

	thumb_func_start sub_81052D0
sub_81052D0: @ 81052D0
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	bl IsNationalPokedexEnabled
	cmp r0, 0
	beq _081052E8
	ldr r0, _081052E4 @ =gUnknown_84406E0
	b _081052EA
	.align 2, 0
_081052E4: .4byte gUnknown_84406E0
_081052E8:
	ldr r0, _08105304 @ =gUnknown_84404C8
_081052EA:
	ldrh r4, [r0, 0xE]
	ldr r1, _08105308 @ =gUnknown_203ACF0
	ldr r0, [r1]
	ldrb r0, [r0, 0x2]
	adds r5, r1, 0
	cmp r0, 0x9
	bls _081052FA
	b _0810557C
_081052FA:
	lsls r0, 2
	ldr r1, _0810530C @ =_08105310
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08105304: .4byte gUnknown_84404C8
_08105308: .4byte gUnknown_203ACF0
_0810530C: .4byte _08105310
	.align 2, 0
_08105310:
	.4byte _08105338
	.4byte _08105358
	.4byte _08105364
	.4byte _08105384
	.4byte _081053DC
	.4byte _0810547C
	.4byte _08105492
	.4byte _081054F0
	.4byte _08105528
	.4byte _0810555C
_08105338:
	movs r0, 0xC0
	lsls r0, 5
	bl Alloc
	ldr r1, _08105350 @ =gUnknown_203ACF0
	ldr r1, [r1]
	str r0, [r1, 0x5C]
	cmp r6, 0
	beq _08105354
	movs r0, 0x6
	b _0810557A
	.align 2, 0
_08105350: .4byte gUnknown_203ACF0
_08105354:
	movs r0, 0x2
	b _0810557A
_08105358:
	ldr r0, [r5]
	ldr r0, [r0, 0x5C]
	bl Free
	movs r0, 0x1
	b _0810557E
_08105364:
	ldr r0, _0810537C @ =0x00007fff
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08105380 @ =gUnknown_203ACF0
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	b _0810557A
	.align 2, 0
_0810537C: .4byte 0x00007fff
_08105380: .4byte gUnknown_203ACF0
_08105384:
	movs r0, 0x1E
	str r0, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0xC
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r5, 0x20
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r0, _081053D8 @ =gUnknown_203ACF0
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	b _0810557A
	.align 2, 0
_081053D8: .4byte gUnknown_203ACF0
_081053DC:
	ldr r0, _08105474 @ =0x00007fff
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl sub_8104F0C
	movs r0, 0x3
	bl GetBgTilemapBuffer
	ldr r6, _08105478 @ =gUnknown_203ACF0
	ldr r1, [r6]
	ldr r1, [r1, 0x5C]
	movs r4, 0x80
	lsls r4, 2
	adds r2, r4, 0
	bl CpuFastSet
	movs r0, 0x2
	bl GetBgTilemapBuffer
	ldr r1, [r6]
	ldr r1, [r1, 0x5C]
	movs r2, 0x80
	lsls r2, 4
	adds r1, r2
	adds r2, r4, 0
	bl CpuFastSet
	movs r0, 0x1
	bl GetBgTilemapBuffer
	ldr r1, [r6]
	ldr r1, [r1, 0x5C]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r2
	adds r2, r4, 0
	bl CpuFastSet
	movs r0, 0x1E
	str r0, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0xC
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r5, 0x20
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, [r6]
	movs r0, 0
	strb r0, [r1, 0x3]
	ldr r1, [r6]
	b _081054DC
	.align 2, 0
_08105474: .4byte 0x00007fff
_08105478: .4byte gUnknown_203ACF0
_0810547C:
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	cmp r0, 0x9
	bhi _08105578
	bl sub_81051F0
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	b _0810557C
_08105492:
	movs r0, 0x3
	bl GetBgTilemapBuffer
	ldr r4, _081054EC @ =gUnknown_203ACF0
	ldr r1, [r4]
	ldr r1, [r1, 0x5C]
	movs r5, 0x80
	lsls r5, 2
	adds r2, r5, 0
	bl CpuFastSet
	movs r0, 0x2
	bl GetBgTilemapBuffer
	ldr r1, [r4]
	ldr r1, [r1, 0x5C]
	movs r2, 0x80
	lsls r2, 4
	adds r1, r2
	adds r2, r5, 0
	bl CpuFastSet
	movs r0, 0x1
	bl GetBgTilemapBuffer
	ldr r1, [r4]
	ldr r1, [r1, 0x5C]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r2
	adds r2, r5, 0
	bl CpuFastSet
	ldr r1, [r4]
	movs r0, 0x9
	strb r0, [r1, 0x3]
	ldr r1, [r4]
_081054DC:
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0x6B
	bl PlaySE
	b _0810557C
	.align 2, 0
_081054EC: .4byte gUnknown_203ACF0
_081054F0:
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	beq _08105506
	bl sub_81051F0
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	b _0810557C
_08105506:
	ldrb r0, [r1, 0x2]
	bl sub_81051F0
	ldr r0, _08105524 @ =0x00007fff
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	b _0810557A
	.align 2, 0
_08105524: .4byte 0x00007fff
_08105528:
	ldr r2, _08105554 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0
	bl sub_8104F0C
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	ldr r0, _08105558 @ =gUnknown_203ACF0
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	b _0810557A
	.align 2, 0
_08105554: .4byte gPaletteFade
_08105558: .4byte gUnknown_203ACF0
_0810555C:
	ldr r2, _08105588 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0810558C @ =0x00007fff
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08105590 @ =gUnknown_203ACF0
	ldr r1, [r0]
_08105578:
	movs r0, 0x1
_0810557A:
	strb r0, [r1, 0x2]
_0810557C:
	movs r0, 0
_0810557E:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08105588: .4byte gPaletteFade
_0810558C: .4byte 0x00007fff
_08105590: .4byte gUnknown_203ACF0
	thumb_func_end sub_81052D0

	thumb_func_start sub_8105594
sub_8105594: @ 8105594
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _081055C0 @ =gUnknown_203ACF0
	ldr r3, [r0]
	adds r2, r3, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	cmp r0, 0
	bne _081055C8
	ldr r0, _081055C4 @ =gUnknown_8452334
	ldr r0, [r0]
	ldrb r3, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	b _081055E2
	.align 2, 0
_081055C0: .4byte gUnknown_203ACF0
_081055C4: .4byte gUnknown_8452334
_081055C8:
	ldr r1, _08105634 @ =gUnknown_8452334
	ldrb r0, [r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x2D
	ldrb r1, [r1]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrb r3, [r1, 0x2]
	ldrb r1, [r1, 0x3]
_081055E2:
	lsls r0, r4, 26
	movs r2, 0xC0
	lsls r2, 19
	adds r0, r2
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r2, r4, 1
	adds r0, r2, 0x3
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x8]
	cmp r0, 0x1B
	bls _08105602
	movs r0, 0x1C
	str r0, [sp, 0x8]
_08105602:
	ldr r0, [sp, 0xC]
	cmp r0, 0xD
	bls _0810560C
	movs r0, 0xE
	str r0, [sp, 0xC]
_0810560C:
	subs r0, r3, r2
	lsls r0, 16
	subs r1, r4
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x10]
	lsrs r6, r0, 16
	asrs r1, r0, 16
	ldr r2, [sp, 0x8]
	adds r0, r1, r2
	adds r0, 0x2
	cmp r0, 0x1D
	ble _08105638
	adds r0, r1, 0
	adds r0, 0x1C
	adds r1, r6, r2
	subs r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	b _0810563E
	.align 2, 0
_08105634: .4byte gUnknown_8452334
_08105638:
	cmp r1, 0
	bge _0810563E
	movs r6, 0
_0810563E:
	ldr r3, [sp, 0x10]
	lsls r0, r3, 16
	asrs r1, r0, 16
	ldr r2, [sp, 0xC]
	adds r0, r1, r2
	adds r0, 0x2
	cmp r0, 0x11
	ble _0810565E
	adds r0, r1, 0
	adds r0, 0x10
	adds r1, r3, r2
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	b _08105666
_0810565E:
	cmp r1, 0x1
	bgt _08105666
	movs r3, 0x2
	str r3, [sp, 0x10]
_08105666:
	ldr r1, [sp, 0xC]
	lsrs r0, r1, 1
	adds r0, 0x2
	ldr r2, [sp, 0x10]
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	add r10, r0
	mov r3, r10
	lsls r3, 16
	lsrs r3, 16
	mov r10, r3
	lsls r2, r6, 24
	lsrs r2, 24
	str r2, [sp, 0x14]
	ldr r0, [sp, 0x10]
	lsls r4, r0, 24
	lsrs r4, 24
	movs r5, 0x1
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x4
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	adds r6, 0x1
	lsls r2, r6, 24
	lsrs r2, 24
	str r2, [sp, 0x18]
	ldr r1, [sp, 0x8]
	str r1, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x5
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057EC @ =0x00000404
	ldr r2, [sp, 0x8]
	lsls r2, 24
	asrs r2, 24
	mov r8, r2
	add r8, r6
	mov r3, r8
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r6, [sp, 0x10]
	adds r6, 0x1
	ldr r0, [sp, 0xC]
	lsls r4, r0, 24
	asrs r4, 24
	adds r4, r6
	lsls r4, 24
	lsrs r4, 24
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0xA
	ldr r2, [sp, 0x14]
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, [sp, 0x8]
	str r1, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0xB
	ldr r2, [sp, 0x18]
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057F0 @ =0x0000040a
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	adds r3, r4, 0
	bl FillBgTilemapBufferRect_Palette0
	lsls r3, r6, 24
	lsrs r3, 24
	str r3, [sp, 0x1C]
	str r5, [sp]
	mov r2, r10
	ldr r3, [sp, 0x10]
	subs r6, r2, r3
	subs r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x6
	ldr r2, [sp, 0x14]
	ldr r3, [sp, 0x1C]
	bl FillBgTilemapBufferRect_Palette0
	mov r0, r10
	lsls r3, r0, 24
	lsrs r3, 24
	str r3, [sp, 0x20]
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x7
	ldr r2, [sp, 0x14]
	bl FillBgTilemapBufferRect_Palette0
	movs r1, 0x1
	add r1, r10
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	str r5, [sp]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	adds r4, r2, r3
	mov r0, r10
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x9
	ldr r2, [sp, 0x14]
	mov r3, r9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057F4 @ =0x00000406
	str r5, [sp]
	str r6, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	ldr r3, [sp, 0x1C]
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057F8 @ =0x00000407
	str r5, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	ldr r3, [sp, 0x20]
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081057FC @ =0x00000409
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r7, 0
	mov r2, r8
	mov r3, r9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, [sp, 0x8]
	str r1, [sp]
	str r6, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x1
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl FillBgTilemapBufferRect_Palette0
	ldr r2, [sp, 0x8]
	str r2, [sp]
	str r5, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x8
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x20]
	bl FillBgTilemapBufferRect_Palette0
	ldr r3, [sp, 0x8]
	str r3, [sp]
	str r4, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x2
	ldr r2, [sp, 0x18]
	mov r3, r9
	bl FillBgTilemapBufferRect_Palette0
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081057EC: .4byte 0x00000404
_081057F0: .4byte 0x0000040a
_081057F4: .4byte 0x00000406
_081057F8: .4byte 0x00000407
_081057FC: .4byte 0x00000409
	thumb_func_end sub_8105594

	thumb_func_start sub_8105800
sub_8105800: @ 8105800
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	adds r0, r1, 0
	bl SpeciesToNationalPokedexNum
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r2, _08105860 @ =gPokedexEntries
	adds r5, r1, r2
	movs r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08105864
	ldrb r0, [r5]
	cmp r0, 0
	beq _08105878
_08105840:
	mov r1, sp
	adds r1, r4
	adds r1, 0x8
	adds r0, r5, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08105878
	cmp r4, 0xA
	bls _08105840
	b _08105878
	.align 2, 0
_08105860: .4byte gPokedexEntries
_08105864:
	movs r1, 0xAC
_08105866:
	mov r0, sp
	adds r0, r4
	adds r0, 0x8
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _08105866
_08105878:
	mov r1, sp
	adds r1, r4
	adds r1, 0x8
	movs r0, 0xFF
	strb r0, [r1]
	str r7, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	mov r0, r8
	movs r1, 0
	add r2, sp, 0x8
	adds r3, r6, 0
	bl sub_81047C8
	movs r0, 0
	add r1, sp, 0x8
	movs r2, 0
	bl GetStringWidth
	adds r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _081058C0 @ =gUnknown_8415F8F
	str r7, [sp]
	str r4, [sp, 0x4]
	mov r0, r8
	movs r1, 0
	adds r3, r6, 0
	bl sub_81047C8
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081058C0: .4byte gUnknown_8415F8F
	thumb_func_end sub_8105800

	thumb_func_start sub_81058C4
sub_81058C4: @ 81058C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	adds r0, r1, 0
	bl SpeciesToNationalPokedexNum
	ldr r2, _08105974 @ =gPokedexEntries
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r4, [r1, 0xC]
	ldr r1, _08105978 @ =gUnknown_8415F98
	mov r10, r1
	movs r3, 0
	add r2, sp, 0x8
	movs r1, 0xFC
	strb r1, [r2]
	adds r2, 0x1
	movs r1, 0x14
	strb r1, [r2]
	adds r2, 0x1
	movs r1, 0x5
	strb r1, [r2]
	mov r1, sp
	adds r1, 0xB
	strb r3, [r1]
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _081059CE
	ldr r0, _0810597C @ =0x00002710
	muls r0, r4
	movs r1, 0xFE
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0xA
	bl __umodsi3
	cmp r0, 0x4
	bls _0810593A
	adds r5, 0xA
_0810593A:
	adds r0, r5, 0
	movs r1, 0x78
	bl __udivsi3
	adds r6, r0, 0
	lsls r0, r6, 4
	subs r0, r6
	lsls r0, 3
	subs r0, r5, r0
	movs r1, 0xA
	bl __udivsi3
	adds r5, r0, 0
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	adds r2, r0, 0
	cmp r2, 0
	bne _08105980
	add r0, sp, 0xC
	strb r2, [r0]
	mov r1, sp
	adds r1, 0xD
	adds r0, r6, 0
	adds r0, 0xA1
	strb r0, [r1]
	b _08105998
	.align 2, 0
_08105974: .4byte gPokedexEntries
_08105978: .4byte gUnknown_8415F98
_0810597C: .4byte 0x00002710
_08105980:
	add r1, sp, 0xC
	adds r0, r2, 0
	adds r0, 0xA1
	strb r0, [r1]
	mov r4, sp
	adds r4, 0xD
	adds r0, r6, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
_08105998:
	mov r1, sp
	adds r1, 0xE
	movs r0, 0xB4
	strb r0, [r1]
	mov r4, sp
	adds r4, 0xF
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	add r4, sp, 0x10
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
	mov r1, sp
	adds r1, 0x11
	movs r0, 0xB2
	strb r0, [r1]
	movs r2, 0xB
	adds r1, 0x1
	movs r0, 0xFF
	b _081059F2
_081059CE:
	add r0, sp, 0xC
	movs r1, 0xAC
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	mov r2, sp
	adds r2, 0xE
	movs r0, 0xB4
	strb r0, [r2]
	mov r0, sp
	adds r0, 0xF
	strb r1, [r0]
	add r0, sp, 0x10
	strb r1, [r0]
	movs r2, 0xA
	mov r1, sp
	adds r1, 0x11
	movs r0, 0xB2
_081059F2:
	strb r0, [r1]
	mov r1, sp
	adds r1, r2
	adds r1, 0x8
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, r8
	str r0, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	mov r0, r9
	movs r1, 0
	mov r2, r10
	adds r3, r7, 0
	bl sub_81047C8
	adds r0, r7, 0
	adds r0, 0x1E
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, r8
	str r1, [sp]
	str r4, [sp, 0x4]
	mov r0, r9
	movs r1, 0
	add r2, sp, 0x8
	adds r3, r7, 0
	bl sub_81047C8
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81058C4

	thumb_func_start sub_8105A3C
sub_8105A3C: @ 8105A3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	adds r0, r1, 0
	bl SpeciesToNationalPokedexNum
	ldr r2, _08105ACC @ =gPokedexEntries
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r4, [r1, 0xE]
	add r2, sp, 0x8
	movs r1, 0xFC
	strb r1, [r2]
	adds r2, 0x1
	movs r1, 0x14
	strb r1, [r2]
	adds r2, 0x1
	movs r1, 0x5
	strb r1, [r2]
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	bne _08105A92
	b _08105BC4
_08105A92:
	ldr r7, _08105AD0 @ =0x000186a0
	adds r0, r4, 0
	muls r0, r7
	ldr r1, _08105AD4 @ =0x000011b8
	bl __divsi3
	adds r6, r0, 0
	movs r1, 0xA
	bl __umodsi3
	cmp r0, 0x4
	bls _08105AAC
	adds r6, 0xA
_08105AAC:
	movs r5, 0
	mov r4, sp
	adds r4, 0xB
	adds r0, r6, 0
	adds r1, r7, 0
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	bne _08105AD8
	movs r7, 0x4
	strb r5, [r4]
	b _08105ADC
	.align 2, 0
_08105ACC: .4byte gPokedexEntries
_08105AD0: .4byte 0x000186a0
_08105AD4: .4byte 0x000011b8
_08105AD8:
	movs r5, 0x1
	movs r7, 0x4
_08105ADC:
	ldr r1, _08105B14 @ =0x000186a0
	adds r0, r6, 0
	bl __umodsi3
	adds r6, r0, 0
	mov r4, sp
	adds r4, r7
	adds r4, 0x8
	ldr r1, _08105B18 @ =0x00002710
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	bne _08105B1C
	cmp r5, 0
	bne _08105B1C
	adds r0, r7, 0
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r7, r1, 24
	add r0, sp
	adds r0, 0x8
	strb r5, [r0]
	b _08105B24
	.align 2, 0
_08105B14: .4byte 0x000186a0
_08105B18: .4byte 0x00002710
_08105B1C:
	movs r5, 0x1
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08105B24:
	ldr r1, _08105B5C @ =0x00002710
	adds r0, r6, 0
	bl __umodsi3
	adds r6, r0, 0
	mov r4, sp
	adds r4, r7
	adds r4, 0x8
	movs r1, 0xFA
	lsls r1, 2
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	bne _08105B60
	cmp r5, 0
	bne _08105B60
	adds r0, r7, 0
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r7, r1, 24
	add r0, sp
	adds r0, 0x8
	strb r5, [r0]
	b _08105B66
	.align 2, 0
_08105B5C: .4byte 0x00002710
_08105B60:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08105B66:
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r6, 0
	bl __umodsi3
	adds r6, r0, 0
	adds r1, r7, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r5, r7, 0
	mov r4, sp
	adds r4, r1
	adds r4, 0x8
	adds r0, r6, 0
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	adds r0, r6, 0
	movs r1, 0x64
	bl __umodsi3
	adds r6, r0, 0
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	movs r0, 0xAD
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	mov r4, sp
	adds r4, r2
	adds r4, 0x8
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	b _08105BE6
_08105BC4:
	mov r0, sp
	adds r0, 0xB
	movs r2, 0xAC
	strb r2, [r0]
	add r0, sp, 0xC
	strb r2, [r0]
	adds r0, 0x1
	strb r2, [r0]
	adds r0, 0x1
	strb r2, [r0]
	mov r1, sp
	adds r1, 0xF
	movs r0, 0xAD
	strb r0, [r1]
	movs r7, 0x9
	add r0, sp, 0x10
	strb r2, [r0]
_08105BE6:
	adds r1, r7, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	mov r0, sp
	adds r0, r1
	adds r0, 0x8
	movs r4, 0
	strb r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r3, r7, 0
	mov r1, sp
	adds r1, r2
	adds r1, 0x8
	movs r0, 0xFC
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	mov r1, sp
	adds r1, r3
	adds r1, 0x8
	movs r0, 0x14
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, sp
	adds r0, r2
	adds r0, 0x8
	strb r4, [r0]
	movs r2, 0
	movs r0, 0x21
	subs r1, r0, r7
	mov r5, r8
	adds r5, 0x1E
	cmp r2, r1
	bcs _08105C60
	ldr r3, _08105CA8 @ =gUnknown_8415FA0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _08105C60
	adds r3, r1, 0
	ldr r4, _08105CA8 @ =gUnknown_8415FA0
	adds r1, r7, 0
	add r1, sp
	adds r1, 0x8
_08105C4C:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x1
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, r3
	bcs _08105C60
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _08105C4C
_08105C60:
	adds r0, r7, r2
	mov r1, sp
	adds r1, r0
	adds r1, 0x8
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, r9
	str r0, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	mov r0, r10
	movs r1, 0
	ldr r2, _08105CAC @ =gUnknown_8415F9B
	mov r3, r8
	bl sub_81047C8
	lsls r0, r5, 24
	lsrs r0, 24
	mov r8, r0
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	mov r0, r10
	movs r1, 0
	add r2, sp, 0x8
	mov r3, r8
	bl sub_81047C8
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105CA8: .4byte gUnknown_8415FA0
_08105CAC: .4byte gUnknown_8415F9B
	thumb_func_end sub_8105A3C

	thumb_func_start sub_8105CB0
sub_8105CB0: @ 8105CB0
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	adds r0, r1, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08105D5C
	ldr r1, _08105D44 @ =gPokedexEntries
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, 0x10
	adds r0, r1
	ldr r1, [r0]
	str r1, [sp]
	mov r0, sp
	movs r3, 0
	strb r6, [r0, 0x4]
	mov r2, sp
	movs r0, 0x2
	strb r0, [r2, 0x5]
	movs r0, 0x1
	strb r0, [r2, 0xA]
	mov r0, sp
	strb r3, [r0, 0xB]
	mov r4, sp
	ldrb r3, [r4, 0xC]
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r4, 0xC]
	mov r3, sp
	movs r0, 0x10
	strb r0, [r3, 0xC]
	ldrb r0, [r3, 0xD]
	ands r2, r0
	strb r2, [r3, 0xD]
	mov r2, sp
	movs r0, 0x20
	strb r0, [r2, 0xD]
	movs r0, 0x2
	movs r2, 0
	bl GetStringWidth
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	adds r0, r5, r1
	cmp r0, 0
	ble _08105D48
	lsls r0, 24
	lsrs r5, r0, 24
	b _08105D4A
	.align 2, 0
_08105D44: .4byte gPokedexEntries
_08105D48:
	movs r5, 0
_08105D4A:
	mov r0, sp
	strb r5, [r0, 0x6]
	strb r7, [r0, 0x7]
	strb r5, [r0, 0x8]
	strb r7, [r0, 0x9]
	movs r1, 0xFF
	movs r2, 0
	bl AddTextPrinter
_08105D5C:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8105CB0

	thumb_func_start sub_8105D64
sub_8105D64: @ 8105D64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _08105E02
	ldr r1, _08105E14 @ =gUnknown_843FAB0
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	mov r12, r0
	ldr r7, _08105E18 @ =gDecompressionBuffer
	movs r5, 0
	movs r1, 0
_08105DA6:
	mov r2, r12
	adds r0, r2, r1
	ldrb r3, [r0]
	movs r4, 0
	adds r6, r1, 0x1
_08105DB0:
	lsls r1, r4, 1
	adds r2, r3, 0
	asrs r2, r1
	movs r0, 0x1
	ands r2, r0
	movs r0, 0x2
	lsls r0, r1
	ands r0, r3
	cmp r0, 0
	beq _08105DC8
	movs r0, 0x10
	orrs r2, r0
_08105DC8:
	adds r0, r7, r5
	strb r2, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08105DB0
	lsls r0, r6, 16
	lsrs r1, r0, 16
	cmp r1, 0x1F
	bls _08105DA6
	movs r0, 0x10
	str r0, [sp]
	str r0, [sp, 0x4]
	mov r1, r9
	str r1, [sp, 0x8]
	mov r2, r8
	str r2, [sp, 0xC]
	str r0, [sp, 0x10]
	str r0, [sp, 0x14]
	mov r0, r10
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
_08105E02:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105E14: .4byte gUnknown_843FAB0
_08105E18: .4byte gDecompressionBuffer
	thumb_func_end sub_8105D64

	thumb_func_start sub_8105E1C
sub_8105E1C: @ 8105E1C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x3
	movs r1, 0x6
	bl sub_8105594
	movs r4, 0x1E
	str r4, [sp]
	movs r5, 0x14
	str r5, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r0, _08105FD0 @ =gUnknown_84521D4
	bl AddWindow
	ldr r4, _08105FD4 @ =gUnknown_203ACF0
	ldr r1, [r4]
	adds r1, 0x4A
	movs r2, 0
	mov r8, r2
	strb r0, [r1]
	ldr r0, _08105FD8 @ =gUnknown_84521DC
	bl AddWindow
	ldr r1, [r4]
	adds r1, 0x4B
	strb r0, [r1]
	ldr r0, _08105FDC @ =gUnknown_84521E4
	bl AddWindow
	ldr r1, [r4]
	adds r1, 0x4C
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x4A
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4A
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0x90
	bl sub_81049FC
	ldr r0, [r4]
	adds r0, 0x4A
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	adds r0, 0x4A
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	adds r0, 0x4B
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r2, [r1]
	movs r5, 0x8
	str r5, [sp]
	movs r1, 0
	movs r3, 0
	bl sub_8104A34
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r2, [r1]
	movs r1, 0xB
	muls r2, r1
	ldr r1, _08105FE0 @ =gSpeciesNames
	adds r2, r1
	str r5, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r1, 0x2
	movs r3, 0x1C
	bl sub_81047C8
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0x18
	bl sub_8105800
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0x24
	bl sub_81058C4
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0x30
	bl sub_8105A3C
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4B
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0x58
	movs r3, 0x28
	bl sub_8105D64
	ldr r0, [r4]
	adds r0, 0x4B
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	adds r0, 0x4B
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	adds r0, 0x4C
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4C
	ldrb r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	movs r2, 0
	movs r3, 0x8
	bl sub_8105CB0
	ldr r0, [r4]
	adds r0, 0x4C
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	adds r0, 0x4C
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	cmp r6, 0
	bne _08105FEC
	ldr r2, _08105FE4 @ =gUnknown_8415FAD
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0x8
	bl sub_81047C8
	ldr r0, _08105FE8 @ =gUnknown_8415FB3
	bl sub_8104C2C
	b _08105FF2
	.align 2, 0
_08105FD0: .4byte gUnknown_84521D4
_08105FD4: .4byte gUnknown_203ACF0
_08105FD8: .4byte gUnknown_84521DC
_08105FDC: .4byte gUnknown_84521E4
_08105FE0: .4byte gSpeciesNames
_08105FE4: .4byte gUnknown_8415FAD
_08105FE8: .4byte gUnknown_8415FB3
_08105FEC:
	ldr r0, _08106010 @ =gUnknown_8415FC8
	bl sub_8104C2C
_08105FF2:
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08106010: .4byte gUnknown_8415FC8
	thumb_func_end sub_8105E1C

	thumb_func_start sub_8106014
sub_8106014: @ 8106014
	push {r4,lr}
	ldr r4, _08106038 @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r0, 0x4A
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x4B
	bl sub_81047B0
	ldr r0, [r4]
	adds r0, 0x4C
	bl sub_81047B0
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08106038: .4byte gUnknown_203ACF0
	thumb_func_end sub_8106014

	thumb_func_start sub_810603C
sub_810603C: @ 810603C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r6, _08106424 @ =gUnknown_203ACF0
	ldr r0, [r6]
	adds r0, 0x5A
	ldrh r0, [r0]
	str r0, [sp, 0x1C]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
	ldr r0, [sp, 0x1C]
	movs r1, 0x1
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r7, 0x1C
	movs r0, 0xE
	mov r8, r0
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106428 @ =0x00000404
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1D
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _0810642C @ =0x00000804
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0x11
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106430 @ =0x00000c04
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1D
	movs r3, 0x11
	bl FillBgTilemapBufferRect_Palette0
	str r7, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x5
	movs r2, 0x1
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106434 @ =0x00000805
	str r7, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1
	movs r3, 0x11
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x6
	movs r2, 0
	movs r3, 0x3
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106438 @ =0x00000406
	str r4, [sp]
	mov r2, r8
	str r2, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0x1D
	movs r3, 0x3
	bl FillBgTilemapBufferRect_Palette0
	str r7, [sp]
	mov r3, r8
	str r3, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x3
	bl FillBgTilemapBufferRect_Palette0
	movs r5, 0x1E
	str r5, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r7, 0xA
	movs r0, 0x6
	mov r8, r0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1D
	movs r2, 0x1
	movs r3, 0x9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _0810643C @ =0x0000041d
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r2, 0xC
	movs r3, 0x9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106440 @ =0x0000081d
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r2, 0x1
	movs r3, 0x10
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106444 @ =0x00000c1d
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r2, 0xC
	movs r3, 0x10
	bl FillBgTilemapBufferRect_Palette0
	str r7, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1E
	movs r2, 0x2
	movs r3, 0x9
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _08106448 @ =0x0000081e
	str r7, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r2, 0x2
	movs r3, 0x10
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1F
	movs r2, 0x1
	movs r3, 0xA
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _0810644C @ =0x0000041f
	str r4, [sp]
	mov r2, r8
	str r2, [sp, 0x4]
	movs r0, 0
	movs r2, 0xC
	movs r3, 0xA
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	movs r4, 0x14
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	bl GetUnlockedSeviiAreas
	ldr r1, [r6]
	adds r1, 0x64
	strb r0, [r1]
	movs r3, 0x4
	mov r9, r3
	movs r4, 0x3
	ldr r0, [r6]
	adds r0, 0x64
	ldrb r1, [r0]
	movs r2, 0x1
_081061E2:
	adds r0, r1, 0
	asrs r0, r4
	ands r0, r2
	cmp r0, 0
	beq _081061F0
	movs r0, 0
	mov r9, r0
_081061F0:
	adds r4, 0x1
	cmp r4, 0x6
	ble _081061E2
	ldr r0, _08106450 @ =gUnknown_8452214
	bl AddWindow
	ldr r5, _08106424 @ =gUnknown_203ACF0
	ldr r1, [r5]
	adds r1, 0x4A
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r0, [r0]
	ldr r1, _08106454 @ =gUnknown_8443620
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r4, [r0]
	adds r0, r4, 0
	movs r1, 0x2
	bl GetWindowAttribute
	adds r2, r0, 0
	add r2, r9
	adds r0, r4, 0
	movs r1, 0x2
	bl SetWindowAttribute
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r0, [r0]
	bl PutWindowTilemap
	movs r4, 0
	mov r1, r9
	lsls r1, 27
	str r1, [sp, 0x20]
	ldr r7, _08106458 @ =gUnknown_8452254
	adds r2, r7, 0x4
	mov r8, r2
_08106246:
	ldr r0, [r5]
	adds r0, 0x64
	ldrb r1, [r0]
	asrs r1, r4
	movs r0, 0x1
	ands r1, r0
	adds r6, r4, 0x1
	cmp r1, 0
	beq _081062B4
	lsls r4, 3
	adds r0, r4, r7
	ldr r0, [r0]
	bl AddWindow
	ldr r1, [r5]
	adds r1, 0x4A
	adds r1, r6
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4A
	adds r0, r6
	ldrb r0, [r0]
	add r4, r8
	ldr r1, [r4]
	movs r2, 0
	movs r3, 0
	bl CopyToWindowPixelBuffer
	ldr r0, [r5]
	adds r0, 0x4A
	adds r0, r6
	ldrb r4, [r0]
	adds r0, r4, 0
	movs r1, 0x2
	bl GetWindowAttribute
	adds r2, r0, 0
	add r2, r9
	adds r0, r4, 0
	movs r1, 0x2
	bl SetWindowAttribute
	ldr r0, [r5]
	adds r0, 0x4A
	adds r0, r6
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r5]
	adds r0, 0x4A
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
_081062B4:
	adds r4, r6, 0
	cmp r4, 0x6
	ble _08106246
	ldr r0, _0810645C @ =gUnknown_84521F4
	bl AddWindow
	ldr r7, _08106424 @ =gUnknown_203ACF0
	ldr r1, [r7]
	adds r1, 0x52
	movs r6, 0
	strb r0, [r1]
	ldr r5, _08106460 @ =gUnknown_84521FC
	adds r0, r5, 0
	bl AddWindow
	ldr r1, [r7]
	adds r1, 0x53
	strb r0, [r1]
	ldr r3, _08106464 @ =gUnknown_8452204
	mov r8, r3
	mov r0, r8
	bl AddWindow
	ldr r1, [r7]
	adds r1, 0x54
	strb r0, [r1]
	ldr r0, _08106468 @ =gUnknown_84521EC
	bl AddWindow
	ldr r1, [r7]
	adds r1, 0x55
	strb r0, [r1]
	ldr r0, _0810646C @ =gUnknown_845220C
	bl AddWindow
	ldr r1, [r7]
	adds r1, 0x56
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x55
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0xA0
	ldr r1, [sp, 0x1C]
	bl sub_8107CD8
	ldr r0, [sp, 0x1C]
	bl sub_81049CC
	adds r2, r0, 0
	ldr r0, [r7]
	adds r0, 0x55
	ldrb r0, [r0]
	str r6, [sp]
	ldr r1, [sp, 0x1C]
	movs r3, 0
	bl sub_8107CF8
	ldr r0, [r7]
	adds r0, 0x55
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x55
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r7]
	adds r0, 0x53
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, _08106470 @ =gUnknown_8415FED
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	ldr r1, [r7]
	adds r1, 0x53
	ldrb r1, [r1]
	ldrb r3, [r5, 0x3]
	lsls r3, 3
	subs r3, r0
	lsrs r0, r3, 31
	adds r3, r0
	asrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	movs r5, 0x4
	str r5, [sp]
	str r6, [sp, 0x4]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r4, 0
	bl sub_81047C8
	ldr r0, [r7]
	adds r0, 0x53
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x53
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r7]
	adds r0, 0x54
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, _08106474 @ =gUnknown_8415FE8
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	ldr r1, [r7]
	adds r1, 0x54
	ldrb r1, [r1]
	mov r2, r8
	ldrb r3, [r2, 0x3]
	lsls r3, 3
	subs r3, r0
	lsrs r0, r3, 31
	adds r3, r0
	asrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r6, [sp, 0x4]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r4, 0
	bl sub_81047C8
	ldr r0, [r7]
	adds r0, 0x54
	ldrb r4, [r0]
	adds r0, r4, 0
	movs r1, 0x2
	bl GetWindowAttribute
	adds r2, r0, 0
	add r2, r9
	adds r0, r4, 0
	movs r1, 0x2
	bl SetWindowAttribute
	ldr r0, [r7]
	adds r0, 0x54
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x54
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	str r6, [sp]
	movs r1, 0
	ldr r2, [sp, 0x1C]
	movs r3, 0
	bl sub_8104A34
	b _08106478
	.align 2, 0
_08106424: .4byte gUnknown_203ACF0
_08106428: .4byte 0x00000404
_0810642C: .4byte 0x00000804
_08106430: .4byte 0x00000c04
_08106434: .4byte 0x00000805
_08106438: .4byte 0x00000406
_0810643C: .4byte 0x0000041d
_08106440: .4byte 0x0000081d
_08106444: .4byte 0x00000c1d
_08106448: .4byte 0x0000081e
_0810644C: .4byte 0x0000041f
_08106450: .4byte gUnknown_8452214
_08106454: .4byte gUnknown_8443620
_08106458: .4byte gUnknown_8452254
_0810645C: .4byte gUnknown_84521F4
_08106460: .4byte gUnknown_84521FC
_08106464: .4byte gUnknown_8452204
_08106468: .4byte gUnknown_84521EC
_0810646C: .4byte gUnknown_845220C
_08106470: .4byte gUnknown_8415FED
_08106474: .4byte gUnknown_8415FE8
_08106478:
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	movs r1, 0xB
	ldr r3, [sp, 0x1C]
	adds r2, r3, 0
	muls r2, r1
	ldr r1, _081066B0 @ =gSpeciesNames
	adds r2, r1
	movs r1, 0xC
	str r1, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x2
	movs r3, 0x3
	bl sub_81047C8
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x52
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0xB0
	movs r1, 0x1
	bl sub_8107D38
	mov r0, r10
	cmp r0, 0
	beq _08106504
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	ldr r1, _081066B4 @ =gBaseStats
	ldr r2, [sp, 0x1C]
	lsls r4, r2, 3
	subs r4, r2
	lsls r4, 2
	adds r4, r1
	ldrb r5, [r4, 0x6]
	adds r1, r5, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	movs r3, 0x1
	bl BlitMoveInfoIcon
	ldrb r1, [r4, 0x7]
	cmp r5, r1
	beq _08106504
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x20
	movs r3, 0x1
	bl BlitMoveInfoIcon
_08106504:
	ldr r7, _081066B8 @ =gUnknown_203ACF0
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r7]
	adds r0, 0x56
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	bl ResetAllPicSprites
	ldr r0, _081066BC @ =gUnknown_8452368
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	mov r3, r10
	cmp r3, 0
	bne _08106534
	b _081066D0
_08106534:
	ldr r0, [sp, 0x1C]
	bl sub_81049CC
	adds r2, r0, 0
	movs r0, 0x28
	str r0, [sp]
	movs r0, 0x68
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	ldr r1, _081066C0 @ =0x0000ffff
	str r1, [sp, 0xC]
	ldr r0, [sp, 0x1C]
	movs r1, 0x8
	movs r3, 0x1
	bl CreateMonPicSprite_HandleDeoxys
	ldr r1, [r7]
	adds r1, 0x58
	strb r0, [r1]
	ldr r2, _081066C4 @ =gSprites
	mov r10, r2
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x5]
	movs r3, 0xF
	mov r9, r3
	mov r0, r9
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x1]
	subs r3, 0x13
	mov r8, r3
	mov r0, r8
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x3]
	movs r6, 0x3F
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x3]
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x5]
	movs r5, 0xD
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r0, [r7]
	adds r0, 0x58
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldr r1, _081066C8 @ =gPokedexEntries
	ldr r2, [sp, 0x18]
	lsls r4, r2, 3
	adds r4, r2
	lsls r4, 2
	adds r4, r1
	ldrh r1, [r4, 0x1C]
	strh r1, [r0, 0x26]
	ldrh r1, [r4, 0x1A]
	str r1, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r0, _081066CC @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	bl PlayerGenderToFrontTrainerPicId_Debug
	lsls r0, 16
	lsrs r0, 16
	movs r3, 0
	str r3, [sp]
	ldr r1, _081066C0 @ =0x0000ffff
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x50
	movs r3, 0x68
	bl CreateTrainerPicSprite
	ldr r1, [r7]
	adds r1, 0x59
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r1, [r0, 0x5]
	mov r2, r9
	ands r2, r1
	movs r3, 0x20
	orrs r2, r3
	strb r2, [r0, 0x5]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r1, [r0, 0x1]
	mov r2, r8
	ands r2, r1
	movs r3, 0x1
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r1, [r0, 0x3]
	ands r6, r1
	movs r1, 0x2
	orrs r6, r1
	strb r6, [r0, 0x3]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r1, [r0, 0x5]
	ands r5, r1
	movs r1, 0x4
	orrs r5, r1
	strb r5, [r0, 0x5]
	ldr r0, [r7]
	adds r0, 0x59
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x26]
	ldrh r1, [r4, 0x1E]
	str r1, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _081066E2
	.align 2, 0
_081066B0: .4byte gSpeciesNames
_081066B4: .4byte gBaseStats
_081066B8: .4byte gUnknown_203ACF0
_081066BC: .4byte gUnknown_8452368
_081066C0: .4byte 0x0000ffff
_081066C4: .4byte gSprites
_081066C8: .4byte gPokedexEntries
_081066CC: .4byte gSaveBlock2Ptr
_081066D0:
	ldr r0, [r7]
	adds r0, 0x58
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, 0x59
	movs r1, 0x1
	negs r1, r1
	strb r1, [r0]
_081066E2:
	ldr r1, _081067A8 @ =0x000007d1
	ldr r2, [sp, 0x20]
	lsrs r3, r2, 24
	ldr r0, [sp, 0x1C]
	movs r2, 0x3
	bl sub_8134230
	ldr r5, _081067AC @ =gUnknown_203ACF0
	ldr r1, [r5]
	strb r0, [r1, 0x4]
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	bl sub_81344E0
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _0810675A
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r0, [r0]
	ldr r1, _081067B0 @ =gUnknown_8443D00
	movs r4, 0x58
	str r4, [sp]
	movs r3, 0x10
	str r3, [sp, 0x4]
	movs r2, 0x4
	str r2, [sp, 0x8]
	movs r2, 0x1C
	str r2, [sp, 0xC]
	str r4, [sp, 0x10]
	str r3, [sp, 0x14]
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
	ldr r4, _081067B4 @ =gUnknown_8415FF2
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	ldr r1, [r5]
	adds r1, 0x4A
	ldrb r1, [r1]
	movs r3, 0x60
	subs r3, r0
	lsrs r0, r3, 31
	adds r3, r0
	asrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x1D
	str r0, [sp]
	str r6, [sp, 0x4]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r4, 0
	bl sub_81047C8
_0810675A:
	ldr r0, [r5]
	adds r0, 0x4A
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r2, _081067B8 @ =gUnknown_8415FAD
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0x8
	bl sub_81047C8
	ldr r0, _081067BC @ =gUnknown_8415FCF
	bl sub_8104C2C
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0x1
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081067A8: .4byte 0x000007d1
_081067AC: .4byte gUnknown_203ACF0
_081067B0: .4byte gUnknown_8443D00
_081067B4: .4byte gUnknown_8415FF2
_081067B8: .4byte gUnknown_8415FAD
_081067BC: .4byte gUnknown_8415FCF
	thumb_func_end sub_810603C

	thumb_func_start sub_81067C0
sub_81067C0: @ 81067C0
	push {r4,r5,lr}
	ldr r4, _0810680C @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldrb r0, [r0, 0x4]
	bl sub_81343F4
	movs r5, 0
_081067CE:
	adds r1, r5, 0
	adds r1, 0x4A
	ldr r0, [r4]
	adds r0, r1
	bl sub_81047B0
	adds r5, 0x1
	cmp r5, 0xC
	ble _081067CE
	ldr r4, _0810680C @ =gUnknown_203ACF0
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x59
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _081067F2
	bl FreeAndDestroyTrainerPicSprite
_081067F2:
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x58
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08106802
	bl FreeAndDestroyMonPicSprite
_08106802:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810680C: .4byte gUnknown_203ACF0
	thumb_func_end sub_81067C0

	thumb_func_start sub_8106810
sub_8106810: @ 8106810
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl IsNationalPokedexEnabled
	cmp r0, 0x1
	beq _08106830
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x97
	bls _08106830
	movs r0, 0
	b _08106832
_08106830:
	movs r0, 0x1
_08106832:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8106810

	thumb_func_start sub_8106838
sub_8106838: @ 8106838
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08106888 @ =gUnknown_8452C4C
	lsrs r0, 21
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r6, 3
	adds r1, r2
	ldrb r1, [r1, 0x4]
	mov r8, r1
	movs r5, 0
	adds r7, r0, 0
_08106858:
	cmp r5, r8
	bge _0810688C
	ldr r1, [r7]
	lsls r0, r6, 3
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r5, 1
	adds r0, r1
	ldrh r4, [r0]
	adds r0, r4, 0
	bl sub_8106810
	cmp r0, 0x1
	bne _0810688C
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _0810688C
	movs r0, 0x1
	b _08106894
	.align 2, 0
_08106888: .4byte gUnknown_8452C4C
_0810688C:
	adds r5, 0x1
	cmp r5, 0x3
	ble _08106858
	movs r0, 0
_08106894:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8106838

	thumb_func_start sub_81068A0
sub_81068A0: @ 81068A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _081068C8 @ =gUnknown_8452C4C
	lsls r0, r6, 3
	adds r0, r1
	ldrb r5, [r0, 0x4]
	movs r4, 0
	cmp r4, r5
	bge _081068D2
_081068B4:
	lsls r1, r4, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8106838
	lsls r0, 24
	cmp r0, 0
	beq _081068CC
	movs r0, 0x1
	b _081068D4
	.align 2, 0
_081068C8: .4byte gUnknown_8452C4C
_081068CC:
	adds r4, 0x1
	cmp r4, r5
	blt _081068B4
_081068D2:
	movs r0, 0
_081068D4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81068A0

	thumb_func_start sub_81068DC
sub_81068DC: @ 81068DC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08106990 @ =gUnknown_8452C4C
	lsls r0, r4, 3
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r6, 3
	adds r0, r1
	ldrb r0, [r0, 0x4]
	mov r9, r0
	ldr r2, _08106994 @ =gUnknown_203ACF0
	ldr r0, [r2]
	adds r0, 0x2C
	movs r1, 0
	strb r1, [r0]
	movs r5, 0
	ldr r0, _08106998 @ =0x0000ffff
	adds r3, r0, 0
_0810690C:
	ldr r0, [r2]
	lsls r1, r5, 1
	adds r0, 0x18
	adds r0, r1
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r5, 0x1
	cmp r5, 0x3
	ble _0810690C
	movs r5, 0
	cmp r5, r9
	bge _08106982
	ldr r1, _08106990 @ =gUnknown_8452C4C
	lsls r0, r4, 3
	adds r0, r1
	mov r8, r0
	lsls r7, r6, 3
_08106930:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	lsls r6, r5, 1
	adds r0, r6, r0
	ldrh r4, [r0]
	adds r0, r4, 0
	bl sub_8106810
	cmp r0, 0x1
	bne _0810697C
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	cmp r0, 0
	beq _0810697C
	ldr r0, _08106994 @ =gUnknown_203ACF0
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	lsls r0, 1
	adds r1, 0x18
	adds r1, r0
	mov r3, r8
	ldr r0, [r3]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_0810697C:
	adds r5, 0x1
	cmp r5, r9
	blt _08106930
_08106982:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106990: .4byte gUnknown_8452C4C
_08106994: .4byte gUnknown_203ACF0
_08106998: .4byte 0x0000ffff
	thumb_func_end sub_81068DC

	thumb_func_start sub_810699C
sub_810699C: @ 810699C
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081069F8 @ =gUnknown_8452C4C
	lsls r0, r7, 3
	adds r0, r1
	ldrb r6, [r0, 0x4]
	movs r2, 0xFF
	movs r3, 0xFF
	movs r5, 0
	cmp r5, r6
	bge _081069DE
_081069B6:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	adds r1, r4, 0
	str r2, [sp]
	str r3, [sp, 0x4]
	bl sub_8106838
	lsls r0, 24
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _081069D8
	cmp r2, 0xFF
	bne _081069D6
	adds r2, r4, 0
_081069D6:
	adds r3, r4, 0
_081069D8:
	adds r5, 0x1
	cmp r5, r6
	blt _081069B6
_081069DE:
	cmp r3, 0xFF
	bne _08106A00
	ldr r2, _081069FC @ =gUnknown_203ACF0
	ldr r0, [r2]
	adds r0, 0x29
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x2A
	strb r1, [r0]
	movs r0, 0x1
	b _08106A12
	.align 2, 0
_081069F8: .4byte gUnknown_8452C4C
_081069FC: .4byte gUnknown_203ACF0
_08106A00:
	ldr r1, _08106A1C @ =gUnknown_203ACF0
	ldr r0, [r1]
	adds r0, 0x29
	strb r2, [r0]
	ldr r0, [r1]
	adds r1, r3, 0x1
	adds r0, 0x2A
	strb r1, [r0]
	movs r0, 0
_08106A12:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08106A1C: .4byte gUnknown_203ACF0
	thumb_func_end sub_810699C

	thumb_func_start sub_8106A20
sub_8106A20: @ 8106A20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r1, _08106A98 @ =gUnknown_8452C4C
	str r1, [sp, 0x10]
_08106A3A:
	ldr r2, [sp, 0x10]
	ldrb r2, [r2, 0x4]
	str r2, [sp, 0x8]
	movs r7, 0
	cmp r7, r2
	bge _08106AD6
	ldr r0, [sp, 0x10]
	str r0, [sp, 0xC]
	movs r1, 0
	mov r9, r1
_08106A4E:
	ldr r2, [sp, 0xC]
	ldr r0, [r2]
	add r0, r9
	ldrb r6, [r0, 0x4]
	movs r5, 0
	mov r8, r5
	cmp r5, r6
	bge _08106ACA
	ldr r0, [sp, 0x10]
	mov r10, r0
	ldr r3, _08106A9C @ =gUnknown_203ACF0
_08106A64:
	mov r1, r10
	ldr r0, [r1]
	add r0, r9
	ldr r1, [r0]
	lsls r0, r5, 1
	adds r0, r1
	ldrh r0, [r0]
	adds r4, r0, 0
	ldr r2, [sp]
	cmp r2, r4
	bne _08106AA0
	ldr r0, [r3]
	adds r0, 0x28
	mov r1, sp
	ldrb r1, [r1, 0x4]
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, 0x2B
	strb r7, [r0]
	ldr r0, [r3]
	adds r0, 0x2D
	mov r2, r8
	strb r2, [r0]
	movs r0, 0
	b _08106AE8
	.align 2, 0
_08106A98: .4byte gUnknown_8452C4C
_08106A9C: .4byte gUnknown_203ACF0
_08106AA0:
	adds r0, r4, 0
	str r3, [sp, 0x14]
	bl sub_8106810
	ldr r3, [sp, 0x14]
	cmp r0, 0x1
	bne _08106AC4
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_8104AB0
	lsls r0, 24
	ldr r3, [sp, 0x14]
	cmp r0, 0
	beq _08106AC4
	movs r0, 0x1
	add r8, r0
_08106AC4:
	adds r5, 0x1
	cmp r5, r6
	blt _08106A64
_08106ACA:
	movs r1, 0x8
	add r9, r1
	adds r7, 0x1
	ldr r2, [sp, 0x8]
	cmp r7, r2
	blt _08106A4E
_08106AD6:
	ldr r0, [sp, 0x10]
	adds r0, 0x8
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x4]
	adds r1, 0x1
	str r1, [sp, 0x4]
	cmp r1, 0x8
	bls _08106A3A
	movs r0, 0x1
_08106AE8:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8106A20

	thumb_func_start sub_8106AF8
sub_8106AF8: @ 8106AF8
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0
	movs r6, 0
	cmp r6, r5
	bge _08106B24
_08106B06:
	ldr r0, _08106B30 @ =gUnknown_203ACF0
	ldr r0, [r0]
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r1, r4, 24
	lsrs r1, 24
	bl sub_8106838
	lsls r0, 24
	cmp r0, 0
	beq _08106B1E
	adds r6, 0x1
_08106B1E:
	adds r4, 0x1
	cmp r4, r5
	blt _08106B06
_08106B24:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08106B30: .4byte gUnknown_203ACF0
	thumb_func_end sub_8106AF8

	thumb_func_start sub_8106B34
sub_8106B34: @ 8106B34
	push {lr}
	ldr r0, _08106B58 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08106B54
	ldr r0, _08106B5C @ =gUnknown_203ACF0
	ldr r0, [r0]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
_08106B54:
	pop {r0}
	bx r0
	.align 2, 0
_08106B58: .4byte gMain
_08106B5C: .4byte gUnknown_203ACF0
	thumb_func_end sub_8106B34

	thumb_func_start sub_8106B60
sub_8106B60: @ 8106B60
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0x2
	movs r2, 0x1
	bl sub_8104AB0
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0x1
	bl sub_8104AB0
	bl IsNationalPokedexEnabled
	cmp r0, 0
	bne _08106BA4
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x97
	bls _08106BA4
	ldr r0, _08106BA0 @ =sub_8106BD8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	b _08106BC6
	.align 2, 0
_08106BA0: .4byte sub_8106BD8
_08106BA4:
	bl sub_810250C
	ldr r2, _08106BCC @ =gTasks
	ldr r4, _08106BD0 @ =gUnknown_203ACF0
	ldr r0, [r4]
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08106BD4 @ =sub_8106BE8
	str r1, [r0]
	adds r0, r5, 0
	bl sub_8106A20
	ldr r0, [r4]
	ldrb r0, [r0]
_08106BC6:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08106BCC: .4byte gTasks
_08106BD0: .4byte gUnknown_203ACF0
_08106BD4: .4byte sub_8106BE8
	thumb_func_end sub_8106B60

	thumb_func_start sub_8106BD8
sub_8106BD8: @ 8106BD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8106BD8

	thumb_func_start sub_8106BE8
sub_8106BE8: @ 8106BE8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08106C08 @ =gUnknown_203ACF0
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0xB
	bls _08106BFE
	b _08106E6A
_08106BFE:
	lsls r0, 2
	ldr r1, _08106C0C @ =_08106C10
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106C08: .4byte gUnknown_203ACF0
_08106C0C: .4byte _08106C10
	.align 2, 0
_08106C10:
	.4byte _08106C40
	.4byte _08106C62
	.4byte _08106C84
	.4byte _08106C98
	.4byte _08106CD4
	.4byte _08106D1C
	.4byte _08106D4C
	.4byte _08106D9E
	.4byte _08106DBA
	.4byte _08106DCC
	.4byte _08106DDE
	.4byte _08106E58
_08106C40:
	ldr r0, [r4]
	adds r0, 0x28
	ldrb r0, [r0]
	bl sub_810699C
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x2B
	adds r0, 0x29
	ldrb r1, [r0]
	ldrb r0, [r2]
	cmp r0, r1
	bcs _08106C5C
	strb r1, [r2]
_08106C5C:
	ldr r1, [r4]
	movs r0, 0x3
	b _08106E68
_08106C62:
	bl sub_8106014
	bl sub_8104E90
	ldr r0, _08106C7C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08106C80 @ =gUnknown_203ACF0
	ldr r1, [r0]
	b _08106E66
	.align 2, 0
_08106C7C: .4byte gMain
_08106C80: .4byte gUnknown_203ACF0
_08106C84:
	bl sub_8102798
	lsls r0, 24
	cmp r0, 0
	bne _08106C90
	b _08106E6A
_08106C90:
	adds r0, r5, 0
	bl DestroyTask
	b _08106E6A
_08106C98:
	movs r0, 0x1
	bl sub_8104F0C
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0xFF
	bl sub_8105058
	ldr r0, _08106CD0 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x4
	b _08106E68
	.align 2, 0
_08106CD0: .4byte gUnknown_203ACF0
_08106CD4:
	ldr r2, _08106D10 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08106D14 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0
	bl ShowBg
	ldr r0, _08106D18 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x5
	b _08106E68
	.align 2, 0
_08106D10: .4byte gPaletteFade
_08106D14: .4byte 0x0000ffff
_08106D18: .4byte gUnknown_203ACF0
_08106D1C:
	ldr r1, _08106D40 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1E
	strh r1, [r0, 0x8]
	ldr r0, _08106D44 @ =gUnknown_84524C4
	movs r1, 0
	bl ListMenuAddCursorObjectInternal
	ldr r2, _08106D48 @ =gUnknown_203ACF0
	ldr r1, [r2]
	adds r1, 0x61
	strb r0, [r1]
	ldr r1, [r2]
	movs r0, 0x6
	b _08106E68
	.align 2, 0
_08106D40: .4byte gTasks
_08106D44: .4byte gUnknown_84524C4
_08106D48: .4byte gUnknown_203ACF0
_08106D4C:
	ldr r0, [r4]
	adds r0, 0x2D
	ldrb r0, [r0]
	bl sub_8105058
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x61
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x2D
	ldrb r1, [r1]
	adds r2, 0x2C
	ldrb r2, [r2]
	bl sub_8105178
	ldr r1, _08106D88 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08106D8C
	subs r0, r2, 0x1
	strh r0, [r1, 0x8]
	b _08106E6A
	.align 2, 0
_08106D88: .4byte gTasks
_08106D8C:
	ldr r0, [r4]
	adds r0, 0x61
	ldrb r0, [r0]
	movs r1, 0
	bl ListMenuRemoveCursorObject
	ldr r1, [r4]
	movs r0, 0x7
	b _08106E68
_08106D9E:
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x2D
	ldrb r1, [r0]
	lsls r1, 1
	subs r0, 0x15
	adds r0, r1
	ldrh r0, [r0]
	adds r1, r2, 0
	adds r1, 0x5A
	strh r0, [r1]
	movs r0, 0x8
	strb r0, [r2, 0x1]
	b _08106E6A
_08106DBA:
	movs r0, 0x1
	bl sub_8105E1C
	ldr r0, _08106DC8 @ =gUnknown_203ACF0
	ldr r1, [r0]
	movs r0, 0x9
	b _08106E68
	.align 2, 0
_08106DC8: .4byte gUnknown_203ACF0
_08106DCC:
	ldr r0, [r4]
	movs r1, 0
	strb r1, [r0, 0x2]
	ldr r0, [r4]
	strb r1, [r0, 0x3]
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
_08106DDE:
	ldr r1, [r4]
	ldrb r0, [r1, 0x3]
	cmp r0, 0x5
	bhi _08106E10
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _08106E0A
	ldrb r1, [r1, 0x3]
	movs r0, 0
	bl sub_8105594
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r4]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	ldr r1, [r4]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	b _08106E6A
_08106E0A:
	subs r0, 0x1
	strb r0, [r1, 0x2]
	b _08106E6A
_08106E10:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r4]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldr r1, [r4]
	movs r0, 0xB
	b _08106E68
_08106E58:
	ldr r0, _08106E74 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08106E6A
	ldr r1, [r4]
_08106E66:
	movs r0, 0x2
_08106E68:
	strb r0, [r1, 0x1]
_08106E6A:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106E74: .4byte gMain
	thumb_func_end sub_8106BE8

	thumb_func_start sub_8106E78
sub_8106E78: @ 8106E78
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	cmp r1, 0x1
	beq _08106E8E
	cmp r1, 0x1
	bgt _08106EA0
	cmp r1, 0
	bne _08106EA0
	movs r1, 0x8
	b _08106EAE
_08106E8E:
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xF0
	subs r1, r0
	lsrs r1, 1
	b _08106EAE
_08106EA0:
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xE8
	subs r1, r0
_08106EAE:
	lsls r3, r1, 24
	lsrs r3, 24
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_81047C8
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8106E78

	.align 2, 0 @ Don't pad with nop.
