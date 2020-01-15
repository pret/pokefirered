	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start is_walking_or_running
is_walking_or_running: @ 811B504
	push {lr}
	ldr r0, _0811B518 @ =gPlayerAvatar
	ldrb r0, [r0, 0x3]
	cmp r0, 0x2
	beq _0811B512
	cmp r0, 0
	bne _0811B51C
_0811B512:
	movs r0, 0x1
	b _0811B51E
	.align 2, 0
_0811B518: .4byte gPlayerAvatar
_0811B51C:
	movs r0, 0
_0811B51E:
	pop {r1}
	bx r1
	thumb_func_end is_walking_or_running

	thumb_func_start sub_811B524
sub_811B524: @ 811B524
	ldr r3, _0811B538 @ =gUnknown_84570D8
	movs r2, 0x7
	ands r2, r1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	adds r2, r1
	adds r2, r3
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0811B538: .4byte gUnknown_84570D8
	thumb_func_end sub_811B524

	thumb_func_start sub_811B53C
sub_811B53C: @ 811B53C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r4, _0811B584 @ =gUnknown_84570EC
	mov r8, r4
	lsls r0, 2
	adds r4, r0, r4
	movs r6, 0
	ldrsh r5, [r4, r6]
	ldr r6, _0811B588 @ =gUnknown_845710C
	lsls r1, 1
	adds r4, r1, r6
	ldrb r4, [r4]
	lsls r4, 24
	asrs r4, 24
	adds r5, r4
	adds r5, 0x7
	str r5, [r2]
	movs r2, 0x2
	add r8, r2
	add r0, r8
	movs r4, 0
	ldrsh r0, [r0, r4]
	adds r6, 0x1
	adds r1, r6
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	str r0, [r3]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811B584: .4byte gUnknown_84570EC
_0811B588: .4byte gUnknown_845710C
	thumb_func_end sub_811B53C

	thumb_func_start sub_811B58C
sub_811B58C: @ 811B58C
	push {r4-r7,lr}
	mov r12, r3
	ldr r7, _0811B5CC @ =gUnknown_84570EC
	lsls r5, r0, 2
	adds r0, r5, r7
	movs r4, 0
	ldrsh r3, [r0, r4]
	ldr r6, _0811B5D0 @ =gUnknown_845710C
	lsls r4, r1, 1
	adds r0, r4, r6
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r3, r0
	adds r3, 0x7
	cmp r3, r2
	bne _0811B5D4
	adds r0, r7, 0x2
	adds r0, r5, r0
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r0, r6, 0x1
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r0
	adds r1, 0x7
	cmp r1, r12
	bne _0811B5D4
	movs r0, 0x1
	b _0811B5D6
	.align 2, 0
_0811B5CC: .4byte gUnknown_84570EC
_0811B5D0: .4byte gUnknown_845710C
_0811B5D4:
	movs r0, 0
_0811B5D6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811B58C

	thumb_func_start sub_811B5DC
sub_811B5DC: @ 811B5DC
	push {lr}
	adds r0, 0x63
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_811B5DC

	thumb_func_start sub_811B5F0
sub_811B5F0: @ 811B5F0
	push {lr}
	adds r0, 0x63
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end sub_811B5F0

	thumb_func_start sub_811B600
sub_811B600: @ 811B600
	push {lr}
	adds r0, 0x63
	lsls r0, 16
	lsrs r0, 16
	bl FlagClear
	pop {r0}
	bx r0
	thumb_func_end sub_811B600

	thumb_func_start sub_811B610
sub_811B610: @ 811B610
	push {lr}
	ldr r2, _0811B628 @ =0x00004010
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0811B628: .4byte 0x00004010
	thumb_func_end sub_811B610

	thumb_func_start sub_811B62C
sub_811B62C: @ 811B62C
	push {lr}
	ldr r1, _0811B644 @ =gUnknown_8457120
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0811B648 @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl show_sprite
	pop {r0}
	bx r0
	.align 2, 0
_0811B644: .4byte gUnknown_8457120
_0811B648: .4byte gSaveBlock1Ptr
	thumb_func_end sub_811B62C

	thumb_func_start sub_811B64C
sub_811B64C: @ 811B64C
	push {lr}
	ldr r1, _0811B664 @ =gUnknown_8457120
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0811B668 @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl RemoveObjectEventByLocalIdAndMap
	pop {r0}
	bx r0
	.align 2, 0
_0811B664: .4byte gUnknown_8457120
_0811B668: .4byte gSaveBlock1Ptr
	thumb_func_end sub_811B64C

	thumb_func_start sub_811B66C
sub_811B66C: @ 811B66C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	ldr r1, _0811B6B8 @ =gUnknown_8457120
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0811B6BC @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0811B6D0
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811B6C0 @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	bne _0811B6D0
	ldrb r1, [r5]
	adds r0, r4, 0
	bl ObjectEventSetHeldMovement
	lsls r0, 24
	cmp r0, 0
	bne _0811B6C4
	movs r0, 0x1
	b _0811B6D2
	.align 2, 0
_0811B6B8: .4byte gUnknown_8457120
_0811B6BC: .4byte gSaveBlock1Ptr
_0811B6C0: .4byte gObjectEvents
_0811B6C4:
	ldr r0, _0811B6DC @ =gUnknown_8457138	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu_union_tool.c"
	ldr r1, _0811B6E0 @ =0x00000183
	ldr r2, _0811B6E4 @ =gUnknown_8457174	"0"
	movs r3, 0x1
	bl AGBAssert
_0811B6D0:
	movs r0, 0
_0811B6D2:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811B6DC: .4byte gUnknown_8457138
_0811B6E0: .4byte 0x00000183
_0811B6E4: .4byte gUnknown_8457174
	thumb_func_end sub_811B66C

	thumb_func_start sub_811B6E8
sub_811B6E8: @ 811B6E8
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0811B724 @ =gUnknown_8457120
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0811B728 @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0811B748
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811B72C @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	bne _0811B730
	movs r0, 0
	b _0811B74A
	.align 2, 0
_0811B724: .4byte gUnknown_8457120
_0811B728: .4byte gSaveBlock1Ptr
_0811B72C: .4byte gObjectEvents
_0811B730:
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	cmp r0, 0
	bne _0811B742
	adds r0, r4, 0
	bl npc_sync_anim_pause_bits
	b _0811B748
_0811B742:
	adds r0, r4, 0
	bl FreezeObjectEvent
_0811B748:
	movs r0, 0x1
_0811B74A:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811B6E8

	thumb_func_start sub_811B754
sub_811B754: @ 811B754
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811B798 @ =gUnknown_203B088
	movs r1, 0
	str r1, [r0]
	ldr r0, _0811B79C @ =gUnknown_203B084
	str r4, [r0]
	cmp r4, 0
	bne _0811B774
	ldr r0, _0811B7A0 @ =gUnknown_8457138	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu_union_tool.c"
	movs r1, 0xDD
	lsls r1, 1
	ldr r2, _0811B7A4 @ =gUnknown_8457178	"UnionObjWork != NULL"
	movs r3, 0x1
	bl AGBAssert
_0811B774:
	movs r1, 0
	adds r0, r4, 0
	movs r2, 0x7
_0811B77A:
	strb r1, [r0]
	strb r1, [r0, 0x1]
	strb r1, [r0, 0x2]
	strb r1, [r0, 0x3]
	adds r0, 0x4
	subs r2, 0x1
	cmp r2, 0
	bge _0811B77A
	bl sub_811BA18
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B798: .4byte gUnknown_203B088
_0811B79C: .4byte gUnknown_203B084
_0811B7A0: .4byte gUnknown_8457138
_0811B7A4: .4byte gUnknown_8457178
	thumb_func_end sub_811B754

	thumb_func_start sub_811B7A8
sub_811B7A8: @ 811B7A8
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	beq _0811B7BC
	cmp r0, 0x1
	beq _0811B7DC
	b _0811B7FA
_0811B7BC:
	ldr r1, _0811B7D8 @ =gUnknown_845718D
	adds r0, r4, 0
	bl sub_811B66C
	cmp r0, 0x1
	bne _0811B7FA
	adds r0, r4, 0
	bl sub_811B5F0
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0811B7FA
	.align 2, 0
_0811B7D8: .4byte gUnknown_845718D
_0811B7DC:
	adds r0, r4, 0
	bl sub_811B6E8
	cmp r0, 0
	beq _0811B7FA
	adds r0, r4, 0
	bl sub_811B64C
	adds r0, r4, 0
	bl sub_811B5F0
	movs r0, 0
	strb r0, [r5]
	movs r0, 0x1
	b _0811B7FC
_0811B7FA:
	movs r0, 0
_0811B7FC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811B7A8

	thumb_func_start sub_811B804
sub_811B804: @ 811B804
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	adds r7, r2, 0
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0x2
	beq _0811B8A0
	cmp r0, 0x2
	bgt _0811B820
	cmp r0, 0
	beq _0811B826
	b _0811B8B2
_0811B820:
	cmp r0, 0x3
	beq _0811B888
	b _0811B8B2
_0811B826:
	bl is_walking_or_running
	cmp r0, 0
	beq _0811B8B2
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	movs r0, 0
	ldrsh r3, [r4, r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_811B58C
	cmp r0, 0x1
	beq _0811B8B2
	mov r0, sp
	adds r1, r4, 0
	bl plaer_get_pos_including_state_based_drift
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	movs r0, 0
	ldrsh r3, [r4, r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_811B58C
	cmp r0, 0x1
	beq _0811B8B2
	ldrb r1, [r7, 0x1]
	adds r0, r5, 0
	bl sub_811B610
	adds r0, r5, 0
	bl sub_811B62C
	adds r0, r5, 0
	bl sub_811B600
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_0811B888:
	ldr r1, _0811B89C @ =gUnknown_845718F
	adds r0, r5, 0
	bl sub_811B66C
	cmp r0, 0x1
	bne _0811B8B2
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _0811B8B2
	.align 2, 0
_0811B89C: .4byte gUnknown_845718F
_0811B8A0:
	adds r0, r5, 0
	bl sub_811B6E8
	cmp r0, 0
	beq _0811B8B2
	movs r0, 0
	strb r0, [r6]
	movs r0, 0x1
	b _0811B8B4
_0811B8B2:
	movs r0, 0
_0811B8B4:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811B804

	thumb_func_start sub_811B8BC
sub_811B8BC: @ 811B8BC
	push {r4-r6,lr}
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, _0811B8F4 @ =gUnknown_203B084
	lsls r0, 2
	ldr r1, [r1]
	adds r4, r1, r0
	cmp r1, 0
	bne _0811B8DA
	ldr r0, _0811B8F8 @ =gUnknown_8457138	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu_union_tool.c"
	ldr r1, _0811B8FC @ =0x00000231
	ldr r2, _0811B900 @ =gUnknown_8457178	"UnionObjWork != NULL"
	movs r3, 0x1
	bl AGBAssert
_0811B8DA:
	movs r0, 0x1
	strb r0, [r4, 0x3]
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_811B524
	strb r0, [r4, 0x1]
	ldrb r0, [r4]
	cmp r0, 0
	beq _0811B904
	movs r0, 0
	b _0811B906
	.align 2, 0
_0811B8F4: .4byte gUnknown_203B084
_0811B8F8: .4byte gUnknown_8457138
_0811B8FC: .4byte 0x00000231
_0811B900: .4byte gUnknown_8457178
_0811B904:
	movs r0, 0x1
_0811B906:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_811B8BC

	thumb_func_start sub_811B90C
sub_811B90C: @ 811B90C
	push {r4,lr}
	ldr r1, _0811B934 @ =gUnknown_203B084
	lsls r0, 2
	ldr r1, [r1]
	adds r4, r1, r0
	cmp r1, 0
	bne _0811B926
	ldr r0, _0811B938 @ =gUnknown_8457138	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu_union_tool.c"
	ldr r1, _0811B93C @ =0x00000241
	ldr r2, _0811B940 @ =gUnknown_8457178	"UnionObjWork != NULL"
	movs r3, 0x1
	bl AGBAssert
_0811B926:
	movs r0, 0x2
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _0811B944
	movs r0, 0
	b _0811B946
	.align 2, 0
_0811B934: .4byte gUnknown_203B084
_0811B938: .4byte gUnknown_8457138
_0811B93C: .4byte 0x00000241
_0811B940: .4byte gUnknown_8457178
_0811B944:
	movs r0, 0x1
_0811B946:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811B90C

	thumb_func_start sub_811B94C
sub_811B94C: @ 811B94C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _0811B9AE
	cmp r1, 0x1
	bgt _0811B962
	cmp r1, 0
	beq _0811B96C
	b _0811B9CE
_0811B962:
	cmp r1, 0x2
	beq _0811B978
	cmp r1, 0x3
	beq _0811B9BC
	b _0811B9CE
_0811B96C:
	ldrb r0, [r4, 0x3]
	cmp r0, 0x1
	bne _0811B9CE
	movs r0, 0x2
	strb r0, [r4]
	strb r1, [r4, 0x2]
_0811B978:
	adds r0, r5, 0
	movs r1, 0
	bl sub_811BBC8
	adds r1, r0, 0
	cmp r1, 0
	bne _0811B99E
	ldrb r0, [r4, 0x3]
	cmp r0, 0x2
	bne _0811B99E
	strb r1, [r4]
	strb r1, [r4, 0x2]
	adds r0, r5, 0
	bl sub_811B64C
	adds r0, r5, 0
	bl sub_811B5F0
	b _0811B9CE
_0811B99E:
	adds r0, r4, 0x2
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_811B804
	cmp r0, 0x1
	bne _0811B9CE
	b _0811B9CC
_0811B9AE:
	ldrb r0, [r4, 0x3]
	cmp r0, 0x2
	bne _0811B9CE
	movs r1, 0
	movs r0, 0x3
	strb r0, [r4]
	strb r1, [r4, 0x2]
_0811B9BC:
	adds r0, r4, 0x2
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_811B7A8
	cmp r0, 0x1
	bne _0811B9CE
	movs r0, 0
_0811B9CC:
	strb r0, [r4]
_0811B9CE:
	movs r0, 0
	strb r0, [r4, 0x3]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811B94C

	thumb_func_start sub_811B9D8
sub_811B9D8: @ 811B9D8
	push {r4,r5,lr}
	ldr r5, _0811BA08 @ =gUnknown_203B084
	ldr r0, [r5]
	cmp r0, 0
	bne _0811B9EE
	ldr r0, _0811BA0C @ =gUnknown_8457138	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu_union_tool.c"
	ldr r1, _0811BA10 @ =0x00000283
	ldr r2, _0811BA14 @ =gUnknown_8457178	"UnionObjWork != NULL"
	movs r3, 0x1
	bl AGBAssert
_0811B9EE:
	movs r4, 0
_0811B9F0:
	lsls r0, r4, 2
	ldr r1, [r5]
	adds r1, r0
	adds r0, r4, 0
	bl sub_811B94C
	adds r4, 0x1
	cmp r4, 0x7
	ble _0811B9F0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BA08: .4byte gUnknown_203B084
_0811BA0C: .4byte gUnknown_8457138
_0811BA10: .4byte 0x00000283
_0811BA14: .4byte gUnknown_8457178
	thumb_func_end sub_811B9D8

	thumb_func_start sub_811BA18
sub_811BA18: @ 811BA18
	push {r4,lr}
	ldr r4, _0811BA38 @ =sub_811B9D8
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811BA3C
	adds r0, r4, 0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	b _0811BA4A
	.align 2, 0
_0811BA38: .4byte sub_811B9D8
_0811BA3C:
	ldr r0, _0811BA50 @ =gUnknown_8457138	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu_union_tool.c"
	ldr r1, _0811BA54 @ =0x0000028f
	ldr r2, _0811BA58 @ =gUnknown_8457174	"0"
	movs r3, 0x1
	bl AGBAssert
	movs r0, 0x10
_0811BA4A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811BA50: .4byte gUnknown_8457138
_0811BA54: .4byte 0x0000028f
_0811BA58: .4byte gUnknown_8457174
	thumb_func_end sub_811BA18

	thumb_func_start sub_811BA5C
sub_811BA5C: @ 811BA5C
	push {lr}
	ldr r0, _0811BA74 @ =sub_811B9D8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _0811BA70
	bl DestroyTask
_0811BA70:
	pop {r0}
	bx r0
	.align 2, 0
_0811BA74: .4byte sub_811B9D8
	thumb_func_end sub_811BA5C

	thumb_func_start sub_811BA78
sub_811BA78: @ 811BA78
	push {r4,lr}
	movs r4, 0
_0811BA7C:
	adds r0, r4, 0
	bl sub_811B5DC
	cmp r0, 0
	bne _0811BA92
	adds r0, r4, 0
	bl sub_811B64C
	adds r0, r4, 0
	bl sub_811B5F0
_0811BA92:
	adds r4, 0x1
	cmp r4, 0x7
	ble _0811BA7C
	ldr r1, _0811BAA8 @ =gUnknown_203B084
	movs r0, 0
	str r0, [r1]
	bl sub_811BA5C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811BAA8: .4byte gUnknown_203B084
	thumb_func_end sub_811BA78

	thumb_func_start sub_811BAAC
sub_811BAAC: @ 811BAAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	str r0, [sp, 0x8]
	mov r9, r1
	movs r7, 0
	mov r0, r9
	lsls r0, 2
	mov r8, r0
	ldr r0, _0811BB38 @ =gUnknown_84570EC
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	mov r2, sp
	strh r1, [r2, 0xC]
	adds r0, 0x2
	add r0, r8
	ldrh r0, [r0]
	mov r10, r0
	ldr r6, _0811BB3C @ =gUnknown_845710C
_0811BADA:
	mov r5, r8
	add r5, r9
	adds r5, r7
	adds r4, r5, 0
	subs r4, 0x38
	lsls r4, 24
	lsrs r4, 24
	movs r2, 0
	ldrsb r2, [r6, r2]
	mov r0, sp
	ldrh r0, [r0, 0xC]
	adds r2, r0, r2
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x1
	ldrsb r3, [r6, r3]
	add r3, r10
	lsls r3, 16
	asrs r3, 16
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x19
	adds r1, r4, 0
	bl sprite_new
	ldr r1, [sp, 0x8]
	adds r5, r1, r5
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8069124
	adds r6, 0x2
	adds r7, 0x1
	cmp r7, 0x4
	ble _0811BADA
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811BB38: .4byte gUnknown_84570EC
_0811BB3C: .4byte gUnknown_845710C
	thumb_func_end sub_811BAAC

	thumb_func_start sub_811BB40
sub_811BB40: @ 811BB40
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	ldr r6, _0811BB64 @ =gSprites
_0811BB48:
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	adds r4, 0x1
	cmp r4, 0x27
	ble _0811BB48
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811BB64: .4byte gSprites
	thumb_func_end sub_811BB40

	thumb_func_start sub_811BB68
sub_811BB68: @ 811BB68
	push {r4-r7,lr}
	sub sp, 0x8
	movs r5, 0
	add r7, sp, 0x4
_0811BB70:
	movs r4, 0
	adds r6, r5, 0x1
_0811BB74:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	adds r3, r7, 0
	bl sub_811B53C
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	movs r2, 0
	bl sub_8059024
	adds r4, 0x1
	cmp r4, 0x4
	ble _0811BB74
	adds r5, r6, 0
	cmp r5, 0x7
	ble _0811BB70
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811BB68

	thumb_func_start sub_811BBA0
sub_811BBA0: @ 811BBA0
	push {lr}
	adds r1, r0, 0
	cmp r1, 0
	beq _0811BBB4
	ldr r0, _0811BBB0 @ =gUnknown_845711B
	adds r0, r1, r0
	ldrb r0, [r0]
	b _0811BBC4
	.align 2, 0
_0811BBB0: .4byte gUnknown_845711B
_0811BBB4:
	ldrb r1, [r2, 0xA]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x45
	beq _0811BBC2
	movs r0, 0x4
	b _0811BBC4
_0811BBC2:
	movs r0, 0x1
_0811BBC4:
	pop {r1}
	bx r1
	thumb_func_end sub_811BBA0

	thumb_func_start sub_811BBC8
sub_811BBC8: @ 811BBC8
	push {lr}
	adds r2, r0, 0
	lsls r0, r2, 2
	adds r0, r2
	adds r0, r1
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	bl sub_806916C
	pop {r1}
	bx r1
	thumb_func_end sub_811BBC8

	thumb_func_start sub_811BBE0
sub_811BBE0: @ 811BBE0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	mov r9, r3
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r0, r5, 2
	adds r0, r5
	adds r7, r0, r6
	adds r0, r5, 0
	bl sub_811BBC8
	cmp r0, 0x1
	bne _0811BC1E
	adds r4, r7, 0
	subs r4, 0x38
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_8069124
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80691A4
_0811BC1E:
	adds r0, r7, 0
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	bl sub_8069094
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r9
	bl sub_811BBA0
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_811C008
	add r3, sp, 0x4
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, sp
	bl sub_811B53C
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	movs r2, 0x1
	bl sub_8059024
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811BBE0

	thumb_func_start sub_811BC68
sub_811BC68: @ 811BC68
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r4, 2
	adds r0, r4
	adds r0, r5
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_80691A4
	add r3, sp, 0x4
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl sub_811B53C
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	movs r2, 0
	bl sub_8059024
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811BC68

	thumb_func_start sub_811BCA0
sub_811BCA0: @ 811BCA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r0, 0
	mov r8, r1
	mov r6, sp
	adds r6, 0x2
	mov r0, sp
	adds r1, r6, 0
	bl PlayerGetDestCoords
	add r4, sp, 0x4
	mov r5, sp
	adds r5, 0x6
	adds r0, r4, 0
	adds r1, r5, 0
	bl plaer_get_pos_including_state_based_drift
	lsls r0, r7, 2
	adds r0, r7
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	bl sub_806916C
	mov r10, r6
	mov r9, r4
	adds r6, r5, 0
	cmp r0, 0x1
	bne _0811BD2C
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	mov r0, r10
	movs r1, 0
	ldrsh r3, [r0, r1]
	adds r0, r7, 0
	movs r1, 0
	bl sub_811B58C
	cmp r0, 0x1
	beq _0811BD98
	movs r0, 0
	ldrsh r2, [r4, r0]
	movs r1, 0
	ldrsh r3, [r6, r1]
	adds r0, r7, 0
	movs r1, 0
	bl sub_811B58C
	cmp r0, 0x1
	beq _0811BD98
	mov r2, r8
	ldrb r0, [r2, 0xB]
	lsls r0, 31
	lsrs r0, 31
	ldrb r1, [r2, 0x2]
	bl sub_811B524
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	movs r1, 0
	mov r3, r8
	bl sub_811BBE0
_0811BD2C:
	movs r5, 0x1
	mov r4, r8
	adds r4, 0x4
_0811BD32:
	ldrb r0, [r4]
	cmp r0, 0
	bne _0811BD42
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_811BC68
	b _0811BD90
_0811BD42:
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	mov r0, r10
	movs r1, 0
	ldrsh r3, [r0, r1]
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_811B58C
	cmp r0, 0
	bne _0811BD90
	mov r0, r9
	movs r1, 0
	ldrsh r2, [r0, r1]
	movs r0, 0
	ldrsh r3, [r6, r0]
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_811B58C
	cmp r0, 0
	bne _0811BD90
	ldrb r2, [r4]
	lsrs r0, r2, 3
	movs r1, 0x1
	ands r0, r1
	movs r1, 0x7
	ands r1, r2
	bl sub_811B524
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	adds r1, r5, 0
	mov r3, r8
	bl sub_811BBE0
_0811BD90:
	adds r4, 0x1
	adds r5, 0x1
	cmp r5, 0x4
	ble _0811BD32
_0811BD98:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811BCA0

	thumb_func_start sub_811BDA8
sub_811BDA8: @ 811BDA8
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r0, [r4, 0xA]
	lsls r0, 25
	lsrs r0, 25
	subs r0, 0x40
	cmp r0, 0x14
	bhi _0811BE4C
	lsls r0, 2
	ldr r1, _0811BDC4 @ =_0811BDC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811BDC4: .4byte _0811BDC8
	.align 2, 0
_0811BDC8:
	.4byte _0811BE1C
	.4byte _0811BE3C
	.4byte _0811BE4C
	.4byte _0811BE4C
	.4byte _0811BE3C
	.4byte _0811BE3C
	.4byte _0811BE4C
	.4byte _0811BE4C
	.4byte _0811BE3C
	.4byte _0811BE4C
	.4byte _0811BE4C
	.4byte _0811BE4C
	.4byte _0811BE4C
	.4byte _0811BE4C
	.4byte _0811BE4C
	.4byte _0811BE4C
	.4byte _0811BE4C
	.4byte _0811BE3C
	.4byte _0811BE3C
	.4byte _0811BE3C
	.4byte _0811BE1C
_0811BE1C:
	ldrb r1, [r4, 0xB]
	lsls r1, 31
	lsrs r1, 31
	ldrb r2, [r4, 0x2]
	adds r0, r5, 0
	bl sub_811B8BC
	movs r4, 0
_0811BE2C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_811BC68
	adds r4, 0x1
	cmp r4, 0x4
	bls _0811BE2C
	b _0811BE58
_0811BE3C:
	adds r0, r5, 0
	bl sub_811B90C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_811BCA0
	b _0811BE58
_0811BE4C:
	ldr r0, _0811BE60 @ =gUnknown_8457138	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu_union_tool.c"
	ldr r1, _0811BE64 @ =0x000003d3
	ldr r2, _0811BE68 @ =gUnknown_8457174	"0"
	movs r3, 0x1
	bl AGBAssert
_0811BE58:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BE60: .4byte gUnknown_8457138
_0811BE64: .4byte 0x000003d3
_0811BE68: .4byte gUnknown_8457174
	thumb_func_end sub_811BDA8

	thumb_func_start sub_811BE6C
sub_811BE6C: @ 811BE6C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811B90C
	movs r4, 0
_0811BE76:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_811BC68
	adds r4, 0x1
	cmp r4, 0x4
	ble _0811BE76
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811BE6C

	thumb_func_start sub_811BE8C
sub_811BE8C: @ 811BE8C
	push {r4,r5,lr}
	ldr r2, _0811BEAC @ =gUnknown_203B088
	movs r1, 0
	str r1, [r2]
	movs r5, 0
	ldr r4, [r0]
_0811BE98:
	ldrb r0, [r4, 0x1A]
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x1
	bne _0811BEB0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_811BDA8
	b _0811BEBC
	.align 2, 0
_0811BEAC: .4byte gUnknown_203B088
_0811BEB0:
	cmp r1, 0x2
	bne _0811BEBC
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_811BE6C
_0811BEBC:
	adds r4, 0x20
	adds r5, 0x1
	cmp r5, 0x7
	ble _0811BE98
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811BE8C

	thumb_func_start sub_811BECC
sub_811BECC: @ 811BECC
	ldr r1, _0811BED8 @ =gUnknown_203B088
	movs r0, 0x96
	lsls r0, 1
	str r0, [r1]
	bx lr
	.align 2, 0
_0811BED8: .4byte gUnknown_203B088
	thumb_func_end sub_811BECC

	thumb_func_start sub_811BEDC
sub_811BEDC: @ 811BEDC
	push {lr}
	adds r2, r0, 0
	ldr r0, _0811BEFC @ =gUnknown_203B088
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	movs r0, 0x96
	lsls r0, 1
	cmp r1, r0
	bls _0811BEF6
	adds r0, r2, 0
	bl sub_811BE8C
_0811BEF6:
	pop {r0}
	bx r0
	.align 2, 0
_0811BEFC: .4byte gUnknown_203B088
	thumb_func_end sub_811BEDC

	thumb_func_start sub_811BF00
sub_811BF00: @ 811BF00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r5, r0, 0
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	bl is_walking_or_running
	cmp r0, 0
	bne _0811BF48
	b _0811BFEE
_0811BF1C:
	ldr r4, _0811BF44 @ =gUnknown_8457116
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r2, [r0]
	adds r0, r6, 0
	ldr r1, [sp, 0xC]
	bl sub_811C008
	ldr r0, [sp, 0x4]
	strh r6, [r0]
	mov r1, sp
	ldrh r2, [r1, 0xC]
	ldr r1, [sp, 0x8]
	strh r2, [r1]
	movs r0, 0x1
	b _0811BFF0
	.align 2, 0
_0811BF44: .4byte gUnknown_8457116
_0811BF48:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _0811C000 @ =gUnknown_84570EC
	adds r7, r5, 0
	movs r1, 0
	mov r10, r1
	adds r2, r0, 0x2
	str r2, [sp, 0x10]
	str r0, [sp, 0x14]
_0811BF66:
	movs r6, 0
	ldr r4, [sp, 0x14]
	movs r0, 0
	ldrsh r4, [r4, r0]
	mov r9, r4
	ldr r1, [sp, 0x10]
	mov r8, r1
	ldr r5, _0811C004 @ =gUnknown_845710C
_0811BF76:
	mov r2, r10
	adds r3, r2, r6
	mov r0, sp
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r5, r0]
	add r0, r9
	adds r0, 0x7
	cmp r1, r0
	bne _0811BFCA
	mov r1, sp
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	mov r4, r8
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	ldrsb r2, [r5, r2]
	adds r1, r2
	adds r1, 0x7
	cmp r0, r1
	bne _0811BFCA
	adds r0, r3, 0
	subs r0, 0x38
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_806916C
	cmp r0, 0
	bne _0811BFCA
	adds r0, r4, 0
	bl sub_8069294
	cmp r0, 0
	bne _0811BFCA
	ldrb r1, [r7, 0x1A]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	beq _0811BF1C
_0811BFCA:
	adds r5, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _0811BF76
	adds r7, 0x20
	movs r4, 0x5
	add r10, r4
	ldr r0, [sp, 0x10]
	adds r0, 0x4
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	adds r1, 0x4
	str r1, [sp, 0x14]
	ldr r2, [sp, 0xC]
	adds r2, 0x1
	str r2, [sp, 0xC]
	cmp r2, 0x7
	ble _0811BF66
_0811BFEE:
	movs r0, 0
_0811BFF0:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C000: .4byte gUnknown_84570EC
_0811C004: .4byte gUnknown_845710C
	thumb_func_end sub_811BF00

	thumb_func_start sub_811C008
sub_811C008: @ 811C008
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	lsls r1, r2, 24
	lsrs r1, 24
	lsls r0, r3, 2
	adds r0, r3
	subs r0, 0x38
	adds r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl sub_8069058
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811C008

	thumb_func_start sub_811C028
sub_811C028: @ 811C028
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r3, r4, 5
	adds r3, r2
	adds r2, r3, 0
	bl sub_811BBA0
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_811C008
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811C028

	thumb_func_start sub_811C04C
sub_811C04C: @ 811C04C
	push {r4-r7,lr}
	movs r0, 0xA
	bl sub_81173C0
	movs r4, 0
	movs r7, 0x64
	ldr r6, _0811C0CC @ =gPlayerParty
	ldr r5, _0811C0D0 @ =gEnemyParty
_0811C05C:
	ldr r0, _0811C0D4 @ =gSelectedOrderFromParty
	adds r0, r4, r0
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r0, 0
	muls r1, r7
	adds r1, r6
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x1
	cmp r4, 0x1
	ble _0811C05C
	ldr r4, _0811C0CC @ =gPlayerParty
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r4, r0
_0811C082:
	adds r0, r4, 0
	bl ZeroMonData
	adds r4, 0x64
	cmp r4, r5
	ble _0811C082
	ldr r4, _0811C0CC @ =gPlayerParty
	movs r5, 0
	adds r6, r4, 0
	adds r6, 0x64
_0811C096:
	ldr r1, _0811C0D0 @ =gEnemyParty
	adds r1, r5, r1
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r4, 0x64
	adds r5, 0x64
	cmp r4, r6
	ble _0811C096
	movs r0, 0x32
	bl IncrementGameStat
	bl CalculatePlayerPartyCount
	ldr r0, _0811C0D8 @ =gTrainerBattleOpponent_A
	movs r2, 0xC0
	lsls r2, 4
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _0811C0DC @ =CB2_InitBattle
	bl SetMainCallback2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811C0CC: .4byte gPlayerParty
_0811C0D0: .4byte gEnemyParty
_0811C0D4: .4byte gSelectedOrderFromParty
_0811C0D8: .4byte gTrainerBattleOpponent_A
_0811C0DC: .4byte CB2_InitBattle
	thumb_func_end sub_811C04C

	thumb_func_start sub_811C0E0
sub_811C0E0: @ 811C0E0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x18
	adds r5, r0, 0
	mov r10, r1
	adds r6, r2, 0
	ldr r4, [sp, 0x34]
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x1
	mov r8, r0
	ldr r1, _0811C14C @ =gUnknown_84571A8
	mov r9, r1
	ldrb r0, [r1]
	lsls r1, r0, 4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	str r3, [sp, 0x14]
	bl FillWindowPixelBuffer
	mov r0, r8
	str r0, [sp]
	str r0, [sp, 0x4]
	mov r1, r9
	str r1, [sp, 0x8]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp, 0xC]
	mov r0, r10
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r6, 0
	ldr r3, [sp, 0x14]
	bl AddTextPrinterParameterized4
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811C14C: .4byte gUnknown_84571A8
	thumb_func_end sub_811C0E0

	thumb_func_start sub_811C150
sub_811C150: @ 811C150
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0811C168
	cmp r0, 0x1
	beq _0811C196
	b _0811C1AA
_0811C168:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xD
	bl DrawTextBorderOuter
	str r5, [sp]
	movs r0, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
	bl sub_811C0E0
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0811C1AA
_0811C196:
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0811C1AA
	strh r0, [r4]
	movs r0, 0x1
	b _0811C1AC
_0811C1AA:
	movs r0, 0
_0811C1AC:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_811C150

	thumb_func_start sub_811C1B4
sub_811C1B4: @ 811C1B4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_811C1B4

	thumb_func_start sub_811C1C8
sub_811C1C8: @ 811C1C8
	push {r4,lr}
	sub sp, 0xC
	ldr r1, _0811C1E8 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x33
	bls _0811C1DE
	b _0811C516
_0811C1DE:
	lsls r0, 2
	ldr r1, _0811C1EC @ =_0811C1F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811C1E8: .4byte gMain
_0811C1EC: .4byte _0811C1F0
	.align 2, 0
_0811C1F0:
	.4byte _0811C2C0
	.4byte _0811C364
	.4byte _0811C38C
	.4byte _0811C3B0
	.4byte _0811C400
	.4byte _0811C516
	.4byte _0811C4E4
	.4byte _0811C4C0
	.4byte _0811C4E4
	.4byte _0811C500
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C516
	.4byte _0811C48C
	.4byte _0811C4A8
_0811C2C0:
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r4, _0811C350 @ =gUnknown_203B08C
	movs r0, 0x4
	bl AllocZeroed
	str r0, [r4]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0811C354 @ =gUnknown_8457194
	movs r0, 0
	movs r2, 0x1
	bl InitBgsFromTemplates
	bl ResetTempTileDataBuffers
	ldr r0, _0811C358 @ =gUnknown_8457198
	bl InitWindows
	lsls r0, 16
	cmp r0, 0
	bne _0811C300
	b _0811C52A
_0811C300:
	bl DeactivateAllTextPrinters
	movs r0, 0
	bl ClearWindowTilemap
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	bl Menu_LoadStdPal
	ldr r0, _0811C35C @ =sub_811C1B4
	bl SetVBlankCallback
	ldr r1, _0811C360 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _0811C4F2
	.align 2, 0
_0811C350: .4byte gUnknown_203B08C
_0811C354: .4byte gUnknown_8457194
_0811C358: .4byte gUnknown_8457198
_0811C35C: .4byte sub_811C1B4
_0811C360: .4byte gMain
_0811C364:
	ldr r0, _0811C380 @ =gUnknown_203B08C
	ldr r0, [r0]
	ldr r1, _0811C384 @ =gUnknown_841E538
	movs r2, 0
	bl sub_811C150
	cmp r0, 0
	bne _0811C376
	b _0811C516
_0811C376:
	ldr r1, _0811C388 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _0811C4F2
	.align 2, 0
_0811C380: .4byte gUnknown_203B08C
_0811C384: .4byte gUnknown_841E538
_0811C388: .4byte gMain
_0811C38C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0
	bl ShowBg
	ldr r1, _0811C3AC @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _0811C4F2
	.align 2, 0
_0811C3AC: .4byte gMain
_0811C3B0:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _0811C3BC
	b _0811C516
_0811C3BC:
	ldr r4, _0811C3D8 @ =gBlockSendBuffer
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl memset
	ldr r0, _0811C3DC @ =gSelectedOrderFromParty
	ldrb r1, [r0]
	ldrb r0, [r0, 0x1]
	cmn r1, r0
	bne _0811C3E0
	movs r0, 0x52
	b _0811C3E2
	.align 2, 0
_0811C3D8: .4byte gBlockSendBuffer
_0811C3DC: .4byte gSelectedOrderFromParty
_0811C3E0:
	movs r0, 0x51
_0811C3E2:
	strb r0, [r4]
	ldr r1, _0811C3F8 @ =gBlockSendBuffer
	movs r0, 0
	movs r2, 0x20
	bl SendBlock
	ldr r1, _0811C3FC @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _0811C4F2
	.align 2, 0
_0811C3F8: .4byte gBlockSendBuffer
_0811C3FC: .4byte gMain
_0811C400:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0811C40E
	b _0811C516
_0811C40E:
	ldr r1, _0811C440 @ =gBlockRecvBuffer
	ldrh r0, [r1]
	cmp r0, 0x51
	bne _0811C448
	movs r2, 0x80
	lsls r2, 1
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0x51
	bne _0811C448
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0811C444 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x32
	b _0811C47E
	.align 2, 0
_0811C440: .4byte gBlockRecvBuffer
_0811C444: .4byte gMain
_0811C448:
	bl sub_800AAC0
	ldr r4, _0811C46C @ =gBlockRecvBuffer
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 16
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0x52
	bne _0811C474
	ldr r0, _0811C470 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r2
	movs r1, 0x6
	b _0811C47E
	.align 2, 0
_0811C46C: .4byte gBlockRecvBuffer
_0811C470: .4byte gMain
_0811C474:
	ldr r0, _0811C488 @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0x8
_0811C47E:
	strb r1, [r0]
	bl ResetBlockReceivedFlags
	b _0811C516
	.align 2, 0
_0811C488: .4byte gMain
_0811C48C:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0811C516
	bl sub_800AB9C
	ldr r1, _0811C4A4 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _0811C4F2
	.align 2, 0
_0811C4A4: .4byte gMain
_0811C4A8:
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _0811C516
	ldr r0, _0811C4BC @ =sub_811C04C
	bl SetMainCallback2
	b _0811C516
	.align 2, 0
_0811C4BC: .4byte sub_811C04C
_0811C4C0:
	ldr r0, _0811C4D8 @ =gUnknown_203B08C
	ldr r0, [r0]
	ldr r1, _0811C4DC @ =gUnknown_841E58D
	movs r2, 0x1
	bl sub_811C150
	cmp r0, 0
	beq _0811C516
	ldr r0, _0811C4E0 @ =CB2_ReturnToField
	bl SetMainCallback2
	b _0811C516
	.align 2, 0
_0811C4D8: .4byte gUnknown_203B08C
_0811C4DC: .4byte gUnknown_841E58D
_0811C4E0: .4byte CB2_ReturnToField
_0811C4E4:
	ldr r0, _0811C4FC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811C516
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
_0811C4F2:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0811C516
	.align 2, 0
_0811C4FC: .4byte gReceivedRemoteLinkPlayers
_0811C500:
	ldr r0, _0811C534 @ =gUnknown_203B08C
	ldr r0, [r0]
	ldr r1, _0811C538 @ =gUnknown_841E572
	movs r2, 0x1
	bl sub_811C150
	cmp r0, 0
	beq _0811C516
	ldr r0, _0811C53C @ =CB2_ReturnToField
	bl SetMainCallback2
_0811C516:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
_0811C52A:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C534: .4byte gUnknown_203B08C
_0811C538: .4byte gUnknown_841E572
_0811C53C: .4byte CB2_ReturnToField
	thumb_func_end sub_811C1C8

	.align 2, 0 @ Don't pad with nop.
