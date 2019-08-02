	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_77
nullsub_77: @ 80D4200
	bx lr
	thumb_func_end nullsub_77

	thumb_func_start SetControllerToLinkPartner
SetControllerToLinkPartner: @ 80D4204
	ldr r1, _080D4214 @ =gBattlerControllerFuncs
	ldr r0, _080D4218 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D421C @ =LinkPartnerBufferRunCommand
	str r1, [r0]
	bx lr
	.align 2, 0
_080D4214: .4byte gBattlerControllerFuncs
_080D4218: .4byte gActiveBattler
_080D421C: .4byte LinkPartnerBufferRunCommand
	thumb_func_end SetControllerToLinkPartner

	thumb_func_start LinkPartnerBufferRunCommand
LinkPartnerBufferRunCommand: @ 80D4220
	push {lr}
	ldr r2, _080D4254 @ =gBattleControllerExecFlags
	ldr r1, _080D4258 @ =gBitTable
	ldr r0, _080D425C @ =gActiveBattler
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080D426C
	ldr r0, _080D4260 @ =gBattleBufferA
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _080D4268
	ldr r0, _080D4264 @ =gUnknown_83FB134
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _080D426C
	.align 2, 0
_080D4254: .4byte gBattleControllerExecFlags
_080D4258: .4byte gBitTable
_080D425C: .4byte gActiveBattler
_080D4260: .4byte gBattleBufferA
_080D4264: .4byte gUnknown_83FB134
_080D4268:
	bl sub_80D49E8
_080D426C:
	pop {r0}
	bx r0
	thumb_func_end LinkPartnerBufferRunCommand

	thumb_func_start sub_80D4270
sub_80D4270: @ 80D4270
	push {lr}
	ldr r2, _080D4298 @ =gSprites
	ldr r1, _080D429C @ =gBattlerSpriteIds
	ldr r0, _080D42A0 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080D42A4 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080D4294
	bl sub_80D49E8
_080D4294:
	pop {r0}
	bx r0
	.align 2, 0
_080D4298: .4byte gSprites
_080D429C: .4byte gBattlerSpriteIds
_080D42A0: .4byte gActiveBattler
_080D42A4: .4byte SpriteCallbackDummy
	thumb_func_end sub_80D4270

	thumb_func_start sub_80D42A8
sub_80D42A8: @ 80D42A8
	push {r4-r6,lr}
	ldr r6, _080D4300 @ =gSprites
	ldr r5, _080D4304 @ =gBattlerSpriteIds
	ldr r4, _080D4308 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _080D430C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080D42F8
	movs r0, 0
	bl nullsub_16
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl FreeSpriteOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	bl sub_80D49E8
_080D42F8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4300: .4byte gSprites
_080D4304: .4byte gBattlerSpriteIds
_080D4308: .4byte gActiveBattler
_080D430C: .4byte SpriteCallbackDummy
	thumb_func_end sub_80D42A8

	thumb_func_start sub_80D4310
sub_80D4310: @ 80D4310
	push {r4,lr}
	ldr r4, _080D4350 @ =gBattleSpritesDataPtr
	ldr r1, [r4]
	ldr r3, _080D4354 @ =gActiveBattler
	ldrb r0, [r3]
	ldr r2, [r1, 0x4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x9]
	subs r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080D4348
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x9]
	bl sub_80D49E8
_080D4348:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4350: .4byte gBattleSpritesDataPtr
_080D4354: .4byte gActiveBattler
	thumb_func_end sub_80D4310

	thumb_func_start sub_80D4358
sub_80D4358: @ 80D4358
	push {r4-r6,lr}
	movs r6, 0
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080D437C
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080D43B0
	ldr r0, _080D439C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080D43B0
_080D437C:
	ldr r2, _080D43A0 @ =gSprites
	ldr r1, _080D43A4 @ =gHealthboxSpriteIds
	ldr r0, _080D43A8 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080D43AC @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080D43E8
	b _080D43E6
	.align 2, 0
_080D439C: .4byte gBattleTypeFlags
_080D43A0: .4byte gSprites
_080D43A4: .4byte gHealthboxSpriteIds
_080D43A8: .4byte gActiveBattler
_080D43AC: .4byte SpriteCallbackDummy
_080D43B0:
	ldr r2, _080D4420 @ =gSprites
	ldr r5, _080D4424 @ =gHealthboxSpriteIds
	ldr r0, _080D4428 @ =gActiveBattler
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r2, 0
	adds r4, 0x1C
	adds r0, r4
	ldr r2, [r0]
	ldr r0, _080D442C @ =SpriteCallbackDummy
	cmp r2, r0
	bne _080D43E8
	movs r0, 0x2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	cmp r0, r2
	bne _080D43E8
_080D43E6:
	movs r6, 0x1
_080D43E8:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _080D43F4
	movs r6, 0
_080D43F4:
	cmp r6, 0
	beq _080D441A
	ldr r0, _080D4430 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r3, _080D4428 @ =gActiveBattler
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _080D4434 @ =gBattlerControllerFuncs
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D4438 @ =sub_80D4310
	str r1, [r0]
_080D441A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4420: .4byte gSprites
_080D4424: .4byte gHealthboxSpriteIds
_080D4428: .4byte gActiveBattler
_080D442C: .4byte SpriteCallbackDummy
_080D4430: .4byte gBattleSpritesDataPtr
_080D4434: .4byte gBattlerControllerFuncs
_080D4438: .4byte sub_80D4310
	thumb_func_end sub_80D4358

	thumb_func_start sub_80D443C
sub_80D443C: @ 80D443C
	push {r4-r7,lr}
	ldr r0, _080D4568 @ =gBattleSpritesDataPtr
	mov r12, r0
	ldr r0, [r0]
	ldr r6, _080D456C @ =gActiveBattler
	ldrb r2, [r6]
	ldr r4, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r4
	ldrb r1, [r3]
	movs r5, 0x8
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080D4460
	b _080D4562
_080D4460:
	movs r7, 0x2
	adds r1, r7, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080D4562
	ldrb r0, [r3, 0x9]
	adds r0, 0x1
	strb r0, [r3, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080D4562
	mov r1, r12
	ldr r0, [r1]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r4, [r0, 0x9]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080D4500
	ldr r0, _080D4570 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080D4500
	ldr r1, _080D4574 @ =gUnknown_3004FFC
	ldrb r0, [r6]
	eors r0, r7
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080D4578 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _080D457C @ =gHealthboxSpriteIds
	ldrb r0, [r6]
	adds r1, r7, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _080D4580 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080D4584 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r6]
	eors r0, r7
	bl sub_804BD94
	ldrb r0, [r6]
	eors r0, r7
	adds r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_080D4500:
	ldr r1, _080D4574 @ =gUnknown_3004FFC
	ldr r4, _080D456C @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080D4578 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _080D457C @ =gHealthboxSpriteIds
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _080D4580 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080D4584 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_804BD94
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r0, _080D4568 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r2, [r0, 0x8]
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _080D4588 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D458C @ =sub_80D4358
	str r1, [r0]
_080D4562:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4568: .4byte gBattleSpritesDataPtr
_080D456C: .4byte gActiveBattler
_080D4570: .4byte gBattleTypeFlags
_080D4574: .4byte gUnknown_3004FFC
_080D4578: .4byte gSprites
_080D457C: .4byte gHealthboxSpriteIds
_080D4580: .4byte gBattlerPartyIndexes
_080D4584: .4byte gPlayerParty
_080D4588: .4byte gBattlerControllerFuncs
_080D458C: .4byte sub_80D4358
	thumb_func_end sub_80D443C

	thumb_func_start sub_80D4590
sub_80D4590: @ 80D4590
	push {lr}
	ldr r2, _080D45C4 @ =gSprites
	ldr r1, _080D45C8 @ =gBattlerSpriteIds
	ldr r0, _080D45CC @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _080D45BE
	movs r2, 0x24
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D45BE
	bl sub_80D49E8
_080D45BE:
	pop {r0}
	bx r0
	.align 2, 0
_080D45C4: .4byte gSprites
_080D45C8: .4byte gBattlerSpriteIds
_080D45CC: .4byte gActiveBattler
	thumb_func_end sub_80D4590

	thumb_func_start sub_80D45D0
sub_80D45D0: @ 80D45D0
	push {r4-r6,lr}
	ldr r5, _080D4610 @ =gActiveBattler
	ldrb r0, [r5]
	ldr r6, _080D4614 @ =gHealthboxSpriteIds
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl MoveBattleBar
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080D4618
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl UpdateHpTextInHealthbox
	b _080D4632
	.align 2, 0
_080D4610: .4byte gActiveBattler
_080D4614: .4byte gHealthboxSpriteIds
_080D4618:
	ldr r2, _080D4638 @ =gBattlerPartyIndexes
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080D463C @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	bl sub_80D49E8
_080D4632:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4638: .4byte gBattlerPartyIndexes
_080D463C: .4byte gPlayerParty
	thumb_func_end sub_80D45D0

	thumb_func_start sub_80D4640
sub_80D4640: @ 80D4640
	push {r4-r6,lr}
	ldr r6, _080D4698 @ =gSprites
	ldr r5, _080D469C @ =gBattlerSpriteIds
	ldr r4, _080D46A0 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r6
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	cmp r0, 0xA0
	ble _080D4690
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	ldr r1, _080D46A4 @ =gHealthboxSpriteIds
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl sub_80D49E8
_080D4690:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4698: .4byte gSprites
_080D469C: .4byte gBattlerSpriteIds
_080D46A0: .4byte gActiveBattler
_080D46A4: .4byte gHealthboxSpriteIds
	thumb_func_end sub_80D4640

	thumb_func_start sub_80D46A8
sub_80D46A8: @ 80D46A8
	push {r4-r6,lr}
	ldr r0, _080D4704 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r6, _080D4708 @ =gActiveBattler
	ldrb r2, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080D46FC
	ldr r5, _080D470C @ =gBattlerSpriteIds
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080D4710 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _080D4714 @ =gHealthboxSpriteIds
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl sub_80D49E8
_080D46FC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4704: .4byte gBattleSpritesDataPtr
_080D4708: .4byte gActiveBattler
_080D470C: .4byte gBattlerSpriteIds
_080D4710: .4byte gSprites
_080D4714: .4byte gHealthboxSpriteIds
	thumb_func_end sub_80D46A8

	thumb_func_start sub_80D4718
sub_80D4718: @ 80D4718
	push {lr}
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _080D472A
	bl sub_80D49E8
_080D472A:
	pop {r0}
	bx r0
	thumb_func_end sub_80D4718

	thumb_func_start sub_80D4730
sub_80D4730: @ 80D4730
	push {r4,lr}
	ldr r1, _080D476C @ =gBattlerSpriteIds
	ldr r0, _080D4770 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _080D4774 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _080D477C
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080D4778 @ =gDoingBattleAnim
	strb r3, [r0]
	bl sub_80D49E8
	b _080D47A6
	.align 2, 0
_080D476C: .4byte gBattlerSpriteIds
_080D4770: .4byte gActiveBattler
_080D4774: .4byte gSprites
_080D4778: .4byte gDoingBattleAnim
_080D477C:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080D47A0
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D47A0:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_080D47A6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4730

	thumb_func_start sub_80D47AC
sub_80D47AC: @ 80D47AC
	push {r4,lr}
	ldr r2, _080D4800 @ =gSprites
	ldr r0, _080D4804 @ =gHealthboxSpriteIds
	ldr r4, _080D4808 @ =gActiveBattler
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080D480C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080D47F8
	ldr r0, _080D4810 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080D47EC
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x6
	bl InitAndLaunchSpecialAnimation
_080D47EC:
	ldr r0, _080D4814 @ =gBattlerControllerFuncs
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080D4818 @ =sub_80D481C
	str r0, [r1]
_080D47F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4800: .4byte gSprites
_080D4804: .4byte gHealthboxSpriteIds
_080D4808: .4byte gActiveBattler
_080D480C: .4byte SpriteCallbackDummy
_080D4810: .4byte gBattleSpritesDataPtr
_080D4814: .4byte gBattlerControllerFuncs
_080D4818: .4byte sub_80D481C
	thumb_func_end sub_80D47AC

	thumb_func_start sub_80D481C
sub_80D481C: @ 80D481C
	push {lr}
	ldr r0, _080D4844 @ =gBattleSpritesDataPtr
	ldr r2, [r0]
	ldr r0, _080D4848 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080D483E
	bl sub_80D49E8
_080D483E:
	pop {r0}
	bx r0
	.align 2, 0
_080D4844: .4byte gBattleSpritesDataPtr
_080D4848: .4byte gActiveBattler
	thumb_func_end sub_80D481C

	thumb_func_start sub_80D484C
sub_80D484C: @ 80D484C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r3, _080D4918 @ =gBattleSpritesDataPtr
	ldr r0, [r3]
	ldr r7, _080D491C @ =gActiveBattler
	ldrb r1, [r7]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D490E
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldrb r2, [r7]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _080D4920 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _080D4924 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	ldr r0, _080D4928 @ =gBattlerPartyIndexes
	mov r8, r0
	ldrb r1, [r7]
	lsls r0, r1, 1
	add r0, r8
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080D492C @ =gPlayerParty
	adds r0, r5
	bl HandleLowHpMusicChange
	ldr r1, _080D4930 @ =gBattlerSpriteIds
	ldrb r0, [r7]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080D4934 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, _080D4938 @ =gHealthboxSpriteIds
	ldrb r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r1, 1
	add r1, r8
	ldrh r1, [r1]
	muls r1, r6
	adds r1, r5
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r7]
	bl sub_804BD94
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldrb r0, [r7]
	bl CopyBattleSpriteInvisibility
	ldr r1, _080D493C @ =gBattlerControllerFuncs
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D4940 @ =sub_80D47AC
	str r1, [r0]
_080D490E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4918: .4byte gBattleSpritesDataPtr
_080D491C: .4byte gActiveBattler
_080D4920: .4byte 0x000027f9
_080D4924: .4byte c3_0802FDF4
_080D4928: .4byte gBattlerPartyIndexes
_080D492C: .4byte gPlayerParty
_080D4930: .4byte gBattlerSpriteIds
_080D4934: .4byte gSprites
_080D4938: .4byte gHealthboxSpriteIds
_080D493C: .4byte gBattlerControllerFuncs
_080D4940: .4byte sub_80D47AC
	thumb_func_end sub_80D484C

	thumb_func_start sub_80D4944
sub_80D4944: @ 80D4944
	push {r4-r6,lr}
	ldr r6, _080D49C4 @ =gBattleSpritesDataPtr
	ldr r0, [r6]
	ldr r4, _080D49C8 @ =gActiveBattler
	ldrb r2, [r4]
	ldr r1, [r0, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _080D4976
	ldr r0, _080D49CC @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080D49D0 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_080D4976:
	ldr r5, _080D49D4 @ =gSprites
	ldr r0, _080D49D8 @ =gUnknown_3004FFC
	ldrb r2, [r4]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r0, r5, 0
	adds r0, 0x1C
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _080D49DC @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080D49BC
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _080D49BC
	adds r0, r3, r5
	bl DestroySprite
	ldr r1, _080D49E0 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D49E4 @ =sub_80D484C
	str r1, [r0]
_080D49BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D49C4: .4byte gBattleSpritesDataPtr
_080D49C8: .4byte gActiveBattler
_080D49CC: .4byte gBattlerPartyIndexes
_080D49D0: .4byte gPlayerParty
_080D49D4: .4byte gSprites
_080D49D8: .4byte gUnknown_3004FFC
_080D49DC: .4byte SpriteCallbackDummy
_080D49E0: .4byte gBattlerControllerFuncs
_080D49E4: .4byte sub_80D484C
	thumb_func_end sub_80D4944

	thumb_func_start sub_80D49E8
sub_80D49E8: @ 80D49E8
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080D4A28 @ =gBattlerControllerFuncs
	ldr r4, _080D4A2C @ =gActiveBattler
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D4A30 @ =LinkPartnerBufferRunCommand
	str r1, [r0]
	ldr r0, _080D4A34 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D4A3C
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _080D4A38 @ =gBattleBufferA
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _080D4A4E
	.align 2, 0
_080D4A28: .4byte gBattlerControllerFuncs
_080D4A2C: .4byte gActiveBattler
_080D4A30: .4byte LinkPartnerBufferRunCommand
_080D4A34: .4byte gBattleTypeFlags
_080D4A38: .4byte gBattleBufferA
_080D4A3C:
	ldr r2, _080D4A58 @ =gBattleControllerExecFlags
	ldr r1, _080D4A5C @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_080D4A4E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4A58: .4byte gBattleControllerExecFlags
_080D4A5C: .4byte gBitTable
	thumb_func_end sub_80D49E8

	thumb_func_start sub_80D4A60
sub_80D4A60: @ 80D4A60
	push {lr}
	ldr r0, _080D4A88 @ =gBattleSpritesDataPtr
	ldr r2, [r0]
	ldr r0, _080D4A8C @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080D4A82
	bl sub_80D49E8
_080D4A82:
	pop {r0}
	bx r0
	.align 2, 0
_080D4A88: .4byte gBattleSpritesDataPtr
_080D4A8C: .4byte gActiveBattler
	thumb_func_end sub_80D4A60

	thumb_func_start sub_80D4A90
sub_80D4A90: @ 80D4A90
	push {lr}
	ldr r0, _080D4AB8 @ =gBattleSpritesDataPtr
	ldr r2, [r0]
	ldr r0, _080D4ABC @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _080D4AB2
	bl sub_80D49E8
_080D4AB2:
	pop {r0}
	bx r0
	.align 2, 0
_080D4AB8: .4byte gBattleSpritesDataPtr
_080D4ABC: .4byte gActiveBattler
	thumb_func_end sub_80D4A90

	thumb_func_start LinkPartnerHandleGetAttributes
LinkPartnerHandleGetAttributes: @ 80D4AC0
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _080D4AEC @ =gBattleBufferA
	ldr r0, _080D4AF0 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _080D4AF8
	ldr r0, _080D4AF4 @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl dp01_getattr_by_ch1_for_player_pokemon
	adds r6, r0, 0
	b _080D4B1A
	.align 2, 0
_080D4AEC: .4byte gBattleBufferA
_080D4AF0: .4byte gActiveBattler
_080D4AF4: .4byte gBattlerPartyIndexes
_080D4AF8:
	ldrb r4, [r1]
	movs r5, 0
_080D4AFC:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080D4B12
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl dp01_getattr_by_ch1_for_player_pokemon
	adds r6, r0
_080D4B12:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _080D4AFC
_080D4B1A:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl sub_80D49E8
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end LinkPartnerHandleGetAttributes

	thumb_func_start dp01_getattr_by_ch1_for_player_pokemon
dp01_getattr_by_ch1_for_player_pokemon: @ 80D4B34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _080D4B68 @ =gBattleBufferA
	ldr r3, _080D4B6C @ =gActiveBattler
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _080D4B5E
	bl _080D52CA
_080D4B5E:
	lsls r0, 2
	ldr r1, _080D4B70 @ =_080D4B74
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D4B68: .4byte gBattleBufferA
_080D4B6C: .4byte gActiveBattler
_080D4B70: .4byte _080D4B74
	.align 2, 0
_080D4B74:
	.4byte _080D4C64
	.4byte _080D4E88
	.4byte _080D4E98
	.4byte _080D4EA8
	.4byte _080D4F10
	.4byte _080D4F10
	.4byte _080D4F10
	.4byte _080D4F10
	.4byte _080D4F2C
	.4byte _080D4F68
	.4byte _080D4F68
	.4byte _080D4F68
	.4byte _080D4F68
	.4byte _080D52CA
	.4byte _080D52CA
	.4byte _080D52CA
	.4byte _080D52CA
	.4byte _080D4F84
	.4byte _080D4F94
	.4byte _080D4FC4
	.4byte _080D4FD4
	.4byte _080D4FE4
	.4byte _080D4FF4
	.4byte _080D5004
	.4byte _080D5014
	.4byte _080D5024
	.4byte _080D5034
	.4byte _080D5044
	.4byte _080D5054
	.4byte _080D5064
	.4byte _080D5074
	.4byte _080D5084
	.4byte _080D50D4
	.4byte _080D50E4
	.4byte _080D50F4
	.4byte _080D5104
	.4byte _080D5114
	.4byte _080D5124
	.4byte _080D5134
	.4byte _080D5144
	.4byte _080D5154
	.4byte _080D5188
	.4byte _080D5198
	.4byte _080D51A8
	.4byte _080D51B8
	.4byte _080D51C8
	.4byte _080D51D8
	.4byte _080D51E8
	.4byte _080D51F8
	.4byte _080D5218
	.4byte _080D5228
	.4byte _080D5238
	.4byte _080D5248
	.4byte _080D5258
	.4byte _080D5268
	.4byte _080D5278
	.4byte _080D5288
	.4byte _080D5298
	.4byte _080D52A8
	.4byte _080D52B8
_080D4C64:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080D4E78 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_080D4CB0:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080D4CB0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080D4E78 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _080D4E7C @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _080D4E80 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _080D4E84 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_080D4E68:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _080D4E68
	b _080D52CA
	.align 2, 0
_080D4E78: .4byte gPlayerParty
_080D4E7C: .4byte 0xfffffc1f
_080D4E80: .4byte 0xfff07fff
_080D4E84: .4byte 0xfffffe0f
_080D4E88:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4E94 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	b _080D5202
	.align 2, 0
_080D4E94: .4byte gPlayerParty
_080D4E98:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4EA4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	b _080D5202
	.align 2, 0
_080D4EA4: .4byte gPlayerParty
_080D4EA8:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080D4F0C @ =gPlayerParty
	adds r4, r1, r0
	mov r8, r9
_080D4EBE:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _080D4EBE
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4F0C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_080D4EFC:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _080D4EFC
	b _080D52CA
	.align 2, 0
_080D4F0C: .4byte gPlayerParty
_080D4F10:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4F28 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _080D5202
	.align 2, 0
_080D4F28: .4byte gPlayerParty
_080D4F2C:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _080D4F64 @ =gPlayerParty
	mov r8, r2
_080D4F38:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _080D4F38
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4F64 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _080D52CA
	.align 2, 0
_080D4F64: .4byte gPlayerParty
_080D4F68:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4F80 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _080D52C2
	.align 2, 0
_080D4F80: .4byte gPlayerParty
_080D4F84:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4F90 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	b _080D4F9E
	.align 2, 0
_080D4F90: .4byte gPlayerParty
_080D4F94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4FC0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x19
_080D4F9E:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _080D52CA
	.align 2, 0
_080D4FC0: .4byte gPlayerParty
_080D4FC4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4FD0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1A
	b _080D52C2
	.align 2, 0
_080D4FD0: .4byte gPlayerParty
_080D4FD4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4FE0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1B
	b _080D52C2
	.align 2, 0
_080D4FE0: .4byte gPlayerParty
_080D4FE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D4FF0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1C
	b _080D52C2
	.align 2, 0
_080D4FF0: .4byte gPlayerParty
_080D4FF4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5000 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1D
	b _080D52C2
	.align 2, 0
_080D5000: .4byte gPlayerParty
_080D5004:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5010 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1E
	b _080D52C2
	.align 2, 0
_080D5010: .4byte gPlayerParty
_080D5014:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5020 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1F
	b _080D52C2
	.align 2, 0
_080D5020: .4byte gPlayerParty
_080D5024:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5030 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x20
	b _080D52C2
	.align 2, 0
_080D5030: .4byte gPlayerParty
_080D5034:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5040 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x22
	b _080D52C2
	.align 2, 0
_080D5040: .4byte gPlayerParty
_080D5044:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5050 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	b _080D52C2
	.align 2, 0
_080D5050: .4byte gPlayerParty
_080D5054:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5060 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x24
	b _080D52C2
	.align 2, 0
_080D5060: .4byte gPlayerParty
_080D5064:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5070 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x25
	b _080D52C2
	.align 2, 0
_080D5070: .4byte gPlayerParty
_080D5074:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5080 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x26
	b _080D52C2
	.align 2, 0
_080D5080: .4byte gPlayerParty
_080D5084:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080D50D0 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _080D52CA
	.align 2, 0
_080D50D0: .4byte gPlayerParty
_080D50D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D50E0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x27
	b _080D52C2
	.align 2, 0
_080D50E0: .4byte gPlayerParty
_080D50E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D50F0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x28
	b _080D52C2
	.align 2, 0
_080D50F0: .4byte gPlayerParty
_080D50F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5100 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x29
	b _080D52C2
	.align 2, 0
_080D5100: .4byte gPlayerParty
_080D5104:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5110 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2A
	b _080D52C2
	.align 2, 0
_080D5110: .4byte gPlayerParty
_080D5114:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5120 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2B
	b _080D52C2
	.align 2, 0
_080D5120: .4byte gPlayerParty
_080D5124:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5130 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	b _080D52C2
	.align 2, 0
_080D5130: .4byte gPlayerParty
_080D5134:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5140 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	b _080D515E
	.align 2, 0
_080D5140: .4byte gPlayerParty
_080D5144:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5150 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x9
	b _080D5202
	.align 2, 0
_080D5150: .4byte gPlayerParty
_080D5154:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5184 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
_080D515E:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _080D52CA
	.align 2, 0
_080D5184: .4byte gPlayerParty
_080D5188:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5194 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	b _080D52C2
	.align 2, 0
_080D5194: .4byte gPlayerParty
_080D5198:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D51A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	b _080D5202
	.align 2, 0
_080D51A4: .4byte gPlayerParty
_080D51A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D51B4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	b _080D5202
	.align 2, 0
_080D51B4: .4byte gPlayerParty
_080D51B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D51C4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3B
	b _080D5202
	.align 2, 0
_080D51C4: .4byte gPlayerParty
_080D51C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D51D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3C
	b _080D5202
	.align 2, 0
_080D51D4: .4byte gPlayerParty
_080D51D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D51E4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3D
	b _080D5202
	.align 2, 0
_080D51E4: .4byte gPlayerParty
_080D51E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D51F4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3E
	b _080D5202
	.align 2, 0
_080D51F4: .4byte gPlayerParty
_080D51F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5214 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3F
_080D5202:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _080D52CA
	.align 2, 0
_080D5214: .4byte gPlayerParty
_080D5218:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5224 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x16
	b _080D52C2
	.align 2, 0
_080D5224: .4byte gPlayerParty
_080D5228:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5234 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x17
	b _080D52C2
	.align 2, 0
_080D5234: .4byte gPlayerParty
_080D5238:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5244 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x18
	b _080D52C2
	.align 2, 0
_080D5244: .4byte gPlayerParty
_080D5248:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5254 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x21
	b _080D52C2
	.align 2, 0
_080D5254: .4byte gPlayerParty
_080D5258:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5264 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2F
	b _080D52C2
	.align 2, 0
_080D5264: .4byte gPlayerParty
_080D5268:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5274 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x30
	b _080D52C2
	.align 2, 0
_080D5274: .4byte gPlayerParty
_080D5278:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5284 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x32
	b _080D52C2
	.align 2, 0
_080D5284: .4byte gPlayerParty
_080D5288:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5294 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x33
	b _080D52C2
	.align 2, 0
_080D5294: .4byte gPlayerParty
_080D5298:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D52A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x34
	b _080D52C2
	.align 2, 0
_080D52A4: .4byte gPlayerParty
_080D52A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D52B4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x35
	b _080D52C2
	.align 2, 0
_080D52B4: .4byte gPlayerParty
_080D52B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D52DC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x36
_080D52C2:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_080D52CA:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D52DC: .4byte gPlayerParty
	thumb_func_end dp01_getattr_by_ch1_for_player_pokemon

	thumb_func_start sub_80D52E0
sub_80D52E0: @ 80D52E0
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D52E0

	thumb_func_start LinkPartnerHandleSetAttributes
LinkPartnerHandleSetAttributes: @ 80D52EC
	push {r4,r5,lr}
	ldr r1, _080D5310 @ =gBattleBufferA
	ldr r0, _080D5314 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _080D531C
	ldr r0, _080D5318 @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_80D5344
	b _080D533A
	.align 2, 0
_080D5310: .4byte gBattleBufferA
_080D5314: .4byte gActiveBattler
_080D5318: .4byte gBattlerPartyIndexes
_080D531C:
	ldrb r4, [r1]
	movs r5, 0
_080D5320:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080D532E
	adds r0, r5, 0
	bl sub_80D5344
_080D532E:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080D5320
_080D533A:
	bl sub_80D49E8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LinkPartnerHandleSetAttributes

	thumb_func_start sub_80D5344
sub_80D5344: @ 80D5344
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080D537C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _080D5380 @ =gUnknown_2022BC7
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _080D5370
	bl _080D5D0A
_080D5370:
	lsls r0, 2
	ldr r1, _080D5384 @ =_080D5388
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D537C: .4byte gActiveBattler
_080D5380: .4byte gUnknown_2022BC7
_080D5384: .4byte _080D5388
	.align 2, 0
_080D5388:
	.4byte _080D5478
	.4byte _080D5610
	.4byte _080D5630
	.4byte _080D5650
	.4byte _080D56A8
	.4byte _080D56A8
	.4byte _080D56A8
	.4byte _080D56A8
	.4byte _080D56D0
	.4byte _080D5734
	.4byte _080D5734
	.4byte _080D5734
	.4byte _080D5734
	.4byte _080D5D0A
	.4byte _080D5D0A
	.4byte _080D5D0A
	.4byte _080D5D0A
	.4byte _080D5764
	.4byte _080D5784
	.4byte _080D57A4
	.4byte _080D57C4
	.4byte _080D57E4
	.4byte _080D5804
	.4byte _080D5824
	.4byte _080D5844
	.4byte _080D5864
	.4byte _080D5884
	.4byte _080D58A4
	.4byte _080D58C4
	.4byte _080D58E4
	.4byte _080D5904
	.4byte _080D5924
	.4byte _080D5994
	.4byte _080D59B4
	.4byte _080D59D4
	.4byte _080D59F4
	.4byte _080D5A14
	.4byte _080D5A34
	.4byte _080D5A54
	.4byte _080D5A74
	.4byte _080D5A94
	.4byte _080D5AB4
	.4byte _080D5AD4
	.4byte _080D5AF4
	.4byte _080D5B14
	.4byte _080D5B34
	.4byte _080D5B54
	.4byte _080D5B74
	.4byte _080D5B94
	.4byte _080D5BB4
	.4byte _080D5BD4
	.4byte _080D5BF4
	.4byte _080D5C14
	.4byte _080D5C34
	.4byte _080D5C54
	.4byte _080D5C74
	.4byte _080D5C94
	.4byte _080D5CB4
	.4byte _080D5CD4
	.4byte _080D5CF4
_080D5478:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080D560C @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_080D54DE:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _080D54DE
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080D560C @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D560C: .4byte gPlayerParty
_080D5610:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5628 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D562C @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5628: .4byte gPlayerParty
_080D562C: .4byte gActiveBattler
_080D5630:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5648 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D564C @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5648: .4byte gPlayerParty
_080D564C: .4byte gActiveBattler
_080D5650:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080D56A4 @ =gPlayerParty
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_080D566A:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _080D566A
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D56A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D56A4: .4byte gPlayerParty
_080D56A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D56C4 @ =gPlayerParty
	adds r0, r1
	ldr r3, _080D56C8 @ =gBattleBufferA
	ldr r1, _080D56CC @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _080D574C
	.align 2, 0
_080D56C4: .4byte gPlayerParty
_080D56C8: .4byte gBattleBufferA
_080D56CC: .4byte gActiveBattler
_080D56D0:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080D572C @ =gPlayerParty
	adds r4, r0
	ldr r5, _080D5730 @ =gActiveBattler
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D572C: .4byte gPlayerParty
_080D5730: .4byte gActiveBattler
_080D5734:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5758 @ =gPlayerParty
	adds r0, r1
	ldr r3, _080D575C @ =gBattleBufferA
	ldr r1, _080D5760 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_080D574C:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5758: .4byte gPlayerParty
_080D575C: .4byte gBattleBufferA
_080D5760: .4byte gActiveBattler
_080D5764:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D577C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5780 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D577C: .4byte gPlayerParty
_080D5780: .4byte gActiveBattler
_080D5784:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D579C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D57A0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D579C: .4byte gPlayerParty
_080D57A0: .4byte gActiveBattler
_080D57A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D57BC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D57C0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D57BC: .4byte gPlayerParty
_080D57C0: .4byte gActiveBattler
_080D57C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D57DC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D57E0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D57DC: .4byte gPlayerParty
_080D57E0: .4byte gActiveBattler
_080D57E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D57FC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5800 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D57FC: .4byte gPlayerParty
_080D5800: .4byte gActiveBattler
_080D5804:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D581C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5820 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D581C: .4byte gPlayerParty
_080D5820: .4byte gActiveBattler
_080D5824:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D583C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5840 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D583C: .4byte gPlayerParty
_080D5840: .4byte gActiveBattler
_080D5844:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D585C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5860 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D585C: .4byte gPlayerParty
_080D5860: .4byte gActiveBattler
_080D5864:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D587C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5880 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D587C: .4byte gPlayerParty
_080D5880: .4byte gActiveBattler
_080D5884:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D589C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D58A0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D589C: .4byte gPlayerParty
_080D58A0: .4byte gActiveBattler
_080D58A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D58BC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D58C0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D58BC: .4byte gPlayerParty
_080D58C0: .4byte gActiveBattler
_080D58C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D58DC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D58E0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D58DC: .4byte gPlayerParty
_080D58E0: .4byte gActiveBattler
_080D58E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D58FC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5900 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D58FC: .4byte gPlayerParty
_080D5900: .4byte gActiveBattler
_080D5904:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D591C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5920 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D591C: .4byte gPlayerParty
_080D5920: .4byte gActiveBattler
_080D5924:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080D598C @ =gPlayerParty
	adds r4, r0
	ldr r5, _080D5990 @ =gActiveBattler
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _080D5A44
	.align 2, 0
_080D598C: .4byte gPlayerParty
_080D5990: .4byte gActiveBattler
_080D5994:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D59AC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D59B0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D59AC: .4byte gPlayerParty
_080D59B0: .4byte gActiveBattler
_080D59B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D59CC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D59D0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D59CC: .4byte gPlayerParty
_080D59D0: .4byte gActiveBattler
_080D59D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D59EC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D59F0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D59EC: .4byte gPlayerParty
_080D59F0: .4byte gActiveBattler
_080D59F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5A0C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5A10 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5A0C: .4byte gPlayerParty
_080D5A10: .4byte gActiveBattler
_080D5A14:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5A2C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5A30 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5A2C: .4byte gPlayerParty
_080D5A30: .4byte gActiveBattler
_080D5A34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5A4C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5A50 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_080D5A44:
	movs r1, 0x2C
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5A4C: .4byte gPlayerParty
_080D5A50: .4byte gActiveBattler
_080D5A54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5A6C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5A70 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5A6C: .4byte gPlayerParty
_080D5A70: .4byte gActiveBattler
_080D5A74:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5A8C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5A90 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5A8C: .4byte gPlayerParty
_080D5A90: .4byte gActiveBattler
_080D5A94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5AAC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5AB0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5AAC: .4byte gPlayerParty
_080D5AB0: .4byte gActiveBattler
_080D5AB4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5ACC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5AD0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5ACC: .4byte gPlayerParty
_080D5AD0: .4byte gActiveBattler
_080D5AD4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5AEC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5AF0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5AEC: .4byte gPlayerParty
_080D5AF0: .4byte gActiveBattler
_080D5AF4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5B0C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5B10 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5B0C: .4byte gPlayerParty
_080D5B10: .4byte gActiveBattler
_080D5B14:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5B2C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5B30 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5B2C: .4byte gPlayerParty
_080D5B30: .4byte gActiveBattler
_080D5B34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5B4C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5B50 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5B4C: .4byte gPlayerParty
_080D5B50: .4byte gActiveBattler
_080D5B54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5B6C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5B70 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5B6C: .4byte gPlayerParty
_080D5B70: .4byte gActiveBattler
_080D5B74:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5B8C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5B90 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5B8C: .4byte gPlayerParty
_080D5B90: .4byte gActiveBattler
_080D5B94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5BAC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5BB0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5BAC: .4byte gPlayerParty
_080D5BB0: .4byte gActiveBattler
_080D5BB4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5BCC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5BD0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5BCC: .4byte gPlayerParty
_080D5BD0: .4byte gActiveBattler
_080D5BD4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5BEC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5BF0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5BEC: .4byte gPlayerParty
_080D5BF0: .4byte gActiveBattler
_080D5BF4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5C0C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5C10 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5C0C: .4byte gPlayerParty
_080D5C10: .4byte gActiveBattler
_080D5C14:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5C2C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5C30 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5C2C: .4byte gPlayerParty
_080D5C30: .4byte gActiveBattler
_080D5C34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5C4C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5C50 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5C4C: .4byte gPlayerParty
_080D5C50: .4byte gActiveBattler
_080D5C54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5C6C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5C70 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5C6C: .4byte gPlayerParty
_080D5C70: .4byte gActiveBattler
_080D5C74:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5C8C @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5C90 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5C8C: .4byte gPlayerParty
_080D5C90: .4byte gActiveBattler
_080D5C94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5CAC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5CB0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5CAC: .4byte gPlayerParty
_080D5CB0: .4byte gActiveBattler
_080D5CB4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5CCC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5CD0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5CCC: .4byte gPlayerParty
_080D5CD0: .4byte gActiveBattler
_080D5CD4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5CEC @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5CF0 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _080D5D0A
	.align 2, 0
_080D5CEC: .4byte gPlayerParty
_080D5CF0: .4byte gActiveBattler
_080D5CF4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080D5D34 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080D5D38 @ =gActiveBattler
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_080D5D0A:
	ldr r2, _080D5D3C @ =gBattlerPartyIndexes
	ldr r0, _080D5D38 @ =gActiveBattler
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080D5D34 @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D5D34: .4byte gPlayerParty
_080D5D38: .4byte gActiveBattler
_080D5D3C: .4byte gBattlerPartyIndexes
	thumb_func_end sub_80D5344

	thumb_func_start LinkPartnerHandlecmd3
LinkPartnerHandlecmd3: @ 80D5D40
	push {r4-r7,lr}
	ldr r1, _080D5DA4 @ =gBattlerPartyIndexes
	ldr r7, _080D5DA8 @ =gActiveBattler
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _080D5DAC @ =gBattleBufferA
	lsls r2, 9
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _080D5DB0 @ =gPlayerParty
	adds r0, r1
	adds r5, r3, r0
	movs r3, 0
	adds r0, r4, 0x2
	adds r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _080D5D98
	adds r6, r4, 0
	adds r2, r7, 0
	adds r4, r0, 0
_080D5D76:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, 0x3
	adds r0, r3, r0
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	bcc _080D5D76
_080D5D98:
	bl sub_80D49E8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D5DA4: .4byte gBattlerPartyIndexes
_080D5DA8: .4byte gActiveBattler
_080D5DAC: .4byte gBattleBufferA
_080D5DB0: .4byte gPlayerParty
	thumb_func_end LinkPartnerHandlecmd3

	thumb_func_start LinkPartnerHandleLoadPokeSprite
LinkPartnerHandleLoadPokeSprite: @ 80D5DB4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _080D5EA8 @ =gBattlerPartyIndexes
	mov r8, r0
	ldr r6, _080D5EAC @ =gActiveBattler
	ldrb r1, [r6]
	lsls r0, r1, 1
	add r0, r8
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080D5EB0 @ =gPlayerParty
	adds r0, r4
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r6]
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080D5EB4 @ =gMultiuseSpriteTemplate
	mov r8, r0
	ldrb r0, [r6]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r6]
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _080D5EB8 @ =gBattlerSpriteIds
	ldrb r1, [r6]
	adds r1, r4
	strb r0, [r1]
	ldr r5, _080D5EBC @ =gSprites
	ldrb r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080D5EC0 @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x2E]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080D5EC4 @ =gBattleMonForms
	adds r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldr r1, _080D5EC8 @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D5ECC @ =sub_80D4590
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D5EA8: .4byte gBattlerPartyIndexes
_080D5EAC: .4byte gActiveBattler
_080D5EB0: .4byte gPlayerParty
_080D5EB4: .4byte gMultiuseSpriteTemplate
_080D5EB8: .4byte gBattlerSpriteIds
_080D5EBC: .4byte gSprites
_080D5EC0: .4byte 0x0000ff10
_080D5EC4: .4byte gBattleMonForms
_080D5EC8: .4byte gBattlerControllerFuncs
_080D5ECC: .4byte sub_80D4590
	thumb_func_end LinkPartnerHandleLoadPokeSprite

	thumb_func_start LinkPartnerHandleSendOutPoke
LinkPartnerHandleSendOutPoke: @ 80D5ED0
	push {r4-r6,lr}
	ldr r5, _080D5F28 @ =gActiveBattler
	ldrb r0, [r5]
	ldr r4, _080D5F2C @ =gBattleBufferA
	lsls r1, r0, 9
	adds r6, r4, 0x2
	adds r1, r6
	ldrb r1, [r1]
	bl ClearTemporarySpeciesSpriteData
	ldr r2, _080D5F30 @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r2
	lsls r0, 9
	adds r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080D5F34 @ =gPlayerParty
	adds r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r5]
	lsls r1, r0, 9
	adds r1, r6
	ldrb r1, [r1]
	bl sub_80D5F40
	ldr r1, _080D5F38 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D5F3C @ =sub_80D4944
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D5F28: .4byte gActiveBattler
_080D5F2C: .4byte gBattleBufferA
_080D5F30: .4byte gBattlerPartyIndexes
_080D5F34: .4byte gPlayerParty
_080D5F38: .4byte gBattlerControllerFuncs
_080D5F3C: .4byte sub_80D4944
	thumb_func_end LinkPartnerHandleSendOutPoke

	thumb_func_start sub_80D5F40
sub_80D5F40: @ 80D5F40
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl ClearTemporarySpeciesSpriteData
	ldr r0, _080D6084 @ =gBattlerPartyIndexes
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _080D6088 @ =gBattleBufferA
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D608C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080D6090 @ =sub_8033E3C
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _080D6094 @ =gUnknown_3004FFC
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080D6098 @ =gMultiuseSpriteTemplate
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _080D609C @ =gBattlerSpriteIds
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _080D60A0 @ =gSprites
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080D60A4 @ =gBattleMonForms
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080D60A8 @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl DoPokeballSendOutAnimation
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6084: .4byte gBattlerPartyIndexes
_080D6088: .4byte gBattleBufferA
_080D608C: .4byte gPlayerParty
_080D6090: .4byte sub_8033E3C
_080D6094: .4byte gUnknown_3004FFC
_080D6098: .4byte gMultiuseSpriteTemplate
_080D609C: .4byte gBattlerSpriteIds
_080D60A0: .4byte gSprites
_080D60A4: .4byte gBattleMonForms
_080D60A8: .4byte SpriteCallbackDummy
	thumb_func_end sub_80D5F40

	thumb_func_start LinkPartnerHandleReturnPokeToBall
LinkPartnerHandleReturnPokeToBall: @ 80D60AC
	push {r4-r6,lr}
	ldr r1, _080D60E0 @ =gBattleBufferA
	ldr r6, _080D60E4 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	cmp r3, 0
	bne _080D60F4
	ldr r0, _080D60E8 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strb r3, [r0, 0x4]
	ldr r1, _080D60EC @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D60F0 @ =sub_80D613C
	str r1, [r0]
	b _080D612A
	.align 2, 0
_080D60E0: .4byte gBattleBufferA
_080D60E4: .4byte gActiveBattler
_080D60E8: .4byte gBattleSpritesDataPtr
_080D60EC: .4byte gBattlerControllerFuncs
_080D60F0: .4byte sub_80D613C
_080D60F4:
	ldr r5, _080D6130 @ =gBattlerSpriteIds
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080D6134 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _080D6138 @ =gHealthboxSpriteIds
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl sub_80D49E8
_080D612A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6130: .4byte gBattlerSpriteIds
_080D6134: .4byte gSprites
_080D6138: .4byte gHealthboxSpriteIds
	thumb_func_end LinkPartnerHandleReturnPokeToBall

	thumb_func_start sub_80D613C
sub_80D613C: @ 80D613C
	push {r4-r6,lr}
	ldr r6, _080D615C @ =gBattleSpritesDataPtr
	ldr r4, [r6]
	ldr r5, _080D6160 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r1, [r4, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _080D6164
	cmp r0, 0x1
	beq _080D6192
	b _080D61BA
	.align 2, 0
_080D615C: .4byte gBattleSpritesDataPtr
_080D6160: .4byte gActiveBattler
_080D6164:
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080D617E
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_080D617E:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _080D61BA
_080D6192:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080D61BA
	strb r0, [r3, 0x4]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl InitAndLaunchSpecialAnimation
	ldr r1, _080D61C0 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D61C4 @ =sub_80D46A8
	str r1, [r0]
_080D61BA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D61C0: .4byte gBattlerControllerFuncs
_080D61C4: .4byte sub_80D46A8
	thumb_func_end sub_80D613C

	thumb_func_start sub_80D61C8
sub_80D61C8: @ 80D61C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _080D6240 @ =gActiveBattler
	ldrb r0, [r6]
	bl GetBattlerPosition
	movs r1, 0x2
	ands r1, r0
	movs r7, 0x20
	cmp r1, 0
	beq _080D61E2
	movs r7, 0x5A
_080D61E2:
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	ldr r5, _080D6244 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	movs r4, 0xFF
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _080D6228
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r1, [r1]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0x1
	beq _080D6228
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, 0x3
	bne _080D6248
_080D6228:
	ldr r0, _080D6240 @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBankMultiplayerId
	ldr r2, _080D6244 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x13]
	adds r4, r0, 0x2
	b _080D6258
	.align 2, 0
_080D6240: .4byte gActiveBattler
_080D6244: .4byte gLinkPlayers
_080D6248:
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r4, [r1, 0x13]
_080D6258:
	ldr r5, _080D6318 @ =gActiveBattler
	ldrb r1, [r5]
	adds r0, r4, 0
	bl DecompressTrainerBackPalette
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r6, _080D631C @ =gMultiuseSpriteTemplate
	mov r8, r7
	ldr r0, _080D6320 @ =gTrainerBackPicCoords
	lsls r4, 2
	adds r4, r0
	ldrb r0, [r4]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r5]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	mov r1, r8
	adds r2, r4, 0
	bl CreateSprite
	ldr r6, _080D6324 @ =gBattlerSpriteIds
	ldrb r1, [r5]
	adds r1, r6
	strb r0, [r1]
	ldr r4, _080D6328 @ =gSprites
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080D632C @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080D6330 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _080D6334 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D6338 @ =sub_80D4270
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6318: .4byte gActiveBattler
_080D631C: .4byte gMultiuseSpriteTemplate
_080D6320: .4byte gTrainerBackPicCoords
_080D6324: .4byte gBattlerSpriteIds
_080D6328: .4byte gSprites
_080D632C: .4byte 0x0000fffe
_080D6330: .4byte sub_8033EEC
_080D6334: .4byte gBattlerControllerFuncs
_080D6338: .4byte sub_80D4270
	thumb_func_end sub_80D61C8

	thumb_func_start sub_80D633C
sub_80D633C: @ 80D633C
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D633C

	thumb_func_start sub_80D6348
sub_80D6348: @ 80D6348
	push {r4-r6,lr}
	ldr r6, _080D63D4 @ =gBattlerSpriteIds
	ldr r4, _080D63D8 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080D63DC @ =gSprites
	adds r0, r5
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080D63E0 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080D63E4 @ =StartAnimLinearTranslation
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080D63E8 @ =SpriteCallbackDummy
	bl StoreSpriteCallbackInData6
	ldr r1, _080D63EC @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D63F0 @ =sub_80D42A8
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D63D4: .4byte gBattlerSpriteIds
_080D63D8: .4byte gActiveBattler
_080D63DC: .4byte gSprites
_080D63E0: .4byte 0x0000ffd8
_080D63E4: .4byte StartAnimLinearTranslation
_080D63E8: .4byte SpriteCallbackDummy
_080D63EC: .4byte gBattlerControllerFuncs
_080D63F0: .4byte sub_80D42A8
	thumb_func_end sub_80D6348

	thumb_func_start sub_80D63F4
sub_80D63F4: @ 80D63F4
	push {r4-r6,lr}
	ldr r6, _080D6440 @ =gBattleSpritesDataPtr
	ldr r4, [r6]
	ldr r5, _080D6444 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r0, [r4, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _080D6448
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080D6428
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_080D6428:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	adds r1, 0x1
	strb r1, [r0, 0x4]
	b _080D64BE
	.align 2, 0
_080D6440: .4byte gBattleSpritesDataPtr
_080D6444: .4byte gActiveBattler
_080D6448:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080D64BE
	strb r4, [r3, 0x4]
	ldr r2, _080D64C4 @ =gBattlerPartyIndexes
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080D64C8 @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	movs r1, 0x40
	negs r1, r1
	movs r0, 0x10
	bl PlaySE12WithPanning
	ldr r2, _080D64CC @ =gSprites
	ldr r3, _080D64D0 @ =gBattlerSpriteIds
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x30]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x32]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080D64D4 @ =sub_8012110
	str r1, [r0]
	ldr r1, _080D64D8 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D64DC @ =sub_80D4640
	str r1, [r0]
_080D64BE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D64C4: .4byte gBattlerPartyIndexes
_080D64C8: .4byte gPlayerParty
_080D64CC: .4byte gSprites
_080D64D0: .4byte gBattlerSpriteIds
_080D64D4: .4byte sub_8012110
_080D64D8: .4byte gBattlerControllerFuncs
_080D64DC: .4byte sub_80D4640
	thumb_func_end sub_80D63F4

	thumb_func_start sub_80D64E0
sub_80D64E0: @ 80D64E0
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D64E0

	thumb_func_start sub_80D64EC
sub_80D64EC: @ 80D64EC
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D64EC

	thumb_func_start sub_80D64F8
sub_80D64F8: @ 80D64F8
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D64F8

	thumb_func_start sub_80D6504
sub_80D6504: @ 80D6504
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6504

	thumb_func_start sub_80D6510
sub_80D6510: @ 80D6510
	push {r4-r6,lr}
	ldr r6, _080D65F4 @ =gActiveBattler
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _080D6522
	b _080D6636
_080D6522:
	ldr r0, _080D65F8 @ =gBattleBufferA
	mov r12, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _080D65FC @ =gAnimMoveTurn
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _080D6600 @ =gAnimMovePower
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _080D6604 @ =gAnimMoveDmg
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _080D6608 @ =gAnimFriendship
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _080D660C @ =gWeatherMoveAnim
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _080D6610 @ =gAnimDisableStructPtr
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _080D6614 @ =gTransformedPersonalities
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl IsMoveWithoutAnimation
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080D6618
	bl sub_80D49E8
	b _080D6636
	.align 2, 0
_080D65F4: .4byte gActiveBattler
_080D65F8: .4byte gBattleBufferA
_080D65FC: .4byte gAnimMoveTurn
_080D6600: .4byte gAnimMovePower
_080D6604: .4byte gAnimMoveDmg
_080D6608: .4byte gAnimFriendship
_080D660C: .4byte gWeatherMoveAnim
_080D6610: .4byte gAnimDisableStructPtr
_080D6614: .4byte gTransformedPersonalities
_080D6618:
	ldr r0, _080D663C @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x4]
	ldr r1, _080D6640 @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D6644 @ =sub_80D6648
	str r1, [r0]
_080D6636:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D663C: .4byte gBattleSpritesDataPtr
_080D6640: .4byte gBattlerControllerFuncs
_080D6644: .4byte sub_80D6648
	thumb_func_end sub_80D6510

	thumb_func_start sub_80D6648
sub_80D6648: @ 80D6648
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _080D6694 @ =gBattleBufferA
	ldr r6, _080D6698 @ =gActiveBattler
	ldrb r3, [r6]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r10, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, r2, 0x2
	mov r9, r5
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	adds r2, 0xB
	adds r1, r2
	ldrb r1, [r1]
	mov r8, r1
	ldr r7, _080D669C @ =gBattleSpritesDataPtr
	ldr r5, [r7]
	ldr r1, [r5, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _080D66E0
	cmp r2, 0x1
	bgt _080D66A0
	cmp r2, 0
	beq _080D66AA
	b _080D67BC
	.align 2, 0
_080D6694: .4byte gBattleBufferA
_080D6698: .4byte gActiveBattler
_080D669C: .4byte gBattleSpritesDataPtr
_080D66A0:
	cmp r2, 0x2
	beq _080D670A
	cmp r2, 0x3
	beq _080D6780
	b _080D67BC
_080D66AA:
	ldr r1, [r5]
	lsls r0, r3, 2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _080D66CC
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_080D66CC:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _080D67BC
_080D66E0:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080D67BC
	movs r0, 0
	bl sub_8035450
	adds r0, r4, 0
	bl DoMoveAnim
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0, 0x4]
	b _080D67BC
_080D670A:
	ldr r0, _080D6770 @ =gAnimScriptCallback
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _080D6774 @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _080D67BC
	movs r0, 0x1
	bl sub_8035450
	ldr r0, [r7]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080D6758
	mov r0, r8
	cmp r0, 0x1
	bhi _080D6758
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl InitAndLaunchSpecialAnimation
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_080D6758:
	ldr r0, _080D6778 @ =gBattleSpritesDataPtr
	ldr r2, [r0]
	ldr r0, _080D677C @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _080D67BC
	.align 2, 0
_080D6770: .4byte gAnimScriptCallback
_080D6774: .4byte gAnimScriptActive
_080D6778: .4byte gBattleSpritesDataPtr
_080D677C: .4byte gActiveBattler
_080D6780:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080D67BC
	bl CopyAllBattleSpritesInvisibilities
	ldrb r0, [r6]
	lsls r2, r0, 9
	mov r3, r10
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r9
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl TrySetBehindSubstituteSpriteBit
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r4, [r0, 0x4]
	bl sub_80D49E8
_080D67BC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D6648

	thumb_func_start sub_80D67CC
sub_80D67CC: @ 80D67CC
	push {r4,lr}
	ldr r0, _080D6800 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D6804 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r0, _080D6808 @ =gActiveBattler
	ldrb r4, [r0]
	lsls r4, 9
	ldr r0, _080D680C @ =gUnknown_2022BC6
	adds r4, r0
	ldrh r0, [r4]
	bl BufferStringBattle
	ldrh r0, [r4]
	bl sub_80D89B0
	lsls r0, 24
	cmp r0, 0
	beq _080D6814
	ldr r0, _080D6810 @ =gDisplayedStringBattle
	movs r1, 0x40
	bl BattlePutTextOnWindow
	b _080D681C
	.align 2, 0
_080D6800: .4byte gBattle_BG0_X
_080D6804: .4byte gBattle_BG0_Y
_080D6808: .4byte gActiveBattler
_080D680C: .4byte gUnknown_2022BC6
_080D6810: .4byte gDisplayedStringBattle
_080D6814:
	ldr r0, _080D6830 @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
_080D681C:
	ldr r1, _080D6834 @ =gBattlerControllerFuncs
	ldr r0, _080D6838 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D683C @ =sub_80D4718
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6830: .4byte gDisplayedStringBattle
_080D6834: .4byte gBattlerControllerFuncs
_080D6838: .4byte gActiveBattler
_080D683C: .4byte sub_80D4718
	thumb_func_end sub_80D67CC

	thumb_func_start sub_80D6840
sub_80D6840: @ 80D6840
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6840

	thumb_func_start sub_80D684C
sub_80D684C: @ 80D684C
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D684C

	thumb_func_start sub_80D6858
sub_80D6858: @ 80D6858
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6858

	thumb_func_start sub_80D6864
sub_80D6864: @ 80D6864
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6864

	thumb_func_start sub_80D6870
sub_80D6870: @ 80D6870
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6870

	thumb_func_start sub_80D687C
sub_80D687C: @ 80D687C
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D687C

	thumb_func_start sub_80D6888
sub_80D6888: @ 80D6888
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6888

	thumb_func_start sub_80D6894
sub_80D6894: @ 80D6894
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl LoadBattleBarGfx
	ldr r3, _080D690C @ =gBattleBufferA
	ldr r0, _080D6910 @ =gActiveBattler
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _080D6914 @ =0x00007fff
	cmp r7, r0
	beq _080D6924
	ldr r6, _080D6918 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080D691C @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _080D6920 @ =gHealthboxSpriteIds
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _080D694E
	.align 2, 0
_080D690C: .4byte gBattleBufferA
_080D6910: .4byte gActiveBattler
_080D6914: .4byte 0x00007fff
_080D6918: .4byte gBattlerPartyIndexes
_080D691C: .4byte gPlayerParty
_080D6920: .4byte gHealthboxSpriteIds
_080D6924:
	ldr r1, _080D696C @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D6970 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _080D6974 @ =gHealthboxSpriteIds
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl SetBattleBarStruct
_080D694E:
	ldr r1, _080D6978 @ =gBattlerControllerFuncs
	ldr r0, _080D697C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D6980 @ =sub_80D45D0
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D696C: .4byte gBattlerPartyIndexes
_080D6970: .4byte gPlayerParty
_080D6974: .4byte gHealthboxSpriteIds
_080D6978: .4byte gBattlerControllerFuncs
_080D697C: .4byte gActiveBattler
_080D6980: .4byte sub_80D45D0
	thumb_func_end sub_80D6894

	thumb_func_start sub_80D6984
sub_80D6984: @ 80D6984
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6984

	thumb_func_start sub_80D6990
sub_80D6990: @ 80D6990
	push {r4,lr}
	ldr r4, _080D69EC @ =gActiveBattler
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _080D69E4
	ldr r0, _080D69F0 @ =gHealthboxSpriteIds
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _080D69F4 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080D69F8 @ =gPlayerParty
	adds r1, r2
	movs r2, 0x9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _080D69FC @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _080D6A00 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D6A04 @ =sub_80D4A60
	str r1, [r0]
_080D69E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D69EC: .4byte gActiveBattler
_080D69F0: .4byte gHealthboxSpriteIds
_080D69F4: .4byte gBattlerPartyIndexes
_080D69F8: .4byte gPlayerParty
_080D69FC: .4byte gBattleSpritesDataPtr
_080D6A00: .4byte gBattlerControllerFuncs
_080D6A04: .4byte sub_80D4A60
	thumb_func_end sub_80D6990

	thumb_func_start sub_80D6A08
sub_80D6A08: @ 80D6A08
	push {r4,r5,lr}
	ldr r5, _080D6A60 @ =gActiveBattler
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _080D6A58
	ldr r4, _080D6A64 @ =gBattleBufferA
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl InitAndLaunchChosenStatusAnimation
	ldr r1, _080D6A68 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D6A6C @ =sub_80D4A60
	str r1, [r0]
_080D6A58:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6A60: .4byte gActiveBattler
_080D6A64: .4byte gBattleBufferA
_080D6A68: .4byte gBattlerControllerFuncs
_080D6A6C: .4byte sub_80D4A60
	thumb_func_end sub_80D6A08

	thumb_func_start sub_80D6A70
sub_80D6A70: @ 80D6A70
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6A70

	thumb_func_start sub_80D6A7C
sub_80D6A7C: @ 80D6A7C
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6A7C

	thumb_func_start sub_80D6A88
sub_80D6A88: @ 80D6A88
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6A88

	thumb_func_start sub_80D6A94
sub_80D6A94: @ 80D6A94
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6A94

	thumb_func_start sub_80D6AA0
sub_80D6AA0: @ 80D6AA0
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6AA0

	thumb_func_start sub_80D6AAC
sub_80D6AAC: @ 80D6AAC
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6AAC

	thumb_func_start sub_80D6AB8
sub_80D6AB8: @ 80D6AB8
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6AB8

	thumb_func_start sub_80D6AC4
sub_80D6AC4: @ 80D6AC4
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6AC4

	thumb_func_start sub_80D6AD0
sub_80D6AD0: @ 80D6AD0
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6AD0

	thumb_func_start LinkPartnerHandlecmd37
LinkPartnerHandlecmd37: @ 80D6ADC
	push {lr}
	ldr r2, _080D6AF4 @ =gUnknown_2022870
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl sub_80D49E8
	pop {r0}
	bx r0
	.align 2, 0
_080D6AF4: .4byte gUnknown_2022870
	thumb_func_end LinkPartnerHandlecmd37

	thumb_func_start LinkPartnerHandlecmd38
LinkPartnerHandlecmd38: @ 80D6AF8
	push {lr}
	ldr r3, _080D6B24 @ =gUnknown_2022870
	ldr r1, _080D6B28 @ =gBattleBufferA
	ldr r0, _080D6B2C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x7F
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl sub_80D49E8
	pop {r0}
	bx r0
	.align 2, 0
_080D6B24: .4byte gUnknown_2022870
_080D6B28: .4byte gBattleBufferA
_080D6B2C: .4byte gActiveBattler
	thumb_func_end LinkPartnerHandlecmd38

	thumb_func_start LinkPartnerHandlecmd39
LinkPartnerHandlecmd39: @ 80D6B30
	push {lr}
	ldr r2, _080D6B44 @ =gUnknown_2022870
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl sub_80D49E8
	pop {r0}
	bx r0
	.align 2, 0
_080D6B44: .4byte gUnknown_2022870
	thumb_func_end LinkPartnerHandlecmd39

	thumb_func_start LinkPartnerHandlecmd40
LinkPartnerHandlecmd40: @ 80D6B48
	push {lr}
	ldr r3, _080D6B6C @ =gUnknown_2022870
	ldr r1, [r3]
	lsls r1, 24
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 7
	ldrb r2, [r3]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl sub_80D49E8
	pop {r0}
	bx r0
	.align 2, 0
_080D6B6C: .4byte gUnknown_2022870
	thumb_func_end LinkPartnerHandlecmd40

	thumb_func_start LinkPartnerHandleHitAnimation
LinkPartnerHandleHitAnimation: @ 80D6B70
	push {r4,lr}
	ldr r3, _080D6B98 @ =gSprites
	ldr r2, _080D6B9C @ =gBattlerSpriteIds
	ldr r4, _080D6BA0 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _080D6BA4
	bl sub_80D49E8
	b _080D6BCE
	.align 2, 0
_080D6B98: .4byte gSprites
_080D6B9C: .4byte gBattlerSpriteIds
_080D6BA0: .4byte gActiveBattler
_080D6BA4:
	ldr r1, _080D6BD4 @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl DoHitAnimHealthboxEffect
	ldr r1, _080D6BD8 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D6BDC @ =sub_80D4730
	str r1, [r0]
_080D6BCE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6BD4: .4byte gDoingBattleAnim
_080D6BD8: .4byte gBattlerControllerFuncs
_080D6BDC: .4byte sub_80D4730
	thumb_func_end LinkPartnerHandleHitAnimation

	thumb_func_start sub_80D6BE0
sub_80D6BE0: @ 80D6BE0
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D6BE0

	thumb_func_start LinkPartnerHandleEffectivenessSound
LinkPartnerHandleEffectivenessSound: @ 80D6BEC
	push {r4,lr}
	ldr r4, _080D6C28 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _080D6C00
	movs r3, 0xC0
_080D6C00:
	ldr r2, _080D6C2C @ =gBattleBufferA
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl sub_80D49E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6C28: .4byte gActiveBattler
_080D6C2C: .4byte gBattleBufferA
	thumb_func_end LinkPartnerHandleEffectivenessSound

	thumb_func_start LinkPartnerHandlecmd44
LinkPartnerHandlecmd44: @ 80D6C30
	push {lr}
	ldr r2, _080D6C58 @ =gBattleBufferA
	ldr r0, _080D6C5C @ =gActiveBattler
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl sub_80D49E8
	pop {r0}
	bx r0
	.align 2, 0
_080D6C58: .4byte gBattleBufferA
_080D6C5C: .4byte gActiveBattler
	thumb_func_end LinkPartnerHandlecmd44

	thumb_func_start LinkPartnerHandleFaintingCry
LinkPartnerHandleFaintingCry: @ 80D6C60
	push {lr}
	ldr r1, _080D6C94 @ =gBattlerPartyIndexes
	ldr r0, _080D6C98 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080D6C9C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	negs r1, r1
	movs r2, 0x5
	bl PlayCry3
	bl sub_80D49E8
	pop {r0}
	bx r0
	.align 2, 0
_080D6C94: .4byte gBattlerPartyIndexes
_080D6C98: .4byte gActiveBattler
_080D6C9C: .4byte gPlayerParty
	thumb_func_end LinkPartnerHandleFaintingCry

	thumb_func_start LinkPartnerHandleIntroSlide
LinkPartnerHandleIntroSlide: @ 80D6CA0
	push {lr}
	ldr r1, _080D6CC8 @ =gBattleBufferA
	ldr r0, _080D6CCC @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _080D6CD0 @ =gIntroSlideFlags
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl sub_80D49E8
	pop {r0}
	bx r0
	.align 2, 0
_080D6CC8: .4byte gBattleBufferA
_080D6CCC: .4byte gActiveBattler
_080D6CD0: .4byte gIntroSlideFlags
	thumb_func_end LinkPartnerHandleIntroSlide

	thumb_func_start sub_80D6CD4
sub_80D6CD4: @ 80D6CD4
	push {r4-r7,lr}
	ldr r5, _080D6DDC @ =gBattlerSpriteIds
	ldr r6, _080D6DE0 @ =gActiveBattler
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080D6DE4 @ =gSprites
	adds r0, r4
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080D6DE8 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080D6DEC @ =StartAnimLinearTranslation
	str r1, [r0]
	ldrb r2, [r6]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x38]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080D6DF0 @ =sub_80335F8
	bl StoreSpriteCallbackInData6
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080D6DF4 @ =0x0000d6f9
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	ldr r4, _080D6DF8 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	movs r5, 0xFF
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _080D6DC2
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0x1
	beq _080D6DC2
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1]
	ands r5, r0
	cmp r5, 0x3
	bne _080D6DFC
_080D6DC2:
	ldr r0, _080D6DE0 @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBankMultiplayerId
	ldr r2, _080D6DF8 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x13]
	adds r0, 0x2
	b _080D6E0C
	.align 2, 0
_080D6DDC: .4byte gBattlerSpriteIds
_080D6DE0: .4byte gActiveBattler
_080D6DE4: .4byte gSprites
_080D6DE8: .4byte 0x0000ffd8
_080D6DEC: .4byte StartAnimLinearTranslation
_080D6DF0: .4byte sub_80335F8
_080D6DF4: .4byte 0x0000d6f9
_080D6DF8: .4byte gLinkPlayers
_080D6DFC:
	ldrb r0, [r6]
	bl GetBankMultiplayerId
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x13]
_080D6E0C:
	ldr r1, _080D6EA4 @ =gUnknown_8239FD4
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	lsls r4, r7, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r2, _080D6EA8 @ =gSprites
	ldr r1, _080D6EAC @ =gBattlerSpriteIds
	ldr r5, _080D6EB0 @ =gActiveBattler
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _080D6EB4 @ =sub_80D6ED0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080D6EB8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r5]
	strh r0, [r1, 0x8]
	ldr r3, _080D6EBC @ =gBattleSpritesDataPtr
	ldr r0, [r3]
	ldrb r2, [r5]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D6E86
	ldr r0, _080D6EC0 @ =gBattlerStatusSummaryTaskId
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _080D6EC4 @ =Task_HidePartyStatusSummary
	str r1, [r0]
_080D6E86:
	ldr r0, [r3]
	ldr r2, [r0, 0x8]
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _080D6EC8 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D6ECC @ =nullsub_77
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6EA4: .4byte gUnknown_8239FD4
_080D6EA8: .4byte gSprites
_080D6EAC: .4byte gBattlerSpriteIds
_080D6EB0: .4byte gActiveBattler
_080D6EB4: .4byte sub_80D6ED0
_080D6EB8: .4byte gTasks
_080D6EBC: .4byte gBattleSpritesDataPtr
_080D6EC0: .4byte gBattlerStatusSummaryTaskId
_080D6EC4: .4byte Task_HidePartyStatusSummary
_080D6EC8: .4byte gBattlerControllerFuncs
_080D6ECC: .4byte nullsub_77
	thumb_func_end sub_80D6CD4

	thumb_func_start sub_80D6ED0
sub_80D6ED0: @ 80D6ED0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _080D6EF8 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x17
	bgt _080D6EFC
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _080D6FB8
	.align 2, 0
_080D6EF8: .4byte gTasks
_080D6EFC:
	ldr r7, _080D6F3C @ =gActiveBattler
	ldrb r0, [r7]
	mov r9, r0
	ldrh r0, [r1, 0x8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080D6F1C
	ldr r0, _080D6F40 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080D6F4C
_080D6F1C:
	ldr r0, _080D6F44 @ =gBattleBufferA
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _080D6F48 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_80D5F40
	b _080D6FA0
	.align 2, 0
_080D6F3C: .4byte gActiveBattler
_080D6F40: .4byte gBattleTypeFlags
_080D6F44: .4byte gBattleBufferA
_080D6F48: .4byte gBattlerPartyIndexes
_080D6F4C:
	ldr r4, _080D6FC4 @ =gBattleBufferA
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r5, _080D6FC8 @ =gBattlerPartyIndexes
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_80D5F40
	ldrb r0, [r7]
	movs r6, 0x2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080D6FCC @ =gPlayerParty
	adds r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r7]
	movs r1, 0
	bl sub_80D5F40
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_080D6FA0:
	ldr r1, _080D6FD0 @ =gBattlerControllerFuncs
	ldr r2, _080D6FD4 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D6FD8 @ =sub_80D443C
	str r1, [r0]
	mov r3, r9
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_080D6FB8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6FC4: .4byte gBattleBufferA
_080D6FC8: .4byte gBattlerPartyIndexes
_080D6FCC: .4byte gPlayerParty
_080D6FD0: .4byte gBattlerControllerFuncs
_080D6FD4: .4byte gActiveBattler
_080D6FD8: .4byte sub_80D443C
	thumb_func_end sub_80D6ED0

	thumb_func_start sub_80D6FDC
sub_80D6FDC: @ 80D6FDC
	push {r4-r6,lr}
	ldr r1, _080D7004 @ =gBattleBufferA
	ldr r0, _080D7008 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D700C
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D700C
	bl sub_80D49E8
	b _080D7080
	.align 2, 0
_080D7004: .4byte gBattleBufferA
_080D7008: .4byte gActiveBattler
_080D700C:
	ldr r6, _080D7088 @ =gBattleSpritesDataPtr
	ldr r0, [r6]
	ldr r5, _080D708C @ =gActiveBattler
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _080D7090 @ =gUnknown_2022BC8
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl CreatePartyStatusSummarySprites
	ldr r2, _080D7094 @ =gBattlerStatusSummaryTaskId
	ldrb r1, [r5]
	adds r1, r2
	movs r3, 0
	strb r0, [r1]
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x5]
	ldrb r2, [r5]
	lsls r0, r2, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D7074
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_080D7074:
	ldr r0, _080D7098 @ =gBattlerControllerFuncs
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080D709C @ =sub_80D70A0
	str r0, [r1]
_080D7080:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D7088: .4byte gBattleSpritesDataPtr
_080D708C: .4byte gActiveBattler
_080D7090: .4byte gUnknown_2022BC8
_080D7094: .4byte gBattlerStatusSummaryTaskId
_080D7098: .4byte gBattlerControllerFuncs
_080D709C: .4byte sub_80D70A0
	thumb_func_end sub_80D6FDC

	thumb_func_start sub_80D70A0
sub_80D70A0: @ 80D70A0
	push {r4,lr}
	ldr r4, _080D70E0 @ =gBattleSpritesDataPtr
	ldr r0, [r4]
	ldr r3, _080D70E4 @ =gActiveBattler
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _080D70D8
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x5]
	bl sub_80D49E8
_080D70D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D70E0: .4byte gBattleSpritesDataPtr
_080D70E4: .4byte gActiveBattler
	thumb_func_end sub_80D70A0

	thumb_func_start sub_80D70E8
sub_80D70E8: @ 80D70E8
	push {lr}
	ldr r0, _080D7124 @ =gBattleSpritesDataPtr
	ldr r1, [r0]
	ldr r0, _080D7128 @ =gActiveBattler
	ldrb r3, [r0]
	ldr r1, [r1, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D711A
	ldr r2, _080D712C @ =gTasks
	ldr r0, _080D7130 @ =gBattlerStatusSummaryTaskId
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080D7134 @ =Task_HidePartyStatusSummary
	str r1, [r0]
_080D711A:
	bl sub_80D49E8
	pop {r0}
	bx r0
	.align 2, 0
_080D7124: .4byte gBattleSpritesDataPtr
_080D7128: .4byte gActiveBattler
_080D712C: .4byte gTasks
_080D7130: .4byte gBattlerStatusSummaryTaskId
_080D7134: .4byte Task_HidePartyStatusSummary
	thumb_func_end sub_80D70E8

	thumb_func_start sub_80D7138
sub_80D7138: @ 80D7138
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D7138

	thumb_func_start LinkPartnerHandleSpriteInvisibility
LinkPartnerHandleSpriteInvisibility: @ 80D7144
	push {r4,lr}
	ldr r4, _080D7194 @ =gActiveBattler
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, 24
	cmp r0, 0
	beq _080D718A
	ldr r3, _080D7198 @ =gSprites
	ldr r0, _080D719C @ =gBattlerSpriteIds
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _080D71A0 @ =gBattleBufferA
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl CopyBattleSpriteInvisibility
_080D718A:
	bl sub_80D49E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7194: .4byte gActiveBattler
_080D7198: .4byte gSprites
_080D719C: .4byte gBattlerSpriteIds
_080D71A0: .4byte gBattleBufferA
	thumb_func_end LinkPartnerHandleSpriteInvisibility

	thumb_func_start LinkPartnerHandleBattleAnimation
LinkPartnerHandleBattleAnimation: @ 80D71A4
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _080D71E8 @ =gActiveBattler
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _080D71FC
	ldr r5, _080D71EC @ =gBattleBufferA
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, 24
	cmp r0, 0
	beq _080D71F0
	bl sub_80D49E8
	b _080D71FC
	.align 2, 0
_080D71E8: .4byte gActiveBattler
_080D71EC: .4byte gBattleBufferA
_080D71F0:
	ldr r0, _080D7204 @ =gBattlerControllerFuncs
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080D7208 @ =sub_80D4A90
	str r0, [r1]
_080D71FC:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D7204: .4byte gBattlerControllerFuncs
_080D7208: .4byte sub_80D4A90
	thumb_func_end LinkPartnerHandleBattleAnimation

	thumb_func_start sub_80D720C
sub_80D720C: @ 80D720C
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D720C

	thumb_func_start sub_80D7218
sub_80D7218: @ 80D7218
	push {lr}
	bl sub_80D49E8
	pop {r0}
	bx r0
	thumb_func_end sub_80D7218

	thumb_func_start LinkPartnerHandlecmd55
LinkPartnerHandlecmd55: @ 80D7224
	push {r4,lr}
	ldr r2, _080D725C @ =gBattleOutcome
	ldr r1, _080D7260 @ =gBattleBufferA
	ldr r4, _080D7264 @ =gActiveBattler
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl sub_80D49E8
	ldr r1, _080D7268 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080D726C @ =sub_802F6A8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D725C: .4byte gBattleOutcome
_080D7260: .4byte gBattleBufferA
_080D7264: .4byte gActiveBattler
_080D7268: .4byte gBattlerControllerFuncs
_080D726C: .4byte sub_802F6A8
	thumb_func_end LinkPartnerHandlecmd55

	thumb_func_start nullsub_78
nullsub_78: @ 80D7270
	bx lr
	thumb_func_end nullsub_78

	.align 2, 0 @ Don't pad with nop.
