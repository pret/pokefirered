#include "global.h"
#include "gflib.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_storage_system_internal.h"
#include "strings.h"
#include "constants/songs.h"

void InitMenu(void)
{
    sPSSData->menuItemsCount = 0;
    sPSSData->menuWidth = 0;
    sPSSData->menuWindow.bg = 0;
    sPSSData->menuWindow.paletteNum = 15;
    sPSSData->menuWindow.baseBlock = 92;
}

static const u8 *const sMenuTexts[] = {
    [PC_TEXT_CANCEL]     = gPCText_Cancel,
    [PC_TEXT_STORE]      = gPCText_Store,
    [PC_TEXT_WITHDRAW]   = gPCText_Withdraw,
    [PC_TEXT_MOVE]       = gPCText_Move,
    [PC_TEXT_SHIFT]      = gPCText_Shift,
    [PC_TEXT_PLACE]      = gPCText_Place,
    [PC_TEXT_SUMMARY]    = gPCText_Summary,
    [PC_TEXT_RELEASE]    = gPCText_Release,
    [PC_TEXT_MARK]       = gPCText_Mark,
    [PC_TEXT_JUMP]       = gPCText_Jump,
    [PC_TEXT_WALLPAPER]  = gPCText_Wallpaper,
    [PC_TEXT_NAME]       = gPCText_Name,
    [PC_TEXT_TAKE]       = gPCText_Take,
    [PC_TEXT_GIVE]       = gPCText_Give,
    [PC_TEXT_GIVE2]      = gPCText_Give,
    [PC_TEXT_SWITCH]     = gPCText_Switch,
    [PC_TEXT_BAG]        = gPCText_Bag,
    [PC_TEXT_INFO]       = gPCText_Info,
    [PC_TEXT_SCENERY1]   = gPCText_Scenery1,
    [PC_TEXT_SCENERY2]   = gPCText_Scenery2,
    [PC_TEXT_SCENERY3]   = gPCText_Scenery3,
    [PC_TEXT_ETCETERA]   = gPCText_Etcetera,
    [PC_TEXT_FOREST]     = gPCText_Forest,
    [PC_TEXT_CITY]       = gPCText_City,
    [PC_TEXT_DESERT]     = gPCText_Desert,
    [PC_TEXT_SAVANNA]    = gPCText_Savanna,
    [PC_TEXT_CRAG]       = gPCText_Crag,
    [PC_TEXT_VOLCANO]    = gPCText_Volcano,
    [PC_TEXT_SNOW]       = gPCText_Snow,
    [PC_TEXT_CAVE]       = gPCText_Cave,
    [PC_TEXT_BEACH]      = gPCText_Beach,
    [PC_TEXT_SEAFLOOR]   = gPCText_Seafloor,
    [PC_TEXT_RIVER]      = gPCText_River,
    [PC_TEXT_SKY]        = gPCText_Sky,
    [PC_TEXT_POLKADOT]   = gPCText_PolkaDot,
    [PC_TEXT_POKECENTER] = gPCText_Pokecenter,
    [PC_TEXT_MACHINE]    = gPCText_Machine,
    [PC_TEXT_SIMPLE]     = gPCText_Simple,
};

void SetMenuText(u8 textId)
{
    if (sPSSData->menuItemsCount < MAX_MENU_ITEMS)
    {
        u8 len;
        struct StorageMenu *menu = &sPSSData->menuItems[sPSSData->menuItemsCount];

        menu->text = sMenuTexts[textId];
        menu->textId = textId;
        len = StringLength(menu->text);
        if (len > sPSSData->menuWidth)
            sPSSData->menuWidth = len;

        sPSSData->menuItemsCount++;
    }
}

s8 sub_8094E50(u8 arg0)
{
    if (arg0 >= sPSSData->menuItemsCount)
        return -1;
    else
        return sPSSData->menuItems[arg0].textId;
}

void AddMenu(void)
{
    sPSSData->menuWindow.width = sPSSData->menuWidth + 2;
    sPSSData->menuWindow.height = 2 * sPSSData->menuItemsCount;
    sPSSData->menuWindow.tilemapLeft = 29 - sPSSData->menuWindow.width;
    sPSSData->menuWindow.tilemapTop = 15 - sPSSData->menuWindow.height;
    sPSSData->field_CB0 = AddWindow(&sPSSData->menuWindow);
    ClearWindowTilemap(sPSSData->field_CB0);
    DrawStdFrameWithCustomTileAndPalette(sPSSData->field_CB0, FALSE, 0x00b, 14);
    PrintTextArray(sPSSData->field_CB0, 1, 8, 2, 16, sPSSData->menuItemsCount, (void*)sPSSData->menuItems);
    Menu_InitCursor(sPSSData->field_CB0, 1, 0, 2, 16, sPSSData->menuItemsCount, 0);
    ScheduleBgCopyTilemapToVram(0);
    sPSSData->field_CAE = 0;
}

bool8 sub_8094F90(void)
{
    // Some debug flag?
    return FALSE;
}

s16 sub_8094F94(void)
{
    s32 textId = -2;

    do
    {
        if (JOY_NEW(A_BUTTON))
        {
            textId = Menu_GetCursorPos();
            break;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            textId = -1;
        }

        if (JOY_NEW(DPAD_UP))
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(-1);
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(1);
        }
    } while (0);

    if (textId != -2)
        sub_8095024();

    if (textId >= 0)
        textId = sPSSData->menuItems[textId].textId;

    return textId;
}

void sub_8095024(void)
{
    ClearStdWindowAndFrameToTransparent(sPSSData->field_CB0, TRUE);
    RemoveWindow(sPSSData->field_CB0);
}
