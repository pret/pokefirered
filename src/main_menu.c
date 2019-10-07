#include "global.h"
#include "palette.h"
#include "gpu_regs.h"
#include "scanline_effect.h"
#include "bg.h"
#include "dma3.h"
#include "task.h"
#include "text.h"
#include "save.h"
#include "event_data.h"
#include "window.h"
#include "menu.h"
#include "link.h"
#include "oak_speech.h"
#include "overworld.h"
#include "quest_log.h"
#include "mystery_gift_menu.h"
#include "strings.h"
#include "sound.h"
#include "title_screen.h"
#include "help_system.h"
#include "constants/songs.h"

bool32 sub_800C318(u8 a0);
void sub_800C4D0(u8 taskId);
void sub_800C634(u8 taskId, const u8 *str);
void sub_800C688(u8 taskId);
void sub_800C704(u8 taskId);
void sub_800C780(u8 taskId);
void sub_800C7A0(u8 taskId);
void sub_800C9CC(u8 taskId);
void sub_800CA28(u8 taskId);
void sub_800CA54(u8 taskId);
void sub_800CA94(u8 taskId);
void sub_800CB90(u8 taskId);
void sub_800CC68(u8 taskId);
void sub_800CC94(u8 menuType, u8 cursorPos);
bool8 sub_800CCF8(u8 taskId);
void sub_800CDF8(const u8 *str);
void sub_800CE58(void);
void sub_800CE70(void);
void sub_800CED4(void);
void sub_800CF3C(void);
void sub_800CFC4(void);
void sub_800D044(u8 a0);
void sub_800D094(u8 a0);
void sub_800D0B4(const struct WindowTemplate * template);
void sub_800D1E8(const struct WindowTemplate * template);

extern const struct WindowTemplate gUnknown_8234618[];
extern const u16 gUnknown_8234648[];
extern const u16 gUnknown_8234668[];
extern const u8 gUnknown_8234688[];
extern const u8 gUnknown_823468B[];
extern const struct BgTemplate gUnknown_8234690[1];
extern const u8 gUnknown_8234694[];

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

void sub_800C7A0(u8 taskId)
{
    u16 pal;
    SetGpuReg(REG_OFFSET_WIN0H, 0);
    SetGpuReg(REG_OFFSET_WIN0V, 0);
    SetGpuReg(REG_OFFSET_WININ, 0x0001);
    SetGpuReg(REG_OFFSET_WINOUT, 0x0021);
    SetGpuReg(REG_OFFSET_BLDCNT,
              BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ |
              BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 0));
    SetGpuReg(REG_OFFSET_BLDY, 7);
    if (gSaveBlock2Ptr->playerGender == MALE)
        pal = RGB(4, 16, 31);
    else
        pal = RGB(31, 3, 21);
    LoadPalette(&pal, 0xF1, 2);
    switch (gTasks[taskId].data[0])
    {
    case 0:
    default:
        FillWindowPixelBuffer(0, PIXEL_FILL(10));
        AddTextPrinterParameterized3(0, 2, 2, 2, gUnknown_8234688, -1, gText_NewGame);
        sub_800D0B4(&gUnknown_8234618[0]);
        PutWindowTilemap(0);
        CopyWindowToVram(0, 3);
        break;
    case 1:
        FillWindowPixelBuffer(1, PIXEL_FILL(10));
        FillWindowPixelBuffer(2, PIXEL_FILL(10));
        AddTextPrinterParameterized3(1, 2, 2, 2, gUnknown_8234688, -1, gText_Continue);
        AddTextPrinterParameterized3(2, 2, 2, 2, gUnknown_8234688, -1, gText_NewGame);
        sub_800CE58();
        sub_800D0B4(&gUnknown_8234618[1]);
        sub_800D0B4(&gUnknown_8234618[2]);
        PutWindowTilemap(1);
        PutWindowTilemap(2);
        CopyWindowToVram(1, 2);
        CopyWindowToVram(2, 3);
        break;
    case 2:
        FillWindowPixelBuffer(1, PIXEL_FILL(10));
        FillWindowPixelBuffer(2, PIXEL_FILL(10));
        FillWindowPixelBuffer(3, PIXEL_FILL(10));
        AddTextPrinterParameterized3(1, 2, 2, 2, gUnknown_8234688, -1, gText_Continue);
        AddTextPrinterParameterized3(2, 2, 2, 2, gUnknown_8234688, -1, gText_NewGame);
        gTasks[taskId].data[10] = 1;
        AddTextPrinterParameterized3(3, 2, 2, 2, gUnknown_8234688, -1, gText_MysteryGift);
        sub_800CE58();
        sub_800D0B4(&gUnknown_8234618[1]);
        sub_800D0B4(&gUnknown_8234618[2]);
        sub_800D0B4(&gUnknown_8234618[3]);
        PutWindowTilemap(1);
        PutWindowTilemap(2);
        PutWindowTilemap(3);
        CopyWindowToVram(1, 2);
        CopyWindowToVram(2, 2);
        CopyWindowToVram(3, 3);
        break;
    }
    gTasks[taskId].func = sub_800C9CC;
}

void sub_800C9CC(u8 taskId)
{
    if (CheckForSpaceForDma3Request(-1) != -1)
    {
        gTasks[taskId].func = sub_800CA28;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFFFF);
        ShowBg(0);
        SetVBlankCallback(sub_800C2EC);
    }
}

void sub_800CA28(u8 taskId)
{
    sub_800CC94(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    gTasks[taskId].func = sub_800CA54;
}

void sub_800CA54(u8 taskId)
{
    if (!gPaletteFade.active && sub_800CCF8(taskId))
    {
        gTasks[taskId].func = sub_800CA28;
    }
}

void sub_800CA94(u8 taskId)
{
    s32 r0;
    if (!gPaletteFade.active)
    {
        switch (gTasks[taskId].data[0])
        {
        default:
        case 0:
            r0 = 0;
            break;
        case 1:
            switch (gTasks[taskId].data[1])
            {
            default:
            case 0:
                r0 = 1;
                break;
            case 1:
                r0 = 0;
                break;
            }
            break;
        case 2:
            switch (gTasks[taskId].data[1])
            {
            default:
            case 0:
                r0 = 1;
                break;
            case 1:
                r0 = 0;
                break;
            case 2:
                if (!IsWirelessAdapterConnected())
                {
                    sub_800D094(0);
                    gTasks[taskId].func = sub_800CB90;
                    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
                    return;
                }
                else
                {
                    r0 = 2;
                }
                break;
            }
            break;
        }
        switch (r0)
        {
        default:
        case 0:
            gUnknown_2031DE0 = 0;
            FreeAllWindowBuffers();
            DestroyTask(taskId);
            StartNewGameScene();
            break;
        case 1:
            gPlttBufferUnfaded[0] = RGB_BLACK;
            gPlttBufferFaded[0] = RGB_BLACK;
            gUnknown_2031DE0 = 0;
            FreeAllWindowBuffers();
            TrySetUpQuestLogScenes_ElseContinueFromSave(taskId);
            break;
        case 2:
            SetMainCallback2(c2_mystery_gift);
            sub_812B478();
            FreeAllWindowBuffers();
            DestroyTask(taskId);
            break;
        }
    }
}

void sub_800CB90(u8 taskId)
{
    switch (gTasks[taskId].data[9])
    {
    case 0:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        if (gTasks[taskId].data[10] == 1)
            sub_800CDF8(gText_WirelessAdapterIsNotConnected);
        else
            sub_800CDF8(gText_MysteryGiftCantBeUsedWhileWirelessAdapterIsAttached);
        gTasks[taskId].data[9]++;
        break;
    case 1:
        if (!gPaletteFade.active)
            gTasks[taskId].data[9]++;
        break;
    case 2:
        RunTextPrinters();
        if (!IsTextPrinterActive(4))
            gTasks[taskId].data[9]++;
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            PlaySE(SE_SELECT);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            gTasks[taskId].func = sub_800CC68;
        }
        break;
    }
}

void sub_800CC68(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitTitleScreen);
        DestroyTask(taskId);
    }
}

void sub_800CC94(u8 menuType, u8 cursorPos)
{
    u16 win0v1, win0v2;
    SetGpuReg(REG_OFFSET_WIN0H, 0x12DE);
    switch (menuType)
    {
    default:
    case 0:
        win0v1 = 0x00;
        win0v2 = 0x20;
        break;
    case 1:
    case 2:
        switch (cursorPos)
        {
        default:
        case 0:
            win0v1 = 0x00;
            win0v2 = 0x60;
            break;
        case 1:
            win0v1 = 0x60 << 8;
            win0v2 = 0x80;
            break;
        case 2:
            win0v1 = 0x80 << 8;
            win0v2 = 0xA0;
            break;
        }
        break;
    }
    SetGpuReg(REG_OFFSET_WIN0V, (win0v1 + (2 << 8)) | (win0v2 - 2));
}

bool8 sub_800CCF8(u8 taskId)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        IsWirelessAdapterConnected(); // called for its side effects only
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gTasks[taskId].func = sub_800CA94;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        SetGpuReg(REG_OFFSET_WIN0H, 0xF0);
        SetGpuReg(REG_OFFSET_WIN0V, 0xA0);
        gTasks[taskId].func = sub_800CC68;
    }
    else if (JOY_NEW(DPAD_UP) && gTasks[taskId].data[1] > 0)
    {
        gTasks[taskId].data[1]--;
        return TRUE;
    }
    else if (JOY_NEW(DPAD_DOWN) && gTasks[taskId].data[1] < gUnknown_8234694[gTasks[taskId].data[0]])
    {
        gTasks[taskId].data[1]++;
        return TRUE;
    }

    return FALSE;
}

void sub_800CDF8(const u8 *str)
{
    FillWindowPixelBuffer(4, PIXEL_FILL(10));
    sub_800D0B4(&gUnknown_8234618[4]);
    AddTextPrinterParameterized3(4, 2, 0, 2, gUnknown_8234688, 2, str);
    PutWindowTilemap(4);
    CopyWindowToVram(4, 2);
    SetGpuReg(REG_OFFSET_WIN0H, 0x13DD);
    SetGpuReg(REG_OFFSET_WIN0V, 0x739D);
}

void sub_800CE58(void)
{
    sub_800CE70();
    sub_800CF3C();
    sub_800CED4();
    sub_800CFC4();
}

void sub_800CE70(void)
{
    s32 i;
    u8 name[OT_NAME_LENGTH + 1];
    u8 *ptr;
    AddTextPrinterParameterized3(1, 2, 2, 18, gUnknown_823468B, -1, gText_Player);
    ptr = name;
    for (i = 0; i < OT_NAME_LENGTH; i++)
        *ptr++ = gSaveBlock2Ptr->playerName[i];
    *ptr = EOS;
    AddTextPrinterParameterized3(1, 2, 62, 18, gUnknown_823468B, -1, name);
}
