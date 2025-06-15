#ifndef GUARD_ITEM_MENU_ICONS_H
#define GUARD_ITEM_MENU_ICONS_H

extern const struct CompressedSpriteSheet gSpriteSheet_BagMale;
extern const struct CompressedSpriteSheet gSpriteSheet_BagFemale;
extern const struct SpritePalette gSpritePalette_Bag;

void AddBagVisualSprite(u8 bagPocketId);
void SetBagVisualPocketId(u8 bagPocketId);
void ShakeBagSprite(void);
void AddBagItemIconSprite(u16 itemId, u8 id);
void RemoveBagItemIconSprite(u8 id);
void CreateItemMenuSwapLine(void);
void SetItemMenuSwapLineInvisibility(bool8 invisible);
void UpdateItemMenuSwapLinePos(u16 y);

#endif // GUARD_ITEM_MENU_ICONS_H