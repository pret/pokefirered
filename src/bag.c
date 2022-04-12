#include "global.h"
#include "gflib.h"
#include "item_menu.h"
#include "text_window.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "menu.h"
#include "money.h"
#include "strings.h"

static const u16 sBagWindowPalF[] = INCBIN_U16("graphics/item_menu/bag_window_pal.gbapal");

static const u8 sTextColors[][3] = {
    {0, 1, 2},
    {0, 2, 3},
    {0, 3, 2},
    {0, 8, 9}
};

static const struct WindowTemplate sDefaultBagWindowsStd[] = {
    {
        .bg = 0,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x01,
        .width = 0x12,
        .height = 0x0c,
        .paletteNum = 0x0f,
        .baseBlock = 0x008a
    }, {
        .bg = 0,
        .tilemapLeft = 0x05,
        .tilemapTop = 0x0e,
        .width = 0x19,
        .height = 0x06,
        .paletteNum = 0x0f,
        .baseBlock = 0x0162
    }, {
        .bg = 0,
        .tilemapLeft = 0x01,
        .tilemapTop = 0x01,
        .width = 0x09,
        .height = 0x02,
        .paletteNum = 0x0f,
        .baseBlock = 0x01f8
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sDefaultBagWindowsDeposit[] = {
    {
        .bg = 0,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x01,
        .width = 0x12,
        .height = 0x0c,
        .paletteNum = 0x0f,
        .baseBlock = 0x008a
    }, {
        .bg = 0,
        .tilemapLeft = 0x05,
        .tilemapTop = 0x0e,
        .width = 0x19,
        .height = 0x06,
        .paletteNum = 0x0f,
        .baseBlock = 0x0162
    }, {
        .bg = 0,
        .tilemapLeft = 0x01,
        .tilemapTop = 0x01,
        .width = 0x08,
        .height = 0x02,
        .paletteNum = 0x0C,
        .baseBlock = 0x01f8
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 0,
        .tilemapLeft = 24,
        .tilemapTop = 15,
        .width = 5,
        .height = 4,
        .paletteNum = 0xF,
        .baseBlock = 0x242
    }, {
        .bg = 0,
        .tilemapLeft = 17,
        .tilemapTop = 9,
        .width = 12,
        .height = 4,
        .paletteNum = 0xF,
        .baseBlock = 0x242
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 8,
        .height = 3,
        .paletteNum = 0xC,
        .baseBlock = 0x272
    }, {
        .bg = 0,
        .tilemapLeft = 23,
        .tilemapTop = 15,
        .width = 6,
        .height = 4,
        .paletteNum = 0xF,
        .baseBlock = 0x28a
    }, {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 9,
        .width = 6,
        .height = 4,
        .paletteNum = 0xF,
        .baseBlock = 0x28a
    }, {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 0xF,
        .baseBlock = 0x2a2
    }, {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 14,
        .height = 4,
        .paletteNum = 0xC,
        .baseBlock = 0x2a2
    }, {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 15,
        .height = 4,
        .paletteNum = 0xC,
        .baseBlock = 0x2da
    }, {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 16,
        .height = 4,
        .paletteNum = 0xC,
        .baseBlock = 0x316
    }, {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 23,
        .height = 4,
        .paletteNum = 0xC,
        .baseBlock = 0x356
    }, {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 17,
        .width = 7,
        .height = 2,
        .paletteNum = 0xF,
        .baseBlock = 0x20a
    }, {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 15,
        .width = 7,
        .height = 4,
        .paletteNum = 0xF,
        .baseBlock = 0x20a
    }, {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 13,
        .width = 7,
        .height = 6,
        .paletteNum = 0xF,
        .baseBlock = 0x20a
    }, {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 11,
        .width = 7,
        .height = 8,
        .paletteNum = 0xF,
        .baseBlock = 0x20a
    }
};

static EWRAM_DATA u8 sOpenWindows[11] = {};

void InitBagWindows(void)
{
    u8 i;

    if (gBagMenuState.location != 3)
        InitWindows(sDefaultBagWindowsStd);
    else
        InitWindows(sDefaultBagWindowsDeposit);
    DeactivateAllTextPrinters();
    TextWindow_SetUserSelectedFrame(0, 0x64, 0xE0);
    TextWindow_LoadResourcesStdFrame0(0, 0x6D, 0xD0);
    TextWindow_SetStdFrame0_WithPal(0, 0x81, 0xC0);
    LoadPalette(sBagWindowPalF, 0xF0, 0x20);
    for (i = 0; i < 3; i++)
    {
        FillWindowPixelBuffer(i, 0x00);
        PutWindowTilemap(i);
    }
    ScheduleBgCopyTilemapToVram(0);
    for (i = 0; i < 11; i++)
    {
        sOpenWindows[i] = 0xFF;
    }
}

void BagPrintTextOnWindow(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx)
{
    AddTextPrinterParameterized4(windowId, fontId, x, y, letterSpacing, lineSpacing, sTextColors[colorIdx], speed, str);
}

void BagPrintTextOnWin1CenteredColor0(const u8 * str)
{
    u32 x = 0x48 - GetStringWidth(1, str, 0);
    AddTextPrinterParameterized3(2, 1, x / 2, 1, sTextColors[0], 0, str);
}

void BagDrawDepositItemTextBox(void)
{
    u32 x;
    DrawStdFrameWithCustomTileAndPalette(2, FALSE, 0x081, 0x0C);
    x = 0x40 - GetStringWidth(0, gText_DepositItem, 0);
    AddTextPrinterParameterized(2, 0, gText_DepositItem, x / 2, 1, 0, NULL);
}

u8 ShowBagWindow(u8 whichWindow, u8 nItems)
{
    if (sOpenWindows[whichWindow] == 0xFF)
    {
        sOpenWindows[whichWindow] = AddWindow(&sWindowTemplates[whichWindow + nItems]);
        if (whichWindow != 6)
        {
            DrawStdFrameWithCustomTileAndPalette(sOpenWindows[whichWindow], FALSE, 0x064, 0xE);
        }
        else
        {
            DrawStdFrameWithCustomTileAndPalette(sOpenWindows[whichWindow], FALSE, 0x081, 0xC);
        }
        ScheduleBgCopyTilemapToVram(0);
    }
    return sOpenWindows[whichWindow];
}

void HideBagWindow(u8 whichWindow)
{
    ClearStdWindowAndFrameToTransparent(sOpenWindows[whichWindow], FALSE);
    ClearWindowTilemap(sOpenWindows[whichWindow]);
    RemoveWindow(sOpenWindows[whichWindow]);
    ScheduleBgCopyTilemapToVram(0);
    sOpenWindows[whichWindow] = 0xFF;
}

u8 OpenBagWindow(u8 whichWindow)
{
    if (sOpenWindows[whichWindow] == 0xFF)
    {
        sOpenWindows[whichWindow] = AddWindow(&sWindowTemplates[whichWindow]);
    }
    return sOpenWindows[whichWindow];
}

void CloseBagWindow(u8 whichWindow)
{
    if (sOpenWindows[whichWindow] != 0xFF)
    {
        ClearDialogWindowAndFrameToTransparent(sOpenWindows[whichWindow], FALSE);
        ClearWindowTilemap(sOpenWindows[whichWindow]);
        RemoveWindow(sOpenWindows[whichWindow]);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        sOpenWindows[whichWindow] = 0xFF;
    }
}

u8 GetBagWindow(u8 whichWindow)
{
    return sOpenWindows[whichWindow];
}

void BagCreateYesNoMenuRight(u8 taskId, const struct YesNoFuncTable * ptrs, bool8 isTop)
{
    u8 id = isTop ? 4 : 3;
    
    CreateYesNoMenuWithCallbacks(taskId, &sWindowTemplates[id], 2, 0, 2, 0x064, 0x0E, ptrs);
}

void BagPrintMoneyAmount(void)
{
    PrintMoneyAmountInMoneyBoxWithBorder(ShowBagWindow(2, 0), 0x081, 0x0C, GetMoney(&gSaveBlock1Ptr->money));
}

void BagDrawTextBoxOnWindow(u8 windowId)
{
    DrawTextBorderOuter(windowId, 0x064, 0x0E);
}
