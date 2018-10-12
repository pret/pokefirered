	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start AllocateBattleSpritesData
AllocateBattleSpritesData: @ 8033DB8
	push {r4,lr}
	ldr r4, _08033DF4 @ =gUnknown_2024018
	movs r0, 0x10
	bl AllocZeroed
	str r0, [r4]
	movs r0, 0x10
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1]
	movs r0, 0x30
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0x4]
	movs r0, 0x10
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0x8]
	movs r0, 0x50
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, 0xC]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033DF4: .4byte gUnknown_2024018
	thumb_func_end AllocateBattleSpritesData

	thumb_func_start FreeBattleSpritesData
FreeBattleSpritesData: @ 8033DF8
	push {r4,r5,lr}
	ldr r5, _08033E38 @ =gUnknown_2024018
	ldr r0, [r5]
	cmp r0, 0
	beq _08033E32
	ldr r0, [r0, 0xC]
	bl Free
	ldr r0, [r5]
	movs r4, 0
	str r4, [r0, 0xC]
	ldr r0, [r0, 0x8]
	bl Free
	ldr r0, [r5]
	str r4, [r0, 0x8]
	ldr r0, [r0, 0x4]
	bl Free
	ldr r0, [r5]
	str r4, [r0, 0x4]
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	str r4, [r0]
	bl Free
	str r4, [r5]
_08033E32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033E38: .4byte gUnknown_2024018
	thumb_func_end FreeBattleSpritesData

	thumb_func_start sub_8033E3C
sub_8033E3C: @ 8033E3C
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x30]
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _08033E80 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	adds r3, r5, r7
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r4, [r0]
	lsls r0, r4, 26
	cmp r0, 0
	bge _08033EA0
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	blt _08033EA0
	adds r1, r3, 0
	adds r1, 0x2C
	ldrb r2, [r1]
	lsls r0, r2, 25
	cmp r0, 0
	bge _08033E84
	movs r0, 0x41
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _08033EA0
	.align 2, 0
_08033E80: .4byte gSprites
_08033E84:
	lsls r0, r4, 27
	cmp r0, 0
	bge _08033EA0
	adds r0, r7, 0
	adds r0, 0x1C
	adds r0, r5, r0
	ldr r1, _08033EA8 @ =sub_8012100
	str r1, [r0]
	adds r0, r3, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _08033EAC @ =SpriteCallbackDummy
	str r0, [r6, 0x1C]
_08033EA0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033EA8: .4byte sub_8012100
_08033EAC: .4byte SpriteCallbackDummy
	thumb_func_end sub_8033E3C

	thumb_func_start sub_8033EB0
sub_8033EB0: @ 8033EB0
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r0, [r3]
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r3]
	ldr r0, _08033ED4 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
	cmp r1, 0
	bne _08033ED8
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _08033EE0
	.align 2, 0
_08033ED4: .4byte SpriteCallbackDummy
_08033ED8:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08033EE0:
	adds r0, r4, 0
	bl AnimateSprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8033EB0

	thumb_func_start sub_8033EEC
sub_8033EEC: @ 8033EEC
	push {lr}
	adds r2, r0, 0
	ldr r0, _08033F14 @ =gUnknown_2023F4C
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08033F0E
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _08033F0E
	ldr r0, _08033F18 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_08033F0E:
	pop {r0}
	bx r0
	.align 2, 0
_08033F14: .4byte gUnknown_2023F4C
_08033F18: .4byte SpriteCallbackDummy
	thumb_func_end sub_8033EEC

	thumb_func_start InitAndLaunchChosenStatusAnimation
InitAndLaunchChosenStatusAnimation: @ 8033F1C
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	ldr r6, _08033F50 @ =gUnknown_2024018
	ldr r1, [r6]
	ldr r5, _08033F54 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r3, [r1, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1]
	movs r3, 0x10
	orrs r2, r3
	strb r2, [r1]
	cmp r0, 0
	bne _08033F9C
	cmp r4, 0x20
	bne _08033F58
	ldrb r0, [r5]
	movs r1, 0x6
	bl LaunchStatusAnimation
	b _08034016
	.align 2, 0
_08033F50: .4byte gUnknown_2024018
_08033F54: .4byte gActiveBattler
_08033F58:
	cmp r4, 0x8
	beq _08033F64
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	beq _08033F6E
_08033F64:
	ldrb r0, [r5]
	movs r1, 0
	bl LaunchStatusAnimation
	b _08034016
_08033F6E:
	cmp r4, 0x10
	bne _08033F7C
	ldrb r0, [r5]
	movs r1, 0x2
	bl LaunchStatusAnimation
	b _08034016
_08033F7C:
	movs r0, 0x7
	ands r0, r4
	cmp r0, 0
	beq _08033F8E
	ldrb r0, [r5]
	movs r1, 0x4
	bl LaunchStatusAnimation
	b _08034016
_08033F8E:
	cmp r4, 0x40
	bne _08033FFE
	ldrb r0, [r5]
	movs r1, 0x5
	bl LaunchStatusAnimation
	b _08034016
_08033F9C:
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r4
	cmp r0, 0
	beq _08033FB0
	ldrb r0, [r5]
	movs r1, 0x3
	bl LaunchStatusAnimation
	b _08034016
_08033FB0:
	movs r0, 0x7
	ands r0, r4
	cmp r0, 0
	beq _08033FC2
	ldrb r0, [r5]
	movs r1, 0x1
	bl LaunchStatusAnimation
	b _08034016
_08033FC2:
	movs r0, 0x80
	lsls r0, 21
	ands r0, r4
	cmp r0, 0
	beq _08033FD6
	ldrb r0, [r5]
	movs r1, 0x7
	bl LaunchStatusAnimation
	b _08034016
_08033FD6:
	movs r0, 0x80
	lsls r0, 20
	ands r0, r4
	cmp r0, 0
	beq _08033FEA
	ldrb r0, [r5]
	movs r1, 0x8
	bl LaunchStatusAnimation
	b _08034016
_08033FEA:
	movs r0, 0xE0
	lsls r0, 8
	ands r0, r4
	cmp r0, 0
	beq _08033FFE
	ldrb r0, [r5]
	movs r1, 0x9
	bl LaunchStatusAnimation
	b _08034016
_08033FFE:
	ldr r0, [r6]
	ldrb r2, [r5]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_08034016:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end InitAndLaunchChosenStatusAnimation

	thumb_func_start TryHandleLaunchBattleTableAnimation
TryHandleLaunchBattleTableAnimation: @ 803401C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsrs r5, r3, 24
	lsls r4, 16
	lsrs r7, r4, 16
	cmp r5, 0
	bne _08034064
	movs r0, 0x80
	ands r0, r7
	cmp r0, 0
	beq _08034064
	ldr r0, _08034060 @ =gUnknown_2024024
	adds r0, r6, r0
	movs r2, 0x7F
	adds r1, r7, 0
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x1
	b _08034132
	.align 2, 0
_08034060: .4byte gUnknown_2024024
_08034064:
	ldr r0, _08034090 @ =gUnknown_2024018
	mov r9, r0
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r4, r6, 2
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r2, 0x4
	mov r8, r2
	mov r0, r8
	ands r0, r1
	cmp r0, 0
	beq _080340E0
	adds r0, r5, 0
	bl ShouldAnimBeDoneRegardlessOfSubsitute
	lsls r0, 24
	cmp r0, 0
	bne _08034094
	movs r0, 0x1
	b _08034132
	.align 2, 0
_08034090: .4byte gUnknown_2024018
_08034094:
	mov r1, r9
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r1, [r0]
	mov r0, r8
	ands r0, r1
	cmp r0, 0
	beq _080340E0
	cmp r5, 0x2
	bne _080340E0
	ldr r1, _080340D8 @ =gSprites
	ldr r0, _080340DC @ =gUnknown_2023D44
	adds r0, r6, r0
	ldrb r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _080340E0
	adds r0, r6, 0
	movs r1, 0x1
	bl LoadBattleMonGfxAndAnimate
	adds r0, r6, 0
	bl ClearBehindSubstituteBit
	movs r0, 0x1
	b _08034132
	.align 2, 0
_080340D8: .4byte gSprites
_080340DC: .4byte gUnknown_2023D44
_080340E0:
	ldr r0, _08034144 @ =gUnknown_2037F1A
	mov r2, r10
	strb r2, [r0]
	ldr r0, _08034148 @ =gUnknown_2037F1B
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r4, _0803414C @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	strh r7, [r0]
	ldr r0, _08034150 @ =gUnknown_81C6EA8
	adds r1, r5, 0
	movs r2, 0
	bl sub_80725D4
	ldr r0, _08034154 @ =Task_ClearBitWhenBattleTableAnimDone
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08034158 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r6, [r1, 0x8]
	ldr r0, [r4]
	movs r2, 0x8
	ldrsh r1, [r1, r2]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0
_08034132:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08034144: .4byte gUnknown_2037F1A
_08034148: .4byte gUnknown_2037F1B
_0803414C: .4byte gUnknown_2024018
_08034150: .4byte gUnknown_81C6EA8
_08034154: .4byte Task_ClearBitWhenBattleTableAnimDone
_08034158: .4byte gTasks
	thumb_func_end TryHandleLaunchBattleTableAnimation

	thumb_func_start Task_ClearBitWhenBattleTableAnimDone
Task_ClearBitWhenBattleTableAnimDone: @ 803415C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080341A4 @ =gUnknown_2037EDC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _080341A8 @ =gUnknown_2037EE1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0803419E
	ldr r0, _080341AC @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r1, _080341B0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	ldr r2, [r2, 0x4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0803419E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080341A4: .4byte gUnknown_2037EDC
_080341A8: .4byte gUnknown_2037EE1
_080341AC: .4byte gUnknown_2024018
_080341B0: .4byte gTasks
	thumb_func_end Task_ClearBitWhenBattleTableAnimDone

	thumb_func_start ShouldAnimBeDoneRegardlessOfSubsitute
ShouldAnimBeDoneRegardlessOfSubsitute: @ 80341B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bgt _080341C8
	cmp r0, 0xA
	bge _080341CC
	cmp r0, 0x2
	beq _080341CC
	b _080341D0
_080341C8:
	cmp r0, 0x11
	bne _080341D0
_080341CC:
	movs r0, 0x1
	b _080341D2
_080341D0:
	movs r0, 0
_080341D2:
	pop {r1}
	bx r1
	thumb_func_end ShouldAnimBeDoneRegardlessOfSubsitute

	thumb_func_start InitAndLaunchSpecialAnimation
InitAndLaunchSpecialAnimation: @ 80341D8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08034230 @ =gUnknown_2037F1A
	strb r1, [r0]
	ldr r0, _08034234 @ =gUnknown_2037F1B
	strb r2, [r0]
	ldr r0, _08034238 @ =gUnknown_81C6F18
	adds r1, r3, 0
	movs r2, 0
	bl sub_80725D4
	ldr r0, _0803423C @ =Task_ClearBitWhenSpecialAnimDone
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08034240 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	ldr r0, _08034244 @ =gUnknown_2024018
	ldr r0, [r0]
	movs r2, 0x8
	ldrsh r1, [r1, r2]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034230: .4byte gUnknown_2037F1A
_08034234: .4byte gUnknown_2037F1B
_08034238: .4byte gUnknown_81C6F18
_0803423C: .4byte Task_ClearBitWhenSpecialAnimDone
_08034240: .4byte gTasks
_08034244: .4byte gUnknown_2024018
	thumb_func_end InitAndLaunchSpecialAnimation

	thumb_func_start Task_ClearBitWhenSpecialAnimDone
Task_ClearBitWhenSpecialAnimDone: @ 8034248
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08034290 @ =gUnknown_2037EDC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08034294 @ =gUnknown_2037EE1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0803428A
	ldr r0, _08034298 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r1, _0803429C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	ldr r2, [r2, 0x4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0803428A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034290: .4byte gUnknown_2037EDC
_08034294: .4byte gUnknown_2037EE1
_08034298: .4byte gUnknown_2024018
_0803429C: .4byte gTasks
	thumb_func_end Task_ClearBitWhenSpecialAnimDone

	thumb_func_start IsMoveWithoutAnimation
IsMoveWithoutAnimation: @ 80342A0
	movs r0, 0
	bx lr
	thumb_func_end IsMoveWithoutAnimation

	thumb_func_start mplay_80342A4
mplay_80342A4: @ 80342A4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080342EC
	ldr r2, _080342F4 @ =gUnknown_2024018
	ldr r0, [r2]
	ldr r1, [r0, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	adds r1, 0x1
	strb r1, [r0, 0x8]
	ldr r2, [r2]
	ldr r0, _080342F8 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1D
	bls _080342F0
	ldr r0, _080342FC @ =gMPlayInfo_SE1
	bl m4aMPlayStop
	ldr r0, _08034300 @ =gMPlayInfo_SE2
	bl m4aMPlayStop
_080342EC:
	cmp r5, 0
	beq _08034304
_080342F0:
	movs r0, 0x1
	b _08034316
	.align 2, 0
_080342F4: .4byte gUnknown_2024018
_080342F8: .4byte gActiveBattler
_080342FC: .4byte gMPlayInfo_SE1
_08034300: .4byte gMPlayInfo_SE2
_08034304:
	ldr r0, _0803431C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	strb r5, [r0, 0x8]
	movs r0, 0
_08034316:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803431C: .4byte gUnknown_2024018
	thumb_func_end mplay_80342A4

	thumb_func_start BattleLoadOpponentMonSpriteGfx
BattleLoadOpponentMonSpriteGfx: @ 8034320
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r1, 0
	bl GetMonData
	str r0, [sp]
	ldr r0, _08034360 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, 2
	adds r2, r1, r0
	ldrh r0, [r2, 0x2]
	cmp r0, 0
	bne _08034364
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r6, [sp]
	b _0803436C
	.align 2, 0
_08034360: .4byte gUnknown_2024018
_08034364:
	ldrh r5, [r2, 0x2]
	ldr r0, _080343C0 @ =gUnknown_2024008
	adds r0, r1, r0
	ldr r6, [r0]
_0803436C:
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	mov r10, r0
	mov r0, r8
	bl GetBankIdentity
	lsls r0, 24
	lsls r2, r5, 3
	ldr r1, _080343C4 @ =gUnknown_82350AC
	adds r2, r1
	ldr r1, _080343C8 @ =gUnknown_202401C
	ldr r1, [r1]
	lsrs r0, 22
	adds r1, 0x4
	adds r1, r0
	ldr r1, [r1]
	adds r0, r2, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	mov r3, r8
	lsls r2, r3, 4
	movs r0, 0x80
	lsls r0, 1
	adds r7, r2, r0
	ldr r0, _080343CC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r1, r3, 2
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	str r1, [sp, 0x4]
	mov r9, r2
	cmp r0, 0
	bne _080343D0
	adds r0, r4, 0
	bl GetMonFrontSpritePal
	b _080343DA
	.align 2, 0
_080343C0: .4byte gUnknown_2024008
_080343C4: .4byte gUnknown_82350AC
_080343C8: .4byte gUnknown_202401C
_080343CC: .4byte gUnknown_2024018
_080343D0:
	adds r0, r5, 0
	mov r1, r10
	ldr r2, [sp]
	bl GetFrontSpritePalFromSpeciesAndPersonality
_080343DA:
	adds r6, r0, 0
	movs r0, 0x80
	lsls r0, 3
	bl AllocZeroed
	adds r4, r0, 0
	adds r0, r6, 0
	adds r1, r4, 0
	bl LZDecompressWram
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x20
	bl LoadPalette
	mov r1, r9
	adds r1, 0x80
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	bl Free
	ldr r0, _08034478 @ =0x00000181
	cmp r5, r0
	bne _0803443C
	movs r7, 0x80
	lsls r7, 1
	add r7, r9
	ldr r5, _0803447C @ =gBattleStruct
	ldr r1, [r5]
	movs r4, 0x80
	lsls r4, 1
	adds r1, r4
	adds r0, r6, 0
	bl LZDecompressWram
	ldr r0, _08034480 @ =gUnknown_2024024
	add r0, r8
	ldrb r1, [r0]
	lsls r1, 5
	adds r1, r4
	ldr r0, [r5]
	adds r0, r1
	adds r1, r7, 0
	movs r2, 0x20
	bl LoadPalette
_0803443C:
	ldr r0, _08034484 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [sp, 0x4]
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _08034468
	ldr r3, _08034488 @ =0x00007fff
	adds r0, r7, 0
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
	lsls r1, r7, 1
	ldr r0, _0803448C @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _08034490 @ =gPlttBufferUnfaded
	adds r1, r2
	ldr r2, _08034494 @ =0x04000008
	bl CpuSet
_08034468:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034478: .4byte 0x00000181
_0803447C: .4byte gBattleStruct
_08034480: .4byte gUnknown_2024024
_08034484: .4byte gUnknown_2024018
_08034488: .4byte 0x00007fff
_0803448C: .4byte gPlttBufferFaded
_08034490: .4byte gPlttBufferUnfaded
_08034494: .4byte 0x04000008
	thumb_func_end BattleLoadOpponentMonSpriteGfx

	thumb_func_start sub_8034498
sub_8034498: @ 8034498
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r1, 0
	bl GetMonData
	str r0, [sp]
	ldr r0, _080344D8 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, 2
	adds r2, r1, r0
	ldrh r0, [r2, 0x2]
	cmp r0, 0
	bne _080344DC
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r4, [sp]
	b _080344E4
	.align 2, 0
_080344D8: .4byte gUnknown_2024018
_080344DC:
	ldrh r5, [r2, 0x2]
	ldr r0, _08034538 @ =gUnknown_2024008
	adds r0, r1, r0
	ldr r4, [r0]
_080344E4:
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x4]
	mov r0, r8
	bl GetBankIdentity
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x1
	mov r1, r8
	bl sub_804455C
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	lsls r1, 2
	mov r10, r1
	cmp r0, 0x1
	beq _0803451C
	ldr r0, _0803453C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	add r0, r10
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _08034548
_0803451C:
	lsls r0, r5, 3
	ldr r1, _08034540 @ =gUnknown_823654C
	adds r0, r1
	ldr r1, _08034544 @ =gUnknown_202401C
	ldr r1, [r1]
	lsls r2, r7, 2
	adds r1, 0x4
	adds r1, r2
	ldr r1, [r1]
	adds r2, r5, 0
	adds r3, r4, 0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	b _08034562
	.align 2, 0
_08034538: .4byte gUnknown_2024008
_0803453C: .4byte gUnknown_2024018
_08034540: .4byte gUnknown_823654C
_08034544: .4byte gUnknown_202401C
_08034548:
	lsls r0, r5, 3
	ldr r1, _08034584 @ =gUnknown_823654C
	adds r0, r1
	ldr r1, _08034588 @ =gUnknown_202401C
	ldr r1, [r1]
	lsls r2, r7, 2
	adds r1, 0x4
	adds r1, r2
	ldr r1, [r1]
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_800ECC4
_08034562:
	mov r2, r8
	lsls r1, r2, 4
	movs r0, 0x80
	lsls r0, 1
	adds r7, r1, r0
	ldr r0, _0803458C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	add r0, r10
	ldrh r0, [r0, 0x2]
	mov r9, r1
	cmp r0, 0
	bne _08034590
	adds r0, r6, 0
	bl GetMonFrontSpritePal
	b _0803459A
	.align 2, 0
_08034584: .4byte gUnknown_823654C
_08034588: .4byte gUnknown_202401C
_0803458C: .4byte gUnknown_2024018
_08034590:
	adds r0, r5, 0
	ldr r1, [sp, 0x4]
	ldr r2, [sp]
	bl GetFrontSpritePalFromSpeciesAndPersonality
_0803459A:
	adds r6, r0, 0
	movs r0, 0x80
	lsls r0, 3
	bl AllocZeroed
	adds r4, r0, 0
	adds r0, r6, 0
	adds r1, r4, 0
	bl LZDecompressWram
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x20
	bl LoadPalette
	mov r1, r9
	adds r1, 0x80
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	bl Free
	ldr r0, _08034638 @ =0x00000181
	cmp r5, r0
	bne _080345FC
	movs r7, 0x80
	lsls r7, 1
	add r7, r9
	ldr r5, _0803463C @ =gBattleStruct
	ldr r1, [r5]
	movs r4, 0x80
	lsls r4, 1
	adds r1, r4
	adds r0, r6, 0
	bl LZDecompressWram
	ldr r0, _08034640 @ =gUnknown_2024024
	add r0, r8
	ldrb r1, [r0]
	lsls r1, 5
	adds r1, r4
	ldr r0, [r5]
	adds r0, r1
	adds r1, r7, 0
	movs r2, 0x20
	bl LoadPalette
_080345FC:
	ldr r0, _08034644 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	add r0, r10
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _08034626
	ldr r3, _08034648 @ =0x00007fff
	adds r0, r7, 0
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
	lsls r1, r7, 1
	ldr r0, _0803464C @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _08034650 @ =gPlttBufferUnfaded
	adds r1, r2
	ldr r2, _08034654 @ =0x04000008
	bl CpuSet
_08034626:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034638: .4byte 0x00000181
_0803463C: .4byte gBattleStruct
_08034640: .4byte gUnknown_2024024
_08034644: .4byte gUnknown_2024018
_08034648: .4byte 0x00007fff
_0803464C: .4byte gPlttBufferFaded
_08034650: .4byte gPlttBufferUnfaded
_08034654: .4byte 0x04000008
	thumb_func_end sub_8034498

	thumb_func_start sub_8034658
sub_8034658: @ 8034658
	push {r4-r6,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl GetBankIdentity
	lsls r0, 24
	ldr r2, _080346B8 @ =gUnknown_8E93B38
	ldr r1, _080346BC @ =gUnknown_202401C
	ldr r1, [r1]
	lsrs r0, 22
	adds r1, 0x4
	adds r1, r0
	ldr r1, [r1]
	adds r0, r2, 0
	bl LZ77UnCompWram
	lsls r4, 4
	movs r0, 0x80
	lsls r0, 1
	adds r6, r4, r0
	movs r0, 0x80
	lsls r0, 3
	bl AllocZeroed
	adds r5, r0, 0
	ldr r0, _080346C0 @ =gUnknown_8E93B14
	adds r1, r5, 0
	bl LZDecompressWram
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x20
	bl LoadPalette
	adds r4, 0x80
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r5, 0
	bl Free
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080346B8: .4byte gUnknown_8E93B38
_080346BC: .4byte gUnknown_202401C
_080346C0: .4byte gUnknown_8E93B14
	thumb_func_end sub_8034658

	thumb_func_start sub_80346C4
sub_80346C4: @ 80346C4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r5, r0, 0
	adds r0, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r0, 24
	lsrs r0, 24
	bl GetBankIdentity
	adds r4, r0, 0
	lsls r4, 24
	lsls r5, 3
	ldr r6, _0803473C @ =gUnknown_823957C
	adds r6, r5, r6
	ldr r0, _08034740 @ =gUnknown_202401C
	mov r8, r0
	ldr r0, [r0]
	lsrs r4, 22
	adds r0, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0
	bl DecompressPicFromTable
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x4
	adds r0, r4
	ldr r0, [r0]
	str r0, [sp]
	ldrh r2, [r6, 0x4]
	ldr r0, _08034744 @ =0xffff0000
	ldr r1, [sp, 0x4]
	ands r1, r0
	orrs r1, r2
	str r1, [sp, 0x4]
	ldrh r2, [r6, 0x6]
	lsls r2, 16
	ldr r0, _08034748 @ =0x0000ffff
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _0803474C @ =gUnknown_8239A1C
	adds r5, r0
	adds r0, r5, 0
	bl sub_800F078
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803473C: .4byte gUnknown_823957C
_08034740: .4byte gUnknown_202401C
_08034744: .4byte 0xffff0000
_08034748: .4byte 0x0000ffff
_0803474C: .4byte gUnknown_8239A1C
	thumb_func_end sub_80346C4

	thumb_func_start sub_8034750
sub_8034750: @ 8034750
	push {lr}
	lsls r0, 16
	lsls r1, 24
	ldr r2, _08034774 @ =gUnknown_8239FD4
	lsrs r0, 13
	adds r0, r2
	ldr r0, [r0]
	lsrs r1, 4
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	pop {r0}
	bx r0
	.align 2, 0
_08034774: .4byte gUnknown_8239FD4
	thumb_func_end sub_8034750

	thumb_func_start nullsub_16
nullsub_16: @ 8034778
	bx lr
	thumb_func_end nullsub_16

	thumb_func_start sub_803477C
sub_803477C: @ 803477C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	ldr r0, _080347A0 @ =gUnknown_8239A1C
	lsrs r4, 13
	adds r0, r4, r0
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	ldr r0, _080347A4 @ =gUnknown_823957C
	adds r4, r0
	ldrh r0, [r4, 0x6]
	bl FreeSpriteTilesByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080347A0: .4byte gUnknown_8239A1C
_080347A4: .4byte gUnknown_823957C
	thumb_func_end sub_803477C

	thumb_func_start sub_80347A8
sub_80347A8: @ 80347A8
	push {r4-r7,lr}
	ldr r4, _080347D4 @ =gUnknown_8260260
	adds r0, r4, 0
	bl LoadSpritePalette
	adds r4, 0x8
	adds r0, r4, 0
	bl LoadSpritePalette
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _080347E0
	ldr r0, _080347D8 @ =gUnknown_8260208
	bl sub_800F034
	ldr r0, _080347DC @ =gUnknown_8260210
	bl sub_800F034
	movs r5, 0x2
	b _08034802
	.align 2, 0
_080347D4: .4byte gUnknown_8260260
_080347D8: .4byte gUnknown_8260208
_080347DC: .4byte gUnknown_8260210
_080347E0:
	ldr r4, _08034828 @ =gUnknown_8260218
	adds r0, r4, 0
	bl sub_800F034
	adds r4, 0x8
	adds r0, r4, 0
	bl sub_800F034
	ldr r4, _0803482C @ =gUnknown_8260228
	adds r0, r4, 0
	bl sub_800F034
	adds r4, 0x8
	adds r0, r4, 0
	bl sub_800F034
	movs r5, 0x4
_08034802:
	movs r4, 0
	cmp r4, r5
	bcs _08034822
	ldr r7, _08034830 @ =gUnknown_2023BD6
	ldr r6, _08034834 @ =gUnknown_8260240
_0803480C:
	adds r0, r4, r7
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r6
	bl sub_800F034
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0803480C
_08034822:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034828: .4byte gUnknown_8260218
_0803482C: .4byte gUnknown_8260228
_08034830: .4byte gUnknown_2023BD6
_08034834: .4byte gUnknown_8260240
	thumb_func_end sub_80347A8

	thumb_func_start BattleLoadAllHealthBoxesGfx
BattleLoadAllHealthBoxesGfx: @ 8034838
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	movs r6, 0
	cmp r4, 0
	bne _08034848
	b _0803495A
_08034848:
	cmp r4, 0x1
	bne _08034864
	ldr r4, _08034860 @ =gUnknown_8260260
	adds r0, r4, 0
	bl LoadSpritePalette
	adds r4, 0x8
	adds r0, r4, 0
	bl LoadSpritePalette
	b _0803495A
	.align 2, 0
_08034860: .4byte gUnknown_8260260
_08034864:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _080348CC
	cmp r4, 0x2
	bne _0803489C
	ldr r0, _08034888 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08034890
	ldr r0, _0803488C @ =gUnknown_8260238
	bl sub_800F034
	b _0803495A
	.align 2, 0
_08034888: .4byte gBattleTypeFlags
_0803488C: .4byte gUnknown_8260238
_08034890:
	ldr r0, _08034898 @ =gUnknown_8260208
	bl sub_800F034
	b _0803495A
	.align 2, 0
_08034898: .4byte gUnknown_8260208
_0803489C:
	cmp r4, 0x3
	bne _080348AC
	ldr r0, _080348A8 @ =gUnknown_8260210
	bl sub_800F034
	b _0803495A
	.align 2, 0
_080348A8: .4byte gUnknown_8260210
_080348AC:
	cmp r4, 0x4
	bne _080348BC
	ldr r0, _080348B8 @ =gUnknown_2023BD6
	ldrb r0, [r0]
	b _08034944
	.align 2, 0
_080348B8: .4byte gUnknown_2023BD6
_080348BC:
	cmp r4, 0x5
	bne _08034958
	ldr r0, _080348C8 @ =gUnknown_2023BD6
	ldrb r0, [r0, 0x1]
	b _08034944
	.align 2, 0
_080348C8: .4byte gUnknown_2023BD6
_080348CC:
	cmp r4, 0x2
	bne _080348DC
	ldr r0, _080348D8 @ =gUnknown_8260218
	bl sub_800F034
	b _0803495A
	.align 2, 0
_080348D8: .4byte gUnknown_8260218
_080348DC:
	cmp r4, 0x3
	bne _080348EC
	ldr r0, _080348E8 @ =gUnknown_8260220
	bl sub_800F034
	b _0803495A
	.align 2, 0
_080348E8: .4byte gUnknown_8260220
_080348EC:
	cmp r4, 0x4
	bne _080348FC
	ldr r0, _080348F8 @ =gUnknown_8260228
	bl sub_800F034
	b _0803495A
	.align 2, 0
_080348F8: .4byte gUnknown_8260228
_080348FC:
	cmp r4, 0x5
	bne _0803490C
	ldr r0, _08034908 @ =gUnknown_8260230
	bl sub_800F034
	b _0803495A
	.align 2, 0
_08034908: .4byte gUnknown_8260230
_0803490C:
	cmp r4, 0x6
	bne _0803491C
	ldr r0, _08034918 @ =gUnknown_2023BD6
	ldrb r0, [r0]
	b _08034944
	.align 2, 0
_08034918: .4byte gUnknown_2023BD6
_0803491C:
	cmp r4, 0x7
	bne _0803492C
	ldr r0, _08034928 @ =gUnknown_2023BD6
	ldrb r0, [r0, 0x1]
	b _08034944
	.align 2, 0
_08034928: .4byte gUnknown_2023BD6
_0803492C:
	cmp r4, 0x8
	bne _0803493C
	ldr r0, _08034938 @ =gUnknown_2023BD6
	ldrb r0, [r0, 0x2]
	b _08034944
	.align 2, 0
_08034938: .4byte gUnknown_2023BD6
_0803493C:
	cmp r5, 0x9
	bne _08034958
	ldr r0, _08034950 @ =gUnknown_2023BD6
	ldrb r0, [r0, 0x3]
_08034944:
	lsls r0, 3
	ldr r1, _08034954 @ =gUnknown_8260240
	adds r0, r1
	bl sub_800F034
	b _0803495A
	.align 2, 0
_08034950: .4byte gUnknown_2023BD6
_08034954: .4byte gUnknown_8260240
_08034958:
	movs r6, 0x1
_0803495A:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end BattleLoadAllHealthBoxesGfx

	thumb_func_start LoadBattleBarGfx
LoadBattleBarGfx: @ 8034964
	push {lr}
	ldr r0, _0803497C @ =gUnknown_8D093D8
	ldr r1, _08034980 @ =gUnknown_202401C
	ldr r1, [r1]
	movs r2, 0xBA
	lsls r2, 1
	adds r1, r2
	ldr r1, [r1]
	bl LZDecompressWram
	pop {r0}
	bx r0
	.align 2, 0
_0803497C: .4byte gUnknown_8D093D8
_08034980: .4byte gUnknown_202401C
	thumb_func_end LoadBattleBarGfx

	thumb_func_start BattleInitAllSprites
BattleInitAllSprites: @ 8034984
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r6, 0
	ldrb r0, [r5]
	cmp r0, 0x6
	bls _08034994
	b _08034AF2
_08034994:
	lsls r0, 2
	ldr r1, _080349A0 @ =_080349A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080349A0: .4byte _080349A4
	.align 2, 0
_080349A4:
	.4byte _080349C0
	.4byte _080349C6
	.4byte _08034AD0
	.4byte _080349DC
	.4byte _08034A0C
	.4byte _08034A48
	.4byte _08034AE8
_080349C0:
	bl ClearSpritesBankHealthboxAnimData
	b _08034AD0
_080349C6:
	ldrb r0, [r4]
	bl BattleLoadAllHealthBoxesGfx
	lsls r0, 24
	cmp r0, 0
	beq _080349D4
	b _08034ACC
_080349D4:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08034AF2
_080349DC:
	ldr r0, _080349F4 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080349F8
	ldrb r0, [r4]
	cmp r0, 0
	bne _080349F8
	bl CreateSafariPlayerHealthboxSprites
	b _080349FE
	.align 2, 0
_080349F4: .4byte gBattleTypeFlags
_080349F8:
	ldrb r0, [r4]
	bl CreateBankHealthboxSprites
_080349FE:
	ldr r2, _08034A08 @ =gUnknown_3004FF0
	ldrb r1, [r4]
	adds r1, r2
	strb r0, [r1]
	b _08034ABA
	.align 2, 0
_08034A08: .4byte gUnknown_3004FF0
_08034A0C:
	ldrb r0, [r4]
	bl SetBankHealthboxSpritePos
	ldr r0, _08034A2C @ =gUnknown_2023BD6
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _08034A34
	ldr r0, _08034A30 @ =gUnknown_3004FF0
	adds r0, r1, r0
	ldrb r0, [r0]
	movs r1, 0
	bl nullsub_21
	b _08034ABA
	.align 2, 0
_08034A2C: .4byte gUnknown_2023BD6
_08034A30: .4byte gUnknown_3004FF0
_08034A34:
	ldr r0, _08034A44 @ =gUnknown_3004FF0
	adds r0, r1, r0
	ldrb r0, [r0]
	movs r1, 0x1
	bl nullsub_21
	b _08034ABA
	.align 2, 0
_08034A44: .4byte gUnknown_3004FF0
_08034A48:
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08034A90
	ldr r0, _08034A80 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08034AAE
	ldr r0, _08034A84 @ =gUnknown_3004FF0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08034A88 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08034A8C @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	b _08034AAE
	.align 2, 0
_08034A80: .4byte gBattleTypeFlags
_08034A84: .4byte gUnknown_3004FF0
_08034A88: .4byte gBattlerPartyIndexes
_08034A8C: .4byte gPlayerParty
_08034A90:
	ldr r0, _08034AD8 @ =gUnknown_3004FF0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08034ADC @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08034AE0 @ =gEnemyParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
_08034AAE:
	ldr r1, _08034AD8 @ =gUnknown_3004FF0
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
_08034ABA:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08034AE4 @ =gUnknown_2023BCC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08034AF2
_08034ACC:
	movs r0, 0
	strb r0, [r4]
_08034AD0:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08034AF2
	.align 2, 0
_08034AD8: .4byte gUnknown_3004FF0
_08034ADC: .4byte gBattlerPartyIndexes
_08034AE0: .4byte gEnemyParty
_08034AE4: .4byte gUnknown_2023BCC
_08034AE8:
	bl LoadAndCreateEnemyShadowSprites
	bl sub_8127CAC
	movs r6, 0x1
_08034AF2:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end BattleInitAllSprites

	thumb_func_start ClearSpritesHealthboxAnimData
ClearSpritesHealthboxAnimData: @ 8034AFC
	push {r4,lr}
	ldr r4, _08034B20 @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r0, [r0, 0x4]
	movs r1, 0
	movs r2, 0x30
	bl memset
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034B20: .4byte gUnknown_2024018
	thumb_func_end ClearSpritesHealthboxAnimData

	thumb_func_start ClearSpritesBankHealthboxAnimData
ClearSpritesBankHealthboxAnimData: @ 8034B24
	push {lr}
	bl ClearSpritesHealthboxAnimData
	ldr r0, _08034B3C @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08034B3C: .4byte gUnknown_2024018
	thumb_func_end ClearSpritesBankHealthboxAnimData

	thumb_func_start CopyAllBattleSpritesInvisibilities
CopyAllBattleSpritesInvisibilities: @ 8034B40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r4, 0
	ldr r5, _08034BA4 @ =gUnknown_2023BCC
	ldrb r0, [r5]
	cmp r4, r0
	bge _08034B96
	ldr r0, _08034BA8 @ =gSprites
	mov r9, r0
	movs r0, 0x1
	mov r12, r0
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ldr r7, _08034BAC @ =gUnknown_2024018
	ldr r6, _08034BB0 @ =gUnknown_2023D44
_08034B64:
	ldr r0, [r7]
	ldr r0, [r0]
	lsls r3, r4, 2
	adds r3, r0
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	mov r0, r12
	ands r1, r0
	ldrb r2, [r3]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r4, 0x1
	ldrb r0, [r5]
	cmp r4, r0
	blt _08034B64
_08034B96:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034BA4: .4byte gUnknown_2023BCC
_08034BA8: .4byte gSprites
_08034BAC: .4byte gUnknown_2024018
_08034BB0: .4byte gUnknown_2023D44
	thumb_func_end CopyAllBattleSpritesInvisibilities

	thumb_func_start CopyBattleSpriteInvisibility
CopyBattleSpriteInvisibility: @ 8034BB4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08034BE8 @ =gUnknown_2024018
	ldr r1, [r1]
	ldr r1, [r1]
	lsls r3, r0, 2
	adds r3, r1
	ldr r2, _08034BEC @ =gSprites
	ldr r1, _08034BF0 @ =gUnknown_2023D44
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_08034BE8: .4byte gUnknown_2024018
_08034BEC: .4byte gSprites
_08034BF0: .4byte gUnknown_2023D44
	thumb_func_end CopyBattleSpriteInvisibility

	thumb_func_start sub_8034BF4
sub_8034BF4: @ 8034BF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0xFF
	beq _08034C16
	b _08034D88
_08034C16:
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08034D58 @ =gBattlerPartyIndexes
	mov r1, r9
	lsls r1, 1
	adds r0, r1, r0
	str r0, [sp, 0xC]
	ldrh r0, [r0]
	movs r2, 0x64
	muls r0, r2
	ldr r3, _08034D5C @ =gEnemyParty
	adds r0, r3
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0xC]
	ldrh r0, [r1]
	movs r2, 0x64
	muls r0, r2
	ldr r3, _08034D5C @ =gEnemyParty
	adds r0, r3
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x4]
	ldr r1, [sp, 0xC]
	ldrh r0, [r1]
	movs r2, 0x64
	muls r0, r2
	ldr r3, _08034D5C @ =gEnemyParty
	adds r0, r3
	movs r1, 0x1
	bl GetMonData
	adds r7, r0, 0
	mov r1, r8
	lsls r0, r1, 3
	ldr r1, _08034D60 @ =gUnknown_82350AC
	adds r0, r1
	ldr r4, _08034D64 @ =gUnknown_202401C
	ldr r1, [r4]
	mov r2, r10
	lsls r5, r2, 2
	adds r1, 0x4
	adds r1, r5
	ldr r1, [r1]
	mov r2, r8
	ldr r3, [sp, 0x4]
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	ldr r0, [r4]
	adds r0, 0x4
	adds r0, r5
	ldr r2, [r0]
	ldr r5, _08034D68 @ =gSprites
	ldr r4, _08034D6C @ =gUnknown_2023D44
	add r4, r9
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldr r1, _08034D70 @ =0x06010000
	adds r0, r1
	ldr r1, _08034D74 @ =0x040000d4
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _08034D78 @ =0x84000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r3, r9
	lsls r0, r3, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	mov r10, r0
	mov r0, r8
	adds r1, r7, 0
	ldr r2, [sp, 0x4]
	bl GetFrontSpritePalFromSpeciesAndPersonality
	adds r6, r0, 0
	movs r0, 0x80
	lsls r0, 3
	bl AllocZeroed
	adds r7, r0, 0
	adds r0, r6, 0
	adds r1, r7, 0
	bl LZDecompressWram
	adds r0, r7, 0
	mov r1, r10
	movs r2, 0x20
	bl LoadPalette
	adds r0, r7, 0
	bl Free
	mov r0, r9
	bl GetBankSpriteDefault_Y
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x22]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08034D7C @ =gUnknown_2024024
	add r1, r9
	ldrb r1, [r1]
	bl StartSpriteAnim
	ldr r2, [sp, 0xC]
	ldrh r0, [r2]
	movs r3, 0x64
	muls r0, r3
	ldr r1, _08034D5C @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	mov r2, r8
	muls r2, r1
	ldr r1, _08034D80 @ =gUnknown_8245EE0
	adds r2, r1
	movs r1, 0x2
	bl sub_804037C
	ldr r4, _08034D84 @ =gUnknown_3004FF0
	add r4, r9
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldrh r1, [r2]
	movs r3, 0x64
	muls r1, r3
	ldr r2, _08034D5C @ =gEnemyParty
	adds r1, r2
	bl sub_80496C0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_804981C
	b _08035062
	.align 2, 0
_08034D58: .4byte gBattlerPartyIndexes
_08034D5C: .4byte gEnemyParty
_08034D60: .4byte gUnknown_82350AC
_08034D64: .4byte gUnknown_202401C
_08034D68: .4byte gSprites
_08034D6C: .4byte gUnknown_2023D44
_08034D70: .4byte 0x06010000
_08034D74: .4byte 0x040000d4
_08034D78: .4byte 0x84000200
_08034D7C: .4byte gUnknown_2024024
_08034D80: .4byte gUnknown_8245EE0
_08034D84: .4byte gUnknown_3004FF0
_08034D88:
	cmp r2, 0
	beq _08034E4C
	ldr r0, _08034E28 @ =gUnknown_2023D44
	mov r3, r9
	adds r5, r3, r0
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08034E2C @ =gSprites
	adds r0, r6
	ldr r4, _08034E30 @ =gUnknown_2024018
	ldr r1, [r4]
	ldr r1, [r1, 0x8]
	ldrb r1, [r1]
	bl StartSpriteAnim
	mov r1, r9
	lsls r0, r1, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	mov r10, r0
	ldr r2, _08034E34 @ =gBattleStruct
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	ldrh r1, [r0]
	lsls r1, 5
	movs r3, 0x80
	lsls r3, 1
	adds r1, r3
	ldr r0, [r2]
	adds r0, r1
	mov r1, r10
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08034E38 @ =gUnknown_2024024
	add r1, r9
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r0, [r4]
	ldr r1, [r0]
	mov r2, r9
	lsls r0, r2, 2
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _08034E0E
	ldr r3, _08034E3C @ =0x00007fff
	mov r0, r10
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
	mov r3, r10
	lsls r1, r3, 1
	ldr r0, _08034E40 @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _08034E44 @ =gPlttBufferUnfaded
	adds r1, r2
	ldr r2, _08034E48 @ =0x04000008
	bl CpuSet
_08034E0E:
	mov r0, r9
	bl GetBankSpriteDefault_Y
	ldrb r2, [r5]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r6
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x22]
	b _08035062
	.align 2, 0
_08034E28: .4byte gUnknown_2023D44
_08034E2C: .4byte gSprites
_08034E30: .4byte gUnknown_2024018
_08034E34: .4byte gBattleStruct
_08034E38: .4byte gUnknown_2024024
_08034E3C: .4byte 0x00007fff
_08034E40: .4byte gPlttBufferFaded
_08034E44: .4byte gPlttBufferUnfaded
_08034E48: .4byte 0x04000008
_08034E4C:
	mov r0, r9
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, [sp]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08034E80
	ldr r1, _08034E78 @ =gBattlerPartyIndexes
	ldr r2, [sp]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08034E7C @ =gEnemyParty
	b _08034E90
	.align 2, 0
_08034E78: .4byte gBattlerPartyIndexes
_08034E7C: .4byte gEnemyParty
_08034E80:
	ldr r1, _08034EFC @ =gBattlerPartyIndexes
	ldr r3, [sp]
	lsls r0, r3, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08034F00 @ =gPlayerParty
_08034E90:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r0, r9
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08034F10
	ldr r0, _08034EFC @ =gBattlerPartyIndexes
	mov r1, r9
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r7, 0x64
	muls r0, r7
	ldr r5, _08034F00 @ =gPlayerParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x4]
	ldrh r0, [r4]
	muls r0, r7
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	adds r7, r0, 0
	mov r2, r8
	lsls r0, r2, 3
	ldr r1, _08034F04 @ =gUnknown_823654C
	adds r0, r1
	ldr r1, _08034F08 @ =gUnknown_202401C
	ldr r1, [r1]
	mov r3, r10
	lsls r5, r3, 2
	adds r1, 0x4
	adds r1, r5
	ldr r1, [r1]
	ldr r2, _08034F0C @ =gUnknown_2024008
	mov r3, r9
	lsls r4, r3, 2
	adds r2, r4, r2
	ldr r3, [r2]
	mov r2, r8
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	b _08034F5E
	.align 2, 0
_08034EFC: .4byte gBattlerPartyIndexes
_08034F00: .4byte gPlayerParty
_08034F04: .4byte gUnknown_823654C
_08034F08: .4byte gUnknown_202401C
_08034F0C: .4byte gUnknown_2024008
_08034F10:
	ldr r0, _08035074 @ =gBattlerPartyIndexes
	mov r1, r9
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r7, 0x64
	muls r0, r7
	ldr r5, _08035078 @ =gEnemyParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x4]
	ldrh r0, [r4]
	muls r0, r7
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	adds r7, r0, 0
	mov r2, r8
	lsls r0, r2, 3
	ldr r1, _0803507C @ =gUnknown_82350AC
	adds r0, r1
	ldr r1, _08035080 @ =gUnknown_202401C
	ldr r1, [r1]
	mov r3, r10
	lsls r5, r3, 2
	adds r1, 0x4
	adds r1, r5
	ldr r1, [r1]
	ldr r2, _08035084 @ =gUnknown_2024008
	mov r3, r9
	lsls r4, r3, 2
	adds r2, r4, r2
	ldr r3, [r2]
	mov r2, r8
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
_08034F5E:
	str r4, [sp, 0x14]
	ldr r0, _08035080 @ =gUnknown_202401C
	ldr r0, [r0]
	adds r0, 0x4
	adds r0, r5
	ldr r2, [r0]
	ldr r0, _08035088 @ =gUnknown_2023D44
	add r0, r9
	str r0, [sp, 0x10]
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0803508C @ =gSprites
	adds r0, r1
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldr r1, _08035090 @ =0x06010000
	adds r0, r1
	ldr r1, _08035094 @ =0x040000d4
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _08035098 @ =0x84000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r2, r9
	lsls r0, r2, 20
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r0, 16
	mov r10, r0
	mov r0, r8
	adds r1, r7, 0
	ldr r2, [sp, 0x4]
	bl GetFrontSpritePalFromSpeciesAndPersonality
	adds r6, r0, 0
	movs r0, 0x80
	lsls r0, 3
	bl AllocZeroed
	adds r7, r0, 0
	adds r0, r6, 0
	adds r1, r7, 0
	bl LZDecompressWram
	adds r0, r7, 0
	mov r1, r10
	movs r2, 0x20
	bl LoadPalette
	adds r0, r7, 0
	bl Free
	ldr r0, _0803509C @ =0x00000181
	cmp r8, r0
	bne _08034FFC
	ldr r5, _080350A0 @ =gBattleStruct
	ldr r1, [r5]
	movs r4, 0x80
	lsls r4, 1
	adds r1, r4
	adds r0, r6, 0
	bl LZDecompressWram
	ldr r0, _080350A4 @ =gUnknown_2024024
	ldr r1, [sp]
	adds r0, r1, r0
	ldrb r1, [r0]
	lsls r1, 5
	adds r1, r4
	ldr r0, [r5]
	adds r0, r1
	mov r1, r10
	movs r2, 0x20
	bl LoadPalette
_08034FFC:
	ldr r3, _080350A8 @ =0x00007fff
	mov r0, r10
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
	mov r2, r10
	lsls r1, r2, 1
	ldr r0, _080350AC @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _080350B0 @ =gPlttBufferUnfaded
	adds r1, r2
	ldr r2, _080350B4 @ =0x04000008
	bl CpuSet
	ldr r0, _080350B8 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r3, [sp, 0x14]
	adds r0, r3, r0
	mov r1, r8
	strh r1, [r0, 0x2]
	ldr r0, _080350A4 @ =gUnknown_2024024
	mov r2, r9
	adds r4, r2, r0
	ldr r3, [sp]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r4]
	mov r0, r9
	bl GetBankSpriteDefault_Y
	ldr r1, [sp, 0x10]
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _0803508C @ =gSprites
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x22]
	ldr r3, [sp, 0x10]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r4]
	bl StartSpriteAnim
_08035062:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035074: .4byte gBattlerPartyIndexes
_08035078: .4byte gEnemyParty
_0803507C: .4byte gUnknown_82350AC
_08035080: .4byte gUnknown_202401C
_08035084: .4byte gUnknown_2024008
_08035088: .4byte gUnknown_2023D44
_0803508C: .4byte gSprites
_08035090: .4byte 0x06010000
_08035094: .4byte 0x040000d4
_08035098: .4byte 0x84000200
_0803509C: .4byte 0x00000181
_080350A0: .4byte gBattleStruct
_080350A4: .4byte gUnknown_2024024
_080350A8: .4byte 0x00007fff
_080350AC: .4byte gPlttBufferFaded
_080350B0: .4byte gPlttBufferUnfaded
_080350B4: .4byte 0x04000008
_080350B8: .4byte gUnknown_2024018
	thumb_func_end sub_8034BF4

	thumb_func_start sub_80350BC
sub_80350BC: @ 80350BC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	lsls r1, 24
	cmp r1, 0
	bne _08035158
	adds r0, r4, 0
	bl GetBankIdentity
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080350FC
	ldr r0, _080350F4 @ =gUnknown_8D2D0B4
	ldr r1, _080350F8 @ =gUnknown_202401C
	ldr r1, [r1]
	lsls r4, r5, 2
	adds r1, 0x4
	adds r1, r4
	ldr r1, [r1]
	bl LZDecompressVram
	b _0803510E
	.align 2, 0
_080350F4: .4byte gUnknown_8D2D0B4
_080350F8: .4byte gUnknown_202401C
_080350FC:
	ldr r0, _08035144 @ =gUnknown_8D2D2F4
	ldr r1, _08035148 @ =gUnknown_202401C
	ldr r1, [r1]
	lsls r4, r5, 2
	adds r1, 0x4
	adds r1, r4
	ldr r1, [r1]
	bl LZDecompressVram
_0803510E:
	movs r3, 0x1
	lsls r6, 4
	ldr r7, _0803514C @ =gUnknown_8D2D090
	ldr r0, _08035148 @ =gUnknown_202401C
	ldr r0, [r0]
	adds r0, 0x4
	adds r4, r0, r4
	ldr r2, _08035150 @ =0x040000d4
	ldr r5, _08035154 @ =0x84000200
_08035120:
	ldr r0, [r4]
	lsls r1, r3, 11
	adds r1, r0, r1
	str r0, [r2]
	str r1, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r3, 0x1
	cmp r3, 0x3
	ble _08035120
	movs r0, 0x80
	lsls r0, 1
	adds r1, r6, r0
	adds r0, r7, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	b _0803519A
	.align 2, 0
_08035144: .4byte gUnknown_8D2D2F4
_08035148: .4byte gUnknown_202401C
_0803514C: .4byte gUnknown_8D2D090
_08035150: .4byte 0x040000d4
_08035154: .4byte 0x84000200
_08035158:
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08035184
	ldr r1, _0803517C @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08035180 @ =gEnemyParty
	adds r0, r1
	adds r1, r4, 0
	bl BattleLoadOpponentMonSpriteGfx
	b _0803519A
	.align 2, 0
_0803517C: .4byte gBattlerPartyIndexes
_08035180: .4byte gEnemyParty
_08035184:
	ldr r1, _080351A0 @ =gBattlerPartyIndexes
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080351A4 @ =gPlayerParty
	adds r0, r1
	adds r1, r6, 0
	bl sub_8034498
_0803519A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080351A0: .4byte gBattlerPartyIndexes
_080351A4: .4byte gPlayerParty
	thumb_func_end sub_80350BC

	thumb_func_start LoadBattleMonGfxAndAnimate
LoadBattleMonGfxAndAnimate: @ 80351A8
	push {r4-r6,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_80350BC
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _080351E4 @ =gSprites
	adds r4, r0, r1
	ldr r0, _080351E8 @ =gUnknown_2024024
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl StartSpriteAnim
	cmp r5, 0
	bne _080351EC
	adds r0, r6, 0
	bl GetSubstituteSpriteDefault_Y
	b _080351F2
	.align 2, 0
_080351E4: .4byte gSprites
_080351E8: .4byte gUnknown_2024024
_080351EC:
	adds r0, r6, 0
	bl GetBankSpriteDefault_Y
_080351F2:
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end LoadBattleMonGfxAndAnimate

	thumb_func_start TrySetBehindSubstituteSpriteBit
TrySetBehindSubstituteSpriteBit: @ 8035200
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0xA4
	bne _08035220
	ldr r0, _08035224 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r1, r2, 2
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_08035220:
	pop {r0}
	bx r0
	.align 2, 0
_08035224: .4byte gUnknown_2024018
	thumb_func_end TrySetBehindSubstituteSpriteBit

	thumb_func_start ClearBehindSubstituteBit
ClearBehindSubstituteBit: @ 8035228
	lsls r0, 24
	ldr r1, _08035240 @ =gUnknown_2024018
	ldr r1, [r1]
	ldr r1, [r1]
	lsrs r0, 22
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08035240: .4byte gUnknown_2024018
	thumb_func_end ClearBehindSubstituteBit

	thumb_func_start HandleLowHpMusicChange
HandleLowHpMusicChange: @ 8035244
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	adds r7, r6, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r4, 16
	asrs r4, 16
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080352BC
	ldr r7, _080352B8 @ =gUnknown_2024018
	ldr r0, [r7]
	ldr r2, [r0]
	lsls r4, r6, 2
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r5, 0x2
	movs r3, 0x2
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0803530E
	adds r0, r6, 0
	eors r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _080352AA
	movs r0, 0x53
	bl PlaySE
_080352AA:
	ldr r0, [r7]
	ldr r1, [r0]
	adds r1, r4, r1
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	b _0803530E
	.align 2, 0
_080352B8: .4byte gUnknown_2024018
_080352BC:
	ldr r4, _080352E4 @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r0, [r0]
	lsls r1, r6, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	bne _080352E8
	movs r0, 0x53
	bl m4aSongNumStop
	b _0803530E
	.align 2, 0
_080352E4: .4byte gUnknown_2024018
_080352E8:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0803530E
	ldr r1, [r4]
	movs r0, 0x2
	eors r7, r0
	ldr r1, [r1]
	lsls r0, r7, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0803530E
	movs r0, 0x53
	bl m4aSongNumStop
_0803530E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end HandleLowHpMusicChange

	thumb_func_start BattleStopLowHpSound
BattleStopLowHpSound: @ 8035314
	push {r4-r6,lr}
	movs r0, 0
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _08035364 @ =gUnknown_2024018
	ldr r0, [r5]
	ldr r0, [r0]
	lsls r1, r4, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r6, 0x3
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _08035356
	ldr r2, [r5]
	movs r0, 0x2
	adds r1, r4, 0
	eors r1, r0
	ldr r0, [r2]
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
_08035356:
	movs r0, 0x53
	bl m4aSongNumStop
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035364: .4byte gUnknown_2024018
	thumb_func_end BattleStopLowHpSound

	thumb_func_start GetMonHPBarLevel
GetMonHPBarLevel: @ 8035368
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r4, 16
	asrs r4, 16
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetMonHPBarLevel

	thumb_func_start sub_803539C
sub_803539C: @ 803539C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08035440 @ =gMain
	ldr r1, _08035444 @ =0x00000439
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08035432
	movs r0, 0
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0x2
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r5, _08035448 @ =gBattlerPartyIndexes
	mov r1, r8
	lsls r0, r1, 1
	adds r0, r5
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r9
	lsls r0, r1, 1
	adds r0, r5
	ldrb r0, [r0]
	bl pokemon_order_func
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0x64
	adds r0, r4, 0
	muls r0, r7
	ldr r6, _0803544C @ =gPlayerParty
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0803540E
	adds r0, r4, 0
	mov r1, r8
	bl HandleLowHpMusicChange
_0803540E:
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _08035432
	adds r0, r5, 0
	muls r0, r7
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08035432
	adds r0, r4, 0
	mov r1, r9
	bl HandleLowHpMusicChange
_08035432:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035440: .4byte gMain
_08035444: .4byte 0x00000439
_08035448: .4byte gBattlerPartyIndexes
_0803544C: .4byte gPlayerParty
	thumb_func_end sub_803539C

	thumb_func_start sub_8035450
sub_8035450: @ 8035450
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r0, _080354E0 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r5, r0
	bge _08035520
	movs r0, 0x3
	mov r10, r8
	mov r1, r10
	ands r1, r0
	mov r10, r1
	movs r6, 0
	movs r2, 0x3F
	negs r2, r2
	mov r9, r2
_0803547C:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_8075224
	lsls r0, 24
	cmp r0, 0
	beq _08035514
	ldr r4, _080354E4 @ =gSprites
	ldr r0, _080354E8 @ =gUnknown_2023D44
	adds r3, r5, r0
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r7, 0x4
	negs r7, r7
	adds r2, r7, 0
	ands r1, r2
	mov r2, r10
	orrs r1, r2
	strb r1, [r0, 0x1]
	mov r7, r8
	cmp r7, 0
	bne _080354F0
	ldr r0, _080354EC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r2, [r0, 0x4]
	adds r2, r6, r2
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r2, 0x6]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x3]
	mov r2, r9
	ands r1, r2
	strb r1, [r0, 0x3]
	b _08035514
	.align 2, 0
_080354E0: .4byte gUnknown_2023BCC
_080354E4: .4byte gSprites
_080354E8: .4byte gUnknown_2023D44
_080354EC: .4byte gUnknown_2024018
_080354F0:
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldr r0, _08035530 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	adds r0, r6, r0
	ldrb r1, [r0, 0x6]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r0, [r2, 0x3]
	mov r3, r9
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x3]
_08035514:
	adds r6, 0xC
	adds r5, 0x1
	ldr r0, _08035534 @ =gUnknown_2023BCC
	ldrb r0, [r0]
	cmp r5, r0
	blt _0803547C
_08035520:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035530: .4byte gUnknown_2024018
_08035534: .4byte gUnknown_2023BCC
	thumb_func_end sub_8035450

	thumb_func_start LoadAndCreateEnemyShadowSprites
LoadAndCreateEnemyShadowSprites: @ 8035538
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08035614 @ =gUnknown_8250A0C
	bl sub_800F034
	movs r0, 0x1
	bl GetBankByIdentity
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08035618 @ =gUnknown_8250A1C
	mov r8, r0
	adds r0, r5, 0
	movs r1, 0
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8074480
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 8
	movs r0, 0xE8
	lsls r0, 13
	adds r2, r0
	asrs r2, 16
	mov r0, r8
	adds r1, r4, 0
	movs r3, 0xC8
	bl CreateSprite
	ldr r6, _0803561C @ =gUnknown_2024018
	ldr r1, [r6]
	ldr r2, [r1, 0x4]
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r2, r1, r2
	strb r0, [r2, 0x7]
	ldr r7, _08035620 @ =gSprites
	ldr r0, [r6]
	ldr r0, [r0, 0x4]
	adds r1, r0
	ldrb r1, [r1, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r5, [r0, 0x2E]
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0803560A
	movs r0, 0x3
	bl GetBankByIdentity
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8074480
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 8
	movs r0, 0xE8
	lsls r0, 13
	adds r2, r0
	asrs r2, 16
	mov r0, r8
	adds r1, r4, 0
	movs r3, 0xC8
	bl CreateSprite
	ldr r1, [r6]
	ldr r2, [r1, 0x4]
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r2, r1, r2
	strb r0, [r2, 0x7]
	ldr r0, [r6]
	ldr r0, [r0, 0x4]
	adds r1, r0
	ldrb r1, [r1, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r5, [r0, 0x2E]
_0803560A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035614: .4byte gUnknown_8250A0C
_08035618: .4byte gUnknown_8250A1C
_0803561C: .4byte gUnknown_2024018
_08035620: .4byte gSprites
	thumb_func_end LoadAndCreateEnemyShadowSprites

	thumb_func_start SpriteCB_EnemyShadow
SpriteCB_EnemyShadow: @ 8035624
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r0, 0
	mov r8, r0
	ldrh r0, [r5, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08035668 @ =gUnknown_2023D44
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0803566C @ =gSprites
	adds r7, r0, r1
	adds r6, r7, 0
	adds r6, 0x3E
	ldrb r1, [r6]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08035660
	adds r0, r4, 0
	bl sub_8075224
	lsls r0, 24
	cmp r0, 0
	bne _08035674
_08035660:
	ldr r0, _08035670 @ =SpriteCB_SetInvisible
	str r0, [r5, 0x1C]
	b _080356EA
	.align 2, 0
_08035668: .4byte gUnknown_2023D44
_0803566C: .4byte gSprites
_08035670: .4byte SpriteCB_SetInvisible
_08035674:
	ldr r0, _08035690 @ =gUnknown_2037EE1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08035686
	ldrb r1, [r6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08035698
_08035686:
	movs r0, 0x1
	mov r8, r0
	ldr r2, _08035694 @ =gUnknown_2024018
	lsls r4, 2
	b _080356BA
	.align 2, 0
_08035690: .4byte gUnknown_2037EE1
_08035694: .4byte gUnknown_2024018
_08035698:
	ldr r2, _080356F4 @ =gUnknown_2024018
	ldr r0, [r2]
	ldr r0, [r0]
	lsls r1, r4, 2
	adds r3, r1, r0
	ldrh r0, [r3, 0x2]
	adds r4, r1, 0
	cmp r0, 0
	beq _080356BA
	ldr r0, _080356F8 @ =gUnknown_823A004
	ldrh r1, [r3, 0x2]
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080356BA
	movs r0, 0x1
	mov r8, r0
_080356BA:
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080356CE
	movs r0, 0x1
	mov r8, r0
_080356CE:
	ldrh r0, [r7, 0x20]
	strh r0, [r5, 0x20]
	ldrh r0, [r7, 0x24]
	strh r0, [r5, 0x24]
	adds r2, r5, 0
	adds r2, 0x3E
	mov r0, r8
	lsls r3, r0, 2
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_080356EA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080356F4: .4byte gUnknown_2024018
_080356F8: .4byte gUnknown_823A004
	thumb_func_end SpriteCB_EnemyShadow

	thumb_func_start SpriteCB_SetInvisible
SpriteCB_SetInvisible: @ 80356FC
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end SpriteCB_SetInvisible

	thumb_func_start SetBankEnemyShadowSpriteCallback
SetBankEnemyShadowSpriteCallback: @ 8035708
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08035784
	ldr r0, _08035758 @ =gUnknown_2024018
	ldr r3, [r0]
	ldr r1, [r3]
	lsls r0, r4, 2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _08035732
	adds r5, r0, 0
_08035732:
	ldr r0, _0803575C @ =gUnknown_823A004
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08035768
	ldr r2, _08035760 @ =gSprites
	ldr r1, [r3, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08035764 @ =SpriteCB_EnemyShadow
	b _08035782
	.align 2, 0
_08035758: .4byte gUnknown_2024018
_0803575C: .4byte gUnknown_823A004
_08035760: .4byte gSprites
_08035764: .4byte SpriteCB_EnemyShadow
_08035768:
	ldr r2, _0803578C @ =gSprites
	ldr r1, [r3, 0x4]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08035790 @ =SpriteCB_SetInvisible
_08035782:
	str r1, [r0]
_08035784:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803578C: .4byte gSprites
_08035790: .4byte SpriteCB_SetInvisible
	thumb_func_end SetBankEnemyShadowSpriteCallback

	thumb_func_start EnemyShadowCallbackToSetInvisible
EnemyShadowCallbackToSetInvisible: @ 8035794
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080357BC @ =gSprites
	ldr r1, _080357C0 @ =gUnknown_2024018
	ldr r1, [r1]
	ldr r3, [r1, 0x4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r1, [r1, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080357C4 @ =SpriteCB_SetInvisible
	str r1, [r0]
	bx lr
	.align 2, 0
_080357BC: .4byte gSprites
_080357C0: .4byte gUnknown_2024018
_080357C4: .4byte SpriteCB_SetInvisible
	thumb_func_end EnemyShadowCallbackToSetInvisible

	thumb_func_start sub_80357C8
sub_80357C8: @ 80357C8
	push {r4-r7,lr}
	ldr r2, _08035894 @ =0x06000240
	movs r7, 0xF0
	lsls r7, 8
	movs r5, 0x8
_080357D2:
	movs r4, 0xF
_080357D4:
	ldrh r1, [r2]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _080357E4
	adds r0, r7, 0
	orrs r0, r1
	strh r0, [r2]
_080357E4:
	ldrh r1, [r2]
	movs r6, 0xF0
	lsls r6, 4
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _080357F8
	adds r0, r6, 0
	orrs r0, r1
	strh r0, [r2]
_080357F8:
	ldrh r1, [r2]
	movs r3, 0xF0
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	bne _0803580A
	adds r0, r1, 0
	orrs r0, r3
	strh r0, [r2]
_0803580A:
	ldrh r1, [r2]
	movs r3, 0xF
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0803581C
	adds r0, r1, 0
	orrs r0, r3
	strh r0, [r2]
_0803581C:
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080357D4
	subs r5, 0x1
	cmp r5, 0
	bge _080357D2
	ldr r2, _08035898 @ =0x06000600
	movs r5, 0
	movs r7, 0xF0
	lsls r7, 8
_08035832:
	adds r3, r5, 0x1
	movs r4, 0xF
_08035836:
	ldrh r1, [r2]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _0803584A
	movs r5, 0xC0
	lsls r5, 7
	adds r0, r5, 0
	orrs r0, r1
	strh r0, [r2]
_0803584A:
	ldrh r1, [r2]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _0803585E
	movs r5, 0xC0
	lsls r5, 3
	adds r0, r5, 0
	orrs r0, r1
	strh r0, [r2]
_0803585E:
	ldrh r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	bne _0803586E
	movs r0, 0x60
	orrs r0, r1
	strh r0, [r2]
_0803586E:
	ldrh r1, [r2]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0803587E
	movs r0, 0x6
	orrs r0, r1
	strh r0, [r2]
_0803587E:
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08035836
	adds r5, r3, 0
	cmp r5, 0x11
	ble _08035832
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035894: .4byte 0x06000240
_08035898: .4byte 0x06000600
	thumb_func_end sub_80357C8

	thumb_func_start ClearTemporarySpeciesSpriteData
ClearTemporarySpeciesSpriteData: @ 803589C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	ldr r0, _080358CC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r2, [r0]
	lsls r0, r4, 2
	adds r0, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0, 0x2]
	ldr r0, _080358D0 @ =gUnknown_2024024
	adds r0, r4, r0
	strb r3, [r0]
	cmp r1, 0
	bne _080358C4
	adds r0, r4, 0
	bl ClearBehindSubstituteBit
_080358C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080358CC: .4byte gUnknown_2024018
_080358D0: .4byte gUnknown_2024024
	thumb_func_end ClearTemporarySpeciesSpriteData

	thumb_func_start AllocateMonSpritesGfx
AllocateMonSpritesGfx: @ 80358D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	ldr r4, _080359A4 @ =gUnknown_202401C
	str r6, [r4]
	movs r0, 0xC0
	lsls r0, 1
	bl AllocZeroed
	str r0, [r4]
	movs r0, 0x80
	lsls r0, 8
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1]
_080358FA:
	ldr r0, _080359A4 @ =gUnknown_202401C
	ldr r1, [r0]
	lsls r4, r6, 2
	adds r2, r1, 0x4
	adds r2, r4
	lsls r3, r6, 13
	ldr r0, [r1]
	adds r0, r3
	str r0, [r2]
	lsls r3, r6, 1
	adds r0, r3, r6
	lsls r0, 3
	adds r1, r0, r1
	ldr r2, _080359A8 @ =gUnknown_825DEF0
	adds r1, 0x14
	adds r0, r2
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
	movs r5, 0
	mov r9, r3
	lsls r0, r6, 5
	mov r8, r0
	adds r1, r6, 0x1
	mov r10, r1
	mov r12, r8
	adds r7, r4, 0
_08035932:
	ldr r2, _080359A4 @ =gUnknown_202401C
	ldr r1, [r2]
	lsls r4, r5, 3
	add r4, r12
	adds r3, r1, 0
	adds r3, 0x74
	adds r3, r4
	adds r0, r1, 0x4
	adds r0, r7
	lsls r2, r5, 11
	ldr r0, [r0]
	adds r0, r2
	str r0, [r3]
	adds r1, r4
	adds r1, 0x78
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08035932
	ldr r1, _080359A4 @ =gUnknown_202401C
	ldr r2, [r1]
	mov r5, r9
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r2, 0
	adds r1, 0x20
	adds r1, r0
	mov r0, r8
	adds r0, 0x74
	adds r2, r0
	str r2, [r1]
	mov r7, r10
	lsls r0, r7, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _080358FA
	movs r0, 0x80
	lsls r0, 5
	bl AllocZeroed
	ldr r1, _080359A4 @ =gUnknown_202401C
	ldr r1, [r1]
	movs r2, 0xBA
	lsls r2, 1
	adds r1, r2
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080359A4: .4byte gUnknown_202401C
_080359A8: .4byte gUnknown_825DEF0
	thumb_func_end AllocateMonSpritesGfx

	thumb_func_start FreeMonSpritesGfx
FreeMonSpritesGfx: @ 80359AC
	push {r4-r6,lr}
	ldr r6, _08035A24 @ =gUnknown_202401C
	ldr r0, [r6]
	cmp r0, 0
	beq _08035A1E
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080359D2
	bl Free
	ldr r0, [r6]
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_080359D2:
	ldr r0, [r6]
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080359F0
	bl Free
	ldr r0, [r6]
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_080359F0:
	ldr r0, [r6]
	movs r5, 0xBA
	lsls r5, 1
	adds r0, r5
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	adds r5, r0, r5
	movs r4, 0
	str r4, [r5]
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	str r4, [r0]
	str r4, [r0, 0x4]
	str r4, [r0, 0x8]
	str r4, [r0, 0xC]
	str r4, [r0, 0x10]
	bl Free
	str r4, [r6]
_08035A1E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035A24: .4byte gUnknown_202401C
	thumb_func_end FreeMonSpritesGfx

	thumb_func_start ShouldPlayNormalPokeCry
ShouldPlayNormalPokeCry: @ 8035A28
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x37
	bl GetMonData
	ldr r1, _08035A6C @ =0x00000fff
	ands r1, r0
	cmp r1, 0
	bne _08035A70
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r4, 16
	asrs r4, 16
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	ble _08035A70
	movs r0, 0x1
	b _08035A72
	.align 2, 0
_08035A6C: .4byte 0x00000fff
_08035A70:
	movs r0, 0
_08035A72:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ShouldPlayNormalPokeCry

	.align 2, 0 @ Don't pad with nop.
