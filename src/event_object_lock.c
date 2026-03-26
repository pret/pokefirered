#include "global.h"
#include "task.h"
#include "field_player_avatar.h"
#include "event_object_movement.h"
#include "script_movement.h"
#include "event_data.h"
#include "constants/event_objects.h"

bool8 walkrun_is_standing_still(void)
{
    if (gPlayerAvatar.tileTransitionState == 1)
        return FALSE;
    else
        return TRUE;
}

void Task_WaitPlayerStopMoving(u8 taskId)
{
    if (walkrun_is_standing_still())
    {
        HandleEnforcedLookDirectionOnPlayerStopMoving();
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

    if (task->data[0] == 0 && walkrun_is_standing_still() == TRUE)
    {
        HandleEnforcedLookDirectionOnPlayerStopMoving();
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
    u8 objectEventId = GetObjectEventIdByLocalIdAndMap(OBJ_EVENT_ID_PLAYER, 0, 0);
    ObjectEventClearHeldMovementIfFinished(&gObjectEvents[objectEventId]);
    ScriptMovement_UnfreezeObjectEvents();
    UnfreezeObjectEvents();
}

void UnionRoom_UnlockPlayerAndChatPartner(void)
{
    u8 objectEventId;
    if (gObjectEvents[gSelectedObjectEvent].active)
        ObjectEventClearHeldMovementIfFinished(&gObjectEvents[gSelectedObjectEvent]);
    objectEventId = GetObjectEventIdByLocalIdAndMap(OBJ_EVENT_ID_PLAYER, 0, 0);
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
