	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ScriptMovement_StartObjectMovementScript
ScriptMovement_StartObjectMovementScript: @ 8097434
	push {r4,lr}
	sub sp, 0x4
	adds r4, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _08097456
	movs r0, 0x1
	b _0809747E
_08097456:
	ldr r0, _08097488 @ =Task_80A244C
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08097468
	movs r0, 0x32
	bl sub_80974F8
_08097468:
	bl sub_8097540
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	ldrb r1, [r1]
	adds r2, r4, 0
	bl sub_8097554
	lsls r0, 24
	lsrs r0, 24
_0809747E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08097488: .4byte Task_80A244C
	thumb_func_end ScriptMovement_StartObjectMovementScript

	thumb_func_start ScriptMovement_IsObjectMovementFinished
ScriptMovement_IsObjectMovementFinished: @ 809748C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080974CE
	bl sub_8097540
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80975C0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x10
	beq _080974CE
	adds r0, r4, 0
	bl sub_80976D0
	lsls r0, 24
	lsrs r0, 24
	b _080974D0
_080974CE:
	movs r0, 0x1
_080974D0:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScriptMovement_IsObjectMovementFinished

	thumb_func_start sub_80974D8
sub_80974D8: @ 80974D8
	push {r4,lr}
	bl sub_8097540
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _080974F2
	adds r0, r4, 0
	bl UnfreezeObjects
	adds r0, r4, 0
	bl DestroyTask
_080974F2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80974D8

	thumb_func_start sub_80974F8
sub_80974F8: @ 80974F8
	push {r4,r5,lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08097534 @ =Task_80A244C
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1
	lsls r1, r0, 2
	adds r1, r0
	lsls r3, r1, 3
	ldr r5, _08097538 @ =gTasks+0x8
	ldr r0, _0809753C @ =0x0000ffff
	adds r4, r0, 0
_08097518:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	ldrh r1, [r0]
	orrs r1, r4
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _08097518
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097534: .4byte Task_80A244C
_08097538: .4byte gTasks+0x8
_0809753C: .4byte 0x0000ffff
	thumb_func_end sub_80974F8

	thumb_func_start sub_8097540
sub_8097540: @ 8097540
	push {lr}
	ldr r0, _08097550 @ =Task_80A244C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08097550: .4byte Task_80A244C
	thumb_func_end sub_8097540

	thumb_func_start sub_8097554
sub_8097554: @ 8097554
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r1, 24
	lsrs r6, r1, 24
	mov r8, r6
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80975C0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x10
	beq _08097590
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80976D0
	lsls r0, 24
	cmp r0, 0
	beq _080975B0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r6, 0
	b _080975A6
_08097590:
	adds r0, r7, 0
	movs r1, 0xFF
	bl sub_80975C0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x10
	beq _080975B0
	adds r0, r7, 0
	adds r1, r4, 0
	mov r2, r8
_080975A6:
	mov r3, r9
	bl sub_8097728
	movs r0, 0
	b _080975B2
_080975B0:
	movs r0, 0x1
_080975B2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8097554

	thumb_func_start sub_80975C0
sub_80975C0: @ 80975C0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080975E4 @ =gTasks+0x8
	adds r1, r0
	adds r1, 0x2
	movs r2, 0
_080975D8:
	ldrb r0, [r1]
	cmp r0, r3
	bne _080975E8
	adds r0, r2, 0
	b _080975F6
	.align 2, 0
_080975E4: .4byte gTasks+0x8
_080975E8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, 0x1
	cmp r2, 0xF
	bls _080975D8
	movs r0, 0x10
_080975F6:
	pop {r1}
	bx r1
	thumb_func_end sub_80975C0

	thumb_func_start sub_80975FC
sub_80975FC: @ 80975FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0809762C @ =gTasks+0x8
	adds r1, r0
	adds r1, 0x2
	str r1, [r2]
	movs r0, 0
	cmp r0, r3
	bcs _08097628
_0809761A:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r1, 0x1
	cmp r0, r3
	bcc _0809761A
	str r1, [r2]
_08097628:
	pop {r0}
	bx r0
	.align 2, 0
_0809762C: .4byte gTasks+0x8
	thumb_func_end sub_80975FC

	thumb_func_start sub_8097630
sub_8097630: @ 8097630
	push {r4,lr}
	sub sp, 0x4
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	mov r2, sp
	bl sub_80975FC
	ldr r0, [sp]
	strb r4, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8097630

	thumb_func_start sub_8097654
sub_8097654: @ 8097654
	push {r4,lr}
	sub sp, 0x4
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r2, sp
	bl sub_80975FC
	ldr r0, [sp]
	ldrb r0, [r0]
	strb r0, [r4]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8097654

	thumb_func_start sub_8097678
sub_8097678: @ 8097678
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r2, _080976A0 @ =gBitTable
	lsrs r1, 22
	adds r1, r2
	ldr r2, [r1]
	mvns r2, r2
	lsls r2, 16
	lsrs r2, 16
	ldr r3, _080976A4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldrh r0, [r1, 0x8]
	ands r2, r0
	strh r2, [r1, 0x8]
	bx lr
	.align 2, 0
_080976A0: .4byte gBitTable
_080976A4: .4byte gTasks
	thumb_func_end sub_8097678

	thumb_func_start sub_80976A8
sub_80976A8: @ 80976A8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _080976C8 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldr r0, _080976CC @ =gBitTable
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldrh r1, [r2, 0x8]
	orrs r0, r1
	strh r0, [r2, 0x8]
	bx lr
	.align 2, 0
_080976C8: .4byte gTasks
_080976CC: .4byte gBitTable
	thumb_func_end sub_80976A8

	thumb_func_start sub_80976D0
sub_80976D0: @ 80976D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _080976F8 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldr r0, _080976FC @ =gBitTable
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldrh r1, [r2, 0x8]
	ands r0, r1
	cmp r0, 0
	bne _08097700
	movs r0, 0
	b _08097702
	.align 2, 0
_080976F8: .4byte gTasks
_080976FC: .4byte gBitTable
_08097700:
	movs r0, 0x1
_08097702:
	pop {r1}
	bx r1
	thumb_func_end sub_80976D0

	thumb_func_start npc_obj_offscreen_culling_and_flag_update
npc_obj_offscreen_culling_and_flag_update: @ 8097708
	lsls r0, 24
	ldr r2, _08097714 @ =gUnknown_2039830
	lsrs r0, 22
	adds r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08097714: .4byte gUnknown_2039830
	thumb_func_end npc_obj_offscreen_culling_and_flag_update

	thumb_func_start sub_8097718
sub_8097718: @ 8097718
	lsls r0, 24
	ldr r1, _08097724 @ =gUnknown_2039830
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08097724: .4byte gUnknown_2039830
	thumb_func_end sub_8097718

	thumb_func_start sub_8097728
sub_8097728: @ 8097728
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8097678
	adds r0, r4, 0
	mov r1, r8
	bl npc_obj_offscreen_culling_and_flag_update
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8097630
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8097728

	thumb_func_start UnfreezeObjects
UnfreezeObjects: @ 8097768
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080977A4 @ =gTasks+0x8
	adds r1, r0
	adds r4, r1, 0x2
	movs r5, 0
_0809777C:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08097792
	adds r1, r0, 0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080977A8 @ =gObjectEvents
	adds r0, r1
	bl UnfreezeObjectEvent
_08097792:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x1
	cmp r5, 0xF
	bls _0809777C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080977A4: .4byte gTasks+0x8
_080977A8: .4byte gObjectEvents
	thumb_func_end UnfreezeObjects

	thumb_func_start Task_80A244C
Task_80A244C: @ 80977AC
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
	mov r6, sp
_080977B8:
	adds r0, r7, 0
	adds r1, r5, 0
	mov r2, sp
	bl sub_8097654
	ldrb r0, [r6]
	cmp r0, 0xFF
	beq _080977DC
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_8097718
	adds r3, r0, 0
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80977F0
_080977DC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080977B8
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end Task_80A244C

	thumb_func_start sub_80977F0
sub_80977F0: @ 80977F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	lsls r2, 24
	lsrs r4, r2, 24
	adds r1, r5, 0
	bl sub_80976D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809786A
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _08097850 @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventIsSpecialAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08097838
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0809786A
_08097838:
	ldrb r1, [r6]
	cmp r1, 0xFE
	bne _08097854
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80976A8
	adds r0, r4, 0
	bl FreezeObjectEvent
	b _0809786A
	.align 2, 0
_08097850: .4byte gObjectEvents
_08097854:
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
	lsls r0, 24
	cmp r0, 0
	bne _0809786A
	adds r6, 0x1
	mov r0, r8
	adds r1, r6, 0
	bl npc_obj_offscreen_culling_and_flag_update
_0809786A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80977F0

	.align 2, 0 @ Don't pad with nop.
