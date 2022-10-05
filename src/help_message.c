#include "global.h"
#include "malloc.h"
#include "menu.h"
#include "malloc.h"

static EWRAM_DATA u8 sHelpMessageWindowId = 0;

const u8 gHelpMessageWindow_Gfx[] = INCBIN_U8("graphics/help_system/msg_window.4bpp");

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
    sHelpMessageWindowId = WINDOW_NONE;
}

u8 CreateHelpMessageWindow(void)
{
    if (sHelpMessageWindowId == WINDOW_NONE)
    {
        sHelpMessageWindowId = AddWindow(&sHelpMessageWindowTemplate);
        PutWindowTilemap(sHelpMessageWindowId);
    }
    return sHelpMessageWindowId;
}

void DestroyHelpMessageWindow(u8 a0)
{
    if (sHelpMessageWindowId != WINDOW_NONE)
    {
        FillWindowPixelBuffer(sHelpMessageWindowId, PIXEL_FILL(0));
        ClearWindowTilemap(sHelpMessageWindowId);

        if (a0)
            CopyWindowToVram(sHelpMessageWindowId, a0);

        RemoveWindow(sHelpMessageWindowId);
        sHelpMessageWindowId = WINDOW_NONE;
    }
}

void sub_8112F18(u8 windowId)
{
    const u8 *ptr = gHelpMessageWindow_Gfx;
    u8 *buffer;
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
                    k = 0;
                else if (i == height - 1)
                    k = 14;
                else
                    k = 5;
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

static void sub_8112FD0(void)
{
    sub_8112F18(sHelpMessageWindowId);
}

static const u8 sHelpMessageTextColors[3] = {TEXT_COLOR_TRANSPARENT, TEXT_DYNAMIC_COLOR_1, TEXT_COLOR_DARK_GRAY};

static void PrintHelpMessageText(const u8 *text)
{
    AddTextPrinterParameterized4(sHelpMessageWindowId, FONT_2, 2, 5, 1, 1, sHelpMessageTextColors, -1, text);
}

void PrintTextOnHelpMessageWindow(const u8 *text, u8 mode)
{
    sub_8112FD0();
    PrintHelpMessageText(text);
    if (mode)
        CopyWindowToVram(sHelpMessageWindowId, mode);
}
