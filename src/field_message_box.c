#include "global.h"
#include "gflib.h"
#include "new_menu_helpers.h"
#include "quest_log.h"
#include "script.h"
#include "text_window.h"

static EWRAM_DATA u8 sMessageBoxType = 0;

static void textbox_fdecode_auto_and_task_add(const u8 *str);
static void textbox_auto_and_task_add(void);

void InitFieldMessageBox(void)
{
    sMessageBoxType = 0;
    gTextFlags.canABSpeedUpPrint = FALSE;
    gTextFlags.useAlternateDownArrow = FALSE;
    gTextFlags.autoScroll = FALSE;
}

static void Task_RunFieldMessageBoxPrinter(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        if (gQuestLogState == QL_STATE_PLAYBACK)
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
            LoadSignPostWindowFrameGfx();
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
            sMessageBoxType = 0;
            DestroyTask(taskId);
        }
        break;
    }
}

static void task_add_textbox(void)
{
    CreateTask(Task_RunFieldMessageBoxPrinter, 80);
}

static void task_del_textbox(void)
{
    u8 taskId = FindTaskIdByFunc(Task_RunFieldMessageBoxPrinter);
    if (taskId != 0xFF)
        DestroyTask(taskId);
}

bool8 ShowFieldMessage(const u8 *str)
{
    if (sMessageBoxType != 0)
        return FALSE;
    textbox_fdecode_auto_and_task_add(str);
    sMessageBoxType = 2;
    return TRUE;
}

bool8 ShowFieldAutoScrollMessage(const u8 *str)
{
    if (sMessageBoxType != 0)
        return FALSE;
    sMessageBoxType = 3;
    textbox_fdecode_auto_and_task_add(str);
    return TRUE;
}

bool8 sub_806948C(const u8 *str)
{
    sMessageBoxType = 3;
    textbox_fdecode_auto_and_task_add(str);
    return TRUE;
}

bool8 sub_80694A4(const u8 *str)
{
    if (sMessageBoxType != 0)
        return FALSE;
    sMessageBoxType = 2;
    textbox_auto_and_task_add();
    return TRUE;
}

static void textbox_fdecode_auto_and_task_add(const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    AddTextPrinterDiffStyle(TRUE);
    task_add_textbox();
}

static void textbox_auto_and_task_add(void)
{
    AddTextPrinterDiffStyle(TRUE);
    task_add_textbox();
}

void HideFieldMessageBox(void)
{
    task_del_textbox();
    ClearDialogWindowAndFrame(0, TRUE);
    sMessageBoxType = 0;
}

u8 textbox_any_visible(void)
{
    return sMessageBoxType;
}

bool8 IsFieldMessageBoxHidden(void)
{
    if (sMessageBoxType == 0)
        return TRUE;
    else
        return FALSE;
}

void sub_8069538(void)
{
    task_del_textbox();
    DrawStdWindowFrame(0, TRUE);
    sMessageBoxType = 0;
}
