	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text
	
	thumb_func_start OakOldManHandleReturnMonToBall
OakOldManHandleReturnMonToBall: @ 80E9DE8
	push {r4-r6,lr}
	ldr r0, _080E9E14 @ =gBattleBufferA
	ldr r6, _080E9E18 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080E9E24
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl InitAndLaunchSpecialAnimation
	ldr r0, _080E9E1C @ =gBattlerControllerFuncs
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080E9E20 @ =sub_80E89C4
	str r0, [r1]
	b _080E9E5A
	.align 2, 0
_080E9E14: .4byte gBattleBufferA
_080E9E18: .4byte gActiveBattler
_080E9E1C: .4byte gBattlerControllerFuncs
_080E9E20: .4byte sub_80E89C4
_080E9E24:
	ldr r5, _080E9E60 @ =gBattlerSpriteIds
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080E9E64 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _080E9E68 @ =gHealthboxSpriteIds
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl OakOldManBufferExecCompleted
_080E9E5A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9E60: .4byte gBattlerSpriteIds
_080E9E64: .4byte gSprites
_080E9E68: .4byte gHealthboxSpriteIds
	thumb_func_end OakOldManHandleReturnMonToBall

	thumb_func_start OakOldManHandleDrawTrainerPic
OakOldManHandleDrawTrainerPic: @ 80E9E6C
	push {r4-r6,lr}
	ldr r0, _080E9EC8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E9EE0
	ldr r4, _080E9ECC @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldrb r0, [r0, 0x8]
	ldr r6, _080E9ED0 @ =gActiveBattler
	ldrb r1, [r6]
	bl DecompressTrainerBackPalette
	ldr r0, [r4]
	ldrb r5, [r0, 0x8]
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _080E9ED4 @ =gMultiuseSpriteTemplate
	ldr r2, _080E9ED8 @ =gTrainerBackPicCoords
	ldr r1, [r4]
	ldrb r1, [r1, 0x8]
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r2, _080E9EDC @ =gBattlerSpriteIds
	ldrb r1, [r6]
	b _080E9F1C
	.align 2, 0
_080E9EC8: .4byte gBattleTypeFlags
_080E9ECC: .4byte gSaveBlock2Ptr
_080E9ED0: .4byte gActiveBattler
_080E9ED4: .4byte gMultiuseSpriteTemplate
_080E9ED8: .4byte gTrainerBackPicCoords
_080E9EDC: .4byte gBattlerSpriteIds
_080E9EE0:
	ldr r4, _080E9F8C @ =gActiveBattler
	ldrb r1, [r4]
	movs r0, 0x5
	bl DecompressTrainerBackPalette
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _080E9F90 @ =gMultiuseSpriteTemplate
	ldr r1, _080E9F94 @ =gTrainerBackPicCoords
	ldrb r1, [r1, 0x14]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r2, _080E9F98 @ =gBattlerSpriteIds
	ldrb r1, [r4]
_080E9F1C:
	adds r1, r2
	strb r0, [r1]
	ldr r4, _080E9F9C @ =gSprites
	ldr r5, _080E9F98 @ =gBattlerSpriteIds
	ldr r6, _080E9F8C @ =gActiveBattler
	ldrb r3, [r6]
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080E9FA0 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080E9FA4 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _080E9FA8 @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080E9FAC @ =CompleteOnBattlerSpriteCallbackDummy_tmp
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9F8C: .4byte gActiveBattler
_080E9F90: .4byte gMultiuseSpriteTemplate
_080E9F94: .4byte gTrainerBackPicCoords
_080E9F98: .4byte gBattlerSpriteIds
_080E9F9C: .4byte gSprites
_080E9FA0: .4byte 0x0000fffe
_080E9FA4: .4byte sub_8033EEC
_080E9FA8: .4byte gBattlerControllerFuncs
_080E9FAC: .4byte CompleteOnBattlerSpriteCallbackDummy_tmp
	thumb_func_end OakOldManHandleDrawTrainerPic

	thumb_func_start OakOldManHandleTrainerSlide
OakOldManHandleTrainerSlide: @ 80E9FB0
	push {r4-r6,lr}
	ldr r0, _080EA00C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA024
	ldr r4, _080EA010 @ =gSaveBlock2Ptr
	ldr r0, [r4]
	ldrb r0, [r0, 0x8]
	ldr r6, _080EA014 @ =gActiveBattler
	ldrb r1, [r6]
	bl DecompressTrainerBackPalette
	ldr r0, [r4]
	ldrb r5, [r0, 0x8]
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _080EA018 @ =gMultiuseSpriteTemplate
	ldr r2, _080EA01C @ =gTrainerBackPicCoords
	ldr r1, [r4]
	ldrb r1, [r1, 0x8]
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r2, _080EA020 @ =gBattlerSpriteIds
	ldrb r1, [r6]
	b _080EA060
	.align 2, 0
_080EA00C: .4byte gBattleTypeFlags
_080EA010: .4byte gSaveBlock2Ptr
_080EA014: .4byte gActiveBattler
_080EA018: .4byte gMultiuseSpriteTemplate
_080EA01C: .4byte gTrainerBackPicCoords
_080EA020: .4byte gBattlerSpriteIds
_080EA024:
	ldr r4, _080EA0D0 @ =gActiveBattler
	ldrb r1, [r4]
	movs r0, 0x5
	bl DecompressTrainerBackPalette
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _080EA0D4 @ =gMultiuseSpriteTemplate
	ldr r1, _080EA0D8 @ =gTrainerBackPicCoords
	ldrb r1, [r1, 0x14]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r2, _080EA0DC @ =gBattlerSpriteIds
	ldrb r1, [r4]
_080EA060:
	adds r1, r2
	strb r0, [r1]
	ldr r4, _080EA0E0 @ =gSprites
	ldr r5, _080EA0DC @ =gBattlerSpriteIds
	ldr r6, _080EA0D0 @ =gActiveBattler
	ldrb r3, [r6]
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080EA0E4 @ =0x0000ffa0
	strh r1, [r0, 0x24]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080EA0E8 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _080EA0EC @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA0F0 @ =CompleteOnBattlerSpriteCallbackDummy2_tmp
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA0D0: .4byte gActiveBattler
_080EA0D4: .4byte gMultiuseSpriteTemplate
_080EA0D8: .4byte gTrainerBackPicCoords
_080EA0DC: .4byte gBattlerSpriteIds
_080EA0E0: .4byte gSprites
_080EA0E4: .4byte 0x0000ffa0
_080EA0E8: .4byte sub_8033EEC
_080EA0EC: .4byte gBattlerControllerFuncs
_080EA0F0: .4byte CompleteOnBattlerSpriteCallbackDummy2_tmp
	thumb_func_end OakOldManHandleTrainerSlide

	thumb_func_start OakOldManHandleTrainerSlideBack
OakOldManHandleTrainerSlideBack: @ 80EA0F4
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleTrainerSlideBack

	thumb_func_start OakOldManHandleFaintAnimation
OakOldManHandleFaintAnimation: @ 80EA100
	push {r4-r6,lr}
	ldr r6, _080EA14C @ =gBattleSpritesDataPtr
	ldr r4, [r6]
	ldr r5, _080EA150 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r0, [r4, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _080EA154
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080EA134
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_080EA134:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	adds r1, 0x1
	strb r1, [r0, 0x4]
	b _080EA1CA
	.align 2, 0
_080EA14C: .4byte gBattleSpritesDataPtr
_080EA150: .4byte gActiveBattler
_080EA154:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080EA1CA
	strb r4, [r3, 0x4]
	ldr r2, _080EA1D0 @ =gBattlerPartyIndexes
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _080EA1D4 @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	movs r1, 0x40
	negs r1, r1
	movs r0, 0x10
	bl PlaySE12WithPanning
	ldr r2, _080EA1D8 @ =gSprites
	ldr r3, _080EA1DC @ =gBattlerSpriteIds
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x30]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x32]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080EA1E0 @ =sub_8012110
	str r1, [r0]
	ldr r1, _080EA1E4 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA1E8 @ =sub_80E82F4
	str r1, [r0]
_080EA1CA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA1D0: .4byte gBattlerPartyIndexes
_080EA1D4: .4byte gPlayerParty
_080EA1D8: .4byte gSprites
_080EA1DC: .4byte gBattlerSpriteIds
_080EA1E0: .4byte sub_8012110
_080EA1E4: .4byte gBattlerControllerFuncs
_080EA1E8: .4byte sub_80E82F4
	thumb_func_end OakOldManHandleFaintAnimation

	thumb_func_start OakOldManHandlePaletteFade
OakOldManHandlePaletteFade: @ 80EA1EC
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandlePaletteFade

	thumb_func_start OakOldManHandleSuccessBallThrowAnim
OakOldManHandleSuccessBallThrowAnim: @ 80EA1F8
	push {r4,r5,lr}
	ldr r0, _080EA238 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0x8]
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _080EA23C @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _080EA240 @ =gActiveBattler
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl InitAndLaunchSpecialAnimation
	ldr r1, _080EA244 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA248 @ =CompleteOnSpecialAnimDone_tmp
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA238: .4byte gBattleSpritesDataPtr
_080EA23C: .4byte gDoingBattleAnim
_080EA240: .4byte gActiveBattler
_080EA244: .4byte gBattlerControllerFuncs
_080EA248: .4byte CompleteOnSpecialAnimDone_tmp
	thumb_func_end OakOldManHandleSuccessBallThrowAnim

	thumb_func_start OakOldManHandleBallThrowAnim
OakOldManHandleBallThrowAnim: @ 80EA24C
	push {r4,r5,lr}
	ldr r1, _080EA294 @ =gBattleBufferA
	ldr r5, _080EA298 @ =gActiveBattler
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _080EA29C @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	strb r1, [r0, 0x8]
	ldr r1, _080EA2A0 @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl InitAndLaunchSpecialAnimation
	ldr r1, _080EA2A4 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA2A8 @ =CompleteOnSpecialAnimDone_tmp
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA294: .4byte gBattleBufferA
_080EA298: .4byte gActiveBattler
_080EA29C: .4byte gBattleSpritesDataPtr
_080EA2A0: .4byte gDoingBattleAnim
_080EA2A4: .4byte gBattlerControllerFuncs
_080EA2A8: .4byte CompleteOnSpecialAnimDone_tmp
	thumb_func_end OakOldManHandleBallThrowAnim

	thumb_func_start OakOldManHandlePause
OakOldManHandlePause: @ 80EA2AC
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandlePause

	thumb_func_start OakOldManHandleMoveAnimation
OakOldManHandleMoveAnimation: @ 80EA2B8
	push {r4-r6,lr}
	ldr r0, _080EA38C @ =gBattleBufferA
	mov r12, r0
	ldr r6, _080EA390 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _080EA394 @ =gAnimMoveTurn
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _080EA398 @ =gAnimMovePower
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _080EA39C @ =gAnimMoveDmg
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _080EA3A0 @ =gAnimFriendship
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _080EA3A4 @ =gWeatherMoveAnim
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _080EA3A8 @ =gAnimDisableStructPtr
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _080EA3AC @ =gTransformedPersonalities
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl IsMoveWithoutAnimation
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080EA3B0
	bl OakOldManBufferExecCompleted
	b _080EA3CE
	.align 2, 0
_080EA38C: .4byte gBattleBufferA
_080EA390: .4byte gActiveBattler
_080EA394: .4byte gAnimMoveTurn
_080EA398: .4byte gAnimMovePower
_080EA39C: .4byte gAnimMoveDmg
_080EA3A0: .4byte gAnimFriendship
_080EA3A4: .4byte gWeatherMoveAnim
_080EA3A8: .4byte gAnimDisableStructPtr
_080EA3AC: .4byte gTransformedPersonalities
_080EA3B0:
	ldr r0, _080EA3D4 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x4]
	ldr r1, _080EA3D8 @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA3DC @ =OakOldManDoMoveAnimation
	str r1, [r0]
_080EA3CE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA3D4: .4byte gBattleSpritesDataPtr
_080EA3D8: .4byte gBattlerControllerFuncs
_080EA3DC: .4byte OakOldManDoMoveAnimation
	thumb_func_end OakOldManHandleMoveAnimation

	thumb_func_start OakOldManDoMoveAnimation
OakOldManDoMoveAnimation: @ 80EA3E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _080EA424 @ =gBattleBufferA
	ldr r6, _080EA428 @ =gActiveBattler
	ldrb r3, [r6]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r9, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r2, 0x2
	mov r8, r2
	add r1, r8
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	ldr r7, _080EA42C @ =gBattleSpritesDataPtr
	ldr r5, [r7]
	ldr r1, [r5, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _080EA46A
	cmp r2, 0x1
	bgt _080EA430
	cmp r2, 0
	beq _080EA43A
	b _080EA520
	.align 2, 0
_080EA424: .4byte gBattleBufferA
_080EA428: .4byte gActiveBattler
_080EA42C: .4byte gBattleSpritesDataPtr
_080EA430:
	cmp r2, 0x2
	beq _080EA494
	cmp r2, 0x3
	beq _080EA4E4
	b _080EA520
_080EA43A:
	ldr r1, [r5]
	lsls r0, r3, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080EA456
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_080EA456:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _080EA520
_080EA46A:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080EA520
	movs r0, 0
	bl sub_8035450
	adds r0, r4, 0
	bl DoMoveAnim
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0, 0x4]
	b _080EA520
_080EA494:
	ldr r0, _080EA4DC @ =gAnimScriptCallback
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _080EA4E0 @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EA520
	movs r0, 0x1
	bl sub_8035450
	ldr r0, [r7]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080EA4C8
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl InitAndLaunchSpecialAnimation
_080EA4C8:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _080EA520
	.align 2, 0
_080EA4DC: .4byte gAnimScriptCallback
_080EA4E0: .4byte gAnimScriptActive
_080EA4E4:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080EA520
	bl CopyAllBattleSpritesInvisibilities
	ldrb r0, [r6]
	lsls r2, r0, 9
	mov r3, r9
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r8
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl TrySetBehindSubstituteSpriteBit
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r4, [r0, 0x4]
	bl OakOldManBufferExecCompleted
_080EA520:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end OakOldManDoMoveAnimation

	thumb_func_start OakOldManHandlePrintString
OakOldManHandlePrintString: @ 80EA52C
	push {r4,lr}
	ldr r0, _080EA55C @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080EA560 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r0, _080EA564 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	ldr r1, _080EA568 @ =(gBattleBufferA + 2)
	adds r4, r0, r1
	ldr r0, _080EA56C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _080EA570
	ldrh r0, [r4]
	cmp r0, 0x1
	bne _080EA570
	bl OakOldManBufferExecCompleted
	b _080EA65A
	.align 2, 0
_080EA55C: .4byte gBattle_BG0_X
_080EA560: .4byte gBattle_BG0_Y
_080EA564: .4byte gActiveBattler
_080EA568: .4byte (gBattleBufferA + 2)
_080EA56C: .4byte gBattleTypeFlags
_080EA570:
	ldrh r0, [r4]
	bl BufferStringBattle
	ldrh r0, [r4]
	bl sub_80D89B0
	lsls r0, 24
	cmp r0, 0
	beq _080EA590
	ldr r0, _080EA58C @ =gDisplayedStringBattle
	movs r1, 0x40
	bl BattlePutTextOnWindow
	b _080EA598
	.align 2, 0
_080EA58C: .4byte gDisplayedStringBattle
_080EA590:
	ldr r0, _080EA5B4 @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
_080EA598:
	ldr r0, _080EA5B8 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA64C
	ldrh r1, [r4]
	cmp r1, 0xD8
	beq _080EA5CC
	cmp r1, 0xD8
	bgt _080EA5BC
	cmp r1, 0x1E
	beq _080EA5F8
	b _080EA64C
	.align 2, 0
_080EA5B4: .4byte gDisplayedStringBattle
_080EA5B8: .4byte gBattleTypeFlags
_080EA5BC:
	cmp r1, 0xE3
	beq _080EA630
	ldr r0, _080EA5C8 @ =0x0000017f
	cmp r1, r0
	beq _080EA614
	b _080EA64C
	.align 2, 0
_080EA5C8: .4byte 0x0000017f
_080EA5CC:
	movs r0, 0x2
	bl sub_80EB2E0
	lsls r0, 24
	cmp r0, 0
	bne _080EA64C
	movs r0, 0x2
	bl sub_80EB2F4
	ldr r1, _080EA5EC @ =gBattlerControllerFuncs
	ldr r0, _080EA5F0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA5F4 @ =sub_80E8584
	b _080EA658
	.align 2, 0
_080EA5EC: .4byte gBattlerControllerFuncs
_080EA5F0: .4byte gActiveBattler
_080EA5F4: .4byte sub_80E8584
_080EA5F8:
	ldr r1, _080EA608 @ =gBattlerControllerFuncs
	ldr r0, _080EA60C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA610 @ =sub_80E85AC
	b _080EA658
	.align 2, 0
_080EA608: .4byte gBattlerControllerFuncs
_080EA60C: .4byte gActiveBattler
_080EA610: .4byte sub_80E85AC
_080EA614:
	ldr r1, _080EA624 @ =gBattlerControllerFuncs
	ldr r0, _080EA628 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA62C @ =sub_80E85C0
	b _080EA658
	.align 2, 0
_080EA624: .4byte gBattlerControllerFuncs
_080EA628: .4byte gActiveBattler
_080EA62C: .4byte sub_80E85C0
_080EA630:
	ldr r1, _080EA640 @ =gBattlerControllerFuncs
	ldr r0, _080EA644 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA648 @ =sub_80E8598
	b _080EA658
	.align 2, 0
_080EA640: .4byte gBattlerControllerFuncs
_080EA644: .4byte gActiveBattler
_080EA648: .4byte sub_80E8598
_080EA64C:
	ldr r1, _080EA660 @ =gBattlerControllerFuncs
	ldr r0, _080EA664 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA668 @ =CompleteOnInactiveTextPrinter_tmp
_080EA658:
	str r1, [r0]
_080EA65A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EA660: .4byte gBattlerControllerFuncs
_080EA664: .4byte gActiveBattler
_080EA668: .4byte CompleteOnInactiveTextPrinter_tmp
	thumb_func_end OakOldManHandlePrintString

	thumb_func_start OakOldManHandlePrintSelectionString
OakOldManHandlePrintSelectionString: @ 80EA66C
	push {lr}
	ldr r0, _080EA684 @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080EA688
	bl OakOldManHandlePrintString
	b _080EA68C
	.align 2, 0
_080EA684: .4byte gActiveBattler
_080EA688:
	bl OakOldManBufferExecCompleted
_080EA68C:
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandlePrintSelectionString

	thumb_func_start sub_80EA690
sub_80EA690: @ 80EA690
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080EA6EA
	ldr r0, _080EA6C4 @ =gBattle_BG0_X
	strh r1, [r0]
	ldr r1, _080EA6C8 @ =gBattle_BG0_Y
	movs r0, 0xA0
	strh r0, [r1]
	ldr r0, _080EA6CC @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA6DC
	ldr r1, _080EA6D0 @ =gBattlerControllerFuncs
	ldr r0, _080EA6D4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA6D8 @ =HandleInputChooseAction_tmp
	b _080EA6E8
	.align 2, 0
_080EA6C4: .4byte gBattle_BG0_X
_080EA6C8: .4byte gBattle_BG0_Y
_080EA6CC: .4byte gBattleTypeFlags
_080EA6D0: .4byte gBattlerControllerFuncs
_080EA6D4: .4byte gActiveBattler
_080EA6D8: .4byte HandleInputChooseAction_tmp
_080EA6DC:
	ldr r1, _080EA6F0 @ =gBattlerControllerFuncs
	ldr r0, _080EA6F4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA6F8 @ =sub_80E7844
_080EA6E8:
	str r1, [r0]
_080EA6EA:
	pop {r0}
	bx r0
	.align 2, 0
_080EA6F0: .4byte gBattlerControllerFuncs
_080EA6F4: .4byte gActiveBattler
_080EA6F8: .4byte sub_80E7844
	thumb_func_end sub_80EA690

	thumb_func_start OakOldManHandleChooseAction
OakOldManHandleChooseAction: @ 80EA6FC
	push {r4,lr}
	ldr r1, _080EA750 @ =gBattlerControllerFuncs
	ldr r0, _080EA754 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA758 @ =sub_80EA690
	str r1, [r0]
	ldr r0, _080EA75C @ =gUnknown_83FDA4C
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _080EA760 @ =gUnknown_83FE725
	movs r1, 0x2
	bl BattlePutTextOnWindow
	movs r4, 0
_080EA71E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl ActionSelectionDestroyCursorAt
	adds r4, 0x1
	cmp r4, 0x3
	ble _080EA71E
	ldr r1, _080EA764 @ =gActionSelectionCursor
	ldr r0, _080EA754 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
	ldr r0, _080EA768 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA770
	ldr r0, _080EA76C @ =gText_WhatWillPkmnDo
	bl BattleStringExpandPlaceholdersToDisplayedString
	b _080EA776
	.align 2, 0
_080EA750: .4byte gBattlerControllerFuncs
_080EA754: .4byte gActiveBattler
_080EA758: .4byte sub_80EA690
_080EA75C: .4byte gUnknown_83FDA4C
_080EA760: .4byte gUnknown_83FE725
_080EA764: .4byte gActionSelectionCursor
_080EA768: .4byte gBattleTypeFlags
_080EA76C: .4byte gText_WhatWillPkmnDo
_080EA770:
	ldr r0, _080EA784 @ =gUnknown_83FE6FA
	bl BattleStringExpandPlaceholdersToDisplayedString
_080EA776:
	ldr r0, _080EA788 @ =gDisplayedStringBattle
	movs r1, 0x1
	bl BattlePutTextOnWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EA784: .4byte gUnknown_83FE6FA
_080EA788: .4byte gDisplayedStringBattle
	thumb_func_end OakOldManHandleChooseAction

	thumb_func_start OakOldManHandleUnknownYesNoBox
OakOldManHandleUnknownYesNoBox: @ 80EA78C
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleUnknownYesNoBox

	thumb_func_start sub_80EA798
sub_80EA798: @ 80EA798
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080EA7C2
	ldr r0, _080EA7C8 @ =gBattle_BG0_X
	strh r1, [r0]
	ldr r1, _080EA7CC @ =gBattle_BG0_Y
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080EA7D0 @ =gBattlerControllerFuncs
	ldr r0, _080EA7D4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA7D8 @ =sub_80E7988
	str r1, [r0]
_080EA7C2:
	pop {r0}
	bx r0
	.align 2, 0
_080EA7C8: .4byte gBattle_BG0_X
_080EA7CC: .4byte gBattle_BG0_Y
_080EA7D0: .4byte gBattlerControllerFuncs
_080EA7D4: .4byte gActiveBattler
_080EA7D8: .4byte sub_80E7988
	thumb_func_end sub_80EA798

	thumb_func_start OakOldManHandleChooseMove
OakOldManHandleChooseMove: @ 80EA7DC
	push {r4,lr}
	ldr r0, _080EA800 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EA810
	bl InitMoveSelectionsVarsAndStrings
	ldr r1, _080EA804 @ =gBattlerControllerFuncs
	ldr r0, _080EA808 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA80C @ =sub_80EA798
	str r1, [r0]
	b _080EA866
	.align 2, 0
_080EA800: .4byte gBattleTypeFlags
_080EA804: .4byte gBattlerControllerFuncs
_080EA808: .4byte gActiveBattler
_080EA80C: .4byte sub_80EA798
_080EA810:
	ldr r4, _080EA824 @ =gBattleStruct
	ldr r0, [r4]
	adds r0, 0x95
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EA828
	cmp r0, 0x1
	beq _080EA83E
	b _080EA866
	.align 2, 0
_080EA824: .4byte gBattleStruct
_080EA828:
	bl InitMoveSelectionsVarsAndStrings
	ldr r1, [r4]
	adds r1, 0x95
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x97
	movs r1, 0x50
	strb r1, [r0]
_080EA83E:
	ldr r0, _080EA86C @ =gBattleStruct
	ldr r1, [r0]
	adds r1, 0x97
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080EA866
	movs r0, 0x5
	bl PlaySE
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x1
	movs r1, 0xA
	bl BtlController_EmitTwoReturnValues
	bl OakOldManBufferExecCompleted
_080EA866:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EA86C: .4byte gBattleStruct
	thumb_func_end OakOldManHandleChooseMove

	thumb_func_start OakOldManHandleChooseItem
OakOldManHandleChooseItem: @ 80EA870
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080EA8BC @ =gBattlerControllerFuncs
	ldr r2, _080EA8C0 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA8C4 @ =OpenBagAndChooseItem_tmp
	str r1, [r0]
	ldr r1, _080EA8C8 @ =gBattlerInMenuId
	ldrb r0, [r2]
	strb r0, [r1]
	movs r3, 0
	ldr r5, _080EA8CC @ =gUnknown_203B0DC
	ldr r4, _080EA8D0 @ =gBattleBufferA
_080EA89E:
	adds r0, r3, r5
	ldrb r1, [r2]
	lsls r1, 9
	adds r1, 0x1
	adds r1, r3, r1
	adds r1, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x2
	ble _080EA89E
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA8BC: .4byte gBattlerControllerFuncs
_080EA8C0: .4byte gActiveBattler
_080EA8C4: .4byte OpenBagAndChooseItem_tmp
_080EA8C8: .4byte gBattlerInMenuId
_080EA8CC: .4byte gUnknown_203B0DC
_080EA8D0: .4byte gBattleBufferA
	thumb_func_end OakOldManHandleChooseItem

	thumb_func_start OakOldManHandleChoosePokemon
OakOldManHandleChoosePokemon: @ 80EA8D4
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080EA984 @ =TaskDummy
	movs r1, 0xFF
	bl CreateTask
	ldr r3, _080EA988 @ =gUnknown_3004FFC
	ldr r4, _080EA98C @ =gActiveBattler
	ldrb r1, [r4]
	adds r1, r3
	strb r0, [r1]
	ldr r5, _080EA990 @ =gTasks
	ldrb r2, [r4]
	adds r3, r2, r3
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldr r5, _080EA994 @ =gBattleBufferA
	lsls r2, 9
	adds r6, r5, 0x1
	adds r2, r6
	ldrb r2, [r2]
	movs r0, 0xF
	ands r0, r2
	strh r0, [r1, 0x8]
	ldr r3, _080EA998 @ =gBattleStruct
	ldr r1, [r3]
	adds r1, 0x49
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r6
	ldrb r0, [r0]
	lsrs r0, 4
	strb r0, [r1]
	ldr r2, [r3]
	adds r2, 0x8B
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, r5, 0x2
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, 0xAC
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, r5, 0x3
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r2, 0
	ldr r3, _080EA99C @ =gUnknown_203B0DC
_080EA940:
	adds r0, r2, r3
	ldrb r1, [r4]
	lsls r1, 9
	adds r1, 0x4
	adds r1, r2, r1
	adds r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _080EA940
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080EA9A0 @ =gBattlerControllerFuncs
	ldr r2, _080EA98C @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EA9A4 @ =OpenPartyMenuToChooseMon_tmp
	str r1, [r0]
	ldr r1, _080EA9A8 @ =gBattlerInMenuId
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA984: .4byte TaskDummy
_080EA988: .4byte gUnknown_3004FFC
_080EA98C: .4byte gActiveBattler
_080EA990: .4byte gTasks
_080EA994: .4byte gBattleBufferA
_080EA998: .4byte gBattleStruct
_080EA99C: .4byte gUnknown_203B0DC
_080EA9A0: .4byte gBattlerControllerFuncs
_080EA9A4: .4byte OpenPartyMenuToChooseMon_tmp
_080EA9A8: .4byte gBattlerInMenuId
	thumb_func_end OakOldManHandleChoosePokemon

	thumb_func_start OakOldManHandleCmd23
OakOldManHandleCmd23: @ 80EA9AC
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleCmd23

	thumb_func_start OakOldManHandleHealthBarUpdate
OakOldManHandleHealthBarUpdate: @ 80EA9B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl LoadBattleBarGfx
	ldr r3, _080EAA30 @ =gBattleBufferA
	ldr r0, _080EAA34 @ =gActiveBattler
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _080EAA38 @ =0x00007fff
	cmp r7, r0
	beq _080EAA48
	ldr r6, _080EAA3C @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080EAA40 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _080EAA44 @ =gHealthboxSpriteIds
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _080EAA82
	.align 2, 0
_080EAA30: .4byte gBattleBufferA
_080EAA34: .4byte gActiveBattler
_080EAA38: .4byte 0x00007fff
_080EAA3C: .4byte gBattlerPartyIndexes
_080EAA40: .4byte gPlayerParty
_080EAA44: .4byte gHealthboxSpriteIds
_080EAA48:
	ldr r1, _080EAAA0 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080EAAA4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r4, _080EAAA8 @ =gHealthboxSpriteIds
	adds r1, r0, r4
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl SetBattleBarStruct
	mov r1, r9
	ldrb r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0
	bl UpdateHpTextInHealthbox
_080EAA82:
	ldr r1, _080EAAAC @ =gBattlerControllerFuncs
	ldr r0, _080EAAB0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EAAB4 @ =CompleteOnHealthbarDone_tmp
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAAA0: .4byte gBattlerPartyIndexes
_080EAAA4: .4byte gPlayerParty
_080EAAA8: .4byte gHealthboxSpriteIds
_080EAAAC: .4byte gBattlerControllerFuncs
_080EAAB0: .4byte gActiveBattler
_080EAAB4: .4byte CompleteOnHealthbarDone_tmp
	thumb_func_end OakOldManHandleHealthBarUpdate

	thumb_func_start OakOldManHandleExpUpdate
OakOldManHandleExpUpdate: @ 80EAAB8
	push {r4-r7,lr}
	ldr r5, _080EAAE4 @ =gBattleBufferA
	ldr r6, _080EAAE8 @ =gActiveBattler
	ldrb r0, [r6]
	lsls r0, 9
	adds r1, r5, 0x1
	adds r0, r1
	ldrb r7, [r0]
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080EAAEC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x63
	bls _080EAAF0
	bl OakOldManBufferExecCompleted
	b _080EAB3C
	.align 2, 0
_080EAAE4: .4byte gBattleBufferA
_080EAAE8: .4byte gActiveBattler
_080EAAEC: .4byte gPlayerParty
_080EAAF0:
	movs r0, 0x1
	bl LoadBattleBarGfx
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldrb r1, [r6]
	lsls r1, 9
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r5, 0x3
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	ldr r0, _080EAB44 @ =Task_GiveExpToMon_tmp
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EAB48 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r7, [r1, 0x8]
	strh r4, [r1, 0xA]
	ldrb r0, [r6]
	strh r0, [r1, 0xC]
	ldr r1, _080EAB4C @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EAB50 @ =nullsub_81
	str r1, [r0]
_080EAB3C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAB44: .4byte Task_GiveExpToMon_tmp
_080EAB48: .4byte gTasks
_080EAB4C: .4byte gBattlerControllerFuncs
_080EAB50: .4byte nullsub_81
	thumb_func_end OakOldManHandleExpUpdate

	thumb_func_start OakOldManHandleStatusIconUpdate
OakOldManHandleStatusIconUpdate: @ 80EAB54
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleStatusIconUpdate

	thumb_func_start OakOldManHandleStatusAnimation
OakOldManHandleStatusAnimation: @ 80EAB60
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleStatusAnimation

	thumb_func_start OakOldManHandleStatusXor
OakOldManHandleStatusXor: @ 80EAB6C
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleStatusXor

	thumb_func_start OakOldManHandleDataTransfer
OakOldManHandleDataTransfer: @ 80EAB78
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleDataTransfer

	thumb_func_start OakOldManHandleDMA3Transfer
OakOldManHandleDMA3Transfer: @ 80EAB84
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleDMA3Transfer

	thumb_func_start OakOldManHandlePlayBGM
OakOldManHandlePlayBGM: @ 80EAB90
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandlePlayBGM

	thumb_func_start OakOldManHandleCmd32
OakOldManHandleCmd32: @ 80EAB9C
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleCmd32

	thumb_func_start OakOldManHandleTwoReturnValues
OakOldManHandleTwoReturnValues: @ 80EABA8
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleTwoReturnValues

	thumb_func_start OakOldManHandleChosenMonReturnValue
OakOldManHandleChosenMonReturnValue: @ 80EABB4
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleChosenMonReturnValue

	thumb_func_start OakOldManHandleOneReturnValue
OakOldManHandleOneReturnValue: @ 80EABC0
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleOneReturnValue

	thumb_func_start OakOldManHandleOneReturnValue_Duplicate
OakOldManHandleOneReturnValue_Duplicate: @ 80EABCC
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleOneReturnValue_Duplicate

	thumb_func_start OakOldManHandleCmd37
OakOldManHandleCmd37: @ 80EABD8
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleCmd37

	thumb_func_start OakOldManHandleCmd38
OakOldManHandleCmd38: @ 80EABE4
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleCmd38

	thumb_func_start OakOldManHandleCmd39
OakOldManHandleCmd39: @ 80EABF0
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleCmd39

	thumb_func_start OakOldManHandleCmd40
OakOldManHandleCmd40: @ 80EABFC
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleCmd40

	thumb_func_start OakOldManHandleHitAnimation
OakOldManHandleHitAnimation: @ 80EAC08
	push {r4,lr}
	ldr r3, _080EAC30 @ =gSprites
	ldr r2, _080EAC34 @ =gBattlerSpriteIds
	ldr r4, _080EAC38 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _080EAC3C
	bl OakOldManBufferExecCompleted
	b _080EAC66
	.align 2, 0
_080EAC30: .4byte gSprites
_080EAC34: .4byte gBattlerSpriteIds
_080EAC38: .4byte gActiveBattler
_080EAC3C:
	ldr r1, _080EAC6C @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl DoHitAnimHealthboxEffect
	ldr r1, _080EAC70 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EAC74 @ =DoHitAnimBlinkSpriteEffect_tmp
	str r1, [r0]
_080EAC66:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EAC6C: .4byte gDoingBattleAnim
_080EAC70: .4byte gBattlerControllerFuncs
_080EAC74: .4byte DoHitAnimBlinkSpriteEffect_tmp
	thumb_func_end OakOldManHandleHitAnimation

	thumb_func_start OakOldManHandleCmd42
OakOldManHandleCmd42: @ 80EAC78
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleCmd42

	thumb_func_start OakOldManHandlePlaySE
OakOldManHandlePlaySE: @ 80EAC84
	push {lr}
	ldr r2, _080EACAC @ =gBattleBufferA
	ldr r0, _080EACB0 @ =gActiveBattler
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlaySE
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080EACAC: .4byte gBattleBufferA
_080EACB0: .4byte gActiveBattler
	thumb_func_end OakOldManHandlePlaySE

	thumb_func_start OakOldManHandlePlayFanfare
OakOldManHandlePlayFanfare: @ 80EACB4
	push {lr}
	ldr r2, _080EACDC @ =gBattleBufferA
	ldr r0, _080EACE0 @ =gActiveBattler
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080EACDC: .4byte gBattleBufferA
_080EACE0: .4byte gActiveBattler
	thumb_func_end OakOldManHandlePlayFanfare

	thumb_func_start OakOldManHandleFaintingCry
OakOldManHandleFaintingCry: @ 80EACE4
	push {lr}
	ldr r1, _080EAD14 @ =gBattlerPartyIndexes
	ldr r0, _080EAD18 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080EAD1C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080EAD14: .4byte gBattlerPartyIndexes
_080EAD18: .4byte gActiveBattler
_080EAD1C: .4byte gPlayerParty
	thumb_func_end OakOldManHandleFaintingCry

	thumb_func_start OakOldManHandleIntroSlide
OakOldManHandleIntroSlide: @ 80EAD20
	push {lr}
	ldr r1, _080EAD48 @ =gBattleBufferA
	ldr r0, _080EAD4C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _080EAD50 @ =gIntroSlideFlags
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080EAD48: .4byte gBattleBufferA
_080EAD4C: .4byte gActiveBattler
_080EAD50: .4byte gIntroSlideFlags
	thumb_func_end OakOldManHandleIntroSlide

	thumb_func_start OakOldManHandleIntroTrainerBallThrow
OakOldManHandleIntroTrainerBallThrow: @ 80EAD54
	push {r4-r7,lr}
	ldr r0, _080EAEA0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080EAD64
	b _080EAEE4
_080EAD64:
	ldr r6, _080EAEA4 @ =gBattlerSpriteIds
	ldr r7, _080EAEA8 @ =gActiveBattler
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080EAEAC @ =gSprites
	adds r0, r5
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080EAEB0 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080EAEB4 @ =StartAnimLinearTranslation
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080EAEB8 @ =sub_80335F8
	bl StoreSpriteCallbackInData6
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080EAEBC @ =0x0000d6f8
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	ldr r1, _080EAEC0 @ =gTrainerBackPicPaletteTable
	ldr r0, _080EAEC4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	lsrs r4, 20
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _080EAEC8 @ =sub_80EB0A8
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080EAECC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldr r3, _080EAED0 @ =gBattleSpritesDataPtr
	ldr r0, [r3]
	ldrb r2, [r7]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EAE84
	ldr r0, _080EAED4 @ =gBattlerStatusSummaryTaskId
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _080EAED8 @ =Task_HidePartyStatusSummary
	str r1, [r0]
_080EAE84:
	ldr r0, [r3]
	ldr r2, [r0, 0x8]
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _080EAEDC @ =gBattlerControllerFuncs
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EAEE0 @ =nullsub_13
	str r1, [r0]
	b _080EAF18
	.align 2, 0
_080EAEA0: .4byte gBattleTypeFlags
_080EAEA4: .4byte gBattlerSpriteIds
_080EAEA8: .4byte gActiveBattler
_080EAEAC: .4byte gSprites
_080EAEB0: .4byte 0x0000ffd8
_080EAEB4: .4byte StartAnimLinearTranslation
_080EAEB8: .4byte sub_80335F8
_080EAEBC: .4byte 0x0000d6f8
_080EAEC0: .4byte gTrainerBackPicPaletteTable
_080EAEC4: .4byte gSaveBlock2Ptr
_080EAEC8: .4byte sub_80EB0A8
_080EAECC: .4byte gTasks
_080EAED0: .4byte gBattleSpritesDataPtr
_080EAED4: .4byte gBattlerStatusSummaryTaskId
_080EAED8: .4byte Task_HidePartyStatusSummary
_080EAEDC: .4byte gBattlerControllerFuncs
_080EAEE0: .4byte nullsub_13
_080EAEE4:
	ldr r0, _080EAF20 @ =gBattleSpritesDataPtr
	ldr r1, [r0]
	ldr r0, _080EAF24 @ =gActiveBattler
	ldrb r3, [r0]
	ldr r1, [r1, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EAF14
	ldr r2, _080EAF28 @ =gTasks
	ldr r0, _080EAF2C @ =gBattlerStatusSummaryTaskId
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080EAF30 @ =Task_HidePartyStatusSummary
	str r1, [r0]
_080EAF14:
	bl OakOldManBufferExecCompleted
_080EAF18:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAF20: .4byte gBattleSpritesDataPtr
_080EAF24: .4byte gActiveBattler
_080EAF28: .4byte gTasks
_080EAF2C: .4byte gBattlerStatusSummaryTaskId
_080EAF30: .4byte Task_HidePartyStatusSummary
	thumb_func_end OakOldManHandleIntroTrainerBallThrow

	thumb_func_start sub_80EAF34
sub_80EAF34: @ 80EAF34
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080EB07C @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	ldr r0, _080EB080 @ =gBattlerPartyIndexes
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _080EB084 @ =gBattleBufferA
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080EB088 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080EB08C @ =sub_8033E3C
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _080EB090 @ =gUnknown_3004FFC
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080EB094 @ =gMultiuseSpriteTemplate
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _080EB098 @ =gBattlerSpriteIds
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _080EB09C @ =gSprites
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _080EB0A0 @ =gBattleMonForms
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080EB0A4 @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl DoPokeballSendOutAnimation
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB07C: .4byte gBattleSpritesDataPtr
_080EB080: .4byte gBattlerPartyIndexes
_080EB084: .4byte gBattleBufferA
_080EB088: .4byte gPlayerParty
_080EB08C: .4byte sub_8033E3C
_080EB090: .4byte gUnknown_3004FFC
_080EB094: .4byte gMultiuseSpriteTemplate
_080EB098: .4byte gBattlerSpriteIds
_080EB09C: .4byte gSprites
_080EB0A0: .4byte gBattleMonForms
_080EB0A4: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EAF34

	thumb_func_start sub_80EB0A8
sub_80EB0A8: @ 80EB0A8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080EB0C8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x1E
	bgt _080EB0CC
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _080EB102
	.align 2, 0
_080EB0C8: .4byte gTasks
_080EB0CC:
	ldr r4, _080EB108 @ =gActiveBattler
	ldrb r5, [r4]
	ldrh r0, [r1, 0x8]
	strb r0, [r4]
	ldr r0, _080EB10C @ =gBattleBufferA
	ldrb r1, [r4]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _080EB110 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_80EAF34
	ldr r1, _080EB114 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080EB118 @ =sub_80E7B4C
	str r1, [r0]
	strb r5, [r4]
	adds r0, r6, 0
	bl DestroyTask
_080EB102:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB108: .4byte gActiveBattler
_080EB10C: .4byte gBattleBufferA
_080EB110: .4byte gBattlerPartyIndexes
_080EB114: .4byte gBattlerControllerFuncs
_080EB118: .4byte sub_80E7B4C
	thumb_func_end sub_80EB0A8

	thumb_func_start OakOldManHandleDrawPartyStatusSummary
OakOldManHandleDrawPartyStatusSummary: @ 80EB11C
	push {r4,r5,lr}
	ldr r1, _080EB144 @ =gBattleBufferA
	ldr r0, _080EB148 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EB14C
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080EB14C
	bl OakOldManBufferExecCompleted
	b _080EB18A
	.align 2, 0
_080EB144: .4byte gBattleBufferA
_080EB148: .4byte gActiveBattler
_080EB14C:
	ldr r0, _080EB190 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r5, _080EB194 @ =gActiveBattler
	ldrb r1, [r5]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r4, r0, 9
	ldr r3, _080EB198 @ =(gBattleBufferA + 4)
	adds r1, r4, r3
	subs r2, r3, 0x3
	adds r2, r4, r2
	ldrb r2, [r2]
	subs r3, 0x2
	adds r4, r3
	ldrb r3, [r4]
	bl CreatePartyStatusSummarySprites
	ldr r2, _080EB19C @ =gBattlerStatusSummaryTaskId
	ldrb r1, [r5]
	adds r1, r2
	strb r0, [r1]
	bl OakOldManBufferExecCompleted
_080EB18A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EB190: .4byte gBattleSpritesDataPtr
_080EB194: .4byte gActiveBattler
_080EB198: .4byte (gBattleBufferA + 4)
_080EB19C: .4byte gBattlerStatusSummaryTaskId
	thumb_func_end OakOldManHandleDrawPartyStatusSummary

	thumb_func_start OakOldManHandleHidePartyStatusSummary
OakOldManHandleHidePartyStatusSummary: @ 80EB1A0
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleHidePartyStatusSummary

	thumb_func_start OakOldManHandleEndBounceEffect
OakOldManHandleEndBounceEffect: @ 80EB1AC
	push {r4,lr}
	ldr r4, _080EB1CC @ =gActiveBattler
	ldrb r0, [r4]
	movs r1, 0x1
	bl EndBounceEffect
	ldrb r0, [r4]
	movs r1, 0
	bl EndBounceEffect
	bl OakOldManBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB1CC: .4byte gActiveBattler
	thumb_func_end OakOldManHandleEndBounceEffect

	thumb_func_start OakOldManHandleSpriteInvisibility
OakOldManHandleSpriteInvisibility: @ 80EB1D0
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleSpriteInvisibility

	thumb_func_start OakOldManHandleBattleAnimation
OakOldManHandleBattleAnimation: @ 80EB1DC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _080EB214 @ =gBattleBufferA
	ldr r6, _080EB218 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, 24
	cmp r0, 0
	beq _080EB21C
	bl OakOldManBufferExecCompleted
	b _080EB228
	.align 2, 0
_080EB214: .4byte gBattleBufferA
_080EB218: .4byte gActiveBattler
_080EB21C:
	ldr r0, _080EB230 @ =gBattlerControllerFuncs
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080EB234 @ =CompleteOnFinishedBattleAnimation_tmp
	str r0, [r1]
_080EB228:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB230: .4byte gBattlerControllerFuncs
_080EB234: .4byte CompleteOnFinishedBattleAnimation_tmp
	thumb_func_end OakOldManHandleBattleAnimation

	thumb_func_start OakOldManHandleLinkStandbyMsg
OakOldManHandleLinkStandbyMsg: @ 80EB238
	push {r4,lr}
	ldr r1, _080EB26C @ =gBattleBufferA
	ldr r4, _080EB270 @ =gActiveBattler
	ldrb r2, [r4]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	blt _080EB260
	cmp r0, 0x1
	bgt _080EB260
	adds r0, r2, 0
	movs r1, 0x1
	bl EndBounceEffect
	ldrb r0, [r4]
	movs r1, 0
	bl EndBounceEffect
_080EB260:
	bl OakOldManBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB26C: .4byte gBattleBufferA
_080EB270: .4byte gActiveBattler
	thumb_func_end OakOldManHandleLinkStandbyMsg

	thumb_func_start OakOldManHandleResetActionMoveSelection
OakOldManHandleResetActionMoveSelection: @ 80EB274
	push {lr}
	bl OakOldManBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OakOldManHandleResetActionMoveSelection

	thumb_func_start OakOldManHandleCmd55
OakOldManHandleCmd55: @ 80EB280
	push {r4,lr}
	ldr r2, _080EB2C4 @ =gBattleOutcome
	ldr r1, _080EB2C8 @ =gBattleBufferA
	ldr r4, _080EB2CC @ =gActiveBattler
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl OakOldManBufferExecCompleted
	ldr r0, _080EB2D0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _080EB2BC
	ldr r0, _080EB2D4 @ =gBattlerControllerFuncs
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080EB2D8 @ =sub_80E7930
	str r0, [r1]
_080EB2BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB2C4: .4byte gBattleOutcome
_080EB2C8: .4byte gBattleBufferA
_080EB2CC: .4byte gActiveBattler
_080EB2D0: .4byte gBattleTypeFlags
_080EB2D4: .4byte gBattlerControllerFuncs
_080EB2D8: .4byte sub_80E7930
	thumb_func_end OakOldManHandleCmd55

	thumb_func_start OakOldManCmdEnd
OakOldManCmdEnd: @ 80EB2DC
	bx lr
	thumb_func_end OakOldManCmdEnd

	thumb_func_start sub_80EB2E0
sub_80EB2E0: @ 80EB2E0
	adds r1, r0, 0
	ldr r0, _080EB2F0 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x96
	ldrb r0, [r0]
	ands r0, r1
	bx lr
	.align 2, 0
_080EB2F0: .4byte gBattleStruct
	thumb_func_end sub_80EB2E0

	thumb_func_start sub_80EB2F4
sub_80EB2F4: @ 80EB2F4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080EB308 @ =gBattleStruct
	ldr r1, [r1]
	adds r1, 0x96
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080EB308: .4byte gBattleStruct
	thumb_func_end sub_80EB2F4

	thumb_func_start sub_80EB30C
sub_80EB30C: @ 80EB30C
	push {r4-r6,lr}
	sub sp, 0xC
	movs r6, 0x1A
	movs r5, 0x7
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x30
	movs r2, 0
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x31
	movs r2, 0x1
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r6, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x32
	movs r2, 0x2
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x33
	movs r2, 0x1C
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x34
	movs r2, 0x1D
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x35
	movs r2, 0
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x36
	movs r2, 0x1
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x38
	movs r2, 0x1C
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x39
	movs r2, 0x1D
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3A
	movs r2, 0
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3B
	movs r2, 0x1
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3C
	movs r2, 0x1C
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3D
	movs r2, 0x1D
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	ldr r1, _080EB4F4 @ =0x0000083a
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	ldr r1, _080EB4F8 @ =0x0000083b
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	ldr r1, _080EB4FC @ =0x0000083c
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1C
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	ldr r1, _080EB500 @ =0x0000083d
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1D
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	ldr r1, _080EB504 @ =0x00000835
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0x12
	bl FillBgTilemapBufferRect
	ldr r1, _080EB508 @ =0x00000836
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1
	movs r3, 0x12
	bl FillBgTilemapBufferRect
	ldr r1, _080EB50C @ =0x00000838
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1C
	movs r3, 0x12
	bl FillBgTilemapBufferRect
	ldr r1, _080EB510 @ =0x00000839
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1D
	movs r3, 0x12
	bl FillBgTilemapBufferRect
	movs r1, 0x83
	lsls r1, 4
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	ldr r1, _080EB514 @ =0x00000831
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	ldr r1, _080EB518 @ =0x00000832
	str r6, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x2
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	ldr r1, _080EB51C @ =0x00000833
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1C
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	ldr r1, _080EB520 @ =0x00000834
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB4F4: .4byte 0x0000083a
_080EB4F8: .4byte 0x0000083b
_080EB4FC: .4byte 0x0000083c
_080EB500: .4byte 0x0000083d
_080EB504: .4byte 0x00000835
_080EB508: .4byte 0x00000836
_080EB50C: .4byte 0x00000838
_080EB510: .4byte 0x00000839
_080EB514: .4byte 0x00000831
_080EB518: .4byte 0x00000832
_080EB51C: .4byte 0x00000833
_080EB520: .4byte 0x00000834
	thumb_func_end sub_80EB30C

	thumb_func_start sub_80EB524
sub_80EB524: @ 80EB524
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	movs r5, 0
	movs r0, 0x1A
	mov r8, r0
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	movs r6, 0x4
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x4
	movs r2, 0x1
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x5
	movs r2, 0x2
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x6
	movs r2, 0x1C
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x7
	movs r2, 0x1D
	movs r3, 0xE
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x8
	movs r2, 0
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x9
	movs r2, 0x1
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xB
	movs r2, 0x1C
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xC
	movs r2, 0x1D
	movs r3, 0xF
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xD
	movs r2, 0
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0xF
	movs r2, 0x2
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1C
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x11
	movs r2, 0x1D
	movs r3, 0x13
	bl FillBgTilemapBufferRect
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80EB524

	.align 2, 0 @ Don't pad with nop.
