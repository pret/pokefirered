	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8082CBC
sub_8082CBC: @ 8082CBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	mov r8, r7
	ldr r0, _08082D44 @ =gUnknown_20386DC
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08082CD4
	b _08082E46
_08082CD4:
	bl sub_8082934
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08082D48 @ =0x0000ffff
	cmp r4, r0
	bne _08082CE4
	b _08082E46
_08082CE4:
	adds r0, r6, 0
	movs r1, 0x4
	bl sub_8058F1C
	cmp r0, 0x1
	bne _08082D78
	ldr r1, _08082D4C @ =gWildMonHeaders
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	adds r5, r2, 0
	cmp r0, 0
	bne _08082D06
	b _08082E46
_08082D06:
	adds r0, r6, 0
	movs r1, 0
	bl sub_8058F1C
	cmp r7, r0
	beq _08082D1E
	bl sub_8082C98
	lsls r0, 24
	cmp r0, 0
	bne _08082D1E
	b _08082E46
_08082D1E:
	ldr r1, _08082D4C @ =gWildMonHeaders
	adds r0, r5, r4
	lsls r0, 2
	adds r1, 0x4
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8082BCC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082D50
_08082D3A:
	ldr r0, [r4]
	ldrb r0, [r0]
	bl sub_8083410
	b _08082E46
	.align 2, 0
_08082D44: .4byte gUnknown_20386DC
_08082D48: .4byte 0x0000ffff
_08082D4C: .4byte gWildMonHeaders
_08082D50:
	bl TryStartRoamerEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082DFA
	ldr r4, [r4]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_8082AEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082E38
	ldrb r0, [r4]
	bl sub_8083410
	b _08082E46
_08082D78:
	adds r0, r6, 0
	movs r1, 0x4
	bl sub_8058F1C
	cmp r0, 0x2
	beq _08082DA8
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08082E46
	adds r0, r6, 0
	movs r1, 0
	bl sub_8058F1C
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsBridge
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082E46
_08082DA8:
	ldr r1, _08082E18 @ =gWildMonHeaders
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	adds r5, r2, 0
	cmp r0, 0
	beq _08082E46
	adds r0, r6, 0
	movs r1, 0
	bl sub_8058F1C
	cmp r8, r0
	beq _08082DD2
	bl sub_8082C98
	lsls r0, 24
	cmp r0, 0
	beq _08082E46
_08082DD2:
	ldr r1, _08082E18 @ =gWildMonHeaders
	adds r0, r5, r4
	lsls r0, 2
	adds r1, 0x8
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8082BCC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082D3A
	bl TryStartRoamerEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082E24
_08082DFA:
	ldr r0, _08082E1C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08082E20 @ =0x000030d0
	adds r0, r1
	ldrb r0, [r0, 0xC]
	bl sub_808310C
	lsls r0, 24
	cmp r0, 0
	beq _08082E46
	bl BattleSetup_StartRoamerBattle
	movs r0, 0x1
	b _08082E48
	.align 2, 0
_08082E18: .4byte gWildMonHeaders
_08082E1C: .4byte gSaveBlock1Ptr
_08082E20: .4byte 0x000030d0
_08082E24:
	ldr r4, [r4]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x1
	bl sub_8082AEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082E40
_08082E38:
	bl BattleSetup_StartWildBattle
	movs r0, 0x1
	b _08082E48
_08082E40:
	ldrb r0, [r4]
	bl sub_8083410
_08082E46:
	movs r0, 0
_08082E48:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8082CBC

	thumb_func_start Special_RockSmashEncounter
Special_RockSmashEncounter: @ 8082E54
	push {r4,lr}
	bl sub_8082934
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08082EA4 @ =0x0000ffff
	cmp r2, r0
	beq _08082EB0
	ldr r1, _08082EA8 @ =gWildMonHeaders
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0xC
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _08082E9C
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8082BCC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082EB0
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x1
	bl sub_8082AEC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _08082EB0
	bl BattleSetup_StartWildBattle
_08082E9C:
	ldr r0, _08082EAC @ =gSpecialVar_Result
	strh r4, [r0]
	b _08082EB6
	.align 2, 0
_08082EA4: .4byte 0x0000ffff
_08082EA8: .4byte gWildMonHeaders
_08082EAC: .4byte gSpecialVar_Result
_08082EB0:
	ldr r1, _08082EBC @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r1]
_08082EB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082EBC: .4byte gSpecialVar_Result
	thumb_func_end Special_RockSmashEncounter

	thumb_func_start SweetScentWildEncounter
SweetScentWildEncounter: @ 8082EC0
	push {r4,r5,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	bl sub_8082934
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08082F14 @ =0x0000ffff
	cmp r5, r0
	beq _08082F6C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r2, 0x4
	bl sub_8058F48
	cmp r0, 0x1
	bne _08082F1C
	bl TryStartRoamerEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082F3C
	ldr r1, _08082F18 @ =gWildMonHeaders
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _08082F6C
	movs r1, 0
	b _08082F58
	.align 2, 0
_08082F14: .4byte 0x0000ffff
_08082F18: .4byte gWildMonHeaders
_08082F1C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r2, 0x4
	bl sub_8058F48
	cmp r0, 0x2
	bne _08082F6C
	bl TryStartRoamerEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082F44
_08082F3C:
	bl BattleSetup_StartRoamerBattle
	movs r0, 0x1
	b _08082F6E
_08082F44:
	ldr r1, _08082F68 @ =gWildMonHeaders
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _08082F6C
	movs r1, 0x1
_08082F58:
	movs r2, 0
	bl sub_8082AEC
	bl BattleSetup_StartWildBattle
	movs r0, 0x1
	b _08082F6E
	.align 2, 0
_08082F68: .4byte gWildMonHeaders
_08082F6C:
	movs r0, 0
_08082F6E:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end SweetScentWildEncounter

	thumb_func_start sub_8082F78
sub_8082F78: @ 8082F78
	push {lr}
	bl sub_8082934
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08082FA0 @ =0x0000ffff
	cmp r2, r0
	beq _08082FA8
	ldr r0, _08082FA4 @ =gWildMonHeaders
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r0, 0x10
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	beq _08082FA8
	movs r0, 0x1
	b _08082FAA
	.align 2, 0
_08082FA0: .4byte 0x0000ffff
_08082FA4: .4byte gWildMonHeaders
_08082FA8:
	movs r0, 0
_08082FAA:
	pop {r1}
	bx r1
	thumb_func_end sub_8082F78

	thumb_func_start sub_8082FB0
sub_8082FB0: @ 8082FB0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _08082FE4 @ =gWildMonHeaders
	bl sub_8082934
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r4, 0x10
	adds r1, r4
	ldr r0, [r1]
	adds r1, r5, 0
	bl sub_8082B64
	movs r0, 0xC
	bl IncrementGameStat
	bl BattleSetup_StartWildBattle
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082FE4: .4byte gWildMonHeaders
	thumb_func_end sub_8082FB0

	thumb_func_start GetLocalWildMon
GetLocalWildMon: @ 8082FE8
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0
	strb r0, [r6]
	bl sub_8082934
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08083020 @ =0x0000ffff
	cmp r3, r0
	beq _0808301A
	ldr r2, _08083024 @ =gWildMonHeaders
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r5, [r0]
	adds r2, 0x8
	adds r1, r2
	ldr r4, [r1]
	cmp r5, 0
	bne _08083028
	cmp r4, 0
	bne _0808302E
_0808301A:
	movs r0, 0
	b _0808306E
	.align 2, 0
_08083020: .4byte 0x0000ffff
_08083024: .4byte gWildMonHeaders
_08083028:
	cmp r4, 0
	bne _0808303C
	b _08083060
_0808302E:
	movs r0, 0x1
	strb r0, [r6]
	bl ChooseWildMonIndex_WaterRock
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _08083068
_0808303C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4F
	bls _08083060
	movs r0, 0x1
	strb r0, [r6]
	bl ChooseWildMonIndex_WaterRock
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _08083068
_08083060:
	bl ChooseWildMonIndex_Land
	lsls r0, 24
	ldr r1, [r5, 0x4]
_08083068:
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
_0808306E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLocalWildMon

	thumb_func_start GetLocalWaterMon
GetLocalWaterMon: @ 8083074
	push {r4,lr}
	bl sub_8082934
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080830A8 @ =0x0000ffff
	cmp r2, r0
	beq _080830B0
	ldr r1, _080830AC @ =gWildMonHeaders
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _080830B0
	bl ChooseWildMonIndex_WaterRock
	lsls r0, 24
	ldr r1, [r4, 0x4]
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080830B2
	.align 2, 0
_080830A8: .4byte 0x0000ffff
_080830AC: .4byte gWildMonHeaders
_080830B0:
	movs r0, 0
_080830B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLocalWaterMon

	thumb_func_start sub_80830B8
sub_80830B8: @ 80830B8
	push {r4,r5,lr}
	bl InUnionRoom
	cmp r0, 0x1
	beq _08083104
	ldr r0, _080830F8 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08083104
	ldr r5, _080830FC @ =0x00004020
	adds r0, r5, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _08083104
	subs r4, r0, 0x1
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl VarSet
	cmp r4, 0
	bne _08083104
	ldr r0, _08083100 @ =EventScript_1BFB65
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08083106
	.align 2, 0
_080830F8: .4byte gUnknown_203ADFA
_080830FC: .4byte 0x00004020
_08083100: .4byte EventScript_1BFB65
_08083104:
	movs r0, 0
_08083106:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80830B8

	thumb_func_start sub_808310C
sub_808310C: @ 808310C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08083158 @ =0x00004020
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	beq _08083152
	movs r5, 0
_08083120:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0808315C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08083160
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08083160
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bcc _0808316A
_08083152:
	movs r0, 0x1
	b _0808316C
	.align 2, 0
_08083158: .4byte 0x00004020
_0808315C: .4byte gPlayerParty
_08083160:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08083120
_0808316A:
	movs r0, 0
_0808316C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_808310C

	thumb_func_start ApplyFluteEncounterRateMod
ApplyFluteEncounterRateMod: @ 8083174
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80831A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808318A
	cmp r0, 0x2
	beq _08083192
	b _08083198
_0808318A:
	ldr r0, [r4]
	lsrs r1, r0, 1
	adds r0, r1
	b _08083196
_08083192:
	ldr r0, [r4]
	lsrs r0, 1
_08083196:
	str r0, [r4]
_08083198:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ApplyFluteEncounterRateMod

	thumb_func_start sub_80831A0
sub_80831A0: @ 80831A0
	push {lr}
	ldr r0, _080831B4 @ =0x00000803
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080831B8
	movs r0, 0x1
	b _080831D2
	.align 2, 0
_080831B4: .4byte 0x00000803
_080831B8:
	ldr r0, _080831CC @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080831D0
	movs r0, 0
	b _080831D2
	.align 2, 0
_080831CC: .4byte 0x00000804
_080831D0:
	movs r0, 0x2
_080831D2:
	pop {r1}
	bx r1
	thumb_func_end sub_80831A0

	thumb_func_start ApplyCleanseTagEncounterRateMod
ApplyCleanseTagEncounterRateMod: @ 80831D8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80831F8
	lsls r0, 24
	cmp r0, 0
	beq _080831F2
	ldr r0, [r4]
	lsls r0, 1
	movs r1, 0x3
	bl __udivsi3
	str r0, [r4]
_080831F2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ApplyCleanseTagEncounterRateMod

	thumb_func_start sub_80831F8
sub_80831F8: @ 80831F8
	push {lr}
	ldr r0, _08083208 @ =gUnknown_20386D0
	ldrh r0, [r0, 0xA]
	cmp r0, 0xBE
	beq _0808320C
	movs r0, 0
	b _0808320E
	.align 2, 0
_08083208: .4byte gUnknown_20386D0
_0808320C:
	movs r0, 0x1
_0808320E:
	pop {r1}
	bx r1
	thumb_func_end sub_80831F8

	thumb_func_start sub_8083214
sub_8083214: @ 8083214
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08083228 @ =gUnknown_20386D0
	str r0, [r1]
	bl sub_80832D4
	pop {r0}
	bx r0
	.align 2, 0
_08083228: .4byte gUnknown_20386D0
	thumb_func_end sub_8083214

	thumb_func_start sub_808322C
sub_808322C: @ 808322C
	ldr r2, _08083240 @ =gUnknown_20386D0
	ldr r1, [r2]
	ldr r0, _08083244 @ =0x41c64e6d
	muls r0, r1
	ldr r1, _08083248 @ =0x00003039
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	bx lr
	.align 2, 0
_08083240: .4byte gUnknown_20386D0
_08083244: .4byte 0x41c64e6d
_08083248: .4byte 0x00003039
	thumb_func_end sub_808322C

	thumb_func_start sub_808324C
sub_808324C: @ 808324C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8082934
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08083284 @ =0x0000ffff
	cmp r2, r0
	beq _080832CC
	cmp r4, 0x1
	bne _0808328C
	ldr r1, _08083288 @ =gWildMonHeaders
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080832CC
	ldrb r1, [r0]
	cmp r1, 0x4F
	bhi _080832A8
	cmp r1, 0x9
	bls _080832B4
	b _080832B8
	.align 2, 0
_08083284: .4byte 0x0000ffff
_08083288: .4byte gWildMonHeaders
_0808328C:
	cmp r5, 0x2
	bne _080832CC
	ldr r1, _080832AC @ =gWildMonHeaders
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080832CC
	ldrb r1, [r0]
	cmp r1, 0x4F
	bls _080832B0
_080832A8:
	movs r0, 0
	b _080832CE
	.align 2, 0
_080832AC: .4byte gWildMonHeaders
_080832B0:
	cmp r1, 0x9
	bhi _080832B8
_080832B4:
	movs r0, 0x8
	b _080832CE
_080832B8:
	ldrb r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	adds r1, r0, 0
	movs r0, 0x8
	subs r0, r1
	lsls r0, 24
	lsrs r0, 24
	b _080832CE
_080832CC:
	movs r0, 0xFF
_080832CE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_808324C

	thumb_func_start sub_80832D4
sub_80832D4: @ 80832D4
	ldr r0, _080832E0 @ =gUnknown_20386D0
	movs r2, 0
	movs r1, 0
	strh r1, [r0, 0x6]
	strb r2, [r0, 0x8]
	bx lr
	.align 2, 0
_080832E0: .4byte gUnknown_20386D0
	thumb_func_end sub_80832D4

	thumb_func_start sub_80832E4
sub_80832E4: @ 80832E4
	push {r4,r5,lr}
	movs r1, 0x4
	bl sub_8058F1C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080833A0
	bl sub_808324C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _080833A0
	lsls r4, 8
	movs r5, 0xA0
	lsls r5, 3
	bl sub_80831A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08083318
	cmp r0, 0x2
	beq _08083326
	b _0808332A
_08083318:
	lsrs r0, r4, 1
	subs r4, r0
	lsrs r0, r5, 1
	movs r1, 0xA0
	lsls r1, 3
	adds r5, r0, r1
	b _0808332A
_08083326:
	lsls r4, 1
	lsrs r5, 1
_0808332A:
	ldr r0, _08083368 @ =gPlayerParty
	movs r1, 0xC
	bl GetMonData
	ldr r1, _0808336C @ =gUnknown_20386D0
	strh r0, [r1, 0xA]
	bl sub_80831F8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083356
	adds r0, r4, 0
	movs r1, 0x3
	bl __udivsi3
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x3
	bl __udivsi3
	subs r5, r0
_08083356:
	bl sub_8082C58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08083370
	cmp r0, 0x2
	beq _08083376
	b _0808337A
	.align 2, 0
_08083368: .4byte gPlayerParty
_0808336C: .4byte gUnknown_20386D0
_08083370:
	lsls r4, 1
	lsrs r5, 1
	b _0808337A
_08083376:
	lsrs r4, 1
	lsls r5, 1
_0808337A:
	lsrs r4, 8
	lsrs r5, 8
	ldr r1, _080833A4 @ =gUnknown_20386D0
	ldrb r0, [r1, 0x8]
	cmp r0, r4
	bcs _080833A8
	adds r0, 0x1
	strb r0, [r1, 0x8]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _080833A8
_080833A0:
	movs r0, 0
	b _080833AA
	.align 2, 0
_080833A4: .4byte gUnknown_20386D0
_080833A8:
	movs r0, 0x1
_080833AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80832E4

	thumb_func_start sub_80833B0
sub_80833B0: @ 80833B0
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80832E4
	lsls r0, 24
	cmp r0, 0
	bne _080833D4
	adds r0, r4, 0
	movs r1, 0
	bl sub_8058F1C
	ldr r1, _080833D0 @ =gUnknown_20386D0
	strh r0, [r1, 0x4]
	movs r0, 0
	b _0808340A
	.align 2, 0
_080833D0: .4byte gUnknown_20386D0
_080833D4:
	ldr r5, _080833F4 @ =gUnknown_20386D0
	ldrh r1, [r5, 0x4]
	adds r0, r4, 0
	bl sub_8082CBC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080833F8
	adds r0, r4, 0
	movs r1, 0
	bl sub_8058F1C
	strh r0, [r5, 0x4]
	movs r0, 0
	b _0808340A
	.align 2, 0
_080833F4: .4byte gUnknown_20386D0
_080833F8:
	movs r0, 0
	movs r1, 0
	strh r1, [r5, 0x6]
	strb r0, [r5, 0x8]
	adds r0, r4, 0
	bl sub_8058F1C
	strh r0, [r5, 0x4]
	movs r0, 0x1
_0808340A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80833B0

	thumb_func_start sub_8083410
sub_8083410: @ 8083410
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808342C @ =0x00004020
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _08083434
	ldr r1, _08083430 @ =gUnknown_20386D0
	ldrh r0, [r1, 0x6]
	adds r0, r4
	b _08083438
	.align 2, 0
_0808342C: .4byte 0x00004020
_08083430: .4byte gUnknown_20386D0
_08083434:
	ldr r1, _08083440 @ =gUnknown_20386D0
	movs r0, 0
_08083438:
	strh r0, [r1, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083440: .4byte gUnknown_20386D0
	thumb_func_end sub_8083410

	.align 2, 0 @ Don't pad with nop.
