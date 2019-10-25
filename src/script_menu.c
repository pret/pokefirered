#include "global.h"
#include "palette.h"
#include "text.h"
#include "list_menu.h"
#include "menu.h"
#include "task.h"
#include "sound.h"
#include "script_menu.h"
#include "quest_log.h"
#include "window.h"
#include "new_menu_helpers.h"
#include "event_data.h"
#include "script.h"
#include "constants/songs.h"

struct MultichoiceListStruct
{
    const struct MenuAction *list;
    u8 count;
};

EWRAM_DATA u8 gUnknown_2039988 = 0;

void sub_809CA64(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 initPos);
u8 sub_809CBB4(u8 count);
void sub_809CC18(u8 ignoreBpress, u8 count, u8 windowId, u8 mcId);
void sub_809CC98(u8 taskId);
void sub_809CD48(u8 mcId);
void task_yes_no_maybe(u8 taskId);
void sub_809D6B0(u8 windowId);
u8 CreateWindowFromRect(u8 left, u8 top, u8 width, u8 height);

extern const u8 *const gUnknown_83E072C[];
extern const u8 *const gUnknown_83E0738[];
extern const u8 *const gUnknown_83E0748[];
extern const struct MultichoiceListStruct gUnknown_83E04B0[];

u16 sub_809C954(const u8 *str)
{
    return (GetStringWidth(1, str, 0) + 7) / 8;
}

u8 sub_809C974(const struct ListMenuItem * items, u8 count)
{
    u16 i;
    u8 width = sub_809C954(items[0].label);
    u8 tmp;

    for (i = 1; i < count; i++)
    {
        tmp = sub_809C954(items[i].label);
        if (width < tmp)
            width = tmp;
    }
    return width;
}

bool8 ScriptMenu_Multichoice(u8 left, u8 top, u8 mcId, u8 ignoreBpress)
{
    if (FuncIsActiveTask(sub_809CC98) == TRUE)
        return FALSE;
    gSpecialVar_Result = 0xFF;
    sub_809CA64(left, top, mcId, ignoreBpress, 0);
    return TRUE;
}

bool8 ScriptMenu_MultichoiceWithDefault(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 cursorPos)
{
    if (FuncIsActiveTask(sub_809CC98) == TRUE)
        return FALSE;
    gSpecialVar_Result = 0xFF;
    sub_809CA64(left, top, mcId, ignoreBpress, cursorPos);
    return TRUE;
}

void sub_809CA64(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 initPos)
{
    s32 i;
    s32 strWidth;
    s32 tmp;
    u8 width;
    u8 height;
    u8 count;
    u8 windowId;
    const struct MenuAction * list;

    if ((ignoreBpress & 2) || sub_81119D4(sub_809D6D4) != TRUE)
    {
        ignoreBpress &= 1;
        count = gUnknown_83E04B0[mcId].count;
        list = gUnknown_83E04B0[mcId].list;
        strWidth = 0;
        for (i = 0; i < count; i++)
        {
            tmp = GetStringWidth(2, list[i].text, 0);
            if (tmp > strWidth)
                strWidth = tmp;
        }
        width = (strWidth + 9) / 8 + 1;
        if (left + width > 28)
            left = 28 - width;
        height = sub_809CBB4(count);
        windowId = CreateWindowFromRect(left, top, width, height);
        SetStdWindowBorderStyle(windowId, FALSE);
        if (mcId == 30 || mcId == 13 || mcId == 41)
            MultichoiceList_PrintItems(windowId, 2, 8, 2, 14, count, list, 0, 2);
        else
            MultichoiceList_PrintItems(windowId, 2, 8, 2, 14, count, list, 0, 2);
        Menu_InitCursor(windowId, 2, 0, 2, 14, count, initPos);
        sub_809CC18(ignoreBpress, count, windowId, mcId);
        ScheduleBgCopyTilemapToVram(0);
    }
}

u8 sub_809CBB4(u8 count)
{
    switch (count)
    {
    case 0:
        return 1;
    case 1:
        return 2;
    case 2:
        return 4;
    case 3:
        return 6;
    case 4:
        return 7;
    case 5:
        return 9;
    case 6:
        return 11;
    case 7:
        return 13;
    case 8:
        return 14;
    default:
        return 1;
    }
}

void sub_809CC18(u8 ignoreBpress, u8 count, u8 windowId, u8 mcId)
{
    u8 taskId;
    if (mcId == 39 || mcId == 47 || mcId == 50)
        gUnknown_2039988 = 12;
    else
        gUnknown_2039988 = 0;
    taskId = CreateTask(sub_809CC98, 80);
    gTasks[taskId].data[4] = ignoreBpress;
    if (count > 3)
        gTasks[taskId].data[5] = TRUE;
    else
        gTasks[taskId].data[5] = FALSE;
    gTasks[taskId].data[6] = windowId;
    gTasks[taskId].data[7] = mcId;
    sub_809CD48(mcId);
}

void sub_809CC98(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s8 input;
    if (!gPaletteFade.active)
    {
        if (gUnknown_2039988 != 0)
            gUnknown_2039988--;
        else
        {
            if (data[5] == FALSE)
                input = Menu_ProcessInputNoWrapAround();
            else
                input = Menu_ProcessInput();
            if (JOY_NEW(DPAD_UP | DPAD_DOWN))
                sub_809CD48(data[7]);
            switch (input)
            {
            case -2:
                return;
            case -1:
                if (data[4])
                    return;
                PlaySE(SE_SELECT);
                gSpecialVar_Result = 127;
                break;
            default:
                gSpecialVar_Result = input;
                break;
            }
            sub_809D6B0(data[6]);
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
    }
}

void sub_809CD48(u8 mcId)
{
    switch (mcId)
    {
    case 39:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, 2, gUnknown_83E072C[Menu_GetCursorPos()], 0, NULL, 2, 1, 3);
        break;
    case 47:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, 2, gUnknown_83E0738[Menu_GetCursorPos()], 0, NULL, 2, 1, 3);
        break;
    case 50:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, 2, gUnknown_83E0748[Menu_GetCursorPos()], 0, NULL, 2, 1, 3);
        break;
    }
}

bool8 ScriptMenu_YesNo(u8 unused, u8 stuff)
{
    if (FuncIsActiveTask(task_yes_no_maybe) == TRUE)
        return FALSE;
    gSpecialVar_Result = 255;
    if (!sub_81119D4(sub_809D6D4))
    {
        DisplayYesNoMenuDefaultYes();
        CreateTask(task_yes_no_maybe, 80);
    }
    return TRUE;
}

bool8 sub_809CE38(void)
{
    if (gSpecialVar_Result == 255)
        return FALSE;
    else
        return TRUE;
}

void task_yes_no_maybe(u8 taskId)
{
    s8 input;
    if (gTasks[taskId].data[2] < 5)
    {
        gTasks[taskId].data[2]++;
    }
    else
    {
        input = Menu_ProcessInputNoWrapClearOnChoose();
        switch (input)
        {
        case -2:
            return;
        case -1:
        case 1:
            PlaySE(SE_SELECT);
            gSpecialVar_Result = FALSE;
            break;
        case 0:
            gSpecialVar_Result = TRUE;
            break;
        }
        DestroyTask(taskId);
        EnableBothScriptContexts();
    }
}
