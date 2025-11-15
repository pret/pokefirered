#ifndef GUARD_FIELD_SCREEN_EFFECT_H
#define GUARD_FIELD_SCREEN_EFFECT_H

#include "global.h"

void AnimateFlash(u8);
void FieldCB_SafariZoneRanOutOfBalls(void);
void DoOutwardBarnDoorWipe(void);
void Task_BarnDoorWipe(u8 taskId);
void FieldCB_RushInjuredPokemonToCenter(void);
void WriteFlashScanlineEffectBuffer(u8 flashLevel);
void DoWarp(void);
void DoDiveWarp(void);
void DoDoorWarp(void);
void DoFallWarp(void);
void DoTeleportWarp(void);
void DoTeleport2Warp(void);
void DoStairWarp(u16 metatileBehavior, u16 delay);
void DoEscalatorWarp(u8 a0);
void DoLavaridgeGymB1FWarp(void);
void DoLavaridgeGym1FWarp(void);
void DoTeleportWarp(void);
void DoUnionRoomWarp(void);

extern const s32 gMaxFlashLevel;

#endif // GUARD_FIELD_SCREEN_EFFECT_H
