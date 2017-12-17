	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80E5684
sub_80E5684: @ 80E5684
	push {r4-r6,lr}
	bl sub_811FB0C
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0x64
	muls r0, r6
	ldr r4, _080E56D0 @ =gUnknown_2024284
	adds r0, r4
	movs r1, 0x3A
	bl sub_803FBE8
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	bl sub_811FB0C
	lsls r0, 24
	lsrs r0, 24
	muls r0, r6
	adds r0, r4
	movs r1, 0x39
	bl sub_803FBE8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bhi _080E56D4
	movs r0, 0
	b _080E56D6
	.align 2, 0
_080E56D0: .4byte gUnknown_2024284
_080E56D4:
	movs r0, 0x1
_080E56D6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5684

	thumb_func_start sub_80E56DC
sub_80E56DC: @ 80E56DC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E5718 @ =gUnknown_203B0A0
	movs r1, 0xA
	strb r1, [r0, 0xB]
	ldrb r1, [r0, 0x9]
	strb r1, [r0, 0xA]
	bl sub_811FB0C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_811F818
	movs r0, 0x5
	bl sub_8121D0C
	ldr r1, _080E571C @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080E5720 @ =sub_811FB28
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5718: .4byte gUnknown_203B0A0
_080E571C: .4byte gUnknown_3005090
_080E5720: .4byte sub_811FB28
	thumb_func_end sub_80E56DC

	thumb_func_start sub_80E5724
sub_80E5724: @ 80E5724
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	str r4, [sp, 0x4]
	ldr r1, _080E575C @ =gUnknown_203B0A0
	ldrb r7, [r1, 0x9]
	mov r8, r7
	ldrb r0, [r1, 0xA]
	adds r5, r0, 0
	cmp r5, 0x6
	bls _080E5768
	movs r0, 0
	strb r0, [r1, 0xB]
	bl sub_8121D0C
	ldr r1, _080E5760 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080E5764 @ =sub_811FB28
	str r1, [r0]
	b _080E57D4
	.align 2, 0
_080E575C: .4byte gUnknown_203B0A0
_080E5760: .4byte gUnknown_3005090
_080E5764: .4byte sub_811FB28
_080E5768:
	movs r0, 0x64
	mov r10, r0
	mov r0, r10
	muls r0, r5
	ldr r1, _080E57A0 @ =gUnknown_2024284
	mov r9, r1
	adds r6, r0, r1
	adds r0, r6, 0
	movs r1, 0x39
	bl sub_803FBE8
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080E5796
	cmp r7, r5
	beq _080E5796
	adds r0, r6, 0
	movs r1, 0x3A
	bl sub_803FBE8
	cmp r0, r4
	bne _080E57A4
_080E5796:
	ldr r0, [sp, 0x4]
	bl sub_80E5934
	b _080E57D4
	.align 2, 0
_080E57A0: .4byte gUnknown_2024284
_080E57A4:
	movs r0, 0x1
	bl sub_80722CC
	mov r1, r10
	mov r0, r8
	muls r0, r1
	add r0, r9
	movs r1, 0x3A
	bl sub_803FBE8
	movs r1, 0x5
	bl __udivsi3
	adds r3, r0, 0
	lsls r3, 16
	asrs r3, 16
	movs r2, 0x1
	negs r2, r2
	ldr r0, _080E57E4 @ =sub_80E57E8
	str r0, [sp]
	ldr r0, [sp, 0x4]
	mov r1, r8
	bl sub_8120760
_080E57D4:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E57E4: .4byte sub_80E57E8
	thumb_func_end sub_80E5724

	thumb_func_start sub_80E57E8
sub_80E57E8: @ 80E57E8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_80722CC
	ldr r5, _080E5830 @ =gUnknown_203B0A0
	movs r1, 0x9
	ldrsb r1, [r5, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E5834 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x3A
	bl sub_803FBE8
	movs r1, 0x5
	bl __udivsi3
	adds r3, r0, 0
	lsls r3, 16
	asrs r3, 16
	ldrb r1, [r5, 0xA]
	ldr r0, _080E5838 @ =sub_80E583C
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8120760
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5830: .4byte gUnknown_203B0A0
_080E5834: .4byte gUnknown_2024284
_080E5838: .4byte sub_80E583C
	thumb_func_end sub_80E57E8

	thumb_func_start sub_80E583C
sub_80E583C: @ 80E583C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080E5884 @ =gUnknown_203B0A0
	movs r1, 0xA
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E5888 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _080E588C @ =gUnknown_2021CD0
	bl sub_81202E0
	ldr r4, _080E5890 @ =gUnknown_2021D18
	ldr r1, _080E5894 @ =gUnknown_8416F27
	adds r0, r4, 0
	bl sub_8008FCC
	adds r0, r4, 0
	movs r1, 0
	bl sub_81202F8
	movs r0, 0x2
	bl sub_80F67A4
	ldr r1, _080E5898 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080E589C @ =sub_80E58A0
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5884: .4byte gUnknown_203B0A0
_080E5888: .4byte gUnknown_2024284
_080E588C: .4byte gUnknown_2021CD0
_080E5890: .4byte gUnknown_2021D18
_080E5894: .4byte gUnknown_8416F27
_080E5898: .4byte gUnknown_3005090
_080E589C: .4byte sub_80E58A0
	thumb_func_end sub_80E583C

	thumb_func_start sub_80E58A0
sub_80E58A0: @ 80E58A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080E58EE
	ldr r4, _080E58F4 @ =gUnknown_203B0A0
	movs r0, 0
	strb r0, [r4, 0xB]
	ldrb r0, [r4, 0x9]
	movs r1, 0
	bl sub_811F818
	ldrb r0, [r4, 0xA]
	strb r0, [r4, 0x9]
	ldrb r0, [r4, 0xA]
	movs r1, 0x1
	bl sub_811F818
	movs r0, 0x6
	movs r1, 0
	bl sub_810F4D8
	movs r0, 0x6
	bl sub_80040B8
	movs r0, 0
	bl sub_8121D0C
	ldr r1, _080E58F8 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080E58FC @ =sub_811FB28
	str r1, [r0]
_080E58EE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E58F4: .4byte gUnknown_203B0A0
_080E58F8: .4byte gUnknown_3005090
_080E58FC: .4byte sub_811FB28
	thumb_func_end sub_80E58A0

	thumb_func_start sub_80E5900
sub_80E5900: @ 80E5900
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8120370
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080E5926
	movs r0, 0x5
	bl sub_8121D0C
	ldr r0, _080E592C @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080E5930 @ =sub_811FB28
	str r0, [r1]
_080E5926:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E592C: .4byte gUnknown_3005090
_080E5930: .4byte sub_811FB28
	thumb_func_end sub_80E5900

	thumb_func_start sub_80E5934
sub_80E5934: @ 80E5934
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _080E5964 @ =gUnknown_84169F8
	movs r1, 0
	bl sub_81202F8
	movs r0, 0x2
	bl sub_80F67A4
	ldr r1, _080E5968 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080E596C @ =sub_80E5900
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5964: .4byte gUnknown_84169F8
_080E5968: .4byte gUnknown_3005090
_080E596C: .4byte sub_80E5900
	thumb_func_end sub_80E5934

	.align 2, 0 @ Don't pad with nop.
