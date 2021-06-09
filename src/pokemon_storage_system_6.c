#include "global.h"
#include "gflib.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_storage_system_internal.h"
#include "strings.h"
#include "constants/songs.h"

void InitMenu(void)
{
    sStorage->menuItemsCount = 0;
    sStorage->menuWidth = 0;
    sStorage->menuWindow.bg = 0;
    sStorage->menuWindow.paletteNum = 15;
    sStorage->menuWindow.baseBlock = 92;
}

static const u8 *const sMenuTexts[] = {
    [MENU_CANCEL]     = gPCText_Cancel,
    [MENU_STORE]      = gPCText_Store,
    [MENU_WITHDRAW]   = gPCText_Withdraw,
    [MENU_MOVE]       = gPCText_Move,
    [MENU_SHIFT]      = gPCText_Shift,
    [MENU_PLACE]      = gPCText_Place,
    [MENU_SUMMARY]    = gPCText_Summary,
    [MENU_RELEASE]    = gPCText_Release,
    [MENU_MARK]       = gPCText_Mark,
    [MENU_JUMP]       = gPCText_Jump,
    [MENU_WALLPAPER]  = gPCText_Wallpaper,
    [MENU_NAME]       = gPCText_Name,
    [MENU_TAKE]       = gPCText_Take,
    [MENU_GIVE]       = gPCText_Give,
    [MENU_GIVE_2]      = gPCText_Give,
    [MENU_SWITCH]     = gPCText_Switch,
    [MENU_BAG]        = gPCText_Bag,
    [MENU_INFO]       = gPCText_Info,
    [MENU_SCENERY_1]   = gPCText_Scenery1,
    [MENU_SCENERY_2]   = gPCText_Scenery2,
    [MENU_SCENERY_3]   = gPCText_Scenery3,
    [MENU_ETCETERA]   = gPCText_Etcetera,
    [MENU_FOREST]     = gPCText_Forest,
    [MENU_CITY]       = gPCText_City,
    [MENU_DESERT]     = gPCText_Desert,
    [MENU_SAVANNA]    = gPCText_Savanna,
    [MENU_CRAG]       = gPCText_Crag,
    [MENU_VOLCANO]    = gPCText_Volcano,
    [MENU_SNOW]       = gPCText_Snow,
    [MENU_CAVE]       = gPCText_Cave,
    [MENU_BEACH]      = gPCText_Beach,
    [MENU_SEAFLOOR]   = gPCText_Seafloor,
    [MENU_RIVER]      = gPCText_River,
    [MENU_SKY]        = gPCText_Sky,
    [MENU_POLKADOT]   = gPCText_PolkaDot,
    [MENU_POKECENTER] = gPCText_Pokecenter,
    [MENU_MACHINE]    = gPCText_Machine,
    [MENU_SIMPLE]     = gPCText_Simple,
};

void SetMenuText(u8 textId)
{
    if (sStorage->menuItemsCount < MAX_MENU_ITEMS)
    {
        u8 len;
        struct StorageMenu *menu = &sStorage->menuItems[sStorage->menuItemsCount];

        menu->text = sMenuTexts[textId];
        menu->textId = textId;
        len = StringLength(menu->text);
        if (len > sStorage->menuWidth)
            sStorage->menuWidth = len;

        sStorage->menuItemsCount++;
    }
}

s8 GetMenuItemTextId(u8 a0)
{
    if (a0 >= sStorage->menuItemsCount)
        return -1;
    else
        return sStorage->menuItems[a0].textId;
}

void AddMenu(void)
{
    sStorage->menuWindow.width = sStorage->menuWidth + 2;
    sStorage->menuWindow.height = 2 * sStorage->menuItemsCount;
    sStorage->menuWindow.tilemapLeft = 29 - sStorage->menuWindow.width;
    sStorage->menuWindow.tilemapTop = 15 - sStorage->menuWindow.height;
    sStorage->menuWindowId = AddWindow(&sStorage->menuWindow);
    ClearWindowTilemap(sStorage->menuWindowId);
    DrawStdFrameWithCustomTileAndPalette(sStorage->menuWindowId, FALSE, 0x00b, 14);
    PrintMenuTable(sStorage->menuWindowId, 1, 8, 2, 16, sStorage->menuItemsCount, (void *) sStorage->menuItems);
    InitMenuInUpperLeftCornerPlaySoundWhenAPressed(sStorage->menuWindowId, 1, 0, 2, 16, sStorage->menuItemsCount, 0);
    ScheduleBgCopyTilemapToVram(0);
    sStorage->menuUnusedField = 0;
}

bool8 IsMenuLoading(void)
{
    // Some debug flag?
    return FALSE;
}

s16 PokeStorage_HandleMenuInput(void)
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
        RemoveMenu();

    if (textId >= 0)
        textId = sStorage->menuItems[textId].textId;

    return textId;
}

void RemoveMenu(void)
{
    ClearStdWindowAndFrameToTransparent(sStorage->menuWindowId, TRUE);
    RemoveWindow(sStorage->menuWindowId);
}
