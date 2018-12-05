	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BD718
sub_80BD718: @ 80BD718
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x14
	beq _080BD73E
	cmp r0, 0x14
	bgt _080BD738
	cmp r0, 0x11
	blt _080BD74C
	ldr r0, _080BD734 @ =0x0000082c
	bl FlagGet
	b _080BD746
	.align 2, 0
_080BD734: .4byte 0x0000082c
_080BD738:
	cmp r1, 0x15
	beq _080BD742
	b _080BD74C
_080BD73E:
	movs r0, 0
	b _080BD74E
_080BD742:
	bl sub_80BDCA8
_080BD746:
	lsls r0, 24
	lsrs r0, 24
	b _080BD74E
_080BD74C:
	movs r0, 0x1
_080BD74E:
	pop {r1}
	bx r1
	thumb_func_end sub_80BD718

	thumb_func_start start_menu_is_selected_item_valid
start_menu_is_selected_item_valid: @ 80BD754
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r0, 0x15
	bne _080BD76C
	movs r0, 0
	bl pokedex_count
	lsls r0, 16
	lsrs r0, 16
	b _080BD782
_080BD76C:
	bl sub_80BD718
	lsls r0, 24
	cmp r0, 0
	bne _080BD77A
	movs r0, 0
	b _080BD782
_080BD77A:
	ldr r0, _080BD788 @ =gUnknown_83ECED4
	lsls r1, r4, 3
	adds r1, r0
	ldrh r0, [r1, 0x6]
_080BD782:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BD788: .4byte gUnknown_83ECED4
	thumb_func_end start_menu_is_selected_item_valid

	thumb_func_start sub_80BD78C
sub_80BD78C: @ 80BD78C
	push {r4,r5,lr}
	lsls r2, r0, 16
	lsrs r1, r2, 16
	ldr r0, _080BD7B8 @ =0x0000ffff
	cmp r1, r0
	beq _080BD7EC
	lsrs r3, r2, 25
	ldr r5, _080BD7BC @ =0x000001ff
	ands r5, r1
	cmp r3, 0x15
	bhi _080BD7F0
	ldr r0, _080BD7C0 @ =gUnknown_83ECED4
	lsls r2, r3, 3
	adds r1, r2, r0
	ldrh r4, [r1, 0x4]
	cmp r3, 0x13
	bgt _080BD7C4
	cmp r3, 0x12
	bge _080BD7C8
	cmp r3, 0
	beq _080BD7C8
	b _080BD7E8
	.align 2, 0
_080BD7B8: .4byte 0x0000ffff
_080BD7BC: .4byte 0x000001ff
_080BD7C0: .4byte gUnknown_83ECED4
_080BD7C4:
	cmp r3, 0x15
	bne _080BD7E8
_080BD7C8:
	adds r0, r2, r0
	ldr r2, [r0]
	movs r1, 0
	cmp r1, r4
	bcs _080BD7F0
_080BD7D2:
	lsls r0, r1, 1
	adds r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	beq _080BD7EC
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bcc _080BD7D2
	b _080BD7F0
_080BD7E8:
	cmp r5, r4
	bcs _080BD7F0
_080BD7EC:
	movs r0, 0
	b _080BD7F2
_080BD7F0:
	movs r0, 0x1
_080BD7F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD78C

	thumb_func_start GetEasyChatWord
GetEasyChatWord: @ 80BD7F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r0, 0x13
	bgt _080BD810
	cmp r0, 0x12
	bge _080BD824
	cmp r0, 0
	beq _080BD814
	b _080BD834
_080BD810:
	cmp r0, 0x15
	bne _080BD834
_080BD814:
	movs r0, 0xB
	muls r0, r2
	ldr r1, _080BD820 @ =gSpeciesNames
	adds r0, r1
	b _080BD846
	.align 2, 0
_080BD820: .4byte gSpeciesNames
_080BD824:
	movs r0, 0xD
	muls r0, r2
	ldr r1, _080BD830 @ =gMoveNames
	adds r0, r1
	b _080BD846
	.align 2, 0
_080BD830: .4byte gMoveNames
_080BD834:
	ldr r1, _080BD84C @ =gUnknown_83ECED4
	lsls r0, 3
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_080BD846:
	pop {r1}
	bx r1
	.align 2, 0
_080BD84C: .4byte gUnknown_83ECED4
	thumb_func_end GetEasyChatWord

	thumb_func_start CopyEasyChatWord
CopyEasyChatWord: @ 80BD850
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r6, r1, 16
	lsrs r0, r6, 16
	adds r4, r0, 0
	bl sub_80BD78C
	lsls r0, 24
	cmp r0, 0
	beq _080BD86C
	ldr r1, _080BD868 @ =gUnknown_841E093
	b _080BD87E
	.align 2, 0
_080BD868: .4byte gUnknown_841E093
_080BD86C:
	ldr r0, _080BD888 @ =0x0000ffff
	cmp r4, r0
	beq _080BD890
	ldr r1, _080BD88C @ =0x000001ff
	ands r1, r4
	lsrs r0, r6, 25
	bl GetEasyChatWord
	adds r1, r0, 0
_080BD87E:
	adds r0, r5, 0
	bl StringCopy
	b _080BD896
	.align 2, 0
_080BD888: .4byte 0x0000ffff
_080BD88C: .4byte 0x000001ff
_080BD890:
	movs r0, 0xFF
	strb r0, [r5]
	adds r0, r5, 0
_080BD896:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CopyEasyChatWord

	thumb_func_start ConvertEasyChatWordsToString
ConvertEasyChatWordsToString: @ 80BD89C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 16
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	ldr r0, _080BD924 @ =0xffff0000
	adds r2, r0
	lsrs r7, r2, 16
	movs r0, 0
	cmp r0, r9
	bcs _080BD90C
_080BD8BE:
	movs r6, 0
	adds r0, 0x1
	mov r8, r0
	cmp r6, r7
	bcs _080BD8F0
	ldr r2, _080BD928 @ =0x0000ffff
_080BD8CA:
	ldrh r1, [r5]
	adds r0, r4, 0
	str r2, [sp]
	bl CopyEasyChatWord
	adds r4, r0, 0
	ldrh r0, [r5]
	ldr r2, [sp]
	cmp r0, r2
	beq _080BD8E4
	movs r0, 0
	strb r0, [r4]
	adds r4, 0x1
_080BD8E4:
	adds r5, 0x2
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r7
	bcc _080BD8CA
_080BD8F0:
	ldrh r1, [r5]
	adds r5, 0x2
	adds r0, r4, 0
	bl CopyEasyChatWord
	adds r4, r0, 0
	movs r0, 0xFE
	strb r0, [r4]
	adds r4, 0x1
	mov r1, r8
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, r9
	bcc _080BD8BE
_080BD90C:
	subs r4, 0x1
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BD924: .4byte 0xffff0000
_080BD928: .4byte 0x0000ffff
	thumb_func_end ConvertEasyChatWordsToString

	thumb_func_start sub_80BD92C
sub_80BD92C: @ 80BD92C
	push {r4,r5,lr}
	lsls r5, r0, 16
	lsrs r0, r5, 16
	adds r4, r0, 0
	ldr r0, _080BD940 @ =0x0000ffff
	cmp r4, r0
	bne _080BD944
	movs r0, 0
	b _080BD96A
	.align 2, 0
_080BD940: .4byte 0x0000ffff
_080BD944:
	adds r0, r4, 0
	bl sub_80BD78C
	lsls r0, 24
	cmp r0, 0
	bne _080BD960
	ldr r1, _080BD95C @ =0x000001ff
	ands r1, r4
	lsrs r0, r5, 25
	bl GetEasyChatWord
	b _080BD962
	.align 2, 0
_080BD95C: .4byte 0x000001ff
_080BD960:
	ldr r0, _080BD970 @ =gUnknown_841E093
_080BD962:
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
_080BD96A:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BD970: .4byte gUnknown_841E093
	thumb_func_end sub_80BD92C

	thumb_func_start sub_80BD974
sub_80BD974: @ 80BD974
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 16
	lsrs r3, 16
	mov r10, r3
	movs r7, 0
	cmp r7, r8
	bcs _080BD9D6
	subs r0, r1, 0x1
	lsls r0, 16
	mov r9, r0
_080BD99E:
	mov r0, r9
	lsrs r4, r0, 16
	movs r5, 0
	cmp r5, r1
	bcs _080BD9C4
_080BD9A8:
	ldrh r0, [r6]
	adds r6, 0x2
	str r1, [sp]
	bl sub_80BD92C
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, [sp]
	cmp r5, r1
	bcc _080BD9A8
_080BD9C4:
	cmp r4, r10
	bls _080BD9CC
	movs r0, 0x1
	b _080BD9D8
_080BD9CC:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, r8
	bcc _080BD99E
_080BD9D6:
	movs r0, 0
_080BD9D8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD974

	thumb_func_start sub_80BD9E8
sub_80BD9E8: @ 80BD9E8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl Random
	ldr r2, _080BDA38 @ =gUnknown_83ECED4
	lsls r1, r4, 3
	adds r1, r2
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1, 0x4]
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r4, 0
	beq _080BDA16
	cmp r4, 0x15
	beq _080BDA16
	cmp r4, 0x12
	beq _080BDA16
	cmp r4, 0x13
	bne _080BDA24
_080BDA16:
	ldr r1, _080BDA38 @ =gUnknown_83ECED4
	lsls r0, r4, 3
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r2, [r0]
_080BDA24:
	movs r0, 0x7F
	ands r0, r4
	lsls r0, 9
	ldr r1, _080BDA3C @ =0x000001ff
	ands r2, r1
	orrs r0, r2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BDA38: .4byte gUnknown_83ECED4
_080BDA3C: .4byte 0x000001ff
	thumb_func_end sub_80BD9E8

	thumb_func_start sub_80BDA40
sub_80BDA40: @ 80BDA40
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0, 0
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BD718
	lsls r0, 24
	cmp r0, 0
	bne _080BDA60
	ldr r0, _080BDA5C @ =0x0000ffff
	b _080BDA74
	.align 2, 0
_080BDA5C: .4byte 0x0000ffff
_080BDA60:
	cmp r4, 0x15
	beq _080BDA6C
	adds r0, r4, 0
	bl sub_80BD9E8
	b _080BDA70
_080BDA6C:
	bl sub_80BDCB8
_080BDA70:
	lsls r0, 16
	lsrs r0, 16
_080BDA74:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BDA40

	thumb_func_start sub_80BDA7C
sub_80BDA7C: @ 80BDA7C
	push {r4,r5,lr}
	ldr r0, _080BDA90 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080BDAB4
	cmp r0, 0x1
	bgt _080BDA94
	cmp r0, 0
	beq _080BDA9E
	b _080BDB08
	.align 2, 0
_080BDA90: .4byte gSpecialVar_0x8004
_080BDA94:
	cmp r0, 0x2
	beq _080BDADC
	cmp r0, 0x3
	beq _080BDAEC
	b _080BDB08
_080BDA9E:
	ldr r0, _080BDAAC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _080BDAB0 @ =0x00002ca0
	adds r5, r0, r1
	movs r2, 0x2
	b _080BDAF6
	.align 2, 0
_080BDAAC: .4byte gSaveBlock1Ptr
_080BDAB0: .4byte 0x00002ca0
_080BDAB4:
	ldr r0, _080BDAD4 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _080BDAD8 @ =0x00002cac
	adds r5, r0, r1
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x12
	bl sub_80BD974
	lsls r0, 24
	cmp r0, 0
	beq _080BDAF4
	movs r2, 0x2
	movs r3, 0x3
	b _080BDAF8
	.align 2, 0
_080BDAD4: .4byte gSaveBlock1Ptr
_080BDAD8: .4byte 0x00002cac
_080BDADC:
	ldr r0, _080BDAE4 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _080BDAE8 @ =0x00002cb8
	b _080BDAF2
	.align 2, 0
_080BDAE4: .4byte gSaveBlock1Ptr
_080BDAE8: .4byte 0x00002cb8
_080BDAEC:
	ldr r0, _080BDB10 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _080BDB14 @ =0x00002cc4
_080BDAF2:
	adds r5, r0, r1
_080BDAF4:
	movs r2, 0x3
_080BDAF6:
	movs r3, 0x2
_080BDAF8:
	ldr r4, _080BDB18 @ =gStringVar4
	adds r0, r4, 0
	adds r1, r5, 0
	bl ConvertEasyChatWordsToString
	adds r0, r4, 0
	bl ShowFieldAutoScrollMessage
_080BDB08:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDB10: .4byte gSaveBlock1Ptr
_080BDB14: .4byte 0x00002cc4
_080BDB18: .4byte gStringVar4
	thumb_func_end sub_80BDA7C

	thumb_func_start sub_80BDB1C
sub_80BDB1C: @ 80BDB1C
	push {lr}
	bl Random
	movs r1, 0x1
	ands r1, r0
	movs r0, 0xC
	cmp r1, 0
	beq _080BDB2E
	movs r0, 0xD
_080BDB2E:
	bl sub_80BDA40
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _080BDB44 @ =gStringVar2
	bl CopyEasyChatWord
	pop {r0}
	bx r0
	.align 2, 0
_080BDB44: .4byte gStringVar2
	thumb_func_end sub_80BDB1C

	thumb_func_start sub_80BDB48
sub_80BDB48: @ 80BDB48
	lsls r0, 24
	lsrs r2, r0, 27
	movs r1, 0xE0
	lsls r1, 19
	ands r1, r0
	lsrs r1, 24
	ldr r0, _080BDB68 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r3, _080BDB6C @ =0x00002f10
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_080BDB68: .4byte gSaveBlock1Ptr
_080BDB6C: .4byte 0x00002f10
	thumb_func_end sub_80BDB48

	thumb_func_start EnableRareWord
EnableRareWord: @ 80BDB70
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x20
	bhi _080BDB94
	lsrs r3, r0, 27
	movs r2, 0x7
	ands r2, r1
	ldr r0, _080BDB98 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldr r0, _080BDB9C @ =0x00002f10
	adds r1, r0
	adds r1, r3
	movs r0, 0x1
	lsls r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_080BDB94:
	pop {r0}
	bx r0
	.align 2, 0
_080BDB98: .4byte gSaveBlock1Ptr
_080BDB9C: .4byte 0x00002f10
	thumb_func_end EnableRareWord

	thumb_func_start sub_80BDBA0
sub_80BDBA0: @ 80BDBA0
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0
_080BDBA6:
	adds r0, r4, 0
	bl sub_80BDB48
	lsls r0, 24
	cmp r0, 0
	beq _080BDBB8
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080BDBB8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x20
	bls _080BDBA6
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BDBA0

	thumb_func_start sub_80BDBCC
sub_80BDBCC: @ 80BDBCC
	push {r4-r6,lr}
	bl sub_80BDBA0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x21
	bne _080BDBF8
	b _080BDC32
_080BDBDC:
	adds r0, r5, 0
	bl EnableRareWord
	ldr r0, _080BDBF4 @ =0x000001ff
	ands r4, r0
	movs r1, 0xA0
	lsls r1, 6
	adds r0, r1, 0
	orrs r4, r0
	adds r0, r4, 0
	b _080BDC34
	.align 2, 0
_080BDBF4: .4byte 0x000001ff
_080BDBF8:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x21
	subs r1, r4
	bl __modsi3
	lsls r0, 16
	lsrs r6, r0, 16
	movs r4, 0
_080BDC0E:
	lsls r0, r4, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80BDB48
	lsls r0, 24
	cmp r0, 0
	bne _080BDC28
	cmp r6, 0
	beq _080BDBDC
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080BDC28:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x20
	bls _080BDC0E
_080BDC32:
	ldr r0, _080BDC3C @ =0x0000ffff
_080BDC34:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BDC3C: .4byte 0x0000ffff
	thumb_func_end sub_80BDBCC

	thumb_func_start sub_80BDC40
sub_80BDC40: @ 80BDC40
	push {r4,r5,lr}
	bl sub_80BDBA0
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080BDC64
	b _080BDC9A
_080BDC50:
	ldr r0, _080BDC60 @ =0x000001ff
	ands r4, r0
	movs r1, 0xA0
	lsls r1, 6
	adds r0, r1, 0
	orrs r4, r0
	adds r0, r4, 0
	b _080BDC9C
	.align 2, 0
_080BDC60: .4byte 0x000001ff
_080BDC64:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0
_080BDC78:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BDB48
	lsls r0, 24
	cmp r0, 0
	beq _080BDC90
	cmp r5, 0
	beq _080BDC50
	subs r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080BDC90:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x20
	bls _080BDC78
_080BDC9A:
	ldr r0, _080BDCA4 @ =0x0000ffff
_080BDC9C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BDCA4: .4byte 0x0000ffff
	thumb_func_end sub_80BDC40

	thumb_func_start sub_80BDCA8
sub_80BDCA8: @ 80BDCA8
	push {lr}
	bl sub_806E25C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80BDCA8

	thumb_func_start sub_80BDCB8
sub_80BDCB8: @ 80BDCB8
	push {r4-r7,lr}
	movs r0, 0
	bl start_menu_is_selected_item_valid
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _080BDCD8
	b _080BDD22
_080BDCCA:
	ldrh r1, [r5]
	ldr r0, _080BDCD4 @ =0x000001ff
	ands r0, r1
	b _080BDD24
	.align 2, 0
_080BDCD4: .4byte 0x000001ff
_080BDCD8:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080BDD2C @ =gUnknown_83ECED4
	ldr r5, [r0]
	ldrh r7, [r0, 0x4]
	movs r6, 0
	cmp r6, r7
	bcs _080BDD22
_080BDCF6:
	ldrh r0, [r5]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl GetSetPokedexFlag
	lsls r0, 24
	cmp r0, 0
	beq _080BDD16
	cmp r4, 0
	beq _080BDCCA
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080BDD16:
	adds r5, 0x2
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r7
	bcc _080BDCF6
_080BDD22:
	ldr r0, _080BDD30 @ =0x0000ffff
_080BDD24:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BDD2C: .4byte gUnknown_83ECED4
_080BDD30: .4byte 0x0000ffff
	thumb_func_end sub_80BDCB8

	thumb_func_start sub_80BDD34
sub_80BDD34: @ 80BDD34
	push {r4-r7,lr}
	movs r4, 0
	ldr r5, _080BDE00 @ =gSaveBlock1Ptr
	ldr r3, _080BDE04 @ =0x00002ca0
	ldr r2, _080BDE08 @ =gUnknown_83EDFF0
_080BDD3E:
	ldr r1, [r5]
	lsls r0, r4, 1
	adds r1, r3
	adds r1, r0
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080BDD3E
	movs r4, 0
	ldr r5, _080BDE00 @ =gSaveBlock1Ptr
	ldr r3, _080BDE0C @ =0x00002cac
	ldr r2, _080BDE10 @ =gUnknown_83EDFF8
_080BDD5E:
	ldr r1, [r5]
	lsls r0, r4, 1
	adds r1, r3
	adds r1, r0
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x5
	bls _080BDD5E
	movs r4, 0
	ldr r0, _080BDE00 @ =gSaveBlock1Ptr
	mov r12, r0
	ldr r7, _080BDE14 @ =0x00002cb8
	ldr r0, _080BDE18 @ =0x0000ffff
	adds r5, r0, 0
	ldr r6, _080BDE1C @ =0x00002cc4
_080BDD84:
	mov r0, r12
	ldr r2, [r0]
	lsls r3, r4, 1
	adds r1, r2, r7
	adds r1, r3
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	adds r2, r6
	adds r2, r3
	ldrh r0, [r2]
	orrs r0, r5
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x5
	bls _080BDD84
	movs r4, 0
	ldr r7, _080BDE00 @ =gSaveBlock1Ptr
	ldr r6, _080BDE20 @ =0x00002cd0
	ldr r0, _080BDE18 @ =0x0000ffff
	adds r5, r0, 0
_080BDDB2:
	movs r2, 0
	lsls r0, r4, 3
	adds r0, r4
	lsls r3, r0, 2
_080BDDBA:
	ldr r1, [r7]
	lsls r0, r2, 1
	adds r0, r3
	adds r1, r6
	adds r1, r0
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x8
	bls _080BDDBA
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080BDDB2
	movs r4, 0
	ldr r3, _080BDE00 @ =gSaveBlock1Ptr
	ldr r2, _080BDE24 @ =0x00002f10
	movs r1, 0
_080BDDE6:
	ldr r0, [r3]
	adds r0, r2
	adds r0, r4
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3F
	bls _080BDDE6
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDE00: .4byte gSaveBlock1Ptr
_080BDE04: .4byte 0x00002ca0
_080BDE08: .4byte gUnknown_83EDFF0
_080BDE0C: .4byte 0x00002cac
_080BDE10: .4byte gUnknown_83EDFF8
_080BDE14: .4byte 0x00002cb8
_080BDE18: .4byte 0x0000ffff
_080BDE1C: .4byte 0x00002cc4
_080BDE20: .4byte 0x00002cd0
_080BDE24: .4byte 0x00002f10
	thumb_func_end sub_80BDD34

	thumb_func_start sub_80BDE28
sub_80BDE28: @ 80BDE28
	push {lr}
	bl sub_8143DA8
	ldr r1, _080BDE40 @ =0x0000ffff
	adds r2, r1, 0
	adds r1, r0, 0x6
_080BDE34:
	strh r2, [r1]
	subs r1, 0x2
	cmp r1, r0
	bge _080BDE34
	pop {r0}
	bx r0
	.align 2, 0
_080BDE40: .4byte 0x0000ffff
	thumb_func_end sub_80BDE28

	thumb_func_start sub_80BDE44
sub_80BDE44: @ 80BDE44
	push {r4,lr}
	ldr r4, _080BDE60 @ =gUnknown_20399BC
	ldr r0, _080BDE64 @ =0x00003ba4
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _080BDE68
	bl sub_80BDE88
	bl sub_80BDFF8
	movs r0, 0x1
	b _080BDE6A
	.align 2, 0
_080BDE60: .4byte gUnknown_20399BC
_080BDE64: .4byte 0x00003ba4
_080BDE68:
	movs r0, 0
_080BDE6A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BDE44

	thumb_func_start sub_80BDE70
sub_80BDE70: @ 80BDE70
	push {lr}
	ldr r0, _080BDE84 @ =gUnknown_20399BC
	ldr r0, [r0]
	cmp r0, 0
	beq _080BDE7E
	bl Free
_080BDE7E:
	pop {r0}
	bx r0
	.align 2, 0
_080BDE84: .4byte gUnknown_20399BC
	thumb_func_end sub_80BDE70

	thumb_func_start sub_80BDE88
sub_80BDE88: @ 80BDE88
	push {r4,lr}
	ldr r4, _080BDF30 @ =gUnknown_20399BC
	ldr r1, [r4]
	movs r0, 0
	strh r0, [r1]
	bl pokedex_count
	lsls r0, 16
	cmp r0, 0
	beq _080BDEB0
	ldr r0, [r4]
	ldrh r1, [r0]
	adds r2, r1, 0x1
	strh r2, [r0]
	lsls r1, 16
	lsrs r1, 15
	adds r0, 0x2
	adds r0, r1
	movs r1, 0x15
	strh r1, [r0]
_080BDEB0:
	movs r3, 0x1
_080BDEB2:
	ldr r0, [r4]
	ldrh r2, [r0]
	adds r1, r2, 0x1
	strh r1, [r0]
	lsls r2, 16
	lsrs r2, 15
	adds r0, 0x2
	adds r0, r2
	strh r3, [r0]
	adds r3, 0x1
	cmp r3, 0x10
	ble _080BDEB2
	ldr r0, _080BDF34 @ =0x0000082c
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080BDF0C
	ldr r0, _080BDF30 @ =gUnknown_20399BC
	ldr r2, [r0]
	ldrh r0, [r2]
	adds r1, r0, 0x1
	strh r1, [r2]
	lsls r0, 16
	lsrs r0, 15
	adds r3, r2, 0x2
	adds r0, r3, r0
	movs r1, 0x11
	strh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0, 0x1
	strh r1, [r2]
	lsls r0, 16
	lsrs r0, 15
	adds r0, r3, r0
	movs r1, 0x12
	strh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0, 0x1
	strh r1, [r2]
	lsls r0, 16
	lsrs r0, 15
	adds r3, r0
	movs r0, 0x13
	strh r0, [r3]
_080BDF0C:
	bl sub_806E25C
	cmp r0, 0
	beq _080BDF2A
	ldr r0, _080BDF30 @ =gUnknown_20399BC
	ldr r0, [r0]
	ldrh r1, [r0]
	adds r2, r1, 0x1
	strh r2, [r0]
	lsls r1, 16
	lsrs r1, 15
	adds r0, 0x2
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
_080BDF2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BDF30: .4byte gUnknown_20399BC
_080BDF34: .4byte 0x0000082c
	thumb_func_end sub_80BDE88

	thumb_func_start sub_80BDF38
sub_80BDF38: @ 80BDF38
	ldr r0, _080BDF40 @ =gUnknown_20399BC
	ldr r0, [r0]
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080BDF40: .4byte gUnknown_20399BC
	thumb_func_end sub_80BDF38

	thumb_func_start sub_80BDF44
sub_80BDF44: @ 80BDF44
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BDF60 @ =gUnknown_20399BC
	ldr r1, [r0]
	ldrh r0, [r1]
	cmp r2, r0
	bcs _080BDF64
	lsls r0, r2, 1
	adds r1, 0x2
	adds r1, r0
	ldrb r0, [r1]
	b _080BDF66
	.align 2, 0
_080BDF60: .4byte gUnknown_20399BC
_080BDF64:
	movs r0, 0x16
_080BDF66:
	pop {r1}
	bx r1
	thumb_func_end sub_80BDF44

	thumb_func_start sub_80BDF6C
sub_80BDF6C: @ 80BDF6C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsls r2, 16
	lsrs r5, r2, 16
	ldr r0, _080BDFAC @ =gUnknown_83EDF98
	lsrs r1, 22
	adds r1, r0
	ldr r1, [r1]
	adds r0, r4, 0
	bl StringCopy
	adds r1, r0, 0
	subs r4, r1, r4
	lsls r4, 16
	lsrs r0, r4, 16
	cmp r0, r5
	bcs _080BDFA0
	movs r2, 0
_080BDF92:
	strb r2, [r1]
	adds r1, 0x1
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _080BDF92
_080BDFA0:
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r1, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BDFAC: .4byte gUnknown_83EDF98
	thumb_func_end sub_80BDF6C

	thumb_func_start sub_80BDFB0
sub_80BDFB0: @ 80BDFB0
	lsls r0, 24
	ldr r1, _080BDFBC @ =gUnknown_83EDF98
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080BDFBC: .4byte gUnknown_83EDF98
	thumb_func_end sub_80BDFB0

	thumb_func_start CopyEasyChatWordPadded
CopyEasyChatWordPadded: @ 80BDFC0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	bl CopyEasyChatWord
	adds r1, r0, 0
	subs r4, r1, r4
	lsls r4, 16
	lsrs r0, r4, 16
	cmp r0, r5
	bcs _080BDFEC
	movs r2, 0
_080BDFDE:
	strb r2, [r1]
	adds r1, 0x1
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _080BDFDE
_080BDFEC:
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r1, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CopyEasyChatWordPadded

	thumb_func_start sub_80BDFF8
sub_80BDFF8: @ 80BDFF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _080BE06C @ =gUnknown_300116C
	movs r0, 0
	str r0, [r1]
	mov r10, r0
_080BE00A:
	ldr r3, _080BE070 @ =gUnknown_83EDEC0
	ldr r2, [r1]
	lsls r1, r2, 3
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r4, [r0]
	ldr r0, _080BE074 @ =gUnknown_300117C
	str r4, [r0]
	adds r1, r3
	ldr r0, [r1]
	ldr r1, _080BE078 @ =gUnknown_3001184
	str r0, [r1]
	ldr r0, _080BE07C @ =gUnknown_20399BC
	ldr r0, [r0]
	lsls r2, 1
	adds r0, 0x2E
	adds r0, r2
	mov r2, r10
	strh r2, [r0]
	ldr r5, _080BE080 @ =gUnknown_3001178
	mov r3, r10
	str r3, [r5]
	ldr r0, _080BE084 @ =gUnknown_3001170
	str r3, [r0]
	cmp r10, r4
	blt _080BE040
	b _080BE13C
_080BE040:
	ldr r1, _080BE088 @ =gUnknown_3001180
	mov r9, r1
	adds r2, r0, 0
	mov r8, r2
_080BE048:
	ldr r3, _080BE078 @ =gUnknown_3001184
	ldr r2, [r3]
	ldrh r0, [r2]
	ldr r1, _080BE08C @ =0x0000ffff
	cmp r0, r1
	bne _080BE0E4
	adds r1, r2, 0x2
	str r1, [r3]
	ldrh r0, [r2, 0x2]
	mov r2, r9
	str r0, [r2]
	adds r1, 0x2
	str r1, [r3]
	mov r3, r8
	ldr r0, [r3]
	adds r0, 0x2
	str r0, [r3]
	b _080BE0EA
	.align 2, 0
_080BE06C: .4byte gUnknown_300116C
_080BE070: .4byte gUnknown_83EDEC0
_080BE074: .4byte gUnknown_300117C
_080BE078: .4byte gUnknown_3001184
_080BE07C: .4byte gUnknown_20399BC
_080BE080: .4byte gUnknown_3001178
_080BE084: .4byte gUnknown_3001170
_080BE088: .4byte gUnknown_3001180
_080BE08C: .4byte 0x0000ffff
_080BE090:
	ldr r0, _080BE0D4 @ =gUnknown_20399BC
	ldr r4, [r0]
	ldr r0, _080BE0D8 @ =gUnknown_3001178
	ldr r5, [r0]
	lsls r1, r5, 1
	ldr r0, _080BE0DC @ =gUnknown_300116C
	ldr r3, [r0]
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 3
	subs r0, r3
	lsls r0, 2
	adds r1, r0
	adds r2, r4, 0
	adds r2, 0x64
	adds r2, r1
	ldr r0, [r6]
	ldr r1, [r7]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r5, 0x1
	ldr r1, _080BE0D8 @ =gUnknown_3001178
	str r5, [r1]
	lsls r3, 1
	adds r4, 0x2E
	adds r4, r3
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r4, _080BE0E0 @ =gUnknown_3001180
	b _080BE120
	.align 2, 0
_080BE0D4: .4byte gUnknown_20399BC
_080BE0D8: .4byte gUnknown_3001178
_080BE0DC: .4byte gUnknown_300116C
_080BE0E0: .4byte gUnknown_3001180
_080BE0E4:
	movs r0, 0x1
	mov r2, r9
	str r0, [r2]
_080BE0EA:
	ldr r4, _080BE158 @ =gUnknown_3001180
	ldr r1, _080BE15C @ =gUnknown_3001174
	mov r3, r10
	str r3, [r1]
	ldr r0, [r4]
	cmp r10, r0
	bge _080BE120
	adds r6, r1, 0
	ldr r7, _080BE160 @ =gUnknown_3001184
	ldr r4, _080BE158 @ =gUnknown_3001180
_080BE0FE:
	ldr r0, [r6]
	ldr r1, [r7]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl sub_80BE440
	lsls r0, 24
	cmp r0, 0
	bne _080BE090
	ldr r1, [r6]
	adds r1, 0x1
	str r1, [r6]
	mov r2, r9
	ldr r0, [r2]
	cmp r1, r0
	blt _080BE0FE
_080BE120:
	ldr r2, [r4]
	lsls r1, r2, 1
	ldr r3, _080BE160 @ =gUnknown_3001184
	ldr r0, [r3]
	adds r0, r1
	str r0, [r3]
	mov r0, r8
	ldr r1, [r0]
	adds r1, r2
	str r1, [r0]
	ldr r0, _080BE164 @ =gUnknown_300117C
	ldr r0, [r0]
	cmp r1, r0
	blt _080BE048
_080BE13C:
	ldr r1, _080BE168 @ =gUnknown_300116C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x1A
	bgt _080BE14A
	b _080BE00A
_080BE14A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE158: .4byte gUnknown_3001180
_080BE15C: .4byte gUnknown_3001174
_080BE160: .4byte gUnknown_3001184
_080BE164: .4byte gUnknown_300117C
_080BE168: .4byte gUnknown_300116C
	thumb_func_end sub_80BDFF8

	thumb_func_start sub_80BE16C
sub_80BE16C: @ 80BE16C
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	cmp r0, 0
	bne _080BE17E
	adds r0, r1, 0
	bl sub_80BE1E8
	b _080BE184
_080BE17E:
	adds r0, r1, 0
	bl sub_80BE2F8
_080BE184:
	ldr r1, _080BE194 @ =gUnknown_20399BC
	ldr r1, [r1]
	ldr r2, _080BE198 @ =0x00003ba0
	adds r1, r2
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BE194: .4byte gUnknown_20399BC
_080BE198: .4byte 0x00003ba0
	thumb_func_end sub_80BE16C

	thumb_func_start sub_80BE19C
sub_80BE19C: @ 80BE19C
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080BE1BC @ =gUnknown_20399BC
	ldr r1, [r0]
	ldr r3, _080BE1C0 @ =0x00003ba0
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r2, r0
	bcs _080BE1C8
	lsls r0, r2, 1
	ldr r2, _080BE1C4 @ =0x00003984
	adds r1, r2
	adds r1, r0
	ldrh r0, [r1]
	b _080BE1CA
	.align 2, 0
_080BE1BC: .4byte gUnknown_20399BC
_080BE1C0: .4byte 0x00003ba0
_080BE1C4: .4byte 0x00003984
_080BE1C8:
	ldr r0, _080BE1D0 @ =0x0000ffff
_080BE1CA:
	pop {r1}
	bx r1
	.align 2, 0
_080BE1D0: .4byte 0x0000ffff
	thumb_func_end sub_80BE19C

	thumb_func_start sub_80BE1D4
sub_80BE1D4: @ 80BE1D4
	ldr r0, _080BE1E0 @ =gUnknown_20399BC
	ldr r0, [r0]
	ldr r1, _080BE1E4 @ =0x00003ba0
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080BE1E0: .4byte gUnknown_20399BC
_080BE1E4: .4byte 0x00003ba0
	thumb_func_end sub_80BE1D4

	thumb_func_start sub_80BE1E8
sub_80BE1E8: @ 80BE1E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _080BE270 @ =gUnknown_83ECED4
	lsls r0, r2, 3
	adds r0, r1
	ldrh r7, [r0, 0x4]
	cmp r2, 0
	beq _080BE20E
	cmp r2, 0x15
	beq _080BE20E
	cmp r2, 0x12
	beq _080BE20E
	cmp r2, 0x13
	bne _080BE280
_080BE20E:
	lsls r0, r2, 3
	adds r0, r1
	ldr r0, [r0]
	mov r10, r0
	movs r5, 0
	movs r6, 0
	cmp r6, r7
	bcs _080BE2DC
	movs r0, 0x7F
	ands r0, r2
	lsls r0, 9
	mov r9, r0
	lsls r2, 24
	mov r8, r2
_080BE22A:
	lsls r0, r5, 1
	mov r1, r10
	adds r4, r0, r1
	ldrh r0, [r4]
	mov r2, r8
	lsrs r1, r2, 24
	bl sub_80BE3A4
	lsls r0, 24
	cmp r0, 0
	beq _080BE262
	ldr r0, _080BE274 @ =gUnknown_20399BC
	ldr r2, [r0]
	adds r1, r6, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 1
	ldr r3, _080BE278 @ =0x00003984
	adds r2, r3
	adds r2, r1
	ldrh r0, [r4]
	ldr r3, _080BE27C @ =0x000001ff
	adds r1, r3, 0
	ands r0, r1
	mov r1, r9
	orrs r0, r1
	strh r0, [r2]
_080BE262:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r7
	bcc _080BE22A
	b _080BE2DC
	.align 2, 0
_080BE270: .4byte gUnknown_83ECED4
_080BE274: .4byte gUnknown_20399BC
_080BE278: .4byte 0x00003984
_080BE27C: .4byte 0x000001ff
_080BE280:
	ldr r0, [r0]
	mov r10, r0
	movs r5, 0
	movs r6, 0
	cmp r6, r7
	bcs _080BE2DC
	movs r0, 0x7F
	ands r0, r2
	lsls r0, 9
	mov r9, r0
	lsls r2, 24
	mov r8, r2
_080BE298:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	add r0, r10
	ldrh r4, [r0, 0x4]
	adds r0, r4, 0
	mov r2, r8
	lsrs r1, r2, 24
	bl sub_80BE3A4
	lsls r0, 24
	cmp r0, 0
	beq _080BE2D2
	ldr r0, _080BE2EC @ =gUnknown_20399BC
	ldr r2, [r0]
	adds r1, r6, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 1
	ldr r3, _080BE2F0 @ =0x00003984
	adds r2, r3
	adds r2, r1
	ldr r1, _080BE2F4 @ =0x000001ff
	adds r0, r1, 0
	ands r4, r0
	mov r3, r9
	orrs r4, r3
	strh r4, [r2]
_080BE2D2:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r7
	bcc _080BE298
_080BE2DC:
	adds r0, r6, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BE2EC: .4byte gUnknown_20399BC
_080BE2F0: .4byte 0x00003984
_080BE2F4: .4byte 0x000001ff
	thumb_func_end sub_80BE1E8

	thumb_func_start sub_80BE2F8
sub_80BE2F8: @ 80BE2F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r4, 0
	movs r6, 0
	ldr r3, _080BE364 @ =gUnknown_20399BC
	ldr r0, [r3]
	lsls r5, r1, 1
	adds r0, 0x2E
	adds r0, r5
	ldrh r0, [r0]
	cmp r6, r0
	bcs _080BE358
	mov r8, r3
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 3
	subs r0, r1
	lsls r7, r0, 2
	ldr r0, _080BE368 @ =0x00003984
	mov r12, r0
_080BE326:
	mov r0, r8
	ldr r3, [r0]
	adds r1, r6, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 1
	mov r0, r12
	adds r2, r3, r0
	adds r2, r1
	lsls r1, r4, 1
	adds r1, r7
	adds r0, r3, 0
	adds r0, 0x64
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r3, 0x2E
	adds r3, r5
	ldrh r3, [r3]
	cmp r4, r3
	bcc _080BE326
_080BE358:
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BE364: .4byte gUnknown_20399BC
_080BE368: .4byte 0x00003984
	thumb_func_end sub_80BE2F8

	thumb_func_start sub_80BE36C
sub_80BE36C: @ 80BE36C
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r0, _080BE390 @ =gUnknown_20399BC
	ldr r0, [r0]
	ldrh r1, [r0]
	cmp r2, r1
	bge _080BE39C
	adds r4, r3, 0
	adds r3, r1, 0
	adds r1, r0, 0x2
_080BE384:
	ldrh r0, [r1]
	cmp r0, r4
	bne _080BE394
	movs r0, 0x1
	b _080BE39E
	.align 2, 0
_080BE390: .4byte gUnknown_20399BC
_080BE394:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r3
	blt _080BE384
_080BE39C:
	movs r0, 0
_080BE39E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BE36C

	thumb_func_start sub_80BE3A4
sub_80BE3A4: @ 80BE3A4
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x13
	bgt _080BE3BC
	cmp r0, 0x12
	bge _080BE3F6
	cmp r0, 0
	beq _080BE3D6
	b _080BE3FA
_080BE3BC:
	cmp r0, 0x15
	bne _080BE3FA
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl GetSetPokedexFlag
	lsls r0, 24
	lsrs r0, 24
	b _080BE40C
_080BE3D6:
	adds r0, r4, 0
	bl sub_80BE418
	cmp r0, 0
	beq _080BE3F6
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl GetSetPokedexFlag
	lsls r0, 24
	lsrs r0, 24
	b _080BE40C
_080BE3F6:
	movs r0, 0x1
	b _080BE40C
_080BE3FA:
	ldr r1, _080BE414 @ =gUnknown_83ECED4
	lsls r0, 3
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
_080BE40C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BE414: .4byte gUnknown_83ECED4
	thumb_func_end sub_80BE3A4

	thumb_func_start sub_80BE418
sub_80BE418: @ 80BE418
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r1, _080BE42C @ =gUnknown_83EE004
_080BE422:
	ldrh r0, [r1]
	cmp r0, r3
	bne _080BE430
	movs r0, 0x1
	b _080BE43A
	.align 2, 0
_080BE42C: .4byte gUnknown_83EE004
_080BE430:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0
	beq _080BE422
	movs r0, 0
_080BE43A:
	pop {r1}
	bx r1
	thumb_func_end sub_80BE418

	thumb_func_start sub_80BE440
sub_80BE440: @ 80BE440
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 25
	lsls r0, 7
	lsrs r4, r0, 23
	adds r0, r5, 0
	bl sub_80BE36C
	lsls r0, 24
	cmp r0, 0
	beq _080BE464
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BE3A4
	lsls r0, 24
	lsrs r0, 24
	b _080BE466
_080BE464:
	movs r0, 0
_080BE466:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BE440

	.align 2, 0 @ Don't pad with nop.
