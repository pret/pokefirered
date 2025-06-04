#include "global.h"
#include "item_menu.h"
#include "text_window.h"
#include "menu_helpers.h"
#include "menu.h"
#include "money.h"
#include "palette.h"
#include "strings.h"

static const u16 sBagWindowPalF[] = INCBIN_U16("graphics/item_menu/bag_window_pal.gbapal");

static const u8 sTextColors[][3] = {
    {0, 1, 2},
    {0, 2, 3},
    {0, 3, 2},
    {0, 8, 9}
};

static const struct WindowTemplate sDefaultBagWindows[] = {
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 1,
        .width = 18,
        .height = 12,
        .paletteNum = 15,
        .baseBlock = 0x008a
    }, {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 14,
        .width = 25,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 0x0162
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 9,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x01f8
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sDefaultBagWindowsDeposit[] = {
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 1,
        .width = 18,
        .height = 12,
        .paletteNum = 15,
        .baseBlock = 0x008a
    }, {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 14,
        .width = 25,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 0x0162
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 8,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x01f8
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplates[] = {
    [ITEMWIN_0] =
    {
        .bg = 0,
        .tilemapLeft = 24,
        .tilemapTop = 15,
        .width = 5,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x242
    },
    [ITEMWIN_1] =
    {
        .bg = 0,
        .tilemapLeft = 17,
        .tilemapTop = 9,
        .width = 12,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x242
    },
    [ITEMWIN_2] =
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 8,
        .height = 3,
        .paletteNum = 12,
        .baseBlock = 0x272
    },
    [ITEMWIN_YESNO_BOTTOMRIGHT] =
    {
        .bg = 0,
        .tilemapLeft = 23,
        .tilemapTop = 15,
        .width = 6,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x28a
    },
    [ITEMWIN_YESNO_TOPRIGHT] =
    {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 9,
        .width = 6,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x28a
    },
    [ITEMWIN_5] =
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x2a2
    },
    [ITEMWIN_6] =
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 14,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x2a2
    },
    [ITEMWIN_7] =
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 15,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x2da
    },
    [ITEMWIN_8] =
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 16,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x316
    },
    [ITEMWIN_9] =
    {
        .bg = 0,
        .tilemapLeft = 6,
        .tilemapTop = 15,
        .width = 23,
        .height = 4,
        .paletteNum = 12,
        .baseBlock = 0x356
    },
    [ITEMWIN_1x1] =
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 17,
        .width = 7,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x20a
    },
    [ITEMWIN_1x2] =
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 15,
        .width = 7,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x20a
    },
    [ITEMWIN_1x3] =
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 13,
        .width = 7,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 0x20a
    },
    [ITEMWIN_1x4] =
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 11,
        .width = 7,
        .height = 8,
        .paletteNum = 15,
        .baseBlock = 0x20a
    }
};

static const u8 sUnused[] = {16, 8, 4};

static EWRAM_DATA u8 sOpenWindows[14] = {};

void LoadBagMenuTextWindows(void)
{
    u8 i;

    if (gBagPosition.location != ITEMMENULOCATION_ITEMPC)
        InitWindows(sDefaultBagWindows);
    else
        InitWindows(sDefaultBagWindowsDeposit);
    DeactivateAllTextPrinters();
    LoadUserWindowBorderGfx(0, 0x64, BG_PLTT_ID(14));
    LoadMessageBoxGfx(0, 0x6D, BG_PLTT_ID(13));
    LoadStdWindowGfx(0, 0x81, BG_PLTT_ID(12));
    LoadPalette(sBagWindowPalF, BG_PLTT_ID(15), sizeof(sBagWindowPalF));
    for (i = 0; i < 3; i++)
    {
        FillWindowPixelBuffer(i, 0x00);
        PutWindowTilemap(i);
    }
    ScheduleBgCopyTilemapToVram(0);
    for (i = 0; i < ARRAY_COUNT(sOpenWindows); i++)
    {
        sOpenWindows[i] = WINDOW_NONE;
    }
}

void BagPrintTextOnWindow(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx)
{
    AddTextPrinterParameterized4(windowId, fontId, x, y, letterSpacing, lineSpacing, sTextColors[colorIdx], speed, str);
}

void BagPrintTextOnWin1CenteredColor0(const u8 * str, u8 unused)
{
    u32 x = 0x48 - GetStringWidth(FONT_NORMAL_COPY_1, str, 0);
    AddTextPrinterParameterized3(2, FONT_NORMAL_COPY_1, x / 2, 1, sTextColors[0], 0, str);
}

void BagDrawDepositItemTextBox(void)
{
    u32 x;
    DrawStdFrameWithCustomTileAndPalette(2, FALSE, 0x081, 12);
    x = 0x40 - GetStringWidth(FONT_SMALL, gText_DepositItem, 0);
    AddTextPrinterParameterized(2, FONT_SMALL, gText_DepositItem, x / 2, 1, 0, NULL);
}

u32 ShowBagWindow(u32 whichWindow)
{
    if (sOpenWindows[whichWindow] == WINDOW_NONE)
    {
        sOpenWindows[whichWindow] = AddWindow(&sWindowTemplates[whichWindow]);
        switch (whichWindow)
        {
            case ITEMWIN_6:
            case ITEMWIN_7:
            case ITEMWIN_8:
            case ITEMWIN_9:
                DrawStdFrameWithCustomTileAndPalette(sOpenWindows[whichWindow], FALSE, 0x081, 12);
                break;
            default:
                DrawStdFrameWithCustomTileAndPalette(sOpenWindows[whichWindow], FALSE, 0x064, 14);
                break;
        }
        ScheduleBgCopyTilemapToVram(0);
    }
    return sOpenWindows[whichWindow];
}

void BagMenu_RemoveWindow(u8 whichWindow)
{
    u8 *windowId = &sOpenWindows[whichWindow];
    
    if (*windowId != WINDOW_NONE)
    {
        ClearStdWindowAndFrameToTransparent(sOpenWindows[whichWindow], FALSE);
        ClearWindowTilemap(sOpenWindows[whichWindow]);
        RemoveWindow(sOpenWindows[whichWindow]);
        ScheduleBgCopyTilemapToVram(0);
        *windowId = WINDOW_NONE;
    }
}

u8 OpenBagWindow(u8 whichWindow)
{   
    if (sOpenWindows[whichWindow] == WINDOW_NONE)
    {
        sOpenWindows[whichWindow] = AddWindow(&sWindowTemplates[whichWindow]);
    }
    return sOpenWindows[whichWindow];
}

void CloseBagWindow(u8 whichWindow)
{
    if (sOpenWindows[whichWindow] != WINDOW_NONE)
    {
        ClearDialogWindowAndFrameToTransparent(sOpenWindows[whichWindow], FALSE);
        ClearWindowTilemap(sOpenWindows[whichWindow]);
        RemoveWindow(sOpenWindows[whichWindow]);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        sOpenWindows[whichWindow] = WINDOW_NONE;
    }
}

u8 GetBagWindow(u8 whichWindow)
{
    return sOpenWindows[whichWindow];
}

void BagMenu_YesNo(u8 taskId, u8 windowType, const struct YesNoFuncTable *funcTable)
{
    CreateYesNoMenuWithCallbacks(taskId, &sWindowTemplates[windowType], FONT_NORMAL, 0, 2, 0x064, 14, funcTable);
}

void BagPrintMoneyAmount(void)
{
    PrintMoneyAmountInMoneyBoxWithBorder(ShowBagWindow(ITEMWIN_2), 0x081, 0x0C, GetMoney(&gSaveBlock1Ptr->money));
}

void BagDrawTextBoxOnWindow(u8 windowId)
{
    DrawTextBorderOuter(windowId, 0x064, 14);
}
