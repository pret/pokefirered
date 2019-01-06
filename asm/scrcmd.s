	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ScrCmd_pokemartdecoration
ScrCmd_pokemartdecoration: @ 806C3C0
	push {lr}
	bl ScriptReadWord
	bl sub_809C1A0
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemartdecoration

	thumb_func_start ScrCmd_pokemartdecoration2
ScrCmd_pokemartdecoration2: @ 806C3D4
	push {lr}
	bl ScriptReadWord
	bl sub_809C1BC
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemartdecoration2

	thumb_func_start ScrCmd_playslotmachine
ScrCmd_playslotmachine: @ 806C3E8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806C40C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl sub_813F804
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806C40C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end ScrCmd_playslotmachine

	thumb_func_start ScrCmd_setberrytree
ScrCmd_setberrytree: @ 806C410
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_setberrytree

	thumb_func_start ScrCmd_getpricereduction
ScrCmd_getpricereduction: @ 806C414
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_getpricereduction

	thumb_func_start ScrCmd_choosecontestmon
ScrCmd_choosecontestmon: @ 806C418
	push {lr}
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_choosecontestmon

	thumb_func_start ScrCmd_startcontest
ScrCmd_startcontest: @ 806C424
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_startcontest

	thumb_func_start ScrCmd_showcontestresults
ScrCmd_showcontestresults: @ 806C428
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_showcontestresults

	thumb_func_start ScrCmd_contestlinktransfer
ScrCmd_contestlinktransfer: @ 806C42C
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_contestlinktransfer

	thumb_func_start ScrCmd_dofieldeffect
ScrCmd_dofieldeffect: @ 806C430
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0806C454 @ =gUnknown_20370B6
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl FieldEffectStart
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C454: .4byte gUnknown_20370B6
	thumb_func_end ScrCmd_dofieldeffect

	thumb_func_start ScrCmd_setfieldeffectarg
ScrCmd_setfieldeffectarg: @ 806C458
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _0806C484 @ =gFieldEffectArguments
	lsls r4, 2
	adds r4, r1
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C484: .4byte gFieldEffectArguments
	thumb_func_end ScrCmd_setfieldeffectarg

	thumb_func_start WaitForFieldEffectFinish
WaitForFieldEffectFinish: @ 806C488
	push {lr}
	ldr r0, _0806C49C @ =gUnknown_20370B6
	ldrb r0, [r0]
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	beq _0806C4A0
	movs r0, 0
	b _0806C4A2
	.align 2, 0
_0806C49C: .4byte gUnknown_20370B6
_0806C4A0:
	movs r0, 0x1
_0806C4A2:
	pop {r1}
	bx r1
	thumb_func_end WaitForFieldEffectFinish

	thumb_func_start ScrCmd_waitfieldeffect
ScrCmd_waitfieldeffect: @ 806C4A8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _0806C4CC @ =gUnknown_20370B6
	strh r0, [r1]
	ldr r1, _0806C4D0 @ =WaitForFieldEffectFinish
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C4CC: .4byte gUnknown_20370B6
_0806C4D0: .4byte WaitForFieldEffectFinish
	thumb_func_end ScrCmd_waitfieldeffect

	thumb_func_start ScrCmd_setrespawn
ScrCmd_setrespawn: @ 806C4D4
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl sub_80554CC
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setrespawn

	thumb_func_start ScrCmd_checkplayergender
ScrCmd_checkplayergender: @ 806C4F0
	ldr r1, _0806C500 @ =gSpecialVar_Result
	ldr r0, _0806C504 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	strh r0, [r1]
	movs r0, 0
	bx lr
	.align 2, 0
_0806C500: .4byte gSpecialVar_Result
_0806C504: .4byte gSaveBlock2Ptr
	thumb_func_end ScrCmd_checkplayergender

	thumb_func_start ScrCmd_playmoncry
ScrCmd_playmoncry: @ 806C508
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl PlayCry7
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_playmoncry

	thumb_func_start ScrCmd_waitmoncry
ScrCmd_waitmoncry: @ 806C540
	push {lr}
	ldr r1, _0806C550 @ =IsCryFinished
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806C550: .4byte IsCryFinished
	thumb_func_end ScrCmd_waitmoncry

	thumb_func_start ScrCmd_setmetatile
ScrCmd_setmetatile: @ 806C554
	push {r4-r7,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	adds r1, r6, 0x7
	lsls r1, 16
	lsrs r6, r1, 16
	adds r1, r5, 0x7
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r0, 0
	bne _0806C5B8
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl MapGridSetMetatileIdAt
	b _0806C5CA
_0806C5B8:
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r2, r7, 0
	orrs r2, r0
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_0806C5CA:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setmetatile

	thumb_func_start ScrCmd_opendoor
ScrCmd_opendoor: @ 806C5D4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	adds r5, 0x7
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r4, r0
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805B364
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805B310
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_opendoor

	thumb_func_start ScrCmd_closedoor
ScrCmd_closedoor: @ 806C62C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805B2D0
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_closedoor

	thumb_func_start sub_806C670
sub_806C670: @ 806C670
	push {lr}
	bl sub_805B350
	lsls r0, 24
	cmp r0, 0
	beq _0806C680
	movs r0, 0
	b _0806C682
_0806C680:
	movs r0, 0x1
_0806C682:
	pop {r1}
	bx r1
	thumb_func_end sub_806C670

	thumb_func_start ScrCmd_waitdoranim
ScrCmd_waitdoranim: @ 806C688
	push {lr}
	ldr r1, _0806C698 @ =sub_806C670
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806C698: .4byte sub_806C670
	thumb_func_end ScrCmd_waitdoranim

	thumb_func_start ScrCmd_setdooropen
ScrCmd_setdooropen: @ 806C69C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805B268
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdooropen

	thumb_func_start ScrCmd_setdoorclosed
ScrCmd_setdoorclosed: @ 806C6E0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805B29C
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdoorclosed

	thumb_func_start ScrCmd_addelevmenuitem
ScrCmd_addelevmenuitem: @ 806C724
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_addelevmenuitem

	thumb_func_start ScrCmd_showelevmenu
ScrCmd_showelevmenu: @ 806C728
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_showelevmenu

	thumb_func_start ScrCmd_checkcoins
ScrCmd_checkcoins: @ 806C72C
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	bl GetCoins
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_checkcoins

	thumb_func_start ScrCmd_givecoins
ScrCmd_givecoins: @ 806C74C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GiveCoins
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806C774
	ldr r1, _0806C770 @ =gSpecialVar_Result
	movs r0, 0
	b _0806C778
	.align 2, 0
_0806C770: .4byte gSpecialVar_Result
_0806C774:
	ldr r1, _0806C780 @ =gSpecialVar_Result
	movs r0, 0x1
_0806C778:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C780: .4byte gSpecialVar_Result
	thumb_func_end ScrCmd_givecoins

	thumb_func_start ScrCmd_takecoins
ScrCmd_takecoins: @ 806C784
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl TakeCoins
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806C7AC
	ldr r1, _0806C7A8 @ =gSpecialVar_Result
	movs r0, 0
	b _0806C7B0
	.align 2, 0
_0806C7A8: .4byte gSpecialVar_Result
_0806C7AC:
	ldr r1, _0806C7B8 @ =gSpecialVar_Result
	movs r0, 0x1
_0806C7B0:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C7B8: .4byte gSpecialVar_Result
	thumb_func_end ScrCmd_takecoins

	thumb_func_start ScrCmd_cmdCA
ScrCmd_cmdCA: @ 806C7BC
	push {lr}
	bl sub_8069A20
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_cmdCA

	thumb_func_start ScrCmd_cmdCB
ScrCmd_cmdCB: @ 806C7C8
	push {lr}
	bl sub_8069A2C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_cmdCB

	thumb_func_start ScrCmd_setmonobedient
ScrCmd_setmonobedient: @ 806C7D4
	push {lr}
	sub sp, 0x4
	movs r2, 0x1
	mov r1, sp
	strb r2, [r1]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806C808 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x50
	mov r2, sp
	bl SetMonData
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_0806C808: .4byte gPlayerParty
	thumb_func_end ScrCmd_setmonobedient

	thumb_func_start ScrCmd_checkmonobedience
ScrCmd_checkmonobedience: @ 806C80C
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0806C83C @ =gSpecialVar_Result
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806C840 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x50
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C83C: .4byte gSpecialVar_Result
_0806C840: .4byte gPlayerParty
	thumb_func_end ScrCmd_checkmonobedience

	thumb_func_start ScrCmd_setmonmetlocation
ScrCmd_setmonmetlocation: @ 806C844
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	mov r1, sp
	strb r2, [r1]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r3, 0x5
	bhi _0806C87A
	movs r0, 0x64
	muls r0, r3
	ldr r1, _0806C884 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	mov r2, sp
	bl SetMonData
_0806C87A:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C884: .4byte gPlayerParty
	thumb_func_end ScrCmd_setmonmetlocation

	.align 2, 0 @ Don't pad with nop.
