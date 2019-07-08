#include "constants/fanfares.h"
#include "gba/macro.h"
#include "global.h"
#include "gpu_regs.h"
#include "window.h"
#include "main.h"
#include "scanline_effect.h"
#include "task.h"
#include "unk_text_util.h"
#include "gpu_regs.h"
#include "text.h"
#include "bg.h"
#include "sound.h"
#include "malloc.h"
#include "sprite.h"
#include "palette.h"
#include "new_menu_helpers.h"
#include "menu.h"
#include "diploma.h"

void sub_80568FC(void);
u16 sub_8088F84(void);

static void DiplomaBgInit(void);
static void DiplomaPrintText(void);
static u8 DiplomaLoadGfx(void);
static void DiplomaVblankHandler(void);

static void CB2_DiplomaInit(void);

static void Task_WaitForExit(u8);
static void Task_DiplomaInit(u8);
static void Task_DiplomaReturnToOverworld(u8);

extern const struct BgTemplate gUnknown_8415A08[2];
extern const struct WindowTemplate gUnknown_8415A10[];
extern const u8 gUnknown_8402650[];
extern const u8 gUnknown_841B60E[];
extern const u8 gUnknown_841B684[];
extern u8 gUnknown_84147C0[];
extern u8 gUnknown_8415954[];
extern u8 gUnknown_841B698[];
extern u8 gUnknown_841B68F[];
extern u8 gUnknown_841B619[];
extern u8 gUnknown_8415A04[];

struct Diploma
{
    u8 state;
    u8 gfxStep;
    u8 callbackStep;
    u16 tilemapBuffer[0x800];
};

static EWRAM_DATA struct Diploma *gDiploma = NULL;

extern const u32 gUnknown_84154E8[];

static void CB2_DiplomaOam(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void DiplomaInit(void)
{
    gDiploma = AllocZeroed(sizeof(*gDiploma));
    gDiploma->state = 0;
    gDiploma->gfxStep = 0;
    gDiploma->callbackStep = 0;
    DiplomaBgInit();
    CreateTask(Task_DiplomaInit, 0);
    SetMainCallback2(CB2_DiplomaInit);
}

static void CB2_DiplomaInit(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void Task_DiplomaInit(u8 taskId)
{
    switch (gDiploma->callbackStep)
    {
    case 0:
        SetVBlankCallback(NULL);
        break;
    case 1:
        DiplomaVblankHandler();
        break;
    case 2:
        if (!DiplomaLoadGfx())
        {
            return;
        }
        break;
    case 3:
        CopyToBgTilemapBuffer(1, gUnknown_84154E8, 0, 0);
        break;
    case 4:
        if (sub_8088F84())
        {
            SetGpuReg(REG_OFFSET_BG1HOFS, 0x80 << 1);
        }
        else
        {
            SetGpuReg(REG_OFFSET_BG1HOFS, 0);
        }
        break;
    case 5:
        DiplomaPrintText();
        break;
    case 6:
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(1);
        break;
    case 7:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        break;
    case 8:
        SetVBlankCallback(CB2_DiplomaOam);
        break;
    default:
        if (gPaletteFade.active)
        {
            break;
        }
        PlayFanfareByFanfareNum(FANFARE_05);
        gTasks[taskId].func = Task_WaitForExit;
    }
    gDiploma->callbackStep++;
}

static void Task_WaitForExit(u8 taskId)
{
    switch (gDiploma->state)
    {
    case 0:
        if (WaitFanfare(0))
        {
            gDiploma->state++;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON))
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            gDiploma->state++;
        }
        break;
    case 2:
        Task_DiplomaReturnToOverworld(taskId);
        break;
    }
}

static void Task_DiplomaReturnToOverworld(u8 taskId)
{
    if (gPaletteFade.active)
        return;
    DestroyTask(taskId);
    FreeAllWindowBuffers();
    FREE_AND_SET_NULL(gDiploma);
    SetMainCallback2(sub_80568FC);
}

static void DiplomaBgInit(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetTasks();
    ScanlineEffect_Stop();
}

static void DiplomaVblankHandler(void)
{
    void *vram = (void *)VRAM;
    DmaClearLarge16(3, vram, VRAM_SIZE, 0x1000);
    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, gUnknown_8415A08, 2);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitWindows(gUnknown_8415A10);
    DeactivateAllTextPrinters();
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetBgTilemapBuffer(1, gDiploma->tilemapBuffer);
    ShowBg(0);
    ShowBg(1);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 30, 20);
}

static u8 DiplomaLoadGfx(void)
{
    switch (gDiploma->gfxStep)
    {
    case 0:
        ResetTempTileDataBuffers();
        break;
    case 1:
        DecompressAndCopyTileDataToVram(1, gUnknown_84147C0, 0, 0, 0);
        break;
    case 2:
        if (!(FreeTempTileDataBuffersIfPossible() == 1))
        {
            break;
        }
        return 0;
    case 3:
        LoadPalette(gUnknown_8415954, 0, 0x40);
    default:
        return 1;
    }
    gDiploma->gfxStep++;
    return 0;
}

static void DiplomaPrintText(void)
{
    u8 arr[160];
    uintptr_t len;
    UnkTextUtil_Reset();
    UnkTextUtil_SetPtrI(0, gSaveBlock2Ptr->playerName);
    if (sub_8088F84())
    {
        UnkTextUtil_SetPtrI(1, gUnknown_841B68F);
    }
    else
    {
        UnkTextUtil_SetPtrI(1, gUnknown_841B698);
    }
    FillWindowPixelBuffer(0, 0);
    UnkTextUtil_StringExpandPlaceholders(arr, gUnknown_841B60E);
    len = (uintptr_t)GetStringWidth(2, arr, -1);
    AddTextPrinterParameterized3(0, 2, 0x78 - (len / 2), 4, gUnknown_8415A04, -1, arr);
    UnkTextUtil_StringExpandPlaceholders(arr, gUnknown_841B619);
    len = (uintptr_t)GetStringWidth(2, arr, -1);
    AddTextPrinterParameterized3(0, 0x2, 0x78 - (len / 2), 0x1E, gUnknown_8415A04, -1, arr);
    AddTextPrinterParameterized3(0, 0x2, 0x78, 0x69, gUnknown_8415A04, 0, gUnknown_841B684);
    PutWindowTilemap(0);
}
