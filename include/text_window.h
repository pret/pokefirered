#ifndef GUARD_TEXT_WINDOW_H
#define GUARD_TEXT_WINDOW_H

#include "global.h"

struct TilesPal
{
    u32 *tiles;
    u16 *pal;
};

void rbox_fill_rectangle(u8 windowId);
const u16 *GetTextWindowPalette(u8 id);
const u16 *GetOverworldTextboxPalettePtr(void);
void LoadMenuMessageWindowGfx(u8 windowId, u16 tileStart, u8 palette);
void LoadStdWindowGfx(u8 windowId, u16 tileStart, u8 palette);
void LoadUserWindowGfx(u8 windowId, u16 tileStart, u8 palette);
void LoadUserWindowGfx2(u8 windowId, u16 tileStart, u8 palette);
void LoadStdWindowGfxOnBg(u8 bgId, u16 tileStart, u8 palette);
void DrawTextBorderOuter(u8 windowId, u16 tileStart, u8 palette);
void DrawTextBorderInner(u8 windowId, u16 tileNum, u8 palNum);
void LoadHelpMessageWindowGfx(u8 windowId, u16 destOffset, u8 palIdx);
void LoadSignpostWindowGfx(u8 windowId, u16 destOffset, u8 palIdx);
void LoadStdWindowTiles(u8 windowId, u16 destOffset);
void LoadQuestLogWindowTiles(u8 windowId, u16 destOffset);
void TextWindow_LoadResourcesStdFrame0(u8 windowId, u16 tileStart, u8 palette);
void TextWindow_SetStdFrame0_WithPal(u8 windowId, u16 tileStart, u8 palette);
void TextWindow_SetUserSelectedFrame(u8 windowId, u16 tileStart, u8 palette);
void LoadUserWindowBorderGfx(u8 windowId, u16 tileStart, u8 palette);
void DrawWindowBorderWithStdpal3(u8 bgId, u16 tileStart, u8 palette);
void DrawTextBorderOuter(u8 windowId, u16 tileStart, u8 palette);
void DrawTextBorderInner(u8 windowId, u16 tileNum, u8 palNum);
void TextWindow_LoadTilesStdFrame1(u8 windowId, u16 destOffset);
void sub_814FE6C(u8 windowId, u16 destOffset, u8 palIdx);
void sub_814FEEC(u8 windowId, u16 destOffset, u8 palIdx);
void sub_814FF6C(u8 windowId, u16 destOffset);
void sub_814FD38(u8 bgId, u16 destOffset, u8 palIdx);

#endif // GUARD_TEXT_WINDOW_H
