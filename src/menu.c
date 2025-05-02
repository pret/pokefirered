#include "global.h"
#include "gflib.h"
#include "field_specials.h"
#include "field_weather.h"
#include "graphics.h"
#include "help_message.h"
#include "menu.h"
#include "menu_helpers.h"
#include "pokemon_icon.h"
#include "quest_log.h"
#include "script.h"
#include "strings.h"
#include "text_window.h"
#include "constants/songs.h"

#define DLG_WINDOW_PALETTE_NUM 15
#define DLG_WINDOW_BASE_TILE_NUM 0x200
#define STD_WINDOW_PALETTE_NUM 14
#define STD_WINDOW_PALETTE_SIZE PLTT_SIZEOF(10)
#define STD_WINDOW_BASE_TILE_NUM 0x214

struct MenuInfoIcon
{
    u8 width;
    u8 height;
    u16 offset;
};

struct Menu
{
    u8 left;
    u8 top;
    s8 cursorPos;
    s8 minCursorPos;
    s8 maxCursorPos;
    u8 windowId;
    u8 fontId;
    u8 optionWidth;
    u8 optionHeight;
    u8 columns;
    u8 rows;
    bool8 APressMuted;
};

static EWRAM_DATA u8 sStartMenuWindowId = {0};
static EWRAM_DATA struct Menu sMenu = {0};
static EWRAM_DATA u16 sTileNum = 0;
static EWRAM_DATA u8 sPaletteNum = 0;
static EWRAM_DATA u8 sYesNoWindowId = 0;
static EWRAM_DATA u8 sTopBarWindowId = 0;
static EWRAM_DATA u8 sMapNamePopupWindowId = 0;
static EWRAM_DATA u8 sSecondaryPopupWindowId = 0;
static EWRAM_DATA bool8 sScheduledBgCopiesToVram[4] = {FALSE};
static EWRAM_DATA void *sTempTileDataBuffers[0x20] = {NULL};
static EWRAM_DATA u16 sTempTileDataBufferCursor = {0};


static u16 AddWindowParameterized(u8, u8, u8, u8, u8, u8, u16);
static void WindowFunc_DrawStandardFrame(u8, u8, u8, u8, u8, u8);
static void WindowFunc_DrawDialogueFrame(u8, u8, u8, u8, u8, u8);
static void WindowFunc_ClearStdWindowAndFrame(u8, u8, u8, u8, u8, u8);
static void WindowFunc_ClearDialogWindowAndFrame(u8, u8, u8, u8, u8, u8);
static void WindowFunc_DrawDialogFrameWithCustomTileAndPalette(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_ClearDialogWindowAndFrameNullPalette(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_DrawStdFrameWithCustomTileAndPalette(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_ClearStdWindowAndFrameToTransparent(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static u8 MultichoiceGrid_MoveCursor(s8 deltaX, s8 deltaY);
static void TaskFreeBufAfterCopyingTileDataToVram(u8 taskId);
static u16 CopyDecompressedTileDataToVram(u8 bgId, const void *src, u16 size, u16 offset, u8 mode);


static const u16 sUnusedWindow_Gfx[] = INCBIN_U16("graphics/text_window/unused.4bpp");

const u16 gStandardMenuPalette[] = INCBIN_U16("graphics/interface/std_menu.gbapal");

static const u8 sTextSpeedFrameDelays[] =
{
    [OPTIONS_TEXT_SPEED_SLOW] = 8,
    [OPTIONS_TEXT_SPEED_MID]  = 4,
    [OPTIONS_TEXT_SPEED_FAST] = 1
};

static const struct WindowTemplate sStandardTextBox_WindowTemplates[] = 
{
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = DLG_WINDOW_PALETTE_NUM,
        .baseBlock = 0x198,
    },
    DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sYesNo_WindowTemplate = 
{
    .bg = 0,
    .tilemapLeft = 21,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = DLG_WINDOW_PALETTE_NUM,
    .baseBlock = 0x125,
};

static const u8 sTopBarWindowTextColors[3] = {TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY};

static const struct MenuInfoIcon sMenuInfoIcons[] =
{   // { width, height, offset }
    [MENU_INFO_ICON_CAUGHT] = { 12, 12, 0x00 },
    [TYPE_NORMAL + 1]   = { 32, 12, 0x20 },
    [TYPE_FIGHTING + 1] = { 32, 12, 0x64 },
    [TYPE_FLYING + 1]   = { 32, 12, 0x60 },
    [TYPE_POISON + 1]   = { 32, 12, 0x80 },
    [TYPE_GROUND + 1]   = { 32, 12, 0x48 },
    [TYPE_ROCK + 1]     = { 32, 12, 0x44 },
    [TYPE_BUG + 1]      = { 32, 12, 0x6C },
    [TYPE_GHOST + 1]    = { 32, 12, 0x68 },
    [TYPE_STEEL + 1]    = { 32, 12, 0x88 },
    [TYPE_MYSTERY + 1]  = { 32, 12, 0xA4 },
    [TYPE_FIRE + 1]     = { 32, 12, 0x24 },
    [TYPE_WATER + 1]    = { 32, 12, 0x28 },
    [TYPE_GRASS + 1]    = { 32, 12, 0x2C },
    [TYPE_ELECTRIC + 1] = { 32, 12, 0x40 },
    [TYPE_PSYCHIC + 1]  = { 32, 12, 0x84 },
    [TYPE_ICE + 1]      = { 32, 12, 0x4C },
    [TYPE_DRAGON + 1]   = { 32, 12, 0xA0 },
    [TYPE_DARK + 1]     = { 32, 12, 0x8C },
    [TYPE_FAIRY + 1]    = { 32, 12, 0x0C },
    [MENU_INFO_ICON_TYPE]      = { 40, 12, 0xA8 },
    [MENU_INFO_ICON_POWER]     = { 40, 12, 0xC0 },
    [MENU_INFO_ICON_ACCURACY]  = { 40, 12, 0xC8 },
    [MENU_INFO_ICON_PP]        = { 40, 12, 0xE0 },
    [MENU_INFO_ICON_EFFECT]    = { 40, 12, 0xE8 },
};

void InitStandardTextBoxWindows(void)
{
    InitWindows(sStandardTextBox_WindowTemplates);
    sStartMenuWindowId = WINDOW_NONE;;
    MapNamePopupWindowIdSetDummy();
    InitPopupWindows();
}

void FreeAllOverworldWindowBuffers(void)
{
    FreeAllWindowBuffers();
}

void InitTextBoxGfxAndPrinters(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    DeactivateAllTextPrinters();
    LoadMessageBoxAndBorderGfx();
}

u16 RunTextPrintersAndIsPrinter0Active(void)
{
    RunTextPrinters();
    return IsTextPrinterActive(0);
}

u16 AddTextPrinterParameterized2(u8 windowId, u8 fontId, const u8 *str, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16), u8 fgColor, u8 bgColor, u8 shadowColor)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = 0;
    printer.y = 1;
    printer.currentX = 0;
    printer.currentY = 1;
    printer.letterSpacing = 1;
    printer.lineSpacing = 1;
    printer.unk = 0;
    printer.fgColor = fgColor;
    printer.bgColor = bgColor;
    printer.shadowColor = shadowColor;
    gTextFlags.useAlternateDownArrow = 0;
    return AddTextPrinter(&printer, speed, callback);
}

void AddTextPrinterForMessage(bool8 allowSkippingDelayWithButtonPress)
{
    u8 color;
    void *nptr = NULL;

    gTextFlags.canABSpeedUpPrint = allowSkippingDelayWithButtonPress;    
    color = ContextNpcGetTextColor();
    if (color == NPC_TEXT_COLOR_MALE)
        AddTextPrinterParameterized2(0, FONT_MALE, gStringVar4, GetPlayerTextSpeedDelay(), nptr, TEXT_COLOR_BLUE, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
    else if (color == NPC_TEXT_COLOR_FEMALE)
        AddTextPrinterParameterized2(0, FONT_FEMALE, gStringVar4, GetPlayerTextSpeedDelay(), nptr, TEXT_COLOR_RED, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
    else // NPC_TEXT_COLOR_MON / NPC_TEXT_COLOR_NEUTRAL
        AddTextPrinterParameterized2(0, FONT_NORMAL, gStringVar4, GetPlayerTextSpeedDelay(), nptr, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
}

void AddTextPrinterForMessage_2(bool8 allowSkippingDelayWithButtonPress)
{
    gTextFlags.canABSpeedUpPrint = allowSkippingDelayWithButtonPress;
    AddTextPrinterParameterized2(0, FONT_NORMAL, gStringVar4, GetPlayerTextSpeedDelay(), NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
}

void AddTextPrinterWithCustomSpeedForMessage(bool8 allowSkippingDelayWithButtonPress, u8 speed)
{
    gTextFlags.canABSpeedUpPrint = allowSkippingDelayWithButtonPress;
    AddTextPrinterParameterized2(0, FONT_NORMAL, gStringVar4, speed, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
}

void LoadMessageBoxAndBorderGfx(void)
{
    if (gQuestLogState == QL_STATE_PLAYBACK)
    {
        gTextFlags.autoScroll = 1;
        LoadQuestLogWindowTiles(0, DLG_WINDOW_BASE_TILE_NUM);
    }
    else
    {
        Menu_LoadStdPal();
        LoadMessageBoxGfx(0, DLG_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(DLG_WINDOW_PALETTE_NUM));
    }
    LoadUserWindowBorderGfx(0, STD_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(STD_WINDOW_PALETTE_NUM));
}

void DrawDialogueFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_DrawDialogueFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
}

void DrawStdWindowFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_DrawStandardFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
}

void ClearDialogWindowAndFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_ClearDialogWindowAndFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    ClearWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
    if (gQuestLogState == QL_STATE_PLAYBACK)
        CommitQuestLogWindow1();
}

void ClearStdWindowAndFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_ClearStdWindowAndFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    ClearWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void WindowFunc_DrawStandardFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    int i;

    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 0, tilemapLeft - 1, tilemapTop - 1, 1, 1, STD_WINDOW_PALETTE_NUM);
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 1, tilemapLeft, tilemapTop - 1, width, 1, STD_WINDOW_PALETTE_NUM);
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 2, tilemapLeft + width, tilemapTop - 1, 1, 1, STD_WINDOW_PALETTE_NUM);
    for (i = tilemapTop; i < tilemapTop + height; i++)
    {
        FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 3, tilemapLeft - 1, i, 1, 1, STD_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 5, tilemapLeft + width, i, 1, 1, STD_WINDOW_PALETTE_NUM);
    }
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 6, tilemapLeft - 1, tilemapTop + height, 1, 1, STD_WINDOW_PALETTE_NUM);
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 7, tilemapLeft, tilemapTop + height, width, 1, STD_WINDOW_PALETTE_NUM);
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 8, tilemapLeft + width, tilemapTop + height, 1, 1, STD_WINDOW_PALETTE_NUM);
}

static void WindowFunc_DrawDialogueFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    if (!IsMsgSignpost() || gQuestLogState == QL_STATE_PLAYBACK)
    {
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 0, tilemapLeft - 2, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 1, tilemapLeft - 1, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 2, tilemapLeft, tilemapTop - 1, width, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 3, tilemapLeft + width, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 4, tilemapLeft + width + 1, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 5, tilemapLeft - 2, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 6, tilemapLeft - 1, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 8, tilemapLeft + width, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 9, tilemapLeft + width + 1, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 10, tilemapLeft - 2, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 11, tilemapLeft - 1, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 12, tilemapLeft + width, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 13, tilemapLeft + width + 1, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 10), tilemapLeft - 2, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 11), tilemapLeft - 1, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 12), tilemapLeft + width, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 13), tilemapLeft + width + 1, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 5), tilemapLeft - 2, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 6), tilemapLeft - 1, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 8), tilemapLeft + width, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 9), tilemapLeft + width + 1, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 0), tilemapLeft - 2, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 1), tilemapLeft - 1, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 2), tilemapLeft, tilemapTop + 4, width, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 3), tilemapLeft + width, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 4), tilemapLeft + width + 1, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
    }
    else
    {
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 0, tilemapLeft - 2, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 1, tilemapLeft - 1, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 2, tilemapLeft, tilemapTop - 1, width, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 3, tilemapLeft + width, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 4, tilemapLeft + width + 1, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 5, tilemapLeft - 2, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 6, tilemapLeft - 1, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 8, tilemapLeft + width, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 9, tilemapLeft + width + 1, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 10, tilemapLeft - 2, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 11, tilemapLeft - 1, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 12, tilemapLeft + width, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 13, tilemapLeft + width + 1, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 5), tilemapLeft - 2, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 6), tilemapLeft - 1, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 8), tilemapLeft + width, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 9), tilemapLeft + width + 1, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 10), tilemapLeft - 2, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 11), tilemapLeft - 1, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 12), tilemapLeft + width, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 13), tilemapLeft + width + 1, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 0), tilemapLeft - 2, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 1), tilemapLeft - 1, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 2), tilemapLeft, tilemapTop + 4, width, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 3), tilemapLeft + width, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 4), tilemapLeft + width + 1, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
    }
}

static void WindowFunc_ClearStdWindowAndFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    FillBgTilemapBufferRect(bg, 0, tilemapLeft - 1, tilemapTop - 1, width + 2, height + 2, STD_WINDOW_PALETTE_NUM);
}

static void WindowFunc_ClearDialogWindowAndFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    FillBgTilemapBufferRect(bg, 0, tilemapLeft - 2, tilemapTop - 1, width + 4, height + 2, STD_WINDOW_PALETTE_NUM);
}

void SetStandardWindowBorderStyle(u8 windowId, bool8 copyToVram)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, copyToVram, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM);
}

void LoadMessageBoxAndFrameGfx(u8 windowId, bool8 copyToVram)
{
    if (gQuestLogState == QL_STATE_PLAYBACK)
    {
        gTextFlags.autoScroll = 1;
        LoadQuestLogWindowTiles(0, DLG_WINDOW_BASE_TILE_NUM);
    }
    else
    {
        LoadMessageBoxGfx(windowId, DLG_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(DLG_WINDOW_PALETTE_NUM));
    }
    DrawDialogFrameWithCustomTileAndPalette(windowId, copyToVram, DLG_WINDOW_BASE_TILE_NUM, DLG_WINDOW_PALETTE_NUM);
}

void Menu_LoadStdPal(void)
{
    LoadPalette(gStandardMenuPalette, BG_PLTT_ID(STD_WINDOW_PALETTE_NUM), PLTT_SIZEOF(10));
}

void Menu_LoadStdPalAt(u16 offset)
{
    LoadPalette(gStandardMenuPalette, offset, PLTT_SIZEOF(10));
}

void DisplayItemMessageOnField(u8 taskId, u8 fontId, const u8 *string, TaskFunc callback)
{
    LoadMessageBoxAndBorderGfx();
    DisplayMessageAndContinueTask(taskId, 0, DLG_WINDOW_BASE_TILE_NUM, DLG_WINDOW_PALETTE_NUM, fontId, GetPlayerTextSpeedDelay(), string, callback);
    CopyWindowToVram(0, COPYWIN_FULL);
}

void DisplayYesNoMenuDefaultYes(void)
{
    CreateYesNoMenuAtPos(&sYesNo_WindowTemplate, FONT_NORMAL, 0, 2, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM, 0);
}

void DisplayYesNoMenuWithDefault(void)
{
    CreateYesNoMenuAtPos(&sYesNo_WindowTemplate, FONT_NORMAL, 0, 2, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM, 1);
}

u8 GetPlayerTextSpeedDelay(void)
{
    if (gSaveBlock2Ptr->optionsTextSpeed > OPTIONS_TEXT_SPEED_FAST)
        gSaveBlock2Ptr->optionsTextSpeed = OPTIONS_TEXT_SPEED_MID;
    return sTextSpeedFrameDelays[gSaveBlock2Ptr->optionsTextSpeed];
}

u8 AddStartMenuWindow(u8 height)
{
    if (sStartMenuWindowId == WINDOW_NONE)
    {
        struct WindowTemplate template = CreateWindowTemplate(0, 0x16, 1, 7, height * 2 - 1, DLG_WINDOW_PALETTE_NUM, 0x13D);
        sStartMenuWindowId = AddWindow(&template);
        PutWindowTilemap(sStartMenuWindowId);
    }
    return sStartMenuWindowId;
}

u8 GetStartMenuWindowId(void)
{
    return sStartMenuWindowId;
}

void RemoveStartMenuWindow(void)
{
    if (sStartMenuWindowId != WINDOW_NONE)
    {
        RemoveWindow(sStartMenuWindowId);
        sStartMenuWindowId = WINDOW_NONE;
    }
}

u8 AddMapNamePopUpWindow(void)
{
    if (sMapNamePopupWindowId == WINDOW_NONE)
    {
        if (OW_POPUP_GENERATION == GEN_5)
            sMapNamePopupWindowId = AddWindowParameterized(0, 0, 0, 30, 3, 14, 0x107);
        else
            sMapNamePopupWindowId = AddWindowParameterized(0, 1, 1, 10, 3, 14, 0x107);
    }
    return sMapNamePopupWindowId;
}

u8 GetMapNamePopUpWindowId(void)
{
    return sMapNamePopupWindowId;
}

void RemoveMapNamePopUpWindow(void)
{
    if (sMapNamePopupWindowId != WINDOW_NONE)
    {
        RemoveWindow(sMapNamePopupWindowId);
        sMapNamePopupWindowId = WINDOW_NONE;
    }
}

void EraseFieldMessageBox(bool8 copyToVram)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 0x20, 0x20, 17);
    if (copyToVram == TRUE)
        CopyBgTilemapBufferToVram(0);
}

void DrawDialogFrameWithCustomTileAndPalette(u8 windowId, bool8 copyToVram, u16 tileNum, u8 paletteNum)
{
    sTileNum = tileNum;
    sPaletteNum = paletteNum;
    CallWindowFunction(windowId, WindowFunc_DrawDialogFrameWithCustomTileAndPalette);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void WindowFunc_DrawDialogFrameWithCustomTileAndPalette(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    FillBgTilemapBufferRect(bg, sTileNum,                      tilemapLeft - 2,         tilemapTop - 1, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 1,                  tilemapLeft - 1,         tilemapTop - 1, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 2,                  tilemapLeft,             tilemapTop - 1, width, 1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 3,                  tilemapLeft + width,     tilemapTop - 1, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 4,                  tilemapLeft + width + 1, tilemapTop - 1, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 5,                  tilemapLeft - 2,         tilemapTop,     1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 6,                  tilemapLeft - 1,         tilemapTop,     1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 8,                  tilemapLeft + width,     tilemapTop,     1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 9,                  tilemapLeft + width + 1, tilemapTop,     1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 10,                 tilemapLeft - 2,         tilemapTop + 1, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 11,                 tilemapLeft - 1,         tilemapTop + 1, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 12,                 tilemapLeft + width,     tilemapTop + 1, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 13,                 tilemapLeft + width + 1, tilemapTop + 1, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 10), tilemapLeft - 2,         tilemapTop + 2, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 11), tilemapLeft - 1,         tilemapTop + 2, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 12), tilemapLeft + width,     tilemapTop + 2, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 13), tilemapLeft + width + 1, tilemapTop + 2, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 5),  tilemapLeft - 2,         tilemapTop + 3, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 6),  tilemapLeft - 1,         tilemapTop + 3, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 8),  tilemapLeft + width,     tilemapTop + 3, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 9),  tilemapLeft + width + 1, tilemapTop + 3, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum),      tilemapLeft - 2,         tilemapTop + 4, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 1),  tilemapLeft - 1,         tilemapTop + 4, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 2),  tilemapLeft,             tilemapTop + 4, width, 1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 3),  tilemapLeft + width,     tilemapTop + 4, 1,     1, sPaletteNum);
    FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(sTileNum + 4),  tilemapLeft + width + 1, tilemapTop + 4, 1,     1, sPaletteNum);
}

void ClearDialogWindowAndFrameToTransparent(u8 windowId, bool8 copyToVram)
{
    // The palette slot doesn't matter, since the tiles are transparent.
    CallWindowFunction(windowId, WindowFunc_ClearDialogWindowAndFrameNullPalette);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(0));
    ClearWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void WindowFunc_ClearDialogWindowAndFrameNullPalette(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    FillBgTilemapBufferRect(bg, 0, tilemapLeft - 2, tilemapTop - 1, width + 4, height + 2, 0);
}

void DrawStdFrameWithCustomTileAndPalette(u8 windowId, bool8 copyToVram, u16 baseTileNum, u8 paletteNum)
{
    sTileNum = baseTileNum;
    sPaletteNum = paletteNum;
    CallWindowFunction(windowId, WindowFunc_DrawStdFrameWithCustomTileAndPalette);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void WindowFunc_DrawStdFrameWithCustomTileAndPalette(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    FillBgTilemapBufferRect(bg, sTileNum,     tilemapLeft - 1,     tilemapTop - 1,      1,     1,      sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 1, tilemapLeft,         tilemapTop - 1,      width, 1,      sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 2, tilemapLeft + width, tilemapTop - 1,      1,     1,      sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 3, tilemapLeft - 1,     tilemapTop,          1,     height, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 5, tilemapLeft + width, tilemapTop,          1,     height, sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 6, tilemapLeft - 1,     tilemapTop + height, 1,     1,      sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 7, tilemapLeft,         tilemapTop + height, width, 1,      sPaletteNum);
    FillBgTilemapBufferRect(bg, sTileNum + 8, tilemapLeft + width, tilemapTop + height, 1,     1,      sPaletteNum);
}

void ClearStdWindowAndFrameToTransparent(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_ClearStdWindowAndFrameToTransparent);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(0));
    ClearWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void WindowFunc_ClearStdWindowAndFrameToTransparent(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    FillBgTilemapBufferRect(bg, 0, tilemapLeft - 1, tilemapTop - 1, width + 2, height + 2, 0);
}

/*
   The following functions are used for handling top bar window
   in hall of fame screen and story mode screen before oak intro. 
   However, you can still designate a yPos value to place that bar
   as well as the bar width.
   The xPos is simply computed according to width (always right aligned). 
*/
u8 HofPCTopBar_AddWindow(u8 bg, u8 width, u8 yPos, u8 palette, u16 baseTile)
{
    struct WindowTemplate window;

    memset(&window, 0, sizeof(window));
    if (bg > 3)
        window.bg = 0;
    else
        window.bg = bg;
    window.tilemapTop = yPos;
    window.height = 2;
    window.tilemapLeft = 0x1E - width;
    window.width = width;
    window.paletteNum = palette;
    window.baseBlock = baseTile;
    sTopBarWindowId = AddWindow(&window);
    if (palette > 15)
        palette = BG_PLTT_ID(15);
    else
        palette = BG_PLTT_ID(palette);
    LoadPalette(GetTextWindowPalette(2), palette, PLTT_SIZE_4BPP);
    return sTopBarWindowId;
}

void HofPCTopBar_Print(const u8 *string, u8 unused, bool8 copyToVram)
{
    s32 width;

    if (sTopBarWindowId != WINDOW_NONE)
    {
        PutWindowTilemap(sTopBarWindowId);
        FillWindowPixelBuffer(sTopBarWindowId, PIXEL_FILL(15));
        width = GetStringWidth(FONT_SMALL, string, 0);
        AddTextPrinterParameterized3(sTopBarWindowId, FONT_SMALL, -20 - width, 1, sTopBarWindowTextColors, 0, string);
        if (copyToVram)
            CopyWindowToVram(sTopBarWindowId, COPYWIN_FULL);
    }
}

void HofPCTopBar_PrintPair(const u8 *string, const u8 *string2, bool8 fgColorChooser, u8 unused, bool8 copyToVram)
{
    u8 color[3];
    s32 width;

    if (sTopBarWindowId != WINDOW_NONE)
    {
        if (fgColorChooser)
        {
            color[0] = TEXT_COLOR_TRANSPARENT;
            color[1] = TEXT_COLOR_WHITE;
            color[2] = TEXT_COLOR_DARK_GRAY;
        }
        else
        {
            color[0] = TEXT_DYNAMIC_COLOR_6;
            color[1] = TEXT_COLOR_WHITE;
            color[2] = TEXT_COLOR_DARK_GRAY;
        }

        PutWindowTilemap(sTopBarWindowId);
        FillWindowPixelBuffer(sTopBarWindowId, PIXEL_FILL(15));
        if (string2)
        {
            width = GetStringWidth(FONT_SMALL, string2, 0);
            AddTextPrinterParameterized3(sTopBarWindowId, FONT_SMALL, -20 - width, 1, color, 0, string2);
        }
        AddTextPrinterParameterized4(sTopBarWindowId, FONT_NORMAL_COPY_1, 4, 1, 0, 0, color, 0, string);
        if (copyToVram)
            CopyWindowToVram(sTopBarWindowId, COPYWIN_FULL);
    }
}

void HofPCTopBar_Clear(void)
{
    if (sTopBarWindowId != WINDOW_NONE)
    {
        FillWindowPixelBuffer(sTopBarWindowId, PIXEL_FILL(15));
        CopyWindowToVram(sTopBarWindowId, COPYWIN_FULL);
    }
}

void HofPCTopBar_RemoveWindow(void)
{
    if (sTopBarWindowId != WINDOW_NONE)
    {
        FillWindowPixelBuffer(sTopBarWindowId, PIXEL_FILL(0));
        ClearWindowTilemap(sTopBarWindowId);
        CopyWindowToVram(sTopBarWindowId, COPYWIN_FULL);
        RemoveWindow(sTopBarWindowId);
        sTopBarWindowId = WINDOW_NONE;
    }
}

static u8 InitMenu(u8 windowId, u8 fontId, u8 left, u8 top, u8 cursorHeight, u8 numChoices, u8 initialCursorPos, bool8 APressMuted)
{
    s32 pos;

    sMenu.left = left;
    sMenu.top = top;
    sMenu.minCursorPos = 0;
    sMenu.maxCursorPos = numChoices - 1;
    sMenu.windowId = windowId;
    sMenu.fontId = fontId;
    sMenu.optionHeight = cursorHeight;
    sMenu.APressMuted = APressMuted;
    pos = initialCursorPos;
    if (pos < 0 || pos > sMenu.maxCursorPos)
        sMenu.cursorPos = 0;
    else
        sMenu.cursorPos = pos;

    Menu_MoveCursor(0);
    return sMenu.cursorPos;
}

u8 InitMenuNormal(u8 windowId, u8 fontId, u8 left, u8 top, u8 cursorHeight, u8 numChoices, u8 initialCursorPos)
{
    return InitMenu(windowId, fontId, left, top, cursorHeight, numChoices, initialCursorPos, 0);
}

static void RedrawMenuCursor(u8 oldPos, u8 newPos)
{
    u8 width, height;

    width = GetMenuCursorDimensionByFont(sMenu.fontId, 0);
    height = GetMenuCursorDimensionByFont(sMenu.fontId, 1);
    FillWindowPixelRect(sMenu.windowId, 1, sMenu.left, sMenu.optionHeight * oldPos + sMenu.top, width, height);
    AddTextPrinterParameterized(sMenu.windowId, sMenu.fontId, gText_SelectorArrow2, sMenu.left, sMenu.optionHeight * newPos + sMenu.top, 0, 0);
}

u8 Menu_MoveCursor(s8 cursorDelta)
{
    u8 oldPos = sMenu.cursorPos;
    s32 newPos = sMenu.cursorPos + cursorDelta;

    if (newPos < sMenu.minCursorPos)
        sMenu.cursorPos = sMenu.maxCursorPos;
    else if (newPos > sMenu.maxCursorPos)
        sMenu.cursorPos = sMenu.minCursorPos;
    else
        sMenu.cursorPos += cursorDelta;
    RedrawMenuCursor(oldPos, sMenu.cursorPos);
    return sMenu.cursorPos;
}

u8 Menu_MoveCursorNoWrapAround(s8 cursorDelta)
{
    u8 oldPos = sMenu.cursorPos;
    s32 newPos = sMenu.cursorPos + cursorDelta;

    if (newPos < sMenu.minCursorPos)
        sMenu.cursorPos = sMenu.minCursorPos;
    else if (newPos > sMenu.maxCursorPos)
        sMenu.cursorPos = sMenu.maxCursorPos;
    else
        sMenu.cursorPos += cursorDelta;

    RedrawMenuCursor(oldPos, sMenu.cursorPos);
    return sMenu.cursorPos;
}

u8 Menu_GetCursorPos(void)
{
    return sMenu.cursorPos;
}

s8 Menu_ProcessInput(void)
{
    if (JOY_NEW(A_BUTTON))
    {
        if (!sMenu.APressMuted)
            PlaySE(SE_SELECT);
        return sMenu.cursorPos;
    }
    if (JOY_NEW(B_BUTTON))
    {
        return MENU_B_PRESSED;
    }
    if (JOY_NEW(DPAD_UP))
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(-1);
        return MENU_NOTHING_CHOSEN;
    }
    if (JOY_NEW(DPAD_DOWN))
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(1);
        return MENU_NOTHING_CHOSEN;
    }
    return MENU_NOTHING_CHOSEN;
}

s8 Menu_ProcessInputNoWrap(void)
{
    u8 oldPos = sMenu.cursorPos;

    if (JOY_NEW(A_BUTTON))
    {
        if (!sMenu.APressMuted)
            PlaySE(SE_SELECT);
        return sMenu.cursorPos;
    }
    if (JOY_NEW(B_BUTTON))
    {
        return MENU_B_PRESSED;
    }
    if (JOY_NEW(DPAD_UP))
    {
        if (oldPos != Menu_MoveCursorNoWrapAround(-1))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    if (JOY_NEW(DPAD_DOWN))
    {
        if (oldPos != Menu_MoveCursorNoWrapAround(1))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    return MENU_NOTHING_CHOSEN;
}

s8 ProcessMenuInput_other(void)
{
    if (JOY_NEW(A_BUTTON))
    {
        if (!sMenu.APressMuted)
            PlaySE(SE_SELECT);
        return sMenu.cursorPos;
    }
    if (JOY_NEW(B_BUTTON))
    {
        return MENU_B_PRESSED;
    }
    if (JOY_REPT(DPAD_ANY) == DPAD_UP)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(-1);
        return MENU_NOTHING_CHOSEN;
    }
    if (JOY_REPT(DPAD_ANY) == DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(1);
        return MENU_NOTHING_CHOSEN;
    }
    return MENU_NOTHING_CHOSEN;
}

s8 Menu_ProcessInputNoWrapAround_other(void)
{
    u8 oldPos = sMenu.cursorPos;

    if (JOY_NEW(A_BUTTON))
    {
        if (!sMenu.APressMuted)
            PlaySE(SE_SELECT);
        return sMenu.cursorPos;
    }
    if (JOY_NEW(B_BUTTON))
    {
        return MENU_B_PRESSED;
    }
    if (JOY_REPT(DPAD_ANY) == DPAD_UP)
    {
        if (oldPos != Menu_MoveCursorNoWrapAround(-1))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    if (JOY_REPT(DPAD_ANY) == DPAD_DOWN)
    {
        if (oldPos != Menu_MoveCursorNoWrapAround(1))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    return MENU_NOTHING_CHOSEN;
}

void PrintMenuActionTextsAtPos(u8 windowId, u8 fontId, u8 left, u8 top, u8 lineHeight, u8 itemCount, const struct MenuAction *strs)
{
    u8 i;

    for (i = 0; i < itemCount; i++)
        AddTextPrinterParameterized(windowId, fontId, strs[i].text, left, (lineHeight * i) + top, TEXT_SKIP_DRAW, NULL);
    CopyWindowToVram(windowId, COPYWIN_GFX);
}

void PrintMenuActionTextsWithSpacing(u8 windowId, u8 fontId, u8 left, u8 top, u8 lineHeight, u8 itemCount, const struct MenuAction *strs, u8 letterSpacing, u8 lineSpacing)
{
    u8 i;

    for (i = 0; i < itemCount; i++)
        AddTextPrinterParameterized5(windowId, fontId, strs[i].text, left, (lineHeight * i) + top, TEXT_SKIP_DRAW, NULL, letterSpacing, lineSpacing);
    CopyWindowToVram(windowId, COPYWIN_GFX);
}

void PrintMenuActionTextsAtTop(u8 windowId, u8 fontId, u8 lineHeight, u8 itemCount, const struct MenuAction *strs)
{
    u8 left = GetMenuCursorDimensionByFont(fontId, 0);

    PrintMenuActionTextsAtPos(windowId, fontId, left, 0, lineHeight, itemCount, strs);
}

void PrintMenuActionTexts(u8 windowId, u8 fontId, u8 left, u8 top, u8 letterSpacing, u8 lineHeight, u8 itemCount, const struct MenuAction *strs, const u8 *orderArray)
{
    u8 i;
    struct TextPrinterTemplate printer;

    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.fgColor = GetFontAttribute(fontId, FONTATTR_COLOR_FOREGROUND);
    printer.bgColor = GetFontAttribute(fontId, FONTATTR_COLOR_BACKGROUND);
    printer.shadowColor = GetFontAttribute(fontId, FONTATTR_COLOR_SHADOW);
    printer.unk = GetFontAttribute(fontId, FONTATTR_UNKNOWN);
    printer.letterSpacing = letterSpacing;
    printer.lineSpacing = GetFontAttribute(fontId, FONTATTR_LINE_SPACING);
    printer.x = left;
    printer.currentX = left;
    for (i = 0; i < itemCount; i++)
    {
        printer.currentChar = strs[orderArray[i]].text;
        printer.y = (lineHeight * i) + top;
        printer.currentY = printer.y;
        AddTextPrinter(&printer, 0xFF, NULL);
    }
    CopyWindowToVram(windowId, COPYWIN_GFX);
}

void SetWindowTemplateFields(struct WindowTemplate *template, u8 bg, u8 left, u8 top, u8 width, u8 height, u8 paletteNum, u16 baseBlock)
{
    template->bg = bg;
    template->tilemapLeft = left;
    template->tilemapTop = top;
    template->width = width;
    template->height = height;
    template->paletteNum = paletteNum;
    template->baseBlock = baseBlock;
}

struct WindowTemplate CreateWindowTemplate(u8 bg, u8 left, u8 top, u8 width, u8 height, u8 paletteNum, u16 baseBlock)
{
    struct WindowTemplate template;
    SetWindowTemplateFields(&template, bg, left, top, width, height, paletteNum, baseBlock);
    return template;
}

static u16 AddWindowParameterized(u8 bg, u8 left, u8 top, u8 width, u8 height, u8 paletteNum, u16 baseBlock)
{
    struct WindowTemplate template;
    SetWindowTemplateFields(&template, bg, left, top, width, height, paletteNum, baseBlock);
    return AddWindow(&template);
}

void CreateYesNoMenuAtPos(const struct WindowTemplate *window, u8 fontId, u8 left, u8 top, u16 baseTileNum, u8 paletteNum, u8 initialCursorPos)
{
    struct TextPrinterTemplate textSubPrinter;

    sYesNoWindowId = AddWindow(window);
    DrawStdFrameWithCustomTileAndPalette(sYesNoWindowId, 1, baseTileNum, paletteNum);
    textSubPrinter.currentChar = gText_YesNo;
    textSubPrinter.windowId = sYesNoWindowId;
    textSubPrinter.fontId = fontId;
    textSubPrinter.x = GetMenuCursorDimensionByFont(fontId, 0) + left;
    textSubPrinter.y = top;
    textSubPrinter.currentX = textSubPrinter.x;
    textSubPrinter.currentY = textSubPrinter.y;
    textSubPrinter.fgColor = GetFontAttribute(fontId, FONTATTR_COLOR_FOREGROUND);
    textSubPrinter.bgColor = GetFontAttribute(fontId, FONTATTR_COLOR_BACKGROUND);
    textSubPrinter.shadowColor = GetFontAttribute(fontId, FONTATTR_COLOR_SHADOW);
    textSubPrinter.unk = GetFontAttribute(fontId, FONTATTR_UNKNOWN);
    textSubPrinter.letterSpacing = GetFontAttribute(fontId, FONTATTR_LETTER_SPACING);
    textSubPrinter.lineSpacing = GetFontAttribute(fontId, FONTATTR_LINE_SPACING);
    AddTextPrinter(&textSubPrinter, 0xFF, NULL);
    InitMenuNormal(sYesNoWindowId, fontId, left, top, GetFontAttribute(fontId, FONTATTR_MAX_LETTER_HEIGHT) + textSubPrinter.lineSpacing, 2, initialCursorPos);
}

s8 Menu_ProcessInputNoWrapClearOnChoose(void)
{
    s8 result = Menu_ProcessInputNoWrap();
    if (result != MENU_NOTHING_CHOSEN)
        DestroyYesNoMenu();
    return result;
}

u8 InitMenuInUpperLeftCorner(u8 windowId, u8 numChoices, u8 initialCursorPos, bool8 APressMuted)
{
    s32 pos;

    sMenu.left = 0;
    sMenu.top = 2;
    sMenu.minCursorPos = 0;
    sMenu.maxCursorPos = numChoices - 1;
    sMenu.windowId = windowId;
    sMenu.fontId = FONT_NORMAL;
    sMenu.optionHeight = 16;
    sMenu.APressMuted = APressMuted;
    pos = initialCursorPos;
    if (pos < 0 || pos > sMenu.maxCursorPos)
        sMenu.cursorPos = 0;
    else
        sMenu.cursorPos = pos;

    Menu_MoveCursor(0);
    return sMenu.cursorPos;
}

// There is no muted version of this function, so the version that plays sound when A is pressed is the "Normal" one.
u8 InitMenuInUpperLeftCornerNormal(u8 windowId, u8 itemCount, u8 initialCursorPos)
{
    return InitMenuInUpperLeftCorner(windowId, itemCount, initialCursorPos, FALSE);
}

void ClearScheduledBgCopiesToVram(void)
{
    memset(sScheduledBgCopiesToVram, 0, sizeof(sScheduledBgCopiesToVram));
}

void ScheduleBgCopyTilemapToVram(u8 bgId)
{
    sScheduledBgCopiesToVram[bgId] = TRUE;
}

void DoScheduledBgTilemapCopiesToVram(void)
{
    if (sScheduledBgCopiesToVram[0] == TRUE)
    {
        CopyBgTilemapBufferToVram(0);
        sScheduledBgCopiesToVram[0] = FALSE;
    }
    if (sScheduledBgCopiesToVram[1] == TRUE)
    {
        CopyBgTilemapBufferToVram(1);
        sScheduledBgCopiesToVram[1] = FALSE;
    }
    if (sScheduledBgCopiesToVram[2] == TRUE)
    {
        CopyBgTilemapBufferToVram(2);
        sScheduledBgCopiesToVram[2] = FALSE;
    }
    if (sScheduledBgCopiesToVram[3] == TRUE)
    {
        CopyBgTilemapBufferToVram(3);
        sScheduledBgCopiesToVram[3] = FALSE;
    }
}

void ResetTempTileDataBuffers(void)
{
    int i;

    for (i = 0; i < (s32)NELEMS(sTempTileDataBuffers); i++)
    {
        sTempTileDataBuffers[i] = NULL;
    }
    sTempTileDataBufferCursor = 0;
}

bool8 FreeTempTileDataBuffersIfPossible(void)
{
    int i;

    if (!IsDma3ManagerBusyWithBgCopy())
    {
        if (sTempTileDataBufferCursor)
        {
            for (i = 0; i < sTempTileDataBufferCursor; i++)
            {
                FREE_AND_SET_NULL(sTempTileDataBuffers[i]);
            }
            sTempTileDataBufferCursor = 0;
        }
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

void *DecompressAndCopyTileDataToVram(u8 bgId, const void *src, u32 size, u16 offset, u8 mode)
{
    u32 sizeOut;

    if (sTempTileDataBufferCursor < NELEMS(sTempTileDataBuffers))
    {
        void *ptr = MallocAndDecompress(src, &sizeOut);
        if (!size)
            size = sizeOut;
        if (ptr)
        {
            CopyDecompressedTileDataToVram(bgId, ptr, size, offset, mode);
            sTempTileDataBuffers[sTempTileDataBufferCursor++] = ptr;
        }
        return ptr;
    }
    return NULL;
}

void *DecompressAndCopyTileDataToVram2(u8 bgId, const void *src, u32 size, u16 offset, u8 mode)
{
    u32 sizeOut;

    if (sTempTileDataBufferCursor < NELEMS(sTempTileDataBuffers))
    {
        void *ptr = MallocAndDecompress(src, &sizeOut);
        if (sizeOut > size)
            sizeOut = size;
        if (ptr)
        {
            CopyDecompressedTileDataToVram(bgId, ptr, sizeOut, offset, mode);
            sTempTileDataBuffers[sTempTileDataBufferCursor++] = ptr;
        }
        return ptr;
    }
    return NULL;
}

void DecompressAndLoadBgGfxUsingHeap(u8 bgId, const void *src, u32 size, u16 offset, u8 mode)
{
    u32 sizeOut;

    void *ptr = MallocAndDecompress(src, &sizeOut);
    if (!size)
        size = sizeOut;
    if (ptr)
    {
        u8 taskId = CreateTask(TaskFreeBufAfterCopyingTileDataToVram, 0);
        gTasks[taskId].data[0] = CopyDecompressedTileDataToVram(bgId, ptr, size, offset, mode);
        SetWordTaskArg(taskId, 1, (u32)ptr);
    }
}

void DecompressAndLoadBgGfxUsingHeap2(u8 bgId, const void *src, u32 size, u16 offset, u8 mode)
{
    u32 sizeOut;

    void *ptr = MallocAndDecompress(src, &sizeOut);
    if (sizeOut > size)
        sizeOut = size;
    if (ptr)
    {
        u8 taskId = CreateTask(TaskFreeBufAfterCopyingTileDataToVram, 0);
        gTasks[taskId].data[0] = CopyDecompressedTileDataToVram(bgId, ptr, sizeOut, offset, mode);
        SetWordTaskArg(taskId, 1, (u32)ptr);
    }
}

static void TaskFreeBufAfterCopyingTileDataToVram(u8 taskId)
{
    if (!WaitDma3Request(gTasks[taskId].data[0]))
    {
        Free((void *)GetWordTaskArg(taskId, 1));
        DestroyTask(taskId);
    }
}

void *MallocAndDecompress(const void *src, u32 *size)
{
    u32 sizeLocal; // If size is passed as NULL, because we don't care about knowing the size
    void *ptr;

    if (size == NULL)
        size = &sizeLocal;

    u8 *sizeAsBytes = (u8 *)size;
    u8 *srcAsBytes = (u8 *)src;

    sizeAsBytes[0] = srcAsBytes[1];
    sizeAsBytes[1] = srcAsBytes[2];
    sizeAsBytes[2] = srcAsBytes[3];
    sizeAsBytes[3] = 0;

    ptr = Alloc(*size);
    if (ptr)
        LZ77UnCompWram(src, ptr);
    return ptr;
}

static u16 CopyDecompressedTileDataToVram(u8 bgId, const void *src, u16 size, u16 offset, u8 mode)
{
    switch (mode)
    {
    case 1:
        break;
    case 0:        
    default:
        return LoadBgTiles(bgId, src, size, offset);
    }
    return LoadBgTilemap(bgId, src, size, offset);
}

void SetBgTilemapPalette(u8 bgId, u8 left, u8 top, u8 width, u8 height, u8 palette)
{
    u8 i, j;
    u16 *ptr = GetBgTilemapBuffer(bgId);

    for (i = top; i < top + height; i++)
    {
        for (j = left; j < left + width; j++)
        {
            ptr[(i * 32) + j] = (ptr[(i * 32) + j] & 0xFFF) | (palette << 12);
        }
    }
}

void CopyToBufferFromBgTilemap(u8 bgId, u16 *dest, u8 left, u8 top, u8 width, u8 height)
{
    u8 i,j;
    const u16 *src = GetBgTilemapBuffer(bgId);

    for (i = 0; i < height; i++)
    {
        for (j = 0; j < width; j++)
        {
            dest[(i * width) + j] = src[(i + top) * 32 + j + left];
        }
    }
}

void ResetBgPositions(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgY(3, 0, 0);
}

void DestroyYesNoMenu(void)
{
    ClearStdWindowAndFrameToTransparent(sYesNoWindowId, TRUE);
    RemoveWindow(sYesNoWindowId);
}

void MultichoiceGrid_PrintItems(u8 windowId, u8 fontId, u8 itemWidth, u8 itemHeight, u8 cols, u8 rows, const struct MenuAction *strs)
{
    u8 width, i, j, yOffset;

    fontId = fontId;
    itemWidth = itemWidth;
    itemHeight = itemHeight;
    width = GetFontAttribute(fontId, FONTATTR_MAX_LETTER_WIDTH);
    yOffset = (16 - GetFontAttribute(fontId, FONTATTR_MAX_LETTER_HEIGHT)) / 2;
    for (i = 0; i < rows; ++i)
        for (j = 0; j < cols; ++j)
            AddTextPrinterParameterized(windowId, fontId, strs[i * cols + j].text, itemWidth * j + width, yOffset + itemHeight * i, 0xFF, 0);
    CopyWindowToVram(windowId, COPYWIN_GFX);
}

static u8 MultichoiceGrid_InitCursorInternal(u8 windowId, u8 fontId, u8 left, u8 top, u8 optionWidth, u8 cursorHeight, u8 cols, u8 rows, u8 numChoices, u8 cursorPos)
{
    s32 pos;

    sMenu.left = left;
    sMenu.top = top;
    sMenu.minCursorPos = 0;
    sMenu.maxCursorPos = numChoices - 1;
    sMenu.windowId = windowId;
    sMenu.fontId = fontId;
    sMenu.optionWidth = optionWidth;
    sMenu.optionHeight = cursorHeight;
    sMenu.columns = cols;
    sMenu.rows = rows;
    pos = cursorPos;
    if (pos < 0 || pos > sMenu.maxCursorPos)
        sMenu.cursorPos = 0;
    else
        sMenu.cursorPos = pos;
    MultichoiceGrid_MoveCursor(0, 0);
    return sMenu.cursorPos;
}

u8 MultichoiceGrid_InitCursor(u8 windowId, u8 fontId, u8 left, u8 top, u8 optionWidth, u8 cols, u8 rows, u8 cursorPos)
{
    s32 cursorHeight = 16;
    u8 numChoices = cols * rows;

    return MultichoiceGrid_InitCursorInternal(windowId, fontId, left, top, optionWidth, cursorHeight, cols, rows, numChoices, cursorPos);
}

static void MultichoiceGrid_RedrawCursor(u8 oldCursorPos, u8 newCursorPos)
{
    u8 cursorWidth = GetMenuCursorDimensionByFont(sMenu.fontId, 0);
    u8 cursorHeight = GetMenuCursorDimensionByFont(sMenu.fontId, 1);
    u8 xPos = (oldCursorPos % sMenu.columns) * sMenu.optionWidth + sMenu.left;
    u8 yPos = (oldCursorPos / sMenu.columns) * sMenu.optionHeight + sMenu.top;
    
    FillWindowPixelRect(sMenu.windowId, PIXEL_FILL(1), xPos, yPos, cursorWidth, cursorHeight);
    xPos = (newCursorPos % sMenu.columns) * sMenu.optionWidth + sMenu.left;
    yPos = (newCursorPos / sMenu.columns) * sMenu.optionHeight + sMenu.top;
    AddTextPrinterParameterized(sMenu.windowId, sMenu.fontId, gText_SelectorArrow2, xPos, yPos, 0, 0);
}

static u8 MultichoiceGrid_MoveCursor(s8 deltaX, s8 deltaY)
{
    u8 oldPos = sMenu.cursorPos;

    if (deltaX)
    {
        if ((sMenu.cursorPos % sMenu.columns) + deltaX < 0)
            sMenu.cursorPos += sMenu.columns - 1;
        else if ((sMenu.cursorPos % sMenu.columns) + deltaX >= sMenu.columns)
            sMenu.cursorPos = (sMenu.cursorPos / sMenu.columns) * sMenu.columns;
        else
            sMenu.cursorPos += deltaX;
    }
    if (deltaY)
    {
        if ((sMenu.cursorPos / sMenu.columns) + deltaY < 0)
            sMenu.cursorPos += sMenu.columns * (sMenu.rows - 1);
        else if ((sMenu.cursorPos / sMenu.columns) + deltaY >= sMenu.rows)
            sMenu.cursorPos -= sMenu.columns * (sMenu.rows - 1);
        else
            sMenu.cursorPos += (sMenu.columns * deltaY);
    }
    if (sMenu.cursorPos > sMenu.maxCursorPos)
    {
        sMenu.cursorPos = oldPos;
        return sMenu.cursorPos;
    }
    else
    {
        MultichoiceGrid_RedrawCursor(oldPos, sMenu.cursorPos);
        return sMenu.cursorPos;
    }
}

static u8 MultichoiceGrid_MoveCursorIfValid(s8 deltaX, s8 deltaY)
{
    u8 oldPos = sMenu.cursorPos;

    if (deltaX)
    {
        if (((sMenu.cursorPos % sMenu.columns) + deltaX >= 0) && ((sMenu.cursorPos % sMenu.columns) + deltaX < sMenu.columns))
            sMenu.cursorPos += deltaX;
    }
    if (deltaY)
    {
        if (((sMenu.cursorPos / sMenu.columns) + deltaY >= 0) && ((sMenu.cursorPos / sMenu.columns) + deltaY < sMenu.rows))
            sMenu.cursorPos += (sMenu.columns * deltaY);
    }
    if (sMenu.cursorPos > sMenu.maxCursorPos)
    {
        sMenu.cursorPos = oldPos;
        return sMenu.cursorPos;
    }
    else
    {
        MultichoiceGrid_RedrawCursor(oldPos, sMenu.cursorPos);
        return sMenu.cursorPos;
    }
}

s8 Menu_ProcessInputGridLayout(void)
{
    u8 oldPos = sMenu.cursorPos;

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        return sMenu.cursorPos;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        return MENU_B_PRESSED;
    }
    else if (JOY_NEW(DPAD_UP))
    {
        if (oldPos != MultichoiceGrid_MoveCursorIfValid(0, -1))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_NEW(DPAD_DOWN))
    {
        if (oldPos != MultichoiceGrid_MoveCursorIfValid(0, 1))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_NEW(DPAD_LEFT) || GetLRKeysPressed() == MENU_L_PRESSED)
    {
        if (oldPos != MultichoiceGrid_MoveCursorIfValid(-1, 0))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_NEW(DPAD_RIGHT) || GetLRKeysPressed() == MENU_R_PRESSED)
    {
        if (oldPos != MultichoiceGrid_MoveCursorIfValid(1, 0))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    return MENU_NOTHING_CHOSEN;
}

void InitPopupWindows(void)
{
    sMapNamePopupWindowId = WINDOW_NONE;
    if (OW_POPUP_GENERATION == GEN_5)
        sSecondaryPopupWindowId = WINDOW_NONE;
}

u16 GetStandardFrameBaseTileNum(void)
{
    return STD_WINDOW_BASE_TILE_NUM;
}

void AddTextPrinterParameterized3(u8 windowId, u8 fontId, u8 x, u8 y, const u8 * color, s8 speed, const u8 * str)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = x;
    printer.y = y;
    printer.currentX = printer.x;
    printer.currentY = printer.y;
    printer.letterSpacing = GetFontAttribute(fontId, FONTATTR_LETTER_SPACING);
    printer.lineSpacing = GetFontAttribute(fontId, FONTATTR_LINE_SPACING);
    printer.unk = 0;
    printer.fgColor = color[1];
    printer.bgColor = color[0];
    printer.shadowColor = color[2];
    AddTextPrinter(&printer, speed, NULL);
}

void AddTextPrinterParameterized4(u8 windowId, u8 fontId, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, const u8 *color, s8 speed, const u8 *str)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = x;
    printer.y = y;
    printer.currentX = printer.x;
    printer.currentY = printer.y;
    printer.letterSpacing = letterSpacing;
    printer.lineSpacing = lineSpacing;
    printer.unk = 0;
    printer.fgColor = color[1];
    printer.bgColor = color[0];
    printer.shadowColor = color[2];
    AddTextPrinter(&printer, speed, NULL);
}

void AddTextPrinterParameterized5(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16), u8 letterSpacing, u8 lineSpacing)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = x;
    printer.y = y;
    printer.currentX = x;
    printer.currentY = y;
    printer.letterSpacing = letterSpacing;
    printer.lineSpacing = lineSpacing;
    printer.unk = 0;
    printer.fgColor = GetFontAttribute(fontId, FONTATTR_COLOR_FOREGROUND);
    printer.bgColor = GetFontAttribute(fontId, FONTATTR_COLOR_BACKGROUND);
    printer.shadowColor = GetFontAttribute(fontId, FONTATTR_COLOR_SHADOW);
    AddTextPrinter(&printer, speed, callback);
}

void PrintPlayerNameOnWindow(u8 windowId, const u8 * src, u16 x, u16 y)
{
    s32 i;

    for (i = 0; gSaveBlock2Ptr->playerName[i] != EOS; i++)
        ;

    StringExpandPlaceholders(gStringVar4, src);
    if (i != 5)
    {
        AddTextPrinterParameterized(windowId, FONT_NORMAL, gStringVar4, x, y, 0xFF, NULL);
    }
    else
    {
        AddTextPrinterParameterized5(windowId, FONT_NORMAL, gStringVar4, x, y, 0xFF, NULL, 0, 0);
    }
}

void LoadMonIconPalAtOffset(u8 palOffset, u16 speciesId)
{
    LoadPalette(GetValidMonIconPalettePtr(speciesId), palOffset, PLTT_SIZE_4BPP);
}

void DrawMonIconAtPos(u8 windowId, u16 speciesId, u32 personality, u16 x, u16 y)
{
    BlitBitmapToWindow(windowId, GetMonIconPtr(speciesId, personality), x, y, 32, 32);
}

void ListMenuLoadStdPalAt(u8 palOffset, u8 palId)
{
    const u16 *palette;

    switch (palId)
    {
    case 0:
    default:
        palette = gMenuInfoElements1_Pal;
        break;
    case 1:
        palette = gMenuInfoElements2_Pal;
        break;
    }
    LoadPalette(palette, palOffset, PLTT_SIZE_4BPP);
}

void BlitMenuInfoIcon(u8 windowId, u8 iconId, u16 x, u16 y)
{
    BlitBitmapRectToWindow(windowId, &gMenuInfoElements_Gfx[sMenuInfoIcons[iconId].offset * TILE_SIZE_4BPP], 0, 0, 128, 128, x, y, sMenuInfoIcons[iconId].width, sMenuInfoIcons[iconId].height);
}

// BW map pop-ups
u8 AddSecondaryPopUpWindow(void)
{
    if (sSecondaryPopupWindowId == WINDOW_NONE)
        sSecondaryPopupWindowId = AddWindowParameterized(0, 0, 17, 30, 3, 14, 0x161);
    return sSecondaryPopupWindowId;
}

u8 GetSecondaryPopUpWindowId(void)
{
    return sSecondaryPopupWindowId;
}

void RemoveSecondaryPopUpWindow(void)
{
    if (sSecondaryPopupWindowId != WINDOW_NONE)
    {
        RemoveWindow(sSecondaryPopupWindowId);
        sSecondaryPopupWindowId = WINDOW_NONE;
    }
}

void HBlankCB_DoublePopupWindow(void)
{
    u16 offset = gTasks[gPopupTaskId].data[2];
    u16 scanline = REG_VCOUNT;

    if (scanline < 80 || scanline > 160)
    {
        REG_BG0VOFS = offset;
        if(OW_POPUP_BW_ALPHA_BLEND && !IsWeatherAlphaBlend())
            REG_BLDALPHA = BLDALPHA_BLEND(15, 5);
    }
    else
    {
        REG_BG0VOFS = 512 - offset;
    }
}

void DrawHelpMessageWindowWithText(const u8 * text)
{
    LoadHelpMessageWindowGfx(CreateHelpMessageWindow(), DLG_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(DLG_WINDOW_PALETTE_NUM));
    PrintTextOnHelpMessageWindow(text, 2);
}

void DestroyHelpMessageWindow_(void)
{
    DestroyHelpMessageWindow(2);
}

void LoadSignPostWindowFrameGfx(void)
{
    Menu_LoadStdPal();
    LoadSignBoxGfx(0, DLG_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(DLG_WINDOW_PALETTE_NUM));
    LoadUserWindowBorderGfx(0, STD_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(STD_WINDOW_PALETTE_NUM));
}
