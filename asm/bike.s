	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BD09C
sub_80BD09C: @ 80BD09C
	push {r4,lr}
	sub sp, 0x4
	mov r3, sp
	strb r0, [r3]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080BD0D0 @ =gUnknown_83E7CFC
	mov r0, sp
	bl sub_80BD0D4
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	mov r1, sp
	ldrb r1, [r1]
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD0D0: .4byte gUnknown_83E7CFC
	thumb_func_end sub_80BD09C

	thumb_func_start sub_80BD0D4
sub_80BD0D4: @ 80BD0D4
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080BD0F8 @ =gUnknown_83E7D10
	ldr r3, _080BD0FC @ =gPlayerAvatar
	ldrb r3, [r3, 0x8]
	lsls r3, 2
	adds r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BD0F8: .4byte gUnknown_83E7D10
_080BD0FC: .4byte gPlayerAvatar
	thumb_func_end sub_80BD0D4

	thumb_func_start sub_80BD100
sub_80BD100: @ 80BD100
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	ldr r5, _080BD15C @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BD160 @ =gMapObjects
	adds r4, r0
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	mov r0, r8
	strb r0, [r5, 0xA]
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsCyclingRoadPullDownTile
	cmp r0, 0x1
	bne _080BD176
	ldr r0, _080BD164 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r2, 0x2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080BD168
	strb r2, [r5, 0x8]
	strb r2, [r5, 0x2]
	ldrb r0, [r6]
	cmp r0, 0x1
	bhi _080BD172
	movs r0, 0x3
	b _080BD1B6
	.align 2, 0
_080BD15C: .4byte gPlayerAvatar
_080BD160: .4byte gMapObjects
_080BD164: .4byte gMain
_080BD168:
	ldrb r0, [r6]
	cmp r0, 0
	beq _080BD17E
	strb r2, [r5, 0x8]
	strb r2, [r5, 0x2]
_080BD172:
	movs r0, 0x4
	b _080BD1B6
_080BD176:
	ldrb r1, [r6]
	adds r0, r1, 0
	cmp r0, 0
	bne _080BD18C
_080BD17E:
	strb r7, [r6]
	ldr r1, _080BD188 @ =gPlayerAvatar
	movs r0, 0
	b _080BD1B4
	.align 2, 0
_080BD188: .4byte gPlayerAvatar
_080BD18C:
	cmp r0, r7
	beq _080BD1B0
	ldrb r0, [r5, 0x2]
	cmp r0, 0x2
	beq _080BD1B0
	movs r0, 0x1
	strb r0, [r5, 0x8]
	strb r1, [r5, 0x9]
	mov r0, r8
	strb r0, [r5, 0x2]
	adds r0, r6, 0
	mov r1, r10
	mov r2, r9
	bl sub_80BD0D4
	lsls r0, 24
	lsrs r0, 24
	b _080BD1B6
_080BD1B0:
	ldr r1, _080BD1C4 @ =gPlayerAvatar
	movs r0, 0x2
_080BD1B4:
	strb r0, [r1, 0x2]
_080BD1B6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BD1C4: .4byte gPlayerAvatar
	thumb_func_end sub_80BD100

	thumb_func_start sub_80BD1C8
sub_80BD1C8: @ 80BD1C8
	push {lr}
	ldr r2, _080BD1E4 @ =gPlayerAvatar
	ldrb r1, [r2, 0x9]
	strb r1, [r0]
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x2]
	strb r1, [r2, 0x8]
	bl sub_80BD664
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080BD1E4: .4byte gPlayerAvatar
	thumb_func_end sub_80BD1C8

	thumb_func_start sub_80BD1E8
sub_80BD1E8: @ 80BD1E8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	ldr r4, _080BD240 @ =gPlayerAvatar
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BD244 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsCyclingRoadPullDownTile
	adds r2, r0, 0
	cmp r2, 0x1
	bne _080BD25A
	ldrb r1, [r6]
	cmp r1, r5
	beq _080BD248
	movs r0, 0
	strb r2, [r4, 0x8]
	strb r1, [r4, 0x9]
	strb r0, [r4, 0x2]
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	bl sub_80BD0D4
	lsls r0, 24
	lsrs r0, 24
	b _080BD270
	.align 2, 0
_080BD240: .4byte gPlayerAvatar
_080BD244: .4byte gMapObjects
_080BD248:
	movs r0, 0x2
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x8]
	cmp r5, 0x1
	bhi _080BD256
	movs r0, 0x3
	b _080BD270
_080BD256:
	movs r0, 0x4
	b _080BD270
_080BD25A:
	movs r0, 0
	strb r0, [r4, 0x8]
	ldrb r0, [r6]
	cmp r0, 0
	beq _080BD26A
	movs r0, 0x2
	strb r0, [r4, 0x2]
	b _080BD270
_080BD26A:
	strb r7, [r6]
	strb r0, [r4, 0x2]
	movs r0, 0
_080BD270:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD1E8

	thumb_func_start sub_80BD27C
sub_80BD27C: @ 80BD27C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl PlayerFaceDirection
	pop {r0}
	bx r0
	thumb_func_end sub_80BD27C

	thumb_func_start sub_80BD28C
sub_80BD28C: @ 80BD28C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BD2C0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BD2C4 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80BD4F0
	lsls r0, 24
	cmp r0, 0
	bne _080BD2B2
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080BD2B2:
	adds r0, r4, 0
	bl PlayerFaceDirection
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD2C0: .4byte gPlayerAvatar
_080BD2C4: .4byte gMapObjects
	thumb_func_end sub_80BD28C

	thumb_func_start sub_80BD2C8
sub_80BD2C8: @ 80BD2C8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r0, _080BD2F8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BD2FC @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80BD4F0
	lsls r0, 24
	cmp r0, 0
	bne _080BD300
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_80BD27C
	b _080BD350
	.align 2, 0
_080BD2F8: .4byte gPlayerAvatar
_080BD2FC: .4byte gMapObjects
_080BD300:
	adds r0, r4, 0
	bl sub_80BD3A0
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080BD334
	cmp r1, 0x6
	bne _080BD322
	adds r0, r4, 0
	bl sub_805C23C
	b _080BD350
_080BD322:
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080BD350
	adds r0, r4, 0
	bl PlayerOnBikeCollide
	b _080BD350
_080BD334:
	cmp r1, 0xE
	beq _080BD342
	adds r0, r4, 0
	bl sub_805BAAC
	cmp r0, 0
	beq _080BD34A
_080BD342:
	adds r0, r4, 0
	bl sub_805C11C
	b _080BD350
_080BD34A:
	adds r0, r6, 0
	bl sub_805C14C
_080BD350:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD2C8

	thumb_func_start sub_80BD358
sub_80BD358: @ 80BD358
	push {lr}
	movs r0, 0x1
	bl sub_80BD3A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080BD370
	movs r0, 0x1
	bl sub_805C164
	b _080BD37A
_080BD370:
	cmp r0, 0x6
	bne _080BD37A
	movs r0, 0x1
	bl sub_805C23C
_080BD37A:
	pop {r0}
	bx r0
	thumb_func_end sub_80BD358

	thumb_func_start sub_80BD380
sub_80BD380: @ 80BD380
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80BD3A0
	lsls r0, 24
	cmp r0, 0
	bne _080BD398
	adds r0, r4, 0
	bl sub_805C104
_080BD398:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD380

	thumb_func_start sub_80BD3A0
sub_80BD3A0: @ 80BD3A0
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080BD404 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BD408 @ =gMapObjects
	adds r4, r0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	bl MoveCoords
	add r0, sp, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	add r1, sp, 0x4
	movs r3, 0
	ldrsh r1, [r1, r3]
	movs r3, 0
	ldrsh r2, [r5, r3]
	str r0, [sp]
	adds r0, r4, 0
	adds r3, r6, 0
	bl sub_80BD40C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BD404: .4byte gPlayerAvatar
_080BD408: .4byte gMapObjects
	thumb_func_end sub_80BD3A0

	thumb_func_start sub_80BD40C
sub_80BD40C: @ 80BD40C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x14]
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r5, r4, 24
	adds r6, r5, 0
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	str r5, [sp]
	bl sub_805BBA8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bhi _080BD456
	adds r0, r5, 0
	bl MetatileBehavior_IsCrackedIce
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD444
	movs r0, 0xE
	b _080BD458
_080BD444:
	cmp r4, 0
	bne _080BD456
	adds r0, r6, 0
	bl sub_80BD4B8
	lsls r0, 24
	cmp r0, 0
	beq _080BD456
	movs r4, 0x2
_080BD456:
	adds r0, r4, 0
_080BD458:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD40C

	thumb_func_start sub_80BD460
sub_80BD460: @ 80BD460
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BD4B8
	lsls r0, 24
	cmp r0, 0
	bne _080BD478
	ldr r0, _080BD47C @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x8
	bne _080BD480
_080BD478:
	movs r0, 0x1
	b _080BD482
	.align 2, 0
_080BD47C: .4byte gMapHeader
_080BD480:
	movs r0, 0
_080BD482:
	pop {r1}
	bx r1
	thumb_func_end sub_80BD460

	thumb_func_start sub_80BD488
sub_80BD488: @ 80BD488
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BD4AC @ =gMapHeader
	ldrb r1, [r0, 0x19]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BD4A8
	adds r0, r2, 0
	bl sub_80BD4B8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD4B0
_080BD4A8:
	movs r0, 0x1
	b _080BD4B2
	.align 2, 0
_080BD4AC: .4byte gMapHeader
_080BD4B0:
	movs r0, 0
_080BD4B2:
	pop {r1}
	bx r1
	thumb_func_end sub_80BD488

	thumb_func_start sub_80BD4B8
sub_80BD4B8: @ 80BD4B8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsMB0A
	lsls r0, 24
	cmp r0, 0
	bne _080BD4E2
	adds r0, r4, 0
	bl MetatileBehavior_ReturnFalse_9
	lsls r0, 24
	cmp r0, 0
	beq _080BD4E6
	bl PlayerGetZCoord
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080BD4E6
_080BD4E2:
	movs r0, 0x1
	b _080BD4E8
_080BD4E6:
	movs r0, 0
_080BD4E8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD4B8

	thumb_func_start sub_80BD4F0
sub_80BD4F0: @ 80BD4F0
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0xFD
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080BD51A
	adds r0, r4, 0
	bl MetatileBehavior_ReturnFalse_15
	lsls r0, 24
	cmp r0, 0
	bne _080BD532
	adds r0, r4, 0
	bl MetatileBehavior_ReturnFalse_17
	b _080BD52C
_080BD51A:
	adds r0, r5, 0
	bl MetatileBehavior_ReturnFalse_16
	lsls r0, 24
	cmp r0, 0
	bne _080BD532
	adds r0, r5, 0
	bl MetatileBehavior_ReturnFalse_18
_080BD52C:
	lsls r0, 24
	cmp r0, 0
	beq _080BD536
_080BD532:
	movs r0, 0
	b _080BD538
_080BD536:
	movs r0, 0x1
_080BD538:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD4F0

	thumb_func_start sub_80BD540
sub_80BD540: @ 80BD540
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080BD57C @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	bne _080BD580
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BD4B8
	lsls r0, 24
	cmp r0, 0
	bne _080BD580
	movs r0, 0
	b _080BD582
	.align 2, 0
_080BD57C: .4byte gPlayerAvatar
_080BD580:
	movs r0, 0x1
_080BD582:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD540

	thumb_func_start player_should_look_direction_be_enforced_upon_movement
player_should_look_direction_be_enforced_upon_movement: @ 80BD58C
	push {lr}
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _080BD5C0
	ldr r2, _080BD5B8 @ =gMapObjects
	ldr r0, _080BD5BC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_ReturnFalse_14
	lsls r0, 24
	cmp r0, 0
	beq _080BD5C0
	movs r0, 0
	b _080BD5C2
	.align 2, 0
_080BD5B8: .4byte gMapObjects
_080BD5BC: .4byte gPlayerAvatar
_080BD5C0:
	movs r0, 0x1
_080BD5C2:
	pop {r1}
	bx r1
	thumb_func_end player_should_look_direction_be_enforced_upon_movement

	thumb_func_start StartTransitionToFlipBikeState
StartTransitionToFlipBikeState: @ 80BD5C8
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080BD5F0 @ =gUnknown_2036E2C
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080BD5F4 @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _080BD5F8
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	bl sav1_reset_battle_music_maybe
	bl sub_8055DC4
	b _080BD618
	.align 2, 0
_080BD5F0: .4byte gUnknown_2036E2C
_080BD5F4: .4byte gPlayerAvatar
_080BD5F8:
	adds r0, r2, 0
	bl SetPlayerAvatarTransitionFlags
	movs r4, 0x8D @ BGM_FRLG_BICYCLE
	lsls r4, 1    @ BGM_FRLG_BICYCLE
	adds r0, r4, 0
	bl sub_8056124
	cmp r0, 0
	beq _080BD618
	adds r0, r4, 0
	bl Overworld_SetSavedMusic
	adds r0, r4, 0
	bl Overworld_ChangeMusicTo
_080BD618:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end StartTransitionToFlipBikeState

	thumb_func_start sub_80BD620
sub_80BD620: @ 80BD620
	push {lr}
	ldr r2, _080BD64C @ =gPlayerAvatar
	movs r3, 0
	strb r3, [r2, 0x8]
	strb r3, [r2, 0x9]
	strb r3, [r2, 0xA]
	strb r3, [r2, 0xB]
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
	strh r3, [r2, 0x1C]
	movs r1, 0
	adds r2, 0x14
_080BD638:
	adds r0, r1, r2
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _080BD638
	pop {r0}
	bx r0
	.align 2, 0
_080BD64C: .4byte gPlayerAvatar
	thumb_func_end sub_80BD620

	thumb_func_start Bike_UpdateBikeCounterSpeed
Bike_UpdateBikeCounterSpeed: @ 80BD650
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BD660 @ =gPlayerAvatar
	strb r0, [r2, 0xA]
	lsrs r1, r0, 1
	adds r0, r1
	strb r0, [r2, 0xB]
	bx lr
	.align 2, 0
_080BD660: .4byte gPlayerAvatar
	thumb_func_end Bike_UpdateBikeCounterSpeed

	thumb_func_start sub_80BD664
sub_80BD664: @ 80BD664
	ldr r1, _080BD670 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0xA]
	strb r0, [r1, 0xB]
	bx lr
	.align 2, 0
_080BD670: .4byte gPlayerAvatar
	thumb_func_end sub_80BD664

	thumb_func_start GetPlayerSpeed
GetPlayerSpeed: @ 80BD674
	push {lr}
	sub sp, 0x8
	ldr r1, _080BD69C @ =gUnknown_83E7D1C
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r2, _080BD6A0 @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BD6A4
	ldrb r0, [r2, 0xA]
	lsls r0, 1
	add r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	b _080BD6BE
	.align 2, 0
_080BD69C: .4byte gUnknown_83E7D1C
_080BD6A0: .4byte gPlayerAvatar
_080BD6A4:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080BD6B0
	movs r0, 0x3
	b _080BD6BE
_080BD6B0:
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _080BD6BC
	movs r0, 0x1
	b _080BD6BE
_080BD6BC:
	movs r0, 0x2
_080BD6BE:
	add sp, 0x8
	pop {r1}
	bx r1
	thumb_func_end GetPlayerSpeed

	thumb_func_start Bike_HandleBumpySlopeJump
Bike_HandleBumpySlopeJump: @ 80BD6C4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080BD714 @ =gPlayerAvatar
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080BD70C
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_ReturnFalse_14
	lsls r0, 24
	cmp r0, 0
	beq _080BD70C
	movs r0, 0x2
	strb r0, [r5, 0x8]
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	bl nullsub_24
_080BD70C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD714: .4byte gPlayerAvatar
	thumb_func_end Bike_HandleBumpySlopeJump

	.align 2, 0 @ Don't pad with nop.
