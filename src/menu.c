#include "global.h"
#include "gflib.h"
#include "menu.h"
#include "menu_helpers.h"
#include "strings.h"
#include "text_window.h"
#include "constants/songs.h"

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

static EWRAM_DATA struct Menu sMenu = {0};
static EWRAM_DATA u16 sTileNum = 0;
static EWRAM_DATA u8 sPaletteNum = 0;
static EWRAM_DATA u8 sYesNoWindowId = 0;
static EWRAM_DATA u8 sTopBarWindowId = 0;

static void WindowFunc_DrawDialogFrameWithCustomTileAndPalette(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_ClearDialogWindowAndFrameNullPalette(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_DrawStdFrameWithCustomTileAndPalette(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_ClearStdWindowAndFrameToTransparent(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static u8 MultichoiceGrid_MoveCursor(s8 deltaX, s8 deltaY);

static const u8 sTopBarWindowTextColors[3] = {15, 1, 2};

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

// not used
static void DrawDialogFrameWithCustomTile(u8 windowId, bool8 copyToVram, u16 tileNum)
{
    sTileNum = tileNum;
    sPaletteNum = GetWindowAttribute(windowId, WINDOW_PALETTE_NUM);
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

// not used
static void DrawStdFrameWithCustomTile(u8 windowId, bool8 copyToVram, u16 baseTileNum)
{
    sTileNum = baseTileNum;
    sPaletteNum = GetWindowAttribute(windowId, WINDOW_PALETTE_NUM);
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
u8 CreateTopBarWindowLoadPalette(u8 bg, u8 width, u8 yPos, u8 palette, u16 baseTile)
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

void TopBarWindowPrintString(const u8 *string, u8 unused, bool8 copyToVram)
{
    s32 width;

    if (sTopBarWindowId != 0xFF)
    {
        PutWindowTilemap(sTopBarWindowId);
        FillWindowPixelBuffer(sTopBarWindowId, PIXEL_FILL(15));
        width = GetStringWidth(FONT_SMALL, string, 0);
        AddTextPrinterParameterized3(sTopBarWindowId, FONT_SMALL, -20 - width, 1, sTopBarWindowTextColors, 0, string);
        if (copyToVram)
            CopyWindowToVram(sTopBarWindowId, COPYWIN_FULL);
    }
}

void TopBarWindowPrintTwoStrings(const u8 *string, const u8 *string2, bool8 fgColorChooser, u8 unused, bool8 copyToVram)
{
    u8 color[3];
    s32 fgColor, width;

    if ( sTopBarWindowId != 0xFF )
    {
        if (fgColorChooser)
        {
            color[0] = 0;
            color[1] = 1;
            color[2] = 2;
        }
        else
        {
            color[0] = 15;
            color[1] = 1;
            color[2] = 2;
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

// not used
static void CopyTopBarWindowToVram(void)
{
    if (sTopBarWindowId != 0xFF)
        CopyWindowToVram(sTopBarWindowId, COPYWIN_FULL);
}

void ClearTopBarWindow(void)
{
    if (sTopBarWindowId != 0xFF)
    {
        FillWindowPixelBuffer(sTopBarWindowId, PIXEL_FILL(15));
        CopyWindowToVram(sTopBarWindowId, COPYWIN_FULL);
    }
}

void DestroyTopBarWindow(void)
{
    if (sTopBarWindowId != 0xFF)
    {
        FillWindowPixelBuffer(sTopBarWindowId, PIXEL_FILL(0));
        ClearWindowTilemap(sTopBarWindowId);
        CopyWindowToVram(sTopBarWindowId, COPYWIN_FULL);
        RemoveWindow(sTopBarWindowId);
        sTopBarWindowId = 0xFF;
    }
}

u8 Menu_InitCursorInternal(u8 windowId, u8 fontId, u8 left, u8 top, u8 cursorHeight, u8 numChoices, u8 initialCursorPos, bool8 APressMuted)
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

u8 Menu_InitCursor(u8 windowId, u8 fontId, u8 left, u8 top, u8 cursorHeight, u8 numChoices, u8 initialCursorPos)
{
    return Menu_InitCursorInternal(windowId, fontId, left, top, cursorHeight, numChoices, initialCursorPos, 0);
}

// Unused
static u8 InitMenuDefaultCursorHeight(u8 windowId, u8 fontId, u8 left, u8 top, u8 numChoices, u8 initialCursorPos)
{
    return Menu_InitCursor(windowId, fontId, left, top, GetMenuCursorDimensionByFont(fontId, 1), numChoices, initialCursorPos);
}

static void Menu_RedrawCursor(u8 oldPos, u8 newPos)
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
    Menu_RedrawCursor(oldPos, sMenu.cursorPos);
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

    Menu_RedrawCursor(oldPos, sMenu.cursorPos);
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

s8 Menu_ProcessInputNoWrapAround(void)
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

s8 Menu_ProcessInput_other(void)
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

void PrintTextArray(u8 windowId, u8 fontId, u8 left, u8 top, u8 lineHeight, u8 itemCount, const struct MenuAction *strs)
{
    u8 i;

    for (i = 0; i < itemCount; i++)
        AddTextPrinterParameterized(windowId, fontId, strs[i].text, left, (lineHeight * i) + top, 0xFF, NULL);
    CopyWindowToVram(windowId, COPYWIN_GFX);
}

void MultichoiceList_PrintItems(u8 windowId, u8 fontId, u8 left, u8 top, u8 lineHeight, u8 itemCount, const struct MenuAction *strs, u8 letterSpacing, u8 lineSpacing)
{
    u8 i;

    for (i = 0; i < itemCount; i++)
        AddTextPrinterParameterized5(windowId, fontId, strs[i].text, left, (lineHeight * i) + top, 0xFF, NULL, letterSpacing, lineSpacing);
    CopyWindowToVram(windowId, COPYWIN_GFX);
}

void PrintMenuTable(u8 windowId, u8 fontId, u8 lineHeight, u8 itemCount, const struct MenuAction *strs)
{
    u8 left = GetMenuCursorDimensionByFont(fontId, 0);

    PrintTextArray(windowId, fontId, left, 0, lineHeight, itemCount, strs);
}

void AddItemMenuActionTextPrinters(u8 windowId, u8 fontId, u8 left, u8 top, u8 letterSpacing, u8 lineHeight, u8 itemCount, const struct MenuAction *strs, const u8 *orderArray)
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

// Unused
static void PrintMenuActionTextsAtTopById(u8 windowId, u8 fontId, u8 lineHeight, u8 itemCount, const struct MenuAction *strs, const u8 *orderArray)
{
    AddItemMenuActionTextPrinters(windowId, fontId, GetFontAttribute(fontId, FONTATTR_MAX_LETTER_WIDTH), 0, GetFontAttribute(fontId, FONTATTR_LETTER_SPACING), lineHeight, itemCount, strs, orderArray);
}

struct WindowTemplate SetWindowTemplateFields(u8 bg, u8 left, u8 top, u8 width, u8 height, u8 paletteNum, u16 baseBlock)
{
    struct WindowTemplate template;

    template.bg = bg;
    template.tilemapLeft = left;
    template.tilemapTop = top;
    template.width = width;
    template.height = height;
    template.paletteNum = paletteNum;
    template.baseBlock = baseBlock;
    return template;
}

// not used
static u16 CreateWindowTemplate(u8 bg, u8 left, u8 top, u8 width, u8 height, u8 paletteNum, u16 baseBlock)
{
    struct WindowTemplate template = SetWindowTemplateFields(bg, left, top, width, height, paletteNum, baseBlock);
    return AddWindow(&template);
}

void CreateYesNoMenu(const struct WindowTemplate *window, u8 fontId, u8 left, u8 top, u16 baseTileNum, u8 paletteNum, u8 initialCursorPos)
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
    Menu_InitCursor(sYesNoWindowId, fontId, left, top, GetFontAttribute(fontId, FONTATTR_MAX_LETTER_HEIGHT) + textSubPrinter.lineSpacing, 2, initialCursorPos);
}

// not used
static void CreateYesNoMenu2(const struct WindowTemplate *window, u8 fontId, u16 baseTileNum, u8 initialCursorPos)
{
    CreateYesNoMenu(window, fontId, 0, 0, baseTileNum, initialCursorPos, 0);
}

s8 Menu_ProcessInputNoWrapClearOnChoose(void)
{
    s8 result = Menu_ProcessInputNoWrapAround();
    if (result != MENU_NOTHING_CHOSEN)
        DestroyYesNoMenu();
    return result;
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

//not used
static void MultichoiceGrid_PrintItemsCustomOrder(u8 windowId, u8 fontId, u8 itemWidth, u8 itemHeight, u8 cols, u8 rows, const struct MenuAction *strs, const u8 *orderArray)
{
    u8 width, i, j;

    fontId = fontId;
    itemWidth = itemWidth;
    itemHeight = itemHeight;
    width = GetFontAttribute(fontId, FONTATTR_MAX_LETTER_WIDTH);
    for (i = 0; i < rows; ++i)
        for (j = 0; j < cols; ++j)
            AddTextPrinterParameterized(windowId, fontId, strs[orderArray[i * cols + j]].text, itemWidth * j + width, itemHeight * i, 0xFF, 0);
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

// Unused
static s8 Menu_ProcessGridInput_NoSoundLimit(void)
{
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
        PlaySE(SE_SELECT);
        MultichoiceGrid_MoveCursor(0, -1);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_NEW(DPAD_DOWN))
    {
        PlaySE(SE_SELECT);
        MultichoiceGrid_MoveCursor(0, 1);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_NEW(DPAD_LEFT) || GetLRKeysPressed() == MENU_L_PRESSED)
    {
        PlaySE(SE_SELECT);
        MultichoiceGrid_MoveCursor(-1, 0);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_NEW(DPAD_RIGHT) || GetLRKeysPressed() == MENU_R_PRESSED)
    {
        PlaySE(SE_SELECT);
        MultichoiceGrid_MoveCursor(1, 0);
        return MENU_NOTHING_CHOSEN;
    }
    return MENU_NOTHING_CHOSEN;
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

// Unused
static s8 Menu_ProcessGridInputRepeat_NoSoundLimit(void)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        return sMenu.cursorPos;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        return MENU_B_PRESSED;
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_UP)
    {
        PlaySE(SE_SELECT);
        MultichoiceGrid_MoveCursor(0, -1);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        MultichoiceGrid_MoveCursor(0, 1);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_LEFT || GetLRKeysPressedAndHeld() == MENU_L_PRESSED)
    {
        PlaySE(SE_SELECT);
        MultichoiceGrid_MoveCursor(-1, 0);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_RIGHT || GetLRKeysPressedAndHeld() == MENU_R_PRESSED)
    {
        PlaySE(SE_SELECT);
        MultichoiceGrid_MoveCursor(1, 0);
        return MENU_NOTHING_CHOSEN;
    }

    return MENU_NOTHING_CHOSEN;
}

// Unused
static s8 Menu_ProcessGridInputRepeat(void)
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
    else if (JOY_REPT(DPAD_ANY) == DPAD_UP)
    {
        if (oldPos != MultichoiceGrid_MoveCursorIfValid(0, -1))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_DOWN)
    {
        if (oldPos != MultichoiceGrid_MoveCursorIfValid(0, 1))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_LEFT || GetLRKeysPressedAndHeld() == MENU_L_PRESSED)
    {
        if (oldPos != MultichoiceGrid_MoveCursorIfValid(-1, 0))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    else if (JOY_REPT(DPAD_ANY) == DPAD_RIGHT || GetLRKeysPressedAndHeld() == MENU_R_PRESSED)
    {
        if (oldPos != MultichoiceGrid_MoveCursorIfValid(1, 0))
            PlaySE(SE_SELECT);
        return MENU_NOTHING_CHOSEN;
    }
    return MENU_NOTHING_CHOSEN;
}
