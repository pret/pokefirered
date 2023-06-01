#include "global.h"
#include "gflib.h"
#include "field_screen_effect.h"
#include "overworld.h"
#include "scanline_effect.h"
#include "script.h"
#include "task.h"
#include "strings.h"
#include "menu.h"
#include "heal_location.h"
#include "new_menu_helpers.h"
#include "event_object_movement.h"
#include "field_fadetransition.h"
#include "event_scripts.h"
#include "constants/heal_locations.h"
#include "constants/maps.h"

static const u16 sFlashLevelToRadius[] = { 200, 72, 56, 40, 24 };
const s32 gMaxFlashLevel = ARRAY_COUNT(sFlashLevelToRadius) - 1;

static const struct WindowTemplate sWindowTemplate_WhiteoutText =
{
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 5,
    .width = 30,
    .height = 11,
    .paletteNum = 15,
    .baseBlock = 1,
};

static const u8 sWhiteoutTextColors[] = { TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY };

static void Task_EnableScriptAfterMusicFade(u8 taskId);
static void Task_BarnDoorWipeChild(u8 taskId);

static void SetFlashScanlineEffectWindowBoundary(u16 *dest, u32 y, s32 left, s32 right)
{
    if (y <= 160)
    {
        if (left < 0)
            left = 0;
        if (left > 255)
            left = 255;
        if (right < 0)
            right = 0;
        if (right > 255)
            right = 255;
        dest[y] = (left << 8) | right;
    }
}

/*
 * Draws a circle by approximating xy² + yx² = radius².
 *
 * error is approximately xy² - yx². Negative values mean the circle is
 * slightly too large, and positive values mean the circle is slightly
 * too small. By decreasing xy whenever the error becomes negative the
 * code slightly under-approximates the size of the circle.
 *
 * The subtractive terms compute yx² - (yx - 1)², and therefore the sum
 * is yx² - 1:
 *   yx               |  0 |  1 |  2 |  3 |  4 |  5 |  6 |  7
 *   (yx * 2) - 1     | -1 |  1 |  3 |  5 |  7 |  9 | 11 | 13
 *   yx² - (yx - 1)²  | -1 |  1 |  3 |  5 |  7 |  9 | 11 | 13
 *   cumulative error | -1 |  0 |  3 |  8 | 15 | 24 | 35 | 48
 *   yx²              |  0 |  1 |  4 |  9 | 16 | 25 | 36 | 49
 *
 * The additive terms compute xy² - (xy - 1)² - 1, and therefore the sum
 * (badly) approximates Σi² - (i - 1)², i ∈ (xy, r), consider r = 18:
 *   xy               | 18 | 17 | 16 |  15 |  14 |  13 | ... |   0
 *   xy² - (xy - 1)²  | 35 | 33 | 31 |  29 |  27 |  25 | ... |  -1
 *   2 * (xy - 1)     | 34 | 32 | 30 |  28 |  26 |  24 | ... |  -2
 *   cumulative error | 34 | 66 | 96 | 124 | 150 | 174 | ... | 304
 *   Σi² - (i - 1)²   | 35 | 68 | 99 | 128 | 155 | 180 | ... | 323
 * 18² = 324, so if the iterations ran until xy = 0 the cumulative error
 * would be xy² - r.
 *
 * The error is initialized to r, which corrects for the error in the
 * additive terms. In practice all r iterations don't occur because we
 * early-exit when yx > xy, so it's half-way between a fix for that
 * error and an approximation of the midpoint between r² and (r + 1)².
 *
 * The algorithm takes advantage of symmetry to compute boundaries in
 * both directions out from centerY (using yx for y), and also both
 * directions *in* from centerY ± radius (using xy for y). Because xy
 * doesn't change on every iteration, we will frequently overwrite
 * boundaries set in the previous iteration.
 */
void SetFlashScanlineEffectWindowBoundaries(u16 *dest, s32 centerX, s32 centerY, s32 radius)
{
    s32 xy = radius;
    s32 error = radius;
    s32 yx = 0;
    while (xy >= yx)
    {
        SetFlashScanlineEffectWindowBoundary(dest, centerY - yx, centerX - xy, centerX + xy);
        SetFlashScanlineEffectWindowBoundary(dest, centerY + yx, centerX - xy, centerX + xy);
        SetFlashScanlineEffectWindowBoundary(dest, centerY - xy, centerX - yx, centerX + yx);
        SetFlashScanlineEffectWindowBoundary(dest, centerY + xy, centerX - yx, centerX + yx);
        error -= (yx * 2) - 1;
        yx++;
        if (error < 0)
        {
            error += 2 * (xy - 1);
            xy--;
        }
    }
}

#define tState               data[0]
#define tFlashCenterX        data[1]
#define tFlashCenterY        data[2]
#define tCurFlashRadius      data[3]
#define tDestFlashRadius     data[4]
#define tFlashRadiusDelta    data[5]
#define tClearScanlineEffect data[6]

static void UpdateFlashLevelEffect(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        SetFlashScanlineEffectWindowBoundaries(gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer], tFlashCenterX, tFlashCenterY, tCurFlashRadius);
        tState = 1;
        break;
    case 1:
        SetFlashScanlineEffectWindowBoundaries(gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer], tFlashCenterX, tFlashCenterY, tCurFlashRadius);
        tState = 0;
        tCurFlashRadius += tFlashRadiusDelta;
        if (tCurFlashRadius > tDestFlashRadius)
        {
            if (tClearScanlineEffect == TRUE)
            {
                ScanlineEffect_Stop();
                tState = 2;
            }
            else
            {
                DestroyTask(taskId);
            }
        }
        break;
    case 2:
        ScanlineEffect_Clear();
        DestroyTask(taskId);
        break;
    }
}

static void Task_WaitForFlashUpdate(u8 taskId)
{
    if (!FuncIsActiveTask(UpdateFlashLevelEffect))
    {
        ScriptContext_Enable();
        DestroyTask(taskId);
    }
}

static void StartWaitForFlashUpdate(void)
{
    if (!FuncIsActiveTask(Task_WaitForFlashUpdate))
        CreateTask(Task_WaitForFlashUpdate, 80);
}

static u8 StartUpdateFlashLevelEffect(s32 centerX, s32 centerY, s32 initialFlashRadius, s32 destFlashRadius, bool32 clearScanlineEffect, u8 delta)
{
    u8 taskId = CreateTask(UpdateFlashLevelEffect, 80);
    s16 *data = gTasks[taskId].data;

    tCurFlashRadius = initialFlashRadius;
    tDestFlashRadius = destFlashRadius;
    tFlashCenterX = centerX;
    tFlashCenterY = centerY;
    tClearScanlineEffect = clearScanlineEffect;

    if (initialFlashRadius < destFlashRadius)
        tFlashRadiusDelta = delta;
    else
        tFlashRadiusDelta = -delta;

    return taskId;
}

#undef tState
#undef tCurFlashRadius
#undef tDestFlashRadius
#undef tFlashRadiusDelta
#undef tClearScanlineEffect

// A higher flash level is a smaller flash radius (more darkness). 0 is full brightness
void AnimateFlash(u8 newFlashLevel)
{
    u8 curFlashLevel = Overworld_GetFlashLevel();
    bool32 fullBrightness = FALSE;
    if (newFlashLevel == 0)
        fullBrightness = TRUE;
    StartUpdateFlashLevelEffect(DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, sFlashLevelToRadius[curFlashLevel], sFlashLevelToRadius[newFlashLevel], fullBrightness, 2);
    StartWaitForFlashUpdate();
    LockPlayerFieldControls();
}

void WriteFlashScanlineEffectBuffer(u8 flashLevel)
{
    if (flashLevel)
    {
        SetFlashScanlineEffectWindowBoundaries(&gScanlineEffectRegBuffers[0][0], 120, 80, sFlashLevelToRadius[flashLevel]);
        CpuFastCopy(&gScanlineEffectRegBuffers[0], &gScanlineEffectRegBuffers[1], 240 * 8);
    }
}

void Script_FadeOutMapMusic(void)
{
    Overworld_FadeOutMapMusic();
    CreateTask(Task_EnableScriptAfterMusicFade, 80);
}

static void Task_EnableScriptAfterMusicFade(u8 taskId)
{
    if (BGMusicStopped() == TRUE)
    {
        DestroyTask(taskId);
        ScriptContext_Enable();
    }
}

#define tState data[9]
#define tDirection data[10]
#define DIR_WIPE_IN 0 // From edges to center.
#define DIR_WIPE_OUT 1 // From center to edges.
#define tChildOffset data[0]

static void DoInwardBarnDoorFade(void)
{
    u8 taskId = CreateTask(Task_BarnDoorWipe, 80);
    gTasks[taskId].tDirection = DIR_WIPE_IN;
}

void DoOutwardBarnDoorWipe(void)
{
    u8 taskId = CreateTask(Task_BarnDoorWipe, 80);
    gTasks[taskId].tDirection = DIR_WIPE_OUT;
}

static void BarnDoorWipeSaveGpuRegs(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[0] = GetGpuReg(REG_OFFSET_DISPCNT);
    data[1] = GetGpuReg(REG_OFFSET_WININ);
    data[2] = GetGpuReg(REG_OFFSET_WINOUT);
    data[3] = GetGpuReg(REG_OFFSET_BLDCNT);
    data[4] = GetGpuReg(REG_OFFSET_BLDALPHA);
    data[5] = GetGpuReg(REG_OFFSET_WIN0H);
    data[6] = GetGpuReg(REG_OFFSET_WIN0V);
    data[7] = GetGpuReg(REG_OFFSET_WIN1H);
    data[8] = GetGpuReg(REG_OFFSET_WIN1V);
}

static void BarnDoorWipeLoadGpuRegs(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    SetGpuReg(REG_OFFSET_DISPCNT, data[0]);
    SetGpuReg(REG_OFFSET_WININ, data[1]);
    SetGpuReg(REG_OFFSET_WINOUT, data[2]);
    SetGpuReg(REG_OFFSET_BLDCNT, data[3]);
    SetGpuReg(REG_OFFSET_BLDALPHA, data[4]);
    SetGpuReg(REG_OFFSET_WIN0H, data[5]);
    SetGpuReg(REG_OFFSET_WIN0V, data[6]);
    SetGpuReg(REG_OFFSET_WIN1H, data[7]);
    SetGpuReg(REG_OFFSET_WIN1V, data[8]);
}

void Task_BarnDoorWipe(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (tState)
    {
        case 0:
            BarnDoorWipeSaveGpuRegs(taskId);
            SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
            SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);
            if (data[10] == 0)
            {
                SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, 0));
                SetGpuReg(REG_OFFSET_WIN1H, WIN_RANGE(DISPLAY_WIDTH, 255));
                SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 255));
                SetGpuReg(REG_OFFSET_WIN1V, WIN_RANGE(0, 255));
            }
            else
            {
                SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, DISPLAY_WIDTH / 2));
                SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 255));
                SetGpuReg(REG_OFFSET_WIN1H, WIN_RANGE(DISPLAY_WIDTH / 2, 255));
                SetGpuReg(REG_OFFSET_WIN1V, WIN_RANGE(0, 255));
            }
            SetGpuReg(REG_OFFSET_WININ, 0);
            SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR);
            tState = 1;
            break;
        case 1:
            CreateTask(Task_BarnDoorWipeChild, 80);
            tState = 2;
            break;
        case 2:
            if (!FuncIsActiveTask(Task_BarnDoorWipeChild))
            {
                tState = 3;
            }
            break;
        case 3:
            BarnDoorWipeLoadGpuRegs(taskId);
            DestroyTask(taskId);
            break;
    }
}

static void Task_BarnDoorWipeChild(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
	u8 parentTaskId = FindTaskIdByFunc(Task_BarnDoorWipe);
    s16 lhs, rhs;
    if (gTasks[parentTaskId].tDirection == DIR_WIPE_IN)
    {
        lhs = tChildOffset;
        rhs = DISPLAY_WIDTH - tChildOffset;
        if (lhs > DISPLAY_WIDTH / 2)
        {
            DestroyTask(taskId);
            return;
        }
    }
    else
    {
        lhs = DISPLAY_WIDTH / 2 - tChildOffset;
        rhs = DISPLAY_WIDTH / 2 + tChildOffset;
        if (lhs < 0)
        {
            DestroyTask(taskId);
            return;
        }
    }
    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, lhs));
    SetGpuReg(REG_OFFSET_WIN1H, WIN_RANGE(rhs, DISPLAY_WIDTH));
    if (lhs < 90)
        tChildOffset += 4;
    else
        tChildOffset += 2;
}

#undef tState
#undef tDirection
#undef DIR_WIPE_IN
#undef DIR_WIPE_OUT
#undef tChildOffset

#define tState      data[0]
#define tWindowId   data[1]
#define tPrintState data[2]

static bool8 PrintWhiteOutRecoveryMessage(u8 taskId, const u8 *text, u8 x, u8 y)
{
    u8 windowId = gTasks[taskId].tWindowId;

    switch (gTasks[taskId].tPrintState)
    {
    case 0:
        FillWindowPixelBuffer(windowId, PIXEL_FILL(0));
        StringExpandPlaceholders(gStringVar4, text);
        AddTextPrinterParameterized4(windowId, FONT_NORMAL, x, y, 1, 0, sWhiteoutTextColors, 1, gStringVar4);
        gTextFlags.canABSpeedUpPrint = FALSE;
        gTasks[taskId].tPrintState = 1;
        break;
    case 1:
        RunTextPrinters();
        if (!IsTextPrinterActive(windowId))
        {
            gTasks[taskId].tPrintState = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void Task_RushInjuredPokemonToCenter(u8 taskId)
{
    u8 windowId;
    const struct HealLocation *loc;

    switch (gTasks[taskId].tState)
    {
    case 0:
        windowId = AddWindow(&sWindowTemplate_WhiteoutText);
        gTasks[taskId].tWindowId = windowId;
        Menu_LoadStdPalAt(BG_PLTT_ID(15));
        FillWindowPixelBuffer(windowId, PIXEL_FILL(0));
        PutWindowTilemap(windowId);
        CopyWindowToVram(windowId, COPYWIN_FULL);

        // Scene changes if last heal location was the player's house
        loc = GetHealLocation(SPAWN_PALLET_TOWN);
        if (gSaveBlock1Ptr->lastHealLocation.mapGroup == loc->group
         && gSaveBlock1Ptr->lastHealLocation.mapNum == loc->map
         && gSaveBlock1Ptr->lastHealLocation.warpId == WARP_ID_NONE
         && gSaveBlock1Ptr->lastHealLocation.x == loc->x
         && gSaveBlock1Ptr->lastHealLocation.y == loc->y)
            gTasks[taskId].tState = 4;
        else
            gTasks[taskId].tState = 1;
        break;
    case 1:
        if (PrintWhiteOutRecoveryMessage(taskId, gText_PlayerScurriedToCenter, 2, 8))
        {
            ObjectEventTurn(&gObjectEvents[gPlayerAvatar.objectEventId], DIR_NORTH);
            gTasks[taskId].tState++;
        }
        break;
    case 4:
        if (PrintWhiteOutRecoveryMessage(taskId, gText_PlayerScurriedBackHome, 2, 8))
        {
            ObjectEventTurn(&gObjectEvents[gPlayerAvatar.objectEventId], DIR_NORTH);
            gTasks[taskId].tState++;
        }
        break;
    case 2:
    case 5:
        windowId = gTasks[taskId].tWindowId;
        ClearWindowTilemap(windowId);
        CopyWindowToVram(windowId, COPYWIN_MAP);
        RemoveWindow(windowId);
        palette_bg_faded_fill_black();
        FadeInFromBlack();
        gTasks[taskId].tState++;
        break;
    case 3:
        if (FieldFadeTransitionBackgroundEffectIsFinished() == TRUE)
        {
            DestroyTask(taskId);
            ScriptContext_SetupScript(EventScript_AfterWhiteOutHeal);
        }
        break;
    case 6:
        if (FieldFadeTransitionBackgroundEffectIsFinished() == TRUE)
        {
            DestroyTask(taskId);
            ScriptContext_SetupScript(EventScript_AfterWhiteOutMomHeal);
        }
        break;
    }
}

void FieldCB_RushInjuredPokemonToCenter(void)
{
    u8 taskId;

    LockPlayerFieldControls();
    palette_bg_faded_fill_black();
    taskId = CreateTask(Task_RushInjuredPokemonToCenter, 10);
    gTasks[taskId].tState = 0;
}
