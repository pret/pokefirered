	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start CheckMonIsValid
CheckMonIsValid: @ 80A0460
	push {lr}
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080A0478
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _080A047C
_080A0478:
	movs r0, 0
	b _080A047E
_080A047C:
	movs r0, 0x1
_080A047E:
	pop {r1}
	bx r1
	thumb_func_end CheckMonIsValid

	thumb_func_start AllMonsFainted
AllMonsFainted: @ 80A0484
	push {r4,r5,lr}
	ldr r4, _080A04A4 @ =gPlayerParty
	movs r5, 0
_080A048A:
	adds r0, r4, 0
	bl CheckMonIsValid
	cmp r0, 0
	beq _080A04A8
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080A04A8
	movs r0, 0
	b _080A04B2
	.align 2, 0
_080A04A4: .4byte gPlayerParty
_080A04A8:
	adds r5, 0x1
	adds r4, 0x64
	cmp r5, 0x5
	ble _080A048A
	movs r0, 0x1
_080A04B2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end AllMonsFainted

	thumb_func_start MonFaintFromPoisonOnField
MonFaintFromPoisonOnField: @ 80A04B8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _080A04FC @ =gPlayerParty
	adds r4, r0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x8
	bl AdjustFriendship
	adds r0, r4, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	ldr r5, _080A0500 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	adds r0, r5, 0
	bl StringGetEnd10
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A04FC: .4byte gPlayerParty
_080A0500: .4byte gStringVar1
	thumb_func_end MonFaintFromPoisonOnField

	thumb_func_start CheckMonFaintedFromPoison
CheckMonFaintedFromPoison: @ 80A0504
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _080A0540 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	bl CheckMonIsValid
	cmp r0, 0
	beq _080A0544
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080A0544
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A0544
	movs r0, 0x1
	b _080A0546
	.align 2, 0
_080A0540: .4byte gPlayerParty
_080A0544:
	movs r0, 0
_080A0546:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckMonFaintedFromPoison

	thumb_func_start Task_WhiteOut
Task_WhiteOut: @ 80A054C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A0570 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080A05A6
	cmp r0, 0x1
	bgt _080A0574
	cmp r0, 0
	beq _080A057A
	b _080A05F6
	.align 2, 0
_080A0570: .4byte gTasks+0x8
_080A0574:
	cmp r0, 0x2
	beq _080A05B8
	b _080A05F6
_080A057A:
	ldrh r1, [r4, 0x2]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bgt _080A05A0
_080A0584:
	lsls r0, r1, 24
	lsrs r0, 24
	bl CheckMonFaintedFromPoison
	cmp r0, 0
	bne _080A05D0
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	adds r1, r0, 0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080A0584
_080A05A0:
	movs r0, 0x2
	strh r0, [r4]
	b _080A05F6
_080A05A6:
	bl IsFieldMessageBoxHidden
	lsls r0, 24
	cmp r0, 0
	beq _080A05F6
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	b _080A05F6
_080A05B8:
	bl AllMonsFainted
	adds r1, r0, 0
	cmp r1, 0
	beq _080A05E8
	ldr r1, _080A05CC @ =gUnknown_20370D0
	movs r0, 0x1
	strh r0, [r1]
	b _080A05EC
	.align 2, 0
_080A05CC: .4byte gUnknown_20370D0
_080A05D0:
	ldrb r0, [r4, 0x2]
	bl MonFaintFromPoisonOnField
	ldr r0, _080A05E4 @ =gUnknown_81A5476
	bl ShowFieldMessage
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080A05F6
	.align 2, 0
_080A05E4: .4byte gUnknown_81A5476
_080A05E8:
	ldr r0, _080A05FC @ =gUnknown_20370D0
	strh r1, [r0]
_080A05EC:
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
_080A05F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A05FC: .4byte gUnknown_20370D0
	thumb_func_end Task_WhiteOut

	thumb_func_start ExecuteWhiteOut
ExecuteWhiteOut: @ 80A0600
	push {lr}
	ldr r0, _080A0614 @ =Task_WhiteOut
	movs r1, 0x50
	bl CreateTask
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080A0614: .4byte Task_WhiteOut
	thumb_func_end ExecuteWhiteOut

	thumb_func_start overworld_poison
overworld_poison: @ 80A0618
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _080A0684 @ =gPlayerParty
	movs r7, 0
	movs r6, 0
	movs r5, 0x5
_080A0624:
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _080A0668
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A0668
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	str r0, [sp]
	cmp r0, 0
	beq _080A065A
	subs r0, 0x1
	str r0, [sp]
	cmp r0, 0
	bne _080A065C
_080A065A:
	adds r6, 0x1
_080A065C:
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	adds r7, 0x1
_080A0668:
	adds r4, 0x64
	subs r5, 0x1
	cmp r5, 0
	bge _080A0624
	cmp r6, 0
	bne _080A0678
	cmp r7, 0
	beq _080A067C
_080A0678:
	bl overworld_poison_effect
_080A067C:
	cmp r6, 0
	beq _080A0688
	movs r0, 0x2
	b _080A0692
	.align 2, 0
_080A0684: .4byte gPlayerParty
_080A0688:
	cmp r7, 0
	bne _080A0690
	movs r0, 0
	b _080A0692
_080A0690:
	movs r0, 0x1
_080A0692:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end overworld_poison

	.align 2, 0 @ Don't pad with nop.
