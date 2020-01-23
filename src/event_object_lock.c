#include "global.h"
#include "task.h"
#include "field_player_avatar.h"
#include "event_object_movement.h"
#include "script_movement.h"
#include "event_object_80688E4.h"
#include "event_data.h"
#include "event_object_lock.h"

bool8 walkrun_is_standing_still(void)
{
    if (gPlayerAvatar.tileTransitionState == 1)
        return FALSE;
    else
        return TRUE;
}

void sub_8069570(u8 taskId)
{
    if (walkrun_is_standing_still())
    {
        sub_805C270();
        DestroyTask(taskId);
    }
}

bool8 sub_8069590(void)
{
    if (FuncIsActiveTask(sub_8069570))
        return FALSE;
    else
    {
        sub_805C780();
        return TRUE;
    }
}

void ScriptFreezeObjectEvents(void)
{
    FreezeObjectEvents();
    CreateTask(sub_8069570, 80);
}

void sub_80695CC(u8 taskId)
{
    struct Task * task = &gTasks[taskId];

    if (task->data[0] == 0 && walkrun_is_standing_still() == TRUE)
    {
        sub_805C270();
        task->data[0] = 1;
    }

    if (task->data[1] == 0 && !gObjectEvents[gSelectedObjectEvent].mapobj_bit_1)
    {
        FreezeObjectEvent(&gObjectEvents[gSelectedObjectEvent]);
        task->data[1] = 1;
    }

    if (task->data[0] && task->data[1])
        DestroyTask(taskId);
}

bool8 sub_8069648(void)
{
    if (FuncIsActiveTask(sub_80695CC))
        return FALSE;
    else
    {
        sub_805C780();
        return TRUE;
    }
}

void LockSelectedObjectEvent(void)
{
    u8 taskId;

    FreezeObjectEventsExceptOne(gSelectedObjectEvent);
    taskId = CreateTask(sub_80695CC, 80);
    if (!gObjectEvents[gSelectedObjectEvent].mapobj_bit_1)
    {
        FreezeObjectEvent(&gObjectEvents[gSelectedObjectEvent]);
        gTasks[taskId].data[1] = 1;
    }
}

void sub_80696C0(void)
{
    u8 objectEventId = GetObjectEventIdByLocalIdAndMap(0xFF, 0, 0);
    ObjectEventClearHeldMovementIfFinished(&gObjectEvents[objectEventId]);
    sub_80974D8();
    UnfreezeObjectEvents();
}

void sub_80696F0(void)
{
    u8 objectEventId;
    if (gObjectEvents[gSelectedObjectEvent].active)
        ObjectEventClearHeldMovementIfFinished(&gObjectEvents[gSelectedObjectEvent]);
    objectEventId = GetObjectEventIdByLocalIdAndMap(0xFF, 0, 0);
    ObjectEventClearHeldMovementIfFinished(&gObjectEvents[objectEventId]);
    sub_80974D8();
    UnfreezeObjectEvents();
}

void Script_FacePlayer(void)
{
    ObjectEventFaceOppositeDirection(&gObjectEvents[gSelectedObjectEvent], gSpecialVar_Facing);
}

void Script_ClearHeldMovement(void)
{
    ObjectEventClearAnimIfSpecialAnimActive(&gObjectEvents[gSelectedObjectEvent]);
}
