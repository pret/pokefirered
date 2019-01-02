	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815DC8C
sub_815DC8C: @ 815DC8C
	push {r4-r7,lr}
	ldr r0, _0815DCBC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _0815DCC0 @ =0x00003d34
	adds r0, r1
	ldr r5, [r0]
	ldr r4, _0815DCC4 @ =gUnknown_203F458
	ldr r0, _0815DCC8 @ =0x00001f0c
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _0815DCCC @ =gMapHeader
	ldrb r1, [r1, 0x12]
	subs r1, 0x2A
	strb r1, [r0]
	bl sub_815D834
	cmp r0, 0x1
	bne _0815DCD0
	ldr r0, [r4]
	adds r0, 0x4
	bl sub_815D80C
	b _0815DD18
	.align 2, 0
_0815DCBC: .4byte gSaveBlock1Ptr
_0815DCC0: .4byte 0x00003d34
_0815DCC4: .4byte gUnknown_203F458
_0815DCC8: .4byte 0x00001f0c
_0815DCCC: .4byte gMapHeader
_0815DCD0:
	ldr r0, [r4]
	ldr r1, _0815DD20 @ =gUnknown_84827AC
	adds r0, 0x4
	movs r2, 0x8
	bl memcpy
	lsls r1, r5, 5
	ldr r0, _0815DD24 @ =gUnknown_84827B4
	adds r7, r1, r0
	movs r5, 0
	movs r4, 0x7
_0815DCE6:
	ldr r6, _0815DD28 @ =gUnknown_203F458
	ldr r0, [r6]
	adds r0, r5, r0
	adds r0, 0xC
	ldm r7!, {r1}
	movs r2, 0xF8
	lsls r2, 2
	bl memcpy
	movs r0, 0xF8
	lsls r0, 2
	adds r5, r0
	subs r4, 0x1
	cmp r4, 0
	bge _0815DCE6
	ldr r0, [r6]
	adds r0, 0xC
	movs r1, 0xF8
	lsls r1, 5
	bl CalcByteArraySum
	ldr r1, [r6]
	str r0, [r1, 0x8]
	bl sub_815EC0C
_0815DD18:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815DD20: .4byte gUnknown_84827AC
_0815DD24: .4byte gUnknown_84827B4
_0815DD28: .4byte gUnknown_203F458
	thumb_func_end sub_815DC8C

	thumb_func_start sub_815DD2C
sub_815DD2C: @ 815DD2C
	push {r4,lr}
	ldr r4, _0815DD40 @ =gUnknown_203F458
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815DD40: .4byte gUnknown_203F458
	thumb_func_end sub_815DD2C

	thumb_func_start sub_815DD44
sub_815DD44: @ 815DD44
	push {r4,lr}
	ldr r0, _0815DD68 @ =gMapHeader
	ldrh r0, [r0, 0x12]
	ldr r1, _0815DD6C @ =0xfffffed7
	adds r0, r1
	ldr r1, _0815DD70 @ =gUnknown_203F458
	ldr r4, [r1]
	ldrb r1, [r4, 0x4]
	cmp r0, r1
	ble _0815DD78
	ldr r0, _0815DD74 @ =gSpecialVar_Result
	movs r1, 0x3
	strh r1, [r0]
	movs r0, 0x99
	lsls r0, 1
	bl sub_8055D40
	b _0815DDA2
	.align 2, 0
_0815DD68: .4byte gMapHeader
_0815DD6C: .4byte 0xfffffed7
_0815DD70: .4byte gUnknown_203F458
_0815DD74: .4byte gSpecialVar_Result
_0815DD78:
	ldr r3, _0815DDA8 @ =gSpecialVar_Result
	ldrb r1, [r4]
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 5
	adds r0, r4, r0
	ldrb r0, [r0, 0xE]
	strh r0, [r3]
	ldr r2, _0815DDAC @ =gUnknown_847A284
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r3, [r3]
	adds r0, r3
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	bl sub_8055D40
	bl sub_815DDB0
_0815DDA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815DDA8: .4byte gSpecialVar_Result
_0815DDAC: .4byte gUnknown_847A284
	thumb_func_end sub_815DD44

	thumb_func_start sub_815DDB0
sub_815DDB0: @ 815DDB0
	push {r4-r6,lr}
	ldr r0, _0815DDD0 @ =gUnknown_203F458
	ldr r2, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 5
	adds r2, r0
	ldrb r0, [r2, 0xE]
	cmp r0, 0x1
	beq _0815DE18
	cmp r0, 0x1
	bgt _0815DDD4
	cmp r0, 0
	beq _0815DDDA
	b _0815DEF0
	.align 2, 0
_0815DDD0: .4byte gUnknown_203F458
_0815DDD4:
	cmp r0, 0x2
	beq _0815DE64
	b _0815DEF0
_0815DDDA:
	ldrb r2, [r2, 0x1B]
	movs r3, 0
	ldr r0, _0815DE04 @ =gUnknown_8479ED8
	ldrb r1, [r0, 0x1]
	adds r6, r0, 0
	cmp r1, r2
	beq _0815DDF8
	adds r1, r6, 0
_0815DDEA:
	adds r1, 0x4
	adds r3, 0x1
	cmp r3, 0x52
	bhi _0815DDF8
	ldrb r0, [r1, 0x1]
	cmp r0, r2
	bne _0815DDEA
_0815DDF8:
	cmp r3, 0x53
	beq _0815DE08
	lsls r0, r3, 2
	adds r0, r6
	ldrb r1, [r0]
	b _0815DE0A
	.align 2, 0
_0815DE04: .4byte gUnknown_8479ED8
_0815DE08:
	movs r1, 0x12
_0815DE0A:
	ldr r0, _0815DE14 @ =0x00004011
	bl VarSet
	b _0815DEF0
	.align 2, 0
_0815DE14: .4byte 0x00004011
_0815DE18:
	ldrb r2, [r2, 0x1B]
	movs r3, 0
	ldr r0, _0815DE44 @ =gUnknown_847A024
	ldrb r1, [r0, 0x2]
	adds r4, r0, 0
	cmp r1, r2
	beq _0815DE36
	adds r1, r4, 0
_0815DE28:
	adds r1, 0x8
	adds r3, 0x1
	cmp r3, 0x9
	bhi _0815DE36
	ldrb r0, [r1, 0x2]
	cmp r0, r2
	bne _0815DE28
_0815DE36:
	cmp r3, 0xA
	beq _0815DE48
	lsls r0, r3, 3
	adds r0, r4
	ldrb r1, [r0]
	ldrb r4, [r0, 0x1]
	b _0815DE4C
	.align 2, 0
_0815DE44: .4byte gUnknown_847A024
_0815DE48:
	movs r1, 0x12
	movs r4, 0x12
_0815DE4C:
	ldr r0, _0815DE5C @ =0x00004010
	bl VarSet
	ldr r0, _0815DE60 @ =0x00004013
	adds r1, r4, 0
	bl VarSet
	b _0815DEF0
	.align 2, 0
_0815DE5C: .4byte 0x00004010
_0815DE60: .4byte 0x00004013
_0815DE64:
	movs r4, 0
	ldr r6, _0815DEAC @ =gUnknown_8479ED8
_0815DE68:
	ldr r0, _0815DEB0 @ =gUnknown_203F458
	ldr r3, [r0]
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 3
	ldrb r2, [r3]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r1, r0
	adds r3, r1
	ldrb r2, [r3, 0x1B]
	movs r3, 0
	ldr r1, _0815DEAC @ =gUnknown_8479ED8
	ldrb r0, [r1, 0x1]
	adds r5, r4, 0x1
	cmp r0, r2
	beq _0815DE9E
_0815DE90:
	adds r1, 0x4
	adds r3, 0x1
	cmp r3, 0x52
	bhi _0815DE9E
	ldrb r0, [r1, 0x1]
	cmp r0, r2
	bne _0815DE90
_0815DE9E:
	cmp r3, 0x53
	beq _0815DEB4
	lsls r0, r3, 2
	adds r0, r6
	ldrb r1, [r0]
	b _0815DEB6
	.align 2, 0
_0815DEAC: .4byte gUnknown_8479ED8
_0815DEB0: .4byte gUnknown_203F458
_0815DEB4:
	movs r1, 0x12
_0815DEB6:
	cmp r4, 0x1
	beq _0815DED8
	cmp r4, 0x1
	bgt _0815DEC4
	cmp r4, 0
	beq _0815DECA
	b _0815DEEA
_0815DEC4:
	cmp r4, 0x2
	beq _0815DEE4
	b _0815DEEA
_0815DECA:
	ldr r0, _0815DED4 @ =0x00004012
	bl VarSet
	b _0815DEEA
	.align 2, 0
_0815DED4: .4byte 0x00004012
_0815DED8:
	ldr r0, _0815DEE0 @ =0x00004010
	bl VarSet
	b _0815DEEA
	.align 2, 0
_0815DEE0: .4byte 0x00004010
_0815DEE4:
	ldr r0, _0815DEF8 @ =0x00004011
	bl VarSet
_0815DEEA:
	adds r4, r5, 0
	cmp r4, 0x2
	ble _0815DE68
_0815DEF0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815DEF8: .4byte 0x00004011
	thumb_func_end sub_815DDB0

	thumb_func_start sub_815DEFC
sub_815DEFC: @ 815DEFC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0x2
	bl ConvertEasyChatWordsToString
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x2
	adds r1, r4, 0
	bl GetStringWidth
	cmp r0, 0xC4
	bls _0815DF4E
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertEasyChatWordsToString
	ldrb r0, [r4]
	movs r1, 0x1
	cmp r0, 0xFE
	beq _0815DF40
_0815DF32:
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, 0x1
	cmp r0, 0xFE
	bne _0815DF32
	b _0815DF40
_0815DF3E:
	adds r1, 0x1
_0815DF40:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0xFE
	bne _0815DF3E
	adds r1, r4, r1
	movs r0, 0xFA
	strb r0, [r1]
_0815DF4E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_815DEFC

	thumb_func_start sub_815DF54
sub_815DF54: @ 815DF54
	push {r4,r5,lr}
	ldr r0, _0815DF90 @ =gSpecialVar_0x8006
	ldrh r4, [r0]
	ldr r2, _0815DF94 @ =gUnknown_203F458
	ldr r3, [r2]
	ldrb r1, [r3]
	lsls r0, r1, 5
	subs r0, r1
	lsls r1, r0, 5
	adds r0, r3, r1
	ldrb r5, [r0, 0xE]
	cmp r5, 0x1
	beq _0815DF7C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	adds r0, r3, r0
_0815DF7C:
	ldrb r1, [r0, 0x1B]
	ldr r0, _0815DF98 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0x3
	beq _0815DFD4
	cmp r0, 0x3
	bgt _0815DF9C
	cmp r0, 0x2
	beq _0815DFA6
	b _0815E05C
	.align 2, 0
_0815DF90: .4byte gSpecialVar_0x8006
_0815DF94: .4byte gUnknown_203F458
_0815DF98: .4byte gSpecialVar_0x8005
_0815DF9C:
	cmp r0, 0x4
	beq _0815E000
	cmp r0, 0x5
	beq _0815E038
	b _0815E05C
_0815DFA6:
	adds r0, r5, 0
	bl sub_815E068
	ldr r0, _0815DFD0 @ =gUnknown_203F458
	ldr r0, [r0]
	ldrb r2, [r0]
	lsls r1, r2, 5
	subs r1, r2
	lsls r1, 5
	adds r1, 0xC
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 3
	adds r1, 0x4
	adds r0, r1
	adds r0, 0xE
	b _0815E026
	.align 2, 0
_0815DFD0: .4byte gUnknown_203F458
_0815DFD4:
	adds r0, r5, 0
	bl sub_815E068
	ldr r0, _0815DFFC @ =gUnknown_203F458
	ldr r0, [r0]
	ldrb r2, [r0]
	lsls r1, r2, 5
	subs r1, r2
	lsls r1, 5
	adds r1, 0xC
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 3
	adds r1, 0x4
	adds r0, r1
	adds r0, 0x1A
	b _0815E026
	.align 2, 0
_0815DFFC: .4byte gUnknown_203F458
_0815E000:
	adds r0, r5, 0
	bl sub_815E068
	ldr r0, _0815E030 @ =gUnknown_203F458
	ldr r0, [r0]
	ldrb r2, [r0]
	lsls r1, r2, 5
	subs r1, r2
	lsls r1, 5
	adds r1, 0xC
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 3
	adds r1, 0x4
	adds r0, r1
	adds r0, 0x26
_0815E026:
	ldr r1, _0815E034 @ =gStringVar4
	bl sub_815DEFC
	b _0815E05C
	.align 2, 0
_0815E030: .4byte gUnknown_203F458
_0815E034: .4byte gStringVar4
_0815E038:
	ldr r0, [r2]
	ldrb r2, [r0]
	lsls r1, r2, 5
	subs r1, r2
	lsls r1, 5
	adds r1, 0xC
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 3
	adds r1, 0x4
	adds r0, r1
	adds r0, 0x32
	ldr r1, _0815E064 @ =gStringVar4
	bl sub_815DEFC
_0815E05C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815E064: .4byte gStringVar4
	thumb_func_end sub_815DF54

	thumb_func_start sub_815E068
sub_815E068: @ 815E068
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	movs r5, 0
	cmp r0, 0x1
	beq _0815E0B4
	cmp r0, 0x1
	bgt _0815E084
	cmp r0, 0
	beq _0815E088
	b _0815E0F8
_0815E084:
	cmp r3, 0x2
	bne _0815E0F8
_0815E088:
	movs r4, 0
	ldr r0, _0815E0B0 @ =gUnknown_8479ED8
	ldrb r1, [r0, 0x1]
	adds r3, r0, 0
	cmp r1, r2
	beq _0815E0A4
	adds r1, r3, 0
_0815E096:
	adds r1, 0x4
	adds r4, 0x1
	cmp r4, 0x52
	bhi _0815E0A4
	ldrb r0, [r1, 0x1]
	cmp r0, r2
	bne _0815E096
_0815E0A4:
	cmp r4, 0x53
	beq _0815E0F8
	lsls r0, r4, 2
	adds r0, r3
	ldrb r5, [r0, 0x2]
	b _0815E0F8
	.align 2, 0
_0815E0B0: .4byte gUnknown_8479ED8
_0815E0B4:
	movs r4, 0
	ldr r1, _0815E0BC @ =gUnknown_847A024
	b _0815E0C8
	.align 2, 0
_0815E0BC: .4byte gUnknown_847A024
_0815E0C0:
	adds r1, 0x8
	adds r4, 0x1
	cmp r4, 0x9
	bhi _0815E0CE
_0815E0C8:
	ldrb r0, [r1, 0x2]
	cmp r0, r2
	bne _0815E0C0
_0815E0CE:
	cmp r4, 0xA
	beq _0815E0F8
	ldr r0, _0815E0E8 @ =0x00004003
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	beq _0815E0F0
	ldr r1, _0815E0EC @ =gUnknown_847A024
	lsls r0, r4, 3
	adds r0, r1
	ldrb r5, [r0, 0x4]
	b _0815E0F8
	.align 2, 0
_0815E0E8: .4byte 0x00004003
_0815E0EC: .4byte gUnknown_847A024
_0815E0F0:
	ldr r1, _0815E108 @ =gUnknown_847A024
	lsls r0, r4, 3
	adds r0, r1
	ldrb r5, [r0, 0x3]
_0815E0F8:
	ldr r2, _0815E10C @ =gUnknown_20370DC
	ldr r1, _0815E110 @ =gUnknown_20370DA
	ldrh r0, [r1]
	strh r0, [r2]
	strh r5, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815E108: .4byte gUnknown_847A024
_0815E10C: .4byte gUnknown_20370DC
_0815E110: .4byte gUnknown_20370DA
	thumb_func_end sub_815E068

	thumb_func_start sub_815E114
sub_815E114: @ 815E114
	push {lr}
	ldr r0, _0815E120 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0815E120: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_815E114

	thumb_func_start sub_815E124
sub_815E124: @ 815E124
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80D08F8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0815E14C
	ldr r0, _0815E154 @ =gMain
	ldr r1, _0815E158 @ =sub_815E114
	str r1, [r0, 0x8]
	bl sub_80563F0
	ldr r0, _0815E15C @ =sub_800FD9C
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0815E14C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815E154: .4byte gMain
_0815E158: .4byte sub_815E114
_0815E15C: .4byte sub_800FD9C
	thumb_func_end sub_815E124

	thumb_func_start sub_815E160
sub_815E160: @ 815E160
	push {r4,lr}
	ldr r4, _0815E1AC @ =gBattleTypeFlags
	ldr r3, _0815E1B0 @ =0x00080008
	str r3, [r4]
	ldr r0, _0815E1B4 @ =gUnknown_203F458
	ldr r1, [r0]
	ldrb r2, [r1]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0xE]
	cmp r0, 0x1
	bne _0815E180
	orrs r0, r3
	str r0, [r4]
_0815E180:
	ldr r1, _0815E1B8 @ =gTrainerBattleOpponent_A
	movs r0, 0
	strh r0, [r1]
	bl sub_815E9FC
	ldr r0, _0815E1BC @ =sub_815E124
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl PlayMapChosenOrBattleBGM
	bl sub_8080060
	lsls r0, 24
	lsrs r0, 24
	bl sub_80D08B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815E1AC: .4byte gBattleTypeFlags
_0815E1B0: .4byte 0x00080008
_0815E1B4: .4byte gUnknown_203F458
_0815E1B8: .4byte gTrainerBattleOpponent_A
_0815E1BC: .4byte sub_815E124
	thumb_func_end sub_815E160

	thumb_func_start sub_815E1C0
sub_815E1C0: @ 815E1C0
	push {lr}
	ldr r0, _0815E1E4 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0
	bne _0815E1DE
	ldr r3, _0815E1E8 @ =gSpecialVar_Result
	ldr r0, _0815E1EC @ =gUnknown_203F458
	ldr r1, [r0]
	ldrb r2, [r1]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r1, r0
	ldrb r0, [r1, 0xE]
	strh r0, [r3]
_0815E1DE:
	pop {r0}
	bx r0
	.align 2, 0
_0815E1E4: .4byte gSpecialVar_0x8005
_0815E1E8: .4byte gSpecialVar_Result
_0815E1EC: .4byte gUnknown_203F458
	thumb_func_end sub_815E1C0

	thumb_func_start sub_815E1F0
sub_815E1F0: @ 815E1F0
	ldr r0, _0815E210 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0815E214 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0xF5
	lsls r0, 6
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0815E210: .4byte gSaveBlock1Ptr
_0815E214: .4byte 0x00003d34
	thumb_func_end sub_815E1F0

	thumb_func_start sub_815E218
sub_815E218: @ 815E218
	push {lr}
	ldr r0, _0815E260 @ =gMapHeader
	ldrh r0, [r0, 0x12]
	mov r12, r0
	ldr r3, _0815E264 @ =0xfffffed6
	add r3, r12
	ldr r0, _0815E268 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0815E26C @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0xF5
	lsls r0, 6
	adds r1, r0
	ldrb r1, [r1]
	cmp r3, r1
	bne _0815E27C
	ldr r3, _0815E270 @ =0xfffffed7
	add r3, r12
	ldr r0, _0815E274 @ =gUnknown_203F458
	ldr r1, [r0]
	ldrb r2, [r1]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r1, r0
	ldrb r1, [r1, 0xD]
	cmp r3, r1
	bgt _0815E27C
	ldr r1, _0815E278 @ =gSpecialVar_Result
	movs r0, 0
	b _0815E280
	.align 2, 0
_0815E260: .4byte gMapHeader
_0815E264: .4byte 0xfffffed6
_0815E268: .4byte gSaveBlock1Ptr
_0815E26C: .4byte 0x00003d34
_0815E270: .4byte 0xfffffed7
_0815E274: .4byte gUnknown_203F458
_0815E278: .4byte gSpecialVar_Result
_0815E27C:
	ldr r1, _0815E288 @ =gSpecialVar_Result
	movs r0, 0x1
_0815E280:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0815E288: .4byte gSpecialVar_Result
	thumb_func_end sub_815E218

	thumb_func_start sub_815E28C
sub_815E28C: @ 815E28C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r4, _0815E2D0 @ =gSaveBlock1Ptr
	ldr r0, [r4]
	ldr r5, _0815E2D4 @ =0x00003d34
	adds r1, r0, r5
	ldr r0, _0815E2D8 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	str r0, [r1]
	cmp r0, 0x3
	bls _0815E2A8
	movs r0, 0
	str r0, [r1]
_0815E2A8:
	bl sub_815EC0C
	bl sub_815D834
	cmp r0, 0
	bne _0815E2E0
	ldr r1, [r4]
	adds r0, r1, r5
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815E2DC @ =0x00003d42
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x20
	orrs r0, r2
	b _0815E2FA
	.align 2, 0
_0815E2D0: .4byte gSaveBlock1Ptr
_0815E2D4: .4byte 0x00003d34
_0815E2D8: .4byte gSpecialVar_0x8005
_0815E2DC: .4byte 0x00003d42
_0815E2E0:
	ldr r1, [r4]
	adds r0, r1, r5
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815E384 @ =0x00003d42
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
_0815E2FA:
	strb r0, [r1]
	ldr r6, _0815E388 @ =gSaveBlock1Ptr
	ldr r2, [r6]
	ldr r5, _0815E38C @ =0x00003d34
	adds r0, r2, r5
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	movs r0, 0xF5
	lsls r0, 6
	adds r2, r0
	movs r0, 0
	mov r8, r0
	mov r0, r8
	strb r0, [r2]
	ldr r0, [r6]
	adds r1, r0, r5
	ldr r2, [r1]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	ldr r4, _0815E390 @ =0x00003d38
	adds r1, r4
	adds r0, r1
	bl SetVBlankCounter1Ptr
	ldr r2, [r6]
	adds r3, r2, r5
	ldr r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r4, r2, r4
	adds r4, r0
	mov r0, r8
	str r0, [r4]
	ldr r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	ldr r3, _0815E384 @ =0x00003d42
	adds r2, r3
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r1, [r6]
	adds r5, r1, r5
	ldr r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	adds r1, r3
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815E384: .4byte 0x00003d42
_0815E388: .4byte gSaveBlock1Ptr
_0815E38C: .4byte 0x00003d34
_0815E390: .4byte 0x00003d38
	thumb_func_end sub_815E28C

	thumb_func_start sub_815E394
sub_815E394: @ 815E394
	push {lr}
	bl DisableVBlankCounter1
	ldr r3, _0815E3F8 @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r3]
	ldr r0, _0815E3FC @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r1, _0815E400 @ =0x00003d34
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	ldr r0, _0815E404 @ =0x00003d42
	adds r2, r0
	ldrb r0, [r2]
	lsls r0, 29
	cmp r0, 0
	bge _0815E3C2
	movs r0, 0x1
	strh r0, [r3]
_0815E3C2:
	ldrb r2, [r2]
	lsls r0, r2, 31
	cmp r0, 0
	beq _0815E3D6
	lsls r0, r2, 30
	cmp r0, 0
	bge _0815E3D6
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0815E3D6:
	ldr r0, _0815E3FC @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0815E400 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815E404 @ =0x00003d42
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0815E3F8: .4byte gSpecialVar_Result
_0815E3FC: .4byte gSaveBlock1Ptr
_0815E400: .4byte 0x00003d34
_0815E404: .4byte 0x00003d42
	thumb_func_end sub_815E394

	thumb_func_start sub_815E408
sub_815E408: @ 815E408
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _0815E444 @ =gUnknown_847A2B4
	ldr r0, _0815E448 @ =gUnknown_203F458
	ldr r0, [r0]
	ldrb r0, [r0, 0xF]
	lsls r0, 1
	adds r0, r1
	ldrh r4, [r0]
	ldr r0, _0815E44C @ =gSaveBlock1Ptr
	mov r8, r0
	ldr r2, [r0]
	ldr r7, _0815E450 @ =0x00003d34
	adds r0, r2, r7
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	ldr r6, _0815E454 @ =0x00003d42
	adds r2, r6
	ldrb r0, [r2]
	lsls r0, 31
	lsrs r5, r0, 31
	cmp r5, 0
	beq _0815E45C
	ldr r1, _0815E458 @ =gSpecialVar_Result
	movs r0, 0x2
	b _0815E4A0
	.align 2, 0
_0815E444: .4byte gUnknown_847A2B4
_0815E448: .4byte gUnknown_203F458
_0815E44C: .4byte gSaveBlock1Ptr
_0815E450: .4byte 0x00003d34
_0815E454: .4byte 0x00003d42
_0815E458: .4byte gSpecialVar_Result
_0815E45C:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_809A084
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0815E49C
	ldr r1, _0815E494 @ =gStringVar2
	adds r0, r4, 0
	bl sub_8099E90
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, r7
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	adds r1, r6
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0815E498 @ =gSpecialVar_Result
	strh r5, [r0]
	b _0815E4A2
	.align 2, 0
_0815E494: .4byte gStringVar2
_0815E498: .4byte gSpecialVar_Result
_0815E49C:
	ldr r1, _0815E4AC @ =gSpecialVar_Result
	movs r0, 0x1
_0815E4A0:
	strh r0, [r1]
_0815E4A2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815E4AC: .4byte gSpecialVar_Result
	thumb_func_end sub_815E408

	thumb_func_start sub_815E4B0
sub_815E4B0: @ 815E4B0
	push {r4-r6,lr}
	ldr r6, _0815E4D8 @ =gSaveBlock1Ptr
	ldr r2, [r6]
	ldr r1, _0815E4DC @ =0x00003d34
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, r1
	ldr r3, _0815E4E0 @ =0x00003d42
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 30
	lsrs r5, r0, 31
	cmp r5, 0
	beq _0815E4E8
	ldr r1, _0815E4E4 @ =gSpecialVar_Result
	movs r0, 0x2
	b _0815E534
	.align 2, 0
_0815E4D8: .4byte gSaveBlock1Ptr
_0815E4DC: .4byte 0x00003d34
_0815E4E0: .4byte 0x00003d42
_0815E4E4: .4byte gSpecialVar_Result
_0815E4E8:
	ldr r4, _0815E520 @ =0x00003d38
	adds r0, r1, r4
	adds r0, r2, r0
	adds r0, 0x4
	bl sub_815EDDC
	ldr r3, [r6]
	ldr r2, _0815E524 @ =0x00003d34
	adds r1, r3, r2
	ldr r2, [r1]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r4, r3, r4
	adds r4, r1
	ldr r4, [r4]
	cmp r0, r4
	bls _0815E530
	adds r0, r1, r3
	ldr r3, _0815E528 @ =0x00003d3c
	adds r0, r3
	adds r1, r4, 0
	bl sub_815EDF4
	ldr r0, _0815E52C @ =gSpecialVar_Result
	strh r5, [r0]
	b _0815E536
	.align 2, 0
_0815E520: .4byte 0x00003d38
_0815E524: .4byte 0x00003d34
_0815E528: .4byte 0x00003d3c
_0815E52C: .4byte gSpecialVar_Result
_0815E530:
	ldr r1, _0815E55C @ =gSpecialVar_Result
	movs r0, 0x1
_0815E534:
	strh r0, [r1]
_0815E536:
	ldr r0, _0815E560 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0815E564 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r3, _0815E568 @ =0x00003d42
	adds r1, r3
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815E55C: .4byte gSpecialVar_Result
_0815E560: .4byte gSaveBlock1Ptr
_0815E564: .4byte 0x00003d34
_0815E568: .4byte 0x00003d42
	thumb_func_end sub_815E4B0

	thumb_func_start sub_815E56C
sub_815E56C: @ 815E56C
	push {r4,lr}
	ldr r0, _0815E5A0 @ =gSaveBlock1Ptr
	ldr r4, [r0]
	ldr r1, _0815E5A4 @ =0x00003d34
	adds r0, r4, r1
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r3, r0, 2
	adds r0, r4, r3
	ldr r1, _0815E5A8 @ =0x00003d42
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	blt _0815E5BA
	subs r1, 0xA
	adds r0, r4, r1
	adds r2, r0, r3
	ldr r1, [r2]
	ldr r0, _0815E5AC @ =0x00034bbe
	cmp r1, r0
	bls _0815E5B0
	adds r0, 0x1
	str r0, [r2]
	b _0815E5BA
	.align 2, 0
_0815E5A0: .4byte gSaveBlock1Ptr
_0815E5A4: .4byte 0x00003d34
_0815E5A8: .4byte 0x00003d42
_0815E5AC: .4byte 0x00034bbe
_0815E5B0:
	ldr r1, _0815E5C0 @ =0x00003d38
	adds r0, r3, r1
	adds r0, r4, r0
	bl SetVBlankCounter1Ptr
_0815E5BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815E5C0: .4byte 0x00003d38
	thumb_func_end sub_815E56C

	thumb_func_start sub_815E5C4
sub_815E5C4: @ 815E5C4
	ldr r0, _0815E5E4 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0815E5E8 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815E5EC @ =0x00003d42
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0815E5E4: .4byte gSaveBlock1Ptr
_0815E5E8: .4byte 0x00003d34
_0815E5EC: .4byte 0x00003d42
	thumb_func_end sub_815E5C4

	thumb_func_start sub_815E5F0
sub_815E5F0: @ 815E5F0
	push {lr}
	ldr r0, _0815E620 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r1, _0815E624 @ =0x00003d34
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	ldr r0, _0815E628 @ =0x00003d42
	adds r2, r0
	ldrb r1, [r2]
	lsls r0, r1, 28
	cmp r0, 0
	bge _0815E630
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r1, _0815E62C @ =gSpecialVar_Result
	movs r0, 0
	b _0815E64C
	.align 2, 0
_0815E620: .4byte gSaveBlock1Ptr
_0815E624: .4byte 0x00003d34
_0815E628: .4byte 0x00003d42
_0815E62C: .4byte gSpecialVar_Result
_0815E630:
	lsls r0, r1, 27
	cmp r0, 0
	bge _0815E648
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r1, _0815E644 @ =gSpecialVar_Result
	movs r0, 0x1
	b _0815E64C
	.align 2, 0
_0815E644: .4byte gSpecialVar_Result
_0815E648:
	ldr r1, _0815E654 @ =gSpecialVar_Result
	movs r0, 0x2
_0815E64C:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0815E654: .4byte gSpecialVar_Result
	thumb_func_end sub_815E5F0

	thumb_func_start sub_815E658
sub_815E658: @ 815E658
	push {r4-r6,lr}
	ldr r4, _0815E700 @ =gSaveBlock1Ptr
	ldr r2, [r4]
	ldr r6, _0815E704 @ =0x00003d34
	adds r0, r2, r6
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r5, _0815E708 @ =0x00003d38
	adds r2, r5
	adds r2, r0
	ldr r1, [r2]
	ldr r0, _0815E70C @ =0x00034bbe
	cmp r1, r0
	bls _0815E690
	bl DisableVBlankCounter1
	ldr r1, [r4]
	adds r0, r1, r6
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r5
	adds r1, r0
	ldr r0, _0815E710 @ =0x00034bbf
	str r0, [r1]
_0815E690:
	ldr r1, [r4]
	adds r0, r1, r6
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r5
	adds r1, r0
	ldr r4, [r1]
	movs r5, 0xE1
	lsls r5, 4
	adds r0, r4, 0
	adds r1, r5, 0
	bl __divsi3
	adds r6, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	bl __modsi3
	adds r4, r0, 0
	movs r1, 0x3C
	bl __divsi3
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0x3C
	bl __modsi3
	movs r1, 0xA8
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r4, r0, 0
	ldr r0, _0815E714 @ =gStringVar1
	adds r1, r6, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815E718 @ =gStringVar2
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815E71C @ =gStringVar3
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815E700: .4byte gSaveBlock1Ptr
_0815E704: .4byte 0x00003d34
_0815E708: .4byte 0x00003d38
_0815E70C: .4byte 0x00034bbe
_0815E710: .4byte 0x00034bbf
_0815E714: .4byte gStringVar1
_0815E718: .4byte gStringVar2
_0815E71C: .4byte gStringVar3
	thumb_func_end sub_815E658

	thumb_func_start sub_815E720
sub_815E720: @ 815E720
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	bl sub_815EC0C
	ldr r0, _0815E85C @ =gUnknown_847A218
	bl AddWindow
	lsls r0, 24
	lsrs r7, r0, 24
	bl sub_80F6E9C
	adds r0, r7, 0
	movs r1, 0
	bl sub_80F6F1C
	ldr r2, _0815E860 @ =gUnknown_83FE982
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	movs r3, 0x4A
	bl AddTextPrinterParameterized
	movs r0, 0
	mov r8, r0
	movs r1, 0xB8
	lsls r1, 22
	mov r10, r1
	movs r0, 0x90
	lsls r0, 22
	mov r9, r0
_0815E76C:
	ldr r0, _0815E864 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r1, _0815E868 @ =0x00003d34
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0815E86C @ =0x00003d3c
	adds r0, r1
	bl sub_815EDDC
	adds r4, r0, 0
	movs r5, 0xE1
	lsls r5, 4
	adds r1, r5, 0
	bl __divsi3
	adds r6, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	bl __modsi3
	adds r4, r0, 0
	movs r1, 0x3C
	bl __divsi3
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0x3C
	bl __modsi3
	movs r1, 0xA8
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r4, r0, 0
	ldr r0, _0815E870 @ =gStringVar1
	adds r1, r6, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815E874 @ =gStringVar2
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815E878 @ =gStringVar3
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815E87C @ =gStringVar4
	ldr r1, _0815E880 @ =gUnknown_83FE998
	bl StringExpandPlaceholders
	ldr r1, _0815E884 @ =gUnknown_83FE9C4
	mov r0, r8
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	mov r1, r9
	lsrs r0, r1, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	movs r3, 0x18
	bl AddTextPrinterParameterized
	mov r1, r10
	lsrs r0, r1, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0x2
	ldr r2, _0815E87C @ =gStringVar4
	movs r3, 0x60
	bl AddTextPrinterParameterized
	movs r0, 0xA0
	lsls r0, 21
	add r10, r0
	add r9, r0
	movs r1, 0x1
	add r8, r1
	mov r0, r8
	cmp r0, 0x3
	ble _0815E76C
	adds r0, r7, 0
	bl PutWindowTilemap
	adds r0, r7, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _0815E888 @ =0x00004001
	adds r1, r7, 0
	bl VarSet
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815E85C: .4byte gUnknown_847A218
_0815E860: .4byte gUnknown_83FE982
_0815E864: .4byte gSaveBlock1Ptr
_0815E868: .4byte 0x00003d34
_0815E86C: .4byte 0x00003d3c
_0815E870: .4byte gStringVar1
_0815E874: .4byte gStringVar2
_0815E878: .4byte gStringVar3
_0815E87C: .4byte gStringVar4
_0815E880: .4byte gUnknown_83FE998
_0815E884: .4byte gUnknown_83FE9C4
_0815E888: .4byte 0x00004001
	thumb_func_end sub_815E720

	thumb_func_start sub_815E88C
sub_815E88C: @ 815E88C
	push {r4,lr}
	ldr r0, _0815E8B0 @ =0x00004001
	bl VarGet
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_810F4D8
	adds r0, r4, 0
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815E8B0: .4byte 0x00004001
	thumb_func_end sub_815E88C

	thumb_func_start sub_815E8B4
sub_815E8B4: @ 815E8B4
	push {r4,lr}
	ldr r4, _0815E8C8 @ =gSpecialVar_Result
	bl GetMonsStateToDoubles
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815E8C8: .4byte gSpecialVar_Result
	thumb_func_end sub_815E8B4

	thumb_func_start sub_815E8CC
sub_815E8CC: @ 815E8CC
	push {lr}
	ldr r0, _0815E8EC @ =gUnknown_203F458
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	ldrb r2, [r1, 0xD]
	cmp r0, r2
	beq _0815E8F8
	ldr r0, _0815E8F0 @ =gStringVar1
	ldrb r1, [r1, 0x4]
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r1, _0815E8F4 @ =gSpecialVar_Result
	movs r0, 0x1
	b _0815E8FC
	.align 2, 0
_0815E8EC: .4byte gUnknown_203F458
_0815E8F0: .4byte gStringVar1
_0815E8F4: .4byte gSpecialVar_Result
_0815E8F8:
	ldr r1, _0815E904 @ =gSpecialVar_Result
	movs r0, 0
_0815E8FC:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0815E904: .4byte gSpecialVar_Result
	thumb_func_end sub_815E8CC

	thumb_func_start sub_815E908
sub_815E908: @ 815E908
	push {lr}
	ldr r0, _0815E928 @ =gMapHeader
	ldrh r1, [r0, 0x12]
	ldr r0, _0815E92C @ =0x00000129
	cmp r1, r0
	bne _0815E938
	ldr r0, _0815E930 @ =0x00004082
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0815E938
	ldr r0, _0815E934 @ =gSpecialVar_Result
	strh r1, [r0]
	b _0815E93E
	.align 2, 0
_0815E928: .4byte gMapHeader
_0815E92C: .4byte 0x00000129
_0815E930: .4byte 0x00004082
_0815E934: .4byte gSpecialVar_Result
_0815E938:
	ldr r1, _0815E944 @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r1]
_0815E93E:
	pop {r0}
	bx r0
	.align 2, 0
_0815E944: .4byte gSpecialVar_Result
	thumb_func_end sub_815E908

	thumb_func_start sub_815E948
sub_815E948: @ 815E948
	push {r4,lr}
	ldr r0, _0815E97C @ =0x00004001
	bl VarGet
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _0815E980 @ =gUnknown_203F458
	ldr r3, [r0]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r2
	lsls r1, 3
	ldrb r2, [r3]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r1, r0
	adds r3, r1
	ldrb r1, [r3, 0x1B]
	movs r3, 0
	ldr r2, _0815E984 @ =gUnknown_847A074
	ldr r0, _0815E988 @ =gFacilityClassToTrainerClass
	adds r1, r0
	b _0815E994
	.align 2, 0
_0815E97C: .4byte 0x00004001
_0815E980: .4byte gUnknown_203F458
_0815E984: .4byte gUnknown_847A074
_0815E988: .4byte gFacilityClassToTrainerClass
_0815E98C:
	adds r2, 0x4
	adds r3, 0x1
	cmp r3, 0x68
	bhi _0815E99C
_0815E994:
	ldrb r0, [r2]
	ldrb r4, [r1]
	cmp r0, r4
	bne _0815E98C
_0815E99C:
	cmp r3, 0x69
	beq _0815E9B0
	ldr r1, _0815E9AC @ =gUnknown_847A074
	lsls r0, r3, 2
	adds r0, r1
	ldrb r2, [r0, 0x1]
	b _0815E9B2
	.align 2, 0
_0815E9AC: .4byte gUnknown_847A074
_0815E9B0:
	movs r2, 0
_0815E9B2:
	ldr r0, _0815E9C4 @ =gUnknown_847A2D2
	lsls r1, r2, 1
	adds r1, r0
	ldrh r0, [r1]
	bl PlayNewMapMusic
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815E9C4: .4byte gUnknown_847A2D2
	thumb_func_end sub_815E948

	thumb_func_start sub_815E9C8
sub_815E9C8: @ 815E9C8
	ldr r3, _0815E9EC @ =gSpecialVar_Result
	ldr r0, _0815E9F0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0815E9F4 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815E9F8 @ =0x00003d42
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	lsrs r0, 31
	strh r0, [r3]
	bx lr
	.align 2, 0
_0815E9EC: .4byte gSpecialVar_Result
_0815E9F0: .4byte gSaveBlock1Ptr
_0815E9F4: .4byte 0x00003d34
_0815E9F8: .4byte 0x00003d42
	thumb_func_end sub_815E9C8

	thumb_func_start sub_815E9FC
sub_815E9FC: @ 815E9FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _0815EABC @ =0x00004001
	bl VarGet
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_815EBB8
	mov r9, r0
	ldr r0, _0815EAC0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r2, _0815EAC4 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0xF5
	lsls r0, 6
	adds r1, r0
	ldrb r5, [r1]
	bl ZeroEnemyPartyMons
	ldr r1, _0815EAC8 @ =gUnknown_203F458
	mov r10, r1
	ldr r6, [r1]
	ldrb r1, [r6]
	lsls r0, r1, 5
	subs r0, r1
	lsls r7, r0, 5
	adds r0, r6, r7
	ldrb r0, [r0, 0xE]
	cmp r0, 0x1
	beq _0815EAD4
	cmp r0, 0x1
	ble _0815EA56
	cmp r0, 0x2
	bne _0815EA56
	b _0815EB58
_0815EA56:
	movs r6, 0
	lsls r5, 1
	str r5, [sp]
	lsls r0, r4, 2
	mov r5, r10
	adds r0, r4
	lsls r0, 3
	adds r0, r4
	lsls r7, r0, 3
	adds r2, r7, 0x4
	mov r8, r2
_0815EA6C:
	ldr r1, _0815EACC @ =gUnknown_847A2EE
	ldr r2, [sp]
	adds r0, r6, r2
	adds r0, r1
	ldrb r2, [r0]
	ldr r3, [r5]
	movs r0, 0x2C
	adds r4, r2, 0
	muls r4, r0
	adds r2, r4, r7
	ldrb r1, [r3]
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 5
	adds r2, r0
	adds r3, r2
	adds r3, 0x5C
	mov r0, r9
	strb r0, [r3]
	movs r0, 0x64
	muls r0, r6
	ldr r1, _0815EAD0 @ =gEnemyParty
	adds r0, r1
	ldr r1, [r5]
	ldrb r3, [r1]
	lsls r2, r3, 5
	subs r2, r3
	lsls r2, 5
	adds r2, 0xC
	adds r1, r2
	add r1, r8
	adds r4, 0x40
	adds r1, r4
	bl sub_803E0A4
	adds r6, 0x1
	cmp r6, 0x1
	ble _0815EA6C
	b _0815EB9E
	.align 2, 0
_0815EABC: .4byte 0x00004001
_0815EAC0: .4byte gSaveBlock1Ptr
_0815EAC4: .4byte 0x00003d34
_0815EAC8: .4byte gUnknown_203F458
_0815EACC: .4byte gUnknown_847A2EE
_0815EAD0: .4byte gEnemyParty
_0815EAD4:
	ldr r4, _0815EB50 @ =gUnknown_847A2FE
	lsls r5, 1
	adds r0, r5, r4
	ldrb r2, [r0]
	movs r1, 0x2C
	mov r8, r1
	mov r3, r8
	muls r3, r2
	adds r0, r3, r7
	adds r0, r6, r0
	adds r0, 0x5C
	mov r2, r9
	strb r2, [r0]
	ldr r6, _0815EB54 @ =gEnemyParty
	mov r0, r10
	ldr r1, [r0]
	ldrb r2, [r1]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r0, 0xC
	adds r1, r0
	adds r3, 0x44
	adds r1, r3
	adds r0, r6, 0
	bl sub_803E0A4
	adds r4, 0x1
	adds r5, r4
	ldrb r2, [r5]
	mov r0, r10
	ldr r1, [r0]
	mov r3, r8
	muls r3, r2
	ldrb r2, [r1]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r0, r3, r0
	adds r1, r0
	movs r2, 0xD2
	lsls r2, 1
	adds r1, r2
	mov r0, r9
	strb r0, [r1]
	adds r6, 0x64
	mov r2, r10
	ldr r1, [r2]
	ldrb r2, [r1]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 5
	adds r0, 0xC
	adds r1, r0
	movs r0, 0xC6
	lsls r0, 1
	adds r3, r0
	adds r1, r3
	adds r0, r6, 0
	bl sub_803E0A4
	b _0815EB9E
	.align 2, 0
_0815EB50: .4byte gUnknown_847A2FE
_0815EB54: .4byte gEnemyParty
_0815EB58:
	ldr r1, _0815EBB0 @ =gUnknown_847A30E
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r4, r0
	adds r0, r1
	ldrb r2, [r0]
	movs r0, 0x2C
	adds r5, r2, 0
	muls r5, r0
	lsls r3, r4, 2
	adds r3, r4
	lsls r3, 3
	adds r3, r4
	lsls r3, 3
	adds r0, r5, r3
	adds r0, r7
	adds r0, r6, r0
	adds r0, 0x5C
	mov r1, r9
	strb r1, [r0]
	ldr r0, _0815EBB4 @ =gEnemyParty
	mov r2, r10
	ldr r1, [r2]
	ldrb r4, [r1]
	lsls r2, r4, 5
	subs r2, r4
	lsls r2, 5
	adds r2, 0xC
	adds r1, r2
	adds r3, 0x4
	adds r1, r3
	adds r5, 0x40
	adds r1, r5
	bl sub_803E0A4
_0815EB9E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815EBB0: .4byte gUnknown_847A30E
_0815EBB4: .4byte gEnemyParty
	thumb_func_end sub_815E9FC

	thumb_func_start sub_815EBB8
sub_815EBB8: @ 815EBB8
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
_0815EBBE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0815EC08 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0815EBF8
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0815EBF8
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	cmp r0, r6
	ble _0815EBF8
	adds r6, r0, 0
_0815EBF8:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0815EBBE
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0815EC08: .4byte gPlayerParty
	thumb_func_end sub_815EBB8

	thumb_func_start sub_815EC0C
sub_815EC0C: @ 815EC0C
	push {r4,lr}
	ldr r4, _0815EC70 @ =gSaveBlock1Ptr
	ldr r2, [r4]
	ldr r1, _0815EC74 @ =0x00003d34
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	ldr r0, _0815EC78 @ =0x00003d41
	adds r2, r0
	ldr r0, _0815EC7C @ =gUnknown_203F458
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r0, [r2]
	cmp r0, r1
	beq _0815EC6A
	strb r1, [r2]
	ldr r2, [r4]
	ldr r1, _0815EC74 @ =0x00003d34
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r2, _0815EC80 @ =0x00003d3c
	adds r0, r2
	ldr r1, _0815EC84 @ =0x00034bbf
	bl sub_815EDF4
	ldr r1, [r4]
	ldr r2, _0815EC74 @ =0x00003d34
	adds r0, r1, r2
	ldr r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _0815EC88 @ =0x00003d42
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_0815EC6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815EC70: .4byte gSaveBlock1Ptr
_0815EC74: .4byte 0x00003d34
_0815EC78: .4byte 0x00003d41
_0815EC7C: .4byte gUnknown_203F458
_0815EC80: .4byte 0x00003d3c
_0815EC84: .4byte 0x00034bbf
_0815EC88: .4byte 0x00003d42
	thumb_func_end sub_815EC0C

	thumb_func_start sub_815EC8C
sub_815EC8C: @ 815EC8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r8, r0
	bl sub_815DC8C
	movs r0, 0xD8
	str r0, [sp]
	movs r0, 0x90
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
	bl sub_815EC0C
	ldr r4, _0815EDB4 @ =gUnknown_847A22C
	str r4, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	ldr r0, _0815EDB8 @ =gUnknown_83FE982
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x4A
	movs r3, 0
	bl box_print
	movs r7, 0
	movs r0, 0x90
	lsls r0, 22
	mov r10, r0
	ldr r0, _0815EDBC @ =0x00003d38
	mov r9, r0
_0815ECDC:
	ldr r0, _0815EDC0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	add r0, r9
	adds r0, 0x4
	bl sub_815EDDC
	adds r4, r0, 0
	movs r5, 0xE1
	lsls r5, 4
	adds r1, r5, 0
	bl __divsi3
	adds r6, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	bl __modsi3
	adds r4, r0, 0
	movs r1, 0x3C
	bl __divsi3
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0x3C
	bl __modsi3
	movs r1, 0xA8
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r4, r0, 0
	ldr r0, _0815EDC4 @ =gStringVar1
	adds r1, r6, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815EDC8 @ =gStringVar2
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815EDCC @ =gStringVar3
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0815EDD0 @ =gStringVar4
	ldr r1, _0815EDD4 @ =gUnknown_83FE998
	bl StringExpandPlaceholders
	lsls r1, r7, 2
	mov r0, r10
	lsrs r4, r0, 24
	ldr r0, _0815EDB4 @ =gUnknown_847A22C
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0815EDD8 @ =gUnknown_83FE9C4
	adds r1, r0
	ldr r0, [r1]
	str r0, [sp, 0x8]
	mov r0, r8
	movs r1, 0x2
	movs r2, 0x18
	adds r3, r4, 0
	bl box_print
	ldr r0, _0815EDB4 @ =gUnknown_847A22C
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0815EDD0 @ =gStringVar4
	str r0, [sp, 0x8]
	mov r0, r8
	movs r1, 0x2
	movs r2, 0x60
	adds r3, r4, 0
	bl box_print
	movs r0, 0xA0
	lsls r0, 21
	add r10, r0
	movs r0, 0xC
	add r9, r0
	adds r7, 0x1
	cmp r7, 0x3
	ble _0815ECDC
	mov r0, r8
	bl PutWindowTilemap
	mov r0, r8
	movs r1, 0x3
	bl CopyWindowToVram
	bl sub_815DD2C
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815EDB4: .4byte gUnknown_847A22C
_0815EDB8: .4byte gUnknown_83FE982
_0815EDBC: .4byte 0x00003d38
_0815EDC0: .4byte gSaveBlock1Ptr
_0815EDC4: .4byte gStringVar1
_0815EDC8: .4byte gStringVar2
_0815EDCC: .4byte gStringVar3
_0815EDD0: .4byte gStringVar4
_0815EDD4: .4byte gUnknown_83FE998
_0815EDD8: .4byte gUnknown_83FE9C4
	thumb_func_end sub_815EC8C

	.align 2, 0 @ Don't pad with nop.
