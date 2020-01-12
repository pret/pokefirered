#include "global.h"
#include "task.h"
#include "gpu_regs.h"
#include "palette.h"

static void sub_80A0AC0(TaskFunc func, u16 a2, UNUSED u16 a3, u8 priority);
static void sub_80A0B0C(u8 taskId);
static void sub_80A0C78(u8 taskId);

void sub_80A0A48(u16 a1, u16 a2, u8 a3)
{
    sub_80A0AC0(sub_80A0B0C, a1, a2, a3);
}

void sub_80A0A70(u16 a1, u16 a2, u8 a3)
{
    sub_80A0AC0(sub_80A0C78, a1, a2, a3);
}

bool8 sub_80A0A98(void)
{
    return FuncIsActiveTask(sub_80A0B0C);
}

bool8 sub_80A0AAC(void)
{
    return FuncIsActiveTask(sub_80A0C78);
}

static void sub_80A0AC0(TaskFunc func, u16 a2, UNUSED u16 a3, u8 priority)
{
    u8 taskId = CreateTask(func, priority);

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = a2 == 0 ? 16 : a2;
    gTasks[taskId].data[2] = a2 == 0 ? 20 : a2;
    gTasks[taskId].func(taskId);
}

static void sub_80A0B0C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[3] = 120;
        task->data[4] = 120;
        task->data[5] = 80;
        task->data[6] = 81;
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(task->data[3], task->data[4]));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(task->data[5], task->data[6]));
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        break;
    case 1:
        task->data[7] = GetGpuReg(REG_OFFSET_BLDCNT);
        task->data[8] = GetGpuReg(REG_OFFSET_BLDY);
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_LIGHTEN);
        SetGpuReg(REG_OFFSET_BLDY, 16);
        break;
    case 2:
        task->data[3] -= task->data[1];
        task->data[4] += task->data[1];
        if (task->data[3] <= 0 || task->data[4] >= DISPLAY_WIDTH)
        {
            task->data[3] = 0;
            task->data[4] = DISPLAY_WIDTH;
            SetGpuReg(REG_OFFSET_BLDY, 0);
            SetGpuReg(REG_OFFSET_BLDCNT, task->data[7]);
            BlendPalettes(0xFFFFFFFF, 0, RGB_BLACK);
            gPlttBufferFaded[0] = 0;
        }
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(task->data[3], task->data[4]));
        if (task->data[3])
            return;
        break;
    case 3:
        task->data[5] -= task->data[2];
        task->data[6] += task->data[2];
        if (task->data[5] <= 0 || task->data[6] >= DISPLAY_HEIGHT)
        {
            task->data[5] = 0;
            task->data[6] = DISPLAY_HEIGHT;
            ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        }
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(task->data[5], task->data[6]));
        if (task->data[5])
            return;
        break;
    default:
        SetGpuReg(REG_OFFSET_BLDCNT, task->data[7]);
        DestroyTask(taskId);
        return;
    }
    ++task->data[0];
}

static void sub_80A0C78(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        gPlttBufferFaded[0] = 0;
        break;
    case 1:
        task->data[3] = 0;
        task->data[4] = DISPLAY_WIDTH;
        task->data[5] = 0;
        task->data[6] = DISPLAY_HEIGHT;
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(task->data[3], task->data[4]));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(task->data[5], task->data[6]));
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        break;
    case 2:
        task->data[5] += task->data[2];
        task->data[6] -= task->data[2];
        if (task->data[5] >= 80 || task->data[6] <= 81)
        {
            task->data[5] = 80;
            task->data[6] = 81;
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_LIGHTEN);
            SetGpuReg(REG_OFFSET_BLDY, 16);
        }
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(task->data[5], task->data[6]));
        if (task->data[5] != 80)
            return;
        break;
    case 3:
        task->data[3] += task->data[1];
        task->data[4] -= task->data[1];
        if (task->data[3] >= 120 || task->data[4] <= 120)
        {
            task->data[3] = 120;
            task->data[4] = 120;
            BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
            gPlttBufferFaded[0] = 0;
        }
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(task->data[3], task->data[4]));
        if (task->data[3] != 120)
            return;
        break;
    default:
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        DestroyTask(taskId);
        return;
    }
    ++task->data[0];
}
