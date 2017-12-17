	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_13
nullsub_13: @ 802E310
	bx lr
	thumb_func_end nullsub_13

	thumb_func_start sub_802E314
sub_802E314: @ 802E314
	ldr r1, _0802E32C @ =gUnknown_3004FE0
	ldr r0, _0802E330 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802E334 @ =sub_802E3B4
	str r1, [r0]
	ldr r1, _0802E338 @ =gUnknown_2024005
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802E32C: .4byte gUnknown_3004FE0
_0802E330: .4byte gUnknown_2023BC4
_0802E334: .4byte sub_802E3B4
_0802E338: .4byte gUnknown_2024005
	thumb_func_end sub_802E314

	thumb_func_start sub_802E33C
sub_802E33C: @ 802E33C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0802E37C @ =gUnknown_3004FE0
	ldr r4, _0802E380 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802E384 @ =sub_802E3B4
	str r1, [r0]
	ldr r0, _0802E388 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802E390
	bl sub_800A404
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl sub_800D9EC
	ldr r1, _0802E38C @ =gUnknown_2022BC4
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0802E3A2
	.align 2, 0
_0802E37C: .4byte gUnknown_3004FE0
_0802E380: .4byte gUnknown_2023BC4
_0802E384: .4byte sub_802E3B4
_0802E388: .4byte gUnknown_2022B4C
_0802E38C: .4byte gUnknown_2022BC4
_0802E390:
	ldr r2, _0802E3AC @ =gUnknown_2023BC8
	ldr r1, _0802E3B0 @ =gUnknown_825E45C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0802E3A2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E3AC: .4byte gUnknown_2023BC8
_0802E3B0: .4byte gUnknown_825E45C
	thumb_func_end sub_802E33C

	thumb_func_start sub_802E3B4
sub_802E3B4: @ 802E3B4
	push {lr}
	ldr r2, _0802E3E8 @ =gUnknown_2023BC8
	ldr r1, _0802E3EC @ =gUnknown_825E45C
	ldr r0, _0802E3F0 @ =gUnknown_2023BC4
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0802E400
	ldr r0, _0802E3F4 @ =gUnknown_2022BC4
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0802E3FC
	ldr r0, _0802E3F8 @ =gUnknown_825089C
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0802E400
	.align 2, 0
_0802E3E8: .4byte gUnknown_2023BC8
_0802E3EC: .4byte gUnknown_825E45C
_0802E3F0: .4byte gUnknown_2023BC4
_0802E3F4: .4byte gUnknown_2022BC4
_0802E3F8: .4byte gUnknown_825089C
_0802E3FC:
	bl sub_802E33C
_0802E400:
	pop {r0}
	bx r0
	thumb_func_end sub_802E3B4

	thumb_func_start sub_802E404
sub_802E404: @ 802E404
	push {lr}
	ldr r2, _0802E42C @ =gUnknown_202063C
	ldr r1, _0802E430 @ =gUnknown_2023D44
	ldr r0, _0802E434 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0802E426
	bl sub_802E33C
_0802E426:
	pop {r0}
	bx r0
	.align 2, 0
_0802E42C: .4byte gUnknown_202063C
_0802E430: .4byte gUnknown_2023D44
_0802E434: .4byte gUnknown_2023BC4
	thumb_func_end sub_802E404

	thumb_func_start sub_802E438
sub_802E438: @ 802E438
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _0802E498 @ =gUnknown_2022BC4
	ldr r4, _0802E49C @ =gUnknown_2023BC4
	ldrb r0, [r4]
	lsls r2, r0, 9
	adds r1, r7, 0x2
	adds r1, r2, r1
	ldrb r5, [r1]
	adds r1, r7, 0x3
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r5, r1
	movs r1, 0x1
	movs r2, 0x7
	movs r3, 0x1
	bl sub_8012138
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0x7
	movs r3, 0x1
	bl sub_8012138
	ldr r0, _0802E4A0 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0802E4D0
	movs r0, 0x5
	bl sub_80722CC
	ldr r1, _0802E4A4 @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0802E4B8
	cmp r0, 0x1
	bgt _0802E4A8
	cmp r0, 0
	beq _0802E4B2
	b _0802E616
	.align 2, 0
_0802E498: .4byte gUnknown_2022BC4
_0802E49C: .4byte gUnknown_2023BC4
_0802E4A0: .4byte gUnknown_30030F0
_0802E4A4: .4byte gUnknown_2023FF8
_0802E4A8:
	cmp r0, 0x2
	beq _0802E4BE
	cmp r0, 0x3
	beq _0802E4C4
	b _0802E616
_0802E4B2:
	movs r0, 0x1
	movs r1, 0
	b _0802E610
_0802E4B8:
	movs r0, 0x1
	movs r1, 0x1
	b _0802E610
_0802E4BE:
	movs r0, 0x1
	movs r1, 0x2
	b _0802E610
_0802E4C4:
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl sub_800E848
	b _0802E616
_0802E4D0:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0802E508
	ldr r5, _0802E504 @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0802E4EA
	b _0802E634
_0802E4EA:
	movs r0, 0x5
	bl sub_80722CC
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8030A98
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0802E590
	.align 2, 0
_0802E504: .4byte gUnknown_2023FF8
_0802E508:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802E540
	ldr r5, _0802E53C @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0802E522
	b _0802E634
_0802E522:
	movs r0, 0x5
	bl sub_80722CC
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8030A98
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0802E590
	.align 2, 0
_0802E53C: .4byte gUnknown_2023FF8
_0802E540:
	movs r0, 0x40
	mov r8, r0
	ands r0, r1
	cmp r0, 0
	beq _0802E560
	ldr r5, _0802E55C @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802E634
	b _0802E578
	.align 2, 0
_0802E55C: .4byte gUnknown_2023FF8
_0802E560:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802E5A8
	ldr r5, _0802E5A4 @ =gUnknown_2023FF8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0802E634
_0802E578:
	movs r0, 0x5
	bl sub_80722CC
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8030A98
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
_0802E590:
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8030A54
	b _0802E634
	.align 2, 0
_0802E5A4: .4byte gUnknown_2023FF8
_0802E5A8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802E628
	ldr r6, _0802E61C @ =gUnknown_2022B4C
	ldr r0, [r6]
	ands r0, r2
	cmp r0, 0
	beq _0802E634
	ldrb r0, [r4]
	bl sub_80751D8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0802E634
	movs r0, 0
	bl sub_80751E8
	ldr r1, _0802E620 @ =gUnknown_2023D70
	ldrb r1, [r1]
	ldr r2, _0802E624 @ =gUnknown_825E45C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802E634
	ldr r0, [r6]
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _0802E634
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, r7, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0802E606
	cmp r5, 0xC
	bhi _0802E634
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_809A084
_0802E606:
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x1
	movs r1, 0xC
_0802E610:
	movs r2, 0
	bl sub_800E848
_0802E616:
	bl sub_802E33C
	b _0802E634
	.align 2, 0
_0802E61C: .4byte gUnknown_2022B4C
_0802E620: .4byte gUnknown_2023D70
_0802E624: .4byte gUnknown_825E45C
_0802E628:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0802E634
	bl sub_8048A4C
_0802E634:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_802E438

	thumb_func_start sub_802E640
sub_802E640: @ 802E640
	push {r4,lr}
	ldr r4, _0802E668 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8012258
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8012258
	ldr r1, _0802E66C @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802E670 @ =sub_802E674
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E668: .4byte gUnknown_2023BC4
_0802E66C: .4byte gUnknown_3004FE0
_0802E670: .4byte sub_802E674
	thumb_func_end sub_802E640

	thumb_func_start sub_802E674
sub_802E674: @ 802E674
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _0802E708 @ =gUnknown_8250980
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldr r0, _0802E70C @ =gUnknown_3004FF4
	ldrb r0, [r0]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8012138
	movs r4, 0
	ldr r0, _0802E710 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802E6B6
_0802E69A:
	ldr r0, _0802E70C @ =gUnknown_3004FF4
	ldrb r0, [r0]
	cmp r4, r0
	beq _0802E6AC
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_8012258
_0802E6AC:
	adds r4, 0x1
	ldr r0, _0802E710 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r4, r0
	blt _0802E69A
_0802E6B6:
	ldr r0, _0802E714 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802E72C
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _0802E718 @ =gUnknown_202063C
	ldr r1, _0802E71C @ =gUnknown_2023D44
	ldr r4, _0802E70C @ =gUnknown_3004FF4
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802E720 @ =sub_8012098
	str r1, [r0]
	ldr r1, _0802E724 @ =gUnknown_2023FFC
	ldr r0, _0802E728 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldrb r0, [r4]
	lsls r0, 8
	orrs r2, r0
	movs r0, 0x1
	movs r1, 0xA
	bl sub_800E848
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8012258
	bl sub_802E33C
	b _0802E9DC
	.align 2, 0
_0802E708: .4byte gUnknown_8250980
_0802E70C: .4byte gUnknown_3004FF4
_0802E710: .4byte gUnknown_2023BCC
_0802E714: .4byte gUnknown_30030F0
_0802E718: .4byte gUnknown_202063C
_0802E71C: .4byte gUnknown_2023D44
_0802E720: .4byte sub_8012098
_0802E724: .4byte gUnknown_2023FFC
_0802E728: .4byte gUnknown_2023BC4
_0802E72C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802E7A0
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _0802E784 @ =gUnknown_202063C
	ldr r1, _0802E788 @ =gUnknown_2023D44
	ldr r5, _0802E78C @ =gUnknown_3004FF4
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802E790 @ =sub_8012098
	str r1, [r0]
	ldr r1, _0802E794 @ =gUnknown_3004FE0
	ldr r4, _0802E798 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802E79C @ =sub_802EA10
	str r1, [r0]
	ldrb r0, [r4]
	movs r1, 0x1
	movs r2, 0x7
	movs r3, 0x1
	bl sub_8012138
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0x7
	movs r3, 0x1
	bl sub_8012138
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8012258
	b _0802E9DC
	.align 2, 0
_0802E784: .4byte gUnknown_202063C
_0802E788: .4byte gUnknown_2023D44
_0802E78C: .4byte gUnknown_3004FF4
_0802E790: .4byte sub_8012098
_0802E794: .4byte gUnknown_3004FE0
_0802E798: .4byte gUnknown_2023BC4
_0802E79C: .4byte sub_802EA10
_0802E7A0:
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	bne _0802E7AA
	b _0802E8C4
_0802E7AA:
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _0802E7DC @ =gUnknown_202063C
	ldr r1, _0802E7E0 @ =gUnknown_2023D44
	ldr r3, _0802E7E4 @ =gUnknown_3004FF4
	ldrb r0, [r3]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802E7E8 @ =sub_8012098
	str r1, [r0]
	adds r5, r3, 0
_0802E7CC:
	ldrb r0, [r5]
	bl sub_80751D8
	lsls r0, 24
	lsrs r1, r0, 24
	movs r4, 0
	mov r0, sp
	b _0802E7F6
	.align 2, 0
_0802E7DC: .4byte gUnknown_202063C
_0802E7E0: .4byte gUnknown_2023D44
_0802E7E4: .4byte gUnknown_3004FF4
_0802E7E8: .4byte sub_8012098
_0802E7EC:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _0802E7FC
	mov r2, sp
	adds r0, r2, r4
_0802E7F6:
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802E7EC
_0802E7FC:
	subs r4, 0x1
	cmp r4, 0
	bge _0802E804
	movs r4, 0x4
_0802E804:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl sub_80751E8
	strb r0, [r5]
	ldr r1, _0802E838 @ =gUnknown_2023BCC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	beq _0802E7FC
	movs r4, 0
	ldrb r0, [r5]
	bl sub_80751D8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0802E882
	cmp r0, 0x1
	bgt _0802E83C
	cmp r0, 0
	beq _0802E846
	b _0802E884
	.align 2, 0
_0802E838: .4byte gUnknown_2023BCC
_0802E83C:
	cmp r0, 0x2
	beq _0802E846
	cmp r0, 0x3
	beq _0802E882
	b _0802E884
_0802E846:
	ldr r2, _0802E8A4 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	ldrb r1, [r5]
	cmp r0, r1
	bne _0802E882
	ldr r1, _0802E8A8 @ =gUnknown_2023BCE
	ldrb r2, [r2]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802E8AC @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _0802E8B0 @ =gUnknown_2023FFC
	adds r2, r1
	ldrb r1, [r2]
	adds r1, 0xD
	bl sub_803FBE8
	ldr r2, _0802E8B4 @ =gUnknown_8250C04
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x6]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802E884
_0802E882:
	adds r4, 0x1
_0802E884:
	ldr r0, _0802E8B8 @ =gUnknown_2023D70
	ldrb r1, [r0]
	ldr r2, _0802E8BC @ =gUnknown_825E45C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _0802E8C0 @ =gUnknown_3004FF4
	cmp r1, 0
	beq _0802E89C
	movs r4, 0
_0802E89C:
	cmp r4, 0
	beq _0802E7CC
	b _0802E9C4
	.align 2, 0
_0802E8A4: .4byte gUnknown_2023BC4
_0802E8A8: .4byte gUnknown_2023BCE
_0802E8AC: .4byte gUnknown_2024284
_0802E8B0: .4byte gUnknown_2023FFC
_0802E8B4: .4byte gUnknown_8250C04
_0802E8B8: .4byte gUnknown_2023D70
_0802E8BC: .4byte gUnknown_825E45C
_0802E8C0: .4byte gUnknown_3004FF4
_0802E8C4:
	movs r0, 0x90
	ands r0, r1
	cmp r0, 0
	bne _0802E8CE
	b _0802E9DC
_0802E8CE:
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _0802E900 @ =gUnknown_202063C
	ldr r1, _0802E904 @ =gUnknown_2023D44
	ldr r3, _0802E908 @ =gUnknown_3004FF4
	ldrb r0, [r3]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802E90C @ =sub_8012098
	str r1, [r0]
	adds r5, r3, 0
_0802E8F0:
	ldrb r0, [r5]
	bl sub_80751D8
	lsls r0, 24
	lsrs r1, r0, 24
	movs r4, 0
	mov r0, sp
	b _0802E91A
	.align 2, 0
_0802E900: .4byte gUnknown_202063C
_0802E904: .4byte gUnknown_2023D44
_0802E908: .4byte gUnknown_3004FF4
_0802E90C: .4byte sub_8012098
_0802E910:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _0802E920
	mov r2, sp
	adds r0, r2, r4
_0802E91A:
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802E910
_0802E920:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0802E928
	movs r4, 0
_0802E928:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl sub_80751E8
	strb r0, [r5]
	ldr r1, _0802E95C @ =gUnknown_2023BCC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	beq _0802E920
	movs r4, 0
	ldrb r0, [r5]
	bl sub_80751D8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0802E9A6
	cmp r0, 0x1
	bgt _0802E960
	cmp r0, 0
	beq _0802E96A
	b _0802E9A8
	.align 2, 0
_0802E95C: .4byte gUnknown_2023BCC
_0802E960:
	cmp r0, 0x2
	beq _0802E96A
	cmp r0, 0x3
	beq _0802E9A6
	b _0802E9A8
_0802E96A:
	ldr r2, _0802E9E4 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	ldrb r1, [r5]
	cmp r0, r1
	bne _0802E9A6
	ldr r1, _0802E9E8 @ =gUnknown_2023BCE
	ldrb r2, [r2]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802E9EC @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _0802E9F0 @ =gUnknown_2023FFC
	adds r2, r1
	ldrb r1, [r2]
	adds r1, 0xD
	bl sub_803FBE8
	ldr r2, _0802E9F4 @ =gUnknown_8250C04
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x6]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802E9A8
_0802E9A6:
	adds r4, 0x1
_0802E9A8:
	ldr r0, _0802E9F8 @ =gUnknown_2023D70
	ldrb r1, [r0]
	ldr r2, _0802E9FC @ =gUnknown_825E45C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _0802EA00 @ =gUnknown_3004FF4
	cmp r1, 0
	beq _0802E9C0
	movs r4, 0
_0802E9C0:
	cmp r4, 0
	beq _0802E8F0
_0802E9C4:
	ldr r2, _0802EA04 @ =gUnknown_202063C
	ldr r1, _0802EA08 @ =gUnknown_2023D44
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802EA0C @ =sub_8012044
	str r1, [r0]
_0802E9DC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E9E4: .4byte gUnknown_2023BC4
_0802E9E8: .4byte gUnknown_2023BCE
_0802E9EC: .4byte gUnknown_2024284
_0802E9F0: .4byte gUnknown_2023FFC
_0802E9F4: .4byte gUnknown_8250C04
_0802E9F8: .4byte gUnknown_2023D70
_0802E9FC: .4byte gUnknown_825E45C
_0802EA00: .4byte gUnknown_3004FF4
_0802EA04: .4byte gUnknown_202063C
_0802EA08: .4byte gUnknown_2023D44
_0802EA0C: .4byte sub_8012044
	thumb_func_end sub_802E674

	thumb_func_start sub_802EA10
sub_802EA10: @ 802EA10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	ldr r6, _0802EA6C @ =gUnknown_2023BC4
	ldrb r0, [r6]
	lsls r0, 9
	ldr r1, _0802EA70 @ =gUnknown_2022BC8
	adds r7, r0, r1
	bl sub_8033AC8
	ldr r0, _0802EA74 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0802EA3A
	b _0802EC10
_0802EA3A:
	movs r0, 0x5
	bl sub_80722CC
	ldr r1, _0802EA78 @ =gUnknown_2023FFC
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, r7, r0
	ldrh r0, [r1]
	cmp r0, 0xAE
	bne _0802EA7C
	ldrb r0, [r7, 0x12]
	movs r4, 0
	cmp r0, 0x7
	beq _0802EA8A
	ldrb r1, [r7, 0x13]
	movs r0, 0x7
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	asrs r4, r0, 31
	movs r0, 0x10
	ands r4, r0
	b _0802EA8A
	.align 2, 0
_0802EA6C: .4byte gUnknown_2023BC4
_0802EA70: .4byte gUnknown_2022BC8
_0802EA74: .4byte gUnknown_30030F0
_0802EA78: .4byte gUnknown_2023FFC
_0802EA7C:
	ldr r2, _0802EA9C @ =gUnknown_8250C04
	ldrh r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r4, [r0, 0x6]
_0802EA8A:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _0802EAA8
	ldr r0, _0802EAA0 @ =gUnknown_3004FF4
	ldr r1, _0802EAA4 @ =gUnknown_2023BC4
	ldrb r1, [r1]
	strb r1, [r0]
	b _0802EAC2
	.align 2, 0
_0802EA9C: .4byte gUnknown_8250C04
_0802EAA0: .4byte gUnknown_3004FF4
_0802EAA4: .4byte gUnknown_2023BC4
_0802EAA8:
	ldr r0, _0802EAEC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl sub_80751D8
	adds r1, r0, 0
	movs r2, 0x1
	movs r0, 0x1
	ands r0, r1
	eors r0, r2
	bl sub_80751E8
	ldr r1, _0802EAF0 @ =gUnknown_3004FF4
	strb r0, [r1]
_0802EAC2:
	ldr r3, _0802EAF4 @ =gUnknown_2022BC4
	ldr r5, _0802EAEC @ =gUnknown_2023BC4
	ldrb r2, [r5]
	lsls r1, r2, 9
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802EAF8
	movs r0, 0x2
	ands r0, r4
	cmp r0, 0
	beq _0802EB3A
	adds r0, r3, 0x2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802EB3A
	movs r0, 0x1
	add r8, r0
	b _0802EB3A
	.align 2, 0
_0802EAEC: .4byte gUnknown_2023BC4
_0802EAF0: .4byte gUnknown_3004FF4
_0802EAF4: .4byte gUnknown_2022BC4
_0802EAF8:
	movs r0, 0x7D
	ands r0, r4
	cmp r0, 0
	bne _0802EB04
	movs r0, 0x1
	add r8, r0
_0802EB04:
	ldr r0, _0802EB78 @ =gUnknown_2023FFC
	adds r0, r2, r0
	adds r1, r7, 0
	adds r1, 0x8
	ldrb r0, [r0]
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0802EB36
	movs r0, 0x12
	ands r0, r4
	cmp r0, 0
	bne _0802EB3A
	movs r0, 0
	bl sub_803F5B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0802EB3A
	ldrb r0, [r5]
	bl sub_803F6A0
	ldr r1, _0802EB7C @ =gUnknown_3004FF4
	strb r0, [r1]
_0802EB36:
	movs r0, 0
	mov r8, r0
_0802EB3A:
	bl sub_8070A84
	movs r0, 0xF0
	lsls r0, 12
	ldr r1, _0802EB80 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8070588
	mov r0, r8
	cmp r0, 0
	bne _0802EB88
	ldr r1, _0802EB78 @ =gUnknown_2023FFC
	ldr r0, _0802EB84 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r0, _0802EB7C @ =gUnknown_3004FF4
	ldrb r0, [r0]
	lsls r0, 8
	orrs r2, r0
	movs r0, 0x1
	movs r1, 0xA
	bl sub_800E848
	bl sub_802E33C
	b _0802EDBA
	.align 2, 0
_0802EB78: .4byte gUnknown_2023FFC
_0802EB7C: .4byte gUnknown_3004FF4
_0802EB80: .4byte 0x00007fff
_0802EB84: .4byte gUnknown_2023BC4
_0802EB88:
	ldr r1, _0802EBA4 @ =gUnknown_3004FE0
	ldr r2, _0802EBA8 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802EBAC @ =sub_802E674
	str r1, [r0]
	movs r0, 0x12
	ands r4, r0
	cmp r4, 0
	beq _0802EBB4
	ldr r1, _0802EBB0 @ =gUnknown_3004FF4
	ldrb r0, [r2]
	b _0802EBE4
	.align 2, 0
_0802EBA4: .4byte gUnknown_3004FE0
_0802EBA8: .4byte gUnknown_2023BC4
_0802EBAC: .4byte sub_802E674
_0802EBB0: .4byte gUnknown_3004FF4
_0802EBB4:
	movs r0, 0x1
	bl sub_80751E8
	ldr r1, _0802EBD4 @ =gUnknown_2023D70
	ldrb r1, [r1]
	ldr r2, _0802EBD8 @ =gUnknown_825E45C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0802EBDC
	movs r0, 0x3
	b _0802EBDE
	.align 2, 0
_0802EBD4: .4byte gUnknown_2023D70
_0802EBD8: .4byte gUnknown_825E45C
_0802EBDC:
	movs r0, 0x1
_0802EBDE:
	bl sub_80751E8
	ldr r1, _0802EC00 @ =gUnknown_3004FF4
_0802EBE4:
	strb r0, [r1]
	ldr r2, _0802EC04 @ =gUnknown_202063C
	ldr r1, _0802EC08 @ =gUnknown_2023D44
	ldr r0, _0802EC00 @ =gUnknown_3004FF4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802EC0C @ =sub_8012044
	b _0802EDB8
	.align 2, 0
_0802EC00: .4byte gUnknown_3004FF4
_0802EC04: .4byte gUnknown_202063C
_0802EC08: .4byte gUnknown_2023D44
_0802EC0C: .4byte sub_8012044
_0802EC10:
	movs r7, 0x2
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _0802EC38
	movs r0, 0x5
	bl sub_80722CC
	ldr r2, _0802EC34 @ =0x0000ffff
	movs r0, 0x1
	movs r1, 0xA
	bl sub_800E848
	bl sub_802E33C
	bl sub_8070A84
	b _0802ED2C
	.align 2, 0
_0802EC34: .4byte 0x0000ffff
_0802EC38:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0802EC68
	ldr r4, _0802EC64 @ =gUnknown_2023FFC
	ldrb r0, [r6]
	adds r2, r0, r4
	ldrb r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0802EC52
	b _0802EDBA
_0802EC52:
	ldrb r0, [r2]
	bl sub_8030A14
	ldrb r1, [r6]
	adds r1, r4
	ldrb r0, [r1]
	movs r2, 0x1
	eors r0, r2
	b _0802ED10
	.align 2, 0
_0802EC64: .4byte gUnknown_2023FFC
_0802EC68:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802ECAC
	ldr r4, _0802ECA4 @ =gUnknown_2023FFC
	ldrb r0, [r6]
	adds r3, r0, r4
	ldrb r2, [r3]
	movs r7, 0x1
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _0802EC84
	b _0802EDBA
_0802EC84:
	ldr r1, _0802ECA8 @ =gUnknown_3004FF8
	adds r0, r7, 0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0802EC92
	b _0802EDBA
_0802EC92:
	ldrb r0, [r3]
	bl sub_8030A14
	ldrb r1, [r6]
	adds r1, r4
	ldrb r0, [r1]
	eors r0, r7
	b _0802ED10
	.align 2, 0
_0802ECA4: .4byte gUnknown_2023FFC
_0802ECA8: .4byte gUnknown_3004FF8
_0802ECAC:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802ECDC
	ldr r4, _0802ECD8 @ =gUnknown_2023FFC
	ldrb r0, [r6]
	adds r2, r0, r4
	ldrb r1, [r2]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _0802ECC6
	b _0802EDBA
_0802ECC6:
	ldrb r0, [r2]
	bl sub_8030A14
	ldrb r1, [r6]
	adds r1, r4
	ldrb r0, [r1]
	movs r2, 0x2
	eors r0, r2
	b _0802ED10
	.align 2, 0
_0802ECD8: .4byte gUnknown_2023FFC
_0802ECDC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802ED4C
	ldr r4, _0802ED40 @ =gUnknown_2023FFC
	ldrb r0, [r6]
	adds r3, r0, r4
	ldrb r2, [r3]
	movs r5, 0x2
	adds r0, r7, 0
	ands r0, r2
	cmp r0, 0
	bne _0802EDBA
	ldr r1, _0802ED44 @ =gUnknown_3004FF8
	adds r0, r5, 0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802EDBA
	ldrb r0, [r3]
	bl sub_8030A14
	ldrb r1, [r6]
	adds r1, r4
	ldrb r0, [r1]
	eors r0, r5
_0802ED10:
	strb r0, [r1]
	movs r0, 0x5
	bl sub_80722CC
	ldrb r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl sub_80309CC
	bl sub_80308CC
	bl sub_8030940
_0802ED2C:
	movs r0, 0xF0
	lsls r0, 12
	ldr r1, _0802ED48 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8070588
	b _0802EDBA
	.align 2, 0
_0802ED40: .4byte gUnknown_2023FFC
_0802ED44: .4byte gUnknown_3004FF8
_0802ED48: .4byte 0x00007fff
_0802ED4C:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0802EDBA
	ldr r0, _0802ED84 @ =gUnknown_3004FF8
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0802EDBA
	ldr r0, _0802ED88 @ =gUnknown_2022B4C
	ldr r5, [r0]
	ands r5, r7
	cmp r5, 0
	bne _0802EDBA
	ldr r4, _0802ED8C @ =gUnknown_2023FFC
	ldrb r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x1D
	bl sub_80309CC
	ldrb r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802ED94
	ldr r0, _0802ED90 @ =gUnknown_3004FF4
	strb r5, [r0]
	b _0802ED9C
	.align 2, 0
_0802ED84: .4byte gUnknown_3004FF8
_0802ED88: .4byte gUnknown_2022B4C
_0802ED8C: .4byte gUnknown_2023FFC
_0802ED90: .4byte gUnknown_3004FF4
_0802ED94:
	ldr r1, _0802EDC8 @ =gUnknown_3004FF4
	adds r0, 0x1
	strb r0, [r1]
	adds r0, r1, 0
_0802ED9C:
	ldrb r0, [r0]
	movs r1, 0x1B
	bl sub_80309CC
	ldr r0, _0802EDCC @ =gUnknown_83FE7A0
	movs r1, 0xB
	bl sub_80D87BC
	ldr r1, _0802EDD0 @ =gUnknown_3004FE0
	ldr r0, _0802EDD4 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802EDD8 @ =sub_802EF58
_0802EDB8:
	str r1, [r0]
_0802EDBA:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802EDC8: .4byte gUnknown_3004FF4
_0802EDCC: .4byte gUnknown_83FE7A0
_0802EDD0: .4byte gUnknown_3004FE0
_0802EDD4: .4byte gUnknown_2023BC4
_0802EDD8: .4byte sub_802EF58
	thumb_func_end sub_802EA10

	thumb_func_start sub_802EDDC
sub_802EDDC: @ 802EDDC
	push {r4-r7,lr}
	movs r7, 0
	ldr r4, _0802EF40 @ =gUnknown_30030F0
	ldrh r1, [r4, 0x2E]
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _0802EDF6
	movs r0, 0x5
	bl sub_80722CC
	movs r7, 0x1
_0802EDF6:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802EE18
	movs r0, 0x5
	bl sub_80722CC
	ldr r1, _0802EF44 @ =gUnknown_2022974
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0802EF48 @ =gUnknown_2022976
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	movs r7, 0xFF
_0802EE18:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0802EE58
	ldr r5, _0802EF4C @ =gUnknown_2023FFC
	ldr r4, _0802EF50 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r2, r0, r5
	ldrb r1, [r2]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _0802EE58
	ldrb r0, [r2]
	bl sub_8030A14
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	eors r0, r2
	strb r0, [r1]
	movs r0, 0x5
	bl sub_80722CC
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_80309CC
_0802EE58:
	ldr r0, _0802EF40 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802EEA6
	ldr r5, _0802EF4C @ =gUnknown_2023FFC
	ldr r4, _0802EF50 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r3, r0, r5
	ldrb r2, [r3]
	movs r6, 0x1
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _0802EEA6
	ldr r1, _0802EF54 @ =gUnknown_3004FF8
	adds r0, r6, 0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802EEA6
	ldrb r0, [r3]
	bl sub_8030A14
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	eors r0, r6
	strb r0, [r1]
	movs r0, 0x5
	bl sub_80722CC
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_80309CC
_0802EEA6:
	ldr r0, _0802EF40 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802EEE8
	ldr r5, _0802EF4C @ =gUnknown_2023FFC
	ldr r4, _0802EF50 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r2, r0, r5
	ldrb r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802EEE8
	ldrb r0, [r2]
	bl sub_8030A14
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
	eors r0, r2
	strb r0, [r1]
	movs r0, 0x5
	bl sub_80722CC
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_80309CC
_0802EEE8:
	ldr r0, _0802EF40 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802EF36
	ldr r5, _0802EF4C @ =gUnknown_2023FFC
	ldr r4, _0802EF50 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r3, r0, r5
	ldrb r2, [r3]
	movs r6, 0x2
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	bne _0802EF36
	ldr r1, _0802EF54 @ =gUnknown_3004FF8
	adds r0, r6, 0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802EF36
	ldrb r0, [r3]
	bl sub_8030A14
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	eors r0, r6
	strb r0, [r1]
	movs r0, 0x5
	bl sub_80722CC
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_80309CC
_0802EF36:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802EF40: .4byte gUnknown_30030F0
_0802EF44: .4byte gUnknown_2022974
_0802EF48: .4byte gUnknown_2022976
_0802EF4C: .4byte gUnknown_2023FFC
_0802EF50: .4byte gUnknown_2023BC4
_0802EF54: .4byte gUnknown_3004FF8
	thumb_func_end sub_802EDDC

	thumb_func_start sub_802EF58
sub_802EF58: @ 802EF58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r0, _0802F2E4 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x5
	ands r0, r1
	cmp r0, 0
	bne _0802EF72
	b _0802F34C
_0802EF72:
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _0802F2E8 @ =gUnknown_2023FFC
	mov r10, r0
	ldr r1, _0802F2EC @ =gUnknown_2023BC4
	mov r8, r1
	ldrb r1, [r1]
	adds r2, r1, r0
	ldr r5, _0802F2F0 @ =gUnknown_3004FF4
	ldrb r0, [r2]
	ldrb r3, [r5]
	cmp r0, r3
	bne _0802EF90
	b _0802F2C8
_0802EF90:
	lsls r1, 9
	ldr r0, _0802F2F4 @ =gUnknown_2022BC8
	adds r1, r0
	mov r9, r1
	ldrb r1, [r2]
	lsls r1, 1
	add r1, r9
	ldrh r6, [r1]
	ldrb r0, [r5]
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r1]
	ldrb r0, [r5]
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	mov r1, r8
	ldrb r0, [r1]
	add r0, r10
	ldrb r1, [r0]
	mov r7, r9
	adds r7, 0x8
	adds r1, r7, r1
	ldrb r6, [r1]
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, r7, r0
	strb r6, [r0]
	mov r2, r8
	ldrb r0, [r2]
	add r0, r10
	ldrb r1, [r0]
	mov r2, r9
	adds r2, 0xC
	adds r1, r2, r1
	ldrb r6, [r1]
	ldrb r0, [r5]
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r2, r0
	strb r6, [r2]
	mov r3, r8
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r2, _0802F2F8 @ =gUnknown_2023E0C
	adds r6, r0, r2
	ldrb r4, [r6, 0x18]
	lsls r3, r4, 24
	lsrs r2, r3, 28
	ldr r0, _0802F2FC @ =gUnknown_825E45C
	mov r12, r0
	add r1, r10
	ldrb r0, [r1]
	lsls r0, 2
	add r0, r12
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _0802F04A
	lsrs r1, r3, 28
	bics r1, r0
	lsls r1, 4
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r6, 0x18]
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r3, _0802F2F8 @ =gUnknown_2023E0C
	adds r1, r3
	ldrb r4, [r1, 0x18]
	lsrs r3, r4, 4
	ldrb r0, [r5]
	lsls r0, 2
	add r0, r12
	ldr r0, [r0]
	orrs r0, r3
	lsls r0, 4
	ands r2, r4
	orrs r2, r0
	strb r2, [r1, 0x18]
_0802F04A:
	bl sub_8030830
	movs r6, 0
	mov r12, r7
	mov r5, sp
	adds r5, 0x18
	str r5, [sp, 0x1C]
	ldr r2, _0802F300 @ =gUnknown_2023BE4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r4, r0, 0
	adds r4, 0x3B
	mov r7, r8
	mov r10, r2
	movs r5, 0x3
_0802F06E:
	mov r1, sp
	adds r3, r1, r6
	ldrb r1, [r4]
	lsls r2, r6, 1
	adds r0, r5, 0
	lsls r0, r2
	ands r1, r0
	asrs r1, r2
	strb r1, [r3]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802F06E
	ldr r1, _0802F2E8 @ =gUnknown_2023FFC
	ldrb r0, [r7]
	adds r0, r1
	ldrb r0, [r0]
	add r0, sp
	ldrb r0, [r0]
	ldr r2, [sp, 0x1C]
	strb r0, [r2]
	ldrb r0, [r7]
	adds r0, r1
	ldrb r0, [r0]
	mov r3, sp
	adds r2, r3, r0
	ldr r1, _0802F2F0 @ =gUnknown_3004FF4
	ldrb r0, [r1]
	add r0, sp
	ldrb r0, [r0]
	movs r3, 0
	strb r0, [r2]
	ldrb r0, [r1]
	mov r5, sp
	adds r1, r5, r0
	ldr r2, [sp, 0x1C]
	ldrb r0, [r2]
	strb r0, [r1]
	strb r3, [r2]
	movs r6, 0
	ldr r2, [sp, 0x1C]
_0802F0BE:
	mov r3, sp
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r6, 1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802F0BE
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	add r0, r10
	adds r0, 0x3B
	ldr r5, [sp, 0x1C]
	ldrb r1, [r5]
	strb r1, [r0]
	movs r6, 0
	adds r4, r7, 0
	movs r3, 0x58
	movs r0, 0x24
	add r0, r10
	mov r8, r0
	mov r2, r9
	mov r7, r10
	adds r7, 0xC
	mov r5, r12
_0802F0F8:
	lsls r1, r6, 1
	ldrb r0, [r4]
	muls r0, r3
	adds r1, r0
	adds r1, r7
	ldrh r0, [r2]
	strh r0, [r1]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r3
	adds r1, r6, r1
	add r1, r8
	adds r0, r5, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802F0F8
	ldr r2, _0802F2EC @ =gUnknown_2023BC4
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	mov r1, r10
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	beq _0802F13A
	b _0802F2C8
_0802F13A:
	movs r6, 0
	mov r1, sp
	adds r1, 0x4
	str r1, [sp, 0x20]
	add r3, sp, 0xC
	mov r10, r3
	ldr r5, _0802F304 @ =gUnknown_2023BCE
	mov r9, r5
	mov r8, r2
	movs r7, 0x64
	ldr r5, _0802F308 @ =gUnknown_2024284
	adds r4, r1, 0
_0802F152:
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	muls r0, r7
	adds r0, r5
	adds r1, r6, 0
	adds r1, 0xD
	bl sub_803FBE8
	strh r0, [r4]
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	muls r0, r7
	adds r0, r5
	adds r1, r6, 0
	adds r1, 0x11
	bl sub_803FBE8
	mov r3, r10
	adds r1, r3, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802F152
	ldr r1, _0802F304 @ =gUnknown_2023BCE
	ldr r0, _0802F2EC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802F308 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x15
	bl sub_803FBE8
	ldr r5, [sp, 0x1C]
	strb r0, [r5]
	movs r6, 0
	movs r5, 0x3
	ldr r4, [sp, 0x1C]
_0802F1B2:
	mov r0, sp
	adds r3, r0, r6
	lsls r2, r6, 1
	adds r1, r5, 0
	lsls r1, r2
	ldrb r0, [r4]
	ands r0, r1
	asrs r0, r2
	strb r0, [r3]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802F1B2
	ldr r4, _0802F2E8 @ =gUnknown_2023FFC
	ldr r3, _0802F2EC @ =gUnknown_2023BC4
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r1, 1
	ldr r2, [sp, 0x20]
	adds r1, r2, r1
	ldrh r6, [r1]
	ldr r2, _0802F2F0 @ =gUnknown_3004FF4
	ldrb r0, [r2]
	lsls r0, 1
	ldr r5, [sp, 0x20]
	adds r0, r5, r0
	ldrh r0, [r0]
	movs r5, 0
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, 1
	ldr r1, [sp, 0x20]
	adds r0, r1, r0
	strh r6, [r0]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	add r1, r10
	ldrb r6, [r1]
	ldrb r0, [r2]
	add r0, r10
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	add r0, r10
	strb r6, [r0]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r0, [r0]
	add r0, sp
	ldrb r0, [r0]
	ldr r1, [sp, 0x1C]
	strb r0, [r1]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r0, [r0]
	mov r3, sp
	adds r1, r3, r0
	ldrb r0, [r2]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	adds r1, r3, r0
	ldr r2, [sp, 0x1C]
	ldrb r0, [r2]
	strb r0, [r1]
	strb r5, [r2]
	movs r6, 0
	ldr r2, [sp, 0x1C]
_0802F23E:
	mov r3, sp
	adds r0, r3, r6
	ldrb r1, [r0]
	lsls r0, r6, 1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802F23E
	movs r6, 0
	ldr r5, _0802F304 @ =gUnknown_2023BCE
	mov r10, r5
	ldr r0, _0802F2EC @ =gUnknown_2023BC4
	mov r9, r0
	movs r1, 0x64
	mov r8, r1
	ldr r7, _0802F308 @ =gUnknown_2024284
	ldr r5, [sp, 0x20]
	adds r5, 0x8
	ldr r4, [sp, 0x20]
_0802F26A:
	mov r2, r9
	ldrb r0, [r2]
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	adds r0, r7
	adds r1, r6, 0
	adds r1, 0xD
	adds r2, r4, 0
	bl sub_804037C
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	adds r1, r6, 0
	adds r1, 0x11
	adds r2, r5, 0
	bl sub_804037C
	adds r5, 0x1
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802F26A
	ldr r1, _0802F304 @ =gUnknown_2023BCE
	ldr r0, _0802F2EC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802F308 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x15
	ldr r2, [sp, 0x1C]
	bl sub_804037C
_0802F2C8:
	ldr r0, _0802F30C @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802F318
	ldr r1, _0802F310 @ =gUnknown_3004FE0
	ldr r2, _0802F2EC @ =gUnknown_2023BC4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802F314 @ =sub_80E7988
	b _0802F324
	.align 2, 0
_0802F2E4: .4byte gUnknown_30030F0
_0802F2E8: .4byte gUnknown_2023FFC
_0802F2EC: .4byte gUnknown_2023BC4
_0802F2F0: .4byte gUnknown_3004FF4
_0802F2F4: .4byte gUnknown_2022BC8
_0802F2F8: .4byte gUnknown_2023E0C
_0802F2FC: .4byte gUnknown_825E45C
_0802F300: .4byte gUnknown_2023BE4
_0802F304: .4byte gUnknown_2023BCE
_0802F308: .4byte gUnknown_2024284
_0802F30C: .4byte gUnknown_2022B4C
_0802F310: .4byte gUnknown_3004FE0
_0802F314: .4byte sub_80E7988
_0802F318:
	ldr r1, _0802F390 @ =gUnknown_3004FE0
	ldr r2, _0802F394 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802F398 @ =sub_802EA10
_0802F324:
	str r1, [r0]
	adds r7, r2, 0
	ldr r2, _0802F39C @ =gUnknown_2023FFC
	ldrb r0, [r7]
	adds r0, r2
	ldr r1, _0802F3A0 @ =gUnknown_3004FF4
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r0, [r7]
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0
	bl sub_80309CC
	bl sub_80308A8
	bl sub_80308CC
	bl sub_8030940
_0802F34C:
	ldr r0, _0802F3A4 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802F3C8
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _0802F3A0 @ =gUnknown_3004FF4
	ldrb r0, [r0]
	bl sub_8030A14
	ldr r1, _0802F39C @ =gUnknown_2023FFC
	ldr r4, _0802F394 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_80309CC
	ldr r0, _0802F3A8 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802F3B0
	ldr r0, _0802F390 @ =gUnknown_3004FE0
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0802F3AC @ =sub_80E7988
	b _0802F3BA
	.align 2, 0
_0802F390: .4byte gUnknown_3004FE0
_0802F394: .4byte gUnknown_2023BC4
_0802F398: .4byte sub_802EA10
_0802F39C: .4byte gUnknown_2023FFC
_0802F3A0: .4byte gUnknown_3004FF4
_0802F3A4: .4byte gUnknown_30030F0
_0802F3A8: .4byte gUnknown_2022B4C
_0802F3AC: .4byte sub_80E7988
_0802F3B0:
	ldr r0, _0802F3F8 @ =gUnknown_3004FE0
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0802F3FC @ =sub_802EA10
_0802F3BA:
	str r0, [r1]
	bl sub_80308A8
	bl sub_80308CC
	bl sub_8030940
_0802F3C8:
	ldr r0, _0802F400 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0802F454
	ldr r3, _0802F404 @ =gUnknown_3004FF4
	ldrb r2, [r3]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _0802F454
	ldr r0, _0802F408 @ =gUnknown_2023FFC
	ldr r1, _0802F40C @ =gUnknown_2023BC4
	ldrb r1, [r1]
	adds r1, r0
	ldrb r5, [r1]
	cmp r2, r5
	bne _0802F410
	ldrb r0, [r1]
	movs r1, 0x1D
	bl sub_80309CC
	b _0802F416
	.align 2, 0
_0802F3F8: .4byte gUnknown_3004FE0
_0802F3FC: .4byte sub_802EA10
_0802F400: .4byte gUnknown_30030F0
_0802F404: .4byte gUnknown_3004FF4
_0802F408: .4byte gUnknown_2023FFC
_0802F40C: .4byte gUnknown_2023BC4
_0802F410:
	ldrb r0, [r3]
	bl sub_8030A14
_0802F416:
	ldr r4, _0802F440 @ =gUnknown_3004FF4
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
	movs r0, 0x5
	bl sub_80722CC
	ldr r1, _0802F444 @ =gUnknown_2023FFC
	ldr r0, _0802F448 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802F44C
	adds r0, r1, 0
	movs r1, 0
	bl sub_80309CC
	b _0802F454
	.align 2, 0
_0802F440: .4byte gUnknown_3004FF4
_0802F444: .4byte gUnknown_2023FFC
_0802F448: .4byte gUnknown_2023BC4
_0802F44C:
	ldrb r0, [r4]
	movs r1, 0x1B
	bl sub_80309CC
_0802F454:
	ldr r0, _0802F490 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802F4E8
	ldr r3, _0802F494 @ =gUnknown_3004FF4
	ldrb r2, [r3]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _0802F4E8
	ldr r1, _0802F498 @ =gUnknown_3004FF8
	movs r0, 0x1
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802F4E8
	ldr r0, _0802F49C @ =gUnknown_2023FFC
	ldr r1, _0802F4A0 @ =gUnknown_2023BC4
	ldrb r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	cmp r2, r0
	bne _0802F4A4
	ldrb r0, [r1]
	movs r1, 0x1D
	bl sub_80309CC
	b _0802F4AA
	.align 2, 0
_0802F490: .4byte gUnknown_30030F0
_0802F494: .4byte gUnknown_3004FF4
_0802F498: .4byte gUnknown_3004FF8
_0802F49C: .4byte gUnknown_2023FFC
_0802F4A0: .4byte gUnknown_2023BC4
_0802F4A4:
	ldrb r0, [r3]
	bl sub_8030A14
_0802F4AA:
	ldr r4, _0802F4D4 @ =gUnknown_3004FF4
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
	movs r0, 0x5
	bl sub_80722CC
	ldr r1, _0802F4D8 @ =gUnknown_2023FFC
	ldr r0, _0802F4DC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802F4E0
	adds r0, r1, 0
	movs r1, 0
	bl sub_80309CC
	b _0802F4E8
	.align 2, 0
_0802F4D4: .4byte gUnknown_3004FF4
_0802F4D8: .4byte gUnknown_2023FFC
_0802F4DC: .4byte gUnknown_2023BC4
_0802F4E0:
	ldrb r0, [r4]
	movs r1, 0x1B
	bl sub_80309CC
_0802F4E8:
	ldr r0, _0802F518 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802F56C
	ldr r3, _0802F51C @ =gUnknown_3004FF4
	ldrb r2, [r3]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0802F56C
	ldr r0, _0802F520 @ =gUnknown_2023FFC
	ldr r1, _0802F524 @ =gUnknown_2023BC4
	ldrb r1, [r1]
	adds r1, r0
	ldrb r5, [r1]
	cmp r2, r5
	bne _0802F528
	ldrb r0, [r1]
	movs r1, 0x1D
	bl sub_80309CC
	b _0802F52E
	.align 2, 0
_0802F518: .4byte gUnknown_30030F0
_0802F51C: .4byte gUnknown_3004FF4
_0802F520: .4byte gUnknown_2023FFC
_0802F524: .4byte gUnknown_2023BC4
_0802F528:
	ldrb r0, [r3]
	bl sub_8030A14
_0802F52E:
	ldr r4, _0802F558 @ =gUnknown_3004FF4
	ldrb r0, [r4]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r4]
	movs r0, 0x5
	bl sub_80722CC
	ldr r1, _0802F55C @ =gUnknown_2023FFC
	ldr r0, _0802F560 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802F564
	adds r0, r1, 0
	movs r1, 0
	bl sub_80309CC
	b _0802F56C
	.align 2, 0
_0802F558: .4byte gUnknown_3004FF4
_0802F55C: .4byte gUnknown_2023FFC
_0802F560: .4byte gUnknown_2023BC4
_0802F564:
	ldrb r0, [r4]
	movs r1, 0x1B
	bl sub_80309CC
_0802F56C:
	ldr r0, _0802F5A8 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802F600
	ldr r3, _0802F5AC @ =gUnknown_3004FF4
	ldrb r2, [r3]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	bne _0802F600
	ldr r1, _0802F5B0 @ =gUnknown_3004FF8
	movs r0, 0x2
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802F600
	ldr r0, _0802F5B4 @ =gUnknown_2023FFC
	ldr r1, _0802F5B8 @ =gUnknown_2023BC4
	ldrb r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	cmp r2, r0
	bne _0802F5BC
	ldrb r0, [r1]
	movs r1, 0x1D
	bl sub_80309CC
	b _0802F5C2
	.align 2, 0
_0802F5A8: .4byte gUnknown_30030F0
_0802F5AC: .4byte gUnknown_3004FF4
_0802F5B0: .4byte gUnknown_3004FF8
_0802F5B4: .4byte gUnknown_2023FFC
_0802F5B8: .4byte gUnknown_2023BC4
_0802F5BC:
	ldrb r0, [r3]
	bl sub_8030A14
_0802F5C2:
	ldr r4, _0802F5EC @ =gUnknown_3004FF4
	ldrb r0, [r4]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r4]
	movs r0, 0x5
	bl sub_80722CC
	ldr r1, _0802F5F0 @ =gUnknown_2023FFC
	ldr r0, _0802F5F4 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802F5F8
	adds r0, r1, 0
	movs r1, 0
	bl sub_80309CC
	b _0802F600
	.align 2, 0
_0802F5EC: .4byte gUnknown_3004FF4
_0802F5F0: .4byte gUnknown_2023FFC
_0802F5F4: .4byte gUnknown_2023BC4
_0802F5F8:
	ldrb r0, [r4]
	movs r1, 0x1B
	bl sub_80309CC
_0802F600:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_802EF58

	thumb_func_start sub_802F610
sub_802F610: @ 802F610
	push {lr}
	ldr r0, _0802F64C @ =gUnknown_3003F3C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802F664
	ldr r0, _0802F650 @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802F694
	movs r0, 0x53
	bl m4aSongNumStop
	ldr r3, _0802F654 @ =gUnknown_30030F0
	ldr r0, _0802F658 @ =0x00000439
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0802F65C @ =gUnknown_3004F80
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0802F660 @ =sub_8011A1C
	bl sub_8000544
	bl sub_8003ECC
	b _0802F694
	.align 2, 0
_0802F64C: .4byte gUnknown_3003F3C
_0802F650: .4byte gUnknown_3003F64
_0802F654: .4byte gUnknown_30030F0
_0802F658: .4byte 0x00000439
_0802F65C: .4byte gUnknown_3004F80
_0802F660: .4byte sub_8011A1C
_0802F664:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0802F694
	movs r0, 0x53
	bl m4aSongNumStop
	ldr r3, _0802F698 @ =gUnknown_30030F0
	ldr r0, _0802F69C @ =0x00000439
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0802F6A0 @ =gUnknown_3004F80
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0802F6A4 @ =sub_8011A1C
	bl sub_8000544
	bl sub_8003ECC
_0802F694:
	pop {r0}
	bx r0
	.align 2, 0
_0802F698: .4byte gUnknown_30030F0
_0802F69C: .4byte 0x00000439
_0802F6A0: .4byte gUnknown_3004F80
_0802F6A4: .4byte sub_8011A1C
	thumb_func_end sub_802F610

	thumb_func_start sub_802F6A8
sub_802F6A8: @ 802F6A8
	push {lr}
	ldr r0, _0802F6D0 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802F71E
	ldr r0, _0802F6D4 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802F6FC
	ldr r0, _0802F6D8 @ =gUnknown_3003F3C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802F6DC
	bl sub_800AAC0
	b _0802F6E0
	.align 2, 0
_0802F6D0: .4byte gUnknown_2037AB8
_0802F6D4: .4byte gUnknown_2022B4C
_0802F6D8: .4byte gUnknown_3003F3C
_0802F6DC:
	bl sub_800AB9C
_0802F6E0:
	ldr r1, _0802F6F0 @ =gUnknown_3004FE0
	ldr r0, _0802F6F4 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802F6F8 @ =sub_802F610
	str r1, [r0]
	b _0802F71E
	.align 2, 0
_0802F6F0: .4byte gUnknown_3004FE0
_0802F6F4: .4byte gUnknown_2023BC4
_0802F6F8: .4byte sub_802F610
_0802F6FC:
	movs r0, 0x53
	bl m4aSongNumStop
	ldr r2, _0802F724 @ =gUnknown_30030F0
	ldr r0, _0802F728 @ =0x00000439
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0802F72C @ =gUnknown_3004F80
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl sub_8000544
_0802F71E:
	pop {r0}
	bx r0
	.align 2, 0
_0802F724: .4byte gUnknown_30030F0
_0802F728: .4byte 0x00000439
_0802F72C: .4byte gUnknown_3004F80
	thumb_func_end sub_802F6A8

	thumb_func_start sub_802F730
sub_802F730: @ 802F730
	push {lr}
	ldr r2, _0802F758 @ =gUnknown_202063C
	ldr r1, _0802F75C @ =gUnknown_2023D44
	ldr r0, _0802F760 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0802F764 @ =nullsub_8
	cmp r1, r0
	bne _0802F754
	bl sub_802E33C
_0802F754:
	pop {r0}
	bx r0
	.align 2, 0
_0802F758: .4byte gUnknown_202063C
_0802F75C: .4byte gUnknown_2023D44
_0802F760: .4byte gUnknown_2023BC4
_0802F764: .4byte nullsub_8
	thumb_func_end sub_802F730

	thumb_func_start sub_802F768
sub_802F768: @ 802F768
	push {lr}
	ldr r2, _0802F790 @ =gUnknown_202063C
	ldr r1, _0802F794 @ =gUnknown_2023D44
	ldr r0, _0802F798 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0802F79C @ =nullsub_8
	cmp r1, r0
	bne _0802F78C
	bl sub_802E33C
_0802F78C:
	pop {r0}
	bx r0
	.align 2, 0
_0802F790: .4byte gUnknown_202063C
_0802F794: .4byte gUnknown_2023D44
_0802F798: .4byte gUnknown_2023BC4
_0802F79C: .4byte nullsub_8
	thumb_func_end sub_802F768

	thumb_func_start sub_802F7A0
sub_802F7A0: @ 802F7A0
	push {r4-r6,lr}
	ldr r6, _0802F7FC @ =gUnknown_202063C
	ldr r5, _0802F800 @ =gUnknown_2023D44
	ldr r4, _0802F804 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _0802F808 @ =nullsub_8
	cmp r1, r0
	bne _0802F7F4
	ldr r0, _0802F80C @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	bl nullsub_16
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl sub_80077D8
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl sub_8007280
	bl sub_802E33C
_0802F7F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F7FC: .4byte gUnknown_202063C
_0802F800: .4byte gUnknown_2023D44
_0802F804: .4byte gUnknown_2023BC4
_0802F808: .4byte nullsub_8
_0802F80C: .4byte gUnknown_300500C
	thumb_func_end sub_802F7A0

	thumb_func_start sub_802F810
sub_802F810: @ 802F810
	push {r4,lr}
	ldr r4, _0802F850 @ =gUnknown_2024018
	ldr r1, [r4]
	ldr r3, _0802F854 @ =gUnknown_2023BC4
	ldrb r0, [r3]
	ldr r2, [r1, 0x4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x9]
	subs r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0802F848
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x9]
	bl sub_802E33C
_0802F848:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F850: .4byte gUnknown_2024018
_0802F854: .4byte gUnknown_2023BC4
	thumb_func_end sub_802F810

	thumb_func_start sub_802F858
sub_802F858: @ 802F858
	push {r4-r7,lr}
	movs r6, 0
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0802F87C
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0802F8B0
	ldr r0, _0802F89C @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802F8B0
_0802F87C:
	ldr r2, _0802F8A0 @ =gUnknown_202063C
	ldr r1, _0802F8A4 @ =gUnknown_3004FF0
	ldr r0, _0802F8A8 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0802F8AC @ =nullsub_8
	cmp r1, r0
	bne _0802F8E6
	b _0802F8E4
	.align 2, 0
_0802F89C: .4byte gUnknown_2022B4C
_0802F8A0: .4byte gUnknown_202063C
_0802F8A4: .4byte gUnknown_3004FF0
_0802F8A8: .4byte gUnknown_2023BC4
_0802F8AC: .4byte nullsub_8
_0802F8B0:
	ldr r2, _0802F9B0 @ =gUnknown_202063C
	ldr r5, _0802F9B4 @ =gUnknown_3004FF0
	ldr r0, _0802F9B8 @ =gUnknown_2023BC4
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r4, [r0]
	ldr r0, _0802F9BC @ =nullsub_8
	cmp r4, r0
	bne _0802F8E6
	movs r0, 0x2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _0802F8E6
_0802F8E4:
	movs r6, 0x1
_0802F8E6:
	bl sub_80721F0
	lsls r0, 24
	cmp r0, 0
	beq _0802F8F2
	movs r6, 0
_0802F8F2:
	cmp r6, 0
	bne _0802F8F8
	b _0802FA32
_0802F8F8:
	ldr r0, _0802F9C0 @ =gUnknown_2024018
	mov r12, r0
	ldr r0, [r0]
	ldr r7, _0802F9B8 @ =gUnknown_2023BC4
	ldrb r2, [r7]
	ldr r3, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r3
	ldrb r1, [r4, 0x1]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0802F91A
	b _0802FA32
_0802F91A:
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0802F934
	b _0802FA32
_0802F934:
	ldrb r1, [r4]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4]
	mov r1, r12
	ldr r0, [r1]
	ldrb r2, [r7]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	mov r0, r12
	ldr r2, [r0]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	mov r1, r12
	ldr r2, [r1]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldr r4, _0802F9C4 @ =0x000027f9
	adds r0, r4, 0
	bl sub_800874C
	adds r0, r4, 0
	bl sub_8008A30
	ldr r0, _0802F9C8 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802F9D0
	ldr r0, _0802F9CC @ =gMPlay_BGM
	bl m4aMPlayContinue
	b _0802F9DC
	.align 2, 0
_0802F9B0: .4byte gUnknown_202063C
_0802F9B4: .4byte gUnknown_3004FF0
_0802F9B8: .4byte gUnknown_2023BC4
_0802F9BC: .4byte nullsub_8
_0802F9C0: .4byte gUnknown_2024018
_0802F9C4: .4byte 0x000027f9
_0802F9C8: .4byte gUnknown_2022B4C
_0802F9CC: .4byte gMPlay_BGM
_0802F9D0:
	ldr r0, _0802FA38 @ =gMPlay_BGM
	ldr r1, _0802FA3C @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_0802F9DC:
	ldr r7, _0802FA40 @ =gUnknown_2023BCE
	ldr r4, _0802FA44 @ =gUnknown_2023BC4
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0802FA48 @ =gUnknown_2024284
	adds r0, r5
	bl sub_8035244
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0802FA12
	ldrb r0, [r4]
	movs r1, 0x2
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	bl sub_8035244
_0802FA12:
	ldr r0, _0802FA4C @ =gUnknown_2024018
	ldr r0, [r0]
	ldrb r1, [r4]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _0802FA50 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FA54 @ =sub_802F810
	str r1, [r0]
_0802FA32:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FA38: .4byte gMPlay_BGM
_0802FA3C: .4byte 0x0000ffff
_0802FA40: .4byte gUnknown_2023BCE
_0802FA44: .4byte gUnknown_2023BC4
_0802FA48: .4byte gUnknown_2024284
_0802FA4C: .4byte gUnknown_2024018
_0802FA50: .4byte gUnknown_3004FE0
_0802FA54: .4byte sub_802F810
	thumb_func_end sub_802F858

	thumb_func_start sub_802FA58
sub_802FA58: @ 802FA58
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0802FBCC @ =gUnknown_2024018
	mov r9, r0
	ldr r0, [r0]
	ldr r1, _0802FBD0 @ =gUnknown_2023BC4
	mov r8, r1
	ldrb r2, [r1]
	ldr r3, [r0, 0x4]
	lsls r5, r2, 1
	adds r0, r5, r2
	lsls r0, 2
	adds r0, r3
	ldrb r4, [r0]
	movs r6, 0x8
	adds r0, r6, 0
	ands r0, r4
	cmp r0, 0
	beq _0802FA84
	b _0802FBBE
_0802FA84:
	movs r7, 0x2
	adds r1, r2, 0
	eors r1, r7
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _0802FA9E
	b _0802FBBE
_0802FA9E:
	movs r6, 0x80
	adds r0, r6, 0
	ands r0, r4
	cmp r0, 0
	bne _0802FABC
	ldr r0, _0802FBD4 @ =gUnknown_2023BCE
	adds r0, r5, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0802FBD8 @ =gUnknown_2024284
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_0802FABC:
	mov r2, r9
	ldr r1, [r2]
	mov r2, r8
	ldrb r0, [r2]
	adds r2, r7, 0
	eors r2, r0
	ldr r1, [r1, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _0802FAF0
	ldr r0, _0802FBD4 @ =gUnknown_2023BCE
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0802FBD8 @ =gUnknown_2024284
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_0802FAF0:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0802FB5C
	ldr r0, _0802FBDC @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0802FB5C
	ldr r1, _0802FBE0 @ =gUnknown_3004FFC
	mov r2, r8
	ldrb r0, [r2]
	eors r0, r7
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802FBE4 @ =gUnknown_202063C
	adds r0, r1
	bl sub_8007280
	ldr r4, _0802FBE8 @ =gUnknown_3004FF0
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r7, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0802FBD4 @ =gUnknown_2023BCE
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0802FBD8 @ =gUnknown_2024284
	adds r1, r2
	movs r2, 0
	bl sub_8049D98
	mov r2, r8
	ldrb r0, [r2]
	eors r0, r7
	bl sub_804BD94
	mov r1, r8
	ldrb r0, [r1]
	eors r0, r7
	adds r0, r4
	ldrb r0, [r0]
	bl sub_80481D4
_0802FB5C:
	ldr r1, _0802FBE0 @ =gUnknown_3004FFC
	ldr r4, _0802FBD0 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802FBE4 @ =gUnknown_202063C
	adds r0, r1
	bl sub_8007280
	ldr r5, _0802FBE8 @ =gUnknown_3004FF0
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0802FBD4 @ =gUnknown_2023BCE
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0802FBD8 @ =gUnknown_2024284
	adds r1, r2
	movs r2, 0
	bl sub_8049D98
	ldrb r0, [r4]
	bl sub_804BD94
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_80481D4
	ldr r0, _0802FBCC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r2, [r0, 0x8]
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _0802FBEC @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FBF0 @ =sub_802F858
	str r1, [r0]
_0802FBBE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FBCC: .4byte gUnknown_2024018
_0802FBD0: .4byte gUnknown_2023BC4
_0802FBD4: .4byte gUnknown_2023BCE
_0802FBD8: .4byte gUnknown_2024284
_0802FBDC: .4byte gUnknown_2022B4C
_0802FBE0: .4byte gUnknown_3004FFC
_0802FBE4: .4byte gUnknown_202063C
_0802FBE8: .4byte gUnknown_3004FF0
_0802FBEC: .4byte gUnknown_3004FE0
_0802FBF0: .4byte sub_802F858
	thumb_func_end sub_802FA58

	thumb_func_start sub_802FBF4
sub_802FBF4: @ 802FBF4
	push {r4-r6,lr}
	ldr r2, _0802FC8C @ =gUnknown_202063C
	ldr r0, _0802FC90 @ =gUnknown_3004FF0
	ldr r6, _0802FC94 @ =gUnknown_2023BC4
	ldrb r3, [r6]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0802FC98 @ =nullsub_8
	cmp r1, r0
	bne _0802FC84
	ldr r5, _0802FC9C @ =gUnknown_2024018
	ldr r0, [r5]
	ldr r1, [r0, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r1
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802FC84
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldrb r2, [r6]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _0802FCA0 @ =0x000027f9
	adds r0, r4, 0
	bl sub_800874C
	adds r0, r4, 0
	bl sub_8008A30
	ldr r0, [r5]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0802FC78
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl sub_80341D8
_0802FC78:
	ldr r0, _0802FCA4 @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0802FCA8 @ =sub_802FCAC
	str r0, [r1]
_0802FC84:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FC8C: .4byte gUnknown_202063C
_0802FC90: .4byte gUnknown_3004FF0
_0802FC94: .4byte gUnknown_2023BC4
_0802FC98: .4byte nullsub_8
_0802FC9C: .4byte gUnknown_2024018
_0802FCA0: .4byte 0x000027f9
_0802FCA4: .4byte gUnknown_3004FE0
_0802FCA8: .4byte sub_802FCAC
	thumb_func_end sub_802FBF4

	thumb_func_start sub_802FCAC
sub_802FCAC: @ 802FCAC
	push {r4,lr}
	ldr r0, _0802FD00 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r4, _0802FD04 @ =gUnknown_2023BC4
	ldrb r1, [r4]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0802FCFA
	bl sub_80721F0
	lsls r0, 24
	cmp r0, 0
	bne _0802FCFA
	ldr r0, _0802FD08 @ =gMPlay_BGM
	ldr r1, _0802FD0C @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	ldr r2, _0802FD10 @ =gUnknown_2023BCE
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0802FD14 @ =gUnknown_2024284
	adds r0, r2
	bl sub_8035244
	bl sub_802E33C
_0802FCFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802FD00: .4byte gUnknown_2024018
_0802FD04: .4byte gUnknown_2023BC4
_0802FD08: .4byte gMPlay_BGM
_0802FD0C: .4byte 0x0000ffff
_0802FD10: .4byte gUnknown_2023BCE
_0802FD14: .4byte gUnknown_2024284
	thumb_func_end sub_802FCAC

	thumb_func_start sub_802FD18
sub_802FD18: @ 802FD18
	push {r4-r6,lr}
	ldr r6, _0802FDCC @ =gUnknown_2024018
	ldr r0, [r6]
	ldr r5, _0802FDD0 @ =gUnknown_2023BC4
	ldrb r2, [r5]
	ldr r1, [r0, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _0802FD4A
	ldr r0, _0802FDD4 @ =gUnknown_2023BCE
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0802FDD8 @ =gUnknown_2024284
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_0802FD4A:
	ldr r4, _0802FDDC @ =gUnknown_202063C
	ldr r0, _0802FDE0 @ =gUnknown_3004FFC
	ldrb r2, [r5]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r0, r4, 0
	adds r0, 0x1C
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _0802FDE4 @ =nullsub_8
	cmp r1, r0
	bne _0802FDC4
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0802FDC4
	adds r0, r3, r4
	bl sub_8007280
	ldr r4, _0802FDE8 @ =gUnknown_3004FF0
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0802FDD4 @ =gUnknown_2023BCE
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0802FDD8 @ =gUnknown_2024284
	adds r1, r2
	movs r2, 0
	bl sub_8049D98
	ldrb r0, [r5]
	bl sub_804BD94
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl sub_80481D4
	ldrb r0, [r5]
	bl sub_8034BB4
	ldr r1, _0802FDEC @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FDF0 @ =sub_802FBF4
	str r1, [r0]
_0802FDC4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FDCC: .4byte gUnknown_2024018
_0802FDD0: .4byte gUnknown_2023BC4
_0802FDD4: .4byte gUnknown_2023BCE
_0802FDD8: .4byte gUnknown_2024284
_0802FDDC: .4byte gUnknown_202063C
_0802FDE0: .4byte gUnknown_3004FFC
_0802FDE4: .4byte nullsub_8
_0802FDE8: .4byte gUnknown_3004FF0
_0802FDEC: .4byte gUnknown_3004FE0
_0802FDF0: .4byte sub_802FBF4
	thumb_func_end sub_802FD18

	thumb_func_start sub_802FDF4
sub_802FDF4: @ 802FDF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80721F0
	lsls r0, 24
	cmp r0, 0
	bne _0802FE16
	ldr r0, _0802FE1C @ =gMPlay_BGM
	ldr r1, _0802FE20 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	adds r0, r4, 0
	bl sub_8077508
_0802FE16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802FE1C: .4byte gMPlay_BGM
_0802FE20: .4byte 0x0000ffff
	thumb_func_end sub_802FDF4

	thumb_func_start sub_802FE24
sub_802FE24: @ 802FE24
	push {r4-r6,lr}
	ldr r5, _0802FE64 @ =gUnknown_2023BC4
	ldrb r0, [r5]
	ldr r6, _0802FE68 @ =gUnknown_3004FF0
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8049FD8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl sub_80481D4
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0802FE6C
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl sub_8048440
	b _0802FE86
	.align 2, 0
_0802FE64: .4byte gUnknown_2023BC4
_0802FE68: .4byte gUnknown_3004FF0
_0802FE6C:
	ldr r2, _0802FE8C @ =gUnknown_2023BCE
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0802FE90 @ =gUnknown_2024284
	adds r0, r2
	bl sub_8035244
	bl sub_802E33C
_0802FE86:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FE8C: .4byte gUnknown_2023BCE
_0802FE90: .4byte gUnknown_2024284
	thumb_func_end sub_802FE24

	thumb_func_start sub_802FE94
sub_802FE94: @ 802FE94
	push {lr}
	movs r0, 0
	bl sub_8002E64
	lsls r0, 16
	cmp r0, 0
	bne _0802FEA6
	bl sub_802E33C
_0802FEA6:
	pop {r0}
	bx r0
	thumb_func_end sub_802FE94

	thumb_func_start sub_802FEAC
sub_802FEAC: @ 802FEAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _0802FFAC @ =gUnknown_3005090
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	mov r8, r0
	ldrb r0, [r0, 0x8]
	mov r10, r0
	mov r1, r8
	ldrb r7, [r1, 0xC]
	str r7, [sp, 0x8]
	ldrh r2, [r1, 0xA]
	str r2, [sp, 0xC]
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0802FEF2
	ldr r1, _0802FFB0 @ =gUnknown_2023BCE
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r10, r0
	bne _0802FEF2
	b _08030008
_0802FEF2:
	movs r0, 0x64
	mov r1, r10
	muls r1, r0
	ldr r0, _0802FFB4 @ =gUnknown_2024284
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl sub_803FBE8
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x38
	bl sub_803FBE8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x19
	bl sub_803FBE8
	str r0, [sp, 0x4]
	ldr r3, _0802FFB8 @ =gUnknown_8253AE4
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _0802FFBC @ =gUnknown_8254784
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x13]
	movs r1, 0xCA
	lsls r1, 1
	muls r1, r2
	adds r4, r1
	adds r4, r3
	ldr r2, [r4]
	str r2, [sp]
	ldr r3, [sp, 0xC]
	lsls r1, r3, 16
	asrs r1, 16
	adds r0, r1
	cmp r0, r2
	bcc _0802FFE0
	adds r0, r6, 0
	movs r1, 0x19
	mov r2, sp
	bl sub_804037C
	adds r0, r6, 0
	bl sub_803E47C
	ldr r2, [sp]
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r2, r0
	ldr r0, [sp, 0xC]
	subs r2, r0, r2
	ldr r4, _0802FFC0 @ =gUnknown_2023BC4
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r1, 0xB
	bl sub_800E848
	strb r5, [r4]
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0802FFC8
	ldr r2, _0802FFB0 @ =gUnknown_2023BCE
	lsls r0, r7, 1
	adds r0, r2
	mov r1, r10
	ldrh r0, [r0]
	cmp r1, r0
	beq _0802FFA6
	movs r0, 0x2
	eors r7, r0
	lsls r0, r7, 1
	adds r0, r2
	ldrh r0, [r0]
	cmp r1, r0
	bne _0802FFC8
_0802FFA6:
	ldr r0, _0802FFC4 @ =sub_8030238
	b _0803000A
	.align 2, 0
_0802FFAC: .4byte gUnknown_3005090
_0802FFB0: .4byte gUnknown_2023BCE
_0802FFB4: .4byte gUnknown_2024284
_0802FFB8: .4byte gUnknown_8253AE4
_0802FFBC: .4byte gUnknown_8254784
_0802FFC0: .4byte gUnknown_2023BC4
_0802FFC4: .4byte sub_8030238
_0802FFC8:
	ldr r0, _0802FFD8 @ =gUnknown_3005090
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldr r0, _0802FFDC @ =sub_8030350
	b _0803000C
	.align 2, 0
_0802FFD8: .4byte gUnknown_3005090
_0802FFDC: .4byte sub_8030350
_0802FFE0:
	str r0, [sp, 0x4]
	add r2, sp, 0x4
	adds r0, r6, 0
	movs r1, 0x19
	bl sub_804037C
	ldr r1, _08030000 @ =gUnknown_3004FE0
	ldr r3, [sp, 0x8]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, _08030004 @ =sub_802FE94
	str r1, [r0]
	mov r0, r9
	bl sub_8077508
	b _0803000E
	.align 2, 0
_08030000: .4byte gUnknown_3004FE0
_08030004: .4byte sub_802FE94
_08030008:
	ldr r0, _08030020 @ =sub_8030024
_0803000A:
	mov r1, r8
_0803000C:
	str r0, [r1]
_0803000E:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030020: .4byte sub_8030024
	thumb_func_end sub_802FEAC

	thumb_func_start sub_8030024
sub_8030024: @ 8030024
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080300DC @ =gUnknown_3005090
	lsls r2, r0, 2
	mov r8, r2
	add r8, r0
	mov r0, r8
	lsls r0, 3
	mov r8, r0
	add r8, r1
	mov r2, r8
	ldrb r1, [r2, 0x8]
	movs r0, 0xA
	ldrsh r2, [r2, r0]
	mov r9, r2
	mov r2, r8
	ldrb r2, [r2, 0xC]
	mov r10, r2
	movs r0, 0x64
	adds r6, r1, 0
	muls r6, r0
	ldr r0, _080300E0 @ =gUnknown_2024284
	adds r6, r0
	adds r0, r6, 0
	movs r1, 0x38
	bl sub_803FBE8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0xB
	bl sub_803FBE8
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x19
	bl sub_803FBE8
	adds r3, r0, 0
	ldr r6, _080300E4 @ =gUnknown_8253AE4
	lsls r1, r4, 2
	ldr r2, _080300E8 @ =gUnknown_8254784
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r6
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	adds r4, r6
	ldr r2, [r4]
	subs r2, r1
	ldr r0, _080300EC @ =gUnknown_3004FF0
	add r0, r10
	ldrb r1, [r0]
	mov r0, r9
	negs r0, r0
	str r0, [sp]
	mov r0, r10
	bl sub_8048150
	movs r0, 0x1B
	bl sub_80722CC
	ldr r0, _080300F0 @ =sub_80300F4
	mov r1, r8
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080300DC: .4byte gUnknown_3005090
_080300E0: .4byte gUnknown_2024284
_080300E4: .4byte gUnknown_8253AE4
_080300E8: .4byte gUnknown_8254784
_080300EC: .4byte gUnknown_3004FF0
_080300F0: .4byte sub_80300F4
	thumb_func_end sub_8030024

	thumb_func_start sub_80300F4
sub_80300F4: @ 80300F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08030120 @ =gUnknown_3005090
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r6, r0, r1
	ldrh r1, [r6, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r6, r2]
	cmp r0, 0xC
	bgt _08030124
	adds r0, r1, 0x1
	strh r0, [r6, 0x1C]
	b _08030220
	.align 2, 0
_08030120: .4byte gUnknown_3005090
_08030124:
	ldrb r0, [r6, 0x8]
	mov r9, r0
	ldrh r2, [r6, 0xA]
	mov r10, r2
	ldrb r7, [r6, 0xC]
	ldr r5, _080301EC @ =gUnknown_3004FF0
	adds r5, r7, r5
	ldrb r1, [r5]
	adds r0, r7, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8049FD8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	bl sub_80481D4
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _08030220
	movs r0, 0x1B
	bl m4aSongNumStop
	movs r0, 0x64
	mov r1, r9
	muls r1, r0
	ldr r0, _080301F0 @ =gUnknown_2024284
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x38
	bl sub_803FBE8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x19
	bl sub_803FBE8
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0xB
	bl sub_803FBE8
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _080301F4 @ =gUnknown_8253AE4
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _080301F8 @ =gUnknown_8254784
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	adds r4, r0
	adds r4, r3
	ldr r1, [r4]
	str r1, [sp]
	mov r2, r10
	lsls r0, r2, 16
	asrs r4, r0, 16
	ldr r0, [sp, 0x4]
	adds r0, r4
	cmp r0, r1
	blt _08030204
	adds r0, r5, 0
	movs r1, 0x19
	mov r2, sp
	bl sub_804037C
	adds r0, r5, 0
	bl sub_803E47C
	ldr r2, [sp]
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r2, r0
	subs r2, r4, r2
	ldr r4, _080301FC @ =gUnknown_2023BC4
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r1, 0xB
	bl sub_800E848
	strb r5, [r4]
	ldr r0, _08030200 @ =sub_8030238
	str r0, [r6]
	b _08030220
	.align 2, 0
_080301EC: .4byte gUnknown_3004FF0
_080301F0: .4byte gUnknown_2024284
_080301F4: .4byte gUnknown_8253AE4
_080301F8: .4byte gUnknown_8254784
_080301FC: .4byte gUnknown_2023BC4
_08030200: .4byte sub_8030238
_08030204:
	str r0, [sp, 0x4]
	add r2, sp, 0x4
	adds r0, r5, 0
	movs r1, 0x19
	bl sub_804037C
	ldr r1, _08030230 @ =gUnknown_3004FE0
	lsls r0, r7, 2
	adds r0, r1
	ldr r1, _08030234 @ =sub_802FE94
	str r1, [r0]
	mov r0, r8
	bl sub_8077508
_08030220:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030230: .4byte gUnknown_3004FE0
_08030234: .4byte sub_802FE94
	thumb_func_end sub_80300F4

	thumb_func_start sub_8030238
sub_8030238: @ 8030238
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0803028C @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0xC]
	ldrb r6, [r0, 0x8]
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0803026C
	ldr r1, _08030290 @ =gUnknown_2023BCE
	movs r0, 0x2
	adds r2, r4, 0
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bne _0803026C
	adds r4, r2, 0
_0803026C:
	adds r0, r4, 0
	adds r1, r4, 0
	adds r2, r4, 0
	movs r3, 0
	bl sub_80341D8
	ldr r0, _0803028C @ =gUnknown_3005090
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08030294 @ =sub_8030298
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803028C: .4byte gUnknown_3005090
_08030290: .4byte gUnknown_2023BCE
_08030294: .4byte sub_8030298
	thumb_func_end sub_8030238

	thumb_func_start sub_8030298
sub_8030298: @ 8030298
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08030304 @ =gUnknown_3005090
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r2, r0, r1
	ldrb r5, [r2, 0xC]
	ldr r0, _08030308 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0803033A
	ldrb r4, [r2, 0x8]
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _0803030C @ =gUnknown_2024284
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x38
	bl sub_803FBE8
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08030318
	ldr r1, _08030310 @ =gUnknown_2023BCE
	movs r0, 0x2
	adds r2, r5, 0
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _08030318
	ldr r0, _08030314 @ =gUnknown_3004FF0
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, r7, 0
	movs r2, 0
	bl sub_8049D98
	b _0803032C
	.align 2, 0
_08030304: .4byte gUnknown_3005090
_08030308: .4byte gUnknown_2024018
_0803030C: .4byte gUnknown_2024284
_08030310: .4byte gUnknown_2023BCE
_08030314: .4byte gUnknown_3004FF0
_08030318:
	ldr r0, _08030340 @ =gUnknown_3004FF0
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0x64
	muls r1, r4
	ldr r2, _08030344 @ =gUnknown_2024284
	adds r1, r2
	movs r2, 0
	bl sub_8049D98
_0803032C:
	ldr r0, _08030348 @ =gUnknown_3005090
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0803034C @ =sub_8030350
	str r0, [r1]
_0803033A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030340: .4byte gUnknown_3004FF0
_08030344: .4byte gUnknown_2024284
_08030348: .4byte gUnknown_3005090
_0803034C: .4byte sub_8030350
	thumb_func_end sub_8030298

	thumb_func_start sub_8030350
sub_8030350: @ 8030350
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08030380 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0xC
	ldrsh r6, [r4, r0]
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_8072DF0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08030388
	ldr r0, _08030384 @ =sub_80303A8
	str r0, [r4]
	movs r0, 0
	strh r0, [r4, 0x26]
	b _08030398
	.align 2, 0
_08030380: .4byte gUnknown_3005090
_08030384: .4byte sub_80303A8
_08030388:
	ldr r0, _080303A0 @ =gUnknown_3004FE0
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, _080303A4 @ =sub_802FE94
	str r0, [r1]
	adds r0, r5, 0
	bl sub_8077508
_08030398:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080303A0: .4byte gUnknown_3004FE0
_080303A4: .4byte sub_802FE94
	thumb_func_end sub_8030350

	thumb_func_start sub_80303A8
sub_80303A8: @ 80303A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _080303FC @ =gUnknown_3005098
	adds r5, r0, r1
	ldrb r7, [r5, 0x4]
	adds r0, r7, 0
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r6, r1, 31
	ldr r0, _08030400 @ =gUnknown_2023D44
	adds r0, r7, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08030404 @ =gUnknown_202063C
	adds r4, r0, r1
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0x6
	bls _080303F0
	b _0803051C
_080303F0:
	lsls r0, 2
	ldr r1, _08030408 @ =_0803040C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080303FC: .4byte gUnknown_3005098
_08030400: .4byte gUnknown_2023D44
_08030404: .4byte gUnknown_202063C
_08030408: .4byte _0803040C
	.align 2, 0
_0803040C:
	.4byte _08030428
	.4byte _0803047C
	.4byte _08030486
	.4byte _080304C0
	.4byte _080304E0
	.4byte _080304DA
	.4byte _080304E8
_08030428:
	movs r0, 0
	bl sub_8002E64
	lsls r0, 16
	cmp r0, 0
	bne _0803051C
	cmp r6, 0
	bne _0803044C
	ldr r1, _08030444 @ =gUnknown_2022978
	ldrh r0, [r1]
	strh r0, [r5, 0x1C]
	ldr r2, _08030448 @ =gUnknown_202297A
	b _08030454
	.align 2, 0
_08030444: .4byte gUnknown_2022978
_08030448: .4byte gUnknown_202297A
_0803044C:
	ldr r1, _08030474 @ =gUnknown_202297C
	ldrh r0, [r1]
	strh r0, [r5, 0x1C]
	ldr r2, _08030478 @ =gUnknown_202297E
_08030454:
	ldrh r0, [r2]
	strh r0, [r5, 0x1A]
	ldrh r0, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r0, r3
	negs r0, r0
	adds r0, 0x20
	strh r0, [r1]
	ldrh r0, [r4, 0x26]
	ldrh r4, [r4, 0x22]
	adds r0, r4
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	b _080304E0
	.align 2, 0
_08030474: .4byte gUnknown_202297C
_08030478: .4byte gUnknown_202297E
_0803047C:
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8072E48
	b _080304E0
_08030486:
	movs r0, 0x58
	bl sub_80722CC
	bl sub_802679C
	cmp r0, 0
	beq _080304E0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r4, [r4, 0x22]
	adds r1, r4
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _080304BC @ =0x00002710
	movs r2, 0x1
	str r2, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	adds r2, r3, 0
	bl sub_811E5B8
	b _080304E0
	.align 2, 0
_080304BC: .4byte 0x00002710
_080304C0:
	bl sub_811E680
	lsls r0, 24
	cmp r0, 0
	bne _0803051C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _080304E0
_080304DA:
	adds r0, r6, 0
	bl sub_8073128
_080304E0:
	ldrh r0, [r5, 0x1E]
	adds r0, 0x1
	strh r0, [r5, 0x1E]
	b _0803051C
_080304E8:
	cmp r6, 0
	bne _08030500
	ldr r1, _080304F8 @ =gUnknown_2022978
	ldrh r0, [r5, 0x1C]
	strh r0, [r1]
	ldr r1, _080304FC @ =gUnknown_202297A
	b _08030508
	.align 2, 0
_080304F8: .4byte gUnknown_2022978
_080304FC: .4byte gUnknown_202297A
_08030500:
	ldr r1, _08030528 @ =gUnknown_202297C
	ldrh r0, [r5, 0x1C]
	strh r0, [r1]
	ldr r1, _0803052C @ =gUnknown_202297E
_08030508:
	ldrh r0, [r5, 0x1A]
	strh r0, [r1]
	ldr r0, _08030530 @ =gUnknown_3004FE0
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, _08030534 @ =sub_802FE94
	str r0, [r1]
	mov r0, r8
	bl sub_8077508
_0803051C:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030528: .4byte gUnknown_202297C
_0803052C: .4byte gUnknown_202297E
_08030530: .4byte gUnknown_3004FE0
_08030534: .4byte sub_802FE94
	thumb_func_end sub_80303A8

	thumb_func_start sub_8030538
sub_8030538: @ 8030538
	push {r4-r6,lr}
	ldr r6, _08030590 @ =gUnknown_202063C
	ldr r5, _08030594 @ =gUnknown_2023D44
	ldr r4, _08030598 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r6
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	cmp r0, 0xA0
	ble _08030588
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl sub_80085CC
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl sub_8007280
	ldr r1, _0803059C @ =gUnknown_3004FF0
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8048188
	bl sub_802E33C
_08030588:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030590: .4byte gUnknown_202063C
_08030594: .4byte gUnknown_2023D44
_08030598: .4byte gUnknown_2023BC4
_0803059C: .4byte gUnknown_3004FF0
	thumb_func_end sub_8030538

	thumb_func_start sub_80305A0
sub_80305A0: @ 80305A0
	push {r4-r6,lr}
	ldr r0, _080305FC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r6, _08030600 @ =gUnknown_2023BC4
	ldrb r2, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080305F4
	ldr r5, _08030604 @ =gUnknown_2023D44
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08030608 @ =gUnknown_202063C
	adds r0, r4
	bl sub_80077D8
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_8007280
	ldr r1, _0803060C @ =gUnknown_3004FF0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8048188
	bl sub_802E33C
_080305F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080305FC: .4byte gUnknown_2024018
_08030600: .4byte gUnknown_2023BC4
_08030604: .4byte gUnknown_2023D44
_08030608: .4byte gUnknown_202063C
_0803060C: .4byte gUnknown_3004FF0
	thumb_func_end sub_80305A0

	thumb_func_start sub_8030610
sub_8030610: @ 8030610
	push {lr}
	movs r0, 0
	bl sub_8002E64
	lsls r0, 16
	cmp r0, 0
	bne _08030622
	bl sub_802E33C
_08030622:
	pop {r0}
	bx r0
	thumb_func_end sub_8030610

	thumb_func_start sub_8030628
sub_8030628: @ 8030628
	push {r4,lr}
	ldr r0, _0803066C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08030666
	ldr r1, _08030670 @ =gUnknown_3004FE0
	ldr r2, _08030674 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030678 @ =sub_8030684
	str r1, [r0]
	ldr r3, _0803067C @ =gUnknown_3005090
	ldr r1, _08030680 @ =gUnknown_3004FFC
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldrb r4, [r1, 0x8]
	bl sub_8077508
	bl sub_8003ECC
	adds r0, r4, 0
	bl sub_81278DC
_08030666:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803066C: .4byte gUnknown_2037AB8
_08030670: .4byte gUnknown_3004FE0
_08030674: .4byte gUnknown_2023BC4
_08030678: .4byte sub_8030684
_0803067C: .4byte gUnknown_3005090
_08030680: .4byte gUnknown_3004FFC
	thumb_func_end sub_8030628

	thumb_func_start sub_8030684
sub_8030684: @ 8030684
	push {lr}
	ldr r0, _080306B4 @ =gUnknown_30030F0
	ldr r1, [r0, 0x4]
	ldr r0, _080306B8 @ =sub_8011100
	cmp r1, r0
	bne _080306F4
	ldr r0, _080306BC @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080306F4
	ldr r0, _080306C0 @ =gUnknown_203B0C0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080306CC
	ldr r0, _080306C4 @ =gUnknown_203B0C1
	ldrb r1, [r0]
	ldr r2, _080306C8 @ =gUnknown_203B0DC
	movs r0, 0x1
	bl sub_800E874
	b _080306D6
	.align 2, 0
_080306B4: .4byte gUnknown_30030F0
_080306B8: .4byte sub_8011100
_080306BC: .4byte gUnknown_2037AB8
_080306C0: .4byte gUnknown_203B0C0
_080306C4: .4byte gUnknown_203B0C1
_080306C8: .4byte gUnknown_203B0DC
_080306CC:
	movs r0, 0x1
	movs r1, 0x6
	movs r2, 0
	bl sub_800E874
_080306D6:
	ldr r1, _080306F8 @ =gUnknown_2022BC4
	ldr r0, _080306FC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _080306F0
	bl sub_8030B5C
_080306F0:
	bl sub_802E33C
_080306F4:
	pop {r0}
	bx r0
	.align 2, 0
_080306F8: .4byte gUnknown_2022BC4
_080306FC: .4byte gUnknown_2023BC4
	thumb_func_end sub_8030684

	thumb_func_start sub_8030700
sub_8030700: @ 8030700
	push {lr}
	ldr r0, _0803072C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08030728
	ldr r1, _08030730 @ =gUnknown_3004FE0
	ldr r0, _08030734 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030738 @ =sub_803073C
	str r1, [r0]
	bl nullsub_44
	bl sub_8003ECC
	bl sub_8107ECC
_08030728:
	pop {r0}
	bx r0
	.align 2, 0
_0803072C: .4byte gUnknown_2037AB8
_08030730: .4byte gUnknown_3004FE0
_08030734: .4byte gUnknown_2023BC4
_08030738: .4byte sub_803073C
	thumb_func_end sub_8030700

	thumb_func_start sub_803073C
sub_803073C: @ 803073C
	push {lr}
	ldr r0, _08030768 @ =gUnknown_30030F0
	ldr r1, [r0, 0x4]
	ldr r0, _0803076C @ =sub_8011100
	cmp r1, r0
	bne _08030762
	ldr r0, _08030770 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08030762
	ldr r0, _08030774 @ =gUnknown_203AD30
	ldrh r1, [r0]
	movs r0, 0x1
	bl sub_800E8AC
	bl sub_802E33C
_08030762:
	pop {r0}
	bx r0
	.align 2, 0
_08030768: .4byte gUnknown_30030F0
_0803076C: .4byte sub_8011100
_08030770: .4byte gUnknown_2037AB8
_08030774: .4byte gUnknown_203AD30
	thumb_func_end sub_803073C

	thumb_func_start sub_8030778
sub_8030778: @ 8030778
	push {lr}
	ldr r0, _080307A8 @ =gUnknown_2024005
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803079E
	ldr r0, _080307AC @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _080307B0 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080307A2
_0803079E:
	bl sub_802E33C
_080307A2:
	pop {r0}
	bx r0
	.align 2, 0
_080307A8: .4byte gUnknown_2024005
_080307AC: .4byte gUnknown_2024018
_080307B0: .4byte gUnknown_2023BC4
	thumb_func_end sub_8030778

	thumb_func_start sub_80307B4
sub_80307B4: @ 80307B4
	push {r4,lr}
	ldr r1, _080307F0 @ =gUnknown_2023D44
	ldr r0, _080307F4 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _080307F8 @ =gUnknown_202063C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _08030800
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080307FC @ =gUnknown_2024005
	strb r3, [r0]
	bl sub_802E33C
	b _0803082A
	.align 2, 0
_080307F0: .4byte gUnknown_2023D44
_080307F4: .4byte gUnknown_2023BC4
_080307F8: .4byte gUnknown_202063C
_080307FC: .4byte gUnknown_2024005
_08030800:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08030824
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08030824:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_0803082A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80307B4

	thumb_func_start sub_8030830
sub_8030830: @ 8030830
	push {r4-r7,lr}
	ldr r0, _08030890 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r1, 9
	ldr r3, _08030894 @ =gUnknown_2022BC8
	ldr r2, _08030898 @ =gUnknown_3004FF8
	movs r0, 0
	strb r0, [r2]
	movs r5, 0
	ldr r6, _0803089C @ =gUnknown_202298C
	adds r4, r1, r3
	adds r7, r2, 0
_08030848:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_8030A14
	adds r0, r6, 0
	ldr r1, _080308A0 @ =gUnknown_83FE770
	bl sub_8008D84
	ldrh r1, [r4]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080308A4 @ =gUnknown_8247094
	adds r1, r0
	adds r0, r6, 0
	bl sub_8008DA4
	adds r1, r5, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_80D87BC
	ldrh r0, [r4]
	cmp r0, 0
	beq _08030880
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
_08030880:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08030848
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030890: .4byte gUnknown_2023BC4
_08030894: .4byte gUnknown_2022BC8
_08030898: .4byte gUnknown_3004FF8
_0803089C: .4byte gUnknown_202298C
_080308A0: .4byte gUnknown_83FE770
_080308A4: .4byte gUnknown_8247094
	thumb_func_end sub_8030830

	thumb_func_start sub_80308A8
sub_80308A8: @ 80308A8
	push {r4,lr}
	ldr r4, _080308C4 @ =gUnknown_202298C
	ldr r1, _080308C8 @ =gUnknown_83FE766
	adds r0, r4, 0
	bl sub_8008D84
	adds r0, r4, 0
	movs r1, 0x7
	bl sub_80D87BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080308C4: .4byte gUnknown_202298C
_080308C8: .4byte gUnknown_83FE766
	thumb_func_end sub_80308A8

	thumb_func_start sub_80308CC
sub_80308CC: @ 80308CC
	push {r4-r7,lr}
	ldr r5, _08030930 @ =gUnknown_2022BC4
	ldr r7, _08030934 @ =gUnknown_2023BC4
	ldrb r0, [r7]
	lsls r0, 9
	adds r1, r5, 0x2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08030928
	bl sub_80D89DC
	ldrb r1, [r7]
	lsls r4, r1, 9
	adds r0, r5, 0x4
	adds r4, r0
	ldr r6, _08030938 @ =gUnknown_202298C
	ldr r5, _0803093C @ =gUnknown_2023FFC
	adds r1, r5
	adds r0, r4, 0
	adds r0, 0x8
	ldrb r1, [r1]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r6, 0
	movs r2, 0x1
	movs r3, 0x2
	bl sub_8008E78
	movs r1, 0xBA
	strb r1, [r0]
	adds r0, 0x1
	ldrb r1, [r7]
	adds r1, r5
	adds r4, 0xC
	ldrb r1, [r1]
	adds r4, r1
	ldrb r1, [r4]
	movs r2, 0x1
	movs r3, 0x2
	bl sub_8008E78
	adds r0, r6, 0
	movs r1, 0x9
	bl sub_80D87BC
_08030928:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030930: .4byte gUnknown_2022BC4
_08030934: .4byte gUnknown_2023BC4
_08030938: .4byte gUnknown_202298C
_0803093C: .4byte gUnknown_2023FFC
	thumb_func_end sub_80308CC

	thumb_func_start sub_8030940
sub_8030940: @ 8030940
	push {r4-r6,lr}
	ldr r5, _080309AC @ =gUnknown_2023BC4
	ldrb r4, [r5]
	lsls r4, 9
	ldr r0, _080309B0 @ =gUnknown_2022BC8
	adds r4, r0
	ldr r6, _080309B4 @ =gUnknown_202298C
	ldr r1, _080309B8 @ =gUnknown_83FE76A
	adds r0, r6, 0
	bl sub_8008D84
	adds r3, r0, 0
	movs r0, 0xFC
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0x6
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0x1
	strb r0, [r3]
	adds r3, 0x1
	ldr r1, _080309BC @ =gUnknown_83FE770
	adds r0, r3, 0
	bl sub_8008D84
	adds r3, r0, 0
	ldr r2, _080309C0 @ =gUnknown_8250C04
	ldr r1, _080309C4 @ =gUnknown_2023FFC
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r0
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _080309C8 @ =gUnknown_824F1A0
	adds r1, r0
	adds r0, r3, 0
	bl sub_8008D84
	adds r0, r6, 0
	movs r1, 0x8
	bl sub_80D87BC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080309AC: .4byte gUnknown_2023BC4
_080309B0: .4byte gUnknown_2022BC8
_080309B4: .4byte gUnknown_202298C
_080309B8: .4byte gUnknown_83FE76A
_080309BC: .4byte gUnknown_83FE770
_080309C0: .4byte gUnknown_8250C04
_080309C4: .4byte gUnknown_2023FFC
_080309C8: .4byte gUnknown_824F1A0
	thumb_func_end sub_8030940

	thumb_func_start sub_80309CC
sub_80309CC: @ 80309CC
	push {lr}
	sub sp, 0x10
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r1, 24
	lsrs r1, 24
	add r2, sp, 0xC
	adds r0, r1, 0x1
	strh r0, [r2]
	adds r0, r2, 0
	adds r1, 0x2
	strh r1, [r0, 0x2]
	movs r1, 0x1
	adds r0, r3, 0
	ands r0, r1
	lsls r2, r0, 3
	adds r2, r0
	adds r2, 0x1
	movs r0, 0x2
	ands r3, r0
	adds r3, 0x37
	str r1, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	bl sub_8002228
	movs r0, 0
	bl sub_80020BC
	add sp, 0x10
	pop {r0}
	bx r0
	thumb_func_end sub_80309CC

	thumb_func_start sub_8030A14
sub_8030A14: @ 8030A14
	push {lr}
	sub sp, 0x10
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	add r0, sp, 0xC
	movs r1, 0x20
	strh r1, [r0]
	strh r1, [r0, 0x2]
	movs r1, 0x1
	adds r0, r3, 0
	ands r0, r1
	lsls r2, r0, 3
	adds r2, r0
	adds r2, 0x1
	movs r0, 0x2
	ands r3, r0
	adds r3, 0x37
	str r1, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	bl sub_8002228
	movs r0, 0
	bl sub_80020BC
	add sp, 0x10
	pop {r0}
	bx r0
	thumb_func_end sub_8030A14

	thumb_func_start sub_8030A54
sub_8030A54: @ 8030A54
	push {r4,lr}
	sub sp, 0x10
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	add r0, sp, 0xC
	movs r4, 0x1
	strh r4, [r0]
	movs r1, 0x2
	strh r1, [r0, 0x2]
	adds r0, r3, 0
	ands r0, r4
	lsls r2, r0, 3
	subs r2, r0
	adds r2, 0x10
	lsls r2, 24
	lsrs r2, 24
	ands r3, r1
	adds r3, 0x23
	str r4, [sp]
	str r1, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	bl sub_8002228
	movs r0, 0
	bl sub_80020BC
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8030A54

	thumb_func_start sub_8030A98
sub_8030A98: @ 8030A98
	push {lr}
	sub sp, 0x10
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	add r0, sp, 0xC
	movs r1, 0x20
	strh r1, [r0]
	strh r1, [r0, 0x2]
	movs r1, 0x1
	adds r0, r3, 0
	ands r0, r1
	lsls r2, r0, 3
	subs r2, r0
	adds r2, 0x10
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x2
	ands r3, r0
	adds r3, 0x23
	str r1, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	add r1, sp, 0xC
	bl sub_8002228
	movs r0, 0
	bl sub_80020BC
	add sp, 0x10
	pop {r0}
	bx r0
	thumb_func_end sub_8030A98

	thumb_func_start sub_8030ADC
sub_8030ADC: @ 8030ADC
	push {lr}
	ldr r0, _08030AE8 @ =sub_8077764
	bl sub_8000544
	pop {r0}
	bx r0
	.align 2, 0
_08030AE8: .4byte sub_8077764
	thumb_func_end sub_8030ADC

	thumb_func_start sub_8030AEC
sub_8030AEC: @ 8030AEC
	push {lr}
	ldr r0, _08030AF8 @ =sub_8077764
	bl sub_8000544
	pop {r0}
	bx r0
	.align 2, 0
_08030AF8: .4byte sub_8077764
	thumb_func_end sub_8030AEC

	thumb_func_start sub_8030AFC
sub_8030AFC: @ 8030AFC
	push {lr}
	ldr r0, _08030B24 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _08030B28 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08030B1E
	bl sub_802E33C
_08030B1E:
	pop {r0}
	bx r0
	.align 2, 0
_08030B24: .4byte gUnknown_2024018
_08030B28: .4byte gUnknown_2023BC4
	thumb_func_end sub_8030AFC

	thumb_func_start sub_8030B2C
sub_8030B2C: @ 8030B2C
	push {lr}
	ldr r0, _08030B54 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _08030B58 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08030B4E
	bl sub_802E33C
_08030B4E:
	pop {r0}
	bx r0
	.align 2, 0
_08030B54: .4byte gUnknown_2024018
_08030B58: .4byte gUnknown_2023BC4
	thumb_func_end sub_8030B2C

	thumb_func_start sub_8030B5C
sub_8030B5C: @ 8030B5C
	push {lr}
	ldr r0, _08030B80 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08030B7C
	ldr r0, _08030B84 @ =gUnknown_2022974
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08030B88 @ =gUnknown_2022976
	strh r1, [r0]
	ldr r0, _08030B8C @ =gUnknown_83FE714
	movs r1, 0
	bl sub_80D87BC
_08030B7C:
	pop {r0}
	bx r0
	.align 2, 0
_08030B80: .4byte gUnknown_2022B4C
_08030B84: .4byte gUnknown_2022974
_08030B88: .4byte gUnknown_2022976
_08030B8C: .4byte gUnknown_83FE714
	thumb_func_end sub_8030B5C

	thumb_func_start sub_8030B90
sub_8030B90: @ 8030B90
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _08030BBC @ =gUnknown_2022BC4
	ldr r0, _08030BC0 @ =gUnknown_2023BC4
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _08030BC8
	ldr r0, _08030BC4 @ =gUnknown_2023BCE
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl sub_8030C04
	adds r6, r0, 0
	b _08030BEA
	.align 2, 0
_08030BBC: .4byte gUnknown_2022BC4
_08030BC0: .4byte gUnknown_2023BC4
_08030BC4: .4byte gUnknown_2023BCE
_08030BC8:
	ldrb r4, [r1]
	movs r5, 0
_08030BCC:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08030BE2
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl sub_8030C04
	adds r6, r0
_08030BE2:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _08030BCC
_08030BEA:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl sub_800E708
	bl sub_802E33C
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8030B90

	thumb_func_start sub_8030C04
sub_8030C04: @ 8030C04
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _08030C38 @ =gUnknown_2022BC4
	ldr r3, _08030C3C @ =gUnknown_2023BC4
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _08030C2E
	bl _0803139A
_08030C2E:
	lsls r0, 2
	ldr r1, _08030C40 @ =_08030C44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030C38: .4byte gUnknown_2022BC4
_08030C3C: .4byte gUnknown_2023BC4
_08030C40: .4byte _08030C44
	.align 2, 0
_08030C44:
	.4byte _08030D34
	.4byte _08030F58
	.4byte _08030F68
	.4byte _08030F78
	.4byte _08030FE0
	.4byte _08030FE0
	.4byte _08030FE0
	.4byte _08030FE0
	.4byte _08030FFC
	.4byte _08031038
	.4byte _08031038
	.4byte _08031038
	.4byte _08031038
	.4byte _0803139A
	.4byte _0803139A
	.4byte _0803139A
	.4byte _0803139A
	.4byte _08031054
	.4byte _08031064
	.4byte _08031094
	.4byte _080310A4
	.4byte _080310B4
	.4byte _080310C4
	.4byte _080310D4
	.4byte _080310E4
	.4byte _080310F4
	.4byte _08031104
	.4byte _08031114
	.4byte _08031124
	.4byte _08031134
	.4byte _08031144
	.4byte _08031154
	.4byte _080311A4
	.4byte _080311B4
	.4byte _080311C4
	.4byte _080311D4
	.4byte _080311E4
	.4byte _080311F4
	.4byte _08031204
	.4byte _08031214
	.4byte _08031224
	.4byte _08031258
	.4byte _08031268
	.4byte _08031278
	.4byte _08031288
	.4byte _08031298
	.4byte _080312A8
	.4byte _080312B8
	.4byte _080312C8
	.4byte _080312E8
	.4byte _080312F8
	.4byte _08031308
	.4byte _08031318
	.4byte _08031328
	.4byte _08031338
	.4byte _08031348
	.4byte _08031358
	.4byte _08031368
	.4byte _08031378
	.4byte _08031388
_08030D34:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08030F48 @ =gUnknown_2024284
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl sub_803FBE8
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl sub_803FBE8
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_08030D80:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl sub_803FBE8
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl sub_803FBE8
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _08030D80
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08030F48 @ =gUnknown_2024284
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl sub_803FBE8
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_803FBE8
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl sub_803FBE8
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl sub_803FBE8
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl sub_803FBE8
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _08030F4C @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl sub_803FBE8
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl sub_803FBE8
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _08030F50 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl sub_803FBE8
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _08030F54 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl sub_803FBE8
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl sub_803FBE8
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl sub_803FBE8
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl sub_803FBE8
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl sub_803FBE8
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl sub_803FBE8
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl sub_803FBE8
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl sub_803FBE8
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl sub_803FBE8
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl sub_803FBE8
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl sub_803FBE8
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl sub_803FBE8
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl sub_803FBE8
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_803FBE8
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl sub_803FBE8
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl sub_8008CF4
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl sub_803FBE8
	mov r2, sp
	movs r6, 0
_08030F38:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _08030F38
	b _0803139A
	.align 2, 0
_08030F48: .4byte gUnknown_2024284
_08030F4C: .4byte 0xfffffc1f
_08030F50: .4byte 0xfff07fff
_08030F54: .4byte 0xfffffe0f
_08030F58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08030F64 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0xB
	b _080312D2
	.align 2, 0
_08030F64: .4byte gUnknown_2024284
_08030F68:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08030F74 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0xC
	b _080312D2
	.align 2, 0
_08030F74: .4byte gUnknown_2024284
_08030F78:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08030FDC @ =gUnknown_2024284
	adds r4, r1, r0
	mov r8, r9
_08030F8E:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl sub_803FBE8
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl sub_803FBE8
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _08030F8E
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08030FDC @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x15
	bl sub_803FBE8
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_08030FCC:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _08030FCC
	b _0803139A
	.align 2, 0
_08030FDC: .4byte gUnknown_2024284
_08030FE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08030FF8 @ =gUnknown_2024284
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _080312D2
	.align 2, 0
_08030FF8: .4byte gUnknown_2024284
_08030FFC:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _08031034 @ =gUnknown_2024284
	mov r8, r2
_08031008:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl sub_803FBE8
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _08031008
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031034 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x15
	bl sub_803FBE8
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _0803139A
	.align 2, 0
_08031034: .4byte gUnknown_2024284
_08031038:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031050 @ =gUnknown_2024284
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _08031392
	.align 2, 0
_08031050: .4byte gUnknown_2024284
_08031054:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031060 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x1
	b _0803106E
	.align 2, 0
_08031060: .4byte gUnknown_2024284
_08031064:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031090 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x19
_0803106E:
	bl sub_803FBE8
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _0803139A
	.align 2, 0
_08031090: .4byte gUnknown_2024284
_08031094:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080310A0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x1A
	b _08031392
	.align 2, 0
_080310A0: .4byte gUnknown_2024284
_080310A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080310B0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x1B
	b _08031392
	.align 2, 0
_080310B0: .4byte gUnknown_2024284
_080310B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080310C0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x1C
	b _08031392
	.align 2, 0
_080310C0: .4byte gUnknown_2024284
_080310C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080310D0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x1D
	b _08031392
	.align 2, 0
_080310D0: .4byte gUnknown_2024284
_080310D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080310E0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x1E
	b _08031392
	.align 2, 0
_080310E0: .4byte gUnknown_2024284
_080310E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080310F0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x1F
	b _08031392
	.align 2, 0
_080310F0: .4byte gUnknown_2024284
_080310F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031100 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x20
	b _08031392
	.align 2, 0
_08031100: .4byte gUnknown_2024284
_08031104:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031110 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x22
	b _08031392
	.align 2, 0
_08031110: .4byte gUnknown_2024284
_08031114:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031120 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x23
	b _08031392
	.align 2, 0
_08031120: .4byte gUnknown_2024284
_08031124:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031130 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x24
	b _08031392
	.align 2, 0
_08031130: .4byte gUnknown_2024284
_08031134:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031140 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x25
	b _08031392
	.align 2, 0
_08031140: .4byte gUnknown_2024284
_08031144:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031150 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x26
	b _08031392
	.align 2, 0
_08031150: .4byte gUnknown_2024284
_08031154:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080311A0 @ =gUnknown_2024284
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl sub_803FBE8
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl sub_803FBE8
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl sub_803FBE8
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl sub_803FBE8
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl sub_803FBE8
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl sub_803FBE8
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _0803139A
	.align 2, 0
_080311A0: .4byte gUnknown_2024284
_080311A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080311B0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x27
	b _08031392
	.align 2, 0
_080311B0: .4byte gUnknown_2024284
_080311B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080311C0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x28
	b _08031392
	.align 2, 0
_080311C0: .4byte gUnknown_2024284
_080311C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080311D0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x29
	b _08031392
	.align 2, 0
_080311D0: .4byte gUnknown_2024284
_080311D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080311E0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x2A
	b _08031392
	.align 2, 0
_080311E0: .4byte gUnknown_2024284
_080311E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080311F0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x2B
	b _08031392
	.align 2, 0
_080311F0: .4byte gUnknown_2024284
_080311F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031200 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x2C
	b _08031392
	.align 2, 0
_08031200: .4byte gUnknown_2024284
_08031204:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031210 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0
	b _0803122E
	.align 2, 0
_08031210: .4byte gUnknown_2024284
_08031214:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031220 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x9
	b _080312D2
	.align 2, 0
_08031220: .4byte gUnknown_2024284
_08031224:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031254 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x37
_0803122E:
	bl sub_803FBE8
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _0803139A
	.align 2, 0
_08031254: .4byte gUnknown_2024284
_08031258:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031264 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x38
	b _08031392
	.align 2, 0
_08031264: .4byte gUnknown_2024284
_08031268:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031274 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x39
	b _080312D2
	.align 2, 0
_08031274: .4byte gUnknown_2024284
_08031278:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031284 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x3A
	b _080312D2
	.align 2, 0
_08031284: .4byte gUnknown_2024284
_08031288:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031294 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x3B
	b _080312D2
	.align 2, 0
_08031294: .4byte gUnknown_2024284
_08031298:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080312A4 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x3C
	b _080312D2
	.align 2, 0
_080312A4: .4byte gUnknown_2024284
_080312A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080312B4 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x3D
	b _080312D2
	.align 2, 0
_080312B4: .4byte gUnknown_2024284
_080312B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080312C4 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x3E
	b _080312D2
	.align 2, 0
_080312C4: .4byte gUnknown_2024284
_080312C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080312E4 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x3F
_080312D2:
	bl sub_803FBE8
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _0803139A
	.align 2, 0
_080312E4: .4byte gUnknown_2024284
_080312E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080312F4 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x16
	b _08031392
	.align 2, 0
_080312F4: .4byte gUnknown_2024284
_080312F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031304 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x17
	b _08031392
	.align 2, 0
_08031304: .4byte gUnknown_2024284
_08031308:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031314 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x18
	b _08031392
	.align 2, 0
_08031314: .4byte gUnknown_2024284
_08031318:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031324 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x21
	b _08031392
	.align 2, 0
_08031324: .4byte gUnknown_2024284
_08031328:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031334 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x2F
	b _08031392
	.align 2, 0
_08031334: .4byte gUnknown_2024284
_08031338:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031344 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x30
	b _08031392
	.align 2, 0
_08031344: .4byte gUnknown_2024284
_08031348:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031354 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x32
	b _08031392
	.align 2, 0
_08031354: .4byte gUnknown_2024284
_08031358:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031364 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x33
	b _08031392
	.align 2, 0
_08031364: .4byte gUnknown_2024284
_08031368:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031374 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x34
	b _08031392
	.align 2, 0
_08031374: .4byte gUnknown_2024284
_08031378:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031384 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x35
	b _08031392
	.align 2, 0
_08031384: .4byte gUnknown_2024284
_08031388:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080313AC @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x36
_08031392:
	bl sub_803FBE8
	strb r0, [r7]
	movs r6, 0x1
_0803139A:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080313AC: .4byte gUnknown_2024284
	thumb_func_end sub_8030C04

	thumb_func_start sub_80313B0
sub_80313B0: @ 80313B0
	push {r4-r7,lr}
	sub sp, 0x58
	ldr r2, _08031428 @ =gUnknown_2023BCE
	ldr r5, _0803142C @ =gUnknown_2023BC4
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r3, _08031430 @ =gUnknown_2022BC4
	lsls r1, 9
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r2, [r0]
	ldr r0, _08031434 @ =gUnknown_2024284
	adds r0, r2, r0
	adds r6, r4, r0
	mov r0, sp
	adds r4, r0, r2
	movs r2, 0
	adds r0, r3, 0x2
	adds r1, r0
	adds r7, r5, 0
	mov r12, r3
	ldrb r1, [r1]
	cmp r2, r1
	bcs _08031406
	adds r3, r0, 0
_080313EC:
	adds r1, r4, r2
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080313EC
_08031406:
	ldrb r0, [r7]
	lsls r0, 9
	mov r1, r12
	adds r1, 0x2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	adds r2, r4, 0
	bl sub_800E708
	bl sub_802E33C
	add sp, 0x58
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031428: .4byte gUnknown_2023BCE
_0803142C: .4byte gUnknown_2023BC4
_08031430: .4byte gUnknown_2022BC4
_08031434: .4byte gUnknown_2024284
	thumb_func_end sub_80313B0

	thumb_func_start sub_8031438
sub_8031438: @ 8031438
	push {r4,r5,lr}
	ldr r1, _0803145C @ =gUnknown_2022BC4
	ldr r0, _08031460 @ =gUnknown_2023BC4
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _08031468
	ldr r0, _08031464 @ =gUnknown_2023BCE
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_8031490
	b _08031486
	.align 2, 0
_0803145C: .4byte gUnknown_2022BC4
_08031460: .4byte gUnknown_2023BC4
_08031464: .4byte gUnknown_2023BCE
_08031468:
	ldrb r4, [r1]
	movs r5, 0
_0803146C:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0803147A
	adds r0, r5, 0
	bl sub_8031490
_0803147A:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0803146C
_08031486:
	bl sub_802E33C
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8031438

	thumb_func_start sub_8031490
sub_8031490: @ 8031490
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080314C8 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _080314CC @ =gUnknown_2022BC7
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _080314BC
	bl _08031E56
_080314BC:
	lsls r0, 2
	ldr r1, _080314D0 @ =_080314D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080314C8: .4byte gUnknown_2023BC4
_080314CC: .4byte gUnknown_2022BC7
_080314D0: .4byte _080314D4
	.align 2, 0
_080314D4:
	.4byte _080315C4
	.4byte _0803175C
	.4byte _0803177C
	.4byte _0803179C
	.4byte _080317F4
	.4byte _080317F4
	.4byte _080317F4
	.4byte _080317F4
	.4byte _0803181C
	.4byte _08031880
	.4byte _08031880
	.4byte _08031880
	.4byte _08031880
	.4byte _08031E56
	.4byte _08031E56
	.4byte _08031E56
	.4byte _08031E56
	.4byte _080318B0
	.4byte _080318D0
	.4byte _080318F0
	.4byte _08031910
	.4byte _08031930
	.4byte _08031950
	.4byte _08031970
	.4byte _08031990
	.4byte _080319B0
	.4byte _080319D0
	.4byte _080319F0
	.4byte _08031A10
	.4byte _08031A30
	.4byte _08031A50
	.4byte _08031A70
	.4byte _08031AE0
	.4byte _08031B00
	.4byte _08031B20
	.4byte _08031B40
	.4byte _08031B60
	.4byte _08031B80
	.4byte _08031BA0
	.4byte _08031BC0
	.4byte _08031BE0
	.4byte _08031C00
	.4byte _08031C20
	.4byte _08031C40
	.4byte _08031C60
	.4byte _08031C80
	.4byte _08031CA0
	.4byte _08031CC0
	.4byte _08031CE0
	.4byte _08031D00
	.4byte _08031D20
	.4byte _08031D40
	.4byte _08031D60
	.4byte _08031D80
	.4byte _08031DA0
	.4byte _08031DC0
	.4byte _08031DE0
	.4byte _08031E00
	.4byte _08031E20
	.4byte _08031E40
_080315C4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08031758 @ =gUnknown_2024284
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl sub_804037C
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl sub_804037C
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_0803162A:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl sub_804037C
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl sub_804037C
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0803162A
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08031758 @ =gUnknown_2024284
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl sub_804037C
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl sub_804037C
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl sub_804037C
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl sub_804037C
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl sub_804037C
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl sub_804037C
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031758: .4byte gUnknown_2024284
_0803175C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031774 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031778 @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031774: .4byte gUnknown_2024284
_08031778: .4byte gUnknown_2023BC4
_0803177C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031794 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031798 @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031794: .4byte gUnknown_2024284
_08031798: .4byte gUnknown_2023BC4
_0803179C:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080317F0 @ =gUnknown_2024284
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_080317B6:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl sub_804037C
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl sub_804037C
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _080317B6
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080317F0 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl sub_804037C
	b _08031E56
	.align 2, 0
_080317F0: .4byte gUnknown_2024284
_080317F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031810 @ =gUnknown_2024284
	adds r0, r1
	ldr r3, _08031814 @ =gUnknown_2022BC4
	ldr r1, _08031818 @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _08031898
	.align 2, 0
_08031810: .4byte gUnknown_2024284
_08031814: .4byte gUnknown_2022BC4
_08031818: .4byte gUnknown_2023BC4
_0803181C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08031878 @ =gUnknown_2024284
	adds r4, r0
	ldr r5, _0803187C @ =gUnknown_2023BC4
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl sub_804037C
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl sub_804037C
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl sub_804037C
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl sub_804037C
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031878: .4byte gUnknown_2024284
_0803187C: .4byte gUnknown_2023BC4
_08031880:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080318A4 @ =gUnknown_2024284
	adds r0, r1
	ldr r3, _080318A8 @ =gUnknown_2022BC4
	ldr r1, _080318AC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_08031898:
	adds r3, 0x3
	adds r2, r3
	bl sub_804037C
	b _08031E56
	.align 2, 0
_080318A4: .4byte gUnknown_2024284
_080318A8: .4byte gUnknown_2022BC4
_080318AC: .4byte gUnknown_2023BC4
_080318B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080318C8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _080318CC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl sub_804037C
	b _08031E56
	.align 2, 0
_080318C8: .4byte gUnknown_2024284
_080318CC: .4byte gUnknown_2023BC4
_080318D0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080318E8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _080318EC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl sub_804037C
	b _08031E56
	.align 2, 0
_080318E8: .4byte gUnknown_2024284
_080318EC: .4byte gUnknown_2023BC4
_080318F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031908 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _0803190C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031908: .4byte gUnknown_2024284
_0803190C: .4byte gUnknown_2023BC4
_08031910:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031928 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _0803192C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031928: .4byte gUnknown_2024284
_0803192C: .4byte gUnknown_2023BC4
_08031930:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031948 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _0803194C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031948: .4byte gUnknown_2024284
_0803194C: .4byte gUnknown_2023BC4
_08031950:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031968 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _0803196C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031968: .4byte gUnknown_2024284
_0803196C: .4byte gUnknown_2023BC4
_08031970:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031988 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _0803198C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031988: .4byte gUnknown_2024284
_0803198C: .4byte gUnknown_2023BC4
_08031990:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080319A8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _080319AC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl sub_804037C
	b _08031E56
	.align 2, 0
_080319A8: .4byte gUnknown_2024284
_080319AC: .4byte gUnknown_2023BC4
_080319B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080319C8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _080319CC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl sub_804037C
	b _08031E56
	.align 2, 0
_080319C8: .4byte gUnknown_2024284
_080319CC: .4byte gUnknown_2023BC4
_080319D0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _080319E8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _080319EC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl sub_804037C
	b _08031E56
	.align 2, 0
_080319E8: .4byte gUnknown_2024284
_080319EC: .4byte gUnknown_2023BC4
_080319F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031A08 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031A0C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031A08: .4byte gUnknown_2024284
_08031A0C: .4byte gUnknown_2023BC4
_08031A10:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031A28 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031A2C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031A28: .4byte gUnknown_2024284
_08031A2C: .4byte gUnknown_2023BC4
_08031A30:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031A48 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031A4C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031A48: .4byte gUnknown_2024284
_08031A4C: .4byte gUnknown_2023BC4
_08031A50:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031A68 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031A6C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031A68: .4byte gUnknown_2024284
_08031A6C: .4byte gUnknown_2023BC4
_08031A70:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08031AD8 @ =gUnknown_2024284
	adds r4, r0
	ldr r5, _08031ADC @ =gUnknown_2023BC4
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl sub_804037C
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl sub_804037C
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl sub_804037C
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl sub_804037C
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl sub_804037C
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _08031B90
	.align 2, 0
_08031AD8: .4byte gUnknown_2024284
_08031ADC: .4byte gUnknown_2023BC4
_08031AE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031AF8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031AFC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031AF8: .4byte gUnknown_2024284
_08031AFC: .4byte gUnknown_2023BC4
_08031B00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031B18 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031B1C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031B18: .4byte gUnknown_2024284
_08031B1C: .4byte gUnknown_2023BC4
_08031B20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031B38 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031B3C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031B38: .4byte gUnknown_2024284
_08031B3C: .4byte gUnknown_2023BC4
_08031B40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031B58 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031B5C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031B58: .4byte gUnknown_2024284
_08031B5C: .4byte gUnknown_2023BC4
_08031B60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031B78 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031B7C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031B78: .4byte gUnknown_2024284
_08031B7C: .4byte gUnknown_2023BC4
_08031B80:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031B98 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031B9C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_08031B90:
	movs r1, 0x2C
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031B98: .4byte gUnknown_2024284
_08031B9C: .4byte gUnknown_2023BC4
_08031BA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031BB8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031BBC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031BB8: .4byte gUnknown_2024284
_08031BBC: .4byte gUnknown_2023BC4
_08031BC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031BD8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031BDC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031BD8: .4byte gUnknown_2024284
_08031BDC: .4byte gUnknown_2023BC4
_08031BE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031BF8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031BFC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031BF8: .4byte gUnknown_2024284
_08031BFC: .4byte gUnknown_2023BC4
_08031C00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031C18 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031C1C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031C18: .4byte gUnknown_2024284
_08031C1C: .4byte gUnknown_2023BC4
_08031C20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031C38 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031C3C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031C38: .4byte gUnknown_2024284
_08031C3C: .4byte gUnknown_2023BC4
_08031C40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031C58 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031C5C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031C58: .4byte gUnknown_2024284
_08031C5C: .4byte gUnknown_2023BC4
_08031C60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031C78 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031C7C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031C78: .4byte gUnknown_2024284
_08031C7C: .4byte gUnknown_2023BC4
_08031C80:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031C98 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031C9C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031C98: .4byte gUnknown_2024284
_08031C9C: .4byte gUnknown_2023BC4
_08031CA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031CB8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031CBC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031CB8: .4byte gUnknown_2024284
_08031CBC: .4byte gUnknown_2023BC4
_08031CC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031CD8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031CDC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031CD8: .4byte gUnknown_2024284
_08031CDC: .4byte gUnknown_2023BC4
_08031CE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031CF8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031CFC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031CF8: .4byte gUnknown_2024284
_08031CFC: .4byte gUnknown_2023BC4
_08031D00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031D18 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031D1C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031D18: .4byte gUnknown_2024284
_08031D1C: .4byte gUnknown_2023BC4
_08031D20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031D38 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031D3C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031D38: .4byte gUnknown_2024284
_08031D3C: .4byte gUnknown_2023BC4
_08031D40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031D58 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031D5C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031D58: .4byte gUnknown_2024284
_08031D5C: .4byte gUnknown_2023BC4
_08031D60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031D78 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031D7C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031D78: .4byte gUnknown_2024284
_08031D7C: .4byte gUnknown_2023BC4
_08031D80:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031D98 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031D9C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031D98: .4byte gUnknown_2024284
_08031D9C: .4byte gUnknown_2023BC4
_08031DA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031DB8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031DBC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031DB8: .4byte gUnknown_2024284
_08031DBC: .4byte gUnknown_2023BC4
_08031DC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031DD8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031DDC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031DD8: .4byte gUnknown_2024284
_08031DDC: .4byte gUnknown_2023BC4
_08031DE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031DF8 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031DFC @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031DF8: .4byte gUnknown_2024284
_08031DFC: .4byte gUnknown_2023BC4
_08031E00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031E18 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031E1C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031E18: .4byte gUnknown_2024284
_08031E1C: .4byte gUnknown_2023BC4
_08031E20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031E38 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031E3C @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl sub_804037C
	b _08031E56
	.align 2, 0
_08031E38: .4byte gUnknown_2024284
_08031E3C: .4byte gUnknown_2023BC4
_08031E40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08031E80 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08031E84 @ =gUnknown_2023BC4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl sub_804037C
_08031E56:
	ldr r2, _08031E88 @ =gUnknown_2023BCE
	ldr r0, _08031E84 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08031E80 @ =gUnknown_2024284
	adds r0, r2
	bl sub_8035244
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031E80: .4byte gUnknown_2024284
_08031E84: .4byte gUnknown_2023BC4
_08031E88: .4byte gUnknown_2023BCE
	thumb_func_end sub_8031490

	thumb_func_start sub_8031E8C
sub_8031E8C: @ 8031E8C
	push {r4-r7,lr}
	ldr r1, _08031EF0 @ =gUnknown_2023BCE
	ldr r7, _08031EF4 @ =gUnknown_2023BC4
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _08031EF8 @ =gUnknown_2022BC4
	lsls r2, 9
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _08031EFC @ =gUnknown_2024284
	adds r0, r1
	adds r5, r3, r0
	movs r3, 0
	adds r0, r4, 0x2
	adds r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _08031EE4
	adds r6, r4, 0
	adds r2, r7, 0
	adds r4, r0, 0
_08031EC2:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, 0x3
	adds r0, r3, r0
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	bcc _08031EC2
_08031EE4:
	bl sub_802E33C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031EF0: .4byte gUnknown_2023BCE
_08031EF4: .4byte gUnknown_2023BC4
_08031EF8: .4byte gUnknown_2022BC4
_08031EFC: .4byte gUnknown_2024284
	thumb_func_end sub_8031E8C

	thumb_func_start sub_8031F00
sub_8031F00: @ 8031F00
	push {r4,lr}
	ldr r2, _08031F4C @ =gUnknown_2023BCE
	ldr r4, _08031F50 @ =gUnknown_2023BC4
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08031F54 @ =gUnknown_2024284
	adds r0, r2
	bl sub_8034498
	ldr r2, _08031F58 @ =gUnknown_202063C
	ldr r0, _08031F5C @ =gUnknown_2023D44
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r1, _08031F60 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08031F64 @ =sub_802E404
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031F4C: .4byte gUnknown_2023BCE
_08031F50: .4byte gUnknown_2023BC4
_08031F54: .4byte gUnknown_2024284
_08031F58: .4byte gUnknown_202063C
_08031F5C: .4byte gUnknown_2023D44
_08031F60: .4byte gUnknown_3004FE0
_08031F64: .4byte sub_802E404
	thumb_func_end sub_8031F00

	thumb_func_start sub_8031F68
sub_8031F68: @ 8031F68
	push {r4-r6,lr}
	ldr r5, _08031FD4 @ =gUnknown_2023BC4
	ldrb r0, [r5]
	ldr r4, _08031FD8 @ =gUnknown_2022BC4
	lsls r1, r0, 9
	adds r6, r4, 0x2
	adds r1, r6
	ldrb r1, [r1]
	bl sub_803589C
	ldr r2, _08031FDC @ =gUnknown_2023BCE
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r2
	lsls r0, 9
	adds r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	movs r4, 0
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08031FE0 @ =gUnknown_2024284
	adds r0, r2
	bl sub_8034498
	ldr r1, _08031FE4 @ =gUnknown_2023FF8
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldr r1, _08031FE8 @ =gUnknown_2023FFC
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldrb r0, [r5]
	lsls r1, r0, 9
	adds r1, r6
	ldrb r1, [r1]
	bl sub_8031FF4
	ldr r1, _08031FEC @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08031FF0 @ =sub_802FD18
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031FD4: .4byte gUnknown_2023BC4
_08031FD8: .4byte gUnknown_2022BC4
_08031FDC: .4byte gUnknown_2023BCE
_08031FE0: .4byte gUnknown_2024284
_08031FE4: .4byte gUnknown_2023FF8
_08031FE8: .4byte gUnknown_2023FFC
_08031FEC: .4byte gUnknown_3004FE0
_08031FF0: .4byte sub_802FD18
	thumb_func_end sub_8031F68

	thumb_func_start sub_8031FF4
sub_8031FF4: @ 8031FF4
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_803589C
	ldr r0, _08032138 @ =gUnknown_2023BCE
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _0803213C @ =gUnknown_2022BC4
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08032140 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0xB
	bl sub_803FBE8
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08032144 @ =sub_8033E3C
	bl sub_8044EF8
	ldr r1, _08032148 @ =gUnknown_3004FFC
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl sub_80751D8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_803F7D4
	ldr r0, _0803214C @ =gUnknown_20244DC
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8074480
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl sub_80748A8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8006F8C
	ldr r4, _08032150 @ =gUnknown_2023D44
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _08032154 @ =gUnknown_202063C
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08032158 @ =gUnknown_2024024
	adds r6, r1
	ldrb r1, [r6]
	bl sub_800838C
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0803215C @ =nullsub_8
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl sub_804A938
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032138: .4byte gUnknown_2023BCE
_0803213C: .4byte gUnknown_2022BC4
_08032140: .4byte gUnknown_2024284
_08032144: .4byte sub_8033E3C
_08032148: .4byte gUnknown_3004FFC
_0803214C: .4byte gUnknown_20244DC
_08032150: .4byte gUnknown_2023D44
_08032154: .4byte gUnknown_202063C
_08032158: .4byte gUnknown_2024024
_0803215C: .4byte nullsub_8
	thumb_func_end sub_8031FF4

	thumb_func_start sub_8032160
sub_8032160: @ 8032160
	push {r4-r6,lr}
	ldr r1, _08032194 @ =gUnknown_2022BC4
	ldr r6, _08032198 @ =gUnknown_2023BC4
	ldrb r2, [r6]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	cmp r3, 0
	bne _080321A8
	ldr r0, _0803219C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strb r3, [r0, 0x4]
	ldr r1, _080321A0 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080321A4 @ =sub_80321F0
	str r1, [r0]
	b _080321DE
	.align 2, 0
_08032194: .4byte gUnknown_2022BC4
_08032198: .4byte gUnknown_2023BC4
_0803219C: .4byte gUnknown_2024018
_080321A0: .4byte gUnknown_3004FE0
_080321A4: .4byte sub_80321F0
_080321A8:
	ldr r5, _080321E4 @ =gUnknown_2023D44
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080321E8 @ =gUnknown_202063C
	adds r0, r4
	bl sub_80077D8
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_8007280
	ldr r1, _080321EC @ =gUnknown_3004FF0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8048188
	bl sub_802E33C
_080321DE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080321E4: .4byte gUnknown_2023D44
_080321E8: .4byte gUnknown_202063C
_080321EC: .4byte gUnknown_3004FF0
	thumb_func_end sub_8032160

	thumb_func_start sub_80321F0
sub_80321F0: @ 80321F0
	push {r4-r6,lr}
	ldr r6, _08032210 @ =gUnknown_2024018
	ldr r4, [r6]
	ldr r5, _08032214 @ =gUnknown_2023BC4
	ldrb r2, [r5]
	ldr r1, [r4, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _08032218
	cmp r0, 0x1
	beq _08032246
	b _0803226E
	.align 2, 0
_08032210: .4byte gUnknown_2024018
_08032214: .4byte gUnknown_2023BC4
_08032218:
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08032232
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl sub_80341D8
_08032232:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _0803226E
_08032246:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0803226E
	strb r0, [r3, 0x4]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl sub_80341D8
	ldr r1, _08032274 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032278 @ =sub_80305A0
	str r1, [r0]
_0803226E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032274: .4byte gUnknown_3004FE0
_08032278: .4byte sub_80305A0
	thumb_func_end sub_80321F0

	thumb_func_start sub_803227C
sub_803227C: @ 803227C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080322A4 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080322AC
	ldr r0, _080322A8 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl sub_80751D8
	movs r1, 0x2
	ands r1, r0
	movs r7, 0x20
	cmp r1, 0
	beq _080322AE
	movs r7, 0x5A
	b _080322AE
	.align 2, 0
_080322A4: .4byte gUnknown_2022B4C
_080322A8: .4byte gUnknown_2023BC4
_080322AC:
	movs r7, 0x50
_080322AE:
	ldr r0, _08032320 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803233C
	bl sub_800A404
	ldr r5, _08032324 @ =gUnknown_202273C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	movs r4, 0xFF
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _08032306
	bl sub_800A404
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r1, [r1]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0x1
	beq _08032306
	bl sub_800A404
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, 0x3
	bne _08032328
_08032306:
	bl sub_800A404
	ldr r2, _08032324 @ =gUnknown_202273C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x13]
	adds r4, r0, 0x2
	b _08032342
	.align 2, 0
_08032320: .4byte gUnknown_2022B4C
_08032324: .4byte gUnknown_202273C
_08032328:
	bl sub_800A404
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r4, [r1, 0x13]
	b _08032342
_0803233C:
	ldr r0, _08032400 @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r4, [r0, 0x8]
_08032342:
	ldr r5, _08032404 @ =gUnknown_2023BC4
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_8034750
	ldrb r0, [r5]
	bl sub_80751D8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_803F864
	ldr r6, _08032408 @ =gUnknown_20244DC
	mov r8, r7
	ldr r0, _0803240C @ =gUnknown_8239F8C
	lsls r4, 2
	adds r4, r0
	ldrb r0, [r4]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r5]
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	mov r1, r8
	adds r2, r4, 0
	bl sub_8006F8C
	ldr r6, _08032410 @ =gUnknown_2023D44
	ldrb r1, [r5]
	adds r1, r6
	strb r0, [r1]
	ldr r4, _08032414 @ =gUnknown_202063C
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08032418 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0803241C @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _08032420 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032424 @ =sub_802F730
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032400: .4byte gUnknown_300500C
_08032404: .4byte gUnknown_2023BC4
_08032408: .4byte gUnknown_20244DC
_0803240C: .4byte gUnknown_8239F8C
_08032410: .4byte gUnknown_2023D44
_08032414: .4byte gUnknown_202063C
_08032418: .4byte 0x0000fffe
_0803241C: .4byte sub_8033EEC
_08032420: .4byte gUnknown_3004FE0
_08032424: .4byte sub_802F730
	thumb_func_end sub_803227C

	thumb_func_start sub_8032428
sub_8032428: @ 8032428
	push {r4-r6,lr}
	ldr r0, _0803249C @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080324B8
	bl sub_800A404
	ldr r5, _080324A0 @ =gUnknown_202273C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	movs r4, 0xFF
	ldrb r0, [r1]
	cmp r0, 0x2
	beq _08032482
	bl sub_800A404
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r1, [r1]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0x1
	beq _08032482
	bl sub_800A404
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, 0x3
	bne _080324A4
_08032482:
	bl sub_800A404
	ldr r2, _080324A0 @ =gUnknown_202273C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x13]
	adds r4, r0, 0x2
	b _080324BE
	.align 2, 0
_0803249C: .4byte gUnknown_2022B4C
_080324A0: .4byte gUnknown_202273C
_080324A4:
	bl sub_800A404
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r4, [r1, 0x13]
	b _080324BE
_080324B8:
	ldr r0, _08032568 @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r4, [r0, 0x8]
_080324BE:
	ldr r5, _0803256C @ =gUnknown_2023BC4
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_8034750
	ldrb r0, [r5]
	bl sub_80751D8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_803F864
	ldr r0, _08032570 @ =gUnknown_20244DC
	ldr r1, _08032574 @ =gUnknown_8239F8C
	lsls r4, 2
	adds r4, r1
	ldrb r1, [r4]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl sub_8006F8C
	ldr r6, _08032578 @ =gUnknown_2023D44
	ldrb r1, [r5]
	adds r1, r6
	strb r0, [r1]
	ldr r4, _0803257C @ =gUnknown_202063C
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08032580 @ =0x0000ffa0
	strh r1, [r0, 0x24]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _08032584 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _08032588 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803258C @ =sub_802F768
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032568: .4byte gUnknown_300500C
_0803256C: .4byte gUnknown_2023BC4
_08032570: .4byte gUnknown_20244DC
_08032574: .4byte gUnknown_8239F8C
_08032578: .4byte gUnknown_2023D44
_0803257C: .4byte gUnknown_202063C
_08032580: .4byte 0x0000ffa0
_08032584: .4byte sub_8033EEC
_08032588: .4byte gUnknown_3004FE0
_0803258C: .4byte sub_802F768
	thumb_func_end sub_8032428

	thumb_func_start sub_8032590
sub_8032590: @ 8032590
	push {r4-r6,lr}
	ldr r5, _08032630 @ =gUnknown_2023D44
	ldr r6, _08032634 @ =gUnknown_2023BC4
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08032638 @ =gUnknown_202063C
	adds r0, r4
	bl sub_80750FC
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0803263C @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08032640 @ =sub_8075590
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08032644 @ =nullsub_8
	bl sub_8074A68
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl sub_800838C
	ldr r1, _08032648 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803264C @ =sub_802F7A0
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032630: .4byte gUnknown_2023D44
_08032634: .4byte gUnknown_2023BC4
_08032638: .4byte gUnknown_202063C
_0803263C: .4byte 0x0000ffd8
_08032640: .4byte sub_8075590
_08032644: .4byte nullsub_8
_08032648: .4byte gUnknown_3004FE0
_0803264C: .4byte sub_802F7A0
	thumb_func_end sub_8032590

	thumb_func_start sub_8032650
sub_8032650: @ 8032650
	push {r4-r6,lr}
	ldr r6, _0803269C @ =gUnknown_2024018
	ldr r4, [r6]
	ldr r5, _080326A0 @ =gUnknown_2023BC4
	ldrb r2, [r5]
	ldr r0, [r4, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _080326A4
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08032684
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl sub_80341D8
_08032684:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	adds r1, 0x1
	strb r1, [r0, 0x4]
	b _0803271A
	.align 2, 0
_0803269C: .4byte gUnknown_2024018
_080326A0: .4byte gUnknown_2023BC4
_080326A4:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0803271A
	strb r4, [r3, 0x4]
	ldr r2, _08032720 @ =gUnknown_2023BCE
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08032724 @ =gUnknown_2024284
	adds r0, r2
	bl sub_8035244
	movs r1, 0x40
	negs r1, r1
	movs r0, 0x10
	bl sub_80722F4
	ldr r2, _08032728 @ =gUnknown_202063C
	ldr r3, _0803272C @ =gUnknown_2023D44
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x30]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x32]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08032730 @ =sub_8012110
	str r1, [r0]
	ldr r1, _08032734 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032738 @ =sub_8030538
	str r1, [r0]
_0803271A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032720: .4byte gUnknown_2023BCE
_08032724: .4byte gUnknown_2024284
_08032728: .4byte gUnknown_202063C
_0803272C: .4byte gUnknown_2023D44
_08032730: .4byte sub_8012110
_08032734: .4byte gUnknown_3004FE0
_08032738: .4byte sub_8030538
	thumb_func_end sub_8032650

	thumb_func_start sub_803273C
sub_803273C: @ 803273C
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x10
	bl sub_8070588
	bl sub_802E33C
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_803273C

	thumb_func_start sub_803275C
sub_803275C: @ 803275C
	push {r4,r5,lr}
	ldr r0, _0803279C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x8]
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _080327A0 @ =gUnknown_2024005
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _080327A4 @ =gUnknown_2023BC4
	ldrb r4, [r5]
	movs r0, 0x1
	bl sub_80751E8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x3
	bl sub_80341D8
	ldr r1, _080327A8 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080327AC @ =sub_8030778
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803279C: .4byte gUnknown_2024018
_080327A0: .4byte gUnknown_2024005
_080327A4: .4byte gUnknown_2023BC4
_080327A8: .4byte gUnknown_3004FE0
_080327AC: .4byte sub_8030778
	thumb_func_end sub_803275C

	thumb_func_start sub_80327B0
sub_80327B0: @ 80327B0
	push {r4,r5,lr}
	ldr r1, _080327F8 @ =gUnknown_2022BC4
	ldr r5, _080327FC @ =gUnknown_2023BC4
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _08032800 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	strb r1, [r0, 0x8]
	ldr r1, _08032804 @ =gUnknown_2024005
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl sub_80751E8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x3
	bl sub_80341D8
	ldr r1, _08032808 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803280C @ =sub_8030778
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080327F8: .4byte gUnknown_2022BC4
_080327FC: .4byte gUnknown_2023BC4
_08032800: .4byte gUnknown_2024018
_08032804: .4byte gUnknown_2024005
_08032808: .4byte gUnknown_3004FE0
_0803280C: .4byte sub_8030778
	thumb_func_end sub_80327B0

	thumb_func_start sub_8032810
sub_8032810: @ 8032810
	push {lr}
	ldr r1, _08032838 @ =gUnknown_2022BC4
	ldr r0, _0803283C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803282E
_08032824:
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08032824
_0803282E:
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_08032838: .4byte gUnknown_2022BC4
_0803283C: .4byte gUnknown_2023BC4
	thumb_func_end sub_8032810

	thumb_func_start sub_8032840
sub_8032840: @ 8032840
	push {r4-r6,lr}
	ldr r6, _08032924 @ =gUnknown_2023BC4
	ldrb r0, [r6]
	bl sub_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _08032852
	b _08032966
_08032852:
	ldr r0, _08032928 @ =gUnknown_2022BC4
	mov r12, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _0803292C @ =gUnknown_2037F16
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _08032930 @ =gUnknown_2037EEC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _08032934 @ =gUnknown_2037EE8
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _08032938 @ =gUnknown_2037EFE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _0803293C @ =gUnknown_2037F00
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _08032940 @ =gUnknown_2037EE4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _08032944 @ =gUnknown_2024008
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl sub_80342A0
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _08032948
	bl sub_802E33C
	b _08032966
	.align 2, 0
_08032924: .4byte gUnknown_2023BC4
_08032928: .4byte gUnknown_2022BC4
_0803292C: .4byte gUnknown_2037F16
_08032930: .4byte gUnknown_2037EEC
_08032934: .4byte gUnknown_2037EE8
_08032938: .4byte gUnknown_2037EFE
_0803293C: .4byte gUnknown_2037F00
_08032940: .4byte gUnknown_2037EE4
_08032944: .4byte gUnknown_2024008
_08032948:
	ldr r0, _0803296C @ =gUnknown_2024018
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x4]
	ldr r1, _08032970 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032974 @ =sub_8032978
	str r1, [r0]
_08032966:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803296C: .4byte gUnknown_2024018
_08032970: .4byte gUnknown_3004FE0
_08032974: .4byte sub_8032978
	thumb_func_end sub_8032840

	thumb_func_start sub_8032978
sub_8032978: @ 8032978
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _080329C4 @ =gUnknown_2022BC4
	ldr r6, _080329C8 @ =gUnknown_2023BC4
	ldrb r3, [r6]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r10, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, r2, 0x2
	mov r9, r5
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	adds r2, 0xB
	adds r1, r2
	ldrb r1, [r1]
	mov r8, r1
	ldr r7, _080329CC @ =gUnknown_2024018
	ldr r5, [r7]
	ldr r1, [r5, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _08032A10
	cmp r2, 0x1
	bgt _080329D0
	cmp r2, 0
	beq _080329DA
	b _08032AEC
	.align 2, 0
_080329C4: .4byte gUnknown_2022BC4
_080329C8: .4byte gUnknown_2023BC4
_080329CC: .4byte gUnknown_2024018
_080329D0:
	cmp r2, 0x2
	beq _08032A3A
	cmp r2, 0x3
	beq _08032AB0
	b _08032AEC
_080329DA:
	ldr r1, [r5]
	lsls r0, r3, 2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _080329FC
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl sub_80341D8
_080329FC:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _08032AEC
_08032A10:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08032AEC
	movs r0, 0
	bl sub_8035450
	adds r0, r4, 0
	bl sub_807259C
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0, 0x4]
	b _08032AEC
_08032A3A:
	ldr r0, _08032AA0 @ =gUnknown_2037EDC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08032AA4 @ =gUnknown_2037EE1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08032AEC
	movs r0, 0x1
	bl sub_8035450
	ldr r0, [r7]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08032A88
	mov r0, r8
	cmp r0, 0x1
	bhi _08032A88
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl sub_80341D8
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_08032A88:
	ldr r0, _08032AA8 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _08032AAC @ =gUnknown_2023BC4
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _08032AEC
	.align 2, 0
_08032AA0: .4byte gUnknown_2037EDC
_08032AA4: .4byte gUnknown_2037EE1
_08032AA8: .4byte gUnknown_2024018
_08032AAC: .4byte gUnknown_2023BC4
_08032AB0:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08032AEC
	bl sub_8034B40
	ldrb r0, [r6]
	lsls r2, r0, 9
	mov r3, r10
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r9
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl sub_8035200
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r4, [r0, 0x4]
	bl sub_802E33C
_08032AEC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8032978

	thumb_func_start sub_8032AFC
sub_8032AFC: @ 8032AFC
	push {r4,lr}
	ldr r0, _08032B30 @ =gUnknown_2022974
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08032B34 @ =gUnknown_2022976
	strh r1, [r0]
	ldr r0, _08032B38 @ =gUnknown_2023BC4
	ldrb r4, [r0]
	lsls r4, 9
	ldr r0, _08032B3C @ =gUnknown_2022BC6
	adds r4, r0
	ldrh r0, [r4]
	bl sub_80D7274
	ldrh r0, [r4]
	bl sub_80D89B0
	lsls r0, 24
	cmp r0, 0
	beq _08032B44
	ldr r0, _08032B40 @ =gUnknown_202298C
	movs r1, 0x40
	bl sub_80D87BC
	b _08032B4C
	.align 2, 0
_08032B30: .4byte gUnknown_2022974
_08032B34: .4byte gUnknown_2022976
_08032B38: .4byte gUnknown_2023BC4
_08032B3C: .4byte gUnknown_2022BC6
_08032B40: .4byte gUnknown_202298C
_08032B44:
	ldr r0, _08032B60 @ =gUnknown_202298C
	movs r1, 0
	bl sub_80D87BC
_08032B4C:
	ldr r1, _08032B64 @ =gUnknown_3004FE0
	ldr r0, _08032B68 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032B6C @ =sub_8030610
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032B60: .4byte gUnknown_202298C
_08032B64: .4byte gUnknown_3004FE0
_08032B68: .4byte gUnknown_2023BC4
_08032B6C: .4byte sub_8030610
	thumb_func_end sub_8032AFC

	thumb_func_start sub_8032B70
sub_8032B70: @ 8032B70
	push {lr}
	ldr r0, _08032B88 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl sub_80751C4
	lsls r0, 24
	cmp r0, 0
	bne _08032B8C
	bl sub_8032AFC
	b _08032B90
	.align 2, 0
_08032B88: .4byte gUnknown_2023BC4
_08032B8C:
	bl sub_802E33C
_08032B90:
	pop {r0}
	bx r0
	thumb_func_end sub_8032B70

	thumb_func_start sub_8032B94
sub_8032B94: @ 8032B94
	push {lr}
	bl sub_8001960
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08032BBA
	ldr r0, _08032BC0 @ =gUnknown_2022974
	strh r1, [r0]
	ldr r1, _08032BC4 @ =gUnknown_2022976
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _08032BC8 @ =gUnknown_3004FE0
	ldr r0, _08032BCC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032BD0 @ =sub_802E438
	str r1, [r0]
_08032BBA:
	pop {r0}
	bx r0
	.align 2, 0
_08032BC0: .4byte gUnknown_2022974
_08032BC4: .4byte gUnknown_2022976
_08032BC8: .4byte gUnknown_3004FE0
_08032BCC: .4byte gUnknown_2023BC4
_08032BD0: .4byte sub_802E438
	thumb_func_end sub_8032B94

	thumb_func_start sub_8032BD4
sub_8032BD4: @ 8032BD4
	push {r4,lr}
	ldr r1, _08032C28 @ =gUnknown_3004FE0
	ldr r0, _08032C2C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032C30 @ =sub_8032B94
	str r1, [r0]
	ldr r0, _08032C34 @ =gUnknown_83FDA4C
	movs r1, 0
	bl sub_80D87BC
	ldr r0, _08032C38 @ =gUnknown_83FE725
	movs r1, 0x2
	bl sub_80D87BC
	movs r4, 0
_08032BF6:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_8030A98
	adds r4, 0x1
	cmp r4, 0x3
	ble _08032BF6
	ldr r1, _08032C3C @ =gUnknown_2023FF8
	ldr r0, _08032C2C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8030A54
	ldr r0, _08032C40 @ =gUnknown_83FE6D5
	bl sub_80D77F4
	ldr r0, _08032C44 @ =gUnknown_202298C
	movs r1, 0x1
	bl sub_80D87BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032C28: .4byte gUnknown_3004FE0
_08032C2C: .4byte gUnknown_2023BC4
_08032C30: .4byte sub_8032B94
_08032C34: .4byte gUnknown_83FDA4C
_08032C38: .4byte gUnknown_83FE725
_08032C3C: .4byte gUnknown_2023FF8
_08032C40: .4byte gUnknown_83FE6D5
_08032C44: .4byte gUnknown_202298C
	thumb_func_end sub_8032BD4

	thumb_func_start nullsub_14
nullsub_14: @ 8032C48
	bx lr
	thumb_func_end nullsub_14

	thumb_func_start sub_8032C4C
sub_8032C4C: @ 8032C4C
	push {lr}
	bl sub_8001960
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08032C76
	ldr r0, _08032C7C @ =gUnknown_2022974
	strh r1, [r0]
	ldr r1, _08032C80 @ =gUnknown_2022976
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08032C84 @ =gUnknown_3004FE0
	ldr r0, _08032C88 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032C8C @ =sub_802EA10
	str r1, [r0]
_08032C76:
	pop {r0}
	bx r0
	.align 2, 0
_08032C7C: .4byte gUnknown_2022974
_08032C80: .4byte gUnknown_2022976
_08032C84: .4byte gUnknown_3004FE0
_08032C88: .4byte gUnknown_2023BC4
_08032C8C: .4byte sub_802EA10
	thumb_func_end sub_8032C4C

	thumb_func_start sub_8032C90
sub_8032C90: @ 8032C90
	push {lr}
	bl sub_8032CB4
	ldr r1, _08032CA8 @ =gUnknown_3004FE0
	ldr r0, _08032CAC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032CB0 @ =sub_8032C4C
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08032CA8: .4byte gUnknown_3004FE0
_08032CAC: .4byte gUnknown_2023BC4
_08032CB0: .4byte sub_8032C4C
	thumb_func_end sub_8032C90

	thumb_func_start sub_8032CB4
sub_8032CB4: @ 8032CB4
	push {lr}
	bl sub_8030830
	ldr r1, _08032CE0 @ =gUnknown_3004FF4
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _08032CE4 @ =gUnknown_2023FFC
	ldr r0, _08032CE8 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_80309CC
	bl sub_80308A8
	bl sub_80308CC
	bl sub_8030940
	pop {r0}
	bx r0
	.align 2, 0
_08032CE0: .4byte gUnknown_3004FF4
_08032CE4: .4byte gUnknown_2023FFC
_08032CE8: .4byte gUnknown_2023BC4
	thumb_func_end sub_8032CB4

	thumb_func_start sub_8032CEC
sub_8032CEC: @ 8032CEC
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl sub_8070588
	ldr r1, _08032D38 @ =gUnknown_3004FE0
	ldr r2, _08032D3C @ =gUnknown_2023BC4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032D40 @ =sub_8030700
	str r1, [r0]
	ldr r1, _08032D44 @ =gUnknown_2024004
	ldrb r0, [r2]
	strb r0, [r1]
	movs r3, 0
	ldr r5, _08032D48 @ =gUnknown_203B0DC
	ldr r4, _08032D4C @ =gUnknown_2022BC4
_08032D1A:
	adds r0, r3, r5
	ldrb r1, [r2]
	lsls r1, 9
	adds r1, 0x1
	adds r1, r3, r1
	adds r1, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x2
	ble _08032D1A
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032D38: .4byte gUnknown_3004FE0
_08032D3C: .4byte gUnknown_2023BC4
_08032D40: .4byte sub_8030700
_08032D44: .4byte gUnknown_2024004
_08032D48: .4byte gUnknown_203B0DC
_08032D4C: .4byte gUnknown_2022BC4
	thumb_func_end sub_8032CEC

	thumb_func_start sub_8032D50
sub_8032D50: @ 8032D50
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _08032E00 @ =nullsub_43
	movs r1, 0xFF
	bl sub_807741C
	ldr r3, _08032E04 @ =gUnknown_3004FFC
	ldr r4, _08032E08 @ =gUnknown_2023BC4
	ldrb r1, [r4]
	adds r1, r3
	strb r0, [r1]
	ldr r5, _08032E0C @ =gUnknown_3005090
	ldrb r2, [r4]
	adds r3, r2, r3
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldr r5, _08032E10 @ =gUnknown_2022BC4
	lsls r2, 9
	adds r6, r5, 0x1
	adds r2, r6
	ldrb r2, [r2]
	movs r0, 0xF
	ands r0, r2
	strh r0, [r1, 0x8]
	ldr r3, _08032E14 @ =gUnknown_2023FE8
	ldr r1, [r3]
	adds r1, 0x49
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r6
	ldrb r0, [r0]
	lsrs r0, 4
	strb r0, [r1]
	ldr r2, [r3]
	adds r2, 0x8B
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, r5, 0x2
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0xAC
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, r5, 0x3
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r2, 0
	ldr r3, _08032E18 @ =gUnknown_203B0DC
_08032DBC:
	adds r0, r2, r3
	ldrb r1, [r4]
	lsls r1, 9
	adds r1, 0x4
	adds r1, r2, r1
	adds r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _08032DBC
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl sub_8070588
	ldr r1, _08032E1C @ =gUnknown_3004FE0
	ldr r2, _08032E08 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032E20 @ =sub_8030628
	str r1, [r0]
	ldr r1, _08032E24 @ =gUnknown_2024004
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032E00: .4byte nullsub_43
_08032E04: .4byte gUnknown_3004FFC
_08032E08: .4byte gUnknown_2023BC4
_08032E0C: .4byte gUnknown_3005090
_08032E10: .4byte gUnknown_2022BC4
_08032E14: .4byte gUnknown_2023FE8
_08032E18: .4byte gUnknown_203B0DC
_08032E1C: .4byte gUnknown_3004FE0
_08032E20: .4byte sub_8030628
_08032E24: .4byte gUnknown_2024004
	thumb_func_end sub_8032D50

	thumb_func_start sub_8032E28
sub_8032E28: @ 8032E28
	push {lr}
	sub sp, 0x4
	bl sub_8035314
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x10
	bl sub_8070588
	bl sub_802E33C
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_8032E28

	thumb_func_start sub_8032E4C
sub_8032E4C: @ 8032E4C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl sub_8034964
	ldr r3, _08032EC4 @ =gUnknown_2022BC4
	ldr r0, _08032EC8 @ =gUnknown_2023BC4
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _08032ECC @ =0x00007fff
	cmp r7, r0
	beq _08032EDC
	ldr r6, _08032ED0 @ =gUnknown_2023BCE
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08032ED4 @ =gUnknown_2024284
	adds r0, r4
	movs r1, 0x3A
	bl sub_803FBE8
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl sub_803FBE8
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _08032ED8 @ =gUnknown_3004FF0
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8048150
	b _08032F16
	.align 2, 0
_08032EC4: .4byte gUnknown_2022BC4
_08032EC8: .4byte gUnknown_2023BC4
_08032ECC: .4byte 0x00007fff
_08032ED0: .4byte gUnknown_2023BCE
_08032ED4: .4byte gUnknown_2024284
_08032ED8: .4byte gUnknown_3004FF0
_08032EDC:
	ldr r1, _08032F34 @ =gUnknown_2023BCE
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08032F38 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x3A
	bl sub_803FBE8
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r4, _08032F3C @ =gUnknown_3004FF0
	adds r1, r0, r4
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8048150
	mov r1, r9
	ldrb r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_8048440
_08032F16:
	ldr r1, _08032F40 @ =gUnknown_3004FE0
	ldr r0, _08032F44 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032F48 @ =sub_802FE24
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032F34: .4byte gUnknown_2023BCE
_08032F38: .4byte gUnknown_2024284
_08032F3C: .4byte gUnknown_3004FF0
_08032F40: .4byte gUnknown_3004FE0
_08032F44: .4byte gUnknown_2023BC4
_08032F48: .4byte sub_802FE24
	thumb_func_end sub_8032E4C

	thumb_func_start sub_8032F4C
sub_8032F4C: @ 8032F4C
	push {r4-r7,lr}
	ldr r5, _08032F78 @ =gUnknown_2022BC4
	ldr r6, _08032F7C @ =gUnknown_2023BC4
	ldrb r0, [r6]
	lsls r0, 9
	adds r1, r5, 0x1
	adds r0, r1
	ldrb r7, [r0]
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08032F80 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl sub_803FBE8
	cmp r0, 0x63
	bls _08032F84
	bl sub_802E33C
	b _08032FD0
	.align 2, 0
_08032F78: .4byte gUnknown_2022BC4
_08032F7C: .4byte gUnknown_2023BC4
_08032F80: .4byte gUnknown_2024284
_08032F84:
	movs r0, 0x1
	bl sub_8034964
	adds r0, r4, 0
	movs r1, 0xB
	bl sub_803FBE8
	ldrb r1, [r6]
	lsls r1, 9
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r5, 0x3
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	ldr r0, _08032FD8 @ =sub_802FEAC
	movs r1, 0xA
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08032FDC @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r7, [r1, 0x8]
	strh r4, [r1, 0xA]
	ldrb r0, [r6]
	strh r0, [r1, 0xC]
	ldr r1, _08032FE0 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032FE4 @ =nullsub_13
	str r1, [r0]
_08032FD0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032FD8: .4byte sub_802FEAC
_08032FDC: .4byte gUnknown_3005090
_08032FE0: .4byte gUnknown_3004FE0
_08032FE4: .4byte nullsub_13
	thumb_func_end sub_8032F4C

	thumb_func_start sub_8032FE8
sub_8032FE8: @ 8032FE8
	push {r4,lr}
	ldr r4, _08033044 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	bl sub_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0803303C
	ldr r0, _08033048 @ =gUnknown_3004FF0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0803304C @ =gUnknown_2023BCE
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08033050 @ =gUnknown_2024284
	adds r1, r2
	movs r2, 0x9
	bl sub_8049D98
	ldrb r2, [r4]
	ldr r0, _08033054 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08033058 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803305C @ =sub_8030AFC
	str r1, [r0]
_0803303C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033044: .4byte gUnknown_2023BC4
_08033048: .4byte gUnknown_3004FF0
_0803304C: .4byte gUnknown_2023BCE
_08033050: .4byte gUnknown_2024284
_08033054: .4byte gUnknown_2024018
_08033058: .4byte gUnknown_3004FE0
_0803305C: .4byte sub_8030AFC
	thumb_func_end sub_8032FE8

	thumb_func_start sub_8033060
sub_8033060: @ 8033060
	push {r4,r5,lr}
	ldr r5, _080330B8 @ =gUnknown_2023BC4
	ldrb r0, [r5]
	bl sub_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _080330B0
	ldr r4, _080330BC @ =gUnknown_2022BC4
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl sub_8033F1C
	ldr r1, _080330C0 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080330C4 @ =sub_8030AFC
	str r1, [r0]
_080330B0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080330B8: .4byte gUnknown_2023BC4
_080330BC: .4byte gUnknown_2022BC4
_080330C0: .4byte gUnknown_3004FE0
_080330C4: .4byte sub_8030AFC
	thumb_func_end sub_8033060

	thumb_func_start sub_80330C8
sub_80330C8: @ 80330C8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r0, _08033124 @ =gUnknown_2023BCE
	mov r8, r0
	ldr r4, _08033128 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0803312C @ =gUnknown_2024284
	adds r0, r5
	movs r1, 0x37
	bl sub_803FBE8
	ldr r2, _08033130 @ =gUnknown_2022BC4
	ldrb r1, [r4]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	eors r0, r1
	mov r1, sp
	strb r0, [r1]
	ldrb r0, [r4]
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x37
	mov r2, sp
	bl sub_804037C
	bl sub_802E33C
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033124: .4byte gUnknown_2023BCE
_08033128: .4byte gUnknown_2023BC4
_0803312C: .4byte gUnknown_2024284
_08033130: .4byte gUnknown_2022BC4
	thumb_func_end sub_80330C8

	thumb_func_start sub_8033134
sub_8033134: @ 8033134
	push {lr}
	bl sub_802E33C
	pop {r0}
	bx r0
	thumb_func_end sub_8033134

	thumb_func_start sub_8033140
sub_8033140: @ 8033140
	push {r4,r5,lr}
	ldr r3, _080331A4 @ =gUnknown_2022BC4
	ldr r0, _080331A8 @ =gUnknown_2023BC4
	ldrb r2, [r0]
	lsls r2, 9
	adds r0, r3, 0x1
	adds r0, r2, r0
	ldrb r5, [r0]
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, 8
	orrs r5, r0
	adds r0, r3, 0x3
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, 16
	orrs r5, r0
	adds r0, r3, 0x4
	adds r0, r2, r0
	ldrb r4, [r0]
	lsls r4, 24
	adds r0, r3, 0x5
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r3, 0x6
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	adds r3, 0x7
	adds r2, r3
	orrs r5, r4
	lsrs r4, r1, 16
	movs r0, 0x80
	lsls r0, 5
	cmp r4, r0
	bhi _080331B0
	ldr r0, _080331AC @ =0x040000d4
	str r2, [r0]
	str r5, [r0, 0x4]
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080331DC
	.align 2, 0
_080331A4: .4byte gUnknown_2022BC4
_080331A8: .4byte gUnknown_2023BC4
_080331AC: .4byte 0x040000d4
_080331B0:
	ldr r3, _080331E8 @ =0x040000d4
	str r2, [r3]
	str r5, [r3, 0x4]
	ldr r0, _080331EC @ =0x80000800
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r2, r0
	adds r5, r0
	ldr r1, _080331F0 @ =0xfffff000
	adds r4, r1
	cmp r4, r0
	bhi _080331B0
	str r2, [r3]
	str r5, [r3, 0x4]
	lsrs r0, r4, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
_080331DC:
	bl sub_802E33C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080331E8: .4byte 0x040000d4
_080331EC: .4byte 0x80000800
_080331F0: .4byte 0xfffff000
	thumb_func_end sub_8033140

	thumb_func_start sub_80331F4
sub_80331F4: @ 80331F4
	push {lr}
	ldr r2, _0803321C @ =gUnknown_2022BC4
	ldr r0, _08033220 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl sub_80722A0
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_0803321C: .4byte gUnknown_2022BC4
_08033220: .4byte gUnknown_2023BC4
	thumb_func_end sub_80331F4

	thumb_func_start sub_8033224
sub_8033224: @ 8033224
	push {lr}
	bl sub_802E33C
	pop {r0}
	bx r0
	thumb_func_end sub_8033224

	thumb_func_start sub_8033230
sub_8033230: @ 8033230
	push {lr}
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_800E848
	bl sub_802E33C
	pop {r0}
	bx r0
	thumb_func_end sub_8033230

	thumb_func_start sub_8033244
sub_8033244: @ 8033244
	push {lr}
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_800E874
	bl sub_802E33C
	pop {r0}
	bx r0
	thumb_func_end sub_8033244

	thumb_func_start sub_8033258
sub_8033258: @ 8033258
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl sub_800E8AC
	bl sub_802E33C
	pop {r0}
	bx r0
	thumb_func_end sub_8033258

	thumb_func_start sub_803326C
sub_803326C: @ 803326C
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl sub_800E8D8
	bl sub_802E33C
	pop {r0}
	bx r0
	thumb_func_end sub_803326C

	thumb_func_start sub_8033280
sub_8033280: @ 8033280
	push {lr}
	ldr r2, _08033298 @ =gUnknown_2022870
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_08033298: .4byte gUnknown_2022870
	thumb_func_end sub_8033280

	thumb_func_start sub_803329C
sub_803329C: @ 803329C
	push {lr}
	ldr r3, _080332C8 @ =gUnknown_2022870
	ldr r1, _080332CC @ =gUnknown_2022BC4
	ldr r0, _080332D0 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x7F
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_080332C8: .4byte gUnknown_2022870
_080332CC: .4byte gUnknown_2022BC4
_080332D0: .4byte gUnknown_2023BC4
	thumb_func_end sub_803329C

	thumb_func_start sub_80332D4
sub_80332D4: @ 80332D4
	push {lr}
	ldr r2, _080332E8 @ =gUnknown_2022870
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_080332E8: .4byte gUnknown_2022870
	thumb_func_end sub_80332D4

	thumb_func_start sub_80332EC
sub_80332EC: @ 80332EC
	push {lr}
	ldr r3, _08033310 @ =gUnknown_2022870
	ldr r1, [r3]
	lsls r1, 24
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 7
	ldrb r2, [r3]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_08033310: .4byte gUnknown_2022870
	thumb_func_end sub_80332EC

	thumb_func_start sub_8033314
sub_8033314: @ 8033314
	push {r4,lr}
	ldr r3, _0803333C @ =gUnknown_202063C
	ldr r2, _08033340 @ =gUnknown_2023D44
	ldr r4, _08033344 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _08033348
	bl sub_802E33C
	b _08033372
	.align 2, 0
_0803333C: .4byte gUnknown_202063C
_08033340: .4byte gUnknown_2023D44
_08033344: .4byte gUnknown_2023BC4
_08033348:
	ldr r1, _08033378 @ =gUnknown_2024005
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl sub_804BE70
	ldr r1, _0803337C @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08033380 @ =sub_80307B4
	str r1, [r0]
_08033372:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033378: .4byte gUnknown_2024005
_0803337C: .4byte gUnknown_3004FE0
_08033380: .4byte sub_80307B4
	thumb_func_end sub_8033314

	thumb_func_start sub_8033384
sub_8033384: @ 8033384
	push {lr}
	bl sub_802E33C
	pop {r0}
	bx r0
	thumb_func_end sub_8033384

	thumb_func_start sub_8033390
sub_8033390: @ 8033390
	push {r4,lr}
	ldr r4, _080333CC @ =gUnknown_2023BC4
	ldrb r0, [r4]
	bl sub_80751C4
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _080333A4
	movs r3, 0xC0
_080333A4:
	ldr r2, _080333D0 @ =gUnknown_2022BC4
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl sub_80722F4
	bl sub_802E33C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080333CC: .4byte gUnknown_2023BC4
_080333D0: .4byte gUnknown_2022BC4
	thumb_func_end sub_8033390

	thumb_func_start sub_80333D4
sub_80333D4: @ 80333D4
	push {lr}
	ldr r2, _080333FC @ =gUnknown_2022BC4
	ldr r0, _08033400 @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl sub_8071C60
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_080333FC: .4byte gUnknown_2022BC4
_08033400: .4byte gUnknown_2023BC4
	thumb_func_end sub_80333D4

	thumb_func_start sub_8033404
sub_8033404: @ 8033404
	push {lr}
	ldr r1, _08033438 @ =gUnknown_2023BCE
	ldr r0, _0803343C @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08033440 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0xB
	bl sub_803FBE8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	negs r1, r1
	movs r2, 0x5
	bl sub_8071E60
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_08033438: .4byte gUnknown_2023BCE
_0803343C: .4byte gUnknown_2023BC4
_08033440: .4byte gUnknown_2024284
	thumb_func_end sub_8033404

	thumb_func_start sub_8033444
sub_8033444: @ 8033444
	push {lr}
	ldr r1, _0803346C @ =gUnknown_2022BC4
	ldr r0, _08033470 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80BC3A0
	ldr r2, _08033474 @ =gUnknown_2023F4C
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_0803346C: .4byte gUnknown_2022BC4
_08033470: .4byte gUnknown_2023BC4
_08033474: .4byte gUnknown_2023F4C
	thumb_func_end sub_8033444

	thumb_func_start sub_8033478
sub_8033478: @ 8033478
	push {r4-r7,lr}
	ldr r6, _080335B8 @ =gUnknown_2023D44
	ldr r7, _080335BC @ =gUnknown_2023BC4
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080335C0 @ =gUnknown_202063C
	adds r0, r5
	bl sub_80750FC
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080335C4 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080335C8 @ =sub_80755B8
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080335CC @ =sub_80335F8
	bl sub_8074A68
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl sub_800838C
	ldr r0, _080335D0 @ =0x0000d6f8
	bl sub_80089B8
	adds r4, r0, 0
	lsls r4, 24
	ldr r1, _080335D4 @ =gUnknown_8239FD4
	ldr r0, _080335D8 @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	lsrs r4, 20
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl sub_80703A8
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _080335DC @ =sub_8033660
	movs r1, 0x5
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080335E0 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldr r3, _080335E4 @ =gUnknown_2024018
	ldr r0, [r3]
	ldrb r2, [r7]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803359A
	ldr r0, _080335E8 @ =gUnknown_2024000
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _080335EC @ =sub_80491B0
	str r1, [r0]
_0803359A:
	ldr r0, [r3]
	ldr r2, [r0, 0x8]
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _080335F0 @ =gUnknown_3004FE0
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080335F4 @ =nullsub_13
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080335B8: .4byte gUnknown_2023D44
_080335BC: .4byte gUnknown_2023BC4
_080335C0: .4byte gUnknown_202063C
_080335C4: .4byte 0x0000ffd8
_080335C8: .4byte sub_80755B8
_080335CC: .4byte sub_80335F8
_080335D0: .4byte 0x0000d6f8
_080335D4: .4byte gUnknown_8239FD4
_080335D8: .4byte gUnknown_300500C
_080335DC: .4byte sub_8033660
_080335E0: .4byte gUnknown_3005090
_080335E4: .4byte gUnknown_2024018
_080335E8: .4byte gUnknown_2024000
_080335EC: .4byte sub_80491B0
_080335F0: .4byte gUnknown_3004FE0
_080335F4: .4byte nullsub_13
	thumb_func_end sub_8033478

	thumb_func_start sub_80335F8
sub_80335F8: @ 80335F8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r4, [r5, 0x38]
	lsls r4, 24
	lsrs r4, 24
	bl sub_80077D8
	ldrb r0, [r5, 0x5]
	lsrs r0, 4
	bl sub_8008A20
	lsls r0, 16
	lsrs r0, 16
	bl sub_8008A30
	adds r0, r5, 0
	bl sub_8007280
	ldr r1, _08033650 @ =gUnknown_2023BCE
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08033654 @ =gUnknown_2024284
	adds r0, r1
	adds r1, r4, 0
	bl sub_8034498
	ldr r0, _08033658 @ =gUnknown_2023D44
	adds r4, r0
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0803365C @ =gUnknown_202063C
	adds r0, r1
	movs r1, 0
	bl sub_800838C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033650: .4byte gUnknown_2023BCE
_08033654: .4byte gUnknown_2024284
_08033658: .4byte gUnknown_2023D44
_0803365C: .4byte gUnknown_202063C
	thumb_func_end sub_80335F8

	thumb_func_start sub_8033660
sub_8033660: @ 8033660
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08033688 @ =gUnknown_3005090
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x1E
	bgt _0803368C
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08033748
	.align 2, 0
_08033688: .4byte gUnknown_3005090
_0803368C:
	ldr r7, _080336CC @ =gUnknown_2023BC4
	ldrb r0, [r7]
	mov r9, r0
	ldrh r0, [r1, 0x8]
	strb r0, [r7]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _080336AC
	ldr r0, _080336D0 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080336DC
_080336AC:
	ldr r0, _080336D4 @ =gUnknown_2022BC4
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _080336D8 @ =gUnknown_2023BCE
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8031FF4
	b _08033730
	.align 2, 0
_080336CC: .4byte gUnknown_2023BC4
_080336D0: .4byte gUnknown_2022B4C
_080336D4: .4byte gUnknown_2022BC4
_080336D8: .4byte gUnknown_2023BCE
_080336DC:
	ldr r4, _08033754 @ =gUnknown_2022BC4
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r5, _08033758 @ =gUnknown_2023BCE
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8031FF4
	ldrb r0, [r7]
	movs r6, 0x2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0803375C @ =gUnknown_2024284
	adds r0, r2
	bl sub_8034498
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8031FF4
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_08033730:
	ldr r1, _08033760 @ =gUnknown_3004FE0
	ldr r2, _08033764 @ =gUnknown_2023BC4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08033768 @ =sub_802FA58
	str r1, [r0]
	mov r3, r9
	strb r3, [r2]
	mov r0, r8
	bl sub_8077508
_08033748:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033754: .4byte gUnknown_2022BC4
_08033758: .4byte gUnknown_2023BCE
_0803375C: .4byte gUnknown_2024284
_08033760: .4byte gUnknown_3004FE0
_08033764: .4byte gUnknown_2023BC4
_08033768: .4byte sub_802FA58
	thumb_func_end sub_8033660

	thumb_func_start sub_803376C
sub_803376C: @ 803376C
	push {r4-r6,lr}
	ldr r1, _08033794 @ =gUnknown_2022BC4
	ldr r0, _08033798 @ =gUnknown_2023BC4
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803379C
	adds r0, r2, 0
	bl sub_80751C4
	lsls r0, 24
	cmp r0, 0
	bne _0803379C
	bl sub_802E33C
	b _08033810
	.align 2, 0
_08033794: .4byte gUnknown_2022BC4
_08033798: .4byte gUnknown_2023BC4
_0803379C:
	ldr r6, _08033818 @ =gUnknown_2024018
	ldr r0, [r6]
	ldr r5, _0803381C @ =gUnknown_2023BC4
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _08033820 @ =gUnknown_2022BC8
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8048D14
	ldr r2, _08033824 @ =gUnknown_2024000
	ldrb r1, [r5]
	adds r1, r2
	movs r3, 0
	strb r0, [r1]
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x5]
	ldrb r2, [r5]
	lsls r0, r2, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08033804
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_08033804:
	ldr r0, _08033828 @ =gUnknown_3004FE0
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0803382C @ =sub_8033830
	str r0, [r1]
_08033810:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033818: .4byte gUnknown_2024018
_0803381C: .4byte gUnknown_2023BC4
_08033820: .4byte gUnknown_2022BC8
_08033824: .4byte gUnknown_2024000
_08033828: .4byte gUnknown_3004FE0
_0803382C: .4byte sub_8033830
	thumb_func_end sub_803376C

	thumb_func_start sub_8033830
sub_8033830: @ 8033830
	push {r4,lr}
	ldr r4, _08033870 @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r3, _08033874 @ =gUnknown_2023BC4
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _08033868
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x5]
	bl sub_802E33C
_08033868:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033870: .4byte gUnknown_2024018
_08033874: .4byte gUnknown_2023BC4
	thumb_func_end sub_8033830

	thumb_func_start sub_8033878
sub_8033878: @ 8033878
	push {lr}
	ldr r0, _080338B4 @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _080338B8 @ =gUnknown_2023BC4
	ldrb r3, [r0]
	ldr r1, [r1, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080338AA
	ldr r2, _080338BC @ =gUnknown_3005090
	ldr r0, _080338C0 @ =gUnknown_2024000
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080338C4 @ =sub_80491B0
	str r1, [r0]
_080338AA:
	bl sub_802E33C
	pop {r0}
	bx r0
	.align 2, 0
_080338B4: .4byte gUnknown_2024018
_080338B8: .4byte gUnknown_2023BC4
_080338BC: .4byte gUnknown_3005090
_080338C0: .4byte gUnknown_2024000
_080338C4: .4byte sub_80491B0
	thumb_func_end sub_8033878

	thumb_func_start sub_80338C8
sub_80338C8: @ 80338C8
	push {r4,lr}
	ldr r4, _080338E8 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8012258
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8012258
	bl sub_802E33C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080338E8: .4byte gUnknown_2023BC4
	thumb_func_end sub_80338C8

	thumb_func_start sub_80338EC
sub_80338EC: @ 80338EC
	push {r4,lr}
	ldr r4, _0803393C @ =gUnknown_2023BC4
	ldrb r0, [r4]
	bl sub_8075224
	lsls r0, 24
	cmp r0, 0
	beq _08033932
	ldr r3, _08033940 @ =gUnknown_202063C
	ldr r0, _08033944 @ =gUnknown_2023D44
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _08033948 @ =gUnknown_2022BC4
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_8034BB4
_08033932:
	bl sub_802E33C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803393C: .4byte gUnknown_2023BC4
_08033940: .4byte gUnknown_202063C
_08033944: .4byte gUnknown_2023D44
_08033948: .4byte gUnknown_2022BC4
	thumb_func_end sub_80338EC

	thumb_func_start sub_803394C
sub_803394C: @ 803394C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08033990 @ =gUnknown_2023BC4
	ldrb r0, [r6]
	bl sub_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _080339A4
	ldr r5, _08033994 @ =gUnknown_2022BC4
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl sub_803401C
	lsls r0, 24
	cmp r0, 0
	beq _08033998
	bl sub_802E33C
	b _080339A4
	.align 2, 0
_08033990: .4byte gUnknown_2023BC4
_08033994: .4byte gUnknown_2022BC4
_08033998:
	ldr r0, _080339AC @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080339B0 @ =sub_8030B2C
	str r0, [r1]
_080339A4:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080339AC: .4byte gUnknown_3004FE0
_080339B0: .4byte sub_8030B2C
	thumb_func_end sub_803394C

	thumb_func_start sub_80339B4
sub_80339B4: @ 80339B4
	push {r4,lr}
	ldr r1, _080339D4 @ =gUnknown_2022BC4
	ldr r0, _080339D8 @ =gUnknown_2023BC4
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080339E6
	cmp r0, 0x1
	bgt _080339DC
	cmp r0, 0
	beq _080339E2
	b _08033A04
	.align 2, 0
_080339D4: .4byte gUnknown_2022BC4
_080339D8: .4byte gUnknown_2023BC4
_080339DC:
	cmp r0, 0x2
	beq _08033A00
	b _08033A04
_080339E2:
	bl sub_8030B5C
_080339E6:
	ldr r4, _080339FC @ =gUnknown_2023BC4
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8012258
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8012258
	b _08033A04
	.align 2, 0
_080339FC: .4byte gUnknown_2023BC4
_08033A00:
	bl sub_8030B5C
_08033A04:
	bl sub_802E33C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80339B4

	thumb_func_start sub_8033A10
sub_8033A10: @ 8033A10
	push {r4,lr}
	ldr r1, _08033A30 @ =gUnknown_2022BC4
	ldr r4, _08033A34 @ =gUnknown_2023BC4
	ldrb r3, [r4]
	lsls r0, r3, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r2, [r0]
	cmp r2, 0x1
	beq _08033A58
	cmp r2, 0x1
	bgt _08033A38
	cmp r2, 0
	beq _08033A3E
	b _08033A68
	.align 2, 0
_08033A30: .4byte gUnknown_2022BC4
_08033A34: .4byte gUnknown_2023BC4
_08033A38:
	cmp r2, 0x2
	beq _08033A60
	b _08033A68
_08033A3E:
	ldr r0, _08033A50 @ =gUnknown_2023FF8
	adds r0, r3, r0
	strb r2, [r0]
	ldr r1, _08033A54 @ =gUnknown_2023FFC
	ldrb r0, [r4]
	adds r0, r1
	strb r2, [r0]
	b _08033A68
	.align 2, 0
_08033A50: .4byte gUnknown_2023FF8
_08033A54: .4byte gUnknown_2023FFC
_08033A58:
	ldr r0, _08033A5C @ =gUnknown_2023FF8
	b _08033A62
	.align 2, 0
_08033A5C: .4byte gUnknown_2023FF8
_08033A60:
	ldr r0, _08033A74 @ =gUnknown_2023FFC
_08033A62:
	adds r0, r3, r0
	movs r1, 0
	strb r1, [r0]
_08033A68:
	bl sub_802E33C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033A74: .4byte gUnknown_2023FFC
	thumb_func_end sub_8033A10

	thumb_func_start sub_8033A78
sub_8033A78: @ 8033A78
	push {r4,lr}
	ldr r2, _08033AB0 @ =gUnknown_2023E8A
	ldr r1, _08033AB4 @ =gUnknown_2022BC4
	ldr r4, _08033AB8 @ =gUnknown_2023BC4
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl sub_8071AB4
	movs r0, 0x3
	bl sub_8070E44
	bl sub_802E33C
	ldr r1, _08033ABC @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08033AC0 @ =sub_802F6A8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033AB0: .4byte gUnknown_2023E8A
_08033AB4: .4byte gUnknown_2022BC4
_08033AB8: .4byte gUnknown_2023BC4
_08033ABC: .4byte gUnknown_3004FE0
_08033AC0: .4byte sub_802F6A8
	thumb_func_end sub_8033A78

	thumb_func_start nullsub_15
nullsub_15: @ 8033AC4
	bx lr
	thumb_func_end nullsub_15

	thumb_func_start sub_8033AC8
sub_8033AC8: @ 8033AC8
	push {r4-r6,lr}
	sub sp, 0x4
	movs r5, 0
	movs r6, 0
	ldr r0, _08033B14 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08033ADE
	b _08033DA2
_08033ADE:
	ldr r3, _08033B18 @ =gUnknown_2023BC4
	ldrb r1, [r3]
	lsls r2, r1, 9
	ldr r0, _08033B1C @ =gUnknown_2022BC8
	adds r2, r0
	ldr r0, _08033B20 @ =gUnknown_2023FFC
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r2, r0
	ldrh r4, [r0]
	cmp r4, 0xAE
	bne _08033B24
	ldrb r0, [r2, 0x12]
	movs r1, 0
	cmp r0, 0x7
	beq _08033B30
	ldrb r1, [r2, 0x13]
	movs r0, 0x7
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	asrs r1, r0, 31
	movs r0, 0x10
	ands r1, r0
	b _08033B30
	.align 2, 0
_08033B14: .4byte gUnknown_2022B4C
_08033B18: .4byte gUnknown_2023BC4
_08033B1C: .4byte gUnknown_2022BC8
_08033B20: .4byte gUnknown_2023FFC
_08033B24:
	ldr r1, _08033B40 @ =gUnknown_8250C04
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x6]
_08033B30:
	cmp r1, 0x40
	bls _08033B36
	b _08033D92
_08033B36:
	lsls r0, r1, 2
	ldr r1, _08033B44 @ =_08033B48
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08033B40: .4byte gUnknown_8250C04
_08033B44: .4byte _08033B48
	.align 2, 0
_08033B48:
	.4byte _08033C4C
	.4byte _08033C4C
	.4byte _08033C4C
	.4byte _08033D92
	.4byte _08033C4C
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033C54
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033C80
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D4C
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033D92
	.4byte _08033C54
_08033C4C:
	movs r5, 0xF0
	lsls r5, 12
	movs r6, 0
	b _08033D92
_08033C54:
	movs r0, 0x1
	bl sub_80751E8
	adds r4, r0, 0
	movs r0, 0x3
	bl sub_80751E8
	ldr r1, _08033C7C @ =gUnknown_825E45C
	lsls r4, 24
	lsrs r4, 22
	adds r4, r1
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r4]
	ldr r0, [r0]
	orrs r1, r0
	lsls r5, r1, 16
	b _08033D90
	.align 2, 0
_08033C7C: .4byte gUnknown_825E45C
_08033C80:
	cmp r4, 0xDB
	beq _08033CEA
	cmp r4, 0xDB
	bgt _08033CB2
	cmp r4, 0x73
	beq _08033CEA
	cmp r4, 0x73
	bgt _08033C9E
	cmp r4, 0x71
	beq _08033CEA
	cmp r4, 0x71
	bgt _08033CE4
	cmp r4, 0x36
	beq _08033CEA
	b _08033D38
_08033C9E:
	cmp r4, 0xC9
	beq _08033CE4
	cmp r4, 0xC9
	bgt _08033CAC
	cmp r4, 0xC3
	beq _08033CE4
	b _08033D38
_08033CAC:
	cmp r4, 0xD7
	beq _08033CEA
	b _08033D38
_08033CB2:
	movs r0, 0x87
	lsls r0, 1
	cmp r4, r0
	beq _08033D14
	cmp r4, r0
	bgt _08033CC8
	cmp r4, 0xF0
	blt _08033D38
	cmp r4, 0xF1
	ble _08033CE4
	b _08033CD4
_08033CC8:
	movs r0, 0x9C
	lsls r0, 1
	cmp r4, r0
	beq _08033CEA
	cmp r4, r0
	bgt _08033CDC
_08033CD4:
	subs r0, 0xC
	cmp r4, r0
	beq _08033CE4
	b _08033D38
_08033CDC:
	movs r0, 0xAD
	lsls r0, 1
	cmp r4, r0
	bne _08033D38
_08033CE4:
	movs r5, 0xF0
	lsls r5, 12
	b _08033D90
_08033CEA:
	movs r0, 0
	bl sub_80751E8
	adds r4, r0, 0
	movs r0, 0x2
	bl sub_80751E8
	ldr r1, _08033D10 @ =gUnknown_825E45C
	lsls r4, 24
	lsrs r4, 22
	adds r4, r1
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r4]
	ldr r0, [r0]
	orrs r1, r0
	lsls r5, r1, 16
	b _08033D90
	.align 2, 0
_08033D10: .4byte gUnknown_825E45C
_08033D14:
	ldrb r0, [r3]
	bl sub_80751D8
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_80751E8
	ldr r1, _08033D34 @ =gUnknown_825E45C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	b _08033D42
	.align 2, 0
_08033D34: .4byte gUnknown_825E45C
_08033D38:
	ldr r0, _08033D48 @ =gUnknown_825E45C
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_08033D42:
	lsls r5, r0, 16
	b _08033D90
	.align 2, 0
_08033D48: .4byte gUnknown_825E45C
_08033D4C:
	movs r0, 0x1
	bl sub_80751E8
	adds r5, r0, 0
	ldr r0, _08033DAC @ =gUnknown_2023BC4
	ldrb r0, [r0]
	bl sub_80751D8
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_80751E8
	adds r4, r0, 0
	movs r0, 0x3
	bl sub_80751E8
	ldr r3, _08033DB0 @ =gUnknown_825E45C
	lsls r5, 24
	lsrs r5, 22
	adds r5, r3
	lsls r4, 24
	lsrs r4, 22
	adds r4, r3
	ldr r2, [r5]
	ldr r1, [r4]
	orrs r2, r1
	lsls r0, 24
	lsrs r0, 22
	adds r0, r3
	ldr r0, [r0]
	orrs r2, r0
	lsls r5, r2, 16
_08033D90:
	movs r6, 0x8
_08033D92:
	ldr r0, _08033DB4 @ =0x00007fff
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x8
	adds r2, r6, 0
	movs r3, 0
	bl sub_8070588
_08033DA2:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033DAC: .4byte gUnknown_2023BC4
_08033DB0: .4byte gUnknown_825E45C
_08033DB4: .4byte 0x00007fff
	thumb_func_end sub_8033AC8

	.align 2, 0 @ Don't pad with nop.
