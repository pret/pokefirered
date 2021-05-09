#include "global.h"
#include "malloc.h"
#include "menu.h"
#include "malloc.h"

static EWRAM_DATA u8 sHelpMessageWindowId = 0;

const u16 gHelpMsgWindowGfx_Tiles[] = INCBIN_U16("graphics/text_window/help_message.4bpp");

static const struct WindowTemplate sHelpMessageWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 15,
    .width = 30,
    .height = 5,
    .paletteNum = 15,
    .baseBlock = 0x08F
};

void MapNamePopupWindowIdSetDummy(void)
{
    sHelpMessageWindowId = 0xFF;
}

u8 CreateHelpMessageWindow(void)
{
    if (sHelpMessageWindowId == 0xFF)
    {
        sHelpMessageWindowId = AddWindow(&sHelpMessageWindowTemplate);
        PutWindowTilemap(sHelpMessageWindowId);
    }
    return sHelpMessageWindowId;
}

void DestroyHelpMessageWindow(u8 a0)
{
    if (sHelpMessageWindowId != 0xFF)
    {
        FillWindowPixelBuffer(sHelpMessageWindowId, PIXEL_FILL(0));
        ClearWindowTilemap(sHelpMessageWindowId);

        if (a0)
            CopyWindowToVram(sHelpMessageWindowId, a0);

        RemoveWindow(sHelpMessageWindowId);
        sHelpMessageWindowId = 0xFF;
    }
}

void HelpMsg_DrawBgOnWindow(u8 windowId)
{
    const u8* ptr = (const u8 *)gHelpMsgWindowGfx_Tiles;
    u8* buffer;
    u8 i, j;
    u8 width, height;
    u8 k;

    width = (u8)GetWindowAttribute(windowId, WINDOW_WIDTH);
    height = (u8)GetWindowAttribute(windowId, WINDOW_HEIGHT);
    
    buffer = (u8 *)Alloc(32 * width * height);

    if (buffer != NULL)
    {
        for (i = 0; i < height; i++)
        {
            for (j = 0; j < width; j++)
            {
                if (i == 0)
                    k = 0; // top row
                else if (i == height - 1)
                    k = 14; // bottom row
                else
                    k = 5; // body
                CpuCopy32(
                    &ptr[k * 0x20],
                    &buffer[(i * width + j) * 0x20],
                    32
                );
            }
        }
        CopyToWindowPixelBuffer(windowId, buffer, width * height * 32, 0);
        Free(buffer);
    }
}

static void DrawBgOnHelpMsgWindow(void)
{
    HelpMsg_DrawBgOnWindow(sHelpMessageWindowId);
}

static const u8 sHelpMessageTextColors[3] = {TEXT_COLOR_TRANSPARENT, TEXT_DYNAMIC_COLOR_1, TEXT_COLOR_DARK_GRAY};

static void PrintHelpMessageText(const u8 *text)
{
    AddTextPrinterParameterized4(sHelpMessageWindowId, 2, 2, 5, 1, 1, sHelpMessageTextColors, -1, text);
}

void PrintTextOnHelpMessageWindow(const u8 *text, u8 mode)
{
    DrawBgOnHelpMsgWindow();
    PrintHelpMessageText(text);
    if (mode)
        CopyWindowToVram(sHelpMessageWindowId, mode);
}
