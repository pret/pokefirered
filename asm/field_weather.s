	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8079C08
sub_8079C08: @ 8079C08
	push {r4-r6,lr}
	ldr r0, _08079CCC @ =sub_8079E0C
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _08079CC4
	movs r0, 0x90
	lsls r0, 5
	bl AllocSpritePalette
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08079CD0 @ =gUnknown_83C2CE0
	lsls r1, r5, 5
	ldr r2, _08079CD4 @ =gUnknown_20373F8
	adds r1, r2
	ldr r2, _08079CD8 @ =0x04000008
	bl CpuSet
	adds r0, r5, 0
	bl sub_8083598
	bl sub_8079EE8
	ldr r4, _08079CDC @ =gUnknown_2037F34
	ldr r1, _08079CE0 @ =0x000006d5
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, 0x1
	adds r0, r4, r1
	strb r5, [r0]
	adds r1, 0x6
	adds r0, r4, r1
	strb r6, [r0]
	subs r1, 0x2
	adds r0, r4, r1
	strb r6, [r0]
	adds r1, 0x6
	adds r0, r4, r1
	strb r6, [r0]
	adds r1, 0x6
	adds r0, r4, r1
	strb r6, [r0]
	adds r1, 0x1C
	adds r0, r4, r1
	strb r6, [r0]
	subs r1, 0x5
	adds r0, r4, r1
	strb r6, [r0]
	adds r1, 0x29
	adds r0, r4, r1
	strb r6, [r0]
	subs r1, 0xE
	adds r0, r4, r1
	strb r6, [r0]
	adds r1, 0x1
	adds r0, r4, r1
	strb r6, [r0]
	adds r1, 0x17
	adds r0, r4, r1
	strb r6, [r0]
	subs r1, 0x34
	adds r0, r4, r1
	strb r6, [r0]
	movs r0, 0x10
	movs r1, 0
	bl sub_807ADB0
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r4, r1
	strb r6, [r0]
	ldr r0, _08079CE4 @ =0x000006c6
	adds r1, r4, r0
	movs r0, 0x3
	strb r0, [r1]
	movs r1, 0xD9
	lsls r1, 3
	adds r0, r4, r1
	strb r6, [r0]
	ldr r0, _08079CE8 @ =0x000006d3
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _08079CEC @ =sub_8079DBC
	movs r1, 0x50
	bl CreateTask
	ldr r1, _08079CF0 @ =0x000006c9
	adds r4, r1
	strb r0, [r4]
_08079CC4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079CCC: .4byte sub_8079E0C
_08079CD0: .4byte gUnknown_83C2CE0
_08079CD4: .4byte gUnknown_20373F8
_08079CD8: .4byte 0x04000008
_08079CDC: .4byte gUnknown_2037F34
_08079CE0: .4byte 0x000006d5
_08079CE4: .4byte 0x000006c6
_08079CE8: .4byte 0x000006d3
_08079CEC: .4byte sub_8079DBC
_08079CF0: .4byte 0x000006c9
	thumb_func_end sub_8079C08

	thumb_func_start weather_set
weather_set: @ 8079CF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	beq _08079D0A
	cmp r4, 0x5
	beq _08079D0A
	cmp r4, 0xD
	beq _08079D0A
	bl play_some_sound
_08079D0A:
	ldr r1, _08079D4C @ =gUnknown_2037F34
	ldr r2, _08079D50 @ =0x000006d1
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r4
	beq _08079D2E
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _08079D2E
	ldr r0, _08079D54 @ =gUnknown_83C2BC0
	lsls r1, r4, 4
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_08079D2E:
	ldr r1, _08079D4C @ =gUnknown_2037F34
	ldr r2, _08079D58 @ =0x000006d3
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _08079D50 @ =0x000006d1
	adds r0, r1, r3
	strb r4, [r0]
	ldr r0, _08079D5C @ =0x000006ce
	adds r1, r0
	strh r2, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079D4C: .4byte gUnknown_2037F34
_08079D50: .4byte 0x000006d1
_08079D54: .4byte gUnknown_83C2BC0
_08079D58: .4byte 0x000006d3
_08079D5C: .4byte 0x000006ce
	thumb_func_end weather_set

	thumb_func_start sub_8079D60
sub_8079D60: @ 8079D60
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl play_some_sound
	ldr r0, _08079D84 @ =gUnknown_2037F34
	movs r2, 0xDA
	lsls r2, 3
	adds r1, r0, r2
	strb r4, [r1]
	ldr r1, _08079D88 @ =0x000006d1
	adds r0, r1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079D84: .4byte gUnknown_2037F34
_08079D88: .4byte 0x000006d1
	thumb_func_end sub_8079D60

	thumb_func_start sub_8079D8C
sub_8079D8C: @ 8079D8C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl play_some_sound
	ldr r1, _08079DB8 @ =gUnknown_2037F34
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r1, r2
	strb r4, [r0]
	adds r2, 0x1
	adds r0, r1, r2
	strb r4, [r0]
	movs r0, 0xD9
	lsls r0, 3
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079DB8: .4byte gUnknown_2037F34
	thumb_func_end sub_8079D8C

	thumb_func_start sub_8079DBC
sub_8079DBC: @ 8079DBC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _08079DFC @ =gUnknown_2037F34
	movs r1, 0xD9
	lsls r1, 3
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08079DF4
	ldr r1, _08079E00 @ =gUnknown_83C2BC0
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 4
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _08079E04 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08079E08 @ =sub_8079E0C
	str r1, [r0]
_08079DF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079DFC: .4byte gUnknown_2037F34
_08079E00: .4byte gUnknown_83C2BC0
_08079E04: .4byte gUnknown_3005090
_08079E08: .4byte sub_8079E0C
	thumb_func_end sub_8079DBC

	thumb_func_start sub_8079E0C
sub_8079E0C: @ 8079E0C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _08079E68 @ =gUnknown_2037F34
	movs r0, 0xDA
	lsls r0, 3
	adds r6, r5, r0
	ldr r1, _08079E6C @ =0x000006d1
	adds r7, r5, r1
	ldrb r0, [r6]
	ldrb r2, [r7]
	cmp r0, r2
	beq _08079E80
	ldr r0, _08079E70 @ =gUnknown_83C2BC0
	mov r8, r0
	ldrb r0, [r6]
	lsls r0, 4
	mov r1, r8
	adds r1, 0xC
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08079E90
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r8
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _08079E74 @ =0x000006c3
	adds r0, r5, r1
	strb r4, [r0]
	ldr r2, _08079E78 @ =0x000006c6
	adds r0, r5, r2
	strb r4, [r0]
	ldrb r0, [r7]
	strb r0, [r6]
	ldr r0, _08079E7C @ =0x000006d3
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
	b _08079E90
	.align 2, 0
_08079E68: .4byte gUnknown_2037F34
_08079E6C: .4byte 0x000006d1
_08079E70: .4byte gUnknown_83C2BC0
_08079E74: .4byte 0x000006c3
_08079E78: .4byte 0x000006c6
_08079E7C: .4byte 0x000006d3
_08079E80:
	ldr r0, _08079EB0 @ =gUnknown_83C2BC0
	ldrb r1, [r6]
	lsls r1, 4
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_08079E90:
	ldr r1, _08079EB4 @ =gUnknown_83C2CB0
	ldr r0, _08079EB8 @ =gUnknown_2037F34
	ldr r2, _08079EBC @ =0x000006c6
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079EB0: .4byte gUnknown_83C2BC0
_08079EB4: .4byte gUnknown_83C2CB0
_08079EB8: .4byte gUnknown_2037F34
_08079EBC: .4byte 0x000006c6
	thumb_func_end sub_8079E0C

	thumb_func_start sub_8079EC0
sub_8079EC0: @ 8079EC0
	ldr r0, _08079ED4 @ =gUnknown_2037F34
	ldr r2, _08079ED8 @ =0x000006c1
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _08079EDC @ =0x000006c2
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_08079ED4: .4byte gUnknown_2037F34
_08079ED8: .4byte 0x000006c1
_08079EDC: .4byte 0x000006c2
	thumb_func_end sub_8079EC0

	thumb_func_start nullsub_45
nullsub_45: @ 8079EE0
	bx lr
	thumb_func_end nullsub_45

	thumb_func_start sub_8079EE4
sub_8079EE4: @ 8079EE4
	movs r0, 0
	bx lr
	thumb_func_end sub_8079EE4

	thumb_func_start sub_8079EE8
sub_8079EE8: @ 8079EE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _08079F28 @ =gUnknown_20386A4
	ldr r0, _08079F2C @ =gUnknown_83C2CC0
	str r0, [r1]
	movs r0, 0
	mov r12, r0
	ldr r1, _08079F30 @ =gUnknown_2038394
	mov r10, r1
_08079F00:
	mov r7, r10
	mov r0, r12
	cmp r0, 0
	bne _08079F0C
	ldr r1, _08079F34 @ =0xfffffda0
	adds r7, r1
_08079F0C:
	movs r5, 0
	movs r0, 0x1
	add r0, r12
	mov r9, r0
_08079F14:
	lsls r1, r5, 8
	lsls r0, r5, 24
	lsrs r2, r0, 16
	mov r0, r12
	cmp r0, 0
	bne _08079F38
	adds r0, r1, 0
	lsls r0, 12
	lsrs r4, r0, 16
	b _08079F3A
	.align 2, 0
_08079F28: .4byte gUnknown_20386A4
_08079F2C: .4byte gUnknown_83C2CC0
_08079F30: .4byte gUnknown_2038394
_08079F34: .4byte 0xfffffda0
_08079F38:
	movs r4, 0
_08079F3A:
	movs r3, 0
	adds r1, r5, 0x1
	mov r8, r1
_08079F40:
	subs r1, r2, r4
	lsls r1, 16
	lsrs r2, r1, 16
	lsls r0, r3, 5
	adds r0, r7
	adds r0, r5
	lsrs r1, 24
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x2
	bls _08079F40
	adds r6, r2, 0
	movs r0, 0xF8
	lsls r0, 5
	subs r0, r2
	cmp r0, 0
	bge _08079F68
	adds r0, 0xF
_08079F68:
	lsls r0, 12
	lsrs r4, r0, 16
	cmp r5, 0xB
	bhi _08079FB2
	cmp r3, 0x12
	bhi _08079FD8
_08079F74:
	adds r0, r2, r4
	lsls r0, 16
	lsrs r2, r0, 16
	subs r0, r2, r6
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	ble _08079F90
	lsrs r0, 31
	adds r0, r1, r0
	asrs r0, 1
	subs r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
_08079F90:
	lsls r0, r3, 5
	adds r0, r7
	adds r1, r0, r5
	lsrs r0, r2, 8
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08079FA6
	movs r0, 0x1F
	strb r0, [r1]
_08079FA6:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x12
	bls _08079F74
	b _08079FD8
_08079FB2:
	cmp r3, 0x12
	bhi _08079FD8
	movs r6, 0x1F
_08079FB8:
	adds r1, r2, r4
	lsls r1, 16
	lsrs r2, r1, 16
	lsls r0, r3, 5
	adds r0, r7
	adds r0, r5
	lsrs r1, 24
	strb r1, [r0]
	cmp r1, 0x1F
	bls _08079FCE
	strb r6, [r0]
_08079FCE:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x12
	bls _08079FB8
_08079FD8:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r5, r0, 16
	cmp r5, 0x1F
	bls _08079F14
	mov r1, r9
	lsls r0, r1, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x1
	bls _08079F00
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8079EE8

	thumb_func_start sub_8079FFC
sub_8079FFC: @ 8079FFC
	push {r4-r7,lr}
	ldr r0, _0807A028 @ =gUnknown_2037F34
	movs r1, 0xD8
	lsls r1, 3
	adds r4, r0, r1
	ldr r2, _0807A02C @ =0x000006c1
	adds r1, r0, r2
	ldrb r7, [r4]
	mov r12, r7
	movs r6, 0
	ldrsb r6, [r4, r6]
	movs r5, 0
	ldrsb r5, [r1, r5]
	adds r3, r0, 0
	cmp r6, r5
	bne _0807A034
	ldr r0, _0807A030 @ =0x000006c6
	adds r1, r3, r0
	movs r0, 0x3
	strb r0, [r1]
	b _0807A07C
	.align 2, 0
_0807A028: .4byte gUnknown_2037F34
_0807A02C: .4byte 0x000006c1
_0807A030: .4byte 0x000006c6
_0807A034:
	ldr r1, _0807A05C @ =0x000006c3
	adds r2, r3, r1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r7, _0807A060 @ =0x000006c2
	adds r1, r3, r7
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0807A07C
	movs r0, 0
	strb r0, [r2]
	mov r0, r12
	cmp r6, r5
	bge _0807A064
	adds r0, 0x1
	b _0807A068
	.align 2, 0
_0807A05C: .4byte 0x000006c3
_0807A060: .4byte 0x000006c2
_0807A064:
	mov r0, r12
	subs r0, 0x1
_0807A068:
	strb r0, [r4]
	movs r1, 0xD8
	lsls r1, 3
	adds r0, r3, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r0, 0
	movs r1, 0x20
	bl sub_807A294
_0807A07C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8079FFC

	thumb_func_start sub_807A084
sub_807A084: @ 807A084
	push {lr}
	ldr r2, _0807A0BC @ =gUnknown_2037F34
	ldr r0, _0807A0C0 @ =0x000006cb
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0807A0A2
	ldr r3, _0807A0C4 @ =0x000006ca
	adds r1, r2, r3
	movs r0, 0
	strb r0, [r1]
_0807A0A2:
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x3
	cmp r0, 0xA
	bhi _0807A16C
	lsls r0, 2
	ldr r1, _0807A0C8 @ =_0807A0CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A0BC: .4byte gUnknown_2037F34
_0807A0C0: .4byte 0x000006cb
_0807A0C4: .4byte 0x000006ca
_0807A0C8: .4byte _0807A0CC
	.align 2, 0
_0807A0CC:
	.4byte _0807A0F8
	.4byte _0807A0F8
	.4byte _0807A0F8
	.4byte _0807A144
	.4byte _0807A16C
	.4byte _0807A16C
	.4byte _0807A16C
	.4byte _0807A16C
	.4byte _0807A0F8
	.4byte _0807A120
	.4byte _0807A0F8
_0807A0F8:
	bl sub_807A19C
	lsls r0, 24
	cmp r0, 0
	bne _0807A18C
	ldr r0, _0807A118 @ =gUnknown_2037F34
	movs r2, 0xD8
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0x3
	strb r2, [r1]
	ldr r3, _0807A11C @ =0x000006c6
	adds r0, r3
	strb r2, [r0]
	b _0807A18C
	.align 2, 0
_0807A118: .4byte gUnknown_2037F34
_0807A11C: .4byte 0x000006c6
_0807A120:
	bl sub_807A1FC
	lsls r0, 24
	cmp r0, 0
	bne _0807A18C
	ldr r1, _0807A13C @ =gUnknown_2037F34
	movs r0, 0xD8
	lsls r0, 3
	adds r2, r1, r0
	movs r0, 0xFA
	strb r0, [r2]
	ldr r2, _0807A140 @ =0x000006c6
	adds r1, r2
	b _0807A188
	.align 2, 0
_0807A13C: .4byte gUnknown_2037F34
_0807A140: .4byte 0x000006c6
_0807A144:
	bl sub_807A254
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0807A18C
	ldr r0, _0807A164 @ =gUnknown_2037F34
	movs r3, 0xD8
	lsls r3, 3
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0807A168 @ =0x000006c6
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	b _0807A18C
	.align 2, 0
_0807A164: .4byte gUnknown_2037F34
_0807A168: .4byte 0x000006c6
_0807A16C:
	ldr r0, _0807A190 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0807A18C
	ldr r3, _0807A194 @ =0x000006c1
	adds r0, r2, r3
	ldrb r1, [r0]
	subs r3, 0x1
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0807A198 @ =0x000006c6
	adds r1, r2, r0
_0807A188:
	movs r0, 0x3
	strb r0, [r1]
_0807A18C:
	pop {r0}
	bx r0
	.align 2, 0
_0807A190: .4byte gUnknown_2037AB8
_0807A194: .4byte 0x000006c1
_0807A198: .4byte 0x000006c6
	thumb_func_end sub_807A084

	thumb_func_start sub_807A19C
sub_807A19C: @ 807A19C
	push {r4,lr}
	sub sp, 0x4
	ldr r2, _0807A1D8 @ =gUnknown_2037F34
	ldr r0, _0807A1DC @ =0x000006c7
	adds r4, r2, r0
	ldrb r0, [r4]
	cmp r0, 0x10
	beq _0807A1F2
	adds r1, r0, 0x1
	strb r1, [r4]
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _0807A1E4
	movs r3, 0x10
	subs r3, r1
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _0807A1E0 @ =0x000006c4
	adds r0, r2, r1
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, 0
	movs r1, 0x20
	movs r2, 0x3
	bl sub_807A3D0
	movs r0, 0x1
	b _0807A1F4
	.align 2, 0
_0807A1D8: .4byte gUnknown_2037F34
_0807A1DC: .4byte 0x000006c7
_0807A1E0: .4byte 0x000006c4
_0807A1E4:
	movs r0, 0
	movs r1, 0x20
	movs r2, 0x3
	bl sub_807A294
	movs r0, 0x10
	strb r0, [r4]
_0807A1F2:
	movs r0, 0
_0807A1F4:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807A19C

	thumb_func_start sub_807A1FC
sub_807A1FC: @ 807A1FC
	push {r4,lr}
	ldr r2, _0807A230 @ =gUnknown_2037F34
	ldr r0, _0807A234 @ =0x000006c7
	adds r4, r2, r0
	ldrb r0, [r4]
	cmp r0, 0x10
	beq _0807A24C
	adds r3, r0, 0x1
	strb r3, [r4]
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _0807A23C
	movs r0, 0x6
	negs r0, r0
	movs r1, 0x10
	subs r1, r3
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807A238 @ =0x000006c4
	adds r2, r3
	ldrh r2, [r2]
	bl sub_807A518
	movs r0, 0x1
	b _0807A24E
	.align 2, 0
_0807A230: .4byte gUnknown_2037F34
_0807A234: .4byte 0x000006c7
_0807A238: .4byte 0x000006c4
_0807A23C:
	movs r2, 0x6
	negs r2, r2
	movs r0, 0
	movs r1, 0x20
	bl sub_807A294
	movs r0, 0x10
	strb r0, [r4]
_0807A24C:
	movs r0, 0
_0807A24E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807A1FC

	thumb_func_start sub_807A254
sub_807A254: @ 807A254
	push {lr}
	ldr r2, _0807A27C @ =gUnknown_2037F34
	ldr r1, _0807A280 @ =0x000006c7
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, 0x10
	beq _0807A288
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0807A284 @ =0x000006c4
	adds r1, r2, r3
	ldrh r1, [r1]
	bl sub_807A5F8
	movs r0, 0x1
	b _0807A28A
	.align 2, 0
_0807A27C: .4byte gUnknown_2037F34
_0807A280: .4byte 0x000006c7
_0807A284: .4byte 0x000006c4
_0807A288:
	movs r0, 0
_0807A28A:
	pop {r1}
	bx r1
	thumb_func_end sub_807A254

	thumb_func_start nullsub_46
nullsub_46: @ 807A290
	bx lr
	thumb_func_end nullsub_46

	thumb_func_start sub_807A294
sub_807A294: @ 807A294
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	asrs r0, r2, 24
	cmp r0, 0
	ble _0807A3A0
	subs r0, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r6, r3, 4
	adds r0, r1, r3
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r4, r9
	bcs _0807A3B6
	lsls r0, r2, 24
	asrs r0, 19
	str r0, [sp]
_0807A2CE:
	ldr r0, _0807A300 @ =gUnknown_20386A4
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807A30C
	lsls r1, r6, 1
	ldr r0, _0807A304 @ =gUnknown_20371F8
	adds r0, r1, r0
	ldr r2, _0807A308 @ =gUnknown_20375F8
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r9
	lsls r0, 16
	mov r8, r0
	adds r4, 0x1
	mov r12, r4
	b _0807A38A
	.align 2, 0
_0807A300: .4byte gUnknown_20386A4
_0807A304: .4byte gUnknown_20371F8
_0807A308: .4byte gUnknown_20375F8
_0807A30C:
	cmp r0, 0x2
	beq _0807A320
	adds r1, r4, 0
	subs r1, 0x10
	ldr r2, _0807A324 @ =gUnknown_2037F34
	ldr r3, _0807A328 @ =0x000006d5
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807A330
_0807A320:
	ldr r0, _0807A32C @ =gUnknown_2038394
	b _0807A336
	.align 2, 0
_0807A324: .4byte gUnknown_2037F34
_0807A328: .4byte 0x000006d5
_0807A32C: .4byte gUnknown_2038394
_0807A330:
	movs r3, 0x80
	lsls r3, 2
	adds r0, r2, r3
_0807A336:
	ldr r1, [sp]
	adds r5, r1, r0
	movs r7, 0
	mov r3, r9
	lsls r3, 16
	mov r8, r3
	adds r4, 0x1
	mov r12, r4
	ldr r0, _0807A398 @ =gUnknown_20375F8
	mov r10, r0
_0807A34A:
	adds r2, r6, 0
	lsls r0, r2, 1
	ldr r1, _0807A39C @ =gUnknown_20371F8
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r4, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r5, r1
	ldrb r1, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r2, 1
	add r2, r10
	lsls r1, 10
	lsls r3, 5
	orrs r1, r3
	orrs r1, r4
	strh r1, [r2]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807A34A
_0807A38A:
	mov r3, r12
	lsls r0, r3, 16
	lsrs r4, r0, 16
	cmp r0, r8
	bcc _0807A2CE
	b _0807A3B6
	.align 2, 0
_0807A398: .4byte gUnknown_20375F8
_0807A39C: .4byte gUnknown_20371F8
_0807A3A0:
	cmp r0, 0
	blt _0807A3B6
	lsls r1, r4, 5
	ldr r0, _0807A3C8 @ =gUnknown_20371F8
	adds r0, r1, r0
	ldr r2, _0807A3CC @ =gUnknown_20375F8
	adds r1, r2
	mov r3, r9
	lsls r2, r3, 3
	bl CpuFastSet
_0807A3B6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A3C8: .4byte gUnknown_20371F8
_0807A3CC: .4byte gUnknown_20375F8
	thumb_func_end sub_807A294

	thumb_func_start sub_807A3D0
sub_807A3D0: @ 807A3D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r4, [sp, 0x34]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	mov r1, sp
	strh r4, [r1]
	ldr r1, [sp]
	lsls r3, r1, 27
	lsrs r3, 27
	str r3, [sp, 0x4]
	lsls r3, r1, 22
	lsrs r3, 27
	str r3, [sp, 0x8]
	lsls r1, 17
	lsrs r1, 27
	str r1, [sp, 0xC]
	lsls r6, r0, 4
	mov r3, r10
	adds r1, r3, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r2, r1
	lsrs r2, 24
	adds r4, r0, 0
	cmp r4, r10
	bcs _0807A4FC
	lsls r0, r2, 24
	asrs r0, 19
	str r0, [sp, 0x10]
_0807A428:
	ldr r0, _0807A458 @ =gUnknown_20386A4
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807A45C
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r6, 0
	movs r1, 0x10
	mov r2, r8
	bl BlendPalette
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	mov r3, r10
	lsls r3, 16
	mov r9, r3
	adds r4, 0x1
	mov r12, r4
	b _0807A4F2
	.align 2, 0
_0807A458: .4byte gUnknown_20386A4
_0807A45C:
	cmp r0, 0x1
	bne _0807A46C
	ldr r0, _0807A468 @ =gUnknown_2038134
	ldr r1, [sp, 0x10]
	adds r5, r1, r0
	b _0807A472
	.align 2, 0
_0807A468: .4byte gUnknown_2038134
_0807A46C:
	ldr r0, _0807A50C @ =gUnknown_2038394
	ldr r3, [sp, 0x10]
	adds r5, r3, r0
_0807A472:
	movs r7, 0
	mov r0, r10
	lsls r0, 16
	mov r9, r0
	adds r4, 0x1
	mov r12, r4
_0807A47E:
	adds r4, r6, 0
	lsls r0, r4, 1
	ldr r1, _0807A510 @ =gUnknown_20371F8
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r2, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r5, r1
	ldrb r1, [r1]
	ldr r6, [sp, 0x4]
	subs r0, r6, r3
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldr r6, [sp, 0x8]
	subs r0, r6, r2
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	ldr r6, [sp, 0xC]
	subs r0, r6, r1
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r1, r0
	lsls r1, 24
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r4, 1
	ldr r0, _0807A514 @ =gUnknown_20375F8
	adds r4, r0
	lsrs r1, 14
	lsrs r2, 19
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807A47E
_0807A4F2:
	mov r1, r12
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r0, r9
	bcc _0807A428
_0807A4FC:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A50C: .4byte gUnknown_2038394
_0807A510: .4byte gUnknown_20371F8
_0807A514: .4byte gUnknown_20375F8
	thumb_func_end sub_807A3D0

	thumb_func_start sub_807A518
sub_807A518: @ 807A518
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r1, 24
	lsrs r6, r1, 24
	mov r0, sp
	strh r2, [r0]
	ldr r0, [sp]
	lsls r1, r0, 27
	lsrs r1, 27
	str r1, [sp, 0x4]
	lsls r1, r0, 22
	lsrs r1, 27
	mov r10, r1
	lsls r0, 17
	lsrs r0, 27
	mov r8, r0
	movs r5, 0
	movs r4, 0
_0807A544:
	ldr r0, _0807A56C @ =gUnknown_20386A4
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807A570
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r5, 0
	movs r1, 0x10
	adds r2, r6, 0
	bl BlendPalette
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	mov r12, r4
	b _0807A5D4
	.align 2, 0
_0807A56C: .4byte gUnknown_20386A4
_0807A570:
	movs r7, 0
	adds r4, 0x1
	mov r12, r4
	ldr r0, _0807A5F0 @ =gUnknown_20375F8
	mov r9, r0
_0807A57A:
	adds r4, r5, 0
	lsls r0, r4, 1
	ldr r1, _0807A5F4 @ =gUnknown_20371F8
	adds r0, r1
	ldr r1, [r0]
	lsls r3, r1, 27
	lsrs r3, 27
	lsls r2, r1, 22
	lsrs r2, 27
	lsls r1, 17
	lsrs r1, 27
	ldr r5, [sp, 0x4]
	subs r0, r5, r3
	muls r0, r6
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	mov r5, r10
	subs r0, r5, r2
	muls r0, r6
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	mov r5, r8
	subs r0, r5, r1
	muls r0, r6
	asrs r0, 4
	adds r1, r0
	lsls r1, 24
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r4, 1
	add r4, r9
	lsrs r1, 14
	lsrs r2, 19
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807A57A
_0807A5D4:
	mov r1, r12
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0807A544
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A5F0: .4byte gUnknown_20375F8
_0807A5F4: .4byte gUnknown_20371F8
	thumb_func_end sub_807A518

	thumb_func_start sub_807A5F8
sub_807A5F8: @ 807A5F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r3, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r3, 16
	lsrs r3, 16
	mov r0, sp
	strh r3, [r0]
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0
	adds r2, r7, 0
	bl BlendPalette
	ldr r0, [sp]
	lsls r1, r0, 27
	lsrs r1, 27
	str r1, [sp, 0x4]
	lsls r1, r0, 22
	lsrs r1, 27
	str r1, [sp, 0x8]
	lsls r0, 17
	lsrs r0, 27
	mov r10, r0
	movs r4, 0x10
_0807A634:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807A748
	lsls r0, 24
	cmp r0, 0
	beq _0807A6E4
	adds r0, r4, 0x1
	lsls r1, r0, 20
	lsrs r1, 16
	mov r12, r1
	lsls r1, r4, 20
	lsrs r6, r1, 16
	mov r9, r0
	cmp r6, r12
	bcs _0807A6F8
	movs r0, 0x1C
	mov r8, r0
_0807A658:
	lsls r5, r6, 1
	ldr r0, _0807A6DC @ =gUnknown_20371F8
	adds r0, r5, r0
	ldr r2, [r0]
	lsls r4, r2, 27
	lsrs r4, 27
	lsls r3, r2, 22
	lsrs r3, 27
	lsls r2, 17
	lsrs r2, 27
	mov r0, r8
	subs r1, r0, r4
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x1F
	subs r1, r3
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	subs r1, r0, r2
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [sp, 0x4]
	subs r0, r1, r4
	muls r0, r7
	asrs r0, 4
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, [sp, 0x8]
	subs r0, r1, r3
	muls r0, r7
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	mov r1, r10
	subs r0, r1, r2
	muls r0, r7
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	ldr r0, _0807A6E0 @ =gUnknown_20375F8
	adds r5, r0
	lsrs r2, 14
	lsrs r3, 19
	orrs r2, r3
	orrs r2, r4
	strh r2, [r5]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r12
	bcc _0807A658
	b _0807A6F8
	.align 2, 0
_0807A6DC: .4byte gUnknown_20371F8
_0807A6E0: .4byte gUnknown_20375F8
_0807A6E4:
	lsls r0, r4, 20
	lsrs r0, 16
	mov r1, sp
	ldrh r3, [r1]
	movs r1, 0x10
	adds r2, r7, 0
	bl BlendPalette
	adds r4, 0x1
	mov r9, r4
_0807A6F8:
	mov r1, r9
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0807A634
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807A5F8

	thumb_func_start sub_807A714
sub_807A714: @ 807A714
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _0807A73C @ =gUnknown_2037F34
	ldr r0, _0807A740 @ =0x000006fa
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _0807A736
	ldr r4, _0807A744 @ =0x000006f4
	adds r0, r3, r4
	ldrb r3, [r1]
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0807A736:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A73C: .4byte gUnknown_2037F34
_0807A740: .4byte 0x000006fa
_0807A744: .4byte 0x000006f4
	thumb_func_end sub_807A714

	thumb_func_start sub_807A748
sub_807A748: @ 807A748
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r2, _0807A770 @ =gUnknown_2037F34
	ldr r4, _0807A774 @ =0x000006fa
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0807A786
	ldr r5, _0807A778 @ =0x000006f4
	adds r4, r2, r5
	adds r2, r0, 0
_0807A762:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _0807A77C
	movs r0, 0x1
	b _0807A788
	.align 2, 0
_0807A770: .4byte gUnknown_2037F34
_0807A774: .4byte 0x000006fa
_0807A778: .4byte 0x000006f4
_0807A77C:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bcc _0807A762
_0807A786:
	movs r0, 0
_0807A788:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807A748

	thumb_func_start sub_807A790
sub_807A790: @ 807A790
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0807A7BC @ =gUnknown_2037F34
	ldr r1, _0807A7C0 @ =0x000006c6
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0807A7B6
	lsls r2, r4, 24
	asrs r2, 24
	movs r0, 0
	movs r1, 0x20
	bl sub_807A294
	movs r1, 0xD8
	lsls r1, 3
	adds r0, r5, r1
	strb r4, [r0]
_0807A7B6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A7BC: .4byte gUnknown_2037F34
_0807A7C0: .4byte 0x000006c6
	thumb_func_end sub_807A790

	thumb_func_start sub_807A7C4
sub_807A7C4: @ 807A7C4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r3, _0807A80C @ =gUnknown_2037F34
	ldr r0, _0807A810 @ =0x000006c6
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0807A804
	movs r1, 0
	strb r1, [r2]
	movs r2, 0xD8
	lsls r2, 3
	adds r0, r3, r2
	strb r4, [r0]
	adds r2, 0x1
	adds r0, r3, r2
	strb r5, [r0]
	adds r2, 0x2
	adds r0, r3, r2
	strb r1, [r0]
	ldr r1, _0807A814 @ =0x000006c2
	adds r0, r3, r1
	strb r6, [r0]
	lsls r0, r4, 24
	asrs r0, 24
	bl sub_807A790
_0807A804:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A80C: .4byte gUnknown_2037F34
_0807A810: .4byte 0x000006c6
_0807A814: .4byte 0x000006c2
	thumb_func_end sub_807A7C4

	thumb_func_start fade_screen
fade_screen: @ 807A818
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x1
	beq _0807A850
	cmp r0, 0x1
	bgt _0807A834
	cmp r0, 0
	beq _0807A83E
	b _0807A92C
_0807A834:
	cmp r2, 0x2
	beq _0807A844
	cmp r2, 0x3
	beq _0807A854
	b _0807A92C
_0807A83E:
	movs r4, 0
	movs r1, 0
	b _0807A858
_0807A844:
	ldr r4, _0807A84C @ =0x0000ffff
	movs r1, 0
	b _0807A858
	.align 2, 0
_0807A84C: .4byte 0x0000ffff
_0807A850:
	movs r4, 0
	b _0807A856
_0807A854:
	ldr r4, _0807A878 @ =0x0000ffff
_0807A856:
	movs r1, 0x1
_0807A858:
	ldr r0, _0807A87C @ =gUnknown_2037F34
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	blt _0807A880
	cmp r0, 0x6
	ble _0807A872
	cmp r0, 0xD
	bgt _0807A880
	cmp r0, 0xB
	blt _0807A880
_0807A872:
	movs r2, 0x1
	b _0807A882
	.align 2, 0
_0807A878: .4byte 0x0000ffff
_0807A87C: .4byte gUnknown_2037F34
_0807A880:
	movs r2, 0
_0807A882:
	cmp r1, 0
	beq _0807A8C4
	cmp r2, 0
	beq _0807A896
	ldr r0, _0807A8B4 @ =gUnknown_20375F8
	ldr r1, _0807A8B8 @ =gUnknown_20371F8
	movs r2, 0x80
	lsls r2, 1
	bl CpuFastSet
_0807A896:
	movs r0, 0x1
	negs r0, r0
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807A8BC @ =gUnknown_2037F34
	ldr r3, _0807A8C0 @ =0x000006c6
	adds r0, r3
	movs r1, 0x2
	strb r1, [r0]
	b _0807A92C
	.align 2, 0
_0807A8B4: .4byte gUnknown_20375F8
_0807A8B8: .4byte gUnknown_20371F8
_0807A8BC: .4byte gUnknown_2037F34
_0807A8C0: .4byte 0x000006c6
_0807A8C4:
	ldr r1, _0807A8DC @ =gUnknown_2037F34
	ldr r3, _0807A8E0 @ =0x000006c4
	adds r0, r1, r3
	strh r4, [r0]
	cmp r2, 0
	beq _0807A8E8
	ldr r0, _0807A8E4 @ =0x000006c7
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	b _0807A8FA
	.align 2, 0
_0807A8DC: .4byte gUnknown_2037F34
_0807A8E0: .4byte 0x000006c4
_0807A8E4: .4byte 0x000006c7
_0807A8E8:
	movs r0, 0x1
	negs r0, r0
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0807A8FA:
	ldr r4, _0807A934 @ =gUnknown_2037F34
	ldr r1, _0807A938 @ =0x000006c6
	adds r0, r4, r1
	movs r1, 0
	movs r5, 0x1
	strb r5, [r0]
	ldr r2, _0807A93C @ =0x000006ca
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _0807A940 @ =0x000006cb
	adds r0, r4, r3
	strb r1, [r0]
	movs r1, 0xE6
	lsls r1, 3
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r2, 0x68
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_807ADB0
	movs r3, 0xD9
	lsls r3, 3
	adds r4, r3
	strb r5, [r4]
_0807A92C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A934: .4byte gUnknown_2037F34
_0807A938: .4byte 0x000006c6
_0807A93C: .4byte 0x000006ca
_0807A940: .4byte 0x000006cb
	thumb_func_end fade_screen

	thumb_func_start sub_807A944
sub_807A944: @ 807A944
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x1
	beq _0807A97C
	cmp r0, 0x1
	bgt _0807A962
	cmp r0, 0
	beq _0807A96C
	b _0807AA56
_0807A962:
	cmp r2, 0x2
	beq _0807A972
	cmp r2, 0x3
	beq _0807A980
	b _0807AA56
_0807A96C:
	movs r4, 0
	movs r1, 0
	b _0807A984
_0807A972:
	ldr r4, _0807A978 @ =0x0000ffff
	movs r1, 0
	b _0807A984
	.align 2, 0
_0807A978: .4byte 0x0000ffff
_0807A97C:
	movs r4, 0
	b _0807A982
_0807A980:
	ldr r4, _0807A9A4 @ =0x0000ffff
_0807A982:
	movs r1, 0x1
_0807A984:
	ldr r0, _0807A9A8 @ =gUnknown_2037F34
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	blt _0807A9AC
	cmp r0, 0x6
	ble _0807A99E
	cmp r0, 0xD
	bgt _0807A9AC
	cmp r0, 0xB
	blt _0807A9AC
_0807A99E:
	movs r2, 0x1
	b _0807A9AE
	.align 2, 0
_0807A9A4: .4byte 0x0000ffff
_0807A9A8: .4byte gUnknown_2037F34
_0807A9AC:
	movs r2, 0
_0807A9AE:
	cmp r1, 0
	beq _0807A9F0
	cmp r2, 0
	beq _0807A9C2
	ldr r0, _0807A9E0 @ =gUnknown_20375F8
	ldr r1, _0807A9E4 @ =gUnknown_20371F8
	movs r2, 0x80
	lsls r2, 1
	bl CpuFastSet
_0807A9C2:
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807A9E8 @ =gUnknown_2037F34
	ldr r3, _0807A9EC @ =0x000006c6
	adds r0, r3
	movs r1, 0x2
	strb r1, [r0]
	b _0807AA56
	.align 2, 0
_0807A9E0: .4byte gUnknown_20375F8
_0807A9E4: .4byte gUnknown_20371F8
_0807A9E8: .4byte gUnknown_2037F34
_0807A9EC: .4byte 0x000006c6
_0807A9F0:
	ldr r1, _0807AA08 @ =gUnknown_2037F34
	ldr r3, _0807AA0C @ =0x000006c4
	adds r0, r1, r3
	strh r4, [r0]
	cmp r2, 0
	beq _0807AA14
	ldr r0, _0807AA10 @ =0x000006c7
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	b _0807AA24
	.align 2, 0
_0807AA08: .4byte gUnknown_2037F34
_0807AA0C: .4byte 0x000006c4
_0807AA10: .4byte 0x000006c7
_0807AA14:
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0807AA24:
	ldr r4, _0807AA60 @ =gUnknown_2037F34
	ldr r1, _0807AA64 @ =0x000006c6
	adds r0, r4, r1
	movs r1, 0
	movs r5, 0x1
	strb r5, [r0]
	ldr r2, _0807AA68 @ =0x000006ca
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _0807AA6C @ =0x000006cb
	adds r0, r4, r3
	strb r1, [r0]
	movs r1, 0xE6
	lsls r1, 3
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r2, 0x68
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_807ADB0
	movs r3, 0xD9
	lsls r3, 3
	adds r4, r3
	strb r5, [r4]
_0807AA56:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807AA60: .4byte gUnknown_2037F34
_0807AA64: .4byte 0x000006c6
_0807AA68: .4byte 0x000006ca
_0807AA6C: .4byte 0x000006cb
	thumb_func_end sub_807A944

	thumb_func_start sub_807AA70
sub_807AA70: @ 807AA70
	ldr r0, _0807AA84 @ =gUnknown_2037F34
	ldr r1, _0807AA88 @ =0x000006c6
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	.align 2, 0
_0807AA84: .4byte gUnknown_2037F34
_0807AA88: .4byte 0x000006c6
	thumb_func_end sub_807AA70

	thumb_func_start sub_807AA8C
sub_807AA8C: @ 807AA8C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
	ldr r5, _0807AACC @ =gUnknown_2037F34
	ldr r2, _0807AAD0 @ =0x000006c6
	adds r0, r5, r2
	ldrb r0, [r0]
	adds r1, r5, 0
	cmp r0, 0x1
	beq _0807AAD4
	cmp r0, 0x2
	beq _0807AB20
	adds r2, 0xA
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _0807AB58
	lsls r0, r4, 24
	lsrs r0, 24
	subs r2, 0x10
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x1
	bl sub_807A294
	b _0807AB68
	.align 2, 0
_0807AACC: .4byte gUnknown_2037F34
_0807AAD0: .4byte 0x000006c6
_0807AAD4:
	ldr r2, _0807AB14 @ =0x000006ca
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807AB68
	adds r2, 0x6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _0807AAF0
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807A714
_0807AAF0:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	movs r2, 0
	ldr r6, _0807AB18 @ =gUnknown_20375F8
	ldr r0, _0807AB1C @ =0x000006c4
	adds r3, r5, r0
_0807AAFC:
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0807AAFC
	b _0807AB68
	.align 2, 0
_0807AB14: .4byte 0x000006ca
_0807AB18: .4byte gUnknown_20375F8
_0807AB1C: .4byte 0x000006c4
_0807AB20:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	lsls r1, r4, 1
	ldr r0, _0807AB4C @ =gUnknown_20375F8
	adds r0, r1, r0
	ldr r2, _0807AB50 @ =gUnknown_20371F8
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	ldr r0, _0807AB54 @ =gUnknown_2037AB8
	ldrh r2, [r0, 0x4]
	lsls r2, 21
	lsrs r2, 27
	ldrh r3, [r0, 0x6]
	lsls r3, 17
	lsrs r3, 17
	adds r0, r4, 0
	movs r1, 0x10
	bl BlendPalette
	b _0807AB68
	.align 2, 0
_0807AB4C: .4byte gUnknown_20375F8
_0807AB50: .4byte gUnknown_20371F8
_0807AB54: .4byte gUnknown_2037AB8
_0807AB58:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	ldr r3, _0807AB70 @ =0x000073fc
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0xC
	bl BlendPalette
_0807AB68:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807AB70: .4byte 0x000073fc
	thumb_func_end sub_807AA8C

	thumb_func_start sub_807AB74
sub_807AB74: @ 807AB74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0807AB90 @ =gUnknown_2037F34
	movs r2, 0xD8
	lsls r2, 3
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x1
	bl sub_807A294
	pop {r0}
	bx r0
	.align 2, 0
_0807AB90: .4byte gUnknown_2037F34
	thumb_func_end sub_807AB74

	thumb_func_start sub_807AB94
sub_807AB94: @ 807AB94
	push {lr}
	ldr r1, _0807ABA8 @ =gUnknown_2037F34
	ldr r2, _0807ABAC @ =0x000006c6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807ABB0
	movs r0, 0
	b _0807ABB6
	.align 2, 0
_0807ABA8: .4byte gUnknown_2037F34
_0807ABAC: .4byte 0x000006c6
_0807ABB0:
	ldr r2, _0807ABBC @ =0x000006ca
	adds r0, r1, r2
	ldrb r0, [r0]
_0807ABB6:
	pop {r1}
	bx r1
	.align 2, 0
_0807ABBC: .4byte 0x000006ca
	thumb_func_end sub_807AB94

	thumb_func_start sub_807ABC0
sub_807ABC0: @ 807ABC0
	push {r4,lr}
	ldr r4, _0807ABE8 @ =gUnknown_2037F34
	ldr r1, _0807ABEC @ =0x000006d4
	adds r4, r1
	ldrb r1, [r4]
	lsls r1, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	ldrb r0, [r4]
	bl sub_807AA8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807ABE8: .4byte gUnknown_2037F34
_0807ABEC: .4byte 0x000006d4
	thumb_func_end sub_807ABC0

	thumb_func_start nullsub_47
nullsub_47: @ 807ABF0
	bx lr
	thumb_func_end nullsub_47

	thumb_func_start sub_807ABF4
sub_807ABF4: @ 807ABF4
	ldr r0, _0807AC08 @ =gUnknown_2037F34
	ldr r2, _0807AC0C @ =0x0000074d
	adds r1, r0, r2
	movs r2, 0x1
	strb r2, [r1]
	ldr r1, _0807AC10 @ =0x0000074e
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807AC08: .4byte gUnknown_2037F34
_0807AC0C: .4byte 0x0000074d
_0807AC10: .4byte 0x0000074e
	thumb_func_end sub_807ABF4

	thumb_func_start sub_807AC14
sub_807AC14: @ 807AC14
	push {r4,lr}
	ldr r1, _0807AC3C @ =gUnknown_2037F34
	ldr r0, _0807AC40 @ =0x0000074d
	adds r4, r1, r0
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1F
	bgt _0807AC48
	ldr r0, _0807AC44 @ =0x0000074e
	adds r1, r0
	adds r0, r4, 0
	bl nullsub_47
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1F
	bgt _0807AC48
	movs r0, 0x1
	b _0807AC4A
	.align 2, 0
_0807AC3C: .4byte gUnknown_2037F34
_0807AC40: .4byte 0x0000074d
_0807AC44: .4byte 0x0000074e
_0807AC48:
	movs r0, 0
_0807AC4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807AC14

	thumb_func_start sub_807AC50
sub_807AC50: @ 807AC50
	push {lr}
	lsls r0, 24
	asrs r0, 24
	mvns r0, r0
	bl sub_807A790
	pop {r0}
	bx r0
	thumb_func_end sub_807AC50

	thumb_func_start sub_807AC60
sub_807AC60: @ 807AC60
	ldr r1, _0807AC88 @ =gUnknown_2037F34
	ldr r2, _0807AC8C @ =0x0000073c
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	movs r3, 0xE8
	lsls r3, 3
	adds r0, r1, r3
	strh r2, [r0]
	adds r3, 0x2
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _0807AC90 @ =0x0000073e
	adds r1, r0
	strh r2, [r1]
	ldr r1, _0807AC94 @ =gUnknown_20386A8
	movs r0, 0x5
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807AC88: .4byte gUnknown_2037F34
_0807AC8C: .4byte 0x0000073c
_0807AC90: .4byte 0x0000073e
_0807AC94: .4byte gUnknown_20386A8
	thumb_func_end sub_807AC60

	thumb_func_start sub_807AC98
sub_807AC98: @ 807AC98
	push {r4-r7,lr}
	ldr r5, _0807ACB4 @ =gUnknown_2037F34
	ldr r0, _0807ACB8 @ =0x00000742
	adds r7, r5, r0
	movs r1, 0
	ldrsh r2, [r7, r1]
	cmp r2, 0x1
	beq _0807AD14
	cmp r2, 0x1
	bgt _0807ACBC
	cmp r2, 0
	beq _0807ACC2
	b _0807ADA0
	.align 2, 0
_0807ACB4: .4byte gUnknown_2037F34
_0807ACB8: .4byte 0x00000742
_0807ACBC:
	cmp r2, 0x2
	beq _0807AD68
	b _0807ADA0
_0807ACC2:
	movs r3, 0xE8
	lsls r3, 3
	adds r6, r5, r3
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807AD08 @ =gUnknown_20386A8
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807ADA0
	strh r2, [r6]
	ldr r0, _0807AD0C @ =0x0000073c
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r1, r0, 0x1
	strh r1, [r4]
	lsls r0, 24
	asrs r0, 24
	bl sub_807AC50
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	ble _0807ADA0
	ldr r3, _0807AD10 @ =0x0000073e
	adds r0, r5, r3
	strh r1, [r0]
	movs r0, 0x1
	strh r0, [r7]
	movs r0, 0x3C
	strh r0, [r6]
	b _0807ADA0
	.align 2, 0
_0807AD08: .4byte gUnknown_20386A8
_0807AD0C: .4byte 0x0000073c
_0807AD10: .4byte 0x0000073e
_0807AD14:
	movs r0, 0xE8
	lsls r0, 3
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r0, 0x3
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0807AD5C @ =gUnknown_825E074
	movs r3, 0
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	subs r0, 0x1
	asrs r0, 6
	adds r0, 0x2
	ldr r2, _0807AD60 @ =0x0000073c
	adds r6, r5, r2
	adds r2, r0, 0
	strh r0, [r6]
	ldr r3, _0807AD64 @ =0x0000073e
	adds r4, r5, r3
	movs r3, 0
	ldrsh r1, [r4, r3]
	cmp r0, r1
	beq _0807AD54
	lsls r0, r2, 24
	asrs r0, 24
	bl sub_807AC50
_0807AD54:
	ldrh r0, [r6]
	strh r0, [r4]
	b _0807ADA0
	.align 2, 0
_0807AD5C: .4byte gUnknown_825E074
_0807AD60: .4byte 0x0000073c
_0807AD64: .4byte 0x0000073e
_0807AD68:
	movs r0, 0xE8
	lsls r0, 3
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807ADA8 @ =gUnknown_20386A8
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807ADA0
	strh r6, [r2]
	ldr r1, _0807ADAC @ =0x0000073c
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 24
	asrs r0, 24
	bl sub_807AC50
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bne _0807ADA0
	strh r6, [r7]
_0807ADA0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ADA8: .4byte gUnknown_20386A8
_0807ADAC: .4byte 0x0000073c
	thumb_func_end sub_807AC98

	thumb_func_start sub_807ADB0
sub_807ADB0: @ 807ADB0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807ADE8 @ =gUnknown_2037F34
	movs r4, 0xE6
	lsls r4, 3
	adds r2, r3, r4
	strh r0, [r2]
	adds r4, 0x2
	adds r2, r3, r4
	strh r1, [r2]
	adds r4, 0x2
	adds r2, r3, r4
	strh r0, [r2]
	ldr r2, _0807ADEC @ =0x00000736
	adds r3, r2
	strh r1, [r3]
	lsls r1, 8
	orrs r1, r0
	movs r0, 0x52
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807ADE8: .4byte gUnknown_2037F34
_0807ADEC: .4byte 0x00000736
	thumb_func_end sub_807ADB0

	thumb_func_start sub_807ADF0
sub_807ADF0: @ 807ADF0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807AE24 @ =gUnknown_2037F34
	ldr r5, _0807AE28 @ =0x00000734
	adds r4, r3, r5
	movs r5, 0
	strh r0, [r4]
	ldr r4, _0807AE2C @ =0x00000736
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _0807AE30 @ =0x0000073a
	adds r0, r3, r1
	strb r2, [r0]
	adds r4, 0x3
	adds r0, r3, r4
	strb r5, [r0]
	movs r0, 0xE7
	lsls r0, 3
	adds r3, r0
	strb r5, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AE24: .4byte gUnknown_2037F34
_0807AE28: .4byte 0x00000734
_0807AE2C: .4byte 0x00000736
_0807AE30: .4byte 0x0000073a
	thumb_func_end sub_807ADF0

	thumb_func_start sub_807AE34
sub_807AE34: @ 807AE34
	push {r4-r6,lr}
	ldr r0, _0807AE8C @ =gUnknown_2037F34
	movs r1, 0xE6
	lsls r1, 3
	adds r3, r0, r1
	ldr r2, [r3]
	ldr r6, _0807AE90 @ =0x00000734
	adds r4, r0, r6
	ldr r1, [r4]
	adds r5, r0, 0
	cmp r2, r1
	beq _0807AEF8
	ldr r0, _0807AE94 @ =0x00000739
	adds r2, r5, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r6, _0807AE98 @ =0x0000073a
	adds r1, r5, r6
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bls _0807AEC4
	movs r0, 0
	strb r0, [r2]
	movs r0, 0xE7
	lsls r0, 3
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807AE9C
	ldrh r1, [r3]
	adds r2, r1, 0
	ldrh r0, [r4]
	cmp r2, r0
	bcs _0807AEBC
	adds r0, r1, 0x1
	b _0807AEC2
	.align 2, 0
_0807AE8C: .4byte gUnknown_2037F34
_0807AE90: .4byte 0x00000734
_0807AE94: .4byte 0x00000739
_0807AE98: .4byte 0x0000073a
_0807AE9C:
	ldr r1, _0807AEB4 @ =0x00000732
	adds r3, r5, r1
	ldr r2, _0807AEB8 @ =0x00000736
	adds r0, r5, r2
	ldrh r1, [r3]
	adds r2, r1, 0
	ldrh r0, [r0]
	cmp r2, r0
	bcs _0807AEBC
	adds r0, r1, 0x1
	b _0807AEC2
	.align 2, 0
_0807AEB4: .4byte 0x00000732
_0807AEB8: .4byte 0x00000736
_0807AEBC:
	cmp r2, r0
	bls _0807AEC4
	subs r0, r1, 0x1
_0807AEC2:
	strh r0, [r3]
_0807AEC4:
	ldr r6, _0807AEF0 @ =0x00000732
	adds r0, r5, r6
	ldrh r1, [r0]
	lsls r1, 8
	movs r0, 0xE6
	lsls r0, 3
	adds r4, r5, r0
	ldrh r0, [r4]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r1, [r4]
	ldr r2, _0807AEF4 @ =0x00000734
	adds r0, r5, r2
	ldr r0, [r0]
	cmp r1, r0
	beq _0807AEF8
	movs r0, 0
	b _0807AEFA
	.align 2, 0
_0807AEF0: .4byte 0x00000732
_0807AEF4: .4byte 0x00000734
_0807AEF8:
	movs r0, 0x1
_0807AEFA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807AE34

	thumb_func_start sub_807AF00
sub_807AF00: @ 807AF00
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x9
	bhi _0807AF92
	lsls r0, 2
	ldr r1, _0807AF18 @ =_0807AF1C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807AF18: .4byte _0807AF1C
	.align 2, 0
_0807AF1C:
	.4byte _0807AF44
	.4byte _0807AF4C
	.4byte _0807AF54
	.4byte _0807AF5C
	.4byte _0807AF64
	.4byte _0807AF6C
	.4byte _0807AF74
	.4byte _0807AF7C
	.4byte _0807AF84
	.4byte _0807AF8C
_0807AF44:
	movs r0, 0x1
	bl sub_807B174
	b _0807AF92
_0807AF4C:
	movs r0, 0x2
	bl sub_807B174
	b _0807AF92
_0807AF54:
	movs r0, 0x3
	bl sub_807B174
	b _0807AF92
_0807AF5C:
	movs r0, 0x4
	bl sub_807B174
	b _0807AF92
_0807AF64:
	movs r0, 0x5
	bl sub_807B174
	b _0807AF92
_0807AF6C:
	movs r0, 0x6
	bl sub_807B174
	b _0807AF92
_0807AF74:
	movs r0, 0x9
	bl sub_807B174
	b _0807AF92
_0807AF7C:
	movs r0, 0x7
	bl sub_807B174
	b _0807AF92
_0807AF84:
	movs r0, 0x8
	bl sub_807B174
	b _0807AF92
_0807AF8C:
	movs r0, 0xB
	bl sub_807B174
_0807AF92:
	pop {r0}
	bx r0
	thumb_func_end sub_807AF00

	thumb_func_start weather_get_current
weather_get_current: @ 807AF98
	ldr r0, _0807AFA4 @ =gUnknown_2037F34
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807AFA4: .4byte gUnknown_2037F34
	thumb_func_end weather_get_current

	thumb_func_start sub_807AFA8
sub_807AFA8: @ 807AFA8
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _0807AFC8 @ =gUnknown_2037F34
	ldr r3, _0807AFCC @ =0x000006c6
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0807AFFA
	cmp r2, 0x4C
	beq _0807AFE0
	cmp r2, 0x4C
	bgt _0807AFD0
	cmp r2, 0x4A
	beq _0807AFEC
	b _0807AFFA
	.align 2, 0
_0807AFC8: .4byte gUnknown_2037F34
_0807AFCC: .4byte 0x000006c6
_0807AFD0:
	cmp r2, 0x4E
	bne _0807AFFA
	ldr r0, _0807AFDC @ =0x000006dd
	adds r1, r0
	movs r0, 0
	b _0807AFF2
	.align 2, 0
_0807AFDC: .4byte 0x000006dd
_0807AFE0:
	ldr r3, _0807AFE8 @ =0x000006dd
	adds r1, r3
	movs r0, 0x1
	b _0807AFF2
	.align 2, 0
_0807AFE8: .4byte 0x000006dd
_0807AFEC:
	ldr r0, _0807B000 @ =0x000006dd
	adds r1, r0
	movs r0, 0x2
_0807AFF2:
	strb r0, [r1]
	adds r0, r2, 0
	bl sub_80722CC
_0807AFFA:
	pop {r0}
	bx r0
	.align 2, 0
_0807B000: .4byte 0x000006dd
	thumb_func_end sub_807AFA8

	thumb_func_start play_some_sound
play_some_sound: @ 807B004
	push {lr}
	bl IsSpecialSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _0807B042
	ldr r0, _0807B02C @ =gUnknown_2037F34
	ldr r1, _0807B030 @ =0x000006dd
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807B034
	cmp r0, 0x1
	bgt _0807B03C
	cmp r0, 0
	bne _0807B03C
	movs r0, 0x4F
	bl sub_80722CC
	b _0807B042
	.align 2, 0
_0807B02C: .4byte gUnknown_2037F34
_0807B030: .4byte 0x000006dd
_0807B034:
	movs r0, 0x4D
	bl sub_80722CC
	b _0807B042
_0807B03C:
	movs r0, 0x4B
	bl sub_80722CC
_0807B042:
	pop {r0}
	bx r0
	thumb_func_end play_some_sound

	thumb_func_start sub_807B048
sub_807B048: @ 807B048
	ldr r0, _0807B054 @ =gUnknown_2037F34
	ldr r1, _0807B058 @ =0x000006d3
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807B054: .4byte gUnknown_2037F34
_0807B058: .4byte 0x000006d3
	thumb_func_end sub_807B048

	thumb_func_start sub_807B05C
sub_807B05C: @ 807B05C
	ldr r0, _0807B068 @ =gUnknown_2037F34
	ldr r1, _0807B06C @ =0x000006c6
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0807B068: .4byte gUnknown_2037F34
_0807B06C: .4byte 0x000006c6
	thumb_func_end sub_807B05C

	thumb_func_start sub_807B070
sub_807B070: @ 807B070
	ldr r0, _0807B07C @ =gUnknown_2037F34
	ldr r1, _0807B080 @ =0x000006c6
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0807B07C: .4byte gUnknown_2037F34
_0807B080: .4byte 0x000006c6
	thumb_func_end sub_807B070

	thumb_func_start sub_807B084
sub_807B084: @ 807B084
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807B0A8 @ =gUnknown_83C2CC0
	ldr r5, _0807B0AC @ =gUnknown_2038684
	adds r1, r5, 0
	movs r2, 0x10
	bl CpuSet
	adds r4, r5
	movs r0, 0
	strb r0, [r4]
	ldr r0, _0807B0B0 @ =gUnknown_20386A4
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B0A8: .4byte gUnknown_83C2CC0
_0807B0AC: .4byte gUnknown_2038684
_0807B0B0: .4byte gUnknown_20386A4
	thumb_func_end sub_807B084

	thumb_func_start sub_807B0B4
sub_807B0B4: @ 807B0B4
	ldr r1, _0807B0BC @ =gUnknown_20386A4
	ldr r0, _0807B0C0 @ =gUnknown_83C2CC0
	str r0, [r1]
	bx lr
	.align 2, 0
_0807B0BC: .4byte gUnknown_20386A4
_0807B0C0: .4byte gUnknown_83C2CC0
	thumb_func_end sub_807B0B4

	thumb_func_start sub_807B0C4
sub_807B0C4: @ 807B0C4
	push {lr}
	adds r1, r0, 0
	adds r3, r2, 0
	ldr r0, _0807B0E8 @ =gUnknown_2037F34
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xB
	beq _0807B0F0
	cmp r0, 0xB
	bgt _0807B0EC
	cmp r0, 0x5
	bgt _0807B0FA
	cmp r0, 0x3
	blt _0807B0FA
	b _0807B0F0
	.align 2, 0
_0807B0E8: .4byte gUnknown_2037F34
_0807B0EC:
	cmp r0, 0xD
	bne _0807B0FA
_0807B0F0:
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0x3
	bl sub_8045314
_0807B0FA:
	pop {r0}
	bx r0
	thumb_func_end sub_807B0C4

	thumb_func_start sub_807B100
sub_807B100: @ 807B100
	push {r4,r5,lr}
	ldr r4, _0807B12C @ =gUnknown_3005008
	ldr r1, [r4]
	adds r1, 0x2E
	ldrb r5, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl sub_807B1CC
	ldr r1, [r4]
	adds r1, 0x2E
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x2E
	ldrb r0, [r0]
	adds r1, r5, 0
	bl sub_807B2BC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B12C: .4byte gUnknown_3005008
	thumb_func_end sub_807B100

	thumb_func_start sub_807B130
sub_807B130: @ 807B130
	ldr r0, _0807B13C @ =gUnknown_3005008
	ldr r0, [r0]
	adds r0, 0x2E
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807B13C: .4byte gUnknown_3005008
	thumb_func_end sub_807B130

	thumb_func_start sub_807B140
sub_807B140: @ 807B140
	push {r4,r5,lr}
	ldr r4, _0807B16C @ =gUnknown_3005008
	ldr r0, [r4]
	adds r0, 0x2E
	ldrb r5, [r0]
	ldr r0, _0807B170 @ =gUnknown_2036DFC
	ldrb r0, [r0, 0x16]
	bl sub_807B1CC
	ldr r1, [r4]
	adds r1, 0x2E
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x2E
	ldrb r0, [r0]
	adds r1, r5, 0
	bl sub_807B2BC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B16C: .4byte gUnknown_3005008
_0807B170: .4byte gUnknown_2036DFC
	thumb_func_end sub_807B140

	thumb_func_start sub_807B174
sub_807B174: @ 807B174
	push {lr}
	bl sub_807B100
	bl sub_807B130
	lsls r0, 24
	lsrs r0, 24
	bl weather_set
	pop {r0}
	bx r0
	thumb_func_end sub_807B174

	thumb_func_start sub_807B18C
sub_807B18C: @ 807B18C
	push {lr}
	bl sub_807B100
	bl sub_807B130
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079D60
	pop {r0}
	bx r0
	thumb_func_end sub_807B18C

	thumb_func_start sub_807B1A4
sub_807B1A4: @ 807B1A4
	push {lr}
	bl sub_807B130
	lsls r0, 24
	lsrs r0, 24
	bl weather_set
	pop {r0}
	bx r0
	thumb_func_end sub_807B1A4

	thumb_func_start sub_807B1B8
sub_807B1B8: @ 807B1B8
	push {lr}
	bl sub_807B130
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079D60
	pop {r0}
	bx r0
	thumb_func_end sub_807B1B8

	thumb_func_start sub_807B1CC
sub_807B1CC: @ 807B1CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _0807B294
	lsls r0, 2
	ldr r1, _0807B1E0 @ =_0807B1E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B1E0: .4byte _0807B1E4
	.align 2, 0
_0807B1E4:
	.4byte _0807B294
	.4byte _0807B23C
	.4byte _0807B240
	.4byte _0807B244
	.4byte _0807B248
	.4byte _0807B24C
	.4byte _0807B250
	.4byte _0807B254
	.4byte _0807B258
	.4byte _0807B25C
	.4byte _0807B260
	.4byte _0807B264
	.4byte _0807B268
	.4byte _0807B26C
	.4byte _0807B270
	.4byte _0807B294
	.4byte _0807B294
	.4byte _0807B294
	.4byte _0807B294
	.4byte _0807B294
	.4byte _0807B274
	.4byte _0807B27C
_0807B23C:
	movs r0, 0x1
	b _0807B296
_0807B240:
	movs r0, 0x2
	b _0807B296
_0807B244:
	movs r0, 0x3
	b _0807B296
_0807B248:
	movs r0, 0x4
	b _0807B296
_0807B24C:
	movs r0, 0x5
	b _0807B296
_0807B250:
	movs r0, 0x6
	b _0807B296
_0807B254:
	movs r0, 0x7
	b _0807B296
_0807B258:
	movs r0, 0x8
	b _0807B296
_0807B25C:
	movs r0, 0x9
	b _0807B296
_0807B260:
	movs r0, 0xA
	b _0807B296
_0807B264:
	movs r0, 0xB
	b _0807B296
_0807B268:
	movs r0, 0xC
	b _0807B296
_0807B26C:
	movs r0, 0xD
	b _0807B296
_0807B270:
	movs r0, 0xE
	b _0807B296
_0807B274:
	ldr r1, _0807B278 @ =gUnknown_83C65C0
	b _0807B27E
	.align 2, 0
_0807B278: .4byte gUnknown_83C65C0
_0807B27C:
	ldr r1, _0807B28C @ =gUnknown_83C65C4
_0807B27E:
	ldr r0, _0807B290 @ =gUnknown_3005008
	ldr r0, [r0]
	adds r0, 0x2F
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	b _0807B296
	.align 2, 0
_0807B28C: .4byte gUnknown_83C65C4
_0807B290: .4byte gUnknown_3005008
_0807B294:
	movs r0, 0
_0807B296:
	pop {r1}
	bx r1
	thumb_func_end sub_807B1CC

	thumb_func_start sub_807B29C
sub_807B29C: @ 807B29C
	lsls r0, 16
	ldr r1, _0807B2B8 @ =gUnknown_3005008
	ldr r2, [r1]
	adds r2, 0x2F
	lsrs r0, 16
	ldrb r1, [r2]
	adds r0, r1
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	strb r1, [r2]
	bx lr
	.align 2, 0
_0807B2B8: .4byte gUnknown_3005008
	thumb_func_end sub_807B29C

	thumb_func_start sub_807B2BC
sub_807B2BC: @ 807B2BC
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r0, 24
	cmp r0, r1
	beq _0807B2D6
	cmp r2, 0x3
	beq _0807B2D0
	cmp r2, 0x5
	bne _0807B2D6
_0807B2D0:
	movs r0, 0x28
	bl sub_8054E90
_0807B2D6:
	pop {r0}
	bx r0
	thumb_func_end sub_807B2BC

	.align 2, 0 @ Don't pad with nop.
