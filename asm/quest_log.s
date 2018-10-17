	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8113364
sub_8113364: @ 8113364
	push {lr}
	ldr r0, _08113378 @ =0x00004038
	bl GetVarPointer
	bl sub_811337C
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08113378: .4byte 0x00004038
	thumb_func_end sub_8113364

	thumb_func_start sub_811337C
sub_811337C: @ 811337C
	ldrb r0, [r0, 0x1]
	ldr r1, _0811338C @ =gUnknown_20370C0
	ldrh r1, [r1]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0811338C: .4byte gUnknown_20370C0
	thumb_func_end sub_811337C

	thumb_func_start sub_8113390
sub_8113390: @ 8113390
	ldrb r2, [r0, 0x1]
	movs r1, 0x1
	orrs r1, r2
	movs r2, 0x2
	orrs r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x1]
	bx lr
	thumb_func_end sub_8113390

	thumb_func_start sub_81133A4
sub_81133A4: @ 81133A4
	push {lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _081133BC @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0x7
	bhi _081133F8
	lsls r0, 2
	ldr r1, _081133C0 @ =_081133C4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081133BC: .4byte gUnknown_20370C0
_081133C0: .4byte _081133C4
	.align 2, 0
_081133C4:
	.4byte _081133E4
	.4byte _081133F8
	.4byte _081133F8
	.4byte _081133F8
	.4byte _081133EA
	.4byte _081133F0
	.4byte _081133F4
	.4byte _081133F8
_081133E4:
	movs r2, 0
	movs r3, 0
	b _081133F8
_081133EA:
	movs r2, 0x1
	movs r3, 0
	b _081133F8
_081133F0:
	movs r2, 0
	b _081133F6
_081133F4:
	movs r2, 0x2
_081133F6:
	movs r3, 0x1
_081133F8:
	ldr r0, _0811340C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r1, _08113410 @ =0x00000a98
	adds r0, r1
	adds r1, r3, 0
	bl sub_8113414
	pop {r0}
	bx r0
	.align 2, 0
_0811340C: .4byte gSaveBlock2Ptr
_08113410: .4byte 0x00000a98
	thumb_func_end sub_81133A4

	thumb_func_start sub_8113414
sub_8113414: @ 8113414
	push {r4,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r3, r2, 0
	lsrs r1, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08113478
	cmp r2, 0x1
	beq _08113436
	cmp r2, 0x1
	ble _0811345C
	cmp r3, 0x2
	beq _08113448
	b _0811345C
_08113436:
	ldr r0, _08113440 @ =gStringVar1
	ldr r1, _08113444 @ =gUnknown_84178D0
	bl StringCopy
	b _081134B2
	.align 2, 0
_08113440: .4byte gStringVar1
_08113444: .4byte gUnknown_84178D0
_08113448:
	ldr r0, _08113454 @ =gStringVar1
	ldr r1, _08113458 @ =gUnknown_84178DA
	bl StringCopy
	b _081134B2
	.align 2, 0
_08113454: .4byte gStringVar1
_08113458: .4byte gUnknown_84178DA
_0811345C:
	ldr r0, _0811346C @ =gStringVar1
	ldr r1, _08113470 @ =gSaveBlock1Ptr
	ldr r1, [r1]
	ldr r2, _08113474 @ =0x00003a4c
	adds r1, r2
	bl StringCopy
	b _081134B2
	.align 2, 0
_0811346C: .4byte gStringVar1
_08113470: .4byte gSaveBlock1Ptr
_08113474: .4byte 0x00003a4c
_08113478:
	ldr r4, _08113498 @ =gStringVar1
	adds r0, r4, 0
	movs r2, 0x7
	bl StringCopyN
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _081134B2
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _081134B2
	adds r4, 0x2
	b _0811349E
	.align 2, 0
_08113498: .4byte gStringVar1
_0811349C:
	adds r4, 0x1
_0811349E:
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _0811349C
	movs r0, 0xFC
	strb r0, [r4]
	adds r4, 0x1
	movs r0, 0x16
	strb r0, [r4]
	movs r0, 0xFF
	strb r0, [r4, 0x1]
_081134B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8113414

	thumb_func_start sub_81134B8
sub_81134B8: @ 81134B8
	push {lr}
	ldr r0, _081134C8 @ =0x00004038
	bl GetVarPointer
	bl sub_81134CC
	pop {r0}
	bx r0
	.align 2, 0
_081134C8: .4byte 0x00004038
	thumb_func_end sub_81134B8

	thumb_func_start sub_81134CC
sub_81134CC: @ 81134CC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081134F4 @ =0x00004073
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _08113502
	adds r0, r4, 0
	bl sub_8113078
	ldr r0, _081134F8 @ =gUnknown_2023E8A
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081134FC
	adds r0, r4, 0
	bl sub_8113194
	b _08113502
	.align 2, 0
_081134F4: .4byte 0x00004073
_081134F8: .4byte gUnknown_2023E8A
_081134FC:
	adds r0, r4, 0
	bl sub_81131FC
_08113502:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81134CC

	thumb_func_start sub_8113508
sub_8113508: @ 8113508
	ldr r0, [r0]
	lsls r0, 24
	lsrs r0, 31
	bx lr
	thumb_func_end sub_8113508

	thumb_func_start sub_8113510
sub_8113510: @ 8113510
	push {lr}
	ldr r0, _08113520 @ =0x00004038
	bl GetVarPointer
	bl sub_8113524
	pop {r0}
	bx r0
	.align 2, 0
_08113520: .4byte 0x00004038
	thumb_func_end sub_8113510

	thumb_func_start sub_8113524
sub_8113524: @ 8113524
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_8113524

	thumb_func_start sub_8113530
sub_8113530: @ 8113530
	push {lr}
	ldr r0, _08113548 @ =0x00004038
	bl GetVarPointer
	ldr r1, _0811354C @ =gUnknown_20370C0
	ldrb r1, [r1]
	bl sub_8113114
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08113548: .4byte 0x00004038
_0811354C: .4byte gUnknown_20370C0
	thumb_func_end sub_8113530

	thumb_func_start sub_8113550
sub_8113550: @ 8113550
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x23
	bne _08113570
	ldr r0, _0811356C @ =gUnknown_203B048
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08113570
	bl sub_811381C
	b _081136BC
	.align 2, 0
_0811356C: .4byte gUnknown_203B048
_08113570:
	bl sub_811381C
	ldr r0, _0811362C @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0811357E
	b _081136BC
_0811357E:
	subs r0, r4, 0x3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x27
	bls _0811358A
	b _081136BC
_0811358A:
	bl sub_81136D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08113598
	b _081136BC
_08113598:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81138A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081135AA
	b _081136BC
_081135AA:
	bl sub_80BF708
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081135B8
	b _081136BC
_081135B8:
	bl InUnionRoom
	cmp r0, 0x1
	bne _081135C2
	b _081136BC
_081135C2:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8113954
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081136BC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8113A44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081136BC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81153E4
	lsls r0, 24
	cmp r0, 0
	beq _081136BC
	ldr r0, _08113630 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113638
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8113778
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081136BC
	cmp r4, 0x1F
	bne _08113614
	ldr r0, _08113634 @ =gUnknown_203AE04
	ldr r0, [r0]
	cmp r0, 0
	bne _0811363C
_08113614:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81153A8
	lsls r0, 24
	cmp r0, 0
	beq _081136BC
	adds r0, r4, 0
	bl sub_8110AEC
	b _0811363C
	.align 2, 0
_0811362C: .4byte gUnknown_203ADFA
_08113630: .4byte gUnknown_3005E88
_08113634: .4byte gUnknown_203AE04
_08113638:
	cmp r4, 0x28
	beq _081136BC
_0811363C:
	adds r0, r4, 0
	bl sub_8113B94
	cmp r4, 0x1F
	bne _0811367C
	ldr r2, _0811365C @ =gUnknown_203AE04
	ldr r1, [r2]
	cmp r1, 0
	bne _08113668
	ldr r0, _08113660 @ =gUnknown_203AE08
	ldr r0, [r0]
	str r0, [r2]
	ldr r1, _08113664 @ =gUnknown_8456948
	ldr r2, [r1, 0x7C]
	b _0811368E
	.align 2, 0
_0811365C: .4byte gUnknown_203AE04
_08113660: .4byte gUnknown_203AE08
_08113664: .4byte gUnknown_8456948
_08113668:
	ldr r0, _08113678 @ =gUnknown_8456948
	ldr r2, [r0, 0x7C]
	adds r0, r1, 0
	adds r1, r5, 0
	bl _call_via_r2
	b _081136BC
	.align 2, 0
_08113678: .4byte gUnknown_8456948
_0811367C:
	ldr r1, _081136C4 @ =gUnknown_203AE04
	movs r0, 0
	str r0, [r1]
	ldr r0, _081136C8 @ =gUnknown_8456948
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, _081136CC @ =gUnknown_203AE08
	ldr r0, [r0]
	ldr r2, [r1]
_0811368E:
	adds r1, r5, 0
	bl _call_via_r2
	adds r1, r0, 0
	cmp r1, 0
	bne _081136AC
	bl sub_811231C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8113828
	adds r1, r0, 0
	cmp r1, 0
	beq _081136BC
_081136AC:
	ldr r0, _081136CC @ =gUnknown_203AE08
	str r1, [r0]
	ldr r0, _081136D0 @ =gUnknown_203B048
	ldrb r0, [r0]
	cmp r0, 0
	beq _081136BC
	bl sub_811231C
_081136BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081136C4: .4byte gUnknown_203AE04
_081136C8: .4byte gUnknown_8456948
_081136CC: .4byte gUnknown_203AE08
_081136D0: .4byte gUnknown_203B048
	thumb_func_end sub_8113550

	thumb_func_start sub_81136D4
sub_81136D4: @ 81136D4
	push {lr}
	ldr r0, _08113728 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	adds r3, r0, 0
	cmp r1, 0x2
	bne _081136F0
	ldrb r0, [r2, 0x5]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _08113724
_081136F0:
	ldr r2, [r3]
	ldrh r1, [r2, 0x4]
	ldr r0, _0811372C @ =0x0000090e
	cmp r1, r0
	beq _08113724
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r0, 0x1F
	bne _08113708
	ldrb r0, [r2, 0x5]
	cmp r0, 0x1
	bls _08113724
_08113708:
	ldr r0, [r3]
	ldrh r1, [r0, 0x4]
	ldr r0, _08113730 @ =0x00002e01
	cmp r1, r0
	beq _08113724
	ldr r0, _08113734 @ =0x00003a01
	cmp r1, r0
	beq _08113724
	ldr r0, _08113738 @ =0x00000b02
	cmp r1, r0
	beq _08113724
	ldr r0, _0811373C @ =0x0000060a
	cmp r1, r0
	bne _08113740
_08113724:
	movs r0, 0x1
	b _08113742
	.align 2, 0
_08113728: .4byte gSaveBlock1Ptr
_0811372C: .4byte 0x0000090e
_08113730: .4byte 0x00002e01
_08113734: .4byte 0x00003a01
_08113738: .4byte 0x00000b02
_0811373C: .4byte 0x0000060a
_08113740:
	movs r0, 0
_08113742:
	pop {r1}
	bx r1
	thumb_func_end sub_81136D4

	thumb_func_start sub_8113748
sub_8113748: @ 8113748
	push {lr}
	bl sub_81136D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08113770
	ldr r0, _08113764 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08113768
	movs r0, 0x1
	b _08113772
	.align 2, 0
_08113764: .4byte gUnknown_203ADFA
_08113768:
	cmp r0, 0x1
	bne _08113770
	bl sub_8112364
_08113770:
	movs r0, 0
_08113772:
	pop {r1}
	bx r1
	thumb_func_end sub_8113748

	thumb_func_start sub_8113778
sub_8113778: @ 8113778
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x24
	beq _081137CE
	cmp r4, 0xB
	beq _081137CE
	ldr r0, _081137D4 @ =0x0000082c
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081137AC
	cmp r4, 0x3
	beq _081137CE
	cmp r4, 0x1F
	beq _081137CE
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81137E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081137CE
_081137AC:
	ldr r0, _081137D8 @ =0x00000844
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081137DC
	subs r0, r4, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bls _081137CE
	cmp r4, 0x16
	beq _081137CE
	cmp r4, 0x19
	beq _081137CE
	cmp r4, 0x1A
	bne _081137DC
_081137CE:
	movs r0, 0x1
	b _081137DE
	.align 2, 0
_081137D4: .4byte 0x0000082c
_081137D8: .4byte 0x00000844
_081137DC:
	movs r0, 0
_081137DE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113778

	thumb_func_start sub_81137E4
sub_81137E4: @ 81137E4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x22
	bne _08113814
	ldr r2, _08113810 @ =gTrainers
	ldrh r1, [r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x1]
	cmp r1, 0x51
	beq _08113814
	cmp r1, 0x59
	beq _08113814
	cmp r1, 0x5A
	beq _08113814
	cmp r1, 0x53
	beq _08113814
	movs r0, 0x1
	b _08113816
	.align 2, 0
_08113810: .4byte gTrainers
_08113814:
	movs r0, 0
_08113816:
	pop {r1}
	bx r1
	thumb_func_end sub_81137E4

	thumb_func_start sub_811381C
sub_811381C: @ 811381C
	ldr r1, _08113824 @ =gUnknown_203B048
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08113824: .4byte gUnknown_203B048
	thumb_func_end sub_811381C

	thumb_func_start sub_8113828
sub_8113828: @ 8113828
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8113778
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811384C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81153A8
	lsls r0, 24
	cmp r0, 0
	bne _08113850
_0811384C:
	movs r0, 0
	b _0811388C
_08113850:
	adds r0, r4, 0
	bl sub_8110AEC
	adds r0, r4, 0
	bl sub_8113B94
	cmp r4, 0x1F
	bne _08113874
	ldr r2, _0811386C @ =gUnknown_203AE04
	ldr r1, _08113870 @ =gUnknown_203AE08
	ldr r0, [r1]
	str r0, [r2]
	adds r2, r1, 0
	b _0811387C
	.align 2, 0
_0811386C: .4byte gUnknown_203AE04
_08113870: .4byte gUnknown_203AE08
_08113874:
	ldr r1, _08113894 @ =gUnknown_203AE04
	movs r0, 0
	str r0, [r1]
	ldr r2, _08113898 @ =gUnknown_203AE08
_0811387C:
	ldr r0, _0811389C @ =gUnknown_8456948
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r2]
	ldr r2, [r1]
	adds r1, r5, 0
	bl _call_via_r2
_0811388C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08113894: .4byte gUnknown_203AE04
_08113898: .4byte gUnknown_203AE08
_0811389C: .4byte gUnknown_8456948
	thumb_func_end sub_8113828

	thumb_func_start sub_81138A0
sub_81138A0: @ 81138A0
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0, 0
	subs r0, 0xC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7
	bls _081138B8
	movs r0, 0
	b _081138F0
_081138B8:
	bl sub_81138F8
	ldr r1, _081138E0 @ =gUnknown_203B024
	strh r4, [r1]
	adds r0, r4, 0
	subs r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _081138EE
	cmp r4, 0xC
	beq _081138D4
	cmp r4, 0x12
	bne _081138E4
_081138D4:
	adds r0, r1, 0x4
	adds r1, r5, 0
	movs r2, 0xC
	bl memcpy
	b _081138EE
	.align 2, 0
_081138E0: .4byte gUnknown_203B024
_081138E4:
	adds r0, r1, 0x4
	adds r1, r5, 0
	movs r2, 0x18
	bl memcpy
_081138EE:
	movs r0, 0x1
_081138F0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81138A0

	thumb_func_start sub_81138F8
sub_81138F8: @ 81138F8
	push {lr}
	ldr r0, _08113908 @ =gUnknown_203B024
	movs r1, 0
	movs r2, 0x20
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08113908: .4byte gUnknown_203B024
	thumb_func_end sub_81138F8

	thumb_func_start sub_811390C
sub_811390C: @ 811390C
	push {r4,r5,lr}
	ldr r5, _08113944 @ =gUnknown_203B024
	ldrh r0, [r5]
	cmp r0, 0
	beq _0811393C
	ldr r1, _08113948 @ =gUnknown_203B04A
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r5]
	bl sub_8110AEC
	ldr r0, _0811394C @ =gUnknown_8456948
	ldrh r2, [r5]
	lsls r2, 2
	adds r2, r0
	ldr r4, _08113950 @ =gUnknown_203AE08
	ldr r0, [r4]
	adds r1, r5, 0x4
	ldr r2, [r2]
	bl _call_via_r2
	str r0, [r4]
	bl sub_81138F8
_0811393C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113944: .4byte gUnknown_203B024
_08113948: .4byte gUnknown_203B04A
_0811394C: .4byte gUnknown_8456948
_08113950: .4byte gUnknown_203AE08
	thumb_func_end sub_811390C

	thumb_func_start sub_8113954
sub_8113954: @ 8113954
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x22
	beq _08113970
	cmp r4, 0x1E
	beq _08113970
	cmp r4, 0x20
	beq _08113970
	cmp r4, 0x21
	beq _08113970
	movs r0, 0
	b _081139A8
_08113970:
	bl sub_81138F8
	ldr r0, _081139B0 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113998
	ldr r0, _081139B4 @ =0x0000082c
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08113998
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_81137E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081139A6
_08113998:
	ldr r0, _081139B8 @ =gUnknown_203B024
	strh r4, [r0]
	adds r0, 0x4
	adds r1, r5, 0
	movs r2, 0x8
	bl memcpy
_081139A6:
	movs r0, 0x1
_081139A8:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081139B0: .4byte gUnknown_3005E88
_081139B4: .4byte 0x0000082c
_081139B8: .4byte gUnknown_203B024
	thumb_func_end sub_8113954

	thumb_func_start sub_81139BC
sub_81139BC: @ 81139BC
	push {r4,r5,lr}
	ldr r5, _08113A08 @ =gUnknown_203B024
	ldrh r0, [r5]
	cmp r0, 0
	beq _08113A02
	ldr r0, _08113A0C @ =gUnknown_3005E88
	ldrb r1, [r0]
	cmp r1, 0
	bne _081139D8
	ldr r0, _08113A10 @ =gUnknown_203B04A
	strb r1, [r0]
	ldrh r0, [r5]
	bl sub_8110AEC
_081139D8:
	ldrh r0, [r5]
	bl sub_8113B94
	ldr r0, _08113A14 @ =gUnknown_8456948
	ldrh r2, [r5]
	lsls r2, 2
	adds r2, r0
	ldr r4, _08113A18 @ =gUnknown_203AE08
	ldr r0, [r4]
	adds r1, r5, 0x4
	ldr r2, [r2]
	bl _call_via_r2
	str r0, [r4]
	movs r0, 0x1
	bl sub_8113A1C
	bl sub_81138F8
	bl sub_811231C
_08113A02:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113A08: .4byte gUnknown_203B024
_08113A0C: .4byte gUnknown_3005E88
_08113A10: .4byte gUnknown_203B04A
_08113A14: .4byte gUnknown_8456948
_08113A18: .4byte gUnknown_203AE08
	thumb_func_end sub_81139BC

	thumb_func_start sub_8113A1C
sub_8113A1C: @ 8113A1C
	push {r4,lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _08113A3C @ =gUnknown_203AE08
	ldr r0, [r4]
	bl sub_8113C5C
	str r0, [r4]
	ldr r1, _08113A40 @ =gUnknown_203AF98
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08113A3C: .4byte gUnknown_203AE08
_08113A40: .4byte gUnknown_203AF98
	thumb_func_end sub_8113A1C

	thumb_func_start sub_8113A44
sub_8113A44: @ 8113A44
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1F
	bne _08113A6C
	ldrh r0, [r4]
	bl sub_8114FBC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08113A70
	ldrh r0, [r4, 0x2]
	bl sub_8114FBC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08113A70
_08113A6C:
	movs r0, 0
	b _08113A72
_08113A70:
	movs r0, 0x1
_08113A72:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8113A44

	thumb_func_start sub_8113A78
sub_8113A78: @ 8113A78
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	ldrh r1, [r3]
	ldr r0, _08113AAC @ =0x00000fff
	ands r0, r1
	adds r2, r0, 0
	lsrs r4, r1, 12
	cmp r2, 0x21
	bne _08113A8E
	movs r4, 0
_08113A8E:
	subs r0, r2, 0x3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x27
	bhi _08113AB4
	str r3, [r5]
	ldr r0, _08113AB0 @ =gUnknown_8456AA0
	adds r0, r2, r0
	ldrb r0, [r0]
	subs r1, r0, 0x4
	muls r1, r4
	adds r0, r1
	adds r0, r3, r0
	b _08113AB6
	.align 2, 0
_08113AAC: .4byte 0x00000fff
_08113AB0: .4byte gUnknown_8456AA0
_08113AB4:
	movs r0, 0
_08113AB6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113A78

	thumb_func_start sub_8113ABC
sub_8113ABC: @ 8113ABC
	push {lr}
	adds r2, r0, 0x4
	ldrh r1, [r0]
	ldr r0, _08113AD0 @ =0x00000fff
	ands r0, r1
	cmp r0, 0x23
	beq _08113AD8
	ldr r1, _08113AD4 @ =gUnknown_203B04A
	movs r0, 0
	b _08113ADE
	.align 2, 0
_08113AD0: .4byte 0x00000fff
_08113AD4: .4byte gUnknown_203B04A
_08113AD8:
	ldr r1, _08113AE4 @ =gUnknown_203B04A
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
_08113ADE:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08113AE4: .4byte gUnknown_203B04A
	thumb_func_end sub_8113ABC

	thumb_func_start sub_8113AE8
sub_8113AE8: @ 8113AE8
	push {r4,lr}
	adds r4, r0, 0
	cmp r0, 0
	beq _08113AFA
	ldr r1, _08113B00 @ =gUnknown_203AF98
	ldrh r0, [r0, 0x2]
	ldrh r1, [r1]
	cmp r0, r1
	bls _08113B04
_08113AFA:
	movs r0, 0
	b _08113B32
	.align 2, 0
_08113B00: .4byte gUnknown_203AF98
_08113B04:
	ldr r2, _08113B38 @ =gUnknown_84569F4
	ldrh r1, [r4]
	ldr r0, _08113B3C @ =0x00000fff
	ands r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	ldr r2, _08113B40 @ =gUnknown_203B044
	ldrh r1, [r4]
	strb r1, [r2]
	movs r0, 0xF0
	lsls r0, 8
	ands r0, r1
	lsrs r0, 12
	strb r0, [r2, 0x1]
	cmp r0, 0
	beq _08113B30
	movs r0, 0x1
	strh r0, [r2, 0x2]
_08113B30:
	movs r0, 0x1
_08113B32:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08113B38: .4byte gUnknown_84569F4
_08113B3C: .4byte 0x00000fff
_08113B40: .4byte gUnknown_203B044
	thumb_func_end sub_8113AE8

	thumb_func_start sub_8113B44
sub_8113B44: @ 8113B44
	push {r4,lr}
	adds r2, r0, 0
	ldr r4, _08113B54 @ =gUnknown_203B044
	ldrh r0, [r4, 0x2]
	cmp r0, 0
	bne _08113B58
	movs r0, 0
	b _08113B7E
	.align 2, 0
_08113B54: .4byte gUnknown_203B044
_08113B58:
	ldr r1, _08113B84 @ =gUnknown_84569F4
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	lsrs r0, 16
	ldrb r4, [r4, 0x1]
	cmp r0, r4
	bls _08113B7C
	bl sub_8113B88
_08113B7C:
	movs r0, 0x1
_08113B7E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08113B84: .4byte gUnknown_84569F4
	thumb_func_end sub_8113B44

	thumb_func_start sub_8113B88
sub_8113B88: @ 8113B88
	ldr r1, _08113B90 @ =gUnknown_203B044
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08113B90: .4byte gUnknown_203B044
	thumb_func_end sub_8113B88

	thumb_func_start sub_8113B94
sub_8113B94: @ 8113B94
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0, 0
	ldr r2, _08113BC0 @ =gUnknown_203B044
	ldrb r1, [r2]
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r3, _08113BC4 @ =gUnknown_203AF98
	cmp r1, r0
	bne _08113BB2
	ldrh r1, [r2, 0x2]
	ldrh r0, [r3]
	cmp r1, r0
	beq _08113BC8
_08113BB2:
	movs r0, 0
	strb r4, [r2]
	strb r0, [r2, 0x1]
	ldrh r0, [r3]
	strh r0, [r2, 0x2]
	b _08113BD2
	.align 2, 0
_08113BC0: .4byte gUnknown_203B044
_08113BC4: .4byte gUnknown_203AF98
_08113BC8:
	ldrb r0, [r2, 0x1]
	cmp r0, 0x4
	bhi _08113BD2
	adds r0, 0x1
	strb r0, [r2, 0x1]
_08113BD2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8113B94

	thumb_func_start sub_8113BD8
sub_8113BD8: @ 8113BD8
	ldr r0, _08113BE8 @ =gUnknown_203B049
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08113BEC @ =gUnknown_203B04A
	strb r1, [r0]
	ldr r0, _08113BF0 @ =gUnknown_203B04B
	strb r1, [r0]
	bx lr
	.align 2, 0
_08113BE8: .4byte gUnknown_203B049
_08113BEC: .4byte gUnknown_203B04A
_08113BF0: .4byte gUnknown_203B04B
	thumb_func_end sub_8113BD8

	thumb_func_start sub_8113BF4
sub_8113BF4: @ 8113BF4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08113C14 @ =gUnknown_8456AA0
	adds r0, 0x27
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113C18
	movs r0, 0x27
	strh r0, [r4]
	adds r0, r4, 0x2
	b _08113C1A
	.align 2, 0
_08113C14: .4byte gUnknown_8456AA0
_08113C18:
	movs r0, 0
_08113C1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8113BF4

	thumb_func_start sub_8113C20
sub_8113C20: @ 8113C20
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _08113C50 @ =gUnknown_8456AA0
	adds r0, 0x27
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113C54
	movs r0, 0xFF
	strb r0, [r4, 0x6]
	movs r1, 0
	movs r0, 0
	strh r0, [r4, 0x4]
	strb r1, [r4]
	strb r1, [r4, 0x1]
	strb r1, [r4, 0x2]
	strb r1, [r4, 0x3]
	adds r0, r5, 0x2
	b _08113C56
	.align 2, 0
_08113C50: .4byte gUnknown_8456AA0
_08113C54:
	movs r0, 0
_08113C56:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113C20

	thumb_func_start sub_8113C5C
sub_8113C5C: @ 8113C5C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _08113C80 @ =gUnknown_8456AA0
	adds r0, 0x29
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113C84
	movs r0, 0x29
	strh r0, [r4]
	strh r5, [r4, 0x2]
	adds r0, r4, 0x4
	b _08113C86
	.align 2, 0
_08113C80: .4byte gUnknown_8456AA0
_08113C84:
	movs r0, 0
_08113C86:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113C5C

	thumb_func_start sub_8113C8C
sub_8113C8C: @ 8113C8C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _08113CBC @ =gUnknown_8456AA0
	adds r0, 0x29
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113CC0
	movs r0, 0xFE
	strb r0, [r4, 0x6]
	ldrh r1, [r5, 0x2]
	movs r0, 0
	strh r1, [r4, 0x4]
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	adds r0, r5, 0x4
	b _08113CC2
	.align 2, 0
_08113CBC: .4byte gUnknown_8456AA0
_08113CC0:
	movs r0, 0
_08113CC2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8113C8C

	thumb_func_start sub_8113CC8
sub_8113CC8: @ 8113CC8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r4, 0x4
	ldr r0, _08113CFC @ =gUnknown_8456AA0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113D00
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2]
	ldrb r0, [r5]
	strb r0, [r4, 0x4]
	ldrb r0, [r5, 0x1]
	strb r0, [r6, 0x1]
	ldrb r0, [r5, 0x2]
	strb r0, [r6, 0x2]
	ldrb r0, [r5, 0x3]
	strb r0, [r6, 0x3]
	adds r0, r6, 0x4
	b _08113D02
	.align 2, 0
_08113CFC: .4byte gUnknown_8456AA0
_08113D00:
	movs r0, 0
_08113D02:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8113CC8

	thumb_func_start sub_8113D08
sub_8113D08: @ 8113D08
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r5, 0x4
	ldr r0, _08113D3C @ =gUnknown_8456AA0
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	beq _08113D40
	movs r0, 0x2
	strb r0, [r4, 0x6]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x4]
	ldrb r0, [r5, 0x4]
	strb r0, [r4]
	ldrb r0, [r6, 0x1]
	strb r0, [r4, 0x1]
	ldrb r0, [r6, 0x2]
	strb r0, [r4, 0x2]
	ldrb r0, [r6, 0x3]
	strb r0, [r4, 0x3]
	adds r0, r6, 0x4
	b _08113D42
	.align 2, 0
_08113D3C: .4byte gUnknown_8456AA0
_08113D40:
	movs r0, 0
_08113D42:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8113D08

	thumb_func_start sub_8113D48
sub_8113D48: @ 8113D48
	push {r4-r6,lr}
	adds r5, r1, 0
	adds r4, r0, 0
	adds r6, r4, 0x4
	ldr r0, _08113D64 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x2]
	adds r0, r4, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	bne _08113D68
	movs r0, 0
	b _08113D8C
	.align 2, 0
_08113D64: .4byte gUnknown_8456AA0
_08113D68:
	ldrb r0, [r5, 0x6]
	cmp r0, 0
	bne _08113D72
	movs r0, 0x2
	b _08113D74
_08113D72:
	movs r0, 0x1
_08113D74:
	strh r0, [r4]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2]
	ldrb r0, [r5]
	strb r0, [r6]
	ldrb r0, [r5, 0x1]
	strb r0, [r6, 0x1]
	ldrb r0, [r5, 0x2]
	strb r0, [r6, 0x2]
	ldrb r0, [r5, 0x3]
	strb r0, [r6, 0x3]
	adds r0, r6, 0x4
_08113D8C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8113D48

	thumb_func_start sub_8113D94
sub_8113D94: @ 8113D94
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r5, r0, 0
	adds r6, r5, 0x4
	ldr r0, _08113DB0 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x2]
	adds r0, r5, 0
	bl sub_8110988
	lsls r0, 24
	cmp r0, 0
	bne _08113DB4
	movs r0, 0
	b _08113DD8
	.align 2, 0
_08113DB0: .4byte gUnknown_8456AA0
_08113DB4:
	ldrh r0, [r5]
	cmp r0, 0x2
	bne _08113DBE
	movs r0, 0
	b _08113DC0
_08113DBE:
	movs r0, 0x1
_08113DC0:
	strb r0, [r4, 0x6]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x4]
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r0, [r6, 0x1]
	strb r0, [r4, 0x1]
	ldrb r0, [r6, 0x2]
	strb r0, [r4, 0x2]
	ldrb r0, [r6, 0x3]
	strb r0, [r4, 0x3]
	adds r0, r6, 0x4
_08113DD8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8113D94

	thumb_func_start sub_8113DE0
sub_8113DE0: @ 8113DE0
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _08113DF8 @ =gUnknown_203B044
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08113E00
	ldr r0, _08113DFC @ =gUnknown_8456AA0
	adds r0, r7, r0
	ldrb r6, [r0]
	b _08113E0C
	.align 2, 0
_08113DF8: .4byte gUnknown_203B044
_08113DFC: .4byte gUnknown_8456AA0
_08113E00:
	ldr r0, _08113E20 @ =gUnknown_8456AA0
	adds r0, r7, r0
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
_08113E0C:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _08113E24
	movs r0, 0
	b _08113E7C
	.align 2, 0
_08113E20: .4byte gUnknown_8456AA0
_08113E24:
	adds r5, r4, 0
	ldr r2, _08113E60 @ =gUnknown_203B044
	ldrb r1, [r2, 0x1]
	cmp r1, 0
	beq _08113E36
	adds r0, r1, 0
	muls r0, r6
	adds r0, 0x4
	subs r5, r0
_08113E36:
	cmp r1, 0x5
	bne _08113E64
	movs r4, 0
_08113E3C:
	adds r0, r4, 0
	muls r0, r6
	adds r0, r5
	adds r0, 0x4
	adds r4, 0x1
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r1, 0x4
	adds r2, r6, 0
	bl memcpy
	lsls r4, 24
	lsrs r4, 24
	cmp r4, 0x3
	bls _08113E3C
	movs r1, 0x4
	b _08113E66
	.align 2, 0
_08113E60: .4byte gUnknown_203B044
_08113E64:
	ldrb r1, [r2, 0x1]
_08113E66:
	lsls r0, r1, 12
	adds r0, r7, r0
	strh r0, [r5]
	ldr r0, _08113E84 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r5, 0x2]
	adds r0, r1, 0
	muls r0, r6
	adds r0, 0x4
	adds r5, r0
	adds r0, r5, 0
_08113E7C:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08113E84: .4byte gUnknown_203AF98
	thumb_func_end sub_8113DE0

	thumb_func_start sub_8113E88
sub_8113E88: @ 8113E88
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08113EA4 @ =gUnknown_203B044
	ldrh r3, [r2, 0x2]
	ldr r2, _08113EA8 @ =gUnknown_8456AA0
	adds r0, r2
	ldrb r0, [r0]
	subs r0, 0x4
	muls r0, r3
	adds r0, 0x4
	adds r1, r0
	adds r0, r1, 0
	bx lr
	.align 2, 0
_08113EA4: .4byte gUnknown_203B044
_08113EA8: .4byte gUnknown_8456AA0
	thumb_func_end sub_8113E88

	thumb_func_start sub_8113EAC
sub_8113EAC: @ 8113EAC
	push {r4,r5,lr}
	adds r3, r1, 0
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	adds r5, r2, 0
	cmp r3, 0
	beq _08113EE0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _08113ED0
	adds r0, r3, 0
	bl GetSpeciesName
	b _08113F08
_08113ED0:
	ldr r1, _08113EDC @ =gText_EggNickname
	adds r0, r3, 0
	bl StringCopy
	b _08113F08
	.align 2, 0
_08113EDC: .4byte gText_EggNickname
_08113EE0:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	beq _08113F00
	movs r0, 0xB
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _08113EFC @ =gSpeciesNames
	adds r1, r0
	adds r0, r2, 0
	bl UnkTextUtil_SetPtrI
	b _08113F08
	.align 2, 0
_08113EFC: .4byte gSpeciesNames
_08113F00:
	ldr r1, _08113F10 @ =gText_EggNickname
	adds r0, r5, 0
	bl UnkTextUtil_SetPtrI
_08113F08:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08113F10: .4byte gText_EggNickname
	thumb_func_end sub_8113EAC

	thumb_func_start sub_8113F14
sub_8113F14: @ 8113F14
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x3
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08113F34
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08113F36
_08113F34:
	movs r0, 0
_08113F36:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8113F14

	thumb_func_start sub_8113F3C
sub_8113F3C: @ 8113F3C
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x3
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4]
	ldr r1, _08113F70 @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	ldr r1, _08113F74 @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldr r0, _08113F78 @ =gStringVar4
	ldr r1, _08113F7C @ =gUnknown_841A16F
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08113F70: .4byte gStringVar1
_08113F74: .4byte gStringVar2
_08113F78: .4byte gStringVar4
_08113F7C: .4byte gUnknown_841A16F
	thumb_func_end sub_8113F3C

	thumb_func_start sub_8113F80
sub_8113F80: @ 8113F80
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x4
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _08113F98
	movs r0, 0
	b _08113FB2
_08113F98:
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x4]
	strh r0, [r2, 0x2]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x4]
	ldrh r0, [r4]
	cmp r0, 0x55
	bne _08113FB0
	ldr r1, _08113FB8 @ =gUnknown_203B048
	movs r0, 0x2
	strb r0, [r1]
_08113FB0:
	adds r0, r2, 0x6
_08113FB2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08113FB8: .4byte gUnknown_203B048
	thumb_func_end sub_8113F80

	thumb_func_start sub_8113FBC
sub_8113FBC: @ 8113FBC
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x4
	bl sub_8113E88
	adds r5, r0, 0
	ldrh r0, [r5]
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x4
	bls _08113FDA
	b _0811413C
_08113FDA:
	lsls r0, 2
	ldr r1, _08113FE4 @ =_08113FE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08113FE4: .4byte _08113FE8
	.align 2, 0
_08113FE8:
	.4byte _08113FFC
	.4byte _08114074
	.4byte _08113FFC
	.4byte _0811409C
	.4byte _08113FFC
_08113FFC:
	ldr r4, _08114024 @ =gStringVar1
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r0, [r5]
	cmp r0, 0x55
	bne _08114034
	ldr r0, _08114028 @ =gStringVar2
	ldrb r1, [r5, 0x4]
	bl sub_80C4DF8
	ldr r0, _0811402C @ =gStringVar4
	ldr r1, _08114030 @ =gUnknown_841AFA6
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_08114024: .4byte gStringVar1
_08114028: .4byte gStringVar2
_0811402C: .4byte gStringVar4
_08114030: .4byte gUnknown_841AFA6
_08114034:
	ldrh r1, [r5, 0x2]
	ldr r0, _08114050 @ =0x0000ffff
	cmp r1, r0
	beq _08114060
	adds r0, r1, 0
	ldr r1, _08114054 @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldr r0, _08114058 @ =gStringVar4
	ldr r1, _0811405C @ =gUnknown_841A1E7
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_08114050: .4byte 0x0000ffff
_08114054: .4byte gStringVar2
_08114058: .4byte gStringVar4
_0811405C: .4byte gUnknown_841A1E7
_08114060:
	ldr r0, _0811406C @ =gStringVar4
	ldr r1, _08114070 @ =gUnknown_841A210
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_0811406C: .4byte gStringVar4
_08114070: .4byte gUnknown_841A210
_08114074:
	ldr r4, _08114090 @ =gStringVar1
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _08114094 @ =gStringVar4
	ldr r1, _08114098 @ =gUnknown_841A220
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_08114090: .4byte gStringVar1
_08114094: .4byte gStringVar4
_08114098: .4byte gUnknown_841A220
_0811409C:
	ldrh r0, [r5, 0x2]
	ldr r1, _081140E8 @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r4, _081140EC @ =gStringVar2
	ldrh r0, [r5]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r7, 0xD
	adds r1, r0, 0
	muls r1, r7
	ldr r6, _081140F0 @ =gUnknown_8247094
	adds r1, r6
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0x4]
	ldr r0, _081140F4 @ =0x0000ffff
	cmp r1, r0
	beq _08114118
	ldr r0, _081140F8 @ =gStringVar3
	muls r1, r7
	adds r1, r6
	bl StringCopy
	ldrh r1, [r5]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bls _08114104
	ldr r0, _081140FC @ =gStringVar4
	ldr r1, _08114100 @ =gUnknown_841A965
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_081140E8: .4byte gStringVar1
_081140EC: .4byte gStringVar2
_081140F0: .4byte gUnknown_8247094
_081140F4: .4byte 0x0000ffff
_081140F8: .4byte gStringVar3
_081140FC: .4byte gStringVar4
_08114100: .4byte gUnknown_841A965
_08114104:
	ldr r0, _08114110 @ =gStringVar4
	ldr r1, _08114114 @ =gUnknown_841A277
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_08114110: .4byte gStringVar4
_08114114: .4byte gUnknown_841A277
_08114118:
	ldrh r1, [r5]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bls _08114134
	ldr r0, _0811412C @ =gStringVar4
	ldr r1, _08114130 @ =gUnknown_841A938
	bl StringExpandPlaceholders
	b _0811413C
	.align 2, 0
_0811412C: .4byte gStringVar4
_08114130: .4byte gUnknown_841A938
_08114134:
	ldr r0, _08114144 @ =gStringVar4
	ldr r1, _08114148 @ =gUnknown_841A255
	bl StringExpandPlaceholders
_0811413C:
	adds r0, r5, 0x6
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08114144: .4byte gStringVar4
_08114148: .4byte gUnknown_841A255
	thumb_func_end sub_8113FBC

	thumb_func_start sub_811414C
sub_811414C: @ 811414C
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	bl sub_8113DE0
	adds r1, r0, 0
	cmp r1, 0
	beq _0811416A
	ldrh r0, [r4]
	strh r0, [r1]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x2]
	adds r0, r1, 0x4
	b _0811416C
_0811416A:
	movs r0, 0
_0811416C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811414C

	thumb_func_start sub_8114174
sub_8114174: @ 8114174
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x5
	adds r1, r3, 0
	bl sub_811414C
	pop {r1}
	bx r1
	thumb_func_end sub_8114174

	thumb_func_start sub_8114188
sub_8114188: @ 8114188
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x5
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x2]
	ldr r1, _081141C0 @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _081141C4 @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _081141C8 @ =gStringVar4
	ldr r1, _081141CC @ =gUnknown_841AB74
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081141C0: .4byte gStringVar1
_081141C4: .4byte gStringVar2
_081141C8: .4byte gStringVar4
_081141CC: .4byte gUnknown_841AB74
	thumb_func_end sub_8114188

	thumb_func_start sub_81141D0
sub_81141D0: @ 81141D0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x6
	adds r1, r3, 0
	bl sub_811414C
	pop {r1}
	bx r1
	thumb_func_end sub_81141D0

	thumb_func_start sub_81141E4
sub_81141E4: @ 81141E4
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x6
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x2]
	ldr r1, _0811421C @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _08114220 @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _08114224 @ =gStringVar4
	ldr r1, _08114228 @ =gUnknown_841AB8E
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811421C: .4byte gStringVar1
_08114220: .4byte gStringVar2
_08114224: .4byte gStringVar4
_08114228: .4byte gUnknown_841AB8E
	thumb_func_end sub_81141E4

	thumb_func_start sub_811422C
sub_811422C: @ 811422C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x7
	adds r1, r3, 0
	bl sub_811414C
	pop {r1}
	bx r1
	thumb_func_end sub_811422C

	thumb_func_start sub_8114240
sub_8114240: @ 8114240
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x7
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x2]
	ldr r1, _08114278 @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _0811427C @ =gStringVar1
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _08114280 @ =gStringVar4
	ldr r1, _08114284 @ =gUnknown_841A6A5
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114278: .4byte gStringVar2
_0811427C: .4byte gStringVar1
_08114280: .4byte gStringVar4
_08114284: .4byte gUnknown_841A6A5
	thumb_func_end sub_8114240

	thumb_func_start sub_8114288
sub_8114288: @ 8114288
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x8
	adds r1, r3, 0
	bl sub_811414C
	pop {r1}
	bx r1
	thumb_func_end sub_8114288

	thumb_func_start sub_811429C
sub_811429C: @ 811429C
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x8
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x2]
	ldr r1, _081142D4 @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _081142D8 @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _081142DC @ =gStringVar4
	ldr r1, _081142E0 @ =gUnknown_841A1CD
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081142D4: .4byte gStringVar1
_081142D8: .4byte gStringVar2
_081142DC: .4byte gStringVar4
_081142E0: .4byte gUnknown_841A1CD
	thumb_func_end sub_811429C

	thumb_func_start sub_81142E4
sub_81142E4: @ 81142E4
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	bl sub_8113DE0
	adds r1, r0, 0
	cmp r1, 0
	beq _08114306
	ldrh r0, [r4]
	strh r0, [r1]
	ldrh r0, [r4, 0x2]
	strh r0, [r1, 0x2]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x4]
	adds r0, r1, 0x6
	b _08114308
_08114306:
	movs r0, 0
_08114308:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81142E4

	thumb_func_start sub_8114310
sub_8114310: @ 8114310
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0x9
	adds r1, r3, 0
	bl sub_81142E4
	pop {r1}
	bx r1
	thumb_func_end sub_8114310

	thumb_func_start sub_8114324
sub_8114324: @ 8114324
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x9
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x4]
	ldr r1, _0811436C @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _08114370 @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r5, _08114374 @ =gStringVar3
	ldrh r0, [r4, 0x2]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _08114378 @ =gStringVar4
	ldr r1, _0811437C @ =gUnknown_841A193
	bl StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811436C: .4byte gStringVar1
_08114370: .4byte gStringVar2
_08114374: .4byte gStringVar3
_08114378: .4byte gStringVar4
_0811437C: .4byte gUnknown_841A193
	thumb_func_end sub_8114324

	thumb_func_start sub_8114380
sub_8114380: @ 8114380
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0xA
	adds r1, r3, 0
	bl sub_81142E4
	pop {r1}
	bx r1
	thumb_func_end sub_8114380

	thumb_func_start sub_8114394
sub_8114394: @ 8114394
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0xA
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4, 0x4]
	ldr r1, _081143DC @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldr r5, _081143E0 @ =gStringVar3
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r5, _081143E4 @ =gStringVar1
	ldrh r0, [r4, 0x2]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _081143E8 @ =gStringVar4
	ldr r1, _081143EC @ =gUnknown_841A6E1
	bl StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081143DC: .4byte gStringVar2
_081143E0: .4byte gStringVar3
_081143E4: .4byte gStringVar1
_081143E8: .4byte gStringVar4
_081143EC: .4byte gUnknown_841A6E1
	thumb_func_end sub_8114394

	thumb_func_start sub_81143F0
sub_81143F0: @ 81143F0
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	ldr r1, _08114408 @ =gUnknown_203B044
	ldrb r0, [r1]
	cmp r0, 0xB
	bne _0811440C
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0811440C
	adds r0, r4, 0
	b _08114436
	.align 2, 0
_08114408: .4byte gUnknown_203B044
_0811440C:
	ldr r0, _0811442C @ =gUnknown_8456AA0
	ldrb r1, [r0, 0xB]
	adds r0, r2, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	beq _08114434
	movs r0, 0xB
	strh r0, [r4]
	ldr r0, _08114430 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	adds r0, r4, 0x4
	b _08114436
	.align 2, 0
_0811442C: .4byte gUnknown_8456AA0
_08114430: .4byte gUnknown_203AF98
_08114434:
	movs r0, 0
_08114436:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81143F0

	thumb_func_start sub_811443C
sub_811443C: @ 811443C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08114454 @ =gStringVar4
	ldr r1, _08114458 @ =gUnknown_841A2B0
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114454: .4byte gStringVar4
_08114458: .4byte gUnknown_841A2B0
	thumb_func_end sub_811443C

	thumb_func_start sub_811445C
sub_811445C: @ 811445C
	push {r4,lr}
	adds r4, r0, 0
	adds r4, 0x8
	movs r2, 0xC
	strh r2, [r0]
	ldr r2, _08114488 @ =gUnknown_203AF98
	ldrh r2, [r2]
	strh r2, [r0, 0x2]
	ldrh r2, [r1]
	strh r2, [r0, 0x4]
	ldrh r2, [r1, 0x2]
	strh r2, [r0, 0x6]
	adds r1, 0x4
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114488: .4byte gUnknown_203AF98
	thumb_func_end sub_811445C

	thumb_func_start sub_811448C
sub_811448C: @ 811448C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r5, 0
	adds r6, 0x8
	ldr r4, _081144D8 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	ldrh r0, [r5, 0x6]
	ldr r1, _081144DC @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldrh r0, [r5, 0x4]
	ldr r1, _081144E0 @ =gStringVar3
	movs r2, 0
	bl sub_8113EAC
	ldr r0, _081144E4 @ =gStringVar4
	ldr r1, _081144E8 @ =gUnknown_841A3FF
	bl StringExpandPlaceholders
	adds r6, 0x8
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081144D8: .4byte gStringVar1
_081144DC: .4byte gStringVar2
_081144E0: .4byte gStringVar3
_081144E4: .4byte gStringVar4
_081144E8: .4byte gUnknown_841A3FF
	thumb_func_end sub_811448C

	thumb_func_start sub_81144EC
sub_81144EC: @ 81144EC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xD
	strh r0, [r4]
	ldr r0, _08114514 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrb r0, [r1]
	strb r0, [r4, 0x4]
	adds r0, r4, 0x5
	adds r1, 0x1
	movs r2, 0x7
	bl memcpy
	adds r4, 0xC
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114514: .4byte gUnknown_203AF98
	thumb_func_end sub_81144EC

	thumb_func_start sub_8114518
sub_8114518: @ 8114518
	push {r4,r5,lr}
	adds r5, r0, 0
	bl UnkTextUtil_Reset
	ldr r4, _08114568 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r1, r5, 0x5
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r1, _0811456C @ =gUnknown_8456AE4
	ldrb r0, [r5, 0x4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114570 @ =gStringVar4
	ldr r1, _08114574 @ =gUnknown_841A422
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0xC
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114568: .4byte gStringVar1
_0811456C: .4byte gUnknown_8456AE4
_08114570: .4byte gStringVar4
_08114574: .4byte gUnknown_841A422
	thumb_func_end sub_8114518

	thumb_func_start sub_8114578
sub_8114578: @ 8114578
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xE
	strh r0, [r4]
	ldr r0, _081145A0 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrb r0, [r1]
	strb r0, [r4, 0x4]
	adds r0, r4, 0x5
	adds r1, 0x1
	movs r2, 0x7
	bl memcpy
	adds r4, 0xC
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081145A0: .4byte gUnknown_203AF98
	thumb_func_end sub_8114578

	thumb_func_start sub_81145A4
sub_81145A4: @ 81145A4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl UnkTextUtil_Reset
	ldr r4, _081145F4 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r1, r5, 0x5
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r1, _081145F8 @ =gUnknown_8456AE4
	ldrb r0, [r5, 0x4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _081145FC @ =gStringVar4
	ldr r1, _08114600 @ =gUnknown_841A477
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0xC
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081145F4: .4byte gStringVar1
_081145F8: .4byte gUnknown_8456AE4
_081145FC: .4byte gStringVar4
_08114600: .4byte gUnknown_841A477
	thumb_func_end sub_81145A4

	thumb_func_start sub_8114604
sub_8114604: @ 8114604
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0xF
	strh r0, [r4]
	ldr r0, _08114648 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrb r0, [r5]
	strb r0, [r4, 0x4]
	adds r0, r4, 0x5
	adds r1, r5, 0x1
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	adds r0, 0xC
	adds r1, r5, 0
	adds r1, 0x8
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	adds r0, 0x13
	adds r5, 0xF
	adds r1, r5, 0
	movs r2, 0x7
	bl memcpy
	adds r4, 0x1A
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114648: .4byte gUnknown_203AF98
	thumb_func_end sub_8114604

	thumb_func_start sub_811464C
sub_811464C: @ 811464C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	bl UnkTextUtil_Reset
	ldr r0, _081146F4 @ =gStringVar1
	mov r8, r0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	ldr r6, _081146F8 @ =gStringVar2
	adds r0, r6, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	ldr r5, _081146FC @ =gStringVar3
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r1, r4, 0x5
	mov r0, r8
	bl StringCopy7
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r6, 0
	bl StringCopy7
	adds r1, r4, 0
	adds r1, 0x13
	adds r0, r5, 0
	bl StringCopy7
	mov r0, r8
	bl sub_8115834
	adds r0, r6, 0
	bl sub_8115834
	adds r0, r5, 0
	bl sub_8115834
	ldr r0, _08114700 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	movs r0, 0x1
	mov r1, r8
	bl UnkTextUtil_SetPtrI
	movs r0, 0x2
	adds r1, r6, 0
	bl UnkTextUtil_SetPtrI
	movs r0, 0x3
	adds r1, r5, 0
	bl UnkTextUtil_SetPtrI
	ldr r1, _08114704 @ =gUnknown_8456AE4
	ldrb r0, [r4, 0x4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x4
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114708 @ =gStringVar4
	ldr r1, _0811470C @ =gUnknown_841A4C6
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x1A
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081146F4: .4byte gStringVar1
_081146F8: .4byte gStringVar2
_081146FC: .4byte gStringVar3
_08114700: .4byte gSaveBlock2Ptr
_08114704: .4byte gUnknown_8456AE4
_08114708: .4byte gStringVar4
_0811470C: .4byte gUnknown_841A4C6
	thumb_func_end sub_811464C

	thumb_func_start sub_8114710
sub_8114710: @ 8114710
	movs r1, 0x10
	strh r1, [r0]
	ldr r1, _08114720 @ =gUnknown_203AF98
	ldrh r1, [r1]
	strh r1, [r0, 0x2]
	adds r0, 0x4
	bx lr
	.align 2, 0
_08114720: .4byte gUnknown_203AF98
	thumb_func_end sub_8114710

	thumb_func_start sub_8114724
sub_8114724: @ 8114724
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811473C @ =gStringVar4
	ldr r1, _08114740 @ =gUnknown_841A50B
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811473C: .4byte gStringVar4
_08114740: .4byte gUnknown_841A50B
	thumb_func_end sub_8114724

	thumb_func_start sub_8114744
sub_8114744: @ 8114744
	movs r1, 0x11
	strh r1, [r0]
	ldr r1, _08114754 @ =gUnknown_203AF98
	ldrh r1, [r1]
	strh r1, [r0, 0x2]
	adds r0, 0x4
	bx lr
	.align 2, 0
_08114754: .4byte gUnknown_203AF98
	thumb_func_end sub_8114744

	thumb_func_start sub_8114758
sub_8114758: @ 8114758
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08114770 @ =gStringVar4
	ldr r1, _08114774 @ =gUnknown_841A732
	bl StringExpandPlaceholders
	adds r4, 0x4
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114770: .4byte gStringVar4
_08114774: .4byte gUnknown_841A732
	thumb_func_end sub_8114758

	thumb_func_start sub_8114778
sub_8114778: @ 8114778
	push {r4,lr}
	adds r4, r0, 0
	adds r4, 0x8
	movs r2, 0x12
	strh r2, [r0]
	ldr r2, _081147A4 @ =gUnknown_203AF98
	ldrh r2, [r2]
	strh r2, [r0, 0x2]
	ldrh r2, [r1]
	strh r2, [r0, 0x4]
	ldrh r2, [r1, 0x2]
	strh r2, [r0, 0x6]
	adds r1, 0x4
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081147A4: .4byte gUnknown_203AF98
	thumb_func_end sub_8114778

	thumb_func_start sub_81147A8
sub_81147A8: @ 81147A8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r5, 0
	adds r6, 0x8
	ldr r4, _081147F4 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	ldrh r0, [r5, 0x6]
	ldr r1, _081147F8 @ =gStringVar2
	movs r2, 0
	bl sub_8113EAC
	ldrh r0, [r5, 0x4]
	ldr r1, _081147FC @ =gStringVar3
	movs r2, 0
	bl sub_8113EAC
	ldr r0, _08114800 @ =gStringVar4
	ldr r1, _08114804 @ =gUnknown_841A76A
	bl StringExpandPlaceholders
	adds r6, 0x8
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081147F4: .4byte gStringVar1
_081147F8: .4byte gStringVar2
_081147FC: .4byte gStringVar3
_08114800: .4byte gStringVar4
_08114804: .4byte gUnknown_841A76A
	thumb_func_end sub_81147A8

	thumb_func_start sub_8114808
sub_8114808: @ 8114808
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x13
	strh r0, [r4]
	ldr r0, _08114830 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrb r0, [r1]
	strb r0, [r4, 0x4]
	adds r0, r4, 0x5
	adds r1, 0x1
	movs r2, 0x7
	bl memcpy
	adds r4, 0xC
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114830: .4byte gUnknown_203AF98
	thumb_func_end sub_8114808

	thumb_func_start sub_8114834
sub_8114834: @ 8114834
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08114878 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r1, r5, 0x5
	adds r0, r4, 0
	movs r2, 0x7
	bl memcpy
	adds r0, r4, 0
	bl sub_8115834
	ldr r0, _0811487C @ =gStringVar2
	ldr r2, _08114880 @ =gUnknown_8456AE4
	ldrb r1, [r5, 0x4]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08114884 @ =gStringVar4
	ldr r1, _08114888 @ =gUnknown_841A7B0
	bl StringExpandPlaceholders
	adds r5, 0xC
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114878: .4byte gStringVar1
_0811487C: .4byte gStringVar2
_08114880: .4byte gUnknown_8456AE4
_08114884: .4byte gStringVar4
_08114888: .4byte gUnknown_841A7B0
	thumb_func_end sub_8114834

	thumb_func_start sub_811488C
sub_811488C: @ 811488C
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x14
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081148B4
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x4]
	ldrb r0, [r4, 0x5]
	strb r0, [r2, 0x5]
	adds r0, r2, 0x6
	b _081148B6
_081148B4:
	movs r0, 0
_081148B6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811488C

	thumb_func_start sub_81148BC
sub_81148BC: @ 81148BC
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x14
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x4
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x4]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrb r0, [r5, 0x1]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r0, _08114910 @ =gStringVar4
	ldr r1, _08114914 @ =gUnknown_841A566
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114910: .4byte gStringVar4
_08114914: .4byte gUnknown_841A566
	thumb_func_end sub_81148BC

	thumb_func_start sub_8114918
sub_8114918: @ 8114918
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x15
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _0811493C
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x4]
	adds r0, r2, 0x6
	b _0811493E
_0811493C:
	movs r0, 0
_0811493E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114918

	thumb_func_start sub_8114944
sub_8114944: @ 8114944
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x15
	bl sub_8113E88
	adds r4, r0, 0
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x4]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldr r0, _08114988 @ =gStringVar4
	ldr r1, _0811498C @ =gUnknown_841A5D9
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114988: .4byte gStringVar4
_0811498C: .4byte gUnknown_841A5D9
	thumb_func_end sub_8114944

	thumb_func_start sub_8114990
sub_8114990: @ 8114990
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x16
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _081149A8
	movs r0, 0
	b _081149CA
_081149A8:
	adds r1, r2, 0x4
	ldrb r0, [r4, 0x4]
	cmp r0, 0xE
	bne _081149BC
	ldrh r0, [r4, 0x2]
	strh r0, [r2]
	ldrh r0, [r4]
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x5]
	b _081149C6
_081149BC:
	ldrh r0, [r4]
	strh r0, [r2]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x4]
_081149C6:
	strb r0, [r2, 0x4]
	adds r0, r1, 0x2
_081149CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114990

	thumb_func_start sub_81149D0
sub_81149D0: @ 81149D0
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x16
	bl sub_8113E88
	adds r4, r0, 0
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x4]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldr r0, _08114A14 @ =gStringVar4
	ldr r1, _08114A18 @ =gUnknown_841A60A
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x6
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114A14: .4byte gStringVar4
_08114A18: .4byte gUnknown_841A60A
	thumb_func_end sub_81149D0

	thumb_func_start sub_8114A1C
sub_8114A1C: @ 8114A1C
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x17
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114A42
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	ldrb r1, [r4, 0x4]
	strb r1, [r2, 0x2]
	ldrb r1, [r4, 0x5]
	strb r1, [r0, 0x1]
	adds r0, 0x2
	b _08114A44
_08114A42:
	movs r0, 0
_08114A44:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114A1C

	thumb_func_start sub_8114A4C
sub_8114A4C: @ 8114A4C
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x17
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrb r0, [r5, 0x1]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114A98 @ =gStringVar4
	ldr r1, _08114A9C @ =gUnknown_841A59C
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114A98: .4byte gStringVar4
_08114A9C: .4byte gUnknown_841A59C
	thumb_func_end sub_8114A4C

	thumb_func_start sub_8114AA0
sub_8114AA0: @ 8114AA0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x18
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114AC0
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08114AC2
_08114AC0:
	movs r0, 0
_08114AC2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114AA0

	thumb_func_start sub_8114AC8
sub_8114AC8: @ 8114AC8
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x18
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldr r0, _08114B04 @ =gStringVar4
	ldr r1, _08114B08 @ =gUnknown_841A5FA
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114B04: .4byte gStringVar4
_08114B08: .4byte gUnknown_841A5FA
	thumb_func_end sub_8114AC8

	thumb_func_start sub_8114B0C
sub_8114B0C: @ 8114B0C
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x19
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114B2C
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08114B2E
_08114B2C:
	movs r0, 0
_08114B2E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114B0C

	thumb_func_start sub_8114B34
sub_8114B34: @ 8114B34
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x19
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldr r0, _08114B70 @ =gStringVar4
	ldr r1, _08114B74 @ =gUnknown_841A632
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114B70: .4byte gStringVar4
_08114B74: .4byte gUnknown_841A632
	thumb_func_end sub_8114B34

	thumb_func_start sub_8114B78
sub_8114B78: @ 8114B78
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1A
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114B98
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x4]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _08114B9A
_08114B98:
	movs r0, 0
_08114B9A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114B78

	thumb_func_start sub_8114BA0
sub_8114BA0: @ 8114BA0
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x1A
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	bl UnkTextUtil_Reset
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0
	bl sub_8113EAC
	ldrb r0, [r4, 0x2]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114BDC @ =gStringVar4
	ldr r1, _08114BE0 @ =gUnknown_841A64F
	bl UnkTextUtil_StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08114BDC: .4byte gStringVar4
_08114BE0: .4byte gUnknown_841A64F
	thumb_func_end sub_8114BA0

	thumb_func_start sub_8114BE4
sub_8114BE4: @ 8114BE4
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1B
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114C04
	ldrb r0, [r4, 0x4]
	strb r0, [r2]
	ldrb r0, [r4, 0x5]
	strb r0, [r2, 0x1]
	adds r0, r2, 0x2
	b _08114C06
_08114C04:
	movs r0, 0
_08114C06:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114BE4

	thumb_func_start sub_8114C0C
sub_8114C0C: @ 8114C0C
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x1B
	bl sub_8113E88
	adds r4, r0, 0
	bl UnkTextUtil_Reset
	ldrb r0, [r4]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	cmp r0, r1
	bne _08114C40
	ldr r1, _08114C3C @ =gUnknown_841A694
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	b _08114C4E
	.align 2, 0
_08114C3C: .4byte gUnknown_841A694
_08114C40:
	ldrb r0, [r4, 0x1]
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
_08114C4E:
	ldr r0, _08114C60 @ =gStringVar4
	ldr r1, _08114C64 @ =gUnknown_841A66E
	bl UnkTextUtil_StringExpandPlaceholders
	adds r0, r4, 0x2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114C60: .4byte gStringVar4
_08114C64: .4byte gUnknown_841A66E
	thumb_func_end sub_8114C0C

	thumb_func_start sub_8114C68
sub_8114C68: @ 8114C68
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1C
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114C84
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	b _08114C86
_08114C84:
	movs r0, 0
_08114C86:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114C68

	thumb_func_start sub_8114C8C
sub_8114C8C: @ 8114C8C
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x1C
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4]
	ldr r1, _08114CB4 @ =gStringVar1
	bl sub_8099E90
	ldr r0, _08114CB8 @ =gStringVar4
	ldr r1, _08114CBC @ =gUnknown_841A391
	bl StringExpandPlaceholders
	adds r4, 0x2
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114CB4: .4byte gStringVar1
_08114CB8: .4byte gStringVar4
_08114CBC: .4byte gUnknown_841A391
	thumb_func_end sub_8114C8C

	thumb_func_start sub_8114CC0
sub_8114CC0: @ 8114CC0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x1D
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _08114CDC
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	b _08114CDE
_08114CDC:
	movs r0, 0
_08114CDE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114CC0

	thumb_func_start sub_8114CE4
sub_8114CE4: @ 8114CE4
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x1D
	bl sub_8113E88
	adds r4, r0, 0
	ldrh r0, [r4]
	ldr r1, _08114D0C @ =gStringVar1
	bl sub_8099E90
	ldr r0, _08114D10 @ =gStringVar4
	ldr r1, _08114D14 @ =gUnknown_841A3DA
	bl StringExpandPlaceholders
	adds r4, 0x2
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08114D0C: .4byte gStringVar1
_08114D10: .4byte gStringVar4
_08114D14: .4byte gUnknown_841A3DA
	thumb_func_end sub_8114CE4

	thumb_func_start sub_8114D18
sub_8114D18: @ 8114D18
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	bl sub_8113DE0
	adds r1, r0, 0
	cmp r1, 0
	beq _08114D44
	ldrh r0, [r4, 0x2]
	strh r0, [r1]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x2]
	ldrh r0, [r4]
	strh r0, [r1, 0x4]
	ldrb r0, [r4, 0x7]
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x6]
	strb r0, [r1, 0x7]
	adds r0, r1, 0
	adds r0, 0x8
	b _08114D46
_08114D44:
	movs r0, 0
_08114D46:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8114D18

	thumb_func_start sub_8114D4C
sub_8114D4C: @ 8114D4C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r1, _08114D64 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1E
	adds r1, r3, 0
	bl sub_8114D18
	pop {r1}
	bx r1
	.align 2, 0
_08114D64: .4byte gUnknown_203B048
	thumb_func_end sub_8114D4C

	thumb_func_start sub_8114D68
sub_8114D68: @ 8114D68
	push {r4-r6,lr}
	adds r1, r0, 0
	movs r0, 0x1E
	bl sub_8113E88
	adds r4, r0, 0
	adds r6, r4, 0x6
	bl UnkTextUtil_Reset
	ldr r5, _08114DD4 @ =gStringVar1
	ldrb r1, [r4, 0x6]
	adds r0, r5, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r5, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08114DD8 @ =gTrainers+0x4
	adds r1, r0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r1, _08114DDC @ =gUnknown_8456ACC
	ldrb r0, [r6, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x4
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114DE0 @ =gStringVar4
	ldr r1, _08114DE4 @ =gUnknown_841AF0C
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08114DD4: .4byte gStringVar1
_08114DD8: .4byte gTrainers+0x4
_08114DDC: .4byte gUnknown_8456ACC
_08114DE0: .4byte gStringVar4
_08114DE4: .4byte gUnknown_841AF0C
	thumb_func_end sub_8114D68

	thumb_func_start sub_8114DE8
sub_8114DE8: @ 8114DE8
	push {r4-r6,lr}
	adds r6, r1, 0
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x8
	ldr r0, _08114E08 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x1F]
	adds r0, r4, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _08114E0C
	movs r0, 0
	b _08114E5E
	.align 2, 0
_08114E08: .4byte gUnknown_8456AA0
_08114E0C:
	ldrb r0, [r4, 0x8]
	cmp r0, 0
	bne _08114E22
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	bne _08114E22
	movs r0, 0x1F
	strh r0, [r4]
	ldr r0, _08114E64 @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
_08114E22:
	ldrh r0, [r6]
	adds r2, r0, 0
	cmp r2, 0
	beq _08114E2C
	strh r0, [r4, 0x4]
_08114E2C:
	ldrh r0, [r6, 0x2]
	adds r1, r0, 0
	cmp r1, 0
	beq _08114E36
	strh r1, [r4, 0x6]
_08114E36:
	cmp r2, 0
	beq _08114E46
	ldrb r2, [r5]
	adds r0, r2, 0
	cmp r0, 0xFF
	beq _08114E46
	adds r0, r2, 0x1
	strb r0, [r5]
_08114E46:
	lsls r0, r1, 16
	cmp r0, 0
	beq _08114E58
	ldrb r1, [r5, 0x1]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08114E58
	adds r0, r1, 0x1
	strb r0, [r5, 0x1]
_08114E58:
	ldrb r0, [r6, 0x4]
	strb r0, [r5, 0x2]
	adds r0, r5, 0x4
_08114E5E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08114E64: .4byte gUnknown_203AF98
	thumb_func_end sub_8114DE8

	thumb_func_start sub_8114E68
sub_8114E68: @ 8114E68
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _08114E80 @ =gUnknown_8456AA0
	ldrb r1, [r0, 0x1F]
	adds r0, r5, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _08114E84
	movs r0, 0
	b _08114FAE
	.align 2, 0
_08114E80: .4byte gUnknown_8456AA0
_08114E84:
	adds r6, r5, 0
	adds r6, 0x8
	bl UnkTextUtil_Reset
	ldr r4, _08114F00 @ =gStringVar1
	ldrb r1, [r6, 0x2]
	adds r0, r4, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5, 0x4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldr r4, _08114F04 @ =gStringVar2
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5, 0x6]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r4, _08114F08 @ =gStringVar3
	ldrb r1, [r6, 0x1]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _08114F0C @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0x5
	bl UnkTextUtil_SetPtrI
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	bne _08114F2C
	ldrb r0, [r6, 0x1]
	cmp r0, 0x1
	bne _08114F18
	ldr r0, _08114F10 @ =gStringVar4
	ldr r1, _08114F14 @ =gUnknown_841AA01
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F00: .4byte gStringVar1
_08114F04: .4byte gStringVar2
_08114F08: .4byte gStringVar3
_08114F0C: .4byte gSaveBlock2Ptr
_08114F10: .4byte gStringVar4
_08114F14: .4byte gUnknown_841AA01
_08114F18:
	ldr r0, _08114F24 @ =gStringVar4
	ldr r1, _08114F28 @ =gUnknown_841AA2B
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F24: .4byte gStringVar4
_08114F28: .4byte gUnknown_841AA2B
_08114F2C:
	ldrb r1, [r6, 0x1]
	cmp r1, 0
	bne _08114F5C
	cmp r0, 0x1
	bne _08114F48
	ldr r0, _08114F40 @ =gStringVar4
	ldr r1, _08114F44 @ =gUnknown_841A9A9
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F40: .4byte gStringVar4
_08114F44: .4byte gUnknown_841A9A9
_08114F48:
	ldr r0, _08114F54 @ =gStringVar4
	ldr r1, _08114F58 @ =gUnknown_841A9D4
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F54: .4byte gStringVar4
_08114F58: .4byte gUnknown_841A9D4
_08114F5C:
	cmp r0, 0x1
	bne _08114F8C
	cmp r1, 0x1
	bne _08114F78
	ldr r0, _08114F70 @ =gStringVar4
	ldr r1, _08114F74 @ =gUnknown_841AA76
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F70: .4byte gStringVar4
_08114F74: .4byte gUnknown_841AA76
_08114F78:
	ldr r0, _08114F84 @ =gStringVar4
	ldr r1, _08114F88 @ =gUnknown_841AAAA
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F84: .4byte gStringVar4
_08114F88: .4byte gUnknown_841AAAA
_08114F8C:
	cmp r1, 0x1
	bne _08114FA4
	ldr r0, _08114F9C @ =gStringVar4
	ldr r1, _08114FA0 @ =gUnknown_841AAEC
	bl UnkTextUtil_StringExpandPlaceholders
	b _08114FAC
	.align 2, 0
_08114F9C: .4byte gStringVar4
_08114FA0: .4byte gUnknown_841AAEC
_08114FA4:
	ldr r0, _08114FB4 @ =gStringVar4
	ldr r1, _08114FB8 @ =gUnknown_841AB29
	bl UnkTextUtil_StringExpandPlaceholders
_08114FAC:
	adds r0, r6, 0x4
_08114FAE:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08114FB4: .4byte gStringVar4
_08114FB8: .4byte gUnknown_841AB29
	thumb_func_end sub_8114E68

	thumb_func_start sub_8114FBC
sub_8114FBC: @ 8114FBC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x96
	beq _08114FE6
	cmp r0, 0x96
	bgt _08114FD6
	cmp r0, 0x92
	bgt _08114FEA
	cmp r0, 0x8F
	blt _08114FEA
	b _08114FE6
_08114FD6:
	cmp r1, 0xF9
	blt _08114FEA
	cmp r1, 0xFA
	ble _08114FE6
	movs r0, 0xCD
	lsls r0, 1
	cmp r1, r0
	bne _08114FEA
_08114FE6:
	movs r0, 0x1
	b _08114FEC
_08114FEA:
	movs r0, 0
_08114FEC:
	pop {r1}
	bx r1
	thumb_func_end sub_8114FBC

	thumb_func_start sub_8114FF0
sub_8114FF0: @ 8114FF0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r1, _08115008 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x20
	adds r1, r3, 0
	bl sub_8114D18
	pop {r1}
	bx r1
	.align 2, 0
_08115008: .4byte gUnknown_203B048
	thumb_func_end sub_8114FF0

	thumb_func_start sub_811500C
sub_811500C: @ 811500C
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x20
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x6
	bl UnkTextUtil_Reset
	ldrh r0, [r4, 0x4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08115068 @ =gTrainers+0x4
	adds r1, r0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldrh r0, [r4, 0x2]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldr r1, _0811506C @ =gUnknown_8456ACC
	ldrb r0, [r5, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x3
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115070 @ =gStringVar4
	ldr r1, _08115074 @ =gUnknown_841AF3E
	bl UnkTextUtil_StringExpandPlaceholders
	adds r4, 0x8
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08115068: .4byte gTrainers+0x4
_0811506C: .4byte gUnknown_8456ACC
_08115070: .4byte gStringVar4
_08115074: .4byte gUnknown_841AF3E
	thumb_func_end sub_811500C

	thumb_func_start sub_8115078
sub_8115078: @ 8115078
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _081150B4 @ =gUnknown_8456AA0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	beq _081150C4
	ldr r1, _081150B8 @ =0x00002021
	adds r0, r1, 0
	strh r0, [r4]
	ldr r0, _081150BC @ =gUnknown_203AF98
	ldrh r0, [r0]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x6]
	ldrb r0, [r5, 0x6]
	strb r0, [r4, 0x8]
	ldr r1, _081150C0 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0xA
	b _081150C6
	.align 2, 0
_081150B4: .4byte gUnknown_8456AA0
_081150B8: .4byte 0x00002021
_081150BC: .4byte gUnknown_203AF98
_081150C0: .4byte gUnknown_203B048
_081150C4:
	movs r0, 0
_081150C6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8115078

	thumb_func_start sub_81150CC
sub_81150CC: @ 81150CC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _081150E8 @ =gUnknown_8456AA0
	adds r0, 0x21
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8110944
	lsls r0, 24
	cmp r0, 0
	bne _081150EC
	movs r0, 0
	b _081151AE
	.align 2, 0
_081150E8: .4byte gUnknown_8456AA0
_081150EC:
	adds r5, r4, 0
	adds r5, 0x8
	bl UnkTextUtil_Reset
	ldr r0, _08115108 @ =gUnknown_203B044
	ldrh r0, [r0, 0x2]
	cmp r0, 0x1
	beq _08115148
	cmp r0, 0x1
	bgt _0811510C
	cmp r0, 0
	beq _08115112
	b _081151AC
	.align 2, 0
_08115108: .4byte gUnknown_203B044
_0811510C:
	cmp r0, 0x2
	beq _08115194
	b _081151AC
_08115112:
	ldr r0, _08115134 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115138 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _0811513C @ =0x00003a4c
	adds r1, r0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115140 @ =gStringVar4
	ldr r1, _08115144 @ =gUnknown_841A2E1
	bl UnkTextUtil_StringExpandPlaceholders
	b _081151AC
	.align 2, 0
_08115134: .4byte gSaveBlock2Ptr
_08115138: .4byte gSaveBlock1Ptr
_0811513C: .4byte 0x00003a4c
_08115140: .4byte gStringVar4
_08115144: .4byte gUnknown_841A2E1
_08115148:
	ldr r0, _08115180 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _08115184 @ =0x00003a4c
	adds r1, r0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x4]
	movs r1, 0
	movs r2, 0x1
	bl sub_8113EAC
	ldr r0, _08115188 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x6]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r0, _0811518C @ =gStringVar4
	ldr r1, _08115190 @ =gUnknown_841A312
	bl UnkTextUtil_StringExpandPlaceholders
	b _081151AC
	.align 2, 0
_08115180: .4byte gSaveBlock1Ptr
_08115184: .4byte 0x00003a4c
_08115188: .4byte gSaveBlock2Ptr
_0811518C: .4byte gStringVar4
_08115190: .4byte gUnknown_841A312
_08115194:
	ldr r1, _081151B4 @ =gUnknown_8456AD8
	ldrb r0, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _081151B8 @ =gStringVar4
	ldr r1, _081151BC @ =gUnknown_841A349
	bl UnkTextUtil_StringExpandPlaceholders
_081151AC:
	adds r0, r5, 0x2
_081151AE:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081151B4: .4byte gUnknown_8456AD8
_081151B8: .4byte gStringVar4
_081151BC: .4byte gUnknown_841A349
	thumb_func_end sub_81150CC

	thumb_func_start sub_81151C0
sub_81151C0: @ 81151C0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r1, _081151D8 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x22
	adds r1, r3, 0
	bl sub_8114D18
	pop {r1}
	bx r1
	.align 2, 0
_081151D8: .4byte gUnknown_203B048
	thumb_func_end sub_81151C0

	thumb_func_start sub_81151DC
sub_81151DC: @ 81151DC
	push {r4-r6,lr}
	adds r1, r0, 0
	movs r0, 0x22
	bl sub_8113E88
	adds r5, r0, 0
	adds r6, r5, 0x6
	bl UnkTextUtil_Reset
	ldr r4, _0811522C @ =gStringVar1
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r3, _08115230 @ =gTrainers
	ldrh r1, [r5, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r2, r0, 3
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	cmp r0, 0x51
	beq _0811521A
	cmp r0, 0x59
	beq _0811521A
	cmp r0, 0x5A
	bne _08115234
_0811521A:
	movs r0, 0x6
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	b _0811523E
	.align 2, 0
_0811522C: .4byte gStringVar1
_08115230: .4byte gTrainers
_08115234:
	adds r1, r3, 0x4
	adds r1, r2, r1
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
_0811523E:
	ldrh r0, [r5]
	movs r1, 0
	movs r2, 0x2
	bl sub_8113EAC
	ldrh r0, [r5, 0x2]
	movs r1, 0
	movs r2, 0x3
	bl sub_8113EAC
	ldr r1, _08115274 @ =gUnknown_8456ACC
	ldrb r0, [r6, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x4
	bl UnkTextUtil_SetPtrI
	ldr r0, _08115278 @ =gStringVar4
	ldr r1, _0811527C @ =gUnknown_841AF6D
	bl UnkTextUtil_StringExpandPlaceholders
	adds r0, r6, 0x2
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08115274: .4byte gUnknown_8456ACC
_08115278: .4byte gStringVar4
_0811527C: .4byte gUnknown_841AF6D
	thumb_func_end sub_81151DC

	thumb_func_start sub_8115280
sub_8115280: @ 8115280
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x23
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _08115298
	movs r0, 0
	b _081152B0
_08115298:
	ldrb r0, [r4]
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	strb r0, [r2, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x24
	bne _081152AE
	ldr r1, _081152B8 @ =gUnknown_203B048
	movs r0, 0x1
	strb r0, [r1]
_081152AE:
	adds r0, r2, 0x2
_081152B0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081152B8: .4byte gUnknown_203B048
	thumb_func_end sub_8115280

	thumb_func_start sub_81152BC
sub_81152BC: @ 81152BC
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x23
	bl sub_8113E88
	adds r5, r0, 0
	ldrb r6, [r5, 0x1]
	ldr r0, _08115318 @ =gStringVar1
	ldrb r1, [r5]
	bl sub_80C4DF8
	ldr r0, _0811531C @ =gStringVar2
	ldr r2, _08115320 @ =gUnknown_8456AF0
	lsls r1, r6, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _08115324 @ =gUnknown_8456BE4
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, 0x5
	bne _08115378
	movs r4, 0
	ldr r2, _08115328 @ =gUnknown_8456C17
	adds r7, r5, 0x2
	ldrb r1, [r5]
_081152F2:
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08115334
	movs r1, 0x82
	lsls r1, 4
	adds r0, r4, r1
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08115364
	ldr r0, _0811532C @ =gStringVar4
	ldr r1, _08115330 @ =gUnknown_841AE48
	bl StringExpandPlaceholders
	b _0811533E
	.align 2, 0
_08115318: .4byte gStringVar1
_0811531C: .4byte gStringVar2
_08115320: .4byte gUnknown_8456AF0
_08115324: .4byte gUnknown_8456BE4
_08115328: .4byte gUnknown_8456C17
_0811532C: .4byte gStringVar4
_08115330: .4byte gUnknown_841AE48
_08115334:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _081152F2
_0811533E:
	cmp r4, 0x8
	bne _0811538A
	ldr r0, _08115358 @ =gStringVar4
	ldr r2, _0811535C @ =gUnknown_8456BBC
	ldr r1, _08115360 @ =gUnknown_8456BE4
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	b _0811538A
	.align 2, 0
_08115358: .4byte gStringVar4
_0811535C: .4byte gUnknown_8456BBC
_08115360: .4byte gUnknown_8456BE4
_08115364:
	ldr r0, _08115370 @ =gStringVar4
	ldr r1, _08115374 @ =gUnknown_841AE8F
	bl StringExpandPlaceholders
	b _0811533E
	.align 2, 0
_08115370: .4byte gStringVar4
_08115374: .4byte gUnknown_841AE8F
_08115378:
	ldr r0, _08115394 @ =gStringVar4
	ldr r2, _08115398 @ =gUnknown_8456BBC
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	adds r7, r5, 0x2
_0811538A:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08115394: .4byte gStringVar4
_08115398: .4byte gUnknown_8456BBC
	thumb_func_end sub_81152BC

	thumb_func_start sub_811539C
sub_811539C: @ 811539C
	ldr r1, _081153A4 @ =gUnknown_203B04B
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_081153A4: .4byte gUnknown_203B04B
	thumb_func_end sub_811539C

	thumb_func_start sub_81153A8
sub_81153A8: @ 81153A8
	push {lr}
	adds r2, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x23
	beq _081153C4
	ldr r1, _081153C0 @ =gUnknown_203B04A
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _081153DE
	.align 2, 0
_081153C0: .4byte gUnknown_203B04A
_081153C4:
	ldr r3, _081153D8 @ =gUnknown_203B04A
	ldrb r1, [r3]
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	cmp r1, r0
	beq _081153DC
	strb r0, [r3]
	movs r0, 0x1
	b _081153DE
	.align 2, 0
_081153D8: .4byte gUnknown_203B04A
_081153DC:
	movs r0, 0
_081153DE:
	pop {r1}
	bx r1
	thumb_func_end sub_81153A8

	thumb_func_start sub_81153E4
sub_81153E4: @ 81153E4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x23
	bne _08115408
	ldrb r0, [r1, 0x1]
	ldr r1, _08115400 @ =gUnknown_203B04B
	cmp r0, 0x20
	bne _08115404
	ldrb r0, [r1]
	cmp r0, 0
	bne _08115404
	movs r0, 0
	b _0811540A
	.align 2, 0
_08115400: .4byte gUnknown_203B04B
_08115404:
	movs r0, 0
	strb r0, [r1]
_08115408:
	movs r0, 0x1
_0811540A:
	pop {r1}
	bx r1
	thumb_func_end sub_81153E4

	thumb_func_start sub_8115410
sub_8115410: @ 8115410
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x24
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	bne _08115428
	movs r0, 0
	b _08115454
_08115428:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r3, r2, 0x2
	ldrb r0, [r4, 0x2]
	strb r0, [r2, 0x2]
	ldrb r0, [r4, 0x3]
	strb r0, [r3, 0x1]
	ldrb r0, [r2, 0x2]
	subs r0, 0x7
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0811544C
	ldr r1, _08115448 @ =gUnknown_203B048
	movs r0, 0x2
	b _08115450
	.align 2, 0
_08115448: .4byte gUnknown_203B048
_0811544C:
	ldr r1, _0811545C @ =gUnknown_203B048
	movs r0, 0x1
_08115450:
	strb r0, [r1]
	adds r0, r3, 0x2
_08115454:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811545C: .4byte gUnknown_203B048
	thumb_func_end sub_8115410

	thumb_func_start sub_8115460
sub_8115460: @ 8115460
	push {r4,r5,lr}
	adds r1, r0, 0
	movs r0, 0x24
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	ldrh r0, [r4]
	ldr r1, _0811549C @ =gStringVar1
	movs r2, 0
	bl sub_8113EAC
	ldrb r0, [r5, 0x1]
	cmp r0, 0xFF
	beq _08115486
	ldr r0, _081154A0 @ =gStringVar2
	ldrb r1, [r5, 0x1]
	bl sub_80C4DF8
_08115486:
	ldrb r0, [r4, 0x2]
	cmp r0, 0x7
	bne _081154B4
	ldrb r0, [r5, 0x1]
	cmp r0, 0x58
	bne _081154AC
	ldr r0, _081154A4 @ =gStringVar3
	ldr r1, _081154A8 @ =gUnknown_841B09F
	bl StringCopy
	b _081154B4
	.align 2, 0
_0811549C: .4byte gStringVar1
_081154A0: .4byte gStringVar2
_081154A4: .4byte gStringVar3
_081154A8: .4byte gUnknown_841B09F
_081154AC:
	ldr r0, _081154CC @ =gStringVar3
	ldr r1, _081154D0 @ =gUnknown_8418C1B
	bl StringCopy
_081154B4:
	ldr r0, _081154D4 @ =gStringVar4
	ldr r2, _081154D8 @ =gUnknown_8456C20
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringExpandPlaceholders
	adds r0, r5, 0x2
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081154CC: .4byte gStringVar3
_081154D0: .4byte gUnknown_8418C1B
_081154D4: .4byte gStringVar4
_081154D8: .4byte gUnknown_8456C20
	thumb_func_end sub_8115460

	thumb_func_start sub_81154DC
sub_81154DC: @ 81154DC
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x25
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _0811550E
	ldrh r0, [r4, 0x4]
	strh r0, [r2]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x2]
	ldr r1, [r4]
	lsrs r0, r1, 16
	strh r0, [r2, 0x4]
	strh r1, [r2, 0x6]
	ldrb r0, [r4, 0x8]
	strb r0, [r2, 0x8]
	movs r0, 0x1
	strb r0, [r2, 0x9]
	adds r0, r2, 0
	adds r0, 0xA
	b _08115510
_0811550E:
	movs r0, 0
_08115510:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81154DC

	thumb_func_start sub_8115518
sub_8115518: @ 8115518
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x25
	bl sub_8113E88
	adds r4, r0, 0
	adds r7, r4, 0
	adds r7, 0x8
	ldrh r0, [r4, 0x4]
	lsls r0, 16
	ldrh r1, [r4, 0x6]
	adds r6, r0, r1
	bl UnkTextUtil_Reset
	ldr r5, _08115564 @ =gStringVar1
	ldrb r1, [r4, 0x8]
	adds r0, r5, 0
	bl sub_80C4DF8
	movs r0, 0
	adds r1, r5, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r4, 0x2]
	cmp r0, 0x1
	bhi _08115570
	ldr r0, _08115568 @ =gStringVar4
	ldr r1, _0811556C @ =gUnknown_841A7DD
	bl UnkTextUtil_StringExpandPlaceholders
	b _0811558E
	.align 2, 0
_08115564: .4byte gStringVar1
_08115568: .4byte gStringVar4
_0811556C: .4byte gUnknown_841A7DD
_08115570:
	ldr r4, _08115598 @ =gStringVar2
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _0811559C @ =gStringVar4
	ldr r1, _081155A0 @ =gUnknown_841A810
	bl UnkTextUtil_StringExpandPlaceholders
_0811558E:
	adds r0, r7, 0x2
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08115598: .4byte gStringVar2
_0811559C: .4byte gStringVar4
_081155A0: .4byte gUnknown_841A810
	thumb_func_end sub_8115518

	thumb_func_start sub_81155A4
sub_81155A4: @ 81155A4
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x26
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081155D6
	ldrh r0, [r4, 0x4]
	strh r0, [r2]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x2]
	ldr r1, [r4]
	lsrs r0, r1, 16
	strh r0, [r2, 0x4]
	strh r1, [r2, 0x6]
	ldrb r0, [r4, 0x8]
	strb r0, [r2, 0x8]
	ldrb r0, [r4, 0x9]
	strb r0, [r2, 0x9]
	adds r0, r2, 0
	adds r0, 0xA
	b _081155D8
_081155D6:
	movs r0, 0
_081155D8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81155A4

	thumb_func_start sub_81155E0
sub_81155E0: @ 81155E0
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r0, 0x26
	bl sub_8113E88
	adds r5, r0, 0
	adds r7, r5, 0
	adds r7, 0x8
	ldrh r0, [r5, 0x4]
	lsls r0, 16
	ldrh r1, [r5, 0x6]
	adds r6, r0, r1
	bl UnkTextUtil_Reset
	ldr r4, _0811563C @ =gStringVar1
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl sub_80C4DF8
	ldrb r0, [r7, 0x1]
	cmp r0, 0
	bne _08115690
	ldr r0, _08115640 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	movs r0, 0x1
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	movs r0, 0x2
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5, 0x2]
	cmp r0, 0x1
	bne _08115648
	ldr r1, _08115644 @ =gUnknown_841A8D4
	movs r0, 0x3
	bl UnkTextUtil_SetPtrI
	b _08115670
	.align 2, 0
_0811563C: .4byte gStringVar1
_08115640: .4byte gSaveBlock2Ptr
_08115644: .4byte gUnknown_841A8D4
_08115648:
	ldr r4, _0811567C @ =gStringVar2
	ldrh r1, [r5, 0x2]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r4, _08115680 @ =gStringVar3
	ldr r1, _08115684 @ =gUnknown_841A8DD
	adds r0, r4, 0
	bl UnkTextUtil_StringExpandPlaceholders
	movs r0, 0x3
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
_08115670:
	ldr r0, _08115688 @ =gStringVar4
	ldr r1, _0811568C @ =gUnknown_841A858
	bl UnkTextUtil_StringExpandPlaceholders
	b _081156C4
	.align 2, 0
_0811567C: .4byte gStringVar2
_08115680: .4byte gStringVar3
_08115684: .4byte gUnknown_841A8DD
_08115688: .4byte gStringVar4
_0811568C: .4byte gUnknown_841A858
_08115690:
	movs r0, 0
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldrh r0, [r5]
	bl ItemId_GetItem
	adds r1, r0, 0
	movs r0, 0x1
	bl UnkTextUtil_SetPtrI
	ldr r4, _081156CC @ =gStringVar2
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	movs r0, 0x2
	adds r1, r4, 0
	bl UnkTextUtil_SetPtrI
	ldr r0, _081156D0 @ =gStringVar4
	ldr r1, _081156D4 @ =gUnknown_841A896
	bl UnkTextUtil_StringExpandPlaceholders
_081156C4:
	adds r0, r7, 0x2
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081156CC: .4byte gStringVar2
_081156D0: .4byte gStringVar4
_081156D4: .4byte gUnknown_841A896
	thumb_func_end sub_81155E0

	thumb_func_start sub_81156D8
sub_81156D8: @ 81156D8
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x28
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081156F8
	ldrh r0, [r4]
	strh r0, [r2]
	ldrb r0, [r4, 0x2]
	strb r0, [r2, 0x2]
	adds r0, r2, 0x4
	b _081156FA
_081156F8:
	movs r0, 0
_081156FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81156D8

	thumb_func_start sub_8115700
sub_8115700: @ 8115700
	push {r4-r6,lr}
	adds r1, r0, 0
	movs r0, 0x28
	bl sub_8113E88
	adds r4, r0, 0
	adds r5, r4, 0x2
	ldr r0, _08115738 @ =gStringVar1
	ldrb r1, [r4, 0x2]
	bl sub_80C4DF8
	ldr r6, _0811573C @ =gStringVar2
	ldrh r0, [r4]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r6, 0
	bl StringCopy
	ldr r0, _08115740 @ =gStringVar4
	ldr r1, _08115744 @ =gUnknown_841B03F
	bl StringExpandPlaceholders
	adds r5, 0x2
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08115738: .4byte gStringVar1
_0811573C: .4byte gStringVar2
_08115740: .4byte gStringVar4
_08115744: .4byte gUnknown_841B03F
	thumb_func_end sub_8115700

	thumb_func_start sub_8115748
sub_8115748: @ 8115748
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08115764 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08115792
	movs r1, 0
	ldr r4, _08115768 @ =gUnknown_203B049
	ldr r0, _0811576C @ =gUnknown_8456C50
	b _08115778
	.align 2, 0
_08115764: .4byte gUnknown_203ADFA
_08115768: .4byte gUnknown_203B049
_0811576C: .4byte gUnknown_8456C50
_08115770:
	movs r0, 0
	b _08115790
_08115774:
	adds r0, 0x2
	adds r1, 0x1
_08115778:
	cmp r1, 0x10
	bgt _08115792
	ldrh r3, [r0]
	cmp r2, r3
	bne _08115774
	adds r0, r2, 0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08115770
	movs r0, 0x1
_08115790:
	strb r0, [r4]
_08115792:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8115748

	thumb_func_start sub_8115798
sub_8115798: @ 8115798
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081157D0 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _081157C6
	ldr r4, _081157D4 @ =gUnknown_203B049
	ldrb r0, [r4]
	cmp r0, 0
	beq _081157C6
	ldr r0, _081157D8 @ =gMapHeader
	ldrb r1, [r0, 0x14]
	mov r0, sp
	strh r1, [r0]
	movs r0, 0x2A
	mov r1, sp
	bl sub_8113550
	movs r0, 0
	strb r0, [r4]
_081157C6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081157D0: .4byte gUnknown_203ADFA
_081157D4: .4byte gUnknown_203B049
_081157D8: .4byte gMapHeader
	thumb_func_end sub_8115798

	thumb_func_start sub_81157DC
sub_81157DC: @ 81157DC
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0x2A
	adds r1, r2, 0
	bl sub_8113DE0
	adds r2, r0, 0
	cmp r2, 0
	beq _081157F8
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r2, 0x2
	b _081157FA
_081157F8:
	movs r0, 0
_081157FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81157DC

	thumb_func_start sub_8115800
sub_8115800: @ 8115800
	push {r4,lr}
	adds r1, r0, 0
	movs r0, 0x2A
	bl sub_8113E88
	adds r4, r0, 0
	ldr r0, _08115828 @ =gStringVar1
	ldrb r1, [r4]
	bl sub_80C4DF8
	ldr r0, _0811582C @ =gStringVar4
	ldr r1, _08115830 @ =gUnknown_841B064
	bl StringExpandPlaceholders
	adds r4, 0x2
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08115828: .4byte gStringVar1
_0811582C: .4byte gStringVar4
_08115830: .4byte gUnknown_841B064
	thumb_func_end sub_8115800

	thumb_func_start sub_8115834
sub_8115834: @ 8115834
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0xFC
	bne _08115868
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0x15
	bne _08115868
	movs r2, 0
	b _08115854
_0811584C:
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x4
	bgt _0811585A
_08115854:
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _0811584C
_0811585A:
	movs r0, 0xFC
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x16
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x1]
_08115868:
	pop {r0}
	bx r0
	thumb_func_end sub_8115834

	.align 2, 0 @ Don't pad with nop.
