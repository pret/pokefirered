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

static const u32 sItemInfoFrame_Gfx[] = INCBIN_U32("graphics/interface/pss_unk_83D35DC.4bpp");

static const struct OamData gUnknown_83D365C = {
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

static const union AffineAnimCmd gUnknown_83D3664[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_83D3674[] = {
    AFFINEANIMCMD_FRAME(88, 88, 0, 0),
    AFFINEANIMCMD_FRAME(5, 5, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_83D368C[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(-5, -5, 0, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_83D36A4[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(10, 10, 0, 12),
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_83D36C4[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(-10, -10, 0, 12),
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_83D36E4[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(-5, -5, 0, 16),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_83D36FC[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const gUnknown_83D370C[] = {
    gUnknown_83D3664,
    gUnknown_83D3674,
    gUnknown_83D368C,
    gUnknown_83D36A4,
    gUnknown_83D36C4,
    gUnknown_83D36E4,
    gUnknown_83D36FC
};

static const struct SpriteTemplate sSpriteTemplate_ItemIcon = {
    .tileTag = TAG_TILE_7,
    .paletteTag = TAG_PAL_DACB,
    .oam = &gUnknown_83D365C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83D370C,
    .callback = SpriteCallbackDummy,
};

void CreateItemIconSprites(void)
{
    s32 i;
    u8 spriteId;
    struct CompressedSpriteSheet spriteSheet;
    struct SpriteTemplate spriteTemplate;
    static u32 sItemIconGfxBuffer[0x61];

    if (gPSSData->boxOption == OPTION_MOVE_ITEMS)
    {
        spriteSheet.data = sItemIconGfxBuffer;
        spriteSheet.size = 0x200;
        spriteTemplate = sSpriteTemplate_ItemIcon;

        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            spriteSheet.tag = TAG_TILE_7 + i;
            LoadCompressedSpriteSheet(&spriteSheet);
            gPSSData->itemIcons[i].tiles = GetSpriteTileStartByTag(spriteSheet.tag) * TILE_SIZE_4BPP + (void *)(OBJ_VRAM0);
            gPSSData->itemIcons[i].palIndex = AllocSpritePalette(TAG_PAL_DACB + i);
            gPSSData->itemIcons[i].palIndex *= 16;
            gPSSData->itemIcons[i].palIndex += 0x100;
            spriteTemplate.tileTag = TAG_TILE_7 + i;
            spriteTemplate.paletteTag = TAG_PAL_DACB + i;
            spriteId = CreateSprite(&spriteTemplate, 0, 0, 11);
            gPSSData->itemIcons[i].sprite = &gSprites[spriteId];
            gPSSData->itemIcons[i].sprite->invisible = TRUE;
            gPSSData->itemIcons[i].active = FALSE;
        }
    }
    gPSSData->movingItemId = ITEM_NONE;
}

void sub_8095C84(u8 cursorArea, u8 cursorPos)
{
    u16 heldItem;

    if (gPSSData->boxOption != OPTION_MOVE_ITEMS)
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
        SetItemIconAffineAnim(id, 1);
        SetItemIconActive(id, TRUE);
    }
}

void sub_8095D44(u8 cursorArea, u8 cursorPos)
{
    u8 id;

    if (gPSSData->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, 2);
    SetItemIconCallback(id, 0, cursorArea, cursorPos);
}

void Item_FromMonToMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (gPSSData->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    item = 0;
    SetItemIconAffineAnim(id, 3);
    SetItemIconCallback(id, 1, cursorArea, cursorPos);
    SetItemIconPosition(id, 2, 0);
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

    gPSSData->movingItemId = gPSSData->displayMonItemId;
}

void sub_8095E2C(u16 item)
{
    const u32 *tiles = GetItemIconPic(item);
    const u32 *pal = GetItemIconPalette(item);
    u8 id = GetNewItemIconIdx();

    LoadItemIconGfx(id, tiles, pal);
    SetItemIconAffineAnim(id, 6);
    SetItemIconCallback(id, 1, CURSOR_AREA_IN_BOX, 0);
    SetItemIconPosition(id, CURSOR_AREA_BOX, 0);
    SetItemIconActive(id, TRUE);
    gPSSData->movingItemId = item;
}

void Item_SwitchMonsWithMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (gPSSData->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, 3);
    SetItemIconCallback(id, 3, CURSOR_AREA_BOX, 0);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        item = GetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM);
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &gPSSData->movingItemId);
        gPSSData->movingItemId = item;
    }
    else
    {
        item = GetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM);
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &gPSSData->movingItemId);
        gPSSData->movingItemId = item;
    }

    id = GetItemIconIdxByPosition(2, 0);
    SetItemIconAffineAnim(id, 4);
    SetItemIconCallback(id, 4, cursorArea, cursorPos);
}

void Item_GiveMovingToMon(u8 cursorArea, u8 cursorPos)
{
    u8 id;

    if (gPSSData->boxOption != OPTION_MOVE_ITEMS)
        return;

    id = GetItemIconIdxByPosition(2, 0);
    SetItemIconAffineAnim(id, 4);
    SetItemIconCallback(id, 2, cursorArea, cursorPos);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &gPSSData->movingItemId);
        SetBoxMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
    else
    {
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &gPSSData->movingItemId);
        SetPartyMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
}

void Item_TakeMons(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (gPSSData->boxOption != OPTION_MOVE_ITEMS)
        return;

    item = 0;
    id = GetItemIconIdxByPosition(cursorArea, cursorPos);
    SetItemIconAffineAnim(id, 2);
    SetItemIconCallback(id, 0, cursorArea, cursorPos);
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

void sub_8096088(void)
{
    if (gPSSData->boxOption == OPTION_MOVE_ITEMS)
    {
        u8 id = GetItemIconIdxByPosition(2, 0);
        SetItemIconAffineAnim(id, 5);
        SetItemIconCallback(id, 0, CURSOR_AREA_BOX, 0);
    }
}

void sub_80960C0(void)
{
    s32 i;

    if (gPSSData->boxOption != OPTION_MOVE_ITEMS)
        return;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gPSSData->itemIcons[i].active && gPSSData->itemIcons[i].cursorArea == CURSOR_AREA_IN_PARTY)
            SetItemIconCallback(i, 7, CURSOR_AREA_BOX, 0);
    }
}

bool8 sub_809610C(void)
{
    s32 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gPSSData->itemIcons[i].active)
        {
            if (!gPSSData->itemIcons[i].sprite->affineAnimEnded && gPSSData->itemIcons[i].sprite->affineAnimBeginning)
                return TRUE;
            if (gPSSData->itemIcons[i].sprite->callback != SpriteCallbackDummy && gPSSData->itemIcons[i].sprite->callback != SpriteCB_ItemIcon_SetPosToCursor)
                return TRUE;
        }
    }

    return FALSE;
}

bool8 IsActiveItemMoving(void)
{
    s32 i;

    if (gPSSData->boxOption == OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            if (gPSSData->itemIcons[i].active && gPSSData->itemIcons[i].cursorArea == CURSOR_AREA_BOX)
                return TRUE;
        }
    }

    return FALSE;
}

const u8 *GetMovingItemName(void)
{
    return ItemId_GetName(gPSSData->movingItemId);
}

u16 GetMovingItem(void)
{
    return gPSSData->movingItemId;
}

static u8 GetNewItemIconIdx(void)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (!gPSSData->itemIcons[i].active)
        {
            gPSSData->itemIcons[i].active = TRUE;
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
        if (gPSSData->itemIcons[i].active
            && gPSSData->itemIcons[i].cursorArea == cursorArea
            && gPSSData->itemIcons[i].cursorPos == cursorPos)
            return TRUE;
    }

    return FALSE;
}

static u8 GetItemIconIdxByPosition(u8 cursorArea, u8 cursorPos)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gPSSData->itemIcons[i].active
            && gPSSData->itemIcons[i].cursorArea == cursorArea
            && gPSSData->itemIcons[i].cursorPos == cursorPos)
            return i;
    }

    return MAX_ITEM_ICONS;
}

static u8 GetItemIconIdxBySprite(struct Sprite *sprite)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (gPSSData->itemIcons[i].active
            && gPSSData->itemIcons[i].sprite == sprite)
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
        row = cursorPos % IN_BOX_ROWS;
        column = cursorPos / IN_BOX_ROWS;
        gPSSData->itemIcons[id].sprite->x = (24 * row) + 112;
        gPSSData->itemIcons[id].sprite->y = (24 * column) + 56;
        gPSSData->itemIcons[id].sprite->oam.priority = 2;
        break;
    case CURSOR_AREA_IN_PARTY:
        if (cursorPos == 0)
        {
            gPSSData->itemIcons[id].sprite->x = 116;
            gPSSData->itemIcons[id].sprite->y = 76;
        }
        else
        {
            gPSSData->itemIcons[id].sprite->x = 164;
            gPSSData->itemIcons[id].sprite->y = 24 * (cursorPos - 1) + 28;
        }
        gPSSData->itemIcons[id].sprite->oam.priority = 1;
        break;
    }

    gPSSData->itemIcons[id].cursorArea = cursorArea;
    gPSSData->itemIcons[id].cursorPos = cursorPos;
}

static void LoadItemIconGfx(u8 id, const u32 *itemTiles, const u32 *itemPal)
{
    s32 i;

    if (id >= MAX_ITEM_ICONS)
        return;

    CpuFastFill(0, gPSSData->itemIconBuffer, 0x200);
    LZ77UnCompWram(itemTiles, gPSSData->field_22C4);
    for (i = 0; i < 3; i++)
        CpuFastCopy(gPSSData->field_22C4 + (i * 0x60), gPSSData->itemIconBuffer + (i * 0x80), 0x60);

    CpuFastCopy(gPSSData->itemIconBuffer, gPSSData->itemIcons[id].tiles, 0x200);
    LZ77UnCompWram(itemPal, gPSSData->itemIconBuffer);
    LoadPalette(gPSSData->itemIconBuffer, gPSSData->itemIcons[id].palIndex, 0x20);
}

static void SetItemIconAffineAnim(u8 id, u8 animNum)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    StartSpriteAffineAnim(gPSSData->itemIcons[id].sprite, animNum);
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
        gPSSData->itemIcons[id].sprite->sItemIconId = id;
        gPSSData->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_WaitAnim;
        break;
    case ITEM_CB_TO_HAND:
        gPSSData->itemIcons[id].sprite->sState = 0;
        gPSSData->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_ToHand;
        break;
    case ITEM_CB_TO_MON:
        gPSSData->itemIcons[id].sprite->sState = 0;
        gPSSData->itemIcons[id].sprite->sCursorArea = cursorArea;
        gPSSData->itemIcons[id].sprite->sCursorPos = cursorPos;
        gPSSData->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_ToMon;
        break;
    case ITEM_CB_SWAP_TO_HAND:
        gPSSData->itemIcons[id].sprite->sState = 0;
        gPSSData->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_SwapToHand;
        gPSSData->itemIcons[id].sprite->sCursorArea = cursorArea;
        gPSSData->itemIcons[id].sprite->sCursorPos = cursorPos;
        break;
    case ITEM_CB_SWAP_TO_MON:
        gPSSData->itemIcons[id].sprite->sState = 0;
        gPSSData->itemIcons[id].sprite->sCursorArea = cursorArea;
        gPSSData->itemIcons[id].sprite->sCursorPos = cursorPos;
        gPSSData->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_SwapToMon;
        break;
    case ITEM_CB_HIDE_PARTY:
        // If cursor is on a Pokémon with a held item and
        // the player closes the party menu, have the held
        // item follow the Pokémon as the menu slides out
        gPSSData->itemIcons[id].sprite->callback = SpriteCB_ItemIcon_HideParty;
        break;
    }
}

static void SetItemIconActive(u8 id, bool8 show)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    gPSSData->itemIcons[id].active = show;
    gPSSData->itemIcons[id].sprite->invisible = (show == FALSE);
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
        description = ItemId_GetDescription(gPSSData->movingItemId);
    else
        description = ItemId_GetDescription(gPSSData->displayMonItemId);

    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    AddTextPrinterParameterized5(2, FONT_2, description, 2, 0, 0, NULL, 0, 0);
}

void InitItemInfoWindow(void)
{
    gPSSData->itemInfoWindowOffset = 25;
    LoadBgTiles(0, sItemInfoFrame_Gfx, 0x80, 0x1A4);
    DrawItemInfoWindow(0);
}

bool8 UpdateItemInfoWindowSlideIn(void)
{
    s32 i, var;

    if (gPSSData->itemInfoWindowOffset == 0)
        return FALSE;

    gPSSData->itemInfoWindowOffset--;
    var = 25 - gPSSData->itemInfoWindowOffset;
    for (i = 0; i < var; i++)
    {
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + gPSSData->itemInfoWindowOffset + i, i, 12, 1, 8, 15, 25);
    }

    DrawItemInfoWindow(var);
    return (gPSSData->itemInfoWindowOffset != 0);
}

bool8 UpdateItemInfoWindowSlideOut(void)
{
    s32 i, var;

    if (gPSSData->itemInfoWindowOffset == 25)
        return FALSE;

    if (gPSSData->itemInfoWindowOffset == 0)
        FillBgTilemapBufferRect(0, 0, 25, 11, 1, 10, 17);

    gPSSData->itemInfoWindowOffset++;
    var = 25 - gPSSData->itemInfoWindowOffset;
    for (i = 0; i < var; i++)
    {
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + gPSSData->itemInfoWindowOffset + i, i, 12, 1, 8, 15, 25);
    }

    DrawItemInfoWindow(var);

    FillBgTilemapBufferRect(0, 0, var, 11, 1, 10, 0x11);
    return (gPSSData->itemInfoWindowOffset != 25);
}

static void DrawItemInfoWindow(u32 pos)
{
    if (pos != 0)
    {
        FillBgTilemapBufferRect(0, 0x1A4, 0, 0xB, pos, 1, 0xFu);
        FillBgTilemapBufferRect(0, 0x9A4, 0, 0x14, pos, 1, 0xFu);
    }
    FillBgTilemapBufferRect(0, 0x1A5, pos, 0xC, 1, 8, 0xFu);
    FillBgTilemapBufferRect(0, 0x1A6, pos, 0xB, 1, 1, 0xFu);
    FillBgTilemapBufferRect(0, 0x1A7, pos, 0x14, 1, 1, 0xFu);
    ScheduleBgCopyTilemapToVram(0);
}

static void SpriteCB_ItemIcon_WaitAnim(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        SetItemIconActive(sprite->data[0], FALSE);
        sprite->callback = SpriteCallbackDummy;
    }
}

static void SpriteCB_ItemIcon_ToHand(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->data[0]++;
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
    sprite->x = gPSSData->cursorSprite->x + 4;
    sprite->y = gPSSData->cursorSprite->y + gPSSData->cursorSprite->y2 + 8;
    sprite->oam.priority = gPSSData->cursorSprite->oam.priority;
}

static void SpriteCB_ItemIcon_ToMon(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->data[0]++;
    case 1:
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        if (++sprite->data[5] > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->data[6], sprite->data[7]);
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

static void SpriteCB_ItemIcon_SwapToHand(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->data[0]++;
    case 1:
        sprite->data[1] -= sprite->data[3];
        sprite->data[2] -= sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        sprite->x2 = gSineTable[sprite->data[5] * 8] >> 4;
        if (++sprite->data[5] > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->data[6], sprite->data[7]);
            sprite->x2 = 0;
            sprite->callback = SpriteCB_ItemIcon_SetPosToCursor;
        }
        break;
    }
}

static void SpriteCB_ItemIcon_SwapToMon(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = sprite->x << 4;
        sprite->data[2] = sprite->y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->data[0]++;
    case 1:
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->x = sprite->data[1] >> 4;
        sprite->y = sprite->data[2] >> 4;
        sprite->x2 = -(gSineTable[sprite->data[5] * 8] >> 4);
        if (++sprite->data[5] > 11)
        {
            SetItemIconPosition(GetItemIconIdxBySprite(sprite), sprite->data[6], sprite->data[7]);
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


//------------------------------------------------------------------------------
//  SECTION: UnkUtil
//
//  Some data transfer utility that goes functionally unused.
//  It gets initialized with UnkUtil_Init, and run every vblank in Pokémon
//  Storage with UnkUtil_Run, but neither of the Add functions are ever used,
//  so UnkUtil_Run performs no actions.
//------------------------------------------------------------------------------


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
