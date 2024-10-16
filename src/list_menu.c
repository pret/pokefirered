#include "global.h"
#include "gflib.h"
#include "menu.h"
#include "list_menu.h"
#include "menu_indicators.h"
#include "new_menu_helpers.h"
#include "text_window.h"
#include "task.h"
#include "graphics.h"
#include "strings.h"
#include "pokemon_icon.h"
#include "constants/songs.h"

struct MysteryGiftLinkMenuStruct
{
    u32 currItemId;
    u8 state;
    u8 windowId;
    u8 listTaskId;
};

struct ListMenuOverride
{
    u8 cursorPal:4;
    u8 fillValue:4;
    u8 cursorShadowPal:4;
    u8 lettersSpacing:6;
    u8 field_2_2:6; // unused
    u8 fontId:7;
    bool8 enabled:1;
};

struct MoveMenuInfoIcon
{
    u8 width;
    u8 height;
    u16 offset;
};

static EWRAM_DATA struct MysteryGiftLinkMenuStruct sMysteryGiftLinkMenu = {0};

COMMON_DATA struct ListMenuOverride gListMenuOverride = {0};
COMMON_DATA struct ListMenuTemplate gMultiuseListMenuTemplate = {0};

static u8 ListMenuInitInternal(const struct ListMenuTemplate *listMenuTemplate, u16 cursorPos, u16 itemsAbove);
static bool8 ListMenuChangeSelection(struct ListMenu *list, bool8 updateCursorAndCallCallback, u8 count, bool8 movingDown);
static void ListMenuPrintEntries(struct ListMenu *list, u16 startIndex, u16 yOffset, u16 count);
static void ListMenuDrawCursor(struct ListMenu *list);
static void ListMenuCallSelectionChangedCallback(struct ListMenu *list, u8 onInit);
static u8 ListMenuAddCursorObject(struct ListMenu *list, u32 cursorKind);

static const struct MoveMenuInfoIcon sMenuInfoIcons[] =
{   // { width, height, offset }
    [MENU_INFO_ICON_CAUGHT] = { 12, 12, 0x00 },
    [TYPE_NORMAL + 1]   = { 32, 12, 0x20 },
    [TYPE_FIGHTING + 1] = { 32, 12, 0x64 },
    [TYPE_FLYING + 1]   = { 32, 12, 0x60 },
    [TYPE_POISON + 1]   = { 32, 12, 0x80 },
    [TYPE_GROUND + 1]   = { 32, 12, 0x48 },
    [TYPE_ROCK + 1]     = { 32, 12, 0x44 },
    [TYPE_BUG + 1]      = { 32, 12, 0x6C },
    [TYPE_GHOST + 1]    = { 32, 12, 0x68 },
    [TYPE_STEEL + 1]    = { 32, 12, 0x88 },
    [TYPE_MYSTERY + 1]  = { 32, 12, 0xA4 },
    [TYPE_FIRE + 1]     = { 32, 12, 0x24 },
    [TYPE_WATER + 1]    = { 32, 12, 0x28 },
    [TYPE_GRASS + 1]    = { 32, 12, 0x2C },
    [TYPE_ELECTRIC + 1] = { 32, 12, 0x40 },
    [TYPE_PSYCHIC + 1]  = { 32, 12, 0x84 },
    [TYPE_ICE + 1]      = { 32, 12, 0x4C },
    [TYPE_DRAGON + 1]   = { 32, 12, 0xA0 },
    [TYPE_DARK + 1]     = { 32, 12, 0x8C },
    [MENU_INFO_ICON_TYPE]      = { 40, 12, 0xA8 },
    [MENU_INFO_ICON_POWER]     = { 40, 12, 0xC0 },
    [MENU_INFO_ICON_ACCURACY]  = { 40, 12, 0xC8 },
    [MENU_INFO_ICON_PP]        = { 40, 12, 0xE0 },
    [MENU_INFO_ICON_EFFECT]    = { 40, 12, 0xE8 },
};

static void ListMenuDummyTask(u8 taskId)
{
}

u32 DoMysteryGiftListMenu(const struct WindowTemplate *windowTemplate, const struct ListMenuTemplate *listMenuTemplate, u8 arg2, u16 tileNum, u16 palOffset)
{
    switch (sMysteryGiftLinkMenu.state)
    {
    case 0:
    default:
        sMysteryGiftLinkMenu.windowId = AddWindow(windowTemplate);
        switch (arg2)
        {
        case 2:
            LoadUserWindowGfx(sMysteryGiftLinkMenu.windowId, tileNum, palOffset);
        case 1:
            DrawTextBorderOuter(sMysteryGiftLinkMenu.windowId, tileNum, palOffset / 16);
            break;
        }
        gMultiuseListMenuTemplate = *listMenuTemplate;
        gMultiuseListMenuTemplate.windowId = sMysteryGiftLinkMenu.windowId;
        sMysteryGiftLinkMenu.listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);
        CopyWindowToVram(sMysteryGiftLinkMenu.windowId, COPYWIN_MAP);
        sMysteryGiftLinkMenu.state = 1;
        break;
    case 1:
        sMysteryGiftLinkMenu.currItemId = ListMenu_ProcessInput(sMysteryGiftLinkMenu.listTaskId);
        if (JOY_NEW(A_BUTTON))
        {
            sMysteryGiftLinkMenu.state = 2;
        }
        if (JOY_NEW(B_BUTTON))
        {
            sMysteryGiftLinkMenu.currItemId = LIST_CANCEL;
            sMysteryGiftLinkMenu.state = 2;
        }
        if (sMysteryGiftLinkMenu.state == 2)
        {
            if (!arg2)
            {
                ClearWindowTilemap(sMysteryGiftLinkMenu.windowId);
            }
            else
            {
                switch (arg2)
                {
                case 0: // can never be reached, because of the if statement above
                    ClearStdWindowAndFrame(sMysteryGiftLinkMenu.windowId, FALSE);
                    break;
                case 2:
                case 1:
                    ClearStdWindowAndFrame(sMysteryGiftLinkMenu.windowId, FALSE);
                    break;
                }
            }
            CopyWindowToVram(sMysteryGiftLinkMenu.windowId, COPYWIN_MAP);
        }
        break;
    case 2:
        DestroyListMenuTask(sMysteryGiftLinkMenu.listTaskId, NULL, NULL);
        RemoveWindow(sMysteryGiftLinkMenu.windowId);
        sMysteryGiftLinkMenu.state = 0;
        return sMysteryGiftLinkMenu.currItemId;
    }
    return LIST_NOTHING_CHOSEN;
}

u8 ListMenuInit(const struct ListMenuTemplate *listMenuTemplate, u16 cursorPos, u16 itemsAbove)
{
    u8 taskId = ListMenuInitInternal(listMenuTemplate, cursorPos, itemsAbove);
    PutWindowTilemap(listMenuTemplate->windowId);
    CopyWindowToVram(listMenuTemplate->windowId, COPYWIN_GFX);
    return taskId;
}

u8 ListMenuInitInRect(const struct ListMenuTemplate *listMenuTemplate, const struct ListMenuWindowRect *rect, u16 cursorPos, u16 itemsAbove)
{
    s32 i;
    u8 taskId = ListMenuInitInternal(listMenuTemplate, cursorPos, itemsAbove);
    
    for (i = 0; rect[i].palNum != 0xFF; i++)
        PutWindowRectTilemapOverridePalette(listMenuTemplate->windowId, rect[i].x, rect[i].y, rect[i].width, rect[i].height, rect[i].palNum);
    CopyWindowToVram(listMenuTemplate->windowId, COPYWIN_GFX);
    return taskId;
}

s32 ListMenu_ProcessInput(u8 listTaskId)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    if (JOY_NEW(A_BUTTON))
    {
        return list->template.items[list->cursorPos + list->itemsAbove].index;
    }
    else if (JOY_NEW(B_BUTTON))
    {
        return LIST_CANCEL;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        ListMenuChangeSelection(list, TRUE, 1, FALSE);
        return LIST_NOTHING_CHOSEN;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        ListMenuChangeSelection(list, TRUE, 1, TRUE);
        return LIST_NOTHING_CHOSEN;
    }
    else // try to move by one window scroll
    {
        bool16 rightButton, leftButton;
        switch (list->template.scrollMultiple)
        {
        case LIST_NO_MULTIPLE_SCROLL:
        default:
            leftButton = FALSE;
            rightButton = FALSE;
            break;
        case LIST_MULTIPLE_SCROLL_DPAD:
            leftButton = gMain.newAndRepeatedKeys & DPAD_LEFT;
            rightButton = gMain.newAndRepeatedKeys & DPAD_RIGHT;
            break;
        case LIST_MULTIPLE_SCROLL_L_R:
            leftButton = gMain.newAndRepeatedKeys & L_BUTTON;
            rightButton = gMain.newAndRepeatedKeys & R_BUTTON;
            break;
        }
        if (leftButton)
        {
            ListMenuChangeSelection(list, TRUE, list->template.maxShowed, FALSE);
            return LIST_NOTHING_CHOSEN;
        }
        else if (rightButton)
        {
            ListMenuChangeSelection(list, TRUE, list->template.maxShowed, TRUE);
            return LIST_NOTHING_CHOSEN;
        }
        else
        {
            return LIST_NOTHING_CHOSEN;
        }
    }
}

void DestroyListMenuTask(u8 listTaskId, u16 *cursorPos, u16 *itemsAbove)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    if (cursorPos != NULL)
        *cursorPos = list->cursorPos;
    if (itemsAbove != NULL)
        *itemsAbove = list->itemsAbove;

    if (list->taskId != TAIL_SENTINEL)
        ListMenuRemoveCursorObject(list->taskId, list->template.cursorKind - 2);

    DestroyTask(listTaskId);
}

void RedrawListMenu(u8 listTaskId)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    FillWindowPixelBuffer(list->template.windowId, PIXEL_FILL(list->template.fillValue));
    ListMenuPrintEntries(list, list->cursorPos, 0, list->template.maxShowed);
    ListMenuDrawCursor(list);
    CopyWindowToVram(list->template.windowId, COPYWIN_GFX);
}

static void ChangeListMenuPals(u8 listTaskId, u8 cursorPal, u8 fillValue, u8 cursorShadowPal)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    list->template.cursorPal = cursorPal;
    list->template.fillValue = fillValue;
    list->template.cursorShadowPal = cursorShadowPal;
}

static void ChangeListMenuCoords(u8 listTaskId, u8 x, u8 y)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    SetWindowAttribute(list->template.windowId, WINDOW_TILEMAP_LEFT, x);
    SetWindowAttribute(list->template.windowId, WINDOW_TILEMAP_TOP, y);
}

static s32 ListMenuTestInput(struct ListMenuTemplate *template, u32 cursorPos, u32 itemsAbove, u16 keys, u16 *newCursorPos, u16 *newItemsAbove)
{
    struct ListMenu list;

    list.template = *template;
    list.cursorPos = cursorPos;
    list.itemsAbove = itemsAbove;
    list.unk_1C = 0;
    list.unk_1D = 0;
    if (keys == DPAD_UP)
        ListMenuChangeSelection(&list, FALSE, 1, FALSE);
    if (keys == DPAD_DOWN)
        ListMenuChangeSelection(&list, FALSE, 1, TRUE);

    if (newCursorPos != NULL)
        *newCursorPos = list.cursorPos;
    if (newItemsAbove != NULL)
        *newItemsAbove = list.itemsAbove;
    return LIST_NOTHING_CHOSEN;
}

static void ListMenuGetCurrentItemArrayId(u8 listTaskId, u16 *arrayId)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    if (arrayId != NULL)
        *arrayId = list->cursorPos + list->itemsAbove;
}

void ListMenuGetScrollAndRow(u8 listTaskId, u16 *cursorPos, u16 *itemsAbove)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    if (cursorPos != NULL)
        *cursorPos = list->cursorPos;
    if (itemsAbove != NULL)
        *itemsAbove = list->itemsAbove;
}

u16 ListMenuGetYCoordForPrintingArrowCursor(u8 listTaskId)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;
    u8 yMultiplier = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + list->template.itemVerticalPadding;

    return list->itemsAbove * yMultiplier + list->template.upText_Y;
}

static u8 ListMenuInitInternal(const struct ListMenuTemplate *listMenuTemplate, u16 cursorPos, u16 itemsAbove)
{
    u8 listTaskId = CreateTask(ListMenuDummyTask, 0);
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    list->template = *listMenuTemplate;
    list->cursorPos = cursorPos;
    list->itemsAbove = itemsAbove;
    list->unk_1C = 0;
    list->unk_1D = 0;
    list->taskId = TAIL_SENTINEL;
    list->unk_1F = 0;
    gListMenuOverride.cursorPal = list->template.cursorPal;
    gListMenuOverride.fillValue = list->template.fillValue;
    gListMenuOverride.cursorShadowPal = list->template.cursorShadowPal;
    gListMenuOverride.lettersSpacing = list->template.lettersSpacing;
    gListMenuOverride.fontId = list->template.fontId;
    gListMenuOverride.enabled = FALSE;
    if (list->template.totalItems < list->template.maxShowed)
        list->template.maxShowed = list->template.totalItems;
    FillWindowPixelBuffer(list->template.windowId, PIXEL_FILL(list->template.fillValue));
    ListMenuPrintEntries(list, list->cursorPos, 0, list->template.maxShowed);
    ListMenuDrawCursor(list);
    ListMenuCallSelectionChangedCallback(list, TRUE);

    return listTaskId;
}

static void ListMenuPrint(struct ListMenu *list, const u8 *str, u8 x, u8 y)
{
    u8 colors[3];
    if (gListMenuOverride.enabled)
    {
        colors[0] = gListMenuOverride.fillValue;
        colors[1] = gListMenuOverride.cursorPal;
        colors[2] = gListMenuOverride.cursorShadowPal;
        AddTextPrinterParameterized4(list->template.windowId, gListMenuOverride.fontId, x, y, gListMenuOverride.lettersSpacing, 0, colors, TEXT_SKIP_DRAW, str);
        gListMenuOverride.enabled = FALSE;
    }
    else
    {
        colors[0] = list->template.fillValue;
        colors[1] = list->template.cursorPal;
        colors[2] = list->template.cursorShadowPal;
        AddTextPrinterParameterized4(list->template.windowId, list->template.fontId, x, y, list->template.lettersSpacing, 0, colors, TEXT_SKIP_DRAW, str);
    }
}

static void ListMenuPrintEntries(struct ListMenu *list, u16 startIndex, u16 yOffset, u16 count)
{
    s32 i;
    u8 x, y;
    u8 yMultiplier = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + list->template.itemVerticalPadding;

    for (i = 0; i < count; i++)
    {
        if (list->template.items[startIndex].index != LIST_HEADER)
            x = list->template.item_X;
        else
            x = list->template.header_X;
        y = (yOffset + i) * yMultiplier + list->template.upText_Y;
        if (list->template.itemPrintFunc != NULL)
            list->template.itemPrintFunc(list->template.windowId, list->template.items[startIndex].index, y);
        ListMenuPrint(list, list->template.items[startIndex].label, x, y);
        startIndex++;
    }
}

static void ListMenuDrawCursor(struct ListMenu *list)
{
    u8 yMultiplier = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + list->template.itemVerticalPadding;
    u8 x = list->template.cursor_X;
    u8 y = list->itemsAbove * yMultiplier + list->template.upText_Y;
    
    switch (list->template.cursorKind)
    {
    case 0:
        ListMenuPrint(list, gText_SelectorArrow2, x, y);
        break;
    case 1:
        break;
    case 2:
        if (list->taskId == TAIL_SENTINEL)
            list->taskId = ListMenuAddCursorObject(list, 0);
        ListMenuUpdateCursorObject(list->taskId, GetWindowAttribute(list->template.windowId, WINDOW_TILEMAP_LEFT) * 8 - 1, GetWindowAttribute(list->template.windowId, WINDOW_TILEMAP_TOP) * 8 + y - 1, 0);
        break;
    case 3:
        if (list->taskId == TAIL_SENTINEL)
            list->taskId = ListMenuAddCursorObject(list, 1);
        ListMenuUpdateCursorObject(list->taskId, GetWindowAttribute(list->template.windowId, WINDOW_TILEMAP_LEFT) * 8 + x, GetWindowAttribute(list->template.windowId, WINDOW_TILEMAP_TOP) * 8 + y, 1);
        break;
    }
}

static u8 ListMenuAddCursorObject(struct ListMenu *list, u32 cursorKind)
{
    struct CursorStruct cursor;

    cursor.left = 0;
    cursor.top = 160;
    cursor.rowWidth = GetWindowAttribute(list->template.windowId, WINDOW_WIDTH) * 8 + 2;
    cursor.rowHeight = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + 2;
    cursor.tileTag = 0x4000;
    cursor.palTag = TAG_NONE;
    cursor.palNum = 15;
    return ListMenuAddCursorObjectInternal(&cursor, cursorKind);
}

static void ListMenuErasePrintedCursor(struct ListMenu *list, u16 itemsAbove)
{
    u8 cursorKind = list->template.cursorKind;
    if (cursorKind == 0)
    {
        u8 yMultiplier = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + list->template.itemVerticalPadding;
        u8 width  = GetMenuCursorDimensionByFont(list->template.fontId, 0);
        u8 height = GetMenuCursorDimensionByFont(list->template.fontId, 1);
        FillWindowPixelRect(list->template.windowId,
                            PIXEL_FILL(list->template.fillValue),
                            list->template.cursor_X,
                            itemsAbove * yMultiplier + list->template.upText_Y,
                            width,
                            height);
    }
}

static u8 ListMenuUpdateSelectedRowIndexAndScrollOffset(struct ListMenu *list, bool8 movingDown)
{
    u16 itemsAbove = list->itemsAbove;
    u16 cursorPos = list->cursorPos;
    u16 newRow;
    u32 newScroll;

    if (!movingDown)
    {
        if (list->template.maxShowed == 1)
            newRow = 0;
        else
            newRow = list->template.maxShowed - ((list->template.maxShowed / 2) + (list->template.maxShowed % 2)) - 1;

        if (cursorPos == 0)
        {
            while (itemsAbove != 0)
            {
                itemsAbove--;
                if (list->template.items[cursorPos + itemsAbove].index != LIST_HEADER)
                {
                    list->itemsAbove = itemsAbove;
                    return 1;
                }
            }
            return 0;
        }
        else
        {
            while (itemsAbove > newRow)
            {
                itemsAbove--;
                if (list->template.items[cursorPos + itemsAbove].index != LIST_HEADER)
                {
                    list->itemsAbove = itemsAbove;
                    return 1;
                }
            }
            newScroll = cursorPos - 1;
        }
    }
    else
    {
        if (list->template.maxShowed == 1)
            newRow = 0;
        else
            newRow = ((list->template.maxShowed / 2) + (list->template.maxShowed % 2));

        if (cursorPos == list->template.totalItems - list->template.maxShowed)
        {
            while (itemsAbove < list->template.maxShowed - 1)
            {
                itemsAbove++;
                if (list->template.items[cursorPos + itemsAbove].index != LIST_HEADER)
                {
                    list->itemsAbove = itemsAbove;
                    return 1;
                }
            }
            return 0;
        }
        else
        {
            while (itemsAbove < newRow)
            {
                itemsAbove++;
                if (list->template.items[cursorPos + itemsAbove].index != LIST_HEADER)
                {
                    list->itemsAbove = itemsAbove;
                    return 1;
                }
            }
            newScroll = cursorPos + 1;
        }
    }
    list->itemsAbove = newRow;
    list->cursorPos = newScroll;
    return 2;
}

static void ListMenuScroll(struct ListMenu *list, u8 count, bool8 movingDown)
{
    if (count >= list->template.maxShowed)
    {
        FillWindowPixelBuffer(list->template.windowId, PIXEL_FILL(list->template.fillValue));
        ListMenuPrintEntries(list, list->cursorPos, 0, list->template.maxShowed);
    }
    else
    {
        u8 yMultiplier = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + list->template.itemVerticalPadding;

        if (!movingDown)
        {
            u16 y, width, height;

            ScrollWindow(list->template.windowId, 1, count * yMultiplier, PIXEL_FILL(list->template.fillValue));
            ListMenuPrintEntries(list, list->cursorPos, 0, count);

            y = (list->template.maxShowed * yMultiplier) + list->template.upText_Y;
            width = GetWindowAttribute(list->template.windowId, WINDOW_WIDTH) * 8;
            height = (GetWindowAttribute(list->template.windowId, WINDOW_HEIGHT) * 8) - y;
            FillWindowPixelRect(list->template.windowId,
                                PIXEL_FILL(list->template.fillValue),
                                0, y, width, height);
        }
        else
        {
            u16 width;

            ScrollWindow(list->template.windowId, 0, count * yMultiplier, PIXEL_FILL(list->template.fillValue));
            ListMenuPrintEntries(list, list->cursorPos + (list->template.maxShowed - count), list->template.maxShowed - count, count);

            width = GetWindowAttribute(list->template.windowId, WINDOW_WIDTH) * 8;
            FillWindowPixelRect(list->template.windowId,
                                PIXEL_FILL(list->template.fillValue),
                                0, 0, width, list->template.upText_Y);
        }
    }
}

static bool8 ListMenuChangeSelection(struct ListMenu *list, bool8 updateCursorAndCallCallback, u8 count, bool8 movingDown)
{
    u16 oldSelectedRow;
    u8 selectionChange, i, cursorCount;

    oldSelectedRow = list->itemsAbove;
    cursorCount = 0;
    selectionChange = 0;
    for (i = 0; i < count; i++)
    {
        do
        {
            u8 ret = ListMenuUpdateSelectedRowIndexAndScrollOffset(list, movingDown);
            
            selectionChange |= ret;
            if (ret != 2)
                break;
            cursorCount++;
        }
        while (list->template.items[list->cursorPos + list->itemsAbove].index == LIST_HEADER);
    }

    if (updateCursorAndCallCallback)
    {
        switch (selectionChange)
        {
        case 0:
        default:
            return TRUE;
        case 1:
            ListMenuErasePrintedCursor(list, oldSelectedRow);
            ListMenuDrawCursor(list);
            ListMenuCallSelectionChangedCallback(list, FALSE);
            CopyWindowToVram(list->template.windowId, COPYWIN_GFX);
            break;
        case 2:
        case 3:
            ListMenuErasePrintedCursor(list, oldSelectedRow);
            ListMenuScroll(list, cursorCount, movingDown);
            ListMenuDrawCursor(list);
            ListMenuCallSelectionChangedCallback(list, FALSE);
            CopyWindowToVram(list->template.windowId, COPYWIN_GFX);
            break;
        }
    }
    return FALSE;
}

static void ListMenuCallSelectionChangedCallback(struct ListMenu *list, u8 onInit)
{
    if (list->template.moveCursorFunc != NULL)
        list->template.moveCursorFunc(list->template.items[list->cursorPos + list->itemsAbove].index, onInit, list);
}

void ListMenuOverrideSetColors(u8 cursorPal, u8 fillValue, u8 cursorShadowPal)
{
    gListMenuOverride.cursorPal = cursorPal;
    gListMenuOverride.fillValue = fillValue;
    gListMenuOverride.cursorShadowPal = cursorShadowPal;
    gListMenuOverride.enabled = TRUE;
}

void ListMenuDefaultCursorMoveFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    if (!onInit)
        PlaySE(SE_SELECT);
}

static s32 ListMenuGetTemplateField(u8 taskId, u8 field)
{
    struct ListMenu *data = (struct ListMenu *)gTasks[taskId].data;

    switch (field)
    {
    case LISTFIELD_MOVECURSORFUNC:
    case LISTFIELD_MOVECURSORFUNC2:
        return (s32)(data->template.moveCursorFunc);
    case LISTFIELD_TOTALITEMS:
        return data->template.totalItems;
    case LISTFIELD_MAXSHOWED:
        return data->template.maxShowed;
    case LISTFIELD_WINDOWID:
        return data->template.windowId;
    case LISTFIELD_HEADERX:
        return data->template.header_X;
    case LISTFIELD_ITEMX:
        return data->template.item_X;
    case LISTFIELD_CURSORX:
        return data->template.cursor_X;
    case LISTFIELD_UPTEXTY:
        return data->template.upText_Y;
    case LISTFIELD_CURSORPAL:
        return data->template.cursorPal;
    case LISTFIELD_FILLVALUE:
        return data->template.fillValue;
    case LISTFIELD_CURSORSHADOWPAL:
        return data->template.cursorShadowPal;
    case LISTFIELD_LETTERSPACING:
        return data->template.lettersSpacing;
    case LISTFIELD_ITEMVERTICALPADDING:
        return data->template.itemVerticalPadding;
    case LISTFIELD_SCROLLMULTIPLE:
        return data->template.scrollMultiple;
    case LISTFIELD_FONTID:
        return data->template.fontId;
    case LISTFIELD_CURSORKIND:
        return data->template.cursorKind;
    default:
        return -1;
    }
}

void ListMenuSetTemplateField(u8 taskId, u8 field, s32 value)
{
    struct ListMenu *data = (struct ListMenu *)gTasks[taskId].data;

    switch (field)
    {
    case LISTFIELD_MOVECURSORFUNC:
    case LISTFIELD_MOVECURSORFUNC2:
        data->template.moveCursorFunc = (void *)value;
        break;
    case LISTFIELD_TOTALITEMS:
        data->template.totalItems = value;
        break;
    case LISTFIELD_MAXSHOWED:
        data->template.maxShowed = value;
        break;
    case LISTFIELD_WINDOWID:
        data->template.windowId = value;
        break;
    case LISTFIELD_HEADERX:
        data->template.header_X = value;
        break;
    case LISTFIELD_ITEMX:
        data->template.item_X = value;
        break;
    case LISTFIELD_CURSORX:
        data->template.cursor_X = value;
        break;
    case LISTFIELD_UPTEXTY:
        data->template.upText_Y = value;
        break;
    case LISTFIELD_CURSORPAL:
        data->template.cursorPal = value;
        break;
    case LISTFIELD_FILLVALUE:
        data->template.fillValue = value;
        break;
    case LISTFIELD_CURSORSHADOWPAL:
        data->template.cursorShadowPal = value;
        break;
    case LISTFIELD_LETTERSPACING:
        data->template.lettersSpacing = value;
        break;
    case LISTFIELD_ITEMVERTICALPADDING:
        data->template.itemVerticalPadding = value;
        break;
    case LISTFIELD_SCROLLMULTIPLE:
        data->template.scrollMultiple = value;
        break;
    case LISTFIELD_FONTID:
        data->template.fontId = value;
        break;
    case LISTFIELD_CURSORKIND:
        data->template.cursorKind = value;
        break;
    }
}

void ListMenu_LoadMonIconPalette(u8 palOffset, u16 speciesId)
{
    LoadPalette(GetValidMonIconPalettePtr(speciesId), palOffset, PLTT_SIZE_4BPP);
}

void ListMenu_DrawMonIconGraphics(u8 windowId, u16 speciesId, u32 personality, u16 x, u16 y)
{
    BlitBitmapToWindow(windowId, GetMonIconPtr(speciesId, personality, 1), x, y, 32, 32);
}

void ListMenuLoadStdPalAt(u8 palOffset, u8 palId)
{
    const u16 *palette;

    switch (palId)
    {
    case 0:
    default:
        palette = gMenuInfoElements1_Pal;
        break;
    case 1:
        palette = gMenuInfoElements2_Pal;
        break;
    }
    LoadPalette(palette, palOffset, PLTT_SIZE_4BPP);
}

void BlitMenuInfoIcon(u8 windowId, u8 iconId, u16 x, u16 y)
{
    BlitBitmapRectToWindow(windowId, &gMenuInfoElements_Gfx[sMenuInfoIcons[iconId].offset * TILE_SIZE_4BPP], 0, 0, 128, 128, x, y, sMenuInfoIcons[iconId].width, sMenuInfoIcons[iconId].height);
}
