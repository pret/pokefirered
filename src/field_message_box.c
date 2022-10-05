#include "global.h"
#include "field_message_box.h"
#include "gflib.h"
#include "new_menu_helpers.h"
#include "quest_log.h"
#include "script.h"
#include "text_window.h"

static EWRAM_DATA u8 sMessageBoxType = 0;

static void ExpandStringAndStartDrawFieldMessageBox(const u8 *str);
static void StartDrawFieldMessageBox(void);

void InitFieldMessageBox(void)
{
    sMessageBoxType = FIELD_MESSAGE_BOX_HIDDEN;
    gTextFlags.canABSpeedUpPrint = FALSE;
    gTextFlags.useAlternateDownArrow = FALSE;
    gTextFlags.autoScroll = FALSE;
}

static void Task_DrawFieldMessageBox(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        if (gQuestLogState == QL_STATE_PLAYBACK)
        {
            gTextFlags.autoScroll = TRUE;
            LoadQuestLogWindowTiles(0, 0x200);
        }
        else if (!IsMsgSignpost())
            LoadStdWindowFrameGfx();
        else
            LoadSignpostWindowFrameGfx();
        task->data[0]++;
        break;
    case 1:
        DrawDialogueFrame(0, TRUE);
        task->data[0]++;
        break;
    case 2:
        if (RunTextPrinters_CheckPrinter0Active() != TRUE)
        {
            sMessageBoxType = FIELD_MESSAGE_BOX_HIDDEN;
            DestroyTask(taskId);
        }
        break;
    }
}

static void CreateTask_DrawFieldMessageBox(void)
{
    CreateTask(Task_DrawFieldMessageBox, 80);
}

static void DestroyTask_DrawFieldMessageBox(void)
{
    u8 taskId = FindTaskIdByFunc(Task_DrawFieldMessageBox);
    if (taskId != 0xFF)
        DestroyTask(taskId);
}

bool8 ShowFieldMessage(const u8 *str)
{
    if (sMessageBoxType != FIELD_MESSAGE_BOX_HIDDEN)
        return FALSE;
    ExpandStringAndStartDrawFieldMessageBox(str);
    sMessageBoxType = FIELD_MESSAGE_BOX_NORMAL;
    return TRUE;
}

bool8 ShowFieldAutoScrollMessage(const u8 *str)
{
    if (sMessageBoxType != FIELD_MESSAGE_BOX_HIDDEN)
        return FALSE;
    sMessageBoxType = FIELD_MESSAGE_BOX_AUTO_SCROLL;
    ExpandStringAndStartDrawFieldMessageBox(str);
    return TRUE;
}

// Unused
static bool8 ForceShowFieldAutoScrollMessage(const u8 *str)
{
    sMessageBoxType = FIELD_MESSAGE_BOX_AUTO_SCROLL;
    ExpandStringAndStartDrawFieldMessageBox(str);
    return TRUE;
}

// Unused
// Same as ShowFieldMessage, but instead of accepting a string argument,
// it just prints whatever that's already in gStringVar4
static bool8 ShowFieldMessageFromBuffer(void)
{
    if (sMessageBoxType != FIELD_MESSAGE_BOX_HIDDEN)
        return FALSE;
    sMessageBoxType = FIELD_MESSAGE_BOX_NORMAL;
    StartDrawFieldMessageBox();
    return TRUE;
}

static void ExpandStringAndStartDrawFieldMessageBox(const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    AddTextPrinterDiffStyle(TRUE);
    CreateTask_DrawFieldMessageBox();
}

static void StartDrawFieldMessageBox(void)
{
    AddTextPrinterDiffStyle(TRUE);
    CreateTask_DrawFieldMessageBox();
}

void HideFieldMessageBox(void)
{
    DestroyTask_DrawFieldMessageBox();
    ClearDialogWindowAndFrame(0, TRUE);
    sMessageBoxType = FIELD_MESSAGE_BOX_HIDDEN;
}

u8 GetFieldMessageBoxType(void)
{
    return sMessageBoxType;
}

bool8 IsFieldMessageBoxHidden(void)
{
    if (sMessageBoxType == FIELD_MESSAGE_BOX_HIDDEN)
        return TRUE;
    else
        return FALSE;
}

// Unused
static void ReplaceFieldMessageWithFrame(void)
{
    DestroyTask_DrawFieldMessageBox();
    DrawStdWindowFrame(0, TRUE);
    sMessageBoxType = FIELD_MESSAGE_BOX_HIDDEN;
}
