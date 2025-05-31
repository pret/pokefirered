#ifndef GUARD_MENU_H
#define GUARD_MENU_H

#include "global.h"
#include "task.h"
#include "text.h"
#include "window.h"

#define MENU_NOTHING_CHOSEN -2
#define MENU_B_PRESSED -1

#define MENU_INFO_ICON_CAUGHT    0
#define MENU_INFO_ICON_TYPE      (NUMBER_OF_MON_TYPES + 1)
#define MENU_INFO_ICON_POWER     (NUMBER_OF_MON_TYPES + 2)
#define MENU_INFO_ICON_ACCURACY  (NUMBER_OF_MON_TYPES + 3)
#define MENU_INFO_ICON_PP        (NUMBER_OF_MON_TYPES + 4)
#define MENU_INFO_ICON_EFFECT    (NUMBER_OF_MON_TYPES + 5)

struct MenuAction
{
    const u8 *text;
    union {
        void (*void_u8)(u8);
        u8 (*u8_void)(void);
    } func;
};

extern EWRAM_DATA u8 gPopupTaskId;

// menu2
void AddTextPrinterParameterized3(u8 windowId, u8 fontId, u8 x, u8 y, const u8 * color, s8 speed, const u8 * str);
void AddTextPrinterParameterized4(u8 windowId, u8 fontId, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, const u8 *color, s8 speed, const u8 *str);
void AddTextPrinterParameterized5(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16), u8 letterSpacing, u8 lineSpacing);
void PrintPlayerNameOnWindow(u8 windowId, const u8 * src, u16 x, u16 y);
void StartBlendTask(u8 eva_start, u8 evb_start, u8 eva_end, u8 evb_end, u8 ev_step, u8 priority);
bool8 IsBlendTaskActive(void);
u8 Menu2_GetMonSpriteAnchorCoord(u16 species, u32 personality, u8 a2);
s8 Menu2_GetMonSpriteAnchorCoordMinusx20(u16 species, u32 personality, u8 a2);

// list_menu
void LoadMonIconPalAtOffset(u8 palOffset, u16 speciesId);
void DrawMonIconAtPos(u8 windowId, u16 speciesId, u32 personality, u16 x, u16 y);
void ListMenuLoadStdPalAt(u8 palOffset, u8 palId);
void BlitMenuInfoIcon(u8 windowId, u8 iconId, u16 x, u16 y);

// menu
s8 Menu_ProcessInputGridLayout(void);
u8 MultichoiceGrid_InitCursor(u8 windowId, u8 fontId, u8 left, u8 top, u8 optionWidth, u8 cols, u8 rows, u8 cursorPos);
void MultichoiceGrid_PrintItems(u8 windowId, u8 fontId, u8 itemWidth, u8 itemHeight, u8 cols, u8 rows, const struct MenuAction *strs);
void DestroyYesNoMenu(void);
s8 Menu_ProcessInputNoWrapClearOnChoose(void);
void CreateYesNoMenuAtPos(const struct WindowTemplate *window, u8 fontId, u8 left, u8 top, u16 baseTileNum, u8 paletteNum, u8 initialCursorPos);
void PrintMenuActionTexts(u8 windowId, u8 fontId, u8 left, u8 top, u8 letterSpacing, u8 lineHeight, u8 itemCount, const struct MenuAction *strs, const u8 *orderArray);
void PrintMenuActionTextsAtTop(u8 windowId, u8 fontId, u8 lineHeight, u8 itemCount, const struct MenuAction *strs);
void PrintMenuActionTextsWithSpacing(u8 windowId, u8 fontId, u8 left, u8 top, u8 lineHeight, u8 itemCount, const struct MenuAction *strs, u8 letterSpacing, u8 lineSpacing);
void PrintMenuActionTextsAtPos(u8 windowId, u8 fontId, u8 left, u8 top, u8 lineHeight, u8 itemCount, const struct MenuAction *strs);
s8 Menu_ProcessInputNoWrapAround_other(void);
s8 ProcessMenuInput_other(void);
s8 Menu_ProcessInputNoWrap(void);
s8 Menu_ProcessInput(void);
u8 Menu_GetCursorPos(void);
u8 Menu_MoveCursorNoWrapAround(s8 cursorDelta);
u8 Menu_MoveCursor(s8 cursorDelta);
u8 InitMenuNormal(u8 windowId, u8 fontId, u8 left, u8 top, u8 cursorHeight, u8 numChoices, u8 initialCursorPos);
void HofPCTopBar_PrintPair(const u8 *string, const u8 *string2, bool8 fgColorChooser, u8 notUsed, bool8 copyToVram);
void HofPCTopBar_Print(const u8 *string, u8 unUsed, bool8 copyToVram);
void HofPCTopBar_Clear(void);
void HofPCTopBar_RemoveWindow(void);
u8 HofPCTopBar_AddWindow(u8 bg, u8 width, u8 yPos, u8 palette, u16 baseTile);
void ClearStdWindowAndFrameToTransparent(u8 windowId, bool8 copyToVram);
void DrawStdFrameWithCustomTileAndPalette(u8 windowId, bool8 copyToVram, u16 baseTileNum, u8 paletteNum);
void ClearDialogWindowAndFrameToTransparent(u8 windowId, bool8 copyToVram);
void DrawDialogFrameWithCustomTileAndPalette(u8 windowId, bool8 copyToVram, u16 tileNum, u8 paletteNum);
struct WindowTemplate CreateWindowTemplate(u8 bg, u8 left, u8 top, u8 width, u8 height, u8 paletteNum, u16 baseBlock);
void SetWindowTemplateFields(struct WindowTemplate *template, u8 bg, u8 left, u8 top, u8 width, u8 height, u8 paletteNum, u16 baseBlock);
void RemoveMapNamePopUpWindow(void);
u8 GetMapNamePopUpWindowId(void);
u8 AddMapNamePopUpWindow(void);
u8 AddSecondaryPopUpWindow(void);
u8 GetSecondaryPopUpWindowId(void);
void RemoveSecondaryPopUpWindow(void);
void HBlankCB_DoublePopupWindow(void);
void InitPopupWindows(void);
u16 GetStandardFrameBaseTileNum(void);
void EraseFieldMessageBox(bool8 copyToVram);
u8 InitMenuInUpperLeftCornerNormal(u8 windowId, u8 numItems, u8 initialCursorPos);
u8 InitMenuInUpperLeftCorner(u8 windowId, u8 itemCount, u8 initialCursorPos, bool8 APressMuted);
void ScheduleBgCopyTilemapToVram(u8 bgId);
void ClearStdWindowAndFrame(u8 windowId, bool8 copyNow);
void LoadMessageBoxAndBorderGfx(void);
void DrawStdWindowFrame(u8 windowId, bool8 copyNow);
void Menu_LoadStdPal(void);
void Menu_LoadStdPalAt(u16 offset);
u8 GetPlayerTextSpeedDelay(void);
void DoScheduledBgTilemapCopiesToVram(void);
void ClearScheduledBgCopiesToVram(void);
void ResetTempTileDataBuffers(void);
void *DecompressAndCopyTileDataToVram(u8 bgId, const void *src, u32 size, u16 offset, u8 mode);
bool8 FreeTempTileDataBuffersIfPossible(void);
void SetBgTilemapPalette(u8 bgId, u8 left, u8 top, u8 width, u8 height, u8 palette);
void DrawDialogueFrame(u8 windowId, bool8 transfer);
u16 AddTextPrinterParameterized2(u8 windowId, u8 fontId, const u8 *str, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16), u8 fgColor, u8 bgColor, u8 shadowColor);
void ClearDialogWindowAndFrame(u8 windowId, bool8 copyToVram);
void DisplayYesNoMenuDefaultYes(void);
void InitStandardTextBoxWindows(void);
void DecompressAndLoadBgGfxUsingHeap(u8 bgId, const void *src, u32 size, u16 offset, u8 mode);
void InitTextBoxGfxAndPrinters(void);
void LoadMessageBoxAndFrameGfx(u8 windowId, bool8 copyToVram);
void SetStandardWindowBorderStyle(u8 windowId, bool8 copyToVram);
void ResetBgPositions(void);
void DisplayItemMessageOnField(u8 taskId, u8 fontId, const u8 *src, TaskFunc callback);
void *malloc_and_decompress(const void *src, u32 * size);
void DrawHelpMessageWindowWithText(const u8 * text);
u8 GetStartMenuWindowId(void);
void DestroyHelpMessageWindow_(void);
u8 AddStartMenuWindow(u8 height);
void RemoveStartMenuWindow(void);
u16 RunTextPrintersAndIsPrinter0Active(void);
void AddTextPrinterForMessage_2(bool8 allowSkippingDelayWithButtonPress);
void DisplayYesNoMenuWithDefault(void);
void AddTextPrinterWithCustomSpeedForMessage(bool8 allowSkippingDelayWithButtonPress, u8 speed);
void LoadSignPostWindowFrameGfx(void);
void AddTextPrinterForMessage(bool8 allowSkippingDelayWithButtonPress);
void DecompressAndLoadBgGfxUsingHeap2(u8 bgId, const void *src, u32 size, u16 offset, u8 mode);
void FreeAllOverworldWindowBuffers(void);
void CopyToBufferFromBgTilemap(u8 bgId, u16 *dest, u8 left, u8 top, u8 width, u8 height);

#endif // GUARD_MENU_H
