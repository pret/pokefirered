#include "global.h"
#include "graphics.h"
#include "item_icon.h"
#include "item_menu.h"
#include "item_menu_icons.h"
#include "menu_helpers.h"
#include "sprite.h"
#include "constants/item.h"

enum {
    AFFINEANIM_BAG_IDLE,
    AFFINEANIM_BAG_SHAKE,
};

static void SpriteCB_BagVisualSwitchingPockets(struct Sprite *sprite);
static void SpriteCB_ShakeBagSprite(struct Sprite *sprite);

static const struct OamData sOamData_Bag = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .shape = SPRITE_SHAPE(64x64),
    .size = SPRITE_SIZE(64x64),
    .priority = 1,
    .paletteNum = 0
};

static const union AnimCmd sAnim_Bag_OpenPokeBallsPocket[] = {
    ANIMCMD_FRAME(   0, 5),
    ANIMCMD_FRAME(0x40, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_Bag_OpenItemsPocket[] = {
    ANIMCMD_FRAME(   0, 5),
    ANIMCMD_FRAME(0x80, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_Bag_OpenKeyItemsPocket[] = {
    ANIMCMD_FRAME(   0, 5),
    ANIMCMD_FRAME(0xc0, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_Bag[] = {
    [POCKET_ITEMS - 1]      = sAnim_Bag_OpenItemsPocket,
    [POCKET_KEY_ITEMS - 1]  = sAnim_Bag_OpenKeyItemsPocket,
    [POCKET_POKE_BALLS - 1] = sAnim_Bag_OpenPokeBallsPocket,
};

static const union AffineAnimCmd sAffineAnim_BagIdle[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_BagShake[] = {
    AFFINEANIMCMD_FRAME(0, 0, -2, 2),
    AFFINEANIMCMD_FRAME(0, 0,  2, 4),
    AFFINEANIMCMD_FRAME(0, 0, -2, 4),
    AFFINEANIMCMD_FRAME(0, 0,  2, 2),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnimTable_Bag[] = {
    [AFFINEANIM_BAG_IDLE]  = sAffineAnim_BagIdle,
    [AFFINEANIM_BAG_SHAKE] = sAffineAnim_BagShake
};

const struct CompressedSpriteSheet gSpriteSheet_BagMale = {
    .data = gBagMale_Gfx,
    .size = 0x2000,
    .tag = TAG_BAG_GFX
};

const struct CompressedSpriteSheet gSpriteSheet_BagFemale = {
    .data = gBagFemale_Gfx,
    .size = 0x2000,
    .tag = TAG_BAG_GFX
};

const struct SpritePalette gSpritePalette_Bag = {
    .data = gBag_Pal,
    .tag = TAG_BAG_GFX
};

static const struct SpriteTemplate sSpriteTemplate_Bag = {
    .tileTag = TAG_BAG_GFX,
    .paletteTag = TAG_BAG_GFX,
    .oam = &sOamData_Bag,
    .anims = sAnims_Bag,
    .images = NULL,
    .affineAnims = sAffineAnimTable_Bag,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_ItemIcon = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .shape = SPRITE_SHAPE(32x32),
    .size = SPRITE_SIZE(32x32),
    .priority = 1,
    .paletteNum = 2
};

static const union AnimCmd sAnim_ItemIcon[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_ItemIcon[] = {
    sAnim_ItemIcon
};

const struct SpriteTemplate gItemIconSpriteTemplate = {
    .tileTag = TAG_ITEM_ICON,
    .paletteTag = TAG_ITEM_ICON,
    .oam = &sOamData_ItemIcon,
    .anims = sAnims_ItemIcon,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

void AddBagVisualSprite(u8 bagPocketId)
{
    gBagMenu->spriteIds[ITEMMENUSPRITE_BAG] = CreateSprite(&sSpriteTemplate_Bag, 40, 68, 0);
    SetBagVisualPocketId(bagPocketId);
}

void SetBagVisualPocketId(u8 bagPocketId)
{
    struct Sprite *sprite = &gSprites[gBagMenu->spriteIds[ITEMMENUSPRITE_BAG]];
    sprite->y2 = -5;
    sprite->callback = SpriteCB_BagVisualSwitchingPockets;
    StartSpriteAnim(sprite, bagPocketId);
}

static void SpriteCB_BagVisualSwitchingPockets(struct Sprite *sprite)
{
    if (sprite->y2 != 0)
        sprite->y2++;
    else
        sprite->callback = SpriteCallbackDummy;
}

void ShakeBagSprite(void)
{
    struct Sprite *sprite = &gSprites[gBagMenu->spriteIds[ITEMMENUSPRITE_BAG]];
    if (sprite->affineAnimEnded)
    {
        StartSpriteAffineAnim(sprite, AFFINEANIM_BAG_SHAKE);
        sprite->callback = SpriteCB_ShakeBagSprite;
    }
}

static void SpriteCB_ShakeBagSprite(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        StartSpriteAffineAnim(sprite, AFFINEANIM_BAG_IDLE);
        sprite->callback = SpriteCallbackDummy;
    }
}

void AddBagItemIconSprite(u16 itemId, u8 id)
{
    u8 *spriteIds = &gBagMenu->spriteIds[ITEMMENUSPRITE_ITEM];

    if (spriteIds[id] == SPRITE_NONE)
    {
        u8 spriteId;

        // Either TAG_ITEM_ICON or TAG_ITEM_ICON_ALT
        FreeSpriteTilesByTag(TAG_ITEM_ICON + id);
        FreeSpritePaletteByTag(TAG_ITEM_ICON + id);
        spriteId = AddItemIconSprite(TAG_ITEM_ICON + id, TAG_ITEM_ICON + id, itemId);
        if (spriteId != MAX_SPRITES)
        {
            spriteIds[id] = spriteId;
            gSprites[spriteId].x2 = 24;
            gSprites[spriteId].y2 = 140;
        }
    }
}

void RemoveBagItemIconSprite(u8 id)
{
    u8 *spriteIds = &gBagMenu->spriteIds[ITEMMENUSPRITE_ITEM];

    if (spriteIds[id] != SPRITE_NONE)
    {
        DestroySpriteAndFreeResources(&gSprites[spriteIds[id]]);
        spriteIds[id] = SPRITE_NONE;
    }
}

void CreateItemMenuSwapLine(void)
{
    CreateSwapLineSprites(&gBagMenu->spriteIds[ITEMMENUSPRITE_SWAP_LINE], ITEMMENU_SWAP_LINE_LENGTH);
}

void SetItemMenuSwapLineInvisibility(bool8 invisible)
{
    SetSwapLineSpritesInvisibility(&gBagMenu->spriteIds[ITEMMENUSPRITE_SWAP_LINE], ITEMMENU_SWAP_LINE_LENGTH, invisible);
}

void UpdateItemMenuSwapLinePos(u16 y)
{
    UpdateSwapLineSpritesPos(&gBagMenu->spriteIds[ITEMMENUSPRITE_SWAP_LINE], ITEMMENU_SWAP_LINE_LENGTH, 0, y + 6);
}


