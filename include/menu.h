#ifndef GUARD_MENU_H
#define GUARD_MENU_H

#include "global.h"
#include "text.h"
#include "window.h"

#define MENU_NOTHING_CHOSEN -2
#define MENU_B_PRESSED -1

struct MenuAction
{
    const u8 *text;
    union {
        void (*void_u8)(u8);
        u8 (*u8_void)(void);
    } func;
};

void AddTextPrinterParameterized3(u8, u8, u8, u8, const void *, s8, const u8 *);
void sub_8198070(u8 windowId, bool8 copyToVram);
void SetWindowTemplateFields(struct WindowTemplate* template, u8 priority, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 palNum, u16 baseBlock);
void SetWindowBorderStyle(u8 windowId, bool8 copyToVram, u16 tileStart, u8 palette);
void ScheduleBgCopyTilemapToVram(u8 bgNum);
void PrintMenuTable(u8 idx, u8 nstrs, const struct MenuAction *strs);
void InitMenuInUpperLeftCornerPlaySoundWhenAPressed(u8 idx, u8 nstrs,u8);
u8 GetMenuCursorPos(void);
s8 ProcessMenuInput(void);
s8 ProcessMenuInputNoWrapAround(void);
void ResetTempTileDataBuffers(void);
void *DecompressAndCopyTileDataToVram(u8 bg_id, const void *src, u32 size, u16 offset, u8 mode);
bool8 FreeTempTileDataBuffersIfPossible(void);
u64 sub_8198A50(struct WindowTemplate*, u8, u8, u8, u8, u8, u8, u16); // returns something but it isn't used, fix when menu.s is decomp'd
s8 Menu_ProcessInputNoWrapClearOnChoose(void);
void DoScheduledBgTilemapCopiesToVram(void);
void ClearScheduledBgCopiesToVram(void);
void AddTextPrinterParameterized4(u8 windowId, u8 fontId, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, const struct TextColor *color, s8 speed, const u8 *str);
void sub_8197B1C(u8 windowId, bool8 copyToVram, u16 a2, u16 a3);
void ClearMenuWindow(u8 windowId, bool8 copyToVram);
void *DecompressAndCopyTileDataToVram2(u8 bgId, const void *src, u32 size, u16 offset, u8 mode);
void CreateWindow_SnapRight_StdPal(u8, u8, u8, u8, u16);
void Menu_PrintHelpSystemUIHeader(const u8 *, const u8 *, u8, u32, u8);
void PrintTextOnRightSnappedWindow(const u8 *, u32, u8);
void sub_810F71C(void);
void sub_810F740(void);
u8 ProgramAndPlaceMenuCursorOnWindow(u8 windowId, u8 fontId, u8 left, u8 top, u8 cursorHeight, u8 numChoices, u8 initialCursorPosition);
void CreateYesNoMenu(const struct WindowTemplate *, u8, u8, u8, u16, u8, u8);
void DrawDialogFrameWithCustomTileAndPalette(u8 windowId, bool8 copyToVram, u16 a2, u8 a3);
void StartBlendTask(u8 eva_start, u8 evb_start, u8 eva_end, u8 evb_end, u8 ev_step, u8 priority);
bool8 IsBlendTaskActive(void);
void AddItemMenuActionTextPrinters(u8 windowId, u8 fontId, u8 left, u8 top, u8 letterSpacing, u8 lineHeight, u8 itemCount, const struct MenuAction *strs, const u8 *a8);
void ClearMenuWindow_BorderThickness2(u8 windowId, u8 a1);
void PrintTextArray(u8, u8, u8, u8, u8, u8, const struct MenuAction *);

void sub_8107CD8(u8 palOffset, u16 speciesId);
void sub_8107CF8(u8 windowId, u16 speciesId, u32 personality, u16 x, u16 y);
void sub_8107D38(u8, u8);
void BlitMoveInfoIcon(u8 windowId, u8 iconId, u16 x, u16 y);

#endif // GUARD_MENU_H
