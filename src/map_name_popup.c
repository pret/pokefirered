#include "global.h"
#include "bg.h"
#include "gpu_regs.h"
#include "window.h"
#include "palette.h"
#include "task.h"
#include "event_data.h"
#include "text_window.h"
#include "quest_log.h"
#include "region_map.h"
#include "text.h"
#include "strings.h"
#include "string_util.h"
#include "constants/flags.h"

static void Task_MapNamePopup(u8 taskId);
static u16 MapNamePopupCreateWindow(bool32 palIntoFadedBuffer);
static void MapNamePopupPrintMapNameOnWindow(u16 windowId);
static u8 *MapNamePopupAppendFloorNum(u8 *dest, s8 flags);

void CreateMapNamePopupIfNotAlreadyRunning(bool32 palIntoFadedBuffer)
{
    u8 taskId;
    if (FlagGet(FLAG_SPECIAL_FLAG_0x4000) != TRUE && !(gQuestLogState == 2 || gQuestLogState == 3))
    {
        taskId = FindTaskIdByFunc(Task_MapNamePopup);
        if (taskId == 0xFF)
        {
            taskId = CreateTask(Task_MapNamePopup, 90);
            ChangeBgX(0, 0x00000000, 0);
            ChangeBgY(0, 0xFFFFEF7F, 0);
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[8] = palIntoFadedBuffer;
        }
        else
        {
            if (gTasks[taskId].data[0] != 4)
                gTasks[taskId].data[0] = 4;
            gTasks[taskId].data[3] = 1;
        }
    }
}

static void Task_MapNamePopup(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[4] = MapNamePopupCreateWindow(task->data[8]);
        task->data[5] = 1;
        task->data[0] = 1;
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            break;
        // fallthrough
    case 2:
        task->data[2] -= 2;
        if (task->data[2] <= -24)
        {
            task->data[0] = 3;
            task->data[1] = 0;
        }
        break;
    case 3:
        task->data[1]++;
        if (task->data[1] > 120)
        {
            task->data[1] = 0;
            task->data[0] = 4;
        }
        break;
    case 4:
        task->data[2] += 2;
        if (task->data[2] >= 0)
        {
            if (task->data[3])
            {
                MapNamePopupPrintMapNameOnWindow(task->data[4]);
                CopyWindowToVram(task->data[4], 2);
                task->data[0] = 1;
                task->data[3] = 0;
            }
            else
            {
                task->data[0] = 6;
                return;
            }
        }
    case 5:
        break;
    case 6:
        if (task->data[5] && !task->data[6])
        {
            rbox_fill_rectangle(task->data[4]);
            CopyWindowToVram(task->data[4], 1);
            task->data[6] = 1;
        }
        task->data[0] = 7;
        return;
    case 7:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            if (task->data[5])
            {
                RemoveWindow(task->data[4]);
                task->data[5] = 0;
                task->data[7] = 1;
            }
            task->data[0] = 8;
            ChangeBgY(0, 0x00000000, 0);
        }
        return;
    case 8:
        DestroyTask(taskId);
        return;
    }
    SetGpuReg(REG_OFFSET_BG0VOFS, task->data[2]);
}

void DismissMapNamePopup(void)
{
    u8 taskId;
    s16 *data;
    taskId = FindTaskIdByFunc(Task_MapNamePopup);
    if (taskId != 0xFF)
    {
        data = gTasks[taskId].data;
        if (data[0] < 6)
            data[0] = 6;
    }
}

bool32 IsMapNamePopupTaskActive(void)
{
    return FindTaskIdByFunc(Task_MapNamePopup) != 0xFF ? TRUE : FALSE;
}

static u16 MapNamePopupCreateWindow(bool32 palintoFadedBuffer)
{
    struct WindowTemplate windowTemplate = {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 29,
        .width = 14,
        .height = 2,
        .paletteNum = 0xD,
        .baseBlock = 0x001
    };
    u16 windowId;
    u16 r6 = 0x01D;
    if (gMapHeader.flags != 0)
    {
        if (gMapHeader.flags != 0x7F)
        {
            windowTemplate.width += 5;
            r6 = 0x027;
        }
        else
        {
            windowTemplate.width += 8;
            r6 = 0x02D;
        }
    }
    windowId = AddWindow(&windowTemplate);
    if (palintoFadedBuffer)
    {
        LoadPalette(stdpal_get(3), 0xd0, 0x20);
    }
    else
    {
        CpuCopy16(stdpal_get(3), &gPlttBufferUnfaded[0xd0], 0x20);
    }
    sub_814FF6C(windowId, r6);
    DrawTextBorderOuter(windowId, r6, 0xD);
    PutWindowTilemap(windowId);
    MapNamePopupPrintMapNameOnWindow(windowId);
    CopyWindowToVram(windowId, 3);
    return windowId;
}

static void MapNamePopupPrintMapNameOnWindow(u16 windowId)
{
    u8 mapName[25];
    u32 maxWidth = 112;
    u32 xpos;
    u8 *ptr = GetMapName(mapName, gMapHeader.regionMapSectionId, 0);
    if (gMapHeader.flags != 0)
    {
        ptr = MapNamePopupAppendFloorNum(ptr, gMapHeader.flags);
        maxWidth = gMapHeader.flags != 0x7F ? 152 : 176;
    }
    xpos = (maxWidth - GetStringWidth(2, mapName, -1)) / 2;
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    AddTextPrinterParameterized(windowId, 2, mapName, xpos, 2, 0xFF, NULL);
}

static u8 *MapNamePopupAppendFloorNum(u8 *dest, s8 flags)
{
    if (flags == 0)
        return dest;
    *dest++ = CHAR_SPACE;
    if (flags == 0x7F)
        return StringCopy(dest, gUnknown_841D18D);
    if (flags < 0)
    {
        *dest++ = CHAR_B;
        flags *= -1;
    }
    dest = ConvertIntToDecimalStringN(dest, flags, STR_CONV_MODE_LEFT_ALIGN, 2);
    *dest++ = CHAR_F;
    *dest = EOS;
    return dest;
}
