	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start task_mpl_807E3C8
task_mpl_807E3C8: @ 807E3C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807E418
	cmp r0, 0x1
	bne _0807E3E4
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	bl sub_80696C0
_0807E3E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807E3C8

	thumb_func_start sub_807E3EC
sub_807E3EC: @ 807E3EC
	push {lr}
	bl ScriptContext2_Enable
	bl Overworld_PlaySpecialMapMusic
	bl sub_807DC00
	ldr r0, _0807E408 @ =task_mpl_807E3C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E408: .4byte task_mpl_807E3C8
	thumb_func_end sub_807E3EC

	thumb_func_start sub_807E40C
sub_807E40C: @ 807E40C
	ldr r0, _0807E414 @ =gPaletteFade
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	bx lr
	.align 2, 0
_0807E414: .4byte gPaletteFade
	thumb_func_end sub_807E40C

	thumb_func_start sub_807E418
sub_807E418: @ 807E418
	push {lr}
	bl sub_807AA70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807E432
	bl sub_80F83B0
	cmp r0, 0
	beq _0807E432
	movs r0, 0x1
	b _0807E434
_0807E432:
	movs r0, 0
_0807E434:
	pop {r1}
	bx r1
	thumb_func_end sub_807E418

	thumb_func_start DoWarp
DoWarp: @ 807E438
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055F88
	bl sub_807DC18
	bl PlayRainStoppingSoundEffect
	movs r0, 0x9
	bl PlaySE
	ldr r0, _0807E464 @ =gFieldCallback
	ldr r1, _0807E468 @ =sub_807DF64
	str r1, [r0]
	ldr r0, _0807E46C @ =sub_807E718
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E464: .4byte gFieldCallback
_0807E468: .4byte sub_807DF64
_0807E46C: .4byte sub_807E718
	thumb_func_end DoWarp

	thumb_func_start DoDiveWarp
DoDiveWarp: @ 807E470
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055F88
	bl sub_807DC18
	bl PlayRainStoppingSoundEffect
	ldr r0, _0807E494 @ =gFieldCallback
	ldr r1, _0807E498 @ =sub_807DF64
	str r1, [r0]
	ldr r0, _0807E49C @ =sub_807E718
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E494: .4byte gFieldCallback
_0807E498: .4byte sub_807DF64
_0807E49C: .4byte sub_807E718
	thumb_func_end DoDiveWarp

	thumb_func_start sub_807E4A0
sub_807E4A0: @ 807E4A0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _0807E4D4 @ =sub_807E980
	adds r0, r6, 0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807E4D8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0x26]
	bl _call_via_r6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E4D4: .4byte sub_807E980
_0807E4D8: .4byte gTasks
	thumb_func_end sub_807E4A0

	thumb_func_start DoDoorWarp
DoDoorWarp: @ 807E4DC
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _0807E4F4 @ =gFieldCallback
	ldr r1, _0807E4F8 @ =sub_807DF64
	str r1, [r0]
	ldr r0, _0807E4FC @ =sub_807E80C
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E4F4: .4byte gFieldCallback
_0807E4F8: .4byte sub_807DF64
_0807E4FC: .4byte sub_807E80C
	thumb_func_end DoDoorWarp

	thumb_func_start sub_807E500
sub_807E500: @ 807E500
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _0807E518 @ =sub_807E718
	movs r1, 0xA
	bl CreateTask
	ldr r1, _0807E51C @ =gFieldCallback
	ldr r0, _0807E520 @ =sub_807DF94
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807E518: .4byte sub_807E718
_0807E51C: .4byte gFieldCallback
_0807E520: .4byte sub_807DF94
	thumb_func_end sub_807E500

	thumb_func_start sub_807E524
sub_807E524: @ 807E524
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _0807E53C @ =gFieldCallback
	ldr r1, _0807E540 @ =sub_807DF64
	str r1, [r0]
	ldr r0, _0807E544 @ =sub_807E784
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E53C: .4byte gFieldCallback
_0807E540: .4byte sub_807DF64
_0807E544: .4byte sub_807E784
	thumb_func_end sub_807E524

	thumb_func_start DoFallWarp
DoFallWarp: @ 807E548
	push {lr}
	bl DoDiveWarp
	ldr r1, _0807E558 @ =gFieldCallback
	ldr r0, _0807E55C @ =sub_8084454
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807E558: .4byte gFieldCallback
_0807E55C: .4byte sub_8084454
	thumb_func_end DoFallWarp

	thumb_func_start sub_807E560
sub_807E560: @ 807E560
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	adds r0, r4, 0
	movs r1, 0xA
	bl sub_8084784
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807E560

	thumb_func_start sub_807E57C
sub_807E57C: @ 807E57C
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_8084F2C
	pop {r0}
	bx r0
	thumb_func_end sub_807E57C

	thumb_func_start sub_807E58C
sub_807E58C: @ 807E58C
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_80853CC
	pop {r0}
	bx r0
	thumb_func_end sub_807E58C

	thumb_func_start sub_807E59C
sub_807E59C: @ 807E59C
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055F88
	ldr r0, _0807E5B8 @ =sub_807E784
	movs r1, 0xA
	bl CreateTask
	ldr r1, _0807E5BC @ =gFieldCallback
	ldr r0, _0807E5C0 @ =sub_807DF94
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807E5B8: .4byte sub_807E784
_0807E5BC: .4byte gFieldCallback
_0807E5C0: .4byte sub_807DF94
	thumb_func_end sub_807E59C

	thumb_func_start sub_807E5C4
sub_807E5C4: @ 807E5C4
	push {lr}
	bl ScriptContext2_Enable
	bl sub_807DC18
	ldr r0, _0807E5E0 @ =sub_807E718
	movs r1, 0xA
	bl CreateTask
	ldr r1, _0807E5E4 @ =gFieldCallback
	ldr r0, _0807E5E8 @ =nullsub_60
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807E5E0: .4byte sub_807E718
_0807E5E4: .4byte gFieldCallback
_0807E5E8: .4byte nullsub_60
	thumb_func_end sub_807E5C4

	thumb_func_start sub_807E5EC
sub_807E5EC: @ 807E5EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807E610 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807E620
	cmp r0, 0x1
	bgt _0807E614
	cmp r0, 0
	beq _0807E61A
	b _0807E64A
	.align 2, 0
_0807E610: .4byte gTasks
_0807E614:
	cmp r0, 0x2
	beq _0807E63A
	b _0807E64A
_0807E61A:
	bl ScriptContext2_Enable
	b _0807E632
_0807E620:
	bl sub_807E40C
	cmp r0, 0
	bne _0807E64A
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807E64A
_0807E632:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807E64A
_0807E63A:
	bl WarpIntoMap
	ldr r0, _0807E650 @ =sub_8056788
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0807E64A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E650: .4byte sub_8056788
	thumb_func_end sub_807E5EC

	thumb_func_start sub_807E654
sub_807E654: @ 807E654
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055F88
	bl sub_807DC18
	movs r0, 0x9
	bl PlaySE
	ldr r0, _0807E674 @ =sub_807E5EC
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E674: .4byte sub_807E5EC
	thumb_func_end sub_807E654

	thumb_func_start sub_807E678
sub_807E678: @ 807E678
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807E69C @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807E6BE
	cmp r0, 0x1
	bgt _0807E6A0
	cmp r0, 0
	beq _0807E6A6
	b _0807E6F4
	.align 2, 0
_0807E69C: .4byte gTasks+0x8
_0807E6A0:
	cmp r0, 0x2
	beq _0807E6DC
	b _0807E6F4
_0807E6A6:
	bl sub_800A068
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl sub_8055F88
	movs r0, 0x9
	bl PlaySE
	b _0807E6D4
_0807E6BE:
	bl sub_807E40C
	cmp r0, 0
	bne _0807E6F4
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807E6F4
	bl sub_800AAC0
_0807E6D4:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807E6F4
_0807E6DC:
	ldr r0, _0807E6FC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E6F4
	bl WarpIntoMap
	ldr r0, _0807E700 @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0807E6F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E6FC: .4byte gReceivedRemoteLinkPlayers
_0807E700: .4byte CB2_LoadMap
	thumb_func_end sub_807E678

	thumb_func_start sub_807E704
sub_807E704: @ 807E704
	push {lr}
	ldr r0, _0807E714 @ =sub_807E678
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E714: .4byte sub_807E678
	thumb_func_end sub_807E704

	thumb_func_start sub_807E718
sub_807E718: @ 807E718
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807E73C @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807E750
	cmp r0, 0x1
	bgt _0807E740
	cmp r0, 0
	beq _0807E746
	b _0807E77A
	.align 2, 0
_0807E73C: .4byte gTasks
_0807E740:
	cmp r0, 0x2
	beq _0807E76A
	b _0807E77A
_0807E746:
	bl player_bitmagic
	bl ScriptContext2_Enable
	b _0807E762
_0807E750:
	bl sub_807E40C
	cmp r0, 0
	bne _0807E77A
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807E77A
_0807E762:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807E77A
_0807E76A:
	bl WarpIntoMap
	ldr r0, _0807E780 @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0807E77A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E780: .4byte CB2_LoadMap
	thumb_func_end sub_807E718

	thumb_func_start sub_807E784
sub_807E784: @ 807E784
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807E7A8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807E7CA
	cmp r0, 0x1
	bgt _0807E7AC
	cmp r0, 0
	beq _0807E7B6
	b _0807E802
	.align 2, 0
_0807E7A8: .4byte gTasks
_0807E7AC:
	cmp r0, 0x2
	beq _0807E7D8
	cmp r0, 0x3
	beq _0807E7F2
	b _0807E802
_0807E7B6:
	bl player_bitmagic
	bl ScriptContext2_Enable
	movs r0, 0x27
	bl PlaySE
	bl sub_805DAB0
	b _0807E7EA
_0807E7CA:
	bl sub_805DAD0
	cmp r0, 0
	bne _0807E802
	bl sub_807DC18
	b _0807E7EA
_0807E7D8:
	bl sub_807E40C
	cmp r0, 0
	bne _0807E802
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807E802
_0807E7EA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807E802
_0807E7F2:
	bl WarpIntoMap
	ldr r0, _0807E808 @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0807E802:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E808: .4byte CB2_LoadMap
	thumb_func_end sub_807E784

	thumb_func_start sub_807E80C
sub_807E80C: @ 807E80C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0807E83C @ =gTasks
	adds r5, r1, r0
	adds r4, r5, 0
	adds r4, 0xC
	adds r6, r5, 0
	adds r6, 0xE
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	adds r2, r0, 0
	cmp r1, 0x5
	bls _0807E830
	b _0807E976
_0807E830:
	lsls r0, r1, 2
	ldr r1, _0807E840 @ =_0807E844
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E83C: .4byte gTasks
_0807E840: .4byte _0807E844
	.align 2, 0
_0807E844:
	.4byte _0807E85C
	.4byte _0807E898
	.4byte _0807E8F4
	.4byte _0807E940
	.4byte _0807E95C
	.4byte _0807E966
_0807E85C:
	bl player_bitmagic
	adds r0, r4, 0
	adds r1, r6, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl GetDoorSoundEffect
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl FieldAnimateDoorOpen
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _0807E976
_0807E898:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _0807E8AE
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _0807E976
_0807E8AE:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _0807E8F0 @ =gMapObjects
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimActive
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x11
	bl FieldObjectSetHeldMovement
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _0807E976
	.align 2, 0
_0807E8F0: .4byte gMapObjects
_0807E8F4:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _0807E976
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl FieldAnimateDoorClose
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E93C @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearHeldMovementIfFinished
	movs r0, 0
	bl sub_807DCB0
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _0807E976
	.align 2, 0
_0807E93C: .4byte gMapObjects
_0807E940:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _0807E956
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _0807E976
_0807E956:
	movs r0, 0x4
	strh r0, [r5, 0x8]
	b _0807E976
_0807E95C:
	bl sub_8055F88
	bl sub_807DC18
	b _0807E96A
_0807E966:
	bl sub_8055F88
_0807E96A:
	bl PlayRainStoppingSoundEffect
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _0807E97C @ =sub_807E718
	str r0, [r5]
_0807E976:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E97C: .4byte sub_807E718
	thumb_func_end sub_807E80C

	thumb_func_start sub_807E980
sub_807E980: @ 807E980
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0807E9C0 @ =gTasks+0x8
	adds r5, r0, r1
	ldr r2, _0807E9C4 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E9C8 @ =gMapObjects
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E9CC @ =gSprites
	adds r7, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0807E9E8
	cmp r0, 0x1
	bgt _0807E9D0
	cmp r0, 0
	beq _0807E9DA
	b _0807EA9A
	.align 2, 0
_0807E9C0: .4byte gTasks+0x8
_0807E9C4: .4byte gPlayerAvatar
_0807E9C8: .4byte gMapObjects
_0807E9CC: .4byte gSprites
_0807E9D0:
	cmp r0, 0x2
	beq _0807EA38
	cmp r0, 0x3
	beq _0807EA66
	b _0807EA9A
_0807E9DA:
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl CameraObjectReset2
	b _0807EA92
_0807E9E8:
	adds r0, r6, 0
	bl FieldObjectIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _0807EA00
	adds r0, r6, 0
	bl FieldObjectClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0807EAB0
_0807EA00:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _0807EA10
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
	b _0807EAB0
_0807EA10:
	bl sub_8055F88
	bl PlayRainStoppingSoundEffect
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r7, 0x5]
	ldrh r0, [r5, 0x2]
	adds r1, r5, 0x4
	adds r2, r5, 0x6
	bl sub_807EB64
	movs r0, 0x9
	bl PlaySE
	b _0807EA92
_0807EA38:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	adds r2, r5, 0
	adds r2, 0x8
	adds r3, r5, 0
	adds r3, 0xA
	adds r4, r5, 0
	adds r4, 0xC
	str r4, [sp]
	bl sub_807EAC4
	ldrh r0, [r5, 0x1E]
	adds r0, 0x1
	strh r0, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _0807EAB0
	bl sub_807DC18
	b _0807EA92
_0807EA66:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	adds r2, r5, 0
	adds r2, 0x8
	adds r3, r5, 0
	adds r3, 0xA
	adds r4, r5, 0
	adds r4, 0xC
	str r4, [sp]
	bl sub_807EAC4
	bl sub_807E40C
	cmp r0, 0
	bne _0807EAB0
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807EAB0
_0807EA92:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0807EAB0
_0807EA9A:
	ldr r0, _0807EAB8 @ =gFieldCallback
	ldr r1, _0807EABC @ =sub_807DF64
	str r1, [r0]
	bl WarpIntoMap
	ldr r0, _0807EAC0 @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0807EAB0:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EAB8: .4byte gFieldCallback
_0807EABC: .4byte sub_807DF64
_0807EAC0: .4byte CB2_LoadMap
	thumb_func_end sub_807E980

	thumb_func_start sub_807EAC4
sub_807EAC4: @ 807EAC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r2, 0
	adds r5, r3, 0
	ldr r6, [sp, 0x18]
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	ldr r3, _0807EB58 @ =gPlayerAvatar
	ldrb r2, [r3, 0x4]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _0807EB5C @ =gSprites
	adds r7, r0, r2
	ldrb r2, [r3, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0807EB60 @ =gMapObjects
	adds r0, r2
	mov r8, r0
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0
	bgt _0807EB02
	movs r2, 0
	ldrsh r0, [r6, r2]
	cmp r0, 0x6
	ble _0807EB08
_0807EB02:
	ldrh r0, [r5]
	adds r0, r1, r0
	strh r0, [r5]
_0807EB08:
	mov r1, r12
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r2, [r4]
	adds r0, r2
	strh r0, [r4]
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	ldrh r0, [r4]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r7, 0x24]
	ldrh r0, [r5]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r7, 0x26]
	mov r1, r8
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0807EB4C
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl FieldObjectForceSetSpecialAnim
_0807EB4C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EB58: .4byte gPlayerAvatar
_0807EB5C: .4byte gSprites
_0807EB60: .4byte gMapObjects
	thumb_func_end sub_807EAC4

	thumb_func_start sub_807EB64
sub_807EB64: @ 807EB64
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _0807EBB4 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807EBB8 @ =gMapObjects
	adds r4, r0
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectForceSetSpecialAnim
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	bl sub_807EBBC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807EBB4: .4byte gPlayerAvatar
_0807EBB8: .4byte gMapObjects
	thumb_func_end sub_807EB64

	thumb_func_start sub_807EBBC
sub_807EBBC: @ 807EBBC
	push {r4-r7,lr}
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6C
	lsls r0, 24
	cmp r0, 0
	beq _0807EBE0
	movs r0, 0x10
	strh r0, [r5]
	movs r1, 0xA
	negs r1, r1
	adds r0, r1, 0
	b _0807EC2A
_0807EBE0:
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6D
	lsls r0, 24
	cmp r0, 0
	beq _0807EBFA
	movs r1, 0x11
	negs r1, r1
	adds r0, r1, 0
	strh r0, [r5]
	adds r1, 0x7
	adds r0, r1, 0
	b _0807EC2A
_0807EBFA:
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6E
	lsls r0, 24
	cmp r0, 0
	beq _0807EC0E
	movs r0, 0x11
	strh r0, [r5]
	movs r0, 0x3
	b _0807EC2A
_0807EC0E:
	adds r0, r7, 0
	bl MetatileBehavior_IsUnknownWarp6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807EC28
	movs r1, 0x11
	negs r1, r1
	adds r0, r1, 0
	strh r0, [r5]
	movs r0, 0x3
	b _0807EC2A
_0807EC28:
	strh r0, [r5]
_0807EC2A:
	strh r0, [r6]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807EBBC

	thumb_func_start sub_807EC34
sub_807EC34: @ 807EC34
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0807EC6C @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0807EC70
	cmp r0, 0x1
	beq _0807EC92
	bl sub_807E418
	cmp r0, 0x1
	bne _0807ECB2
	bl CameraObjectReset1
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	b _0807ECB2
	.align 2, 0
_0807EC6C: .4byte gTasks+0x8
_0807EC70:
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	adds r0, r5, 0x2
	adds r1, r5, 0x4
	adds r2, r5, 0x6
	adds r3, r5, 0
	adds r3, 0x8
	adds r4, r5, 0
	adds r4, 0xA
	str r4, [sp]
	bl sub_807ECBC
	b _0807ECAC
_0807EC92:
	adds r0, r5, 0x2
	adds r1, r5, 0x4
	adds r2, r5, 0x6
	adds r3, r5, 0
	adds r3, 0x8
	adds r4, r5, 0
	adds r4, 0xA
	str r4, [sp]
	bl sub_807EDA0
	lsls r0, 24
	cmp r0, 0
	bne _0807ECB2
_0807ECAC:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807ECB2:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807EC34

	thumb_func_start sub_807ECBC
sub_807ECBC: @ 807ECBC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	adds r5, r1, 0
	mov r9, r2
	mov r10, r3
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
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl MetatileBehavior_IsUnknownWarp6E
	lsls r0, 24
	cmp r0, 0
	bne _0807ED06
	adds r0, r6, 0
	bl MetatileBehavior_IsUnknownWarp6C
	lsls r0, 24
	cmp r0, 0
	beq _0807ED0A
_0807ED06:
	movs r1, 0x3
	b _0807ED0C
_0807ED0A:
	movs r1, 0x4
_0807ED0C:
	ldr r0, _0807ED94 @ =gPlayerAvatar
	mov r8, r0
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807ED98 @ =gMapObjects
	adds r4, r0
	adds r0, r1, 0
	bl sub_8064270
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectForceSetSpecialAnim
	adds r0, r6, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl sub_807EBBC
	movs r1, 0
	ldrsh r0, [r7, r1]
	lsls r0, 4
	mov r2, r9
	strh r0, [r2]
	movs r1, 0
	ldrsh r0, [r5, r1]
	lsls r0, 4
	mov r2, r10
	strh r0, [r2]
	movs r1, 0x10
	ldr r0, [sp, 0x24]
	strh r1, [r0]
	mov r1, r8
	ldrb r0, [r1, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0807ED9C @ =gSprites
	adds r1, r0
	mov r2, r9
	ldrh r0, [r2]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	mov r2, r10
	ldrh r0, [r2]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x26]
	movs r1, 0
	ldrsh r0, [r7, r1]
	negs r0, r0
	strh r0, [r7]
	movs r2, 0
	ldrsh r0, [r5, r2]
	negs r0, r0
	strh r0, [r5]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED94: .4byte gPlayerAvatar
_0807ED98: .4byte gMapObjects
_0807ED9C: .4byte gSprites
	thumb_func_end sub_807ECBC

	thumb_func_start sub_807EDA0
sub_807EDA0: @ 807EDA0
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r4, [sp, 0x14]
	ldr r0, _0807EDC8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807EDCC @ =gSprites
	adds r1, r0, r1
	movs r7, 0
	ldrsh r0, [r4, r7]
	cmp r0, 0
	bne _0807EDD0
	strh r0, [r1, 0x24]
	strh r0, [r1, 0x26]
	movs r0, 0
	b _0807EDF8
	.align 2, 0
_0807EDC8: .4byte gPlayerAvatar
_0807EDCC: .4byte gSprites
_0807EDD0:
	ldrh r0, [r5]
	ldrh r5, [r2]
	adds r0, r5
	strh r0, [r2]
	ldrh r0, [r6]
	ldrh r7, [r3]
	adds r0, r7
	strh r0, [r3]
	ldrh r0, [r2]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	ldrh r0, [r3]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x26]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	movs r0, 0x1
_0807EDF8:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807EDA0

	.align 2, 0 @ Don't pad with nop.
