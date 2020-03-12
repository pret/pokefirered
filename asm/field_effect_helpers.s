	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start SetUpReflection
SetUpReflection: @ 80DAD7C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r5, r2, 24
	lsrs r5, 24
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x22
	ldrsh r2, [r4, r0]
	adds r0, r4, 0
	movs r3, 0x98
	bl CreateCopySpriteAt
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DAE2C @ =gSprites
	adds r7, r1, r0
	ldr r0, _080DAE30 @ =sub_80DAF50
	str r0, [r7, 0x1C]
	ldrb r1, [r7, 0x5]
	movs r0, 0xC
	orrs r1, r0
	strb r1, [r7, 0x5]
	ldr r2, _080DAE34 @ =gReflectionEffectPaletteMap
	lsrs r0, r1, 4
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 4
	movs r2, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
	movs r1, 0x3F
	adds r1, r7
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0x40
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080DAE38 @ =gDummySpriteAnimTable
	str r0, [r7, 0x8]
	adds r0, r7, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _080DAE3C @ =gDummySpriteAffineAnimTable
	str r0, [r7, 0x10]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x8
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	adds r2, r7, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x2E]
	strh r0, [r7, 0x2E]
	ldrb r0, [r6, 0x8]
	strh r0, [r7, 0x30]
	strh r5, [r7, 0x3C]
	adds r0, r6, 0
	adds r1, r7, 0
	bl npc_pal_op
	cmp r5, 0
	bne _080DAE22
	ldrb r0, [r7, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r7, 0x1]
_080DAE22:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAE2C: .4byte gSprites
_080DAE30: .4byte sub_80DAF50
_080DAE34: .4byte gReflectionEffectPaletteMap
_080DAE38: .4byte gDummySpriteAnimTable
_080DAE3C: .4byte gDummySpriteAffineAnimTable
	thumb_func_end SetUpReflection

	thumb_func_start sub_80DAE40
sub_80DAE40: @ 80DAE40
	push {lr}
	ldrb r0, [r0, 0x5]
	bl GetObjectEventGraphicsInfo
	ldrh r0, [r0, 0xA]
	subs r0, 0x2
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80DAE40

	thumb_func_start npc_pal_op
npc_pal_op: @ 80DAE54
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _080DAEAC @ =gUnknown_83FECCC
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrb r0, [r5, 0x5]
	bl GetObjectEventGraphicsInfo
	ldrb r1, [r0, 0xC]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080DAEB0
	ldrb r0, [r5, 0x1F]
	bl MetatileBehavior_GetBridgeType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080DAE96
	ldrb r0, [r5, 0x1E]
	bl MetatileBehavior_GetBridgeType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080DAEB0
_080DAE96:
	subs r0, 0x1
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r0, r5, 0
	bl npc_pal_op_A
	b _080DAEBA
	.align 2, 0
_080DAEAC: .4byte gUnknown_83FECCC
_080DAEB0:
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r0, r5, 0
	bl npc_pal_op_B
_080DAEBA:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end npc_pal_op

	thumb_func_start npc_pal_op_B
npc_pal_op_B: @ 80DAEC4
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldrb r0, [r0, 0x5]
	bl GetObjectEventGraphicsInfo
	adds r2, r0, 0
	ldrh r1, [r2, 0x4]
	ldr r0, _080DAEF0 @ =0x000011ff
	cmp r1, r0
	beq _080DAF18
	ldrb r0, [r2, 0xC]
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0
	bne _080DAEF4
	ldrh r0, [r2, 0x2]
	adds r1, r4, 0
	bl LoadPlayerObjectReflectionPalette
	b _080DAF12
	.align 2, 0
_080DAEF0: .4byte 0x000011ff
_080DAEF4:
	cmp r1, 0xA
	bne _080DAF02
	ldrh r0, [r2, 0x2]
	adds r1, r4, 0
	bl LoadSpecialObjectReflectionPalette
	b _080DAF12
_080DAF02:
	adds r0, r4, 0
	bl GetObjectPaletteTag
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl PatchObjectPalette
_080DAF12:
	adds r0, r4, 0
	bl sub_807AA8C
_080DAF18:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end npc_pal_op_B

	thumb_func_start npc_pal_op_A
npc_pal_op_A: @ 80DAF20
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldrb r0, [r0, 0x5]
	bl GetObjectEventGraphicsInfo
	adds r2, r0, 0
	ldrh r1, [r2, 0x4]
	ldr r0, _080DAF4C @ =0x000011ff
	cmp r1, r0
	beq _080DAF44
	adds r0, r1, 0
	adds r1, r4, 0
	bl PatchObjectPalette
	adds r0, r4, 0
	bl sub_807AA8C
_080DAF44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DAF4C: .4byte 0x000011ff
	thumb_func_end npc_pal_op_A

	thumb_func_start sub_80DAF50
sub_80DAF50: @ 80DAF50
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DAF98 @ =gObjectEvents
	adds r7, r0, r1
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DAF9C @ =gSprites
	adds r5, r0, r1
	ldr r0, [r7]
	ldr r1, _080DAFA0 @ =0x00020001
	ands r0, r1
	cmp r0, r1
	bne _080DAF88
	ldrb r1, [r7, 0x8]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080DAFA4
_080DAF88:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _080DB0AE
	.align 2, 0
_080DAF98: .4byte gObjectEvents
_080DAF9C: .4byte gSprites
_080DAFA0: .4byte 0x00020001
_080DAFA4:
	ldr r1, _080DB0BC @ =gReflectionEffectPaletteMap
	ldrb r0, [r5, 0x5]
	lsrs r0, 4
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r5, 0x1]
	lsrs r1, 6
	lsls r1, 6
	ldrb r2, [r4, 0x1]
	movs r3, 0x3F
	adds r0, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r5, 0x3]
	lsrs r0, 6
	lsls r0, 6
	ldrb r2, [r4, 0x3]
	adds r1, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x3]
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	movs r2, 0x10
	orrs r0, r2
	lsls r0, 1
	subs r2, 0x4F
	mov r9, r2
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x3]
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldrh r2, [r4, 0x4]
	ldr r0, _080DB0C0 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r0, [r5, 0x18]
	str r0, [r4, 0x18]
	adds r0, r5, 0
	adds r0, 0x42
	ldrb r0, [r0]
	lsls r0, 26
	lsrs r0, 26
	adds r2, r4, 0
	adds r2, 0x42
	ands r3, r0
	ldrb r1, [r2]
	movs r0, 0x40
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	movs r0, 0x3E
	adds r0, r5
	mov r8, r0
	ldrb r0, [r0]
	adds r6, r4, 0
	adds r6, 0x3E
	movs r1, 0x4
	ands r1, r0
	ldrb r2, [r6]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ldrh r0, [r5, 0x20]
	strh r0, [r4, 0x20]
	adds r0, r7, 0
	bl sub_80DAE40
	ldrh r1, [r5, 0x22]
	adds r0, r1
	ldrh r1, [r4, 0x32]
	adds r1, r0
	strh r1, [r4, 0x22]
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x28
	strb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x29
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x29
	strb r0, [r1]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x2
	ands r1, r0
	ldrb r2, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DB0AE
	ldrb r0, [r4, 0x3]
	mov r2, r9
	ands r2, r0
	strb r2, [r4, 0x3]
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080DB0AE
	movs r1, 0x2
	adds r0, r2, 0
	orrs r0, r1
	strb r0, [r4, 0x3]
_080DB0AE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB0BC: .4byte gReflectionEffectPaletteMap
_080DB0C0: .4byte 0xfffffc00
	thumb_func_end sub_80DAF50

	thumb_func_start CreateWarpArrowSprite
CreateWarpArrowSprite: @ 80DB0C4
	push {r4,lr}
	ldr r0, _080DB10C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x20]
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r0, 0x40
	beq _080DB102
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DB110 @ =gSprites
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	orrs r0, r3
	strb r0, [r1]
_080DB102:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DB10C: .4byte gFieldEffectObjectTemplatePointers
_080DB110: .4byte gSprites
	thumb_func_end CreateWarpArrowSprite

	thumb_func_start objid_set_invisible
objid_set_invisible: @ 80DB114
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DB130 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080DB130: .4byte gSprites
	thumb_func_end objid_set_invisible

	thumb_func_start sub_80DB134
sub_80DB134: @ 80DB134
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _080DB1D8 @ =gSprites
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080DB17E
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r7, 16
	asrs r0, 16
	cmp r1, r0
	bne _080DB17E
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r6, 16
	asrs r0, 16
	cmp r1, r0
	beq _080DB1CA
_080DB17E:
	lsls r0, r7, 16
	asrs r0, 16
	lsls r1, r6, 16
	asrs r1, 16
	mov r4, sp
	adds r4, 0x2
	mov r2, sp
	adds r3, r4, 0
	bl SetSpritePosToMapCoords
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _080DB1D8 @ =gSprites
	adds r2, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	adds r0, 0x8
	strh r0, [r2, 0x20]
	ldrh r0, [r4]
	adds r0, 0x8
	strh r0, [r2, 0x22]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	strh r7, [r2, 0x2E]
	strh r6, [r2, 0x30]
	mov r1, r8
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
_080DB1CA:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB1D8: .4byte gSprites
	thumb_func_end sub_80DB134

	thumb_func_start oei_shadow
oei_shadow: @ 80DB1DC
	push {r4,r5,lr}
	ldr r5, _080DB268 @ =gFieldEffectArguments
	ldrb r0, [r5]
	ldrb r1, [r5, 0x4]
	ldrb r2, [r5, 0x8]
	bl GetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DB26C @ =gObjectEvents
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	bl GetObjectEventGraphicsInfo
	adds r4, r0, 0
	ldr r2, _080DB270 @ =gFieldEffectObjectTemplatePointers
	ldr r1, _080DB274 @ =gUnknown_83FECD2
	ldrb r0, [r4, 0xC]
	lsls r0, 26
	lsrs r0, 30
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	movs r3, 0x94
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080DB260
	ldr r0, _080DB278 @ =gSprites
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	ldr r0, [r5]
	strh r0, [r2, 0x2E]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x30]
	ldr r0, [r5, 0x8]
	strh r0, [r2, 0x32]
	ldrh r1, [r4, 0xA]
	lsls r1, 16
	asrs r1, 17
	ldr r3, _080DB27C @ =gUnknown_83FECD6
	ldrb r0, [r4, 0xC]
	lsls r0, 26
	lsrs r0, 30
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r2, 0x34]
_080DB260:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DB268: .4byte gFieldEffectArguments
_080DB26C: .4byte gObjectEvents
_080DB270: .4byte gFieldEffectObjectTemplatePointers
_080DB274: .4byte gUnknown_83FECD2
_080DB278: .4byte gSprites
_080DB27C: .4byte gUnknown_83FECD6
	thumb_func_end oei_shadow

	thumb_func_start oamc_shadow
oamc_shadow: @ 80DB280
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _080DB2AE
	adds r0, r5, 0
	movs r1, 0x3
	bl FieldEffectStop
	b _080DB334
_080DB2AE:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DB33C @ =gObjectEvents
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DB340 @ =gSprites
	adds r1, r0
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	ands r2, r0
	ldrb r3, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5, 0x5]
	ldrh r0, [r1, 0x20]
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x34]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldr r0, [r4]
	ldr r1, _080DB344 @ =0x00400001
	ands r0, r1
	cmp r0, r1
	bne _080DB32C
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsPokeGrass
	lsls r0, 24
	cmp r0, 0
	bne _080DB32C
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	cmp r0, 0
	bne _080DB32C
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	cmp r0, 0
	bne _080DB32C
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsReflective
	lsls r0, 24
	cmp r0, 0
	bne _080DB32C
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsReflective
	lsls r0, 24
	cmp r0, 0
	beq _080DB334
_080DB32C:
	adds r0, r5, 0
	movs r1, 0x3
	bl FieldEffectStop
_080DB334:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB33C: .4byte gObjectEvents
_080DB340: .4byte gSprites
_080DB344: .4byte 0x00400001
	thumb_func_end oamc_shadow

	thumb_func_start oei_grass_normal
oei_grass_normal: @ 80DB348
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080DB3E0 @ =gFieldEffectArguments
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DB3E4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x10]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080DB3D4
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DB3E8 @ =gSprites
	adds r3, r0, r1
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x3
	ldrb r1, [r5, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r5, 0x8]
	strh r0, [r3, 0x2E]
	ldr r0, [r5]
	strh r0, [r3, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r3, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r3, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r3, 0x36]
	ldr r0, [r5, 0x18]
	strh r0, [r3, 0x38]
	ldr r0, [r5, 0x1C]
	cmp r0, 0
	beq _080DB3D4
	adds r0, r3, 0
	movs r1, 0x4
	bl SeekSpriteAnim
_080DB3D4:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DB3E0: .4byte gFieldEffectArguments
_080DB3E4: .4byte gFieldEffectObjectTemplatePointers
_080DB3E8: .4byte gSprites
	thumb_func_end oei_grass_normal

	thumb_func_start unc_grass_normal
unc_grass_normal: @ 80DB3EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	lsrs r4, r0, 8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, _080DB498 @ =gCamera
	ldrb r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DB438
	ldr r0, _080DB49C @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, r4
	bne _080DB41E
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r0, r7
	beq _080DB438
_080DB41E:
	ldr r1, [r3, 0x4]
	ldrh r0, [r5, 0x30]
	subs r0, r1
	strh r0, [r5, 0x30]
	ldr r1, [r3, 0x8]
	ldrh r0, [r5, 0x32]
	subs r0, r1
	strh r0, [r5, 0x32]
	ldrb r1, [r2, 0x5]
	lsls r1, 8
	ldrb r0, [r2, 0x4]
	orrs r0, r1
	strh r0, [r5, 0x38]
_080DB438:
	ldrh r0, [r5, 0x34]
	lsrs r1, r0, 8
	mov r8, r1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrh r0, [r5, 0x36]
	lsls r0, 24
	lsrs r7, r0, 24
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r1, r4, 0
	adds r2, r7, 0
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080DB48C
	adds r0, r6, 0
	bl MetatileBehavior_IsTallGrass_2
	lsls r0, 24
	cmp r0, 0
	beq _080DB48C
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080DB4A0
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DB4A0
_080DB48C:
	adds r0, r5, 0
	movs r1, 0x4
	bl FieldEffectStop
	b _080DB4E4
	.align 2, 0
_080DB498: .4byte gCamera
_080DB49C: .4byte gSaveBlock1Ptr
_080DB4A0:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DB4F0 @ =gObjectEvents
	adds r2, r0, r1
	ldr r0, [r2, 0x10]
	ldr r1, [r5, 0x30]
	cmp r0, r1
	beq _080DB4C0
	ldr r0, [r2, 0x14]
	cmp r0, r1
	beq _080DB4C0
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_080DB4C0:
	movs r6, 0
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0
	bne _080DB4CE
	movs r6, 0x4
_080DB4CE:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8068EB4
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	adds r2, r6, 0
	bl sub_80DCD48
_080DB4E4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB4F0: .4byte gObjectEvents
	thumb_func_end unc_grass_normal

	thumb_func_start FldEff_JumpTallGrass
FldEff_JumpTallGrass: @ 80DB4F4
	push {r4,lr}
	ldr r4, _080DB558 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8063BC4
	ldr r0, _080DB55C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x28]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DB550
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DB560 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xC
	strh r0, [r2, 0x30]
_080DB550:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DB558: .4byte gFieldEffectArguments
_080DB55C: .4byte gFieldEffectObjectTemplatePointers
_080DB560: .4byte gSprites
	thumb_func_end FldEff_JumpTallGrass

	thumb_func_start sub_80DB564
sub_80DB564: @ 80DB564
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r5, 0
	ldr r0, _080DB5D4 @ =gSprites
	mov r8, r0
	lsls r3, 16
	asrs r3, 16
	lsls r4, 16
	asrs r4, 16
_080DB588:
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	mov r1, r8
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _080DB5DC
	ldr r1, [r2, 0x1C]
	ldr r0, _080DB5D8 @ =unc_grass_normal
	cmp r1, r0
	bne _080DB5DC
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r3, r0
	bne _080DB5DC
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r4, r0
	bne _080DB5DC
	ldrh r1, [r2, 0x34]
	lsls r0, r1, 16
	asrs r0, 24
	cmp r12, r0
	bne _080DB5DC
	movs r0, 0xFF
	ands r0, r1
	cmp r7, r0
	bne _080DB5DC
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r6, r0
	bne _080DB5DC
	adds r0, r5, 0
	b _080DB5E8
	.align 2, 0
_080DB5D4: .4byte gSprites
_080DB5D8: .4byte unc_grass_normal
_080DB5DC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3F
	bls _080DB588
	movs r0, 0x40
_080DB5E8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80DB564

	thumb_func_start FldEff_LongGrass
FldEff_LongGrass: @ 80DB5F4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080DB690 @ =gFieldEffectArguments
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DB694 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x3C]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080DB684
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DB698 @ =gSprites
	adds r4, r0, r1
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r5, 0x8]
	bl ZCoordToPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldr r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldr r0, [r5]
	strh r0, [r4, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r4, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r4, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r4, 0x36]
	ldr r0, [r5, 0x18]
	strh r0, [r4, 0x38]
	ldr r0, [r5, 0x1C]
	cmp r0, 0
	beq _080DB684
	adds r0, r4, 0
	movs r1, 0x6
	bl SeekSpriteAnim
_080DB684:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DB690: .4byte gFieldEffectArguments
_080DB694: .4byte gFieldEffectObjectTemplatePointers
_080DB698: .4byte gSprites
	thumb_func_end FldEff_LongGrass

	thumb_func_start unc_grass_tall
unc_grass_tall: @ 80DB69C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	lsrs r7, r0, 8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _080DB748 @ =gCamera
	ldrb r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DB6E8
	ldr r0, _080DB74C @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _080DB6CE
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r0, r6
	beq _080DB6E8
_080DB6CE:
	ldr r1, [r3, 0x4]
	ldrh r0, [r5, 0x30]
	subs r0, r1
	strh r0, [r5, 0x30]
	ldr r1, [r3, 0x8]
	ldrh r0, [r5, 0x32]
	subs r0, r1
	strh r0, [r5, 0x32]
	ldrb r1, [r2, 0x5]
	lsls r1, 8
	ldrb r0, [r2, 0x4]
	orrs r0, r1
	strh r0, [r5, 0x38]
_080DB6E8:
	ldrh r0, [r5, 0x34]
	lsrs r1, r0, 8
	mov r8, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r5, 0x36]
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r8
	adds r1, r7, 0
	adds r2, r6, 0
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080DB73C
	adds r0, r4, 0
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _080DB73C
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080DB750
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DB750
_080DB73C:
	adds r0, r5, 0
	movs r1, 0x11
	bl FieldEffectStop
	b _080DB786
	.align 2, 0
_080DB748: .4byte gCamera
_080DB74C: .4byte gSaveBlock1Ptr
_080DB750:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DB794 @ =gObjectEvents
	adds r2, r0, r1
	ldr r0, [r2, 0x10]
	ldr r1, [r5, 0x30]
	cmp r0, r1
	beq _080DB770
	ldr r0, [r2, 0x14]
	cmp r0, r1
	beq _080DB770
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_080DB770:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8068EB4
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	bl sub_80DCD48
_080DB786:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB794: .4byte gObjectEvents
	thumb_func_end unc_grass_tall

	thumb_func_start FldEff_JumpLongGrass
FldEff_JumpLongGrass: @ 80DB798
	push {r4,lr}
	ldr r4, _080DB7FC @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DB800 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x40]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DB7F4
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DB804 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0x12
	strh r0, [r2, 0x30]
_080DB7F4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DB7FC: .4byte gFieldEffectArguments
_080DB800: .4byte gFieldEffectObjectTemplatePointers
_080DB804: .4byte gSprites
	thumb_func_end FldEff_JumpLongGrass

	thumb_func_start sub_80DB808
sub_80DB808: @ 80DB808
	push {r4-r6,lr}
	ldr r6, _080DB89C @ =gFieldEffectArguments
	ldrb r0, [r6]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	bl GetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DB8A0 @ =gObjectEvents
	adds r5, r1, r0
	ldr r0, _080DB8A4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x78]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DB894
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r4, _080DB8A8 @ =gSprites
	adds r2, r4
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r6]
	strh r0, [r2, 0x2E]
	ldr r0, [r6, 0x4]
	strh r0, [r2, 0x30]
	ldr r0, [r6, 0x8]
	strh r0, [r2, 0x32]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x20]
	strh r0, [r2, 0x34]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x36]
_080DB894:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080DB89C: .4byte gFieldEffectArguments
_080DB8A0: .4byte gObjectEvents
_080DB8A4: .4byte gFieldEffectObjectTemplatePointers
_080DB8A8: .4byte gSprites
	thumb_func_end sub_80DB808

	thumb_func_start sub_80DB8AC
sub_80DB8AC: @ 80DB8AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
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
	bne _080DB8EA
	ldr r5, _080DB8F4 @ =gObjectEvents
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x2]
	lsls r0, 29
	cmp r0, 0
	blt _080DB8F8
_080DB8EA:
	adds r0, r4, 0
	movs r1, 0x29
	bl FieldEffectStop
	b _080DB98E
	.align 2, 0
_080DB8F4: .4byte gObjectEvents
_080DB8F8:
	ldrb r0, [r1, 0x5]
	bl GetObjectEventGraphicsInfo
	mov r8, r0
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DB99C @ =gSprites
	adds r6, r0, r1
	ldrh r5, [r6, 0x22]
	ldrh r7, [r6, 0x20]
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080DB934
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _080DB94E
_080DB934:
	strh r7, [r4, 0x34]
	strh r5, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DB94E
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080DB94E:
	strh r7, [r4, 0x20]
	strh r5, [r4, 0x22]
	mov r1, r8
	ldrh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 17
	subs r0, 0x8
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r0, [r6, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r6, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	adds r0, r4, 0
	bl sub_8068EB4
_080DB98E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB99C: .4byte gSprites
	thumb_func_end sub_80DB8AC

	thumb_func_start FldEff_SandFootprints
FldEff_SandFootprints: @ 80DB9A0
	push {r4,lr}
	ldr r4, _080DBA08 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DBA0C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x2C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080DB9FE
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DBA10 @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x3
	ldrb r2, [r4, 0xC]
	ands r2, r1
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0xD
	strh r1, [r0, 0x3C]
	ldrb r1, [r4, 0x10]
	bl StartSpriteAnim
_080DB9FE:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DBA08: .4byte gFieldEffectArguments
_080DBA0C: .4byte gFieldEffectObjectTemplatePointers
_080DBA10: .4byte gSprites
	thumb_func_end FldEff_SandFootprints

	thumb_func_start FldEff_DeepSandFootprints
FldEff_DeepSandFootprints: @ 80DBA14
	push {r4,r5,lr}
	ldr r4, _080DBA7C @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DBA80 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x5C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	adds r5, r1, 0
	cmp r1, 0x40
	beq _080DBA74
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DBA84 @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x3
	ldrb r2, [r4, 0xC]
	ands r2, r1
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x18
	strh r1, [r0, 0x3C]
	ldrb r1, [r4, 0x10]
	bl StartSpriteAnim
_080DBA74:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DBA7C: .4byte gFieldEffectArguments
_080DBA80: .4byte gFieldEffectObjectTemplatePointers
_080DBA84: .4byte gSprites
	thumb_func_end FldEff_DeepSandFootprints

	thumb_func_start FldEff_BikeTireTracks
FldEff_BikeTireTracks: @ 80DBA88
	push {r4,r5,lr}
	ldr r4, _080DBAF0 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DBAF4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x6C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	adds r5, r1, 0
	cmp r1, 0x40
	beq _080DBAE8
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DBAF8 @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x3
	ldrb r2, [r4, 0xC]
	ands r2, r1
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x23
	strh r1, [r0, 0x3C]
	ldrb r1, [r4, 0x10]
	bl StartSpriteAnim
_080DBAE8:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DBAF0: .4byte gFieldEffectArguments
_080DBAF4: .4byte gFieldEffectObjectTemplatePointers
_080DBAF8: .4byte gSprites
	thumb_func_end FldEff_BikeTireTracks

	thumb_func_start sub_80DBAFC
sub_80DBAFC: @ 80DBAFC
	push {lr}
	ldr r2, _080DBB14 @ =gUnknown_83FECE0
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080DBB14: .4byte gUnknown_83FECE0
	thumb_func_end sub_80DBAFC

	thumb_func_start sub_80DBB18
sub_80DBB18: @ 80DBB18
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080DBB2E
	movs r0, 0x1
	strh r0, [r1, 0x2E]
_080DBB2E:
	adds r0, r1, 0
	movs r1, 0
	bl sub_8068EB4
	pop {r0}
	bx r0
	thumb_func_end sub_80DBB18

	thumb_func_start sub_80DBB3C
sub_80DBB3C: @ 80DBB3C
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	ldrb r1, [r3]
	lsls r1, 29
	lsrs r1, 31
	adds r0, r4, 0
	bl sub_8068EB4
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x38
	ble _080DBB80
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
_080DBB80:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DBB3C

	thumb_func_start FldEff_Splash
FldEff_Splash: @ 80DBB88
	push {r4-r6,lr}
	ldr r6, _080DBC1C @ =gFieldEffectArguments
	ldrb r0, [r6]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	bl GetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DBC20 @ =gObjectEvents
	adds r5, r1, r0
	ldr r0, _080DBC24 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x34]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _080DBC12
	ldrb r0, [r5, 0x5]
	bl GetObjectEventGraphicsInfo
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	ldr r4, _080DBC28 @ =gSprites
	adds r3, r4
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r1, [r1]
	movs r2, 0x2
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	ldrb r2, [r5, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r4, [r3, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r2
	strb r1, [r3, 0x5]
	ldr r1, [r6]
	strh r1, [r3, 0x2E]
	ldr r1, [r6, 0x4]
	strh r1, [r3, 0x30]
	ldr r1, [r6, 0x8]
	strh r1, [r3, 0x32]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	subs r0, 0x4
	strh r0, [r3, 0x26]
	movs r0, 0x3F
	bl PlaySE
_080DBC12:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080DBC1C: .4byte gFieldEffectArguments
_080DBC20: .4byte gObjectEvents
_080DBC24: .4byte gFieldEffectObjectTemplatePointers
_080DBC28: .4byte gSprites
	thumb_func_end FldEff_Splash

	thumb_func_start sub_80DBC2C
sub_80DBC2C: @ 80DBC2C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080DBC5C
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
	beq _080DBC66
_080DBC5C:
	adds r0, r4, 0
	movs r1, 0xF
	bl FieldEffectStop
	b _080DBCA6
_080DBC66:
	ldr r3, _080DBCB0 @ =gSprites
	ldr r2, _080DBCB4 @ =gObjectEvents
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x20]
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8068EB4
_080DBCA6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBCB0: .4byte gSprites
_080DBCB4: .4byte gObjectEvents
	thumb_func_end sub_80DBC2C

	thumb_func_start FldEff_JumpSmallSplash
FldEff_JumpSmallSplash: @ 80DBCB8
	push {r4,lr}
	ldr r4, _080DBD1C @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8063BC4
	ldr r0, _080DBD20 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x38]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DBD14
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DBD24 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0x10
	strh r0, [r2, 0x30]
_080DBD14:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DBD1C: .4byte gFieldEffectArguments
_080DBD20: .4byte gFieldEffectObjectTemplatePointers
_080DBD24: .4byte gSprites
	thumb_func_end FldEff_JumpSmallSplash

	thumb_func_start oei_water_drop_tall
oei_water_drop_tall: @ 80DBD28
	push {r4,lr}
	ldr r4, _080DBD8C @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DBD90 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x30]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DBD84
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DBD94 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xE
	strh r0, [r2, 0x30]
_080DBD84:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DBD8C: .4byte gFieldEffectArguments
_080DBD90: .4byte gFieldEffectObjectTemplatePointers
_080DBD94: .4byte gSprites
	thumb_func_end oei_water_drop_tall

	thumb_func_start FldEff_FeetInFlowingWater
FldEff_FeetInFlowingWater: @ 80DBD98
	push {r4-r7,lr}
	ldr r7, _080DBE38 @ =gFieldEffectArguments
	ldrb r0, [r7]
	ldrb r1, [r7, 0x4]
	ldrb r2, [r7, 0x8]
	bl GetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DBE3C @ =gObjectEvents
	adds r6, r1, r0
	ldr r0, _080DBE40 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x34]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080DBE2E
	ldrb r0, [r6, 0x5]
	bl GetObjectEventGraphicsInfo
	adds r4, r0, 0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r3, _080DBE44 @ =gSprites
	adds r0, r3
	ldr r1, _080DBE48 @ =sub_80DBE50
	str r1, [r0, 0x1C]
	adds r5, r0, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r5]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	strh r1, [r0, 0x2E]
	ldr r1, [r7, 0x4]
	strh r1, [r0, 0x30]
	ldr r1, [r7, 0x8]
	strh r1, [r0, 0x32]
	ldr r1, _080DBE4C @ =0x0000ffff
	strh r1, [r0, 0x34]
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x36]
	ldrh r1, [r4, 0xA]
	lsls r1, 16
	asrs r1, 17
	subs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0x1
	bl StartSpriteAnim
_080DBE2E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DBE38: .4byte gFieldEffectArguments
_080DBE3C: .4byte gObjectEvents
_080DBE40: .4byte gFieldEffectObjectTemplatePointers
_080DBE44: .4byte gSprites
_080DBE48: .4byte sub_80DBE50
_080DBE4C: .4byte 0x0000ffff
	thumb_func_end FldEff_FeetInFlowingWater

	thumb_func_start sub_80DBE50
sub_80DBE50: @ 80DBE50
	push {r4,r5,lr}
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
	bne _080DBE8A
	ldr r2, _080DBE94 @ =gObjectEvents
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r2
	ldrb r0, [r5, 0x2]
	lsls r0, 28
	cmp r0, 0
	blt _080DBE98
_080DBE8A:
	adds r0, r4, 0
	movs r1, 0x22
	bl FieldEffectStop
	b _080DBEE2
	.align 2, 0
_080DBE94: .4byte gObjectEvents
_080DBE98:
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DBEEC @ =gSprites
	adds r0, r1
	ldrh r1, [r0, 0x20]
	strh r1, [r4, 0x20]
	ldrh r1, [r0, 0x22]
	strh r1, [r4, 0x22]
	adds r0, 0x43
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8068EB4
	ldr r1, [r5, 0x10]
	ldr r0, [r4, 0x34]
	cmp r1, r0
	beq _080DBEE2
	ldrh r0, [r5, 0x10]
	strh r0, [r4, 0x34]
	ldrh r0, [r5, 0x12]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080DBEE2
	movs r0, 0x3F
	bl PlaySE
_080DBEE2:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DBEEC: .4byte gSprites
	thumb_func_end sub_80DBE50

	thumb_func_start oei_ripples
oei_ripples: @ 80DBEF0
	push {r4,lr}
	ldr r0, _080DBF44 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x14]
	ldr r4, _080DBF48 @ =gFieldEffectArguments
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DBF3C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DBF4C @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x5
	strh r0, [r2, 0x2E]
_080DBF3C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DBF44: .4byte gFieldEffectObjectTemplatePointers
_080DBF48: .4byte gFieldEffectArguments
_080DBF4C: .4byte gSprites
	thumb_func_end oei_ripples

	thumb_func_start sub_80DBF50
sub_80DBF50: @ 80DBF50
	push {r4-r6,lr}
	ldr r6, _080DBFE4 @ =gFieldEffectArguments
	ldrb r0, [r6]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	bl GetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DBFE8 @ =gObjectEvents
	adds r5, r1, r0
	ldr r0, _080DBFEC @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x7C]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DBFDC
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r4, _080DBFF0 @ =gSprites
	adds r2, r4
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r6]
	strh r0, [r2, 0x2E]
	ldr r0, [r6, 0x4]
	strh r0, [r2, 0x30]
	ldr r0, [r6, 0x8]
	strh r0, [r2, 0x32]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x20]
	strh r0, [r2, 0x34]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x36]
_080DBFDC:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080DBFE4: .4byte gFieldEffectArguments
_080DBFE8: .4byte gObjectEvents
_080DBFEC: .4byte gFieldEffectObjectTemplatePointers
_080DBFF0: .4byte gSprites
	thumb_func_end sub_80DBF50

	thumb_func_start sub_80DBFF4
sub_80DBFF4: @ 80DBFF4
	push {r4,r5,lr}
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
	bne _080DC02E
	ldr r5, _080DC038 @ =gObjectEvents
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x2]
	lsls r0, 26
	cmp r0, 0
	blt _080DC03C
_080DC02E:
	adds r0, r4, 0
	movs r1, 0x2A
	bl FieldEffectStop
	b _080DC080
	.align 2, 0
_080DC038: .4byte gObjectEvents
_080DC03C:
	ldrb r0, [r1, 0x5]
	bl GetObjectEventGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _080DC088 @ =gSprites
	adds r1, r2
	ldrh r2, [r1, 0x20]
	strh r2, [r4, 0x20]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	ldrh r2, [r1, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r4, 0x22]
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8068EB4
_080DC080:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC088: .4byte gSprites
	thumb_func_end sub_80DBFF4

	thumb_func_start FldEff_Unknown19
FldEff_Unknown19: @ 80DC08C
	push {r4,lr}
	ldr r4, _080DC0EC @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DC0F0 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x44]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DC0E4
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DC0F4 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x13
	strh r0, [r2, 0x2E]
_080DC0E4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DC0EC: .4byte gFieldEffectArguments
_080DC0F0: .4byte gFieldEffectObjectTemplatePointers
_080DC0F4: .4byte gSprites
	thumb_func_end FldEff_Unknown19

	thumb_func_start FldEff_Unknown20
FldEff_Unknown20: @ 80DC0F8
	push {r4,lr}
	ldr r4, _080DC158 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DC15C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x48]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DC150
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DC160 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x14
	strh r0, [r2, 0x2E]
_080DC150:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DC158: .4byte gFieldEffectArguments
_080DC15C: .4byte gFieldEffectObjectTemplatePointers
_080DC160: .4byte gSprites
	thumb_func_end FldEff_Unknown20

	thumb_func_start FldEff_Unknown21
FldEff_Unknown21: @ 80DC164
	push {r4,lr}
	ldr r4, _080DC1C4 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DC1C8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x4C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DC1BC
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DC1CC @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x15
	strh r0, [r2, 0x2E]
_080DC1BC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DC1C4: .4byte gFieldEffectArguments
_080DC1C8: .4byte gFieldEffectObjectTemplatePointers
_080DC1CC: .4byte gSprites
	thumb_func_end FldEff_Unknown21

	thumb_func_start FldEff_Unknown22
FldEff_Unknown22: @ 80DC1D0
	push {r4,lr}
	ldr r4, _080DC230 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DC234 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x50]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DC228
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DC238 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x16
	strh r0, [r2, 0x2E]
_080DC228:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DC230: .4byte gFieldEffectArguments
_080DC234: .4byte gFieldEffectObjectTemplatePointers
_080DC238: .4byte gSprites
	thumb_func_end FldEff_Unknown22

	thumb_func_start StartAshFieldEffect
StartAshFieldEffect: @ 80DC23C
	push {r4,lr}
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080DC26C @ =gFieldEffectArguments
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	lsls r1, 16
	asrs r1, 16
	str r1, [r4, 0x4]
	movs r0, 0x52
	str r0, [r4, 0x8]
	movs r0, 0x1
	str r0, [r4, 0xC]
	str r2, [r4, 0x10]
	lsls r3, 16
	asrs r3, 16
	str r3, [r4, 0x14]
	movs r0, 0x7
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DC26C: .4byte gFieldEffectArguments
	thumb_func_end StartAshFieldEffect

	thumb_func_start oei_ash
oei_ash: @ 80DC270
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080DC2F0 @ =gFieldEffectArguments
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DC2F4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x18]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	ldrb r3, [r5, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DC2E6
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DC2F8 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r5, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r5]
	strh r0, [r2, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r2, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r2, 0x36]
_080DC2E6:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DC2F0: .4byte gFieldEffectArguments
_080DC2F4: .4byte gFieldEffectObjectTemplatePointers
_080DC2F8: .4byte gSprites
	thumb_func_end oei_ash

	thumb_func_start sub_80DC2FC
sub_80DC2FC: @ 80DC2FC
	push {lr}
	ldr r2, _080DC314 @ =gUnknown_83FECE8
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080DC314: .4byte gUnknown_83FECE8
	thumb_func_end sub_80DC2FC

	thumb_func_start sub_80DC318
sub_80DC318: @ 80DC318
	push {lr}
	adds r3, r0, 0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x36]
	subs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _080DC342
	movs r0, 0x1
	strh r0, [r3, 0x2E]
_080DC342:
	pop {r0}
	bx r0
	thumb_func_end sub_80DC318

	thumb_func_start sub_80DC348
sub_80DC348: @ 80DC348
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x34]
	bl MapGridSetMetatileIdAt
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldr r2, _080DC3A0 @ =gObjectEvents
	ldr r0, _080DC3A4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DC3A0: .4byte gObjectEvents
_080DC3A4: .4byte gPlayerAvatar
	thumb_func_end sub_80DC348

	thumb_func_start sub_80DC3A8
sub_80DC3A8: @ 80DC3A8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8068EB4
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DC3C8
	adds r0, r4, 0
	movs r1, 0x7
	bl FieldEffectStop
_080DC3C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC3A8

	thumb_func_start sub_80DC3D0
sub_80DC3D0: @ 80DC3D0
	push {r4,r5,lr}
	ldr r4, _080DC43C @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DC440 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x1C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x96
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r0, 0x40
	beq _080DC42C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DC444 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [r4, 0x8]
	movs r2, 0
	strh r0, [r1, 0x32]
	strh r2, [r1, 0x34]
	ldr r0, _080DC448 @ =0x0000ffff
	strh r0, [r1, 0x3A]
	movs r0, 0x1
	negs r0, r0
	strh r0, [r1, 0x3C]
_080DC42C:
	movs r0, 0x8
	bl FieldEffectActiveListRemove
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DC43C: .4byte gFieldEffectArguments
_080DC440: .4byte gFieldEffectObjectTemplatePointers
_080DC444: .4byte gSprites
_080DC448: .4byte 0x0000ffff
	thumb_func_end sub_80DC3D0

	thumb_func_start sub_80DC44C
sub_80DC44C: @ 80DC44C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _080DC474 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r2, 0x2E]
	movs r3, 0x10
	negs r3, r3
	ands r3, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 24
	orrs r0, r3
	strh r0, [r2, 0x2E]
	bx lr
	.align 2, 0
_080DC474: .4byte gSprites
	thumb_func_end sub_80DC44C

	thumb_func_start sub_80DC478
sub_80DC478: @ 80DC478
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _080DC4A0 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r2, 0x2E]
	movs r3, 0xF1
	negs r3, r3
	ands r3, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 20
	orrs r3, r0
	strh r3, [r2, 0x2E]
	bx lr
	.align 2, 0
_080DC4A0: .4byte gSprites
	thumb_func_end sub_80DC478

	thumb_func_start sub_80DC4A4
sub_80DC4A4: @ 80DC4A4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r4, _080DC4D0 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	ldrh r0, [r3, 0x2E]
	ldr r4, _080DC4D4 @ =0xfffff0ff
	ands r4, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 16
	orrs r4, r0
	strh r4, [r3, 0x2E]
	strh r2, [r3, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DC4D0: .4byte gSprites
_080DC4D4: .4byte 0xfffff0ff
	thumb_func_end sub_80DC4A4

	thumb_func_start sub_80DC4D8
sub_80DC4D8: @ 80DC4D8
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	bx lr
	thumb_func_end sub_80DC4D8

	thumb_func_start sub_80DC4E0
sub_80DC4E0: @ 80DC4E0
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF0
	ands r0, r1
	lsrs r0, 4
	bx lr
	thumb_func_end sub_80DC4E0

	thumb_func_start sub_80DC4EC
sub_80DC4EC: @ 80DC4EC
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF0
	lsls r0, 4
	ands r0, r1
	lsrs r0, 8
	bx lr
	thumb_func_end sub_80DC4EC

	thumb_func_start sub_80DC4F8
sub_80DC4F8: @ 80DC4F8
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x32
	ldrsh r0, [r6, r1]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080DC548 @ =gObjectEvents
	adds r4, r0
	ldrb r0, [r4, 0x4]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r0, _080DC54C @ =gSprites
	adds r5, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80DC550
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80DC588
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_80DC61C
	ldrb r0, [r5, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r2, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC548: .4byte gObjectEvents
_080DC54C: .4byte gSprites
	thumb_func_end sub_80DC4F8

	thumb_func_start sub_80DC550
sub_80DC550: @ 80DC550
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _080DC584 @ =gUnknown_83FECF4
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	bl sub_80DC4E0
	lsls r0, 24
	cmp r0, 0
	bne _080DC57C
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl StartSpriteAnimIfDifferent
_080DC57C:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC584: .4byte gUnknown_83FECF4
	thumb_func_end sub_80DC550

	thumb_func_start sub_80DC588
sub_80DC588: @ 80DC588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r1, 0
	ldrh r2, [r0, 0x10]
	mov r1, sp
	strh r2, [r1]
	ldrh r1, [r0, 0x12]
	mov r0, sp
	adds r0, 0x2
	strh r1, [r0]
	movs r2, 0x26
	ldrsh r3, [r4, r2]
	mov r8, r0
	cmp r3, 0
	bne _080DC610
	mov r0, sp
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r5, 0x3A
	ldrsh r0, [r4, r5]
	cmp r2, r0
	bne _080DC5C4
	lsls r0, r1, 16
	asrs r0, 16
	movs r5, 0x3C
	ldrsh r1, [r4, r5]
	cmp r0, r1
	beq _080DC610
_080DC5C4:
	strh r3, [r4, 0x38]
	strh r2, [r4, 0x3A]
	mov r1, r8
	movs r2, 0
	ldrsh r0, [r1, r2]
	strh r0, [r4, 0x3C]
	movs r5, 0x1
	mov r7, r8
	mov r6, sp
_080DC5D6:
	adds r0, r5, 0
	mov r1, sp
	adds r2, r7, 0
	bl MoveCoords
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080DC5FC
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _080DC610
_080DC5FC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4, 0x3A]
	strh r0, [r6]
	ldrh r0, [r4, 0x3C]
	mov r1, r8
	strh r0, [r1]
	cmp r5, 0x4
	bls _080DC5D6
_080DC610:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC588

	thumb_func_start sub_80DC61C
sub_80DC61C: @ 80DC61C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r1, _080DC680 @ =gUnknown_83FECFA
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	bl sub_80DC4D8
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r2, 0
	beq _080DC6A6
	ldrh r1, [r4, 0x36]
	adds r1, 0x1
	strh r1, [r4, 0x36]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080DC65C
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
_080DC65C:
	ldrh r1, [r4, 0x36]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _080DC66C
	ldrh r0, [r4, 0x34]
	negs r0, r0
	strh r0, [r4, 0x34]
_080DC66C:
	cmp r2, 0x2
	beq _080DC6A6
	adds r0, r4, 0
	bl sub_80DC4EC
	lsls r0, 24
	cmp r0, 0
	bne _080DC684
	ldrh r0, [r4, 0x26]
	b _080DC68A
	.align 2, 0
_080DC680: .4byte gUnknown_83FECFA
_080DC684:
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x30]
	adds r0, r3
_080DC68A:
	strh r0, [r5, 0x26]
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0
	beq _080DC69C
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
_080DC69C:
	ldrh r0, [r5, 0x20]
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
_080DC6A6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC61C

	thumb_func_start sub_80DC6B0
sub_80DC6B0: @ 80DC6B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080DC6F4 @ =gDummySpriteTemplate
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _080DC6F8 @ =gSprites
	adds r2, r1
	ldr r1, _080DC6FC @ =sub_80DC700
	str r1, [r2, 0x1C]
	movs r1, 0x3E
	adds r1, r2
	mov r12, r1
	ldrb r1, [r1]
	movs r3, 0x4
	orrs r1, r3
	mov r3, r12
	strb r1, [r3]
	strh r4, [r2, 0x2E]
	movs r1, 0x1
	strh r1, [r2, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DC6F4: .4byte gDummySpriteTemplate
_080DC6F8: .4byte gSprites
_080DC6FC: .4byte sub_80DC700
	thumb_func_end sub_80DC6B0

	thumb_func_start sub_80DC700
sub_80DC700: @ 80DC700
	push {lr}
	adds r2, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DC73C @ =gSprites
	adds r3, r0, r1
	ldrh r1, [r2, 0x32]
	adds r0, r1, 0x1
	strh r0, [r2, 0x32]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080DC728
	ldrh r0, [r2, 0x30]
	ldrh r1, [r3, 0x26]
	adds r0, r1
	strh r0, [r3, 0x26]
_080DC728:
	ldrh r1, [r2, 0x32]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _080DC738
	ldrh r0, [r2, 0x30]
	negs r0, r0
	strh r0, [r2, 0x30]
_080DC738:
	pop {r0}
	bx r0
	.align 2, 0
_080DC73C: .4byte gSprites
	thumb_func_end sub_80DC700

	thumb_func_start FldEff_Dust
FldEff_Dust: @ 80DC740
	push {r4,lr}
	ldr r4, _080DC7A4 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8063BC4
	ldr r0, _080DC7A8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x24]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DC79C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DC7AC @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xA
	strh r0, [r2, 0x30]
_080DC79C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DC7A4: .4byte gFieldEffectArguments
_080DC7A8: .4byte gFieldEffectObjectTemplatePointers
_080DC7AC: .4byte gSprites
	thumb_func_end FldEff_Dust

	thumb_func_start FldEff_SandPile
FldEff_SandPile: @ 80DC7B0
	push {r4-r7,lr}
	ldr r7, _080DC85C @ =gFieldEffectArguments
	ldrb r0, [r7]
	ldrb r1, [r7, 0x4]
	ldrb r2, [r7, 0x8]
	bl GetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DC860 @ =gObjectEvents
	adds r6, r1, r0
	ldr r0, _080DC864 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x74]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _080DC854
	ldrb r0, [r6, 0x5]
	bl GetObjectEventGraphicsInfo
	adds r5, r0, 0
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r4, _080DC868 @ =gSprites
	adds r0, r4
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	strh r1, [r0, 0x2E]
	ldr r1, [r7, 0x4]
	strh r1, [r0, 0x30]
	ldr r1, [r7, 0x8]
	strh r1, [r0, 0x32]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x34]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x36]
	ldrh r1, [r5, 0xA]
	lsls r1, 16
	asrs r1, 17
	subs r1, 0x2
	strh r1, [r0, 0x26]
	movs r1, 0x2
	bl SeekSpriteAnim
_080DC854:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DC85C: .4byte gFieldEffectArguments
_080DC860: .4byte gObjectEvents
_080DC864: .4byte gFieldEffectObjectTemplatePointers
_080DC868: .4byte gSprites
	thumb_func_end FldEff_SandPile

	thumb_func_start sub_80DC86C
sub_80DC86C: @ 80DC86C
	push {r4-r6,lr}
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
	bne _080DC8A6
	ldr r2, _080DC8B0 @ =gObjectEvents
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1, 0x2]
	lsls r0, 27
	cmp r0, 0
	blt _080DC8B4
_080DC8A6:
	adds r0, r4, 0
	movs r1, 0x27
	bl FieldEffectStop
	b _080DC926
	.align 2, 0
_080DC8B0: .4byte gObjectEvents
_080DC8B4:
	ldr r2, _080DC930 @ =gSprites
	ldrb r1, [r1, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r5, [r0, 0x22]
	ldrh r6, [r0, 0x20]
	movs r2, 0x20
	ldrsh r1, [r0, r2]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080DC8DC
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _080DC8F6
_080DC8DC:
	strh r6, [r4, 0x34]
	strh r5, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DC8F6
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080DC8F6:
	strh r6, [r4, 0x20]
	strh r5, [r4, 0x22]
	ldr r3, _080DC930 @ =gSprites
	ldr r2, _080DC934 @ =gObjectEvents
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8068EB4
_080DC926:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC930: .4byte gSprites
_080DC934: .4byte gObjectEvents
	thumb_func_end sub_80DC86C

	thumb_func_start FldEff_Bubbles
FldEff_Bubbles: @ 80DC938
	push {r4,lr}
	ldr r4, _080DC990 @ =gFieldEffectArguments
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0
	bl sub_8063BC4
	ldr r0, _080DC994 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x88
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DC988
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080DC998 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
_080DC988:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DC990: .4byte gFieldEffectArguments
_080DC994: .4byte gFieldEffectObjectTemplatePointers
_080DC998: .4byte gSprites
	thumb_func_end FldEff_Bubbles

	thumb_func_start sub_80DC99C
sub_80DC99C: @ 80DC99C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, r0
	strh r1, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8068EB4
	ldrh r1, [r4, 0x3E]
	ldr r0, _080DC9D8 @ =0x00001004
	ands r0, r1
	cmp r0, 0
	beq _080DC9D0
	adds r0, r4, 0
	movs r1, 0x35
	bl FieldEffectStop
_080DC9D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DC9D8: .4byte 0x00001004
	thumb_func_end sub_80DC99C

	thumb_func_start sub_80DC9DC
sub_80DC9DC: @ 80DC9DC
	movs r0, 0
	bx lr
	thumb_func_end sub_80DC9DC

	thumb_func_start ShowTreeDisguiseFieldEffect
ShowTreeDisguiseFieldEffect: @ 80DC9E0
	push {lr}
	movs r0, 0x1C
	movs r1, 0x18
	movs r2, 0x4
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end ShowTreeDisguiseFieldEffect

	thumb_func_start ShowMountainDisguiseFieldEffect
ShowMountainDisguiseFieldEffect: @ 80DC9F0
	push {lr}
	movs r0, 0x1D
	movs r1, 0x19
	movs r2, 0x3
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end ShowMountainDisguiseFieldEffect

	thumb_func_start ShowSandDisguiseFieldEffect
ShowSandDisguiseFieldEffect: @ 80DCA00
	push {lr}
	movs r0, 0x24
	movs r1, 0x1C
	movs r2, 0x2
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end ShowSandDisguiseFieldEffect

	thumb_func_start ShowDisguiseFieldEffect
ShowDisguiseFieldEffect: @ 80DCA10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r5, _080DCA44 @ =gFieldEffectArguments
	ldrb r0, [r5]
	ldrb r1, [r5, 0x4]
	ldrb r2, [r5, 0x8]
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _080DCA48
	adds r0, r4, 0
	bl FieldEffectActiveListRemove
	movs r0, 0x40
	b _080DCAB4
	.align 2, 0
_080DCA44: .4byte gFieldEffectArguments
_080DCA48:
	ldr r1, _080DCAC0 @ =gFieldEffectObjectTemplatePointers
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	mov r1, sp
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080DCAB0
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080DCAC4 @ =gSprites
	adds r2, r0
	movs r0, 0x3E
	adds r0, r2
	mov r12, r0
	ldrb r3, [r0]
	lsls r1, r3, 30
	lsrs r1, 31
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	movs r0, 0x3
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	lsls r3, r7, 4
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x5]
	mov r0, r8
	strh r0, [r2, 0x30]
	ldr r0, [r5]
	strh r0, [r2, 0x32]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x34]
	ldr r0, [r5, 0x8]
	strh r0, [r2, 0x36]
_080DCAB0:
	mov r0, sp
	ldrb r0, [r0]
_080DCAB4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DCAC0: .4byte gFieldEffectObjectTemplatePointers
_080DCAC4: .4byte gSprites
	thumb_func_end ShowDisguiseFieldEffect

	thumb_func_start sub_80DCAC8
sub_80DCAC8: @ 80DCAC8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x34]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5, 0x36]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetObjectEventIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _080DCAF8
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldEffectStop
_080DCAF8:
	ldr r4, _080DCBB0 @ =gObjectEvents
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	bl GetObjectEventGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r1, _080DCBB4 @ =gSprites
	adds r2, r1
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r3, 0x3E
	adds r3, r5
	mov r12, r3
	movs r3, 0x4
	ands r3, r1
	mov r1, r12
	ldrb r4, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	mov r3, r12
	strb r1, [r3]
	ldrh r1, [r2, 0x20]
	strh r1, [r5, 0x20]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	ldrh r1, [r2, 0x22]
	adds r0, r1
	subs r0, 0x10
	strh r0, [r5, 0x22]
	adds r2, 0x43
	ldrb r0, [r2]
	subs r0, 0x1
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	bne _080DCB78
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080DCB78:
	movs r3, 0x2E
	ldrsh r0, [r5, r3]
	ldrh r2, [r5, 0x2E]
	cmp r0, 0x2
	bne _080DCB94
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DCB94
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_080DCB94:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080DCBA8
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldEffectStop
_080DCBA8:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DCBB0: .4byte gObjectEvents
_080DCBB4: .4byte gSprites
	thumb_func_end sub_80DCAC8

	thumb_func_start sub_80DCBB8
sub_80DCBB8: @ 80DCBB8
	push {lr}
	adds r1, r0, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080DCBD6
	ldr r2, _080DCBDC @ =gSprites
	ldrb r1, [r1, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
_080DCBD6:
	pop {r0}
	bx r0
	.align 2, 0
_080DCBDC: .4byte gSprites
	thumb_func_end sub_80DCBB8

	thumb_func_start sub_80DCBE0
sub_80DCBE0: @ 80DCBE0
	push {lr}
	adds r2, r0, 0
	adds r2, 0x21
	ldrb r1, [r2]
	cmp r1, 0x2
	beq _080DCC16
	cmp r1, 0
	beq _080DCC16
	ldrb r1, [r0, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DCC08 @ =gSprites
	adds r1, r0, r1
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080DCC0C
	movs r0, 0
	b _080DCC18
	.align 2, 0
_080DCC08: .4byte gSprites
_080DCC0C:
	movs r0, 0x2
	strb r0, [r2]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_080DCC16:
	movs r0, 0x1
_080DCC18:
	pop {r1}
	bx r1
	thumb_func_end sub_80DCBE0

	thumb_func_start FldEff_Sparkle
FldEff_Sparkle: @ 80DCC1C
	push {r4,lr}
	ldr r4, _080DCC84 @ =gFieldEffectArguments
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	str r0, [r4, 0x4]
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8063BC4
	ldr r0, _080DCC88 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x8C
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080DCC7C
	ldr r0, _080DCC8C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r0, 0x3
	ldrb r2, [r4, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
_080DCC7C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DCC84: .4byte gFieldEffectArguments
_080DCC88: .4byte gFieldEffectObjectTemplatePointers
_080DCC8C: .4byte gSprites
	thumb_func_end FldEff_Sparkle

	thumb_func_start sub_80DCC90
sub_80DCC90: @ 80DCC90
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080DCCC4
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DCCBC
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_080DCCBC:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080DCCDA
_080DCCC4:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x22
	ble _080DCCDA
	adds r0, r2, 0
	movs r1, 0x36
	bl FieldEffectStop
_080DCCDA:
	pop {r0}
	bx r0
	thumb_func_end sub_80DCC90

	thumb_func_start sub_80DCCE0
sub_80DCCE0: @ 80DCCE0
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DCCFE
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
	b _080DCD14
_080DCCFE:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8068EB4
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0
	bl SetObjectSubpriorityByZCoord
_080DCD14:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DCCE0

	thumb_func_start sub_80DCD1C
sub_80DCD1C: @ 80DCD1C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DCD3A
	ldrh r1, [r2, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl FieldEffectStop
	b _080DCD42
_080DCD3A:
	adds r0, r2, 0
	movs r1, 0
	bl sub_8068EB4
_080DCD42:
	pop {r0}
	bx r0
	thumb_func_end sub_80DCD1C

	thumb_func_start sub_80DCD48
sub_80DCD48: @ 80DCD48
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r0, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	adds r1, r6, 0
	bl SetObjectSubpriorityByZCoord
	movs r7, 0
_080DCD5E:
	lsls r0, r7, 3
	adds r0, r7
	lsls r0, 2
	ldr r1, _080DCDF8 @ =gObjectEvents
	adds r4, r0, r1
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _080DCE00
	ldrb r0, [r4, 0x5]
	bl GetObjectEventGraphicsInfo
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DCDFC @ =gSprites
	adds r5, r0, r1
	adds r0, r6, 0
	adds r0, 0x28
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrh r0, [r6, 0x20]
	adds r1, r0, r2
	subs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x20
	ldrsh r2, [r5, r0]
	cmp r1, r2
	bge _080DCE00
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r2
	ble _080DCE00
	adds r0, r5, 0
	adds r0, 0x29
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r2, [r5, 0x22]
	adds r2, r3
	ldrh r4, [r5, 0x22]
	adds r0, r6, 0
	adds r0, 0x29
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r6, 0x22]
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	adds r3, r0, r3
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	cmp r2, r3
	blt _080DCDD8
	cmp r2, r0
	bge _080DCE00
_080DCDD8:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	ble _080DCE00
	adds r2, r6, 0
	adds r2, 0x43
	adds r0, r5, 0
	adds r0, 0x43
	ldrb r1, [r0]
	ldrb r0, [r2]
	cmp r0, r1
	bhi _080DCE00
	adds r0, r1, 0x2
	strb r0, [r2]
	b _080DCE0A
	.align 2, 0
_080DCDF8: .4byte gObjectEvents
_080DCDFC: .4byte gSprites
_080DCE00:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bls _080DCD5E
_080DCE0A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DCD48

	.align 2, 0 @ Don't pad with nop.
