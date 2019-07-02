	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8096E18
sub_8096E18: @ 8096E18
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x30
	adds r4, r0, 0
	adds r6, r1, 0
	ldr r0, [sp, 0x4C]
	ldr r1, [sp, 0x50]
	ldr r5, [sp, 0x54]
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	lsls r3, 16
	lsrs r7, r3, 16
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _08096EB4 @ =gUnknown_83D4068
	str r0, [sp, 0x18]
	adds r0, r4, 0
	adds r2, r5, 0
	bl GetMonIconPtr
	str r0, [sp, 0x1C]
	ldr r0, _08096EB8 @ =gUnknown_83D40AC
	str r0, [sp, 0x20]
	ldr r0, _08096EBC @ =gUnknown_83D40E0
	str r0, [sp, 0x24]
	str r6, [sp, 0x28]
	ldr r0, _08096EC0 @ =gUnknown_83D3E80
	adds r0, r4, r0
	ldr r1, _08096EC4 @ =0x0000dac0
	adds r5, r1, 0
	ldrb r0, [r0]
	adds r1, r5, r0
	add r0, sp, 0x2C
	strh r1, [r0]
	add r1, sp, 0x18
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08096E7E
	mov r0, sp
	strh r5, [r0, 0x14]
_08096E7E:
	mov r0, r8
	lsls r1, r0, 16
	asrs r1, 16
	lsls r2, r7, 16
	asrs r2, 16
	mov r0, sp
	mov r3, r9
	bl CreateMonIconSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08096EC8 @ =gSprites
	adds r0, r1
	bl UpdateMonIconFrame
	adds r0, r4, 0
	add sp, 0x30
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08096EB4: .4byte gUnknown_83D4068
_08096EB8: .4byte gUnknown_83D40AC
_08096EBC: .4byte gUnknown_83D40E0
_08096EC0: .4byte gUnknown_83D3E80
_08096EC4: .4byte 0x0000dac0
_08096EC8: .4byte gSprites
	thumb_func_end sub_8096E18

	thumb_func_start sub_8096ECC
sub_8096ECC: @ 8096ECC
	push {r4-r7,lr}
	sub sp, 0x18
	adds r4, r2, 0
	adds r5, r3, 0
	ldr r6, [sp, 0x2C]
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	mov r3, sp
	ldr r2, _08096F44 @ =gUnknown_83D4068
	str r2, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r2, _08096F48 @ =gUnknown_83D40AC
	str r2, [sp, 0x8]
	ldr r2, _08096F4C @ =gUnknown_83D40E0
	str r2, [sp, 0xC]
	str r1, [sp, 0x10]
	ldr r2, _08096F50 @ =gUnknown_83D3E80
	adds r2, r0, r2
	ldr r7, _08096F54 @ =0x0000dac0
	adds r1, r7, 0
	ldrb r2, [r2]
	adds r1, r2
	strh r1, [r3, 0x14]
	ldr r1, [sp, 0x30]
	bl sub_8097028
	str r0, [sp, 0x4]
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl CreateMonIconSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08096F58 @ =gSprites
	adds r0, r1
	bl UpdateMonIconFrame
	adds r0, r4, 0
	add sp, 0x18
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08096F44: .4byte gUnknown_83D4068
_08096F48: .4byte gUnknown_83D40AC
_08096F4C: .4byte gUnknown_83D40E0
_08096F50: .4byte gUnknown_83D3E80
_08096F54: .4byte 0x0000dac0
_08096F58: .4byte gSprites
	thumb_func_end sub_8096ECC

	thumb_func_start mon_icon_convert_unown_species_id
mon_icon_convert_unown_species_id: @ 8096F5C
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xC9
	bne _08096F86
	adds r0, r1, 0
	bl GetUnownLetterByPersonality
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08096F78
	movs r0, 0xC9
	b _08096F82
_08096F78:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08096F82:
	adds r1, r0, 0
	b _08096F92
_08096F86:
	movs r0, 0xCE
	lsls r0, 1
	adds r1, r2, 0
	cmp r1, r0
	bls _08096F92
	movs r1, 0
_08096F92:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end mon_icon_convert_unown_species_id

	thumb_func_start GetUnownLetterByPersonality
GetUnownLetterByPersonality: @ 8096F98
	push {lr}
	adds r2, r0, 0
	cmp r2, 0
	beq _08096FCE
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	b _08096FD0
_08096FCE:
	movs r0, 0
_08096FD0:
	pop {r1}
	bx r1
	thumb_func_end GetUnownLetterByPersonality

	thumb_func_start sub_8096FD4
sub_8096FD4: @ 8096FD4
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	mov r1, sp
	bl MailSpeciesToSpecies
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bne _0809700A
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0
	bne _08096FFA
	mov r1, sp
	adds r0, 0xC9
	b _08097002
_08096FFA:
	mov r1, sp
	movs r2, 0xCE
	lsls r2, 1
	adds r0, r2
_08097002:
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	b _08097020
_0809700A:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08097014
	movs r4, 0
_08097014:
	adds r0, r4, 0
	movs r1, 0
	bl mon_icon_convert_unown_species_id
	lsls r0, 16
	lsrs r0, 16
_08097020:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8096FD4

	thumb_func_start sub_8097028
sub_8097028: @ 8097028
	push {lr}
	adds r3, r1, 0
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08097050 @ =gUnknown_83D37A0
	lsls r1, r0, 2
	adds r1, r2
	ldr r2, [r1]
	movs r1, 0xCD
	lsls r1, 1
	cmp r0, r1
	bne _0809704A
	cmp r3, 0x1
	bne _0809704A
	movs r0, 0x80
	lsls r0, 3
	adds r2, r0
_0809704A:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_08097050: .4byte gUnknown_83D37A0
	thumb_func_end sub_8097028

	thumb_func_start GetMonIconPtr
GetMonIconPtr: @ 8097054
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	bl mon_icon_convert_unown_species_id
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl sub_8097028
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonIconPtr

	thumb_func_start sub_8097070
sub_8097070: @ 8097070
	push {lr}
	bl sub_80973D8
	pop {r0}
	bx r0
	thumb_func_end sub_8097070

	thumb_func_start sub_809707C
sub_809707C: @ 809707C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0809709C @ =gUnknown_83D4038
_08097082:
	lsls r0, r4, 3
	adds r0, r5
	bl LoadSpritePalette
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08097082
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809709C: .4byte gUnknown_83D4038
	thumb_func_end sub_809707C

	thumb_func_start SafeLoadMonIconPalette
SafeLoadMonIconPalette: @ 80970A0
	push {r4,lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bls _080970B0
	movs r1, 0
_080970B0:
	ldr r0, _080970D8 @ =gUnknown_83D3E80
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r1, _080970DC @ =gUnknown_83D4038
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080970D0
	adds r0, r4, 0
	bl LoadSpritePalette
_080970D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080970D8: .4byte gUnknown_83D3E80
_080970DC: .4byte gUnknown_83D4038
	thumb_func_end SafeLoadMonIconPalette

	thumb_func_start sub_80970E0
sub_80970E0: @ 80970E0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0809710C @ =gUnknown_83D3E80
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _08097110 @ =gUnknown_83D4038
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08097106
	adds r0, r4, 0
	bl LoadSpritePalette
_08097106:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809710C: .4byte gUnknown_83D3E80
_08097110: .4byte gUnknown_83D4038
	thumb_func_end sub_80970E0

	thumb_func_start FreeMonIconPalettes
FreeMonIconPalettes: @ 8097114
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08097134 @ =gUnknown_83D4038
_0809711A:
	lsls r0, r4, 3
	adds r0, r5
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0809711A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097134: .4byte gUnknown_83D4038
	thumb_func_end FreeMonIconPalettes

	thumb_func_start sub_8097138
sub_8097138: @ 8097138
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bls _08097148
	movs r1, 0
_08097148:
	ldr r0, _08097160 @ =gUnknown_83D3E80
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r1, _08097164 @ =gUnknown_83D4038
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_08097160: .4byte gUnknown_83D3E80
_08097164: .4byte gUnknown_83D4038
	thumb_func_end sub_8097138

	thumb_func_start sub_8097168
sub_8097168: @ 8097168
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08097184 @ =gUnknown_83D3E80
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _08097188 @ =gUnknown_83D4038
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_08097184: .4byte gUnknown_83D3E80
_08097188: .4byte gUnknown_83D4038
	thumb_func_end sub_8097168

	thumb_func_start sub_809718C
sub_809718C: @ 809718C
	push {lr}
	bl UpdateMonIconFrame
	pop {r0}
	bx r0
	thumb_func_end sub_809718C

	thumb_func_start sub_8097198
sub_8097198: @ 8097198
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xA0
	bhi _080971C0
	ldr r6, _080971C8 @ =gUnknown_83D4038
	movs r5, 0x5
_080971A6:
	ldr r0, [r6]
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, 0x8
	subs r5, 0x1
	cmp r5, 0
	bge _080971A6
_080971C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080971C8: .4byte gUnknown_83D4038
	thumb_func_end sub_8097198

	thumb_func_start sub_80971CC
sub_80971CC: @ 80971CC
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r2, r0
	bls _080971DC
	movs r2, 0
_080971DC:
	ldr r1, _080971F0 @ =gUnknown_83D4038
	ldr r0, _080971F4 @ =gUnknown_83D3E80
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080971F0: .4byte gUnknown_83D4038
_080971F4: .4byte gUnknown_83D3E80
	thumb_func_end sub_80971CC

	thumb_func_start sub_80971F8
sub_80971F8: @ 80971F8
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bls _08097208
	movs r1, 0
_08097208:
	ldr r0, _08097214 @ =gUnknown_83D3E80
	adds r0, r1, r0
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08097214: .4byte gUnknown_83D3E80
	thumb_func_end sub_80971F8

	thumb_func_start sub_8097218
sub_8097218: @ 8097218
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08097224 @ =gUnknown_83D3E80
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08097224: .4byte gUnknown_83D3E80
	thumb_func_end sub_8097218

	thumb_func_start UpdateMonIconFrame
UpdateMonIconFrame: @ 8097228
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	movs r7, 0
	adds r6, r4, 0
	adds r6, 0x2C
	ldrb r2, [r6]
	movs r0, 0x3F
	mov r9, r0
	ands r0, r2
	cmp r0, 0
	bne _080972DC
	movs r1, 0x2A
	adds r1, r4
	mov r8, r1
	ldrb r1, [r1]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r5, r4, 0
	adds r5, 0x2B
	ldrb r0, [r5]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	ldrsh r3, [r0, r1]
	movs r0, 0x2
	negs r0, r0
	cmp r3, r0
	beq _08097272
	adds r0, 0x1
	cmp r3, r0
	bne _08097276
	b _080972F0
_08097272:
	strb r7, [r5]
	b _080972F0
_08097276:
	ldr r2, _080972D4 @ =gUnknown_83D40E8
	ldrb r1, [r4, 0x3]
	lsrs r1, 6
	lsls r1, 1
	ldrb r0, [r4, 0x1]
	lsrs r0, 6
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrh r2, [r1]
	adds r1, r2, 0
	muls r1, r3
	ldr r0, [r4, 0xC]
	adds r0, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r3, _080972D8 @ =0x06010000
	adds r1, r3
	bl RequestSpriteCopy
	mov r0, r8
	ldrb r1, [r0]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r5]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	mov r1, r9
	ands r1, r0
	ldrb r2, [r6]
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldrb r7, [r5]
	b _080972F0
	.align 2, 0
_080972D4: .4byte gUnknown_83D40E8
_080972D8: .4byte 0x06010000
_080972DC:
	lsls r0, r2, 26
	lsrs r0, 26
	subs r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r6]
_080972F0:
	adds r0, r7, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end UpdateMonIconFrame

	thumb_func_start CreateMonIconSprite
CreateMonIconSprite: @ 8097300
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x38
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0
	str r0, [sp, 0x30]
	ldr r2, _080973C8 @ =gUnknown_83D40E8
	mov r0, r9
	ldr r6, [r0]
	ldrb r1, [r6, 0x3]
	lsrs r1, 6
	lsls r1, 1
	ldrb r0, [r6, 0x1]
	lsrs r0, 6
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrh r2, [r1]
	ldr r1, _080973CC @ =0xffff0000
	add r3, sp, 0x30
	ldr r0, [r3, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [r3, 0x4]
	add r1, sp, 0x18
	ldr r0, _080973D0 @ =0x0000ffff
	strh r0, [r1]
	mov r0, r9
	ldrh r2, [r0, 0x14]
	mov r0, sp
	adds r0, 0x1A
	strh r2, [r0]
	str r6, [sp, 0x1C]
	mov r2, r9
	ldr r0, [r2, 0x8]
	str r0, [sp, 0x20]
	str r3, [sp, 0x24]
	ldr r0, [r2, 0xC]
	str r0, [sp, 0x28]
	ldr r0, [r2, 0x10]
	str r0, [sp, 0x2C]
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	mov r3, r8
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _080973D4 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r4, r3, r6
	adds r5, r4, 0
	adds r5, 0x2C
	ldrb r1, [r5]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r5]
	adds r4, 0x3F
	ldrb r2, [r4]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r4]
	adds r6, 0xC
	adds r3, r6
	mov r2, r9
	ldr r1, [r2, 0x4]
	str r1, [r3]
	add sp, 0x38
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080973C8: .4byte gUnknown_83D40E8
_080973CC: .4byte 0xffff0000
_080973D0: .4byte 0x0000ffff
_080973D4: .4byte gSprites
	thumb_func_end CreateMonIconSprite

	thumb_func_start sub_80973D8
sub_80973D8: @ 80973D8
	push {lr}
	sub sp, 0x8
	movs r1, 0
	str r1, [sp]
	ldr r3, _0809740C @ =gUnknown_83D40E8
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r2, 1
	ldrb r1, [r0, 0x1]
	lsrs r1, 6
	lsls r1, 3
	adds r2, r1
	adds r2, r3
	ldrh r3, [r2]
	ldr r2, _08097410 @ =0xffff0000
	ldr r1, [sp, 0x4]
	ands r1, r2
	orrs r1, r3
	str r1, [sp, 0x4]
	mov r1, sp
	str r1, [r0, 0xC]
	bl DestroySprite
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809740C: .4byte gUnknown_83D40E8
_08097410: .4byte 0xffff0000
	thumb_func_end sub_80973D8

	thumb_func_start sub_8097414
sub_8097414: @ 8097414
	mov r12, r0
	adds r0, 0x2A
	movs r3, 0
	strb r1, [r0]
	mov r2, r12
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x40
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r0, r12
	adds r0, 0x2B
	strb r3, [r0]
	bx lr
	thumb_func_end sub_8097414

	.align 2, 0 @ Don't pad with nop.
