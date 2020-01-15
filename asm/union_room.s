	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_811586C
sub_811586C: @ 811586C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r6, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	lsls r4, 8
	movs r0, 0x80
	lsls r0, 3
	cmp r4, r0
	beq _081158BC
	cmp r4, r0
	bgt _0811589E
	movs r0, 0x80
	lsls r0, 2
	cmp r4, r0
	beq _081158B0
	b _0811590E
_0811589E:
	movs r0, 0x94
	lsls r0, 6
	cmp r4, r0
	beq _081158CC
	movs r0, 0xD4
	lsls r0, 6
	cmp r4, r0
	beq _081158F0
	b _0811590E
_081158B0:
	ldr r1, _081158B8 @ =gUnknown_845742C
	subs r0, r5, 0x1
	lsls r0, 2
	b _081158D4
	.align 2, 0
_081158B8: .4byte gUnknown_845742C
_081158BC:
	ldr r1, _081158C8 @ =gUnknown_845742C
	subs r0, r5, 0x1
	lsls r0, 2
	adds r1, 0x14
	b _081158D4
	.align 2, 0
_081158C8: .4byte gUnknown_845742C
_081158CC:
	ldr r1, _081158EC @ =gUnknown_845742C
	subs r0, r5, 0x1
	lsls r0, 2
	adds r1, 0x28
_081158D4:
	adds r0, r1
	ldr r2, [r0]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x2
	movs r3, 0
	bl sub_811A444
	b _0811590E
	.align 2, 0
_081158EC: .4byte gUnknown_845742C
_081158F0:
	ldr r1, _08115920 @ =gUnknown_845742C
	subs r0, r5, 0x1
	lsls r0, 2
	adds r1, 0x3C
	adds r0, r1
	ldr r2, [r0]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x2
	movs r3, 0
	bl sub_811A444
_0811590E:
	adds r0, r6, 0
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08115920: .4byte gUnknown_845742C
	thumb_func_end sub_811586C

	thumb_func_start sub_8115924
sub_8115924: @ 8115924
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x20
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _08115994 @ =gSaveBlock2Ptr
	ldr r2, [r6]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	mov r8, r0
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x2
	movs r3, 0
	bl sub_811A444
	add r5, sp, 0x14
	ldr r1, _08115998 @ =gUnknown_84571B4
	adds r0, r5, 0
	bl StringCopy
	ldr r0, [r6]
	adds r0, 0xA
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	add r0, sp, 0x8
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0
	add r1, sp, 0x8
	bl StringAppend
	movs r0, 0x10
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_811A444
	add sp, 0x20
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08115994: .4byte gSaveBlock2Ptr
_08115998: .4byte gUnknown_84571B4
	thumb_func_end sub_8115924

	thumb_func_start sub_811599C
sub_811599C: @ 811599C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1, 0x1
	cmp r0, 0x15
	bhi _08115A18
	lsls r0, 2
	ldr r1, _081159B4 @ =_081159B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081159B4: .4byte _081159B8
	.align 2, 0
_081159B8:
	.4byte _08115A10
	.4byte _08115A10
	.4byte _08115A10
	.4byte _08115A10
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A10
	.4byte _08115A10
	.4byte _08115A10
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A18
	.4byte _08115A10
	.4byte _08115A10
_08115A10:
	ldr r0, _08115A1C @ =gStringVar4
	ldr r1, _08115A20 @ =gUnknown_8457234
	bl StringExpandPlaceholders
_08115A18:
	pop {r0}
	bx r0
	.align 2, 0
_08115A1C: .4byte gStringVar4
_08115A20: .4byte gUnknown_8457234
	thumb_func_end sub_811599C

	thumb_func_start TryBecomeLinkLeader
TryBecomeLinkLeader: @ 8115A24
	push {lr}
	ldr r0, _08115A54 @ =sub_8115A68
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08115A58 @ =gUnknown_203B05C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08115A5C @ =gTasks+0x8
	adds r1, r0
	str r1, [r2]
	ldr r0, _08115A60 @ =gUnknown_3002024
	str r1, [r0]
	movs r0, 0
	strb r0, [r1, 0xC]
	strb r0, [r1, 0xD]
	ldr r1, _08115A64 @ =gSpecialVar_Result
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08115A54: .4byte sub_8115A68
_08115A58: .4byte gUnknown_203B05C
_08115A5C: .4byte gTasks+0x8
_08115A60: .4byte gUnknown_3002024
_08115A64: .4byte gSpecialVar_Result
	thumb_func_end TryBecomeLinkLeader

	thumb_func_start sub_8115A68
sub_8115A68: @ 8115A68
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08115A88 @ =gUnknown_203B05C
	ldr r5, [r0]
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1E
	bls _08115A7C
	b _081161D8
_08115A7C:
	lsls r0, 2
	ldr r1, _08115A8C @ =_08115A90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08115A88: .4byte gUnknown_203B05C
_08115A8C: .4byte _08115A90
	.align 2, 0
_08115A90:
	.4byte _08115B0C
	.4byte _081161D8
	.4byte _081161D8
	.4byte _08115B5C
	.4byte _08115C60
	.4byte _08115CE8
	.4byte _08115D04
	.4byte _08115E24
	.4byte _081161D8
	.4byte _08115D94
	.4byte _08115DAC
	.4byte _08115E40
	.4byte _08115EF4
	.4byte _0811600A
	.4byte _08116028
	.4byte _0811603A
	.4byte _08116058
	.4byte _08116112
	.4byte _08116128
	.4byte _081160A2
	.4byte _081160C0
	.4byte _08116168
	.4byte _08116194
	.4byte _08116168
	.4byte _0811617E
	.4byte _081161D8
	.4byte _081161AC
	.4byte _081161D8
	.4byte _081161D8
	.4byte _08115DEC
	.4byte _0811614C
_08115B0C:
	ldr r3, _08115B4C @ =gUnknown_203B058
	ldr r2, _08115B50 @ =gUnknown_8456CD8
	ldr r1, _08115B54 @ =gSpecialVar_0x8004
	ldrh r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	strb r0, [r3]
	ldr r4, _08115B58 @ =gUnknown_203B059
	ldrh r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	lsrs r0, 8
	strb r0, [r4]
	ldrb r0, [r3]
	movs r1, 0
	movs r2, 0
	bl sub_80FAF58
	bl sub_800B1F4
	bl OpenLink
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	bl sub_80FBB8C
	movs r0, 0x3
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08115B4C: .4byte gUnknown_203B058
_08115B50: .4byte gUnknown_8456CD8
_08115B54: .4byte gSpecialVar_0x8004
_08115B58: .4byte gUnknown_203B059
_08115B5C:
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0x4]
	movs r0, 0xA0
	bl AllocZeroed
	str r0, [r5]
	movs r0, 0xA0
	bl AllocZeroed
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x4]
	movs r1, 0x4
	bl sub_811A650
	ldr r0, [r5]
	movs r1, 0x5
	bl sub_811A5E4
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0x10
	bl sub_80FCD50
	ldr r1, [r5]
	movs r3, 0
	movs r0, 0
	strh r0, [r1, 0x18]
	ldr r2, [r5]
	ldrb r1, [r2, 0x1A]
	subs r0, 0x4
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1A]
	ldr r2, [r5]
	ldrb r1, [r2, 0x1A]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1A]
	ldr r0, [r5]
	strb r3, [r0, 0x1B]
	ldr r0, [r5, 0x4]
	movs r1, 0xFF
	bl sub_811A054
	strb r0, [r5, 0x17]
	ldr r0, _08115C48 @ =gUnknown_8456CD0
	bl AddWindow
	strb r0, [r5, 0x10]
	ldr r0, _08115C4C @ =gUnknown_8456CFC
	bl AddWindow
	strb r0, [r5, 0xF]
	ldr r0, _08115C50 @ =gUnknown_8456D04
	bl AddWindow
	strb r0, [r5, 0x11]
	ldrb r0, [r5, 0x10]
	movs r1, 0x22
	bl FillWindowPixelBuffer
	ldrb r0, [r5, 0x10]
	ldr r2, _08115C54 @ =gUnknown_845747C
	movs r1, 0x2
	str r1, [sp]
	movs r4, 0x4
	str r4, [sp, 0x4]
	movs r1, 0
	movs r3, 0x8
	bl sub_811A444
	ldrb r0, [r5, 0x10]
	bl PutWindowTilemap
	ldrb r0, [r5, 0x10]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r5, 0xF]
	movs r1, 0
	bl DrawStdWindowFrame
	ldr r0, _08115C58 @ =gMultiuseListMenuTemplate
	adds r2, r0, 0
	ldr r1, _08115C5C @ =gUnknown_8456D34
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldrb r1, [r5, 0xF]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r5, 0x12]
	ldrb r0, [r5, 0x11]
	movs r1, 0
	bl DrawStdWindowFrame
	ldrb r0, [r5, 0x11]
	bl PutWindowTilemap
	ldrb r0, [r5, 0x11]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	strb r0, [r5, 0x13]
	strb r4, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08115C48: .4byte gUnknown_8456CD0
_08115C4C: .4byte gUnknown_8456CFC
_08115C50: .4byte gUnknown_8456D04
_08115C54: .4byte gUnknown_845747C
_08115C58: .4byte gMultiuseListMenuTemplate
_08115C5C: .4byte gUnknown_8456D34
_08115C60:
	ldr r0, _08115C98 @ =gStringVar1
	ldr r2, _08115C9C @ =gUnknown_8456C74
	ldr r4, _08115CA0 @ =gUnknown_203B058
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08115CA4 @ =gUnknown_203B059
	ldrb r2, [r0]
	lsrs r0, r2, 4
	cmp r0, 0
	beq _08115CC4
	ldrb r1, [r5, 0x13]
	subs r0, 0x1
	cmp r1, r0
	ble _08115CB0
	movs r0, 0xF
	ands r0, r2
	cmp r0, 0
	beq _08115CB0
	ldr r0, _08115CA8 @ =gStringVar4
	ldr r1, _08115CAC @ =gUnknown_8457264
	bl StringExpandPlaceholders
	b _08115CCC
	.align 2, 0
_08115C98: .4byte gStringVar1
_08115C9C: .4byte gUnknown_8456C74
_08115CA0: .4byte gUnknown_203B058
_08115CA4: .4byte gUnknown_203B059
_08115CA8: .4byte gStringVar4
_08115CAC: .4byte gUnknown_8457264
_08115CB0:
	ldr r0, _08115CBC @ =gStringVar4
	ldr r1, _08115CC0 @ =gUnknown_8457234
	bl StringExpandPlaceholders
	b _08115CCC
	.align 2, 0
_08115CBC: .4byte gStringVar4
_08115CC0: .4byte gUnknown_8457234
_08115CC4:
	ldr r0, _08115CE0 @ =gStringVar4
	ldrb r1, [r4]
	bl sub_811599C
_08115CCC:
	ldrb r0, [r5, 0x11]
	ldr r1, _08115CE4 @ =gUnknown_203B059
	ldrb r1, [r1]
	ldrb r2, [r5, 0x13]
	bl sub_811586C
	movs r0, 0x5
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08115CE0: .4byte gStringVar4
_08115CE4: .4byte gUnknown_203B059
_08115CE8:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, _08115D00 @ =gStringVar4
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _08115CFA
	b _081161D8
_08115CFA:
	movs r0, 0x6
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08115D00: .4byte gStringVar4
_08115D04:
	adds r0, r5, 0
	movs r1, 0x7
	movs r2, 0xA
	bl sub_8116444
	ldr r0, _08115D24 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08115D40
	ldrb r0, [r5, 0x13]
	cmp r0, 0x1
	bne _08115D28
	movs r0, 0x17
	b _08115D3E
	.align 2, 0
_08115D24: .4byte gMain
_08115D28:
	ldr r0, _08115D38 @ =gUnknown_203B059
	ldrb r1, [r0]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _08115D3C
	movs r0, 0x1E
	b _08115D3E
	.align 2, 0
_08115D38: .4byte gUnknown_203B059
_08115D3C:
	movs r0, 0x13
_08115D3E:
	strb r0, [r5, 0xC]
_08115D40:
	ldr r0, _08115D8C @ =gUnknown_203B059
	ldrb r2, [r0]
	lsrs r0, r2, 4
	cmp r0, 0
	beq _08115D76
	ldrb r1, [r5, 0x13]
	subs r0, 0x1
	cmp r1, r0
	ble _08115D76
	movs r4, 0xF
	adds r0, r4, 0
	ands r0, r2
	cmp r0, 0
	beq _08115D76
	bl sub_80FC1CC
	cmp r0, 0
	beq _08115D76
	ldr r0, _08115D90 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08115D76
	strb r4, [r5, 0xC]
	bl sub_80F8F5C
_08115D76:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x6
	beq _08115D7E
	b _081161D8
_08115D7E:
	bl sub_80FA5D4
	cmp r0, 0
	bne _08115D88
	b _081161D8
_08115D88:
	b _08115EEE
	.align 2, 0
_08115D8C: .4byte gUnknown_203B059
_08115D90: .4byte gMain
_08115D94:
	bl sub_80FA5D4
	cmp r0, 0
	beq _08115D9E
	b _081161D8
_08115D9E:
	movs r0, 0x6
	strb r0, [r5, 0xC]
	ldr r0, [r5]
	bl sub_81165E8
	strb r0, [r5, 0x13]
	b _081161D8
_08115DAC:
	movs r3, 0
	ldr r0, _08115DE4 @ =gUnknown_203B058
	ldrb r1, [r0]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x2
	bne _08115DBC
	movs r3, 0x1
_08115DBC:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r2, _08115DE8 @ =gUnknown_845767C
	lsls r1, r3, 2
	adds r1, r2
	ldr r1, [r1]
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _08115DD4
	b _081161D8
_08115DD4:
	ldr r0, [r5]
	bl sub_81165E8
	strb r0, [r5, 0x13]
	ldrb r0, [r5, 0x12]
	bl RedrawListMenu
	b _0811610C
	.align 2, 0
_08115DE4: .4byte gUnknown_203B058
_08115DE8: .4byte gUnknown_845767C
_08115DEC:
	ldr r0, _08115E1C @ =gUnknown_203B059
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x2
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r3, r0, 31
	adds r0, r5, 0
	adds r0, 0xD
	ldr r2, _08115E20 @ =gUnknown_845767C
	lsls r1, r3, 2
	adds r1, r2
	ldr r1, [r1]
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _08115E16
	b _081161D8
_08115E16:
	movs r0, 0x15
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08115E1C: .4byte gUnknown_203B059
_08115E20: .4byte gUnknown_845767C
_08115E24:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, _08115E3C @ =gStringVar4
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _08115E36
	b _081161D8
_08115E36:
	movs r0, 0xB
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08115E3C: .4byte gStringVar4
_08115E40:
	adds r4, r5, 0
	adds r4, 0xD
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8118658
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r5, 0x13]
	lsls r2, 5
	ldr r1, [r5]
	adds r1, r2
	adds r1, 0x10
	bl sub_80FA634
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_811A14C
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08115EC0
	cmp r1, r0
	bgt _08115E84
	subs r0, 0x2
	cmp r1, r0
	beq _08115EEE
	b _081161D8
_08115E84:
	cmp r1, 0
	beq _08115E8E
	cmp r1, 0x1
	beq _08115EC0
	b _081161D8
_08115E8E:
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
	movs r0, 0x5
	strb r0, [r5, 0x19]
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	ldr r2, [r5]
	adds r2, r0
	adds r2, 0x10
	movs r0, 0x5
	b _08115EE4
_08115EC0:
	movs r0, 0x6
	strb r0, [r5, 0x19]
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	ldr r2, [r5]
	adds r2, r0
	adds r2, 0x10
	movs r0, 0x6
_08115EE4:
	bl sub_80FA670
	movs r0, 0xC
	strb r0, [r5, 0xC]
	b _081161D8
_08115EEE:
	movs r0, 0x9
	strb r0, [r5, 0xC]
	b _081161D8
_08115EF4:
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8118658
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r5, 0x13]
	lsls r2, 5
	ldr r1, [r5]
	adds r1, r2
	adds r1, 0x10
	bl sub_80FA6FC
	cmp r0, 0x1
	bne _08115FFA
	ldrb r0, [r5, 0x19]
	cmp r0, 0x5
	bne _08115FB4
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	adds r1, r0
	movs r0, 0
	strb r0, [r1, 0x1B]
	ldrb r0, [r5, 0x12]
	bl RedrawListMenu
	ldrb r0, [r5, 0x13]
	adds r0, 0x1
	strb r0, [r5, 0x13]
	ldr r1, _08115F58 @ =gUnknown_203B059
	ldrb r1, [r1]
	movs r3, 0xF
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0
	ands r0, r1
	cmp r2, r0
	bne _08115FF0
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	bne _08115F54
	cmp r2, 0x4
	bne _08115F5C
_08115F54:
	strb r3, [r5, 0xC]
	b _08115F90
	.align 2, 0
_08115F58: .4byte gUnknown_203B059
_08115F5C:
	ldr r4, _08115FA4 @ =gStringVar1
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r1, r0
	subs r1, 0x10
	adds r0, r4, 0
	bl StringCopy7
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	subs r0, 0x1
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r0, _08115FA8 @ =gStringVar4
	ldr r1, _08115FAC @ =gUnknown_8457554
	bl StringExpandPlaceholders
	movs r0, 0xD
	strb r0, [r5, 0xC]
_08115F90:
	bl sub_80F8F5C
	ldrb r0, [r5, 0x11]
	ldr r1, _08115FB0 @ =gUnknown_203B059
	ldrb r1, [r1]
	ldrb r2, [r5, 0x13]
	bl sub_811586C
	b _08115FF4
	.align 2, 0
_08115FA4: .4byte gStringVar1
_08115FA8: .4byte gStringVar4
_08115FAC: .4byte gUnknown_8457554
_08115FB0: .4byte gUnknown_203B059
_08115FB4:
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80FBD4C
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	adds r1, r0
	ldrb r2, [r1, 0x1A]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1A]
	ldr r0, [r5]
	bl sub_81165E8
	ldrb r0, [r5, 0x12]
	bl RedrawListMenu
_08115FF0:
	movs r0, 0x4
	strb r0, [r5, 0xC]
_08115FF4:
	movs r0, 0
	strb r0, [r5, 0x19]
	b _081161D8
_08115FFA:
	cmp r0, 0x2
	beq _08116000
	b _081161D8
_08116000:
	movs r0, 0
	movs r1, 0
	bl sub_80FB9E4
	b _0811610C
_0811600A:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, _08116024 @ =gStringVar4
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _0811601C
	b _081161D8
_0811601C:
	movs r0, 0xE
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08116024: .4byte gStringVar4
_08116028:
	ldrb r0, [r5, 0xE]
	adds r0, 0x1
	strb r0, [r5, 0xE]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x78
	bhi _08116038
	b _081161D8
_08116038:
	b _0811607E
_0811603A:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, _08116054 @ =gUnknown_8457514
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _0811604C
	b _081161D8
_0811604C:
	movs r0, 0x10
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08116054: .4byte gUnknown_8457514
_08116058:
	adds r0, r5, 0
	adds r0, 0xD
	movs r1, 0
	bl sub_811A14C
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0811607E
	cmp r1, 0
	bgt _08116078
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08116084
	b _081161D8
_08116078:
	cmp r1, 0x1
	beq _08116084
	b _081161D8
_0811607E:
	movs r0, 0x11
	strb r0, [r5, 0xC]
	b _081161D8
_08116084:
	ldr r0, _08116098 @ =gUnknown_203B059
	ldrb r1, [r0]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _0811609C
	movs r0, 0x1E
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08116098: .4byte gUnknown_203B059
_0811609C:
	movs r0, 0x13
	strb r0, [r5, 0xC]
	b _081161D8
_081160A2:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, _081160BC @ =gUnknown_8457530
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _081160B4
	b _081161D8
_081160B4:
	movs r0, 0x14
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_081160BC: .4byte gUnknown_8457530
_081160C0:
	adds r0, r5, 0
	adds r0, 0xD
	movs r1, 0
	bl sub_811A14C
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0811615C
	cmp r1, 0
	bgt _081160E0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _081160E4
	b _081161D8
_081160E0:
	cmp r1, 0x1
	bne _081161D8
_081160E4:
	ldr r0, _081160F8 @ =gUnknown_203B059
	ldrb r2, [r0]
	movs r0, 0xF0
	ands r0, r2
	cmp r0, 0
	beq _081160FC
	movs r0, 0xF
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_081160F8: .4byte gUnknown_203B059
_081160FC:
	movs r3, 0xF
	ldrb r1, [r5, 0x13]
	adds r0, r3, 0
	ands r0, r2
	cmp r1, r0
	bne _0811610C
	strb r3, [r5, 0xC]
	b _081161D8
_0811610C:
	movs r0, 0x4
	strb r0, [r5, 0xC]
	b _081161D8
_08116112:
	adds r0, r5, 0
	movs r1, 0x7
	movs r2, 0x17
	bl sub_8116444
	lsls r0, 24
	cmp r0, 0
	bne _081161D8
	movs r0, 0x12
	strb r0, [r5, 0xC]
	b _081161D8
_08116128:
	bl sub_80F8F40
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08116144
	movs r0, 0
	bl sub_80F8F7C
	cmp r0, 0
	beq _081161D8
	movs r0, 0x1A
	strb r0, [r5, 0xC]
	b _081161D8
_08116144:
	movs r0, 0x1D
	strb r0, [r5, 0xC]
	strb r1, [r5, 0xD]
	b _081161D8
_0811614C:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, _08116164 @ =gUnknown_8457610
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	beq _081161D8
_0811615C:
	movs r0, 0x17
	strb r0, [r5, 0xC]
	b _081161D8
	.align 2, 0
_08116164: .4byte gUnknown_8457610
_08116168:
	bl DestroyWirelessStatusIndicatorSprite
	bl sub_80F8DC0
	adds r0, r5, 0
	bl sub_81161E4
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
	b _081161D8
_0811617E:
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, _08116190 @ =gSpecialVar_Result
	movs r0, 0x5
	strh r0, [r1]
	b _081161D8
	.align 2, 0
_08116190: .4byte gSpecialVar_Result
_08116194:
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, _081161A8 @ =gSpecialVar_Result
	movs r0, 0x8
	strh r0, [r1]
	b _081161D8
	.align 2, 0
_081161A8: .4byte gSpecialVar_Result
_081161AC:
	bl sub_80FBA00
	cmp r0, 0
	beq _081161BA
	movs r0, 0x1D
	strb r0, [r5, 0xC]
	b _081161D8
_081161BA:
	ldr r0, _081161E0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _081161D8
	movs r0, 0x1
	bl sub_80FAFE0
	bl sub_8117990
	adds r0, r5, 0
	bl sub_81161E4
	adds r0, r4, 0
	bl DestroyTask
_081161D8:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081161E0: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8115A68

	thumb_func_start sub_81161E4
sub_81161E4: @ 81161E4
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x11]
	bl ClearWindowTilemap
	ldrb r0, [r4, 0x11]
	movs r1, 0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4, 0x12]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	ldrb r0, [r4, 0x10]
	bl ClearWindowTilemap
	ldrb r0, [r4, 0xF]
	movs r1, 0
	bl ClearStdWindowAndFrame
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r4, 0x11]
	bl RemoveWindow
	ldrb r0, [r4, 0xF]
	bl RemoveWindow
	ldrb r0, [r4, 0x10]
	bl RemoveWindow
	ldrb r0, [r4, 0x17]
	bl DestroyTask
	ldr r0, [r4, 0x8]
	bl Free
	ldr r0, [r4]
	bl Free
	ldr r0, [r4, 0x4]
	bl Free
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81161E4

	thumb_func_start sub_8116244
sub_8116244: @ 8116244
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1, 0x1
	cmp r0, 0x15
	bhi _081162D8
	lsls r0, 2
	ldr r1, _0811625C @ =_08116260
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811625C: .4byte _08116260
	.align 2, 0
_08116260:
	.4byte _081162B8
	.4byte _081162B8
	.4byte _081162D0
	.4byte _081162B8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D0
	.4byte _081162D0
	.4byte _081162D0
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162D8
	.4byte _081162C0
	.4byte _081162C0
_081162B8:
	ldr r1, _081162BC @ =gUnknown_84574A0
	b _081162C2
	.align 2, 0
_081162BC: .4byte gUnknown_84574A0
_081162C0:
	ldr r1, _081162CC @ =gUnknown_84574C4
_081162C2:
	adds r0, r2, 0
	bl StringExpandPlaceholders
	b _081162D8
	.align 2, 0
_081162CC: .4byte gUnknown_84574C4
_081162D0:
	ldr r1, _081162DC @ =gUnknown_84574EC
	adds r0, r2, 0
	bl StringExpandPlaceholders
_081162D8:
	pop {r0}
	bx r0
	.align 2, 0
_081162DC: .4byte gUnknown_84574EC
	thumb_func_end sub_8116244

	thumb_func_start sub_81162E0
sub_81162E0: @ 81162E0
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x44
	beq _08116300
	cmp r1, 0x44
	bgt _081162F6
	cmp r1, 0x41
	beq _08116300
	b _08116312
_081162F6:
	cmp r2, 0x45
	beq _0811630C
	cmp r2, 0x48
	beq _0811630C
	b _08116312
_08116300:
	ldr r1, _08116308 @ =gUnknown_8457E28
	bl StringExpandPlaceholders
	b _08116312
	.align 2, 0
_08116308: .4byte gUnknown_8457E28
_0811630C:
	ldr r1, _08116318 @ =gUnknown_8457E44
	bl StringExpandPlaceholders
_08116312:
	pop {r0}
	bx r0
	.align 2, 0
_08116318: .4byte gUnknown_8457E44
	thumb_func_end sub_81162E0

	thumb_func_start sub_811631C
sub_811631C: @ 811631C
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1, 0x1
	cmp r0, 0x15
	bhi _081163A8
	lsls r0, 2
	ldr r1, _08116334 @ =_08116338
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08116334: .4byte _08116338
	.align 2, 0
_08116338:
	.4byte _08116390
	.4byte _08116390
	.4byte _081163A0
	.4byte _08116390
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A0
	.4byte _081163A0
	.4byte _081163A0
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A8
	.4byte _081163A8
	.4byte _08116390
	.4byte _08116390
_08116390:
	ldr r1, _0811639C @ =gUnknown_8459238
	adds r0, r2, 0
	bl StringExpandPlaceholders
	b _081163A8
	.align 2, 0
_0811639C: .4byte gUnknown_8459238
_081163A0:
	ldr r1, _081163AC @ =gUnknown_8459250
	adds r0, r2, 0
	bl StringExpandPlaceholders
_081163A8:
	pop {r0}
	bx r0
	.align 2, 0
_081163AC: .4byte gUnknown_8459250
	thumb_func_end sub_811631C

	thumb_func_start sub_81163B0
sub_81163B0: @ 81163B0
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1, 0x1
	cmp r0, 0x15
	bhi _0811643C
	lsls r0, 2
	ldr r1, _081163C8 @ =_081163CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081163C8: .4byte _081163CC
	.align 2, 0
_081163CC:
	.4byte _08116424
	.4byte _08116424
	.4byte _08116434
	.4byte _08116424
	.4byte _0811643C
	.4byte _0811643C
	.4byte _0811643C
	.4byte _0811643C
	.4byte _08116434
	.4byte _08116434
	.4byte _08116434
	.4byte _0811643C
	.4byte _0811643C
	.4byte _0811643C
	.4byte _0811643C
	.4byte _0811643C
	.4byte _0811643C
	.4byte _0811643C
	.4byte _0811643C
	.4byte _0811643C
	.4byte _08116424
	.4byte _08116424
_08116424:
	ldr r1, _08116430 @ =gUnknown_84576AC
	adds r0, r2, 0
	bl StringExpandPlaceholders
	b _0811643C
	.align 2, 0
_08116430: .4byte gUnknown_84576AC
_08116434:
	ldr r1, _08116440 @ =gUnknown_84576C4
	adds r0, r2, 0
	bl StringExpandPlaceholders
_0811643C:
	pop {r0}
	bx r0
	.align 2, 0
_08116440: .4byte gUnknown_84576C4
	thumb_func_end sub_81163B0

	thumb_func_start sub_8116444
sub_8116444: @ 8116444
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	ldr r0, [r5]
	bl sub_8116524
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08116460
	cmp r0, 0x2
	beq _081164AC
	b _081164C0
_08116460:
	movs r0, 0x2
	bl PlaySE
	ldrb r0, [r5, 0x12]
	bl RedrawListMenu
	ldr r4, _081164A0 @ =gStringVar2
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	ldr r1, [r5]
	adds r1, r0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy7
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r0, _081164A4 @ =gStringVar4
	ldr r1, _081164A8 @ =gUnknown_203B058
	ldrb r1, [r1]
	bl sub_8116244
	strb r6, [r5, 0xC]
	b _081164C0
	.align 2, 0
_081164A0: .4byte gStringVar2
_081164A4: .4byte gStringVar4
_081164A8: .4byte gUnknown_203B058
_081164AC:
	movs r0, 0
	movs r1, 0
	bl sub_80FB9E4
	ldrb r0, [r5, 0x12]
	bl RedrawListMenu
	strb r4, [r5, 0xC]
	movs r0, 0x1
	b _081164C2
_081164C0:
	movs r0, 0
_081164C2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8116444

	thumb_func_start sub_81164C8
sub_81164C8: @ 81164C8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _081164F4 @ =gUnknown_203B05C
	ldr r3, [r0]
	movs r2, 0
	ldr r1, [r3]
	lsls r0, r4, 5
	adds r1, r0
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	beq _081164F8
	cmp r0, 0x2
	beq _08116502
	b _08116504
	.align 2, 0
_081164F4: .4byte gUnknown_203B05C
_081164F8:
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08116504
	movs r2, 0x2
	b _08116504
_08116502:
	movs r2, 0x1
_08116504:
	lsls r0, r4, 5
	ldr r3, [r3]
	adds r3, r0
	str r2, [sp]
	lsls r0, r4, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r6, 0
	bl sub_811A910
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81164C8

	thumb_func_start sub_8116524
sub_8116524: @ 8116524
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r0, _0811657C @ =gUnknown_203B05C
	ldr r5, [r0]
	movs r0, 0
	mov r8, r0
	movs r3, 0x1
_08116538:
	ldr r0, [r5]
	lsls r6, r3, 5
	adds r2, r0, r6
	ldrb r0, [r2, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	mov r9, r0
	cmp r0, 0x1
	bne _08116598
	ldr r1, [r5, 0x4]
	adds r0, r2, 0
	str r3, [sp]
	bl sub_811A748
	adds r4, r0, 0
	ldr r3, [sp]
	cmp r4, 0xFF
	beq _08116580
	ldr r1, [r5]
	ldr r0, [r5, 0x4]
	lsls r2, r4, 3
	subs r2, r4
	lsls r2, 2
	adds r1, r6
	adds r0, r2
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	ldr r0, [r5]
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x18]
	b _08116598
	.align 2, 0
_0811657C: .4byte gUnknown_203B05C
_08116580:
	ldr r2, [r5]
	adds r2, r6
	ldrb r1, [r2, 0x1A]
	movs r4, 0x4
	negs r4, r4
	adds r0, r4, 0
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2, 0x1A]
	movs r7, 0x2
	mov r8, r7
_08116598:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x4
	bls _08116538
	movs r6, 0
	movs r4, 0x3
_081165A6:
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	adds r1, r6
	movs r2, 0x5
	bl sub_811A798
	adds r6, 0x1C
	subs r4, 0x1
	ldr r0, [r5]
	cmp r4, 0
	bge _081165A6
	mov r1, r8
	cmp r1, 0x2
	beq _081165D8
	adds r1, r0, 0
	movs r4, 0x4
_081165C6:
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _081165D0
	movs r2, 0x1
	mov r8, r2
_081165D0:
	adds r1, 0x20
	subs r4, 0x1
	cmp r4, 0
	bge _081165C6
_081165D8:
	mov r0, r8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8116524

	thumb_func_start sub_81165E8
sub_81165E8: @ 81165E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _081166BC @ =gUnknown_203B05C
	ldr r4, [r0]
	movs r3, 0
_081165F8:
	ldr r0, [r4, 0x8]
	lsls r2, r3, 5
	ldr r1, [r4]
	adds r0, r2
	adds r1, r2
	ldm r1!, {r2,r5,r6}
	stm r0!, {r2,r5,r6}
	ldm r1!, {r2,r5,r7}
	stm r0!, {r2,r5,r7}
	ldm r1!, {r6,r7}
	stm r0!, {r6,r7}
	adds r3, 0x1
	ldr r0, [r4, 0x8]
	ldr r1, [r4]
	cmp r3, 0x4
	ble _081165F8
	movs r5, 0
	mov r8, r1
	mov r9, r0
	movs r3, 0x4
_08116620:
	mov r1, r9
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08116642
	lsls r0, r5, 5
	add r0, r8
	ldm r1!, {r2,r6,r7}
	stm r0!, {r2,r6,r7}
	ldm r1!, {r2,r6,r7}
	stm r0!, {r2,r6,r7}
	ldm r1!, {r2,r6}
	stm r0!, {r2,r6}
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08116642:
	movs r7, 0x20
	add r9, r7
	subs r3, 0x1
	cmp r3, 0
	bge _08116620
	mov r10, r5
	cmp r5, 0x4
	bhi _081166A4
	ldr r0, _081166C0 @ =gUnknown_8457034
	mov r9, r0
	movs r1, 0
	mov r12, r1
	movs r2, 0x4
	negs r2, r2
	mov r8, r2
_08116660:
	ldr r1, [r4]
	lsls r3, r5, 5
	adds r1, r3
	mov r0, r9
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldr r0, [r4]
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x18]
	ldr r1, [r4]
	adds r1, r3
	ldrb r2, [r1, 0x1A]
	mov r0, r8
	ands r0, r2
	strb r0, [r1, 0x1A]
	ldr r1, [r4]
	adds r1, r3
	ldrb r2, [r1, 0x1A]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1A]
	ldr r0, [r4]
	adds r0, r3
	mov r6, r12
	strb r6, [r0, 0x1B]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _08116660
_081166A4:
	movs r3, 0
	ldr r1, [r4]
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _081166C4
	ldrb r0, [r1, 0x1B]
	cmp r0, 0x40
	bne _081166C4
	mov r10, r3
	b _081166E4
	.align 2, 0
_081166BC: .4byte gUnknown_203B05C
_081166C0: .4byte gUnknown_8457034
_081166C4:
	adds r3, 0x1
	cmp r3, 0x4
	bgt _081166E4
	lsls r0, r3, 5
	adds r2, r1, r0
	ldrb r0, [r2, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _081166C4
	ldrb r0, [r2, 0x1B]
	cmp r0, 0x40
	bne _081166C4
	lsls r0, r3, 24
	lsrs r0, 24
	mov r10, r0
_081166E4:
	mov r0, r10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81165E8

	thumb_func_start TryJoinLinkGroup
TryJoinLinkGroup: @ 81166F4
	push {lr}
	ldr r0, _08116724 @ =sub_8116738
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08116728 @ =gUnknown_203B05C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0811672C @ =gTasks+0x8
	adds r1, r0
	str r1, [r2]
	ldr r0, _08116730 @ =gUnknown_3002028
	str r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x8]
	strb r0, [r1, 0x9]
	ldr r1, _08116734 @ =gSpecialVar_Result
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08116724: .4byte sub_8116738
_08116728: .4byte gUnknown_203B05C
_0811672C: .4byte gTasks+0x8
_08116730: .4byte gUnknown_3002028
_08116734: .4byte gSpecialVar_Result
	thumb_func_end TryJoinLinkGroup

	thumb_func_start sub_8116738
sub_8116738: @ 8116738
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08116758 @ =gUnknown_203B05C
	ldr r6, [r0]
	ldrb r0, [r6, 0x8]
	cmp r0, 0x17
	bls _0811674C
	b _08116D06
_0811674C:
	lsls r0, 2
	ldr r1, _0811675C @ =_08116760
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08116758: .4byte gUnknown_203B05C
_0811675C: .4byte _08116760
	.align 2, 0
_08116760:
	.4byte _081167C0
	.4byte _0811680C
	.4byte _08116838
	.4byte _08116904
	.4byte _08116D06
	.4byte _081169B4
	.4byte _08116A08
	.4byte _08116B94
	.4byte _08116BB0
	.4byte _08116BFE
	.4byte _08116C10
	.4byte _08116C98
	.4byte _08116C10
	.4byte _08116C68
	.4byte _08116C10
	.4byte _08116CA8
	.4byte _08116D06
	.4byte _08116D06
	.4byte _08116C10
	.4byte _08116CC8
	.4byte _08116C10
	.4byte _08116CFC
	.4byte _08116D06
	.4byte _08116CEC
_081167C0:
	ldr r5, _08116800 @ =gUnknown_84570C8
	ldr r4, _08116804 @ =gSpecialVar_0x8004
	ldrh r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_80FAF58
	ldr r1, _08116808 @ =gUnknown_203B058
	ldrh r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_800B1F4
	bl OpenLink
	bl sub_80FBBD8
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r6, 0x4]
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r6]
	movs r0, 0x1
	strb r0, [r6, 0x8]
	b _08116D06
	.align 2, 0
_08116800: .4byte gUnknown_84570C8
_08116804: .4byte gSpecialVar_0x8004
_08116808: .4byte gUnknown_203B058
_0811680C:
	adds r0, r6, 0
	adds r0, 0x9
	ldr r2, _08116830 @ =gUnknown_84591B8
	ldr r1, _08116834 @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _08116828
	b _08116D06
_08116828:
	movs r0, 0x2
	strb r0, [r6, 0x8]
	b _08116D06
	.align 2, 0
_08116830: .4byte gUnknown_84591B8
_08116834: .4byte gSpecialVar_0x8004
_08116838:
	ldr r0, [r6, 0x4]
	movs r1, 0x4
	bl sub_811A650
	ldr r0, [r6]
	movs r1, 0x10
	bl sub_811A5E4
	ldr r0, [r6, 0x4]
	ldr r1, _081168E8 @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	bl sub_811A054
	movs r4, 0
	strb r0, [r6, 0x11]
	ldr r0, _081168EC @ =gUnknown_8456CD0
	bl AddWindow
	strb r0, [r6, 0xC]
	ldr r0, _081168F0 @ =gUnknown_8456D4C
	bl AddWindow
	strb r0, [r6, 0xB]
	ldr r0, _081168F4 @ =gUnknown_8456D54
	bl AddWindow
	strb r0, [r6, 0xD]
	ldrb r0, [r6, 0xC]
	movs r1, 0x22
	bl FillWindowPixelBuffer
	ldrb r0, [r6, 0xC]
	ldr r2, _081168F8 @ =gUnknown_8458FC8
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x4
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x8
	bl sub_811A444
	ldrb r0, [r6, 0xC]
	bl PutWindowTilemap
	ldrb r0, [r6, 0xC]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r6, 0xB]
	movs r1, 0
	bl DrawStdWindowFrame
	ldr r0, _081168FC @ =gMultiuseListMenuTemplate
	adds r2, r0, 0
	ldr r1, _08116900 @ =gUnknown_8456DDC
	ldm r1!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	ldm r1!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	ldrb r1, [r6, 0xB]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r6, 0xE]
	ldrb r0, [r6, 0xD]
	movs r1, 0
	bl DrawStdWindowFrame
	ldrb r0, [r6, 0xD]
	bl PutWindowTilemap
	ldrb r0, [r6, 0xD]
	bl sub_8115924
	ldrb r0, [r6, 0xD]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	strb r4, [r6, 0xF]
	movs r0, 0x3
	strb r0, [r6, 0x8]
	b _08116D06
	.align 2, 0
_081168E8: .4byte gSpecialVar_0x8004
_081168EC: .4byte gUnknown_8456CD0
_081168F0: .4byte gUnknown_8456D4C
_081168F4: .4byte gUnknown_8456D54
_081168F8: .4byte gUnknown_8458FC8
_081168FC: .4byte gMultiuseListMenuTemplate
_08116900: .4byte gUnknown_8456DDC
_08116904:
	bl sub_8116FE4
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0811691E
	cmp r4, 0x1
	beq _08116916
	b _08116BF6
_08116916:
	movs r0, 0x2
	bl PlaySE
	b _08116BF6
_0811691E:
	ldrb r0, [r6, 0xE]
	bl ListMenu_ProcessInput
	adds r4, r0, 0
	ldr r0, _0811696C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811699C
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _0811699C
	ldr r0, [r6]
	lsls r1, r4, 5
	adds r0, r1
	ldrb r1, [r0, 0xA]
	ldrb r0, [r0, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08116994
	lsrs r0, r1, 7
	cmp r0, 0
	bne _08116994
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8116D10
	adds r1, r0, 0
	cmp r1, 0
	bne _08116970
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8116D60
	movs r0, 0x5
	b _08116982
	.align 2, 0
_0811696C: .4byte gMain
_08116970:
	ldr r0, _0811698C @ =gStringVar4
	ldr r2, _08116990 @ =gUnknown_8457608
	subs r1, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x12
_08116982:
	strb r0, [r6, 0x8]
	movs r0, 0x67
	bl PlaySE
	b _08116D06
	.align 2, 0
_0811698C: .4byte gStringVar4
_08116990: .4byte gUnknown_8457608
_08116994:
	movs r0, 0x7
	bl PlaySE
	b _08116D06
_0811699C:
	ldr r0, _081169B0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _081169AA
	b _08116D06
_081169AA:
	movs r0, 0xA
	strb r0, [r6, 0x8]
	b _08116D06
	.align 2, 0
_081169B0: .4byte gMain
_081169B4:
	ldr r4, _081169FC @ =gStringVar4
	ldr r0, _08116A00 @ =gUnknown_203B058
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_811631C
	adds r0, r6, 0
	adds r0, 0x9
	adds r1, r4, 0
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _081169D2
	b _08116D06
_081169D2:
	ldr r4, _08116A04 @ =gStringVar1
	ldrb r0, [r6, 0xF]
	lsls r0, 5
	ldr r1, [r6]
	adds r1, r0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy7
	ldr r1, [r6]
	ldrb r0, [r6, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	b _08116C0A
	.align 2, 0
_081169FC: .4byte gStringVar4
_08116A00: .4byte gUnknown_203B058
_08116A04: .4byte gStringVar1
_08116A08:
	ldr r0, _08116A3C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08116AA4
	ldr r4, _08116A40 @ =gUnknown_203B058
	ldr r1, [r6]
	ldrb r0, [r6, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 25
	lsrs r0, 25
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	bl sub_80FB9E4
	ldrb r0, [r4]
	subs r0, 0x1
	cmp r0, 0x15
	bhi _08116AA4
	lsls r0, 2
	ldr r1, _08116A44 @ =_08116A48
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08116A3C: .4byte gReceivedRemoteLinkPlayers
_08116A40: .4byte gUnknown_203B058
_08116A44: .4byte _08116A48
	.align 2, 0
_08116A48:
	.4byte _08116AA0
	.4byte _08116AA0
	.4byte _08116AA0
	.4byte _08116AA0
	.4byte _08116AA0
	.4byte _08116AA4
	.4byte _08116AA4
	.4byte _08116AA4
	.4byte _08116AA0
	.4byte _08116AA0
	.4byte _08116AA0
	.4byte _08116AA4
	.4byte _08116AA0
	.4byte _08116AA0
	.4byte _08116AA4
	.4byte _08116AA4
	.4byte _08116AA4
	.4byte _08116AA4
	.4byte _08116AA4
	.4byte _08116AA4
	.4byte _08116AA0
	.4byte _08116AA0
_08116AA0:
	movs r0, 0x14
	strb r0, [r6, 0x8]
_08116AA4:
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x8
	bhi _08116B70
	lsls r0, 2
	ldr r1, _08116ABC @ =_08116AC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08116ABC: .4byte _08116AC0
	.align 2, 0
_08116AC0:
	.4byte _08116AE4
	.4byte _08116AEA
	.4byte _08116B70
	.4byte _08116B70
	.4byte _08116AF0
	.4byte _08116AEA
	.4byte _08116B44
	.4byte _08116B70
	.4byte _08116AEA
_08116AE4:
	movs r0, 0xC
	strb r0, [r6, 0x8]
	b _08116B70
_08116AEA:
	movs r0, 0xE
	strb r0, [r6, 0x8]
	b _08116B70
_08116AF0:
	ldr r4, _08116B30 @ =gStringVar4
	ldr r5, _08116B34 @ =gUnknown_203B058
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_81163B0
	adds r0, r6, 0
	adds r0, 0x9
	adds r1, r4, 0
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	beq _08116B70
	movs r0, 0x7
	movs r1, 0
	bl sub_80FB9E4
	ldr r0, _08116B38 @ =gStringVar1
	ldr r2, _08116B3C @ =gUnknown_8456C74
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r1, _08116B40 @ =gUnknown_8457700
	adds r0, r4, 0
	bl StringExpandPlaceholders
	b _08116B70
	.align 2, 0
_08116B30: .4byte gStringVar4
_08116B34: .4byte gUnknown_203B058
_08116B38: .4byte gStringVar1
_08116B3C: .4byte gUnknown_8456C74
_08116B40: .4byte gUnknown_8457700
_08116B44:
	ldrb r0, [r6, 0x15]
	cmp r0, 0xF0
	bls _08116B6C
	adds r0, r6, 0
	adds r0, 0x9
	ldr r1, _08116B68 @ =gStringVar4
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	beq _08116B70
	movs r0, 0xC
	movs r1, 0
	bl sub_80FB9E4
	movs r0, 0
	b _08116B6E
	.align 2, 0
_08116B68: .4byte gStringVar4
_08116B6C:
	adds r0, 0x1
_08116B6E:
	strb r0, [r6, 0x15]
_08116B70:
	bl sub_80FB9F4
	lsls r0, 24
	cmp r0, 0
	beq _08116B7C
	b _08116D06
_08116B7C:
	ldr r0, _08116B90 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08116B8A
	b _08116D06
_08116B8A:
	movs r0, 0x7
	strb r0, [r6, 0x8]
	b _08116D06
	.align 2, 0
_08116B90: .4byte gMain
_08116B94:
	adds r0, r6, 0
	adds r0, 0x9
	ldr r1, _08116BAC @ =gUnknown_845771C
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _08116BA6
	b _08116D06
_08116BA6:
	movs r0, 0x8
	strb r0, [r6, 0x8]
	b _08116D06
	.align 2, 0
_08116BAC: .4byte gUnknown_845771C
_08116BB0:
	adds r4, r6, 0
	adds r4, 0x9
	bl sub_80FB9F4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_811A14C
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08116BEE
	cmp r1, r0
	bgt _08116BDC
	subs r0, 0x2
	cmp r1, r0
	beq _08116BF2
	b _08116D06
_08116BDC:
	cmp r1, 0
	beq _08116BE6
	cmp r1, 0x1
	beq _08116BEE
	b _08116D06
_08116BE6:
	bl sub_80FA6BC
	movs r0, 0x9
	b _08116BF4
_08116BEE:
	movs r0, 0x5
	b _08116BF4
_08116BF2:
	movs r0, 0x6
_08116BF4:
	strb r0, [r6, 0x8]
_08116BF6:
	ldrb r0, [r6, 0xE]
	bl RedrawListMenu
	b _08116D06
_08116BFE:
	bl sub_80FB9F4
	lsls r0, 24
	cmp r0, 0
	bne _08116C0A
	b _08116D06
_08116C0A:
	movs r0, 0x6
	strb r0, [r6, 0x8]
	b _08116D06
_08116C10:
	ldrb r0, [r6, 0xD]
	bl ClearWindowTilemap
	ldrb r0, [r6, 0xD]
	movs r1, 0
	bl ClearStdWindowAndFrame
	ldrb r0, [r6, 0xE]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	ldrb r0, [r6, 0xC]
	bl ClearWindowTilemap
	ldrb r0, [r6, 0xB]
	movs r1, 0
	bl ClearStdWindowAndFrame
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r6, 0xD]
	bl RemoveWindow
	ldrb r0, [r6, 0xB]
	bl RemoveWindow
	ldrb r0, [r6, 0xC]
	bl RemoveWindow
	ldrb r0, [r6, 0x11]
	bl DestroyTask
	ldr r0, [r6]
	bl Free
	ldr r0, [r6, 0x4]
	bl Free
	ldrb r0, [r6, 0x8]
	adds r0, 0x1
	strb r0, [r6, 0x8]
	b _08116D06
_08116C68:
	bl DestroyWirelessStatusIndicatorSprite
	adds r5, r6, 0
	adds r5, 0x9
	ldr r4, _08116C90 @ =gUnknown_8457754
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	beq _08116D06
	ldr r0, _08116C94 @ =gSpecialVar_Result
	movs r1, 0x6
	b _08116CDC
	.align 2, 0
_08116C90: .4byte gUnknown_8457754
_08116C94: .4byte gSpecialVar_Result
_08116C98:
	bl DestroyWirelessStatusIndicatorSprite
	ldr r0, _08116CA4 @ =gSpecialVar_Result
	movs r1, 0x5
	b _08116CDC
	.align 2, 0
_08116CA4: .4byte gSpecialVar_Result
_08116CA8:
	bl DestroyWirelessStatusIndicatorSprite
	adds r5, r6, 0
	adds r5, 0x9
	ldr r4, _08116CC4 @ =gUnknown_8457754
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	b _08116CCE
	.align 2, 0
_08116CC4: .4byte gUnknown_8457754
_08116CC8:
	adds r0, r6, 0
	adds r0, 0x9
	ldr r1, _08116CE4 @ =gStringVar4
_08116CCE:
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	beq _08116D06
	ldr r0, _08116CE8 @ =gSpecialVar_Result
	movs r1, 0x8
_08116CDC:
	strh r1, [r0]
	movs r0, 0x17
	strb r0, [r6, 0x8]
	b _08116D06
	.align 2, 0
_08116CE4: .4byte gStringVar4
_08116CE8: .4byte gSpecialVar_Result
_08116CEC:
	adds r0, r4, 0
	bl DestroyTask
	bl sub_811A41C
	bl sub_80F8DC0
	b _08116D06
_08116CFC:
	bl sub_8117990
	adds r0, r4, 0
	bl DestroyTask
_08116D06:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8116738

	thumb_func_start sub_8116D10
sub_8116D10: @ 8116D10
	push {lr}
	lsls r1, 5
	ldr r0, [r0]
	adds r3, r0, r1
	ldr r0, _08116D44 @ =gUnknown_203B058
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _08116D56
	ldrb r0, [r3, 0x1]
	movs r1, 0x3C
	ands r1, r0
	cmp r1, 0x10
	beq _08116D56
	cmp r1, 0x14
	beq _08116D56
	ldr r0, _08116D48 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x9]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08116D4C
	movs r0, 0x1
	b _08116D5C
	.align 2, 0
_08116D44: .4byte gUnknown_203B058
_08116D48: .4byte gSaveBlock2Ptr
_08116D4C:
	ldrb r1, [r3]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08116D5A
_08116D56:
	movs r0, 0
	b _08116D5C
_08116D5A:
	movs r0, 0x2
_08116D5C:
	pop {r1}
	bx r1
	thumb_func_end sub_8116D10

	thumb_func_start sub_8116D60
sub_8116D60: @ 8116D60
	push {r4,r5,lr}
	adds r4, r0, 0
	strb r1, [r4, 0xF]
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
	ldrb r0, [r4, 0xE]
	bl RedrawListMenu
	ldr r5, _08116DD4 @ =gStringVar1
	ldrb r0, [r4, 0xF]
	lsls r0, 5
	ldr r1, [r4]
	adds r1, r0
	adds r1, 0x10
	adds r0, r5, 0
	bl StringCopy7
	ldr r1, [r4]
	ldrb r0, [r4, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r5, 0
	bl ConvertInternationalString
	ldr r1, _08116DD8 @ =gUnknown_84570C8
	ldr r0, _08116DDC @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	ldrb r1, [r4, 0xF]
	lsls r1, 5
	ldr r0, [r4]
	adds r0, r1
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80FBF54
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116DD4: .4byte gStringVar1
_08116DD8: .4byte gUnknown_84570C8
_08116DDC: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8116D60

	thumb_func_start sub_8116DE0
sub_8116DE0: @ 8116DE0
	push {lr}
	ldr r0, _08116E0C @ =sub_8116E1C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08116E10 @ =gUnknown_203B05C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _08116E14 @ =gTasks+0x8
	adds r1, r2
	str r1, [r3]
	movs r2, 0
	strb r2, [r1, 0x8]
	strb r2, [r1, 0x9]
	ldr r2, _08116E18 @ =gUnknown_3002028
	str r1, [r2]
	pop {r1}
	bx r1
	.align 2, 0
_08116E0C: .4byte sub_8116E1C
_08116E10: .4byte gUnknown_203B05C
_08116E14: .4byte gTasks+0x8
_08116E18: .4byte gUnknown_3002028
	thumb_func_end sub_8116DE0

	thumb_func_start sub_8116E1C
sub_8116E1C: @ 8116E1C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08116E38 @ =gUnknown_203B05C
	ldr r4, [r0]
	ldrb r0, [r4, 0x8]
	cmp r0, 0xB
	bhi _08116F20
	lsls r0, 2
	ldr r1, _08116E3C @ =_08116E40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08116E38: .4byte gUnknown_203B05C
_08116E3C: .4byte _08116E40
	.align 2, 0
_08116E40:
	.4byte _08116E70
	.4byte _08116F20
	.4byte _08116EA4
	.4byte _08116EC8
	.4byte _08116F20
	.4byte _08116F20
	.4byte _08116F20
	.4byte _08116F20
	.4byte _08116F20
	.4byte _08116F20
	.4byte _08116EF8
	.4byte _08116F16
_08116E70:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80FAF58
	bl sub_800B1F4
	bl OpenLink
	bl sub_80FBBD8
	movs r0, 0x1
	bl sub_80FB128
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r4, 0x4]
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r4]
	movs r0, 0x2
	strb r0, [r4, 0x8]
	b _08116F20
_08116EA4:
	ldr r0, [r4, 0x4]
	movs r1, 0x4
	bl sub_811A650
	ldr r0, [r4]
	movs r1, 0x10
	bl sub_811A5E4
	ldr r0, [r4, 0x4]
	movs r1, 0xFF
	bl sub_811A054
	movs r1, 0
	strb r0, [r4, 0x11]
	strb r1, [r4, 0xF]
	movs r0, 0x3
	strb r0, [r4, 0x8]
	b _08116F20
_08116EC8:
	bl sub_8116FE4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08116EDA
	movs r0, 0x2
	bl PlaySE
_08116EDA:
	ldr r0, _08116EF4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	bne _08116F20
	movs r0, 0xA
	strb r0, [r4, 0x8]
	b _08116F20
	.align 2, 0
_08116EF4: .4byte gTasks
_08116EF8:
	ldrb r0, [r4, 0x11]
	bl DestroyTask
	ldr r0, [r4]
	bl Free
	ldr r0, [r4, 0x4]
	bl Free
	bl sub_80F8DC0
	ldrb r0, [r4, 0x8]
	adds r0, 0x1
	strb r0, [r4, 0x8]
	b _08116F20
_08116F16:
	bl sub_80F8DC0
	adds r0, r5, 0
	bl DestroyTask
_08116F20:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8116E1C

	thumb_func_start sub_8116F28
sub_8116F28: @ 8116F28
	push {lr}
	adds r2, r0, 0
	cmp r1, 0xFF
	bne _08116F34
_08116F30:
	movs r0, 0x1
	b _08116F58
_08116F34:
	cmp r1, 0xD
	bhi _08116F56
	ldr r0, _08116F44 @ =gUnknown_8457094
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	b _08116F50
	.align 2, 0
_08116F44: .4byte gUnknown_8457094
_08116F48:
	ldrb r0, [r1]
	cmp r0, r2
	beq _08116F30
	adds r1, 0x1
_08116F50:
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08116F48
_08116F56:
	movs r0, 0
_08116F58:
	pop {r1}
	bx r1
	thumb_func_end sub_8116F28

	thumb_func_start sub_8116F5C
sub_8116F5C: @ 8116F5C
	push {lr}
	ldr r0, [r0]
	lsls r1, 5
	adds r1, r0, r1
	ldrb r2, [r1, 0x1A]
	lsls r0, r2, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08116F8E
	ldrb r0, [r1, 0xA]
	lsrs r0, 7
	cmp r0, 0
	beq _08116F7A
	movs r0, 0x3
	b _08116F90
_08116F7A:
	lsls r0, r2, 29
	cmp r0, 0
	bge _08116F84
	movs r0, 0x1
	b _08116F90
_08116F84:
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08116F8E
	movs r0, 0x2
	b _08116F90
_08116F8E:
	movs r0, 0
_08116F90:
	pop {r1}
	bx r1
	thumb_func_end sub_8116F5C

	thumb_func_start sub_8116F94
sub_8116F94: @ 8116F94
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08116FE0 @ =gUnknown_203B05C
	ldr r0, [r0]
	mov r8, r0
	bl sub_8116F5C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 5
	mov r2, r8
	ldr r3, [r2]
	adds r3, r1
	str r0, [sp]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x8
	adds r2, r6, 0
	bl sub_811A81C
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116FE0: .4byte gUnknown_203B05C
	thumb_func_end sub_8116F94

	thumb_func_start sub_8116FE4
sub_8116FE4: @ 8116FE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r0, _0811704C @ =gUnknown_203B05C
	ldr r6, [r0]
	movs r7, 0
	movs r3, 0
_08116FF4:
	ldr r0, [r6]
	lsls r5, r3, 5
	adds r2, r0, r5
	ldrb r0, [r2, 0x1A]
	lsls r0, 30
	mov r8, r5
	cmp r0, 0
	beq _081170C0
	ldr r1, [r6, 0x4]
	adds r0, r2, 0
	str r3, [sp]
	bl sub_811A748
	adds r4, r0, 0
	ldr r3, [sp]
	cmp r4, 0xFF
	beq _0811708E
	ldr r0, [r6]
	adds r2, r0, r5
	ldrb r1, [r2, 0x1A]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _0811706C
	lsls r0, r4, 3
	subs r0, r4
	lsls r4, r0, 2
	ldr r1, [r6, 0x4]
	adds r1, r4
	adds r0, r2, 0
	bl sub_811A6DC
	ldr r3, [sp]
	cmp r0, 0
	beq _08117050
	ldr r1, [r6]
	ldr r0, [r6, 0x4]
	adds r1, r5
	adds r0, r4
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	b _0811707A
	.align 2, 0
_0811704C: .4byte gUnknown_203B05C
_08117050:
	ldr r0, [r6]
	adds r1, r0, r5
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08117084
	subs r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0, 0x1B]
	cmp r0, 0
	bne _08117084
	movs r7, 0x2
	b _08117084
_0811706C:
	movs r4, 0x4
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1A]
_0811707A:
	ldr r0, [r6]
	adds r0, r5
	movs r1, 0x40
	strb r1, [r0, 0x1B]
	movs r7, 0x1
_08117084:
	ldr r0, [r6]
	add r0, r8
	movs r1, 0
	strh r1, [r0, 0x18]
	b _081170C0
_0811708E:
	ldr r0, [r6]
	adds r1, r0, r5
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x2
	beq _081170C0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
	ldr r0, [r6]
	adds r2, r0, r5
	ldrh r1, [r2, 0x18]
	ldr r0, _081170FC @ =0x0000012b
	cmp r1, r0
	bls _081170C0
	ldrb r0, [r2, 0x1A]
	movs r7, 0x4
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x1A]
	movs r7, 0x2
_081170C0:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _08116FF4
	movs r5, 0
	movs r4, 0x3
_081170CE:
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	adds r1, r5
	movs r2, 0x10
	bl sub_811A798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _081170E4
	movs r7, 0x1
_081170E4:
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _081170CE
	adds r0, r7, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081170FC: .4byte 0x0000012b
	thumb_func_end sub_8116FE4

	thumb_func_start sub_8117100
sub_8117100: @ 8117100
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl CB2_ReturnFromLinkTrade
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8117100

	thumb_func_start sub_8117118
sub_8117118: @ 8117118
	push {lr}
	ldr r0, _0811712C @ =sub_8117100
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0811712C: .4byte sub_8117100
	thumb_func_end sub_8117118

	thumb_func_start sub_8117130
sub_8117130: @ 8117130
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0811716C @ =gUnknown_203B06C
	mov r8, r0
	bl GetMultiplayerId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_811B1EC
	adds r7, r0, 0
	ldr r1, _08117170 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0811719C
	cmp r0, 0x1
	bgt _08117174
	cmp r0, 0
	beq _0811717E
	b _0811725C
	.align 2, 0
_0811716C: .4byte gUnknown_203B06C
_08117170: .4byte gTasks
_08117174:
	cmp r0, 0x2
	beq _081171D8
	cmp r0, 0x3
	beq _08117210
	b _0811725C
_0811717E:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08117198 @ =gPlayerParty
	adds r1, r0
	movs r0, 0
	movs r2, 0x64
	bl SendBlock
	b _0811725C
	.align 2, 0
_08117198: .4byte gPlayerParty
_0811719C:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0811725C
	bl GetMultiplayerId
	adds r1, r0, 0
	ldr r0, _081171D0 @ =gEnemyParty
	movs r2, 0x1
	eors r1, r2
	lsls r1, 24
	lsrs r1, 16
	ldr r2, _081171D4 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	movs r0, 0x32
	bl IncrementGameStat
	bl ResetBlockReceivedFlags
	b _081171FA
	.align 2, 0
_081171D0: .4byte gEnemyParty
_081171D4: .4byte gBlockRecvBuffer
_081171D8:
	ldr r4, _08117204 @ =gBlockSendBuffer
	ldr r0, _08117208 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _0811720C @ =0x00002cd0
	adds r1, r0
	adds r0, r4, 0
	movs r2, 0xDC
	bl memcpy
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0xDC
	bl SendBlock
	lsls r0, 24
	cmp r0, 0
	beq _0811725C
_081171FA:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _0811725C
	.align 2, 0
_08117204: .4byte gBlockSendBuffer
_08117208: .4byte gSaveBlock1Ptr
_0811720C: .4byte 0x00002cd0
_08117210:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0811725C
	ldr r4, _08117268 @ =gLinkPartnerMail
	bl GetMultiplayerId
	adds r1, r0, 0
	movs r0, 0x1
	eors r1, r0
	lsls r1, 24
	lsrs r1, 16
	ldr r0, _0811726C @ =gBlockRecvBuffer
	adds r1, r0
	adds r0, r4, 0
	movs r2, 0xD8
	bl memcpy
	bl ResetBlockReceivedFlags
	ldr r1, _08117270 @ =gSelectedTradeMonPositions
	strb r7, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r1, _08117274 @ =gMain
	ldr r0, _08117278 @ =CB2_ReturnToField
	str r0, [r1, 0x8]
	ldr r0, _0811727C @ =CB2_InitTradeAnim_LinkTrade
	bl SetMainCallback2
	mov r0, r8
	bl sub_811B148
	adds r0, r6, 0
	bl DestroyTask
_0811725C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117268: .4byte gLinkPartnerMail
_0811726C: .4byte gBlockRecvBuffer
_08117270: .4byte gSelectedTradeMonPositions
_08117274: .4byte gMain
_08117278: .4byte CB2_ReturnToField
_0811727C: .4byte CB2_InitTradeAnim_LinkTrade
	thumb_func_end sub_8117130

	thumb_func_start sub_8117280
sub_8117280: @ 8117280
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _081172A4 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081172A8
	cmp r0, 0x1
	beq _081172C0
	b _0811734A
	.align 2, 0
_081172A4: .4byte gTasks
_081172A8:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _081172B8
	movs r0, 0x2
	bl sub_800A474
_081172B8:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0811734A
_081172C0:
	bl GetBlockReceivedStatus
	adds r4, r0, 0
	bl sub_800A8D4
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0811734A
	movs r4, 0
	ldr r0, _081172E0 @ =gTrainerCards
	adds r7, r0, 0
	adds r7, 0x38
	ldr r6, _081172E4 @ =gLinkPlayers
	adds r5, r0, 0
	b _08117302
	.align 2, 0
_081172E0: .4byte gTrainerCards
_081172E4: .4byte gLinkPlayers
_081172E8:
	lsls r0, r4, 8
	ldr r1, _08117338 @ =gBlockRecvBuffer
	adds r1, r0, r1
	adds r0, r5, 0
	movs r2, 0x60
	bl memcpy
	ldrh r0, [r6]
	strb r0, [r7]
	adds r7, 0x60
	adds r6, 0x1C
	adds r5, 0x60
	adds r4, 0x1
_08117302:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _081172E8
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0811733C
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 16
	ldr r1, _08117338 @ =gBlockRecvBuffer
	adds r1, r0, r1
	adds r0, r1, 0
	adds r0, 0x60
	ldrh r0, [r0]
	bl sub_81446D0
	b _08117340
	.align 2, 0
_08117338: .4byte gBlockRecvBuffer
_0811733C:
	bl sub_81446C4
_08117340:
	bl ResetBlockReceivedFlags
	mov r0, r8
	bl DestroyTask
_0811734A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8117280

	thumb_func_start sub_8117354
sub_8117354: @ 8117354
	push {r4,lr}
	ldr r0, _0811736C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _08117370
	cmp r0, 0x1
	beq _08117384
	b _081173A2
	.align 2, 0
_0811736C: .4byte gMain
_08117370:
	ldr r0, _08117380 @ =sub_8117280
	movs r1, 0x5
	bl CreateTask
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _081173A2
	.align 2, 0
_08117380: .4byte sub_8117280
_08117384:
	ldr r0, _081173B8 @ =sub_8117280
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _081173A2
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081173BC @ =CB2_ReturnToField
	bl ShowTrainerCardInLink
_081173A2:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081173B8: .4byte sub_8117280
_081173BC: .4byte CB2_ReturnToField
	thumb_func_end sub_8117354

	thumb_func_start sub_81173C0
sub_81173C0: @ 81173C0
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	bl HealPlayerParty
	bl SavePlayerParty
	bl LoadPlayerBag
	ldr r5, _0811742C @ =gLinkPlayers
	ldr r0, _08117430 @ =0x00002211
	str r0, [r5, 0x14]
	bl GetMultiplayerId
	adds r4, r0, 0
	bl GetMultiplayerId
	lsls r4, 24
	lsrs r4, 24
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x18]
	bl GetMultiplayerId
	adds r4, r0, 0
	bl GetMultiplayerId
	movs r2, 0x1
	eors r4, r2
	lsls r4, 24
	lsrs r4, 24
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r5
	eors r0, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x18]
	ldr r1, _08117434 @ =gMain
	ldr r0, _08117438 @ =sub_8081668
	str r0, [r1, 0x8]
	ldr r0, _0811743C @ =gBattleTypeFlags
	str r6, [r0]
	bl PlayBattleBGM
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811742C: .4byte gLinkPlayers
_08117430: .4byte 0x00002211
_08117434: .4byte gMain
_08117438: .4byte sub_8081668
_0811743C: .4byte gBattleTypeFlags
	thumb_func_end sub_81173C0

	thumb_func_start sub_8117440
sub_8117440: @ 8117440
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _081174AC @ =0x0000406f
	adds r1, r3, 0
	bl VarSet
	ldr r6, _081174B0 @ =gSaveBlock1Ptr
	ldr r1, [r6]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	mov r8, r2
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	str r5, [sp]
	adds r3, r4, 0
	bl SetWarpDestination
	ldr r0, [r6]
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	movs r2, 0x5
	ldrsb r2, [r0, r2]
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	mov r3, r8
	bl SetDynamicWarpWithCoords
	bl WarpIntoMap
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081174AC: .4byte 0x0000406f
_081174B0: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8117440

	thumb_func_start sub_81174B4
sub_81174B4: @ 81174B4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	mov r8, r2
	adds r6, r3, 0
	ldr r1, [sp, 0x18]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08117524 @ =gSpecialVar_0x8004
	strh r1, [r0]
	ldr r0, _08117528 @ =0x0000406f
	bl VarSet
	bl GetLinkPlayerCount
	ldr r1, _0811752C @ =gUnknown_3005030
	strb r0, [r1]
	bl GetMultiplayerId
	ldr r1, _08117530 @ =gUnknown_300502C
	strb r0, [r1]
	bl SetCableClubWarp
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	movs r2, 0x1
	negs r2, r2
	mov r0, r8
	lsls r0, 24
	asrs r0, 24
	mov r8, r0
	lsls r6, 24
	asrs r6, 24
	str r6, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	mov r3, r8
	bl SetWarpDestination
	bl WarpIntoMap
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08117524: .4byte gSpecialVar_0x8004
_08117528: .4byte 0x0000406f
_0811752C: .4byte gUnknown_3005030
_08117530: .4byte gUnknown_300502C
	thumb_func_end sub_81174B4

	thumb_func_start sub_8117534
sub_8117534: @ 8117534
	push {r4,lr}
	ldr r0, _0811754C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _08117550
	cmp r0, 0x1
	beq _08117564
	b _08117576
	.align 2, 0
_0811754C: .4byte gMain
_08117550:
	ldr r0, _08117560 @ =sub_8117280
	movs r1, 0x5
	bl CreateTask
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08117576
	.align 2, 0
_08117560: .4byte sub_8117280
_08117564:
	ldr r0, _0811758C @ =sub_8117280
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08117576
	ldr r0, _08117590 @ =sub_8056788
	bl SetMainCallback2
_08117576:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811758C: .4byte sub_8117280
_08117590: .4byte sub_8056788
	thumb_func_end sub_8117534

	thumb_func_start sub_8117594
sub_8117594: @ 8117594
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl TrainerCard_GenerateCardForLinkPlayer
	cmp r5, 0
	beq _081175AE
	bl sub_81440E8
	adds r1, r4, 0
	adds r1, 0x60
	strh r0, [r1]
	b _081175B4
_081175AE:
	adds r0, r4, 0
	adds r0, 0x60
	strh r5, [r0]
_081175B4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8117594

	thumb_func_start sub_81175BC
sub_81175BC: @ 81175BC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81446C4
	ldr r0, _081175DC @ =gUnknown_203B058
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0xD
	bhi _08117620
	lsls r0, 2
	ldr r1, _081175E0 @ =_081175E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081175DC: .4byte gUnknown_203B058
_081175E0: .4byte _081175E4
	.align 2, 0
_081175E4:
	.4byte _0811761C
	.4byte _0811761C
	.4byte _0811761C
	.4byte _0811761C
	.4byte _08117620
	.4byte _08117620
	.4byte _08117620
	.4byte _08117620
	.4byte _0811761C
	.4byte _0811761C
	.4byte _0811761C
	.4byte _08117620
	.4byte _0811761C
	.4byte _0811761C
_0811761C:
	bl RecordMixTrainerNames
_08117620:
	ldr r0, _08117638 @ =gUnknown_203B058
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x50
	bls _0811762C
	b _081178E0
_0811762C:
	lsls r0, 2
	ldr r1, _0811763C @ =_08117640
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08117638: .4byte gUnknown_203B058
_0811763C: .4byte _08117640
	.align 2, 0
_08117640:
	.4byte _081177A0
	.4byte _081177C8
	.4byte _081177F0
	.4byte _08117818
	.4byte _08117854
	.4byte _081178E0
	.4byte _081178E0
	.4byte _08117878
	.4byte _08117890
	.4byte _081178B0
	.4byte _081178C8
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _08117784
	.4byte _081178E0
	.4byte _081178E0
	.4byte _08117844
	.4byte _08117854
	.4byte _081178E0
	.4byte _081178E0
	.4byte _08117878
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _081178E0
	.4byte _08117784
_08117784:
	bl CleanupOverworldWindowsAndTilemaps
	ldr r1, _08117798 @ =gMain
	ldr r0, _0811779C @ =sub_811C1C8
	str r0, [r1, 0x8]
	movs r0, 0x2
	bl InitChooseHalfPartyForBattle
	b _081178E0
	.align 2, 0
_08117798: .4byte gMain
_0811779C: .4byte sub_811C1C8
_081177A0:
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _081177C4 @ =gBlockSendBuffer
	movs r1, 0x1
	bl sub_8117594
	bl HealPlayerParty
	bl SavePlayerParty
	bl LoadPlayerBag
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x6
	b _0811782E
	.align 2, 0
_081177C4: .4byte gBlockSendBuffer
_081177C8:
	bl CleanupOverworldWindowsAndTilemaps
	bl HealPlayerParty
	bl SavePlayerParty
	bl LoadPlayerBag
	ldr r0, _081177EC @ =gBlockSendBuffer
	movs r1, 0x1
	bl sub_8117594
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x6
	b _0811782E
	.align 2, 0
_081177EC: .4byte gBlockSendBuffer
_081177F0:
	bl CleanupOverworldWindowsAndTilemaps
	bl HealPlayerParty
	bl SavePlayerParty
	bl LoadPlayerBag
	ldr r0, _08117814 @ =gBlockSendBuffer
	movs r1, 0x1
	bl sub_8117594
	movs r0, 0x5
	str r0, [sp]
	movs r0, 0
	movs r1, 0x3
	b _0811782C
	.align 2, 0
_08117814: .4byte gBlockSendBuffer
_08117818:
	ldr r0, _0811783C @ =gBlockSendBuffer
	movs r1, 0x1
	bl sub_8117594
	bl CleanupOverworldWindowsAndTilemaps
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0
	movs r1, 0x1
_0811782C:
	movs r2, 0x5
_0811782E:
	movs r3, 0x8
	bl sub_81174B4
	ldr r0, _08117840 @ =sub_8117534
	bl SetMainCallback2
	b _081178E0
	.align 2, 0
_0811783C: .4byte gBlockSendBuffer
_08117840: .4byte sub_8117534
_08117844:
	ldr r0, _08117850 @ =sub_8117130
	movs r1, 0
	bl CreateTask
	b _081178E0
	.align 2, 0
_08117850: .4byte sub_8117130
_08117854:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _08117864
	bl sub_80F8CFC
	b _08117872
_08117864:
	bl sub_80F8D14
	movs r0, 0x45
	movs r1, 0
	movs r2, 0x1
	bl sub_80FAF58
_08117872:
	bl sub_8128420
	b _081178E0
_08117878:
	ldr r0, _08117888 @ =gBlockSendBuffer
	movs r1, 0
	bl sub_8117594
	ldr r0, _0811788C @ =sub_8117354
	bl SetMainCallback2
	b _081178E0
	.align 2, 0
_08117888: .4byte gBlockSendBuffer
_0811788C: .4byte sub_8117354
_08117890:
	movs r0, 0x8
	movs r1, 0x5
	movs r2, 0x1
	bl sub_8117440
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081178AC @ =CB2_LoadMap
	bl sub_8147AA8
	b _081178E0
	.align 2, 0
_081178AC: .4byte CB2_LoadMap
_081178B0:
	movs r0, 0x7
	movs r1, 0x9
	movs r2, 0x1
	bl sub_8117440
	ldr r0, _081178C4 @ =CB2_LoadMap
	bl sub_814B754
	b _081178E0
	.align 2, 0
_081178C4: .4byte CB2_LoadMap
_081178C8:
	movs r0, 0x8
	movs r1, 0x5
	movs r2, 0x1
	bl sub_8117440
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081178F8 @ =CB2_LoadMap
	bl sub_81507FC
_081178E0:
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, _081178FC @ =gSpecialVar_Result
	movs r0, 0x1
	strh r0, [r1]
	bl ScriptContext2_Disable
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081178F8: .4byte CB2_LoadMap
_081178FC: .4byte gSpecialVar_Result
	thumb_func_end sub_81175BC

	thumb_func_start sub_8117900
sub_8117900: @ 8117900
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08117924 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08117944
	cmp r0, 0x1
	bgt _08117928
	cmp r0, 0
	beq _08117932
	b _08117988
	.align 2, 0
_08117924: .4byte gTasks+0x8
_08117928:
	cmp r0, 0x2
	beq _08117958
	cmp r0, 0x3
	beq _08117974
	b _08117988
_08117932:
	ldr r1, _08117940 @ =gSpecialVar_Result
	movs r0, 0x1
	strh r0, [r1]
	bl EnableBothScriptContexts
	b _08117968
	.align 2, 0
_08117940: .4byte gSpecialVar_Result
_08117944:
	bl ScriptContext1_IsScriptSetUp
	lsls r0, 24
	cmp r0, 0
	bne _08117988
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	b _08117968
_08117958:
	ldr r0, _08117970 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08117988
	bl sub_800AB9C
_08117968:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08117988
	.align 2, 0
_08117970: .4byte gPaletteFade
_08117974:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08117988
	adds r0, r5, 0
	bl DestroyTask
	bl sub_81179A4
_08117988:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8117900

	thumb_func_start sub_8117990
sub_8117990: @ 8117990
	push {lr}
	ldr r0, _081179A0 @ =sub_8117900
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081179A0: .4byte sub_8117900
	thumb_func_end sub_8117990

	thumb_func_start sub_81179A4
sub_81179A4: @ 81179A4
	push {lr}
	ldr r0, _081179C4 @ =sub_81175BC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081179C8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_081179C4: .4byte sub_81175BC
_081179C8: .4byte gTasks
	thumb_func_end sub_81179A4

	thumb_func_start MEvent_CreateTask_Leader
MEvent_CreateTask_Leader: @ 81179CC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081179FC @ =sub_8117A0C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08117A00 @ =gUnknown_203B05C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08117A04 @ =gTasks+0x8
	adds r1, r0
	str r1, [r2]
	movs r2, 0
	strb r2, [r1, 0xC]
	strb r2, [r1, 0xD]
	strb r4, [r1, 0x18]
	ldr r0, _08117A08 @ =gSpecialVar_Result
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081179FC: .4byte sub_8117A0C
_08117A00: .4byte gUnknown_203B05C
_08117A04: .4byte gTasks+0x8
_08117A08: .4byte gSpecialVar_Result
	thumb_func_end MEvent_CreateTask_Leader

	thumb_func_start sub_8117A0C
sub_8117A0C: @ 8117A0C
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08117A2C @ =gUnknown_203B05C
	ldr r5, [r0]
	ldrb r0, [r5, 0xC]
	cmp r0, 0x11
	bls _08117A20
	b _08117ECA
_08117A20:
	lsls r0, 2
	ldr r1, _08117A30 @ =_08117A34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08117A2C: .4byte gUnknown_203B05C
_08117A30: .4byte _08117A34
	.align 2, 0
_08117A34:
	.4byte _08117A7C
	.4byte _08117AB8
	.4byte _08117B7C
	.4byte _08117BAC
	.4byte _08117BBC
	.4byte _08117C0C
	.4byte _08117BE4
	.4byte _08117C12
	.4byte _08117CB2
	.4byte _08117D94
	.4byte _08117DA4
	.4byte _08117DBA
	.4byte _08117DD2
	.4byte _08117DEE
	.4byte _08117E26
	.4byte _08117E4C
	.4byte _08117E80
	.4byte _08117EBA
_08117A7C:
	ldr r1, _08117AB0 @ =gUnknown_203B058
	ldrb r0, [r5, 0x18]
	strb r0, [r1]
	ldr r1, _08117AB4 @ =gUnknown_203B059
	movs r0, 0x2
	strb r0, [r1]
	ldrb r0, [r5, 0x18]
	movs r1, 0
	movs r2, 0
	bl sub_80FAF58
	movs r0, 0
	movs r1, 0
	bl sub_80FAF74
	bl sub_800B1F4
	bl OpenLink
	movs r0, 0x2
	bl sub_80FBB8C
	movs r0, 0x1
	strb r0, [r5, 0xC]
	b _08117ECA
	.align 2, 0
_08117AB0: .4byte gUnknown_203B058
_08117AB4: .4byte gUnknown_203B059
_08117AB8:
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0x4]
	movs r0, 0xA0
	bl AllocZeroed
	str r0, [r5]
	movs r0, 0xA0
	bl AllocZeroed
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x4]
	movs r1, 0x4
	bl sub_811A650
	ldr r0, [r5]
	movs r1, 0x5
	bl sub_811A5E4
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0x10
	bl sub_80FCD50
	ldr r1, [r5]
	movs r3, 0
	movs r0, 0
	strh r0, [r1, 0x18]
	ldr r2, [r5]
	ldrb r1, [r2, 0x1A]
	subs r0, 0x4
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1A]
	ldr r2, [r5]
	ldrb r1, [r2, 0x1A]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1A]
	ldr r0, [r5]
	strb r3, [r0, 0x1B]
	ldr r0, [r5, 0x4]
	movs r1, 0xFF
	bl sub_811A054
	strb r0, [r5, 0x17]
	ldr r0, _08117B6C @ =gUnknown_8456CFC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	bl GetMysteryGiftBaseBlock
	lsls r0, 16
	ldr r2, _08117B70 @ =0x0000ffff
	ldr r1, [sp, 0x4]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl AddWindow
	strb r0, [r5, 0xF]
	ldrb r0, [r5, 0xF]
	bl MG_DrawTextBorder
	ldr r0, _08117B74 @ =gMultiuseListMenuTemplate
	adds r2, r0, 0
	ldr r1, _08117B78 @ =gUnknown_8456D34
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldrb r1, [r5, 0xF]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r5, 0x12]
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r0, 0x1
	strb r0, [r5, 0x13]
	b _08117C02
	.align 2, 0
_08117B6C: .4byte gUnknown_8456CFC
_08117B70: .4byte 0x0000ffff
_08117B74: .4byte gMultiuseListMenuTemplate
_08117B78: .4byte gUnknown_8456D34
_08117B7C:
	ldr r0, _08117B9C @ =gStringVar1
	ldr r2, _08117BA0 @ =gUnknown_8456C74
	ldr r4, _08117BA4 @ =gUnknown_203B058
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08117BA8 @ =gStringVar4
	ldrb r1, [r4]
	bl sub_811599C
	movs r0, 0x3
	strb r0, [r5, 0xC]
	b _08117ECA
	.align 2, 0
_08117B9C: .4byte gStringVar1
_08117BA0: .4byte gUnknown_8456C74
_08117BA4: .4byte gUnknown_203B058
_08117BA8: .4byte gStringVar4
_08117BAC:
	ldr r0, _08117BB8 @ =gStringVar4
	bl AddTextPrinterToWindow1
	movs r0, 0x4
	strb r0, [r5, 0xC]
	b _08117ECA
	.align 2, 0
_08117BB8: .4byte gStringVar4
_08117BBC:
	adds r0, r5, 0
	movs r1, 0x5
	movs r2, 0x6
	bl sub_8116444
	ldr r0, _08117BE0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08117BD4
	b _08117ECA
_08117BD4:
	movs r0, 0xD
	strb r0, [r5, 0xC]
	bl DestroyWirelessStatusIndicatorSprite
	b _08117ECA
	.align 2, 0
_08117BE0: .4byte gMain
_08117BE4:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, _08117C08 @ =gUnknown_84577F8
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, 0
	bne _08117BF4
	b _08117ECA
_08117BF4:
	ldr r0, [r5]
	bl sub_81165E8
	strb r0, [r5, 0x13]
	ldrb r0, [r5, 0x12]
	bl RedrawListMenu
_08117C02:
	movs r0, 0x2
	strb r0, [r5, 0xC]
	b _08117ECA
	.align 2, 0
_08117C08: .4byte gUnknown_84577F8
_08117C0C:
	movs r0, 0x7
	strb r0, [r5, 0xC]
	b _08117ECA
_08117C12:
	adds r0, r5, 0
	adds r0, 0xD
	adds r1, r5, 0
	adds r1, 0x14
	ldr r3, _08117C38 @ =gStringVar4
	movs r2, 0
	bl mevent_message_print_and_prompt_yes_no
	lsls r0, 24
	asrs r4, r0, 24
	cmp r4, 0
	beq _08117C42
	cmp r4, 0
	bgt _08117C3C
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08117C84
	b _08117ECA
	.align 2, 0
_08117C38: .4byte gStringVar4
_08117C3C:
	cmp r4, 0x1
	beq _08117C84
	b _08117ECA
_08117C42:
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	adds r1, r0
	strb r4, [r1, 0x1B]
	ldrb r0, [r5, 0x12]
	bl RedrawListMenu
	movs r0, 0x5
	strb r0, [r5, 0x19]
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	ldr r2, [r5]
	adds r2, r0
	adds r2, 0x10
	movs r0, 0x5
	b _08117CA8
_08117C84:
	movs r0, 0x6
	strb r0, [r5, 0x19]
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	ldr r2, [r5]
	adds r2, r0
	adds r2, 0x10
	movs r0, 0x6
_08117CA8:
	bl sub_80FA670
	movs r0, 0x8
	strb r0, [r5, 0xC]
	b _08117ECA
_08117CB2:
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r0, 0x2
	bl sub_8118658
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r5, 0x13]
	lsls r2, 5
	ldr r1, [r5]
	adds r1, r2
	adds r1, 0x10
	bl sub_80FA6FC
	adds r4, r0, 0
	cmp r4, 0x1
	bne _08117D82
	ldrb r0, [r5, 0x19]
	cmp r0, 0x5
	bne _08117D3C
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	adds r1, r0
	movs r0, 0
	strb r0, [r1, 0x1B]
	ldrb r0, [r5, 0x12]
	bl RedrawListMenu
	ldrb r0, [r5, 0x13]
	adds r0, 0x1
	strb r0, [r5, 0x13]
	ldr r4, _08117D30 @ =gStringVar1
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r1, r0
	subs r1, 0x10
	adds r0, r4, 0
	bl StringCopy7
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	subs r0, 0x1
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r0, _08117D34 @ =gStringVar4
	ldr r1, _08117D38 @ =gUnknown_8457554
	bl StringExpandPlaceholders
	movs r0, 0x9
	strb r0, [r5, 0xC]
	bl sub_80F8F5C
	b _08117D7C
	.align 2, 0
_08117D30: .4byte gStringVar1
_08117D34: .4byte gStringVar4
_08117D38: .4byte gUnknown_8457554
_08117D3C:
	ldrb r1, [r5, 0x13]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80FBD4C
	ldr r1, [r5]
	ldrb r0, [r5, 0x13]
	lsls r0, 5
	adds r1, r0
	ldrb r2, [r1, 0x1A]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1A]
	ldr r0, [r5]
	bl sub_81165E8
	ldrb r0, [r5, 0x12]
	bl RedrawListMenu
	movs r0, 0x2
	strb r0, [r5, 0xC]
_08117D7C:
	movs r0, 0
	strb r0, [r5, 0x19]
	b _08117ECA
_08117D82:
	cmp r4, 0x2
	beq _08117D88
	b _08117ECA
_08117D88:
	movs r0, 0
	movs r1, 0
	bl sub_80FB9E4
	strb r4, [r5, 0xC]
	b _08117ECA
_08117D94:
	ldr r0, _08117DA0 @ =gStringVar4
	bl AddTextPrinterToWindow1
	movs r0, 0xA
	strb r0, [r5, 0xC]
	b _08117ECA
	.align 2, 0
_08117DA0: .4byte gStringVar4
_08117DA4:
	ldrb r0, [r5, 0xE]
	adds r0, 0x1
	strb r0, [r5, 0xE]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x78
	bhi _08117DB4
	b _08117ECA
_08117DB4:
	movs r0, 0xB
	strb r0, [r5, 0xC]
	b _08117ECA
_08117DBA:
	adds r0, r5, 0
	movs r1, 0x5
	movs r2, 0x6
	bl sub_8116444
	lsls r0, 24
	cmp r0, 0
	beq _08117DCC
	b _08117ECA
_08117DCC:
	movs r0, 0xC
	strb r0, [r5, 0xC]
	b _08117ECA
_08117DD2:
	bl sub_80F8F40
	lsls r0, 24
	cmp r0, 0
	beq _08117DE8
	movs r0, 0
	bl sub_80F8F7C
	movs r0, 0xF
	strb r0, [r5, 0xC]
	b _08117ECA
_08117DE8:
	movs r0, 0x6
	strb r0, [r5, 0xC]
	b _08117ECA
_08117DEE:
	bl DestroyWirelessStatusIndicatorSprite
	bl sub_80F8DC0
	ldrb r0, [r5, 0x12]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, 0xF]
	bl RemoveWindow
	ldrb r0, [r5, 0x17]
	bl DestroyTask
	ldr r0, [r5, 0x8]
	bl Free
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, 0x4]
	bl Free
	b _08117EB2
_08117E26:
	adds r0, r5, 0
	adds r0, 0xD
	ldr r1, _08117E44 @ =gUnknown_84571B8
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, 0
	beq _08117ECA
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, _08117E48 @ =gSpecialVar_Result
	movs r0, 0x5
	strh r0, [r1]
	b _08117ECA
	.align 2, 0
_08117E44: .4byte gUnknown_84571B8
_08117E48: .4byte gSpecialVar_Result
_08117E4C:
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08117E64
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08117E6A
_08117E64:
	movs r0, 0xD
	strb r0, [r5, 0xC]
	b _08117ECA
_08117E6A:
	ldr r0, _08117E7C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08117ECA
	movs r0, 0x1
	bl sub_80FAFE0
	b _08117EB2
	.align 2, 0
_08117E7C: .4byte gReceivedRemoteLinkPlayers
_08117E80:
	ldrb r0, [r5, 0x12]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, 0xF]
	bl RemoveWindow
	ldrb r0, [r5, 0x17]
	bl DestroyTask
	ldr r0, [r5, 0x8]
	bl Free
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, 0x4]
	bl Free
	bl sub_800AB9C
_08117EB2:
	ldrb r0, [r5, 0xC]
	adds r0, 0x1
	strb r0, [r5, 0xC]
	b _08117ECA
_08117EBA:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08117ECA
	adds r0, r4, 0
	bl DestroyTask
_08117ECA:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8117A0C

	thumb_func_start MEvent_CreateTask_CardOrNewsWithFriend
MEvent_CreateTask_CardOrNewsWithFriend: @ 8117ED4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08117F0C @ =sub_8117F20
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08117F10 @ =gUnknown_203B05C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08117F14 @ =gTasks+0x8
	adds r1, r0
	str r1, [r2]
	ldr r0, _08117F18 @ =gUnknown_3002028
	str r1, [r0]
	movs r2, 0
	strb r2, [r1, 0x8]
	strb r2, [r1, 0x9]
	subs r4, 0x15
	strb r4, [r1, 0x12]
	ldr r0, _08117F1C @ =gSpecialVar_Result
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117F0C: .4byte sub_8117F20
_08117F10: .4byte gUnknown_203B05C
_08117F14: .4byte gTasks+0x8
_08117F18: .4byte gUnknown_3002028
_08117F1C: .4byte gSpecialVar_Result
	thumb_func_end MEvent_CreateTask_CardOrNewsWithFriend

	thumb_func_start sub_8117F20
sub_8117F20: @ 8117F20
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08117F40 @ =gUnknown_203B05C
	ldr r5, [r0]
	ldrb r0, [r5, 0x8]
	cmp r0, 0xC
	bls _08117F34
	b _08118288
_08117F34:
	lsls r0, 2
	ldr r1, _08117F44 @ =_08117F48
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08117F40: .4byte gUnknown_203B05C
_08117F44: .4byte _08117F48
	.align 2, 0
_08117F48:
	.4byte _08117F7C
	.4byte _08117FB0
	.4byte _08117FC0
	.4byte _08118070
	.4byte _08118150
	.4byte _0811818C
	.4byte _081181EC
	.4byte _08118248
	.4byte _081181EC
	.4byte _08118222
	.4byte _081181EC
	.4byte _0811826C
	.4byte _08118278
_08117F7C:
	ldrb r0, [r5, 0x12]
	adds r0, 0x15
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	movs r2, 0
	bl sub_80FAF58
	bl sub_800B1F4
	bl OpenLink
	bl sub_80FBBD8
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0x4]
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x8]
	b _08118288
_08117FB0:
	ldr r0, _08117FBC @ =gUnknown_8458FE4
	bl AddTextPrinterToWindow1
	movs r0, 0x2
	strb r0, [r5, 0x8]
	b _08118288
	.align 2, 0
_08117FBC: .4byte gUnknown_8458FE4
_08117FC0:
	ldr r0, [r5, 0x4]
	movs r1, 0x4
	bl sub_811A650
	ldr r0, [r5]
	movs r1, 0x10
	bl sub_811A5E4
	ldr r0, [r5, 0x4]
	ldrb r1, [r5, 0x12]
	adds r1, 0x7
	bl sub_811A054
	movs r4, 0
	strb r0, [r5, 0x11]
	ldr r0, _0811805C @ =gUnknown_8456D4C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	bl GetMysteryGiftBaseBlock
	lsls r0, 16
	ldr r2, _08118060 @ =0x0000ffff
	ldr r1, [sp, 0x4]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl AddWindow
	strb r0, [r5, 0xB]
	ldr r0, _08118064 @ =gUnknown_8456D54
	bl AddWindow
	strb r0, [r5, 0xD]
	ldrb r0, [r5, 0xB]
	bl MG_DrawTextBorder
	ldr r0, _08118068 @ =gMultiuseListMenuTemplate
	adds r2, r0, 0
	ldr r1, _0811806C @ =gUnknown_8456DDC
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldrb r1, [r5, 0xB]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r5, 0xE]
	ldrb r0, [r5, 0xD]
	bl MG_DrawTextBorder
	ldrb r0, [r5, 0xD]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5, 0xD]
	bl PutWindowTilemap
	ldrb r0, [r5, 0xD]
	bl sub_8115924
	ldrb r0, [r5, 0xD]
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	strb r4, [r5, 0xF]
	movs r0, 0x3
	strb r0, [r5, 0x8]
	b _08118288
	.align 2, 0
_0811805C: .4byte gUnknown_8456D4C
_08118060: .4byte 0x0000ffff
_08118064: .4byte gUnknown_8456D54
_08118068: .4byte gMultiuseListMenuTemplate
_0811806C: .4byte gUnknown_8456DDC
_08118070:
	bl sub_8116FE4
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0811808E
	cmp r2, 0x1
	bne _08118086
	movs r0, 0x2
	bl PlaySE
_08118086:
	ldrb r0, [r5, 0xE]
	bl RedrawListMenu
	b _08118288
_0811808E:
	ldrb r0, [r5, 0xE]
	bl ListMenu_ProcessInput
	adds r2, r0, 0
	ldr r0, _08118128 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08118138
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _08118138
	ldr r0, [r5]
	lsls r1, r2, 5
	adds r0, r1
	ldrb r1, [r0, 0xA]
	ldrb r0, [r0, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08118130
	lsrs r0, r1, 7
	cmp r0, 0
	bne _08118130
	strb r2, [r5, 0xF]
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
	ldrb r0, [r5, 0xE]
	bl RedrawListMenu
	ldr r4, _0811812C @ =gStringVar1
	ldrb r0, [r5, 0xF]
	lsls r0, 5
	ldr r1, [r5]
	adds r1, r0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldr r1, [r5]
	ldrb r0, [r5, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	ldrb r1, [r5, 0xF]
	lsls r1, 5
	ldr r0, [r5]
	adds r0, r1
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80FBF54
	movs r0, 0x67
	bl PlaySE
	movs r0, 0x4
	strb r0, [r5, 0x8]
	b _08118288
	.align 2, 0
_08118128: .4byte gMain
_0811812C: .4byte gStringVar1
_08118130:
	movs r0, 0x7
	bl PlaySE
	b _08118288
_08118138:
	ldr r0, _0811814C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08118146
	b _08118288
_08118146:
	movs r0, 0x6
	strb r0, [r5, 0x8]
	b _08118288
	.align 2, 0
_0811814C: .4byte gMain
_08118150:
	ldr r0, _08118184 @ =gUnknown_8459238
	bl AddTextPrinterToWindow1
	ldr r4, _08118188 @ =gStringVar1
	ldrb r0, [r5, 0xF]
	lsls r0, 5
	ldr r1, [r5]
	adds r1, r0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldr r1, [r5]
	ldrb r0, [r5, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	movs r0, 0x5
	strb r0, [r5, 0x8]
	b _08118288
	.align 2, 0
_08118184: .4byte gUnknown_8459238
_08118188: .4byte gStringVar1
_0811818C:
	ldr r0, _081181C4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _081181AA
	ldr r2, _081181C8 @ =gUnknown_203B058
	ldr r1, [r5]
	ldrb r0, [r5, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 25
	lsrs r0, 25
	strb r0, [r2]
	movs r0, 0xA
	strb r0, [r5, 0x8]
_081181AA:
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	beq _081181D6
	cmp r0, 0x5
	bgt _081181CC
	cmp r0, 0x2
	bgt _08118288
	cmp r0, 0x1
	blt _08118288
	b _081181D0
	.align 2, 0
_081181C4: .4byte gReceivedRemoteLinkPlayers
_081181C8: .4byte gUnknown_203B058
_081181CC:
	cmp r0, 0x6
	bne _08118288
_081181D0:
	movs r0, 0x8
	strb r0, [r5, 0x8]
	b _08118288
_081181D6:
	ldr r0, _081181E8 @ =gUnknown_84576AC
	bl AddTextPrinterToWindow1
	movs r0, 0
	movs r1, 0
	bl sub_80FB9E4
	b _08118288
	.align 2, 0
_081181E8: .4byte gUnknown_84576AC
_081181EC:
	ldrb r0, [r5, 0xE]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, 0xD]
	bl RemoveWindow
	ldrb r0, [r5, 0xB]
	bl RemoveWindow
	ldrb r0, [r5, 0x11]
	bl DestroyTask
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, 0x4]
	bl Free
	ldrb r0, [r5, 0x8]
	adds r0, 0x1
	strb r0, [r5, 0x8]
	b _08118288
_08118222:
	adds r5, 0x9
	ldr r4, _08118244 @ =gUnknown_8457838
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, 0
	beq _08118288
	bl DestroyWirelessStatusIndicatorSprite
	b _08118252
	.align 2, 0
_08118244: .4byte gUnknown_8457838
_08118248:
	bl DestroyWirelessStatusIndicatorSprite
	ldr r0, _08118264 @ =gUnknown_84571B8
	bl AddTextPrinterToWindow1
_08118252:
	adds r0, r6, 0
	bl DestroyTask
	bl sub_80F8DC0
	ldr r1, _08118268 @ =gSpecialVar_Result
	movs r0, 0x5
	strh r0, [r1]
	b _08118288
	.align 2, 0
_08118264: .4byte gUnknown_84571B8
_08118268: .4byte gSpecialVar_Result
_0811826C:
	ldrb r0, [r5, 0x8]
	adds r0, 0x1
	strb r0, [r5, 0x8]
	bl sub_800AB9C
	b _08118288
_08118278:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08118288
	adds r0, r6, 0
	bl DestroyTask
_08118288:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8117F20

	thumb_func_start MEvent_CreateTask_CardOrNewsOverWireless
MEvent_CreateTask_CardOrNewsOverWireless: @ 8118290
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081182C8 @ =sub_81182DC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081182CC @ =gUnknown_203B05C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _081182D0 @ =gTasks+0x8
	adds r1, r0
	str r1, [r2]
	ldr r0, _081182D4 @ =gUnknown_3002028
	str r1, [r0]
	movs r2, 0
	strb r2, [r1, 0x8]
	strb r2, [r1, 0x9]
	subs r4, 0x15
	strb r4, [r1, 0x12]
	ldr r0, _081182D8 @ =gSpecialVar_Result
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081182C8: .4byte sub_81182DC
_081182CC: .4byte gUnknown_203B05C
_081182D0: .4byte gTasks+0x8
_081182D4: .4byte gUnknown_3002028
_081182D8: .4byte gSpecialVar_Result
	thumb_func_end MEvent_CreateTask_CardOrNewsOverWireless

	thumb_func_start sub_81182DC
sub_81182DC: @ 81182DC
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081182FC @ =gUnknown_203B05C
	ldr r5, [r0]
	ldrb r0, [r5, 0x8]
	cmp r0, 0xE
	bls _081182F0
	b _08118604
_081182F0:
	lsls r0, 2
	ldr r1, _08118300 @ =_08118304
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081182FC: .4byte gUnknown_203B05C
_08118300: .4byte _08118304
	.align 2, 0
_08118304:
	.4byte _08118340
	.4byte _0811836E
	.4byte _08118380
	.4byte _08118408
	.4byte _081184C8
	.4byte _08118504
	.4byte _08118564
	.4byte _081185A8
	.4byte _08118564
	.4byte _0811859A
	.4byte _08118564
	.4byte _081185B4
	.4byte _08118564
	.4byte _081185E8
	.4byte _081185F4
_08118340:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80FAF58
	bl sub_800B1F4
	bl OpenLink
	bl sub_80FBBD8
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0x4]
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x8]
	b _08118604
_0811836E:
	ldr r0, _0811837C @ =gUnknown_84591DC
	bl AddTextPrinterToWindow1
	movs r0, 0x2
	strb r0, [r5, 0x8]
	b _08118604
	.align 2, 0
_0811837C: .4byte gUnknown_84591DC
_08118380:
	ldr r0, [r5, 0x4]
	movs r1, 0x4
	bl sub_811A650
	ldr r0, [r5]
	movs r1, 0x10
	bl sub_811A5E4
	ldr r0, [r5, 0x4]
	ldrb r1, [r5, 0x12]
	adds r1, 0x7
	bl sub_811A084
	strb r0, [r5, 0x11]
	ldrb r0, [r5, 0x13]
	cmp r0, 0
	beq _081183EC
	ldr r0, _081183F8 @ =gUnknown_8456D4C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	bl GetMysteryGiftBaseBlock
	lsls r0, 16
	ldr r2, _081183FC @ =0x0000ffff
	ldr r1, [sp, 0x4]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0x4]
	mov r0, sp
	bl AddWindow
	strb r0, [r5, 0xB]
	ldrb r0, [r5, 0xB]
	bl MG_DrawTextBorder
	ldr r0, _08118400 @ =gMultiuseListMenuTemplate
	adds r2, r0, 0
	ldr r1, _08118404 @ =gUnknown_8456DDC
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldrb r1, [r5, 0xB]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	strb r0, [r5, 0xE]
	movs r0, 0
	bl CopyBgTilemapBufferToVram
_081183EC:
	movs r0, 0
	strb r0, [r5, 0xF]
	movs r0, 0x3
	strb r0, [r5, 0x8]
	b _08118604
	.align 2, 0
_081183F8: .4byte gUnknown_8456D4C
_081183FC: .4byte 0x0000ffff
_08118400: .4byte gMultiuseListMenuTemplate
_08118404: .4byte gUnknown_8456DDC
_08118408:
	bl sub_8116FE4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0811842E
	cmp r0, 0x1
	bne _0811841E
	movs r0, 0x2
	bl PlaySE
_0811841E:
	ldrb r0, [r5, 0x13]
	cmp r0, 0
	bne _08118426
	b _08118604
_08118426:
	ldrb r0, [r5, 0xE]
	bl RedrawListMenu
	b _08118604
_0811842E:
	ldrb r0, [r5, 0x13]
	cmp r0, 0
	beq _0811843A
	ldrb r0, [r5, 0xE]
	bl ListMenu_ProcessInput
_0811843A:
	ldrb r0, [r5, 0x14]
	cmp r0, 0x78
	bls _081184A8
	ldr r2, [r5]
	ldrb r1, [r2, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _081184BC
	ldrb r1, [r2, 0xA]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081184BC
	ldrb r1, [r5, 0x12]
	adds r1, 0x7
	adds r0, r2, 0
	bl sub_8119FB0
	cmp r0, 0
	beq _0811849C
	strb r4, [r5, 0xF]
	strb r4, [r5, 0x14]
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, 0
	movs r1, 0
	bl CreateWirelessStatusIndicatorSprite
	ldr r0, [r5]
	adds r4, r0, 0
	adds r4, 0x10
	adds r0, 0x2
	bl sub_8118658
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80FBF54
	movs r0, 0x67
	bl PlaySE
	movs r0, 0x4
	strb r0, [r5, 0x8]
	b _081184BC
_0811849C:
	movs r0, 0x16
	bl PlaySE
	movs r0, 0xA
	strb r0, [r5, 0x8]
	b _081184BC
_081184A8:
	ldr r0, _081184C4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081184BC
	movs r1, 0
	movs r0, 0x6
	strb r0, [r5, 0x8]
	strb r1, [r5, 0x14]
_081184BC:
	ldrb r0, [r5, 0x14]
	adds r0, 0x1
	strb r0, [r5, 0x14]
	b _08118604
	.align 2, 0
_081184C4: .4byte gMain
_081184C8:
	ldr r0, _081184FC @ =gUnknown_845928C
	bl AddTextPrinterToWindow1
	ldr r4, _08118500 @ =gStringVar1
	ldrb r0, [r5, 0xF]
	lsls r0, 5
	ldr r1, [r5]
	adds r1, r0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldr r1, [r5]
	ldrb r0, [r5, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	movs r0, 0x5
	strb r0, [r5, 0x8]
	b _08118604
	.align 2, 0
_081184FC: .4byte gUnknown_845928C
_08118500: .4byte gStringVar1
_08118504:
	ldr r0, _0811853C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08118522
	ldr r2, _08118540 @ =gUnknown_203B058
	ldr r1, [r5]
	ldrb r0, [r5, 0xF]
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 25
	lsrs r0, 25
	strb r0, [r2]
	movs r0, 0xC
	strb r0, [r5, 0x8]
_08118522:
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	beq _0811854E
	cmp r0, 0x5
	bgt _08118544
	cmp r0, 0x2
	bgt _08118604
	cmp r0, 0x1
	blt _08118604
	b _08118548
	.align 2, 0
_0811853C: .4byte gReceivedRemoteLinkPlayers
_08118540: .4byte gUnknown_203B058
_08118544:
	cmp r0, 0x6
	bne _08118604
_08118548:
	movs r0, 0x8
	strb r0, [r5, 0x8]
	b _08118604
_0811854E:
	ldr r0, _08118560 @ =gUnknown_845777C
	bl AddTextPrinterToWindow1
	movs r0, 0
	movs r1, 0
	bl sub_80FB9E4
	b _08118604
	.align 2, 0
_08118560: .4byte gUnknown_845777C
_08118564:
	ldrb r0, [r5, 0x13]
	cmp r0, 0
	beq _08118580
	ldrb r0, [r5, 0xE]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r5, 0xB]
	bl RemoveWindow
_08118580:
	ldrb r0, [r5, 0x11]
	bl DestroyTask
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, 0x4]
	bl Free
	ldrb r0, [r5, 0x8]
	adds r0, 0x1
	strb r0, [r5, 0x8]
	b _08118604
_0811859A:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _081185A4 @ =gUnknown_84577BC
	b _081185C2
	.align 2, 0
_081185A4: .4byte gUnknown_84577BC
_081185A8:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _081185B0 @ =gUnknown_84571E0
	b _081185C2
	.align 2, 0
_081185B0: .4byte gUnknown_84571E0
_081185B4:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r2, _081185E0 @ =gUnknown_845933C
	ldrb r1, [r5, 0x12]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
_081185C2:
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, 0
	beq _08118604
	bl DestroyWirelessStatusIndicatorSprite
	adds r0, r4, 0
	bl DestroyTask
	bl sub_80F8DC0
	ldr r1, _081185E4 @ =gSpecialVar_Result
	movs r0, 0x5
	strh r0, [r1]
	b _08118604
	.align 2, 0
_081185E0: .4byte gUnknown_845933C
_081185E4: .4byte gSpecialVar_Result
_081185E8:
	ldrb r0, [r5, 0x8]
	adds r0, 0x1
	strb r0, [r5, 0x8]
	bl sub_800AB9C
	b _08118604
_081185F4:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _08118604
	adds r0, r4, 0
	bl DestroyTask
_08118604:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81182DC

	thumb_func_start UnionRoomSpecial
UnionRoomSpecial: @ 811860C
	push {r4,lr}
	bl sub_80FAF34
	ldr r0, _08118648 @ =sub_81186E0
	movs r1, 0xA
	bl CreateTask
	ldr r4, _0811864C @ =gUnknown_203B05C
	movs r0, 0x96
	lsls r0, 2
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _08118650 @ =gUnknown_300202C
	str r0, [r1]
	movs r1, 0
	strb r1, [r0, 0x14]
	strb r1, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x12]
	ldr r0, _08118654 @ =gSpecialVar_Result
	strh r1, [r0]
	movs r0, 0xD0
	movs r1, 0x1
	bl sub_8107D38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08118648: .4byte sub_81186E0
_0811864C: .4byte gUnknown_203B05C
_08118650: .4byte gUnknown_300202C
_08118654: .4byte gSpecialVar_Result
	thumb_func_end UnionRoomSpecial

	thumb_func_start sub_8118658
sub_8118658: @ 8118658
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	bx lr
	thumb_func_end sub_8118658

	thumb_func_start sub_8118664
sub_8118664: @ 8118664
	push {lr}
	adds r3, r1, 0
	ldr r1, _08118684 @ =gUnknown_203B05C
	ldr r2, [r1]
	movs r1, 0x8
	strb r1, [r2, 0x14]
	strb r0, [r2, 0x15]
	ldr r0, _08118688 @ =gStringVar4
	cmp r3, r0
	beq _0811867E
	adds r1, r3, 0
	bl StringExpandPlaceholders
_0811867E:
	pop {r0}
	bx r0
	.align 2, 0
_08118684: .4byte gUnknown_203B05C
_08118688: .4byte gStringVar4
	thumb_func_end sub_8118664

	thumb_func_start sub_811868C
sub_811868C: @ 811868C
	push {lr}
	adds r2, r0, 0
	ldr r0, _081186A8 @ =gUnknown_203B05C
	ldr r1, [r0]
	movs r0, 0x1A
	strb r0, [r1, 0x14]
	ldr r0, _081186AC @ =gStringVar4
	cmp r2, r0
	beq _081186A4
	adds r1, r2, 0
	bl StringExpandPlaceholders
_081186A4:
	pop {r0}
	bx r0
	.align 2, 0
_081186A8: .4byte gUnknown_203B05C
_081186AC: .4byte gStringVar4
	thumb_func_end sub_811868C

	thumb_func_start sub_81186B0
sub_81186B0: @ 81186B0
	push {lr}
	ldr r3, _081186C4 @ =gDecompressionBuffer + 0x3F00
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r3, 0
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_081186C4: .4byte gDecompressionBuffer + 0x3F00
	thumb_func_end sub_81186B0

	thumb_func_start sub_81186C8
sub_81186C8: @ 81186C8
	push {lr}
	ldr r0, [r0]
	ldr r1, _081186DC @ =gDecompressionBuffer + 0x3F00
	movs r2, 0x80
	lsls r2, 1
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_081186DC: .4byte gDecompressionBuffer + 0x3F00
	thumb_func_end sub_81186C8

	thumb_func_start sub_81186E0
sub_81186E0: @ 81186E0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r0, _08118710 @ =gUnknown_203B05C
	ldr r6, [r0]
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08118714 @ =gTasks+0x8
	adds r7, r0, r1
	ldrb r0, [r6, 0x14]
	cmp r0, 0x38
	bls _08118706
	bl _081198DC
_08118706:
	lsls r0, 2
	ldr r1, _08118718 @ =_0811871C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08118710: .4byte gUnknown_203B05C
_08118714: .4byte gTasks+0x8
_08118718: .4byte _0811871C
	.align 2, 0
_0811871C:
	.4byte _08118800
	.4byte _08118858
	.4byte _0811887C
	.4byte _081188CC
	.4byte _081189AA
	.4byte _08118E60
	.4byte _08118C58
	.4byte _08118E60
	.4byte _081198C8
	.4byte _081191D4
	.4byte _081192E0
	.4byte _081190B0
	.4byte _081190CA
	.4byte _08119330
	.4byte _08119354
	.4byte _0811935C
	.4byte _0811936C
	.4byte _0811939A
	.4byte _081193AE
	.4byte _08118F36
	.4byte _08118FBC
	.4byte _08118FDA
	.4byte _0811904E
	.4byte _08118ADE
	.4byte _08118B04
	.4byte _08118B7C
	.4byte _0811989C
	.4byte _08118D50
	.4byte _08118D38
	.4byte _08118DD4
	.4byte _08118C2E
	.4byte _08118DAA
	.4byte _08118DA0
	.4byte _08119164
	.4byte _08119184
	.4byte _081191C4
	.4byte _081192E8
	.4byte _08119324
	.4byte _08118BF8
	.4byte _0811910C
	.4byte _08118E98
	.4byte _08118EC8
	.4byte _081193D8
	.4byte _08119468
	.4byte _081195B8
	.4byte _08119620
	.4byte _0811963C
	.4byte _08119484
	.4byte _08119644
	.4byte _08119784
	.4byte _081197B8
	.4byte _08119840
	.4byte _0811953C
	.4byte _081194F0
	.4byte _08119504
	.4byte _0811959C
	.4byte _081195EC
_08118800:
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r6, 0x4]
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r6, 0xC]
	movs r0, 0x80
	lsls r0, 1
	bl AllocZeroed
	str r0, [r6]
	movs r0, 0x20
	bl AllocZeroed
	str r0, [r6, 0x8]
	ldr r0, [r6]
	movs r1, 0x8
	bl sub_811A5E4
	ldr r1, _08118854 @ =gUnknown_203B058
	movs r0, 0x40
	strb r0, [r1]
	ldr r0, [r6, 0xC]
	ldr r1, [r6, 0x4]
	movs r2, 0x9
	bl sub_8119E84
	adds r1, r6, 0
	adds r1, 0x20
	strb r0, [r1]
	adds r0, r6, 0
	adds r0, 0x8C
	bl sub_811B754
	bl sub_811BB68
	movs r0, 0x1
	bl _081198DA
	.align 2, 0
_08118854: .4byte gUnknown_203B058
_08118858:
	adds r0, r6, 0
	adds r0, 0x21
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl sub_811BAAC
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	beq _08118876
	bl _081198DC
_08118876:
	movs r0, 0x2
	bl _081198DA
_0811887C:
	movs r0, 0x40
	movs r1, 0
	movs r2, 0
	bl sub_80FAF58
	ldr r2, _081188C4 @ =gUnknown_203B06C
	ldrh r0, [r2, 0x2]
	ldrh r1, [r2, 0xA]
	ldrh r2, [r2, 0xC]
	bl sub_80FAFA0
	bl sub_800B1F4
	bl OpenLink
	bl sub_80FBC00
	ldr r0, [r6, 0x8]
	movs r1, 0x1
	bl sub_811A5E4
	ldr r0, [r6, 0x4]
	movs r1, 0x4
	bl sub_811A650
	ldr r0, [r6, 0xC]
	movs r1, 0x4
	bl sub_811A650
	ldr r1, _081188C8 @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x3
	bl _081198DA
	.align 2, 0
_081188C4: .4byte gUnknown_203B06C
_081188C8: .4byte gSpecialVar_Result
_081188CC:
	bl GetPartyMenuType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	beq _081188E4
	bl GetPartyMenuType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bne _081189A4
_081188E4:
	ldr r4, _08118900 @ =gUnknown_203B06C
	ldrh r0, [r4]
	cmp r0, 0
	beq _081189A4
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _08118904
	cmp r0, 0x2
	beq _08118954
	b _08118992
	.align 2, 0
_08118900: .4byte gUnknown_203B06C
_08118904:
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	cmp r5, 0x5
	bls _08118930
	adds r0, r4, 0
	bl sub_811B148
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80FAFA0
	ldr r0, _0811892C @ =gUnknown_8458D54
	bl sub_811868C
	b _08118992
	.align 2, 0
_0811892C: .4byte gUnknown_8458D54
_08118930:
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_811B16C
	cmp r0, 0
	bne _08118950
	ldr r1, _0811894C @ =gUnknown_8458CD4
	movs r0, 0x34
	bl sub_8118664
	b _08118992
	.align 2, 0
_0811894C: .4byte gUnknown_8458CD4
_08118950:
	movs r0, 0x37
	b _08118990
_08118954:
	adds r0, r6, 0
	bl sub_81186C8
	ldrb r0, [r4, 0x8]
	strh r0, [r7, 0x2]
	cmp r5, 0x5
	bls _08118970
	ldr r0, _0811896C @ =gUnknown_8458D9C
	bl sub_811868C
	b _08118992
	.align 2, 0
_0811896C: .4byte gUnknown_8458D9C
_08118970:
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	ldr r1, _0811899C @ =gUnknown_203B058
	movs r0, 0x44
	strb r0, [r1]
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_811B1B4
	movs r0, 0x33
_08118990:
	strb r0, [r6, 0x14]
_08118992:
	ldr r1, _081189A0 @ =gUnknown_203B06C
	movs r0, 0
	strh r0, [r1]
	bl _081198DC
	.align 2, 0
_0811899C: .4byte gUnknown_203B058
_081189A0: .4byte gUnknown_203B06C
_081189A4:
	movs r0, 0x4
	bl _081198DA
_081189AA:
	ldr r4, _081189D8 @ =gSpecialVar_Result
	ldrh r0, [r4]
	cmp r0, 0
	beq _08118A0E
	cmp r0, 0x9
	bne _081189E4
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	movs r0, 0x2
	bl PlaySE
	ldr r0, _081189DC @ =gStringVar1
	ldr r1, _081189E0 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	movs r1, 0
	movs r0, 0x2A
	b _08118A06
	.align 2, 0
_081189D8: .4byte gSpecialVar_Result
_081189DC: .4byte gStringVar1
_081189E0: .4byte gSaveBlock2Ptr
_081189E4:
	cmp r0, 0xB
	bne _081189F8
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	movs r1, 0
	movs r0, 0x17
	b _08118A06
_081189F8:
	movs r0, 0
	strh r0, [r7]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r7, 0x2]
	movs r1, 0
	movs r0, 0x18
_08118A06:
	strb r0, [r6, 0x14]
	strh r1, [r4]
	bl _081198DC
_08118A0E:
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08118A1E
	bl _081198DC
_08118A1E:
	ldr r0, _08118A4C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08118A84
	ldr r0, [r6]
	adds r2, r7, 0x2
	adds r3, r6, 0
	adds r3, 0x21
	adds r1, r7, 0
	bl sub_811BF00
	cmp r0, 0
	beq _08118A50
	movs r0, 0x5
	bl PlaySE
	bl sub_811B298
	movs r0, 0x18
	bl _081198DA
	.align 2, 0
_08118A4C: .4byte gMain
_08118A50:
	bl sub_811A9B8
	cmp r0, 0
	beq _08118A84
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	movs r0, 0x2
	bl PlaySE
	bl sub_811B298
	ldr r0, _08118A7C @ =gStringVar1
	ldr r1, _08118A80 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x2D
	bl _081198DA
	.align 2, 0
_08118A7C: .4byte gStringVar1
_08118A80: .4byte gSaveBlock2Ptr
_08118A84:
	bl sub_8119B94
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08118AA6
	cmp r0, 0x2
	bgt _08118A9A
	cmp r0, 0x1
	beq _08118AA0
	b _08118AD4
_08118A9A:
	cmp r0, 0x4
	beq _08118AAE
	b _08118AD4
_08118AA0:
	movs r0, 0x37
	bl PlaySE
_08118AA6:
	adds r0, r6, 0
	bl sub_811BECC
	b _08118AD4
_08118AAE:
	movs r0, 0xB
	strb r0, [r6, 0x14]
	bl sub_811B298
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80FAFA0
	adds r0, r6, 0
	bl sub_811B2D8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x53
	movs r2, 0
	bl sub_80FB008
_08118AD4:
	adds r0, r6, 0
	bl sub_811BEDC
	bl _081198DC
_08118ADE:
	ldr r0, _08118B00 @ =Task_StartMenuHandleInput
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08118AEE
	bl _081198DC
_08118AEE:
	movs r0, 0x40
	movs r1, 0
	movs r2, 0
	bl sub_80FB008
	movs r0, 0x4
	bl _081198DA
	.align 2, 0
_08118B00: .4byte Task_StartMenuHandleInput
_08118B04:
	bl sub_811A0E0
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	bl sub_811ADC4
	adds r4, r0, 0
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	ldr r0, [r6]
	ldrb r1, [r7]
	ldrb r2, [r7, 0x2]
	adds r3, r4, 0
	bl sub_811AA5C
	cmp r0, 0x1
	beq _08118B48
	cmp r0, 0x1
	bgt _08118B3A
	cmp r0, 0
	beq _08118B42
	bl _081198DC
_08118B3A:
	cmp r0, 0x2
	beq _08118B6C
	bl _081198DC
_08118B42:
	movs r0, 0x1A
	bl _081198DA
_08118B48:
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	lsls r0, 5
	ldr r1, [r6]
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0x10
	ldr r2, _08118B68 @ =gUnknown_203B058
	ldrb r2, [r2]
	bl sub_80FC114
	strh r5, [r6, 0x12]
	movs r0, 0x19
	bl _081198DA
	.align 2, 0
_08118B68: .4byte gUnknown_203B058
_08118B6C:
	ldr r1, _08118B78 @ =gStringVar4
	movs r0, 0x13
	bl sub_8118664
	bl _081198DC
	.align 2, 0
_08118B78: .4byte gStringVar4
_08118B7C:
	bl sub_811A0E0
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	blt _08118BC2
	cmp r4, 0x2
	ble _08118B9E
	cmp r4, 0x4
	bne _08118BC2
	movs r0, 0x1
	bl sub_811B258
	strb r4, [r6, 0x14]
	b _08118BC2
_08118B9E:
	bl sub_80FBB0C
	cmp r0, 0x1
	bne _08118BB4
	ldr r0, _08118BB0 @ =gUnknown_8457F90
	bl sub_811868C
	b _08118BBC
	.align 2, 0
_08118BB0: .4byte gUnknown_8457F90
_08118BB4:
	ldr r1, _08118BE4 @ =gUnknown_8457F90
	movs r0, 0x1E
	bl sub_8118664
_08118BBC:
	ldr r1, _08118BE8 @ =gUnknown_203B058
	movs r0, 0x40
	strb r0, [r1]
_08118BC2:
	ldr r0, _08118BEC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08118BCE
	bl _081198DC
_08118BCE:
	ldr r0, _08118BF0 @ =gBlockSendBuffer
	movs r1, 0x1
	bl sub_8117594
	ldr r0, _08118BF4 @ =sub_8117280
	movs r1, 0x5
	bl CreateTask
	movs r0, 0x26
	bl _081198DA
	.align 2, 0
_08118BE4: .4byte gUnknown_8457F90
_08118BE8: .4byte gUnknown_203B058
_08118BEC: .4byte gReceivedRemoteLinkPlayers
_08118BF0: .4byte gBlockSendBuffer
_08118BF4: .4byte sub_8117280
_08118BF8:
	ldr r0, _08118C1C @ =sub_8117280
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08118C08
	bl _081198DC
_08118C08:
	ldr r0, _08118C20 @ =gUnknown_203B058
	ldrb r0, [r0]
	cmp r0, 0x44
	bne _08118C28
	ldr r1, _08118C24 @ =gUnknown_84578BC
	movs r0, 0x1F
	bl sub_8118664
	bl _081198DC
	.align 2, 0
_08118C1C: .4byte sub_8117280
_08118C20: .4byte gUnknown_203B058
_08118C24: .4byte gUnknown_84578BC
_08118C28:
	movs r0, 0x5
	bl _081198DA
_08118C2E:
	ldr r0, _08118C54 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08118C3A
	bl _081198DC
_08118C3A:
	movs r0, 0
	bl sub_811B258
	movs r2, 0
	ldrsh r0, [r7, r2]
	movs r3, 0x2
	ldrsh r1, [r7, r3]
	ldr r2, [r6]
	bl sub_811C028
	movs r0, 0x2
	bl _081198DA
	.align 2, 0
_08118C54: .4byte gReceivedRemoteLinkPlayers
_08118C58:
	adds r0, r6, 0
	adds r0, 0x16
	adds r1, r6, 0
	adds r1, 0x1B
	adds r2, r6, 0
	adds r2, 0x1C
	ldr r3, _08118C8C @ =gUnknown_8456DF4
	ldr r4, _08118C90 @ =gUnknown_8456E1C
	str r4, [sp]
	bl sub_811A218
	adds r5, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _08118C7C
	bl _081198DC
_08118C7C:
	ldr r0, _08118C94 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08118C98
	movs r0, 0x1C
	bl _081198DA
	.align 2, 0
_08118C8C: .4byte gUnknown_8456DF4
_08118C90: .4byte gUnknown_8456E1C
_08118C94: .4byte gReceivedRemoteLinkPlayers
_08118C98:
	adds r1, r6, 0
	adds r1, 0x84
	movs r0, 0
	strh r0, [r1]
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	ldr r1, [r6]
	bl sub_811ADC4
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _08118CB6
	cmp r5, 0x40
	bne _08118CE8
_08118CB6:
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0x40
	strh r1, [r0]
	bl sub_80F9E2C
	ldr r0, _08118CDC @ =gStringVar4
	ldr r2, _08118CE0 @ =gUnknown_845842C
	ldr r1, _08118CE4 @ =gLinkPlayers
	ldrb r1, [r1, 0x13]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x20
	bl _081198DA
	.align 2, 0
_08118CDC: .4byte gStringVar4
_08118CE0: .4byte gUnknown_845842C
_08118CE4: .4byte gLinkPlayers
_08118CE8:
	ldr r0, _08118D10 @ =gUnknown_203B058
	strb r5, [r0]
	ldr r1, _08118D14 @ =gUnknown_203B059
	lsrs r0, r5, 8
	strb r0, [r1]
	lsls r0, r5, 24
	lsrs r0, 24
	cmp r0, 0x41
	bne _08118D1C
	bl sub_811B0F0
	cmp r0, 0
	bne _08118D1C
	ldr r1, _08118D18 @ =gUnknown_845847C
	movs r0, 0x5
	bl sub_8118664
	bl _081198DC
	.align 2, 0
_08118D10: .4byte gUnknown_203B058
_08118D14: .4byte gUnknown_203B059
_08118D18: .4byte gUnknown_845847C
_08118D1C:
	ldr r0, _08118D34 @ =gUnknown_203B058
	ldrb r0, [r0]
	movs r1, 0x40
	orrs r1, r0
	adds r0, r6, 0
	adds r0, 0x4C
	strh r1, [r0]
	bl sub_80F9E2C
	movs r0, 0x1B
	bl _081198DA
	.align 2, 0
_08118D34: .4byte gUnknown_203B058
_08118D38:
	ldr r0, _08118D48 @ =gStringVar4
	ldr r1, _08118D4C @ =gUnknown_8458434
	bl StringCopy
	movs r0, 0x24
	bl _081198DA
	.align 2, 0
_08118D48: .4byte gStringVar4
_08118D4C: .4byte gUnknown_8458434
_08118D50:
	adds r0, r6, 0
	bl sub_811B0A4
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	bl sub_811ADC4
	adds r4, r0, 0
	adds r0, r6, 0
	adds r0, 0x4C
	ldrh r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	bl sub_811A9FC
	adds r5, r0, 0
	adds r0, r6, 0
	adds r0, 0x16
	ldr r3, _08118D9C @ =gUnknown_84580F4
	lsls r1, r5, 2
	lsls r2, r4, 4
	adds r1, r2
	adds r1, r3
	ldr r1, [r1]
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _08118D90
	bl _081198DC
_08118D90:
	movs r0, 0
	strh r0, [r7, 0x6]
	movs r0, 0x1D
	bl _081198DA
	.align 2, 0
_08118D9C: .4byte gUnknown_84580F4
_08118DA0:
	bl sub_800AAC0
	movs r0, 0x24
	bl _081198DA
_08118DAA:
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0x44
	strh r1, [r0]
	ldr r2, _08118DD0 @ =gUnknown_203B06C
	ldrh r1, [r2, 0xE]
	adds r3, r6, 0
	adds r3, 0x4E
	strh r1, [r3]
	ldrh r2, [r2, 0x10]
	adds r1, r6, 0
	adds r1, 0x50
	strh r2, [r1]
	bl sub_80F9E2C
	movs r0, 0x1D
	bl _081198DA
	.align 2, 0
_08118DD0: .4byte gUnknown_203B06C
_08118DD4:
	ldr r0, _08118DEC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08118DF8
	ldr r0, _08118DF0 @ =gStringVar4
	ldr r1, _08118DF4 @ =gUnknown_8458434
	bl StringCopy
	movs r0, 0x1C
	bl _081198DA
	.align 2, 0
_08118DEC: .4byte gReceivedRemoteLinkPlayers
_08118DF0: .4byte gStringVar4
_08118DF4: .4byte gUnknown_8458434
_08118DF8:
	adds r0, r6, 0
	bl sub_811B0A4
	adds r0, r6, 0
	adds r0, 0x84
	ldrh r0, [r0]
	cmp r0, 0x51
	bne _08118E2E
	ldr r0, _08118E20 @ =gUnknown_203B058
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08118E28
	ldr r0, _08118E24 @ =gStringVar4
	adds r1, r6, 0
	movs r2, 0
	bl sub_811B31C
	movs r0, 0x28
	bl _081198DA
	.align 2, 0
_08118E20: .4byte gUnknown_203B058
_08118E24: .4byte gStringVar4
_08118E28:
	movs r0, 0xD
	bl _081198DA
_08118E2E:
	cmp r0, 0x52
	beq _08118E36
	bl _081198DC
_08118E36:
	movs r5, 0
	movs r0, 0x20
	strb r0, [r6, 0x14]
	ldr r0, _08118E54 @ =gStringVar4
	ldr r4, _08118E58 @ =gUnknown_203B058
	ldrb r2, [r4]
	movs r1, 0x40
	orrs r1, r2
	ldr r2, _08118E5C @ =gLinkPlayers
	ldrb r2, [r2, 0x13]
	bl sub_811AE68
	strb r5, [r4]
	bl _081198DC
	.align 2, 0
_08118E54: .4byte gStringVar4
_08118E58: .4byte gUnknown_203B058
_08118E5C: .4byte gLinkPlayers
_08118E60:
	movs r0, 0x2
	ldrsh r1, [r7, r0]
	lsls r1, 5
	ldr r0, [r6]
	adds r0, r1
	bl sub_811AA24
	adds r5, r0, 0
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	ldr r1, [r6]
	bl sub_811ADC4
	adds r4, r0, 0
	ldr r2, _08118E94 @ =gUnknown_8457B04
	lsls r0, r4, 2
	lsls r1, r5, 3
	adds r0, r1
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0x6
	bl sub_8118664
	bl _081198DC
	.align 2, 0
_08118E94: .4byte gUnknown_8457B04
_08118E98:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, _08118EC4 @ =gStringVar4
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _08118EAC
	bl _081198DC
_08118EAC:
	movs r4, 0
	movs r0, 0x29
	strb r0, [r6, 0x14]
	bl sub_800AB9C
	adds r0, r6, 0
	adds r0, 0x84
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	bl _081198DC
	.align 2, 0
_08118EC4: .4byte gStringVar4
_08118EC8:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _08118ED6
	bl _081198DC
_08118ED6:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _08118F30
	ldr r5, _08118F20 @ =gStringVar1
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r4, _08118F24 @ =gLinkPlayers + 8
	adds r1, r4
	adds r0, r5, 0
	bl StringCopy
	ldrh r0, [r4, 0x18]
	adds r4, 0x1C
	adds r1, r4, 0
	bl sub_80FD338
	adds r5, r0, 0
	ldr r0, _08118F28 @ =gStringVar4
	ldr r2, _08118F2C @ =gUnknown_8457C20
	lsls r1, r5, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	movs r0, 0x21
	bl _081198DA
	.align 2, 0
_08118F20: .4byte gStringVar1
_08118F24: .4byte gLinkPlayers + 8
_08118F28: .4byte gStringVar4
_08118F2C: .4byte gUnknown_8457C20
_08118F30:
	movs r0, 0x7
	bl _081198DA
_08118F36:
	adds r0, r6, 0
	adds r0, 0x16
	movs r1, 0
	bl sub_811A14C
	lsls r0, 24
	asrs r5, r0, 24
	cmp r5, 0
	beq _08118F60
	cmp r5, 0
	bgt _08118F58
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _08118F9C
	bl _081198DC
_08118F58:
	cmp r5, 0x1
	beq _08118F9C
	bl _081198DC
_08118F60:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	ldr r4, _08118F98 @ =gUnknown_203B058
	movs r0, 0x45
	strb r0, [r4]
	movs r0, 0x45
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	lsls r0, 5
	ldr r1, [r6]
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0x10
	ldrb r2, [r4]
	bl sub_80FC114
	ldrh r0, [r7, 0x2]
	strh r0, [r6, 0x12]
	movs r0, 0x14
	strb r0, [r6, 0x14]
	strh r5, [r7, 0x6]
	bl _081198DC
	.align 2, 0
_08118F98: .4byte gUnknown_203B058
_08118F9C:
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	ldr r1, [r6]
	bl sub_811ADC4
	adds r4, r0, 0
	ldr r1, _08118FB8 @ =gUnknown_8458548
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	bl sub_811868C
	bl _081198DC
	.align 2, 0
_08118FB8: .4byte gUnknown_8458548
_08118FBC:
	ldrh r0, [r7, 0x4]
	adds r0, 0x1
	strh r0, [r7, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	bgt _08118FCE
	bl _081198DC
_08118FCE:
	movs r1, 0
	movs r0, 0x15
	strb r0, [r6, 0x14]
	strh r1, [r7, 0x4]
	bl _081198DC
_08118FDA:
	bl sub_80FB9F4
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	beq _08119040
	cmp r4, 0x3
	ble _08118FF8
	cmp r4, 0x4
	bne _08119044
	movs r0, 0x1
	bl sub_811B258
	strb r4, [r6, 0x14]
	b _08119044
_08118FF8:
	cmp r4, 0x1
	blt _08119044
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	ldr r1, [r6]
	bl sub_811ADC4
	adds r4, r0, 0
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	bl sub_80FBB0C
	cmp r0, 0x1
	bne _0811902C
	ldr r0, _08119028 @ =gUnknown_84585E8
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_811868C
	b _08119044
	.align 2, 0
_08119028: .4byte gUnknown_84585E8
_0811902C:
	ldr r0, _0811903C @ =gUnknown_84585E8
	lsls r1, r4, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x1E
	bl sub_8118664
	b _08119044
	.align 2, 0
_0811903C: .4byte gUnknown_84585E8
_08119040:
	movs r0, 0x16
	strb r0, [r6, 0x14]
_08119044:
	ldrh r0, [r7, 0x6]
	adds r0, 0x1
	strh r0, [r7, 0x6]
	bl _081198DC
_0811904E:
	bl sub_80FBA00
	cmp r0, 0
	beq _08119096
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	ldr r1, [r6]
	bl sub_811ADC4
	adds r4, r0, 0
	movs r0, 0x54
	movs r1, 0
	movs r2, 0x1
	bl sub_80FB008
	bl sub_80FBB0C
	cmp r0, 0x1
	bne _08119088
	ldr r0, _08119084 @ =gUnknown_84585E8
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_811868C
	b _08119096
	.align 2, 0
_08119084: .4byte gUnknown_84585E8
_08119088:
	ldr r0, _081190A8 @ =gUnknown_84585E8
	lsls r1, r4, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x1E
	bl sub_8118664
_08119096:
	ldr r0, _081190AC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _081190A2
	bl _081198DC
_081190A2:
	movs r0, 0x10
	bl _081198DA
	.align 2, 0
_081190A8: .4byte gUnknown_84585E8
_081190AC: .4byte gReceivedRemoteLinkPlayers
_081190B0:
	movs r0, 0x42
	bl PlaySE
	bl sub_80F8FA0
	movs r0, 0
	movs r1, 0xC
	strb r1, [r6, 0x14]
	adds r1, r6, 0
	adds r1, 0x86
	strh r0, [r1]
	bl _081198DC
_081190CA:
	bl sub_80FBA00
	cmp r0, 0
	beq _081190DE
	movs r0, 0
	bl sub_811B258
	movs r0, 0x2
	bl _081198DA
_081190DE:
	ldr r0, _08119100 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _081190EA
	bl _081198DC
_081190EA:
	ldr r0, _08119104 @ =gBlockSendBuffer
	movs r1, 0x1
	bl sub_8117594
	ldr r0, _08119108 @ =sub_8117280
	movs r1, 0x5
	bl CreateTask
	movs r0, 0x27
	bl _081198DA
	.align 2, 0
_08119100: .4byte gReceivedRemoteLinkPlayers
_08119104: .4byte gBlockSendBuffer
_08119108: .4byte sub_8117280
_0811910C:
	adds r0, r6, 0
	bl sub_8119904
	ldr r0, _08119150 @ =sub_8117280
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08119122
	bl _081198DC
_08119122:
	movs r0, 0x21
	strb r0, [r6, 0x14]
	ldr r0, _08119154 @ =gStringVar1
	ldr r4, _08119158 @ =gLinkPlayers + 0x24
	adds r1, r4, 0
	bl StringCopy
	adds r0, r4, 0
	subs r0, 0x24
	ldrh r0, [r0, 0x20]
	adds r1, r4, 0
	bl sub_80FD338
	adds r5, r0, 0
	ldr r0, _0811915C @ =gStringVar4
	ldr r2, _08119160 @ =gUnknown_8457BCC
	lsls r1, r5, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	b _081198DC
	.align 2, 0
_08119150: .4byte sub_8117280
_08119154: .4byte gStringVar1
_08119158: .4byte gLinkPlayers + 0x24
_0811915C: .4byte gStringVar4
_08119160: .4byte gUnknown_8457BCC
_08119164:
	adds r0, r6, 0
	bl sub_8119904
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, _08119180 @ =gStringVar4
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _0811917C
	b _081198DC
_0811917C:
	movs r0, 0x22
	b _081198DA
	.align 2, 0
_08119180: .4byte gStringVar4
_08119184:
	adds r0, r6, 0
	bl sub_8119904
	adds r0, r6, 0
	bl sub_8119944
	cmp r0, 0
	bne _08119196
	b _081198DC
_08119196:
	ldr r0, _081191B8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _081191A4
	b _081198DC
_081191A4:
	movs r0, 0x1
	bl sub_80FBD6C
	ldr r0, _081191BC @ =gStringVar4
	ldr r1, _081191C0 @ =gUnknown_8457E60
	bl StringCopy
	movs r0, 0x24
	b _081198DA
	.align 2, 0
_081191B8: .4byte gMain
_081191BC: .4byte gStringVar4
_081191C0: .4byte gUnknown_8457E60
_081191C4:
	ldr r1, _081191D0 @ =gStringVar4
	movs r0, 0x9
	bl sub_8118664
	b _081198DC
	.align 2, 0
_081191D0: .4byte gStringVar4
_081191D4:
	adds r0, r6, 0
	adds r0, 0x16
	movs r1, 0
	bl sub_811A14C
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _081191FA
	cmp r1, 0
	bgt _081191F4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _081192BA
	b _081198DC
_081191F4:
	cmp r1, 0x1
	beq _081192BA
	b _081198DC
_081191FA:
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0x51
	strh r1, [r0]
	ldr r1, _08119228 @ =gUnknown_203B058
	ldrb r1, [r1]
	adds r5, r0, 0
	cmp r1, 0x45
	bne _0811922C
	movs r4, 0x40
	orrs r4, r1
	movs r0, 0x1
	bl sub_811B2A8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0
	bl sub_80FB008
	b _0811924A
	.align 2, 0
_08119228: .4byte gUnknown_203B058
_0811922C:
	movs r0, 0x40
	adds r4, r1, 0
	orrs r4, r0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_811B2A8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_80FB008
_0811924A:
	ldr r1, [r6, 0x8]
	movs r0, 0
	strb r0, [r1, 0x1B]
	strh r0, [r7, 0x6]
	ldr r0, _0811927C @ =gUnknown_203B058
	ldrb r0, [r0]
	cmp r0, 0x41
	bne _08119292
	bl sub_811B0F0
	cmp r0, 0
	bne _08119288
	movs r0, 0x52
	strh r0, [r5]
	adds r0, r5, 0
	bl sub_80F9E2C
	movs r0, 0xA
	strb r0, [r6, 0x14]
	ldr r0, _08119280 @ =gStringVar4
	ldr r1, _08119284 @ =gUnknown_84584C0
	bl StringCopy
	b _081198DC
	.align 2, 0
_0811927C: .4byte gUnknown_203B058
_08119280: .4byte gStringVar4
_08119284: .4byte gUnknown_84584C0
_08119288:
	adds r0, r5, 0
	bl sub_80F9E2C
	movs r0, 0xD
	b _081198DA
_08119292:
	cmp r0, 0x48
	bne _081192B0
	adds r0, r5, 0
	bl sub_80F9E2C
	ldr r0, _081192AC @ =gStringVar4
	adds r1, r6, 0
	movs r2, 0x1
	bl sub_811B31C
	movs r0, 0x28
	b _081198DA
	.align 2, 0
_081192AC: .4byte gStringVar4
_081192B0:
	adds r0, r5, 0
	bl sub_80F9E2C
	movs r0, 0xD
	b _081198DA
_081192BA:
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0x52
	strh r1, [r0]
	bl sub_80F9E2C
	movs r0, 0xA
	strb r0, [r6, 0x14]
	ldr r0, _081192D8 @ =gStringVar4
	ldr r1, _081192DC @ =gUnknown_203B058
	ldrb r1, [r1]
	bl sub_81162E0
	b _081198DC
	.align 2, 0
_081192D8: .4byte gStringVar4
_081192DC: .4byte gUnknown_203B058
_081192E0:
	bl sub_800AAC0
	movs r0, 0x24
	b _081198DA
_081192E8:
	ldr r0, _08119318 @ =gReceivedRemoteLinkPlayers
	ldrb r4, [r0]
	cmp r4, 0
	beq _081192F2
	b _081198DC
_081192F2:
	ldr r1, _0811931C @ =gUnknown_203B058
	movs r0, 0x40
	strb r0, [r1]
	ldr r1, _08119320 @ =gStringVar4
	movs r0, 0x25
	bl sub_8118664
	adds r0, r6, 0
	adds r0, 0x4C
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r6, 0
	adds r0, 0x86
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	b _081198DC
	.align 2, 0
_08119318: .4byte gReceivedRemoteLinkPlayers
_0811931C: .4byte gUnknown_203B058
_08119320: .4byte gStringVar4
_08119324:
	movs r0, 0x2
	strb r0, [r6, 0x14]
	movs r0, 0
	bl sub_811B258
	b _081198DC
_08119330:
	ldr r4, _0811934C @ =gStringVar4
	ldr r0, _08119350 @ =gUnknown_203B058
	ldrb r0, [r0]
	movs r1, 0x40
	orrs r1, r0
	adds r0, r4, 0
	bl sub_811AECC
	movs r0, 0xE
	adds r1, r4, 0
	bl sub_8118664
	b _081198DC
	.align 2, 0
_0811934C: .4byte gStringVar4
_08119350: .4byte gUnknown_203B058
_08119354:
	bl sub_800AB9C
	movs r0, 0xF
	b _081198DA
_0811935C:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	bne _08119368
	b _081198DC
_08119368:
	movs r0, 0x10
	b _081198DA
_0811936C:
	ldr r0, [r6, 0x8]
	bl Free
	ldr r0, [r6]
	bl Free
	ldr r0, [r6, 0xC]
	bl Free
	ldr r0, [r6, 0x4]
	bl Free
	adds r0, r6, 0
	adds r0, 0x20
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r6, 0
	adds r0, 0x21
	bl sub_811BB40
	movs r0, 0x11
	b _081198DA
_0811939A:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x12
	b _081198DA
_081193AE:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _081193BA
	b _081198DC
_081193BA:
	bl sub_811BA78
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _081193D4 @ =gUnknown_203B05C
	ldr r0, [r0]
	bl Free
	bl sub_81179A4
	b _081198DC
	.align 2, 0
_081193D4: .4byte gUnknown_203B05C
_081193D8:
	bl sub_80F9800
	ldrh r1, [r0, 0x8]
	ldr r4, _081193EC @ =0x000003ff
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _081193F0
	movs r0, 0x2B
	b _081198DA
	.align 2, 0
_081193EC: .4byte 0x000003ff
_081193F0:
	bl sub_80F9800
	ldrh r1, [r0, 0x8]
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _08119414
	ldr r0, _0811940C @ =gStringVar4
	ldr r1, _08119410 @ =gUnknown_8458DE8
	bl StringCopy
	b _0811944A
	.align 2, 0
_0811940C: .4byte gStringVar4
_08119410: .4byte gUnknown_8458DE8
_08119414:
	ldr r4, _08119454 @ =gStringVar1
	bl sub_80F9800
	ldrh r0, [r0, 0x8]
	lsls r0, 22
	lsrs r0, 22
	movs r1, 0xB
	muls r1, r0
	ldr r0, _08119458 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r4, _0811945C @ =gStringVar2
	bl sub_80F9800
	ldrb r1, [r0, 0xB]
	lsrs r1, 1
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _08119460 @ =gStringVar4
	ldr r1, _08119464 @ =gUnknown_8458DBC
	bl StringExpandPlaceholders
_0811944A:
	ldr r1, _08119460 @ =gStringVar4
	movs r0, 0x2C
	bl sub_8118664
	b _081198DC
	.align 2, 0
_08119454: .4byte gStringVar1
_08119458: .4byte gSpeciesNames
_0811945C: .4byte gStringVar2
_08119460: .4byte gStringVar4
_08119464: .4byte gUnknown_8458DBC
_08119468:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, _08119480 @ =gUnknown_8458AB8
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _0811947A
	b _081198DC
_0811947A:
	movs r0, 0x2F
	b _081198DA
	.align 2, 0
_08119480: .4byte gUnknown_8458AB8
_08119484:
	adds r0, r6, 0
	adds r0, 0x16
	adds r1, r6, 0
	adds r1, 0x1D
	adds r2, r6, 0
	adds r2, 0x1E
	ldr r3, _081194BC @ =gUnknown_8456E34
	ldr r4, _081194C0 @ =gUnknown_8456E54
	str r4, [sp]
	bl sub_811A218
	adds r5, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _081194A6
	b _081198DC
_081194A6:
	subs r0, 0x1
	cmp r5, r0
	beq _081194B0
	cmp r5, 0x3
	bne _081194C4
_081194B0:
	movs r0, 0x4
	strb r0, [r6, 0x14]
	movs r0, 0x1
	bl sub_811B258
	b _081194E4
	.align 2, 0
_081194BC: .4byte gUnknown_8456E34
_081194C0: .4byte gUnknown_8456E54
_081194C4:
	cmp r5, 0x1
	beq _081194CE
	cmp r5, 0x2
	beq _081194DC
	b _081194E4
_081194CE:
	ldr r1, _081194D8 @ =gUnknown_8458D1C
	movs r0, 0x35
	bl sub_8118664
	b _081194E4
	.align 2, 0
_081194D8: .4byte gUnknown_8458D1C
_081194DC:
	ldr r1, _081194EC @ =gUnknown_8458B44
	movs r0, 0x2F
	bl sub_8118664
_081194E4:
	bl DestroyHelpMessageWindow_
	b _081198DC
	.align 2, 0
_081194EC: .4byte gUnknown_8458B44
_081194F0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x36
	b _081198DA
_08119504:
	ldr r0, _08119528 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08119512
	b _081198DC
_08119512:
	ldr r1, _0811952C @ =gUnknown_203B06C
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _08119530 @ =gFieldCallback
	ldr r0, _08119534 @ =sub_807DCE4
	str r0, [r1]
	ldr r1, _08119538 @ =CB2_ReturnToField
	movs r0, 0x8
	bl sub_81277F4
	b _081198DC
	.align 2, 0
_08119528: .4byte gPaletteFade
_0811952C: .4byte gUnknown_203B06C
_08119530: .4byte gFieldCallback
_08119534: .4byte sub_807DCE4
_08119538: .4byte CB2_ReturnToField
_0811953C:
	adds r0, r6, 0
	adds r0, 0x16
	adds r1, r6, 0
	adds r1, 0x1D
	adds r2, r6, 0
	adds r2, 0x1E
	ldr r3, _08119580 @ =gUnknown_8456E6C
	ldr r4, _08119584 @ =gUnknown_8456F04
	str r4, [sp]
	bl sub_811A218
	adds r5, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _0811955E
	b _081198DC
_0811955E:
	subs r0, 0x1
	cmp r5, r0
	beq _08119568
	cmp r5, 0x12
	bne _08119590
_08119568:
	ldr r0, _08119588 @ =gUnknown_203B06C
	bl sub_811B148
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80FAFA0
	ldr r0, _0811958C @ =gUnknown_8458D54
	bl sub_811868C
	b _081198DC
	.align 2, 0
_08119580: .4byte gUnknown_8456E6C
_08119584: .4byte gUnknown_8456F04
_08119588: .4byte gUnknown_203B06C
_0811958C: .4byte gUnknown_8458D54
_08119590:
	ldr r0, _08119598 @ =gUnknown_203B06C
	strh r5, [r0, 0x2]
	movs r0, 0x37
	b _081198DA
	.align 2, 0
_08119598: .4byte gUnknown_203B06C
_0811959C:
	ldr r2, _081195B0 @ =gUnknown_203B06C
	ldrh r0, [r2, 0x2]
	ldrh r1, [r2, 0xA]
	ldrh r2, [r2, 0xC]
	bl sub_80FAFA0
	ldr r0, _081195B4 @ =gUnknown_8458D78
	bl sub_811868C
	b _081198DC
	.align 2, 0
_081195B0: .4byte gUnknown_203B06C
_081195B4: .4byte gUnknown_8458D78
_081195B8:
	adds r0, r6, 0
	adds r0, 0x16
	movs r1, 0
	bl sub_811A14C
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _081195DE
	cmp r1, 0
	bgt _081195D8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _081195E2
	b _081198DC
_081195D8:
	cmp r1, 0x1
	beq _081195E2
	b _081198DC
_081195DE:
	movs r0, 0x38
	b _081198DA
_081195E2:
	movs r0, 0x1
	bl sub_811B258
	movs r0, 0x4
	b _081198DA
_081195EC:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, _08119618 @ =gUnknown_8458E10
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _081195FE
	b _081198DC
_081195FE:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80FAFA0
	ldr r0, _0811961C @ =gUnknown_203B06C
	bl sub_811B148
	movs r0, 0x1
	bl sub_811B258
	movs r0, 0x4
	b _081198DA
	.align 2, 0
_08119618: .4byte gUnknown_8458E10
_0811961C: .4byte gUnknown_203B06C
_08119620:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, _08119638 @ =gUnknown_8458A98
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _08119632
	b _081198DC
_08119632:
	movs r0, 0x2E
	b _081198DA
	.align 2, 0
_08119638: .4byte gUnknown_8458A98
_0811963C:
	bl sub_811A3F8
	movs r0, 0x30
	b _081198DA
_08119644:
	adds r0, r6, 0
	adds r0, 0x16
	adds r1, r6, 0
	adds r1, 0x1D
	adds r2, r6, 0
	adds r2, 0x4A
	adds r3, r6, 0
	adds r3, 0x1E
	ldr r4, _08119688 @ =gUnknown_8456F24
	str r4, [sp]
	ldr r4, _0811968C @ =gUnknown_8456F7C
	str r4, [sp, 0x4]
	ldr r4, [r6]
	str r4, [sp, 0x8]
	bl sub_811A2EC
	adds r5, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _08119670
	b _081198DC
_08119670:
	subs r0, 0x1
	cmp r5, r0
	beq _0811967A
	cmp r5, 0x8
	bne _08119690
_0811967A:
	movs r0, 0x1
	bl sub_811B258
	bl DestroyHelpMessageWindow_
	movs r0, 0x4
	b _081198DA
	.align 2, 0
_08119688: .4byte gUnknown_8456F24
_0811968C: .4byte gUnknown_8456F7C
_08119690:
	ldr r1, [r6]
	lsls r3, r5, 5
	mov r8, r3
	add r1, r8
	ldrb r0, [r1, 0x9]
	lsrs r0, 2
	ldrh r1, [r1, 0x8]
	lsls r1, 22
	lsrs r1, 22
	bl sub_811ADD0
	cmp r0, 0x1
	beq _081196EC
	cmp r0, 0x1
	bgt _081196B4
	cmp r0, 0
	beq _081196BA
	b _081198DC
_081196B4:
	cmp r0, 0x2
	beq _08119734
	b _081198DC
_081196BA:
	ldr r4, _081196E4 @ =gStringVar1
	ldr r1, [r6]
	add r1, r8
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldr r0, [r6]
	add r0, r8
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r1, _081196E8 @ =gUnknown_8458E70
	movs r0, 0x31
	bl sub_8118664
	strh r5, [r7, 0x2]
	b _081198DC
	.align 2, 0
_081196E4: .4byte gStringVar1
_081196E8: .4byte gUnknown_8458E70
_081196EC:
	ldr r4, _08119724 @ =gStringVar1
	ldr r1, [r6]
	add r1, r8
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldr r0, [r6]
	add r0, r8
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r0, _08119728 @ =gStringVar2
	ldr r1, [r6]
	add r1, r8
	ldrb r2, [r1, 0x9]
	lsrs r2, 2
	lsls r1, r2, 3
	subs r1, r2
	ldr r2, _0811972C @ =gTypeNames
	adds r1, r2
	bl StringCopy
	ldr r1, _08119730 @ =gUnknown_8458ED0
	b _0811976A
	.align 2, 0
_08119724: .4byte gStringVar1
_08119728: .4byte gStringVar2
_0811972C: .4byte gTypeNames
_08119730: .4byte gUnknown_8458ED0
_08119734:
	ldr r4, _08119774 @ =gStringVar1
	ldr r1, [r6]
	add r1, r8
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldr r0, [r6]
	add r0, r8
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r0, _08119778 @ =gStringVar2
	ldr r1, [r6]
	add r1, r8
	ldrb r2, [r1, 0x9]
	lsrs r2, 2
	lsls r1, r2, 3
	subs r1, r2
	ldr r2, _0811977C @ =gTypeNames
	adds r1, r2
	bl StringCopy
	ldr r1, _08119780 @ =gUnknown_8458F04
_0811976A:
	movs r0, 0x2E
	bl sub_8118664
	b _081198DC
	.align 2, 0
_08119774: .4byte gStringVar1
_08119778: .4byte gStringVar2
_0811977C: .4byte gTypeNames
_08119780: .4byte gUnknown_8458F04
_08119784:
	adds r0, r6, 0
	adds r0, 0x16
	movs r1, 0
	bl sub_811A14C
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _081197AA
	cmp r1, 0
	bgt _081197A4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _081197AE
	b _081198DC
_081197A4:
	cmp r1, 0x1
	beq _081197AE
	b _081198DC
_081197AA:
	movs r0, 0x32
	b _081198DA
_081197AE:
	movs r0, 0x1
	bl sub_811B258
	movs r0, 0x4
	b _081198DA
_081197B8:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, _08119820 @ =gUnknown_8458D1C
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	bne _081197CA
	b _081198DC
_081197CA:
	ldr r4, _08119824 @ =gUnknown_203B06C
	movs r0, 0x2
	strh r0, [r4]
	ldr r2, _08119828 @ =gUnknown_203B064
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	ldr r1, [r6]
	lsls r0, 5
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r2, _0811982C @ =gUnionRoomRequestedMonType
	ldr r1, [r6]
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0x9]
	lsrs r0, 2
	strb r0, [r2]
	ldr r2, _08119830 @ =gUnionRoomOfferedSpecies
	ldr r1, [r6]
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	lsls r0, 5
	adds r1, r0
	ldrh r0, [r1, 0x8]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r2]
	ldr r1, _08119834 @ =gFieldCallback
	ldr r0, _08119838 @ =sub_807DCE4
	str r0, [r1]
	ldr r1, _0811983C @ =CB2_ReturnToField
	movs r0, 0x9
	bl sub_81277F4
	adds r0, r6, 0
	bl sub_81186B0
	ldrh r0, [r7, 0x2]
	strb r0, [r4, 0x8]
	b _081198DC
	.align 2, 0
_08119820: .4byte gUnknown_8458D1C
_08119824: .4byte gUnknown_203B06C
_08119828: .4byte gUnknown_203B064
_0811982C: .4byte gUnionRoomRequestedMonType
_08119830: .4byte gUnionRoomOfferedSpecies
_08119834: .4byte gFieldCallback
_08119838: .4byte sub_807DCE4
_0811983C: .4byte CB2_ReturnToField
_08119840:
	ldr r1, _08119890 @ =gUnknown_203B058
	movs r0, 0x44
	strb r0, [r1]
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	lsls r0, 5
	ldr r1, [r6]
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0x10
	movs r2, 0x44
	bl sub_80FC114
	ldr r4, _08119894 @ =gStringVar1
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	lsls r0, 5
	ldr r1, [r6]
	adds r1, r0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldr r1, [r6]
	movs r3, 0x2
	ldrsh r0, [r7, r3]
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r0, _08119898 @ =gUnknown_8457A34
	ldr r0, [r0, 0x8]
	bl sub_811A0B4
	movs r0, 0x19
	b _081198DA
	.align 2, 0
_08119890: .4byte gUnknown_203B058
_08119894: .4byte gStringVar1
_08119898: .4byte gUnknown_8457A34
_0811989C:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, _081198C4 @ =gStringVar4
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	beq _081198DC
	movs r0, 0x1
	bl sub_811B258
	movs r1, 0
	ldrsh r0, [r7, r1]
	movs r2, 0x2
	ldrsh r1, [r7, r2]
	ldr r2, [r6]
	bl sub_811C028
	movs r0, 0x4
	b _081198DA
	.align 2, 0
_081198C4: .4byte gStringVar4
_081198C8:
	adds r0, r6, 0
	adds r0, 0x16
	ldr r1, _081198E8 @ =gStringVar4
	bl sub_811A0F8
	lsls r0, 24
	cmp r0, 0
	beq _081198DC
	ldrb r0, [r6, 0x15]
_081198DA:
	strb r0, [r6, 0x14]
_081198DC:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081198E8: .4byte gStringVar4
	thumb_func_end sub_81186E0

	thumb_func_start var_800D_set_xB
var_800D_set_xB: @ 81198EC
	push {lr}
	bl InUnionRoom
	cmp r0, 0x1
	bne _081198FC
	ldr r1, _08119900 @ =gSpecialVar_Result
	movs r0, 0xB
	strh r0, [r1]
_081198FC:
	pop {r0}
	bx r0
	.align 2, 0
_08119900: .4byte gSpecialVar_Result
	thumb_func_end var_800D_set_xB

	thumb_func_start sub_8119904
sub_8119904: @ 8119904
	push {r4,r5,lr}
	adds r2, r0, 0
	ldr r3, _08119940 @ =gRecvCmds
	ldrh r5, [r3, 0x12]
	adds r4, r5, 0
	cmp r4, 0
	beq _08119938
	ldrh r0, [r3, 0x10]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0xBC
	lsls r0, 6
	cmp r1, r0
	bne _08119938
	adds r0, r2, 0
	adds r0, 0x86
	strh r5, [r0]
	cmp r4, 0x44
	bne _08119938
	ldrh r1, [r3, 0x14]
	adds r0, 0x2
	strh r1, [r0]
	ldrh r1, [r3, 0x16]
	adds r0, 0x2
	strh r1, [r0]
_08119938:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08119940: .4byte gRecvCmds
	thumb_func_end sub_8119904

	thumb_func_start sub_8119944
sub_8119944: @ 8119944
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x86
	ldrh r0, [r5]
	cmp r0, 0
	beq _08119994
	ldr r0, _08119978 @ =gStringVar4
	ldr r1, _0811997C @ =gLinkPlayers
	adds r1, 0x2F
	ldrb r1, [r1]
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_811AF6C
	cmp r0, 0
	beq _08119994
	cmp r0, 0x1
	bne _08119984
	movs r0, 0x23
	strb r0, [r4, 0x14]
	ldr r1, _08119980 @ =gUnknown_203B058
	ldrh r0, [r5]
	strb r0, [r1]
	movs r0, 0
	b _08119996
	.align 2, 0
_08119978: .4byte gStringVar4
_0811997C: .4byte gLinkPlayers
_08119980: .4byte gUnknown_203B058
_08119984:
	cmp r0, 0x2
	bne _08119994
	movs r0, 0x24
	strb r0, [r4, 0x14]
	bl sub_800AAC0
	movs r0, 0
	b _08119996
_08119994:
	movs r0, 0x1
_08119996:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8119944

	thumb_func_start InitUnionRoom
InitUnionRoom: @ 811999C
	push {r4-r6,lr}
	ldr r5, _081199E8 @ =gUnknown_203B04C
	movs r0, 0x1
	negs r0, r0
	adds r6, r0, 0
	movs r0, 0xFF
	strb r0, [r5]
	ldr r0, _081199EC @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _081199E0
	ldr r0, _081199F0 @ =sub_81199FC
	movs r1, 0
	bl CreateTask
	ldr r4, _081199F4 @ =gUnknown_203B05C
	movs r0, 0x96
	lsls r0, 2
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _081199F8 @ =gUnknown_300202C
	str r0, [r1]
	movs r1, 0
	strb r1, [r0, 0x14]
	strb r1, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x12]
	ldrb r0, [r5]
	orrs r0, r6
	strb r0, [r5]
_081199E0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081199E8: .4byte gUnknown_203B04C
_081199EC: .4byte gUnknown_203ADFA
_081199F0: .4byte sub_81199FC
_081199F4: .4byte gUnknown_203B05C
_081199F8: .4byte gUnknown_300202C
	thumb_func_end InitUnionRoom

	thumb_func_start sub_81199FC
sub_81199FC: @ 81199FC
	push {r4-r6,lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08119A1C @ =gUnknown_203B05C
	ldr r5, [r0]
	ldrb r0, [r5, 0x14]
	cmp r0, 0x4
	bls _08119A10
	b _08119B5C
_08119A10:
	lsls r0, 2
	ldr r1, _08119A20 @ =_08119A24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08119A1C: .4byte gUnknown_203B05C
_08119A20: .4byte _08119A24
	.align 2, 0
_08119A24:
	.4byte _08119A38
	.4byte _08119A3E
	.4byte _08119A60
	.4byte _08119AB0
	.4byte _08119B28
_08119A38:
	movs r0, 0x1
	strb r0, [r5, 0x14]
	b _08119B5C
_08119A3E:
	movs r0, 0xC
	movs r1, 0
	movs r2, 0
	bl sub_80FAF58
	bl sub_800B1F4
	bl OpenLink
	bl sub_80FBC00
	movs r0, 0x1
	bl sub_80FB128
	movs r0, 0x2
	strb r0, [r5, 0x14]
	b _08119B5C
_08119A60:
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0x4]
	movs r1, 0x4
	bl sub_811A650
	movs r0, 0x70
	bl AllocZeroed
	str r0, [r5, 0xC]
	movs r1, 0x4
	bl sub_811A650
	movs r0, 0x80
	lsls r0, 1
	bl AllocZeroed
	str r0, [r5]
	movs r1, 0x8
	bl sub_811A5E4
	movs r0, 0x20
	bl AllocZeroed
	str r0, [r5, 0x8]
	movs r1, 0x1
	bl sub_811A5E4
	ldr r0, [r5, 0xC]
	ldr r1, [r5, 0x4]
	movs r2, 0xA
	bl sub_8119E84
	adds r1, r5, 0
	adds r1, 0x20
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r5, 0x14]
	b _08119B5C
_08119AB0:
	bl sub_8119B94
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	blt _08119B5C
	cmp r0, 0x2
	bgt _08119B5C
	ldr r0, _08119B14 @ =gUnknown_203B04C
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08119B5C
	movs r6, 0
_08119ACA:
	ldr r0, [r5]
	lsls r4, r6, 5
	adds r1, r0, r4
	ldrb r0, [r1, 0x1A]
	lsls r0, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08119B0A
	adds r1, 0x10
	mov r0, sp
	bl StringCopy
	ldr r0, [r5]
	adds r0, r4
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	mov r0, sp
	bl ConvertInternationalString
	ldr r0, [r5]
	adds r0, r4
	adds r0, 0x2
	bl sub_8118658
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	bl sub_80FD338
	cmp r0, 0
	bne _08119B18
_08119B0A:
	adds r6, 0x1
	cmp r6, 0x7
	ble _08119ACA
	b _08119B5C
	.align 2, 0
_08119B14: .4byte gUnknown_203B04C
_08119B18:
	ldr r0, _08119B24 @ =gUnknown_203B04C
	mov r1, sp
	bl StringCopy
	b _08119B5C
	.align 2, 0
_08119B24: .4byte gUnknown_203B04C
_08119B28:
	ldr r0, [r5, 0x8]
	bl Free
	ldr r0, [r5]
	bl Free
	ldr r0, [r5, 0xC]
	bl Free
	ldr r0, [r5, 0x4]
	bl Free
	adds r0, r5, 0
	adds r0, 0x20
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, _08119B64 @ =gUnknown_203B05C
	ldr r0, [r0]
	bl Free
	bl sub_80F8DC0
	adds r0, r4, 0
	bl DestroyTask
_08119B5C:
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08119B64: .4byte gUnknown_203B05C
	thumb_func_end sub_81199FC

	thumb_func_start BufferUnionRoomPlayerName
BufferUnionRoomPlayerName: @ 8119B68
	push {r4,lr}
	ldr r4, _08119B78 @ =gUnknown_203B04C
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _08119B7C
	movs r0, 0
	b _08119B8A
	.align 2, 0
_08119B78: .4byte gUnknown_203B04C
_08119B7C:
	ldr r0, _08119B90 @ =gStringVar1
	adds r1, r4, 0
	bl StringCopy
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0x1
_08119B8A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08119B90: .4byte gStringVar1
	thumb_func_end BufferUnionRoomPlayerName

	thumb_func_start sub_8119B94
sub_8119B94: @ 8119B94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08119BE8 @ =gUnknown_203B05C
	ldr r4, [r0]
	movs r7, 0
	movs r6, 0
	movs r5, 0
_08119BA6:
	ldr r0, [r4, 0xC]
	adds r0, r5
	ldr r1, _08119BEC @ =gUnknown_8457034
	bl sub_811A694
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bne _08119BF0
	ldr r1, [r4, 0xC]
	ldr r0, [r4, 0x8]
	adds r1, r5
	ldm r1!, {r2,r5,r6}
	stm r0!, {r2,r5,r6}
	ldm r1!, {r2,r5,r6}
	stm r0!, {r2,r5,r6}
	ldr r1, [r4, 0x8]
	movs r0, 0
	strh r0, [r1, 0x18]
	ldr r2, [r4, 0x8]
	ldrb r1, [r2, 0x1A]
	movs r5, 0x4
	negs r5, r5
	adds r0, r5, 0
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r2, 0x1A]
	ldr r0, [r4, 0x8]
	strb r3, [r0, 0x1B]
	movs r0, 0x4
	b _08119D24
	.align 2, 0
_08119BE8: .4byte gUnknown_203B05C
_08119BEC: .4byte gUnknown_8457034
_08119BF0:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _08119BA6
	movs r6, 0
	mov r9, r6
_08119BFC:
	ldr r0, [r4]
	mov r1, r9
	lsls r5, r1, 5
	adds r2, r0, r5
	ldrb r0, [r2, 0x1A]
	lsls r0, 30
	mov r8, r5
	cmp r0, 0
	beq _08119CF0
	ldr r1, [r4, 0x4]
	adds r0, r2, 0
	bl sub_811A748
	adds r6, r0, 0
	cmp r6, 0xFF
	beq _08119C96
	ldr r0, [r4]
	adds r2, r0, r5
	ldrb r1, [r2, 0x1A]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r0, 0x1
	bne _08119C74
	lsls r0, r6, 3
	subs r0, r6
	lsls r6, r0, 2
	ldr r1, [r4, 0x4]
	adds r1, r6
	adds r0, r2, 0
	bl sub_811A6DC
	cmp r0, 0
	beq _08119C5A
	ldr r1, [r4]
	ldr r0, [r4, 0x4]
	adds r1, r5
	adds r0, r6
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x40
	strb r1, [r0, 0x1B]
	movs r7, 0x1
	b _08119C8C
_08119C5A:
	ldr r0, [r4]
	adds r1, r0, r5
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08119C8C
	subs r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r4]
	adds r0, r5
	ldrb r0, [r0, 0x1B]
	cmp r0, 0
	bne _08119C8C
	b _08119C8A
_08119C74:
	movs r3, 0x4
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1A]
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0
	strb r1, [r0, 0x1B]
_08119C8A:
	movs r7, 0x2
_08119C8C:
	ldr r0, [r4]
	add r0, r8
	movs r1, 0
	strh r1, [r0, 0x18]
	b _08119CF0
_08119C96:
	ldr r0, [r4]
	adds r1, r0, r5
	ldrb r0, [r1, 0x1A]
	lsls r2, r0, 30
	lsrs r0, r2, 30
	cmp r0, 0x2
	beq _08119CD0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
	ldr r0, [r4]
	adds r2, r0, r5
	ldrh r1, [r2, 0x18]
	ldr r0, _08119CCC @ =0x00000257
	cmp r1, r0
	bls _08119CF0
	ldrb r0, [r2, 0x1A]
	movs r5, 0x4
	negs r5, r5
	adds r1, r5, 0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x1A]
	movs r7, 0x2
	b _08119CF0
	.align 2, 0
_08119CCC: .4byte 0x00000257
_08119CD0:
	lsrs r0, r2, 30
	cmp r0, 0x2
	bne _08119CF0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
	ldr r0, [r4]
	adds r2, r0, r5
	ldrh r1, [r2, 0x18]
	ldr r0, _08119D30 @ =0x00000383
	cmp r1, r0
	bls _08119CF0
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_811A5E4
_08119CF0:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0x7
	bhi _08119D00
	b _08119BFC
_08119D00:
	movs r5, 0
	movs r6, 0x3
_08119D04:
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	adds r1, r5
	movs r2, 0x8
	bl sub_811A798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08119D1A
	movs r7, 0x1
_08119D1A:
	adds r5, 0x1C
	subs r6, 0x1
	cmp r6, 0
	bge _08119D04
	adds r0, r7, 0
_08119D24:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08119D30: .4byte 0x00000383
	thumb_func_end sub_8119B94

	thumb_func_start sub_8119D34
sub_8119D34: @ 8119D34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	ldr r1, _08119E24 @ =gTasks+0x8
	adds r6, r0, r1
	movs r7, 0
	mov r0, sp
	adds r0, 0x10
	str r0, [sp, 0x18]
_08119D58:
	lsls r2, r7, 24
	lsrs r2, 24
	mov r0, sp
	ldr r1, [sp, 0x18]
	bl sub_80FCC3C
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	ldrb r0, [r0, 0xA]
	lsls r0, 25
	lsrs r0, 25
	mov r2, r10
	lsls r1, r2, 2
	add r1, r10
	lsls r1, 3
	ldr r3, _08119E28 @ =gTasks
	adds r1, r3
	movs r5, 0x10
	ldrsh r1, [r1, r5]
	bl sub_8116F28
	cmp r0, 0
	bne _08119D94
	mov r1, sp
	ldr r0, _08119E2C @ =gUnknown_8457034
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
_08119D94:
	mov r0, sp
	ldrb r1, [r0]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _08119DAC
	mov r1, sp
	ldr r0, _08119E2C @ =gUnknown_8457034
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
_08119DAC:
	cmp r4, 0
	bne _08119E30
	lsls r0, r7, 3
	mov r8, r0
	adds r1, r7, 0x1
	mov r9, r1
	cmp r7, 0
	ble _08119DEC
	movs r2, 0
	str r2, [sp, 0x1C]
	adds r4, r7, 0
_08119DC2:
	ldr r0, [r6, 0x4]
	ldr r3, [sp, 0x1C]
	adds r0, r3
	mov r1, sp
	bl sub_811A694
	lsls r0, 24
	cmp r0, 0
	bne _08119DE0
	mov r1, sp
	ldr r0, _08119E2C @ =gUnknown_8457034
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
_08119DE0:
	ldr r5, [sp, 0x1C]
	adds r5, 0x1C
	str r5, [sp, 0x1C]
	subs r4, 0x1
	cmp r4, 0
	bne _08119DC2
_08119DEC:
	ldr r1, [r6, 0x4]
	mov r0, r8
	subs r4, r0, r7
	lsls r4, 2
	adds r1, r4
	mov r0, sp
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r6, 0x4]
	adds r0, r4
	ldr r1, _08119E2C @ =gUnknown_8457034
	bl sub_811A694
	ldr r3, [r6, 0x4]
	adds r3, r4
	movs r2, 0x1
	ands r2, r0
	ldrb r0, [r3, 0x18]
	movs r4, 0x2
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	b _08119E68
	.align 2, 0
_08119E24: .4byte gTasks+0x8
_08119E28: .4byte gTasks
_08119E2C: .4byte gUnknown_8457034
_08119E30:
	ldr r1, [r6]
	lsls r4, r7, 3
	subs r4, r7
	lsls r4, 2
	adds r1, r4
	mov r0, sp
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r6]
	adds r0, r4
	ldr r1, _08119E80 @ =gUnknown_8457034
	bl sub_811A694
	ldr r3, [r6]
	adds r3, r4
	movs r2, 0x1
	ands r2, r0
	ldrb r0, [r3, 0x18]
	movs r4, 0x2
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	adds r7, 0x1
	mov r9, r7
_08119E68:
	mov r7, r9
	cmp r7, 0x3
	bgt _08119E70
	b _08119D58
_08119E70:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119E80: .4byte gUnknown_8457034
	thumb_func_end sub_8119D34

	thumb_func_start sub_8119E84
sub_8119E84: @ 8119E84
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, _08119EB0 @ =sub_8119D34
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _08119EB4 @ =gTasks+0x8
	adds r3, r1, r2
	str r4, [r3]
	str r5, [r3, 0x4]
	adds r2, r1
	strh r6, [r2, 0x8]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08119EB0: .4byte sub_8119D34
_08119EB4: .4byte gTasks+0x8
	thumb_func_end sub_8119E84

	thumb_func_start sub_8119EB8
sub_8119EB8: @ 8119EB8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	ldr r1, _08119FA4 @ =gTasks+0x8
	adds r6, r0, r1
	movs r3, 0
_08119ED6:
	lsls r4, r3, 3
	subs r0, r4, r3
	lsls r5, r0, 2
	ldr r0, [r6]
	adds r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	lsls r2, r3, 24
	lsrs r2, 24
	str r3, [sp]
	bl sub_80FCC3C
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0, 0xA]
	lsls r0, 25
	lsrs r0, 25
	mov r2, r10
	lsls r1, r2, 2
	add r1, r10
	lsls r1, 3
	ldr r7, _08119FA8 @ =gTasks
	adds r1, r7
	movs r2, 0xC
	ldrsh r1, [r1, r2]
	bl sub_8116F28
	mov r8, r4
	ldr r3, [sp]
	cmp r0, 0
	bne _08119F22
	ldr r1, [r6]
	adds r1, r5
	ldr r0, _08119FAC @ =gUnknown_8457034
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
	ldm r0!, {r2,r4,r7}
	stm r1!, {r2,r4,r7}
_08119F22:
	adds r4, r3, 0x1
	mov r9, r4
	cmp r3, 0
	ble _08119F66
	str r5, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	adds r4, r3, 0
_08119F32:
	ldr r1, [r6]
	ldr r7, [sp, 0x8]
	adds r0, r1, r7
	ldr r2, [sp, 0x4]
	adds r1, r2
	str r3, [sp]
	bl sub_811A694
	lsls r0, 24
	ldr r3, [sp]
	cmp r0, 0
	bne _08119F5A
	ldr r1, [r6]
	ldr r5, [sp, 0x4]
	adds r1, r5
	ldr r0, _08119FAC @ =gUnknown_8457034
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
_08119F5A:
	ldr r7, [sp, 0x8]
	adds r7, 0x1C
	str r7, [sp, 0x8]
	subs r4, 0x1
	cmp r4, 0
	bne _08119F32
_08119F66:
	mov r0, r8
	subs r4, r0, r3
	lsls r4, 2
	ldr r0, [r6]
	adds r0, r4
	ldr r1, _08119FAC @ =gUnknown_8457034
	bl sub_811A694
	ldr r3, [r6]
	adds r3, r4
	movs r2, 0x1
	ands r2, r0
	ldrb r0, [r3, 0x18]
	movs r4, 0x2
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	mov r3, r9
	cmp r3, 0x3
	ble _08119ED6
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119FA4: .4byte gTasks+0x8
_08119FA8: .4byte gTasks
_08119FAC: .4byte gUnknown_8457034
	thumb_func_end sub_8119EB8

	thumb_func_start sub_8119FB0
sub_8119FB0: @ 8119FB0
	push {lr}
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7
	bne _08119FC0
	ldrb r1, [r0]
	movs r0, 0x20
	b _08119FC8
_08119FC0:
	cmp r1, 0x8
	bne _08119FD2
	ldrb r1, [r0]
	movs r0, 0x10
_08119FC8:
	ands r0, r1
	cmp r0, 0
	beq _08119FD2
	movs r0, 0x1
	b _08119FD4
_08119FD2:
	movs r0, 0
_08119FD4:
	pop {r1}
	bx r1
	thumb_func_end sub_8119FB0

	thumb_func_start sub_8119FD8
sub_8119FD8: @ 8119FD8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0811A04C @ =gTasks+0x8
	adds r4, r1, r0
	movs r6, 0
	subs r0, 0x8
	movs r5, 0
	adds r1, r0
	mov r8, r1
_08119FF6:
	ldr r0, [r4]
	adds r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	lsls r2, r6, 24
	lsrs r2, 24
	bl sub_80FCCF4
	lsls r0, 24
	cmp r0, 0
	beq _0811A01A
	ldr r0, [r4]
	adds r0, r5
	mov r2, r8
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	bl sub_8119FB0
_0811A01A:
	ldr r0, [r4]
	adds r0, r5
	ldr r1, _0811A050 @ =gUnknown_8457034
	bl sub_811A694
	ldr r3, [r4]
	adds r3, r5
	movs r2, 0x1
	ands r2, r0
	ldrb r0, [r3, 0x18]
	movs r7, 0x2
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _08119FF6
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A04C: .4byte gTasks+0x8
_0811A050: .4byte gUnknown_8457034
	thumb_func_end sub_8119FD8

	thumb_func_start sub_811A054
sub_811A054: @ 811A054
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _0811A07C @ =sub_8119EB8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	ldr r1, _0811A080 @ =gTasks+0x8
	adds r3, r2, r1
	str r4, [r3]
	adds r1, r2
	strh r5, [r1, 0x4]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811A07C: .4byte sub_8119EB8
_0811A080: .4byte gTasks+0x8
	thumb_func_end sub_811A054

	thumb_func_start sub_811A084
sub_811A084: @ 811A084
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _0811A0AC @ =sub_8119FD8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	ldr r1, _0811A0B0 @ =gTasks+0x8
	adds r3, r2, r1
	str r4, [r3]
	adds r1, r2
	strh r5, [r1, 0x4]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811A0AC: .4byte sub_8119FD8
_0811A0B0: .4byte gTasks+0x8
	thumb_func_end sub_811A084

	thumb_func_start sub_811A0B4
sub_811A0B4: @ 811A0B4
	push {r4,lr}
	adds r4, r0, 0
	bl LoadStdWindowFrameGfx
	movs r0, 0
	movs r1, 0x1
	bl DrawDialogueFrame
	ldr r0, _0811A0DC @ =gStringVar4
	adds r1, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0x1
	bl AddTextPrinterWithCustomSpeedForMessage
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811A0DC: .4byte gStringVar4
	thumb_func_end sub_811A0B4

	thumb_func_start sub_811A0E0
sub_811A0E0: @ 811A0E0
	push {lr}
	bl RunTextPrinters_CheckPrinter0Active
	lsls r0, 16
	cmp r0, 0
	beq _0811A0F0
	movs r0, 0
	b _0811A0F2
_0811A0F0:
	movs r0, 0x1
_0811A0F2:
	pop {r1}
	bx r1
	thumb_func_end sub_811A0E0

	thumb_func_start sub_811A0F8
sub_811A0F8: @ 811A0F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0811A10A
	cmp r0, 0x1
	beq _0811A130
	b _0811A142
_0811A10A:
	bl LoadStdWindowFrameGfx
	movs r0, 0
	movs r1, 0x1
	bl DrawDialogueFrame
	ldr r0, _0811A12C @ =gStringVar4
	adds r1, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0x1
	bl AddTextPrinterForMessage
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0811A142
	.align 2, 0
_0811A12C: .4byte gStringVar4
_0811A130:
	bl RunTextPrinters_CheckPrinter0Active
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0811A142
	strb r0, [r4]
	movs r0, 0x1
	b _0811A144
_0811A142:
	movs r0, 0
_0811A144:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811A0F8

	thumb_func_start sub_811A14C
sub_811A14C: @ 811A14C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0811A15E
	cmp r0, 0x1
	beq _0811A174
	b _0811A1A0
_0811A15E:
	cmp r5, 0
	beq _0811A168
	movs r0, 0x3
	negs r0, r0
	b _0811A1A4
_0811A168:
	bl DisplayYesNoMenuDefaultYes
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0811A1A0
_0811A174:
	cmp r5, 0
	beq _0811A186
	bl DestroyYesNoMenu
	movs r0, 0
	strb r0, [r4]
	movs r0, 0x3
	negs r0, r0
	b _0811A1A4
_0811A186:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0811A1A0
	strb r5, [r4]
	adds r0, r1, 0
	b _0811A1A4
_0811A1A0:
	movs r0, 0x2
	negs r0, r0
_0811A1A4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811A14C

	thumb_func_start sub_811A1AC
sub_811A1AC: @ 811A1AC
	push {r4,lr}
	sub sp, 0x8
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl DrawStdWindowFrame
	adds r0, r4, 0
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	ldr r2, _0811A1F8 @ =gUnknown_8459378
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0
	movs r3, 0x8
	bl sub_811A444
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	movs r1, 0x2
	bl CopyWindowToVram
	adds r0, r4, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811A1F8: .4byte gUnknown_8459378
	thumb_func_end sub_811A1AC

	thumb_func_start sub_811A1FC
sub_811A1FC: @ 811A1FC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl ClearStdWindowAndFrame
	adds r0, r4, 0
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811A1FC

	thumb_func_start sub_811A218
sub_811A218: @ 811A218
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	adds r5, r1, 0
	mov r9, r2
	adds r0, r3, 0
	ldrb r4, [r7]
	cmp r4, 0
	beq _0811A234
	cmp r4, 0x1
	beq _0811A274
	b _0811A2DA
_0811A234:
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, 0
	bl DrawStdWindowFrame
	ldr r0, _0811A270 @ =gMultiuseListMenuTemplate
	adds r2, r0, 0
	ldr r1, [sp, 0x1C]
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldrb r1, [r5]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	mov r1, r9
	strb r0, [r1]
	ldrb r0, [r5]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _0811A2DA
	.align 2, 0
_0811A270: .4byte gMultiuseListMenuTemplate
_0811A274:
	mov r3, r9
	ldrb r0, [r3]
	bl ListMenu_ProcessInput
	mov r8, r0
	ldr r0, _0811A2AC @ =gMain
	ldrh r1, [r0, 0x2E]
	ands r4, r1
	cmp r4, 0
	beq _0811A2B0
	mov r4, r9
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	ldrb r0, [r5]
	movs r1, 0x1
	bl ClearStdWindowAndFrame
	ldrb r0, [r5]
	bl RemoveWindow
	movs r0, 0
	strb r0, [r7]
	mov r0, r8
	b _0811A2DE
	.align 2, 0
_0811A2AC: .4byte gMain
_0811A2B0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0811A2DA
	mov r6, r9
	ldrb r0, [r6]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	ldrb r0, [r5]
	movs r1, 0x1
	bl ClearStdWindowAndFrame
	ldrb r0, [r5]
	bl RemoveWindow
	strb r4, [r7]
	movs r0, 0x2
	negs r0, r0
	b _0811A2DE
_0811A2DA:
	movs r0, 0x1
	negs r0, r0
_0811A2DE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811A218

	thumb_func_start sub_811A2EC
sub_811A2EC: @ 811A2EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r7, r3, 0
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811A308
	cmp r0, 0x1
	beq _0811A358
	b _0811A3E6
_0811A308:
	ldr r0, _0811A350 @ =gUnknown_8456F1C
	bl sub_811A1AC
	strb r0, [r7]
	ldr r0, [sp, 0x1C]
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, 0
	bl DrawStdWindowFrame
	ldr r0, _0811A354 @ =gMultiuseListMenuTemplate
	adds r2, r0, 0
	ldr r1, [sp, 0x20]
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldrb r1, [r4]
	strb r1, [r0, 0x10]
	movs r1, 0
	movs r2, 0x1
	bl ListMenuInit
	strb r0, [r5]
	ldrb r0, [r4]
	movs r1, 0x1
	bl CopyWindowToVram
	mov r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0811A3E6
	.align 2, 0
_0811A350: .4byte gUnknown_8456F1C
_0811A354: .4byte gMultiuseListMenuTemplate
_0811A358:
	ldrb r0, [r5]
	bl ListMenu_ProcessInput
	adds r1, r0, 0
	ldr r0, _0811A3A8 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	beq _0811A3E6
	cmp r1, 0x8
	beq _0811A37E
	movs r0, 0x2
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _0811A3AC
_0811A37E:
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	ldrb r0, [r4]
	movs r1, 0x1
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	bl RemoveWindow
	ldrb r0, [r7]
	bl sub_811A1FC
	movs r0, 0
	mov r3, r9
	strb r0, [r3]
	movs r0, 0x2
	negs r0, r0
	b _0811A3EA
	.align 2, 0
_0811A3A8: .4byte gMain
_0811A3AC:
	ldr r0, [sp, 0x24]
	bl sub_811AD7C
	adds r6, r0, 0
	cmp r6, 0
	blt _0811A3E0
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0
	bl DestroyListMenuTask
	ldrb r0, [r4]
	movs r1, 0x1
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	bl RemoveWindow
	ldrb r0, [r7]
	bl sub_811A1FC
	mov r0, r8
	mov r7, r9
	strb r0, [r7]
	adds r0, r6, 0
	b _0811A3EA
_0811A3E0:
	movs r0, 0x7
	bl PlaySE
_0811A3E6:
	movs r0, 0x1
	negs r0, r0
_0811A3EA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811A2EC

	thumb_func_start sub_811A3F8
sub_811A3F8: @ 811A3F8
	push {lr}
	sub sp, 0xC
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_811A3F8

	thumb_func_start sub_811A41C
sub_811A41C: @ 811A41C
	push {lr}
	sub sp, 0xC
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	bl EnableBothScriptContexts
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_811A41C

	thumb_func_start sub_811A444
sub_811A444: @ 811A444
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r5, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	str r2, [sp]
	mov r2, sp
	strb r0, [r2, 0x4]
	mov r0, sp
	strb r1, [r0, 0x5]
	strb r3, [r0, 0x6]
	strb r5, [r0, 0x7]
	strb r3, [r0, 0x8]
	strb r5, [r0, 0x9]
	ldrb r1, [r2, 0xC]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0xC]
	ldr r2, _0811A490 @ =gTextFlags
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	cmp r4, 0x6
	bls _0811A486
	b _0811A5D2
_0811A486:
	lsls r0, r4, 2
	ldr r1, _0811A494 @ =_0811A498
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811A490: .4byte gTextFlags
_0811A494: .4byte _0811A498
	.align 2, 0
_0811A498:
	.4byte _0811A4B4
	.4byte _0811A4E0
	.4byte _0811A50C
	.4byte _0811A538
	.4byte _0811A564
	.4byte _0811A590
	.4byte _0811A5A8
_0811A4B4:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x30
	b _0811A5CE
_0811A4E0:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x50
	b _0811A5CE
_0811A50C:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x60
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x70
	b _0811A5CE
_0811A538:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x30
	b _0811A5CE
_0811A564:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0xC]
	ldrb r1, [r2, 0xD]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0xD]
	ands r0, r3
	movs r1, 0x30
	b _0811A5CE
_0811A590:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r4, 0xF
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x70
	b _0811A5BE
_0811A5A8:
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r4, 0xF
	movs r3, 0xF
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0xE0
_0811A5BE:
	orrs r0, r1
	strb r0, [r2, 0xC]
	mov r1, sp
	ldrb r0, [r1, 0xD]
	orrs r0, r4
	strb r0, [r1, 0xD]
	ands r0, r3
	movs r1, 0x90
_0811A5CE:
	orrs r0, r1
	strb r0, [r2, 0xD]
_0811A5D2:
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0
	bl AddTextPrinter
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811A444

	thumb_func_start sub_811A5E4
sub_811A5E4: @ 811A5E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _0811A63C
	ldr r2, _0811A64C @ =gUnknown_8457034
	mov r8, r2
	movs r5, 0
	mov r9, r5
	movs r6, 0x4
	negs r6, r6
	mov r12, r6
	adds r2, r0, 0
	adds r2, 0x18
	adds r4, r0, 0
	movs r7, 0xFF
	mov r10, r7
	adds r3, r1, 0
_0811A610:
	adds r1, r4, 0
	mov r0, r8
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	mov r0, r10
	strh r0, [r2]
	ldrb r1, [r2, 0x2]
	mov r0, r12
	ands r0, r1
	movs r1, 0x5
	negs r1, r1
	ands r0, r1
	strb r0, [r2, 0x2]
	mov r5, r9
	strb r5, [r2, 0x3]
	adds r2, 0x20
	adds r4, 0x20
	subs r3, 0x1
	cmp r3, 0
	bne _0811A610
_0811A63C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A64C: .4byte gUnknown_8457034
	thumb_func_end sub_811A5E4

	thumb_func_start sub_811A650
sub_811A650: @ 811A650
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _0811A690 @ =gUnknown_8457034
	mov r12, r1
	movs r5, 0x2
	negs r5, r5
	mov r8, r5
	adds r2, r0, 0
	adds r2, 0x18
	adds r3, r0, 0
	movs r4, 0x3
_0811A668:
	adds r1, r3, 0
	mov r0, r12
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	strb r0, [r2]
	adds r2, 0x1C
	adds r3, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _0811A668
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A690: .4byte gUnknown_8457034
	thumb_func_end sub_811A650

	thumb_func_start sub_811A694
sub_811A694: @ 811A694
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r2, 0
	adds r4, r5, 0x2
	adds r3, r6, 0x2
_0811A6A0:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0811A6C8
	adds r2, 0x1
	cmp r2, 0x1
	ble _0811A6A0
	movs r2, 0
	adds r4, r5, 0
	adds r4, 0x10
	adds r3, r6, 0
	adds r3, 0x10
_0811A6BC:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0811A6CC
_0811A6C8:
	movs r0, 0x1
	b _0811A6D4
_0811A6CC:
	adds r2, 0x1
	cmp r2, 0x7
	ble _0811A6BC
	movs r0, 0
_0811A6D4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_811A694

	thumb_func_start sub_811A6DC
sub_811A6DC: @ 811A6DC
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r3, [r5, 0xA]
	movs r0, 0x7F
	ldrb r2, [r6, 0xA]
	adds r1, r0, 0
	ands r1, r3
	ands r0, r2
	cmp r1, r0
	bne _0811A740
	movs r0, 0x80
	adds r1, r0, 0
	ands r1, r3
	ands r0, r2
	cmp r1, r0
	bne _0811A740
	movs r2, 0
	adds r4, r5, 0x4
	adds r3, r6, 0x4
_0811A704:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0811A740
	adds r2, 0x1
	cmp r2, 0x3
	ble _0811A704
	ldrh r2, [r5, 0x8]
	ldr r0, _0811A73C @ =0x000003ff
	ldrh r3, [r6, 0x8]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _0811A740
	ldrb r2, [r5, 0x9]
	movs r0, 0xFC
	ldrb r3, [r6, 0x9]
	adds r1, r0, 0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _0811A740
	movs r0, 0
	b _0811A742
	.align 2, 0
_0811A73C: .4byte 0x000003ff
_0811A740:
	movs r0, 0x1
_0811A742:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_811A6DC

	thumb_func_start sub_811A748
sub_811A748: @ 811A748
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, 0xFF
	movs r6, 0
	adds r4, r1, 0
	adds r4, 0x18
	adds r5, r1, 0
_0811A75A:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811A782
	mov r0, r8
	adds r1, r5, 0
	bl sub_811A694
	lsls r0, 24
	cmp r0, 0
	bne _0811A782
	lsls r0, r6, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
	movs r2, 0x2
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4]
_0811A782:
	adds r4, 0x1C
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _0811A75A
	adds r0, r7, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811A748

	thumb_func_start sub_811A798
sub_811A798: @ 811A798
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r3, r0, 0
	mov r8, r1
	lsls r2, 24
	lsrs r6, r2, 24
	ldrb r1, [r1, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811A80C
	movs r5, 0
	cmp r5, r6
	bge _0811A80C
	movs r0, 0x4
	negs r0, r0
	mov r9, r0
	movs r1, 0x2
	negs r1, r1
	mov r12, r1
	adds r2, r3, 0
	adds r2, 0x18
	adds r1, r3, 0
_0811A7CA:
	ldrb r0, [r2, 0x2]
	movs r3, 0x3
	ands r3, r0
	cmp r3, 0
	bne _0811A802
	mov r0, r8
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	strh r3, [r2]
	ldrb r1, [r2, 0x2]
	mov r0, r9
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x2]
	movs r0, 0x40
	strb r0, [r2, 0x3]
	mov r0, r8
	ldrb r1, [r0, 0x18]
	mov r0, r12
	ands r0, r1
	mov r1, r8
	strb r0, [r1, 0x18]
	lsls r0, r5, 24
	lsrs r0, 24
	b _0811A80E
_0811A802:
	adds r2, 0x20
	adds r1, 0x20
	adds r5, 0x1
	cmp r5, r6
	blt _0811A7CA
_0811A80C:
	movs r0, 0xFF
_0811A80E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811A798

	thumb_func_start sub_811A81C
sub_811A81C: @ 811A81C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	adds r4, r1, 0
	adds r5, r3, 0
	ldr r3, [sp, 0x50]
	ldr r1, [sp, 0x54]
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0811A904 @ =gStringVar4
	mov r8, r0
	adds r1, 0x1
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r1, _0811A908 @ =gUnknown_84571B0
	mov r0, r8
	bl StringAppend
	str r6, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0
	mov r2, r8
	adds r3, r4, 0
	bl sub_811A444
	adds r4, 0x12
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	ldrb r0, [r5, 0xA]
	lsls r0, 25
	lsrs r2, r0, 25
	ldrb r1, [r5, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0811A8F2
	movs r0, 0x40
	ands r2, r0
	cmp r2, 0
	bne _0811A8F2
	add r4, sp, 0x10
	adds r1, r5, 0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldrb r1, [r5]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	str r6, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0x2
	adds r2, r4, 0
	mov r3, r9
	bl sub_811A444
	ldrb r1, [r5, 0x2]
	ldrb r0, [r5, 0x3]
	lsls r0, 8
	orrs r1, r0
	add r0, sp, 0x8
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r1, _0811A90C @ =gUnknown_84571B4
	mov r0, r8
	bl StringCopy
	mov r0, r8
	add r1, sp, 0x8
	bl StringAppend
	mov r3, r9
	adds r3, 0x4D
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0
	mov r2, r8
	bl sub_811A444
_0811A8F2:
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A904: .4byte gStringVar4
_0811A908: .4byte gUnknown_84571B0
_0811A90C: .4byte gUnknown_84571B4
	thumb_func_end sub_811A81C

	thumb_func_start sub_811A910
sub_811A910: @ 811A910
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x30
	adds r5, r3, 0
	ldr r3, [sp, 0x4C]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r7, r3, 24
	ldrb r1, [r5, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _0811A9A2
	add r4, sp, 0x10
	adds r1, r5, 0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldrb r1, [r5]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	mov r0, r8
	str r0, [sp]
	str r7, [sp, 0x4]
	mov r0, r9
	movs r1, 0x2
	adds r2, r4, 0
	adds r3, r6, 0
	bl sub_811A444
	ldrb r1, [r5, 0x2]
	ldrb r0, [r5, 0x3]
	lsls r0, 8
	orrs r1, r0
	add r0, sp, 0x8
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r4, _0811A9B0 @ =gStringVar4
	ldr r1, _0811A9B4 @ =gUnknown_84571B4
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	add r1, sp, 0x8
	bl StringAppend
	adds r3, r6, 0
	adds r3, 0x47
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	str r0, [sp]
	str r7, [sp, 0x4]
	mov r0, r9
	movs r1, 0
	adds r2, r4, 0
	bl sub_811A444
_0811A9A2:
	add sp, 0x30
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A9B0: .4byte gStringVar4
_0811A9B4: .4byte gUnknown_84571B4
	thumb_func_end sub_811A910

	thumb_func_start sub_811A9B8
sub_811A9B8: @ 811A9B8
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x9
	bne _0811A9F0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _0811A9F0
	ldr r0, _0811A9EC @ =gPlayerAvatar
	ldrb r0, [r0, 0x3]
	cmp r0, 0x2
	beq _0811A9E6
	cmp r0, 0
	bne _0811A9F0
_0811A9E6:
	movs r0, 0x1
	b _0811A9F2
	.align 2, 0
_0811A9EC: .4byte gPlayerAvatar
_0811A9F0:
	movs r0, 0
_0811A9F2:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811A9B8

	thumb_func_start sub_811A9FC
sub_811A9FC: @ 811A9FC
	push {lr}
	cmp r0, 0x4
	beq _0811AA14
	cmp r0, 0x4
	ble _0811AA1C
	cmp r0, 0x5
	beq _0811AA10
	cmp r0, 0x8
	beq _0811AA18
	b _0811AA1C
_0811AA10:
	movs r0, 0x1
	b _0811AA1E
_0811AA14:
	movs r0, 0x2
	b _0811AA1E
_0811AA18:
	movs r0, 0x3
	b _0811AA1E
_0811AA1C:
	movs r0, 0
_0811AA1E:
	pop {r1}
	bx r1
	thumb_func_end sub_811A9FC

	thumb_func_start sub_811AA24
sub_811AA24: @ 811AA24
	push {r4,lr}
	sub sp, 0x20
	adds r4, r0, 0
	adds r1, r4, 0
	adds r1, 0x10
	mov r0, sp
	bl StringCopy
	ldrb r1, [r4]
	lsls r1, 28
	lsrs r1, 28
	mov r0, sp
	bl ConvertInternationalString
	adds r4, 0x2
	adds r0, r4, 0
	bl sub_8118658
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	bl sub_80FD338
	add sp, 0x20
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811AA24

	thumb_func_start sub_811AA5C
sub_811AA5C: @ 811AA5C
	push {r4-r7,lr}
	adds r7, r3, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 19
	adds r5, r0, r2
	ldrb r1, [r5, 0xA]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811AAE4
	cmp r6, 0
	bne _0811AAE4
	ldr r4, _0811AAC4 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldrb r1, [r5]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	adds r0, r5, 0x2
	bl sub_8118658
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl sub_80FD338
	adds r2, r0, 0
	ldrb r1, [r5, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	bne _0811AAD0
	ldr r0, _0811AAC8 @ =gStringVar4
	ldr r3, _0811AACC @ =gUnknown_8457F80
	lsls r1, r7, 2
	lsls r2, 3
	adds r1, r2
	adds r1, r3
	ldr r1, [r1]
	bl StringExpandPlaceholders
	movs r0, 0x2
	b _0811ABD2
	.align 2, 0
_0811AAC4: .4byte gStringVar1
_0811AAC8: .4byte gStringVar4
_0811AACC: .4byte gUnknown_8457F80
_0811AAD0:
	ldr r0, _0811AAE0 @ =gUnknown_8457A34
	lsls r1, r2, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_811A0B4
	movs r0, 0x1
	b _0811ABD2
	.align 2, 0
_0811AAE0: .4byte gUnknown_8457A34
_0811AAE4:
	ldr r4, _0811AB24 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x10
	adds r0, r4, 0
	bl StringCopy
	ldrb r1, [r5]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl ConvertInternationalString
	cmp r6, 0
	beq _0811AB0A
	adds r0, r5, r6
	ldrb r0, [r0, 0x3]
	lsrs r7, r0, 3
	movs r0, 0x1
	ands r7, r0
_0811AB0A:
	ldrb r0, [r5, 0xA]
	lsls r0, 25
	lsrs r0, 25
	movs r1, 0x3F
	ands r1, r0
	cmp r1, 0x4
	beq _0811AB58
	cmp r1, 0x4
	bgt _0811AB28
	cmp r1, 0x1
	beq _0811AB32
	b _0811ABC8
	.align 2, 0
_0811AB24: .4byte gStringVar1
_0811AB28:
	cmp r1, 0x5
	beq _0811AB78
	cmp r1, 0x8
	beq _0811AB9C
	b _0811ABC8
_0811AB32:
	ldr r5, _0811AB50 @ =gStringVar4
	ldr r4, _0811AB54 @ =gUnknown_8458758
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 14
	lsls r0, r7, 4
	adds r1, r0
	adds r1, r4
	ldr r1, [r1]
	b _0811ABB6
	.align 2, 0
_0811AB50: .4byte gStringVar4
_0811AB54: .4byte gUnknown_8458758
_0811AB58:
	ldr r5, _0811AB70 @ =gStringVar4
	ldr r4, _0811AB74 @ =gUnknown_8458A78
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	lsls r1, r7, 4
	b _0811ABB0
	.align 2, 0
_0811AB70: .4byte gStringVar4
_0811AB74: .4byte gUnknown_8458A78
_0811AB78:
	ldr r5, _0811AB94 @ =gStringVar4
	ldr r4, _0811AB98 @ =gUnknown_84588BC
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 14
	lsls r0, r7, 4
	adds r1, r0
	adds r1, r4
	ldr r1, [r1]
	b _0811ABB6
	.align 2, 0
_0811AB94: .4byte gStringVar4
_0811AB98: .4byte gUnknown_84588BC
_0811AB9C:
	ldr r5, _0811ABC0 @ =gStringVar4
	ldr r4, _0811ABC4 @ =gUnknown_84589AC
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	lsls r1, r7, 3
_0811ABB0:
	adds r0, r1
	adds r0, r4
	ldr r1, [r0]
_0811ABB6:
	adds r0, r5, 0
	bl StringExpandPlaceholders
	b _0811ABD0
	.align 2, 0
_0811ABC0: .4byte gStringVar4
_0811ABC4: .4byte gUnknown_84589AC
_0811ABC8:
	ldr r0, _0811ABD8 @ =gStringVar4
	ldr r1, _0811ABDC @ =gUnknown_8457F90
	bl StringExpandPlaceholders
_0811ABD0:
	movs r0, 0
_0811ABD2:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811ABD8: .4byte gStringVar4
_0811ABDC: .4byte gUnknown_8457F90
	thumb_func_end sub_811AA5C

	thumb_func_start nullsub_92
nullsub_92: @ 811ABE0
	bx lr
	thumb_func_end nullsub_92

	thumb_func_start sub_811ABE4
sub_811ABE4: @ 811ABE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r4, [sp, 0x28]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r4, 24
	lsrs r4, 24
	ldrh r0, [r2, 0x8]
	lsls r0, 22
	lsrs r0, 22
	mov r8, r0
	ldrb r0, [r2, 0x9]
	lsrs r7, r0, 2
	ldrb r0, [r2, 0xB]
	lsrs r0, 1
	mov r9, r0
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r3, 0
	movs r3, 0x8
	bl sub_811A444
	movs r0, 0xCE
	lsls r0, 1
	cmp r8, r0
	bne _0811AC3C
	ldr r2, _0811AC38 @ =gUnknown_8458FBC
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x2
	movs r3, 0x44
	bl sub_811A444
	b _0811AC90
	.align 2, 0
_0811AC38: .4byte gUnknown_8458FBC
_0811AC3C:
	adds r1, r7, 0x1
	adds r0, r6, 0
	movs r2, 0x44
	adds r3, r5, 0
	bl BlitMoveInfoIcon
	movs r0, 0xB
	mov r2, r8
	muls r2, r0
	ldr r0, _0811ACA0 @ =gSpeciesNames
	adds r2, r0
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x2
	movs r3, 0x76
	bl sub_811A444
	add r0, sp, 0x8
	mov r1, r9
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	add r1, sp, 0x8
	movs r2, 0
	bl GetStringWidth
	lsls r0, 16
	lsrs r0, 16
	movs r3, 0xDA
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	str r4, [sp, 0x4]
	adds r0, r6, 0
	movs r1, 0x2
	add r2, sp, 0x8
	bl sub_811A444
_0811AC90:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811ACA0: .4byte gSpeciesNames
	thumb_func_end sub_811ABE4

	thumb_func_start sub_811ACA4
sub_811ACA4: @ 811ACA4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r0, _0811ACF8 @ =gUnknown_203B05C
	ldr r6, [r0]
	movs r0, 0x3
	negs r0, r0
	cmp r4, r0
	bne _0811AD38
	ldr r0, _0811ACFC @ =gUnknown_8456F7C
	ldrb r0, [r0, 0x14]
	lsls r0, 28
	lsrs r0, 28
	cmp r8, r0
	bne _0811AD38
	bl sub_80F9800
	adds r2, r0, 0
	ldrh r1, [r2, 0x8]
	ldr r0, _0811AD00 @ =0x000003ff
	ands r0, r1
	cmp r0, 0
	beq _0811AD6C
	ldr r0, _0811AD04 @ =gSaveBlock2Ptr
	ldr r3, [r0]
	movs r0, 0x5
	str r0, [sp]
	mov r0, r9
	mov r1, r8
	bl sub_811ABE4
	b _0811AD6C
	.align 2, 0
_0811ACF8: .4byte gUnknown_203B05C
_0811ACFC: .4byte gUnknown_8456F7C
_0811AD00: .4byte 0x000003ff
_0811AD04: .4byte gSaveBlock2Ptr
_0811AD08:
	mov r0, r12
	adds r1, r0, r4
	adds r1, 0x10
	add r0, sp, 0x4
	bl StringCopy
	ldr r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	add r0, sp, 0x4
	bl ConvertInternationalString
	ldr r2, [r6]
	adds r2, r4
	movs r0, 0x6
	str r0, [sp]
	mov r0, r9
	mov r1, r8
	add r3, sp, 0x4
	bl sub_811ABE4
	b _0811AD6C
_0811AD38:
	movs r5, 0
	movs r1, 0
	ldr r0, [r6]
	mov r12, r0
	mov r2, r12
	adds r2, 0x8
	movs r3, 0
	adds r7, r4, 0x1
_0811AD48:
	ldrb r0, [r2, 0x12]
	lsls r0, 30
	lsrs r0, 30
	adds r4, r3, 0
	cmp r0, 0x1
	bne _0811AD5E
	ldrh r0, [r2]
	lsls r0, 22
	cmp r0, 0
	beq _0811AD5E
	adds r5, 0x1
_0811AD5E:
	cmp r5, r7
	beq _0811AD08
	adds r2, 0x20
	adds r3, 0x20
	adds r1, 0x1
	cmp r1, 0x7
	ble _0811AD48
_0811AD6C:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811ACA4

	thumb_func_start sub_811AD7C
sub_811AD7C: @ 811AD7C
	push {r4-r7,lr}
	movs r4, 0
	movs r3, 0
	movs r7, 0x3
	ldr r6, _0811ADAC @ =0x000003ff
	adds r2, r0, 0
	adds r2, 0x8
	adds r5, r1, 0x1
_0811AD8C:
	ldrb r1, [r2, 0x12]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0x1
	bne _0811ADA2
	ldrh r1, [r2]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _0811ADA2
	adds r4, 0x1
_0811ADA2:
	cmp r4, r5
	bne _0811ADB0
	adds r0, r3, 0
	b _0811ADBC
	.align 2, 0
_0811ADAC: .4byte 0x000003ff
_0811ADB0:
	adds r2, 0x20
	adds r3, 0x1
	cmp r3, 0x7
	ble _0811AD8C
	movs r0, 0x1
	negs r0, r0
_0811ADBC:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811AD7C

	thumb_func_start sub_811ADC4
sub_811ADC4: @ 811ADC4
	lsls r0, 5
	adds r0, r1
	ldrb r0, [r0, 0xB]
	lsls r0, 31
	lsrs r0, 31
	bx lr
	thumb_func_end sub_811ADC4

	thumb_func_start sub_811ADD0
sub_811ADD0: @ 811ADD0
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _0811AE10
	movs r4, 0
	b _0811ADFA
_0811ADE0:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0811AE08 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _0811AE40
	adds r4, 0x1
_0811ADFA:
	ldr r0, _0811AE0C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	blt _0811ADE0
	movs r0, 0x2
	b _0811AE5C
	.align 2, 0
_0811AE08: .4byte gPlayerParty
_0811AE0C: .4byte gPlayerPartyCount
_0811AE10:
	movs r4, 0
	ldr r0, _0811AE44 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bge _0811AE5A
	ldr r6, _0811AE48 @ =gBaseStats
_0811AE1C:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0811AE4C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r6
	ldrb r0, [r1, 0x6]
	cmp r0, r5
	beq _0811AE40
	ldrb r0, [r1, 0x7]
	cmp r0, r5
	bne _0811AE50
_0811AE40:
	movs r0, 0
	b _0811AE5C
	.align 2, 0
_0811AE44: .4byte gPlayerPartyCount
_0811AE48: .4byte gBaseStats
_0811AE4C: .4byte gPlayerParty
_0811AE50:
	adds r4, 0x1
	ldr r0, _0811AE64 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	blt _0811AE1C
_0811AE5A:
	movs r0, 0x1
_0811AE5C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811AE64: .4byte gPlayerPartyCount
	thumb_func_end sub_811ADD0

	thumb_func_start sub_811AE68
sub_811AE68: @ 811AE68
	push {lr}
	adds r3, r0, 0
	cmp r1, 0x44
	beq _0811AEA4
	cmp r1, 0x44
	bgt _0811AE7A
	cmp r1, 0x41
	beq _0811AE84
	b _0811AEC2
_0811AE7A:
	cmp r1, 0x45
	beq _0811AE94
	cmp r1, 0x48
	beq _0811AEB4
	b _0811AEC2
_0811AE84:
	ldr r0, _0811AE90 @ =gUnknown_8458314
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	b _0811AEA6
	.align 2, 0
_0811AE90: .4byte gUnknown_8458314
_0811AE94:
	ldr r0, _0811AEA0 @ =gUnknown_84585E8
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	b _0811AEA6
	.align 2, 0
_0811AEA0: .4byte gUnknown_84585E8
_0811AEA4:
	ldr r1, _0811AEB0 @ =gUnknown_8458F9C
_0811AEA6:
	adds r0, r3, 0
	bl StringExpandPlaceholders
	b _0811AEC2
	.align 2, 0
_0811AEB0: .4byte gUnknown_8458F9C
_0811AEB4:
	ldr r0, _0811AEC8 @ =gUnknown_84583B4
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r3, 0
	bl StringExpandPlaceholders
_0811AEC2:
	pop {r0}
	bx r0
	.align 2, 0
_0811AEC8: .4byte gUnknown_84583B4
	thumb_func_end sub_811AE68

	thumb_func_start sub_811AECC
sub_811AECC: @ 811AECC
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r6, r4, 0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _0811AF00 @ =gLinkPlayers
	movs r0, 0x1
	adds r1, r3, 0
	eors r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	cmp r4, 0x44
	beq _0811AF20
	cmp r4, 0x44
	bgt _0811AF04
	cmp r4, 0x41
	beq _0811AF0A
	b _0811AF60
	.align 2, 0
_0811AF00: .4byte gLinkPlayers
_0811AF04:
	cmp r6, 0x45
	beq _0811AF44
	b _0811AF60
_0811AF0A:
	ldr r2, _0811AF1C @ =gUnknown_8458230
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r1, r0
	b _0811AF32
	.align 2, 0
_0811AF1C: .4byte gUnknown_8458230
_0811AF20:
	ldr r2, _0811AF40 @ =gUnknown_8458230
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r1, r0
	adds r2, 0x8
_0811AF32:
	adds r1, r2
	ldr r1, [r1]
	adds r0, r5, 0
	bl StringCopy
	b _0811AF60
	.align 2, 0
_0811AF40: .4byte gUnknown_8458230
_0811AF44:
	ldr r2, _0811AF68 @ =gUnknown_8458230
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r1, r0
	adds r2, 0x4
	adds r1, r2
	ldr r1, [r1]
	adds r0, r5, 0
	bl StringCopy
_0811AF60:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811AF68: .4byte gUnknown_8458230
	thumb_func_end sub_811AECC

	thumb_func_start sub_811AF6C
sub_811AF6C: @ 811AF6C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r5, r2, 0
	adds r6, r3, 0
	movs r2, 0
	mov r8, r2
	ldrh r0, [r5]
	subs r0, 0x40
	cmp r0, 0x8
	bls _0811AF86
	b _0811B092
_0811AF86:
	lsls r0, 2
	ldr r1, _0811AF90 @ =_0811AF94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811AF90: .4byte _0811AF94
	.align 2, 0
_0811AF94:
	.4byte _0811B088
	.4byte _0811AFB8
	.4byte _0811B092
	.4byte _0811B092
	.4byte _0811AFC8
	.4byte _0811AFC0
	.4byte _0811B092
	.4byte _0811B092
	.4byte _0811B078
_0811AFB8:
	ldr r1, _0811AFBC @ =gUnknown_8457CA4
	b _0811B07A
	.align 2, 0
_0811AFBC: .4byte gUnknown_8457CA4
_0811AFC0:
	ldr r1, _0811AFC4 @ =gUnknown_8457CF8
	b _0811B07A
	.align 2, 0
_0811AFC4: .4byte gUnknown_8457CF8
_0811AFC8:
	adds r0, r6, 0
	adds r0, 0x58
	ldr r4, _0811AFF0 @ =gUnknown_203B06C
	ldrh r1, [r4, 0xC]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	adds r0, 0x63
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _0811AFF4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	movs r4, 0
	b _0811AFFA
	.align 2, 0
_0811AFF0: .4byte gUnknown_203B06C
_0811AFF4: .4byte gSpeciesNames
_0811AFF8:
	adds r4, 0x1
_0811AFFA:
	cmp r4, 0x3
	bgt _0811B030
	ldr r0, _0811B044 @ =gRfuLinkStatus
	ldr r0, [r0]
	lsls r1, r4, 5
	adds r0, r1
	ldrh r0, [r0, 0x18]
	cmp r0, 0x2
	bne _0811AFF8
	ldrh r1, [r5, 0x4]
	adds r0, r6, 0
	adds r0, 0x6E
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldrh r1, [r5, 0x2]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _0811B048 @ =gSpeciesNames
	adds r1, r0
	adds r0, r6, 0
	adds r0, 0x79
	bl StringCopy
	ldrh r5, [r5, 0x2]
	mov r8, r5
_0811B030:
	movs r0, 0xCE
	lsls r0, 1
	cmp r8, r0
	bne _0811B050
	ldr r1, _0811B04C @ =gUnknown_8457DB8
	adds r0, r7, 0
	bl StringCopy
	b _0811B080
	.align 2, 0
_0811B044: .4byte gRfuLinkStatus
_0811B048: .4byte gSpeciesNames
_0811B04C: .4byte gUnknown_8457DB8
_0811B050:
	movs r4, 0
	adds r5, r6, 0
	adds r5, 0x58
_0811B056:
	lsls r0, r4, 24
	lsrs r0, 24
	adds r1, r5, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	adds r5, 0xB
	adds r4, 0x1
	cmp r4, 0x3
	ble _0811B056
	ldr r1, _0811B074 @ =gUnknown_8457D44
	adds r0, r7, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _0811B080
	.align 2, 0
_0811B074: .4byte gUnknown_8457D44
_0811B078:
	ldr r1, _0811B084 @ =gUnknown_8457C48
_0811B07A:
	adds r0, r7, 0
	bl StringExpandPlaceholders
_0811B080:
	movs r2, 0x1
	b _0811B092
	.align 2, 0
_0811B084: .4byte gUnknown_8457C48
_0811B088:
	ldr r1, _0811B0A0 @ =gUnknown_8457E0C
	adds r0, r7, 0
	bl StringExpandPlaceholders
	movs r2, 0x2
_0811B092:
	adds r0, r2, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B0A0: .4byte gUnknown_8457E0C
	thumb_func_end sub_811AF6C

	thumb_func_start sub_811B0A4
sub_811B0A4: @ 811B0A4
	push {lr}
	adds r2, r0, 0
	ldr r0, _0811B0C4 @ =gRecvCmds
	ldrh r1, [r0, 0x2]
	cmp r1, 0
	beq _0811B0C8
	cmp r1, 0x51
	beq _0811B0B8
	cmp r1, 0x52
	bne _0811B0C8
_0811B0B8:
	adds r0, r2, 0
	adds r0, 0x84
	strh r1, [r0]
	movs r0, 0x1
	b _0811B0CA
	.align 2, 0
_0811B0C4: .4byte gRecvCmds
_0811B0C8:
	movs r0, 0
_0811B0CA:
	pop {r1}
	bx r1
	thumb_func_end sub_811B0A4

	thumb_func_start InUnionRoom
InUnionRoom: @ 811B0D0
	push {lr}
	movs r2, 0
	ldr r0, _0811B0EC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0811B0E4
	movs r2, 0x1
_0811B0E4:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811B0EC: .4byte gSaveBlock1Ptr
	thumb_func_end InUnionRoom

	thumb_func_start sub_811B0F0
sub_811B0F0: @ 811B0F0
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	ldr r0, _0811B138 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r6, r0
	bge _0811B130
_0811B0FE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0811B13C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x1E
	bhi _0811B126
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0811B126
	adds r6, 0x1
_0811B126:
	adds r5, 0x1
	ldr r0, _0811B138 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0811B0FE
_0811B130:
	cmp r6, 0x1
	bgt _0811B140
	movs r0, 0
	b _0811B142
	.align 2, 0
_0811B138: .4byte gPlayerPartyCount
_0811B13C: .4byte gPlayerParty
_0811B140:
	movs r0, 0x1
_0811B142:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_811B0F0

	thumb_func_start sub_811B148
sub_811B148: @ 811B148
	movs r1, 0
	strh r1, [r0]
	strh r1, [r0, 0x2]
	str r1, [r0, 0x4]
	strh r1, [r0, 0xA]
	strh r1, [r0, 0xC]
	strh r1, [r0, 0xE]
	strh r1, [r0, 0x10]
	str r1, [r0, 0x14]
	bx lr
	thumb_func_end sub_811B148

	thumb_func_start Script_ResetUnionRoomTrade
Script_ResetUnionRoomTrade: @ 811B15C
	push {lr}
	ldr r0, _0811B168 @ =gUnknown_203B06C
	bl sub_811B148
	pop {r0}
	bx r0
	.align 2, 0
_0811B168: .4byte gUnknown_203B06C
	thumb_func_end Script_ResetUnionRoomTrade

	thumb_func_start sub_811B16C
sub_811B16C: @ 811B16C
	push {r4,r5,lr}
	adds r5, r1, 0
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _0811B1A8 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	strh r0, [r5, 0xA]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	strh r0, [r5, 0xC]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x4]
	ldrh r1, [r5, 0xA]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _0811B1AC
	movs r0, 0
	b _0811B1AE
	.align 2, 0
_0811B1A8: .4byte gPlayerParty
_0811B1AC:
	movs r0, 0x1
_0811B1AE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811B16C

	thumb_func_start sub_811B1B4
sub_811B1B4: @ 811B1B4
	push {r4,r5,lr}
	adds r5, r1, 0
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _0811B1E8 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	strh r0, [r5, 0xE]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	strh r0, [r5, 0x10]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x14]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B1E8: .4byte gPlayerParty
	thumb_func_end sub_811B1B4

	thumb_func_start sub_811B1EC
sub_811B1EC: @ 811B1EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 24
	movs r2, 0
	mov r8, r2
	cmp r1, 0
	bne _0811B20A
	ldrh r7, [r0, 0xA]
	ldr r6, [r0, 0x4]
	b _0811B20E
_0811B202:
	lsls r0, r5, 16
	lsrs r0, 16
	mov r8, r0
	b _0811B242
_0811B20A:
	ldrh r7, [r0, 0xE]
	ldr r6, [r0, 0x14]
_0811B20E:
	movs r5, 0
	b _0811B23A
_0811B212:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0811B250 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	cmp r0, r6
	bne _0811B238
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	beq _0811B202
_0811B238:
	adds r5, 0x1
_0811B23A:
	ldr r0, _0811B254 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0811B212
_0811B242:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B250: .4byte gPlayerParty
_0811B254: .4byte gPlayerPartyCount
	thumb_func_end sub_811B1EC

	thumb_func_start sub_811B258
sub_811B258: @ 811B258
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811A3F8
	bl ScriptContext2_Disable
	bl sub_80696F0
	ldr r1, _0811B290 @ =gUnknown_203B058
	movs r0, 0
	strb r0, [r1]
	cmp r4, 0
	beq _0811B288
	ldr r2, _0811B294 @ =gUnknown_203B06C
	ldrh r0, [r2, 0x2]
	ldrh r1, [r2, 0xA]
	ldrh r2, [r2, 0xC]
	bl sub_80FAFA0
	movs r0, 0x40
	movs r1, 0
	movs r2, 0
	bl sub_80FB008
_0811B288:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811B290: .4byte gUnknown_203B058
_0811B294: .4byte gUnknown_203B06C
	thumb_func_end sub_811B258

	thumb_func_start sub_811B298
sub_811B298: @ 811B298
	push {lr}
	bl ScriptContext2_Enable
	bl ScriptFreezeObjectEvents
	pop {r0}
	bx r0
	thumb_func_end sub_811B298

	thumb_func_start sub_811B2A8
sub_811B2A8: @ 811B2A8
	push {r4,lr}
	movs r4, 0x80
	ldr r3, _0811B2D4 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r1, r3
	ldrb r2, [r0, 0x13]
	lsls r2, 3
	orrs r2, r4
	adds r3, 0x4
	adds r1, r3
	ldr r0, [r1]
	movs r1, 0x7
	ands r0, r1
	orrs r0, r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B2D4: .4byte gLinkPlayers
	thumb_func_end sub_811B2A8

	thumb_func_start sub_811B2D8
sub_811B2D8: @ 811B2D8
	push {r4,lr}
	movs r3, 0x80
	movs r2, 0
	ldr r4, [r0, 0xC]
_0811B2E0:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r1, r4, r0
	ldrb r0, [r1, 0x18]
	lsls r0, 31
	cmp r0, 0
	beq _0811B308
	ldrb r0, [r1, 0xB]
	lsls r0, 31
	lsrs r0, 31
	lsls r0, 3
	orrs r3, r0
	ldrb r1, [r1, 0x2]
	movs r0, 0x7
	ands r0, r1
	orrs r3, r0
	lsls r0, r3, 24
	lsrs r3, r0, 24
	b _0811B312
_0811B308:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0811B2E0
_0811B312:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811B2D8

	thumb_func_start sub_811B31C
sub_811B31C: @ 811B31C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 5
	ldr r0, _0811B4B0 @ =gTrainerCards
	adds r1, r0
	mov r8, r1
	bl DynamicPlaceholderTextUtil_Reset
	mov r6, r9
	adds r6, 0xAC
	bl sub_80447F0
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _0811B4B4 @ =gTrainerClassNames
	adds r1, r0
	adds r0, r6, 0
	bl StringCopy
	movs r0, 0
	adds r1, r6, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r1, r8
	adds r1, 0x30
	movs r0, 0x1
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r4, 0xB0
	lsls r4, 1
	add r4, r9
	ldr r1, _0811B4B8 @ =gUnknown_84594B0
	mov r2, r8
	ldrb r0, [r2, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0x2
	adds r1, r4, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r5, r9
	adds r5, 0xCA
	mov r0, r8
	ldrh r1, [r0, 0xC]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x3
	adds r1, r5, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r2, 0xD9
	add r2, r9
	mov r10, r2
	mov r0, r8
	ldrh r1, [r0, 0x10]
	mov r0, r10
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r4, r9
	adds r4, 0xE8
	mov r2, r8
	ldrh r1, [r2, 0x12]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	mov r1, r10
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, 0x5
	adds r1, r4, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r4, 0xC8
	lsls r4, 1
	add r4, r9
	ldr r1, _0811B4BC @ =gUnknown_84594C4
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r0, _0811B4C0 @ =gStringVar4
	adds r1, r4, 0
	bl StringCopy
	mov r0, r8
	ldrh r1, [r0, 0x14]
	ldr r4, _0811B4C4 @ =0x0000270f
	cmp r1, r4
	ble _0811B40A
	adds r1, r4, 0
_0811B40A:
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r0, 0
	adds r1, r6, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r2, r8
	ldrh r1, [r2, 0x16]
	cmp r1, r4
	ble _0811B426
	adds r1, r4, 0
_0811B426:
	mov r4, r9
	adds r4, 0xBB
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	mov r0, r8
	ldrh r1, [r0, 0x20]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	movs r0, 0x3
	adds r1, r5, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r7, 0
	movs r6, 0x80
	lsls r6, 19
	mov r5, r8
	adds r5, 0x28
	mov r4, r10
_0811B45E:
	ldrh r1, [r5]
	adds r0, r4, 0
	bl CopyEasyChatWord
	lsrs r0, r6, 24
	adds r1, r4, 0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r2, 0x80
	lsls r2, 17
	adds r6, r2
	adds r5, 0x2
	adds r4, 0xF
	adds r7, 0x1
	cmp r7, 0x3
	ble _0811B45E
	movs r4, 0xC8
	lsls r4, 1
	add r4, r9
	ldr r1, _0811B4C8 @ =gUnknown_8459504
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r5, _0811B4C0 @ =gStringVar4
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
	ldr r0, [sp]
	cmp r0, 0x1
	bne _0811B4D0
	ldr r1, _0811B4CC @ =gUnknown_8459588
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
	b _0811B4F0
	.align 2, 0
_0811B4B0: .4byte gTrainerCards
_0811B4B4: .4byte gTrainerClassNames
_0811B4B8: .4byte gUnknown_84594B0
_0811B4BC: .4byte gUnknown_84594C4
_0811B4C0: .4byte gStringVar4
_0811B4C4: .4byte 0x0000270f
_0811B4C8: .4byte gUnknown_8459504
_0811B4CC: .4byte gUnknown_8459588
_0811B4D0:
	ldr r2, [sp]
	cmp r2, 0
	bne _0811B4F0
	ldr r0, _0811B500 @ =gUnknown_8459580
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r4, 0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringAppend
_0811B4F0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811B500: .4byte gUnknown_8459580
	thumb_func_end sub_811B31C

	.align 2, 0 @ Don't pad with nop.
