	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_803F5B4
sub_803F5B4: @ 803F5B4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	movs r6, 0
	cmp r0, 0x1
	beq _0803F608
	cmp r0, 0x1
	bgt _0803F5CC
	cmp r0, 0
	beq _0803F5D2
	b _0803F68A
_0803F5CC:
	cmp r1, 0x2
	beq _0803F650
	b _0803F68A
_0803F5D2:
	movs r5, 0
	ldr r0, _0803F5FC @ =gUnknown_2023BC4
	ldrb r3, [r0]
	ldr r4, _0803F600 @ =gUnknown_2023D70
	ldr r2, _0803F604 @ =gUnknown_825E45C
_0803F5DC:
	cmp r5, r3
	beq _0803F5F0
	ldrb r0, [r4]
	ldr r1, [r2]
	ands r0, r1
	cmp r0, 0
	bne _0803F5F0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803F5F0:
	adds r2, 0x4
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803F5DC
	b _0803F68A
	.align 2, 0
_0803F5FC: .4byte gUnknown_2023BC4
_0803F600: .4byte gUnknown_2023D70
_0803F604: .4byte gUnknown_825E45C
_0803F608:
	movs r5, 0
_0803F60A:
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBankSide
	adds r4, r0, 0
	ldr r0, _0803F644 @ =gUnknown_2023D6B
	ldrb r0, [r0]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0803F63C
	ldr r0, _0803F648 @ =gUnknown_2023D70
	ldrb r1, [r0]
	ldr r2, _0803F64C @ =gUnknown_825E45C
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803F63C
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803F63C:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803F60A
	b _0803F68A
	.align 2, 0
_0803F644: .4byte gUnknown_2023D6B
_0803F648: .4byte gUnknown_2023D70
_0803F64C: .4byte gUnknown_825E45C
_0803F650:
	movs r5, 0
_0803F652:
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBankSide
	adds r4, r0, 0
	ldr r0, _0803F694 @ =gUnknown_2023D6C
	ldrb r0, [r0]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0803F684
	ldr r0, _0803F698 @ =gUnknown_2023D70
	ldrb r1, [r0]
	ldr r2, _0803F69C @ =gUnknown_825E45C
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803F684
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803F684:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803F652
_0803F68A:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803F694: .4byte gUnknown_2023D6C
_0803F698: .4byte gUnknown_2023D70
_0803F69C: .4byte gUnknown_825E45C
	thumb_func_end sub_803F5B4

	thumb_func_start GetDefaultMoveTarget
GetDefaultMoveTarget: @ 803F6A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBankIdentity
	movs r1, 0x1
	movs r6, 0x1
	adds r4, r6, 0
	ands r4, r0
	eors r4, r1
	adds r5, r4, 0
	ldr r0, _0803F6C4 @ =gUnknown_2022B4C
	ldr r0, [r0]
	ands r0, r6
	cmp r0, 0
	bne _0803F6C8
	adds r0, r4, 0
	b _0803F712
	.align 2, 0
_0803F6C4: .4byte gUnknown_2022B4C
_0803F6C8:
	movs r0, 0
	bl sub_803F5B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0803F6EC
	bl Random
	adds r1, r6, 0
	ands r1, r0
	cmp r1, 0
	bne _0803F6E8
	movs r0, 0x2
	eors r0, r4
	b _0803F712
_0803F6E8:
	adds r0, r4, 0
	b _0803F712
_0803F6EC:
	ldr r0, _0803F704 @ =gUnknown_2023D70
	ldrb r1, [r0]
	ldr r2, _0803F708 @ =gUnknown_825E45C
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803F70C
	adds r0, r4, 0
	b _0803F712
	.align 2, 0
_0803F704: .4byte gUnknown_2023D70
_0803F708: .4byte gUnknown_825E45C
_0803F70C:
	movs r0, 0x2
	eors r5, r0
	adds r0, r5, 0
_0803F712:
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetDefaultMoveTarget

	thumb_func_start GetMonGender
GetMonGender: @ 803F720
	push {lr}
	bl GetBoxMonGender
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetMonGender

	thumb_func_start GetBoxMonGender
GetBoxMonGender: @ 803F730
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetBoxMonData
	adds r2, r0, 0
	ldr r1, _0803F780 @ =gUnknown_8254784
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x10]
	cmp r0, 0
	beq _0803F786
	cmp r0, 0
	blt _0803F768
	cmp r0, 0xFF
	bgt _0803F768
	cmp r0, 0xFE
	bge _0803F786
_0803F768:
	ldr r1, _0803F780 @ =gUnknown_8254784
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r0, 0xFF
	ands r0, r2
	cmp r1, r0
	bhi _0803F784
	movs r0, 0
	b _0803F786
	.align 2, 0
_0803F780: .4byte gUnknown_8254784
_0803F784:
	movs r0, 0xFE
_0803F786:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetBoxMonGender

	thumb_func_start GetGenderFromSpeciesAndPersonality
GetGenderFromSpeciesAndPersonality: @ 803F78C
	push {lr}
	adds r3, r1, 0
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _0803F7C8 @ =gUnknown_8254784
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x10]
	cmp r0, 0
	beq _0803F7CE
	cmp r0, 0
	blt _0803F7B0
	cmp r0, 0xFF
	bgt _0803F7B0
	cmp r0, 0xFE
	bge _0803F7CE
_0803F7B0:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r0, 0xFF
	ands r0, r3
	cmp r1, r0
	bhi _0803F7CC
	movs r0, 0
	b _0803F7CE
	.align 2, 0
_0803F7C8: .4byte gUnknown_8254784
_0803F7CC:
	movs r0, 0xFE
_0803F7CE:
	pop {r1}
	bx r1
	thumb_func_end GetGenderFromSpeciesAndPersonality

	thumb_func_start sub_803F7D4
sub_803F7D4: @ 803F7D4
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _0803F808 @ =gUnknown_202401C
	ldr r2, [r0]
	cmp r2, 0
	beq _0803F810
	cmp r4, 0x3
	bls _0803F7EC
	movs r4, 0
_0803F7EC:
	ldr r0, _0803F80C @ =gUnknown_20244DC
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 3
	adds r1, r2, r1
	adds r2, r0, 0
	adds r1, 0x14
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	adds r3, r0, 0
	b _0803F84C
	.align 2, 0
_0803F808: .4byte gUnknown_202401C
_0803F80C: .4byte gUnknown_20244DC
_0803F810:
	ldr r0, _0803F828 @ =gUnknown_20244F4
	ldr r1, [r0]
	cmp r1, 0
	beq _0803F830
	ldrb r0, [r1]
	lsrs r0, 4
	cmp r4, r0
	blt _0803F822
	movs r4, 0
_0803F822:
	ldr r3, _0803F82C @ =gUnknown_20244DC
	ldr r2, [r1, 0x10]
	b _0803F83A
	.align 2, 0
_0803F828: .4byte gUnknown_20244F4
_0803F82C: .4byte gUnknown_20244DC
_0803F830:
	cmp r4, 0x3
	bls _0803F836
	movs r4, 0
_0803F836:
	ldr r3, _0803F858 @ =gUnknown_20244DC
	ldr r2, _0803F85C @ =gUnknown_825DEF0
_0803F83A:
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	adds r1, r3, 0
	adds r0, r2
	ldm r0!, {r2,r4,r6}
	stm r1!, {r2,r4,r6}
	ldm r0!, {r2,r4,r6}
	stm r1!, {r2,r4,r6}
_0803F84C:
	strh r5, [r3, 0x2]
	ldr r0, _0803F860 @ =gUnknown_82349BC
	str r0, [r3, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F858: .4byte gUnknown_20244DC
_0803F85C: .4byte gUnknown_825DEF0
_0803F860: .4byte gUnknown_82349BC
	thumb_func_end sub_803F7D4

	thumb_func_start sub_803F864
sub_803F864: @ 803F864
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r0, _0803F89C @ =gUnknown_20244DC
	strh r4, [r0, 0x2]
	adds r5, r0, 0
	cmp r3, 0
	beq _0803F87C
	cmp r3, 0x2
	bne _0803F8A8
_0803F87C:
	ldr r2, _0803F8A0 @ =gUnknown_825DF50
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	adds r1, r5, 0
	adds r0, r2
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r1, _0803F8A4 @ =gUnknown_8239F74
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	b _0803F8E8
	.align 2, 0
_0803F89C: .4byte gUnknown_20244DC
_0803F8A0: .4byte gUnknown_825DF50
_0803F8A4: .4byte gUnknown_8239F74
_0803F8A8:
	ldr r0, _0803F8C8 @ =gUnknown_202401C
	ldr r1, [r0]
	cmp r1, 0
	beq _0803F8CC
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r0, r1, r0
	adds r1, r5, 0
	adds r0, 0x14
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	b _0803F8E0
	.align 2, 0
_0803F8C8: .4byte gUnknown_202401C
_0803F8CC:
	ldr r0, _0803F8F0 @ =gUnknown_825DEF0
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 3
	adds r2, r5, 0
	adds r1, r0
	ldm r1!, {r0,r3,r6}
	stm r2!, {r0,r3,r6}
	ldm r1!, {r0,r3,r6}
	stm r2!, {r0,r3,r6}
_0803F8E0:
	ldr r0, _0803F8F4 @ =gUnknown_82390DC
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
_0803F8E8:
	str r0, [r5, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F8F0: .4byte gUnknown_825DEF0
_0803F8F4: .4byte gUnknown_82390DC
	thumb_func_end sub_803F864

	thumb_func_start EncryptBoxMon
EncryptBoxMon: @ 803F8F8
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0
	adds r2, r3, 0
	adds r2, 0x20
_0803F902:
	ldr r0, [r2]
	ldr r1, [r3]
	eors r0, r1
	str r0, [r2]
	ldr r1, [r3, 0x4]
	eors r0, r1
	stm r2!, {r0}
	adds r4, 0x1
	cmp r4, 0xB
	bls _0803F902
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end EncryptBoxMon

	thumb_func_start DecryptBoxMon
DecryptBoxMon: @ 803F91C
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0
	adds r2, r3, 0
	adds r2, 0x20
_0803F926:
	ldr r0, [r2]
	ldr r1, [r3, 0x4]
	eors r0, r1
	str r0, [r2]
	ldr r1, [r3]
	eors r0, r1
	stm r2!, {r0}
	adds r4, 0x1
	cmp r4, 0xB
	bls _0803F926
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DecryptBoxMon

	thumb_func_start GetSubstruct
GetSubstruct: @ 803F940
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r0, r1, 0
	lsls r2, 24
	lsrs r4, r2, 24
	movs r6, 0
	movs r1, 0x18
	bl __umodsi3
	cmp r0, 0x17
	bls _0803F958
	b _0803FBE0
_0803F958:
	lsls r0, 2
	ldr r1, _0803F964 @ =_0803F968
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F964: .4byte _0803F968
	.align 2, 0
_0803F968:
	.4byte _0803F9C8
	.4byte _0803F9EC
	.4byte _0803FA08
	.4byte _0803FA1E
	.4byte _0803FA34
	.4byte _0803FA50
	.4byte _0803FA66
	.4byte _0803FA7C
	.4byte _0803FA8C
	.4byte _0803FAAA
	.4byte _0803FAC2
	.4byte _0803FAD2
	.4byte _0803FAE6
	.4byte _0803FAF8
	.4byte _0803FB0A
	.4byte _0803FB1C
	.4byte _0803FB2E
	.4byte _0803FB40
	.4byte _0803FB52
	.4byte _0803FB68
	.4byte _0803FB7C
	.4byte _0803FB8A
	.4byte _0803FB9C
	.4byte _0803FBB0
_0803F9C8:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803F9D2
	b _0803FBD8
_0803F9D2:
	cmp r4, 0x1
	bgt _0803F9DE
_0803F9D6:
	cmp r4, 0
	bne _0803F9DC
	b _0803FBDE
_0803F9DC:
	b _0803FBE0
_0803F9DE:
	cmp r4, 0x2
	bne _0803F9E4
	b _0803FBD2
_0803F9E4:
	cmp r4, 0x3
	beq _0803F9EA
	b _0803FBE0
_0803F9EA:
	b _0803FBCC
_0803F9EC:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803F9F6
	b _0803FBD8
_0803F9F6:
	cmp r4, 0x1
	ble _0803F9D6
_0803F9FA:
	cmp r4, 0x2
	bne _0803FA00
	b _0803FBCC
_0803FA00:
	cmp r4, 0x3
	beq _0803FA06
	b _0803FBE0
_0803FA06:
	b _0803FBD2
_0803FA08:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FA12
	b _0803FBD2
_0803FA12:
	cmp r4, 0x1
	ble _0803F9D6
	cmp r4, 0x2
	bne _0803FA1C
	b _0803FBD8
_0803FA1C:
	b _0803F9E4
_0803FA1E:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FA28
	b _0803FBCC
_0803FA28:
	cmp r4, 0x1
	ble _0803F9D6
	cmp r4, 0x2
	bne _0803FA32
	b _0803FBD8
_0803FA32:
	b _0803FA00
_0803FA34:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FA3E
	b _0803FBD2
_0803FA3E:
	cmp r4, 0x1
	ble _0803F9D6
_0803FA42:
	cmp r4, 0x2
	bne _0803FA48
	b _0803FBCC
_0803FA48:
	cmp r4, 0x3
	beq _0803FA4E
	b _0803FBE0
_0803FA4E:
	b _0803FBD8
_0803FA50:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FA5A
	b _0803FBCC
_0803FA5A:
	cmp r4, 0x1
	ble _0803F9D6
	cmp r4, 0x2
	bne _0803FA64
	b _0803FBD2
_0803FA64:
	b _0803FA48
_0803FA66:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FA70
	b _0803FBDE
_0803FA70:
	cmp r4, 0x1
	bgt _0803F9DE
_0803FA74:
	cmp r4, 0
	bne _0803FA7A
	b _0803FBD8
_0803FA7A:
	b _0803FBE0
_0803FA7C:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FA86
	b _0803FBDE
_0803FA86:
	cmp r4, 0x1
	ble _0803FA74
	b _0803F9FA
_0803FA8C:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FA96
	b _0803FBDE
_0803FA96:
	cmp r4, 0x1
	bgt _0803FAA2
_0803FA9A:
	cmp r4, 0
	bne _0803FAA0
	b _0803FBD2
_0803FAA0:
	b _0803FBE0
_0803FAA2:
	cmp r4, 0x2
	bne _0803FAA8
	b _0803FBD8
_0803FAA8:
	b _0803F9E4
_0803FAAA:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FAB4
	b _0803FBDE
_0803FAB4:
	cmp r4, 0x1
	bgt _0803FABA
	b _0803FBBC
_0803FABA:
	cmp r4, 0x2
	bne _0803FAC0
	b _0803FBD8
_0803FAC0:
	b _0803FA00
_0803FAC2:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FACC
	b _0803FBDE
_0803FACC:
	cmp r4, 0x1
	ble _0803FA9A
	b _0803FA42
_0803FAD2:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	bne _0803FADC
	b _0803FBDE
_0803FADC:
	cmp r4, 0x1
	ble _0803FBBC
	cmp r4, 0x2
	beq _0803FBD2
	b _0803FA48
_0803FAE6:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBD2
	cmp r4, 0x1
	ble _0803FA74
	cmp r4, 0x2
	beq _0803FBDE
	b _0803F9E4
_0803FAF8:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBCC
	cmp r4, 0x1
	ble _0803FA74
	cmp r4, 0x2
	beq _0803FBDE
	b _0803FA00
_0803FB0A:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBD8
	cmp r4, 0x1
	ble _0803FA9A
	cmp r4, 0x2
	beq _0803FBDE
	b _0803F9E4
_0803FB1C:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBD8
	cmp r4, 0x1
	ble _0803FBBC
	cmp r4, 0x2
	beq _0803FBDE
	b _0803FA00
_0803FB2E:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBCC
	cmp r4, 0x1
	ble _0803FA9A
	cmp r4, 0x2
	beq _0803FBDE
	b _0803FA48
_0803FB40:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBD2
	cmp r4, 0x1
	ble _0803FBBC
	cmp r4, 0x2
	beq _0803FBDE
	b _0803FA48
_0803FB52:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBD2
	cmp r4, 0x1
	ble _0803FA74
_0803FB5E:
	cmp r4, 0x2
	beq _0803FBCC
_0803FB62:
	cmp r4, 0x3
	bne _0803FBE0
	b _0803FBDE
_0803FB68:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBCC
	cmp r4, 0x1
	bgt _0803FB76
	b _0803FA74
_0803FB76:
	cmp r4, 0x2
	beq _0803FBD2
	b _0803FB62
_0803FB7C:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBD8
	cmp r4, 0x1
	ble _0803FA9A
	b _0803FB5E
_0803FB8A:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBD8
	cmp r4, 0x1
	ble _0803FBBC
	cmp r4, 0x2
	beq _0803FBD2
	b _0803FB62
_0803FB9C:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBCC
	cmp r4, 0x1
	bgt _0803FBAA
	b _0803FA9A
_0803FBAA:
	cmp r4, 0x2
	beq _0803FBD8
	b _0803FB62
_0803FBB0:
	adds r0, r5, 0
	adds r0, 0x20
	cmp r4, 0x1
	beq _0803FBD2
	cmp r4, 0x1
	bgt _0803FBC2
_0803FBBC:
	cmp r4, 0
	beq _0803FBCC
	b _0803FBE0
_0803FBC2:
	cmp r4, 0x2
	beq _0803FBD8
	cmp r4, 0x3
	beq _0803FBDE
	b _0803FBE0
_0803FBCC:
	adds r6, r5, 0
	adds r6, 0x44
	b _0803FBE0
_0803FBD2:
	adds r6, r5, 0
	adds r6, 0x38
	b _0803FBE0
_0803FBD8:
	adds r6, r5, 0
	adds r6, 0x2C
	b _0803FBE0
_0803FBDE:
	adds r6, r0, 0
_0803FBE0:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetSubstruct

	thumb_func_start GetMonData
GetMonData: @ 803FBE8
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	adds r0, r3, 0
	subs r0, 0x37
	cmp r0, 0x21
	bls _0803FBF8
	b _0803FD36
_0803FBF8:
	lsls r0, 2
	ldr r1, _0803FC04 @ =_0803FC08
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FC04: .4byte _0803FC08
	.align 2, 0
_0803FC08:
	.4byte _0803FC90
	.4byte _0803FC94
	.4byte _0803FC9C
	.4byte _0803FCA4
	.4byte _0803FCAC
	.4byte _0803FCBE
	.4byte _0803FCD0
	.4byte _0803FCE2
	.4byte _0803FCF4
	.4byte _0803FD2E
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD36
	.4byte _0803FD06
	.4byte _0803FD0E
	.4byte _0803FD16
	.4byte _0803FD1E
	.4byte _0803FD26
_0803FC90:
	ldr r0, [r4, 0x50]
	b _0803FD3E
_0803FC94:
	adds r0, r4, 0
	adds r0, 0x54
	ldrb r0, [r0]
	b _0803FD3E
_0803FC9C:
	adds r0, r4, 0
	adds r0, 0x56
	ldrh r0, [r0]
	b _0803FD3E
_0803FCA4:
	adds r0, r4, 0
	adds r0, 0x58
	ldrh r0, [r0]
	b _0803FD3E
_0803FCAC:
	adds r0, r4, 0
	movs r1, 0x1
	bl GetDeoxysStat
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0803FD3E
	b _0803FD06
_0803FCBE:
	adds r0, r4, 0
	movs r1, 0x2
	bl GetDeoxysStat
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0803FD3E
	b _0803FD0E
_0803FCD0:
	adds r0, r4, 0
	movs r1, 0x3
	bl GetDeoxysStat
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0803FD3E
	b _0803FD16
_0803FCE2:
	adds r0, r4, 0
	movs r1, 0x4
	bl GetDeoxysStat
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0803FD3E
	b _0803FD1E
_0803FCF4:
	adds r0, r4, 0
	movs r1, 0x5
	bl GetDeoxysStat
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0803FD3E
	b _0803FD26
_0803FD06:
	adds r0, r4, 0
	adds r0, 0x5A
	ldrh r0, [r0]
	b _0803FD3E
_0803FD0E:
	adds r0, r4, 0
	adds r0, 0x5C
	ldrh r0, [r0]
	b _0803FD3E
_0803FD16:
	adds r0, r4, 0
	adds r0, 0x5E
	ldrh r0, [r0]
	b _0803FD3E
_0803FD1E:
	adds r0, r4, 0
	adds r0, 0x60
	ldrh r0, [r0]
	b _0803FD3E
_0803FD26:
	adds r0, r4, 0
	adds r0, 0x62
	ldrh r0, [r0]
	b _0803FD3E
_0803FD2E:
	adds r0, r4, 0
	adds r0, 0x55
	ldrb r0, [r0]
	b _0803FD3E
_0803FD36:
	adds r0, r4, 0
	adds r1, r3, 0
	bl GetBoxMonData
_0803FD3E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonData

	thumb_func_start GetBoxMonData
GetBoxMonData: @ 803FD44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	str r1, [sp]
	adds r6, r2, 0
	movs r4, 0
	mov r9, r4
	mov r10, r4
	movs r7, 0
	movs r5, 0
	cmp r1, 0xA
	ble _0803FDC2
	ldr r1, [r0]
	movs r2, 0
	bl GetSubstruct
	mov r9, r0
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0x1
	bl GetSubstruct
	mov r10, r0
	mov r2, r8
	ldr r1, [r2]
	mov r0, r8
	movs r2, 0x2
	bl GetSubstruct
	adds r7, r0, 0
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0x3
	bl GetSubstruct
	adds r5, r0, 0
	mov r0, r8
	bl DecryptBoxMon
	mov r0, r8
	bl CalculateBoxMonChecksum
	lsls r0, 16
	lsrs r0, 16
	mov r1, r8
	ldrh r1, [r1, 0x1C]
	cmp r0, r1
	beq _0803FDC2
	mov r2, r8
	ldrb r0, [r2, 0x13]
	movs r1, 0x1
	orrs r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x13]
	ldrb r0, [r5, 0x7]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x7]
_0803FDC2:
	ldr r0, [sp]
	cmp r0, 0x53
	bls _0803FDCA
	b _0804035C
_0803FDCA:
	lsls r0, 2
	ldr r1, _0803FDD4 @ =_0803FDD8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FDD4: .4byte _0803FDD8
	.align 2, 0
_0803FDD8:
	.4byte _0803FF28
	.4byte _0803FF2E
	.4byte _0803FF34
	.4byte _0803FFE8
	.4byte _0803FFEE
	.4byte _0803FFF4
	.4byte _0803FFFA
	.4byte _08040000
	.4byte _0804001C
	.4byte _08040022
	.4byte _08040028
	.4byte _0804002E
	.4byte _08040046
	.4byte _0804005E
	.4byte _0804005E
	.4byte _0804005E
	.4byte _0804005E
	.4byte _0804006A
	.4byte _0804006A
	.4byte _0804006A
	.4byte _0804006A
	.4byte _08040052
	.4byte _0804008C
	.4byte _08040090
	.4byte _08040094
	.4byte _0804004C
	.4byte _08040074
	.4byte _08040078
	.4byte _0804007C
	.4byte _08040080
	.4byte _08040084
	.4byte _08040088
	.4byte _08040058
	.4byte _08040098
	.4byte _080400A4
	.4byte _080400A8
	.4byte _080400AC
	.4byte _080400B4
	.4byte _080400BC
	.4byte _080400C6
	.4byte _080400CE
	.4byte _080400D6
	.4byte _080400DE
	.4byte _080400E6
	.4byte _080400EE
	.4byte _080400F6
	.4byte _080400FA
	.4byte _0804009C
	.4byte _080400A0
	.4byte _080400C0
	.4byte _08040100
	.4byte _08040108
	.4byte _08040110
	.4byte _08040118
	.4byte _08040120
	.4byte _0804035C
	.4byte _0804035C
	.4byte _0804035C
	.4byte _0804035C
	.4byte _0804035C
	.4byte _0804035C
	.4byte _0804035C
	.4byte _0804035C
	.4byte _0804035C
	.4byte _0804035C
	.4byte _08040186
	.4byte _080401AC
	.4byte _08040128
	.4byte _0804012E
	.4byte _08040132
	.4byte _08040136
	.4byte _0804013A
	.4byte _08040142
	.4byte _0804014A
	.4byte _08040152
	.4byte _0804015A
	.4byte _08040160
	.4byte _08040168
	.4byte _08040170
	.4byte _08040178
	.4byte _08040180
	.4byte _080401E6
	.4byte _08040240
	.4byte _080402C2
_0803FF28:
	mov r1, r8
	ldr r4, [r1]
	b _0804035C
_0803FF2E:
	mov r2, r8
	ldr r4, [r2, 0x4]
	b _0804035C
_0803FF34:
	mov r0, r8
	ldrb r1, [r0, 0x13]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803FF6C
	movs r4, 0
	ldr r0, _0803FF68 @ =gUnknown_83FE868
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0xFF
	beq _08040014
	adds r3, r2, 0
_0803FF4E:
	adds r0, r6, r4
	adds r1, r4, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x9
	bhi _08040014
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0803FF4E
	b _08040014
	.align 2, 0
_0803FF68: .4byte gUnknown_83FE868
_0803FF6C:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803FF8C
	ldr r1, _0803FF88 @ =gUnknown_8415A62
	adds r0, r6, 0
	bl StringCopy
	adds r0, r6, 0
	bl StringLength
	lsls r0, 16
	lsrs r4, r0, 16
	b _0804035C
	.align 2, 0
_0803FF88: .4byte gUnknown_8415A62
_0803FF8C:
	mov r1, r8
	ldrb r0, [r1, 0x12]
	cmp r0, 0x1
	bne _0803FFD2
	movs r0, 0xFC
	strb r0, [r6]
	movs r0, 0x15
	strb r0, [r6, 0x1]
	movs r4, 0x2
	movs r3, 0
	ldrb r0, [r1, 0x8]
	cmp r0, 0xFF
	beq _0803FFC0
	mov r2, r8
	adds r2, 0x8
_0803FFAA:
	adds r1, r6, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r4, 0x1
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x5
	bgt _0803FFC0
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _0803FFAA
_0803FFC0:
	adds r1, r6, r4
	movs r0, 0xFC
	strb r0, [r1]
	adds r4, 0x1
	adds r1, r6, r4
	movs r0, 0x16
	strb r0, [r1]
	adds r4, 0x1
	b _08040014
_0803FFD2:
	movs r4, 0
	mov r2, r8
	adds r2, 0x8
_0803FFD8:
	adds r0, r6, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x9
	bls _0803FFD8
	b _08040014
_0803FFE8:
	mov r2, r8
	ldrb r4, [r2, 0x12]
	b _0804035C
_0803FFEE:
	mov r6, r8
	ldrb r0, [r6, 0x13]
	b _08040162
_0803FFF4:
	mov r1, r8
	ldrb r0, [r1, 0x13]
	b _0804016A
_0803FFFA:
	mov r2, r8
	ldrb r0, [r2, 0x13]
	b _08040172
_08040000:
	movs r4, 0
	mov r2, r8
	adds r2, 0x14
_08040006:
	adds r0, r6, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x6
	bls _08040006
_08040014:
	adds r1, r6, r4
	movs r0, 0xFF
	strb r0, [r1]
	b _0804035C
_0804001C:
	mov r6, r8
	ldrb r4, [r6, 0x1B]
	b _0804035C
_08040022:
	mov r0, r8
	ldrh r4, [r0, 0x1C]
	b _0804035C
_08040028:
	mov r1, r8
	ldrh r4, [r1, 0x1E]
	b _0804035C
_0804002E:
	mov r2, r8
	ldrb r1, [r2, 0x13]
	movs r0, 0x1
	ands r0, r1
	movs r4, 0xCE
	lsls r4, 1
	cmp r0, 0
	beq _08040040
	b _0804035C
_08040040:
	mov r6, r9
	ldrh r4, [r6]
	b _0804035C
_08040046:
	mov r0, r9
	ldrh r4, [r0, 0x2]
	b _0804035C
_0804004C:
	mov r1, r9
	ldr r4, [r1, 0x4]
	b _0804035C
_08040052:
	mov r2, r9
	ldrb r4, [r2, 0x8]
	b _0804035C
_08040058:
	mov r6, r9
	ldrb r4, [r6, 0x9]
	b _0804035C
_0804005E:
	ldr r0, [sp]
	subs r0, 0xD
	lsls r0, 1
	add r0, r10
	ldrh r4, [r0]
	b _0804035C
_0804006A:
	ldr r0, [sp]
	add r0, r10
	subs r0, 0x9
	ldrb r4, [r0]
	b _0804035C
_08040074:
	ldrb r4, [r7]
	b _0804035C
_08040078:
	ldrb r4, [r7, 0x1]
	b _0804035C
_0804007C:
	ldrb r4, [r7, 0x2]
	b _0804035C
_08040080:
	ldrb r4, [r7, 0x3]
	b _0804035C
_08040084:
	ldrb r4, [r7, 0x4]
	b _0804035C
_08040088:
	ldrb r4, [r7, 0x5]
	b _0804035C
_0804008C:
	ldrb r4, [r7, 0x6]
	b _0804035C
_08040090:
	ldrb r4, [r7, 0x7]
	b _0804035C
_08040094:
	ldrb r4, [r7, 0x8]
	b _0804035C
_08040098:
	ldrb r4, [r7, 0x9]
	b _0804035C
_0804009C:
	ldrb r4, [r7, 0xA]
	b _0804035C
_080400A0:
	ldrb r4, [r7, 0xB]
	b _0804035C
_080400A4:
	ldrb r4, [r5]
	b _0804035C
_080400A8:
	ldrb r4, [r5, 0x1]
	b _0804035C
_080400AC:
	ldrb r0, [r5, 0x2]
	lsls r0, 25
	lsrs r4, r0, 25
	b _0804035C
_080400B4:
	ldrh r0, [r5, 0x2]
	lsls r0, 21
	lsrs r4, r0, 28
	b _0804035C
_080400BC:
	ldrb r0, [r5, 0x3]
	b _0804017A
_080400C0:
	ldrb r0, [r5, 0x3]
	lsrs r4, r0, 7
	b _0804035C
_080400C6:
	ldrb r0, [r5, 0x4]
	lsls r0, 27
	lsrs r4, r0, 27
	b _0804035C
_080400CE:
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r4, r0, 27
	b _0804035C
_080400D6:
	ldrb r0, [r5, 0x5]
	lsls r0, 25
	lsrs r4, r0, 27
	b _0804035C
_080400DE:
	ldr r0, [r5, 0x4]
	lsls r0, 12
	lsrs r4, r0, 27
	b _0804035C
_080400E6:
	ldrh r0, [r5, 0x6]
	lsls r0, 23
	lsrs r4, r0, 27
	b _0804035C
_080400EE:
	ldrb r0, [r5, 0x7]
	lsls r0, 26
	lsrs r4, r0, 27
	b _0804035C
_080400F6:
	ldrb r0, [r5, 0x7]
	b _08040154
_080400FA:
	ldrb r0, [r5, 0x7]
	lsrs r4, r0, 7
	b _0804035C
_08040100:
	ldrb r0, [r5, 0x8]
	lsls r0, 29
	lsrs r4, r0, 29
	b _0804035C
_08040108:
	ldrb r0, [r5, 0x8]
	lsls r0, 26
	lsrs r4, r0, 29
	b _0804035C
_08040110:
	ldrh r0, [r5, 0x8]
	lsls r0, 23
	lsrs r4, r0, 29
	b _0804035C
_08040118:
	ldrb r0, [r5, 0x9]
	lsls r0, 28
	lsrs r4, r0, 29
	b _0804035C
_08040120:
	ldrb r0, [r5, 0x9]
	lsls r0, 25
	lsrs r4, r0, 29
	b _0804035C
_08040128:
	ldrb r0, [r5, 0x9]
	lsrs r4, r0, 7
	b _0804035C
_0804012E:
	ldrb r0, [r5, 0xA]
	b _08040162
_08040132:
	ldrb r0, [r5, 0xA]
	b _0804016A
_08040136:
	ldrb r0, [r5, 0xA]
	b _08040172
_0804013A:
	ldrb r0, [r5, 0xA]
	lsls r0, 28
	lsrs r4, r0, 31
	b _0804035C
_08040142:
	ldrb r0, [r5, 0xA]
	lsls r0, 27
	lsrs r4, r0, 31
	b _0804035C
_0804014A:
	ldrb r0, [r5, 0xA]
	lsls r0, 26
	lsrs r4, r0, 31
	b _0804035C
_08040152:
	ldrb r0, [r5, 0xA]
_08040154:
	lsls r0, 25
	lsrs r4, r0, 31
	b _0804035C
_0804015A:
	ldrb r0, [r5, 0xA]
	lsrs r4, r0, 7
	b _0804035C
_08040160:
	ldrb r0, [r5, 0xB]
_08040162:
	lsls r0, 31
	lsrs r4, r0, 31
	b _0804035C
_08040168:
	ldrb r0, [r5, 0xB]
_0804016A:
	lsls r0, 30
	lsrs r4, r0, 31
	b _0804035C
_08040170:
	ldrb r0, [r5, 0xB]
_08040172:
	lsls r0, 29
	lsrs r4, r0, 31
	b _0804035C
_08040178:
	ldrb r0, [r5, 0xB]
_0804017A:
	lsls r0, 25
	lsrs r4, r0, 28
	b _0804035C
_08040180:
	ldrb r0, [r5, 0xB]
	lsrs r4, r0, 7
	b _0804035C
_08040186:
	mov r0, r9
	ldrh r4, [r0]
	cmp r4, 0
	bne _08040190
	b _0804035C
_08040190:
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	blt _080401A6
	mov r2, r8
	ldrb r1, [r2, 0x13]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080401A6
	b _0804035C
_080401A6:
	movs r4, 0xCE
	lsls r4, 1
	b _0804035C
_080401AC:
	ldrb r0, [r5, 0x4]
	lsls r0, 27
	lsrs r4, r0, 27
	ldrh r1, [r5, 0x4]
	movs r0, 0xF8
	lsls r0, 2
	ands r0, r1
	orrs r4, r0
	ldrb r0, [r5, 0x5]
	lsls r0, 25
	lsrs r0, 27
	lsls r0, 10
	orrs r4, r0
	ldr r0, [r5, 0x4]
	movs r1, 0xF8
	lsls r1, 12
	ands r0, r1
	orrs r4, r0
	ldrh r0, [r5, 0x6]
	lsls r0, 23
	lsrs r0, 27
	lsls r0, 20
	orrs r4, r0
	ldrb r0, [r5, 0x7]
	lsls r0, 26
	lsrs r0, 27
	lsls r0, 25
	orrs r4, r0
	b _0804035C
_080401E6:
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	bne _080401F0
	b _0804035C
_080401F0:
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	bge _080401FA
	b _0804035C
_080401FA:
	ldrh r0, [r6]
	ldr r1, _08040238 @ =0x00000163
	cmp r0, r1
	bne _08040204
	b _0804035C
_08040204:
	mov r2, r10
	ldrh r5, [r2]
	adds r7, r1, 0
	adds r2, r6, 0
	ldr r1, _0804023C @ =gUnknown_825E45C
_0804020E:
	ldrh r3, [r2]
	cmp r5, r3
	beq _08040228
	mov r6, r10
	ldrh r0, [r6, 0x2]
	cmp r0, r3
	beq _08040228
	ldrh r0, [r6, 0x4]
	cmp r0, r3
	beq _08040228
	ldrh r0, [r6, 0x6]
	cmp r0, r3
	bne _0804022C
_08040228:
	ldr r0, [r1]
	orrs r4, r0
_0804022C:
	adds r2, 0x2
	adds r1, 0x4
	ldrh r0, [r2]
	cmp r0, r7
	bne _0804020E
	b _0804035C
	.align 2, 0
_08040238: .4byte 0x00000163
_0804023C: .4byte gUnknown_825E45C
_08040240:
	movs r4, 0
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	bne _0804024C
	b _0804035C
_0804024C:
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	bge _08040256
	b _0804035C
_08040256:
	ldrb r0, [r5, 0x8]
	lsls r1, r0, 29
	lsrs r4, r1, 29
	lsls r0, 26
	lsrs r0, 29
	adds r4, r0
	ldrh r0, [r5, 0x8]
	lsls r0, 23
	lsrs r0, 29
	adds r4, r0
	ldrb r1, [r5, 0x9]
	lsls r0, r1, 28
	lsrs r0, 29
	adds r4, r0
	lsls r0, r1, 25
	lsrs r0, 29
	adds r4, r0
	lsrs r1, 7
	adds r4, r1
	ldrb r1, [r5, 0xA]
	lsls r0, r1, 31
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 30
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 29
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 28
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 27
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 26
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 25
	lsrs r0, 31
	adds r4, r0
	lsrs r1, 7
	adds r4, r1
	ldrb r1, [r5, 0xB]
	lsls r0, r1, 31
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 30
	lsrs r0, 31
	adds r4, r0
	lsls r1, 29
	lsrs r1, 31
	adds r4, r1
	b _0804035C
_080402C2:
	movs r4, 0
	mov r2, r9
	ldrh r0, [r2]
	cmp r0, 0
	beq _0804035C
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	blt _0804035C
	ldrb r2, [r5, 0x9]
	lsrs r4, r2, 7
	ldrb r1, [r5, 0x8]
	lsls r0, r1, 29
	lsrs r0, 28
	orrs r4, r0
	lsls r1, 26
	lsrs r1, 29
	lsls r1, 4
	orrs r4, r1
	ldrh r0, [r5, 0x8]
	lsls r0, 23
	lsrs r0, 29
	lsls r0, 7
	orrs r4, r0
	lsls r0, r2, 28
	lsrs r0, 29
	lsls r0, 10
	orrs r4, r0
	lsls r2, 25
	lsrs r2, 29
	lsls r2, 13
	orrs r4, r2
	ldrb r1, [r5, 0xA]
	lsls r0, r1, 31
	lsrs r0, 31
	lsls r0, 16
	orrs r4, r0
	lsls r0, r1, 30
	lsrs r0, 31
	lsls r0, 17
	orrs r4, r0
	lsls r0, r1, 29
	lsrs r0, 31
	lsls r0, 18
	orrs r4, r0
	lsls r0, r1, 28
	lsrs r0, 31
	lsls r0, 19
	orrs r4, r0
	lsls r0, r1, 27
	lsrs r0, 31
	lsls r0, 20
	orrs r4, r0
	lsls r0, r1, 26
	lsrs r0, 31
	lsls r0, 21
	orrs r4, r0
	lsls r0, r1, 25
	lsrs r0, 31
	lsls r0, 22
	orrs r4, r0
	lsrs r1, 7
	lsls r1, 23
	orrs r4, r1
	ldrb r1, [r5, 0xB]
	lsls r0, r1, 31
	lsrs r0, 31
	lsls r0, 24
	orrs r4, r0
	lsls r0, r1, 30
	lsrs r0, 31
	lsls r0, 25
	orrs r4, r0
	lsls r1, 29
	lsrs r1, 31
	lsls r1, 26
	orrs r4, r1
_0804035C:
	ldr r6, [sp]
	cmp r6, 0xA
	ble _08040368
	mov r0, r8
	bl EncryptBoxMon
_08040368:
	adds r0, r4, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetBoxMonData

	thumb_func_start sub_804037C
sub_804037C: @ 804037C
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	subs r0, 0x37
	cmp r0, 0x21
	bls _0804038C
	b _080404C0
_0804038C:
	lsls r0, 2
	ldr r1, _08040398 @ =_0804039C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08040398: .4byte _0804039C
	.align 2, 0
_0804039C:
	.4byte _08040424
	.4byte _0804043C
	.4byte _08040446
	.4byte _08040456
	.4byte _08040466
	.4byte _08040476
	.4byte _08040486
	.4byte _08040496
	.4byte _080404A6
	.4byte _080404B6
	.4byte _080404C8
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _080404C0
	.4byte _08040466
	.4byte _08040476
	.4byte _08040486
	.4byte _08040496
	.4byte _080404A6
_08040424:
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3, 0x50]
	b _080404C8
_0804043C:
	ldrb r1, [r2]
	adds r0, r3, 0
	adds r0, 0x54
	strb r1, [r0]
	b _080404C8
_08040446:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x56
	strh r0, [r1]
	b _080404C8
_08040456:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x58
	strh r0, [r1]
	b _080404C8
_08040466:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x5A
	strh r0, [r1]
	b _080404C8
_08040476:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x5C
	strh r0, [r1]
	b _080404C8
_08040486:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x5E
	strh r0, [r1]
	b _080404C8
_08040496:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x60
	strh r0, [r1]
	b _080404C8
_080404A6:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x62
	strh r0, [r1]
	b _080404C8
_080404B6:
	ldrb r1, [r2]
	adds r0, r3, 0
	adds r0, 0x55
	strb r1, [r0]
	b _080404C8
_080404C0:
	adds r0, r3, 0
	adds r1, r4, 0
	bl sub_80404D0
_080404C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804037C

	thumb_func_start sub_80404D0
sub_80404D0: @ 80404D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	mov r10, r1
	adds r4, r2, 0
	movs r0, 0
	mov r8, r0
	mov r9, r0
	movs r6, 0
	movs r5, 0
	cmp r1, 0xA
	ble _08040550
	ldr r1, [r7]
	adds r0, r7, 0
	movs r2, 0
	bl GetSubstruct
	mov r8, r0
	ldr r1, [r7]
	adds r0, r7, 0
	movs r2, 0x1
	bl GetSubstruct
	mov r9, r0
	ldr r1, [r7]
	adds r0, r7, 0
	movs r2, 0x2
	bl GetSubstruct
	adds r6, r0, 0
	ldr r1, [r7]
	adds r0, r7, 0
	movs r2, 0x3
	bl GetSubstruct
	adds r5, r0, 0
	adds r0, r7, 0
	bl DecryptBoxMon
	adds r0, r7, 0
	bl CalculateBoxMonChecksum
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r7, 0x1C]
	cmp r0, r1
	beq _08040550
	ldrb r0, [r7, 0x13]
	movs r1, 0x1
	orrs r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r7, 0x13]
	ldrb r0, [r5, 0x7]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x7]
	adds r0, r7, 0
	bl EncryptBoxMon
	b _08040AEE
_08040550:
	mov r0, r10
	cmp r0, 0x50
	bls _08040558
	b _08040ADA
_08040558:
	lsls r0, 2
	ldr r1, _08040564 @ =_08040568
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08040564: .4byte _08040568
	.align 2, 0
_08040568:
	.4byte _080406AC
	.4byte _080406C4
	.4byte _080406DC
	.4byte _080406F2
	.4byte _080406F8
	.4byte _08040708
	.4byte _0804071A
	.4byte _0804072C
	.4byte _08040742
	.4byte _08040748
	.4byte _08040754
	.4byte _08040760
	.4byte _08040780
	.4byte _080407B8
	.4byte _080407B8
	.4byte _080407B8
	.4byte _080407B8
	.4byte _080407CC
	.4byte _080407CC
	.4byte _080407CC
	.4byte _080407CC
	.4byte _080407A8
	.4byte _080407FC
	.4byte _08040802
	.4byte _08040808
	.4byte _0804078E
	.4byte _080407D8
	.4byte _080407DE
	.4byte _080407E4
	.4byte _080407EA
	.4byte _080407F0
	.4byte _080407F6
	.4byte _080407B0
	.4byte _0804080E
	.4byte _08040820
	.4byte _08040826
	.4byte _0804082C
	.4byte _08040840
	.4byte _08040858
	.4byte _0804087E
	.4byte _08040892
	.4byte _080408AC
	.4byte _080408C2
	.4byte _080408DC
	.4byte _080408F4
	.4byte _08040908
	.4byte _08040938
	.4byte _08040814
	.4byte _0804081A
	.4byte _0804086E
	.4byte _08040948
	.4byte _08040956
	.4byte _0804096C
	.4byte _08040984
	.4byte _08040994
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040ADA
	.4byte _08040A92
	.4byte _080409AA
	.4byte _080409BA
	.4byte _080409C8
	.4byte _080409D8
	.4byte _080409E8
	.4byte _080409F8
	.4byte _08040A08
	.4byte _08040A18
	.4byte _08040A2E
	.4byte _08040A3E
	.4byte _08040A4C
	.4byte _08040A5C
	.4byte _08040A6C
	.4byte _08040A82
_080406AC:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r4, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r7]
	b _08040ADA
_080406C4:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r4, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r7, 0x4]
	b _08040ADA
_080406DC:
	movs r2, 0
	adds r3, r7, 0
	adds r3, 0x8
_080406E2:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x9
	ble _080406E2
	b _08040ADA
_080406F2:
	ldrb r0, [r4]
	strb r0, [r7, 0x12]
	b _08040ADA
_080406F8:
	ldrb r0, [r4]
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r7, 0x13]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	b _08040926
_08040708:
	ldrb r0, [r4]
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r7, 0x13]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	b _08040926
_0804071A:
	ldrb r0, [r4]
	movs r1, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x13]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _08040926
_0804072C:
	movs r2, 0
	adds r3, r7, 0
	adds r3, 0x14
_08040732:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x6
	ble _08040732
	b _08040ADA
_08040742:
	ldrb r0, [r4]
	strb r0, [r7, 0x1B]
	b _08040ADA
_08040748:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	strh r1, [r7, 0x1C]
	b _08040ADA
_08040754:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	strh r1, [r7, 0x1E]
	b _08040ADA
_08040760:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	mov r0, r8
	strh r1, [r0]
	lsls r1, 16
	cmp r1, 0
	beq _08040778
	ldrb r0, [r7, 0x13]
	movs r1, 0x2
	b _08040926
_08040778:
	ldrb r1, [r7, 0x13]
	movs r0, 0x3
	negs r0, r0
	b _08040932
_08040780:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	mov r0, r8
	strh r1, [r0, 0x2]
	b _08040ADA
_0804078E:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r4, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 24
	adds r1, r0
	mov r0, r8
	str r1, [r0, 0x4]
	b _08040ADA
_080407A8:
	ldrb r0, [r4]
	mov r1, r8
	strb r0, [r1, 0x8]
	b _08040ADA
_080407B0:
	ldrb r0, [r4]
	mov r1, r8
	strb r0, [r1, 0x9]
	b _08040ADA
_080407B8:
	mov r2, r10
	subs r2, 0xD
	lsls r2, 1
	add r2, r9
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	strh r1, [r2]
	b _08040ADA
_080407CC:
	mov r0, r9
	add r0, r10
	subs r0, 0x9
	ldrb r1, [r4]
	strb r1, [r0]
	b _08040ADA
_080407D8:
	ldrb r0, [r4]
	strb r0, [r6]
	b _08040ADA
_080407DE:
	ldrb r0, [r4]
	strb r0, [r6, 0x1]
	b _08040ADA
_080407E4:
	ldrb r0, [r4]
	strb r0, [r6, 0x2]
	b _08040ADA
_080407EA:
	ldrb r0, [r4]
	strb r0, [r6, 0x3]
	b _08040ADA
_080407F0:
	ldrb r0, [r4]
	strb r0, [r6, 0x4]
	b _08040ADA
_080407F6:
	ldrb r0, [r4]
	strb r0, [r6, 0x5]
	b _08040ADA
_080407FC:
	ldrb r0, [r4]
	strb r0, [r6, 0x6]
	b _08040ADA
_08040802:
	ldrb r0, [r4]
	strb r0, [r6, 0x7]
	b _08040ADA
_08040808:
	ldrb r0, [r4]
	strb r0, [r6, 0x8]
	b _08040ADA
_0804080E:
	ldrb r0, [r4]
	strb r0, [r6, 0x9]
	b _08040ADA
_08040814:
	ldrb r0, [r4]
	strb r0, [r6, 0xA]
	b _08040ADA
_0804081A:
	ldrb r0, [r4]
	strb r0, [r6, 0xB]
	b _08040ADA
_08040820:
	ldrb r0, [r4]
	strb r0, [r5]
	b _08040ADA
_08040826:
	ldrb r0, [r4]
	strb r0, [r5, 0x1]
	b _08040ADA
_0804082C:
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r1, r0
	ldrb r2, [r5, 0x2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x2]
	b _08040ADA
_08040840:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r1, r0
	lsls r1, 7
	ldrh r2, [r5, 0x2]
	ldr r0, _08040854 @ =0xfffff87f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x2]
	b _08040ADA
	.align 2, 0
_08040854: .4byte 0xfffff87f
_08040858:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r1, r0
	lsls r1, 3
	ldrb r2, [r5, 0x3]
	movs r0, 0x79
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
	b _08040ADA
_0804086E:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0x3]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x3]
	b _08040ADA
_0804087E:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	ldrb r2, [r5, 0x4]
	movs r0, 0x20
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x4]
	b _08040ADA
_08040892:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 5
	ldrh r2, [r5, 0x4]
	ldr r0, _080408A8 @ =0xfffffc1f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	b _08040ADA
	.align 2, 0
_080408A8: .4byte 0xfffffc1f
_080408AC:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0x7D
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _08040ADA
_080408C2:
	ldrb r2, [r4]
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 15
	ldr r0, [r5, 0x4]
	ldr r1, _080408D8 @ =0xfff07fff
	ands r0, r1
	orrs r0, r2
	str r0, [r5, 0x4]
	b _08040ADA
	.align 2, 0
_080408D8: .4byte 0xfff07fff
_080408DC:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 4
	ldrh r2, [r5, 0x6]
	ldr r0, _080408F0 @ =0xfffffe0f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x6]
	b _08040ADA
	.align 2, 0
_080408F0: .4byte 0xfffffe0f
_080408F4:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x7]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	b _08040AD8
_08040908:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 6
	ldrb r2, [r5, 0x7]
	movs r0, 0x41
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	bge _0804092C
	ldrb r0, [r7, 0x13]
	movs r1, 0x4
_08040926:
	orrs r0, r1
	strb r0, [r7, 0x13]
	b _08040ADA
_0804092C:
	ldrb r1, [r7, 0x13]
	movs r0, 0x5
	negs r0, r0
_08040932:
	ands r0, r1
	strb r0, [r7, 0x13]
	b _08040ADA
_08040938:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0x7]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x7]
	b _08040ADA
_08040948:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	ldrb r2, [r5, 0x8]
	movs r0, 0x8
	negs r0, r0
	b _08040964
_08040956:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 3
	ldrb r2, [r5, 0x8]
	movs r0, 0x39
	negs r0, r0
_08040964:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x8]
	b _08040ADA
_0804096C:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 6
	ldrh r2, [r5, 0x8]
	ldr r0, _08040980 @ =0xfffffe3f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x8]
	b _08040ADA
	.align 2, 0
_08040980: .4byte 0xfffffe3f
_08040984:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x9]
	movs r0, 0xF
	negs r0, r0
	b _080409A2
_08040994:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 4
	ldrb r2, [r5, 0x9]
	movs r0, 0x71
	negs r0, r0
_080409A2:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x9]
	b _08040ADA
_080409AA:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0x9]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x9]
	b _08040ADA
_080409BA:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	ldrb r2, [r5, 0xA]
	movs r0, 0x2
	negs r0, r0
	b _08040A26
_080409C8:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0xA]
	movs r0, 0x3
	negs r0, r0
	b _08040A26
_080409D8:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0xA]
	movs r0, 0x5
	negs r0, r0
	b _08040A26
_080409E8:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 3
	ldrb r2, [r5, 0xA]
	movs r0, 0x9
	negs r0, r0
	b _08040A26
_080409F8:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 4
	ldrb r2, [r5, 0xA]
	movs r0, 0x11
	negs r0, r0
	b _08040A26
_08040A08:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 5
	ldrb r2, [r5, 0xA]
	movs r0, 0x21
	negs r0, r0
	b _08040A26
_08040A18:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 6
	ldrb r2, [r5, 0xA]
	movs r0, 0x41
	negs r0, r0
_08040A26:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0xA]
	b _08040ADA
_08040A2E:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0xA]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0xA]
	b _08040ADA
_08040A3E:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	ldrb r2, [r5, 0xB]
	movs r0, 0x2
	negs r0, r0
	b _08040A7A
_08040A4C:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0xB]
	movs r0, 0x3
	negs r0, r0
	b _08040A7A
_08040A5C:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0xB]
	movs r0, 0x5
	negs r0, r0
	b _08040A7A
_08040A6C:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r1, r0
	lsls r1, 3
	ldrb r2, [r5, 0xB]
	movs r0, 0x79
	negs r0, r0
_08040A7A:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0xB]
	b _08040ADA
_08040A82:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0xB]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0xB]
	b _08040ADA
_08040A92:
	ldrb r1, [r4]
	movs r4, 0x1F
	adds r2, r1, 0
	ands r2, r4
	ldrb r3, [r5, 0x4]
	movs r0, 0x20
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5, 0x4]
	lsrs r1, 5
	ands r1, r4
	lsls r1, 5
	ldrh r2, [r5, 0x4]
	ldr r0, _08040AFC @ =0xfffffc1f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldrb r1, [r5, 0x5]
	movs r0, 0x7D
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x5]
	ldr r0, [r5, 0x4]
	ldr r1, _08040B00 @ =0xfff07fff
	ands r0, r1
	str r0, [r5, 0x4]
	ldrh r1, [r5, 0x6]
	ldr r0, _08040B04 @ =0xfffffe0f
	ands r0, r1
	strh r0, [r5, 0x6]
	ldrb r1, [r5, 0x7]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
_08040AD8:
	strb r0, [r5, 0x7]
_08040ADA:
	mov r0, r10
	cmp r0, 0xA
	ble _08040AEE
	adds r0, r7, 0
	bl CalculateBoxMonChecksum
	strh r0, [r7, 0x1C]
	adds r0, r7, 0
	bl EncryptBoxMon
_08040AEE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040AFC: .4byte 0xfffffc1f
_08040B00: .4byte 0xfff07fff
_08040B04: .4byte 0xfffffe0f
	thumb_func_end sub_80404D0

	thumb_func_start CopyMon
CopyMon: @ 8040B08
	push {lr}
	bl memcpy
	pop {r0}
	bx r0
	thumb_func_end CopyMon

	thumb_func_start GiveMonToPlayer
GiveMonToPlayer: @ 8040B14
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, _08040B40 @ =gUnknown_300500C
	ldr r2, [r4]
	movs r1, 0x7
	bl sub_804037C
	ldr r2, [r4]
	adds r2, 0x8
	adds r0, r6, 0
	movs r1, 0x31
	bl sub_804037C
	ldr r2, [r4]
	adds r2, 0xA
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_804037C
	movs r5, 0
	b _08040B46
	.align 2, 0
_08040B40: .4byte gUnknown_300500C
_08040B44:
	adds r5, 0x1
_08040B46:
	cmp r5, 0x5
	bgt _08040B80
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08040B78 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08040B44
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x64
	bl CopyMon
	ldr r1, _08040B7C @ =gUnknown_2024029
	adds r0, r5, 0x1
	strb r0, [r1]
	movs r0, 0
	b _08040B8A
	.align 2, 0
_08040B78: .4byte gUnknown_2024284
_08040B7C: .4byte gUnknown_2024029
_08040B80:
	adds r0, r6, 0
	bl SendMonToPC
	lsls r0, 24
	lsrs r0, 24
_08040B8A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GiveMonToPlayer

	thumb_func_start SendMonToPC
SendMonToPC: @ 8040B90
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, _08040C04 @ =0x00004037
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl set_unknown_box_id
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r5, r0, 24
_08040BAE:
	movs r6, 0
	lsls r7, r5, 24
_08040BB2:
	lsls r1, r6, 24
	lsrs r1, 24
	lsrs r0, r7, 24
	bl GetBoxedMonPtr
	adds r4, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	bne _08040C14
	mov r0, r8
	bl MonRestorePP
	adds r0, r4, 0
	mov r1, r8
	movs r2, 0x50
	bl CopyMon
	ldr r0, _08040C08 @ =gUnknown_20370D6
	strh r5, [r0]
	ldr r0, _08040C0C @ =gUnknown_20370D8
	strh r6, [r0]
	bl get_unknown_box_id
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	beq _08040BF4
	ldr r0, _08040C10 @ =0x00000843
	bl FlagClear
_08040BF4:
	lsls r1, r5, 16
	ldr r0, _08040C04 @ =0x00004037
	lsrs r1, 16
	bl VarSet
	movs r0, 0x1
	b _08040C30
	.align 2, 0
_08040C04: .4byte 0x00004037
_08040C08: .4byte gUnknown_20370D6
_08040C0C: .4byte gUnknown_20370D8
_08040C10: .4byte 0x00000843
_08040C14:
	adds r6, 0x1
	cmp r6, 0x1D
	ble _08040BB2
	adds r5, 0x1
	cmp r5, 0xE
	bne _08040C22
	movs r5, 0
_08040C22:
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _08040BAE
	movs r0, 0x2
_08040C30:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end SendMonToPC

	thumb_func_start CalculatePlayerPartyCount
CalculatePlayerPartyCount: @ 8040C3C
	push {r4,lr}
	ldr r0, _08040C48 @ =gUnknown_2024029
	movs r1, 0
	strb r1, [r0]
	b _08040C54
	.align 2, 0
_08040C48: .4byte gUnknown_2024029
_08040C4C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r0, r4, 0
_08040C54:
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _08040C72
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08040C7C @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08040C4C
_08040C72:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040C7C: .4byte gUnknown_2024284
	thumb_func_end CalculatePlayerPartyCount

	thumb_func_start CalculateEnemyPartyCount
CalculateEnemyPartyCount: @ 8040C80
	push {r4,lr}
	ldr r0, _08040C8C @ =gUnknown_202402A
	movs r1, 0
	strb r1, [r0]
	b _08040C98
	.align 2, 0
_08040C8C: .4byte gUnknown_202402A
_08040C90:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r0, r4, 0
_08040C98:
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _08040CB6
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08040CC0 @ =gUnknown_202402C
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08040C90
_08040CB6:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040CC0: .4byte gUnknown_202402C
	thumb_func_end CalculateEnemyPartyCount

	thumb_func_start GetMonsStateToDoubles
GetMonsStateToDoubles: @ 8040CC4
	push {r4-r6,lr}
	movs r6, 0
	bl CalculatePlayerPartyCount
	ldr r1, _08040D30 @ =gUnknown_2024029
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _08040D28
	movs r5, 0
	ldrb r1, [r1]
	cmp r6, r1
	bge _08040D20
_08040CDC:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08040D34 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _08040D16
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _08040D16
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08040D16
	adds r6, 0x1
_08040D16:
	adds r5, 0x1
	ldr r0, _08040D30 @ =gUnknown_2024029
	ldrb r0, [r0]
	cmp r5, r0
	blt _08040CDC
_08040D20:
	movs r0, 0
	cmp r6, 0x1
	bgt _08040D28
	movs r0, 0x2
_08040D28:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08040D30: .4byte gUnknown_2024029
_08040D34: .4byte gUnknown_2024284
	thumb_func_end GetMonsStateToDoubles

	thumb_func_start GetAbilityBySpecies
GetAbilityBySpecies: @ 8040D38
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	cmp r1, 0
	beq _08040D5C
	ldr r2, _08040D54 @ =gUnknown_2023D6A
	ldr r1, _08040D58 @ =gUnknown_8254784
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x17]
	b _08040D6A
	.align 2, 0
_08040D54: .4byte gUnknown_2023D6A
_08040D58: .4byte gUnknown_8254784
_08040D5C:
	ldr r2, _08040D74 @ =gUnknown_2023D6A
	ldr r1, _08040D78 @ =gUnknown_8254784
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x16]
_08040D6A:
	strb r0, [r2]
	ldrb r0, [r2]
	pop {r1}
	bx r1
	.align 2, 0
_08040D74: .4byte gUnknown_2023D6A
_08040D78: .4byte gUnknown_8254784
	thumb_func_end GetAbilityBySpecies

	thumb_func_start GetMonAbility
GetMonAbility: @ 8040D7C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x2E
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetAbilityBySpecies
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetMonAbility

	thumb_func_start CreateSecretBaseEnemyParty
CreateSecretBaseEnemyParty: @ 8040DB0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r5, r0, 0
	bl ZeroEnemyPartyMons
	ldr r4, _08040ED8 @ =gUnknown_2023FF4
	ldr r0, [r4]
	ldr r0, [r0]
	adds r1, r5, 0
	movs r2, 0xA0
	bl memcpy
	movs r0, 0
	mov r9, r0
_08040DD4:
	ldr r1, _08040ED8 @ =gUnknown_2023FF4
	ldr r3, [r1]
	ldr r2, [r3]
	mov r4, r9
	lsls r7, r4, 1
	adds r0, r2, 0
	adds r0, 0x7C
	adds r1, r0, r7
	ldrh r0, [r1]
	adds r4, 0x1
	str r4, [sp, 0x10]
	cmp r0, 0
	beq _08040EAE
	movs r0, 0x64
	mov r6, r9
	muls r6, r0
	ldr r4, _08040EDC @ =gUnknown_202402C
	mov r8, r4
	adds r5, r6, r4
	ldrh r1, [r1]
	adds r0, r2, 0
	adds r0, 0x94
	add r0, r9
	ldrb r2, [r0]
	movs r0, 0x1
	str r0, [sp]
	ldr r0, [r3]
	mov r3, r9
	lsls r4, r3, 2
	adds r0, 0x34
	adds r0, r4
	ldr r0, [r0]
	str r0, [sp, 0x4]
	movs r0, 0x2
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r3, 0xF
	bl CreateMon
	ldr r1, _08040ED8 @ =gUnknown_2023FF4
	ldr r0, [r1]
	adds r1, r7, 0
	adds r1, 0x88
	ldr r2, [r0]
	adds r2, r1
	adds r0, r5, 0
	movs r1, 0xC
	bl sub_804037C
	movs r5, 0
	mov r10, r4
	mov r7, r9
	adds r7, 0x9A
	mov r4, r8
_08040E44:
	adds r1, r5, 0
	adds r1, 0x1A
	ldr r2, _08040ED8 @ =gUnknown_2023FF4
	ldr r0, [r2]
	ldr r2, [r0]
	adds r2, r7
	adds r0, r6, r4
	bl sub_804037C
	adds r5, 0x1
	cmp r5, 0x5
	ble _08040E44
	movs r5, 0
	movs r3, 0x64
	mov r0, r9
	muls r0, r3
	ldr r1, _08040EDC @ =gUnknown_202402C
	adds r7, r0, r1
	mov r4, r10
	lsls r0, r4, 1
	adds r6, r0, 0
	adds r6, 0x4C
	adds r4, r0, 0
_08040E72:
	adds r1, r5, 0
	adds r1, 0xD
	ldr r2, _08040ED8 @ =gUnknown_2023FF4
	ldr r0, [r2]
	ldr r2, [r0]
	adds r2, r6
	adds r0, r7, 0
	bl sub_804037C
	adds r1, r5, 0
	adds r1, 0x11
	ldr r3, _08040ED8 @ =gUnknown_2023FF4
	ldr r0, [r3]
	ldr r0, [r0]
	adds r0, 0x4C
	adds r0, r4
	ldrh r0, [r0]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _08040EE0 @ =gUnknown_8250C08
	adds r2, r0
	adds r0, r7, 0
	bl sub_804037C
	adds r6, 0x2
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08040E72
_08040EAE:
	ldr r4, [sp, 0x10]
	mov r9, r4
	cmp r4, 0x5
	ble _08040DD4
	ldr r1, _08040EE4 @ =gUnknown_2022B4C
	movs r0, 0x8
	str r0, [r1]
	ldr r1, _08040EE8 @ =gUnknown_20386AE
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040ED8: .4byte gUnknown_2023FF4
_08040EDC: .4byte gUnknown_202402C
_08040EE0: .4byte gUnknown_8250C08
_08040EE4: .4byte gUnknown_2022B4C
_08040EE8: .4byte gUnknown_20386AE
	thumb_func_end CreateSecretBaseEnemyParty

	thumb_func_start GetSecretBaseTrainerPicIndex
GetSecretBaseTrainerPicIndex: @ 8040EEC
	push {r4,r5,lr}
	ldr r5, _08040F20 @ =gUnknown_825DFE0
	ldr r0, _08040F24 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r4, [r0]
	ldrb r0, [r4, 0x9]
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4, 0x1]
	lsls r2, 27
	lsrs r2, 31
	lsls r1, r2, 2
	adds r1, r2
	adds r0, r1
	adds r0, r5
	ldrb r0, [r0]
	ldr r1, _08040F28 @ =gUnknown_82538A8
	adds r0, r1
	ldrb r0, [r0]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08040F20: .4byte gUnknown_825DFE0
_08040F24: .4byte gUnknown_2023FF4
_08040F28: .4byte gUnknown_82538A8
	thumb_func_end GetSecretBaseTrainerPicIndex

	thumb_func_start GetSecretBaseTrainerNameIndex
GetSecretBaseTrainerNameIndex: @ 8040F2C
	push {r4,r5,lr}
	ldr r5, _08040F60 @ =gUnknown_825DFE0
	ldr r0, _08040F64 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r4, [r0]
	ldrb r0, [r4, 0x9]
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4, 0x1]
	lsls r2, 27
	lsrs r2, 31
	lsls r1, r2, 2
	adds r1, r2
	adds r0, r1
	adds r0, r5
	ldrb r0, [r0]
	ldr r1, _08040F68 @ =gUnknown_825393E
	adds r0, r1
	ldrb r0, [r0]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08040F60: .4byte gUnknown_825DFE0
_08040F64: .4byte gUnknown_2023FF4
_08040F68: .4byte gUnknown_825393E
	thumb_func_end GetSecretBaseTrainerNameIndex

	thumb_func_start IsPlayerPartyAndPokemonStorageFull
IsPlayerPartyAndPokemonStorageFull: @ 8040F6C
	push {r4,lr}
	movs r4, 0
_08040F70:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08040F88 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08040F8C
	movs r0, 0
	b _08040F9A
	.align 2, 0
_08040F88: .4byte gUnknown_2024284
_08040F8C:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08040F70
	bl IsPokemonStorageFull
	lsls r0, 24
	lsrs r0, 24
_08040F9A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsPlayerPartyAndPokemonStorageFull

	thumb_func_start IsPokemonStorageFull
IsPokemonStorageFull: @ 8040FA0
	push {r4-r6,lr}
	movs r6, 0
_08040FA4:
	movs r4, 0
	lsls r5, r6, 24
_08040FA8:
	lsls r1, r4, 24
	lsrs r1, 24
	lsrs r0, r5, 24
	movs r2, 0xB
	bl GetBoxMonDataFromAnyBox
	cmp r0, 0
	bne _08040FBC
	movs r0, 0
	b _08040FCA
_08040FBC:
	adds r4, 0x1
	cmp r4, 0x1D
	ble _08040FA8
	adds r6, 0x1
	cmp r6, 0xD
	ble _08040FA4
	movs r0, 0x1
_08040FCA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsPokemonStorageFull

	thumb_func_start GetSpeciesName
GetSpeciesName: @ 8040FD0
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r1, 0
	movs r0, 0xCE
	lsls r0, 1
	mov r12, r0
	ldr r7, _08040FEC @ =gUnknown_8245EE0
	movs r0, 0xB
	muls r0, r5
	adds r3, r0, r7
	adds r2, r6, 0
	b _08040FF6
	.align 2, 0
_08040FEC: .4byte gUnknown_8245EE0
_08040FF0:
	adds r3, 0x1
	adds r2, 0x1
	adds r1, 0x1
_08040FF6:
	adds r4, r6, r1
	cmp r1, 0x9
	bgt _08041010
	cmp r5, r12
	bls _08041006
	adds r0, r1, r7
	ldrb r0, [r0]
	b _08041008
_08041006:
	ldrb r0, [r3]
_08041008:
	strb r0, [r2]
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _08040FF0
_08041010:
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end GetSpeciesName

	thumb_func_start CalculatePPWithBonus
CalculatePPWithBonus: @ 804101C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _0804105C @ =gUnknown_8250C04
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	ldrb r4, [r3, 0x4]
	ldr r0, _08041060 @ =gUnknown_825DEA1
	adds r0, r2, r0
	ldrb r3, [r0]
	ands r3, r1
	lsls r2, 1
	asrs r3, r2
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	muls r0, r4
	movs r1, 0x64
	bl __divsi3
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804105C: .4byte gUnknown_8250C04
_08041060: .4byte gUnknown_825DEA1
	thumb_func_end CalculatePPWithBonus

	thumb_func_start RemoveMonPPBonus
RemoveMonPPBonus: @ 8041064
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	ldr r1, _0804109C @ =gUnknown_825DEA5
	adds r4, r1
	ldrb r1, [r4]
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
	adds r0, r5, 0
	movs r1, 0x15
	mov r2, sp
	bl sub_804037C
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804109C: .4byte gUnknown_825DEA5
	thumb_func_end RemoveMonPPBonus

	thumb_func_start RemoveBattleMonPPBonus
RemoveBattleMonPPBonus: @ 80410A0
	lsls r1, 24
	lsrs r1, 24
	adds r0, 0x3B
	ldr r2, _080410B4 @ =gUnknown_825DEA5
	adds r1, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080410B4: .4byte gUnknown_825DEA5
	thumb_func_end RemoveBattleMonPPBonus

	thumb_func_start CopyPlayerPartyMonToBattleData
CopyPlayerPartyMonToBattleData: @ 80410B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r0, 0x64
	mov r5, r9
	muls r5, r0
	ldr r0, _080413A4 @ =gUnknown_2024284
	adds r5, r0
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	ldr r1, _080413A8 @ =gUnknown_2023BE4
	mov r8, r1
	movs r1, 0x58
	ldr r2, [sp, 0x14]
	adds r4, r2, 0
	muls r4, r1
	mov r3, r8
	adds r6, r4, r3
	strh r0, [r6]
	adds r0, r5, 0
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	strh r0, [r6, 0x2E]
	movs r6, 0
	mov r0, r8
	adds r0, 0x24
	adds r7, r4, r0
_0804110A:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	movs r1, 0xC
	add r1, r8
	mov r10, r1
	adds r1, r4, r1
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	strb r0, [r7]
	adds r7, 0x1
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0804110A
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _080413A4 @ =gUnknown_2024284
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	movs r2, 0xC
	negs r2, r2
	add r2, r10
	mov r9, r2
	movs r1, 0x58
	ldr r3, [sp, 0x14]
	adds r5, r3, 0
	muls r5, r1
	adds r7, r5, r2
	adds r1, r7, 0
	adds r1, 0x3B
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r1, r7, 0
	adds r1, 0x2B
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x19
	movs r2, 0
	bl GetMonData
	mov r1, r10
	adds r1, 0x38
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	movs r2, 0
	bl GetMonData
	movs r6, 0x1F
	ands r0, r6
	ldrb r2, [r7, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	movs r2, 0
	bl GetMonData
	movs r1, 0x1F
	mov r8, r1
	mov r2, r8
	ands r0, r2
	lsls r0, 5
	ldrh r2, [r7, 0x14]
	ldr r1, _080413AC @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r7, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	movs r2, 0
	bl GetMonData
	ands r0, r6
	lsls r0, 2
	ldrb r2, [r7, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	movs r2, 0
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [r7, 0x14]
	ldr r2, _080413B0 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [r7, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	movs r2, 0
	bl GetMonData
	mov r3, r8
	ands r0, r3
	lsls r0, 4
	ldrh r2, [r7, 0x16]
	ldr r1, _080413B4 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r7, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	movs r2, 0
	bl GetMonData
	ands r0, r6
	lsls r0, 1
	ldrb r2, [r7, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x17]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	mov r1, r10
	adds r1, 0x3C
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0x37
	movs r2, 0
	bl GetMonData
	mov r1, r10
	adds r1, 0x40
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	movs r2, 0
	bl GetMonData
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r7, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	movs r2, 0
	bl GetMonData
	lsls r0, 7
	ldrb r2, [r7, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	mov r1, r10
	adds r1, 0x48
	adds r1, r5, r1
	str r0, [r1]
	ldr r2, _080413B8 @ =gUnknown_8254784
	ldrh r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	adds r1, r7, 0
	adds r1, 0x21
	strb r0, [r1]
	ldrh r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	adds r1, r7, 0
	adds r1, 0x22
	strb r0, [r1]
	ldrh r0, [r7]
	ldrb r1, [r7, 0x17]
	lsrs r1, 7
	bl GetAbilityBySpecies
	adds r1, r7, 0
	adds r1, 0x20
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, r10
	adds r0, 0x24
	adds r0, r5, r0
	mov r1, sp
	bl StringCopy10
	mov r2, r10
	adds r2, 0x30
	adds r2, r5, r2
	adds r0, r4, 0
	movs r1, 0x7
	bl GetMonData
	ldr r0, [sp, 0x14]
	bl GetBankSide
	ldr r1, _080413BC @ =gUnknown_2023FE8
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0xA8
	ldr r1, [r1]
	adds r1, r0
	ldrh r0, [r7, 0x28]
	strh r0, [r1]
	movs r2, 0x6
	mov r1, r9
	movs r6, 0x7
	add r5, r10
	adds r0, r5, 0
	adds r0, 0x13
_0804136E:
	strb r2, [r0]
	subs r0, 0x1
	subs r6, 0x1
	cmp r6, 0
	bge _0804136E
	movs r2, 0
	movs r0, 0x58
	ldr r3, [sp, 0x14]
	muls r0, r3
	adds r1, 0x50
	adds r0, r1
	str r2, [r0]
	ldr r0, [sp, 0x14]
	bl sub_80174B8
	ldr r0, [sp, 0x14]
	movs r1, 0
	bl ClearTemporarySpeciesSpriteData
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080413A4: .4byte gUnknown_2024284
_080413A8: .4byte gUnknown_2023BE4
_080413AC: .4byte 0xfffffc1f
_080413B0: .4byte 0xfff07fff
_080413B4: .4byte 0xfffffe0f
_080413B8: .4byte gUnknown_8254784
_080413BC: .4byte gUnknown_2023FE8
	thumb_func_end CopyPlayerPartyMonToBattleData

	.align 2, 0 @ Don't pad with nop.
