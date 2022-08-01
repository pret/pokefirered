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

static const struct WindowTemplate sShopBuyMenuWindowTemplatesNormal[] =
{
    {
        .bg = 0x0,
        .tilemapLeft = 0x1,
        .tilemapTop = 0x1,
        .width = 0x8,
        .height = 0x3,
        .paletteNum = 0xF,
        .baseBlock = 0x27,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0x1,
        .tilemapTop = 0xB,
        .width = 0xD,
        .height = 0x2,
        .paletteNum = 0xF,
        .baseBlock = 0x3F,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0x2,
        .tilemapTop = 0xF,
        .width = 0x1A,
        .height = 0x4,
        .paletteNum = 0xE,
        .baseBlock = 0x59,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0x11,
        .tilemapTop = 0x9,
        .width = 0xC,
        .height = 0x4,
        .paletteNum = 0xE,
        .baseBlock = 0xC1,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0xB,
        .tilemapTop = 0x1,
        .width = 0x11,
        .height = 0xC,
        .paletteNum = 0xE,
        .baseBlock = 0xF1,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0x5,
        .tilemapTop = 0xE,
        .width = 0x19,
        .height = 0x6,
        .paletteNum = 0xF,
        .baseBlock = 0x1BD,
    },
    DUMMY_WIN_TEMPLATE,
};

// firered uses different layout when selling TMs
static const struct WindowTemplate sShopBuyMenuWindowTemplatesTM[] =
{
    {
        .bg = 0x0,
        .tilemapLeft = 0x1,
        .tilemapTop = 0x1,
        .width = 0x8,
        .height = 0x3,
        .paletteNum = 0xF,
        .baseBlock = 0x27,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0x1,
        .tilemapTop = 0xB,
        .width = 0xD,
        .height = 0x2,
        .paletteNum = 0xF,
        .baseBlock = 0x3F,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0x2,
        .tilemapTop = 0xF,
        .width = 0x1A,
        .height = 0x4,
        .paletteNum = 0xE,
        .baseBlock = 0x59,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0x11,
        .tilemapTop = 0x9,
        .width = 0xC,
        .height = 0x4,
        .paletteNum = 0xE,
        .baseBlock = 0xC1,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0xB,
        .tilemapTop = 0x1,
        .width = 0x11,
        .height = 0xA,
        .paletteNum = 0xE,
        .baseBlock = 0xF1,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0xC,
        .tilemapTop = 0xC,
        .width = 0x12,
        .height = 0x8,
        .paletteNum = 0xE,
        .baseBlock = 0x19B,
    },
    {
        .bg = 0x0,
        .tilemapLeft = 0x1,
        .tilemapTop = 0xE,
        .width = 0xA,
        .height = 0x4,
        .paletteNum = 0xE,
        .baseBlock = 0x22B,
    },
    DUMMY_WIN_TEMPLATE,
};

static const struct WindowTemplate sShopBuyMenuYesNoWindowTemplate =
{
    .bg = 0x0,
    .tilemapLeft = 0x15,
    .tilemapTop = 0x9,
    .width = 0x6,
    .height = 0x4,
    .paletteNum = 0xE,
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
    TextWindow_SetUserSelectedFrame(0, 0x1, 0xD0);
    TextWindow_LoadResourcesStdFrame0(0, 0x13, 0xE0);
    TextWindow_SetStdFrame0_WithPal(0, 0xA, 0xF0);
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
    DrawStdFrameWithCustomTileAndPalette(windowId, copyToVram, 0x1, 0xD);
}

void BuyMenuQuantityBoxThinBorder(u8 windowId, bool8 copyToVram)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, copyToVram, 0xA, 0xF);
}

void BuyMenuConfirmPurchase(u8 taskId, const struct YesNoFuncTable *yesNo)
{
    CreateYesNoMenuWithCallbacks(taskId, &sShopBuyMenuYesNoWindowTemplate, FONT_2, 0, 2, 1, 0xD, yesNo);
}
