#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "field_specials.h"
#include "menu.h"
#include "money.h"
#include "text_window.h"
#include "strings.h"

EWRAM_DATA static u8 sMoneyBoxWindowId = 0;

u32 GetMoney(u32 *moneyPtr)
{
    return *moneyPtr;
}

void SetMoney(u32 *moneyPtr, u32 newValue)
{
    *moneyPtr = newValue;
}

bool8 IsEnoughMoney(u32 *moneyPtr, u32 cost)
{
    if (GetMoney(moneyPtr) >= cost)
        return TRUE;
    else
        return FALSE;
}

void AddMoney(u32 *moneyPtr, u32 toAdd)
{
    u32 toSet = GetMoney(moneyPtr);

    // can't have more money than MAX
    if (toSet + toAdd > MAX_MONEY)
    {
        toSet = MAX_MONEY;
    }
    else
    {
        toSet += toAdd;
        // check overflow, can't have less money after you receive more
        if (toSet < GetMoney(moneyPtr))
            toSet = MAX_MONEY;
    }

    SetMoney(moneyPtr, toSet);
}

void RemoveMoney(u32 *moneyPtr, u32 toSub)
{
    u32 toSet = GetMoney(moneyPtr);

    // can't subtract more than you already have
    if (toSet < toSub)
        toSet = 0;
    else
        toSet -= toSub;

    SetMoney(moneyPtr, toSet);
}

bool8 IsEnoughForCostInVar0x8005(void)
{
    return IsEnoughMoney(&gSaveBlock1Ptr->money, gSpecialVar_0x8005);
}

void SubtractMoneyFromVar0x8005(void)
{
    RemoveMoney(&gSaveBlock1Ptr->money, gSpecialVar_0x8005);
}

void PrintMoneyAmountInMoneyBox(u8 windowId, int amount, u8 speed)
{
    PrintMoneyAmount(windowId, 16, 12, amount, speed);
}

static u32 CalculateLeadingSpacesForMoney(u32 numDigits)
{
    u32 leadingSpaces = CountDigits(INT_MAX) - StringLength(gStringVar1);
    return (numDigits > 8) ? leadingSpaces : leadingSpaces - 2;
}

void PrintMoneyAmount(u8 windowId, u8 x, u8 y, int amount, u8 speed)
{
    u8 *txtPtr = gStringVar4;
    u32 numDigits = CountDigits(amount);
    u32 maxDigits = (numDigits > 6) ? MAX_MONEY_DIGITS: 6;
    u32 leadingSpaces;

    ConvertIntToDecimalStringN(gStringVar1, amount, STR_CONV_MODE_LEFT_ALIGN, maxDigits);

    leadingSpaces = CalculateLeadingSpacesForMoney(numDigits);

    while (leadingSpaces-- > 0)
        *(txtPtr++) = CHAR_SPACER;

    StringExpandPlaceholders(txtPtr, gText_PokedollarVar1);

    if (numDigits > 8)
        PrependFontIdToFit(gStringVar4, txtPtr + 1 + numDigits, FONT_NORMAL, 54);
    AddTextPrinterParameterized(windowId, FONT_SMALL, gStringVar4, x, y, speed, NULL);
}

void PrintMoneyAmountInMoneyBoxWithBorder(u8 windowId, u16 tileStart, u8 paletteNum, int amount)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, FALSE, tileStart, paletteNum);
    AddTextPrinterParameterized(windowId, FONT_NORMAL, gText_TrainerCardMoney, 0, 0, 0xFF, 0);
    PrintMoneyAmountInMoneyBox(windowId, amount, 0);
}

void ChangeAmountInMoneyBox(int amount)
{
    PrintMoneyAmountInMoneyBox(sMoneyBoxWindowId, amount, 0);
}

void DrawMoneyBox(int amount, u8 x, u8 y)
{
    struct WindowTemplate template;

    template = CreateWindowTemplate(0, x + 1, y + 1, 8, 3, 15, 8);
    sMoneyBoxWindowId = AddWindow(&template);
    FillWindowPixelBuffer(sMoneyBoxWindowId, 0);
    PutWindowTilemap(sMoneyBoxWindowId);
    LoadStdWindowGfx(sMoneyBoxWindowId, 0x21D, BG_PLTT_ID(13));
    PrintMoneyAmountInMoneyBoxWithBorder(sMoneyBoxWindowId, 0x21D, 13, amount);
}

void HideMoneyBox(void)
{
    ClearStdWindowAndFrameToTransparent(sMoneyBoxWindowId, FALSE);
    CopyWindowToVram(sMoneyBoxWindowId, COPYWIN_GFX);
    RemoveWindow(sMoneyBoxWindowId);
}

u32 CalculateMoneyTextHorizontalPosition(u32 amount)
{
    return (CountDigits(amount) > 8) ? 54 : 46;
}
