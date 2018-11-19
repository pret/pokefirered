	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8114AA0
sub_8114AA0: @ 8114AA0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x18
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114AC0
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08114AC2
_08114AC0:
	movs r0, 0
_08114AC2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114AA0

	thumb_func_start sub_8114AC8
sub_8114AC8: @ 8114AC8
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x18
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl QuestLog_AutoGetSpeciesName
	ldr r0, _08114B04 @ =gStringVar4
	ldr r1, _08114B08 @ =gUnknown_841A5FA
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114B04: .4byte gStringVar4
_08114B08: .4byte gUnknown_841A5FA
	thumb_func_end sub_8114AC8

	thumb_func_start sub_8114B0C
sub_8114B0C: @ 8114B0C
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x19
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114B2C
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08114B2E
_08114B2C:
	movs r0, 0
_08114B2E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114B0C

	thumb_func_start sub_8114B34
sub_8114B34: @ 8114B34
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x19
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl QuestLog_AutoGetSpeciesName
	ldr r0, _08114B70 @ =gStringVar4
	ldr r1, _08114B74 @ =gUnknown_841A632
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114B70: .4byte gStringVar4
_08114B74: .4byte gUnknown_841A632
	thumb_func_end sub_8114B34

	thumb_func_start sub_8114B78
sub_8114B78: @ 8114B78
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1A
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114B98
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08114B9A
_08114B98:
	movs r0, 0
_08114B9A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114B78

	thumb_func_start sub_8114BA0
sub_8114BA0: @ 8114BA0
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x1A
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0
	bl QuestLog_AutoGetSpeciesName
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114BDC @ =gStringVar4
	ldr r1, _08114BE0 @ =gUnknown_841A64F
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114BDC: .4byte gStringVar4
_08114BE0: .4byte gUnknown_841A64F
	thumb_func_end sub_8114BA0

	thumb_func_start sub_8114BE4
sub_8114BE4: @ 8114BE4
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1B
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114C04
	ldrb r0, [r4, 0x4]
	strb r0, [r2]
	ldrb r0, [r4, 0x5]
	strb r0, [r2, 0x1]
	adds r0, r2, 0x2
	b _08114C06
_08114C04:
	movs r0, 0
_08114C06:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114BE4

	thumb_func_start sub_8114C0C
sub_8114C0C: @ 8114C0C
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x1B
	bl sub_8113E88
	adds r4, r0, 0
	bl UnkTextUtil_Reset
	ldrb r0, [r4]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	cmp r0, r1
	bne _08114C40
	ldr r1, _08114C3C @ =gUnknown_841A694
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	b _08114C4E
	.align 2, 0
_08114C3C: .4byte gUnknown_841A694
_08114C40:
	ldrb r0, [r4, 0x1]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
_08114C4E:
	ldr r0, _08114C60 @ =gStringVar4
	ldr r1, _08114C64 @ =gUnknown_841A66E
	bl UnkTextUtil_StringExpandPlaceholders
	adds r0, r4, 0x2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114C60: .4byte gStringVar4
_08114C64: .4byte gUnknown_841A66E
	thumb_func_end sub_8114C0C

	thumb_func_start sub_8114C68
sub_8114C68: @ 8114C68
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1C
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114C84
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	b _08114C86
_08114C84:
	movs r0, 0
_08114C86:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114C68

	thumb_func_start sub_8114C8C
sub_8114C8C: @ 8114C8C
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x1C
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4]
	ldr r1, _08114CB4 @ =gStringVar1
	bl sub_8099E90
	ldr r0, _08114CB8 @ =gStringVar4
	ldr r1, _08114CBC @ =gUnknown_841A391
	bl StringExpandPlaceholders
	adds r4, 0x2
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114CB4: .4byte gStringVar1
_08114CB8: .4byte gStringVar4
_08114CBC: .4byte gUnknown_841A391
	thumb_func_end sub_8114C8C

	thumb_func_start sub_8114CC0
sub_8114CC0: @ 8114CC0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1D
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114CDC
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	b _08114CDE
_08114CDC:
	movs r0, 0
_08114CDE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114CC0

	thumb_func_start sub_8114CE4
sub_8114CE4: @ 8114CE4
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x1D
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4]
	ldr r1, _08114D0C @ =gStringVar1
	bl sub_8099E90
	ldr r0, _08114D10 @ =gStringVar4
	ldr r1, _08114D14 @ =gUnknown_841A3DA
	bl StringExpandPlaceholders
	adds r4, 0x2
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114D0C: .4byte gStringVar1
_08114D10: .4byte gStringVar4
_08114D14: .4byte gUnknown_841A3DA
	thumb_func_end sub_8114CE4

	thumb_func_start sub_8114D18
sub_8114D18: @ 8114D18
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	bl sub_8113DE0
	adds r1, r0, 0
	cmp r1, 0
	beq _08114D44
	ldrh r0, [r4, 0x2]
	strh r0, [r1]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x2]
	ldrh r0, [r4]
	strh r0, [r1, 0x4]
	ldrb r0, [r4, 0x7]
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x6]
	strb r0, [r1, 0x7]
	adds r0, r1, 0
	adds r0, 0x8
	b _08114D46
_08114D44:
	movs r0, 0
_08114D46:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114D18

	thumb_func_start sub_8114D4C
sub_8114D4C: @ 8114D4C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r1, _08114D64 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1E
	adds r1, r3, 0
	bl sub_8114D18
	pop {r1}
	bx r1
	.align 2, 0
_08114D64: .4byte gUnknown_203B048
	thumb_func_end sub_8114D4C

	thumb_func_start sub_8114D68
sub_8114D68: @ 8114D68
	push {r4-r6,lr}
	adds r1, r0, 0
	movs r0, 0x1E
	bl sub_8113E88
	adds r4, r0, 0
	adds r6, r4, 0x6
	bl UnkTextUtil_Reset
	ldr r5, _08114DD4 @ =gStringVar1
	ldrb r1, [r4, 0x6]
	adds r0, r5, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r5, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08114DD8 @ =gTrainers+0x4
	adds r1, r0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x2
	bl QuestLog_AutoGetSpeciesName
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x3
	bl QuestLog_AutoGetSpeciesName
	ldr r1, _08114DDC @ =gUnknown_8456ACC
	ldrb r0, [r6, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x4
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114DE0 @ =gStringVar4
	ldr r1, _08114DE4 @ =gUnknown_841AF0C
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08114DD4: .4byte gStringVar1
_08114DD8: .4byte gTrainers+0x4
_08114DDC: .4byte gUnknown_8456ACC
_08114DE0: .4byte gStringVar4
_08114DE4: .4byte gUnknown_841AF0C
	thumb_func_end sub_8114D68

	thumb_func_start sub_8114DE8
sub_8114DE8: @ 8114DE8
	push {r4-r6,lr}
	adds r6, r1, 0
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x8
	ldr r0, _08114E08 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x1F]
	adds r0, r4, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _08114E0C
	movs r0, 0
	b _08114E5E
	.align 2, 0
_08114E08: .4byte gUnknown_8456AA0
_08114E0C:
	ldrb r0, [r4, 0x8]
	cmp r0, 0
	bne _08114E22
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	bne _08114E22
	movs r0, 0x1F
	strh r0, [r4]
	ldr r0, _08114E64 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
_08114E22:
	ldrh r0, [r6]
	adds r2, r0, 0
	cmp r2, 0
	beq _08114E2C
	strh r0, [r4, 0x4]
_08114E2C:
	ldrh r0, [r6, 0x2]
	adds r1, r0, 0
	cmp r1, 0
	beq _08114E36
	strh r1, [r4, 0x6]
_08114E36:
	cmp r2, 0
	beq _08114E46
	ldrb r2, [r5]
	adds r0, r2, 0
	cmp r0, 0xFF
	beq _08114E46
	adds r0, r2, 0x1
	strb r0, [r5]
_08114E46:
	lsls r0, r1, 16
	cmp r0, 0
	beq _08114E58
	ldrb r1, [r5, 0x1]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08114E58
	adds r0, r1, 0x1
	strb r0, [r5, 0x1]
_08114E58:
	ldrb r0, [r6, 0x4]
	strb r0, [r5, 0x2]
	adds r0, r5, 0x4
_08114E5E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08114E64: .4byte gUnknown_203AF98
	thumb_func_end sub_8114DE8

	thumb_func_start sub_8114E68
sub_8114E68: @ 8114E68
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _08114E80 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x1F]
	adds r0, r5, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _08114E84
	movs r0, 0
	b _08114FAE
	.align 2, 0
_08114E80: .4byte gUnknown_8456AA0
_08114E84:
	adds r6, r5, 0
	adds r6, 0x8
	bl UnkTextUtil_Reset
	ldr r4, _08114F00 @ =gStringVar1
	ldrb r1, [r6, 0x2]
	adds r0, r4, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5, 0x4]
	movs r1, 0
	movs r2, 0x1
	bl QuestLog_AutoGetSpeciesName
	ldr r4, _08114F04 @ =gStringVar2
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5, 0x6]
	movs r1, 0
	movs r2, 0x3
	bl QuestLog_AutoGetSpeciesName
	ldr r4, _08114F08 @ =gStringVar3
	ldrb r1, [r6, 0x1]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114F0C @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0x5
	bl UnkTextUtil_SetPtrI
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	bne _08114F2C
	ldrb r0, [r6, 0x1]
	cmp r0, 0x1
	bne _08114F18
	ldr r0, _08114F10 @ =gStringVar4
	ldr r1, _08114F14 @ =gUnknown_841AA01
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F00: .4byte gStringVar1
_08114F04: .4byte gStringVar2
_08114F08: .4byte gStringVar3
_08114F0C: .4byte gSaveBlock2Ptr
_08114F10: .4byte gStringVar4
_08114F14: .4byte gUnknown_841AA01
_08114F18:
	ldr r0, _08114F24 @ =gStringVar4
	ldr r1, _08114F28 @ =gUnknown_841AA2B
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F24: .4byte gStringVar4
_08114F28: .4byte gUnknown_841AA2B
_08114F2C:
	ldrb r1, [r6, 0x1]
	cmp r1, 0
	bne _08114F5C
	cmp r0, 0x1
	bne _08114F48
	ldr r0, _08114F40 @ =gStringVar4
	ldr r1, _08114F44 @ =gUnknown_841A9A9
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F40: .4byte gStringVar4
_08114F44: .4byte gUnknown_841A9A9
_08114F48:
	ldr r0, _08114F54 @ =gStringVar4
	ldr r1, _08114F58 @ =gUnknown_841A9D4
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F54: .4byte gStringVar4
_08114F58: .4byte gUnknown_841A9D4
_08114F5C:
	cmp r0, 0x1
	bne _08114F8C
	cmp r1, 0x1
	bne _08114F78
	ldr r0, _08114F70 @ =gStringVar4
	ldr r1, _08114F74 @ =gUnknown_841AA76
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F70: .4byte gStringVar4
_08114F74: .4byte gUnknown_841AA76
_08114F78:
	ldr r0, _08114F84 @ =gStringVar4
	ldr r1, _08114F88 @ =gUnknown_841AAAA
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F84: .4byte gStringVar4
_08114F88: .4byte gUnknown_841AAAA
_08114F8C:
	cmp r1, 0x1
	bne _08114FA4
	ldr r0, _08114F9C @ =gStringVar4
	ldr r1, _08114FA0 @ =gUnknown_841AAEC
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F9C: .4byte gStringVar4
_08114FA0: .4byte gUnknown_841AAEC
_08114FA4:
	ldr r0, _08114FB4 @ =gStringVar4
	ldr r1, _08114FB8 @ =gUnknown_841AB29
	bl UnkTextUtil_StringExpandPlaceholders
_08114FAC:
	adds r0, r6, 0x4
_08114FAE:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08114FB4: .4byte gStringVar4
_08114FB8: .4byte gUnknown_841AB29
	thumb_func_end sub_8114E68

	thumb_func_start sub_8114FBC
sub_8114FBC: @ 8114FBC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x96
	beq _08114FE6
	cmp r0, 0x96
	bgt _08114FD6
	cmp r0, 0x92
	bgt _08114FEA
	cmp r0, 0x8F
	blt _08114FEA
	b _08114FE6
_08114FD6:
	cmp r1, 0xF9
	blt _08114FEA
	cmp r1, 0xFA
	ble _08114FE6
	movs r0, 0xCD
	lsls r0, 1
	cmp r1, r0
	bne _08114FEA
_08114FE6:
	movs r0, 0x1
	b _08114FEC
_08114FEA:
	movs r0, 0
_08114FEC:
	pop {r1}
	bx r1
	thumb_func_end sub_8114FBC

	thumb_func_start sub_8114FF0
sub_8114FF0: @ 8114FF0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r1, _08115008 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x20
	adds r1, r3, 0
	bl sub_8114D18
	pop {r1}
	bx r1
	.align 2, 0
_08115008: .4byte gUnknown_203B048
	thumb_func_end sub_8114FF0

	thumb_func_start sub_811500C
sub_811500C: @ 811500C
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x20
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x6
	bl UnkTextUtil_Reset
	ldrh r0, [r4, 0x4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08115068 @ =gTrainers+0x4
	adds r1, r0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl QuestLog_AutoGetSpeciesName
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x2
	bl QuestLog_AutoGetSpeciesName
	ldr r1, _0811506C @ =gUnknown_8456ACC
	ldrb r0, [r5, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x3
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115070 @ =gStringVar4
	ldr r1, _08115074 @ =gUnknown_841AF3E
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08115068: .4byte gTrainers+0x4
_0811506C: .4byte gUnknown_8456ACC
_08115070: .4byte gStringVar4
_08115074: .4byte gUnknown_841AF3E
	thumb_func_end sub_811500C

	thumb_func_start sub_8115078
sub_8115078: @ 8115078
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _081150B4 @ =gUnknown_8456AA0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	beq _081150C4
	ldr r1, _081150B8 @ =0x00002021
	adds r0, r1, 0
	strh r0, [r4]
	ldr r0, _081150BC @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x6]
	ldrb r0, [r5, 0x6]
	strb r0, [r4, 0x8]
	ldr r1, _081150C0 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0xA
	b _081150C6
	.align 2, 0
_081150B4: .4byte gUnknown_8456AA0
_081150B8: .4byte 0x00002021
_081150BC: .4byte gUnknown_203AF98
_081150C0: .4byte gUnknown_203B048
_081150C4:
	movs r0, 0
_081150C6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8115078

	thumb_func_start sub_81150CC
sub_81150CC: @ 81150CC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _081150E8 @ =gUnknown_8456AA0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _081150EC
	movs r0, 0
	b _081151AE
	.align 2, 0
_081150E8: .4byte gUnknown_8456AA0
_081150EC:
	adds r5, r4, 0
	adds r5, 0x8
	bl UnkTextUtil_Reset
	ldr r0, _08115108 @ =gUnknown_203B044
	ldrh r0, [r0, 0x2]
	cmp r0, 0x1
	beq _08115148
	cmp r0, 0x1
	bgt _0811510C
	cmp r0, 0
	beq _08115112
	b _081151AC
	.align 2, 0
_08115108: .4byte gUnknown_203B044
_0811510C:
	cmp r0, 0x2
	beq _08115194
	b _081151AC
_08115112:
	ldr r0, _08115134 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115138 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _0811513C @ =0x00003a4c
	adds r1, r0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115140 @ =gStringVar4
	ldr r1, _08115144 @ =gUnknown_841A2E1
	bl UnkTextUtil_StringExpandPlaceholders
	b _081151AC
	.align 2, 0
_08115134: .4byte gSaveBlock2Ptr
_08115138: .4byte gSaveBlock1Ptr
_0811513C: .4byte 0x00003a4c
_08115140: .4byte gStringVar4
_08115144: .4byte gUnknown_841A2E1
_08115148:
	ldr r0, _08115180 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _08115184 @ =0x00003a4c
	adds r1, r0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x4]
	movs r1, 0
	movs r2, 0x1
	bl QuestLog_AutoGetSpeciesName
	ldr r0, _08115188 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x6]
	movs r1, 0
	movs r2, 0x3
	bl QuestLog_AutoGetSpeciesName
	ldr r0, _0811518C @ =gStringVar4
	ldr r1, _08115190 @ =gUnknown_841A312
	bl UnkTextUtil_StringExpandPlaceholders
	b _081151AC
	.align 2, 0
_08115180: .4byte gSaveBlock1Ptr
_08115184: .4byte 0x00003a4c
_08115188: .4byte gSaveBlock2Ptr
_0811518C: .4byte gStringVar4
_08115190: .4byte gUnknown_841A312
_08115194:
	ldr r1, _081151B4 @ =gUnknown_8456AD8
	ldrb r0, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _081151B8 @ =gStringVar4
	ldr r1, _081151BC @ =gUnknown_841A349
	bl UnkTextUtil_StringExpandPlaceholders
_081151AC:
	adds r0, r5, 0x2
_081151AE:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081151B4: .4byte gUnknown_8456AD8
_081151B8: .4byte gStringVar4
_081151BC: .4byte gUnknown_841A349
	thumb_func_end sub_81150CC

	thumb_func_start sub_81151C0
sub_81151C0: @ 81151C0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r1, _081151D8 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x22
	adds r1, r3, 0
	bl sub_8114D18
	pop {r1}
	bx r1
	.align 2, 0
_081151D8: .4byte gUnknown_203B048
	thumb_func_end sub_81151C0

	thumb_func_start sub_81151DC
sub_81151DC: @ 81151DC
	push {r4-r6,lr}
	adds r1, r0, 0
	movs r0, 0x22
	bl sub_8113E88
	adds r5, r0, 0
	adds r6, r5, 0x6
	bl UnkTextUtil_Reset
	ldr r4, _0811522C @ =gStringVar1
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r3, _08115230 @ =gTrainers
	ldrh r1, [r5, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r2, r0, 3
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	cmp r0, 0x51
	beq _0811521A
	cmp r0, 0x59
	beq _0811521A
	cmp r0, 0x5A
	bne _08115234
_0811521A:
	movs r0, 0x6
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	b _0811523E
	.align 2, 0
_0811522C: .4byte gStringVar1
_08115230: .4byte gTrainers
_08115234:
	adds r1, r3, 0x4
	adds r1, r2, r1
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
_0811523E:
	ldrh r0, [r5]
	movs r1, 0
	movs r2, 0x2
	bl QuestLog_AutoGetSpeciesName
	ldrh r0, [r5, 0x2]
	movs r1, 0
	movs r2, 0x3
	bl QuestLog_AutoGetSpeciesName
	ldr r1, _08115274 @ =gUnknown_8456ACC
	ldrb r0, [r6, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x4
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115278 @ =gStringVar4
	ldr r1, _0811527C @ =gUnknown_841AF6D
	bl UnkTextUtil_StringExpandPlaceholders
	adds r0, r6, 0x2
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08115274: .4byte gUnknown_8456ACC
_08115278: .4byte gStringVar4
_0811527C: .4byte gUnknown_841AF6D
	thumb_func_end sub_81151DC

	thumb_func_start sub_8115280
sub_8115280: @ 8115280
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x23
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _08115298
	movs r0, 0
	b _081152B0
_08115298:
	ldrb r0, [r4]
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	strb r0, [r2, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x24
	bne _081152AE
	ldr r1, _081152B8 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
_081152AE:
	adds r0, r2, 0x2
_081152B0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081152B8: .4byte gUnknown_203B048
	thumb_func_end sub_8115280

	thumb_func_start sub_81152BC
sub_81152BC: @ 81152BC
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x23
	bl sub_8113E88
	adds r5, r0, 0
	ldrb r6, [r5, 0x1]
	ldr r0, _08115318 @ =gStringVar1
	ldrb r1, [r5]
	bl sub_80C4DF8
	ldr r0, _0811531C @ =gStringVar2
	ldr r2, _08115320 @ =gUnknown_8456AF0
	lsls r1, r6, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08115324 @ =gUnknown_8456BE4
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, 0x5
	bne _08115378
	movs r4, 0
	ldr r2, _08115328 @ =gUnknown_8456C17
	adds r7, r5, 0x2
	ldrb r1, [r5]
_081152F2:
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08115334
	movs r1, 0x82
	lsls r1, 4
	adds r0, r4, r1
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08115364
	ldr r0, _0811532C @ =gStringVar4
	ldr r1, _08115330 @ =gUnknown_841AE48
	bl StringExpandPlaceholders
	b _0811533E
	.align 2, 0
_08115318: .4byte gStringVar1
_0811531C: .4byte gStringVar2
_08115320: .4byte gUnknown_8456AF0
_08115324: .4byte gUnknown_8456BE4
_08115328: .4byte gUnknown_8456C17
_0811532C: .4byte gStringVar4
_08115330: .4byte gUnknown_841AE48
_08115334:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _081152F2
_0811533E:
	cmp r4, 0x8
	bne _0811538A
	ldr r0, _08115358 @ =gStringVar4
	ldr r2, _0811535C @ =gUnknown_8456BBC
	ldr r1, _08115360 @ =gUnknown_8456BE4
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	b _0811538A
	.align 2, 0
_08115358: .4byte gStringVar4
_0811535C: .4byte gUnknown_8456BBC
_08115360: .4byte gUnknown_8456BE4
_08115364:
	ldr r0, _08115370 @ =gStringVar4
	ldr r1, _08115374 @ =gUnknown_841AE8F
	bl StringExpandPlaceholders
	b _0811533E
	.align 2, 0
_08115370: .4byte gStringVar4
_08115374: .4byte gUnknown_841AE8F
_08115378:
	ldr r0, _08115394 @ =gStringVar4
	ldr r2, _08115398 @ =gUnknown_8456BBC
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	adds r7, r5, 0x2
_0811538A:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08115394: .4byte gStringVar4
_08115398: .4byte gUnknown_8456BBC
	thumb_func_end sub_81152BC

	thumb_func_start sub_811539C
sub_811539C: @ 811539C
	ldr r1, _081153A4 @ =gUnknown_203B04B
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_081153A4: .4byte gUnknown_203B04B
	thumb_func_end sub_811539C

	thumb_func_start sub_81153A8
sub_81153A8: @ 81153A8
	push {lr}
	adds r2, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x23
	beq _081153C4
	ldr r1, _081153C0 @ =gUnknown_203B04A
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _081153DE
	.align 2, 0
_081153C0: .4byte gUnknown_203B04A
_081153C4:
	ldr r3, _081153D8 @ =gUnknown_203B04A
	ldrb r1, [r3]
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	cmp r1, r0
	beq _081153DC
	strb r0, [r3]
	movs r0, 0x1
	b _081153DE
	.align 2, 0
_081153D8: .4byte gUnknown_203B04A
_081153DC:
	movs r0, 0
_081153DE:
	pop {r1}
	bx r1
	thumb_func_end sub_81153A8

	thumb_func_start sub_81153E4
sub_81153E4: @ 81153E4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x23
	bne _08115408
	ldrb r0, [r1, 0x1]
	ldr r1, _08115400 @ =gUnknown_203B04B
	cmp r0, 0x20
	bne _08115404
	ldrb r0, [r1]
	cmp r0, 0
	bne _08115404
	movs r0, 0
	b _0811540A
	.align 2, 0
_08115400: .4byte gUnknown_203B04B
_08115404:
	movs r0, 0
	strb r0, [r1]
_08115408:
	movs r0, 0x1
_0811540A:
	pop {r1}
	bx r1
	thumb_func_end sub_81153E4

	thumb_func_start sub_8115410
sub_8115410: @ 8115410
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x24
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _08115428
	movs r0, 0
	b _08115454
_08115428:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r3, r2, 0x2
	ldrb r0, [r4, 0x2]
	strb r0, [r2, 0x2]
	ldrb r0, [r4, 0x3]
	strb r0, [r3, 0x1]
	ldrb r0, [r2, 0x2]
	subs r0, 0x7
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0811544C
	ldr r1, _08115448 @ =gUnknown_203B048
	movs r0, 0x2
	b _08115450
	.align 2, 0
_08115448: .4byte gUnknown_203B048
_0811544C:
	ldr r1, _0811545C @ =gUnknown_203B048
	movs r0, 0x1
_08115450:
	strb r0, [r1]
	adds r0, r3, 0x2
_08115454:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811545C: .4byte gUnknown_203B048
	thumb_func_end sub_8115410

	thumb_func_start sub_8115460
sub_8115460: @ 8115460
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x24
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	ldrh r0, [r4]
	ldr r1, _0811549C @ =gStringVar1
	movs r2, 0
	bl QuestLog_AutoGetSpeciesName
	ldrb r0, [r5, 0x1]
	cmp r0, 0xFF
	beq _08115486
	ldr r0, _081154A0 @ =gStringVar2
	ldrb r1, [r5, 0x1]
	bl sub_80C4DF8
_08115486:
	ldrb r0, [r4, 0x2]
	cmp r0, 0x7
	bne _081154B4
	ldrb r0, [r5, 0x1]
	cmp r0, 0x58
	bne _081154AC
	ldr r0, _081154A4 @ =gStringVar3
	ldr r1, _081154A8 @ =gUnknown_841B09F
	bl StringCopy
	b _081154B4
	.align 2, 0
_0811549C: .4byte gStringVar1
_081154A0: .4byte gStringVar2
_081154A4: .4byte gStringVar3
_081154A8: .4byte gUnknown_841B09F
_081154AC:
	ldr r0, _081154CC @ =gStringVar3
	ldr r1, _081154D0 @ =gUnknown_8418C1B
	bl StringCopy
_081154B4:
	ldr r0, _081154D4 @ =gStringVar4
	ldr r2, _081154D8 @ =gUnknown_8456C20
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	adds r0, r5, 0x2
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081154CC: .4byte gStringVar3
_081154D0: .4byte gUnknown_8418C1B
_081154D4: .4byte gStringVar4
_081154D8: .4byte gUnknown_8456C20
	thumb_func_end sub_8115460

	thumb_func_start sub_81154DC
sub_81154DC: @ 81154DC
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x25
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _0811550E
	ldrh r0, [r4, 0x4]
	strh r0, [r2]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x2]
	ldr r1, [r4]
	lsrs r0, r1, 16
	strh r0, [r2, 0x4]
	strh r1, [r2, 0x6]
	ldrb r0, [r4, 0x8]
	strb r0, [r2, 0x8]
	movs r0, 0x1
	strb r0, [r2, 0x9]
	adds r0, r2, 0
	adds r0, 0xA
	b _08115510
_0811550E:
	movs r0, 0
_08115510:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81154DC

	thumb_func_start sub_8115518
sub_8115518: @ 8115518
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x25
	bl sub_8113E88
	adds r4, r0, 0
	adds r7, r4, 0
	adds r7, 0x8
	ldrh r0, [r4, 0x4]
	lsls r0, 16
	ldrh r1, [r4, 0x6]
	adds r6, r0, r1
	bl UnkTextUtil_Reset
	ldr r5, _08115564 @ =gStringVar1
	ldrb r1, [r4, 0x8]
	adds r0, r5, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r5, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x2]
	cmp r0, 0x1
	bhi _08115570
	ldr r0, _08115568 @ =gStringVar4
	ldr r1, _0811556C @ =gUnknown_841A7DD
	bl UnkTextUtil_StringExpandPlaceholders
	b _0811558E
	.align 2, 0
_08115564: .4byte gStringVar1
_08115568: .4byte gStringVar4
_0811556C: .4byte gUnknown_841A7DD
_08115570:
	ldr r4, _08115598 @ =gStringVar2
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _0811559C @ =gStringVar4
	ldr r1, _081155A0 @ =gUnknown_841A810
	bl UnkTextUtil_StringExpandPlaceholders
_0811558E:
	adds r0, r7, 0x2
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08115598: .4byte gStringVar2
_0811559C: .4byte gStringVar4
_081155A0: .4byte gUnknown_841A810
	thumb_func_end sub_8115518

	thumb_func_start sub_81155A4
sub_81155A4: @ 81155A4
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x26
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081155D6
	ldrh r0, [r4, 0x4]
	strh r0, [r2]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x2]
	ldr r1, [r4]
	lsrs r0, r1, 16
	strh r0, [r2, 0x4]
	strh r1, [r2, 0x6]
	ldrb r0, [r4, 0x8]
	strb r0, [r2, 0x8]
	ldrb r0, [r4, 0x9]
	strb r0, [r2, 0x9]
	adds r0, r2, 0
	adds r0, 0xA
	b _081155D8
_081155D6:
	movs r0, 0
_081155D8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81155A4

	thumb_func_start sub_81155E0
sub_81155E0: @ 81155E0
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x26
	bl sub_8113E88
	adds r5, r0, 0
	adds r7, r5, 0
	adds r7, 0x8
	ldrh r0, [r5, 0x4]
	lsls r0, 16
	ldrh r1, [r5, 0x6]
	adds r6, r0, r1
	bl UnkTextUtil_Reset
	ldr r4, _0811563C @ =gStringVar1
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl sub_80C4DF8
	ldrb r0, [r7, 0x1]
	cmp r0, 0
	bne _08115690
	ldr r0, _08115640 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	movs r0, 0x1
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5, 0x2]
	cmp r0, 0x1
	bne _08115648
	ldr r1, _08115644 @ =gUnknown_841A8D4
	movs r0, 0x3
	bl UnkTextUtil_SetPtrI
	b _08115670
	.align 2, 0
_0811563C: .4byte gStringVar1
_08115640: .4byte gSaveBlock2Ptr
_08115644: .4byte gUnknown_841A8D4
_08115648:
	ldr r4, _0811567C @ =gStringVar2
	ldrh r1, [r5, 0x2]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r4, _08115680 @ =gStringVar3
	ldr r1, _08115684 @ =gUnknown_841A8DD
	adds r0, r4, 0
	bl UnkTextUtil_StringExpandPlaceholders
	movs r0, 0x3
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
_08115670:
	ldr r0, _08115688 @ =gStringVar4
	ldr r1, _0811568C @ =gUnknown_841A858
	bl UnkTextUtil_StringExpandPlaceholders
	b _081156C4
	.align 2, 0
_0811567C: .4byte gStringVar2
_08115680: .4byte gStringVar3
_08115684: .4byte gUnknown_841A8DD
_08115688: .4byte gStringVar4
_0811568C: .4byte gUnknown_841A858
_08115690:
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r4, _081156CC @ =gStringVar2
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _081156D0 @ =gStringVar4
	ldr r1, _081156D4 @ =gUnknown_841A896
	bl UnkTextUtil_StringExpandPlaceholders
_081156C4:
	adds r0, r7, 0x2
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081156CC: .4byte gStringVar2
_081156D0: .4byte gStringVar4
_081156D4: .4byte gUnknown_841A896
	thumb_func_end sub_81155E0

	thumb_func_start sub_81156D8
sub_81156D8: @ 81156D8
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x28
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081156F8
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x2]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _081156FA
_081156F8:
	movs r0, 0
_081156FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81156D8

	thumb_func_start sub_8115700
sub_8115700: @ 8115700
	push {r4-r6,lr}
	adds r1, r0, 0
	movs r0, 0x28
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	ldr r0, _08115738 @ =gStringVar1
	ldrb r1, [r4, 0x2]
	bl sub_80C4DF8
	ldr r6, _0811573C @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r6, 0
	bl StringCopy
	ldr r0, _08115740 @ =gStringVar4
	ldr r1, _08115744 @ =gUnknown_841B03F
	bl StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08115738: .4byte gStringVar1
_0811573C: .4byte gStringVar2
_08115740: .4byte gStringVar4
_08115744: .4byte gUnknown_841B03F
	thumb_func_end sub_8115700

	thumb_func_start sub_8115748
sub_8115748: @ 8115748
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08115764 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08115792
	movs r1, 0
	ldr r4, _08115768 @ =gUnknown_203B049
	ldr r0, _0811576C @ =gUnknown_8456C50
	b _08115778
	.align 2, 0
_08115764: .4byte gUnknown_203ADFA
_08115768: .4byte gUnknown_203B049
_0811576C: .4byte gUnknown_8456C50
_08115770:
	movs r0, 0
	b _08115790
_08115774:
	adds r0, 0x2
	adds r1, 0x1
_08115778:
	cmp r1, 0x10
	bgt _08115792
	ldrh r3, [r0]
	cmp r2, r3
	bne _08115774
	adds r0, r2, 0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08115770
	movs r0, 0x1
_08115790:
	strb r0, [r4]
_08115792:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8115748

	thumb_func_start sub_8115798
sub_8115798: @ 8115798
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081157D0 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _081157C6
	ldr r4, _081157D4 @ =gUnknown_203B049
	ldrb r0, [r4]
	cmp r0, 0
	beq _081157C6
	ldr r0, _081157D8 @ =gMapHeader
	ldrb r1, [r0, 0x14]
	mov r0, sp
	strh r1, [r0]
	movs r0, 0x2A
	mov r1, sp
	bl sub_8113550
	movs r0, 0
	strb r0, [r4]
_081157C6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081157D0: .4byte gUnknown_203ADFA
_081157D4: .4byte gUnknown_203B049
_081157D8: .4byte gMapHeader
	thumb_func_end sub_8115798

	thumb_func_start sub_81157DC
sub_81157DC: @ 81157DC
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x2A
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081157F8
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	b _081157FA
_081157F8:
	movs r0, 0
_081157FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81157DC

	thumb_func_start sub_8115800
sub_8115800: @ 8115800
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x2A
	bl sub_8113E88
	adds r4, r0, 0
	ldr r0, _08115828 @ =gStringVar1
	ldrb r1, [r4]
	bl sub_80C4DF8
	ldr r0, _0811582C @ =gStringVar4
	ldr r1, _08115830 @ =gUnknown_841B064
	bl StringExpandPlaceholders
	adds r4, 0x2
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08115828: .4byte gStringVar1
_0811582C: .4byte gStringVar4
_08115830: .4byte gUnknown_841B064
	thumb_func_end sub_8115800

	thumb_func_start sub_8115834
sub_8115834: @ 8115834
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0xFC
	bne _08115868
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0x15
	bne _08115868
	movs r2, 0
	b _08115854
_0811584C:
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x4
	bgt _0811585A
_08115854:
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _0811584C
_0811585A:
	movs r0, 0xFC
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x16
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x1]
_08115868:
	pop {r0}
	bx r0
	thumb_func_end sub_8115834

	.align 2, 0 @ Don't pad with nop.
