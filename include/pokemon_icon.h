#ifndef GUARD_POKEMON_ICON_H
#define GUARD_POKEMON_ICON_H

#include "global.h"

// extern const u8 *const gMonIconTable[];
extern const struct SpritePalette gMonIconPaletteTable[];
extern const u16 gMonIconPalettes[][16];
// extern const u8 gMonIconPaletteIndices[];

const u8 *GetMonIconPtr(u16 speciesId, u32 personality);
const u8 *GetMonIconPtrIsEgg(u16 species, u32 personality, bool32 isEgg);
const u8 *GetMonIconTiles(u16 iconSpecies, bool32 extra);
const u8 *GetMonIconTilesIsEgg(u16 species, u32 personality, bool32 isEgg);
const u16 *GetValidMonIconPalettePtr(u16 speciesId);
void LoadMonIconPalettes(void);
void FreeMonIconPalettes(void);
u16 GetIconSpeciesNoPersonality(u16);
u8 CreateMonIconNoPersonality(u16 species, SpriteCallback callback, s16 x, s16 y, u8 subpriority);
void FreeAndDestroyMonIconSprite(struct Sprite *);
u16 GetUnownLetterByPersonality(u32 personality);
void SpriteCB_MonIcon(struct Sprite *);
u8 CreateMonIcon(u16 species, SpriteCallback callback, s16 x, s16 y, u8 subpriority, u32 personality);
u8 CreateMonIconIsEgg(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority, u32 personality, bool32 isEgg);
u8 UpdateMonIconFrame(struct Sprite *sprite);
void LoadMonIconPalette(u16 iconId);
void LoadMonIconPalettePersonality(u16 species, u32 personality);
void FreeMonIconPalette(u16 iconId);
void SetPartyHPBarSprite(struct Sprite *sprite, u8 animNum);
u8 GetMonIconPaletteIndexFromSpecies(u16 species);
u16 GetIconSpecies(u16 species, u32 personality);
void TryLoadAllMonIconPalettesAtOffset(u16 offset);
u8 GetValidMonIconPalIndex(u16 species);
void SafeLoadMonIconPalette(u16 species);
void SafeFreeMonIconPalette(u16 species);

#endif // GUARD_POKEMON_ICON_H
