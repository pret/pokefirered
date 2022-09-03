#include "global.h"
#include "gflib.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_storage_system_internal.h"
#include "strings.h"
#include "constants/songs.h"

void InitMenu(void)
{
    gStorage->menuItemsCount = 0;
    gStorage->menuWidth = 0;
    gStorage->menuWindow.bg = 0;
    gStorage->menuWindow.paletteNum = 15;
    gStorage->menuWindow.baseBlock = 92;
}

static const u8 *const sMenuTexts[] = {
    [MENU_TEXT_CANCEL]     = gPCText_Cancel,
    [MENU_TEXT_STORE]      = gPCText_Store,
    [MENU_TEXT_WITHDRAW]   = gPCText_Withdraw,
    [MENU_TEXT_MOVE]       = gPCText_Move,
    [MENU_TEXT_SHIFT]      = gPCText_Shift,
    [MENU_TEXT_PLACE]      = gPCText_Place,
    [MENU_TEXT_SUMMARY]    = gPCText_Summary,
    [MENU_TEXT_RELEASE]    = gPCText_Release,
    [MENU_TEXT_MARK]       = gPCText_Mark,
    [MENU_TEXT_JUMP]       = gPCText_Jump,
    [MENU_TEXT_WALLPAPER]  = gPCText_Wallpaper,
    [MENU_TEXT_NAME]       = gPCText_Name,
    [MENU_TEXT_TAKE]       = gPCText_Take,
    [MENU_TEXT_GIVE]       = gPCText_Give,
    [MENU_TEXT_GIVE2]      = gPCText_Give,
    [MENU_TEXT_SWITCH]     = gPCText_Switch,
    [MENU_TEXT_BAG]        = gPCText_Bag,
    [MENU_TEXT_INFO]       = gPCText_Info,
    [MENU_TEXT_SCENERY_1]  = gPCText_Scenery1,
    [MENU_TEXT_SCENERY_2]  = gPCText_Scenery2,
    [MENU_TEXT_SCENERY_3]  = gPCText_Scenery3,
    [MENU_TEXT_ETCETERA]   = gPCText_Etcetera,
    [MENU_TEXT_FOREST]     = gPCText_Forest,
    [MENU_TEXT_CITY]       = gPCText_City,
    [MENU_TEXT_DESERT]     = gPCText_Desert,
    [MENU_TEXT_SAVANNA]    = gPCText_Savanna,
    [MENU_TEXT_CRAG]       = gPCText_Crag,
    [MENU_TEXT_VOLCANO]    = gPCText_Volcano,
    [MENU_TEXT_SNOW]       = gPCText_Snow,
    [MENU_TEXT_CAVE]       = gPCText_Cave,
    [MENU_TEXT_BEACH]      = gPCText_Beach,
    [MENU_TEXT_SEAFLOOR]   = gPCText_Seafloor,
    [MENU_TEXT_RIVER]      = gPCText_River,
    [MENU_TEXT_SKY]        = gPCText_Sky,
    [MENU_TEXT_POLKADOT]   = gPCText_PolkaDot,
    [MENU_TEXT_POKECENTER] = gPCText_Pokecenter,
    [MENU_TEXT_MACHINE]    = gPCText_Machine,
    [MENU_TEXT_SIMPLE]     = gPCText_Simple,
};

void SetMenuText(u8 textId)
{
    if (gStorage->menuItemsCount < ARRAY_COUNT(gStorage->menuItems))
    {
        u8 len;
        struct StorageMenu *menu = &gStorage->menuItems[gStorage->menuItemsCount];

        menu->text = sMenuTexts[textId];
        menu->textId = textId;
        len = StringLength(menu->text);
        if (len > gStorage->menuWidth)
            gStorage->menuWidth = len;

        gStorage->menuItemsCount++;
    }
}

s8 GetMenuItemTextId(u8 menuIndex)
{
    if (menuIndex >= gStorage->menuItemsCount)
        return MENU_B_PRESSED;
    else
        return gStorage->menuItems[menuIndex].textId;
}

void AddMenu(void)
{
    gStorage->menuWindow.width = gStorage->menuWidth + 2;
    gStorage->menuWindow.height = 2 * gStorage->menuItemsCount;
    gStorage->menuWindow.tilemapLeft = 29 - gStorage->menuWindow.width;
    gStorage->menuWindow.tilemapTop = 15 - gStorage->menuWindow.height;
    gStorage->menuWindowId = AddWindow(&gStorage->menuWindow);
    ClearWindowTilemap(gStorage->menuWindowId);
    DrawStdFrameWithCustomTileAndPalette(gStorage->menuWindowId, FALSE, 11, 14);
    PrintTextArray(gStorage->menuWindowId, FONT_1, 8, 2, 16, gStorage->menuItemsCount, (void *)gStorage->menuItems);
    Menu_InitCursor(gStorage->menuWindowId, FONT_1, 0, 2, 16, gStorage->menuItemsCount, 0);
    ScheduleBgCopyTilemapToVram(0);
    gStorage->menuUnusedField = 0;
}

bool8 IsMenuLoading(void)
{
    // Possibly stubbed out debug code?
    return FALSE;
}

s16 HandleMenuInput(void)
{
    s32 input = MENU_NOTHING_CHOSEN;

    do
    {
        if (JOY_NEW(A_BUTTON))
        {
            input = Menu_GetCursorPos();
            break;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            input = MENU_B_PRESSED;
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
    } while (FALSE);

    if (input != MENU_NOTHING_CHOSEN)
        RemoveMenu();

    if (input >= 0)
        input = gStorage->menuItems[input].textId;

    return input;
}

void RemoveMenu(void)
{
    ClearStdWindowAndFrameToTransparent(gStorage->menuWindowId, TRUE);
    RemoveWindow(gStorage->menuWindowId);
}
