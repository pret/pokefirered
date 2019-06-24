#include "global.h"
#include "malloc.h"
#include "dma3.h"
#include "task.h"
#include "bg.h"
#include "gpu_regs.h"
#include "window.h"
#include "menu.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "quest_log.h"
#include "text.h"
#include "field_specials.h"
#include "text_window.h"
#include "script.h"
#include "graphics.h"
#include "palette.h"

#define DLG_WINDOW_PALETTE_NUM 15
#define DLG_WINDOW_BASE_TILE_NUM 0x200
#define STD_WINDOW_PALETTE_NUM 14
#define STD_WINDOW_BASE_TILE_NUM 0x214

static EWRAM_DATA bool8 gUnknown_203AB58[4] = {FALSE}; // knizz: bgmaps_that_need_syncing
static EWRAM_DATA u16 gUnknown_203AB5C = {0};
static EWRAM_DATA void *gUnknown_203AB60[0x20] = {NULL};

extern const struct WindowTemplate sStandardTextBox_WindowTemplates[];
extern const struct WindowTemplate sYesNo_WindowTemplate;
EWRAM_DATA u8 sStartMenuWindowId;

static u16 CopyDecompressedTileDataToVram(u8 bgId, const void *src, u16 size, u16 offset, u8 mode);
static void WindowFunc_DrawDialogueFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_DrawStandardFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_ClearDialogWindowAndFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_ClearStdWindowAndFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void TaskFreeBufAfterCopyingTileDataToVram(u8 taskId);

void ClearScheduledBgCopiesToVram(void)
{
    memset(gUnknown_203AB58, 0, sizeof(gUnknown_203AB58));
}

void ScheduleBgCopyTilemapToVram(u8 bgId)
{
    gUnknown_203AB58[bgId] = TRUE;
}

void DoScheduledBgTilemapCopiesToVram(void)
{
    if (gUnknown_203AB58[0] == TRUE)
    {
        CopyBgTilemapBufferToVram(0);
        gUnknown_203AB58[0] = FALSE;
    }
    if (gUnknown_203AB58[1] == TRUE)
    {
        CopyBgTilemapBufferToVram(1);
        gUnknown_203AB58[1] = FALSE;
    }
    if (gUnknown_203AB58[2] == TRUE)
    {
        CopyBgTilemapBufferToVram(2);
        gUnknown_203AB58[2] = FALSE;
    }
    if (gUnknown_203AB58[3] == TRUE)
    {
        CopyBgTilemapBufferToVram(3);
        gUnknown_203AB58[3] = FALSE;
    }
}

void ResetTempTileDataBuffers(void)
{
    int i;
    for (i = 0; i < (s32)ARRAY_COUNT(gUnknown_203AB60); i++)
    {
        gUnknown_203AB60[i] = NULL;
    }
    gUnknown_203AB5C = 0;
}

bool8 FreeTempTileDataBuffersIfPossible(void)
{
    int i;

    if (!IsDma3ManagerBusyWithBgCopy())
    {
        if (gUnknown_203AB5C)
        {
            for (i = 0; i < gUnknown_203AB5C; i++)
            {
                FREE_AND_SET_NULL(gUnknown_203AB60[i]);
            }
            gUnknown_203AB5C = 0;
        }
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

void *DecompressAndCopyTileDataToVram(u8 bgId, const void *src, u32 size, u16 offset, u8 mode)
{
    u32 sizeOut;
    if (gUnknown_203AB5C < ARRAY_COUNT(gUnknown_203AB60))
    {
        void *ptr = MallocAndDecompress(src, &sizeOut);
        if (!size)
            size = sizeOut;
        if (ptr)
        {
            CopyDecompressedTileDataToVram(bgId, ptr, size, offset, mode);
            gUnknown_203AB60[gUnknown_203AB5C++] = ptr;
        }
        return ptr;
    }
    return NULL;
}

void *DecompressAndCopyTileDataToVram2(u8 bgId, const void *src, u32 size, u16 offset, u8 mode)
{
    u32 sizeOut;
    if (gUnknown_203AB5C < ARRAY_COUNT(gUnknown_203AB60))
    {
        void *ptr = MallocAndDecompress(src, &sizeOut);
        if (sizeOut > size)
            sizeOut = size;
        if (ptr)
        {
            CopyDecompressedTileDataToVram(bgId, ptr, sizeOut, offset, mode);
            gUnknown_203AB60[gUnknown_203AB5C++] = ptr;
        }
        return ptr;
    }
    return NULL;
}

void DecompressAndLoadBgGfxUsingHeap(u8 bgId, const void *src, u32 size, u16 offset, u8 mode)
{
    u32 sizeOut;
    void *ptr = MallocAndDecompress(src, &sizeOut);
    if (!size)
        size = sizeOut;
    if (ptr)
    {
        u8 taskId = CreateTask(TaskFreeBufAfterCopyingTileDataToVram, 0);
        gTasks[taskId].data[0] = CopyDecompressedTileDataToVram(bgId, ptr, size, offset, mode);
        SetWordTaskArg(taskId, 1, (u32)ptr);
    }
}

void DecompressAndLoadBgGfxUsingHeap2(u8 bgId, const void *src, u32 size, u16 offset, u8 mode)
{
    u32 sizeOut;
    void *ptr = MallocAndDecompress(src, &sizeOut);
        if (sizeOut > size)
            sizeOut = size;
    if (ptr)
    {
        u8 taskId = CreateTask(TaskFreeBufAfterCopyingTileDataToVram, 0);
        gTasks[taskId].data[0] = CopyDecompressedTileDataToVram(bgId, ptr, sizeOut, offset, mode);
        SetWordTaskArg(taskId, 1, (u32)ptr);
    }
}

static void TaskFreeBufAfterCopyingTileDataToVram(u8 taskId)
{
    if (!CheckForSpaceForDma3Request(gTasks[taskId].data[0]))
    {
        Free((void *)GetWordTaskArg(taskId, 1));
        DestroyTask(taskId);
    }
}

void *MallocAndDecompress(const void *src, u32 *size)
{
    void *ptr;
    u8 *sizeAsBytes = (u8 *)size;
    u8 *srcAsBytes = (u8 *)src;

    sizeAsBytes[0] = srcAsBytes[1];
    sizeAsBytes[1] = srcAsBytes[2];
    sizeAsBytes[2] = srcAsBytes[3];
    sizeAsBytes[3] = 0;

    ptr = Alloc(*size);
    if (ptr)
        LZ77UnCompWram(src, ptr);
    return ptr;
}

static u16 CopyDecompressedTileDataToVram(u8 bgId, const void *src, u16 size, u16 offset, u8 mode)
{
    switch (mode)
    { // different to EM
    case 1:
        break;
    case 0:        
    default:
        return LoadBgTiles(bgId, src, size, offset);
    }
    return LoadBgTilemap(bgId, src, size, offset);
}

void SetBgRectPal(u8 bgId, u8 left, u8 top, u8 width, u8 height, u8 palette)
{
    u8 i;
    u8 j;
    u16 *ptr = GetBgTilemapBuffer(bgId);

    for (i = top; i < top + height; i++)
    {
        for (j = left; j < left + width; j++)
        {
            ptr[(i * 32) + j] = (ptr[(i * 32) + j] & 0xFFF) | (palette << 12);
        }
    }
}

void CopyRectIntoAltRect(u8 bgId, u16 *dest, u8 left, u8 top, u8 width, u8 height)
{
    u8 i;
    u8 j;
    const u16 *src = GetBgTilemapBuffer(bgId);

    for (i = 0; i < height; i++)
    {
        for (j = 0; j < width; j++)
        {
            dest[(i * width) + j] = src[(i + top) * 32 + j + left];
        }
    }
}

void ResetBgPositions(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgY(3, 0, 0);
}

void InitStandardTextBoxWindows(void)
{
    InitWindows(sStandardTextBox_WindowTemplates);
    sStartMenuWindowId = 0xFF;
    MapNamePopupWindowIdSetDummy();
}

void FreeAllOverworldWindowBuffers(void)
{
    FreeAllWindowBuffers();
}

void ResetBg0(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    DeactivateAllTextPrinters();
    sub_80F6E9C();
}

u16 RunTextPrinters_CheckPrinter0Active(void)
{
    RunTextPrinters();
    return IsTextPrinterActive(0);
}

u16 AddTextPrinterParameterized2(u8 windowId, u8 fontId, const u8 *str, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16), u8 fgColor, u8 bgColor, u8 shadowColor)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = 0;
    printer.y = 1;
    printer.currentX = 0;
    printer.currentY = 1;
    printer.letterSpacing = 1; // different to EM
    printer.lineSpacing = 1; // different to EM
    printer.unk = 0;
    printer.fgColor = fgColor;
    printer.bgColor = bgColor;
    printer.shadowColor = shadowColor;
    gTextFlags.useAlternateDownArrow = 0;
    return AddTextPrinter(&printer, speed, callback);
}

void AddTextPrinterDiffStyle(bool8 allowSkippingDelayWithButtonPress)
{
    u8 result;
    void *nptr = NULL; // This is required for matching

    gTextFlags.canABSpeedUpPrint = allowSkippingDelayWithButtonPress;    
    result = ContextNpcGetTextColor();
    if (!result)
        AddTextPrinterParameterized2(0, 4, gStringVar4, GetTextSpeedSetting(), nptr, 8, 1, 3);
    else if (result == 1)
        AddTextPrinterParameterized2(0, 5, gStringVar4, GetTextSpeedSetting(), nptr, 4, 1, 3);
    else
        AddTextPrinterParameterized2(0, 2, gStringVar4, GetTextSpeedSetting(), nptr, 2, 1, 3);
}

void AddTextPrinterForMessage(bool8 allowSkippingDelayWithButtonPress)
{
    gTextFlags.canABSpeedUpPrint = allowSkippingDelayWithButtonPress;
    AddTextPrinterParameterized2(0, 2, gStringVar4, GetTextSpeedSetting(), NULL, 2, 1, 3);
}

void AddTextPrinterWithCustomSpeedForMessage(bool8 allowSkippingDelayWithButtonPress, u8 speed)
{
    gTextFlags.canABSpeedUpPrint = allowSkippingDelayWithButtonPress;
    AddTextPrinterParameterized2(0, 2, gStringVar4, speed, NULL, 2, 1, 3);
}

void sub_80F6E9C(void)
{
    if (gUnknown_203ADFA == 2)
    {
        gTextFlags.autoScroll = 1;
        TextWindow_LoadTilesStdFrame1(0, DLG_WINDOW_BASE_TILE_NUM);
    }
    else
    {
        Menu_LoadStdPal();
        TextWindow_LoadResourcesStdFrame0(0, DLG_WINDOW_BASE_TILE_NUM, DLG_WINDOW_PALETTE_NUM * 0x10);
    }
    TextWindow_SetUserSelectedFrame(0, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM * 0x10);
}

void DrawDialogueFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_DrawDialogueFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, 3);
}

void DrawStdWindowFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_DrawStandardFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, 3);
}

void ClearDialogWindowAndFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_ClearDialogWindowAndFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    ClearWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, 3);
    if (gUnknown_203ADFA == 2)
        sub_8111134();
}

void ClearStdWindowAndFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_ClearStdWindowAndFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    ClearWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, 3);
}

static void WindowFunc_DrawStandardFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    int i;

    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 0, tilemapLeft - 1, tilemapTop - 1, 1, 1, STD_WINDOW_PALETTE_NUM);
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 1, tilemapLeft, tilemapTop - 1, width, 1, STD_WINDOW_PALETTE_NUM);
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 2, tilemapLeft + width, tilemapTop - 1, 1, 1, STD_WINDOW_PALETTE_NUM);
    for (i = tilemapTop; i < tilemapTop + height; i++)
    {
        FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 3, tilemapLeft - 1, i, 1, 1, STD_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 5, tilemapLeft + width, i, 1, 1, STD_WINDOW_PALETTE_NUM);
    }
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 6, tilemapLeft - 1, tilemapTop + height, 1, 1, STD_WINDOW_PALETTE_NUM);
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 7, tilemapLeft, tilemapTop + height, width, 1, STD_WINDOW_PALETTE_NUM);
    FillBgTilemapBufferRect(bg, STD_WINDOW_BASE_TILE_NUM + 8, tilemapLeft + width, tilemapTop + height, 1, 1, STD_WINDOW_PALETTE_NUM);
}

static void WindowFunc_DrawDialogueFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    if (!IsMsgSignPost() || gUnknown_203ADFA == 2)
    {
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 0, tilemapLeft - 2, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 1, tilemapLeft - 1, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 2, tilemapLeft, tilemapTop - 1, width, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 3, tilemapLeft + width, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 4, tilemapLeft + width + 1, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 5, tilemapLeft - 2, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 6, tilemapLeft - 1, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 8, tilemapLeft + width, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 9, tilemapLeft + width + 1, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 10, tilemapLeft - 2, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 11, tilemapLeft - 1, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 12, tilemapLeft + width, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 13, tilemapLeft + width + 1, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 10), tilemapLeft - 2, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 11), tilemapLeft - 1, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 12), tilemapLeft + width, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 13), tilemapLeft + width + 1, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 5), tilemapLeft - 2, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 6), tilemapLeft - 1, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 8), tilemapLeft + width, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 9), tilemapLeft + width + 1, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 0), tilemapLeft - 2, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 1), tilemapLeft - 1, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 2), tilemapLeft, tilemapTop + 4, width, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 3), tilemapLeft + width, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 4), tilemapLeft + width + 1, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
    }
    else
    {
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 0, tilemapLeft - 2, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 1, tilemapLeft - 1, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 2, tilemapLeft, tilemapTop - 1, width, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 3, tilemapLeft + width, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 4, tilemapLeft + width + 1, tilemapTop - 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 5, tilemapLeft - 2, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 6, tilemapLeft - 1, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 8, tilemapLeft + width, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 9, tilemapLeft + width + 1, tilemapTop, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 10, tilemapLeft - 2, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 11, tilemapLeft - 1, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 12, tilemapLeft + width, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, DLG_WINDOW_BASE_TILE_NUM + 13, tilemapLeft + width + 1, tilemapTop + 1, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 5), tilemapLeft - 2, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 6), tilemapLeft - 1, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 8), tilemapLeft + width, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 9), tilemapLeft + width + 1, tilemapTop + 2, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 10), tilemapLeft - 2, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 11), tilemapLeft - 1, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 12), tilemapLeft + width, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 13), tilemapLeft + width + 1, tilemapTop + 3, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 0), tilemapLeft - 2, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 1), tilemapLeft - 1, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 2), tilemapLeft, tilemapTop + 4, width, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 3), tilemapLeft + width, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
        FillBgTilemapBufferRect(bg, BG_TILE_V_FLIP(DLG_WINDOW_BASE_TILE_NUM + 4), tilemapLeft + width + 1, tilemapTop + 4, 1, 1, DLG_WINDOW_PALETTE_NUM);
    }
}

static void WindowFunc_ClearStdWindowAndFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    FillBgTilemapBufferRect(bg, 0, tilemapLeft - 1, tilemapTop - 1, width + 2, height + 2, STD_WINDOW_PALETTE_NUM);
}

static void WindowFunc_ClearDialogWindowAndFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum)
{
    FillBgTilemapBufferRect(bg, 0, tilemapLeft - 2, tilemapTop - 1, width + 4, height + 2, STD_WINDOW_PALETTE_NUM);
}

void sub_80F771C(bool8 copyToVram)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 0x20, 0x20, 0x11);
    if (copyToVram == TRUE)
        CopyBgTilemapBufferToVram(0);
}

void SetStdWindowBorderStyle(u8 windowId, bool8 copyToVram)
{
    SetWindowBorderStyle(windowId, copyToVram, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM);
}

void sub_80F7768(u8 windowId, bool8 copyToVram)
{
    if (gUnknown_203ADFA == 2)
    {
        gTextFlags.autoScroll = 1;
        TextWindow_LoadTilesStdFrame1(0, DLG_WINDOW_BASE_TILE_NUM);
    }
    else
    {
        TextWindow_LoadResourcesStdFrame0(windowId, DLG_WINDOW_BASE_TILE_NUM, DLG_WINDOW_PALETTE_NUM * 0x10);
    }
    DrawDialogFrameWithCustomTileAndPalette(windowId, copyToVram, DLG_WINDOW_BASE_TILE_NUM, DLG_WINDOW_PALETTE_NUM);
}

void Menu_LoadStdPal(void)
{
    LoadPalette(gTMCaseMainWindowPalette, STD_WINDOW_PALETTE_NUM * 0x10, 0x14);
}

void Menu_LoadStdPalAt(u16 offset)
{
    LoadPalette(gTMCaseMainWindowPalette, offset, 0x14);
}

static const u16 *GetTmCaseMainWindowPalette(void)
{
    return gTMCaseMainWindowPalette;
}

static u16 GetStdPalColor(u8 colorNum)
{
    if (colorNum > 0xF)
        colorNum = 0;
    return gTMCaseMainWindowPalette[colorNum];
}

void DisplayItemMessageOnField(u8 taskId, u8 bgId, const u8 *string, TaskFunc callback)
{
    sub_80F6E9C();
    DisplayMessageAndContinueTask(taskId, 0, DLG_WINDOW_BASE_TILE_NUM, DLG_WINDOW_PALETTE_NUM, bgId, GetTextSpeedSetting(), string, callback);
    CopyWindowToVram(0, 3);
}

void DisplayYesNoMenuDefaultYes(void)
{
    CreateYesNoMenu(&sYesNo_WindowTemplate, 2, 0, 2, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM, 0);
}

void DisplayYesNoMenuDefaultNo(void)
{
    CreateYesNoMenu(&sYesNo_WindowTemplate, 2, 0, 2, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM, 1);
}

