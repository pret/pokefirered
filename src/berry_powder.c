#include "global.h"
#include "event_data.h"
#include "load_save.h"
#include "menu.h"
#include "palette.h"
#include "quest_log.h"
#include "script_menu.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "text_window.h"

#define MAX_BERRY_POWDER 99999

static EWRAM_DATA u8 sBerryPowderVendorWindowId = 0;

u32 DecryptBerryPowder(u32 *powder)
{
    return *powder ^ gSaveBlock2Ptr->encryptionKey;
}

void SetBerryPowder(u32 *powder, u32 amount)
{
    *powder = amount ^ gSaveBlock2Ptr->encryptionKey;
}

void ApplyNewEncryptionKeyToBerryPowder(u32 encryptionKey)
{
    ApplyNewEncryptionKeyToWord(&gSaveBlock2Ptr->berryCrush.berryPowderAmount, encryptionKey);
}

static bool8 HasEnoughBerryPowder(u32 cost)
{
    if (DecryptBerryPowder(&gSaveBlock2Ptr->berryCrush.berryPowderAmount) < cost)
        return FALSE;
    else
        return TRUE;
}

bool8 Script_HasEnoughBerryPowder(void)
{
    if (DecryptBerryPowder(&gSaveBlock2Ptr->berryCrush.berryPowderAmount) < gSpecialVar_0x8004)
        return FALSE;
    else
        return TRUE;
}

bool8 GiveBerryPowder(u32 amountToAdd)
{
    u32 *powder = &gSaveBlock2Ptr->berryCrush.berryPowderAmount;
    u32 amount = DecryptBerryPowder(powder) + amountToAdd;
    if (amount > MAX_BERRY_POWDER)
    {
        SetBerryPowder(powder, MAX_BERRY_POWDER);
        return FALSE;
    }
    else
    {
        SetBerryPowder(powder, amount);
        return TRUE;
    }
}

static bool8 TakeBerryPowder(u32 cost)
{
    u32 *powder = &gSaveBlock2Ptr->berryCrush.berryPowderAmount;
    if (!HasEnoughBerryPowder(cost))
        return FALSE;
    else
    {
        u32 amount = DecryptBerryPowder(powder);
        SetBerryPowder(powder, amount - cost);
        return TRUE;
    }
}

bool8 Script_TakeBerryPowder(void)
{
    u32 *powder = &gSaveBlock2Ptr->berryCrush.berryPowderAmount;
    if (!HasEnoughBerryPowder(gSpecialVar_0x8004))
        return FALSE;
    else
    {
        u32 amount = DecryptBerryPowder(powder);
        SetBerryPowder(powder, amount - gSpecialVar_0x8004);
        return TRUE;
    }
}

u32 GetBerryPowder(void)
{
    return DecryptBerryPowder(&gSaveBlock2Ptr->berryCrush.berryPowderAmount);
}

static void PrintBerryPowderAmount(u8 windowId, u32 amount, u8 x, u8 y, u8 speed)
{
    ConvertIntToDecimalStringN(gStringVar1, amount, STR_CONV_MODE_RIGHT_ALIGN, 5);
    AddTextPrinterParameterized(windowId, FONT_SMALL, gStringVar1, x, y, speed, NULL);
}

static void DrawPlayerPowderAmount(u8 windowId, u16 baseBlock, u8 palette, u32 amount)
{
    DrawStdFrameWithCustomTileAndPalette(windowId, FALSE, baseBlock, palette);
    AddTextPrinterParameterized(windowId, FONT_SMALL, gOtherText_Powder, 0, 0, -1, NULL);
    PrintBerryPowderAmount(windowId, amount, 39, 12, 0);
}

void PrintPlayerBerryPowderAmount(void)
{
    PrintBerryPowderAmount(sBerryPowderVendorWindowId, GetBerryPowder(), 39, 12, 0);
}

void DisplayBerryPowderVendorMenu(void)
{
    struct WindowTemplate template;

    if (QL_AvoidDisplay(QL_DestroyAbortedDisplay) == TRUE)
        return;

    template = SetWindowTemplateFields(0, 1, 1, 8, 3, 15, 32);
    sBerryPowderVendorWindowId = AddWindow(&template);
    FillWindowPixelBuffer(sBerryPowderVendorWindowId, 0);
    PutWindowTilemap(sBerryPowderVendorWindowId);
    LoadStdWindowGfx(sBerryPowderVendorWindowId, 0x21D, BG_PLTT_ID(13));
    DrawPlayerPowderAmount(sBerryPowderVendorWindowId, 0x21D, 13, GetBerryPowder());
}

void RemoveBerryPowderVendorMenu(void)
{
    ClearWindowTilemap(sBerryPowderVendorWindowId);
    ClearStdWindowAndFrameToTransparent(sBerryPowderVendorWindowId, 1);
    RemoveWindow(sBerryPowderVendorWindowId);
}
