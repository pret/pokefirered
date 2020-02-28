	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	@ These are leftovers from RS
	thumb_func_start FldEff_UseDive
FldEff_UseDive: @ 8084E24
	push {r4,lr}
	ldr r4, _08084E54 @ =Task_Dive
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08084E58 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _08084E5C @ =gFieldEffectArguments
	ldr r2, [r3]
	strh r2, [r1, 0x26]
	ldr r2, [r3, 0x4]
	strh r2, [r1, 0x24]
	bl _call_via_r4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084E54: .4byte Task_Dive
_08084E58: .4byte gTasks
_08084E5C: .4byte gFieldEffectArguments
	thumb_func_end FldEff_UseDive

	thumb_func_start Task_Dive
Task_Dive: @ 8084E60
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08084E90 @ =sDiveFieldEffectFuncPtrs
	ldr r2, _08084E94 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08084E72:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08084E72
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084E90: .4byte sDiveFieldEffectFuncPtrs
_08084E94: .4byte gTasks
	thumb_func_end Task_Dive

	thumb_func_start dive_1_lock
dive_1_lock: @ 8084E98
	ldr r2, _08084EA8 @ =gPlayerAvatar
	movs r1, 0x1
	strb r1, [r2, 0x6]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_08084EA8: .4byte gPlayerAvatar
	thumb_func_end dive_1_lock

	thumb_func_start dive_2_unknown
dive_2_unknown: @ 8084EAC
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _08084ED0 @ =gFieldEffectArguments
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084ED0: .4byte gFieldEffectArguments
	thumb_func_end dive_2_unknown

	thumb_func_start dive_3_unknown
dive_3_unknown: @ 8084ED4
	push {lr}
	sub sp, 0x8
	mov r1, sp
	adds r1, 0x2
	mov r0, sp
	bl PlayerGetDestCoords
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08084F18
	ldr r2, _08084F20 @ =gObjectEvents
	ldr r0, _08084F24 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1E]
	mov r0, sp
	bl dive_warp
	ldr r0, _08084F28 @ =Task_Dive
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2C
	bl FieldEffectActiveListRemove
_08084F18:
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_08084F20: .4byte gObjectEvents
_08084F24: .4byte gPlayerAvatar
_08084F28: .4byte Task_Dive
	thumb_func_end dive_3_unknown

	thumb_func_start StartLavaridgeGymB1FWarp
StartLavaridgeGymB1FWarp: @ 8084F2C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08084F40 @ =Task_LavaridgeGymB1FWarp
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08084F40: .4byte Task_LavaridgeGymB1FWarp
	thumb_func_end StartLavaridgeGymB1FWarp

	thumb_func_start Task_LavaridgeGymB1FWarp
Task_LavaridgeGymB1FWarp: @ 8084F44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08084F8C @ =sLavaridgeGymB1FWarpEffectFuncs
	ldr r2, _08084F90 @ =gTasks
	ldr r5, _08084F94 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08084F58:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08084F98 @ =gObjectEvents
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08084F9C @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08084F58
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084F8C: .4byte sLavaridgeGymB1FWarpEffectFuncs
_08084F90: .4byte gTasks
_08084F94: .4byte gPlayerAvatar
_08084F98: .4byte gObjectEvents
_08084F9C: .4byte gSprites
	thumb_func_end Task_LavaridgeGymB1FWarp

	thumb_func_start LavaridgeGymB1FWarpEffect_1
LavaridgeGymB1FWarpEffect_1: @ 8084FA0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FreezeObjectEvents
	bl CameraObjectReset2
	movs r0, 0
	bl SetCameraPanningCallback
	ldr r0, _08084FD4 @ =gPlayerAvatar
	movs r2, 0x1
	strb r2, [r0, 0x6]
	ldrb r0, [r5, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x3]
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084FD4: .4byte gPlayerAvatar
	thumb_func_end LavaridgeGymB1FWarpEffect_1

	thumb_func_start LavaridgeGymB1FWarpEffect_2
LavaridgeGymB1FWarpEffect_2: @ 8084FD8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r0, r0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08085004
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08085004:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LavaridgeGymB1FWarpEffect_2

	thumb_func_start LavaridgeGymB1FWarpEffect_3
LavaridgeGymB1FWarpEffect_3: @ 808500C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	ldr r3, _08085054 @ =gFieldEffectArguments
	movs r5, 0x10
	ldrsh r0, [r1, r5]
	str r0, [r3]
	movs r5, 0x12
	ldrsh r0, [r1, r5]
	str r0, [r3, 0x4]
	adds r0, r2, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r3, 0x8]
	ldrb r0, [r2, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x32
	bl FieldEffectStart
	movs r0, 0xAB
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08085054: .4byte gFieldEffectArguments
	thumb_func_end LavaridgeGymB1FWarpEffect_3

	thumb_func_start LavaridgeGymB1FWarpEffect_4
LavaridgeGymB1FWarpEffect_4: @ 8085058
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r2, r0
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r1, r0, 0x1
	strh r1, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x11
	bgt _08085092
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080850A4
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3
	bgt _080850A4
	lsls r0, r2, 1
	b _080850A2
_08085092:
	movs r0, 0x4
	ands r1, r0
	cmp r1, 0
	bne _080850A4
	lsls r0, r2, 16
	cmp r0, 0
	ble _080850A4
	asrs r0, 17
_080850A2:
	strh r0, [r4, 0xA]
_080850A4:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	ble _080850F0
	adds r0, r5, 0
	adds r0, 0x29
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r2, r1, 17
	negs r2, r2
	movs r7, 0x26
	ldrsh r3, [r5, r7]
	movs r7, 0x22
	ldrsh r0, [r5, r7]
	adds r0, r1
	ldr r1, _080850E8 @ =gSpriteCoordOffsetY
	movs r7, 0
	ldrsh r1, [r1, r7]
	adds r0, r1
	asrs r2, 16
	adds r0, r2
	cmn r3, r0
	ble _080850EC
	ldrh r0, [r5, 0x26]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x26]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _080850F0
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080850F0
	.align 2, 0
_080850E8: .4byte gSpriteCoordOffsetY
_080850EC:
	movs r0, 0x1
	strh r0, [r4, 0x10]
_080850F0:
	ldrh r2, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808512E
	movs r7, 0x26
	ldrsh r1, [r5, r7]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _0808512E
	adds r0, r2, 0x1
	strh r0, [r4, 0x12]
	ldrb r0, [r6, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r6, 0x3]
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_0808512E:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08085144
	movs r7, 0x10
	ldrsh r0, [r4, r7]
	cmp r0, 0
	beq _08085144
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08085144:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end LavaridgeGymB1FWarpEffect_4

	thumb_func_start LavaridgeGymB1FWarpEffect_5
LavaridgeGymB1FWarpEffect_5: @ 808514C
	push {r4,lr}
	adds r4, r0, 0
	bl TryFadeOutOldMapMusic
	bl WarpFadeOutScreen
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LavaridgeGymB1FWarpEffect_5

	thumb_func_start LavaridgeGymB1FWarpEffect_6
LavaridgeGymB1FWarpEffect_6: @ 8085168
	push {lr}
	ldr r0, _080851A8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080851A0
	bl BGMusicStopped
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080851A0
	bl WarpIntoMap
	ldr r1, _080851AC @ =gFieldCallback
	ldr r0, _080851B0 @ =FieldCB_LavaridgeGymB1FWarpExit
	str r0, [r1]
	ldr r0, _080851B4 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _080851B8 @ =Task_LavaridgeGymB1FWarp
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080851A0:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080851A8: .4byte gPaletteFade
_080851AC: .4byte gFieldCallback
_080851B0: .4byte FieldCB_LavaridgeGymB1FWarpExit
_080851B4: .4byte CB2_LoadMap
_080851B8: .4byte Task_LavaridgeGymB1FWarp
	thumb_func_end LavaridgeGymB1FWarpEffect_6

	thumb_func_start FieldCB_LavaridgeGymB1FWarpExit
FieldCB_LavaridgeGymB1FWarpExit: @ 80851BC
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl sub_8111CF0
	bl ScriptContext2_Enable
	ldr r0, _080851E0 @ =gFieldCallback
	movs r1, 0
	str r1, [r0]
	ldr r0, _080851E4 @ =Task_LavaridgeGymB1FWarpExit
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080851E0: .4byte gFieldCallback
_080851E4: .4byte Task_LavaridgeGymB1FWarpExit
	thumb_func_end FieldCB_LavaridgeGymB1FWarpExit

	thumb_func_start Task_LavaridgeGymB1FWarpExit
Task_LavaridgeGymB1FWarpExit: @ 80851E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08085230 @ =sLavaridgeGymB1FWarpExitEffectFuncs
	ldr r2, _08085234 @ =gTasks
	ldr r5, _08085238 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080851FC:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0808523C @ =gObjectEvents
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08085240 @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _080851FC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085230: .4byte sLavaridgeGymB1FWarpExitEffectFuncs
_08085234: .4byte gTasks
_08085238: .4byte gPlayerAvatar
_0808523C: .4byte gObjectEvents
_08085240: .4byte gSprites
	thumb_func_end Task_LavaridgeGymB1FWarpExit

	thumb_func_start LavaridgeGymB1FWarpExitEffect_1
LavaridgeGymB1FWarpExitEffect_1: @ 8085244
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl CameraObjectReset2
	bl FreezeObjectEvents
	ldr r1, _08085270 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08085270: .4byte gPlayerAvatar
	thumb_func_end LavaridgeGymB1FWarpExitEffect_1

	thumb_func_start LavaridgeGymB1FWarpExitEffect_2
LavaridgeGymB1FWarpExitEffect_2: @ 8085274
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl IsWeatherNotFadingIn
	lsls r0, 24
	cmp r0, 0
	beq _080852B4
	ldr r1, _080852BC @ =gFieldEffectArguments
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r5, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080852B4:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080852BC: .4byte gFieldEffectArguments
	thumb_func_end LavaridgeGymB1FWarpExitEffect_2

	thumb_func_start LavaridgeGymB1FWarpExitEffect_3
LavaridgeGymB1FWarpExitEffect_3: @ 80852C0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085310 @ =gSprites
	adds r0, r1
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08085308
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	bl CameraObjectReset1
	movs r0, 0xA8
	bl PlaySE
	movs r0, 0x4
	bl sub_8064194
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
_08085308:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08085310: .4byte gSprites
	thumb_func_end LavaridgeGymB1FWarpExitEffect_3

	thumb_func_start LavaridgeGymB1FWarpExitEffect_4
LavaridgeGymB1FWarpExitEffect_4: @ 8085314
	push {lr}
	adds r0, r1, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808533E
	ldr r1, _08085344 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl UnfreezeObjectEvents
	ldr r0, _08085348 @ =Task_LavaridgeGymB1FWarpExit
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808533E:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08085344: .4byte gPlayerAvatar
_08085348: .4byte Task_LavaridgeGymB1FWarpExit
	thumb_func_end LavaridgeGymB1FWarpExitEffect_4

	thumb_func_start FldEff_LavaridgeGymWarp
FldEff_LavaridgeGymWarp: @ 808534C
	push {r4,lr}
	ldr r4, _080853A4 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080853A8 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x84
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080853AC @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080853A4: .4byte gFieldEffectArguments
_080853A8: .4byte gFieldEffectObjectTemplatePointers
_080853AC: .4byte gSprites
	thumb_func_end FldEff_LavaridgeGymWarp

	thumb_func_start SpriteCB_LavaridgeGymWarp
SpriteCB_LavaridgeGymWarp: @ 80853B0
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080853C8
	adds r0, r2, 0
	movs r1, 0x32
	bl FieldEffectStop
_080853C8:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_LavaridgeGymWarp

	thumb_func_start StartLavaridgeGym1FWarp
StartLavaridgeGym1FWarp: @ 80853CC
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080853E0 @ =Task_LavaridgeGym1FWarp
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080853E0: .4byte Task_LavaridgeGym1FWarp
	thumb_func_end StartLavaridgeGym1FWarp

	thumb_func_start Task_LavaridgeGym1FWarp
Task_LavaridgeGym1FWarp: @ 80853E4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0808542C @ =sLavaridgeGym1FWarpEffectFuncs
	ldr r2, _08085430 @ =gTasks
	ldr r5, _08085434 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080853F8:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08085438 @ =gObjectEvents
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0808543C @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _080853F8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808542C: .4byte sLavaridgeGym1FWarpEffectFuncs
_08085430: .4byte gTasks
_08085434: .4byte gPlayerAvatar
_08085438: .4byte gObjectEvents
_0808543C: .4byte gSprites
	thumb_func_end Task_LavaridgeGym1FWarp

	thumb_func_start LavaridgeGym1FWarpEffect_1
LavaridgeGym1FWarpEffect_1: @ 8085440
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl FreezeObjectEvents
	bl CameraObjectReset2
	ldr r1, _0808546C @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808546C: .4byte gPlayerAvatar
	thumb_func_end LavaridgeGym1FWarpEffect_1

	thumb_func_start LavaridgeGym1FWarpEffect_2
LavaridgeGym1FWarpEffect_2: @ 8085470
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _080854E4
	ldrh r1, [r5, 0xA]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	cmp r0, 0x3
	ble _080854C4
	ldr r1, _080854C0 @ =gFieldEffectArguments
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080854E4
	.align 2, 0
_080854C0: .4byte gFieldEffectArguments
_080854C4:
	adds r0, r1, 0x1
	strh r0, [r5, 0xA]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay4AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
	movs r0, 0x21
	bl PlaySE
_080854E4:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end LavaridgeGym1FWarpEffect_2

	thumb_func_start LavaridgeGym1FWarpEffect_3
LavaridgeGym1FWarpEffect_3: @ 80854EC
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldr r2, _08085520 @ =gSprites
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08085516
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08085516:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08085520: .4byte gSprites
	thumb_func_end LavaridgeGym1FWarpEffect_3

	thumb_func_start LavaridgeGym1FWarpEffect_4
LavaridgeGym1FWarpEffect_4: @ 8085524
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08085542
	bl TryFadeOutOldMapMusic
	bl WarpFadeOutScreen
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08085542:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LavaridgeGym1FWarpEffect_4

	thumb_func_start LavaridgeGym1FWarpEffect_5
LavaridgeGym1FWarpEffect_5: @ 808554C
	push {lr}
	ldr r0, _0808558C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08085584
	bl BGMusicStopped
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085584
	bl WarpIntoMap
	ldr r1, _08085590 @ =gFieldCallback
	ldr r0, _08085594 @ =FieldCB_FallWarpExit
	str r0, [r1]
	ldr r0, _08085598 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _0808559C @ =Task_LavaridgeGym1FWarp
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085584:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808558C: .4byte gPaletteFade
_08085590: .4byte gFieldCallback
_08085594: .4byte FieldCB_FallWarpExit
_08085598: .4byte CB2_LoadMap
_0808559C: .4byte Task_LavaridgeGym1FWarp
	thumb_func_end LavaridgeGym1FWarpEffect_5

	thumb_func_start FldEff_PopOutOfAsh
FldEff_PopOutOfAsh: @ 80855A0
	push {r4,lr}
	ldr r4, _080855F8 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080855FC @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x80
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08085600 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080855F8: .4byte gFieldEffectArguments
_080855FC: .4byte gFieldEffectObjectTemplatePointers
_08085600: .4byte gSprites
	thumb_func_end FldEff_PopOutOfAsh

	thumb_func_start SpriteCB_PopOutOfAsh
SpriteCB_PopOutOfAsh: @ 8085604
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0808561C
	adds r0, r2, 0
	movs r1, 0x31
	bl FieldEffectStop
_0808561C:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PopOutOfAsh

	thumb_func_start StartEscapeRopeFieldEffect
StartEscapeRopeFieldEffect: @ 8085620
	push {lr}
	bl ScriptContext2_Enable
	bl FreezeObjectEvents
	ldr r0, _08085638 @ =Task_DoEscapeRopeFieldEffect
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08085638: .4byte Task_DoEscapeRopeFieldEffect
	thumb_func_end StartEscapeRopeFieldEffect

	thumb_func_start Task_DoEscapeRopeFieldEffect
Task_DoEscapeRopeFieldEffect: @ 808563C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08085664 @ =gEscapeRopeFieldEffectFuncs
	ldr r2, _08085668 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08085664: .4byte gEscapeRopeFieldEffectFuncs
_08085668: .4byte gTasks
	thumb_func_end Task_DoEscapeRopeFieldEffect

	thumb_func_start EscapeRopeFieldEffect_Step0
EscapeRopeFieldEffect_Step0: @ 808566C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x8]
	movs r0, 0x40
	strh r0, [r4, 0x22]
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	strh r5, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end EscapeRopeFieldEffect_Step0

	thumb_func_start EscapeRopeFieldEffect_Step1
EscapeRopeFieldEffect_Step1: @ 8085690
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080856D4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080856D8 @ =gObjectEvents
	adds r6, r0, r1
	adds r4, r5, 0
	adds r4, 0x8
	adds r1, r5, 0
	adds r1, 0xA
	adds r2, r5, 0
	adds r2, 0xC
	adds r0, r6, 0
	bl sub_808576C
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	bgt _080856DC
	adds r0, r1, 0x1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _08085702
	movs r0, 0x27
	bl PlaySE
	b _08085702
	.align 2, 0
_080856D4: .4byte gPlayerAvatar
_080856D8: .4byte gObjectEvents
_080856DC:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08085702
	adds r1, r5, 0
	adds r1, 0x12
	adds r2, r5, 0
	adds r2, 0x14
	adds r0, r6, 0
	bl sub_80857F0
	cmp r0, 0
	bne _08085702
	bl TryFadeOutOldMapMusic
	bl WarpFadeOutScreen
	movs r0, 0x1
	strh r0, [r4, 0x8]
_08085702:
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _08085750
	ldr r0, _08085758 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08085750
	bl BGMusicStopped
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085750
	ldrh r1, [r5, 0x26]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl ObjectEventSetDirection
	bl sub_80555E0
	bl WarpIntoMap
	ldr r1, _0808575C @ =gFieldCallback
	ldr r0, _08085760 @ =FieldCallback_EscapeRopeExit
	str r0, [r1]
	ldr r0, _08085764 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _08085768 @ =Task_DoEscapeRopeFieldEffect
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085750:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085758: .4byte gPaletteFade
_0808575C: .4byte gFieldCallback
_08085760: .4byte FieldCallback_EscapeRopeExit
_08085764: .4byte CB2_LoadMap
_08085768: .4byte Task_DoEscapeRopeFieldEffect
	thumb_func_end EscapeRopeFieldEffect_Step1

	thumb_func_start sub_808576C
sub_808576C: @ 808576C
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _0808578A
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _080857E4
_0808578A:
	ldrh r1, [r6]
	movs r2, 0
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0808579E
	subs r0, r1, 0x1
	strh r0, [r6]
	lsls r0, 16
	cmp r0, 0
	bne _080857E4
_0808579E:
	ldr r7, _080857E0 @ =gUnknown_83CC0E8
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r7
	ldrb r0, [r0]
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
	ldrh r1, [r5]
	movs r2, 0
	ldrsh r0, [r5, r2]
	cmp r0, 0xB
	bgt _080857C8
	adds r0, r1, 0x1
	strh r0, [r5]
_080857C8:
	movs r0, 0
	ldrsh r1, [r5, r0]
	movs r0, 0xC
	asrs r0, r1
	strh r0, [r6]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r7
	ldrb r0, [r0]
	b _080857EA
	.align 2, 0
_080857E0: .4byte gUnknown_83CC0E8
_080857E4:
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
_080857EA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_808576C

	thumb_func_start sub_80857F0
sub_80857F0: @ 80857F0
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldrb r0, [r7, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08085818 @ =gSprites
	adds r4, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08085830
	cmp r0, 0x1
	bgt _0808581C
	cmp r0, 0
	beq _08085826
	b _0808589A
	.align 2, 0
_08085818: .4byte gSprites
_0808581C:
	cmp r0, 0x2
	beq _08085878
	cmp r0, 0x3
	beq _08085896
	b _0808589A
_08085826:
	bl CameraObjectReset2
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08085830:
	ldrh r0, [r4, 0x26]
	subs r0, 0x8
	strh r0, [r4, 0x26]
	ldrh r0, [r6]
	subs r0, 0x8
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bgt _0808589A
	ldrb r0, [r7, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r7, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0
	strb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0808589A
_08085878:
	ldrh r0, [r4, 0x26]
	subs r0, 0x8
	strh r0, [r4, 0x26]
	ldrh r0, [r6]
	subs r0, 0x8
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x58
	negs r1, r1
	cmp r0, r1
	bgt _0808589A
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08085896:
	movs r0, 0
	b _0808589C
_0808589A:
	movs r0, 0x1
_0808589C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80857F0

	thumb_func_start sub_80858A4
sub_80858A4: @ 80858A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r7, r2, 0
	mov r9, r3
	ldr r0, [sp, 0x20]
	mov r10, r0
	ldrb r0, [r6, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080858D8 @ =gSprites
	adds r4, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08085948
	cmp r0, 0x1
	bgt _080858DC
	cmp r0, 0
	beq _080858E6
	b _080859C2
	.align 2, 0
_080858D8: .4byte gSprites
_080858DC:
	cmp r0, 0x2
	beq _0808599C
	cmp r0, 0x3
	beq _080859BE
	b _080859C2
_080858E6:
	bl CameraObjectReset2
	movs r2, 0x58
	negs r2, r2
	adds r0, r2, 0
	strh r0, [r7]
	ldrh r0, [r4, 0x26]
	subs r0, 0x58
	movs r3, 0
	strh r0, [r4, 0x26]
	ldrb r0, [r4, 0x5]
	lsls r0, 28
	lsrs r0, 30
	mov r1, r9
	strh r0, [r1]
	movs r2, 0x43
	adds r2, r4
	mov r8, r2
	ldrb r0, [r2]
	mov r1, r10
	strh r0, [r1]
	movs r2, 0x42
	adds r2, r4
	mov r12, r2
	ldrb r0, [r2]
	lsrs r0, 6
	ldr r1, [sp, 0x24]
	strh r0, [r1]
	ldrb r0, [r6, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r6, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	mov r2, r8
	strb r3, [r2]
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08085948:
	ldrh r0, [r4, 0x26]
	adds r0, 0x4
	strh r0, [r4, 0x26]
	ldrh r0, [r7]
	adds r0, 0x4
	strh r0, [r7]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	blt _080859C2
	movs r0, 0x3
	mov r2, r9
	ldrb r1, [r2]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	mov r1, r10
	ldrh r0, [r1]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r2, [sp, 0x24]
	ldrb r1, [r2]
	adds r3, r4, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080859C2
_0808599C:
	ldrh r0, [r4, 0x26]
	adds r0, 0x4
	strh r0, [r4, 0x26]
	ldrh r0, [r7]
	adds r0, 0x4
	strh r0, [r7]
	lsls r0, 16
	cmp r0, 0
	blt _080859C2
	movs r0, 0x1E
	bl PlaySE
	bl CameraObjectReset1
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080859BE:
	movs r0, 0
	b _080859C4
_080859C2:
	movs r0, 0x1
_080859C4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80858A4

	thumb_func_start FieldCallback_EscapeRopeExit
FieldCallback_EscapeRopeExit: @ 80859D4
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl sub_8111CF0
	bl ScriptContext2_Enable
	bl FreezeObjectEvents
	ldr r1, _08085A14 @ =gFieldCallback
	movs r0, 0
	str r0, [r1]
	ldr r2, _08085A18 @ =gObjectEvents
	ldr r0, _08085A1C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, _08085A20 @ =Task_DoEscapeRopeExitFieldEffect
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08085A14: .4byte gFieldCallback
_08085A18: .4byte gObjectEvents
_08085A1C: .4byte gPlayerAvatar
_08085A20: .4byte Task_DoEscapeRopeExitFieldEffect
	thumb_func_end FieldCallback_EscapeRopeExit

	thumb_func_start Task_DoEscapeRopeExitFieldEffect
Task_DoEscapeRopeExitFieldEffect: @ 8085A24
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08085A4C @ =sEscapeRopeExitEffectFuncs
	ldr r2, _08085A50 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08085A4C: .4byte sEscapeRopeExitEffectFuncs
_08085A50: .4byte gTasks
	thumb_func_end Task_DoEscapeRopeExitFieldEffect

	thumb_func_start EscapeRopeExitFieldEffect_Step0
EscapeRopeExitFieldEffect_Step0: @ 8085A54
	push {r4,lr}
	adds r4, r0, 0
	bl IsWeatherNotFadingIn
	lsls r0, 24
	cmp r0, 0
	beq _08085A78
	movs r0, 0x28
	bl PlaySE
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08085A78:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end EscapeRopeExitFieldEffect_Step0

	thumb_func_start EscapeRopeExitFieldEffect_Step1
EscapeRopeExitFieldEffect_Step1: @ 8085A80
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x8
	ldr r0, _08085AD4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085AD8 @ =gObjectEvents
	adds r6, r0, r1
	adds r1, r4, 0
	adds r1, 0xA
	adds r2, r4, 0
	adds r2, 0xC
	adds r3, r4, 0
	adds r3, 0xE
	adds r0, r5, 0
	adds r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r0, 0x12
	str r0, [sp, 0x4]
	adds r0, r6, 0
	bl sub_80858A4
	adds r7, r0, 0
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0x7
	bgt _08085ADC
	adds r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _08085B10
	.align 2, 0
_08085AD4: .4byte gPlayerAvatar
_08085AD8: .4byte gObjectEvents
_08085ADC:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _08085B10
	adds r0, r1, 0x1
	strh r0, [r5, 0xC]
	adds r1, r4, 0
	adds r1, 0x1A
	adds r2, r4, 0
	adds r2, 0x1C
	adds r0, r6, 0
	bl sub_808576C
	lsls r0, 24
	lsrs r1, r0, 24
	strh r1, [r5, 0x10]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0x31
	ble _08085B10
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _08085B10
	movs r0, 0x1
	strh r0, [r5, 0xE]
_08085B10:
	cmp r7, 0
	bne _08085B58
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _08085B58
	adds r0, r6, 0
	bl ObjectEventCheckHeldMovementStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085B58
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	ldrb r1, [r6, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x3]
	bl ScriptContext2_Disable
	bl UnfreezeObjectEvents
	ldr r0, _08085B60 @ =Task_DoEscapeRopeExitFieldEffect
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085B58:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085B60: .4byte Task_DoEscapeRopeExitFieldEffect
	thumb_func_end EscapeRopeExitFieldEffect_Step1

	thumb_func_start CreateTeleportFieldEffectTask
CreateTeleportFieldEffectTask: @ 8085B64
	push {lr}
	ldr r0, _08085B74 @ =Task_DoTeleportFieldEffect
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08085B74: .4byte Task_DoTeleportFieldEffect
	thumb_func_end CreateTeleportFieldEffectTask

	thumb_func_start Task_DoTeleportFieldEffect
Task_DoTeleportFieldEffect: @ 8085B78
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08085BA0 @ =sTeleportEffectFuncs
	ldr r2, _08085BA4 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08085BA0: .4byte sTeleportEffectFuncs
_08085BA4: .4byte gTasks
	thumb_func_end Task_DoTeleportFieldEffect

	thumb_func_start TeleportFieldEffectTask1
TeleportFieldEffectTask1: @ 8085BA8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl FreezeObjectEvents
	bl CameraObjectReset2
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end TeleportFieldEffectTask1

	thumb_func_start TeleportFieldEffectTask2
TeleportFieldEffectTask2: @ 8085BD0
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08085C54 @ =gUnknown_83CC108
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _08085C58 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085C5C @ =gObjectEvents
	adds r5, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08085C02
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08085C1C
_08085C02:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl ObjectEventTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_08085C1C:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	ble _08085C4A
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08085C4A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x4
	strh r0, [r4, 0xA]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	movs r0, 0x27
	bl PlaySE
_08085C4A:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085C54: .4byte gUnknown_83CC108
_08085C58: .4byte gPlayerAvatar
_08085C5C: .4byte gObjectEvents
	thumb_func_end TeleportFieldEffectTask2

	thumb_func_start TeleportFieldEffectTask3
TeleportFieldEffectTask3: @ 8085C60
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08085D24 @ =gUnknown_83CC108
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08085D28 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085D2C @ =gObjectEvents
	adds r3, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085D30 @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _08085CAA
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrb r0, [r3, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r3, 0
	bl ObjectEventTurn
_08085CAA:
	ldrh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	adds r0, r1, r2
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _08085CD6
	movs r0, 0x4
	strh r0, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _08085CD6
	lsls r0, r1, 1
	strh r0, [r4, 0xE]
_08085CD6:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08085D04
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08085D04
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08085D04:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xA7
	ble _08085D1A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl TryFadeOutOldMapMusic
	bl WarpFadeOutScreen
_08085D1A:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085D24: .4byte gUnknown_83CC108
_08085D28: .4byte gPlayerAvatar
_08085D2C: .4byte gObjectEvents
_08085D30: .4byte gSprites
	thumb_func_end TeleportFieldEffectTask3

	thumb_func_start TeleportFieldEffectTask4
TeleportFieldEffectTask4: @ 8085D34
	push {lr}
	ldr r0, _08085D74 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08085D70
	bl BGMusicStopped
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085D70
	bl copy_saved_warp3_bank_and_enter_x_to_warp1
	bl WarpIntoMap
	ldr r0, _08085D78 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r1, _08085D7C @ =gFieldCallback
	ldr r0, _08085D80 @ =FieldCallback_TeleportIn
	str r0, [r1]
	ldr r0, _08085D84 @ =Task_DoTeleportFieldEffect
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085D70:
	pop {r0}
	bx r0
	.align 2, 0
_08085D74: .4byte gPaletteFade
_08085D78: .4byte CB2_LoadMap
_08085D7C: .4byte gFieldCallback
_08085D80: .4byte FieldCallback_TeleportIn
_08085D84: .4byte Task_DoTeleportFieldEffect
	thumb_func_end TeleportFieldEffectTask4

	thumb_func_start FieldCallback_TeleportIn
FieldCallback_TeleportIn: @ 8085D88
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl sub_8111CF0
	bl ScriptContext2_Enable
	bl FreezeObjectEvents
	ldr r1, _08085DCC @ =gFieldCallback
	movs r0, 0
	str r0, [r1]
	ldr r2, _08085DD0 @ =gObjectEvents
	ldr r0, _08085DD4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl CameraObjectReset2
	ldr r0, _08085DD8 @ =Task_DoTeleportInFieldEffect
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08085DCC: .4byte gFieldCallback
_08085DD0: .4byte gObjectEvents
_08085DD4: .4byte gPlayerAvatar
_08085DD8: .4byte Task_DoTeleportInFieldEffect
	thumb_func_end FieldCallback_TeleportIn

	thumb_func_start Task_DoTeleportInFieldEffect
Task_DoTeleportInFieldEffect: @ 8085DDC
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08085E04 @ =sTeleportInEffectFuncs
	ldr r2, _08085E08 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08085E04: .4byte sTeleportInEffectFuncs
_08085E08: .4byte gTasks
	thumb_func_end Task_DoTeleportInFieldEffect

	thumb_func_start TeleportInFieldEffectTask1
TeleportInFieldEffectTask1: @ 8085E0C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl IsWeatherNotFadingIn
	lsls r0, 24
	cmp r0, 0
	beq _08085E82
	ldr r5, _08085E88 @ =gPlayerAvatar
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08085E8C @ =gSprites
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _08085E90 @ =gSpriteCoordOffsetY
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	strh r0, [r2, 0x26]
	ldr r3, _08085E94 @ =gObjectEvents
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r3, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	strb r0, [r1, 0x1]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x8
	strh r0, [r6, 0xA]
	movs r0, 0x1
	strh r0, [r6, 0xC]
	adds r2, 0x42
	ldrb r0, [r2]
	lsrs r0, 6
	strh r0, [r6, 0x24]
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	movs r0, 0x27
	bl PlaySE
_08085E82:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085E88: .4byte gPlayerAvatar
_08085E8C: .4byte gSprites
_08085E90: .4byte gSpriteCoordOffsetY
_08085E94: .4byte gObjectEvents
	thumb_func_end TeleportInFieldEffectTask1

	thumb_func_start TeleportInFieldEffectTask2
TeleportInFieldEffectTask2: @ 8085E98
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08085F00 @ =gUnknown_83CC108
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08085F04 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085F08 @ =gObjectEvents
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08085F0C @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	blt _08085F10
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08085F36
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	ldrh r1, [r4, 0x24]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08085F36
	.align 2, 0
_08085F00: .4byte gUnknown_83CC108
_08085F04: .4byte gPlayerAvatar
_08085F08: .4byte gObjectEvents
_08085F0C: .4byte gSprites
_08085F10:
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08085F36
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08085F36:
	ldrh r2, [r5, 0x26]
	movs r3, 0x26
	ldrsh r1, [r5, r3]
	movs r0, 0x30
	negs r0, r0
	cmp r1, r0
	blt _08085F5A
	ldrh r1, [r4, 0xA]
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	ble _08085F5A
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _08085F5A
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
_08085F5A:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	movs r7, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08085F7C
	movs r0, 0x4
	strh r0, [r4, 0xC]
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r6, 0
	bl ObjectEventTurn
_08085F7C:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08085F92
	strh r7, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r4, 0xA]
	strh r7, [r4, 0xC]
_08085F92:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end TeleportInFieldEffectTask2

	thumb_func_start TeleportInFieldEffectTask3
TeleportInFieldEffectTask3: @ 8085F9C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08086018 @ =gUnknown_83CC108
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _0808601C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086020 @ =gObjectEvents
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08086010
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl ObjectEventTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08086010
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08086010
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl UnfreezeObjectEvents
	ldr r0, _08086024 @ =Task_DoTeleportInFieldEffect
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08086010:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086018: .4byte gUnknown_83CC108
_0808601C: .4byte gPlayerAvatar
_08086020: .4byte gObjectEvents
_08086024: .4byte Task_DoTeleportInFieldEffect
	thumb_func_end TeleportInFieldEffectTask3

	thumb_func_start FldEff_FieldMoveShowMon
FldEff_FieldMoveShowMon: @ 8086028
	push {r4,lr}
	bl GetCurrentMapType
	lsls r0, 24
	lsrs r0, 24
	bl IsMapTypeOutdoors
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08086048
	ldr r0, _08086044 @ =Task_ShowMon_Outdoors
	b _0808604A
	.align 2, 0
_08086044: .4byte Task_ShowMon_Outdoors
_08086048:
	ldr r0, _08086078 @ =Task_ShowMon_Indoors
_0808604A:
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0808607C @ =gFieldEffectArguments
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_8086860
	ldr r2, _08086080 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x26]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086078: .4byte Task_ShowMon_Indoors
_0808607C: .4byte gFieldEffectArguments
_08086080: .4byte gTasks
	thumb_func_end FldEff_FieldMoveShowMon

	thumb_func_start FldEff_FieldMoveShowMonInit
FldEff_FieldMoveShowMonInit: @ 8086084
	push {r4-r6,lr}
	ldr r5, _080860D8 @ =gFieldEffectArguments
	ldr r0, [r5]
	movs r6, 0x80
	lsls r6, 24
	ands r6, r0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _080860DC @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	str r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5, 0x4]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x8]
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	movs r0, 0x6
	bl FieldEffectStart
	movs r0, 0x3B
	bl FieldEffectActiveListRemove
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080860D8: .4byte gFieldEffectArguments
_080860DC: .4byte gPlayerParty
	thumb_func_end FldEff_FieldMoveShowMonInit

	thumb_func_start Task_ShowMon_Outdoors
Task_ShowMon_Outdoors: @ 80860E0
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08086108 @ =sShowMonOutdoorsEffectFuncs
	ldr r2, _0808610C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08086108: .4byte sShowMonOutdoorsEffectFuncs
_0808610C: .4byte gTasks
	thumb_func_end Task_ShowMon_Outdoors

	thumb_func_start ShowMonEffect_Outdoors_1
ShowMonEffect_Outdoors_1: @ 8086110
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x48
	bl GetGpuReg
	strh r0, [r4, 0x1E]
	movs r0, 0x4A
	bl GetGpuReg
	strh r0, [r4, 0x20]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _08086170 @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r1, _08086174 @ =0x0000f0f1
	strh r1, [r4, 0xA]
	ldr r0, _08086178 @ =0x00005051
	strh r0, [r4, 0xC]
	movs r0, 0x3F
	strh r0, [r4, 0xE]
	movs r0, 0x3E
	strh r0, [r4, 0x10]
	movs r0, 0x40
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x44
	bl SetGpuReg
	ldrh r1, [r4, 0xE]
	movs r0, 0x48
	bl SetGpuReg
	ldrh r1, [r4, 0x10]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, _0808617C @ =VBlankCB_ShowMonEffect_Outdoors
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086170: .4byte gMain
_08086174: .4byte 0x0000f0f1
_08086178: .4byte 0x00005051
_0808617C: .4byte VBlankCB_ShowMonEffect_Outdoors
	thumb_func_end ShowMonEffect_Outdoors_1

	thumb_func_start ShowMonEffect_Outdoors_2
ShowMonEffect_Outdoors_2: @ 8086180
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	mov r8, r0
	movs r0, 0x8
	bl GetGpuReg
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 18
	lsls r4, 30
	lsrs r4, 16
	movs r0, 0x8
	bl GetGpuReg
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 24
	lsls r5, 27
	lsrs r5, 16
	ldr r0, _080861F0 @ =gUnknown_83CB5F0
	movs r6, 0xC0
	lsls r6, 19
	adds r4, r6
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	adds r6, r5, r6
	ldr r2, _080861F4 @ =0x05000200
	mov r0, sp
	adds r1, r6, 0
	bl CpuSet
	ldr r0, _080861F8 @ =gUnknown_83CB7F0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r5, 0
	bl sub_8086428
	mov r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080861F0: .4byte gUnknown_83CB5F0
_080861F4: .4byte 0x05000200
_080861F8: .4byte gUnknown_83CB7F0
	thumb_func_end ShowMonEffect_Outdoors_2

	thumb_func_start ShowMonEffect_Outdoors_3
ShowMonEffect_Outdoors_3: @ 80861FC
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r6, [r3, 0xA]
	ldrh r2, [r3, 0xC]
	movs r7, 0xFF
	lsrs r1, r6, 8
	subs r1, 0x10
	lsls r1, 16
	lsrs r0, r2, 8
	subs r0, 0x2
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r7, 0
	ands r0, r2
	adds r5, r0, 0x2
	lsrs r2, r1, 16
	cmp r1, 0
	bge _08086228
	movs r2, 0
_08086228:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0x27
	bgt _08086232
	movs r4, 0x28
_08086232:
	cmp r5, 0x78
	ble _08086238
	movs r5, 0x78
_08086238:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 8
	adds r0, r7, 0
	ands r0, r6
	orrs r1, r0
	strh r1, [r3, 0xA]
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r4, 8
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r3, 0xC]
	cmp r2, 0
	bne _08086278
	cmp r4, 0x28
	bne _08086278
	cmp r1, 0x78
	bne _08086278
	ldr r2, _08086280 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08086284 @ =sub_80868C0
	str r1, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08086278:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086280: .4byte gSprites
_08086284: .4byte sub_80868C0
	thumb_func_end ShowMonEffect_Outdoors_3

	thumb_func_start ShowMonEffect_Outdoors_4
ShowMonEffect_Outdoors_4: @ 8086288
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldr r2, _080862B4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080862AE
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080862AE:
	pop {r0}
	bx r0
	.align 2, 0
_080862B4: .4byte gSprites
	thumb_func_end ShowMonEffect_Outdoors_4

	thumb_func_start ShowMonEffect_Outdoors_5
ShowMonEffect_Outdoors_5: @ 80862B8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r2, [r3, 0xC]
	lsls r1, r2, 16
	movs r0, 0xFF
	asrs r1, 24
	adds r1, 0x6
	lsls r1, 16
	ands r0, r2
	subs r0, 0x6
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r4, r1, 16
	asrs r1, 16
	cmp r1, 0x50
	ble _080862E0
	movs r4, 0x50
_080862E0:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x50
	bgt _080862EA
	movs r2, 0x51
_080862EA:
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r0, 8
	lsls r2, 16
	asrs r2, 16
	orrs r1, r2
	strh r1, [r3, 0xC]
	cmp r0, 0x50
	bne _08086306
	cmp r2, 0x51
	bne _08086306
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08086306:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ShowMonEffect_Outdoors_5

	thumb_func_start ShowMonEffect_Outdoors_6
ShowMonEffect_Outdoors_6: @ 808630C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0x8
	bl GetGpuReg
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 24
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _08086354 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0xF1
	strh r0, [r4, 0xA]
	movs r0, 0xA1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1E]
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086354: .4byte 0x05000200
	thumb_func_end ShowMonEffect_Outdoors_6

	thumb_func_start ShowMonEffect_Outdoors_7
ShowMonEffect_Outdoors_7: @ 8086358
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl SetVBlankCallback
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	bl Menu_LoadStdPal
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080863B8 @ =gSprites
	adds r0, r1
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	bl FreeResourcesAndDestroySprite
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080863BC @ =Task_ShowMon_Outdoors
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080863B8: .4byte gSprites
_080863BC: .4byte Task_ShowMon_Outdoors
	thumb_func_end ShowMonEffect_Outdoors_7

	thumb_func_start VBlankCB_ShowMonEffect_Outdoors
VBlankCB_ShowMonEffect_Outdoors: @ 80863C0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08086420 @ =Task_ShowMon_Outdoors
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08086424 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldrh r1, [r4, 0xA]
	movs r0, 0x40
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x44
	bl SetGpuReg
	ldrh r1, [r4, 0xE]
	movs r0, 0x48
	bl SetGpuReg
	ldrh r1, [r4, 0x10]
	movs r0, 0x4A
	bl SetGpuReg
	ldrh r1, [r4, 0x12]
	movs r0, 0x10
	bl SetGpuReg
	ldrh r1, [r4, 0x14]
	movs r0, 0x12
	bl SetGpuReg
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086420: .4byte Task_ShowMon_Outdoors
_08086424: .4byte gTasks
	thumb_func_end VBlankCB_ShowMonEffect_Outdoors

	thumb_func_start sub_8086428
sub_8086428: @ 8086428
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0808645C @ =0x06000140
	adds r2, r0, r1
	movs r1, 0
	ldr r5, _08086460 @ =gUnknown_83CB810
	movs r0, 0xF0
	lsls r0, 8
	adds r4, r0, 0
	ldr r3, _08086464 @ =0x0000013f
_0808643E:
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	orrs r0, r4
	strh r0, [r2]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, 0x2
	cmp r1, r3
	bls _0808643E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808645C: .4byte 0x06000140
_08086460: .4byte gUnknown_83CB810
_08086464: .4byte 0x0000013f
	thumb_func_end sub_8086428

	thumb_func_start Task_ShowMon_Indoors
Task_ShowMon_Indoors: @ 8086468
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08086490 @ =sShowMonIndoorsEffectFuncs
	ldr r2, _08086494 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08086490: .4byte sShowMonIndoorsEffectFuncs
_08086494: .4byte gTasks
	thumb_func_end Task_ShowMon_Indoors

	thumb_func_start ShowMonEffect_Indoors_1
ShowMonEffect_Indoors_1: @ 8086498
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0xA]
	movs r0, 0x10
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x12
	bl SetGpuReg
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _080864CC @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r0, _080864D0 @ =VBlankCB_ShowMonEffect_Indoors
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080864CC: .4byte gMain
_080864D0: .4byte VBlankCB_ShowMonEffect_Indoors
	thumb_func_end ShowMonEffect_Indoors_1

	thumb_func_start ShowMonEffect_Indoors_2
ShowMonEffect_Indoors_2: @ 80864D4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r9, r0
	movs r0, 0x8
	bl GetGpuReg
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 18
	lsls r5, 30
	lsrs r5, 16
	movs r0, 0x8
	bl GetGpuReg
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 24
	lsls r4, 27
	lsrs r4, 16
	movs r0, 0
	mov r8, r0
	mov r1, r9
	strh r4, [r1, 0x20]
	ldr r0, _08086548 @ =gUnknown_83CBA90
	movs r6, 0xC0
	lsls r6, 19
	adds r5, r6
	adds r1, r5, 0
	movs r2, 0x40
	bl CpuSet
	mov r0, r8
	str r0, [sp]
	adds r4, r6
	ldr r2, _0808654C @ =0x05000200
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _08086550 @ =gUnknown_83CBB10
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	mov r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086548: .4byte gUnknown_83CBA90
_0808654C: .4byte 0x05000200
_08086550: .4byte gUnknown_83CBB10
	thumb_func_end ShowMonEffect_Indoors_2

	thumb_func_start ShowMonEffect_Indoors_3
ShowMonEffect_Indoors_3: @ 8086554
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086738
	lsls r0, 24
	cmp r0, 0
	beq _080865A6
	movs r0, 0x48
	bl GetGpuReg
	strh r0, [r4, 0x12]
	movs r1, 0xFF
	ands r1, r0
	movs r2, 0x88
	lsls r2, 5
	adds r0, r2, 0
	orrs r1, r0
	movs r0, 0x48
	bl SetGpuReg
	movs r0, 0x42
	movs r1, 0xF0
	bl SetGpuReg
	ldr r1, _080865B4 @ =0x00002878
	movs r0, 0x46
	bl SetGpuReg
	ldr r2, _080865B8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080865BC @ =sub_80868C0
	str r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080865A6:
	adds r0, r4, 0
	bl sub_8086728
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080865B4: .4byte 0x00002878
_080865B8: .4byte gSprites
_080865BC: .4byte sub_80868C0
	thumb_func_end ShowMonEffect_Indoors_3

	thumb_func_start ShowMonEffect_Indoors_4
ShowMonEffect_Indoors_4: @ 80865C0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086728
	ldr r2, _080865EC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080865E4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080865E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080865EC: .4byte gSprites
	thumb_func_end ShowMonEffect_Indoors_4

	thumb_func_start ShowMonEffect_Indoors_5
ShowMonEffect_Indoors_5: @ 80865F0
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8086728
	ldrh r1, [r4, 0xA]
	movs r0, 0x7
	ands r0, r1
	movs r1, 0
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	ldr r5, _0808662C @ =0x0000ffff
	movs r0, 0x42
	adds r1, r5, 0
	bl SetGpuReg
	movs r0, 0x46
	adds r1, r5, 0
	bl SetGpuReg
	ldrh r1, [r4, 0x12]
	movs r0, 0x48
	bl SetGpuReg
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808662C: .4byte 0x0000ffff
	thumb_func_end ShowMonEffect_Indoors_5

	thumb_func_start ShowMonEffect_Indoors_6
ShowMonEffect_Indoors_6: @ 8086630
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086728
	adds r0, r4, 0
	bl sub_80867F0
	lsls r0, 24
	cmp r0, 0
	beq _0808664A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808664A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ShowMonEffect_Indoors_6

	thumb_func_start ShowMonEffect_Indoors_7
ShowMonEffect_Indoors_7: @ 8086650
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r0, 0x8
	bl GetGpuReg
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 24
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _080866D4 @ =0x05000200
	mov r0, sp
	bl CpuSet
	adds r0, r4, 0
	adds r0, 0x22
	add r1, sp, 0x4
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp, 0x4]
	bl SetVBlankCallback
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	bl Menu_LoadStdPal
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080866D8 @ =gSprites
	adds r0, r1
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	bl FreeResourcesAndDestroySprite
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080866DC @ =Task_ShowMon_Indoors
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080866D4: .4byte 0x05000200
_080866D8: .4byte gSprites
_080866DC: .4byte Task_ShowMon_Indoors
	thumb_func_end ShowMonEffect_Indoors_7

	thumb_func_start VBlankCB_ShowMonEffect_Indoors
VBlankCB_ShowMonEffect_Indoors: @ 80866E0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08086720 @ =Task_ShowMon_Indoors
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08086724 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldrh r1, [r4, 0xA]
	movs r0, 0x10
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x12
	bl SetGpuReg
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086720: .4byte Task_ShowMon_Indoors
_08086724: .4byte gTasks
	thumb_func_end VBlankCB_ShowMonEffect_Indoors

	thumb_func_start sub_8086728
sub_8086728: @ 8086728
	ldrh r1, [r0, 0xA]
	subs r1, 0x10
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xE]
	adds r1, 0x10
	strh r1, [r0, 0xE]
	bx lr
	thumb_func_end sub_8086728

	thumb_func_start sub_8086738
sub_8086738: @ 8086738
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x10]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08086754
	movs r0, 0x1
	b _080867D8
_08086754:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r3, r0, 19
	movs r1, 0x1F
	ands r3, r1
	movs r4, 0x10
	ldrsh r0, [r5, r4]
	cmp r3, r0
	blt _080867D6
	movs r0, 0x20
	subs r3, r0, r3
	ands r3, r1
	subs r0, r2
	mov r12, r0
	mov r7, r12
	ands r7, r1
	mov r12, r7
	ldrh r0, [r5, 0x20]
	ldr r1, _080867E8 @ =0x06000140
	adds r1, r0
	mov r8, r1
	movs r4, 0
	ldr r7, _080867EC @ =gUnknown_83CBB30
	mov r10, r7
	movs r0, 0xF0
	lsls r0, 8
	mov r9, r0
	adds r1, r3, 0x1
	movs r0, 0x1F
	ands r1, r0
	str r1, [sp]
	mov r6, r12
	adds r6, 0x1
	ands r6, r0
_08086798:
	lsls r1, r4, 5
	adds r2, r1, r3
	lsls r2, 1
	add r2, r8
	mov r7, r12
	adds r0, r7, r1
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r7, r9
	orrs r0, r7
	strh r0, [r2]
	ldr r0, [sp]
	adds r2, r1, r0
	lsls r2, 1
	add r2, r8
	adds r1, r6, r1
	lsls r1, 1
	add r1, r10
	ldrh r0, [r1]
	mov r1, r9
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x9
	bls _08086798
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_080867D6:
	movs r0, 0
_080867D8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080867E8: .4byte 0x06000140
_080867EC: .4byte gUnknown_83CBB30
	thumb_func_end sub_8086738

	thumb_func_start sub_80867F0
sub_80867F0: @ 80867F0
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08086800
	movs r0, 0x1
	b _08086854
_08086800:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 19
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r2, r0
	blt _08086852
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r2, r0, 19
	movs r0, 0x1F
	ands r2, r0
	ldrh r0, [r5, 0x20]
	ldr r1, _0808685C @ =0x06000140
	adds r6, r0, r1
	movs r3, 0
	movs r0, 0xF0
	lsls r0, 8
	adds r7, r0, 0
	adds r4, r2, 0x1
	movs r0, 0x1F
	ands r4, r0
_08086830:
	lsls r0, r3, 5
	adds r1, r0, r2
	lsls r1, 1
	adds r1, r6
	strh r7, [r1]
	adds r0, r4
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bls _08086830
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_08086852:
	movs r0, 0
_08086854:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808685C: .4byte 0x06000140
	thumb_func_end sub_80867F0

	thumb_func_start sub_8086860
sub_8086860: @ 8086860
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	movs r5, 0x80
	lsls r5, 24
	ands r5, r6
	lsrs r5, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _080868B4 @ =0x7fffffff
	ands r6, r0
	lsls r0, r6, 16
	lsrs r0, 16
	movs r3, 0xA0
	lsls r3, 1
	movs r4, 0x50
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl CreateMonSprite_FieldMove
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _080868B8 @ =gSprites
	adds r2, r1
	ldr r1, _080868BC @ =SpriteCallbackDummy
	str r1, [r2, 0x1C]
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x5]
	strh r6, [r2, 0x2E]
	strh r5, [r2, 0x3A]
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080868B4: .4byte 0x7fffffff
_080868B8: .4byte gSprites
_080868BC: .4byte SpriteCallbackDummy
	thumb_func_end sub_8086860

	thumb_func_start sub_80868C0
sub_80868C0: @ 80868C0
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x20]
	subs r0, 0x14
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bgt _08086900
	movs r0, 0x78
	strh r0, [r1, 0x20]
	movs r0, 0x1E
	strh r0, [r1, 0x30]
	ldr r0, _080868F4 @ =sub_8086904
	str r0, [r1, 0x1C]
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080868F8
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	b _08086900
	.align 2, 0
_080868F4: .4byte sub_8086904
_080868F8:
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	bl PlayCry1
_08086900:
	pop {r0}
	bx r0
	thumb_func_end sub_80868C0

	thumb_func_start sub_8086904
sub_8086904: @ 8086904
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08086918
	ldr r0, _0808691C @ =sub_8086920
	str r0, [r1, 0x1C]
_08086918:
	pop {r0}
	bx r0
	.align 2, 0
_0808691C: .4byte sub_8086920
	thumb_func_end sub_8086904

	thumb_func_start sub_8086920
sub_8086920: @ 8086920
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x20]
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bge _08086938
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	b _0808693E
_08086938:
	adds r0, r3, 0
	subs r0, 0x14
	strh r0, [r2, 0x20]
_0808693E:
	pop {r0}
	bx r0
	thumb_func_end sub_8086920

	thumb_func_start sub_8086944
sub_8086944: @ 8086944
	push {r4,lr}
	ldr r0, _08086980 @ =sub_8086990
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086984 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08086988 @ =gFieldEffectArguments
	ldr r0, [r0]
	strh r0, [r1, 0x26]
	bl sav1_reset_battle_music_maybe
	ldr r4, _0808698C @ =0x00000131
	adds r0, r4, 0
	bl sub_8056124
	cmp r0, 0
	beq _08086978
	adds r0, r4, 0
	bl Overworld_ChangeMusicTo
_08086978:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086980: .4byte sub_8086990
_08086984: .4byte gTasks
_08086988: .4byte gFieldEffectArguments
_0808698C: .4byte 0x00000131
	thumb_func_end sub_8086944

	thumb_func_start sub_8086990
sub_8086990: @ 8086990
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080869B8 @ =gUnknown_83CC154
	ldr r2, _080869BC @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080869B8: .4byte gUnknown_83CC154
_080869BC: .4byte gTasks
	thumb_func_end sub_8086990

	thumb_func_start sub_80869C0
sub_80869C0: @ 80869C0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl FreezeObjectEvents
	ldr r5, _08086A18 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r5, 0x6]
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	adds r6, r4, 0
	adds r6, 0xA
	movs r0, 0xC
	adds r0, r4
	mov r8, r0
	adds r0, r6, 0
	mov r1, r8
	bl PlayerGetDestCoords
	ldr r2, _08086A1C @ =gObjectEvents
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	adds r1, r6, 0
	mov r2, r8
	bl MoveCoords
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086A18: .4byte gPlayerAvatar
_08086A1C: .4byte gObjectEvents
	thumb_func_end sub_80869C0

	thumb_func_start sub_8086A20
sub_8086A20: @ 8086A20
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086A64 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086A68 @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _08086A4A
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086A5C
_08086A4A:
	bl sub_805CB70
	adds r0, r4, 0
	movs r1, 0x45
	bl ObjectEventSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08086A5C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086A64: .4byte gPlayerAvatar
_08086A68: .4byte gObjectEvents
	thumb_func_end sub_8086A20

	thumb_func_start sub_8086A6C
sub_8086A6C: @ 8086A6C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08086AA8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086AAC @ =gObjectEvents
	adds r0, r1
	bl ObjectEventCheckHeldMovementStatus
	lsls r0, 24
	cmp r0, 0
	beq _08086AA2
	ldr r2, _08086AB0 @ =gFieldEffectArguments
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086AA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086AA8: .4byte gPlayerAvatar
_08086AAC: .4byte gObjectEvents
_08086AB0: .4byte gFieldEffectArguments
	thumb_func_end sub_8086A6C

	thumb_func_start sub_8086AB4
sub_8086AB4: @ 8086AB4
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086B1E
	ldr r5, _08086B24 @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086B28 @ =gObjectEvents
	adds r4, r0
	movs r0, 0x2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_80641C0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
	ldr r1, _08086B2C @ =gFieldEffectArguments
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	str r0, [r1]
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08086B1E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086B24: .4byte gPlayerAvatar
_08086B28: .4byte gObjectEvents
_08086B2C: .4byte gFieldEffectArguments
	thumb_func_end sub_8086AB4

	thumb_func_start sub_8086B30
sub_8086B30: @ 8086B30
	push {r4,r5,lr}
	ldr r5, _08086B9C @ =gPlayerAvatar
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086BA0 @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086B96
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r1, [r5]
	movs r0, 0xDF
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_80DC44C
	bl UnfreezeObjectEvents
	bl ScriptContext2_Disable
	movs r0, 0x9
	bl FieldEffectActiveListRemove
	ldr r0, _08086BA4 @ =sub_8086990
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x16
	bl HelpSystem_SetSomeVariable2
_08086B96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086B9C: .4byte gPlayerAvatar
_08086BA0: .4byte gObjectEvents
_08086BA4: .4byte sub_8086990
	thumb_func_end sub_8086B30

	thumb_func_start sub_8086BA8
sub_8086BA8: @ 8086BA8
	push {lr}
	ldr r0, _08086BC8 @ =gQuestLogState
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08086BBA
	movs r0, 0x8
	movs r1, 0x59
	bl sub_811278C
_08086BBA:
	ldr r0, _08086BCC @ =sub_8086BD0
	movs r1, 0xFF
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08086BC8: .4byte gQuestLogState
_08086BCC: .4byte sub_8086BD0
	thumb_func_end sub_8086BA8

	thumb_func_start sub_8086BD0
sub_8086BD0: @ 8086BD0
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08086BF8 @ =gUnknown_83CC168
	ldr r2, _08086BFC @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08086BF8: .4byte gUnknown_83CC168
_08086BFC: .4byte gTasks
	thumb_func_end sub_8086BD0

	thumb_func_start sub_8086C00
sub_8086C00: @ 8086C00
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl FreezeObjectEvents
	ldr r1, _08086C20 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086C20: .4byte gPlayerAvatar
	thumb_func_end sub_8086C00

	thumb_func_start sub_8086C24
sub_8086C24: @ 8086C24
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086C68 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086C6C @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _08086C4E
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086C60
_08086C4E:
	bl sub_805CBE8
	adds r0, r4, 0
	movs r1, 0x45
	bl ObjectEventSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08086C60:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086C68: .4byte gPlayerAvatar
_08086C6C: .4byte gObjectEvents
	thumb_func_end sub_8086C24

	thumb_func_start sub_8086C70
sub_8086C70: @ 8086C70
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _08086C9C @ =gPlayerAvatar
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086CA0 @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086CEE
	ldrb r1, [r5]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _08086CA4
	movs r0, 0x1
	b _08086CAE
	.align 2, 0
_08086C9C: .4byte gPlayerAvatar
_08086CA0: .4byte gObjectEvents
_08086CA4:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08086CC0
	movs r0, 0x2
_08086CAE:
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	b _08086CD2
_08086CC0:
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
_08086CD2:
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventForceSetSpecialAnim
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08086CEE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8086C70

	thumb_func_start sub_8086CF4
sub_8086CF4: @ 8086CF4
	push {r4,lr}
	ldr r4, _08086D2C @ =gPlayerAvatar
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086D30 @ =gObjectEvents
	adds r0, r1
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086D26
	movs r0, 0
	strb r0, [r4, 0x6]
	movs r0, 0x41
	bl FieldEffectActiveListRemove
	ldr r0, _08086D34 @ =sub_8086BD0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08086D26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086D2C: .4byte gPlayerAvatar
_08086D30: .4byte gObjectEvents
_08086D34: .4byte sub_8086BD0
	thumb_func_end sub_8086CF4

	thumb_func_start sub_8086D38
sub_8086D38: @ 8086D38
	push {r4,lr}
	ldr r0, _08086D84 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x68]
	movs r1, 0x78
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	ldr r0, _08086D88 @ =gSprites
	adds r2, r0
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _08086D8C @ =sub_8086D94
	str r0, [r2, 0x1C]
	ldr r0, _08086D90 @ =gFieldEffectArguments
	ldr r0, [r0]
	strh r0, [r2, 0x30]
	movs r0, 0x97
	bl PlaySE
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086D84: .4byte gFieldEffectObjectTemplatePointers
_08086D88: .4byte gSprites
_08086D8C: .4byte sub_8086D94
_08086D90: .4byte gFieldEffectArguments
	thumb_func_end sub_8086D38

	thumb_func_start sub_8086D94
sub_8086D94: @ 8086D94
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08086DF6
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08086E0C @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08086DF6:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _08086E06
	adds r0, r4, 0
	movs r1, 0x1E
	bl FieldEffectStop
_08086E06:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086E0C: .4byte gSprites
	thumb_func_end sub_8086D94

	thumb_func_start FldEff_UseFly
FldEff_UseFly: @ 8086E10
	push {lr}
	ldr r0, _08086E34 @ =sub_8086E40
	movs r1, 0xFE
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086E38 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08086E3C @ =gFieldEffectArguments
	ldr r0, [r0]
	strh r0, [r1, 0xA]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08086E34: .4byte sub_8086E40
_08086E38: .4byte gTasks
_08086E3C: .4byte gFieldEffectArguments
	thumb_func_end FldEff_UseFly

	thumb_func_start sub_8086E40
sub_8086E40: @ 8086E40
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08086E68 @ =gUnknown_83CC178
	ldr r2, _08086E6C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08086E68: .4byte gUnknown_83CC178
_08086E6C: .4byte gTasks
	thumb_func_end sub_8086E40

	thumb_func_start sub_8086E70
sub_8086E70: @ 8086E70
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08086EC0 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086EC4 @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _08086E9A
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086EB8
_08086E9A:
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	bl sub_805CB70
	adds r0, r4, 0
	movs r1, 0x45
	bl ObjectEventSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08086EB8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086EC0: .4byte gPlayerAvatar
_08086EC4: .4byte gObjectEvents
	thumb_func_end sub_8086E70

	thumb_func_start sub_8086EC8
sub_8086EC8: @ 8086EC8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08086F00 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086F04 @ =gObjectEvents
	adds r0, r1
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086EF8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r1, _08086F08 @ =gFieldEffectArguments
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
_08086EF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086F00: .4byte gPlayerAvatar
_08086F04: .4byte gObjectEvents
_08086F08: .4byte gFieldEffectArguments
	thumb_func_end sub_8086EC8

	thumb_func_start sub_8086F0C
sub_8086F0C: @ 8086F0C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086F54
	ldr r0, _08086F5C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086F60 @ =gObjectEvents
	adds r5, r0, r1
	ldrh r1, [r4, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08086F44
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_80DC44C
	ldrb r0, [r5, 0x1A]
	movs r1, 0
	bl sub_80DC478
_08086F44:
	bl sub_8087168
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086F54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086F5C: .4byte gPlayerAvatar
_08086F60: .4byte gObjectEvents
	thumb_func_end sub_8086F0C

	thumb_func_start sub_8086F64
sub_8086F64: @ 8086F64
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_80871AC
	lsls r0, 24
	cmp r0, 0
	beq _08086F98
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	ldr r0, _08086FA0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086FA4 @ =gObjectEvents
	adds r0, r1
	movs r1, 0x2
	bl ObjectEventSetHeldMovement
_08086F98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086FA0: .4byte gPlayerAvatar
_08086FA4: .4byte gObjectEvents
	thumb_func_end sub_8086F64

	thumb_func_start sub_8086FA8
sub_8086FA8: @ 8086FA8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08086FF4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086FF8 @ =gObjectEvents
	adds r2, r0, r1
	ldrh r1, [r4, 0xC]
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08086FCE
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08086FEC
_08086FCE:
	adds r0, r2, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086FEC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x97
	bl PlaySE
	ldrb r0, [r4, 0xA]
	bl sub_80871C8
_08086FEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086FF4: .4byte gPlayerAvatar
_08086FF8: .4byte gObjectEvents
	thumb_func_end sub_8086FA8

	thumb_func_start sub_8086FFC
sub_8086FFC: @ 8086FFC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0808705A
	ldr r0, _08087060 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087064 @ =gObjectEvents
	adds r4, r0
	movs r0, 0x2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087068 @ =gSprites
	adds r0, r1
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r0, [r4, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	movs r1, 0x54
	bl ObjectEventSetHeldMovement
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	strh r0, [r5, 0xC]
_0808705A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087060: .4byte gPlayerAvatar
_08087064: .4byte gObjectEvents
_08087068: .4byte gSprites
	thumb_func_end sub_8086FFC

	thumb_func_start sub_808706C
sub_808706C: @ 808706C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _080870FC
	ldr r0, _08087104 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087108 @ =gObjectEvents
	adds r4, r0
	adds r0, r4, 0
	bl ObjectEventClearAnimIfSpecialAnimActive
	ldrb r1, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8087204
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0808710C @ =gSprites
	adds r0, r4
	ldr r1, _08087110 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	ldrb r1, [r1, 0x8]
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	bl sub_80877FC
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _08087114 @ =sub_8087828
	str r1, [r0]
	bl CameraObjectReset2
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080870FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087104: .4byte gPlayerAvatar
_08087108: .4byte gObjectEvents
_0808710C: .4byte gSprites
_08087110: .4byte gSaveBlock2Ptr
_08087114: .4byte sub_8087828
	thumb_func_end sub_808706C

	thumb_func_start sub_8087118
sub_8087118: @ 8087118
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_80871AC
	lsls r0, 24
	cmp r0, 0
	beq _08087132
	bl WarpFadeOutScreen
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087132:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8087118

	thumb_func_start sub_8087138
sub_8087138: @ 8087138
	push {lr}
	ldr r0, _08087160 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808715A
	movs r0, 0x1F
	bl FieldEffectActiveListRemove
	ldr r0, _08087164 @ =sub_8086E40
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808715A:
	pop {r0}
	bx r0
	.align 2, 0
_08087160: .4byte gPaletteFade
_08087164: .4byte sub_8086E40
	thumb_func_end sub_8087138

	thumb_func_start sub_8087168
sub_8087168: @ 8087168
	push {lr}
	ldr r0, _080871A0 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x68]
	movs r1, 0xFF
	movs r2, 0xB4
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _080871A4 @ =gSprites
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	ldr r1, _080871A8 @ =sub_8087220
	str r1, [r2, 0x1C]
	pop {r1}
	bx r1
	.align 2, 0
_080871A0: .4byte gFieldEffectObjectTemplatePointers
_080871A4: .4byte gSprites
_080871A8: .4byte sub_8087220
	thumb_func_end sub_8087168

	thumb_func_start sub_80871AC
sub_80871AC: @ 80871AC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080871C4 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_080871C4: .4byte gSprites
	thumb_func_end sub_80871AC

	thumb_func_start sub_80871C8
sub_80871C8: @ 80871C8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080871FC @ =gSprites
	adds r4, r0
	ldr r0, _08087200 @ =sub_80872F0
	str r0, [r4, 0x1C]
	movs r1, 0
	movs r0, 0x78
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2E
	movs r2, 0x10
	bl memset
	movs r0, 0x40
	strh r0, [r4, 0x3A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080871FC: .4byte gSprites
_08087200: .4byte sub_80872F0
	thumb_func_end sub_80871C8

	thumb_func_start sub_8087204
sub_8087204: @ 8087204
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0808721C @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3A]
	bx lr
	.align 2, 0
_0808721C: .4byte gSprites
	thumb_func_end sub_8087204

	thumb_func_start sub_8087220
sub_8087220: @ 8087220
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080872E2
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808727A
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _0808725C @ =gUnknown_83CC1CC
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _08087260 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08087264
	movs r0, 0x80
	b _08087266
	.align 2, 0
_0808725C: .4byte gUnknown_83CC1CC
_08087260: .4byte gSaveBlock2Ptr
_08087264:
	movs r0, 0x76
_08087266:
	strh r0, [r4, 0x20]
	ldr r0, _080872E8 @ =0x0000ffd0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x40
	strh r0, [r4, 0x30]
	adds r0, 0xC0
	strh r0, [r4, 0x32]
_0808727A:
	ldrh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x32]
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	ldr r0, _080872EC @ =0x000007ff
	cmp r1, r0
	bgt _080872B0
	adds r0, r2, 0
	adds r0, 0x60
	strh r0, [r4, 0x32]
_080872B0:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x81
	ble _080872E2
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
_080872E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080872E8: .4byte 0x0000ffd0
_080872EC: .4byte 0x000007ff
	thumb_func_end sub_8087220

	thumb_func_start sub_80872F0
sub_80872F0: @ 80872F0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _0808734E
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087360 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_0808734E:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _0808735A
	movs r0, 0x1
	strh r0, [r4, 0x3C]
_0808735A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087360: .4byte gSprites
	thumb_func_end sub_80872F0

	thumb_func_start sub_8087364
sub_8087364: @ 8087364
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808744E
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080873C4
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080873A0 @ =gUnknown_83CC1CC
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _080873A4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080873A8
	movs r0, 0x70
	b _080873AA
	.align 2, 0
_080873A0: .4byte gUnknown_83CC1CC
_080873A4: .4byte gSaveBlock2Ptr
_080873A8:
	movs r0, 0x64
_080873AA:
	strh r0, [r4, 0x20]
	ldr r0, _08087454 @ =0x0000ffe0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0xF0
	strh r0, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0x80
	strh r0, [r4, 0x36]
_080873C4:
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r2, r1
	ldrh r0, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x30]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	movs r1, 0x20
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	ble _08087406
	ldrh r0, [r4, 0x36]
	subs r0, r1, r0
	strh r0, [r4, 0x32]
_08087406:
	ldrh r1, [r4, 0x36]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0xFF
	bgt _08087416
	adds r0, r1, 0
	adds r0, 0x18
	strh r0, [r4, 0x36]
_08087416:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0xFF
	bgt _08087420
	strh r2, [r4, 0x32]
_08087420:
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	ble _0808744E
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0808744E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087454: .4byte 0x0000ffe0
	thumb_func_end sub_8087364

	thumb_func_start sub_8087458
sub_8087458: @ 8087458
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80871C8
	ldr r1, _0808747C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08087480 @ =sub_8087364
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808747C: .4byte gSprites
_08087480: .4byte sub_8087364
	thumb_func_end sub_8087458

	thumb_func_start FldEff_FlyIn
FldEff_FlyIn: @ 8087484
	push {lr}
	ldr r0, _08087494 @ =sub_8087498
	movs r1, 0xFE
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08087494: .4byte sub_8087498
	thumb_func_end FldEff_FlyIn

	thumb_func_start sub_8087498
sub_8087498: @ 8087498
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080874C0 @ =gUnknown_83CC1D4
	ldr r2, _080874C4 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080874C0: .4byte gUnknown_83CC1D4
_080874C4: .4byte gTasks
	thumb_func_end sub_8087498

	thumb_func_start sub_80874C8
sub_80874C8: @ 80874C8
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, _080875B4 @ =gPlayerAvatar
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080875B8 @ =gObjectEvents
	adds r5, r0, r1
	adds r0, r5, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _080874F2
	adds r0, r5, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _080875AE
_080874F2:
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x21
	strh r0, [r6, 0xC]
	ldrb r0, [r4]
	strh r0, [r6, 0x26]
	movs r0, 0x1
	strb r0, [r4, 0x6]
	bl SetPlayerAvatarStateMask
	ldrh r1, [r6, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0808751A
	ldrb r0, [r5, 0x1A]
	movs r1, 0
	bl sub_80DC44C
_0808751A:
	movs r0, 0x2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl ObjectEventSetGraphicsId
	bl CameraObjectReset2
	adds r0, r5, 0
	movs r1, 0x3
	bl ObjectEventTurn
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080875BC @ =gSprites
	adds r0, r4
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r1, [r5, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	bl sub_8087168
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0xA]
	bl sub_80871C8
	ldrb r0, [r6, 0xA]
	ldrb r1, [r5, 0x4]
	bl sub_8087204
	movs r0, 0xA
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080875C0 @ =gSaveBlock2Ptr
	ldr r1, [r1]
	ldrb r1, [r1, 0x8]
	lsls r1, 25
	movs r2, 0x80
	lsls r2, 18
	adds r1, r2
	lsrs r1, 24
	bl StartSpriteAnim
	movs r0, 0xA
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl sub_80877FC
	movs r2, 0xA
	ldrsh r1, [r6, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080875C4 @ =sub_8087828
	str r1, [r0]
_080875AE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080875B4: .4byte gPlayerAvatar
_080875B8: .4byte gObjectEvents
_080875BC: .4byte gSprites
_080875C0: .4byte gSaveBlock2Ptr
_080875C4: .4byte sub_8087828
	thumb_func_end sub_80874C8

	thumb_func_start sub_80875C8
sub_80875C8: @ 80875C8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08087638 @ =gSprites
	adds r0, r6
	bl sub_80878C0
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080875F2
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08087630
_080875F2:
	ldr r0, _0808763C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087640 @ =gObjectEvents
	adds r0, r1
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r6
	ldrb r0, [r5, 0xA]
	movs r1, 0x40
	bl sub_8087204
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
_08087630:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087638: .4byte gSprites
_0808763C: .4byte gPlayerAvatar
_08087640: .4byte gObjectEvents
	thumb_func_end sub_80875C8

	thumb_func_start sub_8087644
sub_8087644: @ 8087644
	push {r4,lr}
	sub sp, 0x24
	adds r4, r0, 0
	ldr r1, _0808768C @ =gUnknown_83CC1F0
	mov r0, sp
	movs r2, 0x24
	bl memcpy
	ldr r0, _08087690 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087694 @ =gSprites
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _08087682
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087682:
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808768C: .4byte gUnknown_83CC1F0
_08087690: .4byte gPlayerAvatar
_08087694: .4byte gSprites
	thumb_func_end sub_8087644

	thumb_func_start sub_8087698
sub_8087698: @ 8087698
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0xA]
	bl sub_80871AC
	lsls r0, 24
	cmp r0, 0
	beq _080876FC
	ldr r0, _08087704 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _08087708 @ =gObjectEvents
	adds r5, r0
	ldrb r0, [r5, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0808770C @ =gSprites
	adds r4, r0
	ldrb r1, [r5, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r0, 0x12
	ldrsh r2, [r5, r0]
	adds r0, r5, 0
	bl sub_805F724
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	bl sub_805CB70
	adds r0, r5, 0
	movs r1, 0x45
	bl ObjectEventSetHeldMovement
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_080876FC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087704: .4byte gPlayerAvatar
_08087708: .4byte gObjectEvents
_0808770C: .4byte gSprites
	thumb_func_end sub_8087698

	thumb_func_start sub_8087710
sub_8087710: @ 8087710
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08087740 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087744 @ =gObjectEvents
	adds r0, r1
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087738
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r4, 0xA]
	bl sub_8087458
_08087738:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087740: .4byte gPlayerAvatar
_08087744: .4byte gObjectEvents
	thumb_func_end sub_8087710

	thumb_func_start sub_8087748
sub_8087748: @ 8087748
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_80871AC
	lsls r0, 24
	cmp r0, 0
	beq _08087774
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808777C @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_08087774:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808777C: .4byte gSprites
	thumb_func_end sub_8087748

	thumb_func_start fishE
fishE: @ 8087780
	push {r4-r7,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _080877EA
	ldr r6, _080877F0 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080877F4 @ =gObjectEvents
	adds r4, r0, r1
	movs r7, 0
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080877B4
	movs r7, 0x2
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_80DC44C
_080877B4:
	adds r0, r7, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	adds r0, r4, 0
	movs r1, 0x1
	bl ObjectEventTurn
	ldrh r0, [r5, 0x26]
	strb r0, [r6]
	movs r0, 0
	strb r0, [r6, 0x6]
	movs r0, 0x20
	bl FieldEffectActiveListRemove
	ldr r0, _080877F8 @ =sub_8087498
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080877EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080877F0: .4byte gPlayerAvatar
_080877F4: .4byte gObjectEvents
_080877F8: .4byte sub_8087498
	thumb_func_end fishE

	thumb_func_start sub_80877FC
sub_80877FC: @ 80877FC
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r5, r1, 24
	lsrs r5, 24
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _08087824 @ =gUnknown_83CC23C
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	adds r1, r5, 0
	bl StartSpriteAffineAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087824: .4byte gUnknown_83CC23C
	thumb_func_end sub_80877FC

	thumb_func_start sub_8087828
sub_8087828: @ 8087828
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0xB4
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _08087886
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080878BC @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08087886:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _080878B4
	movs r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
_080878B4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080878BC: .4byte gSprites
	thumb_func_end sub_8087828

	thumb_func_start sub_80878C0
sub_80878C0: @ 80878C0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrb r5, [r4, 0x1]
	lsls r0, r5, 30
	cmp r0, 0
	beq _08087916
	ldr r1, _0808791C @ =gOamMatrices
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r3, r0, 27
	lsls r0, r3, 3
	adds r1, r0, r1
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	beq _080878EC
	movs r6, 0x6
	ldrsh r0, [r1, r6]
	cmp r0, r2
	bne _08087916
_080878EC:
	movs r0, 0x4
	negs r0, r0
	ands r0, r5
	strb r0, [r4, 0x1]
	adds r0, r3, 0
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _08087920 @ =sub_80872F0
	str r0, [r4, 0x1C]
_08087916:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808791C: .4byte gOamMatrices
_08087920: .4byte sub_80872F0
	thumb_func_end sub_80878C0

	thumb_func_start sub_8087924
sub_8087924: @ 8087924
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r7, _080879C4 @ =gFieldEffectArguments
	ldrb r0, [r7]
	ldrb r1, [r7, 0x4]
	ldrb r2, [r7, 0x8]
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080879BA
	mov r0, sp
	ldrb r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080879C8 @ =gObjectEvents
	adds r4, r0
	movs r0, 0x10
	ldrsh r5, [r4, r0]
	subs r5, 0x7
	movs r0, 0x12
	ldrsh r6, [r4, r0]
	subs r6, 0x7
	ldr r1, [r7, 0xC]
	subs r5, r1, r5
	lsls r5, 4
	ldr r2, [r7, 0x10]
	subs r6, r2, r6
	lsls r6, 4
	adds r1, 0x7
	lsls r1, 16
	asrs r1, 16
	adds r2, 0x7
	lsls r2, 16
	asrs r2, 16
	adds r0, r4, 0
	bl npc_coords_shift
	ldr r0, _080879CC @ =sub_80879D8
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080879D0 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	ldrb r0, [r4, 0x4]
	strh r0, [r2, 0xA]
	ldr r3, _080879D4 @ =gSprites
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x20]
	adds r0, r5
	strh r0, [r2, 0xC]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x22]
	adds r0, r6
	strh r0, [r2, 0xE]
	ldr r0, [r7, 0x14]
	strh r0, [r2, 0x18]
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r2, 0x1A]
_080879BA:
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080879C4: .4byte gFieldEffectArguments
_080879C8: .4byte gObjectEvents
_080879CC: .4byte sub_80879D8
_080879D0: .4byte gTasks
_080879D4: .4byte gSprites
	thumb_func_end sub_8087924

	thumb_func_start sub_80879D8
sub_80879D8: @ 80879D8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08087A04 @ =gTasks+0x8
	adds r5, r0, r1
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087A08 @ =gSprites
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08087A0C
	cmp r0, 0x1
	beq _08087A4A
	b _08087AA8
	.align 2, 0
_08087A04: .4byte gTasks+0x8
_08087A08: .4byte gSprites
_08087A0C:
	ldrh r0, [r6, 0x20]
	lsls r0, 4
	strh r0, [r5, 0x8]
	ldrh r0, [r6, 0x22]
	lsls r0, 4
	strh r0, [r5, 0xA]
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	lsls r0, 4
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0xC]
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	lsls r0, 4
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0xE]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08087A4A:
	ldrh r1, [r5, 0x10]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08087A78
	subs r0, r1, 0x1
	strh r0, [r5, 0x10]
	ldrh r1, [r5, 0xC]
	ldrh r0, [r5, 0x8]
	adds r1, r0
	strh r1, [r5, 0x8]
	ldrh r0, [r5, 0xE]
	ldrh r2, [r5, 0xA]
	adds r0, r2
	strh r0, [r5, 0xA]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r6, 0x20]
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r6, 0x22]
	b _08087AA8
_08087A78:
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087AB0 @ =gObjectEvents
	adds r4, r0
	ldrh r0, [r5, 0x4]
	strh r0, [r6, 0x20]
	ldrh r0, [r5, 0x6]
	strh r0, [r6, 0x22]
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x43
	bl FieldEffectActiveListRemove
	adds r0, r7, 0
	bl DestroyTask
_08087AA8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087AB0: .4byte gObjectEvents
	thumb_func_end sub_80879D8

	thumb_func_start sub_8087AB4
sub_8087AB4: @ 8087AB4
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08087AF8 @ =gFieldEffectArguments
	ldrb r0, [r4]
	ldrb r1, [r4, 0x4]
	ldrb r2, [r4, 0x8]
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08087B04
	ldr r0, _08087AFC @ =sub_8087BC0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08087B00 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, 0xC]
	ldr r0, [r4]
	strh r0, [r1, 0x14]
	ldr r0, [r4, 0x4]
	strh r0, [r1, 0x16]
	ldr r0, [r4, 0x8]
	strh r0, [r1, 0x18]
	b _08087B0A
	.align 2, 0
_08087AF8: .4byte gFieldEffectArguments
_08087AFC: .4byte sub_8087BC0
_08087B00: .4byte gTasks
_08087B04:
	movs r0, 0x44
	bl FieldEffectActiveListRemove
_08087B0A:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8087AB4

	thumb_func_start sub_8087B14
sub_8087B14: @ 8087B14
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08087B4C @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08087B50
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08087B54
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087B54
	subs r0, r1, 0x1
	b _08087B52
	.align 2, 0
_08087B4C: .4byte gTasks+0x8
_08087B50:
	movs r0, 0x4
_08087B52:
	strh r0, [r4, 0xA]
_08087B54:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08087B8E
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08087B84
	ldrh r1, [r4, 0xA]
	negs r1, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl SetCameraPanning
	b _08087B8E
_08087B84:
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
_08087B8E:
	bl UpdateCameraPanning
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08087BA0
	adds r0, r5, 0
	bl DestroyTask
_08087BA0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8087B14

	thumb_func_start sub_8087BA8
sub_8087BA8: @ 8087BA8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08087BBC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x16]
	bx lr
	.align 2, 0
_08087BBC: .4byte gTasks
	thumb_func_end sub_8087BA8

	thumb_func_start sub_8087BC0
sub_8087BC0: @ 8087BC0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08087BF8 @ =gTasks+0x8
	adds r4, r0
	bl InstallCameraPanAheadCallback
	movs r0, 0
	bl SetCameraPanningCallback
	ldr r1, _08087BFC @ =gUnknown_83CC244
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087BF8: .4byte gTasks+0x8
_08087BFC: .4byte gUnknown_83CC244
	thumb_func_end sub_8087BC0

	thumb_func_start sub_8087C00
sub_8087C00: @ 8087C00
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08087C28 @ =sub_8087B14
	movs r1, 0x5A
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x51
	bl PlaySE
	strh r4, [r5, 0xA]
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087C28: .4byte sub_8087B14
	thumb_func_end sub_8087C00

	thumb_func_start sub_8087C2C
sub_8087C2C: @ 8087C2C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	ldrh r0, [r7, 0x6]
	adds r0, 0x1
	strh r0, [r7, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _08087C9A
	ldr r2, _08087CA4 @ =gObjectEvents
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087CA8 @ =gSprites
	adds r4, r0
	ldrb r0, [r1, 0x1]
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldr r6, _08087CAC @ =0x0000ffff
	ldr r5, _08087CB0 @ =0x00007fff
	adds r0, r6, 0
	movs r1, 0x10
	adds r2, r5, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r4, 0
	bl sub_8087CFC
	movs r0, 0x50
	bl PlaySE
	ldrb r0, [r7, 0xA]
	bl sub_8087BA8
	movs r0, 0
	strh r0, [r7, 0x6]
	ldrh r0, [r7, 0x2]
	adds r0, 0x1
	strh r0, [r7, 0x2]
_08087C9A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087CA4: .4byte gObjectEvents
_08087CA8: .4byte gSprites
_08087CAC: .4byte 0x0000ffff
_08087CB0: .4byte 0x00007fff
	thumb_func_end sub_8087C2C

	thumb_func_start sub_8087CB4
sub_8087CB4: @ 8087CB4
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08087CF4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087CEE
	ldr r0, _08087CF8 @ =sub_8087B14
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08087CEE
	bl InstallCameraPanAheadCallback
	ldrb r0, [r4, 0xC]
	ldrb r1, [r4, 0xE]
	ldrb r2, [r4, 0x10]
	bl RemoveObjectEventByLocalIdAndMap
	movs r0, 0x44
	bl FieldEffectActiveListRemove
	adds r0, r5, 0
	bl DestroyTask
_08087CEE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087CF4: .4byte gPaletteFade
_08087CF8: .4byte sub_8087B14
	thumb_func_end sub_8087CB4

	thumb_func_start sub_8087CFC
sub_8087CFC: @ 8087CFC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r0, _08087D80 @ =gUnknown_300506C
	movs r1, 0
	ldrsh r2, [r0, r1]
	movs r3, 0x20
	ldrsh r0, [r6, r3]
	adds r2, r0
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	adds r2, r0
	ldr r0, _08087D84 @ =gUnknown_3005068
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r3, 0x22
	ldrsh r1, [r6, r3]
	adds r0, r1
	movs r3, 0x26
	ldrsh r1, [r6, r3]
	adds r0, r1
	subs r0, 0x4
	movs r5, 0
	lsls r2, 16
	mov r8, r2
	lsls r7, r0, 16
_08087D32:
	ldr r0, _08087D88 @ =gUnknown_83CC2A0
	mov r2, r8
	asrs r1, r2, 16
	asrs r2, r7, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08087D6E
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087D8C @ =gSprites
	adds r4, r0
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	strh r5, [r4, 0x2E]
	ldrb r1, [r6, 0x5]
	lsrs r1, 4
	lsls r1, 4
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
_08087D6E:
	adds r5, 0x1
	cmp r5, 0x3
	ble _08087D32
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087D80: .4byte gUnknown_300506C
_08087D84: .4byte gUnknown_3005068
_08087D88: .4byte gUnknown_83CC2A0
_08087D8C: .4byte gSprites
	thumb_func_end sub_8087CFC

	thumb_func_start sub_8087D90
sub_8087D90: @ 8087D90
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _08087DBC
	cmp r0, 0x1
	bgt _08087DA6
	cmp r0, 0
	beq _08087DB0
	b _08087DDA
_08087DA6:
	cmp r0, 0x2
	beq _08087DC8
	cmp r0, 0x3
	beq _08087DCE
	b _08087DDA
_08087DB0:
	ldrh r0, [r1, 0x20]
	subs r0, 0x10
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0xC
	b _08087DD8
_08087DBC:
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0xC
	b _08087DD8
_08087DC8:
	ldrh r0, [r1, 0x20]
	subs r0, 0x10
	b _08087DD2
_08087DCE:
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
_08087DD2:
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x22]
	adds r0, 0xC
_08087DD8:
	strh r0, [r1, 0x22]
_08087DDA:
	ldrh r0, [r1, 0x20]
	adds r0, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF8
	bhi _08087DF6
	movs r0, 0x22
	ldrsh r2, [r1, r0]
	movs r0, 0x4
	negs r0, r0
	cmp r2, r0
	blt _08087DF6
	cmp r2, 0xA4
	ble _08087DFC
_08087DF6:
	adds r0, r1, 0
	bl DestroySprite
_08087DFC:
	pop {r0}
	bx r0
	thumb_func_end sub_8087D90

	thumb_func_start sub_8087E00
sub_8087E00: @ 8087E00
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08087E24 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087E1E
	movs r0, 0x45
	bl FieldEffectActiveListRemove
	adds r0, r4, 0
	bl DestroyTask
_08087E1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E24: .4byte gPaletteFade
	thumb_func_end sub_8087E00

	thumb_func_start sub_8087E28
sub_8087E28: @ 8087E28
	push {r4,r5,lr}
	sub sp, 0x4
	movs r4, 0x1
	negs r4, r4
	ldr r5, _08087E5C @ =0x00007fff
	adds r0, r4, 0
	movs r1, 0x10
	adds r2, r5, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	adds r1, r4, 0
	movs r2, 0xF
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08087E60 @ =sub_8087E00
	movs r1, 0x5A
	bl CreateTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087E5C: .4byte 0x00007fff
_08087E60: .4byte sub_8087E00
	thumb_func_end sub_8087E28

	.align 2, 0 @ Don't pad with nop.
