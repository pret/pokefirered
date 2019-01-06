	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ScrCmd_applymovement
ScrCmd_applymovement: @ 806B200
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadWord
	adds r3, r0, 0
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r1, _0806B23C @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl ScriptMovement_StartObjectMovementScript
	ldr r0, _0806B240 @ =gUnknown_20370B0
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B23C: .4byte gSaveBlock1Ptr
_0806B240: .4byte gUnknown_20370B0
	thumb_func_end ScrCmd_applymovement

	thumb_func_start ScrCmd_applymovement_at
ScrCmd_applymovement_at: @ 806B244
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadWord
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r0, r4, 24
	lsrs r0, 24
	bl ScriptMovement_StartObjectMovementScript
	ldr r0, _0806B284 @ =gUnknown_20370B0
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B284: .4byte gUnknown_20370B0
	thumb_func_end ScrCmd_applymovement_at

	thumb_func_start WaitForMovementFinish
WaitForMovementFinish: @ 806B288
	push {lr}
	ldr r0, _0806B2A4 @ =gUnknown_20370B0
	ldrb r0, [r0]
	ldr r1, _0806B2A8 @ =gUnknown_20370B4
	ldrb r1, [r1]
	ldr r2, _0806B2AC @ =gUnknown_20370B2
	ldrb r2, [r2]
	bl ScriptMovement_IsObjectMovementFinished
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806B2A4: .4byte gUnknown_20370B0
_0806B2A8: .4byte gUnknown_20370B4
_0806B2AC: .4byte gUnknown_20370B2
	thumb_func_end WaitForMovementFinish

	thumb_func_start ScrCmd_waitmovement
ScrCmd_waitmovement: @ 806B2B0
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806B2CC
	ldr r0, _0806B2F0 @ =gUnknown_20370B0
	strh r1, [r0]
_0806B2CC:
	ldr r1, _0806B2F4 @ =gUnknown_20370B2
	ldr r0, _0806B2F8 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _0806B2FC @ =gUnknown_20370B4
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _0806B300 @ =WaitForMovementFinish
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B2F0: .4byte gUnknown_20370B0
_0806B2F4: .4byte gUnknown_20370B2
_0806B2F8: .4byte gSaveBlock1Ptr
_0806B2FC: .4byte gUnknown_20370B4
_0806B300: .4byte WaitForMovementFinish
	thumb_func_end ScrCmd_waitmovement

	thumb_func_start ScrCmd_waitmovement_at
ScrCmd_waitmovement_at: @ 806B304
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806B320
	ldr r0, _0806B348 @ =gUnknown_20370B0
	strh r1, [r0]
_0806B320:
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldr r0, _0806B34C @ =gUnknown_20370B2
	strh r2, [r0]
	ldr r0, _0806B350 @ =gUnknown_20370B4
	strh r1, [r0]
	ldr r1, _0806B354 @ =WaitForMovementFinish
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B348: .4byte gUnknown_20370B0
_0806B34C: .4byte gUnknown_20370B2
_0806B350: .4byte gUnknown_20370B4
_0806B354: .4byte WaitForMovementFinish
	thumb_func_end ScrCmd_waitmovement_at

	thumb_func_start ScrCmd_removeobject
ScrCmd_removeobject: @ 806B358
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806B37C @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B37C: .4byte gSaveBlock1Ptr
	thumb_func_end ScrCmd_removeobject

	thumb_func_start ScrCmd_removeobject_at
ScrCmd_removeobject_at: @ 806B380
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_removeobject_at

	thumb_func_start ScrCmd_addobject
ScrCmd_addobject: @ 806B3B0
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806B3D4 @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl show_sprite
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B3D4: .4byte gSaveBlock1Ptr
	thumb_func_end ScrCmd_addobject

	thumb_func_start ScrCmd_addobject_at
ScrCmd_addobject_at: @ 806B3D8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl show_sprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_addobject_at

	thumb_func_start ScrCmd_setobjectxy
ScrCmd_setobjectxy: @ 806B408
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0806B46C @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	lsls r4, 16
	asrs r4, 16
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	adds r0, r5, 0
	adds r3, r4, 0
	bl sub_805F7C4
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806B46C: .4byte gSaveBlock1Ptr
	thumb_func_end ScrCmd_setobjectxy

	thumb_func_start ScrCmd_setobjectxyperm
ScrCmd_setobjectxyperm: @ 806B470
	push {r4-r6,lr}
	adds r6, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r2, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl Overworld_SetMapObjTemplateCoords
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setobjectxyperm

	thumb_func_start ScrCmd_moveobjectoffscreen
ScrCmd_moveobjectoffscreen: @ 806B4C8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806B4EC @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805FE94
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B4EC: .4byte gSaveBlock1Ptr
	thumb_func_end ScrCmd_moveobjectoffscreen

	thumb_func_start ScrCmd_showobject_at
ScrCmd_showobject_at: @ 806B4F0
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showobject_at

	thumb_func_start ScrCmd_hideobject_at
ScrCmd_hideobject_at: @ 806B520
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hideobject_at

	thumb_func_start ScrCmd_setobjectpriority
ScrCmd_setobjectpriority: @ 806B550
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r5, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r5, 0x8]
	ldrb r1, [r3]
	adds r4, r3, 0x1
	str r4, [r5, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r5, 0x8]
	lsls r0, 24
	lsrs r0, 24
	adds r3, 0x53
	lsls r3, 24
	lsrs r3, 24
	bl sub_805F3A8
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setobjectpriority

	thumb_func_start ScrCmd_resetobjectpriority
ScrCmd_resetobjectpriority: @ 806B58C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_805F400
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_resetobjectpriority

	thumb_func_start ScrCmd_faceplayer
ScrCmd_faceplayer: @ 806B5BC
	push {r4,lr}
	ldr r2, _0806B5EC @ =gMapObjects
	ldr r0, _0806B5F0 @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _0806B5E4
	bl player_get_direction_lower_nybble
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectFaceOppositeDirection
_0806B5E4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B5EC: .4byte gMapObjects
_0806B5F0: .4byte gUnknown_3005074
	thumb_func_end ScrCmd_faceplayer

	thumb_func_start ScrCmd_turnobject
ScrCmd_turnobject: @ 806B5F4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, [r4, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806B624 @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl FieldObjectTurnByLocalIdAndMap
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B624: .4byte gSaveBlock1Ptr
	thumb_func_end ScrCmd_turnobject

	thumb_func_start ScrCmd_setobjectmovementtype
ScrCmd_setobjectmovementtype: @ 806B628
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl Overworld_SetMapObjTemplateMovementType
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setobjectmovementtype

	thumb_func_start ScrCmd_createvobject
ScrCmd_createvobject: @ 806B650
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r4, 16
	asrs r4, 16
	lsls r3, 16
	asrs r3, 16
	str r2, [sp]
	str r1, [sp, 0x4]
	mov r0, r8
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_805E9F8
	movs r0, 0
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_createvobject

	thumb_func_start ScrCmd_turnvobject
ScrCmd_turnvobject: @ 806B6C0
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl sub_8069058
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_turnvobject

	thumb_func_start ScrCmd_lockall
ScrCmd_lockall: @ 806B6DC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805642C
	cmp r0, 0
	bne _0806B6FC
	bl ScriptFreezeMapObjects
	ldr r1, _0806B6F8 @ =sub_8069590
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	b _0806B6FE
	.align 2, 0
_0806B6F8: .4byte sub_8069590
_0806B6FC:
	movs r0, 0
_0806B6FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_lockall

	thumb_func_start ScrCmd_lock
ScrCmd_lock: @ 806B704
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805642C
	cmp r0, 0
	beq _0806B714
	movs r0, 0
	b _0806B752
_0806B714:
	ldr r2, _0806B738 @ =gMapObjects
	ldr r0, _0806B73C @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0806B744
	bl LockSelectedMapObject
	ldr r1, _0806B740 @ =sub_8069648
	adds r0, r4, 0
	bl SetupNativeScript
	b _0806B750
	.align 2, 0
_0806B738: .4byte gMapObjects
_0806B73C: .4byte gUnknown_3005074
_0806B740: .4byte sub_8069648
_0806B744:
	bl ScriptFreezeMapObjects
	ldr r1, _0806B758 @ =sub_8069590
	adds r0, r4, 0
	bl SetupNativeScript
_0806B750:
	movs r0, 0x1
_0806B752:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B758: .4byte sub_8069590
	thumb_func_end ScrCmd_lock

	thumb_func_start ScrCmd_releaseall
ScrCmd_releaseall: @ 806B75C
	push {lr}
	bl HideFieldMessageBox
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806B790 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80974D8
	bl UnfreezeMapObjects
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B790: .4byte gMapObjects
	thumb_func_end ScrCmd_releaseall

	thumb_func_start ScrCmd_release
ScrCmd_release: @ 806B794
	push {r4,lr}
	bl HideFieldMessageBox
	ldr r4, _0806B7E4 @ =gMapObjects
	ldr r0, _0806B7E8 @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0806B7B6
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
_0806B7B6:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80974D8
	bl UnfreezeMapObjects
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B7E4: .4byte gMapObjects
_0806B7E8: .4byte gUnknown_3005074
	thumb_func_end ScrCmd_release

	thumb_func_start sub_806B7EC
sub_806B7EC: @ 806B7EC
	ldr r2, _0806B804 @ =gUnknown_20370DC
	ldr r3, _0806B808 @ =gUnknown_20370DA
	ldrh r1, [r3]
	strh r1, [r2]
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	strh r2, [r3]
	adds r1, 0x1
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_0806B804: .4byte gUnknown_20370DC
_0806B808: .4byte gUnknown_20370DA
	thumb_func_end sub_806B7EC

	thumb_func_start sub_806B80C
sub_806B80C: @ 806B80C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	cmp r0, 0
	bne _0806B81A
	ldr r0, [r4, 0x64]
_0806B81A:
	bl ShowFieldMessage
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B80C

	thumb_func_start sub_806B828
sub_806B828: @ 806B828
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	cmp r0, 0
	bne _0806B836
	ldr r0, [r4, 0x64]
_0806B836:
	bl sub_80F7974
	bl GetStartMenuWindowId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl CopyWindowToVram
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B828

	thumb_func_start sub_806B850
sub_806B850: @ 806B850
	push {lr}
	bl sub_80F7998
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806B850

	thumb_func_start sub_806B85C
sub_806B85C: @ 806B85C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	cmp r0, 0
	bne _0806B86A
	ldr r0, [r4, 0x64]
_0806B86A:
	bl ShowFieldAutoScrollMessage
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B85C

	thumb_func_start sub_806B878
sub_806B878: @ 806B878
	push {lr}
	ldr r1, _0806B888 @ =IsFieldMessageBoxHidden
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806B888: .4byte IsFieldMessageBoxHidden
	thumb_func_end sub_806B878

	thumb_func_start sub_806B88C
sub_806B88C: @ 806B88C
	push {lr}
	bl HideFieldMessageBox
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806B88C

	thumb_func_start sub_806B898
sub_806B898: @ 806B898
	push {r4,lr}
	ldr r0, _0806B8F0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0806B922
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0806B922
	ldr r4, _0806B8F4 @ =gUnknown_3005070
	ldr r0, [r4]
	bl sub_806B93C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B906
	ldr r0, [r4]
	bl sub_806B96C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8069998
	cmp r4, 0
	beq _0806B906
	ldr r0, _0806B8F8 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0806B906
	bl sub_80699F8
	adds r0, r4, 0
	subs r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806B8FC
	bl sub_8069964
	b _0806B922
	.align 2, 0
_0806B8F0: .4byte gMain
_0806B8F4: .4byte gUnknown_3005070
_0806B8F8: .4byte gUnknown_203ADFA
_0806B8FC:
	bl sub_80699A4
	bl sub_8069970
	b _0806B922
_0806B906:
	bl sub_8112CAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806B91A
	ldr r0, _0806B928 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0806B934
_0806B91A:
	ldr r1, _0806B92C @ =gUnknown_20370AC
	ldrb r0, [r1]
	cmp r0, 0x78
	bne _0806B930
_0806B922:
	movs r0, 0x1
	b _0806B936
	.align 2, 0
_0806B928: .4byte gUnknown_203ADFA
_0806B92C: .4byte gUnknown_20370AC
_0806B930:
	adds r0, 0x1
	strb r0, [r1]
_0806B934:
	movs r0, 0
_0806B936:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B898

	thumb_func_start sub_806B93C
sub_806B93C: @ 806B93C
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0806B958
	ldrb r1, [r2]
	subs r1, 0x1
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0]
_0806B958:
	subs r0, 0x6B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806B966
	movs r0, 0x1
	b _0806B968
_0806B966:
	movs r0, 0
_0806B968:
	pop {r1}
	bx r1
	thumb_func_end sub_806B93C

	thumb_func_start sub_806B96C
sub_806B96C: @ 806B96C
	push {lr}
	ldr r2, _0806B988 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0806B990
	ldr r0, _0806B98C @ =gSpecialVar_Facing
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _0806B990
	movs r0, 0x1
	b _0806BA36
	.align 2, 0
_0806B988: .4byte gMain
_0806B98C: .4byte gSpecialVar_Facing
_0806B990:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806B9AC
	ldr r0, _0806B9A8 @ =gSpecialVar_Facing
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _0806B9AC
	movs r0, 0x2
	b _0806BA36
	.align 2, 0
_0806B9A8: .4byte gSpecialVar_Facing
_0806B9AC:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806B9C8
	ldr r0, _0806B9C4 @ =gSpecialVar_Facing
	ldrh r0, [r0]
	cmp r0, 0x3
	beq _0806B9C8
	movs r0, 0x3
	b _0806BA36
	.align 2, 0
_0806B9C4: .4byte gSpecialVar_Facing
_0806B9C8:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0806B9E4
	ldr r0, _0806B9E0 @ =gSpecialVar_Facing
	ldrh r0, [r0]
	cmp r0, 0x4
	beq _0806B9E4
	movs r0, 0x4
	b _0806BA36
	.align 2, 0
_0806B9E0: .4byte gSpecialVar_Facing
_0806B9E4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0806B9F4
	movs r0, 0x5
	b _0806BA36
_0806B9F4:
	ldrh r2, [r2, 0x2C]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0806BA04
	movs r0, 0x6
	b _0806BA36
_0806BA04:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0806BA10
	movs r0, 0x7
	b _0806BA36
_0806BA10:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _0806BA1C
	movs r0, 0x8
	b _0806BA36
_0806BA1C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806BA28
	movs r0, 0x9
	b _0806BA36
_0806BA28:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0806BA34
	movs r0, 0
	b _0806BA36
_0806BA34:
	movs r0, 0xA
_0806BA36:
	pop {r1}
	bx r1
	thumb_func_end sub_806B96C

	thumb_func_start sub_806BA3C
sub_806BA3C: @ 806BA3C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0806BA70 @ =gUnknown_3005070
	str r4, [r0]
	bl sub_8112CAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BA58
	ldr r0, _0806BA74 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0806BA5E
_0806BA58:
	ldr r1, _0806BA78 @ =gUnknown_20370AC
	movs r0, 0
	strb r0, [r1]
_0806BA5E:
	ldr r1, _0806BA7C @ =sub_806B898
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BA70: .4byte gUnknown_3005070
_0806BA74: .4byte gUnknown_203ADFA
_0806BA78: .4byte gUnknown_20370AC
_0806BA7C: .4byte sub_806B898
	thumb_func_end sub_806BA3C

	thumb_func_start ScrCmd_yesnobox
ScrCmd_yesnobox: @ 806BA80
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl sub_809CDEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BAA2
	movs r0, 0
	b _0806BAA8
_0806BAA2:
	bl ScriptContext1_Stop
	movs r0, 0x1
_0806BAA8:
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_yesnobox

	thumb_func_start ScrCmd_multichoice
ScrCmd_multichoice: @ 806BAAC
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl ScriptMenu_Multichoice
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BADA
	movs r0, 0
	b _0806BAE0
_0806BADA:
	bl ScriptContext1_Stop
	movs r0, 0x1
_0806BAE0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoice

	thumb_func_start ScrCmd_multichoicedefault
ScrCmd_multichoicedefault: @ 806BAE8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl ScriptMenu_MultichoiceWithDefault
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BB26
	movs r0, 0
	b _0806BB2C
_0806BB26:
	bl ScriptContext1_Stop
	movs r0, 0x1
_0806BB2C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoicedefault

	thumb_func_start sub_806BB38
sub_806BB38: @ 806BB38
	movs r0, 0
	bx lr
	thumb_func_end sub_806BB38

	thumb_func_start ScrCmd_multichoicegrid
ScrCmd_multichoicegrid: @ 806BB3C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl sub_809CEC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BB7A
	movs r0, 0
	b _0806BB80
_0806BB7A:
	bl ScriptContext1_Stop
	movs r0, 0x1
_0806BB80:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoicegrid

	thumb_func_start sub_806BB8C
sub_806BB8C: @ 806BB8C
	ldr r1, [r0, 0x8]
	adds r1, 0x4
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_806BB8C

	thumb_func_start sub_806BB98
sub_806BB98: @ 806BB98
	movs r0, 0
	bx lr
	thumb_func_end sub_806BB98

	thumb_func_start sub_806BB9C
sub_806BB9C: @ 806BB9C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r4, 0
	bl sub_809D2F0
	adds r0, r4, 0
	movs r1, 0
	bl PlayCry7
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806BB9C

	thumb_func_start sub_806BBD8
sub_806BBD8: @ 806BBD8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809D3CC
	adds r1, r0, 0
	cmp r1, 0
	beq _0806BBF0
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	b _0806BBF2
_0806BBF0:
	movs r0, 0
_0806BBF2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806BBD8

	thumb_func_start sub_806BBF8
sub_806BBF8: @ 806BBF8
	ldr r1, [r0, 0x8]
	adds r1, 0x1
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_806BBF8

	thumb_func_start sub_806BC04
sub_806BC04: @ 806BC04
	push {r4,r5,lr}
	sub sp, 0xC
	adds r5, r0, 0
	bl ScriptReadWord
	adds r4, r0, 0
	cmp r4, 0
	bne _0806BC16
	ldr r4, [r5, 0x64]
_0806BC16:
	bl sub_80F6E9C
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6EE4
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r1, 0x6
	adds r2, r4, 0
	movs r3, 0
	bl AddTextPrinterParameterized
	movs r0, 0
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806BC04

	thumb_func_start sub_806BC40
sub_806BC40: @ 806BC40
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	cmp r1, 0
	bne _0806BC50
	ldr r1, [r4, 0x64]
_0806BC50:
	ldr r4, _0806BC68 @ =gSpecialVar_0x8004
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x6
	bl GetStringWidth
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BC68: .4byte gSpecialVar_0x8004
	thumb_func_end sub_806BC40

	thumb_func_start ScrCmd_vmessage
ScrCmd_vmessage: @ 806BC6C
	push {lr}
	bl ScriptReadWord
	ldr r1, _0806BC84 @ =gVScriptOffset
	ldr r1, [r1]
	subs r0, r1
	bl ShowFieldMessage
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806BC84: .4byte gVScriptOffset
	thumb_func_end ScrCmd_vmessage

	thumb_func_start ScrCmd_bufferspeciesname
ScrCmd_bufferspeciesname: @ 806BC88
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0806BCC0 @ =sScriptStringVars
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xB
	muls r1, r0
	ldr r0, _0806BCC4 @ =gSpeciesNames
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BCC0: .4byte sScriptStringVars
_0806BCC4: .4byte gSpeciesNames
	thumb_func_end ScrCmd_bufferspeciesname

	thumb_func_start ScrCmd_bufferleadmonspeciesname
ScrCmd_bufferleadmonspeciesname: @ 806BCC8
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldr r0, _0806BD08 @ =sScriptStringVars
	lsls r2, 2
	adds r2, r0
	ldr r4, [r2]
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806BD0C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _0806BD10 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BD08: .4byte sScriptStringVars
_0806BD0C: .4byte gPlayerParty
_0806BD10: .4byte gSpeciesNames
	thumb_func_end ScrCmd_bufferleadmonspeciesname

	thumb_func_start ScrCmd_bufferpartymonnick
ScrCmd_bufferpartymonnick: @ 806BD14
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806BD54 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0806BD58 @ =sScriptStringVars
	lsls r4, 2
	adds r4, r1
	ldr r4, [r4]
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BD54: .4byte gPlayerParty
_0806BD58: .4byte sScriptStringVars
	thumb_func_end ScrCmd_bufferpartymonnick

	thumb_func_start ScrCmd_bufferitemname
ScrCmd_bufferitemname: @ 806BD5C
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0806BD8C @ =sScriptStringVars
	lsls r4, 2
	adds r4, r1
	ldr r1, [r4]
	bl sub_8099E90
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BD8C: .4byte sScriptStringVars
	thumb_func_end ScrCmd_bufferitemname

	thumb_func_start sub_806BD90
sub_806BD90: @ 806BD90
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r7, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _0806BDE4 @ =sScriptStringVars
	lsls r0, r7, 2
	adds r0, r1
	ldr r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8099E90
	cmp r5, 0x4
	bne _0806BDEC
	cmp r6, 0x1
	bls _0806BDEC
	ldr r1, _0806BDE8 @ =gUnknown_83A72A0
	adds r0, r4, 0
	bl StringAppend
	b _0806BE22
	.align 2, 0
_0806BDE4: .4byte sScriptStringVars
_0806BDE8: .4byte gUnknown_83A72A0
_0806BDEC:
	adds r0, r5, 0
	subs r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x29
	bhi _0806BE22
	cmp r6, 0x1
	bls _0806BE22
	ldr r0, _0806BE2C @ =sScriptStringVars
	lsls r1, r7, 2
	adds r1, r0
	ldr r4, [r1]
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _0806BE22
	adds r0, r4, r0
	subs r0, 0x1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, _0806BE30 @ =gUnknown_83A72A2
	adds r0, r4, 0
	bl StringAppend
_0806BE22:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806BE2C: .4byte sScriptStringVars
_0806BE30: .4byte gUnknown_83A72A2
	thumb_func_end sub_806BD90

	thumb_func_start sub_806BE34
sub_806BE34: @ 806BE34
	push {lr}
	ldr r1, [r0, 0x8]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806BE34

	thumb_func_start ScrCmd_buffermovename
ScrCmd_buffermovename: @ 806BE50
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0806BE88 @ =sScriptStringVars
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xD
	muls r1, r0
	ldr r0, _0806BE8C @ =gMoveNames
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BE88: .4byte sScriptStringVars
_0806BE8C: .4byte gMoveNames
	thumb_func_end ScrCmd_buffermovename

	thumb_func_start ScrCmd_buffernumberstring
ScrCmd_buffernumberstring: @ 806BE90
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_80CBF04
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0806BED0 @ =sScriptStringVars
	lsls r5, 2
	adds r5, r0
	ldr r0, [r5]
	adds r1, r4, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806BED0: .4byte sScriptStringVars
	thumb_func_end ScrCmd_buffernumberstring

	thumb_func_start ScrCmd_bufferstdstring
ScrCmd_bufferstdstring: @ 806BED4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	ldr r1, _0806BF0C @ =sScriptStringVars
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	ldr r1, _0806BF10 @ =gUnknown_83E06B8
	lsrs r0, 14
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BF0C: .4byte sScriptStringVars
_0806BF10: .4byte gUnknown_83E06B8
	thumb_func_end ScrCmd_bufferstdstring

	thumb_func_start ScrCmd_bufferstring
ScrCmd_bufferstring: @ 806BF14
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _0806BF38 @ =sScriptStringVars
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BF38: .4byte sScriptStringVars
	thumb_func_end ScrCmd_bufferstring

	thumb_func_start ScrCmd_vloadword
ScrCmd_vloadword: @ 806BF3C
	push {lr}
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _0806BF58 @ =gVScriptOffset
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _0806BF5C @ =gStringVar4
	bl StringExpandPlaceholders
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806BF58: .4byte gVScriptOffset
_0806BF5C: .4byte gStringVar4
	thumb_func_end ScrCmd_vloadword

	thumb_func_start ScrCmd_vbufferstring
ScrCmd_vbufferstring: @ 806BF60
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _0806BF8C @ =gVScriptOffset
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _0806BF90 @ =sScriptStringVars
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BF8C: .4byte gVScriptOffset
_0806BF90: .4byte sScriptStringVars
	thumb_func_end ScrCmd_vbufferstring

	thumb_func_start ScrCmd_bufferboxname
ScrCmd_bufferboxname: @ 806BF94
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _0806BFCC @ =sScriptStringVars
	lsls r4, 2
	adds r4, r1
	ldr r4, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BFCC: .4byte sScriptStringVars
	thumb_func_end ScrCmd_bufferboxname

	thumb_func_start ScrCmd_givemon
ScrCmd_givemon: @ 806BFD0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl ScriptReadWord
	mov r8, r0
	adds r0, r4, 0
	bl ScriptReadWord
	ldr r1, [r4, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	ldr r4, _0806C04C @ =gSpecialVar_Result
	str r0, [sp]
	str r2, [sp, 0x4]
	adds r0, r6, 0
	mov r1, r9
	adds r2, r5, 0
	mov r3, r8
	bl ScriptGiveMon
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806C04C: .4byte gSpecialVar_Result
	thumb_func_end ScrCmd_givemon

	thumb_func_start ScrCmd_giveegg
ScrCmd_giveegg: @ 806C050
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0806C078 @ =gSpecialVar_Result
	bl sub_80A01AC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C078: .4byte gSpecialVar_Result
	thumb_func_end ScrCmd_giveegg

	thumb_func_start ScrCmd_setmonmove
ScrCmd_setmonmove: @ 806C07C
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl ScriptSetMonMoveSlot
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setmonmove

	thumb_func_start ScrCmd_checkpartymove
ScrCmd_checkpartymove: @ 806C0A8
	push {r4-r7,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r1, _0806C0BC @ =gSpecialVar_Result
	movs r0, 0x6
	strh r0, [r1]
	movs r6, 0
	b _0806C0F6
	.align 2, 0
_0806C0BC: .4byte gSpecialVar_Result
_0806C0C0:
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806C0F0
	adds r0, r4, 0
	adds r1, r7, 0
	bl pokemon_has_move
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806C0F0
	ldr r0, _0806C0E8 @ =gSpecialVar_Result
	strh r6, [r0]
	ldr r0, _0806C0EC @ =gSpecialVar_0x8004
	strh r5, [r0]
	b _0806C116
	.align 2, 0
_0806C0E8: .4byte gSpecialVar_Result
_0806C0EC: .4byte gSpecialVar_0x8004
_0806C0F0:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0806C0F6:
	cmp r6, 0x5
	bhi _0806C116
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _0806C120 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _0806C0C0
_0806C116:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806C120: .4byte gPlayerParty
	thumb_func_end ScrCmd_checkpartymove

	thumb_func_start ScrCmd_givemoney
ScrCmd_givemoney: @ 806C124
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _0806C14A
	ldr r0, _0806C154 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	adds r1, r2, 0
	bl AddMoney
_0806C14A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C154: .4byte gSaveBlock1Ptr
	thumb_func_end ScrCmd_givemoney

	thumb_func_start ScrCmd_takemoney
ScrCmd_takemoney: @ 806C158
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _0806C17E
	ldr r0, _0806C188 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	adds r1, r2, 0
	bl RemoveMoney
_0806C17E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C188: .4byte gSaveBlock1Ptr
	thumb_func_end ScrCmd_takemoney

	thumb_func_start ScrCmd_checkmoney
ScrCmd_checkmoney: @ 806C18C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _0806C1BA
	ldr r4, _0806C1C4 @ =gSpecialVar_Result
	ldr r0, _0806C1C8 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	adds r1, r2, 0
	bl IsEnoughMoney
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_0806C1BA:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C1C4: .4byte gSpecialVar_Result
_0806C1C8: .4byte gSaveBlock1Ptr
	thumb_func_end ScrCmd_checkmoney

	thumb_func_start sub_806C1CC
sub_806C1CC: @ 806C1CC
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _0806C20A
	ldr r0, _0806C214 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806C20A
	ldr r0, _0806C218 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl GetMoney
	adds r1, r5, 0
	adds r2, r4, 0
	bl DrawMoneyBox
_0806C20A:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806C214: .4byte sub_809D6D4
_0806C218: .4byte gSaveBlock1Ptr
	thumb_func_end sub_806C1CC

	thumb_func_start sub_806C21C
sub_806C21C: @ 806C21C
	push {lr}
	bl HideMoneyBox
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C21C

	thumb_func_start sub_806C228
sub_806C228: @ 806C228
	push {lr}
	ldr r1, [r0, 0x8]
	adds r1, 0x1
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _0806C24E
	ldr r0, _0806C254 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl GetMoney
	bl ChangeAmountInMoneyBox
_0806C24E:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C254: .4byte gSaveBlock1Ptr
	thumb_func_end sub_806C228

	thumb_func_start sub_806C258
sub_806C258: @ 806C258
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldr r0, _0806C290 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806C286
	bl GetCoins
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	adds r2, r4, 0
	bl ShowCoinsWindow
_0806C286:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806C290: .4byte sub_809D6D4
	thumb_func_end sub_806C258

	thumb_func_start ScrCmd_hidecoinsbox
ScrCmd_hidecoinsbox: @ 806C294
	push {lr}
	ldr r1, [r0, 0x8]
	adds r1, 0x2
	str r1, [r0, 0x8]
	bl HideCoinsWindow
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hidecoinsbox

	thumb_func_start ScrCmd_updatecoinsbox
ScrCmd_updatecoinsbox: @ 806C2A8
	push {lr}
	ldr r1, [r0, 0x8]
	adds r1, 0x2
	str r1, [r0, 0x8]
	bl GetCoins
	lsls r0, 16
	lsrs r0, 16
	bl PrintCoinsString
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_updatecoinsbox

	thumb_func_start ScrCmd_trainerbattle
ScrCmd_trainerbattle: @ 806C2C4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	bl sub_8080228
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_trainerbattle

	thumb_func_start sub_806C2D8
sub_806C2D8: @ 806C2D8
	push {lr}
	bl sub_8080464
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C2D8

	thumb_func_start ScrCmd_ontrainerbattleend
ScrCmd_ontrainerbattleend: @ 806C2E4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80805E8
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_ontrainerbattleend

	thumb_func_start ScrCmd_ontrainerbattleendgoto
ScrCmd_ontrainerbattleendgoto: @ 806C2F8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8080600
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_ontrainerbattleendgoto

	thumb_func_start ScrCmd_checktrainerflag
ScrCmd_checktrainerflag: @ 806C30C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl HasTrainerAlreadyBeenFought
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_checktrainerflag

	thumb_func_start ScrCmd_settrainerflag
ScrCmd_settrainerflag: @ 806C330
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_set
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_settrainerflag

	thumb_func_start ScrCmd_cleartrainerflag
ScrCmd_cleartrainerflag: @ 806C34C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_clear
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_cleartrainerflag

	thumb_func_start ScrCmd_setwildbattle
ScrCmd_setwildbattle: @ 806C368
	push {r4-r6,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r0, [r4, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadHalfword
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl CreateScriptedWildMon
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setwildbattle

	thumb_func_start sub_806C39C
sub_806C39C: @ 806C39C
	push {lr}
	bl sub_807F8C4
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C39C

	thumb_func_start sub_806C3AC
sub_806C3AC: @ 806C3AC
	push {lr}
	bl ScriptReadWord
	bl sub_809C164
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C3AC

	thumb_func_start sub_806C3C0
sub_806C3C0: @ 806C3C0
	push {lr}
	bl ScriptReadWord
	bl sub_809C1A0
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C3C0

	thumb_func_start sub_806C3D4
sub_806C3D4: @ 806C3D4
	push {lr}
	bl ScriptReadWord
	bl sub_809C1BC
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C3D4

	thumb_func_start ScrCmd_playslotmachine
ScrCmd_playslotmachine: @ 806C3E8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806C40C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl sub_813F804
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806C40C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end ScrCmd_playslotmachine

	thumb_func_start sub_806C410
sub_806C410: @ 806C410
	movs r0, 0
	bx lr
	thumb_func_end sub_806C410

	thumb_func_start sub_806C414
sub_806C414: @ 806C414
	movs r0, 0
	bx lr
	thumb_func_end sub_806C414

	thumb_func_start sub_806C418
sub_806C418: @ 806C418
	push {lr}
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C418

	thumb_func_start sub_806C424
sub_806C424: @ 806C424
	movs r0, 0
	bx lr
	thumb_func_end sub_806C424

	thumb_func_start sub_806C428
sub_806C428: @ 806C428
	movs r0, 0
	bx lr
	thumb_func_end sub_806C428

	thumb_func_start sub_806C42C
sub_806C42C: @ 806C42C
	movs r0, 0
	bx lr
	thumb_func_end sub_806C42C

	thumb_func_start ScrCmd_dofieldeffect
ScrCmd_dofieldeffect: @ 806C430
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0806C454 @ =gUnknown_20370B6
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl FieldEffectStart
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C454: .4byte gUnknown_20370B6
	thumb_func_end ScrCmd_dofieldeffect

	thumb_func_start ScrCmd_setfieldeffectarg
ScrCmd_setfieldeffectarg: @ 806C458
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _0806C484 @ =gFieldEffectArguments
	lsls r4, 2
	adds r4, r1
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C484: .4byte gFieldEffectArguments
	thumb_func_end ScrCmd_setfieldeffectarg

	thumb_func_start WaitForFieldEffectFinish
WaitForFieldEffectFinish: @ 806C488
	push {lr}
	ldr r0, _0806C49C @ =gUnknown_20370B6
	ldrb r0, [r0]
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	beq _0806C4A0
	movs r0, 0
	b _0806C4A2
	.align 2, 0
_0806C49C: .4byte gUnknown_20370B6
_0806C4A0:
	movs r0, 0x1
_0806C4A2:
	pop {r1}
	bx r1
	thumb_func_end WaitForFieldEffectFinish

	thumb_func_start ScrCmd_waitfieldeffect
ScrCmd_waitfieldeffect: @ 806C4A8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _0806C4CC @ =gUnknown_20370B6
	strh r0, [r1]
	ldr r1, _0806C4D0 @ =WaitForFieldEffectFinish
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C4CC: .4byte gUnknown_20370B6
_0806C4D0: .4byte WaitForFieldEffectFinish
	thumb_func_end ScrCmd_waitfieldeffect

	thumb_func_start ScrCmd_setrespawn
ScrCmd_setrespawn: @ 806C4D4
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl sub_80554CC
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setrespawn

	thumb_func_start ScrCmd_checkplayergender
ScrCmd_checkplayergender: @ 806C4F0
	ldr r1, _0806C500 @ =gSpecialVar_Result
	ldr r0, _0806C504 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	strh r0, [r1]
	movs r0, 0
	bx lr
	.align 2, 0
_0806C500: .4byte gSpecialVar_Result
_0806C504: .4byte gSaveBlock2Ptr
	thumb_func_end ScrCmd_checkplayergender

	thumb_func_start ScrCmd_playmoncry
ScrCmd_playmoncry: @ 806C508
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl PlayCry7
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_playmoncry

	thumb_func_start sub_806C540
sub_806C540: @ 806C540
	push {lr}
	ldr r1, _0806C550 @ =IsCryFinished
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806C550: .4byte IsCryFinished
	thumb_func_end sub_806C540

	thumb_func_start ScrCmd_setmetatile
ScrCmd_setmetatile: @ 806C554
	push {r4-r7,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	adds r1, r6, 0x7
	lsls r1, 16
	lsrs r6, r1, 16
	adds r1, r5, 0x7
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r0, 0
	bne _0806C5B8
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl MapGridSetMetatileIdAt
	b _0806C5CA
_0806C5B8:
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r2, r7, 0
	orrs r2, r0
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_0806C5CA:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setmetatile

	thumb_func_start ScrCmd_opendoor
ScrCmd_opendoor: @ 806C5D4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	adds r5, 0x7
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r4, r0
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805B364
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805B310
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_opendoor

	thumb_func_start ScrCmd_closedoor
ScrCmd_closedoor: @ 806C62C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805B2D0
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_closedoor

	thumb_func_start sub_806C670
sub_806C670: @ 806C670
	push {lr}
	bl sub_805B350
	lsls r0, 24
	cmp r0, 0
	beq _0806C680
	movs r0, 0
	b _0806C682
_0806C680:
	movs r0, 0x1
_0806C682:
	pop {r1}
	bx r1
	thumb_func_end sub_806C670

	thumb_func_start sub_806C688
sub_806C688: @ 806C688
	push {lr}
	ldr r1, _0806C698 @ =sub_806C670
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806C698: .4byte sub_806C670
	thumb_func_end sub_806C688

	thumb_func_start ScrCmd_setdooropen
ScrCmd_setdooropen: @ 806C69C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805B268
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdooropen

	thumb_func_start ScrCmd_setdoorclosed
ScrCmd_setdoorclosed: @ 806C6E0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805B29C
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdoorclosed

	thumb_func_start sub_806C724
sub_806C724: @ 806C724
	movs r0, 0
	bx lr
	thumb_func_end sub_806C724

	thumb_func_start sub_806C728
sub_806C728: @ 806C728
	movs r0, 0
	bx lr
	thumb_func_end sub_806C728

	thumb_func_start ScrCmd_checkcoins
ScrCmd_checkcoins: @ 806C72C
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	bl GetCoins
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_checkcoins

	thumb_func_start ScrCmd_givecoins
ScrCmd_givecoins: @ 806C74C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GiveCoins
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806C774
	ldr r1, _0806C770 @ =gSpecialVar_Result
	movs r0, 0
	b _0806C778
	.align 2, 0
_0806C770: .4byte gSpecialVar_Result
_0806C774:
	ldr r1, _0806C780 @ =gSpecialVar_Result
	movs r0, 0x1
_0806C778:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C780: .4byte gSpecialVar_Result
	thumb_func_end ScrCmd_givecoins

	thumb_func_start ScrCmd_takecoins
ScrCmd_takecoins: @ 806C784
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl TakeCoins
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806C7AC
	ldr r1, _0806C7A8 @ =gSpecialVar_Result
	movs r0, 0
	b _0806C7B0
	.align 2, 0
_0806C7A8: .4byte gSpecialVar_Result
_0806C7AC:
	ldr r1, _0806C7B8 @ =gSpecialVar_Result
	movs r0, 0x1
_0806C7B0:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C7B8: .4byte gSpecialVar_Result
	thumb_func_end ScrCmd_takecoins

	thumb_func_start sub_806C7BC
sub_806C7BC: @ 806C7BC
	push {lr}
	bl sub_8069A20
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C7BC

	thumb_func_start sub_806C7C8
sub_806C7C8: @ 806C7C8
	push {lr}
	bl sub_8069A2C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C7C8

	thumb_func_start ScrCmd_setmonobedient
ScrCmd_setmonobedient: @ 806C7D4
	push {lr}
	sub sp, 0x4
	movs r2, 0x1
	mov r1, sp
	strb r2, [r1]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806C808 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x50
	mov r2, sp
	bl SetMonData
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_0806C808: .4byte gPlayerParty
	thumb_func_end ScrCmd_setmonobedient

	thumb_func_start ScrCmd_checkmonobedience
ScrCmd_checkmonobedience: @ 806C80C
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0806C83C @ =gSpecialVar_Result
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806C840 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x50
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C83C: .4byte gSpecialVar_Result
_0806C840: .4byte gPlayerParty
	thumb_func_end ScrCmd_checkmonobedience

	thumb_func_start sub_806C844
sub_806C844: @ 806C844
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	mov r1, sp
	strb r2, [r1]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r3, 0x5
	bhi _0806C87A
	movs r0, 0x64
	muls r0, r3
	ldr r1, _0806C884 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	mov r2, sp
	bl SetMonData
_0806C87A:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C884: .4byte gPlayerParty
	thumb_func_end sub_806C844

	.align 2, 0 @ Don't pad with nop.
