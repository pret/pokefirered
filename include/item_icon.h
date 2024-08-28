#ifndef GUARD_ITEM_MENU_ICONS
#define GUARD_ITEM_MENU_ICONS

extern u8 *gItemIconDecompressionBuffer;
extern u8 *gItemIcon4x4Buffer;

extern const struct SpriteTemplate gItemIconSpriteTemplate;

bool8 AllocItemIconTemporaryBuffers(void);
void FreeItemIconTemporaryBuffers(void);
void CopyItemIconPicTo4x4Buffer(const void *src, void *dest);
u8 AddItemIconSprite(u16 tilesTag, u16 paletteTag, u16 itemId);
u8 AddCustomItemIconSprite(const struct SpriteTemplate * origTemplate, u16 tilesTag, u16 paletteTag, u16 itemId);
const void *GetItemIconPic(u16 itemId);
const void *GetItemIconPalette(u16 itemId);

#endif // GUARD_ITEM_MENU_ICONS
