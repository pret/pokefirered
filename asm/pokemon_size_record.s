	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start GetMonSizeHash
GetMonSizeHash: @ 80A069C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r0, 0
	movs r1, 0
	bl GetMonData
	lsls r0, 16
	str r0, [sp, 0x4]
	lsrs r0, 16
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x27
	bl GetMonData
	adds r7, r0, 0
	movs r6, 0xF
	ands r7, r6
	adds r0, r5, 0
	movs r1, 0x28
	bl GetMonData
	mov r8, r0
	mov r1, r8
	ands r1, r6
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0x29
	bl GetMonData
	mov r9, r0
	mov r3, r9
	ands r3, r6
	mov r9, r3
	adds r0, r5, 0
	movs r1, 0x2A
	bl GetMonData
	mov r10, r0
	ands r0, r6
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x2B
	bl GetMonData
	adds r4, r0, 0
	ands r4, r6
	adds r0, r5, 0
	movs r1, 0x2C
	bl GetMonData
	adds r2, r0, 0
	ands r2, r6
	mov r1, r8
	mov r3, r9
	eors r1, r3
	mov r8, r1
	mov r0, r8
	muls r0, r7
	movs r1, 0xFF
	ldr r3, [sp]
	ands r3, r1
	eors r0, r3
	eors r4, r2
	mov r1, r10
	muls r1, r4
	ldr r3, [sp, 0x4]
	lsrs r2, r3, 24
	eors r1, r2
	lsls r0, 8
	adds r0, r1
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetMonSizeHash

	thumb_func_start TranslateBigMonSizeTableIndex
TranslateBigMonSizeTableIndex: @ 80A0740
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x1
	ldr r3, _080A075C @ =gUnknown_83E272C
_080A074A:
	lsls r0, r1, 3
	adds r0, r3
	ldrh r0, [r0, 0x4]
	cmp r2, r0
	bcs _080A0760
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _080A076C
	.align 2, 0
_080A075C: .4byte gUnknown_83E272C
_080A0760:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xE
	bls _080A074A
	adds r0, r1, 0
_080A076C:
	pop {r1}
	bx r1
	thumb_func_end TranslateBigMonSizeTableIndex

	thumb_func_start GetMonSize
GetMonSize: @ 80A0770
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r6, 16
	lsrs r6, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8088E38
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0
	bl TranslateBigMonSizeTableIndex
	lsls r0, 24
	ldr r1, _080A07E0 @ =gUnknown_83E272C
	lsrs r0, 21
	adds r0, r1
	ldrh r1, [r0]
	str r1, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	ldrb r2, [r0, 0x2]
	movs r3, 0
	ldrh r4, [r0, 0x4]
	movs r5, 0
	adds r0, r6, 0
	movs r1, 0
	subs r0, r4
	sbcs r1, r5
	bl __udivdi3
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	adds r2, r0
	adcs r3, r1
	str r2, [sp]
	str r3, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0
	bl __muldi3
	movs r2, 0xA
	movs r3, 0
	bl __udivdi3
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A07E0: .4byte gUnknown_83E272C
	thumb_func_end GetMonSize

	thumb_func_start sub_80A07E4
sub_80A07E4: @ 80A07E4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x64
	muls r0, r1
	movs r1, 0xFE
	bl __udivsi3
	adds r5, r0, 0
	movs r1, 0xA
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x8
	bl ConvertIntToDecimalStringN
	ldr r1, _080A0828 @ =gUnknown_8417FB9
	bl StringAppend
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0828: .4byte gUnknown_8417FB9
	thumb_func_end sub_80A07E4

	thumb_func_start sub_80A082C
sub_80A082C: @ 80A082C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _080A0844 @ =gUnknown_20370D0
	ldrh r0, [r1]
	cmp r0, 0x5
	bls _080A0848
	movs r0, 0
	b _080A08C4
	.align 2, 0
_080A0844: .4byte gUnknown_20370D0
_080A0848:
	ldrh r1, [r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080A0870 @ =gUnknown_2024284
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _080A086A
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, r6
	beq _080A0874
_080A086A:
	movs r0, 0x1
	b _080A08C4
	.align 2, 0
_080A0870: .4byte gUnknown_2024284
_080A0874:
	mov r4, sp
	adds r0, r5, 0
	bl GetMonSizeHash
	strh r0, [r4]
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r6, 0
	bl GetMonSize
	adds r5, r0, 0
	ldrh r1, [r7]
	adds r0, r6, 0
	bl GetMonSize
	adds r4, r0, 0
	ldr r0, _080A08AC @ =gUnknown_2021D04
	adds r1, r4, 0
	bl sub_80A07E4
	ldr r0, _080A08B0 @ =gUnknown_2021CF0
	adds r1, r5, 0
	bl sub_80A07E4
	cmp r5, r4
	bne _080A08B4
	movs r0, 0x4
	b _080A08C4
	.align 2, 0
_080A08AC: .4byte gUnknown_2021D04
_080A08B0: .4byte gUnknown_2021CF0
_080A08B4:
	cmp r5, r4
	bcc _080A08C2
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r7]
	movs r0, 0x3
	b _080A08C4
_080A08C2:
	movs r0, 0x2
_080A08C4:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A082C

	thumb_func_start sub_80A08CC
sub_80A08CC: @ 80A08CC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r1, [r1]
	adds r0, r4, 0
	bl GetMonSize
	adds r1, r0, 0
	ldr r0, _080A08F8 @ =gUnknown_2021D04
	bl sub_80A07E4
	ldr r0, _080A08FC @ =gUnknown_2021CD0
	movs r1, 0xB
	muls r1, r4
	ldr r2, _080A0900 @ =gUnknown_8245EE0
	adds r1, r2
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A08F8: .4byte gUnknown_2021D04
_080A08FC: .4byte gUnknown_2021CD0
_080A0900: .4byte gUnknown_8245EE0
	thumb_func_end sub_80A08CC

	thumb_func_start sub_80A0904
sub_80A0904: @ 80A0904
	push {lr}
	ldr r0, _080A0914 @ =0x0000403d
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_080A0914: .4byte 0x0000403d
	thumb_func_end sub_80A0904

	thumb_func_start sub_80A0918
sub_80A0918: @ 80A0918
	push {lr}
	ldr r0, _080A092C @ =0x0000403d
	bl sub_806E454
	adds r1, r0, 0
	movs r0, 0xD6
	bl sub_80A08CC
	pop {r0}
	bx r0
	.align 2, 0
_080A092C: .4byte 0x0000403d
	thumb_func_end sub_80A0918

	thumb_func_start sub_80A0930
sub_80A0930: @ 80A0930
	push {r4,lr}
	ldr r0, _080A0950 @ =0x0000403d
	bl sub_806E454
	adds r1, r0, 0
	ldr r4, _080A0954 @ =gUnknown_20370D0
	movs r0, 0xD6
	bl sub_80A082C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0950: .4byte 0x0000403d
_080A0954: .4byte gUnknown_20370D0
	thumb_func_end sub_80A0930

	thumb_func_start sub_80A0958
sub_80A0958: @ 80A0958
	push {lr}
	ldr r0, _080A0968 @ =0x00004040
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_080A0968: .4byte 0x00004040
	thumb_func_end sub_80A0958

	thumb_func_start sub_80A096C
sub_80A096C: @ 80A096C
	push {lr}
	ldr r0, _080A0980 @ =0x00004040
	bl sub_806E454
	adds r1, r0, 0
	movs r0, 0x81
	bl sub_80A08CC
	pop {r0}
	bx r0
	.align 2, 0
_080A0980: .4byte 0x00004040
	thumb_func_end sub_80A096C

	thumb_func_start sub_80A0984
sub_80A0984: @ 80A0984
	push {r4,lr}
	ldr r0, _080A09A4 @ =0x00004040
	bl sub_806E454
	adds r1, r0, 0
	ldr r4, _080A09A8 @ =gUnknown_20370D0
	movs r0, 0x81
	bl sub_80A082C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A09A4: .4byte 0x00004040
_080A09A8: .4byte gUnknown_20370D0
	thumb_func_end sub_80A0984

	thumb_func_start GiveGiftRibbonToParty
GiveGiftRibbonToParty: @ 80A09AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r7, 0
	add r4, sp, 0x8
	movs r0, 0x1
	strb r0, [r4]
	ldr r1, _080A0A34 @ =gUnknown_83E27AC
	mov r0, sp
	movs r2, 0x7
	bl memcpy
	mov r8, r4
	cmp r6, 0xA
	bhi _080A0A28
	cmp r5, 0x40
	bhi _080A0A28
	ldr r0, _080A0A38 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _080A0A3C @ =0x0000309c
	adds r0, r1
	adds r0, r6
	strb r5, [r0]
	movs r5, 0
_080A09E6:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080A0A40 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080A0A18
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _080A0A18
	mov r1, sp
	adds r0, r1, r6
	ldrb r1, [r0]
	adds r0, r4, 0
	mov r2, r8
	bl sub_804037C
	movs r7, 0x1
_080A0A18:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080A09E6
	cmp r7, 0
	beq _080A0A28
	ldr r0, _080A0A44 @ =0x0000083b
	bl FlagSet
_080A0A28:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0A34: .4byte gUnknown_83E27AC
_080A0A38: .4byte gUnknown_3005008
_080A0A3C: .4byte 0x0000309c
_080A0A40: .4byte gUnknown_2024284
_080A0A44: .4byte 0x0000083b
	thumb_func_end GiveGiftRibbonToParty

	.align 2, 0 @ Don't pad with nop.
