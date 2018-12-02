	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_814240C
sub_814240C: @ 814240C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	movs r2, 0xF
	bl sub_8150048
	pop {r0}
	bx r0
	thumb_func_end sub_814240C

	thumb_func_start sub_8142420
sub_8142420: @ 8142420
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r8, r0
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x3
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r4, 0x1
	movs r1, 0x11
	mov r10, r1
_0814244E:
	movs r7, 0
	mov r0, r8
	adds r0, 0x2
	movs r1, 0x1
	add r1, r8
	mov r9, r1
	lsls r5, r0, 24
	movs r6, 0
_0814245E:
	mov r1, r8
	ands r1, r4
	adds r0, r7, 0
	ands r0, r4
	cmp r1, r0
	beq _08142480
	lsrs r2, r6, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x1
	lsrs r3, r5, 24
	bl FillBgTilemapBufferRect
	b _08142494
_08142480:
	lsrs r2, r6, 24
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x2
	lsrs r3, r5, 24
	bl FillBgTilemapBufferRect
_08142494:
	movs r0, 0x80
	lsls r0, 17
	adds r6, r0
	adds r7, 0x1
	cmp r7, 0x1F
	ble _0814245E
	mov r8, r9
	mov r1, r8
	cmp r1, 0x11
	ble _0814244E
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8142420

	thumb_func_start sub_81424B8
sub_81424B8: @ 81424B8
	push {lr}
	sub sp, 0xC
	cmp r0, 0
	beq _081424C6
	cmp r0, 0x1
	beq _081424DE
	b _081424F6
_081424C6:
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	b _081424F6
_081424DE:
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x1E
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect
_081424F6:
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_81424B8

	thumb_func_start sub_8142504
sub_8142504: @ 8142504
	push {r4,lr}
	sub sp, 0x14
	adds r1, r0, 0
	ldr r4, _08142558 @ =gStringVar4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0x1
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r1, 0
	str r1, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	ldr r0, _0814255C @ =gUnknown_8466EF0
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl AddTextPrinterParametrized2
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0xF
	bl sub_8150048
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142558: .4byte gStringVar4
_0814255C: .4byte gUnknown_8466EF0
	thumb_func_end sub_8142504

	thumb_func_start sub_8142560
sub_8142560: @ 8142560
	push {lr}
	movs r0, 0x1
	bl rbox_fill_rectangle
	movs r0, 0x1
	bl ClearWindowTilemap
	movs r0, 0x1
	movs r1, 0x1
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_8142560

	thumb_func_start mevent_0814257C
mevent_0814257C: @ 814257C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r0, r1, 0
	ldrb r2, [r4]
	cmp r2, 0x1
	beq _081425A4
	cmp r2, 0x1
	bgt _08142594
	cmp r2, 0
	beq _0814259E
	b _08142604
_08142594:
	cmp r2, 0x2
	beq _081425D8
	cmp r2, 0xFF
	beq _08142600
	b _08142604
_0814259E:
	bl sub_8142504
	b _081425C8
_081425A4:
	movs r0, 0
	str r0, [sp]
	ldr r0, _081425D0 @ =gUnknown_203F3B0
	str r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0xD0
	movs r2, 0x14
	movs r3, 0x1
	bl DrawDownArrow
	ldr r0, _081425D4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08142604
_081425C8:
	ldrb r0, [r4]
	adds r0, 0x1
	b _08142602
	.align 2, 0
_081425D0: .4byte gUnknown_203F3B0
_081425D4: .4byte gMain
_081425D8:
	movs r0, 0x1
	str r0, [sp]
	ldr r0, _081425FC @ =gUnknown_203F3B0
	str r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0xD0
	movs r2, 0x14
	movs r3, 0x1
	bl DrawDownArrow
	movs r0, 0
	strb r0, [r4]
	bl sub_8142560
	movs r0, 0x1
	b _08142606
	.align 2, 0
_081425FC: .4byte gUnknown_203F3B0
_08142600:
	movs r0, 0x2
_08142602:
	strb r0, [r4]
_08142604:
	movs r0, 0
_08142606:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end mevent_0814257C

	thumb_func_start sub_8142610
sub_8142610: @ 8142610
	push {lr}
	sub sp, 0xC
	movs r0, 0
	str r0, [sp]
	ldr r0, _08142634 @ =gUnknown_203F3B0
	str r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0xD0
	movs r2, 0x14
	movs r3, 0x1
	bl DrawDownArrow
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08142634: .4byte gUnknown_203F3B0
	thumb_func_end sub_8142610

	thumb_func_start sub_8142638
sub_8142638: @ 8142638
	push {lr}
	sub sp, 0xC
	movs r0, 0x1
	str r0, [sp]
	ldr r0, _0814265C @ =gUnknown_203F3B0
	str r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0xD0
	movs r2, 0x14
	movs r3, 0x1
	bl DrawDownArrow
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0814265C: .4byte gUnknown_203F3B0
	thumb_func_end sub_8142638

	thumb_func_start sub_8142660
sub_8142660: @ 8142660
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08142670
	cmp r0, 0x1
	beq _0814268C
	b _08142698
_08142670:
	bl sub_8142610
	ldr r0, _08142688 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08142698
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08142698
	.align 2, 0
_08142688: .4byte gMain
_0814268C:
	bl sub_8142638
	movs r0, 0
	strb r0, [r4]
	movs r0, 0x1
	b _0814269A
_08142698:
	movs r0, 0
_0814269A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8142660

	thumb_func_start sub_81426A0
sub_81426A0: @ 81426A0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	bne _081426B0
	adds r0, r1, 0
	bl sub_8142504
_081426B0:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x78
	bhi _081426C2
	movs r0, 0
	b _081426CC
_081426C2:
	movs r0, 0
	strb r0, [r4]
	bl sub_8142560
	movs r0, 0x1
_081426CC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81426A0

	thumb_func_start sub_81426D4
sub_81426D4: @ 81426D4
	push {r4-r7,lr}
	sub sp, 0x24
	lsls r2, 24
	add r1, sp, 0x4
	ldr r0, _081426F8 @ =gUnknown_8466E00
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r0, _081426FC @ =gUnknown_8466DA8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x1C]
	str r1, [sp, 0x20]
	cmp r2, 0
	bne _08142704
	ldr r0, _08142700 @ =gUnknown_8466DD0
	b _08142706
	.align 2, 0
_081426F8: .4byte gUnknown_8466E00
_081426FC: .4byte gUnknown_8466DA8
_08142700: .4byte gUnknown_8466DD0
_08142704:
	ldr r0, _08142794 @ =gUnknown_8466DE8
_08142706:
	str r0, [sp, 0x4]
	movs r6, 0
	movs r4, 0
	add r0, sp, 0x4
	add r7, sp, 0x1C
	ldrh r0, [r0, 0xC]
	cmp r6, r0
	bcs _0814273A
	add r5, sp, 0x4
_08142718:
	ldr r1, [sp, 0x4]
	lsls r0, r4, 3
	adds r0, r1
	ldr r1, [r0]
	ldrb r2, [r5, 0x16]
	lsls r2, 29
	lsrs r2, 29
	movs r0, 0x2
	bl GetStringWidth
	cmp r0, r6
	bls _08142732
	adds r6, r0, 0
_08142732:
	adds r4, 0x1
	ldrh r0, [r5, 0xC]
	cmp r4, r0
	bcc _08142718
_0814273A:
	adds r2, r6, 0
	adds r2, 0x9
	lsrs r2, 3
	adds r2, 0x2
	movs r0, 0x2
	negs r0, r0
	ands r2, r0
	lsls r3, r2, 24
	ldr r0, _08142798 @ =0x00ffffff
	ldr r1, [sp, 0x1C]
	ands r1, r0
	orrs r1, r3
	movs r0, 0x1E
	subs r0, r2
	lsls r0, 23
	lsrs r0, 16
	ldr r2, _0814279C @ =0xffff00ff
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0x1C]
	movs r0, 0xE0
	str r0, [sp]
	adds r0, r7, 0
	add r1, sp, 0x4
	movs r2, 0x1
	movs r3, 0xA
	bl DoMysteryGiftListMenu
	adds r4, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _0814278A
	movs r0, 0x2
	bl ClearWindowTilemap
	movs r0, 0x2
	movs r1, 0x1
	bl CopyWindowToVram
_0814278A:
	adds r0, r4, 0
	add sp, 0x24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08142794: .4byte gUnknown_8466DE8
_08142798: .4byte 0x00ffffff
_0814279C: .4byte 0xffff00ff
	thumb_func_end sub_81426D4

	thumb_func_start sub_81427A0
sub_81427A0: @ 81427A0
	push {r4-r6,lr}
	sub sp, 0x1C
	adds r5, r0, 0
	adds r4, r1, 0
	adds r1, r3, 0
	lsls r2, 24
	lsrs r6, r2, 24
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _08142834
	cmp r0, 0x1
	bgt _081427BE
	cmp r0, 0
	beq _081427CA
	b _081428E6
_081427BE:
	cmp r0, 0x2
	beq _0814288C
	cmp r0, 0xFF
	bne _081427C8
	b _081428C2
_081427C8:
	b _081428E6
_081427CA:
	ldr r0, _081427D8 @ =gStringVar4
	bl StringExpandPlaceholders
	cmp r6, 0
	bne _081427E0
	ldr r0, _081427DC @ =gUnknown_8466D90
	b _081427E2
	.align 2, 0
_081427D8: .4byte gStringVar4
_081427DC: .4byte gUnknown_8466D90
_081427E0:
	ldr r0, _08142828 @ =gUnknown_8466D98
_081427E2:
	bl AddWindow
	strh r0, [r4]
	ldrb r0, [r4]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	movs r2, 0
	str r2, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	ldr r1, _0814282C @ =gUnknown_8466EF0
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r1, _08142830 @ =gStringVar4
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0x2
	bl AddTextPrinterParametrized2
	ldrb r0, [r4]
	movs r1, 0x1
	movs r2, 0xF
	bl sub_8150048
	ldrb r0, [r4]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl PutWindowTilemap
	b _0814287E
	.align 2, 0
_08142828: .4byte gUnknown_8466D98
_0814282C: .4byte gUnknown_8466EF0
_08142830: .4byte gStringVar4
_08142834:
	ldr r0, _08142850 @ =gUnknown_8466DB0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x14]
	str r1, [sp, 0x18]
	cmp r6, 0
	bne _08142858
	ldr r0, _08142854 @ =0xff00ffff
	ldr r1, [sp, 0x14]
	ands r1, r0
	movs r0, 0x90
	lsls r0, 12
	b _08142862
	.align 2, 0
_08142850: .4byte gUnknown_8466DB0
_08142854: .4byte 0xff00ffff
_08142858:
	ldr r0, _08142888 @ =0xff00ffff
	ldr r1, [sp, 0x14]
	ands r1, r0
	movs r0, 0xF0
	lsls r0, 12
_08142862:
	orrs r1, r0
	str r1, [sp, 0x14]
	movs r0, 0xA
	str r0, [sp]
	movs r0, 0xE
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	add r0, sp, 0x14
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810FF60
_0814287E:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _081428E6
	.align 2, 0
_08142888: .4byte 0xff00ffff
_0814288C:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r6, r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x2
	bhi _081428E6
	movs r0, 0
	strb r0, [r5]
	ldrb r0, [r4]
	bl rbox_fill_rectangle
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	adds r0, r6, 0
	b _081428EA
_081428C2:
	movs r0, 0
	strb r0, [r5]
	ldrb r0, [r4]
	bl rbox_fill_rectangle
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, 0x1
	negs r0, r0
	b _081428EA
_081428E6:
	movs r0, 0x2
	negs r0, r0
_081428EA:
	add sp, 0x1C
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81427A0

	thumb_func_start sub_81428F4
sub_81428F4: @ 81428F4
	push {r4-r6,lr}
	sub sp, 0x14
	adds r6, r0, 0
	adds r5, r1, 0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08142994
	cmp r0, 0x1
	bgt _0814290C
	cmp r0, 0
	beq _08142914
	b _08142A38
_0814290C:
	cmp r0, 0xFF
	bne _08142912
	b _08142A14
_08142912:
	b _08142A38
_08142914:
	cmp r2, 0
	bne _0814292C
	ldr r0, _08142924 @ =gStringVar4
	ldr r1, _08142928 @ =gUnknown_841EA86
	bl StringExpandPlaceholders
	b _08142934
	.align 2, 0
_08142924: .4byte gStringVar4
_08142928: .4byte gUnknown_841EA86
_0814292C:
	ldr r0, _08142984 @ =gStringVar4
	ldr r1, _08142988 @ =gUnknown_841EAB7
	bl StringExpandPlaceholders
_08142934:
	ldr r0, _0814298C @ =gUnknown_8466DA0
	bl AddWindow
	strh r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5]
	movs r2, 0
	str r2, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	ldr r1, _08142990 @ =gUnknown_8466EF0
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r1, _08142984 @ =gStringVar4
	str r1, [sp, 0x10]
	movs r1, 0x2
	movs r3, 0x2
	bl AddTextPrinterParametrized2
	ldrb r0, [r5]
	movs r1, 0x1
	movs r2, 0xF
	bl sub_8150048
	ldrb r0, [r5]
	movs r1, 0x2
	bl CopyWindowToVram
	ldrb r0, [r5]
	bl PutWindowTilemap
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _08142A38
	.align 2, 0
_08142984: .4byte gStringVar4
_08142988: .4byte gUnknown_841EAB7
_0814298C: .4byte gUnknown_8466DA0
_08142990: .4byte gUnknown_8466EF0
_08142994:
	cmp r3, 0
	beq _081429BC
	cmp r2, 0
	bne _081429AC
	ldr r0, _081429A4 @ =gUnknown_8466DC0
	ldr r1, _081429A8 @ =gUnknown_8466E90
	b _081429D4
	.align 2, 0
_081429A4: .4byte gUnknown_8466DC0
_081429A8: .4byte gUnknown_8466E90
_081429AC:
	ldr r0, _081429B4 @ =gUnknown_8466DC8
	ldr r1, _081429B8 @ =gUnknown_8466EC0
	b _081429D4
	.align 2, 0
_081429B4: .4byte gUnknown_8466DC8
_081429B8: .4byte gUnknown_8466EC0
_081429BC:
	cmp r2, 0
	bne _081429D0
	ldr r0, _081429C8 @ =gUnknown_8466DB8
	ldr r1, _081429CC @ =gUnknown_8466E78
	b _081429D4
	.align 2, 0
_081429C8: .4byte gUnknown_8466DB8
_081429CC: .4byte gUnknown_8466E78
_081429D0:
	ldr r0, _08142A0C @ =gUnknown_8466DC0
	ldr r1, _08142A10 @ =gUnknown_8466EA8
_081429D4:
	movs r2, 0xE0
	str r2, [sp]
	movs r2, 0x1
	movs r3, 0xA
	bl DoMysteryGiftListMenu
	adds r4, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08142A38
	movs r0, 0
	strb r0, [r6]
	ldrb r0, [r5]
	bl rbox_fill_rectangle
	ldrb r0, [r5]
	bl ClearWindowTilemap
	ldrb r0, [r5]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r5]
	bl RemoveWindow
	adds r0, r4, 0
	b _08142A3C
	.align 2, 0
_08142A0C: .4byte gUnknown_8466DC0
_08142A10: .4byte gUnknown_8466EA8
_08142A14:
	movs r0, 0
	strb r0, [r6]
	ldrb r0, [r5]
	bl rbox_fill_rectangle
	ldrb r0, [r5]
	bl ClearWindowTilemap
	ldrb r0, [r5]
	movs r1, 0x1
	bl CopyWindowToVram
	ldrb r0, [r5]
	bl RemoveWindow
	movs r0, 0x2
	negs r0, r0
	b _08142A3C
_08142A38:
	movs r0, 0x1
	negs r0, r0
_08142A3C:
	add sp, 0x14
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81428F4

	thumb_func_start sub_8142A44
sub_8142A44: @ 8142A44
	push {lr}
	cmp r0, 0
	beq _08142A50
	bl sub_8143E1C
	b _08142A54
_08142A50:
	bl sub_8143FC8
_08142A54:
	pop {r1}
	bx r1
	thumb_func_end sub_8142A44

	thumb_func_start sub_8142A58
sub_8142A58: @ 8142A58
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _08142A68
	cmp r0, 0x1
	beq _08142A90
	b _08142AAC
_08142A68:
	cmp r1, 0
	bne _08142A80
	bl sav1_get_mevent_buffer_1
	adds r4, r0, 0
	bl sav1_get_mevent_buffer_2
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_8145654
	b _08142A88
_08142A80:
	bl sub_8143D58
	bl sub_8146288
_08142A88:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08142AAC
_08142A90:
	cmp r1, 0
	bne _08142A9E
	bl sub_814571C
_08142A98:
	cmp r0, 0
	bne _08142AA4
	b _08142AAC
_08142A9E:
	bl sub_8146318
	b _08142A98
_08142AA4:
	movs r0, 0
	strb r0, [r5]
	movs r0, 0x1
	b _08142AAE
_08142AAC:
	movs r0, 0
_08142AAE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8142A58

	thumb_func_start sub_8142AB4
sub_8142AB4: @ 8142AB4
	push {lr}
	cmp r0, 0
	bne _08142AC0
	bl sub_8143F38
	b _08142AC4
_08142AC0:
	bl sub_8143DBC
_08142AC4:
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8142AB4

	thumb_func_start sub_8142ACC
sub_8142ACC: @ 8142ACC
	push {lr}
	cmp r0, 0
	bne _08142AE2
	adds r0, r1, 0
	bl sub_814593C
	cmp r0, 0
	beq _08142AEC
	bl sub_81456F0
	b _08142AF4
_08142AE2:
	adds r0, r1, 0
	bl sub_8146604
	cmp r0, 0
	bne _08142AF0
_08142AEC:
	movs r0, 0
	b _08142AF6
_08142AF0:
	bl sub_81462EC
_08142AF4:
	movs r0, 0x1
_08142AF6:
	pop {r1}
	bx r1
	thumb_func_end sub_8142ACC

	thumb_func_start sub_8142AFC
sub_8142AFC: @ 8142AFC
	push {lr}
	cmp r2, 0
	beq _08142B0C
	ldr r3, _08142B08 @ =gUnknown_841ECD3
	b _08142B0E
	.align 2, 0
_08142B08: .4byte gUnknown_841ECD3
_08142B0C:
	ldr r3, _08142B1C @ =gUnknown_841EC99
_08142B0E:
	movs r2, 0x1
	bl sub_81427A0
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08142B1C: .4byte gUnknown_841EC99
	thumb_func_end sub_8142AFC

	thumb_func_start mevent_message_was_thrown_away
mevent_message_was_thrown_away: @ 8142B20
	push {lr}
	cmp r1, 0
	beq _08142B30
	ldr r1, _08142B2C @ =gUnknown_841ED9C
	b _08142B32
	.align 2, 0
_08142B2C: .4byte gUnknown_841ED9C
_08142B30:
	ldr r1, _08142B3C @ =gUnknown_841ED7B
_08142B32:
	bl mevent_0814257C
	pop {r1}
	bx r1
	.align 2, 0
_08142B3C: .4byte gUnknown_841ED7B
	thumb_func_end mevent_message_was_thrown_away

	thumb_func_start mevent_save_game
mevent_save_game: @ 8142B40
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x4
	bhi _08142BB0
	lsls r0, 2
	ldr r1, _08142B54 @ =_08142B58
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08142B54: .4byte _08142B58
	.align 2, 0
_08142B58:
	.4byte _08142B6C
	.4byte _08142B78
	.4byte _08142B80
	.4byte _08142B8C
	.4byte _08142BA4
_08142B6C:
	ldr r0, _08142B74 @ =gUnknown_841ED2F
	bl sub_8142504
	b _08142B98
	.align 2, 0
_08142B74: .4byte gUnknown_841ED2F
_08142B78:
	movs r0, 0
	bl TrySavingData
	b _08142B98
_08142B80:
	ldr r0, _08142B88 @ =gUnknown_841ED50
	bl sub_8142504
	b _08142B98
	.align 2, 0
_08142B88: .4byte gUnknown_841ED50
_08142B8C:
	ldr r0, _08142BA0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08142BB0
_08142B98:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08142BB0
	.align 2, 0
_08142BA0: .4byte gMain
_08142BA4:
	movs r0, 0
	strb r0, [r4]
	bl sub_8142560
	movs r0, 0x1
	b _08142BB2
_08142BB0:
	movs r0, 0
_08142BB2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end mevent_save_game

	thumb_func_start mevent_message
mevent_message: @ 8142BB8
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r2, 0
	str r2, [r4]
	cmp r3, 0xE
	bls _08142BCE
	b _08142CE0
_08142BCE:
	lsls r0, r3, 2
	ldr r1, _08142BD8 @ =_08142BDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08142BD8: .4byte _08142BDC
	.align 2, 0
_08142BDC:
	.4byte _08142C18
	.4byte _08142C24
	.4byte _08142C30
	.4byte _08142C48
	.4byte _08142C60
	.4byte _08142C6C
	.4byte _08142C78
	.4byte _08142C84
	.4byte _08142C90
	.4byte _08142C9C
	.4byte _08142CA8
	.4byte _08142CC0
	.4byte _08142CCC
	.4byte _08142CD8
	.4byte _08142CDC
_08142C18:
	movs r0, 0
	str r0, [r4]
	ldr r2, _08142C20 @ =gUnknown_841EA6F
	b _08142CE0
	.align 2, 0
_08142C20: .4byte gUnknown_841EA6F
_08142C24:
	movs r0, 0
	str r0, [r4]
	ldr r2, _08142C2C @ =gUnknown_841E9D3
	b _08142CE0
	.align 2, 0
_08142C2C: .4byte gUnknown_841E9D3
_08142C30:
	movs r0, 0x1
	str r0, [r4]
	ldr r2, _08142C40 @ =gUnknown_841E866
	cmp r5, 0
	bne _08142CE0
	ldr r2, _08142C44 @ =gUnknown_841E8BD
	b _08142CE0
	.align 2, 0
_08142C40: .4byte gUnknown_841E866
_08142C44: .4byte gUnknown_841E8BD
_08142C48:
	movs r0, 0x1
	str r0, [r4]
	ldr r2, _08142C58 @ =gUnknown_841E88F
	cmp r5, 0
	bne _08142CE0
	ldr r2, _08142C5C @ =gUnknown_841E8E2
	b _08142CE0
	.align 2, 0
_08142C58: .4byte gUnknown_841E88F
_08142C5C: .4byte gUnknown_841E8E2
_08142C60:
	movs r0, 0x1
	str r0, [r4]
	ldr r2, _08142C68 @ =gUnknown_841E90C
	b _08142CE0
	.align 2, 0
_08142C68: .4byte gUnknown_841E90C
_08142C6C:
	movs r0, 0
	str r0, [r4]
	ldr r2, _08142C74 @ =gUnknown_841E946
	b _08142CE0
	.align 2, 0
_08142C74: .4byte gUnknown_841E946
_08142C78:
	movs r0, 0
	str r0, [r4]
	ldr r2, _08142C80 @ =gUnknown_841E98F
	b _08142CE0
	.align 2, 0
_08142C80: .4byte gUnknown_841E98F
_08142C84:
	movs r0, 0
	str r0, [r4]
	ldr r2, _08142C8C @ =gUnknown_841E968
	b _08142CE0
	.align 2, 0
_08142C8C: .4byte gUnknown_841E968
_08142C90:
	movs r0, 0
	str r0, [r4]
	ldr r2, _08142C98 @ =gUnknown_841E9AB
	b _08142CE0
	.align 2, 0
_08142C98: .4byte gUnknown_841E9AB
_08142C9C:
	movs r0, 0
	str r0, [r4]
	ldr r2, _08142CA4 @ =gUnknown_841E7D1
	b _08142CE0
	.align 2, 0
_08142CA4: .4byte gUnknown_841E7D1
_08142CA8:
	movs r0, 0
	str r0, [r4]
	ldr r2, _08142CB8 @ =gUnknown_841EA3F
	cmp r6, 0
	bne _08142CE0
	ldr r2, _08142CBC @ =gUnknown_841EA0D
	b _08142CE0
	.align 2, 0
_08142CB8: .4byte gUnknown_841EA3F
_08142CBC: .4byte gUnknown_841EA0D
_08142CC0:
	movs r0, 0
	str r0, [r4]
	ldr r2, _08142CC8 @ =gUnknown_841E7BC
	b _08142CE0
	.align 2, 0
_08142CC8: .4byte gUnknown_841E7BC
_08142CCC:
	movs r0, 0x1
	str r0, [r4]
	ldr r2, _08142CD4 @ =gUnknown_841E92B
	b _08142CE0
	.align 2, 0
_08142CD4: .4byte gUnknown_841E92B
_08142CD8:
	movs r0, 0x1
	b _08142CDE
_08142CDC:
	movs r0, 0
_08142CDE:
	str r0, [r4]
_08142CE0:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end mevent_message

	thumb_func_start mevent_08142CE8
mevent_08142CE8: @ 8142CE8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	ldrb r4, [r6]
	cmp r4, 0x1
	beq _08142D1A
	cmp r4, 0x1
	bgt _08142D00
	cmp r4, 0
	beq _08142D06
	b _08142D46
_08142D00:
	cmp r4, 0x2
	beq _08142D30
	b _08142D46
_08142D06:
	cmp r0, 0
	beq _08142D0E
	bl sub_8142504
_08142D0E:
	movs r0, 0x81
	lsls r0, 1
	bl PlayFanfare
	strh r4, [r5]
	b _08142D28
_08142D1A:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF0
	bls _08142D46
_08142D28:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _08142D46
_08142D30:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08142D46
	movs r0, 0
	strb r0, [r6]
	bl sub_8142560
	movs r0, 0x1
	b _08142D48
_08142D46:
	movs r0, 0
_08142D48:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end mevent_08142CE8

	thumb_func_start mevent_message_stamp_card_etc_send_status
mevent_message_stamp_card_etc_send_status: @ 8142D50
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, _08142D6C @ =gUnknown_841E7BC
	movs r0, 0
	str r0, [r3]
	adds r4, r1, 0
	cmp r2, 0xE
	bhi _08142E12
	lsls r0, r2, 2
	ldr r1, _08142D70 @ =_08142D74
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08142D6C: .4byte gUnknown_841E7BC
_08142D70: .4byte _08142D74
	.align 2, 0
_08142D74:
	.4byte _08142DB0
	.4byte _08142DB8
	.4byte _08142DC0
	.4byte _08142DC8
	.4byte _08142DD4
	.4byte _08142DDC
	.4byte _08142DE4
	.4byte _08142DEC
	.4byte _08142DF4
	.4byte _08142DFC
	.4byte _08142E10
	.4byte _08142E04
	.4byte _08142E08
	.4byte _08142E08
	.4byte _08142E10
_08142DB0:
	ldr r1, _08142DB4 @ =gUnknown_841EA6F
	b _08142E12
	.align 2, 0
_08142DB4: .4byte gUnknown_841EA6F
_08142DB8:
	ldr r1, _08142DBC @ =gUnknown_841E9D3
	b _08142E12
	.align 2, 0
_08142DBC: .4byte gUnknown_841E9D3
_08142DC0:
	ldr r1, _08142DC4 @ =gUnknown_841EB20
	b _08142DCA
	.align 2, 0
_08142DC4: .4byte gUnknown_841EB20
_08142DC8:
	ldr r1, _08142DD0 @ =gUnknown_841EB46
_08142DCA:
	movs r0, 0x1
	str r0, [r3]
	b _08142E12
	.align 2, 0
_08142DD0: .4byte gUnknown_841EB46
_08142DD4:
	ldr r1, _08142DD8 @ =gUnknown_841EB71
	b _08142E12
	.align 2, 0
_08142DD8: .4byte gUnknown_841EB71
_08142DDC:
	ldr r1, _08142DE0 @ =gUnknown_841EBAA
	b _08142E12
	.align 2, 0
_08142DE0: .4byte gUnknown_841EBAA
_08142DE4:
	ldr r1, _08142DE8 @ =gUnknown_841EC12
	b _08142E12
	.align 2, 0
_08142DE8: .4byte gUnknown_841EC12
_08142DEC:
	ldr r1, _08142DF0 @ =gUnknown_841EBDE
	b _08142E12
	.align 2, 0
_08142DF0: .4byte gUnknown_841EBDE
_08142DF4:
	ldr r1, _08142DF8 @ =gUnknown_841E9AB
	b _08142E12
	.align 2, 0
_08142DF8: .4byte gUnknown_841E9AB
_08142DFC:
	ldr r1, _08142E00 @ =gUnknown_841EC40
	b _08142E12
	.align 2, 0
_08142E00: .4byte gUnknown_841EC40
_08142E04:
	adds r1, r4, 0
	b _08142E12
_08142E08:
	ldr r1, _08142E0C @ =gUnknown_841EB8E
	b _08142E12
	.align 2, 0
_08142E0C: .4byte gUnknown_841EB8E
_08142E10:
	ldr r1, _08142E1C @ =gUnknown_841EC6A
_08142E12:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08142E1C: .4byte gUnknown_841EC6A
	thumb_func_end mevent_message_stamp_card_etc_send_status

	thumb_func_start sub_8142E20
sub_8142E20: @ 8142E20
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	bl mevent_message_stamp_card_etc_send_status
	adds r1, r0, 0
	ldr r0, [sp]
	cmp r0, 0
	bne _08142E46
	adds r0, r4, 0
	bl mevent_0814257C
	b _08142E4E
_08142E46:
	adds r0, r4, 0
	adds r2, r5, 0
	bl mevent_08142CE8
_08142E4E:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8142E20

	thumb_func_start task_add_00_mystery_gift
task_add_00_mystery_gift: @ 8142E58
	push {r4,lr}
	ldr r0, _08142E98 @ =sub_8142EA0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08142E9C @ =gTasks+0x8
	adds r4, r0
	movs r0, 0
	strb r0, [r4, 0x8]
	strb r0, [r4, 0x9]
	strb r0, [r4, 0xA]
	strb r0, [r4, 0xB]
	strb r0, [r4, 0xC]
	strb r0, [r4, 0xD]
	movs r1, 0
	strh r0, [r4]
	strh r0, [r4, 0x2]
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x6]
	strb r1, [r4, 0xE]
	movs r0, 0x40
	bl AllocZeroed
	str r0, [r4, 0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142E98: .4byte sub_8142EA0
_08142E9C: .4byte gTasks+0x8
	thumb_func_end task_add_00_mystery_gift

	thumb_func_start sub_8142EA0
sub_8142EA0: @ 8142EA0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08142EC4 @ =gTasks+0x8
	adds r5, r0, r1
	ldrb r0, [r5, 0x8]
	cmp r0, 0x25
	bls _08142EBA
	b _081435C6
_08142EBA:
	lsls r0, 2
	ldr r1, _08142EC8 @ =_08142ECC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08142EC4: .4byte gTasks+0x8
_08142EC8: .4byte _08142ECC
	.align 2, 0
_08142ECC:
	.4byte _08142F64
	.4byte _08142F6A
	.4byte _08142FAC
	.4byte _08142FE4
	.4byte _08143008
	.4byte _08143058
	.4byte _081430B8
	.4byte _081430EC
	.4byte _081430FC
	.4byte _08143174
	.4byte _08143198
	.4byte _081431B0
	.4byte _081431E0
	.4byte _0814321C
	.4byte _08143232
	.4byte _08143264
	.4byte _0814358C
	.4byte _081432C2
	.4byte _081432CC
	.4byte _081435C6
	.4byte _081432DE
	.4byte _0814332C
	.4byte _081433A2
	.4byte _081433D2
	.4byte _08143408
	.4byte _08143422
	.4byte _08143436
	.4byte _08143442
	.4byte _08143456
	.4byte _0814346A
	.4byte _0814349C
	.4byte _081434D0
	.4byte _08143514
	.4byte _08143528
	.4byte _08143544
	.4byte _08143558
	.4byte _0814358C
	.4byte _081435AC
_08142F64:
	movs r0, 0x1
	strb r0, [r5, 0x8]
	b _081435C6
_08142F6A:
	adds r0, r5, 0
	adds r0, 0x9
	adds r1, r5, 0
	movs r2, 0
	bl sub_81426D4
	adds r1, r0, 0
	cmp r1, 0x1
	beq _08142F94
	cmp r1, 0x1
	bcc _08142F8A
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08142FA6
	b _081435C6
_08142F8A:
	movs r0, 0
	strb r0, [r5, 0xC]
	bl sub_8143FC8
	b _08142F9A
_08142F94:
	strb r1, [r5, 0xC]
	bl sub_8143E1C
_08142F9A:
	cmp r0, 0x1
	bne _08142FA0
	b _081434C4
_08142FA0:
	movs r0, 0x2
	strb r0, [r5, 0x8]
	b _081435C6
_08142FA6:
	movs r0, 0x25
	strb r0, [r5, 0x8]
	b _081435C6
_08142FAC:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08142FC0
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _08142FBC @ =gUnknown_841E6A1
	b _08142FC6
	.align 2, 0
_08142FBC: .4byte gUnknown_841E6A1
_08142FC0:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _08142FE0 @ =gUnknown_841E6DC
_08142FC6:
	bl mevent_0814257C
	cmp r0, 0
	bne _08142FD0
	b _081435C6
_08142FD0:
	movs r0, 0x3
	strb r0, [r5, 0x8]
	movs r0, 0
	movs r1, 0x1
	bl sub_8142344
	b _081435C6
	.align 2, 0
_08142FE0: .4byte gUnknown_841E6DC
_08142FE4:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08142FF8
	ldr r0, _08142FF4 @ =gUnknown_841E717
	bl sub_8142504
	b _08142FFE
	.align 2, 0
_08142FF4: .4byte gUnknown_841E717
_08142FF8:
	ldr r0, _08143004 @ =gUnknown_841E741
	bl sub_8142504
_08142FFE:
	movs r0, 0x4
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_08143004: .4byte gUnknown_841E741
_08143008:
	adds r0, r5, 0
	adds r0, 0x9
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_81426D4
	adds r4, r0, 0
	cmp r4, 0x1
	beq _08143036
	cmp r4, 0x1
	bcc _08143028
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _08143042
	b _081435C6
_08143028:
	bl sub_8142560
	movs r1, 0
	movs r0, 0x5
	strb r0, [r5, 0x8]
	strb r1, [r5, 0xD]
	b _081435C6
_08143036:
	bl sub_8142560
	movs r0, 0x5
	strb r0, [r5, 0x8]
	strb r4, [r5, 0xD]
	b _081435C6
_08143042:
	bl sub_8142560
	ldrb r0, [r5, 0xC]
	bl sub_8142A44
	cmp r0, 0
	beq _08143052
	b _081434C4
_08143052:
	strb r0, [r5, 0x8]
	movs r0, 0
	b _0814359E
_08143058:
	ldr r0, _08143074 @ =gStringVar1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, _08143078 @ =gStringVar2
	strb r1, [r0]
	ldr r0, _0814307C @ =gStringVar3
	strb r1, [r0]
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	beq _08143080
	cmp r0, 0x1
	beq _0814309A
	b _081430B2
	.align 2, 0
_08143074: .4byte gStringVar1
_08143078: .4byte gStringVar2
_0814307C: .4byte gStringVar3
_08143080:
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _0814308E
	movs r0, 0x15
	bl sub_8117ED4
	b _081430B2
_0814308E:
	cmp r0, 0
	bne _081430B2
	movs r0, 0x15
	bl sub_8118290
	b _081430B2
_0814309A:
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _081430A8
	movs r0, 0x16
	bl sub_8117ED4
	b _081430B2
_081430A8:
	cmp r0, 0
	bne _081430B2
	movs r0, 0x16
	bl sub_8118290
_081430B2:
	movs r0, 0x6
	strb r0, [r5, 0x8]
	b _081435C6
_081430B8:
	ldr r0, _081430D0 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	beq _081430D4
	movs r0, 0x1
	bl sub_81424B8
	movs r0, 0x7
	strb r0, [r5, 0x8]
	bl mevent_srv_ish_do_init
	b _081435C6
	.align 2, 0
_081430D0: .4byte gUnknown_3003F64
_081430D4:
	ldr r0, _081430E8 @ =gUnknown_20370D0
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _081430DE
	b _081435C6
_081430DE:
	movs r0, 0x1
	bl sub_81424B8
	b _08143464
	.align 2, 0
_081430E8: .4byte gUnknown_20370D0
_081430EC:
	ldr r0, _081430F8 @ =gUnknown_841E794
	bl sub_8142504
	movs r0, 0x8
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_081430F8: .4byte gUnknown_841E794
_081430FC:
	adds r0, r5, 0
	bl mevent_srv_ish_do_exec
	subs r0, 0x2
	cmp r0, 0x4
	bls _0814310A
	b _081435C6
_0814310A:
	lsls r0, 2
	ldr r1, _08143114 @ =_08143118
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08143114: .4byte _08143118
	.align 2, 0
_08143118:
	.4byte _08143156
	.4byte _08143150
	.4byte _0814315C
	.4byte _0814313A
	.4byte _0814312C
_0814312C:
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	ldrh r0, [r5]
	strb r0, [r5, 0xE]
	movs r0, 0xD
	strb r0, [r5, 0x8]
	b _081435C6
_0814313A:
	ldr r4, [r5, 0x10]
	bl mevent_srv_ish_get_buffer
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x40
	bl memcpy
	bl mevent_srv_ish_inc_flag
	b _081435C6
_08143150:
	movs r0, 0xA
	strb r0, [r5, 0x8]
	b _081435C6
_08143156:
	movs r0, 0x9
	strb r0, [r5, 0x8]
	b _081435C6
_0814315C:
	movs r0, 0xB
	strb r0, [r5, 0x8]
	ldr r0, _0814316C @ =gStringVar1
	ldr r1, _08143170 @ =gLinkPlayers + 8
	bl StringCopy
	b _081435C6
	.align 2, 0
_0814316C: .4byte gStringVar1
_08143170: .4byte gLinkPlayers + 8
_08143174:
	adds r4, r5, 0
	adds r4, 0x9
	bl mevent_srv_ish_get_buffer
	adds r3, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl sub_81427A0
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _0814320C
	cmp r1, 0x1
	bcs _081431FA
	movs r0, 0
	b _0814320E
_08143198:
	adds r4, r5, 0
	adds r4, 0x9
	bl mevent_srv_ish_get_buffer
	adds r1, r0, 0
	adds r0, r4, 0
	bl mevent_0814257C
	cmp r0, 0
	bne _081431AE
	b _081435C6
_081431AE:
	b _08143212
_081431B0:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r3, _081431D8 @ =gUnknown_841E7F2
	adds r1, r5, 0
	movs r2, 0
	bl sub_81427A0
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _0814320C
	cmp r1, 0x1
	bcs _081431FA
	bl sub_8144144
	cmp r0, 0x1
	bne _081431DC
	movs r0, 0xC
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_081431D8: .4byte gUnknown_841E7F2
_081431DC:
	movs r0, 0
	b _0814320E
_081431E0:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r3, _08143204 @ =gUnknown_841E823
	adds r1, r5, 0
	movs r2, 0
	bl sub_81427A0
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _0814320C
	cmp r1, 0x1
	bcc _08143208
_081431FA:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0814320C
	b _081435C6
	.align 2, 0
_08143204: .4byte gUnknown_841E823
_08143208:
	movs r0, 0
	b _0814320E
_0814320C:
	movs r0, 0x1
_0814320E:
	bl mevent_srv_ish_set_param
_08143212:
	bl mevent_srv_ish_inc_flag
	movs r0, 0x7
	strb r0, [r5, 0x8]
	b _081435C6
_0814321C:
	bl sub_80FA4F8
	lsls r0, 24
	cmp r0, 0
	bne _08143228
	b _081435C6
_08143228:
	bl sub_80FCE44
	movs r0, 0xE
	strb r0, [r5, 0x8]
	b _081435C6
_08143232:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _08143258 @ =gUnknown_841E7A3
	bl sub_81426A0
	cmp r0, 0
	bne _08143242
	b _081435C6
_08143242:
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _08143250
	ldr r0, _0814325C @ =gStringVar1
	ldr r1, _08143260 @ =gLinkPlayers + 8
	bl StringCopy
_08143250:
	movs r0, 0xF
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_08143258: .4byte gUnknown_841E7A3
_0814325C: .4byte gStringVar1
_08143260: .4byte gLinkPlayers + 8
_08143264:
	ldrb r1, [r5, 0xC]
	ldrb r2, [r5, 0xD]
	ldrb r3, [r5, 0xE]
	mov r0, sp
	bl mevent_message
	adds r1, r0, 0
	cmp r1, 0
	bne _08143278
	ldr r1, [r5, 0x10]
_08143278:
	ldr r0, [sp]
	cmp r0, 0
	beq _0814328A
	adds r0, r5, 0
	adds r0, 0x9
	adds r2, r5, 0
	bl mevent_08142CE8
	b _08143292
_0814328A:
	adds r0, r5, 0
	adds r0, 0x9
	bl mevent_0814257C
_08143292:
	adds r1, r0, 0
	cmp r1, 0
	bne _0814329A
	b _081435C6
_0814329A:
	ldrb r0, [r5, 0xE]
	cmp r0, 0x3
	bne _081432B4
	ldrb r0, [r5, 0xD]
	cmp r0, 0x1
	bne _081432AE
	movs r0, 0x1
	bl sub_8146C30
	b _081432B4
_081432AE:
	movs r0, 0x2
	bl sub_8146C30
_081432B4:
	ldr r0, [sp]
	cmp r0, 0
	beq _081432BC
	b _0814357C
_081432BC:
	strb r0, [r5, 0x8]
	movs r0, 0
	b _0814359E
_081432C2:
	adds r0, r5, 0
	adds r0, 0x9
	bl mevent_save_game
	b _08143596
_081432CC:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r1, [r5, 0xC]
	bl sub_8142A58
	cmp r0, 0
	bne _081432DC
	b _081435C6
_081432DC:
	b _0814339C
_081432DE:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08143308
	ldr r2, _08143304 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081432F4
	movs r0, 0x15
	strb r0, [r5, 0x8]
_081432F4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08143300
	b _081435C6
_08143300:
	b _08143326
	.align 2, 0
_08143304: .4byte gMain
_08143308:
	ldr r0, _0814331C @ =gMain
	ldrh r0, [r0, 0x2E]
	bl sub_8146884
	cmp r0, 0
	beq _08143320
	cmp r0, 0x1
	beq _08143326
	b _081435C6
	.align 2, 0
_0814331C: .4byte gMain
_08143320:
	bl sub_81467EC
	b _08143402
_08143326:
	movs r0, 0x1B
	strb r0, [r5, 0x8]
	b _081435C6
_0814332C:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08143346
	bl sub_8144054
	cmp r0, 0
	beq _0814335A
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	movs r3, 0
	b _08143364
_08143346:
	bl sub_8143E78
	cmp r0, 0
	beq _0814335A
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	movs r3, 0
	b _08143364
_0814335A:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	movs r3, 0x1
_08143364:
	bl sub_81428F4
	adds r1, r0, 0
	cmp r1, 0x1
	beq _08143386
	cmp r1, 0x1
	bcc _08143380
	cmp r1, 0x2
	beq _0814338C
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08143392
	b _081435C6
_08143380:
	movs r0, 0x1C
	strb r0, [r5, 0x8]
	b _081435C6
_08143386:
	movs r0, 0x1D
	strb r0, [r5, 0x8]
	b _081435C6
_0814338C:
	movs r0, 0x16
	strb r0, [r5, 0x8]
	b _081435C6
_08143392:
	ldrb r0, [r5, 0xC]
	cmp r0, 0x1
	bne _0814339C
	bl sub_8146834
_0814339C:
	movs r0, 0x14
	strb r0, [r5, 0x8]
	b _081435C6
_081433A2:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xC]
	adds r1, r5, 0
	bl sub_8142AFC
	adds r1, r0, 0
	cmp r1, 0
	beq _081433BE
	cmp r1, 0
	ble _081433EC
	cmp r1, 0x1
	beq _08143402
	b _081435C6
_081433BE:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _081433FC
	bl sub_8144144
	cmp r0, 0x1
	bne _081433FC
	movs r0, 0x17
	strb r0, [r5, 0x8]
	b _081435C6
_081433D2:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r3, _081433F8 @ =gUnknown_841ECF9
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_81427A0
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0x1
	beq _08143402
	cmp r1, 0x1
	bcc _081433FC
_081433EC:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08143402
	b _081435C6
	.align 2, 0
_081433F8: .4byte gUnknown_841ECF9
_081433FC:
	movs r0, 0x18
	strb r0, [r5, 0x8]
	b _081435C6
_08143402:
	movs r0, 0x15
	strb r0, [r5, 0x8]
	b _081435C6
_08143408:
	ldrb r0, [r5, 0xC]
	movs r1, 0x1
	bl sub_8142ACC
	cmp r0, 0
	bne _08143416
	b _081435C6
_08143416:
	ldrb r0, [r5, 0xC]
	bl sub_8142AB4
	movs r0, 0x19
	strb r0, [r5, 0x8]
	b _081435C6
_08143422:
	adds r0, r5, 0
	adds r0, 0x9
	bl mevent_save_game
	cmp r0, 0
	bne _08143430
	b _081435C6
_08143430:
	movs r0, 0x1A
	strb r0, [r5, 0x8]
	b _081435C6
_08143436:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r1, [r5, 0xC]
	bl mevent_message_was_thrown_away
	b _08143596
_08143442:
	ldrb r0, [r5, 0xC]
	movs r1, 0
	bl sub_8142ACC
	cmp r0, 0
	bne _08143450
	b _081435C6
_08143450:
	movs r0, 0
	strb r0, [r5, 0x8]
	b _081435C6
_08143456:
	ldrb r0, [r5, 0xC]
	movs r1, 0x1
	bl sub_8142ACC
	cmp r0, 0
	bne _08143464
	b _081435C6
_08143464:
	movs r0, 0x3
	strb r0, [r5, 0x8]
	b _081435C6
_0814346A:
	ldrb r0, [r5, 0xC]
	movs r1, 0x1
	bl sub_8142ACC
	cmp r0, 0
	bne _08143478
	b _081435C6
_08143478:
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	beq _08143484
	cmp r0, 0x1
	beq _0814348C
	b _08143492
_08143484:
	movs r0, 0x15
	bl sub_81179CC
	b _08143492
_0814348C:
	movs r0, 0x16
	bl sub_81179CC
_08143492:
	movs r0, 0x1
	strb r0, [r5, 0xD]
	movs r0, 0x1E
	strb r0, [r5, 0x8]
	b _081435C6
_0814349C:
	ldr r0, _081434B0 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	beq _081434B4
	movs r0, 0x1
	bl sub_81424B8
	movs r0, 0x1F
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_081434B0: .4byte gUnknown_3003F64
_081434B4:
	ldr r0, _081434CC @ =gUnknown_20370D0
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _081434BE
	b _081435C6
_081434BE:
	movs r0, 0x1
	bl sub_81424B8
_081434C4:
	movs r0, 0x12
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_081434CC: .4byte gUnknown_20370D0
_081434D0:
	ldr r0, _081434F0 @ =gStringVar1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, _081434F4 @ =gStringVar2
	strb r1, [r0]
	ldr r0, _081434F8 @ =gStringVar3
	strb r1, [r0]
	ldrb r0, [r5, 0xC]
	cmp r0, 0
	bne _08143500
	ldr r0, _081434FC @ =gUnknown_841EAE7
	bl sub_8142504
	bl mevent_srv_common_do_init_2
	b _0814350A
	.align 2, 0
_081434F0: .4byte gStringVar1
_081434F4: .4byte gStringVar2
_081434F8: .4byte gStringVar3
_081434FC: .4byte gUnknown_841EAE7
_08143500:
	ldr r0, _08143510 @ =gUnknown_841EB01
	bl sub_8142504
	bl mevent_srv_common_do_init_1
_0814350A:
	movs r0, 0x20
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_08143510: .4byte gUnknown_841EB01
_08143514:
	adds r0, r5, 0
	bl mevent_srv_init_do_exec
	cmp r0, 0x3
	bne _081435C6
	ldrh r0, [r5]
	strb r0, [r5, 0xE]
	movs r0, 0x21
	strb r0, [r5, 0x8]
	b _081435C6
_08143528:
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	ldr r0, _0814353C @ =gStringVar1
	ldr r1, _08143540 @ =gLinkPlayers + 0x24
	bl StringCopy
	movs r0, 0x22
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_0814353C: .4byte gStringVar1
_08143540: .4byte gLinkPlayers + 0x24
_08143544:
	bl sub_80FA4F8
	lsls r0, 24
	cmp r0, 0
	beq _081435C6
	bl sub_80FCE44
	movs r0, 0x23
	strb r0, [r5, 0x8]
	b _081435C6
_08143558:
	adds r0, r5, 0
	adds r0, 0x9
	ldrb r2, [r5, 0xD]
	ldrb r3, [r5, 0xE]
	adds r1, r5, 0
	bl sub_8142E20
	cmp r0, 0
	beq _081435C6
	ldr r0, [r5, 0xC]
	ldr r1, _08143584 @ =0x00ffff00
	ands r0, r1
	ldr r1, _08143588 @ =0x00030100
	cmp r0, r1
	bne _0814359A
	movs r0, 0x3
	bl sub_8146C30
_0814357C:
	movs r0, 0x11
	strb r0, [r5, 0x8]
	b _081435C6
	.align 2, 0
_08143584: .4byte 0x00ffff00
_08143588: .4byte 0x00030100
_0814358C:
	adds r0, r5, 0
	adds r0, 0x9
	ldr r1, _081435A8 @ =gUnknown_841E7BC
	bl mevent_0814257C
_08143596:
	cmp r0, 0
	beq _081435C6
_0814359A:
	movs r0, 0
	strb r0, [r5, 0x8]
_0814359E:
	movs r1, 0
	bl sub_8142344
	b _081435C6
	.align 2, 0
_081435A8: .4byte gUnknown_841E7BC
_081435AC:
	bl sub_80098B8
	bl sub_812B484
	ldr r0, [r5, 0x10]
	bl Free
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _081435D0 @ =sub_81422FC
	bl SetMainCallback2
_081435C6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081435D0: .4byte sub_81422FC
	thumb_func_end sub_8142EA0

	thumb_func_start sub_81435D4
sub_81435D4: @ 81435D4
	ldr r0, _081435D8 @ =0x0000019b
	bx lr
	.align 2, 0
_081435D8: .4byte 0x0000019b
	thumb_func_end sub_81435D4

	.align 2, 0 @ Don't pad with nop.
