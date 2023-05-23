#include "global.h"
#include "gflib.h"
#include "help_message.h"
#include "menu.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "quest_log.h"
#include "field_specials.h"
#include "text_window.h"
#include "script.h"

#define DLG_WINDOW_PALETTE_NUM 15
#define DLG_WINDOW_BASE_TILE_NUM 0x200
#define STD_WINDOW_PALETTE_NUM 14
#define STD_WINDOW_BASE_TILE_NUM 0x214

static EWRAM_DATA bool8 sScheduledBgCopiesToVram[4] = {FALSE};
static EWRAM_DATA u16 sTempTileDataBufferCursor = {0};
static EWRAM_DATA void *sTempTileDataBuffers[0x20] = {NULL};
static EWRAM_DATA u8 sStartMenuWindowId = {0};

static const u16 sUnusedWindow_Gfx[] = INCBIN_U16("graphics/text_window/unused.4bpp");
const u16 gMenuMessageWindow_Gfx[] = INCBIN_U16("graphics/text_window/menu_message.4bpp");

const u16 gStandardMenuPalette[] = INCBIN_U16("graphics/interface/std_menu.gbapal");

static const u8 sTextSpeedFrameDelays[] =
{
    [OPTIONS_TEXT_SPEED_SLOW] = 8,
    [OPTIONS_TEXT_SPEED_MID]  = 4,
    [OPTIONS_TEXT_SPEED_FAST] = 1
};

static const struct WindowTemplate sStandardTextBox_WindowTemplates[] = 
{
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = DLG_WINDOW_PALETTE_NUM,
        .baseBlock = 0x198,
    },
    DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sYesNo_WindowTemplate = 
{
    .bg = 0,
    .tilemapLeft = 21,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = DLG_WINDOW_PALETTE_NUM,
    .baseBlock = 0x125,
};

static const struct FontInfo gFontInfos[] = 
{
    [FONT_SMALL] = {
        .fontFunction = FontFunc_Small,
        .maxLetterWidth = 8,
        .maxLetterHeight = 13,
        .letterSpacing = 0,
        .lineSpacing = 0,
        .fgColor = 2,
        .bgColor = 1,
        .shadowColor = 3,
    },
    [FONT_NORMAL_COPY_1] = {
        .fontFunction = FontFunc_NormalCopy1,
        .maxLetterWidth = 8,
        .maxLetterHeight = 14,
        .letterSpacing = 0,
        .lineSpacing = 0,
        .fgColor = 2,
        .bgColor = 1,
        .shadowColor = 3,
    },
    [FONT_NORMAL] = {
        .fontFunction = FontFunc_Normal,
        .maxLetterWidth = 10,
        .maxLetterHeight = 14,
        .letterSpacing = 1,
        .lineSpacing = 0,
        .fgColor = 2,
        .bgColor = 1,
        .shadowColor = 3,
    },
    [FONT_NORMAL_COPY_2] = {
        .fontFunction = FontFunc_NormalCopy2,
        .maxLetterWidth = 10,
        .maxLetterHeight = 14,
        .letterSpacing = 1,
        .lineSpacing = 0,
        .fgColor = 2,
        .bgColor = 1,
        .shadowColor = 3,
    },
    [FONT_MALE] = {
        .fontFunction = FontFunc_Male,
        .maxLetterWidth = 10,
        .maxLetterHeight = 14,
        .letterSpacing = 0,
        .lineSpacing = 0,
        .fgColor = 2,
        .bgColor = 1,
        .shadowColor = 3,
    },
    [FONT_FEMALE] = {
        .fontFunction = FontFunc_Female,
        .maxLetterWidth = 10,
        .maxLetterHeight = 14,
        .letterSpacing = 0,
        .lineSpacing = 0,
        .fgColor = 2,
        .bgColor = 1,
        .shadowColor = 3,
    },
    [FONT_BRAILLE] = {
        .fontFunction = FontFunc_Braille,
        .maxLetterWidth = 8,
        .maxLetterHeight = 16,
        .letterSpacing = 0,
        .lineSpacing = 2,
        .fgColor = 2,
        .bgColor = 1,
        .shadowColor = 3,
    },
    [FONT_BOLD] = {
        .fontFunction = NULL,
        .maxLetterWidth = 8,
        .maxLetterHeight = 8,
        .letterSpacing = 0,
        .lineSpacing = 0,
        .fgColor = 1,
        .bgColor = 2,
        .shadowColor = 15,
    }
};

static const u8 gMenuCursorDimensions[][2] = 
{
    [FONT_SMALL]         = { 8,  13 },
    [FONT_NORMAL_COPY_1] = { 8,  14 },
    [FONT_NORMAL]        = { 8,  14 },
    [FONT_NORMAL_COPY_2] = { 8,  14 },
    [FONT_MALE]          = { 8,  14 },
    [FONT_FEMALE]        = { 8,  14 },
    [FONT_BRAILLE]       = { 8,  16 },
    [FONT_BOLD]          = {}
};

static u16 CopyDecompressedTileDataToVram(u8 bgId, const void *src, u16 size, u16 offset, u8 mode);
static void WindowFunc_DrawDialogueFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_DrawStandardFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_ClearDialogWindowAndFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void WindowFunc_ClearStdWindowAndFrame(u8 bg, u8 tilemapLeft, u8 tilemapTop, u8 width, u8 height, u8 paletteNum);
static void TaskFreeBufAfterCopyingTileDataToVram(u8 taskId);

void ClearScheduledBgCopiesToVram(void)
{
    memset(sScheduledBgCopiesToVram, 0, sizeof(sScheduledBgCopiesToVram));
}

void ScheduleBgCopyTilemapToVram(u8 bgId)
{
    sScheduledBgCopiesToVram[bgId] = TRUE;
}

void DoScheduledBgTilemapCopiesToVram(void)
{
    if (sScheduledBgCopiesToVram[0] == TRUE)
    {
        CopyBgTilemapBufferToVram(0);
        sScheduledBgCopiesToVram[0] = FALSE;
    }
    if (sScheduledBgCopiesToVram[1] == TRUE)
    {
        CopyBgTilemapBufferToVram(1);
        sScheduledBgCopiesToVram[1] = FALSE;
    }
    if (sScheduledBgCopiesToVram[2] == TRUE)
    {
        CopyBgTilemapBufferToVram(2);
        sScheduledBgCopiesToVram[2] = FALSE;
    }
    if (sScheduledBgCopiesToVram[3] == TRUE)
    {
        CopyBgTilemapBufferToVram(3);
        sScheduledBgCopiesToVram[3] = FALSE;
    }
}

void ResetTempTileDataBuffers(void)
{
    int i;

    for (i = 0; i < (s32)NELEMS(sTempTileDataBuffers); i++)
    {
        sTempTileDataBuffers[i] = NULL;
    }
    sTempTileDataBufferCursor = 0;
}

bool8 FreeTempTileDataBuffersIfPossible(void)
{
    int i;

    if (!IsDma3ManagerBusyWithBgCopy())
    {
        if (sTempTileDataBufferCursor)
        {
            for (i = 0; i < sTempTileDataBufferCursor; i++)
            {
                FREE_AND_SET_NULL(sTempTileDataBuffers[i]);
            }
            sTempTileDataBufferCursor = 0;
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

    if (sTempTileDataBufferCursor < NELEMS(sTempTileDataBuffers))
    {
        void *ptr = MallocAndDecompress(src, &sizeOut);
        if (!size)
            size = sizeOut;
        if (ptr)
        {
            CopyDecompressedTileDataToVram(bgId, ptr, size, offset, mode);
            sTempTileDataBuffers[sTempTileDataBufferCursor++] = ptr;
        }
        return ptr;
    }
    return NULL;
}

void *DecompressAndCopyTileDataToVram2(u8 bgId, const void *src, u32 size, u16 offset, u8 mode)
{
    u32 sizeOut;

    if (sTempTileDataBufferCursor < NELEMS(sTempTileDataBuffers))
    {
        void *ptr = MallocAndDecompress(src, &sizeOut);
        if (sizeOut > size)
            sizeOut = size;
        if (ptr)
        {
            CopyDecompressedTileDataToVram(bgId, ptr, sizeOut, offset, mode);
            sTempTileDataBuffers[sTempTileDataBufferCursor++] = ptr;
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
    if (!WaitDma3Request(gTasks[taskId].data[0]))
    {
        Free((void *)GetWordTaskArg(taskId, 1));
        DestroyTask(taskId);
    }
}

void *MallocAndDecompress(const void *src, u32 *size)
{
    void *ptr;
    u8 *sizeAsBytes = (u8 *)size;
    const u8 *srcAsBytes = src;

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
    {
    case 1:
        break;
    case 0:        
    default:
        return LoadBgTiles(bgId, src, size, offset);
    }
    return LoadBgTilemap(bgId, src, size, offset);
}

void SetBgTilemapPalette(u8 bgId, u8 left, u8 top, u8 width, u8 height, u8 palette)
{
    u8 i, j;
    u16 *ptr = GetBgTilemapBuffer(bgId);

    for (i = top; i < top + height; i++)
    {
        for (j = left; j < left + width; j++)
        {
            ptr[(i * 32) + j] = (ptr[(i * 32) + j] & 0xFFF) | (palette << 12);
        }
    }
}

void CopyToBufferFromBgTilemap(u8 bgId, u16 *dest, u8 left, u8 top, u8 width, u8 height)
{
    u8 i,j;
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

void InitTextBoxGfxAndPrinters(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    DeactivateAllTextPrinters();
    LoadStdWindowFrameGfx();
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
    printer.letterSpacing = 1;
    printer.lineSpacing = 1;
    printer.unk = 0;
    printer.fgColor = fgColor;
    printer.bgColor = bgColor;
    printer.shadowColor = shadowColor;
    gTextFlags.useAlternateDownArrow = 0;
    return AddTextPrinter(&printer, speed, callback);
}

void AddTextPrinterDiffStyle(bool8 allowSkippingDelayWithButtonPress)
{
    u8 color;
    void *nptr = NULL;

    gTextFlags.canABSpeedUpPrint = allowSkippingDelayWithButtonPress;    
    color = ContextNpcGetTextColor();
    if (color == NPC_TEXT_COLOR_MALE)
        AddTextPrinterParameterized2(0, FONT_MALE, gStringVar4, GetTextSpeedSetting(), nptr, TEXT_COLOR_BLUE, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
    else if (color == NPC_TEXT_COLOR_FEMALE)
        AddTextPrinterParameterized2(0, FONT_FEMALE, gStringVar4, GetTextSpeedSetting(), nptr, TEXT_COLOR_RED, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
    else // NPC_TEXT_COLOR_MON / NPC_TEXT_COLOR_NEUTRAL
        AddTextPrinterParameterized2(0, FONT_NORMAL, gStringVar4, GetTextSpeedSetting(), nptr, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
}

void AddTextPrinterForMessage(bool8 allowSkippingDelayWithButtonPress)
{
    gTextFlags.canABSpeedUpPrint = allowSkippingDelayWithButtonPress;
    AddTextPrinterParameterized2(0, FONT_NORMAL, gStringVar4, GetTextSpeedSetting(), NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
}

void AddTextPrinterWithCustomSpeedForMessage(bool8 allowSkippingDelayWithButtonPress, u8 speed)
{
    gTextFlags.canABSpeedUpPrint = allowSkippingDelayWithButtonPress;
    AddTextPrinterParameterized2(0, FONT_NORMAL, gStringVar4, speed, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
}

void LoadStdWindowFrameGfx(void)
{
    if (gQuestLogState == QL_STATE_PLAYBACK)
    {
        gTextFlags.autoScroll = 1;
        LoadQuestLogWindowTiles(0, DLG_WINDOW_BASE_TILE_NUM);
    }
    else
    {
        Menu_LoadStdPal();
        LoadMenuMessageWindowGfx(0, DLG_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(DLG_WINDOW_PALETTE_NUM));
    }
    LoadUserWindowGfx(0, STD_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(STD_WINDOW_PALETTE_NUM));
}

void DrawDialogueFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_DrawDialogueFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
}

void DrawStdWindowFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_DrawStandardFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
}

void ClearDialogWindowAndFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_ClearDialogWindowAndFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    ClearWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
    if (gQuestLogState == QL_STATE_PLAYBACK)
        CommitQuestLogWindow1();
}

void ClearStdWindowAndFrame(u8 windowId, bool8 copyToVram)
{
    CallWindowFunction(windowId, WindowFunc_ClearStdWindowAndFrame);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    ClearWindowTilemap(windowId);
    if (copyToVram == TRUE)
        CopyWindowToVram(windowId, COPYWIN_FULL);
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
    if (!IsMsgSignpost() || gQuestLogState == QL_STATE_PLAYBACK)
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

void EraseFieldMessageBox(bool8 copyToVram)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 0x20, 0x20, 17);
    if (copyToVram == TRUE)
        CopyBgTilemapBufferToVram(0);
}

void SetStdWindowBorderStyle(u8 windowId, bool8 copyToVram)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, copyToVram, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM);
}

void LoadMessageBoxAndFrameGfx(u8 windowId, bool8 copyToVram)
{
    if (gQuestLogState == QL_STATE_PLAYBACK)
    {
        gTextFlags.autoScroll = 1;
        LoadQuestLogWindowTiles(0, DLG_WINDOW_BASE_TILE_NUM);
    }
    else
    {
        LoadMenuMessageWindowGfx(windowId, DLG_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(DLG_WINDOW_PALETTE_NUM));
    }
    DrawDialogFrameWithCustomTileAndPalette(windowId, copyToVram, DLG_WINDOW_BASE_TILE_NUM, DLG_WINDOW_PALETTE_NUM);
}

void Menu_LoadStdPal(void)
{
    LoadPalette(gStandardMenuPalette, BG_PLTT_ID(STD_WINDOW_PALETTE_NUM), PLTT_SIZEOF(10));
}

void Menu_LoadStdPalAt(u16 offset)
{
    LoadPalette(gStandardMenuPalette, offset, PLTT_SIZEOF(10));
}

// Unused
static const u16 *GetStdMenuPalette(void)
{
    return gStandardMenuPalette;
}

static u16 GetStdPalColor(u8 colorNum)
{
    if (colorNum > 15)
        colorNum = 0;
    return gStandardMenuPalette[colorNum];
}

void DisplayItemMessageOnField(u8 taskId, u8 fontId, const u8 *string, TaskFunc callback)
{
    LoadStdWindowFrameGfx();
    DisplayMessageAndContinueTask(taskId, 0, DLG_WINDOW_BASE_TILE_NUM, DLG_WINDOW_PALETTE_NUM, fontId, GetTextSpeedSetting(), string, callback);
    CopyWindowToVram(0, COPYWIN_FULL);
}

void DisplayYesNoMenuDefaultYes(void)
{
    CreateYesNoMenu(&sYesNo_WindowTemplate, FONT_NORMAL, 0, 2, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM, 0);
}

void DisplayYesNoMenuDefaultNo(void)
{
    CreateYesNoMenu(&sYesNo_WindowTemplate, FONT_NORMAL, 0, 2, STD_WINDOW_BASE_TILE_NUM, STD_WINDOW_PALETTE_NUM, 1);
}

u8 GetTextSpeedSetting(void)
{
    u32 speed;
    if (gSaveBlock2Ptr->optionsTextSpeed > OPTIONS_TEXT_SPEED_FAST)
        gSaveBlock2Ptr->optionsTextSpeed = OPTIONS_TEXT_SPEED_MID;
    return sTextSpeedFrameDelays[gSaveBlock2Ptr->optionsTextSpeed];
}

u8 CreateStartMenuWindow(u8 height)
{
    if (sStartMenuWindowId == 0xFF)
    {
        struct WindowTemplate template = SetWindowTemplateFields(0, 0x16, 1, 7, height * 2 - 1, DLG_WINDOW_PALETTE_NUM, 0x13D);
        sStartMenuWindowId = AddWindow(&template);
        PutWindowTilemap(sStartMenuWindowId);
    }
    return sStartMenuWindowId;
}

u8 GetStartMenuWindowId(void)
{
    return sStartMenuWindowId;
}

void RemoveStartMenuWindow(void)
{
    if (sStartMenuWindowId != 0xFF)
    {
        RemoveWindow(sStartMenuWindowId);
        sStartMenuWindowId = 0xFF;
    }
}

static u16 GetDlgWindowBaseTileNum(void)
{
    return DLG_WINDOW_BASE_TILE_NUM;
}

u16 GetStdWindowBaseTileNum(void)
{
    return STD_WINDOW_BASE_TILE_NUM;
}

void DrawHelpMessageWindowWithText(const u8 * text)
{
    LoadHelpMessageWindowGfx(CreateHelpMessageWindow(), DLG_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(DLG_WINDOW_PALETTE_NUM));
    PrintTextOnHelpMessageWindow(text, 2);
}

void DestroyHelpMessageWindow_(void)
{
    DestroyHelpMessageWindow(2);
}

void LoadSignpostWindowFrameGfx(void)
{
    Menu_LoadStdPal();
    LoadSignpostWindowGfx(0, DLG_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(DLG_WINDOW_PALETTE_NUM));
    LoadUserWindowGfx(0, STD_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(STD_WINDOW_PALETTE_NUM));
}

void SetDefaultFontsPointer(void)
{
    SetFontsPointer(&gFontInfos[0]);
}

u8 GetFontAttribute(u8 fontId, u8 attributeId)
{
    int result = 0;

    switch (attributeId)
    {
    case FONTATTR_MAX_LETTER_WIDTH:
        result = gFontInfos[fontId].maxLetterWidth;
        break;
    case FONTATTR_MAX_LETTER_HEIGHT:
        result = gFontInfos[fontId].maxLetterHeight;
        break;
    case FONTATTR_LETTER_SPACING:
        result = gFontInfos[fontId].letterSpacing;
        break;
    case FONTATTR_LINE_SPACING:
        result = gFontInfos[fontId].lineSpacing;
        break;
    case FONTATTR_UNKNOWN:
        result = gFontInfos[fontId].unk;
        break;
    case FONTATTR_COLOR_FOREGROUND:
        result = gFontInfos[fontId].fgColor;
        break;
    case FONTATTR_COLOR_BACKGROUND:
        result = gFontInfos[fontId].bgColor;
        break;
    case FONTATTR_COLOR_SHADOW:
        result = gFontInfos[fontId].shadowColor;
        break;
    }
    return result;
}

u8 GetMenuCursorDimensionByFont(u8 fontId, u8 whichDimension)
{
    return gMenuCursorDimensions[fontId][whichDimension];
}
