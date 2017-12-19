	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_806ED54
sub_806ED54: @ 806ED54
	push {lr}
	ldr r0, _0806ED6C @ =gUnknown_20370F5
	movs r1, 0
	strb r1, [r0]
	bl sub_805642C
	cmp r0, 0x1
	bne _0806ED70
	bl sub_806EE34
	b _0806ED90
	.align 2, 0
_0806ED6C: .4byte gUnknown_20370F5
_0806ED70:
	bl InUnionRoom
	cmp r0, 0x1
	bne _0806ED7E
	bl sub_806EE58
	b _0806ED90
_0806ED7E:
	bl GetSafariZoneFlag
	cmp r0, 0x1
	bne _0806ED8C
	bl sub_806EE04
	b _0806ED90
_0806ED8C:
	bl sub_806EDB0
_0806ED90:
	pop {r0}
	bx r0
	thumb_func_end sub_806ED54

	thumb_func_start sub_806ED94
sub_806ED94: @ 806ED94
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0806EDA8 @ =gUnknown_20370F6
	ldr r1, _0806EDAC @ =gUnknown_20370F5
	bl AppendToList
	pop {r0}
	bx r0
	.align 2, 0
_0806EDA8: .4byte gUnknown_20370F6
_0806EDAC: .4byte gUnknown_20370F5
	thumb_func_end sub_806ED94

	thumb_func_start sub_806EDB0
sub_806EDB0: @ 806EDB0
	push {lr}
	ldr r0, _0806EDFC @ =0x00000829
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EDC6
	movs r0, 0
	bl sub_806ED94
_0806EDC6:
	ldr r0, _0806EE00 @ =0x00000828
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EDDA
	movs r0, 0x1
	bl sub_806ED94
_0806EDDA:
	movs r0, 0x2
	bl sub_806ED94
	movs r0, 0x3
	bl sub_806ED94
	movs r0, 0x4
	bl sub_806ED94
	movs r0, 0x5
	bl sub_806ED94
	movs r0, 0x6
	bl sub_806ED94
	pop {r0}
	bx r0
	.align 2, 0
_0806EDFC: .4byte 0x00000829
_0806EE00: .4byte 0x00000828
	thumb_func_end sub_806EDB0

	thumb_func_start sub_806EE04
sub_806EE04: @ 806EE04
	push {lr}
	movs r0, 0x7
	bl sub_806ED94
	movs r0, 0
	bl sub_806ED94
	movs r0, 0x1
	bl sub_806ED94
	movs r0, 0x2
	bl sub_806ED94
	movs r0, 0x3
	bl sub_806ED94
	movs r0, 0x5
	bl sub_806ED94
	movs r0, 0x6
	bl sub_806ED94
	pop {r0}
	bx r0
	thumb_func_end sub_806EE04

	thumb_func_start sub_806EE34
sub_806EE34: @ 806EE34
	push {lr}
	movs r0, 0x1
	bl sub_806ED94
	movs r0, 0x2
	bl sub_806ED94
	movs r0, 0x8
	bl sub_806ED94
	movs r0, 0x5
	bl sub_806ED94
	movs r0, 0x6
	bl sub_806ED94
	pop {r0}
	bx r0
	thumb_func_end sub_806EE34

	thumb_func_start sub_806EE58
sub_806EE58: @ 806EE58
	push {lr}
	movs r0, 0x1
	bl sub_806ED94
	movs r0, 0x2
	bl sub_806ED94
	movs r0, 0x3
	bl sub_806ED94
	movs r0, 0x5
	bl sub_806ED94
	movs r0, 0x6
	bl sub_806ED94
	pop {r0}
	bx r0
	thumb_func_end sub_806EE58

	thumb_func_start sub_806EE7C
sub_806EE7C: @ 806EE7C
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r4, _0806EEF4 @ =gUnknown_2037101
	ldr r0, _0806EEF8 @ =gUnknown_83A738C
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0
	bl sub_80F6F1C
	ldr r0, _0806EEFC @ =gStringVar1
	ldr r1, _0806EF00 @ =gUnknown_2039996
	ldrh r1, [r1]
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _0806EF04 @ =gStringVar2
	movs r1, 0x96
	lsls r1, 2
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _0806EF08 @ =gStringVar3
	ldr r1, _0806EF0C @ =gUnknown_2039994
	ldrb r1, [r1]
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r5, _0806EF10 @ =gStringVar4
	ldr r1, _0806EF14 @ =gUnknown_84162A9
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldrb r0, [r4]
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0x4
	bl PrintTextOnWindow
	ldrb r0, [r4]
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EEF4: .4byte gUnknown_2037101
_0806EEF8: .4byte gUnknown_83A738C
_0806EEFC: .4byte gStringVar1
_0806EF00: .4byte gUnknown_2039996
_0806EF04: .4byte gStringVar2
_0806EF08: .4byte gStringVar3
_0806EF0C: .4byte gUnknown_2039994
_0806EF10: .4byte gStringVar4
_0806EF14: .4byte gUnknown_84162A9
	thumb_func_end sub_806EE7C

	thumb_func_start sub_806EF18
sub_806EF18: @ 806EF18
	push {r4,lr}
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _0806EF3A
	ldr r4, _0806EF40 @ =gUnknown_2037101
	ldrb r0, [r4]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
_0806EF3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF40: .4byte gUnknown_2037101
	thumb_func_end sub_806EF18

	thumb_func_start sub_806EF44
sub_806EF44: @ 806EF44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r8, r0
	lsls r1, 24
	lsrs r6, r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _0806EF9C @ =gUnknown_83A7344
	mov r10, r0
	ldr r1, _0806EFA0 @ =gStringVar4
	mov r9, r1
_0806EF68:
	ldr r1, _0806EFA4 @ =gUnknown_20370F6
	lsls r0, r2, 16
	asrs r5, r0, 16
	adds r4, r5, r1
	ldrb r1, [r4]
	adds r7, r0, 0
	cmp r1, 0x3
	beq _0806EF7C
	cmp r1, 0x8
	bne _0806EFA8
_0806EF7C:
	bl GetStartMenuWindowId
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	lsls r1, 3
	add r1, r10
	ldr r1, [r1]
	lsls r3, r5, 4
	subs r3, r5
	lsls r3, 16
	lsrs r3, 16
	movs r2, 0x8
	bl sub_812E6DC
	b _0806EFDA
	.align 2, 0
_0806EF9C: .4byte gUnknown_83A7344
_0806EFA0: .4byte gStringVar4
_0806EFA4: .4byte gUnknown_20370F6
_0806EFA8:
	ldrb r0, [r4]
	lsls r0, 3
	add r0, r10
	ldr r1, [r0]
	mov r0, r9
	bl StringExpandPlaceholders
	bl GetStartMenuWindowId
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r5, 4
	subs r1, r5
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	mov r2, r9
	movs r3, 0x8
	bl PrintTextOnWindow
_0806EFDA:
	movs r0, 0x80
	lsls r0, 9
	adds r1, r7, r0
	lsrs r2, r1, 16
	asrs r1, 16
	ldr r0, _0806F000 @ =gUnknown_20370F5
	ldrb r0, [r0]
	cmp r1, r0
	bge _0806F004
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _0806EF68
	mov r1, r8
	strb r2, [r1]
	movs r0, 0
	b _0806F00A
	.align 2, 0
_0806F000: .4byte gUnknown_20370F5
_0806F004:
	mov r0, r8
	strb r2, [r0]
	movs r0, 0x1
_0806F00A:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806EF44

	thumb_func_start sub_806F01C
sub_806F01C: @ 806F01C
	push {r4,lr}
	sub sp, 0xC
	ldr r0, _0806F038 @ =gUnknown_20370FF
	movs r1, 0
	ldrsb r1, [r0, r1]
	adds r2, r0, 0
	cmp r1, 0x5
	bls _0806F02E
	b _0806F140
_0806F02E:
	lsls r0, r1, 2
	ldr r1, _0806F03C @ =_0806F040
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806F038: .4byte gUnknown_20370FF
_0806F03C: .4byte _0806F040
	.align 2, 0
_0806F040:
	.4byte _0806F058
	.4byte _0806F060
	.4byte _0806F06C
	.4byte _0806F090
	.4byte _0806F0A4
	.4byte _0806F0C4
_0806F058:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _0806F140
_0806F060:
	bl sub_806ED54
	ldr r1, _0806F068 @ =gUnknown_20370FF
	b _0806F0B8
	.align 2, 0
_0806F068: .4byte gUnknown_20370FF
_0806F06C:
	bl sub_80F6E9C
	ldr r0, _0806F088 @ =gUnknown_20370F5
	ldrb r0, [r0]
	bl sub_80F78E0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80F6F1C
	ldr r1, _0806F08C @ =gUnknown_20370FF
	b _0806F0B8
	.align 2, 0
_0806F088: .4byte gUnknown_20370F5
_0806F08C: .4byte gUnknown_20370FF
_0806F090:
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _0806F09C
	bl sub_806EE7C
_0806F09C:
	ldr r1, _0806F0A0 @ =gUnknown_20370FF
	b _0806F0B8
	.align 2, 0
_0806F0A0: .4byte gUnknown_20370FF
_0806F0A4:
	ldr r4, _0806F0C0 @ =gUnknown_2037100
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_806EF44
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0806F140
	subs r1, r4, 0x1
_0806F0B8:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0806F140
	.align 2, 0
_0806F0C0: .4byte gUnknown_2037100
_0806F0C4:
	bl GetStartMenuWindowId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xF
	str r1, [sp]
	ldr r1, _0806F12C @ =gUnknown_20370F5
	ldrb r1, [r1]
	str r1, [sp, 0x4]
	ldr r4, _0806F130 @ =gUnknown_20370F4
	ldrb r1, [r4]
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0
	bl sub_810F7D8
	strb r0, [r4]
	bl sub_80BF708
	lsls r0, 24
	cmp r0, 0
	bne _0806F118
	bl InUnionRoom
	cmp r0, 0x1
	beq _0806F118
	ldr r0, _0806F134 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	bne _0806F118
	ldr r2, _0806F138 @ =gUnknown_83A7394
	ldr r1, _0806F13C @ =gUnknown_20370F6
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	bl sub_80F7974
_0806F118:
	bl GetStartMenuWindowId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl CopyWindowToVram
	movs r0, 0x1
	b _0806F142
	.align 2, 0
_0806F12C: .4byte gUnknown_20370F5
_0806F130: .4byte gUnknown_20370F4
_0806F134: .4byte gSaveBlock2Ptr
_0806F138: .4byte gUnknown_83A7394
_0806F13C: .4byte gUnknown_20370F6
_0806F140:
	movs r0, 0
_0806F142:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806F01C

	thumb_func_start sub_806F14C
sub_806F14C: @ 806F14C
	push {lr}
	ldr r1, _0806F164 @ =gUnknown_20370FF
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
_0806F156:
	bl sub_806F01C
	lsls r0, 24
	cmp r0, 0
	beq _0806F156
	pop {r0}
	bx r0
	.align 2, 0
_0806F164: .4byte gUnknown_20370FF
	thumb_func_end sub_806F14C

	thumb_func_start task50_startmenu
task50_startmenu: @ 806F168
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806F01C
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0806F180
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_0806F180:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task50_startmenu

	thumb_func_start sub_806F188
sub_806F188: @ 806F188
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _0806F1B0 @ =gUnknown_20370FF
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	ldr r4, _0806F1B4 @ =task50_startmenu
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F1B0: .4byte gUnknown_20370FF
_0806F1B4: .4byte task50_startmenu
	thumb_func_end sub_806F188

	thumb_func_start sub_806F1B8
sub_806F1B8: @ 806F1B8
	push {lr}
	bl sub_806F01C
	lsls r0, 24
	cmp r0, 0
	beq _0806F1CC
	bl sub_807E3A0
	movs r0, 0x1
	b _0806F1CE
_0806F1CC:
	movs r0, 0
_0806F1CE:
	pop {r1}
	bx r1
	thumb_func_end sub_806F1B8

	thumb_func_start sub_806F1D4
sub_806F1D4: @ 806F1D4
	ldr r1, _0806F1E4 @ =gUnknown_20370FF
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	ldr r1, _0806F1E8 @ =gUnknown_3005024
	ldr r0, _0806F1EC @ =sub_806F1B8
	str r0, [r1]
	bx lr
	.align 2, 0
_0806F1E4: .4byte gUnknown_20370FF
_0806F1E8: .4byte gUnknown_3005024
_0806F1EC: .4byte sub_806F1B8
	thumb_func_end sub_806F1D4

	thumb_func_start sub_806F1F0
sub_806F1F0: @ 806F1F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0806F210 @ =gUnknown_3005098
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806F214
	cmp r0, 0x1
	beq _0806F238
	b _0806F24E
	.align 2, 0
_0806F210: .4byte gUnknown_3005098
_0806F214:
	bl InUnionRoom
	cmp r0, 0x1
	bne _0806F220
	bl var_800D_set_xB
_0806F220:
	ldr r1, _0806F230 @ =gUnknown_20370F0
	ldr r0, _0806F234 @ =sub_806F280
	str r0, [r1]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0806F24E
	.align 2, 0
_0806F230: .4byte gUnknown_20370F0
_0806F234: .4byte sub_806F280
_0806F238:
	ldr r0, _0806F254 @ =gUnknown_20370F0
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806F24E
	adds r0, r5, 0
	bl DestroyTask
_0806F24E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F254: .4byte gUnknown_20370F0
	thumb_func_end sub_806F1F0

	thumb_func_start sub_806F258
sub_806F258: @ 806F258
	push {lr}
	bl sub_805642C
	cmp r0, 0
	bne _0806F26E
	bl player_bitmagic
	bl sub_805C270
	bl sub_805C780
_0806F26E:
	ldr r0, _0806F27C @ =sub_806F1F0
	bl sub_806F188
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0806F27C: .4byte sub_806F1F0
	thumb_func_end sub_806F258

	thumb_func_start sub_806F280
sub_806F280: @ 806F280
	push {r4,lr}
	ldr r0, _0806F35C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0806F2D2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	ldr r4, _0806F360 @ =gUnknown_20370F4
	strb r0, [r4]
	bl sub_80BF708
	lsls r0, 24
	cmp r0, 0
	bne _0806F2D2
	bl InUnionRoom
	cmp r0, 0x1
	beq _0806F2D2
	ldr r0, _0806F364 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	bne _0806F2D2
	ldr r2, _0806F368 @ =gUnknown_83A7394
	ldr r1, _0806F36C @ =gUnknown_20370F6
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0x2
	bl sub_8113018
_0806F2D2:
	ldr r0, _0806F35C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806F320
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r4, _0806F360 @ =gUnknown_20370F4
	strb r0, [r4]
	bl sub_80BF708
	lsls r0, 24
	cmp r0, 0
	bne _0806F320
	bl InUnionRoom
	cmp r0, 0x1
	beq _0806F320
	ldr r0, _0806F364 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	bne _0806F320
	ldr r2, _0806F368 @ =gUnknown_83A7394
	ldr r1, _0806F36C @ =gUnknown_20370F6
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0x2
	bl sub_8113018
_0806F320:
	ldr r0, _0806F35C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806F378
	movs r0, 0x5
	bl PlaySE
	bl sub_806F3CC
	lsls r0, 24
	cmp r0, 0
	beq _0806F358
	ldr r3, _0806F370 @ =gUnknown_20370F0
	ldr r1, _0806F374 @ =gUnknown_83A7344
	ldr r2, _0806F36C @ =gUnknown_20370F6
	ldr r0, _0806F360 @ =gUnknown_20370F4
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	str r0, [r3]
	bl sub_806F394
_0806F358:
	movs r0, 0
	b _0806F38E
	.align 2, 0
_0806F35C: .4byte gMain
_0806F360: .4byte gUnknown_20370F4
_0806F364: .4byte gSaveBlock2Ptr
_0806F368: .4byte gUnknown_83A7394
_0806F36C: .4byte gUnknown_20370F6
_0806F370: .4byte gUnknown_20370F0
_0806F374: .4byte gUnknown_83A7344
_0806F378:
	movs r0, 0xA
	ands r0, r1
	cmp r0, 0
	beq _0806F358
	bl sub_806EF18
	bl sub_80F7998
	bl sub_806FEA0
	movs r0, 0x1
_0806F38E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806F280

	thumb_func_start sub_806F394
sub_806F394: @ 806F394
	push {lr}
	ldr r0, _0806F3BC @ =gUnknown_20370F0
	ldr r1, [r0]
	ldr r0, _0806F3C0 @ =sub_806F4E8
	cmp r1, r0
	beq _0806F3B8
	ldr r0, _0806F3C4 @ =sub_806F540
	cmp r1, r0
	beq _0806F3B8
	ldr r0, _0806F3C8 @ =sub_806F554
	cmp r1, r0
	beq _0806F3B8
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
_0806F3B8:
	pop {r0}
	bx r0
	.align 2, 0
_0806F3BC: .4byte gUnknown_20370F0
_0806F3C0: .4byte sub_806F4E8
_0806F3C4: .4byte sub_806F540
_0806F3C8: .4byte sub_806F554
	thumb_func_end sub_806F394

	thumb_func_start sub_806F3CC
sub_806F3CC: @ 806F3CC
	push {lr}
	ldr r1, _0806F3F8 @ =gUnknown_83A7344
	ldr r2, _0806F3FC @ =gUnknown_20370F6
	ldr r0, _0806F400 @ =gUnknown_20370F4
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _0806F404 @ =sub_806F410
	cmp r1, r0
	bne _0806F408
	movs r0, 0
	bl pokedex_count
	lsls r0, 16
	cmp r0, 0
	bne _0806F408
	movs r0, 0
	b _0806F40A
	.align 2, 0
_0806F3F8: .4byte gUnknown_83A7344
_0806F3FC: .4byte gUnknown_20370F6
_0806F400: .4byte gUnknown_20370F4
_0806F404: .4byte sub_806F410
_0806F408:
	movs r0, 0x1
_0806F40A:
	pop {r1}
	bx r1
	thumb_func_end sub_806F3CC

	thumb_func_start sub_806F410
sub_806F410: @ 806F410
	push {lr}
	ldr r0, _0806F424 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806F428
	movs r0, 0
	b _0806F442
	.align 2, 0
_0806F424: .4byte gUnknown_2037AB8
_0806F428:
	movs r0, 0x29
	bl IncrementGameStat
	bl play_some_sound
	bl sub_806EF18
	bl sub_80563F0
	ldr r0, _0806F448 @ =sub_810275C
	bl SetMainCallback2
	movs r0, 0x1
_0806F442:
	pop {r1}
	bx r1
	.align 2, 0
_0806F448: .4byte sub_810275C
	thumb_func_end sub_806F410

	thumb_func_start sub_806F44C
sub_806F44C: @ 806F44C
	push {lr}
	ldr r0, _0806F460 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806F464
	movs r0, 0
	b _0806F478
	.align 2, 0
_0806F460: .4byte gUnknown_2037AB8
_0806F464:
	bl play_some_sound
	bl sub_806EF18
	bl sub_80563F0
	ldr r0, _0806F47C @ =CB2_PartyMenuFromStartMenu
	bl SetMainCallback2
	movs r0, 0x1
_0806F478:
	pop {r1}
	bx r1
	.align 2, 0
_0806F47C: .4byte CB2_PartyMenuFromStartMenu
	thumb_func_end sub_806F44C

	thumb_func_start sub_806F480
sub_806F480: @ 806F480
	push {lr}
	ldr r0, _0806F494 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806F498
	movs r0, 0
	b _0806F4AC
	.align 2, 0
_0806F494: .4byte gUnknown_2037AB8
_0806F498:
	bl play_some_sound
	bl sub_806EF18
	bl sub_80563F0
	ldr r0, _0806F4B0 @ =sub_8107EB8
	bl SetMainCallback2
	movs r0, 0x1
_0806F4AC:
	pop {r1}
	bx r1
	.align 2, 0
_0806F4B0: .4byte sub_8107EB8
	thumb_func_end sub_806F480

	thumb_func_start sub_806F4B4
sub_806F4B4: @ 806F4B4
	push {lr}
	ldr r0, _0806F4C8 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806F4CC
	movs r0, 0
	b _0806F4E0
	.align 2, 0
_0806F4C8: .4byte gUnknown_2037AB8
_0806F4CC:
	bl play_some_sound
	bl sub_806EF18
	bl sub_80563F0
	ldr r0, _0806F4E4 @ =sub_80568A8
	bl sub_808B698
	movs r0, 0x1
_0806F4E0:
	pop {r1}
	bx r1
	.align 2, 0
_0806F4E4: .4byte sub_80568A8
	thumb_func_end sub_806F4B4

	thumb_func_start sub_806F4E8
sub_806F4E8: @ 806F4E8
	ldr r1, _0806F4F4 @ =gUnknown_20370F0
	ldr r0, _0806F4F8 @ =sub_806F5A4
	str r0, [r1]
	movs r0, 0
	bx lr
	.align 2, 0
_0806F4F4: .4byte gUnknown_20370F0
_0806F4F8: .4byte sub_806F5A4
	thumb_func_end sub_806F4E8

	thumb_func_start sub_806F4FC
sub_806F4FC: @ 806F4FC
	push {lr}
	ldr r0, _0806F510 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806F514
	movs r0, 0
	b _0806F52E
	.align 2, 0
_0806F510: .4byte gUnknown_2037AB8
_0806F514:
	bl play_some_sound
	bl sub_806EF18
	bl sub_80563F0
	ldr r0, _0806F534 @ =sub_8088388
	bl SetMainCallback2
	ldr r1, _0806F538 @ =gMain
	ldr r0, _0806F53C @ =sub_80568A8
	str r0, [r1, 0x8]
	movs r0, 0x1
_0806F52E:
	pop {r1}
	bx r1
	.align 2, 0
_0806F534: .4byte sub_8088388
_0806F538: .4byte gMain
_0806F53C: .4byte sub_80568A8
	thumb_func_end sub_806F4FC

	thumb_func_start sub_806F540
sub_806F540: @ 806F540
	push {lr}
	bl sub_806EF18
	bl sub_80F7998
	bl sub_806FEA0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806F540

	thumb_func_start sub_806F554
sub_806F554: @ 806F554
	push {lr}
	bl sub_806EF18
	bl sub_80F7998
	bl sub_806FEA0
	bl sub_80A0F3C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806F554

	thumb_func_start sub_806F56C
sub_806F56C: @ 806F56C
	push {lr}
	ldr r0, _0806F580 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806F584
	movs r0, 0
	b _0806F598
	.align 2, 0
_0806F580: .4byte gUnknown_2037AB8
_0806F584:
	bl play_some_sound
	bl sub_80563F0
	ldr r0, _0806F59C @ =gUnknown_300502C
	ldrb r0, [r0]
	ldr r1, _0806F5A0 @ =sub_80568A8
	bl sub_808B700
	movs r0, 0x1
_0806F598:
	pop {r1}
	bx r1
	.align 2, 0
_0806F59C: .4byte gUnknown_300502C
_0806F5A0: .4byte sub_80568A8
	thumb_func_end sub_806F56C

	thumb_func_start sub_806F5A4
sub_806F5A4: @ 806F5A4
	push {lr}
	bl sub_812B234
	movs r0, 0xC
	bl sub_812B1F0
	bl sub_806F624
	ldr r1, _0806F5C0 @ =gUnknown_20370F0
	ldr r0, _0806F5C4 @ =sub_806F5C8
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806F5C0: .4byte gUnknown_20370F0
_0806F5C4: .4byte sub_806F5C8
	thumb_func_end sub_806F5A4

	thumb_func_start sub_806F5C8
sub_806F5C8: @ 806F5C8
	push {lr}
	bl sub_806F648
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806F604
	cmp r0, 0x1
	ble _0806F61C
	cmp r0, 0x2
	beq _0806F5E4
	cmp r0, 0x3
	beq _0806F604
	b _0806F61C
_0806F5E4:
	movs r0, 0
	movs r1, 0
	bl sub_810F260
	bl sub_806F14C
	bl sub_812B248
	ldr r1, _0806F5FC @ =gUnknown_20370F0
	ldr r0, _0806F600 @ =sub_806F280
	str r0, [r1]
	b _0806F61C
	.align 2, 0
_0806F5FC: .4byte gUnknown_20370F0
_0806F600: .4byte sub_806F280
_0806F604:
	movs r0, 0
	movs r1, 0x1
	bl sub_810F260
	bl sub_80696C0
	bl ScriptContext2_Disable
	bl sub_812B248
	movs r0, 0x1
	b _0806F61E
_0806F61C:
	movs r0, 0
_0806F61E:
	pop {r1}
	bx r1
	thumb_func_end sub_806F5C8

	thumb_func_start sub_806F624
sub_806F624: @ 806F624
	push {lr}
	bl sub_80590D8
	ldr r1, _0806F63C @ =gUnknown_3000FA4
	ldr r0, _0806F640 @ =sub_806F7A8
	str r0, [r1]
	ldr r1, _0806F644 @ =gUnknown_3000FA9
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806F63C: .4byte gUnknown_3000FA4
_0806F640: .4byte sub_806F7A8
_0806F644: .4byte gUnknown_3000FA9
	thumb_func_end sub_806F624

	thumb_func_start sub_806F648
sub_806F648: @ 806F648
	push {lr}
	bl sub_80F6CBC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _0806F674
	ldr r1, _0806F66C @ =gUnknown_3000FA9
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0806F670 @ =gUnknown_3000FA4
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	b _0806F676
	.align 2, 0
_0806F66C: .4byte gUnknown_3000FA9
_0806F670: .4byte gUnknown_3000FA4
_0806F674:
	movs r0, 0
_0806F676:
	pop {r1}
	bx r1
	thumb_func_end sub_806F648

	thumb_func_start sub_806F67C
sub_806F67C: @ 806F67C
	push {lr}
	bl sub_812B234
	movs r0, 0xC
	bl sub_812B1F0
	bl sub_806F624
	ldr r0, _0806F698 @ =task50_save_game
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0806F698: .4byte task50_save_game
	thumb_func_end sub_806F67C

	thumb_func_start sub_806F69C
sub_806F69C: @ 806F69C
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	ldr r0, _0806F6C8 @ =gStringVar4
	adds r1, r2, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0x1
	bl sub_80F7768
	movs r0, 0x1
	bl sub_80F6E08
	ldr r1, _0806F6CC @ =gUnknown_3000FA9
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0806F6D0 @ =gUnknown_3000FA4
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F6C8: .4byte gStringVar4
_0806F6CC: .4byte gUnknown_3000FA9
_0806F6D0: .4byte gUnknown_3000FA4
	thumb_func_end sub_806F69C

	thumb_func_start task50_save_game
task50_save_game: @ 806F6D4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806F648
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	beq _0806F700
	cmp r1, 0x1
	bgt _0806F6F0
	cmp r1, 0
	beq _0806F712
	b _0806F704
_0806F6F0:
	cmp r1, 0x3
	bgt _0806F704
	ldr r1, _0806F6FC @ =gUnknown_20370D0
	movs r0, 0
	strh r0, [r1]
	b _0806F704
	.align 2, 0
_0806F6FC: .4byte gUnknown_20370D0
_0806F700:
	ldr r0, _0806F718 @ =gUnknown_20370D0
	strh r1, [r0]
_0806F704:
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	bl sub_812B248
_0806F712:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F718: .4byte gUnknown_20370D0
	thumb_func_end task50_save_game

	thumb_func_start sub_806F71C
sub_806F71C: @ 806F71C
	push {lr}
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6F54
	pop {r0}
	bx r0
	thumb_func_end sub_806F71C

	thumb_func_start sub_806F72C
sub_806F72C: @ 806F72C
	push {lr}
	bl sub_806FE84
	pop {r0}
	bx r0
	thumb_func_end sub_806F72C

	thumb_func_start sub_806F738
sub_806F738: @ 806F738
	ldr r1, _0806F740 @ =gUnknown_3000FA8
	movs r0, 0x3C
	strb r0, [r1]
	bx lr
	.align 2, 0
_0806F740: .4byte gUnknown_3000FA8
	thumb_func_end sub_806F738

	thumb_func_start sub_806F744
sub_806F744: @ 806F744
	push {lr}
	ldr r1, _0806F764 @ =gUnknown_3000FA8
	ldrb r0, [r1]
	subs r2, r0, 0x1
	strb r2, [r1]
	ldr r0, _0806F768 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0806F76C
	lsls r0, r2, 24
	cmp r0, 0
	beq _0806F772
	movs r0, 0
	b _0806F774
	.align 2, 0
_0806F764: .4byte gUnknown_3000FA8
_0806F768: .4byte gMain
_0806F76C:
	movs r0, 0x5
	bl PlaySE
_0806F772:
	movs r0, 0x1
_0806F774:
	pop {r1}
	bx r1
	thumb_func_end sub_806F744

	thumb_func_start sub_806F778
sub_806F778: @ 806F778
	push {lr}
	ldr r1, _0806F794 @ =gUnknown_3000FA8
	ldrb r0, [r1]
	cmp r0, 0
	bne _0806F79C
	ldr r0, _0806F798 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806F7A0
	movs r0, 0x1
	b _0806F7A2
	.align 2, 0
_0806F794: .4byte gUnknown_3000FA8
_0806F798: .4byte gMain
_0806F79C:
	subs r0, 0x1
	strb r0, [r1]
_0806F7A0:
	movs r0, 0
_0806F7A2:
	pop {r1}
	bx r1
	thumb_func_end sub_806F778

	thumb_func_start sub_806F7A8
sub_806F7A8: @ 806F7A8
	push {lr}
	bl GetStartMenuWindowId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80F6F9C
	bl remove_start_menu_window_maybe
	movs r0, 0
	bl sub_8112EDC
	bl sub_806FCF4
	ldr r0, _0806F7D4 @ =gUnknown_81C55C9
	ldr r1, _0806F7D8 @ =sub_806F7DC
	bl sub_806F69C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806F7D4: .4byte gUnknown_81C55C9
_0806F7D8: .4byte sub_806F7DC
	thumb_func_end sub_806F7A8

	thumb_func_start sub_806F7DC
sub_806F7DC: @ 806F7DC
	push {lr}
	bl sub_80F7858
	ldr r1, _0806F7F0 @ =gUnknown_3000FA4
	ldr r0, _0806F7F4 @ =sub_806F7F8
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806F7F0: .4byte gUnknown_3000FA4
_0806F7F4: .4byte sub_806F7F8
	thumb_func_end sub_806F7DC

	thumb_func_start sub_806F7F8
sub_806F7F8: @ 806F7F8
	push {lr}
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0806F81A
	cmp r1, 0
	bgt _0806F814
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0806F858
	b _0806F864
_0806F814:
	cmp r1, 0x1
	beq _0806F858
	b _0806F864
_0806F81A:
	ldr r0, _0806F838 @ =gUnknown_30053A0
	ldrh r0, [r0]
	cmp r0, 0
	beq _0806F826
	cmp r0, 0x2
	bne _0806F82E
_0806F826:
	ldr r0, _0806F83C @ =gUnknown_2031DB0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F848
_0806F82E:
	ldr r1, _0806F840 @ =gUnknown_3000FA4
	ldr r0, _0806F844 @ =sub_806F86C
	str r0, [r1]
	b _0806F864
	.align 2, 0
_0806F838: .4byte gUnknown_30053A0
_0806F83C: .4byte gUnknown_2031DB0
_0806F840: .4byte gUnknown_3000FA4
_0806F844: .4byte sub_806F86C
_0806F848:
	ldr r1, _0806F850 @ =gUnknown_3000FA4
	ldr r0, _0806F854 @ =sub_806F924
	str r0, [r1]
	b _0806F864
	.align 2, 0
_0806F850: .4byte gUnknown_3000FA4
_0806F854: .4byte sub_806F924
_0806F858:
	bl sub_806F72C
	bl sub_806F71C
	movs r0, 0x2
	b _0806F866
_0806F864:
	movs r0, 0
_0806F866:
	pop {r1}
	bx r1
	thumb_func_end sub_806F7F8

	thumb_func_start sub_806F86C
sub_806F86C: @ 806F86C
	push {lr}
	ldr r0, _0806F880 @ =gUnknown_2031DB0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0806F88C
	ldr r0, _0806F884 @ =gUnknown_81C566A
	ldr r1, _0806F888 @ =sub_806F8C0
	bl sub_806F69C
	b _0806F894
	.align 2, 0
_0806F880: .4byte gUnknown_2031DB0
_0806F884: .4byte gUnknown_81C566A
_0806F888: .4byte sub_806F8C0
_0806F88C:
	ldr r0, _0806F89C @ =gUnknown_81C55EA
	ldr r1, _0806F8A0 @ =sub_806F8A4
	bl sub_806F69C
_0806F894:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806F89C: .4byte gUnknown_81C55EA
_0806F8A0: .4byte sub_806F8A4
	thumb_func_end sub_806F86C

	thumb_func_start sub_806F8A4
sub_806F8A4: @ 806F8A4
	push {lr}
	bl sub_80F7858
	ldr r1, _0806F8B8 @ =gUnknown_3000FA4
	ldr r0, _0806F8BC @ =sub_806F8DC
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806F8B8: .4byte gUnknown_3000FA4
_0806F8BC: .4byte sub_806F8DC
	thumb_func_end sub_806F8A4

	thumb_func_start sub_806F8C0
sub_806F8C0: @ 806F8C0
	push {lr}
	bl sub_80F7880
	ldr r1, _0806F8D4 @ =gUnknown_3000FA4
	ldr r0, _0806F8D8 @ =sub_806F8DC
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806F8D4: .4byte gUnknown_3000FA4
_0806F8D8: .4byte sub_806F8DC
	thumb_func_end sub_806F8C0

	thumb_func_start sub_806F8DC
sub_806F8DC: @ 806F8DC
	push {lr}
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0806F8FE
	cmp r1, 0
	bgt _0806F8F8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0806F910
	b _0806F91C
_0806F8F8:
	cmp r1, 0x1
	beq _0806F910
	b _0806F91C
_0806F8FE:
	ldr r1, _0806F908 @ =gUnknown_3000FA4
	ldr r0, _0806F90C @ =sub_806F924
	str r0, [r1]
	b _0806F91C
	.align 2, 0
_0806F908: .4byte gUnknown_3000FA4
_0806F90C: .4byte sub_806F924
_0806F910:
	bl sub_806F72C
	bl sub_806F71C
	movs r0, 0x2
	b _0806F91E
_0806F91C:
	movs r0, 0
_0806F91E:
	pop {r1}
	bx r1
	thumb_func_end sub_806F8DC

	thumb_func_start sub_806F924
sub_806F924: @ 806F924
	push {lr}
	bl sub_8112450
	ldr r0, _0806F938 @ =gUnknown_81C5625
	ldr r1, _0806F93C @ =sub_806F940
	bl sub_806F69C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806F938: .4byte gUnknown_81C5625
_0806F93C: .4byte sub_806F940
	thumb_func_end sub_806F924

	thumb_func_start sub_806F940
sub_806F940: @ 806F940
	push {r4,lr}
	movs r0, 0
	bl IncrementGameStat
	ldr r4, _0806F95C @ =gUnknown_2031DB0
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _0806F960
	movs r0, 0x4
	bl TrySavingData
	movs r0, 0
	strb r0, [r4]
	b _0806F966
	.align 2, 0
_0806F95C: .4byte gUnknown_2031DB0
_0806F960:
	movs r0, 0
	bl TrySavingData
_0806F966:
	ldr r1, _0806F974 @ =gUnknown_3000FA4
	ldr r0, _0806F978 @ =sub_806F97C
	str r0, [r1]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806F974: .4byte gUnknown_3000FA4
_0806F978: .4byte sub_806F97C
	thumb_func_end sub_806F940

	thumb_func_start sub_806F97C
sub_806F97C: @ 806F97C
	push {lr}
	ldr r0, _0806F990 @ =gUnknown_3005420
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _0806F99C
	ldr r0, _0806F994 @ =gUnknown_81C5647
	ldr r1, _0806F998 @ =sub_806F9B8
	bl sub_806F69C
	b _0806F9A4
	.align 2, 0
_0806F990: .4byte gUnknown_3005420
_0806F994: .4byte gUnknown_81C5647
_0806F998: .4byte sub_806F9B8
_0806F99C:
	ldr r0, _0806F9B0 @ =gUnknown_841614B
	ldr r1, _0806F9B4 @ =sub_806FA04
	bl sub_806F69C
_0806F9A4:
	bl sub_806F738
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806F9B0: .4byte gUnknown_841614B
_0806F9B4: .4byte sub_806FA04
	thumb_func_end sub_806F97C

	thumb_func_start sub_806F9B8
sub_806F9B8: @ 806F9B8
	push {lr}
	bl sub_80F6CBC
	lsls r0, 16
	cmp r0, 0
	bne _0806F9D0
	movs r0, 0x30
	bl PlaySE
	ldr r1, _0806F9D8 @ =gUnknown_3000FA4
	ldr r0, _0806F9DC @ =SaveDialogCB_ReturnSuccess
	str r0, [r1]
_0806F9D0:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806F9D8: .4byte gUnknown_3000FA4
_0806F9DC: .4byte SaveDialogCB_ReturnSuccess
	thumb_func_end sub_806F9B8

	thumb_func_start SaveDialogCB_ReturnSuccess
SaveDialogCB_ReturnSuccess: @ 806F9E0
	push {lr}
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _0806F9FE
	bl sub_806F744
	lsls r0, 24
	cmp r0, 0
	beq _0806F9FE
	bl sub_806F72C
	movs r0, 0x1
	b _0806FA00
_0806F9FE:
	movs r0, 0
_0806FA00:
	pop {r1}
	bx r1
	thumb_func_end SaveDialogCB_ReturnSuccess

	thumb_func_start sub_806FA04
sub_806FA04: @ 806FA04
	push {lr}
	bl sub_80F6CBC
	lsls r0, 16
	cmp r0, 0
	bne _0806FA1C
	movs r0, 0x16
	bl PlaySE
	ldr r1, _0806FA24 @ =gUnknown_3000FA4
	ldr r0, _0806FA28 @ =SaveDialogCB_ReturnError
	str r0, [r1]
_0806FA1C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806FA24: .4byte gUnknown_3000FA4
_0806FA28: .4byte SaveDialogCB_ReturnError
	thumb_func_end sub_806FA04

	thumb_func_start SaveDialogCB_ReturnError
SaveDialogCB_ReturnError: @ 806FA2C
	push {lr}
	bl sub_806F778
	lsls r0, 24
	cmp r0, 0
	beq _0806FA40
	bl sub_806F72C
	movs r0, 0x3
	b _0806FA42
_0806FA40:
	movs r0, 0
_0806FA42:
	pop {r1}
	bx r1
	thumb_func_end SaveDialogCB_ReturnError

	thumb_func_start sub_806FA48
sub_806FA48: @ 806FA48
	push {lr}
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_806FA48

	thumb_func_start sub_806FA54
sub_806FA54: @ 806FA54
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806FA66
	b _0806FB64
_0806FA66:
	lsls r0, 2
	ldr r1, _0806FA70 @ =_0806FA74
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806FA70: .4byte _0806FA74
	.align 2, 0
_0806FA74:
	.4byte _0806FA88
	.4byte _0806FB00
	.4byte _0806FB12
	.4byte _0806FB3C
	.4byte _0806FB60
_0806FA88:
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	movs r2, 0xA0
	lsls r2, 19
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0806FAF4 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0806FAF8 @ =0x81000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806FAFC @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806FACA:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _0806FACA
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _0806FB64
	.align 2, 0
_0806FAF4: .4byte 0x040000d4
_0806FAF8: .4byte 0x81000200
_0806FAFC: .4byte 0x81000800
_0806FB00:
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	bl dp12_8087EA4
	b _0806FB64
_0806FB12:
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0806FB34 @ =gUnknown_83A73B8
	movs r0, 0
	movs r2, 0x1
	bl InitBgsFromTemplates
	ldr r0, _0806FB38 @ =gUnknown_83A73BC
	bl InitWindows
	movs r0, 0
	movs r1, 0x8
	movs r2, 0xF0
	bl sub_814FF2C
	b _0806FB64
	.align 2, 0
_0806FB34: .4byte gUnknown_83A73B8
_0806FB38: .4byte gUnknown_83A73BC
_0806FB3C:
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _0806FB5C @ =sub_806FA48
	bl SetVBlankCallback
	movs r0, 0x1
	bl EnableInterrupts
	b _0806FB64
	.align 2, 0
_0806FB5C: .4byte sub_806FA48
_0806FB60:
	movs r0, 0x1
	b _0806FB6E
_0806FB64:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_0806FB6E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806FA54

	thumb_func_start sub_806FB7C
sub_806FB7C: @ 806FB7C
	push {lr}
	ldr r0, _0806FB9C @ =gMain + 0x438
	bl sub_806FA54
	cmp r0, 0
	beq _0806FB96
	ldr r0, _0806FBA0 @ =sub_806FBB8
	movs r1, 0x50
	bl CreateTask
	ldr r0, _0806FBA4 @ =sub_806FBA8
	bl SetMainCallback2
_0806FB96:
	pop {r0}
	bx r0
	.align 2, 0
_0806FB9C: .4byte gMain + 0x438
_0806FBA0: .4byte sub_806FBB8
_0806FBA4: .4byte sub_806FBA8
	thumb_func_end sub_806FB7C

	thumb_func_start sub_806FBA8
sub_806FBA8: @ 806FBA8
	push {lr}
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_806FBA8

	thumb_func_start sub_806FBB8
sub_806FBB8: @ 806FBB8
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0806FBEC @ =gUnknown_3005098
	adds r5, r0, r1
	ldr r0, _0806FBF0 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806FBD8
	b _0806FCE8
_0806FBD8:
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x6
	bls _0806FBE2
	b _0806FCE8
_0806FBE2:
	lsls r0, 2
	ldr r1, _0806FBF4 @ =_0806FBF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806FBEC: .4byte gUnknown_3005098
_0806FBF0: .4byte gUnknown_2037AB8
_0806FBF4: .4byte _0806FBF8
	.align 2, 0
_0806FBF8:
	.4byte _0806FC14
	.4byte _0806FC80
	.4byte _0806FC8C
	.4byte _0806FC9C
	.4byte _0806FCB0
	.4byte _0806FCC8
	.4byte _0806FCD8
_0806FC14:
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _0806FC74 @ =gUnknown_8419F54
	movs r4, 0
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0xFF
	bl AddTextPrinterParametrized
	movs r0, 0
	movs r1, 0x8
	movs r2, 0xF
	bl sub_8150048
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0806FC78 @ =gUnknown_3003F3C
	ldrb r0, [r0]
	cmp r0, 0
	beq _0806FC7C
	bl InUnionRoom
	cmp r0, 0
	beq _0806FC7C
	movs r0, 0x5
	b _0806FCE6
	.align 2, 0
_0806FC74: .4byte gUnknown_8419F54
_0806FC78: .4byte gUnknown_3003F3C
_0806FC7C:
	movs r0, 0x1
	b _0806FCE6
_0806FC80:
	bl sub_804C1C0
	bl sub_80DA45C
	movs r0, 0x2
	b _0806FCE6
_0806FC8C:
	bl sub_80DA4A0
	lsls r0, 24
	cmp r0, 0
	beq _0806FCE8
	bl sav2_gender2_inplace_and_xFE
	b _0806FCE4
_0806FC9C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x4
	b _0806FCE6
_0806FCB0:
	bl FreeAllWindowBuffers
	ldr r0, _0806FCC4 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
	b _0806FCE8
	.align 2, 0
_0806FCC4: .4byte gMain
_0806FCC8:
	ldr r0, _0806FCD4 @ =sub_80DA634
	movs r1, 0x5
	bl CreateTask
	movs r0, 0x6
	b _0806FCE6
	.align 2, 0
_0806FCD4: .4byte sub_80DA634
_0806FCD8:
	ldr r0, _0806FCF0 @ =sub_80DA634
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0806FCE8
_0806FCE4:
	movs r0, 0x3
_0806FCE6:
	strh r0, [r5]
_0806FCE8:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806FCF0: .4byte sub_80DA634
	thumb_func_end sub_806FBB8

	thumb_func_start sub_806FCF4
sub_806FCF4: @ 806FCF4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r5, _0806FE54 @ =gUnknown_2037104
	ldr r0, _0806FE58 @ =gUnknown_83A73CC
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	ldr r4, _0806FE5C @ =0x0000021d
	adds r1, r4, 0
	movs r2, 0xD0
	bl sub_814FF2C
	ldrb r0, [r5]
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0xD
	bl SetWindowBorderStyle
	ldr r4, _0806FE60 @ =gStringVar4
	movs r0, 0x3
	adds r1, r4, 0
	movs r2, 0x8
	bl sub_80F7FCC
	movs r6, 0x1
	negs r6, r6
	movs r0, 0x2
	adds r1, r4, 0
	adds r2, r6, 0
	bl GetStringWidth
	movs r2, 0x70
	subs r2, r0
	lsrs r2, 1
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r5]
	ldr r1, _0806FE64 @ =gUnknown_83A73DC
	str r1, [sp]
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl box_print
	movs r0, 0x2
	adds r1, r4, 0
	adds r2, r6, 0
	bl GetStringWidth
	ldrb r0, [r5]
	ldr r1, _0806FE68 @ =gUnknown_83A73D4
	mov r9, r1
	str r1, [sp]
	str r6, [sp, 0x4]
	ldr r1, _0806FE6C @ =gUnknown_841617A
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0xE
	bl box_print
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0x2
	bl sub_80F7FCC
	ldrb r0, [r5]
	adds r1, r4, 0
	movs r2, 0x3C
	movs r3, 0xE
	bl sub_812E6DC
	ldrb r0, [r5]
	mov r1, r9
	str r1, [sp]
	str r6, [sp, 0x4]
	ldr r1, _0806FE70 @ =gUnknown_8416181
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1C
	bl box_print
	movs r0, 0x4
	adds r1, r4, 0
	movs r2, 0x2
	bl sub_80F7FCC
	ldrb r0, [r5]
	ldr r1, _0806FE74 @ =gUnknown_83A73D8
	mov r8, r1
	str r1, [sp]
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0
	movs r2, 0x3C
	movs r3, 0x1C
	bl box_print
	movs r7, 0x2A
	ldr r0, _0806FE78 @ =0x00000829
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806FE0A
	ldrb r0, [r5]
	mov r1, r9
	str r1, [sp]
	str r6, [sp, 0x4]
	ldr r1, _0806FE7C @ =gUnknown_8416188
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2A
	bl box_print
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0x2
	bl sub_80F7FCC
	ldrb r0, [r5]
	mov r1, r8
	str r1, [sp]
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0
	movs r2, 0x3C
	movs r3, 0x2A
	bl box_print
	movs r7, 0x38
_0806FE0A:
	ldrb r0, [r5]
	mov r1, r9
	str r1, [sp]
	str r6, [sp, 0x4]
	ldr r1, _0806FE80 @ =gUnknown_8416190
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0x2
	adds r3, r7, 0
	bl box_print
	movs r0, 0x2
	adds r1, r4, 0
	movs r2, 0x2
	bl sub_80F7FCC
	ldrb r0, [r5]
	mov r1, r8
	str r1, [sp]
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0
	movs r2, 0x3C
	adds r3, r7, 0
	bl box_print
	ldrb r0, [r5]
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE54: .4byte gUnknown_2037104
_0806FE58: .4byte gUnknown_83A73CC
_0806FE5C: .4byte 0x0000021d
_0806FE60: .4byte gStringVar4
_0806FE64: .4byte gUnknown_83A73DC
_0806FE68: .4byte gUnknown_83A73D4
_0806FE6C: .4byte gUnknown_841617A
_0806FE70: .4byte gUnknown_8416181
_0806FE74: .4byte gUnknown_83A73D8
_0806FE78: .4byte 0x00000829
_0806FE7C: .4byte gUnknown_8416188
_0806FE80: .4byte gUnknown_8416190
	thumb_func_end sub_806FCF4

	thumb_func_start sub_806FE84
sub_806FE84: @ 806FE84
	push {r4,lr}
	ldr r4, _0806FE9C @ =gUnknown_2037104
	ldrb r0, [r4]
	movs r1, 0
	bl sub_80F6F9C
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE9C: .4byte gUnknown_2037104
	thumb_func_end sub_806FE84

	thumb_func_start sub_806FEA0
sub_806FEA0: @ 806FEA0
	push {lr}
	movs r0, 0x5
	bl PlaySE
	bl GetStartMenuWindowId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_80F6F9C
	bl remove_start_menu_window_maybe
	bl sub_80696C0
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	thumb_func_end sub_806FEA0

	thumb_func_start AppendToList
AppendToList: @ 806FEC8
	ldrb r3, [r1]
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bx lr
	thumb_func_end AppendToList

	.align 2, 0 @ Don't pad with nop.
