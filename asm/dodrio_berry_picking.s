	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8154B34
sub_8154B34: @ 8154B34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, _08154B74 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r2, _08154B78 @ =0x00003014
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08154B7C
	cmp r0, 0x1
	bne _08154B54
	b _08154CE0
_08154B54:
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB4
	bhi _08154B62
	b _08154D82
_08154B62:
	bl sub_81533B4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcc _08154B72
	b _08154D5A
_08154B72:
	b _08154D34
	.align 2, 0
_08154B74: .4byte gUnknown_203F440
_08154B78: .4byte 0x00003014
_08154B7C:
	bl sub_81533B4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08154CB8 @ =sUnknown_8478E80
	subs r0, r7, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r5, [r0]
	ldr r2, _08154CBC @ =0xffffff00
	ldr r0, [sp, 0xC]
	ands r0, r2
	ldr r1, _08154CC0 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xE0
	lsls r1, 19
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r2
	movs r1, 0x2
	orrs r0, r1
	ldr r1, _08154CC4 @ =0xffff00ff
	ands r0, r1
	movs r1, 0xD0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _08154CC8 @ =0x0000ffff
	ands r0, r1
	movs r1, 0x98
	lsls r1, 13
	orrs r0, r1
	str r0, [sp, 0x10]
	movs r6, 0
	cmp r6, r7
	bcs _08154CAC
	mov r3, sp
	adds r3, 0xC
	str r3, [sp, 0x18]
	mov r10, r4
	ldr r0, _08154CCC @ =0x00003008
	mov r9, r0
_08154BD0:
	movs r1, 0
	mov r8, r1
	adds r0, r6, 0
	bl sub_81537AC
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sub_81533C4
	adds r1, r0, 0
	movs r0, 0
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	movs r1, 0x38
	subs r1, r0
	lsrs r1, 1
	str r1, [sp, 0x14]
	ldrb r0, [r5]
	lsls r0, 8
	ldr r2, _08154CC4 @ =0xffff00ff
	ldr r1, [sp, 0xC]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0xC]
	ldrb r2, [r5, 0x1]
	lsls r2, 16
	ldr r0, _08154CD0 @ =0xff00ffff
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0xC]
	add r0, sp, 0xC
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	add r1, r9
	adds r1, r6
	strb r0, [r1]
	ldr r0, [r2]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r3, r10
	ldr r0, [r3]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08154C4E
	movs r0, 0x2
	mov r8, r0
_08154C4E:
	adds r0, r4, 0
	bl sub_81533C4
	adds r4, r0, 0
	mov r1, r10
	ldr r0, [r1]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	ldr r3, [sp, 0x14]
	lsls r2, r3, 24
	lsrs r2, 24
	mov r3, r8
	lsls r1, r3, 1
	add r1, r8
	ldr r3, _08154CD4 @ =sUnknown_8478E38
	adds r1, r3
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0
	movs r3, 0x1
	bl AddTextPrinterParameterized3
	mov r2, r10
	ldr r0, [r2]
	add r0, r9
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r3, [sp, 0x18]
	ldrh r0, [r3, 0x6]
	adds r0, 0xE
	strh r0, [r3, 0x6]
	add r0, sp, 0xC
	bl sub_8154868
	adds r5, 0x4
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08154BD0
_08154CAC:
	ldr r0, _08154CD8 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08154CDC @ =0x00003014
	adds r1, r0
	b _08154D1E
	.align 2, 0
_08154CB8: .4byte sUnknown_8478E80
_08154CBC: .4byte 0xffffff00
_08154CC0: .4byte 0x00ffffff
_08154CC4: .4byte 0xffff00ff
_08154CC8: .4byte 0x0000ffff
_08154CCC: .4byte 0x00003008
_08154CD0: .4byte 0xff00ffff
_08154CD4: .4byte sUnknown_8478E38
_08154CD8: .4byte gUnknown_203F440
_08154CDC: .4byte 0x00003014
_08154CE0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08154D82
	bl sub_81533B4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcs _08154D10
_08154CF8:
	ldr r0, [r4]
	ldr r1, _08154D28 @ =0x00003008
	adds r0, r1
	adds r0, r6
	ldrb r0, [r0]
	bl PutWindowTilemap
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08154CF8
_08154D10:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08154D2C @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r2, _08154D30 @ =0x00003014
	adds r1, r2
_08154D1E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08154D82
	.align 2, 0
_08154D28: .4byte 0x00003008
_08154D2C: .4byte gUnknown_203F440
_08154D30: .4byte 0x00003014
_08154D34:
	ldr r5, _08154D94 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r4, _08154D98 @ =0x00003008
	adds r0, r4
	adds r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	adds r0, r6
	ldrb r0, [r0]
	bl RemoveWindow
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _08154D34
_08154D5A:
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
	ldr r0, _08154D94 @ =gUnknown_203F440
	ldr r0, [r0]
	movs r3, 0xC0
	lsls r3, 6
	adds r0, r3
	movs r1, 0x1
	str r1, [r0]
_08154D82:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154D94: .4byte gUnknown_203F440
_08154D98: .4byte 0x00003008
	thumb_func_end sub_8154B34

	thumb_func_start sub_8154D9C
sub_8154D9C: @ 8154D9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x70
	lsls r0, 24
	movs r1, 0
	mov r8, r1
	movs r6, 0
	lsrs r7, r0, 24
	add r4, sp, 0x2C
	ldr r1, _08154F64 @ =gUnknown_8478F14
	adds r0, r4, 0
	movs r2, 0x5
	bl memcpy
	movs r5, 0
	cmp r5, r7
	bcs _08154DEC
	add r4, sp, 0x34
_08154DC6:
	mov r0, sp
	adds r0, r5
	adds r0, 0x2C
	strb r5, [r0]
	add r0, sp, 0x5C
	adds r1, r5, 0
	bl sub_81536A0
	lsls r2, r5, 3
	adds r2, r4, r2
	ldr r0, [sp, 0x5C]
	ldr r1, [sp, 0x60]
	str r0, [r2]
	str r1, [r2, 0x4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154DC6
_08154DEC:
	bl sub_81534AC
	cmp r0, 0
	beq _08154E22
_08154DF4:
	movs r5, 0
	cmp r5, r7
	bcs _08154E1C
	add r2, sp, 0x34
	add r1, sp, 0x2C
_08154DFE:
	lsls r0, r5, 3
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r8
	bne _08154E12
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08154E12:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154DFE
_08154E1C:
	mov r8, r6
	cmp r6, r7
	bcc _08154DF4
_08154E22:
	movs r5, 0
	ldr r4, _08154F68 @ =gText_SpacePoints
	cmp r5, r7
	bcs _08154E48
	add r1, sp, 0x34
	add r6, sp, 0x38
	subs r3, r7, 0x1
_08154E30:
	lsls r2, r5, 3
	adds r0, r6, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _08154E3E
	adds r0, r1, r2
	strb r3, [r0]
_08154E3E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154E30
_08154E48:
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r1, 0xD8
	subs r1, r0
	str r1, [sp, 0x64]
	movs r5, 0
	cmp r5, r7
	bcs _08154F52
	mov r2, sp
	adds r2, 0x34
	str r2, [sp, 0x68]
	ldr r3, _08154F6C @ =0x00003009
	mov r10, r3
	adds r0, r1, 0
	subs r0, 0x23
	lsls r0, 24
	str r0, [sp, 0x6C]
_08154E70:
	movs r4, 0
	mov r8, r4
	mov r0, sp
	adds r0, r5
	adds r0, 0x2C
	ldrb r0, [r0]
	adds r4, r0, 0
	lsls r1, r4, 3
	add r0, sp, 0x38
	adds r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r2, _08154F70 @ =gUnknown_203F440
	ldr r0, [r2]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, _08154F74 @ =sUnknown_8478E94
	ldr r3, [sp, 0x68]
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r3, _08154F78 @ =sUnknown_8478EBA
	lsls r1, r5, 1
	adds r1, r3
	ldrb r6, [r1]
	str r6, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	mov r3, r8
	str r3, [sp, 0x8]
	movs r1, 0
	movs r3, 0x8
	bl AddTextPrinterParameterized
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08154EC8
	movs r0, 0x2
	mov r8, r0
_08154EC8:
	adds r0, r4, 0
	bl sub_81533C4
	adds r3, r0, 0
	ldr r1, _08154F70 @ =gUnknown_203F440
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	mov r2, r8
	lsls r1, r2, 1
	add r1, r8
	ldr r2, _08154F7C @ =sUnknown_8478E38
	adds r1, r2
	str r1, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r1, 0
	movs r2, 0x1C
	adds r3, r6, 0
	bl AddTextPrinterParameterized3
	add r0, sp, 0xC
	mov r1, r9
	movs r2, 0x1
	movs r3, 0x7
	bl ConvertIntToDecimalStringN
	movs r0, 0
	add r1, sp, 0xC
	adds r2, r4, 0
	bl GetStringWidth
	ldr r1, _08154F70 @ =gUnknown_203F440
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	str r6, [sp]
	movs r2, 0xFF
	str r2, [sp, 0x4]
	movs r3, 0
	str r3, [sp, 0x8]
	movs r1, 0
	add r2, sp, 0xC
	ldr r4, [sp, 0x6C]
	lsrs r3, r4, 24
	bl AddTextPrinterParameterized
	ldr r1, _08154F70 @ =gUnknown_203F440
	ldr r0, [r1]
	add r0, r10
	ldrb r0, [r0]
	ldr r2, [sp, 0x64]
	lsls r3, r2, 24
	str r6, [sp]
	movs r4, 0xFF
	str r4, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	ldr r2, _08154F68 @ =gText_SpacePoints
	lsrs r3, 24
	bl AddTextPrinterParameterized
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08154E70
_08154F52:
	add sp, 0x70
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08154F64: .4byte gUnknown_8478F14
_08154F68: .4byte gText_SpacePoints
_08154F6C: .4byte 0x00003009
_08154F70: .4byte gUnknown_203F440
_08154F74: .4byte sUnknown_8478E94
_08154F78: .4byte sUnknown_8478EBA
_08154F7C: .4byte sUnknown_8478E38
	thumb_func_end sub_8154D9C

	thumb_func_start sub_8154F80
sub_8154F80: @ 8154F80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8C
	bl sub_81533B4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x84]
	ldr r6, _08154FB0 @ =gUnknown_203F440
	ldr r1, [r6]
	ldr r2, _08154FB4 @ =0x00003014
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xB
	bls _08154FA6
	b _08155678
_08154FA6:
	lsls r0, 2
	ldr r1, _08154FB8 @ =_08154FBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08154FB0: .4byte gUnknown_203F440
_08154FB4: .4byte 0x00003014
_08154FB8: .4byte _08154FBC
	.align 2, 0
_08154FBC:
	.4byte _08154FEC
	.4byte _08155008
	.4byte _08155060
	.4byte _0815524C
	.4byte _08155298
	.4byte _081552DC
	.4byte _08155340
	.4byte _0815537C
	.4byte _081553C0
	.4byte _08155480
	.4byte _081555D8
	.4byte _0815562C
_08154FEC:
	bl sub_81535B0
	ldr r0, _08155000 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08155004 @ =0x0000301c
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	b _0815565A
	.align 2, 0
_08155000: .4byte gUnknown_203F440
_08155004: .4byte 0x0000301c
_08155008:
	ldr r6, _08155050 @ =sUnknown_8475674
	adds r0, r6, 0
	bl AddWindow
	ldr r4, _08155054 @ =gUnknown_203F440
	ldr r1, [r4]
	ldr r2, _08155058 @ =0x00003008
	mov r8, r2
	add r1, r8
	strb r0, [r1]
	movs r0, 0x8
	adds r0, r6
	mov r9, r0
	bl AddWindow
	ldr r1, [r4]
	ldr r5, _0815505C @ =0x00003009
	adds r1, r5
	strb r0, [r1]
	ldr r0, [r4]
	add r0, r8
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, 0
	bl sub_8154868
	mov r0, r9
	bl sub_8154868
	b _08155658
	.align 2, 0
_08155050: .4byte sUnknown_8475674
_08155054: .4byte gUnknown_203F440
_08155058: .4byte 0x00003008
_0815505C: .4byte 0x00003009
_08155060:
	ldr r4, _081551A8 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r5, _081551AC @ =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _081551B0 @ =0x00003009
	mov r9, r1
	add r0, r9
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _081551B4 @ =gText_BerryPickingResults
	mov r8, r2
	movs r2, 0x1
	negs r2, r2
	movs r0, 0
	mov r1, r8
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x2
	str r1, [sp]
	movs r6, 0xFF
	str r6, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r1, 0
	mov r2, r8
	bl AddTextPrinterParameterized
	ldr r0, [r4]
	add r0, r9
	ldrb r0, [r0]
	ldr r2, _081551B8 @ =gText_10P30P50P50P
	movs r1, 0x10
	str r1, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0
	movs r3, 0x44
	bl AddTextPrinterParameterized
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0x84]
	cmp r9, r1
	bcc _081550DA
	b _08155214
_081550DA:
	movs r5, 0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r9, r0
	bne _081550EA
	movs r5, 0x2
_081550EA:
	mov r0, r9
	bl sub_81533C4
	adds r6, r0, 0
	ldr r0, _081551A8 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _081551B0 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	ldr r1, _081551BC @ =sUnknown_8478EB0
	mov r2, r9
	lsls r4, r2, 1
	adds r4, r1
	ldrb r3, [r4]
	lsls r1, r5, 1
	adds r1, r5
	ldr r2, _081551C0 @ =sUnknown_8478E38
	adds r1, r2
	str r1, [sp]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0
	movs r2, 0x2
	bl AddTextPrinterParameterized3
	movs r7, 0
	mov r0, r9
	adds r0, 0x1
	str r0, [sp, 0x88]
	mov r8, r4
	ldr r1, _081551C4 @ =sUnknown_8478EA8
	mov r10, r1
_0815512E:
	mov r0, r9
	adds r1, r7, 0
	bl sub_8153404
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081551C8 @ =0x0000270f
	bl Min
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl sub_81534F0
	ldr r1, _081551C8 @ =0x0000270f
	bl Min
	lsls r0, 16
	lsrs r6, r0, 16
	add r0, sp, 0xC
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r0, 0
	add r1, sp, 0xC
	movs r2, 0x1
	negs r2, r2
	bl GetStringWidth
	adds r5, r0, 0
	cmp r6, r4
	bne _081551D0
	cmp r6, 0
	beq _081551D0
	ldr r0, _081551A8 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _081551B0 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	lsls r1, r7, 1
	add r1, r10
	ldrb r2, [r1]
	subs r2, r5
	lsls r2, 24
	lsrs r2, 24
	mov r1, r8
	ldrb r3, [r1]
	ldr r1, _081551CC @ =sUnknown_8478E38+0x3
	str r1, [sp]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0x4]
	add r1, sp, 0xC
	str r1, [sp, 0x8]
	movs r1, 0
	bl AddTextPrinterParameterized3
	b _081551FA
	.align 2, 0
_081551A8: .4byte gUnknown_203F440
_081551AC: .4byte 0x00003008
_081551B0: .4byte 0x00003009
_081551B4: .4byte gText_BerryPickingResults
_081551B8: .4byte gText_10P30P50P50P
_081551BC: .4byte sUnknown_8478EB0
_081551C0: .4byte sUnknown_8478E38
_081551C4: .4byte sUnknown_8478EA8
_081551C8: .4byte 0x0000270f
_081551CC: .4byte sUnknown_8478E38+0x3
_081551D0:
	ldr r0, _0815523C @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _08155240 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	lsls r1, r7, 1
	add r1, r10
	ldrb r3, [r1]
	subs r3, r5
	lsls r3, 24
	lsrs r3, 24
	mov r2, r8
	ldrb r1, [r2]
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	add r2, sp, 0xC
	bl AddTextPrinterParameterized
_081551FA:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _0815512E
	ldr r1, [sp, 0x88]
	lsls r0, r1, 24
	lsrs r0, 24
	mov r9, r0
	ldr r2, [sp, 0x84]
	cmp r9, r2
	bcs _08155214
	b _081550DA
_08155214:
	ldr r4, _0815523C @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155244 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08155240 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _08155248 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_0815523C: .4byte gUnknown_203F440
_08155240: .4byte 0x00003009
_08155244: .4byte 0x00003008
_08155248: .4byte 0x00003014
_0815524C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08155270
	ldr r4, _08155288 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815528C @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _08155290 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_08155270:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0
	bl sub_8154324
	ldr r0, _08155288 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08155294 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_08155288: .4byte gUnknown_203F440
_0815528C: .4byte 0x00003008
_08155290: .4byte 0x00003009
_08155294: .4byte 0x00003014
_08155298:
	ldr r4, _081552D0 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _081552D4 @ =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _081552B0
	b _081556C8
_081552B0:
	ldr r0, _081552D8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081552BE
	b _081556C8
_081552BE:
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_8154324
	b _08155658
	.align 2, 0
_081552D0: .4byte gUnknown_203F440
_081552D4: .4byte 0x0000301c
_081552D8: .4byte gMain
_081552DC:
	ldr r4, _08155330 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r5, _08155334 @ =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08155338 @ =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r6, _0815533C @ =gText_AnnouncingRankings
	movs r2, 0x1
	negs r2, r2
	movs r0, 0
	adds r1, r6, 0
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r2, r6, 0
	bl AddTextPrinterParameterized
	b _08155658
	.align 2, 0
_08155330: .4byte gUnknown_203F440
_08155334: .4byte 0x00003008
_08155338: .4byte 0x00003009
_0815533C: .4byte gText_AnnouncingRankings
_08155340:
	ldr r0, [sp, 0x84]
	bl sub_8154D9C
	ldr r4, _0815536C @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155370 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08155374 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _08155378 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_0815536C: .4byte gUnknown_203F440
_08155370: .4byte 0x00003008
_08155374: .4byte 0x00003009
_08155378: .4byte 0x00003014
_0815537C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081553A0
	ldr r4, _081553B0 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _081553B4 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _081553B8 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_081553A0:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _081553B0 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _081553BC @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_081553B0: .4byte gUnknown_203F440
_081553B4: .4byte 0x00003008
_081553B8: .4byte 0x00003009
_081553BC: .4byte 0x00003014
_081553C0:
	ldr r4, _08155408 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815540C @ =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _081553D8
	b _081556C8
_081553D8:
	ldr r0, _08155410 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081553E6
	b _081556C8
_081553E6:
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl PlaySE
	bl sub_81534AC
	ldr r1, _08155414 @ =0x00000bb7
	cmp r0, r1
	bhi _0815541C
	ldr r0, [r4]
	ldr r2, _08155418 @ =0x00003014
	adds r0, r2
	movs r1, 0x7F
	strb r1, [r0]
	b _0815542C
	.align 2, 0
_08155408: .4byte gUnknown_203F440
_0815540C: .4byte 0x0000301c
_08155410: .4byte gMain
_08155414: .4byte 0x00000bb7
_08155418: .4byte 0x00003014
_0815541C:
	bl StopMapMusic
	ldr r1, [r4]
	ldr r0, _08155470 @ =0x00003014
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0815542C:
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x5
	bl FillBgTilemapBufferRect_Palette0
	ldr r5, _08155474 @ =gUnknown_203F440
	ldr r0, [r5]
	ldr r4, _08155478 @ =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r6, _0815547C @ =sUnknown_8475684
	adds r0, r6, 0
	bl AddWindow
	ldr r1, [r5]
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, 0
	bl sub_8154868
	b _081556C8
	.align 2, 0
_08155470: .4byte 0x00003014
_08155474: .4byte gUnknown_203F440
_08155478: .4byte 0x00003009
_0815547C: .4byte sUnknown_8475684
_08155480:
	ldr r0, _08155558 @ =0x00000101
	bl PlayNewMapMusic
	ldr r4, _0815555C @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r6, _08155560 @ =0x00003008
	adds r0, r6
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08155564 @ =0x00003009
	mov r10, r1
	add r0, r10
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r5, _08155568 @ =gText_AnnouncingPrizes
	movs r2, 0x1
	negs r2, r2
	movs r0, 0
	adds r1, r5, 0
	bl GetStringWidth
	adds r1, r0, 0
	movs r0, 0xE0
	subs r0, r1
	lsrs r3, r0, 1
	ldr r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0x2
	mov r9, r2
	str r2, [sp]
	movs r1, 0xFF
	mov r8, r1
	str r1, [sp, 0x4]
	movs r6, 0
	str r6, [sp, 0x8]
	movs r1, 0
	adds r2, r5, 0
	bl AddTextPrinterParameterized
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_8153390
	lsls r0, 16
	lsrs r0, 16
	add r5, sp, 0x70
	adds r1, r5, 0
	bl CopyItemName
	movs r0, 0
	adds r1, r5, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, _0815556C @ =gText_FirstPlacePrize
	add r0, sp, 0xC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r0, [r4]
	add r0, r10
	ldrb r0, [r0]
	mov r2, r9
	str r2, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0
	add r2, sp, 0xC
	movs r3, 0x8
	bl AddTextPrinterParameterized
	bl sub_815372C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	cmp r4, 0
	beq _0815559E
	cmp r4, 0x3
	beq _0815559E
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_8153390
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl CopyItemName
	movs r0, 0
	adds r1, r5, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	cmp r4, 0x2
	bne _08155574
	ldr r1, _08155570 @ =gText_CantHoldAnyMore
	add r0, sp, 0xC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _08155580
	.align 2, 0
_08155558: .4byte 0x00000101
_0815555C: .4byte gUnknown_203F440
_08155560: .4byte 0x00003008
_08155564: .4byte 0x00003009
_08155568: .4byte gText_AnnouncingPrizes
_0815556C: .4byte gText_FirstPlacePrize
_08155570: .4byte gText_CantHoldAnyMore
_08155574:
	cmp r6, 0x1
	bne _08155580
	ldr r1, _081555C4 @ =gText_FilledStorageSpace
	add r0, sp, 0xC
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
_08155580:
	ldr r0, _081555C8 @ =gUnknown_203F440
	ldr r0, [r0]
	ldr r2, _081555CC @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x28
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	add r2, sp, 0xC
	movs r3, 0x8
	bl AddTextPrinterParameterized
_0815559E:
	ldr r4, _081555C8 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _081555D0 @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _081555CC @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _081555D4 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_081555C4: .4byte gText_FilledStorageSpace
_081555C8: .4byte gUnknown_203F440
_081555CC: .4byte 0x00003009
_081555D0: .4byte 0x00003008
_081555D4: .4byte 0x00003014
_081555D8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081555FC
	ldr r4, _08155618 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815561C @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _08155620 @ =0x00003009
	adds r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_081555FC:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08155624 @ =0x00000137
	movs r1, 0x14
	movs r2, 0xA
	bl FadeOutAndFadeInNewMapMusic
	ldr r0, _08155618 @ =gUnknown_203F440
	ldr r1, [r0]
	ldr r0, _08155628 @ =0x00003014
	adds r1, r0
	b _0815565E
	.align 2, 0
_08155618: .4byte gUnknown_203F440
_0815561C: .4byte 0x00003008
_08155620: .4byte 0x00003009
_08155624: .4byte 0x00000137
_08155628: .4byte 0x00003014
_0815562C:
	ldr r4, _08155668 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _0815566C @ =0x0000301c
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bls _081556C8
	ldr r0, _08155670 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081556C8
	movs r0, 0
	strh r0, [r2]
	movs r0, 0x5
	bl PlaySE
_08155658:
	ldr r1, [r4]
_0815565A:
	ldr r2, _08155674 @ =0x00003014
	adds r1, r2
_0815565E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081556C8
	.align 2, 0
_08155668: .4byte gUnknown_203F440
_0815566C: .4byte 0x0000301c
_08155670: .4byte gMain
_08155674: .4byte 0x00003014
_08155678:
	ldr r5, _081556D8 @ =0x00003008
	adds r0, r1, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	ldr r4, _081556DC @ =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl RemoveWindow
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
	movs r1, 0xC0
	lsls r1, 6
	adds r0, r1
	movs r1, 0x1
	str r1, [r0]
_081556C8:
	add sp, 0x8C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081556D8: .4byte 0x00003008
_081556DC: .4byte 0x00003009
	thumb_func_end sub_8154F80

	thumb_func_start sub_81556E0
sub_81556E0: @ 81556E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r1, _08155708 @ =gUnknown_203F440
	ldr r2, [r1]
	ldr r0, _0815570C @ =0x00003014
	mov r9, r0
	adds r0, r2, r0
	ldrb r7, [r0]
	mov r10, r1
	cmp r7, 0x1
	beq _0815579C
	cmp r7, 0x1
	bgt _08155710
	cmp r7, 0
	beq _0815571E
	b _081559EC
	.align 2, 0
_08155708: .4byte gUnknown_203F440
_0815570C: .4byte 0x00003014
_08155710:
	cmp r7, 0x2
	bne _08155716
	b _08155868
_08155716:
	cmp r7, 0x3
	bne _0815571C
	b _081558A4
_0815571C:
	b _081559EC
_0815571E:
	ldr r5, _08155788 @ =sUnknown_847568C
	adds r0, r5, 0
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	ldr r3, _0815578C @ =0x00003008
	adds r1, r3
	strb r0, [r1]
	movs r0, 0x8
	adds r0, r5
	mov r8, r0
	bl AddWindow
	mov r2, r10
	ldr r1, [r2]
	ldr r4, _08155790 @ =0x00003009
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r2]
	ldr r3, _0815578C @ =0x00003008
	adds r0, r3
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r1, r10
	ldr r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r5, 0
	bl sub_8154868
	mov r0, r8
	bl sub_8154768
	mov r2, r10
	ldr r1, [r2]
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	ldr r3, _08155794 @ =0x00003020
	adds r0, r3
	strb r7, [r0]
	ldr r0, [r2]
	ldr r1, _08155798 @ =0x00003024
	adds r0, r1
	strb r7, [r0]
	b _08155A58
	.align 2, 0
_08155788: .4byte sUnknown_847568C
_0815578C: .4byte 0x00003008
_08155790: .4byte 0x00003009
_08155794: .4byte 0x00003020
_08155798: .4byte 0x00003024
_0815579C:
	ldr r3, _0815584C @ =0x00003008
	mov r8, r3
	adds r0, r2, r3
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	mov r1, r10
	ldr r0, [r1]
	ldr r7, _08155850 @ =0x00003009
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	mov r2, r10
	ldr r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _08155854 @ =gText_WantToPlayAgain
	movs r1, 0x6
	str r1, [sp]
	movs r5, 0xFF
	str r5, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	mov r3, r10
	ldr r0, [r3]
	adds r0, r7
	ldrb r0, [r0]
	ldr r2, _08155858 @ =gText_Yes
	movs r1, 0x2
	mov r9, r1
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r2, r10
	ldr r0, [r2]
	adds r0, r7
	ldrb r0, [r0]
	ldr r2, _0815585C @ =gText_No
	movs r1, 0x10
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r3, r10
	ldr r0, [r3]
	adds r0, r7
	ldrb r0, [r0]
	ldr r2, _08155860 @ =gFameCheckerText_ListMenuCursor
	mov r1, r9
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	mov r2, r10
	ldr r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	mov r3, r10
	ldr r0, [r3]
	adds r0, r7
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram
	mov r0, r10
	ldr r1, [r0]
	ldr r2, _08155864 @ =0x00003014
	adds r1, r2
	b _081559DA
	.align 2, 0
_0815584C: .4byte 0x00003008
_08155850: .4byte 0x00003009
_08155854: .4byte gText_WantToPlayAgain
_08155858: .4byte gText_Yes
_0815585C: .4byte gText_No
_08155860: .4byte gFameCheckerText_ListMenuCursor
_08155864: .4byte 0x00003014
_08155868:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0815588E
	mov r3, r10
	ldr r0, [r3]
	ldr r1, _0815589C @ =0x00003008
	adds r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	mov r2, r10
	ldr r0, [r2]
	ldr r3, _081558A0 @ =0x00003009
	adds r0, r3
	ldrb r0, [r0]
	bl PutWindowTilemap
_0815588E:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	mov r0, r10
	ldr r1, [r0]
	add r1, r9
	b _081559DA
	.align 2, 0
_0815589C: .4byte 0x00003008
_081558A0: .4byte 0x00003009
_081558A4:
	ldr r1, _0815590C @ =0x00003020
	adds r0, r2, r1
	ldrb r7, [r0]
	cmp r7, 0
	bne _081558B0
	movs r7, 0x1
_081558B0:
	ldr r4, _08155910 @ =0x00003009
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	mov r2, r10
	ldr r0, [r2]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155914 @ =gText_Yes
	movs r3, 0x2
	mov r8, r3
	str r3, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r2, r10
	ldr r0, [r2]
	adds r0, r4
	ldrb r0, [r0]
	ldr r2, _08155918 @ =gText_No
	movs r6, 0x10
	str r6, [sp]
	movs r3, 0xFF
	str r3, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl AddTextPrinterParameterized
	mov r1, r10
	ldr r0, [r1]
	adds r0, r4
	ldrb r1, [r0]
	ldr r2, _0815591C @ =gFameCheckerText_ListMenuCursor
	cmp r7, 0x1
	bne _08155920
	mov r3, r8
	str r3, [sp]
	b _08155922
	.align 2, 0
_0815590C: .4byte 0x00003020
_08155910: .4byte 0x00003009
_08155914: .4byte gText_Yes
_08155918: .4byte gText_No
_0815591C: .4byte gFameCheckerText_ListMenuCursor
_08155920:
	str r6, [sp]
_08155922:
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	ldr r4, _08155970 @ =gUnknown_203F440
	ldr r0, [r4]
	ldr r1, _08155974 @ =0x00003009
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _08155978 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08155984
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r2, _0815597C @ =0x00003020
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _08155966
	strb r5, [r1]
_08155966:
	ldr r1, [r4]
	ldr r3, _08155980 @ =0x00003014
	adds r1, r3
	b _081559DA
	.align 2, 0
_08155970: .4byte gUnknown_203F440
_08155974: .4byte 0x00003009
_08155978: .4byte gMain
_0815597C: .4byte 0x00003020
_08155980: .4byte 0x00003014
_08155984:
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _081559BC
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r2, _081559A8 @ =0x00003020
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _081559B2
	cmp r0, 0x1
	bgt _081559AC
	cmp r0, 0
	beq _081559B2
	b _08155A58
	.align 2, 0
_081559A8: .4byte 0x00003020
_081559AC:
	cmp r0, 0x2
	beq _081559B8
	b _08155A58
_081559B2:
	movs r0, 0x2
	strb r0, [r1]
	b _08155A58
_081559B8:
	strb r5, [r1]
	b _08155A58
_081559BC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08155A58
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	ldr r3, _081559E4 @ =0x00003020
	adds r0, r3
	movs r1, 0x2
	strb r1, [r0]
	ldr r1, [r4]
	ldr r0, _081559E8 @ =0x00003014
	adds r1, r0
_081559DA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08155A58
	.align 2, 0
_081559E4: .4byte 0x00003020
_081559E8: .4byte 0x00003014
_081559EC:
	mov r1, r10
	ldr r0, [r1]
	ldr r2, _08155A68 @ =0x00003020
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r3, _08155A6C @ =0x00003024
	adds r0, r3
	strb r1, [r0]
	mov r1, r10
	ldr r0, [r1]
	ldr r5, _08155A70 @ =0x00003008
	adds r0, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r2, r10
	ldr r0, [r2]
	ldr r4, _08155A74 @ =0x00003009
	adds r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r3, r10
	ldr r0, [r3]
	adds r0, r5
	ldrb r0, [r0]
	bl RemoveWindow
	mov r1, r10
	ldr r0, [r1]
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
	mov r2, r10
	ldr r0, [r2]
	movs r3, 0xC0
	lsls r3, 6
	adds r0, r3
	movs r1, 0x1
	str r1, [r0]
_08155A58:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08155A68: .4byte 0x00003020
_08155A6C: .4byte 0x00003024
_08155A70: .4byte 0x00003008
_08155A74: .4byte 0x00003009
	thumb_func_end sub_81556E0

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
