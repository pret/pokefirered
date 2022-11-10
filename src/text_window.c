#include "global.h"
#include "gflib.h"
#include "text_window.h"
#include "text_window_graphics.h"
#include "help_message.h"
#include "new_menu_helpers.h"

static void LoadUserWindowGfxByFrame(u8 windowId, u8 frameType, u16 destOffset, u8 palIdx);

// Unused
// Equivalent to LoadHelpMessageWindowGfx, but takes a bg id directly
static void LoadHelpMessageWindowGfxOnBg(u8 bgId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gHelpMessageWindow_Gfx, 0x280, destOffset);
    LoadPalette(GetTextWindowPalette(2), palIdx, 32);
}

// Unused
// Equivalent to LoadMenuMessageWindowGfx, but takes a bg id directly
static void LoadMenuMessageWindowGfxOnBg(u8 bgId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gMenuMessageWindow_Gfx, 0x280, destOffset);
    LoadPalette(GetTextWindowPalette(0), palIdx, 32);
}

// Unused
// Equivalent to LoadSignpostWindowGfx, but takes a bg id directly
static void LoadSignpostWindowGfxOnBg(u8 bgId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gSignpostWindow_Gfx, 0x260, destOffset);
    LoadPalette(GetTextWindowPalette(1), palIdx, 32);
}

// Equivalent to LoadStdWindowGfx, but takes a bg id directly
void LoadStdWindowGfxOnBg(u8 bgId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gStdTextWindow_Gfx, 0x120, destOffset);
    LoadPalette(GetTextWindowPalette(3), palIdx, 32);
}

// Unused
// Equivalent to LoadQuestLogWindowTiles, but takes a bg id directly
static void LoadQuestLogWindowTilesOnBg(u8 bgId, u16 destOffset)
{
    LoadBgTiles(bgId, gQuestLogWindow_Gfx, 0x280, destOffset);
}

// Unused
// Equivalent to LoadUserWindowGfxByFrame, but takes a bg id directly
static void LoadUserWindowGfxByFrameOnBg(u8 bgId, u8 frameType, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(bgId, gUserFrames[frameType].tiles, 0x120, destOffset);
    LoadPalette(gUserFrames[frameType].palette, palIdx, 32);
}

// Identical to LoadUserWindowGfx
void LoadUserWindowGfx2(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadUserWindowGfxByFrame(windowId, gSaveBlock2Ptr->optionsWindowFrameType, destOffset, palIdx);
}

void LoadHelpMessageWindowGfx(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gHelpMessageWindow_Gfx, 0x280, destOffset);
    LoadPalette(GetTextWindowPalette(2), palIdx, 32);
}

void LoadMenuMessageWindowGfx(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gMenuMessageWindow_Gfx, 0x280, destOffset);
    LoadPalette(GetTextWindowPalette(0), palIdx, 32);
}

void LoadSignpostWindowGfx(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gSignpostWindow_Gfx, 0x260, destOffset);
    LoadPalette(GetTextWindowPalette(1), palIdx, 32);
}

void LoadStdWindowGfx(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gStdTextWindow_Gfx, 0x120, destOffset);
    LoadPalette(GetTextWindowPalette(3), palIdx, 32);
}

void LoadStdWindowTiles(u8 windowId, u16 destOffset)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gStdTextWindow_Gfx, 0x120, destOffset);
}

void LoadQuestLogWindowTiles(u8 windowId, u16 destOffset)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gQuestLogWindow_Gfx, 0x280, destOffset);
}

static void LoadUserWindowGfxByFrame(u8 windowId, u8 frameType, u16 destOffset, u8 palIdx)
{
    LoadBgTiles(GetWindowAttribute(windowId, WINDOW_BG), gUserFrames[frameType].tiles, 0x120, destOffset);
    LoadPalette(gUserFrames[frameType].palette, palIdx, 32);
}

void LoadUserWindowGfx(u8 windowId, u16 destOffset, u8 palIdx)
{
    LoadUserWindowGfxByFrame(windowId, gSaveBlock2Ptr->optionsWindowFrameType, destOffset, palIdx);
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

const u16 *GetTextWindowPalette(u8 id)
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

    return (const u16 *)(gTextWindowPalettes) + id;
}
