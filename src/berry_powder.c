#include "global.h"
#include "event_data.h"
#include "load_save.h"
#include "menu.h"
#include "quest_log.h"
#include "script_menu.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "text_window.h"

EWRAM_DATA u8 gUnknown_203F464 = 0;

u32 sub_815EE3C(u32 * a0)
{
    return *a0 ^ gSaveBlock2Ptr->encryptionKey;
}

void sub_815EE54(u32 * a0, u32 a1)
{
    *a0 = gSaveBlock2Ptr->encryptionKey ^ a1;
}

void sub_815EE6C(u32 a0)
{
    ApplyNewEncryptionKeyToWord(&gSaveBlock2Ptr->berryCrush.berryPowderAmount, a0);
}

bool8 sub_815EE88(u32 a0)
{
    if (sub_815EE3C(&gSaveBlock2Ptr->berryCrush.berryPowderAmount) < a0)
        return FALSE;
    else
        return TRUE;
}

bool8 sub_815EEB0(void)
{
    if (sub_815EE3C(&gSaveBlock2Ptr->berryCrush.berryPowderAmount) < gSpecialVar_0x8004)
        return FALSE;
    else
        return TRUE;
}

bool8 sub_815EEE0(u32 a0)
{
    u32 * ptr = &gSaveBlock2Ptr->berryCrush.berryPowderAmount;
    u32 amount = sub_815EE3C(ptr) + a0;
    if (amount > 99999)
    {
        sub_815EE54(ptr, 99999);
        return FALSE;
    }
    else
    {
        sub_815EE54(ptr, amount);
        return TRUE;
    }
}

bool8 sub_815EF20(u32 a0)
{
    u32 * ptr = &gSaveBlock2Ptr->berryCrush.berryPowderAmount;
    if (!sub_815EE88(a0))
        return FALSE;
    else
    {
        u32 amount = sub_815EE3C(ptr);
        sub_815EE54(ptr, amount - a0);
        return TRUE;
    }
}

bool8 sub_815EF5C(void)
{
    u32 * ptr = &gSaveBlock2Ptr->berryCrush.berryPowderAmount;
    if (!sub_815EE88(gSpecialVar_0x8004))
        return FALSE;
    else
    {
        u32 amount = sub_815EE3C(ptr);
        sub_815EE54(ptr, amount - gSpecialVar_0x8004);
        return TRUE;
    }
}

u32 GetBerryPowder(void)
{
    return sub_815EE3C(&gSaveBlock2Ptr->berryCrush.berryPowderAmount);
}

void sub_815EFBC(u8 windowId, u32 powder, u8 x, u8 y, u8 speed)
{
    ConvertIntToDecimalStringN(gStringVar1, powder, STR_CONV_MODE_RIGHT_ALIGN, 5);
    AddTextPrinterParameterized(windowId, 0, gStringVar1, x, y, speed, NULL);
}

void sub_815F014(u8 windowId, u16 baseBlock, u8 palette, u32 powder)
{
    SetWindowBorderStyle(windowId, FALSE, baseBlock, palette);
    AddTextPrinterParameterized(windowId, 0, gOtherText_Powder, 0, 0, -1, NULL);
    sub_815EFBC(windowId, powder, 39, 12, 0);
}

void sub_815F070(void)
{
    sub_815EFBC(gUnknown_203F464, GetBerryPowder(), 39, 12, 0);
}

void sub_815F094(void)
{
    struct WindowTemplate template;
    struct WindowTemplate template2;

    if (sub_81119D4(sub_809D6D4) != TRUE)
    {
        SetWindowTemplateFields(&template, 0, 1, 1, 8, 3, 15, 32);
        template2 = template;
        gUnknown_203F464 = AddWindow(&template2);
        FillWindowPixelBuffer(gUnknown_203F464, 0);
        PutWindowTilemap(gUnknown_203F464);
        TextWindow_SetStdFrame0_WithPal(gUnknown_203F464, 0x21D, 0xD0);
        sub_815F014(gUnknown_203F464, 0x21D, 0xD, GetBerryPowder());
    }
}

void sub_815F114(void)
{
    ClearWindowTilemap(gUnknown_203F464);
    ClearMenuWindow(gUnknown_203F464, 1);
    RemoveWindow(gUnknown_203F464);
}
