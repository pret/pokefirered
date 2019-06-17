#include "global.h"
#include "event_data.h"
#include "text.h"
#include "string_util.h"
#include "menu.h"
#include "text_window.h"

extern const u8 gText_PokedollarVar1[];
extern const u8 gUnknown_8419CE7[];

#define MAX_MONEY 999999

EWRAM_DATA static u8 sMoneyBoxWindowId = 0;

u32 GetMoney(u32* moneyPtr)
{
    return *moneyPtr ^ gSaveBlock2Ptr->encryptionKey;
}

void SetMoney(u32* moneyPtr, u32 newValue)
{
    *moneyPtr = gSaveBlock2Ptr->encryptionKey ^ newValue;
}

bool8 IsEnoughMoney(u32* moneyPtr, u32 cost)
{
    if (GetMoney(moneyPtr) >= cost)
        return TRUE;
    else
        return FALSE;
}

void AddMoney(u32* moneyPtr, u32 toAdd)
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

void RemoveMoney(u32* moneyPtr, u32 toSub)
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
    u8 *txtPtr;
    s32 strLength;

    ConvertIntToDecimalStringN(gStringVar1, amount, STR_CONV_MODE_LEFT_ALIGN, 6);

    strLength = 6 - StringLength(gStringVar1);
    txtPtr = gStringVar4;

    while (strLength-- != 0)
        *(txtPtr++) = 0;

    StringExpandPlaceholders(txtPtr, gText_PokedollarVar1);
    AddTextPrinterParameterized(windowId, 0, gStringVar4, 64 - GetStringWidth(0, gStringVar4, 0), 0xC, speed, NULL);
}

void PrintMoneyAmount(u8 windowId, u8 x, u8 y, int amount, u8 speed)
{
    u8 *txtPtr;
    s32 strLength;

    ConvertIntToDecimalStringN(gStringVar1, amount, STR_CONV_MODE_LEFT_ALIGN, 6);

    strLength = 6 - StringLength(gStringVar1);
    txtPtr = gStringVar4;

    while (strLength-- != 0)
        *(txtPtr++) = 0;

    StringExpandPlaceholders(txtPtr, gText_PokedollarVar1);
    AddTextPrinterParameterized(windowId, 0, gStringVar4, x, y, speed, NULL);
}

void PrintMoneyAmountInMoneyBoxWithBorder(u8 windowId, u16 tileStart, u8 pallete, int amount)
{
    SetWindowBorderStyle(windowId, FALSE, tileStart, pallete);
    AddTextPrinterParameterized(windowId, 2, gUnknown_8419CE7, 0, 0, 0xFF, 0);
    PrintMoneyAmountInMoneyBox(windowId, amount, 0);
}

void ChangeAmountInMoneyBox(int amount)
{
    PrintMoneyAmountInMoneyBox(sMoneyBoxWindowId, amount, 0);
}

void DrawMoneyBox(int amount, u8 x, u8 y)
{
    struct WindowTemplate template, template2;

    SetWindowTemplateFields(&template, 0, x + 1, y + 1, 8, 3, 15, 8);
    template2 = template;
    sMoneyBoxWindowId = AddWindow(&template2);
    FillWindowPixelBuffer(sMoneyBoxWindowId, 0);
    PutWindowTilemap(sMoneyBoxWindowId);
    TextWindow_SetStdFrame0_WithPal(sMoneyBoxWindowId, 0x21D, 0xD0);
    PrintMoneyAmountInMoneyBoxWithBorder(sMoneyBoxWindowId, 0x21D, 13, amount);
}

void HideMoneyBox(void)
{
    ClearMenuWindow(sMoneyBoxWindowId, FALSE);
    CopyWindowToVram(sMoneyBoxWindowId, 2);
    RemoveWindow(sMoneyBoxWindowId);
}
