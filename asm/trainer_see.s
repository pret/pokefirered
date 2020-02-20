	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_808243C
sub_808243C: @ 808243C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080824D0 @ =gTasks
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0xA
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808246E
	ldr r0, [sp]
	bl ObjectEventClearAnim
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_0808246E:
	ldr r1, _080824D4 @ =gUnknown_83C7294
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r2, [sp]
	ldr r3, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r3
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _080824D8
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080824D8
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetTrainerFacingDirectionMovementType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetTrainerMovementType
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetTrainerFacingDirectionMovementType
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl TryOverrideTemplateCoordsForObjectEvent
	adds r0, r5, 0
	bl DestroyTask
	b _080824E2
	.align 2, 0
_080824D0: .4byte gTasks
_080824D4: .4byte gUnknown_83C7294
_080824D8:
	ldr r2, [sp]
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
_080824E2:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808243C

	thumb_func_start sub_80824EC
sub_80824EC: @ 80824EC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08082518 @ =sub_808243C
	movs r1, 0
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0808251C @ =gTasks+0x8
	adds r0, r1
	adds r0, 0x2
	adds r1, r4, 0
	bl StoreWordInTwoHalfwords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082518: .4byte sub_808243C
_0808251C: .4byte gTasks+0x8
	thumb_func_end sub_80824EC

	thumb_func_start ScrSpecial_EndTrainerApproach
ScrSpecial_EndTrainerApproach: @ 8082520
	push {lr}
	ldr r0, _0808252C @ =sub_8082530
	bl sub_8081E9C
	pop {r0}
	bx r0
	.align 2, 0
_0808252C: .4byte sub_8082530
	thumb_func_end ScrSpecial_EndTrainerApproach

	thumb_func_start sub_8082530
sub_8082530: @ 8082530
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_8082530

	thumb_func_start FldEff_ExclamationMarkIcon1
FldEff_ExclamationMarkIcon1: @ 8082544
	push {lr}
	ldr r0, _08082574 @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x53
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0808256C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08082578 @ =gSprites
	adds r0, r1
	movs r1, 0
	movs r2, 0
	bl sub_808265C
_0808256C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08082574: .4byte gUnknown_83C7388
_08082578: .4byte gSprites
	thumb_func_end FldEff_ExclamationMarkIcon1

	thumb_func_start sub_808257C
sub_808257C: @ 808257C
	push {lr}
	ldr r0, _080825AC @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080825A4
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080825B0 @ =gSprites
	adds r0, r1
	movs r1, 0x42
	movs r2, 0x1
	bl sub_808265C
_080825A4:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080825AC: .4byte gUnknown_83C7388
_080825B0: .4byte gSprites
	thumb_func_end sub_808257C

	thumb_func_start sub_80825B4
sub_80825B4: @ 80825B4
	push {lr}
	ldr r0, _080825E4 @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080825DC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080825E8 @ =gSprites
	adds r0, r1
	movs r1, 0x2E
	movs r2, 0x2
	bl sub_808265C
_080825DC:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080825E4: .4byte gUnknown_83C7388
_080825E8: .4byte gSprites
	thumb_func_end sub_80825B4

	thumb_func_start sub_80825EC
sub_80825EC: @ 80825EC
	push {lr}
	ldr r0, _0808261C @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08082614
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08082620 @ =gSprites
	adds r0, r1
	movs r1, 0x40
	movs r2, 0x3
	bl sub_808265C
_08082614:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808261C: .4byte gUnknown_83C7388
_08082620: .4byte gSprites
	thumb_func_end sub_80825EC

	thumb_func_start sub_8082624
sub_8082624: @ 8082624
	push {lr}
	ldr r0, _08082654 @ =gUnknown_83C7388
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0808264C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08082658 @ =gSprites
	adds r0, r1
	movs r1, 0x21
	movs r2, 0x4
	bl sub_808265C
_0808264C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08082654: .4byte gUnknown_83C7388
_08082658: .4byte gSprites
	thumb_func_end sub_8082624

	thumb_func_start sub_808265C
sub_808265C: @ 808265C
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldrb r4, [r0, 0x5]
	movs r3, 0xD
	negs r3, r3
	ands r3, r4
	movs r4, 0x4
	orrs r3, r4
	strb r3, [r0, 0x5]
	movs r3, 0x3E
	adds r3, r0
	mov r12, r3
	ldrb r3, [r3]
	movs r4, 0x2
	orrs r3, r4
	mov r4, r12
	strb r3, [r4]
	ldr r4, _080826A0 @ =gFieldEffectArguments
	ldr r3, [r4]
	strh r3, [r0, 0x2E]
	ldr r3, [r4, 0x4]
	strh r3, [r0, 0x30]
	ldr r3, [r4, 0x8]
	strh r3, [r0, 0x32]
	ldr r3, _080826A4 @ =0x0000fffb
	strh r3, [r0, 0x34]
	strh r1, [r0, 0x3C]
	adds r1, r2, 0
	bl StartSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080826A0: .4byte gFieldEffectArguments
_080826A4: .4byte 0x0000fffb
	thumb_func_end sub_808265C

	thumb_func_start objc_exclamation_mark_probably
objc_exclamation_mark_probably: @ 80826A8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080826DA
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080826E8
_080826DA:
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
	b _08082736
_080826E8:
	ldr r2, _0808272C @ =gObjectEvents
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08082730 @ =gSprites
	adds r1, r0
	ldrh r3, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r2, r3, r0
	strh r2, [r4, 0x36]
	ldrh r0, [r1, 0x20]
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0x10
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x24]
	strh r0, [r4, 0x24]
	ldrh r0, [r1, 0x26]
	adds r0, r2
	strh r0, [r4, 0x26]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _08082734
	adds r0, r3, 0x1
	strh r0, [r4, 0x34]
	b _08082736
	.align 2, 0
_0808272C: .4byte gObjectEvents
_08082730: .4byte gSprites
_08082734:
	strh r2, [r4, 0x34]
_08082736:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end objc_exclamation_mark_probably

	.align 2, 0 @ Don't pad with nop.
