#ifndef GUARD_POKEMON_ICON_H
#define GUARD_POKEMON_ICON_H

#include "global.h"

const u8 *GetMonIconPtr(u16 speciesId, u32 personality, u32 frameNo);
const u16 *GetValidMonIconPalettePtr(u16 speciesId);
u16 sub_80D2E84(u16 speciesId);
void sub_80D2F68(u16 iconId);
u8 sub_80D2D78(u16 iconId, void callback(struct Sprite *), u16 x, u16 y, u16 a4, u8 a5);
void sub_80D2FF0(u16 iconId);
void sub_80D2EF8(struct Sprite *sprite);
void LoadMonIconPalettes(void);
void FreeMonIconPalettes(void);
u16 sub_8096FD4(u16);
u8 sub_8096ECC(u16, void (*)(struct Sprite *), s16, s16, u8, bool32);
void sub_8097070(struct Sprite *);
u16 GetUnownLetterByPersonality(u32 personality);
void sub_809718C(void);
u8 CreateMonIcon(u16 species, void (*callback)(void), s16 x, s16 y, u8 subpriority, u32 personality, bool32 extra);
u8 UpdateMonIconFrame(struct Sprite *sprite);

#endif // GUARD_POKEMON_ICON_H
