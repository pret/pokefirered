	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start PokedudeHandleLoadMonSprite
PokedudeHandleLoadMonSprite: @ 81580E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r6, _08158214 @ =gActiveBattler
	ldrb r0, [r6]
	lsls r0, 1
	ldr r1, _08158218 @ =gBattlerPartyIndexes
	adds r0, r1
	ldrh r0, [r0]
	movs r7, 0x64
	muls r0, r7
	ldr r2, _0815821C @ =gEnemyParty
	mov r10, r2
	add r0, r10
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r1, [r6]
	lsls r0, r1, 1
	ldr r2, _08158218 @ =gBattlerPartyIndexes
	adds r0, r2
	ldrh r0, [r0]
	muls r0, r7
	add r0, r10
	bl BattleLoadOpponentMonSpriteGfx
	ldrb r0, [r6]
	bl GetBattlerSpriteDefault_Y
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _08158220 @ =gMultiuseSpriteTemplate
	mov r9, r0
	ldrb r0, [r6]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r9
	adds r1, r4, 0
	adds r2, r5, 0
	bl CreateSprite
	ldr r4, _08158224 @ =gBattlerSpriteIds
	ldrb r1, [r6]
	adds r1, r4
	strb r0, [r1]
	ldr r5, _08158228 @ =gSprites
	ldrb r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0815822C @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08158230 @ =gBattleMonForms
	adds r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldrb r4, [r6]
	lsls r0, r4, 1
	ldr r2, _08158218 @ =gBattlerPartyIndexes
	adds r0, r2
	ldrh r0, [r0]
	muls r0, r7
	add r0, r10
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBattlerShadowSpriteCallback
	ldr r1, _08158234 @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158238 @ =sub_8156184
	str r1, [r0]
	bl PokedudeBufferExecCompleted
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08158214: .4byte gActiveBattler
_08158218: .4byte gBattlerPartyIndexes
_0815821C: .4byte gEnemyParty
_08158220: .4byte gMultiuseSpriteTemplate
_08158224: .4byte gBattlerSpriteIds
_08158228: .4byte gSprites
_0815822C: .4byte 0x0000ff10
_08158230: .4byte gBattleMonForms
_08158234: .4byte gBattlerControllerFuncs
_08158238: .4byte sub_8156184
	thumb_func_end PokedudeHandleLoadMonSprite

	thumb_func_start PokedudeHandleSwitchInAnim
PokedudeHandleSwitchInAnim: @ 815823C
	push {r4,r5,lr}
	ldr r5, _081582A0 @ =gActiveBattler
	ldrb r0, [r5]
	ldr r4, _081582A4 @ =gBattleBufferA
	lsls r1, r0, 9
	adds r2, r4, 0x2
	adds r1, r2
	ldrb r1, [r1]
	bl ClearTemporarySpeciesSpriteData
	ldr r2, _081582A8 @ =gBattlerPartyIndexes
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r2
	lsls r0, 9
	adds r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	movs r4, 0
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081582AC @ =gPlayerParty
	adds r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldr r1, _081582B0 @ =gActionSelectionCursor
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldr r1, _081582B4 @ =gMoveSelectionCursor
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldrb r0, [r5]
	bl sub_8159478
	ldr r1, _081582B8 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081582BC @ =sub_81563A8
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081582A0: .4byte gActiveBattler
_081582A4: .4byte gBattleBufferA
_081582A8: .4byte gBattlerPartyIndexes
_081582AC: .4byte gPlayerParty
_081582B0: .4byte gActionSelectionCursor
_081582B4: .4byte gMoveSelectionCursor
_081582B8: .4byte gBattlerControllerFuncs
_081582BC: .4byte sub_81563A8
	thumb_func_end PokedudeHandleSwitchInAnim

	thumb_func_start PokedudeHandleReturnMonToBall
PokedudeHandleReturnMonToBall: @ 81582C0
	push {r4-r6,lr}
	ldr r0, _081582EC @ =gBattleBufferA
	ldr r6, _081582F0 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _081582FC
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl InitAndLaunchSpecialAnimation
	ldr r0, _081582F4 @ =gBattlerControllerFuncs
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _081582F8 @ =sub_8156F7C
	str r0, [r1]
	b _08158332
	.align 2, 0
_081582EC: .4byte gBattleBufferA
_081582F0: .4byte gActiveBattler
_081582F4: .4byte gBattlerControllerFuncs
_081582F8: .4byte sub_8156F7C
_081582FC:
	ldr r5, _08158338 @ =gBattlerSpriteIds
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0815833C @ =gSprites
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
	ldr r1, _08158340 @ =gHealthboxSpriteIds
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PokedudeBufferExecCompleted
_08158332:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08158338: .4byte gBattlerSpriteIds
_0815833C: .4byte gSprites
_08158340: .4byte gHealthboxSpriteIds
	thumb_func_end PokedudeHandleReturnMonToBall

	thumb_func_start PokedudeHandleDrawTrainerPic
PokedudeHandleDrawTrainerPic: @ 8158344
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _081583D8 @ =gActiveBattler
	ldrb r0, [r7]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _081583F0
	ldrb r1, [r7]
	movs r0, 0x4
	bl DecompressTrainerBackPalette
	ldrb r0, [r7]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x4
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _081583DC @ =gMultiuseSpriteTemplate
	ldr r1, _081583E0 @ =gTrainerBackPicCoords
	ldrb r1, [r1, 0x10]
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
	ldr r5, _081583E4 @ =gBattlerSpriteIds
	ldrb r1, [r7]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _081583E8 @ =gSprites
	ldrb r0, [r7]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r7]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _081583EC @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r3, [r7]
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
	b _081584E2
	.align 2, 0
_081583D8: .4byte gActiveBattler
_081583DC: .4byte gMultiuseSpriteTemplate
_081583E0: .4byte gTrainerBackPicCoords
_081583E4: .4byte gBattlerSpriteIds
_081583E8: .4byte gSprites
_081583EC: .4byte 0x0000fffe
_081583F0:
	ldrb r1, [r7]
	movs r0, 0x84
	bl DecompressTrainerFrontPic
	ldrb r0, [r7]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x84
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r5, _08158510 @ =gMultiuseSpriteTemplate
	ldr r0, _08158514 @ =gTrainerFrontPicCoords
	movs r1, 0x84
	mov r8, r1
	movs r1, 0x84
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 14
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r7]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	movs r1, 0xB0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _08158518 @ =gBattlerSpriteIds
	ldrb r1, [r7]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _0815851C @ =gSprites
	ldrb r0, [r7]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08158520 @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r0, [r7]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldr r0, _08158524 @ =gTrainerFrontPicPaletteTable
	mov r1, r8
	lsls r6, r1, 3
	adds r0, r6
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	ldrb r1, [r7]
	adds r1, r5
	ldrb r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r4
	lsls r0, 4
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, 0x5]
	ldrb r0, [r7]
	adds r0, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r1, 0x38]
	ldr r0, _08158528 @ =gTrainerFrontPicTable
	adds r0, r6
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	ldrb r1, [r7]
	adds r1, r5
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldr r2, _0815852C @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _08158530 @ =0xfffffc00
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	ldrb r0, [r7]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r8
	strh r1, [r0, 0x6]
_081584E2:
	ldrb r0, [r7]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _08158534 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _08158538 @ =gBattlerControllerFuncs
	ldr r0, _0815853C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158540 @ =CompleteOnBattlerSpriteCallbackDummy_PokedudeTmp
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08158510: .4byte gMultiuseSpriteTemplate
_08158514: .4byte gTrainerFrontPicCoords
_08158518: .4byte gBattlerSpriteIds
_0815851C: .4byte gSprites
_08158520: .4byte 0x0000ff10
_08158524: .4byte gTrainerFrontPicPaletteTable
_08158528: .4byte gTrainerFrontPicTable
_0815852C: .4byte 0x000003ff
_08158530: .4byte 0xfffffc00
_08158534: .4byte sub_8033EEC
_08158538: .4byte gBattlerControllerFuncs
_0815853C: .4byte gActiveBattler
_08158540: .4byte CompleteOnBattlerSpriteCallbackDummy_PokedudeTmp
	thumb_func_end PokedudeHandleDrawTrainerPic

	thumb_func_start PokedudeHandleTrainerSlide
PokedudeHandleTrainerSlide: @ 8158544
	push {r4-r6,lr}
	ldr r4, _081585EC @ =gActiveBattler
	ldrb r1, [r4]
	movs r0, 0x4
	bl DecompressTrainerBackPalette
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x4
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _081585F0 @ =gMultiuseSpriteTemplate
	ldr r1, _081585F4 @ =gTrainerBackPicCoords
	ldrb r1, [r1, 0x10]
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
	ldr r6, _081585F8 @ =gBattlerSpriteIds
	ldrb r1, [r4]
	adds r1, r6
	strb r0, [r1]
	ldr r5, _081585FC @ =gSprites
	ldrb r3, [r4]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08158600 @ =0x0000ffa0
	strh r1, [r0, 0x24]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, 0x1C
	adds r0, r5
	ldr r1, _08158604 @ =sub_8033EEC
	str r1, [r0]
	ldr r1, _08158608 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0815860C @ =CompleteOnBattlerSpriteCallbackDummy2_PokedudeTmp
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081585EC: .4byte gActiveBattler
_081585F0: .4byte gMultiuseSpriteTemplate
_081585F4: .4byte gTrainerBackPicCoords
_081585F8: .4byte gBattlerSpriteIds
_081585FC: .4byte gSprites
_08158600: .4byte 0x0000ffa0
_08158604: .4byte sub_8033EEC
_08158608: .4byte gBattlerControllerFuncs
_0815860C: .4byte CompleteOnBattlerSpriteCallbackDummy2_PokedudeTmp
	thumb_func_end PokedudeHandleTrainerSlide

	thumb_func_start PokedudeHandleTrainerSlideBack
PokedudeHandleTrainerSlideBack: @ 8158610
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleTrainerSlideBack

	thumb_func_start PokedudeHandleFaintAnimation
PokedudeHandleFaintAnimation: @ 815861C
	push {r4-r6,lr}
	ldr r6, _08158668 @ =gBattleSpritesDataPtr
	ldr r4, [r6]
	ldr r5, _0815866C @ =gActiveBattler
	ldrb r2, [r5]
	ldr r0, [r4, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _08158670
	ldr r1, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08158650
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_08158650:
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
	b _0815872A
	.align 2, 0
_08158668: .4byte gBattleSpritesDataPtr
_0815866C: .4byte gActiveBattler
_08158670:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0815872A
	strb r0, [r3, 0x4]
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081586FC
	ldr r2, _081586E8 @ =gBattlerPartyIndexes
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081586EC @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	movs r1, 0x40
	negs r1, r1
	movs r0, 0x10
	bl PlaySE12WithPanning
	ldr r2, _081586F0 @ =gSprites
	ldr r3, _081586F4 @ =gBattlerSpriteIds
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
	ldr r1, _081586F8 @ =sub_8012110
	b _0815871A
	.align 2, 0
_081586E8: .4byte gBattlerPartyIndexes
_081586EC: .4byte gPlayerParty
_081586F0: .4byte gSprites
_081586F4: .4byte gBattlerSpriteIds
_081586F8: .4byte sub_8012110
_081586FC:
	movs r0, 0x10
	movs r1, 0x3F
	bl PlaySE12WithPanning
	ldr r2, _08158730 @ =gSprites
	ldr r1, _08158734 @ =gBattlerSpriteIds
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08158738 @ =SpriteCB_FaintOpponentMon
_0815871A:
	str r1, [r0]
	ldr r1, _0815873C @ =gBattlerControllerFuncs
	ldr r0, _08158740 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158744 @ =sub_8156DCC
	str r1, [r0]
_0815872A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08158730: .4byte gSprites
_08158734: .4byte gBattlerSpriteIds
_08158738: .4byte SpriteCB_FaintOpponentMon
_0815873C: .4byte gBattlerControllerFuncs
_08158740: .4byte gActiveBattler
_08158744: .4byte sub_8156DCC
	thumb_func_end PokedudeHandleFaintAnimation

	thumb_func_start PokedudeHandlePaletteFade
PokedudeHandlePaletteFade: @ 8158748
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandlePaletteFade

	thumb_func_start PokedudeHandleSuccessBallThrowAnim
PokedudeHandleSuccessBallThrowAnim: @ 8158754
	push {r4,r5,lr}
	ldr r0, _08158794 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0, 0x8]
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _08158798 @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _0815879C @ =gActiveBattler
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x3
	bl InitAndLaunchSpecialAnimation
	ldr r1, _081587A0 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081587A4 @ =CompleteOnSpecialAnimDone_PokedudeTmp
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08158794: .4byte gBattleSpritesDataPtr
_08158798: .4byte gDoingBattleAnim
_0815879C: .4byte gActiveBattler
_081587A0: .4byte gBattlerControllerFuncs
_081587A4: .4byte CompleteOnSpecialAnimDone_PokedudeTmp
	thumb_func_end PokedudeHandleSuccessBallThrowAnim

	thumb_func_start PokedudeHandleBallThrowAnim
PokedudeHandleBallThrowAnim: @ 81587A8
	push {r4,r5,lr}
	ldr r1, _081587F0 @ =gBattleBufferA
	ldr r5, _081587F4 @ =gActiveBattler
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _081587F8 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	strb r1, [r0, 0x8]
	ldr r1, _081587FC @ =gDoingBattleAnim
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
	movs r3, 0x3
	bl InitAndLaunchSpecialAnimation
	ldr r1, _08158800 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158804 @ =CompleteOnSpecialAnimDone_PokedudeTmp
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081587F0: .4byte gBattleBufferA
_081587F4: .4byte gActiveBattler
_081587F8: .4byte gBattleSpritesDataPtr
_081587FC: .4byte gDoingBattleAnim
_08158800: .4byte gBattlerControllerFuncs
_08158804: .4byte CompleteOnSpecialAnimDone_PokedudeTmp
	thumb_func_end PokedudeHandleBallThrowAnim

	thumb_func_start PokedudeHandlePause
PokedudeHandlePause: @ 8158808
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandlePause

	thumb_func_start PokedudeHandleMoveAnimation
PokedudeHandleMoveAnimation: @ 8158814
	push {r4-r6,lr}
	ldr r0, _081588E8 @ =gBattleBufferA
	mov r12, r0
	ldr r6, _081588EC @ =gActiveBattler
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
	ldr r5, _081588F0 @ =gAnimMoveTurn
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _081588F4 @ =gAnimMovePower
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
	ldr r4, _081588F8 @ =gAnimMoveDmg
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
	ldr r3, _081588FC @ =gAnimFriendship
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08158900 @ =gWeatherMoveAnim
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
	ldr r3, _08158904 @ =gAnimDisableStructPtr
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _08158908 @ =gTransformedPersonalities
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
	beq _0815890C
	bl PokedudeBufferExecCompleted
	b _0815892A
	.align 2, 0
_081588E8: .4byte gBattleBufferA
_081588EC: .4byte gActiveBattler
_081588F0: .4byte gAnimMoveTurn
_081588F4: .4byte gAnimMovePower
_081588F8: .4byte gAnimMoveDmg
_081588FC: .4byte gAnimFriendship
_08158900: .4byte gWeatherMoveAnim
_08158904: .4byte gAnimDisableStructPtr
_08158908: .4byte gTransformedPersonalities
_0815890C:
	ldr r0, _08158930 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x4]
	ldr r1, _08158934 @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158938 @ =PokedudeDoMoveAnimation
	str r1, [r0]
_0815892A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08158930: .4byte gBattleSpritesDataPtr
_08158934: .4byte gBattlerControllerFuncs
_08158938: .4byte PokedudeDoMoveAnimation
	thumb_func_end PokedudeHandleMoveAnimation

	thumb_func_start PokedudeDoMoveAnimation
PokedudeDoMoveAnimation: @ 815893C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _08158980 @ =gBattleBufferA
	ldr r6, _08158984 @ =gActiveBattler
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
	ldr r7, _08158988 @ =gBattleSpritesDataPtr
	ldr r5, [r7]
	ldr r1, [r5, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _081589C6
	cmp r2, 0x1
	bgt _0815898C
	cmp r2, 0
	beq _08158996
	b _08158A7C
	.align 2, 0
_08158980: .4byte gBattleBufferA
_08158984: .4byte gActiveBattler
_08158988: .4byte gBattleSpritesDataPtr
_0815898C:
	cmp r2, 0x2
	beq _081589F0
	cmp r2, 0x3
	beq _08158A40
	b _08158A7C
_08158996:
	ldr r1, [r5]
	lsls r0, r3, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _081589B2
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x5
	bl InitAndLaunchSpecialAnimation
_081589B2:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0, 0x4]
	b _08158A7C
_081589C6:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08158A7C
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
	b _08158A7C
_081589F0:
	ldr r0, _08158A38 @ =gAnimScriptCallback
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08158A3C @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _08158A7C
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
	beq _08158A24
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl InitAndLaunchSpecialAnimation
_08158A24:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _08158A7C
	.align 2, 0
_08158A38: .4byte gAnimScriptCallback
_08158A3C: .4byte gAnimScriptActive
_08158A40:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08158A7C
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
	bl PokedudeBufferExecCompleted
_08158A7C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PokedudeDoMoveAnimation

	thumb_func_start PokedudeHandlePrintString
PokedudeHandlePrintString: @ 8158A88
	push {r4,lr}
	ldr r0, _08158ABC @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08158AC0 @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r0, _08158AC4 @ =gActiveBattler
	ldrb r4, [r0]
	lsls r4, 9
	ldr r0, _08158AC8 @ =gBattleBufferA + 2
	adds r4, r0
	ldrh r0, [r4]
	bl BufferStringBattle
	ldrh r0, [r4]
	bl sub_80D89B0
	lsls r0, 24
	cmp r0, 0
	beq _08158AD0
	ldr r0, _08158ACC @ =gDisplayedStringBattle
	movs r1, 0x40
	bl BattlePutTextOnWindow
	b _08158AD8
	.align 2, 0
_08158ABC: .4byte gBattle_BG0_X
_08158AC0: .4byte gBattle_BG0_Y
_08158AC4: .4byte gActiveBattler
_08158AC8: .4byte gBattleBufferA + 2
_08158ACC: .4byte gDisplayedStringBattle
_08158AD0:
	ldr r0, _08158AEC @ =gDisplayedStringBattle
	movs r1, 0
	bl BattlePutTextOnWindow
_08158AD8:
	ldr r1, _08158AF0 @ =gBattlerControllerFuncs
	ldr r0, _08158AF4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158AF8 @ =CompleteOnInactiveTextPrinter_PokedudeTmp
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08158AEC: .4byte gDisplayedStringBattle
_08158AF0: .4byte gBattlerControllerFuncs
_08158AF4: .4byte gActiveBattler
_08158AF8: .4byte CompleteOnInactiveTextPrinter_PokedudeTmp
	thumb_func_end PokedudeHandlePrintString

	thumb_func_start PokedudeHandlePrintSelectionString
PokedudeHandlePrintSelectionString: @ 8158AFC
	push {lr}
	ldr r0, _08158B14 @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08158B18
	bl PokedudeHandlePrintString
	b _08158B1C
	.align 2, 0
_08158B14: .4byte gActiveBattler
_08158B18:
	bl PokedudeBufferExecCompleted
_08158B1C:
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandlePrintSelectionString

	thumb_func_start sub_8158B20
sub_8158B20: @ 8158B20
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08158B46
	ldr r0, _08158B4C @ =gBattle_BG0_X
	strh r1, [r0]
	ldr r1, _08158B50 @ =gBattle_BG0_Y
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _08158B54 @ =gBattlerControllerFuncs
	ldr r0, _08158B58 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158B5C @ =sub_8156140
	str r1, [r0]
_08158B46:
	pop {r0}
	bx r0
	.align 2, 0
_08158B4C: .4byte gBattle_BG0_X
_08158B50: .4byte gBattle_BG0_Y
_08158B54: .4byte gBattlerControllerFuncs
_08158B58: .4byte gActiveBattler
_08158B5C: .4byte sub_8156140
	thumb_func_end sub_8158B20

	thumb_func_start PokedudeHandleChooseAction
PokedudeHandleChooseAction: @ 8158B60
	push {r4,lr}
	ldr r4, _08158BBC @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08158BDC
	ldr r1, _08158BC0 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158BC4 @ =sub_8158B20
	str r1, [r0]
	ldr r0, _08158BC8 @ =gUnknown_83FDA4C
	movs r1, 0
	bl BattlePutTextOnWindow
	ldr r0, _08158BCC @ =gUnknown_83FE725
	movs r1, 0x2
	bl BattlePutTextOnWindow
	movs r4, 0
_08158B8E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl ActionSelectionDestroyCursorAt
	adds r4, 0x1
	cmp r4, 0x3
	ble _08158B8E
	ldr r1, _08158BD0 @ =gActionSelectionCursor
	ldr r0, _08158BBC @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
	ldr r0, _08158BD4 @ =gText_WhatWillPkmnDo
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _08158BD8 @ =gDisplayedStringBattle
	movs r1, 0x1
	bl BattlePutTextOnWindow
	b _08158BE8
	.align 2, 0
_08158BBC: .4byte gActiveBattler
_08158BC0: .4byte gBattlerControllerFuncs
_08158BC4: .4byte sub_8158B20
_08158BC8: .4byte gUnknown_83FDA4C
_08158BCC: .4byte gUnknown_83FE725
_08158BD0: .4byte gActionSelectionCursor
_08158BD4: .4byte gText_WhatWillPkmnDo
_08158BD8: .4byte gDisplayedStringBattle
_08158BDC:
	ldr r0, _08158BF0 @ =gBattlerControllerFuncs
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08158BF4 @ =sub_8156140
	str r0, [r1]
_08158BE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08158BF0: .4byte gBattlerControllerFuncs
_08158BF4: .4byte sub_8156140
	thumb_func_end PokedudeHandleChooseAction

	thumb_func_start PokedudeHandleUnknownYesNoBox
PokedudeHandleUnknownYesNoBox: @ 8158BF8
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleUnknownYesNoBox

	thumb_func_start sub_8158C04
sub_8158C04: @ 8158C04
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08158C2E
	ldr r0, _08158C34 @ =gBattle_BG0_X
	strh r1, [r0]
	ldr r1, _08158C38 @ =gBattle_BG0_Y
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08158C3C @ =gBattlerControllerFuncs
	ldr r0, _08158C40 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158C44 @ =sub_81564E4
	str r1, [r0]
_08158C2E:
	pop {r0}
	bx r0
	.align 2, 0
_08158C34: .4byte gBattle_BG0_X
_08158C38: .4byte gBattle_BG0_Y
_08158C3C: .4byte gBattlerControllerFuncs
_08158C40: .4byte gActiveBattler
_08158C44: .4byte sub_81564E4
	thumb_func_end sub_8158C04

	thumb_func_start PokedudeHandleChooseMove
PokedudeHandleChooseMove: @ 8158C48
	push {r4,lr}
	ldr r4, _08158C68 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08158C74
	bl InitMoveSelectionsVarsAndStrings
	ldr r0, _08158C6C @ =gBattlerControllerFuncs
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08158C70 @ =sub_8158C04
	b _08158C7E
	.align 2, 0
_08158C68: .4byte gActiveBattler
_08158C6C: .4byte gBattlerControllerFuncs
_08158C70: .4byte sub_8158C04
_08158C74:
	ldr r0, _08158C88 @ =gBattlerControllerFuncs
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08158C8C @ =sub_81564E4
_08158C7E:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08158C88: .4byte gBattlerControllerFuncs
_08158C8C: .4byte sub_81564E4
	thumb_func_end PokedudeHandleChooseMove

	thumb_func_start PokedudeHandleChooseItem
PokedudeHandleChooseItem: @ 8158C90
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08158CDC @ =gBattlerControllerFuncs
	ldr r2, _08158CE0 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158CE4 @ =OpenBagAndChooseItem_PokedudeTmp
	str r1, [r0]
	ldr r1, _08158CE8 @ =gBattlerInMenuId
	ldrb r0, [r2]
	strb r0, [r1]
	movs r3, 0
	ldr r5, _08158CEC @ =gUnknown_203B0DC
	ldr r4, _08158CF0 @ =gBattleBufferA
_08158CBE:
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
	ble _08158CBE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08158CDC: .4byte gBattlerControllerFuncs
_08158CE0: .4byte gActiveBattler
_08158CE4: .4byte OpenBagAndChooseItem_PokedudeTmp
_08158CE8: .4byte gBattlerInMenuId
_08158CEC: .4byte gUnknown_203B0DC
_08158CF0: .4byte gBattleBufferA
	thumb_func_end PokedudeHandleChooseItem

	thumb_func_start PokedudeHandleChoosePokemon
PokedudeHandleChoosePokemon: @ 8158CF4
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _08158DA4 @ =TaskDummy
	movs r1, 0xFF
	bl CreateTask
	ldr r3, _08158DA8 @ =gUnknown_3004FFC
	ldr r4, _08158DAC @ =gActiveBattler
	ldrb r1, [r4]
	adds r1, r3
	strb r0, [r1]
	ldr r5, _08158DB0 @ =gTasks
	ldrb r2, [r4]
	adds r3, r2, r3
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldr r5, _08158DB4 @ =gBattleBufferA
	lsls r2, 9
	adds r6, r5, 0x1
	adds r2, r6
	ldrb r2, [r2]
	movs r0, 0xF
	ands r0, r2
	strh r0, [r1, 0x8]
	ldr r3, _08158DB8 @ =gBattleStruct
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
	ldr r3, _08158DBC @ =gUnknown_203B0DC
_08158D60:
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
	ble _08158D60
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08158DC0 @ =gBattlerControllerFuncs
	ldr r2, _08158DAC @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158DC4 @ =OpenPartyMenuToChooseMon_PokedudeTmp
	str r1, [r0]
	ldr r1, _08158DC8 @ =gBattlerInMenuId
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08158DA4: .4byte TaskDummy
_08158DA8: .4byte gUnknown_3004FFC
_08158DAC: .4byte gActiveBattler
_08158DB0: .4byte gTasks
_08158DB4: .4byte gBattleBufferA
_08158DB8: .4byte gBattleStruct
_08158DBC: .4byte gUnknown_203B0DC
_08158DC0: .4byte gBattlerControllerFuncs
_08158DC4: .4byte OpenPartyMenuToChooseMon_PokedudeTmp
_08158DC8: .4byte gBattlerInMenuId
	thumb_func_end PokedudeHandleChoosePokemon

	thumb_func_start PokedudeHandleCmd23
PokedudeHandleCmd23: @ 8158DCC
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleCmd23

	thumb_func_start PokedudeHandleHealthBarUpdate
PokedudeHandleHealthBarUpdate: @ 8158DD8
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _08158DFC @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08158E08
	ldr r1, _08158E00 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08158E04 @ =gPlayerParty
	b _08158E18
	.align 2, 0
_08158DFC: .4byte gActiveBattler
_08158E00: .4byte gBattlerPartyIndexes
_08158E04: .4byte gPlayerParty
_08158E08:
	ldr r1, _08158E68 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08158E6C @ =gEnemyParty
_08158E18:
	adds r5, r1, r0
	movs r0, 0
	bl LoadBattleBarGfx
	ldr r3, _08158E70 @ =gBattleBufferA
	ldr r7, _08158E74 @ =gActiveBattler
	ldrb r1, [r7]
	lsls r1, 9
	adds r0, r3, 0x2
	adds r0, r1, r0
	ldrb r2, [r0]
	adds r3, 0x3
	adds r1, r3
	ldrb r0, [r1]
	lsls r0, 8
	orrs r2, r0
	lsls r2, 16
	asrs r6, r2, 16
	ldr r0, _08158E78 @ =0x00007fff
	cmp r6, r0
	beq _08158E80
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	ldrb r0, [r7]
	ldr r1, _08158E7C @ =gHealthboxSpriteIds
	adds r1, r0, r1
	ldrb r1, [r1]
	str r6, [sp]
	adds r2, r4, 0
	bl SetBattleBarStruct
	b _08158EA8
	.align 2, 0
_08158E68: .4byte gBattlerPartyIndexes
_08158E6C: .4byte gEnemyParty
_08158E70: .4byte gBattleBufferA
_08158E74: .4byte gActiveBattler
_08158E78: .4byte 0x00007fff
_08158E7C: .4byte gHealthboxSpriteIds
_08158E80:
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	ldrb r0, [r7]
	ldr r4, _08158EC0 @ =gHealthboxSpriteIds
	adds r1, r0, r4
	ldrb r1, [r1]
	str r6, [sp]
	movs r3, 0
	bl SetBattleBarStruct
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0
	bl UpdateHpTextInHealthbox
_08158EA8:
	ldr r1, _08158EC4 @ =gBattlerControllerFuncs
	ldr r0, _08158EC8 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158ECC @ =CompleteOnHealthbarDone_PokedudeTmp
	str r1, [r0]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08158EC0: .4byte gHealthboxSpriteIds
_08158EC4: .4byte gBattlerControllerFuncs
_08158EC8: .4byte gActiveBattler
_08158ECC: .4byte CompleteOnHealthbarDone_PokedudeTmp
	thumb_func_end PokedudeHandleHealthBarUpdate

	thumb_func_start PokedudeHandleExpUpdate
PokedudeHandleExpUpdate: @ 8158ED0
	push {r4-r7,lr}
	ldr r5, _08158EFC @ =gBattleBufferA
	ldr r6, _08158F00 @ =gActiveBattler
	ldrb r0, [r6]
	lsls r0, 9
	adds r1, r5, 0x1
	adds r0, r1
	ldrb r7, [r0]
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08158F04 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x63
	bls _08158F08
	bl PokedudeBufferExecCompleted
	b _08158F54
	.align 2, 0
_08158EFC: .4byte gBattleBufferA
_08158F00: .4byte gActiveBattler
_08158F04: .4byte gPlayerParty
_08158F08:
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
	ldr r0, _08158F5C @ =Task_GiveExpToMon_PokedudeTmp
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08158F60 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r7, [r1, 0x8]
	strh r4, [r1, 0xA]
	ldrb r0, [r6]
	strh r0, [r1, 0xC]
	ldr r1, _08158F64 @ =gBattlerControllerFuncs
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158F68 @ =nullsub_99
	str r1, [r0]
_08158F54:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08158F5C: .4byte Task_GiveExpToMon_PokedudeTmp
_08158F60: .4byte gTasks
_08158F64: .4byte gBattlerControllerFuncs
_08158F68: .4byte nullsub_99
	thumb_func_end PokedudeHandleExpUpdate

	thumb_func_start PokedudeHandleStatusIconUpdate
PokedudeHandleStatusIconUpdate: @ 8158F6C
	push {r4,lr}
	ldr r4, _08158F9C @ =gActiveBattler
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08158FF2
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08158FA8
	ldr r1, _08158FA0 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08158FA4 @ =gPlayerParty
	b _08158FB8
	.align 2, 0
_08158F9C: .4byte gActiveBattler
_08158FA0: .4byte gBattlerPartyIndexes
_08158FA4: .4byte gPlayerParty
_08158FA8:
	ldr r1, _08158FF8 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08158FFC @ =gEnemyParty
_08158FB8:
	adds r2, r1, r0
	ldr r1, _08159000 @ =gHealthboxSpriteIds
	ldr r4, _08159004 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r2, 0
	movs r2, 0x9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _08159008 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
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
	ldr r1, _0815900C @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08159010 @ =CompleteOnFinishedStatusAnimation_PokedudeTmp
	str r1, [r0]
_08158FF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08158FF8: .4byte gBattlerPartyIndexes
_08158FFC: .4byte gEnemyParty
_08159000: .4byte gHealthboxSpriteIds
_08159004: .4byte gActiveBattler
_08159008: .4byte gBattleSpritesDataPtr
_0815900C: .4byte gBattlerControllerFuncs
_08159010: .4byte CompleteOnFinishedStatusAnimation_PokedudeTmp
	thumb_func_end PokedudeHandleStatusIconUpdate

	thumb_func_start PokedudeHandleStatusAnimation
PokedudeHandleStatusAnimation: @ 8159014
	push {r4,r5,lr}
	ldr r5, _0815906C @ =gActiveBattler
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08159064
	ldr r4, _08159070 @ =gBattleBufferA
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl InitAndLaunchChosenStatusAnimation
	ldr r1, _08159074 @ =gBattlerControllerFuncs
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08159078 @ =CompleteOnFinishedStatusAnimation_PokedudeTmp
	str r1, [r0]
_08159064:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815906C: .4byte gActiveBattler
_08159070: .4byte gBattleBufferA
_08159074: .4byte gBattlerControllerFuncs
_08159078: .4byte CompleteOnFinishedStatusAnimation_PokedudeTmp
	thumb_func_end PokedudeHandleStatusAnimation

	thumb_func_start PokedudeHandleStatusXor
PokedudeHandleStatusXor: @ 815907C
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _081590A0 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _081590AC
	ldr r1, _081590A4 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081590A8 @ =gPlayerParty
	b _081590BC
	.align 2, 0
_081590A0: .4byte gActiveBattler
_081590A4: .4byte gBattlerPartyIndexes
_081590A8: .4byte gPlayerParty
_081590AC:
	ldr r1, _081590F0 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081590F4 @ =gEnemyParty
_081590BC:
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	ldr r2, _081590F8 @ =gBattleBufferA
	ldr r1, _081590FC @ =gActiveBattler
	ldrb r1, [r1]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	eors r0, r1
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	bl PokedudeBufferExecCompleted
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081590F0: .4byte gBattlerPartyIndexes
_081590F4: .4byte gEnemyParty
_081590F8: .4byte gBattleBufferA
_081590FC: .4byte gActiveBattler
	thumb_func_end PokedudeHandleStatusXor

	thumb_func_start PokedudeHandleDataTransfer
PokedudeHandleDataTransfer: @ 8159100
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleDataTransfer

	thumb_func_start PokedudeHandleDMA3Transfer
PokedudeHandleDMA3Transfer: @ 815910C
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleDMA3Transfer

	thumb_func_start PokedudeHandlePlayBGM
PokedudeHandlePlayBGM: @ 8159118
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandlePlayBGM

	thumb_func_start PokedudeHandleCmd32
PokedudeHandleCmd32: @ 8159124
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleCmd32

	thumb_func_start PokedudeHandleTwoReturnValues
PokedudeHandleTwoReturnValues: @ 8159130
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleTwoReturnValues

	thumb_func_start PokedudeHandleChosenMonReturnValue
PokedudeHandleChosenMonReturnValue: @ 815913C
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleChosenMonReturnValue

	thumb_func_start PokedudeHandleOneReturnValue
PokedudeHandleOneReturnValue: @ 8159148
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleOneReturnValue

	thumb_func_start PokedudeHandleOneReturnValue_Duplicate
PokedudeHandleOneReturnValue_Duplicate: @ 8159154
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleOneReturnValue_Duplicate

	thumb_func_start PokedudeHandleCmd37
PokedudeHandleCmd37: @ 8159160
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleCmd37

	thumb_func_start PokedudeHandleCmd38
PokedudeHandleCmd38: @ 815916C
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleCmd38

	thumb_func_start PokedudeHandleCmd39
PokedudeHandleCmd39: @ 8159178
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleCmd39

	thumb_func_start PokedudeHandleCmd40
PokedudeHandleCmd40: @ 8159184
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleCmd40

	thumb_func_start PokedudeHandleHitAnimation
PokedudeHandleHitAnimation: @ 8159190
	push {r4,lr}
	ldr r3, _081591B8 @ =gSprites
	ldr r2, _081591BC @ =gBattlerSpriteIds
	ldr r4, _081591C0 @ =gActiveBattler
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
	bge _081591C4
	bl PokedudeBufferExecCompleted
	b _081591EE
	.align 2, 0
_081591B8: .4byte gSprites
_081591BC: .4byte gBattlerSpriteIds
_081591C0: .4byte gActiveBattler
_081591C4:
	ldr r1, _081591F4 @ =gDoingBattleAnim
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
	ldr r1, _081591F8 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081591FC @ =DoHitAnimBlinkSpriteEffect_PokedudeTmp
	str r1, [r0]
_081591EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081591F4: .4byte gDoingBattleAnim
_081591F8: .4byte gBattlerControllerFuncs
_081591FC: .4byte DoHitAnimBlinkSpriteEffect_PokedudeTmp
	thumb_func_end PokedudeHandleHitAnimation

	thumb_func_start PokedudeHandleCmd42
PokedudeHandleCmd42: @ 8159200
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleCmd42

	thumb_func_start PokedudeHandlePlaySE
PokedudeHandlePlaySE: @ 815920C
	push {lr}
	ldr r2, _08159234 @ =gBattleBufferA
	ldr r0, _08159238 @ =gActiveBattler
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
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08159234: .4byte gBattleBufferA
_08159238: .4byte gActiveBattler
	thumb_func_end PokedudeHandlePlaySE

	thumb_func_start PokedudeHandlePlayFanfare
PokedudeHandlePlayFanfare: @ 815923C
	push {lr}
	ldr r2, _08159264 @ =gBattleBufferA
	ldr r0, _08159268 @ =gActiveBattler
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
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08159264: .4byte gBattleBufferA
_08159268: .4byte gActiveBattler
	thumb_func_end PokedudeHandlePlayFanfare

	thumb_func_start PokedudeHandleFaintingCry
PokedudeHandleFaintingCry: @ 815926C
	push {r4,lr}
	ldr r4, _08159290 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0815929C
	ldr r1, _08159294 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08159298 @ =gPlayerParty
	b _081592AC
	.align 2, 0
_08159290: .4byte gActiveBattler
_08159294: .4byte gBattlerPartyIndexes
_08159298: .4byte gPlayerParty
_0815929C:
	ldr r1, _081592C8 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081592CC @ =gEnemyParty
_081592AC:
	adds r0, r1, r0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl PokedudeBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081592C8: .4byte gBattlerPartyIndexes
_081592CC: .4byte gEnemyParty
	thumb_func_end PokedudeHandleFaintingCry

	thumb_func_start PokedudeHandleIntroSlide
PokedudeHandleIntroSlide: @ 81592D0
	push {lr}
	ldr r1, _081592F8 @ =gBattleBufferA
	ldr r0, _081592FC @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _08159300 @ =gIntroSlideFlags
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_081592F8: .4byte gBattleBufferA
_081592FC: .4byte gActiveBattler
_08159300: .4byte gIntroSlideFlags
	thumb_func_end PokedudeHandleIntroSlide

	thumb_func_start PokedudeHandleIntroTrainerBallThrow
PokedudeHandleIntroTrainerBallThrow: @ 8159304
	push {r4-r7,lr}
	ldr r6, _0815943C @ =gBattlerSpriteIds
	ldr r7, _08159440 @ =gActiveBattler
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08159444 @ =gSprites
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
	ldr r1, _08159448 @ =0x0000ffd8
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
	ldr r1, _0815944C @ =StartAnimLinearTranslation
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
	ldr r1, _08159450 @ =sub_80335F8
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
	ldr r0, _08159454 @ =0x0000d6f8
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _08159458 @ =gTrainerBackPicPaletteTable
	ldr r0, [r0, 0x20]
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
	ldr r0, _0815945C @ =sub_81595EC
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08159460 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldr r3, _08159464 @ =gBattleSpritesDataPtr
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
	beq _0815941C
	ldr r0, _08159468 @ =gBattlerStatusSummaryTaskId
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _0815946C @ =Task_HidePartyStatusSummary
	str r1, [r0]
_0815941C:
	ldr r0, [r3]
	ldr r2, [r0, 0x8]
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08159470 @ =gBattlerControllerFuncs
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08159474 @ =nullsub_99
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815943C: .4byte gBattlerSpriteIds
_08159440: .4byte gActiveBattler
_08159444: .4byte gSprites
_08159448: .4byte 0x0000ffd8
_0815944C: .4byte StartAnimLinearTranslation
_08159450: .4byte sub_80335F8
_08159454: .4byte 0x0000d6f8
_08159458: .4byte gTrainerBackPicPaletteTable
_0815945C: .4byte sub_81595EC
_08159460: .4byte gTasks
_08159464: .4byte gBattleSpritesDataPtr
_08159468: .4byte gBattlerStatusSummaryTaskId
_0815946C: .4byte Task_HidePartyStatusSummary
_08159470: .4byte gBattlerControllerFuncs
_08159474: .4byte nullsub_99
	thumb_func_end PokedudeHandleIntroTrainerBallThrow

	thumb_func_start sub_8159478
sub_8159478: @ 8159478
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _081595C0 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	ldr r0, _081595C4 @ =gBattlerPartyIndexes
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _081595C8 @ =gBattleBufferA
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081595CC @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _081595D0 @ =sub_8033E3C
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _081595D4 @ =gUnknown_3004FFC
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
	ldr r0, _081595D8 @ =gMultiuseSpriteTemplate
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
	ldr r4, _081595DC @ =gBattlerSpriteIds
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _081595E0 @ =gSprites
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
	ldr r1, _081595E4 @ =gBattleMonForms
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
	ldr r1, _081595E8 @ =SpriteCallbackDummy
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
_081595C0: .4byte gBattleSpritesDataPtr
_081595C4: .4byte gBattlerPartyIndexes
_081595C8: .4byte gBattleBufferA
_081595CC: .4byte gPlayerParty
_081595D0: .4byte sub_8033E3C
_081595D4: .4byte gUnknown_3004FFC
_081595D8: .4byte gMultiuseSpriteTemplate
_081595DC: .4byte gBattlerSpriteIds
_081595E0: .4byte gSprites
_081595E4: .4byte gBattleMonForms
_081595E8: .4byte SpriteCallbackDummy
	thumb_func_end sub_8159478

	thumb_func_start sub_81595EC
sub_81595EC: @ 81595EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0815960C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x1E
	bgt _08159610
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08159646
	.align 2, 0
_0815960C: .4byte gTasks
_08159610:
	ldr r4, _0815964C @ =gActiveBattler
	ldrb r5, [r4]
	ldrh r0, [r1, 0x8]
	strb r0, [r4]
	ldr r0, _08159650 @ =gBattleBufferA
	ldrb r1, [r4]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08159654 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_8159478
	ldr r1, _08159658 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0815965C @ =sub_8156624
	str r1, [r0]
	strb r5, [r4]
	adds r0, r6, 0
	bl DestroyTask
_08159646:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815964C: .4byte gActiveBattler
_08159650: .4byte gBattleBufferA
_08159654: .4byte gBattlerPartyIndexes
_08159658: .4byte gBattlerControllerFuncs
_0815965C: .4byte sub_8156624
	thumb_func_end sub_81595EC

	thumb_func_start PokedudeHandleDrawPartyStatusSummary
PokedudeHandleDrawPartyStatusSummary: @ 8159660
	push {r4,r5,lr}
	ldr r1, _08159688 @ =gBattleBufferA
	ldr r0, _0815968C @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08159690
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08159690
	bl PokedudeBufferExecCompleted
	b _081596CE
	.align 2, 0
_08159688: .4byte gBattleBufferA
_0815968C: .4byte gActiveBattler
_08159690:
	ldr r0, _081596D4 @ =gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r5, _081596D8 @ =gActiveBattler
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
	ldr r3, _081596DC @ =gBattleBufferA + 4
	adds r1, r4, r3
	subs r2, r3, 0x3
	adds r2, r4, r2
	ldrb r2, [r2]
	subs r3, 0x2
	adds r4, r3
	ldrb r3, [r4]
	bl CreatePartyStatusSummarySprites
	ldr r2, _081596E0 @ =gBattlerStatusSummaryTaskId
	ldrb r1, [r5]
	adds r1, r2
	strb r0, [r1]
	bl PokedudeBufferExecCompleted
_081596CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081596D4: .4byte gBattleSpritesDataPtr
_081596D8: .4byte gActiveBattler
_081596DC: .4byte gBattleBufferA + 4
_081596E0: .4byte gBattlerStatusSummaryTaskId
	thumb_func_end PokedudeHandleDrawPartyStatusSummary

	thumb_func_start PokedudeHandleHidePartyStatusSummary
PokedudeHandleHidePartyStatusSummary: @ 81596E4
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleHidePartyStatusSummary

	thumb_func_start PokedudeHandleEndBounceEffect
PokedudeHandleEndBounceEffect: @ 81596F0
	push {r4,lr}
	ldr r4, _08159710 @ =gActiveBattler
	ldrb r0, [r4]
	movs r1, 0x1
	bl EndBounceEffect
	ldrb r0, [r4]
	movs r1, 0
	bl EndBounceEffect
	bl PokedudeBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08159710: .4byte gActiveBattler
	thumb_func_end PokedudeHandleEndBounceEffect

	thumb_func_start PokedudeHandleSpriteInvisibility
PokedudeHandleSpriteInvisibility: @ 8159714
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleSpriteInvisibility

	thumb_func_start PokedudeHandleBattleAnimation
PokedudeHandleBattleAnimation: @ 8159720
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _08159758 @ =gBattleBufferA
	ldr r6, _0815975C @ =gActiveBattler
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
	beq _08159760
	bl PokedudeBufferExecCompleted
	b _0815976C
	.align 2, 0
_08159758: .4byte gBattleBufferA
_0815975C: .4byte gActiveBattler
_08159760:
	ldr r0, _08159774 @ =gBattlerControllerFuncs
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08159778 @ =CompleteOnFinishedBattleAnimation_PokedudeTmp
	str r0, [r1]
_0815976C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08159774: .4byte gBattlerControllerFuncs
_08159778: .4byte CompleteOnFinishedBattleAnimation_PokedudeTmp
	thumb_func_end PokedudeHandleBattleAnimation

	thumb_func_start PokedudeHandleLinkStandbyMsg
PokedudeHandleLinkStandbyMsg: @ 815977C
	push {r4,lr}
	ldr r1, _081597B0 @ =gBattleBufferA
	ldr r4, _081597B4 @ =gActiveBattler
	ldrb r2, [r4]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	blt _081597A4
	cmp r0, 0x1
	bgt _081597A4
	adds r0, r2, 0
	movs r1, 0x1
	bl EndBounceEffect
	ldrb r0, [r4]
	movs r1, 0
	bl EndBounceEffect
_081597A4:
	bl PokedudeBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081597B0: .4byte gBattleBufferA
_081597B4: .4byte gActiveBattler
	thumb_func_end PokedudeHandleLinkStandbyMsg

	thumb_func_start PokedudeHandleResetActionMoveSelection
PokedudeHandleResetActionMoveSelection: @ 81597B8
	push {lr}
	bl PokedudeBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end PokedudeHandleResetActionMoveSelection

	thumb_func_start PokedudeHandleCmd55
PokedudeHandleCmd55: @ 81597C4
	push {r4,lr}
	ldr r2, _08159808 @ =gBattleOutcome
	ldr r1, _0815980C @ =gBattleBufferA
	ldr r4, _08159810 @ =gActiveBattler
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
	bl PokedudeBufferExecCompleted
	ldr r0, _08159814 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _08159800
	ldr r0, _08159818 @ =gBattlerControllerFuncs
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0815981C @ =sub_8156254
	str r0, [r1]
_08159800:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08159808: .4byte gBattleOutcome
_0815980C: .4byte gBattleBufferA
_08159810: .4byte gActiveBattler
_08159814: .4byte gBattleTypeFlags
_08159818: .4byte gBattlerControllerFuncs
_0815981C: .4byte sub_8156254
	thumb_func_end PokedudeHandleCmd55

	thumb_func_start PokedudeCmdEnd
PokedudeCmdEnd: @ 8159820
	bx lr
	thumb_func_end PokedudeCmdEnd

	thumb_func_start sub_8159824
sub_8159824: @ 8159824
	push {r4-r7,lr}
	ldr r1, _081598B4 @ =gUnknown_8479060
	ldr r0, _081598B8 @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x96
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r7, [r0]
	ldr r4, _081598BC @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _0815985C
	ldrb r0, [r4]
	movs r1, 0x1
	movs r2, 0x7
	movs r3, 0x1
	bl DoBounceEffect
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0x7
	movs r3, 0x1
	bl DoBounceEffect
_0815985C:
	ldr r6, _081598C0 @ =gUnknown_3005EE0
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r6
	ldr r1, [r0]
	ldrb r0, [r1]
	lsls r0, 3
	adds r0, r7
	adds r3, r0, r2
	ldrb r0, [r3, 0x4]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	bne _0815992C
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08159888
	movs r0, 0x5
	bl PlaySE
_08159888:
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r7
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _081598D4
	cmp r0, 0x1
	bgt _081598C4
	cmp r0, 0
	beq _081598CE
	b _081598F0
	.align 2, 0
_081598B4: .4byte gUnknown_8479060
_081598B8: .4byte gBattleStruct
_081598BC: .4byte gActiveBattler
_081598C0: .4byte gUnknown_3005EE0
_081598C4:
	cmp r0, 0x2
	beq _081598DA
	cmp r0, 0x3
	beq _081598E6
	b _081598F0
_081598CE:
	movs r0, 0x1
	movs r1, 0
	b _081598DE
_081598D4:
	movs r0, 0x1
	movs r1, 0x1
	b _081598DE
_081598DA:
	movs r0, 0x1
	movs r1, 0x2
_081598DE:
	movs r2, 0
	bl BtlController_EmitTwoReturnValues
	b _081598F0
_081598E6:
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl BtlController_EmitTwoReturnValues
_081598F0:
	bl PokedudeBufferExecCompleted
	ldr r3, _08159924 @ =gUnknown_3005EE0
	ldr r2, _08159928 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r3
	ldr r2, [r0]
	ldrb r0, [r2]
	lsls r0, 3
	adds r0, r7
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _08159984
	movs r0, 0
	strb r0, [r2]
	b _08159984
	.align 2, 0
_08159924: .4byte gUnknown_3005EE0
_08159928: .4byte gActiveBattler
_0815992C:
	ldr r5, _0815998C @ =gActionSelectionCursor
	adds r0, r2, r5
	ldrb r0, [r0]
	ldrb r2, [r3]
	cmp r0, r2
	beq _08159972
	ldrb r0, [r3, 0x4]
	lsrs r0, 1
	cmp r0, r1
	bne _08159972
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl ActionSelectionDestroyCursorAt
	ldrb r1, [r4]
	adds r2, r1, r5
	lsls r0, r1, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r7
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
_08159972:
	ldr r1, _08159990 @ =gUnknown_3005EE0
	ldr r0, _08159994 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
_08159984:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815998C: .4byte gActionSelectionCursor
_08159990: .4byte gUnknown_3005EE0
_08159994: .4byte gActiveBattler
	thumb_func_end sub_8159824

	thumb_func_start sub_8159998
sub_8159998: @ 8159998
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _08159A38 @ =gUnknown_84790D8
	ldr r0, _08159A3C @ =gBattleStruct
	ldr r0, [r0]
	adds r0, 0x96
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r7, [r0]
	ldr r0, _08159A40 @ =gUnknown_3005EE0
	mov r8, r0
	ldr r6, _08159A44 @ =gActiveBattler
	ldrb r2, [r6]
	lsls r0, r2, 2
	add r0, r8
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	lsls r0, 3
	adds r0, r7
	adds r3, r0, r2
	ldrb r0, [r3, 0x4]
	ldrb r4, [r1, 0x2]
	cmp r0, r4
	bne _08159A48
	adds r0, r2, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _081599DE
	movs r0, 0x5
	bl PlaySE
_081599DE:
	ldrb r0, [r6]
	lsls r0, 2
	add r0, r8
	ldr r0, [r0]
	movs r4, 0
	strb r4, [r0, 0x2]
	ldrb r1, [r6]
	lsls r0, r1, 2
	add r0, r8
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	lsls r0, 3
	adds r0, r7
	adds r0, r1
	ldrb r2, [r0]
	movs r0, 0x1
	eors r1, r0
	lsls r1, 8
	orrs r2, r1
	movs r0, 0x1
	movs r1, 0xA
	bl BtlController_EmitTwoReturnValues
	bl PokedudeBufferExecCompleted
	ldrb r0, [r6]
	lsls r0, 2
	add r0, r8
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	ldrb r1, [r6]
	lsls r0, r1, 2
	add r0, r8
	ldr r2, [r0]
	ldrb r0, [r2, 0x1]
	lsls r0, 3
	adds r0, r7
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08159AA0
	strb r4, [r2, 0x1]
	b _08159AA0
	.align 2, 0
_08159A38: .4byte gUnknown_84790D8
_08159A3C: .4byte gBattleStruct
_08159A40: .4byte gUnknown_3005EE0
_08159A44: .4byte gActiveBattler
_08159A48:
	ldr r5, _08159AAC @ =gMoveSelectionCursor
	adds r1, r2, r5
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08159A8E
	ldrb r0, [r3, 0x4]
	lsrs r0, 1
	cmp r0, r4
	bne _08159A8E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl MoveSelectionDestroyCursorAt
	ldrb r1, [r6]
	adds r2, r1, r5
	lsls r0, r1, 2
	add r0, r8
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	lsls r0, 3
	adds r0, r7
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl MoveSelectionCreateCursorAt
_08159A8E:
	ldr r1, _08159AB0 @ =gUnknown_3005EE0
	ldr r0, _08159AB4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
_08159AA0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08159AAC: .4byte gMoveSelectionCursor
_08159AB0: .4byte gUnknown_3005EE0
_08159AB4: .4byte gActiveBattler
	thumb_func_end sub_8159998

	thumb_func_start sub_8159AB8
sub_8159AB8: @ 8159AB8
	push {r4-r7,lr}
	ldr r1, _08159B54 @ =gUnknown_8479198
	ldr r4, _08159B58 @ =gBattleStruct
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x96
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r6, [r0]
	ldr r3, _08159B5C @ =gActiveBattler
	ldrb r5, [r3]
	lsls r1, r5, 9
	ldr r0, _08159B60 @ =gBattleBufferA + 2
	adds r7, r1, r0
	mov r12, r7
	subs r0, 0x2
	adds r1, r0
	adds r2, 0x97
	ldrb r0, [r2]
	lsls r0, 3
	adds r0, r6
	ldrb r1, [r1]
	adds r7, r4, 0
	adds r4, r3, 0
	ldrb r2, [r0]
	cmp r1, r2
	bne _08159B70
	ldrb r2, [r0, 0x1]
	cmp r5, r2
	bne _08159B70
	cmp r1, 0x10
	bne _08159B04
	ldrh r0, [r0, 0x2]
	mov r1, r12
	ldrh r1, [r1]
	cmp r0, r1
	bne _08159B70
_08159B04:
	ldr r0, [r7]
	adds r3, r0, 0
	adds r3, 0x97
	ldrb r1, [r3]
	lsls r0, r1, 3
	adds r0, r6
	ldr r2, [r0, 0x4]
	cmp r2, 0
	beq _08159B6C
	ldr r1, _08159B64 @ =gBattlerControllerFuncs
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	str r2, [r0]
	ldr r2, _08159B68 @ =gUnknown_3005EE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r0]
	ldr r0, [r7]
	adds r0, 0x97
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x2]
	strb r0, [r1, 0x3]
	ldr r1, [r7]
	adds r1, 0x97
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	b _08159B72
	.align 2, 0
_08159B54: .4byte gUnknown_8479198
_08159B58: .4byte gBattleStruct
_08159B5C: .4byte gActiveBattler
_08159B60: .4byte gBattleBufferA + 2
_08159B64: .4byte gBattlerControllerFuncs
_08159B68: .4byte gUnknown_3005EE0
_08159B6C:
	adds r0, r1, 0x1
	strb r0, [r3]
_08159B70:
	movs r0, 0
_08159B72:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8159AB8

	thumb_func_start sub_8159B78
sub_8159B78: @ 8159B78
	ldr r1, _08159B98 @ =gUnknown_3005EE0
	ldr r2, _08159B9C @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x2]
	ldr r1, _08159BA0 @ =gBattlerControllerFuncs
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08159BA4 @ =PokedudeBufferRunCommand
	str r1, [r0]
	bx lr
	.align 2, 0
_08159B98: .4byte gUnknown_3005EE0
_08159B9C: .4byte gActiveBattler
_08159BA0: .4byte gBattlerControllerFuncs
_08159BA4: .4byte PokedudeBufferRunCommand
	thumb_func_end sub_8159B78

	thumb_func_start sub_8159BA8
sub_8159BA8: @ 8159BA8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _08159BD0 @ =gUnknown_3005EE0
	ldr r2, _08159BD4 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	adds r5, r1, 0
	adds r4, r2, 0
	cmp r0, 0x4
	bls _08159BC4
	b _08159CEE
_08159BC4:
	lsls r0, 2
	ldr r1, _08159BD8 @ =_08159BDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08159BD0: .4byte gUnknown_3005EE0
_08159BD4: .4byte gActiveBattler
_08159BD8: .4byte _08159BDC
	.align 2, 0
_08159BDC:
	.4byte _08159BF0
	.4byte _08159C14
	.4byte _08159C44
	.4byte _08159C64
	.4byte _08159CB4
_08159BF0:
	ldr r0, _08159C10 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08159CEE
	movs r0, 0x81
	negs r0, r0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	b _08159C90
	.align 2, 0
_08159C10: .4byte gPaletteFade
_08159C14:
	ldr r0, _08159C3C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08159CEE
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	ldr r0, _08159C40 @ =gBattle_BG0_Y
	ldrh r0, [r0]
	strb r0, [r1, 0x4]
	bl sub_80EB30C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	b _08159C9E
	.align 2, 0
_08159C3C: .4byte gPaletteFade
_08159C40: .4byte gBattle_BG0_Y
_08159C44:
	ldr r1, _08159C5C @ =gBattle_BG0_Y
	movs r0, 0
	strh r0, [r1]
	bl sub_8159EF0
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _08159C60 @ =gDisplayedStringBattle
	movs r1, 0x18
	bl BattlePutTextOnWindow
	b _08159C94
	.align 2, 0
_08159C5C: .4byte gBattle_BG0_Y
_08159C60: .4byte gDisplayedStringBattle
_08159C64:
	movs r0, 0x18
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _08159CEE
	ldr r0, _08159CA8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08159CEE
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x81
	negs r0, r0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
_08159C90:
	bl BeginNormalPaletteFade
_08159C94:
	ldr r1, _08159CAC @ =gUnknown_3005EE0
	ldr r0, _08159CB0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
_08159C9E:
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	b _08159CEE
	.align 2, 0
_08159CA8: .4byte gMain
_08159CAC: .4byte gUnknown_3005EE0
_08159CB0: .4byte gActiveBattler
_08159CB4:
	ldr r0, _08159CF8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08159CEE
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	cmp r0, 0xD
	bne _08159CD8
	bl BattleStopLowHpSound
	ldr r0, _08159CFC @ =0x00000137
	bl PlayBGM
_08159CD8:
	ldr r1, _08159D00 @ =gBattle_BG0_Y
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	strh r0, [r1]
	bl sub_80EB524
	bl sub_8159B78
_08159CEE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08159CF8: .4byte gPaletteFade
_08159CFC: .4byte 0x00000137
_08159D00: .4byte gBattle_BG0_Y
	thumb_func_end sub_8159BA8

	thumb_func_start sub_8159D04
sub_8159D04: @ 8159D04
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _08159D28 @ =gUnknown_3005EE0
	ldr r2, _08159D2C @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	adds r3, r1, 0
	cmp r0, 0x6
	bls _08159D1E
	b _08159EDE
_08159D1E:
	lsls r0, 2
	ldr r1, _08159D30 @ =_08159D34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08159D28: .4byte gUnknown_3005EE0
_08159D2C: .4byte gActiveBattler
_08159D30: .4byte _08159D34
	.align 2, 0
_08159D34:
	.4byte _08159D50
	.4byte _08159D98
	.4byte _08159DDC
	.4byte _08159DF4
	.4byte _08159E0C
	.4byte _08159E64
	.4byte _08159EA4
_08159D50:
	ldr r0, _08159D90 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _08159D62
	b _08159EDE
_08159D62:
	ldr r0, _08159D94 @ =gBattleStruct
	ldr r4, [r0]
	adds r5, r4, 0
	adds r5, 0x95
	adds r4, 0x94
	movs r0, 0
	bl GetBattlerAtPosition
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80EEFC8
	movs r0, 0x81
	negs r0, r0
	str r6, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	b _08159E80
	.align 2, 0
_08159D90: .4byte gPaletteFade
_08159D94: .4byte gBattleStruct
_08159D98:
	ldr r0, _08159DD0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _08159DAA
	b _08159EDE
_08159DAA:
	ldr r2, _08159DD4 @ =gBitTable
	ldr r0, _08159DD8 @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x95
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x94
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	lsls r0, r1, 16
	str r3, [sp]
	b _08159E7A
	.align 2, 0
_08159DD0: .4byte gPaletteFade
_08159DD4: .4byte gBitTable
_08159DD8: .4byte gBattleStruct
_08159DDC:
	ldr r0, _08159DF0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08159DEA
	b _08159EDE
_08159DEA:
	bl sub_80EB30C
	b _08159E84
	.align 2, 0
_08159DF0: .4byte gPaletteFade
_08159DF4:
	bl sub_8159EF0
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _08159E08 @ =gDisplayedStringBattle
	movs r1, 0x18
	bl BattlePutTextOnWindow
	b _08159E84
	.align 2, 0
_08159E08: .4byte gDisplayedStringBattle
_08159E0C:
	movs r0, 0x18
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _08159EDE
	ldr r0, _08159E58 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08159EDE
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08159E5C @ =gBitTable
	ldr r0, _08159E60 @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x95
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x94
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	lsls r0, r1, 16
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	b _08159E80
	.align 2, 0
_08159E58: .4byte gMain
_08159E5C: .4byte gBitTable
_08159E60: .4byte gBattleStruct
_08159E64:
	ldr r0, _08159E98 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08159EDE
	movs r0, 0x81
	negs r0, r0
	str r1, [sp]
_08159E7A:
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
_08159E80:
	bl BeginNormalPaletteFade
_08159E84:
	ldr r1, _08159E9C @ =gUnknown_3005EE0
	ldr r0, _08159EA0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	b _08159EDE
	.align 2, 0
_08159E98: .4byte gPaletteFade
_08159E9C: .4byte gUnknown_3005EE0
_08159EA0: .4byte gActiveBattler
_08159EA4:
	ldr r0, _08159EE8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08159EDE
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	cmp r0, 0xD
	bne _08159EC8
	bl BattleStopLowHpSound
	ldr r0, _08159EEC @ =0x00000137
	bl PlayBGM
_08159EC8:
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	bl sub_80EF0E0
	bl sub_80EB524
	bl sub_8159B78
_08159EDE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08159EE8: .4byte gPaletteFade
_08159EEC: .4byte 0x00000137
	thumb_func_end sub_8159D04

	thumb_func_start sub_8159EF0
sub_8159EF0: @ 8159EF0
	push {lr}
	ldr r0, _08159F10 @ =gBattleStruct
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x96
	ldrb r1, [r1]
	cmp r1, 0x1
	beq _08159F18
	cmp r1, 0x1
	ble _08159F0C
	cmp r1, 0x2
	beq _08159F20
	cmp r1, 0x3
	beq _08159F28
_08159F0C:
	ldr r1, _08159F14 @ =gUnknown_84791A8
	b _08159F2A
	.align 2, 0
_08159F10: .4byte gBattleStruct
_08159F14: .4byte gUnknown_84791A8
_08159F18:
	ldr r1, _08159F1C @ =gUnknown_84791B8
	b _08159F2A
	.align 2, 0
_08159F1C: .4byte gUnknown_84791B8
_08159F20:
	ldr r1, _08159F24 @ =gUnknown_84791CC
	b _08159F2A
	.align 2, 0
_08159F24: .4byte gUnknown_84791CC
_08159F28:
	ldr r1, _08159F3C @ =gUnknown_84791E8
_08159F2A:
	adds r0, 0x97
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08159F3C: .4byte gUnknown_84791E8
	thumb_func_end sub_8159EF0

	.align 2, 0 @ Don't pad with nop.
