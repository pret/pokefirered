#include "global.h"
#include "gflib.h"
#include "new_menu_helpers.h"
#include "quest_log.h"
#include "script.h"
#include "text_window.h"

EWRAM_DATA u8 gUnknown_203709C = 0;

void textbox_fdecode_auto_and_task_add(const u8 *str);
void textbox_auto_and_task_add(void);

void sub_8069348(void)
{
    gUnknown_203709C = 0;
    gTextFlags.canABSpeedUpPrint = FALSE;
    gTextFlags.useAlternateDownArrow = FALSE;
    gTextFlags.autoScroll = FALSE;
}

void sub_8069370(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        if (gQuestLogState == 2)
        {
            gTextFlags.autoScroll = TRUE;
            TextWindow_LoadTilesStdFrame1(0, 0x200);
        }
        else if (!IsMsgSignPost())
        {
            LoadStdWindowFrameGfx();
        }
        else
        {
            sub_80F79A4();
        }
        task->data[0]++;
        break;
    case 1:
        DrawDialogueFrame(0, TRUE);
        task->data[0]++;
        break;
    case 2:
        if (RunTextPrinters_CheckPrinter0Active() != TRUE)
        {
            gUnknown_203709C = 0;
            DestroyTask(taskId);
        }
        break;
    }
}

void task_add_textbox(void)
{
    CreateTask(sub_8069370, 80);
}

void task_del_textbox(void)
{
    u8 taskId = FindTaskIdByFunc(sub_8069370);
    if (taskId != 0xFF)
        DestroyTask(taskId);
}

bool8 ShowFieldMessage(const u8 *str)
{
    if (gUnknown_203709C != 0)
        return FALSE;
    textbox_fdecode_auto_and_task_add(str);
    gUnknown_203709C = 2;
    return TRUE;
}

bool8 ShowFieldAutoScrollMessage(const u8 *str)
{
    if (gUnknown_203709C != 0)
        return FALSE;
    gUnknown_203709C = 3;
    textbox_fdecode_auto_and_task_add(str);
    return TRUE;
}

bool8 sub_806948C(const u8 *str)
{
    gUnknown_203709C = 3;
    textbox_fdecode_auto_and_task_add(str);
    return TRUE;
}

bool8 sub_80694A4(const u8 *str)
{
    if (gUnknown_203709C != 0)
        return FALSE;
    gUnknown_203709C = 2;
    textbox_auto_and_task_add();
    return TRUE;
}

void textbox_fdecode_auto_and_task_add(const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    AddTextPrinterDiffStyle(TRUE);
    task_add_textbox();
}

void textbox_auto_and_task_add(void)
{
    AddTextPrinterDiffStyle(TRUE);
    task_add_textbox();
}

void HideFieldMessageBox(void)
{
    task_del_textbox();
    ClearDialogWindowAndFrame(0, TRUE);
    gUnknown_203709C = 0;
}

u8 textbox_any_visible(void)
{
    return gUnknown_203709C;
}

bool8 IsFieldMessageBoxHidden(void)
{
    if (gUnknown_203709C == 0)
        return TRUE;
    else
        return FALSE;
}

void sub_8069538(void)
{
    task_del_textbox();
    DrawStdWindowFrame(0, TRUE);
    gUnknown_203709C = 0;
}
