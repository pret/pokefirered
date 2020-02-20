#include "global.h"
#include "battle_setup.h"
#include "event_object_movement.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "quest_log.h"
#include "task.h"
#include "constants/battle_setup.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/object_events.h"

typedef u8 (*TRAINER_APPROACH_FUNC)(struct ObjectEvent *, s16, s16, s16);
typedef bool8 (*TRAINER_SEE_FUNC)(u8, struct Task *, struct ObjectEvent *);

static bool8 CheckTrainer(u8 trainerObjId);
static u8 GetTrainerApproachDistance(struct ObjectEvent * trainerObj);
static u8 GetTrainerApproachDistanceSouth(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceNorth(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceWest(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceEast(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y);
static u8 CheckPathBetweenTrainerAndPlayer(struct ObjectEvent * trainerObj, u8 approachDistance, u8 facingDirection);
void TrainerApproachPlayer(struct ObjectEvent * trainerObj, u8 approachDistance);
void Task_RunTrainerSeeFuncList(u8 taskId);
bool8 sub_8081F34(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_8081F38(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_8081F90(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_8081FD0(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_808202C(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_80820BC(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_8082100(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_8082134(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_8082150(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_8082184(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_80821DC(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_8082250(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_808226C(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_80822CC(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);
bool8 sub_808237C(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj);

const u16 gUnknown_83C6AC8[] = INCBIN_U16("graphics/object_events/emoticons.4bpp");

// u8 func(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y)
// range is the maximum distance the trainer can see
// x and y are the player's coordinates
// Returns distance to walk if trainer has unobstructed view of player
// Returns 0 if trainer can't see player
const TRAINER_APPROACH_FUNC sDirectionalApproachDistanceFuncs[] = {
    GetTrainerApproachDistanceSouth,
    GetTrainerApproachDistanceNorth,
    GetTrainerApproachDistanceWest,
    GetTrainerApproachDistanceEast
};

// bool8 func(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
// Returns TRUE to run the next func immediately
// Returns FALSE to delay the next func to the next frame
const TRAINER_SEE_FUNC sTrainerSeeFuncList[] = {
    sub_8081F34,
    sub_8081F38,
    sub_8081F90,
    sub_8081FD0,
    sub_808202C,
    sub_80820BC,
    sub_8082100,
    sub_8082134,
    sub_8082150,
    sub_8082184,
    sub_80821DC,
    sub_8082250,
    sub_808226C,
    sub_80822CC,
    sub_808237C
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

static bool8 CheckTrainer(u8 trainerObjId)
{
    const u8 *script = GetObjectEventScriptPointerByObjectEventId(trainerObjId);
    u8 approachDistance;
    if (GetTrainerFlagFromScriptPointer(script))
        return FALSE;
    approachDistance = GetTrainerApproachDistance(&gObjectEvents[trainerObjId]);
    if (approachDistance != 0)
    {
        if (script[1] == TRAINER_BATTLE_DOUBLE && GetMonsStateToDoubles())
            return FALSE;
        ConfigureAndSetUpOneTrainerBattle(trainerObjId, script);
        TrainerApproachPlayer(&gObjectEvents[trainerObjId], approachDistance - 1);
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
        if (range > 3 && GetIndexOfFirstInactiveObjectEvent() == OBJECT_EVENTS_COUNT)
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

#define tFuncId             data[0]
#define tTrainerObjHi       data[1]
#define tTrainerObjLo       data[2]
#define tTrainerRange       data[3]
#define tOutOfAshSpriteId   data[4]
#define tData5              data[5]

#define TaskGetTrainerObj(dest, task) do { \
    (dest) = (struct ObjectEvent *)(((task)->tTrainerObjHi << 16) | ((u16)(task)->tTrainerObjLo)); \
} while (0)

void TrainerApproachPlayer(struct ObjectEvent * trainerObj, u8 approachDistance)
{
    u8 taskId = CreateTask(Task_RunTrainerSeeFuncList, 80);
    struct Task * task = &gTasks[taskId];
    task->tTrainerObjHi = ((uintptr_t)trainerObj) >> 16;
    task->tTrainerObjLo = (uintptr_t)trainerObj;
    task->tTrainerRange = approachDistance;
}

void sub_8081E9C(TaskFunc taskFunc)
{
    u8 taskId = FindTaskIdByFunc(Task_RunTrainerSeeFuncList);
    SetTaskFuncWithFollowupFunc(taskId, Task_RunTrainerSeeFuncList, taskFunc);
    gTasks[taskId].tFuncId = 1;
    Task_RunTrainerSeeFuncList(taskId);
}

void Task_RunTrainerSeeFuncList(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    struct ObjectEvent * trainerObj;
    TaskGetTrainerObj(trainerObj, task);

    if (!trainerObj->active)
    {
        SwitchTaskToFollowupFunc(taskId);
    }
    else
    {
        while (sTrainerSeeFuncList[task->tFuncId](taskId, task, trainerObj))
            ;
    }
}

// TrainerSeeFuncs

bool8 sub_8081F34(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    return FALSE;
}

bool8 sub_8081F38(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    u8 action;
    // FRLG introduces trainers who can see the player from offscreen above.
    // Handle this case here.
    if (trainerObj->facingDirection == DIR_SOUTH && task->tTrainerRange > 2)
    {
        task->tFuncId = 12;
    }
    else
    {
        ObjectEventGetLocalIdAndMap(trainerObj, (u8 *)&gFieldEffectArguments[0], (u8 *)&gFieldEffectArguments[1], (u8 *)&gFieldEffectArguments[2]);
        FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON_1);
        action = GetFaceDirectionMovementAction(trainerObj->facingDirection);
        ObjectEventSetHeldMovement(trainerObj, action);
        task->tFuncId++;
    }
    return TRUE;
}

bool8 sub_8081F90(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    if (FieldEffectActiveListContains(FLDEFF_EXCLAMATION_MARK_ICON_1))
    {
        return FALSE;
    }
    else
    {
        task->tFuncId++;
        if (trainerObj->animPattern == MOVEMENT_TYPE_TREE_DISGUISE || trainerObj->animPattern == MOVEMENT_TYPE_MOUNTAIN_DISGUISE)
            task->tFuncId = 6;
        if (trainerObj->animPattern == MOVEMENT_TYPE_HIDDEN)
            task->tFuncId = 8;
        return TRUE;
    }
}

bool8 sub_8081FD0(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    if (!ObjectEventIsMovementOverridden(trainerObj) || ObjectEventClearHeldMovementIfFinished(trainerObj))
    {
        if (task->tTrainerRange)
        {
            ObjectEventSetHeldMovement(trainerObj, GetWalkNormalMovementAction(trainerObj->facingDirection));
            task->tTrainerRange--;
        }
        else
        {
            ObjectEventSetHeldMovement(trainerObj, MOVEMENT_ACTION_FACE_PLAYER);
            task->tFuncId++;
        }
    }
    return FALSE;
}

bool8 sub_808202C(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    struct ObjectEvent *playerObj;

    if (ObjectEventIsMovementOverridden(trainerObj) && !ObjectEventClearHeldMovementIfFinished(trainerObj))
        return FALSE;

    SetTrainerMovementType(trainerObj, GetTrainerFacingDirectionMovementType(trainerObj->facingDirection));
    TryOverrideTemplateCoordsForObjectEvent(trainerObj, GetTrainerFacingDirectionMovementType(trainerObj->facingDirection));
    OverrideTemplateCoordsForObjectEvent(trainerObj);

    playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventIsMovementOverridden(playerObj) && !ObjectEventClearHeldMovementIfFinished(playerObj))
        return FALSE;

    sub_805C774();
    // Uncomment to have player turn to face their opponent
    // ObjectEventSetHeldMovement(&gObjectEvents[gPlayerAvatar.objectEventId], GetFaceDirectionMovementAction(GetOppositeDirection(trainerObj->facingDirection)));
    task->tFuncId++;
    return FALSE;
}

bool8 sub_80820BC(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    struct ObjectEvent *playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];

    if (!ObjectEventIsMovementOverridden(playerObj)
        || ObjectEventClearHeldMovementIfFinished(playerObj))
        SwitchTaskToFollowupFunc(taskId); // This ends the trainer walk routine.
    return FALSE;
}

// Jumps here if disguised. Not used in FRLG.
bool8 sub_8082100(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    if (!ObjectEventIsMovementOverridden(trainerObj)
     || ObjectEventClearHeldMovementIfFinished(trainerObj))
    {
        ObjectEventSetHeldMovement(trainerObj, MOVEMENT_ACTION_REVEAL_TRAINER);
        task->tFuncId++;
    }
    return FALSE;
}

bool8 sub_8082134(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    if (ObjectEventClearHeldMovementIfFinished(trainerObj))
        task->tFuncId = 3;

    return FALSE;
}

// Jump here if hidden in ash. Not used in FRLG.
bool8 sub_8082150(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    if (!ObjectEventIsMovementOverridden(trainerObj)
        || ObjectEventClearHeldMovementIfFinished(trainerObj))
    {
        ObjectEventSetHeldMovement(trainerObj, MOVEMENT_ACTION_FACE_PLAYER);
        task->tFuncId++;
    }
    return FALSE;
}

bool8 sub_8082184(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    if (ObjectEventCheckHeldMovementStatus(trainerObj))
    {
        gFieldEffectArguments[0] = trainerObj->currentCoords.x;
        gFieldEffectArguments[1] = trainerObj->currentCoords.y;
        gFieldEffectArguments[2] = gSprites[trainerObj->spriteId].subpriority - 1;
        gFieldEffectArguments[3] = 2;
        task->tOutOfAshSpriteId = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
        task->tFuncId++;
    }
    return FALSE;
}

bool8 sub_80821DC(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    struct Sprite *sprite;

    if (gSprites[task->tOutOfAshSpriteId].animCmdIndex == 2)
    {
        trainerObj->fixedPriority = 0;
        trainerObj->triggerGroundEffectsOnMove = 1;

        sprite = &gSprites[trainerObj->spriteId];
        sprite->oam.priority = 2;
        ObjectEventClearHeldMovementIfFinished(trainerObj);
        ObjectEventSetHeldMovement(trainerObj, GetJumpInPlaceMovementAction(trainerObj->facingDirection));
        task->tFuncId++;
    }

    return FALSE;
}

bool8 sub_8082250(u8 taskId, struct Task *task, struct ObjectEvent *trainerObj)
{
    if (!FieldEffectActiveListContains(FLDEFF_POP_OUT_OF_ASH))
        task->tFuncId = 3;

    return FALSE;
}

// FRLG exclusive: Scroll the camera up to reveal an offscreen above trainer
bool8 sub_808226C(u8 taskId, struct Task *task, struct ObjectEvent *trainerObj)
{
    int specialObjectId;
    task->tData5 = 0;
    specialObjectId = SpawnSpecialObjectEventParameterized(OBJECT_EVENT_GFX_YOUNGSTER, 7, OBJ_EVENT_ID_CAMERA, gSaveBlock1Ptr->pos.x + 7, gSaveBlock1Ptr->pos.y + 7, 3);
    gObjectEvents[specialObjectId].invisible = TRUE;
    CameraObjectSetFollowedObjectId(gObjectEvents[specialObjectId].spriteId);
    task->tFuncId++;
    return FALSE;
}

bool8 sub_80822CC(u8 taskId, struct Task *task, struct ObjectEvent *trainerObj)
{
    u8 specialObjectId;
    TryGetObjectEventIdByLocalIdAndMap(OBJ_EVENT_ID_CAMERA, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &specialObjectId);

    if (ObjectEventIsMovementOverridden(&gObjectEvents[specialObjectId]) && !ObjectEventClearHeldMovementIfFinished(&gObjectEvents[specialObjectId]))
        return FALSE;

    if (task->tData5 != task->tTrainerRange - 1)
    {
        ObjectEventSetHeldMovement(&gObjectEvents[specialObjectId], sub_8063FB0(DIR_NORTH));
        task->tData5++;
    }
    else
    {
        ObjectEventGetLocalIdAndMap(trainerObj, (u8 *)&gFieldEffectArguments[0], (u8 *)&gFieldEffectArguments[1], (u8 *)&gFieldEffectArguments[2]);
        FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON_1);
        task->tData5 = 0;
        task->tFuncId++;
    }
    return FALSE;
}

bool8 sub_808237C(u8 taskId, struct Task * task, struct ObjectEvent * trainerObj)
{
    u8 specialObjectId;
    TryGetObjectEventIdByLocalIdAndMap(OBJ_EVENT_ID_CAMERA, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &specialObjectId);

    if (FieldEffectActiveListContains(FLDEFF_EXCLAMATION_MARK_ICON_1))
        return FALSE;

    if (ObjectEventIsMovementOverridden(&gObjectEvents[specialObjectId]) && !ObjectEventClearHeldMovementIfFinished(&gObjectEvents[specialObjectId]))
        return FALSE;

    if (task->tData5 != task->tTrainerRange - 1)
    {
        ObjectEventSetHeldMovement(&gObjectEvents[specialObjectId], sub_8063FB0(DIR_SOUTH));
        task->tData5++;
    }
    else
    {
        CameraObjectSetFollowedObjectId(GetPlayerAvatarObjectId());
        RemoveObjectEventByLocalIdAndMap(OBJ_EVENT_ID_CAMERA, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
        task->tData5 = 0;
        task->tFuncId = 2;
    }
    return FALSE;
}
