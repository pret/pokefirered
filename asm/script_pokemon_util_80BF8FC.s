	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BF8FC
sub_80BF8FC: @ 80BF8FC
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080BF934 @ =sub_80BF97C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BF938 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x3
	strh r0, [r1, 0x8]
	subs r0, 0x4
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080BF934: .4byte sub_80BF97C
_080BF938: .4byte gUnknown_3005090
	thumb_func_end sub_80BF8FC

	thumb_func_start sub_80BF93C
sub_80BF93C: @ 80BF93C
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080BF974 @ =sub_80BF97C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BF978 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x7
	strh r0, [r1, 0x8]
	subs r0, 0x8
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080BF974: .4byte sub_80BF97C
_080BF978: .4byte gUnknown_3005090
	thumb_func_end sub_80BF93C

	thumb_func_start sub_80BF97C
sub_80BF97C: @ 80BF97C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080BF9B4 @ =gUnknown_2037AB8
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BF9AC
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _080BF9B8 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	bl sub_81283A8
	adds r0, r4, 0
	bl DestroyTask
_080BF9AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF9B4: .4byte gUnknown_2037AB8
_080BF9B8: .4byte gUnknown_3005090
	thumb_func_end sub_80BF97C

	thumb_func_start sub_80BF9BC
sub_80BF9BC: @ 80BF9BC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080BF9F0 @ =gUnknown_2024284
	ldr r1, _080BF9F4 @ =gUnknown_20370C0
	ldrb r1, [r1]
	ldr r2, _080BF9F8 @ =gUnknown_2024029
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080BF9FC @ =c2_exit_to_overworld_2_switch
	movs r4, 0
	str r4, [sp]
	bl sub_8134738
	movs r0, 0x3
	bl sub_8138B38
	ldr r1, _080BFA00 @ =gUnknown_3005020
	ldr r0, _080BFA04 @ =sub_807DD24
	str r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF9F0: .4byte gUnknown_2024284
_080BF9F4: .4byte gUnknown_20370C0
_080BF9F8: .4byte gUnknown_2024029
_080BF9FC: .4byte c2_exit_to_overworld_2_switch
_080BFA00: .4byte gUnknown_3005020
_080BFA04: .4byte sub_807DD24
	thumb_func_end sub_80BF9BC

	thumb_func_start ScrSpecial_CountPokemonMoves
ScrSpecial_CountPokemonMoves: @ 80BFA08
	push {r4,r5,lr}
	ldr r1, _080BFA44 @ =gUnknown_20370D0
	movs r0, 0
	strh r0, [r1]
	movs r4, 0
	adds r5, r1, 0
_080BFA14:
	ldr r0, _080BFA48 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFA4C @ =gUnknown_2024284
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0xD
	bl GetMonData
	cmp r0, 0
	beq _080BFA32
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080BFA32:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080BFA14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BFA44: .4byte gUnknown_20370D0
_080BFA48: .4byte gUnknown_20370C0
_080BFA4C: .4byte gUnknown_2024284
	thumb_func_end ScrSpecial_CountPokemonMoves

	thumb_func_start ScrSpecial_GetPokemonNicknameAndMoveName
ScrSpecial_GetPokemonNicknameAndMoveName: @ 80BFA50
	push {r4,r5,lr}
	ldr r0, _080BFA90 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _080BFA94 @ =gUnknown_2024284
	adds r5, r0
	ldr r0, _080BFA98 @ =gUnknown_20370C2
	ldrh r1, [r0]
	adds r1, 0xD
	adds r0, r5, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _080BFA9C @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r0, _080BFAA0 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _080BFAA4 @ =gUnknown_8247094
	adds r1, r2
	bl StringCopy
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BFA90: .4byte gUnknown_20370C0
_080BFA94: .4byte gUnknown_2024284
_080BFA98: .4byte gUnknown_20370C2
_080BFA9C: .4byte gStringVar1
_080BFAA0: .4byte gStringVar2
_080BFAA4: .4byte gUnknown_8247094
	thumb_func_end ScrSpecial_GetPokemonNicknameAndMoveName

	thumb_func_start sub_80BFAA8
sub_80BFAA8: @ 80BFAA8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r0, 0xD
	str r0, [sp, 0x8]
	mov r0, r8
	ldr r1, [sp, 0x8]
	bl GetMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x14]
	strh r0, [r1]
	adds r3, r4, 0
	adds r3, 0xD
	str r3, [sp, 0xC]
	mov r0, r8
	adds r1, r3, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r7, r5, 0
	adds r7, 0x11
	str r7, [sp, 0x10]
	mov r0, r8
	adds r1, r7, 0
	bl GetMonData
	mov r1, sp
	adds r1, 0x5
	str r1, [sp, 0x18]
	strb r0, [r1]
	adds r3, r4, 0
	adds r3, 0x11
	str r3, [sp, 0x1C]
	mov r0, r8
	adds r1, r3, 0
	bl GetMonData
	add r7, sp, 0x4
	mov r10, r7
	strb r0, [r7]
	mov r0, r8
	movs r1, 0x15
	bl GetMonData
	mov r6, sp
	adds r6, 0x6
	strb r0, [r6]
	ldr r1, _080BFBA4 @ =gUnknown_825DEA1
	adds r0, r5, r1
	ldrb r0, [r0]
	mov r9, r0
	ldrb r0, [r6]
	adds r2, r0, 0
	mov r3, r9
	ands r2, r3
	lsls r5, 1
	asrs r2, r5
	lsls r2, 24
	lsrs r2, 24
	adds r1, r4, r1
	ldrb r3, [r1]
	adds r1, r0, 0
	ands r1, r3
	lsls r4, 1
	asrs r1, r4
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	bics r0, r7
	strb r0, [r6]
	ldrb r0, [r6]
	bics r0, r3
	strb r0, [r6]
	lsls r2, r4
	lsls r1, r5
	adds r2, r1
	ldrb r0, [r6]
	orrs r0, r2
	strb r0, [r6]
	mov r0, r8
	ldr r1, [sp, 0x8]
	mov r2, sp
	bl sub_804037C
	mov r0, r8
	ldr r1, [sp, 0xC]
	ldr r2, [sp, 0x14]
	bl sub_804037C
	mov r0, r8
	ldr r1, [sp, 0x10]
	mov r2, r10
	bl sub_804037C
	mov r0, r8
	ldr r1, [sp, 0x1C]
	ldr r2, [sp, 0x18]
	bl sub_804037C
	mov r0, r8
	movs r1, 0x15
	adds r2, r6, 0
	bl sub_804037C
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BFBA4: .4byte gUnknown_825DEA1
	thumb_func_end sub_80BFAA8

	thumb_func_start sub_80BFBA8
sub_80BFBA8: @ 80BFBA8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _080BFC08 @ =gUnknown_20370C0
	mov r8, r0
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080BFC0C @ =gUnknown_2024284
	adds r0, r5
	ldr r4, _080BFC10 @ =gUnknown_20370C2
	ldrb r2, [r4]
	movs r1, 0
	bl SetMonMoveSlot
	mov r1, r8
	ldrh r0, [r1]
	muls r0, r6
	adds r0, r5
	ldrb r1, [r4]
	bl RemoveMonPPBonus
	ldrh r4, [r4]
	cmp r4, 0x2
	bhi _080BFBFC
_080BFBDA:
	ldr r0, _080BFC08 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFC0C @ =gUnknown_2024284
	adds r0, r1
	lsls r1, r4, 24
	lsrs r1, 24
	adds r4, 0x1
	lsls r2, r4, 24
	lsrs r2, 24
	bl sub_80BFAA8
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x2
	bls _080BFBDA
_080BFBFC:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BFC08: .4byte gUnknown_20370C0
_080BFC0C: .4byte gUnknown_2024284
_080BFC10: .4byte gUnknown_20370C2
	thumb_func_end sub_80BFBA8

	thumb_func_start sub_80BFC14
sub_80BFC14: @ 80BFC14
	push {lr}
	ldr r0, _080BFC38 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFC3C @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	beq _080BFC44
	ldr r1, _080BFC40 @ =gUnknown_20370D0
	movs r0, 0x1
	strh r0, [r1]
	b _080BFC48
	.align 2, 0
_080BFC38: .4byte gUnknown_20370C0
_080BFC3C: .4byte gUnknown_2024284
_080BFC40: .4byte gUnknown_20370D0
_080BFC44:
	ldr r0, _080BFC4C @ =gUnknown_20370D0
	strh r1, [r0]
_080BFC48:
	pop {r0}
	bx r0
	.align 2, 0
_080BFC4C: .4byte gUnknown_20370D0
	thumb_func_end sub_80BFC14

	.align 2, 0 @ Don't pad with nop.
