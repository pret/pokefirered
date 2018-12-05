	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8082740
sub_8082740: @ 8082740
	ldr r1, _08082748 @ =gUnknown_20386DC
	strb r0, [r1]
	bx lr
	.align 2, 0
_08082748: .4byte gUnknown_20386DC
	thumb_func_end sub_8082740

	thumb_func_start ChooseWildMonIndex_Land
ChooseWildMonIndex_Land: @ 808274C
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x13
	bhi _08082768
	movs r0, 0
	b _08082802
_08082768:
	adds r0, r1, 0
	subs r0, 0x14
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08082778
	movs r0, 0x1
	b _08082802
_08082778:
	adds r0, r1, 0
	subs r0, 0x28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08082788
	movs r0, 0x2
	b _08082802
_08082788:
	adds r0, r1, 0
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08082798
	movs r0, 0x3
	b _08082802
_08082798:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _080827A8
	movs r0, 0x4
	b _08082802
_080827A8:
	adds r0, r1, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _080827B8
	movs r0, 0x5
	b _08082802
_080827B8:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080827C8
	movs r0, 0x6
	b _08082802
_080827C8:
	adds r0, r1, 0
	subs r0, 0x55
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080827D8
	movs r0, 0x7
	b _08082802
_080827D8:
	adds r0, r1, 0
	subs r0, 0x5A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _080827E8
	movs r0, 0x8
	b _08082802
_080827E8:
	adds r0, r1, 0
	subs r0, 0x5E
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _080827F8
	movs r0, 0x9
	b _08082802
_080827F8:
	cmp r1, 0x62
	beq _08082800
	movs r0, 0xB
	b _08082802
_08082800:
	movs r0, 0xA
_08082802:
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonIndex_Land

	thumb_func_start ChooseWildMonIndex_WaterRock
ChooseWildMonIndex_WaterRock: @ 8082808
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r1, 0x3B
	bhi _08082826
	movs r0, 0
	b _08082858
_08082826:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1D
	bhi _08082836
	movs r0, 0x1
	b _08082858
_08082836:
	adds r0, r1, 0
	subs r0, 0x5A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08082846
	movs r0, 0x2
	b _08082858
_08082846:
	adds r0, r2, 0
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08082856
	movs r0, 0x4
	b _08082858
_08082856:
	movs r0, 0x3
_08082858:
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonIndex_WaterRock

	thumb_func_start ChooseWildMonIndex_Fishing
ChooseWildMonIndex_Fishing: @ 808285C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	movs r5, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0x1
	beq _08082896
	cmp r4, 0x1
	bgt _08082886
	cmp r4, 0
	beq _0808288C
	b _080828F0
_08082886:
	cmp r6, 0x2
	beq _080828BA
	b _080828F0
_0808288C:
	movs r5, 0x1
	cmp r1, 0x45
	bhi _080828F0
	movs r5, 0
	b _080828F0
_08082896:
	cmp r1, 0x3B
	bhi _0808289C
	movs r5, 0x2
_0808289C:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080828AA
	movs r5, 0x3
_080828AA:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080828F0
	movs r5, 0x4
	b _080828F0
_080828BA:
	cmp r1, 0x27
	bhi _080828C0
	movs r5, 0x5
_080828C0:
	adds r0, r1, 0
	subs r0, 0x28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	bhi _080828CE
	movs r5, 0x6
_080828CE:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE
	bhi _080828DC
	movs r5, 0x7
_080828DC:
	adds r0, r1, 0
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _080828EA
	movs r5, 0x8
_080828EA:
	cmp r1, 0x63
	bne _080828F0
	movs r5, 0x9
_080828F0:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonIndex_Fishing

	thumb_func_start ChooseWildMonLevel
ChooseWildMonLevel: @ 80828F8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	cmp r0, r1
	bcc _08082908
	ldrb r5, [r4]
	b _0808290C
_08082908:
	ldrb r5, [r4, 0x1]
	ldrb r0, [r4]
_0808290C:
	subs r4, r0, r5
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	adds r0, r5, r0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonLevel

	thumb_func_start sub_8082934
sub_8082934: @ 8082934
	push {r4-r6,lr}
	movs r4, 0
	ldr r0, _08082990 @ =gUnknown_83C9CB8
	ldrb r1, [r0]
	adds r5, r0, 0
	cmp r1, 0xFF
	beq _080829B4
	ldr r6, _08082994 @ =0x00007a01
_08082944:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	adds r3, r0, r5
	ldrb r1, [r3]
	ldr r0, _08082998 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080829A0
	ldrb r1, [r3, 0x1]
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080829A0
	ldrh r0, [r2, 0x4]
	cmp r0, r6
	bne _08082980
	ldr r0, _0808299C @ =0x00004024
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _0808297A
	movs r0, 0
_0808297A:
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
_08082980:
	bl sub_80829C0
	lsls r0, 24
	cmp r0, 0
	beq _080829B4
	adds r0, r4, 0
	b _080829B6
	.align 2, 0
_08082990: .4byte gUnknown_83C9CB8
_08082994: .4byte 0x00007a01
_08082998: .4byte gSaveBlock1Ptr
_0808299C: .4byte 0x00004024
_080829A0:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08082944
_080829B4:
	ldr r0, _080829BC @ =0x0000ffff
_080829B6:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080829BC: .4byte 0x0000ffff
	thumb_func_end sub_8082934

	thumb_func_start sub_80829C0
sub_80829C0: @ 80829C0
	push {lr}
	ldr r0, _080829EC @ =0x00000849
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080829F4
	ldr r0, _080829F0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	bne _080829F4
	ldrb r0, [r1, 0x5]
	subs r0, 0x1B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bhi _080829F4
	movs r0, 0
	b _080829F6
	.align 2, 0
_080829EC: .4byte 0x00000849
_080829F0: .4byte gSaveBlock1Ptr
_080829F4:
	movs r0, 0x1
_080829F6:
	pop {r1}
	bx r1
	thumb_func_end sub_80829C0

	thumb_func_start sub_80829FC
sub_80829FC: @ 80829FC
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	bl ZeroEnemyPartyMons
	cmp r4, 0xC9
	beq _08082A3C
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08082A38 @ =gEnemyParty
	str r0, [sp]
	adds r0, r1, 0
	adds r1, r4, 0
	adds r2, r6, 0
	movs r3, 0x20
	bl CreateMonWithNature
	b _08082A74
	.align 2, 0
_08082A38: .4byte gEnemyParty
_08082A3C:
	ldr r0, _08082A7C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	subs r1, 0x1B
	ldr r2, _08082A80 @ =gUnknown_83CA71C
	lsls r1, 24
	asrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5, r0
	adds r0, r2
	ldrb r0, [r0]
	bl sub_8082A88
	ldr r2, _08082A84 @ =gEnemyParty
	movs r1, 0x1
	str r1, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r2, 0
	movs r1, 0xC9
	adds r2, r6, 0
	movs r3, 0x20
	bl CreateMon
_08082A74:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082A7C: .4byte gSaveBlock1Ptr
_08082A80: .4byte gUnknown_83CA71C
_08082A84: .4byte gEnemyParty
	thumb_func_end sub_80829FC

	thumb_func_start sub_8082A88
sub_8082A88: @ 8082A88
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
_08082A8E:
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r0
	adds r0, r4, 0
	bl sub_8082AB8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bne _08082A8E
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082A88

	thumb_func_start sub_8082AB8
sub_8082AB8: @ 8082AB8
	push {lr}
	adds r2, r0, 0
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8082AB8

	thumb_func_start sub_8082AEC
sub_8082AEC: @ 8082AEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r6, 0
	cmp r1, 0x1
	beq _08082B1C
	cmp r1, 0x1
	bgt _08082B10
	cmp r1, 0
	beq _08082B16
	b _08082B24
_08082B10:
	cmp r0, 0x2
	beq _08082B1C
	b _08082B24
_08082B16:
	bl ChooseWildMonIndex_Land
	b _08082B20
_08082B1C:
	bl ChooseWildMonIndex_WaterRock
_08082B20:
	lsls r0, 24
	lsrs r6, r0, 24
_08082B24:
	lsls r4, r6, 2
	ldr r0, [r7, 0x4]
	adds r0, r4
	bl ChooseWildMonLevel
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	cmp r0, 0x1
	bne _08082B48
	adds r0, r5, 0
	bl sub_808310C
	lsls r0, 24
	cmp r0, 0
	bne _08082B48
	movs r0, 0
	b _08082B58
_08082B48:
	ldr r0, [r7, 0x4]
	adds r0, r4, r0
	ldrh r0, [r0, 0x2]
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_80829FC
	movs r0, 0x1
_08082B58:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8082AEC

	thumb_func_start sub_8082B64
sub_8082B64: @ 8082B64
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r0, r1, 24
	lsrs r0, 24
	bl ChooseWildMonIndex_Fishing
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r4, 2
	ldr r0, [r6, 0x4]
	adds r0, r5
	bl ChooseWildMonLevel
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [r6, 0x4]
	adds r0, r5, r0
	ldrh r0, [r0, 0x2]
	adds r2, r4, 0
	bl sub_80829FC
	ldr r0, [r6, 0x4]
	adds r5, r0
	ldrh r0, [r5, 0x2]
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8082B64

	thumb_func_start sub_8082BA0
sub_8082BA0: @ 8082BA0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_808322C
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xC8
	lsls r1, 3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bcc _08082BC4
	movs r0, 0
	b _08082BC6
_08082BC4:
	movs r0, 0x1
_08082BC6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082BA0

	thumb_func_start sub_8082BCC
sub_8082BCC: @ 8082BCC
	push {r4,r5,lr}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r0, 4
	str r0, [sp]
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08082BF6
	ldr r1, [sp]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	movs r1, 0x64
	bl __udivsi3
	str r0, [sp]
_08082BF6:
	ldr r4, _08082C24 @ =gUnknown_20386D0
	ldrh r0, [r4, 0x6]
	lsls r0, 4
	movs r1, 0xC8
	bl __divsi3
	ldr r1, [sp]
	adds r1, r0
	str r1, [sp]
	mov r0, sp
	bl sub_8083174
	mov r0, sp
	bl sub_80831D8
	cmp r5, 0
	bne _08082C34
	ldrb r0, [r4, 0x9]
	cmp r0, 0x1
	beq _08082C28
	cmp r0, 0x2
	beq _08082C2E
	b _08082C34
	.align 2, 0
_08082C24: .4byte gUnknown_20386D0
_08082C28:
	ldr r0, [sp]
	lsrs r0, 1
	b _08082C32
_08082C2E:
	ldr r0, [sp]
	lsls r0, 1
_08082C32:
	str r0, [sp]
_08082C34:
	ldr r0, [sp]
	movs r1, 0xC8
	lsls r1, 3
	cmp r0, r1
	bls _08082C40
	str r1, [sp]
_08082C40:
	ldr r0, [sp]
	lsls r0, 16
	lsrs r0, 16
	bl sub_8082BA0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082BCC

	thumb_func_start sub_8082C58
sub_8082C58: @ 8082C58
	push {r4,r5,lr}
	ldr r5, _08082C90 @ =gUnknown_20386D0
	movs r0, 0
	strb r0, [r5, 0x9]
	ldr r4, _08082C94 @ =gPlayerParty
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _08082C84
	adds r0, r4, 0
	bl GetMonAbility
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082C82
	cmp r0, 0x23
	bne _08082C84
	movs r0, 0x2
_08082C82:
	strb r0, [r5, 0x9]
_08082C84:
	ldr r0, _08082C90 @ =gUnknown_20386D0
	ldrb r0, [r0, 0x9]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08082C90: .4byte gUnknown_20386D0
_08082C94: .4byte gPlayerParty
	thumb_func_end sub_8082C58

	thumb_func_start sub_8082C98
sub_8082C98: @ 8082C98
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3B
	bhi _08082CB4
	movs r0, 0x1
	b _08082CB6
_08082CB4:
	movs r0, 0
_08082CB6:
	pop {r1}
	bx r1
	thumb_func_end sub_8082C98

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
	ldr r1, _08082D4C @ =gUnknown_83C9CB8
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
	ldr r1, _08082D4C @ =gUnknown_83C9CB8
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
_08082D4C: .4byte gUnknown_83C9CB8
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
	bl MetatileBehavior_ReturnFalse_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082E46
_08082DA8:
	ldr r1, _08082E18 @ =gUnknown_83C9CB8
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
	ldr r1, _08082E18 @ =gUnknown_83C9CB8
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
	bl sub_807F78C
	movs r0, 0x1
	b _08082E48
	.align 2, 0
_08082E18: .4byte gUnknown_83C9CB8
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
	bl sub_807F704
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

	thumb_func_start sub_8082E54
sub_8082E54: @ 8082E54
	push {r4,lr}
	bl sub_8082934
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08082EA4 @ =0x0000ffff
	cmp r2, r0
	beq _08082EB0
	ldr r1, _08082EA8 @ =gUnknown_83C9CB8
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
	bl sub_807F704
_08082E9C:
	ldr r0, _08082EAC @ =gSpecialVar_Result
	strh r4, [r0]
	b _08082EB6
	.align 2, 0
_08082EA4: .4byte 0x0000ffff
_08082EA8: .4byte gUnknown_83C9CB8
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
	thumb_func_end sub_8082E54

	thumb_func_start sub_8082EC0
sub_8082EC0: @ 8082EC0
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
	ldr r1, _08082F18 @ =gUnknown_83C9CB8
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
_08082F18: .4byte gUnknown_83C9CB8
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
	bl sub_807F78C
	movs r0, 0x1
	b _08082F6E
_08082F44:
	ldr r1, _08082F68 @ =gUnknown_83C9CB8
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
	bl sub_807F704
	movs r0, 0x1
	b _08082F6E
	.align 2, 0
_08082F68: .4byte gUnknown_83C9CB8
_08082F6C:
	movs r0, 0
_08082F6E:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082EC0

	thumb_func_start sub_8082F78
sub_8082F78: @ 8082F78
	push {lr}
	bl sub_8082934
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08082FA0 @ =0x0000ffff
	cmp r2, r0
	beq _08082FA8
	ldr r0, _08082FA4 @ =gUnknown_83C9CB8
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
_08082FA4: .4byte gUnknown_83C9CB8
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
	ldr r4, _08082FE4 @ =gUnknown_83C9CB8
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
	bl sub_807F704
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082FE4: .4byte gUnknown_83C9CB8
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
	ldr r2, _08083024 @ =gUnknown_83C9CB8
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
_08083024: .4byte gUnknown_83C9CB8
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
	ldr r1, _080830AC @ =gUnknown_83C9CB8
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
_080830AC: .4byte gUnknown_83C9CB8
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
	ldr r0, _08083100 @ =gUnknown_81BFB65
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08083106
	.align 2, 0
_080830F8: .4byte gUnknown_203ADFA
_080830FC: .4byte 0x00004020
_08083100: .4byte gUnknown_81BFB65
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

	thumb_func_start sub_8083174
sub_8083174: @ 8083174
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
	thumb_func_end sub_8083174

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

	thumb_func_start sub_80831D8
sub_80831D8: @ 80831D8
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
	thumb_func_end sub_80831D8

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
	ldr r1, _08083288 @ =gUnknown_83C9CB8
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
_08083288: .4byte gUnknown_83C9CB8
_0808328C:
	cmp r5, 0x2
	bne _080832CC
	ldr r1, _080832AC @ =gUnknown_83C9CB8
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
_080832AC: .4byte gUnknown_83C9CB8
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
