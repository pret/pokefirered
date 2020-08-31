#include "global.h"
#include "gflib.h"
#include "task.h"
#include "constants/songs.h"

static void Task_FieldPoisonEffect(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        data[1] += 1;
        if (data[1] > 4)
            data[0]++;
        break;
    case 1:
        data[1] -= 1;
        if (data[1] == 0)
            data[0]++;
        break;
    case 2:
        DestroyTask(taskId);
        return;
    }
    AdjustBgMosaic((u8)(((u8)data[1] << 4) | (u8)data[1]), BG_MOSAIC_SET);
}

void FldEffPoison_Start(void)
{
    PlaySE(SE_FIELD_POISON);
    CreateTask(Task_FieldPoisonEffect, 80);
}

bool32 FldEffPoison_IsActive(void)
{
    return FuncIsActiveTask(Task_FieldPoisonEffect);
}
