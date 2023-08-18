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
    u8 mainState;
    u8 gfxState;
    u8 initState;
    u16 tilemapBuffer[0x800];
};

enum {
    WIN_TEXT,
    WIN_COUNT
};

enum {
    BG_TEXT,
    BG_DIPLOMA,
};

static EWRAM_DATA struct Diploma *sDiploma = NULL;

static void DiplomaReset(void);
static void DiplomaPrintText(void);
static bool8 DiplomaLoadGfx(void);
static void DiplomaInitScreen(void);
static void CB2_Diploma(void);
static void Task_HandleDiplomaInput(u8);
static void Task_DiplomaInit(u8);
static void Task_DiplomaExit(u8);

static const u32 sDiplomaGfx[] = INCBIN_U32("graphics/diploma/diploma.4bpp.lz");
static const u32 sDiplomaTilemap[] = INCBIN_U32("graphics/diploma/diploma.bin.lz");
static const u16 sDiplomaPal[] = INCBIN_U16("graphics/diploma/diploma.gbapal");

// Leftover text from RSE (some of which is also unused there)
static const u8 sText_Player[] = _("{HIGHLIGHT TRANSPARENT}プレイヤー");
static const u8 sText_Sama[] = _("{HIGHLIGHT TRANSPARENT}さま");
static const u8 sText_Hoenn[] = _("{HIGHLIGHT TRANSPARENT}ホウエン");
static const u8 sText_National[] = _("{HIGHLIGHT TRANSPARENT}ぜんこく");
static const u8 sText_CertifiesPokedexComplete[] = _("{HIGHLIGHT TRANSPARENT}　　　　　ポケモンずかんを\n"
                                                     "みごと　かんせい　させた\n"
                                                     "いだいなこうせきを　たたえ\n"
                                                     "ここに　しょうめい　します");
static const u8 sText_GameFreak[] = _("{COLOR DARK_GRAY}{HIGHLIGHT TRANSPARENT}ゲームフリーク");
static const u8 sText_Empty[] = _("{COLOR DARK_GRAY}{HIGHLIGHT TRANSPARENT}");

static const ALIGNED(4) u8 sTextColors[3] = {0, 2, 3};

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = BG_TEXT,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 1,
    }, {
        .bg = BG_DIPLOMA,
        .charBaseIndex = 1,
        .mapBaseIndex = 29,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0,
    }
};

static const struct WindowTemplate sWindowTemplates[WIN_COUNT + 1] = {
    [WIN_TEXT] = {
        .bg = BG_TEXT,
        .tilemapLeft = 0,
        .tilemapTop = 2,
        .width = 29,
        .height = 16,
        .paletteNum = 15,
        .baseBlock = 0x000
    },
    [WIN_COUNT] = DUMMY_WIN_TEMPLATE
};

static void VBlankCB_Diploma(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_ShowDiploma(void)
{
    sDiploma = AllocZeroed(sizeof(*sDiploma));
    sDiploma->mainState = 0;
    sDiploma->gfxState = 0;
    sDiploma->initState = 0;
    DiplomaReset();
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
    switch (sDiploma->initState)
    {
    case 0:
        SetVBlankCallback(NULL);
        break;
    case 1:
        DiplomaInitScreen();
        break;
    case 2:
        if (!DiplomaLoadGfx())
            return;
        break;
    case 3:
        CopyToBgTilemapBuffer(BG_DIPLOMA, sDiplomaTilemap, 0, 0);
        break;
    case 4:
        if (HasAllMons())
            SetGpuReg(REG_OFFSET_BG1HOFS, 0x100);
        else
            SetGpuReg(REG_OFFSET_BG1HOFS, 0);
        break;
    case 5:
        DiplomaPrintText();
        break;
    case 6:
        CopyBgTilemapBufferToVram(BG_TEXT);
        CopyBgTilemapBufferToVram(BG_DIPLOMA);
        break;
    case 7:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        break;
    case 8:
        SetVBlankCallback(VBlankCB_Diploma);
        break;
    default:
        if (gPaletteFade.active)
            break;
        PlayFanfareByFanfareNum(FANFARE_OBTAIN_BADGE);
        gTasks[taskId].func = Task_HandleDiplomaInput;
    }
    sDiploma->initState++;
}

static void Task_HandleDiplomaInput(u8 taskId)
{
    switch (sDiploma->mainState)
    {
    case 0:
        if (WaitFanfare(FALSE))
            sDiploma->mainState++;
        break;
    case 1:
        if (JOY_NEW(A_BUTTON))
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            sDiploma->mainState++;
        }
        break;
    case 2:
        Task_DiplomaExit(taskId);
        break;
    }
}

static void Task_DiplomaExit(u8 taskId)
{
    if (gPaletteFade.active)
        return;
    DestroyTask(taskId);
    FreeAllWindowBuffers();
    FREE_AND_SET_NULL(sDiploma);
    SetMainCallback2(CB2_ReturnToFieldFromDiploma);
}

static void DiplomaReset(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetTasks();
    ScanlineEffect_Stop();
}

static void DiplomaInitScreen(void)
{
    void *vram = (void *)VRAM;
    DmaClearLarge16(3, vram, VRAM_SIZE, 0x1000);
    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sBgTemplates, ARRAY_COUNT(sBgTemplates));
    ChangeBgX(0, 0, BG_COORD_SET);
    ChangeBgY(0, 0, BG_COORD_SET);
    ChangeBgX(1, 0, BG_COORD_SET);
    ChangeBgY(1, 0, BG_COORD_SET);
    ChangeBgX(2, 0, BG_COORD_SET);
    ChangeBgY(2, 0, BG_COORD_SET);
    ChangeBgX(3, 0, BG_COORD_SET);
    ChangeBgY(3, 0, BG_COORD_SET);
    InitWindows(sWindowTemplates);
    DeactivateAllTextPrinters();
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetBgTilemapBuffer(BG_DIPLOMA, sDiploma->tilemapBuffer);
    ShowBg(BG_TEXT);
    ShowBg(BG_DIPLOMA);
    FillBgTilemapBufferRect_Palette0(BG_TEXT, 0, 0, 0, 30, 20);
    FillBgTilemapBufferRect_Palette0(BG_DIPLOMA, 0, 0, 0, 30, 20);
}

static bool8 DiplomaLoadGfx(void)
{
    switch (sDiploma->gfxState)
    {
    case 0:
        ResetTempTileDataBuffers();
        break;
    case 1:
        DecompressAndCopyTileDataToVram(BG_DIPLOMA, sDiplomaGfx, 0, 0, 0);
        break;
    case 2:
        if (FreeTempTileDataBuffersIfPossible() == TRUE)
            return FALSE;
        break;
    case 3:
        LoadPalette(sDiplomaPal, BG_PLTT_ID(0), sizeof(sDiplomaPal));
        // fallthrough
    default:
        // Finished
        return TRUE;
    }
    sDiploma->gfxState++;
    return FALSE;
}

static void DiplomaPrintText(void)
{
    u8 str[160];
    u32 width;
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
    if (HasAllMons())
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gText_Diploma_National);
    else
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gText_Diploma_Kanto);
    FillWindowPixelBuffer(WIN_TEXT, PIXEL_FILL(0));
    DynamicPlaceholderTextUtil_ExpandPlaceholders(str, gText_Diploma_Player);
    width = GetStringWidth(FONT_NORMAL, str, -1);
    AddTextPrinterParameterized3(WIN_TEXT, FONT_NORMAL, 120 - (width / 2), 4, sTextColors, TEXT_SKIP_DRAW, str);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(str, gText_Diploma_ThisDocument);
    width = GetStringWidth(FONT_NORMAL, str, -1);
    AddTextPrinterParameterized3(WIN_TEXT, FONT_NORMAL, 120 - (width / 2), 30, sTextColors, TEXT_SKIP_DRAW, str);
    AddTextPrinterParameterized3(WIN_TEXT, FONT_NORMAL, 120, 105, sTextColors, 0, gText_Diploma_GameFreak);
    PutWindowTilemap(WIN_TEXT);
}
