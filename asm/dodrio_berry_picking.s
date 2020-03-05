	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8155A78
sub_8155A78: @ 8155A78
	push {r4-r6,lr}
	sub sp, 0x10
	ldr r5, _08155A94 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r6, _08155A98 @ =0x00003014
	adds r0, r6
	ldrb r4, [r0]
	cmp r4, 0x1
	beq _08155AD0
	cmp r4, 0x1
	bgt _08155A9C
	cmp r4, 0
	beq _08155AA6
	b _08155B18
	.align 2, 0
_08155A94: .4byte gUnknown_203F440
_08155A98: .4byte 0x00003014
_08155A9C:
	cmp r4, 0x2
	beq _08155AE4
	cmp r4, 0x3
	beq _08155AFC
	b _08155B18
_08155AA6:
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	ldr r2, _08155ACC @ =gText_SavingDontTurnOffThePower2
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized2
	b _08155B08
	.align 2, 0
_08155ACC: .4byte gText_SavingDontTurnOffThePower2
_08155AD0:
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, _08155AE0 @ =0x00003014
	adds r1, r0
	b _08155B0C
	.align 2, 0
_08155AE0: .4byte 0x00003014
_08155AE4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155B40
	ldr r0, _08155AF8 @ =sub_80DA634
	movs r1, 0
	bl CreateTask
	b _08155B08
	.align 2, 0
_08155AF8: .4byte sub_80DA634
_08155AFC:
	ldr r0, _08155B14 @ =sub_80DA634
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08155B40
_08155B08:
	ldr r1, [r5]
	adds r1, r6
_08155B0C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155B40
	.align 2, 0
_08155B14: .4byte sub_80DA634
_08155B18:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08155B48 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_08155B40:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08155B48: .4byte gUnknown_203F440
	thumb_func_end sub_8155A78

	thumb_func_start sub_8155B4C
sub_8155B4C: @ 8155B4C
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r1, _08155B6C @ =gUnknown_203F440
	ldr r2, [r1]
	ldr r6, _08155B70 @ =0x00003014
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x1
	beq _08155BA4
	cmp r0, 0x1
	bgt _08155B74
	cmp r0, 0
	beq _08155B7A
	b _08155C18
	.align 2, 0
_08155B6C: .4byte gUnknown_203F440
_08155B70: .4byte 0x00003014
_08155B74:
	cmp r0, 0x2
	beq _08155BEC
	b _08155C18
_08155B7A:
	ldr r4, _08155B9C @ =sUnknown_84756A4
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r5]
	ldr r2, _08155BA0 @ =0x00003008
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, 0
	bl sub_8154868
	b _08155C08
	.align 2, 0
_08155B9C: .4byte sUnknown_84756A4
_08155BA0: .4byte 0x00003008
_08155BA4:
	ldr r4, _08155BE0 @ =0x00003008
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155BE4 @ =gText_CommunicationStandby3
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, _08155BE8 @ =0x00003014
	adds r1, r0
	b _08155C0C
	.align 2, 0
_08155BE0: .4byte 0x00003008
_08155BE4: .4byte gText_CommunicationStandby3
_08155BE8: .4byte 0x00003014
_08155BEC:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155C02
	ldr r0, [r5]
	ldr r1, _08155C14 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_08155C02:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_08155C08:
	ldr r1, [r5]
	adds r1, r6
_08155C0C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155C24
	.align 2, 0
_08155C14: .4byte 0x00003008
_08155C18:
	ldr r0, [r5]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_08155C24:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8155B4C

	thumb_func_start sub_8155C2C
sub_8155C2C: @ 8155C2C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r5, _08155C78 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r4, _08155C7C @ =0x00003008
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r5]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08155C78: .4byte gUnknown_203F440
_08155C7C: .4byte 0x00003008
	thumb_func_end sub_8155C2C

	thumb_func_start sub_8155C80
sub_8155C80: @ 8155C80
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r0, _08155CA0 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r7, _08155CA4 @ =0x00003014
	adds r2, r1, r7
	ldrb r5, [r2]
	adds r6, r0, 0
	cmp r5, 0x1
	beq _08155D08
	cmp r5, 0x1
	bgt _08155CA8
	cmp r5, 0
	beq _08155CB2
	b _08155D9C
	.align 2, 0
_08155CA0: .4byte gUnknown_203F440
_08155CA4: .4byte 0x00003014
_08155CA8:
	cmp r5, 0x2
	beq _08155D50
	cmp r5, 0x3
	beq _08155D7C
	b _08155D9C
_08155CB2:
	ldr r4, _08155CF8 @ =sUnknown_847569C
	adds r0, r4, 0
	bl AddWindow
	ldr r1, [r6]
	ldr r2, _08155CFC @ =0x00003008
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, 0
	bl sub_8154868
	ldr r1, [r6]
	adds r1, r7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	ldr r2, _08155D00 @ =0x0000301c
	adds r1, r0, r2
	movs r2, 0
	strh r5, [r1]
	ldr r1, _08155D04 @ =0x00003020
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r6]
	adds r1, 0x4
	adds r0, r1
	strb r2, [r0]
	b _08155DE2
	.align 2, 0
_08155CF8: .4byte sUnknown_847569C
_08155CFC: .4byte 0x00003008
_08155D00: .4byte 0x0000301c
_08155D04: .4byte 0x00003020
_08155D08:
	ldr r4, _08155D44 @ =0x00003008
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155D48 @ =gText_SomeoneDroppedOut
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r6]
	ldr r2, _08155D4C @ =0x00003014
	adds r1, r2
	b _08155D70
	.align 2, 0
_08155D44: .4byte 0x00003008
_08155D48: .4byte gText_SomeoneDroppedOut
_08155D4C: .4byte 0x00003014
_08155D50:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155D66
	ldr r0, [r6]
	ldr r1, _08155D78 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_08155D66:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r6]
	adds r1, r7
_08155D70:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155DE2
	.align 2, 0
_08155D78: .4byte 0x00003008
_08155D7C:
	ldr r0, _08155D98 @ =0x0000301c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x77
	bls _08155DE2
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _08155DE2
	.align 2, 0
_08155D98: .4byte 0x0000301c
_08155D9C:
	ldr r0, [r6]
	ldr r1, _08155DEC @ =0x00003024
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	ldr r0, [r6]
	ldr r4, _08155DF0 @ =0x00003008
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, [r6]
	movs r2, 0xC0
	lsls r2, 6
	adds r0, r2
	movs r1, 0x1
	str r1, [r0]
_08155DE2:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08155DEC: .4byte 0x00003024
_08155DF0: .4byte 0x00003008
	thumb_func_end sub_8155C80

	thumb_func_start unused_0
unused_0: @ 8155DF4
	push {r4,lr}
	ldr r4, _08155E18 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155E1C @ =0x00003004
	adds r0, r1
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, [r4]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08155E18: .4byte gUnknown_203F440
_08155E1C: .4byte 0x00003004
	thumb_func_end unused_0

	thumb_func_start nullsub_98
nullsub_98: @ 8155E20
	bx lr
	thumb_func_end nullsub_98

	thumb_func_start sub_8155E24
sub_8155E24: @ 8155E24
	push {r4,lr}
	ldr r2, _08155E48 @ =gUnknown_203F440
	ldr r1, [r2]
	ldr r3, _08155E4C @ =0x00003014
	adds r1, r3
	movs r3, 0
	strb r3, [r1]
	ldr r1, [r2]
	movs r4, 0xC0
	lsls r4, 6
	adds r2, r1, r4
	str r3, [r2]
	ldr r2, _08155E50 @ =0x00003028
	adds r1, r2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08155E48: .4byte gUnknown_203F440
_08155E4C: .4byte 0x00003014
_08155E50: .4byte 0x00003028
	thumb_func_end sub_8155E24

	thumb_func_start sub_8155E54
sub_8155E54: @ 8155E54
	ldr r0, _08155E60 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r1, _08155E64 @ =0x00003028
	adds r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08155E60: .4byte gUnknown_203F440
_08155E64: .4byte 0x00003028
	thumb_func_end sub_8155E54

	thumb_func_start sub_8155E68
sub_8155E68: @ 8155E68
	push {lr}
	ldr r0, _08155E80 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08155E84
	movs r0, 0x1
	b _08155E86
	.align 2, 0
_08155E80: .4byte gUnknown_203F440
_08155E84:
	movs r0, 0
_08155E86:
	pop {r1}
	bx r1
	thumb_func_end sub_8155E68

	thumb_func_start sub_8155E8C
sub_8155E8C: @ 8155E8C
	ldr r0, _08155E98 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r1, _08155E9C @ =0x00003024
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08155E98: .4byte gUnknown_203F440
_08155E9C: .4byte 0x00003024
	thumb_func_end sub_8155E8C

	thumb_func_start sub_8155EA0
sub_8155EA0: @ 8155EA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _08155FD0 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08155FD4 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08155EC6:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08155EC6
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _08155FD0 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08155FD8 @ =sUnknown_847565C
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r0, 0
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
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	bl InitStandardTextBoxWindows
	bl ResetBg0
	movs r1, 0x82
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	ldr r4, _08155FDC @ =gUnknown_203F440
	ldr r1, [r4]
	movs r0, 0x3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r2
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 6
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08155FD0: .4byte 0x040000d4
_08155FD4: .4byte 0x81000800
_08155FD8: .4byte sUnknown_847565C
_08155FDC: .4byte gUnknown_203F440
	thumb_func_end sub_8155EA0

	thumb_func_start sub_8155FE0
sub_8155FE0: @ 8155FE0
	push {lr}
	sub sp, 0x4
	ldr r0, _08155FFC @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _08156000 @ =0x00003018
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _0815607A
	lsls r0, 2
	ldr r1, _08156004 @ =_08156008
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08155FFC: .4byte gUnknown_203F440
_08156000: .4byte 0x00003018
_08156004: .4byte _08156008
	.align 2, 0
_08156008:
	.4byte _08156020
	.4byte _08156030
	.4byte _08156036
	.4byte _08156044
	.4byte _0815605C
	.4byte _0815606A
_08156020:
	ldr r0, _0815602C @ =sDodrioBerryBgPal1
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	b _08156082
	.align 2, 0
_0815602C: .4byte sDodrioBerryBgPal1
_08156030:
	bl ResetTempTileDataBuffers
	b _08156082
_08156036:
	ldr r1, _08156040 @ =sDodrioBerryBgGfx1
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	b _0815604C
	.align 2, 0
_08156040: .4byte sDodrioBerryBgGfx1
_08156044:
	ldr r1, _08156058 @ =sDodrioBerryBgGfx2
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
_0815604C:
	movs r2, 0
	movs r3, 0
	bl DecompressAndCopyTileDataToVram
	b _08156082
	.align 2, 0
_08156058: .4byte sDodrioBerryBgGfx2
_0815605C:
	bl FreeTempTileDataBuffersIfPossible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08156082
	b _08156090
_0815606A:
	movs r0, 0x3
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	b _08156082
_0815607A:
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _08156092
_08156082:
	ldr r0, _08156098 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _0815609C @ =0x00003018
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08156090:
	movs r0, 0
_08156092:
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_08156098: .4byte gUnknown_203F440
_0815609C: .4byte 0x00003018
	thumb_func_end sub_8155FE0

	.align 2, 0 @ Don't pad with nop.
