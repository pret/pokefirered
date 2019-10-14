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
void sub_809707C(void);
void FreeMonIconPalettes(void);
u16 sub_8096FD4(u16);
u8 sub_8096ECC(u16, void (*)(struct Sprite *), s16, s16, u8, bool32);
void sub_8097070(struct Sprite *);
u16 GetUnownLetterByPersonality(u32 personality);
u8 UpdateMonIconFrame(struct Sprite *sprite);
void sub_80970E0(u16 iconId);
void sub_8097168(u16 iconId);

#endif // GUARD_POKEMON_ICON_H
