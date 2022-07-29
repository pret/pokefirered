#include "global.h"
#include "gflib.h"

EWRAM_DATA static struct Window* sWindowPtr = NULL;
EWRAM_DATA static u16 sWindowSize = 0;

static u8 GetNumActiveWindowsOnBg8Bit(u8 bgId);

static void nullsub_9(void)
{
}

u16 AddWindow8Bit(const struct WindowTemplate *template)
{
    u16 windowId;
    u8 *memAddress;
    u8 bgLayer;

    for (windowId = 0; windowId < WINDOWS_MAX; windowId++)
    {
        if (gWindows[windowId].window.bg == 0xFF)
            break;
    }
    if (windowId == WINDOWS_MAX)
        return 0xFF;
    bgLayer = template->bg;
    if (gWindowBgTilemapBuffers[bgLayer] == NULL)
    {
        u16 attribute = GetBgAttribute(bgLayer, BG_ATTR_MAPSIZE);
        if (attribute != 0xFFFF)
        {
            s32 i;
            memAddress = Alloc(attribute);
            if (memAddress == NULL)
                return 0xFF;
            for (i = 0; i < attribute; i++) // if we're going to zero out the memory anyway, why not call AllocZeroed?
                memAddress[i] = 0;
            gWindowBgTilemapBuffers[bgLayer] = memAddress;
            SetBgTilemapBuffer(bgLayer, memAddress);
        }
    }
    memAddress = Alloc((u16)(0x40 * (template->width * template->height)));
    if (memAddress == NULL)
    {
        if (GetNumActiveWindowsOnBg8Bit(bgLayer) == 0 && gWindowBgTilemapBuffers[bgLayer] != nullsub_9)
        {
            Free(gWindowBgTilemapBuffers[bgLayer]);
            gWindowBgTilemapBuffers[bgLayer] = NULL;
        }
        return 0xFF;
    }
    else
    {
        gWindows[windowId].tileData = memAddress;
        gWindows[windowId].window = *template;
        return windowId;
    }
}

void FillWindowPixelBuffer8Bit(u8 windowId, u8 fillValue)
{
    s32 i;
    s32 size;

    size = (u16)(0x40 * (gWindows[windowId].window.width * gWindows[windowId].window.height));
    for (i = 0; i < size; i++)
        gWindows[windowId].tileData[i] = fillValue;
}

void FillWindowPixelRect8Bit(u8 windowId, u8 fillValue, u16 x, u16 y, u16 width, u16 height)
{
    struct Bitmap pixelRect;

    pixelRect.pixels = gWindows[windowId].tileData;
    pixelRect.width = 8 * gWindows[windowId].window.width;
    pixelRect.height = 8 * gWindows[windowId].window.height;

    FillBitmapRect8Bit(&pixelRect, x, y, width, height, fillValue);
}

void BlitBitmapRectToWindow4BitTo8Bit(u8 windowId, const u8 *pixels, u16 srcX, u16 srcY, u16 srcWidth, int srcHeight, u16 destX, u16 destY, u16 rectWidth, u16 rectHeight, u8 paletteNum)
{
    struct Bitmap sourceRect;
    struct Bitmap destRect;

    sourceRect.pixels = (u8 *)pixels;
    sourceRect.width = srcWidth;
    sourceRect.height = srcHeight;

    destRect.pixels = gWindows[windowId].tileData;
    destRect.width = 8 * gWindows[windowId].window.width;
    destRect.height = 8 * gWindows[windowId].window.height;

    BlitBitmapRect4BitTo8Bit(&sourceRect, &destRect, srcX, srcY, destX, destY, rectWidth, rectHeight, 0, paletteNum);
}

void CopyWindowToVram8Bit(u8 windowId, u8 mode)
{
    sWindowPtr = &gWindows[windowId];
    sWindowSize = 0x40 * (sWindowPtr->window.width * sWindowPtr->window.height);

    switch (mode)
    {
        case COPYWIN_MAP:
            CopyBgTilemapBufferToVram(sWindowPtr->window.bg);
            break;
        case COPYWIN_GFX:
            LoadBgTiles(sWindowPtr->window.bg, sWindowPtr->tileData, sWindowSize, sWindowPtr->window.baseBlock);
            break;
        case COPYWIN_FULL:
            LoadBgTiles(sWindowPtr->window.bg, sWindowPtr->tileData, sWindowSize, sWindowPtr->window.baseBlock);
            CopyBgTilemapBufferToVram(sWindowPtr->window.bg);
            break;
    }
}

static u8 GetNumActiveWindowsOnBg8Bit(u8 bgId)
{
    u8 windowsNum = 0;
    s32 i;
    for (i = 0; i < WINDOWS_MAX; i++)
    {
        if (gWindows[i].window.bg == bgId)
            windowsNum++;
    }
    return windowsNum;
}
