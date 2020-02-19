	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
	ldr r0, _08081E98 @ =gTasks
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
_08081E98: .4byte gTasks
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
	ldr r1, _08081ED8 @ =gTasks
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
_08081ED8: .4byte gTasks
	thumb_func_end sub_8081E9C

	thumb_func_start RunTrainerSeeFuncList
RunTrainerSeeFuncList: @ 8081EDC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08081F08 @ =gTasks
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
_08081F08: .4byte gTasks
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
	ldr r1, _08081F8C @ =gFieldEffectArguments
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl ObjectEventGetLocalIdAndMap
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
	bl ObjectEventSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
_08081F82:
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08081F8C: .4byte gFieldEffectArguments
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
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _08081FEE
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
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
	bl ObjectEventSetHeldMovement
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
	b _08082022
_08082014:
	adds r0, r4, 0
	movs r1, 0x4A
	bl ObjectEventSetHeldMovement
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
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _0808204A
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _080820AC
_0808204A:
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetTrainerFacingDirectionMovementType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetTrainerMovementType
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetTrainerFacingDirectionMovementType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805FE7C
	adds r0, r4, 0
	bl sub_805FE5C
	ldr r0, _080820B4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080820B8 @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _080820A2
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
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
_080820B4: .4byte gPlayerAvatar
_080820B8: .4byte gObjectEvents
	thumb_func_end sub_808202C

	thumb_func_start sub_80820BC
sub_80820BC: @ 80820BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080820F8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080820FC @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _080820E8
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
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
_080820F8: .4byte gPlayerAvatar
_080820FC: .4byte gObjectEvents
	thumb_func_end sub_80820BC

	thumb_func_start sub_8082100
sub_8082100: @ 8082100
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _0808211E
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808212C
_0808211E:
	adds r0, r4, 0
	movs r1, 0x67
	bl ObjectEventSetHeldMovement
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
	bl ObjectEventClearHeldMovementIfFinished
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
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _0808216E
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808217C
_0808216E:
	adds r0, r4, 0
	movs r1, 0x4A
	bl ObjectEventSetHeldMovement
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
	bl ObjectEventCheckHeldMovementStatus
	lsls r0, 24
	cmp r0, 0
	beq _080821CA
	ldr r2, _080821D4 @ =gFieldEffectArguments
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	ldr r3, _080821D8 @ =gSprites
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
_080821D4: .4byte gFieldEffectArguments
_080821D8: .4byte gSprites
	thumb_func_end sub_8082184

	thumb_func_start sub_80821DC
sub_80821DC: @ 80821DC
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r2, _0808224C @ =gSprites
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
	bl ObjectEventClearHeldMovementIfFinished
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_806413C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08082244:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808224C: .4byte gSprites
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
	ldr r0, _080822C4 @ =gSaveBlock1Ptr
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
	bl SpawnSpecialObjectEventParameterized
	ldr r2, _080822C8 @ =gObjectEvents
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
_080822C4: .4byte gSaveBlock1Ptr
_080822C8: .4byte gObjectEvents
	thumb_func_end sub_808226C

	thumb_func_start sub_80822CC
sub_80822CC: @ 80822CC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, _08082348 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _0808234C @ =gObjectEvents
	adds r0, r4
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _08082312
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl ObjectEventClearHeldMovementIfFinished
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
	ldr r0, _0808234C @ =gObjectEvents
	adds r4, r0
	movs r0, 0x2
	bl sub_8063FB0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
	ldrh r0, [r5, 0x12]
	adds r0, 0x1
	strh r0, [r5, 0x12]
	b _0808236E
	.align 2, 0
_08082348: .4byte gSaveBlock1Ptr
_0808234C: .4byte gObjectEvents
_08082350:
	ldr r1, _08082378 @ =gFieldEffectArguments
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r6, 0
	bl ObjectEventGetLocalIdAndMap
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
_08082378: .4byte gFieldEffectArguments
	thumb_func_end sub_80822CC

	thumb_func_start sub_808237C
sub_808237C: @ 808237C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	ldr r0, _08082404 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
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
	ldr r4, _08082408 @ =gObjectEvents
	adds r0, r4
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _080823CC
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl ObjectEventClearHeldMovementIfFinished
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
	ldr r0, _08082408 @ =gObjectEvents
	adds r4, r0
	movs r0, 0x1
	bl sub_8063FB0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
	ldrh r0, [r5, 0x12]
	adds r0, 0x1
	strh r0, [r5, 0x12]
	b _0808242E
	.align 2, 0
_08082404: .4byte gSaveBlock1Ptr
_08082408: .4byte gObjectEvents
_0808240C:
	bl GetPlayerAvatarObjectId
	lsls r0, 24
	lsrs r0, 24
	bl CameraObjectSetFollowedObjectId
	ldr r0, _08082438 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	bl RemoveObjectEventByLocalIdAndMap
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
_08082438: .4byte gSaveBlock1Ptr
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
	ldr r1, _080824D0 @ =gTasks
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
	bl ObjectEventClearAnim
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
	bl GetTrainerFacingDirectionMovementType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetTrainerMovementType
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetTrainerFacingDirectionMovementType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805FE7C
	adds r0, r5, 0
	bl DestroyTask
	b _080824E2
	.align 2, 0
_080824D0: .4byte gTasks
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
	ldr r1, _0808251C @ =gTasks+0x8
	adds r0, r1
	adds r0, 0x2
	adds r1, r4, 0
	bl StoreWordInTwoHalfwords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082518: .4byte sub_808243C
_0808251C: .4byte gTasks+0x8
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
	ldr r1, _08082578 @ =gSprites
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
_08082578: .4byte gSprites
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
	ldr r1, _080825B0 @ =gSprites
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
_080825B0: .4byte gSprites
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
	ldr r1, _080825E8 @ =gSprites
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
_080825E8: .4byte gSprites
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
	ldr r1, _08082620 @ =gSprites
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
_08082620: .4byte gSprites
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
	ldr r1, _08082658 @ =gSprites
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
_08082658: .4byte gSprites
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
	ldr r4, _080826A0 @ =gFieldEffectArguments
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
_080826A0: .4byte gFieldEffectArguments
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
	bl TryGetObjectEventIdByLocalIdAndMap
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
	ldr r2, _0808272C @ =gObjectEvents
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
	ldr r0, _08082730 @ =gSprites
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
_0808272C: .4byte gObjectEvents
_08082730: .4byte gSprites
_08082734:
	strh r2, [r4, 0x34]
_08082736:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end objc_exclamation_mark_probably

	.align 2, 0 @ Don't pad with nop.
