	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
	ldr r0, _081199EC @ =gQuestLogState
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
_081199EC: .4byte gQuestLogState
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
	bl ReadAsU16
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

	thumb_func_start PrintOnTextbox
PrintOnTextbox: @ 811A0F8
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
	thumb_func_end PrintOnTextbox

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
	bl ReadAsU16
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
	bl ReadAsU16
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
	ldr r4, _0811AFF0 @ =sUnionRoomTrade
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
_0811AFF0: .4byte sUnionRoomTrade
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

	thumb_func_start HasAtLeastTwoMonsOfLevel30OrLower
HasAtLeastTwoMonsOfLevel30OrLower: @ 811B0F0
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
	thumb_func_end HasAtLeastTwoMonsOfLevel30OrLower

	thumb_func_start ResetUnionRoomTrade
ResetUnionRoomTrade: @ 811B148
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
	thumb_func_end ResetUnionRoomTrade

	thumb_func_start Script_ResetUnionRoomTrade
Script_ResetUnionRoomTrade: @ 811B15C
	push {lr}
	ldr r0, _0811B168 @ =sUnionRoomTrade
	bl ResetUnionRoomTrade
	pop {r0}
	bx r0
	.align 2, 0
_0811B168: .4byte sUnionRoomTrade
	thumb_func_end Script_ResetUnionRoomTrade

	thumb_func_start RegisterTradeMonAndGetIsEgg
RegisterTradeMonAndGetIsEgg: @ 811B16C
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
	thumb_func_end RegisterTradeMonAndGetIsEgg

	thumb_func_start RegisterTradeMon
RegisterTradeMon: @ 811B1B4
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
	thumb_func_end RegisterTradeMon

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
	ldr r2, _0811B294 @ =sUnionRoomTrade
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
_0811B294: .4byte sUnionRoomTrade
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
