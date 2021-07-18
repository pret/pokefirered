#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "item.h"
#include "item_menu_icons.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_storage_system_internal.h"
#include "trig.h"
#include "constants/items.h"

static u8 GetNewItemIconIdx(void);
static bool32 IsItemIconAtPosition(u8 cursorArea, u8 cursorPos);
static u8 GetItemIconIdxByPosition(u8 cursorArea, u8 cursorPos);
static void SetItemIconPosition(u8 id, u8 cursorArea, u8 cursorPos);
static void LoadItemIconGfx(u8 id, const u32 * itemTiles, const u32 * itemPal);
static void SetItemIconAffineAnim(u8 id, u8 animNum);
static void SetItemIconCallback(u8 id, u8 command, u8 cursorArea, u8 cursorPos);
static void SetItemIconActive(u8 id, bool8 show);
static const u32 *GetItemIconPic(u16 itemId);
static const u32 *GetItemIconPalette(u16 itemId);
static void DrawItemInfoWindow(u32 x);
static void SpriteCB_ItemIcon_WaitAnim(struct Sprite * sprite);
static void SpriteCB_ItemIcon_ToHand(struct Sprite * sprite);
static void SpriteCB_ItemIcon_SetPosToCursor(struct Sprite * sprite);
static void SpriteCB_ItemIcon_ToMon(struct Sprite * sprite);
static void SpriteCB_ItemIcon_SwapToHand(struct Sprite * sprite);
static void SpriteCB_ItemIcon_SwapToMon(struct Sprite * sprite);
static void SpriteCB_ItemIcon_HideParty(struct Sprite * sprite);

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

static const union AffineAnimCmd sAffineAnim_ItemIcon_None[] = {
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

static const union AffineAnimCmd *const sAffineAnimTable_ItemIcon[] = {
    [ITEM_ANIM_NONE]      = sAffineAnim_ItemIcon_None,
    [ITEM_ANIM_APPEAR]    = sAffineAnim_ItemIcon_Appear,
    [ITEM_ANIM_DISAPPEAR] = sAffineAnim_ItemIcon_Disappear,
    [ITEM_ANIM_PICK_UP]   = sAffineAnim_ItemIcon_PickUp,
    [ITEM_ANIM_PUT_DOWN]  = sAffineAnim_ItemIcon_PutDown,
    [ITEM_ANIM_PUT_AWAY]  = sAffineAnim_ItemIcon_PutAway,
    [ITEM_ANIM_LARGE]     = sAffineAnim_ItemIcon_Large
};

static const struct SpriteTemplate sSpriteTemplate_ItemIcon = {
    .tileTag = TAG_TILE_ITEM_ICON_0,
    .paletteTag = TAG_PAL_ITEM_ICON_0,
    .oam = &sOamData_ItemIcon,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnimTable_ItemIcon,
    .callback = SpriteCallbackDummy,
};

void CreateItemIconSprites(void)
{
    s32 i;
    u8 spriteId;
    struct CompressedSpriteSheet spriteSheet;
    struct SpriteTemplate spriteTemplate;
    static u32 sItemIconGfxBuffer[0x61];

    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        spriteSheet.data = sItemIconGfxBuffer;
        spriteSheet.size = 0x200;
        spriteTemplate = sSpriteTemplate_ItemIcon;

        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            spriteSheet.tag = TAG_TILE_ITEM_ICON_0 + i;
            LoadCompressedSpriteSheet(&spriteSheet);
            sStorage->itemIcons[i].tiles = GetSpriteTileStartByTag(spriteSheet.tag) * 32 + (void*)(OBJ_VRAM0);
            sStorage->itemIcons[i].palIndex = AllocSpritePalette(TAG_PAL_ITEM_ICON_0 + i);
            sStorage->itemIcons[i].palIndex *= 16;
            sStorage->itemIcons[i].palIndex += 0x100;
            spriteTemplate.tileTag = TAG_TILE_ITEM_ICON_0 + i;
            spriteTemplate.paletteTag = TAG_PAL_ITEM_ICON_0 + i;
            spriteId = CreateSprite(&spriteTemplate, 0, 0, 11);
            sStorage->itemIcons[i].sprite = &gSprites[spriteId];
            sStorage->itemIcons[i].sprite->invisible = TRUE;
            sStorage->itemIcons[i].active = 0;
        }
    }
    sStorage->movingItemId = ITEM_NONE;
}

void TryLoadItemIconAtPos(u8 cursorArea, u8 cursorPos)
{
    u16 heldItem;

    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;
    if (IsItemIconAtPosition(cursorArea, cursorPos))
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

    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, ITEM_ANIM_DISAPPEAR);
    SetItemIconCallback(id, ITEM_CB_WAIT_ANIM, cursorArea, cursorPos);
}

void Item_FromMonToMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    item = 0;
    SetItemIconAffineAnim(id, ITEM_ANIM_PICK_UP);
    SetItemIconCallback(id, ITEM_CB_TO_HAND, cursorArea, cursorPos);
    SetItemIconPosition(id, CURSOR_AREA_BOX, 0);
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

    sStorage->movingItemId = sStorage->displayMonItemId;
}

void InitItemIconInCursor(u16 itemId)
{
    const u32 *tiles = GetItemIconPic(itemId);
    const u32 *pal = GetItemIconPalette(itemId);
    u8 id = GetNewItemIconIdx();

    LoadItemIconGfx(id, tiles, pal);
    SetItemIconAffineAnim(id, ITEM_ANIM_LARGE);
    SetItemIconCallback(id, ITEM_CB_TO_HAND, CURSOR_AREA_IN_BOX, 0);
    SetItemIconPosition(id, CURSOR_AREA_BOX, 0);
    SetItemIconActive(id, TRUE);
    sStorage->movingItemId = itemId;
}

void Item_SwitchMonsWithMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, ITEM_ANIM_PICK_UP);
    SetItemIconCallback(id, ITEM_CB_SWAP_TO_HAND, CURSOR_AREA_BOX, 0);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        item = GetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM);
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &sStorage->movingItemId);
        sStorage->movingItemId = item;
    }
    else
    {
        item = GetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM);
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &sStorage->movingItemId);
        sStorage->movingItemId = item;
    }

    id = GetItemIconIdxByPosition(CURSOR_AREA_BOX, 0);
    SetItemIconAffineAnim(id, ITEM_ANIM_PUT_DOWN);
    SetItemIconCallback(id, ITEM_CB_SWAP_TO_MON, cursorArea, cursorPos);
}

void Item_GiveMovingToMon(u8 cursorArea, u8 cursorPos)
{
    u8 id;

    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(CURSOR_AREA_BOX, 0);
    SetItemIconAffineAnim(id, ITEM_ANIM_PUT_DOWN);
    SetItemIconCallback(id, ITEM_CB_TO_MON, cursorArea, cursorPos);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &sStorage->movingItemId);
        SetBoxMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
    else
    {
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &sStorage->movingItemId);
        SetPartyMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
}

void Item_TakeMons(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    item = 0;
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
    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        u8 id = GetItemIconIdxByPosition(CURSOR_AREA_BOX, 0);
        SetItemIconAffineAnim(id, ITEM_ANIM_PUT_AWAY);
        SetItemIconCallback(id, ITEM_CB_WAIT_ANIM, CURSOR_AREA_BOX, 0);
    }
}

void MoveHeldItemWithPartyMenu(void)
{
    s32 i;

    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (sStorage->itemIcons[i].active && sStorage->itemIcons[i].cursorArea == CURSOR_AREA_IN_PARTY)
            SetItemIconCallback(i, ITEM_CB_HIDE_PARTY, CURSOR_AREA_BOX, 0);
    }
}

bool8 IsItemIconAnimActive(void)
{
    s32 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (sStorage->itemIcons[i].active)
        {
            if (!sStorage->itemIcons[i].sprite->affineAnimEnded && sStorage->itemIcons[i].sprite->affineAnimBeginning)
                return TRUE;
            if (sStorage->itemIcons[i].sprite->callback != SpriteCallbackDummy &&
                sStorage->itemIcons[i].sprite->callback != SpriteCB_ItemIcon_SetPosToCursor)
                return TRUE;
        }
    }

    return FALSE;
}

bool8 IsActiveItemMoving(void)
{
    s32 i;

    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            if (sStorage->itemIcons[i].active && sStorage->itemIcons[i].cursorArea == CURSOR_AREA_BOX)
                return TRUE;
        }
    }

    return FALSE;
}

const u8 *GetMovingItemName(void)
{
    return ItemId_GetName(sStorage->movingItemId);
}

u16 GetMovingItem(void)
{
    return sStorage->movingItemId;
}

static u8 GetNewItemIconIdx(void)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (!sStorage->itemIcons[i].active)
        {
            sStorage->itemIcons[i].active = TRUE;
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
        if (sStorage->itemIcons[i].active
            && sStorage->itemIcons[i].cursorArea == cursorArea
            && sStorage->itemIcons[i].cursorPos == cursorPos)
            return TRUE;
    }

    return FALSE;
}

static u8 GetItemIconIdxByPosition(u8 cursorArea, u8 cursorPos)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (sStorage->itemIcons[i].active
            && sStorage->itemIcons[i].cursorArea == cursorArea
            && sStorage->itemIcons[i].cursorPos == cursorPos)
            return i;
    }

    return MAX_ITEM_ICONS;
}

static u8 GetItemIconIdxBySprite(struct Sprite *sprite)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (sStorage->itemIcons[i].active
            && sStorage->itemIcons[i].sprite == sprite)
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
        sStorage->itemIcons[id].sprite->pos1.x = (24 * row) + 112;
        sStorage->itemIcons[id].sprite->pos1.y = (24 * column) + 56;
        sStorage->itemIcons[id].sprite->oam.priority = 2;
        break;
    case CURSOR_AREA_IN_PARTY:
        if (cursorPos == 0)
        {
            sStorage->itemIcons[id].sprite->pos1.x = 116;
            sStorage->itemIcons[id].sprite->pos1.y = 76;
        }
        else
        {
            sStorage->itemIcons[id].sprite->pos1.x = 164;
            sStorage->itemIcons[id].sprite->pos1.y = 24 * (cursorPos - 1) + 28;
        }
        sStorage->itemIcons[id].sprite->oam.priority = 1;
        break;
    }

    sStorage->itemIcons[id].cursorArea = cursorArea;
    sStorage->itemIcons[id].cursorPos = cursorPos;
}

static void LoadItemIconGfx(u8 id, const u32 *itemTiles, const u32 *itemPal)
{
    s32 i;

    if (id >= MAX_ITEM_ICONS)
        return;

    CpuFastFill(0, sStorage->itemIconBuffer, 0x200);
    LZ77UnCompWram(itemTiles, sStorage->tileBuffer);
    for (i = 0; i < 3; i++)
        CpuFastCopy(sStorage->tileBuffer + (i * 0x60), sStorage->itemIconBuffer + (i * 0x80), 0x60);

    CpuFastCopy(sStorage->itemIconBuffer, sStorage->itemIcons[id].tiles, 0x200);
    LZ77UnCompWram(itemPal, sStorage->itemIconBuffer);
    LoadPalette(sStorage->itemIconBuffer, sStorage->itemIcons[id].palIndex, 0x20);
}

static void SetItemIconAffineAnim(u8 id, u8 animNum)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    StartSpriteAffineAnim(sStorage->itemIcons[id].sprite, animNum);
}

#define sItemIconId data[0]
#define sState      data[0]
#define sXPos       data[1]
#define sYPos       data[2]
#define sXSpeed     data[3]
#define sYSpeed     data[4]
#define sCounter    data[5]
#define sCursorArea data[6]
#define sCursorPos  data[7]

static void SetItemIconCallback(u8 id, u8 command, u8 cursorArea, u8 cursorPos)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    switch (command)
    {
    case ITEM_CB_WAIT_ANIM:
        sStorage->itemIcons[id].sprite->sItemIconId = id;
        sStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_WaitAnim;
        break;
    case ITEM_CB_TO_HAND:
        sStorage->itemIcons[id].sprite->sState = 0;
        sStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_ToHand;
        break;
    case ITEM_CB_TO_MON:
        sStorage->itemIcons[id].sprite->sState = 0;
        sStorage->itemIcons[id].sprite->sCursorArea = cursorArea;
        sStorage->itemIcons[id].sprite->sCursorPos = cursorPos;
        sStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_ToMon;
        break;
    case ITEM_CB_SWAP_TO_HAND:
        sStorage->itemIcons[id].sprite->sState = 0;
        sStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_SwapToHand;
        sStorage->itemIcons[id].sprite->sCursorArea = cursorArea;
        sStorage->itemIcons[id].sprite->sCursorPos = cursorPos;
        break;
    case ITEM_CB_SWAP_TO_MON:
        sStorage->itemIcons[id].sprite->sState = 0;
        sStorage->itemIcons[id].sprite->sCursorArea = cursorArea;
        sStorage->itemIcons[id].sprite->sCursorPos = cursorPos;
        sStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_SwapToMon;
        break;
    case ITEM_CB_HIDE_PARTY:
        sStorage->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_HideParty;
        break;
    }
}

static void SetItemIconActive(u8 id, bool8 show)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    sStorage->itemIcons[id].active = show;
    sStorage->itemIcons[id].sprite->invisible = (show == FALSE);
}

static const u32 *GetItemIconPic(u16 itemId)
{
    return GetItemIconGfxPtr(itemId, 0);
}

static const u32 *GetItemIconPalette(u16 itemId)
{
    return GetItemIconGfxPtr(itemId, 1);
}

void PrintItemDescription(void)
{
    const u8 *description;

    if (IsActiveItemMoving())
        description = ItemId_GetDescription(sStorage->movingItemId);
    else
        description = ItemId_GetDescription(sStorage->displayMonItemId);

    FillWindowPixelBuffer(PSS_WIN_ITEM_DESC, PIXEL_FILL(1));
    AddTextPrinterParameterized5(PSS_WIN_ITEM_DESC, 2, description, 2, 0, TEXT_SPEED_INSTANT, NULL, 0, 0);
}

void InitItemInfoWindow(void)
{
    sStorage->itemInfoWindowOffset = 25;
    LoadBgTiles(0, sItemInfoFrame_Gfx, 0x80, 0x1A4);
    DrawItemInfoWindow(0);
}

bool8 UpdateItemInfoWindowSlideIn(void)
{
    s32 i, var;

    if (sStorage->itemInfoWindowOffset == 0)
        return FALSE;

    sStorage->itemInfoWindowOffset--;
    var = 25 - sStorage->itemInfoWindowOffset;
    for (i = 0; i < var; i++)
    {
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + sStorage->itemInfoWindowOffset + i, i, 12, 1, 8, 15, 25);
    }

    DrawItemInfoWindow(var);
    return (sStorage->itemInfoWindowOffset != 0);
}

bool8 UpdateItemInfoWindowSlideOut(void)
{
    s32 i, var;

    if (sStorage->itemInfoWindowOffset == 25)
        return FALSE;

    if (sStorage->itemInfoWindowOffset == 0)
        FillBgTilemapBufferRect(0, 0, 25, 11, 1, 10, 17);

    sStorage->itemInfoWindowOffset++;
    var = 25 - sStorage->itemInfoWindowOffset;
    for (i = 0; i < var; i++)
    {
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + sStorage->itemInfoWindowOffset + i, i, 12, 1, 8, 15, 25);
    }

    DrawItemInfoWindow(var);

    FillBgTilemapBufferRect(0, 0, var, 11, 1, 10, 0x11);
    return (sStorage->itemInfoWindowOffset != 25);
}

static void DrawItemInfoWindow(u32 x)
{
    if (x != 0)
    {
        FillBgTilemapBufferRect(0, 0x1A4, 0, 0xB, x, 1, 0xFu);
        FillBgTilemapBufferRect(0, 0x9A4, 0, 0x14, x, 1, 0xFu);
    }
    FillBgTilemapBufferRect(0, 0x1A5, x, 0xC, 1, 8, 0xFu);
    FillBgTilemapBufferRect(0, 0x1A6, x, 0xB, 1, 1, 0xFu);
    FillBgTilemapBufferRect(0, 0x1A7, x, 0x14, 1, 1, 0xFu);
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
        sprite->sXPos = sprite->pos1.x << 4;
        sprite->sYPos = sprite->pos1.y << 4;
        sprite->sXSpeed = 10;
        sprite->sYSpeed = 21;
        sprite->sCounter = 0;
        sprite->sState++;
    case 1:
        sprite->sXPos -= sprite->sXSpeed;
        sprite->sYPos -= sprite->sYSpeed;
        sprite->pos1.x = sprite->sXPos >> 4;
        sprite->pos1.y = sprite->sYPos >> 4;
        if (++sprite->sCounter > 11)
            sprite->callback = SpriteCB_ItemIcon_SetPosToCursor;
        break;
    }
}

static void SpriteCB_ItemIcon_SetPosToCursor(struct Sprite *sprite)
{
    sprite->pos1.x = sStorage->cursorSprite->pos1.x + 4;
    sprite->pos1.y = sStorage->cursorSprite->pos1.y + sStorage->cursorSprite->pos2.y + 8;
    sprite->oam.priority = sStorage->cursorSprite->oam.priority;
}

static void SpriteCB_ItemIcon_ToMon(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->sXPos = sprite->pos1.x << 4;
        sprite->sYPos = sprite->pos1.y << 4;
        sprite->sXSpeed = 10;
        sprite->sYSpeed = 21;
        sprite->sCounter = 0;
        sprite->sState++;
    case 1:
        sprite->sXPos += sprite->sXSpeed;
        sprite->sYPos += sprite->sYSpeed;
        sprite->pos1.x = sprite->sXPos >> 4;
        sprite->pos1.y = sprite->sYPos >> 4;
        if (++sprite->sCounter > 11)
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
        sprite->sXPos = sprite->pos1.x << 4;
        sprite->sYPos = sprite->pos1.y << 4;
        sprite->sXSpeed = 10;
        sprite->sYSpeed = 21;
        sprite->sCounter = 0;
        sprite->sState++;
    case 1:
        sprite->sXPos -= sprite->sXSpeed;
        sprite->sYPos -= sprite->sYSpeed;
        sprite->pos1.x = sprite->sXPos >> 4;
        sprite->pos1.y = sprite->sYPos >> 4;
        sprite->pos2.x = gSineTable[sprite->sCounter * 8] >> 4;
        if (++sprite->sCounter > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->sCursorArea, sprite->sCursorPos);
            sprite->pos2.x = 0;
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
        sprite->sXPos = sprite->pos1.x << 4;
        sprite->sYPos = sprite->pos1.y << 4;
        sprite->sXSpeed = 10;
        sprite->sYSpeed = 21;
        sprite->sCounter = 0;
        sprite->sState++;
    case 1:
        sprite->sXPos += sprite->sXSpeed;
        sprite->sYPos += sprite->sYSpeed;
        sprite->pos1.x = sprite->sXPos >> 4;
        sprite->pos1.y = sprite->sYPos >> 4;
        sprite->pos2.x = -(gSineTable[sprite->sCounter * 8] >> 4);
        if (++sprite->sCounter > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->sCursorArea, sprite->sCursorPos);
            sprite->callback = SpriteCallbackDummy;
            sprite->pos2.x = 0;
        }
        break;
    }
}

static void SpriteCB_ItemIcon_HideParty(struct Sprite *sprite)
{
    sprite->pos1.y -= 8;
    if (sprite->pos1.y + sprite->pos2.y < -16)
    {
        sprite->callback = SpriteCallbackDummy;
        SetItemIconActive(GetItemIconIdxBySprite(sprite), FALSE);
    }
}

#undef sItemIconId
#undef sState
#undef sXPos
#undef sYPos
#undef sXSpeed
#undef sYSpeed
#undef sCounter
#undef sCursorArea
#undef sCursorPos
