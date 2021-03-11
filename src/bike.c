#include "global.h"
#include "bike.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "event_object_movement.h"
#include "fieldmap.h"
#include "field_camera.h"
#include "overworld.h"
#include "constants/map_types.h"
#include "constants/songs.h"

static u8 GetMovePlayerOnBikeFuncId(u8 *, u16, u16);
static void sub_80BD664(void);
static u8 BikeCanFaceDIrectionOnRail(u8, u8);
static u8 CheckNextTileForBikingCollision(u8);
static u8 AdjustCollisionForBiking(struct ObjectEvent *, s16, s16, u8, u8);
static bool8 MetatileBehaviorForbidsBiking(u8);
static void BikeFaceDirection(u8);
static void BikeFaceDirectionAccountForRail(u8);
static void BikeTryMoveFastInDirection(u8);
static void BikeLetGravityTakeTheWheel(u8);
static void BikeTryMoveInDirection(u8);
static u8 GetBikeMoveCmd_0(u8 *, u16, u16);
static u8 GetBikeMoveCmd_1(u8 *, u16, u16);
static u8 GetBikeMoveCmd_2(u8 *, u16, u16);

static void (*const sMovePlayerOnBikeFuncs[])(u8) =
{
    BikeFaceDirection,
    BikeFaceDirectionAccountForRail,
    BikeTryMoveFastInDirection,
    BikeLetGravityTakeTheWheel,
    BikeTryMoveInDirection,
};

static u8 (*const sGetMovePlayerOnBikeFuncIdFuncs[])(u8 *, u16, u16) =
{
    GetBikeMoveCmd_0,
    GetBikeMoveCmd_1,
    GetBikeMoveCmd_2,
};

void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys)
{
    sMovePlayerOnBikeFuncs[GetMovePlayerOnBikeFuncId(&direction, newKeys, heldKeys)](direction);
}

static u8 GetMovePlayerOnBikeFuncId(u8 *direction, u16 newKeys, u16 heldKeys)
{
    return sGetMovePlayerOnBikeFuncIdFuncs[gPlayerAvatar.acroBikeState](direction, newKeys, heldKeys);
}

static u8 GetBikeMoveCmd_0(u8 *direction_p, u16 newKeys, u16 heldKeys)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    u8 direction = GetPlayerMovementDirection();

    gPlayerAvatar.bikeFrameCounter = 0;
    if (MetatileBehavior_IsCyclingRoadPullDownTile(playerObjEvent->currentMetatileBehavior) == TRUE)
    {
        if (!JOY_HELD(B_BUTTON))
        {
            gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
            gPlayerAvatar.runningState = 2;
            if (*direction_p < DIR_NORTH)
                return 3;
            else
                return 4;
        }
        else
        {
            if (*direction_p != DIR_NONE)
            {
                gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
                gPlayerAvatar.runningState = 2;
                return 4;
            }
        }
    }
    
    if (*direction_p == DIR_NONE)
    {
        *direction_p = direction;
        gPlayerAvatar.runningState = 0;
        return 0;
    }
    else
    {
        if (*direction_p != direction && gPlayerAvatar.runningState != 2)
        {
            gPlayerAvatar.acroBikeState = ACRO_STATE_TURNING;
            gPlayerAvatar.newDirBackup = *direction_p;
            gPlayerAvatar.runningState = 0;
            return GetMovePlayerOnBikeFuncId(direction_p, newKeys, heldKeys);
        }
        else
        {
            gPlayerAvatar.runningState = 2;
            return 2;
        }
    }
}

static u8 GetBikeMoveCmd_1(u8 *direction_p, UNUSED u16 newKeys, UNUSED u16 heldKeys)
{
    *direction_p = gPlayerAvatar.newDirBackup;
    gPlayerAvatar.runningState = 1;
    gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
    sub_80BD664();
    return 1;
}

static u8 GetBikeMoveCmd_2(u8 *direction_p, u16 newKeys, u16 heldKeys)
{
    u8 direction = GetPlayerMovementDirection();
    u8 playerObjEventId = gPlayerAvatar.objectEventId;
    if (MetatileBehavior_IsCyclingRoadPullDownTile(playerObjEventId[gObjectEvents].currentMetatileBehavior) == TRUE)
    {
        if (*direction_p != direction)
        {
            gPlayerAvatar.acroBikeState = ACRO_STATE_TURNING;
            gPlayerAvatar.newDirBackup = *direction_p;
            gPlayerAvatar.runningState = 0;
            return GetMovePlayerOnBikeFuncId(direction_p, newKeys, heldKeys);
        }
        else
        {
            gPlayerAvatar.runningState = 2;
            gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
            if (*direction_p < DIR_NORTH)
                return 3;
            else
                return 4;
        }
    }
    else
    {
        gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
        if (*direction_p == DIR_NONE)
        {
            *direction_p = direction;
            gPlayerAvatar.runningState = 0;
            return 0;
        }
        else
        {
            gPlayerAvatar.runningState = 2;
            return 2;
        }
    }
}

static void BikeFaceDirection(u8 direction)
{
    PlayerFaceDirection(direction);
}

static void BikeFaceDirectionAccountForRail(u8 direction)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    if (!BikeCanFaceDIrectionOnRail(direction, playerObjEvent->currentMetatileBehavior))
        direction = playerObjEvent->movementDirection;
    PlayerFaceDirection(direction);
}

static void BikeTryMoveFastInDirection(u8 direction)
{
    struct ObjectEvent *playerObjEvent;
    
    playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!BikeCanFaceDIrectionOnRail(direction, playerObjEvent->currentMetatileBehavior))
    {
        BikeFaceDirection(playerObjEvent->movementDirection);
    }
    else
    {
        u8 collision = CheckNextTileForBikingCollision(direction);

        if (collision > COLLISION_NONE && collision <= COLLISION_ISOLATED_HORIZONTAL_RAIL)
        {
            if (collision == COLLISION_LEDGE_JUMP)
                PlayerJumpLedge(direction);
            else if (collision != COLLISION_STOP_SURFING && collision != COLLISION_LEDGE_JUMP && collision != COLLISION_PUSHED_BOULDER && collision != COLLISION_UNKNOWN_WARP_6C_6D_6E_6F)
                PlayerOnBikeCollide(direction);
        }
        else
        {
            
            if (collision == COLLISION_COUNT)
                PlayerGoSpeed2(direction);
            else if (PlayerIsMovingOnRockStairs(direction))
                PlayerGoSpeed2(direction);
            else
                PlayerRideWaterCurrent(direction);
        }
    }
}

static void BikeLetGravityTakeTheWheel(UNUSED u8 v)
{
    u8 collision = CheckNextTileForBikingCollision(DIR_SOUTH);

    if (collision == COLLISION_NONE)
        sub_805C164(DIR_SOUTH);
    else if (collision == COLLISION_LEDGE_JUMP)
        PlayerJumpLedge(DIR_SOUTH);
}

static void BikeTryMoveInDirection(u8 direction)
{
    if (CheckNextTileForBikingCollision(direction) == COLLISION_NONE)
        PlayerGoSpeed1(direction);
}

static u8 CheckNextTileForBikingCollision(u8 direction)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    s16 x, y;
    u8 metatileBehavior;

    x = playerObjEvent->currentCoords.x;
    y = playerObjEvent->currentCoords.y;
    MoveCoords(direction, &x, &y);
    metatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
    return AdjustCollisionForBiking(playerObjEvent, x, y, direction, metatileBehavior);
}

static u8 AdjustCollisionForBiking(struct ObjectEvent *playerObjEvent, s16 x, s16 y, u8 direction, u8 metatileBehavior)
{
    u8 retVal = CheckForObjectEventCollision(playerObjEvent, x, y, direction, metatileBehavior);

    if (retVal <= COLLISION_OBJECT_EVENT)
    {
        bool8 isCrackedIce = MetatileBehavior_IsCrackedIce(metatileBehavior);
        if (isCrackedIce == TRUE)
            return COLLISION_COUNT;
        if (retVal == COLLISION_NONE && MetatileBehaviorForbidsBiking(metatileBehavior))
            retVal = COLLISION_IMPASSABLE;
    }
    return retVal;
}

bool8 sub_80BD460(u8 r0)
{
    if (MetatileBehaviorForbidsBiking(r0))
        return TRUE;
    if (gMapHeader.mapType != MAP_TYPE_INDOOR)
        return FALSE;
    else
        return TRUE;
}

bool32 IsRunningDisallowed(u8 metatileBehavior)
{
    if (!(gMapHeader.runningAllowed))
        return TRUE;
    if (MetatileBehaviorForbidsBiking(metatileBehavior) != TRUE)
        return FALSE;
    else
        return TRUE;
}

static bool8 MetatileBehaviorForbidsBiking(u8 r4)
{
    if (MetatileBehavior_IsMB0A(r4))
        return TRUE;
    if (!MetatileBehavior_ReturnFalse_9(r4))
        return FALSE;
    if (PlayerGetZCoord() & 1)
        return FALSE;
    return TRUE;
}

static bool8 BikeCanFaceDIrectionOnRail(u8 direction, u8 metatileBehavior)
{
    if (direction == DIR_EAST || direction == DIR_WEST)
    {
        if (MetatileBehavior_IsIsolatedVerticalRail(metatileBehavior) || MetatileBehavior_IsVerticalRail(metatileBehavior))
            return FALSE;
    }
    else
    {
        if (MetatileBehavior_IsIsolatedHorizontalRail(metatileBehavior) || MetatileBehavior_IsHorizontalRail(metatileBehavior))
            return FALSE;
    }
    return TRUE;
}

bool8 MetatileAtPlayerPositionForbidsBiking(void)
{
    s16 x, y;
    u8 metatileBehavior;

    if (!(gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_UNDERWATER | PLAYER_AVATAR_FLAG_SURFING)))
    {
        PlayerGetDestCoords(&x, &y);
        metatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
        if (!MetatileBehaviorForbidsBiking(metatileBehavior))
            return FALSE;
    }
    return TRUE;
}

bool8 player_should_look_direction_be_enforced_upon_movement(void)
{
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_STATE_UNDERWATER))
    {
        if (MetatileBehavior_IsBumpySlope(gObjectEvents[gPlayerAvatar.objectEventId].currentMetatileBehavior))
            return FALSE;
    }
    return TRUE;
}

void StartTransitionToFlipBikeState(u8 flags)
{
    gBikeCameraAheadPanback = FALSE;
    if (gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
    {
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
        Overworld_ClearSavedMusic();
        Overworld_PlaySpecialMapMusic();
    }
    else
    {
        SetPlayerAvatarTransitionFlags(flags);
        if (Overworld_MusicCanOverrideMapMusic(MUS_CYCLING))
        {
            Overworld_SetSavedMusic(MUS_CYCLING);
            Overworld_ChangeMusicTo(MUS_CYCLING);
        }
    }
}

void InitPlayerAvatarBikeState(u32 directionHistory, u32 abStartSelectHistory)
{
    u8 i;

    gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
    gPlayerAvatar.newDirBackup = 0;
    gPlayerAvatar.bikeFrameCounter = 0;
    gPlayerAvatar.bikeSpeed = SPEED_STANDING;
    gPlayerAvatar.directionHistory = directionHistory;
    gPlayerAvatar.abStartSelectHistory = abStartSelectHistory;
    gPlayerAvatar.lastSpinTile = 0;
    for (i = 0; i < NELEMS(gPlayerAvatar.dirTimerHistory); ++i)
            gPlayerAvatar.dirTimerHistory[i] = 0;
}

void Bike_UpdateBikeCounterSpeed(u8 counter)
{
    gPlayerAvatar.bikeFrameCounter = counter;
    gPlayerAvatar.bikeSpeed = counter + (gPlayerAvatar.bikeFrameCounter >> 1);
}

static void sub_80BD664(void)
{
    gPlayerAvatar.bikeFrameCounter = 0;
    gPlayerAvatar.bikeSpeed = SPEED_STANDING;
}

s16 GetPlayerSpeed(void)
{
    s16 exp[] = { 1, 2, 4 };

    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
        return exp[gPlayerAvatar.bikeFrameCounter];
    else if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE)
        return 3;
    else if (gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_SURFING | PLAYER_AVATAR_FLAG_DASH))
        return 2;
    else
        return 1;
}

void Bike_HandleBumpySlopeJump(void)
{
    s16 x, y;
    u8 tileBehavior;

    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE)
    {
        PlayerGetDestCoords(&x, &y);
        tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
        if (MetatileBehavior_IsBumpySlope(tileBehavior))
        {
            gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
            nullsub_24(GetPlayerMovementDirection());
        }
    }
}

// R/S leftover

// the struct below is used for checking button combinations of the last input so that the acro can potentially perform a side/turn jump.
// its possible that at some point Game Freak intended for the acro bike to have more complex tricks: but only the acro jump combinations can be seen in the final ROM.
struct BikeHistoryInputInfo
{
    u32 dirHistoryMatch; // the direction you need to press
    u32 abStartSelectHistoryMatch; // the button you need to press
    u32 dirHistoryMask; // mask applied so that way only the recent nybble (the recent input) is checked
    u32 abStartSelectHistoryMask; // mask applied so that way only the recent nybble (the recent input) is checked
    const u8 *dirTimerHistoryList; // list of timers to check for direction before the button+dir combination can be verified.
    const u8 *abStartSelectHistoryList; // list of timers to check for buttons before the button+dir combination can be verified.
    u32 direction; // direction to jump
};

// this is a list of timers to compare against later, terminated with 0. the only timer being compared against is 4 frames in this list.
static const u8 sAcroBikeJumpTimerList[] = {4, 0};

// this is a list of history inputs to do in order to do the check to retrieve a jump direction for acro bike. it seems to be an extensible list, so its possible that Game Freak may have intended for the Acro Bike to have more complex tricks at some point. The final list only has the acro jump.
static const struct BikeHistoryInputInfo sAcroBikeTricksList[] =
{
    // the 0xF is a mask performed with each byte of the array in order to perform the check on only the last entry of the history list, otherwise the check wouldn't work as there can be 0xF0 as opposed to 0x0F.
    {DIR_SOUTH, B_BUTTON, 0xF, 0xF, sAcroBikeJumpTimerList, sAcroBikeJumpTimerList, DIR_SOUTH},
    {DIR_NORTH, B_BUTTON, 0xF, 0xF, sAcroBikeJumpTimerList, sAcroBikeJumpTimerList, DIR_NORTH},
    {DIR_WEST, B_BUTTON, 0xF, 0xF, sAcroBikeJumpTimerList, sAcroBikeJumpTimerList, DIR_WEST},
    {DIR_EAST, B_BUTTON, 0xF, 0xF, sAcroBikeJumpTimerList, sAcroBikeJumpTimerList, DIR_EAST},
};
