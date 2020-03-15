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

u8 sub_80961D8(void);
bool32 sub_8096210(u8 cursorArea, u8 cursorPos);
u8 sub_8096258(u8 cursorArea, u8 cursorPos);
void sub_80962F0(u8 id, u8 cursorArea, u8 cursorPos);
void sub_8096408(u8 id, const u32 * tiles, const u32 * pal);
void sub_80964B8(u8 id, u8 affineAnimNo);
void sub_80964E8(u8 id, u8 command, u8 cursorArea, u8 cursorPos);
void sub_8096624(u8 id, bool8 show);
const u32 *GetItemIconPic(u16 itemId);
const u32 *GetItemIconPalette(u16 itemId);
void sub_8096898(u32 x);
void sub_809692C(struct Sprite * sprite);
void sub_8096958(struct Sprite * sprite);
void sub_80969BC(struct Sprite * sprite);
void sub_80969F4(struct Sprite * sprite);
void sub_8096A74(struct Sprite * sprite);
void sub_8096B10(struct Sprite * sprite);
void sub_8096BAC(struct Sprite * sprite);

const u32 gUnknown_83D35DC[] = INCBIN_U32("graphics/interface/pss_unk_83D35DC.4bpp");

const struct OamData gUnknown_83D365C = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0
};

const union AffineAnimCmd gUnknown_83D3664[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_83D3674[] = {
    AFFINEANIMCMD_FRAME(88, 88, 0, 0),
    AFFINEANIMCMD_FRAME(5, 5, 0, 8),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_83D368C[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(-5, -5, 0, 8),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_83D36A4[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(10, 10, 0, 12),
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_83D36C4[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(-10, -10, 0, 12),
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_83D36E4[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(-5, -5, 0, 16),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_83D36FC[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gUnknown_83D370C[] = {
    gUnknown_83D3664,
    gUnknown_83D3674,
    gUnknown_83D368C,
    gUnknown_83D36A4,
    gUnknown_83D36C4,
    gUnknown_83D36E4,
    gUnknown_83D36FC
};

const struct SpriteTemplate gUnknown_83D3728 = {
    .tileTag = TAG_TILE_7,
    .paletteTag = TAG_PAL_DACB,
    .oam = &gUnknown_83D365C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83D370C,
    .callback = SpriteCallbackDummy,
};

void sub_8095B5C(void)
{
    s32 i;
    u8 spriteId;
    struct CompressedSpriteSheet spriteSheet;
    struct SpriteTemplate spriteTemplate;
    static u32 gUnknown_3000FE8[0x61];

    if (sPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        spriteSheet.data = gUnknown_3000FE8;
        spriteSheet.size = 0x200;
        spriteTemplate = gUnknown_83D3728;

        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            spriteSheet.tag = TAG_TILE_7 + i;
            LoadCompressedSpriteSheet(&spriteSheet);
            sPSSData->field_2204[i].tiles = GetSpriteTileStartByTag(spriteSheet.tag) * 32 + (void*)(OBJ_VRAM0);
            sPSSData->field_2204[i].palIndex = AllocSpritePalette(TAG_PAL_DACB + i);
            sPSSData->field_2204[i].palIndex *= 16;
            sPSSData->field_2204[i].palIndex += 0x100;
            spriteTemplate.tileTag = TAG_TILE_7 + i;
            spriteTemplate.paletteTag = TAG_PAL_DACB + i;
            spriteId = CreateSprite(&spriteTemplate, 0, 0, 11);
            sPSSData->field_2204[i].sprite = &gSprites[spriteId];
            sPSSData->field_2204[i].sprite->invisible = TRUE;
            sPSSData->field_2204[i].unk10 = 0;
        }
    }
    sPSSData->movingItem = ITEM_NONE;
}

void sub_8095C84(u8 cursorArea, u8 cursorPos)
{
    u16 heldItem;

    if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;
    if (sub_8096210(cursorArea, cursorPos))
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
        u8 id = sub_80961D8();

        sub_80962F0(id, cursorArea, cursorPos);
        sub_8096408(id, tiles, pal);
        sub_80964B8(id, 1);
        sub_8096624(id, TRUE);
    }
}

void sub_8095D44(u8 cursorArea, u8 cursorPos)
{
    u8 id;

    if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    id = sub_8096258(cursorArea, cursorPos);
    sub_80964B8(id, 2);
    sub_80964E8(id, 0, cursorArea, cursorPos);
}

void Item_FromMonToMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    id = sub_8096258(cursorArea, cursorPos);
    item = 0;
    sub_80964B8(id, 3);
    sub_80964E8(id, 1, cursorArea, cursorPos);
    sub_80962F0(id, 2, 0);
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

    sPSSData->movingItem = sPSSData->cursorMonItem;
}

void sub_8095E2C(u16 item)
{
    const u32 *tiles = GetItemIconPic(item);
    const u32 *pal = GetItemIconPalette(item);
    u8 id = sub_80961D8();

    sub_8096408(id, tiles, pal);
    sub_80964B8(id, 6);
    sub_80964E8(id, 1, CURSOR_AREA_IN_BOX, 0);
    sub_80962F0(id, CURSOR_AREA_BOX, 0);
    sub_8096624(id, TRUE);
    sPSSData->movingItem = item;
}

void Item_SwitchMonsWithMoving(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    id = sub_8096258(cursorArea, cursorPos);
    sub_80964B8(id, 3);
    sub_80964E8(id, 3, CURSOR_AREA_BOX, 0);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        item = GetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM);
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &sPSSData->movingItem);
        sPSSData->movingItem = item;
    }
    else
    {
        item = GetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM);
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &sPSSData->movingItem);
        sPSSData->movingItem = item;
    }

    id = sub_8096258(2, 0);
    sub_80964B8(id, 4);
    sub_80964E8(id, 4, cursorArea, cursorPos);
}

void Item_GiveMovingToMon(u8 cursorArea, u8 cursorPos)
{
    u8 id;

    if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    id = sub_8096258(2, 0);
    sub_80964B8(id, 4);
    sub_80964E8(id, 2, cursorArea, cursorPos);
    if (cursorArea == CURSOR_AREA_IN_BOX)
    {
        SetCurrentBoxMonData(cursorPos, MON_DATA_HELD_ITEM, &sPSSData->movingItem);
        SetBoxMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
    else
    {
        SetMonData(&gPlayerParty[cursorPos], MON_DATA_HELD_ITEM, &sPSSData->movingItem);
        SetPartyMonIconObjMode(cursorPos, ST_OAM_OBJ_NORMAL);
    }
}

void Item_TakeMons(u8 cursorArea, u8 cursorPos)
{
    u8 id;
    u16 item;

    if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    item = 0;
    id = sub_8096258(cursorArea, cursorPos);
    sub_80964B8(id, 2);
    sub_80964E8(id, 0, cursorArea, cursorPos);
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
    if (sPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        u8 id = sub_8096258(2, 0);
        sub_80964B8(id, 5);
        sub_80964E8(id, 0, CURSOR_AREA_BOX, 0);
    }
}

void sub_80960C0(void)
{
    s32 i;

    if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        return;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (sPSSData->field_2204[i].unk10 && sPSSData->field_2204[i].unk8 == 1)
            sub_80964E8(i, 7, CURSOR_AREA_BOX, 0);
    }
}

bool8 sub_809610C(void)
{
    s32 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (sPSSData->field_2204[i].unk10)
        {
            if (!sPSSData->field_2204[i].sprite->affineAnimEnded && sPSSData->field_2204[i].sprite->affineAnimBeginning)
                return TRUE;
            if (sPSSData->field_2204[i].sprite->callback != SpriteCallbackDummy && sPSSData->field_2204[i].sprite->callback != sub_80969BC)
                return TRUE;
        }
    }

    return FALSE;
}

bool8 IsActiveItemMoving(void)
{
    s32 i;

    if (sPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < MAX_ITEM_ICONS; i++)
        {
            if (sPSSData->field_2204[i].unk10 && sPSSData->field_2204[i].unk8 == 2)
                return TRUE;
        }
    }

    return FALSE;
}

const u8 *GetMovingItemName(void)
{
    return ItemId_GetName(sPSSData->movingItem);
}

u16 GetMovingItem(void)
{
    return sPSSData->movingItem;
}

u8 sub_80961D8(void)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (!sPSSData->field_2204[i].unk10)
        {
            sPSSData->field_2204[i].unk10 = TRUE;
            return i;
        }
    }

    return MAX_ITEM_ICONS;
}

bool32 sub_8096210(u8 cursorArea, u8 cursorPos)
{
    s32 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (sPSSData->field_2204[i].unk10
            && sPSSData->field_2204[i].unk8 == cursorArea
            && sPSSData->field_2204[i].unk9 == cursorPos)
            return TRUE;
    }

    return FALSE;
}

u8 sub_8096258(u8 cursorArea, u8 cursorPos)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (sPSSData->field_2204[i].unk10
            && sPSSData->field_2204[i].unk8 == cursorArea
            && sPSSData->field_2204[i].unk9 == cursorPos)
            return i;
    }

    return MAX_ITEM_ICONS;
}

u8 sub_80962A8(struct Sprite *sprite)
{
    u8 i;

    for (i = 0; i < MAX_ITEM_ICONS; i++)
    {
        if (sPSSData->field_2204[i].unk10
            && sPSSData->field_2204[i].sprite == sprite)
            return i;
    }

    return MAX_ITEM_ICONS;
}

void sub_80962F0(u8 id, u8 cursorArea, u8 cursorPos)
{
    u8 row, column;

    if (id >= MAX_ITEM_ICONS)
        return;

    switch (cursorArea)
    {
    case CURSOR_AREA_IN_BOX:
        row = cursorPos % IN_BOX_ROWS;
        column = cursorPos / IN_BOX_ROWS;
        sPSSData->field_2204[id].sprite->pos1.x = (24 * row) + 112;
        sPSSData->field_2204[id].sprite->pos1.y = (24 * column) + 56;
        sPSSData->field_2204[id].sprite->oam.priority = 2;
        break;
    case CURSOR_AREA_IN_PARTY:
        if (cursorPos == 0)
        {
            sPSSData->field_2204[id].sprite->pos1.x = 116;
            sPSSData->field_2204[id].sprite->pos1.y = 76;
        }
        else
        {
            sPSSData->field_2204[id].sprite->pos1.x = 164;
            sPSSData->field_2204[id].sprite->pos1.y = 24 * (cursorPos - 1) + 28;
        }
        sPSSData->field_2204[id].sprite->oam.priority = 1;
        break;
    }

    sPSSData->field_2204[id].unk8 = cursorArea;
    sPSSData->field_2204[id].unk9 = cursorPos;
}

void sub_8096408(u8 id, const u32 *itemTiles, const u32 *itemPal)
{
    s32 i;

    if (id >= MAX_ITEM_ICONS)
        return;

    CpuFastFill(0, sPSSData->field_42C4, 0x200);
    LZ77UnCompWram(itemTiles, sPSSData->field_22C4);
    for (i = 0; i < 3; i++)
        CpuFastCopy(sPSSData->field_22C4 + (i * 0x60), sPSSData->field_42C4 + (i * 0x80), 0x60);

    CpuFastCopy(sPSSData->field_42C4, sPSSData->field_2204[id].tiles, 0x200);
    LZ77UnCompWram(itemPal, sPSSData->field_42C4);
    LoadPalette(sPSSData->field_42C4, sPSSData->field_2204[id].palIndex, 0x20);
}

void sub_80964B8(u8 id, u8 animNum)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    StartSpriteAffineAnim(sPSSData->field_2204[id].sprite, animNum);
}

void sub_80964E8(u8 id, u8 command, u8 cursorArea, u8 cursorPos)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    switch (command)
    {
    case 0:
        sPSSData->field_2204[id].sprite->data[0] = id;
        sPSSData->field_2204[id].sprite->callback = sub_809692C;
        break;
    case 1:
        sPSSData->field_2204[id].sprite->data[0] = 0;
        sPSSData->field_2204[id].sprite->callback = sub_8096958;
        break;
    case 2:
        sPSSData->field_2204[id].sprite->data[0] = 0;
        sPSSData->field_2204[id].sprite->data[6] = cursorArea;
        sPSSData->field_2204[id].sprite->data[7] = cursorPos;
        sPSSData->field_2204[id].sprite->callback = sub_80969F4;
        break;
    case 3:
        sPSSData->field_2204[id].sprite->data[0] = 0;
        sPSSData->field_2204[id].sprite->callback = sub_8096A74;
        sPSSData->field_2204[id].sprite->data[6] = cursorArea;
        sPSSData->field_2204[id].sprite->data[7] = cursorPos;
        break;
    case 4:
        sPSSData->field_2204[id].sprite->data[0] = 0;
        sPSSData->field_2204[id].sprite->data[6] = cursorArea;
        sPSSData->field_2204[id].sprite->data[7] = cursorPos;
        sPSSData->field_2204[id].sprite->callback = sub_8096B10;
        break;
    case 7:
        sPSSData->field_2204[id].sprite->callback = sub_8096BAC;
        break;
    }
}

void sub_8096624(u8 id, bool8 show)
{
    if (id >= MAX_ITEM_ICONS)
        return;

    sPSSData->field_2204[id].unk10 = show;
    sPSSData->field_2204[id].sprite->invisible = (show == FALSE);
}

const u32 *GetItemIconPic(u16 itemId)
{
    return GetItemIconGfxPtr(itemId, 0);
}

const u32 *GetItemIconPalette(u16 itemId)
{
    return GetItemIconGfxPtr(itemId, 1);
}

void PrintItemDescription(void)
{
    const u8 *description;

    if (IsActiveItemMoving())
        description = ItemId_GetDescription(sPSSData->movingItem);
    else
        description = ItemId_GetDescription(sPSSData->cursorMonItem);

    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    AddTextPrinterParameterized5(2, 2, description, 2, 0, 0, NULL, 0, 0);
}

void sub_80966F4(void)
{
    sPSSData->field_2236 = 25;
    LoadBgTiles(0, gUnknown_83D35DC, 0x80, 0x1A4);
    sub_8096898(0);
}

bool8 sub_8096728(void)
{
    s32 i, var;

    if (sPSSData->field_2236 == 0)
        return FALSE;

    sPSSData->field_2236--;
    var = 25 - sPSSData->field_2236;
    for (i = 0; i < var; i++)
    {
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + sPSSData->field_2236 + i, i, 12, 1, 8, 15, 25);
    }

    sub_8096898(var);
    return (sPSSData->field_2236 != 0);
}

bool8 sub_80967C0(void)
{
    s32 i, var;

    if (sPSSData->field_2236 == 25)
        return FALSE;

    if (sPSSData->field_2236 == 0)
        FillBgTilemapBufferRect(0, 0, 25, 11, 1, 10, 17);

    sPSSData->field_2236++;
    var = 25 - sPSSData->field_2236;
    for (i = 0; i < var; i++)
    {
        WriteSequenceToBgTilemapBuffer(0, GetBgAttribute(0, BG_ATTR_BASETILE) + 0x14 + sPSSData->field_2236 + i, i, 12, 1, 8, 15, 25);
    }

    sub_8096898(var);

    FillBgTilemapBufferRect(0, 0, var, 11, 1, 10, 0x11);
    return (sPSSData->field_2236 != 25);
}

void sub_8096898(u32 x)
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

void sub_809692C(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        sub_8096624(sprite->data[0], FALSE);
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_8096958(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = sprite->pos1.x << 4;
        sprite->data[2] = sprite->pos1.y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->data[0]++;
    case 1:
        sprite->data[1] -= sprite->data[3];
        sprite->data[2] -= sprite->data[4];
        sprite->pos1.x = sprite->data[1] >> 4;
        sprite->pos1.y = sprite->data[2] >> 4;
        if (++sprite->data[5] > 11)
            sprite->callback = sub_80969BC;
        break;
    }
}

void sub_80969BC(struct Sprite *sprite)
{
    sprite->pos1.x = sPSSData->field_CB4->pos1.x + 4;
    sprite->pos1.y = sPSSData->field_CB4->pos1.y + sPSSData->field_CB4->pos2.y + 8;
    sprite->oam.priority = sPSSData->field_CB4->oam.priority;
}

void sub_80969F4(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = sprite->pos1.x << 4;
        sprite->data[2] = sprite->pos1.y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->data[0]++;
    case 1:
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->pos1.x = sprite->data[1] >> 4;
        sprite->pos1.y = sprite->data[2] >> 4;
        if (++sprite->data[5] > 11)
        {
            sub_80962F0(sub_80962A8(sprite), sprite->data[6], sprite->data[7]);
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

void sub_8096A74(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = sprite->pos1.x << 4;
        sprite->data[2] = sprite->pos1.y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->data[0]++;
    case 1:
        sprite->data[1] -= sprite->data[3];
        sprite->data[2] -= sprite->data[4];
        sprite->pos1.x = sprite->data[1] >> 4;
        sprite->pos1.y = sprite->data[2] >> 4;
        sprite->pos2.x = gSineTable[sprite->data[5] * 8] >> 4;
        if (++sprite->data[5] > 11)
        {
            sub_80962F0(sub_80962A8(sprite), sprite->data[6], sprite->data[7]);
            sprite->pos2.x = 0;
            sprite->callback = sub_80969BC;
        }
        break;
    }
}

void sub_8096B10(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = sprite->pos1.x << 4;
        sprite->data[2] = sprite->pos1.y << 4;
        sprite->data[3] = 10;
        sprite->data[4] = 21;
        sprite->data[5] = 0;
        sprite->data[0]++;
    case 1:
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->pos1.x = sprite->data[1] >> 4;
        sprite->pos1.y = sprite->data[2] >> 4;
        sprite->pos2.x = -(gSineTable[sprite->data[5] * 8] >> 4);
        if (++sprite->data[5] > 11)
        {
            sub_80962F0(sub_80962A8(sprite), sprite->data[6], sprite->data[7]);
            sprite->callback = SpriteCallbackDummy;
            sprite->pos2.x = 0;
        }
        break;
    }
}

void sub_8096BAC(struct Sprite *sprite)
{
    sprite->pos1.y -= 8;
    if (sprite->pos1.y + sprite->pos2.y < -16)
    {
        sprite->callback = SpriteCallbackDummy;
        sub_8096624(sub_80962A8(sprite), FALSE);
    }
}
