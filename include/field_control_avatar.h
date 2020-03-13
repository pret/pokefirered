#ifndef GUARD_FIELD_CONTROL_AVATAR_H
#define GUARD_FIELD_CONTROL_AVATAR_H

#include "global.h"

extern u32 gUnknown_3005078;

void RestartWildEncounterImmunitySteps(void);
void ClearPoisonStepCounter(void);
void SetCableClubWarp(void);
void sub_806DE28(struct ObjectEvent *);
void dive_warp(struct MapPosition * pos, u16 behavior);


#endif //GUARD_FIELD_CONTROL_AVATAR_H
