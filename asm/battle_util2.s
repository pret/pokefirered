	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_802E03C
sub_802E03C: @ 802E03C
	push {r4,r5,lr}
	ldr r4, _0802E118 @ =gUnknown_2022B4C
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _0802E050
	bl sub_815DA54
_0802E050:
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 9
	ands r0, r1
	cmp r0, 0
	beq _0802E06E
	ldr r5, _0802E11C @ =gUnknown_3005EE0
	movs r4, 0x3
_0802E060:
	movs r0, 0x8
	bl AllocZeroed
	stm r5!, {r0}
	subs r4, 0x1
	cmp r4, 0
	bge _0802E060
_0802E06E:
	ldr r4, _0802E120 @ =gUnknown_2023FE8
	movs r0, 0x80
	lsls r0, 2
	bl AllocZeroed
	str r0, [r4]
	ldr r4, _0802E124 @ =gUnknown_2023FF4
	movs r0, 0x20
	bl AllocZeroed
	str r0, [r4]
	movs r0, 0xA0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1]
	movs r0, 0x10
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0x4]
	movs r0, 0x24
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0x8]
	movs r0, 0x24
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0xC]
	movs r0, 0xC
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0x10]
	movs r0, 0x1C
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0x14]
	movs r0, 0x30
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0x18]
	movs r0, 0x24
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0x1C]
	ldr r4, _0802E128 @ =gUnknown_2023FEC
	movs r5, 0x80
	lsls r5, 5
	adds r0, r5, 0
	bl AllocZeroed
	str r0, [r4]
	ldr r4, _0802E12C @ =gUnknown_2023FF0
	adds r0, r5, 0
	bl AllocZeroed
	str r0, [r4]
	ldr r4, _0802E130 @ =gUnknown_2022BB8
	movs r0, 0x80
	lsls r0, 6
	bl AllocZeroed
	str r0, [r4]
	ldr r4, _0802E134 @ =gUnknown_2022BBC
	adds r0, r5, 0
	bl AllocZeroed
	adds r1, r0, 0
	str r1, [r4]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, 0x2
	bl SetBgTilemapBuffer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E118: .4byte gUnknown_2022B4C
_0802E11C: .4byte gUnknown_3005EE0
_0802E120: .4byte gUnknown_2023FE8
_0802E124: .4byte gUnknown_2023FF4
_0802E128: .4byte gUnknown_2023FEC
_0802E12C: .4byte gUnknown_2023FF0
_0802E130: .4byte gUnknown_2022BB8
_0802E134: .4byte gUnknown_2022BBC
	thumb_func_end sub_802E03C

	thumb_func_start sub_802E138
sub_802E138: @ 802E138
	push {r4-r6,lr}
	ldr r4, _0802E208 @ =gUnknown_2022B4C
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _0802E14C
	bl sub_815DBDC
_0802E14C:
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 9
	ands r0, r1
	cmp r0, 0
	beq _0802E16C
	ldr r5, _0802E20C @ =gUnknown_3005EE0
	movs r6, 0
	movs r4, 0x3
_0802E15E:
	ldr r0, [r5]
	bl Free
	stm r5!, {r6}
	subs r4, 0x1
	cmp r4, 0
	bge _0802E15E
_0802E16C:
	ldr r6, _0802E210 @ =gUnknown_2023FF4
	ldr r0, [r6]
	cmp r0, 0
	beq _0802E200
	ldr r4, _0802E214 @ =gUnknown_2023FE8
	ldr r0, [r4]
	bl Free
	movs r5, 0
	str r5, [r4]
	ldr r0, [r6]
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	str r5, [r0]
	ldr r0, [r0, 0x4]
	bl Free
	ldr r0, [r6]
	str r5, [r0, 0x4]
	ldr r0, [r0, 0x8]
	bl Free
	ldr r0, [r6]
	str r5, [r0, 0x8]
	ldr r0, [r0, 0xC]
	bl Free
	ldr r0, [r6]
	str r5, [r0, 0xC]
	ldr r0, [r0, 0x10]
	bl Free
	ldr r0, [r6]
	str r5, [r0, 0x10]
	ldr r0, [r0, 0x14]
	bl Free
	ldr r0, [r6]
	str r5, [r0, 0x14]
	ldr r0, [r0, 0x18]
	bl Free
	ldr r0, [r6]
	str r5, [r0, 0x18]
	ldr r0, [r0, 0x1C]
	bl Free
	ldr r0, [r6]
	str r5, [r0, 0x1C]
	bl Free
	str r5, [r6]
	ldr r4, _0802E218 @ =gUnknown_2023FEC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0802E21C @ =gUnknown_2023FF0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0802E220 @ =gUnknown_2022BB8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0802E224 @ =gUnknown_2022BBC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
_0802E200:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E208: .4byte gUnknown_2022B4C
_0802E20C: .4byte gUnknown_3005EE0
_0802E210: .4byte gUnknown_2023FF4
_0802E214: .4byte gUnknown_2023FE8
_0802E218: .4byte gUnknown_2023FEC
_0802E21C: .4byte gUnknown_2023FF0
_0802E220: .4byte gUnknown_2022BB8
_0802E224: .4byte gUnknown_2022BBC
	thumb_func_end sub_802E138

	thumb_func_start sub_802E228
sub_802E228: @ 802E228
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0802E26C @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802E274
	movs r0, 0x1
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x3
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _0802E270 @ =gUnknown_2023BE4
	movs r0, 0x58
	adds r1, r3, 0
	muls r1, r0
	adds r1, r2
	adds r1, 0x2A
	muls r0, r4
	adds r0, r2
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0802E27E
	adds r4, r3, 0
	b _0802E27E
	.align 2, 0
_0802E26C: .4byte gUnknown_2022B4C
_0802E270: .4byte gUnknown_2023BE4
_0802E274:
	movs r0, 0x1
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r4, r0, 24
_0802E27E:
	ldr r2, _0802E2C0 @ =gUnknown_2023BE4
	movs r1, 0x58
	adds r0, r4, 0
	muls r0, r1
	adds r0, r2
	adds r3, r0, 0
	adds r3, 0x2A
	adds r0, r5, 0
	muls r0, r1
	adds r0, r2
	adds r1, r0, 0
	adds r1, 0x2A
	ldrb r0, [r3]
	ldrb r2, [r1]
	cmp r0, r2
	bls _0802E2EC
	ldrb r1, [r1]
	subs r0, r1
	cmp r0, 0x1D
	ble _0802E2CC
	ldr r1, _0802E2C4 @ =gUnknown_2023BCE
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802E2C8 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x9
	bl sub_80436F8
	b _0802E302
	.align 2, 0
_0802E2C0: .4byte gUnknown_2023BE4
_0802E2C4: .4byte gUnknown_2023BCE
_0802E2C8: .4byte gUnknown_2024284
_0802E2CC:
	ldr r1, _0802E2E4 @ =gUnknown_2023BCE
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802E2E8 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x7
	bl sub_80436F8
	b _0802E302
	.align 2, 0
_0802E2E4: .4byte gUnknown_2023BCE
_0802E2E8: .4byte gUnknown_2024284
_0802E2EC:
	ldr r1, _0802E308 @ =gUnknown_2023BCE
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802E30C @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x7
	bl sub_80436F8
_0802E302:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E308: .4byte gUnknown_2023BCE
_0802E30C: .4byte gUnknown_2024284
	thumb_func_end sub_802E228

	.align 2, 0 @ Don't pad with nop.
