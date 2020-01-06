	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_807F3A4
sub_807F3A4: @ 807F3A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	ldr r2, _0807F3DC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrb r7, [r4, 0xA]
	movs r0, 0xC
	ldrsh r6, [r4, r0]
	cmp r6, 0
	beq _0807F3E0
	cmp r6, 0x1
	beq _0807F430
	b _0807F448
	.align 2, 0
_0807F3DC: .4byte gTasks
_0807F3E0:
	adds r0, r7, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r5, _0807F424 @ =gStringVar4
	adds r0, r5, 0
	mov r1, r8
	bl StringExpandPlaceholders
	movs r0, 0x1
	mov r8, r0
	str r0, [sp]
	str r6, [sp, 0x4]
	ldr r0, _0807F428 @ =gUnknown_83C68EC
	str r0, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	str r5, [sp, 0x10]
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, r10
	mov r3, r9
	bl AddTextPrinterParameterized4
	ldr r2, _0807F42C @ =gTextFlags
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r0, r8
	strh r0, [r4, 0xC]
	b _0807F448
	.align 2, 0
_0807F424: .4byte gStringVar4
_0807F428: .4byte gUnknown_83C68EC
_0807F42C: .4byte gTextFlags
_0807F430:
	bl RunTextPrinters
	adds r0, r7, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807F448
	strh r0, [r4, 0xC]
	movs r0, 0x1
	b _0807F44A
_0807F448:
	movs r0, 0
_0807F44A:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807F3A4

	thumb_func_start sub_807F45C
sub_807F45C: @ 807F45C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0807F484 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x6
	bls _0807F478
	b _0807F5E4
_0807F478:
	lsls r0, 2
	ldr r1, _0807F488 @ =_0807F48C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807F484: .4byte gTasks
_0807F488: .4byte _0807F48C
	.align 2, 0
_0807F48C:
	.4byte _0807F4A8
	.4byte _0807F538
	.4byte _0807F588
	.4byte _0807F5B6
	.4byte _0807F540
	.4byte _0807F588
	.4byte _0807F5D0
_0807F4A8:
	ldr r0, _0807F518 @ =gUnknown_83C68E4
	bl AddWindow
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0807F51C @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r7, r0, r1
	strh r5, [r7, 0xA]
	movs r0, 0xF0
	bl Menu_LoadStdPalAt
	adds r0, r5, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	adds r0, r5, 0
	bl PutWindowTilemap
	adds r0, r5, 0
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0x1
	bl GetHealLocationPointer
	adds r3, r0, 0
	ldr r0, _0807F520 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldrh r0, [r2, 0x1C]
	ldrh r5, [r3]
	cmp r0, r5
	bne _0807F524
	movs r1, 0x1E
	ldrsb r1, [r2, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0807F524
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r5, 0x2
	ldrsh r0, [r3, r5]
	cmp r1, r0
	bne _0807F524
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	movs r2, 0x4
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _0807F524
	movs r0, 0x4
	strh r0, [r7, 0x8]
	b _0807F5E4
	.align 2, 0
_0807F518: .4byte gUnknown_83C68E4
_0807F51C: .4byte gTasks
_0807F520: .4byte gSaveBlock1Ptr
_0807F524:
	ldr r0, _0807F534 @ =gTasks
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x8]
	b _0807F5E4
	.align 2, 0
_0807F534: .4byte gTasks
_0807F538:
	ldr r1, _0807F53C @ =gUnknown_841B554
	b _0807F542
	.align 2, 0
_0807F53C: .4byte gUnknown_841B554
_0807F540:
	ldr r1, _0807F578 @ =gUnknown_841B5B6
_0807F542:
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl sub_807F3A4
	lsls r0, 24
	cmp r0, 0
	beq _0807F5E4
	ldr r0, _0807F57C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807F580 @ =gObjectEvents
	adds r0, r1
	movs r1, 0x2
	bl ObjectEventTurn
	ldr r1, _0807F584 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _0807F5E4
	.align 2, 0
_0807F578: .4byte gUnknown_841B5B6
_0807F57C: .4byte gPlayerAvatar
_0807F580: .4byte gObjectEvents
_0807F584: .4byte gTasks
_0807F588:
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r2
	ldrb r5, [r4, 0xA]
	adds r0, r5, 0
	bl ClearWindowTilemap
	adds r0, r5, 0
	movs r1, 0x1
	bl CopyWindowToVram
	adds r0, r5, 0
	bl RemoveWindow
	bl palette_bg_faded_fill_black
	bl sub_807DC00
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807F5E4
_0807F5B6:
	bl sub_807E418
	cmp r0, 0x1
	bne _0807F5E4
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, _0807F5CC @ =EventScript_AfterWhiteOutHeal
	bl ScriptContext1_SetupScript
	b _0807F5E4
	.align 2, 0
_0807F5CC: .4byte EventScript_AfterWhiteOutHeal
_0807F5D0:
	bl sub_807E418
	cmp r0, 0x1
	bne _0807F5E4
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, _0807F5EC @ =EventScript_MomHeal
	bl ScriptContext1_SetupScript
_0807F5E4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5EC: .4byte EventScript_MomHeal
	thumb_func_end sub_807F45C

	thumb_func_start sub_807F5F0
sub_807F5F0: @ 807F5F0
	push {lr}
	bl ScriptContext2_Enable
	bl palette_bg_faded_fill_black
	ldr r0, _0807F618 @ =sub_807F45C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807F61C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0807F618: .4byte sub_807F45C
_0807F61C: .4byte gTasks
	thumb_func_end sub_807F5F0

	.align 2, 0 @ Don't pad with nop.
