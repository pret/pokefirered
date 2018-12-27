	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_99
nullsub_99: @ 81560A0
	bx lr
	thumb_func_end nullsub_99

	thumb_func_start sub_81560A4
sub_81560A4: @ 81560A4
	ldr r1, _081560C8 @ =gUnknown_3004FE0
	ldr r0, _081560CC @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081560D0 @ =sub_81560DC
	str r1, [r0]
	ldr r2, _081560D4 @ =gBattleStruct
	ldr r0, [r2]
	adds r0, 0x96
	ldr r1, _081560D8 @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x97
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_081560C8: .4byte gUnknown_3004FE0
_081560CC: .4byte gActiveBattler
_081560D0: .4byte sub_81560DC
_081560D4: .4byte gBattleStruct
_081560D8: .4byte gSpecialVar_0x8004
	thumb_func_end sub_81560A4

	thumb_func_start sub_81560DC
sub_81560DC: @ 81560DC
	push {r4,r5,lr}
	ldr r2, _08156120 @ =gUnknown_2023BC8
	ldr r1, _08156124 @ =gBitTable
	ldr r5, _08156128 @ =gActiveBattler
	ldrb r3, [r5]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08156138
	ldr r4, _0815612C @ =gUnknown_2022BC4
	lsls r0, r3, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x38
	bhi _08156134
	bl sub_8159AB8
	lsls r0, 24
	cmp r0, 0
	bne _08156138
	ldr r1, _08156130 @ =gUnknown_8478F1C
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _08156138
	.align 2, 0
_08156120: .4byte gUnknown_2023BC8
_08156124: .4byte gBitTable
_08156128: .4byte gActiveBattler
_0815612C: .4byte gUnknown_2022BC4
_08156130: .4byte gUnknown_8478F1C
_08156134:
	bl PlayerPartnerBufferExecCompleted
_08156138:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81560DC

	thumb_func_start sub_8156140
sub_8156140: @ 8156140
	push {lr}
	bl sub_8159824
	pop {r0}
	bx r0
	thumb_func_end sub_8156140

	thumb_func_start sub_815614C
sub_815614C: @ 815614C
	push {lr}
	ldr r2, _08156174 @ =gSprites
	ldr r1, _08156178 @ =gUnknown_2023D44
	ldr r0, _0815617C @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08156180 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08156170
	bl PlayerPartnerBufferExecCompleted
_08156170:
	pop {r0}
	bx r0
	.align 2, 0
_08156174: .4byte gSprites
_08156178: .4byte gUnknown_2023D44
_0815617C: .4byte gActiveBattler
_08156180: .4byte SpriteCallbackDummy
	thumb_func_end sub_815614C

	thumb_func_start sub_8156184
sub_8156184: @ 8156184
	push {r4-r7,lr}
	ldr r2, _081561E0 @ =gSprites
	ldr r0, _081561E4 @ =gUnknown_2023D44
	ldr r7, _081561E8 @ =gActiveBattler
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r2, r0, 31
	cmp r2, 0x1
	bne _08156230
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _08156230
	ldr r6, _081561EC @ =gUnknown_2024018
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r4, r3, 1
	adds r0, r4, r3
	lsls r0, 2
	adds r1, r0, r1
	ldrb r5, [r1]
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	bne _081561F8
	ldr r0, _081561F0 @ =gBattlerPartyIndexes
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081561F4 @ =gEnemyParty
	adds r1, r0
	adds r0, r3, 0
	bl sub_80F1720
	b _08156230
	.align 2, 0
_081561E0: .4byte gSprites
_081561E4: .4byte gUnknown_2023D44
_081561E8: .4byte gActiveBattler
_081561EC: .4byte gUnknown_2024018
_081561F0: .4byte gBattlerPartyIndexes
_081561F4: .4byte gEnemyParty
_081561F8:
	ldrb r0, [r1, 0x1]
	ands r2, r0
	cmp r2, 0
	beq _08156230
	movs r0, 0x7F
	ands r0, r5
	strb r0, [r1]
	ldr r0, [r6]
	ldrb r2, [r7]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _08156238 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	bl PlayerPartnerBufferExecCompleted
_08156230:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08156238: .4byte 0x000027f9
	thumb_func_end sub_8156184

	thumb_func_start sub_815623C
sub_815623C: @ 815623C
	push {lr}
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _0815624E
	bl PlayerPartnerBufferExecCompleted
_0815624E:
	pop {r0}
	bx r0
	thumb_func_end sub_815623C

	thumb_func_start sub_8156254
sub_8156254: @ 8156254
	push {lr}
	ldr r0, _08156284 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0815627E
	ldr r2, _08156288 @ =gMain
	ldr r0, _0815628C @ =0x00000439
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _08156290 @ =gUnknown_3004F80
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_0815627E:
	pop {r0}
	bx r0
	.align 2, 0
_08156284: .4byte gPaletteFade
_08156288: .4byte gMain
_0815628C: .4byte 0x00000439
_08156290: .4byte gUnknown_3004F80
	thumb_func_end sub_8156254

	thumb_func_start sub_8156294
sub_8156294: @ 8156294
	push {r4,lr}
	ldr r0, _081562DC @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r4, _081562E0 @ =gActiveBattler
	ldrb r1, [r4]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _081562D4
	ldr r0, _081562E4 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	ldr r2, _081562E8 @ =gBattlerPartyIndexes
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081562EC @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	bl PlayerPartnerBufferExecCompleted
_081562D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081562DC: .4byte gUnknown_2024018
_081562E0: .4byte gActiveBattler
_081562E4: .4byte c3_0802FDF4
_081562E8: .4byte gBattlerPartyIndexes
_081562EC: .4byte gPlayerParty
	thumb_func_end sub_8156294

	thumb_func_start sub_81562F0
sub_81562F0: @ 81562F0
	push {r4-r6,lr}
	ldr r2, _08156388 @ =gSprites
	ldr r0, _0815638C @ =gUnknown_3004FF0
	ldr r6, _08156390 @ =gActiveBattler
	ldrb r3, [r6]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08156394 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08156380
	ldr r5, _08156398 @ =gUnknown_2024018
	ldr r0, [r5]
	ldr r1, [r0, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r1
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08156380
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldrb r2, [r6]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _0815639C @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, [r5]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08156374
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl InitAndLaunchSpecialAnimation
_08156374:
	ldr r0, _081563A0 @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _081563A4 @ =sub_8156294
	str r0, [r1]
_08156380:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08156388: .4byte gSprites
_0815638C: .4byte gUnknown_3004FF0
_08156390: .4byte gActiveBattler
_08156394: .4byte SpriteCallbackDummy
_08156398: .4byte gUnknown_2024018
_0815639C: .4byte 0x000027f9
_081563A0: .4byte gUnknown_3004FE0
_081563A4: .4byte sub_8156294
	thumb_func_end sub_81562F0

	thumb_func_start sub_81563A8
sub_81563A8: @ 81563A8
	push {r4-r6,lr}
	ldr r6, _0815645C @ =gUnknown_2024018
	ldr r0, [r6]
	ldr r5, _08156460 @ =gActiveBattler
	ldrb r2, [r5]
	ldr r1, [r0, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _081563DA
	ldr r0, _08156464 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08156468 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_081563DA:
	ldr r4, _0815646C @ =gSprites
	ldr r0, _08156470 @ =gUnknown_3004FFC
	ldrb r2, [r5]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r0, r4, 0
	adds r0, 0x1C
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _08156474 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08156454
	ldr r0, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08156454
	adds r0, r3, r4
	bl DestroySprite
	ldr r4, _08156478 @ =gUnknown_3004FF0
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08156464 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08156468 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	bl sub_804BD94
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldrb r0, [r5]
	bl CopyBattleSpriteInvisibility
	ldr r1, _0815647C @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08156480 @ =sub_81562F0
	str r1, [r0]
_08156454:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0815645C: .4byte gUnknown_2024018
_08156460: .4byte gActiveBattler
_08156464: .4byte gBattlerPartyIndexes
_08156468: .4byte gPlayerParty
_0815646C: .4byte gSprites
_08156470: .4byte gUnknown_3004FFC
_08156474: .4byte SpriteCallbackDummy
_08156478: .4byte gUnknown_3004FF0
_0815647C: .4byte gUnknown_3004FE0
_08156480: .4byte sub_81562F0
	thumb_func_end sub_81563A8

	thumb_func_start sub_8156484
sub_8156484: @ 8156484
	push {lr}
	ldr r0, _08156498 @ =gUnknown_2024005
	ldrb r0, [r0]
	cmp r0, 0
	bne _08156492
	bl PlayerPartnerBufferExecCompleted
_08156492:
	pop {r0}
	bx r0
	.align 2, 0
_08156498: .4byte gUnknown_2024005
	thumb_func_end sub_8156484

	thumb_func_start sub_815649C
sub_815649C: @ 815649C
	push {r4,lr}
	ldr r4, _081564DC @ =gUnknown_2024018
	ldr r1, [r4]
	ldr r3, _081564E0 @ =gActiveBattler
	ldrb r0, [r3]
	ldr r2, [r1, 0x4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x9]
	subs r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _081564D4
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x9]
	bl PlayerPartnerBufferExecCompleted
_081564D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081564DC: .4byte gUnknown_2024018
_081564E0: .4byte gActiveBattler
	thumb_func_end sub_815649C

	thumb_func_start sub_81564E4
sub_81564E4: @ 81564E4
	push {lr}
	bl sub_8159998
	pop {r0}
	bx r0
	thumb_func_end sub_81564E4

	thumb_func_start sub_81564F0
sub_81564F0: @ 81564F0
	push {lr}
	ldr r0, _08156524 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08156520
	ldr r1, _08156528 @ =gUnknown_3004FE0
	ldr r2, _0815652C @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08156530 @ =sub_8156538
	str r1, [r0]
	ldr r1, _08156534 @ =gUnknown_3004FFC
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	bl DestroyTask
	bl FreeAllWindowBuffers
	bl sub_8127968
_08156520:
	pop {r0}
	bx r0
	.align 2, 0
_08156524: .4byte gPaletteFade
_08156528: .4byte gUnknown_3004FE0
_0815652C: .4byte gActiveBattler
_08156530: .4byte sub_8156538
_08156534: .4byte gUnknown_3004FFC
	thumb_func_end sub_81564F0

	thumb_func_start sub_8156538
sub_8156538: @ 8156538
	push {lr}
	ldr r0, _08156568 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0815656C @ =sub_8011100
	cmp r1, r0
	bne _0815658E
	ldr r0, _08156570 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0815658E
	ldr r0, _08156574 @ =gUnknown_203B0C0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08156580
	ldr r0, _08156578 @ =gUnknown_203B0C1
	ldrb r1, [r0]
	ldr r2, _0815657C @ =gUnknown_203B0DC
	movs r0, 0x1
	bl EmitChosenMonReturnValue
	b _0815658A
	.align 2, 0
_08156568: .4byte gMain
_0815656C: .4byte sub_8011100
_08156570: .4byte gPaletteFade
_08156574: .4byte gUnknown_203B0C0
_08156578: .4byte gUnknown_203B0C1
_0815657C: .4byte gUnknown_203B0DC
_08156580:
	movs r0, 0x1
	movs r1, 0x6
	movs r2, 0
	bl EmitChosenMonReturnValue
_0815658A:
	bl PlayerPartnerBufferExecCompleted
_0815658E:
	pop {r0}
	bx r0
	thumb_func_end sub_8156538

	thumb_func_start sub_8156594
sub_8156594: @ 8156594
	push {lr}
	ldr r0, _081565C8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081565E2
	ldr r1, _081565CC @ =gUnknown_3004FE0
	ldr r0, _081565D0 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081565D4 @ =sub_81565E8
	str r1, [r0]
	bl nullsub_44
	bl FreeAllWindowBuffers
	ldr r0, _081565D8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _081565C4
	cmp r0, 0x3
	beq _081565DC
_081565C4:
	movs r0, 0x7
	b _081565DE
	.align 2, 0
_081565C8: .4byte gPaletteFade
_081565CC: .4byte gUnknown_3004FE0
_081565D0: .4byte gActiveBattler
_081565D4: .4byte sub_81565E8
_081565D8: .4byte gSpecialVar_0x8004
_081565DC:
	movs r0, 0x8
_081565DE:
	bl sub_810B108
_081565E2:
	pop {r0}
	bx r0
	thumb_func_end sub_8156594

	thumb_func_start sub_81565E8
sub_81565E8: @ 81565E8
	push {lr}
	ldr r0, _08156614 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _08156618 @ =sub_8011100
	cmp r1, r0
	bne _0815660E
	ldr r0, _0815661C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0815660E
	ldr r0, _08156620 @ =gSpecialVar_ItemId
	ldrh r1, [r0]
	movs r0, 0x1
	bl EmitOneReturnValue
	bl PlayerPartnerBufferExecCompleted
_0815660E:
	pop {r0}
	bx r0
	.align 2, 0
_08156614: .4byte gMain
_08156618: .4byte sub_8011100
_0815661C: .4byte gPaletteFade
_08156620: .4byte gSpecialVar_ItemId
	thumb_func_end sub_81565E8

	thumb_func_start sub_8156624
sub_8156624: @ 8156624
	push {r4-r7,lr}
	ldr r4, _08156788 @ =gUnknown_2024018
	ldr r0, [r4]
	ldr r5, _0815678C @ =gActiveBattler
	ldrb r2, [r5]
	ldr r1, [r0, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r7, 0x88
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _08156658
	ldr r0, _08156790 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08156794 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_08156658:
	ldr r1, [r4]
	ldrb r0, [r5]
	movs r6, 0x2
	adds r2, r6, 0
	eors r2, r0
	ldr r1, [r1, 0x4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _0815668A
	ldr r0, _08156790 @ =gBattlerPartyIndexes
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08156794 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_80F1720
_0815668A:
	ldr r0, [r4]
	ldrb r2, [r5]
	ldr r3, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0]
	movs r4, 0x8
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _08156780
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _08156780
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _0815671E
	ldr r0, _08156798 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0815671E
	ldr r1, _0815679C @ =gUnknown_3004FFC
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081567A0 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _081567A4 @ =gUnknown_3004FF0
	ldrb r0, [r5]
	adds r1, r6, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08156790 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08156794 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r5]
	eors r0, r6
	bl sub_804BD94
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_0815671E:
	ldr r1, _0815679C @ =gUnknown_3004FFC
	ldr r4, _0815678C @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081567A0 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _081567A4 @ =gUnknown_3004FF0
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08156790 @ =gBattlerPartyIndexes
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08156794 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_804BD94
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r0, _08156788 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r2, [r0, 0x8]
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _081567A8 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081567AC @ =sub_81567B0
	str r1, [r0]
_08156780:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08156788: .4byte gUnknown_2024018
_0815678C: .4byte gActiveBattler
_08156790: .4byte gBattlerPartyIndexes
_08156794: .4byte gPlayerParty
_08156798: .4byte gBattleTypeFlags
_0815679C: .4byte gUnknown_3004FFC
_081567A0: .4byte gSprites
_081567A4: .4byte gUnknown_3004FF0
_081567A8: .4byte gUnknown_3004FE0
_081567AC: .4byte sub_81567B0
	thumb_func_end sub_8156624

	thumb_func_start sub_81567B0
sub_81567B0: @ 81567B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r2, _081568B0 @ =gSprites
	ldr r0, _081568B4 @ =gUnknown_3004FF0
	ldr r1, _081568B8 @ =gActiveBattler
	mov r8, r1
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _081568BC @ =SpriteCallbackDummy
	cmp r1, r0
	bne _081567DA
	movs r4, 0x1
_081567DA:
	cmp r4, 0
	beq _081568A6
	ldr r7, _081568C0 @ =gUnknown_2024018
	ldr r0, [r7]
	ldr r4, [r0, 0x4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r4
	ldrb r1, [r2, 0x1]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _081568A6
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _081568A6
	ldrb r1, [r2]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r7]
	mov r1, r8
	ldrb r2, [r1]
	ldr r0, [r0, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x1]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r2, [r7]
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r6, 0
	eors r1, r0
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	ldr r2, [r7]
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r6, 0
	eors r1, r0
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldr r4, _081568C4 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _081568C8 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	ldr r2, _081568CC @ =gBattlerPartyIndexes
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081568D0 @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	ldr r1, _081568D4 @ =gUnknown_3004FE0
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081568D8 @ =sub_815649C
	str r1, [r0]
_081568A6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081568B0: .4byte gSprites
_081568B4: .4byte gUnknown_3004FF0
_081568B8: .4byte gActiveBattler
_081568BC: .4byte SpriteCallbackDummy
_081568C0: .4byte gUnknown_2024018
_081568C4: .4byte 0x000027f9
_081568C8: .4byte c3_0802FDF4
_081568CC: .4byte gBattlerPartyIndexes
_081568D0: .4byte gPlayerParty
_081568D4: .4byte gUnknown_3004FE0
_081568D8: .4byte sub_815649C
	thumb_func_end sub_81567B0

	thumb_func_start sub_81568DC
sub_81568DC: @ 81568DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _081569DC @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	mov r8, r0
	ldrb r0, [r0, 0x8]
	mov r10, r0
	mov r1, r8
	ldrb r7, [r1, 0xC]
	str r7, [sp, 0x8]
	ldrh r2, [r1, 0xA]
	str r2, [sp, 0xC]
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08156922
	ldr r1, _081569E0 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r10, r0
	bne _08156922
	b _08156A38
_08156922:
	movs r0, 0x64
	mov r1, r10
	muls r1, r0
	ldr r0, _081569E4 @ =gPlayerParty
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x4]
	ldr r3, _081569E8 @ =gExperienceTables
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _081569EC @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x13]
	movs r1, 0xCA
	lsls r1, 1
	muls r1, r2
	adds r4, r1
	adds r4, r3
	ldr r2, [r4]
	str r2, [sp]
	ldr r3, [sp, 0xC]
	lsls r1, r3, 16
	asrs r1, 16
	adds r0, r1
	cmp r0, r2
	bcc _08156A10
	adds r0, r6, 0
	movs r1, 0x19
	mov r2, sp
	bl SetMonData
	adds r0, r6, 0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r2, r0
	ldr r0, [sp, 0xC]
	subs r2, r0, r2
	ldr r4, _081569F0 @ =gActiveBattler
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r1, 0xB
	bl EmitTwoReturnValues
	strb r5, [r4]
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081569F8
	ldr r2, _081569E0 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r2
	mov r1, r10
	ldrh r0, [r0]
	cmp r1, r0
	beq _081569D6
	movs r0, 0x2
	eors r7, r0
	lsls r0, r7, 1
	adds r0, r2
	ldrh r0, [r0]
	cmp r1, r0
	bne _081569F8
_081569D6:
	ldr r0, _081569F4 @ =sub_8156C68
	b _08156A3A
	.align 2, 0
_081569DC: .4byte gTasks
_081569E0: .4byte gBattlerPartyIndexes
_081569E4: .4byte gPlayerParty
_081569E8: .4byte gExperienceTables
_081569EC: .4byte gBaseStats
_081569F0: .4byte gActiveBattler
_081569F4: .4byte sub_8156C68
_081569F8:
	ldr r0, _08156A08 @ =gTasks
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldr r0, _08156A0C @ =sub_8156D80
	b _08156A3C
	.align 2, 0
_08156A08: .4byte gTasks
_08156A0C: .4byte sub_8156D80
_08156A10:
	str r0, [sp, 0x4]
	add r2, sp, 0x4
	adds r0, r6, 0
	movs r1, 0x19
	bl SetMonData
	ldr r1, _08156A30 @ =gUnknown_3004FE0
	ldr r3, [sp, 0x8]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, _08156A34 @ =sub_8156EE8
	str r1, [r0]
	mov r0, r9
	bl DestroyTask
	b _08156A3E
	.align 2, 0
_08156A30: .4byte gUnknown_3004FE0
_08156A34: .4byte sub_8156EE8
_08156A38:
	ldr r0, _08156A50 @ =sub_8156A54
_08156A3A:
	mov r1, r8
_08156A3C:
	str r0, [r1]
_08156A3E:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08156A50: .4byte sub_8156A54
	thumb_func_end sub_81568DC

	thumb_func_start sub_8156A54
sub_8156A54: @ 8156A54
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08156B0C @ =gTasks
	lsls r2, r0, 2
	mov r8, r2
	add r8, r0
	mov r0, r8
	lsls r0, 3
	mov r8, r0
	add r8, r1
	mov r2, r8
	ldrb r1, [r2, 0x8]
	movs r0, 0xA
	ldrsh r2, [r2, r0]
	mov r9, r2
	mov r2, r8
	ldrb r2, [r2, 0xC]
	mov r10, r2
	movs r0, 0x64
	adds r6, r1, 0
	muls r6, r0
	ldr r0, _08156B10 @ =gPlayerParty
	adds r6, r0
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x19
	bl GetMonData
	adds r3, r0, 0
	ldr r6, _08156B14 @ =gExperienceTables
	lsls r1, r4, 2
	ldr r2, _08156B18 @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r6
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	adds r4, r6
	ldr r2, [r4]
	subs r2, r1
	ldr r0, _08156B1C @ =gUnknown_3004FF0
	add r0, r10
	ldrb r1, [r0]
	mov r0, r9
	negs r0, r0
	str r0, [sp]
	mov r0, r10
	bl SetBattleBarStruct
	movs r0, 0x1B
	bl PlaySE
	ldr r0, _08156B20 @ =sub_8156B24
	mov r1, r8
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08156B0C: .4byte gTasks
_08156B10: .4byte gPlayerParty
_08156B14: .4byte gExperienceTables
_08156B18: .4byte gBaseStats
_08156B1C: .4byte gUnknown_3004FF0
_08156B20: .4byte sub_8156B24
	thumb_func_end sub_8156A54

	thumb_func_start sub_8156B24
sub_8156B24: @ 8156B24
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08156B50 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r6, r0, r1
	ldrh r1, [r6, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r6, r2]
	cmp r0, 0xC
	bgt _08156B54
	adds r0, r1, 0x1
	strh r0, [r6, 0x1C]
	b _08156C50
	.align 2, 0
_08156B50: .4byte gTasks
_08156B54:
	ldrb r0, [r6, 0x8]
	mov r9, r0
	ldrh r2, [r6, 0xA]
	mov r10, r2
	ldrb r7, [r6, 0xC]
	ldr r5, _08156C1C @ =gUnknown_3004FF0
	adds r5, r7, r5
	ldrb r1, [r5]
	adds r0, r7, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8049FD8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	bl SetHealthboxSpriteVisible
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _08156C50
	movs r0, 0x1B
	bl m4aSongNumStop
	movs r0, 0x64
	mov r1, r9
	muls r1, r0
	ldr r0, _08156C20 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _08156C24 @ =gExperienceTables
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _08156C28 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	adds r4, r0
	adds r4, r3
	ldr r1, [r4]
	str r1, [sp]
	mov r2, r10
	lsls r0, r2, 16
	asrs r4, r0, 16
	ldr r0, [sp, 0x4]
	adds r0, r4
	cmp r0, r1
	blt _08156C34
	adds r0, r5, 0
	movs r1, 0x19
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r2, r0
	subs r2, r4, r2
	ldr r4, _08156C2C @ =gActiveBattler
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r1, 0xB
	bl EmitTwoReturnValues
	strb r5, [r4]
	ldr r0, _08156C30 @ =sub_8156C68
	str r0, [r6]
	b _08156C50
	.align 2, 0
_08156C1C: .4byte gUnknown_3004FF0
_08156C20: .4byte gPlayerParty
_08156C24: .4byte gExperienceTables
_08156C28: .4byte gBaseStats
_08156C2C: .4byte gActiveBattler
_08156C30: .4byte sub_8156C68
_08156C34:
	str r0, [sp, 0x4]
	add r2, sp, 0x4
	adds r0, r5, 0
	movs r1, 0x19
	bl SetMonData
	ldr r1, _08156C60 @ =gUnknown_3004FE0
	lsls r0, r7, 2
	adds r0, r1
	ldr r1, _08156C64 @ =sub_8156EE8
	str r1, [r0]
	mov r0, r8
	bl DestroyTask
_08156C50:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08156C60: .4byte gUnknown_3004FE0
_08156C64: .4byte sub_8156EE8
	thumb_func_end sub_8156B24

	thumb_func_start sub_8156C68
sub_8156C68: @ 8156C68
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08156CBC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0xC]
	ldrb r6, [r0, 0x8]
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08156C9C
	ldr r1, _08156CC0 @ =gBattlerPartyIndexes
	movs r0, 0x2
	adds r2, r4, 0
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bne _08156C9C
	adds r4, r2, 0
_08156C9C:
	adds r0, r4, 0
	adds r1, r4, 0
	adds r2, r4, 0
	movs r3, 0
	bl InitAndLaunchSpecialAnimation
	ldr r0, _08156CBC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08156CC4 @ =sub_8156CC8
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08156CBC: .4byte gTasks
_08156CC0: .4byte gBattlerPartyIndexes
_08156CC4: .4byte sub_8156CC8
	thumb_func_end sub_8156C68

	thumb_func_start sub_8156CC8
sub_8156CC8: @ 8156CC8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08156D34 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r2, r0, r1
	ldrb r5, [r2, 0xC]
	ldr r0, _08156D38 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08156D6A
	ldrb r4, [r2, 0x8]
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _08156D3C @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x38
	bl GetMonData
	bl sub_8075290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08156D48
	ldr r1, _08156D40 @ =gBattlerPartyIndexes
	movs r0, 0x2
	adds r2, r5, 0
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _08156D48
	ldr r0, _08156D44 @ =gUnknown_3004FF0
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, r7, 0
	movs r2, 0
	bl UpdateHealthboxAttribute
	b _08156D5C
	.align 2, 0
_08156D34: .4byte gTasks
_08156D38: .4byte gUnknown_2024018
_08156D3C: .4byte gPlayerParty
_08156D40: .4byte gBattlerPartyIndexes
_08156D44: .4byte gUnknown_3004FF0
_08156D48:
	ldr r0, _08156D70 @ =gUnknown_3004FF0
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0x64
	muls r1, r4
	ldr r2, _08156D74 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
_08156D5C:
	ldr r0, _08156D78 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08156D7C @ =sub_8156D80
	str r0, [r1]
_08156D6A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08156D70: .4byte gUnknown_3004FF0
_08156D74: .4byte gPlayerParty
_08156D78: .4byte gTasks
_08156D7C: .4byte sub_8156D80
	thumb_func_end sub_8156CC8

	thumb_func_start sub_8156D80
sub_8156D80: @ 8156D80
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08156DBC @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r1, [r4, 0x8]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08156DC0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	ldrb r0, [r4, 0xC]
	ldr r1, _08156DC4 @ =gUnknown_3004FE0
	lsls r0, 2
	adds r0, r1
	ldr r1, _08156DC8 @ =sub_8156EE8
	str r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08156DBC: .4byte gTasks
_08156DC0: .4byte gPlayerParty
_08156DC4: .4byte gUnknown_3004FE0
_08156DC8: .4byte sub_8156EE8
	thumb_func_end sub_8156D80

	thumb_func_start sub_8156DCC
sub_8156DCC: @ 8156DCC
	push {r4-r6,lr}
	ldr r4, _08156E2C @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08156E3C
	ldr r6, _08156E30 @ =gSprites
	ldr r5, _08156E34 @ =gUnknown_2023D44
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r6
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	cmp r0, 0xA0
	ble _08156E66
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	ldr r1, _08156E38 @ =gUnknown_3004FF0
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerPartnerBufferExecCompleted
	b _08156E66
	.align 2, 0
_08156E2C: .4byte gActiveBattler
_08156E30: .4byte gSprites
_08156E34: .4byte gUnknown_2023D44
_08156E38: .4byte gUnknown_3004FF0
_08156E3C:
	ldr r2, _08156E6C @ =gSprites
	ldr r0, _08156E70 @ =gUnknown_2023D44
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _08156E66
	ldr r0, _08156E74 @ =gUnknown_3004FF0
	adds r0, r3, r0
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerPartnerBufferExecCompleted
_08156E66:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08156E6C: .4byte gSprites
_08156E70: .4byte gUnknown_2023D44
_08156E74: .4byte gUnknown_3004FF0
	thumb_func_end sub_8156DCC

	thumb_func_start sub_8156E78
sub_8156E78: @ 8156E78
	push {r4-r6,lr}
	ldr r5, _08156EB8 @ =gActiveBattler
	ldrb r0, [r5]
	ldr r6, _08156EBC @ =gUnknown_3004FF0
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8049FD8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08156EC0
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl sub_8048440
	b _08156EDA
	.align 2, 0
_08156EB8: .4byte gActiveBattler
_08156EBC: .4byte gUnknown_3004FF0
_08156EC0:
	ldr r2, _08156EE0 @ =gBattlerPartyIndexes
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08156EE4 @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	bl PlayerPartnerBufferExecCompleted
_08156EDA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08156EE0: .4byte gBattlerPartyIndexes
_08156EE4: .4byte gPlayerParty
	thumb_func_end sub_8156E78

	thumb_func_start sub_8156EE8
sub_8156EE8: @ 8156EE8
	push {lr}
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	cmp r0, 0
	bne _08156EFA
	bl PlayerPartnerBufferExecCompleted
_08156EFA:
	pop {r0}
	bx r0
	thumb_func_end sub_8156EE8

	thumb_func_start sub_8156F00
sub_8156F00: @ 8156F00
	push {r4,lr}
	ldr r1, _08156F3C @ =gUnknown_2023D44
	ldr r0, _08156F40 @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _08156F44 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _08156F4C
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08156F48 @ =gUnknown_2024005
	strb r3, [r0]
	bl PlayerPartnerBufferExecCompleted
	b _08156F76
	.align 2, 0
_08156F3C: .4byte gUnknown_2023D44
_08156F40: .4byte gActiveBattler
_08156F44: .4byte gSprites
_08156F48: .4byte gUnknown_2024005
_08156F4C:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08156F70
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
_08156F70:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_08156F76:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8156F00

	thumb_func_start sub_8156F7C
sub_8156F7C: @ 8156F7C
	push {r4-r6,lr}
	ldr r0, _08156FD8 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r6, _08156FDC @ =gActiveBattler
	ldrb r2, [r6]
	ldr r1, [r0, 0x4]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08156FD0
	ldr r5, _08156FE0 @ =gUnknown_2023D44
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08156FE4 @ =gSprites
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
	ldr r1, _08156FE8 @ =gUnknown_3004FF0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerPartnerBufferExecCompleted
_08156FD0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08156FD8: .4byte gUnknown_2024018
_08156FDC: .4byte gActiveBattler
_08156FE0: .4byte gUnknown_2023D44
_08156FE4: .4byte gSprites
_08156FE8: .4byte gUnknown_3004FF0
	thumb_func_end sub_8156F7C

	thumb_func_start sub_8156FEC
sub_8156FEC: @ 8156FEC
	push {lr}
	ldr r2, _08157014 @ =gSprites
	ldr r1, _08157018 @ =gUnknown_2023D44
	ldr r0, _0815701C @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08157020 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08157010
	bl PlayerPartnerBufferExecCompleted
_08157010:
	pop {r0}
	bx r0
	.align 2, 0
_08157014: .4byte gSprites
_08157018: .4byte gUnknown_2023D44
_0815701C: .4byte gActiveBattler
_08157020: .4byte SpriteCallbackDummy
	thumb_func_end sub_8156FEC

	thumb_func_start sub_8157024
sub_8157024: @ 8157024
	push {lr}
	ldr r0, _0815704C @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _08157050 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08157046
	bl PlayerPartnerBufferExecCompleted
_08157046:
	pop {r0}
	bx r0
	.align 2, 0
_0815704C: .4byte gUnknown_2024018
_08157050: .4byte gActiveBattler
	thumb_func_end sub_8157024

	thumb_func_start sub_8157054
sub_8157054: @ 8157054
	push {lr}
	ldr r0, _0815707C @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _08157080 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08157076
	bl PlayerPartnerBufferExecCompleted
_08157076:
	pop {r0}
	bx r0
	.align 2, 0
_0815707C: .4byte gUnknown_2024018
_08157080: .4byte gActiveBattler
	thumb_func_end sub_8157054

	thumb_func_start PlayerPartnerBufferExecCompleted
PlayerPartnerBufferExecCompleted: @ 8157084
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _081570C4 @ =gUnknown_3004FE0
	ldr r4, _081570C8 @ =gActiveBattler
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081570CC @ =sub_81560DC
	str r1, [r0]
	ldr r0, _081570D0 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081570D8
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _081570D4 @ =gUnknown_2022BC4
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _081570EA
	.align 2, 0
_081570C4: .4byte gUnknown_3004FE0
_081570C8: .4byte gActiveBattler
_081570CC: .4byte sub_81560DC
_081570D0: .4byte gBattleTypeFlags
_081570D4: .4byte gUnknown_2022BC4
_081570D8:
	ldr r2, _081570F4 @ =gUnknown_2023BC8
	ldr r1, _081570F8 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_081570EA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081570F4: .4byte gUnknown_2023BC8
_081570F8: .4byte gBitTable
	thumb_func_end PlayerPartnerBufferExecCompleted

	thumb_func_start CompleteOnFinishedStatusAnimation_7
CompleteOnFinishedStatusAnimation_7: @ 81570FC
	push {lr}
	ldr r0, _08157124 @ =gUnknown_2024018
	ldr r2, [r0]
	ldr r0, _08157128 @ =gActiveBattler
	ldrb r1, [r0]
	ldr r2, [r2, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0815711E
	bl PlayerPartnerBufferExecCompleted
_0815711E:
	pop {r0}
	bx r0
	.align 2, 0
_08157124: .4byte gUnknown_2024018
_08157128: .4byte gActiveBattler
	thumb_func_end CompleteOnFinishedStatusAnimation_7

	thumb_func_start sub_815712C
sub_815712C: @ 815712C
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _08157158 @ =gUnknown_2022BC4
	ldr r0, _0815715C @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _08157164
	ldr r0, _08157160 @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl sub_81571A0
	adds r6, r0, 0
	b _08157186
	.align 2, 0
_08157158: .4byte gUnknown_2022BC4
_0815715C: .4byte gActiveBattler
_08157160: .4byte gBattlerPartyIndexes
_08157164:
	ldrb r4, [r1]
	movs r5, 0
_08157168:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0815717E
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl sub_81571A0
	adds r6, r0
_0815717E:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _08157168
_08157186:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl EmitDataTransfer
	bl PlayerPartnerBufferExecCompleted
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_815712C

	thumb_func_start sub_81571A0
sub_81571A0: @ 81571A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8C
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _081571CC @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _081571D4
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _081571D0 @ =gPlayerParty
	b _081571DC
	.align 2, 0
_081571CC: .4byte gActiveBattler
_081571D0: .4byte gPlayerParty
_081571D4:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _081571FC @ =gEnemyParty
_081571DC:
	adds r6, r1, r0
	ldr r3, _08157200 @ =gUnknown_2022BC4
	ldr r2, _08157204 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 9
	adds r1, r3, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _081571F2
	b _0815773C
_081571F2:
	lsls r0, 2
	ldr r1, _08157208 @ =_0815720C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081571FC: .4byte gEnemyParty
_08157200: .4byte gUnknown_2022BC4
_08157204: .4byte gActiveBattler
_08157208: .4byte _0815720C
	.align 2, 0
_0815720C:
	.4byte _081572FC
	.4byte _08157508
	.4byte _0815750E
	.4byte _08157514
	.4byte _08157564
	.4byte _08157564
	.4byte _08157564
	.4byte _08157564
	.4byte _08157574
	.4byte _0815759A
	.4byte _0815759A
	.4byte _0815759A
	.4byte _0815759A
	.4byte _0815773C
	.4byte _0815773C
	.4byte _0815773C
	.4byte _0815773C
	.4byte _081575AA
	.4byte _081575B0
	.4byte _081575D4
	.4byte _081575DA
	.4byte _081575E0
	.4byte _081575E6
	.4byte _081575EC
	.4byte _081575F2
	.4byte _081575F8
	.4byte _081575FE
	.4byte _08157604
	.4byte _0815760A
	.4byte _08157610
	.4byte _08157616
	.4byte _0815761C
	.4byte _0815765C
	.4byte _08157662
	.4byte _08157668
	.4byte _0815766E
	.4byte _08157674
	.4byte _0815767A
	.4byte _08157680
	.4byte _08157686
	.4byte _0815768C
	.4byte _081576B4
	.4byte _081576BA
	.4byte _081576C0
	.4byte _081576C6
	.4byte _081576CC
	.4byte _081576D2
	.4byte _081576D8
	.4byte _081576DE
	.4byte _081576F4
	.4byte _081576FA
	.4byte _08157700
	.4byte _08157706
	.4byte _0815770C
	.4byte _08157712
	.4byte _08157718
	.4byte _0815771E
	.4byte _08157724
	.4byte _0815772A
	.4byte _08157730
_081572FC:
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r6, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r4, 0
	add r0, sp, 0x24
	mov r8, r0
	movs r1, 0x3B
	add r1, sp
	mov r9, r1
	movs r2, 0x2B
	add r2, sp
	mov r10, r2
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x88]
	mov r2, sp
	adds r2, 0x30
	str r2, [sp, 0x80]
	adds r0, 0x12
	str r0, [sp, 0x84]
	add r5, sp, 0xC
_0815733E:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	strh r0, [r5]
	adds r1, r4, 0
	adds r1, 0x11
	adds r0, r6, 0
	bl GetMonData
	mov r2, r8
	adds r1, r2, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0815733E
	adds r0, r6, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x20
	bl GetMonData
	mov r2, r10
	strb r0, [r2]
	adds r0, r6, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r6, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r4, 0x1F
	ands r0, r4
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r6, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _081574FC @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r6, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r4
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r6, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _08157500 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r6, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _08157504 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r6, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r4
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r6, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r6, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r6, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r6, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r6, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r6, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r6, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r6, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r6, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r6, 0
	movs r1, 0x2
	ldr r2, [sp, 0x88]
	bl GetMonData
	ldr r0, [sp, 0x80]
	ldr r1, [sp, 0x88]
	bl StringCopy10
	adds r0, r6, 0
	movs r1, 0x7
	ldr r2, [sp, 0x84]
	bl GetMonData
	mov r2, sp
	movs r4, 0
_081574EC:
	adds r0, r7, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x57
	bls _081574EC
	b _0815773C
	.align 2, 0
_081574FC: .4byte 0xfffffc1f
_08157500: .4byte 0xfff07fff
_08157504: .4byte 0xfffffe0f
_08157508:
	adds r0, r6, 0
	movs r1, 0xB
	b _081576E2
_0815750E:
	adds r0, r6, 0
	movs r1, 0xC
	b _081576E2
_08157514:
	movs r4, 0
	add r2, sp, 0x58
	mov r8, r2
	add r0, sp, 0x60
	mov r9, r0
	mov r5, r8
_08157520:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	strh r0, [r5]
	adds r1, r4, 0
	adds r1, 0x11
	adds r0, r6, 0
	bl GetMonData
	mov r2, r9
	adds r1, r2, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _08157520
	adds r0, r6, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r8
	strb r0, [r1, 0xC]
	mov r2, r8
	movs r4, 0
_08157554:
	adds r0, r7, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0xF
	bls _08157554
	b _0815773C
_08157564:
	ldrb r0, [r2]
	lsls r0, 9
	adds r1, r3, 0x1
	adds r0, r1
	ldrb r1, [r0]
	adds r1, 0x9
	adds r0, r6, 0
	b _081576E2
_08157574:
	movs r4, 0
_08157576:
	adds r1, r4, 0
	adds r1, 0x11
	adds r0, r6, 0
	bl GetMonData
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _08157576
	adds r0, r6, 0
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, 0x1
	b _0815773C
_0815759A:
	ldrb r0, [r2]
	lsls r0, 9
	adds r1, r3, 0x1
	adds r0, r1
	ldrb r1, [r0]
	adds r1, 0x8
	adds r0, r6, 0
	b _08157734
_081575AA:
	adds r0, r6, 0
	movs r1, 0x1
	b _081575B4
_081575B0:
	adds r0, r6, 0
	movs r1, 0x19
_081575B4:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r4, 0x3
	b _0815773C
_081575D4:
	adds r0, r6, 0
	movs r1, 0x1A
	b _08157734
_081575DA:
	adds r0, r6, 0
	movs r1, 0x1B
	b _08157734
_081575E0:
	adds r0, r6, 0
	movs r1, 0x1C
	b _08157734
_081575E6:
	adds r0, r6, 0
	movs r1, 0x1D
	b _08157734
_081575EC:
	adds r0, r6, 0
	movs r1, 0x1E
	b _08157734
_081575F2:
	adds r0, r6, 0
	movs r1, 0x1F
	b _08157734
_081575F8:
	adds r0, r6, 0
	movs r1, 0x20
	b _08157734
_081575FE:
	adds r0, r6, 0
	movs r1, 0x22
	b _08157734
_08157604:
	adds r0, r6, 0
	movs r1, 0x23
	b _08157734
_0815760A:
	adds r0, r6, 0
	movs r1, 0x24
	b _08157734
_08157610:
	adds r0, r6, 0
	movs r1, 0x25
	b _08157734
_08157616:
	adds r0, r6, 0
	movs r1, 0x26
	b _08157734
_0815761C:
	adds r0, r6, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r6, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r6, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r6, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r6, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r6, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r4, 0x6
	b _0815773C
_0815765C:
	adds r0, r6, 0
	movs r1, 0x27
	b _08157734
_08157662:
	adds r0, r6, 0
	movs r1, 0x28
	b _08157734
_08157668:
	adds r0, r6, 0
	movs r1, 0x29
	b _08157734
_0815766E:
	adds r0, r6, 0
	movs r1, 0x2A
	b _08157734
_08157674:
	adds r0, r6, 0
	movs r1, 0x2B
	b _08157734
_0815767A:
	adds r0, r6, 0
	movs r1, 0x2C
	b _08157734
_08157680:
	adds r0, r6, 0
	movs r1, 0
	b _08157690
_08157686:
	adds r0, r6, 0
	movs r1, 0x9
	b _081576E2
_0815768C:
	adds r0, r6, 0
	movs r1, 0x37
_08157690:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r4, 0x4
	b _0815773C
_081576B4:
	adds r0, r6, 0
	movs r1, 0x38
	b _08157734
_081576BA:
	adds r0, r6, 0
	movs r1, 0x39
	b _081576E2
_081576C0:
	adds r0, r6, 0
	movs r1, 0x3A
	b _081576E2
_081576C6:
	adds r0, r6, 0
	movs r1, 0x3B
	b _081576E2
_081576CC:
	adds r0, r6, 0
	movs r1, 0x3C
	b _081576E2
_081576D2:
	adds r0, r6, 0
	movs r1, 0x3D
	b _081576E2
_081576D8:
	adds r0, r6, 0
	movs r1, 0x3E
	b _081576E2
_081576DE:
	adds r0, r6, 0
	movs r1, 0x3F
_081576E2:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r4, 0x2
	b _0815773C
_081576F4:
	adds r0, r6, 0
	movs r1, 0x16
	b _08157734
_081576FA:
	adds r0, r6, 0
	movs r1, 0x17
	b _08157734
_08157700:
	adds r0, r6, 0
	movs r1, 0x18
	b _08157734
_08157706:
	adds r0, r6, 0
	movs r1, 0x21
	b _08157734
_0815770C:
	adds r0, r6, 0
	movs r1, 0x2F
	b _08157734
_08157712:
	adds r0, r6, 0
	movs r1, 0x30
	b _08157734
_08157718:
	adds r0, r6, 0
	movs r1, 0x32
	b _08157734
_0815771E:
	adds r0, r6, 0
	movs r1, 0x33
	b _08157734
_08157724:
	adds r0, r6, 0
	movs r1, 0x34
	b _08157734
_0815772A:
	adds r0, r6, 0
	movs r1, 0x35
	b _08157734
_08157730:
	adds r0, r6, 0
	movs r1, 0x36
_08157734:
	bl GetMonData
	strb r0, [r7]
	movs r4, 0x1
_0815773C:
	adds r0, r4, 0
	add sp, 0x8C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81571A0

	thumb_func_start sub_8157750
sub_8157750: @ 8157750
	push {lr}
	bl PlayerHandleGetRawMonData
	pop {r0}
	bx r0
	thumb_func_end sub_8157750

	thumb_func_start sub_815775C
sub_815775C: @ 815775C
	push {r4,r5,lr}
	ldr r1, _08157780 @ =gUnknown_2022BC4
	ldr r0, _08157784 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0815778C
	ldr r0, _08157788 @ =gBattlerPartyIndexes
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_81577B4
	b _081577AA
	.align 2, 0
_08157780: .4byte gUnknown_2022BC4
_08157784: .4byte gActiveBattler
_08157788: .4byte gBattlerPartyIndexes
_0815778C:
	ldrb r4, [r1]
	movs r5, 0
_08157790:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0815779E
	adds r0, r5, 0
	bl sub_81577B4
_0815779E:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08157790
_081577AA:
	bl PlayerPartnerBufferExecCompleted
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_815775C

	thumb_func_start sub_81577B4
sub_81577B4: @ 81577B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081577E4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r2, r0, 9
	ldr r1, _081577E8 @ =gUnknown_2022BC7
	adds r5, r2, r1
	mov r8, r5
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _081577F0
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _081577EC @ =gPlayerParty
	b _081577F8
	.align 2, 0
_081577E4: .4byte gActiveBattler
_081577E8: .4byte gUnknown_2022BC7
_081577EC: .4byte gPlayerParty
_081577F0:
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _0815781C @ =gEnemyParty
_081577F8:
	adds r6, r1, r0
	ldr r2, _08157820 @ =gUnknown_2022BC4
	ldr r0, _08157824 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	adds r3, r2, 0
	cmp r0, 0x3B
	bls _08157812
	bl _0815809A
_08157812:
	lsls r0, 2
	ldr r1, _08157828 @ =_0815782C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0815781C: .4byte gEnemyParty
_08157820: .4byte gUnknown_2022BC4
_08157824: .4byte gActiveBattler
_08157828: .4byte _0815782C
	.align 2, 0
_0815782C:
	.4byte _0815791C
	.4byte _08157AA4
	.4byte _08157AC0
	.4byte _08157ADC
	.4byte _08157B16
	.4byte _08157B16
	.4byte _08157B16
	.4byte _08157B16
	.4byte _08157B2C
	.4byte _08157B88
	.4byte _08157B88
	.4byte _08157B88
	.4byte _08157B88
	.4byte _0815809A
	.4byte _0815809A
	.4byte _0815809A
	.4byte _0815809A
	.4byte _08157BA8
	.4byte _08157BC4
	.4byte _08157BE0
	.4byte _08157BFC
	.4byte _08157C18
	.4byte _08157C34
	.4byte _08157C50
	.4byte _08157C6C
	.4byte _08157C88
	.4byte _08157CA4
	.4byte _08157CC0
	.4byte _08157CDC
	.4byte _08157CF8
	.4byte _08157D14
	.4byte _08157D30
	.4byte _08157D94
	.4byte _08157DB0
	.4byte _08157DCC
	.4byte _08157DE8
	.4byte _08157E04
	.4byte _08157E20
	.4byte _08157E3C
	.4byte _08157E58
	.4byte _08157E74
	.4byte _08157E90
	.4byte _08157EAC
	.4byte _08157EC8
	.4byte _08157EE4
	.4byte _08157F00
	.4byte _08157F1C
	.4byte _08157F38
	.4byte _08157F54
	.4byte _08157F70
	.4byte _08157F8C
	.4byte _08157FA8
	.4byte _08157FC4
	.4byte _08157FE0
	.4byte _08157FFC
	.4byte _08158018
	.4byte _08158034
	.4byte _08158050
	.4byte _0815806C
	.4byte _08158088
_0815791C:
	adds r0, r6, 0
	movs r1, 0xB
	mov r2, r8
	bl SetMonData
	mov r2, r8
	adds r2, 0x2E
	adds r0, r6, 0
	movs r1, 0xC
	bl SetMonData
	movs r4, 0
	movs r0, 0x3B
	add r0, r8
	mov r9, r0
	movs r1, 0x2B
	add r1, r8
	mov r10, r1
	mov r2, r8
	adds r2, 0x44
	str r2, [sp, 0x10]
	mov r0, r8
	adds r0, 0x48
	str r0, [sp, 0x14]
	mov r1, r8
	adds r1, 0x4C
	str r1, [sp, 0x18]
	subs r2, 0x1A
	str r2, [sp, 0x8]
	subs r0, 0x20
	str r0, [sp, 0x4]
	subs r1, 0x20
	str r1, [sp, 0xC]
	subs r2, 0x28
	str r2, [sp, 0x1C]
	subs r0, 0x24
	str r0, [sp, 0x20]
	subs r1, 0x26
	str r1, [sp, 0x24]
	adds r2, 0x6
	str r2, [sp, 0x28]
	adds r0, 0x6
	str r0, [sp, 0x2C]
	mov r7, r8
	adds r7, 0x24
	mov r5, r8
	adds r5, 0xC
_0815797A:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	adds r2, r5, 0
	bl SetMonData
	adds r1, r4, 0
	adds r1, 0x11
	adds r0, r6, 0
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0815797A
	adds r0, r6, 0
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x20
	mov r2, r10
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x19
	ldr r2, [sp, 0x10]
	bl SetMonData
	mov r1, r8
	ldrb r0, [r1, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	mov r2, r8
	ldrh r0, [r2, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	mov r2, r8
	ldrb r0, [r2, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	mov r2, r8
	ldr r0, [r2, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	mov r2, r8
	ldrh r0, [r2, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	mov r2, r8
	ldrb r0, [r2, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0
	ldr r2, [sp, 0x14]
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x37
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x38
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x39
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x3A
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x3D
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x28]
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x2C]
	bl SetMonData
	b _0815809A
_08157AA4:
	ldr r0, _08157AB8 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157ABC @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157AB8: .4byte gActiveBattler
_08157ABC: .4byte gUnknown_2022BC7
_08157AC0:
	ldr r0, _08157AD4 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157AD8 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0xC
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157AD4: .4byte gActiveBattler
_08157AD8: .4byte gUnknown_2022BC7
_08157ADC:
	movs r4, 0
	movs r0, 0xC
	adds r0, r5
	mov r8, r0
	adds r7, r5, 0
	adds r7, 0x8
_08157AE8:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	adds r2, r5, 0
	bl SetMonData
	adds r1, r4, 0
	adds r1, 0x11
	adds r0, r6, 0
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _08157AE8
	adds r0, r6, 0
	movs r1, 0x15
	mov r2, r8
	bl SetMonData
	b _0815809A
_08157B16:
	ldr r0, _08157B28 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	adds r0, r3, 0x1
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r1, 0x9
	b _08157B96
	.align 2, 0
_08157B28: .4byte gActiveBattler
_08157B2C:
	ldr r5, _08157B80 @ =gActiveBattler
	ldrb r2, [r5]
	lsls r2, 9
	ldr r4, _08157B84 @ =gUnknown_2022BC7
	adds r2, r4
	adds r0, r6, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r4, 0x1
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r4, 0x2
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r4, 0x3
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r4, 0x4
	adds r2, r4
	adds r0, r6, 0
	movs r1, 0x15
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157B80: .4byte gActiveBattler
_08157B84: .4byte gUnknown_2022BC7
_08157B88:
	ldr r0, _08157BA4 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	adds r0, r3, 0x1
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r1, 0x8
_08157B96:
	adds r0, r3, 0x3
	adds r2, r0
	adds r0, r6, 0
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157BA4: .4byte gActiveBattler
_08157BA8:
	ldr r0, _08157BBC @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157BC0 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x1
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157BBC: .4byte gActiveBattler
_08157BC0: .4byte gUnknown_2022BC7
_08157BC4:
	ldr r0, _08157BD8 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157BDC @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x19
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157BD8: .4byte gActiveBattler
_08157BDC: .4byte gUnknown_2022BC7
_08157BE0:
	ldr r0, _08157BF4 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157BF8 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x1A
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157BF4: .4byte gActiveBattler
_08157BF8: .4byte gUnknown_2022BC7
_08157BFC:
	ldr r0, _08157C10 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157C14 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x1B
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157C10: .4byte gActiveBattler
_08157C14: .4byte gUnknown_2022BC7
_08157C18:
	ldr r0, _08157C2C @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157C30 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x1C
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157C2C: .4byte gActiveBattler
_08157C30: .4byte gUnknown_2022BC7
_08157C34:
	ldr r0, _08157C48 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157C4C @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x1D
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157C48: .4byte gActiveBattler
_08157C4C: .4byte gUnknown_2022BC7
_08157C50:
	ldr r0, _08157C64 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157C68 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x1E
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157C64: .4byte gActiveBattler
_08157C68: .4byte gUnknown_2022BC7
_08157C6C:
	ldr r0, _08157C80 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157C84 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x1F
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157C80: .4byte gActiveBattler
_08157C84: .4byte gUnknown_2022BC7
_08157C88:
	ldr r0, _08157C9C @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157CA0 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x20
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157C9C: .4byte gActiveBattler
_08157CA0: .4byte gUnknown_2022BC7
_08157CA4:
	ldr r0, _08157CB8 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157CBC @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x22
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157CB8: .4byte gActiveBattler
_08157CBC: .4byte gUnknown_2022BC7
_08157CC0:
	ldr r0, _08157CD4 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157CD8 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x23
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157CD4: .4byte gActiveBattler
_08157CD8: .4byte gUnknown_2022BC7
_08157CDC:
	ldr r0, _08157CF0 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157CF4 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x24
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157CF0: .4byte gActiveBattler
_08157CF4: .4byte gUnknown_2022BC7
_08157CF8:
	ldr r0, _08157D0C @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157D10 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x25
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157D0C: .4byte gActiveBattler
_08157D10: .4byte gUnknown_2022BC7
_08157D14:
	ldr r0, _08157D28 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157D2C @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x26
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157D28: .4byte gActiveBattler
_08157D2C: .4byte gUnknown_2022BC7
_08157D30:
	ldr r5, _08157D8C @ =gActiveBattler
	ldrb r2, [r5]
	lsls r2, 9
	ldr r4, _08157D90 @ =gUnknown_2022BC7
	adds r2, r4
	adds r0, r6, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r4, 0x1
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r4, 0x2
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r4, 0x3
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r4, 0x4
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r4, 0x5
	adds r2, r4
	b _08157E2A
	.align 2, 0
_08157D8C: .4byte gActiveBattler
_08157D90: .4byte gUnknown_2022BC7
_08157D94:
	ldr r0, _08157DA8 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157DAC @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x27
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157DA8: .4byte gActiveBattler
_08157DAC: .4byte gUnknown_2022BC7
_08157DB0:
	ldr r0, _08157DC4 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157DC8 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x28
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157DC4: .4byte gActiveBattler
_08157DC8: .4byte gUnknown_2022BC7
_08157DCC:
	ldr r0, _08157DE0 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157DE4 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x29
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157DE0: .4byte gActiveBattler
_08157DE4: .4byte gUnknown_2022BC7
_08157DE8:
	ldr r0, _08157DFC @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157E00 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x2A
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157DFC: .4byte gActiveBattler
_08157E00: .4byte gUnknown_2022BC7
_08157E04:
	ldr r0, _08157E18 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157E1C @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x2B
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157E18: .4byte gActiveBattler
_08157E1C: .4byte gUnknown_2022BC7
_08157E20:
	ldr r0, _08157E34 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157E38 @ =gUnknown_2022BC7
	adds r2, r0
_08157E2A:
	adds r0, r6, 0
	movs r1, 0x2C
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157E34: .4byte gActiveBattler
_08157E38: .4byte gUnknown_2022BC7
_08157E3C:
	ldr r0, _08157E50 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157E54 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157E50: .4byte gActiveBattler
_08157E54: .4byte gUnknown_2022BC7
_08157E58:
	ldr r0, _08157E6C @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157E70 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x9
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157E6C: .4byte gActiveBattler
_08157E70: .4byte gUnknown_2022BC7
_08157E74:
	ldr r0, _08157E88 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157E8C @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x37
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157E88: .4byte gActiveBattler
_08157E8C: .4byte gUnknown_2022BC7
_08157E90:
	ldr r0, _08157EA4 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157EA8 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x38
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157EA4: .4byte gActiveBattler
_08157EA8: .4byte gUnknown_2022BC7
_08157EAC:
	ldr r0, _08157EC0 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157EC4 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x39
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157EC0: .4byte gActiveBattler
_08157EC4: .4byte gUnknown_2022BC7
_08157EC8:
	ldr r0, _08157EDC @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157EE0 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x3A
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157EDC: .4byte gActiveBattler
_08157EE0: .4byte gUnknown_2022BC7
_08157EE4:
	ldr r0, _08157EF8 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157EFC @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x3B
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157EF8: .4byte gActiveBattler
_08157EFC: .4byte gUnknown_2022BC7
_08157F00:
	ldr r0, _08157F14 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157F18 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x3C
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157F14: .4byte gActiveBattler
_08157F18: .4byte gUnknown_2022BC7
_08157F1C:
	ldr r0, _08157F30 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157F34 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x3D
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157F30: .4byte gActiveBattler
_08157F34: .4byte gUnknown_2022BC7
_08157F38:
	ldr r0, _08157F4C @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157F50 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x3E
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157F4C: .4byte gActiveBattler
_08157F50: .4byte gUnknown_2022BC7
_08157F54:
	ldr r0, _08157F68 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157F6C @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x3F
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157F68: .4byte gActiveBattler
_08157F6C: .4byte gUnknown_2022BC7
_08157F70:
	ldr r0, _08157F84 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157F88 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x16
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157F84: .4byte gActiveBattler
_08157F88: .4byte gUnknown_2022BC7
_08157F8C:
	ldr r0, _08157FA0 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157FA4 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x17
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157FA0: .4byte gActiveBattler
_08157FA4: .4byte gUnknown_2022BC7
_08157FA8:
	ldr r0, _08157FBC @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157FC0 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x18
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157FBC: .4byte gActiveBattler
_08157FC0: .4byte gUnknown_2022BC7
_08157FC4:
	ldr r0, _08157FD8 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157FDC @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x21
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157FD8: .4byte gActiveBattler
_08157FDC: .4byte gUnknown_2022BC7
_08157FE0:
	ldr r0, _08157FF4 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08157FF8 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x2F
	bl SetMonData
	b _0815809A
	.align 2, 0
_08157FF4: .4byte gActiveBattler
_08157FF8: .4byte gUnknown_2022BC7
_08157FFC:
	ldr r0, _08158010 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08158014 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x30
	bl SetMonData
	b _0815809A
	.align 2, 0
_08158010: .4byte gActiveBattler
_08158014: .4byte gUnknown_2022BC7
_08158018:
	ldr r0, _0815802C @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08158030 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x32
	bl SetMonData
	b _0815809A
	.align 2, 0
_0815802C: .4byte gActiveBattler
_08158030: .4byte gUnknown_2022BC7
_08158034:
	ldr r0, _08158048 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _0815804C @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x33
	bl SetMonData
	b _0815809A
	.align 2, 0
_08158048: .4byte gActiveBattler
_0815804C: .4byte gUnknown_2022BC7
_08158050:
	ldr r0, _08158064 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08158068 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x34
	bl SetMonData
	b _0815809A
	.align 2, 0
_08158064: .4byte gActiveBattler
_08158068: .4byte gUnknown_2022BC7
_0815806C:
	ldr r0, _08158080 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _08158084 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x35
	bl SetMonData
	b _0815809A
	.align 2, 0
_08158080: .4byte gActiveBattler
_08158084: .4byte gUnknown_2022BC7
_08158088:
	ldr r0, _081580C4 @ =gActiveBattler
	ldrb r2, [r0]
	lsls r2, 9
	ldr r0, _081580C8 @ =gUnknown_2022BC7
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x36
	bl SetMonData
_0815809A:
	ldr r2, _081580CC @ =gBattlerPartyIndexes
	ldr r0, _081580C4 @ =gActiveBattler
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081580D0 @ =gPlayerParty
	adds r0, r2
	bl HandleLowHpMusicChange
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081580C4: .4byte gActiveBattler
_081580C8: .4byte gUnknown_2022BC7
_081580CC: .4byte gBattlerPartyIndexes
_081580D0: .4byte gPlayerParty
	thumb_func_end sub_81577B4

	thumb_func_start sub_81580D4
sub_81580D4: @ 81580D4
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_81580D4

	thumb_func_start sub_81580E0
sub_81580E0: @ 81580E0
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
	bl GetBankSpriteDefault_Y
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_803F7D4
	ldr r0, _08158220 @ =gMultiuseSpriteTemplate
	mov r9, r0
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r9
	adds r1, r4, 0
	adds r2, r5, 0
	bl CreateSprite
	ldr r4, _08158224 @ =gUnknown_2023D44
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
	bl SetBankEnemyShadowSpriteCallback
	ldr r1, _08158234 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158238 @ =sub_8156184
	str r1, [r0]
	bl PlayerPartnerBufferExecCompleted
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
_08158224: .4byte gUnknown_2023D44
_08158228: .4byte gSprites
_0815822C: .4byte 0x0000ff10
_08158230: .4byte gBattleMonForms
_08158234: .4byte gUnknown_3004FE0
_08158238: .4byte sub_8156184
	thumb_func_end sub_81580E0

	thumb_func_start sub_815823C
sub_815823C: @ 815823C
	push {r4,r5,lr}
	ldr r5, _081582A0 @ =gActiveBattler
	ldrb r0, [r5]
	ldr r4, _081582A4 @ =gUnknown_2022BC4
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
	bl sub_8034498
	ldr r1, _081582B0 @ =gUnknown_2023FF8
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldr r1, _081582B4 @ =gUnknown_2023FFC
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldrb r0, [r5]
	bl sub_8159478
	ldr r1, _081582B8 @ =gUnknown_3004FE0
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
_081582A4: .4byte gUnknown_2022BC4
_081582A8: .4byte gBattlerPartyIndexes
_081582AC: .4byte gPlayerParty
_081582B0: .4byte gUnknown_2023FF8
_081582B4: .4byte gUnknown_2023FFC
_081582B8: .4byte gUnknown_3004FE0
_081582BC: .4byte sub_81563A8
	thumb_func_end sub_815823C

	thumb_func_start sub_81582C0
sub_81582C0: @ 81582C0
	push {r4-r6,lr}
	ldr r0, _081582EC @ =gUnknown_2022BC4
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
	ldr r0, _081582F4 @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _081582F8 @ =sub_8156F7C
	str r0, [r1]
	b _08158332
	.align 2, 0
_081582EC: .4byte gUnknown_2022BC4
_081582F0: .4byte gActiveBattler
_081582F4: .4byte gUnknown_3004FE0
_081582F8: .4byte sub_8156F7C
_081582FC:
	ldr r5, _08158338 @ =gUnknown_2023D44
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
	ldr r1, _08158340 @ =gUnknown_3004FF0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerPartnerBufferExecCompleted
_08158332:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08158338: .4byte gUnknown_2023D44
_0815833C: .4byte gSprites
_08158340: .4byte gUnknown_3004FF0
	thumb_func_end sub_81582C0

	thumb_func_start sub_8158344
sub_8158344: @ 8158344
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
	bl sub_8034750
	ldrb r0, [r7]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x4
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _081583DC @ =gMultiuseSpriteTemplate
	ldr r1, _081583E0 @ =gUnknown_8239F8C
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
	ldr r5, _081583E4 @ =gUnknown_2023D44
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
_081583E0: .4byte gUnknown_8239F8C
_081583E4: .4byte gUnknown_2023D44
_081583E8: .4byte gSprites
_081583EC: .4byte 0x0000fffe
_081583F0:
	ldrb r1, [r7]
	movs r0, 0x84
	bl sub_80346C4
	ldrb r0, [r7]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x84
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r5, _08158510 @ =gMultiuseSpriteTemplate
	ldr r0, _08158514 @ =gUnknown_823932C
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
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	movs r1, 0xB0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _08158518 @ =gUnknown_2023D44
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
	ldr r0, _08158524 @ =gUnknown_8239A1C
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
	ldr r0, _08158528 @ =gUnknown_823957C
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
	ldr r1, _08158538 @ =gUnknown_3004FE0
	ldr r0, _0815853C @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158540 @ =sub_815614C
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08158510: .4byte gMultiuseSpriteTemplate
_08158514: .4byte gUnknown_823932C
_08158518: .4byte gUnknown_2023D44
_0815851C: .4byte gSprites
_08158520: .4byte 0x0000ff10
_08158524: .4byte gUnknown_8239A1C
_08158528: .4byte gUnknown_823957C
_0815852C: .4byte 0x000003ff
_08158530: .4byte 0xfffffc00
_08158534: .4byte sub_8033EEC
_08158538: .4byte gUnknown_3004FE0
_0815853C: .4byte gActiveBattler
_08158540: .4byte sub_815614C
	thumb_func_end sub_8158344

	thumb_func_start sub_8158544
sub_8158544: @ 8158544
	push {r4-r6,lr}
	ldr r4, _081585EC @ =gActiveBattler
	ldrb r1, [r4]
	movs r0, 0x4
	bl sub_8034750
	ldrb r0, [r4]
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x4
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r0, _081585F0 @ =gMultiuseSpriteTemplate
	ldr r1, _081585F4 @ =gUnknown_8239F8C
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
	ldr r6, _081585F8 @ =gUnknown_2023D44
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
	ldr r1, _08158608 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0815860C @ =sub_8156FEC
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081585EC: .4byte gActiveBattler
_081585F0: .4byte gMultiuseSpriteTemplate
_081585F4: .4byte gUnknown_8239F8C
_081585F8: .4byte gUnknown_2023D44
_081585FC: .4byte gSprites
_08158600: .4byte 0x0000ffa0
_08158604: .4byte sub_8033EEC
_08158608: .4byte gUnknown_3004FE0
_0815860C: .4byte sub_8156FEC
	thumb_func_end sub_8158544

	thumb_func_start sub_8158610
sub_8158610: @ 8158610
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8158610

	thumb_func_start sub_815861C
sub_815861C: @ 815861C
	push {r4-r6,lr}
	ldr r6, _08158668 @ =gUnknown_2024018
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
_08158668: .4byte gUnknown_2024018
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
	ldr r3, _081586F4 @ =gUnknown_2023D44
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
_081586F4: .4byte gUnknown_2023D44
_081586F8: .4byte sub_8012110
_081586FC:
	movs r0, 0x10
	movs r1, 0x3F
	bl PlaySE12WithPanning
	ldr r2, _08158730 @ =gSprites
	ldr r1, _08158734 @ =gUnknown_2023D44
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08158738 @ =sub_8011EA0
_0815871A:
	str r1, [r0]
	ldr r1, _0815873C @ =gUnknown_3004FE0
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
_08158734: .4byte gUnknown_2023D44
_08158738: .4byte sub_8011EA0
_0815873C: .4byte gUnknown_3004FE0
_08158740: .4byte gActiveBattler
_08158744: .4byte sub_8156DCC
	thumb_func_end sub_815861C

	thumb_func_start sub_8158748
sub_8158748: @ 8158748
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8158748

	thumb_func_start sub_8158754
sub_8158754: @ 8158754
	push {r4,r5,lr}
	ldr r0, _08158794 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0, 0x8]
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _08158798 @ =gUnknown_2024005
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
	ldr r1, _081587A0 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081587A4 @ =sub_8156484
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08158794: .4byte gUnknown_2024018
_08158798: .4byte gUnknown_2024005
_0815879C: .4byte gActiveBattler
_081587A0: .4byte gUnknown_3004FE0
_081587A4: .4byte sub_8156484
	thumb_func_end sub_8158754

	thumb_func_start sub_81587A8
sub_81587A8: @ 81587A8
	push {r4,r5,lr}
	ldr r1, _081587F0 @ =gUnknown_2022BC4
	ldr r5, _081587F4 @ =gActiveBattler
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _081587F8 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r0, [r0, 0x8]
	strb r1, [r0, 0x8]
	ldr r1, _081587FC @ =gUnknown_2024005
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
	ldr r1, _08158800 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158804 @ =sub_8156484
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081587F0: .4byte gUnknown_2022BC4
_081587F4: .4byte gActiveBattler
_081587F8: .4byte gUnknown_2024018
_081587FC: .4byte gUnknown_2024005
_08158800: .4byte gUnknown_3004FE0
_08158804: .4byte sub_8156484
	thumb_func_end sub_81587A8

	thumb_func_start sub_8158808
sub_8158808: @ 8158808
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8158808

	thumb_func_start sub_8158814
sub_8158814: @ 8158814
	push {r4-r6,lr}
	ldr r0, _081588E8 @ =gUnknown_2022BC4
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
	ldr r5, _081588F0 @ =gUnknown_2037F16
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _081588F4 @ =gUnknown_2037EEC
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
	ldr r4, _081588F8 @ =gUnknown_2037EE8
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
	ldr r3, _081588FC @ =gUnknown_2037EFE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08158900 @ =gUnknown_2037F00
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
	ldr r3, _08158904 @ =gUnknown_2037EE4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _08158908 @ =gUnknown_2024008
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
	bl PlayerPartnerBufferExecCompleted
	b _0815892A
	.align 2, 0
_081588E8: .4byte gUnknown_2022BC4
_081588EC: .4byte gActiveBattler
_081588F0: .4byte gUnknown_2037F16
_081588F4: .4byte gUnknown_2037EEC
_081588F8: .4byte gUnknown_2037EE8
_081588FC: .4byte gUnknown_2037EFE
_08158900: .4byte gUnknown_2037F00
_08158904: .4byte gUnknown_2037EE4
_08158908: .4byte gUnknown_2024008
_0815890C:
	ldr r0, _08158930 @ =gUnknown_2024018
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strb r3, [r0, 0x4]
	ldr r1, _08158934 @ =gUnknown_3004FE0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158938 @ =sub_815893C
	str r1, [r0]
_0815892A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08158930: .4byte gUnknown_2024018
_08158934: .4byte gUnknown_3004FE0
_08158938: .4byte sub_815893C
	thumb_func_end sub_8158814

	thumb_func_start sub_815893C
sub_815893C: @ 815893C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _08158980 @ =gUnknown_2022BC4
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
	ldr r7, _08158988 @ =gUnknown_2024018
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
_08158980: .4byte gUnknown_2022BC4
_08158984: .4byte gActiveBattler
_08158988: .4byte gUnknown_2024018
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
	ldr r0, _08158A38 @ =gUnknown_2037EDC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08158A3C @ =gUnknown_2037EE1
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
_08158A38: .4byte gUnknown_2037EDC
_08158A3C: .4byte gUnknown_2037EE1
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
	bl PlayerPartnerBufferExecCompleted
_08158A7C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_815893C

	thumb_func_start sub_8158A88
sub_8158A88: @ 8158A88
	push {r4,lr}
	ldr r0, _08158ABC @ =gUnknown_2022974
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08158AC0 @ =gUnknown_2022976
	strh r1, [r0]
	ldr r0, _08158AC4 @ =gActiveBattler
	ldrb r4, [r0]
	lsls r4, 9
	ldr r0, _08158AC8 @ =gUnknown_2022BC6
	adds r4, r0
	ldrh r0, [r4]
	bl sub_80D7274
	ldrh r0, [r4]
	bl sub_80D89B0
	lsls r0, 24
	cmp r0, 0
	beq _08158AD0
	ldr r0, _08158ACC @ =gDisplayedStringBattle
	movs r1, 0x40
	bl sub_80D87BC
	b _08158AD8
	.align 2, 0
_08158ABC: .4byte gUnknown_2022974
_08158AC0: .4byte gUnknown_2022976
_08158AC4: .4byte gActiveBattler
_08158AC8: .4byte gUnknown_2022BC6
_08158ACC: .4byte gDisplayedStringBattle
_08158AD0:
	ldr r0, _08158AEC @ =gDisplayedStringBattle
	movs r1, 0
	bl sub_80D87BC
_08158AD8:
	ldr r1, _08158AF0 @ =gUnknown_3004FE0
	ldr r0, _08158AF4 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158AF8 @ =sub_815623C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08158AEC: .4byte gDisplayedStringBattle
_08158AF0: .4byte gUnknown_3004FE0
_08158AF4: .4byte gActiveBattler
_08158AF8: .4byte sub_815623C
	thumb_func_end sub_8158A88

	thumb_func_start sub_8158AFC
sub_8158AFC: @ 8158AFC
	push {lr}
	ldr r0, _08158B14 @ =gActiveBattler
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08158B18
	bl sub_8158A88
	b _08158B1C
	.align 2, 0
_08158B14: .4byte gActiveBattler
_08158B18:
	bl PlayerPartnerBufferExecCompleted
_08158B1C:
	pop {r0}
	bx r0
	thumb_func_end sub_8158AFC

	thumb_func_start sub_8158B20
sub_8158B20: @ 8158B20
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08158B46
	ldr r0, _08158B4C @ =gUnknown_2022974
	strh r1, [r0]
	ldr r1, _08158B50 @ =gUnknown_2022976
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _08158B54 @ =gUnknown_3004FE0
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
_08158B4C: .4byte gUnknown_2022974
_08158B50: .4byte gUnknown_2022976
_08158B54: .4byte gUnknown_3004FE0
_08158B58: .4byte gActiveBattler
_08158B5C: .4byte sub_8156140
	thumb_func_end sub_8158B20

	thumb_func_start sub_8158B60
sub_8158B60: @ 8158B60
	push {r4,lr}
	ldr r4, _08158BBC @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08158BDC
	ldr r1, _08158BC0 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158BC4 @ =sub_8158B20
	str r1, [r0]
	ldr r0, _08158BC8 @ =gUnknown_83FDA4C
	movs r1, 0
	bl sub_80D87BC
	ldr r0, _08158BCC @ =gUnknown_83FE725
	movs r1, 0x2
	bl sub_80D87BC
	movs r4, 0
_08158B8E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl ActionSelectionDestroyCursorAt
	adds r4, 0x1
	cmp r4, 0x3
	ble _08158B8E
	ldr r1, _08158BD0 @ =gUnknown_2023FF8
	ldr r0, _08158BBC @ =gActiveBattler
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
	ldr r0, _08158BD4 @ =gUnknown_83FE6D5
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _08158BD8 @ =gDisplayedStringBattle
	movs r1, 0x1
	bl sub_80D87BC
	b _08158BE8
	.align 2, 0
_08158BBC: .4byte gActiveBattler
_08158BC0: .4byte gUnknown_3004FE0
_08158BC4: .4byte sub_8158B20
_08158BC8: .4byte gUnknown_83FDA4C
_08158BCC: .4byte gUnknown_83FE725
_08158BD0: .4byte gUnknown_2023FF8
_08158BD4: .4byte gUnknown_83FE6D5
_08158BD8: .4byte gDisplayedStringBattle
_08158BDC:
	ldr r0, _08158BF0 @ =gUnknown_3004FE0
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
_08158BF0: .4byte gUnknown_3004FE0
_08158BF4: .4byte sub_8156140
	thumb_func_end sub_8158B60

	thumb_func_start sub_8158BF8
sub_8158BF8: @ 8158BF8
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8158BF8

	thumb_func_start sub_8158C04
sub_8158C04: @ 8158C04
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08158C2E
	ldr r0, _08158C34 @ =gUnknown_2022974
	strh r1, [r0]
	ldr r1, _08158C38 @ =gUnknown_2022976
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08158C3C @ =gUnknown_3004FE0
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
_08158C34: .4byte gUnknown_2022974
_08158C38: .4byte gUnknown_2022976
_08158C3C: .4byte gUnknown_3004FE0
_08158C40: .4byte gActiveBattler
_08158C44: .4byte sub_81564E4
	thumb_func_end sub_8158C04

	thumb_func_start sub_8158C48
sub_8158C48: @ 8158C48
	push {r4,lr}
	ldr r4, _08158C68 @ =gActiveBattler
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08158C74
	bl sub_8032CB4
	ldr r0, _08158C6C @ =gUnknown_3004FE0
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08158C70 @ =sub_8158C04
	b _08158C7E
	.align 2, 0
_08158C68: .4byte gActiveBattler
_08158C6C: .4byte gUnknown_3004FE0
_08158C70: .4byte sub_8158C04
_08158C74:
	ldr r0, _08158C88 @ =gUnknown_3004FE0
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
_08158C88: .4byte gUnknown_3004FE0
_08158C8C: .4byte sub_81564E4
	thumb_func_end sub_8158C48

	thumb_func_start sub_8158C90
sub_8158C90: @ 8158C90
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08158CDC @ =gUnknown_3004FE0
	ldr r2, _08158CE0 @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158CE4 @ =sub_8156594
	str r1, [r0]
	ldr r1, _08158CE8 @ =gBattlerInMenuId
	ldrb r0, [r2]
	strb r0, [r1]
	movs r3, 0
	ldr r5, _08158CEC @ =gUnknown_203B0DC
	ldr r4, _08158CF0 @ =gUnknown_2022BC4
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
_08158CDC: .4byte gUnknown_3004FE0
_08158CE0: .4byte gActiveBattler
_08158CE4: .4byte sub_8156594
_08158CE8: .4byte gBattlerInMenuId
_08158CEC: .4byte gUnknown_203B0DC
_08158CF0: .4byte gUnknown_2022BC4
	thumb_func_end sub_8158C90

	thumb_func_start sub_8158CF4
sub_8158CF4: @ 8158CF4
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
	ldr r5, _08158DB4 @ =gUnknown_2022BC4
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
	ldr r1, _08158DC0 @ =gUnknown_3004FE0
	ldr r2, _08158DAC @ =gActiveBattler
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158DC4 @ =sub_81564F0
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
_08158DB4: .4byte gUnknown_2022BC4
_08158DB8: .4byte gBattleStruct
_08158DBC: .4byte gUnknown_203B0DC
_08158DC0: .4byte gUnknown_3004FE0
_08158DC4: .4byte sub_81564F0
_08158DC8: .4byte gBattlerInMenuId
	thumb_func_end sub_8158CF4

	thumb_func_start sub_8158DCC
sub_8158DCC: @ 8158DCC
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8158DCC

	thumb_func_start sub_8158DD8
sub_8158DD8: @ 8158DD8
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
	ldr r3, _08158E70 @ =gUnknown_2022BC4
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
	ldr r1, _08158E7C @ =gUnknown_3004FF0
	adds r1, r0, r1
	ldrb r1, [r1]
	str r6, [sp]
	adds r2, r4, 0
	bl SetBattleBarStruct
	b _08158EA8
	.align 2, 0
_08158E68: .4byte gBattlerPartyIndexes
_08158E6C: .4byte gEnemyParty
_08158E70: .4byte gUnknown_2022BC4
_08158E74: .4byte gActiveBattler
_08158E78: .4byte 0x00007fff
_08158E7C: .4byte gUnknown_3004FF0
_08158E80:
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	ldrb r0, [r7]
	ldr r4, _08158EC0 @ =gUnknown_3004FF0
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
	bl sub_8048440
_08158EA8:
	ldr r1, _08158EC4 @ =gUnknown_3004FE0
	ldr r0, _08158EC8 @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08158ECC @ =sub_8156E78
	str r1, [r0]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08158EC0: .4byte gUnknown_3004FF0
_08158EC4: .4byte gUnknown_3004FE0
_08158EC8: .4byte gActiveBattler
_08158ECC: .4byte sub_8156E78
	thumb_func_end sub_8158DD8

	thumb_func_start sub_8158ED0
sub_8158ED0: @ 8158ED0
	push {r4-r7,lr}
	ldr r5, _08158EFC @ =gUnknown_2022BC4
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
	bl PlayerPartnerBufferExecCompleted
	b _08158F54
	.align 2, 0
_08158EFC: .4byte gUnknown_2022BC4
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
	ldr r0, _08158F5C @ =sub_81568DC
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
	ldr r1, _08158F64 @ =gUnknown_3004FE0
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
_08158F5C: .4byte sub_81568DC
_08158F60: .4byte gTasks
_08158F64: .4byte gUnknown_3004FE0
_08158F68: .4byte nullsub_99
	thumb_func_end sub_8158ED0

	thumb_func_start sub_8158F6C
sub_8158F6C: @ 8158F6C
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
	ldr r1, _08159000 @ =gUnknown_3004FF0
	ldr r4, _08159004 @ =gActiveBattler
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r2, 0
	movs r2, 0x9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _08159008 @ =gUnknown_2024018
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
	ldr r1, _0815900C @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08159010 @ =sub_8157054
	str r1, [r0]
_08158FF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08158FF8: .4byte gBattlerPartyIndexes
_08158FFC: .4byte gEnemyParty
_08159000: .4byte gUnknown_3004FF0
_08159004: .4byte gActiveBattler
_08159008: .4byte gUnknown_2024018
_0815900C: .4byte gUnknown_3004FE0
_08159010: .4byte sub_8157054
	thumb_func_end sub_8158F6C

	thumb_func_start sub_8159014
sub_8159014: @ 8159014
	push {r4,r5,lr}
	ldr r5, _0815906C @ =gActiveBattler
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08159064
	ldr r4, _08159070 @ =gUnknown_2022BC4
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
	ldr r1, _08159074 @ =gUnknown_3004FE0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08159078 @ =sub_8157054
	str r1, [r0]
_08159064:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0815906C: .4byte gActiveBattler
_08159070: .4byte gUnknown_2022BC4
_08159074: .4byte gUnknown_3004FE0
_08159078: .4byte sub_8157054
	thumb_func_end sub_8159014

	thumb_func_start sub_815907C
sub_815907C: @ 815907C
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
	ldr r2, _081590F8 @ =gUnknown_2022BC4
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
	bl PlayerPartnerBufferExecCompleted
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081590F0: .4byte gBattlerPartyIndexes
_081590F4: .4byte gEnemyParty
_081590F8: .4byte gUnknown_2022BC4
_081590FC: .4byte gActiveBattler
	thumb_func_end sub_815907C

	thumb_func_start sub_8159100
sub_8159100: @ 8159100
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159100

	thumb_func_start sub_815910C
sub_815910C: @ 815910C
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_815910C

	thumb_func_start sub_8159118
sub_8159118: @ 8159118
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159118

	thumb_func_start sub_8159124
sub_8159124: @ 8159124
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159124

	thumb_func_start sub_8159130
sub_8159130: @ 8159130
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159130

	thumb_func_start sub_815913C
sub_815913C: @ 815913C
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_815913C

	thumb_func_start sub_8159148
sub_8159148: @ 8159148
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159148

	thumb_func_start sub_8159154
sub_8159154: @ 8159154
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159154

	thumb_func_start sub_8159160
sub_8159160: @ 8159160
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159160

	thumb_func_start sub_815916C
sub_815916C: @ 815916C
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_815916C

	thumb_func_start sub_8159178
sub_8159178: @ 8159178
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159178

	thumb_func_start sub_8159184
sub_8159184: @ 8159184
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159184

	thumb_func_start sub_8159190
sub_8159190: @ 8159190
	push {r4,lr}
	ldr r3, _081591B8 @ =gSprites
	ldr r2, _081591BC @ =gUnknown_2023D44
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
	bl PlayerPartnerBufferExecCompleted
	b _081591EE
	.align 2, 0
_081591B8: .4byte gSprites
_081591BC: .4byte gUnknown_2023D44
_081591C0: .4byte gActiveBattler
_081591C4:
	ldr r1, _081591F4 @ =gUnknown_2024005
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
	ldr r1, _081591F8 @ =gUnknown_3004FE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081591FC @ =sub_8156F00
	str r1, [r0]
_081591EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081591F4: .4byte gUnknown_2024005
_081591F8: .4byte gUnknown_3004FE0
_081591FC: .4byte sub_8156F00
	thumb_func_end sub_8159190

	thumb_func_start sub_8159200
sub_8159200: @ 8159200
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159200

	thumb_func_start sub_815920C
sub_815920C: @ 815920C
	push {lr}
	ldr r2, _08159234 @ =gUnknown_2022BC4
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
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08159234: .4byte gUnknown_2022BC4
_08159238: .4byte gActiveBattler
	thumb_func_end sub_815920C

	thumb_func_start sub_815923C
sub_815923C: @ 815923C
	push {lr}
	ldr r2, _08159264 @ =gUnknown_2022BC4
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
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08159264: .4byte gUnknown_2022BC4
_08159268: .4byte gActiveBattler
	thumb_func_end sub_815923C

	thumb_func_start sub_815926C
sub_815926C: @ 815926C
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
	bl PlayerPartnerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081592C8: .4byte gBattlerPartyIndexes
_081592CC: .4byte gEnemyParty
	thumb_func_end sub_815926C

	thumb_func_start sub_81592D0
sub_81592D0: @ 81592D0
	push {lr}
	ldr r1, _081592F8 @ =gUnknown_2022BC4
	ldr r0, _081592FC @ =gActiveBattler
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80BC3A0
	ldr r2, _08159300 @ =gUnknown_2023F4C
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_081592F8: .4byte gUnknown_2022BC4
_081592FC: .4byte gActiveBattler
_08159300: .4byte gUnknown_2023F4C
	thumb_func_end sub_81592D0

	thumb_func_start sub_8159304
sub_8159304: @ 8159304
	push {r4-r7,lr}
	ldr r6, _0815943C @ =gUnknown_2023D44
	ldr r7, _08159440 @ =gActiveBattler
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08159444 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
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
	ldr r1, _0815944C @ =sub_8075590
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
	ldr r0, _08159458 @ =gUnknown_8239FD4
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
	ldr r3, _08159464 @ =gUnknown_2024018
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
	ldr r0, _08159468 @ =gUnknown_2024000
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _0815946C @ =sub_80491B0
	str r1, [r0]
_0815941C:
	ldr r0, [r3]
	ldr r2, [r0, 0x8]
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08159470 @ =gUnknown_3004FE0
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08159474 @ =nullsub_99
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0815943C: .4byte gUnknown_2023D44
_08159440: .4byte gActiveBattler
_08159444: .4byte gSprites
_08159448: .4byte 0x0000ffd8
_0815944C: .4byte sub_8075590
_08159450: .4byte sub_80335F8
_08159454: .4byte 0x0000d6f8
_08159458: .4byte gUnknown_8239FD4
_0815945C: .4byte sub_81595EC
_08159460: .4byte gTasks
_08159464: .4byte gUnknown_2024018
_08159468: .4byte gUnknown_2024000
_0815946C: .4byte sub_80491B0
_08159470: .4byte gUnknown_3004FE0
_08159474: .4byte nullsub_99
	thumb_func_end sub_8159304

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
	ldr r0, _081595C0 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r6, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	ldr r0, _081595C4 @ =gBattlerPartyIndexes
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _081595C8 @ =gUnknown_2022BC4
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
	bl sub_803F7D4
	ldr r0, _081595D8 @ =gMultiuseSpriteTemplate
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8074480
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl GetBankSpriteDefault_Y
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _081595DC @ =gUnknown_2023D44
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
_081595C0: .4byte gUnknown_2024018
_081595C4: .4byte gBattlerPartyIndexes
_081595C8: .4byte gUnknown_2022BC4
_081595CC: .4byte gPlayerParty
_081595D0: .4byte sub_8033E3C
_081595D4: .4byte gUnknown_3004FFC
_081595D8: .4byte gMultiuseSpriteTemplate
_081595DC: .4byte gUnknown_2023D44
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
	ldr r0, _08159650 @ =gUnknown_2022BC4
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
	ldr r1, _08159658 @ =gUnknown_3004FE0
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
_08159650: .4byte gUnknown_2022BC4
_08159654: .4byte gBattlerPartyIndexes
_08159658: .4byte gUnknown_3004FE0
_0815965C: .4byte sub_8156624
	thumb_func_end sub_81595EC

	thumb_func_start sub_8159660
sub_8159660: @ 8159660
	push {r4,r5,lr}
	ldr r1, _08159688 @ =gUnknown_2022BC4
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
	bl PlayerPartnerBufferExecCompleted
	b _081596CE
	.align 2, 0
_08159688: .4byte gUnknown_2022BC4
_0815968C: .4byte gActiveBattler
_08159690:
	ldr r0, _081596D4 @ =gUnknown_2024018
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
	ldr r3, _081596DC @ =gUnknown_2022BC8
	adds r1, r4, r3
	subs r2, r3, 0x3
	adds r2, r4, r2
	ldrb r2, [r2]
	subs r3, 0x2
	adds r4, r3
	ldrb r3, [r4]
	bl sub_8048D14
	ldr r2, _081596E0 @ =gUnknown_2024000
	ldrb r1, [r5]
	adds r1, r2
	strb r0, [r1]
	bl PlayerPartnerBufferExecCompleted
_081596CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081596D4: .4byte gUnknown_2024018
_081596D8: .4byte gActiveBattler
_081596DC: .4byte gUnknown_2022BC8
_081596E0: .4byte gUnknown_2024000
	thumb_func_end sub_8159660

	thumb_func_start sub_81596E4
sub_81596E4: @ 81596E4
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_81596E4

	thumb_func_start sub_81596F0
sub_81596F0: @ 81596F0
	push {r4,lr}
	ldr r4, _08159710 @ =gActiveBattler
	ldrb r0, [r4]
	movs r1, 0x1
	bl dp11b_obj_free
	ldrb r0, [r4]
	movs r1, 0
	bl dp11b_obj_free
	bl PlayerPartnerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08159710: .4byte gActiveBattler
	thumb_func_end sub_81596F0

	thumb_func_start sub_8159714
sub_8159714: @ 8159714
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8159714

	thumb_func_start sub_8159720
sub_8159720: @ 8159720
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _08159758 @ =gUnknown_2022BC4
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
	bl PlayerPartnerBufferExecCompleted
	b _0815976C
	.align 2, 0
_08159758: .4byte gUnknown_2022BC4
_0815975C: .4byte gActiveBattler
_08159760:
	ldr r0, _08159774 @ =gUnknown_3004FE0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08159778 @ =sub_8157024
	str r0, [r1]
_0815976C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08159774: .4byte gUnknown_3004FE0
_08159778: .4byte sub_8157024
	thumb_func_end sub_8159720

	thumb_func_start sub_815977C
sub_815977C: @ 815977C
	push {r4,lr}
	ldr r1, _081597B0 @ =gUnknown_2022BC4
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
	bl dp11b_obj_free
	ldrb r0, [r4]
	movs r1, 0
	bl dp11b_obj_free
_081597A4:
	bl PlayerPartnerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081597B0: .4byte gUnknown_2022BC4
_081597B4: .4byte gActiveBattler
	thumb_func_end sub_815977C

	thumb_func_start sub_81597B8
sub_81597B8: @ 81597B8
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_81597B8

	thumb_func_start sub_81597C4
sub_81597C4: @ 81597C4
	push {r4,lr}
	ldr r2, _08159808 @ =gUnknown_2023E8A
	ldr r1, _0815980C @ =gUnknown_2022BC4
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
	bl PlayerPartnerBufferExecCompleted
	ldr r0, _08159814 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _08159800
	ldr r0, _08159818 @ =gUnknown_3004FE0
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
_08159808: .4byte gUnknown_2023E8A
_0815980C: .4byte gUnknown_2022BC4
_08159810: .4byte gActiveBattler
_08159814: .4byte gBattleTypeFlags
_08159818: .4byte gUnknown_3004FE0
_0815981C: .4byte sub_8156254
	thumb_func_end sub_81597C4

	thumb_func_start nullsub_100
nullsub_100: @ 8159820
	bx lr
	thumb_func_end nullsub_100

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
	bl dp11b_obj_instanciate
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0x7
	movs r3, 0x1
	bl dp11b_obj_instanciate
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
	bl EmitTwoReturnValues
	b _081598F0
_081598E6:
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl EmitTwoReturnValues
_081598F0:
	bl PlayerPartnerBufferExecCompleted
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
	ldr r5, _0815998C @ =gUnknown_2023FF8
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
_0815998C: .4byte gUnknown_2023FF8
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
	bl EmitTwoReturnValues
	bl PlayerPartnerBufferExecCompleted
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
	ldr r5, _08159AAC @ =gUnknown_2023FFC
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
_08159AAC: .4byte gUnknown_2023FFC
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
	ldr r0, _08159B60 @ =gUnknown_2022BC6
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
	ldr r1, _08159B64 @ =gUnknown_3004FE0
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
_08159B60: .4byte gUnknown_2022BC6
_08159B64: .4byte gUnknown_3004FE0
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
	ldr r1, _08159BA0 @ =gUnknown_3004FE0
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08159BA4 @ =sub_81560DC
	str r1, [r0]
	bx lr
	.align 2, 0
_08159B98: .4byte gUnknown_3005EE0
_08159B9C: .4byte gActiveBattler
_08159BA0: .4byte gUnknown_3004FE0
_08159BA4: .4byte sub_81560DC
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
	ldr r0, _08159C40 @ =gUnknown_2022976
	ldrh r0, [r0]
	strb r0, [r1, 0x4]
	bl sub_80EB30C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	b _08159C9E
	.align 2, 0
_08159C3C: .4byte gPaletteFade
_08159C40: .4byte gUnknown_2022976
_08159C44:
	ldr r1, _08159C5C @ =gUnknown_2022976
	movs r0, 0
	strh r0, [r1]
	bl sub_8159EF0
	bl BattleStringExpandPlaceholdersToDisplayedString
	ldr r0, _08159C60 @ =gDisplayedStringBattle
	movs r1, 0x18
	bl sub_80D87BC
	b _08159C94
	.align 2, 0
_08159C5C: .4byte gUnknown_2022976
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
	ldr r1, _08159D00 @ =gUnknown_2022976
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
_08159D00: .4byte gUnknown_2022976
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
	bl sub_80D87BC
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
