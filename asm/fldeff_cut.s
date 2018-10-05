	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8097874
sub_8097874: @ 8097874
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x1
	bl sub_8058F48
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_805A2BC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8097874

	thumb_func_start sub_8097898
sub_8097898: @ 8097898
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, _080978CC @ =gUnknown_2039874
	movs r0, 0
	strb r0, [r4]
	bl sub_80CCD84
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080978E0
	movs r0, 0x5F
	bl npc_before_player_of_type
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08097904
	ldr r1, _080978D0 @ =gUnknown_3005024
	ldr r0, _080978D4 @ =hm_add_c3_launch_phase_2
	str r0, [r1]
	ldr r1, _080978D8 @ =gUnknown_203B0C4
	ldr r0, _080978DC @ =sub_80979D0
	b _080978EC
	.align 2, 0
_080978CC: .4byte gUnknown_2039874
_080978D0: .4byte gUnknown_3005024
_080978D4: .4byte hm_add_c3_launch_phase_2
_080978D8: .4byte gUnknown_203B0C4
_080978DC: .4byte sub_80979D0
_080978E0:
	strb r0, [r4]
_080978E2:
	ldr r1, _080978F4 @ =gUnknown_3005024
	ldr r0, _080978F8 @ =hm_add_c3_launch_phase_2
	str r0, [r1]
	ldr r1, _080978FC @ =gUnknown_203B0C4
	ldr r0, _08097900 @ =sub_8097984
_080978EC:
	str r0, [r1]
	movs r0, 0x1
	b _08097970
	.align 2, 0
_080978F4: .4byte gUnknown_3005024
_080978F8: .4byte hm_add_c3_launch_phase_2
_080978FC: .4byte gUnknown_203B0C4
_08097900: .4byte sub_8097984
_08097904:
	ldr r4, _0809797C @ =gUnknown_2039A04
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl PlayerGetDestCoords
	movs r7, 0
	adds r2, r4, 0
	ldr r0, _08097980 @ =0x0000ffff
	mov r8, r0
_08097916:
	mov r1, r8
	adds r0, r1, r7
	ldrh r1, [r2, 0x2]
	adds r0, r1
	movs r6, 0
	lsls r0, 16
	asrs r5, r0, 16
_08097924:
	mov r1, r8
	adds r0, r1, r6
	ldrh r1, [r2]
	adds r0, r1
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	str r2, [sp]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp]
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _0809795A
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8097874
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp]
	cmp r0, 0x1
	beq _080978E2
_0809795A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x2
	bls _08097924
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _08097916
	movs r0, 0
_08097970:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809797C: .4byte gUnknown_2039A04
_08097980: .4byte 0x0000ffff
	thumb_func_end sub_8097898

	thumb_func_start sub_8097984
sub_8097984: @ 8097984
	push {lr}
	movs r0, 0x1
	bl FieldEffectStart
	bl GetCursorSelectionMonId
	ldr r1, _0809799C @ =gUnknown_20386E0
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809799C: .4byte gUnknown_20386E0
	thumb_func_end sub_8097984

	thumb_func_start sub_80979A0
sub_80979A0: @ 80979A0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080979C8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080979CC @ =sub_8097A20
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x12
	bl IncrementGameStat
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080979C8: .4byte gTasks
_080979CC: .4byte sub_8097A20
	thumb_func_end sub_80979A0

	thumb_func_start sub_80979D0
sub_80979D0: @ 80979D0
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _080979E8 @ =gUnknown_20386E0
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1]
	ldr r0, _080979EC @ =gUnknown_81BDF6B
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080979E8: .4byte gUnknown_20386E0
_080979EC: .4byte gUnknown_81BDF6B
	thumb_func_end sub_80979D0

	thumb_func_start sub_80979F0
sub_80979F0: @ 80979F0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08097A18 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _08097A1C @ =sub_8097C6C
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x12
	bl IncrementGameStat
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08097A18: .4byte gTasks
_08097A1C: .4byte sub_8097C6C
	thumb_func_end sub_80979F0

	thumb_func_start sub_8097A20
sub_8097A20: @ 8097A20
	push {lr}
	movs r0, 0x1
	bl FieldEffectActiveListRemove
	ldr r0, _08097A38 @ =gUnknown_2039874
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08097A3C
	bl sub_80CCDD0
	b _08097A42
	.align 2, 0
_08097A38: .4byte gUnknown_2039874
_08097A3C:
	movs r0, 0x3A
	bl FieldEffectStart
_08097A42:
	pop {r0}
	bx r0
	thumb_func_end sub_8097A20

	thumb_func_start sub_8097A48
sub_8097A48: @ 8097A48
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r7, 0
	movs r0, 0x79
	bl PlaySE
	ldr r4, _08097B38 @ =gUnknown_2039A04
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl PlayerGetDestCoords
	mov r8, r4
	ldr r0, _08097B3C @ =0x0000ffff
	mov r9, r0
_08097A68:
	mov r1, r9
	adds r0, r1, r7
	mov r2, r8
	ldrh r2, [r2, 0x2]
	adds r0, r2
	movs r6, 0
	lsls r0, 16
	asrs r5, r0, 16
_08097A78:
	mov r1, r9
	adds r0, r1, r6
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _08097ABC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8097874
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08097ABC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8097B50
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805F378
_08097ABC:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x2
	bls _08097A78
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _08097A68
	bl DrawWholeMapView
	ldr r4, _08097B40 @ =gUnknown_2039870
	movs r0, 0x8
	bl Alloc
	str r0, [r4]
	movs r7, 0
	ldr r5, _08097B44 @ =gSprites
_08097AE2:
	ldr r0, _08097B48 @ =gUnknown_2037078
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r2, 0x80
	lsls r2, 12
	adds r1, r2
	asrs r1, 16
	ldrb r2, [r0]
	adds r2, 0x14
	ldr r0, _08097B4C @ =gUnknown_83D414C
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, r7
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	lsls r1, r7, 5
	strh r1, [r0, 0x32]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _08097AE2
	movs r0, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08097B38: .4byte gUnknown_2039A04
_08097B3C: .4byte 0x0000ffff
_08097B40: .4byte gUnknown_2039870
_08097B44: .4byte gSprites
_08097B48: .4byte gUnknown_2037078
_08097B4C: .4byte gUnknown_83D414C
	thumb_func_end sub_8097A48

	thumb_func_start sub_8097B50
sub_8097B50: @ 8097B50
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 16
	movs r4, 0
	lsrs r6, r0, 16
	asrs r0, 16
	lsrs r7, r1, 16
	asrs r1, 16
	bl sub_8058E48
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _08097B84 @ =gUnknown_83D4100
	ldr r5, _08097B88 @ =0x0000ffff
	mov r12, r1
_08097B6E:
	lsls r3, r4, 2
	adds r0, r3, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _08097BA0
	cmp r0, r2
	beq _08097B8C
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	b _08097B6E
	.align 2, 0
_08097B84: .4byte gUnknown_83D4100
_08097B88: .4byte 0x0000ffff
_08097B8C:
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	mov r2, r12
	adds r2, 0x2
	adds r2, r3, r2
	ldrh r2, [r2]
	bl MapGridSetMetatileIdAt
_08097BA0:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8097B50

	thumb_func_start objc_8097BA8
objc_8097BA8: @ 8097BA8
	movs r2, 0
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x34]
	ldr r1, _08097BB8 @ =objc_8097BBC
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_08097BB8: .4byte objc_8097BBC
	thumb_func_end objc_8097BA8

	thumb_func_start objc_8097BBC
objc_8097BBC: @ 8097BBC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x2E]
	adds r1, 0x1
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 18
	adds r1, r0
	strh r1, [r4, 0x2E]
	adds r2, 0x1
	strh r2, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x1C
	beq _08097C08
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _08097C0C
_08097C08:
	ldr r0, _08097C14 @ =sub_8097C18
	str r0, [r4, 0x1C]
_08097C0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C14: .4byte sub_8097C18
	thumb_func_end objc_8097BBC

	thumb_func_start sub_8097C18
sub_8097C18: @ 8097C18
	push {r4-r6,lr}
	movs r4, 0x1
_08097C1C:
	ldr r6, _08097C64 @ =gUnknown_2039870
	ldr r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08097C68 @ =gSprites
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08097C1C
	ldr r0, [r6]
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x3A
	bl FieldEffectStop
	ldr r0, [r6]
	bl Free
	bl sub_80696C0
	bl ScriptContext2_Disable
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08097C64: .4byte gUnknown_2039870
_08097C68: .4byte gSprites
	thumb_func_end sub_8097C18

	thumb_func_start sub_8097C6C
sub_8097C6C: @ 8097C6C
	push {lr}
	movs r0, 0x79
	bl PlaySE
	movs r0, 0x2
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_8097C6C

	.align 2, 0 @ Don't pad with nop.
