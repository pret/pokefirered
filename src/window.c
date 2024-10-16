#include "global.h"
#include "gflib.h"

COMMON_DATA u8 gWindowClearTile = {0};
COMMON_DATA void *gWindowBgTilemapBuffers[4] = {0};

EWRAM_DATA struct Window gWindows[WINDOWS_MAX] = {0};

static u8 GetNumActiveWindowsOnBg(u8 bgId);

static const struct WindowTemplate sDummyWindowTemplate = {0xFF, 0, 0, 0, 0, 0, 0};

static void nullsub_8(void)
{

}

bool16 InitWindows(const struct WindowTemplate *templates)
{
    int i;
    void *bgTilemapBuffer;
    int j;
    u8 bgLayer;
    u16 bgSize;
    u8 *allocatedTilemapBuffer;
    int allocatedBaseBlock;

    for (i = 0; i < 4; ++i)
    {
        bgTilemapBuffer = GetBgTilemapBuffer(i);
        if (bgTilemapBuffer != NULL)
            gWindowBgTilemapBuffers[i] = nullsub_8;
        else
            gWindowBgTilemapBuffers[i] = bgTilemapBuffer;
    }

    for (i = 0; i < WINDOWS_MAX; ++i)
    {
        gWindows[i].window = sDummyWindowTemplate;
        gWindows[i].tileData = NULL;
    }

    for (i = 0, allocatedBaseBlock = 0, bgLayer = templates[i].bg; bgLayer != 0xFF && i < WINDOWS_MAX; ++i, bgLayer = templates[i].bg)
    {
        if (gWindowTileAutoAllocEnabled == TRUE)
        {
            allocatedBaseBlock = BgTileAllocOp(bgLayer, 0, templates[i].width * templates[i].height, BG_TILE_FIND_FREE_SPACE);
            if (allocatedBaseBlock == -1)
                return FALSE;
        }

        if (gWindowBgTilemapBuffers[bgLayer] == NULL)
        {
            bgSize = GetBgAttribute(bgLayer, BG_ATTR_MAPSIZE);

            if (bgSize != 0xFFFF)
            {
                allocatedTilemapBuffer = Alloc(bgSize);

                if (allocatedTilemapBuffer == NULL)
                {
                    FreeAllWindowBuffers();
                    return FALSE;
                }

                for (j = 0; j < bgSize; ++j)
                    allocatedTilemapBuffer[j] = 0;

                gWindowBgTilemapBuffers[bgLayer] = allocatedTilemapBuffer;
                SetBgTilemapBuffer(bgLayer, allocatedTilemapBuffer);
            }
        }

        allocatedTilemapBuffer = Alloc((u16)(0x20 * (templates[i].width * templates[i].height)));

        if (allocatedTilemapBuffer == NULL)
        {
            if ((GetNumActiveWindowsOnBg(bgLayer) == 0) && (gWindowBgTilemapBuffers[bgLayer] != nullsub_8))
            {
                Free(gWindowBgTilemapBuffers[bgLayer]);
                gWindowBgTilemapBuffers[bgLayer] = allocatedTilemapBuffer;
            }

            return FALSE;
        }

        gWindows[i].tileData = allocatedTilemapBuffer;
        gWindows[i].window = templates[i];

        if (gWindowTileAutoAllocEnabled == TRUE)
        {
            gWindows[i].window.baseBlock = allocatedBaseBlock;
            BgTileAllocOp(bgLayer, allocatedBaseBlock, templates[i].width * templates[i].height, BG_TILE_ALLOC);
        }
    }

    gWindowClearTile = 0;
    return TRUE;
}

u16 AddWindow(const struct WindowTemplate *template)
{
    u16 win;
    u8 bgLayer;
    int allocatedBaseBlock;
    u16 bgSize;
    u8 *allocatedTilemapBuffer;
    int i;

    for (win = 0; win < WINDOWS_MAX; ++win)
    {
        if ((bgLayer = gWindows[win].window.bg) == 0xFF)
            break;
    }

    if (win == WINDOWS_MAX)
        return 0xFF;

    bgLayer = template->bg;
    allocatedBaseBlock = 0;

    if (gWindowTileAutoAllocEnabled == TRUE)
    {
        allocatedBaseBlock = BgTileAllocOp(bgLayer, 0, template->width * template->height, BG_TILE_FIND_FREE_SPACE);

        if (allocatedBaseBlock == -1)
            return 0xFF;
    }

    if (gWindowBgTilemapBuffers[bgLayer] == NULL)
    {
        bgSize = GetBgAttribute(bgLayer, BG_ATTR_MAPSIZE);

        if (bgSize != 0xFFFF)
        {
            allocatedTilemapBuffer = Alloc(bgSize);

            if (allocatedTilemapBuffer == NULL)
                return 0xFF;

            for (i = 0; i < bgSize; ++i)
                allocatedTilemapBuffer[i] = 0;

            gWindowBgTilemapBuffers[bgLayer] = allocatedTilemapBuffer;
            SetBgTilemapBuffer(bgLayer, allocatedTilemapBuffer);
        }
    }

    allocatedTilemapBuffer = Alloc((u16)(0x20 * (template->width * template->height)));

    if (allocatedTilemapBuffer == NULL)
    {
        if ((GetNumActiveWindowsOnBg(bgLayer) == 0) && (gWindowBgTilemapBuffers[bgLayer] != nullsub_8))
        {
            Free(gWindowBgTilemapBuffers[bgLayer]);
            gWindowBgTilemapBuffers[bgLayer] = allocatedTilemapBuffer;
        }
        return 0xFF;
    }

    gWindows[win].tileData = allocatedTilemapBuffer;
    gWindows[win].window = *template;

    if (gWindowTileAutoAllocEnabled == TRUE)
    {
        gWindows[win].window.baseBlock = allocatedBaseBlock;
        BgTileAllocOp(bgLayer, allocatedBaseBlock, gWindows[win].window.width * gWindows[win].window.height, BG_TILE_ALLOC);
    }

    return win;
}

void RemoveWindow(u8 windowId)
{
    u8 bgLayer = gWindows[windowId].window.bg;

    if (gWindowTileAutoAllocEnabled == TRUE)
    {
        BgTileAllocOp(bgLayer, gWindows[windowId].window.baseBlock, gWindows[windowId].window.width * gWindows[windowId].window.height, BG_TILE_FREE);
    }

    gWindows[windowId].window = sDummyWindowTemplate;

    if (GetNumActiveWindowsOnBg(bgLayer) == 0)
    {
        if (gWindowBgTilemapBuffers[bgLayer] != nullsub_8)
        {
            Free(gWindowBgTilemapBuffers[bgLayer]);
            gWindowBgTilemapBuffers[bgLayer] = 0;
        }
    }

    if (gWindows[windowId].tileData != NULL)
    {
        Free(gWindows[windowId].tileData);
        gWindows[windowId].tileData = NULL;
    }
}

void FreeAllWindowBuffers(void)
{
    int i;

    for (i = 0; i < 4; ++i)
    {
        if (gWindowBgTilemapBuffers[i] != NULL && gWindowBgTilemapBuffers[i] != nullsub_8)
        {
            Free(gWindowBgTilemapBuffers[i]);
            gWindowBgTilemapBuffers[i] = NULL;
        }
    }

    for (i = 0; i < WINDOWS_MAX; ++i)
    {
        if (gWindows[i].tileData != NULL)
        {
            Free(gWindows[i].tileData);
            gWindows[i].tileData = NULL;
        }
    }
}

void CopyWindowToVram(u8 windowId, u8 mode)
{
    struct Window windowLocal = gWindows[windowId];
    u16 windowSize = 32 * (windowLocal.window.width * windowLocal.window.height);

    switch (mode)
    {
        case COPYWIN_MAP:
            CopyBgTilemapBufferToVram(windowLocal.window.bg);
            break;
        case COPYWIN_GFX:
            LoadBgTiles(windowLocal.window.bg, windowLocal.tileData, windowSize, windowLocal.window.baseBlock);
            break;
        case COPYWIN_FULL:
            LoadBgTiles(windowLocal.window.bg, windowLocal.tileData, windowSize, windowLocal.window.baseBlock);
            CopyBgTilemapBufferToVram(windowLocal.window.bg);
            break;
    }
}

void PutWindowTilemap(u8 windowId)
{
    struct Window windowLocal = gWindows[windowId];

    WriteSequenceToBgTilemapBuffer(
        windowLocal.window.bg,
        GetBgAttribute(windowLocal.window.bg, BG_ATTR_BASETILE) + windowLocal.window.baseBlock,
        windowLocal.window.tilemapLeft,
        windowLocal.window.tilemapTop,
        windowLocal.window.width,
        windowLocal.window.height,
        windowLocal.window.paletteNum,
        1);
}

void PutWindowRectTilemapOverridePalette(u8 windowId, u8 x, u8 y, u8 width, u8 height, u8 palette)
{
    struct Window windowLocal = gWindows[windowId];
    u16 currentRow = windowLocal.window.baseBlock + (y * windowLocal.window.width) + x + GetBgAttribute(windowLocal.window.bg, BG_ATTR_BASETILE);
    int i;

    for (i = 0; i < height; ++i)
    {
        WriteSequenceToBgTilemapBuffer(
            windowLocal.window.bg,
            currentRow,
            windowLocal.window.tilemapLeft + x,
            windowLocal.window.tilemapTop + y + i,
            width,
            1,
            palette,
            1);

        currentRow += windowLocal.window.width;
    }
}

void ClearWindowTilemap(u8 windowId)
{
    struct Window windowLocal = gWindows[windowId];

    FillBgTilemapBufferRect(
        windowLocal.window.bg,
        gWindowClearTile,
        windowLocal.window.tilemapLeft,
        windowLocal.window.tilemapTop,
        windowLocal.window.width,
        windowLocal.window.height,
        windowLocal.window.paletteNum);
}

void PutWindowRectTilemap(u8 windowId, u8 x, u8 y, u8 width, u8 height)
{
    struct Window windowLocal = gWindows[windowId];
    u16 currentRow = windowLocal.window.baseBlock + (y * windowLocal.window.width) + x + GetBgAttribute(windowLocal.window.bg, BG_ATTR_BASETILE);
    int i;

    for (i = 0; i < height; ++i)
    {
        WriteSequenceToBgTilemapBuffer(
            windowLocal.window.bg,
            currentRow,
            windowLocal.window.tilemapLeft + x,
            windowLocal.window.tilemapTop + y + i,
            width,
            1,
            windowLocal.window.paletteNum,
            1);

        currentRow += windowLocal.window.width;
    }
}

void BlitBitmapToWindow(u8 windowId, const u8 *pixels, u16 x, u16 y, u16 width, u16 height)
{
    BlitBitmapRectToWindow(windowId, pixels, 0, 0, width, height, x, y, width, height);
}

void BlitBitmapRectToWindow(u8 windowId, const u8 *pixels, u16 srcX, u16 srcY, u16 srcWidth, int srcHeight, u16 destX, u16 destY, u16 rectWidth, u16 rectHeight)
{
    struct Bitmap sourceRect;
    struct Bitmap destRect;

    sourceRect.pixels = (u8 *)pixels;
    sourceRect.width = srcWidth;
    sourceRect.height = srcHeight;

    destRect.pixels = gWindows[windowId].tileData;
    destRect.width = 8 * gWindows[windowId].window.width;
    destRect.height = 8 * gWindows[windowId].window.height;

    BlitBitmapRect4Bit(&sourceRect, &destRect, srcX, srcY, destX, destY, rectWidth, rectHeight, 0);
}

void BlitBitmapRectToWindowWithColorKey(u8 windowId, const u8 *pixels, u16 srcX, u16 srcY, u16 srcWidth, int srcHeight, u16 destX, u16 destY, u16 rectWidth, u16 rectHeight, u8 colorKey)
{
    struct Bitmap sourceRect;
    struct Bitmap destRect;

    sourceRect.pixels = (u8 *)pixels;
    sourceRect.width = srcWidth;
    sourceRect.height = srcHeight;

    destRect.pixels = gWindows[windowId].tileData;
    destRect.width = 8 * gWindows[windowId].window.width;
    destRect.height = 8 * gWindows[windowId].window.height;

    BlitBitmapRect4Bit(&sourceRect, &destRect, srcX, srcY, destX, destY, rectWidth, rectHeight, colorKey);
}

void FillWindowPixelRect(u8 windowId, u8 fillValue, u16 x, u16 y, u16 width, u16 height)
{
    struct Bitmap pixelRect;

    pixelRect.pixels = gWindows[windowId].tileData;
    pixelRect.width = 8 * gWindows[windowId].window.width;
    pixelRect.height = 8 * gWindows[windowId].window.height;

    FillBitmapRect4Bit(&pixelRect, x, y, width, height, fillValue);
}

void CopyToWindowPixelBuffer(u8 windowId, const void *src, u16 size, u16 tileOffset)
{
    if (size != 0)
        CpuCopy16(src, gWindows[windowId].tileData + (0x20 * tileOffset), size);
    else
        LZ77UnCompWram(src, gWindows[windowId].tileData + (0x20 * tileOffset));
}

void FillWindowPixelBuffer(u8 windowId, u8 fillValue)
{
    int fillSize = gWindows[windowId].window.width * gWindows[windowId].window.height;
    CpuFastFill8(fillValue, gWindows[windowId].tileData, 0x20 * fillSize);
}

#define MOVE_TILES_DOWN(a)                                                      \
{                                                                               \
    destOffset = i + (a);                                                       \
    srcOffset = i + (((width * (distanceLoop & ~7)) | (distanceLoop & 7)) * 4); \
    if (srcOffset < size)                                                       \
        *(u32 *)(tileData + destOffset) = *(u32 *)(tileData + srcOffset);         \
    else                                                                        \
        *(u32 *)(tileData + destOffset) = fillValue32;                           \
    distanceLoop++;                                                             \
}

#define MOVE_TILES_UP(a)                                                        \
{                                                                               \
    destOffset = i + (a);                                                       \
    srcOffset = i + (((width * (distanceLoop & ~7)) | (distanceLoop & 7)) * 4); \
    if (srcOffset < size)                                                       \
        *(u32 *)(tileData - destOffset) = *(u32 *)(tileData - srcOffset);         \
    else                                                                        \
        *(u32 *)(tileData - destOffset) = fillValue32;                           \
    distanceLoop++;                                                             \
}

void ScrollWindow(u8 windowId, u8 direction, u8 distance, u8 fillValue)
{
    struct WindowTemplate window = gWindows[windowId].window;
    u8 *tileData = gWindows[windowId].tileData;
    u32 fillValue32 = (fillValue << 24) | (fillValue << 16) | (fillValue << 8) | fillValue;
    s32 size = window.height * window.width * 32;
    u32 width = window.width;
    s32 i;
    s32 srcOffset, destOffset;
    u32 distanceLoop;

    switch (direction)
    {
    case 0:
        for (i = 0; i < size; i += 32)
        {
            distanceLoop = distance;
            MOVE_TILES_DOWN(0)
            MOVE_TILES_DOWN(4)
            MOVE_TILES_DOWN(8)
            MOVE_TILES_DOWN(12)
            MOVE_TILES_DOWN(16)
            MOVE_TILES_DOWN(20)
            MOVE_TILES_DOWN(24)
            MOVE_TILES_DOWN(28)
        }
        break;
    case 1:
        tileData += size - 4;
        for (i = 0; i < size; i += 32)
        {
            distanceLoop = distance;
            MOVE_TILES_UP(0)
            MOVE_TILES_UP(4)
            MOVE_TILES_UP(8)
            MOVE_TILES_UP(12)
            MOVE_TILES_UP(16)
            MOVE_TILES_UP(20)
            MOVE_TILES_UP(24)
            MOVE_TILES_UP(28)
        }
        break;
    case 2:
        break;
    }
}

void CallWindowFunction(u8 windowId, WindowFunc func)
{
    struct WindowTemplate window = gWindows[windowId].window;
    func(window.bg, window.tilemapLeft, window.tilemapTop, window.width, window.height, window.paletteNum);
}

bool8 SetWindowAttribute(u8 windowId, u8 attributeId, u32 value)
{
    switch (attributeId)
    {
    case WINDOW_TILEMAP_LEFT:
        gWindows[windowId].window.tilemapLeft = value;
        return FALSE;
    case WINDOW_TILEMAP_TOP:
        gWindows[windowId].window.tilemapTop = value;
        return FALSE;
    case WINDOW_PALETTE_NUM:
        gWindows[windowId].window.paletteNum = value;
        return FALSE;
    case WINDOW_BASE_BLOCK:
        gWindows[windowId].window.baseBlock = value;
        return FALSE;
    case WINDOW_TILE_DATA:
    case WINDOW_BG:
    case WINDOW_WIDTH:
    case WINDOW_HEIGHT:
    default:
        return TRUE;
    }
}

u32 GetWindowAttribute(u8 windowId, u8 attributeId)
{
    switch (attributeId)
    {
    case WINDOW_BG:
        return gWindows[windowId].window.bg;
    case WINDOW_TILEMAP_LEFT:
        return gWindows[windowId].window.tilemapLeft;
    case WINDOW_TILEMAP_TOP:
        return gWindows[windowId].window.tilemapTop;
    case WINDOW_WIDTH:
        return gWindows[windowId].window.width;
    case WINDOW_HEIGHT:
        return gWindows[windowId].window.height;
    case WINDOW_PALETTE_NUM:
        return gWindows[windowId].window.paletteNum;
    case WINDOW_BASE_BLOCK:
        return gWindows[windowId].window.baseBlock;
    case WINDOW_TILE_DATA:
        return (u32)(gWindows[windowId].tileData);
    default:
        return 0;
    }
}

static u8 GetNumActiveWindowsOnBg(u8 bgId)
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
