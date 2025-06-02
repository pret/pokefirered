#include "global.h"
#include "decompress.h"
#include "graphics.h"
#include "list_menu.h"
#include "malloc.h"
#include "menu.h"
#include "palette.h"
#include "pokemon_icon.h"
#include "sound.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "trig.h"
#include "constants/songs.h"

// Cursors after this point are created using a sprite with their own task.
// This allows them to have idle animations. Cursors prior to this are simply printed text.
#define CURSOR_OBJECT_START CURSOR_RED_OUTLINE

struct ScrollIndicatorPair
{
    u8 field_0;
    u16 *scrollOffset;
    u16 fullyUpThreshold;
    u16 fullyDownThreshold;
    u8 topSpriteId;
    u8 bottomSpriteId;
    u16 tileTag;
    u16 palTag;
};

struct RedOutlineCursor
{
    struct SubspriteTable subspriteTable;
    struct Subsprite *subspritesPtr;
    u8 spriteId;
    u16 tileTag;
    u16 palTag;
};

struct RedArrowCursor
{
    u8 spriteId;
    u16 tileTag;
    u16 palTag;
};


static u8 ListMenuInitInternal(const struct ListMenuTemplate *listMenuTemplate, u16 cursorPos, u16 itemsAbove);
static bool8 ListMenuChangeSelection(struct ListMenu *list, bool8 updateCursorAndCallCallback, u8 count, bool8 movingDown);
static void ListMenuPrintEntries(struct ListMenu *list, u16 startIndex, u16 yOffset, u16 count);
static void ListMenuDrawCursor(struct ListMenu *list);
static void ListMenuCallSelectionChangedCallback(struct ListMenu *list, u8 onInit);
static u8 ListMenuAddCursorObject(struct ListMenu *list, u32 cursorKind);

static void SpriteCallback_ScrollIndicatorArrow(struct Sprite *sprite);
static void SpriteCallback_RedArrowCursor(struct Sprite *sprite);
static void Task_ScrollIndicatorArrowPair(u8 taskId);
static u8 ListMenuAddRedArrowCursorObject(const struct CursorStruct *cursor);
static void ListMenuUpdateRedArrowCursorObject(u8 taskId, u16 x, u16 y);
static void ListMenuRemoveRedArrowCursorObject(u8 taskId);

// EWRAM vars
static EWRAM_DATA struct 
{
    u32 currItemId;
    u8 state;
    u8 windowId;
    u8 listTaskId;
} sMysteryGiftLinkMenu = {0};

EWRAM_DATA struct ScrollArrowsTemplate gTempScrollArrowTemplate = {0};

// IWRAM common
COMMON_DATA struct ListMenuOverride 
{
    u8 cursorPal:4;
    u8 fillValue:4;
    u8 cursorShadowPal:4;
    u8 lettersSpacing:6;
    u8 field_2_2:6; // unused
    u8 fontId:7;
    bool8 enabled:1;
} gListMenuOverride = {0};

COMMON_DATA struct ListMenuTemplate gMultiuseListMenuTemplate = {0};

static const struct 
{
    u8 animNum:4;
    u8 bounceDir:4;
    u8 multiplier;
    s16 frequency;
} sScrollIndicatorTemplates[] =
{
    {
        .animNum = 0,
        .bounceDir = 0,
        .multiplier = 2,
        .frequency = 8,
    },
    {
        .animNum = 1,
        .bounceDir = 0,
        .multiplier = 2,
        .frequency = -8,
    },
    {
        .animNum = 2,
        .bounceDir = 1,
        .multiplier = 2,
        .frequency = 8,
    },
    {
        .animNum = 3,
        .bounceDir = 1,
        .multiplier = 2,
        .frequency = -8,
    },
};

static const struct OamData sOamData_ScrollArrowIndicator =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .mosaic = FALSE,
    .bpp = 0,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_ScrollArrowIndicator0[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END,
};

static const union AnimCmd sSpriteAnim_ScrollArrowIndicator1[] =
{
    ANIMCMD_FRAME(0, 30, 1, 0),
    ANIMCMD_END,
};

static const union AnimCmd sSpriteAnim_ScrollArrowIndicator2[] =
{
    ANIMCMD_FRAME(4, 30),
    ANIMCMD_END,
};

static const union AnimCmd sSpriteAnim_ScrollArrowIndicator3[] =
{
    ANIMCMD_FRAME(4, 30, 0, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpriteAnimTable_ScrollArrowIndicator[] =
{
    sSpriteAnim_ScrollArrowIndicator0,
    sSpriteAnim_ScrollArrowIndicator1,
    sSpriteAnim_ScrollArrowIndicator2,
    sSpriteAnim_ScrollArrowIndicator3,
};

static const struct SpriteTemplate sSpriteTemplate_ScrollArrowIndicator =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &sOamData_ScrollArrowIndicator,
    .anims = sSpriteAnimTable_ScrollArrowIndicator,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_ScrollIndicatorArrow,
};

static const struct Subsprite sSubsprite_RedOutline1 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 0,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline2 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 1,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline3 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 2,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline4 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 3,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline5 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 4,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline6 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 5,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline7 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 6,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline8 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 7,
    .priority = 0,
};

static const struct OamData sOamData_RedArrowCursor =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .mosaic = FALSE,
    .bpp = 0,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_RedArrowCursor[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpriteAnimTable_RedArrowCursor[] = { sSpriteAnim_RedArrowCursor };

static const struct SpriteTemplate sSpriteTemplate_RedArrowCursor =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &sOamData_RedArrowCursor,
    .anims = sSpriteAnimTable_RedArrowCursor,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_RedArrowCursor,
};

static const u16 sRedArrowPal[] = INCBIN_U16("graphics/interface/red_arrow.gbapal");
static const u32 sRedArrowOtherGfx[] = INCBIN_U32("graphics/interface/red_arrow_other.4bpp.lz");
static const u32 sSelectorOutlineGfx[] = INCBIN_U32("graphics/interface/selector_outline.4bpp.lz");
static const u32 sRedArrowGfx[] = INCBIN_U32("graphics/interface/red_arrow.4bpp.lz");

// code
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
            LoadUserWindowBorderGfx(sMysteryGiftLinkMenu.windowId, tileNum, palOffset);
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
        return list->template.items[list->scrollOffset + list->selectedRow].id;
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
        *cursorPos = list->scrollOffset;
    if (itemsAbove != NULL)
        *itemsAbove = list->selectedRow;

    if (list->taskId != TAIL_SENTINEL)
        ListMenuRemoveCursorObject(list->taskId, list->template.cursorKind - 2);

    DestroyTask(listTaskId);
}

void RedrawListMenu(u8 listTaskId)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    FillWindowPixelBuffer(list->template.windowId, PIXEL_FILL(list->template.fillValue));
    ListMenuPrintEntries(list, list->scrollOffset, 0, list->template.maxShowed);
    ListMenuDrawCursor(list);
    CopyWindowToVram(list->template.windowId, COPYWIN_GFX);
}

void ListMenuGetCurrentItemArrayId(u8 listTaskId, u16 *arrayId)
{
    struct ListMenu *list = (void *) gTasks[listTaskId].data;

    if (arrayId != NULL)
        *arrayId = list->scrollOffset + list->selectedRow;
}

void ListMenuGetScrollAndRow(u8 listTaskId, u16 *cursorPos, u16 *itemsAbove)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    if (cursorPos != NULL)
        *cursorPos = list->scrollOffset;
    if (itemsAbove != NULL)
        *itemsAbove = list->selectedRow;
}

u16 ListMenuGetYCoordForPrintingArrowCursor(u8 listTaskId)
{
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;
    u8 yMultiplier = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + list->template.itemVerticalPadding;

    return list->selectedRow * yMultiplier + list->template.upText_Y;
}

static u8 ListMenuInitInternal(const struct ListMenuTemplate *listMenuTemplate, u16 cursorPos, u16 itemsAbove)
{
    u8 listTaskId = CreateTask(ListMenuDummyTask, 0);
    struct ListMenu *list = (struct ListMenu *)gTasks[listTaskId].data;

    list->template = *listMenuTemplate;
    list->scrollOffset = cursorPos;
    list->selectedRow = itemsAbove;
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
    ListMenuPrintEntries(list, list->scrollOffset, 0, list->template.maxShowed);
    ListMenuDrawCursor(list);
    ListMenuCallSelectionChangedCallback(list, TRUE);

    return listTaskId;
}

static void ListMenuPrint(struct ListMenu *list, const u8 *str, u8 x, u8 y)
{
    u8 colors[3];
    if (gListMenuOverride.enabled)
    {
        u32 fontId = gListMenuOverride.fontId;
        if (list->template.textNarrowWidth)
            fontId = GetFontIdToFit(str, fontId, gListMenuOverride.lettersSpacing, list->template.textNarrowWidth);
        colors[0] = gListMenuOverride.fillValue;
        colors[1] = gListMenuOverride.cursorPal;
        colors[2] = gListMenuOverride.cursorShadowPal;
        AddTextPrinterParameterized4(list->template.windowId, fontId, x, y, gListMenuOverride.lettersSpacing, 0, colors, TEXT_SKIP_DRAW, str);
        gListMenuOverride.enabled = FALSE;
    }
    else
    {
        u32 fontId = list->template.fontId;
        if (list->template.textNarrowWidth)
            fontId = GetFontIdToFit(str, fontId, list->template.lettersSpacing, list->template.textNarrowWidth);
        colors[0] = list->template.fillValue;
        colors[1] = list->template.cursorPal;
        colors[2] = list->template.cursorShadowPal;
        AddTextPrinterParameterized4(list->template.windowId, fontId, x, y, list->template.lettersSpacing, 0, colors, TEXT_SKIP_DRAW, str);
    }
}

static void ListMenuPrintEntries(struct ListMenu *list, u16 startIndex, u16 yOffset, u16 count)
{
    s32 i;
    u8 x, y;
    u8 yMultiplier = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + list->template.itemVerticalPadding;

    for (i = 0; i < count; i++)
    {
        if (list->template.items[startIndex].id != LIST_HEADER)
            x = list->template.item_X;
        else
            x = list->template.header_X;
        y = (yOffset + i) * yMultiplier + list->template.upText_Y;
        if (list->template.itemPrintFunc != NULL)
            list->template.itemPrintFunc(list->template.windowId, list->template.items[startIndex].id, y);
        ListMenuPrint(list, list->template.items[startIndex].name, x, y);
        startIndex++;
    }
}

static void ListMenuDrawCursor(struct ListMenu *list)
{
    u8 yMultiplier = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + list->template.itemVerticalPadding;
    u8 x = list->template.cursor_X;
    u8 y = list->selectedRow * yMultiplier + list->template.upText_Y;
    
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
    u16 itemsAbove = list->selectedRow;
    u16 cursorPos = list->scrollOffset;
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
                if (list->template.items[cursorPos + itemsAbove].id != LIST_HEADER)
                {
                    list->selectedRow = itemsAbove;
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
                if (list->template.items[cursorPos + itemsAbove].id != LIST_HEADER)
                {
                    list->selectedRow = itemsAbove;
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
                if (list->template.items[cursorPos + itemsAbove].id != LIST_HEADER)
                {
                    list->selectedRow = itemsAbove;
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
                if (list->template.items[cursorPos + itemsAbove].id != LIST_HEADER)
                {
                    list->selectedRow = itemsAbove;
                    return 1;
                }
            }
            newScroll = cursorPos + 1;
        }
    }
    list->selectedRow = newRow;
    list->scrollOffset = newScroll;
    return 2;
}

static void ListMenuScroll(struct ListMenu *list, u8 count, bool8 movingDown)
{
    if (count >= list->template.maxShowed)
    {
        FillWindowPixelBuffer(list->template.windowId, PIXEL_FILL(list->template.fillValue));
        ListMenuPrintEntries(list, list->scrollOffset, 0, list->template.maxShowed);
    }
    else
    {
        u8 yMultiplier = GetFontAttribute(list->template.fontId, FONTATTR_MAX_LETTER_HEIGHT) + list->template.itemVerticalPadding;

        if (!movingDown)
        {
            u16 y, width, height;

            ScrollWindow(list->template.windowId, 1, count * yMultiplier, PIXEL_FILL(list->template.fillValue));
            ListMenuPrintEntries(list, list->scrollOffset, 0, count);

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
            ListMenuPrintEntries(list, list->scrollOffset + (list->template.maxShowed - count), list->template.maxShowed - count, count);

            width = GetWindowAttribute(list->template.windowId, WINDOW_WIDTH) * 8;
            FillWindowPixelRect(list->template.windowId,
                                PIXEL_FILL(list->template.fillValue),
                                0, 0, width, list->template.upText_Y);
        }
    }
}

bool8 ListMenuChangeSelectionFull(struct ListMenu *list, bool32 updateCursor, bool32 callCallback, u8 count, bool8 movingDown)
{
    u16 oldSelectedRow;
    u8 selectionChange, i, cursorCount;

    oldSelectedRow = list->selectedRow;
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
        while (list->template.items[list->scrollOffset + list->selectedRow].id == LIST_HEADER);
    }

    if (updateCursor)
    {
        switch (selectionChange)
        {
        case 0:
        default:
            return TRUE;
        case 1:
            ListMenuErasePrintedCursor(list, oldSelectedRow);
            ListMenuDrawCursor(list);
            if (callCallback)
                ListMenuCallSelectionChangedCallback(list, FALSE);
            CopyWindowToVram(list->template.windowId, COPYWIN_GFX);
            break;
        case 2:
        case 3:
            ListMenuErasePrintedCursor(list, oldSelectedRow);
            ListMenuScroll(list, cursorCount, movingDown);
            ListMenuDrawCursor(list);
            if (callCallback)
                ListMenuCallSelectionChangedCallback(list, FALSE);
            CopyWindowToVram(list->template.windowId, COPYWIN_GFX);
            break;
        }
    }
    return FALSE;
}

static bool8 ListMenuChangeSelection(struct ListMenu *list, bool8 updateCursorAndCallCallback, u8 count, bool8 movingDown)
{
    return ListMenuChangeSelectionFull(list, updateCursorAndCallCallback, updateCursorAndCallCallback, count, movingDown);
}

static void ListMenuCallSelectionChangedCallback(struct ListMenu *list, u8 onInit)
{
    if (list->template.moveCursorFunc != NULL)
        list->template.moveCursorFunc(list->template.items[list->scrollOffset + list->selectedRow].id, onInit, list);
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


#define tState data[0]
#define tAnimNum data[1]
#define tBounceDir data[2]
#define tMultiplier data[3]
#define tFrequency data[4]
#define tSinePos data[5]

static void SpriteCallback_ScrollIndicatorArrow(struct Sprite *sprite)
{
    s32 multiplier;

    switch (sprite->tState)
    {
    case 0:
        StartSpriteAnim(sprite, sprite->tAnimNum);
        sprite->tState++;
        break;
    case 1:
        switch (sprite->tBounceDir)
        {
        case 0:
            multiplier = sprite->tMultiplier;
            sprite->x2 = (gSineTable[(u8)(sprite->tSinePos)] * multiplier) / 256;
            break;
        case 1:
            multiplier = sprite->tMultiplier;
            sprite->y2 = (gSineTable[(u8)(sprite->tSinePos)] * multiplier) / 256;
            break;
        }
        sprite->tSinePos += sprite->tFrequency;
        break;
    }
}

static u8 AddScrollIndicatorArrowObject(u8 arrowDir, u8 x, u8 y, u16 tileTag, u16 palTag)
{
    u8 spriteId;
    struct SpriteTemplate spriteTemplate;

    spriteTemplate = sSpriteTemplate_ScrollArrowIndicator;
    spriteTemplate.tileTag = tileTag;
    spriteTemplate.paletteTag = palTag;
    spriteId = CreateSprite(&spriteTemplate, x, y, 0);
    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].tState = 0;
    gSprites[spriteId].tAnimNum = sScrollIndicatorTemplates[arrowDir].animNum;
    gSprites[spriteId].tBounceDir = sScrollIndicatorTemplates[arrowDir].bounceDir;
    gSprites[spriteId].tMultiplier = sScrollIndicatorTemplates[arrowDir].multiplier;
    gSprites[spriteId].tFrequency = sScrollIndicatorTemplates[arrowDir].frequency;
    gSprites[spriteId].tSinePos = 0;
    return spriteId;
}

#undef tState
#undef tAnimNum
#undef tBounceDir
#undef tMultiplier
#undef tFrequency
#undef tSinePos

u8 AddScrollIndicatorArrowPair(const struct ScrollArrowsTemplate *arrowInfo, u16 *scrollOffset)
{
    struct CompressedSpriteSheet spriteSheet;
    struct SpritePalette spritePal;
    struct ScrollIndicatorPair *data;
    u8 taskId;

    spriteSheet.data = sRedArrowOtherGfx;
    spriteSheet.size = 0x100;
    spriteSheet.tag = arrowInfo->tileTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    if (arrowInfo->palTag == TAG_NONE)
    {
        LoadPalette(sRedArrowPal, OBJ_PLTT_ID(arrowInfo->palNum), sizeof(sRedArrowPal));
    }
    else
    {
        spritePal.data = sRedArrowPal;
        spritePal.tag = arrowInfo->palTag;
        LoadSpritePalette(&spritePal);
    }
    taskId = CreateTask(Task_ScrollIndicatorArrowPair, 0);
    data = (struct ScrollIndicatorPair *)gTasks[taskId].data;

    data->field_0 = 0;
    data->scrollOffset = scrollOffset;
    data->fullyUpThreshold = arrowInfo->fullyUpThreshold;
    data->fullyDownThreshold = arrowInfo->fullyDownThreshold;
    data->tileTag = arrowInfo->tileTag;
    data->palTag = arrowInfo->palTag;
    data->topSpriteId = AddScrollIndicatorArrowObject(arrowInfo->firstArrowType, arrowInfo->firstX, arrowInfo->firstY, arrowInfo->tileTag, arrowInfo->palTag);
    data->bottomSpriteId = AddScrollIndicatorArrowObject(arrowInfo->secondArrowType, arrowInfo->secondX, arrowInfo->secondY, arrowInfo->tileTag, arrowInfo->palTag);

    if (arrowInfo->palTag == TAG_NONE)
    {
        gSprites[data->topSpriteId].oam.paletteNum = arrowInfo->palNum;
        gSprites[data->bottomSpriteId].oam.paletteNum = arrowInfo->palNum;
    }
    return taskId;
}

u8 AddScrollIndicatorArrowPairParameterized(u32 arrowType, s32 commonPos, s32 firstPos, s32 secondPos, s32 fullyDownThreshold, s32 tileTag, s32 palTag, u16 *scrollOffset)
{
    if (arrowType == SCROLL_ARROW_UP || arrowType == SCROLL_ARROW_DOWN)
    {
        gTempScrollArrowTemplate.firstArrowType = SCROLL_ARROW_UP;
        gTempScrollArrowTemplate.firstX = commonPos;
        gTempScrollArrowTemplate.firstY = firstPos;
        gTempScrollArrowTemplate.secondArrowType = SCROLL_ARROW_DOWN;
        gTempScrollArrowTemplate.secondX = commonPos;
        gTempScrollArrowTemplate.secondY = secondPos;
    }
    else
    {
        gTempScrollArrowTemplate.firstArrowType = SCROLL_ARROW_LEFT;
        gTempScrollArrowTemplate.firstX = firstPos;
        gTempScrollArrowTemplate.firstY = commonPos;
        gTempScrollArrowTemplate.secondArrowType = SCROLL_ARROW_RIGHT;
        gTempScrollArrowTemplate.secondX = secondPos;
        gTempScrollArrowTemplate.secondY = commonPos;
    }
    gTempScrollArrowTemplate.fullyUpThreshold = 0;
    gTempScrollArrowTemplate.fullyDownThreshold = fullyDownThreshold;
    gTempScrollArrowTemplate.tileTag = tileTag;
    gTempScrollArrowTemplate.palTag = palTag;
    gTempScrollArrowTemplate.palNum = 0;

    return AddScrollIndicatorArrowPair(&gTempScrollArrowTemplate, scrollOffset);
}

static void Task_ScrollIndicatorArrowPair(u8 taskId)
{
    struct ScrollIndicatorPair *data = (struct ScrollIndicatorPair *)gTasks[taskId].data;
    u16 currItem = (*data->scrollOffset);

    if (currItem == data->fullyUpThreshold)
        gSprites[data->topSpriteId].invisible = TRUE;
    else
        gSprites[data->topSpriteId].invisible = FALSE;

    if (currItem == data->fullyDownThreshold)
        gSprites[data->bottomSpriteId].invisible = TRUE;
    else
        gSprites[data->bottomSpriteId].invisible = FALSE;
}

void RemoveScrollIndicatorArrowPair(u8 taskId)
{
    struct ScrollIndicatorPair *data = (struct ScrollIndicatorPair *)gTasks[taskId].data;

    if (data->tileTag != TAG_NONE)
        FreeSpriteTilesByTag(data->tileTag);
    if (data->palTag != TAG_NONE)
        FreeSpritePaletteByTag(data->palTag);
    DestroySprite(&gSprites[data->topSpriteId]);
    DestroySprite(&gSprites[data->bottomSpriteId]);
    DestroyTask(taskId);
}

u8 ListMenuAddCursorObjectInternal(const struct CursorStruct *cursor, u32 cursorKind)
{
    switch (cursorKind)
    {
    case 0:
    default:
        return ListMenuAddRedOutlineCursorObject(cursor);
    case 1:
        return ListMenuAddRedArrowCursorObject(cursor);
    }
}

void ListMenuUpdateCursorObject(u8 taskId, u16 x, u16 y, u32 cursorKind)
{
    switch (cursorKind)
    {
    case 0:
        ListMenuUpdateRedOutlineCursorObject(taskId, x, y);
        break;
    case 1:
        ListMenuUpdateRedArrowCursorObject(taskId, x, y);
        break;
    }
}

void ListMenuRemoveCursorObject(u8 taskId, u32 cursorKind)
{
    switch (cursorKind)
    {
    case 0:
        ListMenuRemoveRedOutlineCursorObject(taskId);
        break;
    case 1:
        ListMenuRemoveRedArrowCursorObject(taskId);
        break;
    }
}

void Task_RedOutlineCursor(u8 taskId)
{
}

u8 ListMenuGetRedOutlineCursorSpriteCount(u16 rowWidth, u16 rowHeight)
{
    s32 i, count = 4;

    if (rowWidth > 16)
        for (i = 8; i < (rowWidth - 8); i += 8)
            count += 2;
    if (rowHeight > 16)
        for (i = 8; i < (rowHeight - 8); i += 8)
            count += 2;
    return count;
}

void ListMenuSetUpRedOutlineCursorSpriteOamTable(u16 rowWidth, u16 rowHeight, struct Subsprite *subsprites)
{
    s32 i, j, id = 0;

    subsprites[id] = sSubsprite_RedOutline1;
    subsprites[id].x = 136;
    subsprites[id].y = 136;
    id++;
    subsprites[id] = sSubsprite_RedOutline2;
    subsprites[id].x = rowWidth + 128;
    subsprites[id].y = 136;
    id++;
    subsprites[id] = sSubsprite_RedOutline7;
    subsprites[id].x = 136;
    subsprites[id].y = rowHeight + 128;
    id++;
    subsprites[id] = sSubsprite_RedOutline8;
    subsprites[id].x = rowWidth + 128;
    subsprites[id].y = rowHeight + 128;
    id++;
    if (rowWidth > 16)
    {
        for (i = 8; i < rowWidth - 8; i += 8)
        {
            subsprites[id] = sSubsprite_RedOutline3;
            subsprites[id].x = i - 120;
            subsprites[id].y = 136;
            id++;

            subsprites[id] = sSubsprite_RedOutline6;
            subsprites[id].x = i - 120;
            subsprites[id].y = rowHeight + 128;
            id++;
        }
    }
    if (rowHeight > 16)
    {
        for (j = 8; j < rowHeight - 8; j += 8)
        {
            subsprites[id] = sSubsprite_RedOutline4;
            subsprites[id].x = 136;
            subsprites[id].y = j - 120;
            id++;
            subsprites[id] = sSubsprite_RedOutline5;
            subsprites[id].x = rowWidth + 128;
            subsprites[id].y = j - 120;
            id++;
        }
    }
}

u8 ListMenuAddRedOutlineCursorObject(const struct CursorStruct *cursor)
{
    struct CompressedSpriteSheet spriteSheet;
    struct SpritePalette spritePal;
    struct RedOutlineCursor *data;
    struct SpriteTemplate spriteTemplate;
    u8 taskId;

    spriteSheet.data = sSelectorOutlineGfx;
    spriteSheet.size = 0x100;
    spriteSheet.tag = cursor->tileTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    if (cursor->palTag == TAG_NONE)
    {
        LoadPalette(sRedArrowPal, OBJ_PLTT_ID(cursor->palNum), sizeof(sRedArrowPal));
    }
    else
    {
        spritePal.data = sRedArrowPal;
        spritePal.tag = cursor->palTag;
        LoadSpritePalette(&spritePal);
    }
    taskId = CreateTask(Task_RedOutlineCursor, 0);
    data = (struct RedOutlineCursor *)gTasks[taskId].data;
    data->tileTag = cursor->tileTag;
    data->palTag = cursor->palTag;
    data->subspriteTable.subspriteCount = ListMenuGetRedOutlineCursorSpriteCount(cursor->rowWidth, cursor->rowHeight);
    data->subspriteTable.subsprites = data->subspritesPtr = Alloc(data->subspriteTable.subspriteCount * 4);
    ListMenuSetUpRedOutlineCursorSpriteOamTable(cursor->rowWidth, cursor->rowHeight, data->subspritesPtr);
    spriteTemplate = gDummySpriteTemplate;
    spriteTemplate.tileTag = cursor->tileTag;
    spriteTemplate.paletteTag = cursor->palTag;
    data->spriteId = CreateSprite(&spriteTemplate, cursor->left + 120, cursor->top + 120, 0);
    SetSubspriteTables(&gSprites[data->spriteId], &data->subspriteTable);
    gSprites[data->spriteId].oam.priority = 0;
    gSprites[data->spriteId].subpriority = 0;
    gSprites[data->spriteId].subspriteTableNum = 0;
    if (cursor->palTag == TAG_NONE)
        gSprites[data->spriteId].oam.paletteNum = cursor->palNum;
    return taskId;
}

void ListMenuUpdateRedOutlineCursorObject(u8 taskId, u16 x, u16 y)
{
    struct RedOutlineCursor *data = (struct RedOutlineCursor *)gTasks[taskId].data;

    gSprites[data->spriteId].x = x + 120;
    gSprites[data->spriteId].y = y + 120;
}

void ListMenuRemoveRedOutlineCursorObject(u8 taskId)
{
    struct RedOutlineCursor *data = (struct RedOutlineCursor *)gTasks[taskId].data;

    Free(data->subspritesPtr);
    if (data->tileTag != TAG_NONE)
        FreeSpriteTilesByTag(data->tileTag);
    if (data->palTag != TAG_NONE)
        FreeSpritePaletteByTag(data->palTag);
    DestroySprite(&gSprites[data->spriteId]);
    DestroyTask(taskId);
}

static void SpriteCallback_RedArrowCursor(struct Sprite *sprite)
{
    sprite->x2 = gSineTable[(u8)(sprite->data[0])] / 64;
    sprite->data[0] += 8;
}

static void Task_RedArrowCursor(u8 taskId)
{
}

static u8 ListMenuAddRedArrowCursorObject(const struct CursorStruct *cursor)
{
    struct CompressedSpriteSheet spriteSheet;
    struct SpritePalette spritePal;
    struct RedArrowCursor *data;
    struct SpriteTemplate spriteTemplate;
    u8 taskId;

    spriteSheet.data = sRedArrowGfx;
    spriteSheet.size = 0x80;
    spriteSheet.tag = cursor->tileTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    if (cursor->palTag == TAG_NONE)
    {
        LoadPalette(sRedArrowPal, OBJ_PLTT_ID(cursor->palNum), sizeof(sRedArrowPal));
    }
    else
    {
        spritePal.data = sRedArrowPal;
        spritePal.tag = cursor->palTag;
        LoadSpritePalette(&spritePal);
    }
    taskId = CreateTask(Task_RedArrowCursor, 0);
    data = (struct RedArrowCursor *)gTasks[taskId].data;
    data->tileTag = cursor->tileTag;
    data->palTag = cursor->palTag;
    spriteTemplate = sSpriteTemplate_RedArrowCursor;
    spriteTemplate.tileTag = cursor->tileTag;
    spriteTemplate.paletteTag = cursor->palTag;
    data->spriteId = CreateSprite(&spriteTemplate, cursor->left, cursor->top, 0);
    gSprites[data->spriteId].x2 = 8;
    gSprites[data->spriteId].y2 = 8;
    if (cursor->palTag == TAG_NONE)
        gSprites[data->spriteId].oam.paletteNum = cursor->palNum;
    return taskId;
}

static void ListMenuUpdateRedArrowCursorObject(u8 taskId, u16 x, u16 y)
{
    struct RedArrowCursor *data = (struct RedArrowCursor *)gTasks[taskId].data;

    gSprites[data->spriteId].x = x;
    gSprites[data->spriteId].y = y;
}

static void ListMenuRemoveRedArrowCursorObject(u8 taskId)
{
    struct RedArrowCursor *data = (struct RedArrowCursor *)gTasks[taskId].data;

    if (data->tileTag != TAG_NONE)
        FreeSpriteTilesByTag(data->tileTag);
    if (data->palTag != TAG_NONE)
        FreeSpritePaletteByTag(data->palTag);
    DestroySprite(&gSprites[data->spriteId]);
    DestroyTask(taskId);
}
