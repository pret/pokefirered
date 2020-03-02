	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8087AB4
sub_8087AB4: @ 8087AB4
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08087AF8 @ =gFieldEffectArguments
	ldrb r0, [r4]
	ldrb r1, [r4, 0x4]
	ldrb r2, [r4, 0x8]
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08087B04
	ldr r0, _08087AFC @ =sub_8087BC0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08087B00 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, 0xC]
	ldr r0, [r4]
	strh r0, [r1, 0x14]
	ldr r0, [r4, 0x4]
	strh r0, [r1, 0x16]
	ldr r0, [r4, 0x8]
	strh r0, [r1, 0x18]
	b _08087B0A
	.align 2, 0
_08087AF8: .4byte gFieldEffectArguments
_08087AFC: .4byte sub_8087BC0
_08087B00: .4byte gTasks
_08087B04:
	movs r0, 0x44
	bl FieldEffectActiveListRemove
_08087B0A:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8087AB4

	thumb_func_start sub_8087B14
sub_8087B14: @ 8087B14
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08087B4C @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08087B50
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08087B54
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087B54
	subs r0, r1, 0x1
	b _08087B52
	.align 2, 0
_08087B4C: .4byte gTasks+0x8
_08087B50:
	movs r0, 0x4
_08087B52:
	strh r0, [r4, 0xA]
_08087B54:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08087B8E
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08087B84
	ldrh r1, [r4, 0xA]
	negs r1, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl SetCameraPanning
	b _08087B8E
_08087B84:
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
_08087B8E:
	bl UpdateCameraPanning
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08087BA0
	adds r0, r5, 0
	bl DestroyTask
_08087BA0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8087B14

	thumb_func_start sub_8087BA8
sub_8087BA8: @ 8087BA8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08087BBC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x16]
	bx lr
	.align 2, 0
_08087BBC: .4byte gTasks
	thumb_func_end sub_8087BA8

	thumb_func_start sub_8087BC0
sub_8087BC0: @ 8087BC0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _08087BF8 @ =gTasks+0x8
	adds r4, r0
	bl InstallCameraPanAheadCallback
	movs r0, 0
	bl SetCameraPanningCallback
	ldr r1, _08087BFC @ =gUnknown_83CC244
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087BF8: .4byte gTasks+0x8
_08087BFC: .4byte gUnknown_83CC244
	thumb_func_end sub_8087BC0

	thumb_func_start sub_8087C00
sub_8087C00: @ 8087C00
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08087C28 @ =sub_8087B14
	movs r1, 0x5A
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x51
	bl PlaySE
	strh r4, [r5, 0xA]
	ldrh r0, [r5, 0x2]
	adds r0, 0x1
	strh r0, [r5, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087C28: .4byte sub_8087B14
	thumb_func_end sub_8087C00

	thumb_func_start sub_8087C2C
sub_8087C2C: @ 8087C2C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	ldrh r0, [r7, 0x6]
	adds r0, 0x1
	strh r0, [r7, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _08087C9A
	ldr r2, _08087CA4 @ =gObjectEvents
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087CA8 @ =gSprites
	adds r4, r0
	ldrb r0, [r1, 0x1]
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldr r6, _08087CAC @ =0x0000ffff
	ldr r5, _08087CB0 @ =0x00007fff
	adds r0, r6, 0
	movs r1, 0x10
	adds r2, r5, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r4, 0
	bl sub_8087CFC
	movs r0, 0x50
	bl PlaySE
	ldrb r0, [r7, 0xA]
	bl sub_8087BA8
	movs r0, 0
	strh r0, [r7, 0x6]
	ldrh r0, [r7, 0x2]
	adds r0, 0x1
	strh r0, [r7, 0x2]
_08087C9A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087CA4: .4byte gObjectEvents
_08087CA8: .4byte gSprites
_08087CAC: .4byte 0x0000ffff
_08087CB0: .4byte 0x00007fff
	thumb_func_end sub_8087C2C

	thumb_func_start sub_8087CB4
sub_8087CB4: @ 8087CB4
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08087CF4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087CEE
	ldr r0, _08087CF8 @ =sub_8087B14
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08087CEE
	bl InstallCameraPanAheadCallback
	ldrb r0, [r4, 0xC]
	ldrb r1, [r4, 0xE]
	ldrb r2, [r4, 0x10]
	bl RemoveObjectEventByLocalIdAndMap
	movs r0, 0x44
	bl FieldEffectActiveListRemove
	adds r0, r5, 0
	bl DestroyTask
_08087CEE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087CF4: .4byte gPaletteFade
_08087CF8: .4byte sub_8087B14
	thumb_func_end sub_8087CB4

	thumb_func_start sub_8087CFC
sub_8087CFC: @ 8087CFC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r0, _08087D80 @ =gUnknown_300506C
	movs r1, 0
	ldrsh r2, [r0, r1]
	movs r3, 0x20
	ldrsh r0, [r6, r3]
	adds r2, r0
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	adds r2, r0
	ldr r0, _08087D84 @ =gUnknown_3005068
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r3, 0x22
	ldrsh r1, [r6, r3]
	adds r0, r1
	movs r3, 0x26
	ldrsh r1, [r6, r3]
	adds r0, r1
	subs r0, 0x4
	movs r5, 0
	lsls r2, 16
	mov r8, r2
	lsls r7, r0, 16
_08087D32:
	ldr r0, _08087D88 @ =gUnknown_83CC2A0
	mov r2, r8
	asrs r1, r2, 16
	asrs r2, r7, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08087D6E
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087D8C @ =gSprites
	adds r4, r0
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	strh r5, [r4, 0x2E]
	ldrb r1, [r6, 0x5]
	lsrs r1, 4
	lsls r1, 4
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
_08087D6E:
	adds r5, 0x1
	cmp r5, 0x3
	ble _08087D32
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087D80: .4byte gUnknown_300506C
_08087D84: .4byte gUnknown_3005068
_08087D88: .4byte gUnknown_83CC2A0
_08087D8C: .4byte gSprites
	thumb_func_end sub_8087CFC

	thumb_func_start sub_8087D90
sub_8087D90: @ 8087D90
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _08087DBC
	cmp r0, 0x1
	bgt _08087DA6
	cmp r0, 0
	beq _08087DB0
	b _08087DDA
_08087DA6:
	cmp r0, 0x2
	beq _08087DC8
	cmp r0, 0x3
	beq _08087DCE
	b _08087DDA
_08087DB0:
	ldrh r0, [r1, 0x20]
	subs r0, 0x10
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0xC
	b _08087DD8
_08087DBC:
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0xC
	b _08087DD8
_08087DC8:
	ldrh r0, [r1, 0x20]
	subs r0, 0x10
	b _08087DD2
_08087DCE:
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
_08087DD2:
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x22]
	adds r0, 0xC
_08087DD8:
	strh r0, [r1, 0x22]
_08087DDA:
	ldrh r0, [r1, 0x20]
	adds r0, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF8
	bhi _08087DF6
	movs r0, 0x22
	ldrsh r2, [r1, r0]
	movs r0, 0x4
	negs r0, r0
	cmp r2, r0
	blt _08087DF6
	cmp r2, 0xA4
	ble _08087DFC
_08087DF6:
	adds r0, r1, 0
	bl DestroySprite
_08087DFC:
	pop {r0}
	bx r0
	thumb_func_end sub_8087D90

	thumb_func_start sub_8087E00
sub_8087E00: @ 8087E00
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08087E24 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087E1E
	movs r0, 0x45
	bl FieldEffectActiveListRemove
	adds r0, r4, 0
	bl DestroyTask
_08087E1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E24: .4byte gPaletteFade
	thumb_func_end sub_8087E00

	thumb_func_start sub_8087E28
sub_8087E28: @ 8087E28
	push {r4,r5,lr}
	sub sp, 0x4
	movs r4, 0x1
	negs r4, r4
	ldr r5, _08087E5C @ =0x00007fff
	adds r0, r4, 0
	movs r1, 0x10
	adds r2, r5, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	adds r1, r4, 0
	movs r2, 0xF
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08087E60 @ =sub_8087E00
	movs r1, 0x5A
	bl CreateTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087E5C: .4byte 0x00007fff
_08087E60: .4byte sub_8087E00
	thumb_func_end sub_8087E28

	.align 2, 0 @ Don't pad with nop.
