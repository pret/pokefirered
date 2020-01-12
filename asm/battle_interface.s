	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start Task_HidePartyStatusSummary
Task_HidePartyStatusSummary: @ 80491B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _080492C0 @ =gTasks
	lsls r3, r0, 2
	adds r1, r3, r0
	lsls r1, 3
	adds r0, r1, r2
	ldrb r7, [r0, 0x1C]
	ldrb r4, [r0, 0xA]
	mov r10, r4
	ldrb r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r5, 0
	str r3, [sp, 0xC]
	adds r2, 0xE
	adds r2, r1, r2
_080491DE:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _080491DE
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	ldr r1, _080492C0 @ =gTasks
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x10
	strh r1, [r0, 0x26]
	movs r5, 0
	mov r1, r10
	lsls r1, 4
	str r1, [sp, 0x10]
	ldr r3, _080492C4 @ =gSprites
	movs r6, 0xD
	negs r6, r6
	mov r12, r3
	movs r4, 0x4
_08049220:
	mov r2, sp
	adds r0, r2, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0x1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x1]
	adds r5, 0x1
	cmp r5, 0x5
	ble _08049220
	ldr r2, [sp, 0x10]
	add r2, r10
	lsls r2, 2
	add r2, r12
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x1]
	cmp r7, 0
	bne _0804925A
	b _08049360
_0804925A:
	movs r5, 0
	mov r6, r12
	mov r9, r5
	adds r3, r6, 0
	adds r3, 0x1C
	mov r4, sp
	movs r7, 0
_08049268:
	ldr r0, [sp, 0x8]
	str r3, [sp, 0x14]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, [sp, 0x14]
	cmp r2, 0
	beq _080492CC
	movs r0, 0x5
	subs r0, r5
	mov r1, sp
	adds r2, r1, r0
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x36]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080492C8 @ =sub_8049630
	str r1, [r0]
	ldr r2, _080492C4 @ =gSprites
	mov r12, r2
	b _08049302
	.align 2, 0
_080492C0: .4byte gTasks
_080492C4: .4byte gSprites
_080492C8: .4byte sub_8049630
_080492CC:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x34]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _08049348 @ =sub_8049630
	str r1, [r0]
	ldr r0, _0804934C @ =gSprites
	mov r12, r0
_08049302:
	adds r4, 0x1
	adds r7, 0x7
	adds r5, 0x1
	cmp r5, 0x5
	ble _08049268
	ldr r3, [sp, 0x10]
	add r3, r10
	lsls r3, 2
	mov r1, r12
	adds r0, r3, r1
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	mov r1, r12
	adds r1, 0x1C
	adds r3, r1
	ldr r1, _08049350 @ =sub_8049568
	str r1, [r3]
	ldr r1, _08049354 @ =gUnknown_8260404
	bl SetSubspriteTables
	ldr r1, _08049358 @ =gTasks
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0804935C @ =sub_8049388
	str r1, [r0]
	b _0804936E
	.align 2, 0
_08049348: .4byte sub_8049630
_0804934C: .4byte gSprites
_08049350: .4byte sub_8049568
_08049354: .4byte gUnknown_8260404
_08049358: .4byte gTasks
_0804935C: .4byte sub_8049388
_08049360:
	ldr r0, _08049380 @ =gTasks
	ldr r1, [sp, 0xC]
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldr r0, _08049384 @ =sub_804948C
	str r0, [r1]
_0804936E:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049380: .4byte gTasks
_08049384: .4byte sub_804948C
	thumb_func_end Task_HidePartyStatusSummary

	thumb_func_start sub_8049388
sub_8049388: @ 8049388
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080493DC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080493C8
	ldrh r0, [r4, 0x26]
	subs r1, r0, 0x1
	strh r1, [r4, 0x26]
	lsls r0, r1, 16
	cmp r0, 0
	blt _080493D4
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
_080493C8:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080493D4
	ldr r0, _080493E0 @ =sub_80493E4
	str r0, [r4]
_080493D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080493DC: .4byte gTasks
_080493E0: .4byte sub_80493E4
	thumb_func_end sub_8049388

	thumb_func_start sub_80493E4
sub_80493E4: @ 80493E4
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r7, _0804945C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	adds r1, r6, r7
	ldrh r0, [r1, 0x26]
	subs r0, 0x1
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r2, r0, 16
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08049464
	ldrb r3, [r1, 0xA]
	movs r5, 0
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r6, r0
_08049412:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08049412
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08049460 @ =gSprites
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_08049442:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _08049442
	b _08049482
	.align 2, 0
_0804945C: .4byte gTasks
_08049460: .4byte gSprites
_08049464:
	movs r0, 0x3
	negs r0, r0
	cmp r2, r0
	bne _08049482
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyTask
_08049482:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80493E4

	thumb_func_start sub_804948C
sub_804948C: @ 804948C
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r7, _080494C4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	adds r3, r6, r7
	ldrh r0, [r3, 0x26]
	subs r1, r0, 0x1
	strh r1, [r3, 0x26]
	lsls r0, r1, 16
	asrs r2, r0, 16
	cmp r2, 0
	blt _080494C8
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	b _08049546
	.align 2, 0
_080494C4: .4byte gTasks
_080494C8:
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08049528
	ldrb r3, [r3, 0xA]
	movs r5, 0
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r6, r0
_080494DA:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _080494DA
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08049524 @ =gSprites
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_0804950A:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804950A
	b _08049546
	.align 2, 0
_08049524: .4byte gSprites
_08049528:
	movs r0, 0x3
	negs r0, r0
	cmp r2, r0
	bne _08049546
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyTask
_08049546:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804948C

	thumb_func_start SpriteCB_StatusSummaryBar
SpriteCB_StatusSummaryBar: @ 8049550
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x24]
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08049564
	ldrh r0, [r1, 0x2E]
	adds r0, r2, r0
	strh r0, [r1, 0x24]
_08049564:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_StatusSummaryBar

	thumb_func_start sub_8049568
sub_8049568: @ 8049568
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	adds r1, 0x20
	strh r1, [r2, 0x30]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _08049586
	lsls r0, r1, 16
	asrs r0, 20
	ldrh r1, [r2, 0x24]
	adds r0, r1
	b _0804958E
_08049586:
	lsls r1, 16
	asrs r1, 20
	ldrh r0, [r2, 0x24]
	subs r0, r1
_0804958E:
	strh r0, [r2, 0x24]
	ldrh r1, [r2, 0x30]
	movs r0, 0xF
	ands r0, r1
	strh r0, [r2, 0x30]
	pop {r0}
	bx r0
	thumb_func_end sub_8049568

	thumb_func_start SpriteCB_StatusSummaryBallsOnBattleStart
SpriteCB_StatusSummaryBallsOnBattleStart: @ 804959C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080495B0
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _08049626
_080495B0:
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r3, r0, 24
	ldrh r2, [r4, 0x34]
	adds r0, r2, 0
	adds r0, 0x38
	lsls r1, r0, 16
	lsrs r2, r1, 16
	ldr r0, _080495E0 @ =0x0000fff0
	ands r2, r0
	strh r2, [r4, 0x34]
	cmp r3, 0
	beq _080495E4
	lsrs r0, r1, 20
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080495F4
	movs r0, 0
	strh r0, [r4, 0x24]
	b _080495F4
	.align 2, 0
_080495E0: .4byte 0x0000fff0
_080495E4:
	lsrs r1, 20
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bge _080495F4
	strh r3, [r4, 0x24]
_080495F4:
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08049626
	movs r1, 0x3F
	cmp r3, 0
	beq _08049604
	movs r1, 0xC0
_08049604:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08049618
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x6D
	bl PlaySE2WithPanning
	b _08049622
_08049618:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x6C
	bl PlaySE1WithPanning
_08049622:
	ldr r0, _0804962C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_08049626:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804962C: .4byte SpriteCallbackDummy
	thumb_func_end SpriteCB_StatusSummaryBallsOnBattleStart

	thumb_func_start sub_8049630
sub_8049630: @ 8049630
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _08049644
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _08049694
_08049644:
	ldrh r0, [r3, 0x32]
	lsls r0, 24
	ldrh r2, [r3, 0x34]
	adds r1, r2, 0
	adds r1, 0x38
	lsls r4, r1, 16
	lsrs r2, r4, 16
	ldr r1, _08049664 @ =0x0000fff0
	ands r2, r1
	strh r2, [r3, 0x34]
	cmp r0, 0
	beq _08049668
	lsrs r0, r4, 20
	ldrh r1, [r3, 0x24]
	adds r0, r1
	b _0804966E
	.align 2, 0
_08049664: .4byte 0x0000fff0
_08049668:
	lsrs r1, r4, 20
	ldrh r0, [r3, 0x24]
	subs r0, r1
_0804966E:
	strh r0, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x80
	lsls r1, 1
	cmp r0, r1
	bls _08049694
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0804969C @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
_08049694:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804969C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8049630

	thumb_func_start SpriteCB_StatusSummaryBallsOnSwitchout
SpriteCB_StatusSummaryBallsOnSwitchout: @ 80496A0
	ldrh r2, [r0, 0x2E]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080496BC @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	strh r2, [r0, 0x24]
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_080496BC: .4byte gSprites
	thumb_func_end SpriteCB_StatusSummaryBallsOnSwitchout

	thumb_func_start sub_80496C0
sub_80496C0: @ 80496C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08049760 @ =gDisplayedStringBattle
	ldr r1, _08049764 @ =gUnknown_8260556
	bl StringCopy
	adds r5, r0, 0
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	adds r0, r5, 0
	mov r1, sp
	bl StringCopy
	adds r5, r0, 0
	movs r0, 0xFC
	strb r0, [r5]
	adds r5, 0x1
	movs r0, 0x1
	strb r0, [r5]
	adds r5, 0x1
	adds r0, r7, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x1D
	beq _08049720
	cmp r0, 0x20
	bne _08049734
_08049720:
	movs r0, 0xB
	muls r1, r0
	ldr r0, _08049768 @ =gSpeciesNames
	adds r1, r0
	mov r0, sp
	bl StringCompare
	cmp r0, 0
	bne _08049734
	movs r6, 0x64
_08049734:
	ldr r1, _0804976C @ =gSprites
	mov r0, r8
	lsls r4, r0, 4
	adds r0, r4, r0
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl CheckBattleTypeGhost
	lsls r0, 24
	cmp r0, 0
	beq _08049754
	movs r6, 0x64
_08049754:
	cmp r6, 0
	beq _08049770
	cmp r6, 0xFE
	beq _0804977A
	movs r0, 0xB
	b _08049782
	.align 2, 0
_08049760: .4byte gDisplayedStringBattle
_08049764: .4byte gUnknown_8260556
_08049768: .4byte gSpeciesNames
_0804976C: .4byte gSprites
_08049770:
	movs r0, 0xB
	strb r0, [r5]
	adds r5, 0x1
	movs r0, 0xB5
	b _08049782
_0804977A:
	movs r0, 0xA
	strb r0, [r5]
	adds r5, 0x1
	movs r0, 0xB6
_08049782:
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	ldr r0, _080497E4 @ =gDisplayedStringBattle
	add r3, sp, 0xC
	movs r1, 0
	movs r2, 0x3
	bl AddTextPrinterAndCreateWindowOnHealthbox
	adds r6, r0, 0
	ldr r0, _080497E8 @ =gSprites
	mov r2, r8
	adds r1, r4, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r4, r0, 17
	ldrh r0, [r1, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080497F8
	ldr r1, _080497EC @ =0x06010040
	adds r0, r4, r1
	adds r1, r6, 0
	movs r2, 0x6
	bl TextIntoHealthboxObject
	bl IsDoubleBattle
	lsls r0, 24
	ldr r2, _080497F0 @ =0x06010400
	adds r5, r4, r2
	cmp r0, 0
	bne _080497D4
	ldr r0, _080497F4 @ =0x06010800
	adds r5, r4, r0
_080497D4:
	adds r1, r6, 0
	adds r1, 0xC0
	adds r0, r5, 0
	movs r2, 0x1
	bl TextIntoHealthboxObject
	b _08049804
	.align 2, 0
_080497E4: .4byte gDisplayedStringBattle
_080497E8: .4byte gSprites
_080497EC: .4byte 0x06010040
_080497F0: .4byte 0x06010400
_080497F4: .4byte 0x06010800
_080497F8:
	ldr r1, _08049818 @ =0x06010020
	adds r0, r4, r1
	adds r1, r6, 0
	movs r2, 0x7
	bl TextIntoHealthboxObject
_08049804:
	ldr r0, [sp, 0xC]
	bl RemoveWindowOnHealthbox
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049818: .4byte 0x06010020
	thumb_func_end sub_80496C0

	thumb_func_start sub_804981C
sub_804981C: @ 804981C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	ldr r0, _080498DC @ =gBattleTypeFlags
	ldr r1, [r0]
	ldr r0, _080498E0 @ =0x00010210
	ands r0, r1
	cmp r0, 0
	bne _0804991C
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	bne _0804991C
	ldr r0, _080498E4 @ =gSprites
	mov r9, r0
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	add r0, r9
	mov r8, r0
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _0804991C
	ldr r1, _080498E8 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r5, r0, r1
	ldrh r0, [r5]
	movs r7, 0x64
	muls r0, r7
	ldr r6, _080498EC @ =gEnemyParty
	adds r0, r6
	adds r1, r4, 0
	bl CheckBattleTypeGhost
	lsls r0, 24
	cmp r0, 0
	bne _0804991C
	ldrh r0, [r5]
	muls r0, r7
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	beq _0804991C
	mov r1, r8
	ldrh r0, [r1, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	mov r2, r10
	cmp r2, 0
	beq _080498F8
	movs r0, 0x46
	bl GetHealthboxElementGfxPtr
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r9
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
	ldr r2, _080498F0 @ =0x06010000
	adds r1, r2
	ldr r2, _080498F4 @ =0x04000008
	bl CpuSet
	b _0804991C
	.align 2, 0
_080498DC: .4byte gBattleTypeFlags
_080498E0: .4byte 0x00010210
_080498E4: .4byte gSprites
_080498E8: .4byte gBattlerPartyIndexes
_080498EC: .4byte gEnemyParty
_080498F0: .4byte 0x06010000
_080498F4: .4byte 0x04000008
_080498F8:
	mov r0, r10
	str r0, [sp]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
	ldr r0, _0804992C @ =0x06010000
	adds r1, r0
	ldr r2, _08049930 @ =0x05000008
	mov r0, sp
	bl CpuSet
_0804991C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804992C: .4byte 0x06010000
_08049930: .4byte 0x05000008
	thumb_func_end sub_804981C

	thumb_func_start UpdateStatusIconInHealthbox
UpdateStatusIconInHealthbox: @ 8049934
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _08049998 @ =gSprites
	mov r2, r9
	lsls r1, r2, 4
	add r1, r9
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r1, 0x38]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080499A4
	ldr r1, _0804999C @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080499A0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	bl IsDoubleBattle
	lsls r0, 24
	movs r3, 0x12
	mov r8, r3
	cmp r0, 0
	bne _080499C0
	movs r0, 0x1A
	mov r8, r0
	b _080499C0
	.align 2, 0
_08049998: .4byte gSprites
_0804999C: .4byte gBattlerPartyIndexes
_080499A0: .4byte gPlayerParty
_080499A4:
	ldr r1, _080499E0 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080499E4 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	movs r1, 0x11
	mov r8, r1
_080499C0:
	movs r0, 0x7
	ands r0, r4
	cmp r0, 0
	beq _080499E8
	movs r0, 0x1B
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0x2
	b _08049AF4
	.align 2, 0
_080499E0: .4byte gBattlerPartyIndexes
_080499E4: .4byte gEnemyParty
_080499E8:
	movs r0, 0x88
	ands r0, r4
	cmp r0, 0
	beq _08049A06
	movs r0, 0x15
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0
	b _08049AF4
_08049A06:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _08049A24
	movs r0, 0x21
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0x4
	b _08049AF4
_08049A24:
	movs r0, 0x20
	ands r0, r4
	cmp r0, 0
	beq _08049A42
	movs r0, 0x1E
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0x3
	b _08049AF4
_08049A42:
	movs r0, 0x40
	ands r0, r4
	cmp r0, 0
	beq _08049A60
	movs r0, 0x18
	adds r1, r7, 0
	bl GetStatusIconForBankId
	lsls r0, 24
	lsrs r0, 24
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r0, 0x1
	b _08049AF4
_08049A60:
	movs r0, 0x27
	bl GetHealthboxElementGfxPtr
	adds r6, r0, 0
	movs r4, 0
	mov r2, r9
	lsls r0, r2, 4
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	lsls r7, 2
	ldr r1, _08049AE0 @ =gSprites
	add r0, r9
	lsls r0, 2
	adds r5, r0, r1
_08049A7E:
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	mov r2, r8
	asrs r0, r2, 16
	adds r1, r0
	adds r1, r4
	lsls r1, 5
	ldr r3, _08049AE4 @ =0x06010000
	adds r1, r3
	adds r0, r6, 0
	ldr r2, _08049AE8 @ =0x04000008
	bl CpuSet
	adds r4, 0x1
	cmp r4, 0x2
	ble _08049A7E
	ldr r0, _08049AEC @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08049AD4
	movs r0, 0x1
	bl GetHealthboxElementGfxPtr
	ldr r2, _08049AE0 @ =gSprites
	mov r3, r10
	lsls r1, r3, 4
	add r1, r10
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _08049AE4 @ =0x06010000
	adds r1, r2
	ldr r2, _08049AF0 @ =0x04000010
	bl CpuSet
_08049AD4:
	mov r0, r9
	movs r1, 0x1
	bl sub_804981C
	b _08049BB6
	.align 2, 0
_08049AE0: .4byte gSprites
_08049AE4: .4byte 0x06010000
_08049AE8: .4byte 0x04000008
_08049AEC: .4byte gBattleSpritesDataPtr
_08049AF0: .4byte 0x04000010
_08049AF4:
	mov r1, r9
	lsls r5, r1, 4
	add r5, r9
	lsls r5, 2
	ldr r2, _08049BC4 @ =gSprites
	adds r5, r2
	ldrb r4, [r5, 0x5]
	lsrs r4, 4
	lsls r4, 4
	adds r4, 0xC
	adds r4, r7
	ldr r1, _08049BC8 @ =gUnknown_826055A
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	movs r3, 0x80
	lsls r3, 1
	adds r1, r4, r3
	movs r2, 0x2
	bl FillPalette
	lsls r4, 1
	ldr r0, _08049BCC @ =gPlttBufferUnfaded + 0x200
	adds r0, r4, r0
	ldr r1, _08049BD0 @ =0x05000200
	adds r4, r1
	adds r1, r4, 0
	movs r2, 0x1
	bl CpuSet
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	add r1, r8
	lsls r1, 5
	ldr r2, _08049BD4 @ =0x06010000
	mov r8, r2
	add r1, r8
	ldr r2, _08049BD8 @ =0x04000018
	adds r0, r6, 0
	bl CpuSet
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08049B62
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08049BAE
_08049B62:
	ldr r0, _08049BDC @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r7, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08049BAE
	movs r0, 0
	bl GetHealthboxElementGfxPtr
	mov r3, r10
	lsls r4, r3, 4
	add r4, r10
	lsls r4, 2
	ldr r1, _08049BC4 @ =gSprites
	adds r4, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	add r1, r8
	ldr r5, _08049BE0 @ =0x04000008
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x41
	bl GetHealthboxElementGfxPtr
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	adds r1, 0x20
	add r1, r8
	adds r2, r5, 0
	bl CpuSet
_08049BAE:
	mov r0, r9
	movs r1, 0
	bl sub_804981C
_08049BB6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049BC4: .4byte gSprites
_08049BC8: .4byte gUnknown_826055A
_08049BCC: .4byte gPlttBufferUnfaded + 0x200
_08049BD0: .4byte 0x05000200
_08049BD4: .4byte 0x06010000
_08049BD8: .4byte 0x04000018
_08049BDC: .4byte gBattleSpritesDataPtr
_08049BE0: .4byte 0x04000008
	thumb_func_end UpdateStatusIconInHealthbox

	thumb_func_start GetStatusIconForBankId
GetStatusIconForBankId: @ 8049BE4
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsrs r2, r0, 24
	adds r0, r2, 0
	subs r0, 0x15
	cmp r0, 0xC
	bhi _08049CA4
	lsls r0, 2
	ldr r1, _08049C00 @ =_08049C04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08049C00: .4byte _08049C04
	.align 2, 0
_08049C04:
	.4byte _08049C38
	.4byte _08049CA4
	.4byte _08049CA4
	.4byte _08049C4E
	.4byte _08049CA4
	.4byte _08049CA4
	.4byte _08049C64
	.4byte _08049CA4
	.4byte _08049CA4
	.4byte _08049C7A
	.4byte _08049CA4
	.4byte _08049CA4
	.4byte _08049C90
_08049C38:
	movs r2, 0x15
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x47
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x65
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x56
	b _08049CA4
_08049C4E:
	movs r2, 0x18
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x4A
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x68
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x59
	b _08049CA4
_08049C64:
	movs r2, 0x1B
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x4D
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x6B
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x5C
	b _08049CA4
_08049C7A:
	movs r2, 0x1E
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x50
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x6E
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x5F
	b _08049CA4
_08049C90:
	movs r2, 0x21
	cmp r3, 0
	beq _08049CA4
	movs r2, 0x53
	cmp r3, 0x1
	beq _08049CA4
	movs r2, 0x71
	cmp r3, 0x2
	bne _08049CA4
	movs r2, 0x62
_08049CA4:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end GetStatusIconForBankId

	thumb_func_start UpdateSafariBallsTextOnHealthbox
UpdateSafariBallsTextOnHealthbox: @ 8049CAC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08049D00 @ =gUnknown_83FE80C
	movs r1, 0
	movs r2, 0x3
	mov r3, sp
	bl AddTextPrinterAndCreateWindowOnHealthbox
	adds r5, r0, 0
	ldr r1, _08049D04 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r4, [r0, 0x4]
	lsls r4, 22
	lsrs r4, 17
	ldr r1, _08049D08 @ =0x06010040
	adds r0, r4, r1
	adds r1, r5, 0
	movs r2, 0x6
	bl TextIntoHealthboxObject
	ldr r0, _08049D0C @ =0x06010800
	adds r4, r0
	adds r5, 0xC0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl TextIntoHealthboxObject
	ldr r0, [sp]
	bl RemoveWindowOnHealthbox
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049D00: .4byte gUnknown_83FE80C
_08049D04: .4byte gSprites
_08049D08: .4byte 0x06010040
_08049D0C: .4byte 0x06010800
	thumb_func_end UpdateSafariBallsTextOnHealthbox

	thumb_func_start UpdateLeftNoOfBallsTextOnHealthbox
UpdateLeftNoOfBallsTextOnHealthbox: @ 8049D10
	push {r4,r5,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08049D84 @ =gText_HighlightRed_Left
	mov r0, sp
	bl StringCopy
	ldr r1, _08049D88 @ =gNumSafariBalls
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r0, 0
	mov r1, sp
	movs r2, 0
	bl GetStringWidth
	movs r1, 0x2F
	subs r1, r0
	add r3, sp, 0x10
	mov r0, sp
	movs r2, 0x3
	bl AddTextPrinterAndCreateWindowOnHealthbox
	adds r5, r0, 0
	ldr r1, _08049D8C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r4, [r0, 0x4]
	lsls r4, 22
	lsrs r4, 17
	ldr r1, _08049D90 @ =0x060102c0
	adds r0, r4, r1
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_804A734
	ldr r0, _08049D94 @ =0x06010a00
	adds r4, r0
	adds r5, 0x40
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_804A734
	ldr r0, [sp, 0x10]
	bl RemoveWindowOnHealthbox
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049D84: .4byte gText_HighlightRed_Left
_08049D88: .4byte gNumSafariBalls
_08049D8C: .4byte gSprites
_08049D90: .4byte 0x060102c0
_08049D94: .4byte 0x06010a00
	thumb_func_end UpdateLeftNoOfBallsTextOnHealthbox

	thumb_func_start UpdateHealthboxAttribute
UpdateHealthboxAttribute: @ 8049D98
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r1
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r1, _08049F44 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r7, 0
	bne _08049DD4
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08049DD4
	mov r0, r9
	bl GetBattlerSide
_08049DD4:
	ldr r1, _08049F44 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08049DF0
	b _08049F50
_08049DF0:
	cmp r7, 0x3
	beq _08049DF8
	cmp r7, 0
	bne _08049E0C
_08049DF8:
	mov r0, r8
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl UpdateLvlInHealthbox
_08049E0C:
	cmp r7, 0x1
	bhi _08049E26
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r6, 0
	movs r2, 0
	bl UpdateHpTextInHealthbox
_08049E26:
	cmp r7, 0x2
	beq _08049E2E
	cmp r7, 0
	bne _08049E44
_08049E2E:
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r6, 0
	movs r2, 0x1
	bl UpdateHpTextInHealthbox
_08049E44:
	cmp r7, 0x5
	beq _08049E4C
	cmp r7, 0
	bne _08049E80
_08049E4C:
	movs r0, 0
	bl LoadBattleBarGfx
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r9
	adds r1, r6, 0
	adds r2, r4, 0
	bl SetBattleBarStruct
	mov r0, r9
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0
	bl MoveBattleBar
_08049E80:
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0
	bne _08049F06
	cmp r7, 0x6
	beq _08049E96
	cmp r7, 0
	bne _08049F06
_08049E96:
	movs r0, 0x3
	bl LoadBattleBarGfx
	mov r0, r8
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r8
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	movs r1, 0x19
	bl GetMonData
	adds r3, r0, 0
	ldr r0, _08049F48 @ =gExperienceTables
	mov r12, r0
	lsls r1, r4, 2
	ldr r2, _08049F4C @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	add r1, r12
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	add r4, r12
	ldr r2, [r4]
	subs r2, r1
	mov r0, r10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, 0
	bl SetBattleBarStruct
	mov r0, r9
	adds r1, r6, 0
	movs r2, 0x1
	movs r3, 0
	bl MoveBattleBar
_08049F06:
	cmp r7, 0x4
	beq _08049F0E
	cmp r7, 0
	bne _08049F16
_08049F0E:
	adds r0, r6, 0
	mov r1, r8
	bl sub_80496C0
_08049F16:
	cmp r7, 0x9
	beq _08049F1E
	cmp r7, 0
	bne _08049F24
_08049F1E:
	adds r0, r6, 0
	bl UpdateStatusIconInHealthbox
_08049F24:
	cmp r7, 0xA
	bne _08049F2E
	adds r0, r6, 0
	bl UpdateSafariBallsTextOnHealthbox
_08049F2E:
	adds r0, r7, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08049FC6
	adds r0, r6, 0
	bl UpdateLeftNoOfBallsTextOnHealthbox
	b _08049FC6
	.align 2, 0
_08049F44: .4byte gSprites
_08049F48: .4byte gExperienceTables
_08049F4C: .4byte gBaseStats
_08049F50:
	cmp r7, 0x3
	beq _08049F58
	cmp r7, 0
	bne _08049F6C
_08049F58:
	mov r0, r8
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl UpdateLvlInHealthbox
_08049F6C:
	cmp r7, 0x5
	beq _08049F74
	cmp r7, 0
	bne _08049FA8
_08049F74:
	movs r0, 0
	bl LoadBattleBarGfx
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r9
	adds r1, r6, 0
	adds r2, r4, 0
	bl SetBattleBarStruct
	mov r0, r9
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0
	bl MoveBattleBar
_08049FA8:
	cmp r7, 0x4
	beq _08049FB0
	cmp r7, 0
	bne _08049FB8
_08049FB0:
	adds r0, r6, 0
	mov r1, r8
	bl sub_80496C0
_08049FB8:
	cmp r7, 0x9
	beq _08049FC0
	cmp r7, 0
	bne _08049FC6
_08049FC0:
	adds r0, r6, 0
	bl UpdateStatusIconInHealthbox
_08049FC6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end UpdateHealthboxAttribute

	thumb_func_start MoveBattleBar
MoveBattleBar: @ 8049FD8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	cmp r2, 0
	bne _0804A024
	ldr r0, _0804A020 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	mov r1, r8
	lsls r5, r1, 2
	adds r3, r5, r1
	lsls r3, 2
	adds r3, r0
	ldr r0, [r3, 0x4]
	ldr r1, [r3, 0x8]
	ldr r2, [r3, 0xC]
	adds r3, 0x10
	movs r4, 0x6
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	bl sub_804A2F0
	adds r4, r0, 0
	adds r7, r5, 0
	b _0804A080
	.align 2, 0
_0804A020: .4byte gBattleSpritesDataPtr
_0804A024:
	ldr r2, _0804A0D0 @ =gBattleSpritesDataPtr
	mov r10, r2
	ldr r0, [r2]
	ldr r2, [r0, 0xC]
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r6, r0, 2
	adds r2, r6, r2
	ldr r0, [r2, 0x8]
	ldr r1, [r2, 0xC]
	ldr r2, [r2, 0x4]
	movs r3, 0x8
	bl GetScaledExpFraction
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r4, 0
	cmp r5, 0
	bne _0804A04E
	movs r5, 0x1
_0804A04E:
	mov r1, r10
	ldr r0, [r1]
	ldr r0, [r0, 0xC]
	adds r4, r6, r0
	ldr r6, [r4, 0xC]
	adds r0, r6, 0
	adds r1, r5, 0
	bl __divsi3
	cmp r0, 0
	bge _0804A066
	negs r0, r0
_0804A066:
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r4, 0x4]
	ldr r1, [r4, 0x8]
	adds r3, r4, 0
	adds r3, 0x10
	movs r2, 0x8
	str r2, [sp]
	str r5, [sp, 0x4]
	adds r2, r6, 0
	bl sub_804A2F0
	adds r4, r0, 0
_0804A080:
	mov r2, r9
	cmp r2, 0x1
	beq _0804A09C
	cmp r2, 0
	bne _0804A0A4
	ldr r0, _0804A0D0 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0804A0A4
_0804A09C:
	mov r0, r8
	mov r1, r9
	bl sub_804A0D4
_0804A0A4:
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _0804A0BE
	ldr r0, _0804A0D0 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0xC]
	mov r2, r8
	adds r0, r7, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	str r1, [r0, 0x10]
_0804A0BE:
	adds r0, r4, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804A0D0: .4byte gBattleSpritesDataPtr
	thumb_func_end MoveBattleBar

	thumb_func_start sub_804A0D4
sub_804A0D4: @ 804A0D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _0804A0F0
	cmp r1, 0x1
	beq _0804A1D8
	b _0804A2D6
_0804A0F0:
	ldr r0, _0804A184 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	adds r3, r0
	ldr r0, [r3, 0x4]
	ldr r1, [r3, 0x8]
	ldr r2, [r3, 0xC]
	adds r3, 0x10
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804A3C4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	mov r9, r1
	adds r7, r5, 0
	cmp r0, 0x18
	bhi _0804A12C
	movs r2, 0x38
	mov r9, r2
	cmp r0, 0x9
	bls _0804A12C
	movs r4, 0x2F
	mov r9, r4
_0804A12C:
	movs r5, 0
	ldr r0, _0804A188 @ =gSprites
	mov r8, r0
_0804A132:
	ldr r0, _0804A184 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0xC]
	adds r0, r7, r6
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r5, 0x1
	bhi _0804A194
	mov r0, r9
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r8
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0x2
	adds r1, r2
	lsls r1, 5
	ldr r2, _0804A18C @ =0x06010000
	adds r1, r2
	ldr r2, _0804A190 @ =0x04000008
	bl CpuSet
	b _0804A1C2
	.align 2, 0
_0804A184: .4byte gBattleSpritesDataPtr
_0804A188: .4byte gSprites
_0804A18C: .4byte 0x06010000
_0804A190: .4byte 0x04000008
_0804A194:
	mov r0, r9
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r8
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r4, _0804A1D0 @ =0x06010040
	adds r1, r4
	ldr r2, _0804A1D4 @ =0x04000008
	bl CpuSet
_0804A1C2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0804A132
	b _0804A2D6
	.align 2, 0
_0804A1D0: .4byte 0x06010040
_0804A1D4: .4byte 0x04000008
_0804A1D8:
	ldr r0, _0804A27C @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0xC]
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	adds r3, r0
	ldr r0, [r3, 0x4]
	ldr r1, [r3, 0x8]
	ldr r2, [r3, 0xC]
	adds r3, 0x10
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x8
	str r4, [sp, 0x4]
	bl sub_804A3C4
	ldr r1, _0804A280 @ =gBattlerPartyIndexes
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804A284 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	adds r7, r5, 0
	cmp r0, 0x64
	bne _0804A230
	movs r5, 0
	movs r1, 0
_0804A21E:
	mov r0, sp
	adds r0, r5
	adds r0, 0x8
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0804A21E
_0804A230:
	movs r5, 0
	ldr r0, _0804A288 @ =gSprites
	mov r8, r0
	adds r0, r7, r6
	lsls r4, r0, 2
_0804A23A:
	cmp r5, 0x3
	bhi _0804A294
	movs r0, 0xC
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804A27C @ =gBattleSpritesDataPtr
	ldr r1, [r1]
	ldr r1, [r1, 0xC]
	adds r1, r4, r1
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0
	adds r2, 0x24
	adds r1, r2
	lsls r1, 5
	ldr r2, _0804A28C @ =0x06010000
	adds r1, r2
	ldr r2, _0804A290 @ =0x04000008
	bl CpuSet
	b _0804A2CC
	.align 2, 0
_0804A27C: .4byte gBattleSpritesDataPtr
_0804A280: .4byte gBattlerPartyIndexes
_0804A284: .4byte gPlayerParty
_0804A288: .4byte gSprites
_0804A28C: .4byte 0x06010000
_0804A290: .4byte 0x04000008
_0804A294:
	movs r0, 0xC
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804A2E4 @ =gBattleSpritesDataPtr
	ldr r1, [r1]
	ldr r1, [r1, 0xC]
	adds r1, r4, r1
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r2, _0804A2E8 @ =0x06010b80
	adds r1, r2
	ldr r2, _0804A2EC @ =0x04000008
	bl CpuSet
_0804A2CC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0804A23A
_0804A2D6:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A2E4: .4byte gBattleSpritesDataPtr
_0804A2E8: .4byte 0x06010b80
_0804A2EC: .4byte 0x04000008
	thumb_func_end sub_804A0D4

	thumb_func_start sub_804A2F0
sub_804A2F0: @ 804A2F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	mov r8, r2
	adds r5, r3, 0
	ldr r1, [sp, 0x18]
	ldr r0, [sp, 0x1C]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 27
	lsrs r2, r1, 24
	ldr r1, [r5]
	ldr r0, _0804A31C @ =0xffff8000
	cmp r1, r0
	bne _0804A322
	cmp r7, r2
	bge _0804A320
	lsls r0, r4, 8
	str r0, [r5]
	b _0804A322
	.align 2, 0
_0804A31C: .4byte 0xffff8000
_0804A320:
	str r4, [r5]
_0804A322:
	mov r0, r8
	subs r4, r0
	cmp r4, 0
	bge _0804A32E
	movs r4, 0
	b _0804A334
_0804A32E:
	cmp r4, r7
	ble _0804A334
	adds r4, r7, 0
_0804A334:
	cmp r7, r2
	bge _0804A350
	ldr r0, [r5]
	asrs r1, r0, 8
	adds r6, r0, 0
	cmp r4, r1
	bne _0804A35C
	movs r0, 0xFF
	ands r0, r6
	cmp r0, 0
	bne _0804A35C
	movs r0, 0x1
	negs r0, r0
	b _0804A3B8
_0804A350:
	ldr r6, [r5]
	cmp r4, r6
	bne _0804A35C
	movs r0, 0x1
	negs r0, r0
	b _0804A3B8
_0804A35C:
	cmp r7, r2
	bge _0804A396
	lsls r0, r7, 8
	adds r1, r2, 0
	bl __divsi3
	mov r1, r8
	cmp r1, 0
	bge _0804A37A
	adds r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	cmp r2, r4
	blt _0804A3B6
	b _0804A38E
_0804A37A:
	subs r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	movs r1, 0xFF
	ands r0, r1
	cmp r0, 0
	ble _0804A38A
	adds r2, 0x1
_0804A38A:
	cmp r2, r4
	bgt _0804A3B6
_0804A38E:
	lsls r0, r4, 8
	str r0, [r5]
	adds r2, r4, 0
	b _0804A3B6
_0804A396:
	mov r0, r8
	cmp r0, 0
	bge _0804A3A8
	ldr r0, [r5]
	adds r0, r3
	str r0, [r5]
	cmp r0, r4
	ble _0804A3B4
	b _0804A3B2
_0804A3A8:
	ldr r0, [r5]
	subs r0, r3
	str r0, [r5]
	cmp r0, r4
	bge _0804A3B4
_0804A3B2:
	str r4, [r5]
_0804A3B4:
	ldr r2, [r5]
_0804A3B6:
	adds r0, r2, 0
_0804A3B8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804A2F0

	thumb_func_start sub_804A3C4
sub_804A3C4: @ 804A3C4
	push {r4-r7,lr}
	adds r4, r0, 0
	mov r12, r3
	ldr r7, [sp, 0x14]
	ldr r0, [sp, 0x18]
	lsls r0, 24
	lsrs r6, r0, 24
	subs r5, r1, r2
	cmp r5, 0
	bge _0804A3DC
	movs r5, 0
	b _0804A3E2
_0804A3DC:
	cmp r5, r4
	ble _0804A3E2
	adds r5, r4, 0
_0804A3E2:
	lsls r0, r6, 27
	lsrs r3, r0, 24
	movs r1, 0
	cmp r1, r6
	bcs _0804A3FC
	movs r2, 0
_0804A3EE:
	adds r0, r7, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcc _0804A3EE
_0804A3FC:
	cmp r4, r3
	bge _0804A410
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
	asrs r0, 8
	b _0804A41C
_0804A410:
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
_0804A41C:
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r3, 0
	bne _0804A432
	cmp r5, 0
	ble _0804A432
	movs r0, 0x1
	strb r0, [r7]
	movs r3, 0x1
	b _0804A456
_0804A432:
	movs r1, 0
	movs r4, 0x8
_0804A436:
	cmp r1, r6
	bcs _0804A456
	cmp r2, 0x7
	bls _0804A452
	adds r0, r7, r1
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	b _0804A436
_0804A452:
	adds r0, r7, r1
	strb r2, [r0]
_0804A456:
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804A3C4

	thumb_func_start sub_804A460
sub_804A460: @ 804A460
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	mov r9, r0
	mov r10, r1
	adds r6, r2, 0
	mov r8, r3
	ldr r5, [sp, 0x24]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 24
	lsrs r5, 24
	mov r1, r9
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	mov r3, r9
	ldr r2, [r3, 0x8]
	movs r3, 0x6
	str r3, [sp]
	movs r3, 0x1
	str r3, [sp, 0x4]
	mov r3, r10
	bl sub_804A2F0
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	str r5, [sp]
	mov r0, r9
	mov r1, r10
	adds r2, r6, 0
	mov r3, r8
	bl sub_804A510
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_804A460

	thumb_func_start sub_804A4C8
sub_804A4C8: @ 804A4C8
	push {r4,lr}
	sub sp, 0x8
	adds r3, r1, 0
	ldr r4, [r0]
	ldr r1, [r0, 0x4]
	ldr r2, [r0, 0x8]
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	adds r0, r4, 0
	bl sub_804A2F0
	lsls r0, 16
	asrs r0, 16
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_804A4C8

	thumb_func_start sub_804A4F0
sub_804A4F0: @ 804A4F0
	push {r4,lr}
	sub sp, 0x4
	ldr r4, [sp, 0xC]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	bl sub_804A510
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804A4F0

	thumb_func_start sub_804A510
sub_804A510: @ 804A510
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [sp, 0x40]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	ldr r2, [r4, 0x8]
	add r3, sp, 0xC
	str r3, [sp]
	movs r3, 0x6
	str r3, [sp, 0x4]
	adds r3, r5, 0
	bl sub_804A3C4
	movs r3, 0
	add r6, sp, 0x14
	adds r7, r6, 0
	ldrb r0, [r4, 0xC]
	lsls r5, r0, 27
	ldr r4, [r4, 0x10]
_0804A554:
	lsls r2, r3, 1
	adds r2, r7, r2
	lsrs r1, r5, 15
	mov r0, sp
	adds r0, r3
	adds r0, 0xC
	ldrb r0, [r0]
	adds r0, r4, r0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _0804A554
	movs r0, 0x6
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	mov r0, r9
	adds r1, r6, 0
	mov r2, r10
	mov r3, r8
	bl CopyToBgTilemapBufferRect_ChangePalette
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804A510

	thumb_func_start GetScaledExpFraction
GetScaledExpFraction: @ 804A59C
	push {r4-r7,lr}
	adds r6, r2, 0
	lsls r3, 27
	lsrs r7, r3, 24
	subs r5, r0, r1
	cmp r5, 0
	bge _0804A5AE
	movs r5, 0
	b _0804A5B4
_0804A5AE:
	cmp r5, r6
	ble _0804A5B4
	adds r5, r6, 0
_0804A5B4:
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	subs r0, r4, r0
	cmp r0, 0
	bge _0804A5DC
	negs r0, r0
_0804A5DC:
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetScaledExpFraction

	thumb_func_start GetScaledHPFraction
GetScaledHPFraction: @ 804A5E8
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	muls r0, r2
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0804A60C
	cmp r4, 0
	ble _0804A60C
	movs r0, 0x1
_0804A60C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetScaledHPFraction

	thumb_func_start GetHPBarLevel
GetHPBarLevel: @ 804A614
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _0804A626
	movs r0, 0x4
	b _0804A642
_0804A626:
	movs r2, 0x30
	bl GetScaledHPFraction
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x3
	cmp r1, 0x18
	bhi _0804A642
	movs r0, 0x2
	cmp r1, 0x9
	bhi _0804A642
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0804A642:
	pop {r1}
	bx r1
	thumb_func_end GetHPBarLevel

	thumb_func_start AddTextPrinterAndCreateWindowOnHealthbox
AddTextPrinterAndCreateWindowOnHealthbox: @ 804A648
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x20
	mov r9, r0
	adds r6, r1, 0
	mov r8, r2
	mov r10, r3
	ldr r0, _0804A6D4 @ =gUnknown_8260564
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	add r0, sp, 0x18
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, r4, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x22
	bl FillWindowPixelBuffer
	add r1, sp, 0x14
	movs r2, 0
	movs r0, 0x2
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	str r2, [sp]
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0xC]
	mov r0, r9
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r6, 0
	mov r3, r8
	bl AddTextPrinterParameterized4
	mov r0, r10
	str r4, [r0]
	adds r0, r5, 0
	movs r1, 0x7
	bl GetWindowAttribute
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804A6D4: .4byte gUnknown_8260564
	thumb_func_end AddTextPrinterAndCreateWindowOnHealthbox

	thumb_func_start RemoveWindowOnHealthbox
RemoveWindowOnHealthbox: @ 804A6D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl RemoveWindow
	pop {r0}
	bx r0
	thumb_func_end RemoveWindowOnHealthbox

	thumb_func_start TextIntoHealthboxObject
TextIntoHealthboxObject: @ 804A6E8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	movs r1, 0x80
	lsls r1, 1
	adds r0, r5, r1
	adds r1, r6, r1
	lsls r2, r4, 3
	ldr r3, _0804A72C @ =0x001fffff
	ands r2, r3
	movs r3, 0x80
	lsls r3, 19
	orrs r2, r3
	bl CpuSet
	cmp r4, 0
	ble _0804A724
_0804A70C:
	adds r0, r5, 0
	adds r0, 0x14
	adds r1, r6, 0
	adds r1, 0x14
	ldr r2, _0804A730 @ =0x04000003
	bl CpuSet
	adds r6, 0x20
	adds r5, 0x20
	subs r4, 0x1
	cmp r4, 0
	bne _0804A70C
_0804A724:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A72C: .4byte 0x001fffff
_0804A730: .4byte 0x04000003
	thumb_func_end TextIntoHealthboxObject

	thumb_func_start sub_804A734
sub_804A734: @ 804A734
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r4, r2, 3
	ldr r0, _0804A768 @ =0x001fffff
	ands r4, r0
	movs r0, 0x80
	lsls r0, 19
	orrs r4, r0
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl CpuSet
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0
	adds r6, r0
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl CpuSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A768: .4byte 0x001fffff
	thumb_func_end sub_804A734

	.align 2, 0 @ Don't pad with nop.
