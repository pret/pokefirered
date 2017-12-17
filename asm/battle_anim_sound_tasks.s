	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80DCE10
sub_80DCE10: @ 80DCE10
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080DCE6C @ =gUnknown_3005090
	lsls r6, r0, 2
	adds r6, r0
	lsls r6, 3
	adds r6, r1
	ldr r1, _080DCE70 @ =gUnknown_2037F02
	ldrh r0, [r1]
	strh r0, [r6, 0x8]
	ldrh r0, [r1, 0x2]
	strh r0, [r6, 0xA]
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x3F
	bl sub_8073A44
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl CalculatePanIncrement
	strh r4, [r6, 0xC]
	strh r5, [r6, 0xE]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r6, 0x10]
	movs r0, 0xA
	strh r0, [r6, 0x1C]
	ldr r0, _080DCE74 @ =sub_80DCE78
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DCE6C: .4byte gUnknown_3005090
_080DCE70: .4byte gUnknown_2037F02
_080DCE74: .4byte sub_80DCE78
	thumb_func_end sub_80DCE10

	thumb_func_start sub_80DCE78
sub_80DCE78: @ 80DCE78
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DCEA8 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r5, [r4, 0xC]
	ldrb r6, [r4, 0x10]
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	bne _080DCEB0
	movs r0, 0x5
	strh r0, [r4, 0x1C]
	strh r1, [r4, 0x1E]
	ldr r0, _080DCEAC @ =sub_80DCEE4
	str r0, [r4]
	b _080DCEDE
	.align 2, 0
_080DCEA8: .4byte gUnknown_3005090
_080DCEAC: .4byte sub_80DCEE4
_080DCEB0:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _080DCECA
	strh r1, [r4, 0x1C]
	ldrh r0, [r4, 0x8]
	lsls r1, r5, 24
	asrs r1, 24
	bl PlaySE12WithPanning
_080DCECA:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	bl sub_8073B60
	strh r0, [r4, 0xC]
_080DCEDE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DCE78

	thumb_func_start sub_80DCEE4
sub_80DCEE4: @ 80DCEE4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080DCF34 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080DCF2C
	movs r0, 0
	strh r0, [r4, 0x1C]
	movs r0, 0x3F
	bl sub_8073A44
	adds r1, r0, 0
	ldrh r0, [r4, 0xA]
	lsls r1, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080DCF2C
	adds r0, r5, 0
	bl DestroyAnimSoundTask
_080DCF2C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DCF34: .4byte gUnknown_3005090
	thumb_func_end sub_80DCEE4

	thumb_func_start mas_80DCF38
mas_80DCF38: @ 80DCF38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080DCFDC @ =gUnknown_2037F02
	ldrh r1, [r0]
	str r1, [sp]
	ldrb r5, [r0, 0x4]
	ldrb r6, [r0, 0x6]
	ldrb r3, [r0, 0x8]
	mov r10, r3
	ldrb r7, [r0, 0xA]
	ldrb r1, [r0, 0xC]
	mov r9, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl sub_8073A44
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r5, 0
	bl sub_8073A44
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CalculatePanIncrement
	ldr r2, _080DCFE0 @ =gUnknown_3005090
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	mov r6, sp
	ldrh r6, [r6]
	strh r6, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0xE]
	mov r0, r10
	strh r0, [r1, 0x10]
	strh r7, [r1, 0x12]
	mov r3, r9
	strh r3, [r1, 0x14]
	strh r2, [r1, 0x1C]
	strh r4, [r1, 0x1E]
	strh r3, [r1, 0x20]
	ldr r2, _080DCFE4 @ =sub_80DCFE8
	str r2, [r1]
	mov r0, r8
	bl _call_via_r2
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DCFDC: .4byte gUnknown_2037F02
_080DCFE0: .4byte gUnknown_3005090
_080DCFE4: .4byte sub_80DCFE8
	thumb_func_end mas_80DCF38

	thumb_func_start sub_80DCFE8
sub_80DCFE8: @ 80DCFE8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080DD02C @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x20]
	adds r1, r0, 0x1
	strh r1, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080DD030
	movs r0, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x8]
	movs r1, 0x1E
	ldrsb r1, [r4, r1]
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _080DD030
	adds r0, r5, 0
	bl DestroyAnimSoundTask
	b _080DD062
	.align 2, 0
_080DD02C: .4byte gUnknown_3005090
_080DD030:
	ldr r1, _080DD068 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080DD062
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xE]
	ldrh r1, [r4, 0x1E]
	adds r0, r1
	strh r0, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	bl sub_8073B60
	strh r0, [r4, 0x1E]
_080DD062:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD068: .4byte gUnknown_3005090
	thumb_func_end sub_80DCFE8

	thumb_func_start sub_80DD06C
sub_80DD06C: @ 80DD06C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080DD090 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DD098
	ldr r0, _080DD094 @ =gUnknown_2037F1A
	ldrb r4, [r0]
	b _080DD0BE
	.align 2, 0
_080DD090: .4byte gUnknown_2037F02
_080DD094: .4byte gUnknown_2037F1A
_080DD098:
	cmp r0, 0x1
	bne _080DD0A8
	ldr r0, _080DD0A4 @ =gUnknown_2037F1B
	ldrb r4, [r0]
	b _080DD0BE
	.align 2, 0
_080DD0A4: .4byte gUnknown_2037F1B
_080DD0A8:
	cmp r0, 0x2
	bne _080DD0B4
	ldr r0, _080DD0B0 @ =gUnknown_2037F1A
	b _080DD0B6
	.align 2, 0
_080DD0B0: .4byte gUnknown_2037F1A
_080DD0B4:
	ldr r0, _080DD0E0 @ =gUnknown_2037F1B
_080DD0B6:
	ldrb r1, [r0]
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r1
_080DD0BE:
	ldr r0, _080DD0E4 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080DD0CC
	cmp r0, 0x3
	bne _080DD0E8
_080DD0CC:
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	bne _080DD0E8
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _080DD13A
	.align 2, 0
_080DD0E0: .4byte gUnknown_2037F1B
_080DD0E4: .4byte gUnknown_2037F02
_080DD0E8:
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DD10C
	ldr r1, _080DD104 @ =gUnknown_2023BCE
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080DD108 @ =gUnknown_202402C
	b _080DD11A
	.align 2, 0
_080DD104: .4byte gUnknown_2023BCE
_080DD108: .4byte gUnknown_202402C
_080DD10C:
	ldr r1, _080DD140 @ =gUnknown_2023BCE
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080DD144 @ =gUnknown_2024284
_080DD11A:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080DD134
	lsls r1, r6, 24
	asrs r1, 24
	movs r2, 0x3
	bl PlayCry3
_080DD134:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DD13A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DD140: .4byte gUnknown_2023BCE
_080DD144: .4byte gUnknown_2024284
	thumb_func_end sub_80DD06C

	thumb_func_start sub_80DD148
sub_80DD148: @ 80DD148
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080DD16C @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DD174
	ldr r0, _080DD170 @ =gUnknown_2037F1A
	ldrb r4, [r0]
	b _080DD19A
	.align 2, 0
_080DD16C: .4byte gUnknown_2037F02
_080DD170: .4byte gUnknown_2037F1A
_080DD174:
	cmp r0, 0x1
	bne _080DD184
	ldr r0, _080DD180 @ =gUnknown_2037F1B
	ldrb r4, [r0]
	b _080DD19A
	.align 2, 0
_080DD180: .4byte gUnknown_2037F1B
_080DD184:
	cmp r0, 0x2
	bne _080DD190
	ldr r0, _080DD18C @ =gUnknown_2037F1A
	b _080DD192
	.align 2, 0
_080DD18C: .4byte gUnknown_2037F1A
_080DD190:
	ldr r0, _080DD1BC @ =gUnknown_2037F1B
_080DD192:
	ldrb r1, [r0]
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r1
_080DD19A:
	ldr r0, _080DD1C0 @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0x1
	beq _080DD1A8
	cmp r0, 0x3
	bne _080DD1C4
_080DD1A8:
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	bne _080DD1C4
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	b _080DD26A
	.align 2, 0
_080DD1BC: .4byte gUnknown_2037F1B
_080DD1C0: .4byte gUnknown_2037F02
_080DD1C4:
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DD1E8
	ldr r1, _080DD1E0 @ =gUnknown_2023BCE
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080DD1E4 @ =gUnknown_202402C
	b _080DD1F6
	.align 2, 0
_080DD1E0: .4byte gUnknown_2023BCE
_080DD1E4: .4byte gUnknown_202402C
_080DD1E8:
	ldr r1, _080DD234 @ =gUnknown_2023BCE
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080DD238 @ =gUnknown_2024284
_080DD1F6:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r1, _080DD23C @ =gUnknown_3005090
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	ldr r4, _080DD240 @ =gUnknown_2037F02
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x8]
	strh r3, [r0, 0xA]
	lsls r1, r5, 24
	asrs r1, 24
	strh r1, [r0, 0xC]
	adds r5, r2, 0
	cmp r3, 0
	beq _080DD264
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	bne _080DD244
	adds r0, r3, 0
	movs r2, 0x9
	bl PlayCry3
	b _080DD24C
	.align 2, 0
_080DD234: .4byte gUnknown_2023BCE
_080DD238: .4byte gUnknown_2024284
_080DD23C: .4byte gUnknown_3005090
_080DD240: .4byte gUnknown_2037F02
_080DD244:
	adds r0, r3, 0
	movs r2, 0x7
	bl PlayCry3
_080DD24C:
	ldr r0, _080DD25C @ =gUnknown_3005090
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080DD260 @ =sub_80DD270
	str r0, [r1]
	b _080DD26A
	.align 2, 0
_080DD25C: .4byte gUnknown_3005090
_080DD260: .4byte sub_80DD270
_080DD264:
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080DD26A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD148

	thumb_func_start sub_80DD270
sub_80DD270: @ 80DD270
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r9, r4
	ldr r1, _080DD2A0 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r6, [r1, 0xA]
	mov r8, r6
	ldrb r5, [r1, 0xC]
	adds r7, r5, 0
	ldrh r2, [r1, 0x1A]
	movs r3, 0x1A
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	bgt _080DD2A4
	adds r0, r2, 0x1
	strh r0, [r1, 0x1A]
	b _080DD2E6
	.align 2, 0
_080DD2A0: .4byte gUnknown_3005090
_080DD2A4:
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	bne _080DD2CA
	bl IsCryPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080DD2E6
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r6, 0
	movs r2, 0xA
	bl PlayCry3
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080DD2E6
_080DD2CA:
	bl IsCryPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080DD2E6
	lsls r1, r7, 24
	asrs r1, 24
	mov r0, r8
	movs r2, 0x8
	bl PlayCry3
	mov r0, r9
	bl DestroyAnimVisualTask
_080DD2E6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD270

	thumb_func_start sub_80DD2F4
sub_80DD2F4: @ 80DD2F4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _080DD318 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x1A]
	movs r3, 0x1A
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	bgt _080DD31C
	adds r0, r2, 0x1
	strh r0, [r1, 0x1A]
	b _080DD32C
	.align 2, 0
_080DD318: .4byte gUnknown_3005090
_080DD31C:
	bl IsCryPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080DD32C
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080DD32C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD2F4

	thumb_func_start sub_80DD334
sub_80DD334: @ 80DD334
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x40
	negs r0, r0
	bl sub_8073A44
	ldr r2, _080DD374 @ =gUnknown_2037F1C
	ldr r1, _080DD378 @ =gUnknown_2037F1A
	ldrb r1, [r1]
	lsls r1, 1
	adds r1, r2
	ldrh r3, [r1]
	ldr r2, _080DD37C @ =gUnknown_3005090
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r2
	strh r3, [r4, 0xA]
	lsls r0, 24
	asrs r1, r0, 24
	strh r1, [r4, 0xC]
	cmp r3, 0
	beq _080DD384
	adds r0, r3, 0
	movs r2, 0x4
	bl PlayCry3
	ldr r0, _080DD380 @ =sub_80DD390
	str r0, [r4]
	b _080DD38A
	.align 2, 0
_080DD374: .4byte gUnknown_2037F1C
_080DD378: .4byte gUnknown_2037F1A
_080DD37C: .4byte gUnknown_3005090
_080DD380: .4byte sub_80DD390
_080DD384:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DD38A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD334

	thumb_func_start sub_80DD390
sub_80DD390: @ 80DD390
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DD3B4 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x1A]
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bgt _080DD3B8
	adds r0, r1, 0x1
	strh r0, [r4, 0x1A]
	b _080DD3D4
	.align 2, 0
_080DD3B4: .4byte gUnknown_3005090
_080DD3B8:
	bl IsCryPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080DD3D4
	ldrh r0, [r4, 0xA]
	movs r1, 0xC
	ldrsb r1, [r4, r1]
	movs r2, 0x6
	bl PlayCry3
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DD3D4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD390

	thumb_func_start sub_80DD3DC
sub_80DD3DC: @ 80DD3DC
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080DD40C @ =gUnknown_2037F02
	ldrh r5, [r0]
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl PlaySE1WithPanning
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD40C: .4byte gUnknown_2037F02
	thumb_func_end sub_80DD3DC

	thumb_func_start sub_80DD410
sub_80DD410: @ 80DD410
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080DD440 @ =gUnknown_2037F02
	ldrh r5, [r0]
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl sub_8073A44
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl PlaySE2WithPanning
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD440: .4byte gUnknown_2037F02
	thumb_func_end sub_80DD410

	thumb_func_start sub_80DD444
sub_80DD444: @ 80DD444
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080DD4C8 @ =gUnknown_2037F02
	ldrb r5, [r0, 0x2]
	ldrb r6, [r0, 0x4]
	ldrh r1, [r0, 0x6]
	mov r9, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	bl sub_8073A44
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r5, 0
	bl sub_8073A44
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CalculatePanIncrement
	ldr r2, _080DD4CC @ =gUnknown_3005090
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0xE]
	mov r0, r9
	strh r0, [r1, 0x12]
	strh r2, [r1, 0x1C]
	strh r4, [r1, 0x1E]
	ldr r2, _080DD4D0 @ =sub_80DD4D4
	str r2, [r1]
	mov r0, r8
	bl _call_via_r2
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DD4C8: .4byte gUnknown_2037F02
_080DD4CC: .4byte gUnknown_3005090
_080DD4D0: .4byte sub_80DD4D4
	thumb_func_end sub_80DD444

	thumb_func_start sub_80DD4D4
sub_80DD4D4: @ 80DD4D4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DD52C @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r2, [r4, 0xE]
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080DD50E
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	adds r0, r2, r1
	strh r0, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	bl sub_8073B60
	strh r0, [r4, 0x1E]
_080DD50E:
	ldr r1, _080DD530 @ =gUnknown_2037F24
	ldrh r0, [r4, 0x1E]
	strb r0, [r1]
	movs r3, 0x1E
	ldrsh r1, [r4, r3]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080DD526
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DD526:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD52C: .4byte gUnknown_3005090
_080DD530: .4byte gUnknown_2037F24
	thumb_func_end sub_80DD4D4

	.align 2, 0 @ Don't pad with nop.
