	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text
/*
	thumb_func_start GetPlayerPartyHighestLevel
GetPlayerPartyHighestLevel: @ 80444F8
	push {r4-r6,lr}
	movs r6, 0x1
	movs r5, 0
_080444FE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08044548 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	movs r2, 0
	bl GetMonData
	cmp r0, 0x1
	bne _08044538
	adds r0, r4, 0
	movs r1, 0x6
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08044538
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r6
	bls _08044538
	adds r6, r0, 0
_08044538:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080444FE
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08044548: .4byte gPlayerParty
	thumb_func_end GetPlayerPartyHighestLevel

	thumb_func_start FacilityClassToPicIndex
FacilityClassToPicIndex: @ 804454C
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08044558 @ =gFacilityClassToPicIndex
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08044558: .4byte gFacilityClassToPicIndex
	thumb_func_end FacilityClassToPicIndex

	thumb_func_start sub_804455C
sub_804455C: @ 804455C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x5
	bhi _08044632
	lsls r0, 2
	ldr r1, _08044574 @ =_08044578
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044574: .4byte _08044578
	.align 2, 0
_08044578:
	.4byte _08044632
	.4byte _08044590
	.4byte _08044664
	.4byte _080445BC
	.4byte _08044664
	.4byte _080445F4
_08044590:
	ldr r0, _080445B0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044632
	ldr r0, _080445B4 @ =gMain
	ldr r1, _080445B8 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08044632
	b _0804461A
	.align 2, 0
_080445B0: .4byte gBattleTypeFlags
_080445B4: .4byte gMain
_080445B8: .4byte 0x00000439
_080445BC:
	ldr r0, _080445E8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044632
	ldr r0, _080445EC @ =gMain
	ldr r1, _080445F0 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08044632
	cmp r5, 0x1
	beq _08044664
	cmp r5, 0x4
	beq _08044664
	cmp r5, 0x5
	beq _08044664
	b _08044632
	.align 2, 0
_080445E8: .4byte gBattleTypeFlags
_080445EC: .4byte gMain
_080445F0: .4byte 0x00000439
_080445F4:
	ldr r0, _08044638 @ =gBattleTypeFlags
	ldr r2, [r0]
	movs r3, 0x2
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08044648
	ldr r0, _0804463C @ =gMain
	ldr r1, _08044640 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08044632
	movs r0, 0x40
	ands r2, r0
	cmp r2, 0
	beq _08044658
_0804461A:
	ldr r4, _08044644 @ =gLinkPlayers
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x18]
	cmp r0, r5
	bne _08044664
_08044632:
	movs r0, 0
	b _08044666
	.align 2, 0
_08044638: .4byte gBattleTypeFlags
_0804463C: .4byte gMain
_08044640: .4byte 0x00000439
_08044644: .4byte gLinkPlayers
_08044648:
	ldr r0, _0804466C @ =gMain
	ldr r1, _08044670 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08044632
_08044658:
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08044632
_08044664:
	movs r0, 0x1
_08044666:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804466C: .4byte gMain
_08044670: .4byte 0x00000439
	thumb_func_end sub_804455C

	thumb_func_start GetDeoxysStat
GetDeoxysStat: @ 8044674
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r0, _0804469C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08044698
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xCD
	lsls r1, 1
	cmp r0, r1
	beq _080446A0
_08044698:
	movs r0, 0
	b _080446FE
	.align 2, 0
_0804469C: .4byte gBattleTypeFlags
_080446A0:
	adds r1, r6, 0
	adds r1, 0x27
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	adds r1, r6, 0
	adds r1, 0x1A
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	ldr r2, _08044704 @ =sDeoxysBaseStats
	lsls r1, r6, 1
	adds r1, r2
	ldrh r1, [r1]
	lsls r1, 1
	adds r1, r4
	cmp r0, 0
	bge _080446CC
	adds r0, 0x3
_080446CC:
	asrs r0, 2
	adds r0, r1, r0
	adds r1, r5, 0
	adds r1, 0x54
	ldrb r1, [r1]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r6, 24
	lsrs r2, 24
	adds r1, r4, 0
	bl ModifyStatByNature
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
_080446FE:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08044704: .4byte sDeoxysBaseStats
	thumb_func_end GetDeoxysStat

	thumb_func_start SetDeoxysStats
SetDeoxysStats: @ 8044708
	push {r4,r5,lr}
	sub sp, 0x4
	movs r5, 0
_0804470E:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080447A8 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xCD
	lsls r1, 1
	cmp r0, r1
	bne _08044798
	adds r0, r4, 0
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3B
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3D
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3E
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x3F
	mov r2, sp
	bl SetMonData
_08044798:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804470E
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080447A8: .4byte gPlayerParty
	thumb_func_end SetDeoxysStats

	thumb_func_start sub_80447AC
sub_80447AC: @ 80447AC
	push {lr}
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080447E8 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r2, [r0]
	movs r0, 0x7
	ands r2, r0
	adds r1, r3
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	orrs r2, r0
	ldr r0, _080447EC @ =gLinkPlayerFacilityClasses
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	bl FacilityClassToPicIndex
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080447E8: .4byte gLinkPlayers
_080447EC: .4byte gLinkPlayerFacilityClasses
	thumb_func_end sub_80447AC

	thumb_func_start sub_80447F0
sub_80447F0: @ 80447F0
	push {lr}
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0804482C @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r2, [r0]
	movs r0, 0x7
	ands r2, r0
	adds r1, r3
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	orrs r2, r0
	ldr r1, _08044830 @ =gFacilityClassToTrainerClass
	ldr r0, _08044834 @ =gLinkPlayerFacilityClasses
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0804482C: .4byte gLinkPlayers
_08044830: .4byte gFacilityClassToTrainerClass
_08044834: .4byte gLinkPlayerFacilityClasses
	thumb_func_end sub_80447F0

	thumb_func_start CreateObedientEnemyMon
CreateObedientEnemyMon: @ 8044838
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r0, _08044888 @ =gSpecialVar_0x8004
	ldrh r5, [r0]
	ldr r0, _0804488C @ =gSpecialVar_0x8005
	ldrh r4, [r0]
	ldr r0, _08044890 @ =gSpecialVar_0x8006
	ldrh r6, [r0]
	bl ZeroEnemyPartyMons
	ldr r7, _08044894 @ =gEnemyParty
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x20
	bl CreateObedientMon
	cmp r6, 0
	beq _08044880
	add r0, sp, 0x10
	strb r6, [r0]
	adds r1, r0, 0
	asrs r0, r6, 8
	strb r0, [r1, 0x1]
	adds r0, r7, 0
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
_08044880:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044888: .4byte gSpecialVar_0x8004
_0804488C: .4byte gSpecialVar_0x8005
_08044890: .4byte gSpecialVar_0x8006
_08044894: .4byte gEnemyParty
	thumb_func_end CreateObedientEnemyMon

	thumb_func_start HandleSetPokedexFlag
HandleSetPokedexFlag: @ 8044898
	push {r4-r7,lr}
	adds r7, r2, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0x2
	eors r0, r5
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	adds r0, r4, 0
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	bne _080448EE
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetSetPokedexFlag
	adds r0, r4, 0
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bne _080448D8
	ldr r0, _080448F4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	str r7, [r0, 0x1C]
_080448D8:
	adds r0, r6, 0
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	movs r1, 0x9A
	lsls r1, 17
	cmp r0, r1
	bne _080448EE
	ldr r0, _080448F4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	str r7, [r0, 0x20]
_080448EE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080448F4: .4byte gSaveBlock2Ptr
	thumb_func_end HandleSetPokedexFlag

	thumb_func_start CheckBattleTypeGhost
CheckBattleTypeGhost: @ 80448F8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r0, _0804493C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _08044944
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08044944
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	ldr r1, _08044940 @ =gUnknown_841D148
	mov r0, sp
	bl StringCompare
	cmp r0, 0
	bne _08044944
	movs r0, 0x1
	b _08044946
	.align 2, 0
_0804493C: .4byte gBattleTypeFlags
_08044940: .4byte gUnknown_841D148
_08044944:
	movs r0, 0
_08044946:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckBattleTypeGhost

	thumb_func_start OakSpeechNidoranFSetupTemplate
OakSpeechNidoranFSetupTemplate: @ 8044950
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r6, 0
	cmp r1, 0x3
	bls _080449EC
	adds r5, r6, 0
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r5, r0
	bge _08044A2C
_08044972:
	ldr r1, [r4, 0x10]
	lsls r3, r5, 1
	adds r0, r3, r5
	lsls r0, 3
	ldr r2, _080449E8 @ =gUnknown_825DEF0
	adds r1, r0, r1
	adds r0, r2
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	movs r6, 0
	ldrb r2, [r4, 0x1]
	ldr r0, [r4, 0x10]
	mov r10, r0
	mov r8, r3
	ldr r7, [r4, 0x14]
	adds r1, r5, 0x1
	mov r9, r1
	cmp r6, r2
	bcs _080449C2
	mov r12, r7
	ldr r1, [r4, 0xC]
	lsls r0, r5, 2
	adds r0, r1
	ldr r3, [r0]
_080449A6:
	adds r0, r5, 0
	muls r0, r2
	adds r0, r6
	lsls r0, 3
	add r0, r12
	lsls r1, r6, 11
	adds r1, r3, r1
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r2, [r4, 0x1]
	cmp r6, r2
	bcc _080449A6
_080449C2:
	mov r2, r8
	adds r1, r2, r5
	lsls r1, 3
	add r1, r10
	ldrb r0, [r4, 0x1]
	muls r0, r5
	lsls r0, 3
	adds r0, r7, r0
	str r0, [r1, 0xC]
	mov r3, r9
	lsls r0, r3, 16
	lsrs r5, r0, 16
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r5, r0
	blt _08044972
	b _08044A2C
	.align 2, 0
_080449E8: .4byte gUnknown_825DEF0
_080449EC:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r2, _08044A3C @ =gUnknown_825DEF0
	ldr r1, [r4, 0x10]
	adds r0, r2
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
	ldm r0!, {r3,r5,r7}
	stm r1!, {r3,r5,r7}
	ldr r0, [r4, 0x10]
	mov r10, r0
	ldr r7, [r4, 0x14]
	ldrb r1, [r4, 0x1]
	cmp r6, r1
	bcs _08044A28
	adds r3, r7, 0
	ldr r0, [r4, 0xC]
	ldr r2, [r0]
_08044A12:
	lsls r0, r6, 3
	adds r0, r3
	lsls r1, r6, 11
	adds r1, r2, r1
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r5, [r4, 0x1]
	cmp r6, r5
	bcc _08044A12
_08044A28:
	mov r6, r10
	str r7, [r6, 0xC]
_08044A2C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044A3C: .4byte gUnknown_825DEF0
	thumb_func_end OakSpeechNidoranFSetupTemplate

	thumb_func_start OakSpeechNidoranFSetupTemplateDummy
OakSpeechNidoranFSetupTemplateDummy: @ 8044A40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	ldrb r0, [r4]
	lsls r0, 28
	movs r3, 0
	cmp r0, 0
	beq _08044ADA
	ldr r0, _08044AE8 @ =gUnknown_825E05C
	mov r10, r0
_08044A5A:
	ldr r0, [r4, 0x10]
	lsls r2, r3, 1
	adds r1, r2, r3
	lsls r1, 3
	adds r1, r0
	mov r0, r10
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	movs r5, 0
	ldr r0, [r4, 0x10]
	mov r8, r0
	mov r12, r2
	ldr r7, [r4, 0x14]
	adds r1, r3, 0x1
	mov r9, r1
	ldrb r6, [r4, 0x1]
	cmp r5, r6
	bcs _08044AAE
	adds r6, r7, 0
	ldr r1, [r4, 0xC]
	lsls r0, r3, 2
	adds r0, r1
	ldr r2, [r0]
_08044A8C:
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	adds r1, r3, 0
	muls r1, r0
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	lsls r0, r5, 11
	adds r0, r2, r0
	str r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r4, 0x1]
	cmp r5, r0
	bcc _08044A8C
_08044AAE:
	mov r5, r12
	adds r1, r5, r3
	lsls r1, 3
	add r1, r8
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	muls r0, r3
	lsls r0, 3
	adds r0, r7, r0
	str r0, [r1, 0xC]
	ldr r6, _08044AEC @ =gUnknown_82349BC
	str r6, [r1, 0x8]
	strh r3, [r1, 0x2]
	mov r7, r9
	lsls r0, r7, 16
	lsrs r3, r0, 16
	ldrb r0, [r4]
	lsls r0, 28
	lsrs r0, 28
	cmp r3, r0
	blt _08044A5A
_08044ADA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044AE8: .4byte gUnknown_825E05C
_08044AEC: .4byte gUnknown_82349BC
	thumb_func_end OakSpeechNidoranFSetupTemplateDummy

	thumb_func_start OakSpeechNidoranFSetup
OakSpeechNidoranFSetup: @ 8044AF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0
	mov r8, r0
	ldr r4, _08044B34 @ =sOakSpeechNidoranResources
	ldr r1, [r4]
	cmp r1, 0
	beq _08044B1E
	ldrb r0, [r1, 0x2]
	cmp r0, 0xA3
	beq _08044B2E
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	mov r1, r8
	str r1, [r4]
_08044B1E:
	ldr r4, _08044B34 @ =sOakSpeechNidoranResources
	movs r0, 0x18
	bl AllocZeroed
	adds r2, r0, 0
	str r2, [r4]
	cmp r2, 0
	bne _08044B38
_08044B2E:
	movs r0, 0
	b _08044D70
	.align 2, 0
_08044B34: .4byte sOakSpeechNidoranResources
_08044B38:
	cmp r5, 0
	beq _08044B94
	cmp r5, 0x1
	bne _08044B94
	cmp r6, 0x4
	bne _08044B5E
	ldrb r1, [r2]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x40
	b _08044B7C
_08044B5E:
	cmp r6, 0x4
	bls _08044B64
	movs r6, 0
_08044B64:
	ldrb r1, [r2]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x10
_08044B7C:
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _08044B90 @ =sOakSpeechNidoranResources
	ldr r1, [r2]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1, 0x3]
	b _08044BD0
	.align 2, 0
_08044B90: .4byte sOakSpeechNidoranResources
_08044B94:
	cmp r6, 0
	bne _08044B9A
	movs r6, 0x1
_08044B9A:
	cmp r6, 0x8
	bls _08044BA0
	movs r6, 0x8
_08044BA0:
	ldr r4, _08044C10 @ =sOakSpeechNidoranResources
	ldr r3, [r4]
	movs r0, 0xF
	adds r1, r6, 0
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldr r2, [r4]
	lsls r3, r6, 4
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldr r1, [r4]
	movs r2, 0
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r0, [r4]
	strb r2, [r0, 0x3]
_08044BD0:
	ldr r5, _08044C10 @ =sOakSpeechNidoranResources
	ldr r0, [r5]
	ldrb r1, [r0, 0x1]
	lsls r1, 11
	str r1, [r0, 0x4]
	ldrb r0, [r0]
	lsls r0, 28
	lsrs r0, 28
	muls r0, r1
	bl AllocZeroed
	ldr r1, [r5]
	str r0, [r1, 0x8]
	ldrb r0, [r1]
	lsls r0, 28
	lsrs r0, 23
	bl AllocZeroed
	adds r2, r0, 0
	ldr r1, [r5]
	str r2, [r1, 0xC]
	ldr r0, [r1, 0x8]
	cmp r0, 0
	beq _08044C04
	cmp r2, 0
	bne _08044C14
_08044C04:
	movs r0, 0x1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
	b _08044C44
	.align 2, 0
_08044C10: .4byte sOakSpeechNidoranResources
_08044C14:
	ldrb r0, [r1]
	lsls r0, 28
	movs r4, 0
	adds r3, r5, 0
	cmp r0, 0
	beq _08044C44
_08044C20:
	ldr r3, [r5]
	ldr r0, [r3, 0xC]
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r3, 0x4]
	adds r2, r0, 0
	muls r2, r4
	ldr r0, [r3, 0x8]
	adds r0, r2
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r3]
	lsls r0, 28
	lsrs r0, 28
	cmp r4, r0
	blt _08044C20
_08044C44:
	ldr r5, _08044C8C @ =sOakSpeechNidoranResources
	ldr r0, [r5]
	ldrb r1, [r0]
	lsls r1, 28
	lsrs r1, 28
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	bl AllocZeroed
	ldr r2, [r5]
	str r0, [r2, 0x10]
	ldrb r1, [r2]
	lsls r1, 28
	lsrs r1, 28
	ldrb r0, [r2, 0x1]
	lsls r0, 3
	muls r0, r1
	bl AllocZeroed
	adds r2, r0, 0
	ldr r1, [r5]
	str r2, [r1, 0x14]
	ldr r0, [r1, 0x10]
	cmp r0, 0
	beq _08044C7C
	cmp r2, 0
	bne _08044C90
_08044C7C:
	movs r0, 0x2
	mov r1, r8
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	b _08044CE2
	.align 2, 0
_08044C8C: .4byte sOakSpeechNidoranResources
_08044C90:
	movs r4, 0
	ldrb r0, [r1, 0x1]
	ldrb r1, [r1]
	lsls r1, 28
	lsrs r1, 28
	muls r0, r1
	adds r3, r5, 0
	cmp r4, r0
	bge _08044CC6
	adds r7, r3, 0
	movs r5, 0x80
	lsls r5, 4
_08044CA8:
	ldr r2, [r7]
	ldr r1, [r2, 0x14]
	lsls r0, r4, 3
	adds r0, r1
	strh r5, [r0, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r0, 28
	muls r0, r1
	cmp r4, r0
	blt _08044CA8
_08044CC6:
	ldr r0, [r3]
	ldrb r4, [r0, 0x3]
	cmp r4, 0
	beq _08044CDA
	cmp r4, 0x1
	bne _08044CDA
	adds r1, r6, 0
	bl OakSpeechNidoranFSetupTemplate
	b _08044CE2
_08044CDA:
	ldr r0, _08044D60 @ =sOakSpeechNidoranResources
	ldr r0, [r0]
	bl OakSpeechNidoranFSetupTemplateDummy
_08044CE2:
	movs r0, 0x2
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08044D12
	ldr r4, _08044D60 @ =sOakSpeechNidoranResources
	ldr r0, [r4]
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _08044D00
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x14]
_08044D00:
	ldr r0, [r4]
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08044D12
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x10]
_08044D12:
	movs r0, 0x1
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08044D42
	ldr r4, _08044D60 @ =sOakSpeechNidoranResources
	ldr r0, [r4]
	ldr r0, [r0, 0xC]
	cmp r0, 0
	beq _08044D30
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0xC]
_08044D30:
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	cmp r0, 0
	beq _08044D42
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x8]
_08044D42:
	mov r0, r8
	cmp r0, 0
	beq _08044D64
	ldr r4, _08044D60 @ =sOakSpeechNidoranResources
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x18
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	b _08044D6C
	.align 2, 0
_08044D60: .4byte sOakSpeechNidoranResources
_08044D64:
	ldr r0, _08044D7C @ =sOakSpeechNidoranResources
	ldr r1, [r0]
	movs r0, 0xA3
	strb r0, [r1, 0x2]
_08044D6C:
	ldr r0, _08044D7C @ =sOakSpeechNidoranResources
	ldr r0, [r0]
_08044D70:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08044D7C: .4byte sOakSpeechNidoranResources
	thumb_func_end OakSpeechNidoranFSetup
*/
	thumb_func_start OakSpeechNidoranFFreeResources
OakSpeechNidoranFFreeResources: @ 8044D80
	push {r4,lr}
	ldr r4, _08044D9C @ =sOakSpeechNidoranResources
	ldr r1, [r4]
	cmp r1, 0
	beq _08044DFA
	ldrb r0, [r1, 0x2]
	cmp r0, 0xA3
	beq _08044DA0
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	b _08044DF6
	.align 2, 0
_08044D9C: .4byte sOakSpeechNidoranResources
_08044DA0:
	ldr r0, [r1, 0x14]
	cmp r0, 0
	beq _08044DB0
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x14]
_08044DB0:
	ldr r0, [r4]
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08044DC2
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x10]
_08044DC2:
	ldr r0, [r4]
	ldr r0, [r0, 0xC]
	cmp r0, 0
	beq _08044DD4
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0xC]
_08044DD4:
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	cmp r0, 0
	beq _08044DE6
	bl Free
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1, 0x8]
_08044DE6:
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x18
	bl memset
	ldr r0, [r4]
	bl Free
_08044DF6:
	movs r0, 0
	str r0, [r4]
_08044DFA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end OakSpeechNidoranFFreeResources

	thumb_func_start OakSpeechNidoranFGetBuffer
OakSpeechNidoranFGetBuffer: @ 8044E00
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08044E14 @ =sOakSpeechNidoranResources
	ldr r2, [r0]
	ldrb r0, [r2, 0x2]
	cmp r0, 0xA3
	beq _08044E18
	movs r0, 0
	b _08044E2C
	.align 2, 0
_08044E14: .4byte sOakSpeechNidoranResources
_08044E18:
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	blt _08044E24
	movs r1, 0
_08044E24:
	ldr r0, [r2, 0xC]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_08044E2C:
	pop {r1}
	bx r1
	thumb_func_end OakSpeechNidoranFGetBuffer

	.align 2, 0 @ Don't pad with nop.
