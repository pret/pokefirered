	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8081B30
sub_8081B30: @ 8081B30
	push {r4,r5,lr}
	bl sub_8111C2C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081B44
	b _08081B78
_08081B40:
	movs r0, 0x1
	b _08081B7A
_08081B44:
	movs r4, 0
	ldr r5, _08081B80 @ =gUnknown_2036E38
_08081B48:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08081B6E
	ldrb r0, [r1, 0x7]
	cmp r0, 0x1
	beq _08081B62
	cmp r0, 0x3
	bne _08081B6E
_08081B62:
	adds r0, r4, 0
	bl sub_8081B84
	lsls r0, 24
	cmp r0, 0
	bne _08081B40
_08081B6E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08081B48
_08081B78:
	movs r0, 0
_08081B7A:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08081B80: .4byte gUnknown_2036E38
	thumb_func_end sub_8081B30

	thumb_func_start sub_8081B84
sub_8081B84: @ 8081B84
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
	adds r6, r0, 0
	bl GetTrainerFlagFromScriptPointer
	cmp r0, 0
	bne _08081BE4
	lsls r4, r5, 3
	adds r0, r4, r5
	lsls r0, 2
	ldr r1, _08081BE0 @ =gUnknown_2036E38
	adds r0, r1
	bl sub_8081BEC
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	beq _08081BE4
	ldrb r0, [r6, 0x1]
	cmp r0, 0x4
	bne _08081BC0
	bl GetMonsStateToDoubles
	lsls r0, 24
	cmp r0, 0
	bne _08081BE4
_08081BC0:
	adds r0, r5, 0
	adds r1, r6, 0
	bl TrainerWantsBattle
	adds r0, r4, r5
	lsls r0, 2
	ldr r1, _08081BE0 @ =gUnknown_2036E38
	adds r0, r1
	subs r1, r7, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl sub_8081E68
	movs r0, 0x1
	b _08081BE6
	.align 2, 0
_08081BE0: .4byte gUnknown_2036E38
_08081BE4:
	movs r0, 0
_08081BE6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8081B84

	thumb_func_start sub_8081BEC
sub_8081BEC: @ 8081BEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldrb r0, [r7, 0x7]
	mov r8, r4
	cmp r0, 0x1
	bne _08081C4C
	ldr r1, _08081C44 @ =gUnknown_83C7248
	ldrb r0, [r7, 0x18]
	lsls r0, 28
	lsrs r0, 26
	subs r0, 0x4
	adds r0, r1
	ldrb r1, [r7, 0x1D]
	mov r2, sp
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r5, 0
	ldrsh r3, [r4, r5]
	ldr r4, [r0]
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r2, [r7, 0x18]
	lsls r2, 28
	lsrs r2, 28
	adds r0, r7, 0
	adds r1, r6, 0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, 24
	lsrs r0, 24
	b _08081C8C
	.align 2, 0
_08081C44: .4byte gUnknown_83C7248
_08081C48:
	adds r0, r6, 0
	b _08081C8C
_08081C4C:
	movs r5, 0
_08081C4E:
	ldr r0, _08081C98 @ =gUnknown_83C7248
	lsls r4, r5, 2
	adds r4, r0
	ldrb r1, [r7, 0x1D]
	mov r0, sp
	movs r6, 0
	ldrsh r2, [r0, r6]
	mov r0, r8
	movs r6, 0
	ldrsh r3, [r0, r6]
	ldr r4, [r4]
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, 24
	cmp r0, 0
	bne _08081C48
	adds r5, r4, 0
	cmp r5, 0x3
	bls _08081C4E
	movs r0, 0
_08081C8C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08081C98: .4byte gUnknown_83C7248
	thumb_func_end sub_8081BEC

	thumb_func_start sub_8081C9C
sub_8081C9C: @ 8081C9C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 16
	lsrs r5, r3, 16
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	bne _08081CE4
	lsls r0, r5, 16
	asrs r2, r0, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r2, r0
	ble _08081CE4
	lsls r1, 16
	asrs r1, 16
	adds r0, r1
	cmp r2, r0
	bgt _08081CE4
	cmp r1, 0x3
	ble _08081CDA
	bl sub_805DF30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _08081CE4
_08081CDA:
	ldrb r0, [r4, 0x12]
	subs r0, r5, r0
	lsls r0, 24
	lsrs r0, 24
	b _08081CE6
_08081CE4:
	movs r0, 0
_08081CE6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8081C9C

	thumb_func_start IsTrainerInRangeNorth
IsTrainerInRangeNorth: @ 8081CEC
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 16
	lsrs r5, r3, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	bne _08081D26
	lsls r0, r5, 16
	asrs r2, r0, 16
	ldrh r3, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r2, r0
	bge _08081D26
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	subs r1, r0
	cmp r2, r1
	blt _08081D26
	subs r0, r3, r5
	lsls r0, 24
	lsrs r0, 24
	b _08081D28
_08081D26:
	movs r0, 0
_08081D28:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeNorth

	thumb_func_start IsTrainerInRangeWest
IsTrainerInRangeWest: @ 8081D30
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r3, 16
	asrs r3, 16
	cmp r0, r3
	bne _08081D6A
	lsls r0, r5, 16
	asrs r3, r0, 16
	ldrh r2, [r4, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _08081D6A
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	subs r1, r0
	cmp r3, r1
	blt _08081D6A
	subs r0, r2, r5
	lsls r0, 24
	lsrs r0, 24
	b _08081D6C
_08081D6A:
	movs r0, 0
_08081D6C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeWest

	thumb_func_start IsTrainerInRangeEast
IsTrainerInRangeEast: @ 8081D74
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r3, 16
	asrs r3, 16
	cmp r0, r3
	bne _08081DAE
	lsls r0, r5, 16
	asrs r3, r0, 16
	ldrh r2, [r4, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _08081DAE
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	cmp r3, r1
	bgt _08081DAE
	subs r0, r5, r2
	lsls r0, 24
	lsrs r0, 24
	b _08081DB0
_08081DAE:
	movs r0, 0
_08081DB0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeEast

	thumb_func_start CheckPathBetweenTrainerAndPlayer
CheckPathBetweenTrainerAndPlayer: @ 8081DB8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r7, r2, 24
	cmp r1, 0
	beq _08081E54
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r1, sp
	adds r1, 0x2
	strh r0, [r1]
	movs r4, 0
	mov r8, r1
	mov r5, r9
	subs r5, 0x1
	cmp r4, r5
	bgt _08081E26
_08081DEC:
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r0, r6, 0
	adds r3, r7, 0
	bl sub_8063770
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08081E12
	movs r0, 0x2
	negs r0, r0
	ands r1, r0
	cmp r1, 0
	bne _08081E54
_08081E12:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	mov r1, sp
	mov r2, r8
	bl MoveCoords
	cmp r4, r5
	ble _08081DEC
_08081E26:
	ldrb r4, [r6, 0x19]
	lsls r5, r4, 28
	lsrs r5, 28
	lsrs r4, 4
	movs r0, 0
	strb r0, [r6, 0x19]
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r0, r6, 0
	adds r3, r7, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r4, 4
	orrs r5, r4
	strb r5, [r6, 0x19]
	cmp r1, 0x4
	beq _08081E58
_08081E54:
	movs r0, 0
	b _08081E5A
_08081E58:
	mov r0, r9
_08081E5A:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPathBetweenTrainerAndPlayer

	thumb_func_start sub_8081E68
sub_8081E68: @ 8081E68
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r0, _08081E94 @ =RunTrainerSeeFuncList
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08081E98 @ =gUnknown_3005090
	adds r1, r0
	lsrs r0, r5, 16
	strh r0, [r1, 0xA]
	strh r5, [r1, 0xC]
	strh r4, [r1, 0xE]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081E94: .4byte RunTrainerSeeFuncList
_08081E98: .4byte gUnknown_3005090
	thumb_func_end sub_8081E68

	thumb_func_start sub_8081E9C
sub_8081E9C: @ 8081E9C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _08081ED4 @ =RunTrainerSeeFuncList
	adds r0, r5, 0
	bl FindTaskIdByFunc
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _08081ED8 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x8]
	adds r0, r4, 0
	bl _call_via_r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081ED4: .4byte RunTrainerSeeFuncList
_08081ED8: .4byte gUnknown_3005090
	thumb_func_end sub_8081E9C

	thumb_func_start RunTrainerSeeFuncList
RunTrainerSeeFuncList: @ 8081EDC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08081F08 @ =gUnknown_3005090
	adds r5, r0, r1
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	lsls r4, r0, 16
	ldrh r0, [r5, 0xC]
	orrs r4, r0
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	bne _08081F0C
	adds r0, r6, 0
	bl SwitchTaskToFollowupFunc
	b _08081F28
	.align 2, 0
_08081F08: .4byte gUnknown_3005090
_08081F0C:
	ldr r7, _08081F30 @ =gUnknown_83C7258
_08081F0E:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	lsls r0, 2
	adds r0, r7
	ldr r3, [r0]
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08081F0E
_08081F28:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081F30: .4byte gUnknown_83C7258
	thumb_func_end RunTrainerSeeFuncList

	thumb_func_start sub_8081F34
sub_8081F34: @ 8081F34
	movs r0, 0
	bx lr
	thumb_func_end sub_8081F34

	thumb_func_start sub_8081F38
sub_8081F38: @ 8081F38
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldrb r1, [r4, 0x18]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _08081F54
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x2
	ble _08081F54
	movs r0, 0xC
	b _08081F82
_08081F54:
	ldr r1, _08081F8C @ =gUnknown_20386E0
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063EB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8063CA4
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
_08081F82:
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08081F8C: .4byte gUnknown_20386E0
	thumb_func_end sub_8081F38

	thumb_func_start sub_8081F90
sub_8081F90: @ 8081F90
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	movs r0, 0
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	beq _08081FA6
	movs r0, 0
	b _08081FC8
_08081FA6:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r5, 0x6]
	subs r0, 0x39
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08081FBC
	movs r0, 0x6
	strh r0, [r4, 0x8]
_08081FBC:
	ldrb r0, [r5, 0x6]
	cmp r0, 0x3F
	bne _08081FC6
	movs r0, 0x8
	strh r0, [r4, 0x8]
_08081FC6:
	movs r0, 0x1
_08081FC8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8081F90

	thumb_func_start sub_8081FD0
sub_8081FD0: @ 8081FD0
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08081FEE
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08082022
_08081FEE:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08082014
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8063F84
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8063CA4
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
	b _08082022
_08082014:
	adds r0, r4, 0
	movs r1, 0x4A
	bl sub_8063CA4
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08082022:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8081FD0

	thumb_func_start sub_808202C
sub_808202C: @ 808202C
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0808204A
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080820AC
_0808204A:
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805FE7C
	adds r0, r4, 0
	bl sub_805FE5C
	ldr r0, _080820B4 @ =gUnknown_2037078
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080820B8 @ =gUnknown_2036E38
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080820A2
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080820AC
_080820A2:
	bl sub_805C774
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080820AC:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080820B4: .4byte gUnknown_2037078
_080820B8: .4byte gUnknown_2036E38
	thumb_func_end sub_808202C

	thumb_func_start sub_80820BC
sub_80820BC: @ 80820BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080820F8 @ =gUnknown_2037078
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080820FC @ =gUnknown_2036E38
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080820E8
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080820EE
_080820E8:
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
_080820EE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080820F8: .4byte gUnknown_2037078
_080820FC: .4byte gUnknown_2036E38
	thumb_func_end sub_80820BC

	thumb_func_start sub_8082100
sub_8082100: @ 8082100
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0808211E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808212C
_0808211E:
	adds r0, r4, 0
	movs r1, 0x67
	bl sub_8063CA4
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_0808212C:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082100

	thumb_func_start sub_8082134
sub_8082134: @ 8082134
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r2, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08082148
	movs r0, 0x3
	strh r0, [r4, 0x8]
_08082148:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082134

	thumb_func_start sub_8082150
sub_8082150: @ 8082150
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0808216E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808217C
_0808216E:
	adds r0, r4, 0
	movs r1, 0x4A
	bl sub_8063CA4
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_0808217C:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082150

	thumb_func_start sub_8082184
sub_8082184: @ 8082184
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _080821CA
	ldr r2, _080821D4 @ =gUnknown_20386E0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	ldr r3, _080821D8 @ =gUnknown_202063C
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r5, 0x10]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080821CA:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080821D4: .4byte gUnknown_20386E0
_080821D8: .4byte gUnknown_202063C
	thumb_func_end sub_8082184

	thumb_func_start sub_80821DC
sub_80821DC: @ 80821DC
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r2, _0808224C @ =gUnknown_202063C
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x2B
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _08082244
	ldrb r1, [r4, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_806413C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8063CA4
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08082244:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808224C: .4byte gUnknown_202063C
	thumb_func_end sub_80821DC

	thumb_func_start sub_8082250
sub_8082250: @ 8082250
	push {r4,lr}
	adds r4, r1, 0
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08082264
	movs r0, 0x3
	strh r0, [r4, 0x8]
_08082264:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082250

	thumb_func_start sub_808226C
sub_808226C: @ 808226C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r1, 0
	movs r0, 0
	strh r0, [r4, 0x12]
	ldr r0, _080822C4 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrh r3, [r0]
	adds r3, 0x7
	lsls r3, 16
	asrs r3, 16
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0x12
	movs r1, 0x7
	movs r2, 0x7F
	bl SpawnSpecialFieldObjectParametrized
	ldr r2, _080822C8 @ =gUnknown_2036E38
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1]
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r1, 0x4]
	bl CameraObjectSetFollowedObjectId
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080822C4: .4byte gUnknown_3005008
_080822C8: .4byte gUnknown_2036E38
	thumb_func_end sub_808226C

	thumb_func_start sub_80822CC
sub_80822CC: @ 80822CC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, _08082348 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _0808234C @ =gUnknown_2036E38
	adds r0, r4
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08082312
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808236E
_08082312:
	movs r0, 0x12
	ldrsh r1, [r5, r0]
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	subs r0, 0x1
	cmp r1, r0
	beq _08082350
	mov r0, sp
	ldrb r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0808234C @ =gUnknown_2036E38
	adds r4, r0
	movs r0, 0x2
	bl sub_8063FB0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8063CA4
	ldrh r0, [r5, 0x12]
	adds r0, 0x1
	strh r0, [r5, 0x12]
	b _0808236E
	.align 2, 0
_08082348: .4byte gUnknown_3005008
_0808234C: .4byte gUnknown_2036E38
_08082350:
	ldr r1, _08082378 @ =gUnknown_20386E0
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r6, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	movs r0, 0
	strh r0, [r5, 0x12]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_0808236E:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08082378: .4byte gUnknown_20386E0
	thumb_func_end sub_80822CC

	thumb_func_start sub_808237C
sub_808237C: @ 808237C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	ldr r0, _08082404 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	movs r0, 0
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _0808242E
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _08082408 @ =gUnknown_2036E38
	adds r0, r4
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080823CC
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808242E
_080823CC:
	movs r0, 0x12
	ldrsh r1, [r5, r0]
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	subs r0, 0x1
	cmp r1, r0
	beq _0808240C
	mov r0, sp
	ldrb r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08082408 @ =gUnknown_2036E38
	adds r4, r0
	movs r0, 0x1
	bl sub_8063FB0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8063CA4
	ldrh r0, [r5, 0x12]
	adds r0, 0x1
	strh r0, [r5, 0x12]
	b _0808242E
	.align 2, 0
_08082404: .4byte gUnknown_3005008
_08082408: .4byte gUnknown_2036E38
_0808240C:
	bl GetPlayerAvatarObjectId
	lsls r0, 24
	lsrs r0, 24
	bl CameraObjectSetFollowedObjectId
	ldr r0, _08082438 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	strh r0, [r5, 0x12]
	movs r0, 0x2
	strh r0, [r5, 0x8]
_0808242E:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08082438: .4byte gUnknown_3005008
	thumb_func_end sub_808237C

	thumb_func_start sub_808243C
sub_808243C: @ 808243C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080824D0 @ =gUnknown_3005090
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0xA
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808246E
	ldr r0, [sp]
	bl FieldObjectClearAnim
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_0808246E:
	ldr r1, _080824D4 @ =gUnknown_83C7294
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r2, [sp]
	ldr r3, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r3
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _080824D8
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080824D8
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805FE7C
	adds r0, r5, 0
	bl DestroyTask
	b _080824E2
	.align 2, 0
_080824D0: .4byte gUnknown_3005090
_080824D4: .4byte gUnknown_83C7294
_080824D8:
	ldr r2, [sp]
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
_080824E2:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808243C

	thumb_func_start sub_80824EC
sub_80824EC: @ 80824EC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08082518 @ =sub_808243C
	movs r1, 0
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0808251C @ =gUnknown_3005098
	adds r0, r1
	adds r0, 0x2
	adds r1, r4, 0
	bl StoreWordInTwoHalfwords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082518: .4byte sub_808243C
_0808251C: .4byte gUnknown_3005098
	thumb_func_end sub_80824EC

	thumb_func_start ScrSpecial_EndTrainerApproach
ScrSpecial_EndTrainerApproach: @ 8082520
	push {lr}
	ldr r0, _0808252C @ =sub_8082530
	bl sub_8081E9C
	pop {r0}
	bx r0
	.align 2, 0
_0808252C: .4byte sub_8082530
	thumb_func_end ScrSpecial_EndTrainerApproach

	thumb_func_start sub_8082530
sub_8082530: @ 8082530
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_8082530

	thumb_func_start FldEff_ExclamationMarkIcon1
FldEff_ExclamationMarkIcon1: @ 8082544
	push {lr}
	ldr r0, _08082574 @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x53
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0808256C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08082578 @ =gUnknown_202063C
	adds r0, r1
	movs r1, 0
	movs r2, 0
	bl sub_808265C
_0808256C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08082574: .4byte gUnknown_83C7388
_08082578: .4byte gUnknown_202063C
	thumb_func_end FldEff_ExclamationMarkIcon1

	thumb_func_start sub_808257C
sub_808257C: @ 808257C
	push {lr}
	ldr r0, _080825AC @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080825A4
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080825B0 @ =gUnknown_202063C
	adds r0, r1
	movs r1, 0x42
	movs r2, 0x1
	bl sub_808265C
_080825A4:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080825AC: .4byte gUnknown_83C7388
_080825B0: .4byte gUnknown_202063C
	thumb_func_end sub_808257C

	thumb_func_start sub_80825B4
sub_80825B4: @ 80825B4
	push {lr}
	ldr r0, _080825E4 @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080825DC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080825E8 @ =gUnknown_202063C
	adds r0, r1
	movs r1, 0x2E
	movs r2, 0x2
	bl sub_808265C
_080825DC:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080825E4: .4byte gUnknown_83C7388
_080825E8: .4byte gUnknown_202063C
	thumb_func_end sub_80825B4

	thumb_func_start sub_80825EC
sub_80825EC: @ 80825EC
	push {lr}
	ldr r0, _0808261C @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08082614
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08082620 @ =gUnknown_202063C
	adds r0, r1
	movs r1, 0x40
	movs r2, 0x3
	bl sub_808265C
_08082614:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808261C: .4byte gUnknown_83C7388
_08082620: .4byte gUnknown_202063C
	thumb_func_end sub_80825EC

	thumb_func_start sub_8082624
sub_8082624: @ 8082624
	push {lr}
	ldr r0, _08082654 @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0808264C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08082658 @ =gUnknown_202063C
	adds r0, r1
	movs r1, 0x21
	movs r2, 0x4
	bl sub_808265C
_0808264C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08082654: .4byte gUnknown_83C7388
_08082658: .4byte gUnknown_202063C
	thumb_func_end sub_8082624

	thumb_func_start sub_808265C
sub_808265C: @ 808265C
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldrb r4, [r0, 0x5]
	movs r3, 0xD
	negs r3, r3
	ands r3, r4
	movs r4, 0x4
	orrs r3, r4
	strb r3, [r0, 0x5]
	movs r3, 0x3E
	adds r3, r0
	mov r12, r3
	ldrb r3, [r3]
	movs r4, 0x2
	orrs r3, r4
	mov r4, r12
	strb r3, [r4]
	ldr r4, _080826A0 @ =gUnknown_20386E0
	ldr r3, [r4]
	strh r3, [r0, 0x2E]
	ldr r3, [r4, 0x4]
	strh r3, [r0, 0x30]
	ldr r3, [r4, 0x8]
	strh r3, [r0, 0x32]
	ldr r3, _080826A4 @ =0x0000fffb
	strh r3, [r0, 0x34]
	strh r1, [r0, 0x3C]
	adds r1, r2, 0
	bl StartSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080826A0: .4byte gUnknown_20386E0
_080826A4: .4byte 0x0000fffb
	thumb_func_end sub_808265C

	thumb_func_start objc_exclamation_mark_probably
objc_exclamation_mark_probably: @ 80826A8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080826DA
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080826E8
_080826DA:
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
	b _08082736
_080826E8:
	ldr r2, _0808272C @ =gUnknown_2036E38
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
	ldr r0, _08082730 @ =gUnknown_202063C
	adds r1, r0
	ldrh r3, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r2, r3, r0
	strh r2, [r4, 0x36]
	ldrh r0, [r1, 0x20]
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0x10
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x24]
	strh r0, [r4, 0x24]
	ldrh r0, [r1, 0x26]
	adds r0, r2
	strh r0, [r4, 0x26]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _08082734
	adds r0, r3, 0x1
	strh r0, [r4, 0x34]
	b _08082736
	.align 2, 0
_0808272C: .4byte gUnknown_2036E38
_08082730: .4byte gUnknown_202063C
_08082734:
	strh r2, [r4, 0x34]
_08082736:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end objc_exclamation_mark_probably

	.align 2, 0 @ Don't pad with nop.
