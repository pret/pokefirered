	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_808835C
sub_808835C: @ 808835C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_808835C

	thumb_func_start sub_8088374
sub_8088374: @ 8088374
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8088374

	thumb_func_start sub_8088388
sub_8088388: @ 8088388
	push {r4-r6,lr}
	ldr r1, _08088418 @ =gMain
	ldr r0, [r1, 0x8]
	cmp r0, 0
	bne _08088396
	ldr r0, _0808841C @ =sub_80568A8
	str r0, [r1, 0x8]
_08088396:
	ldr r4, _08088420 @ =gUnknown_2039620
	movs r0, 0x14
	bl AllocZeroed
	str r0, [r4]
	movs r1, 0
	strb r1, [r0, 0x10]
	ldr r0, [r4]
	strb r1, [r0, 0x12]
	ldr r0, [r4]
	strb r1, [r0, 0x11]
	ldr r2, [r4]
	strh r1, [r2, 0xE]
	ldr r0, _08088424 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	ldrb r0, [r1, 0x14]
	lsls r0, 29
	lsrs r0, 29
	strh r0, [r2]
	ldrb r0, [r1, 0x15]
	lsls r0, 29
	lsrs r0, 31
	strh r0, [r2, 0x2]
	ldrb r0, [r1, 0x15]
	lsls r0, 30
	lsrs r0, 31
	strh r0, [r2, 0x4]
	ldrb r0, [r1, 0x15]
	lsls r0, 31
	lsrs r0, 31
	strh r0, [r2, 0x6]
	ldrb r0, [r1, 0x13]
	strh r0, [r2, 0x8]
	ldrb r0, [r1, 0x14]
	lsrs r0, 3
	strh r0, [r2, 0xA]
	movs r3, 0
	adds r6, r4, 0
	ldr r5, _08088428 @ =gUnknown_83CC304
	movs r4, 0
_080883E6:
	ldr r1, [r6]
	lsls r0, r3, 1
	adds r2, r1, r0
	ldrh r1, [r2]
	adds r0, r5
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	ble _080883FA
	strh r4, [r2]
_080883FA:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _080883E6
	movs r0, 0xD
	bl sub_812B1F0
	ldr r0, _0808842C @ =sub_8088454
	bl SetMainCallback2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088418: .4byte gMain
_0808841C: .4byte sub_80568A8
_08088420: .4byte gUnknown_2039620
_08088424: .4byte gSaveBlock2Ptr
_08088428: .4byte gUnknown_83CC304
_0808842C: .4byte sub_8088454
	thumb_func_end sub_8088388

	thumb_func_start sub_8088430
sub_8088430: @ 8088430
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	pop {r0}
	bx r0
	thumb_func_end sub_8088430

	thumb_func_start sub_8088444
sub_8088444: @ 8088444
	push {lr}
	ldr r0, _08088450 @ =sub_8088374
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_08088450: .4byte sub_8088374
	thumb_func_end sub_8088444

	thumb_func_start sub_8088454
sub_8088454: @ 8088454
	push {r4,lr}
	ldr r0, _0808846C @ =gUnknown_2039620
	ldr r0, [r0]
	ldrb r0, [r0, 0x11]
	cmp r0, 0x9
	bhi _080884FA
	lsls r0, 2
	ldr r1, _08088470 @ =_08088474
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808846C: .4byte gUnknown_2039620
_08088470: .4byte _08088474
	.align 2, 0
_08088474:
	.4byte _0808849C
	.4byte _080884A2
	.4byte _080884A8
	.4byte _080884AE
	.4byte _080884BC
	.4byte _080884C2
	.4byte _080884C8
	.4byte _080884CE
	.4byte _080884E2
	.4byte _080884F4
_0808849C:
	bl sub_8088430
	b _080884FE
_080884A2:
	bl sub_8088530
	b _080884FE
_080884A8:
	bl sub_80886D4
	b _080884FE
_080884AE:
	bl sub_80886F0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08088508
	b _080884FE
_080884BC:
	bl sub_8088BD0
	b _080884FE
_080884C2:
	bl sub_8088C0C
	b _080884FE
_080884C8:
	bl sub_8088D8C
	b _080884FE
_080884CE:
	movs r4, 0
_080884D0:
	adds r0, r4, 0
	bl sub_80889A8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _080884D0
	b _080884FE
_080884E2:
	ldr r0, _080884F0 @ =gUnknown_2039620
	ldr r0, [r0]
	ldrh r0, [r0, 0xE]
	bl sub_8088DE0
	b _080884FE
	.align 2, 0
_080884F0: .4byte gUnknown_2039620
_080884F4:
	bl sub_8088680
	b _080884FE
_080884FA:
	bl sub_8088514
_080884FE:
	ldr r0, _08088510 @ =gUnknown_2039620
	ldr r1, [r0]
	ldrb r0, [r1, 0x11]
	adds r0, 0x1
	strb r0, [r1, 0x11]
_08088508:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088510: .4byte gUnknown_2039620
	thumb_func_end sub_8088454

	thumb_func_start sub_8088514
sub_8088514: @ 8088514
	push {lr}
	ldr r0, _08088528 @ =sub_8088780
	movs r1, 0
	bl CreateTask
	ldr r0, _0808852C @ =sub_808835C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08088528: .4byte sub_8088780
_0808852C: .4byte sub_808835C
	thumb_func_end sub_8088514

	thumb_func_start sub_8088530
sub_8088530: @ 8088530
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _08088670 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08088674 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08088556:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08088556
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _08088670 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08088678 @ =gUnknown_83CC2D8
	movs r0, 0
	movs r2, 0x3
	bl InitBgsFromTemplates
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	ldr r0, _0808867C @ =gUnknown_83CC2B8
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, 0x50
	movs r1, 0xC1
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x2
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x1
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x27
	bl SetGpuReg
	movs r1, 0xC1
	lsls r1, 6
	movs r0, 0
	bl SetGpuReg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088670: .4byte 0x040000d4
_08088674: .4byte 0x81000800
_08088678: .4byte gUnknown_83CC2D8
_0808867C: .4byte gUnknown_83CC2B8
	thumb_func_end sub_8088530

	thumb_func_start sub_8088680
sub_8088680: @ 8088680
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r5, _080886CC @ =gUnknown_8419E57
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0
	bl sub_8005ED4
	movs r4, 0xE4
	subs r4, r0
	movs r0, 0x2
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080886D0 @ =gUnknown_83CC360
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0
	bl box_print
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080886CC: .4byte gUnknown_8419E57
_080886D0: .4byte gUnknown_83CC360
	thumb_func_end sub_8088680

	thumb_func_start sub_80886D4
sub_80886D4: @ 80886D4
	push {lr}
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl remove_some_task
	pop {r0}
	bx r0
	thumb_func_end sub_80886D4

	thumb_func_start sub_80886F0
sub_80886F0: @ 80886F0
	push {lr}
	ldr r0, _08088708 @ =gUnknown_2039620
	ldr r0, [r0]
	ldrb r1, [r0, 0x12]
	cmp r1, 0x1
	beq _0808872E
	cmp r1, 0x1
	bgt _0808870C
	cmp r1, 0
	beq _08088716
	b _08088768
	.align 2, 0
_08088708: .4byte gUnknown_2039620
_0808870C:
	cmp r1, 0x2
	beq _0808873A
	cmp r1, 0x3
	beq _08088758
	b _08088768
_08088716:
	ldrb r0, [r0, 0xA]
	bl sub_8069788
	ldr r1, [r0]
	movs r2, 0x90
	lsls r2, 1
	movs r3, 0xD5
	lsls r3, 1
	movs r0, 0x1
	bl LoadBgTiles
	b _0808876C
_0808872E:
	ldrb r0, [r0, 0xA]
	bl sub_8069788
	ldr r0, [r0, 0x4]
	movs r1, 0x20
	b _0808874C
_0808873A:
	ldr r0, _08088754 @ =gUnknown_83CC2E4
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x2
	bl stdpal_get
	movs r1, 0xF0
_0808874C:
	movs r2, 0x20
	bl LoadPalette
	b _0808876C
	.align 2, 0
_08088754: .4byte gUnknown_83CC2E4
_08088758:
	ldr r1, _08088764 @ =0x000001b3
	movs r0, 0x1
	movs r2, 0x30
	bl sub_814FDA0
	b _0808876C
	.align 2, 0
_08088764: .4byte 0x000001b3
_08088768:
	movs r0, 0x1
	b _08088778
_0808876C:
	ldr r0, _0808877C @ =gUnknown_2039620
	ldr r1, [r0]
	ldrb r0, [r1, 0x12]
	adds r0, 0x1
	strb r0, [r1, 0x12]
	movs r0, 0
_08088778:
	pop {r1}
	bx r1
	.align 2, 0
_0808877C: .4byte gUnknown_2039620
	thumb_func_end sub_80886F0

	thumb_func_start sub_8088780
sub_8088780: @ 8088780
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080887A0 @ =gUnknown_2039620
	ldr r0, [r1]
	ldrb r0, [r0, 0x10]
	adds r3, r1, 0
	cmp r0, 0x5
	bls _08088796
	b _080888B6
_08088796:
	lsls r0, 2
	ldr r1, _080887A4 @ =_080887A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080887A0: .4byte gUnknown_2039620
_080887A4: .4byte _080887A8
	.align 2, 0
_080887A8:
	.4byte _080887C0
	.4byte _08088894
	.4byte _080887E0
	.4byte _08088878
	.4byte _08088894
	.4byte _080888B0
_080887C0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl sub_8088444
	ldr r0, _080887DC @ =gUnknown_2039620
	ldr r1, [r0]
	b _080888A2
	.align 2, 0
_080887DC: .4byte gUnknown_2039620
_080887E0:
	bl sub_80BF72C
	cmp r0, 0x1
	beq _080888B6
	bl sub_80888C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080888B6
	lsls r0, 2
	ldr r1, _08088800 @ =_08088804
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088800: .4byte _08088804
	.align 2, 0
_08088804:
	.4byte _080888B6
	.4byte _08088818
	.4byte _08088824
	.4byte _08088858
	.4byte _08088868
_08088818:
	ldr r0, _08088820 @ =gUnknown_2039620
	ldr r1, [r0]
	b _080888A2
	.align 2, 0
_08088820: .4byte gUnknown_2039620
_08088824:
	ldr r4, _08088854 @ =gUnknown_2039620
	ldr r0, [r4]
	ldrb r0, [r0, 0xA]
	bl sub_8069788
	ldr r1, [r0]
	movs r2, 0x90
	lsls r2, 1
	movs r3, 0xD5
	lsls r3, 1
	movs r0, 0x1
	bl LoadBgTiles
	ldr r0, [r4]
	ldrb r0, [r0, 0xA]
	bl sub_8069788
	ldr r0, [r0, 0x4]
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r0, [r4]
	b _0808886C
	.align 2, 0
_08088854: .4byte gUnknown_2039620
_08088858:
	ldr r0, _08088864 @ =gUnknown_2039620
	ldr r0, [r0]
	ldrh r0, [r0, 0xE]
	bl sub_8088DE0
	b _080888B6
	.align 2, 0
_08088864: .4byte gUnknown_2039620
_08088868:
	ldr r0, _08088874 @ =gUnknown_2039620
	ldr r0, [r0]
_0808886C:
	ldrb r0, [r0, 0xE]
	bl sub_80889A8
	b _080888B6
	.align 2, 0
_08088874: .4byte gUnknown_2039620
_08088878:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08088890 @ =gUnknown_2039620
	ldr r1, [r0]
	b _080888A2
	.align 2, 0
_08088890: .4byte gUnknown_2039620
_08088894:
	ldr r0, _080888AC @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080888B6
	ldr r1, [r3]
_080888A2:
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	b _080888B6
	.align 2, 0
_080888AC: .4byte gUnknown_2037AB8
_080888B0:
	adds r0, r2, 0
	bl sub_8088B00
_080888B6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8088780

	thumb_func_start sub_80888C0
sub_80888C0: @ 80888C0
	push {r4,lr}
	ldr r3, _080888EC @ =gMain
	ldrh r1, [r3, 0x30]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08088906
	ldr r2, _080888F0 @ =gUnknown_2039620
	ldr r1, [r2]
	ldrh r0, [r1, 0xE]
	lsls r0, 1
	adds r3, r1, r0
	ldrh r4, [r3]
	ldr r1, _080888F4 @ =gUnknown_83CC304
	adds r0, r1
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r4, r0
	bne _080888F8
	movs r0, 0
	b _080888FA
	.align 2, 0
_080888EC: .4byte gMain
_080888F0: .4byte gUnknown_2039620
_080888F4: .4byte gUnknown_83CC304
_080888F8:
	adds r0, r4, 0x1
_080888FA:
	strh r0, [r3]
	ldr r0, [r2]
	ldrh r0, [r0, 0xE]
	cmp r0, 0x5
	beq _08088930
	b _0808893C
_08088906:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08088940
	ldr r2, _08088934 @ =gUnknown_2039620
	ldr r1, [r2]
	ldrh r0, [r1, 0xE]
	lsls r3, r0, 1
	adds r1, r3
	ldrh r0, [r1]
	cmp r0, 0
	bne _08088924
	ldr r0, _08088938 @ =gUnknown_83CC304
	adds r0, r3, r0
	ldrh r0, [r0]
_08088924:
	subs r0, 0x1
	strh r0, [r1]
	ldr r0, [r2]
	ldrh r0, [r0, 0xE]
	cmp r0, 0x5
	bne _0808893C
_08088930:
	movs r0, 0x2
	b _080889A0
	.align 2, 0
_08088934: .4byte gUnknown_2039620
_08088938: .4byte gUnknown_83CC304
_0808893C:
	movs r0, 0x4
	b _080889A0
_08088940:
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08088964
	ldr r0, _0808895C @ =gUnknown_2039620
	ldr r1, [r0]
	ldrh r0, [r1, 0xE]
	cmp r0, 0
	bne _08088960
	movs r0, 0x6
	b _08088982
	.align 2, 0
_0808895C: .4byte gUnknown_2039620
_08088960:
	subs r0, 0x1
	b _08088982
_08088964:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08088988
	ldr r0, _0808897C @ =gUnknown_2039620
	ldr r1, [r0]
	ldrh r0, [r1, 0xE]
	cmp r0, 0x6
	bne _08088980
	strh r2, [r1, 0xE]
	b _08088984
	.align 2, 0
_0808897C: .4byte gUnknown_2039620
_08088980:
	adds r0, 0x1
_08088982:
	strh r0, [r1, 0xE]
_08088984:
	movs r0, 0x3
	b _080889A0
_08088988:
	ldrh r1, [r3, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0808899A
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808899E
_0808899A:
	movs r0, 0x1
	b _080889A0
_0808899E:
	movs r0, 0
_080889A0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80888C0

	thumb_func_start sub_80889A8
sub_80889A8: @ 80889A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x30
	lsls r0, 24
	lsrs r5, r0, 24
	add r4, sp, 0x2C
	ldr r1, _08088A08 @ =gUnknown_83CC363
	adds r0, r4, 0
	movs r2, 0x3
	bl memcpy
	movs r0, 0x82
	mov r8, r0
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	muls r0, r5
	adds r0, 0x2
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x46
	str r1, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x82
	adds r3, r7, 0
	bl FillWindowPixelRect
	adds r6, r4, 0
	cmp r5, 0x5
	bhi _08088ADE
	lsls r0, r5, 2
	ldr r1, _08088A0C @ =_08088A10
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088A08: .4byte gUnknown_83CC363
_08088A0C: .4byte _08088A10
	.align 2, 0
_08088A10:
	.4byte _08088A28
	.4byte _08088A38
	.4byte _08088A48
	.4byte _08088A58
	.4byte _08088A68
	.4byte _08088A9C
_08088A28:
	str r6, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r2, _08088A34 @ =gUnknown_83CC330
	b _08088A72
	.align 2, 0
_08088A34: .4byte gUnknown_83CC330
_08088A38:
	str r6, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r2, _08088A44 @ =gUnknown_83CC33C
	b _08088A72
	.align 2, 0
_08088A44: .4byte gUnknown_83CC33C
_08088A48:
	str r6, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r2, _08088A54 @ =gUnknown_83CC344
	b _08088A72
	.align 2, 0
_08088A54: .4byte gUnknown_83CC344
_08088A58:
	str r6, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r2, _08088A64 @ =gUnknown_83CC34C
	b _08088A72
	.align 2, 0
_08088A64: .4byte gUnknown_83CC34C
_08088A68:
	str r6, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r2, _08088A94 @ =gUnknown_83CC354
_08088A72:
	ldr r0, _08088A98 @ =gUnknown_2039620
	ldr r0, [r0]
	lsls r1, r5, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	mov r2, r8
	adds r3, r7, 0
	bl box_print
	b _08088ADE
	.align 2, 0
_08088A94: .4byte gUnknown_83CC354
_08088A98: .4byte gUnknown_2039620
_08088A9C:
	ldr r1, _08088AF8 @ =gUnknown_8419E52
	add r0, sp, 0xC
	bl StringCopy
	add r4, sp, 0x20
	ldr r0, _08088AFC @ =gUnknown_2039620
	ldr r0, [r0]
	lsls r1, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	add r0, sp, 0xC
	adds r1, r4, 0
	movs r2, 0x3
	bl StringAppendN
	str r6, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	mov r2, r8
	adds r3, r7, 0
	bl box_print
_08088ADE:
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088AF8: .4byte gUnknown_8419E52
_08088AFC: .4byte gUnknown_2039620
	thumb_func_end sub_80889A8

	thumb_func_start sub_8088B00
sub_8088B00: @ 8088B00
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08088BBC @ =gUnknown_3005020
	ldr r0, _08088BC0 @ =sub_807DF64
	str r0, [r1]
	ldr r0, _08088BC4 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	bl FreeAllWindowBuffers
	ldr r3, _08088BC8 @ =gSaveBlock2Ptr
	ldr r5, [r3]
	ldr r4, _08088BCC @ =gUnknown_2039620
	ldr r0, [r4]
	movs r2, 0x7
	ldrb r1, [r0]
	ands r1, r2
	ldrb r2, [r5, 0x14]
	movs r0, 0x8
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x14]
	ldr r5, [r3]
	ldr r0, [r4]
	movs r6, 0x1
	ldrb r1, [r0, 0x2]
	ands r1, r6
	lsls r1, 2
	ldrb r2, [r5, 0x15]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x15]
	ldr r5, [r3]
	ldr r0, [r4]
	ldrb r1, [r0, 0x4]
	ands r1, r6
	lsls r1, 1
	ldrb r2, [r5, 0x15]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x15]
	ldr r5, [r3]
	ldr r0, [r4]
	ldrb r1, [r0, 0x6]
	ands r1, r6
	ldrb r2, [r5, 0x15]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x15]
	ldr r1, [r3]
	ldr r0, [r4]
	ldrh r0, [r0, 0x8]
	movs r6, 0
	strb r0, [r1, 0x13]
	ldr r5, [r3]
	ldr r0, [r4]
	ldrb r1, [r0, 0xA]
	lsls r1, 3
	ldrb r2, [r5, 0x14]
	movs r0, 0x7
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x14]
	ldr r0, [r3]
	ldrb r0, [r0, 0x15]
	lsls r0, 31
	lsrs r0, 31
	bl SetPokemonCryStereo
	ldr r0, [r4]
	bl Free
	str r6, [r4]
	mov r0, r8
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088BBC: .4byte gUnknown_3005020
_08088BC0: .4byte sub_807DF64
_08088BC4: .4byte gMain
_08088BC8: .4byte gSaveBlock2Ptr
_08088BCC: .4byte gUnknown_2039620
	thumb_func_end sub_8088B00

	thumb_func_start sub_8088BD0
sub_8088BD0: @ 8088BD0
	push {lr}
	sub sp, 0xC
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _08088C08 @ =gUnknown_8419DCC
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x8
	bl PrintTextOnWindow
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08088C08: .4byte gUnknown_8419DCC
	thumb_func_end sub_8088BD0

	thumb_func_start sub_8088C0C
sub_8088C0C: @ 8088C0C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	movs r6, 0x2
	ldr r1, _08088D6C @ =0x000001b3
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r5, 0x3
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1
	movs r3, 0x2
	bl FillBgTilemapBufferRect
	movs r1, 0xDA
	lsls r1, 1
	movs r0, 0x1B
	mov r8, r0
	str r0, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x2
	movs r3, 0x2
	bl FillBgTilemapBufferRect
	ldr r1, _08088D70 @ =0x000001b5
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1C
	movs r3, 0x2
	bl FillBgTilemapBufferRect
	movs r1, 0xDB
	lsls r1, 1
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1
	movs r3, 0x3
	bl FillBgTilemapBufferRect
	movs r1, 0xDC
	lsls r1, 1
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1C
	movs r3, 0x3
	bl FillBgTilemapBufferRect
	ldr r1, _08088D74 @ =0x000001b9
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1
	movs r3, 0x5
	bl FillBgTilemapBufferRect
	movs r1, 0xDD
	lsls r1, 1
	mov r0, r8
	str r0, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x2
	movs r3, 0x5
	bl FillBgTilemapBufferRect
	ldr r1, _08088D78 @ =0x000001bb
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1C
	movs r3, 0x5
	bl FillBgTilemapBufferRect
	movs r1, 0xD5
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1
	movs r3, 0x6
	bl FillBgTilemapBufferRect
	ldr r1, _08088D7C @ =0x000001ab
	movs r0, 0x1A
	mov r8, r0
	str r0, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x2
	movs r3, 0x6
	bl FillBgTilemapBufferRect
	movs r1, 0xD6
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1C
	movs r3, 0x6
	bl FillBgTilemapBufferRect
	ldr r1, _08088D80 @ =0x000001ad
	str r4, [sp]
	movs r5, 0x10
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1
	movs r3, 0x7
	bl FillBgTilemapBufferRect
	ldr r1, _08088D84 @ =0x000001af
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1C
	movs r3, 0x7
	bl FillBgTilemapBufferRect
	movs r1, 0xD8
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	ldr r1, _08088D88 @ =0x000001b1
	mov r0, r8
	str r0, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x2
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	movs r1, 0xD9
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x1C
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088D6C: .4byte 0x000001b3
_08088D70: .4byte 0x000001b5
_08088D74: .4byte 0x000001b9
_08088D78: .4byte 0x000001bb
_08088D7C: .4byte 0x000001ab
_08088D80: .4byte 0x000001ad
_08088D84: .4byte 0x000001af
_08088D88: .4byte 0x000001b1
	thumb_func_end sub_8088C0C

	thumb_func_start sub_8088D8C
sub_8088D8C: @ 8088D8C
	push {r4,lr}
	sub sp, 0xC
	movs r0, 0x1
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r4, 0
_08088D9A:
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	adds r1, r4, 0
	muls r1, r0
	adds r1, 0x2
	subs r1, r4
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08088DDC @ =gUnknown_83CC314
	lsls r0, r4, 2
	adds r0, r2
	ldr r2, [r0]
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r3, 0x8
	bl PrintTextOnWindow
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _08088D9A
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088DDC: .4byte gUnknown_83CC314
	thumb_func_end sub_8088D8C

	thumb_func_start sub_8088DE0
sub_8088DE0: @ 8088DE0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x2
	movs r1, 0x1
	bl GetFontAttribute
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x1
	adds r2, r4, 0
	muls r2, r1
	adds r2, 0x3A
	lsls r2, 16
	lsrs r2, 16
	lsls r1, r2, 8
	adds r2, r0
	orrs r1, r2
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x44
	bl SetGpuReg
	movs r1, 0x87
	lsls r1, 5
	movs r0, 0x40
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8088DE0

	.align 2, 0 @ Don't pad with nop.
