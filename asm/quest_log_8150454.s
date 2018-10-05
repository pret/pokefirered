	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8150454
sub_8150454: @ 8150454
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x8
	bhi _0815046A
	ldr r0, _08150470 @ =gUnknown_8471EDC
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0815046A:
	pop {r0}
	bx r0
	.align 2, 0
_08150470: .4byte gUnknown_8471EDC
	thumb_func_end sub_8150454

	thumb_func_start sub_8150474
sub_8150474: @ 8150474
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08150488 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0815048C
	movs r0, 0
	b _08150494
	.align 2, 0
_08150488: .4byte gUnknown_3005E88
_0815048C:
	adds r0, r1, 0
	bl sub_8112720
	movs r0, 0x1
_08150494:
	pop {r1}
	bx r1
	thumb_func_end sub_8150474

	thumb_func_start sub_8150498
sub_8150498: @ 8150498
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8150454
	pop {r0}
	bx r0
	thumb_func_end sub_8150498

	thumb_func_start sub_81504A8
sub_81504A8: @ 81504A8
	push {r4,lr}
	ldr r0, _081504E0 @ =gUnknown_2037078
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _081504E4 @ =gUnknown_2036E38
	adds r4, r0
	movs r0, 0
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_81507BC
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x1
	bl SetPlayerAvatarStateMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081504E0: .4byte gUnknown_2037078
_081504E4: .4byte gUnknown_2036E38
	thumb_func_end sub_81504A8

	thumb_func_start sub_81504E8
sub_81504E8: @ 81504E8
	push {r4,lr}
	ldr r0, _08150528 @ =gUnknown_2037078
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0815052C @ =gUnknown_2036E38
	adds r4, r0
	movs r0, 0x1
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_81507BC
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x2
	bl SetPlayerAvatarStateMask
	movs r0, 0
	movs r1, 0
	bl sub_80BD620
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08150528: .4byte gUnknown_2037078
_0815052C: .4byte gUnknown_2036E38
	thumb_func_end sub_81504E8

	thumb_func_start sub_8150530
sub_8150530: @ 8150530
	push {r4-r6,lr}
	ldr r6, _0815057C @ =gUnknown_2037078
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08150580 @ =gUnknown_2036E38
	adds r4, r0, r1
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08150584 @ =gSprites
	adds r5, r0, r1
	ldr r0, _08150588 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08150558
	cmp r0, 0x3
	bne _08150594
_08150558:
	bl ScriptContext2_Enable
	movs r4, 0
	movs r0, 0x1
	strb r0, [r6, 0x6]
	ldr r0, _0815058C @ =sub_81505C4
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08150590 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	b _081505BC
	.align 2, 0
_0815057C: .4byte gUnknown_2037078
_08150580: .4byte gUnknown_2036E38
_08150584: .4byte gSprites
_08150588: .4byte gUnknown_3005E88
_0815058C: .4byte sub_81505C4
_08150590: .4byte gTasks
_08150594:
	movs r0, 0x4
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_81507BC
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_80634F0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_081505BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8150530

	thumb_func_start sub_81505C4
sub_81505C4: @ 81505C4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0815060C @ =gUnknown_2037078
	mov r9, r0
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08150610 @ =gUnknown_2036E38
	adds r5, r0, r1
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08150614 @ =gSprites
	adds r7, r0, r1
	ldr r1, _08150618 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r6, [r4, r0]
	cmp r6, 0x1
	beq _08150666
	cmp r6, 0x1
	bgt _0815061C
	cmp r6, 0
	beq _08150626
	b _081506FC
	.align 2, 0
_0815060C: .4byte gUnknown_2037078
_08150610: .4byte gUnknown_2036E38
_08150614: .4byte gSprites
_08150618: .4byte gTasks
_0815061C:
	cmp r6, 0x2
	beq _0815067C
	cmp r6, 0x3
	beq _0815069C
	b _081506FC
_08150626:
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r0, [r5, 0x1]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x4
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_81507BC
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_80634F0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	strh r6, [r4, 0xA]
	b _081506FC
_08150666:
	adds r0, r7, 0
	bl sub_805D9C4
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	bgt _08150694
	adds r0, r1, 0x1
	strh r0, [r4, 0xA]
	b _081506FC
_0815067C:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063500
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl StartSpriteAnim
_08150694:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _081506FC
_0815069C:
	adds r0, r7, 0
	bl sub_805D9C4
	adds r0, r7, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081506FC
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _081506D0
	movs r0, 0
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_81507BC
	b _081506E2
_081506D0:
	movs r0, 0x2
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_81507BC
_081506E2:
	ldrb r1, [r5, 0x18]
	lsrs r1, 4
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0
	strh r0, [r7, 0x24]
	strh r0, [r7, 0x26]
	bl ScriptContext2_Disable
	mov r0, r8
	bl DestroyTask
_081506FC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81505C4

	thumb_func_start sub_8150708
sub_8150708: @ 8150708
	push {r4,r5,lr}
	ldr r5, _08150770 @ =gUnknown_2037078
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08150774 @ =gUnknown_2036E38
	adds r4, r0, r1
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08150768
	movs r0, 0x2
	bl sub_805C808
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_81507BC
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	ldr r1, _08150778 @ =gUnknown_20386E0
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_80DC44C
_08150768:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08150770: .4byte gUnknown_2037078
_08150774: .4byte gUnknown_2036E38
_08150778: .4byte gUnknown_20386E0
	thumb_func_end sub_8150708

	thumb_func_start sub_815077C
sub_815077C: @ 815077C
	push {lr}
	movs r0, 0x41
	bl FieldEffectStart
	ldr r0, _08150790 @ =sub_8150794
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08150790: .4byte sub_8150794
	thumb_func_end sub_815077C

	thumb_func_start sub_8150794
sub_8150794: @ 8150794
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x41
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _081507B4
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_081507B4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8150794

	thumb_func_start sub_81507BC
sub_81507BC: @ 81507BC
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	bl sub_805F060
	pop {r0}
	bx r0
	thumb_func_end sub_81507BC

	thumb_func_start sub_81507CC
sub_81507CC: @ 81507CC
	push {lr}
	movs r0, 0x1
	bl sub_805D154
	pop {r0}
	bx r0
	thumb_func_end sub_81507CC

	thumb_func_start sub_81507D8
sub_81507D8: @ 81507D8
	push {lr}
	movs r0, 0x2
	bl sub_805D154
	pop {r0}
	bx r0
	thumb_func_end sub_81507D8

	thumb_func_start sub_81507E4
sub_81507E4: @ 81507E4
	push {lr}
	movs r0, 0x3
	bl sub_805D154
	pop {r0}
	bx r0
	thumb_func_end sub_81507E4

	thumb_func_start sub_81507F0
sub_81507F0: @ 81507F0
	push {lr}
	movs r0, 0x4
	bl sub_805D154
	pop {r0}
	bx r0
	thumb_func_end sub_81507F0

	.align 2, 0 @ Don't pad with nop.
