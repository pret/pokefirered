	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start Task_StopSurfingInit
Task_StopSurfingInit: @ 805D1D4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0805D230 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D234 @ =gObjectEvents
	adds r5, r0, r1
	adds r0, r5, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _0805D200
	adds r0, r5, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805D228
_0805D200:
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_80DC44C
	ldr r0, _0805D238 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl sub_80641EC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_805C06C
	ldr r0, _0805D23C @ =sub_805D240
	str r0, [r4]
_0805D228:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D230: .4byte gPlayerAvatar
_0805D234: .4byte gObjectEvents
_0805D238: .4byte gTasks
_0805D23C: .4byte sub_805D240
	thumb_func_end Task_StopSurfingInit

	thumb_func_start sub_805D240
sub_805D240: @ 805D240
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0805D2B4 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D2B8 @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805D2AE
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805C06C
	movs r0, 0
	strb r0, [r6, 0x6]
	bl ScriptContext2_Disable
	bl UnfreezeObjectEvents
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D2BC @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0
	bl DestroyTask
	bl SetHelpContextForMap
_0805D2AE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D2B4: .4byte gPlayerAvatar
_0805D2B8: .4byte gObjectEvents
_0805D2BC: .4byte gSprites
	thumb_func_end sub_805D240

	thumb_func_start sub_805D2C0
sub_805D2C0: @ 805D2C0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0805D2FC @ =sub_805D304
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805D300 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x26]
	bl _call_via_r5
	movs r0, 0x2
	bl sub_8150474
	cmp r0, 0x1
	bne _0805D2F4
	bl sub_8112C9C
_0805D2F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D2FC: .4byte sub_805D304
_0805D300: .4byte gTasks
	thumb_func_end sub_805D2C0

	thumb_func_start sub_805D304
sub_805D304: @ 805D304
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805D334 @ =gUnknown_835B8CC
	ldr r2, _0805D338 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805D316:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0805D316
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D334: .4byte gUnknown_835B8CC
_0805D338: .4byte gTasks
	thumb_func_end sub_805D304

	thumb_func_start sub_805D33C
sub_805D33C: @ 805D33C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _0805D358 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D358: .4byte gPlayerAvatar
	thumb_func_end sub_805D33C

	thumb_func_start fish1
fish1: @ 805D35C
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	ldr r1, _0805D3E4 @ =gUnknown_835B90C
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _0805D3E8 @ =gUnknown_835B912
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	movs r0, 0
	strh r0, [r5, 0x20]
	bl Random
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	lsls r1, 1
	mov r2, sp
	adds r6, r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r6]
	adds r1, r0
	strh r1, [r5, 0x22]
	ldr r3, _0805D3EC @ =gObjectEvents
	ldr r2, _0805D3F0 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	strh r0, [r5, 0x24]
	ldrb r0, [r2, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r3
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfActive
	ldrb r0, [r4, 0x1]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805CC2C
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805D3E4: .4byte gUnknown_835B90C
_0805D3E8: .4byte gUnknown_835B912
_0805D3EC: .4byte gObjectEvents
_0805D3F0: .4byte gPlayerAvatar
	thumb_func_end fish1

	thumb_func_start fish2
fish2: @ 805D3F4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0805D428 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D42C @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _0805D41E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805D41E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D428: .4byte gPlayerAvatar
_0805D42C: .4byte gSprites
	thumb_func_end fish2

	thumb_func_start sub_805D430
sub_805D430: @ 805D430
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	movs r1, 0x1
	bl sub_80F7768
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0805D468
	adds r0, r1, 0x4
	strh r0, [r4, 0xE]
_0805D468:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	ble _0805D474
	movs r0, 0xA
	strh r0, [r4, 0xE]
_0805D474:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D430

	thumb_func_start sub_805D47C
sub_805D47C: @ 805D47C
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r0, _0805D4CC @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D4D0 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0805D4F8
	strh r5, [r4, 0xA]
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805D4D4
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	ldrh r2, [r4, 0x20]
	movs r3, 0x20
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0805D4C6
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_0805D4C6:
	adds r0, r2, 0x1
	strh r0, [r4, 0x20]
	b _0805D4F8
	.align 2, 0
_0805D4CC: .4byte gPlayerAvatar
_0805D4D0: .4byte gSprites
_0805D4D4:
	ldr r2, _0805D504 @ =gUnknown_835B918
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 26
	lsrs r3, 24
	movs r0, 0x1
	str r0, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	bl AddTextPrinterParameterized
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805D4F8:
	movs r0, 0
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D504: .4byte gUnknown_835B918
	thumb_func_end sub_805D47C

	thumb_func_start sub_805D508
sub_805D508: @ 805D508
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _0805D540 @ =gPlayerAvatar
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0805D544 @ =gSprites
	adds r0, r5
	bl sub_805D9C4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl DoesCurrentMapHaveFishingMons
	lsls r0, 24
	cmp r0, 0
	beq _0805D53A
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805D548
_0805D53A:
	movs r0, 0xB
	strh r0, [r4, 0x8]
	b _0805D56A
	.align 2, 0
_0805D540: .4byte gPlayerAvatar
_0805D544: .4byte gSprites
_0805D548:
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063510
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805D56A:
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805D508

	thumb_func_start sub_805D574
sub_805D574: @ 805D574
	ldrh r1, [r0, 0x8]
	adds r1, 0x3
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_805D574

	thumb_func_start sub_805D580
sub_805D580: @ 805D580
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _0805D5C0 @ =gUnknown_835B91A
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r0, _0805D5C4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D5C8 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _0805D5CC
	movs r0, 0xC
	b _0805D5DC
	.align 2, 0
_0805D5C0: .4byte gUnknown_835B91A
_0805D5C4: .4byte gPlayerAvatar
_0805D5C8: .4byte gSprites
_0805D5CC:
	ldr r0, _0805D5E8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805D5DE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
_0805D5DC:
	strh r0, [r4, 0x8]
_0805D5DE:
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D5E8: .4byte gMain
	thumb_func_end sub_805D580

	thumb_func_start sub_805D5EC
sub_805D5EC: @ 805D5EC
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _0805D660 @ =gUnknown_835B920
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	ldr r0, _0805D664 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D668 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805D650
	cmp r1, 0x1
	bgt _0805D654
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	movs r3, 0x20
	ldrsh r2, [r4, r3]
	lsls r2, 1
	movs r3, 0x26
	ldrsh r1, [r4, r3]
	lsls r1, 2
	adds r2, r1
	mov r3, sp
	adds r1, r3, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805D654
_0805D650:
	movs r0, 0x3
	strh r0, [r4, 0x8]
_0805D654:
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D660: .4byte gUnknown_835B920
_0805D664: .4byte gPlayerAvatar
_0805D668: .4byte gSprites
	thumb_func_end sub_805D5EC

	thumb_func_start sub_805D66C
sub_805D66C: @ 805D66C
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r0, _0805D6BC @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D6C0 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _0805D6C4 @ =gUnknown_841D14E
	movs r5, 0
	str r5, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	strh r5, [r4, 0xA]
	movs r0, 0
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D6BC: .4byte gPlayerAvatar
_0805D6C0: .4byte gSprites
_0805D6C4: .4byte gUnknown_841D14E
	thumb_func_end sub_805D66C

	thumb_func_start sub_805D6C8
sub_805D6C8: @ 805D6C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805D6EA
	ldr r0, _0805D774 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D778 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
_0805D6EA:
	bl RunTextPrinters
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805D788
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	bne _0805D780
	ldr r7, _0805D774 @ =gPlayerAvatar
	ldrb r0, [r7, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805D77C @ =gObjectEvents
	mov r8, r0
	add r4, r8
	ldrh r1, [r5, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl ObjectEventTurn
	ldrb r1, [r7]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805D748
	ldrb r0, [r7, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_80DC4A4
_0805D748:
	ldr r2, _0805D778 @ =gSprites
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x24]
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x26]
	movs r0, 0
	movs r1, 0x1
	bl ClearDialogWindowAndFrame
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _0805D7AA
	.align 2, 0
_0805D774: .4byte gPlayerAvatar
_0805D778: .4byte gSprites
_0805D77C: .4byte gObjectEvents
_0805D780:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0805D7AA
_0805D788:
	ldr r1, _0805D7B8 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	ldrh r0, [r5, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl FishingWildEncounter
	ldr r0, _0805D7BC @ =sub_805D304
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805D7AA:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D7B8: .4byte gPlayerAvatar
_0805D7BC: .4byte sub_805D304
	thumb_func_end sub_805D6C8

	thumb_func_start sub_805D7C0
sub_805D7C0: @ 805D7C0
	push {r4-r6,lr}
	sub sp, 0x10
	adds r6, r0, 0
	ldr r4, _0805D82C @ =gPlayerAvatar
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0805D830 @ =gSprites
	adds r0, r5
	bl sub_805D9C4
	ldrb r0, [r4, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFishingBiteDirectionAnimNum
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _0805D834 @ =gUnknown_841D169
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized2
	movs r0, 0xD
	strh r0, [r6, 0x8]
	movs r0, 0x1
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805D82C: .4byte gPlayerAvatar
_0805D830: .4byte gSprites
_0805D834: .4byte gUnknown_841D169
	thumb_func_end sub_805D7C0

	thumb_func_start sub_805D838
sub_805D838: @ 805D838
	push {r4-r6,lr}
	sub sp, 0x10
	adds r6, r0, 0
	ldr r4, _0805D8A0 @ =gPlayerAvatar
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0805D8A4 @ =gSprites
	adds r0, r5
	bl sub_805D9C4
	ldrb r0, [r4, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFishingBiteDirectionAnimNum
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r2, _0805D8A8 @ =gUnknown_841D17E
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized2
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x1
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805D8A0: .4byte gPlayerAvatar
_0805D8A4: .4byte gSprites
_0805D8A8: .4byte gUnknown_841D17E
	thumb_func_end sub_805D838

	thumb_func_start sub_805D8AC
sub_805D8AC: @ 805D8AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0805D8D0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D8D4 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D8D0: .4byte gPlayerAvatar
_0805D8D4: .4byte gSprites
	thumb_func_end sub_805D8AC

	thumb_func_start sub_805D8D8
sub_805D8D8: @ 805D8D8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r5, _0805D974 @ =gPlayerAvatar
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r7, _0805D978 @ =gSprites
	adds r0, r7
	bl sub_805D9C4
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _0805D968
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805D97C @ =gObjectEvents
	mov r8, r0
	add r4, r8
	ldrh r1, [r6, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl ObjectEventTurn
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805D948
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_80DC4A4
_0805D948:
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r2, 0
	strh r2, [r0, 0x24]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x26]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0805D968:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D974: .4byte gPlayerAvatar
_0805D978: .4byte gSprites
_0805D97C: .4byte gObjectEvents
	thumb_func_end sub_805D8D8

	thumb_func_start sub_805D980
sub_805D980: @ 805D980
	push {lr}
	bl RunTextPrinters
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0805D9B6
	ldr r0, _0805D9BC @ =gPlayerAvatar
	strb r1, [r0, 0x6]
	bl ScriptContext2_Disable
	bl UnfreezeObjectEvents
	movs r0, 0
	movs r1, 0x1
	bl ClearDialogWindowAndFrame
	ldr r0, _0805D9C0 @ =sub_805D304
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805D9B6:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0805D9BC: .4byte gPlayerAvatar
_0805D9C0: .4byte sub_805D304
	thumb_func_end sub_805D980

	thumb_func_start sub_805D9C4
sub_805D9C4: @ 805D9C4
	push {r4-r7,lr}
	adds r4, r0, 0
	bl AnimateSprite
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r5, [r0]
	movs r0, 0x2A
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r5, 2
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r7, 0x1
	negs r7, r7
	cmp r0, r7
	beq _0805DA28
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r1, r12
	ldrb r0, [r1]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0805DA2E
_0805DA28:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0805DA2E:
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrb r5, [r0]
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0805DA60
	movs r0, 0x8
	strh r0, [r4, 0x24]
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805DA60
	ldr r0, _0805DAA4 @ =0x0000fff8
	strh r0, [r4, 0x24]
_0805DA60:
	cmp r5, 0x5
	bne _0805DA68
	ldr r0, _0805DAA4 @ =0x0000fff8
	strh r0, [r4, 0x26]
_0805DA68:
	adds r0, r5, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0805DA78
	movs r0, 0x8
	strh r0, [r4, 0x26]
_0805DA78:
	ldr r3, _0805DAA8 @ =gPlayerAvatar
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805DA9C
	ldr r2, _0805DAAC @ =gObjectEvents
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1A]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0x1
	bl sub_80DC4A4
_0805DA9C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DAA4: .4byte 0x0000fff8
_0805DAA8: .4byte gPlayerAvatar
_0805DAAC: .4byte gObjectEvents
	thumb_func_end sub_805D9C4

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
