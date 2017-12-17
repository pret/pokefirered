	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start GetAllGroundEffectFlags_OnSpawn
GetAllGroundEffectFlags_OnSpawn: @ 8067B34
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectUpdateMetatileBehaviors
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Reflection
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_TallGrassOnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_LongGrassOnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_HotSprings
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnSpawn

	thumb_func_start GetAllGroundEffectFlags_OnBeginStep
GetAllGroundEffectFlags_OnBeginStep: @ 8067B7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectUpdateMetatileBehaviors
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Reflection
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_TallGrassOnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_LongGrassOnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Tracks
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Puddle
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_HotSprings
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnBeginStep

	thumb_func_start GetAllGroundEffectFlags_OnFinishStep
GetAllGroundEffectFlags_OnFinishStep: @ 8067BD4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectUpdateMetatileBehaviors
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Puddle
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Ripple
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_HotSprings
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Seaweed
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_JumpLanding
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnFinishStep

	thumb_func_start FieldObjectUpdateMetatileBehaviors
FieldObjectUpdateMetatileBehaviors: @ 8067C24
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	strb r0, [r4, 0x1F]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	strb r0, [r4, 0x1E]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectUpdateMetatileBehaviors

	thumb_func_start GetGroundEffectFlags_Reflection
GetGroundEffectFlags_Reflection: @ 8067C4C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _08067C90 @ =gUnknown_83A7024
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	adds r0, r4, 0
	bl sub_8067F88
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08067C94
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 30
	cmp r0, 0
	blt _08067C9E
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x2]
	subs r0, r2, 0x1
	lsls r0, 2
	add r0, sp
	ldr r1, [r5]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r5]
	b _08067C9E
	.align 2, 0
_08067C90: .4byte gUnknown_83A7024
_08067C94:
	ldrb r1, [r4, 0x2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_08067C9E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Reflection

	thumb_func_start GetGroundEffectFlags_TallGrassOnSpawn
GetGroundEffectFlags_TallGrassOnSpawn: @ 8067CA8
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl sub_8059F34
	lsls r0, 24
	cmp r0, 0
	beq _08067CC0
	ldr r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	str r0, [r4]
_08067CC0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_TallGrassOnSpawn

	thumb_func_start GetGroundEffectFlags_TallGrassOnBeginStep
GetGroundEffectFlags_TallGrassOnBeginStep: @ 8067CC8
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl sub_8059F34
	lsls r0, 24
	cmp r0, 0
	beq _08067CE0
	ldr r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	str r0, [r4]
_08067CE0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_TallGrassOnBeginStep

	thumb_func_start GetGroundEffectFlags_LongGrassOnSpawn
GetGroundEffectFlags_LongGrassOnSpawn: @ 8067CE8
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl sub_8059F4C
	lsls r0, 24
	cmp r0, 0
	beq _08067D00
	ldr r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	str r0, [r4]
_08067D00:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_LongGrassOnSpawn

	thumb_func_start GetGroundEffectFlags_LongGrassOnBeginStep
GetGroundEffectFlags_LongGrassOnBeginStep: @ 8067D08
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl sub_8059F4C
	lsls r0, 24
	cmp r0, 0
	beq _08067D20
	ldr r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	str r0, [r4]
_08067D20:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_LongGrassOnBeginStep

	thumb_func_start GetGroundEffectFlags_Tracks
GetGroundEffectFlags_Tracks: @ 8067D28
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1F]
	bl sub_8059B8C
	lsls r0, 24
	cmp r0, 0
	beq _08067D42
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 1
	b _08067D5E
_08067D42:
	ldrb r0, [r4, 0x1F]
	bl sub_8059B5C
	lsls r0, 24
	cmp r0, 0
	bne _08067D5A
	ldrb r0, [r4, 0x1F]
	bl sub_8059F54
	lsls r0, 24
	cmp r0, 0
	beq _08067D62
_08067D5A:
	ldr r0, [r5]
	movs r1, 0x80
_08067D5E:
	orrs r0, r1
	str r0, [r5]
_08067D62:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Tracks

	thumb_func_start GetGroundEffectFlags_SandHeap
GetGroundEffectFlags_SandHeap: @ 8067D68
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl sub_8059B8C
	lsls r0, 24
	cmp r0, 0
	beq _08067DA6
	ldrb r0, [r4, 0x1F]
	bl sub_8059B8C
	lsls r0, 24
	cmp r0, 0
	beq _08067DA6
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 27
	cmp r0, 0
	blt _08067DB0
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 4
	orrs r0, r1
	str r0, [r5]
	b _08067DB0
_08067DA6:
	ldrb r1, [r4, 0x2]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_08067DB0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_SandHeap

	thumb_func_start GetGroundEffectFlags_ShallowFlowingWater
GetGroundEffectFlags_ShallowFlowingWater: @ 8067DB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl sub_8059FE0
	lsls r0, 24
	cmp r0, 0
	beq _08067DD6
	ldrb r0, [r4, 0x1F]
	bl sub_8059FE0
	lsls r0, 24
	cmp r0, 0
	bne _08067DEE
_08067DD6:
	ldrb r0, [r4, 0x1E]
	bl sub_805A12C
	lsls r0, 24
	cmp r0, 0
	beq _08067E0C
	ldrb r0, [r4, 0x1F]
	bl sub_805A12C
	lsls r0, 24
	cmp r0, 0
	beq _08067E0C
_08067DEE:
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 28
	cmp r0, 0
	blt _08067E16
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x40
	orrs r0, r1
	str r0, [r5]
	b _08067E16
_08067E0C:
	ldrb r1, [r4, 0x2]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_08067E16:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_ShallowFlowingWater

	thumb_func_start GetGroundEffectFlags_Puddle
GetGroundEffectFlags_Puddle: @ 8067E1C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl sub_8059F20
	lsls r0, 24
	cmp r0, 0
	beq _08067E44
	ldrb r0, [r4, 0x1F]
	bl sub_8059F20
	lsls r0, 24
	cmp r0, 0
	beq _08067E44
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 3
	orrs r0, r1
	str r0, [r5]
_08067E44:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Puddle

	thumb_func_start GetGroundEffectFlags_Ripple
GetGroundEffectFlags_Ripple: @ 8067E4C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl sub_8059F08
	lsls r0, 24
	cmp r0, 0
	beq _08067E66
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	str r0, [r4]
_08067E66:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Ripple

	thumb_func_start GetGroundEffectFlags_ShortGrass
GetGroundEffectFlags_ShortGrass: @ 8067E6C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl sub_805A0EC
	lsls r0, 24
	cmp r0, 0
	beq _08067EAA
	ldrb r0, [r4, 0x1F]
	bl sub_805A0EC
	lsls r0, 24
	cmp r0, 0
	beq _08067EAA
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 29
	cmp r0, 0
	blt _08067EB4
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 10
	orrs r0, r1
	str r0, [r5]
	b _08067EB4
_08067EAA:
	ldrb r1, [r4, 0x2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_08067EB4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_ShortGrass

	thumb_func_start GetGroundEffectFlags_HotSprings
GetGroundEffectFlags_HotSprings: @ 8067EBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl sub_805A0F0
	lsls r0, 24
	cmp r0, 0
	beq _08067EFA
	ldrb r0, [r4, 0x1F]
	bl sub_805A0F0
	lsls r0, 24
	cmp r0, 0
	beq _08067EFA
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 26
	cmp r0, 0
	blt _08067F04
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 11
	orrs r0, r1
	str r0, [r5]
	b _08067F04
_08067EFA:
	ldrb r1, [r4, 0x2]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_08067F04:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_HotSprings

	thumb_func_start GetGroundEffectFlags_Seaweed
GetGroundEffectFlags_Seaweed: @ 8067F0C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl sub_805A220
	lsls r0, 24
	cmp r0, 0
	beq _08067F26
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r4]
_08067F26:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Seaweed

	thumb_func_start GetGroundEffectFlags_JumpLanding
GetGroundEffectFlags_JumpLanding: @ 8067F2C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r6, r1, 0
	ldr r0, [r7]
	ldr r1, _08067F68 @ =0x02000020
	ands r0, r1
	cmp r0, 0x20
	bne _08067F7E
	movs r5, 0
	ldr r0, _08067F6C @ =gUnknown_83A702C
	mov r8, r0
_08067F46:
	lsls r4, r5, 2
	mov r0, r8
	adds r1, r4, r0
	ldrb r0, [r7, 0x1E]
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _08067F74
	ldr r0, _08067F70 @ =gUnknown_83A7044
	adds r0, r4, r0
	ldr r1, [r6]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r6]
	b _08067F7E
	.align 2, 0
_08067F68: .4byte 0x02000020
_08067F6C: .4byte gUnknown_83A702C
_08067F70: .4byte gUnknown_83A7044
_08067F74:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08067F46
_08067F7E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_JumpLanding

	thumb_func_start sub_8067F88
sub_8067F88: @ 8067F88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	ldrb r0, [r5, 0x5]
	bl sub_805F2C8
	movs r4, 0
	movs r0, 0x1
	mov r10, r0
_08067FA0:
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	ldrh r1, [r5, 0x12]
	add r1, r10
	lsls r4, 16
	asrs r6, r4, 16
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	mov r9, r4
	cmp r0, 0
	bne _080680BA
	movs r3, 0x14
	ldrsh r0, [r5, r3]
	ldrh r1, [r5, 0x16]
	add r1, r10
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080680BA
	movs r2, 0x1
	lsls r0, r2, 16
	asrs r1, r0, 16
	mov r8, r0
	cmp r2, r1
	bge _080680A8
	movs r0, 0x80
	lsls r0, 9
	asrs r7, r0, 16
_08067FFC:
	ldrh r0, [r5, 0x10]
	lsls r1, r2, 16
	asrs r4, r1, 16
	adds r0, r4, r0
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r5, 0x12]
	adds r1, r7, r1
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080680BA
	ldrh r0, [r5, 0x10]
	subs r0, r4
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r5, 0x12]
	adds r1, r7, r1
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080680BA
	ldrh r0, [r5, 0x14]
	adds r0, r4, r0
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r5, 0x16]
	adds r1, r7, r1
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080680BA
	ldrh r0, [r5, 0x14]
	subs r0, r4
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r5, 0x16]
	adds r1, r7, r1
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080680BA
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	mov r3, r8
	asrs r1, r3, 16
	cmp r0, r1
	blt _08067FFC
_080680A8:
	movs r0, 0x80
	lsls r0, 9
	add r0, r9
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bge _080680B8
	b _08067FA0
_080680B8:
	movs r0, 0
_080680BA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8067F88

	thumb_func_start GetReflectionTypeByMetatileBehavior
GetReflectionTypeByMetatileBehavior: @ 80680C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8059BB4
	lsls r0, 24
	cmp r0, 0
	beq _080680DE
	movs r0, 0x1
	b _080680F0
_080680DE:
	adds r0, r4, 0
	bl sub_8059B90
	lsls r0, 24
	cmp r0, 0
	bne _080680EE
	movs r0, 0
	b _080680F0
_080680EE:
	movs r0, 0x2
_080680F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetReflectionTypeByMetatileBehavior

	thumb_func_start GetLedgeJumpDirection
GetLedgeJumpDirection: @ 80680F8
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0
	beq _0806813E
	cmp r4, 0x4
	bls _08068114
	subs r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
_08068114:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08068144 @ =gUnknown_83A705C
	lsls r1, r4, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068148
_0806813E:
	movs r0, 0
	b _0806814E
	.align 2, 0
_08068144: .4byte gUnknown_83A705C
_08068148:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
_0806814E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLedgeJumpDirection

	thumb_func_start FieldObjectSetSpriteOamTableForLongGrass
FieldObjectSetSpriteOamTableForLongGrass: @ 8068154
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r0, [r5]
	lsls r0, 27
	cmp r0, 0
	blt _080681A8
	ldrb r0, [r5, 0x1E]
	bl sub_8059F4C
	lsls r0, 24
	cmp r0, 0
	beq _080681A8
	ldrb r0, [r5, 0x1F]
	bl sub_8059F4C
	lsls r0, 24
	cmp r0, 0
	beq _080681A8
	adds r4, 0x42
	ldrb r1, [r4]
	movs r6, 0x40
	negs r6, r6
	adds r0, r6, 0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0xB]
	lsrs r0, 4
	bl ZCoordToPriority
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080681A8
	ldrb r0, [r4]
	adds r1, r6, 0
	ands r1, r0
	movs r0, 0x5
	orrs r1, r0
	strb r1, [r4]
_080681A8:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectSetSpriteOamTableForLongGrass

	thumb_func_start IsZCoordMismatchAt
IsZCoordMismatchAt: @ 80681B0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 16
	lsrs r1, r2, 16
	cmp r4, 0
	beq _080681DE
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080681DE
	cmp r0, 0xF
	beq _080681DE
	cmp r0, r4
	bne _080681E2
_080681DE:
	movs r0, 0
	b _080681E4
_080681E2:
	movs r0, 0x1
_080681E4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsZCoordMismatchAt

	thumb_func_start FieldObjectUpdateZCoordAndPriority
FieldObjectUpdateZCoordAndPriority: @ 80681EC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x3]
	lsls r0, 29
	cmp r0, 0
	blt _0806823A
	adds r0, r4, 0
	bl FieldObjectUpdateZCoord
	ldr r1, _08068240 @ =gUnknown_83A708C
	ldrb r2, [r4, 0xB]
	lsls r2, 24
	lsrs r0, r2, 28
	adds r0, r1
	ldrb r0, [r0]
	adds r4, r5, 0
	adds r4, 0x42
	movs r1, 0x3F
	ands r1, r0
	ldrb r3, [r4]
	movs r0, 0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	ldr r0, _08068244 @ =gUnknown_83A707C
	lsrs r2, 28
	adds r2, r0
	movs r0, 0x3
	ldrb r1, [r2]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
_0806823A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068240: .4byte gUnknown_83A708C
_08068244: .4byte gUnknown_83A707C
	thumb_func_end FieldObjectUpdateZCoordAndPriority

	thumb_func_start InitObjectPriorityByZCoord
InitObjectPriorityByZCoord: @ 8068248
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806828C @ =gUnknown_83A708C
	adds r2, r1, r2
	ldrb r2, [r2]
	movs r3, 0x42
	adds r3, r0
	mov r12, r3
	movs r3, 0x3F
	ands r3, r2
	mov r2, r12
	ldrb r4, [r2]
	movs r2, 0x40
	negs r2, r2
	ands r2, r4
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	ldr r2, _08068290 @ =gUnknown_83A707C
	adds r1, r2
	movs r3, 0x3
	ldrb r2, [r1]
	ands r2, r3
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806828C: .4byte gUnknown_83A708C
_08068290: .4byte gUnknown_83A707C
	thumb_func_end InitObjectPriorityByZCoord

	thumb_func_start ZCoordToPriority
ZCoordToPriority: @ 8068294
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080682A0 @ =gUnknown_83A707C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080682A0: .4byte gUnknown_83A707C
	thumb_func_end ZCoordToPriority

	thumb_func_start FieldObjectUpdateZCoord
FieldObjectUpdateZCoord: @ 80682A4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r5, 0xF
	beq _080682F2
	cmp r0, 0xF
	beq _080682F2
	movs r3, 0xF
	adds r0, r5, 0
	ands r0, r3
	ldrb r1, [r4, 0xB]
	movs r2, 0x10
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0xB]
	cmp r5, 0
	beq _080682F2
	cmp r5, 0xF
	beq _080682F2
	lsls r0, r5, 4
	ands r2, r3
	orrs r2, r0
	strb r2, [r4, 0xB]
_080682F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectUpdateZCoord

	thumb_func_start SetObjectSubpriorityByZCoord
SetObjectSubpriorityByZCoord: @ 80682F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0
	adds r3, 0x29
	movs r5, 0
	ldrsb r5, [r3, r5]
	ldrh r4, [r1, 0x22]
	ldr r3, _08068338 @ =gUnknown_2021BCA
	subs r4, r5
	ldrh r3, [r3]
	adds r4, r3
	adds r4, 0x8
	movs r3, 0xFF
	ands r4, r3
	lsrs r4, 4
	movs r3, 0x10
	subs r3, r4
	lsls r3, 17
	ldr r4, _0806833C @ =gUnknown_83A706C
	adds r0, r4
	lsrs r3, 16
	ldrb r0, [r0]
	adds r3, r0
	adds r2, r3
	adds r1, 0x43
	strb r2, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068338: .4byte gUnknown_2021BCA
_0806833C: .4byte gUnknown_83A706C
	thumb_func_end SetObjectSubpriorityByZCoord

	thumb_func_start FieldObjectUpdateSubpriority
FieldObjectUpdateSubpriority: @ 8068340
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2, 0x3]
	lsls r0, 29
	cmp r0, 0
	blt _08068356
	ldrb r0, [r2, 0xB]
	lsrs r0, 4
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
_08068356:
	pop {r0}
	bx r0
	thumb_func_end FieldObjectUpdateSubpriority

	thumb_func_start AreZCoordsCompatible
AreZCoordsCompatible: @ 806835C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r0, 0
	beq _08068372
	cmp r1, 0
	beq _08068372
	cmp r0, r1
	bne _08068376
_08068372:
	movs r0, 0x1
	b _08068378
_08068376:
	movs r0, 0
_08068378:
	pop {r1}
	bx r1
	thumb_func_end AreZCoordsCompatible

	thumb_func_start GroundEffect_SpawnOnTallGrass
GroundEffect_SpawnOnTallGrass: @ 806837C
	push {lr}
	ldr r3, _080683C0 @ =gUnknown_20386E0
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r0, _080683C4 @ =gUnknown_3005008
	ldr r1, [r0]
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0x1
	str r0, [r3, 0x1C]
	movs r0, 0x4
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_080683C0: .4byte gUnknown_20386E0
_080683C4: .4byte gUnknown_3005008
	thumb_func_end GroundEffect_SpawnOnTallGrass

	thumb_func_start GroundEffect_StepOnTallGrass
GroundEffect_StepOnTallGrass: @ 80683C8
	push {lr}
	ldr r3, _0806840C @ =gUnknown_20386E0
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r0, _08068410 @ =gUnknown_3005008
	ldr r1, [r0]
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0
	str r0, [r3, 0x1C]
	movs r0, 0x4
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0806840C: .4byte gUnknown_20386E0
_08068410: .4byte gUnknown_3005008
	thumb_func_end GroundEffect_StepOnTallGrass

	thumb_func_start GroundEffect_SpawnOnLongGrass
GroundEffect_SpawnOnLongGrass: @ 8068414
	push {lr}
	ldr r3, _08068458 @ =gUnknown_20386E0
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r0, _0806845C @ =gUnknown_3005008
	ldr r1, [r0]
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0x1
	str r0, [r3, 0x1C]
	movs r0, 0x11
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08068458: .4byte gUnknown_20386E0
_0806845C: .4byte gUnknown_3005008
	thumb_func_end GroundEffect_SpawnOnLongGrass

	thumb_func_start GroundEffect_StepOnLongGrass
GroundEffect_StepOnLongGrass: @ 8068460
	push {lr}
	ldr r3, _080684A4 @ =gUnknown_20386E0
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r0, _080684A8 @ =gUnknown_3005008
	ldr r1, [r0]
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0
	str r0, [r3, 0x1C]
	movs r0, 0x11
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_080684A4: .4byte gUnknown_20386E0
_080684A8: .4byte gUnknown_3005008
	thumb_func_end GroundEffect_StepOnLongGrass

	thumb_func_start GroundEffect_WaterReflection
GroundEffect_WaterReflection: @ 80684AC
	push {lr}
	movs r2, 0
	bl SetUpReflection
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_WaterReflection

	thumb_func_start GroundEffect_IceReflection
GroundEffect_IceReflection: @ 80684B8
	push {lr}
	movs r2, 0x1
	bl SetUpReflection
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_IceReflection

	thumb_func_start GroundEffect_FlowingWater
GroundEffect_FlowingWater: @ 80684C4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x22
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_FlowingWater

	thumb_func_start GroundEffect_SandTracks
GroundEffect_SandTracks: @ 80684D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl sub_805F2C8
	ldr r1, _080684FC @ =gUnknown_83A709C
	ldrb r0, [r0, 0xD]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl _call_via_r3
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080684FC: .4byte gUnknown_83A709C
	thumb_func_end GroundEffect_SandTracks

	thumb_func_start GroundEffect_DeepSandTracks
GroundEffect_DeepSandTracks: @ 8068500
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl sub_805F2C8
	ldr r1, _08068528 @ =gUnknown_83A709C
	ldrb r0, [r0, 0xD]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl _call_via_r3
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068528: .4byte gUnknown_83A709C
	thumb_func_end GroundEffect_DeepSandTracks

	thumb_func_start nullsub_26
nullsub_26: @ 806852C
	bx lr
	thumb_func_end nullsub_26

	thumb_func_start DoTracksGroundEffect_Footprints
DoTracksGroundEffect_Footprints: @ 8068530
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r4, r2, 24
	lsrs r4, 24
	ldr r1, _08068578 @ =gUnknown_83A70A8
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldr r1, _0806857C @ =gUnknown_20386E0
	movs r2, 0x14
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, 0x16
	ldrsh r0, [r5, r2]
	str r0, [r1, 0x4]
	movs r0, 0x95
	str r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [r1, 0xC]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	str r0, [r1, 0x10]
	lsls r4, 1
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl FieldEffectStart
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068578: .4byte gUnknown_83A70A8
_0806857C: .4byte gUnknown_20386E0
	thumb_func_end DoTracksGroundEffect_Footprints

	thumb_func_start DoTracksGroundEffect_BikeTireTracks
DoTracksGroundEffect_BikeTireTracks: @ 8068580
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x10]
	ldr r0, [r4, 0x14]
	cmp r1, r0
	beq _080685C2
	ldr r2, _080685C8 @ =gUnknown_20386E0
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	movs r0, 0x95
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	ldr r3, _080685CC @ =gUnknown_83A70AC
	ldrb r1, [r4, 0x18]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 2
	subs r0, 0x5
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
	str r0, [r2, 0x10]
	movs r0, 0x23
	bl FieldEffectStart
_080685C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080685C8: .4byte gUnknown_20386E0
_080685CC: .4byte gUnknown_83A70AC
	thumb_func_end DoTracksGroundEffect_BikeTireTracks

	thumb_func_start GroundEffect_Ripple
GroundEffect_Ripple: @ 80685D0
	push {lr}
	bl DoRippleFieldEffect
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_Ripple

	thumb_func_start GroundEffect_StepOnPuddle
GroundEffect_StepOnPuddle: @ 80685DC
	push {lr}
	adds r1, r0, 0
	movs r0, 0xF
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_StepOnPuddle

	thumb_func_start GroundEffect_SandHeap
GroundEffect_SandHeap: @ 80685EC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x27
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_SandHeap

	thumb_func_start GroundEffect_JumpOnTallGrass
GroundEffect_JumpOnTallGrass: @ 80685FC
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _08068650 @ =gUnknown_20386E0
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r4, 0x12
	ldrsh r0, [r5, r4]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0xB]
	lsrs r0, 4
	str r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [r1, 0xC]
	movs r0, 0xC
	bl FieldEffectStart
	ldrb r0, [r5, 0x8]
	ldrb r1, [r5, 0x9]
	ldrb r2, [r5, 0xA]
	movs r7, 0x10
	ldrsh r3, [r5, r7]
	movs r7, 0x12
	ldrsh r4, [r5, r7]
	str r4, [sp]
	bl sub_80DB564
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	bne _08068646
	adds r0, r5, 0
	adds r1, r6, 0
	bl GroundEffect_SpawnOnTallGrass
_08068646:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068650: .4byte gUnknown_20386E0
	thumb_func_end GroundEffect_JumpOnTallGrass

	thumb_func_start GroundEffect_JumpOnLongGrass
GroundEffect_JumpOnLongGrass: @ 8068654
	push {lr}
	ldr r2, _08068678 @ =gUnknown_20386E0
	movs r3, 0x10
	ldrsh r1, [r0, r3]
	str r1, [r2]
	movs r3, 0x12
	ldrsh r1, [r0, r3]
	str r1, [r2, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	movs r0, 0x12
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08068678: .4byte gUnknown_20386E0
	thumb_func_end GroundEffect_JumpOnLongGrass

	thumb_func_start GroundEffect_JumpOnShallowWater
GroundEffect_JumpOnShallowWater: @ 806867C
	push {r4,lr}
	ldr r3, _080686A8 @ =gUnknown_20386E0
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, 0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x10
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080686A8: .4byte gUnknown_20386E0
	thumb_func_end GroundEffect_JumpOnShallowWater

	thumb_func_start GroundEffect_JumpOnWater
GroundEffect_JumpOnWater: @ 80686AC
	push {r4,lr}
	ldr r3, _080686D8 @ =gUnknown_20386E0
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, 0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0xE
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080686D8: .4byte gUnknown_20386E0
	thumb_func_end GroundEffect_JumpOnWater

	thumb_func_start GroundEffect_JumpLandingDust
GroundEffect_JumpLandingDust: @ 80686DC
	push {r4,lr}
	ldr r3, _08068708 @ =gUnknown_20386E0
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, 0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0xA
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068708: .4byte gUnknown_20386E0
	thumb_func_end GroundEffect_JumpLandingDust

	thumb_func_start GroundEffect_ShortGrass
GroundEffect_ShortGrass: @ 806870C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x29
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_ShortGrass

	thumb_func_start GroundEffect_HotSprings
GroundEffect_HotSprings: @ 806871C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2A
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_HotSprings

	thumb_func_start GroundEffect_Seaweed
GroundEffect_Seaweed: @ 806872C
	push {lr}
	ldr r2, _08068748 @ =gUnknown_20386E0
	movs r3, 0x10
	ldrsh r1, [r0, r3]
	str r1, [r2]
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	str r0, [r2, 0x4]
	movs r0, 0x35
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08068748: .4byte gUnknown_20386E0
	thumb_func_end GroundEffect_Seaweed

	thumb_func_start DoFlaggedGroundEffects
DoFlaggedGroundEffects: @ 806874C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r7, r1, 0
	adds r5, r2, 0
	ldrb r0, [r6, 0x8]
	cmp r0, 0x7F
	bne _08068766
	ldrb r0, [r6, 0x1]
	lsls r0, 26
	cmp r0, 0
	blt _0806878E
_08068766:
	movs r4, 0
	ldr r0, _08068798 @ =gUnknown_83A70BC
	mov r8, r0
_0806876C:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08068782
	lsls r0, r4, 2
	add r0, r8
	ldr r2, [r0]
	adds r0, r6, 0
	adds r1, r7, 0
	bl _call_via_r2
_08068782:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsrs r5, 1
	cmp r4, 0x13
	bls _0806876C
_0806878E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068798: .4byte gUnknown_83A70BC
	thumb_func_end DoFlaggedGroundEffects

	thumb_func_start filters_out_some_ground_effects
filters_out_some_ground_effects: @ 806879C
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r0, [r2]
	lsls r0, 27
	cmp r0, 0
	bge _080687CA
	ldrb r1, [r2, 0x2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	adds r1, 0x8
	ands r0, r1
	subs r1, 0x18
	ands r0, r1
	strb r0, [r2, 0x2]
	ldr r0, [r3]
	ldr r1, _080687D0 @ =0xfff9f7bd
	ands r0, r1
	str r0, [r3]
_080687CA:
	pop {r0}
	bx r0
	.align 2, 0
_080687D0: .4byte 0xfff9f7bd
	thumb_func_end filters_out_some_ground_effects

	thumb_func_start FilterOutStepOnPuddleGroundEffectIfJumping
FilterOutStepOnPuddleGroundEffectIfJumping: @ 80687D4
	push {lr}
	adds r2, r1, 0
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080687E8
	ldr r0, [r2]
	ldr r1, _080687EC @ =0xfffffbff
	ands r0, r1
	str r0, [r2]
_080687E8:
	pop {r0}
	bx r0
	.align 2, 0
_080687EC: .4byte 0xfffffbff
	thumb_func_end FilterOutStepOnPuddleGroundEffectIfJumping

	thumb_func_start DoGroundEffects_OnSpawn
DoGroundEffects_OnSpawn: @ 80687F0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	lsls r0, 29
	cmp r0, 0
	bge _08068834
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoordAndPriority
	adds r0, r4, 0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetSpriteOamTableForLongGrass
	ldr r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoFlaggedGroundEffects
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
_08068834:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnSpawn

	thumb_func_start DoGroundEffects_OnBeginStep
DoGroundEffects_OnBeginStep: @ 806883C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	lsls r0, 29
	cmp r0, 0
	bge _08068888
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoordAndPriority
	adds r0, r4, 0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetSpriteOamTableForLongGrass
	adds r0, r4, 0
	mov r1, sp
	bl filters_out_some_ground_effects
	ldr r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoFlaggedGroundEffects
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
_08068888:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnBeginStep

	thumb_func_start DoGroundEffects_OnFinishStep
DoGroundEffects_OnFinishStep: @ 8068890
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	lsls r0, 28
	cmp r0, 0
	bge _080688DC
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoordAndPriority
	adds r0, r4, 0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnFinishStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetSpriteOamTableForLongGrass
	adds r0, r4, 0
	mov r1, sp
	bl FilterOutStepOnPuddleGroundEffectIfJumping
	ldr r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoFlaggedGroundEffects
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
_080688DC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnFinishStep

	.align 2, 0 @ Don't pad with nop.
