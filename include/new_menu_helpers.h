#ifndef GUARD_NEW_MENU_HELPERS_H
#define GUARD_NEW_MENU_HELPERS_H

#include "global.h"
#include "text.h"
#include "task.h"

void sub_81973A4(void);
void sub_81973C4(u8, u8);
void sub_819746C(u8 windowId, bool8 copyToVram);
void sub_81973FC(u8, u8);
u16 AddTextPrinterParameterized2(u8 windowId, u8 fontId, const u8 *str, u8 speed, void ( *callback)(u16, struct TextPrinter *), u8 fgColor, u8 bgColor, u8 shadowColor);
void DisplayItemMessageOnField(u8 taskId, u8 bgId, const u8 *src, TaskFunc callback);
void sub_8197434(u8 a0, u8 a1);
void SetStandardWindowBorderStyle(u8 a0, u8 a1);
void sub_8197930(void);
u8 GetPlayerTextSpeed(void);
void ClearDialogWindowAndFrame(u8, u8);
u8 GetTextSpeedSetting(void);
void sub_80F6E9C(void);
void DrawDialogueFrame(u8 windowId, bool8 transfer);
void sub_80F7974(const u8 *);
u8 GetStartMenuWindowId(void);
void sub_80F7998(void);
void sub_80F69E8(u8 bgId, const void *src, u32 size, u16 offset, u8 mode);
void DrawStdWindowFrame(u8 windowId, bool8 copyNow);
void InitStandardTextBoxWindows(void);
void ResetBg0(void);
void Menu_LoadStdPalAt(u16);
void * malloc_and_decompress(const void * src, u32 * size);
u16 sub_80F796C(void);
void sub_80F6B08(u8 bgId, u8 left, u8 top, u8 width, u8 height, u8 palette);
void DecompressAndLoadBgGfxUsingHeap(u8 bgId, const void * gfx, u32 size, u16 a3, u8 a4);
void ClearStdWindowAndFrame(u8 taskId, bool8 copyNow);

#endif // GUARD_NEW_MENU_HELPERS_H
