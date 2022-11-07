#include "global.h"
#include "gflib.h"
#include "hall_of_fame.h"
#include "overworld.h"
#include "script.h"
#include "script_menu.h"
#include "task.h"

static void ReshowPCMenuAfterHallOfFamePC(void);
static void Task_WaitForPaletteFade(u8 taskId);

static void Task_WaitFadeAndSetCallback(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        FreeAllWindowBuffers();
        ResetBgsAndClearDma3BusyFlags(0);
        DestroyTask(taskId);
        SetMainCallback2(CB2_InitHofPC);
    }
}

void HallOfFamePCBeginFade(void)
{
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    LockPlayerFieldControls();
    CreateTask(Task_WaitFadeAndSetCallback, 0);
}

void ReturnFromHallOfFamePC(void)
{
    SetMainCallback2(CB2_ReturnToField);
    gFieldCallback = ReshowPCMenuAfterHallOfFamePC;
}

static void ReshowPCMenuAfterHallOfFamePC(void)
{
    LockPlayerFieldControls();
    Overworld_PlaySpecialMapMusic();
    CreatePCMenu();
    ScriptMenu_DisplayPCStartupPrompt();
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0x10, 0, RGB_BLACK);
    CreateTask(Task_WaitForPaletteFade, 10);
}

static void Task_WaitForPaletteFade(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}
