#include "global.h"
#include "gflib.h"
#include "dynamic_placeholder_text_util.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "pokedex.h"
#include "scanline_effect.h"
#include "strings.h"
#include "task.h"
#include "constants/sound.h"

struct Diploma
{
    u8 state;
    u8 gfxStep;
    u8 callbackStep;
    u16 tilemapBuffer[0x800];
};

static EWRAM_DATA struct Diploma *gDiploma = NULL;

static void DiplomaBgInit(void);
static void DiplomaPrintText(void);
static u8 DiplomaLoadGfx(void);
static void DiplomaVblankHandler(void);
static void CB2_Diploma(void);
static void Task_WaitForExit(u8);
static void Task_DiplomaInit(u8);
static void Task_DiplomaReturnToOverworld(u8);

static const u32 sDiplomaGfx[] = INCBIN_U32("graphics/diploma/diploma.4bpp.lz");
static const u32 sDiplomaTilemap[] = INCBIN_U32("graphics/diploma/diploma.bin.lz");
static const u16 sDiplomaPal[] = INCBIN_U16("graphics/diploma/diploma.gbapal");

static const u8 gUnknown_8415994[] = _("{HIGHLIGHT TRANSPARENT}プレイヤー");
static const u8 gUnknown_841599D[] = _("{HIGHLIGHT TRANSPARENT}さま");
static const u8 gUnknown_84159A3[] = _("{HIGHLIGHT TRANSPARENT}ホウエン");
static const u8 gUnknown_84159AB[] = _("{HIGHLIGHT TRANSPARENT}ぜんこく");
static const u8 gUnknown_84159B3[] = _("{HIGHLIGHT TRANSPARENT}　　　　　ポケモンずかんを\nみごと　かんせい　させた\nいだいなこうせきを　たたえ\nここに　しょうめい　します");
static const u8 gUnknown_84159ED[] = _("{COLOR DARK_GRAY}{HIGHLIGHT TRANSPARENT}ゲームフリーク");
static const u8 gUnknown_84159FB[] = _("{COLOR DARK_GRAY}{HIGHLIGHT TRANSPARENT}");

static const ALIGNED(4) u8 gUnknown_8415A04[3] = {0, 2, 3};

static const struct BgTemplate gUnknown_8415A08[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 1,
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 29,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0,
    }
};

static const struct WindowTemplate gUnknown_8415A10[] = {
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 2,
        .width = 29,
        .height = 16,
        .paletteNum = 15,
        .baseBlock = 0x000
    }, DUMMY_WIN_TEMPLATE
};

static void VCBC_DiplomaOam(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_ShowDiploma(void)
{
    gDiploma = AllocZeroed(sizeof(*gDiploma));
    gDiploma->state = 0;
    gDiploma->gfxStep = 0;
    gDiploma->callbackStep = 0;
    DiplomaBgInit();
    CreateTask(Task_DiplomaInit, 0);
    SetMainCallback2(CB2_Diploma);
}

static void CB2_Diploma(void)
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
        CopyToBgTilemapBuffer(1, sDiplomaTilemap, 0, 0);
        break;
    case 4:
        if (HasAllMons())
        {
            SetGpuReg(REG_OFFSET_BG1HOFS, 0x100);
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
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        break;
    case 8:
        SetVBlankCallback(VCBC_DiplomaOam);
        break;
    default:
        if (gPaletteFade.active)
        {
            break;
        }
        PlayFanfareByFanfareNum(FANFARE_OBTAIN_BADGE);
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
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
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
    SetMainCallback2(CB2_ReturnToFieldFromDiploma);
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
        DecompressAndCopyTileDataToVram(1, sDiplomaGfx, 0, 0, 0);
        break;
    case 2:
        if (!(FreeTempTileDataBuffersIfPossible() == 1))
        {
            break;
        }
        return 0;
    case 3:
        LoadPalette(sDiplomaPal, 0, 0x40);
    default:
        return 1;
    }
    gDiploma->gfxStep++;
    return 0;
}

static void DiplomaPrintText(void)
{
    u8 arr[160];
    u32 width;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
    if (HasAllMons())
    {
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gUnknown_841B68F);
    }
    else
    {
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gUnknown_841B698);
    }
    FillWindowPixelBuffer(0, 0);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(arr, gUnknown_841B60E);
    width = GetStringWidth(FONT_2, arr, -1);
    AddTextPrinterParameterized3(0, FONT_2, 120 - (width / 2), 4, gUnknown_8415A04, -1, arr);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(arr, gUnknown_841B619);
    width = GetStringWidth(FONT_2, arr, -1);
    AddTextPrinterParameterized3(0, FONT_2, 120 - (width / 2), 0x1E, gUnknown_8415A04, -1, arr);
    AddTextPrinterParameterized3(0, FONT_2, 120, 105, gUnknown_8415A04, 0, gUnknown_841B684);
    PutWindowTilemap(0);
}
