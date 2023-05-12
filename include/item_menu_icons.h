#ifndef GUARD_ITEM_MENU_ICONS
#define GUARD_ITEM_MENU_ICONS

#include "global.h"

// Values for 2nd argument to GetItemIconGfxPtr
enum {
    ITEMICON_TILES,
    ITEMICON_PAL,
};

extern const struct CompressedSpriteSheet gSpriteSheet_BagMale;
extern const struct CompressedSpriteSheet gSpriteSheet_BagFemale;
extern const struct CompressedSpritePalette gSpritePalette_Bag;

extern const struct CompressedSpriteSheet gBagSwapSpriteSheet;
extern const struct CompressedSpritePalette gBagSwapSpritePalette;

void ResetItemMenuIconState(void);
void CreateSwapLine(void);
void DestroyItemMenuIcon(bool8 a0);
void CreateItemMenuIcon(u16 itemId, bool8 a0);
void CopyItemIconPicTo4x4Buffer(const void *src, void *dest);
u8 AddItemIconObject(u16 tilesTag, u16 paletteTag, u16 itemId);
u8 AddItemIconObjectWithCustomObjectTemplate(const struct SpriteTemplate * origTemplate, u16 tilesTag, u16 paletteTag, u16 itemId);
void CreateBerryPouchItemIcon(u16 itemId, u8 idx);
void UpdateSwapLinePos(s16 x, u16 y);
void SetSwapLineInvisibility(bool8 invisible);
void SetBagVisualPocketId(u8);
void ShakeBagSprite(void);
const u32 *GetItemIconGfxPtr(u16 itemId, u8 ptrId);
void CreateBagSprite(u8 animNum);

#endif // GUARD_ITEM_MENU_ICONS
