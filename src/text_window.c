#include "global.h"
#include "gflib.h"
#include "text_window.h"
#include "text_window_graphics.h"
#include "quest_log.h"

extern const u16 gUnknown_841F1C8[];

void LoadWindowGfx(u8 windowId, u8 frameType, u16 destOffset, u8 palIdx);

void sub_814FD04(u8 bgId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gUnknown_84566A8, 0x280, destOffset);
    LoadPalette(stdpal_get(2), palIdx, 32);
}

void sub_814FD38(u8 bgId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gUnknown_841F1C8, 0x280, destOffset);
    LoadPalette(stdpal_get(0), palIdx, 32);
}

void sub_814FD6C(u8 bgId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gUnknown_8470B0C, 0x260, destOffset);
    LoadPalette(stdpal_get(1), palIdx, 32);
}

void DrawWindowBorderWithStdpal3(u8 bgId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gStdFrame0, 0x120, destOffset);
    LoadPalette(stdpal_get(3), palIdx, 32);
}

void sub_814FDD4(u8 bgId, u16 destOffset)
{
    LoadBgTiles(bgId, gStdFrame1, 0x280, destOffset);
}

void sub_814FDF4(u8 bgId, u8 frameType, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gUserFrames[frameType].tiles, 0x120, destOffset);
    LoadPalette(gUserFrames[frameType].palette, palIdx, 32);
}

void LoadUserWindowBorderGfx(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadWindowGfx(windowId, gSaveBlock2Ptr->optionsWindowFrameType, destOffset, palIdx);
}

void sub_814FE6C(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gUnknown_84566A8, 0x280, destOffset);
    LoadPalette(stdpal_get(2), palIdx, 32);
}

void TextWindow_LoadResourcesStdFrame0(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gUnknown_841F1C8, 0x280, destOffset);
    LoadPalette(stdpal_get(0), palIdx, 32);
}

void sub_814FEEC(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gUnknown_8470B0C, 0x260, destOffset);
    LoadPalette(stdpal_get(1), palIdx, 32);
}

void TextWindow_SetStdFrame0_WithPal(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gStdFrame0, 0x120, destOffset);
    LoadPalette(stdpal_get(3), palIdx, 32);
}

void sub_814FF6C(u8 windowId, u16 destOffset)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gStdFrame0, 0x120, destOffset);
}

void TextWindow_LoadTilesStdFrame1(u8 windowId, u16 destOffset)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gStdFrame1, 0x280, destOffset);
}

void LoadWindowGfx(u8 windowId, u8 frameType, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gUserFrames[frameType].tiles, 0x120, destOffset);
    LoadPalette(gUserFrames[frameType].palette, palIdx, 32);
}

void TextWindow_SetUserSelectedFrame(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadWindowGfx(windowId, gSaveBlock2Ptr->optionsWindowFrameType, destOffset, palIdx);
}

void DrawTextBorderOuter(u8 windowId, u16 tileNum, u8 palNum)
{
    u8 bgLayer = GetWindowAttribute(windowId, WINDOW_BG);
    u16 tilemapLeft = GetWindowAttribute(windowId, WINDOW_TILEMAP_LEFT);
    u16 tilemapTop = GetWindowAttribute(windowId, WINDOW_TILEMAP_TOP);
    u16 width = GetWindowAttribute(windowId, WINDOW_WIDTH);
    u16 height = GetWindowAttribute(windowId, WINDOW_HEIGHT);

    FillBgTilemapBufferRect(bgLayer, tileNum + 0, tilemapLeft - 1,      tilemapTop - 1,         1,      1,      palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 1, tilemapLeft,          tilemapTop - 1,         width,  1,      palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 2, tilemapLeft + width,  tilemapTop - 1,         1,      1,      palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 3, tilemapLeft - 1,      tilemapTop,             1,      height, palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 5, tilemapLeft + width,  tilemapTop,             1,      height, palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 6, tilemapLeft - 1,      tilemapTop + height,    1,      1,      palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 7, tilemapLeft,          tilemapTop + height,    width,  1,      palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 8, tilemapLeft + width,  tilemapTop + height,    1,      1,      palNum);
}

void DrawTextBorderInner(u8 windowId, u16 tileNum, u8 palNum)
{
    u8 bgLayer = GetWindowAttribute(windowId, WINDOW_BG);
    u16 tilemapLeft = GetWindowAttribute(windowId, WINDOW_TILEMAP_LEFT);
    u16 tilemapTop = GetWindowAttribute(windowId, WINDOW_TILEMAP_TOP);
    u16 width = GetWindowAttribute(windowId, WINDOW_WIDTH);
    u16 height = GetWindowAttribute(windowId, WINDOW_HEIGHT);

    FillBgTilemapBufferRect(bgLayer, tileNum + 0, tilemapLeft,              tilemapTop,                 1,          1,          palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 1, tilemapLeft + 1,          tilemapTop,                 width - 2,  1,          palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 2, tilemapLeft + width - 1,  tilemapTop,                 1,          1,          palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 3, tilemapLeft,              tilemapTop + 1,             1,          height - 2, palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 5, tilemapLeft + width - 1,  tilemapTop + 1,             1,          height - 2, palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 6, tilemapLeft,              tilemapTop + height - 1,    1,          1,          palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 7, tilemapLeft + 1,          tilemapTop + height - 1,    width -     2,  1,      palNum);
    FillBgTilemapBufferRect(bgLayer, tileNum + 8, tilemapLeft + width - 1,  tilemapTop + height - 1,    1,          1,          palNum);
}

void rbox_fill_rectangle(u8 windowId)
{
    u8 bgLayer = GetWindowAttribute(windowId, WINDOW_BG);
    u16 tilemapLeft = GetWindowAttribute(windowId, WINDOW_TILEMAP_LEFT);
    u16 tilemapTop = GetWindowAttribute(windowId, WINDOW_TILEMAP_TOP);
    u16 width = GetWindowAttribute(windowId, WINDOW_WIDTH);
    u16 height = GetWindowAttribute(windowId, WINDOW_HEIGHT);

    FillBgTilemapBufferRect(bgLayer, 0, tilemapLeft - 1, tilemapTop - 1, width + 2, height + 2, 0x11);
}

const u16 *stdpal_get(u8 id)
{
    switch (id)
    {
    case 0:
        id = 0;
        break;
    case 1:
        id = 0x10;
        break;
    case 2:
        id = 0x20;
        break;
    case 3:
        id = 0x30;
        break;
    case 4:
    default:
        id = 0x40;
        break;
    }

    return (const u16 *)(gUnknown_8471DEC) + id;
}
