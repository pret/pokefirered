	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C6D0C
sub_80C6D0C: @ 80C6D0C
	push {r4-r7,lr}
	ldr r1, _080C6D8C @ =gUnknown_2023FF4
	ldr r0, [r1]
	ldr r3, [r0, 0x18]
	movs r4, 0
	adds r7, r1, 0
	ldr r2, _080C6D90 @ =gUnknown_2022B4C
	movs r1, 0
_080C6D1C:
	adds r0, r3, r4
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x2F
	bls _080C6D1C
	ldr r3, [r2]
	movs r0, 0x8
	ands r0, r3
	cmp r0, 0
	beq _080C6D80
	ldr r0, _080C6D94 @ =gUnknown_20386AE
	ldrh r2, [r0]
	movs r1, 0x80
	lsls r1, 3
	adds r6, r0, 0
	cmp r2, r1
	beq _080C6D80
	ldr r0, _080C6D98 @ =0x00080982
	ands r3, r0
	cmp r3, 0
	bne _080C6D80
	movs r4, 0
	ldr r5, _080C6D9C @ =gUnknown_823EAD8
_080C6D4A:
	lsls r2, r4, 1
	ldrh r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r2, r0
	adds r2, r5
	ldrh r3, [r2]
	cmp r3, 0
	beq _080C6D7A
	ldr r2, [r7]
	ldr r1, [r2, 0x18]
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, 0x24
	adds r1, r0
	strh r3, [r1]
	ldr r1, [r2, 0x18]
	adds r1, 0x2C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080C6D7A:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C6D4A
_080C6D80:
	bl sub_80C6DA0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6D8C: .4byte gUnknown_2023FF4
_080C6D90: .4byte gUnknown_2022B4C
_080C6D94: .4byte gUnknown_20386AE
_080C6D98: .4byte 0x00080982
_080C6D9C: .4byte gUnknown_823EAD8
	thumb_func_end sub_80C6D0C

	thumb_func_start sub_80C6DA0
sub_80C6DA0: @ 80C6DA0
	push {r4-r7,lr}
	ldr r0, _080C6E60 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r4, 0
	ldr r3, _080C6E64 @ =gUnknown_2023BC4
	movs r2, 0
_080C6DAE:
	adds r0, r1, r4
	strb r2, [r0]
	adds r4, 0x1
	cmp r4, 0x1B
	bls _080C6DAE
	movs r4, 0
	ldr r2, _080C6E60 @ =gUnknown_2023FF4
	movs r1, 0x64
_080C6DBE:
	ldr r0, [r2]
	ldr r0, [r0, 0x14]
	adds r0, 0x4
	adds r0, r4
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C6DBE
	ldrb r0, [r3]
	movs r1, 0
	movs r2, 0xFF
	bl sub_801779C
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r5, _080C6E60 @ =gUnknown_2023FF4
_080C6DE0:
	ldr r7, _080C6E68 @ =gUnknown_825E45C
	lsls r0, r4, 2
	adds r0, r7
	ldr r0, [r0]
	ands r0, r6
	cmp r0, 0
	beq _080C6DFA
	ldr r0, [r5]
	ldr r0, [r0, 0x14]
	adds r0, 0x4
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
_080C6DFA:
	bl Random
	ldr r1, [r5]
	ldr r2, [r1, 0x14]
	adds r2, 0x18
	adds r2, r4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x64
	subs r1, r0
	strb r1, [r2]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C6DE0
	ldr r0, _080C6E60 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x1C]
	adds r0, 0x20
	movs r1, 0
	strb r1, [r0]
	ldr r1, _080C6E6C @ =gUnknown_2023D6B
	ldr r0, _080C6E64 @ =gUnknown_2023BC4
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r0, _080C6E70 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C6E7C
	ldr r4, _080C6E74 @ =gUnknown_2023D6C
	bl Random
	movs r3, 0x2
	ands r0, r3
	strb r0, [r4]
	ldr r0, _080C6E78 @ =gUnknown_2023D70
	ldrb r1, [r0]
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080C6E84
	eors r2, r3
	strb r2, [r4]
	b _080C6E84
	.align 2, 0
_080C6E60: .4byte gUnknown_2023FF4
_080C6E64: .4byte gUnknown_2023BC4
_080C6E68: .4byte gUnknown_825E45C
_080C6E6C: .4byte gUnknown_2023D6B
_080C6E70: .4byte gUnknown_2022B4C
_080C6E74: .4byte gUnknown_2023D6C
_080C6E78: .4byte gUnknown_2023D70
_080C6E7C:
	ldr r0, _080C6EA0 @ =gUnknown_2023D6C
	movs r1, 0x1
	eors r1, r2
	strb r1, [r0]
_080C6E84:
	ldr r0, _080C6EA4 @ =gUnknown_2022B4C
	ldr r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080C6EAC
	ldr r0, _080C6EA8 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0x80
	lsls r0, 23
	str r0, [r1, 0xC]
	b _080C6F34
	.align 2, 0
_080C6EA0: .4byte gUnknown_2023D6C
_080C6EA4: .4byte gUnknown_2022B4C
_080C6EA8: .4byte gUnknown_2023FF4
_080C6EAC:
	movs r2, 0x80
	lsls r2, 3
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080C6ECC
	ldr r0, _080C6EC8 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0x80
	lsls r0, 22
	str r0, [r1, 0xC]
	b _080C6F34
	.align 2, 0
_080C6EC8: .4byte gUnknown_2023FF4
_080C6ECC:
	ldr r0, _080C6EF4 @ =0x00080900
	ands r0, r1
	cmp r0, 0
	bne _080C6F0A
	ldr r4, _080C6EF8 @ =gUnknown_20386AE
	ldrh r0, [r4]
	cmp r0, r2
	beq _080C6F0A
	movs r0, 0x80
	lsls r0, 10
	ands r0, r1
	cmp r0, 0
	beq _080C6F00
	ldr r0, _080C6EFC @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0x1
	str r0, [r1, 0xC]
	b _080C6F34
	.align 2, 0
_080C6EF4: .4byte 0x00080900
_080C6EF8: .4byte gUnknown_20386AE
_080C6EFC: .4byte gUnknown_2023FF4
_080C6F00:
	movs r0, 0x80
	lsls r0, 11
	ands r1, r0
	cmp r1, 0
	beq _080C6F1C
_080C6F0A:
	ldr r0, _080C6F18 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0x7
	str r0, [r1, 0xC]
	b _080C6F34
	.align 2, 0
_080C6F18: .4byte gUnknown_2023FF4
_080C6F1C:
	ldr r0, _080C6F3C @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C6F40 @ =gUnknown_823EAC8
	ldrh r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r2, 0x1C
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3, 0xC]
_080C6F34:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6F3C: .4byte gUnknown_2023FF4
_080C6F40: .4byte gUnknown_823EAC8
	thumb_func_end sub_80C6DA0

	thumb_func_start sub_80C6F44
sub_80C6F44: @ 80C6F44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	bl sub_80C7164
	ldr r1, _080C6FA8 @ =gUnknown_2023FF4
	ldr r0, [r1]
	ldr r0, [r0, 0x14]
	ldr r0, [r0, 0xC]
	cmp r0, 0
	beq _080C6F94
	adds r4, r1, 0
	movs r5, 0
_080C6F60:
	ldr r0, [r4]
	ldr r2, [r0, 0x14]
	ldr r0, [r2, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C6F74
	strb r5, [r2]
	bl sub_80C7038
_080C6F74:
	ldr r0, [r4]
	ldr r1, [r0, 0x14]
	ldr r0, [r1, 0xC]
	lsrs r0, 1
	str r0, [r1, 0xC]
	ldrb r0, [r1, 0x11]
	adds r0, 0x1
	strb r0, [r1, 0x11]
	ldr r0, [r4]
	ldr r0, [r0, 0x14]
	strb r5, [r0, 0x1]
	ldr r0, [r4]
	ldr r0, [r0, 0x14]
	ldr r0, [r0, 0xC]
	cmp r0, 0
	bne _080C6F60
_080C6F94:
	ldr r6, _080C6FA8 @ =gUnknown_2023FF4
	ldr r0, [r6]
	ldr r3, [r0, 0x14]
	ldrb r1, [r3, 0x10]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080C6FAC
	movs r0, 0x4
	b _080C702A
	.align 2, 0
_080C6FA8: .4byte gUnknown_2023FF4
_080C6FAC:
	movs r0, 0x4
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080C6FBC
	movs r0, 0x5
	b _080C702A
_080C6FBC:
	movs r5, 0x1
	mov r0, sp
	ldrb r1, [r3, 0x4]
	strb r1, [r0]
	add r0, sp, 0x4
	strb r2, [r0]
	movs r3, 0x1
	mov r8, r0
	mov r4, sp
	adds r7, r6, 0
	mov r6, r8
_080C6FD2:
	ldrb r1, [r4]
	ldr r0, [r7]
	ldr r0, [r0, 0x14]
	adds r0, 0x4
	adds r2, r0, r3
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bge _080C6FEC
	movs r5, 0x1
	ldrb r0, [r2]
	strb r0, [r4]
	strb r3, [r6]
_080C6FEC:
	ldrb r1, [r4]
	ldr r0, [r7]
	ldr r0, [r0, 0x14]
	adds r0, 0x4
	adds r2, r0, r3
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080C7012
	mov r0, sp
	adds r1, r0, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r1, r5, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r1, r6, r1
	strb r3, [r1]
_080C7012:
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C6FD2
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __modsi3
	add r0, r8
	ldrb r0, [r0]
_080C702A:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C6F44

	thumb_func_start sub_80C7038
sub_80C7038: @ 80C7038
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r7, _080C70B0 @ =gUnknown_2023FF4
	ldr r0, [r7]
	ldr r0, [r0, 0x14]
	ldrb r0, [r0]
	adds r6, r7, 0
	cmp r0, 0x2
	bne _080C7050
	b _080C7156
_080C7050:
	mov r9, r7
	ldr r0, _080C70B4 @ =gUnknown_2039A00
	mov r8, r0
_080C7056:
	mov r1, r9
	ldr r0, [r1]
	ldr r2, [r0, 0x14]
	ldrb r0, [r2]
	cmp r0, 0x1
	beq _080C70C4
	cmp r0, 0x1
	bgt _080C714A
	cmp r0, 0
	bne _080C714A
	ldr r1, _080C70B8 @ =gUnknown_81D9BF4
	ldrb r0, [r2, 0x11]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	mov r1, r8
	str r0, [r1]
	ldr r5, _080C70BC @ =gUnknown_2023BE4
	ldrb r4, [r2, 0x1]
	ldr r0, _080C70C0 @ =gUnknown_2023D6B
	ldrb r1, [r0]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r4, r3
	adds r1, r5, 0
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C70A0
	lsls r0, r4, 1
	adds r0, r3
	adds r1, r5, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
_080C70A0:
	strh r0, [r2, 0x2]
	ldr r0, [r6]
	ldr r1, [r0, 0x14]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080C714A
	.align 2, 0
_080C70B0: .4byte gUnknown_2023FF4
_080C70B4: .4byte gUnknown_2039A00
_080C70B8: .4byte gUnknown_81D9BF4
_080C70BC: .4byte gUnknown_2023BE4
_080C70C0: .4byte gUnknown_2023D6B
_080C70C4:
	ldrh r1, [r2, 0x2]
	cmp r1, 0
	beq _080C70E4
	ldr r1, _080C70E0 @ =gUnknown_83F55A4
	mov r2, r8
	ldr r0, [r2]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _080C70FA
	.align 2, 0
_080C70E0: .4byte gUnknown_83F55A4
_080C70E4:
	adds r0, r2, 0x4
	ldrb r2, [r2, 0x1]
	adds r0, r2
	strb r1, [r0]
	mov r1, r9
	ldr r0, [r1]
	ldr r2, [r0, 0x14]
	ldrb r1, [r2, 0x10]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2, 0x10]
_080C70FA:
	ldr r2, _080C7130 @ =gUnknown_2023FF4
	ldr r0, [r2]
	ldr r3, [r0, 0x14]
	ldrb r1, [r3, 0x10]
	movs r0, 0x1
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _080C714A
	ldrb r0, [r3, 0x1]
	adds r0, 0x1
	strb r0, [r3, 0x1]
	ldr r0, [r6]
	ldr r2, [r0, 0x14]
	ldrb r0, [r2, 0x1]
	cmp r0, 0x3
	bhi _080C7134
	ldrb r1, [r2, 0x10]
	movs r0, 0x8
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080C7134
	strb r0, [r2]
	b _080C713E
	.align 2, 0
_080C7130: .4byte gUnknown_2023FF4
_080C7134:
	ldr r0, [r6]
	ldr r1, [r0, 0x14]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080C713E:
	ldr r0, [r6]
	ldr r2, [r0, 0x14]
	ldrb r1, [r2, 0x10]
	movs r0, 0xFE
	ands r0, r1
	strb r0, [r2, 0x10]
_080C714A:
	ldr r0, [r7]
	ldr r0, [r0, 0x14]
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080C7156
	b _080C7056
_080C7156:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7038

	thumb_func_start sub_80C7164
sub_80C7164: @ 80C7164
	push {r4-r6,lr}
	movs r3, 0
	ldr r5, _080C7190 @ =gUnknown_2023FF4
	ldr r4, _080C7194 @ =gUnknown_2023D6C
	ldr r6, _080C7198 @ =gUnknown_2023D98
_080C716E:
	ldr r0, [r5]
	ldr r2, [r0, 0x18]
	lsls r1, r3, 1
	ldrb r0, [r4]
	lsrs r0, 1
	lsls r0, 4
	adds r1, r0
	adds r2, r1
	ldrh r0, [r2]
	cmp r0, 0
	bne _080C719C
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	b _080C71A2
	.align 2, 0
_080C7190: .4byte gUnknown_2023FF4
_080C7194: .4byte gUnknown_2023D6C
_080C7198: .4byte gUnknown_2023D98
_080C719C:
	adds r3, 0x1
	cmp r3, 0x7
	ble _080C716E
_080C71A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7164

	thumb_func_start sub_80C71A8
sub_80C71A8: @ 80C71A8
	push {r4,lr}
	lsls r0, 24
	ldr r4, _080C71CC @ =gUnknown_2023FF4
	lsrs r0, 25
	lsls r1, r0, 4
	movs r3, 0
	movs r2, 0x7
_080C71B6:
	ldr r0, [r4]
	ldr r0, [r0, 0x18]
	adds r0, r1
	strh r3, [r0]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _080C71B6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C71CC: .4byte gUnknown_2023FF4
	thumb_func_end sub_80C71A8

	thumb_func_start sub_80C71D0
sub_80C71D0: @ 80C71D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080C71FC
	adds r0, r4, 0
	bl GetBankIdentity
	ldr r1, _080C7204 @ =gUnknown_2023FF4
	ldr r1, [r1]
	ldr r2, [r1, 0x18]
	movs r1, 0x1
	ands r1, r0
	adds r2, 0x20
	adds r2, r1
	strb r5, [r2]
_080C71FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7204: .4byte gUnknown_2023FF4
	thumb_func_end sub_80C71D0

	thumb_func_start sub_80C7208
sub_80C7208: @ 80C7208
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080C7234
	adds r0, r4, 0
	bl GetBankIdentity
	ldr r1, _080C723C @ =gUnknown_2023FF4
	ldr r1, [r1]
	ldr r2, [r1, 0x18]
	movs r1, 0x1
	ands r1, r0
	adds r2, 0x22
	adds r2, r1
	strb r5, [r2]
_080C7234:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C723C: .4byte gUnknown_2023FF4
	thumb_func_end sub_80C7208

	thumb_func_start sub_80C7240
sub_80C7240: @ 80C7240
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xFF
	lsls r1, 16
	ldr r3, _080C7274 @ =gUnknown_2039A00
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, 16
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	bcs _080C7278
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C727C
	.align 2, 0
_080C7274: .4byte gUnknown_2039A00
_080C7278:
	adds r0, r2, 0x6
	str r0, [r3]
_080C727C:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7240

	thumb_func_start sub_80C7280
sub_80C7280: @ 80C7280
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xFF
	lsls r1, 16
	ldr r3, _080C72B4 @ =gUnknown_2039A00
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, 16
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	bls _080C72B8
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C72BC
	.align 2, 0
_080C72B4: .4byte gUnknown_2039A00
_080C72B8:
	adds r0, r2, 0x6
	str r0, [r3]
_080C72BC:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7280

	thumb_func_start sub_80C72C0
sub_80C72C0: @ 80C72C0
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xFF
	lsls r1, 16
	ldr r3, _080C72F4 @ =gUnknown_2039A00
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, 16
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	bne _080C72F8
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C72FC
	.align 2, 0
_080C72F4: .4byte gUnknown_2039A00
_080C72F8:
	adds r0, r2, 0x6
	str r0, [r3]
_080C72FC:
	pop {r0}
	bx r0
	thumb_func_end sub_80C72C0

	thumb_func_start sub_80C7300
sub_80C7300: @ 80C7300
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xFF
	lsls r1, 16
	ldr r3, _080C7334 @ =gUnknown_2039A00
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, 16
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	beq _080C7338
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C733C
	.align 2, 0
_080C7334: .4byte gUnknown_2039A00
_080C7338:
	adds r0, r2, 0x6
	str r0, [r3]
_080C733C:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7300

	thumb_func_start BattleAICmd_score
BattleAICmd_score: @ 80C7340
	push {r4,lr}
	ldr r2, _080C737C @ =gUnknown_2023FF4
	ldr r0, [r2]
	ldr r0, [r0, 0x14]
	adds r1, r0, 0x4
	ldrb r0, [r0, 0x1]
	adds r1, r0
	ldr r3, _080C7380 @ =gUnknown_2039A00
	ldr r0, [r3]
	ldrb r0, [r0, 0x1]
	ldrb r4, [r1]
	adds r0, r4
	strb r0, [r1]
	ldr r0, [r2]
	ldr r1, [r0, 0x14]
	adds r0, r1, 0x4
	ldrb r1, [r1, 0x1]
	adds r1, r0, r1
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bge _080C7370
	movs r0, 0
	strb r0, [r1]
_080C7370:
	ldr r0, [r3]
	adds r0, 0x2
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C737C: .4byte gUnknown_2023FF4
_080C7380: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_score

	thumb_func_start sub_80C7384
sub_80C7384: @ 80C7384
	push {r4,lr}
	ldr r0, _080C7398 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C73A0
	ldr r0, _080C739C @ =gUnknown_2023D6B
	b _080C73A2
	.align 2, 0
_080C7398: .4byte gUnknown_2039A00
_080C739C: .4byte gUnknown_2023D6B
_080C73A0:
	ldr r0, _080C73D8 @ =gUnknown_2023D6C
_080C73A2:
	ldrb r1, [r0]
	ldr r2, _080C73DC @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1, 0x28]
	movs r0, 0x64
	muls r0, r2
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	cmp r0, r1
	bcs _080C73E0
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C73E4
	.align 2, 0
_080C73D8: .4byte gUnknown_2023D6C
_080C73DC: .4byte gUnknown_2023BE4
_080C73E0:
	adds r0, r2, 0x7
	str r0, [r4]
_080C73E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7384

	thumb_func_start sub_80C73EC
sub_80C73EC: @ 80C73EC
	push {r4,lr}
	ldr r0, _080C7400 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C7408
	ldr r0, _080C7404 @ =gUnknown_2023D6B
	b _080C740A
	.align 2, 0
_080C7400: .4byte gUnknown_2039A00
_080C7404: .4byte gUnknown_2023D6B
_080C7408:
	ldr r0, _080C7440 @ =gUnknown_2023D6C
_080C740A:
	ldrb r1, [r0]
	ldr r2, _080C7444 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1, 0x28]
	movs r0, 0x64
	muls r0, r2
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	cmp r0, r1
	bls _080C7448
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C744C
	.align 2, 0
_080C7440: .4byte gUnknown_2023D6C
_080C7444: .4byte gUnknown_2023BE4
_080C7448:
	adds r0, r2, 0x7
	str r0, [r4]
_080C744C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C73EC

	thumb_func_start sub_80C7454
sub_80C7454: @ 80C7454
	push {r4,lr}
	ldr r0, _080C7468 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C7470
	ldr r0, _080C746C @ =gUnknown_2023D6B
	b _080C7472
	.align 2, 0
_080C7468: .4byte gUnknown_2039A00
_080C746C: .4byte gUnknown_2023D6B
_080C7470:
	ldr r0, _080C74A8 @ =gUnknown_2023D6C
_080C7472:
	ldrb r1, [r0]
	ldr r2, _080C74AC @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1, 0x28]
	movs r0, 0x64
	muls r0, r2
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	cmp r0, r1
	bne _080C74B0
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C74B4
	.align 2, 0
_080C74A8: .4byte gUnknown_2023D6C
_080C74AC: .4byte gUnknown_2023BE4
_080C74B0:
	adds r0, r2, 0x7
	str r0, [r4]
_080C74B4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7454

	thumb_func_start sub_80C74BC
sub_80C74BC: @ 80C74BC
	push {r4,lr}
	ldr r0, _080C74D0 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C74D8
	ldr r0, _080C74D4 @ =gUnknown_2023D6B
	b _080C74DA
	.align 2, 0
_080C74D0: .4byte gUnknown_2039A00
_080C74D4: .4byte gUnknown_2023D6B
_080C74D8:
	ldr r0, _080C7510 @ =gUnknown_2023D6C
_080C74DA:
	ldrb r1, [r0]
	ldr r2, _080C7514 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1, 0x28]
	movs r0, 0x64
	muls r0, r2
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	cmp r0, r1
	beq _080C7518
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C751C
	.align 2, 0
_080C7510: .4byte gUnknown_2023D6C
_080C7514: .4byte gUnknown_2023BE4
_080C7518:
	adds r0, r2, 0x7
	str r0, [r4]
_080C751C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C74BC

	thumb_func_start sub_80C7524
sub_80C7524: @ 80C7524
	push {r4,r5,lr}
	ldr r0, _080C7538 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080C7540
	ldr r0, _080C753C @ =gUnknown_2023D6B
	b _080C7542
	.align 2, 0
_080C7538: .4byte gUnknown_2039A00
_080C753C: .4byte gUnknown_2023D6B
_080C7540:
	ldr r0, _080C7584 @ =gUnknown_2023D6C
_080C7542:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _080C7588 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	beq _080C758C
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _080C7592
	.align 2, 0
_080C7584: .4byte gUnknown_2023D6C
_080C7588: .4byte gUnknown_2023BE4
_080C758C:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_080C7592:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7524

	thumb_func_start sub_80C7598
sub_80C7598: @ 80C7598
	push {r4,r5,lr}
	ldr r0, _080C75AC @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080C75B4
	ldr r0, _080C75B0 @ =gUnknown_2023D6B
	b _080C75B6
	.align 2, 0
_080C75AC: .4byte gUnknown_2039A00
_080C75B0: .4byte gUnknown_2023D6B
_080C75B4:
	ldr r0, _080C75F8 @ =gUnknown_2023D6C
_080C75B6:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _080C75FC @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	bne _080C7600
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _080C7606
	.align 2, 0
_080C75F8: .4byte gUnknown_2023D6C
_080C75FC: .4byte gUnknown_2023BE4
_080C7600:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_080C7606:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7598

	thumb_func_start sub_80C760C
sub_80C760C: @ 80C760C
	push {r4,r5,lr}
	ldr r0, _080C7620 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080C7628
	ldr r0, _080C7624 @ =gUnknown_2023D6B
	b _080C762A
	.align 2, 0
_080C7620: .4byte gUnknown_2039A00
_080C7624: .4byte gUnknown_2023D6B
_080C7628:
	ldr r0, _080C766C @ =gUnknown_2023D6C
_080C762A:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _080C7670 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	beq _080C7674
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _080C767A
	.align 2, 0
_080C766C: .4byte gUnknown_2023D6C
_080C7670: .4byte gUnknown_2023BE4
_080C7674:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_080C767A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C760C

	thumb_func_start sub_80C7680
sub_80C7680: @ 80C7680
	push {r4,r5,lr}
	ldr r0, _080C7694 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080C769C
	ldr r0, _080C7698 @ =gUnknown_2023D6B
	b _080C769E
	.align 2, 0
_080C7694: .4byte gUnknown_2039A00
_080C7698: .4byte gUnknown_2023D6B
_080C769C:
	ldr r0, _080C76E0 @ =gUnknown_2023D6C
_080C769E:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _080C76E4 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	bne _080C76E8
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _080C76EE
	.align 2, 0
_080C76E0: .4byte gUnknown_2023D6C
_080C76E4: .4byte gUnknown_2023BE4
_080C76E8:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_080C76EE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7680

	thumb_func_start sub_80C76F4
sub_80C76F4: @ 80C76F4
	push {r4,r5,lr}
	ldr r0, _080C7708 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080C7710
	ldr r0, _080C770C @ =gUnknown_2023D6B
	b _080C7712
	.align 2, 0
_080C7708: .4byte gUnknown_2039A00
_080C770C: .4byte gUnknown_2023D6B
_080C7710:
	ldr r0, _080C7750 @ =gUnknown_2023D6C
_080C7712:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	ldr r2, _080C7754 @ =gUnknown_2023DFC
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	beq _080C7758
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _080C775E
	.align 2, 0
_080C7750: .4byte gUnknown_2023D6C
_080C7754: .4byte gUnknown_2023DFC
_080C7758:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_080C775E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C76F4

	thumb_func_start sub_80C7764
sub_80C7764: @ 80C7764
	push {r4,r5,lr}
	ldr r0, _080C7778 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080C7780
	ldr r0, _080C777C @ =gUnknown_2023D6B
	b _080C7782
	.align 2, 0
_080C7778: .4byte gUnknown_2039A00
_080C777C: .4byte gUnknown_2023D6B
_080C7780:
	ldr r0, _080C77C0 @ =gUnknown_2023D6C
_080C7782:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	ldr r2, _080C77C4 @ =gUnknown_2023DFC
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	bne _080C77C8
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _080C77CE
	.align 2, 0
_080C77C0: .4byte gUnknown_2023D6C
_080C77C4: .4byte gUnknown_2023DFC
_080C77C8:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_080C77CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7764

	thumb_func_start sub_80C77D4
sub_80C77D4: @ 80C77D4
	push {r4,lr}
	ldr r0, _080C77E4 @ =gUnknown_2039A00
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _080C77EC
	ldr r0, _080C77E8 @ =gUnknown_2023D6B
	b _080C77EE
	.align 2, 0
_080C77E4: .4byte gUnknown_2039A00
_080C77E8: .4byte gUnknown_2023D6B
_080C77EC:
	ldr r0, _080C7838 @ =gUnknown_2023D6C
_080C77EE:
	ldrb r0, [r0]
	bl GetBankIdentity
	movs r2, 0x1
	ands r2, r0
	ldr r4, _080C783C @ =gUnknown_2039A00
	ldr r3, [r4]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	ldr r0, _080C7840 @ =gUnknown_2023DDE
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, 0
	beq _080C7844
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C784A
	.align 2, 0
_080C7838: .4byte gUnknown_2023D6C
_080C783C: .4byte gUnknown_2039A00
_080C7840: .4byte gUnknown_2023DDE
_080C7844:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r4]
_080C784A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C77D4

	thumb_func_start sub_80C7850
sub_80C7850: @ 80C7850
	push {r4,lr}
	ldr r0, _080C7860 @ =gUnknown_2039A00
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _080C7868
	ldr r0, _080C7864 @ =gUnknown_2023D6B
	b _080C786A
	.align 2, 0
_080C7860: .4byte gUnknown_2039A00
_080C7864: .4byte gUnknown_2023D6B
_080C7868:
	ldr r0, _080C78B4 @ =gUnknown_2023D6C
_080C786A:
	ldrb r0, [r0]
	bl GetBankIdentity
	movs r2, 0x1
	ands r2, r0
	ldr r4, _080C78B8 @ =gUnknown_2039A00
	ldr r3, [r4]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	ldr r0, _080C78BC @ =gUnknown_2023DDE
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, 0
	bne _080C78C0
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C78C6
	.align 2, 0
_080C78B4: .4byte gUnknown_2023D6C
_080C78B8: .4byte gUnknown_2039A00
_080C78BC: .4byte gUnknown_2023DDE
_080C78C0:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r4]
_080C78C6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7850

	thumb_func_start sub_80C78CC
sub_80C78CC: @ 80C78CC
	push {lr}
	ldr r0, _080C78F8 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r3, _080C78FC @ =gUnknown_2039A00
	ldr r2, [r3]
	ldr r0, [r0, 0x8]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bcs _080C7900
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C7904
	.align 2, 0
_080C78F8: .4byte gUnknown_2023FF4
_080C78FC: .4byte gUnknown_2039A00
_080C7900:
	adds r0, r2, 0x6
	str r0, [r3]
_080C7904:
	pop {r0}
	bx r0
	thumb_func_end sub_80C78CC

	thumb_func_start sub_80C7908
sub_80C7908: @ 80C7908
	push {lr}
	ldr r0, _080C7934 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r3, _080C7938 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldr r0, [r0, 0x8]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bls _080C793C
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C7940
	.align 2, 0
_080C7934: .4byte gUnknown_2023FF4
_080C7938: .4byte gUnknown_2039A00
_080C793C:
	adds r0, r2, 0x6
	str r0, [r3]
_080C7940:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7908

	thumb_func_start sub_80C7944
sub_80C7944: @ 80C7944
	push {lr}
	ldr r0, _080C7970 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r3, _080C7974 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldr r0, [r0, 0x8]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bne _080C7978
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C797C
	.align 2, 0
_080C7970: .4byte gUnknown_2023FF4
_080C7974: .4byte gUnknown_2039A00
_080C7978:
	adds r0, r2, 0x6
	str r0, [r3]
_080C797C:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7944

	thumb_func_start sub_80C7980
sub_80C7980: @ 80C7980
	push {lr}
	ldr r0, _080C79AC @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r3, _080C79B0 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldr r0, [r0, 0x8]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	beq _080C79B4
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C79B8
	.align 2, 0
_080C79AC: .4byte gUnknown_2023FF4
_080C79B0: .4byte gUnknown_2039A00
_080C79B4:
	adds r0, r2, 0x6
	str r0, [r3]
_080C79B8:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7980

	thumb_func_start sub_80C79BC
sub_80C79BC: @ 80C79BC
	push {lr}
	ldr r3, _080C79FC @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	ldr r0, _080C7A00 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080C7A04
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C7A0A
	.align 2, 0
_080C79FC: .4byte gUnknown_2039A00
_080C7A00: .4byte gUnknown_2023FF4
_080C7A04:
	adds r0, r2, 0
	adds r0, 0x9
	str r0, [r3]
_080C7A0A:
	pop {r0}
	bx r0
	thumb_func_end sub_80C79BC

	thumb_func_start sub_80C7A10
sub_80C7A10: @ 80C7A10
	push {lr}
	ldr r3, _080C7A50 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	ldr r0, _080C7A54 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080C7A58
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C7A5E
	.align 2, 0
_080C7A50: .4byte gUnknown_2039A00
_080C7A54: .4byte gUnknown_2023FF4
_080C7A58:
	adds r0, r2, 0
	adds r0, 0x9
	str r0, [r3]
_080C7A5E:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7A10

	thumb_func_start sub_80C7A64
sub_80C7A64: @ 80C7A64
	push {lr}
	ldr r3, _080C7AA4 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	ldr r0, _080C7AA8 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C7AAC
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C7AB2
	.align 2, 0
_080C7AA4: .4byte gUnknown_2039A00
_080C7AA8: .4byte gUnknown_2023FF4
_080C7AAC:
	adds r0, r2, 0
	adds r0, 0x9
	str r0, [r3]
_080C7AB2:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7A64

	thumb_func_start sub_80C7AB8
sub_80C7AB8: @ 80C7AB8
	push {lr}
	ldr r3, _080C7AF8 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	ldr r0, _080C7AFC @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080C7B00
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C7B06
	.align 2, 0
_080C7AF8: .4byte gUnknown_2039A00
_080C7AFC: .4byte gUnknown_2023FF4
_080C7B00:
	adds r0, r2, 0
	adds r0, 0x9
	str r0, [r3]
_080C7B06:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7AB8

	thumb_func_start sub_80C7B0C
sub_80C7B0C: @ 80C7B0C
	push {lr}
	ldr r3, _080C7B40 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _080C7B44 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldrh r0, [r0, 0x2]
	cmp r0, r1
	bne _080C7B48
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C7B4C
	.align 2, 0
_080C7B40: .4byte gUnknown_2039A00
_080C7B44: .4byte gUnknown_2023FF4
_080C7B48:
	adds r0, r2, 0x7
	str r0, [r3]
_080C7B4C:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7B0C

	thumb_func_start sub_80C7B50
sub_80C7B50: @ 80C7B50
	push {lr}
	ldr r3, _080C7B84 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _080C7B88 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldrh r0, [r0, 0x2]
	cmp r0, r1
	beq _080C7B8C
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C7B90
	.align 2, 0
_080C7B84: .4byte gUnknown_2039A00
_080C7B88: .4byte gUnknown_2023FF4
_080C7B8C:
	adds r0, r2, 0x7
	str r0, [r3]
_080C7B90:
	pop {r0}
	bx r0
	thumb_func_end sub_80C7B50

	thumb_func_start BattleAICmd_if_in_bytes
BattleAICmd_if_in_bytes: @ 80C7B94
	push {r4,lr}
	ldr r2, _080C7BE0 @ =gUnknown_2039A00
	ldr r1, [r2]
	ldrb r3, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _080C7BF0
	ldr r0, _080C7BE4 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r1, [r0, 0x8]
	adds r4, r2, 0
_080C7BBE:
	ldrb r0, [r3]
	cmp r1, r0
	bne _080C7BE8
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C7BF6
	.align 2, 0
_080C7BE0: .4byte gUnknown_2039A00
_080C7BE4: .4byte gUnknown_2023FF4
_080C7BE8:
	adds r3, 0x1
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _080C7BBE
_080C7BF0:
	ldr r0, [r2]
	adds r0, 0x9
	str r0, [r2]
_080C7BF6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_in_bytes

	thumb_func_start BattleAICmd_if_not_in_bytes
BattleAICmd_if_not_in_bytes: @ 80C7BFC
	push {r4,lr}
	ldr r2, _080C7C38 @ =gUnknown_2039A00
	ldr r1, [r2]
	ldrb r3, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldrb r0, [r3]
	adds r4, r2, 0
	cmp r0, 0xFF
	beq _080C7C48
	ldr r0, _080C7C3C @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r2, [r0, 0x8]
	adds r1, r4, 0
_080C7C28:
	ldrb r0, [r3]
	cmp r2, r0
	bne _080C7C40
	ldr r0, [r1]
	adds r0, 0x9
	str r0, [r1]
	b _080C7C60
	.align 2, 0
_080C7C38: .4byte gUnknown_2039A00
_080C7C3C: .4byte gUnknown_2023FF4
_080C7C40:
	adds r3, 0x1
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _080C7C28
_080C7C48:
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_080C7C60:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_in_bytes

	thumb_func_start BattleAICmd_if_in_hwords
BattleAICmd_if_in_hwords: @ 80C7C68
	push {r4,r5,lr}
	ldr r2, _080C7CB4 @ =gUnknown_2039A00
	ldr r1, [r2]
	ldrb r3, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldrh r0, [r3]
	ldr r5, _080C7CB8 @ =0x0000ffff
	cmp r0, r5
	beq _080C7CC8
	ldr r0, _080C7CBC @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r1, [r0, 0x8]
	adds r4, r2, 0
_080C7C94:
	ldrh r0, [r3]
	cmp r1, r0
	bne _080C7CC0
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C7CCE
	.align 2, 0
_080C7CB4: .4byte gUnknown_2039A00
_080C7CB8: .4byte 0x0000ffff
_080C7CBC: .4byte gUnknown_2023FF4
_080C7CC0:
	adds r3, 0x2
	ldrh r0, [r3]
	cmp r0, r5
	bne _080C7C94
_080C7CC8:
	ldr r0, [r2]
	adds r0, 0x9
	str r0, [r2]
_080C7CCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_in_hwords

	thumb_func_start BattleAICmd_if_not_in_hwords
BattleAICmd_if_not_in_hwords: @ 80C7CD4
	push {r4,r5,lr}
	ldr r2, _080C7D10 @ =gUnknown_2039A00
	ldr r1, [r2]
	ldrb r3, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldrh r0, [r3]
	ldr r4, _080C7D14 @ =0x0000ffff
	adds r5, r2, 0
	cmp r0, r4
	beq _080C7D24
	ldr r0, _080C7D18 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r2, [r0, 0x8]
	adds r1, r5, 0
_080C7D02:
	ldrh r0, [r3]
	cmp r2, r0
	bne _080C7D1C
	ldr r0, [r1]
	adds r0, 0x9
	str r0, [r1]
	b _080C7D3C
	.align 2, 0
_080C7D10: .4byte gUnknown_2039A00
_080C7D14: .4byte 0x0000ffff
_080C7D18: .4byte gUnknown_2023FF4
_080C7D1C:
	adds r3, 0x2
	ldrh r0, [r3]
	cmp r0, r4
	bne _080C7D02
_080C7D24:
	ldr r2, [r5]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
_080C7D3C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_in_hwords

	thumb_func_start sub_80C7D44
sub_80C7D44: @ 80C7D44
	push {r4,r5,lr}
	movs r3, 0
	ldr r4, _080C7D84 @ =gUnknown_2039A00
	ldr r1, _080C7D88 @ =gUnknown_2023BE4
	ldr r0, _080C7D8C @ =gUnknown_2023D6B
	ldrb r2, [r0]
	ldr r5, _080C7D90 @ =gUnknown_8250C04
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
_080C7D5A:
	ldrh r0, [r2]
	cmp r0, 0
	beq _080C7D6E
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080C7D76
_080C7D6E:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C7D5A
_080C7D76:
	cmp r3, 0x4
	bne _080C7D94
	ldr r0, [r4]
	adds r0, 0x5
	str r0, [r4]
	b _080C7DAC
	.align 2, 0
_080C7D84: .4byte gUnknown_2039A00
_080C7D88: .4byte gUnknown_2023BE4
_080C7D8C: .4byte gUnknown_2023D6B
_080C7D90: .4byte gUnknown_8250C04
_080C7D94:
	ldr r2, [r4]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_080C7DAC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7D44

	thumb_func_start sub_80C7DB4
sub_80C7DB4: @ 80C7DB4
	push {r4,r5,lr}
	movs r3, 0
	ldr r4, _080C7DF4 @ =gUnknown_2039A00
	ldr r1, _080C7DF8 @ =gUnknown_2023BE4
	ldr r0, _080C7DFC @ =gUnknown_2023D6B
	ldrb r2, [r0]
	ldr r5, _080C7E00 @ =gUnknown_8250C04
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
_080C7DCA:
	ldrh r0, [r2]
	cmp r0, 0
	beq _080C7DDE
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080C7DE6
_080C7DDE:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C7DCA
_080C7DE6:
	cmp r3, 0x4
	beq _080C7E04
	ldr r0, [r4]
	adds r0, 0x5
	str r0, [r4]
	b _080C7E1C
	.align 2, 0
_080C7DF4: .4byte gUnknown_2039A00
_080C7DF8: .4byte gUnknown_2023BE4
_080C7DFC: .4byte gUnknown_2023D6B
_080C7E00: .4byte gUnknown_8250C04
_080C7E04:
	ldr r2, [r4]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_080C7E1C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7DB4

	thumb_func_start BattleAICmd_get_turn_count
BattleAICmd_get_turn_count: @ 80C7E24
	ldr r0, _080C7E3C @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	ldr r0, _080C7E40 @ =gUnknown_3004F90
	ldrb r0, [r0, 0x13]
	str r0, [r1, 0x8]
	ldr r1, _080C7E44 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C7E3C: .4byte gUnknown_2023FF4
_080C7E40: .4byte gUnknown_3004F90
_080C7E44: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_turn_count

	thumb_func_start BattleAICmd_get_type
BattleAICmd_get_type: @ 80C7E48
	push {r4,lr}
	ldr r1, _080C7E60 @ =gUnknown_2039A00
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _080C7F22
	lsls r0, 2
	ldr r1, _080C7E64 @ =_080C7E68
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7E60: .4byte gUnknown_2039A00
_080C7E64: .4byte _080C7E68
	.align 2, 0
_080C7E68:
	.4byte _080C7EA0
	.4byte _080C7E7C
	.4byte _080C7EE8
	.4byte _080C7EC4
	.4byte _080C7F0C
_080C7E7C:
	ldr r0, _080C7E94 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C7E98 @ =gUnknown_2023BE4
	ldr r0, _080C7E9C @ =gUnknown_2023D6B
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x21
	ldrb r0, [r0]
	b _080C7F20
	.align 2, 0
_080C7E94: .4byte gUnknown_2023FF4
_080C7E98: .4byte gUnknown_2023BE4
_080C7E9C: .4byte gUnknown_2023D6B
_080C7EA0:
	ldr r0, _080C7EB8 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C7EBC @ =gUnknown_2023BE4
	ldr r0, _080C7EC0 @ =gUnknown_2023D6C
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x21
	ldrb r0, [r0]
	b _080C7F20
	.align 2, 0
_080C7EB8: .4byte gUnknown_2023FF4
_080C7EBC: .4byte gUnknown_2023BE4
_080C7EC0: .4byte gUnknown_2023D6C
_080C7EC4:
	ldr r0, _080C7EDC @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C7EE0 @ =gUnknown_2023BE4
	ldr r0, _080C7EE4 @ =gUnknown_2023D6B
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x22
	ldrb r0, [r0]
	b _080C7F20
	.align 2, 0
_080C7EDC: .4byte gUnknown_2023FF4
_080C7EE0: .4byte gUnknown_2023BE4
_080C7EE4: .4byte gUnknown_2023D6B
_080C7EE8:
	ldr r0, _080C7F00 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C7F04 @ =gUnknown_2023BE4
	ldr r0, _080C7F08 @ =gUnknown_2023D6C
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x22
	ldrb r0, [r0]
	b _080C7F20
	.align 2, 0
_080C7F00: .4byte gUnknown_2023FF4
_080C7F04: .4byte gUnknown_2023BE4
_080C7F08: .4byte gUnknown_2023D6C
_080C7F0C:
	ldr r0, _080C7F30 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C7F34 @ =gUnknown_8250C04
	ldrh r1, [r3, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
_080C7F20:
	str r0, [r3, 0x8]
_080C7F22:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7F30: .4byte gUnknown_2023FF4
_080C7F34: .4byte gUnknown_8250C04
	thumb_func_end BattleAICmd_get_type

	thumb_func_start BattleAICmd_get_last_used_bank_move_power
BattleAICmd_get_last_used_bank_move_power: @ 80C7F38
	ldr r0, _080C7F58 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C7F5C @ =gUnknown_8250C04
	ldrh r1, [r3, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	str r0, [r3, 0x8]
	ldr r1, _080C7F60 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C7F58: .4byte gUnknown_2023FF4
_080C7F5C: .4byte gUnknown_8250C04
_080C7F60: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_last_used_bank_move_power

	thumb_func_start BattleAICmd_is_most_powerful_move
BattleAICmd_is_most_powerful_move: @ 80C7F64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r3, 0
	ldr r0, _080C80A4 @ =gUnknown_83F571C
	ldrh r1, [r0]
	ldr r5, _080C80A8 @ =0x0000ffff
	ldr r6, _080C80AC @ =gUnknown_8250C04
	ldr r2, _080C80B0 @ =gUnknown_2023FF4
	cmp r1, r5
	beq _080C7FA2
	ldr r0, [r2]
	ldr r0, [r0, 0x14]
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r4, [r0]
	ldr r1, _080C80A4 @ =gUnknown_83F571C
_080C7F92:
	ldrh r0, [r1]
	cmp r4, r0
	beq _080C7FA2
	adds r1, 0x2
	adds r3, 0x1
	ldrh r0, [r1]
	cmp r0, r5
	bne _080C7F92
_080C7FA2:
	ldr r0, [r2]
	ldr r0, [r0, 0x14]
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bhi _080C7FB8
	b _080C8142
_080C7FB8:
	lsls r0, r3, 1
	ldr r1, _080C80A4 @ =gUnknown_83F571C
	adds r0, r1
	ldrh r3, [r0]
	ldr r0, _080C80A8 @ =0x0000ffff
	cmp r3, r0
	beq _080C7FC8
	b _080C8142
_080C7FC8:
	ldr r0, _080C80B4 @ =gUnknown_2023F50
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080C80B8 @ =gUnknown_2023FE8
	ldr r0, [r0]
	strb r1, [r0, 0x13]
	ldr r0, _080C80BC @ =gUnknown_2023FC4
	movs r2, 0x1
	strb r2, [r0, 0xE]
	ldr r0, _080C80C0 @ =gUnknown_2023DCC
	strb r1, [r0]
	ldr r0, _080C80C4 @ =gUnknown_2023D71
	strb r2, [r0]
	movs r6, 0
	mov r9, r3
	ldr r2, _080C80A4 @ =gUnknown_83F571C
	ldrh r2, [r2]
	str r2, [sp, 0x10]
_080C7FEC:
	movs r3, 0
	ldr r5, _080C80C8 @ =gUnknown_2023BE4
	lsls r4, r6, 1
	ldr r7, _080C80CC @ =gUnknown_2023D6B
	lsls r0, r6, 2
	mov r8, r0
	adds r1, r6, 0x1
	mov r10, r1
	ldr r2, [sp, 0x10]
	cmp r2, r9
	beq _080C8030
	ldr r2, _080C80AC @ =gUnknown_8250C04
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	adds r0, r4, r0
	adds r1, r5, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0]
	ldr r1, _080C80A4 @ =gUnknown_83F571C
_080C8020:
	ldrh r0, [r1]
	cmp r2, r0
	beq _080C8030
	adds r1, 0x2
	adds r3, 0x1
	ldrh r0, [r1]
	cmp r0, r9
	bne _080C8020
_080C8030:
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	adds r0, r4, r0
	adds r1, r5, 0
	adds r1, 0xC
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	beq _080C80DC
	lsls r0, r3, 1
	ldr r2, _080C80A4 @ =gUnknown_83F571C
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, r9
	bne _080C80DC
	ldr r0, _080C80AC @ =gUnknown_8250C04
	ldrh r2, [r1]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	bls _080C80DC
	ldr r5, _080C80D0 @ =gUnknown_2023D4A
	strh r2, [r5]
	ldrb r0, [r7]
	ldr r4, _080C80D4 @ =gUnknown_2023D6C
	ldrb r1, [r4]
	bl AI_CalcDmg
	ldrh r0, [r5]
	ldrb r1, [r7]
	ldrb r2, [r4]
	bl TypeCalc
	mov r4, sp
	add r4, r8
	ldr r2, _080C80D8 @ =gUnknown_2023D50
	ldr r0, _080C80B0 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	adds r0, 0x18
	adds r0, r6
	ldrb r1, [r0]
	ldr r0, [r2]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _080C80E4
	movs r0, 0x1
	str r0, [r4]
	b _080C80E4
	.align 2, 0
_080C80A4: .4byte gUnknown_83F571C
_080C80A8: .4byte 0x0000ffff
_080C80AC: .4byte gUnknown_8250C04
_080C80B0: .4byte gUnknown_2023FF4
_080C80B4: .4byte gUnknown_2023F50
_080C80B8: .4byte gUnknown_2023FE8
_080C80BC: .4byte gUnknown_2023FC4
_080C80C0: .4byte gUnknown_2023DCC
_080C80C4: .4byte gUnknown_2023D71
_080C80C8: .4byte gUnknown_2023BE4
_080C80CC: .4byte gUnknown_2023D6B
_080C80D0: .4byte gUnknown_2023D4A
_080C80D4: .4byte gUnknown_2023D6C
_080C80D8: .4byte gUnknown_2023D50
_080C80DC:
	mov r1, sp
	add r1, r8
	movs r0, 0
	str r0, [r1]
_080C80E4:
	mov r6, r10
	cmp r6, 0x3
	bgt _080C80EC
	b _080C7FEC
_080C80EC:
	movs r6, 0
	ldr r2, _080C8130 @ =gUnknown_2023FF4
	ldr r0, [r2]
	ldr r0, [r0, 0x14]
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	add r0, sp
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r5, _080C8134 @ =gUnknown_2039A00
	cmp r1, r0
	bgt _080C8122
	adds r4, r2, 0
	mov r3, sp
_080C8108:
	adds r3, 0x4
	adds r6, 0x1
	cmp r6, 0x3
	bgt _080C8122
	ldr r0, [r4]
	ldr r0, [r0, 0x14]
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	add r0, sp
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	ble _080C8108
_080C8122:
	cmp r6, 0x4
	bne _080C8138
	ldr r0, [r2]
	ldr r1, [r0, 0x14]
	movs r0, 0x2
	str r0, [r1, 0x8]
	b _080C814C
	.align 2, 0
_080C8130: .4byte gUnknown_2023FF4
_080C8134: .4byte gUnknown_2039A00
_080C8138:
	ldr r0, [r2]
	ldr r1, [r0, 0x14]
	movs r0, 0x1
	str r0, [r1, 0x8]
	b _080C814C
_080C8142:
	ldr r0, [r2]
	ldr r1, [r0, 0x14]
	movs r0, 0
	str r0, [r1, 0x8]
	ldr r5, _080C8164 @ =gUnknown_2039A00
_080C814C:
	ldr r0, [r5]
	adds r0, 0x1
	str r0, [r5]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8164: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_is_most_powerful_move

	thumb_func_start BattleAICmd_get_last_used_bank_move
BattleAICmd_get_last_used_bank_move: @ 80C8168
	push {lr}
	ldr r0, _080C8184 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _080C8194
	ldr r0, _080C8188 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r1, _080C818C @ =gUnknown_2023D98
	ldr r0, _080C8190 @ =gUnknown_2023D6B
	b _080C819E
	.align 2, 0
_080C8184: .4byte gUnknown_2039A00
_080C8188: .4byte gUnknown_2023FF4
_080C818C: .4byte gUnknown_2023D98
_080C8190: .4byte gUnknown_2023D6B
_080C8194:
	ldr r0, _080C81B4 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r1, _080C81B8 @ =gUnknown_2023D98
	ldr r0, _080C81BC @ =gUnknown_2023D6C
_080C819E:
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	str r0, [r2, 0x8]
	ldr r0, [r3]
	adds r0, 0x2
	str r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_080C81B4: .4byte gUnknown_2023FF4
_080C81B8: .4byte gUnknown_2023D98
_080C81BC: .4byte gUnknown_2023D6C
	thumb_func_end BattleAICmd_get_last_used_bank_move

	thumb_func_start sub_80C81C0
sub_80C81C0: @ 80C81C0
	push {lr}
	ldr r3, _080C81EC @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldr r0, _080C81F0 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r0, [r0, 0x8]
	cmp r1, r0
	bne _080C81F4
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C81F8
	.align 2, 0
_080C81EC: .4byte gUnknown_2039A00
_080C81F0: .4byte gUnknown_2023FF4
_080C81F4:
	adds r0, r2, 0x6
	str r0, [r3]
_080C81F8:
	pop {r0}
	bx r0
	thumb_func_end sub_80C81C0

	thumb_func_start sub_80C81FC
sub_80C81FC: @ 80C81FC
	push {lr}
	ldr r3, _080C8228 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldr r0, _080C822C @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r0, [r0, 0x8]
	cmp r1, r0
	beq _080C8230
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C8234
	.align 2, 0
_080C8228: .4byte gUnknown_2039A00
_080C822C: .4byte gUnknown_2023FF4
_080C8230:
	adds r0, r2, 0x6
	str r0, [r3]
_080C8234:
	pop {r0}
	bx r0
	thumb_func_end sub_80C81FC

	thumb_func_start sub_80C8238
sub_80C8238: @ 80C8238
	push {lr}
	ldr r0, _080C8270 @ =gUnknown_2023D6B
	ldrb r0, [r0]
	ldr r1, _080C8274 @ =gUnknown_2023D6C
	ldrb r1, [r1]
	movs r2, 0x1
	bl GetWhoStrikesFirst
	ldr r3, _080C8278 @ =gUnknown_2039A00
	ldr r2, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bne _080C827C
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C8280
	.align 2, 0
_080C8270: .4byte gUnknown_2023D6B
_080C8274: .4byte gUnknown_2023D6C
_080C8278: .4byte gUnknown_2039A00
_080C827C:
	adds r0, r2, 0x6
	str r0, [r3]
_080C8280:
	pop {r0}
	bx r0
	thumb_func_end sub_80C8238

	thumb_func_start sub_80C8284
sub_80C8284: @ 80C8284
	push {lr}
	ldr r0, _080C82BC @ =gUnknown_2023D6B
	ldrb r0, [r0]
	ldr r1, _080C82C0 @ =gUnknown_2023D6C
	ldrb r1, [r1]
	movs r2, 0x1
	bl GetWhoStrikesFirst
	ldr r3, _080C82C4 @ =gUnknown_2039A00
	ldr r2, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	beq _080C82C8
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C82CC
	.align 2, 0
_080C82BC: .4byte gUnknown_2023D6B
_080C82C0: .4byte gUnknown_2023D6C
_080C82C4: .4byte gUnknown_2039A00
_080C82C8:
	adds r0, r2, 0x6
	str r0, [r3]
_080C82CC:
	pop {r0}
	bx r0
	thumb_func_end sub_80C8284

	thumb_func_start nullsub_64
nullsub_64: @ 80C82D0
	bx lr
	thumb_func_end nullsub_64

	thumb_func_start nullsub_65
nullsub_65: @ 80C82D4
	bx lr
	thumb_func_end nullsub_65

	thumb_func_start BattleAICmd_count_alive_pokemon
BattleAICmd_count_alive_pokemon: @ 80C82D8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080C82F8 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0
	str r0, [r1, 0x8]
	ldr r0, _080C82FC @ =gUnknown_2039A00
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _080C8304
	ldr r0, _080C8300 @ =gUnknown_2023D6B
	b _080C8306
	.align 2, 0
_080C82F8: .4byte gUnknown_2023FF4
_080C82FC: .4byte gUnknown_2039A00
_080C8300: .4byte gUnknown_2023D6B
_080C8304:
	ldr r0, _080C834C @ =gUnknown_2023D6C
_080C8306:
	ldrb r5, [r0]
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	ldr r1, _080C8350 @ =gUnknown_202402C
	mov r8, r1
	cmp r0, 0
	bne _080C831C
	ldr r0, _080C8354 @ =gUnknown_2024284
	mov r8, r0
_080C831C:
	ldr r0, _080C8358 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C8360
	ldr r4, _080C835C @ =gUnknown_2023BCE
	lsls r0, r5, 1
	adds r0, r4
	ldrb r7, [r0]
	adds r0, r5, 0
	bl GetBankIdentity
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrb r6, [r0]
	b _080C836A
	.align 2, 0
_080C834C: .4byte gUnknown_2023D6C
_080C8350: .4byte gUnknown_202402C
_080C8354: .4byte gUnknown_2024284
_080C8358: .4byte gUnknown_2022B4C
_080C835C: .4byte gUnknown_2023BCE
_080C8360:
	ldr r1, _080C83C8 @ =gUnknown_2023BCE
	lsls r0, r5, 1
	adds r0, r1
	ldrb r6, [r0]
	adds r7, r6, 0
_080C836A:
	movs r5, 0
_080C836C:
	cmp r5, r7
	beq _080C83B0
	cmp r5, r6
	beq _080C83B0
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080C83B0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _080C83B0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _080C83B0
	ldr r0, _080C83CC @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	ldr r0, [r1, 0x8]
	adds r0, 0x1
	str r0, [r1, 0x8]
_080C83B0:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080C836C
	ldr r1, _080C83D0 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C83C8: .4byte gUnknown_2023BCE
_080C83CC: .4byte gUnknown_2023FF4
_080C83D0: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_count_alive_pokemon

	thumb_func_start BattleAICmd_get_considered_move
BattleAICmd_get_considered_move: @ 80C83D4
	ldr r0, _080C83E8 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	ldrh r0, [r1, 0x2]
	str r0, [r1, 0x8]
	ldr r1, _080C83EC @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C83E8: .4byte gUnknown_2023FF4
_080C83EC: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_considered_move

	thumb_func_start BattleAICmd_get_considered_move_effect
BattleAICmd_get_considered_move_effect: @ 80C83F0
	ldr r0, _080C8410 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C8414 @ =gUnknown_8250C04
	ldrh r1, [r3, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	str r0, [r3, 0x8]
	ldr r1, _080C8418 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C8410: .4byte gUnknown_2023FF4
_080C8414: .4byte gUnknown_8250C04
_080C8418: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_considered_move_effect

	thumb_func_start sub_80C841C
sub_80C841C: @ 80C841C
	push {r4-r7,lr}
	ldr r0, _080C842C @ =gUnknown_2039A00
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _080C8434
	ldr r0, _080C8430 @ =gUnknown_2023D6B
	b _080C8436
	.align 2, 0
_080C842C: .4byte gUnknown_2039A00
_080C8430: .4byte gUnknown_2023D6B
_080C8434:
	ldr r0, _080C8468 @ =gUnknown_2023D6C
_080C8436:
	ldrb r4, [r0]
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080C8506
	adds r0, r4, 0
	bl GetBankIdentity
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	ldr r6, _080C846C @ =gUnknown_2023FF4
	ldr r3, [r6]
	ldr r0, [r3, 0x18]
	adds r0, 0x20
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, 0
	beq _080C8470
	ldr r1, [r3, 0x14]
	str r0, [r1, 0x8]
	b _080C851A
	.align 2, 0
_080C8468: .4byte gUnknown_2023D6C
_080C846C: .4byte gUnknown_2023FF4
_080C8470:
	ldr r1, _080C84A0 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r4
	adds r5, r0, r1
	adds r0, r5, 0
	adds r0, 0x20
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x17
	beq _080C848C
	cmp r0, 0x2A
	beq _080C848C
	cmp r0, 0x47
	bne _080C84A8
_080C848C:
	ldr r0, _080C84A4 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0x58
	muls r0, r4
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	str r0, [r1, 0x8]
	b _080C851A
	.align 2, 0
_080C84A0: .4byte gUnknown_2023BE4
_080C84A4: .4byte gUnknown_2023FF4
_080C84A8:
	ldr r4, _080C84E0 @ =gUnknown_8254784
	ldrh r0, [r5]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r2, r1, r4
	ldrb r0, [r2, 0x16]
	cmp r0, 0
	beq _080C84FE
	ldrb r0, [r2, 0x17]
	cmp r0, 0
	beq _080C84F6
	bl Random
	adds r1, r7, 0
	ands r1, r0
	cmp r1, 0
	beq _080C84E4
	ldr r0, [r6]
	ldr r2, [r0, 0x14]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x16]
	b _080C8518
	.align 2, 0
_080C84E0: .4byte gUnknown_8254784
_080C84E4:
	ldr r0, [r6]
	ldr r2, [r0, 0x14]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x17]
	b _080C8518
_080C84F6:
	ldr r1, [r3, 0x14]
	ldrb r0, [r2, 0x16]
	str r0, [r1, 0x8]
	b _080C851A
_080C84FE:
	ldr r1, [r3, 0x14]
	ldrb r0, [r2, 0x17]
	str r0, [r1, 0x8]
	b _080C851A
_080C8506:
	ldr r0, _080C8528 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r1, _080C852C @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
_080C8518:
	str r0, [r2, 0x8]
_080C851A:
	ldr r1, _080C8530 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8528: .4byte gUnknown_2023FF4
_080C852C: .4byte gUnknown_2023BE4
_080C8530: .4byte gUnknown_2039A00
	thumb_func_end sub_80C841C

	thumb_func_start BattleAICmd_get_highest_type_effectiveness
BattleAICmd_get_highest_type_effectiveness: @ 80C8534
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080C85F0 @ =gUnknown_2023F50
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080C85F4 @ =gUnknown_2023FE8
	ldr r0, [r0]
	strb r1, [r0, 0x13]
	ldr r0, _080C85F8 @ =gUnknown_2023FC4
	movs r3, 0
	movs r2, 0x1
	strb r2, [r0, 0xE]
	ldr r0, _080C85FC @ =gUnknown_2023DCC
	strb r1, [r0]
	ldr r0, _080C8600 @ =gUnknown_2023D71
	strb r2, [r0]
	ldr r0, _080C8604 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	str r3, [r0, 0x8]
	movs r5, 0
	ldr r4, _080C8608 @ =gUnknown_2023D50
	ldr r7, _080C860C @ =gUnknown_2023D4A
	ldr r0, _080C8610 @ =gUnknown_2023BF0
	mov r8, r0
	ldr r6, _080C8614 @ =gUnknown_2023D6B
_080C856A:
	movs r0, 0x28
	str r0, [r4]
	lsls r1, r5, 1
	ldrb r2, [r6]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r7]
	lsls r0, 16
	cmp r0, 0
	beq _080C85D8
	ldrh r0, [r7]
	ldrb r1, [r6]
	ldr r2, _080C8618 @ =gUnknown_2023D6C
	ldrb r2, [r2]
	bl TypeCalc
	ldr r0, [r4]
	cmp r0, 0x78
	bne _080C859A
	movs r0, 0x50
	str r0, [r4]
_080C859A:
	ldr r0, [r4]
	cmp r0, 0xF0
	bne _080C85A4
	movs r0, 0xA0
	str r0, [r4]
_080C85A4:
	ldr r0, [r4]
	cmp r0, 0x1E
	bne _080C85AE
	movs r0, 0x14
	str r0, [r4]
_080C85AE:
	ldr r0, [r4]
	cmp r0, 0xF
	bne _080C85B8
	movs r0, 0xA
	str r0, [r4]
_080C85B8:
	ldr r0, _080C85FC @ =gUnknown_2023DCC
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080C85C8
	movs r0, 0
	str r0, [r4]
_080C85C8:
	ldr r0, _080C8604 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r0, [r2, 0x8]
	ldr r1, [r4]
	cmp r0, r1
	bcs _080C85D8
	str r1, [r2, 0x8]
_080C85D8:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080C856A
	ldr r1, _080C861C @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C85F0: .4byte gUnknown_2023F50
_080C85F4: .4byte gUnknown_2023FE8
_080C85F8: .4byte gUnknown_2023FC4
_080C85FC: .4byte gUnknown_2023DCC
_080C8600: .4byte gUnknown_2023D71
_080C8604: .4byte gUnknown_2023FF4
_080C8608: .4byte gUnknown_2023D50
_080C860C: .4byte gUnknown_2023D4A
_080C8610: .4byte gUnknown_2023BF0
_080C8614: .4byte gUnknown_2023D6B
_080C8618: .4byte gUnknown_2023D6C
_080C861C: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_highest_type_effectiveness

	thumb_func_start BattleAICmd_if_type_effectiveness
BattleAICmd_if_type_effectiveness: @ 80C8620
	push {r4,r5,lr}
	ldr r0, _080C86B8 @ =gUnknown_2023F50
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080C86BC @ =gUnknown_2023FE8
	ldr r0, [r0]
	strb r1, [r0, 0x13]
	ldr r0, _080C86C0 @ =gUnknown_2023FC4
	movs r2, 0x1
	strb r2, [r0, 0xE]
	ldr r5, _080C86C4 @ =gUnknown_2023DCC
	strb r1, [r5]
	ldr r0, _080C86C8 @ =gUnknown_2023D71
	strb r2, [r0]
	ldr r4, _080C86CC @ =gUnknown_2023D50
	movs r0, 0x28
	str r0, [r4]
	ldr r1, _080C86D0 @ =gUnknown_2023D4A
	ldr r0, _080C86D4 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldrh r0, [r0, 0x2]
	strh r0, [r1]
	ldrh r0, [r1]
	ldr r1, _080C86D8 @ =gUnknown_2023D6B
	ldrb r1, [r1]
	ldr r2, _080C86DC @ =gUnknown_2023D6C
	ldrb r2, [r2]
	bl TypeCalc
	ldr r0, [r4]
	cmp r0, 0x78
	bne _080C8666
	movs r0, 0x50
	str r0, [r4]
_080C8666:
	ldr r0, [r4]
	cmp r0, 0xF0
	bne _080C8670
	movs r0, 0xA0
	str r0, [r4]
_080C8670:
	ldr r0, [r4]
	cmp r0, 0x1E
	bne _080C867A
	movs r0, 0x14
	str r0, [r4]
_080C867A:
	ldr r0, [r4]
	cmp r0, 0xF
	bne _080C8684
	movs r0, 0xA
	str r0, [r4]
_080C8684:
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080C8692
	movs r0, 0
	str r0, [r4]
_080C8692:
	ldrb r0, [r4]
	ldr r3, _080C86E0 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bne _080C86E4
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C86E8
	.align 2, 0
_080C86B8: .4byte gUnknown_2023F50
_080C86BC: .4byte gUnknown_2023FE8
_080C86C0: .4byte gUnknown_2023FC4
_080C86C4: .4byte gUnknown_2023DCC
_080C86C8: .4byte gUnknown_2023D71
_080C86CC: .4byte gUnknown_2023D50
_080C86D0: .4byte gUnknown_2023D4A
_080C86D4: .4byte gUnknown_2023FF4
_080C86D8: .4byte gUnknown_2023D6B
_080C86DC: .4byte gUnknown_2023D6C
_080C86E0: .4byte gUnknown_2039A00
_080C86E4:
	adds r0, r2, 0x6
	str r0, [r3]
_080C86E8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_type_effectiveness

	thumb_func_start nullsub_66
nullsub_66: @ 80C86F0
	bx lr
	thumb_func_end nullsub_66

	thumb_func_start nullsub_67
nullsub_67: @ 80C86F4
	bx lr
	thumb_func_end nullsub_67

	thumb_func_start BattleAICmd_if_status_in_party
BattleAICmd_if_status_in_party: @ 80C86F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080C8710 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	cmp r1, 0x1
	bne _080C8738
	ldr r1, _080C8714 @ =gUnknown_202402C
	b _080C873A
	.align 2, 0
_080C8710: .4byte gUnknown_2039A00
_080C8714: .4byte gUnknown_202402C
_080C8718:
	ldr r3, _080C8734 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x6]
	ldrb r0, [r2, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C87A6
	.align 2, 0
_080C8734: .4byte gUnknown_2039A00
_080C8738:
	ldr r1, _080C87B4 @ =gUnknown_2024284
_080C873A:
	mov r9, r1
	ldr r1, [r0]
	ldrb r7, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	orrs r7, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	orrs r7, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	orrs r7, r0
	movs r0, 0
	mov r8, r0
	movs r1, 0xCE
	lsls r1, 1
	mov r10, r1
_080C875C:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r9
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	cmp r5, 0
	beq _080C8794
	cmp r5, r10
	beq _080C8794
	cmp r6, 0
	beq _080C8794
	cmp r0, r7
	beq _080C8718
_080C8794:
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x5
	ble _080C875C
	ldr r1, _080C87B8 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_080C87A6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C87B4: .4byte gUnknown_2024284
_080C87B8: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_if_status_in_party

	thumb_func_start BattleAICmd_if_status_not_in_party
BattleAICmd_if_status_not_in_party: @ 80C87BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080C87D8 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r2, r0, 0
	cmp r1, 0x1
	bne _080C87E0
	ldr r0, _080C87DC @ =gUnknown_202402C
	mov r10, r0
	b _080C87E4
	.align 2, 0
_080C87D8: .4byte gUnknown_2039A00
_080C87DC: .4byte gUnknown_202402C
_080C87E0:
	ldr r1, _080C8878 @ =gUnknown_2024284
	mov r10, r1
_080C87E4:
	ldr r1, [r2]
	ldrb r7, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	orrs r7, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	orrs r7, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	orrs r7, r0
	movs r0, 0
	mov r8, r0
	mov r9, r2
_080C8800:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r10
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	cmp r5, 0
	beq _080C8844
	movs r1, 0xCE
	lsls r1, 1
	cmp r5, r1
	beq _080C8844
	cmp r6, 0
	beq _080C8844
	cmp r0, r7
	bne _080C8844
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_080C8844:
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x5
	ble _080C8800
	ldr r3, _080C887C @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x6]
	ldrb r0, [r2, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8878: .4byte gUnknown_2024284
_080C887C: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_if_status_not_in_party

	thumb_func_start BattleAICmd_get_weather
BattleAICmd_get_weather: @ 80C8880
	push {lr}
	ldr r2, _080C88E0 @ =gUnknown_2023F1C
	ldrh r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080C8898
	ldr r0, _080C88E4 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0x1
	str r0, [r1, 0x8]
_080C8898:
	ldrh r1, [r2]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _080C88AC
	ldr r0, _080C88E4 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0x2
	str r0, [r1, 0x8]
_080C88AC:
	ldrh r1, [r2]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080C88C0
	ldr r0, _080C88E4 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0
	str r0, [r1, 0x8]
_080C88C0:
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080C88D4
	ldr r0, _080C88E4 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x14]
	movs r0, 0x3
	str r0, [r1, 0x8]
_080C88D4:
	ldr r1, _080C88E8 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C88E0: .4byte gUnknown_2023F1C
_080C88E4: .4byte gUnknown_2023FF4
_080C88E8: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_weather

	thumb_func_start sub_80C88EC
sub_80C88EC: @ 80C88EC
	push {lr}
	ldr r2, _080C8924 @ =gUnknown_8250C04
	ldr r0, _080C8928 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r3, _080C892C @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bne _080C8930
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C8934
	.align 2, 0
_080C8924: .4byte gUnknown_8250C04
_080C8928: .4byte gUnknown_2023FF4
_080C892C: .4byte gUnknown_2039A00
_080C8930:
	adds r0, r2, 0x6
	str r0, [r3]
_080C8934:
	pop {r0}
	bx r0
	thumb_func_end sub_80C88EC

	thumb_func_start sub_80C8938
sub_80C8938: @ 80C8938
	push {lr}
	ldr r2, _080C8970 @ =gUnknown_8250C04
	ldr r0, _080C8974 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r3, _080C8978 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	beq _080C897C
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C8980
	.align 2, 0
_080C8970: .4byte gUnknown_8250C04
_080C8974: .4byte gUnknown_2023FF4
_080C8978: .4byte gUnknown_2039A00
_080C897C:
	adds r0, r2, 0x6
	str r0, [r3]
_080C8980:
	pop {r0}
	bx r0
	thumb_func_end sub_80C8938

	thumb_func_start sub_80C8984
sub_80C8984: @ 80C8984
	push {r4,lr}
	ldr r0, _080C8998 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C89A0
	ldr r0, _080C899C @ =gUnknown_2023D6B
	b _080C89A2
	.align 2, 0
_080C8998: .4byte gUnknown_2039A00
_080C899C: .4byte gUnknown_2023D6B
_080C89A0:
	ldr r0, _080C89D8 @ =gUnknown_2023D6C
_080C89A2:
	ldrb r3, [r0]
	ldr r1, _080C89DC @ =gUnknown_2023BE4
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bge _080C89E0
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C89E6
	.align 2, 0
_080C89D8: .4byte gUnknown_2023D6C
_080C89DC: .4byte gUnknown_2023BE4
_080C89E0:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_080C89E6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8984

	thumb_func_start sub_80C89EC
sub_80C89EC: @ 80C89EC
	push {r4,lr}
	ldr r0, _080C8A00 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C8A08
	ldr r0, _080C8A04 @ =gUnknown_2023D6B
	b _080C8A0A
	.align 2, 0
_080C8A00: .4byte gUnknown_2039A00
_080C8A04: .4byte gUnknown_2023D6B
_080C8A08:
	ldr r0, _080C8A40 @ =gUnknown_2023D6C
_080C8A0A:
	ldrb r3, [r0]
	ldr r1, _080C8A44 @ =gUnknown_2023BE4
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	ble _080C8A48
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C8A4E
	.align 2, 0
_080C8A40: .4byte gUnknown_2023D6C
_080C8A44: .4byte gUnknown_2023BE4
_080C8A48:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_080C8A4E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C89EC

	thumb_func_start sub_80C8A54
sub_80C8A54: @ 80C8A54
	push {r4,lr}
	ldr r0, _080C8A68 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C8A70
	ldr r0, _080C8A6C @ =gUnknown_2023D6B
	b _080C8A72
	.align 2, 0
_080C8A68: .4byte gUnknown_2039A00
_080C8A6C: .4byte gUnknown_2023D6B
_080C8A70:
	ldr r0, _080C8AA8 @ =gUnknown_2023D6C
_080C8A72:
	ldrb r3, [r0]
	ldr r1, _080C8AAC @ =gUnknown_2023BE4
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bne _080C8AB0
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C8AB6
	.align 2, 0
_080C8AA8: .4byte gUnknown_2023D6C
_080C8AAC: .4byte gUnknown_2023BE4
_080C8AB0:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_080C8AB6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8A54

	thumb_func_start sub_80C8ABC
sub_80C8ABC: @ 80C8ABC
	push {r4,lr}
	ldr r0, _080C8AD0 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C8AD8
	ldr r0, _080C8AD4 @ =gUnknown_2023D6B
	b _080C8ADA
	.align 2, 0
_080C8AD0: .4byte gUnknown_2039A00
_080C8AD4: .4byte gUnknown_2023D6B
_080C8AD8:
	ldr r0, _080C8B10 @ =gUnknown_2023D6C
_080C8ADA:
	ldrb r3, [r0]
	ldr r1, _080C8B14 @ =gUnknown_2023BE4
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	beq _080C8B18
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C8B1E
	.align 2, 0
_080C8B10: .4byte gUnknown_2023D6C
_080C8B14: .4byte gUnknown_2023BE4
_080C8B18:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_080C8B1E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8ABC

	thumb_func_start BattleAICmd_if_can_faint
BattleAICmd_if_can_faint: @ 80C8B24
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _080C8BD4 @ =gUnknown_8250C04
	ldr r0, _080C8BD8 @ =gUnknown_2023FF4
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bls _080C8C08
	ldr r0, _080C8BDC @ =gUnknown_2023F50
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080C8BE0 @ =gUnknown_2023FE8
	ldr r0, [r0]
	strb r1, [r0, 0x13]
	ldr r0, _080C8BE4 @ =gUnknown_2023FC4
	movs r7, 0x1
	strb r7, [r0, 0xE]
	ldr r0, _080C8BE8 @ =gUnknown_2023DCC
	strb r1, [r0]
	ldr r0, _080C8BEC @ =gUnknown_2023D71
	strb r7, [r0]
	ldr r5, _080C8BF0 @ =gUnknown_2023D4A
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, 0x14]
	ldrh r0, [r0, 0x2]
	strh r0, [r5]
	ldr r4, _080C8BF4 @ =gUnknown_2023D6B
	ldrb r0, [r4]
	ldr r6, _080C8BF8 @ =gUnknown_2023D6C
	ldrb r1, [r6]
	bl AI_CalcDmg
	ldrh r0, [r5]
	ldrb r1, [r4]
	ldrb r2, [r6]
	bl TypeCalc
	ldr r4, _080C8BFC @ =gUnknown_2023D50
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0, 0x14]
	adds r0, r1, 0
	adds r0, 0x18
	ldrb r1, [r1, 0x1]
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, [r4]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _080C8BA4
	str r7, [r4]
_080C8BA4:
	ldr r2, _080C8C00 @ =gUnknown_2023BE4
	ldrb r1, [r6]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x28]
	ldr r0, [r4]
	cmp r1, r0
	bgt _080C8C08
	ldr r3, _080C8C04 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C8C10
	.align 2, 0
_080C8BD4: .4byte gUnknown_8250C04
_080C8BD8: .4byte gUnknown_2023FF4
_080C8BDC: .4byte gUnknown_2023F50
_080C8BE0: .4byte gUnknown_2023FE8
_080C8BE4: .4byte gUnknown_2023FC4
_080C8BE8: .4byte gUnknown_2023DCC
_080C8BEC: .4byte gUnknown_2023D71
_080C8BF0: .4byte gUnknown_2023D4A
_080C8BF4: .4byte gUnknown_2023D6B
_080C8BF8: .4byte gUnknown_2023D6C
_080C8BFC: .4byte gUnknown_2023D50
_080C8C00: .4byte gUnknown_2023BE4
_080C8C04: .4byte gUnknown_2039A00
_080C8C08:
	ldr r1, _080C8C1C @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080C8C10:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8C1C: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_if_can_faint

	thumb_func_start BattleAICmd_if_cant_faint
BattleAICmd_if_cant_faint: @ 80C8C20
	push {r4-r7,lr}
	ldr r2, _080C8CBC @ =gUnknown_8250C04
	ldr r7, _080C8CC0 @ =gUnknown_2023FF4
	ldr r0, [r7]
	ldr r0, [r0, 0x14]
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bls _080C8CF0
	ldr r0, _080C8CC4 @ =gUnknown_2023F50
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080C8CC8 @ =gUnknown_2023FE8
	ldr r0, [r0]
	strb r1, [r0, 0x13]
	ldr r0, _080C8CCC @ =gUnknown_2023FC4
	movs r2, 0x1
	strb r2, [r0, 0xE]
	ldr r0, _080C8CD0 @ =gUnknown_2023DCC
	strb r1, [r0]
	ldr r0, _080C8CD4 @ =gUnknown_2023D71
	strb r2, [r0]
	ldr r6, _080C8CD8 @ =gUnknown_2023D4A
	ldr r0, [r7]
	ldr r0, [r0, 0x14]
	ldrh r0, [r0, 0x2]
	strh r0, [r6]
	ldr r4, _080C8CDC @ =gUnknown_2023D6B
	ldrb r0, [r4]
	ldr r5, _080C8CE0 @ =gUnknown_2023D6C
	ldrb r1, [r5]
	bl AI_CalcDmg
	ldrh r0, [r6]
	ldrb r1, [r4]
	ldrb r2, [r5]
	bl TypeCalc
	ldr r4, _080C8CE4 @ =gUnknown_2023D50
	ldr r0, [r7]
	ldr r1, [r0, 0x14]
	adds r0, r1, 0
	adds r0, 0x18
	ldrb r1, [r1, 0x1]
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, [r4]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	ldr r3, _080C8CE8 @ =gUnknown_2023BE4
	ldrb r2, [r5]
	movs r1, 0x58
	muls r1, r2
	adds r1, r3
	ldrh r1, [r1, 0x28]
	cmp r1, r0
	ble _080C8CF0
	ldr r3, _080C8CEC @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C8CF8
	.align 2, 0
_080C8CBC: .4byte gUnknown_8250C04
_080C8CC0: .4byte gUnknown_2023FF4
_080C8CC4: .4byte gUnknown_2023F50
_080C8CC8: .4byte gUnknown_2023FE8
_080C8CCC: .4byte gUnknown_2023FC4
_080C8CD0: .4byte gUnknown_2023DCC
_080C8CD4: .4byte gUnknown_2023D71
_080C8CD8: .4byte gUnknown_2023D4A
_080C8CDC: .4byte gUnknown_2023D6B
_080C8CE0: .4byte gUnknown_2023D6C
_080C8CE4: .4byte gUnknown_2023D50
_080C8CE8: .4byte gUnknown_2023BE4
_080C8CEC: .4byte gUnknown_2039A00
_080C8CF0:
	ldr r1, _080C8D00 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080C8CF8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8D00: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_if_cant_faint

	thumb_func_start sub_80C8D04
sub_80C8D04: @ 80C8D04
	push {r4-r7,lr}
	ldr r1, _080C8D20 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r6, r0, 0x2
	ldrb r0, [r0, 0x1]
	adds r5, r1, 0
	cmp r0, 0x1
	beq _080C8D2C
	cmp r0, 0x1
	bgt _080C8D24
	cmp r0, 0
	beq _080C8D70
	b _080C8DD8
	.align 2, 0
_080C8D20: .4byte gUnknown_2039A00
_080C8D24:
	cmp r0, 0x2
	beq _080C8D70
	cmp r0, 0x3
	bne _080C8DD8
_080C8D2C:
	movs r3, 0
	ldr r2, _080C8D68 @ =gUnknown_2023BE4
	ldr r4, _080C8D6C @ =gUnknown_2023D6B
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	ldrh r1, [r6]
	cmp r0, r1
	beq _080C8D62
	adds r7, r4, 0
	movs r6, 0x58
	adds r4, r2, 0
	adds r2, r1, 0
_080C8D4C:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _080C8D62
	lsls r1, r3, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r1, r0
	adds r1, r4
	ldrh r0, [r1]
	cmp r0, r2
	bne _080C8D4C
_080C8D62:
	cmp r3, 0x4
	beq _080C8DB0
	b _080C8DC0
	.align 2, 0
_080C8D68: .4byte gUnknown_2023BE4
_080C8D6C: .4byte gUnknown_2023D6B
_080C8D70:
	movs r3, 0
	ldr r4, _080C8DB8 @ =gUnknown_2023FF4
	ldr r0, [r4]
	ldr r1, [r0, 0x18]
	ldr r2, _080C8DBC @ =gUnknown_2023D6C
	ldrb r0, [r2]
	lsrs r0, 1
	lsls r0, 4
	adds r1, r0
	ldrh r0, [r1]
	ldrh r1, [r6]
	cmp r0, r1
	beq _080C8DAC
	adds r7, r4, 0
	adds r4, r1, 0
	adds r6, r2, 0
_080C8D90:
	adds r3, 0x1
	cmp r3, 0x7
	bgt _080C8DAC
	ldr r0, [r7]
	ldr r2, [r0, 0x18]
	lsls r1, r3, 1
	ldrb r0, [r6]
	lsrs r0, 1
	lsls r0, 4
	adds r1, r0
	adds r2, r1
	ldrh r0, [r2]
	cmp r0, r4
	bne _080C8D90
_080C8DAC:
	cmp r3, 0x8
	bne _080C8DC0
_080C8DB0:
	ldr r0, [r5]
	adds r0, 0x8
	str r0, [r5]
	b _080C8DD8
	.align 2, 0
_080C8DB8: .4byte gUnknown_2023FF4
_080C8DBC: .4byte gUnknown_2023D6C
_080C8DC0:
	ldr r2, [r5]
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
_080C8DD8:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8D04

	thumb_func_start sub_80C8DE0
sub_80C8DE0: @ 80C8DE0
	push {r4-r7,lr}
	ldr r1, _080C8DFC @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r6, r0, 0x2
	ldrb r0, [r0, 0x1]
	adds r5, r1, 0
	cmp r0, 0x1
	beq _080C8E08
	cmp r0, 0x1
	bgt _080C8E00
	cmp r0, 0
	beq _080C8E4C
	b _080C8EB4
	.align 2, 0
_080C8DFC: .4byte gUnknown_2039A00
_080C8E00:
	cmp r0, 0x2
	beq _080C8E4C
	cmp r0, 0x3
	bne _080C8EB4
_080C8E08:
	movs r3, 0
	ldr r2, _080C8E44 @ =gUnknown_2023BE4
	ldr r4, _080C8E48 @ =gUnknown_2023D6B
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	ldrh r1, [r6]
	cmp r0, r1
	beq _080C8E3E
	adds r7, r4, 0
	movs r6, 0x58
	adds r4, r2, 0
	adds r2, r1, 0
_080C8E28:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _080C8E3E
	lsls r1, r3, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r1, r0
	adds r1, r4
	ldrh r0, [r1]
	cmp r0, r2
	bne _080C8E28
_080C8E3E:
	cmp r3, 0x4
	bne _080C8E8C
	b _080C8E9C
	.align 2, 0
_080C8E44: .4byte gUnknown_2023BE4
_080C8E48: .4byte gUnknown_2023D6B
_080C8E4C:
	movs r3, 0
	ldr r4, _080C8E94 @ =gUnknown_2023FF4
	ldr r0, [r4]
	ldr r1, [r0, 0x18]
	ldr r2, _080C8E98 @ =gUnknown_2023D6C
	ldrb r0, [r2]
	lsrs r0, 1
	lsls r0, 4
	adds r1, r0
	ldrh r0, [r1]
	ldrh r1, [r6]
	cmp r0, r1
	beq _080C8E88
	adds r7, r4, 0
	adds r4, r1, 0
	adds r6, r2, 0
_080C8E6C:
	adds r3, 0x1
	cmp r3, 0x7
	bgt _080C8E88
	ldr r0, [r7]
	ldr r2, [r0, 0x18]
	lsls r1, r3, 1
	ldrb r0, [r6]
	lsrs r0, 1
	lsls r0, 4
	adds r1, r0
	adds r2, r1
	ldrh r0, [r2]
	cmp r0, r4
	bne _080C8E6C
_080C8E88:
	cmp r3, 0x8
	beq _080C8E9C
_080C8E8C:
	ldr r0, [r5]
	adds r0, 0x8
	str r0, [r5]
	b _080C8EB4
	.align 2, 0
_080C8E94: .4byte gUnknown_2023FF4
_080C8E98: .4byte gUnknown_2023D6C
_080C8E9C:
	ldr r2, [r5]
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
_080C8EB4:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8DE0

	thumb_func_start sub_80C8EBC
sub_80C8EBC: @ 80C8EBC
	push {r4-r7,lr}
	ldr r1, _080C8ED4 @ =gUnknown_2039A00
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r5, r1, 0
	cmp r0, 0x1
	beq _080C8EE0
	cmp r0, 0x1
	bgt _080C8ED8
	cmp r0, 0
	beq _080C8F34
	b _080C8F96
	.align 2, 0
_080C8ED4: .4byte gUnknown_2039A00
_080C8ED8:
	cmp r0, 0x2
	beq _080C8F34
	cmp r0, 0x3
	bne _080C8F96
_080C8EE0:
	movs r3, 0
	ldr r1, _080C8F24 @ =gUnknown_2023BE4
	ldr r0, _080C8F28 @ =gUnknown_2023D6B
	ldrb r2, [r0]
	ldr r6, _080C8F2C @ =gUnknown_8250C04
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
	ldr r4, _080C8F30 @ =gUnknown_2039A00
_080C8EF4:
	ldrh r0, [r2]
	cmp r0, 0
	beq _080C8F0E
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r1, [r4]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _080C8F16
_080C8F0E:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C8EF4
_080C8F16:
	cmp r3, 0x4
	bne _080C8F7E
	ldr r0, [r5]
	adds r0, 0x7
	str r0, [r5]
	b _080C8F96
	.align 2, 0
_080C8F24: .4byte gUnknown_2023BE4
_080C8F28: .4byte gUnknown_2023D6B
_080C8F2C: .4byte gUnknown_8250C04
_080C8F30: .4byte gUnknown_2039A00
_080C8F34:
	movs r3, 0
	ldr r1, _080C8F9C @ =gUnknown_2023BE4
	ldr r0, _080C8FA0 @ =gUnknown_2023D6B
	ldrb r2, [r0]
	ldr r0, _080C8FA4 @ =gUnknown_8250C04
	mov r12, r0
	ldr r7, _080C8FA8 @ =gUnknown_2023FF4
	ldr r6, _080C8FAC @ =gUnknown_2023D6C
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r4, r0, r1
_080C8F4C:
	lsls r2, r3, 1
	ldrh r0, [r4]
	cmp r0, 0
	beq _080C8F76
	ldr r0, [r7]
	ldr r1, [r0, 0x18]
	ldrb r0, [r6]
	lsrs r0, 1
	lsls r0, 4
	adds r0, r2, r0
	adds r1, r0
	ldrh r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r12
	ldr r1, [r5]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _080C8F7E
_080C8F76:
	adds r4, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _080C8F4C
_080C8F7E:
	ldr r2, [r5]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
_080C8F96:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8F9C: .4byte gUnknown_2023BE4
_080C8FA0: .4byte gUnknown_2023D6B
_080C8FA4: .4byte gUnknown_8250C04
_080C8FA8: .4byte gUnknown_2023FF4
_080C8FAC: .4byte gUnknown_2023D6C
	thumb_func_end sub_80C8EBC

	thumb_func_start sub_80C8FB0
sub_80C8FB0: @ 80C8FB0
	push {r4-r6,lr}
	ldr r1, _080C8FC8 @ =gUnknown_2039A00
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _080C8FD4
	cmp r0, 0x1
	bgt _080C8FCC
	cmp r0, 0
	beq _080C9038
	b _080C9074
	.align 2, 0
_080C8FC8: .4byte gUnknown_2039A00
_080C8FCC:
	cmp r0, 0x2
	beq _080C9038
	cmp r0, 0x3
	bne _080C9074
_080C8FD4:
	movs r3, 0
	ldr r1, _080C9028 @ =gUnknown_2023BE4
	ldr r0, _080C902C @ =gUnknown_2023D6B
	ldrb r2, [r0]
	ldr r6, _080C9030 @ =gUnknown_8250C04
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
	ldr r5, _080C9034 @ =gUnknown_2039A00
_080C8FE8:
	ldrh r0, [r2]
	cmp r0, 0
	beq _080C9002
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r1, [r5]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _080C900A
_080C9002:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C8FE8
_080C900A:
	cmp r3, 0x4
	bne _080C906E
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C9074
	.align 2, 0
_080C9028: .4byte gUnknown_2023BE4
_080C902C: .4byte gUnknown_2023D6B
_080C9030: .4byte gUnknown_8250C04
_080C9034: .4byte gUnknown_2039A00
_080C9038:
	movs r3, 0
	ldr r0, _080C907C @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r1, [r0, 0x18]
	ldr r0, _080C9080 @ =gUnknown_2023D6C
	ldrb r0, [r0]
	lsrs r0, 1
	lsls r0, 4
	adds r2, r0, r1
	ldr r5, _080C9084 @ =gUnknown_8250C04
_080C904C:
	ldrh r0, [r2]
	cmp r0, 0
	beq _080C9066
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, [r4]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _080C906E
_080C9066:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _080C904C
_080C906E:
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
_080C9074:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C907C: .4byte gUnknown_2023FF4
_080C9080: .4byte gUnknown_2023D6C
_080C9084: .4byte gUnknown_8250C04
	thumb_func_end sub_80C8FB0

	thumb_func_start BattleAICmd_if_any_move_disabled_or_encored
BattleAICmd_if_any_move_disabled_or_encored: @ 80C9088
	push {r4,r5,lr}
	ldr r0, _080C909C @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _080C90A4
	ldr r0, _080C90A0 @ =gUnknown_2023D6B
	b _080C90A6
	.align 2, 0
_080C909C: .4byte gUnknown_2039A00
_080C90A0: .4byte gUnknown_2023D6B
_080C90A4:
	ldr r0, _080C90C4 @ =gUnknown_2023D6C
_080C90A6:
	ldrb r3, [r0]
	adds r4, r5, 0
	ldr r2, [r4]
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _080C90CC
	ldr r0, _080C90C8 @ =gUnknown_2023E0C
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x4]
	cmp r0, 0
	beq _080C90D0
	b _080C90E6
	.align 2, 0
_080C90C4: .4byte gUnknown_2023D6C
_080C90C8: .4byte gUnknown_2023E0C
_080C90CC:
	cmp r0, 0x1
	beq _080C90D6
_080C90D0:
	adds r0, r2, 0x7
	str r0, [r4]
	b _080C9108
_080C90D6:
	ldr r0, _080C9100 @ =gUnknown_2023E0C
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x6]
	cmp r0, 0
	beq _080C9104
_080C90E6:
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C9108
	.align 2, 0
_080C9100: .4byte gUnknown_2023E0C
_080C9104:
	adds r0, r2, 0x7
	str r0, [r5]
_080C9108:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_any_move_disabled_or_encored

	thumb_func_start BattleAICmd_if_curr_move_disabled_or_encored
BattleAICmd_if_curr_move_disabled_or_encored: @ 80C9110
	push {r4,lr}
	ldr r4, _080C9124 @ =gUnknown_2039A00
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	cmp r0, 0
	beq _080C9128
	cmp r0, 0x1
	beq _080C9154
	b _080C9194
	.align 2, 0
_080C9124: .4byte gUnknown_2039A00
_080C9128:
	ldr r2, _080C9148 @ =gUnknown_2023E0C
	ldr r0, _080C914C @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080C9150 @ =gUnknown_2023FF4
	ldr r1, [r1]
	ldr r1, [r1, 0x14]
	ldrh r0, [r0, 0x4]
	ldrh r1, [r1, 0x2]
	cmp r0, r1
	beq _080C9170
	b _080C9194
	.align 2, 0
_080C9148: .4byte gUnknown_2023E0C
_080C914C: .4byte gUnknown_2023BC4
_080C9150: .4byte gUnknown_2023FF4
_080C9154:
	ldr r2, _080C9188 @ =gUnknown_2023E0C
	ldr r0, _080C918C @ =gUnknown_2023BC4
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080C9190 @ =gUnknown_2023FF4
	ldr r1, [r1]
	ldr r1, [r1, 0x14]
	ldrh r0, [r0, 0x6]
	ldrh r1, [r1, 0x2]
	cmp r0, r1
	bne _080C9194
_080C9170:
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _080C9198
	.align 2, 0
_080C9188: .4byte gUnknown_2023E0C
_080C918C: .4byte gUnknown_2023BC4
_080C9190: .4byte gUnknown_2023FF4
_080C9194:
	adds r0, r3, 0x6
	str r0, [r4]
_080C9198:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_curr_move_disabled_or_encored

	thumb_func_start BattleAICmd_flee
BattleAICmd_flee: @ 80C91A0
	ldr r0, _080C91B0 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldrb r1, [r2, 0x10]
	movs r0, 0xB
	orrs r0, r1
	strb r0, [r2, 0x10]
	bx lr
	.align 2, 0
_080C91B0: .4byte gUnknown_2023FF4
	thumb_func_end BattleAICmd_flee

	thumb_func_start sub_80C91B4
sub_80C91B4: @ 80C91B4
	push {r4,lr}
	ldr r0, _080C91D8 @ =gUnknown_2023FE8
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C91DC
	adds r0, r1, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r4, r0, 24
	cmp r4, 0x14
	bls _080C91FC
	movs r4, 0x14
	b _080C91FC
	.align 2, 0
_080C91D8: .4byte gUnknown_2023FE8
_080C91DC:
	adds r0, r1, 0
	adds r0, 0x7A
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C91F6
	adds r0, r1, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	lsrs r4, r0, 2
	cmp r4, 0
	bne _080C91FC
	movs r4, 0x1
	b _080C91FC
_080C91F6:
	adds r0, r1, 0
	adds r0, 0x7B
	ldrb r4, [r0]
_080C91FC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 24
	lsrs r4, r0, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcs _080C923C
	ldr r3, _080C9238 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C9244
	.align 2, 0
_080C9238: .4byte gUnknown_2039A00
_080C923C:
	ldr r1, _080C924C @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080C9244:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C924C: .4byte gUnknown_2039A00
	thumb_func_end sub_80C91B4

	thumb_func_start BattleAICmd_watch
BattleAICmd_watch: @ 80C9250
	ldr r0, _080C9260 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldrb r1, [r2, 0x10]
	movs r0, 0xD
	orrs r0, r1
	strb r0, [r2, 0x10]
	bx lr
	.align 2, 0
_080C9260: .4byte gUnknown_2023FF4
	thumb_func_end BattleAICmd_watch

	thumb_func_start BattleAICmd_get_hold_effect
BattleAICmd_get_hold_effect: @ 80C9264
	push {r4,lr}
	ldr r0, _080C9274 @ =gUnknown_2039A00
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _080C927C
	ldr r0, _080C9278 @ =gUnknown_2023D6B
	b _080C927E
	.align 2, 0
_080C9274: .4byte gUnknown_2039A00
_080C9278: .4byte gUnknown_2023D6B
_080C927C:
	ldr r0, _080C92A8 @ =gUnknown_2023D6C
_080C927E:
	ldrb r4, [r0]
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080C92B0
	adds r0, r4, 0
	bl GetBankIdentity
	movs r1, 0x1
	ands r1, r0
	ldr r0, _080C92AC @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r0, [r0, 0x18]
	adds r0, 0x22
	adds r0, r1
	ldrb r0, [r0]
	str r0, [r2, 0x8]
	b _080C92CA
	.align 2, 0
_080C92A8: .4byte gUnknown_2023D6C
_080C92AC: .4byte gUnknown_2023FF4
_080C92B0:
	ldr r1, _080C92D8 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffect
	ldr r1, _080C92DC @ =gUnknown_2023FF4
	ldr r1, [r1]
	ldr r1, [r1, 0x14]
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1, 0x8]
_080C92CA:
	ldr r1, _080C92E0 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C92D8: .4byte gUnknown_2023BE4
_080C92DC: .4byte gUnknown_2023FF4
_080C92E0: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_hold_effect

	thumb_func_start BattleAICmd_get_gender
BattleAICmd_get_gender: @ 80C92E4
	push {lr}
	ldr r0, _080C92F4 @ =gUnknown_2039A00
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _080C92FC
	ldr r0, _080C92F8 @ =gUnknown_2023D6B
	b _080C92FE
	.align 2, 0
_080C92F4: .4byte gUnknown_2039A00
_080C92F8: .4byte gUnknown_2023D6B
_080C92FC:
	ldr r0, _080C932C @ =gUnknown_2023D6C
_080C92FE:
	ldrb r1, [r0]
	ldr r2, _080C9330 @ =gUnknown_2023BE4
	movs r0, 0x58
	muls r1, r0
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, 0x48
	adds r1, r2
	ldr r1, [r1]
	bl GetGenderFromSpeciesAndPersonality
	ldr r1, _080C9334 @ =gUnknown_2023FF4
	ldr r1, [r1]
	ldr r1, [r1, 0x14]
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1, 0x8]
	ldr r1, _080C9338 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C932C: .4byte gUnknown_2023D6C
_080C9330: .4byte gUnknown_2023BE4
_080C9334: .4byte gUnknown_2023FF4
_080C9338: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_gender

	thumb_func_start BattleAICmd_is_first_turn
BattleAICmd_is_first_turn: @ 80C933C
	push {r4,lr}
	ldr r0, _080C9350 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C9358
	ldr r0, _080C9354 @ =gUnknown_2023D6B
	b _080C935A
	.align 2, 0
_080C9350: .4byte gUnknown_2039A00
_080C9354: .4byte gUnknown_2023D6B
_080C9358:
	ldr r0, _080C937C @ =gUnknown_2023D6C
_080C935A:
	ldrb r3, [r0]
	ldr r0, _080C9380 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r1, _080C9384 @ =gUnknown_2023E0C
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x16]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C937C: .4byte gUnknown_2023D6C
_080C9380: .4byte gUnknown_2023FF4
_080C9384: .4byte gUnknown_2023E0C
	thumb_func_end BattleAICmd_is_first_turn

	thumb_func_start BattleAICmd_get_stockpile_count
BattleAICmd_get_stockpile_count: @ 80C9388
	push {r4,lr}
	ldr r0, _080C939C @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C93A4
	ldr r0, _080C93A0 @ =gUnknown_2023D6B
	b _080C93A6
	.align 2, 0
_080C939C: .4byte gUnknown_2039A00
_080C93A0: .4byte gUnknown_2023D6B
_080C93A4:
	ldr r0, _080C93C8 @ =gUnknown_2023D6C
_080C93A6:
	ldrb r3, [r0]
	ldr r0, _080C93CC @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r1, _080C93D0 @ =gUnknown_2023E0C
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x9]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C93C8: .4byte gUnknown_2023D6C
_080C93CC: .4byte gUnknown_2023FF4
_080C93D0: .4byte gUnknown_2023E0C
	thumb_func_end BattleAICmd_get_stockpile_count

	thumb_func_start BattleAICmd_is_double_battle
BattleAICmd_is_double_battle: @ 80C93D4
	ldr r0, _080C93F0 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r0, _080C93F4 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	str r0, [r2, 0x8]
	ldr r1, _080C93F8 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C93F0: .4byte gUnknown_2023FF4
_080C93F4: .4byte gUnknown_2022B4C
_080C93F8: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_is_double_battle

	thumb_func_start BattleAICmd_get_used_held_item
BattleAICmd_get_used_held_item: @ 80C93FC
	push {r4,lr}
	ldr r0, _080C9410 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C9418
	ldr r0, _080C9414 @ =gUnknown_2023D6B
	b _080C941A
	.align 2, 0
_080C9410: .4byte gUnknown_2039A00
_080C9414: .4byte gUnknown_2023D6B
_080C9418:
	ldr r0, _080C943C @ =gUnknown_2023D6C
_080C941A:
	ldrb r3, [r0]
	ldr r0, _080C9440 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r0, _080C9444 @ =gUnknown_2023FE8
	ldr r1, [r0]
	lsls r0, r3, 1
	adds r0, r1
	adds r0, 0xB8
	ldrb r0, [r0]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C943C: .4byte gUnknown_2023D6C
_080C9440: .4byte gUnknown_2023FF4
_080C9444: .4byte gUnknown_2023FE8
	thumb_func_end BattleAICmd_get_used_held_item

	thumb_func_start BattleAICmd_get_move_type_from_result
BattleAICmd_get_move_type_from_result: @ 80C9448
	ldr r0, _080C9468 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C946C @ =gUnknown_8250C04
	ldr r1, [r3, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	str r0, [r3, 0x8]
	ldr r1, _080C9470 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C9468: .4byte gUnknown_2023FF4
_080C946C: .4byte gUnknown_8250C04
_080C9470: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_move_type_from_result

	thumb_func_start BattleAICmd_get_move_power_from_result
BattleAICmd_get_move_power_from_result: @ 80C9474
	ldr r0, _080C9494 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C9498 @ =gUnknown_8250C04
	ldr r1, [r3, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	str r0, [r3, 0x8]
	ldr r1, _080C949C @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C9494: .4byte gUnknown_2023FF4
_080C9498: .4byte gUnknown_8250C04
_080C949C: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_move_power_from_result

	thumb_func_start BattleAICmd_get_move_effect_from_result
BattleAICmd_get_move_effect_from_result: @ 80C94A0
	ldr r0, _080C94C0 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r3, [r0, 0x14]
	ldr r2, _080C94C4 @ =gUnknown_8250C04
	ldr r1, [r3, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	str r0, [r3, 0x8]
	ldr r1, _080C94C8 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C94C0: .4byte gUnknown_2023FF4
_080C94C4: .4byte gUnknown_8250C04
_080C94C8: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_get_move_effect_from_result

	thumb_func_start BattleAICmd_get_protect_count
BattleAICmd_get_protect_count: @ 80C94CC
	push {r4,lr}
	ldr r0, _080C94E0 @ =gUnknown_2039A00
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080C94E8
	ldr r0, _080C94E4 @ =gUnknown_2023D6B
	b _080C94EA
	.align 2, 0
_080C94E0: .4byte gUnknown_2039A00
_080C94E4: .4byte gUnknown_2023D6B
_080C94E8:
	ldr r0, _080C950C @ =gUnknown_2023D6C
_080C94EA:
	ldrb r3, [r0]
	ldr r0, _080C9510 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldr r1, _080C9514 @ =gUnknown_2023E0C
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C950C: .4byte gUnknown_2023D6C
_080C9510: .4byte gUnknown_2023FF4
_080C9514: .4byte gUnknown_2023E0C
	thumb_func_end BattleAICmd_get_protect_count

	thumb_func_start nullsub_68
nullsub_68: @ 80C9518
	bx lr
	thumb_func_end nullsub_68

	thumb_func_start nullsub_69
nullsub_69: @ 80C951C
	bx lr
	thumb_func_end nullsub_69

	thumb_func_start nullsub_70
nullsub_70: @ 80C9520
	bx lr
	thumb_func_end nullsub_70

	thumb_func_start nullsub_71
nullsub_71: @ 80C9524
	bx lr
	thumb_func_end nullsub_71

	thumb_func_start nullsub_72
nullsub_72: @ 80C9528
	bx lr
	thumb_func_end nullsub_72

	thumb_func_start nullsub_73
nullsub_73: @ 80C952C
	bx lr
	thumb_func_end nullsub_73

	thumb_func_start BattleAICmd_call
BattleAICmd_call: @ 80C9530
	push {r4,lr}
	ldr r4, _080C955C @ =gUnknown_2039A00
	ldr r0, [r4]
	adds r0, 0x5
	bl AIStackPushVar
	ldr r2, [r4]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C955C: .4byte gUnknown_2039A00
	thumb_func_end BattleAICmd_call

	thumb_func_start sub_80C9560
sub_80C9560: @ 80C9560
	ldr r3, _080C957C @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_080C957C: .4byte gUnknown_2039A00
	thumb_func_end sub_80C9560

	thumb_func_start BattleAICmd_end
BattleAICmd_end: @ 80C9580
	push {lr}
	bl AIStackPop
	lsls r0, 24
	cmp r0, 0
	bne _080C959A
	ldr r0, _080C95A0 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x14]
	ldrb r1, [r2, 0x10]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2, 0x10]
_080C959A:
	pop {r0}
	bx r0
	.align 2, 0
_080C95A0: .4byte gUnknown_2023FF4
	thumb_func_end BattleAICmd_end

	thumb_func_start BattleAICmd_if_level_cond
BattleAICmd_if_level_cond: @ 80C95A4
	push {r4,r5,lr}
	ldr r5, _080C95BC @ =gUnknown_2039A00
	ldr r4, [r5]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	beq _080C95F8
	cmp r0, 0x1
	bgt _080C95C0
	cmp r0, 0
	beq _080C95C6
	b _080C9674
	.align 2, 0
_080C95BC: .4byte gUnknown_2039A00
_080C95C0:
	cmp r0, 0x2
	beq _080C9628
	b _080C9674
_080C95C6:
	ldr r3, _080C95EC @ =gUnknown_2023BE4
	ldr r0, _080C95F0 @ =gUnknown_2023D6B
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _080C95F4 @ =gUnknown_2023D6C
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhi _080C964A
	b _080C9670
	.align 2, 0
_080C95EC: .4byte gUnknown_2023BE4
_080C95F0: .4byte gUnknown_2023D6B
_080C95F4: .4byte gUnknown_2023D6C
_080C95F8:
	ldr r3, _080C961C @ =gUnknown_2023BE4
	ldr r0, _080C9620 @ =gUnknown_2023D6B
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _080C9624 @ =gUnknown_2023D6C
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _080C964A
	b _080C9670
	.align 2, 0
_080C961C: .4byte gUnknown_2023BE4
_080C9620: .4byte gUnknown_2023D6B
_080C9624: .4byte gUnknown_2023D6C
_080C9628:
	ldr r3, _080C9664 @ =gUnknown_2023BE4
	ldr r0, _080C9668 @ =gUnknown_2023D6B
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _080C966C @ =gUnknown_2023D6C
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080C9670
_080C964A:
	ldrb r1, [r4, 0x2]
	ldrb r0, [r4, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r4, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r4, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _080C9674
	.align 2, 0
_080C9664: .4byte gUnknown_2023BE4
_080C9668: .4byte gUnknown_2023D6B
_080C966C: .4byte gUnknown_2023D6C
_080C9670:
	adds r0, r4, 0x6
	str r0, [r5]
_080C9674:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_level_cond

	thumb_func_start sub_80C967C
sub_80C967C: @ 80C967C
	push {lr}
	ldr r2, _080C96B0 @ =gUnknown_2023E0C
	ldr r0, _080C96B4 @ =gUnknown_2023D6C
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _080C96BC
	ldr r3, _080C96B8 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C96C4
	.align 2, 0
_080C96B0: .4byte gUnknown_2023E0C
_080C96B4: .4byte gUnknown_2023D6C
_080C96B8: .4byte gUnknown_2039A00
_080C96BC:
	ldr r1, _080C96C8 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080C96C4:
	pop {r0}
	bx r0
	.align 2, 0
_080C96C8: .4byte gUnknown_2039A00
	thumb_func_end sub_80C967C

	thumb_func_start sub_80C96CC
sub_80C96CC: @ 80C96CC
	push {lr}
	ldr r2, _080C9700 @ =gUnknown_2023E0C
	ldr r0, _080C9704 @ =gUnknown_2023D6C
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	bne _080C970C
	ldr r3, _080C9708 @ =gUnknown_2039A00
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _080C9714
	.align 2, 0
_080C9700: .4byte gUnknown_2023E0C
_080C9704: .4byte gUnknown_2023D6C
_080C9708: .4byte gUnknown_2039A00
_080C970C:
	ldr r1, _080C9718 @ =gUnknown_2039A00
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080C9714:
	pop {r0}
	bx r0
	.align 2, 0
_080C9718: .4byte gUnknown_2039A00
	thumb_func_end sub_80C96CC

	thumb_func_start AIStackPushVar
AIStackPushVar: @ 80C971C
	push {r4,lr}
	ldr r1, _080C973C @ =gUnknown_2023FF4
	ldr r1, [r1]
	ldr r3, [r1, 0x1C]
	adds r4, r3, 0
	adds r4, 0x20
	ldrb r1, [r4]
	adds r2, r1, 0x1
	strb r2, [r4]
	lsls r1, 24
	lsrs r1, 22
	adds r3, r1
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C973C: .4byte gUnknown_2023FF4
	thumb_func_end AIStackPushVar

	thumb_func_start AIStackPushVar_cursor
AIStackPushVar_cursor: @ 80C9740
	ldr r0, _080C9760 @ =gUnknown_2023FF4
	ldr r0, [r0]
	ldr r2, [r0, 0x1C]
	adds r3, r2, 0
	adds r3, 0x20
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 22
	adds r2, r0
	ldr r0, _080C9764 @ =gUnknown_2039A00
	ldr r0, [r0]
	str r0, [r2]
	bx lr
	.align 2, 0
_080C9760: .4byte gUnknown_2023FF4
_080C9764: .4byte gUnknown_2039A00
	thumb_func_end AIStackPushVar_cursor

	thumb_func_start AIStackPop
AIStackPop: @ 80C9768
	push {lr}
	ldr r3, _080C9780 @ =gUnknown_2023FF4
	ldr r0, [r3]
	ldr r0, [r0, 0x1C]
	adds r1, r0, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0
	bne _080C9784
	movs r0, 0
	b _080C979E
	.align 2, 0
_080C9780: .4byte gUnknown_2023FF4
_080C9784:
	subs r0, 0x1
	strb r0, [r1]
	ldr r2, _080C97A4 @ =gUnknown_2039A00
	ldr r0, [r3]
	ldr r1, [r0, 0x1C]
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	movs r0, 0x1
_080C979E:
	pop {r1}
	bx r1
	.align 2, 0
_080C97A4: .4byte gUnknown_2039A00
	thumb_func_end AIStackPop

	.align 2, 0 @ Don't pad with nop.
