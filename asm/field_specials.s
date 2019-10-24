	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80CC59C
sub_80CC59C: @ 80CC59C
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _080CC5F8 @ =0x0000404d
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r6, _080CC5FC @ =0xffffff00
	ldr r0, [sp, 0x4]
	ands r0, r6
	ldr r4, _080CC600 @ =0xffff00ff
	ands r0, r4
	str r0, [sp, 0x4]
	ldr r0, _080CC604 @ =0x00000808
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080CC5C4
	b _080CC71E
_080CC5C4:
	cmp r5, 0x5
	bne _080CC61C
	ldr r0, _080CC608 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	adds r7, r0, 0
	cmp r1, 0xF
	bne _080CC67C
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, 0
	beq _080CC5E2
	cmp r0, 0x3
	bne _080CC67C
_080CC5E2:
	ldr r1, [sp, 0x4]
	ands r1, r6
	movs r0, 0x66
	orrs r1, r0
	str r1, [sp, 0x4]
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, 0
	bne _080CC60C
	lsls r0, r5, 8
	b _080CC610
	.align 2, 0
_080CC5F8: .4byte 0x0000404d
_080CC5FC: .4byte 0xffffff00
_080CC600: .4byte 0xffff00ff
_080CC604: .4byte 0x00000808
_080CC608: .4byte gSaveBlock1Ptr
_080CC60C:
	movs r0, 0xC0
	lsls r0, 3
_080CC610:
	ands r1, r4
	orrs r1, r0
	str r1, [sp, 0x4]
	add r1, sp, 0x4
	movs r0, 0x23
	b _080CC66C
_080CC61C:
	ldr r7, _080CC65C @ =gSaveBlock1Ptr
	cmp r5, 0x3
	bne _080CC67C
	ldr r1, [r7]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x3
	bne _080CC67C
	ldrb r0, [r1, 0x5]
	subs r0, 0x29
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080CC67C
	ldr r1, _080CC660 @ =gUnknown_83F5D58
	ldrh r0, [r1, 0x18]
	ldrh r1, [r1, 0x1A]
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	add r1, sp, 0x4
	strb r0, [r1]
	ldr r0, [r7]
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	adds r6, r1, 0
	cmp r0, 0x29
	bne _080CC664
	strb r5, [r6, 0x1]
	b _080CC668
	.align 2, 0
_080CC65C: .4byte gSaveBlock1Ptr
_080CC660: .4byte gUnknown_83F5D58
_080CC664:
	movs r0, 0x4
	strb r0, [r6, 0x1]
_080CC668:
	movs r0, 0x23
	adds r1, r6, 0
_080CC66C:
	bl sub_8113550
	ldr r0, _080CC678 @ =0x00000808
	bl FlagClear
	b _080CC71E
	.align 2, 0
_080CC678: .4byte 0x00000808
_080CC67C:
	ldr r3, [r7]
	movs r2, 0x4
	ldrsb r2, [r3, r2]
	ldr r1, _080CC6D0 @ =gUnknown_83F5D58
	lsls r0, r5, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0x4]
	cmp r2, r0
	bne _080CC71E
	movs r0, 0x5
	ldrsb r0, [r3, r0]
	ldrh r2, [r1, 0x6]
	cmp r0, r2
	bne _080CC71E
	ldrh r0, [r1]
	ldrh r1, [r1, 0x2]
	bl get_mapheader_by_bank_and_number
	ldrb r1, [r0, 0x14]
	add r0, sp, 0x4
	strb r1, [r0]
	strb r5, [r0, 0x1]
	adds r6, r0, 0
	cmp r5, 0x16
	bne _080CC6D4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xF
	bne _080CC6F6
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x1A
	beq _080CC6FC
	b _080CC6F6
	.align 2, 0
_080CC6D0: .4byte gUnknown_83F5D58
_080CC6D4:
	cmp r5, 0x2A
	bne _080CC6FC
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x43
	bne _080CC6F6
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	beq _080CC6FC
_080CC6F6:
	ldrb r0, [r6, 0x1]
	adds r0, 0x1
	strb r0, [r6, 0x1]
_080CC6FC:
	movs r0, 0x23
	adds r1, r6, 0
	bl sub_8113550
	ldr r4, _080CC728 @ =0x00000808
	adds r0, r4, 0
	bl FlagClear
	cmp r5, 0x23
	bne _080CC71E
	ldr r0, _080CC72C @ =0x0000404d
	movs r1, 0x20
	bl VarSet
	adds r0, r4, 0
	bl FlagSet
_080CC71E:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC728: .4byte 0x00000808
_080CC72C: .4byte 0x0000404d
	thumb_func_end sub_80CC59C

	thumb_func_start Special_BattleCardAction
Special_BattleCardAction: @ 80CC730
	push {lr}
	ldr r0, _080CC744 @ =gSpecialVar_Result
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080CC77C
	lsls r0, 2
	ldr r1, _080CC748 @ =_080CC74C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CC744: .4byte gSpecialVar_Result
_080CC748: .4byte _080CC74C
	.align 2, 0
_080CC74C:
	.4byte _080CC760
	.4byte _080CC764
	.4byte _080CC768
	.4byte _080CC76C
	.4byte _080CC770
_080CC760:
	movs r0, 0x3
	b _080CC772
_080CC764:
	movs r0, 0x4
	b _080CC772
_080CC768:
	movs r0, 0
	b _080CC772
_080CC76C:
	movs r0, 0x1
	b _080CC772
_080CC770:
	movs r0, 0x2
_080CC772:
	bl sub_81445C0
	lsls r0, 16
	lsrs r0, 16
	b _080CC78A
_080CC77C:
	@ AGB_ASSERT_EX(0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/scr_tool.c", 3873)
	ldr r0, _080CC790 @ =gUnknown_83F5EF0	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/scr_tool.c"
	ldr r1, _080CC794 @ =0x00000f21
	ldr r2, _080CC798 @ =gUnknown_83F5F24	"0"
	movs r3, 0x1
	bl AGBAssert
	movs r0, 0
_080CC78A:
	pop {r1}
	bx r1
	.align 2, 0
_080CC790: .4byte gUnknown_83F5EF0
_080CC794: .4byte 0x00000f21
_080CC798: .4byte gUnknown_83F5F24
	thumb_func_end Special_BattleCardAction

	thumb_func_start set_unknown_box_id
set_unknown_box_id: @ 80CC79C
	ldr r1, _080CC7A4 @ =gUnknown_2039A1A
	strb r0, [r1]
	bx lr
	.align 2, 0
_080CC7A4: .4byte gUnknown_2039A1A
	thumb_func_end set_unknown_box_id

	thumb_func_start get_unknown_box_id
get_unknown_box_id: @ 80CC7A8
	ldr r0, _080CC7B0 @ =gUnknown_2039A1A
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080CC7B0: .4byte gUnknown_2039A1A
	thumb_func_end get_unknown_box_id

	thumb_func_start sub_80CC7B4
sub_80CC7B4: @ 80CC7B4
	push {r4,r5,lr}
	ldr r5, _080CC7E8 @ =0x00000843
	adds r0, r5, 0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080CC7F0
	bl StorageGetCurrentBox
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080CC7EC @ =0x00004037
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _080CC7F0
	adds r0, r5, 0
	bl FlagSet
	movs r0, 0x1
	b _080CC7F2
	.align 2, 0
_080CC7E8: .4byte 0x00000843
_080CC7EC: .4byte 0x00004037
_080CC7F0:
	movs r0, 0
_080CC7F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80CC7B4

	thumb_func_start sub_80CC7F8
sub_80CC7F8: @ 80CC7F8
	push {r4-r7,lr}
	ldr r0, _080CC850 @ =0x00004037
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl set_unknown_box_id
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r4, r0, 24
_080CC810:
	movs r5, 0
	lsls r6, r4, 24
	lsls r7, r4, 16
_080CC816:
	lsls r1, r5, 24
	lsrs r1, 24
	lsrs r0, r6, 24
	bl GetBoxedMonPtr
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	bne _080CC858
	bl get_unknown_box_id
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	beq _080CC83E
	ldr r0, _080CC854 @ =0x00000843
	bl FlagClear
_080CC83E:
	ldr r0, _080CC850 @ =0x00004037
	lsrs r1, r7, 16
	bl VarSet
	bl sub_80CC7B4
	lsls r0, 24
	lsrs r0, 24
	b _080CC874
	.align 2, 0
_080CC850: .4byte 0x00004037
_080CC854: .4byte 0x00000843
_080CC858:
	adds r5, 0x1
	cmp r5, 0x1D
	ble _080CC816
	adds r4, 0x1
	cmp r4, 0xE
	bne _080CC866
	movs r4, 0
_080CC866:
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080CC810
	movs r0, 0
_080CC874:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80CC7F8

	thumb_func_start sub_80CC87C
sub_80CC87C: @ 80CC87C
	push {r4,lr}
	ldr r0, _080CC8AC @ =gUnknown_2031DB4
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 8
	ldrb r0, [r0, 0x1]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, _080CC8B0 @ =gUnknown_83F5F26
	ldrh r0, [r2]
	ldr r1, _080CC8B4 @ =0x0000ffff
	cmp r0, r1
	beq _080CC8C2
	adds r4, r1, 0
	adds r1, r2, 0
_080CC8A0:
	ldrh r0, [r2]
	cmp r0, r3
	bne _080CC8B8
	movs r0, 0x1
	b _080CC8C4
	.align 2, 0
_080CC8AC: .4byte gUnknown_2031DB4
_080CC8B0: .4byte gUnknown_83F5F26
_080CC8B4: .4byte 0x0000ffff
_080CC8B8:
	adds r1, 0x2
	adds r2, 0x2
	ldrh r0, [r1]
	cmp r0, r4
	bne _080CC8A0
_080CC8C2:
	movs r0, 0
_080CC8C4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80CC87C

	thumb_func_start sub_80CC8CC
sub_80CC8CC: @ 80CC8CC
	push {r4,lr}
	ldr r1, _080CC8E4 @ =gSpecialVar_0x8004
	ldr r2, _080CC8E8 @ =0xfffffedf
	adds r0, r2, 0
	ldrh r2, [r1]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x39
	bls _080CC8EC
	movs r0, 0
	b _080CC908
	.align 2, 0
_080CC8E4: .4byte gSpecialVar_0x8004
_080CC8E8: .4byte 0xfffffedf
_080CC8EC:
	ldr r4, _080CC910 @ =gStringVar1
	ldrh r0, [r1]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _080CC914 @ =gMoveNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0x1
_080CC908:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080CC910: .4byte gStringVar1
_080CC914: .4byte gMoveNames
	thumb_func_end sub_80CC8CC

	thumb_func_start sub_80CC918
sub_80CC918: @ 80CC918
	push {r4,lr}
	ldr r4, _080CC940 @ =0x00004025
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080CC944 @ =0x000001f3
	cmp r1, r0
	bhi _080CC938
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl VarSet
_080CC938:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC940: .4byte 0x00004025
_080CC944: .4byte 0x000001f3
	thumb_func_end sub_80CC918

	thumb_func_start Special_DaisyMassageServices
Special_DaisyMassageServices: @ 80CC948
	push {lr}
	ldr r0, _080CC968 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080CC96C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x6
	bl AdjustFriendship
	ldr r0, _080CC970 @ =0x00004025
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_080CC968: .4byte gSpecialVar_0x8004
_080CC96C: .4byte gPlayerParty
_080CC970: .4byte 0x00004025
	thumb_func_end Special_DaisyMassageServices

	thumb_func_start sub_80CC974
sub_80CC974: @ 80CC974
	push {r4-r6,lr}
	ldr r0, _080CC9A8 @ =sub_80CCA18
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r5, r1, 3
	ldr r6, _080CC9AC @ =gTasks+0x8
	adds r4, r5, r6
	movs r0, 0x3
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CC9B4
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _080CC9B0 @ =sub_80CCAF4
	str r1, [r0]
	b _080CCA08
	.align 2, 0
_080CC9A8: .4byte sub_80CCA18
_080CC9AC: .4byte gTasks+0x8
_080CC9B0: .4byte sub_80CCAF4
_080CC9B4:
	ldr r0, _080CC9D8 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CC9DC @ =0x00004f01
	cmp r1, r0
	bne _080CC9E8
	ldr r0, _080CC9E0 @ =gUnknown_83F61FB
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, 0x8
	strh r0, [r4, 0x4]
	ldr r0, _080CC9E4 @ =gUnknown_83F60D0
	movs r1, 0x70
	movs r2, 0x20
	bl LoadPalette
	b _080CC9FC
	.align 2, 0
_080CC9D8: .4byte gSaveBlock1Ptr
_080CC9DC: .4byte 0x00004f01
_080CC9E0: .4byte gUnknown_83F61FB
_080CC9E4: .4byte gUnknown_83F60D0
_080CC9E8:
	ldr r0, _080CCA10 @ =gUnknown_83F61F0
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, 0xB
	strh r0, [r4, 0x4]
	ldr r0, _080CCA14 @ =gUnknown_83F5F50
	movs r1, 0x70
	movs r2, 0x20
	bl LoadPalette
_080CC9FC:
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x7
	movs r1, 0x1
	bl sub_8059948
_080CCA08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCA10: .4byte gUnknown_83F61F0
_080CCA14: .4byte gUnknown_83F5F50
	thumb_func_end sub_80CC974

	thumb_func_start sub_80CCA18
sub_80CCA18: @ 80CCA18
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080CCAA4 @ =gTasks+0x8
	adds r4, r1, r0
	ldr r0, _080CCAA8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CCAE6
	movs r0, 0x2
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080CCAE6
	movs r0, 0x5
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CCAE6
	ldr r0, _080CCAAC @ =gUnknown_2036E28
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _080CCAE6
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _080CCAE6
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x4
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080CCA78
	strh r2, [r4, 0x2]
_080CCA78:
	ldr r0, _080CCAB0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CCAB4 @ =0x00004f01
	cmp r1, r0
	bne _080CCAC0
	ldr r1, _080CCAB8 @ =gUnknown_83F61FB
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	lsls r0, 5
	ldr r1, _080CCABC @ =gUnknown_83F60D0
	adds r0, r1
	movs r1, 0x70
	movs r2, 0x20
	bl LoadPalette
	b _080CCADE
	.align 2, 0
_080CCAA4: .4byte gTasks+0x8
_080CCAA8: .4byte gPaletteFade
_080CCAAC: .4byte gUnknown_2036E28
_080CCAB0: .4byte gSaveBlock1Ptr
_080CCAB4: .4byte 0x00004f01
_080CCAB8: .4byte gUnknown_83F61FB
_080CCABC: .4byte gUnknown_83F60D0
_080CCAC0:
	ldr r1, _080CCAEC @ =gUnknown_83F61F0
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	lsls r0, 5
	ldr r1, _080CCAF0 @ =gUnknown_83F5F50
	adds r0, r1
	movs r1, 0x70
	movs r2, 0x20
	bl LoadPalette
_080CCADE:
	movs r0, 0x7
	movs r1, 0x1
	bl sub_8059948
_080CCAE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCAEC: .4byte gUnknown_83F61F0
_080CCAF0: .4byte gUnknown_83F5F50
	thumb_func_end sub_80CCA18

	thumb_func_start sub_80CCAF4
sub_80CCAF4: @ 80CCAF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080CCB5A
	ldr r0, _080CCB20 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CCB24 @ =0x00004f01
	cmp r1, r0
	bne _080CCB2C
	ldr r0, _080CCB28 @ =gUnknown_83F61D0
	movs r1, 0x70
	movs r2, 0x20
	bl LoadPalette
	b _080CCB36
	.align 2, 0
_080CCB20: .4byte gSaveBlock1Ptr
_080CCB24: .4byte 0x00004f01
_080CCB28: .4byte gUnknown_83F61D0
_080CCB2C:
	ldr r0, _080CCB60 @ =gUnknown_83F60B0
	movs r1, 0x70
	movs r2, 0x20
	bl LoadPalette
_080CCB36:
	movs r0, 0x7
	movs r1, 0x1
	bl sub_8059948
	ldr r0, _080CCB64 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CCB54
	movs r0, 0x80
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
_080CCB54:
	adds r0, r4, 0
	bl DestroyTask
_080CCB5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCB60: .4byte gUnknown_83F60B0
_080CCB64: .4byte gPaletteFade
	thumb_func_end sub_80CCAF4

	thumb_func_start sub_80CCB68
sub_80CCB68: @ 80CCB68
	push {r4,lr}
	ldr r4, _080CCB90 @ =sub_80CCA18
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCB88
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080CCB88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCB90: .4byte sub_80CCA18
	thumb_func_end sub_80CCB68

	thumb_func_start sub_80CCB94
sub_80CCB94: @ 80CCB94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r7, 0
	movs r6, 0
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080CCBC0 @ =gSpecialVar_0x8007
	mov r1, r8
	strh r1, [r0]
	movs r4, 0
	movs r0, 0x64
	mov r5, r8
	muls r5, r0
	ldr r0, _080CCBC4 @ =gPlayerParty
	mov r9, r0
	b _080CCBCE
	.align 2, 0
_080CCBC0: .4byte gSpecialVar_0x8007
_080CCBC4: .4byte gPlayerParty
_080CCBC8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CCBCE:
	cmp r4, 0x2
	bhi _080CCBEA
	mov r1, r9
	adds r0, r5, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	ldr r1, _080CCC1C @ =gUnknown_83F6203
	adds r1, r4, r1
	ldrb r1, [r1]
	cmp r0, r1
	bne _080CCBC8
	adds r7, r4, 0
_080CCBEA:
	cmp r4, 0x3
	beq _080CCC7A
	movs r0, 0x64
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _080CCC20 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0xFF
	bne _080CCC7A
	cmp r7, 0
	bne _080CCC34
	ldr r0, _080CCC24 @ =gStringVar2
	ldr r1, _080CCC28 @ =gMoveNames + 0x112A FRENZY PLANT
	bl StringCopy
	ldr r1, _080CCC2C @ =gSpecialVar_0x8005
	movs r0, 0xF
	strh r0, [r1]
	ldr r0, _080CCC30 @ =0x000002de
	b _080CCC6E
	.align 2, 0
_080CCC1C: .4byte gUnknown_83F6203
_080CCC20: .4byte gPlayerParty
_080CCC24: .4byte gStringVar2
_080CCC28: .4byte gMoveNames + 0x112A
_080CCC2C: .4byte gSpecialVar_0x8005
_080CCC30: .4byte 0x000002de
_080CCC34:
	cmp r7, 0x1
	bne _080CCC5C
	ldr r0, _080CCC4C @ =gStringVar2
	ldr r1, _080CCC50 @ =gMoveNames + 0xF97 BLAST BURN
	bl StringCopy
	ldr r1, _080CCC54 @ =gSpecialVar_0x8005
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, _080CCC58 @ =0x000002df
	b _080CCC6E
	.align 2, 0
_080CCC4C: .4byte gStringVar2
_080CCC50: .4byte gMoveNames + 0xF97
_080CCC54: .4byte gSpecialVar_0x8005
_080CCC58: .4byte 0x000002df
_080CCC5C:
	ldr r0, _080CCC80 @ =gStringVar2
	ldr r1, _080CCC84 @ =gMoveNames + 0xFA4 HYDRO CANNON
	bl StringCopy
	ldr r1, _080CCC88 @ =gSpecialVar_0x8005
	movs r0, 0x11
	strh r0, [r1]
	movs r0, 0xB8
	lsls r0, 2
_080CCC6E:
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCC8C
_080CCC7A:
	movs r0, 0
	b _080CCCE4
	.align 2, 0
_080CCC80: .4byte gStringVar2
_080CCC84: .4byte gMoveNames + 0xFA4
_080CCC88: .4byte gSpecialVar_0x8005
_080CCC8C:
	movs r0, 0x64
	mov r1, r8
	muls r1, r0
	ldr r0, _080CCCF0 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xD
	bl GetMonData
	cmp r0, 0
	beq _080CCCA8
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080CCCA8:
	adds r0, r4, 0
	movs r1, 0xE
	bl GetMonData
	cmp r0, 0
	beq _080CCCBA
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080CCCBA:
	adds r0, r4, 0
	movs r1, 0xF
	bl GetMonData
	cmp r0, 0
	beq _080CCCCC
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080CCCCC:
	adds r0, r4, 0
	movs r1, 0x10
	bl GetMonData
	cmp r0, 0
	beq _080CCCDE
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080CCCDE:
	ldr r0, _080CCCF4 @ =gSpecialVar_0x8006
	strh r6, [r0]
	movs r0, 0x1
_080CCCE4:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CCCF0: .4byte gPlayerParty
_080CCCF4: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80CCB94

	thumb_func_start sub_80CCCF8
sub_80CCCF8: @ 80CCCF8
	push {r4,lr}
	movs r4, 0
	ldr r0, _080CCD0C @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r0, 0xF
	bne _080CCD14
	ldr r0, _080CCD10 @ =0x000002de
	bl FlagSet
	b _080CCD2C
	.align 2, 0
_080CCD0C: .4byte gSpecialVar_0x8005
_080CCD10: .4byte 0x000002de
_080CCD14:
	cmp r0, 0x10
	bne _080CCD24
	ldr r0, _080CCD20 @ =0x000002df
	bl FlagSet
	b _080CCD2C
	.align 2, 0
_080CCD20: .4byte 0x000002df
_080CCD24:
	movs r0, 0xB8
	lsls r0, 2
	bl FlagSet
_080CCD2C:
	ldr r0, _080CCD74 @ =0x000002de
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCD40
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CCD40:
	ldr r0, _080CCD78 @ =0x000002df
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCD54
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CCD54:
	movs r0, 0xB8
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCD6A
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CCD6A:
	cmp r4, 0x3
	beq _080CCD7C
	movs r0, 0
	b _080CCD7E
	.align 2, 0
_080CCD74: .4byte 0x000002de
_080CCD78: .4byte 0x000002df
_080CCD7C:
	movs r0, 0x1
_080CCD7E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80CCCF8

	thumb_func_start sub_80CCD84
sub_80CCD84: @ 80CCD84
	push {lr}
	ldr r0, _080CCDB8 @ =0x000002e3
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CCDC8
	ldr r0, _080CCDBC @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldrh r1, [r2, 0x4]
	ldr r0, _080CCDC0 @ =0x00003d03
	cmp r1, r0
	bne _080CCDC8
	ldr r1, [r2]
	ldr r0, _080CCDC4 @ =0x00190018
	cmp r1, r0
	bne _080CCDC8
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080CCDC8
	movs r0, 0x1
	b _080CCDCA
	.align 2, 0
_080CCDB8: .4byte 0x000002e3
_080CCDBC: .4byte gSaveBlock1Ptr
_080CCDC0: .4byte 0x00003d03
_080CCDC4: .4byte 0x00190018
_080CCDC8:
	movs r0, 0
_080CCDCA:
	pop {r1}
	bx r1
	thumb_func_end sub_80CCD84

	thumb_func_start sub_80CCDD0
sub_80CCDD0: @ 80CCDD0
	push {lr}
	movs r2, 0xD6
	lsls r2, 2
	movs r0, 0x1F
	movs r1, 0x1F
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySE
	ldr r0, _080CCDF8 @ =0x000002e3
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_080CCDF8: .4byte 0x000002e3
	thumb_func_end sub_80CCDD0

	thumb_func_start sub_80CCDFC
sub_80CCDFC: @ 80CCDFC
	push {lr}
	ldr r0, _080CCE0C @ =task_deoxys_sound
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080CCE0C: .4byte task_deoxys_sound
	thumb_func_end sub_80CCDFC

	thumb_func_start task_deoxys_sound
task_deoxys_sound: @ 80CCE10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080CCE30 @ =0x00000848
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCE38
	ldr r1, _080CCE34 @ =gSpecialVar_Result
	movs r0, 0x3
	b _080CCE9E
	.align 2, 0
_080CCE30: .4byte 0x00000848
_080CCE34: .4byte gSpecialVar_Result
_080CCE38:
	ldr r0, _080CCE80 @ =0x0000403e
	mov r8, r0
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r4, _080CCE84 @ =0x00004026
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl VarSet
	cmp r5, 0
	beq _080CCE90
	ldr r0, _080CCE88 @ =gUnknown_83F637C
	subs r1, r5, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, r6
	bcs _080CCE90
	movs r0, 0
	bl sub_80CCEE8
	mov r0, r8
	movs r1, 0
	bl VarSet
	ldr r1, _080CCE8C @ =gSpecialVar_Result
	movs r0, 0
	strh r0, [r1]
	b _080CCEA4
	.align 2, 0
_080CCE80: .4byte 0x0000403e
_080CCE84: .4byte 0x00004026
_080CCE88: .4byte gUnknown_83F637C
_080CCE8C: .4byte gSpecialVar_Result
_080CCE90:
	cmp r5, 0xA
	bne _080CCEB4
	ldr r0, _080CCEAC @ =0x00000848
	bl FlagSet
	ldr r1, _080CCEB0 @ =gSpecialVar_Result
	movs r0, 0x2
_080CCE9E:
	strh r0, [r1]
	bl EnableBothScriptContexts
_080CCEA4:
	adds r0, r7, 0
	bl DestroyTask
	b _080CCED6
	.align 2, 0
_080CCEAC: .4byte 0x00000848
_080CCEB0: .4byte gSpecialVar_Result
_080CCEB4:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80CCEE8
	ldr r0, _080CCEE0 @ =0x0000403e
	adds r1, r5, 0
	bl VarSet
	ldr r1, _080CCEE4 @ =gSpecialVar_Result
	movs r0, 0x1
	strh r0, [r1]
	adds r0, r7, 0
	bl DestroyTask
_080CCED6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CCEE0: .4byte 0x0000403e
_080CCEE4: .4byte gSpecialVar_Result
	thumb_func_end task_deoxys_sound

	thumb_func_start sub_80CCEE8
sub_80CCEE8: @ 80CCEE8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 5
	ldr r1, _080CCF24 @ =gUnknown_83F6206
	adds r0, r1
	movs r1, 0xD0
	lsls r1, 1
	movs r2, 0x8
	bl LoadPalette
	movs r0, 0xA
	bl sub_8083598
	ldr r0, _080CCF28 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x1
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	cmp r4, 0
	bne _080CCF2C
	movs r0, 0xBD
	bl PlaySE
	b _080CCF32
	.align 2, 0
_080CCF24: .4byte gUnknown_83F6206
_080CCF28: .4byte gSaveBlock1Ptr
_080CCF2C:
	movs r0, 0xFD
	bl PlaySE
_080CCF32:
	ldr r0, _080CCF64 @ =sub_80CCF98
	movs r1, 0x8
	bl CreateTask
	ldr r3, _080CCF68 @ =gFieldEffectArguments
	movs r0, 0x1
	str r0, [r3]
	movs r0, 0x38
	str r0, [r3, 0x4]
	movs r0, 0x2
	str r0, [r3, 0x8]
	ldr r0, _080CCF6C @ =gUnknown_83F6366
	lsls r2, r4, 1
	adds r1, r2, r0
	ldrb r1, [r1]
	str r1, [r3, 0xC]
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	str r0, [r3, 0x10]
	adds r5, r2, 0
	cmp r4, 0
	bne _080CCF70
	movs r0, 0x3C
	b _080CCF72
	.align 2, 0
_080CCF64: .4byte sub_80CCF98
_080CCF68: .4byte gFieldEffectArguments
_080CCF6C: .4byte gUnknown_83F6366
_080CCF70:
	movs r0, 0x5
_080CCF72:
	str r0, [r3, 0x14]
	movs r0, 0x43
	bl FieldEffectStart
	ldr r0, _080CCF94 @ =gUnknown_83F6366
	adds r1, r5, r0
	ldrb r1, [r1]
	adds r0, 0x1
	adds r0, r5, r0
	ldrb r2, [r0]
	movs r0, 0x1
	bl Overworld_SetMapObjTemplateCoords
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCF94: .4byte gUnknown_83F6366
	thumb_func_end sub_80CCEE8

	thumb_func_start sub_80CCF98
sub_80CCF98: @ 80CCF98
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x43
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080CCFB4
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_080CCFB4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CCF98

	thumb_func_start sub_80CCFBC
sub_80CCFBC: @ 80CCFBC
	push {r4,lr}
	ldr r4, _080CCFEC @ =0x00004026
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080CCFF0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CCFF4 @ =0x00003802 MAP_BIRTH_ISLAND_EXTERIOR
	cmp r1, r0
	bne _080CD000
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x63
	bls _080CCFF8
	adds r0, r4, 0
	movs r1, 0
	bl VarSet
	b _080CD000
	.align 2, 0
_080CCFEC: .4byte 0x00004026
_080CCFF0: .4byte gSaveBlock1Ptr
_080CCFF4: .4byte 0x00003802
_080CCFF8:
	adds r0, r4, 0
	adds r1, r2, 0
	bl VarSet
_080CD000:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CCFBC

	thumb_func_start sub_80CD008
sub_80CD008: @ 80CD008
	push {lr}
	ldr r0, _080CD02C @ =0x0000403e
	bl VarGet
	lsls r0, 24
	lsrs r0, 19
	ldr r1, _080CD030 @ =gUnknown_83F6206
	adds r0, r1
	movs r1, 0xD0
	lsls r1, 1
	movs r2, 0x8
	bl LoadPalette
	movs r0, 0xA
	bl sub_8083598
	pop {r0}
	bx r0
	.align 2, 0
_080CD02C: .4byte 0x0000403e
_080CD030: .4byte gUnknown_83F6206
	thumb_func_end sub_80CD008

	thumb_func_start sub_80CD034
sub_80CD034: @ 80CD034
	push {r4,r5,lr}
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _080CD06A
_080CD044:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080CD05C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x4
	bl GetMonData
	cmp r0, 0x1
	bne _080CD060
	movs r0, 0x1
	b _080CD06C
	.align 2, 0
_080CD05C: .4byte gPlayerParty
_080CD060:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _080CD044
_080CD06A:
	movs r0, 0
_080CD06C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80CD034

	thumb_func_start sub_80CD074
sub_80CD074: @ 80CD074
	push {lr}
	ldr r0, _080CD088 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CD08C @ =0x00000a02
	cmp r1, r0
	beq _080CD090
	movs r0, 0x1
	b _080CD092
	.align 2, 0
_080CD088: .4byte gSaveBlock1Ptr
_080CD08C: .4byte 0x00000a02
_080CD090:
	movs r0, 0
_080CD092:
	pop {r1}
	bx r1
	thumb_func_end sub_80CD074

	thumb_func_start sub_80CD098
sub_80CD098: @ 80CD098
	push {lr}
	sub sp, 0x4
	ldr r0, _080CD0CC @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080CD0E8
	ldr r0, _080CD0D0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r0, 0x1B
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080CD0D4 @ =gSpecialVar_0x8006
	ldrh r3, [r0]
	cmp r3, 0
	bne _080CD0E0
	ldr r0, _080CD0D8 @ =gSpecialVar_0x8005
	ldrh r2, [r0]
	str r3, [sp]
	movs r0, 0
	movs r3, 0
	bl CreateTextCursorSpriteForOakSpeech
	ldr r1, _080CD0DC @ =gUnknown_2039A1B
	strb r0, [r1]
	b _080CD0E8
	.align 2, 0
_080CD0CC: .4byte gUnknown_203ADFA
_080CD0D0: .4byte gSpecialVar_0x8004
_080CD0D4: .4byte gSpecialVar_0x8006
_080CD0D8: .4byte gSpecialVar_0x8005
_080CD0DC: .4byte gUnknown_2039A1B
_080CD0E0:
	ldr r0, _080CD0F0 @ =gUnknown_2039A1B
	ldrb r0, [r0]
	bl sub_8006398
_080CD0E8:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080CD0F0: .4byte gUnknown_2039A1B
	thumb_func_end sub_80CD098

	thumb_func_start sub_80CD0F4
sub_80CD0F4: @ 80CD0F4
	push {r4-r7,lr}
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcs _080CD14A
_080CD104:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _080CD138 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	ldr r1, _080CD13C @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	cmp r0, r1
	bne _080CD140
	bl GetPlayerTrainerId
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bne _080CD140
	movs r0, 0x1
	b _080CD14C
	.align 2, 0
_080CD138: .4byte gPlayerParty
_080CD13C: .4byte gSpecialVar_0x8004
_080CD140:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _080CD104
_080CD14A:
	movs r0, 0
_080CD14C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80CD0F4

	@ Determines which of Lorelei's doll collection to show
	@ based on how many times you've entered the Hall of Fame.
	thumb_func_start Special_ComputeLoreleiDollCollection
Special_ComputeLoreleiDollCollection: @ 80CD154
	push {r4,lr}
	movs r0, 0xA
	bl GetGameStat
	adds r4, r0, 0
	cmp r4, 0x18
	bls _080CD1AE
	movs r0, 0xA5
	bl FlagClear
	cmp r4, 0x31
	bls _080CD172
	movs r0, 0xA6
	bl FlagClear
_080CD172:
	cmp r4, 0x4A
	bls _080CD17C
	movs r0, 0xA7
	bl FlagClear
_080CD17C:
	cmp r4, 0x63
	bls _080CD186
	movs r0, 0xA8
	bl FlagClear
_080CD186:
	cmp r4, 0x7C
	bls _080CD190
	movs r0, 0xA9
	bl FlagClear
_080CD190:
	cmp r4, 0x95
	bls _080CD19A
	movs r0, 0xAA
	bl FlagClear
_080CD19A:
	cmp r4, 0xAE
	bls _080CD1A4
	movs r0, 0xAB
	bl FlagClear
_080CD1A4:
	cmp r4, 0xC7
	bls _080CD1AE
	movs r0, 0xAC
	bl FlagClear
_080CD1AE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Special_ComputeLoreleiDollCollection

	thumb_func_start sub_80CD1B4
sub_80CD1B4: @ 80CD1B4
	push {lr}
	ldr r0, _080CD1C8 @ =sub_80CD1CC
	movs r1, 0x8
	bl CreateTask
	movs r0, 0x96
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_080CD1C8: .4byte sub_80CD1CC
	thumb_func_end sub_80CD1B4

	thumb_func_start sub_80CD1CC
sub_80CD1CC: @ 80CD1CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CD21C @ =gTasks+0x8
	adds r4, r0, r1
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	ldr r0, _080CD220 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	cmp r1, r0
	bne _080CD200
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x96
	bl PlaySE
_080CD200:
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r0, _080CD224 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _080CD214
	adds r0, r5, 0
	bl DestroyTask
_080CD214:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD21C: .4byte gTasks+0x8
_080CD220: .4byte gSpecialVar_0x8005
_080CD224: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80CD1CC

	.align 2, 0 @ Don't pad with nop.
