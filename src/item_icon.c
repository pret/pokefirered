#include "global.h"
#include "battle_main.h"
#include "gflib.h"
#include "decompress.h"
#include "graphics.h"
#include "item.h"
#include "item_icon.h"
#include "move.h"
#include "constants/item.h"
#include "constants/items.h"

EWRAM_DATA u8 *gItemIconDecompressionBuffer = NULL;
EWRAM_DATA u8 *gItemIcon4x4Buffer = NULL;

bool8 AllocItemIconTemporaryBuffers(void)
{
    gItemIconDecompressionBuffer = Alloc(0x120);
    if (gItemIconDecompressionBuffer == NULL)
        return FALSE;

    gItemIcon4x4Buffer = AllocZeroed(0x200);
    if (gItemIcon4x4Buffer == NULL)
    {
        Free(gItemIconDecompressionBuffer);
        return FALSE;
    }

    return TRUE;
}

void FreeItemIconTemporaryBuffers(void)
{
    Free(gItemIconDecompressionBuffer);
    Free(gItemIcon4x4Buffer);
}

void CopyItemIconPicTo4x4Buffer(const void *src, void *dest)
{
    u8 i;

    for (i = 0; i < 3; i++)
        CpuCopy16(src + i * 96, dest + i * 128, 0x60);
}

u8 AddItemIconSprite(u16 tilesTag, u16 paletteTag, u16 itemId)
{
    struct SpriteTemplate *spriteTemplate;
    struct SpriteSheet spriteSheet;
    struct SpritePalette spritePalette;
    u8 spriteId;

    if (!AllocItemIconTemporaryBuffers())
        return MAX_SPRITES;

    DecompressDataWithHeaderWram(GetItemIconPic(itemId), gItemIconDecompressionBuffer);
    CopyItemIconPicTo4x4Buffer(gItemIconDecompressionBuffer, gItemIcon4x4Buffer);
    spriteSheet.data = gItemIcon4x4Buffer;
    spriteSheet.size = 0x200;
    spriteSheet.tag = tilesTag;
    LoadSpriteSheet(&spriteSheet);

    spritePalette.data = GetItemIconPalette(itemId);
    spritePalette.tag = paletteTag;
    LoadSpritePalette(&spritePalette);

    spriteTemplate = Alloc(sizeof(*spriteTemplate));
    CpuCopy16(&gItemIconSpriteTemplate, spriteTemplate, sizeof(*spriteTemplate));
    spriteTemplate->tileTag = tilesTag;
    spriteTemplate->paletteTag = paletteTag;
    spriteId = CreateSprite(spriteTemplate, 0, 0, 0);

    FreeItemIconTemporaryBuffers();
    Free(spriteTemplate);

    return spriteId;
}

u8 AddCustomItemIconSprite(const struct SpriteTemplate * origTemplate, u16 tilesTag, u16 paletteTag, u16 itemId)
{
    struct SpriteTemplate template;
    struct SpriteSheet spriteSheet;
    struct SpritePalette spritePalette;
    u8 spriteId;

    if (!AllocItemIconTemporaryBuffers())
        return MAX_SPRITES;

    DecompressDataWithHeaderWram(GetItemIconPic(itemId), gItemIconDecompressionBuffer);
    CopyItemIconPicTo4x4Buffer(gItemIconDecompressionBuffer, gItemIcon4x4Buffer);
    spriteSheet.data = gItemIcon4x4Buffer;
    spriteSheet.size = 0x200;
    spriteSheet.tag = tilesTag;
    LoadSpriteSheet(&spriteSheet);

    spritePalette.data = GetItemIconPalette(itemId);
    spritePalette.tag = paletteTag;
    LoadSpritePalette(&spritePalette);

    CpuCopy16(origTemplate, &template, sizeof(struct SpriteTemplate));
    template.tileTag = tilesTag;
    template.paletteTag = paletteTag;
    spriteId = CreateSprite(&template, 0, 0, 0);

    FreeItemIconTemporaryBuffers();

    return spriteId;
}

const void *GetItemIconPic(u16 itemId)
{
    if (itemId == ITEM_FIELD_ARROW)
        return gItemIcon_ReturnToFieldArrow; // Use last icon, the "return to field" arrow
    if (itemId >= ITEMS_COUNT)
        return gItemsInfo[0].iconPic;
    if (gItemsInfo[itemId].pocket == POCKET_TM_HM)
    {
        if (GetItemTMHMIndex(itemId) > NUM_TECHNICAL_MACHINES)
            return gItemIcon_HM;
        return gItemIcon_HM;
    }

    return gItemsInfo[itemId].iconPic;
}

const void *GetItemIconPalette(u16 itemId)
{
    if (itemId == ITEM_FIELD_ARROW)
        return gItemIconPalette_ReturnToFieldArrow;
    if (itemId >= ITEMS_COUNT)
        return gItemsInfo[0].iconPalette;
    if (gItemsInfo[itemId].pocket == POCKET_TM_HM)
        return gTypesInfo[GetMoveType(GetItemTMHMMoveId(itemId))].paletteTMHM;

    return gItemsInfo[itemId].iconPalette;
}
