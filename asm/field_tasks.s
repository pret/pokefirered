	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start task_per_step_callback_manager
task_per_step_callback_manager: @ 806E810
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806E834 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x8
	ldrsh r1, [r1, r2]
	ldr r2, _0806E838 @ =gUnknown_83A7310
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0806E834: .4byte gUnknown_3005090
_0806E838: .4byte gUnknown_83A7310
	thumb_func_end task_per_step_callback_manager

	thumb_func_start sub_806E83C
sub_806E83C: @ 806E83C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806E874 @ =gUnknown_3005098
	adds r4, r1, r0
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	cmp r0, 0
	bne _0806E86C
	ldr r0, _0806E878 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806E86C
	adds r0, r4, 0x2
	adds r1, r4, 0x4
	bl sub_8056078
_0806E86C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E874: .4byte gUnknown_3005098
_0806E878: .4byte gUnknown_203ADFA
	thumb_func_end sub_806E83C

	thumb_func_start sub_806E87C
sub_806E87C: @ 806E87C
	push {r4,r5,lr}
	ldr r5, _0806E8C4 @ =task_per_step_callback_manager
	adds r0, r5, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0806E8A6
	adds r0, r5, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806E8C8 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_0806E8A6:
	ldr r4, _0806E8CC @ =sub_806E83C
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0806E8BC
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0806E8BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8C4: .4byte task_per_step_callback_manager
_0806E8C8: .4byte gUnknown_3005090
_0806E8CC: .4byte sub_806E83C
	thumb_func_end sub_806E87C

	thumb_func_start ActivatePerStepCallback
ActivatePerStepCallback: @ 806E8D0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806E908 @ =task_per_step_callback_manager
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0806E912
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0806E90C @ =gUnknown_3005098
	adds r1, r0, r1
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0x1E
_0806E8F4:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _0806E8F4
	cmp r4, 0x7
	bls _0806E910
	movs r0, 0
	strh r0, [r1]
	b _0806E912
	.align 2, 0
_0806E908: .4byte task_per_step_callback_manager
_0806E90C: .4byte gUnknown_3005098
_0806E910:
	strh r4, [r1]
_0806E912:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ActivatePerStepCallback

	thumb_func_start wild_encounter_reset_coro_args
wild_encounter_reset_coro_args: @ 806E918
	push {lr}
	ldr r0, _0806E948 @ =task_per_step_callback_manager
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0806E94C @ =sub_806E83C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0806E942
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0806E950 @ =gUnknown_3005098
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	strh r1, [r0, 0x4]
_0806E942:
	pop {r0}
	bx r0
	.align 2, 0
_0806E948: .4byte task_per_step_callback_manager
_0806E94C: .4byte sub_806E83C
_0806E950: .4byte gUnknown_3005098
	thumb_func_end wild_encounter_reset_coro_args

	thumb_func_start nullsub_40
nullsub_40: @ 806E954
	bx lr
	thumb_func_end nullsub_40

	thumb_func_start sub_806E958
sub_806E958: @ 806E958
	push {r4,r5,lr}
	movs r3, 0
	ldr r4, _0806E988 @ =gUnknown_83A7330
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r1, 16
_0806E966:
	lsls r2, r3, 1
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r0, 0x7
	cmp r0, r5
	bne _0806E98C
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r0, 0x7
	cmp r0, r1
	bne _0806E98C
	adds r0, r3, 0x1
	bl FlagSet
	b _0806E996
	.align 2, 0
_0806E988: .4byte gUnknown_83A7330
_0806E98C:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x8
	bls _0806E966
_0806E996:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E958

	thumb_func_start sub_806E99C
sub_806E99C: @ 806E99C
	push {r4-r7,lr}
	movs r4, 0
	ldr r6, _0806E9D8 @ =gUnknown_83A7330
	adds r7, r6, 0x1
_0806E9A4:
	adds r5, r4, 0x1
	adds r0, r5, 0
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E9C8
	lsls r1, r4, 1
	adds r0, r1, r6
	ldrb r0, [r0]
	adds r0, 0x7
	adds r1, r7
	ldrb r1, [r1]
	adds r1, 0x7
	ldr r2, _0806E9DC @ =0x0000035a
	bl MapGridSetMetatileIdAt
_0806E9C8:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _0806E9A4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E9D8: .4byte gUnknown_83A7330
_0806E9DC: .4byte 0x0000035a
	thumb_func_end sub_806E99C

	thumb_func_start sub_806E9E0
sub_806E9E0: @ 806E9E0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806EA04 @ =gUnknown_3005098
	adds r5, r1, r0
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0806EA2A
	cmp r0, 0x1
	bgt _0806EA08
	cmp r0, 0
	beq _0806EA12
	b _0806EB42
	.align 2, 0
_0806EA04: .4byte gUnknown_3005098
_0806EA08:
	cmp r0, 0x2
	beq _0806EAB0
	cmp r0, 0x3
	beq _0806EAF4
	b _0806EB42
_0806EA12:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x4]
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	b _0806EB3E
_0806EA2A:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806EA52
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806EB42
_0806EA52:
	strh r2, [r5, 0x4]
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl MetatileBehavior_IsThinIce
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EA8E
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_806E958
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x2
	b _0806EAA2
_0806EA8E:
	adds r0, r6, 0
	bl MetatileBehavior_IsCrackedIce
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EB42
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x3
_0806EAA2:
	strh r0, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x8]
	ldrh r0, [r4]
	strh r0, [r5, 0xA]
	b _0806EB42
_0806EAB0:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	bne _0806EAFE
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x24
	bl sub_80722CC
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806EAF0 @ =0x0000035a
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	b _0806EB3E
	.align 2, 0
_0806EAF0: .4byte 0x0000035a
_0806EAF4:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _0806EB04
_0806EAFE:
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _0806EB42
_0806EB04:
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x23
	bl sub_80722CC
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806EB4C @ =0x0000035b
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldr r0, _0806EB50 @ =0x00004001
	movs r1, 0x1
	bl VarSet
_0806EB3E:
	movs r0, 0x1
	strh r0, [r5, 0x2]
_0806EB42:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB4C: .4byte 0x0000035b
_0806EB50: .4byte 0x00004001
	thumb_func_end sub_806E9E0

	thumb_func_start sub_806EB54
sub_806EB54: @ 806EB54
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806EBD8 @ =gUnknown_3005098
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806EB8E
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806EBF6
_0806EB8E:
	strh r2, [r5, 0x2]
	ldrh r0, [r4]
	strh r0, [r5, 0x4]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059F50
	lsls r0, 24
	cmp r0, 0
	beq _0806EBF6
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_8058E48
	ldr r1, _0806EBDC @ =0x0000020a
	cmp r0, r1
	bne _0806EBE4
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806EBE0 @ =0x00000212
	movs r3, 0x4
	bl ash
	b _0806EBF6
	.align 2, 0
_0806EBD8: .4byte gUnknown_3005098
_0806EBDC: .4byte 0x0000020a
_0806EBE0: .4byte 0x00000212
_0806EBE4:
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806EC00 @ =0x00000206
	movs r3, 0x4
	bl ash
_0806EBF6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC00: .4byte 0x00000206
	thumb_func_end sub_806EB54

	thumb_func_start sub_806EC04
sub_806EC04: @ 806EC04
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8058E48
	ldr r1, _0806EC38 @ =0x0000022f
	ldr r2, _0806EC3C @ =0x00000237
	cmp r0, r1
	bne _0806EC20
	subs r2, 0x31
_0806EC20:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC38: .4byte 0x0000022f
_0806EC3C: .4byte 0x00000237
	thumb_func_end sub_806EC04

	thumb_func_start sub_806EC40
sub_806EC40: @ 806EC40
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806ED10 @ =gUnknown_3005098
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r1, [r5, 0x8]
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	adds r6, r4, 0
	cmp r0, 0
	beq _0806EC92
	subs r0, r1, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _0806EC92
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl sub_806EC04
_0806EC92:
	ldrh r1, [r5, 0xE]
	movs r3, 0xE
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _0806ECB2
	subs r0, r1, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0806ECB2
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	bl sub_806EC04
_0806ECB2:
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806ECCE
	movs r0, 0
	ldrsh r1, [r6, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806ED2E
_0806ECCE:
	strh r2, [r5, 0x4]
	adds r4, r6, 0
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	lsls r0, r7, 24
	lsrs r0, 24
	bl sub_805A1D8
	lsls r0, 24
	cmp r0, 0
	beq _0806ED2E
	bl sub_80BD674
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _0806ECF8
	ldr r0, _0806ED14 @ =0x00004030
	movs r1, 0
	bl VarSet
_0806ECF8:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0806ED18
	movs r0, 0x3
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0xA]
	ldrh r0, [r4]
	strh r0, [r5, 0xC]
	b _0806ED2E
	.align 2, 0
_0806ED10: .4byte gUnknown_3005098
_0806ED14: .4byte 0x00004030
_0806ED18:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _0806ED2E
	movs r0, 0x3
	strh r0, [r5, 0xE]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x10]
	ldrh r0, [r6]
	strh r0, [r5, 0x12]
_0806ED2E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806EC40

	thumb_func_start sub_806ED38
sub_806ED38: @ 806ED38
	push {lr}
	ldr r0, _0806ED4C @ =0x00000829
	bl FlagSet
	ldr r0, _0806ED50 @ =0x00000828
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0806ED4C: .4byte 0x00000829
_0806ED50: .4byte 0x00000828
	thumb_func_end sub_806ED38

	.align 2, 0 @ Don't pad with nop.
