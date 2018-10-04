	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_803ECEC
sub_803ECEC: @ 803ECEC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	adds r6, r0, 0
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	ldr r0, [sp, 0x4C]
	ldr r1, [sp, 0x50]
	ldr r2, [sp, 0x54]
	ldr r4, [sp, 0x58]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0xC]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0
	cmp r3, 0
	bne _0803ED40
	ldr r2, _0803ED38 @ =gUnknown_2024020
	ldr r1, _0803ED3C @ =gBattleMoves
	ldr r3, [sp, 0x8]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	strh r0, [r2]
	b _0803ED44
	.align 2, 0
_0803ED38: .4byte gUnknown_2024020
_0803ED3C: .4byte gBattleMoves
_0803ED40:
	ldr r0, _0803ED5C @ =gUnknown_2024020
	strh r3, [r0]
_0803ED44:
	cmp r7, 0
	bne _0803ED64
	ldr r1, _0803ED60 @ =gBattleMoves
	ldr r7, [sp, 0x8]
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	mov r9, r0
	b _0803ED6E
	.align 2, 0
_0803ED5C: .4byte gUnknown_2024020
_0803ED60: .4byte gBattleMoves
_0803ED64:
	movs r0, 0x3F
	mov r9, r0
	mov r1, r9
	ands r1, r7
	mov r9, r1
_0803ED6E:
	ldrh r7, [r6, 0x2]
	ldr r2, [sp, 0x4]
	ldrh r2, [r2, 0x4]
	str r2, [sp, 0x14]
	ldrh r3, [r6, 0x8]
	mov r8, r3
	ldr r0, [sp, 0x4]
	ldrh r0, [r0, 0xA]
	str r0, [sp, 0x18]
	ldrh r0, [r6, 0x2E]
	cmp r0, 0xAF
	bne _0803EDA0
	ldr r1, _0803ED9C @ =gUnknown_2023F54
	ldr r2, [sp, 0x10]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x7]
	mov r10, r3
	ldrb r0, [r0, 0x1A]
	b _0803EDB6
	.align 2, 0
_0803ED9C: .4byte gUnknown_2023F54
_0803EDA0:
	ldrh r0, [r6, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrh r0, [r6, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r0, 24
_0803EDB6:
	str r0, [sp, 0x20]
	ldr r1, [sp, 0x4]
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0803EDE6
	ldr r1, _0803EDD0 @ =gUnknown_2023F54
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x7]
	str r0, [sp, 0x1C]
	b _0803EDFC
	.align 2, 0
_0803EDD0: .4byte gUnknown_2023F54
_0803EDD4:
	ldr r0, [sp, 0x20]
	adds r0, 0x64
	muls r0, r7
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	b _0803EF44
_0803EDE6:
	ldr r2, [sp, 0x4]
	ldrh r0, [r2, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x1C]
	ldr r3, [sp, 0x4]
	ldrh r0, [r3, 0x2E]
	bl ItemId_GetHoldEffectParam
_0803EDFC:
	adds r0, r6, 0
	adds r0, 0x20
	ldrb r1, [r0]
	str r0, [sp, 0x24]
	cmp r1, 0x25
	beq _0803EE0C
	cmp r1, 0x4A
	bne _0803EE10
_0803EE0C:
	lsls r0, r7, 17
	lsrs r7, r0, 16
_0803EE10:
	ldr r0, _0803EF28 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _0803EF2C @ =0x00000802
	ands r0, r1
	cmp r0, 0
	bne _0803EEE8
	movs r0, 0x82
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803EE44
	ldr r0, [sp, 0x10]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0803EE44
	movs r0, 0x6E
	muls r0, r7
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
_0803EE44:
	ldr r0, _0803EF28 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _0803EF2C @ =0x00000802
	ands r0, r1
	cmp r0, 0
	bne _0803EEE8
	ldr r0, _0803EF30 @ =0x00000824
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803EE7A
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0803EE7A
	movs r0, 0x6E
	ldr r1, [sp, 0x14]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
_0803EE7A:
	ldr r0, _0803EF28 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _0803EF2C @ =0x00000802
	ands r0, r1
	cmp r0, 0
	bne _0803EEE8
	ldr r0, _0803EF34 @ =0x00000826
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803EEB2
	ldr r0, [sp, 0x10]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0803EEB2
	movs r0, 0x6E
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803EEB2:
	ldr r0, _0803EF28 @ =gBattleTypeFlags
	ldr r0, [r0]
	ldr r1, _0803EF2C @ =0x00000802
	ands r0, r1
	cmp r0, 0
	bne _0803EEE8
	ldr r0, _0803EF34 @ =0x00000826
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803EEE8
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0803EEE8
	movs r0, 0x6E
	ldr r3, [sp, 0x18]
	muls r0, r3
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
_0803EEE8:
	movs r2, 0
	ldr r4, _0803EF38 @ =gUnknown_825DECC
	ldr r0, [sp, 0x4]
	adds r0, 0x20
	str r0, [sp, 0x28]
	adds r3, r4, 0
_0803EEF4:
	lsls r1, r2, 1
	ldrb r0, [r3]
	cmp r10, r0
	bne _0803EF3C
	adds r0, r4, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r9, r0
	bne _0803EF3C
	mov r1, r9
	cmp r1, 0x8
	bhi _0803EF0E
	b _0803EDD4
_0803EF0E:
	ldr r0, [sp, 0x20]
	adds r0, 0x64
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	b _0803EF44
	.align 2, 0
_0803EF28: .4byte gBattleTypeFlags
_0803EF2C: .4byte 0x00000802
_0803EF30: .4byte 0x00000824
_0803EF34: .4byte 0x00000826
_0803EF38: .4byte gUnknown_825DECC
_0803EF3C:
	adds r3, 0x2
	adds r2, 0x1
	cmp r2, 0x10
	bls _0803EEF4
_0803EF44:
	mov r3, r10
	cmp r3, 0x1D
	bne _0803EF58
	movs r0, 0x96
	muls r0, r7
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
_0803EF58:
	mov r0, r10
	cmp r0, 0x22
	bne _0803EF90
	ldr r0, _0803F244 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	bne _0803EF90
	ldr r1, _0803F248 @ =0xfffffe69
	adds r0, r1, 0
	ldrh r2, [r6]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0803EF90
	movs r0, 0x96
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803EF90:
	ldr r0, [sp, 0x1C]
	cmp r0, 0x22
	bne _0803EFC8
	ldr r0, _0803F244 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	bne _0803EFC8
	ldr r1, _0803F248 @ =0xfffffe69
	adds r0, r1, 0
	ldr r2, [sp, 0x4]
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0803EFC8
	movs r0, 0x96
	ldr r3, [sp, 0x18]
	muls r0, r3
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
_0803EFC8:
	mov r0, r10
	cmp r0, 0x23
	bne _0803EFDE
	ldrh r1, [r6]
	ldr r0, _0803F24C @ =0x00000175
	cmp r1, r0
	bne _0803EFDE
	mov r1, r8
	lsls r0, r1, 17
	lsrs r0, 16
	mov r8, r0
_0803EFDE:
	ldr r2, [sp, 0x1C]
	cmp r2, 0x24
	bne _0803EFF6
	ldr r3, [sp, 0x4]
	ldrh r1, [r3]
	ldr r0, _0803F24C @ =0x00000175
	cmp r1, r0
	bne _0803EFF6
	ldr r1, [sp, 0x18]
	lsls r0, r1, 17
	lsrs r0, 16
	str r0, [sp, 0x18]
_0803EFF6:
	mov r2, r10
	cmp r2, 0x2D
	bne _0803F00A
	ldrh r0, [r6]
	cmp r0, 0x19
	bne _0803F00A
	mov r3, r8
	lsls r0, r3, 17
	lsrs r0, 16
	mov r8, r0
_0803F00A:
	ldr r0, [sp, 0x1C]
	cmp r0, 0x40
	bne _0803F020
	ldr r1, [sp, 0x4]
	ldrh r0, [r1]
	cmp r0, 0x84
	bne _0803F020
	ldr r2, [sp, 0x14]
	lsls r0, r2, 17
	lsrs r0, 16
	str r0, [sp, 0x14]
_0803F020:
	mov r3, r10
	cmp r3, 0x41
	bne _0803F036
	ldrh r0, [r6]
	subs r0, 0x68
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0803F036
	lsls r0, r7, 17
	lsrs r7, r0, 16
_0803F036:
	ldr r1, [sp, 0x28]
	ldrb r0, [r1]
	cmp r0, 0x2F
	bne _0803F04E
	mov r2, r9
	cmp r2, 0xA
	beq _0803F048
	cmp r2, 0xF
	bne _0803F04E
_0803F048:
	mov r3, r8
	lsrs r3, 1
	mov r8, r3
_0803F04E:
	ldr r0, [sp, 0x24]
	ldrb r4, [r0]
	cmp r4, 0x37
	bne _0803F064
	movs r0, 0x96
	muls r0, r7
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
_0803F064:
	cmp r4, 0x39
	bne _0803F092
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x3A
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _0803F092
	movs r0, 0x96
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803F092:
	ldr r2, [sp, 0x24]
	ldrb r0, [r2]
	cmp r0, 0x3A
	bne _0803F0C4
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x39
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _0803F0C4
	movs r0, 0x96
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803F0C4:
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x3E
	bne _0803F0E0
	ldr r0, [r6, 0x4C]
	cmp r0, 0
	beq _0803F0E0
	movs r0, 0x96
	muls r0, r7
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
_0803F0E0:
	ldr r2, [sp, 0x28]
	ldrb r0, [r2]
	cmp r0, 0x3F
	bne _0803F102
	ldr r3, [sp, 0x4]
	ldr r0, [r3, 0x4C]
	cmp r0, 0
	beq _0803F102
	movs r0, 0x96
	ldr r1, [sp, 0x14]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
_0803F102:
	mov r2, r9
	cmp r2, 0xD
	bne _0803F126
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0
	movs r3, 0xFD
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _0803F126
	ldr r1, _0803F250 @ =gUnknown_2024020
	ldrh r0, [r1]
	lsrs r0, 1
	strh r0, [r1]
_0803F126:
	mov r3, r9
	cmp r3, 0xA
	bne _0803F14A
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0
	movs r3, 0xFE
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	beq _0803F14A
	ldr r1, _0803F250 @ =gUnknown_2024020
	ldrh r0, [r1]
	lsrs r0, 1
	strh r0, [r1]
_0803F14A:
	mov r0, r9
	cmp r0, 0xC
	bne _0803F17A
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x41
	bne _0803F17A
	ldrh r0, [r6, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r6, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803F17A
	ldr r4, _0803F250 @ =gUnknown_2024020
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803F17A:
	mov r2, r9
	cmp r2, 0xA
	bne _0803F1AA
	ldr r3, [sp, 0x24]
	ldrb r0, [r3]
	cmp r0, 0x42
	bne _0803F1AA
	ldrh r0, [r6, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r6, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803F1AA
	ldr r4, _0803F250 @ =gUnknown_2024020
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803F1AA:
	mov r0, r9
	cmp r0, 0xB
	bne _0803F1DA
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x43
	bne _0803F1DA
	ldrh r0, [r6, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r6, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803F1DA
	ldr r4, _0803F250 @ =gUnknown_2024020
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803F1DA:
	mov r2, r9
	cmp r2, 0x6
	bne _0803F20A
	ldr r3, [sp, 0x24]
	ldrb r0, [r3]
	cmp r0, 0x44
	bne _0803F20A
	ldrh r0, [r6, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r6, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803F20A
	ldr r4, _0803F250 @ =gUnknown_2024020
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803F20A:
	ldr r2, _0803F254 @ =gBattleMoves
	ldr r0, _0803F258 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _0803F224
	ldr r0, [sp, 0x14]
	lsrs r0, 1
	str r0, [sp, 0x14]
_0803F224:
	mov r1, r9
	cmp r1, 0x8
	bls _0803F22C
	b _0803F38A
_0803F22C:
	ldr r0, _0803F25C @ =gCritMultiplier
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x2
	bne _0803F268
	movs r0, 0x19
	ldrsb r0, [r6, r0]
	cmp r0, 0x6
	ble _0803F264
	ldr r2, _0803F260 @ =gUnknown_825DEAD
	b _0803F26E
	.align 2, 0
_0803F244: .4byte gBattleTypeFlags
_0803F248: .4byte 0xfffffe69
_0803F24C: .4byte 0x00000175
_0803F250: .4byte gUnknown_2024020
_0803F254: .4byte gBattleMoves
_0803F258: .4byte gCurrentMove
_0803F25C: .4byte gCritMultiplier
_0803F260: .4byte gUnknown_825DEAD
_0803F264:
	adds r5, r7, 0
	b _0803F286
_0803F268:
	ldr r2, _0803F2B8 @ =gUnknown_825DEAD
	movs r0, 0x19
	ldrsb r0, [r6, r0]
_0803F26E:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r5, r7, 0
	muls r5, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r5, 0
	bl __divsi3
	adds r5, r0, 0
_0803F286:
	ldr r0, _0803F2BC @ =gUnknown_2024020
	ldrh r0, [r0]
	muls r5, r0
	adds r0, r6, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x2
	muls r5, r0
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _0803F2C4
	ldr r2, [sp, 0x4]
	movs r0, 0x1A
	ldrsb r0, [r2, r0]
	cmp r0, 0x5
	bgt _0803F2C0
	ldr r2, _0803F2B8 @ =gUnknown_825DEAD
	ldr r3, [sp, 0x4]
	movs r0, 0x1A
	ldrsb r0, [r3, r0]
	b _0803F2CC
	.align 2, 0
_0803F2B8: .4byte gUnknown_825DEAD
_0803F2BC: .4byte gUnknown_2024020
_0803F2C0:
	ldr r3, [sp, 0x14]
	b _0803F2E6
_0803F2C4:
	ldr r2, _0803F344 @ =gUnknown_825DEAD
	ldr r1, [sp, 0x4]
	movs r0, 0x1A
	ldrsb r0, [r1, r0]
_0803F2CC:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r7, [sp, 0x14]
	adds r3, r7, 0
	muls r3, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r3, 0
	bl __divsi3
	adds r3, r0, 0
_0803F2E6:
	adds r0, r5, 0
	adds r1, r3, 0
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0x32
	bl __divsi3
	adds r5, r0, 0
	ldr r0, [r6, 0x4C]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0803F310
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x3E
	beq _0803F310
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803F310:
	movs r0, 0x1
	ldr r2, [sp, 0xC]
	ands r0, r2
	cmp r0, 0
	beq _0803F352
	ldrb r1, [r4]
	cmp r1, 0x1
	bne _0803F352
	ldr r0, _0803F348 @ =gBattleTypeFlags
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	beq _0803F34C
	movs r0, 0x2
	bl sub_803F5B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803F34C
	adds r0, r5, 0
	movs r1, 0x3
	bl __divsi3
	lsls r5, r0, 1
	b _0803F352
	.align 2, 0
_0803F344: .4byte gUnknown_825DEAD
_0803F348: .4byte gBattleTypeFlags
_0803F34C:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803F352:
	ldr r0, _0803F3B0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803F384
	ldr r0, _0803F3B4 @ =gBattleMoves
	ldr r3, [sp, 0x8]
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x6]
	cmp r0, 0x8
	bne _0803F384
	movs r0, 0x2
	bl sub_803F5B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803F384
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803F384:
	cmp r5, 0
	bne _0803F38A
	movs r5, 0x1
_0803F38A:
	mov r7, r9
	cmp r7, 0x9
	bne _0803F392
	movs r5, 0
_0803F392:
	mov r0, r9
	cmp r0, 0x9
	bhi _0803F39A
	b _0803F59C
_0803F39A:
	ldr r0, _0803F3B8 @ =gCritMultiplier
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x2
	bne _0803F3C4
	movs r0, 0x1C
	ldrsb r0, [r6, r0]
	cmp r0, 0x6
	ble _0803F3C0
	ldr r2, _0803F3BC @ =gUnknown_825DEAD
	b _0803F3CA
	.align 2, 0
_0803F3B0: .4byte gBattleTypeFlags
_0803F3B4: .4byte gBattleMoves
_0803F3B8: .4byte gCritMultiplier
_0803F3BC: .4byte gUnknown_825DEAD
_0803F3C0:
	mov r5, r8
	b _0803F3E2
_0803F3C4:
	ldr r2, _0803F410 @ =gUnknown_825DEAD
	movs r0, 0x1C
	ldrsb r0, [r6, r0]
_0803F3CA:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	mov r5, r8
	muls r5, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r5, 0
	bl __divsi3
	adds r5, r0, 0
_0803F3E2:
	ldr r0, _0803F414 @ =gUnknown_2024020
	ldrh r0, [r0]
	muls r5, r0
	adds r0, r6, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x2
	muls r5, r0
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _0803F41C
	ldr r1, [sp, 0x4]
	movs r0, 0x1D
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0803F418
	ldr r2, _0803F410 @ =gUnknown_825DEAD
	b _0803F424
	.align 2, 0
_0803F410: .4byte gUnknown_825DEAD
_0803F414: .4byte gUnknown_2024020
_0803F418:
	ldr r3, [sp, 0x18]
	b _0803F43E
_0803F41C:
	ldr r2, _0803F484 @ =gUnknown_825DEAD
	ldr r7, [sp, 0x4]
	movs r0, 0x1D
	ldrsb r0, [r7, r0]
_0803F424:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r6, [sp, 0x18]
	adds r3, r6, 0
	muls r3, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r3, 0
	bl __divsi3
	adds r3, r0, 0
_0803F43E:
	adds r0, r5, 0
	adds r1, r3, 0
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0x32
	bl __divsi3
	adds r5, r0, 0
	movs r0, 0x2
	ldr r7, [sp, 0xC]
	ands r0, r7
	cmp r0, 0
	beq _0803F492
	ldrb r1, [r4]
	cmp r1, 0x1
	bne _0803F492
	ldr r0, _0803F488 @ =gBattleTypeFlags
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	beq _0803F48C
	movs r0, 0x2
	bl sub_803F5B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803F48C
	adds r0, r5, 0
	movs r1, 0x3
	bl __divsi3
	lsls r5, r0, 1
	b _0803F492
	.align 2, 0
_0803F484: .4byte gUnknown_825DEAD
_0803F488: .4byte gBattleTypeFlags
_0803F48C:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803F492:
	ldr r0, _0803F50C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803F4C4
	ldr r0, _0803F510 @ =gBattleMoves
	ldr r2, [sp, 0x8]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x6]
	cmp r0, 0x8
	bne _0803F4C4
	movs r0, 0x2
	bl sub_803F5B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803F4C4
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803F4C4:
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0803F574
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8019F18
	lsls r0, 24
	cmp r0, 0
	bne _0803F574
	ldr r2, _0803F514 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0
	beq _0803F52C
	mov r3, r9
	cmp r3, 0xA
	beq _0803F518
	cmp r3, 0xB
	beq _0803F520
	b _0803F52C
	.align 2, 0
_0803F50C: .4byte gBattleTypeFlags
_0803F510: .4byte gBattleMoves
_0803F514: .4byte gBattleWeather
_0803F518:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
	b _0803F52C
_0803F520:
	lsls r0, r5, 4
	subs r0, r5
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
_0803F52C:
	ldrh r1, [r4]
	movs r0, 0x9F
	ands r0, r1
	cmp r0, 0
	beq _0803F544
	ldr r0, _0803F55C @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0x4C
	bne _0803F544
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803F544:
	ldrh r1, [r4]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0803F574
	mov r6, r9
	cmp r6, 0xA
	beq _0803F560
	cmp r6, 0xB
	beq _0803F56E
	b _0803F574
	.align 2, 0
_0803F55C: .4byte gCurrentMove
_0803F560:
	lsls r0, r5, 4
	subs r0, r5
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	b _0803F574
_0803F56E:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803F574:
	ldr r0, _0803F5B0 @ =gBattleResources
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	ldr r7, [sp, 0x10]
	lsls r1, r7, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803F59C
	mov r0, r9
	cmp r0, 0xA
	bne _0803F59C
	lsls r0, r5, 4
	subs r0, r5
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
_0803F59C:
	adds r0, r5, 0x2
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F5B0: .4byte gBattleResources
	thumb_func_end sub_803ECEC

	.align 2, 0 @ Don't pad with nop.
