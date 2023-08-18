#include "global.h"
#include "gflib.h"
#include "task.h"
#include "event_data.h"
#include "text_window.h"
#include "quest_log.h"
#include "region_map.h"
#include "strings.h"

#define FLOOR_ROOFTOP 127

static void Task_MapNamePopup(u8 taskId);
static u16 MapNamePopupCreateWindow(bool32 palIntoFadedBuffer);
static void MapNamePopupPrintMapNameOnWindow(u16 windowId);
static u8 *MapNamePopupAppendFloorNum(u8 *dest, s8 flags);

#define tState              data[0]
#define tTimer              data[1]
#define tPos                data[2]
#define tReshow             data[3]
#define tWindowId           data[4]
#define tWindowExists       data[5]
#define tWindowCleared      data[6]
#define tWindowDestroyed    data[7]
#define tPalIntoFadedBuffer data[8]

void ShowMapNamePopup(bool32 palIntoFadedBuffer)
{
    u8 taskId;
    if (FlagGet(FLAG_DONT_SHOW_MAP_NAME_POPUP) != TRUE && !QL_IS_PLAYBACK_STATE)
    {
        taskId = FindTaskIdByFunc(Task_MapNamePopup);
        if (taskId == TASK_NONE)
        {
            taskId = CreateTask(Task_MapNamePopup, 90);
            ChangeBgX(0,  0x0000, 0);
            ChangeBgY(0, -0x1081, 0);
            gTasks[taskId].tState = 0;
            gTasks[taskId].tPos = 0;
            gTasks[taskId].tPalIntoFadedBuffer = palIntoFadedBuffer;
        }
        else
        {
            if (gTasks[taskId].tState != 4)
                gTasks[taskId].tState = 4;
            gTasks[taskId].tReshow = TRUE;
        }
    }
}

static void Task_MapNamePopup(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->tState)
    {
    case 0:
        task->tWindowId = MapNamePopupCreateWindow(task->tPalIntoFadedBuffer);
        task->tWindowExists = TRUE;
        task->tState = 1;
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            break;
        // fallthrough
    case 2:
        task->tPos -= 2;
        if (task->tPos <= -24)
        {
            task->tState = 3;
            task->tTimer = 0;
        }
        break;
    case 3:
        task->tTimer++;
        if (task->tTimer > 120)
        {
            task->tTimer = 0;
            task->tState = 4;
        }
        break;
    case 4:
        task->tPos += 2;
        if (task->tPos >= 0)
        {
            if (task->tReshow)
            {
                MapNamePopupPrintMapNameOnWindow(task->tWindowId);
                CopyWindowToVram(task->tWindowId, COPYWIN_GFX);
                task->tState = 1;
                task->tReshow = FALSE;
            }
            else
            {
                task->tState = 6;
                return;
            }
        }
    case 5:
        break;
    case 6:
        if (task->tWindowExists && !task->tWindowCleared)
        {
            rbox_fill_rectangle(task->tWindowId);
            CopyWindowToVram(task->tWindowId, COPYWIN_MAP);
            task->tWindowCleared = TRUE;
        }
        task->tState = 7;
        return;
    case 7:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            if (task->tWindowExists)
            {
                RemoveWindow(task->tWindowId);
                task->tWindowExists = FALSE;
                task->tWindowDestroyed = TRUE;
            }
            task->tState = 8;
            ChangeBgY(0, 0x00000000, 0);
        }
        return;
    case 8:
        DestroyTask(taskId);
        return;
    }
    SetGpuReg(REG_OFFSET_BG0VOFS, task->tPos);
}

void DismissMapNamePopup(void)
{
    u8 taskId;
    s16 *data;
    taskId = FindTaskIdByFunc(Task_MapNamePopup);
    if (taskId != TASK_NONE)
    {
        data = gTasks[taskId].data;
        if (tState < 6)
            tState = 6;
    }
}

bool32 IsMapNamePopupTaskActive(void)
{
    return FindTaskIdByFunc(Task_MapNamePopup) != TASK_NONE ? TRUE : FALSE;
}

#define WIN_PAL_NUM  13

static u16 MapNamePopupCreateWindow(bool32 palintoFadedBuffer)
{
    struct WindowTemplate windowTemplate = {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 29,
        .width = 14,
        .height = 2,
        .paletteNum = WIN_PAL_NUM,
        .baseBlock = 0x001
    };
    u16 windowId;
    u16 tileNum = 0x01D;
    if (gMapHeader.floorNum != 0)
    {
        if (gMapHeader.floorNum != FLOOR_ROOFTOP)
        {
            windowTemplate.width += 5;
            tileNum = 0x027;
        }
        else
        {
            // ROOFTOP
            windowTemplate.width += 8;
            tileNum = 0x02D;
        }
    }
    windowId = AddWindow(&windowTemplate);
    if (palintoFadedBuffer)
        LoadPalette(GetTextWindowPalette(3), BG_PLTT_ID(WIN_PAL_NUM), PLTT_SIZE_4BPP);
    else
        CpuCopy16(GetTextWindowPalette(3), &gPlttBufferUnfaded[BG_PLTT_ID(WIN_PAL_NUM)], PLTT_SIZE_4BPP);
    LoadStdWindowTiles(windowId, tileNum);
    DrawTextBorderOuter(windowId, tileNum, WIN_PAL_NUM);
    PutWindowTilemap(windowId);
    MapNamePopupPrintMapNameOnWindow(windowId);
    CopyWindowToVram(windowId, COPYWIN_FULL);
    return windowId;
}

static void MapNamePopupPrintMapNameOnWindow(u16 windowId)
{
    u8 mapName[25];
    u32 maxWidth = 112;
    u32 xpos;
    u8 *ptr = GetMapName(mapName, gMapHeader.regionMapSectionId, 0);
    if (gMapHeader.floorNum != 0)
    {
        ptr = MapNamePopupAppendFloorNum(ptr, gMapHeader.floorNum);
        maxWidth = gMapHeader.floorNum != FLOOR_ROOFTOP ? 152 : 176;
    }
    xpos = (maxWidth - GetStringWidth(FONT_NORMAL, mapName, -1)) / 2;
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    AddTextPrinterParameterized(windowId, FONT_NORMAL, mapName, xpos, 2, TEXT_SKIP_DRAW, NULL);
}

static u8 *MapNamePopupAppendFloorNum(u8 *dest, s8 floorNum)
{
    if (floorNum == 0)
        return dest;
    *dest++ = CHAR_SPACE;
    if (floorNum == FLOOR_ROOFTOP)
        return StringCopy(dest, gText_Rooftop2);
    if (floorNum < 0)
    {
        *dest++ = CHAR_B;
        floorNum *= -1;
    }
    dest = ConvertIntToDecimalStringN(dest, floorNum, STR_CONV_MODE_LEFT_ALIGN, 2);
    *dest++ = CHAR_F;
    *dest = EOS;
    return dest;
}

#undef tPalIntoFadedBuffer
#undef tWindowDestroyed
#undef tWindowCleared
#undef tWindowExists
#undef tWindowId
#undef tReshow
#undef tPos
#undef tTimer
#undef tState
