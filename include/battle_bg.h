#ifndef GUARD_BATTLE_BG_H
#define GUARD_BATTLE_BG_H

#include "bg.h"

extern const struct BgTemplate gBattleBgTemplates[];

void sub_800F34C(void);
void DrawBattleEntryBackground(void);
void sub_800F6FC(u8 taskId);
void LoadBattleMenuWindowGfx(void);
void LoadBattleTextboxAndBackground(void);
void sub_800F324(void);

#endif // GUARD_BATTLE_BG_H
