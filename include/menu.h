#ifndef GUARD_MENU_H
#define GUARD_MENU_H

#include "global.h"

#include "text.h"
#include "window.h"

struct MenuAction
{
    const u8 *text;
    union {
        void (*void_u8)(u8);
        u8 (*u8_void)(void);
    } func;
};

void box_print(u8, u8, u8, u8, const void *, s8, const u8 *);
void sub_8198070(u8 windowId, bool8 copyToVram);
void SetWindowTemplateFields(struct WindowTemplate* template, u8 priority, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 palNum, u16 baseBlock);
void SetWindowBorderStyle(u8 windowId, bool8 copyToVram, u16 tileStart, u8 palette);
void schedule_bg_copy_tilemap_to_vram(u8 bgNum);
void PrintMenuTable(u8 idx, u8 nstrs, const struct MenuAction *strs);
void InitMenuInUpperLeftCornerPlaySoundWhenAPressed(u8 idx, u8 nstrs,u8);
u8 GetMenuCursorPos(void);
s8 ProcessMenuInput(void);
s8 ProcessMenuInputNoWrapAround(void);
void blit_move_info_icon(u8 winId, u8 a2, u16 x, u16 y);
void reset_temp_tile_data_buffers(void);
int decompress_and_copy_tile_data_to_vram(u8 bg_id, const void *src, int size, u16 offset, u8 mode);
bool8 free_temp_tile_data_buffers_if_possible(void);
u64 sub_8198A50(struct WindowTemplate*, u8, u8, u8, u8, u8, u8, u16); // returns something but it isn't used, fix when menu.s is decomp'd
//void CreateYesNoMenu(const struct WindowTemplate *windowTemplate, u16 borderFirstTileNum, u8 borderPalette, u8 initialCursorPos);
s8 Menu_ProcessInputNoWrapClearOnChoose(void);
void do_scheduled_bg_tilemap_copies_to_vram(void);
void clear_scheduled_bg_copies_to_vram(void);
void AddTextPrinterParameterized2(u8 windowId, u8 fontId, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, const struct TextColor *color, s8 speed, const u8 *str);
void sub_8197B1C(u8 windowId, bool8 copyToVram, u16 a2, u16 a3);
void sub_810F4D8(u8 windowId, bool32 someBool);
void *sub_80F68F0(u8 bgId, const void *src, u32 size, u16 offset, u8 mode);
void CreateWindow_SnapRight_StdPal(u8, u8, u8, u8, u16);
void Menu_PrintHelpSystemUIHeader(const u8 *, const u8 *, u8, u32, u8);
void PrintTextOnRightSnappedWindow(const u8 *, u32, u8);
void sub_810F71C(void);
void sub_810F740(void);
u8 ProgramAndPlaceMenuCursorOnWindow(u8 windowId, u8 fontId, u8 left, u8 top, u8 cursorHeight, u8 numChoices, u8 initialCursorPosition);
void CreateYesNoMenu(const struct WindowTemplate *, u8, u8, u8, u16, u8, u8);

void StartBlendTask(u8 eva_start, u8 evb_start, u8 eva_end, u8 evb_end, u8 ev_step, u8 priority);
bool8 IsBlendTaskActive(void);
void AddItemMenuActionTextPrinters(u8 windowId, u8 fontId, u8 left, u8 top, u8 letterSpacing, u8 lineHeight, u8 itemCount, const struct MenuAction *strs, const u8 *a8);
void sub_810F260(u8 windowId, u8 a1);

#endif // GUARD_MENU_H
