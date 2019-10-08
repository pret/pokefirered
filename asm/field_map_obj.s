	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start npc_clear_ids_and_state
npc_clear_ids_and_state: @ 805DE2C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	movs r2, 0x24
	bl memset
	movs r0, 0xFF
	strb r0, [r4, 0x8]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4, 0x9]
	strb r0, [r4, 0xA]
	strb r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end npc_clear_ids_and_state

	thumb_func_start npcs_clear_ids_and_state
npcs_clear_ids_and_state: @ 805DE4C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0805DE70 @ =gMapObjects
_0805DE52:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	bl npc_clear_ids_and_state
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0805DE52
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DE70: .4byte gMapObjects
	thumb_func_end npcs_clear_ids_and_state

	thumb_func_start sub_805DE74
sub_805DE74: @ 805DE74
	push {lr}
	bl strange_npc_table_clear
	bl npcs_clear_ids_and_state
	bl ClearPlayerAvatarInfo
	bl sub_805DE8C
	pop {r0}
	bx r0
	thumb_func_end sub_805DE74

	thumb_func_start sub_805DE8C
sub_805DE8C: @ 805DE8C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldr r0, _0805DF28 @ =gUnknown_83A0010
	ldr r0, [r0, 0x54]
	mov r9, r0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805DF2C @ =gSprites
	mov r10, r1
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r10
	ldrb r1, [r4, 0x1]
	movs r5, 0x4
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	movs r1, 0x1
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r6, 0x4
	orrs r0, r6
	strb r0, [r4]
	mov r0, r9
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r10
	ldrb r0, [r4, 0x1]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805DF28: .4byte gUnknown_83A0010
_0805DF2C: .4byte gSprites
	thumb_func_end sub_805DE8C

	thumb_func_start sub_805DF30
sub_805DF30: @ 805DF30
	push {lr}
	movs r1, 0
	ldr r2, _0805DF3C @ =gMapObjects
	ldrb r0, [r2]
	b _0805DF54
	.align 2, 0
_0805DF3C: .4byte gMapObjects
_0805DF40:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bhi _0805DF5A
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
_0805DF54:
	lsls r0, 31
	cmp r0, 0
	bne _0805DF40
_0805DF5A:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805DF30

	thumb_func_start GetFieldObjectIdByLocalIdAndMap
GetFieldObjectIdByLocalIdAndMap: @ 805DF60
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0xFE
	bls _0805DF78
	bl GetFieldObjectIdByLocalId
	b _0805DF7C
_0805DF78:
	bl GetFieldObjectIdByLocalIdAndMapInternal
_0805DF7C:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByLocalIdAndMap

	thumb_func_start TryGetFieldObjectIdByLocalIdAndMap
TryGetFieldObjectIdByLocalIdAndMap: @ 805DF84
	push {r4,lr}
	adds r4, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectIdByLocalIdAndMap
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _0805DFA6
	movs r0, 0
	b _0805DFA8
_0805DFA6:
	movs r0, 0x1
_0805DFA8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryGetFieldObjectIdByLocalIdAndMap

	thumb_func_start GetFieldObjectIdByXY
GetFieldObjectIdByXY: @ 805DFB0
	push {r4-r6,lr}
	movs r3, 0
	ldr r5, _0805DFF0 @ =gMapObjects
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r1, 16
_0805DFBE:
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r5
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _0805DFDE
	movs r6, 0x10
	ldrsh r0, [r2, r6]
	cmp r0, r4
	bne _0805DFDE
	movs r6, 0x12
	ldrsh r0, [r2, r6]
	cmp r0, r1
	beq _0805DFE8
_0805DFDE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0805DFBE
_0805DFE8:
	adds r0, r3, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805DFF0: .4byte gMapObjects
	thumb_func_end GetFieldObjectIdByXY

	thumb_func_start GetFieldObjectIdByLocalIdAndMapInternal
GetFieldObjectIdByLocalIdAndMapInternal: @ 805DFF4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	ldr r6, _0805E02C @ =gMapObjects
_0805E006:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r6
	ldrb r0, [r3]
	lsls r0, 31
	cmp r0, 0
	beq _0805E030
	ldrb r0, [r3, 0x8]
	cmp r0, r5
	bne _0805E030
	ldrb r0, [r3, 0x9]
	cmp r0, r4
	bne _0805E030
	ldrb r0, [r3, 0xA]
	cmp r0, r2
	bne _0805E030
	adds r0, r1, 0
	b _0805E03C
	.align 2, 0
_0805E02C: .4byte gMapObjects
_0805E030:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _0805E006
	movs r0, 0x10
_0805E03C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByLocalIdAndMapInternal

	thumb_func_start GetFieldObjectIdByLocalId
GetFieldObjectIdByLocalId: @ 805E044
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _0805E068 @ =gMapObjects
_0805E04E:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0805E06C
	ldrb r0, [r1, 0x8]
	cmp r0, r3
	bne _0805E06C
	adds r0, r2, 0
	b _0805E078
	.align 2, 0
_0805E068: .4byte gMapObjects
_0805E06C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0805E04E
	movs r0, 0x10
_0805E078:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByLocalId

	thumb_func_start sub_805E080
sub_805E080: @ 805E080
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r0, 0
	mov r10, r0
	mov r8, r0
	mov r9, r0
	movs r1, 0
	str r1, [sp, 0x4]
	str r0, [sp, 0x8]
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	bne _0805E0DA
	movs r1, 0x1
	mov r10, r1
	ldrb r4, [r5, 0x8]
	ldrb r7, [r5, 0xC]
	ldrb r6, [r5, 0xE]
	ldrh r0, [r5, 0x4]
	mov r8, r0
	ldrh r5, [r5, 0x6]
	mov r9, r5
	mov r1, r8
	str r1, [sp, 0x4]
	mov r0, r9
	str r0, [sp, 0x8]
	adds r0, r6, 0
	adds r1, r7, 0
	bl get_mapheader_by_bank_and_number
	ldr r1, [r0, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	subs r0, 0x18
	ldr r1, [r1, 0x4]
	adds r5, r1, r0
_0805E0DA:
	ldrb r0, [r5]
	adds r1, r7, 0
	adds r2, r6, 0
	mov r3, sp
	bl GetAvailableFieldObjectSlot
	lsls r0, 24
	cmp r0, 0
	bne _0805E106
	ldr r1, [sp, 0x4]
	lsls r2, r1, 16
	asrs r2, 16
	ldr r0, [sp, 0x8]
	lsls r3, r0, 16
	asrs r3, 16
	adds r0, r5, 0
	mov r1, r10
	bl sub_805E238
	lsls r0, 24
	cmp r0, 0
	bne _0805E10A
_0805E106:
	movs r0, 0x10
	b _0805E220
_0805E10A:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805E13C @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl npc_clear_ids_and_state
	mov r1, r10
	cmp r1, 0
	beq _0805E140
	mov r1, r8
	lsls r0, r1, 16
	movs r1, 0xE0
	lsls r1, 11
	adds r0, r1
	lsrs r3, r0, 16
	mov r1, r9
	lsls r0, r1, 16
	movs r1, 0xE0
	lsls r1, 11
	adds r0, r1
	b _0805E14E
	.align 2, 0
_0805E13C: .4byte gMapObjects
_0805E140:
	ldrh r0, [r5, 0x4]
	adds r0, 0x7
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r0, [r5, 0x6]
	adds r0, 0x7
	lsls r0, 16
_0805E14E:
	lsrs r2, r0, 16
	ldrb r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1]
	strb r0, [r4, 0x5]
	ldrb r0, [r5, 0x9]
	strb r0, [r4, 0x6]
	ldrb r0, [r5]
	strb r0, [r4, 0x8]
	strb r7, [r4, 0x9]
	strb r6, [r4, 0xA]
	strh r3, [r4, 0xC]
	strh r2, [r4, 0xE]
	strh r3, [r4, 0x10]
	strh r2, [r4, 0x12]
	strh r3, [r4, 0x14]
	strh r2, [r4, 0x16]
	ldrb r0, [r5, 0x8]
	movs r6, 0xF
	adds r1, r6, 0
	ands r1, r0
	ldrb r2, [r4, 0xB]
	movs r0, 0x10
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0xB]
	ldrb r1, [r5, 0x8]
	lsls r1, 4
	ands r0, r6
	orrs r0, r1
	strb r0, [r4, 0xB]
	ldrb r1, [r5, 0xA]
	lsls r1, 28
	movs r0, 0xF
	mov r9, r0
	lsrs r1, 28
	ldrb r2, [r4, 0x19]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x19]
	ldrb r1, [r5, 0xA]
	lsrs r1, 4
	lsls r1, 4
	ands r0, r6
	orrs r0, r1
	strb r0, [r4, 0x19]
	ldrh r0, [r5, 0xC]
	strb r0, [r4, 0x7]
	ldrh r0, [r5, 0xE]
	strb r0, [r4, 0x1D]
	ldr r1, _0805E230 @ =gUnknown_839FD5D
	ldrb r0, [r5, 0x9]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x20
	strb r1, [r0]
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetDirection
	adds r0, r4, 0
	bl FieldObjectHandleDynamicGraphicsId
	ldr r1, _0805E234 @ =gUnknown_839FD0C
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805E21C
	ldrb r2, [r4, 0x19]
	adds r0, r6, 0
	ands r0, r2
	cmp r0, 0
	bne _0805E204
	lsls r0, r2, 28
	lsrs r0, 28
	adds r0, 0x1
	mov r1, r9
	ands r0, r1
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x19]
_0805E204:
	ldrb r2, [r4, 0x19]
	movs r0, 0xF0
	ands r0, r2
	cmp r0, 0
	bne _0805E21C
	lsrs r1, r2, 4
	adds r1, 0x1
	lsls r1, 4
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x19]
_0805E21C:
	mov r0, sp
	ldrb r0, [r0]
_0805E220:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E230: .4byte gUnknown_839FD5D
_0805E234: .4byte gUnknown_839FD0C
	thumb_func_end sub_805E080

	thumb_func_start sub_805E238
sub_805E238: @ 805E238
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r5, r3, 16
	cmp r1, 0
	beq _0805E25C
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r5, 16
	asrs r2, 16
	bl sub_805E27C
	lsls r0, 24
	cmp r0, 0
	beq _0805E274
_0805E25C:
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r5, 16
	asrs r2, 16
	adds r0, r6, 0
	bl sub_805E2E8
	lsls r0, 24
	cmp r0, 0
	beq _0805E274
	movs r0, 0x1
	b _0805E276
_0805E274:
	movs r0, 0
_0805E276:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805E238

	thumb_func_start sub_805E27C
sub_805E27C: @ 805E27C
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	adds r5, r4, 0
	ldrb r0, [r0, 0x1]
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0805E2DE
	ldr r0, _0805E2B8 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r0, r3, 16
	asrs r3, r0, 16
	cmp r1, r3
	bge _0805E2BC
	adds r0, r1, 0
	adds r0, 0x8
	cmp r0, r3
	blt _0805E2DE
	movs r0, 0x2
	ldrsh r3, [r2, r0]
	subs r1, r3, 0x6
	lsls r0, r4, 16
	b _0805E2CE
	.align 2, 0
_0805E2B8: .4byte gSaveBlock1Ptr
_0805E2BC:
	movs r1, 0
	ldrsh r0, [r2, r1]
	subs r0, 0x8
	cmp r0, r3
	bgt _0805E2DE
	movs r0, 0x2
	ldrsh r3, [r2, r0]
	subs r1, r3, 0x6
	lsls r0, r5, 16
_0805E2CE:
	asrs r2, r0, 16
	cmp r1, r2
	bgt _0805E2DE
	adds r0, r3, 0x6
	cmp r0, r2
	blt _0805E2DE
	movs r0, 0
	b _0805E2E0
_0805E2DE:
	movs r0, 0x1
_0805E2E0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E27C

	thumb_func_start sub_805E2E8
sub_805E2E8: @ 805E2E8
	push {r4,r5,lr}
	adds r4, r0, 0
	bl GetCurrentMapType
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	cmp r0, 0
	beq _0805E37C
	ldr r1, _0805E374 @ =VMap
	ldr r0, [r1]
	adds r3, r0, 0
	subs r3, 0x10
	ldr r0, [r1, 0x4]
	adds r5, r0, 0
	subs r5, 0xF
	ldrb r0, [r4, 0x1]
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0805E37C
	ldr r0, _0805E378 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r2, 0
	ldrsh r1, [r1, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _0805E32E
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _0805E36A
_0805E32E:
	ldr r0, [r2]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, r3
	bne _0805E344
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	adds r0, r3, 0
	subs r0, 0x8
	cmp r1, r0
	bge _0805E36A
_0805E344:
	ldr r0, [r2]
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0805E356
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	ble _0805E36A
_0805E356:
	ldr r0, [r2]
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	cmp r0, r5
	bne _0805E37C
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	subs r0, r5, 0x6
	cmp r1, r0
	blt _0805E37C
_0805E36A:
	adds r0, r4, 0
	bl sub_805E384
	movs r0, 0
	b _0805E37E
	.align 2, 0
_0805E374: .4byte VMap
_0805E378: .4byte gSaveBlock1Ptr
_0805E37C:
	movs r0, 0x1
_0805E37E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E2E8

	thumb_func_start sub_805E384
sub_805E384: @ 805E384
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x14]
	subs r0, 0x11
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xE
	bhi _0805E39A
	ldrh r0, [r1, 0x14]
	bl FlagSet
_0805E39A:
	pop {r0}
	bx r0
	thumb_func_end sub_805E384

	thumb_func_start sub_805E3A0
sub_805E3A0: @ 805E3A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0805E3B8 @ =gMapHeader
	ldr r0, [r0, 0x4]
	cmp r0, 0
	bne _0805E3CE
	b _0805E404
	.align 2, 0
_0805E3B8: .4byte gMapHeader
_0805E3BC:
	ldr r0, [r7]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	adds r0, r4, 0
	bl sub_805E080
	lsls r0, 24
	lsrs r0, 24
	b _0805E406
_0805E3CE:
	ldrb r6, [r0]
	movs r5, 0
	cmp r5, r6
	bcs _0805E404
	ldr r7, _0805E410 @ =gSaveBlock1Ptr
_0805E3D8:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	movs r1, 0x8E
	lsls r1, 4
	adds r0, r1
	ldr r1, [r7]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, r8
	bne _0805E3FA
	ldrh r0, [r4, 0x14]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0805E3BC
_0805E3FA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _0805E3D8
_0805E404:
	movs r0, 0x10
_0805E406:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E410: .4byte gSaveBlock1Ptr
	thumb_func_end sub_805E3A0

	thumb_func_start GetAvailableFieldObjectSlot
GetAvailableFieldObjectSlot: @ 805E414
	push {r4-r7,lr}
	mov r12, r3
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r2, 0
	ldr r1, _0805E470 @ =gMapObjects
	ldrb r0, [r1]
	lsls r0, 31
	adds r7, r1, 0
	cmp r0, 0
	beq _0805E468
	adds r3, r1, 0
_0805E434:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r3
	ldrb r0, [r1, 0x8]
	cmp r0, r6
	bne _0805E44E
	ldrb r0, [r1, 0x9]
	cmp r0, r5
	bne _0805E44E
	ldrb r0, [r1, 0xA]
	cmp r0, r4
	beq _0805E46C
_0805E44E:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bhi _0805E46C
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0805E434
_0805E468:
	cmp r2, 0xF
	bls _0805E474
_0805E46C:
	movs r0, 0x1
	b _0805E4A8
	.align 2, 0
_0805E470: .4byte gMapObjects
_0805E474:
	mov r0, r12
	strb r2, [r0]
	ldr r1, _0805E4B0 @ =gMapObjects
_0805E47A:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3]
	lsls r0, 31
	cmp r0, 0
	beq _0805E49C
	ldrb r0, [r3, 0x8]
	cmp r0, r6
	bne _0805E49C
	ldrb r0, [r3, 0x9]
	cmp r0, r5
	bne _0805E49C
	ldrb r0, [r3, 0xA]
	cmp r0, r4
	beq _0805E46C
_0805E49C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0805E47A
	movs r0, 0
_0805E4A8:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E4B0: .4byte gMapObjects
	thumb_func_end GetAvailableFieldObjectSlot

	thumb_func_start RemoveFieldObject
RemoveFieldObject: @ 805E4B4
	push {lr}
	ldrb r2, [r0]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bl RemoveFieldObjectInternal
	pop {r0}
	bx r0
	thumb_func_end RemoveFieldObject

	thumb_func_start RemoveFieldObjectByLocalIdAndMap
RemoveFieldObjectByLocalIdAndMap: @ 805E4C8
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805E506
	mov r0, sp
	ldrb r0, [r0]
	bl GetFieldObjectFlagIdByFieldObjectId
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805E50C @ =gMapObjects
	adds r0, r1
	bl RemoveFieldObject
_0805E506:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805E50C: .4byte gMapObjects
	thumb_func_end RemoveFieldObjectByLocalIdAndMap

	thumb_func_start RemoveFieldObjectInternal
RemoveFieldObjectInternal: @ 805E510
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrh r2, [r0, 0x6]
	ldr r1, _0805E554 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	ldr r2, _0805E558 @ =gSprites
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0xC
	adds r0, r1
	mov r1, sp
	str r1, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	bl DestroySprite
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E554: .4byte 0xffff0000
_0805E558: .4byte gSprites
	thumb_func_end RemoveFieldObjectInternal

	thumb_func_start unref_sub_808D958
unref_sub_808D958: @ 805E55C
	push {r4,lr}
	movs r4, 0
_0805E560:
	ldr r0, _0805E588 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _0805E576
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0805E58C @ =gMapObjects
	adds r0, r1
	bl RemoveFieldObject
_0805E576:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0805E560
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E588: .4byte gPlayerAvatar
_0805E58C: .4byte gMapObjects
	thumb_func_end unref_sub_808D958

	thumb_func_start sub_805E590
sub_805E590: @ 805E590
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r4, 16
	lsrs r4, 16
	mov r10, r4
	bl sub_805E080
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x10
	bne _0805E5CA
	movs r0, 0x10
	b _0805E718
_0805E5CA:
	mov r0, r8
	lsls r4, r0, 3
	adds r0, r4, r0
	lsls r0, 2
	ldr r1, _0805E5F4 @ =gMapObjects
	adds r5, r0, r1
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r6, r0, 0
	ldrb r1, [r6, 0xC]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0805E5F8
	ldrh r0, [r6, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__no_record
	b _0805E606
	.align 2, 0
_0805E5F4: .4byte gMapObjects
_0805E5F8:
	cmp r0, 0xA
	bne _0805E606
	ldrh r0, [r6, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805E606:
	ldrb r0, [r5, 0x6]
	cmp r0, 0x4C
	bne _0805E614
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
_0805E614:
	ldr r1, _0805E648 @ =0x0000ffff
	adds r0, r1, 0
	strh r0, [r7, 0x2]
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x40
	bne _0805E650
	ldr r0, _0805E64C @ =gMapObjects
	mov r2, r8
	adds r1, r4, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	movs r0, 0x10
	b _0805E718
	.align 2, 0
_0805E648: .4byte 0x0000ffff
_0805E64C: .4byte gMapObjects
_0805E650:
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _0805E728 @ =gSprites
	adds r4, r0, r1
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r2, [r5, 0x10]
	adds r0, r2
	lsls r0, 16
	asrs r0, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r2, [r5, 0x12]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8063AD4
	ldrh r0, [r6, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r4, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x8
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r1, [r6, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	mov r0, r8
	strh r0, [r4, 0x2E]
	strb r7, [r5, 0x4]
	ldrb r1, [r6, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r5, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805E702
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805E702:
	ldrb r0, [r5, 0xB]
	lsrs r0, 4
	adds r1, r4, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80679F8
	mov r0, r8
_0805E718:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E728: .4byte gSprites
	thumb_func_end sub_805E590

	thumb_func_start SpawnFieldObject
SpawnFieldObject: @ 805E72C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x2C
	mov r9, r0
	adds r6, r1, 0
	mov r8, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x48]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0
	str r0, [sp, 0x20]
	mov r1, r9
	ldrb r0, [r1, 0x1]
	bl GetFieldObjectGraphicsInfo
	adds r7, r0, 0
	add r2, sp, 0x20
	mov r0, r9
	add r1, sp, 0x8
	bl MakeObjectTemplateFromFieldObjectTemplate
	ldrh r3, [r7, 0x6]
	ldr r2, _0805E7A4 @ =0xffff0000
	add r1, sp, 0x24
	ldr r0, [r1, 0x4]
	ands r0, r2
	orrs r0, r3
	str r0, [r1, 0x4]
	str r1, [sp, 0x14]
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x4]
	mov r0, r9
	add r1, sp, 0x8
	adds r2, r6, 0
	mov r3, r8
	bl sub_805E590
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	cmp r2, 0x10
	bne _0805E7A8
	movs r0, 0x10
	b _0805E7DE
	.align 2, 0
_0805E7A4: .4byte 0xffff0000
_0805E7A8:
	ldr r4, _0805E7EC @ =gSprites
	ldr r1, _0805E7F0 @ =gMapObjects
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r1, [r3, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	ldr r1, [r7, 0x1C]
	str r1, [r0]
	ldr r2, [sp, 0x20]
	cmp r2, 0
	beq _0805E7DC
	ldrb r1, [r3, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r1, r2, 0
	bl SetSubspriteTables
_0805E7DC:
	adds r0, r5, 0
_0805E7DE:
	add sp, 0x2C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E7EC: .4byte gSprites
_0805E7F0: .4byte gMapObjects
	thumb_func_end SpawnFieldObject

	thumb_func_start SpawnSpecialFieldObject
SpawnSpecialFieldObject: @ 805E7F4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl GetFieldObjectMovingCameraOffset
	ldr r0, _0805E82C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	add r0, sp, 0x4
	movs r6, 0
	ldrsh r3, [r0, r6]
	movs r6, 0
	ldrsh r0, [r4, r6]
	str r0, [sp]
	adds r0, r5, 0
	bl SpawnFieldObject
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805E82C: .4byte gSaveBlock1Ptr
	thumb_func_end SpawnSpecialFieldObject

	thumb_func_start SpawnSpecialFieldObjectParameterized
SpawnSpecialFieldObjectParameterized: @ 805E830
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	ldr r4, [sp, 0x2C]
	ldr r5, [sp, 0x30]
	mov r8, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 16
	ldr r5, _0805E894 @ =0xfff90000
	adds r3, r5
	lsrs r3, 16
	lsls r4, 16
	adds r4, r5
	lsrs r4, 16
	mov r5, sp
	movs r6, 0
	strb r2, [r5]
	mov r2, sp
	strb r0, [r2, 0x1]
	mov r0, sp
	strb r6, [r0, 0x2]
	movs r5, 0
	strh r3, [r0, 0x4]
	strh r4, [r0, 0x6]
	mov r2, r8
	strb r2, [r0, 0x8]
	strb r1, [r0, 0x9]
	mov r2, sp
	ldrb r1, [r2, 0xA]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0xA]
	mov r0, sp
	strb r5, [r0, 0xA]
	strh r6, [r0, 0xC]
	strh r6, [r0, 0xE]
	bl SpawnSpecialFieldObject
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805E894: .4byte 0xfff90000
	thumb_func_end SpawnSpecialFieldObjectParameterized

	thumb_func_start show_sprite
show_sprite: @ 805E898
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	adds r1, r7, 0
	adds r2, r6, 0
	bl GetFieldObjectTemplateByLocalIdAndMap
	adds r5, r0, 0
	cmp r5, 0
	beq _0805E8DE
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl GetFieldObjectMovingCameraOffset
	add r0, sp, 0x4
	movs r1, 0
	ldrsh r3, [r0, r1]
	movs r1, 0
	ldrsh r0, [r4, r1]
	str r0, [sp]
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl SpawnFieldObject
	lsls r0, 24
	lsrs r0, 24
	b _0805E8E0
_0805E8DE:
	movs r0, 0x10
_0805E8E0:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end show_sprite

	thumb_func_start sub_805E8E8
sub_805E8E8: @ 805E8E8
	push {r4-r7,lr}
	adds r6, r1, 0
	adds r4, r2, 0
	adds r7, r3, 0
	lsls r0, 24
	lsrs r0, 24
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	ldr r0, [r5, 0x10]
	str r0, [r4, 0x4]
	ldr r0, [r5, 0x18]
	str r0, [r4, 0x8]
	ldr r0, [r5, 0x1C]
	str r0, [r4, 0xC]
	ldr r0, [r5, 0x20]
	str r0, [r4, 0x10]
	bl ScriptContext1_IsScriptSetUp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0805E934
	bl sub_8112CAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805E934
	ldr r0, _0805E930 @ =sub_811246C
	str r0, [r4, 0x14]
	b _0805E936
	.align 2, 0
_0805E930: .4byte sub_811246C
_0805E934:
	str r6, [r4, 0x14]
_0805E936:
	ldr r0, [r5, 0x14]
	str r0, [r7]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_805E8E8

	thumb_func_start MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex
MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex: @ 805E940
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	ldr r4, _0805E95C @ =gUnknown_839FBC8
	lsrs r1, 14
	adds r1, r4
	ldr r1, [r1]
	bl sub_805E8E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E95C: .4byte gUnknown_839FBC8
	thumb_func_end MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex

	thumb_func_start MakeObjectTemplateFromFieldObjectTemplate
MakeObjectTemplateFromFieldObjectTemplate: @ 805E960
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4, 0x9]
	adds r2, r5, 0
	bl MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end MakeObjectTemplateFromFieldObjectTemplate

	thumb_func_start AddPseudoEventObject
AddPseudoEventObject: @ 805E978
	push {r4-r6,lr}
	sub sp, 0x1C
	ldr r4, [sp, 0x2C]
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r4, 24
	lsrs r4, 24
	add r3, sp, 0x18
	mov r2, sp
	bl sub_805E8E8
	mov r0, sp
	ldrh r1, [r0, 0x2]
	ldr r0, _0805E9F0 @ =0x0000ffff
	cmp r1, r0
	beq _0805E9A8
	mov r0, sp
	ldrh r0, [r0, 0x2]
	bl sub_805F4B0
_0805E9A8:
	lsls r1, r6, 16
	asrs r1, 16
	lsls r2, r5, 16
	asrs r2, 16
	mov r0, sp
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _0805E9E4
	ldr r1, [sp, 0x18]
	cmp r1, 0
	beq _0805E9E4
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _0805E9F4 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r4, 0x42
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_0805E9E4:
	adds r0, r5, 0
	add sp, 0x1C
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805E9F0: .4byte 0x0000ffff
_0805E9F4: .4byte gSprites
	thumb_func_end AddPseudoEventObject

	thumb_func_start sprite_new
sprite_new: @ 805E9F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	adds r5, r0, 0
	ldr r0, [sp, 0x44]
	ldr r4, [sp, 0x48]
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	add r1, sp, 0x18
	mov r8, r1
	strh r2, [r1]
	mov r6, sp
	adds r6, 0x1A
	strh r3, [r6]
	lsls r0, 24
	lsrs r7, r0, 24
	mov r9, r7
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x20]
	adds r0, r5, 0
	bl GetFieldObjectGraphicsInfo
	adds r4, r0, 0
	ldr r1, _0805EB38 @ =sub_8068FA8
	add r3, sp, 0x1C
	adds r0, r5, 0
	mov r2, sp
	bl sub_805E8E8
	mov r1, sp
	ldr r2, _0805EB3C @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1, 0x2]
	mov r1, r8
	movs r2, 0
	ldrsh r0, [r1, r2]
	adds r0, 0x7
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r6, r1]
	adds r0, 0x7
	strh r0, [r6]
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0x8
	movs r3, 0x10
	bl sub_8063BC4
	mov r2, r8
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0
	ldrsh r2, [r6, r0]
	mov r0, sp
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _0805EB24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _0805EB40 @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r5, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, 0x1
	strb r0, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrb r1, [r4, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r3, [r5, 0x5]
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r3
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r3, r5, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	mov r0, r10
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x30]
	ldrb r1, [r4, 0xC]
	ands r2, r1
	cmp r2, 0xA
	bne _0805EAE4
	ldrh r0, [r4, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805EAE4:
	ldr r1, [sp, 0x1C]
	cmp r1, 0
	beq _0805EB00
	adds r0, r5, 0
	bl SetSubspriteTables
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r0, [r2]
	movs r1, 0x3F
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r2]
_0805EB00:
	adds r0, r5, 0
	mov r1, r9
	bl InitObjectPriorityByZCoord
	mov r0, r9
	adds r1, r5, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	ldr r0, [sp, 0x20]
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_0805EB24:
	adds r0, r6, 0
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB38: .4byte sub_8068FA8
_0805EB3C: .4byte 0x0000ffff
_0805EB40: .4byte gSprites
	thumb_func_end sprite_new

	thumb_func_start sub_805EB44
sub_805EB44: @ 805EB44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x1C
	adds r6, r0, 0
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl GetFieldObjectGraphicsInfo
	adds r7, r0, 0
	ldr r1, _0805EC24 @ =SpriteCallbackDummy
	add r3, sp, 0x18
	adds r0, r6, 0
	mov r2, sp
	bl sub_805E8E8
	mov r1, sp
	ldr r2, _0805EC28 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1, 0x2]
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _0805EC14
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _0805EC2C @ =gSprites
	adds r4, r0, r1
	ldrh r0, [r7, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x29
	strb r0, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r1, [r7, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r3, [r4, 0x5]
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0x5]
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrb r1, [r7, 0xC]
	ands r2, r1
	cmp r2, 0xA
	bne _0805EBE6
	ldrh r0, [r7, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805EBE6:
	ldr r1, [sp, 0x18]
	cmp r1, 0
	beq _0805EC02
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r2, r4, 0
	adds r2, 0x42
	ldrb r0, [r2]
	movs r1, 0x3F
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r2]
_0805EC02:
	movs r0, 0x1
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805EC14:
	adds r0, r5, 0
	add sp, 0x1C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805EC24: .4byte SpriteCallbackDummy
_0805EC28: .4byte 0x0000ffff
_0805EC2C: .4byte gSprites
	thumb_func_end sub_805EB44

	thumb_func_start sub_805EC30
sub_805EC30: @ 805EC30
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x4]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x8]
	ldr r0, _0805ED08 @ =gMapHeader
	ldr r3, [r0, 0x4]
	cmp r3, 0
	beq _0805ECF8
	ldr r7, _0805ED0C @ =gSaveBlock1Ptr
	ldr r2, [r7]
	ldrh r1, [r2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r4, r0, 16
	adds r1, 0x11
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0xC]
	ldrh r1, [r2, 0x2]
	adds r0, r1, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	ldrb r3, [r3]
	str r3, [sp, 0x10]
	movs r5, 0
	cmp r5, r3
	bcs _0805ECF8
	lsls r0, r1, 16
	asrs r0, 16
	mov r9, r0
	lsls r0, r4, 16
	asrs r0, 16
	mov r8, r0
_0805EC86:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	movs r1, 0x8E
	lsls r1, 4
	adds r0, r1
	ldr r1, [r7]
	adds r4, r1, r0
	ldrh r0, [r4, 0x4]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r4, 0x6]
	adds r0, 0x7
	lsls r0, 16
	asrs r1, r0, 16
	cmp r9, r1
	bgt _0805ECEC
	mov r3, r10
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	blt _0805ECEC
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r8, r1
	bgt _0805ECEC
	ldr r6, [sp, 0xC]
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, r1
	blt _0805ECEC
	ldrh r0, [r4, 0x14]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0805ECEC
	ldr r0, [r7]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	ldr r0, [sp, 0x4]
	lsls r3, r0, 16
	ldr r6, [sp, 0x8]
	lsls r0, r6, 16
	asrs r0, 16
	str r0, [sp]
	adds r0, r4, 0
	asrs r3, 16
	bl SpawnFieldObject
_0805ECEC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [sp, 0x10]
	cmp r5, r0
	bcc _0805EC86
_0805ECF8:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805ED08: .4byte gMapHeader
_0805ED0C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_805EC30

	thumb_func_start RemoveFieldObjectsOutsideView
RemoveFieldObjectsOutsideView: @ 805ED10
	push {r4-r6,lr}
	movs r3, 0
	ldr r6, _0805ED64 @ =gUnknown_2031DEC
_0805ED16:
	movs r2, 0
	movs r4, 0
	adds r5, r3, 0x1
_0805ED1C:
	lsls r0, r2, 2
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _0805ED2E
	ldrb r1, [r1, 0x2]
	cmp r3, r1
	bne _0805ED2E
	movs r4, 0x1
_0805ED2E:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0805ED1C
	cmp r4, 0
	bne _0805ED56
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r1, _0805ED68 @ =gMapObjects
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0805ED6C @ =0x00010001
	ands r0, r1
	cmp r0, 0x1
	bne _0805ED56
	adds r0, r2, 0
	bl RemoveFieldObjectIfOutsideView
_0805ED56:
	lsls r0, r5, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0805ED16
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805ED64: .4byte gUnknown_2031DEC
_0805ED68: .4byte gMapObjects
_0805ED6C: .4byte 0x00010001
	thumb_func_end RemoveFieldObjectsOutsideView

	thumb_func_start RemoveFieldObjectIfOutsideView
RemoveFieldObjectIfOutsideView: @ 805ED70
	push {r4-r7,lr}
	adds r3, r0, 0
	ldr r0, _0805EDEC @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r1, r0, 0x2
	lsls r1, 16
	adds r0, 0x11
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r4, [r2, 0x2]
	adds r0, r4, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0x10
	ldrsh r2, [r3, r0]
	lsrs r7, r1, 16
	asrs r1, 16
	cmp r2, r1
	blt _0805EDB6
	lsls r0, r5, 16
	asrs r0, 16
	cmp r2, r0
	bgt _0805EDB6
	movs r0, 0x12
	ldrsh r1, [r3, r0]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	blt _0805EDB6
	lsls r0, r6, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805EDE4
_0805EDB6:
	movs r0, 0xC
	ldrsh r1, [r3, r0]
	lsls r0, r7, 16
	asrs r0, 16
	cmp r1, r0
	blt _0805EDDE
	lsls r0, r5, 16
	asrs r0, 16
	cmp r1, r0
	bgt _0805EDDE
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	blt _0805EDDE
	lsls r0, r6, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805EDE4
_0805EDDE:
	adds r0, r3, 0
	bl RemoveFieldObject
_0805EDE4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EDEC: .4byte gSaveBlock1Ptr
	thumb_func_end RemoveFieldObjectIfOutsideView

	thumb_func_start sub_805EDF0
sub_805EDF0: @ 805EDF0
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl ClearPlayerAvatarInfo
	movs r6, 0
	ldr r7, _0805EE38 @ =gMapObjects
	lsls r4, 16
	lsls r5, 16
_0805EE0A:
	lsls r0, r6, 3
	adds r0, r6
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0805EE24
	adds r0, r6, 0
	asrs r1, r4, 16
	asrs r2, r5, 16
	bl sub_805EE3C
_0805EE24:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bls _0805EE0A
	bl sub_805DE8C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EE38: .4byte gMapObjects
	thumb_func_end sub_805EDF0

	thumb_func_start sub_805EE3C
sub_805EE3C: @ 805EE3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	movs r7, 0
	ldr r2, _0805EFE0 @ =gUnknown_2031DEC
_0805EE5E:
	lsls r0, r7, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _0805EE70
	ldrb r1, [r1, 0x2]
	cmp r8, r1
	bne _0805EE70
	b _0805EFCE
_0805EE70:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _0805EE5E
	mov r1, r8
	lsls r0, r1, 3
	add r0, r8
	lsls r0, 2
	ldr r1, _0805EFE4 @ =gMapObjects
	adds r6, r0, r1
	movs r0, 0
	str r0, [sp, 0x20]
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	ldrh r2, [r5, 0x6]
	ldr r1, _0805EFE8 @ =0xffff0000
	add r4, sp, 0x18
	ldr r0, [r4, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [r4, 0x4]
	ldrb r0, [r6, 0x5]
	ldrb r1, [r6, 0x6]
	add r3, sp, 0x20
	mov r2, sp
	bl MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex
	str r4, [sp, 0xC]
	mov r0, sp
	ldr r2, _0805EFEC @ =0x0000ffff
	adds r4, r2, 0
	strh r4, [r0, 0x2]
	ldrb r1, [r5, 0xC]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0805EECA
	ldrh r0, [r5, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__no_record
_0805EECA:
	ldrb r0, [r5, 0xC]
	lsls r1, r0, 28
	lsrs r0, r1, 28
	cmp r0, 0x9
	bls _0805EEDC
	ldrh r0, [r5, 0x2]
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805EEDC:
	mov r0, sp
	strh r4, [r0, 0x2]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x40
	beq _0805EFCE
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _0805EFF0 @ =gSprites
	adds r4, r0, r1
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r2, [r6, 0x10]
	adds r0, r2
	lsls r0, 16
	asrs r0, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r2, [r6, 0x12]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8063AD4
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r4, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x8
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, [r5, 0x1C]
	str r0, [r4, 0xC]
	ldrb r0, [r6, 0x6]
	cmp r0, 0xB
	bne _0805EF6A
	mov r0, r8
	adds r1, r7, 0
	bl SetPlayerAvatarFieldObjectIdAndObjectId
	bl sub_80DB0C4
	strb r0, [r6, 0x1B]
_0805EF6A:
	ldr r1, [sp, 0x20]
	cmp r1, 0
	beq _0805EF76
	adds r0, r4, 0
	bl SetSubspriteTables
_0805EF76:
	ldrb r1, [r5, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	mov r0, r8
	strh r0, [r4, 0x2E]
	strb r7, [r6, 0x4]
	ldrb r0, [r6, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805EFBC
	ldrb r0, [r6, 0x6]
	cmp r0, 0xB
	beq _0805EFBC
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805EFBC:
	adds r0, r6, 0
	bl sub_805EFF4
	ldrb r0, [r6, 0xB]
	lsrs r0, 4
	adds r1, r4, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
_0805EFCE:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EFE0: .4byte gUnknown_2031DEC
_0805EFE4: .4byte gMapObjects
_0805EFE8: .4byte 0xffff0000
_0805EFEC: .4byte 0x0000ffff
_0805EFF0: .4byte gSprites
	thumb_func_end sub_805EE3C

	thumb_func_start sub_805EFF4
sub_805EFF4: @ 805EFF4
	push {lr}
	ldrb r2, [r0]
	movs r3, 0x3
	negs r3, r3
	adds r1, r3, 0
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r2, [r0, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	ands r1, r3
	movs r2, 0x5
	negs r2, r2
	ands r1, r2
	subs r2, 0x4
	ands r1, r2
	subs r2, 0x8
	ands r1, r2
	subs r2, 0x10
	ands r1, r2
	strb r1, [r0, 0x2]
	bl FieldObjectClearAnim
	pop {r0}
	bx r0
	thumb_func_end sub_805EFF4

	thumb_func_start SetPlayerAvatarFieldObjectIdAndObjectId
SetPlayerAvatarFieldObjectIdAndObjectId: @ 805F02C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805F058 @ =gPlayerAvatar
	strb r0, [r5, 0x5]
	strb r1, [r5, 0x4]
	ldr r1, _0805F05C @ =gMapObjects
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r1
	ldrb r0, [r4, 0x5]
	bl sub_805C824
	strb r0, [r5, 0x7]
	ldrb r0, [r4, 0x5]
	movs r1, 0x20
	bl SetPlayerAvatarExtraStateTransition
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F058: .4byte gPlayerAvatar
_0805F05C: .4byte gMapObjects
	thumb_func_end SetPlayerAvatarFieldObjectIdAndObjectId

	thumb_func_start EventObjectSetGraphicsId
EventObjectSetGraphicsId: @ 805F060
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	adds r0, r1, 0
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805F1CC @ =gSprites
	adds r4, r0, r1
	ldrb r1, [r5, 0xC]
	movs r0, 0xF
	mov r8, r0
	ands r0, r1
	cmp r0, 0
	bne _0805F09E
	ldrh r0, [r5, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl pal_patch_for_npc
_0805F09E:
	ldrb r1, [r5, 0xC]
	mov r0, r8
	ands r0, r1
	cmp r0, 0xA
	bne _0805F0B2
	ldrh r0, [r5, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805F0B2:
	ldr r0, [r4, 0xC]
	ldrh r0, [r0, 0x4]
	lsrs r0, 5
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r7, r4, 0
	adds r7, 0x3F
	ldrb r1, [r7]
	movs r2, 0x40
	mov r9, r2
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _0805F0D6
	adds r0, r4, 0
	bl sub_80075C0
_0805F0D6:
	ldr r0, [r5, 0x10]
	ldrb r2, [r0, 0x1]
	lsrs r2, 6
	lsls r2, 6
	ldrb r3, [r4, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, 0x1]
	ldr r0, [r5, 0x10]
	ldrb r0, [r0, 0x3]
	lsrs r0, 6
	lsls r0, 6
	ldrb r2, [r4, 0x3]
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x3]
	ldr r3, [r5, 0x1C]
	str r3, [r4, 0xC]
	ldr r0, [r5, 0x18]
	str r0, [r4, 0x8]
	ldr r0, [r5, 0x14]
	str r0, [r4, 0x18]
	ldrb r1, [r5, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r7]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _0805F152
	ldrh r0, [r3, 0x4]
	lsrs r0, 5
	lsls r0, 24
	lsrs r0, 24
	bl AllocSpriteTiles
	lsls r0, 16
	asrs r2, r0, 16
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _0805F142
	mov r0, r10
	bl AllocSpriteTiles
	lsls r0, 16
	asrs r2, r0, 16
_0805F142:
	ldr r1, _0805F1D0 @ =0x000003ff
	adds r0, r1, 0
	ands r2, r0
	ldrh r1, [r4, 0x4]
	ldr r0, _0805F1D4 @ =0xfffffc00
	ands r0, r1
	orrs r0, r2
	strh r0, [r4, 0x4]
_0805F152:
	ldrb r1, [r5, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r6, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
	mov r2, sp
	ldrb r2, [r2]
	strb r2, [r6, 0x5]
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8063B1C
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r4, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x8
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _0805F1BA
	bl CameraObjectReset1
_0805F1BA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F1CC: .4byte gSprites
_0805F1D0: .4byte 0x000003ff
_0805F1D4: .4byte 0xfffffc00
	thumb_func_end EventObjectSetGraphicsId

	thumb_func_start FieldObjectSetGraphicsIdByLocalIdAndMap
FieldObjectSetGraphicsIdByLocalIdAndMap: @ 805F1D8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805F20C
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805F214 @ =gMapObjects
	adds r0, r1
	adds r1, r4, 0
	bl EventObjectSetGraphicsId
_0805F20C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F214: .4byte gMapObjects
	thumb_func_end FieldObjectSetGraphicsIdByLocalIdAndMap

	thumb_func_start FieldObjectTurn
FieldObjectTurn: @ 805F218
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	bl FieldObjectSetDirection
	ldrb r0, [r6, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805F25E
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _0805F264 @ =gSprites
	adds r4, r5
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl SeekSpriteAnim
_0805F25E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F264: .4byte gSprites
	thumb_func_end FieldObjectTurn

	thumb_func_start FieldObjectTurnByLocalIdAndMap
FieldObjectTurnByLocalIdAndMap: @ 805F268
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805F29C
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805F2A4 @ =gMapObjects
	adds r0, r1
	adds r1, r4, 0
	bl FieldObjectTurn
_0805F29C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2A4: .4byte gMapObjects
	thumb_func_end FieldObjectTurnByLocalIdAndMap

	thumb_func_start PlayerObjectTurn
PlayerObjectTurn: @ 805F2A8
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F2C4 @ =gMapObjects
	adds r0, r2
	bl FieldObjectTurn
	pop {r0}
	bx r0
	.align 2, 0
_0805F2C4: .4byte gMapObjects
	thumb_func_end PlayerObjectTurn

	thumb_func_start GetFieldObjectGraphicsInfo
GetFieldObjectGraphicsInfo: @ 805F2C8
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xEF
	bls _0805F2E0
	adds r0, r1, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl VarGetFieldObjectGraphicsId
	adds r1, r0, 0
_0805F2E0:
	cmp r1, 0x97
	bls _0805F2E6
	movs r1, 0x10
_0805F2E6:
	ldr r0, _0805F2F4 @ =gUnknown_839FDB0
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0805F2F4: .4byte gUnknown_839FDB0
	thumb_func_end GetFieldObjectGraphicsInfo

	thumb_func_start FieldObjectHandleDynamicGraphicsId
FieldObjectHandleDynamicGraphicsId: @ 805F2F8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x5]
	cmp r0, 0xEF
	bls _0805F30E
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl VarGetFieldObjectGraphicsId
	strb r0, [r4, 0x5]
_0805F30E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectHandleDynamicGraphicsId

	thumb_func_start npc_by_local_id_and_map_set_field_1_bit_x20
npc_by_local_id_and_map_set_field_1_bit_x20: @ 805F314
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805F356
	ldr r2, _0805F360 @ =gMapObjects
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x1
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 5
	ldrb r3, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x1]
_0805F356:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F360: .4byte gMapObjects
	thumb_func_end npc_by_local_id_and_map_set_field_1_bit_x20

	thumb_func_start FieldObjectGetLocalIdAndMap
FieldObjectGetLocalIdAndMap: @ 805F364
	push {r4,lr}
	ldrb r4, [r0, 0x8]
	strb r4, [r1]
	ldrb r1, [r0, 0x9]
	strb r1, [r2]
	ldrb r0, [r0, 0xA]
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectGetLocalIdAndMap

	thumb_func_start sub_805F378
sub_805F378: @ 805F378
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetFieldObjectIdByXY
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x10
	beq _0805F3A0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805F3A4 @ =gMapObjects
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0805F3A0:
	pop {r0}
	bx r0
	.align 2, 0
_0805F3A4: .4byte gMapObjects
	thumb_func_end sub_805F378

	thumb_func_start sub_805F3A8
sub_805F3A8: @ 805F3A8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805F3EE
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	ldr r0, _0805F3F8 @ =gMapObjects
	adds r2, r0
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805F3FC @ =gSprites
	adds r0, r1
	ldrb r1, [r2, 0x3]
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x3]
	adds r0, 0x43
	strb r4, [r0]
_0805F3EE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F3F8: .4byte gMapObjects
_0805F3FC: .4byte gSprites
	thumb_func_end sub_805F3A8

	thumb_func_start sub_805F400
sub_805F400: @ 805F400
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805F43C
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805F444 @ =gMapObjects
	adds r1, r0
	ldrb r2, [r1, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x3]
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0805F43C:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805F444: .4byte gMapObjects
	thumb_func_end sub_805F400

	thumb_func_start sub_805F448
sub_805F448: @ 805F448
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r4, 16
	lsrs r4, 16
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805F48C
	ldr r2, _0805F494 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805F498 @ =gSprites
	adds r0, r1
	strh r5, [r0, 0x24]
	strh r4, [r0, 0x26]
_0805F48C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F494: .4byte gMapObjects
_0805F498: .4byte gSprites
	thumb_func_end sub_805F448

	thumb_func_start gpu_pal_allocator_reset__manage_upper_four
gpu_pal_allocator_reset__manage_upper_four: @ 805F49C
	push {lr}
	bl FreeAllSpritePalettes
	ldr r1, _0805F4AC @ =gReservedSpritePaletteCount
	movs r0, 0xC
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805F4AC: .4byte gReservedSpritePaletteCount
	thumb_func_end gpu_pal_allocator_reset__manage_upper_four

	thumb_func_start sub_805F4B0
sub_805F4B0: @ 805F4B0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl FindFieldObjectPaletteIndexByTag
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0805F4D4 @ =0x000011ff
	cmp r1, r0
	beq _0805F4CE
	lsls r0, r1, 3
	ldr r1, _0805F4D8 @ =gUnknown_83A5158
	adds r0, r1
	bl sub_805F510
_0805F4CE:
	pop {r0}
	bx r0
	.align 2, 0
_0805F4D4: .4byte 0x000011ff
_0805F4D8: .4byte gUnknown_83A5158
	thumb_func_end sub_805F4B0

	thumb_func_start sub_805F4DC
sub_805F4DC: @ 805F4DC
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	ldrh r0, [r5]
	ldr r1, _0805F50C @ =0x000011ff
	cmp r0, r1
	beq _0805F506
	adds r6, r1, 0
_0805F4EC:
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	bl sub_805F4B0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805F4EC
_0805F506:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F50C: .4byte 0x000011ff
	thumb_func_end sub_805F4DC

	thumb_func_start sub_805F510
sub_805F510: @ 805F510
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0805F52E
	adds r0, r4, 0
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	b _0805F530
_0805F52E:
	movs r0, 0xFF
_0805F530:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805F510

	thumb_func_start pal_patch_for_npc
pal_patch_for_npc: @ 805F538
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl FindFieldObjectPaletteIndexByTag
	lsls r0, 24
	ldr r1, _0805F570 @ =gUnknown_83A5158
	lsrs r0, 21
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r4, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	bl sub_8083598
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F570: .4byte gUnknown_83A5158
	thumb_func_end pal_patch_for_npc

	thumb_func_start pal_patch_for_npc_range
pal_patch_for_npc_range: @ 805F574
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	cmp r4, r6
	bcs _0805F598
_0805F584:
	ldrh r0, [r5]
	adds r1, r4, 0
	bl pal_patch_for_npc
	adds r5, 0x2
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _0805F584
_0805F598:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end pal_patch_for_npc_range

	thumb_func_start FindFieldObjectPaletteIndexByTag
FindFieldObjectPaletteIndexByTag: @ 805F5A0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	movs r2, 0
	ldr r0, _0805F5C8 @ =gUnknown_83A5158
	ldrh r1, [r0, 0x4]
	ldr r3, _0805F5CC @ =0x000011ff
	adds r4, r0, 0
	cmp r1, r3
	beq _0805F5E0
	adds r6, r4, 0
	adds r1, r3, 0
_0805F5B8:
	lsls r0, r2, 3
	adds r0, r6
	ldrh r0, [r0, 0x4]
	cmp r0, r5
	bne _0805F5D0
	adds r0, r2, 0
	b _0805F5E2
	.align 2, 0
_0805F5C8: .4byte gUnknown_83A5158
_0805F5CC: .4byte 0x000011ff
_0805F5D0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 3
	adds r0, r4
	ldrh r0, [r0, 0x4]
	cmp r0, r1
	bne _0805F5B8
_0805F5E0:
	movs r0, 0xFF
_0805F5E2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end FindFieldObjectPaletteIndexByTag

	thumb_func_start npc_load_two_palettes__no_record
npc_load_two_palettes__no_record: @ 805F5E8
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl pal_patch_for_npc
	movs r3, 0
	ldr r1, _0805F630 @ =gUnknown_83A5208
	ldrh r0, [r1]
	ldr r2, _0805F634 @ =0x000011ff
	cmp r0, r2
	beq _0805F650
	ldr r0, _0805F638 @ =gUnknown_835B934
	adds r5, r0
	adds r6, r2, 0
_0805F60C:
	lsls r2, r3, 3
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0805F640
	adds r1, 0x4
	adds r1, r2, r1
	ldr r0, _0805F63C @ =gUnknown_2037098
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl pal_patch_for_npc
	b _0805F650
	.align 2, 0
_0805F630: .4byte gUnknown_83A5208
_0805F634: .4byte 0x000011ff
_0805F638: .4byte gUnknown_835B934
_0805F63C: .4byte gUnknown_2037098
_0805F640:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805F60C
_0805F650:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_load_two_palettes__no_record

	thumb_func_start npc_load_two_palettes__and_record
npc_load_two_palettes__and_record: @ 805F658
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _0805F6A4 @ =gUnknown_203709A
	strh r4, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl pal_patch_for_npc
	movs r3, 0
	ldr r1, _0805F6A8 @ =gUnknown_83A5278
	ldrh r0, [r1]
	ldr r2, _0805F6AC @ =0x000011ff
	cmp r0, r2
	beq _0805F6C8
	ldr r0, _0805F6B0 @ =gUnknown_835B934
	adds r5, r0
	adds r6, r2, 0
_0805F680:
	lsls r2, r3, 3
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0805F6B8
	adds r1, 0x4
	adds r1, r2, r1
	ldr r0, _0805F6B4 @ =gUnknown_2037098
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl pal_patch_for_npc
	b _0805F6C8
	.align 2, 0
_0805F6A4: .4byte gUnknown_203709A
_0805F6A8: .4byte gUnknown_83A5278
_0805F6AC: .4byte 0x000011ff
_0805F6B0: .4byte gUnknown_835B934
_0805F6B4: .4byte gUnknown_2037098
_0805F6B8:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805F680
_0805F6C8:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_load_two_palettes__and_record

	thumb_func_start sub_805F6D0
sub_805F6D0: @ 805F6D0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805F6DC @ =gUnknown_835B934
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805F6DC: .4byte gUnknown_835B934
	thumb_func_end sub_805F6D0

	thumb_func_start unref_sub_808EAC4
unref_sub_808EAC4: @ 805F6E0
	push {r4,lr}
	ldrh r3, [r0, 0x10]
	strh r3, [r0, 0x14]
	ldrh r4, [r0, 0x12]
	strh r4, [r0, 0x16]
	lsls r1, 16
	asrs r1, 16
	adds r1, r3
	strh r1, [r0, 0x10]
	lsls r2, 16
	asrs r2, 16
	adds r2, r4
	strh r2, [r0, 0x12]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_808EAC4

	thumb_func_start npc_coords_shift
npc_coords_shift: @ 805F700
	ldrh r3, [r0, 0x10]
	strh r3, [r0, 0x14]
	ldrh r3, [r0, 0x12]
	strh r3, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r2, [r0, 0x12]
	bx lr
	thumb_func_end npc_coords_shift

	thumb_func_start npc_coords_set
npc_coords_set: @ 805F710
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	strh r1, [r0, 0x14]
	strh r2, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r2, [r0, 0x12]
	bx lr
	thumb_func_end npc_coords_set

	thumb_func_start sub_805F724
sub_805F724: @ 805F724
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805F7C0 @ =gSprites
	adds r7, r0, r1
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r8, r0
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl npc_coords_set
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	adds r2, r7, 0
	adds r2, 0x20
	adds r3, r7, 0
	adds r3, 0x22
	bl sub_8063B1C
	mov r1, r8
	ldrh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r7, 0
	adds r1, 0x28
	strb r0, [r1]
	mov r2, r8
	ldrh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r7, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r7, 0x20]
	adds r0, 0x8
	strh r0, [r7, 0x20]
	ldrh r1, [r7, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r7, 0x22]
	adds r0, r6, 0
	bl sub_805EFF4
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _0805F7B6
	bl CameraObjectReset1
_0805F7B6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F7C0: .4byte gSprites
	thumb_func_end sub_805F724

	thumb_func_start sub_805F7C4
sub_805F7C4: @ 805F7C4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r4, 16
	lsrs r4, 16
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805F80C
	lsls r1, r5, 16
	lsls r2, r4, 16
	mov r0, sp
	ldrb r3, [r0]
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r3, _0805F814 @ =gMapObjects
	adds r0, r3
	movs r3, 0xE0
	lsls r3, 11
	adds r1, r3
	asrs r1, 16
	adds r2, r3
	asrs r2, 16
	bl sub_805F724
_0805F80C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F814: .4byte gMapObjects
	thumb_func_end sub_805F7C4

	thumb_func_start npc_coords_shift_still
npc_coords_shift_still: @ 805F818
	push {lr}
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	movs r3, 0x12
	ldrsh r2, [r0, r3]
	bl npc_coords_shift
	pop {r0}
	bx r0
	thumb_func_end npc_coords_shift_still

	thumb_func_start UpdateFieldObjectCoordsForCameraUpdate
UpdateFieldObjectCoordsForCameraUpdate: @ 805F82C
	push {r4,r5,lr}
	ldr r2, _0805F88C @ =gCamera
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805F884
	movs r3, 0
	ldr r5, _0805F890 @ =gMapObjects
	movs r0, 0x4
	ldrsh r4, [r2, r0]
	movs r0, 0x8
	ldrsh r1, [r2, r0]
_0805F846:
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r5
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _0805F87A
	ldrh r0, [r2, 0xC]
	subs r0, r4
	strh r0, [r2, 0xC]
	ldrh r0, [r2, 0xE]
	subs r0, r1
	strh r0, [r2, 0xE]
	ldrh r0, [r2, 0x10]
	subs r0, r4
	strh r0, [r2, 0x10]
	ldrh r0, [r2, 0x12]
	subs r0, r1
	strh r0, [r2, 0x12]
	ldrh r0, [r2, 0x14]
	subs r0, r4
	strh r0, [r2, 0x14]
	ldrh r0, [r2, 0x16]
	subs r0, r1
	strh r0, [r2, 0x16]
_0805F87A:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0805F846
_0805F884:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F88C: .4byte gCamera
_0805F890: .4byte gMapObjects
	thumb_func_end UpdateFieldObjectCoordsForCameraUpdate

	thumb_func_start GetFieldObjectIdByXYZ
GetFieldObjectIdByXYZ: @ 805F894
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	ldr r0, _0805F8E0 @ =gMapObjects
	mov r8, r0
_0805F8AC:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0805F8E4
	movs r2, 0x10
	ldrsh r0, [r1, r2]
	cmp r0, r7
	bne _0805F8E4
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	cmp r0, r6
	bne _0805F8E4
	adds r0, r1, 0
	adds r1, r5, 0
	bl FieldObjectDoesZCoordMatch
	lsls r0, 24
	cmp r0, 0
	beq _0805F8E4
	adds r0, r4, 0
	b _0805F8F0
	.align 2, 0
_0805F8E0: .4byte gMapObjects
_0805F8E4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0805F8AC
	movs r0, 0x10
_0805F8F0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByXYZ

	thumb_func_start FieldObjectDoesZCoordMatch
FieldObjectDoesZCoordMatch: @ 805F8FC
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xB]
	movs r0, 0xF
	ands r0, r2
	cmp r0, 0
	beq _0805F91C
	cmp r1, 0
	beq _0805F91C
	lsls r0, r2, 28
	lsrs r0, 28
	cmp r0, r1
	beq _0805F91C
	movs r0, 0
	b _0805F91E
_0805F91C:
	movs r0, 0x1
_0805F91E:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectDoesZCoordMatch

	thumb_func_start UpdateFieldObjectsForCameraUpdate
UpdateFieldObjectsForCameraUpdate: @ 805F924
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl UpdateFieldObjectCoordsForCameraUpdate
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805EC30
	bl RemoveFieldObjectsOutsideView
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end UpdateFieldObjectsForCameraUpdate

	thumb_func_start AddCameraObject
AddCameraObject: @ 805F950
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0805F98C @ =gUnknown_835B944
	movs r1, 0
	movs r2, 0
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805F990 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x3E
	adds r2, r1
	mov r12, r2
	ldrb r2, [r2]
	movs r3, 0x4
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	strh r4, [r1, 0x2E]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F98C: .4byte gUnknown_835B944
_0805F990: .4byte gSprites
	thumb_func_end AddCameraObject

	thumb_func_start ObjectCB_CameraObject
ObjectCB_CameraObject: @ 805F994
	push {r4,r5,lr}
	sub sp, 0xC
	mov r2, sp
	ldr r1, _0805F9B8 @ =gUnknown_835B95C
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	movs r2, 0x30
	ldrsh r1, [r0, r2]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F9B8: .4byte gUnknown_835B95C
	thumb_func_end ObjectCB_CameraObject

	thumb_func_start CameraObject_0
CameraObject_0: @ 805F9BC
	push {lr}
	ldr r3, _0805F9F4 @ =gSprites
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x20]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x1
	strh r1, [r0, 0x30]
	bl CameraObject_1
	pop {r0}
	bx r0
	.align 2, 0
_0805F9F4: .4byte gSprites
	thumb_func_end CameraObject_0

	thumb_func_start CameraObject_1
CameraObject_1: @ 805F9F8
	push {r4,r5,lr}
	ldr r3, _0805FA2C @ =gSprites
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r3, [r1, 0x22]
	ldrh r2, [r0, 0x20]
	ldrh r4, [r1, 0x20]
	movs r5, 0x20
	ldrsh r1, [r1, r5]
	subs r1, r2
	strh r1, [r0, 0x32]
	ldrh r2, [r0, 0x22]
	lsls r1, r3, 16
	asrs r1, 16
	subs r1, r2
	strh r1, [r0, 0x34]
	strh r4, [r0, 0x20]
	strh r3, [r0, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA2C: .4byte gSprites
	thumb_func_end CameraObject_1

	thumb_func_start CameraObject_2
CameraObject_2: @ 805FA30
	push {r4,lr}
	ldr r4, _0805FA5C @ =gSprites
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	movs r3, 0
	strh r1, [r0, 0x20]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	strh r3, [r0, 0x32]
	strh r3, [r0, 0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA5C: .4byte gSprites
	thumb_func_end CameraObject_2

	thumb_func_start FindCameraObject
FindCameraObject: @ 805FA60
	push {r4,r5,lr}
	movs r3, 0
	ldr r4, _0805FA8C @ =gSprites
	adds r5, r4, 0
	adds r5, 0x1C
_0805FA6A:
	lsls r0, r3, 4
	adds r0, r3
	lsls r1, r0, 2
	adds r2, r1, r4
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0805FA94
	adds r0, r1, r5
	ldr r1, [r0]
	ldr r0, _0805FA90 @ =ObjectCB_CameraObject
	cmp r1, r0
	bne _0805FA94
	adds r0, r2, 0
	b _0805FAA0
	.align 2, 0
_0805FA8C: .4byte gSprites
_0805FA90: .4byte ObjectCB_CameraObject
_0805FA94:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3F
	bls _0805FA6A
	movs r0, 0
_0805FAA0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FindCameraObject

	thumb_func_start CameraObjectReset1
CameraObjectReset1: @ 805FAA8
	push {lr}
	bl FindCameraObject
	adds r2, r0, 0
	cmp r2, 0
	beq _0805FAC0
	movs r0, 0
	strh r0, [r2, 0x30]
	ldr r1, [r2, 0x1C]
	adds r0, r2, 0
	bl _call_via_r1
_0805FAC0:
	pop {r0}
	bx r0
	thumb_func_end CameraObjectReset1

	thumb_func_start CameraObjectSetFollowedObjectId
CameraObjectSetFollowedObjectId: @ 805FAC4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl FindCameraObject
	cmp r0, 0
	beq _0805FAD8
	strh r4, [r0, 0x2E]
	bl CameraObjectReset1
_0805FAD8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CameraObjectSetFollowedObjectId

	thumb_func_start CameraObjectGetFollowedObjectId
CameraObjectGetFollowedObjectId: @ 805FAE0
	push {lr}
	bl FindCameraObject
	cmp r0, 0
	beq _0805FAF2
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	b _0805FAF4
_0805FAF2:
	movs r0, 0x40
_0805FAF4:
	pop {r1}
	bx r1
	thumb_func_end CameraObjectGetFollowedObjectId

	thumb_func_start CameraObjectReset2
CameraObjectReset2: @ 805FAF8
	push {lr}
	bl FindCameraObject
	movs r1, 0x2
	strh r1, [r0, 0x30]
	pop {r0}
	bx r0
	thumb_func_end CameraObjectReset2

	thumb_func_start CopySprite
CopySprite: @ 805FB08
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	movs r5, 0
	ldr r1, _0805FB50 @ =gSprites
_0805FB22:
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0805FB54
	adds r0, r4, 0
	mov r1, r12
	movs r2, 0x44
	bl memcpy
	mov r0, r8
	strh r0, [r4, 0x20]
	strh r6, [r4, 0x22]
	adds r0, r4, 0
	adds r0, 0x43
	strb r7, [r0]
	b _0805FB5E
	.align 2, 0
_0805FB50: .4byte gSprites
_0805FB54:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3F
	bls _0805FB22
_0805FB5E:
	adds r0, r5, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CopySprite

	thumb_func_start obj_unfreeze
obj_unfreeze: @ 805FB6C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	movs r5, 0x3F
	ldr r3, _0805FBC0 @ =gSprites
	movs r2, 0x1
	negs r2, r2
_0805FB8A:
	lsls r0, r5, 16
	asrs r1, r0, 16
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r3
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0805FBC4
	adds r0, r4, 0
	mov r1, r12
	movs r2, 0x44
	bl memcpy
	mov r0, r8
	strh r0, [r4, 0x20]
	strh r6, [r4, 0x22]
	adds r0, r4, 0
	adds r0, 0x43
	strb r7, [r0]
	lsls r0, r5, 24
	lsrs r0, 24
	b _0805FBD2
	.align 2, 0
_0805FBC0: .4byte gSprites
_0805FBC4:
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, r2
	bgt _0805FB8A
	movs r0, 0x40
_0805FBD2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end obj_unfreeze

	thumb_func_start FieldObjectSetDirection
FieldObjectSetDirection: @ 805FBDC
	push {r4,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	adds r4, r2, 0
	ldrb r0, [r3, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r1, r3, 0
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r3, 0x1]
	lsls r0, 30
	cmp r0, 0
	blt _0805FC0C
	movs r0, 0xF
	adds r1, r2, 0
	ands r1, r0
	ldrb r2, [r3, 0x18]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x18]
_0805FC0C:
	lsls r2, r4, 4
	ldrb r1, [r3, 0x18]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectSetDirection

	thumb_func_start GetFieldObjectScriptPointerByLocalIdAndMap
GetFieldObjectScriptPointerByLocalIdAndMap: @ 805FC20
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectTemplateByLocalIdAndMap
	ldr r0, [r0, 0x10]
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectScriptPointerByLocalIdAndMap

	thumb_func_start GetFieldObjectScriptPointerByFieldObjectId
GetFieldObjectScriptPointerByFieldObjectId: @ 805FC38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FC58 @ =gMapObjects
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r0, [r2, 0x8]
	ldrb r1, [r2, 0x9]
	ldrb r2, [r2, 0xA]
	bl GetFieldObjectScriptPointerByLocalIdAndMap
	pop {r1}
	bx r1
	.align 2, 0
_0805FC58: .4byte gMapObjects
	thumb_func_end GetFieldObjectScriptPointerByFieldObjectId

	thumb_func_start GetFieldObjectFlagIdByLocalIdAndMap
GetFieldObjectFlagIdByLocalIdAndMap: @ 805FC5C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectTemplateByLocalIdAndMap
	ldrh r0, [r0, 0x14]
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectFlagIdByLocalIdAndMap

	thumb_func_start GetFieldObjectFlagIdByFieldObjectId
GetFieldObjectFlagIdByFieldObjectId: @ 805FC74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FC98 @ =gMapObjects
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r0, [r2, 0x8]
	ldrb r1, [r2, 0x9]
	ldrb r2, [r2, 0xA]
	bl GetFieldObjectFlagIdByLocalIdAndMap
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0805FC98: .4byte gMapObjects
	thumb_func_end GetFieldObjectFlagIdByFieldObjectId

	thumb_func_start sub_805FC9C
sub_805FC9C: @ 805FC9C
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805FCD0
	ldr r2, _0805FCCC @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	b _0805FCD2
	.align 2, 0
_0805FCCC: .4byte gMapObjects
_0805FCD0:
	movs r0, 0xFF
_0805FCD2:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end sub_805FC9C

	thumb_func_start sub_805FCD8
sub_805FCD8: @ 805FCD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectTemplateByLocalIdAndMap
	ldrh r0, [r0, 0xC]
	pop {r1}
	bx r1
	thumb_func_end sub_805FCD8

	thumb_func_start sub_805FCF0
sub_805FCF0: @ 805FCF0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805FD04 @ =gMapObjects
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x7]
	bx lr
	.align 2, 0
_0805FD04: .4byte gMapObjects
	thumb_func_end sub_805FCF0

	thumb_func_start sub_805FD08
sub_805FD08: @ 805FD08
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805FD3C
	ldr r2, _0805FD38 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1D]
	b _0805FD3E
	.align 2, 0
_0805FD38: .4byte gMapObjects
_0805FD3C:
	movs r0, 0xFF
_0805FD3E:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end sub_805FD08

	thumb_func_start FieldObjectGetBerryTreeId
FieldObjectGetBerryTreeId: @ 805FD44
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805FD58 @ =gMapObjects
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1D]
	bx lr
	.align 2, 0
_0805FD58: .4byte gMapObjects
	thumb_func_end FieldObjectGetBerryTreeId

	thumb_func_start GetFieldObjectTemplateByLocalIdAndMap
GetFieldObjectTemplateByLocalIdAndMap: @ 805FD5C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0805FD8C @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _0805FD94
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _0805FD94
	movs r0, 0x8E
	lsls r0, 4
	adds r1, r0
	ldr r0, _0805FD90 @ =gMapHeader
	ldr r0, [r0, 0x4]
	b _0805FDA0
	.align 2, 0
_0805FD8C: .4byte gSaveBlock1Ptr
_0805FD90: .4byte gMapHeader
_0805FD94:
	adds r0, r2, 0
	adds r1, r3, 0
	bl get_mapheader_by_bank_and_number
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x4]
_0805FDA0:
	ldrb r2, [r0]
	adds r0, r4, 0
	bl FindFieldObjectTemplateInArrayByLocalId
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectTemplateByLocalIdAndMap

	thumb_func_start FindFieldObjectTemplateInArrayByLocalId
FindFieldObjectTemplateInArrayByLocalId: @ 805FDB0
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	cmp r1, r2
	bcs _0805FDDE
_0805FDC2:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r3, r0, r5
	ldrb r0, [r3]
	cmp r0, r4
	bne _0805FDD4
	adds r0, r3, 0
	b _0805FDE0
_0805FDD4:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcc _0805FDC2
_0805FDDE:
	movs r0, 0
_0805FDE0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FindFieldObjectTemplateInArrayByLocalId

	thumb_func_start sub_805FDE8
sub_805FDE8: @ 805FDE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldrb r0, [r4, 0x9]
	ldr r1, _0805FE0C @ =gSaveBlock1Ptr
	ldr r2, [r1]
	movs r1, 0x5
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _0805FE50
	ldrb r1, [r4, 0xA]
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _0805FE18
	b _0805FE50
	.align 2, 0
_0805FE0C: .4byte gSaveBlock1Ptr
_0805FE10:
	mov r1, r8
	adds r0, r5, r1
	adds r0, r3, r0
	b _0805FE52
_0805FE18:
	movs r6, 0
	adds r3, r2, 0
	movs r0, 0x8E
	lsls r0, 4
	mov r8, r0
	ldrb r0, [r4, 0x8]
	mov r12, r0
	mov r0, r8
	adds r2, r3, r0
	movs r5, 0
	adds r7, r1, 0
_0805FE2E:
	ldrb r1, [r2]
	cmp r12, r1
	bne _0805FE46
	ldrb r1, [r4, 0x9]
	movs r0, 0x5
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne _0805FE46
	movs r0, 0x4
	ldrsb r0, [r3, r0]
	cmp r7, r0
	beq _0805FE10
_0805FE46:
	adds r2, 0x18
	adds r5, 0x18
	adds r6, 0x1
	cmp r6, 0x3F
	ble _0805FE2E
_0805FE50:
	movs r0, 0
_0805FE52:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805FDE8

	thumb_func_start sub_805FE5C
sub_805FE5C: @ 805FE5C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805FDE8
	adds r1, r0, 0
	cmp r1, 0
	beq _0805FE76
	ldrh r0, [r4, 0x10]
	subs r0, 0x7
	strh r0, [r1, 0x4]
	ldrh r0, [r4, 0x12]
	subs r0, 0x7
	strh r0, [r1, 0x6]
_0805FE76:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805FE5C

	thumb_func_start sub_805FE7C
sub_805FE7C: @ 805FE7C
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_805FDE8
	cmp r0, 0
	beq _0805FE8C
	strb r4, [r0, 0x9]
_0805FE8C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805FE7C

	thumb_func_start sub_805FE94
sub_805FE94: @ 805FE94
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805FEC2
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805FEC8 @ =gMapObjects
	adds r0, r1
	bl sub_805FE5C
_0805FEC2:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805FEC8: .4byte gMapObjects
	thumb_func_end sub_805FE94

	thumb_func_start npc_paltag_set_load
npc_paltag_set_load: @ 805FECC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl gpu_pal_allocator_reset__manage_upper_four
	ldr r1, _0805FF04 @ =gUnknown_203709A
	ldr r2, _0805FF08 @ =0x000011ff
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _0805FF0C @ =gUnknown_2037098
	strb r4, [r2]
	cmp r4, 0x1
	bne _0805FF18
	ldr r1, _0805FF10 @ =gUnknown_83A5330
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x6
	bl pal_patch_for_npc_range
	ldr r1, _0805FF14 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	b _0805FF2A
	.align 2, 0
_0805FF04: .4byte gUnknown_203709A
_0805FF08: .4byte 0x000011ff
_0805FF0C: .4byte gUnknown_2037098
_0805FF10: .4byte gUnknown_83A5330
_0805FF14: .4byte gReservedSpritePaletteCount
_0805FF18:
	ldr r0, _0805FF30 @ =gUnknown_83A5330
	ldrb r1, [r2]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0
	movs r2, 0xA
	bl pal_patch_for_npc_range
_0805FF2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF30: .4byte gUnknown_83A5330
	thumb_func_end npc_paltag_set_load

	thumb_func_start npc_paltag_by_palslot
npc_paltag_by_palslot: @ 805FF34
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9
	bhi _0805FF70
	ldr r1, _0805FF50 @ =gUnknown_83A5330
	ldr r0, _0805FF54 @ =gUnknown_2037098
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r2, 1
	b _0805FF64
	.align 2, 0
_0805FF50: .4byte gUnknown_83A5330
_0805FF54: .4byte gUnknown_2037098
_0805FF58:
	adds r1, r4, 0x4
	adds r1, r2, r1
	ldr r0, _0805FF6C @ =gUnknown_2037098
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 1
_0805FF64:
	adds r0, r1
	ldrh r0, [r0]
	b _0805FFA2
	.align 2, 0
_0805FF6C: .4byte gUnknown_2037098
_0805FF70:
	movs r3, 0
	ldr r0, _0805FFA8 @ =gUnknown_83A5278
	ldrh r1, [r0]
	ldr r2, _0805FFAC @ =0x000011ff
	adds r4, r0, 0
	cmp r1, r2
	beq _0805FFA0
	adds r6, r4, 0
	ldr r0, _0805FFB0 @ =gUnknown_203709A
	ldrh r1, [r0]
	adds r5, r2, 0
_0805FF86:
	lsls r2, r3, 3
	adds r0, r2, r6
	ldrh r0, [r0]
	cmp r0, r1
	beq _0805FF58
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r5
	bne _0805FF86
_0805FFA0:
	ldr r0, _0805FFAC @ =0x000011ff
_0805FFA2:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805FFA8: .4byte gUnknown_83A5278
_0805FFAC: .4byte 0x000011ff
_0805FFB0: .4byte gUnknown_203709A
	thumb_func_end npc_paltag_by_palslot

	thumb_func_start sub_805FFB4
sub_805FFB4: @ 805FFB4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FFD0 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805FFD4 @ =sub_805FFD8
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_0805FFD0: .4byte gMapObjects
_0805FFD4: .4byte sub_805FFD8
	thumb_func_end sub_805FFB4

	thumb_func_start sub_805FFD8
sub_805FFD8: @ 805FFD8
	movs r0, 0
	bx lr
	thumb_func_end sub_805FFD8

	thumb_func_start sub_805FFDC
sub_805FFDC: @ 805FFDC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FFF8 @ =gMapObjects
	adds r0, r2
	ldr r2, _0805FFFC @ =sub_8060000
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_0805FFF8: .4byte gMapObjects
_0805FFFC: .4byte sub_8060000
	thumb_func_end sub_805FFDC

	thumb_func_start sub_8060000
sub_8060000: @ 8060000
	push {r4,lr}
	ldr r3, _0806001C @ =gUnknown_83A6018
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806001C: .4byte gUnknown_83A6018
	thumb_func_end sub_8060000

	thumb_func_start sub_8060020
sub_8060020: @ 8060020
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0806003C @ =gMapObjects
	adds r0, r2
	ldr r2, _08060040 @ =sub_8060044
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_0806003C: .4byte gMapObjects
_08060040: .4byte sub_8060044
	thumb_func_end sub_8060020

	thumb_func_start sub_8060044
sub_8060044: @ 8060044
	push {r4,lr}
	ldr r3, _08060060 @ =gUnknown_83A6034
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060060: .4byte gUnknown_83A6034
	thumb_func_end sub_8060044

	thumb_func_start sub_8060064
sub_8060064: @ 8060064
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060064

	thumb_func_start sub_8060078
sub_8060078: @ 8060078
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060078

	thumb_func_start sub_80600A4
sub_80600A4: @ 80600A4
	push {r4-r6,lr}
	adds r6, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _080600D8
	ldr r5, _080600D4 @ =gUnknown_83A6000
	bl Random
	movs r4, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r6, 0
	bl SetFieldObjectStepTimer
	strh r4, [r6, 0x30]
	movs r0, 0x1
	b _080600DA
	.align 2, 0
_080600D4: .4byte gUnknown_83A6000
_080600D8:
	movs r0, 0
_080600DA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80600A4

	thumb_func_start sub_80600E0
sub_80600E0: @ 80600E0
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _080600F4
	movs r0, 0
	b _080600FA
_080600F4:
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0x1
_080600FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80600E0

	thumb_func_start sub_8060100
sub_8060100: @ 8060100
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _08060148 @ =gUnknown_83A6050
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x5
	strh r0, [r6, 0x30]
	adds r0, r5, 0
	adds r1, r4, 0
	bl npc_block_way__next_tile
	lsls r0, 24
	cmp r0, 0
	beq _0806013E
	movs r0, 0x1
	strh r0, [r6, 0x30]
_0806013E:
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08060148: .4byte gUnknown_83A6050
	thumb_func_end sub_8060100

	thumb_func_start sub_806014C
sub_806014C: @ 806014C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_8063F84
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806014C

	thumb_func_start sub_806017C
sub_806017C: @ 806017C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_8063F2C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806017C

	thumb_func_start sub_80601AC
sub_80601AC: @ 80601AC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _080601CA
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_080601CA:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80601AC

	thumb_func_start FieldObjectIsTrainerAndCloseToPlayer
FieldObjectIsTrainerAndCloseToPlayer: @ 80601D4
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r0, 0x80
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08060240
	ldrb r0, [r5, 0x7]
	cmp r0, 0x1
	beq _080601F0
	cmp r0, 0x3
	bne _08060240
_080601F0:
	mov r7, sp
	adds r7, 0x2
	mov r0, sp
	adds r1, r7, 0
	bl PlayerGetDestCoords
	ldrh r2, [r5, 0x10]
	ldrh r4, [r5, 0x12]
	ldrb r1, [r5, 0x1D]
	subs r3, r2, r1
	subs r0, r4, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r2, r1, r2
	lsls r2, 16
	lsrs r2, 16
	adds r1, r4
	lsls r1, 16
	lsrs r6, r1, 16
	mov r0, sp
	lsls r3, 16
	asrs r3, 16
	movs r1, 0
	ldrsh r4, [r0, r1]
	cmp r3, r4
	bgt _08060240
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, r4
	blt _08060240
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0
	ldrsh r1, [r7, r2]
	cmp r0, r1
	bgt _08060240
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, r1
	bge _08060244
_08060240:
	movs r0, 0
	b _08060246
_08060244:
	movs r0, 0x1
_08060246:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsTrainerAndCloseToPlayer

	thumb_func_start GetRegularRunningPastFacingDirection
GetRegularRunningPastFacingDirection: @ 8060250
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 16
	lsls r3, 16
	cmp r2, r3
	ble _0806026E
	movs r2, 0x4
	lsls r0, r4, 16
	cmp r0, 0
	bge _08060278
	movs r2, 0x3
	b _08060278
_0806026E:
	movs r2, 0x1
	lsls r0, 16
	cmp r0, 0
	bge _08060278
	movs r2, 0x2
_08060278:
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetRegularRunningPastFacingDirection

	thumb_func_start GetNorthSouthRunningPastFacingDirection
GetNorthSouthRunningPastFacingDirection: @ 8060280
	push {lr}
	movs r0, 0x1
	lsls r1, 16
	cmp r1, 0
	bge _0806028C
	movs r0, 0x2
_0806028C:
	pop {r1}
	bx r1
	thumb_func_end GetNorthSouthRunningPastFacingDirection

	thumb_func_start GetEastWestRunningPastFacingDirection
GetEastWestRunningPastFacingDirection: @ 8060290
	push {lr}
	movs r1, 0x4
	lsls r0, 16
	cmp r0, 0
	bge _0806029C
	movs r1, 0x3
_0806029C:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end GetEastWestRunningPastFacingDirection

	thumb_func_start GetNorthEastRunningPastFacingDirection
GetNorthEastRunningPastFacingDirection: @ 80602A4
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetRegularRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080602E0
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetEastWestRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080602FA
	b _080602F8
_080602E0:
	cmp r0, 0x4
	bne _080602FA
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetNorthSouthRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080602FA
_080602F8:
	movs r0, 0x2
_080602FA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetNorthEastRunningPastFacingDirection

	thumb_func_start GetNorthWestRunningPastFacingDirection
GetNorthWestRunningPastFacingDirection: @ 8060300
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetRegularRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806033C
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetEastWestRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08060356
	b _08060354
_0806033C:
	cmp r0, 0x3
	bne _08060356
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetNorthSouthRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08060356
_08060354:
	movs r0, 0x2
_08060356:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetNorthWestRunningPastFacingDirection

	thumb_func_start GetSouthEastRunningPastFacingDirection
GetSouthEastRunningPastFacingDirection: @ 806035C
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetRegularRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08060398
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetEastWestRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080603B2
	b _080603B0
_08060398:
	cmp r0, 0x4
	bne _080603B2
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetNorthSouthRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080603B2
_080603B0:
	movs r0, 0x1
_080603B2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetSouthEastRunningPastFacingDirection

	thumb_func_start GetSouthWestRunningPastFacingDirection
GetSouthWestRunningPastFacingDirection: @ 80603B8
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetRegularRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080603F4
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetEastWestRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0806040E
	b _0806040C
_080603F4:
	cmp r0, 0x3
	bne _0806040E
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl GetNorthSouthRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0806040E
_0806040C:
	movs r0, 0x1
_0806040E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetSouthWestRunningPastFacingDirection

	thumb_func_start GetNonEastRunningPastFacingDirection
GetNonEastRunningPastFacingDirection: @ 8060414
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl GetRegularRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0806044A
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl GetNorthSouthRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
_0806044A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetNonEastRunningPastFacingDirection

	thumb_func_start GetNonWestRunningPastFacingDirection
GetNonWestRunningPastFacingDirection: @ 8060450
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl GetRegularRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08060486
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl GetNorthSouthRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
_08060486:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetNonWestRunningPastFacingDirection

	thumb_func_start GetNonSouthRunningPastFacingDirection
GetNonSouthRunningPastFacingDirection: @ 806048C
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl GetRegularRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080604C2
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl GetEastWestRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
_080604C2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetNonSouthRunningPastFacingDirection

	thumb_func_start GetNonNorthRunningPastFacingDirection
GetNonNorthRunningPastFacingDirection: @ 80604C8
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl GetRegularRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080604FE
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl GetEastWestRunningPastFacingDirection
	lsls r0, 24
	lsrs r0, 24
_080604FE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetNonNorthRunningPastFacingDirection

	thumb_func_start GetRunningPastFacingDirection
GetRunningPastFacingDirection: @ 8060504
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	bne _0806051C
	movs r0, 0
	b _08060580
_0806051C:
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	mov r2, sp
	mov r0, sp
	ldrh r0, [r0]
	ldrh r1, [r4, 0x10]
	subs r0, r1
	strh r0, [r2]
	ldrh r0, [r5]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r5]
	mov r0, sp
	ldrh r3, [r5]
	ldrh r2, [r0]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _08060550
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
_08060550:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0
	bge _0806055E
	negs r0, r0
	lsls r0, 16
	lsrs r3, r0, 16
_0806055E:
	ldr r0, _08060588 @ =gUnknown_83A6054
	lsls r4, r6, 2
	adds r4, r0
	mov r0, sp
	movs r6, 0
	ldrsh r0, [r0, r6]
	movs r6, 0
	ldrsh r1, [r5, r6]
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	ldr r4, [r4]
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_08060580:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08060588: .4byte gUnknown_83A6054
	thumb_func_end GetRunningPastFacingDirection

	thumb_func_start sub_806058C
sub_806058C: @ 806058C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080605A8 @ =gMapObjects
	adds r0, r2
	ldr r2, _080605AC @ =sub_80605B0
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080605A8: .4byte gMapObjects
_080605AC: .4byte sub_80605B0
	thumb_func_end sub_806058C

	thumb_func_start sub_80605B0
sub_80605B0: @ 80605B0
	push {r4,lr}
	ldr r3, _080605CC @ =gUnknown_83A6080
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080605CC: .4byte gUnknown_83A6080
	thumb_func_end sub_80605B0

	thumb_func_start sub_80605D0
sub_80605D0: @ 80605D0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80605D0

	thumb_func_start sub_80605E4
sub_80605E4: @ 80605E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80605E4

	thumb_func_start sub_8060610
sub_8060610: @ 8060610
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08060646
	ldr r4, _08060650 @ =gUnknown_83A6000
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_08060646:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060650: .4byte gUnknown_83A6000
	thumb_func_end sub_8060610

	thumb_func_start sub_8060654
sub_8060654: @ 8060654
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _08060672
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0806067A
_08060672:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0806067C
_0806067A:
	movs r0, 0
_0806067C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060654

	thumb_func_start sub_8060684
sub_8060684: @ 8060684
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080606C8 @ =gUnknown_83A6050
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080606B4
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_080606B4:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080606C8: .4byte gUnknown_83A6050
	thumb_func_end sub_8060684

	thumb_func_start sub_80606CC
sub_80606CC: @ 80606CC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080606E8 @ =gMapObjects
	adds r0, r2
	ldr r2, _080606EC @ =sub_80606F0
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080606E8: .4byte gMapObjects
_080606EC: .4byte sub_80606F0
	thumb_func_end sub_80606CC

	thumb_func_start sub_80606F0
sub_80606F0: @ 80606F0
	push {r4,lr}
	ldr r3, _0806070C @ =gUnknown_83A6094
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806070C: .4byte gUnknown_83A6094
	thumb_func_end sub_80606F0

	thumb_func_start sub_8060710
sub_8060710: @ 8060710
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060710

	thumb_func_start sub_8060724
sub_8060724: @ 8060724
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060724

	thumb_func_start sub_8060750
sub_8060750: @ 8060750
	push {r4-r6,lr}
	adds r6, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08060784
	ldr r5, _08060780 @ =gUnknown_83A6000
	bl Random
	movs r4, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r6, 0
	bl SetFieldObjectStepTimer
	strh r4, [r6, 0x30]
	movs r0, 0x1
	b _08060786
	.align 2, 0
_08060780: .4byte gUnknown_83A6000
_08060784:
	movs r0, 0
_08060786:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8060750

	thumb_func_start sub_806078C
sub_806078C: @ 806078C
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _080607A0
	movs r0, 0
	b _080607A6
_080607A0:
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0x1
_080607A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806078C

	thumb_func_start sub_80607AC
sub_80607AC: @ 80607AC
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _080607F4 @ =gUnknown_83A60B0
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl Random
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x5
	strh r0, [r6, 0x30]
	adds r0, r5, 0
	adds r1, r4, 0
	bl npc_block_way__next_tile
	lsls r0, 24
	cmp r0, 0
	beq _080607EA
	strh r7, [r6, 0x30]
_080607EA:
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080607F4: .4byte gUnknown_83A60B0
	thumb_func_end sub_80607AC

	thumb_func_start sub_80607F8
sub_80607F8: @ 80607F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_8063F84
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80607F8

	thumb_func_start sub_8060828
sub_8060828: @ 8060828
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08060846
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_08060846:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060828

	thumb_func_start sub_8060850
sub_8060850: @ 8060850
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0806086C @ =gMapObjects
	adds r0, r2
	ldr r2, _08060870 @ =sub_8060874
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_0806086C: .4byte gMapObjects
_08060870: .4byte sub_8060874
	thumb_func_end sub_8060850

	thumb_func_start sub_8060874
sub_8060874: @ 8060874
	push {r4,lr}
	ldr r3, _08060890 @ =gUnknown_83A60B4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060890: .4byte gUnknown_83A60B4
	thumb_func_end sub_8060874

	thumb_func_start sub_8060894
sub_8060894: @ 8060894
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060894

	thumb_func_start sub_80608A8
sub_80608A8: @ 80608A8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80608A8

	thumb_func_start sub_80608D4
sub_80608D4: @ 80608D4
	push {r4-r6,lr}
	adds r6, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08060908
	ldr r5, _08060904 @ =gUnknown_83A6000
	bl Random
	movs r4, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r6, 0
	bl SetFieldObjectStepTimer
	strh r4, [r6, 0x30]
	movs r0, 0x1
	b _0806090A
	.align 2, 0
_08060904: .4byte gUnknown_83A6000
_08060908:
	movs r0, 0
_0806090A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80608D4

	thumb_func_start sub_8060910
sub_8060910: @ 8060910
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _08060924
	movs r0, 0
	b _0806092A
_08060924:
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0806092A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060910

	thumb_func_start sub_8060930
sub_8060930: @ 8060930
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _08060978 @ =gUnknown_83A60D0
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl Random
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x5
	strh r0, [r6, 0x30]
	adds r0, r5, 0
	adds r1, r4, 0
	bl npc_block_way__next_tile
	lsls r0, 24
	cmp r0, 0
	beq _0806096E
	strh r7, [r6, 0x30]
_0806096E:
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060978: .4byte gUnknown_83A60D0
	thumb_func_end sub_8060930

	thumb_func_start sub_806097C
sub_806097C: @ 806097C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_8063F84
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806097C

	thumb_func_start sub_80609AC
sub_80609AC: @ 80609AC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _080609CA
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_080609CA:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80609AC

	thumb_func_start sub_80609D4
sub_80609D4: @ 80609D4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080609F0 @ =gMapObjects
	adds r0, r2
	ldr r2, _080609F4 @ =sub_80609F8
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080609F0: .4byte gMapObjects
_080609F4: .4byte sub_80609F8
	thumb_func_end sub_80609D4

	thumb_func_start sub_80609F8
sub_80609F8: @ 80609F8
	push {r4,lr}
	ldr r3, _08060A14 @ =gUnknown_83A60D4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A14: .4byte gUnknown_83A60D4
	thumb_func_end sub_80609F8

	thumb_func_start sub_8060A18
sub_8060A18: @ 8060A18
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060A18

	thumb_func_start sub_8060A44
sub_8060A44: @ 8060A44
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	bne _08060A56
	movs r0, 0
	b _08060A5C
_08060A56:
	movs r0, 0x2
	strh r0, [r4, 0x30]
	movs r0, 0x1
_08060A5C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060A44

	thumb_func_start sub_8060A64
sub_8060A64: @ 8060A64
	ldrb r2, [r0]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0
	bx lr
	thumb_func_end sub_8060A64

	thumb_func_start sub_8060A74
sub_8060A74: @ 8060A74
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08060A90 @ =gMapObjects
	adds r0, r2
	ldr r2, _08060A94 @ =sub_8060A98
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08060A90: .4byte gMapObjects
_08060A94: .4byte sub_8060A98
	thumb_func_end sub_8060A74

	thumb_func_start sub_8060A98
sub_8060A98: @ 8060A98
	push {r4,lr}
	ldr r3, _08060AB4 @ =gUnknown_83A60E0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060AB4: .4byte gUnknown_83A60E0
	thumb_func_end sub_8060A98

	thumb_func_start sub_8060AB8
sub_8060AB8: @ 8060AB8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060AB8

	thumb_func_start sub_8060ACC
sub_8060ACC: @ 8060ACC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060ACC

	thumb_func_start sub_8060AF8
sub_8060AF8: @ 8060AF8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08060B2E
	ldr r4, _08060B38 @ =gUnknown_83A6000
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_08060B2E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060B38: .4byte gUnknown_83A6000
	thumb_func_end sub_8060AF8

	thumb_func_start sub_8060B3C
sub_8060B3C: @ 8060B3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _08060B5A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _08060B62
_08060B5A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _08060B64
_08060B62:
	movs r0, 0
_08060B64:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060B3C

	thumb_func_start sub_8060B6C
sub_8060B6C: @ 8060B6C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08060BB0 @ =gUnknown_83A60B0
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x1
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08060B9C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_08060B9C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08060BB0: .4byte gUnknown_83A60B0
	thumb_func_end sub_8060B6C

	thumb_func_start sub_8060BB4
sub_8060BB4: @ 8060BB4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08060BD0 @ =gMapObjects
	adds r0, r2
	ldr r2, _08060BD4 @ =sub_8060BD8
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08060BD0: .4byte gMapObjects
_08060BD4: .4byte sub_8060BD8
	thumb_func_end sub_8060BB4

	thumb_func_start sub_8060BD8
sub_8060BD8: @ 8060BD8
	push {r4,lr}
	ldr r3, _08060BF4 @ =gUnknown_83A60F4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060BF4: .4byte gUnknown_83A60F4
	thumb_func_end sub_8060BD8

	thumb_func_start sub_8060BF8
sub_8060BF8: @ 8060BF8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060BF8

	thumb_func_start sub_8060C0C
sub_8060C0C: @ 8060C0C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060C0C

	thumb_func_start sub_8060C38
sub_8060C38: @ 8060C38
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08060C6E
	ldr r4, _08060C78 @ =gUnknown_83A6000
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_08060C6E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060C78: .4byte gUnknown_83A6000
	thumb_func_end sub_8060C38

	thumb_func_start sub_8060C7C
sub_8060C7C: @ 8060C7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _08060C9A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _08060CA2
_08060C9A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _08060CA4
_08060CA2:
	movs r0, 0
_08060CA4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060C7C

	thumb_func_start sub_8060CAC
sub_8060CAC: @ 8060CAC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08060CF0 @ =gUnknown_83A60D0
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x2
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08060CDC
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_08060CDC:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08060CF0: .4byte gUnknown_83A60D0
	thumb_func_end sub_8060CAC

	thumb_func_start sub_8060CF4
sub_8060CF4: @ 8060CF4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08060D10 @ =gMapObjects
	adds r0, r2
	ldr r2, _08060D14 @ =sub_8060D18
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08060D10: .4byte gMapObjects
_08060D14: .4byte sub_8060D18
	thumb_func_end sub_8060CF4

	thumb_func_start sub_8060D18
sub_8060D18: @ 8060D18
	push {r4,lr}
	ldr r3, _08060D34 @ =gUnknown_83A6108
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060D34: .4byte gUnknown_83A6108
	thumb_func_end sub_8060D18

	thumb_func_start sub_8060D38
sub_8060D38: @ 8060D38
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060D38

	thumb_func_start sub_8060D4C
sub_8060D4C: @ 8060D4C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060D4C

	thumb_func_start sub_8060D78
sub_8060D78: @ 8060D78
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08060DAE
	ldr r4, _08060DB8 @ =gUnknown_83A6010
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_08060DAE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060DB8: .4byte gUnknown_83A6010
	thumb_func_end sub_8060D78

	thumb_func_start sub_8060DBC
sub_8060DBC: @ 8060DBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _08060DDA
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _08060DE2
_08060DDA:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _08060DE4
_08060DE2:
	movs r0, 0
_08060DE4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060DBC

	thumb_func_start sub_8060DEC
sub_8060DEC: @ 8060DEC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08060E30 @ =gUnknown_83A611C
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x3
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08060E1C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_08060E1C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08060E30: .4byte gUnknown_83A611C
	thumb_func_end sub_8060DEC

	thumb_func_start sub_8060E34
sub_8060E34: @ 8060E34
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08060E50 @ =gMapObjects
	adds r0, r2
	ldr r2, _08060E54 @ =sub_8060E58
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08060E50: .4byte gMapObjects
_08060E54: .4byte sub_8060E58
	thumb_func_end sub_8060E34

	thumb_func_start sub_8060E58
sub_8060E58: @ 8060E58
	push {r4,lr}
	ldr r3, _08060E74 @ =gUnknown_83A6120
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060E74: .4byte gUnknown_83A6120
	thumb_func_end sub_8060E58

	thumb_func_start sub_8060E78
sub_8060E78: @ 8060E78
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060E78

	thumb_func_start sub_8060E8C
sub_8060E8C: @ 8060E8C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060E8C

	thumb_func_start sub_8060EB8
sub_8060EB8: @ 8060EB8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08060EEE
	ldr r4, _08060EF8 @ =gUnknown_83A6010
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_08060EEE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060EF8: .4byte gUnknown_83A6010
	thumb_func_end sub_8060EB8

	thumb_func_start sub_8060EFC
sub_8060EFC: @ 8060EFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _08060F1A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _08060F22
_08060F1A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _08060F24
_08060F22:
	movs r0, 0
_08060F24:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060EFC

	thumb_func_start sub_8060F2C
sub_8060F2C: @ 8060F2C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08060F70 @ =gUnknown_83A6134
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x4
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08060F5C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_08060F5C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08060F70: .4byte gUnknown_83A6134
	thumb_func_end sub_8060F2C

	thumb_func_start sub_8060F74
sub_8060F74: @ 8060F74
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08060F90 @ =gMapObjects
	adds r0, r2
	ldr r2, _08060F94 @ =sub_8060F98
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08060F90: .4byte gMapObjects
_08060F94: .4byte sub_8060F98
	thumb_func_end sub_8060F74

	thumb_func_start sub_8060F98
sub_8060F98: @ 8060F98
	push {r4,lr}
	ldr r3, _08060FB4 @ =gUnknown_83A6138
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060FB4: .4byte gUnknown_83A6138
	thumb_func_end sub_8060F98

	thumb_func_start sub_8060FB8
sub_8060FB8: @ 8060FB8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FB8

	thumb_func_start sub_8060FCC
sub_8060FCC: @ 8060FCC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FCC

	thumb_func_start sub_8060FF8
sub_8060FF8: @ 8060FF8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _0806102E
	ldr r4, _08061038 @ =gUnknown_83A6010
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0806102E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08061038: .4byte gUnknown_83A6010
	thumb_func_end sub_8060FF8

	thumb_func_start sub_806103C
sub_806103C: @ 806103C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _0806105A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _08061062
_0806105A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _08061064
_08061062:
	movs r0, 0
_08061064:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806103C

	thumb_func_start sub_806106C
sub_806106C: @ 806106C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080610B0 @ =gUnknown_83A614C
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x5
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0806109C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0806109C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080610B0: .4byte gUnknown_83A614C
	thumb_func_end sub_806106C

	thumb_func_start sub_80610B4
sub_80610B4: @ 80610B4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080610D0 @ =gMapObjects
	adds r0, r2
	ldr r2, _080610D4 @ =sub_80610D8
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080610D0: .4byte gMapObjects
_080610D4: .4byte sub_80610D8
	thumb_func_end sub_80610B4

	thumb_func_start sub_80610D8
sub_80610D8: @ 80610D8
	push {r4,lr}
	ldr r3, _080610F4 @ =gUnknown_83A6150
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080610F4: .4byte gUnknown_83A6150
	thumb_func_end sub_80610D8

	thumb_func_start sub_80610F8
sub_80610F8: @ 80610F8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80610F8

	thumb_func_start sub_806110C
sub_806110C: @ 806110C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806110C

	thumb_func_start sub_8061138
sub_8061138: @ 8061138
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _0806116E
	ldr r4, _08061178 @ =gUnknown_83A6010
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0806116E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08061178: .4byte gUnknown_83A6010
	thumb_func_end sub_8061138

	thumb_func_start sub_806117C
sub_806117C: @ 806117C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _0806119A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _080611A2
_0806119A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _080611A4
_080611A2:
	movs r0, 0
_080611A4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806117C

	thumb_func_start sub_80611AC
sub_80611AC: @ 80611AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080611F0 @ =gUnknown_83A6164
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x6
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080611DC
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_080611DC:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080611F0: .4byte gUnknown_83A6164
	thumb_func_end sub_80611AC

	thumb_func_start sub_80611F4
sub_80611F4: @ 80611F4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061210 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061214 @ =sub_8061218
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061210: .4byte gMapObjects
_08061214: .4byte sub_8061218
	thumb_func_end sub_80611F4

	thumb_func_start sub_8061218
sub_8061218: @ 8061218
	push {r4,lr}
	ldr r3, _08061234 @ =gUnknown_83A6168
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061234: .4byte gUnknown_83A6168
	thumb_func_end sub_8061218

	thumb_func_start sub_8061238
sub_8061238: @ 8061238
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061238

	thumb_func_start sub_806124C
sub_806124C: @ 806124C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806124C

	thumb_func_start sub_8061278
sub_8061278: @ 8061278
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _080612AE
	ldr r4, _080612B8 @ =gUnknown_83A6010
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_080612AE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080612B8: .4byte gUnknown_83A6010
	thumb_func_end sub_8061278

	thumb_func_start sub_80612BC
sub_80612BC: @ 80612BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _080612DA
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _080612E2
_080612DA:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _080612E4
_080612E2:
	movs r0, 0
_080612E4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80612BC

	thumb_func_start sub_80612EC
sub_80612EC: @ 80612EC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061330 @ =gUnknown_83A617C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x7
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0806131C
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0806131C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061330: .4byte gUnknown_83A617C
	thumb_func_end sub_80612EC

	thumb_func_start sub_8061334
sub_8061334: @ 8061334
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061350 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061354 @ =sub_8061358
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061350: .4byte gMapObjects
_08061354: .4byte sub_8061358
	thumb_func_end sub_8061334

	thumb_func_start sub_8061358
sub_8061358: @ 8061358
	push {r4,lr}
	ldr r3, _08061374 @ =gUnknown_83A6180
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061374: .4byte gUnknown_83A6180
	thumb_func_end sub_8061358

	thumb_func_start sub_8061378
sub_8061378: @ 8061378
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061378

	thumb_func_start sub_806138C
sub_806138C: @ 806138C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806138C

	thumb_func_start sub_80613B8
sub_80613B8: @ 80613B8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _080613EE
	ldr r4, _080613F8 @ =gUnknown_83A6010
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_080613EE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080613F8: .4byte gUnknown_83A6010
	thumb_func_end sub_80613B8

	thumb_func_start sub_80613FC
sub_80613FC: @ 80613FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _0806141A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _08061422
_0806141A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _08061424
_08061422:
	movs r0, 0
_08061424:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80613FC

	thumb_func_start sub_806142C
sub_806142C: @ 806142C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061470 @ =gUnknown_83A6194
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x8
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0806145C
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0806145C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061470: .4byte gUnknown_83A6194
	thumb_func_end sub_806142C

	thumb_func_start sub_8061474
sub_8061474: @ 8061474
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061490 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061494 @ =sub_8061498
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061490: .4byte gMapObjects
_08061494: .4byte sub_8061498
	thumb_func_end sub_8061474

	thumb_func_start sub_8061498
sub_8061498: @ 8061498
	push {r4,lr}
	ldr r3, _080614B4 @ =gUnknown_83A6198
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080614B4: .4byte gUnknown_83A6198
	thumb_func_end sub_8061498

	thumb_func_start sub_80614B8
sub_80614B8: @ 80614B8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80614B8

	thumb_func_start sub_80614CC
sub_80614CC: @ 80614CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80614CC

	thumb_func_start sub_80614F8
sub_80614F8: @ 80614F8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _0806152E
	ldr r4, _08061538 @ =gUnknown_83A6010
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0806152E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08061538: .4byte gUnknown_83A6010
	thumb_func_end sub_80614F8

	thumb_func_start sub_806153C
sub_806153C: @ 806153C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _0806155A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _08061562
_0806155A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _08061564
_08061562:
	movs r0, 0
_08061564:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806153C

	thumb_func_start sub_806156C
sub_806156C: @ 806156C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080615B0 @ =gUnknown_83A61AC
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x9
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0806159C
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0806159C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080615B0: .4byte gUnknown_83A61AC
	thumb_func_end sub_806156C

	thumb_func_start sub_80615B4
sub_80615B4: @ 80615B4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080615D0 @ =gMapObjects
	adds r0, r2
	ldr r2, _080615D4 @ =sub_80615D8
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080615D0: .4byte gMapObjects
_080615D4: .4byte sub_80615D8
	thumb_func_end sub_80615B4

	thumb_func_start sub_80615D8
sub_80615D8: @ 80615D8
	push {r4,lr}
	ldr r3, _080615F4 @ =gUnknown_83A61B0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080615F4: .4byte gUnknown_83A61B0
	thumb_func_end sub_80615D8

	thumb_func_start sub_80615F8
sub_80615F8: @ 80615F8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80615F8

	thumb_func_start sub_806160C
sub_806160C: @ 806160C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806160C

	thumb_func_start sub_8061638
sub_8061638: @ 8061638
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _0806166E
	ldr r4, _08061678 @ =gUnknown_83A6010
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl SetFieldObjectStepTimer
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0806166E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08061678: .4byte gUnknown_83A6010
	thumb_func_end sub_8061638

	thumb_func_start sub_806167C
sub_806167C: @ 806167C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _0806169A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _080616A2
_0806169A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _080616A4
_080616A2:
	movs r0, 0
_080616A4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806167C

	thumb_func_start sub_80616AC
sub_80616AC: @ 80616AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080616F0 @ =gUnknown_83A61C4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0xA
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080616DC
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_080616DC:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080616F0: .4byte gUnknown_83A61C4
	thumb_func_end sub_80616AC

	thumb_func_start sub_80616F4
sub_80616F4: @ 80616F4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061710 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061714 @ =sub_8061718
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061710: .4byte gMapObjects
_08061714: .4byte sub_8061718
	thumb_func_end sub_80616F4

	thumb_func_start sub_8061718
sub_8061718: @ 8061718
	push {r4,lr}
	ldr r3, _08061734 @ =gUnknown_83A61C8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061734: .4byte gUnknown_83A61C8
	thumb_func_end sub_8061718

	thumb_func_start sub_8061738
sub_8061738: @ 8061738
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061738

	thumb_func_start sub_8061764
sub_8061764: @ 8061764
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _0806177E
	adds r0, r4, 0
	movs r1, 0x30
	bl SetFieldObjectStepTimer
	movs r0, 0x2
	strh r0, [r4, 0x30]
_0806177E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061764

	thumb_func_start sub_8061788
sub_8061788: @ 8061788
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _080617A6
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _080617AA
_080617A6:
	movs r0, 0x3
	strh r0, [r5, 0x30]
_080617AA:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061788

	thumb_func_start sub_80617B4
sub_80617B4: @ 80617B4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080617F4 @ =gUnknown_83A61D8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080617E0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
_080617E0:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0
	strh r0, [r5, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080617F4: .4byte gUnknown_83A61D8
	thumb_func_end sub_80617B4

	thumb_func_start sub_80617F8
sub_80617F8: @ 80617F8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061814 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061818 @ =sub_806181C
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061814: .4byte gMapObjects
_08061818: .4byte sub_806181C
	thumb_func_end sub_80617F8

	thumb_func_start sub_806181C
sub_806181C: @ 806181C
	push {r4,lr}
	ldr r3, _08061838 @ =gUnknown_83A61E0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061838: .4byte gUnknown_83A61E0
	thumb_func_end sub_806181C

	thumb_func_start sub_806183C
sub_806183C: @ 806183C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806183C

	thumb_func_start sub_8061868
sub_8061868: @ 8061868
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08061882
	adds r0, r4, 0
	movs r1, 0x30
	bl SetFieldObjectStepTimer
	movs r0, 0x2
	strh r0, [r4, 0x30]
_08061882:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061868

	thumb_func_start sub_806188C
sub_806188C: @ 806188C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	bne _080618AA
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _080618AE
_080618AA:
	movs r0, 0x3
	strh r0, [r5, 0x30]
_080618AE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806188C

	thumb_func_start sub_80618B8
sub_80618B8: @ 80618B8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080618F8 @ =gUnknown_83A61F0
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl GetRunningPastFacingDirection
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080618E4
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
_080618E4:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0
	strh r0, [r5, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080618F8: .4byte gUnknown_83A61F0
	thumb_func_end sub_80618B8

	thumb_func_start sub_80618FC
sub_80618FC: @ 80618FC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061918 @ =gMapObjects
	adds r0, r2
	ldr r2, _0806191C @ =sub_8061920
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061918: .4byte gMapObjects
_0806191C: .4byte sub_8061920
	thumb_func_end sub_80618FC

	thumb_func_start sub_8061920
sub_8061920: @ 8061920
	push {r4,lr}
	ldr r3, _0806193C @ =gUnknown_83A61F8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806193C: .4byte gUnknown_83A61F8
	thumb_func_end sub_8061920

	thumb_func_start sub_8061940
sub_8061940: @ 8061940
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061940

	thumb_func_start sub_8061954
sub_8061954: @ 8061954
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _08061988 @ =gUnknown_839FD5D
	ldrb r1, [r4, 0x6]
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r4, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0
	beq _08061976
	adds r0, r1, 0
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r1, r0, 24
_08061976:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061988: .4byte gUnknown_839FD5D
	thumb_func_end sub_8061954

	thumb_func_start sub_806198C
sub_806198C: @ 806198C
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r7, r1, 0
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0
	beq _080619BC
	ldr r1, [r4, 0xC]
	ldr r0, [r4, 0x10]
	cmp r1, r0
	bne _080619BC
	movs r0, 0
	strb r0, [r2]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
_080619BC:
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl npc_block_way__next_tile
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_8063F84
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r5, 0x1
	bne _08061A12
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_8063F84
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl npc_block_way__next_tile
	lsls r0, 24
	lsrs r5, r0, 24
_08061A12:
	cmp r5, 0
	beq _08061A24
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	lsls r0, 24
	lsrs r6, r0, 24
_08061A24:
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_80645C8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x3
	strh r0, [r7, 0x30]
	movs r0, 0x1
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806198C

	thumb_func_start sub_8061A44
sub_8061A44: @ 8061A44
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08061A62
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_08061A62:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A44

	thumb_func_start sub_8061A6C
sub_8061A6C: @ 8061A6C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A6C

	thumb_func_start MoveFieldObjectInNextDirectionInSequence
MoveFieldObjectInNextDirectionInSequence: @ 8061A80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	mov r8, r1
	adds r7, r2, 0
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _08061AA2
	ldr r1, [r4, 0xC]
	ldr r0, [r4, 0x10]
	cmp r1, r0
	bne _08061AA2
	movs r0, 0
	strb r0, [r2]
_08061AA2:
	adds r5, r4, 0
	adds r5, 0x21
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_8063F84
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl npc_block_way__next_tile
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08061AFC
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_8063F84
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl npc_block_way__next_tile
	lsls r0, 24
	lsrs r0, 24
_08061AFC:
	cmp r0, 0
	beq _08061B0E
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	lsls r0, 24
	lsrs r6, r0, 24
_08061B0E:
	adds r0, r4, 0
	mov r1, r8
	adds r2, r6, 0
	bl sub_80645C8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	mov r1, r8
	strh r0, [r1, 0x30]
	movs r0, 0x1
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end MoveFieldObjectInNextDirectionInSequence

	thumb_func_start sub_8061B34
sub_8061B34: @ 8061B34
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08061B52
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_08061B52:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B34

	thumb_func_start sub_8061B5C
sub_8061B5C: @ 8061B5C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061B78 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061B7C @ =sub_8061B80
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061B78: .4byte gMapObjects
_08061B7C: .4byte sub_8061B80
	thumb_func_end sub_8061B5C

	thumb_func_start sub_8061B80
sub_8061B80: @ 8061B80
	push {r4,lr}
	ldr r3, _08061B9C @ =gUnknown_83A6208
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061B9C: .4byte gUnknown_83A6208
	thumb_func_end sub_8061B80

	thumb_func_start sub_8061BA0
sub_8061BA0: @ 8061BA0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061BE4 @ =gUnknown_83A6214
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _08061BCC
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08061BCC
	movs r0, 0x3
	strb r0, [r2]
_08061BCC:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061BE4: .4byte gUnknown_83A6214
	thumb_func_end sub_8061BA0

	thumb_func_start sub_8061BE8
sub_8061BE8: @ 8061BE8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061C04 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061C08 @ =sub_8061C0C
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061C04: .4byte gMapObjects
_08061C08: .4byte sub_8061C0C
	thumb_func_end sub_8061BE8

	thumb_func_start sub_8061C0C
sub_8061C0C: @ 8061C0C
	push {r4,lr}
	ldr r3, _08061C28 @ =gUnknown_83A6218
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061C28: .4byte gUnknown_83A6218
	thumb_func_end sub_8061C0C

	thumb_func_start sub_8061C2C
sub_8061C2C: @ 8061C2C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061C70 @ =gUnknown_83A6224
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _08061C58
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08061C58
	movs r0, 0x2
	strb r0, [r2]
_08061C58:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061C70: .4byte gUnknown_83A6224
	thumb_func_end sub_8061C2C

	thumb_func_start sub_8061C74
sub_8061C74: @ 8061C74
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061C90 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061C94 @ =sub_8061C98
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061C90: .4byte gMapObjects
_08061C94: .4byte sub_8061C98
	thumb_func_end sub_8061C74

	thumb_func_start sub_8061C98
sub_8061C98: @ 8061C98
	push {r4,lr}
	ldr r3, _08061CB4 @ =gUnknown_83A6228
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061CB4: .4byte gUnknown_83A6228
	thumb_func_end sub_8061C98

	thumb_func_start sub_8061CB8
sub_8061CB8: @ 8061CB8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061CFC @ =gUnknown_83A6234
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _08061CE4
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08061CE4
	movs r0, 0x2
	strb r0, [r2]
_08061CE4:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061CFC: .4byte gUnknown_83A6234
	thumb_func_end sub_8061CB8

	thumb_func_start sub_8061D00
sub_8061D00: @ 8061D00
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061D1C @ =gMapObjects
	adds r0, r2
	ldr r2, _08061D20 @ =sub_8061D24
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061D1C: .4byte gMapObjects
_08061D20: .4byte sub_8061D24
	thumb_func_end sub_8061D00

	thumb_func_start sub_8061D24
sub_8061D24: @ 8061D24
	push {r4,lr}
	ldr r3, _08061D40 @ =gUnknown_83A6238
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061D40: .4byte gUnknown_83A6238
	thumb_func_end sub_8061D24

	thumb_func_start sub_8061D44
sub_8061D44: @ 8061D44
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061D88 @ =gUnknown_83A6244
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _08061D70
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08061D70
	movs r0, 0x3
	strb r0, [r2]
_08061D70:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061D88: .4byte gUnknown_83A6244
	thumb_func_end sub_8061D44

	thumb_func_start sub_8061D8C
sub_8061D8C: @ 8061D8C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061DA8 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061DAC @ =sub_8061DB0
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061DA8: .4byte gMapObjects
_08061DAC: .4byte sub_8061DB0
	thumb_func_end sub_8061D8C

	thumb_func_start sub_8061DB0
sub_8061DB0: @ 8061DB0
	push {r4,lr}
	ldr r3, _08061DCC @ =gUnknown_83A6248
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061DCC: .4byte gUnknown_83A6248
	thumb_func_end sub_8061DB0

	thumb_func_start sub_8061DD0
sub_8061DD0: @ 8061DD0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061E14 @ =gUnknown_83A6254
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _08061DFC
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08061DFC
	movs r0, 0x3
	strb r0, [r2]
_08061DFC:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061E14: .4byte gUnknown_83A6254
	thumb_func_end sub_8061DD0

	thumb_func_start sub_8061E18
sub_8061E18: @ 8061E18
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061E34 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061E38 @ =sub_8061E3C
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061E34: .4byte gMapObjects
_08061E38: .4byte sub_8061E3C
	thumb_func_end sub_8061E18

	thumb_func_start sub_8061E3C
sub_8061E3C: @ 8061E3C
	push {r4,lr}
	ldr r3, _08061E58 @ =gUnknown_83A6258
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061E58: .4byte gUnknown_83A6258
	thumb_func_end sub_8061E3C

	thumb_func_start sub_8061E5C
sub_8061E5C: @ 8061E5C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061EA0 @ =gUnknown_83A6264
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _08061E88
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08061E88
	movs r0, 0x2
	strb r0, [r2]
_08061E88:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061EA0: .4byte gUnknown_83A6264
	thumb_func_end sub_8061E5C

	thumb_func_start sub_8061EA4
sub_8061EA4: @ 8061EA4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061EC0 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061EC4 @ =sub_8061EC8
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061EC0: .4byte gMapObjects
_08061EC4: .4byte sub_8061EC8
	thumb_func_end sub_8061EA4

	thumb_func_start sub_8061EC8
sub_8061EC8: @ 8061EC8
	push {r4,lr}
	ldr r3, _08061EE4 @ =gUnknown_83A6268
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061EE4: .4byte gUnknown_83A6268
	thumb_func_end sub_8061EC8

	thumb_func_start sub_8061EE8
sub_8061EE8: @ 8061EE8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061F2C @ =gUnknown_83A6050
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _08061F14
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08061F14
	movs r0, 0x2
	strb r0, [r2]
_08061F14:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061F2C: .4byte gUnknown_83A6050
	thumb_func_end sub_8061EE8

	thumb_func_start sub_8061F30
sub_8061F30: @ 8061F30
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061F4C @ =gMapObjects
	adds r0, r2
	ldr r2, _08061F50 @ =sub_8061F54
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061F4C: .4byte gMapObjects
_08061F50: .4byte sub_8061F54
	thumb_func_end sub_8061F30

	thumb_func_start sub_8061F54
sub_8061F54: @ 8061F54
	push {r4,lr}
	ldr r3, _08061F70 @ =gUnknown_83A6274
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061F70: .4byte gUnknown_83A6274
	thumb_func_end sub_8061F54

	thumb_func_start sub_8061F74
sub_8061F74: @ 8061F74
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08061FB8 @ =gUnknown_83A6280
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _08061FA0
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08061FA0
	movs r0, 0x3
	strb r0, [r2]
_08061FA0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08061FB8: .4byte gUnknown_83A6280
	thumb_func_end sub_8061F74

	thumb_func_start sub_8061FBC
sub_8061FBC: @ 8061FBC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08061FD8 @ =gMapObjects
	adds r0, r2
	ldr r2, _08061FDC @ =sub_8061FE0
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08061FD8: .4byte gMapObjects
_08061FDC: .4byte sub_8061FE0
	thumb_func_end sub_8061FBC

	thumb_func_start sub_8061FE0
sub_8061FE0: @ 8061FE0
	push {r4,lr}
	ldr r3, _08061FFC @ =gUnknown_83A6284
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08061FFC: .4byte gUnknown_83A6284
	thumb_func_end sub_8061FE0

	thumb_func_start sub_8062000
sub_8062000: @ 8062000
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08062044 @ =gUnknown_83A6290
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0806202C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0806202C
	movs r0, 0x3
	strb r0, [r2]
_0806202C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062044: .4byte gUnknown_83A6290
	thumb_func_end sub_8062000

	thumb_func_start sub_8062048
sub_8062048: @ 8062048
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062064 @ =gMapObjects
	adds r0, r2
	ldr r2, _08062068 @ =sub_806206C
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062064: .4byte gMapObjects
_08062068: .4byte sub_806206C
	thumb_func_end sub_8062048

	thumb_func_start sub_806206C
sub_806206C: @ 806206C
	push {r4,lr}
	ldr r3, _08062088 @ =gUnknown_83A6294
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062088: .4byte gUnknown_83A6294
	thumb_func_end sub_806206C

	thumb_func_start sub_806208C
sub_806208C: @ 806208C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080620D0 @ =gUnknown_83A62A0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _080620B8
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080620B8
	movs r0, 0x2
	strb r0, [r2]
_080620B8:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080620D0: .4byte gUnknown_83A62A0
	thumb_func_end sub_806208C

	thumb_func_start sub_80620D4
sub_80620D4: @ 80620D4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080620F0 @ =gMapObjects
	adds r0, r2
	ldr r2, _080620F4 @ =sub_80620F8
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080620F0: .4byte gMapObjects
_080620F4: .4byte sub_80620F8
	thumb_func_end sub_80620D4

	thumb_func_start sub_80620F8
sub_80620F8: @ 80620F8
	push {r4,lr}
	ldr r3, _08062114 @ =gUnknown_83A62A4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062114: .4byte gUnknown_83A62A4
	thumb_func_end sub_80620F8

	thumb_func_start sub_8062118
sub_8062118: @ 8062118
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0806215C @ =gUnknown_83A62B0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _08062144
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08062144
	movs r0, 0x2
	strb r0, [r2]
_08062144:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806215C: .4byte gUnknown_83A62B0
	thumb_func_end sub_8062118

	thumb_func_start sub_8062160
sub_8062160: @ 8062160
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0806217C @ =gMapObjects
	adds r0, r2
	ldr r2, _08062180 @ =sub_8062184
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_0806217C: .4byte gMapObjects
_08062180: .4byte sub_8062184
	thumb_func_end sub_8062160

	thumb_func_start sub_8062184
sub_8062184: @ 8062184
	push {r4,lr}
	ldr r3, _080621A0 @ =gUnknown_83A62B4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080621A0: .4byte gUnknown_83A62B4
	thumb_func_end sub_8062184

	thumb_func_start sub_80621A4
sub_80621A4: @ 80621A4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080621E8 @ =gUnknown_83A62C0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _080621D0
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080621D0
	movs r0, 0x3
	strb r0, [r2]
_080621D0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080621E8: .4byte gUnknown_83A62C0
	thumb_func_end sub_80621A4

	thumb_func_start sub_80621EC
sub_80621EC: @ 80621EC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062208 @ =gMapObjects
	adds r0, r2
	ldr r2, _0806220C @ =sub_8062210
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062208: .4byte gMapObjects
_0806220C: .4byte sub_8062210
	thumb_func_end sub_80621EC

	thumb_func_start sub_8062210
sub_8062210: @ 8062210
	push {r4,lr}
	ldr r3, _0806222C @ =gUnknown_83A62C4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806222C: .4byte gUnknown_83A62C4
	thumb_func_end sub_8062210

	thumb_func_start sub_8062230
sub_8062230: @ 8062230
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08062274 @ =gUnknown_83A62D0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0806225C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0806225C
	movs r0, 0x3
	strb r0, [r2]
_0806225C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062274: .4byte gUnknown_83A62D0
	thumb_func_end sub_8062230

	thumb_func_start sub_8062278
sub_8062278: @ 8062278
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062294 @ =gMapObjects
	adds r0, r2
	ldr r2, _08062298 @ =sub_806229C
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062294: .4byte gMapObjects
_08062298: .4byte sub_806229C
	thumb_func_end sub_8062278

	thumb_func_start sub_806229C
sub_806229C: @ 806229C
	push {r4,lr}
	ldr r3, _080622B8 @ =gUnknown_83A62D4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080622B8: .4byte gUnknown_83A62D4
	thumb_func_end sub_806229C

	thumb_func_start sub_80622BC
sub_80622BC: @ 80622BC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08062300 @ =gUnknown_83A62E0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _080622E8
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080622E8
	movs r0, 0x2
	strb r0, [r2]
_080622E8:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062300: .4byte gUnknown_83A62E0
	thumb_func_end sub_80622BC

	thumb_func_start sub_8062304
sub_8062304: @ 8062304
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062320 @ =gMapObjects
	adds r0, r2
	ldr r2, _08062324 @ =sub_8062328
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062320: .4byte gMapObjects
_08062324: .4byte sub_8062328
	thumb_func_end sub_8062304

	thumb_func_start sub_8062328
sub_8062328: @ 8062328
	push {r4,lr}
	ldr r3, _08062344 @ =gUnknown_83A62E4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062344: .4byte gUnknown_83A62E4
	thumb_func_end sub_8062328

	thumb_func_start sub_8062348
sub_8062348: @ 8062348
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0806238C @ =gUnknown_83A62F0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _08062374
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08062374
	movs r0, 0x2
	strb r0, [r2]
_08062374:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806238C: .4byte gUnknown_83A62F0
	thumb_func_end sub_8062348

	thumb_func_start sub_8062390
sub_8062390: @ 8062390
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080623AC @ =gMapObjects
	adds r0, r2
	ldr r2, _080623B0 @ =sub_80623B4
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080623AC: .4byte gMapObjects
_080623B0: .4byte sub_80623B4
	thumb_func_end sub_8062390

	thumb_func_start sub_80623B4
sub_80623B4: @ 80623B4
	push {r4,lr}
	ldr r3, _080623D0 @ =gUnknown_83A62F4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080623D0: .4byte gUnknown_83A62F4
	thumb_func_end sub_80623B4

	thumb_func_start sub_80623D4
sub_80623D4: @ 80623D4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08062418 @ =gUnknown_83A6300
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _08062400
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08062400
	movs r0, 0x3
	strb r0, [r2]
_08062400:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062418: .4byte gUnknown_83A6300
	thumb_func_end sub_80623D4

	thumb_func_start sub_806241C
sub_806241C: @ 806241C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062438 @ =gMapObjects
	adds r0, r2
	ldr r2, _0806243C @ =sub_8062440
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062438: .4byte gMapObjects
_0806243C: .4byte sub_8062440
	thumb_func_end sub_806241C

	thumb_func_start sub_8062440
sub_8062440: @ 8062440
	push {r4,lr}
	ldr r3, _0806245C @ =gUnknown_83A6304
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806245C: .4byte gUnknown_83A6304
	thumb_func_end sub_8062440

	thumb_func_start sub_8062460
sub_8062460: @ 8062460
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080624A4 @ =gUnknown_83A6310
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0806248C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0806248C
	movs r0, 0x3
	strb r0, [r2]
_0806248C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080624A4: .4byte gUnknown_83A6310
	thumb_func_end sub_8062460

	thumb_func_start sub_80624A8
sub_80624A8: @ 80624A8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080624C4 @ =gMapObjects
	adds r0, r2
	ldr r2, _080624C8 @ =sub_80624CC
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080624C4: .4byte gMapObjects
_080624C8: .4byte sub_80624CC
	thumb_func_end sub_80624A8

	thumb_func_start sub_80624CC
sub_80624CC: @ 80624CC
	push {r4,lr}
	ldr r3, _080624E8 @ =gUnknown_83A6314
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080624E8: .4byte gUnknown_83A6314
	thumb_func_end sub_80624CC

	thumb_func_start sub_80624EC
sub_80624EC: @ 80624EC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08062530 @ =gUnknown_83A6320
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _08062518
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08062518
	movs r0, 0x3
	strb r0, [r2]
_08062518:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062530: .4byte gUnknown_83A6320
	thumb_func_end sub_80624EC

	thumb_func_start sub_8062534
sub_8062534: @ 8062534
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062550 @ =gMapObjects
	adds r0, r2
	ldr r2, _08062554 @ =sub_8062558
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062550: .4byte gMapObjects
_08062554: .4byte sub_8062558
	thumb_func_end sub_8062534

	thumb_func_start sub_8062558
sub_8062558: @ 8062558
	push {r4,lr}
	ldr r3, _08062574 @ =gUnknown_83A6324
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062574: .4byte gUnknown_83A6324
	thumb_func_end sub_8062558

	thumb_func_start sub_8062578
sub_8062578: @ 8062578
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080625BC @ =gUnknown_83A6330
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _080625A4
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080625A4
	movs r0, 0x3
	strb r0, [r2]
_080625A4:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080625BC: .4byte gUnknown_83A6330
	thumb_func_end sub_8062578

	thumb_func_start sub_80625C0
sub_80625C0: @ 80625C0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080625DC @ =gMapObjects
	adds r0, r2
	ldr r2, _080625E0 @ =sub_80625E4
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080625DC: .4byte gMapObjects
_080625E0: .4byte sub_80625E4
	thumb_func_end sub_80625C0

	thumb_func_start sub_80625E4
sub_80625E4: @ 80625E4
	push {r4,lr}
	ldr r3, _08062600 @ =gUnknown_83A6334
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062600: .4byte gUnknown_83A6334
	thumb_func_end sub_80625E4

	thumb_func_start sub_8062604
sub_8062604: @ 8062604
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08062648 @ =gUnknown_83A6340
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _08062630
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08062630
	movs r0, 0x3
	strb r0, [r2]
_08062630:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062648: .4byte gUnknown_83A6340
	thumb_func_end sub_8062604

	thumb_func_start sub_806264C
sub_806264C: @ 806264C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062668 @ =gMapObjects
	adds r0, r2
	ldr r2, _0806266C @ =sub_8062670
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062668: .4byte gMapObjects
_0806266C: .4byte sub_8062670
	thumb_func_end sub_806264C

	thumb_func_start sub_8062670
sub_8062670: @ 8062670
	push {r4,lr}
	ldr r3, _0806268C @ =gUnknown_83A6344
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806268C: .4byte gUnknown_83A6344
	thumb_func_end sub_8062670

	thumb_func_start sub_8062690
sub_8062690: @ 8062690
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080626D4 @ =gUnknown_83A6350
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _080626BC
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080626BC
	movs r0, 0x3
	strb r0, [r2]
_080626BC:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080626D4: .4byte gUnknown_83A6350
	thumb_func_end sub_8062690

	thumb_func_start sub_80626D8
sub_80626D8: @ 80626D8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080626F4 @ =gMapObjects
	adds r0, r2
	ldr r2, _080626F8 @ =sub_80626FC
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080626F4: .4byte gMapObjects
_080626F8: .4byte sub_80626FC
	thumb_func_end sub_80626D8

	thumb_func_start sub_80626FC
sub_80626FC: @ 80626FC
	push {r4,lr}
	ldr r3, _08062718 @ =gUnknown_83A6354
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062718: .4byte gUnknown_83A6354
	thumb_func_end sub_80626FC

	thumb_func_start sub_806271C
sub_806271C: @ 806271C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08062760 @ =gUnknown_83A6360
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _08062748
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08062748
	movs r0, 0x3
	strb r0, [r2]
_08062748:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062760: .4byte gUnknown_83A6360
	thumb_func_end sub_806271C

	thumb_func_start sub_8062764
sub_8062764: @ 8062764
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062780 @ =gMapObjects
	adds r0, r2
	ldr r2, _08062784 @ =sub_8062788
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062780: .4byte gMapObjects
_08062784: .4byte sub_8062788
	thumb_func_end sub_8062764

	thumb_func_start sub_8062788
sub_8062788: @ 8062788
	push {r4,lr}
	ldr r3, _080627A4 @ =gUnknown_83A6364
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080627A4: .4byte gUnknown_83A6364
	thumb_func_end sub_8062788

	thumb_func_start sub_80627A8
sub_80627A8: @ 80627A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080627EC @ =gUnknown_83A6370
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _080627D4
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080627D4
	movs r0, 0x3
	strb r0, [r2]
_080627D4:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080627EC: .4byte gUnknown_83A6370
	thumb_func_end sub_80627A8

	thumb_func_start sub_80627F0
sub_80627F0: @ 80627F0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0806280C @ =gMapObjects
	adds r0, r2
	ldr r2, _08062810 @ =sub_8062814
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_0806280C: .4byte gMapObjects
_08062810: .4byte sub_8062814
	thumb_func_end sub_80627F0

	thumb_func_start sub_8062814
sub_8062814: @ 8062814
	push {r4,lr}
	ldr r3, _08062830 @ =gUnknown_83A6374
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062830: .4byte gUnknown_83A6374
	thumb_func_end sub_8062814

	thumb_func_start sub_8062834
sub_8062834: @ 8062834
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08062878 @ =gUnknown_83A6380
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _08062860
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08062860
	movs r0, 0x3
	strb r0, [r2]
_08062860:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062878: .4byte gUnknown_83A6380
	thumb_func_end sub_8062834

	thumb_func_start sub_806287C
sub_806287C: @ 806287C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062898 @ =gMapObjects
	adds r0, r2
	ldr r2, _0806289C @ =sub_80628A0
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062898: .4byte gMapObjects
_0806289C: .4byte sub_80628A0
	thumb_func_end sub_806287C

	thumb_func_start sub_80628A0
sub_80628A0: @ 80628A0
	push {r4,lr}
	ldr r3, _080628BC @ =gUnknown_83A6384
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080628BC: .4byte gUnknown_83A6384
	thumb_func_end sub_80628A0

	thumb_func_start mss_npc_reset_oampriv3_1_unk2_unk3
mss_npc_reset_oampriv3_1_unk2_unk3: @ 80628C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	adds r4, 0x21
	ldrb r0, [r4]
	cmp r0, 0
	bne _080628D8
	bl GetPlayerFacingDirection
	strb r0, [r4]
_080628D8:
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end mss_npc_reset_oampriv3_1_unk2_unk3

	thumb_func_start sub_80628E4
sub_80628E4: @ 80628E4
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	ldr r2, _08062908 @ =gMapObjects
	ldr r3, _0806290C @ =gPlayerAvatar
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1C]
	cmp r0, 0xFF
	beq _08062904
	ldrb r0, [r3, 0x3]
	cmp r0, 0x2
	bne _08062910
_08062904:
	movs r0, 0
	b _08062938
	.align 2, 0
_08062908: .4byte gMapObjects
_0806290C: .4byte gPlayerAvatar
_08062910:
	ldr r5, _08062940 @ =gUnknown_83A6390
	bl player_get_x22
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	adds r4, r5
	bl player_get_direction_upper_nybble
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r4, [r4]
	adds r0, r6, 0
	adds r1, r7, 0
	movs r3, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_08062938:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062940: .4byte gUnknown_83A6390
	thumb_func_end sub_80628E4

	thumb_func_start sub_8062944
sub_8062944: @ 8062944
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08062962
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_08062962:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062944

	thumb_func_start sub_806296C
sub_806296C: @ 806296C
	movs r0, 0
	bx lr
	thumb_func_end sub_806296C

	thumb_func_start sub_8062970
sub_8062970: @ 8062970
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _080629B4 @ =gUnknown_839FD5D
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080629B4: .4byte gUnknown_839FD5D
	thumb_func_end sub_8062970

	thumb_func_start sub_80629B8
sub_80629B8: @ 80629B8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _08062A6C @ =gUnknown_839FD5D
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_8063F84
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _08062A3E
	mov r1, r8
	cmp r1, 0
	beq _08062A52
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _08062A52
_08062A3E:
	adds r0, r6, 0
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
_08062A52:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062A6C: .4byte gUnknown_839FD5D
	thumb_func_end sub_80629B8

	thumb_func_start sub_8062A70
sub_8062A70: @ 8062A70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _08062B24 @ =gUnknown_839FD5D
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_8063FB0
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _08062AF6
	mov r1, r8
	cmp r1, 0
	beq _08062B0A
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _08062B0A
_08062AF6:
	adds r0, r6, 0
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
_08062B0A:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062B24: .4byte gUnknown_839FD5D
	thumb_func_end sub_8062A70

	thumb_func_start sub_8062B28
sub_8062B28: @ 8062B28
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _08062BDC @ =gUnknown_839FD5D
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_8064034
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _08062BAE
	mov r1, r8
	cmp r1, 0
	beq _08062BC2
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _08062BC2
_08062BAE:
	adds r0, r6, 0
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
_08062BC2:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062BDC: .4byte gUnknown_839FD5D
	thumb_func_end sub_8062B28

	thumb_func_start sub_8062BE0
sub_8062BE0: @ 8062BE0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _08062C94 @ =gUnknown_839FD5D
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_8064060
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _08062C66
	mov r1, r8
	cmp r1, 0
	beq _08062C7A
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _08062C7A
_08062C66:
	adds r0, r6, 0
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
_08062C7A:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062C94: .4byte gUnknown_839FD5D
	thumb_func_end sub_8062BE0

	thumb_func_start cph_IM_DIFFERENT
cph_IM_DIFFERENT: @ 8062C98
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _08062CDC @ =gUnknown_839FD5D
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl sub_806413C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08062CDC: .4byte gUnknown_839FD5D
	thumb_func_end cph_IM_DIFFERENT

	thumb_func_start sub_8062CE0
sub_8062CE0: @ 8062CE0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _08062D94 @ =gUnknown_839FD5D
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_8064194
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _08062D66
	mov r1, r8
	cmp r1, 0
	beq _08062D7A
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _08062D7A
_08062D66:
	adds r0, r6, 0
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
_08062D7A:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062D94: .4byte gUnknown_839FD5D
	thumb_func_end sub_8062CE0

	thumb_func_start oac_hopping
oac_hopping: @ 8062D98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _08062E5C @ =gUnknown_839FD5D
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	movs r0, 0x2
	str r0, [sp]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	movs r3, 0x2
	bl sub_8063A6C
	adds r0, r6, 0
	bl GetJumpLedgeAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _08062E2C
	mov r1, r8
	cmp r1, 0
	beq _08062E40
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _08062E40
_08062E2C:
	adds r0, r6, 0
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80645C8
_08062E40:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062E5C: .4byte gUnknown_839FD5D
	thumb_func_end oac_hopping

	thumb_func_start sub_8062E60
sub_8062E60: @ 8062E60
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08062E7C @ =gMapObjects
	adds r0, r2
	ldr r2, _08062E80 @ =sub_8062E84
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_08062E7C: .4byte gMapObjects
_08062E80: .4byte sub_8062E84
	thumb_func_end sub_8062E60

	thumb_func_start sub_8062E84
sub_8062E84: @ 8062E84
	push {r4,lr}
	ldr r3, _08062EA0 @ =gUnknown_83A63BC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062EA0: .4byte gUnknown_83A63BC
	thumb_func_end sub_8062E84

	thumb_func_start mss_08062EA4
mss_08062EA4: @ 8062EA4
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	ldr r2, _08062EC8 @ =gMapObjects
	ldr r3, _08062ECC @ =gPlayerAvatar
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1C]
	cmp r0, 0xFF
	beq _08062EC4
	ldrb r0, [r3, 0x3]
	cmp r0, 0x2
	bne _08062ED0
_08062EC4:
	movs r0, 0
	b _08062EF8
	.align 2, 0
_08062EC8: .4byte gMapObjects
_08062ECC: .4byte gPlayerAvatar
_08062ED0:
	ldr r5, _08062F00 @ =gUnknown_83A6390
	bl player_get_x22
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	adds r4, r5
	bl player_get_direction_upper_nybble
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08062F04 @ =MetatileBehavior_IsTallGrass
	ldr r4, [r4]
	adds r0, r6, 0
	adds r1, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_08062EF8:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08062F00: .4byte gUnknown_83A6390
_08062F04: .4byte MetatileBehavior_IsTallGrass
	thumb_func_end mss_08062EA4

	thumb_func_start FieldObjectCB_TreeDisguise
FieldObjectCB_TreeDisguise: @ 8062F08
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08062F6C @ =gMapObjects
	adds r4, r1, r0
	adds r6, r4, 0
	adds r6, 0x21
	ldrb r0, [r6]
	cmp r0, 0
	beq _08062F30
	cmp r0, 0x1
	bne _08062F50
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08062F50
_08062F30:
	ldr r1, _08062F70 @ =gFieldEffectArguments
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x1C
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	movs r0, 0x1
	strb r0, [r6]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_08062F50:
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08062F6C @ =gMapObjects
	adds r0, r1
	ldr r2, _08062F74 @ =sub_8062F78
	adds r1, r5, 0
	bl FieldObjectStep
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062F6C: .4byte gMapObjects
_08062F70: .4byte gFieldEffectArguments
_08062F74: .4byte sub_8062F78
	thumb_func_end FieldObjectCB_TreeDisguise

	thumb_func_start sub_8062F78
sub_8062F78: @ 8062F78
	push {lr}
	bl npc_reset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8062F78

	thumb_func_start FieldObjectCB_MountainDisguise
FieldObjectCB_MountainDisguise: @ 8062F84
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08062FE8 @ =gMapObjects
	adds r4, r1, r0
	adds r6, r4, 0
	adds r6, 0x21
	ldrb r0, [r6]
	cmp r0, 0
	beq _08062FAC
	cmp r0, 0x1
	bne _08062FCC
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08062FCC
_08062FAC:
	ldr r1, _08062FEC @ =gFieldEffectArguments
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x1D
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	movs r0, 0x1
	strb r0, [r6]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_08062FCC:
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08062FE8 @ =gMapObjects
	adds r0, r1
	ldr r2, _08062FF0 @ =sub_8062F78
	adds r1, r5, 0
	bl FieldObjectStep
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062FE8: .4byte gMapObjects
_08062FEC: .4byte gFieldEffectArguments
_08062FF0: .4byte sub_8062F78
	thumb_func_end FieldObjectCB_MountainDisguise

	thumb_func_start FieldObjectCB_Hidden1
FieldObjectCB_Hidden1: @ 8062FF4
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	ldr r4, _08063050 @ =gMapObjects
	cmp r0, 0
	bne _08063034
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x3]
	adds r2, r3, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
_08063034:
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r2, _08063054 @ =sub_8063058
	adds r1, r3, 0
	bl FieldObjectStep
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063050: .4byte gMapObjects
_08063054: .4byte sub_8063058
	thumb_func_end FieldObjectCB_Hidden1

	thumb_func_start sub_8063058
sub_8063058: @ 8063058
	push {r4,lr}
	ldr r3, _08063074 @ =gUnknown_83A63C8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063074: .4byte gUnknown_83A63C8
	thumb_func_end sub_8063058

	thumb_func_start sub_8063078
sub_8063078: @ 8063078
	push {lr}
	bl npc_reset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8063078

	thumb_func_start sub_8063084
sub_8063084: @ 8063084
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08063096
	movs r0, 0
	strh r0, [r4, 0x30]
_08063096:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063084

	thumb_func_start sub_80630A0
sub_80630A0: @ 80630A0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080630BC @ =gMapObjects
	adds r0, r2
	ldr r2, _080630C0 @ =sub_80630C4
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080630BC: .4byte gMapObjects
_080630C0: .4byte sub_80630C4
	thumb_func_end sub_80630A0

	thumb_func_start sub_80630C4
sub_80630C4: @ 80630C4
	push {r4,lr}
	ldr r3, _080630E0 @ =gUnknown_83A63CC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080630E0: .4byte gUnknown_83A63CC
	thumb_func_end sub_80630C4

	thumb_func_start sub_80630E4
sub_80630E4: @ 80630E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80630E4

	thumb_func_start sub_8063110
sub_8063110: @ 8063110
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0806312C @ =gMapObjects
	adds r0, r2
	ldr r2, _08063130 @ =sub_8063134
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_0806312C: .4byte gMapObjects
_08063130: .4byte sub_8063134
	thumb_func_end sub_8063110

	thumb_func_start sub_8063134
sub_8063134: @ 8063134
	push {r4,lr}
	ldr r3, _08063150 @ =gUnknown_83A63D4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063150: .4byte gUnknown_83A63D4
	thumb_func_end sub_8063134

	thumb_func_start sub_8063154
sub_8063154: @ 8063154
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8064270
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063154

	thumb_func_start sub_8063180
sub_8063180: @ 8063180
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0806319C @ =gMapObjects
	adds r0, r2
	ldr r2, _080631A0 @ =sub_80631A4
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_0806319C: .4byte gMapObjects
_080631A0: .4byte sub_80631A4
	thumb_func_end sub_8063180

	thumb_func_start sub_80631A4
sub_80631A4: @ 80631A4
	push {r4,lr}
	ldr r3, _080631C0 @ =gUnknown_83A63DC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080631C0: .4byte gUnknown_83A63DC
	thumb_func_end sub_80631A4

	thumb_func_start sub_80631C4
sub_80631C4: @ 80631C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay4AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80631C4

	thumb_func_start sub_80631F0
sub_80631F0: @ 80631F0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0806320C @ =gMapObjects
	adds r0, r2
	ldr r2, _08063210 @ =sub_8063214
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_0806320C: .4byte gMapObjects
_08063210: .4byte sub_8063214
	thumb_func_end sub_80631F0

	thumb_func_start sub_8063214
sub_8063214: @ 8063214
	push {r4,lr}
	ldr r3, _08063230 @ =gUnknown_83A63E4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063230: .4byte gUnknown_83A63E4
	thumb_func_end sub_8063214

	thumb_func_start sub_8063234
sub_8063234: @ 8063234
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80645C8
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063234

	thumb_func_start sub_8063268
sub_8063268: @ 8063268
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	bne _0806327A
	movs r0, 0
	b _08063280
_0806327A:
	movs r0, 0x2
	strh r0, [r4, 0x30]
	movs r0, 0x1
_08063280:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063268

	thumb_func_start sub_8063288
sub_8063288: @ 8063288
	ldrb r2, [r0]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0
	bx lr
	thumb_func_end sub_8063288

	thumb_func_start sub_8063298
sub_8063298: @ 8063298
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080632B4 @ =gMapObjects
	adds r0, r2
	ldr r2, _080632B8 @ =sub_8063304
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080632B4: .4byte gMapObjects
_080632B8: .4byte sub_8063304
	thumb_func_end sub_8063298

	thumb_func_start sub_80632BC
sub_80632BC: @ 80632BC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080632D8 @ =gMapObjects
	adds r0, r2
	ldr r2, _080632DC @ =sub_8063324
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080632D8: .4byte gMapObjects
_080632DC: .4byte sub_8063324
	thumb_func_end sub_80632BC

	thumb_func_start sub_80632E0
sub_80632E0: @ 80632E0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080632FC @ =gMapObjects
	adds r0, r2
	ldr r2, _08063300 @ =sub_8063344
	bl FieldObjectStep
	pop {r0}
	bx r0
	.align 2, 0
_080632FC: .4byte gMapObjects
_08063300: .4byte sub_8063344
	thumb_func_end sub_80632E0

	thumb_func_start sub_8063304
sub_8063304: @ 8063304
	push {r4,lr}
	ldr r3, _08063320 @ =gUnknown_83A63F0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063320: .4byte gUnknown_83A63F0
	thumb_func_end sub_8063304

	thumb_func_start sub_8063324
sub_8063324: @ 8063324
	push {r4,lr}
	ldr r3, _08063340 @ =gUnknown_83A63FC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063340: .4byte gUnknown_83A63FC
	thumb_func_end sub_8063324

	thumb_func_start sub_8063344
sub_8063344: @ 8063344
	push {r4,lr}
	ldr r3, _08063360 @ =gUnknown_83A6404
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063360: .4byte gUnknown_83A6404
	thumb_func_end sub_8063344

	thumb_func_start sub_8063364
sub_8063364: @ 8063364
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl npc_reset
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x98
	bl sub_80645C8
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063364

	thumb_func_start sub_8063384
sub_8063384: @ 8063384
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	bne _08063396
	movs r0, 0
	b _0806339C
_08063396:
	movs r0, 0x2
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0806339C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063384

	thumb_func_start sub_80633A4
sub_80633A4: @ 80633A4
	ldrb r2, [r0]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0
	bx lr
	thumb_func_end sub_80633A4

	thumb_func_start sub_80633B4
sub_80633B4: @ 80633B4
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl npc_reset
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x99
	bl sub_80645C8
	movs r0, 0x1
	strh r0, [r4, 0x30]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633B4

	thumb_func_start sub_80633D4
sub_80633D4: @ 80633D4
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl npc_reset
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x9A
	bl sub_80645C8
	movs r0, 0x1
	strh r0, [r4, 0x30]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633D4

	thumb_func_start sub_80633F4
sub_80633F4: @ 80633F4
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064588
	lsls r0, 24
	cmp r0, 0
	beq _08063406
	movs r0, 0
	strh r0, [r4, 0x30]
_08063406:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80633F4

	thumb_func_start npc_reset
npc_reset: @ 8063410
	ldrb r3, [r0]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	movs r3, 0x41
	negs r3, r3
	ands r2, r3
	movs r3, 0x7F
	ands r2, r3
	strb r2, [r0]
	movs r2, 0xFF
	strb r2, [r0, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x30]
	bx lr
	thumb_func_end npc_reset

	thumb_func_start FieldObjectDirectionToImageAnimId
FieldObjectDirectionToImageAnimId: @ 8063430
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806343C @ =gUnknown_83A640C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806343C: .4byte gUnknown_83A640C
	thumb_func_end FieldObjectDirectionToImageAnimId

	thumb_func_start get_go_image_anim_num
get_go_image_anim_num: @ 8063440
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806344C @ =gUnknown_83A6415
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806344C: .4byte gUnknown_83A6415
	thumb_func_end get_go_image_anim_num

	thumb_func_start get_go_fast_image_anim_num
get_go_fast_image_anim_num: @ 8063450
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806345C @ =gUnknown_83A641E
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806345C: .4byte gUnknown_83A641E
	thumb_func_end get_go_fast_image_anim_num

	thumb_func_start get_go_faster_image_anim_num
get_go_faster_image_anim_num: @ 8063460
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806346C @ =gUnknown_83A6427
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806346C: .4byte gUnknown_83A6427
	thumb_func_end get_go_faster_image_anim_num

	thumb_func_start sub_8063470
sub_8063470: @ 8063470
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806347C @ =gUnknown_83A6430
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806347C: .4byte gUnknown_83A6430
	thumb_func_end sub_8063470

	thumb_func_start sub_8063480
sub_8063480: @ 8063480
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806348C @ =gUnknown_83A6439
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806348C: .4byte gUnknown_83A6439
	thumb_func_end sub_8063480

	thumb_func_start sub_8063490
sub_8063490: @ 8063490
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806349C @ =gUnknown_83A6442
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806349C: .4byte gUnknown_83A6442
	thumb_func_end sub_8063490

	thumb_func_start sub_80634A0
sub_80634A0: @ 80634A0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080634AC @ =gUnknown_83A644B
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080634AC: .4byte gUnknown_83A644B
	thumb_func_end sub_80634A0

	thumb_func_start sub_80634B0
sub_80634B0: @ 80634B0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080634BC @ =gUnknown_83A6454
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080634BC: .4byte gUnknown_83A6454
	thumb_func_end sub_80634B0

	thumb_func_start sub_80634C0
sub_80634C0: @ 80634C0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080634CC @ =gUnknown_83A645D
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080634CC: .4byte gUnknown_83A645D
	thumb_func_end sub_80634C0

	thumb_func_start sub_80634D0
sub_80634D0: @ 80634D0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080634DC @ =gUnknown_83A6466
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080634DC: .4byte gUnknown_83A6466
	thumb_func_end sub_80634D0

	thumb_func_start sub_80634E0
sub_80634E0: @ 80634E0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080634EC @ =gUnknown_83A646F
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080634EC: .4byte gUnknown_83A646F
	thumb_func_end sub_80634E0

	thumb_func_start sub_80634F0
sub_80634F0: @ 80634F0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080634FC @ =gUnknown_83A6478
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080634FC: .4byte gUnknown_83A6478
	thumb_func_end sub_80634F0

	thumb_func_start sub_8063500
sub_8063500: @ 8063500
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806350C @ =gUnknown_83A6481
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806350C: .4byte gUnknown_83A6481
	thumb_func_end sub_8063500

	thumb_func_start sub_8063510
sub_8063510: @ 8063510
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806351C @ =gUnknown_83A648A
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806351C: .4byte gUnknown_83A648A
	thumb_func_end sub_8063510

	thumb_func_start get_run_image_anim_num
get_run_image_anim_num: @ 8063520
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806352C @ =gUnknown_83A6493
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806352C: .4byte gUnknown_83A6493
	thumb_func_end get_run_image_anim_num

	thumb_func_start sub_8063530
sub_8063530: @ 8063530
	push {lr}
	adds r2, r0, 0
	ldr r1, _08063538 @ =gUnknown_83A3698
	b _08063548
	.align 2, 0
_08063538: .4byte gUnknown_83A3698
_0806353C:
	ldr r0, [r1]
	cmp r0, r2
	bne _08063546
	adds r0, r1, 0
	b _08063550
_08063546:
	adds r1, 0x8
_08063548:
	ldr r0, [r1]
	cmp r0, 0
	bne _0806353C
	movs r0, 0
_08063550:
	pop {r1}
	bx r1
	thumb_func_end sub_8063530

	thumb_func_start npc_apply_anim_looping
npc_apply_anim_looping: @ 8063554
	push {r4,lr}
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _08063596
	adds r0, r4, 0
	adds r0, 0x2A
	strb r2, [r0]
	ldr r0, [r4, 0x8]
	bl sub_8063530
	adds r1, r4, 0
	adds r1, 0x2B
	cmp r0, 0
	beq _0806358E
	ldrb r2, [r1]
	ldrb r3, [r0, 0x4]
	cmp r2, r3
	bne _08063584
	ldrb r0, [r0, 0x7]
	b _0806358C
_08063584:
	ldrb r3, [r0, 0x5]
	cmp r2, r3
	bne _0806358E
	ldrb r0, [r0, 0x6]
_0806358C:
	strb r0, [r1]
_0806358E:
	ldrb r1, [r1]
	adds r0, r4, 0
	bl SeekSpriteAnim
_08063596:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end npc_apply_anim_looping

	thumb_func_start obj_npc_animation_step
obj_npc_animation_step: @ 806359C
	push {r4,lr}
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _080635D4
	adds r0, r4, 0
	adds r0, 0x2A
	strb r2, [r0]
	ldr r0, [r4, 0x8]
	bl sub_8063530
	adds r2, r0, 0
	cmp r2, 0
	beq _080635D4
	ldrb r1, [r2, 0x5]
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldrb r3, [r2, 0x4]
	cmp r0, r3
	bhi _080635CE
	ldrb r1, [r2, 0x4]
_080635CE:
	adds r0, r4, 0
	bl SeekSpriteAnim
_080635D4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end obj_npc_animation_step

	thumb_func_start sub_80635DC
sub_80635DC: @ 80635DC
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	asrs r0, 16
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	ble _080635F6
	movs r0, 0x3
	b _0806360C
_080635F6:
	cmp r0, r2
	bge _080635FE
	movs r0, 0x4
	b _0806360C
_080635FE:
	lsls r1, 16
	lsls r0, r3, 16
	cmp r1, r0
	bgt _0806360A
	movs r0, 0x1
	b _0806360C
_0806360A:
	movs r0, 0x2
_0806360C:
	pop {r1}
	bx r1
	thumb_func_end sub_80635DC

	thumb_func_start npc_set_running_behaviour_etc
npc_set_running_behaviour_etc: @ 8063610
	push {r4,lr}
	mov r12, r0
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	strb r1, [r0, 0x6]
	adds r0, 0x21
	strb r3, [r0]
	adds r0, 0x1
	strb r3, [r0]
	ldr r4, _08063654 @ =gSprites
	mov r0, r12
	ldrb r2, [r0, 0x4]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r2, r4, 0
	adds r2, 0x1C
	adds r0, r2
	ldr r2, _08063658 @ =gUnknown_839FBC8
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	str r1, [r0]
	mov r0, r12
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063654: .4byte gSprites
_08063658: .4byte gUnknown_839FBC8
	thumb_func_end npc_set_running_behaviour_etc

	thumb_func_start npc_running_behaviour_by_direction
npc_running_behaviour_by_direction: @ 806365C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08063668 @ =gUnknown_83A649C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08063668: .4byte gUnknown_83A649C
	thumb_func_end npc_running_behaviour_by_direction

	thumb_func_start npc_block_way__next_tile
npc_block_way__next_tile: @ 806366C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r5, r1, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	adds r3, r5, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end npc_block_way__next_tile

	thumb_func_start npc_block_way
npc_block_way: @ 80636AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	mov r8, r7
	lsrs r0, r1, 16
	mov r9, r0
	asrs r5, r1, 16
	lsrs r0, r2, 16
	mov r10, r0
	asrs r4, r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl IsCoordOutsideFieldObjectMovementRect
	lsls r0, 24
	cmp r0, 0
	beq _080636E2
	movs r0, 0x1
	b _08063762
_080636E2:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridIsImpassableAt
	lsls r0, 24
	cmp r0, 0
	bne _08063724
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetMapBorderIdAt
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _08063724
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r7, 0
	bl IsMetatileDirectionallyImpassable
	lsls r0, 24
	cmp r0, 0
	bne _08063724
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _08063728
	mov r0, r8
	bl CanCameraMoveInDirection
	cmp r0, 0
	bne _08063728
_08063724:
	movs r0, 0x2
	b _08063762
_08063728:
	ldrb r0, [r6, 0xB]
	lsls r0, 28
	lsrs r0, 28
	mov r2, r9
	lsls r1, r2, 16
	asrs r5, r1, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r4, r1, 16
	adds r1, r5, 0
	adds r2, r4, 0
	bl IsZCoordMismatchAt
	lsls r0, 24
	cmp r0, 0
	beq _0806374C
	movs r0, 0x3
	b _08063762
_0806374C:
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl CheckForCollisionBetweenFieldObjects
	lsls r0, 24
	cmp r0, 0
	bne _08063760
	movs r0, 0
	b _08063762
_08063760:
	movs r0, 0x4
_08063762:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end npc_block_way

	thumb_func_start sub_8063770
sub_8063770: @ 8063770
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsrs r0, r1, 16
	mov r9, r0
	asrs r6, r1, 16
	lsrs r0, r2, 16
	mov r10, r0
	asrs r5, r2, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl IsCoordOutsideFieldObjectMovementRect
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r4, r1, 31
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridIsImpassableAt
	lsls r0, 24
	cmp r0, 0
	bne _080637E8
	adds r0, r6, 0
	adds r1, r5, 0
	bl GetMapBorderIdAt
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080637E8
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	mov r3, r8
	bl IsMetatileDirectionallyImpassable
	lsls r0, 24
	cmp r0, 0
	bne _080637E8
	ldrb r0, [r7, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _080637EC
	mov r0, r8
	bl CanCameraMoveInDirection
	cmp r0, 0
	bne _080637EC
_080637E8:
	movs r0, 0x2
	orrs r4, r0
_080637EC:
	ldrb r0, [r7, 0xB]
	lsls r0, 28
	lsrs r0, 28
	mov r2, r9
	lsls r1, r2, 16
	asrs r6, r1, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r5, r1, 16
	adds r1, r6, 0
	adds r2, r5, 0
	bl IsZCoordMismatchAt
	lsls r0, 24
	cmp r0, 0
	beq _08063814
	movs r0, 0x4
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08063814:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl CheckForCollisionBetweenFieldObjects
	lsls r0, 24
	cmp r0, 0
	beq _0806382C
	movs r0, 0x8
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_0806382C:
	adds r0, r4, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8063770

	thumb_func_start IsCoordOutsideFieldObjectMovementRect
IsCoordOutsideFieldObjectMovementRect: @ 806383C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	ldrb r1, [r4, 0x19]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _08063874
	lsls r1, 28
	lsrs r2, r1, 28
	ldrh r0, [r4, 0xC]
	subs r2, r0, r2
	lsrs r1, 28
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r2, 16
	lsls r0, r3, 16
	asrs r3, r0, 16
	cmp r2, r0
	bgt _080638A0
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r3
	blt _080638A0
_08063874:
	ldrb r1, [r4, 0x19]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _080638A4
	lsls r1, 24
	lsrs r2, r1, 28
	ldrh r0, [r4, 0xE]
	subs r2, r0, r2
	lsrs r1, 28
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r2, 16
	lsls r0, r5, 16
	asrs r3, r0, 16
	cmp r2, r0
	bgt _080638A0
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r3
	bge _080638A4
_080638A0:
	movs r0, 0x1
	b _080638A6
_080638A4:
	movs r0, 0
_080638A6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsCoordOutsideFieldObjectMovementRect

	thumb_func_start IsMetatileDirectionallyImpassable
IsMetatileDirectionallyImpassable: @ 80638AC
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 24
	ldr r1, _080638F4 @ =gUnknown_83A64A8
	lsrs r3, 22
	subs r5, r3, 0x4
	adds r1, r5, r1
	ldrb r0, [r0, 0x1E]
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080638EE
	ldr r4, _080638F8 @ =gUnknown_83A64B8
	adds r4, r5, r4
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _080638FC
_080638EE:
	movs r0, 0x1
	b _080638FE
	.align 2, 0
_080638F4: .4byte gUnknown_83A64A8
_080638F8: .4byte gUnknown_83A64B8
_080638FC:
	movs r0, 0
_080638FE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end IsMetatileDirectionallyImpassable

	thumb_func_start CheckForCollisionBetweenFieldObjects
CheckForCollisionBetweenFieldObjects: @ 8063904
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	movs r4, 0
	lsls r2, 16
	asrs r5, r2, 16
_08063912:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _08063968 @ =gMapObjects
	adds r2, r0, r1
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _0806396C
	cmp r2, r6
	beq _0806396C
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	lsls r0, r7, 16
	asrs r3, r0, 16
	cmp r1, r3
	bne _0806393C
	movs r1, 0x12
	ldrsh r0, [r2, r1]
	cmp r0, r5
	beq _0806394C
_0806393C:
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	cmp r0, r3
	bne _0806396C
	movs r1, 0x16
	ldrsh r0, [r2, r1]
	cmp r0, r5
	bne _0806396C
_0806394C:
	ldrb r0, [r6, 0xB]
	lsls r0, 28
	lsrs r0, 28
	ldrb r1, [r2, 0xB]
	lsls r1, 28
	lsrs r1, 28
	bl AreZCoordsCompatible
	lsls r0, 24
	cmp r0, 0
	beq _0806396C
	movs r0, 0x1
	b _08063978
	.align 2, 0
_08063968: .4byte gMapObjects
_0806396C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08063912
	movs r0, 0
_08063978:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckForCollisionBetweenFieldObjects

	thumb_func_start IsBerryTreeSparkling
IsBerryTreeSparkling: @ 8063980
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080639CC
	ldr r3, _080639C4 @ =gSprites
	ldr r2, _080639C8 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x3C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080639CC
	movs r0, 0x1
	b _080639CE
	.align 2, 0
_080639C4: .4byte gSprites
_080639C8: .4byte gMapObjects
_080639CC:
	movs r0, 0
_080639CE:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end IsBerryTreeSparkling

	thumb_func_start sub_80639D4
sub_80639D4: @ 80639D4
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08063A12
	ldr r3, _08063A18 @ =gSprites
	ldr r2, _08063A1C @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x3C]
	movs r0, 0x4
	orrs r0, r2
	strh r0, [r1, 0x3C]
_08063A12:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08063A18: .4byte gSprites
_08063A1C: .4byte gMapObjects
	thumb_func_end sub_80639D4

	thumb_func_start MoveCoords
MoveCoords: @ 8063A20
	push {r4,lr}
	lsls r0, 24
	ldr r3, _08063A40 @ =gUnknown_83A64C8
	lsrs r0, 22
	adds r0, r3
	ldrh r3, [r0]
	ldrh r4, [r1]
	adds r3, r4
	strh r3, [r1]
	ldrh r0, [r0, 0x2]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063A40: .4byte gUnknown_83A64C8
	thumb_func_end MoveCoords

	thumb_func_start sub_8063A44
sub_8063A44: @ 8063A44
	push {r4,lr}
	lsls r0, 24
	ldr r3, _08063A68 @ =gUnknown_83A64C8
	lsrs r0, 22
	adds r0, r3
	ldrh r3, [r0]
	lsls r3, 4
	ldrh r4, [r1]
	adds r3, r4
	strh r3, [r1]
	ldrh r0, [r0, 0x2]
	lsls r0, 4
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063A68: .4byte gUnknown_83A64C8
	thumb_func_end sub_8063A44

	thumb_func_start sub_8063A6C
sub_8063A6C: @ 8063A6C
	push {r4-r7,lr}
	adds r4, r1, 0
	ldr r1, [sp, 0x14]
	lsls r0, 24
	lsls r3, 16
	lsrs r3, 16
	adds r7, r3, 0
	lsls r1, 16
	lsrs r6, r1, 16
	mov r12, r6
	ldr r1, _08063AD0 @ =gUnknown_83A64C8
	lsrs r0, 22
	adds r5, r0, r1
	movs r0, 0
	ldrsh r1, [r5, r0]
	cmp r1, 0
	ble _08063A98
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r4]
	adds r0, r3
	strh r0, [r4]
_08063A98:
	cmp r1, 0
	bge _08063AA6
	ldrh r1, [r4]
	lsls r0, r7, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r4]
_08063AA6:
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	cmp r1, 0
	ble _08063AB8
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r3, [r2]
	adds r0, r3
	strh r0, [r2]
_08063AB8:
	cmp r1, 0
	bge _08063AC8
	ldrh r1, [r2]
	mov r3, r12
	lsls r0, r3, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r2]
_08063AC8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063AD0: .4byte gUnknown_83A64C8
	thumb_func_end sub_8063A6C

	thumb_func_start sub_8063AD4
sub_8063AD4: @ 8063AD4
	push {r4,r5,lr}
	ldr r5, _08063B10 @ =gSaveBlock1Ptr
	ldr r4, [r5]
	ldrh r4, [r4]
	lsls r0, 16
	asrs r0, 16
	subs r0, r4
	lsls r0, 4
	strh r0, [r2]
	ldr r0, [r5]
	ldrh r0, [r0, 0x2]
	lsls r1, 16
	asrs r1, 16
	subs r1, r0
	lsls r1, 4
	strh r1, [r3]
	ldr r1, _08063B14 @ =gUnknown_300506C
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2]
	ldr r1, _08063B18 @ =gUnknown_3005068
	ldrh r0, [r3]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063B10: .4byte gSaveBlock1Ptr
_08063B14: .4byte gUnknown_300506C
_08063B18: .4byte gUnknown_3005068
	thumb_func_end sub_8063AD4

	thumb_func_start sub_8063B1C
sub_8063B1C: @ 8063B1C
	push {r4-r7,lr}
	adds r7, r2, 0
	mov r12, r3
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _08063BB0 @ =gUnknown_300506C
	ldrh r0, [r0]
	negs r0, r0
	ldr r1, _08063BB4 @ =gUnknown_3005050
	ldr r2, [r1, 0x10]
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08063BB8 @ =gUnknown_3005068
	ldrh r0, [r0]
	negs r0, r0
	ldr r1, [r1, 0x14]
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r2, 0
	ble _08063B56
	lsls r0, r3, 16
	movs r3, 0x80
	lsls r3, 13
	adds r0, r3
	lsrs r3, r0, 16
_08063B56:
	cmp r2, 0
	bge _08063B62
	lsls r0, r3, 16
	ldr r2, _08063BBC @ =0xfff00000
	adds r0, r2
	lsrs r3, r0, 16
_08063B62:
	cmp r1, 0
	ble _08063B70
	lsls r0, r4, 16
	movs r2, 0x80
	lsls r2, 13
	adds r0, r2
	lsrs r4, r0, 16
_08063B70:
	cmp r1, 0
	bge _08063B7C
	lsls r0, r4, 16
	ldr r1, _08063BBC @ =0xfff00000
	adds r0, r1
	lsrs r4, r0, 16
_08063B7C:
	ldr r2, _08063BC0 @ =gSaveBlock1Ptr
	ldr r0, [r2]
	ldrh r1, [r0]
	lsls r0, r5, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	lsls r1, r3, 16
	asrs r1, 16
	adds r1, r0
	strh r1, [r7]
	ldr r0, [r2]
	ldrh r1, [r0, 0x2]
	lsls r0, r6, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	lsls r1, r4, 16
	asrs r1, 16
	adds r1, r0
	mov r2, r12
	strh r1, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063BB0: .4byte gUnknown_300506C
_08063BB4: .4byte gUnknown_3005050
_08063BB8: .4byte gUnknown_3005068
_08063BBC: .4byte 0xfff00000
_08063BC0: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8063B1C

	thumb_func_start sub_8063BC4
sub_8063BC4: @ 8063BC4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	mov r8, r1
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r1, 0
	ldrsh r0, [r6, r1]
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	adds r2, r6, 0
	mov r3, r8
	bl sub_8063B1C
	lsls r4, 16
	asrs r4, 16
	ldrh r0, [r6]
	adds r4, r0
	strh r4, [r6]
	lsls r5, 16
	asrs r5, 16
	mov r1, r8
	ldrh r1, [r1]
	adds r5, r1
	mov r2, r8
	strh r5, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8063BC4

	thumb_func_start GetFieldObjectMovingCameraOffset
GetFieldObjectMovingCameraOffset: @ 8063C10
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2]
	strh r0, [r1]
	ldr r3, _08063C4C @ =gUnknown_3005050
	ldr r0, [r3, 0x10]
	cmp r0, 0
	ble _08063C26
	movs r0, 0x1
	strh r0, [r2]
_08063C26:
	ldr r0, [r3, 0x10]
	cmp r0, 0
	bge _08063C32
	ldrh r0, [r2]
	subs r0, 0x1
	strh r0, [r2]
_08063C32:
	ldr r2, [r3, 0x14]
	cmp r2, 0
	ble _08063C3E
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08063C3E:
	cmp r2, 0
	bge _08063C48
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_08063C48:
	pop {r0}
	bx r0
	.align 2, 0
_08063C4C: .4byte gUnknown_3005050
	thumb_func_end GetFieldObjectMovingCameraOffset

	thumb_func_start FieldObjectMoveDestCoords
FieldObjectMoveDestCoords: @ 8063C50
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	ldrh r4, [r0, 0x10]
	strh r4, [r2]
	ldrh r0, [r0, 0x12]
	strh r0, [r3]
	adds r0, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	bl MoveCoords
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectMoveDestCoords

	thumb_func_start FieldObjectIsMovementOverridden
FieldObjectIsMovementOverridden: @ 8063C70
	push {lr}
	ldrb r1, [r0]
	movs r0, 0x42
	ands r0, r1
	cmp r0, 0
	bne _08063C80
	movs r0, 0
	b _08063C82
_08063C80:
	movs r0, 0x1
_08063C82:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsMovementOverridden

	thumb_func_start FieldObjectIsSpecialAnimActive
FieldObjectIsSpecialAnimActive: @ 8063C88
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _08063C9E
	ldrb r0, [r1, 0x1C]
	cmp r0, 0xFF
	beq _08063C9E
	movs r0, 0x1
	b _08063CA0
_08063C9E:
	movs r0, 0
_08063CA0:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsSpecialAnimActive

	thumb_func_start FieldObjectSetHeldMovement
FieldObjectSetHeldMovement: @ 8063CA4
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl sub_8112CAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08063CC8
	adds r0, r4, 0
	bl FieldObjectIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _08063CCE
	movs r0, 0x1
	b _08063CF4
_08063CC8:
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
_08063CCE:
	adds r0, r4, 0
	bl npc_sync_anim_pause_bits
	movs r3, 0
	strb r5, [r4, 0x1C]
	ldrb r0, [r4]
	movs r1, 0x40
	orrs r0, r1
	movs r1, 0x7F
	ands r0, r1
	strb r0, [r4]
	ldr r2, _08063CFC @ =gSprites
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x32]
	movs r0, 0
_08063CF4:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08063CFC: .4byte gSprites
	thumb_func_end FieldObjectSetHeldMovement

	thumb_func_start FieldObjectForceSetSpecialAnim
FieldObjectForceSetSpecialAnim: @ 8063D00
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	bl FieldObjectClearAnimIfSpecialAnimActive
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetHeldMovement
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectForceSetSpecialAnim

	thumb_func_start FieldObjectClearAnimIfSpecialAnimActive
FieldObjectClearAnimIfSpecialAnimActive: @ 8063D1C
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _08063D2E
	adds r0, r1, 0
	bl FieldObjectClearAnim
_08063D2E:
	pop {r0}
	bx r0
	thumb_func_end FieldObjectClearAnimIfSpecialAnimActive

	thumb_func_start FieldObjectClearAnim
FieldObjectClearAnim: @ 8063D34
	movs r1, 0xFF
	strb r1, [r0, 0x1C]
	ldrb r2, [r0]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	movs r2, 0x7F
	ands r1, r2
	strb r1, [r0]
	ldr r3, _08063D64 @ =gSprites
	ldrb r2, [r0, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	movs r2, 0
	strh r2, [r1, 0x30]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x32]
	bx lr
	.align 2, 0
_08063D64: .4byte gSprites
	thumb_func_end FieldObjectClearAnim

	thumb_func_start FieldObjectCheckHeldMovementStatus
FieldObjectCheckHeldMovementStatus: @ 8063D68
	push {lr}
	ldrb r1, [r0]
	lsls r0, r1, 25
	cmp r0, 0
	blt _08063D76
	movs r0, 0x10
	b _08063D78
_08063D76:
	lsrs r0, r1, 7
_08063D78:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectCheckHeldMovementStatus

	thumb_func_start FieldObjectClearHeldMovementIfFinished
FieldObjectClearHeldMovementIfFinished: @ 8063D7C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl FieldObjectCheckHeldMovementStatus
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08063D96
	cmp r4, 0x10
	beq _08063D96
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
_08063D96:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectClearHeldMovementIfFinished

	thumb_func_start FieldObjectGetSpecialAnim
FieldObjectGetSpecialAnim: @ 8063DA0
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08063DB0
	movs r0, 0xFF
	b _08063DB2
_08063DB0:
	ldrb r0, [r1, 0x1C]
_08063DB2:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectGetSpecialAnim

	thumb_func_start FieldObjectStep
FieldObjectStep: @ 8063DB8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl DoGroundEffects_OnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80679C8
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08063DE2
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectExecSpecialAnim
	b _08063DF8
_08063DE2:
	ldrb r0, [r4, 0x1]
	lsls r0, 31
	cmp r0, 0
	bne _08063DF8
_08063DEA:
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r6
	lsls r0, 24
	cmp r0, 0
	bne _08063DEA
_08063DF8:
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnFinishStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_obj_transfer_image_anim_pause_flag
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80679F8
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectUpdateSubpriority
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectStep

	thumb_func_start sub_8063E28
sub_8063E28: @ 8063E28
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl DoGroundEffects_OnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80679C8
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08063E5C
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08063E5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064544
_08063E5C:
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsIce_2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08063E78
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsUnknownMovement48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08063E80
_08063E78:
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	orrs r0, r1
	b _08063E88
_08063E80:
	ldrb r1, [r4, 0x1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_08063E88:
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnFinishStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_obj_transfer_image_anim_pause_flag
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80679F8
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectUpdateSubpriority
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8063E28

	thumb_func_start sub_8063EB8
sub_8063EB8: @ 8063EB8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08063EE0 @ =gUnknown_83A64EC
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08063ED0
	movs r4, 0
_08063ED0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063EE0: .4byte gUnknown_83A64EC
	thumb_func_end sub_8063EB8

	thumb_func_start sub_8063EE4
sub_8063EE4: @ 8063EE4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08063F0C @ =gUnknown_83A64F1
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08063EFC
	movs r4, 0
_08063EFC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063F0C: .4byte gUnknown_83A64F1
	thumb_func_end sub_8063EE4

	thumb_func_start sub_8063F10
sub_8063F10: @ 8063F10
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _08063F1C
	movs r1, 0
_08063F1C:
	ldr r0, _08063F28 @ =gUnknown_83A64F6
	adds r0, r1, r0
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08063F28: .4byte gUnknown_83A64F6
	thumb_func_end sub_8063F10

	thumb_func_start sub_8063F2C
sub_8063F2C: @ 8063F2C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08063F54 @ =gUnknown_83A64FB
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08063F44
	movs r4, 0
_08063F44:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063F54: .4byte gUnknown_83A64FB
	thumb_func_end sub_8063F2C

	thumb_func_start sub_8063F58
sub_8063F58: @ 8063F58
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08063F80 @ =gUnknown_83A6500
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08063F70
	movs r4, 0
_08063F70:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063F80: .4byte gUnknown_83A6500
	thumb_func_end sub_8063F58

	thumb_func_start sub_8063F84
sub_8063F84: @ 8063F84
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08063FAC @ =gUnknown_83A6505
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08063F9C
	movs r4, 0
_08063F9C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063FAC: .4byte gUnknown_83A6505
	thumb_func_end sub_8063F84

	thumb_func_start sub_8063FB0
sub_8063FB0: @ 8063FB0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08063FD8 @ =gUnknown_83A650A
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08063FC8
	movs r4, 0
_08063FC8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08063FD8: .4byte gUnknown_83A650A
	thumb_func_end sub_8063FB0

	thumb_func_start sub_8063FDC
sub_8063FDC: @ 8063FDC
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064004 @ =gUnknown_83A650F
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08063FF4
	movs r4, 0
_08063FF4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064004: .4byte gUnknown_83A650F
	thumb_func_end sub_8063FDC

	thumb_func_start sub_8064008
sub_8064008: @ 8064008
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064030 @ =gUnknown_83A6514
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064020
	movs r4, 0
_08064020:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064030: .4byte gUnknown_83A6514
	thumb_func_end sub_8064008

	thumb_func_start sub_8064034
sub_8064034: @ 8064034
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806405C @ =gUnknown_83A6519
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806404C
	movs r4, 0
_0806404C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806405C: .4byte gUnknown_83A6519
	thumb_func_end sub_8064034

	thumb_func_start sub_8064060
sub_8064060: @ 8064060
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064088 @ =gUnknown_83A651E
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064078
	movs r4, 0
_08064078:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064088: .4byte gUnknown_83A651E
	thumb_func_end sub_8064060

	thumb_func_start sub_806408C
sub_806408C: @ 806408C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080640B4 @ =gUnknown_83A6523
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080640A4
	movs r4, 0
_080640A4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080640B4: .4byte gUnknown_83A6523
	thumb_func_end sub_806408C

	thumb_func_start sub_80640B8
sub_80640B8: @ 80640B8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080640E0 @ =gUnknown_83A6528
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080640D0
	movs r4, 0
_080640D0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080640E0: .4byte gUnknown_83A6528
	thumb_func_end sub_80640B8

	thumb_func_start sub_80640E4
sub_80640E4: @ 80640E4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806410C @ =gUnknown_83A652D
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080640FC
	movs r4, 0
_080640FC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806410C: .4byte gUnknown_83A652D
	thumb_func_end sub_80640E4

	thumb_func_start GetJumpLedgeAnimId
GetJumpLedgeAnimId: @ 8064110
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064138 @ =gUnknown_83A6532
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064128
	movs r4, 0
_08064128:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064138: .4byte gUnknown_83A6532
	thumb_func_end GetJumpLedgeAnimId

	thumb_func_start sub_806413C
sub_806413C: @ 806413C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064164 @ =gUnknown_83A6537
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064154
	movs r4, 0
_08064154:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064164: .4byte gUnknown_83A6537
	thumb_func_end sub_806413C

	thumb_func_start sub_8064168
sub_8064168: @ 8064168
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064190 @ =gUnknown_83A653C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064180
	movs r4, 0
_08064180:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064190: .4byte gUnknown_83A653C
	thumb_func_end sub_8064168

	thumb_func_start sub_8064194
sub_8064194: @ 8064194
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080641BC @ =gUnknown_83A6541
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080641AC
	movs r4, 0
_080641AC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080641BC: .4byte gUnknown_83A6541
	thumb_func_end sub_8064194

	thumb_func_start sub_80641C0
sub_80641C0: @ 80641C0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080641E8 @ =gUnknown_83A6546
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080641D8
	movs r4, 0
_080641D8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080641E8: .4byte gUnknown_83A6546
	thumb_func_end sub_80641C0

	thumb_func_start sub_80641EC
sub_80641EC: @ 80641EC
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064214 @ =gUnknown_83A654B
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064204
	movs r4, 0
_08064204:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064214: .4byte gUnknown_83A654B
	thumb_func_end sub_80641EC

	thumb_func_start GetStepInPlaceDelay32AnimId
GetStepInPlaceDelay32AnimId: @ 8064218
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064240 @ =gUnknown_83A6550
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064230
	movs r4, 0
_08064230:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064240: .4byte gUnknown_83A6550
	thumb_func_end GetStepInPlaceDelay32AnimId

	thumb_func_start GetStepInPlaceDelay16AnimId
GetStepInPlaceDelay16AnimId: @ 8064244
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806426C @ =gUnknown_83A6555
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806425C
	movs r4, 0
_0806425C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806426C: .4byte gUnknown_83A6555
	thumb_func_end GetStepInPlaceDelay16AnimId

	thumb_func_start sub_8064270
sub_8064270: @ 8064270
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064298 @ =gUnknown_83A655A
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064288
	movs r4, 0
_08064288:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064298: .4byte gUnknown_83A655A
	thumb_func_end sub_8064270

	thumb_func_start GetStepInPlaceDelay4AnimId
GetStepInPlaceDelay4AnimId: @ 806429C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080642C4 @ =gUnknown_83A655F
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080642B4
	movs r4, 0
_080642B4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080642C4: .4byte gUnknown_83A655F
	thumb_func_end GetStepInPlaceDelay4AnimId

	thumb_func_start FieldObjectFaceOppositeDirection
FieldObjectFaceOppositeDirection: @ 80642C8
	push {r4,lr}
	adds r4, r0, 0
	lsls r0, r1, 24
	lsrs r0, 24
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063EB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetHeldMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectFaceOppositeDirection

	thumb_func_start sub_80642F4
sub_80642F4: @ 80642F4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806431C @ =gUnknown_83A6564
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806430C
	movs r4, 0
_0806430C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806431C: .4byte gUnknown_83A6564
	thumb_func_end sub_80642F4

	thumb_func_start sub_8064320
sub_8064320: @ 8064320
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064348 @ =gUnknown_83A6569
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064338
	movs r4, 0
_08064338:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064348: .4byte gUnknown_83A6569
	thumb_func_end sub_8064320

	thumb_func_start sub_806434C
sub_806434C: @ 806434C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064374 @ =gUnknown_83A656E
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064364
	movs r4, 0
_08064364:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064374: .4byte gUnknown_83A656E
	thumb_func_end sub_806434C

	thumb_func_start sub_8064378
sub_8064378: @ 8064378
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080643A0 @ =gUnknown_83A6573
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064390
	movs r4, 0
_08064390:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080643A0: .4byte gUnknown_83A6573
	thumb_func_end sub_8064378

	thumb_func_start sub_80643A4
sub_80643A4: @ 80643A4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080643CC @ =gUnknown_83A6578
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080643BC
	movs r4, 0
_080643BC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080643CC: .4byte gUnknown_83A6578
	thumb_func_end sub_80643A4

	thumb_func_start sub_80643D0
sub_80643D0: @ 80643D0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080643F8 @ =gUnknown_83A657D
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080643E8
	movs r4, 0
_080643E8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080643F8: .4byte gUnknown_83A657D
	thumb_func_end sub_80643D0

	thumb_func_start sub_80643FC
sub_80643FC: @ 80643FC
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064424 @ =gUnknown_83A6582
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064414
	movs r4, 0
_08064414:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064424: .4byte gUnknown_83A6582
	thumb_func_end sub_80643FC

	thumb_func_start sub_8064428
sub_8064428: @ 8064428
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08064450 @ =gUnknown_83A6587
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08064440
	movs r4, 0
_08064440:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064450: .4byte gUnknown_83A6587
	thumb_func_end sub_8064428

	thumb_func_start sub_8064454
sub_8064454: @ 8064454
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806447C @ =gUnknown_83A658C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806446C
	movs r4, 0
_0806446C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806447C: .4byte gUnknown_83A658C
	thumb_func_end sub_8064454

	thumb_func_start GetOppositeDirection
GetOppositeDirection: @ 8064480
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080644A4 @ =gUnknown_83A6591
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	subs r1, r4, 0x1
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bhi _080644A8
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	b _080644AA
	.align 2, 0
_080644A4: .4byte gUnknown_83A6591
_080644A8:
	adds r0, r4, 0
_080644AA:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetOppositeDirection

	thumb_func_start zffu_offset_calc
zffu_offset_calc: @ 80644B4
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080644C8 @ =gUnknown_83A6599
	lsrs r0, 22
	subs r0, 0x5
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080644C8: .4byte gUnknown_83A6599
	thumb_func_end zffu_offset_calc

	thumb_func_start state_to_direction
state_to_direction: @ 80644CC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	beq _080644EC
	cmp r2, 0
	beq _080644EC
	cmp r1, 0x4
	bhi _080644EC
	cmp r2, 0x4
	bls _080644F0
_080644EC:
	movs r0, 0
	b _08064502
_080644F0:
	adds r1, r2, 0
	bl zffu_offset_calc
	ldr r2, _08064508 @ =gUnknown_83A65A9
	lsls r1, r4, 2
	subs r1, 0x5
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
_08064502:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064508: .4byte gUnknown_83A65A9
	thumb_func_end state_to_direction

	thumb_func_start FieldObjectExecSpecialAnim
FieldObjectExecSpecialAnim: @ 806450C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08064540 @ =gUnknown_83A65BC
	ldrb r0, [r4, 0x1C]
	lsls r0, 2
	adds r0, r2
	movs r3, 0x32
	ldrsh r2, [r1, r3]
	ldr r0, [r0]
	lsls r2, 2
	adds r2, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	beq _08064538
	ldrb r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_08064538:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064540: .4byte gUnknown_83A65BC
	thumb_func_end FieldObjectExecSpecialAnim

	thumb_func_start sub_8064544
sub_8064544: @ 8064544
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08064584 @ =gUnknown_83A65BC
	ldrb r0, [r4, 0x1C]
	lsls r0, 2
	adds r0, r2
	movs r3, 0x32
	ldrsh r2, [r1, r3]
	ldr r0, [r0]
	lsls r2, 2
	adds r2, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	beq _0806457C
	ldrb r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r4, 0x5]
	cmp r0, 0x61
	bne _0806457C
	adds r0, r4, 0
	bl sub_806DE28
_0806457C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064584: .4byte gUnknown_83A65BC
	thumb_func_end sub_8064544

	thumb_func_start sub_8064588
sub_8064588: @ 8064588
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080645B4 @ =gUnknown_83A65BC
	ldrb r0, [r4, 0x1C]
	lsls r0, 2
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _080645B8
	movs r0, 0
	b _080645C2
	.align 2, 0
_080645B4: .4byte gUnknown_83A65BC
_080645B8:
	movs r0, 0xFF
	strb r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080645C2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064588

	thumb_func_start sub_80645C8
sub_80645C8: @ 80645C8
	push {r4,lr}
	adds r3, r0, 0
	lsls r2, 24
	lsrs r4, r2, 24
	movs r0, 0
	strb r4, [r3, 0x1C]
	strh r0, [r1, 0x32]
	ldr r0, _080645F0 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080645EA
	ldrb r0, [r3, 0x8]
	ldrb r1, [r3, 0x9]
	ldrb r2, [r3, 0xA]
	adds r3, r4, 0
	bl sub_81124EC
_080645EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080645F0: .4byte gUnknown_3005E88
	thumb_func_end sub_80645C8

	thumb_func_start an_look_any
an_look_any: @ 80645F4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r1, r2, 24
	lsrs r1, 24
	bl FieldObjectSetDirection
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl obj_npc_animation_step
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end an_look_any

	thumb_func_start sub_8064638
sub_8064638: @ 8064638
	push {lr}
	movs r2, 0x1
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8064638

	thumb_func_start sub_8064648
sub_8064648: @ 8064648
	push {lr}
	movs r2, 0x2
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8064648

	thumb_func_start sub_8064658
sub_8064658: @ 8064658
	push {lr}
	movs r2, 0x3
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8064658

	thumb_func_start sub_8064668
sub_8064668: @ 8064668
	push {lr}
	movs r2, 0x4
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8064668

	thumb_func_start sub_8064678
sub_8064678: @ 8064678
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	mov r9, r1
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	ldrh r1, [r0, 0x10]
	mov r0, sp
	strh r1, [r0]
	mov r1, r8
	ldrh r0, [r1, 0x12]
	mov r5, sp
	adds r5, 0x2
	strh r0, [r5]
	mov r0, r8
	adds r1, r4, 0
	bl FieldObjectSetDirection
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	mov r0, r8
	bl npc_coords_shift
	mov r0, r9
	adds r1, r4, 0
	adds r2, r6, 0
	bl oamt_npc_ministep_reset
	mov r2, r9
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x4
	orrs r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, 0x1
	mov r1, r9
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8064678

	thumb_func_start do_go_anim
do_go_anim: @ 80646FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r5, r0, 0
	mov r8, r1
	adds r4, r3, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r4, 24
	lsrs r4, 24
	mov r1, sp
	ldr r0, _08064754 @ =gUnknown_83A6884
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6}
	stm r1!, {r3,r6}
	adds r0, r5, 0
	mov r1, r8
	adds r3, r4, 0
	bl sub_8064678
	lsls r4, 2
	mov r7, sp
	adds r1, r7, r4
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	ldr r1, [r1]
	bl _call_via_r1
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	mov r1, r8
	bl npc_apply_anim_looping
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064754: .4byte gUnknown_83A6884
	thumb_func_end do_go_anim

	thumb_func_start do_run_anim
do_run_anim: @ 8064758
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0x1
	bl sub_8064678
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_run_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_apply_anim_looping
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end do_run_anim

	thumb_func_start npc_obj_ministep_stop_on_arrival
npc_obj_ministep_stop_on_arrival: @ 8064788
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl obj_npc_ministep
	lsls r0, 24
	cmp r0, 0
	bne _0806479E
	movs r0, 0
	b _080647BA
_0806479E:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_080647BA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end npc_obj_ministep_stop_on_arrival

	thumb_func_start sub_80647C0
sub_80647C0: @ 80647C0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	mov r8, r1
	lsls r5, r2, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	bl npc_coords_shift
	mov r0, r8
	adds r1, r5, 0
	bl sub_8068BBC
	mov r2, r8
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x1
	mov r1, r8
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80647C0

	thumb_func_start sub_8064830
sub_8064830: @ 8064830
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	bl sub_80647C0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_apply_anim_looping
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8064830

	thumb_func_start an_walk_any_2
an_walk_any_2: @ 806485C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8068BCC
	lsls r0, 24
	cmp r0, 0
	bne _08064872
	movs r0, 0
	b _0806488E
_08064872:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_0806488E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end an_walk_any_2

	thumb_func_start sub_8064894
sub_8064894: @ 8064894
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	mov r8, r1
	lsls r5, r2, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	bl npc_coords_shift
	mov r0, r8
	adds r1, r5, 0
	bl sub_8068C58
	mov r2, r8
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x1
	mov r1, r8
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8064894

	thumb_func_start sub_8064904
sub_8064904: @ 8064904
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	bl sub_8064894
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_apply_anim_looping
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8064904

	thumb_func_start sub_8064930
sub_8064930: @ 8064930
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8068C68
	lsls r0, 24
	cmp r0, 0
	bne _08064946
	movs r0, 0
	b _08064962
_08064946:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08064962:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064930

	thumb_func_start sub_8064968
sub_8064968: @ 8064968
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8064904
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064988
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064968

	thumb_func_start sub_8064988
sub_8064988: @ 8064988
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064930
	lsls r0, 24
	cmp r0, 0
	bne _0806499A
	movs r0, 0
	b _080649A0
_0806499A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080649A0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064988

	thumb_func_start sub_80649A8
sub_80649A8: @ 80649A8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8064904
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80649C8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80649A8

	thumb_func_start sub_80649C8
sub_80649C8: @ 80649C8
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064930
	lsls r0, 24
	cmp r0, 0
	bne _080649DA
	movs r0, 0
	b _080649E0
_080649DA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080649E0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80649C8

	thumb_func_start sub_80649E8
sub_80649E8: @ 80649E8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8064904
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064A08
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80649E8

	thumb_func_start sub_8064A08
sub_8064A08: @ 8064A08
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064930
	lsls r0, 24
	cmp r0, 0
	bne _08064A1A
	movs r0, 0
	b _08064A20
_08064A1A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064A20:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064A08

	thumb_func_start sub_8064A28
sub_8064A28: @ 8064A28
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8064904
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064A48
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064A28

	thumb_func_start sub_8064A48
sub_8064A48: @ 8064A48
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064930
	lsls r0, 24
	cmp r0, 0
	bne _08064A5A
	movs r0, 0
	b _08064A60
_08064A5A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064A60:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064A48

	thumb_func_start sub_8064A68
sub_8064A68: @ 8064A68
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8064830
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064A88
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064A68

	thumb_func_start sub_8064A88
sub_8064A88: @ 8064A88
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08064A9A
	movs r0, 0
	b _08064AA0
_08064A9A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064AA0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064A88

	thumb_func_start sub_8064AA8
sub_8064AA8: @ 8064AA8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8064830
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064AC8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064AA8

	thumb_func_start sub_8064AC8
sub_8064AC8: @ 8064AC8
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08064ADA
	movs r0, 0
	b _08064AE0
_08064ADA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064AE0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064AC8

	thumb_func_start sub_8064AE8
sub_8064AE8: @ 8064AE8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8064830
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064B08
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064AE8

	thumb_func_start sub_8064B08
sub_8064B08: @ 8064B08
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08064B1A
	movs r0, 0
	b _08064B20
_08064B1A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064B20:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064B08

	thumb_func_start sub_8064B28
sub_8064B28: @ 8064B28
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8064830
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064B48
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064B28

	thumb_func_start sub_8064B48
sub_8064B48: @ 8064B48
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08064B5A
	movs r0, 0
	b _08064B60
_08064B5A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064B60:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064B48

	thumb_func_start sub_8064B68
sub_8064B68: @ 8064B68
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	mov r8, r1
	lsls r5, r2, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	bl npc_coords_shift
	mov r0, r8
	adds r1, r5, 0
	bl sub_8068C08
	mov r2, r8
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x1
	mov r1, r8
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8064B68

	thumb_func_start sub_8064BD8
sub_8064BD8: @ 8064BD8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	bl sub_8064B68
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_apply_anim_looping
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8064BD8

	thumb_func_start sub_8064C04
sub_8064C04: @ 8064C04
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8068C18
	lsls r0, 24
	cmp r0, 0
	bne _08064C1A
	movs r0, 0
	b _08064C36
_08064C1A:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08064C36:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064C04

	thumb_func_start sub_8064C3C
sub_8064C3C: @ 8064C3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8064BD8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064C5C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064C3C

	thumb_func_start sub_8064C5C
sub_8064C5C: @ 8064C5C
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064C04
	lsls r0, 24
	cmp r0, 0
	bne _08064C6E
	movs r0, 0
	b _08064C74
_08064C6E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064C74:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064C5C

	thumb_func_start sub_8064C7C
sub_8064C7C: @ 8064C7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8064BD8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064C9C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064C7C

	thumb_func_start sub_8064C9C
sub_8064C9C: @ 8064C9C
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064C04
	lsls r0, 24
	cmp r0, 0
	bne _08064CAE
	movs r0, 0
	b _08064CB4
_08064CAE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064CB4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064C9C

	thumb_func_start sub_8064CBC
sub_8064CBC: @ 8064CBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8064BD8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064CDC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064CBC

	thumb_func_start sub_8064CDC
sub_8064CDC: @ 8064CDC
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064C04
	lsls r0, 24
	cmp r0, 0
	bne _08064CEE
	movs r0, 0
	b _08064CF4
_08064CEE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064CF4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064CDC

	thumb_func_start sub_8064CFC
sub_8064CFC: @ 8064CFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8064BD8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064D1C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064CFC

	thumb_func_start sub_8064D1C
sub_8064D1C: @ 8064D1C
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8064C04
	lsls r0, 24
	cmp r0, 0
	bne _08064D2E
	movs r0, 0
	b _08064D34
_08064D2E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064D34:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064D1C

	thumb_func_start sub_8064D3C
sub_8064D3C: @ 8064D3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064D5C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064D3C

	thumb_func_start sub_8064D5C
sub_8064D5C: @ 8064D5C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08064D6E
	movs r0, 0
	b _08064D74
_08064D6E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064D74:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064D5C

	thumb_func_start sub_8064D7C
sub_8064D7C: @ 8064D7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064D9C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064D7C

	thumb_func_start sub_8064D9C
sub_8064D9C: @ 8064D9C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08064DAE
	movs r0, 0
	b _08064DB4
_08064DAE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064DB4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064D9C

	thumb_func_start sub_8064DBC
sub_8064DBC: @ 8064DBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064DDC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064DBC

	thumb_func_start sub_8064DDC
sub_8064DDC: @ 8064DDC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08064DEE
	movs r0, 0
	b _08064DF4
_08064DEE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064DF4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064DDC

	thumb_func_start sub_8064DFC
sub_8064DFC: @ 8064DFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064E1C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8064DFC

	thumb_func_start sub_8064E1C
sub_8064E1C: @ 8064E1C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08064E2E
	movs r0, 0
	b _08064E34
_08064E2E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08064E34:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8064E1C

	thumb_func_start sub_8064E3C
sub_8064E3C: @ 8064E3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r0, 0
	mov r10, r1
	adds r4, r2, 0
	mov r8, r3
	ldr r0, [sp, 0x30]
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _08064EF4 @ =gUnknown_83A6958
	add r0, sp, 0x4
	movs r2, 0x6
	bl memcpy
	add r5, sp, 0xC
	movs r0, 0
	strh r0, [r5]
	mov r6, sp
	adds r6, 0xE
	strh r0, [r6]
	adds r0, r7, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	mov r1, r8
	lsls r0, r1, 1
	add r0, sp
	adds r0, 0x4
	movs r1, 0
	ldrsh r3, [r0, r1]
	str r3, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_8063A6C
	ldrh r1, [r5]
	ldrh r0, [r7, 0x10]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r6]
	ldrh r0, [r7, 0x12]
	adds r2, r0
	lsls r2, 16
	asrs r2, 16
	adds r0, r7, 0
	bl npc_coords_shift
	mov r0, r10
	adds r1, r4, 0
	mov r2, r8
	mov r3, r9
	bl sub_8068D1C
	movs r0, 0x1
	mov r1, r10
	strh r0, [r1, 0x32]
	movs r0, 0x2C
	add r10, r0
	mov r0, r10
	ldrb r1, [r0]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	mov r1, r10
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r7]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064EF4: .4byte gUnknown_83A6958
	thumb_func_end sub_8064E3C

	thumb_func_start maybe_shadow_1
maybe_shadow_1: @ 8064EF8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r4, 0
	bl sub_8064E3C
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_apply_anim_looping
	adds r0, r4, 0
	bl DoShadowFieldEffect
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end maybe_shadow_1

	thumb_func_start sub_8064F3C
sub_8064F3C: @ 8064F3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r6, r0, 0
	adds r7, r1, 0
	adds r4, r2, 0
	ldr r1, _08064FC8 @ =gUnknown_83A695E
	add r0, sp, 0x4
	movs r2, 0x6
	bl memcpy
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bne _08064FCC
	movs r1, 0x36
	ldrsh r0, [r7, r1]
	lsls r0, 1
	add r0, sp
	adds r0, 0x4
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _08064FCC
	add r4, sp, 0xC
	movs r0, 0
	strh r0, [r4]
	mov r5, sp
	adds r5, 0xE
	strh r0, [r5]
	ldrb r0, [r6, 0x18]
	lsrs r0, 4
	movs r2, 0x36
	ldrsh r1, [r7, r2]
	lsls r1, 1
	add r1, sp
	adds r1, 0x4
	movs r2, 0
	ldrsh r3, [r1, r2]
	str r3, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8063A6C
	ldrh r1, [r4]
	ldrh r0, [r6, 0x10]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r5]
	ldrh r0, [r6, 0x12]
	adds r2, r0
	lsls r2, 16
	asrs r2, 16
	adds r0, r6, 0
	bl npc_coords_shift
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r6]
	b _08064FF0
	.align 2, 0
_08064FC8: .4byte gUnknown_83A695E
_08064FCC:
	mov r1, r8
	cmp r1, 0xFF
	bne _08064FF0
	adds r0, r6, 0
	bl npc_coords_shift_still
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r6]
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
_08064FF0:
	mov r0, r8
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8064F3C

	thumb_func_start sub_8065000
sub_8065000: @ 8065000
	push {lr}
	ldr r2, _08065010 @ =sub_8068D3C
	bl sub_8064F3C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08065010: .4byte sub_8068D3C
	thumb_func_end sub_8065000

	thumb_func_start sub_8065014
sub_8065014: @ 8065014
	push {lr}
	ldr r2, _08065024 @ =sub_8068DC4
	bl sub_8064F3C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08065024: .4byte sub_8068DC4
	thumb_func_end sub_8065014

	thumb_func_start sub_8065028
sub_8065028: @ 8065028
	push {lr}
	bl sub_8065000
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0806503A
	movs r0, 0
	b _0806503C
_0806503A:
	movs r0, 0x1
_0806503C:
	pop {r1}
	bx r1
	thumb_func_end sub_8065028

	thumb_func_start sub_8065040
sub_8065040: @ 8065040
	push {lr}
	bl sub_8065014
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08065052
	movs r0, 0
	b _08065054
_08065052:
	movs r0, 0x1
_08065054:
	pop {r1}
	bx r1
	thumb_func_end sub_8065040

	thumb_func_start sub_8065058
sub_8065058: @ 8065058
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065000
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08065072
	cmp r0, 0xFF
	bne _0806509E
	movs r0, 0x1
	b _080650A0
_08065072:
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl obj_npc_animation_step
_0806509E:
	movs r0, 0
_080650A0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065058

	thumb_func_start sub_80650A8
sub_80650A8: @ 80650A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80650D4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80650A8

	thumb_func_start sub_80650D4
sub_80650D4: @ 80650D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _080650E8
	movs r0, 0
	b _080650F8
_080650E8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080650F8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80650D4

	thumb_func_start sub_8065100
sub_8065100: @ 8065100
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806512C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065100

	thumb_func_start sub_806512C
sub_806512C: @ 806512C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08065140
	movs r0, 0
	b _08065150
_08065140:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08065150:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806512C

	thumb_func_start sub_8065158
sub_8065158: @ 8065158
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065184
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065158

	thumb_func_start sub_8065184
sub_8065184: @ 8065184
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08065198
	movs r0, 0
	b _080651A8
_08065198:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080651A8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065184

	thumb_func_start sub_80651B0
sub_80651B0: @ 80651B0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80651DC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80651B0

	thumb_func_start sub_80651DC
sub_80651DC: @ 80651DC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _080651F0
	movs r0, 0
	b _08065200
_080651F0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08065200:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80651DC

	thumb_func_start sub_8065208
sub_8065208: @ 8065208
	movs r2, 0x1
	strh r2, [r0, 0x32]
	strh r1, [r0, 0x34]
	bx lr
	thumb_func_end sub_8065208

	thumb_func_start sub_8065210
sub_8065210: @ 8065210
	push {lr}
	ldrh r0, [r1, 0x34]
	subs r0, 0x1
	strh r0, [r1, 0x34]
	lsls r0, 16
	cmp r0, 0
	beq _08065222
	movs r0, 0
	b _08065228
_08065222:
	movs r0, 0x2
	strh r0, [r1, 0x32]
	movs r0, 0x1
_08065228:
	pop {r1}
	bx r1
	thumb_func_end sub_8065210

	thumb_func_start sub_806522C
sub_806522C: @ 806522C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8065208
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8065210
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806522C

	thumb_func_start sub_806524C
sub_806524C: @ 806524C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8065208
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8065210
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806524C

	thumb_func_start sub_806526C
sub_806526C: @ 806526C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_8065208
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8065210
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806526C

	thumb_func_start sub_806528C
sub_806528C: @ 806528C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_8065208
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8065210
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806528C

	thumb_func_start sub_80652AC
sub_80652AC: @ 80652AC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x10
	bl sub_8065208
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8065210
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80652AC

	thumb_func_start sub_80652CC
sub_80652CC: @ 80652CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80652EC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80652CC

	thumb_func_start sub_80652EC
sub_80652EC: @ 80652EC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080652FE
	movs r0, 0
	b _08065304
_080652FE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065304:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80652EC

	thumb_func_start sub_806530C
sub_806530C: @ 806530C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806532C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806530C

	thumb_func_start sub_806532C
sub_806532C: @ 806532C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806533E
	movs r0, 0
	b _08065344
_0806533E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065344:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806532C

	thumb_func_start sub_806534C
sub_806534C: @ 806534C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806536C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806534C

	thumb_func_start sub_806536C
sub_806536C: @ 806536C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806537E
	movs r0, 0
	b _08065384
_0806537E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065384:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806536C

	thumb_func_start sub_806538C
sub_806538C: @ 806538C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80653AC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806538C

	thumb_func_start sub_80653AC
sub_80653AC: @ 80653AC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080653BE
	movs r0, 0
	b _080653C4
_080653BE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080653C4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80653AC

	thumb_func_start sub_80653CC
sub_80653CC: @ 80653CC
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	bl obj_npc_ministep
	lsls r0, 24
	cmp r0, 0
	bne _080653E0
	movs r0, 0
	b _080653F0
_080653E0:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x1
_080653F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80653CC

	thumb_func_start sub_80653F8
sub_80653F8: @ 80653F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r1, [r4, 0x18]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	beq _0806541A
	movs r0, 0x1
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_0806541A:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8064678
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065438
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80653F8

	thumb_func_start sub_8065438
sub_8065438: @ 8065438
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl AnimateSprite
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80653CC
	lsls r0, 24
	cmp r0, 0
	bne _08065456
	movs r0, 0
	b _0806545C
_08065456:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_0806545C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065438

	thumb_func_start sub_8065464
sub_8065464: @ 8065464
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r1, [r4, 0x18]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x2
	beq _08065486
	movs r0, 0x2
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_08065486:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8064678
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80654A4
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065464

	thumb_func_start sub_80654A4
sub_80654A4: @ 80654A4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl AnimateSprite
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80653CC
	lsls r0, 24
	cmp r0, 0
	bne _080654C2
	movs r0, 0
	b _080654C8
_080654C2:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080654C8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80654A4

	thumb_func_start sub_80654D0
sub_80654D0: @ 80654D0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r1, [r4, 0x18]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x3
	beq _080654F2
	movs r0, 0x3
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_080654F2:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8064678
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80654D0

	thumb_func_start sub_8065510
sub_8065510: @ 8065510
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl AnimateSprite
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80653CC
	lsls r0, 24
	cmp r0, 0
	bne _0806552E
	movs r0, 0
	b _08065534
_0806552E:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08065534:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065510

	thumb_func_start sub_806553C
sub_806553C: @ 806553C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r1, [r4, 0x18]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x4
	beq _0806555E
	movs r0, 0x4
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_0806555E:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8064678
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806557C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806553C

	thumb_func_start sub_806557C
sub_806557C: @ 806557C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl AnimateSprite
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80653CC
	lsls r0, 24
	cmp r0, 0
	bne _0806559A
	movs r0, 0
	b _080655A0
_0806559A:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080655A0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806557C

	thumb_func_start sub_80655A8
sub_80655A8: @ 80655A8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r1, r2, 24
	lsrs r1, 24
	bl FieldObjectSetDirection
	adds r0, r4, 0
	bl npc_coords_shift_still
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80655A8

	thumb_func_start sub_80655D4
sub_80655D4: @ 80655D4
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r5, 0x18]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	beq _080655F6
	movs r0, 0x1
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_080655F6:
	adds r0, r4, 0
	bl AnimateSprite
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl sub_80655A8
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80655D4

	thumb_func_start sub_8065610
sub_8065610: @ 8065610
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r5, 0x18]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x2
	beq _08065632
	movs r0, 0x2
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_08065632:
	adds r0, r4, 0
	bl AnimateSprite
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x2
	bl sub_80655A8
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065610

	thumb_func_start sub_806564C
sub_806564C: @ 806564C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r5, 0x18]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x3
	beq _0806566E
	movs r0, 0x3
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0806566E:
	adds r0, r4, 0
	bl AnimateSprite
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x3
	bl sub_80655A8
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806564C

	thumb_func_start sub_8065688
sub_8065688: @ 8065688
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r5, 0x18]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x4
	beq _080656AA
	movs r0, 0x4
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_080656AA:
	adds r0, r4, 0
	bl AnimateSprite
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x4
	bl sub_80655A8
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065688

	thumb_func_start sub_80656C4
sub_80656C4: @ 80656C4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, 0
	adds r1, r2, 0
	adds r4, r3, 0
	ldr r5, [sp, 0x14]
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	bl FieldObjectSetDirection
	mov r0, r8
	adds r1, r6, 0
	adds r2, r4, 0
	bl npc_apply_anim_looping
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r6, 0x32]
	strh r5, [r6, 0x34]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80656C4

	thumb_func_start sub_806570C
sub_806570C: @ 806570C
	push {lr}
	ldrh r0, [r1, 0x34]
	subs r0, 0x1
	strh r0, [r1, 0x34]
	lsls r0, 16
	cmp r0, 0
	beq _0806571E
	movs r0, 0
	b _08065730
_0806571E:
	movs r0, 0x2
	strh r0, [r1, 0x32]
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08065730:
	pop {r1}
	bx r1
	thumb_func_end sub_806570C

	thumb_func_start sub_8065734
sub_8065734: @ 8065734
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrh r1, [r4, 0x34]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806575E
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0806575E:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065734

	thumb_func_start sub_8065770
sub_8065770: @ 8065770
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065734
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065770

	thumb_func_start sub_80657A8
sub_80657A8: @ 80657A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065734
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80657A8

	thumb_func_start sub_80657E0
sub_80657E0: @ 80657E0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065734
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80657E0

	thumb_func_start sub_8065818
sub_8065818: @ 8065818
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065734
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065818

	thumb_func_start sub_8065850
sub_8065850: @ 8065850
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065850

	thumb_func_start sub_8065888
sub_8065888: @ 8065888
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065888

	thumb_func_start sub_80658C0
sub_80658C0: @ 80658C0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80658C0

	thumb_func_start sub_80658F8
sub_80658F8: @ 80658F8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80658F8

	thumb_func_start sub_8065930
sub_8065930: @ 8065930
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065930

	thumb_func_start sub_8065968
sub_8065968: @ 8065968
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065968

	thumb_func_start sub_80659A0
sub_80659A0: @ 80659A0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80659A0

	thumb_func_start sub_80659D8
sub_80659D8: @ 80659D8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80659D8

	thumb_func_start sub_8065A10
sub_8065A10: @ 8065A10
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065A10

	thumb_func_start sub_8065A48
sub_8065A48: @ 8065A48
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065A48

	thumb_func_start sub_8065A80
sub_8065A80: @ 8065A80
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065A80

	thumb_func_start sub_8065AB8
sub_8065AB8: @ 8065AB8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065AB8

	thumb_func_start sub_8065AF0
sub_8065AF0: @ 8065AF0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065B10
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065AF0

	thumb_func_start sub_8065B10
sub_8065B10: @ 8065B10
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065B22
	movs r0, 0
	b _08065B28
_08065B22:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065B28:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065B10

	thumb_func_start sub_8065B30
sub_8065B30: @ 8065B30
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065B50
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065B30

	thumb_func_start sub_8065B50
sub_8065B50: @ 8065B50
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065B62
	movs r0, 0
	b _08065B68
_08065B62:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065B68:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065B50

	thumb_func_start sub_8065B70
sub_8065B70: @ 8065B70
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065B90
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065B70

	thumb_func_start sub_8065B90
sub_8065B90: @ 8065B90
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065BA2
	movs r0, 0
	b _08065BA8
_08065BA2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065BA8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065B90

	thumb_func_start sub_8065BB0
sub_8065BB0: @ 8065BB0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065BD0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065BB0

	thumb_func_start sub_8065BD0
sub_8065BD0: @ 8065BD0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065BE2
	movs r0, 0
	b _08065BE8
_08065BE2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065BE8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065BD0

	thumb_func_start sub_8065BF0
sub_8065BF0: @ 8065BF0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065C10
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065BF0

	thumb_func_start sub_8065C10
sub_8065C10: @ 8065C10
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065C22
	movs r0, 0
	b _08065C28
_08065C22:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065C28:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065C10

	thumb_func_start sub_8065C30
sub_8065C30: @ 8065C30
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065C50
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065C30

	thumb_func_start sub_8065C50
sub_8065C50: @ 8065C50
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065C62
	movs r0, 0
	b _08065C68
_08065C62:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065C68:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065C50

	thumb_func_start sub_8065C70
sub_8065C70: @ 8065C70
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065C90
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065C70

	thumb_func_start sub_8065C90
sub_8065C90: @ 8065C90
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065CA2
	movs r0, 0
	b _08065CA8
_08065CA2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065CA8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065C90

	thumb_func_start sub_8065CB0
sub_8065CB0: @ 8065CB0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065CD0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065CB0

	thumb_func_start sub_8065CD0
sub_8065CD0: @ 8065CD0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065CE2
	movs r0, 0
	b _08065CE8
_08065CE2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065CE8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065CD0

	thumb_func_start sub_8065CF0
sub_8065CF0: @ 8065CF0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065D10
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065CF0

	thumb_func_start sub_8065D10
sub_8065D10: @ 8065D10
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065D22
	movs r0, 0
	b _08065D28
_08065D22:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065D28:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065D10

	thumb_func_start sub_8065D30
sub_8065D30: @ 8065D30
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065D50
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065D30

	thumb_func_start sub_8065D50
sub_8065D50: @ 8065D50
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065D62
	movs r0, 0
	b _08065D68
_08065D62:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065D68:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065D50

	thumb_func_start sub_8065D70
sub_8065D70: @ 8065D70
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065D90
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065D70

	thumb_func_start sub_8065D90
sub_8065D90: @ 8065D90
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065DA2
	movs r0, 0
	b _08065DA8
_08065DA2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065DA8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065D90

	thumb_func_start sub_8065DB0
sub_8065DB0: @ 8065DB0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065DD0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065DB0

	thumb_func_start sub_8065DD0
sub_8065DD0: @ 8065DD0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065DE2
	movs r0, 0
	b _08065DE8
_08065DE2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065DE8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065DD0

	thumb_func_start do_run_south_anim
do_run_south_anim: @ 8065DF0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065E10
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_south_anim

	thumb_func_start sub_8065E10
sub_8065E10: @ 8065E10
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065E22
	movs r0, 0
	b _08065E28
_08065E22:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065E28:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065E10

	thumb_func_start do_run_north_anim
do_run_north_anim: @ 8065E30
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065E50
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_north_anim

	thumb_func_start sub_8065E50
sub_8065E50: @ 8065E50
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065E62
	movs r0, 0
	b _08065E68
_08065E62:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065E68:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065E50

	thumb_func_start do_run_west_anim
do_run_west_anim: @ 8065E70
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065E90
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_west_anim

	thumb_func_start sub_8065E90
sub_8065E90: @ 8065E90
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065EA2
	movs r0, 0
	b _08065EA8
_08065EA2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065EA8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065E90

	thumb_func_start do_run_east_anim
do_run_east_anim: @ 8065EB0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065ED0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_east_anim

	thumb_func_start sub_8065ED0
sub_8065ED0: @ 8065ED0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08065EE2
	movs r0, 0
	b _08065EE8
_08065EE2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065EE8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065ED0

	thumb_func_start sub_8065EF0
sub_8065EF0: @ 8065EF0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	mov r8, r1
	lsls r5, r2, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	bl npc_coords_shift
	mov r0, r8
	adds r1, r5, 0
	bl sub_8068CA4
	mov r2, r8
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x1
	mov r1, r8
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8065EF0

	thumb_func_start sub_8065F60
sub_8065F60: @ 8065F60
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	bl sub_8065EF0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_run_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_apply_anim_looping
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8065F60

	thumb_func_start sub_8065F8C
sub_8065F8C: @ 8065F8C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8068CB4
	lsls r0, 24
	cmp r0, 0
	bne _08065FA2
	movs r0, 0
	b _08065FBE
_08065FA2:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08065FBE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065F8C

	thumb_func_start sub_8065FC4
sub_8065FC4: @ 8065FC4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8065F60
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8065FE4
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065FC4

	thumb_func_start sub_8065FE4
sub_8065FE4: @ 8065FE4
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8065F8C
	lsls r0, 24
	cmp r0, 0
	bne _08065FF6
	movs r0, 0
	b _08065FFC
_08065FF6:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08065FFC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8065FE4

	thumb_func_start sub_8066004
sub_8066004: @ 8066004
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8065F60
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066024
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066004

	thumb_func_start sub_8066024
sub_8066024: @ 8066024
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8065F8C
	lsls r0, 24
	cmp r0, 0
	bne _08066036
	movs r0, 0
	b _0806603C
_08066036:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_0806603C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066024

	thumb_func_start sub_8066044
sub_8066044: @ 8066044
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8065F60
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066064
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066044

	thumb_func_start sub_8066064
sub_8066064: @ 8066064
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8065F8C
	lsls r0, 24
	cmp r0, 0
	bne _08066076
	movs r0, 0
	b _0806607C
_08066076:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_0806607C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066064

	thumb_func_start sub_8066084
sub_8066084: @ 8066084
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8065F60
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80660A4
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066084

	thumb_func_start sub_80660A4
sub_80660A4: @ 80660A4
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8065F8C
	lsls r0, 24
	cmp r0, 0
	bne _080660B6
	movs r0, 0
	b _080660BC
_080660B6:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080660BC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80660A4

	thumb_func_start npc_set_direction_and_anim__an_proceed
npc_set_direction_and_anim__an_proceed: @ 80660C4
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r1, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	bl obj_anim_image_set_and_seek
	adds r0, r6, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_set_direction_and_anim__an_proceed

	thumb_func_start sub_80660F0
sub_80660F0: @ 80660F0
	push {lr}
	ldrb r2, [r0, 0x18]
	lsrs r2, 4
	adds r3, r1, 0
	adds r3, 0x2A
	ldrb r3, [r3]
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80660F0

	thumb_func_start sub_8066108
sub_8066108: @ 8066108
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8068E9C
	lsls r0, 24
	cmp r0, 0
	bne _0806611C
	movs r0, 0
	b _08066122
_0806611C:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08066122:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066108

	thumb_func_start sub_8066128
sub_8066128: @ 8066128
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl sub_8064E3C
	adds r0, r4, 0
	bl sub_8063480
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8066128

	thumb_func_start sub_806615C
sub_806615C: @ 806615C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8066128
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806617C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806615C

	thumb_func_start sub_806617C
sub_806617C: @ 806617C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065040
	lsls r0, 24
	cmp r0, 0
	bne _08066190
	movs r0, 0
	b _0806619E
_08066190:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_0806619E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806617C

	thumb_func_start sub_80661A4
sub_80661A4: @ 80661A4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8066128
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80661C4
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80661A4

	thumb_func_start sub_80661C4
sub_80661C4: @ 80661C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065040
	lsls r0, 24
	cmp r0, 0
	bne _080661D8
	movs r0, 0
	b _080661E6
_080661D8:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_080661E6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80661C4

	thumb_func_start sub_80661EC
sub_80661EC: @ 80661EC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8066128
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806620C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80661EC

	thumb_func_start sub_806620C
sub_806620C: @ 806620C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065040
	lsls r0, 24
	cmp r0, 0
	bne _08066220
	movs r0, 0
	b _0806622E
_08066220:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_0806622E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806620C

	thumb_func_start sub_8066234
sub_8066234: @ 8066234
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8066128
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066254
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066234

	thumb_func_start sub_8066254
sub_8066254: @ 8066254
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065040
	lsls r0, 24
	cmp r0, 0
	bne _08066268
	movs r0, 0
	b _08066276
_08066268:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_08066276:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066254

	thumb_func_start sub_806627C
sub_806627C: @ 806627C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8066128
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806629C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806627C

	thumb_func_start sub_806629C
sub_806629C: @ 806629C
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8065040
	lsls r0, 24
	cmp r0, 0
	bne _080662AE
	movs r0, 0
	b _080662B4
_080662AE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080662B4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806629C

	thumb_func_start sub_80662BC
sub_80662BC: @ 80662BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8066128
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80662DC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80662BC

	thumb_func_start sub_80662DC
sub_80662DC: @ 80662DC
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8065040
	lsls r0, 24
	cmp r0, 0
	bne _080662EE
	movs r0, 0
	b _080662F4
_080662EE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080662F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80662DC

	thumb_func_start sub_80662FC
sub_80662FC: @ 80662FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8066128
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806631C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80662FC

	thumb_func_start sub_806631C
sub_806631C: @ 806631C
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8065040
	lsls r0, 24
	cmp r0, 0
	bne _0806632E
	movs r0, 0
	b _08066334
_0806632E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08066334:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806631C

	thumb_func_start sub_806633C
sub_806633C: @ 806633C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8066128
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806635C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806633C

	thumb_func_start sub_806635C
sub_806635C: @ 806635C
	push {r4,lr}
	adds r4, r1, 0
	bl sub_8065040
	lsls r0, 24
	cmp r0, 0
	bne _0806636E
	movs r0, 0
	b _08066374
_0806636E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08066374:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806635C

	thumb_func_start sub_806637C
sub_806637C: @ 806637C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080663C6
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	ldr r4, _080663D4 @ =gMapObjects
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, 3
	adds r3, r2
	lsls r3, 2
	adds r3, r4
	movs r4, 0x10
	ldrsh r2, [r3, r4]
	movs r4, 0x12
	ldrsh r3, [r3, r4]
	bl sub_80635DC
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl an_look_any
_080663C6:
	movs r0, 0x1
	strh r0, [r6, 0x32]
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080663D4: .4byte gMapObjects
	thumb_func_end sub_806637C

	thumb_func_start sub_80663D8
sub_80663D8: @ 80663D8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0806642A
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	ldr r4, _08066438 @ =gMapObjects
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, 3
	adds r3, r2
	lsls r3, 2
	adds r3, r4
	movs r4, 0x10
	ldrsh r2, [r3, r4]
	movs r4, 0x12
	ldrsh r3, [r3, r4]
	bl sub_80635DC
	lsls r0, 24
	lsrs r0, 24
	bl GetOppositeDirection
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl an_look_any
_0806642A:
	movs r0, 0x1
	strh r0, [r6, 0x32]
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08066438: .4byte gMapObjects
	thumb_func_end sub_80663D8

	thumb_func_start sub_806643C
sub_806643C: @ 806643C
	ldrb r2, [r0, 0x1]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806643C

	thumb_func_start sub_806644C
sub_806644C: @ 806644C
	ldrb r3, [r0, 0x1]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806644C

	thumb_func_start sub_806645C
sub_806645C: @ 806645C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066488
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806645C

	thumb_func_start sub_8066488
sub_8066488: @ 8066488
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _0806649C
	movs r0, 0
	b _080664AC
_0806649C:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080664AC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066488

	thumb_func_start sub_80664B4
sub_80664B4: @ 80664B4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80664E0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80664B4

	thumb_func_start sub_80664E0
sub_80664E0: @ 80664E0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _080664F4
	movs r0, 0
	b _08066504
_080664F4:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08066504:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80664E0

	thumb_func_start sub_806650C
sub_806650C: @ 806650C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066538
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806650C

	thumb_func_start sub_8066538
sub_8066538: @ 8066538
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _0806654C
	movs r0, 0
	b _0806655C
_0806654C:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_0806655C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066538

	thumb_func_start sub_8066564
sub_8066564: @ 8066564
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066590
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066564

	thumb_func_start sub_8066590
sub_8066590: @ 8066590
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _080665A4
	movs r0, 0
	b _080665B4
_080665A4:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080665B4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066590

	thumb_func_start sub_80665BC
sub_80665BC: @ 80665BC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80665E8
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80665BC

	thumb_func_start sub_80665E8
sub_80665E8: @ 80665E8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _080665FC
	movs r0, 0
	b _0806660C
_080665FC:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_0806660C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80665E8

	thumb_func_start sub_8066614
sub_8066614: @ 8066614
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066640
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066614

	thumb_func_start sub_8066640
sub_8066640: @ 8066640
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08066654
	movs r0, 0
	b _08066664
_08066654:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08066664:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066640

	thumb_func_start sub_806666C
sub_806666C: @ 806666C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066698
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806666C

	thumb_func_start sub_8066698
sub_8066698: @ 8066698
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _080666AC
	movs r0, 0
	b _080666BC
_080666AC:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080666BC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066698

	thumb_func_start sub_80666C4
sub_80666C4: @ 80666C4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80666F0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80666C4

	thumb_func_start sub_80666F0
sub_80666F0: @ 80666F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08066704
	movs r0, 0
	b _08066714
_08066704:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08066714:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80666F0

	thumb_func_start sub_806671C
sub_806671C: @ 806671C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066748
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806671C

	thumb_func_start sub_8066748
sub_8066748: @ 8066748
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065058
	lsls r0, 24
	cmp r0, 0
	bne _0806675C
	movs r0, 0
	b _0806676C
_0806675C:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_0806676C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066748

	thumb_func_start sub_8066774
sub_8066774: @ 8066774
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80667A0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066774

	thumb_func_start sub_80667A0
sub_80667A0: @ 80667A0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065058
	lsls r0, 24
	cmp r0, 0
	bne _080667B4
	movs r0, 0
	b _080667C4
_080667B4:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080667C4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80667A0

	thumb_func_start sub_80667CC
sub_80667CC: @ 80667CC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80667F8
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80667CC

	thumb_func_start sub_80667F8
sub_80667F8: @ 80667F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065058
	lsls r0, 24
	cmp r0, 0
	bne _0806680C
	movs r0, 0
	b _0806681C
_0806680C:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_0806681C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80667F8

	thumb_func_start sub_8066824
sub_8066824: @ 8066824
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066850
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066824

	thumb_func_start sub_8066850
sub_8066850: @ 8066850
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065058
	lsls r0, 24
	cmp r0, 0
	bne _08066864
	movs r0, 0
	b _08066874
_08066864:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08066874:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066850

	thumb_func_start sub_806687C
sub_806687C: @ 806687C
	push {lr}
	ldr r3, _08066890 @ =gUnknown_839FD5D
	ldrb r2, [r0, 0x6]
	adds r2, r3
	ldrb r2, [r2]
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08066890: .4byte gUnknown_839FD5D
	thumb_func_end sub_806687C

	thumb_func_start sub_8066894
sub_8066894: @ 8066894
	push {lr}
	movs r2, 0x1
	movs r3, 0x14
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8066894

	thumb_func_start sub_80668A4
sub_80668A4: @ 80668A4
	ldrb r3, [r0, 0x3]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80668A4

	thumb_func_start sub_80668B4
sub_80668B4: @ 80668B4
	ldrb r2, [r0, 0x3]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80668B4

	thumb_func_start sub_80668C4
sub_80668C4: @ 80668C4
	ldrb r2, [r0, 0x1]
	movs r3, 0x10
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80668C4

	thumb_func_start sub_80668D4
sub_80668D4: @ 80668D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r0, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80668D4

	thumb_func_start sub_8066900
sub_8066900: @ 8066900
	ldrb r2, [r0, 0x1]
	movs r3, 0x20
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8066900

	thumb_func_start sub_8066910
sub_8066910: @ 8066910
	ldrb r3, [r0, 0x1]
	movs r2, 0x21
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8066910

	thumb_func_start do_exclamation_mark_bubble_1
do_exclamation_mark_bubble_1: @ 8066920
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _08066940 @ =gFieldEffectArguments
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066940: .4byte gFieldEffectArguments
	thumb_func_end do_exclamation_mark_bubble_1

	thumb_func_start do_exclamation_mark_bubble_2
do_exclamation_mark_bubble_2: @ 8066944
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _08066964 @ =gFieldEffectArguments
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x21
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066964: .4byte gFieldEffectArguments
	thumb_func_end do_exclamation_mark_bubble_2

	thumb_func_start do_heart_bubble
do_heart_bubble: @ 8066968
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _08066988 @ =gFieldEffectArguments
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x2E
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066988: .4byte gFieldEffectArguments
	thumb_func_end do_heart_bubble

	thumb_func_start sub_806698C
sub_806698C: @ 806698C
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080669AC @ =gFieldEffectArguments
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x42
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080669AC: .4byte gFieldEffectArguments
	thumb_func_end sub_806698C

	thumb_func_start sub_80669B0
sub_80669B0: @ 80669B0
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080669D0 @ =gFieldEffectArguments
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x40
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080669D0: .4byte gFieldEffectArguments
	thumb_func_end sub_80669B0

	thumb_func_start sub_80669D4
sub_80669D4: @ 80669D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x6]
	cmp r0, 0x3F
	bne _080669EA
	adds r0, r4, 0
	bl sub_80824EC
	movs r0, 0
	b _08066A12
_080669EA:
	subs r0, 0x39
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08066A0C
	adds r0, r4, 0
	bl sub_80DCBB8
	movs r0, 0x1
	strh r0, [r5, 0x32]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066A18
	lsls r0, 24
	lsrs r0, 24
	b _08066A12
_08066A0C:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08066A12:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80669D4

	thumb_func_start sub_8066A18
sub_8066A18: @ 8066A18
	push {r4,lr}
	adds r4, r1, 0
	bl sub_80DCBE0
	lsls r0, 24
	cmp r0, 0
	bne _08066A2A
	movs r0, 0
	b _08066A30
_08066A2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08066A30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066A18

	thumb_func_start sub_8066A38
sub_8066A38: @ 8066A38
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066A38

	thumb_func_start sub_8066A54
sub_8066A54: @ 8066A54
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8068E9C
	lsls r0, 24
	cmp r0, 0
	beq _08066A70
	adds r0, r4, 0
	movs r1, 0x20
	bl SetFieldObjectStepTimer
	movs r0, 0x2
	strh r0, [r4, 0x32]
_08066A70:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066A54

	thumb_func_start sub_8066A78
sub_8066A78: @ 8066A78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	beq _08066AAA
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08066AAA:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066A78

	thumb_func_start sub_8066AB4
sub_8066AB4: @ 8066AB4
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066AB4

	thumb_func_start sub_8066AD0
sub_8066AD0: @ 8066AD0
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8068E9C
	lsls r0, 24
	cmp r0, 0
	beq _08066AEC
	adds r0, r4, 0
	movs r1, 0x20
	bl SetFieldObjectStepTimer
	movs r0, 0x2
	strh r0, [r4, 0x32]
_08066AEC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066AD0

	thumb_func_start sub_8066AF4
sub_8066AF4: @ 8066AF4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl RunFieldObjectStepTimer
	lsls r0, 24
	cmp r0, 0
	beq _08066B26
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08066B26:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066AF4

	thumb_func_start sub_8066B30
sub_8066B30: @ 8066B30
	ldrb r2, [r0, 0x3]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8066B30

	thumb_func_start sub_8066B40
sub_8066B40: @ 8066B40
	ldrb r3, [r0, 0x3]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8066B40

	thumb_func_start sub_8066B50
sub_8066B50: @ 8066B50
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r4, 0x42
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066B50

	thumb_func_start sub_8066B80
sub_8066B80: @ 8066B80
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	movs r3, 0
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066B80

	thumb_func_start sub_8066BB0
sub_8066BB0: @ 8066BB0
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8064830
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8066BE4
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066BB0

	thumb_func_start sub_8066BE4
sub_8066BE4: @ 8066BE4
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08066BF6
	movs r0, 0
	b _08066C08
_08066BF6:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08066C08:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066BE4

	thumb_func_start sub_8066C10
sub_8066C10: @ 8066C10
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8064830
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8066C44
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066C10

	thumb_func_start sub_8066C44
sub_8066C44: @ 8066C44
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08066C56
	movs r0, 0
	b _08066C68
_08066C56:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08066C68:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066C44

	thumb_func_start sub_8066C70
sub_8066C70: @ 8066C70
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	bl npc_coords_shift_still
	adds r0, r4, 0
	bl sub_80634E0
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl obj_npc_animation_step
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r6, 0x32]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8066C70

	thumb_func_start sub_8066CB0
sub_8066CB0: @ 8066CB0
	push {lr}
	movs r2, 0x1
	bl sub_8066C70
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8066CB0

	thumb_func_start sub_8066CC0
sub_8066CC0: @ 8066CC0
	push {lr}
	movs r2, 0x2
	bl sub_8066C70
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8066CC0

	thumb_func_start sub_8066CD0
sub_8066CD0: @ 8066CD0
	push {lr}
	movs r2, 0x3
	bl sub_8066C70
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8066CD0

	thumb_func_start sub_8066CE0
sub_8066CE0: @ 8066CE0
	push {lr}
	movs r2, 0x4
	bl sub_8066C70
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8066CE0

	thumb_func_start sub_8066CF0
sub_8066CF0: @ 8066CF0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_8063490
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066CF0

	thumb_func_start sub_8066D14
sub_8066D14: @ 8066D14
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_8063490
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066D14

	thumb_func_start sub_8066D38
sub_8066D38: @ 8066D38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_8063490
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066D38

	thumb_func_start sub_8066D5C
sub_8066D5C: @ 8066D5C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_8063490
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066D5C

	thumb_func_start sub_8066D80
sub_8066D80: @ 8066D80
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_80634B0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066D80

	thumb_func_start sub_8066DA4
sub_8066DA4: @ 8066DA4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_80634B0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066DA4

	thumb_func_start sub_8066DC8
sub_8066DC8: @ 8066DC8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_80634B0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066DC8

	thumb_func_start sub_8066DEC
sub_8066DEC: @ 8066DEC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_80634B0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066DEC

	thumb_func_start sub_8066E10
sub_8066E10: @ 8066E10
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_80634D0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066E10

	thumb_func_start sub_8066E34
sub_8066E34: @ 8066E34
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_80634D0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066E34

	thumb_func_start sub_8066E58
sub_8066E58: @ 8066E58
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_80634D0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066E58

	thumb_func_start sub_8066E7C
sub_8066E7C: @ 8066E7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_80634D0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066E7C

	thumb_func_start sub_8066EA0
sub_8066EA0: @ 8066EA0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_8064E3C
	adds r0, r4, 0
	bl sub_8063490
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
	adds r0, r6, 0
	bl DoShadowFieldEffect
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8066EA0

	thumb_func_start sub_8066EE4
sub_8066EE4: @ 8066EE4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066F10
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066EE4

	thumb_func_start sub_8066F10
sub_8066F10: @ 8066F10
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08066F24
	movs r0, 0
	b _08066F34
_08066F24:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08066F34:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066F10

	thumb_func_start sub_8066F3C
sub_8066F3C: @ 8066F3C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066F68
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066F3C

	thumb_func_start sub_8066F68
sub_8066F68: @ 8066F68
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08066F7C
	movs r0, 0
	b _08066F8C
_08066F7C:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08066F8C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066F68

	thumb_func_start sub_8066F94
sub_8066F94: @ 8066F94
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8066FC0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066F94

	thumb_func_start sub_8066FC0
sub_8066FC0: @ 8066FC0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08066FD4
	movs r0, 0
	b _08066FE4
_08066FD4:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08066FE4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066FC0

	thumb_func_start sub_8066FEC
sub_8066FEC: @ 8066FEC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8067018
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8066FEC

	thumb_func_start sub_8067018
sub_8067018: @ 8067018
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _0806702C
	movs r0, 0
	b _0806703C
_0806702C:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_0806703C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067018

	thumb_func_start sub_8067044
sub_8067044: @ 8067044
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8067070
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067044

	thumb_func_start sub_8067070
sub_8067070: @ 8067070
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08067084
	movs r0, 0
	b _08067094
_08067084:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08067094:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067070

	thumb_func_start sub_806709C
sub_806709C: @ 806709C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80670C8
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806709C

	thumb_func_start sub_80670C8
sub_80670C8: @ 80670C8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _080670DC
	movs r0, 0
	b _080670EC
_080670DC:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080670EC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80670C8

	thumb_func_start sub_80670F4
sub_80670F4: @ 80670F4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8067120
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80670F4

	thumb_func_start sub_8067120
sub_8067120: @ 8067120
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08067134
	movs r0, 0
	b _08067144
_08067134:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08067144:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067120

	thumb_func_start sub_806714C
sub_806714C: @ 806714C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8067178
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806714C

	thumb_func_start sub_8067178
sub_8067178: @ 8067178
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _0806718C
	movs r0, 0
	b _0806719C
_0806718C:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_0806719C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067178

	thumb_func_start sub_80671A4
sub_80671A4: @ 80671A4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80671D0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80671A4

	thumb_func_start sub_80671D0
sub_80671D0: @ 80671D0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _080671E4
	movs r0, 0
	b _080671F4
_080671E4:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080671F4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80671D0

	thumb_func_start sub_80671FC
sub_80671FC: @ 80671FC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8067228
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80671FC

	thumb_func_start sub_8067228
sub_8067228: @ 8067228
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _0806723C
	movs r0, 0
	b _0806724C
_0806723C:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_0806724C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067228

	thumb_func_start sub_8067254
sub_8067254: @ 8067254
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8067280
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067254

	thumb_func_start sub_8067280
sub_8067280: @ 8067280
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _08067294
	movs r0, 0
	b _080672A4
_08067294:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080672A4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067280

	thumb_func_start sub_80672AC
sub_80672AC: @ 80672AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x2
	bl sub_8066EA0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80672D8
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80672AC

	thumb_func_start sub_80672D8
sub_80672D8: @ 80672D8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8065028
	lsls r0, 24
	cmp r0, 0
	bne _080672EC
	movs r0, 0
	b _080672FC
_080672EC:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080672FC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80672D8

	thumb_func_start sub_8067304
sub_8067304: @ 8067304
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_80634E0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067304

	thumb_func_start sub_806733C
sub_806733C: @ 806733C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_80634E0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806733C

	thumb_func_start sub_8067374
sub_8067374: @ 8067374
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_80634E0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067374

	thumb_func_start sub_80673AC
sub_80673AC: @ 80673AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_80634E0
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80656C4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806570C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80673AC

	thumb_func_start sub_80673E4
sub_80673E4: @ 80673E4
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8064678
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063490
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80673E4

	thumb_func_start sub_806741C
sub_806741C: @ 806741C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80673E4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806743C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806741C

	thumb_func_start sub_806743C
sub_806743C: @ 806743C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806744E
	movs r0, 0
	b _08067454
_0806744E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08067454:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806743C

	thumb_func_start sub_806745C
sub_806745C: @ 806745C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80673E4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806747C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806745C

	thumb_func_start sub_806747C
sub_806747C: @ 806747C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806748E
	movs r0, 0
	b _08067494
_0806748E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08067494:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806747C

	thumb_func_start sub_806749C
sub_806749C: @ 806749C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80673E4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80674BC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806749C

	thumb_func_start sub_80674BC
sub_80674BC: @ 80674BC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080674CE
	movs r0, 0
	b _080674D4
_080674CE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080674D4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80674BC

	thumb_func_start sub_80674DC
sub_80674DC: @ 80674DC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_80673E4
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80674FC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80674DC

	thumb_func_start sub_80674FC
sub_80674FC: @ 80674FC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806750E
	movs r0, 0
	b _08067514
_0806750E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08067514:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80674FC

	thumb_func_start sub_806751C
sub_806751C: @ 806751C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8064678
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_80634E0
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_apply_anim_looping
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806751C

	thumb_func_start sub_806754C
sub_806754C: @ 806754C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_806751C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806756C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806754C

	thumb_func_start sub_806756C
sub_806756C: @ 806756C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806757E
	movs r0, 0
	b _08067584
_0806757E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08067584:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806756C

	thumb_func_start sub_806758C
sub_806758C: @ 806758C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_806751C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80675AC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806758C

	thumb_func_start sub_80675AC
sub_80675AC: @ 80675AC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080675BE
	movs r0, 0
	b _080675C4
_080675BE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080675C4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80675AC

	thumb_func_start sub_80675CC
sub_80675CC: @ 80675CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806751C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80675EC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80675CC

	thumb_func_start sub_80675EC
sub_80675EC: @ 80675EC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080675FE
	movs r0, 0
	b _08067604
_080675FE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08067604:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80675EC

	thumb_func_start sub_806760C
sub_806760C: @ 806760C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_806751C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806762C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806760C

	thumb_func_start sub_806762C
sub_806762C: @ 806762C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806763E
	movs r0, 0
	b _08067644
_0806763E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08067644:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806762C

	thumb_func_start sub_806764C
sub_806764C: @ 806764C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8064678
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_80634C0
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_apply_anim_looping
	adds r0, r5, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806764C

	thumb_func_start sub_8067684
sub_8067684: @ 8067684
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_806764C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80676A4
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067684

	thumb_func_start sub_80676A4
sub_80676A4: @ 80676A4
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080676B6
	movs r0, 0
	b _080676BC
_080676B6:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080676BC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80676A4

	thumb_func_start sub_80676C4
sub_80676C4: @ 80676C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_806764C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80676E4
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80676C4

	thumb_func_start sub_80676E4
sub_80676E4: @ 80676E4
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080676F6
	movs r0, 0
	b _080676FC
_080676F6:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080676FC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80676E4

	thumb_func_start sub_8067704
sub_8067704: @ 8067704
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806764C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8067724
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067704

	thumb_func_start sub_8067724
sub_8067724: @ 8067724
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08067736
	movs r0, 0
	b _0806773C
_08067736:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_0806773C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8067724

	thumb_func_start sub_8067744
sub_8067744: @ 8067744
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_806764C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8067764
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067744

	thumb_func_start sub_8067764
sub_8067764: @ 8067764
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08067776
	movs r0, 0
	b _0806777C
_08067776:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_0806777C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8067764

	thumb_func_start sub_8067784
sub_8067784: @ 8067784
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x14
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r5, 0x1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	movs r1, 0
	movs r0, 0x1
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x36]
	strh r1, [r4, 0x38]
	strh r1, [r4, 0x3A]
	strh r1, [r4, 0x3C]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067784

	thumb_func_start sub_80677C0
sub_80677C0: @ 80677C0
	adds r1, 0x3F
	ldrb r0, [r1]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	thumb_func_end sub_80677C0

	thumb_func_start sub_80677CC
sub_80677CC: @ 80677CC
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _08067854
	cmp r1, 0x1
	bgt _080677E4
	cmp r1, 0
	beq _080677EA
	b _080678B6
_080677E4:
	cmp r1, 0x2
	beq _08067896
	b _080678B6
_080677EA:
	ldrh r0, [r4, 0x3A]
	adds r0, 0xA
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	ble _08067822
	strh r1, [r4, 0x3A]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	strh r0, [r4, 0x3C]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r5, 0x1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
_08067822:
	ldr r1, _08067850 @ =gSineTable
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 7
	negs r0, r0
	strh r0, [r4, 0x26]
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	lsls r1, 1
	ldrb r2, [r5]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	b _080678B6
	.align 2, 0
_08067850: .4byte gSineTable
_08067854:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0806788A
	strh r6, [r4, 0x36]
	adds r0, r4, 0
	movs r1, 0x14
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r5, 0x1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	strh r6, [r4, 0x3C]
	b _080678B6
_0806788A:
	ldrb r1, [r5]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	b _080678B6
_08067896:
	ldrb r1, [r5]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x50
	ble _080678B6
	movs r0, 0
	strh r0, [r4, 0x36]
	movs r0, 0x1
	b _080678B8
_080678B6:
	movs r0, 0
_080678B8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80677CC

	thumb_func_start sub_80678C0
sub_80678C0: @ 80678C0
	push {r4,lr}
	ldrh r2, [r1, 0x3C]
	adds r2, 0x4
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r1, 0x3C]
	ldr r3, _080678EC @ =gSineTable
	movs r4, 0x3C
	ldrsh r0, [r1, r4]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r1, 0x24]
	movs r0, 0
	cmp r2, 0
	bne _080678E6
	movs r0, 0x1
_080678E6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080678EC: .4byte gSineTable
	thumb_func_end sub_80678C0

	thumb_func_start sub_80678F0
sub_80678F0: @ 80678F0
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1C
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r5, 0x1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80678F0

	thumb_func_start sub_8067924
sub_8067924: @ 8067924
	adds r1, 0x3F
	ldrb r0, [r1]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	thumb_func_end sub_8067924

	thumb_func_start sub_8067930
sub_8067930: @ 8067930
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8067930

	thumb_func_start sub_8067934
sub_8067934: @ 8067934
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1]
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8067934

	thumb_func_start sub_8067944
sub_8067944: @ 8067944
	movs r0, 0
	strh r0, [r1, 0x26]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	movs r0, 0
	bx lr
	thumb_func_end sub_8067944

	thumb_func_start sub_8067954
sub_8067954: @ 8067954
	push {lr}
	adds r2, r1, 0
	ldrh r0, [r2, 0x26]
	subs r0, 0x8
	strh r0, [r2, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xA0
	negs r1, r1
	cmp r0, r1
	bne _08067970
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
_08067970:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8067954

	thumb_func_start sub_8067978
sub_8067978: @ 8067978
	ldr r0, _08067988 @ =0x0000ff60
	strh r0, [r1, 0x26]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	movs r0, 0
	bx lr
	.align 2, 0
_08067988: .4byte 0x0000ff60
	thumb_func_end sub_8067978

	thumb_func_start sub_806798C
sub_806798C: @ 806798C
	push {lr}
	ldrh r0, [r1, 0x26]
	adds r0, 0x8
	strh r0, [r1, 0x26]
	lsls r0, 16
	cmp r0, 0
	bne _080679A0
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
_080679A0:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806798C

	thumb_func_start sub_80679A8
sub_80679A8: @ 80679A8
	movs r0, 0x1
	bx lr
	thumb_func_end sub_80679A8

	thumb_func_start npc_obj_transfer_image_anim_pause_flag
npc_obj_transfer_image_anim_pause_flag: @ 80679AC
	push {lr}
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r0, 0
	bge _080679C2
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
_080679C2:
	pop {r0}
	bx r0
	thumb_func_end npc_obj_transfer_image_anim_pause_flag

	thumb_func_start sub_80679C8
sub_80679C8: @ 80679C8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r3, [r4, 0x1]
	lsls r0, r3, 28
	cmp r0, 0
	bge _080679F0
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	movs r1, 0x9
	negs r1, r1
	ands r0, r1
	strb r0, [r4, 0x1]
_080679F0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80679C8

	thumb_func_start sub_80679F8
sub_80679F8: @ 80679F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8067A10
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_update_obj_anim_flag
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80679F8

	thumb_func_start sub_8067A10
sub_8067A10: @ 8067A10
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r5, 0x1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r7, r0, 0
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08067A74
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08067A6C @ =gSpriteCoordOffsetX
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08067A70 @ =gSpriteCoordOffsetY
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	b _08067A9C
	.align 2, 0
_08067A6C: .4byte gSpriteCoordOffsetX
_08067A70: .4byte gSpriteCoordOffsetY
_08067A74:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
_08067A9C:
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r7, 0x8]
	adds r0, r3
	lsls r0, 16
	lsrs r6, r0, 16
	ldrh r0, [r7, 0xA]
	adds r0, r2
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _08067B00 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _08067B04 @ =0x00000401
	ldr r4, _08067B08 @ =0x0000fff0
	cmp r1, r0
	bne _08067AC6
	ldrb r0, [r5, 0x8]
	cmp r0, 0x1
	bne _08067AC6
	subs r4, 0x10
_08067AC6:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _08067AD6
	lsls r1, r6, 16
	lsls r0, r4, 16
	cmp r1, r0
	bge _08067ADE
_08067AD6:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_08067ADE:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _08067AF2
	lsls r0, r7, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _08067AFA
_08067AF2:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_08067AFA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067B00: .4byte gSaveBlock1Ptr
_08067B04: .4byte 0x00000401
_08067B08: .4byte 0x0000fff0
	thumb_func_end sub_8067A10

	thumb_func_start npc_update_obj_anim_flag
npc_update_obj_anim_flag: @ 8067B0C
	push {lr}
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x5
	negs r3, r3
	ands r3, r1
	strb r3, [r2]
	ldrb r1, [r0, 0x1]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _08067B2E
	movs r1, 0x4
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2]
_08067B2E:
	pop {r0}
	bx r0
	thumb_func_end npc_update_obj_anim_flag

	.align 2, 0 @ Don't pad with nop.
