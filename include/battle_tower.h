#ifndef GUARD_BATTLE_TOWER_H
#define GUARD_BATTLE_TOWER_H

#include "global.h"

u16 sub_8164FCC(u8, u8);
void sub_80E7524(struct BattleTowerEReaderTrainer *);
void ValidateEReaderTrainer(void);
u8 GetBattleTowerTrainerFrontSpriteId(void);
u8 GetEreaderTrainerFrontSpriteId(void);
void CopyEReaderTrainerName5(u8 *dest);

#endif //GUARD_BATTLE_TOWER_H
