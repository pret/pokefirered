#ifndef GUARD_FIELD_SCREEN_EFFECT_H
#define GUARD_FIELD_SCREEN_EFFECT_H

#include "global.h"

void AnimateFlash(u8);
void FieldCB_SafariZoneRanOutOfBalls(void);
void DoOutwardBarnDoorWipe(void);
void Task_BarnDoorWipe(u8 taskId);
void FieldCB_RushInjuredPokemonToCenter(void);
void WriteFlashScanlineEffectBuffer(u8 flashLevel);

extern const s32 gMaxFlashLevel;

#endif // GUARD_FIELD_SCREEN_EFFECT_H
