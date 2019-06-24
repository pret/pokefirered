#ifndef GUARD_NEW_MENU_HELPERS_H
#define GUARD_NEW_MENU_HELPERS_H

#include "global.h"
#include "text.h"
#include "task.h"

void sub_81973A4(void);
void sub_81973C4(u8, u8);
void sub_819746C(u8 windowId, bool8 copyToVram);
void sub_81973FC(u8, u8);
u16 AddTextPrinterParameterized2(u8 windowId, u8 fontId, const u8 *str, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16), u8 fgColor, u8 bgColor, u8 shadowColor);
void DisplayItemMessageOnField(u8 taskId, u8 bgId, const u8 *src, TaskFunc callback);
void sub_8197434(u8 a0, u8 a1);
void SetStandardWindowBorderStyle(u8 a0, u8 a1);
void sub_8197930(void);
u8 GetPlayerTextSpeed(void);
void ClearDialogWindowAndFrame(u8, u8);
u8 GetTextSpeedSetting(void);
void sub_80F6E9C(void);
void DrawDialogueFrame(u8 windowId, bool8 transfer);
void sub_80F7974(const u8 * text);
void sub_80F7998(void);
void sub_80F79A4(void);
void DrawStdWindowFrame(u8 windowId, bool8 copyNow);
void InitStandardTextBoxWindows(void);
void ResetBg0(void);
void ResetBgPositions(void);
void CopyRectIntoAltRect(u8 bgId, u16 *dest, u8 left, u8 top, u8 width, u8 height);
void SetBgRectPal(u8 bgId, u8 left, u8 top, u8 width, u8 height, u8 palette);
void DecompressAndLoadBgGfxUsingHeap(u8 bgId, const void *src, u32 size, u16 offset, u8 mode);
void DecompressAndLoadBgGfxUsingHeap2(u8 bgId, const void *src, u32 size, u16 offset, u8 mode);
void Menu_LoadStdPal(void);
void Menu_LoadStdPalAt(u16);
void * MallocAndDecompress(const void * src, u32 * size);
u16 GetStdWindowBaseTileNum(void);
void ClearStdWindowAndFrame(u8 taskId, bool8 copyNow);
void sub_80F6E9C(void);
void sub_80F771C(bool8 copyToVram);
void AddTextPrinterWithCustomSpeedForMessage(bool8 allowSkippingDelayWithButtonPress, u8 speed);
void AddTextPrinterDiffStyle(bool8 allowSkippingDelayWithButtonPress);
void AddTextPrinterForMessage(bool8 allowSkippingDelayWithButtonPress);
void SetStdWindowBorderStyle(u8 windowId, bool8 copyToVram);
void sub_80F7768(u8 windowId, bool8 copyToVram);
void DisplayYesNoMenuDefaultYes(void);
void DisplayYesNoMenuDefaultNo(void);
u8 sub_80F78E0(u8 windowId);
u8 GetStartMenuWindowId(void);
void RemoveStartMenuWindow(void);
void SetDefaultFontsPointer(void);

#endif // GUARD_NEW_MENU_HELPERS_H
