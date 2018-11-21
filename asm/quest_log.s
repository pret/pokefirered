	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
