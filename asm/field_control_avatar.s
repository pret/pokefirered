	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start IsWarpMetatileBehavior
IsWarpMetatileBehavior: @ 806DAF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsWarpDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsLadder
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsEscalator
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsCaveDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsLavaridgeB1FWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsLavaridge1FWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsWarpPad
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsFallWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsUnionRoomWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	movs r0, 0
	b _0806DB7E
_0806DB7C:
	movs r0, 0x1
_0806DB7E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsWarpMetatileBehavior

	thumb_func_start sub_806DB84
sub_806DB84: @ 806DB84
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x3
	beq _0806DB98
	cmp r1, 0x4
	beq _0806DBB0
	b _0806DBD0
_0806DB98:
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6D
	lsls r0, 24
	cmp r0, 0
	bne _0806DBCC
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6F
	b _0806DBC6
_0806DBB0:
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6C
	lsls r0, 24
	cmp r0, 0
	bne _0806DBCC
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6E
_0806DBC6:
	lsls r0, 24
	cmp r0, 0
	beq _0806DBD0
_0806DBCC:
	movs r0, 0x1
	b _0806DBD2
_0806DBD0:
	movs r0, 0
_0806DBD2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806DB84

	thumb_func_start IsArrowWarpMetatileBehavior
IsArrowWarpMetatileBehavior: @ 806DBD8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x2
	beq _0806DBFC
	cmp r1, 0x2
	bgt _0806DBF2
	cmp r1, 0x1
	beq _0806DC06
	b _0806DC28
_0806DBF2:
	cmp r2, 0x3
	beq _0806DC10
	cmp r2, 0x4
	beq _0806DC1A
	b _0806DC28
_0806DBFC:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsNorthArrowWarp
	b _0806DC22
_0806DC06:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSouthArrowWarp
	b _0806DC22
_0806DC10:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWestArrowWarp
	b _0806DC22
_0806DC1A:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsEastArrowWarp
_0806DC22:
	lsls r0, 24
	lsrs r0, 24
	b _0806DC2A
_0806DC28:
	movs r0, 0
_0806DC2A:
	pop {r1}
	bx r1
	thumb_func_end IsArrowWarpMetatileBehavior

	thumb_func_start GetWarpEventAtMapPosition
GetWarpEventAtMapPosition: @ 806DC30
	push {lr}
	adds r3, r1, 0
	ldrh r1, [r3]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r3, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r3, 0x4]
	bl map_warp_check
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetWarpEventAtMapPosition

	thumb_func_start SetupWarp
SetupWarp: @ 806DC54
	push {r4-r7,lr}
	adds r5, r2, 0
	ldr r0, _0806DC74 @ =gMapHeader
	ldr r0, [r0, 0x4]
	lsls r1, 24
	asrs r7, r1, 24
	lsls r6, r7, 3
	ldr r0, [r0, 0x8]
	adds r4, r0, r6
	ldrb r0, [r4, 0x6]
	cmp r0, 0x7F
	bne _0806DC78
	ldrb r0, [r4, 0x5]
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	b _0806DCC4
	.align 2, 0
_0806DC74: .4byte gMapHeader
_0806DC78:
	movs r0, 0x7
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	ldrsb r1, [r4, r1]
	movs r2, 0x5
	ldrsb r2, [r4, r2]
	bl warp1_set_2
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl sub_805550C
	ldrb r0, [r4, 0x7]
	ldrb r1, [r4, 0x6]
	bl Overworld_GetMapHeaderByGroupAndId
	ldr r1, [r0, 0x4]
	ldrb r0, [r4, 0x5]
	ldr r1, [r1, 0x8]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0x7F
	bne _0806DCC4
	adds r0, r6, r1
	ldrb r0, [r0, 0x5]
	ldr r1, _0806DCCC @ =gSaveBlock1Ptr
	ldr r2, [r1]
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, 0x5]
	lsls r2, 24
	asrs r2, 24
	adds r3, r7, 0
	bl saved_warp2_set
_0806DCC4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DCCC: .4byte gSaveBlock1Ptr
	thumb_func_end SetupWarp

	thumb_func_start TryDoorWarp
TryDoorWarp: @ 806DCD0
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0x2
	bne _0806DD30
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWarpDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DD30
	ldr r7, _0806DD2C @ =gMapHeader
	adds r0, r7, 0
	adds r1, r6, 0
	bl GetWarpEventAtMapPosition
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _0806DD30
	adds r0, r5, 0
	bl IsWarpMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DD30
	bl StoreInitialPlayerAvatarState
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl SetupWarp
	bl DoDoorWarp
	movs r0, 0x1
	b _0806DD32
	.align 2, 0
_0806DD2C: .4byte gMapHeader
_0806DD30:
	movs r0, 0
_0806DD32:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end TryDoorWarp

	thumb_func_start map_warp_check
map_warp_check: @ 806DD38
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 24
	lsrs r4, r3, 24
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x8]
	ldrb r3, [r0, 0x1]
	movs r2, 0
	cmp r2, r3
	bge _0806DD76
_0806DD52:
	ldrh r0, [r1]
	cmp r0, r6
	bne _0806DD6E
	ldrh r0, [r1, 0x2]
	cmp r0, r5
	bne _0806DD6E
	ldrb r0, [r1, 0x4]
	cmp r0, r4
	beq _0806DD68
	cmp r0, 0
	bne _0806DD6E
_0806DD68:
	lsls r0, r2, 24
	asrs r0, 24
	b _0806DD7A
_0806DD6E:
	adds r2, 0x1
	adds r1, 0x8
	cmp r2, r3
	blt _0806DD52
_0806DD76:
	movs r0, 0x1
	negs r0, r0
_0806DD7A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end map_warp_check

	thumb_func_start trigger_activate
trigger_activate: @ 806DD80
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _0806DDB6
	ldr r1, [r4, 0xC]
	cmp r1, 0
	bne _0806DD96
	ldrb r0, [r4, 0x6]
	bl trigger_activate_weather
	b _0806DDB6
_0806DD96:
	ldrh r0, [r4, 0x6]
	cmp r0, 0
	beq _0806DDB0
	ldrh r0, [r4, 0x6]
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	bne _0806DDB6
	ldr r0, [r4, 0xC]
	b _0806DDB8
_0806DDB0:
	adds r0, r1, 0
	bl ScriptContext2_RunNewScript
_0806DDB6:
	movs r0, 0
_0806DDB8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end trigger_activate

	thumb_func_start GetCoordEventScriptAtPosition
GetCoordEventScriptAtPosition: @ 806DDC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0xC]
	ldrb r7, [r0, 0x2]
	movs r6, 0
	cmp r6, r7
	bge _0806DE16
	adds r5, r1, 0
	adds r4, r5, 0
_0806DDEC:
	ldrh r0, [r4]
	cmp r0, r10
	bne _0806DE0C
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bne _0806DE0C
	ldrb r0, [r4, 0x4]
	cmp r0, r8
	beq _0806DE02
	cmp r0, 0
	bne _0806DE0C
_0806DE02:
	adds r0, r5, 0
	bl trigger_activate
	cmp r0, 0
	bne _0806DE18
_0806DE0C:
	adds r4, 0x10
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r7
	blt _0806DDEC
_0806DE16:
	movs r0, 0
_0806DE18:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetCoordEventScriptAtPosition

	thumb_func_start sub_806DE28
sub_806DE28: @ 806DE28
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	cmp r0, 0x66
	bne _0806DE64
	movs r0, 0x25
	bl PlaySE
	ldrb r0, [r5, 0x8]
	ldr r4, _0806DE6C @ =gSaveBlock1Ptr
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl RemoveObjectEventByLocalIdAndMap
	ldrb r0, [r5, 0x8]
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805FCD8
	lsls r0, 16
	lsrs r0, 16
	bl FlagClear
_0806DE64:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806DE6C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_806DE28

	thumb_func_start sub_806DE70
sub_806DE70: @ 806DE70
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 16
	ldr r2, _0806DEC0 @ =gMapHeader
	ldr r2, [r2, 0x4]
	ldr r4, [r2, 0xC]
	ldrb r5, [r2, 0x2]
	lsrs r7, r0, 16
	asrs r0, 16
	lsrs r6, r1, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	cmp r0, 0x20
	bne _0806DEB8
	cmp r5, 0
	beq _0806DEB8
_0806DE92:
	ldrh r0, [r4]
	adds r0, 0x7
	cmp r0, r7
	bne _0806DEB0
	ldrh r0, [r4, 0x2]
	adds r0, 0x7
	cmp r0, r6
	bne _0806DEB0
	bl sub_8112364
	ldr r0, [r4, 0xC]
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
_0806DEB0:
	adds r4, 0x10
	subs r5, 0x1
	cmp r5, 0
	bne _0806DE92
_0806DEB8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DEC0: .4byte gMapHeader
	thumb_func_end sub_806DE70

	thumb_func_start sub_806DEC4
sub_806DEC4: @ 806DEC4
	push {r4,lr}
	ldr r4, _0806DEE8 @ =gMapHeader
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl GetCoordEventScriptAtPosition
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806DEE8: .4byte gMapHeader
	thumb_func_end sub_806DEC4

	thumb_func_start GetBackgroundEventAtPosition
GetBackgroundEventAtPosition: @ 806DEEC
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, [r0, 0x4]
	ldr r4, [r0, 0x10]
	ldrb r3, [r0, 0x3]
	movs r2, 0
	cmp r2, r3
	bcs _0806DF32
_0806DF06:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r7
	bne _0806DF28
	ldrh r0, [r1, 0x2]
	cmp r0, r6
	bne _0806DF28
	ldrb r0, [r1, 0x4]
	cmp r0, r5
	beq _0806DF24
	cmp r0, 0
	bne _0806DF28
_0806DF24:
	adds r0, r1, 0
	b _0806DF34
_0806DF28:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _0806DF06
_0806DF32:
	movs r0, 0
_0806DF34:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetBackgroundEventAtPosition

	thumb_func_start dive_warp
dive_warp: @ 806DF3C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _0806DF70 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _0806DF74
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsMB19
	lsls r0, 24
	cmp r0, 0
	bne _0806DF74
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_8055824
	b _0806DF98
	.align 2, 0
_0806DF70: .4byte gMapHeader
_0806DF74:
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsDeepOrSemiDeepWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DFB0
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_8055844
_0806DF98:
	lsls r0, 24
	cmp r0, 0
	beq _0806DFB0
	bl StoreInitialPlayerAvatarState
	bl DoDiveWarp
	movs r0, 0xE2
	bl PlaySE
	movs r0, 0x1
	b _0806DFB2
_0806DFB0:
	movs r0, 0
_0806DFB2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end dive_warp

	thumb_func_start sub_806DFB8
sub_806DFB8: @ 806DFB8
	push {r4,r5,lr}
	sub sp, 0x4
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
	lsrs r5, r0, 24
	ldr r0, _0806E010 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _0806E014
	adds r0, r5, 0
	bl MetatileBehavior_IsMB19
	lsls r0, 24
	cmp r0, 0
	bne _0806E014
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_8055824
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E044
	movs r0, 0x1
	b _0806E046
	.align 2, 0
_0806E010: .4byte gMapHeader
_0806E014:
	adds r0, r5, 0
	bl MetatileBehavior_IsDeepOrSemiDeepWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E044
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_8055844
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E044
	movs r0, 0x2
	b _0806E046
_0806E044:
	movs r0, 0
_0806E046:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806DFB8

	thumb_func_start GetObjectEventScriptPointerForComparison
GetObjectEventScriptPointerForComparison: @ 806E050
	push {r4,r5,lr}
	sub sp, 0x8
	bl GetPlayerMovementDirection
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	mov r0, sp
	bl GetInFrontOfPlayerPosition
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	adds r2, r4, 0
	bl GetInteractedObjectEventScript
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetObjectEventScriptPointerForComparison

	thumb_func_start SetCableClubWarp
SetCableClubWarp: @ 806E08C
	push {r4,lr}
	sub sp, 0x8
	bl GetPlayerMovementDirection
	mov r4, sp
	mov r0, sp
	bl GetPlayerPosition
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	ldr r4, _0806E0CC @ =gMapHeader
	adds r0, r4, 0
	mov r1, sp
	bl GetWarpEventAtMapPosition
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	mov r2, sp
	bl SetupWarp
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806E0CC: .4byte gMapHeader
	thumb_func_end SetCableClubWarp

	.align 2, 0 @ Don't pad with nop.
