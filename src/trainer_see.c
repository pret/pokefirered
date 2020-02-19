#include "global.h"
#include "battle_setup.h"
#include "field_player_avatar.h"
#include "event_object_movement.h"
#include "quest_log.h"
#include "constants/battle_setup.h"

static bool8 CheckTrainer(u8 objectEventId);
static u8 GetTrainerApproachDistance(struct ObjectEvent * objectEvent);
static u8 GetTrainerApproachDistanceSouth(struct ObjectEvent * objectEvent, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceNorth(struct ObjectEvent * objectEvent, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceWest(struct ObjectEvent * objectEvent, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceEast(struct ObjectEvent * objectEvent, s16 range, s16 x, s16 y);
static u8 CheckPathBetweenTrainerAndPlayer(struct ObjectEvent * objectEvent, u8 approachDistance, u8 facingDirection);
void sub_8081E68(struct ObjectEvent * objectEvent, u8 approachDistance);

const u16 gUnknown_83C6AC8[] = INCBIN_U16("graphics/object_events/emoticons.4bpp");

u8 (*const sDirectionalApproachDistanceFuncs[])(struct ObjectEvent *, s16 range, s16 x, s16 y) = {
    GetTrainerApproachDistanceSouth,
    GetTrainerApproachDistanceNorth,
    GetTrainerApproachDistanceWest,
    GetTrainerApproachDistanceEast
};

bool8 CheckForTrainersWantingBattle(void)
{
    u8 i;
    if (sub_8111C2C() == TRUE)
        return FALSE;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active
         && (
             gObjectEvents[i].trainerType == 1
          || gObjectEvents[i].trainerType == 3
         )
         && CheckTrainer(i)
      )
            return TRUE;
    }
    return FALSE;
}

static bool8 CheckTrainer(u8 objectEventId)
{
    const u8 *script = GetObjectEventScriptPointerByObjectEventId(objectEventId);
    u8 approachDistance;
    if (GetTrainerFlagFromScriptPointer(script))
        return FALSE;
    approachDistance = GetTrainerApproachDistance(&gObjectEvents[objectEventId]);
    if (approachDistance != 0)
    {
        if (script[1] == TRAINER_BATTLE_DOUBLE && GetMonsStateToDoubles())
            return FALSE;
        ConfigureAndSetUpOneTrainerBattle(objectEventId, script);
        sub_8081E68(&gObjectEvents[objectEventId], approachDistance - 1);
        return TRUE;
    }
    return FALSE;
}

static u8 GetTrainerApproachDistance(struct ObjectEvent *trainerObj)
{
    s16 x, y;
    u8 i;
    u8 approachDistance;

    PlayerGetDestCoords(&x, &y);
    if (trainerObj->trainerType == 1)  // can only see in one direction
    {
        approachDistance = sDirectionalApproachDistanceFuncs[trainerObj->facingDirection - 1](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
        return CheckPathBetweenTrainerAndPlayer(trainerObj, approachDistance, trainerObj->facingDirection);
    }
    else  // can see in all directions
    {
        for (i = 0; i < 4; i++)
        {
            approachDistance = sDirectionalApproachDistanceFuncs[i](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
            if (CheckPathBetweenTrainerAndPlayer(trainerObj, approachDistance, i + 1)) // directions are 1-4 instead of 0-3. south north west east
                return approachDistance;
        }
    }

    return 0;
}

// Returns how far south the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceSouth(struct ObjectEvent *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.x == x
        && y > trainerObj->currentCoords.y
        && y <= trainerObj->currentCoords.y + range)
    {
        if (range > 3 && sub_805DF30() == OBJECT_EVENTS_COUNT)
            return 0;
        return (y - trainerObj->currentCoords.y);
    }
    else
        return 0;
}

// Returns how far north the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceNorth(struct ObjectEvent *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.x == x
        && y < trainerObj->currentCoords.y
        && y >= trainerObj->currentCoords.y - range)
        return (trainerObj->currentCoords.y - y);
    else
        return 0;
}

// Returns how far west the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceWest(struct ObjectEvent *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.y == y
        && x < trainerObj->currentCoords.x
        && x >= trainerObj->currentCoords.x - range)
        return (trainerObj->currentCoords.x - x);
    else
        return 0;
}

// Returns how far east the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceEast(struct ObjectEvent *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.y == y
        && x > trainerObj->currentCoords.x
        && x <= trainerObj->currentCoords.x + range)
        return (x - trainerObj->currentCoords.x);
    else
        return 0;
}

#define COLLISION_MASK (~1)

static u8 CheckPathBetweenTrainerAndPlayer(struct ObjectEvent *trainerObj, u8 approachDistance, u8 direction)
{
    s16 x, y;
    u8 unk19_temp;
    u8 unk19b_temp;
    u8 i;
    u8 collision;

    if (approachDistance == 0)
        return 0;

    x = trainerObj->currentCoords.x;
    y = trainerObj->currentCoords.y;

    for (i = 0; i <= approachDistance - 1; i++, MoveCoords(direction, &x, &y))
    {
        collision = GetCollisionFlagsAtCoords(trainerObj, x, y, direction);
        if (collision != 0 && (collision & COLLISION_MASK))
            return 0;
    }

    // preserve mapobj_unk_19 before clearing.
    unk19_temp = trainerObj->range.as_nybbles.x;
    unk19b_temp = trainerObj->range.as_nybbles.y;
    trainerObj->range.as_nybbles.x = 0;
    trainerObj->range.as_nybbles.y = 0;

    collision = GetCollisionAtCoords(trainerObj, x, y, direction);

    trainerObj->range.as_nybbles.x = unk19_temp;
    trainerObj->range.as_nybbles.y = unk19b_temp;
    if (collision == 4)
        return approachDistance;

    return 0;
}
