#include "global.h"
#include "gflib.h"
#include "bike.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "fieldmap.h"
#include "field_control_avatar.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "quest_log.h"
#include "quest_log_player.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/songs.h"
#include "constants/flags.h"
#include "constants/metatile_behaviors.h"

EWRAM_DATA struct ObjectEvent * gUnknown_2036E30 = NULL;
EWRAM_DATA bool8 gUnknown_2036E34 = FALSE;
EWRAM_DATA struct ObjectEvent gObjectEvents[OBJECT_EVENTS_COUNT] = {};
EWRAM_DATA struct PlayerAvatar gPlayerAvatar = {};

u8 ObjectEventCB2_NoMovement2(struct ObjectEvent * object, struct Sprite * sprite);
bool8 sub_805B528(void);
bool8 TryInterruptObjectEventSpecialAnim(struct ObjectEvent * playerObjEvent, u8 direction);
void npc_clear_strange_bits(struct ObjectEvent * playerObjEvent);
bool8 TryDoMetatileBehaviorForcedMovement(void);
void MovePlayerAvatarUsingKeypadInput(u8 direction, u16 newKeys, u16 heldKeys);
void PlayerAllowForcedMovementIfMovingSameDirection(void);
bool8 ForcedMovement_None(void);
bool8 ForcedMovement_Slip(void);
bool8 ForcedMovement_WalkSouth(void);
bool8 ForcedMovement_WalkNorth(void);
bool8 ForcedMovement_WalkWest(void);
bool8 ForcedMovement_WalkEast(void);
bool8 ForcedMovement_SpinRight(void);
bool8 ForcedMovement_SpinLeft(void);
bool8 ForcedMovement_SpinUp(void);
bool8 ForcedMovement_SpinDown(void);
void PlaySpinSound(void);
bool8 ForcedMovement_PushedSouthByCurrent(void);
bool8 ForcedMovement_PushedNorthByCurrent(void);
bool8 ForcedMovement_PushedWestByCurrent(void);
bool8 ForcedMovement_PushedEastByCurrent(void);
bool8 ForcedMovement_SlideSouth(void);
bool8 ForcedMovement_SlideNorth(void);
bool8 ForcedMovement_SlideWest(void);
bool8 ForcedMovement_SlideEast(void);
bool8 ForcedMovement_0xBB(void);
bool8 ForcedMovement_0xBC(void);
u8 CheckMovementInputNotOnBike(u8 direction);
void PlayerNotOnBikeNotMoving(u8 direction, u16 heldKeys);
void PlayerNotOnBikeTurningInPlace(u8 direction, u16 heldKeys);
void PlayerNotOnBikeMoving(u8 direction, u16 heldKeys);
bool32 PlayerIsMovingOnRockStairs(u8 direction);
u8 CheckForPlayerAvatarCollision(u8 direction);
u8 CheckForObjectEventCollision(struct ObjectEvent * objectEvent, s16 x, s16 y, u8 direction, u8 metatileBehavior);
bool8 CanStopSurfing(s16 x, s16 y, u8 direction);
bool8 ShouldJumpLedge(s16 x, s16 y, u8 direction);
bool8 TryPushBoulder(s16 x, s16 y, u8 direction);
void CheckAcroBikeCollision(s16 x, s16 y, u8 metatileBehavior, u8 *collision);
void DoPlayerAvatarTransition(void);
void PlayerAvatarTransition_Dummy(struct ObjectEvent * playerObject);
void PlayerAvatarTransition_Normal(struct ObjectEvent * playerObject);
void PlayerAvatarTransition_Bike(struct ObjectEvent * playerObject);
void PlayerAvatarTransition_Surfing(struct ObjectEvent * playerObject);
void PlayerAvatarTransition_Underwater(struct ObjectEvent * playerObject);
void PlayerAvatarTransition_ReturnToField(struct ObjectEvent * playerObject);
bool8 PlayerIsAnimActive(void);
bool8 PlayerCheckIfAnimFinishedOrInactive(void);
bool8 player_is_anim_in_certain_ranges(void);
bool8 sub_805BF58(void);
void CreateStopSurfingTask(u8 direction);
void StartStrengthAnim(u8 objectEventId, u8 direction);
void PlayerNotOnBikeCollide(u8 direction);
void PlayerRun(u8 direction);
void PlayerRunSlow(u8 direction);
void PlayerFaceDirection(u8 direction);
void PlayerTurnInPlace(u8 direction);
void PlayerGoSpeed2(u8 direction);
void PlayerGoSpeed1(u8 direction);
void PlayerJumpLedge(u8 direction);
void PlayerGoSlow(u8 direction);
void PlayerGoSpin(u8 direction);
void PlayerRideWaterCurrent(u8 direction);
void sub_805C2CC(u8 metatileBehavior);
void sub_805CC40(struct ObjectEvent * playerObjEvent);
void DoPlayerMatJump(void);
void DoPlayerMatSpin(void);

void MovementType_Player(struct Sprite *sprite)
{
    UpdateObjectEventCurrentMovement(&gObjectEvents[sprite->data[0]], sprite, ObjectEventCB2_NoMovement2);
}

u8 ObjectEventCB2_NoMovement2(struct ObjectEvent * object, struct Sprite * sprite)
{
    return 0;
}

void player_step(u8 direction, u16 newKeys, u16 heldKeys)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    sub_805CC40(playerObjEvent);
    if (!gPlayerAvatar.preventStep && !sub_805B528())
    {
        if (!TryInterruptObjectEventSpecialAnim(playerObjEvent, direction))
        {
            npc_clear_strange_bits(playerObjEvent);
            DoPlayerAvatarTransition();
            if (!TryDoMetatileBehaviorForcedMovement())
            {
                MovePlayerAvatarUsingKeypadInput(direction, newKeys, heldKeys);
                PlayerAllowForcedMovementIfMovingSameDirection();
            }
        }
    }
}

bool8 TryInterruptObjectEventSpecialAnim(struct ObjectEvent *playerObjEvent, u8 direction)
{

    if (ObjectEventIsMovementOverridden(playerObjEvent)
        && !ObjectEventClearHeldMovementIfFinished(playerObjEvent))
    {
        u8 heldMovementActionId = ObjectEventGetHeldMovementActionId(playerObjEvent);
        if (heldMovementActionId > MOVEMENT_ACTION_WALK_FAST_RIGHT && heldMovementActionId < MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_DOWN)
        {
            if (direction != DIR_NONE && playerObjEvent->movementDirection != direction)
            {
                ObjectEventClearHeldMovement(playerObjEvent);
                return FALSE;
            }
        }

        return TRUE;
    }

    return FALSE;
}

void npc_clear_strange_bits(struct ObjectEvent *objEvent)
{
    objEvent->inanimate = 0;
    objEvent->disableAnim = 0;
    objEvent->facingDirectionLocked = 0;
    gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_DASH;
}

void MovePlayerAvatarUsingKeypadInput(u8 direction, u16 newKeys, u16 heldKeys)
{
    if ((gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
        || (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE))
        MovePlayerOnBike(direction, newKeys, heldKeys);
    else
        MovePlayerNotOnBike(direction, heldKeys);
}

void PlayerAllowForcedMovementIfMovingSameDirection(void)
{
    if (gPlayerAvatar.runningState == MOVING)
        gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_FORCED_MVMT_DISABLED;
}

bool8 sub_805B528(void)
{
    if ((gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MVMT_IS_FORCED) && MetatileBehavior_IsSpinTile(gPlayerAvatar.unk1C))
    {
        gUnknown_2036E30 = &gObjectEvents[gPlayerAvatar.objectEventId];
        if (gUnknown_2036E30->heldMovementFinished)
        {
            if (MetatileBehavior_IsStopSpinning(gUnknown_2036E30->currentMetatileBehavior))
            {
                return FALSE;
            }
            if (MetatileBehavior_IsSpinTile(gUnknown_2036E30->currentMetatileBehavior))
            {
                gPlayerAvatar.unk1C = gUnknown_2036E30->currentMetatileBehavior;
            }
            ObjectEventClearHeldMovement(gUnknown_2036E30);
            sub_805C2CC(gPlayerAvatar.unk1C);
        }
        return TRUE;
    }
    return FALSE;
}

const struct {
    bool8 (*unk0)(u8 metatileBehavior);
    bool8 (*unk4)(void);
} sForcedMovementFuncs[] = {
    {MetatileBehavior_IsUnknownMovement48, ForcedMovement_Slip},
    {MetatileBehavior_IsIce_2, ForcedMovement_Slip},
    {MetatileBehavior_IsWalkSouth, ForcedMovement_WalkSouth},
    {MetatileBehavior_IsWalkNorth, ForcedMovement_WalkNorth},
    {MetatileBehavior_IsWalkWest, ForcedMovement_WalkWest},
    {MetatileBehavior_IsWalkEast, ForcedMovement_WalkEast},
    {MetatileBehavior_IsSouthwardCurrent, ForcedMovement_PushedSouthByCurrent},
    {MetatileBehavior_IsNorthwardCurrent, ForcedMovement_PushedNorthByCurrent},
    {MetatileBehavior_IsWestwardCurrent, ForcedMovement_PushedWestByCurrent},
    {MetatileBehavior_IsEastwardCurrent, ForcedMovement_PushedEastByCurrent},
    {MetatileBehavior_IsSpinRight, ForcedMovement_SpinRight},
    {MetatileBehavior_IsSpinLeft, ForcedMovement_SpinLeft},
    {MetatileBehavior_IsSpinUp, ForcedMovement_SpinUp},
    {MetatileBehavior_IsSpinDown, ForcedMovement_SpinDown},
    {MetatileBehavior_IsSlideSouth, ForcedMovement_SlideSouth},
    {MetatileBehavior_IsSlideNorth, ForcedMovement_SlideNorth},
    {MetatileBehavior_IsSlideWest, ForcedMovement_SlideWest},
    {MetatileBehavior_IsSlideEast, ForcedMovement_SlideEast},
    {MetatileBehavior_IsWaterfall, ForcedMovement_PushedSouthByCurrent},
    {MetatileBehavior_UnusedReturnFalse_7, ForcedMovement_0xBB},
    {MetatileBehavior_UnusedReturnFalse_8, ForcedMovement_0xBC},
    {NULL, ForcedMovement_None},
};

bool8 TryDoMetatileBehaviorForcedMovement(void)
{
    int i;
    u8 behavior;
    if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_FORCED_MVMT_DISABLED))
    {
        behavior = gObjectEvents[gPlayerAvatar.objectEventId].currentMetatileBehavior;
        for (i = 0; sForcedMovementFuncs[i].unk0 != NULL; i++)
        {
            if (sForcedMovementFuncs[i].unk0(behavior))
            {
                gPlayerAvatar.unk1C = behavior;
                return sForcedMovementFuncs[i].unk4();
            }
        }
        return sForcedMovementFuncs[i].unk4();
    }
    else
    {
        for (i = 0; sForcedMovementFuncs[i].unk0 != NULL; i++)
            ;
        return sForcedMovementFuncs[i].unk4();
    }
}

bool8 ForcedMovement_None(void)
{
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MVMT_IS_FORCED)
    {
        struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

        playerObjEvent->facingDirectionLocked = FALSE;
        playerObjEvent->enableAnim = TRUE;
        SetObjectEventDirection(playerObjEvent, playerObjEvent->facingDirection);
        gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_MVMT_IS_FORCED;
    }
    return FALSE;
}

u8 DoForcedMovement(u8 direction, MovementAction movementAction)
{
    struct PlayerAvatar *playerAvatar = &gPlayerAvatar;
    u8 collision = CheckForPlayerAvatarCollision(direction);

    playerAvatar->flags |= PLAYER_AVATAR_FLAG_MVMT_IS_FORCED;
    if (collision)
    {
        ForcedMovement_None();
        if (collision < COLLISION_STOP_SURFING)
        {
            return 0;
        }
        else
        {
            if (collision == COLLISION_LEDGE_JUMP)
                PlayerJumpLedge(direction);
            playerAvatar->flags |= PLAYER_AVATAR_FLAG_MVMT_IS_FORCED;
            playerAvatar->runningState = MOVING;
            return 1;
        }
    }
    else
    {
        playerAvatar->runningState = MOVING;
        movementAction(direction);
        return 1;
    }
}

u8 DoForcedMovementInCurrentDirection(MovementAction movementAction)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    playerObjEvent->disableAnim = TRUE;
    return DoForcedMovement(playerObjEvent->movementDirection, movementAction);
}

bool8 ForcedMovement_Slip(void)
{
    return DoForcedMovementInCurrentDirection(PlayerGoSpeed2);
}

bool8 ForcedMovement_WalkSouth(void)
{
    return DoForcedMovement(DIR_SOUTH, PlayerGoSpeed1);
}

bool8 ForcedMovement_WalkNorth(void)
{
    return DoForcedMovement(DIR_NORTH, PlayerGoSpeed1);
}

bool8 ForcedMovement_WalkWest(void)
{
    return DoForcedMovement(DIR_WEST, PlayerGoSpeed1);
}

bool8 ForcedMovement_WalkEast(void)
{
    return DoForcedMovement(DIR_EAST, PlayerGoSpeed1);
}

bool8 ForcedMovement_SpinRight(void)
{
    PlaySpinSound();
    return DoForcedMovement(DIR_EAST, PlayerGoSpin);
}

bool8 ForcedMovement_SpinLeft(void)
{
    PlaySpinSound();
    return DoForcedMovement(DIR_WEST, PlayerGoSpin);
}

bool8 ForcedMovement_SpinUp(void)
{
    PlaySpinSound();
    return DoForcedMovement(DIR_NORTH, PlayerGoSpin);
}

bool8 ForcedMovement_SpinDown(void)
{
    PlaySpinSound();
    return DoForcedMovement(DIR_SOUTH, PlayerGoSpin);
}

void PlaySpinSound(void)
{
    PlaySE(SE_W013B);
}

bool8 ForcedMovement_PushedSouthByCurrent(void)
{
    return DoForcedMovement(DIR_SOUTH, PlayerRideWaterCurrent);
}

bool8 ForcedMovement_PushedNorthByCurrent(void)
{
    return DoForcedMovement(DIR_NORTH, PlayerRideWaterCurrent);
}

bool8 ForcedMovement_PushedWestByCurrent(void)
{
    return DoForcedMovement(DIR_WEST, PlayerRideWaterCurrent);
}

bool8 ForcedMovement_PushedEastByCurrent(void)
{
    return DoForcedMovement(DIR_EAST, PlayerRideWaterCurrent);
}

u8 ForcedMovement_Slide(u8 direction, MovementAction movementAction)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    playerObjEvent->disableAnim = TRUE;
    playerObjEvent->facingDirectionLocked = TRUE;
    return DoForcedMovement(direction, movementAction);
}

bool8 ForcedMovement_SlideSouth(void)
{
    return ForcedMovement_Slide(DIR_SOUTH, PlayerGoSpeed2);
}

bool8 ForcedMovement_SlideNorth(void)
{
    return ForcedMovement_Slide(DIR_NORTH, PlayerGoSpeed2);
}

bool8 ForcedMovement_SlideWest(void)
{
    return ForcedMovement_Slide(DIR_WEST, PlayerGoSpeed2);
}

bool8 ForcedMovement_SlideEast(void)
{
    return ForcedMovement_Slide(DIR_EAST, PlayerGoSpeed2);
}

bool8 ForcedMovement_0xBB(void)
{
    DoPlayerMatJump();
    return TRUE;
}

bool8 ForcedMovement_0xBC(void)
{
    DoPlayerMatSpin();
    return TRUE;
}

void (*const gUnknown_835B814[])(u8, u16) = {
    PlayerNotOnBikeNotMoving,
    PlayerNotOnBikeTurningInPlace,
    PlayerNotOnBikeMoving
};

void MovePlayerNotOnBike(u8 direction, u16 heldKeys)
{
    gUnknown_835B814[CheckMovementInputNotOnBike(direction)](direction, heldKeys);
}

u8 CheckMovementInputNotOnBike(u8 direction)
{
    if (direction == DIR_NONE)
    {
        gPlayerAvatar.runningState = NOT_MOVING;
        return 0;
    }
    else if (direction != GetPlayerMovementDirection() && gPlayerAvatar.runningState != MOVING)
    {
        gPlayerAvatar.runningState = TURN_DIRECTION;
        return 1;
    }
    else
    {
        gPlayerAvatar.runningState = MOVING;
        return 2;
    }
}

void PlayerNotOnBikeNotMoving(u8 direction, u16 heldKeys)
{
    PlayerFaceDirection(GetPlayerFacingDirection());
}

void PlayerNotOnBikeTurningInPlace(u8 direction, u16 heldKeys)
{
    PlayerTurnInPlace(direction);
}

void PlayerNotOnBikeMoving(u8 direction, u16 heldKeys)
{
    u8 collision = CheckForPlayerAvatarCollision(direction);

    if (collision != COLLISION_NONE)
    {
        if (collision == COLLISION_LEDGE_JUMP)
        {
            PlayerJumpLedge(direction);
        }
        else if (collision == COLLISION_UNKNOWN_WARP_6C_6D_6E_6F)
        {
            PlayerFaceDirection(direction);
        }
        else if (collision != COLLISION_STOP_SURFING && collision != COLLISION_LEDGE_JUMP && collision != COLLISION_PUSHED_BOULDER && collision != COLLISION_UNKNOWN_WARP_6C_6D_6E_6F)
        {
            PlayerNotOnBikeCollide(direction);
        }
        return;
    }

    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
    {
        // speed 2 is fast, same speed as running
        PlayerGoSpeed2(direction);
        return;
    }

    if ((heldKeys & B_BUTTON) && FlagGet(FLAG_SYS_B_DASH)
        && !IsRunningDisallowed(gObjectEvents[gPlayerAvatar.objectEventId].currentMetatileBehavior))
    {
        if (PlayerIsMovingOnRockStairs(direction))
            PlayerRunSlow(direction);
        else
            PlayerRun(direction);
        gPlayerAvatar.flags |= PLAYER_AVATAR_FLAG_DASH;
        return;
    }
    else
    {
        if (PlayerIsMovingOnRockStairs(direction))
            PlayerGoSlow(direction);
        else
            PlayerGoSpeed1(direction);
    }
}

bool32 PlayerIsMovingOnRockStairs(u8 direction)
{
    struct ObjectEvent * objectEvent;
    s16 x, y;

    objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    x = objectEvent->currentCoords.x;
    y = objectEvent->currentCoords.y;
    switch (direction)
    {
    case DIR_NORTH:
        return MetatileBehavior_IsRockStairs(MapGridGetMetatileBehaviorAt(x, y));
    case DIR_SOUTH:
        MoveCoords(DIR_SOUTH, &x, &y);
        return MetatileBehavior_IsRockStairs(MapGridGetMetatileBehaviorAt(x, y));
    default:
        return FALSE;
    }
}

u8 CheckForPlayerAvatarCollision(u8 direction)
{
    s16 x, y;
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    x = playerObjEvent->currentCoords.x;
    y = playerObjEvent->currentCoords.y;
    if (sub_806DB84(MapGridGetMetatileBehaviorAt(x, y), direction))
        return 8;
    MoveCoords(direction, &x, &y);
    return CheckForObjectEventCollision(playerObjEvent, x, y, direction, MapGridGetMetatileBehaviorAt(x, y));
}

u8 CheckForObjectEventCollision(struct ObjectEvent *objectEvent, s16 x, s16 y, u8 direction, u8 metatileBehavior)
{
    u8 collision = GetCollisionAtCoords(objectEvent, x, y, direction);
    if (collision == COLLISION_ELEVATION_MISMATCH && CanStopSurfing(x, y, direction))
        return COLLISION_STOP_SURFING;

    if (ShouldJumpLedge(x, y, direction))
    {
        IncrementGameStat(GAME_STAT_JUMPED_DOWN_LEDGES);
        return COLLISION_LEDGE_JUMP;
    }
    if (collision == COLLISION_OBJECT_EVENT && TryPushBoulder(x, y, direction))
        return COLLISION_PUSHED_BOULDER;

    if (collision == COLLISION_NONE)
    {
        CheckAcroBikeCollision(x, y, metatileBehavior, &collision);
    }
    return collision;
}

const u8 gUnknown_835B820[] = {
    MOVEMENT_ACTION_FACE_DOWN_FAST,
    MOVEMENT_ACTION_FACE_DOWN_FAST,
    MOVEMENT_ACTION_FACE_UP_FAST,
    MOVEMENT_ACTION_FACE_LEFT_FAST,
    MOVEMENT_ACTION_FACE_RIGHT_FAST
};

bool8 CanStopSurfing(s16 x, s16 y, u8 direction)
{
    if ((gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
        && MapGridGetZCoordAt(x, y) == 3
        && GetObjectEventIdByXYZ(x, y, 3) == OBJECT_EVENTS_COUNT)
    {
        sub_811278C(gUnknown_835B820[direction], 16);
        CreateStopSurfingTask(direction);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ShouldJumpLedge(s16 x, s16 y, u8 z)
{
    if (GetLedgeJumpDirection(x, y, z) != 0)
        return TRUE;
    else
        return FALSE;
}

bool8 TryPushBoulder(s16 x, s16 y, u8 direction)
{
    u8 objectEventId;
    if (!FlagGet(FLAG_SYS_USE_STRENGTH))
        return FALSE;

    objectEventId = GetObjectEventIdByXY(x, y);
    if (objectEventId == OBJECT_EVENTS_COUNT)
        return FALSE;

    if (gObjectEvents[objectEventId].graphicsId != OBJ_EVENT_GFX_PUSHABLE_BOULDER)
        return FALSE;

    x = gObjectEvents[objectEventId].currentCoords.x;
    y = gObjectEvents[objectEventId].currentCoords.y;
    MoveCoords(direction, &x, &y);
    if (MapGridGetMetatileBehaviorAt(x, y) == MB_FALL_WARP || (GetCollisionAtCoords(&gObjectEvents[objectEventId], x, y, direction) == COLLISION_NONE && !MetatileBehavior_IsNonAnimDoor(MapGridGetMetatileBehaviorAt(x, y))))
    {
        StartStrengthAnim(objectEventId, direction);
        return TRUE;
    }
    else
    {
        direction++;
        direction--;
        return FALSE;
    }
}

bool8 (*const gUnknown_835B828[])(u8) = {
    MetatileBehavior_IsBumpySlope,
    MetatileBehavior_IsIsolatedVerticalRail,
    MetatileBehavior_IsIsolatedHorizontalRail,
    MetatileBehavior_IsVerticalRail,
    MetatileBehavior_IsHorizontalRail
};

const u8 gUnknown_835B83C[] = {
    COLLISION_WHEELIE_HOP,
    COLLISION_ISOLATED_VERTICAL_RAIL,
    COLLISION_ISOLATED_HORIZONTAL_RAIL,
    COLLISION_VERTICAL_RAIL,
    COLLISION_HORIZONTAL_RAIL,
};

void CheckAcroBikeCollision(s16 x, s16 y, u8 metatileBehavior, u8 *collision)
{
    u8 i;

    for (i = 0; i < NELEMS(gUnknown_835B828); i++)
    {
        if (gUnknown_835B828[i](metatileBehavior))
        {
            *collision = gUnknown_835B83C[i];
            return;
        }
    }
}

void SetPlayerAvatarTransitionFlags(bool16 flags)
{
    gPlayerAvatar.unk1 |= flags;
    DoPlayerAvatarTransition();
}

void (*const gUnknown_835B844[])(struct ObjectEvent *) = {
    PlayerAvatarTransition_Normal,
    PlayerAvatarTransition_Bike,
    PlayerAvatarTransition_Bike,
    PlayerAvatarTransition_Surfing,
    PlayerAvatarTransition_Underwater,
    PlayerAvatarTransition_ReturnToField,
    PlayerAvatarTransition_Dummy,
    PlayerAvatarTransition_Dummy
};

void DoPlayerAvatarTransition(void)
{
    u8 i;
    u8 flags = gPlayerAvatar.unk1;

    if (flags != 0)
    {
        for (i = 0; i < NELEMS(gUnknown_835B844); i++, flags >>= 1)
        {
            if (flags & 1)
                gUnknown_835B844[i](&gObjectEvents[gPlayerAvatar.objectEventId]);
        }
        gPlayerAvatar.unk1 = 0;
    }
}

void PlayerAvatarTransition_Dummy(struct ObjectEvent * playerObjEvent)
{

}

void PlayerAvatarTransition_Normal(struct ObjectEvent * playerObjEvent)
{
    sub_8150474(0);
    sub_8150498(0);
}

void PlayerAvatarTransition_Bike(struct ObjectEvent * playerObjEvent)
{
    sub_8150474(1);
    sub_8150498(1);
    sub_80BD620(0, 0);
}

void PlayerAvatarTransition_Surfing(struct ObjectEvent * playerObjEvent)
{
    sub_8150474(3);
    sub_8150498(3);
}

void PlayerAvatarTransition_Underwater(struct ObjectEvent * playerObjEvent)
{

}

void PlayerAvatarTransition_ReturnToField(struct ObjectEvent * playerObjEvent)
{
    gPlayerAvatar.flags |= PLAYER_AVATAR_FLAG_FORCED_MVMT_DISABLED;
}

void sub_805BEB8(void)
{
    gPlayerAvatar.tileTransitionState = T_NOT_MOVING;
    if (PlayerIsAnimActive())
    {
        if (!PlayerCheckIfAnimFinishedOrInactive())
        {
            if (!player_is_anim_in_certain_ranges())
                gPlayerAvatar.tileTransitionState = T_TILE_TRANSITION;
        }
        else
        {
            if (!sub_805BF58())
                gPlayerAvatar.tileTransitionState = T_TILE_CENTER;
        }
    }
}

bool8 player_is_anim_in_certain_ranges(void)
{
    u8 movementActionId = gObjectEvents[gPlayerAvatar.objectEventId].movementActionId;

    if (movementActionId <= MOVEMENT_ACTION_FACE_RIGHT_FAST
        || (movementActionId >= MOVEMENT_ACTION_DELAY_1 && movementActionId <= MOVEMENT_ACTION_DELAY_16)
        || (movementActionId >= MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_DOWN && movementActionId <= MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_RIGHT)
        || (movementActionId >= MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN && movementActionId <= MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_RIGHT)
        || (movementActionId >= MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN && movementActionId <= MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_RIGHT))
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805BF58(void)
{
    if (player_is_anim_in_certain_ranges() && gPlayerAvatar.runningState != TURN_DIRECTION)
        return TRUE;
    else
        return FALSE;
}

bool8 PlayerIsAnimActive(void)
{
    return ObjectEventIsMovementOverridden(&gObjectEvents[gPlayerAvatar.objectEventId]);
}

bool8 PlayerCheckIfAnimFinishedOrInactive(void)
{
    return ObjectEventCheckHeldMovementStatus(&gObjectEvents[gPlayerAvatar.objectEventId]);
}

void PlayerSetCopyableMovement(u8 a)
{
    gObjectEvents[gPlayerAvatar.objectEventId].playerCopyableMovement = a;
}

u8 PlayerGetCopyableMovement(void)
{
    return gObjectEvents[gPlayerAvatar.objectEventId].playerCopyableMovement;
}
