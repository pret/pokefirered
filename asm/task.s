	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ResetTasks
ResetTasks: @ 80773BC
	push {r4-r7,lr}
	movs r4, 0
	ldr r6, _08077410 @ =gUnknown_3005090
	adds r7, r6, 0
	adds r7, 0x8
_080773C6:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r6
	movs r1, 0
	strb r1, [r2, 0x4]
	ldr r1, _08077414 @ =nullsub_43
	str r1, [r2]
	strb r4, [r2, 0x5]
	adds r4, 0x1
	strb r4, [r2, 0x6]
	movs r1, 0x1
	negs r1, r1
	adds r5, r1, 0
	movs r1, 0xFF
	strb r1, [r2, 0x7]
	adds r0, r7
	movs r1, 0
	movs r2, 0x20
	bl memset
	lsls r4, 24
	lsrs r4, 24
	cmp r4, 0xF
	bls _080773C6
	ldr r0, _08077410 @ =gUnknown_3005090
	movs r1, 0xFE
	strb r1, [r0, 0x5]
	ldr r1, _08077418 @ =0x0000025e
	adds r0, r1
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077410: .4byte gUnknown_3005090
_08077414: .4byte nullsub_43
_08077418: .4byte 0x0000025e
	thumb_func_end ResetTasks

	thumb_func_start CreateTask
CreateTask: @ 807741C
	push {r4-r7,lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r6, 0
	ldr r7, _08077458 @ =gUnknown_3005090
_08077428:
	lsls r0, r6, 2
	adds r0, r6
	lsls r5, r0, 3
	adds r4, r5, r7
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	bne _0807745C
	str r2, [r4]
	strb r1, [r4, 0x7]
	adds r0, r6, 0
	bl InsertTask
	adds r0, r7, 0
	adds r0, 0x8
	adds r0, r5, r0
	movs r1, 0
	movs r2, 0x20
	bl memset
	movs r0, 0x1
	strb r0, [r4, 0x4]
	adds r0, r6, 0
	b _08077468
	.align 2, 0
_08077458: .4byte gUnknown_3005090
_0807745C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bls _08077428
	movs r0, 0
_08077468:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CreateTask

	thumb_func_start InsertTask
InsertTask: @ 8077470
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	bl FindFirstActiveTask
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x10
	bne _080774A0
	ldr r1, _0807749C @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xFE
	strb r1, [r0, 0x5]
	movs r1, 0xFF
	strb r1, [r0, 0x6]
	b _080774FC
	.align 2, 0
_0807749C: .4byte gUnknown_3005090
_080774A0:
	ldr r6, _080774DC @ =gUnknown_3005090
	lsls r0, r4, 2
	mov r12, r0
	mov r8, r6
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r6
_080774AE:
	lsls r0, r1, 2
	adds r0, r1
	lsls r5, r0, 3
	mov r7, r8
	adds r3, r5, r7
	ldrb r0, [r2, 0x7]
	ldrb r7, [r3, 0x7]
	cmp r0, r7
	bcs _080774E0
	ldrb r0, [r3, 0x5]
	strb r0, [r2, 0x5]
	strb r1, [r2, 0x6]
	ldrb r0, [r3, 0x5]
	cmp r0, 0xFE
	beq _080774D8
	adds r1, r0, 0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r8
	strb r4, [r0, 0x6]
_080774D8:
	strb r4, [r3, 0x5]
	b _080774FC
	.align 2, 0
_080774DC: .4byte gUnknown_3005090
_080774E0:
	ldrb r0, [r3, 0x6]
	cmp r0, 0xFF
	beq _080774EA
	adds r1, r0, 0
	b _080774AE
_080774EA:
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r6
	strb r1, [r0, 0x5]
	adds r2, r5, r6
	ldrb r1, [r2, 0x6]
	strb r1, [r0, 0x6]
	strb r4, [r2, 0x6]
_080774FC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end InsertTask

	thumb_func_start DestroyTask
DestroyTask: @ 8077508
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0807753C @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r4
	ldrb r0, [r2, 0x4]
	cmp r0, 0
	beq _08077572
	movs r0, 0
	strb r0, [r2, 0x4]
	ldrb r3, [r2, 0x5]
	cmp r3, 0xFE
	bne _08077540
	ldrb r0, [r2, 0x6]
	cmp r0, 0xFF
	beq _08077572
	adds r1, r0, 0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	strb r3, [r0, 0x5]
	b _08077572
	.align 2, 0
_0807753C: .4byte gUnknown_3005090
_08077540:
	ldrb r3, [r2, 0x6]
	adds r0, r3, 0
	cmp r0, 0xFF
	bne _08077558
	ldrb r0, [r2, 0x5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0xFF
	strb r0, [r1, 0x6]
	b _08077572
_08077558:
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	strb r3, [r0, 0x6]
	ldrb r1, [r2, 0x6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldrb r1, [r2, 0x5]
	strb r1, [r0, 0x5]
_08077572:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DestroyTask

	thumb_func_start RunTasks
RunTasks: @ 8077578
	push {r4,r5,lr}
	bl FindFirstActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _0807759C
	ldr r5, _080775A4 @ =gUnknown_3005090
_08077588:
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r5
	ldr r1, [r4]
	bl _call_via_r1
	ldrb r0, [r4, 0x6]
	cmp r0, 0xFF
	bne _08077588
_0807759C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080775A4: .4byte gUnknown_3005090
	thumb_func_end RunTasks

	thumb_func_start FindFirstActiveTask
FindFirstActiveTask: @ 80775A8
	push {lr}
	movs r2, 0
	ldr r0, _080775E0 @ =gUnknown_3005090
	ldrb r1, [r0, 0x4]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _080775BC
	ldrb r0, [r3, 0x5]
	cmp r0, 0xFE
	beq _080775DA
_080775BC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bhi _080775DA
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r3
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	bne _080775BC
	ldrb r0, [r1, 0x5]
	cmp r0, 0xFE
	bne _080775BC
_080775DA:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_080775E0: .4byte gUnknown_3005090
	thumb_func_end FindFirstActiveTask

	thumb_func_start nullsub_43
nullsub_43: @ 80775E4
	bx lr
	thumb_func_end nullsub_43

	thumb_func_start SetTaskFuncWithFollowupFunc
SetTaskFuncWithFollowupFunc: @ 80775E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08077618 @ =gUnknown_3005090
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	adds r0, r3, 0
	adds r0, 0x1C
	adds r4, r5, 0
	adds r4, 0x8
	adds r0, r4
	strh r2, [r0]
	adds r0, r3, 0
	adds r0, 0x1E
	adds r0, r4
	lsrs r2, 16
	strh r2, [r0]
	adds r3, r5
	str r1, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077618: .4byte gUnknown_3005090
	thumb_func_end SetTaskFuncWithFollowupFunc

	thumb_func_start SwitchTaskToFollowupFunc
SwitchTaskToFollowupFunc: @ 807761C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0807764C @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r3
	adds r0, r1, 0
	adds r0, 0x1C
	adds r3, 0x8
	adds r0, r3
	ldrh r2, [r0]
	adds r1, 0x1E
	adds r1, r3
	movs r3, 0
	ldrsh r0, [r1, r3]
	lsls r0, 16
	orrs r2, r0
	str r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807764C: .4byte gUnknown_3005090
	thumb_func_end SwitchTaskToFollowupFunc

	thumb_func_start FuncIsActiveTask
FuncIsActiveTask: @ 8077650
	push {r4,lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r4, _08077670 @ =gUnknown_3005090
_08077658:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r4
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	bne _08077674
	ldr r0, [r1]
	cmp r0, r3
	bne _08077674
	movs r0, 0x1
	b _08077680
	.align 2, 0
_08077670: .4byte gUnknown_3005090
_08077674:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _08077658
	movs r0, 0
_08077680:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FuncIsActiveTask

	thumb_func_start FindTaskIdByFunc
FindTaskIdByFunc: @ 8077688
	push {lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r1, _080776A4 @ =gUnknown_3005090
_08077690:
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	bne _080776A8
	ldr r0, [r1]
	cmp r0, r3
	bne _080776A8
	lsls r0, r2, 24
	lsrs r0, 24
	b _080776B2
	.align 2, 0
_080776A4: .4byte gUnknown_3005090
_080776A8:
	adds r1, 0x28
	adds r2, 0x1
	cmp r2, 0xF
	ble _08077690
	movs r0, 0xFF
_080776B2:
	pop {r1}
	bx r1
	thumb_func_end FindTaskIdByFunc

	thumb_func_start GetTaskCount
GetTaskCount: @ 80776B8
	push {lr}
	movs r2, 0
	movs r1, 0
	ldr r3, _080776E4 @ =gUnknown_3005090
_080776C0:
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x4]
	cmp r0, 0x1
	bne _080776D4
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080776D4:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080776C0
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_080776E4: .4byte gUnknown_3005090
	thumb_func_end GetTaskCount

	thumb_func_start SetWordTaskArg
SetWordTaskArg: @ 80776E8
	push {r4,r5,lr}
	adds r5, r2, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r3, 0xE
	bhi _08077716
	ldr r2, _0807771C @ =gUnknown_3005090
	lsls r0, r3, 1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r0, r1
	adds r2, 0x8
	adds r0, r2
	strh r5, [r0]
	adds r0, r3, 0x1
	lsls r0, 1
	adds r0, r1
	adds r0, r2
	lsrs r1, r5, 16
	strh r1, [r0]
_08077716:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807771C: .4byte gUnknown_3005090
	thumb_func_end SetWordTaskArg

	thumb_func_start GetWordTaskArg
GetWordTaskArg: @ 8077720
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0xE
	bls _08077732
	movs r0, 0
	b _08077754
_08077732:
	ldr r3, _0807775C @ =gUnknown_3005090
	lsls r0, r1, 1
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	adds r0, r2
	adds r3, 0x8
	adds r0, r3
	ldrh r0, [r0]
	adds r1, 0x1
	lsls r1, 1
	adds r1, r2
	adds r1, r3
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r1, 16
	orrs r0, r1
_08077754:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807775C: .4byte gUnknown_3005090
	thumb_func_end GetWordTaskArg

	.align 2, 0 @ Don't pad with nop.
