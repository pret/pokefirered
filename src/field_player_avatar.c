#include "global.h"
#include "gflib.h"
#include "bike.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "constants/event_object_movement.h"
#include "constants/songs.h"

EWRAM_DATA struct ObjectEvent * gUnknown_2036E30 = NULL;
EWRAM_DATA bool8 gUnknown_2036E34 = FALSE;
EWRAM_DATA struct ObjectEvent gObjectEvents[OBJECT_EVENTS_COUNT] = {};
EWRAM_DATA struct PlayerAvatar gPlayerAvatar = {};

u8 ObjectEventCB2_NoMovement2(struct ObjectEvent * object, struct Sprite * sprite);
bool8 sub_805B528(void);
bool8 TryInterruptObjectEventSpecialAnim(struct ObjectEvent * playerObjEvent, u8 direction);
void npc_clear_strange_bits(struct ObjectEvent * playerObjEvent);
void DoPlayerAvatarTransition(void);
bool8 TryDoMetatileBehaviorForcedMovement(void);
void MovePlayerAvatarUsingKeypadInput(u8 direction, u16 newKeys, u16 heldKeys);
void PlayerAllowForcedMovementIfMovingSameDirection(void);
bool8 ForcedMovement_None(void);
void PlayerJumpLedge(u8 direction);
u8 CheckForPlayerAvatarCollision(u8 direction);
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
void PlayerGoSpeed2(u8 direction);
void PlayerGoSpeed1(u8 direction);
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
