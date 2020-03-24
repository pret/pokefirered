	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_805C06C
sub_805C06C: @ 805C06C
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _0805C09C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805C0A0 @ =gObjectEvents
	adds r0, r1
	adds r1, r4, 0
	bl ObjectEventSetHeldMovement
	lsls r0, 24
	cmp r0, 0
	bne _0805C094
	adds r0, r4, 0
	movs r1, 0
	bl sub_81126AC
_0805C094:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C09C: .4byte gPlayerAvatar
_0805C0A0: .4byte gObjectEvents
	thumb_func_end sub_805C06C

	thumb_func_start sub_805C0A4
sub_805C0A4: @ 805C0A4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	adds r1, r5, 0
	bl ObjectEventSetHeldMovement
	lsls r0, 24
	cmp r0, 0
	bne _0805C0CA
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	ldrb r2, [r4, 0xA]
	movs r3, 0x20
	str r3, [sp]
	adds r3, r5, 0
	bl sub_8112588
_0805C0CA:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_805C0A4

	thumb_func_start sub_805C0D4
sub_805C0D4: @ 805C0D4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063F2C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C0D4

	thumb_func_start PlayerGoSlow
PlayerGoSlow: @ 805C0EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063F58
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSlow

	thumb_func_start PlayerGoSpeed1
PlayerGoSpeed1: @ 805C104
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetWalkNormalMovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSpeed1

	thumb_func_start PlayerGoSpeed2
PlayerGoSpeed2: @ 805C11C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetWalkFastMovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSpeed2

	thumb_func_start sub_805C134
sub_805C134: @ 805C134
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063FDC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C134

	thumb_func_start PlayerRideWaterCurrent
PlayerRideWaterCurrent: @ 805C14C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8064008
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerRideWaterCurrent

	thumb_func_start sub_805C164
sub_805C164: @ 805C164
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetWalkFastestMovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C164

	thumb_func_start PlayerRun
PlayerRun: @ 805C17C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetPlayerRunMovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerRun

	thumb_func_start PlayerRunSlow
PlayerRunSlow: @ 805C194
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetPlayerRunSlowMovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerRunSlow

	thumb_func_start PlayerOnBikeCollide
PlayerOnBikeCollide: @ 805C1AC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_805C438
	adds r0, r4, 0
	bl GetWalkInPlaceNormalMovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerOnBikeCollide

	thumb_func_start PlayerNotOnBikeCollide
PlayerNotOnBikeCollide: @ 805C1D0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_805C438
	adds r0, r4, 0
	bl GetStepInPlaceDelay32AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeCollide

	thumb_func_start PlayerFaceDirection
PlayerFaceDirection: @ 805C1F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionMovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerFaceDirection

	thumb_func_start sub_805C20C
sub_805C20C: @ 805C20C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetWalkSlowMovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C20C

	thumb_func_start PlayerTurnInPlace
PlayerTurnInPlace: @ 805C224
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetWalkInPlaceSlowMovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerTurnInPlace

	thumb_func_start PlayerJumpLedge
PlayerJumpLedge: @ 805C23C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xA
	bl PlaySE
	adds r0, r4, 0
	bl GetJump2MovementAction
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerJumpLedge

	thumb_func_start sub_805C260
sub_805C260: @ 805C260
	push {lr}
	movs r0, 0x9F
	movs r1, 0
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C260

	thumb_func_start sub_805C270
sub_805C270: @ 805C270
	push {r4,lr}
	ldr r4, _0805C2AC @ =gPlayerAvatar
	ldrb r0, [r4, 0x3]
	cmp r0, 0x2
	beq _0805C27E
	cmp r0, 0
	bne _0805C2A6
_0805C27E:
	bl player_should_look_direction_be_enforced_upon_movement
	lsls r0, 24
	cmp r0, 0
	beq _0805C2A6
	ldr r2, _0805C2B0 @ =gObjectEvents
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionMovementAction
	lsls r0, 24
	lsrs r0, 24
	bl PlayerForceSetHeldMovement
_0805C2A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C2AC: .4byte gPlayerAvatar
_0805C2B0: .4byte gObjectEvents
	thumb_func_end sub_805C270

	thumb_func_start PlayerGoSpin
PlayerGoSpin: @ 805C2B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80640E4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSpin

	thumb_func_start sub_805C2CC
sub_805C2CC: @ 805C2CC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0805C308 @ =sForcedMovementFuncs
	ldr r0, [r1]
	cmp r0, 0
	beq _0805C302
	adds r4, r1, 0
	adds r7, r4, 0
	movs r5, 0
_0805C2E0:
	ldr r1, [r4]
	adds r0, r6, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _0805C2F8
	adds r0, r7, 0x4
	adds r0, r5, r0
	ldr r0, [r0]
	bl _call_via_r0
_0805C2F8:
	adds r4, 0x8
	adds r5, 0x8
	ldr r0, [r4]
	cmp r0, 0
	bne _0805C2E0
_0805C302:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C308: .4byte sForcedMovementFuncs
	thumb_func_end sub_805C2CC

	thumb_func_start sub_805C30C
sub_805C30C: @ 805C30C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80642F4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C30C

	thumb_func_start sub_805C324
sub_805C324: @ 805C324
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8064320
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C324

	thumb_func_start sub_805C33C
sub_805C33C: @ 805C33C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806434C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C33C

	thumb_func_start sub_805C354
sub_805C354: @ 805C354
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1C
	bl PlaySE
	adds r0, r4, 0
	bl sub_8064378
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805C354

	thumb_func_start sub_805C378
sub_805C378: @ 805C378
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1C
	bl PlaySE
	adds r0, r4, 0
	bl sub_80643A4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805C378

	thumb_func_start sub_805C39C
sub_805C39C: @ 805C39C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1C
	bl PlaySE
	adds r0, r4, 0
	bl sub_80643D0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805C39C

	thumb_func_start sub_805C3C0
sub_805C3C0: @ 805C3C0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1C
	bl PlaySE
	adds r0, r4, 0
	bl sub_8064168
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805C3C0

	thumb_func_start sub_805C3E4
sub_805C3E4: @ 805C3E4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	bl PlaySE
	adds r0, r4, 0
	bl sub_80643FC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805C3E4

	thumb_func_start sub_805C408
sub_805C408: @ 805C408
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8064428
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C408

	thumb_func_start sub_805C420
sub_805C420: @ 805C420
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8064454
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl PlayerSetAnimId
	pop {r0}
	bx r0
	thumb_func_end sub_805C420

	thumb_func_start sub_805C438
sub_805C438: @ 805C438
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	ldr r2, _0805C4E8 @ =gObjectEvents
	ldr r0, _0805C4EC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r4, [r0, 0x1E]
	ldr r1, _0805C4F0 @ =gUnknown_835B864
	subs r0, r5, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0805C4DE
	cmp r5, 0x3
	bne _0805C484
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6D
	lsls r0, 24
	cmp r0, 0
	bne _0805C4DE
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6F
	lsls r0, 24
	cmp r0, 0
	bne _0805C4DE
_0805C484:
	cmp r5, 0x4
	bne _0805C4A0
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6C
	lsls r0, 24
	cmp r0, 0
	bne _0805C4DE
	adds r0, r4, 0
	bl MetatileBehavior_IsUnknownWarp6E
	lsls r0, 24
	cmp r0, 0
	bne _0805C4DE
_0805C4A0:
	cmp r6, 0x2
	bne _0805C4D8
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r0, 0x2
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsWarpDoor
	lsls r0, 24
	cmp r0, 0
	bne _0805C4DE
_0805C4D8:
	movs r0, 0x7
	bl PlaySE
_0805C4DE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C4E8: .4byte gObjectEvents
_0805C4EC: .4byte gPlayerAvatar
_0805C4F0: .4byte gUnknown_835B864
	thumb_func_end sub_805C438

	thumb_func_start GetXYCoordsOneStepInFrontOfPlayer
GetXYCoordsOneStepInFrontOfPlayer: @ 805C4F4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r3, _0805C530 @ =gObjectEvents
	ldr r2, _0805C534 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x10]
	strh r0, [r4]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x12]
	strh r0, [r5]
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl MoveCoords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C530: .4byte gObjectEvents
_0805C534: .4byte gPlayerAvatar
	thumb_func_end GetXYCoordsOneStepInFrontOfPlayer

	thumb_func_start PlayerGetDestCoords
PlayerGetDestCoords: @ 805C538
	push {r4,r5,lr}
	ldr r5, _0805C560 @ =gObjectEvents
	ldr r4, _0805C564 @ =gPlayerAvatar
	ldrb r3, [r4, 0x5]
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	adds r2, r5
	ldrh r2, [r2, 0x10]
	strh r2, [r0]
	ldrb r2, [r4, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x12]
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C560: .4byte gObjectEvents
_0805C564: .4byte gPlayerAvatar
	thumb_func_end PlayerGetDestCoords

	thumb_func_start player_get_pos_including_state_based_drift
player_get_pos_including_state_based_drift: @ 805C568
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _0805C5BC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805C5C0 @ =gObjectEvents
	adds r3, r0, r1
	ldrb r1, [r3]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	beq _0805C588
	b _0805C6B0
_0805C588:
	ldr r2, _0805C5C4 @ =gSprites
	ldrb r1, [r3, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x32
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0805C59E
	b _0805C6B0
_0805C59E:
	ldrh r0, [r3, 0x10]
	strh r0, [r4]
	ldrh r0, [r3, 0x12]
	strh r0, [r5]
	ldrb r0, [r3, 0x1C]
	subs r0, 0x10
	cmp r0, 0x30
	bls _0805C5B0
	b _0805C6B0
_0805C5B0:
	lsls r0, 2
	ldr r1, _0805C5C8 @ =_0805C5CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805C5BC: .4byte gPlayerAvatar
_0805C5C0: .4byte gObjectEvents
_0805C5C4: .4byte gSprites
_0805C5C8: .4byte _0805C5CC
	.align 2, 0
_0805C5CC:
	.4byte _0805C690
	.4byte _0805C696
	.4byte _0805C6A0
	.4byte _0805C6A6
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C6B0
	.4byte _0805C690
	.4byte _0805C696
	.4byte _0805C6A0
	.4byte _0805C6A6
_0805C690:
	ldrh r0, [r5]
	adds r0, 0x1
	b _0805C69A
_0805C696:
	ldrh r0, [r5]
	subs r0, 0x1
_0805C69A:
	strh r0, [r5]
	movs r0, 0x1
	b _0805C6BC
_0805C6A0:
	ldrh r0, [r4]
	subs r0, 0x1
	b _0805C6AA
_0805C6A6:
	ldrh r0, [r4]
	adds r0, 0x1
_0805C6AA:
	strh r0, [r4]
	movs r0, 0x1
	b _0805C6BC
_0805C6B0:
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
	strh r0, [r4]
	strh r0, [r5]
	movs r0, 0
_0805C6BC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end player_get_pos_including_state_based_drift

	thumb_func_start GetPlayerFacingDirection
GetPlayerFacingDirection: @ 805C6C4
	ldr r2, _0805C6DC @ =gObjectEvents
	ldr r0, _0805C6E0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_0805C6DC: .4byte gObjectEvents
_0805C6E0: .4byte gPlayerAvatar
	thumb_func_end GetPlayerFacingDirection

	thumb_func_start GetPlayerMovementDirection
GetPlayerMovementDirection: @ 805C6E4
	ldr r2, _0805C6F8 @ =gObjectEvents
	ldr r0, _0805C6FC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	bx lr
	.align 2, 0
_0805C6F8: .4byte gObjectEvents
_0805C6FC: .4byte gPlayerAvatar
	thumb_func_end GetPlayerMovementDirection

	thumb_func_start PlayerGetZCoord
PlayerGetZCoord: @ 805C700
	ldr r2, _0805C714 @ =gObjectEvents
	ldr r0, _0805C718 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	bx lr
	.align 2, 0
_0805C714: .4byte gObjectEvents
_0805C718: .4byte gPlayerAvatar
	thumb_func_end PlayerGetZCoord

	thumb_func_start sub_805C71C
sub_805C71C: @ 805C71C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _0805C744 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805C748 @ =gObjectEvents
	adds r0, r1
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	bl MoveObjectEventToMapCoords
	pop {r0}
	bx r0
	.align 2, 0
_0805C744: .4byte gPlayerAvatar
_0805C748: .4byte gObjectEvents
	thumb_func_end sub_805C71C

	thumb_func_start TestPlayerAvatarFlags
TestPlayerAvatarFlags: @ 805C74C
	ldr r1, _0805C758 @ =gPlayerAvatar
	ldrb r1, [r1]
	ands r1, r0
	adds r0, r1, 0
	bx lr
	.align 2, 0
_0805C758: .4byte gPlayerAvatar
	thumb_func_end TestPlayerAvatarFlags

	thumb_func_start sub_805C75C
sub_805C75C: @ 805C75C
	ldr r0, _0805C764 @ =gPlayerAvatar
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805C764: .4byte gPlayerAvatar
	thumb_func_end sub_805C75C

	thumb_func_start GetPlayerAvatarObjectId
GetPlayerAvatarObjectId: @ 805C768
	ldr r0, _0805C770 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	bx lr
	.align 2, 0
_0805C770: .4byte gPlayerAvatar
	thumb_func_end GetPlayerAvatarObjectId

	thumb_func_start sub_805C774
sub_805C774: @ 805C774
	push {lr}
	bl ForcedMovement_None
	pop {r0}
	bx r0
	thumb_func_end sub_805C774

	thumb_func_start sub_805C780
sub_805C780: @ 805C780
	push {r4,lr}
	ldr r0, _0805C7C0 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805C7C4 @ =gObjectEvents
	adds r4, r0
	adds r0, r4, 0
	bl npc_clear_strange_bits
	ldrb r1, [r4, 0x18]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl SetObjectEventDirection
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805C7B8
	bl Bike_HandleBumpySlopeJump
	movs r0, 0
	bl Bike_UpdateBikeCounterSpeed
_0805C7B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C7C0: .4byte gPlayerAvatar
_0805C7C4: .4byte gObjectEvents
	thumb_func_end sub_805C780

	thumb_func_start sub_805C7C8
sub_805C7C8: @ 805C7C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_805C7C8

	thumb_func_start GetPlayerAvatarGraphicsIdByStateIdAndGender
GetPlayerAvatarGraphicsIdByStateIdAndGender: @ 805C7E0
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0805C7F4 @ =gUnknown_835B874
	lsrs r0, 23
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0805C7F4: .4byte gUnknown_835B874
	thumb_func_end GetPlayerAvatarGraphicsIdByStateIdAndGender

	thumb_func_start GetHoennLinkPartnerGraphicsIdByGender
GetHoennLinkPartnerGraphicsIdByGender: @ 805C7F8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805C804 @ =gUnknown_835B880
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805C804: .4byte gUnknown_835B880
	thumb_func_end GetHoennLinkPartnerGraphicsIdByGender

	thumb_func_start GetPlayerAvatarGraphicsIdByStateId
GetPlayerAvatarGraphicsIdByStateId: @ 805C808
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805C820 @ =gPlayerAvatar
	ldrb r1, [r1, 0x7]
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805C820: .4byte gPlayerAvatar
	thumb_func_end GetPlayerAvatarGraphicsIdByStateId

	thumb_func_start GetPlayerAvatarGenderByGraphicsId
GetPlayerAvatarGenderByGraphicsId: @ 805C824
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bgt _0805C836
	cmp r0, 0x7
	blt _0805C836
	movs r0, 0x1
	b _0805C838
_0805C836:
	movs r0, 0
_0805C838:
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarGenderByGraphicsId

	thumb_func_start PartyHasMonWithSurf
PartyHasMonWithSurf: @ 805C83C
	push {r4,r5,lr}
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _0805C880
	movs r5, 0
	b _0805C866
_0805C84E:
	adds r0, r4, 0
	movs r1, 0x39
	bl MonKnowsMove
	lsls r0, 24
	cmp r0, 0
	beq _0805C860
	movs r0, 0x1
	b _0805C882
_0805C860:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0805C866:
	cmp r5, 0x5
	bhi _0805C880
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0805C888 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0805C84E
_0805C880:
	movs r0, 0
_0805C882:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805C888: .4byte gPlayerParty
	thumb_func_end PartyHasMonWithSurf

	thumb_func_start IsPlayerSurfingNorth
IsPlayerSurfingNorth: @ 805C88C
	push {lr}
	bl GetPlayerMovementDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805C8AA
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805C8AA
	movs r0, 0x1
	b _0805C8AC
_0805C8AA:
	movs r0, 0
_0805C8AC:
	pop {r1}
	bx r1
	thumb_func_end IsPlayerSurfingNorth

	thumb_func_start IsPlayerFacingSurfableFishableWater
IsPlayerFacingSurfableFishableWater: @ 805C8B0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _0805C924 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805C928 @ =gObjectEvents
	adds r4, r0
	ldrh r1, [r4, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x2
	strh r0, [r5]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	ldrb r3, [r4, 0x18]
	lsls r3, 28
	lsrs r3, 28
	adds r0, r4, 0
	bl GetCollisionAtCoords
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805C92C
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805C92C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MetatileAtCoordsIsWaterTile
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805C92C
	movs r0, 0x1
	b _0805C92E
	.align 2, 0
_0805C924: .4byte gPlayerAvatar
_0805C928: .4byte gObjectEvents
_0805C92C:
	movs r0, 0
_0805C92E:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsPlayerFacingSurfableFishableWater

	thumb_func_start MetatileAtCoordsIsWaterTile
MetatileAtCoordsIsWaterTile: @ 805C938
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x1
	bl MapGridGetMetatileAttributeAt
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl TestMetatileAttributeBit
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end MetatileAtCoordsIsWaterTile

	thumb_func_start ClearPlayerAvatarInfo
ClearPlayerAvatarInfo: @ 805C95C
	push {lr}
	ldr r0, _0805C96C @ =gPlayerAvatar
	movs r1, 0
	movs r2, 0x20
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_0805C96C: .4byte gPlayerAvatar
	thumb_func_end ClearPlayerAvatarInfo

	thumb_func_start SetPlayerAvatarStateMask
SetPlayerAvatarStateMask: @ 805C970
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0805C984 @ =gPlayerAvatar
	ldrb r2, [r3]
	movs r1, 0xE0
	ands r1, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_0805C984: .4byte gPlayerAvatar
	thumb_func_end SetPlayerAvatarStateMask

	thumb_func_start GetPlayerAvatarStateTransitionByGraphicsId
GetPlayerAvatarStateTransitionByGraphicsId: @ 805C988
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	ldr r3, _0805C9B0 @ =gUnknown_835B882
	lsls r0, r1, 1
	adds r0, r1
	lsls r4, r0, 1
	adds r6, r3, 0x1
_0805C99E:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r5
	bne _0805C9B4
	adds r0, r1, r6
	ldrb r0, [r0]
	b _0805C9C0
	.align 2, 0
_0805C9B0: .4byte gUnknown_835B882
_0805C9B4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _0805C99E
	movs r0, 0x1
_0805C9C0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarStateTransitionByGraphicsId

	thumb_func_start GetPlayerAvatarGraphicsIdByCurrentState
GetPlayerAvatarGraphicsIdByCurrentState: @ 805C9C8
	push {r4-r6,lr}
	ldr r0, _0805C9F0 @ =gPlayerAvatar
	ldrb r5, [r0]
	movs r2, 0
	ldr r3, _0805C9F4 @ =gUnknown_835B882
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r4, r0, 1
	adds r6, r3, 0x1
_0805C9DC:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r1, r6
	ldrb r0, [r0]
	ands r0, r5
	cmp r0, 0
	beq _0805C9F8
	adds r0, r1, r3
	ldrb r0, [r0]
	b _0805CA04
	.align 2, 0
_0805C9F0: .4byte gPlayerAvatar
_0805C9F4: .4byte gUnknown_835B882
_0805C9F8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _0805C9DC
	movs r0, 0
_0805CA04:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarGraphicsIdByCurrentState

	thumb_func_start SetPlayerAvatarExtraStateTransition
SetPlayerAvatarExtraStateTransition: @ 805CA0C
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0805CA38 @ =gPlayerAvatar
	ldrb r1, [r5, 0x7]
	bl GetPlayerAvatarStateTransitionByGraphicsId
	lsls r0, 24
	lsrs r0, 24
	orrs r0, r4
	ldrb r1, [r5, 0x1]
	orrs r0, r1
	strb r0, [r5, 0x1]
	bl DoPlayerAvatarTransition
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA38: .4byte gPlayerAvatar
	thumb_func_end SetPlayerAvatarExtraStateTransition

	thumb_func_start InitPlayerAvatar
InitPlayerAvatar: @ 805CA3C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x18
	adds r4, r0, 0
	adds r5, r1, 0
	mov r9, r2
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0
	mov r1, r8
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	mov r1, sp
	movs r3, 0
	strb r0, [r1, 0x1]
	mov r0, sp
	lsls r4, 16
	asrs r4, 16
	subs r4, 0x7
	movs r6, 0
	strh r4, [r0, 0x4]
	lsls r5, 16
	asrs r5, 16
	subs r5, 0x7
	strh r5, [r0, 0x6]
	strb r6, [r0, 0x8]
	movs r0, 0xB
	strb r0, [r1, 0x9]
	mov r2, sp
	ldrb r1, [r2, 0xA]
	subs r0, 0x1B
	ands r0, r1
	strb r0, [r2, 0xA]
	mov r0, sp
	strb r6, [r0, 0xA]
	strh r3, [r0, 0xC]
	strh r3, [r0, 0xE]
	str r3, [sp, 0x10]
	strh r3, [r0, 0x14]
	bl SpawnSpecialObjectEvent
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 3
	adds r4, r5
	lsls r4, 2
	ldr r0, _0805CAFC @ =gObjectEvents
	adds r4, r0
	ldrb r0, [r4, 0x2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x2]
	bl CreateWarpArrowSprite
	strb r0, [r4, 0x1B]
	adds r0, r4, 0
	mov r1, r9
	bl ObjectEventTurn
	bl ClearPlayerAvatarInfo
	ldr r0, _0805CB00 @ =gPlayerAvatar
	strb r6, [r0, 0x2]
	strb r6, [r0, 0x3]
	strb r5, [r0, 0x5]
	ldrb r1, [r4, 0x4]
	strb r1, [r0, 0x4]
	mov r1, r8
	strb r1, [r0, 0x7]
	movs r0, 0x21
	bl SetPlayerAvatarStateMask
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CAFC: .4byte gObjectEvents
_0805CB00: .4byte gPlayerAvatar
	thumb_func_end InitPlayerAvatar

	thumb_func_start sub_805CB04
sub_805CB04: @ 805CB04
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _0805CB64 @ =gObjectEvents
	ldr r5, _0805CB68 @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	ands r4, r0
	lsls r3, r4, 5
	ldrb r2, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805CB5C
	ldr r2, _0805CB6C @ =gSprites
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x1A]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	lsls r3, r4, 2
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_0805CB5C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB64: .4byte gObjectEvents
_0805CB68: .4byte gPlayerAvatar
_0805CB6C: .4byte gSprites
	thumb_func_end sub_805CB04

	thumb_func_start sub_805CB70
sub_805CB70: @ 805CB70
	push {r4,r5,lr}
	ldr r5, _0805CBAC @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805CBB0 @ =gObjectEvents
	adds r4, r0
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805CBB4 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CBAC: .4byte gPlayerAvatar
_0805CBB0: .4byte gObjectEvents
_0805CBB4: .4byte gSprites
	thumb_func_end sub_805CB70

	thumb_func_start sub_805CBB8
sub_805CBB8: @ 805CBB8
	push {lr}
	ldr r2, _0805CBD4 @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	bne _0805CBD8
	movs r0, 0x5
	bl GetPlayerAvatarGraphicsIdByStateId
	lsls r0, 24
	lsrs r0, 24
	b _0805CBE0
	.align 2, 0
_0805CBD4: .4byte gPlayerAvatar
_0805CBD8:
	ldr r0, _0805CBE4 @ =gUnknown_835B88E
	ldrb r1, [r2, 0x7]
	adds r1, r0
	ldrb r0, [r1]
_0805CBE0:
	pop {r1}
	bx r1
	.align 2, 0
_0805CBE4: .4byte gUnknown_835B88E
	thumb_func_end sub_805CBB8

	thumb_func_start sub_805CBE8
sub_805CBE8: @ 805CBE8
	push {r4,r5,lr}
	ldr r5, _0805CC20 @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805CC24 @ =gObjectEvents
	adds r4, r0
	bl sub_805CBB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805CC28 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CC20: .4byte gPlayerAvatar
_0805CC24: .4byte gObjectEvents
_0805CC28: .4byte gSprites
	thumb_func_end sub_805CBE8

	thumb_func_start sub_805CC2C
sub_805CC2C: @ 805CC2C
	push {lr}
	movs r0, 0x2
	bl sub_8150498
	pop {r0}
	bx r0
	thumb_func_end sub_805CC2C

	thumb_func_start nullsub_24
nullsub_24: @ 805CC38
	bx lr
	thumb_func_end nullsub_24

	thumb_func_start nullsub_25
nullsub_25: @ 805CC3C
	bx lr
	thumb_func_end nullsub_25

	thumb_func_start sub_805CC40
sub_805CC40: @ 805CC40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrb r0, [r5, 0x1E]
	mov r8, r0
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	movs r6, 0x1
	ldr r1, _0805CCA4 @ =gUnknown_835B890
	mov r9, r1
	mov r4, sp
	mov r7, sp
	adds r7, 0x2
_0805CC62:
	movs r1, 0
	ldrsh r0, [r4, r1]
	lsls r0, 2
	add r0, r9
	ldr r1, [r0]
	mov r0, r8
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _0805CCA8
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	cmp r6, r0
	bne _0805CCA8
	ldrh r0, [r5, 0x10]
	strh r0, [r4]
	ldrh r0, [r5, 0x12]
	strh r0, [r7]
	adds r0, r6, 0
	mov r1, sp
	adds r2, r7, 0
	bl MoveCoords
	ldrb r0, [r5, 0x1B]
	movs r1, 0
	ldrsh r2, [r4, r1]
	movs r1, 0
	ldrsh r3, [r7, r1]
	adds r1, r6, 0
	bl ShowWarpArrowSprite
	b _0805CCC2
	.align 2, 0
_0805CCA4: .4byte gUnknown_835B890
_0805CCA8:
	ldrh r1, [r4]
	adds r1, 0x1
	strh r1, [r4]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3
	ble _0805CC62
	ldrb r0, [r5, 0x1B]
	bl SetSpriteInvisible
_0805CCC2:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_805CC40

	thumb_func_start StartStrengthAnim
StartStrengthAnim: @ 805CCD0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0805CD04 @ =taskFF_bump_boulder
	adds r0, r6, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805CD08 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	bl _call_via_r6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CD04: .4byte taskFF_bump_boulder
_0805CD08: .4byte gTasks
	thumb_func_end StartStrengthAnim

	thumb_func_start taskFF_bump_boulder
taskFF_bump_boulder: @ 805CD0C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0805CD54 @ =gUnknown_835B8A0
	ldr r2, _0805CD58 @ =gTasks
	ldr r5, _0805CD5C @ =gObjectEvents
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805CD20:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldr r0, _0805CD60 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _0805CD20
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CD54: .4byte gUnknown_835B8A0
_0805CD58: .4byte gTasks
_0805CD5C: .4byte gObjectEvents
_0805CD60: .4byte gPlayerAvatar
	thumb_func_end taskFF_bump_boulder

	thumb_func_start sub_805CD64
sub_805CD64: @ 805CD64
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _0805CD80 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805CD80: .4byte gPlayerAvatar
	thumb_func_end sub_805CD64

	thumb_func_start sub_805CD84
sub_805CD84: @ 805CD84
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r5, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	bne _0805CE0E
	adds r0, r4, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	bne _0805CE0E
	adds r0, r5, 0
	bl ObjectEventClearHeldMovementIfFinished
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	ldrb r0, [r6, 0xC]
	bl GetWalkInPlaceNormalMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_805C06C
	ldrb r0, [r6, 0xC]
	bl sub_8063F2C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805C0A4
	ldr r2, _0805CE18 @ =gFieldEffectArguments
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	ldrb r0, [r4, 0xB]
	lsrs r0, 4
	str r0, [r2, 0x8]
	ldr r3, _0805CE1C @ =gSprites
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r2, 0xC]
	movs r0, 0xA
	bl FieldEffectStart
	movs r0, 0xCF
	bl PlaySE
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0805CE0E:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805CE18: .4byte gFieldEffectArguments
_0805CE1C: .4byte gSprites
	thumb_func_end sub_805CD84

	thumb_func_start sub_805CE20
sub_805CE20: @ 805CE20
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r5, 0
	bl ObjectEventCheckHeldMovementStatus
	lsls r0, 24
	cmp r0, 0
	beq _0805CE70
	adds r0, r4, 0
	bl ObjectEventCheckHeldMovementStatus
	lsls r0, 24
	cmp r0, 0
	beq _0805CE70
	adds r0, r5, 0
	bl ObjectEventClearHeldMovementIfFinished
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	adds r0, r4, 0
	bl sub_806DE28
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x12]
	bl sub_806DE70
	ldr r1, _0805CE78 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	ldr r0, _0805CE7C @ =taskFF_bump_boulder
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805CE70:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805CE78: .4byte gPlayerAvatar
_0805CE7C: .4byte taskFF_bump_boulder
	thumb_func_end sub_805CE20

	thumb_func_start DoPlayerMatJump
DoPlayerMatJump: @ 805CE80
	push {r4,lr}
	ldr r4, _0805CE9C @ =sub_805CEA0
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CE9C: .4byte sub_805CEA0
	thumb_func_end DoPlayerMatJump

	thumb_func_start sub_805CEA0
sub_805CEA0: @ 805CEA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805CEDC @ =gUnknown_835B8AC
	ldr r2, _0805CEE0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805CEB2:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _0805CEE4 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805CEE8 @ =gObjectEvents
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _0805CEB2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CEDC: .4byte gUnknown_835B8AC
_0805CEE0: .4byte gTasks
_0805CEE4: .4byte gPlayerAvatar
_0805CEE8: .4byte gObjectEvents
	thumb_func_end sub_805CEA0

	thumb_func_start PlayerAvatar_DoSecretBaseMatJump
PlayerAvatar_DoSecretBaseMatJump: @ 805CEEC
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	ldr r5, _0805CF50 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r5, 0x6]
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805CF48
	movs r0, 0xA
	bl PlaySE
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetJumpInPlaceMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805C06C
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0805CF48
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldr r0, _0805CF54 @ =sub_805CEA0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805CF48:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805CF50: .4byte gPlayerAvatar
_0805CF54: .4byte sub_805CEA0
	thumb_func_end PlayerAvatar_DoSecretBaseMatJump

	thumb_func_start DoPlayerMatSpin
DoPlayerMatSpin: @ 805CF58
	push {r4,lr}
	ldr r4, _0805CF74 @ =sub_805CF78
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CF74: .4byte sub_805CF78
	thumb_func_end DoPlayerMatSpin

	thumb_func_start sub_805CF78
sub_805CF78: @ 805CF78
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805CFB4 @ =gUnknown_835B8B0
	ldr r2, _0805CFB8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805CF8A:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _0805CFBC @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805CFC0 @ =gObjectEvents
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _0805CF8A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CFB4: .4byte gUnknown_835B8B0
_0805CFB8: .4byte gTasks
_0805CFBC: .4byte gPlayerAvatar
_0805CFC0: .4byte gObjectEvents
	thumb_func_end sub_805CF78

	thumb_func_start sub_805CFC4
sub_805CFC4: @ 805CFC4
	push {lr}
	ldrh r2, [r0, 0x8]
	adds r2, 0x1
	strh r2, [r0, 0x8]
	ldrb r1, [r1, 0x18]
	lsrs r1, 4
	strh r1, [r0, 0xA]
	ldr r1, _0805CFE8 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	bl ScriptContext2_Enable
	movs r0, 0x27
	bl PlaySE
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0805CFE8: .4byte gPlayerAvatar
	thumb_func_end sub_805CFC4

	thumb_func_start sub_805CFEC
sub_805CFEC: @ 805CFEC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805D060 @ =gUnknown_835B8C0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r5, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805D054
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	subs r0, 0x1
	add r0, sp
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_805C06C
	ldrb r0, [r4, 0xA]
	cmp r6, r0
	bne _0805D032
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805D032:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _0805D054
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0805D054
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805D054:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805D060: .4byte gUnknown_835B8C0
	thumb_func_end sub_805CFEC

	thumb_func_start sub_805D064
sub_805D064: @ 805D064
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _0805D0A0 @ =gUnknown_835B8C4
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805D094
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_805C06C
	movs r0, 0x1
	strh r0, [r5, 0x8]
_0805D094:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D0A0: .4byte gUnknown_835B8C4
	thumb_func_end sub_805D064

	thumb_func_start sub_805D0A4
sub_805D0A4: @ 805D0A4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805D0E8
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063F2C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_805C06C
	bl ScriptContext2_Disable
	ldr r1, _0805D0F0 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	ldr r0, _0805D0F4 @ =sub_805CF78
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805D0E8:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D0F0: .4byte gPlayerAvatar
_0805D0F4: .4byte sub_805CF78
	thumb_func_end sub_805D0A4

	thumb_func_start CreateStopSurfingTask
CreateStopSurfingTask: @ 805D0F8
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	bl FreezeObjectEvents
	bl sav1_reset_battle_music_maybe
	bl Overworld_ChangeMusicToDefault
	ldr r2, _0805D148 @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0xF7
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x6]
	ldr r5, _0805D14C @ =taskFF_0805D1D4
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805D150 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D148: .4byte gPlayerAvatar
_0805D14C: .4byte taskFF_0805D1D4
_0805D150: .4byte gTasks
	thumb_func_end CreateStopSurfingTask

	thumb_func_start sub_805D154
sub_805D154: @ 805D154
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	bl FreezeObjectEvents
	ldr r2, _0805D19C @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0xF7
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x6]
	ldr r5, _0805D1A0 @ =taskFF_0805D1D4
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805D1A4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D19C: .4byte gPlayerAvatar
_0805D1A0: .4byte taskFF_0805D1D4
_0805D1A4: .4byte gTasks
	thumb_func_end sub_805D154

	thumb_func_start sub_805D1A8
sub_805D1A8: @ 805D1A8
	push {lr}
	ldr r0, _0805D1CC @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0805D1C6
	cmp r0, 0x3
	beq _0805D1C6
	ldr r0, _0805D1D0 @ =gUnknown_835B820
	ldrb r0, [r0, 0x2]
	movs r1, 0x10
	bl sub_811278C
	movs r0, 0x2
	bl CreateStopSurfingTask
_0805D1C6:
	pop {r0}
	bx r0
	.align 2, 0
_0805D1CC: .4byte gUnknown_3005E88
_0805D1D0: .4byte gUnknown_835B820
	thumb_func_end sub_805D1A8

	thumb_func_start taskFF_0805D1D4
taskFF_0805D1D4: @ 805D1D4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0805D230 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D234 @ =gObjectEvents
	adds r5, r0, r1
	adds r0, r5, 0
	bl ObjectEventIsMovementOverridden
	lsls r0, 24
	cmp r0, 0
	beq _0805D200
	adds r0, r5, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805D228
_0805D200:
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_80DC44C
	ldr r0, _0805D238 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl sub_80641EC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_805C06C
	ldr r0, _0805D23C @ =sub_805D240
	str r0, [r4]
_0805D228:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D230: .4byte gPlayerAvatar
_0805D234: .4byte gObjectEvents
_0805D238: .4byte gTasks
_0805D23C: .4byte sub_805D240
	thumb_func_end taskFF_0805D1D4

	thumb_func_start sub_805D240
sub_805D240: @ 805D240
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0805D2B4 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D2B8 @ =gObjectEvents
	adds r4, r0, r1
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805D2AE
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805C06C
	movs r0, 0
	strb r0, [r6, 0x6]
	bl ScriptContext2_Disable
	bl UnfreezeObjectEvents
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D2BC @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0
	bl DestroyTask
	bl SetHelpContextForMap
_0805D2AE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D2B4: .4byte gPlayerAvatar
_0805D2B8: .4byte gObjectEvents
_0805D2BC: .4byte gSprites
	thumb_func_end sub_805D240

	thumb_func_start sub_805D2C0
sub_805D2C0: @ 805D2C0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0805D2FC @ =sub_805D304
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805D300 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x26]
	bl _call_via_r5
	movs r0, 0x2
	bl sub_8150474
	cmp r0, 0x1
	bne _0805D2F4
	bl sub_8112C9C
_0805D2F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D2FC: .4byte sub_805D304
_0805D300: .4byte gTasks
	thumb_func_end sub_805D2C0

	thumb_func_start sub_805D304
sub_805D304: @ 805D304
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805D334 @ =gUnknown_835B8CC
	ldr r2, _0805D338 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805D316:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0805D316
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D334: .4byte gUnknown_835B8CC
_0805D338: .4byte gTasks
	thumb_func_end sub_805D304

	thumb_func_start sub_805D33C
sub_805D33C: @ 805D33C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _0805D358 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D358: .4byte gPlayerAvatar
	thumb_func_end sub_805D33C

	thumb_func_start fish1
fish1: @ 805D35C
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	ldr r1, _0805D3E4 @ =gUnknown_835B90C
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _0805D3E8 @ =gUnknown_835B912
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	movs r0, 0
	strh r0, [r5, 0x20]
	bl Random
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	lsls r1, 1
	mov r2, sp
	adds r6, r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r6]
	adds r1, r0
	strh r1, [r5, 0x22]
	ldr r3, _0805D3EC @ =gObjectEvents
	ldr r2, _0805D3F0 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	strh r0, [r5, 0x24]
	ldrb r0, [r2, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r3
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfActive
	ldrb r0, [r4, 0x1]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805CC2C
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805D3E4: .4byte gUnknown_835B90C
_0805D3E8: .4byte gUnknown_835B912
_0805D3EC: .4byte gObjectEvents
_0805D3F0: .4byte gPlayerAvatar
	thumb_func_end fish1

	thumb_func_start fish2
fish2: @ 805D3F4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0805D428 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D42C @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _0805D41E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805D41E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D428: .4byte gPlayerAvatar
_0805D42C: .4byte gSprites
	thumb_func_end fish2

	thumb_func_start sub_805D430
sub_805D430: @ 805D430
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	movs r1, 0x1
	bl sub_80F7768
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0805D468
	adds r0, r1, 0x4
	strh r0, [r4, 0xE]
_0805D468:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	ble _0805D474
	movs r0, 0xA
	strh r0, [r4, 0xE]
_0805D474:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D430

	thumb_func_start sub_805D47C
sub_805D47C: @ 805D47C
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r0, _0805D4CC @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D4D0 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0805D4F8
	strh r5, [r4, 0xA]
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805D4D4
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	ldrh r2, [r4, 0x20]
	movs r3, 0x20
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0805D4C6
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_0805D4C6:
	adds r0, r2, 0x1
	strh r0, [r4, 0x20]
	b _0805D4F8
	.align 2, 0
_0805D4CC: .4byte gPlayerAvatar
_0805D4D0: .4byte gSprites
_0805D4D4:
	ldr r2, _0805D504 @ =gUnknown_835B918
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 26
	lsrs r3, 24
	movs r0, 0x1
	str r0, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	bl AddTextPrinterParameterized
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805D4F8:
	movs r0, 0
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D504: .4byte gUnknown_835B918
	thumb_func_end sub_805D47C

	thumb_func_start sub_805D508
sub_805D508: @ 805D508
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _0805D540 @ =gPlayerAvatar
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0805D544 @ =gSprites
	adds r0, r5
	bl sub_805D9C4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl DoesCurrentMapHaveFishingMons
	lsls r0, 24
	cmp r0, 0
	beq _0805D53A
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805D548
_0805D53A:
	movs r0, 0xB
	strh r0, [r4, 0x8]
	b _0805D56A
	.align 2, 0
_0805D540: .4byte gPlayerAvatar
_0805D544: .4byte gSprites
_0805D548:
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063510
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805D56A:
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805D508

	thumb_func_start sub_805D574
sub_805D574: @ 805D574
	ldrh r1, [r0, 0x8]
	adds r1, 0x3
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_805D574

	thumb_func_start sub_805D580
sub_805D580: @ 805D580
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _0805D5C0 @ =gUnknown_835B91A
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r0, _0805D5C4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D5C8 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _0805D5CC
	movs r0, 0xC
	b _0805D5DC
	.align 2, 0
_0805D5C0: .4byte gUnknown_835B91A
_0805D5C4: .4byte gPlayerAvatar
_0805D5C8: .4byte gSprites
_0805D5CC:
	ldr r0, _0805D5E8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805D5DE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
_0805D5DC:
	strh r0, [r4, 0x8]
_0805D5DE:
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D5E8: .4byte gMain
	thumb_func_end sub_805D580

	thumb_func_start sub_805D5EC
sub_805D5EC: @ 805D5EC
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _0805D660 @ =gUnknown_835B920
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	ldr r0, _0805D664 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D668 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805D650
	cmp r1, 0x1
	bgt _0805D654
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	movs r3, 0x20
	ldrsh r2, [r4, r3]
	lsls r2, 1
	movs r3, 0x26
	ldrsh r1, [r4, r3]
	lsls r1, 2
	adds r2, r1
	mov r3, sp
	adds r1, r3, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805D654
_0805D650:
	movs r0, 0x3
	strh r0, [r4, 0x8]
_0805D654:
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D660: .4byte gUnknown_835B920
_0805D664: .4byte gPlayerAvatar
_0805D668: .4byte gSprites
	thumb_func_end sub_805D5EC

	thumb_func_start sub_805D66C
sub_805D66C: @ 805D66C
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r0, _0805D6BC @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D6C0 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _0805D6C4 @ =gUnknown_841D14E
	movs r5, 0
	str r5, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	strh r5, [r4, 0xA]
	movs r0, 0
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D6BC: .4byte gPlayerAvatar
_0805D6C0: .4byte gSprites
_0805D6C4: .4byte gUnknown_841D14E
	thumb_func_end sub_805D66C

	thumb_func_start sub_805D6C8
sub_805D6C8: @ 805D6C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805D6EA
	ldr r0, _0805D774 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D778 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
_0805D6EA:
	bl RunTextPrinters
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805D788
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	bne _0805D780
	ldr r7, _0805D774 @ =gPlayerAvatar
	ldrb r0, [r7, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805D77C @ =gObjectEvents
	mov r8, r0
	add r4, r8
	ldrh r1, [r5, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl ObjectEventTurn
	ldrb r1, [r7]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805D748
	ldrb r0, [r7, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_80DC4A4
_0805D748:
	ldr r2, _0805D778 @ =gSprites
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x24]
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x26]
	movs r0, 0
	movs r1, 0x1
	bl ClearDialogWindowAndFrame
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _0805D7AA
	.align 2, 0
_0805D774: .4byte gPlayerAvatar
_0805D778: .4byte gSprites
_0805D77C: .4byte gObjectEvents
_0805D780:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0805D7AA
_0805D788:
	ldr r1, _0805D7B8 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	ldrh r0, [r5, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl FishingWildEncounter
	ldr r0, _0805D7BC @ =sub_805D304
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805D7AA:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D7B8: .4byte gPlayerAvatar
_0805D7BC: .4byte sub_805D304
	thumb_func_end sub_805D6C8

	thumb_func_start sub_805D7C0
sub_805D7C0: @ 805D7C0
	push {r4-r6,lr}
	sub sp, 0x10
	adds r6, r0, 0
	ldr r4, _0805D82C @ =gPlayerAvatar
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0805D830 @ =gSprites
	adds r0, r5
	bl sub_805D9C4
	ldrb r0, [r4, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFishingBiteDirectionAnimNum
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _0805D834 @ =gUnknown_841D169
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized2
	movs r0, 0xD
	strh r0, [r6, 0x8]
	movs r0, 0x1
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805D82C: .4byte gPlayerAvatar
_0805D830: .4byte gSprites
_0805D834: .4byte gUnknown_841D169
	thumb_func_end sub_805D7C0

	thumb_func_start sub_805D838
sub_805D838: @ 805D838
	push {r4-r6,lr}
	sub sp, 0x10
	adds r6, r0, 0
	ldr r4, _0805D8A0 @ =gPlayerAvatar
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0805D8A4 @ =gSprites
	adds r0, r5
	bl sub_805D9C4
	ldrb r0, [r4, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFishingBiteDirectionAnimNum
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r2, _0805D8A8 @ =gUnknown_841D17E
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0x1
	bl AddTextPrinterParameterized2
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x1
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805D8A0: .4byte gPlayerAvatar
_0805D8A4: .4byte gSprites
_0805D8A8: .4byte gUnknown_841D17E
	thumb_func_end sub_805D838

	thumb_func_start sub_805D8AC
sub_805D8AC: @ 805D8AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0805D8D0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D8D4 @ =gSprites
	adds r0, r1
	bl sub_805D9C4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D8D0: .4byte gPlayerAvatar
_0805D8D4: .4byte gSprites
	thumb_func_end sub_805D8AC

	thumb_func_start sub_805D8D8
sub_805D8D8: @ 805D8D8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r5, _0805D974 @ =gPlayerAvatar
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r7, _0805D978 @ =gSprites
	adds r0, r7
	bl sub_805D9C4
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _0805D968
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805D97C @ =gObjectEvents
	mov r8, r0
	add r4, r8
	ldrh r1, [r6, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventSetGraphicsId
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl ObjectEventTurn
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805D948
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_80DC4A4
_0805D948:
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r2, 0
	strh r2, [r0, 0x24]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x26]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0805D968:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D974: .4byte gPlayerAvatar
_0805D978: .4byte gSprites
_0805D97C: .4byte gObjectEvents
	thumb_func_end sub_805D8D8

	thumb_func_start sub_805D980
sub_805D980: @ 805D980
	push {lr}
	bl RunTextPrinters
	movs r0, 0
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0805D9B6
	ldr r0, _0805D9BC @ =gPlayerAvatar
	strb r1, [r0, 0x6]
	bl ScriptContext2_Disable
	bl UnfreezeObjectEvents
	movs r0, 0
	movs r1, 0x1
	bl ClearDialogWindowAndFrame
	ldr r0, _0805D9C0 @ =sub_805D304
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805D9B6:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0805D9BC: .4byte gPlayerAvatar
_0805D9C0: .4byte sub_805D304
	thumb_func_end sub_805D980

	thumb_func_start sub_805D9C4
sub_805D9C4: @ 805D9C4
	push {r4-r7,lr}
	adds r4, r0, 0
	bl AnimateSprite
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r5, [r0]
	movs r0, 0x2A
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r5, 2
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r7, 0x1
	negs r7, r7
	cmp r0, r7
	beq _0805DA28
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r1, r12
	ldrb r0, [r1]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0805DA2E
_0805DA28:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0805DA2E:
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrb r5, [r0]
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0805DA60
	movs r0, 0x8
	strh r0, [r4, 0x24]
	bl GetPlayerFacingDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805DA60
	ldr r0, _0805DAA4 @ =0x0000fff8
	strh r0, [r4, 0x24]
_0805DA60:
	cmp r5, 0x5
	bne _0805DA68
	ldr r0, _0805DAA4 @ =0x0000fff8
	strh r0, [r4, 0x26]
_0805DA68:
	adds r0, r5, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0805DA78
	movs r0, 0x8
	strh r0, [r4, 0x26]
_0805DA78:
	ldr r3, _0805DAA8 @ =gPlayerAvatar
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805DA9C
	ldr r2, _0805DAAC @ =gObjectEvents
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1A]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0x1
	bl sub_80DC4A4
_0805DA9C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DAA4: .4byte 0x0000fff8
_0805DAA8: .4byte gPlayerAvatar
_0805DAAC: .4byte gObjectEvents
	thumb_func_end sub_805D9C4

	thumb_func_start sub_805DAB0
sub_805DAB0: @ 805DAB0
	push {r4,lr}
	ldr r4, _0805DACC @ =sub_805DB04
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DACC: .4byte sub_805DB04
	thumb_func_end sub_805DAB0

	thumb_func_start sub_805DAD0
sub_805DAD0: @ 805DAD0
	push {lr}
	ldr r0, _0805DAE0 @ =sub_805DB04
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805DAE0: .4byte sub_805DB04
	thumb_func_end sub_805DAD0

	thumb_func_start sub_805DAE4
sub_805DAE4: @ 805DAE4
	ldr r1, _0805DAEC @ =gUnknown_2036E34
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805DAEC: .4byte gUnknown_2036E34
	thumb_func_end sub_805DAE4

	thumb_func_start sub_805DAF0
sub_805DAF0: @ 805DAF0
	push {lr}
	ldr r1, _0805DB00 @ =gUnknown_2036E34
	ldrb r0, [r1]
	cmp r0, 0
	bne _0805DAFC
	movs r0, 0x1
_0805DAFC:
	pop {r1}
	bx r1
	.align 2, 0
_0805DB00: .4byte gUnknown_2036E34
	thumb_func_end sub_805DAF0

	thumb_func_start sub_805DB04
sub_805DB04: @ 805DB04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r0, _0805DB48 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805DB4C @ =gObjectEvents
	adds r4, r0, r1
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805DB50 @ =gSprites
	adds r7, r0, r1
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0805DB54 @ =gTasks+0x8
	adds r5, r0, r1
	movs r0, 0
	ldrsh r6, [r5, r0]
	cmp r6, 0x1
	beq _0805DBBA
	cmp r6, 0x1
	bgt _0805DB58
	cmp r6, 0
	beq _0805DB5E
	b _0805DBFA
	.align 2, 0
_0805DB48: .4byte gPlayerAvatar
_0805DB4C: .4byte gObjectEvents
_0805DB50: .4byte gSprites
_0805DB54: .4byte gTasks+0x8
_0805DB58:
	cmp r6, 0x2
	beq _0805DBF4
	b _0805DBFA
_0805DB5E:
	adds r0, r4, 0
	bl ObjectEventClearHeldMovementIfFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805DBFA
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805DAE4
	movs r1, 0
	mov r8, r1
	strh r6, [r5, 0x2]
	movs r0, 0x1
	strh r0, [r5, 0x4]
	ldrh r0, [r7, 0x26]
	ldrh r2, [r7, 0x22]
	adds r0, r2
	lsls r0, 4
	strh r0, [r5, 0x6]
	strh r6, [r7, 0x26]
	bl CameraObjectReset2
	ldrb r0, [r4, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r7, 0x5]
	adds r0, r7, 0
	adds r0, 0x43
	mov r1, r8
	strb r1, [r0]
	adds r2, r7, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0805DBBA:
	adds r1, r5, 0x2
	adds r0, r4, 0
	bl sub_805DDC8
	ldrh r0, [r5, 0x6]
	ldrh r1, [r5, 0x4]
	subs r0, r1
	strh r0, [r5, 0x6]
	adds r1, 0x3
	strh r1, [r5, 0x4]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r7, 0x22]
	movs r2, 0x22
	ldrsh r1, [r7, r2]
	ldr r0, _0805DBF0 @ =gTotalCameraPixelOffsetY
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r1, r0
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	bge _0805DBFA
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0805DBFA
	.align 2, 0
_0805DBF0: .4byte gTotalCameraPixelOffsetY
_0805DBF4:
	adds r0, r2, 0
	bl DestroyTask
_0805DBFA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_805DB04

	thumb_func_start sub_805DC04
sub_805DC04: @ 805DC04
	push {r4,lr}
	ldr r4, _0805DC20 @ =sub_805DC38
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DC20: .4byte sub_805DC38
	thumb_func_end sub_805DC04

	thumb_func_start sub_805DC24
sub_805DC24: @ 805DC24
	push {lr}
	ldr r0, _0805DC34 @ =sub_805DC38
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805DC34: .4byte sub_805DC38
	thumb_func_end sub_805DC24

	thumb_func_start sub_805DC38
sub_805DC38: @ 805DC38
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0805DC80 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805DC84 @ =gObjectEvents
	adds r4, r0, r1
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805DC88 @ =gSprites
	adds r7, r0, r1
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _0805DC8C @ =gTasks+0x8
	adds r5, r0, r1
	movs r2, 0
	ldrsh r6, [r5, r2]
	cmp r6, 0x1
	beq _0805DD1A
	cmp r6, 0x1
	bgt _0805DC90
	cmp r6, 0
	beq _0805DC9A
	b _0805DDBA
	.align 2, 0
_0805DC80: .4byte gPlayerAvatar
_0805DC84: .4byte gObjectEvents
_0805DC88: .4byte gSprites
_0805DC8C: .4byte gTasks+0x8
_0805DC90:
	cmp r6, 0x2
	beq _0805DD58
	cmp r6, 0x3
	beq _0805DD76
	b _0805DDBA
_0805DC9A:
	bl sub_805DAF0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	ldr r1, _0805DD54 @ =gUnknown_835B92C
	movs r3, 0xA
	ldrsh r0, [r5, r3]
	adds r0, r1
	ldrb r0, [r0]
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ObjectEventForceSetHeldMovement
	movs r0, 0
	mov r9, r0
	strh r6, [r5, 0x2]
	movs r0, 0x74
	strh r0, [r5, 0x4]
	ldrh r0, [r7, 0x22]
	strh r0, [r5, 0x8]
	ldrb r0, [r7, 0x5]
	lsls r0, 28
	lsrs r0, 30
	strh r0, [r5, 0xC]
	movs r1, 0x43
	adds r1, r7
	mov r8, r1
	ldrb r0, [r1]
	strh r0, [r5, 0xE]
	ldrh r0, [r7, 0x26]
	adds r0, 0x20
	negs r0, r0
	lsls r0, 4
	strh r0, [r5, 0x6]
	strh r6, [r7, 0x26]
	bl CameraObjectReset2
	ldrb r0, [r4, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, 0x5]
	mov r3, r9
	mov r2, r8
	strb r3, [r2]
	adds r2, r7, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0805DD1A:
	adds r1, r5, 0x2
	adds r0, r4, 0
	bl sub_805DDC8
	ldrh r0, [r5, 0x4]
	ldrh r2, [r5, 0x6]
	adds r1, r0, r2
	strh r1, [r5, 0x6]
	subs r0, 0x3
	strh r0, [r5, 0x4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bgt _0805DD3A
	movs r0, 0x4
	strh r0, [r5, 0x4]
_0805DD3A:
	ldrh r0, [r5, 0x6]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r7, 0x22]
	ldrh r2, [r5, 0x8]
	movs r3, 0x8
	ldrsh r1, [r5, r3]
	cmp r0, r1
	blt _0805DDBA
	strh r2, [r7, 0x22]
	movs r0, 0
	strh r0, [r5, 0x10]
	b _0805DD6E
	.align 2, 0
_0805DD54: .4byte gUnknown_835B92C
_0805DD58:
	adds r1, r5, 0x2
	adds r0, r4, 0
	bl sub_805DDC8
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0805DDBA
_0805DD6E:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0805DDBA
_0805DD76:
	movs r0, 0xA
	ldrsh r6, [r5, r0]
	adds r1, r5, 0x2
	adds r0, r4, 0
	bl sub_805DDC8
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0805DDBA
	ldrb r1, [r4, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0x3
	ldrb r1, [r5, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
	ldrh r1, [r5, 0xE]
	adds r0, r7, 0
	adds r0, 0x43
	strb r1, [r0]
	bl CameraObjectReset1
	mov r0, r8
	bl DestroyTask
_0805DDBA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_805DC38

	thumb_func_start sub_805DDC8
sub_805DDC8: @ 805DDC8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldrh r1, [r6]
	movs r2, 0
	ldrsh r0, [r6, r2]
	cmp r0, 0x7
	bgt _0805DDE4
	adds r0, r1, 0x1
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0805DE20
_0805DDE4:
	adds r0, r5, 0
	bl ObjectEventCheckHeldMovementStatus
	lsls r0, 24
	cmp r0, 0
	beq _0805DE20
	ldr r4, _0805DE1C @ =gUnknown_835B92C
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r4
	ldrb r0, [r0]
	bl GetFaceDirectionMovementAction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl ObjectEventForceSetHeldMovement
	movs r0, 0
	strh r0, [r6]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r4
	ldrb r0, [r0]
	b _0805DE26
	.align 2, 0
_0805DE1C: .4byte gUnknown_835B92C
_0805DE20:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
_0805DE26:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805DDC8

	.align 2, 0 @ Don't pad with nop.
