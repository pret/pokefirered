	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start StringCopy10
StringCopy10: @ 8008CF4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0xA
	movs r3, 0
_08008CFC:
	adds r2, r4, r3
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08008D10
	adds r0, r2, 0
	b _08008D20
_08008D10:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r5
	bcc _08008CFC
	adds r0, r4, r3
	movs r1, 0xFF
	strb r1, [r0]
_08008D20:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end StringCopy10

	thumb_func_start StringGetEnd10
StringGetEnd10: @ 8008D28
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0xA
	movs r2, 0
_08008D30:
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08008D3C
	adds r0, r1, 0
	b _08008D4C
_08008D3C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08008D30
	adds r0, r3, r2
	movs r1, 0xFF
	strb r1, [r0]
_08008D4C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StringGetEnd10

	thumb_func_start StringCopy7
StringCopy7: @ 8008D54
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x7
	movs r3, 0
_08008D5C:
	adds r2, r4, r3
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08008D70
	adds r0, r2, 0
	b _08008D7C
_08008D70:
	adds r3, 0x1
	cmp r3, r5
	blt _08008D5C
	adds r0, r4, r3
	movs r1, 0xFF
	strb r1, [r0]
_08008D7C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end StringCopy7

	thumb_func_start StringCopy
StringCopy: @ 8008D84
	push {lr}
	adds r3, r0, 0
	b _08008D90
_08008D8A:
	strb r2, [r3]
	adds r3, 0x1
	adds r1, 0x1
_08008D90:
	ldrb r2, [r1]
	adds r0, r2, 0
	cmp r0, 0xFF
	bne _08008D8A
	movs r0, 0xFF
	strb r0, [r3]
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end StringCopy

	thumb_func_start StringAppend
StringAppend: @ 8008DA4
	push {lr}
	adds r2, r0, 0
	b _08008DAC
_08008DAA:
	adds r2, 0x1
_08008DAC:
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _08008DAA
	adds r0, r2, 0
	bl StringCopy
	pop {r1}
	bx r1
	thumb_func_end StringAppend

	thumb_func_start StringCopyN
StringCopyN: @ 8008DBC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r5, r2, 24
	movs r3, 0
	adds r0, r5, 0
	cmp r3, r0
	bcs _08008DE2
	adds r2, r0, 0
_08008DD0:
	adds r1, r4, r3
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r2
	bcc _08008DD0
_08008DE2:
	adds r0, r4, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StringCopyN

	thumb_func_start StringAppendN
StringAppendN: @ 8008DEC
	push {lr}
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	b _08008DF8
_08008DF6:
	adds r3, 0x1
_08008DF8:
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _08008DF6
	adds r0, r3, 0
	bl StringCopyN
	pop {r1}
	bx r1
	thumb_func_end StringAppendN

	thumb_func_start StringLength
StringLength: @ 8008E08
	push {lr}
	adds r2, r0, 0
	movs r1, 0
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _08008E22
_08008E14:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08008E14
_08008E22:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end StringLength

	thumb_func_start StringCompare
StringCompare: @ 8008E28
	push {lr}
	adds r2, r0, 0
	b _08008E3A
_08008E2E:
	cmp r0, 0xFF
	bne _08008E36
	movs r0, 0
	b _08008E48
_08008E36:
	adds r2, 0x1
	adds r1, 0x1
_08008E3A:
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r0, r3
	beq _08008E2E
	ldrb r0, [r2]
	ldrb r1, [r1]
	subs r0, r1
_08008E48:
	pop {r1}
	bx r1
	thumb_func_end StringCompare

	thumb_func_start StringCompareN
StringCompareN: @ 8008E4C
	push {r4,lr}
	adds r3, r0, 0
	b _08008E64
_08008E52:
	cmp r0, 0xFF
	beq _08008E60
	adds r3, 0x1
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _08008E64
_08008E60:
	movs r0, 0
	b _08008E72
_08008E64:
	ldrb r0, [r3]
	ldrb r4, [r1]
	cmp r0, r4
	beq _08008E52
	ldrb r0, [r3]
	ldrb r1, [r1]
	subs r0, r1
_08008E72:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StringCompareN

	thumb_func_start ConvertIntToDecimalStringN
ConvertIntToDecimalStringN: @ 8008E78
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r3, 24
	ldr r0, _08008EC8 @ =gUnknown_8231E3C
	lsrs r3, 22
	subs r3, 0x4
	adds r3, r0
	ldr r0, [r3]
	movs r7, 0
	cmp r2, 0x1
	bne _08008E96
	movs r7, 0x2
_08008E96:
	cmp r2, 0x2
	bne _08008E9C
	movs r7, 0x1
_08008E9C:
	adds r5, r0, 0
	cmp r5, 0
	ble _08008F08
	ldr r0, _08008ECC @ =gUnknown_8231E2C
	mov r8, r0
_08008EA6:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __divsi3
	lsls r0, 16
	lsrs r2, r0, 16
	adds r0, r5, 0
	muls r0, r2
	subs r1, r6, r0
	cmp r7, 0x1
	bne _08008ED0
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bls _08008EE2
	b _08008EEA
	.align 2, 0
_08008EC8: .4byte gUnknown_8231E3C
_08008ECC: .4byte gUnknown_8231E2C
_08008ED0:
	cmp r2, 0
	bne _08008ED8
	cmp r5, 0x1
	bne _08008EF0
_08008ED8:
	movs r7, 0x1
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bhi _08008EEA
_08008EE2:
	mov r6, r8
	adds r0, r2, r6
	ldrb r0, [r0]
	b _08008EEC
_08008EEA:
	movs r0, 0xAC
_08008EEC:
	strb r0, [r3]
	b _08008EF8
_08008EF0:
	cmp r7, 0x2
	bne _08008EF8
	strb r2, [r4]
	adds r4, 0x1
_08008EF8:
	adds r6, r1, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	cmp r5, 0
	bgt _08008EA6
_08008F08:
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ConvertIntToDecimalStringN

	thumb_func_start sub_8008F18
sub_8008F18: @ 8008F18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	adds r7, r1, 0
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x1
	movs r0, 0x1
	cmp r1, r3
	bcs _08008F3C
_08008F30:
	lsls r1, 4
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r3
	bcc _08008F30
_08008F3C:
	movs r3, 0
	cmp r2, 0x1
	bne _08008F44
	movs r3, 0x2
_08008F44:
	cmp r2, 0x2
	bne _08008F4A
	movs r3, 0x1
_08008F4A:
	adds r5, r1, 0
	cmp r5, 0
	ble _08008FB8
	ldr r0, _08008F7C @ =gUnknown_8231E2C
	mov r8, r0
_08008F54:
	adds r0, r7, 0
	adds r1, r5, 0
	str r3, [sp]
	bl __divsi3
	adds r4, r0, 0
	adds r0, r7, 0
	adds r1, r5, 0
	bl __modsi3
	adds r1, r0, 0
	ldr r3, [sp]
	cmp r3, 0x1
	bne _08008F80
	adds r2, r6, 0
	adds r6, 0x1
	cmp r4, 0xF
	bls _08008F92
	b _08008F9A
	.align 2, 0
_08008F7C: .4byte gUnknown_8231E2C
_08008F80:
	cmp r4, 0
	bne _08008F88
	cmp r5, 0x1
	bne _08008FA0
_08008F88:
	movs r3, 0x1
	adds r2, r6, 0
	adds r6, 0x1
	cmp r4, 0xF
	bhi _08008F9A
_08008F92:
	mov r7, r8
	adds r0, r4, r7
	ldrb r0, [r0]
	b _08008F9C
_08008F9A:
	movs r0, 0xAC
_08008F9C:
	strb r0, [r2]
	b _08008FA8
_08008FA0:
	cmp r3, 0x2
	bne _08008FA8
	strb r4, [r6]
	adds r6, 0x1
_08008FA8:
	adds r7, r1, 0
	adds r0, r5, 0
	cmp r5, 0
	bge _08008FB2
	adds r0, 0xF
_08008FB2:
	asrs r5, r0, 4
	cmp r5, 0
	bgt _08008F54
_08008FB8:
	movs r0, 0xFF
	strb r0, [r6]
	adds r0, r6, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8008F18

	thumb_func_start StringExpandPlaceholders
StringExpandPlaceholders: @ 8008FCC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
_08008FD2:
	ldrb r2, [r5]
	adds r5, 0x1
	adds r0, r2, 0
	subs r0, 0xFA
	cmp r0, 0x5
	bhi _080090A6
	lsls r0, 2
	ldr r1, _08008FE8 @ =_08008FEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008FE8: .4byte _08008FEC
	.align 2, 0
_08008FEC:
	.4byte _080090A6
	.4byte _080090A6
	.4byte _08009018
	.4byte _08009004
	.4byte _080090A6
	.4byte _080090AC
_08009004:
	ldrb r0, [r5]
	adds r5, 0x1
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r4, r0, 0
	b _08008FD2
_08009018:
	strb r2, [r4]
	adds r4, 0x1
	ldrb r2, [r5]
	adds r5, 0x1
	strb r2, [r4]
	adds r4, 0x1
	subs r0, r2, 0x4
	cmp r0, 0x14
	bhi _0800909C
	lsls r0, 2
	ldr r1, _08009034 @ =_08009038
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009034: .4byte _08009038
	.align 2, 0
_08009038:
	.4byte _0800908C
	.4byte _0800909C
	.4byte _0800909C
	.4byte _08008FD2
	.4byte _0800909C
	.4byte _08008FD2
	.4byte _0800909C
	.4byte _08009094
	.4byte _0800909C
	.4byte _0800909C
	.4byte _0800909C
	.4byte _08008FD2
	.4byte _0800909C
	.4byte _0800909C
	.4byte _0800909C
	.4byte _0800909C
	.4byte _0800909C
	.4byte _08008FD2
	.4byte _08008FD2
	.4byte _08008FD2
	.4byte _08008FD2
_0800908C:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, 0x1
	adds r4, 0x1
_08009094:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, 0x1
	adds r4, 0x1
_0800909C:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, 0x1
	adds r4, 0x1
	b _08008FD2
_080090A6:
	strb r2, [r4]
	adds r4, 0x1
	b _08008FD2
_080090AC:
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end StringExpandPlaceholders

	thumb_func_start StringBraille
StringBraille: @ 80090B8
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _080090F0 @ =gUnknown_8231E64
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _080090F4 @ =gUnknown_8231E68
	adds r0, r4, 0
	movs r2, 0x5
	bl memcpy
	adds r0, r5, 0
	mov r1, sp
_080090DA:
	bl StringCopy
	adds r5, r0, 0
_080090E0:
	ldrb r0, [r6]
	adds r6, 0x1
	cmp r0, 0xFE
	beq _080090F8
	cmp r0, 0xFF
	bne _080090FE
	b _0800910A
	.align 2, 0
_080090F0: .4byte gUnknown_8231E64
_080090F4: .4byte gUnknown_8231E68
_080090F8:
	adds r0, r5, 0
	adds r1, r4, 0
	b _080090DA
_080090FE:
	strb r0, [r5]
	adds r5, 0x1
	adds r0, 0x40
	strb r0, [r5]
	adds r5, 0x1
	b _080090E0
_0800910A:
	strb r0, [r5]
	adds r0, r5, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StringBraille

	thumb_func_start sub_8009118
sub_8009118: @ 8009118
	ldr r0, _0800911C @ =gUnknownStringVar
	bx lr
	.align 2, 0
_0800911C: .4byte gUnknownStringVar
	thumb_func_end sub_8009118

	thumb_func_start sub_8009120
sub_8009120: @ 8009120
	ldr r0, _08009128 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08009128: .4byte gSaveBlock2Ptr
	thumb_func_end sub_8009120

	thumb_func_start sub_800912C
sub_800912C: @ 800912C
	ldr r0, _08009130 @ =gStringVar1
	bx lr
	.align 2, 0
_08009130: .4byte gStringVar1
	thumb_func_end sub_800912C

	thumb_func_start sub_8009134
sub_8009134: @ 8009134
	ldr r0, _08009138 @ =gStringVar2
	bx lr
	.align 2, 0
_08009138: .4byte gStringVar2
	thumb_func_end sub_8009134

	thumb_func_start sub_800913C
sub_800913C: @ 800913C
	ldr r0, _08009140 @ =gStringVar3
	bx lr
	.align 2, 0
_08009140: .4byte gStringVar3
	thumb_func_end sub_800913C

	thumb_func_start sub_8009144
sub_8009144: @ 8009144
	push {lr}
	ldr r0, _08009154 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _0800915C
	ldr r0, _08009158 @ =gUnknown_8415A22
	b _0800915E
	.align 2, 0
_08009154: .4byte gSaveBlock2Ptr
_08009158: .4byte gUnknown_8415A22
_0800915C:
	ldr r0, _08009164 @ =gUnknown_8415A21
_0800915E:
	pop {r1}
	bx r1
	.align 2, 0
_08009164: .4byte gUnknown_8415A21
	thumb_func_end sub_8009144

	thumb_func_start sub_8009168
sub_8009168: @ 8009168
	push {lr}
	ldr r0, _08009188 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r2, _0800918C @ =0x00003a4c
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080091A0
	ldr r0, _08009190 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08009198
	ldr r0, _08009194 @ =gUnknown_8415A5C
	b _080091A2
	.align 2, 0
_08009188: .4byte gSaveBlock1Ptr
_0800918C: .4byte 0x00003a4c
_08009190: .4byte gSaveBlock2Ptr
_08009194: .4byte gUnknown_8415A5C
_08009198:
	ldr r0, _0800919C @ =gUnknown_8415A58
	b _080091A2
	.align 2, 0
_0800919C: .4byte gUnknown_8415A58
_080091A0:
	adds r0, r1, 0
_080091A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8009168

	thumb_func_start sub_80091A8
sub_80091A8: @ 80091A8
	ldr r0, _080091AC @ =gUnknown_8415A2C
	bx lr
	.align 2, 0
_080091AC: .4byte gUnknown_8415A2C
	thumb_func_end sub_80091A8

	thumb_func_start sub_80091B0
sub_80091B0: @ 80091B0
	ldr r0, _080091B4 @ =gUnknown_8415A36
	bx lr
	.align 2, 0
_080091B4: .4byte gUnknown_8415A36
	thumb_func_end sub_80091B0

	thumb_func_start sub_80091B8
sub_80091B8: @ 80091B8
	ldr r0, _080091BC @ =gUnknown_8415A31
	bx lr
	.align 2, 0
_080091BC: .4byte gUnknown_8415A31
	thumb_func_end sub_80091B8

	thumb_func_start sub_80091C0
sub_80091C0: @ 80091C0
	ldr r0, _080091C4 @ =gUnknown_8415A43
	bx lr
	.align 2, 0
_080091C4: .4byte gUnknown_8415A43
	thumb_func_end sub_80091C0

	thumb_func_start sub_80091C8
sub_80091C8: @ 80091C8
	ldr r0, _080091CC @ =gUnknown_8415A3C
	bx lr
	.align 2, 0
_080091CC: .4byte gUnknown_8415A3C
	thumb_func_end sub_80091C8

	thumb_func_start sub_80091D0
sub_80091D0: @ 80091D0
	ldr r0, _080091D4 @ =gUnknown_8415A50
	bx lr
	.align 2, 0
_080091D4: .4byte gUnknown_8415A50
	thumb_func_end sub_80091D0

	thumb_func_start sub_80091D8
sub_80091D8: @ 80091D8
	ldr r0, _080091DC @ =gUnknown_8415A49
	bx lr
	.align 2, 0
_080091DC: .4byte gUnknown_8415A49
	thumb_func_end sub_80091D8

	thumb_func_start GetExpandedPlaceholder
GetExpandedPlaceholder: @ 80091E0
	push {lr}
	cmp r0, 0xD
	bhi _080091F8
	ldr r1, _080091F4 @ =gUnknown_8231E70
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _080091FA
	.align 2, 0
_080091F4: .4byte gUnknown_8231E70
_080091F8:
	ldr r0, _08009200 @ =gUnknown_8415A20
_080091FA:
	pop {r1}
	bx r1
	.align 2, 0
_08009200: .4byte gUnknown_8415A20
	thumb_func_end GetExpandedPlaceholder

	thumb_func_start StringFill
StringFill: @ 8009204
	push {lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0
	cmp r0, r2
	bcs _08009224
_08009216:
	strb r1, [r3]
	adds r3, 0x1
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r2
	bcc _08009216
_08009224:
	movs r0, 0xFF
	strb r0, [r3]
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end StringFill

	thumb_func_start StringCopyPadded
StringCopyPadded: @ 8009230
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r3, 16
	b _08009250
_08009240:
	strb r1, [r4]
	adds r5, 0x1
	adds r4, 0x1
	cmp r3, 0
	beq _08009250
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
_08009250:
	ldrb r1, [r5]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08009240
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08009280 @ =0x0000ffff
	cmp r3, r0
	beq _08009274
	adds r1, r0, 0
_08009266:
	strb r2, [r4]
	adds r4, 0x1
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bne _08009266
_08009274:
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08009280: .4byte 0x0000ffff
	thumb_func_end StringCopyPadded

	thumb_func_start StringFillWithTerminator
StringFillWithTerminator: @ 8009284
	push {lr}
	lsls r2, r1, 16
	lsrs r2, 16
	movs r1, 0xFF
	bl StringFill
	pop {r1}
	bx r1
	thumb_func_end StringFillWithTerminator

	thumb_func_start StringCopyN_Multibyte
StringCopyN_Multibyte: @ 8009294
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	subs r2, 0x1
	movs r5, 0x1
	negs r5, r5
	b _080092BA
_080092A2:
	strb r0, [r4]
	adds r3, 0x1
	adds r4, 0x1
	subs r0, r3, 0x1
	ldrb r0, [r0]
	cmp r0, 0xF9
	bne _080092B8
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, 0x1
	adds r4, 0x1
_080092B8:
	subs r2, 0x1
_080092BA:
	cmp r2, r5
	beq _080092C6
	ldrb r0, [r3]
	adds r1, r0, 0
	cmp r1, 0xFF
	bne _080092A2
_080092C6:
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end StringCopyN_Multibyte

	thumb_func_start StringLength_Multibyte
StringLength_Multibyte: @ 80092D4
	push {lr}
	adds r2, r0, 0
	movs r3, 0
	b _080092E6
_080092DC:
	cmp r1, 0xF9
	bne _080092E2
	adds r2, 0x1
_080092E2:
	adds r2, 0x1
	adds r3, 0x1
_080092E6:
	ldrb r1, [r2]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080092DC
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end StringLength_Multibyte

	thumb_func_start WriteColorChangeControlCode
WriteColorChangeControlCode: @ 80092F4
	push {lr}
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0xFC
	strb r0, [r3]
	adds r3, 0x1
	cmp r1, 0x1
	beq _08009316
	cmp r1, 0x1
	bcc _08009310
	cmp r1, 0x2
	beq _0800931C
	b _08009320
_08009310:
	movs r0, 0x1
	strb r0, [r3]
	b _0800931E
_08009316:
	movs r0, 0x3
	strb r0, [r3]
	b _0800931E
_0800931C:
	strb r1, [r3]
_0800931E:
	adds r3, 0x1
_08009320:
	strb r2, [r3]
	adds r3, 0x1
	movs r0, 0xFF
	strb r0, [r3]
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end WriteColorChangeControlCode

	thumb_func_start GetExtCtrlCodeLength
GetExtCtrlCodeLength: @ 8009330
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0
	cmp r1, 0x18
	bhi _08009342
	ldr r0, _08009348 @ =gUnknown_8231EA8
	adds r0, r1, r0
	ldrb r0, [r0]
_08009342:
	pop {r1}
	bx r1
	.align 2, 0
_08009348: .4byte gUnknown_8231EA8
	thumb_func_end GetExtCtrlCodeLength

	thumb_func_start SkipExtCtrlCode
SkipExtCtrlCode: @ 800934C
	push {r4,lr}
	adds r4, r0, 0
	b _08009360
_08009352:
	adds r4, 0x1
	ldrb r0, [r4]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0
_08009360:
	ldrb r0, [r4]
	cmp r0, 0xFC
	beq _08009352
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SkipExtCtrlCode

	thumb_func_start StringCompareWithoutExtCtrlCodes
StringCompareWithoutExtCtrlCodes: @ 8009370
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r6, 0
	b _08009392
_0800937A:
	cmp r1, r0
	bcs _08009388
	movs r6, 0x1
	negs r6, r6
	cmp r0, 0xFF
	bne _08009388
	movs r6, 0x1
_08009388:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080093B2
	adds r4, 0x1
	adds r5, 0x1
_08009392:
	adds r0, r4, 0
	bl SkipExtCtrlCode
	adds r4, r0, 0
	adds r0, r5, 0
	bl SkipExtCtrlCode
	adds r5, r0, 0
	ldrb r1, [r4]
	ldrb r0, [r5]
	cmp r1, r0
	bls _0800937A
	movs r6, 0x1
	cmp r1, 0xFF
	bne _080093B2
	subs r6, 0x2
_080093B2:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StringCompareWithoutExtCtrlCodes

	thumb_func_start ConvertInternationalString
ConvertInternationalString: @ 80093BC
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	bne _0800941C
	bl StripExtCtrlCodes
	adds r0, r4, 0
	bl StringLength
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, r2, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	adds r1, r4, r1
	movs r0, 0xFC
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r4, r3
	movs r0, 0x16
	strb r0, [r3]
	adds r0, r2, 0x1
	lsls r0, 24
	adds r2, r4, r2
	movs r1, 0xFF
	strb r1, [r2]
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	b _0800940E
_08009404:
	adds r1, r2, r4
	ldrb r0, [r1]
	strb r0, [r1, 0x2]
	subs r0, r2, 0x1
	lsls r0, 24
_0800940E:
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08009404
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x15
	strb r0, [r4, 0x1]
_0800941C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ConvertInternationalString

	thumb_func_start StripExtCtrlCodes
StripExtCtrlCodes: @ 8009424
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	movs r6, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _08009474
_08009432:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0xFC
	bne _08009454
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, r4
	ldrb r0, [r0]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _0800946C
_08009454:
	adds r2, r6, 0
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	adds r2, r5, r2
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r1, r5, r1
	ldrb r0, [r1]
	strb r0, [r2]
_0800946C:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08009432
_08009474:
	adds r1, r5, r6
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end StripExtCtrlCodes

	.align 2, 0 @ Don't pad with nop.
