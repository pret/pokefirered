#ifndef GUARD_TEXT_WINDOW_H
#define GUARD_TEXT_WINDOW_H

#include "global.h"

struct TilesPal
{
    u32* tiles;
    u16* pal;
};

const struct TilesPal* sub_8098758(u8 id);
void copy_textbox_border_tile_patterns_to_vram(u8 windowId, u16 destOffset, u8 palOffset);
void sub_809882C(u8 windowId, u16 destOffset, u8 palOffset);
void sub_80987D4(u8 windowId, u8 frameId, u16 destOffset, u8 palOffset);
void box_border_load_tiles_and_pal(u8 windowId, u16 destOffset, u8 palOffset);
void sub_8098858(u8 windowId, u16 tileNum, u8 palNum);
void sub_80989E0(u8 windowId, u16 tileNum, u8 palNum);
void rbox_fill_rectangle(u8 windowId);
const u16* stdpal_get(u8 id);
const u16* GetOverworldTextboxPalettePtr(void);
void sub_8098C6C(u8 bg, u16 destOffset, u8 palOffset);
void TextWindow_LoadResourcesStdFrame0(u8 windowId, u16 tileStart, u8 palette);
void TextWindow_SetStdFrame0_WithPal(u8 windowId, u16 tileStart, u8 palette);
void TextWindow_SetUserSelectedFrame(u8 windowId, u16 tileStart, u8 palette);
void LoadUserWindowBorderGfx(u8 windowId, u16 tileStart, u8 palette);
void sub_814FDA0(u8 windowId, u16 tileStart, u8 palette);
void DrawTextBorderOuter(u8 windowId, u16 tileStart, u8 palette);
void TextWindow_LoadTilesStdFrame1(u8 windowId, u16 destOffset);
void sub_814FE6C(u8 windowId, u16 destOffset, u8 palIdx);
void sub_814FEEC(u8 windowId, u16 destOffset, u8 palIdx);
void sub_814FF6C(u8 windowId, u16 destOffset);

#endif // GUARD_TEXT_WINDOW_H
