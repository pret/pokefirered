#include "global.h"
#include "task.h"
#include "field_player_avatar.h"
#include "field_map_obj.h"
#include "field_map_obj_helpers.h"
#include "script_movement.h"
#include "map_obj_80688E4.h"
#include "event_data.h"
#include "map_obj_lock.h"

bool8 walkrun_is_standing_still(void)
{
    if (gPlayerAvatar.running1 == 1)
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

void ScriptFreezeMapObjects(void)
{
    player_bitmagic();
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

    if (task->data[1] == 0 && !gMapObjects[gSelectedEventObject].mapobj_bit_1)
    {
        FreezeMapObject(&gMapObjects[gSelectedEventObject]);
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

void LockSelectedMapObject(void)
{
    u8 taskId;

    FreezeMapObjectsExceptOne(gSelectedEventObject);
    taskId = CreateTask(sub_80695CC, 80);
    if (!gMapObjects[gSelectedEventObject].mapobj_bit_1)
    {
        FreezeMapObject(&gMapObjects[gSelectedEventObject]);
        gTasks[taskId].data[1] = 1;
    }
}

void sub_80696C0(void)
{
    u8 fieldObjectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearHeldMovementIfFinished(&gMapObjects[fieldObjectId]);
    sub_80974D8();
    UnfreezeMapObjects();
}

void sub_80696F0(void)
{
    u8 fieldObjectId;
    if (gMapObjects[gSelectedEventObject].active)
        FieldObjectClearHeldMovementIfFinished(&gMapObjects[gSelectedEventObject]);
    fieldObjectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearHeldMovementIfFinished(&gMapObjects[fieldObjectId]);
    sub_80974D8();
    UnfreezeMapObjects();
}

void sub_8069740(void)
{
    FieldObjectFaceOppositeDirection(&gMapObjects[gSelectedEventObject], gSpecialVar_Facing);
}

void sub_8069768(void)
{
    FieldObjectClearAnimIfSpecialAnimActive(&gMapObjects[gSelectedEventObject]);
}
