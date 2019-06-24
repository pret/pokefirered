#include "global.h"
#include "task.h"
#include "palette.h"
#include "item_menu.h"
#include "text.h"
#include "window.h"
#include "text_window.h"
#include "menu_helpers.h"
#include "menu.h"
#include "money.h"
#include "bag.h"

extern const u8 gText_DepositItem[];

const u16 gUnknown_8453098[] = INCBIN_U16("data/bag/bag_window_pal.gbapal");
const struct TextColor gUnknown_84530B8[] = {
    {0, 1, 2},
    {0, 2, 3},
    {0, 3, 2},
    {0, 8, 9}
};
const struct WindowTemplate gUnknown_84530C4[] = {
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
const struct WindowTemplate gUnknown_84530E4[] = {
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
const struct WindowTemplate gUnknown_8453104[] = {
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
    }
};

const struct WindowTemplate gUnknown_845311C = {
    .bg = 0,
    .tilemapLeft = 23,
    .tilemapTop = 15,
    .width = 6,
    .height = 4,
    .paletteNum = 0xF,
    .baseBlock = 0x28a
};

const struct WindowTemplate gUnknown_8453124 = {
    .bg = 0,
    .tilemapLeft = 21,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = 0xF,
    .baseBlock = 0x28a
};

const struct WindowTemplate gUnknown_845312C[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x02,
        .tilemapTop = 0x0f,
        .width = 0x1a,
        .height = 0x04,
        .paletteNum = 0x0f,
        .baseBlock = 0x02a2
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x06,
        .tilemapTop = 0x0f,
        .width = 0x0e,
        .height = 0x04,
        .paletteNum = 0x0c,
        .baseBlock = 0x02a2
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x06,
        .tilemapTop = 0x0f,
        .width = 0x0f,
        .height = 0x04,
        .paletteNum = 0x0c,
        .baseBlock = 0x02da
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x06,
        .tilemapTop = 0x0f,
        .width = 0x10,
        .height = 0x04,
        .paletteNum = 0x0c,
        .baseBlock = 0x0316
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x06,
        .tilemapTop = 0x0f,
        .width = 0x17,
        .height = 0x04,
        .paletteNum = 0x0c,
        .baseBlock = 0x0356
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x16,
        .tilemapTop = 0x11,
        .width = 0x07,
        .height = 0x02,
        .paletteNum = 0x0f,
        .baseBlock = 0x020a
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x16,
        .tilemapTop = 0x0f,
        .width = 0x07,
        .height = 0x04,
        .paletteNum = 0x0f,
        .baseBlock = 0x020a
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x16,
        .tilemapTop = 0x0d,
        .width = 0x07,
        .height = 0x06,
        .paletteNum = 0x0f,
        .baseBlock = 0x020a
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x16,
        .tilemapTop = 0x0b,
        .width = 0x07,
        .height = 0x08,
        .paletteNum = 0x0f,
        .baseBlock = 0x020a
    }
};

const u8 gUnknown_8453174[] = {16, 8, 4};

EWRAM_DATA u8 gUnknown_203AD34[11] = {};

void sub_810B858(void)
{
    u8 i;

    if (gUnknown_203ACFC.location != 3)
        InitWindows(gUnknown_84530C4);
    else
        InitWindows(gUnknown_84530E4);
    DeactivateAllTextPrinters();
    TextWindow_SetUserSelectedFrame(0, 0x64, 0xE0);
    TextWindow_SetBubbleFrame_841F1C8(0, 0x6D, 0xD0);
    TextWindow_SetStdFrame0_WithPal(0, 0x81, 0xC0);
    LoadPalette(gUnknown_8453098, 0xF0, 0x20);
    for (i = 0; i < 3; i++)
    {
        FillWindowPixelBuffer(i, 0x00);
        PutWindowTilemap(i);
    }
    ScheduleBgCopyTilemapToVram(0);
    for (i = 0; i < 11; i++)
    {
        gUnknown_203AD34[i] = 0xFF;
    }
}

void sub_810B8F0(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, s8 speed, u8 colorIdx)
{
    AddTextPrinterParameterized4(windowId, fontId, x, y, letterSpacing, lineSpacing, &gUnknown_84530B8[colorIdx], speed, str);
}

void sub_810B958(const u8 * str)
{
    u32 x = 0x48 - GetStringWidth(1, str, 0);
    AddTextPrinterParameterized3(2, 1, x / 2, 1, &gUnknown_84530B8[0], 0, str);
}

void sub_810B994(void)
{
    u32 x;
    SetWindowBorderStyle(2, FALSE, 0x081, 0x0C);
    x = 0x40 - GetStringWidth(0, gText_DepositItem, 0);
    AddTextPrinterParameterized(2, 0, gText_DepositItem, x / 2, 1, 0, NULL);
}

u8 sub_810B9DC(u8 a0, u8 a1)
{
    if (gUnknown_203AD34[a0] == 0xFF)
    {
        gUnknown_203AD34[a0] = AddWindow(&gUnknown_8453104[a0 + a1]);
        if (a0 != 6)
        {
            SetWindowBorderStyle(gUnknown_203AD34[a0], FALSE, 0x064, 0x0E);
        }
        else
        {
            SetWindowBorderStyle(gUnknown_203AD34[a0], FALSE, 0x081, 0x0C);
        }
        ScheduleBgCopyTilemapToVram(0);
    }
    return gUnknown_203AD34[a0];
}

void sub_810BA3C(u8 a0)
{
    ClearMenuWindow(gUnknown_203AD34[a0], FALSE);
    ClearWindowTilemap(gUnknown_203AD34[a0]);
    RemoveWindow(gUnknown_203AD34[a0]);
    ScheduleBgCopyTilemapToVram(0);
    gUnknown_203AD34[a0] = 0xFF;
}

u8 sub_810BA70(u8 a0)
{
    if (gUnknown_203AD34[a0] == 0xFF)
    {
        gUnknown_203AD34[a0] = AddWindow(&gUnknown_8453104[a0]);
    }
    return gUnknown_203AD34[a0];
}

void sub_810BA9C(u8 a0)
{
    if (gUnknown_203AD34[a0] != 0xFF)
    {
        ClearMenuWindow_BorderThickness2(gUnknown_203AD34[a0], FALSE);
        ClearWindowTilemap(gUnknown_203AD34[a0]);
        RemoveWindow(gUnknown_203AD34[a0]);
        PutWindowTilemap(1);
        ScheduleBgCopyTilemapToVram(0);
        gUnknown_203AD34[a0] = 0xFF;

    }
}

u8 sub_810BAD8(u8 a0)
{
    return gUnknown_203AD34[a0];
}

void sub_810BAE8(u8 taskId, const struct YesNoFuncTable * ptrs)
{
    CreateYesNoMenuWithCallbacks(taskId, &gUnknown_845311C, 2, 0, 2, 0x64, 0x0E, ptrs);
}

void sub_810BB14(u8 taskId, const struct YesNoFuncTable * ptrs)
{
    CreateYesNoMenuWithCallbacks(taskId, &gUnknown_8453124, 2, 0, 2, 0x064, 0x0E, ptrs);
}

void sub_810BB40(void)
{
    PrintMoneyAmountInMoneyBoxWithBorder(sub_810B9DC(2, 0), 0x081, 0x0C, GetMoney(&gSaveBlock1Ptr->money));
}

void sub_810BB74(u8 windowId)
{
    DrawTextBorderOuter(windowId, 0x064, 0x0E);
}
