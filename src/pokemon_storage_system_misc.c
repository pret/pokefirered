#include <stdlib.h> // to declare abs
#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "item.h"
#include "item_menu_icons.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system_internal.h"
#include "text_window.h"
#include "trig.h"
#include "constants/items.h"

static EWRAM_DATA struct
{
    u8 funcId;
    u8 state;
    u8 fromColumn;
    u8 fromRow;
    u8 toColumn;
    u8 toRow;
    u8 cursorColumn;
    u8 cursorRow;
    u8 minColumn;
    u8 minRow;
    u8 columnsTotal;
    u8 rowsTotal;
    u16 bgX;
    u16 bgY;
    u16 bgMoveSteps;
    struct BoxPokemon boxMons[IN_BOX_COUNT];
} *sMultiMove = NULL;

static bool8 MultiMove_Function_Start(void);
static bool8 MultiMove_Function_Single(void);
static bool8 MultiMove_Function_ChangeSelection(void);
static bool8 MultiMove_Function_GrabSelection(void);
static bool8 MultiMove_Function_MoveMons(void);
static bool8 MultiMove_Function_PlaceMons(void);
static void MultiMove_UpdateSelectedIcons(void);
static void MultiMove_SelectColumn(u8 column, u8 minRow, u8 maxRow);
static void MultiMove_SelectRow(u8 row, u8 minColumn, u8 maxColumn);
static void MultiMove_DeselectColumn(u8 arg0, u8 minRow, u8 maxRow);
static void MultiMove_DeselectRow(u8 row, u8 minColumn, u8 maxColumn);
static void MultiMove_SetIconToBg(u8 x, u8 y);
static void MultiMove_ClearIconFromBg(u8 x, u8 y);
static void MultiMove_InitBg(u16 bgX, u16 bgY, u16 duration);
static u8 MultiMove_UpdateBg(void);
static void MultiMove_GetMonsFromSelection(void);
static void MultiMove_RemoveMonsFromBox(void);
static void MultiMove_CreatePlacedMonIcons(void);
static void MultiMove_SetPlacedMonData(void);
static void MultiMove_ResetBg(void);

static const struct WindowTemplate sWindowTemplate_MultiMove = {
    .bg = 0,
    .tilemapLeft = 10,
    .tilemapTop = 3,
    .width = 20,
    .height = 18,
    .paletteNum = 9,
    .baseBlock = 0x00a
};

bool8 MultiMove_Init(void)
{
    sMultiMove = Alloc(sizeof(*sMultiMove));
    if (sMultiMove != NULL)
    {
        gStorage->multiMoveWindowId = AddWindow8Bit(&sWindowTemplate_MultiMove);
        if (gStorage->multiMoveWindowId != WINDOW_NONE)
        {
            FillWindowPixelBuffer(gStorage->multiMoveWindowId, PIXEL_FILL(0));
            return TRUE;
        }
    }

    return FALSE;
}

void MultiMove_Free(void)
{
    if (sMultiMove != NULL)
        Free(sMultiMove);
}

void MultiMove_SetFunction(u8 funcId)
{
    sMultiMove->funcId = funcId;
    sMultiMove->state = 0;
}

bool8 MultiMove_RunFunction(void)
{
    switch (sMultiMove->funcId)
    {
    case MULTIMOVE_START:
        return MultiMove_Function_Start();
    case MULTIMOVE_SINGLE:
        return MultiMove_Function_Single();
    case MULTIMOVE_CHANGE_SELECTION:
        return MultiMove_Function_ChangeSelection();
    case MULTIMOVE_GRAB_SELECTION:
        return MultiMove_Function_GrabSelection();
    case MULTIMOVE_MOVE_MONS:
        return MultiMove_Function_MoveMons();
    case MULTIMOVE_PLACE_MONS:
        return MultiMove_Function_PlaceMons();
    }

    return FALSE;
}

static bool8 MultiMove_Function_Start(void)
{
    switch (sMultiMove->state)
    {
    case 0:
        HideBg(0);
        LoadMonIconPalettesAt(BG_PLTT_ID(8));
        sMultiMove->state++;
        break;
    case 1:
        GetCursorBoxColumnAndRow(&sMultiMove->fromColumn, &sMultiMove->fromRow);
        sMultiMove->toColumn = sMultiMove->fromColumn;
        sMultiMove->toRow = sMultiMove->fromRow;
        ChangeBgX(0, -1024, BG_COORD_SET);
        ChangeBgY(0, -1024, BG_COORD_SET);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
        FillWindowPixelBuffer8Bit(gStorage->multiMoveWindowId, PIXEL_FILL(0));
        MultiMove_SetIconToBg(sMultiMove->fromColumn, sMultiMove->fromRow);
        SetBgAttribute(0, BG_ATTR_PALETTEMODE, 1);
        PutWindowTilemap(gStorage->multiMoveWindowId);
        CopyWindowToVram8Bit(gStorage->multiMoveWindowId, COPYWIN_FULL);
        BlendPalettes(0x3F00, 8, RGB_WHITE);
        StartCursorAnim(CURSOR_ANIM_OPEN);
        SetGpuRegBits(REG_OFFSET_BG0CNT, BGCNT_256COLOR);
        sMultiMove->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 MultiMove_Function_Single(void)
{
    switch (sMultiMove->state)
    {
    case 0:
        HideBg(0);
        sMultiMove->state++;
        break;
    case 1:
        MultiMove_ResetBg();
        StartCursorAnim(CURSOR_ANIM_BOUNCE);
        sMultiMove->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            SetCursorPriorityTo1();
            LoadPalette(GetTextWindowPalette(3), BG_PLTT_ID(13), PLTT_SIZE_4BPP);
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 MultiMove_Function_ChangeSelection(void)
{
    switch (sMultiMove->state)
    {
    case 0:
        if (!UpdateCursorPos())
        {
            GetCursorBoxColumnAndRow(&sMultiMove->cursorColumn, &sMultiMove->cursorRow);
            MultiMove_UpdateSelectedIcons();
            sMultiMove->toColumn = sMultiMove->cursorColumn;
            sMultiMove->toRow = sMultiMove->cursorRow;
            CopyWindowToVram8Bit(gStorage->multiMoveWindowId, COPYWIN_GFX);
            sMultiMove->state++;
        }
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 MultiMove_Function_GrabSelection(void)
{
    u8 movingBg, movingMon;

    switch (sMultiMove->state)
    {
    case 0:
        MultiMove_GetMonsFromSelection();
        MultiMove_RemoveMonsFromBox();
        InitMultiMonPlaceChange(FALSE);
        sMultiMove->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            StartCursorAnim(CURSOR_ANIM_FIST);
            MultiMove_InitBg(0, 256, 8);
            InitMultiMonPlaceChange(TRUE);
            sMultiMove->state++;
        }
        break;
    case 2:
        movingBg = MultiMove_UpdateBg();
        movingMon = DoMonPlaceChange();
        if (!movingBg && !movingMon)
            return FALSE;
        break;
    }

    return TRUE;
}

static bool8 MultiMove_Function_MoveMons(void)
{
    u8 movingCursor = UpdateCursorPos();
    u8 movingBg = MultiMove_UpdateBg();

    if (!movingCursor && !movingBg)
        return FALSE;
    else
        return TRUE;
}

static bool8 MultiMove_Function_PlaceMons(void)
{
    switch (sMultiMove->state)
    {
    case 0:
        MultiMove_SetPlacedMonData();
        MultiMove_InitBg(0, -256, 8);
        InitMultiMonPlaceChange(FALSE);
        sMultiMove->state++;
        break;
    case 1:
        if (!DoMonPlaceChange() && !MultiMove_UpdateBg())
        {
            MultiMove_CreatePlacedMonIcons();
            StartCursorAnim(CURSOR_ANIM_OPEN);
            InitMultiMonPlaceChange(TRUE);
            HideBg(0);
            sMultiMove->state++;
        }
        break;
    case 2:
        if (!DoMonPlaceChange())
        {
            StartCursorAnim(CURSOR_ANIM_BOUNCE);
            MultiMove_ResetBg();
            sMultiMove->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            LoadPalette(GetTextWindowPalette(3), BG_PLTT_ID(13), PLTT_SIZE_4BPP);
            SetCursorPriorityTo1();
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

bool8 MultiMove_TryMoveGroup(u8 dir)
{
    switch (dir)
    {
    case 0: // up
        if (sMultiMove->minRow == 0)
            return FALSE;
        sMultiMove->minRow--;
        MultiMove_InitBg(0, 1024, 6);
        break;
    case 1: // down
        if (sMultiMove->minRow + sMultiMove->rowsTotal >= 5)
            return FALSE;
        sMultiMove->minRow++;
        MultiMove_InitBg(0, -1024, 6);
        break;
    case 2: // left
        if (sMultiMove->minColumn == 0)
            return FALSE;
        sMultiMove->minColumn--;
        MultiMove_InitBg(1024, 0, 6);
        break;
    case 3: // right
        if (sMultiMove->minColumn + sMultiMove->columnsTotal > 5)
            return FALSE;
        sMultiMove->minColumn++;
        MultiMove_InitBg(-1024, 0, 6);
        break;
    }

    return TRUE;
}

static void MultiMove_UpdateSelectedIcons(void)
{
    s16 columnChange = (abs(sMultiMove->fromColumn - sMultiMove->cursorColumn)) - (abs(sMultiMove->fromColumn - sMultiMove->toColumn));
    s16 rowChange = (abs(sMultiMove->fromRow - sMultiMove->cursorRow)) - (abs(sMultiMove->fromRow - sMultiMove->toRow));

    if (columnChange > 0)
        MultiMove_SelectColumn(sMultiMove->cursorColumn, sMultiMove->fromRow, sMultiMove->toRow);

    if (columnChange < 0)
    {
        MultiMove_DeselectColumn(sMultiMove->toColumn, sMultiMove->fromRow, sMultiMove->toRow);
        MultiMove_SelectColumn(sMultiMove->cursorColumn, sMultiMove->fromRow, sMultiMove->toRow);
    }

    if (rowChange > 0)
        MultiMove_SelectRow(sMultiMove->cursorRow, sMultiMove->fromColumn, sMultiMove->toColumn);

    if (rowChange < 0)
    {
        MultiMove_DeselectRow(sMultiMove->toRow, sMultiMove->fromColumn, sMultiMove->toColumn);
        MultiMove_SelectRow(sMultiMove->cursorRow, sMultiMove->fromColumn, sMultiMove->toColumn);
    }
}

static void MultiMove_SelectColumn(u8 column, u8 minRow, u8 maxRow)
{
    u8 tmp = minRow;

    if (minRow > maxRow)
    {
        minRow = maxRow;
        maxRow = tmp;
    }

    while (minRow <= maxRow)
        MultiMove_SetIconToBg(column, minRow++);
}

static void MultiMove_SelectRow(u8 row, u8 minColumn, u8 maxColumn)
{
    u8 tmp = minColumn;

    if (minColumn > maxColumn)
    {
        minColumn = maxColumn;
        maxColumn = tmp;
    }

    while (minColumn <= maxColumn)
        MultiMove_SetIconToBg(minColumn++, row);
}

static void MultiMove_DeselectColumn(u8 column, u8 minRow, u8 maxRow)
{
    u8 tmp = minRow;

    if (minRow > maxRow)
    {
        minRow = maxRow;
        maxRow = tmp;
    }

    while (minRow <= maxRow)
        MultiMove_ClearIconFromBg(column, minRow++);
}

static void MultiMove_DeselectRow(u8 row, u8 minColumn, u8 maxColumn)
{
    u8 tmp = minColumn;

    if (minColumn > maxColumn)
    {
        minColumn = maxColumn;
        maxColumn = tmp;
    }

    while (minColumn <= maxColumn)
        MultiMove_ClearIconFromBg(minColumn++, row);
}

static void MultiMove_SetIconToBg(u8 x, u8 y)
{
    u8 position = x + (IN_BOX_COLUMNS * y);
    u16 species = GetCurrentBoxMonData(position, MON_DATA_SPECIES_OR_EGG);
    u32 personality = GetCurrentBoxMonData(position, MON_DATA_PERSONALITY);

    if (species != SPECIES_NONE)
    {
        const u8 *iconGfx = GetMonIconPtr(species, personality, 1);
        u8 palNum = GetValidMonIconPalIndex(species) + 8;
        BlitBitmapRectToWindow4BitTo8Bit(gStorage->multiMoveWindowId, iconGfx, 0, 0, 32, 32, 24 * x, 24 * y, 32, 32, palNum);
    }
}

static void MultiMove_ClearIconFromBg(u8 x, u8 y)
{
    u8 position = x + (IN_BOX_COLUMNS * y);
    u16 species = GetCurrentBoxMonData(position, MON_DATA_SPECIES_OR_EGG);

    if (species != SPECIES_NONE)
        FillWindowPixelRect8Bit(gStorage->multiMoveWindowId, PIXEL_FILL(0), 24 * x, 24 * y, 32, 32);
}

static void MultiMove_InitBg(u16 bgX, u16 bgY, u16 duration)
{
    sMultiMove->bgX = bgX;
    sMultiMove->bgY = bgY;
    sMultiMove->bgMoveSteps = duration;
}

static u8 MultiMove_UpdateBg(void)
{
    if (sMultiMove->bgMoveSteps != 0)
    {
        ChangeBgX(0, sMultiMove->bgX, BG_COORD_ADD);
        ChangeBgY(0, sMultiMove->bgY, BG_COORD_ADD);
        sMultiMove->bgMoveSteps--;
    }

    return sMultiMove->bgMoveSteps;
}

static void MultiMove_GetMonsFromSelection(void)
{
    s32 i, j;
    s32 columnCount, rowCount;
    u8 boxId;
    u8 monArrayId;

    sMultiMove->minColumn = min(sMultiMove->fromColumn, sMultiMove->toColumn);
    sMultiMove->minRow = min(sMultiMove->fromRow, sMultiMove->toRow);
    sMultiMove->columnsTotal = abs(sMultiMove->fromColumn - sMultiMove->toColumn) + 1;
    sMultiMove->rowsTotal = abs(sMultiMove->fromRow - sMultiMove->toRow) + 1;
    boxId = StorageGetCurrentBox();
    monArrayId = 0;
    columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            struct BoxPokemon *boxMon = GetBoxedMonPtr(boxId, boxPosition);
            // UB: possible null dereference
#ifdef UBFIX
            if (boxMon != NULL)
                sMultiMove->boxMons[monArrayId] = *boxMon;
#else
            sMultiMove->boxMons[monArrayId] = *boxMon;
#endif
            monArrayId++;
            boxPosition++;
        }
    }
}

static void MultiMove_RemoveMonsFromBox(void)
{
    s32 i, j;
    s32 columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    s32 rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    u8 boxId = StorageGetCurrentBox();

    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            DestroyBoxMonIconAtPosition(boxPosition);
            ZeroBoxMonAt(boxId, boxPosition);
            boxPosition++;
        }
    }
}

static void MultiMove_CreatePlacedMonIcons(void)
{
    s32 i, j;
    s32 columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    s32 rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    u8 monArrayId = 0;

    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            if (GetBoxMonData(&sMultiMove->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES))
                CreateBoxMonIconAtPos(boxPosition);
            monArrayId++;
            boxPosition++;
        }
    }
}

static void MultiMove_SetPlacedMonData(void)
{
    s32 i, j;
    s32 columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    s32 rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    u8 boxId = StorageGetCurrentBox();
    u8 monArrayId = 0;

    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            if (GetBoxMonData(&sMultiMove->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES))
                SetBoxMonAt(boxId, boxPosition, &sMultiMove->boxMons[monArrayId]);
            boxPosition++;
            monArrayId++;
        }
    }
}

static void MultiMove_ResetBg(void)
{
    ChangeBgX(0, 0, BG_COORD_SET);
    ChangeBgY(0, 0, BG_COORD_SET);
    SetBgAttribute(0, BG_ATTR_PALETTEMODE, 0);
    ClearGpuRegBits(REG_OFFSET_BG0CNT, BGCNT_256COLOR);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
    CopyBgTilemapBufferToVram(0);
}

u8 MultiMove_GetOriginPosition(void)
{
    return (IN_BOX_COLUMNS * sMultiMove->fromRow) + sMultiMove->fromColumn;
}

bool8 MultiMove_CanPlaceSelection(void)
{
    s32 i, j;
    s32 columnCount = sMultiMove->minColumn + sMultiMove->columnsTotal;
    s32 rowCount = sMultiMove->minRow + sMultiMove->rowsTotal;
    u8 monArrayId = 0;

    for (i = sMultiMove->minRow; i < rowCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMultiMove->minColumn;
        for (j = sMultiMove->minColumn; j < columnCount; j++)
        {
            if (GetBoxMonData(&sMultiMove->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES)
                && GetCurrentBoxMonData(boxPosition, MON_DATA_SANITY_HAS_SPECIES))
                return FALSE;

            monArrayId++;
            boxPosition++;
        }
    }

    return TRUE;
}

// IDs for the item icon sprite callbacks
enum {
    ITEM_CB_WAIT_ANIM,
    ITEM_CB_TO_HAND,
    ITEM_CB_TO_MON,
    ITEM_CB_SWAP_TO_HAND,
    ITEM_CB_SWAP_TO_MON,
    ITEM_CB_UNUSED_1,
    ITEM_CB_UNUSED_2,
    ITEM_CB_HIDE_PARTY,
};

static u8 GetNewItemIconIdx(void);
static bool32 IsItemIconAtPosition(u8 cursorArea, u8 cursorPos);
static u8 GetItemIconIdxByPosition(u8 cursorArea, u8 cursorPos);
static void SetItemIconPosition(u8 id, u8 cursorArea, u8 cursorPos);
static void LoadItemIconGfx(u8 id, const u32 * tiles, const u32 * pal);
static void SetItemIconAffineAnim(u8 id, u8 affineAnimNo);
static void SetItemIconCallback(u8 id, u8 command, u8 cursorArea, u8 cursorPos);
static void SetItemIconActive(u8 id, bool8 show);
static const u32 *GetItemIconPic(u16 itemId);
static const u32 *GetItemIconPalette(u16 itemId);
static void DrawItemInfoWindow(u32 x);
static void SpriteCB_ItemIcon_WaitAnim(struct Sprite *sprite);
static void SpriteCB_ItemIcon_ToHand(struct Sprite *sprite);
static void SpriteCB_ItemIcon_SetPosToCursor(struct Sprite *sprite);
static void SpriteCB_ItemIcon_ToMon(struct Sprite *sprite);
static void SpriteCB_ItemIcon_SwapToHand(struct Sprite *sprite);
static void SpriteCB_ItemIcon_SwapToMon(struct Sprite *sprite);
static void SpriteCB_ItemIcon_HideParty(struct Sprite *sprite);

static const u32 sItemInfoFrame_Gfx[] = INCBIN_U32("graphics/pokemon_storage/item_info_frame.4bpp");

static const struct OamData sOamData_ItemIcon = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0x000,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_Small[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_Appear[] = {
    AFFINEANIMCMD_FRAME(88, 88, 0, 0),
    AFFINEANIMCMD_FRAME(5, 5, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_Disappear[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(-5, -5, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_PickUp[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(10, 10, 0, 12),
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_PutDown[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(-10, -10, 0, 12),
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_PutAway[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(-5, -5, 0, 16),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ItemIcon_Large[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnims_ItemIcon[] = {
    [ITEM_ANIM_NONE]      = sAffineAnim_ItemIcon_Small,
    [ITEM_ANIM_APPEAR]    = sAffineAnim_ItemIcon_Appear,
    [ITEM_ANIM_DISAPPEAR] = sAffineAnim_ItemIcon_Disappear,
    [ITEM_ANIM_PICK_UP]   = sAffineAnim_ItemIcon_PickUp,
    [ITEM_ANIM_PUT_DOWN]  = sAffineAnim_ItemIcon_PutDown,
    [ITEM_ANIM_PUT_AWAY]  = sAffineAnim_ItemIcon_PutAway,
    [ITEM_ANIM_LARGE]     = sAffineAnim_ItemIcon_Large,
};

static const struct SpriteTemplate sSpriteTemplate_ItemIcon = {
    .tileTag = GFXTAG_ITEM_ICON_0,
    .paletteTag = PALTAG_ITEM_ICON_0,
    .oam = &sOamData_ItemIcon,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_ItemIcon,
    .callback = SpriteCallbackDummy,
};

void CreateItemIconSprites(void)
{
    s32 i;
    u8 spriteId;
    struct CompressedSpriteSheet spriteSheet;
    struct SpriteTemplate spriteTemplate;
    static u32 sItemIconGfxBuffer[0x61];

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        spriteSheet.data = sItemIconGfxBuffer;
        spriteSheet.size = 0x200;
        spriteTemplate = sSpriteTemplate_ItemIcon;

        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            spriteSheet.tag = GFXTAG_ITEM_ICON_0 + i;
            LoadCompressedSpriteSheet(&spriteSheet);
            gStorage->itemIcons[i].tiles = GetSpriteTileStartByTag(spriteSheet.tag) * TILE_SIZE_4BPP + (void *)(OBJ_VRAM0);
            gStorage->itemIcons[i].palIndex = AllocSpritePalette(PALTAG_ITEM_ICON_0 + i);
            gStorage->itemIcons[i].palIndex = OBJ_PLTT_ID(gStorage->itemIcons[i].palIndex);
            spriteTemplate.tileTag = GFXTAG_ITEM_ICON_0 + i;
            spriteTemplate.paletteTag = PALTAG_ITEM_ICON_0 + i;
            spriteId = CreateSprite(&spriteTemplate, 0, 0, 11);
            gStorage->itemIcons[i].sprite = &gSprites[spriteId];
            gStorage->itemIcons[i].sprite->invisible = TRUE;
            gStorage->itemIcons[i].active = FALSE;
        }
    }
    gStorage->movingItemId = ITEM_NONE;
}

void TryLoadItemIconAtPos(u8 cursorArea, u8 cursorPos)
{
    u16 heldItem;

    if ((gStorage->boxOption != OPTION_MOVE_ITEMS) || IsItemIconAtPosition(cursorArea, cursorPos))
        return;

    switch (cursorArea)
    {
    case CURSOR_AREA_IN_BOX:
        if (!GetCurrentBoxMonData(cursorPos, MON_DATA_SANITY_HAS_SPECIES))
            return;
        heldItem = GetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM);
        break;
    case CURSOR_AREA_IN_PARTY:
        if (!GetMonData(&gPlayerParty[cursorPos], MON_DATA_SANITY_HAS_SPECIES))
            return;
        heldItem = GetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM);
        break;
    default:
        return;
    }

    if (heldItem != ITEM_NONE)
    {
        const u32 *tiles = GetItemIconPic(heldItem);
        const u32 *pal = GetItemIconPalette(heldItem);
        u8 id = GetNewItemIconIdx();

        SetItemIconPosition(id, cursorArea, cursorPos);
        LoadItemIconGfx(id, tiles, pal);
        SetItemIconAffineAnim(id, ITEM_ANIM_APPEAR);
        SetItemIconActive(id, TRUE);
    }
}

void TryHideItemIconAtPos(u8 cursorArea, u8 cursorPos)
{
    u8 id;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, ITEM_ANIM_DISAPPEAR);
    SetItemIconCallback(id, ITEM_CB_WAIT_ANIM, cursorArea, cursorPos);
}

void Item_FromMonToMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    item = 0;
    SetItemIconAffineAnim(id, ITEM_ANIM_PICK_UP);
    SetItemIconCallback(id, ITEM_CB_TO_HAND, cursorArea, cursorPos);
    SetItemIconPosition(id, CURSOR_AREA_IN_HAND, 0);
    if (cursorArea  == CURSOR_AREA_IN_BOX)
    {
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &item);
        SetBoxMonIconObjMode(cursorPos, ST_OAM_OBJ_BLEND);
    }
    else
    {
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &item);
        SetPartyMonIconObjMode(cursorPos, ST_OAM_OBJ_BLEND);
    }

    gStorage->movingItemId = gStorage->displayMonItemId;
}

void InitItemIconInCursor(u16 item)
{
    const u32 *tiles = GetItemIconPic(item);
    const u32 *pal = GetItemIconPalette(item);
    u8 id = GetNewItemIconIdx();

    LoadItemIconGfx(id, tiles, pal);
    SetItemIconAffineAnim(id, ITEM_ANIM_LARGE);
    SetItemIconCallback(id, ITEM_CB_TO_HAND, 0, 0);
    SetItemIconPosition(id, CURSOR_AREA_IN_HAND, 0);
    SetItemIconActive(id, TRUE);
    gStorage->movingItemId = item;
}

void Item_SwitchMonsWithMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, ITEM_ANIM_PICK_UP);
    SetItemIconCallback(id, ITEM_CB_SWAP_TO_HAND, CURSOR_AREA_IN_HAND, 0);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        item = GetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM);
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &gStorage->movingItemId);
        gStorage->movingItemId = item;
    }
    else
    {
        item = GetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM);
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &gStorage->movingItemId);
        gStorage->movingItemId = item;
    }

    id = GetItemIconIdxByPosition(2, 0);
    SetItemIconAffineAnim(id, ITEM_ANIM_PUT_DOWN);
    SetItemIconCallback(id, ITEM_CB_SWAP_TO_MON, cursorArea, cursorPos);
}

void Item_GiveMovingToMon(u8 cursorArea, u8 cursorPos)
{
    u8 id;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(2, 0);
    SetItemIconAffineAnim(id, ITEM_ANIM_PUT_DOWN);
    SetItemIconCallback(id, ITEM_CB_TO_MON, cursorArea, cursorPos);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &gStorage->movingItemId);
        SetBoxMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
    else
    {
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &gStorage->movingItemId);
        SetPartyMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
}

void Item_TakeMons(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    item = ITEM_NONE;
    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, ITEM_ANIM_DISAPPEAR);
    SetItemIconCallback(id, ITEM_CB_WAIT_ANIM, cursorArea, cursorPos);
    if (cursorArea  == CURSOR_AREA_IN_BOX)
    {
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &item);
        SetBoxMonIconObjMode(cursorPos, ST_OAM_OBJ_BLEND);
    }
    else
    {
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &item);
        SetPartyMonIconObjMode(cursorPos, ST_OAM_OBJ_BLEND);
    }
}

void MoveItemFromCursorToBag(void)
{
    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        u8 id = GetItemIconIdxByPosition(CURSOR_AREA_IN_HAND, 0);
        SetItemIconAffineAnim(id, ITEM_ANIM_PUT_AWAY);
        SetItemIconCallback(id, ITEM_CB_WAIT_ANIM, 2, 0);
    }
}

// The party menu is being closed, if the cursor is on
// a Pokémon that has a held item make sure it slides
// up along with the closing menu.
void MoveHeldItemWithPartyMenu(void)
{
    s32 i;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active && gStorage->itemIcons[i].cursorArea == CURSOR_AREA_IN_PARTY)
            SetItemIconCallback(i, ITEM_CB_HIDE_PARTY, 2, 0);
    }
}

bool8 IsItemIconAnimActive(void)
{
    s32 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active)
        {
            if (!gStorage->itemIcons[i].sprite->affineAnimEnded && gStorage->itemIcons[i].sprite->affineAnimBeginning)
                return TRUE;
            if (gStorage->itemIcons[i].sprite->callback != SpriteCallbackDummy && gStorage->itemIcons[i].sprite->callback != SpriteCB_ItemIcon_SetPosToCursor)
                return TRUE;
        }
    }

    return FALSE;
}

bool8 IsActiveItemMoving(void)
{
    s32 i;

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            if (gStorage->itemIcons[i].active && gStorage->itemIcons[i].cursorArea == CURSOR_AREA_BOX_TITLE)
                return TRUE;
        }
    }

    return FALSE;
}

const u8 *GetMovingItemName(void)
{
    return ItemId_GetName(gStorage->movingItemId);
}

u16 GetMovingItem(void)
{
    return gStorage->movingItemId;
}

static u8 GetNewItemIconIdx(void)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (!gStorage->itemIcons[i].active)
        {
            gStorage->itemIcons[i].active = TRUE;
            return i;
        }
    }

    return MAX_ITEM_ICONS;
}

static bool32 IsItemIconAtPosition(u8 cursorArea, u8 cursorPos)
{
    s32 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active
            && gStorage->itemIcons[i].cursorArea == cursorArea
            && gStorage->itemIcons[i].cursorPos == cursorPos)
            return TRUE;
    }

    return FALSE;
}

static u8 GetItemIconIdxByPosition(u8 cursorArea, u8 cursorPos)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active
            && gStorage->itemIcons[i].cursorArea == cursorArea
            && gStorage->itemIcons[i].cursorPos == cursorPos)
            return i;
    }

    return MAX_ITEM_ICONS;
}

static u8 GetItemIconIdxBySprite(struct Sprite *sprite)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gStorage->itemIcons[i].active
            && gStorage->itemIcons[i].sprite == sprite)
            return i;
    }

    return MAX_ITEM_ICONS;
}

static void SetItemIconPosition(u8 id, u8 cursorArea, u8 cursorPos)
{
    u8 row, column;

    if (id >= MAX_ITEM_ICONS)
        return;

    switch (cursorArea)
    {
    case CURSOR_AREA_IN_BOX:
        row = cursorPos % IN_BOX_COLUMNS;
        column = cursorPos / IN_BOX_COLUMNS;
        gStorage->itemIcons[id].sprite->x = (24 * row) + 112;
        gStorage->itemIcons[id].sprite->y = (24 * column) + 56;
        gStorage->itemIcons[id].sprite->oam.priority = 2;
        break;
    case CURSOR_AREA_IN_PARTY:
        if (cursorPos == 0)
        {
            gStorage->itemIcons[id].sprite->x = 116;
            gStorage->itemIcons[id].sprite->y = 76;
        }
        else
        {
            gStorage->itemIcons[id].sprite->x = 164;
            gStorage->itemIcons[id].sprite->y = 24 * (cursorPos - 1) + 28;
        }
        gStorage->itemIcons[id].sprite->oam.priority = 1;
        break;
    }

    gStorage->itemIcons[id].cursorArea = cursorArea;
    gStorage->itemIcons[id].cursorPos = cursorPos;
}

static void LoadItemIconGfx(u8 id, const u32 *itemTiles, const u32 *itemPal)
{
    s32 i;

    if (id >= MAX_ITEM_ICONS)
        return;

    CpuFastFill(0, gStorage->itemIconBuffer, 0x200);
    LZ77UnCompWram(itemTiles, gStorage->tileBuffer);
    for (i = 0; i < 3; i++)
        CpuFastCopy(gStorage->tileBuffer + (i * 0x60), gStorage->itemIconBuffer + (i * 0x80), 0x60);

    CpuFastCopy(gStorage->itemIconBuffer, gStorage->itemIcons[id].tiles, 0x200);
    LZ77UnCompWram(itemPal, gStorage->itemIconBuffer);
    LoadPalette(gStorage->itemIconBuffer, gStorage->itemIcons[id].palIndex, PLTT_SIZE_4BPP);
}

static void SetItemIconAffineAnim(u8 id, u8 animNum)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    StartSpriteAffineAnim(gStorage->itemIcons[id].sprite, animNum);
}

#define sItemIconId data[0]
#define sState      data[0]
#define sCursorArea data[6]
#define sCursorPos  data[7]

static void SetItemIconCallback(u8 id, u8 callbackId, u8 cursorArea, u8 cursorPos)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    switch (callbackId)
    {
    case ITEM_CB_WAIT_ANIM:
        gStorage->itemIcons[id].sprite->sItemIconId = id;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_WaitAnim;
        break;
    case ITEM_CB_TO_HAND:
        gStorage->itemIcons[id].sprite->sState = 0;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_ToHand;
        break;
    case ITEM_CB_TO_MON:
        gStorage->itemIcons[id].sprite->sState = 0;
        gStorage->itemIcons[id].sprite->sCursorArea = cursorArea;
        gStorage->itemIcons[id].sprite->sCursorPos = cursorPos;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_ToMon;
        break;
    case ITEM_CB_SWAP_TO_HAND:
        gStorage->itemIcons[id].sprite->sState = 0;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_SwapToHand;
        gStorage->itemIcons[id].sprite->sCursorArea = cursorArea;
        gStorage->itemIcons[id].sprite->sCursorPos = cursorPos;
        break;
    case ITEM_CB_SWAP_TO_MON:
        gStorage->itemIcons[id].sprite->sState = 0;
        gStorage->itemIcons[id].sprite->sCursorArea = cursorArea;
        gStorage->itemIcons[id].sprite->sCursorPos = cursorPos;
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_SwapToMon;
        break;
    case ITEM_CB_HIDE_PARTY:
        // If cursor is on a Pokémon with a held item and
        // the player closes the party menu, have the held
        // item follow the Pokémon as the menu slides out
        gStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_HideParty;
        break;
    }
}

static void SetItemIconActive(u8 id, bool8 show)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    gStorage->itemIcons[id].active = show;
    gStorage->itemIcons[id].sprite->invisible = (show == FALSE);
}

static const u32 *GetItemIconPic(u16 itemId)
{
    return GetItemIconGfxPtr(itemId, ITEMICON_TILES);
}

static const u32 *GetItemIconPalette(u16 itemId)
{
    return GetItemIconGfxPtr(itemId, ITEMICON_PAL);
}

void PrintItemDescription(void)
{
    const u8 *description;

    if (IsActiveItemMoving())
        description = ItemId_GetDescription(gStorage->movingItemId);
    else
        description = ItemId_GetDescription(gStorage->displayMonItemId);

    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    AddTextPrinterParameterized5(2, FONT_NORMAL, description, 2, 0, 0, NULL, 0, 0);
}

void InitItemInfoWindow(void)
{
    gStorage->itemInfoWindowOffset = 25;
    LoadBgTiles(0, sItemInfoFrame_Gfx, 0x80, 0x1A4);
    DrawItemInfoWindow(0);
}

bool8 UpdateItemInfoWindowSlideIn(void)
{
    s32 i, pos;

    if (gStorage->itemInfoWindowOffset == 0)
        return FALSE;

    gStorage->itemInfoWindowOffset--;
    pos = 25 - gStorage->itemInfoWindowOffset;
    for (i = 0; i < pos; i++)
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + gStorage->itemInfoWindowOffset + i, i, 12, 1, 8, 15, 25);

    DrawItemInfoWindow(pos);
    return (gStorage->itemInfoWindowOffset != 0);
}

bool8 UpdateItemInfoWindowSlideOut(void)
{
    s32 i, pos;

    if (gStorage->itemInfoWindowOffset == 25)
        return FALSE;

    if (gStorage->itemInfoWindowOffset == 0)
        FillBgTilemapBufferRect(0, 0, 25, 11, 1, 10, 17);

    gStorage->itemInfoWindowOffset++;
    pos = 25 - gStorage->itemInfoWindowOffset;
    for (i = 0; i < pos; i++)
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + gStorage->itemInfoWindowOffset + i, i, 12, 1, 8, 15, 25);

    DrawItemInfoWindow(pos);

    FillBgTilemapBufferRect(0, 0, pos, 11, 1, 10, 17);
    return (gStorage->itemInfoWindowOffset != 25);
}

static void DrawItemInfoWindow(u32 x)
{
    if (x != 0)
    {
        FillBgTilemapBufferRect(0, 0x1A4, 0, 0xB, x, 1, 15);
        FillBgTilemapBufferRect(0, 0x9A4, 0, 0x14, x, 1, 15);
    }
    FillBgTilemapBufferRect(0, 0x1A5, x, 0xC, 1, 8, 15);
    FillBgTilemapBufferRect(0, 0x1A6, x, 0xB, 1, 1, 15);
    FillBgTilemapBufferRect(0, 0x1A7, x, 0x14, 1, 1, 15);
    ScheduleBgCopyTilemapToVram(0);
}

static void SpriteCB_ItemIcon_WaitAnim(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        SetItemIconActive(sprite->sItemIconId, FALSE);
        sprite->callback = SpriteCallbackDummy;
    }
}

static void SpriteCB_ItemIcon_ToHand(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->sState++;
    case 1:
        sprite->data[1] -= sprite->data[3];
        sprite->data[2] -= sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        if (++sprite->data[5] > 11)
            sprite->callback = SpriteCB_ItemIcon_SetPosToCursor;
        break;
    }
}

static void SpriteCB_ItemIcon_SetPosToCursor(struct Sprite *sprite)
{
    sprite->x = gStorage->cursorSprite->x + 4;
    sprite->y = gStorage->cursorSprite->y + gStorage->cursorSprite->y2 + 8;
    sprite->oam.priority = gStorage->cursorSprite->oam.priority;
}

static void SpriteCB_ItemIcon_ToMon(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->sState++;
    case 1:
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        if (++sprite->data[5] > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->sCursorArea, sprite->sCursorPos);
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

static void SpriteCB_ItemIcon_SwapToHand(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->sState++;
    case 1:
        sprite->data[1] -= sprite->data[3];
        sprite->data[2] -= sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        sprite->x2 = gSineTable[sprite->data[5] * 8] >> 4;
        if (++sprite->data[5] > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->sCursorArea, sprite->sCursorPos);
            sprite->x2 = 0;
            sprite->callback = SpriteCB_ItemIcon_SetPosToCursor;
        }
        break;
    }
}

static void SpriteCB_ItemIcon_SwapToMon(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->sState++;
    case 1:
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        sprite->x2 = -(gSineTable[sprite->data[5] * 8] >> 4);
        if (++sprite->data[5] > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->sCursorArea, sprite->sCursorPos);
            sprite->callback = SpriteCallbackDummy;
            sprite->x2 = 0;
        }
        break;
    }
}

static void SpriteCB_ItemIcon_HideParty(struct Sprite *sprite)
{
    sprite->y -= 8;
    if (sprite->y + sprite->y2 < -16)
    {
        sprite->callback = SpriteCallbackDummy;
        SetItemIconActive(GetItemIconIdxBySprite(sprite), FALSE);
    }
}

#undef sState
#undef sItemIconId
#undef sCursorArea
#undef sCursorPos

//  Some data transfer utility that goes functionally unused.
//  It gets initialized with UnkUtil_Init, and run every vblank in Pokémon
//  Storage with UnkUtil_Run, but neither of the Add functions are ever used,
//  so UnkUtil_Run performs no actions.

static EWRAM_DATA struct UnkUtil *sUnkUtil = NULL;

static void UnkUtil_CpuRun(struct UnkUtilData *unkStruct);
static void UnkUtil_DmaRun(struct UnkUtilData *unkStruct);

void UnkUtil_Init(struct UnkUtil *util, struct UnkUtilData *data, u32 max)
{
    sUnkUtil = util;
    util->data = data;
    util->max = max;
    util->numActive = 0;
}

void UnkUtil_Run(void)
{
    u16 i;
    if (sUnkUtil->numActive)
    {
        for (i = 0; i < sUnkUtil->numActive; i++)
        {
            struct UnkUtilData *data = &sUnkUtil->data[i];
            data->func(data);
        }
        sUnkUtil->numActive = 0;
    }
}

// Unused
static bool8 UnkUtil_CpuAdd(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height, u16 unkArg)
{
    struct UnkUtilData *data;

    if (sUnkUtil->numActive >= sUnkUtil->max)
        return FALSE;

    data = &sUnkUtil->data[sUnkUtil->numActive++];
    data->size = width * 2;
    data->dest = dest + 2 * (dTop * 32 + dLeft);
    data->src = src + 2 * (sTop * unkArg + sLeft);
    data->height = height;
    data->unk = unkArg;
    data->func = UnkUtil_CpuRun;
    return TRUE;
}

// Functionally unused
static void UnkUtil_CpuRun(struct UnkUtilData *data)
{
    u16 i;

    for (i = 0; i < data->height; i++)
    {
        CpuCopy16(data->src, data->dest, data->size);
        data->dest += 64;
        data->src += (data->unk * 2);
    }
}

// Unused
static bool8 UnkUtil_DmaAdd(void *dest, u16 dLeft, u16 dTop, u16 width, u16 height)
{
    struct UnkUtilData *data;

    if (sUnkUtil->numActive >= sUnkUtil->max)
        return FALSE;

    data = &sUnkUtil->data[sUnkUtil->numActive++];
    data->size = width * 2;
    data->dest = dest + ((dTop * 32) + dLeft) * 2;
    data->height = height;
    data->func = UnkUtil_DmaRun;
    return TRUE;
}

// Functionally unused
static void UnkUtil_DmaRun(struct UnkUtilData *data)
{
    u16 i;

    for (i = 0; i < data->height; i++)
    {
        Dma3FillLarge_(0, data->dest, data->size, 16);
        data->dest += 64;
    }
}
