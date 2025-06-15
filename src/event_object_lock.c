#include "global.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "script_movement.h"
#include "task.h"
#include "trainer_see.h"
#include "constants/event_objects.h"

bool8 IsPlayerStandingStill(void)
{
    if (gPlayerAvatar.tileTransitionState == T_TILE_TRANSITION)
        return FALSE;
    else
        return TRUE;
}

void Task_WaitPlayerStopMoving(u8 taskId)
{
    if (IsPlayerStandingStill())
    {
        PlayerFreeze();
        DestroyTask(taskId);
    }
}

bool8 IsFreezePlayerFinished(void)
{
    if (FuncIsActiveTask(Task_WaitPlayerStopMoving))
        return FALSE;
    else
    {
        StopPlayerAvatar();
        return TRUE;
    }
}

void FreezeObjects_WaitForPlayer(void)
{
    FreezeObjectEvents();
    CreateTask(Task_WaitPlayerStopMoving, 80);
}

void Task_WaitPlayerAndTargetNPCStopMoving(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (task->data[0] == 0 && IsPlayerStandingStill() == TRUE)
    {
        PlayerFreeze();
        task->data[0] = 1;
    }

    if (task->data[1] == 0 && !gObjectEvents[gSelectedObjectEvent].singleMovementActive)
    {
        FreezeObjectEvent(&gObjectEvents[gSelectedObjectEvent]);
        task->data[1] = 1;
    }

    if (task->data[0] && task->data[1])
        DestroyTask(taskId);
}

bool8 IsFreezeSelectedObjectAndPlayerFinished(void)
{
    if (FuncIsActiveTask(Task_WaitPlayerAndTargetNPCStopMoving))
        return FALSE;
    else
    {
        StopPlayerAvatar();
        return TRUE;
    }
}

void FreezeObjects_WaitForPlayerAndSelected(void)
{
    u8 taskId;

    FreezeObjectEventsExceptOne(gSelectedObjectEvent);
    taskId = CreateTask(Task_WaitPlayerAndTargetNPCStopMoving, 80);
    if (!gObjectEvents[gSelectedObjectEvent].singleMovementActive)
    {
        FreezeObjectEvent(&gObjectEvents[gSelectedObjectEvent]);
        gTasks[taskId].data[1] = 1;
    }
}

void ClearPlayerHeldMovementAndUnfreezeObjectEvents(void)
{
    u8 objectEventId = GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0);
    ObjectEventClearHeldMovementIfFinished(&gObjectEvents[objectEventId]);
    ScriptMovement_UnfreezeObjectEvents();
    UnfreezeObjectEvents();
}

void UnionRoom_UnlockPlayerAndChatPartner(void)
{
    u8 objectEventId;
    if (gObjectEvents[gSelectedObjectEvent].active)
        ObjectEventClearHeldMovementIfFinished(&gObjectEvents[gSelectedObjectEvent]);
    objectEventId = GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0);
    ObjectEventClearHeldMovementIfFinished(&gObjectEvents[objectEventId]);
    ScriptMovement_UnfreezeObjectEvents();
    UnfreezeObjectEvents();
}

void Script_FacePlayer(void)
{
    ObjectEventFaceOppositeDirection(&gObjectEvents[gSelectedObjectEvent], gSpecialVar_Facing);
}

void Script_ClearHeldMovement(void)
{
    ObjectEventClearHeldMovementIfActive(&gObjectEvents[gSelectedObjectEvent]);
}

#define tPlayerFrozen data[0]
#define tObjectFrozen data[1]
#define tObjectId     data[2]

// Freeze designated object and player once their movement is finished
static void Task_FreezeObjectAndPlayer(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 objectEventId = task->tObjectId;

    if (!task->tPlayerFrozen && IsPlayerStandingStill() == TRUE)
    {
        PlayerFreeze();
        task->tPlayerFrozen = TRUE;
    }
    if (!task->tObjectFrozen && !gObjectEvents[objectEventId].singleMovementActive)
    {
        FreezeObjectEvent(&gObjectEvents[objectEventId]);
        task->tObjectFrozen = TRUE;
    }
    if (task->tPlayerFrozen && task->tObjectFrozen)
        DestroyTask(taskId);
}

// Freeze all objects immediately except the player and the approaching trainers.
// The approaching trainers and player are frozen once their movement is finished
void FreezeForApproachingTrainers(void)
{
    u8 trainerObjectId1, trainerObjectId2, taskId;
    struct ObjectEvent *followerObj = GetFollowerObject();
    trainerObjectId1 = GetChosenApproachingTrainerObjectEventId(0);

    if (gNoOfApproachingTrainers == 2)
    {
        // Get second trainer, freeze all other objects
        trainerObjectId2 = GetChosenApproachingTrainerObjectEventId(1);
        FreezeObjectEventsExceptTwo(trainerObjectId1, trainerObjectId2);

        // Start task to freeze trainer 1 (and player) after movement
        taskId = CreateTask(Task_FreezeObjectAndPlayer, 80);
        gTasks[taskId].tObjectId = trainerObjectId1;
        if (!gObjectEvents[trainerObjectId1].singleMovementActive)
        {
            FreezeObjectEvent(&gObjectEvents[trainerObjectId1]);
            gTasks[taskId].tObjectFrozen = TRUE;
        }

        // Start task to freeze trainer 2 after movement
        taskId = CreateTask(Task_FreezeObjectAndPlayer, 81);
        gTasks[taskId].tObjectId = trainerObjectId2;
        if (!gObjectEvents[trainerObjectId2].singleMovementActive)
        {
            FreezeObjectEvent(&gObjectEvents[trainerObjectId2]);
            gTasks[taskId].tObjectFrozen = TRUE;
        }
    }
    else
    {
        FreezeObjectEventsExceptOne(trainerObjectId1);
        taskId = CreateTask(Task_FreezeObjectAndPlayer, 80);
        gTasks[taskId].tObjectId = trainerObjectId1;
        if (!gObjectEvents[trainerObjectId1].singleMovementActive)
        {
            FreezeObjectEvent(&gObjectEvents[trainerObjectId1]);
            gTasks[taskId].tObjectFrozen = TRUE;
        }
    }
    if (followerObj) // Unfreeze follower so it can move behind player
        UnfreezeObjectEvent(followerObj);
}

#undef tPlayerFrozen
#undef tObjectFrozen
#undef tObjectId
