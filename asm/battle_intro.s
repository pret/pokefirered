	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start SetAnimBgAttribute
SetAnimBgAttribute: @ 80BC1F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r6, 0x3
	bls _080BC20C
	b _080BC2FE
_080BC20C:
	ldr r0, _080BC228 @ =gUnknown_83E7CCA
	adds r0, r6, r0
	ldrb r0, [r0]
	bl GetGpuReg
	ldr r1, _080BC22C @ =gUnknown_20399B8
	strh r0, [r1]
	cmp r5, 0x6
	bhi _080BC2F0
	lsls r0, r5, 2
	ldr r1, _080BC230 @ =_080BC234
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC228: .4byte gUnknown_83E7CCA
_080BC22C: .4byte gUnknown_20399B8
_080BC230: .4byte _080BC234
	.align 2, 0
_080BC234:
	.4byte _080BC250
	.4byte _080BC264
	.4byte _080BC27C
	.4byte _080BC294
	.4byte _080BC2AC
	.4byte _080BC2C8
	.4byte _080BC2DC
_080BC250:
	ldr r2, _080BC260 @ =gUnknown_20399B8
	lsls r3, r4, 6
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x1]
	b _080BC2F0
	.align 2, 0
_080BC260: .4byte gUnknown_20399B8
_080BC264:
	ldr r3, _080BC278 @ =gUnknown_20399B8
	movs r0, 0x1
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 5
	ldrb r2, [r3, 0x1]
	movs r0, 0x21
	negs r0, r0
	b _080BC2EA
	.align 2, 0
_080BC278: .4byte gUnknown_20399B8
_080BC27C:
	ldr r3, _080BC290 @ =gUnknown_20399B8
	movs r0, 0x1
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x41
	negs r0, r0
	b _080BC2BA
	.align 2, 0
_080BC290: .4byte gUnknown_20399B8
_080BC294:
	ldr r3, _080BC2A8 @ =gUnknown_20399B8
	movs r0, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0xD
	negs r0, r0
	b _080BC2BA
	.align 2, 0
_080BC2A8: .4byte gUnknown_20399B8
_080BC2AC:
	ldr r3, _080BC2C4 @ =gUnknown_20399B8
	movs r0, 0x3
	adds r1, r4, 0
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x4
	negs r0, r0
_080BC2BA:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080BC2F0
	.align 2, 0
_080BC2C4: .4byte gUnknown_20399B8
_080BC2C8:
	ldr r2, _080BC2D8 @ =gUnknown_20399B8
	lsls r3, r4, 7
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b _080BC2F0
	.align 2, 0
_080BC2D8: .4byte gUnknown_20399B8
_080BC2DC:
	ldr r3, _080BC304 @ =gUnknown_20399B8
	movs r0, 0x1F
	adds r1, r4, 0
	ands r1, r0
	ldrb r2, [r3, 0x1]
	movs r0, 0x20
	negs r0, r0
_080BC2EA:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x1]
_080BC2F0:
	ldr r0, _080BC308 @ =gUnknown_83E7CCA
	adds r0, r6, r0
	ldrb r0, [r0]
	ldr r1, _080BC304 @ =gUnknown_20399B8
	ldrh r1, [r1]
	bl SetGpuReg
_080BC2FE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC304: .4byte gUnknown_20399B8
_080BC308: .4byte gUnknown_83E7CCA
	thumb_func_end SetAnimBgAttribute

	thumb_func_start sub_80BC30C
sub_80BC30C: @ 80BC30C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r2, 0x3
	bhi _080BC394
	ldr r0, _080BC338 @ =gUnknown_83E7CCE
	adds r0, r2, r0
	ldrb r0, [r0]
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	cmp r4, 0x6
	bhi _080BC394
	lsls r0, r4, 2
	ldr r1, _080BC33C @ =_080BC340
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC338: .4byte gUnknown_83E7CCE
_080BC33C: .4byte _080BC340
	.align 2, 0
_080BC340:
	.4byte _080BC35C
	.4byte _080BC364
	.4byte _080BC36C
	.4byte _080BC374
	.4byte _080BC37C
	.4byte _080BC384
	.4byte _080BC38C
_080BC35C:
	ldr r0, [sp]
	lsls r0, 16
	lsrs r0, 30
	b _080BC396
_080BC364:
	ldr r0, [sp]
	lsls r0, 18
	lsrs r0, 31
	b _080BC396
_080BC36C:
	ldr r0, [sp]
	lsls r0, 25
	lsrs r0, 31
	b _080BC396
_080BC374:
	ldr r0, [sp]
	lsls r0, 28
	lsrs r0, 30
	b _080BC396
_080BC37C:
	ldr r0, [sp]
	lsls r0, 30
	lsrs r0, 30
	b _080BC396
_080BC384:
	ldr r0, [sp]
	lsls r0, 24
	lsrs r0, 31
	b _080BC396
_080BC38C:
	ldr r0, [sp]
	lsls r0, 19
	lsrs r0, 27
	b _080BC396
_080BC394:
	movs r0, 0
_080BC396:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC30C

	thumb_func_start HandleIntroSlide
HandleIntroSlide: @ 80BC3A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BC3B8 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC3C0
	ldr r0, _080BC3BC @ =sub_80BCC4C
	b _080BC3E8
	.align 2, 0
_080BC3B8: .4byte gBattleTypeFlags
_080BC3BC: .4byte sub_80BCC4C
_080BC3C0:
	movs r0, 0x80
	lsls r0, 5
	ands r1, r0
	cmp r1, 0
	beq _080BC3E0
	ldr r0, _080BC3D8 @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080BC3E0
	movs r4, 0x3
	ldr r0, _080BC3DC @ =task00_battle_intro_80BC6C8
	b _080BC3E8
	.align 2, 0
_080BC3D8: .4byte gGameVersion
_080BC3DC: .4byte task00_battle_intro_80BC6C8
_080BC3E0:
	ldr r1, _080BC414 @ =gUnknown_83E7CD4
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
_080BC3E8:
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BC418 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r0, [r1, 0x10]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC414: .4byte gUnknown_83E7CD4
_080BC418: .4byte gTasks
	thumb_func_end HandleIntroSlide

	thumb_func_start sub_80BC41C
sub_80BC41C: @ 80BC41C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _080BC468 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080BC46C @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _080BC470 @ =gBattle_BG2_X
	strh r1, [r0]
	ldr r0, _080BC474 @ =gBattle_BG2_Y
	strh r1, [r0]
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r4, _080BC478 @ =0x00003f3f
	movs r0, 0x48
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x4A
	adds r1, r4, 0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC468: .4byte gBattle_BG1_X
_080BC46C: .4byte gBattle_BG1_Y
_080BC470: .4byte gBattle_BG2_X
_080BC474: .4byte gBattle_BG2_Y
_080BC478: .4byte 0x00003f3f
	thumb_func_end sub_80BC41C

	thumb_func_start task_battle_intro_80BC47C
task_battle_intro_80BC47C: @ 80BC47C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080BC4B4 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x6
	strh r0, [r1]
	ldr r1, _080BC4B8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0x4
	bls _080BC4A8
	b _080BC6BA
_080BC4A8:
	lsls r0, 2
	ldr r1, _080BC4BC @ =_080BC4C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC4B4: .4byte gBattle_BG1_X
_080BC4B8: .4byte gTasks
_080BC4BC: .4byte _080BC4C0
	.align 2, 0
_080BC4C0:
	.4byte _080BC4D4
	.4byte _080BC504
	.4byte _080BC52C
	.4byte _080BC574
	.4byte _080BC6B4
_080BC4D4:
	ldr r0, _080BC4EC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC4F0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x10
	b _080BC4FA
	.align 2, 0
_080BC4EC: .4byte gBattleTypeFlags
_080BC4F0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x1
_080BC4FA:
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080BC6BA
_080BC504:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r3, r8
	adds r1, r0, r3
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BC51C
	b _080BC6BA
_080BC51C:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	b _080BC6BA
_080BC52C:
	ldr r1, _080BC568 @ =gBattle_WIN0V
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BC544
	b _080BC6BA
_080BC544:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080BC56C @ =gIntroSlideFlags
	ldrh r1, [r2]
	ldr r0, _080BC570 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BC6BA
	.align 2, 0
_080BC568: .4byte gBattle_WIN0V
_080BC56C: .4byte gIntroSlideFlags
_080BC570: .4byte 0x0000fffe
_080BC574:
	lsls r0, r4, 2
	adds r1, r0, r4
	lsls r1, 3
	mov r5, r8
	adds r2, r1, r5
	ldrh r3, [r2, 0xE]
	movs r5, 0xE
	ldrsh r1, [r2, r5]
	mov r12, r0
	cmp r1, 0
	beq _080BC590
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080BC5BE
_080BC590:
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080BC5B0
	ldr r2, _080BC5A8 @ =gBattle_BG1_Y
	ldrh r1, [r2]
	ldr r0, _080BC5AC @ =0x0000ffb0
	cmp r1, r0
	beq _080BC5BE
	subs r0, r1, 0x2
	b _080BC5BC
	.align 2, 0
_080BC5A8: .4byte gBattle_BG1_Y
_080BC5AC: .4byte 0x0000ffb0
_080BC5B0:
	ldr r2, _080BC690 @ =gBattle_BG1_Y
	ldrh r1, [r2]
	ldr r0, _080BC694 @ =0x0000ffc8
	cmp r1, r0
	beq _080BC5BE
	subs r0, r1, 0x1
_080BC5BC:
	strh r0, [r2]
_080BC5BE:
	ldr r2, _080BC698 @ =gBattle_WIN0V
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BC5D2
	ldr r3, _080BC69C @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BC5D2:
	mov r5, r12
	adds r0, r5, r4
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BC5EA
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BC5EA:
	movs r3, 0
	ldr r5, _080BC6A0 @ =gScanlineEffect
	mov r9, r5
	ldr r7, _080BC6A4 @ =gScanlineEffectRegBuffers
	mov r6, r9
	adds r5, r1, 0
_080BC5F6:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BC5F6
	cmp r3, 0x9F
	bgt _080BC63A
	ldr r7, _080BC6A4 @ =gScanlineEffectRegBuffers
	ldr r6, _080BC6A0 @ =gScanlineEffect
	ldr r1, _080BC6A8 @ =gTasks
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r1
_080BC620:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BC620
_080BC63A:
	mov r3, r12
	adds r0, r3, r4
	lsls r0, 3
	mov r5, r8
	adds r1, r0, r5
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	cmp r2, 0
	bne _080BC6BA
	movs r0, 0x3
	mov r3, r9
	strb r0, [r3, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080BC6AC @ =0x0600e000
	ldr r2, _080BC6B0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BC6BA
	.align 2, 0
_080BC690: .4byte gBattle_BG1_Y
_080BC694: .4byte 0x0000ffc8
_080BC698: .4byte gBattle_WIN0V
_080BC69C: .4byte 0xfffffc04
_080BC6A0: .4byte gScanlineEffect
_080BC6A4: .4byte gScanlineEffectRegBuffers
_080BC6A8: .4byte gTasks
_080BC6AC: .4byte 0x0600e000
_080BC6B0: .4byte 0x05000200
_080BC6B4:
	adds r0, r4, 0
	bl sub_80BC41C
_080BC6BA:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_battle_intro_80BC47C

	thumb_func_start task00_battle_intro_80BC6C8
task00_battle_intro_80BC6C8: @ 80BC6C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BC6F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x3
	beq _080BC708
	cmp r0, 0x3
	bgt _080BC6F8
	cmp r0, 0x2
	beq _080BC6FC
	b _080BC710
	.align 2, 0
_080BC6F4: .4byte gTasks
_080BC6F8:
	cmp r0, 0x4
	bne _080BC710
_080BC6FC:
	ldr r1, _080BC704 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x8
	b _080BC70E
	.align 2, 0
_080BC704: .4byte gBattle_BG1_X
_080BC708:
	ldr r1, _080BC74C @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x6
_080BC70E:
	strh r0, [r1]
_080BC710:
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r4, r1, r2
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	adds r6, r0, 0
	cmp r1, 0x4
	bne _080BC774
	ldr r7, _080BC750 @ =gBattle_BG1_Y
	ldrh r0, [r4, 0x14]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080BC736
	ldr r1, _080BC754 @ =0x000001ff
	adds r0, r1
_080BC736:
	asrs r0, 9
	subs r0, 0x8
	strh r0, [r7]
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0xB3
	bgt _080BC758
	adds r0, r1, 0x4
	b _080BC75A
	.align 2, 0
_080BC74C: .4byte gBattle_BG1_X
_080BC750: .4byte gBattle_BG1_Y
_080BC754: .4byte 0x000001ff
_080BC758:
	adds r0, r1, 0x6
_080BC75A:
	strh r0, [r4, 0x14]
	ldr r2, _080BC790 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r3, r0, r2
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	movs r0, 0xB4
	lsls r0, 1
	cmp r1, r0
	bne _080BC774
	movs r0, 0
	strh r0, [r3, 0x14]
_080BC774:
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _080BC784
	b _080BC9AA
_080BC784:
	lsls r0, 2
	ldr r1, _080BC794 @ =_080BC798
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC790: .4byte gTasks
_080BC794: .4byte _080BC798
	.align 2, 0
_080BC798:
	.4byte _080BC7AC
	.4byte _080BC7DC
	.4byte _080BC808
	.4byte _080BC858
	.4byte _080BC9A4
_080BC7AC:
	ldr r1, _080BC7C8 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x10
	strh r3, [r2, 0x10]
	ldr r0, _080BC7CC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC7D0
	strh r3, [r2, 0xC]
	b _080BC7D4
	.align 2, 0
_080BC7C8: .4byte gTasks
_080BC7CC: .4byte gBattleTypeFlags
_080BC7D0:
	movs r0, 0x1
	strh r0, [r2, 0xC]
_080BC7D4:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080BC9AA
_080BC7DC:
	ldr r0, _080BC804 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BC7F2
	b _080BC9AA
_080BC7F2:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	b _080BC9AA
	.align 2, 0
_080BC804: .4byte gTasks
_080BC808:
	ldr r1, _080BC848 @ =gBattle_WIN0V
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BC820
	b _080BC9AA
_080BC820:
	ldr r0, _080BC84C @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080BC850 @ =gIntroSlideFlags
	ldrh r1, [r2]
	ldr r0, _080BC854 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BC9AA
	.align 2, 0
_080BC848: .4byte gBattle_WIN0V
_080BC84C: .4byte gTasks
_080BC850: .4byte gIntroSlideFlags
_080BC854: .4byte 0x0000fffe
_080BC858:
	ldr r0, _080BC890 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BC898
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080BC8B8
	ldr r1, _080BC894 @ =0x00001842
	movs r0, 0x50
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0xF
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	b _080BC8B8
	.align 2, 0
_080BC890: .4byte gTasks
_080BC894: .4byte 0x00001842
_080BC898:
	ldrh r2, [r1, 0x10]
	movs r0, 0x1F
	ands r0, r2
	cmp r0, 0
	beq _080BC8B8
	ldrh r0, [r1, 0x12]
	subs r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080BC8B8
	adds r0, r2, 0
	adds r0, 0xFF
	strh r0, [r1, 0x10]
	movs r0, 0x4
	strh r0, [r1, 0x12]
_080BC8B8:
	ldr r2, _080BC988 @ =gBattle_WIN0V
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BC8CC
	ldr r3, _080BC98C @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BC8CC:
	ldr r0, _080BC990 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BC8E2
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BC8E2:
	movs r3, 0
	ldr r0, _080BC994 @ =gScanlineEffect
	mov r8, r0
	ldr r2, _080BC998 @ =gScanlineEffectRegBuffers
	mov r12, r2
	mov r7, r8
	adds r4, r1, 0
_080BC8F0:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BC8F0
	cmp r3, 0x9F
	bgt _080BC934
	ldr r0, _080BC998 @ =gScanlineEffectRegBuffers
	mov r12, r0
	ldr r7, _080BC994 @ =gScanlineEffect
	ldr r1, _080BC990 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r4, r0, r1
_080BC91A:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BC91A
_080BC934:
	ldr r1, _080BC990 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080BC9AA
	movs r0, 0x3
	mov r3, r8
	strb r0, [r3, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080BC99C @ =0x0600e000
	ldr r2, _080BC9A0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BC9AA
	.align 2, 0
_080BC988: .4byte gBattle_WIN0V
_080BC98C: .4byte 0xfffffc04
_080BC990: .4byte gTasks
_080BC994: .4byte gScanlineEffect
_080BC998: .4byte gScanlineEffectRegBuffers
_080BC99C: .4byte 0x0600e000
_080BC9A0: .4byte 0x05000200
_080BC9A4:
	adds r0, r5, 0
	bl sub_80BC41C
_080BC9AA:
	ldr r0, _080BC9D0 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080BC9C2
	ldrh r1, [r1, 0x10]
	movs r0, 0x52
	bl SetGpuReg
_080BC9C2:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC9D0: .4byte gTasks
	thumb_func_end task00_battle_intro_80BC6C8

	thumb_func_start task_battle_intro_anim
task_battle_intro_anim: @ 80BC9D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BCA08 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, _080BCA0C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x4
	bls _080BC9FE
	b _080BCC22
_080BC9FE:
	lsls r0, 2
	ldr r1, _080BCA10 @ =_080BCA14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BCA08: .4byte gBattle_BG1_X
_080BCA0C: .4byte gTasks
_080BCA10: .4byte _080BCA14
	.align 2, 0
_080BCA14:
	.4byte _080BCA28
	.4byte _080BCA7C
	.4byte _080BCAA8
	.4byte _080BCAF8
	.4byte _080BCC1C
_080BCA28:
	ldr r1, _080BCA60 @ =0x00001842
	movs r0, 0x50
	bl SetGpuReg
	ldr r4, _080BCA64 @ =0x00000808
	movs r0, 0x52
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldr r1, _080BCA68 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x10]
	ldr r0, _080BCA6C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BCA70
	movs r0, 0x10
	b _080BCA72
	.align 2, 0
_080BCA60: .4byte 0x00001842
_080BCA64: .4byte 0x00000808
_080BCA68: .4byte gTasks
_080BCA6C: .4byte gBattleTypeFlags
_080BCA70:
	movs r0, 0x1
_080BCA72:
	strh r0, [r2, 0xC]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080BCC22
_080BCA7C:
	ldr r0, _080BCAA4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BCA94
	b _080BCC22
_080BCA94:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	b _080BCC22
	.align 2, 0
_080BCAA4: .4byte gTasks
_080BCAA8:
	ldr r1, _080BCAE8 @ =gBattle_WIN0V
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BCAC0
	b _080BCC22
_080BCAC0:
	ldr r0, _080BCAEC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080BCAF0 @ =gIntroSlideFlags
	ldrh r1, [r2]
	ldr r0, _080BCAF4 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BCC22
	.align 2, 0
_080BCAE8: .4byte gBattle_WIN0V
_080BCAEC: .4byte gTasks
_080BCAF0: .4byte gIntroSlideFlags
_080BCAF4: .4byte 0x0000fffe
_080BCAF8:
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r2, r1, r4
	ldrh r3, [r2, 0xE]
	movs r6, 0xE
	ldrsh r1, [r2, r6]
	mov r12, r0
	cmp r1, 0
	beq _080BCB12
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080BCB32
_080BCB12:
	ldrh r1, [r2, 0x10]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _080BCB32
	ldrh r0, [r2, 0x12]
	subs r0, 0x1
	strh r0, [r2, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080BCB32
	adds r0, r1, 0
	adds r0, 0xFF
	strh r0, [r2, 0x10]
	movs r0, 0x6
	strh r0, [r2, 0x12]
_080BCB32:
	ldr r2, _080BCC00 @ =gBattle_WIN0V
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BCB46
	ldr r3, _080BCC04 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BCB46:
	mov r6, r12
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r4
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BCB5C
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BCB5C:
	movs r3, 0
	ldr r6, _080BCC08 @ =gScanlineEffect
	mov r8, r6
	ldr r7, _080BCC0C @ =gScanlineEffectRegBuffers
	adds r4, r1, 0
_080BCB66:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BCB66
	cmp r3, 0x9F
	bgt _080BCBAA
	ldr r7, _080BCC0C @ =gScanlineEffectRegBuffers
	ldr r6, _080BCC08 @ =gScanlineEffect
	ldr r1, _080BCC10 @ =gTasks
	mov r2, r12
	adds r0, r2, r5
	lsls r0, 3
	adds r4, r0, r1
_080BCB90:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BCB90
_080BCBAA:
	ldr r1, _080BCC10 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080BCC22
	movs r0, 0x3
	mov r6, r8
	strb r0, [r6, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080BCC14 @ =0x0600e000
	ldr r2, _080BCC18 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BCC22
	.align 2, 0
_080BCC00: .4byte gBattle_WIN0V
_080BCC04: .4byte 0xfffffc04
_080BCC08: .4byte gScanlineEffect
_080BCC0C: .4byte gScanlineEffectRegBuffers
_080BCC10: .4byte gTasks
_080BCC14: .4byte 0x0600e000
_080BCC18: .4byte 0x05000200
_080BCC1C:
	adds r0, r5, 0
	bl sub_80BC41C
_080BCC22:
	ldr r0, _080BCC48 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080BCC3C
	ldrh r1, [r1, 0x10]
	movs r0, 0x52
	bl SetGpuReg
_080BCC3C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCC48: .4byte gTasks
	thumb_func_end task_battle_intro_anim

	thumb_func_start sub_80BCC4C
sub_80BCC4C: @ 80BCC4C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080BCC98 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	ble _080BCCC2
	movs r2, 0x10
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bne _080BCCC2
	ldr r2, _080BCC9C @ =gBattle_BG1_X
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080BCC8A
	cmp r1, 0x4F
	bhi _080BCCA4
_080BCC8A:
	adds r0, r1, 0x3
	strh r0, [r2]
	ldr r1, _080BCCA0 @ =gBattle_BG2_X
	ldrh r0, [r1]
	subs r0, 0x3
	strh r0, [r1]
	b _080BCCC2
	.align 2, 0
_080BCC98: .4byte gTasks
_080BCC9C: .4byte gBattle_BG1_X
_080BCCA0: .4byte gBattle_BG2_X
_080BCCA4:
	str r5, [sp]
	ldr r1, _080BCCE4 @ =0x0600e000
	ldr r4, _080BCCE8 @ =0x05000200
	mov r0, sp
	adds r2, r4, 0
	bl CpuSet
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldr r1, _080BCCEC @ =0x0600f000
	adds r2, r4, 0
	bl CpuSet
	movs r0, 0x1
	strh r0, [r7, 0x10]
_080BCCC2:
	ldr r0, _080BCCF0 @ =gTasks
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	mov r9, r0
	adds r5, r2, 0
	cmp r1, 0x4
	bls _080BCCDA
	b _080BCEE6
_080BCCDA:
	lsls r0, r1, 2
	ldr r1, _080BCCF4 @ =_080BCCF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BCCE4: .4byte 0x0600e000
_080BCCE8: .4byte 0x05000200
_080BCCEC: .4byte 0x0600f000
_080BCCF0: .4byte gTasks
_080BCCF4: .4byte _080BCCF8
	.align 2, 0
_080BCCF8:
	.4byte _080BCD0C
	.4byte _080BCD1E
	.4byte _080BCDC4
	.4byte _080BCE08
	.4byte _080BCEE0
_080BCD0C:
	adds r0, r5, r6
	lsls r0, 3
	add r0, r9
	movs r1, 0x20
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080BCEE6
_080BCD1E:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r9
	adds r1, r0, r2
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080BCD34
	b _080BCEE6
_080BCD34:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r4, _080BCDB4 @ =gSprites
	ldr r5, _080BCDB8 @ =gBattleStruct
	ldr r0, [r5]
	adds r0, 0x7D
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r3, [r1, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x8
	mov r9, r3
	mov r3, r9
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldr r3, [r5]
	adds r0, r3, 0
	adds r0, 0x7D
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	movs r1, 0x1C
	adds r1, r4
	mov r8, r1
	add r0, r8
	ldr r6, _080BCDBC @ =sub_801182C
	str r6, [r0]
	adds r3, 0x7E
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	ands r2, r1
	mov r3, r9
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldr r0, [r5]
	adds r0, 0x7E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	str r6, [r0]
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	ldr r1, _080BCDC0 @ =0x00003f06
	movs r0, 0x4A
	bl SetGpuReg
	b _080BCEE6
	.align 2, 0
_080BCDB4: .4byte gSprites
_080BCDB8: .4byte gBattleStruct
_080BCDBC: .4byte sub_801182C
_080BCDC0: .4byte 0x00003f06
_080BCDC4:
	ldr r1, _080BCDFC @ =gBattle_WIN0V
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080BCDDC
	b _080BCEE6
_080BCDDC:
	adds r1, r5, r6
	lsls r1, 3
	add r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080BCE00 @ =gIntroSlideFlags
	ldrh r1, [r2]
	ldr r0, _080BCE04 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080BCEE6
	.align 2, 0
_080BCDFC: .4byte gBattle_WIN0V
_080BCE00: .4byte gIntroSlideFlags
_080BCE04: .4byte 0x0000fffe
_080BCE08:
	ldr r2, _080BCECC @ =gBattle_WIN0V
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080BCE1C
	ldr r3, _080BCED0 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080BCE1C:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r9
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080BCE32
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080BCE32:
	movs r3, 0
	ldr r0, _080BCED4 @ =gScanlineEffect
	mov r12, r0
	ldr r2, _080BCED8 @ =gScanlineEffectRegBuffers
	mov r8, r2
	mov r7, r12
	adds r4, r1, 0
_080BCE40:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080BCE40
	cmp r3, 0x9F
	bgt _080BCE84
	ldr r0, _080BCED8 @ =gScanlineEffectRegBuffers
	mov r8, r0
	ldr r7, _080BCED4 @ =gScanlineEffect
	ldr r1, _080BCEDC @ =gTasks
	adds r0, r5, r6
	lsls r0, 3
	adds r4, r0, r1
_080BCE6A:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080BCE6A
_080BCE84:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r9
	adds r1, r0, r2
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080BCEE6
	movs r0, 0x3
	mov r2, r12
	strb r0, [r2, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r1, 0x9C
	lsls r1, 8
	movs r0, 0xA
	bl SetGpuReg
	movs r1, 0xBC
	lsls r1, 7
	movs r0, 0xC
	bl SetGpuReg
	b _080BCEE6
	.align 2, 0
_080BCECC: .4byte gBattle_WIN0V
_080BCED0: .4byte 0xfffffc04
_080BCED4: .4byte gScanlineEffect
_080BCED8: .4byte gScanlineEffectRegBuffers
_080BCEDC: .4byte gTasks
_080BCEE0:
	adds r0, r6, 0
	bl sub_80BC41C
_080BCEE6:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BCC4C

	thumb_func_start sub_80BCEF4
sub_80BCEF4: @ 80BCEF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	adds r6, r2, 0
	adds r4, r3, 0
	ldr r0, [sp, 0x24]
	ldr r7, [sp, 0x28]
	ldr r2, [sp, 0x2C]
	mov r9, r2
	ldr r5, [sp, 0x30]
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080BCFC4 @ =gMonSpritesGfxPtr
	ldr r2, [r1]
	lsls r4, 2
	adds r2, 0x4
	adds r2, r4
	ldr r1, _080BCFC8 @ =gBattleMonForms
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 11
	ldr r0, [r2]
	adds r0, r1
	movs r2, 0x80
	lsls r2, 3
	adds r1, r7, 0
	bl CpuSet
	ldr r1, [sp]
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 5
	adds r1, r7, 0
	adds r3, r5, 0
	bl LoadBgTiles
	adds r0, r6, 0
	adds r0, 0x8
	cmp r6, r0
	bge _080BCFA0
	mov r12, r0
	mov r2, r8
	lsls r7, r2, 1
_080BCF72:
	mov r1, r8
	adds r2, r1, 0
	adds r2, 0x8
	adds r4, r6, 0x1
	cmp r1, r2
	bge _080BCF9A
	mov r0, r10
	lsls r3, r0, 12
	lsls r0, r6, 6
	add r0, r9
	adds r6, r7, r0
	subs r1, r2, r1
_080BCF8A:
	adds r0, r5, 0
	orrs r0, r3
	strh r0, [r6]
	adds r5, 0x1
	adds r6, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _080BCF8A
_080BCF9A:
	adds r6, r4, 0
	cmp r6, r12
	blt _080BCF72
_080BCFA0:
	ldr r1, [sp]
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 4
	mov r1, r9
	movs r3, 0
	bl LoadBgTilemap
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFC4: .4byte gMonSpritesGfxPtr
_080BCFC8: .4byte gBattleMonForms
	thumb_func_end sub_80BCEF4

	thumb_func_start sub_80BCFCC
sub_80BCFCC: @ 80BCFCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	ldr r5, [sp, 0x28]
	mov r8, r5
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	mov r9, r6
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	mov r7, r8
	lsls r7, 16
	lsrs r6, r7, 16
	lsls r5, 24
	lsrs r5, 24
	mov r0, r9
	lsls r0, 24
	mov r9, r0
	ldr r4, _080BD090 @ =0x040000d4
	ldr r0, _080BD094 @ =gMonSpritesGfxPtr
	ldr r0, [r0]
	lsrs r2, 22
	adds r0, 0x4
	adds r0, r2
	lsrs r3, 13
	ldr r0, [r0]
	adds r0, r3
	str r0, [r4]
	movs r0, 0xC0
	lsls r0, 19
	adds r6, r0
	str r6, [r4, 0x4]
	ldr r0, _080BD098 @ =0x80000400
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, r7, 0
	lsrs r2, 21
	mov r6, r9
	lsrs r6, 15
	subs r4, r2, r6
	lsrs r0, r1, 24
	adds r1, r0, 0
	adds r1, 0x8
	cmp r0, r1
	bge _080BD080
	mov r9, r1
	mov r7, r12
	lsls r7, 1
	mov r8, r7
	lsls r5, 11
	str r5, [sp]
_080BD048:
	mov r2, r12
	adds r3, r2, 0
	adds r3, 0x8
	adds r5, r0, 0x1
	cmp r2, r3
	bge _080BD07A
	mov r1, r10
	lsls r6, r1, 12
	lsls r0, 6
	movs r7, 0xC0
	lsls r7, 19
	adds r0, r7
	ldr r1, [sp]
	adds r0, r1, r0
	mov r7, r8
	adds r1, r7, r0
	subs r2, r3, r2
_080BD06A:
	adds r0, r4, 0
	orrs r0, r6
	strh r0, [r1]
	adds r4, 0x1
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080BD06A
_080BD07A:
	adds r0, r5, 0
	cmp r0, r9
	blt _080BD048
_080BD080:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD090: .4byte 0x040000d4
_080BD094: .4byte gMonSpritesGfxPtr
_080BD098: .4byte 0x80000400
	thumb_func_end sub_80BCFCC

	.align 2, 0 @ Don't pad with nop.
