#include "global.h"
#include "task.h"
#include "text.h"
#include "window.h"
#include "text_window.h"
#include "money.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "menu.h"
#include "shop.h"
#include "palette.h"

static const struct WindowTemplate sShopBuyMenuWindowTemplatesNormal[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 8,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 0x27,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 11,
        .width = 13,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x3F,
    },
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 0x59,
    },
    {
        .bg = 0,
        .tilemapLeft = 17,
        .tilemapTop = 9,
        .width = 12,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 0xC1,
    },
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 1,
        .width = 17,
        .height = 12,
        .paletteNum = 14,
        .baseBlock = 0xF1,
    },
    {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 14,
        .width = 25,
        .height = 6,
        .paletteNum = 15,
        .baseBlock = 0x1BD,
    },
    DUMMY_WIN_TEMPLATE,
};

// firered uses different layout when selling TMs
static const struct WindowTemplate sShopBuyMenuWindowTemplatesTM[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 8,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 0x27,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 11,
        .width = 13,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x3F,
    },
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 0x59,
    },
    {
        .bg = 0,
        .tilemapLeft = 17,
        .tilemapTop = 9,
        .width = 12,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 0xC1,
    },
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 1,
        .width = 17,
        .height = 10,
        .paletteNum = 14,
        .baseBlock = 0xF1,
    },
    {
        .bg = 0,
        .tilemapLeft = 12,
        .tilemapTop = 12,
        .width = 18,
        .height = 8,
        .paletteNum = 14,
        .baseBlock = 0x19B,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 14,
        .width = 10,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 0x22B,
    },
    DUMMY_WIN_TEMPLATE,
};

static const struct WindowTemplate sShopBuyMenuYesNoWindowTemplate =
{
    .bg = 0,
    .tilemapLeft = 21,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = 14,
    .baseBlock = 0xC1,
};

static const u8 sShopBuyMenuTextColors[][3] =
{
    {0, 1, 2},
    {0, 2, 3},
    {0, 3, 2}
};

void BuyMenuInitWindows(bool32 isSellingTM)
{
    if (isSellingTM != TRUE)
        InitWindows(sShopBuyMenuWindowTemplatesNormal);
    else
        InitWindows(sShopBuyMenuWindowTemplatesTM);
    DeactivateAllTextPrinters();
    LoadUserWindowGfx(0, 0x1, BG_PLTT_ID(13));
    LoadMenuMessageWindowGfx(0, 0x13, BG_PLTT_ID(14));
    LoadStdWindowGfx(0, 0xA, BG_PLTT_ID(15));
    PutWindowTilemap(0);
    PutWindowTilemap(4);
    PutWindowTilemap(5);
    if (isSellingTM == TRUE)
        PutWindowTilemap(6);
}

void BuyMenuDrawMoneyBox(void)
{
    PrintMoneyAmountInMoneyBoxWithBorder(0, 0xA, 0xF, GetMoney(&gSaveBlock1Ptr->money));
}

void BuyMenuPrint(u8 windowId, u8 font, const u8 *text, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 color)
{
    AddTextPrinterParameterized4(windowId, font, x, y, letterSpacing, lineSpacing, sShopBuyMenuTextColors[color], speed, text);
}

void BuyMenuDisplayMessage(u8 taskId, const u8 *text, TaskFunc callback)
{
    DisplayMessageAndContinueTask(taskId, 2, 0x13, 0xE, GetMartFontId(), GetTextSpeedSetting(), text, callback);
    ScheduleBgCopyTilemapToVram(0);
}

void BuyMenuQuantityBoxNormalBorder(u8 windowId, bool8 copyToVram)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, copyToVram, 0x1, 13);
}

void BuyMenuQuantityBoxThinBorder(u8 windowId, bool8 copyToVram)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, copyToVram, 0xA, 15);
}

void BuyMenuConfirmPurchase(u8 taskId, const struct YesNoFuncTable *yesNo)
{
    CreateYesNoMenuWithCallbacks(taskId, &sShopBuyMenuYesNoWindowTemplate, FONT_NORMAL, 0, 2, 1, 13, yesNo);
}
