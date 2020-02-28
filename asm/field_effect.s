	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start FldEff_Unk41
FldEff_Unk41: @ 8086BA8
	push {lr}
	ldr r0, _08086BC8 @ =gQuestLogState
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08086BBA
	movs r0, 0x8
	movs r1, 0x59
	bl sub_811278C
_08086BBA:
	ldr r0, _08086BCC @ =Task_FldEffUnk41
	movs r1, 0xFF
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08086BC8: .4byte gQuestLogState
_08086BCC: .4byte Task_FldEffUnk41
	thumb_func_end FldEff_Unk41

	thumb_func_start Task_FldEffUnk41
Task_FldEffUnk41: @ 8086BD0
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08086BF8 @ =sUnk41EffectFuncs
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
_08086BF8: .4byte sUnk41EffectFuncs
_08086BFC: .4byte gTasks
	thumb_func_end Task_FldEffUnk41

	thumb_func_start Unk41Effect_1
Unk41Effect_1: @ 8086C00
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
	thumb_func_end Unk41Effect_1

	thumb_func_start Unk41Effect_2
Unk41Effect_2: @ 8086C24
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
	thumb_func_end Unk41Effect_2

	thumb_func_start Unk41Effect_3
Unk41Effect_3: @ 8086C70
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
	thumb_func_end Unk41Effect_3

	thumb_func_start Unk41Effect_4
Unk41Effect_4: @ 8086CF4
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
	ldr r0, _08086D34 @ =Task_FldEffUnk41
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
_08086D34: .4byte Task_FldEffUnk41
	thumb_func_end Unk41Effect_4

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
