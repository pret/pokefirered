#include "global.h"
#include "palette.h"
#include "gpu_regs.h"
#include "scanline_effect.h"
#include "bg.h"
#include "task.h"
#include "text.h"
#include "save.h"
#include "event_data.h"
#include "window.h"
#include "strings.h"

bool32 sub_800C318(u8 a0);
void sub_800C4D0(u8 taskId);
void sub_800C634(u8 taskId, const u8 *str);
void sub_800C688(u8 taskId);
void sub_800C704(u8 taskId);
void sub_800C780(u8 taskId);
void sub_800C7A0(u8 taskId);
void sub_800CA94(u8 taskId);
void sub_800CDF8(const u8 *str);
void sub_800D044(u8 a0);
void sub_800D094(u8 a0);
void sub_800D1E8(const struct WindowTemplate * template);

extern const struct WindowTemplate gUnknown_8234618[];
extern const u16 gUnknown_8234648[];
extern const u16 gUnknown_8234668[];
extern const struct BgTemplate gUnknown_8234690[1];

void sub_800C2D4(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_800C2EC(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_800C300(void)
{
    sub_800C318(1);
}

void sub_800C30C(void)
{
    sub_800C318(1);
}

bool32 sub_800C318(u8 a0)
{
    u8 taskId;

    SetVBlankCallback(NULL);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BG2CNT, 0);
    SetGpuReg(REG_OFFSET_BG1CNT, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16(3, 0, (void *)(PLTT + 2), PLTT_SIZE - 2);
    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetPaletteFade();
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_8234690, NELEMS(gUnknown_8234690));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    InitWindows(gUnknown_8234618);
    DeactivateAllTextPrinters();
    LoadPalette(gUnknown_8234648, 0x00, 0x20);
    LoadPalette(gUnknown_8234668, 0xF0, 0x20);
    SetGpuReg(REG_OFFSET_WIN0H, 0);
    SetGpuReg(REG_OFFSET_WIN0V, 0);
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetMainCallback2(sub_800C2D4);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON);
    taskId = CreateTask(sub_800C4D0, 0);
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[8] = a0;
    return FALSE;
}

void sub_800C4D0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetGpuReg(REG_OFFSET_WIN0H, 0);
        SetGpuReg(REG_OFFSET_WIN0V, 0);
        SetGpuReg(REG_OFFSET_WININ, 0x0001);
        SetGpuReg(REG_OFFSET_WINOUT, 0x0021);
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN);
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 0));
        SetGpuReg(REG_OFFSET_BLDY, 7);
        switch (gSaveFileStatus)
        {
        case 1:
            sub_800D044(0);
            if (sub_806E2BC() == TRUE)
            {
                gTasks[taskId].data[0] = 2;
            }
            else
            {
                gTasks[taskId].data[0] = 1;
            }
            gTasks[taskId].func = sub_800C704;
            break;
        case 2:
            sub_800D094(0);
            gTasks[taskId].data[0] = 0;
            sub_800C634(taskId, gText_SaveFileHasBeenDeleted);
            break;
        case 0xFF:
            sub_800D094(0);
            gTasks[taskId].data[0] = 1;
            sub_800C634(taskId, gText_SaveFileCorruptedPrevWillBeLoaded);
            if (sub_806E2BC() == TRUE)
            {
                gTasks[taskId].data[0] = 2;
            }
            else
            {
                gTasks[taskId].data[0] = 1;
            }
            break;
        case 0:
        default:
            sub_800D044(0);
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].func = sub_800C704;
            break;
        case 4:
            sub_800D094(0);
            gTasks[taskId].data[0] = 0;
            sub_800C634(taskId, gText_1MSubCircuitBoardNotInstalled);
            break;
        }
    }
}

void sub_800C634(u8 taskId, const u8 *str)
{
    sub_800CDF8(str);
    gTasks[taskId].func = sub_800C688;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFFFF);
    ShowBg(0);
    SetVBlankCallback(sub_800C2EC);
}

void sub_800C688(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        RunTextPrinters();
        if (!IsTextPrinterActive(4) && JOY_NEW(A_BUTTON))
        {
            ClearWindowTilemap(4);
            sub_800D1E8(&gUnknown_8234618[4]);
            sub_800D044(0);
            if (gTasks[taskId].data[0] == 0)
                gTasks[taskId].func = sub_800C704;
            else
                gTasks[taskId].func = sub_800C7A0;
        }
    }
}

void sub_800C704(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetGpuReg(REG_OFFSET_WIN0H, 0);
        SetGpuReg(REG_OFFSET_WIN0V, 0);
        SetGpuReg(REG_OFFSET_WININ, 0x0001);
        SetGpuReg(REG_OFFSET_WINOUT, 0x0021);
        SetGpuReg(REG_OFFSET_BLDCNT,
                  BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ |
                  BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN);
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 0));
        SetGpuReg(REG_OFFSET_BLDY, 7);
        if (gTasks[taskId].data[0] == 0)
            gTasks[taskId].func = sub_800CA94;
        else
            gTasks[taskId].func = sub_800C780;
    }
}

void sub_800C780(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_800C7A0(taskId);
    }
}
