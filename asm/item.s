	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_809A5E4
sub_809A5E4: @ 809A5E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	movs r4, 0
	bl sub_809A720
	movs r3, 0
	ldrb r0, [r5, 0x4]
	cmp r3, r0
	bcs _0809A676
	movs r6, 0xA9
	lsls r6, 1
_0809A604:
	ldr r0, [r5]
	lsls r1, r3, 2
	adds r2, r1, r0
	ldrh r0, [r2]
	adds r7, r1, 0
	cmp r0, 0
	bne _0809A622
	adds r0, r2, 0x2
	str r3, [sp]
	bl GetBagItemQuantity
	lsls r0, 16
	ldr r3, [sp]
	cmp r0, 0
	beq _0809A70A
_0809A622:
	ldr r0, [r5]
	adds r1, r7, r0
	ldrh r0, [r1]
	cmp r0, r6
	bls _0809A66A
	adds r0, r1, 0x2
	str r3, [sp]
	bl GetBagItemQuantity
	lsls r0, 16
	ldr r3, [sp]
	cmp r0, 0
	beq _0809A66A
	adds r0, r3, 0x1
	b _0809A642
_0809A640:
	adds r0, r4, 0x1
_0809A642:
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r1, [r5, 0x4]
	cmp r4, r1
	bcs _0809A676
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0809A640
	adds r0, r1, 0x2
	str r3, [sp]
	bl GetBagItemQuantity
	lsls r0, 16
	ldr r3, [sp]
	cmp r0, 0
	bne _0809A640
	b _0809A676
_0809A66A:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrb r2, [r5, 0x4]
	cmp r3, r2
	bcc _0809A604
_0809A676:
	movs r6, 0
	lsls r7, r3, 2
	subs r4, r3
	mov r10, r4
	lsls r3, 1
	mov r9, r3
	ldrb r0, [r5, 0x4]
	cmp r6, r0
	bcs _0809A6A6
_0809A688:
	lsls r4, r6, 2
	ldr r0, [r5]
	adds r0, r4
	adds r0, 0x2
	bl GetBagItemQuantity
	ldr r1, [r5]
	adds r4, r1
	strh r0, [r4, 0x2]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r1, [r5, 0x4]
	cmp r6, r1
	bcc _0809A688
_0809A6A6:
	ldrb r0, [r5, 0x4]
	lsls r0, 2
	bl AllocZeroed
	mov r8, r0
	ldr r0, [r5]
	adds r0, r7
	mov r1, r10
	lsls r2, r1, 1
	ldr r4, _0809A71C @ =0x001fffff
	ands r2, r4
	mov r1, r8
	bl CpuSet
	ldr r0, [r5]
	mov r2, r10
	lsls r1, r2, 2
	add r1, r8
	mov r2, r9
	ands r2, r4
	mov r9, r2
	bl CpuSet
	ldr r1, [r5]
	ldrb r2, [r5, 0x4]
	lsls r2, 1
	ands r2, r4
	mov r0, r8
	bl CpuSet
	movs r6, 0
	ldrb r0, [r5, 0x4]
	cmp r6, r0
	bcs _0809A704
_0809A6EA:
	lsls r0, r6, 2
	ldr r1, [r5]
	adds r1, r0
	adds r0, r1, 0x2
	ldrh r1, [r1, 0x2]
	bl SetBagItemQuantity
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r1, [r5, 0x4]
	cmp r6, r1
	bcc _0809A6EA
_0809A704:
	mov r0, r8
	bl Free
_0809A70A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A71C: .4byte 0x001fffff
	thumb_func_end sub_809A5E4

	thumb_func_start sub_809A720
sub_809A720: @ 809A720
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	movs r3, 0
	b _0809A786
_0809A72C:
	adds r1, r3, 0x1
	lsls r0, r1, 16
	lsrs r5, r0, 16
	mov r8, r1
	cmp r5, r2
	bcs _0809A780
	lsls r7, r3, 2
_0809A73A:
	ldr r0, [r6]
	adds r0, r7
	adds r0, 0x2
	bl GetBagItemQuantity
	lsls r0, 16
	lsls r4, r5, 2
	cmp r0, 0
	beq _0809A76A
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x2
	bl GetBagItemQuantity
	lsls r0, 16
	cmp r0, 0
	beq _0809A774
	ldr r0, [r6]
	adds r1, r7, r0
	adds r0, r4, r0
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bls _0809A774
_0809A76A:
	ldr r1, [r6]
	adds r0, r1, r7
	adds r1, r4
	bl sub_809A578
_0809A774:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r6, 0x4]
	cmp r5, r0
	bcc _0809A73A
_0809A780:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r3, r0, 16
_0809A786:
	ldrb r2, [r6, 0x4]
	cmp r3, r2
	bcc _0809A72C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809A720

	thumb_func_start BagGetItemIdByPocketPosition
BagGetItemIdByPocketPosition: @ 809A798
	lsls r0, 24
	lsls r1, 16
	ldr r2, _0809A7B0 @ =gBagPockets
	lsrs r0, 21
	subs r0, 0x8
	adds r0, r2
	ldr r0, [r0]
	lsrs r1, 14
	adds r1, r0
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_0809A7B0: .4byte gBagPockets
	thumb_func_end BagGetItemIdByPocketPosition

	thumb_func_start BagGetQuantityByPocketPosition
BagGetQuantityByPocketPosition: @ 809A7B4
	push {lr}
	lsls r0, 24
	lsls r1, 16
	ldr r2, _0809A7D8 @ =gBagPockets
	lsrs r0, 21
	subs r0, 0x8
	adds r0, r2
	lsrs r1, 14
	ldr r0, [r0]
	adds r0, r1
	adds r0, 0x2
	bl GetBagItemQuantity
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0809A7D8: .4byte gBagPockets
	thumb_func_end BagGetQuantityByPocketPosition

	thumb_func_start sub_809A7DC
sub_809A7DC: @ 809A7DC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 21
	ldr r1, _0809A7F4 @ =gUnknown_2039884
	adds r3, r0, r1
	movs r2, 0
	b _0809A816
	.align 2, 0
_0809A7F4: .4byte gUnknown_2039884
_0809A7F8:
	ldr r0, [r3]
	lsls r1, r2, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r4
	bne _0809A810
	adds r0, r1, 0x2
	bl GetBagItemQuantity
	lsls r0, 16
	lsrs r0, 16
	b _0809A81E
_0809A810:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_0809A816:
	ldrb r0, [r3, 0x4]
	cmp r2, r0
	bcc _0809A7F8
	movs r0, 0
_0809A81E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809A7DC

	thumb_func_start sub_809A824
sub_809A824: @ 809A824
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _0809A894 @ =0xfea30000
	adds r0, r1
	lsrs r0, 16
	cmp r0, 0xD
	bls _0809A85A
	movs r0, 0xB7
	lsls r0, 1
	cmp r5, r0
	beq _0809A85A
	adds r0, 0x2
	cmp r5, r0
	beq _0809A85A
	adds r0, 0x1
	cmp r5, r0
	beq _0809A85A
	adds r0, 0x3
	cmp r5, r0
	beq _0809A85A
	adds r0, 0x1
	cmp r5, r0
	beq _0809A85A
	adds r0, 0x1
	cmp r5, r0
	bne _0809A88C
_0809A85A:
	ldr r0, _0809A898 @ =0x00000169
	cmp r5, r0
	bne _0809A86E
	ldr r0, _0809A89C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	movs r0, 0x81
	lsls r0, 2
	cmp r1, r0
	bne _0809A88C
_0809A86E:
	movs r0, 0x4
	bl Alloc
	adds r4, r0, 0
	strh r5, [r4]
	ldr r0, _0809A8A0 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r4, 0x2]
	movs r0, 0x28
	adds r1, r4, 0
	bl sub_8113550
	adds r0, r4, 0
	bl Free
_0809A88C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A894: .4byte 0xfea30000
_0809A898: .4byte 0x00000169
_0809A89C: .4byte gSaveBlock1Ptr
_0809A8A0: .4byte gMapHeader
	thumb_func_end sub_809A824

	thumb_func_start SanitizeItemId
SanitizeItemId: @ 809A8A4
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xBB
	lsls r0, 1
	cmp r1, r0
	bhi _0809A8B6
	adds r0, r1, 0
	b _0809A8B8
_0809A8B6:
	movs r0, 0
_0809A8B8:
	pop {r1}
	bx r1
	thumb_func_end SanitizeItemId

	thumb_func_start ItemId_GetName
ItemId_GetName: @ 809A8BC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	ldr r1, _0809A8D8 @ =gItems
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_0809A8D8: .4byte gItems
	thumb_func_end ItemId_GetName

	thumb_func_start itemid_get_number
itemid_get_number: @ 809A8DC
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A8FC @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrh r0, [r0, 0xE]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A8FC: .4byte gItems
	thumb_func_end itemid_get_number

	thumb_func_start itemid_get_market_price
itemid_get_market_price: @ 809A900
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A920 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrh r0, [r0, 0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A920: .4byte gItems
	thumb_func_end itemid_get_market_price

	thumb_func_start ItemId_GetHoldEffect
ItemId_GetHoldEffect: @ 809A924
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A944 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x12]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A944: .4byte gItems
	thumb_func_end ItemId_GetHoldEffect

	thumb_func_start ItemId_GetHoldEffectParam
ItemId_GetHoldEffectParam: @ 809A948
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A968 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x13]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A968: .4byte gItems
	thumb_func_end ItemId_GetHoldEffectParam

	thumb_func_start ItemId_GetDescription
ItemId_GetDescription: @ 809A96C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A98C @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x14
	adds r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A98C: .4byte gItems
	thumb_func_end ItemId_GetDescription

	thumb_func_start itemid_is_unique
itemid_is_unique: @ 809A990
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A9B0 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x18]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A9B0: .4byte gItems
	thumb_func_end itemid_is_unique

	thumb_func_start itemid_get_x19
itemid_get_x19: @ 809A9B4
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A9D4 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x19]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A9D4: .4byte gItems
	thumb_func_end itemid_get_x19

	thumb_func_start ItemId_GetPocket
ItemId_GetPocket: @ 809A9D8
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A9F8 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1A]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A9F8: .4byte gItems
	thumb_func_end ItemId_GetPocket

	thumb_func_start ItemId_GetType
ItemId_GetType: @ 809A9FC
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AA1C @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1B]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AA1C: .4byte gItems
	thumb_func_end ItemId_GetType

	thumb_func_start ItemId_GetFieldFunc
ItemId_GetFieldFunc: @ 809AA20
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AA40 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x1C
	adds r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AA40: .4byte gItems
	thumb_func_end ItemId_GetFieldFunc

	thumb_func_start ItemId_GetBattleUsage
ItemId_GetBattleUsage: @ 809AA44
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AA64 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AA64: .4byte gItems
	thumb_func_end ItemId_GetBattleUsage

	thumb_func_start ItemId_GetBattleFunc
ItemId_GetBattleFunc: @ 809AA68
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AA88 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x24
	adds r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AA88: .4byte gItems
	thumb_func_end ItemId_GetBattleFunc

	thumb_func_start ItemId_GetSecondaryId
ItemId_GetSecondaryId: @ 809AA8C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AAAC @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	adds r0, 0x28
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AAAC: .4byte gItems
	thumb_func_end ItemId_GetSecondaryId

	.align 2, 0 @ Don't pad with nop.
