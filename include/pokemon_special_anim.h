#ifndef GUARD_POKEMON_SPECIAL_ANIM_H
#define GUARD_POKEMON_SPECIAL_ANIM_H

#include "global.h"

void sub_811E5B8(u16, u16, u16, u16, u16, u16);
bool8 sub_811E680(void);
void GetMonLevelUpWindowStats(struct Pokemon *mon, u16 *currStats);
void DrawLevelUpWindowPg1(u16 windowId, u16 *statsBefore, u16 *statsAfter, u8 bgClr, u8 fgClr, u8 shadowClr);
void DrawLevelUpWindowPg2(u16 windowId, u16 *currStats, u8 bgClr, u8 fgClr, u8 shadowClr);

#endif // GUARD_POKEMON_SPECIAL_ANIM_H
