#include "global.h"
#include "gflib.h"
#include "trainer_type_levels.h"
#include "text_window.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "task.h"
#include "string_util.h"
#include "strings.h"
#include "pokemon.h"
#include "trainer_xp_system.h"
#include "constants/songs.h"
#include "constants/rgb.h"

#define TYPES_PER_PAGE 9
#define DISPLAYED_TRAINER_TYPES (NUMBER_OF_MON_TYPES - 1)
#define NUM_TYPE_PAGES ((DISPLAYED_TRAINER_TYPES + TYPES_PER_PAGE - 1) / TYPES_PER_PAGE)
#define TTL_PROGRESS_BAR_WIDTH 48
#define TTL_PROGRESS_BAR_HEIGHT 3
#define TTL_PROGRESS_BAR_BG_COLOR 3
#define TTL_PROGRESS_BAR_FILL_COLOR 15

// Window index
enum {
    WIN_TTL,
    WIN_TTL_COUNT
};

// Screen state
static u8 sCurrentPage;
static void (*sCallback)(void);

// Forward declarations
static void CB2_TrainerTypeScreen(void);
static void VBlankCB_TrainerTypeScreen(void);
static void Task_TTLInit(u8 taskId);
static void Task_TypeLevelScreen(u8 taskId);
static void Task_TTLExit(u8 taskId);
static void PrintCurrentPage(void);
static u8 GetDisplayedTrainerTypeByIndex(u8 displayIndex);
static u8 GetTrainerTypeExpProgressPixels(u8 typeId);
static void DrawTrainerTypeProgressBar(u8 windowId, u8 typeId, u16 x, u16 y);

static const struct BgTemplate sTTLBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 1
    }
};

static const struct WindowTemplate sTTLWindowTemplates[] = {
    [WIN_TTL] = {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 0,
        .width = 28,
        .height = 20,
        .paletteNum = 15,
        .baseBlock = 0x001
    },
    [WIN_TTL_COUNT] = DUMMY_WIN_TEMPLATE
};

static void CB2_TrainerTypeScreen(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_TrainerTypeScreen(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void ShowTrainerTypeScreen(void (*callback)(void))
{
    sCallback = callback;
    sCurrentPage = 0;
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetTasks();
    ScanlineEffect_Stop();
    CreateTask(Task_TTLInit, 0);
    SetMainCallback2(CB2_TrainerTypeScreen);
}

static void Task_TTLInit(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        SetVBlankCallback(NULL);
        break;
    case 1:
        DmaClearLarge16(3, (void *)VRAM, VRAM_SIZE, 0x1000);
        DmaClear32(3, (void *)OAM, OAM_SIZE);
        DmaClear16(3, (void *)PLTT, PLTT_SIZE);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, sTTLBgTemplates, ARRAY_COUNT(sTTLBgTemplates));
        ChangeBgX(0, 0, BG_COORD_SET);
        ChangeBgY(0, 0, BG_COORD_SET);
        InitWindows(sTTLWindowTemplates);
        DeactivateAllTextPrinters();
        ShowBg(0);
        break;
    case 2:
        LoadStdWindowGfxOnBg(0, 0x200, BG_PLTT_ID(14));
        LoadPalette(GetTextWindowPalette(2), BG_PLTT_ID(15), PLTT_SIZE_4BPP);
        break;
    case 3:
        PrintCurrentPage();
        break;
    case 4:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        break;
    case 5:
        SetVBlankCallback(VBlankCB_TrainerTypeScreen);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        break;
    default:
        if (gPaletteFade.active)
            return;
        gTasks[taskId].func = Task_TypeLevelScreen;
        return;
    }
    gTasks[taskId].data[0]++;
}

static void PrintCurrentPage(void)
{
    u8 startIndex = sCurrentPage * TYPES_PER_PAGE;
    u8 endIndex;
    u8 pageText[32];
    u8 *pagePtr;
    u8 y;
    u8 displayIndex;

    endIndex = (startIndex + TYPES_PER_PAGE < DISPLAYED_TRAINER_TYPES) ?
               (startIndex + TYPES_PER_PAGE) : DISPLAYED_TRAINER_TYPES;

    FillWindowPixelBuffer(WIN_TTL, PIXEL_FILL(1));

    // Print title
    AddTextPrinterParameterized(WIN_TTL, FONT_NORMAL, gText_MenuTrainerTypeLevels,
                                 4, 1, 0, NULL);

    // Print types and levels
    y = 3;
    for (displayIndex = startIndex; displayIndex < endIndex; displayIndex += 2)
    {
        u8 leftType = GetDisplayedTrainerTypeByIndex(displayIndex);

        // Left column
        if (leftType < NUMBER_OF_MON_TYPES)
        {
            u8 levelText[16];
            u8 *levelPtr;

            AddTextPrinterParameterized(WIN_TTL, FONT_NORMAL,
                                         gTrainerTypeNames[leftType],
                                         1, y * 8, 0, NULL);

            levelPtr = levelText;
            levelPtr = StringCopy(levelPtr, gText_TTL_Level);
            *levelPtr++ = CHAR_SPACE;
            ConvertIntToDecimalStringN(levelPtr, gSaveBlock2Ptr->trainerTypeLevels[leftType], STR_CONV_MODE_LEFT_ALIGN, 3);
            AddTextPrinterParameterized(WIN_TTL, FONT_NORMAL, levelText,
                                         11 * 8, y * 8, 0, NULL);
            DrawTrainerTypeProgressBar(WIN_TTL, leftType, 1 * 8, y * 8 + 11);
        }

        // Right column
        if (displayIndex + 1 < endIndex)
        {
            u8 levelText[16];
            u8 *levelPtr;
            u8 rightType = GetDisplayedTrainerTypeByIndex(displayIndex + 1);

            AddTextPrinterParameterized(WIN_TTL, FONT_NORMAL,
                                         gTrainerTypeNames[rightType],
                                         15 * 8, y * 8, 0, NULL);

            levelPtr = levelText;
            levelPtr = StringCopy(levelPtr, gText_TTL_Level);
            *levelPtr++ = CHAR_SPACE;
            ConvertIntToDecimalStringN(levelPtr, gSaveBlock2Ptr->trainerTypeLevels[rightType], STR_CONV_MODE_LEFT_ALIGN, 3);
            AddTextPrinterParameterized(WIN_TTL, FONT_NORMAL, levelText,
                                         25 * 8, y * 8, 0, NULL);
            DrawTrainerTypeProgressBar(WIN_TTL, rightType, 15 * 8, y * 8 + 11);
        }

        y += 2;
    }

    // Print page number
    pagePtr = pageText;
    pagePtr = StringCopy(pagePtr, gText_TTL_Page);
    *pagePtr++ = CHAR_SPACE;
    *pagePtr++ = CHAR_0 + sCurrentPage + 1;
    *pagePtr++ = CHAR_SLASH;
    *pagePtr++ = CHAR_0 + NUM_TYPE_PAGES;
    *pagePtr = EOS;
    AddTextPrinterParameterized(WIN_TTL, FONT_NORMAL, pageText,
                                 1, 16 * 8, 0, NULL);

    // Print instructions
    AddTextPrinterParameterized(WIN_TTL, FONT_NORMAL,
                                 gText_PressB,
                                 1, 18 * 8, 0, NULL);

    PutWindowTilemap(WIN_TTL);
    CopyWindowToVram(WIN_TTL, COPYWIN_FULL);
}

static u8 GetDisplayedTrainerTypeByIndex(u8 displayIndex)
{
    if (displayIndex >= TYPE_MYSTERY)
        return displayIndex + 1;

    return displayIndex;
}

// Returns bar fill based on XP progress to next trainer type level:
//   (currentExp - threshold(currentLevel)) / (threshold(nextLevel) - threshold(currentLevel))
static u8 GetTrainerTypeExpProgressPixels(u8 typeId)
{
    u8 level;
    u32 exp;
    u16 curThreshold;
    u16 nextThreshold;
    u32 range;
    u32 progress;

    if (typeId >= NUMBER_OF_MON_TYPES)
        return 0;

    level = gSaveBlock2Ptr->trainerTypeLevels[typeId];
    exp = gSaveBlock2Ptr->trainerTypeExp[typeId];

    if (level >= 100)
        return TTL_PROGRESS_BAR_WIDTH;

    curThreshold = GetTrainerTypeLevelThreshold(typeId, level);
    nextThreshold = GetTrainerTypeLevelThreshold(typeId, level + 1);

    if (exp <= curThreshold || nextThreshold <= curThreshold)
        return 0;

    range = nextThreshold - curThreshold;
    progress = exp - curThreshold;
    if (progress > range)
        progress = range;

    // Round to nearest pixel so tiny non-zero progress is visible sooner.
    {
        u8 pixels = (u8)((progress * TTL_PROGRESS_BAR_WIDTH + range / 2) / range);
        if (pixels == 0 && progress != 0)
            pixels = 1;
        return pixels;
    }
}

static void DrawTrainerTypeProgressBar(u8 windowId, u8 typeId, u16 x, u16 y)
{
    u8 fillWidth = GetTrainerTypeExpProgressPixels(typeId);

    FillWindowPixelRect(windowId, PIXEL_FILL(TTL_PROGRESS_BAR_BG_COLOR), x, y, TTL_PROGRESS_BAR_WIDTH, TTL_PROGRESS_BAR_HEIGHT);
    if (fillWidth != 0)
        FillWindowPixelRect(windowId, PIXEL_FILL(TTL_PROGRESS_BAR_FILL_COLOR), x, y, fillWidth, TTL_PROGRESS_BAR_HEIGHT);
}

static void Task_TypeLevelScreen(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(L_BUTTON) || JOY_NEW(R_BUTTON))
    {
        // Move to next page
        sCurrentPage = (sCurrentPage + 1) % NUM_TYPE_PAGES;
        PrintCurrentPage();
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        gTasks[taskId].func = Task_TTLExit;
    }
}

static void Task_TTLExit(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        FreeAllWindowBuffers();
        DestroyTask(taskId);
        SetMainCallback2(sCallback);
    }
}
