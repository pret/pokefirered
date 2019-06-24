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

static EWRAM_DATA bool8 gUnknown_203AB58[4] = {FALSE}; // knizz: bgmaps_that_need_syncing

EWRAM_DATA u16 gUnknown_203AB5C;
EWRAM_DATA void *gUnknown_203AB60[0x20];
extern const struct WindowTemplate sStandardTextBox_WindowTemplates[];
EWRAM_DATA u8 sStartMenuWindowId;

u16 CopyDecompressedTileDataToVram(u8 bgId, const void *src, u16 size, u16 offset, u8 mode);
void TaskFreeBufAfterCopyingTileDataToVram(u8 taskId);

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

void TaskFreeBufAfterCopyingTileDataToVram(u8 taskId)
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

u16 CopyDecompressedTileDataToVram(u8 bgId, const void *src, u16 size, u16 offset, u8 mode)
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

