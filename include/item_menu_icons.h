#ifndef GUARD_ITEM_MENU_ICONS
#define GUARD_ITEM_MENU_ICONS

#include "global.h"

extern void * gUnknown_2039884;

extern const struct CompressedSpriteSheet gUnknown_83D41E4;
extern const struct CompressedSpriteSheet gUnknown_83D41EC;
extern const struct CompressedSpritePalette gUnknown_83D41F4;

extern const struct CompressedSpriteSheet gBagSwapSpriteSheet;
extern const struct CompressedSpritePalette gBagSwapSpritePalette;

void ResetItemMenuIconState(void);
void sub_80985E4(void);
void DestroyItemMenuIcon(bool8 a0);
void CreateItemMenuIcon(u16 itemId, bool8 a0);
void CopyItemIconPicTo4x4Buffer(const void *src, void *dest);
u8 AddItemIconObject(u16 tilesTag, u16 paletteTag, u16 itemId);
u8 AddItemIconObjectWithCustomObjectTemplate(const struct SpriteTemplate * origTemplate, u16 tilesTag, u16 paletteTag, u16 itemId);
void sub_80989A0(u16 itemId, u8 idx);
void sub_80986A8(s16 x, u16 y);
void sub_8098660(u8);
void sub_8098528(u8);
void sub_8098580(void);
const void * sub_8098974(u16 itemId, u8 ptrId);
void sub_80984FC(u8 animNum);

#endif // GUARD_ITEM_MENU_ICONS
