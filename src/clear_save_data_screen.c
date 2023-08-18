#include "global.h"
#include "gflib.h"
#include "menu.h"
#include "save.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "constants/songs.h"

struct ClearSaveDataStruct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
};

static EWRAM_DATA struct ClearSaveDataStruct * sClearSaveDataState = NULL;

static void Task_DrawClearSaveDataScreen(u8 taskId);
static void Task_HandleYesNoMenu(u8 taskId);
static void Task_CleanUpAndSoftReset(u8 taskId);
static void CB2_Sub_SaveClearScreen_Init(void);
static void SaveClearScreen_GpuInit(void);

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 5,
        .width = 6,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x00A
    }, {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 15,
        .width = 23,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x022
    }, DUMMY_WIN_TEMPLATE
};

static const u8 sTextColor[] = {
    TEXT_COLOR_WHITE,
    TEXT_COLOR_DARK_GRAY,
    TEXT_COLOR_LIGHT_GRAY
};

static void CB2_RunClearSaveDataScreen(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_WaitYesNo(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_SaveClearScreen_Init(void)
{
    sClearSaveDataState = AllocZeroed(sizeof(struct ClearSaveDataStruct));
    sClearSaveDataState->unk1 = 0;
    sClearSaveDataState->unk0 = 0;
    sClearSaveDataState->unk2 = 0;
    CB2_Sub_SaveClearScreen_Init();
    CreateTask(Task_DrawClearSaveDataScreen, 0);
    SetMainCallback2(CB2_RunClearSaveDataScreen);
}

static void Task_DrawClearSaveDataScreen(u8 taskId)
{
    switch (sClearSaveDataState->unk1)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        break;
    case 1:
        if (gPaletteFade.active)
            return;
        SetVBlankCallback(NULL);
        break;
    case 2:
        SaveClearScreen_GpuInit();
        break;
    case 3:
        LoadStdWindowGfx(0, 0x001, BG_PLTT_ID(15));
        LoadStdWindowGfx(1, 0x001, BG_PLTT_ID(15));
        break;
    case 4:
        DrawStdFrameWithCustomTileAndPalette(1, TRUE, 0x001, 15);
        AddTextPrinterParameterized4(1, FONT_NORMAL, 0, 3, 1, 1, sTextColor, 0, gText_ClearAllSaveData);
        CopyWindowToVram(1, COPYWIN_GFX);
        break;
    case 5:
        CreateYesNoMenu(&sWindowTemplates[0], FONT_NORMAL, 0, 2, 0x001, 15, 1);
        CopyBgTilemapBufferToVram(0);
        break;
    default:
        BeginNormalPaletteFade(0xFFFF, 0, 16, 0, RGB_WHITEALPHA);
        SetVBlankCallback(VBlankCB_WaitYesNo);
        gTasks[taskId].func = Task_HandleYesNoMenu;
        break;
    }
    sClearSaveDataState->unk1++;
}

static void Task_HandleYesNoMenu(u8 taskId)
{
    // agbcc refuses to keep &sClearSaveDataState in a register
    // unless explicitly told to do so as such:
    struct ClearSaveDataStruct ** r5 = &sClearSaveDataState;
    if ((*r5)->unk0 == 0)
    {
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1:
            PlaySE(SE_SELECT);
            break;
        case 0:
            PlaySE(SE_SELECT);
            FillWindowPixelBuffer(1, PIXEL_FILL(1));
            AddTextPrinterParameterized4(1, FONT_NORMAL, 0, 3, 1, 1, sTextColor, 0, gText_ClearingData);
            CopyWindowToVram(1, COPYWIN_FULL);
            ClearSaveData();
            break;
        case MENU_NOTHING_CHOSEN:
        default:
            return;
        }
        (*r5)->unk0++;
    }
    else
    {
        Task_CleanUpAndSoftReset(taskId);
    }
}

static void Task_CleanUpAndSoftReset(u8 taskId)
{
    switch (sClearSaveDataState->unk2)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFF, 0, 0, 16, RGB_WHITEALPHA);
        sClearSaveDataState->unk2++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            DestroyYesNoMenu();
            DestroyTask(taskId);
            FreeAllWindowBuffers();
            FREE_AND_SET_NULL(sClearSaveDataState);
            DoSoftReset();
            // noreturn
        }
        break;
    }
}

static void CB2_Sub_SaveClearScreen_Init(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    ResetTasks();
}

static void SaveClearScreen_GpuInit(void)
{
    DmaClearLarge16(3, (void *)VRAM, VRAM_SIZE, 0x1000);
    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);

    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitWindows(sWindowTemplates);
    DeactivateAllTextPrinters();
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    ShowBg(0);
}
