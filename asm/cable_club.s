	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8080748
sub_8080748: @ 8080748
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _08080784 @ =sub_80809F8
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0808077C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08080788 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r6, [r1, 0xA]
	strh r5, [r1, 0xC]
_0808077C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080784: .4byte sub_80809F8
_08080788: .4byte gTasks
	thumb_func_end sub_8080748

	thumb_func_start sub_808078C
sub_808078C: @ 808078C
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080807DC @ =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl SetStdWindowBorderStyle
	ldr r5, _080807E0 @ =gStringVar4
	ldr r1, _080807E4 @ =gUnknown_841DF82
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	movs r3, 0
	bl AddTextPrinterParameterized
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080807DC: .4byte gStringVar1
_080807E0: .4byte gStringVar4
_080807E4: .4byte gUnknown_841DF82
	thumb_func_end sub_808078C

	thumb_func_start sub_80807E8
sub_80807E8: @ 80807E8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl ClearStdWindowAndFrame
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80807E8

	thumb_func_start sub_8080808
sub_8080808: @ 8080808
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08080830 @ =gTasks+0x8
	adds r4, r1, r0
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r5, r0
	beq _0808083E
	cmp r5, 0x1
	bhi _08080834
	ldrh r0, [r4, 0xA]
	bl sub_80807E8
	b _0808083C
	.align 2, 0
_08080830: .4byte gTasks+0x8
_08080834:
	ldrh r0, [r4, 0xA]
	adds r1, r5, 0
	bl sub_808078C
_0808083C:
	strh r5, [r4, 0x6]
_0808083E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8080808

	thumb_func_start sub_8080844
sub_8080844: @ 8080844
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_800A0D0
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x5
	bhi _080808B4
	lsls r0, 2
	ldr r1, _08080868 @ =_0808086C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080868: .4byte _0808086C
	.align 2, 0
_0808086C:
	.4byte _08080884
	.4byte _080808B4
	.4byte _08080888
	.4byte _0808088C
	.4byte _08080890
	.4byte _08080894
_08080884:
	movs r0, 0x1
	b _080808B6
_08080888:
	movs r0, 0x3
	b _080808B6
_0808088C:
	movs r0, 0x7
	b _080808B6
_08080890:
	movs r0, 0x9
	b _080808B6
_08080894:
	ldr r4, _080808B0 @ =gStringVar1
	bl GetLinkPlayerCount_2
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	b _080808B6
	.align 2, 0
_080808B0: .4byte gStringVar1
_080808B4:
	movs r0, 0
_080808B6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8080844

	thumb_func_start sub_80808BC
sub_80808BC: @ 80808BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl HasLinkErrorOccurred
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080808D2
	movs r0, 0
	b _080808E2
_080808D2:
	ldr r0, _080808E8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080808EC @ =sub_8080FF0
	str r0, [r1]
	movs r0, 0x1
_080808E2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080808E8: .4byte gTasks
_080808EC: .4byte sub_8080FF0
	thumb_func_end sub_80808BC

	thumb_func_start sub_80808F0
sub_80808F0: @ 80808F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08080924 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08080934
	bl IsLinkConnectionEstablished
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08080934
	ldr r0, _08080928 @ =gLinkType
	strh r1, [r0]
	ldr r1, _0808092C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08080930 @ =sub_8080FB4
	str r1, [r0]
	movs r0, 0x1
	b _08080936
	.align 2, 0
_08080924: .4byte gMain
_08080928: .4byte gLinkType
_0808092C: .4byte gTasks
_08080930: .4byte sub_8080FB4
_08080934:
	movs r0, 0
_08080936:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80808F0

	thumb_func_start sub_808093C
sub_808093C: @ 808093C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	beq _08080952
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
_08080952:
	ldr r0, _08080964 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08080968
	movs r0, 0
	b _0808097E
	.align 2, 0
_08080964: .4byte gMain
_08080968:
	ldr r1, _08080984 @ =gLinkType
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08080988 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808098C @ =sub_8080FB4
	str r1, [r0]
	movs r0, 0x1
_0808097E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08080984: .4byte gLinkType
_08080988: .4byte gTasks
_0808098C: .4byte sub_8080FB4
	thumb_func_end sub_808093C

	thumb_func_start sub_8080990
sub_8080990: @ 8080990
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetSioMultiSI
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080809A6
	movs r0, 0
	b _080809B6
_080809A6:
	ldr r0, _080809BC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080809C0 @ =sub_8080FF0
	str r0, [r1]
	movs r0, 0x1
_080809B6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080809BC: .4byte gTasks
_080809C0: .4byte sub_8080FF0
	thumb_func_end sub_8080990

	thumb_func_start sub_80809C4
sub_80809C4: @ 80809C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080809F4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080809EE
	movs r0, 0x2
	bl sub_800A474
	adds r0, r4, 0
	bl DestroyTask
_080809EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080809F4: .4byte gTasks
	thumb_func_end sub_80809C4

	thumb_func_start sub_80809F8
sub_80809F8: @ 80809F8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08080A28 @ =gTasks+0x8
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08080A30
	bl sub_800A0B4
	bl sub_800AA24
	bl sub_800A270
	ldr r0, _08080A2C @ =gUnknown_83C6AB0
	bl AddWindow
	strh r0, [r4, 0xA]
	b _08080A3C
	.align 2, 0
_08080A28: .4byte gTasks+0x8
_08080A2C: .4byte gUnknown_83C6AB0
_08080A30:
	cmp r2, 0x9
	ble _08080A3C
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _08080A48 @ =sub_8080A4C
	str r1, [r0]
_08080A3C:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080A48: .4byte sub_8080A4C
	thumb_func_end sub_80809F8

	thumb_func_start sub_8080A4C
sub_8080A4C: @ 8080A4C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl sub_80808F0
	cmp r0, 0x1
	beq _08080AC0
	adds r0, r4, 0
	bl sub_808093C
	cmp r0, 0x1
	beq _08080AC0
	cmp r5, 0x1
	bls _08080AC0
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
	ldr r1, _08080AA4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0
	strh r0, [r4, 0xE]
	bl sub_800AA48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08080AB0
	movs r0, 0x15
	bl PlaySE
	ldr r0, _08080AA8 @ =gUnknown_81BC4CE
	bl ShowFieldAutoScrollMessage
	ldr r0, _08080AAC @ =sub_8080AD0
	b _08080ABE
	.align 2, 0
_08080AA4: .4byte gTasks
_08080AA8: .4byte gUnknown_81BC4CE
_08080AAC: .4byte sub_8080AD0
_08080AB0:
	movs r0, 0x16
	bl PlaySE
	ldr r0, _08080AC8 @ =gUnknown_81BC54C
	bl ShowFieldAutoScrollMessage
	ldr r0, _08080ACC @ =sub_8080CDC
_08080ABE:
	str r0, [r4]
_08080AC0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080AC8: .4byte gUnknown_81BC54C
_08080ACC: .4byte sub_8080CDC
	thumb_func_end sub_8080A4C

	thumb_func_start sub_8080AD0
sub_8080AD0: @ 8080AD0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80808F0
	cmp r0, 0x1
	beq _08080B10
	adds r0, r4, 0
	bl sub_8080990
	cmp r0, 0x1
	beq _08080B10
	adds r0, r4, 0
	bl sub_80808BC
	cmp r0, 0x1
	beq _08080B10
	bl textbox_any_visible
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08080B10
	ldr r0, _08080B18 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0xE]
	ldr r0, _08080B1C @ =sub_8080B20
	str r0, [r1]
_08080B10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080B18: .4byte gTasks
_08080B1C: .4byte sub_8080B20
	thumb_func_end sub_8080AD0

	thumb_func_start sub_8080B20
sub_8080B20: @ 8080B20
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r8, r0
	ldr r0, _08080BB4 @ =gTasks+0x8
	mov r9, r0
	mov r7, r8
	add r7, r9
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl sub_80808F0
	cmp r0, 0x1
	beq _08080BA8
	adds r0, r4, 0
	bl sub_8080990
	cmp r0, 0x1
	beq _08080BA8
	adds r0, r4, 0
	bl sub_80808BC
	cmp r0, 0x1
	beq _08080BA8
	adds r6, r5, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8080808
	ldr r0, _08080BB8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08080BA8
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r5, r0
	blt _08080BA8
	adds r0, r6, 0
	bl sub_800A900
	ldrh r0, [r7, 0xA]
	bl sub_80807E8
	ldr r0, _08080BBC @ =gStringVar1
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, _08080BC0 @ =gUnknown_81BC50D
	bl ShowFieldAutoScrollMessage
	mov r0, r9
	subs r0, 0x8
	add r0, r8
	ldr r1, _08080BC4 @ =sub_8080BC8
	str r1, [r0]
_08080BA8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080BB4: .4byte gTasks+0x8
_08080BB8: .4byte gMain
_08080BBC: .4byte gStringVar1
_08080BC0: .4byte gUnknown_81BC50D
_08080BC4: .4byte sub_8080BC8
	thumb_func_end sub_8080B20

	thumb_func_start sub_8080BC8
sub_8080BC8: @ 8080BC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r5, 0
	bl sub_80808F0
	cmp r0, 0x1
	beq _08080C5C
	adds r0, r5, 0
	bl sub_8080990
	cmp r0, 0x1
	beq _08080C5C
	adds r0, r5, 0
	bl sub_80808BC
	cmp r0, 0x1
	beq _08080C5C
	bl textbox_any_visible
	lsls r0, 24
	cmp r0, 0
	bne _08080C5C
	bl sub_800A944
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08080C16
	ldr r0, _08080C2C @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08080C3C
_08080C16:
	ldr r0, _08080C30 @ =gUnknown_81BC4CE
	bl ShowFieldAutoScrollMessage
	ldr r1, _08080C34 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08080C38 @ =sub_8080AD0
	str r1, [r0]
	b _08080C5C
	.align 2, 0
_08080C2C: .4byte gMain
_08080C30: .4byte gUnknown_81BC4CE
_08080C34: .4byte gTasks
_08080C38: .4byte sub_8080AD0
_08080C3C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08080C5C
	movs r0, 0x5
	bl PlaySE
	bl sub_800A5BC
	ldr r0, _08080C64 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08080C68 @ =sub_8080C6C
	str r0, [r1]
_08080C5C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080C64: .4byte gTasks
_08080C68: .4byte sub_8080C6C
	thumb_func_end sub_8080BC8

	thumb_func_start sub_8080C6C
sub_8080C6C: @ 8080C6C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08080CB0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r7, [r5, 0xA]
	ldrb r6, [r5, 0xC]
	adds r0, r4, 0
	bl sub_80808BC
	cmp r0, 0x1
	beq _08080CCE
	adds r0, r4, 0
	bl sub_808102C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08080CCE
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800A944
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08080CB8
	ldr r0, _08080CB4 @ =sub_8080FF0
	b _08080CCC
	.align 2, 0
_08080CB0: .4byte gTasks
_08080CB4: .4byte sub_8080FF0
_08080CB8:
	ldr r4, _08080CD4 @ =gSpecialVar_Result
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8080844
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	beq _08080CCE
	ldr r0, _08080CD8 @ =sub_8080DC0
_08080CCC:
	str r0, [r5]
_08080CCE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080CD4: .4byte gSpecialVar_Result
_08080CD8: .4byte sub_8080DC0
	thumb_func_end sub_8080C6C

	thumb_func_start sub_8080CDC
sub_8080CDC: @ 8080CDC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08080D30 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r7, [r5, 0xA]
	ldrb r6, [r5, 0xC]
	adds r0, r4, 0
	bl sub_80808F0
	cmp r0, 0x1
	beq _08080D74
	adds r0, r4, 0
	bl sub_80808BC
	cmp r0, 0x1
	beq _08080D74
	ldr r4, _08080D34 @ =gSpecialVar_Result
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8080844
	adds r1, r0, 0
	strh r1, [r4]
	lsls r0, r1, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08080D74
	subs r0, r1, 0x3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _08080D3C
	bl sub_800AAC0
	bl HideFieldMessageBox
	ldr r0, _08080D38 @ =sub_8080F78
	b _08080D72
	.align 2, 0
_08080D30: .4byte gTasks
_08080D34: .4byte gSpecialVar_Result
_08080D38: .4byte sub_8080F78
_08080D3C:
	cmp r2, 0x7
	beq _08080D44
	cmp r2, 0x9
	bne _08080D54
_08080D44:
	bl CloseLink
	bl HideFieldMessageBox
	ldr r0, _08080D50 @ =sub_8080F78
	b _08080D72
	.align 2, 0
_08080D50: .4byte sub_8080F78
_08080D54:
	bl GetLinkPlayerCount_2
	ldr r4, _08080D7C @ =gUnknown_3005030
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _08080D80 @ =gUnknown_300502C
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_800A900
	ldr r0, _08080D84 @ =gBlockSendBuffer
	bl sub_80898E8
	ldr r0, _08080D88 @ =sub_8080E6C
_08080D72:
	str r0, [r5]
_08080D74:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080D7C: .4byte gUnknown_3005030
_08080D80: .4byte gUnknown_300502C
_08080D84: .4byte gBlockSendBuffer
_08080D88: .4byte sub_8080E6C
	thumb_func_end sub_8080CDC

	thumb_func_start sub_8080D8C
sub_8080D8C: @ 8080D8C
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _08080D94 @ =gLinkPlayers
	b _08080DAC
	.align 2, 0
_08080D94: .4byte gLinkPlayers
_08080D98:
	ldrb r0, [r4]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _08080DA8
	movs r0, 0x1
	b _08080DBA
_08080DA8:
	adds r4, 0x1C
	adds r5, 0x1
_08080DAC:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	blt _08080D98
	movs r0, 0
_08080DBA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8080D8C

	thumb_func_start sub_8080DC0
sub_8080DC0: @ 8080DC0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80808BC
	cmp r0, 0x1
	beq _08080E50
	ldr r0, _08080DE8 @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0x4
	bne _08080DEC
	bl sub_8080D8C
	cmp r0, 0x1
	beq _08080DFE
	bl sub_800AAC0
	b _08080E02
	.align 2, 0
_08080DE8: .4byte gSpecialVar_Result
_08080DEC:
	cmp r0, 0x3
	bne _08080DF6
	bl sub_800AAC0
	b _08080E02
_08080DF6:
	cmp r0, 0x7
	beq _08080DFE
	cmp r0, 0x9
	bne _08080E20
_08080DFE:
	bl CloseLink
_08080E02:
	bl HideFieldMessageBox
	ldr r0, _08080E18 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08080E1C @ =sub_8080F78
	str r0, [r1]
	b _08080E50
	.align 2, 0
_08080E18: .4byte gTasks
_08080E1C: .4byte sub_8080F78
_08080E20:
	bl GetLinkPlayerCount_2
	ldr r4, _08080E58 @ =gUnknown_3005030
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _08080E5C @ =gUnknown_300502C
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_800A900
	ldr r0, _08080E60 @ =gBlockSendBuffer
	bl sub_80898E8
	ldr r1, _08080E64 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08080E68 @ =sub_8080E6C
	str r1, [r0]
	movs r0, 0x2
	bl sub_800A474
_08080E50:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080E58: .4byte gUnknown_3005030
_08080E5C: .4byte gUnknown_300502C
_08080E60: .4byte gBlockSendBuffer
_08080E64: .4byte gTasks
_08080E68: .4byte sub_8080E6C
	thumb_func_end sub_8080DC0

	thumb_func_start sub_8080E6C
sub_8080E6C: @ 8080E6C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r7, 0
	bl sub_80808BC
	cmp r0, 0x1
	beq _08080F66
	bl GetBlockReceivedStatus
	adds r4, r0, 0
	bl sub_800A8A4
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08080F66
	movs r5, 0
	lsls r0, r7, 2
	mov r8, r0
	b _08080EF8
_08080E9A:
	ldr r1, _08080ED0 @ =gLinkPlayers
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r6, r0, r1
	ldrb r0, [r6]
	subs r0, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _08080EDC
	lsls r1, r5, 8
	ldr r0, _08080ED4 @ =gBlockRecvBuffer
	adds r1, r0
	ldr r0, _08080ED8 @ =gUnknown_2039624
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 5
	adds r4, r0
	adds r0, r4, 0
	movs r2, 0x38
	bl memcpy
	ldrh r0, [r6]
	adds r4, 0x38
	strb r0, [r4]
	b _08080EF2
	.align 2, 0
_08080ED0: .4byte gLinkPlayers
_08080ED4: .4byte gBlockRecvBuffer
_08080ED8: .4byte gUnknown_2039624
_08080EDC:
	lsls r1, r5, 8
	ldr r0, _08080F3C @ =gBlockRecvBuffer
	adds r1, r0
	ldr r2, _08080F40 @ =gUnknown_2039624
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 5
	adds r0, r2
	movs r2, 0x60
	bl memcpy
_08080EF2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08080EF8:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcc _08080E9A
	movs r0, 0
	bl SetSuppressLinkErrorMessage
	bl ResetBlockReceivedFlags
	bl HideFieldMessageBox
	ldr r0, _08080F44 @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _08080F54
	ldr r0, _08080F48 @ =gLinkType
	ldrh r1, [r0]
	ldr r0, _08080F4C @ =0x00004411
	ldr r0, _08080F50 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x12]
	bl sub_80807E8
	bl EnableBothScriptContexts
	adds r0, r7, 0
	bl DestroyTask
	b _08080F66
	.align 2, 0
_08080F3C: .4byte gBlockRecvBuffer
_08080F40: .4byte gUnknown_2039624
_08080F44: .4byte gSpecialVar_Result
_08080F48: .4byte gLinkType
_08080F4C: .4byte 0x00004411
_08080F50: .4byte gTasks
_08080F54:
	bl sub_800AAC0
	ldr r0, _08080F70 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08080F74 @ =sub_8080F78
	str r0, [r1]
_08080F66:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080F70: .4byte gTasks
_08080F74: .4byte sub_8080F78
	thumb_func_end sub_8080E6C

	thumb_func_start sub_8080F78
sub_8080F78: @ 8080F78
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08080FAC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080FA6
	ldr r0, _08080FB0 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x12]
	bl sub_80807E8
	bl EnableBothScriptContexts
	ldrb r0, [r4, 0x12]
	bl RemoveWindow
	adds r0, r5, 0
	bl DestroyTask
_08080FA6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080FAC: .4byte gReceivedRemoteLinkPlayers
_08080FB0: .4byte gTasks
	thumb_func_end sub_8080F78

	thumb_func_start sub_8080FB4
sub_8080FB4: @ 8080FB4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08080FE8 @ =gSpecialVar_Result
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _08080FEC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x12]
	bl sub_80807E8
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080FE8: .4byte gSpecialVar_Result
_08080FEC: .4byte gTasks
	thumb_func_end sub_8080FB4

	thumb_func_start sub_8080FF0
sub_8080FF0: @ 8080FF0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08081024 @ =gSpecialVar_Result
	movs r0, 0x6
	strh r0, [r1]
	ldr r1, _08081028 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x12]
	bl sub_80807E8
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081024: .4byte gSpecialVar_Result
_08081028: .4byte gTasks
	thumb_func_end sub_8080FF0

	thumb_func_start sub_808102C
sub_808102C: @ 808102C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08081050 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 18
	cmp r0, r1
	bgt _08081054
	movs r0, 0
	b _0808105A
	.align 2, 0
_08081050: .4byte gTasks
_08081054:
	ldr r0, _08081060 @ =sub_8080FF0
	str r0, [r2]
	movs r0, 0x1
_0808105A:
	pop {r1}
	bx r1
	.align 2, 0
_08081060: .4byte sub_8080FF0
	thumb_func_end sub_808102C

	thumb_func_start sub_8081064
sub_8081064: @ 8081064
	push {r4,lr}
	movs r3, 0x2
	movs r2, 0x2
	ldr r0, _0808107C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _08081098
	cmp r0, 0x2
	bgt _08081080
	cmp r0, 0x1
	beq _08081086
	b _080810B4
	.align 2, 0
_0808107C: .4byte gSpecialVar_0x8004
_08081080:
	cmp r0, 0x5
	beq _080810A8
	b _080810B4
_08081086:
	movs r3, 0x2
	ldr r1, _08081090 @ =gLinkType
	ldr r4, _08081094 @ =0x00002233
	b _080810B0
	.align 2, 0
_08081090: .4byte gLinkType
_08081094: .4byte 0x00002233
_08081098:
	movs r3, 0x2
	ldr r1, _080810A0 @ =gLinkType
	ldr r4, _080810A4 @ =0x00002244
	b _080810B0
	.align 2, 0
_080810A0: .4byte gLinkType
_080810A4: .4byte 0x00002244
_080810A8:
	movs r3, 0x4
	movs r2, 0x4
	ldr r1, _080810C4 @ =gLinkType
	ldr r4, _080810C8 @ =0x00002255
_080810B0:
	adds r0, r4, 0
	strh r0, [r1]
_080810B4:
	adds r0, r3, 0
	adds r1, r2, 0
	bl sub_8080748
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080810C4: .4byte gLinkType
_080810C8: .4byte 0x00002255
	thumb_func_end sub_8081064

	thumb_func_start sub_80810CC
sub_80810CC: @ 80810CC
	push {lr}
	ldr r1, _080810E8 @ =gLinkType
	ldr r2, _080810EC @ =0x00001133
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080810F0 @ =gBattleTypeFlags
	movs r0, 0
	str r0, [r1]
	movs r0, 0x2
	movs r1, 0x2
	bl sub_8080748
	pop {r0}
	bx r0
	.align 2, 0
_080810E8: .4byte gLinkType
_080810EC: .4byte 0x00001133
_080810F0: .4byte gBattleTypeFlags
	thumb_func_end sub_80810CC

	thumb_func_start sub_80810F4
sub_80810F4: @ 80810F4
	push {lr}
	ldr r1, _08081118 @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0808111C @ =gLinkType
	ldr r2, _08081120 @ =0x00003311
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08081124 @ =gBattleTypeFlags
	movs r0, 0
	str r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	bl sub_8080748
	pop {r0}
	bx r0
	.align 2, 0
_08081118: .4byte gSpecialVar_Result
_0808111C: .4byte gLinkType
_08081120: .4byte 0x00003311
_08081124: .4byte gBattleTypeFlags
	thumb_func_end sub_80810F4

	thumb_func_start sub_8081128
sub_8081128: @ 8081128
	push {lr}
	ldr r1, _08081144 @ =gLinkType
	ldr r2, _08081148 @ =0x00006601
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0808114C @ =gBattleTypeFlags
	movs r0, 0
	str r0, [r1]
	movs r0, 0x4
	movs r1, 0x4
	bl sub_8080748
	pop {r0}
	bx r0
	.align 2, 0
_08081144: .4byte gLinkType
_08081148: .4byte 0x00006601
_0808114C: .4byte gBattleTypeFlags
	thumb_func_end sub_8081128

	thumb_func_start sub_8081150
sub_8081150: @ 8081150
	push {lr}
	ldr r0, _08081164 @ =sub_80811FC
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08081168
	movs r0, 0xFF
	b _080811EC
	.align 2, 0
_08081164: .4byte sub_80811FC
_08081168:
	ldr r0, _0808117C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x4
	bhi _080811E0
	lsls r0, 2
	ldr r1, _08081180 @ =_08081184
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808117C: .4byte gSpecialVar_0x8004
_08081180: .4byte _08081184
	.align 2, 0
_08081184:
	.4byte _08081198
	.4byte _080811A8
	.4byte _080811C8
	.4byte _080811D8
	.4byte _080811B8
_08081198:
	ldr r1, _080811A0 @ =gLinkType
	ldr r2, _080811A4 @ =0x00002233
	b _080811DC
	.align 2, 0
_080811A0: .4byte gLinkType
_080811A4: .4byte 0x00002233
_080811A8:
	ldr r1, _080811B0 @ =gLinkType
	ldr r2, _080811B4 @ =0x00002244
	b _080811DC
	.align 2, 0
_080811B0: .4byte gLinkType
_080811B4: .4byte 0x00002244
_080811B8:
	ldr r1, _080811C0 @ =gLinkType
	ldr r2, _080811C4 @ =0x00002255
	b _080811DC
	.align 2, 0
_080811C0: .4byte gLinkType
_080811C4: .4byte 0x00002255
_080811C8:
	ldr r1, _080811D0 @ =gLinkType
	ldr r2, _080811D4 @ =0x00001111
	b _080811DC
	.align 2, 0
_080811D0: .4byte gLinkType
_080811D4: .4byte 0x00001111
_080811D8:
	ldr r1, _080811F0 @ =gLinkType
	ldr r2, _080811F4 @ =0x00003322
_080811DC:
	adds r0, r2, 0
	strh r0, [r1]
_080811E0:
	ldr r0, _080811F8 @ =sub_80811FC
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
_080811EC:
	pop {r1}
	bx r1
	.align 2, 0
_080811F0: .4byte gLinkType
_080811F4: .4byte 0x00003322
_080811F8: .4byte sub_80811FC
	thumb_func_end sub_8081150

	thumb_func_start sub_80811FC
sub_80811FC: @ 80811FC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08081228 @ =gTasks+0x8
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08081230
	bl sub_8009804
	bl sub_800A270
	ldr r0, _0808122C @ =sub_8081A90
	movs r1, 0x50
	bl CreateTask
	b _0808123C
	.align 2, 0
_08081228: .4byte gTasks+0x8
_0808122C: .4byte sub_8081A90
_08081230:
	cmp r2, 0x9
	ble _0808123C
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _08081248 @ =sub_808124C
	str r1, [r0]
_0808123C:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081248: .4byte sub_808124C
	thumb_func_end sub_80811FC

	thumb_func_start sub_808124C
sub_808124C: @ 808124C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08081292
	bl sub_800AA48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081284
	ldr r0, _0808127C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08081280 @ =sub_80812A0
	b _08081290
	.align 2, 0
_0808127C: .4byte gTasks
_08081280: .4byte sub_80812A0
_08081284:
	ldr r0, _08081298 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808129C @ =sub_80812D8
_08081290:
	str r0, [r1]
_08081292:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081298: .4byte gTasks
_0808129C: .4byte sub_80812D8
	thumb_func_end sub_808124C

	thumb_func_start sub_80812A0
sub_80812A0: @ 80812A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_800A944
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080812CA
	bl sub_800A5BC
	ldr r0, _080812D0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080812D4 @ =sub_80812D8
	str r0, [r1]
_080812CA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080812D0: .4byte gTasks
_080812D4: .4byte sub_80812D8
	thumb_func_end sub_80812A0

	thumb_func_start sub_80812D8
sub_80812D8: @ 80812D8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08081308 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08081300
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081300
	bl sub_800A9A4
	bl sub_8009FE8
	adds r0, r4, 0
	bl DestroyTask
_08081300:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081308: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80812D8

	thumb_func_start sub_808130C
sub_808130C: @ 808130C
	push {lr}
	bl sub_806F67C
	pop {r0}
	bx r0
	thumb_func_end sub_808130C

	thumb_func_start sub_8081318
sub_8081318: @ 8081318
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0808133C @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _08081332
	b _0808143A
_08081332:
	lsls r0, 2
	ldr r1, _08081340 @ =_08081344
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808133C: .4byte gTasks
_08081340: .4byte _08081344
	.align 2, 0
_08081344:
	.4byte _0808135C
	.4byte _0808137C
	.4byte _0808138C
	.4byte _0808139C
	.4byte _080813A2
	.4byte _080813B8
_0808135C:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08081374 @ =gLinkType
	ldr r2, _08081378 @ =0x00002211
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_800A068
	b _080813AA
	.align 2, 0
_08081374: .4byte gLinkType
_08081378: .4byte 0x00002211
_0808137C:
	ldr r0, _08081388 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	b _080813A6
	.align 2, 0
_08081388: .4byte gPaletteFade
_0808138C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _0808143A
	b _080813AA
_0808139C:
	bl sub_800AAC0
	b _080813AA
_080813A2:
	ldr r0, _080813B4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
_080813A6:
	cmp r0, 0
	bne _0808143A
_080813AA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0808143A
	.align 2, 0
_080813B4: .4byte gReceivedRemoteLinkPlayers
_080813B8:
	ldr r0, _080813CC @ =gLinkPlayers
	ldr r0, [r0, 0x4]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080813D4
	ldr r0, _080813D0 @ =0x00000109
	bl PlayMapChosenOrBattleBGM
	b _080813DC
	.align 2, 0
_080813CC: .4byte gLinkPlayers
_080813D0: .4byte 0x00000109
_080813D4:
	movs r0, 0x85
	lsls r0, 1
	bl PlayMapChosenOrBattleBGM
_080813DC:
	ldr r0, _080813F0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _08081404
	cmp r0, 0x2
	bgt _080813F4
	cmp r0, 0x1
	beq _080813FA
	b _0808141A
	.align 2, 0
_080813F0: .4byte gSpecialVar_0x8004
_080813F4:
	cmp r0, 0x5
	beq _08081410
	b _0808141A
_080813FA:
	ldr r1, _08081400 @ =gBattleTypeFlags
	movs r0, 0xA
	b _08081418
	.align 2, 0
_08081400: .4byte gBattleTypeFlags
_08081404:
	ldr r1, _0808140C @ =gBattleTypeFlags
	movs r0, 0xB
	b _08081418
	.align 2, 0
_0808140C: .4byte gBattleTypeFlags
_08081410:
	bl sub_80A03D8
	ldr r1, _08081440 @ =gBattleTypeFlags
	movs r0, 0x4B
_08081418:
	str r0, [r1]
_0808141A:
	bl CleanupOverworldWindowsAndTilemaps
	ldr r1, _08081444 @ =gTrainerBattleOpponent_A
	movs r2, 0x80
	lsls r2, 4
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08081448 @ =sub_800FD9C
	bl SetMainCallback2
	ldr r1, _0808144C @ =gMain
	ldr r0, _08081450 @ =sub_8081668
	str r0, [r1, 0x8]
	adds r0, r5, 0
	bl DestroyTask
_0808143A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081440: .4byte gBattleTypeFlags
_08081444: .4byte gTrainerBattleOpponent_A
_08081448: .4byte sub_800FD9C
_0808144C: .4byte gMain
_08081450: .4byte sub_8081668
	thumb_func_end sub_8081318

	thumb_func_start sub_8081454
sub_8081454: @ 8081454
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08081478 @ =gTasks+0x8
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x7
	bls _0808146E
	b _0808160A
_0808146E:
	lsls r0, 2
	ldr r1, _0808147C @ =_08081480
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08081478: .4byte gTasks+0x8
_0808147C: .4byte _08081480
	.align 2, 0
_08081480:
	.4byte _080814A0
	.4byte _080814C4
	.4byte _080814DC
	.4byte _080814F0
	.4byte _0808154C
	.4byte _08081560
	.4byte _0808156A
	.4byte _0808157A
_080814A0:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080814BC @ =gLinkType
	ldr r2, _080814C0 @ =0x00002211
	adds r1, r2, 0
	strh r1, [r0]
	bl sub_800A068
	movs r0, 0x1
	strh r0, [r6]
	b _0808160A
	.align 2, 0
_080814BC: .4byte gLinkType
_080814C0: .4byte 0x00002211
_080814C4:
	ldr r0, _080814D8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080814D2
	b _0808160A
_080814D2:
	movs r0, 0x2
	strh r0, [r6]
	b _0808160A
	.align 2, 0
_080814D8: .4byte gPaletteFade
_080814DC:
	ldr r1, _080814EC @ =gLocalLinkPlayer
	movs r0, 0
	movs r2, 0x1C
	bl SendBlock
	movs r0, 0x3
	strh r0, [r6]
	b _0808160A
	.align 2, 0
_080814EC: .4byte gLocalLinkPlayer
_080814F0:
	bl GetBlockReceivedStatus
	adds r4, r0, 0
	bl sub_800A8D4
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08081504
	b _0808160A
_08081504:
	movs r4, 0
	ldr r5, _0808150C @ =gLinkPlayers
	b _08081536
	.align 2, 0
_0808150C: .4byte gLinkPlayers
_08081510:
	lsls r1, r4, 8
	ldr r2, _08081548 @ =gBlockRecvBuffer
	adds r0, r5, 0
	adds r1, r2
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r5, 0
	bl sub_800B284
	lsls r0, r4, 24
	lsrs r0, 24
	bl ResetBlockReceivedFlag
	adds r5, 0x1C
	adds r4, 0x1
_08081536:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _08081510
	movs r0, 0x4
	strh r0, [r6]
	b _0808160A
	.align 2, 0
_08081548: .4byte gBlockRecvBuffer
_0808154C:
	ldrh r0, [r6, 0x2]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _0808160A
	movs r0, 0x5
	strh r0, [r6]
	b _0808160A
_08081560:
	bl sub_800AB9C
	movs r0, 0x6
	strh r0, [r6]
	b _0808160A
_0808156A:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0808160A
	movs r0, 0x7
	strh r0, [r6]
	b _0808160A
_0808157A:
	ldr r0, _08081590 @ =gLinkPlayers
	ldr r0, [r0, 0x4]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08081598
	ldr r0, _08081594 @ =0x00000109
	bl PlayMapChosenOrBattleBGM
	b _080815A0
	.align 2, 0
_08081590: .4byte gLinkPlayers
_08081594: .4byte 0x00000109
_08081598:
	movs r0, 0x85
	lsls r0, 1
	bl PlayMapChosenOrBattleBGM
_080815A0:
	ldr r0, _080815B8 @ =gLinkPlayers
	ldr r1, _080815BC @ =0x00002211
	str r1, [r0, 0x14]
	ldr r0, _080815C0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _080815D4
	cmp r0, 0x2
	bgt _080815C4
	cmp r0, 0x1
	beq _080815CA
	b _080815EA
	.align 2, 0
_080815B8: .4byte gLinkPlayers
_080815BC: .4byte 0x00002211
_080815C0: .4byte gSpecialVar_0x8004
_080815C4:
	cmp r0, 0x5
	beq _080815E0
	b _080815EA
_080815CA:
	ldr r1, _080815D0 @ =gBattleTypeFlags
	movs r0, 0xA
	b _080815E8
	.align 2, 0
_080815D0: .4byte gBattleTypeFlags
_080815D4:
	ldr r1, _080815DC @ =gBattleTypeFlags
	movs r0, 0xB
	b _080815E8
	.align 2, 0
_080815DC: .4byte gBattleTypeFlags
_080815E0:
	bl sub_80A03D8
	ldr r1, _08081610 @ =gBattleTypeFlags
	movs r0, 0x4B
_080815E8:
	str r0, [r1]
_080815EA:
	bl CleanupOverworldWindowsAndTilemaps
	ldr r1, _08081614 @ =gTrainerBattleOpponent_A
	movs r3, 0x80
	lsls r3, 4
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08081618 @ =sub_800FD9C
	bl SetMainCallback2
	ldr r1, _0808161C @ =gMain
	ldr r0, _08081620 @ =sub_8081668
	str r0, [r1, 0x8]
	adds r0, r4, 0
	bl DestroyTask
_0808160A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081610: .4byte gBattleTypeFlags
_08081614: .4byte gTrainerBattleOpponent_A
_08081618: .4byte sub_800FD9C
_0808161C: .4byte gMain
_08081620: .4byte sub_8081668
	thumb_func_end sub_8081454

	thumb_func_start sub_8081624
sub_8081624: @ 8081624
	push {r4,lr}
	ldr r0, _0808163C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _08081640
	cmp r0, 0x1
	beq _0808164C
	b _0808165C
	.align 2, 0
_0808163C: .4byte gMain
_08081640:
	bl sub_800AAC0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0808165C
_0808164C:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0808165C
	ldr r0, _08081664 @ =CB2_ReturnToField
	bl SetMainCallback2
_0808165C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081664: .4byte CB2_ReturnToField
	thumb_func_end sub_8081624

	thumb_func_start sub_8081668
sub_8081668: @ 8081668
	push {r4,r5,lr}
	ldr r2, _080816B0 @ =gBattleTypeFlags
	ldr r0, [r2]
	ldr r1, _080816B4 @ =0x0000ffdf
	ands r0, r1
	str r0, [r2]
	bl sub_8055DB8
	bl LoadPlayerParty
	bl SavePlayerBag
	bl sub_81134B8
	ldr r0, _080816B8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _0808170A
	ldr r0, _080816BC @ =gUnknown_300502C
	ldrb r0, [r0]
	movs r5, 0x1
	eors r0, r5
	bl sub_80CD98C
	ldr r0, _080816C0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808170A
	ldr r0, _080816C4 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080816C8
	cmp r0, 0x2
	beq _080816EC
	b _0808170A
	.align 2, 0
_080816B0: .4byte gBattleTypeFlags
_080816B4: .4byte 0x0000ffdf
_080816B8: .4byte gSpecialVar_0x8004
_080816BC: .4byte gUnknown_300502C
_080816C0: .4byte gWirelessCommType
_080816C4: .4byte gBattleOutcome
_080816C8:
	ldr r4, _080816E8 @ =gLinkPlayers
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, 0x4
	adds r1, r4
	ldr r1, [r1]
	movs r0, 0
	bl sub_8144714
	b _0808170A
	.align 2, 0
_080816E8: .4byte gLinkPlayers
_080816EC:
	ldr r4, _08081718 @ =gLinkPlayers
	bl GetMultiplayerId
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, 0x4
	adds r1, r4
	ldr r1, [r1]
	movs r0, 0x1
	bl sub_8144714
_0808170A:
	bl InUnionRoom
	cmp r0, 0x1
	bne _08081724
	ldr r1, _0808171C @ =gMain
	ldr r0, _08081720 @ =sub_8081624
	b _08081728
	.align 2, 0
_08081718: .4byte gLinkPlayers
_0808171C: .4byte gMain
_08081720: .4byte sub_8081624
_08081724:
	ldr r1, _08081738 @ =gMain
	ldr r0, _0808173C @ =c2_8056854
_08081728:
	str r0, [r1, 0x8]
	ldr r0, _08081740 @ =sub_806FB7C
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081738: .4byte gMain
_0808173C: .4byte c2_8056854
_08081740: .4byte sub_806FB7C
	thumb_func_end sub_8081668

	thumb_func_start sub_8081744
sub_8081744: @ 8081744
	push {lr}
	ldr r0, _0808176C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _08081758
	cmp r1, 0x5
	bne _08081760
_08081758:
	bl LoadPlayerParty
	bl SavePlayerBag
_08081760:
	movs r0, 0x7F
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	pop {r0}
	bx r0
	.align 2, 0
_0808176C: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8081744

	thumb_func_start sub_8081770
sub_8081770: @ 8081770
	push {lr}
	bl sub_8057F5C
	pop {r0}
	bx r0
	thumb_func_end sub_8081770

	thumb_func_start sub_808177C
sub_808177C: @ 808177C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080817A0 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080817C0
	cmp r0, 0x1
	bgt _080817A4
	cmp r0, 0
	beq _080817AE
	b _08081820
	.align 2, 0
_080817A0: .4byte gTasks
_080817A4:
	cmp r0, 0x2
	beq _080817E0
	cmp r0, 0x3
	beq _0808180C
	b _08081820
_080817AE:
	ldr r0, _080817BC @ =gUnknown_81BC4AC
	bl ShowFieldMessage
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _08081820
	.align 2, 0
_080817BC: .4byte gUnknown_81BC4AC
_080817C0:
	bl IsFieldMessageBoxHidden
	lsls r0, 24
	cmp r0, 0
	beq _08081820
	bl sub_8057F34
	ldr r0, _080817DC @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	bl sub_80096F8
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _08081820
	.align 2, 0
_080817DC: .4byte gSpecialVar_0x8005
_080817E0:
	bl sub_8057EC0
	cmp r0, 0x1
	beq _080817F2
	cmp r0, 0x1
	bcc _08081820
	cmp r0, 0x2
	beq _08081806
	b _08081820
_080817F2:
	bl HideFieldMessageBox
	movs r0, 0
	strh r0, [r5, 0x8]
	bl sub_8057F70
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
	b _08081820
_08081806:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08081820
_0808180C:
	bl sub_8057F48
	movs r0, 0x1
	bl sub_80F771C
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08081820:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808177C

	thumb_func_start sub_8081828
sub_8081828: @ 8081828
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0808184C @ =sub_808177C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808184C: .4byte sub_808177C
	thumb_func_end sub_8081828

	thumb_func_start sub_8081850
sub_8081850: @ 8081850
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081874 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081894
	cmp r0, 0x1
	bgt _08081878
	cmp r0, 0
	beq _08081882
	b _080818D8
	.align 2, 0
_08081874: .4byte gTasks
_08081878:
	cmp r0, 0x2
	beq _080818A8
	cmp r0, 0x3
	beq _080818C4
	b _080818D8
_08081882:
	bl ScriptContext2_Enable
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl sub_800A068
	b _080818B8
_08081894:
	ldr r0, _080818A4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080818D8
	b _080818B8
	.align 2, 0
_080818A4: .4byte gPaletteFade
_080818A8:
	ldr r1, _080818C0 @ =gUnknown_2031DA4
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	bl m4aMPlayAllStop
	bl sub_800AAC0
_080818B8:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080818D8
	.align 2, 0
_080818C0: .4byte gUnknown_2031DA4
_080818C4:
	ldr r0, _080818E0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080818D8
	ldr r0, _080818E4 @ =sub_804C718
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_080818D8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080818E0: .4byte gReceivedRemoteLinkPlayers
_080818E4: .4byte sub_804C718
	thumb_func_end sub_8081850

	thumb_func_start sub_80818E8
sub_80818E8: @ 80818E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0808190C @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0808192C
	cmp r0, 0x1
	bgt _08081910
	cmp r0, 0
	beq _0808191A
	b _08081970
	.align 2, 0
_0808190C: .4byte gTasks+0x8
_08081910:
	cmp r0, 0x2
	beq _08081940
	cmp r0, 0x3
	beq _0808195C
	b _08081970
_0808191A:
	bl ScriptContext2_Enable
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl sub_80F985C
	b _08081950
_0808192C:
	ldr r0, _0808193C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08081970
	b _08081950
	.align 2, 0
_0808193C: .4byte gPaletteFade
_08081940:
	ldr r1, _08081958 @ =gUnknown_2031DA4
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	bl m4aMPlayAllStop
	bl sub_800AB9C
_08081950:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08081970
	.align 2, 0
_08081958: .4byte gUnknown_2031DA4
_0808195C:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _08081970
	bl sub_8117118
	adds r0, r5, 0
	bl DestroyTask
_08081970:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80818E8

	thumb_func_start sub_8081978
sub_8081978: @ 8081978
	push {lr}
	ldr r0, _0808198C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08081994
	ldr r0, _08081990 @ =sub_80818E8
	bl sub_8081828
	b _0808199A
	.align 2, 0
_0808198C: .4byte gWirelessCommType
_08081990: .4byte sub_80818E8
_08081994:
	ldr r0, _080819A0 @ =sub_8081850
	bl sub_8081828
_0808199A:
	pop {r0}
	bx r0
	.align 2, 0
_080819A0: .4byte sub_8081850
	thumb_func_end sub_8081978

	thumb_func_start sub_80819A4
sub_80819A4: @ 80819A4
	push {lr}
	ldr r0, _080819B4 @ =sub_8081850
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080819B4: .4byte sub_8081850
	thumb_func_end sub_80819A4

	thumb_func_start sub_80819B8
sub_80819B8: @ 80819B8
	push {lr}
	bl sub_80819A4
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	thumb_func_end sub_80819B8

	thumb_func_start sub_80819C8
sub_80819C8: @ 80819C8
	push {lr}
	ldr r1, _080819E4 @ =gLinkType
	ldr r2, _080819E8 @ =0x00002211
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080819EC @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _080819F4
	ldr r0, _080819F0 @ =sub_8081454
	bl sub_8081828
	b _080819FA
	.align 2, 0
_080819E4: .4byte gLinkType
_080819E8: .4byte 0x00002211
_080819EC: .4byte gWirelessCommType
_080819F0: .4byte sub_8081454
_080819F4:
	ldr r0, _08081A00 @ =sub_8081318
	bl sub_8081828
_080819FA:
	pop {r0}
	bx r0
	.align 2, 0
_08081A00: .4byte sub_8081318
	thumb_func_end sub_80819C8

	thumb_func_start sub_8081A04
sub_8081A04: @ 8081A04
	push {lr}
	ldr r0, _08081A18 @ =sub_808177C
	movs r1, 0x50
	bl CreateTask
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_08081A18: .4byte sub_808177C
	thumb_func_end sub_8081A04

	thumb_func_start sp02A_crash_sound
sp02A_crash_sound: @ 8081A1C
	push {lr}
	ldr r0, _08081A2C @ =gSpecialVar_0x8006
	ldrb r0, [r0]
	ldr r1, _08081A30 @ =CB2_ReturnToFieldContinueScriptPlayMapMusic
	bl sub_808B700
	pop {r0}
	bx r0
	.align 2, 0
_08081A2C: .4byte gSpecialVar_0x8006
_08081A30: .4byte CB2_ReturnToFieldContinueScriptPlayMapMusic
	thumb_func_end sp02A_crash_sound

	thumb_func_start sub_8081A34
sub_8081A34: @ 8081A34
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08081A74 @ =gSpecialVar_0x8006
	strh r4, [r0]
	ldr r0, _08081A78 @ =gStringVar1
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r2, _08081A7C @ =gLinkPlayers + 8
	adds r1, r2
	bl StringCopy
	adds r0, r4, 0
	bl sub_808B1BC
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08081A88
	ldr r0, _08081A80 @ =gStringVar2
	ldr r2, _08081A84 @ =gUnknown_83C6AB8
	subs r1, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x1
	b _08081A8A
	.align 2, 0
_08081A74: .4byte gSpecialVar_0x8006
_08081A78: .4byte gStringVar1
_08081A7C: .4byte gLinkPlayers + 8
_08081A80: .4byte gStringVar2
_08081A84: .4byte gUnknown_83C6AB8
_08081A88:
	movs r0, 0
_08081A8A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8081A34

	thumb_func_start sub_8081A90
sub_8081A90: @ 8081A90
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08081AD8 @ =gTasks
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 17
	cmp r1, r0
	ble _08081AC2
	bl CloseLink
	ldr r0, _08081ADC @ =c2_800ACD4
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08081AC2:
	ldr r0, _08081AE0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08081AD0
	adds r0, r5, 0
	bl DestroyTask
_08081AD0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081AD8: .4byte gTasks
_08081ADC: .4byte c2_800ACD4
_08081AE0: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8081A90

	thumb_func_start sub_8081AE4
sub_8081AE4: @ 8081AE4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08081B04 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08081AFC
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08081AFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081B04: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8081AE4

	thumb_func_start sub_8081B08
sub_8081B08: @ 8081B08
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800AAC0
	ldr r1, _08081B28 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08081B2C @ =sub_8081AE4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081B28: .4byte gTasks
_08081B2C: .4byte sub_8081AE4
	thumb_func_end sub_8081B08

	.align 2, 0 @ Don't pad with nop.
