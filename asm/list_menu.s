	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_90
nullsub_90: @ 8106ECC
	bx lr
	thumb_func_end nullsub_90

	thumb_func_start DoMysteryGiftListMenu
DoMysteryGiftListMenu: @ 8106ED0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r12, r0
	str r1, [sp]
	ldr r0, [sp, 0x28]
	lsls r2, 24
	lsrs r6, r2, 24
	mov r10, r6
	lsls r3, 16
	lsrs r7, r3, 16
	str r7, [sp, 0x4]
	lsls r0, 16
	mov r8, r0
	lsrs r0, 16
	mov r9, r0
	ldr r5, _08106F60 @ =gUnknown_203ACF4
	ldrb r4, [r5, 0x4]
	cmp r4, 0x1
	beq _08106F68
	cmp r4, 0x1
	ble _08106F06
	cmp r4, 0x2
	beq _08106FCC
_08106F06:
	mov r0, r12
	bl sub_8003CE4
	strb r0, [r5, 0x5]
	cmp r6, 0x1
	beq _08106F24
	cmp r6, 0x2
	bne _08106F34
	ldrb r0, [r5, 0x5]
	mov r1, r9
	lsls r2, r1, 24
	lsrs r2, 24
	adds r1, r7, 0
	bl sub_815001C
_08106F24:
	ldrb r0, [r5, 0x5]
	mov r3, r8
	lsrs r2, r3, 20
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [sp, 0x4]
	bl sub_8150048
_08106F34:
	ldr r0, _08106F64 @ =gUnknown_3005E70
	adds r2, r0, 0
	ldr r1, [sp]
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldr r4, _08106F60 @ =gUnknown_203ACF4
	ldrb r1, [r4, 0x5]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r4, 0x6]
	ldrb r0, [r4, 0x5]
	movs r1, 0x1
	bl sub_8003F20
	movs r0, 0x1
	strb r0, [r4, 0x4]
	b _08106FE4
	.align 2, 0
_08106F60: .4byte gUnknown_203ACF4
_08106F64: .4byte gUnknown_3005E70
_08106F68:
	ldrb r0, [r5, 0x6]
	bl ListMenuHandleInput
	str r0, [r5]
	ldr r1, _08106FA4 @ =gUnknown_30030F0
	ldrh r0, [r1, 0x2E]
	ands r4, r0
	cmp r4, 0
	beq _08106F7E
	movs r0, 0x2
	strb r0, [r5, 0x4]
_08106F7E:
	ldrh r1, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08106F92
	movs r0, 0x2
	negs r0, r0
	str r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x4]
_08106F92:
	ldrb r0, [r5, 0x4]
	cmp r0, 0x2
	bne _08106FE4
	cmp r6, 0
	bne _08106FA8
	ldrb r0, [r5, 0x5]
	bl ClearWindowTilemap
	b _08106FBA
	.align 2, 0
_08106FA4: .4byte gUnknown_30030F0
_08106FA8:
	mov r4, r10
	cmp r4, 0
	blt _08106FBA
	cmp r4, 0x2
	bgt _08106FBA
	ldrb r0, [r5, 0x5]
	movs r1, 0
	bl sub_80F6F9C
_08106FBA:
	ldr r0, _08106FC8 @ =gUnknown_203ACF4
	ldrb r0, [r0, 0x5]
	movs r1, 0x1
	bl sub_8003F20
	b _08106FE4
	.align 2, 0
_08106FC8: .4byte gUnknown_203ACF4
_08106FCC:
	ldrb r0, [r5, 0x6]
	movs r1, 0
	movs r2, 0
	bl sub_810713C
	ldrb r0, [r5, 0x5]
	bl sub_8003E3C
	movs r0, 0
	strb r0, [r5, 0x4]
	ldr r0, [r5]
	b _08106FE8
_08106FE4:
	movs r0, 0x1
	negs r0, r0
_08106FE8:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end DoMysteryGiftListMenu

	thumb_func_start ListMenuInit
ListMenuInit: @ 8106FF8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	bl ListMenuInitInternal
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5, 0x10]
	bl PutWindowTilemap
	ldrb r0, [r5, 0x10]
	movs r1, 0x2
	bl sub_8003F20
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ListMenuInit

	thumb_func_start Unused_ListMenuInit2
Unused_ListMenuInit2: @ 8107024
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r4, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	bl ListMenuInitInternal
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r4, 0x4]
	cmp r0, 0xFF
	beq _08107064
	adds r5, r4, 0
_08107048:
	ldrb r0, [r6, 0x10]
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	ldrb r3, [r5, 0x2]
	ldrb r4, [r5, 0x3]
	str r4, [sp]
	ldrb r4, [r5, 0x4]
	str r4, [sp, 0x4]
	bl PutWindowRectTilemapOverridePalette
	adds r5, 0x8
	ldrb r0, [r5, 0x4]
	cmp r0, 0xFF
	bne _08107048
_08107064:
	ldrb r0, [r6, 0x10]
	movs r1, 0x2
	bl sub_8003F20
	adds r0, r7, 0
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end Unused_ListMenuInit2

	thumb_func_start ListMenuHandleInput
ListMenuHandleInput: @ 8107078
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _081070A4 @ =gUnknown_3005098
	adds r3, r1, r0
	ldr r2, _081070A8 @ =gUnknown_30030F0
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081070AC
	ldrh r0, [r3, 0x18]
	ldrh r1, [r3, 0x1A]
	adds r0, r1
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0, 0x4]
	b _08107136
	.align 2, 0
_081070A4: .4byte gUnknown_3005098
_081070A8: .4byte gUnknown_30030F0
_081070AC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081070BA
	movs r0, 0x2
	negs r0, r0
	b _08107136
_081070BA:
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _081070CE
	adds r0, r3, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0
	b _0810712E
_081070CE:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081070DE
	adds r0, r3, 0
	movs r1, 0x1
	movs r2, 0x1
	b _0810712C
_081070DE:
	ldrb r0, [r3, 0x16]
	lsrs r0, 6
	cmp r0, 0x1
	beq _081070F4
	cmp r0, 0x1
	ble _081070EE
	cmp r0, 0x2
	beq _08107100
_081070EE:
	movs r2, 0
	movs r0, 0
	b _08107114
_081070F4:
	movs r0, 0x20
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0x10
	b _0810710E
_08107100:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0x80
	lsls r0, 1
_0810710E:
	ands r0, r1
	lsls r0, 16
	lsrs r0, 16
_08107114:
	cmp r2, 0
	beq _08107122
	ldrb r2, [r3, 0xE]
	adds r0, r3, 0
	movs r1, 0x1
	movs r3, 0
	b _0810712E
_08107122:
	cmp r0, 0
	beq _08107132
	ldrb r2, [r3, 0xE]
	adds r0, r3, 0
	movs r1, 0x1
_0810712C:
	movs r3, 0x1
_0810712E:
	bl ListMenuChangeSelection
_08107132:
	movs r0, 0x1
	negs r0, r0
_08107136:
	pop {r1}
	bx r1
	thumb_func_end ListMenuHandleInput

	thumb_func_start sub_810713C
sub_810713C: @ 810713C
	push {r4,lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0810717C @ =gUnknown_3005098
	adds r1, r0, r1
	cmp r3, 0
	beq _08107158
	ldrh r0, [r1, 0x18]
	strh r0, [r3]
_08107158:
	cmp r2, 0
	beq _08107160
	ldrh r0, [r1, 0x1A]
	strh r0, [r2]
_08107160:
	ldrb r0, [r1, 0x1E]
	cmp r0, 0xFF
	beq _08107170
	ldrb r1, [r1, 0x17]
	lsrs r1, 6
	subs r1, 0x2
	bl ListMenuRemoveCursorObject
_08107170:
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810717C: .4byte gUnknown_3005098
	thumb_func_end sub_810713C

	thumb_func_start sub_8107180
sub_8107180: @ 8107180
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _081071C0 @ =gUnknown_3005098
	adds r4, r0
	ldrb r0, [r4, 0x10]
	ldrb r2, [r4, 0x15]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	bl FillWindowPixelBuffer
	ldrh r1, [r4, 0x18]
	ldrh r3, [r4, 0xE]
	adds r0, r4, 0
	movs r2, 0
	bl ListMenuPrintEntries
	adds r0, r4, 0
	bl ListMenuDrawCursor
	ldrb r0, [r4, 0x10]
	movs r1, 0x2
	bl sub_8003F20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081071C0: .4byte gUnknown_3005098
	thumb_func_end sub_8107180

	thumb_func_start sub_81071C4
sub_81071C4: @ 81071C4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08107204 @ =gUnknown_3005098
	adds r4, r0
	lsrs r1, 20
	ldrb r6, [r4, 0x14]
	movs r5, 0xF
	adds r0, r5, 0
	ands r0, r6
	orrs r0, r1
	strb r0, [r4, 0x14]
	ands r2, r5
	ldrb r1, [r4, 0x15]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	lsrs r3, 20
	ands r0, r5
	orrs r0, r3
	strb r0, [r4, 0x15]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08107204: .4byte gUnknown_3005098
	thumb_func_end sub_81071C4

	thumb_func_start sub_8107208
sub_8107208: @ 8107208
	push {r4,r5,lr}
	adds r3, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08107240 @ =gUnknown_3005098
	adds r4, r0
	ldrb r0, [r4, 0x10]
	movs r1, 0x1
	adds r2, r3, 0
	bl sub_80048BC
	ldrb r0, [r4, 0x10]
	movs r1, 0x2
	adds r2, r5, 0
	bl sub_80048BC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08107240: .4byte gUnknown_3005098
	thumb_func_end sub_8107208

	thumb_func_start sub_8107244
sub_8107244: @ 8107244
	push {r4-r7,lr}
	sub sp, 0x20
	mov r12, r2
	ldr r5, [sp, 0x34]
	lsls r3, 16
	lsrs r3, 16
	adds r4, r3, 0
	mov r3, sp
	ldm r0!, {r2,r6,r7}
	stm r3!, {r2,r6,r7}
	ldm r0!, {r2,r6,r7}
	stm r3!, {r2,r6,r7}
	mov r0, sp
	movs r3, 0
	strh r1, [r0, 0x18]
	mov r1, r12
	strh r1, [r0, 0x1A]
	strb r3, [r0, 0x1C]
	strb r3, [r0, 0x1D]
	cmp r4, 0x40
	bne _08107278
	movs r1, 0
	movs r2, 0x1
	movs r3, 0
	bl ListMenuChangeSelection
_08107278:
	cmp r4, 0x80
	bne _08107288
	mov r0, sp
	movs r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl ListMenuChangeSelection
_08107288:
	cmp r5, 0
	beq _08107292
	mov r0, sp
	ldrh r0, [r0, 0x18]
	strh r0, [r5]
_08107292:
	ldr r2, [sp, 0x38]
	cmp r2, 0
	beq _0810729E
	mov r0, sp
	ldrh r0, [r0, 0x1A]
	strh r0, [r2]
_0810729E:
	movs r0, 0x1
	negs r0, r0
	add sp, 0x20
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8107244

	thumb_func_start sub_81072AC
sub_81072AC: @ 81072AC
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _081072D0 @ =gUnknown_3005098
	adds r1, r0
	cmp r2, 0
	beq _081072CA
	ldrh r0, [r1, 0x1A]
	ldrh r1, [r1, 0x18]
	adds r0, r1
	strh r0, [r2]
_081072CA:
	pop {r0}
	bx r0
	.align 2, 0
_081072D0: .4byte gUnknown_3005098
	thumb_func_end sub_81072AC

	thumb_func_start get_coro_args_x18_x1A
get_coro_args_x18_x1A: @ 81072D4
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _081072FC @ =gUnknown_3005098
	adds r1, r0
	cmp r3, 0
	beq _081072EE
	ldrh r0, [r1, 0x18]
	strh r0, [r3]
_081072EE:
	cmp r2, 0
	beq _081072F6
	ldrh r0, [r1, 0x1A]
	strh r0, [r2]
_081072F6:
	pop {r0}
	bx r0
	.align 2, 0
_081072FC: .4byte gUnknown_3005098
	thumb_func_end get_coro_args_x18_x1A

	thumb_func_start ListMenuGetYCoordForPrintingArrowCursor
ListMenuGetYCoordForPrintingArrowCursor: @ 8107300
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08107344 @ =gUnknown_3005098
	adds r4, r0
	ldrb r0, [r4, 0x17]
	lsls r0, 26
	lsrs r0, 26
	movs r1, 0x1
	bl sub_80F79D8
	ldrb r1, [r4, 0x16]
	lsls r1, 26
	lsrs r1, 29
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x1A]
	adds r2, r1, 0
	muls r2, r0
	adds r1, r2, 0
	ldrb r0, [r4, 0x14]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08107344: .4byte gUnknown_3005098
	thumb_func_end ListMenuGetYCoordForPrintingArrowCursor

	thumb_func_start ListMenuInitInternal
ListMenuInitInternal: @ 8107348
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _08107418 @ =nullsub_90
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _0810741C @ =gUnknown_3005098
	adds r7, r0, r1
	adds r0, r7, 0
	ldm r4!, {r1-r3}
	stm r0!, {r1-r3}
	ldm r4!, {r1-r3}
	stm r0!, {r1-r3}
	movs r1, 0
	strh r5, [r7, 0x18]
	strh r6, [r7, 0x1A]
	strb r1, [r7, 0x1C]
	strb r1, [r7, 0x1D]
	movs r0, 0xFF
	strb r0, [r7, 0x1E]
	strb r1, [r7, 0x1F]
	ldr r3, _08107420 @ =gUnknown_3005E60
	ldrb r1, [r7, 0x14]
	movs r5, 0xF
	lsrs r1, 4
	ldrb r4, [r3]
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r7, 0x15]
	lsls r1, 28
	lsrs r1, 24
	ands r0, r5
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r7, 0x15]
	lsrs r0, 4
	ands r5, r0
	ldrb r0, [r3, 0x1]
	ands r2, r0
	orrs r2, r5
	strb r2, [r3, 0x1]
	ldrb r1, [r7, 0x16]
	lsls r1, 29
	lsrs r1, 17
	ldr r0, [r3]
	ldr r2, _08107424 @ =0xfffc0fff
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	ldrb r0, [r7, 0x17]
	lsls r0, 26
	lsrs r0, 26
	strb r0, [r3, 0x3]
	ldrh r0, [r7, 0xC]
	ldrh r1, [r7, 0xE]
	cmp r0, r1
	bcs _081073E0
	strh r0, [r7, 0xE]
_081073E0:
	ldrb r0, [r7, 0x10]
	ldrb r2, [r7, 0x15]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	bl FillWindowPixelBuffer
	ldrh r1, [r7, 0x18]
	ldrh r3, [r7, 0xE]
	adds r0, r7, 0
	movs r2, 0
	bl ListMenuPrintEntries
	adds r0, r7, 0
	bl ListMenuDrawCursor
	adds r0, r7, 0
	movs r1, 0x1
	bl ListMenuCallSelectionChangedCallback
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08107418: .4byte nullsub_90
_0810741C: .4byte gUnknown_3005098
_08107420: .4byte gUnknown_3005E60
_08107424: .4byte 0xfffc0fff
	thumb_func_end ListMenuInitInternal

	thumb_func_start ListMenuPrint
ListMenuPrint: @ 8107428
	push {r4-r7,lr}
	sub sp, 0x18
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	ldr r5, _08107490 @ =gUnknown_3005E60
	ldrb r1, [r5, 0x3]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _08107494
	add r1, sp, 0x14
	ldr r2, [r5]
	lsls r0, r2, 24
	lsrs r0, 28
	movs r3, 0
	strb r0, [r1]
	lsls r0, r2, 28
	lsrs r0, 28
	strb r0, [r1, 0x1]
	lsls r0, r2, 20
	lsrs r0, 28
	strb r0, [r1, 0x2]
	ldrb r0, [r4, 0x10]
	lsls r1, r2, 1
	lsrs r1, 25
	lsls r2, 14
	lsrs r2, 26
	str r2, [sp]
	str r3, [sp, 0x4]
	add r2, sp, 0x14
	str r2, [sp, 0x8]
	movs r2, 0x1
	negs r2, r2
	str r2, [sp, 0xC]
	str r6, [sp, 0x10]
	adds r2, r7, 0
	mov r3, r12
	bl sub_812E5A4
	ldrb r1, [r5, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r5, 0x3]
	b _081074D2
	.align 2, 0
_08107490: .4byte gUnknown_3005E60
_08107494:
	add r2, sp, 0x14
	ldrb r1, [r4, 0x15]
	lsls r0, r1, 28
	lsrs r0, 28
	strb r0, [r2]
	ldrb r0, [r4, 0x14]
	lsrs r0, 4
	strb r0, [r2, 0x1]
	adds r0, r2, 0
	lsls r1, 24
	lsrs r1, 28
	strb r1, [r0, 0x2]
	ldrb r0, [r4, 0x10]
	ldrb r1, [r4, 0x17]
	lsls r1, 26
	lsrs r1, 26
	ldrb r2, [r4, 0x16]
	lsls r2, 29
	lsrs r2, 29
	str r2, [sp]
	str r3, [sp, 0x4]
	add r2, sp, 0x14
	str r2, [sp, 0x8]
	movs r2, 0x1
	negs r2, r2
	str r2, [sp, 0xC]
	str r6, [sp, 0x10]
	adds r2, r7, 0
	mov r3, r12
	bl sub_812E5A4
_081074D2:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ListMenuPrint

	thumb_func_start ListMenuPrintEntries
ListMenuPrintEntries: @ 81074DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp]
	lsls r3, 16
	lsrs r3, 16
	mov r10, r3
	ldrb r0, [r4, 0x17]
	lsls r0, 26
	lsrs r0, 26
	movs r1, 0x1
	bl sub_80F79D8
	ldrb r1, [r4, 0x16]
	lsls r1, 26
	lsrs r1, 29
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r8, r0
	cmp r8, r10
	bge _08107584
_0810751E:
	ldr r0, [r4]
	mov r2, r9
	lsls r1, r2, 3
	adds r0, r1, r0
	ldr r2, [r0, 0x4]
	movs r0, 0x3
	negs r0, r0
	adds r5, r1, 0
	cmp r2, r0
	beq _08107536
	ldrb r6, [r4, 0x12]
	b _08107538
_08107536:
	ldrb r6, [r4, 0x11]
_08107538:
	ldr r0, [sp]
	add r0, r8
	ldr r2, [sp, 0x4]
	adds r1, r0, 0
	muls r1, r2
	ldrb r0, [r4, 0x14]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r7, r2, 0
	ldr r3, [r4, 0x8]
	cmp r3, 0
	beq _08107562
	ldrb r0, [r4, 0x10]
	ldr r1, [r4]
	adds r1, r5, r1
	ldr r1, [r1, 0x4]
	bl _call_via_r3
_08107562:
	ldr r0, [r4]
	adds r0, r5, r0
	ldr r1, [r0]
	adds r0, r4, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl ListMenuPrint
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r0, 0x1
	add r8, r0
	cmp r8, r10
	blt _0810751E
_08107584:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ListMenuPrintEntries

	thumb_func_start ListMenuDrawCursor
ListMenuDrawCursor: @ 8107594
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 26
	movs r1, 0x1
	bl sub_80F79D8
	ldrb r1, [r6, 0x16]
	lsls r1, 26
	lsrs r1, 29
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6, 0x13]
	mov r8, r1
	ldrh r1, [r6, 0x1A]
	muls r1, r0
	ldrb r0, [r6, 0x14]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r6, 0x17]
	lsrs r0, 6
	cmp r0, 0x1
	beq _08107680
	cmp r0, 0x1
	bgt _081075DA
	cmp r0, 0
	beq _081075E4
	b _08107680
_081075DA:
	cmp r0, 0x2
	beq _081075F8
	cmp r0, 0x3
	beq _08107640
	b _08107680
_081075E4:
	ldr r1, _081075F4 @ =gUnknown_841623B
	adds r0, r6, 0
	mov r2, r8
	adds r3, r7, 0
	bl ListMenuPrint
	b _08107680
	.align 2, 0
_081075F4: .4byte gUnknown_841623B
_081075F8:
	ldrb r0, [r6, 0x1E]
	cmp r0, 0xFF
	bne _08107608
	adds r0, r6, 0
	movs r1, 0
	bl ListMenuAddCursorObject
	strb r0, [r6, 0x1E]
_08107608:
	ldrb r5, [r6, 0x1E]
	ldrb r0, [r6, 0x10]
	movs r1, 0x1
	bl sub_8004950
	adds r4, r0, 0
	lsls r4, 19
	ldr r0, _0810763C @ =0xffff0000
	adds r4, r0
	lsrs r4, 16
	ldrb r0, [r6, 0x10]
	movs r1, 0x2
	bl sub_8004950
	adds r2, r0, 0
	lsls r2, 3
	adds r2, r7
	subs r2, 0x1
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl ListMenuUpdateCursorObject
	b _08107680
	.align 2, 0
_0810763C: .4byte 0xffff0000
_08107640:
	ldrb r0, [r6, 0x1E]
	cmp r0, 0xFF
	bne _08107650
	adds r0, r6, 0
	movs r1, 0x1
	bl ListMenuAddCursorObject
	strb r0, [r6, 0x1E]
_08107650:
	ldrb r5, [r6, 0x1E]
	ldrb r0, [r6, 0x10]
	movs r1, 0x1
	bl sub_8004950
	adds r4, r0, 0
	lsls r4, 3
	add r4, r8
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6, 0x10]
	movs r1, 0x2
	bl sub_8004950
	adds r2, r0, 0
	lsls r2, 3
	adds r2, r7
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl ListMenuUpdateCursorObject
_08107680:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ListMenuDrawCursor

	thumb_func_start ListMenuAddCursorObject
ListMenuAddCursorObject: @ 810768C
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r5, r1, 0
	mov r1, sp
	movs r0, 0
	strb r0, [r1]
	movs r0, 0xA0
	strb r0, [r1, 0x1]
	ldrb r0, [r4, 0x10]
	movs r1, 0x3
	bl sub_8004950
	mov r1, sp
	lsls r0, 3
	adds r0, 0x2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x17]
	lsls r0, 26
	lsrs r0, 26
	movs r1, 0x1
	bl sub_80F79D8
	mov r1, sp
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x2
	strh r0, [r1, 0x4]
	movs r0, 0x80
	lsls r0, 7
	strh r0, [r1, 0x6]
	ldr r0, _081076E8 @ =0x0000ffff
	strh r0, [r1, 0x8]
	movs r0, 0xF
	strb r0, [r1, 0xA]
	mov r0, sp
	adds r1, r5, 0
	bl ListMenuAddCursorObjectInternal
	lsls r0, 24
	lsrs r0, 24
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081076E8: .4byte 0x0000ffff
	thumb_func_end ListMenuAddCursorObject

	thumb_func_start ListMenuErasePrintedCursor
ListMenuErasePrintedCursor: @ 81076EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldrb r1, [r7, 0x17]
	lsrs r0, r1, 6
	cmp r0, 0
	bne _08107768
	lsls r0, r1, 26
	lsrs r0, 26
	movs r1, 0x1
	bl sub_80F79D8
	adds r4, r0, 0
	ldrb r0, [r7, 0x16]
	lsls r0, 26
	lsrs r0, 29
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r7, 0x17]
	lsls r0, 26
	lsrs r0, 26
	movs r1, 0
	bl sub_80F7AC0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r7, 0x17]
	lsls r0, 26
	lsrs r0, 26
	movs r1, 0x1
	bl sub_80F7AC0
	lsls r0, 24
	lsrs r0, 24
	ldrb r6, [r7, 0x10]
	ldrb r2, [r7, 0x15]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	ldrb r2, [r7, 0x13]
	mov r3, r8
	muls r3, r4
	adds r4, r3, 0
	ldrb r3, [r7, 0x14]
	lsls r3, 28
	lsrs r3, 28
	adds r3, r4
	lsls r3, 16
	lsrs r3, 16
	str r5, [sp]
	str r0, [sp, 0x4]
	adds r0, r6, 0
	bl FillWindowPixelRect
_08107768:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ListMenuErasePrintedCursor

	thumb_func_start ListMenuUpdateSelectedRowIndexAndScrollOffset
ListMenuUpdateSelectedRowIndexAndScrollOffset: @ 8107774
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	ldrh r3, [r4, 0x1A]
	ldrh r5, [r4, 0x18]
	cmp r1, 0
	bne _081077E8
	ldrh r0, [r4, 0xE]
	cmp r0, 0x1
	bne _0810778C
	movs r2, 0
	b _0810779E
_0810778C:
	ldrh r0, [r4, 0xE]
	lsrs r2, r0, 1
	movs r1, 0x1
	ands r1, r0
	adds r2, r1
	subs r0, r2
	subs r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_0810779E:
	cmp r5, 0
	bne _081077C4
	cmp r3, 0
	beq _0810782A
	ldr r1, [r4]
	movs r2, 0x3
	negs r2, r2
_081077AC:
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r5, r3
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0, 0x4]
	cmp r0, r2
	bne _0810782E
	cmp r3, 0
	bne _081077AC
	b _0810782A
_081077C4:
	cmp r3, r2
	bls _081077E4
	ldr r1, [r4]
	movs r6, 0x3
	negs r6, r6
_081077CE:
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r5, r3
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0, 0x4]
	cmp r0, r6
	bne _0810782E
	cmp r3, r2
	bhi _081077CE
_081077E4:
	subs r0, r5, 0x1
	b _08107856
_081077E8:
	ldrh r0, [r4, 0xE]
	cmp r0, 0x1
	bne _081077F2
	movs r2, 0
	b _081077FC
_081077F2:
	ldrh r0, [r4, 0xE]
	lsrs r2, r0, 1
	movs r1, 0x1
	ands r1, r0
	adds r2, r1
_081077FC:
	adds r1, r0, 0
	ldrh r0, [r4, 0xC]
	subs r0, r1
	cmp r5, r0
	bne _08107834
	subs r0, r1, 0x1
	cmp r3, r0
	bge _0810782A
	ldr r2, [r4]
	movs r6, 0x3
	negs r6, r6
	adds r1, r0, 0
_08107814:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r5, r3
	lsls r0, 3
	adds r0, r2
	ldr r0, [r0, 0x4]
	cmp r0, r6
	bne _0810782E
	cmp r3, r1
	blt _08107814
_0810782A:
	movs r0, 0
	b _0810785C
_0810782E:
	strh r3, [r4, 0x1A]
	movs r0, 0x1
	b _0810785C
_08107834:
	cmp r3, r2
	bcs _08107854
	ldr r1, [r4]
	movs r6, 0x3
	negs r6, r6
_0810783E:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r5, r3
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0, 0x4]
	cmp r0, r6
	bne _0810782E
	cmp r3, r2
	bcc _0810783E
_08107854:
	adds r0, r5, 0x1
_08107856:
	strh r2, [r4, 0x1A]
	strh r0, [r4, 0x18]
	movs r0, 0x2
_0810785C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ListMenuUpdateSelectedRowIndexAndScrollOffset

	thumb_func_start ListMenuScroll
ListMenuScroll: @ 8107864
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldrh r0, [r6, 0xE]
	cmp r5, r0
	bcc _0810789E
	ldrb r0, [r6, 0x10]
	ldrb r2, [r6, 0x15]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	bl FillWindowPixelBuffer
	ldrh r1, [r6, 0x18]
	ldrh r3, [r6, 0xE]
	adds r0, r6, 0
	movs r2, 0
	bl ListMenuPrintEntries
	b _0810798E
_0810789E:
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 26
	movs r1, 0x1
	bl sub_80F79D8
	ldrb r1, [r6, 0x16]
	lsls r1, 26
	lsrs r1, 29
	adds r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r1, r8
	cmp r1, 0
	bne _08107930
	ldrb r0, [r6, 0x10]
	adds r2, r5, 0
	muls r2, r4
	lsls r2, 24
	lsrs r2, 24
	ldrb r1, [r6, 0x15]
	lsls r1, 28
	lsrs r3, r1, 4
	orrs r3, r1
	lsrs r3, 24
	movs r1, 0x1
	bl ScrollWindow
	ldrh r1, [r6, 0x18]
	adds r0, r6, 0
	movs r2, 0
	adds r3, r5, 0
	bl ListMenuPrintEntries
	ldrh r0, [r6, 0xE]
	adds r1, r0, 0
	muls r1, r4
	adds r0, r1, 0
	ldrb r4, [r6, 0x14]
	lsls r4, 28
	lsrs r4, 28
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6, 0x10]
	movs r1, 0x3
	bl sub_8004950
	adds r5, r0, 0
	lsls r5, 19
	lsrs r5, 16
	ldrb r0, [r6, 0x10]
	movs r1, 0x4
	bl sub_8004950
	lsls r0, 3
	subs r0, r4
	lsls r0, 16
	lsrs r0, 16
	ldrb r3, [r6, 0x10]
	ldrb r2, [r6, 0x15]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	str r5, [sp]
	str r0, [sp, 0x4]
	adds r0, r3, 0
	movs r2, 0
	adds r3, r4, 0
	bl FillWindowPixelRect
	b _0810798E
_08107930:
	ldrb r0, [r6, 0x10]
	adds r2, r7, 0
	muls r2, r4
	lsls r2, 24
	lsrs r2, 24
	ldrb r1, [r6, 0x15]
	lsls r1, 28
	lsrs r3, r1, 4
	orrs r3, r1
	lsrs r3, 24
	movs r1, 0
	bl ScrollWindow
	ldrh r2, [r6, 0xE]
	subs r2, r7
	ldrh r1, [r6, 0x18]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r3, r7, 0
	bl ListMenuPrintEntries
	ldrb r0, [r6, 0x10]
	movs r1, 0x3
	bl sub_8004950
	lsls r0, 19
	lsrs r0, 16
	ldrb r3, [r6, 0x10]
	ldrb r2, [r6, 0x15]
	lsls r2, 28
	lsrs r1, r2, 4
	orrs r1, r2
	lsrs r1, 24
	str r0, [sp]
	ldrb r0, [r6, 0x14]
	lsls r0, 28
	lsrs r0, 28
	str r0, [sp, 0x4]
	adds r0, r3, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
_0810798E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ListMenuScroll

	thumb_func_start ListMenuChangeSelection
ListMenuChangeSelection: @ 810799C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	ldrh r0, [r4, 0x1A]
	mov r10, r0
	movs r7, 0
	movs r5, 0
	movs r0, 0
	cmp r7, r8
	bcs _08107A04
_081079CA:
	adds r6, r0, 0x1
	b _081079EA
_081079CE:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r4, 0x18]
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	ldr r1, [r4]
	lsls r0, 3
	adds r0, r1
	ldr r1, [r0, 0x4]
	movs r0, 0x3
	negs r0, r0
	cmp r1, r0
	bne _081079FC
_081079EA:
	adds r0, r4, 0
	mov r1, r9
	bl ListMenuUpdateSelectedRowIndexAndScrollOffset
	lsls r0, 24
	lsrs r0, 24
	orrs r5, r0
	cmp r0, 0x2
	beq _081079CE
_081079FC:
	lsls r0, r6, 24
	lsrs r0, 24
	cmp r0, r8
	bcc _081079CA
_08107A04:
	ldr r0, [sp]
	cmp r0, 0
	beq _08107A62
	cmp r5, 0x1
	beq _08107A1A
	cmp r5, 0x1
	ble _08107A16
	cmp r5, 0x3
	ble _08107A3A
_08107A16:
	movs r0, 0x1
	b _08107A64
_08107A1A:
	adds r0, r4, 0
	mov r1, r10
	bl ListMenuErasePrintedCursor
	adds r0, r4, 0
	bl ListMenuDrawCursor
	adds r0, r4, 0
	movs r1, 0
	bl ListMenuCallSelectionChangedCallback
	ldrb r0, [r4, 0x10]
	movs r1, 0x2
	bl sub_8003F20
	b _08107A62
_08107A3A:
	adds r0, r4, 0
	mov r1, r10
	bl ListMenuErasePrintedCursor
	adds r0, r4, 0
	adds r1, r7, 0
	mov r2, r9
	bl ListMenuScroll
	adds r0, r4, 0
	bl ListMenuDrawCursor
	adds r0, r4, 0
	movs r1, 0
	bl ListMenuCallSelectionChangedCallback
	ldrb r0, [r4, 0x10]
	movs r1, 0x2
	bl sub_8003F20
_08107A62:
	movs r0, 0
_08107A64:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ListMenuChangeSelection

	thumb_func_start ListMenuCallSelectionChangedCallback
ListMenuCallSelectionChangedCallback: @ 8107A74
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r3, [r2, 0x4]
	cmp r3, 0
	beq _08107A96
	ldrh r0, [r2, 0x18]
	ldrh r1, [r2, 0x1A]
	adds r0, r1
	ldr r1, [r2]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0, 0x4]
	adds r1, r4, 0
	bl _call_via_r3
_08107A96:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ListMenuCallSelectionChangedCallback

	thumb_func_start sub_8107A9C
sub_8107A9C: @ 8107A9C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r6, _08107AE8 @ =gUnknown_3005E60
	movs r5, 0xF
	ands r0, r5
	ldrb r3, [r6]
	mov r8, r3
	movs r4, 0x10
	negs r4, r4
	adds r3, r4, 0
	mov r7, r8
	ands r3, r7
	orrs r3, r0
	lsrs r1, 20
	ands r3, r5
	orrs r3, r1
	strb r3, [r6]
	ands r2, r5
	ldrb r0, [r6, 0x1]
	ands r4, r0
	orrs r4, r2
	strb r4, [r6, 0x1]
	ldrb r0, [r6, 0x3]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r6, 0x3]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08107AE8: .4byte gUnknown_3005E60
	thumb_func_end sub_8107A9C

	thumb_func_start sub_8107AEC
sub_8107AEC: @ 8107AEC
	push {lr}
	lsls r1, 24
	cmp r1, 0
	bne _08107AFA
	movs r0, 0x5
	bl sub_80722CC
_08107AFA:
	pop {r0}
	bx r0
	thumb_func_end sub_8107AEC

	thumb_func_start sub_8107B00
sub_8107B00: @ 8107B00
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08107B24 @ =gUnknown_3005098
	adds r2, r1, r0
	cmp r3, 0x10
	bhi _08107BC8
	lsls r0, r3, 2
	ldr r1, _08107B28 @ =_08107B2C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08107B24: .4byte gUnknown_3005098
_08107B28: .4byte _08107B2C
	.align 2, 0
_08107B2C:
	.4byte _08107B70
	.4byte _08107B70
	.4byte _08107B74
	.4byte _08107B78
	.4byte _08107B7C
	.4byte _08107B80
	.4byte _08107B84
	.4byte _08107B88
	.4byte _08107B8C
	.4byte _08107B90
	.4byte _08107B96
	.4byte _08107B9E
	.4byte _08107BA4
	.4byte _08107BAC
	.4byte _08107BB4
	.4byte _08107BBA
	.4byte _08107BC2
_08107B70:
	ldr r0, [r2, 0x4]
	b _08107BCC
_08107B74:
	ldrh r0, [r2, 0xC]
	b _08107BCC
_08107B78:
	ldrh r0, [r2, 0xE]
	b _08107BCC
_08107B7C:
	ldrb r0, [r2, 0x10]
	b _08107BCC
_08107B80:
	ldrb r0, [r2, 0x11]
	b _08107BCC
_08107B84:
	ldrb r0, [r2, 0x12]
	b _08107BCC
_08107B88:
	ldrb r0, [r2, 0x13]
	b _08107BCC
_08107B8C:
	ldrb r0, [r2, 0x14]
	b _08107B98
_08107B90:
	ldrb r0, [r2, 0x14]
	lsrs r0, 4
	b _08107BCC
_08107B96:
	ldrb r0, [r2, 0x15]
_08107B98:
	lsls r0, 28
	lsrs r0, 28
	b _08107BCC
_08107B9E:
	ldrb r0, [r2, 0x15]
	lsrs r0, 4
	b _08107BCC
_08107BA4:
	ldrb r0, [r2, 0x16]
	lsls r0, 29
	lsrs r0, 29
	b _08107BCC
_08107BAC:
	ldrb r0, [r2, 0x16]
	lsls r0, 26
	lsrs r0, 29
	b _08107BCC
_08107BB4:
	ldrb r0, [r2, 0x16]
	lsrs r0, 6
	b _08107BCC
_08107BBA:
	ldrb r0, [r2, 0x17]
	lsls r0, 26
	lsrs r0, 26
	b _08107BCC
_08107BC2:
	ldrb r0, [r2, 0x17]
	lsrs r0, 6
	b _08107BCC
_08107BC8:
	movs r0, 0x1
	negs r0, r0
_08107BCC:
	pop {r1}
	bx r1
	thumb_func_end sub_8107B00

	thumb_func_start sub_8107BD0
sub_8107BD0: @ 8107BD0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08107BF4 @ =gUnknown_3005098
	adds r3, r1, r0
	cmp r4, 0x10
	bhi _08107CD0
	lsls r0, r4, 2
	ldr r1, _08107BF8 @ =_08107BFC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08107BF4: .4byte gUnknown_3005098
_08107BF8: .4byte _08107BFC
	.align 2, 0
_08107BFC:
	.4byte _08107C40
	.4byte _08107C40
	.4byte _08107C44
	.4byte _08107C48
	.4byte _08107C4C
	.4byte _08107C50
	.4byte _08107C54
	.4byte _08107C58
	.4byte _08107C5C
	.4byte _08107C68
	.4byte _08107C76
	.4byte _08107C82
	.4byte _08107C90
	.4byte _08107C9C
	.4byte _08107CAA
	.4byte _08107CB8
	.4byte _08107CC4
_08107C40:
	str r2, [r3, 0x4]
	b _08107CD0
_08107C44:
	strh r2, [r3, 0xC]
	b _08107CD0
_08107C48:
	strh r2, [r3, 0xE]
	b _08107CD0
_08107C4C:
	strb r2, [r3, 0x10]
	b _08107CD0
_08107C50:
	strb r2, [r3, 0x11]
	b _08107CD0
_08107C54:
	strb r2, [r3, 0x12]
	b _08107CD0
_08107C58:
	strb r2, [r3, 0x13]
	b _08107CD0
_08107C5C:
	movs r0, 0xF
	ands r2, r0
	ldrb r1, [r3, 0x14]
	movs r0, 0x10
	negs r0, r0
	b _08107C6E
_08107C68:
	lsls r2, 4
	ldrb r1, [r3, 0x14]
	movs r0, 0xF
_08107C6E:
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x14]
	b _08107CD0
_08107C76:
	movs r0, 0xF
	ands r2, r0
	ldrb r1, [r3, 0x15]
	movs r0, 0x10
	negs r0, r0
	b _08107C88
_08107C82:
	lsls r2, 4
	ldrb r1, [r3, 0x15]
	movs r0, 0xF
_08107C88:
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x15]
	b _08107CD0
_08107C90:
	movs r0, 0x7
	ands r2, r0
	ldrb r1, [r3, 0x16]
	movs r0, 0x8
	negs r0, r0
	b _08107CB0
_08107C9C:
	movs r0, 0x7
	ands r2, r0
	lsls r2, 3
	ldrb r1, [r3, 0x16]
	movs r0, 0x39
	negs r0, r0
	b _08107CB0
_08107CAA:
	lsls r2, 6
	ldrb r1, [r3, 0x16]
	movs r0, 0x3F
_08107CB0:
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x16]
	b _08107CD0
_08107CB8:
	movs r0, 0x3F
	ands r2, r0
	ldrb r1, [r3, 0x17]
	movs r0, 0x40
	negs r0, r0
	b _08107CCA
_08107CC4:
	lsls r2, 6
	ldrb r1, [r3, 0x17]
	movs r0, 0x3F
_08107CCA:
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x17]
_08107CD0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8107BD0

	thumb_func_start sub_8107CD8
sub_8107CD8: @ 8107CD8
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	lsrs r0, 16
	bl sub_80971CC
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8107CD8

	thumb_func_start sub_8107CF8
sub_8107CF8: @ 8107CF8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r4, r3, 0
	ldr r5, [sp, 0x18]
	lsls r6, 24
	lsrs r6, 24
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r2, 0x1
	bl GetMonIconPtr
	adds r1, r0, 0
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r6, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl BlitBitmapToWindow
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8107CF8

	thumb_func_start sub_8107D38
sub_8107D38: @ 8107D38
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _08107D4A
	cmp r1, 0x1
	beq _08107D54
_08107D4A:
	ldr r0, _08107D50 @ =gUnknown_8E95D9C
	b _08107D56
	.align 2, 0
_08107D50: .4byte gUnknown_8E95D9C
_08107D54:
	ldr r0, _08107D64 @ =gUnknown_8E95DBC
_08107D56:
	adds r1, r2, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08107D64: .4byte gUnknown_8E95DBC
	thumb_func_end sub_8107D38

	thumb_func_start sub_8107D68
sub_8107D68: @ 8107D68
	push {r4,r5,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r4, _08107DAC @ =gUnknown_8452C94
	lsrs r1, 22
	adds r1, r4
	ldrh r5, [r1, 0x2]
	lsls r5, 5
	ldr r4, _08107DB0 @ =gUnknown_8E95DDC
	adds r5, r4
	movs r4, 0x80
	str r4, [sp]
	str r4, [sp, 0x4]
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	ldrb r2, [r1]
	str r2, [sp, 0x10]
	ldrb r1, [r1, 0x1]
	str r1, [sp, 0x14]
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08107DAC: .4byte gUnknown_8452C94
_08107DB0: .4byte gUnknown_8E95DDC
	thumb_func_end sub_8107D68

	.align 2, 0 @ Don't pad with nop.
