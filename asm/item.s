	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start GetBagItemQuantity
GetBagItemQuantity: @ 8099DA0
	adds r1, r0, 0
	ldr r0, _08099DB8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r2, 0xF2
	lsls r2, 4
	adds r0, r2
	ldr r0, [r0]
	ldrh r1, [r1]
	eors r0, r1
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_08099DB8: .4byte gSaveBlock2Ptr
	thumb_func_end GetBagItemQuantity

	thumb_func_start sub_8099DBC
sub_8099DBC: @ 8099DBC
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08099DD4 @ =gSaveBlock2Ptr
	ldr r2, [r2]
	movs r3, 0xF2
	lsls r3, 4
	adds r2, r3
	ldr r2, [r2]
	eors r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08099DD4: .4byte gSaveBlock2Ptr
	thumb_func_end sub_8099DBC

	thumb_func_start GetBagItemId
GetBagItemId: @ 8099DD8
	ldrh r0, [r0]
	bx lr
	thumb_func_end GetBagItemId

	thumb_func_start sub_8099DDC
sub_8099DDC: @ 8099DDC
	strh r1, [r0]
	bx lr
	thumb_func_end sub_8099DDC

	thumb_func_start ApplyNewEncryptionKeyToBagItems
ApplyNewEncryptionKeyToBagItems: @ 8099DE0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r8, r0
	movs r1, 0
	ldr r0, _08099E34 @ =gUnknown_203988C
	mov r9, r0
_08099DF2:
	movs r6, 0
	lsls r5, r1, 3
	mov r2, r9
	adds r0, r5, r2
	adds r7, r1, 0x1
	ldrb r0, [r0, 0x4]
	cmp r6, r0
	bcs _08099E20
	ldr r2, _08099E34 @ =gUnknown_203988C
_08099E04:
	adds r4, r5, r2
	lsls r1, r6, 2
	ldr r0, [r4]
	adds r0, r1
	adds r0, 0x2
	mov r1, r8
	str r2, [sp]
	bl ApplyNewEncryptionKeyToHword
	adds r6, 0x1
	ldr r2, [sp]
	ldrb r4, [r4, 0x4]
	cmp r6, r4
	bcc _08099E04
_08099E20:
	adds r1, r7, 0
	cmp r1, 0x4
	bls _08099DF2
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099E34: .4byte gUnknown_203988C
	thumb_func_end ApplyNewEncryptionKeyToBagItems

	thumb_func_start ApplyNewEncryptionKeyToBagItems_
ApplyNewEncryptionKeyToBagItems_: @ 8099E38
	push {lr}
	bl ApplyNewEncryptionKeyToBagItems
	pop {r0}
	bx r0
	thumb_func_end ApplyNewEncryptionKeyToBagItems_

	thumb_func_start sub_8099E44
sub_8099E44: @ 8099E44
	ldr r1, _08099E84 @ =gUnknown_203988C
	ldr r0, _08099E88 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r3, 0xC4
	lsls r3, 2
	adds r0, r2, r3
	str r0, [r1]
	movs r0, 0x2A
	strb r0, [r1, 0x4]
	adds r3, 0xA8
	adds r0, r2, r3
	str r0, [r1, 0x8]
	movs r0, 0x1E
	strb r0, [r1, 0xC]
	adds r3, 0x78
	adds r0, r2, r3
	str r0, [r1, 0x10]
	movs r0, 0xD
	strb r0, [r1, 0x14]
	adds r3, 0x34
	adds r0, r2, r3
	str r0, [r1, 0x18]
	movs r0, 0x3A
	strb r0, [r1, 0x1C]
	ldr r0, _08099E8C @ =0x0000054c
	adds r2, r0
	str r2, [r1, 0x20]
	adds r1, 0x24
	movs r0, 0x2B
	strb r0, [r1]
	bx lr
	.align 2, 0
_08099E84: .4byte gUnknown_203988C
_08099E88: .4byte gSaveBlock1Ptr
_08099E8C: .4byte 0x0000054c
	thumb_func_end sub_8099E44

	thumb_func_start sub_8099E90
sub_8099E90: @ 8099E90
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08099EB8
	movs r0, 0x2B
	bl sub_809C8A0
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _08099EB4 @ =gUnknown_84162BD
	adds r0, r4, 0
	bl StringAppend
	b _08099EC4
	.align 2, 0
_08099EB4: .4byte gUnknown_84162BD
_08099EB8:
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
_08099EC4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8099E90

	thumb_func_start sub_8099ECC
sub_8099ECC: @ 8099ECC
	push {lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _08099EF0 @ =gUnknown_203988C
	lsrs r0, 21
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _08099EFE
	ldr r3, [r0]
_08099EE0:
	lsls r0, r2, 2
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _08099EF4
	lsls r0, r2, 24
	asrs r0, 24
	b _08099F02
	.align 2, 0
_08099EF0: .4byte gUnknown_203988C
_08099EF4:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	bcc _08099EE0
_08099EFE:
	movs r0, 0x1
	negs r0, r0
_08099F02:
	pop {r1}
	bx r1
	thumb_func_end sub_8099ECC

	thumb_func_start sub_8099F08
sub_8099F08: @ 8099F08
	push {lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _08099F2C @ =gUnknown_203988C
	lsrs r0, 21
	subs r0, 0x8
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _08099F3A
	ldr r3, [r0]
_08099F1E:
	lsls r0, r2, 2
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _08099F30
	movs r0, 0x1
	b _08099F3C
	.align 2, 0
_08099F2C: .4byte gUnknown_203988C
_08099F30:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _08099F1E
_08099F3A:
	movs r0, 0
_08099F3C:
	pop {r1}
	bx r1
	thumb_func_end sub_8099F08

	thumb_func_start sub_8099F40
sub_8099F40: @ 8099F40
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	bne _08099F5C
	b _08099FA4
_08099F58:
	movs r0, 0x1
	b _08099FA6
_08099F5C:
	adds r0, r4, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	movs r2, 0
	ldr r1, _08099F94 @ =gUnknown_203988C
	lsrs r0, 21
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _08099FA4
	adds r3, r0, 0
_08099F76:
	ldr r0, [r3]
	lsls r1, r2, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r4
	bne _08099F98
	adds r0, r1, 0x2
	bl GetBagItemQuantity
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	bcs _08099F58
	b _08099FA4
	.align 2, 0
_08099F94: .4byte gUnknown_203988C
_08099F98:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x4]
	cmp r2, r0
	bcc _08099F76
_08099FA4:
	movs r0, 0
_08099FA6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8099F40

	thumb_func_start sub_8099FAC
sub_8099FAC: @ 8099FAC
	push {r4,lr}
	ldr r0, _08099FC0 @ =0x0000016d
	movs r1, 0x1
	bl sub_8099F40
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08099FD4
	b _08099FF0
	.align 2, 0
_08099FC0: .4byte 0x0000016d
_08099FC4:
	ldr r1, _08099FD0 @ =gUnknown_20370D0
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
	b _08099FF6
	.align 2, 0
_08099FD0: .4byte gUnknown_20370D0
_08099FD4:
	movs r4, 0x85
_08099FD6:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8099F40
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08099FC4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xAF
	bls _08099FD6
_08099FF0:
	ldr r0, _08099FFC @ =gUnknown_20370D0
	strh r1, [r0]
	movs r0, 0
_08099FF6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099FFC: .4byte gUnknown_20370D0
	thumb_func_end sub_8099FAC

	thumb_func_start sub_809A000
sub_809A000: @ 809A000
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	adds r0, r4, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	beq _0809A050
	adds r0, r4, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r2, 0
	ldr r1, _0809A054 @ =gUnknown_203988C
	lsls r0, r5, 3
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _0809A068
	adds r3, r0, 0
_0809A032:
	ldr r0, [r3]
	lsls r1, r2, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r4
	bne _0809A05C
	adds r0, r1, 0x2
	bl GetBagItemQuantity
	lsls r0, 16
	lsrs r0, 16
	adds r0, r6
	ldr r1, _0809A058 @ =0x000003e7
	cmp r0, r1
	ble _0809A07A
_0809A050:
	movs r0, 0
	b _0809A07C
	.align 2, 0
_0809A054: .4byte gUnknown_203988C
_0809A058: .4byte 0x000003e7
_0809A05C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x4]
	cmp r2, r0
	bcc _0809A032
_0809A068:
	adds r0, r5, 0
	bl sub_8099ECC
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _0809A050
_0809A07A:
	movs r0, 0x1
_0809A07C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_809A000

	thumb_func_start sub_809A084
sub_809A084: @ 809A084
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	adds r0, r6, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	bne _0809A0A2
	b _0809A1CA
_0809A0A2:
	adds r0, r6, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	movs r2, 0
	ldr r1, _0809A0E0 @ =gUnknown_203988C
	lsls r0, r7, 3
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _0809A0F4
	adds r5, r0, 0
_0809A0BE:
	ldr r0, [r5]
	lsls r4, r2, 2
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, r6
	bne _0809A0E8
	adds r0, r1, 0x2
	bl GetBagItemQuantity
	lsls r0, 16
	lsrs r0, 16
	mov r2, r8
	adds r1, r0, r2
	ldr r0, _0809A0E4 @ =0x000003e7
	cmp r1, r0
	ble _0809A1B8
	b _0809A1CA
	.align 2, 0
_0809A0E0: .4byte gUnknown_203988C
_0809A0E4: .4byte 0x000003e7
_0809A0E8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r5, 0x4]
	cmp r2, r0
	bcc _0809A0BE
_0809A0F4:
	cmp r7, 0x3
	bne _0809A132
	movs r4, 0xB6
	lsls r4, 1
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8099F40
	lsls r0, 24
	cmp r0, 0
	bne _0809A132
	movs r0, 0x1
	bl sub_8099ECC
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0809A1CA
	ldr r2, _0809A1AC @ =gUnknown_203988C
	ldr r0, [r2, 0x8]
	lsls r1, 2
	adds r0, r1, r0
	strh r4, [r0]
	ldr r0, [r2, 0x8]
	adds r0, r1
	adds r0, 0x2
	movs r1, 0x1
	bl sub_8099DBC
_0809A132:
	cmp r7, 0x4
	bne _0809A174
	ldr r4, _0809A1B0 @ =0x0000016d
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8099F40
	lsls r0, 24
	cmp r0, 0
	bne _0809A174
	movs r0, 0x1
	bl sub_8099ECC
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0809A1CA
	ldr r2, _0809A1AC @ =gUnknown_203988C
	ldr r0, [r2, 0x8]
	lsls r1, 2
	adds r0, r1, r0
	strh r4, [r0]
	ldr r0, [r2, 0x8]
	adds r0, r1
	adds r0, 0x2
	movs r1, 0x1
	bl sub_8099DBC
	ldr r0, _0809A1B4 @ =0x00000847
	bl FlagSet
_0809A174:
	ldr r0, _0809A1B0 @ =0x0000016d
	cmp r6, r0
	bne _0809A180
	ldr r0, _0809A1B4 @ =0x00000847
	bl FlagSet
_0809A180:
	adds r0, r7, 0
	bl sub_8099ECC
	lsls r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _0809A1CA
	ldr r0, _0809A1AC @ =gUnknown_203988C
	lsls r1, r7, 3
	adds r1, r0
	ldr r0, [r1]
	lsls r2, 2
	adds r0, r2, r0
	strh r6, [r0]
	ldr r0, [r1]
	adds r0, r2
	adds r0, 0x2
	mov r1, r8
	b _0809A1C2
	.align 2, 0
_0809A1AC: .4byte gUnknown_203988C
_0809A1B0: .4byte 0x0000016d
_0809A1B4: .4byte 0x00000847
_0809A1B8:
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r5]
	adds r0, r4
	adds r0, 0x2
_0809A1C2:
	bl sub_8099DBC
	movs r0, 0x1
	b _0809A1CC
_0809A1CA:
	movs r0, 0
_0809A1CC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809A084

	thumb_func_start sub_809A1D8
sub_809A1D8: @ 809A1D8
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r4, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	beq _0809A258
	cmp r4, 0
	beq _0809A258
	adds r0, r4, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	movs r2, 0
	ldr r1, _0809A248 @ =gUnknown_203988C
	lsrs r0, 21
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _0809A258
	adds r6, r0, 0
_0809A20C:
	ldr r0, [r6]
	lsls r5, r2, 2
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, r4
	bne _0809A24C
	adds r0, r1, 0x2
	bl GetBagItemQuantity
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	bcc _0809A258
	subs r0, r7
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r6]
	adds r0, r5
	adds r0, 0x2
	adds r1, r4, 0
	bl sub_8099DBC
	cmp r4, 0
	bne _0809A242
	ldr r0, [r6]
	adds r0, r5, r0
	strh r4, [r0]
_0809A242:
	movs r0, 0x1
	b _0809A25A
	.align 2, 0
_0809A248: .4byte gUnknown_203988C
_0809A24C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r6, 0x4]
	cmp r2, r0
	bcc _0809A20C
_0809A258:
	movs r0, 0
_0809A25A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809A1D8

	thumb_func_start GetPocketByItemId
GetPocketByItemId: @ 809A260
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetPocketByItemId

	thumb_func_start ClearItemSlots
ClearItemSlots: @ 809A274
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	movs r4, 0
	lsrs r1, 24
	cmp r4, r1
	bcs _0809A29E
	adds r5, r1, 0
	movs r7, 0
_0809A286:
	lsls r0, r4, 2
	adds r0, r6
	strh r7, [r0]
	adds r0, 0x2
	movs r1, 0
	bl sub_8099DBC
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bcc _0809A286
_0809A29E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ClearItemSlots

	thumb_func_start sub_809A2A4
sub_809A2A4: @ 809A2A4
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0xA6
	lsls r5, 2
_0809A2AC:
	ldr r0, _0809A2D8 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	lsls r3, r4, 2
	adds r1, r0, r3
	adds r1, r5
	movs r2, 0
	strh r2, [r1]
	adds r3, r5
	adds r0, r3
	adds r0, 0x2
	movs r1, 0
	bl sub_8099DDC
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _0809A2AC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A2D8: .4byte gSaveBlock1Ptr
	thumb_func_end sub_809A2A4

	thumb_func_start sub_809A2DC
sub_809A2DC: @ 809A2DC
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0809A300 @ =gUnknown_203988C
_0809A2E2:
	lsls r1, r4, 3
	adds r1, r5
	ldr r0, [r1]
	ldrb r1, [r1, 0x4]
	bl ClearItemSlots
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _0809A2E2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A300: .4byte gUnknown_203988C
	thumb_func_end sub_809A2DC

	thumb_func_start sub_809A304
sub_809A304: @ 809A304
	push {lr}
	movs r1, 0
	ldr r0, _0809A324 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r3, 0xA6
	lsls r3, 2
_0809A310:
	lsls r0, r1, 24
	asrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r2, r0
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809A328
	adds r0, r1, 0
	b _0809A338
	.align 2, 0
_0809A324: .4byte gSaveBlock1Ptr
_0809A328:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0x1D
	ble _0809A310
	movs r0, 0x1
	negs r0, r0
_0809A338:
	pop {r1}
	bx r1
	thumb_func_end sub_809A304

	thumb_func_start sub_809A33C
sub_809A33C: @ 809A33C
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r0, _0809A370 @ =gSaveBlock1Ptr
	ldr r3, [r0]
	movs r4, 0xA6
	lsls r4, 2
_0809A34A:
	lsls r0, r1, 2
	adds r0, r3, r0
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809A35C
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0809A35C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1D
	bls _0809A34A
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A370: .4byte gSaveBlock1Ptr
	thumb_func_end sub_809A33C

	thumb_func_start sub_809A374
sub_809A374: @ 809A374
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
_0809A380:
	ldr r0, _0809A3AC @ =gSaveBlock1Ptr
	ldr r2, [r0]
	lsls r1, r4, 2
	adds r0, r2, r1
	movs r3, 0xA6
	lsls r3, 2
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r6
	bne _0809A3B4
	adds r0, r1, r2
	ldr r1, _0809A3B0 @ =0x0000029a
	adds r0, r1
	bl GetBagItemId
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _0809A3B4
	movs r0, 0x1
	b _0809A3C0
	.align 2, 0
_0809A3AC: .4byte gSaveBlock1Ptr
_0809A3B0: .4byte 0x0000029a
_0809A3B4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1D
	bls _0809A380
	movs r0, 0
_0809A3C0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_809A374

	thumb_func_start sub_809A3C8
sub_809A3C8: @ 809A3C8
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	movs r3, 0
	ldr r6, _0809A404 @ =gSaveBlock1Ptr
_0809A3D6:
	ldr r2, [r6]
	lsls r1, r3, 2
	adds r0, r2, r1
	movs r7, 0xA6
	lsls r7, 2
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, r4
	bne _0809A40C
	adds r0, r7, 0
	adds r4, r1, r0
	adds r0, r2, r4
	adds r0, 0x2
	bl GetBagItemId
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, r5
	ldr r0, _0809A408 @ =0x000003e7
	cmp r1, r0
	ble _0809A444
	b _0809A456
	.align 2, 0
_0809A404: .4byte gSaveBlock1Ptr
_0809A408: .4byte 0x000003e7
_0809A40C:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1D
	bls _0809A3D6
	bl sub_809A304
	lsls r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _0809A456
	ldr r0, _0809A440 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	lsls r2, 2
	adds r1, r0, r2
	movs r3, 0xA6
	lsls r3, 2
	adds r1, r3
	strh r4, [r1]
	adds r2, r3
	adds r0, r2
	adds r0, 0x2
	adds r1, r5, 0
	b _0809A44E
	.align 2, 0
_0809A440: .4byte gSaveBlock1Ptr
_0809A444:
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r6]
	adds r0, r4
	adds r0, 0x2
_0809A44E:
	bl sub_8099DDC
	movs r0, 0x1
	b _0809A458
_0809A456:
	movs r0, 0
_0809A458:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809A3C8

	thumb_func_start sub_809A460
sub_809A460: @ 809A460
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	cmp r2, 0
	beq _0809A4D8
	movs r4, 0
	ldr r0, _0809A4E4 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r3, 0xA6
	lsls r3, 2
	adds r1, r3
	ldrh r1, [r1]
	adds r7, r0, 0
	cmp r1, r2
	beq _0809A49E
	adds r5, r7, 0
_0809A48A:
	adds r4, 0x1
	cmp r4, 0x1D
	bhi _0809A49E
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r0, r1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0809A48A
_0809A49E:
	cmp r4, 0x1E
	beq _0809A4D8
	lsls r6, r4, 2
	movs r0, 0xA6
	lsls r0, 2
	adds r4, r6, r0
	ldr r0, [r7]
	adds r0, r4
	adds r0, 0x2
	bl GetBagItemId
	mov r1, r8
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r7]
	adds r0, r4
	adds r0, 0x2
	adds r1, r5, 0
	bl sub_8099DDC
	cmp r5, 0
	bne _0809A4D8
	ldr r0, [r7]
	adds r0, r6
	movs r1, 0xA6
	lsls r1, 2
	adds r0, r1
	strh r5, [r0]
_0809A4D8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A4E4: .4byte gSaveBlock1Ptr
	thumb_func_end sub_809A460

	thumb_func_start sub_809A4E8
sub_809A4E8: @ 809A4E8
	push {r4-r7,lr}
	movs r2, 0
_0809A4EC:
	adds r1, r2, 0x1
	lsls r0, r1, 16
	lsrs r4, r0, 16
	adds r6, r1, 0
	cmp r4, 0x1D
	bhi _0809A52E
	ldr r0, _0809A53C @ =gSaveBlock1Ptr
	mov r12, r0
	lsls r5, r2, 2
	movs r7, 0xA6
	lsls r7, 2
_0809A502:
	mov r0, r12
	ldr r1, [r0]
	adds r0, r1, r5
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809A524
	movs r0, 0xA6
	lsls r0, 2
	adds r1, r0
	adds r2, r1, r5
	ldr r3, [r2]
	lsls r0, r4, 2
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
_0809A524:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _0809A502
_0809A52E:
	lsls r0, r6, 16
	lsrs r2, r0, 16
	cmp r2, 0x1C
	bls _0809A4EC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A53C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_809A4E8

	thumb_func_start sub_809A540
sub_809A540: @ 809A540
	push {lr}
	ldr r0, _0809A55C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r2, _0809A560 @ =0x00000296
	adds r1, r0, r2
	ldrh r2, [r1]
	ldr r3, _0809A564 @ =0x00000103
	cmp r2, r3
	beq _0809A568
	movs r0, 0x88
	lsls r0, 1
	cmp r2, r0
	beq _0809A570
	b _0809A572
	.align 2, 0
_0809A55C: .4byte gSaveBlock1Ptr
_0809A560: .4byte 0x00000296
_0809A564: .4byte 0x00000103
_0809A568:
	movs r0, 0x88
	lsls r0, 1
	strh r0, [r1]
	b _0809A572
_0809A570:
	strh r3, [r1]
_0809A572:
	pop {r0}
	bx r0
	thumb_func_end sub_809A540

	thumb_func_start sub_809A578
sub_809A578: @ 809A578
	ldr r3, [r0]
	ldr r2, [r1]
	str r2, [r0]
	str r3, [r1]
	bx lr
	thumb_func_end sub_809A578

	thumb_func_start sub_809A584
sub_809A584: @ 809A584
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	subs r0, r1, 0x1
	cmp r2, r0
	bge _0809A5D8
	adds r6, r1, 0
	mov r9, r0
_0809A59E:
	adds r1, r2, 0x1
	lsls r0, r1, 16
	lsrs r4, r0, 16
	adds r7, r1, 0
	cmp r4, r6
	bcs _0809A5D0
	lsls r0, r2, 2
	mov r1, r8
	adds r5, r1, r0
_0809A5B0:
	adds r0, r5, 0x2
	bl GetBagItemQuantity
	lsls r0, 16
	cmp r0, 0
	bne _0809A5C6
	lsls r1, r4, 2
	add r1, r8
	adds r0, r5, 0
	bl sub_809A578
_0809A5C6:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r6
	bcc _0809A5B0
_0809A5D0:
	lsls r0, r7, 16
	lsrs r2, r0, 16
	cmp r2, r9
	blt _0809A59E
_0809A5D8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809A584

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
	bl sub_8099DBC
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

	thumb_func_start sub_809A798
sub_809A798: @ 809A798
	lsls r0, 24
	lsls r1, 16
	ldr r2, _0809A7B0 @ =gUnknown_203988C
	lsrs r0, 21
	subs r0, 0x8
	adds r0, r2
	ldr r0, [r0]
	lsrs r1, 14
	adds r1, r0
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_0809A7B0: .4byte gUnknown_203988C
	thumb_func_end sub_809A798

	thumb_func_start sub_809A7B4
sub_809A7B4: @ 809A7B4
	push {lr}
	lsls r0, 24
	lsls r1, 16
	ldr r2, _0809A7D8 @ =gUnknown_203988C
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
_0809A7D8: .4byte gUnknown_203988C
	thumb_func_end sub_809A7B4

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

	thumb_func_start ItemId_GetItem
ItemId_GetItem: @ 809A8BC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	ldr r1, _0809A8D8 @ =gUnknown_83DB028
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_0809A8D8: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetItem

	thumb_func_start itemid_get_number
itemid_get_number: @ 809A8DC
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A8FC @ =gUnknown_83DB028
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
_0809A8FC: .4byte gUnknown_83DB028
	thumb_func_end itemid_get_number

	thumb_func_start itemid_get_market_price
itemid_get_market_price: @ 809A900
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A920 @ =gUnknown_83DB028
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
_0809A920: .4byte gUnknown_83DB028
	thumb_func_end itemid_get_market_price

	thumb_func_start ItemId_GetHoldEffect
ItemId_GetHoldEffect: @ 809A924
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A944 @ =gUnknown_83DB028
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
_0809A944: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetHoldEffect

	thumb_func_start ItemId_GetHoldEffectParam
ItemId_GetHoldEffectParam: @ 809A948
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A968 @ =gUnknown_83DB028
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
_0809A968: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetHoldEffectParam

	thumb_func_start ItemId_GetDescription
ItemId_GetDescription: @ 809A96C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A98C @ =gUnknown_83DB028
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
_0809A98C: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetDescription

	thumb_func_start itemid_is_unique
itemid_is_unique: @ 809A990
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A9B0 @ =gUnknown_83DB028
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
_0809A9B0: .4byte gUnknown_83DB028
	thumb_func_end itemid_is_unique

	thumb_func_start itemid_get_x19
itemid_get_x19: @ 809A9B4
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A9D4 @ =gUnknown_83DB028
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
_0809A9D4: .4byte gUnknown_83DB028
	thumb_func_end itemid_get_x19

	thumb_func_start ItemId_GetPocket
ItemId_GetPocket: @ 809A9D8
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809A9F8 @ =gUnknown_83DB028
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
_0809A9F8: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetPocket

	thumb_func_start ItemId_GetType
ItemId_GetType: @ 809A9FC
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AA1C @ =gUnknown_83DB028
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
_0809AA1C: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetType

	thumb_func_start ItemId_GetFieldFunc
ItemId_GetFieldFunc: @ 809AA20
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AA40 @ =gUnknown_83DB028
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
_0809AA40: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetFieldFunc

	thumb_func_start ItemId_GetBattleUsage
ItemId_GetBattleUsage: @ 809AA44
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AA64 @ =gUnknown_83DB028
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
_0809AA64: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetBattleUsage

	thumb_func_start ItemId_GetBattleFunc
ItemId_GetBattleFunc: @ 809AA68
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AA88 @ =gUnknown_83DB028
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
_0809AA88: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetBattleFunc

	thumb_func_start ItemId_GetSecondaryId
ItemId_GetSecondaryId: @ 809AA8C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0809AAAC @ =gUnknown_83DB028
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
_0809AAAC: .4byte gUnknown_83DB028
	thumb_func_end ItemId_GetSecondaryId

	.align 2, 0 @ Don't pad with nop.
