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
#include "string_util.h"
#include "pokedex.h"
#include "text_window.h"
#include "text_window_graphics.h"
#include "constants/songs.h"

static bool32 MainMenuGpuInit(u8 a0);
static void Task_SetWin0BldRegsAndCheckSaveFile(u8 taskId);
static void PrintSaveErrorStatus(u8 taskId, const u8 *str);
static void Task_SaveErrorStatus_RunPrinterThenWaitButton(u8 taskId);
static void Task_SetWin0BldRegsNoSaveFileCheck(u8 taskId);
static void Task_WaitFadeAndPrintMainMenuText(u8 taskId);
static void Task_PrintMainMenuText(u8 taskId);
static void Task_WaitDma3AndFadeIn(u8 taskId);
static void Task_UpdateVisualSelection(u8 taskId);
static void Task_HandleMenuInput(u8 taskId);
static void Task_ExecuteMainMenuSelection(u8 taskId);
static void Task_MysteryGiftError(u8 taskId);
static void Task_ReturnToTileScreen(u8 taskId);
static void MoveWindowByMenuTypeAndCursorPos(u8 menuType, u8 cursorPos);
static bool8 HandleMenuInput(u8 taskId);
static void PrintMessageOnWindow4(const u8 *str);
static void PrintContinueStats(void);
static void PrintPlayerName(void);
static void PrintPlayTime(void);
static void PrintDexCount(void);
static void PrintBadgeCount(void);
static void LoadUserFrameToBg(u8 bgId);
static void SetStdFrame0OnBg(u8 bgId);
static void DrawBubbleBorder(const struct WindowTemplate * template);
static void DestroyWindowBubbleFrame(const struct WindowTemplate * template);

static const u8 sString_Dummy[] = _("");
static const u8 sString_Newline[] = _("\n");

static const struct WindowTemplate sWindowTemplate[] = {
    {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 1,
        .width = 24,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x001
    }, {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 1,
        .width = 24,
        .height = 10,
        .paletteNum = 15,
        .baseBlock = 0x001
    }, {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 13,
        .width = 24,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x0f1
    }, {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 17,
        .width = 24,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x121
    }, {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 15,
        .width = 24,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x001
    }, DUMMY_WIN_TEMPLATE
};

static const u16 sBgPal00[] = INCBIN_U16("data/main_menu/unk_8234648.gbapal");
static const u16 sBgPal15[] = INCBIN_U16("data/main_menu/unk_8234668.gbapal");

static const u8 sTextColor1[] = { 10, 11, 12 };

static const u8 sTextColor2[] = { 10,  1, 12 };

static const struct BgTemplate sBgTemplate[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .priority = 0
    }
};

static const u8 gUnknown_8234694[] = { 0, 1, 2 };

static void CB2_MainMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_MainMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_InitMainMenu(void)
{
    MainMenuGpuInit(1);
}

static void CB2_InitMainMenu_2(void)
{
    MainMenuGpuInit(1);
}

static bool32 MainMenuGpuInit(u8 a0)
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
    InitBgsFromTemplates(0, sBgTemplate, NELEMS(sBgTemplate));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    InitWindows(sWindowTemplate);
    DeactivateAllTextPrinters();
    LoadPalette(sBgPal00, 0x00, 0x20);
    LoadPalette(sBgPal15, 0xF0, 0x20);
    SetGpuReg(REG_OFFSET_WIN0H, 0);
    SetGpuReg(REG_OFFSET_WIN0V, 0);
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetMainCallback2(CB2_MainMenu);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON);
    taskId = CreateTask(Task_SetWin0BldRegsAndCheckSaveFile, 0);
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[8] = a0;
    return FALSE;
}

static void Task_SetWin0BldRegsAndCheckSaveFile(u8 taskId)
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
            LoadUserFrameToBg(0);
            if (Flag_0x839_IsSet() == TRUE)
            {
                gTasks[taskId].data[0] = 2;
            }
            else
            {
                gTasks[taskId].data[0] = 1;
            }
            gTasks[taskId].func = Task_SetWin0BldRegsNoSaveFileCheck;
            break;
        case 2:
            SetStdFrame0OnBg(0);
            gTasks[taskId].data[0] = 0;
            PrintSaveErrorStatus(taskId, gText_SaveFileHasBeenDeleted);
            break;
        case 0xFF:
            SetStdFrame0OnBg(0);
            gTasks[taskId].data[0] = 1;
            PrintSaveErrorStatus(taskId, gText_SaveFileCorruptedPrevWillBeLoaded);
            if (Flag_0x839_IsSet() == TRUE)
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
            LoadUserFrameToBg(0);
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].func = Task_SetWin0BldRegsNoSaveFileCheck;
            break;
        case 4:
            SetStdFrame0OnBg(0);
            gTasks[taskId].data[0] = 0;
            PrintSaveErrorStatus(taskId, gText_1MSubCircuitBoardNotInstalled);
            break;
        }
    }
}

static void PrintSaveErrorStatus(u8 taskId, const u8 *str)
{
    PrintMessageOnWindow4(str);
    gTasks[taskId].func = Task_SaveErrorStatus_RunPrinterThenWaitButton;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFFFF);
    ShowBg(0);
    SetVBlankCallback(VBlankCB_MainMenu);
}

static void Task_SaveErrorStatus_RunPrinterThenWaitButton(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        RunTextPrinters();
        if (!IsTextPrinterActive(4) && JOY_NEW(A_BUTTON))
        {
            ClearWindowTilemap(4);
            DestroyWindowBubbleFrame(&sWindowTemplate[4]);
            LoadUserFrameToBg(0);
            if (gTasks[taskId].data[0] == 0)
                gTasks[taskId].func = Task_SetWin0BldRegsNoSaveFileCheck;
            else
                gTasks[taskId].func = Task_PrintMainMenuText;
        }
    }
}

static void Task_SetWin0BldRegsNoSaveFileCheck(u8 taskId)
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
            gTasks[taskId].func = Task_ExecuteMainMenuSelection;
        else
            gTasks[taskId].func = Task_WaitFadeAndPrintMainMenuText;
    }
}

static void Task_WaitFadeAndPrintMainMenuText(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        Task_PrintMainMenuText(taskId);
    }
}

static void Task_PrintMainMenuText(u8 taskId)
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
        AddTextPrinterParameterized3(0, 2, 2, 2, sTextColor1, -1, gText_NewGame);
        DrawBubbleBorder(&sWindowTemplate[0]);
        PutWindowTilemap(0);
        CopyWindowToVram(0, 3);
        break;
    case 1:
        FillWindowPixelBuffer(1, PIXEL_FILL(10));
        FillWindowPixelBuffer(2, PIXEL_FILL(10));
        AddTextPrinterParameterized3(1, 2, 2, 2, sTextColor1, -1, gText_Continue);
        AddTextPrinterParameterized3(2, 2, 2, 2, sTextColor1, -1, gText_NewGame);
        PrintContinueStats();
        DrawBubbleBorder(&sWindowTemplate[1]);
        DrawBubbleBorder(&sWindowTemplate[2]);
        PutWindowTilemap(1);
        PutWindowTilemap(2);
        CopyWindowToVram(1, 2);
        CopyWindowToVram(2, 3);
        break;
    case 2:
        FillWindowPixelBuffer(1, PIXEL_FILL(10));
        FillWindowPixelBuffer(2, PIXEL_FILL(10));
        FillWindowPixelBuffer(3, PIXEL_FILL(10));
        AddTextPrinterParameterized3(1, 2, 2, 2, sTextColor1, -1, gText_Continue);
        AddTextPrinterParameterized3(2, 2, 2, 2, sTextColor1, -1, gText_NewGame);
        gTasks[taskId].data[10] = 1;
        AddTextPrinterParameterized3(3, 2, 2, 2, sTextColor1, -1, gText_MysteryGift);
        PrintContinueStats();
        DrawBubbleBorder(&sWindowTemplate[1]);
        DrawBubbleBorder(&sWindowTemplate[2]);
        DrawBubbleBorder(&sWindowTemplate[3]);
        PutWindowTilemap(1);
        PutWindowTilemap(2);
        PutWindowTilemap(3);
        CopyWindowToVram(1, 2);
        CopyWindowToVram(2, 2);
        CopyWindowToVram(3, 3);
        break;
    }
    gTasks[taskId].func = Task_WaitDma3AndFadeIn;
}

static void Task_WaitDma3AndFadeIn(u8 taskId)
{
    if (CheckForSpaceForDma3Request(-1) != -1)
    {
        gTasks[taskId].func = Task_UpdateVisualSelection;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFFFF);
        ShowBg(0);
        SetVBlankCallback(VBlankCB_MainMenu);
    }
}

static void Task_UpdateVisualSelection(u8 taskId)
{
    MoveWindowByMenuTypeAndCursorPos(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    gTasks[taskId].func = Task_HandleMenuInput;
}

static void Task_HandleMenuInput(u8 taskId)
{
    if (!gPaletteFade.active && HandleMenuInput(taskId))
    {
        gTasks[taskId].func = Task_UpdateVisualSelection;
    }
}

static void Task_ExecuteMainMenuSelection(u8 taskId)
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
                    SetStdFrame0OnBg(0);
                    gTasks[taskId].func = Task_MysteryGiftError;
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
            HelpSystem_Disable();
            FreeAllWindowBuffers();
            DestroyTask(taskId);
            break;
        }
    }
}

static void Task_MysteryGiftError(u8 taskId)
{
    switch (gTasks[taskId].data[9])
    {
    case 0:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        if (gTasks[taskId].data[10] == 1)
            PrintMessageOnWindow4(gText_WirelessAdapterIsNotConnected);
        else
            PrintMessageOnWindow4(gText_MysteryGiftCantBeUsedWhileWirelessAdapterIsAttached);
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
            gTasks[taskId].func = Task_ReturnToTileScreen;
        }
        break;
    }
}

static void Task_ReturnToTileScreen(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitTitleScreen);
        DestroyTask(taskId);
    }
}

static void MoveWindowByMenuTypeAndCursorPos(u8 menuType, u8 cursorPos)
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

static bool8 HandleMenuInput(u8 taskId)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        IsWirelessAdapterConnected(); // called for its side effects only
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gTasks[taskId].func = Task_ExecuteMainMenuSelection;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        SetGpuReg(REG_OFFSET_WIN0H, 0xF0);
        SetGpuReg(REG_OFFSET_WIN0V, 0xA0);
        gTasks[taskId].func = Task_ReturnToTileScreen;
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

static void PrintMessageOnWindow4(const u8 *str)
{
    FillWindowPixelBuffer(4, PIXEL_FILL(10));
    DrawBubbleBorder(&sWindowTemplate[4]);
    AddTextPrinterParameterized3(4, 2, 0, 2, sTextColor1, 2, str);
    PutWindowTilemap(4);
    CopyWindowToVram(4, 2);
    SetGpuReg(REG_OFFSET_WIN0H, 0x13DD);
    SetGpuReg(REG_OFFSET_WIN0V, 0x739D);
}

static void PrintContinueStats(void)
{
    PrintPlayerName();
    PrintDexCount();
    PrintPlayTime();
    PrintBadgeCount();
}

static void PrintPlayerName(void)
{
    s32 i;
    u8 name[OT_NAME_LENGTH + 1];
    u8 *ptr;
    AddTextPrinterParameterized3(1, 2, 2, 18, sTextColor2, -1, gText_Player);
    ptr = name;
    for (i = 0; i < OT_NAME_LENGTH; i++)
        *ptr++ = gSaveBlock2Ptr->playerName[i];
    *ptr = EOS;
    AddTextPrinterParameterized3(1, 2, 62, 18, sTextColor2, -1, name);
}

static void PrintPlayTime(void)
{
    u8 strbuf[30];
    u8 *ptr;

    AddTextPrinterParameterized3(1, 2, 2, 34, sTextColor2, -1, gText_Time);
    ptr = ConvertIntToDecimalStringN(strbuf, gSaveBlock2Ptr->playTimeHours, STR_CONV_MODE_LEFT_ALIGN, 3);
    *ptr++ = CHAR_COLON;
    ConvertIntToDecimalStringN(ptr, gSaveBlock2Ptr->playTimeMinutes, STR_CONV_MODE_LEADING_ZEROS, 2);
    AddTextPrinterParameterized3(1, 2, 62, 34, sTextColor2, -1, strbuf);
}

static void PrintDexCount(void)
{
    u8 strbuf[30];
    u8 *ptr;
    u16 dexcount;
    if (FlagGet(FLAG_0x829) == TRUE)
    {
        if (IsNationalPokedexEnabled())
            dexcount = GetNationalPokedexCount(FLAG_GET_CAUGHT);
        else
            dexcount = GetKantoPokedexCount(FLAG_GET_CAUGHT);
        AddTextPrinterParameterized3(1, 2, 2, 50, sTextColor2, -1, gText_Pokedex);
        ptr = ConvertIntToDecimalStringN(strbuf, dexcount, STR_CONV_MODE_LEFT_ALIGN, 3);
        StringAppend(ptr, gTextJPDummy_Hiki);
        AddTextPrinterParameterized3(1, 2, 62, 50, sTextColor2, -1, strbuf);
    }
}

static void PrintBadgeCount(void)
{
    u8 strbuf[30];
    u8 *ptr;
    u32 flagId;
    u8 nbadges = 0;
    for (flagId = FLAG_UNK820; flagId < FLAG_UNK820 + 8; flagId++)
    {
        if (FlagGet(flagId))
            nbadges++;
    }
    AddTextPrinterParameterized3(1, 2, 2, 66, sTextColor2, -1, gText_Badges);
    ptr = ConvertIntToDecimalStringN(strbuf, nbadges, STR_CONV_MODE_LEADING_ZEROS, 1);
    StringAppend(ptr, gTextJPDummy_Ko);
    AddTextPrinterParameterized3(1, 2, 62, 66, sTextColor2, -1, strbuf);
}

static void LoadUserFrameToBg(u8 bgId)
{
    LoadBgTiles(bgId, GetUserFrameGraphicsInfo(gSaveBlock2Ptr->optionsWindowFrameType)->tiles, 0x120, 0x1B1);
    LoadPalette(GetUserFrameGraphicsInfo(gSaveBlock2Ptr->optionsWindowFrameType)->palette, 0x20, 0x20);
    DestroyWindowBubbleFrame(&sWindowTemplate[4]);
}

static void SetStdFrame0OnBg(u8 bgId)
{
    TextWindow_SetStdFrame0_WithPal(0, 0x1B1, 0x20);
    DestroyWindowBubbleFrame(&sWindowTemplate[4]);
}

static void DrawBubbleBorder(const struct WindowTemplate * windowTemplate)
{
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B1, windowTemplate->tilemapLeft - 1, windowTemplate->tilemapTop - 1, 1, 1, 2);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B2, windowTemplate->tilemapLeft, windowTemplate->tilemapTop - 1, windowTemplate->width, windowTemplate->height, 2);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B3, windowTemplate->tilemapLeft + windowTemplate->width, windowTemplate->tilemapTop - 1, 1, 1, 2);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B4, windowTemplate->tilemapLeft - 1, windowTemplate->tilemapTop, 1, windowTemplate->height, 2);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B6, windowTemplate->tilemapLeft + windowTemplate->width, windowTemplate->tilemapTop, 1, windowTemplate->height, 2);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B7, windowTemplate->tilemapLeft - 1, windowTemplate->tilemapTop + windowTemplate->height, 1, 1, 2);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B8, windowTemplate->tilemapLeft, windowTemplate->tilemapTop + windowTemplate->height, windowTemplate->width, 1, 2);
    FillBgTilemapBufferRect(windowTemplate->bg, 0x1B9, windowTemplate->tilemapLeft + windowTemplate->width, windowTemplate->tilemapTop + windowTemplate->height, 1, 1, 2);
    CopyBgTilemapBufferToVram(windowTemplate->bg);
}

static void DestroyWindowBubbleFrame(const struct WindowTemplate * windowTemplate)
{
    FillBgTilemapBufferRect(windowTemplate->bg, 0x000, windowTemplate->tilemapLeft - 1, windowTemplate->tilemapTop - 1,  windowTemplate->tilemapLeft + windowTemplate->width + 1, windowTemplate->tilemapTop + windowTemplate->height + 1, 2);
    CopyBgTilemapBufferToVram(windowTemplate->bg);
}
