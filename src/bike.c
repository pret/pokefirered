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

static u8 sub_80BD0D4(u8 *, u16, u16);
static void sub_80BD664(void);
static u8 sub_80BD4F0(u8, u8);
static u8 sub_80BD3A0(u8);
static u8 sub_80BD40C(struct ObjectEvent *, s16, s16, u8, u8);
static bool8 sub_80BD4B8(u8);
static void sub_80BD27C(u8);
static void sub_80BD28C(u8);
static void sub_80BD2C8(u8);
static void sub_80BD358(u8);
static void sub_80BD380(u8);
static u8 sub_80BD100(u8 *, u16, u16);
static u8 sub_80BD1C8(u8 *, u16, u16);
static u8 sub_80BD1E8(u8 *, u16, u16);

static void (*const gUnknown_83E7CFC[])(u8) =
{
    sub_80BD27C,
    sub_80BD28C,
    sub_80BD2C8,
    sub_80BD358,
    sub_80BD380,
};

static u8 (*const gUnknown_83E7D10[])(u8 *, u16, u16) =
{
    sub_80BD100,
    sub_80BD1C8,
    sub_80BD1E8,
};

void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys)
{
    gUnknown_83E7CFC[sub_80BD0D4(&direction, newKeys, heldKeys)](direction);
}

static u8 sub_80BD0D4(u8 *direction, u16 newKeys, u16 heldKeys)
{
    return gUnknown_83E7D10[gPlayerAvatar.acroBikeState](direction, newKeys, heldKeys);
}

static u8 sub_80BD100(u8 *r6, u16 sl, u16 sb)
{
    struct ObjectEvent *r4 = &gObjectEvents[gPlayerAvatar.objectEventId];
    u8 r7 = GetPlayerMovementDirection();

    gPlayerAvatar.bikeFrameCounter = 0;
    if (MetatileBehavior_IsCyclingRoadPullDownTile(r4->currentMetatileBehavior) == TRUE)
    {
        if (!JOY_HELD(B_BUTTON))
        {
            gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
            gPlayerAvatar.runningState = 2;
            if (*r6 < 2)
                return 3;
            else
                return 4;
        }
        else
        {
            if (*r6 != 0)
            {
                gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
                gPlayerAvatar.runningState = 2;
                return 4;
            }
            else
            {
                goto _080BD17E; // for matching purpose
            }
        }
    }
    else
    {
        if (*r6 == 0)
        {
        _080BD17E:
            *r6 = r7;
            gPlayerAvatar.runningState = 0;
            return 0;
        }
        else
        {
            if (*r6 != r7 && gPlayerAvatar.runningState != 2)
            {
                gPlayerAvatar.acroBikeState = ACRO_STATE_TURNING;
                gPlayerAvatar.newDirBackup = *r6;
                gPlayerAvatar.runningState = 0;
                return sub_80BD0D4(r6, sl, sb);
            }
            else
            {
                gPlayerAvatar.runningState = 2;
                return 2;
            }
        }
    }
}

static u8 sub_80BD1C8(u8 *r0, UNUSED u16 r1, UNUSED u16 r2)
{
    *r0 = gPlayerAvatar.newDirBackup;
    gPlayerAvatar.runningState = 1;
    gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
    sub_80BD664();
    return 1;
}

static u8 sub_80BD1E8(u8 *r6, u16 sb, u16 r8)
{
    u8 r5 = GetPlayerMovementDirection();
    u8 r1 = gPlayerAvatar.objectEventId;
    if (MetatileBehavior_IsCyclingRoadPullDownTile(r1[gObjectEvents].currentMetatileBehavior) == TRUE)
    {
        if (*r6 != r5)
        {
            gPlayerAvatar.acroBikeState = ACRO_STATE_TURNING;
            gPlayerAvatar.newDirBackup = *r6;
            gPlayerAvatar.runningState = 0;
            return sub_80BD0D4(r6, sb, r8);
        }
        else
        {
            gPlayerAvatar.runningState = 2;
            gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
            if (*r6 < 2)
                return 3;
            else
                return 4;
        }
    }
    else
    {
        gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
        if (*r6 == 0)
        {
            *r6 = r5;
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

static void sub_80BD27C(u8 r0)
{
    PlayerFaceDirection(r0);
}

static void sub_80BD28C(u8 r4)
{
    struct ObjectEvent *r5 = &gObjectEvents[gPlayerAvatar.objectEventId];

    if (!sub_80BD4F0(r4, r5->currentMetatileBehavior))
        r4 = r5->movementDirection;
    PlayerFaceDirection(r4);
}

static void sub_80BD2C8(u8 r4)
{
    struct ObjectEvent *r5;
    
    r5 = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (!sub_80BD4F0(r4, r5->currentMetatileBehavior))
    {
        sub_80BD27C(r5->movementDirection);
    }
    else
    {
        u8 r1 = sub_80BD3A0(r4);

        if (r1 > 0 && r1 <= 11)
        {
            if (r1 == 6)
                PlayerJumpLedge(r4);
            else if (r1 != 5 && r1 != 6 && r1 != 7 && r1 != 8)
                PlayerOnBikeCollide(r4);
        }
        else
        {
            
            if (r1 == 14)
                PlayerGoSpeed2(r4);
            else if (PlayerIsMovingOnRockStairs(r4))
                PlayerGoSpeed2(r4);
            else
                PlayerRideWaterCurrent(r4);
        }
    }
}

static void sub_80BD358(UNUSED u8 v)
{
    u8 r0 = sub_80BD3A0(1);

    if (r0 == 0)
        sub_805C164(1);
    else if (r0 == 6)
        PlayerJumpLedge(1);
}

static void sub_80BD380(u8 r4)
{
    if (sub_80BD3A0(r4) == 0)
        PlayerGoSpeed1(r4);
}

static u8 sub_80BD3A0(u8 r6)
{
    struct ObjectEvent *r4 = &gObjectEvents[gPlayerAvatar.objectEventId];
    s16 sp04, sp06;
    u8 r0;

    sp04 = r4->currentCoords.x;
    sp06 = r4->currentCoords.y;
    MoveCoords(r6, &sp04, &sp06);
    r0 = MapGridGetMetatileBehaviorAt(sp04, sp06);
    return sub_80BD40C(r4, sp04, sp06, r6, r0);
}

static u8 sub_80BD40C(struct ObjectEvent *r0, s16 r1, s16 r2, u8 r3, u8 r5)
{
    u8 r4 = CheckForObjectEventCollision(r0, r1, r2, r3, r5);

    if (r4 <= 4)
    {
        u8 r0 = MetatileBehavior_IsCrackedIce(r5);
        if (r0 == TRUE)
            return 14;
        if (r4 == 0 && sub_80BD4B8(r5))
            r4 = 2;
    }
    return r4;
}

bool8 sub_80BD460(u8 r0)
{
    if (sub_80BD4B8(r0))
        return TRUE;
    if (gMapHeader.mapType != MAP_TYPE_INDOOR)
        return FALSE;
    else
        return TRUE;
}

bool32 IsRunningDisallowed(u8 metatileBehavior)
{
    if (!(gMapHeader.flags & MAP_ALLOW_RUN))
        return TRUE;
    if (sub_80BD4B8(metatileBehavior) != TRUE)
        return FALSE;
    else
        return TRUE;
}

static bool8 sub_80BD4B8(u8 r4)
{
    if (MetatileBehavior_IsMB0A(r4))
        return TRUE;
    if (!MetatileBehavior_ReturnFalse_9(r4))
        return FALSE;
    if (PlayerGetZCoord() & 1)
        return FALSE;
    return TRUE;
}

static bool8 sub_80BD4F0(u8 r0, u8 r4)
{
    if (r0 == DIR_EAST || r0 == DIR_WEST)
    {
        if (MetatileBehavior_IsIsolatedVerticalRail(r4) || MetatileBehavior_IsVerticalRail(r4))
            return FALSE;
    }
    else
    {
        if (MetatileBehavior_IsIsolatedHorizontalRail(r4) || MetatileBehavior_IsHorizontalRail(r4))
            return FALSE;
    }
    return TRUE;
}

bool8 sub_80BD540(void)
{
    s16 sp00, sp02;
    u8 r0;

    if (!(gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_UNDERWATER | PLAYER_AVATAR_FLAG_SURFING)))
    {
        PlayerGetDestCoords(&sp00, &sp02);
        r0 = MapGridGetMetatileBehaviorAt(sp00, sp02);
        if (!sub_80BD4B8(r0))
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
        if (sub_8056124(MUS_CYCLING))
        {
            Overworld_SetSavedMusic(MUS_CYCLING);
            Overworld_ChangeMusicTo(MUS_CYCLING);
        }
    }
}

void sub_80BD620(u32 directionHistory, u32 abStartSelectHistory)
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
    else if (gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_SURFING | PLAYER_AVATAR_FLAG_WATERING))
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
