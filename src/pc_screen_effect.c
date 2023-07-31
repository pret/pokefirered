#include "global.h"
#include "gflib.h"
#include "task.h"

/*
 * Animates the screen as though it was a CRT monitor turning on or off.
 */

#define tState data[0]
#define tXSpeed data[1]
#define tYSpeed data[2]
#define twirelessWinLeft data[3]
#define twirelessWinRight data[4]
#define twirelessWinTop data[5]
#define twirelessWinBottom data[6]
#define tBldCntBak data[7]
#define tBldYBak data[8]

static void BeginPCScreenEffect(TaskFunc func, u16 a2, u16 a3, u8 priority);
static void Task_PCScreenEffect_TurnOn(u8 taskId);
static void Task_PCScreenEffect_TurnOff(u8 taskId);

void BeginPCScreenEffect_TurnOn(u16 xspeed, u16 yspeed, u8 priority)
{
    BeginPCScreenEffect(Task_PCScreenEffect_TurnOn, xspeed, yspeed, priority);
}

void BeginPCScreenEffect_TurnOff(u16 xspeed, u16 yspeed, u8 priority)
{
    BeginPCScreenEffect(Task_PCScreenEffect_TurnOff, xspeed, yspeed, priority);
}

bool8 IsPCScreenEffectRunning_TurnOn(void)
{
    return FuncIsActiveTask(Task_PCScreenEffect_TurnOn);
}

bool8 IsPCScreenEffectRunning_TurnOff(void)
{
    return FuncIsActiveTask(Task_PCScreenEffect_TurnOff);
}

static void BeginPCScreenEffect(TaskFunc func, u16 speed, u16 unused, u8 priority)
{
    u8 taskId = CreateTask(func, priority);

    gTasks[taskId].tState = 0;
    gTasks[taskId].tXSpeed = speed == 0 ? 16 : speed;
    gTasks[taskId].tYSpeed = speed == 0 ? 20 : speed; // Bug? should be the unused param, not speed
    gTasks[taskId].func(taskId);
}

static void Task_PCScreenEffect_TurnOn(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        task->twirelessWinLeft = 120;
        task->twirelessWinRight = 120;
        task->twirelessWinTop = 80;
        task->twirelessWinBottom = 81;
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(task->twirelessWinLeft, task->twirelessWinRight));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(task->twirelessWinTop, task->twirelessWinBottom));
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        break;
    case 1:
        task->tBldCntBak = GetGpuReg(REG_OFFSET_BLDCNT);
        task->tBldYBak = GetGpuReg(REG_OFFSET_BLDY);
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_LIGHTEN);
        SetGpuReg(REG_OFFSET_BLDY, 16);
        break;
    case 2:
        task->twirelessWinLeft -= task->tXSpeed;
        task->twirelessWinRight += task->tXSpeed;
        if (task->twirelessWinLeft <= 0 || task->twirelessWinRight >= DISPLAY_WIDTH)
        {
            task->twirelessWinLeft = 0;
            task->twirelessWinRight = DISPLAY_WIDTH;
            SetGpuReg(REG_OFFSET_BLDY, 0);
            SetGpuReg(REG_OFFSET_BLDCNT, task->tBldCntBak);
            BlendPalettes(PALETTES_ALL, 0, RGB_BLACK);
            gPlttBufferFaded[BG_PLTT_ID(0)] = 0;
        }
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(task->twirelessWinLeft, task->twirelessWinRight));
        if (task->twirelessWinLeft)
            return;
        break;
    case 3:
        task->twirelessWinTop -= task->tYSpeed;
        task->twirelessWinBottom += task->tYSpeed;
        if (task->twirelessWinTop <= 0 || task->twirelessWinBottom >= DISPLAY_HEIGHT)
        {
            task->twirelessWinTop = 0;
            task->twirelessWinBottom = DISPLAY_HEIGHT;
            ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        }
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(task->twirelessWinTop, task->twirelessWinBottom));
        if (task->twirelessWinTop)
            return;
        break;
    default:
        SetGpuReg(REG_OFFSET_BLDCNT, task->tBldCntBak);
        DestroyTask(taskId);
        return;
    }
    ++task->tState;
}

static void Task_PCScreenEffect_TurnOff(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        gPlttBufferFaded[BG_PLTT_ID(0)] = 0;
        break;
    case 1:
        task->twirelessWinLeft = 0;
        task->twirelessWinRight = DISPLAY_WIDTH;
        task->twirelessWinTop = 0;
        task->twirelessWinBottom = DISPLAY_HEIGHT;
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(task->twirelessWinLeft, task->twirelessWinRight));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(task->twirelessWinTop, task->twirelessWinBottom));
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        break;
    case 2:
        task->twirelessWinTop += task->tYSpeed;
        task->twirelessWinBottom -= task->tYSpeed;
        if (task->twirelessWinTop >= 80 || task->twirelessWinBottom <= 81)
        {
            task->twirelessWinTop = 80;
            task->twirelessWinBottom = 81;
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_LIGHTEN);
            SetGpuReg(REG_OFFSET_BLDY, 16);
        }
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(task->twirelessWinTop, task->twirelessWinBottom));
        if (task->twirelessWinTop != 80)
            return;
        break;
    case 3:
        task->twirelessWinLeft += task->tXSpeed;
        task->twirelessWinRight -= task->tXSpeed;
        if (task->twirelessWinLeft >= 120 || task->twirelessWinRight <= 120)
        {
            task->twirelessWinLeft = 120;
            task->twirelessWinRight = 120;
            BlendPalettes(PALETTES_ALL, 0x10, RGB_BLACK);
            gPlttBufferFaded[BG_PLTT_ID(0)] = 0;
        }
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(task->twirelessWinLeft, task->twirelessWinRight));
        if (task->twirelessWinLeft != 120)
            return;
        break;
    default:
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        DestroyTask(taskId);
        return;
    }
    ++task->tState;
}

#undef tBldYBak
#undef tBldCntBak
#undef twirelessWinBottom
#undef twirelessWinTop
#undef twirelessWinRight
#undef twirelessWinLeft
#undef tYSpeed
#undef tXSpeed
#undef tState
