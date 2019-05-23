	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B5268
sub_80B5268: @ 80B5268
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B52C4 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080B52C8 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_8075678
	ldr r0, _080B52CC @ =sub_80B52D0
	str r0, [r4, 0x1C]
	movs r0, 0x10
	strh r0, [r4, 0x3A]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r4, 0x3A]
	movs r0, 0x52
	bl SetGpuReg
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B52C4: .4byte gBattleAnimArgs
_080B52C8: .4byte gBattleAnimTarget
_080B52CC: .4byte sub_80B52D0
	thumb_func_end sub_80B5268

	thumb_func_start sub_80B52D0
sub_80B52D0: @ 80B52D0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80B53C0
	adds r0, r4, 0
	bl sub_80755E0
	lsls r0, 24
	cmp r0, 0
	beq _080B52F0
	ldr r0, _080B52EC @ =sub_80B5344
	str r0, [r4, 0x1C]
	b _080B533A
	.align 2, 0
_080B52EC: .4byte sub_80B5344
_080B52F0:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080B5328
	cmp r2, 0xC4
	ble _080B533A
_080B5328:
	lsls r0, 16
	cmp r0, 0
	ble _080B533A
	ldr r0, _080B5340 @ =gUnknown_2037F24
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xBD
	bl PlaySE12WithPanning
_080B533A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5340: .4byte gUnknown_2037F24
	thumb_func_end sub_80B52D0

	thumb_func_start sub_80B5344
sub_80B5344: @ 80B5344
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80755E0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080B538A
	cmp r2, 0xC4
	ble _080B5396
_080B538A:
	lsls r0, 16
	cmp r0, 0
	ble _080B5396
	movs r0, 0xBD
	bl PlaySE
_080B5396:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B53B4
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B53B0 @ =sub_8074F88
	str r0, [r4, 0x1C]
	b _080B53BA
	.align 2, 0
_080B53B0: .4byte sub_8074F88
_080B53B4:
	adds r0, r4, 0
	bl sub_80B53C0
_080B53BA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5344

	thumb_func_start sub_80B53C0
sub_80B53C0: @ 80B53C0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0xFF
	ble _080B53E4
	adds r0, r2, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	ldr r1, _080B53E0 @ =0x010d0000
	cmp r0, r1
	bne _080B544A
	movs r0, 0
	b _080B5448
	.align 2, 0
_080B53E0: .4byte 0x010d0000
_080B53E4:
	ldrh r1, [r4, 0x3C]
	adds r3, r1, 0x1
	strh r3, [r4, 0x3C]
	movs r0, 0xFF
	ands r0, r1
	cmp r0, 0
	bne _080B544A
	ldr r1, _080B5408 @ =0xffffff00
	ands r1, r3
	strh r1, [r4, 0x3C]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080B540C
	adds r0, r2, 0x1
	b _080B540E
	.align 2, 0
_080B5408: .4byte 0xffffff00
_080B540C:
	subs r0, r2, 0x1
_080B540E:
	strh r0, [r4, 0x3A]
	ldrh r0, [r4, 0x3A]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B5430
	cmp r0, 0x10
	bne _080B543C
_080B5430:
	ldrh r0, [r4, 0x3C]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	eors r0, r1
	strh r0, [r4, 0x3C]
_080B543C:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B544A
	movs r0, 0x80
	lsls r0, 1
_080B5448:
	strh r0, [r4, 0x3A]
_080B544A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B53C0

	thumb_func_start sub_80B5450
sub_80B5450: @ 80B5450
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r1, _080B546C @ =sub_80B5470
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B546C: .4byte sub_80B5470
	thumb_func_end sub_80B5450

	thumb_func_start sub_80B5470
sub_80B5470: @ 80B5470
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x82
	bhi _080B54A4
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x8
	b _080B54AE
_080B54A4:
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
_080B54AE:
	orrs r1, r0
	strb r1, [r4, 0x5]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x13
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x50
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3D
	bne _080B54E0
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B54E0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5470

	thumb_func_start sub_80B54E8
sub_80B54E8: @ 80B54E8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80758E0
	adds r0, r4, 0
	movs r1, 0x80
	movs r2, 0x80
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _080B5560 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r1, _080B5564 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x80
	strh r1, [r0, 0x8]
	ldr r1, _080B5568 @ =gBattleAnimArgs
	ldrh r1, [r1]
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r1, 0x10
	strh r1, [r0, 0xE]
	ldr r1, _080B556C @ =sub_80B5570
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5560: .4byte gSprites
_080B5564: .4byte gTasks
_080B5568: .4byte gBattleAnimArgs
_080B556C: .4byte sub_80B5570
	thumb_func_end sub_80B54E8

	thumb_func_start sub_80B5570
sub_80B5570: @ 80B5570
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B55C0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080B55B8
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0xC]
	adds r1, 0x1
	strh r1, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	bne _080B55B8
	ldr r0, _080B55C4 @ =sub_80B55C8
	str r0, [r4]
_080B55B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B55C0: .4byte gTasks
_080B55C4: .4byte sub_80B55C8
	thumb_func_end sub_80B5570

	thumb_func_start sub_80B55C8
sub_80B55C8: @ 80B55C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080B55EC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080B55F0
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	b _080B5634
	.align 2, 0
_080B55EC: .4byte gTasks
_080B55F0:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r1, r0, 24
	ldrh r0, [r4, 0x8]
	adds r0, 0x8
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _080B5618
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	adds r0, r1, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	b _080B5634
_080B5618:
	adds r0, r1, 0
	bl sub_8075980
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
_080B5634:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B55C8

	thumb_func_start sub_80B563C
sub_80B563C: @ 80B563C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r5, [r4, 0x20]
	ldrh r6, [r4, 0x22]
	ldr r0, _080B56D8 @ =gBattleAnimAttacker
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	mov r9, r1
	strh r0, [r4, 0x20]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	mov r1, r9
	strh r1, [r4, 0x2E]
	ldr r2, _080B56DC @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r4, 0x30]
	ldrh r1, [r2, 0x2]
	strh r1, [r4, 0x32]
	ldrh r1, [r2, 0x4]
	strh r1, [r4, 0x34]
	ldrh r1, [r4, 0x20]
	lsls r1, 4
	strh r1, [r4, 0x36]
	lsls r0, 4
	strh r0, [r4, 0x38]
	lsls r5, 16
	asrs r5, 16
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	subs r5, r0
	lsls r5, 4
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r1, 1
	adds r0, r5, 0
	str r2, [sp]
	bl __divsi3
	strh r0, [r4, 0x3A]
	lsls r6, 16
	asrs r6, 16
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	subs r6, r0
	lsls r6, 4
	ldr r2, [sp]
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r1, 1
	adds r0, r6, 0
	bl __divsi3
	strh r0, [r4, 0x3C]
	ldr r0, _080B56E0 @ =sub_80B56E4
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B56D8: .4byte gBattleAnimAttacker
_080B56DC: .4byte gBattleAnimArgs
_080B56E0: .4byte sub_80B56E4
	thumb_func_end sub_80B563C

	thumb_func_start sub_80B56E4
sub_80B56E4: @ 80B56E4
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080B572E
	cmp r0, 0x1
	bgt _080B56FA
	cmp r0, 0
	beq _080B5704
	b _080B57F2
_080B56FA:
	cmp r0, 0x2
	beq _080B5798
	cmp r0, 0x3
	beq _080B57EC
	b _080B57F2
_080B5704:
	ldrh r0, [r5, 0x3A]
	ldrh r2, [r5, 0x36]
	adds r0, r2
	strh r0, [r5, 0x36]
	ldrh r1, [r5, 0x3C]
	ldrh r2, [r5, 0x38]
	adds r1, r2
	strh r1, [r5, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x30]
	subs r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	cmp r0, 0
	bgt _080B57F2
	b _080B57DE
_080B572E:
	ldrh r0, [r5, 0x32]
	subs r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	cmp r0, 0
	bgt _080B57F2
	ldr r4, _080B5794 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x30]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x20]
	lsls r0, 4
	strh r0, [r5, 0x36]
	ldrh r0, [r5, 0x22]
	lsls r0, 4
	strh r0, [r5, 0x38]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	subs r0, r1
	lsls r0, 4
	movs r2, 0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0x3A]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	subs r0, r1
	lsls r0, 4
	movs r2, 0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0x3C]
	b _080B57DE
	.align 2, 0
_080B5794: .4byte gBattleAnimTarget
_080B5798:
	ldrh r0, [r5, 0x3A]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r1, [r5, 0x3C]
	ldrh r2, [r5, 0x38]
	adds r1, r2
	strh r1, [r5, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x34]
	subs r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	cmp r0, 0
	bgt _080B57F2
	ldr r4, _080B57E8 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_080B57DE:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080B57F2
	.align 2, 0
_080B57E8: .4byte gBattleAnimTarget
_080B57EC:
	adds r0, r5, 0
	bl move_anim_8074EE0
_080B57F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B56E4

	thumb_func_start sub_80B57F8
sub_80B57F8: @ 80B57F8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r0, _080B580C @ =sub_80B5810
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B580C: .4byte sub_80B5810
	thumb_func_end sub_80B57F8

	thumb_func_start sub_80B5810
sub_80B5810: @ 80B5810
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r5, 0
	movs r6, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B58A6
	adds r1, r3, 0
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x4
	ands r0, r2
	adds r4, r1, 0
	cmp r0, 0
	bne _080B583A
	movs r0, 0x4
	orrs r0, r2
	strb r0, [r4]
_080B583A:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080B584A
	cmp r0, 0x1
	beq _080B5854
	movs r6, 0x1
	b _080B585E
_080B584A:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x2
	bne _080B585E
	b _080B5862
_080B5854:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bne _080B585E
	movs r5, 0x1
_080B585E:
	cmp r5, 0
	beq _080B5894
_080B5862:
	ldrb r2, [r4]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0x32]
	strh r1, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080B58A6
	strh r1, [r3, 0x32]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080B58A6
_080B5894:
	cmp r6, 0
	beq _080B58A0
	adds r0, r3, 0
	bl DestroyAnimSprite
	b _080B58A6
_080B58A0:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
_080B58A6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5810

	thumb_func_start sub_80B58AC
sub_80B58AC: @ 80B58AC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080B58D8 @ =gTasks
	adds r5, r0, r1
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	movs r6, 0
	movs r1, 0
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bge _080B58DC
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080B59B8
	.align 2, 0
_080B58D8: .4byte gTasks
_080B58DC:
	strh r1, [r5, 0xA]
	movs r0, 0xF
	strh r0, [r5, 0xC]
	movs r0, 0x2
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r5, 0xE]
	lsls r1, 8
	ldrh r0, [r5, 0xC]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r4, _080B5944 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x50
	strh r1, [r0, 0x2E]
	ldr r0, _080B5948 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B5950
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080B594C @ =0x0000ff70
	strh r1, [r0, 0x30]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x70
	b _080B596E
	.align 2, 0
_080B5944: .4byte gSprites
_080B5948: .4byte gBattleAnimTarget
_080B594C: .4byte 0x0000ff70
_080B5950:
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x90
	strh r1, [r0, 0x30]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080B59C0 @ =0x0000ff90
_080B596E:
	strh r1, [r0, 0x32]
	ldr r4, _080B59C4 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0
	strh r2, [r0, 0x34]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x36]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080B59C8 @ =SpriteCallbackDummy
	bl StoreSpriteCallbackInData6
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080B59CC @ =sub_8074D00
	str r1, [r0]
	ldr r0, _080B59D0 @ =sub_80B59D4
	str r0, [r5]
_080B59B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B59C0: .4byte 0x0000ff90
_080B59C4: .4byte gSprites
_080B59C8: .4byte SpriteCallbackDummy
_080B59CC: .4byte sub_8074D00
_080B59D0: .4byte sub_80B59D4
	thumb_func_end sub_80B58AC

	thumb_func_start sub_80B59D4
sub_80B59D4: @ 80B59D4
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B59F8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B5A78
	cmp r0, 0x1
	bgt _080B59FC
	cmp r0, 0
	beq _080B5A02
	b _080B5AA4
	.align 2, 0
_080B59F8: .4byte gTasks
_080B59FC:
	cmp r0, 0x2
	beq _080B5A9E
	b _080B5AA4
_080B5A02:
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x3
	ands r0, r1
	strh r0, [r4, 0x12]
	cmp r0, 0x1
	bne _080B5A20
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080B5A20
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
_080B5A20:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _080B5A36
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B5A36
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
_080B5A36:
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0xC]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r1, [r4, 0xC]
	movs r0, 0x80
	lsls r0, 13
	cmp r1, r0
	bne _080B5AA4
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _080B5AA4
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B5A74 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
	movs r0, 0x1
	strh r0, [r4, 0x10]
	b _080B5AA4
	.align 2, 0
_080B5A74: .4byte gSprites
_080B5A78:
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B5AA4
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	b _080B5AA4
_080B5A9E:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B5AA4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B59D4

	thumb_func_start sub_80B5AAC
sub_80B5AAC: @ 80B5AAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080B5ACC @ =gTasks
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	ldr r2, _080B5AD0 @ =sub_80B5AD4
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080B5ACC: .4byte gTasks
_080B5AD0: .4byte sub_80B5AD4
	thumb_func_end sub_80B5AAC

	thumb_func_start sub_80B5AD4
sub_80B5AD4: @ 80B5AD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080B5B0C @ =gTasks
	adds r5, r0, r1
	ldr r0, _080B5B10 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080B5B00
	b _080B5D22
_080B5B00:
	lsls r0, 2
	ldr r1, _080B5B14 @ =_080B5B18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B5B0C: .4byte gTasks
_080B5B10: .4byte gBattleAnimTarget
_080B5B14: .4byte _080B5B18
	.align 2, 0
_080B5B18:
	.4byte _080B5B2C
	.4byte _080B5C2C
	.4byte _080B5C70
	.4byte _080B5CD8
	.4byte _080B5D04
_080B5B2C:
	ldr r7, _080B5B64 @ =0x00002771
	adds r0, r7, 0
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	mov r8, r2
	strh r0, [r5, 0x24]
	cmp r0, 0xFF
	beq _080B5B5A
	cmp r0, 0xF
	beq _080B5B5A
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bge _080B5B68
	adds r0, r7, 0
	bl FreeSpritePaletteByTag
_080B5B5A:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080B5D28
	.align 2, 0
_080B5B64: .4byte 0x00002771
_080B5B68:
	ldr r4, _080B5C14 @ =gSprites
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r2, [r5, 0x24]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldr r0, _080B5C18 @ =gUnknown_2024018
	ldr r1, [r0]
	ldr r0, _080B5C1C @ =gBattleAnimTarget
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 31
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	mov r2, r8
	strh r2, [r5, 0xA]
	strh r2, [r5, 0xC]
	movs r0, 0x10
	strh r0, [r5, 0xE]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r5, 0x10]
	cmp r6, 0x1
	bne _080B5C20
	movs r1, 0x80
	lsls r1, 2
	b _080B5C24
	.align 2, 0
_080B5C14: .4byte gSprites
_080B5C18: .4byte gUnknown_2024018
_080B5C1C: .4byte gBattleAnimTarget
_080B5C20:
	movs r1, 0x80
	lsls r1, 3
_080B5C24:
	movs r0, 0
	bl ClearGpuRegBits
	b _080B5D22
_080B5C2C:
	movs r1, 0x24
	ldrsh r0, [r5, r1]
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r5, 0x24]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	lsls r0, 1
	ldr r1, _080B5C60 @ =gPlttBufferUnfaded
	adds r0, r1
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	lsls r1, 1
	ldr r2, _080B5C64 @ =gPlttBufferFaded
	adds r1, r2
	ldr r2, _080B5C68 @ =0x04000008
	bl CpuSet
	ldrh r0, [r5, 0x10]
	ldr r3, _080B5C6C @ =0x00003c0d
	movs r1, 0x10
	movs r2, 0xA
	bl BlendPalette
	b _080B5D22
	.align 2, 0
_080B5C60: .4byte gPlttBufferUnfaded
_080B5C64: .4byte gPlttBufferFaded
_080B5C68: .4byte 0x04000008
_080B5C6C: .4byte 0x00003c0d
_080B5C70:
	ldr r2, _080B5CAC @ =gSprites
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	subs r1, 0x20
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _080B5C90
	movs r2, 0
_080B5C90:
	cmp r6, 0x1
	bne _080B5CB0
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x4
	str r2, [sp, 0x4]
	str r6, [sp, 0x8]
	b _080B5CC8
	.align 2, 0
_080B5CAC: .4byte gSprites
_080B5CB0:
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x8
	str r2, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
_080B5CC8:
	movs r2, 0x2
	movs r3, 0x6
	bl ScanlineEffect_InitWave
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	b _080B5D22
_080B5CD8:
	cmp r6, 0x1
	bne _080B5CEC
	ldr r1, _080B5CE8 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	b _080B5CF4
	.align 2, 0
_080B5CE8: .4byte 0x00003f42
_080B5CEC:
	ldr r1, _080B5D00 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
_080B5CF4:
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	b _080B5D22
	.align 2, 0
_080B5D00: .4byte 0x00003f44
_080B5D04:
	cmp r6, 0x1
	bne _080B5D14
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl SetGpuRegBits
	b _080B5D1E
_080B5D14:
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	bl SetGpuRegBits
_080B5D1E:
	ldr r0, _080B5D34 @ =sub_80B5D38
	str r0, [r5]
_080B5D22:
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
_080B5D28:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D34: .4byte sub_80B5D38
	thumb_func_end sub_80B5AD4

	thumb_func_start sub_80B5D38
sub_80B5D38: @ 80B5D38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B5DC0 @ =gTasks
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x1
	ands r0, r1
	strh r0, [r4, 0x12]
	cmp r0, 0
	bne _080B5D70
	ldr r1, _080B5DC4 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	strh r0, [r4, 0xC]
_080B5D70:
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _080B5D92
	ldr r1, _080B5DC4 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	movs r1, 0x10
	subs r1, r0
	strh r1, [r4, 0xE]
_080B5D92:
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0xC]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	bne _080B5DBA
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080B5DC8 @ =sub_80B5DCC
	str r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
_080B5DBA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DC0: .4byte gTasks
_080B5DC4: .4byte gSineTable
_080B5DC8: .4byte sub_80B5DCC
	thumb_func_end sub_80B5D38

	thumb_func_start sub_80B5DCC
sub_80B5DCC: @ 80B5DCC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B5DFC @ =gTasks
	adds r4, r0, r1
	ldr r0, _080B5E00 @ =gBattleAnimTarget
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B5E38
	cmp r0, 0x1
	bgt _080B5E04
	cmp r0, 0
	beq _080B5E0A
	b _080B5EB4
	.align 2, 0
_080B5DFC: .4byte gTasks
_080B5E00: .4byte gBattleAnimTarget
_080B5E04:
	cmp r0, 0x2
	beq _080B5E4C
	b _080B5EB4
_080B5E0A:
	ldr r1, _080B5E28 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	cmp r6, 0x1
	bne _080B5E2C
	movs r1, 0x80
	lsls r1, 2
	b _080B5E30
	.align 2, 0
_080B5E28: .4byte gScanlineEffect
_080B5E2C:
	movs r1, 0x80
	lsls r1, 3
_080B5E30:
	movs r0, 0
	bl ClearGpuRegBits
	b _080B5EB4
_080B5E38:
	ldrh r0, [r4, 0x10]
	ldr r3, _080B5E48 @ =0x00003c0d
	movs r1, 0x10
	movs r2, 0
	bl BlendPalette
	b _080B5EB4
	.align 2, 0
_080B5E48: .4byte 0x00003c0d
_080B5E4C:
	ldr r3, _080B5E9C @ =gSprites
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	bl obj_delete_but_dont_free_vram
	ldr r0, _080B5EA0 @ =0x00002771
	bl FreeSpritePaletteByTag
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	cmp r6, 0x1
	bne _080B5EA4
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl SetGpuRegBits
	b _080B5EAE
	.align 2, 0
_080B5E9C: .4byte gSprites
_080B5EA0: .4byte 0x00002771
_080B5EA4:
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	bl SetGpuRegBits
_080B5EAE:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B5EB4:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5DCC

	thumb_func_start sub_80B5EC0
sub_80B5EC0: @ 80B5EC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	ldr r0, _080B5EFC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B5F08
	ldr r4, _080B5F00 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080B5F04 @ =gBattleAnimTarget
	b _080B5F2C
	.align 2, 0
_080B5EFC: .4byte gBattleAnimArgs
_080B5F00: .4byte gBattleAnimAttacker
_080B5F04: .4byte gBattleAnimTarget
_080B5F08:
	ldr r4, _080B5FD0 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080B5FD4 @ =gBattleAnimAttacker
_080B5F2C:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0xE0
	lsls r1, 13
	adds r0, r1
	lsrs r0, 16
	mov r9, r0
	mov r8, r5
	mov r2, r9
	subs r4, r2, r5
	lsls r4, 16
	lsrs r4, 16
	lsls r0, r6, 4
	strh r0, [r7, 0x2E]
	lsls r0, r5, 4
	strh r0, [r7, 0x30]
	mov r1, r10
	subs r0, r1, r6
	lsls r0, 4
	ldr r5, _080B5FD8 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r7, 0x32]
	lsls r4, 16
	asrs r4, 12
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl __divsi3
	strh r0, [r7, 0x34]
	ldrh r0, [r5, 0x2]
	strh r0, [r7, 0x36]
	mov r1, r10
	strh r1, [r7, 0x38]
	mov r2, r9
	strh r2, [r7, 0x3A]
	movs r1, 0x36
	ldrsh r0, [r7, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r7, 0x3C]
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r7, 0x5]
	strh r6, [r7, 0x20]
	mov r2, r8
	strh r2, [r7, 0x22]
	ldr r0, _080B5FDC @ =sub_80B5FE0
	str r0, [r7, 0x1C]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5FD0: .4byte gBattleAnimTarget
_080B5FD4: .4byte gBattleAnimAttacker
_080B5FD8: .4byte gBattleAnimArgs
_080B5FDC: .4byte sub_80B5FE0
	thumb_func_end sub_80B5EC0

	thumb_func_start sub_80B5FE0
sub_80B5FE0: @ 80B5FE0
	push {r4,lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x36]
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080B6018
	ldrh r0, [r2, 0x32]
	ldrh r4, [r2, 0x2E]
	adds r0, r4
	strh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x34]
	ldrh r4, [r2, 0x30]
	adds r1, r4
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r2, 0x22]
	subs r0, r3, 0x1
	strh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080B6018
	strh r0, [r2, 0x2E]
_080B6018:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5FE0

	thumb_func_start sub_80B6020
sub_80B6020: @ 80B6020
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B6170 @ =gTasks
	adds r1, r0
	str r1, [sp]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0
	ldr r1, [sp]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	strh r0, [r1, 0x16]
	strh r0, [r1, 0x18]
	movs r0, 0x10
	strh r0, [r1, 0x1A]
	ldr r2, _080B6174 @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r1, 0x1C]
	ldr r4, _080B6178 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8076B2C
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B6090
	b _080B618C
_080B6090:
	movs r4, 0
_080B6092:
	lsls r1, r4, 16
	asrs r3, r1, 16
	ldr r0, _080B6178 @ =gBattleAnimAttacker
	ldrb r2, [r0]
	str r1, [sp, 0x10]
	cmp r3, r2
	beq _080B615E
	movs r0, 0x2
	eors r2, r0
	cmp r3, r2
	beq _080B615E
	lsls r0, r4, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _080B615E
	ldr r6, [sp, 0x4]
	ldr r3, [sp, 0x8]
	lsls r0, r3, 16
	asrs r7, r0, 16
	ldr r0, _080B617C @ =gUnknown_83E7668
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x37
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x40
	beq _080B615E
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8076B2C
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r0, r8
	lsls r5, r0, 4
	add r5, r8
	lsls r5, 2
	ldr r1, _080B6180 @ =gSprites
	adds r4, r5, r1
	lsls r0, r6, 4
	strh r0, [r4, 0x2E]
	lsls r0, r7, 4
	strh r0, [r4, 0x30]
	mov r2, r10
	subs r0, r2, r6
	lsls r0, 4
	ldr r3, _080B6174 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	lsls r0, r3, 16
	asrs r0, 16
	subs r0, r7
	lsls r0, 4
	ldr r2, _080B6174 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080B6174 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x36]
	mov r2, r10
	strh r2, [r4, 0x38]
	mov r3, r9
	strh r3, [r4, 0x3A]
	ldr r0, _080B6184 @ =gSprites + 0x1C
	adds r5, r0
	ldr r0, _080B6188 @ =sub_80B5FE0
	str r0, [r5]
	ldr r2, [sp]
	movs r3, 0x20
	ldrsh r1, [r2, r3]
	adds r1, 0xD
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1
	mov r1, r8
	strh r1, [r0]
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
_080B615E:
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080B6092
	b _080B6210
	.align 2, 0
_080B6170: .4byte gTasks
_080B6174: .4byte gBattleAnimArgs
_080B6178: .4byte gBattleAnimAttacker
_080B617C: .4byte gUnknown_83E7668
_080B6180: .4byte gSprites
_080B6184: .4byte gSprites + 0x1C
_080B6188: .4byte sub_80B5FE0
_080B618C:
	ldr r0, _080B6228 @ =gUnknown_83E7668
	ldr r7, [sp, 0x4]
	ldr r2, [sp, 0x8]
	lsls r1, r2, 16
	asrs r1, 16
	str r1, [sp, 0xC]
	adds r1, r7, 0
	ldr r2, [sp, 0xC]
	movs r3, 0x37
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x40
	beq _080B6210
	movs r3, 0x30
	mov r10, r3
	movs r0, 0x28
	mov r9, r0
	ldr r6, _080B622C @ =gSprites
	mov r1, r8
	lsls r5, r1, 4
	add r5, r8
	lsls r5, 2
	adds r4, r5, r6
	lsls r0, r7, 4
	strh r0, [r4, 0x2E]
	ldr r2, [sp, 0xC]
	lsls r0, r2, 4
	strh r0, [r4, 0x30]
	subs r0, r3, r7
	lsls r0, 4
	ldr r3, _080B6230 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	ldr r1, [sp, 0xC]
	subs r0, r3, r1
	lsls r0, 4
	ldr r2, _080B6230 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080B6230 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x36]
	mov r2, r10
	strh r2, [r4, 0x38]
	mov r3, r9
	strh r3, [r4, 0x3A]
	adds r6, 0x1C
	adds r5, r6
	ldr r0, _080B6234 @ =sub_80B5FE0
	str r0, [r5]
	mov r1, r8
	ldr r0, [sp]
	strh r1, [r0, 0x22]
	movs r0, 0x1
	ldr r2, [sp]
	strh r0, [r2, 0x20]
_080B6210:
	ldr r0, _080B6238 @ =sub_80B623C
	ldr r3, [sp]
	str r0, [r3]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6228: .4byte gUnknown_83E7668
_080B622C: .4byte gSprites
_080B6230: .4byte gBattleAnimArgs
_080B6234: .4byte sub_80B5FE0
_080B6238: .4byte sub_80B623C
	thumb_func_end sub_80B6020

	thumb_func_start sub_80B623C
sub_80B623C: @ 80B623C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B6260 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080B62F2
	cmp r1, 0x1
	bgt _080B6264
	cmp r1, 0
	beq _080B6272
	b _080B63AE
	.align 2, 0
_080B6260: .4byte gTasks
_080B6264:
	cmp r1, 0x2
	bne _080B626A
	b _080B6384
_080B626A:
	cmp r1, 0x3
	bne _080B6270
	b _080B6398
_080B6270:
	b _080B63AE
_080B6272:
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B62D8
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B62D8
	strh r1, [r4, 0x12]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B62A8
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B62B6
	adds r0, r1, 0x1
	strh r0, [r4, 0x18]
	b _080B62B6
_080B62A8:
	ldrh r1, [r4, 0x1A]
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B62B6
	subs r0, r1, 0x1
	strh r0, [r4, 0x1A]
_080B62B6:
	ldrh r1, [r4, 0x1A]
	lsls r1, 8
	ldrh r0, [r4, 0x18]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0x17
	ble _080B62D8
	movs r0, 0
	strh r0, [r4, 0x16]
	movs r0, 0x1
	strh r0, [r4, 0x14]
_080B62D8:
	ldrh r1, [r4, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B62E8
	subs r0, r1, 0x1
	strh r0, [r4, 0x1C]
	b _080B63AE
_080B62E8:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080B63AE
	b _080B6390
_080B62F2:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B63AE
	movs r0, 0
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	ands r0, r1
	lsls r0, 16
	cmp r0, 0
	beq _080B6322
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6330
	subs r0, r1, 0x1
	strh r0, [r4, 0x18]
	b _080B6330
_080B6322:
	ldrh r1, [r4, 0x1A]
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B6330
	adds r0, r1, 0x1
	strh r0, [r4, 0x1A]
_080B6330:
	ldrh r1, [r4, 0x1A]
	lsls r1, 8
	ldrh r0, [r4, 0x18]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	ldr r1, [r4, 0x18]
	movs r0, 0x80
	lsls r0, 13
	cmp r1, r0
	bne _080B63AE
	movs r5, 0
	b _080B6374
_080B6350:
	adds r1, r5, 0
	adds r1, 0xD
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6380 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080B6374:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _080B6350
	b _080B6390
	.align 2, 0
_080B6380: .4byte gSprites
_080B6384:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	cmp r0, 0
	ble _080B63AE
_080B6390:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B63AE
_080B6398:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B63AE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B623C

	thumb_func_start sub_80B63B4
sub_80B63B4: @ 80B63B4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080B6400 @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B6404 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r1, _080B6408 @ =0x00003f3f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _080B640C @ =0x00003f1f
	movs r0, 0x4A
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0xC8
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0x10
	bl SetGpuReg
	ldr r0, _080B6410 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B63FC
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	beq _080B6414
_080B63FC:
	movs r6, 0x28
	b _080B6416
	.align 2, 0
_080B6400: .4byte gUnknown_2022984
_080B6404: .4byte gUnknown_2022986
_080B6408: .4byte 0x00003f3f
_080B640C: .4byte 0x00003f1f
_080B6410: .4byte gBattleAnimAttacker
_080B6414:
	movs r6, 0xC8
_080B6416:
	ldr r1, _080B6454 @ =gUnknown_2022984
	lsls r3, r6, 16
	asrs r2, r3, 16
	lsls r0, r2, 8
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _080B6458 @ =gUnknown_2022986
	movs r5, 0x28
	ldr r0, _080B645C @ =0x00002828
	strh r0, [r1]
	lsrs r3, 16
	movs r1, 0xF0
	subs r1, r2
	movs r4, 0x48
	ldr r2, _080B6460 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r2
	strh r3, [r0, 0xA]
	strh r1, [r0, 0xC]
	strh r5, [r0, 0xE]
	strh r4, [r0, 0x10]
	strh r6, [r0, 0x12]
	strh r5, [r0, 0x14]
	ldr r1, _080B6464 @ =sub_80B6468
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6454: .4byte gUnknown_2022984
_080B6458: .4byte gUnknown_2022986
_080B645C: .4byte 0x00002828
_080B6460: .4byte gTasks
_080B6464: .4byte sub_80B6468
	thumb_func_end sub_80B63B4

	thumb_func_start sub_80B6468
sub_80B6468: @ 80B6468
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B6588 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0x8]
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
	ldrh r5, [r4, 0xA]
	ldrh r7, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	mov r10, r0
	ldrh r2, [r4, 0x10]
	str r2, [sp, 0xC]
	ldrh r0, [r4, 0x12]
	ldrh r2, [r4, 0x14]
	mov r8, r2
	lsls r1, 16
	asrs r6, r1, 16
	cmp r6, 0xF
	ble _080B64A4
	b _080B6594
_080B64A4:
	lsls r0, 16
	asrs r0, 16
	bl __floatsidf
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	lsls r0, r5, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080B658C @ =0x3fb00000
	ldr r3, _080B6590 @ =0x00000000
	bl __muldf3
	adds r5, r1, 0
	adds r4, r0, 0
	adds r0, r6, 0
	bl __floatsidf
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	adds r1, r5, 0
	adds r0, r4, 0
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r0, r7, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080B658C @ =0x3fb00000
	ldr r3, _080B6590 @ =0x00000000
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	bl __floatsidf
	adds r5, r1, 0
	adds r4, r0, 0
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080B658C @ =0x3fb00000
	ldr r3, _080B6590 @ =0x00000000
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, [sp, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080B658C @ =0x3fb00000
	ldr r3, _080B6590 @ =0x00000000
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r5, r0, 16
	b _080B65C2
	.align 2, 0
_080B6588: .4byte gTasks
_080B658C: .4byte 0x3fb00000
_080B6590: .4byte 0x00000000
_080B6594:
	movs r2, 0
	mov r9, r2
	movs r7, 0xF0
	movs r6, 0
	movs r5, 0x70
	str r6, [sp]
	str r6, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0
	bl sub_8075BE8
	lsls r0, 16
	lsrs r0, 16
	str r6, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080B65E4 @ =sub_80B65F0
	str r0, [r4]
_080B65C2:
	ldr r1, _080B65E8 @ =gUnknown_2022984
	mov r2, r9
	lsls r0, r2, 8
	orrs r7, r0
	strh r7, [r1]
	ldr r1, _080B65EC @ =gUnknown_2022986
	lsls r0, r6, 8
	orrs r5, r0
	strh r5, [r1]
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B65E4: .4byte sub_80B65F0
_080B65E8: .4byte gUnknown_2022984
_080B65EC: .4byte gUnknown_2022986
	thumb_func_end sub_80B6468

	thumb_func_start sub_80B65F0
sub_80B65F0: @ 80B65F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B663C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080B6636
	ldr r0, _080B6640 @ =gUnknown_2022984
	strh r1, [r0]
	ldr r0, _080B6644 @ =gUnknown_2022986
	strh r1, [r0]
	ldr r4, _080B6648 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080B6636:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B663C: .4byte gPaletteFade
_080B6640: .4byte gUnknown_2022984
_080B6644: .4byte gUnknown_2022986
_080B6648: .4byte 0x00003f3f
	thumb_func_end sub_80B65F0

	thumb_func_start sub_80B664C
sub_80B664C: @ 80B664C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r0, _080B6678 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080B6680
	movs r2, 0x18
	ldr r3, _080B667C @ =0x0000fffe
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r4, 0x3]
	b _080B6684
	.align 2, 0
_080B6678: .4byte gBattleAnimAttacker
_080B667C: .4byte 0x0000fffe
_080B6680:
	ldr r2, _080B66A0 @ =0x0000ffe8
	movs r3, 0x2
_080B6684:
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	strh r3, [r4, 0x30]
	movs r0, 0x3C
	strh r0, [r4, 0x2E]
	ldr r0, _080B66A4 @ =sub_80B66A8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B66A0: .4byte 0x0000ffe8
_080B66A4: .4byte sub_80B66A8
	thumb_func_end sub_80B664C

	thumb_func_start sub_80B66A8
sub_80B66A8: @ 80B66A8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080B66BA
	subs r0, r1, 0x1
	b _080B671E
_080B66BA:
	ldrh r0, [r3, 0x30]
	ldrh r4, [r3, 0x24]
	adds r1, r0, r4
	strh r1, [r3, 0x24]
	adds r0, r1, 0x7
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xE
	bls _080B6720
	ldrh r0, [r3, 0x20]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r0, 0
	strh r0, [r3, 0x24]
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r4, _080B670C @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080B6710 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080B671C
	movs r0, 0x1E
	strh r0, [r3, 0x2E]
	ldr r0, _080B6714 @ =sub_8074C44
	str r0, [r3, 0x1C]
	ldr r1, _080B6718 @ =sub_80B6728
	adds r0, r3, 0
	bl StoreSpriteCallbackInData6
	b _080B6720
	.align 2, 0
_080B670C: .4byte 0x000003ff
_080B6710: .4byte 0xfffffc00
_080B6714: .4byte sub_8074C44
_080B6718: .4byte sub_80B6728
_080B671C:
	movs r0, 0x28
_080B671E:
	strh r0, [r3, 0x2E]
_080B6720:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B66A8

	thumb_func_start sub_80B6728
sub_80B6728: @ 80B6728
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _080B6752
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
	b _080B6796
_080B6752:
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bgt _080B6762
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080B6796
_080B6762:
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	movs r1, 0x10
	subs r1, r0
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080B6796
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B679C @ =sub_80B67A0
	str r0, [r4, 0x1C]
_080B6796:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B679C: .4byte sub_80B67A0
	thumb_func_end sub_80B6728

	thumb_func_start sub_80B67A0
sub_80B67A0: @ 80B67A0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080B67CC @ =gUnknown_2022984
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B67D0 @ =gUnknown_2022986
	strh r1, [r0]
	adds r0, r4, 0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B67CC: .4byte gUnknown_2022984
_080B67D0: .4byte gUnknown_2022986
	thumb_func_end sub_80B67A0

	thumb_func_start sub_80B67D4
sub_80B67D4: @ 80B67D4
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r1, 0xC
	bl Sin
	strh r0, [r5, 0x24]
	ldr r0, _080B683C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B67F8
	ldrh r0, [r5, 0x24]
	negs r0, r0
	strh r0, [r5, 0x24]
_080B67F8:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080B6844
	ldr r0, _080B6840 @ =0x0000050b
	strh r0, [r5, 0x3A]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldrh r1, [r5, 0x3A]
	movs r0, 0x52
	bl SetGpuReg
	b _080B689C
	.align 2, 0
_080B683C: .4byte gBattleAnimAttacker
_080B6840: .4byte 0x0000050b
_080B6844:
	cmp r0, 0x1E
	ble _080B689C
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x3A]
	lsls r0, r1, 16
	asrs r0, 24
	lsls r0, 16
	movs r6, 0xFF
	ands r6, r1
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r7, r0, 16
	cmp r7, 0x10
	bls _080B6868
	movs r7, 0x10
_080B6868:
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r0, 0
	bge _080B6874
	movs r6, 0
_080B6874:
	lsls r4, r7, 8
	orrs r4, r6
	lsls r1, r4, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	strh r4, [r5, 0x3A]
	cmp r7, 0x10
	bne _080B689C
	cmp r6, 0
	bne _080B689C
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B68A4 @ =sub_80B68A8
	str r0, [r5, 0x1C]
_080B689C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B68A4: .4byte sub_80B68A8
	thumb_func_end sub_80B67D4

	thumb_func_start sub_80B68A8
sub_80B68A8: @ 80B68A8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r4, 0
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B68A8

	thumb_func_start sub_80B68C8
sub_80B68C8: @ 80B68C8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080B6960 @ =gTasks
	adds r4, r0
	movs r6, 0
	strh r6, [r4, 0x8]
	movs r0, 0x10
	mov r8, r0
	mov r0, r8
	strh r0, [r4, 0xA]
	ldr r5, _080B6964 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	ldrb r0, [r5]
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8076B2C
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	asrs r1, 1
	adds r1, 0x8
	strh r1, [r4, 0x1E]
	strh r6, [r4, 0x16]
	ldrb r0, [r5]
	bl sub_8076884
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	ldrb r0, [r5]
	bl sub_807685C
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x2
	strh r0, [r4, 0x14]
	strh r6, [r4, 0xE]
	mov r0, r8
	strh r0, [r4, 0x10]
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	strh r6, [r4, 0x18]
	ldr r0, _080B6968 @ =sub_80B696C
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6960: .4byte gTasks
_080B6964: .4byte gBattleAnimAttacker
_080B6968: .4byte sub_80B696C
	thumb_func_end sub_80B68C8

	thumb_func_start sub_80B696C
sub_80B696C: @ 80B696C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080B6990 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080B6986
	b _080B6AF2
_080B6986:
	lsls r0, 2
	ldr r1, _080B6994 @ =_080B6998
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B6990: .4byte gTasks
_080B6994: .4byte _080B6998
	.align 2, 0
_080B6998:
	.4byte _080B69B0
	.4byte _080B6A20
	.4byte _080B6A62
	.4byte _080B6A76
	.4byte _080B6ACC
	.4byte _080B6ADC
_080B69B0:
	movs r6, 0
_080B69B2:
	movs r2, 0x1A
	ldrsh r1, [r4, r2]
	movs r0, 0x1C
	ldrsh r2, [r4, r0]
	ldrb r3, [r4, 0x14]
	ldr r0, _080B6A14 @ =gUnknown_83E76E0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080B6A06
	ldr r1, _080B6A18 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r1
	strh r7, [r5, 0x2E]
	ldr r0, _080B6A1C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _080B69E8
	movs r1, 0x1
_080B69E8:
	strh r1, [r5, 0x30]
	movs r0, 0x2A
	muls r0, r6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x1E]
	strh r0, [r5, 0x34]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 1
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_080B6A06:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080B69B2
	b _080B6AD4
	.align 2, 0
_080B6A14: .4byte gUnknown_83E76E0
_080B6A18: .4byte gSprites
_080B6A1C: .4byte gBattleAnimAttacker
_080B6A20:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B6A3E
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0xD
	bgt _080B6A4C
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080B6A4C
_080B6A3E:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	ble _080B6A4C
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
_080B6A4C:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, 0xE]
	ldrh r1, [r4, 0x10]
	cmp r0, 0xE
	bne _080B6ABC
	cmp r1, 0x4
	bne _080B6ABC
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080B6AB6
_080B6A62:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080B6AF2
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080B6AD4
_080B6A76:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B6A94
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080B6AA2
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080B6AA2
_080B6A94:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080B6AA2
	adds r0, r1, 0x1
	strh r0, [r4, 0x10]
_080B6AA2:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, 0xE]
	ldrh r1, [r4, 0x10]
	cmp r0, 0
	bne _080B6ABC
	cmp r1, 0x10
	bne _080B6ABC
	movs r0, 0x1
	strh r0, [r4, 0x18]
_080B6AB6:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B6ABC:
	lsls r1, 8
	orrs r1, r2
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	b _080B6AF2
_080B6ACC:
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B6AF2
_080B6AD4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B6AF2
_080B6ADC:
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080B6AF2:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B696C

	thumb_func_start sub_80B6AF8
sub_80B6AF8: @ 80B6AF8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B6B0A
	ldrh r0, [r4, 0x32]
	adds r0, 0x2
	b _080B6B0E
_080B6B0A:
	ldrh r0, [r4, 0x32]
	subs r0, 0x2
_080B6B0E:
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x32]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7E
	bhi _080B6B50
	ldr r2, _080B6B4C @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x12]
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	b _080B6B64
	.align 2, 0
_080B6B4C: .4byte gTasks
_080B6B50:
	ldr r2, _080B6BB8 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x3
	ldrb r1, [r0, 0x12]
	ands r1, r2
_080B6B64:
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsls r0, 3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r1, 0x7
	bl Sin
	strh r0, [r4, 0x26]
	ldr r2, _080B6BB8 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0x18
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080B6BB2
	ldrh r0, [r1, 0x16]
	subs r0, 0x1
	strh r0, [r1, 0x16]
	adds r0, r4, 0
	bl DestroySprite
_080B6BB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6BB8: .4byte gTasks
	thumb_func_end sub_80B6AF8

	thumb_func_start sub_80B6BBC
sub_80B6BBC: @ 80B6BBC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080B6BDC @ =gTasks
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	ldr r2, _080B6BE0 @ =sub_80B6BE4
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080B6BDC: .4byte gTasks
_080B6BE0: .4byte sub_80B6BE4
	thumb_func_end sub_80B6BBC

	thumb_func_start sub_80B6BE4
sub_80B6BE4: @ 80B6BE4
	push {r4-r6,lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B6C18 @ =gTasks
	adds r6, r1, r0
	ldr r0, _080B6C1C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0x26
	ldrsh r0, [r6, r1]
	cmp r0, 0x7
	bls _080B6C0C
	b _080B6F1E
_080B6C0C:
	lsls r0, 2
	ldr r1, _080B6C20 @ =_080B6C24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B6C18: .4byte gTasks
_080B6C1C: .4byte gBattleAnimAttacker
_080B6C20: .4byte _080B6C24
	.align 2, 0
_080B6C24:
	.4byte _080B6C44
	.4byte _080B6CCC
	.4byte _080B6D28
	.4byte _080B6D8C
	.4byte _080B6E04
	.4byte _080B6E6C
	.4byte _080B6E82
	.4byte _080B6EEC
_080B6C44:
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0
	strh r0, [r6, 0xA]
	strh r0, [r6, 0xC]
	movs r0, 0x10
	strh r0, [r6, 0xE]
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x10]
	ldr r3, _080B6CC8 @ =gSprites
	movs r2, 0x10
	ldrsh r1, [r6, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsls r0, 28
	lsrs r0, 30
	strh r0, [r6, 0x12]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r6, 0x14]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r0, 0x10
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r0, 0x80
	strh r0, [r6, 0x16]
	b _080B6F1E
	.align 2, 0
_080B6CC8: .4byte gSprites
_080B6CCC:
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	movs r5, 0x1
	ands r5, r0
	cmp r5, 0
	beq _080B6CDC
	b _080B6F24
_080B6CDC:
	ldrh r0, [r6, 0x14]
	ldrb r2, [r6, 0xC]
	ldr r4, _080B6D08 @ =0x000066e0
	movs r1, 0x10
	adds r3, r4, 0
	bl BlendPalette
	ldrh r0, [r6, 0x16]
	ldrb r2, [r6, 0xC]
	movs r1, 0x10
	adds r3, r4, 0
	bl BlendPalette
	ldrh r1, [r6, 0xC]
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	cmp r0, 0xB
	bgt _080B6D0C
	adds r0, r1, 0x1
	strh r0, [r6, 0xC]
	b _080B6F24
	.align 2, 0
_080B6D08: .4byte 0x000066e0
_080B6D0C:
	strh r5, [r6, 0xA]
	strh r5, [r6, 0xC]
	ldr r1, _080B6D24 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	b _080B6F1E
	.align 2, 0
_080B6D24: .4byte 0x00003f44
_080B6D28:
	movs r0, 0x2
	movs r1, 0x3
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl SetAnimBgAttribute
	ldr r0, _080B6D7C @ =gBattle_BG2_X
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080B6D80 @ =gBattle_BG2_Y
	strh r1, [r4]
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x1A
	bl SetGpuReg
	add r0, sp, 0xC
	movs r1, 0x2
	bl sub_80752C8
	add r0, sp, 0xC
	ldrb r0, [r0, 0x9]
	ldr r1, _080B6D84 @ =gFile_graphics_battle_anims_backgrounds_scary_face_sheet
	add r2, sp, 0xC
	ldrh r2, [r2, 0xA]
	bl sub_80753B4
	ldr r0, _080B6D88 @ =gFile_graphics_battle_anims_backgrounds_scary_face_palette
	add r1, sp, 0xC
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080B6F1E
	.align 2, 0
_080B6D7C: .4byte gBattle_BG2_X
_080B6D80: .4byte gBattle_BG2_Y
_080B6D84: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_sheet
_080B6D88: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_palette
_080B6D8C:
	add r0, sp, 0xC
	movs r1, 0x2
	bl sub_80752C8
	movs r0, 0x80
	lsls r0, 6
	bl AllocZeroed
	adds r1, r0, 0
	ldr r5, _080B6DFC @ =gMonSpritesGfxPtr
	ldr r0, [r5]
	movs r4, 0xBE
	lsls r4, 1
	adds r0, r4
	str r1, [r0]
	ldr r0, _080B6E00 @ =gFile_graphics_battle_anims_backgrounds_scary_face_player_tilemap
	bl LZDecompressWram
	add r0, sp, 0xC
	ldrb r0, [r0, 0x8]
	ldr r1, [r5]
	adds r1, r4
	ldr r1, [r1]
	movs r2, 0x80
	lsls r2, 1
	movs r3, 0
	bl sub_80730C0
	add r0, sp, 0xC
	ldrb r0, [r0, 0x9]
	ldr r1, [r5]
	adds r1, r4
	ldr r1, [r1]
	movs r2, 0x20
	str r2, [sp]
	str r2, [sp, 0x4]
	movs r2, 0x11
	str r2, [sp, 0x8]
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldr r0, [r5]
	adds r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0
	str r1, [r0]
	b _080B6F1E
	.align 2, 0
_080B6DFC: .4byte gMonSpritesGfxPtr
_080B6E00: .4byte gFile_graphics_battle_anims_backgrounds_scary_face_player_tilemap
_080B6E04:
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B6E14
	b _080B6F24
_080B6E14:
	ldrh r1, [r6, 0xC]
	adds r1, 0x1
	strh r1, [r6, 0xC]
	ldrh r0, [r6, 0xE]
	subs r0, 0x1
	strh r0, [r6, 0xE]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080B6F24
	strh r0, [r6, 0xA]
	strh r0, [r6, 0xC]
	movs r0, 0x10
	strh r0, [r6, 0xE]
	ldr r1, _080B6E68 @ =0x00003f42
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	b _080B6F1E
	.align 2, 0
_080B6E68: .4byte 0x00003f42
_080B6E6C:
	cmp r4, 0x1
	bne _080B6E76
	movs r1, 0x80
	lsls r1, 2
	b _080B6E7A
_080B6E76:
	movs r1, 0x80
	lsls r1, 3
_080B6E7A:
	movs r0, 0
	bl ClearGpuRegBits
	b _080B6F1E
_080B6E82:
	ldr r2, _080B6EC0 @ =gSprites
	movs r0, 0x10
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	subs r1, 0x20
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _080B6EA2
	movs r2, 0
_080B6EA2:
	cmp r4, 0x1
	bne _080B6EC4
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x4
	str r2, [sp, 0x4]
	str r4, [sp, 0x8]
	b _080B6EDE
	.align 2, 0
_080B6EC0: .4byte gSprites
_080B6EC4:
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x8
	str r2, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
	movs r2, 0x4
_080B6EDE:
	movs r3, 0x8
	bl ScanlineEffect_InitWave
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x1C]
	b _080B6F1E
_080B6EEC:
	ldrh r0, [r6, 0x16]
	ldr r3, _080B6F08 @ =0x000077ff
	movs r1, 0x10
	movs r2, 0xC
	bl BlendPalette
	cmp r4, 0x1
	bne _080B6F0C
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl SetGpuRegBits
	b _080B6F16
	.align 2, 0
_080B6F08: .4byte 0x000077ff
_080B6F0C:
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	bl SetGpuRegBits
_080B6F16:
	ldr r0, _080B6F2C @ =sub_80B6F30
	str r0, [r6]
	movs r0, 0
	strh r0, [r6, 0x26]
_080B6F1E:
	ldrh r0, [r6, 0x26]
	adds r0, 0x1
	strh r0, [r6, 0x26]
_080B6F24:
	add sp, 0x1C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6F2C: .4byte sub_80B6F30
	thumb_func_end sub_80B6BE4

	thumb_func_start sub_80B6F30
sub_80B6F30: @ 80B6F30
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B6FB8 @ =gTasks
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x1
	ands r0, r1
	strh r0, [r4, 0x18]
	cmp r0, 0
	bne _080B6F68
	ldr r1, _080B6FBC @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	strh r0, [r4, 0xC]
_080B6F68:
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _080B6F8A
	ldr r1, _080B6FBC @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	movs r1, 0x10
	subs r1, r0
	strh r1, [r4, 0xE]
_080B6F8A:
	ldrh r1, [r4, 0xE]
	lsls r1, 8
	ldrh r0, [r4, 0xC]
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	bne _080B6FB2
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080B6FC0 @ =sub_80B6FC4
	str r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
_080B6FB2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6FB8: .4byte gTasks
_080B6FBC: .4byte gSineTable
_080B6FC0: .4byte sub_80B6FC4
	thumb_func_end sub_80B6F30

	thumb_func_start sub_80B6FC4
sub_80B6FC4: @ 80B6FC4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080B6FE8 @ =gTasks
	adds r6, r0, r1
	movs r1, 0x26
	ldrsh r0, [r6, r1]
	cmp r0, 0x5
	bls _080B6FDE
	b _080B7148
_080B6FDE:
	lsls r0, 2
	ldr r1, _080B6FEC @ =_080B6FF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B6FE8: .4byte gTasks
_080B6FEC: .4byte _080B6FF0
	.align 2, 0
_080B6FF0:
	.4byte _080B7008
	.4byte _080B7024
	.4byte _080B7044
	.4byte _080B707C
	.4byte _080B709C
	.4byte _080B70E8
_080B7008:
	ldr r1, _080B701C @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	ldrh r0, [r6, 0x16]
	ldr r3, _080B7020 @ =0x000066e0
	movs r1, 0x10
	movs r2, 0xC
	bl BlendPalette
	b _080B7148
	.align 2, 0
_080B701C: .4byte gScanlineEffect
_080B7020: .4byte 0x000066e0
_080B7024:
	ldr r1, _080B7040 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0x10
	bl SetGpuReg
	movs r1, 0
	movs r0, 0x10
	strh r0, [r6, 0xC]
	strh r1, [r6, 0xE]
	b _080B7148
	.align 2, 0
_080B7040: .4byte 0x00003f44
_080B7044:
	ldrh r1, [r6, 0xC]
	subs r1, 0x1
	strh r1, [r6, 0xC]
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x52
	bl SetGpuReg
	movs r2, 0xE
	ldrsh r0, [r6, r2]
	cmp r0, 0xF
	ble _080B714E
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x2
	bl SetAnimBgAttribute
	b _080B7148
_080B707C:
	movs r0, 0x2
	bl sub_8075358
	movs r0, 0
	movs r1, 0x90
	movs r2, 0x20
	bl FillPalette
	movs r0, 0x2
	movs r1, 0x3
	movs r2, 0
	bl SetAnimBgAttribute
	movs r0, 0xC
	strh r0, [r6, 0xA]
	b _080B7148
_080B709C:
	ldrh r0, [r6, 0x14]
	ldrb r2, [r6, 0xA]
	ldr r4, _080B70C8 @ =0x000066e0
	movs r1, 0x10
	adds r3, r4, 0
	bl BlendPalette
	ldrh r0, [r6, 0x16]
	ldrb r2, [r6, 0xA]
	movs r1, 0x10
	adds r3, r4, 0
	bl BlendPalette
	ldrh r0, [r6, 0xA]
	movs r2, 0xA
	ldrsh r1, [r6, r2]
	cmp r1, 0
	beq _080B70CC
	subs r0, 0x1
	strh r0, [r6, 0xA]
	b _080B714E
	.align 2, 0
_080B70C8: .4byte 0x000066e0
_080B70CC:
	strh r1, [r6, 0xA]
	ldr r1, _080B70E4 @ =0x00003f44
	movs r0, 0x50
	bl SetGpuReg
	movs r1, 0x80
	lsls r1, 5
	movs r0, 0x52
	bl SetGpuReg
	b _080B7148
	.align 2, 0
_080B70E4: .4byte 0x00003f44
_080B70E8:
	ldr r5, _080B7154 @ =gSprites
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x3
	ldrb r2, [r6, 0x12]
	ands r2, r0
	lsls r2, 2
	ldrb r4, [r1, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r0, r3, 0
	ands r0, r4
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r2, 0x10
	ldrsh r1, [r6, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r3, r1
	strb r3, [r0, 0x1]
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x1
	bl SetAnimBgAttribute
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080B7148:
	ldrh r0, [r6, 0x26]
	adds r0, 0x1
	strh r0, [r6, 0x26]
_080B714E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7154: .4byte gSprites
	thumb_func_end sub_80B6FC4

	thumb_func_start sub_80B7158
sub_80B7158: @ 80B7158
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	ldr r2, _080B719C @ =gUnknown_2023D44
	ldr r1, _080B71A0 @ =gBattleAnimAttacker
	ldrb r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	strh r1, [r0, 0x38]
	movs r1, 0x80
	strh r1, [r0, 0x2E]
	movs r1, 0xA
	strh r1, [r0, 0x30]
	ldr r2, _080B71A4 @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0x32]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x34]
	ldr r1, _080B71A8 @ =sub_80B71B0
	str r1, [r0, 0x1C]
	ldr r2, _080B71AC @ =gSprites
	movs r3, 0x38
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080B719C: .4byte gUnknown_2023D44
_080B71A0: .4byte gBattleAnimAttacker
_080B71A4: .4byte gBattleAnimArgs
_080B71A8: .4byte sub_80B71B0
_080B71AC: .4byte gSprites
	thumb_func_end sub_80B7158

	thumb_func_start sub_80B71B0
sub_80B71B0: @ 80B71B0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x34]
	movs r1, 0x34
	ldrsh r3, [r5, r1]
	cmp r3, 0
	beq _080B7218
	subs r0, 0x1
	strh r0, [r5, 0x34]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	ldr r4, _080B7210 @ =gSprites
	movs r1, 0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Cos
	movs r1, 0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x26]
	ldrh r0, [r5, 0x32]
	ldrh r2, [r5, 0x2E]
	adds r1, r0, r2
	strh r1, [r5, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080B724C
	ldr r2, _080B7214 @ =0xffffff00
	adds r0, r1, r2
	strh r0, [r5, 0x2E]
	b _080B724C
	.align 2, 0
_080B7210: .4byte gSprites
_080B7214: .4byte 0xffffff00
_080B7218:
	ldr r2, _080B7254 @ =gSprites
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x24]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x8
	strh r1, [r0, 0x22]
	ldr r0, _080B7258 @ =move_anim_8074EE0
	str r0, [r5, 0x1C]
_080B724C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7254: .4byte gSprites
_080B7258: .4byte move_anim_8074EE0
	thumb_func_end sub_80B71B0

	.align 2, 0 @ Don't pad with nop.
