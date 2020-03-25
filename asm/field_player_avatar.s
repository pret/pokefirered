	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_805DAB0
sub_805DAB0: @ 805DAB0
	push {r4,lr}
	ldr r4, _0805DACC @ =sub_805DB04
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DACC: .4byte sub_805DB04
	thumb_func_end sub_805DAB0

	thumb_func_start sub_805DAD0
sub_805DAD0: @ 805DAD0
	push {lr}
	ldr r0, _0805DAE0 @ =sub_805DB04
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805DAE0: .4byte sub_805DB04
	thumb_func_end sub_805DAD0

	thumb_func_start sub_805DAE4
sub_805DAE4: @ 805DAE4
	ldr r1, _0805DAEC @ =gUnknown_2036E34
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805DAEC: .4byte gUnknown_2036E34
	thumb_func_end sub_805DAE4

	thumb_func_start sub_805DAF0
sub_805DAF0: @ 805DAF0
	push {lr}
	ldr r1, _0805DB00 @ =gUnknown_2036E34
	ldrb r0, [r1]
	cmp r0, 0
	bne _0805DAFC
	movs r0, 0x1
_0805DAFC:
	pop {r1}
	bx r1
	.align 2, 0
_0805DB00: .4byte gUnknown_2036E34
	thumb_func_end sub_805DAF0

	thumb_func_start sub_805DB04
sub_805DB04: @ 805DB04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r0, _0805DB48 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805DB4C @ =gObjectEvents
	adds r4, r0, r1
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805DB50 @ =gSprites
	adds r7, r0, r1
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0805DB54 @ =gTasks+0x8
	adds r5, r0, r1
	movs r0, 0
	ldrsh r6, [r5, r0]
	cmp r6, 0x1
	beq _0805DBBA
	cmp r6, 0x1
	bgt _0805DB58
	cmp r6, 0
	beq _0805DB5E
	b _0805DBFA
	.align 2, 0
_0805DB48: .4byte gPlayerAvatar
_0805DB4C: .4byte gObjectEvents
_0805DB50: .4byte gSprites
_0805DB54: .4byte gTasks+0x8
_0805DB58:
	cmp r6, 0x2
	beq _0805DBF4
	b _0805DBFA
_0805DB5E:
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805DBFA
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805DAE4
	movs r1, 0
	mov r8, r1
	strh r6, [r5, 0x2]
	movs r0, 0x1
	strh r0, [r5, 0x4]
	ldrh r0, [r7, 0x26]
	ldrh r2, [r7, 0x22]
	adds r0, r2
	lsls r0, 4
	strh r0, [r5, 0x6]
	strh r6, [r7, 0x26]
	bl CameraObjectReset2
	ldrb r0, [r4, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r7, 0x5]
	adds r0, r7, 0
	adds r0, 0x43
	mov r1, r8
	strb r1, [r0]
	adds r2, r7, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0805DBBA:
	adds r1, r5, 0x2
	adds r0, r4, 0
	bl sub_805DDC8
	ldrh r0, [r5, 0x6]
	ldrh r1, [r5, 0x4]
	subs r0, r1
	strh r0, [r5, 0x6]
	adds r1, 0x3
	strh r1, [r5, 0x4]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r7, 0x22]
	movs r2, 0x22
	ldrsh r1, [r7, r2]
	ldr r0, _0805DBF0 @ =gTotalCameraPixelOffsetY
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r1, r0
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	bge _0805DBFA
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0805DBFA
	.align 2, 0
_0805DBF0: .4byte gTotalCameraPixelOffsetY
_0805DBF4:
	adds r0, r2, 0
	bl DestroyTask
_0805DBFA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_805DB04

	thumb_func_start sub_805DC04
sub_805DC04: @ 805DC04
	push {r4,lr}
	ldr r4, _0805DC20 @ =sub_805DC38
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DC20: .4byte sub_805DC38
	thumb_func_end sub_805DC04

	thumb_func_start sub_805DC24
sub_805DC24: @ 805DC24
	push {lr}
	ldr r0, _0805DC34 @ =sub_805DC38
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805DC34: .4byte sub_805DC38
	thumb_func_end sub_805DC24

	thumb_func_start sub_805DC38
sub_805DC38: @ 805DC38
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0805DC80 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805DC84 @ =gObjectEvents
	adds r4, r0, r1
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805DC88 @ =gSprites
	adds r7, r0, r1
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _0805DC8C @ =gTasks+0x8
	adds r5, r0, r1
	movs r2, 0
	ldrsh r6, [r5, r2]
	cmp r6, 0x1
	beq _0805DD1A
	cmp r6, 0x1
	bgt _0805DC90
	cmp r6, 0
	beq _0805DC9A
	b _0805DDBA
	.align 2, 0
_0805DC80: .4byte gPlayerAvatar
_0805DC84: .4byte gObjectEvents
_0805DC88: .4byte gSprites
_0805DC8C: .4byte gTasks+0x8
_0805DC90:
	cmp r6, 0x2
	beq _0805DD58
	cmp r6, 0x3
	beq _0805DD76
	b _0805DDBA
_0805DC9A:
	bl sub_805DAF0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	ldr r1, _0805DD54 @ =gUnknown_835B92C
	movs r3, 0xA
	ldrsh r0, [r5, r3]
	adds r0, r1
	ldrb r0, [r0]
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventForceSetHeldMovement
	movs r0, 0
	mov r9, r0
	strh r6, [r5, 0x2]
	movs r0, 0x74
	strh r0, [r5, 0x4]
	ldrh r0, [r7, 0x22]
	strh r0, [r5, 0x8]
	ldrb r0, [r7, 0x5]
	lsls r0, 28
	lsrs r0, 30
	strh r0, [r5, 0xC]
	movs r1, 0x43
	adds r1, r7
	mov r8, r1
	ldrb r0, [r1]
	strh r0, [r5, 0xE]
	ldrh r0, [r7, 0x26]
	adds r0, 0x20
	negs r0, r0
	lsls r0, 4
	strh r0, [r5, 0x6]
	strh r6, [r7, 0x26]
	bl CameraObjectReset2
	ldrb r0, [r4, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, 0x5]
	mov r3, r9
	mov r2, r8
	strb r3, [r2]
	adds r2, r7, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0805DD1A:
	adds r1, r5, 0x2
	adds r0, r4, 0
	bl sub_805DDC8
	ldrh r0, [r5, 0x4]
	ldrh r2, [r5, 0x6]
	adds r1, r0, r2
	strh r1, [r5, 0x6]
	subs r0, 0x3
	strh r0, [r5, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bgt _0805DD3A
	movs r0, 0x4
	strh r0, [r5, 0x4]
_0805DD3A:
	ldrh r0, [r5, 0x6]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r7, 0x22]
	ldrh r2, [r5, 0x8]
	movs r3, 0x8
	ldrsh r1, [r5, r3]
	cmp r0, r1
	blt _0805DDBA
	strh r2, [r7, 0x22]
	movs r0, 0
	strh r0, [r5, 0x10]
	b _0805DD6E
	.align 2, 0
_0805DD54: .4byte gUnknown_835B92C
_0805DD58:
	adds r1, r5, 0x2
	adds r0, r4, 0
	bl sub_805DDC8
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0805DDBA
_0805DD6E:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0805DDBA
_0805DD76:
	movs r0, 0xA
	ldrsh r6, [r5, r0]
	adds r1, r5, 0x2
	adds r0, r4, 0
	bl sub_805DDC8
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0805DDBA
	ldrb r1, [r4, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0x3
	ldrb r1, [r5, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
	ldrh r1, [r5, 0xE]
	adds r0, r7, 0
	adds r0, 0x43
	strb r1, [r0]
	bl CameraObjectReset1
	mov r0, r8
	bl DestroyTask
_0805DDBA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_805DC38

	thumb_func_start sub_805DDC8
sub_805DDC8: @ 805DDC8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldrh r1, [r6]
	movs r2, 0
	ldrsh r0, [r6, r2]
	cmp r0, 0x7
	bgt _0805DDE4
	adds r0, r1, 0x1
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0805DE20
_0805DDE4:
	adds r0, r5, 0
	bl ObjectEventCheckHeldMovementStatus
	lsls r0, 24
	cmp r0, 0
	beq _0805DE20
	ldr r4, _0805DE1C @ =gUnknown_835B92C
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r4
	ldrb r0, [r0]
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl ObjectEventForceSetHeldMovement
	movs r0, 0
	strh r0, [r6]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r4
	ldrb r0, [r0]
	b _0805DE26
	.align 2, 0
_0805DE1C: .4byte gUnknown_835B92C
_0805DE20:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
_0805DE26:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805DDC8

	.align 2, 0 @ Don't pad with nop.
